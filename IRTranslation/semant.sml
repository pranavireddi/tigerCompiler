structure Semant =

struct
    structure A = Absyn
    structure T = Types
    structure S = Symbol
    structure Err = ErrorMsg
    structure Tr = Translate
    structure Tmp = Temp

    (* #NOTE: can find in env.sml *)
    type venv = Env.enventry S.table
    type tenv = T.ty S.table

    type expty = {exp: Translate.exp, ty: T.ty}

    val loopDepth = ref 0

    (* #NOTE: need some helper functions to check if types are matching and stuff *)

    fun checkInt(T.INT, pos) = true
    | checkInt (_, pos) = (Err.error pos "error: integer required"; false)

    fun checkUnitOrBottom (T.UNIT, pos) = true
    | checkUnitOrBottom (T.BOTTOM, pos) = true
    | checkUnitOrBottom (_, pos) = (Err.error pos "error: unit or bottom type required"; false)

    (* #NOTE: needed to deal with mutual recursion where we might need to resolve types to get to the base types *)
    fun reduceToActualType (tenv, ty) : T.ty =
    let
        fun alrSeenBefore (sym, seen) =
        List.exists (fn s => S.name s = S.name sym) seen

        fun reduce(t : T.ty, seen : S.symbol list) : T.ty =
        case t of
            T.NAME (sym, tyRef) =>
                if alrSeenBefore (sym, seen) then
                    T.BOTTOM
                else
                    (case !tyRef of
                        SOME t' => reduce(t', sym :: seen)
                        | NONE =>
                            (case Env.findMatchType (tenv, sym) of
                                SOME t'' => reduce(t'', sym :: seen)
                                | NONE => T.BOTTOM))
            | _ => t
    in
        reduce(ty, [])
    end

    fun checkEqual (tenv, t1, t2, pos) = 
    let 
        val t1Val = reduceToActualType(tenv, t1)
        val t2Val = reduceToActualType(tenv, t2)
    in
        (case (t1Val, t2Val) of
            (T.INT, T.INT) => true
            | (T.STRING, T.STRING) => true
            | (T.NIL, T.RECORD _) => true
            | (T.RECORD _, T.NIL) => true
            | (T.UNIT, T.UNIT) => true
            | (T.BOTTOM, _) => true
            | (_, T.BOTTOM) => true
            | (T.RECORD(_, u1), T.RECORD(_, u2)) =>
                if u1 = u2 then true else (Err.error pos "error: record types do not match"; false)
            | (T.ARRAY(_, u1), T.ARRAY(_, u2)) =>
                if u1 = u2 then true else (Err.error pos "error: array types do not match"; false)
            | _ => (Err.error pos "error: mismatched types"; false))
    end

    (* #NOTE: mainly for le, lt, ge, gt *)
    fun checkComparable (t1, t2, pos) =
    (case (t1, t2) of
        (T.INT, T.INT) => true
        | (T.STRING, T.STRING) => true
        | _ => (Err.error pos "error: types not comparable"; false))
    
    fun checkAssignable (lhsTy, rhsTy, pos, tenv) =
    let
        val lhs = reduceToActualType(tenv, lhsTy)
        val rhs = reduceToActualType(tenv, rhsTy)
    in
        case (lhs, rhs) of
            (T.INT,    T.INT)    => true
            | (T.STRING, T.STRING) => true
            | (T.UNIT,   T.UNIT)   => true

            (* #NOTE: this rule is specified in chapter!  *)
            | (T.RECORD _, T.NIL)  => true

            | (T.RECORD(_, u1), T.RECORD(_, u2)) =>
                if u1 = u2 then true else (Err.error pos "error: record types do not match"; false)
            | (T.ARRAY(_, u1), T.ARRAY(_, u2)) =>
                if u1 = u2 then true else (Err.error pos "error: array types do not match"; false)

            | (T.BOTTOM, _) => true
            | (_, T.BOTTOM) => true

            | _ => (Err.error pos "error: cannot assign expression to variable of this type"; false)
    end

    fun checkIfBranches (tenv, t1, t2, pos) =
    let
        val t1Val = reduceToActualType(tenv, t1)
        val t2Val = reduceToActualType(tenv, t2)
    in
        case (t1Val, t2Val) of
            (T.INT,    T.INT)    => true
            | (T.STRING, T.STRING) => true
            | (T.UNIT,   T.UNIT)   => true

            (* #NOTE: this rule is specified in chapter!  *)
            | (T.RECORD _, T.NIL)  => true
            | (T.NIL, T.RECORD _) => true

            | (T.RECORD(_, u1), T.RECORD(_, u2)) =>
                if u1 = u2 then true else (Err.error pos "error: record types do not match"; false)
            | (T.ARRAY(_, u1), T.ARRAY(_, u2)) =>
                if u1 = u2 then true else (Err.error pos "error: array types do not match"; false)

            | (T.BOTTOM, _) => true
            | (_, T.BOTTOM) => true

            | _ => (Err.error pos "error: then and else branches must have the same type"; false)
    end

    (* #NOTE: need to convert absyn ops to tree ops bc translate module requires tree ops bruhh *)
    fun translateBinOp oper =
        case oper of
            A.PlusOp   => Tree.PLUS
            | A.MinusOp  => Tree.MINUS
            | A.TimesOp  => Tree.MUL
            | A.DivideOp => Tree.DIV
            | _ => raise Fail "not accepted binary arithmetic operator"

    fun translateRelOp oper =
        case oper of
            A.EqOp  => Tree.EQ
            | A.NeqOp => Tree.NE
            | A.LtOp  => Tree.LT
            | A.LeOp  => Tree.LE
            | A.GtOp  => Tree.GT
            | A.GeOp  => Tree.GE
            | _ => raise Fail "not accepted relational operator"

    (* #NOTE: from ch we need like 4 recursive functions in trexp:
    - transVar, 
    - ransExp, 
    - transDec: this is where we update like the value env lol (idk why this was not obvious to me before), 
    - transTy: where we wanna update type env lmao *)

    (* 
    transVar: venv * tenv * A.var -> expty
    transExp: venv * tenv * A.exp -> expty
    transDec: venv * tenv * A.dec -> {venv: venv, tenv: tenv, exp: Translate.exp}
    transTy: tenv * A.ty -> T.ty 

    type expty = {exp: Translate.exp, ty: Types.ty}
    *)

    (* #NOTE: need to make sure breakLabel integrated everywhere correctly. *)
    fun transExp (venv, tenv, exp, level: Translate.level, breakLabel : Temp.label option) : expty =
    let
        fun trexp (expVal : A.exp, level: Translate.level, breakLabel : Temp.label option) : expty =    
            case expVal of 
                (* NOTE: base cases for literals and variables which sholud like always have these types *)
                A.VarExp v => transVar(venv, tenv, v, level, breakLabel)
                | A.IntExp(intVal) => {exp=Tr.intExp intVal, ty=T.INT} 
                | A.StringExp(stringVal, pos) => {exp=Tr.stringExp stringVal, ty=T.STRING}
                | A.NilExp => {exp=Tr.nilExp(), ty=T.NIL}

            (* #NOTE: trying to take care of arithmetic expressions here! *)
                | A.OpExp {left, oper, right, pos} =>
                    let
                        val {exp=leftExp, ty=lt} = trexp (left, level, breakLabel)
                        val {exp=rightExp, ty=rt} = trexp (right, level, breakLabel)
                    in
                        if lt = T.BOTTOM orelse rt = T.BOTTOM then
                            {exp = Tr.nilExp(), ty = T.BOTTOM}
                        else
                            case oper of
                                A.PlusOp =>
                                    if lt = T.INT andalso rt = T.INT then
                                        {exp=Tr.binOpExp(translateBinOp oper, leftExp, rightExp), ty=T.INT}
                                    else
                                        (Err.error pos "integer required";
                                        {exp=Tr.nilExp(), ty=T.BOTTOM})

                                | A.MinusOp =>
                                        if lt = T.INT andalso rt = T.INT then
                                            {exp=Tr.binOpExp(translateBinOp oper, leftExp, rightExp), ty=T.INT}
                                        else
                                            (Err.error pos "integer required";
                                            {exp=Tr.nilExp(), ty=T.BOTTOM})

                                | A.TimesOp =>
                                        if lt = T.INT andalso rt = T.INT then
                                            {exp=Tr.binOpExp(translateBinOp oper, leftExp, rightExp), ty=T.INT}
                                        else
                                            (Err.error pos "integer required";
                                            {exp=Tr.nilExp(), ty=T.BOTTOM})

                                | A.DivideOp =>
                                        if lt = T.INT andalso rt = T.INT then
                                            {exp=Tr.binOpExp(translateBinOp oper, leftExp, rightExp), ty=T.INT}
                                        else
                                            (Err.error pos "integer required";
                                            {exp=Tr.nilExp(), ty=T.BOTTOM})
                                (* #TODO: need to maybe add in handling for string comparisons here and also make sure translate module supports this *)
                                | A.EqOp =>
                                        if checkEqual(tenv, lt, rt, pos) then
                                            if lt = T.STRING then 
                                                {exp=Tr.stringEq(translateRelOp oper, leftExp, rightExp), ty=T.INT}
                                            else
                                                {exp=Tr.relOpExp(translateRelOp oper, leftExp, rightExp), ty=T.INT}
                                        else
                                            {exp=Tr.nilExp(), ty=T.BOTTOM}

                                | A.NeqOp =>
                                        if checkEqual(tenv, lt, rt, pos) then
                                            if lt = T.STRING then 
                                                {exp=Tr.stringEq(translateRelOp oper, leftExp, rightExp), ty=T.INT}
                                            else
                                                {exp=Tr.relOpExp(translateRelOp oper, leftExp, rightExp), ty=T.INT}
                                        else
                                            {exp=Tr.nilExp(), ty=T.BOTTOM}

                                | A.LtOp =>
                                        if checkComparable(lt, rt, pos) then
                                            {exp=Tr.relOpExp(translateRelOp oper, leftExp, rightExp), ty=T.INT}
                                        else
                                            {exp=Tr.nilExp(), ty=T.BOTTOM}

                                | A.LeOp =>
                                        if checkComparable(lt, rt, pos) then
                                            {exp=Tr.relOpExp(translateRelOp oper, leftExp, rightExp), ty=T.INT}
                                        else
                                            {exp=Tr.nilExp(), ty=T.BOTTOM}

                                | A.GtOp =>
                                        if checkComparable(lt, rt, pos) then
                                            {exp=Tr.relOpExp(translateRelOp oper, leftExp, rightExp), ty=T.INT}
                                        else
                                            {exp=Tr.nilExp(), ty=T.BOTTOM}

                                | A.GeOp =>
                                        if checkComparable(lt, rt, pos) then
                                            {exp=Tr.relOpExp(translateRelOp oper, leftExp, rightExp), ty=T.INT}
                                        else
                                            {exp=Tr.nilExp(), ty=T.BOTTOM}
                    end

                (* #NOTE: trying to do boolean exp here? *)
                |  A.IfExp {test, then', else', pos} =>
                    let
                        val {exp=testExp, ty=testTy} = trexp (test, level, breakLabel)
                    in
                        (* #NOTE: so like i think we need the condition to eval to an int. also can have if/then w/o an else bruh*)
                        if testTy = T.BOTTOM then
                            {exp=Tr.nilExp(), ty=T.BOTTOM}
                        else if not (checkInt(testTy, pos)) then
                            {exp=Tr.nilExp(), ty=T.BOTTOM}
                        else
                            (case else' of
                                NONE =>
                                    let val {exp=thenExp, ty=thenTy} = trexp (then', level, breakLabel)
                                    in
                                        if thenTy = T.BOTTOM then {exp=Tr.nilExp(), ty=T.BOTTOM}
                                        else if checkEqual(tenv, thenTy, T.UNIT, pos) then {exp=Tr.ifExp(testExp, thenExp, NONE), ty=T.UNIT}
                                        else {exp=Tr.nilExp(), ty=T.BOTTOM}
                                    end

                                | SOME elseExp =>
                                    let
                                        val {exp = thenExp, ty = thenTy} = trexp (then', level, breakLabel)
                                        val {exp = elseTrExp, ty = elseTy} = trexp (elseExp, level, breakLabel)
                                    in
                                    (* #NOTE: j need to make sure that return types for then and else match right yeah *)
                                        if reduceToActualType (tenv, thenTy) = T.BOTTOM
                                           orelse reduceToActualType (tenv, elseTy) = T.BOTTOM then
                                            {exp = Tr.nilExp(), ty = T.BOTTOM}
                                        else if checkIfBranches (tenv, thenTy, elseTy, pos) then
                                            {exp = Tr.ifExp (testExp, thenExp, SOME elseTrExp), ty = thenTy}
                                        else
                                            {exp = Tr.nilExp(), ty = T.BOTTOM}
                                    end)
                    end

                (* #NOTE: trying to do while exp here. similar to if but a bit simpler imo. need doneLabel to do loop breakig correctly for these two *)
                | A.WhileExp {test, body, pos} =>
                    let
                        val {exp=testExp, ty=testTy} = trexp(test, level, breakLabel)
                        val doneLabel = Tmp.newLabel()
                        
                    in
                        (* #NOTE: i think while body should not have type right? *)
                        if testTy = T.BOTTOM then {exp=Tr.nilExp(), ty=T.BOTTOM}
                        else if not (checkInt(testTy, pos)) then {exp=Tr.nilExp(), ty=T.BOTTOM}
                        else
                            let
                                val _ = loopDepth := !loopDepth + 1
                                val {exp=bodyExp, ty=bodyTy} = trexp (body, level, SOME doneLabel)
                                val _ = loopDepth := !loopDepth - 1
                            in
                                if bodyTy = T.BOTTOM then {exp=Tr.nilExp(), ty=T.BOTTOM}
                                else if not (checkUnitOrBottom(bodyTy, pos)) then
                                    {exp=Tr.nilExp(), ty=T.BOTTOM}
                                    (* #NOTE: i think for loop body should not have type right? *)
                                else
                                    {exp=Tr.whileExp(testExp, bodyExp, doneLabel), ty=T.UNIT}
                            end
                    end

                (* #NOTE: trying to do for exp here. little unclear what to check for the loop body besides bounds being int lol*)
                | A.ForExp {var, escape, lo, hi, body, pos} =>
                    let
                        val {exp = loExp, ty = loTy} = trexp (lo, level, breakLabel)
                        val {exp = hiExp, ty = hiTy} = trexp (hi, level, breakLabel)

                        val acc = Tr.allocLocal level (!escape)
                        val venvNew = Env.addReadOnlyVarVal (venv, var, T.INT, acc)
                        val doneLabel = Tmp.newLabel ()
                        val varTrExp = Tr.simpleVar (acc, level)

                        val _ = loopDepth := !loopDepth + 1
                        val {exp = bodyExp, ty = bodyTy} = transExp (venvNew, tenv, body, level, SOME doneLabel)
                        val _ = loopDepth := !loopDepth - 1
                    in
                        if reduceToActualType (tenv, loTy) = T.BOTTOM orelse reduceToActualType (tenv, hiTy) = T.BOTTOM then
                            {exp = Tr.nilExp (), ty = T.BOTTOM}
                        else if not (checkInt (loTy, pos)) then
                            {exp = Tr.nilExp (), ty = T.BOTTOM}
                        else if not (checkInt (hiTy, pos)) then
                            {exp = Tr.nilExp (), ty = T.BOTTOM}
                        else if not (checkUnitOrBottom (bodyTy, pos)) then
                            {exp = Tr.nilExp (), ty = T.BOTTOM}
                        else
                            {exp = Tr.forExp (varTrExp, loExp, hiExp, bodyExp, doneLabel), ty = T.UNIT}
                    end

                | A.RecordExp {fields, typ, pos} =>
                    let
                        fun checkSuppliedField (name, exp, pos) =
                            let
                                val {exp = fexp, ty = fty} = trexp (exp, level, breakLabel)
                            in
                                (name, fexp, fty, pos)
                            end

                        val supplied = List.map checkSuppliedField fields

                        val recordTy =
                            case Env.findMatchType (tenv, typ) of
                                SOME t => reduceToActualType (tenv, t)
                              | NONE => (Err.error pos "Error: undefined record type"; T.BOTTOM)

                        fun checkFields (declfields, suppliedFields) =
                            let
                                fun loop ([], [], _) = true
                                  | loop ((declSym, declTy) :: declRest, (suppSym, _, suppTy, suppPos) :: suppRest, idx) =
                                        if S.name declSym <> S.name suppSym then
                                            (Err.error suppPos "Error: record field name doesn't match declared field name"; false)
                                        else if checkAssignable (declTy, suppTy, suppPos, tenv) then
                                            loop (declRest, suppRest, idx + 1)
                                        else
                                            false
                                  | loop _ = (Err.error pos "Error: record field length doesn't match declared fields"; false)
                            in
                                loop (declfields, suppliedFields, 0)
                            end

                        val translatedFieldExps = List.map (fn (_, fexp, _, _) => fexp) supplied
                    in
                        case recordTy of
                            T.RECORD (declfields, _) =>
                                if checkFields (declfields, supplied) then
                                    {exp = Tr.recordExp translatedFieldExps, ty = recordTy}
                                else
                                    {exp = Tr.nilExp (), ty = T.BOTTOM}
                          | T.BOTTOM => {exp = Tr.nilExp (), ty = T.BOTTOM}
                          | _ => (Err.error pos "Error: type name for record does not refer to a record type";
                                  {exp = Tr.nilExp (), ty = T.BOTTOM})
                    end
                
                | A.ArrayExp {typ, size, init, pos} => 
                    let
                        val {exp=initExp, ty=initTy} = trexp(init, level, breakLabel)
                        val {exp=sizeExp, ty=sizeTy} = trexp(size, level, breakLabel)

                        val arrayTy =  case Env.findMatchType(tenv, typ) of 
                                        NONE    => (Err.error pos "Error: undefined array type"; T.BOTTOM)
                                      | SOME t  => (reduceToActualType(tenv, t))
                            
                    in
                        if initTy = T.BOTTOM orelse sizeTy = T.BOTTOM then {exp = Tr.nilExp(), ty = T.BOTTOM}
                        else if not (checkInt(sizeTy, pos)) then {exp = Tr.nilExp(), ty = T.BOTTOM}
                        else
                            case arrayTy of 
                                T.ARRAY (ty, unique) => 
                                    if checkAssignable(ty, initTy, pos, tenv) then {exp = Tr.arrayExp(sizeExp, initExp), ty = arrayTy}
                                    else {exp = Tr.nilExp(), ty = T.BOTTOM}
                              | T.BOTTOM    => {exp = Tr.nilExp(), ty = T.BOTTOM} 
                              | _           => (Err.error pos "Error: type name for array does not refer to an array type"; {exp = Tr.nilExp(), ty = T.BOTTOM})
                    end

                | A.AssignExp {var, exp, pos} =>
                    let
                        val {exp=varExp, ty=varTy} = transVar(venv, tenv, var, level, breakLabel)
                        val {exp=rhsExp, ty=expTy} = trexp(exp, level, breakLabel)

                        (* #NOTE: think j need to make sure that type of val matches intended type *)
                        val _ = checkAssignable(varTy, expTy, pos, tenv);
                        val _ =
                            case var of
                            A.SimpleVar(sym, _) =>
                                (case S.look(venv, sym) of
                                SOME (Env.VarEntry {readonly=true, ...}) =>
                                    Err.error pos ("error: loop variable is read-only: " ^ S.name sym)
                                | _ => ())
                            | _ => ()
                    in
                        {exp=Tr.assignExp(varExp, rhsExp), ty=T.UNIT}
                    end
                
                (* #NOTE: need to translate exps here bc translate module only takes in tree.exps *)
                | A.SeqExp exps =>
                    let
                        fun transSeq [] = {translated = [], ty = T.UNIT}
                        | transSeq [(exp, _)] =
                                let
                                    val {exp = trExp, ty = tyExp} = trexp(exp, level, breakLabel)
                                in
                                    {translated = [trExp], ty = tyExp}
                                end
                        | transSeq ((exp, _) :: rest) =
                                let
                                    val {exp = trExp, ...} = trexp(exp, level, breakLabel)
                                    val {translated = restTranslated, ty = restTy} = transSeq rest
                                in
                                    {translated = trExp :: restTranslated, ty = restTy}
                                end

                        val {translated, ty} = transSeq exps
                    in
                        {exp = Tr.seqExp translated, ty = ty}
                    end

                | A.LetExp{decs, body, pos} => 
                    let 
                        val {venv=venv_new, tenv=tenv_new, exp=decs_exp} = transDec(venv, tenv, decs, level, breakLabel)
                        val {exp=body_exp, ty=body_ty} = transExp(venv_new, tenv_new, body, level, breakLabel)
                    in 
                        {exp=Tr.seqExp([decs_exp, body_exp]), ty=body_ty}
                    end


                (* #TODO: not sure what needs to change here ugh *)
                | A.BreakExp pos =>
                    (* #NOTE: need to check if in loop first. then return type bottom *)
                    if !loopDepth <= 0 then
                        (Err.error pos "error: break not in a loop"; {exp = Tr.nilExp (), ty = T.BOTTOM})
                    else
                        (case breakLabel of
                            NONE => (Err.error pos "internal error: missing break label"; {exp = Tr.nilExp (), ty = T.BOTTOM})
                        | SOME labelVal => {exp = Tr.breakExp labelVal, ty = T.UNIT})

                | A.CallExp {func, args, pos} =>
                    (case Env.findMatchType(venv, func) of
                        SOME (Env.FunEntry {formals, result, level = newLevel, label}) =>
                            let
                                fun checkArgs ([], []) = ()
                                | checkArgs (fTy :: flist, a :: alist) =
                                        let
                                            val {ty = argTy, ...} = trexp(a, level, breakLabel)
                                        in
                                            checkAssignable(fTy, argTy, pos, tenv);
                                            checkArgs(flist, alist)
                                        end
                                | checkArgs _ =
                                        (Err.error pos "error: different numbers of args"; ())

                                val translatedArgs =
                                    map (fn a => #exp (trexp(a, level, breakLabel))) args
                            in
                                checkArgs(formals, args);
                                {exp = Tr.callExp(label, newLevel, level, translatedArgs), ty = result}
                            end
                    | _ =>
                            (Err.error pos "error: not a function";
                            {exp = Tr.nilExp(), ty = T.BOTTOM}))
            in
            trexp (exp, level, breakLabel)
            end
            
    and transVar(venv, tenv, var, level: Translate.level, breakLabel : Temp.label option) : expty =
        let fun trvar(var: A.var, level: Translate.level, breakLabel : Temp.label option) : expty =
            case var of

                A.SimpleVar(sym, pos) =>
                    (case Env.findMatchType(venv, sym) of

                        SOME (Env.VarEntry {typeVal, readonly, access}) =>
                            {exp = Tr.simpleVar(access, level), ty = typeVal}
                        
                        (* #TODO: make sure that env changes are here *)
                        (* #NOTE: enventry can also have function stuff and we don't rlly want that *)
                        | SOME (Env.FunEntry funEntry) =>
                            (Err.error pos "error: found a function"; {exp = Tr.nilExp(), ty = T.BOTTOM})
                        | NONE =>
                            (Err.error pos "error: undefined variable"; {exp = Tr.nilExp(), ty = T.BOTTOM}))

                (* #NOTE: need to check main variable type, go thru fields and check types?  *)
                | A.FieldVar (var, sym, pos) =>
                    let
                        val {exp = baseExp, ty = baseType} = trvar (var, level, breakLabel)
                        val reducedBaseType = reduceToActualType (tenv, baseType)

                        (* EDIT: compute the field index so Translate.fieldVar has the offset information it needs. *)
                        fun findField ([], _, _) = NONE
                          | findField ((fieldName, fieldType) :: rest, wantSym, idx) =
                                if fieldName = wantSym then
                                    SOME (idx, fieldType)
                                else
                                    findField (rest, wantSym, idx + 1)
                    in
                        if reducedBaseType = T.BOTTOM then
                            {exp = Tr.nilExp (), ty = T.BOTTOM}
                        else
                            (case reducedBaseType of
                                T.RECORD (fieldList, _) =>
                                    (case findField (fieldList, sym, 0) of
                                        SOME (index, fieldType) => {exp = Tr.fieldVar (baseExp, index), ty = fieldType}
                                      | NONE => (Err.error pos "error: field not found"; {exp = Tr.nilExp (), ty = T.BOTTOM}))
                              | _ => (Err.error pos "error: not a record"; {exp = Tr.nilExp (), ty = T.BOTTOM}))
                    end

                | A.SubscriptVar (var, exp, pos) => 
                    let 
                        val {exp=indexExp, ty=indexType} = transExp (venv, tenv, exp, level, breakLabel)
                        val {exp=arrExp, ty=arrType} = trvar(var, level, breakLabel)
                    in
                        if indexType = T.BOTTOM orelse arrType = T.BOTTOM then {exp=Tr.nilExp(), ty=T.BOTTOM}
                        else if not(checkInt(indexType,pos)) then {exp=Tr.nilExp(), ty=T.BOTTOM}
                        else
                            case reduceToActualType(tenv, arrType) of 
                                T.ARRAY (elTy, _) =>  {exp=Tr.subscriptVar(arrExp, indexExp), ty=elTy}
                                | _ => (Err.error pos "error: not an array"; {exp=Tr.nilExp(), ty=T.BOTTOM})
                    end
            in
            trvar (var, level, breakLabel)
            end


    (* #MYSTERIOUS: not sure but like think return should j be unit bc we're updating env stuff here. *)
    (* #UPDATE: actually need to return the venv and tenv with the new stuff we added lolol. *)
    (* #NOTE: so like there's two way to do this, depending on recursive or nonrecursive. 
        since we need non-recursive, i'm just gonna do that right now to avoid having to rewrite? *)

    and transDec(venv, tenv, decs, level: Translate.level, break) = 
        let fun
            
            (* #NOTE: we need like 2 cases here. 1) when there is an explicit type annotation (stored in typ) *)
            trdec(venv, tenv, A.VarDec({name, escape, typ, init, pos}), level: Translate.level) =
                let
                    val {exp=initIR, ty=initTypeVal, ...} = transExp(venv, tenv, init, level, break)
                    val reducedTypeVal = reduceToActualType(tenv, initTypeVal)
                    (* #NOTE: setting escape to true by default here. can use the escape param later when it's configured *)
                    val acc = Tr.allocLocal level (!escape)
                    val lhs = Tr.simpleVar(acc, level)
                in
                    case typ of
                        (* #NOTE: when we have an initial type given in the var dec *)
                        SOME(symbol, pos) =>

                            (case Env.findMatchType(tenv, symbol) of
                                SOME ty => (checkAssignable(reduceToActualType (tenv, ty), initTypeVal, pos, tenv);
                                           {venv=Env.addVarVal(venv, name, reduceToActualType (tenv, ty), acc), tenv=tenv, exp=Tr.assignExp(lhs, initIR)})
                              | NONE => (Err.error pos "type not recognized"; {venv=venv, tenv=tenv, exp=Tr.nilExp()})
                            )

                      (* #NOTE: case where there's no like initial specified type *)
                      | NONE => case reducedTypeVal of
                                T.NIL =>
                                    (Err.error pos "cannot infer type from nil";
                                        { venv = venv, tenv = tenv, exp=Tr.nilExp() })
                                | _ =>
                                    { venv = Env.addVarVal(venv, name, initTypeVal, acc), tenv = tenv, exp=Tr.assignExp(lhs, initIR)}
                end

            (* #NOTE: 1) wanna add all headers 2) helper func to add the bodies in 3) check for wrong loops 4) make sure no repeats *)
            | trdec(venv, tenv, A.TypeDec tydeclist, level: Translate.level) =
                let
                    fun enterHeader ({name, ty, pos}, tenv') =
                        Env.addTypeVal(tenv', name, T.NAME(name, ref NONE))

                    val temp_tenv = foldl enterHeader tenv tydeclist

                    (* #NOTE: filling in headers in appel's way. we can refactor to drew's way later here!? *)
                    fun fillHeadersUp ({name, ty, pos}, ()) =
                        (case Env.findMatchType(temp_tenv, name) of
                            SOME (T.NAME(_, emptyRef)) =>
                                emptyRef := SOME (transTy(temp_tenv, ty))
                            | _ =>
                                Err.error pos "internal error: missing type header")

                    val _ = List.app (fn f => fillHeadersUp(f, ())) tydeclist

                    fun checkDuplicates ({name, ty, pos}, seen) =
                        if List.exists (fn s => s = S.name name) seen
                        then (Err.error pos "error: duplicate type name in type declarations"; seen)
                        else S.name name :: seen

                    val _ = foldl checkDuplicates [] tydeclist

                    fun checkIllegalCycle ({name, ty, pos}, ()) =
                        let
                            fun follow (t, seenVals) =
                                case t of
                                T.NAME(sym, r) =>
                                    if List.exists (fn s => S.name s = S.name sym) seenVals then
                                        Err.error pos "error: illegal type cycle"
                                    else
                                        (case !r of
                                            SOME t' => follow(t', sym :: seenVals)
                                            | NONE => Err.error pos "error: illegal type cycle")
                                | T.RECORD _ => ()
                                | T.ARRAY _  => ()
                                | _ => ()
                        in
                            case Env.findMatchType(temp_tenv, name) of
                                SOME t => follow(t, [])
                                | NONE => ()
                        end

                    val _ = List.app (fn f => checkIllegalCycle(f, ())) tydeclist
                in
                { venv = venv, tenv = temp_tenv, exp=Tr.nilExp() } (* typedec is a no-op in terms of the IR tree *)
                end

            (* #NOTE: 1) wanna add all headers 2) helper func to add the bodies in 3) check for wrong loops 4) make sure no repeats *)
            | trdec(venv, tenv, A.FunctionDec fundeclist, level) =
                let
                    fun lookupType (sym, pos, what) =
                        case Env.findMatchType(tenv, sym) of
                        SOME t => t
                        | NONE => (Err.error pos (what ^ " type unrecognized: " ^ S.name sym); T.BOTTOM)

                    fun checkReturnType (retVal, retPos) =
                        lookupType(retVal, retPos, "Return")

                    fun checkParam {name, escape, typ, pos} =
                        { name = name, ty = lookupType(typ, pos, "Parameter"), escape = escape }

                    fun lookupTypeQuiet (sym, pos, what) =
                        case Env.findMatchType(tenv, sym) of
                        SOME t => t
                        | NONE => T.BOTTOM
                    
                    fun checkParamQuiet {name, escape, typ, pos} =
                        { name = name, ty = lookupTypeQuiet(typ, pos, "Parameter"), escape = escape }

                    fun checkDuplicateParams ({name, pos, ...} : Absyn.field, seen) =
                    let val n = S.name name
                    in
                        if List.exists (fn s => s = n) seen
                        then (Err.error pos "duplicate parameter in function declaration"; seen)
                        else n :: seen
                    end
                    
                    (* #TODO: need to store level and label here for the different function declarations *)
                    fun enterHeader ({name, params, body, pos, result}, venvAcc) =
                        let
                            val checkedParams = map checkParam params
                            val formals = map #ty checkedParams
                            val escapes = map #escape checkedParams
                            val resTy =
                                case result of
                                    SOME (retVal, retPos) => checkReturnType(retVal, retPos)
                                    | NONE => T.UNIT

                            val funLabel = Temp.newLabel()
                            val formalEscapes = true :: map (fn {escape, ...} => !escape) checkedParams
                            val funLevel = Tr.newLevel {parent=level, name=funLabel, formals=formalEscapes}
                        in
                            (* #NOTE: can add helper func but kinda lazy lol *)
                            S.enter(venvAcc, name, Env.FunEntry{formals=formals, result=resTy, level=funLevel, label=funLabel})
                        end

                    val venvNew = foldl enterHeader venv fundeclist

                    fun checkFun ({name, params, body, pos, result}) =
                        let
                        val (formals, resTy, funLevel) =
                            case Env.findMatchType(venvNew, name) of
                                SOME (Env.FunEntry {formals, result, level, label}) => (formals, result, level)
                                | _ =>(Err.error pos ("internal error: missing function header: " ^ S.name name);([], T.BOTTOM, level))

                        val _ = foldl checkDuplicateParams [] params
                        val paramsNew = map checkParamQuiet params
                        fun enterParam (({name, escape, ty}, access), venvAcc) = Env.addVarVal(venvAcc, name, ty, access)

                        val formalAccesses =
                            case Tr.formals funLevel of
                                _ :: rest => rest
                                | [] => []

                        val paramAccessPairs = ListPair.zip(paramsNew, formalAccesses)
                        val venvWithParams = foldl enterParam venvNew paramAccessPairs

                        (* #NOTE: can save prev loop depth if in while/for *)
                        val savedLoopDepth = !loopDepth

                        (* #NOTE: we need this bc a func can be in a for or while, and break should not be allowed in the func i think *)
                        val _ = loopDepth := 0
                        val {ty=bodyTy, exp=bodyExp} = transExp(venvWithParams, tenv, body, funLevel, NONE)
                        val _ = loopDepth := savedLoopDepth
                        val _ = checkAssignable(resTy, bodyTy, pos, tenv)
                        val _ = Tr.procEntryExit {body = bodyExp, level = funLevel}
                        in
                            ()
                        end

                    fun checkDuplicates ({name, params, body, pos, result}, seen) =
                        if List.exists (fn s => s = S.name name) seen
                        then (Err.error pos "error: duplicate function name in function declarations"; seen)
                        else S.name name :: seen

                    val _ = foldl checkDuplicates [] fundeclist
                    val _ = List.app (fn f => (checkFun f; ())) fundeclist
                in
                    { venv = venvNew, tenv = tenv, exp=Tr.nilExp() }
                end

            and folddec(dec, {venv, tenv, explst}) = 
                let 
                    val {venv=v', tenv=t', exp=e'} = trdec(venv, tenv, dec, level)
                in 
                    {venv=v', tenv=t', explst=e' :: explst}
                end 
        in
            let 
                val {venv=finalv, tenv=finalt, explst=finalel} = foldl folddec {venv=venv, tenv=tenv, explst=[]} decs
            in 
                { venv=finalv, tenv=finalt, exp=Tr.seqExp(rev finalel)}
            end
        end

    (* #NOTE: return conversion from ast type info to like our internal type stuff from the type dec above *)
    and transTy(tenv, ty) : T.ty =
        let fun trty (astType : A.ty) : T.ty =
            case astType of
                A.NameTy (sym, pos) =>
                    (case Env.findMatchType (tenv, sym) of
                        SOME ty => ty
                        | NONE =>
                            (Err.error pos "error cannot find matching type in symbol table"; T.BOTTOM))

                | A.RecordTy fields =>
                    let
                    fun trFieldList [] = []
                        | trFieldList ({name, escape, typ, pos} :: rest) =
                            let
                            val fieldTy =
                                    case Env.findMatchType (tenv, typ) of
                                        SOME t => t
                                    | NONE => (Err.error pos "error cannot find matching type in symbol table"; T.BOTTOM)
                            in
                            ((name, fieldTy) :: trFieldList rest)
                            end
                    in
                    T.RECORD (trFieldList fields, ref ())
                    end

                | A.ArrayTy (sym, pos) =>
                    let
                        val arrayEltTy =  case Env.findMatchType (tenv, sym) of
                                        SOME t => t
                                    | NONE => (Err.error pos "error cannot find matching type in symbol table"; T.BOTTOM)
                    in
                    T.ARRAY (arrayEltTy, ref ())
                    end
            in
            trty ty
            end

    (* #NOTE: from the book, it seems like transProg just is supposed to call transExp ? *)
    (* #NOTE: need to reurn a translate.fragList *)
    (* #TODO: make sure this is correct. *)
    fun transProg exp =
    let
        val tenv = Env.base_tenv
        val venv = Env.base_venv
        val mainLabel = Temp.newLabel ()
        val mainLevel = Tr.newLevel {parent = Tr.outermost, name = mainLabel, formals = []}
        val _ = Tr.resetFrags()
        val {exp = programExp, ty = programTy} = transExp (venv, tenv, exp, mainLevel, NONE)
        val _ = Tr.procEntryExit {body=programExp, level=mainLevel}
    in
        Tr.getResult ()
    end

end