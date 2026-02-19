Structure Semant =

struct
    structure A = Absyn
    structure T = Types
    structure S = Symbol
    structure Translate = struct type exp = unit end

    (* #NOTE: can find in env.sml *)
    type venv = Env.enventry S.table
    type tenv = T.ty S.table

    type expty = {exp: Translate.exp, ty: T.ty}

    (* #MYSTERIOUS: umm so like unclear what's up w error handling rn, did not look at that lmao. *)

    (* #NOTE: need some helper functions to check if types are matching and stuff *)

    fun checkInt(T.INT, pos) = ()
    | checkInt (_, pos) = Err.error pos "error: integer required"

    fun checkEqual (t1, t2, pos) = ()
    (case (t1, t2) of
        (T.INT, T.INT) => ()
        | (T.STRING, T.STRING) => ()
        | (T.NIL, T.RECORD _) => ()
        | (T.RECORD _, T.NIL) => ()
        | (T.NIL, T.ARRAY _) => ()
        | (T.ARRAY _, T.NIL) => ()
        | (T.UNIT, T.UNIT) => ()
        | _ => Err.error pos "error: mismatched types")

    fun checkUnit (T.UNIT, pos) = ()
    | checkUnit (_, pos) = Err.error pos "error: unit type required"

    (* #NOTE: mainly for le, lt, ge, gt *)
    fun checkComparable (t1, t2, pos) =
    (case (t1, t2) of
        (T.INT, T.INT) => ()
        | (T.STRING, T.STRING) => ()
        | _ => Err.error pos "error: types not comparable")

    fun checkIfBranches (t1, t2, pos) =
        (case (t1, t2) of
            (T.INT, T.INT) => ()
        | (T.STRING, T.STRING) => ()
        | (T.NIL, T.RECORD _) => ()
        | (T.RECORD _, T.NIL) => ()
        | _ => Err.error pos "error: then and else branches must have the same type")


    (* #NOTE: from the book, it seems like transProg just is supposed to call transExp ? *)
    fun transProg exp =
    let
        val tenv = Env.base_tenv
        val venv = Env.base_venv
    in
        transExp(venv, tenv, exp)
    end

    (* #NOTE: from ch we need like 4 recursive functions in trexp:
    - transVar, 
    - ransExp, 
    - transDec: this is where we update like the value env lol (idk why this was not obvious to me before), 
    - transTy: where we wanna update type env lmao *)

    fun transExp (venv, tenv, exp) : expty =
    let
        fun trexp (e : A.exp) : expty =    
            case e of 
                (* NOTE: base cases for literals and variables which sholud like always have these types *)
                A.VarExp v => trvar v
                | A.IntExp(intVal) => ({exp=(), ty=T.INT})
                | A.StringExp(stringVal, pos) => {exp=(), ty=T.STRING}
                | A.NilExp => {exp=(), ty=T.NIL}

            (* #NOTE: trying to take care of arithmetic expressions here! *)
                | A.OpExp {left, oper, right, pos} =>
                    let
                        val {ty=lt, ...} = trexp left
                        val {ty=rt, ...} = trexp right
                    in
                        (case oper of
                            A.PlusOp   => (checkInt(lt, pos); checkInt(rt, pos); {exp=(), ty=T.INT})
                        | A.MinusOp  => (checkInt(lt, pos); checkInt(rt, pos); {exp=(), ty=T.INT})
                        | A.TimesOp  => (checkInt(lt, pos); checkInt(rt, pos); {exp=(), ty=T.INT})
                        | A.DivideOp => (checkInt(lt, pos); checkInt(rt, pos); {exp=(), ty=T.INT})

                        (* #NOTE: dealing with comparison operators here *)

                        | A.EqOp     => (checkEqual(lt, rt, pos); {exp=(), ty=T.INT})
                        | A.NeqOp    => (checkEqual(lt, rt, pos); {exp=(), ty=T.INT})
                            
                        (* #NOTE: I think we sorta can compare strings and ints here *)
                        | A.LtOp     => (checkComparable(lt, rt, pos); {exp=(), ty=T.INT})
                        | A.LeOp     => (checkComparable(lt, rt, pos); {exp=(), ty=T.INT})
                        | A.GtOp     => (checkComparable(lt, rt, pos); {exp=(), ty=T.INT})
                        | A.GeOp     => (checkComparable(lt, rt, pos); {exp=(), ty=T.INT}))
                    end

                (* #NOTE: trying to do boolean exp here? *)
                |  A.IfExp {test, then', else', pos} =>
                    let
                        val {ty=testTy, ...} = trexp test
                        val {ty=thenTy, ...} = trexp then'
                    in
                        (* #NOTE: so like i think we need the condition to eval to an int. also can have if/then w/o an else bruh*)
                        checkInt(testTy, pos);
                        (case else' of
                            NONE =>
                                (checkEqual(thenTy, T.UNIT, pos);
                                {exp=(), ty=T.UNIT})
                        | SOME elseExp =>
                            let val {ty=elseTy, ...} = trexp elseExp in
                            (* #NOTE: j need to make sure that return types for then and else match right yeah *)
                            checkIfBranches(thenTy, elseTy, pos);
                            {exp=(), ty=thenTy}
                            end)
                    end

                (* #NOTE: trying to do while exp here. similar to if but a bit simpler imo *)
                | A.WhileExp {test, body, pos} =>
                    let
                        val {ty=testTy, ...} = trexp test
                        val {ty=bodyTy, ...} = trexp body
                    in
                        checkInt(testTy, pos);
                        (* #NOTE: i think while body should not have type right? *)
                        checkUnit(bodyTy, pos);
                        {exp=(), ty=T.UNIT}
                    end

                (* #NOTE: trying to do for exp here. little unclear what to check for the loop body besides bounds being int lol*)
                | A.ForExp {var, escape, lo, hi, body, pos} =>
                    let
                        val {ty=loTy, ...} = trexp lo
                        val {ty=hiTy, ...} = trexp hi
                        val {ty=bodyTy, ...} = trexp body
                    in
                        (* #NOTE: need lo/hi to be like ints for sure *)
                        checkInt(loTy, pos);
                        checkInt(hiTy, pos);
                        (* #NOTE: i think for loop body should not have type right? *)
                        checkUnit(bodyTy, pos);
                        {exp=(), ty=T.UNIT}
                    end

                (* #TODO: gonna do record exp and array exp here, should have similar logic. need to make sure contents are hte type of they type defined w the structure ?*)

                | A.AssignExp {var, exp, pos} =>
                    let
                        val {ty=varTy, ...} = trvar var
                        val {ty=expTy, ...} = trexp exp
                    in
                        (* #NOTE: think j need to make sure that type of val matches intended type *)
                        checkEqual(varTy, expTy, pos);
                        {exp=(), ty=T.UNIT}
                    end

                | A.SeqExp(exps) =>
                    (* #NOTE: think general idea is to make sure type works for every exp in exps. TODO: do we return last exp type idk ? 
                    also, for ref (exp, pos) *)
                    let
                    fun checkExps [] = T.UNIT
                        (* #NOTE: base case w last exp in exps, wanna return type of it, assuming no other type errors. *)
                        | checkExps [(exp, pos)] = #ty (trexp exp)
                        | checkExps ((exp, pos)::otherEx
                        0ps) = (trexp exp; checkExps otherExps)
                    in
                    {exp=(), ty=checkExps exps}
                    end

                (* #TODO: let exp needs to go here, prob after decs i think ? *)
                
                (* #TODO: break exp also needs to happen *)
                |A.BreakExp(pos) =>
                    (* #NOTE: need to check if in loop first. then return type bottom or unit, not sure ? *)
                    {exp = (), ty=T.BOTTOM}


                (* #TODO: also function call exp, prob after decs stuff too just in case *)
            in
            trexp exp
            end

    (* #TODO: actually might need to happen after decs and type stuff bc we need env info for this !! *)
    and transVar(venv, tenv, var) : expty =
        let fun trvar(var: A.var) : expty =
            case var of
                A.SimpleVar (sym, pos) => ()
                | A.FieldVar (var, sym, pos) => ()
                | A.SubscriptVar (var, exp, pos) => ()
            in
            trvar var
            end


    (* #MYSTERIOUS: not sure but like think return should j be unit bc we're updating env stuff here. *)
    (* #UPDATE: actually need to return the venv and tenv with the new stuff we added lolol. *)
    (* #NOTE: so like there's two way to do this, depending on recursive or nonrecursive. 
        since we need non-recursive, i'm just gonna do that right now to avoid having to rewrite? *)

    and transDec(venv, tenv, dec) : {venv: Env.enventry S.table, tenv: T.ty S.table} =
        let fun trdec(decVal : A.dec) =
            case decVal of
                (* #NOTE: need to implement function declarations, type declarations, and variable declarations here *)
                (* #TODO: ahh most confusing part imo! *)
                A.FunctionDec fundecs => 
                (* #NOTE: 1) wanna add all headers 2) helper func to add the bodies in 3) check for wrong loops 4) make sure no repeats *)

 
                | A.TypeDec tydecs => 
                (* #NOTE: 1) wanna add all headers 2) helper func to add the bodies in 3) check for wrong loops 4) make sure no repeats *)
                    let 

                        fun addHeaders({name, ty, pos}, tenv) = Env.addTypeVal(tenv, name, T.BOTTOM)
                        val temp_tenv = foldl addHeaders tenv tydecs

                        fun fillInBodies({name, ty, pos}, tenv) = Env.addTypeVal(tenv, name, transTy(temp_tenv, ty))
                        val new_tenv = foldl fillInBodies tenv tydecs

                        fun checkDuplicateVals({name, ty, pos}, seen) = 
                            if List.exists (fn s => S.name s = S.name name) seen then
                                Err.error pos "duplicate value found!"
                            else
                                (sym::seen)
                        val _ = foldl checkDuplicateVals [] tydecs;

                        (* #NOTE: j wanna make sure that we don't have like loops w types, only allowed in arrays and records *)
                        fun checkIllegalCycle ({name, ty, pos}, ()) =
                            let
                                fun alrSeenBefore (sym, seen) =
                                List.exists (fn s => S.name s = S.name sym) seen

                                fun goThroughCycle (sym, seen) =
                                if alrSeenBefore(sym, seen) then
                                    Err.error pos "error: illegal type cycle ahhh!!"
                                else
                                    case Env.findMatchType(new_tenv, sym) of
                                    SOME (T.NAME(nextSym, _)) =>
                                        goThroughCycle (nextSym, sym :: seen)
                                    | _ =>
                                        () 
                            in
                                goThroughCycle (name, [])
                            end
                        val _ = foldl checkIllegalCycle () tydecs;

                    in 
                        { venv = venv, tenv = new_tenv }
                    end


                (* #NOTE: we need like 2 cases here. 1) when there is an explicit type annotation (stored in typ) 
                2) there is not an explicit type annotation. Also, no issue w mutual recursion here *)
                | A.VarDec {name, escape, typ, init, pos} =>
                    let
                    
                    in
                        { venv = newVenv, tenv = tenv }
                    end

                    

            in
            trdec dec
            end

    (* #NOTE: return conversion from ast type info to like our internal type stuff from the type dec above *)
    and transTy(tenv, ty) : T.ty =
        let fun trty (astType : A.ty) : T.ty =
            case astType of
                A.NameTy (sym, pos) =>
                    (case Env.findMatchType (tenv, sym) of
                        SOME ty => ty
                    | NONE =>
                        (Err.error pos "error cannot find matching type in symbol table, undefined maybe ?"; T.INT))

                | A.RecordTy fields =>
                    let
                    fun trFieldList [] = []
                        | trFieldList ({name, escape, typ, pos} :: rest) =
                            let
                            val fieldTy =
                                    case Env.findMatchType (tenv, typ) of
                                        SOME t => t
                                    | NONE => (Err.error pos "error cannot find matching type in symbol table, undefined maybe ?"; T.INT)
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
                                    | NONE => (Err.error pos "error cannot find matching type in symbol table, undefined maybe ?"; T.INT)
                    in
                    T.ARRAY (arrayEltTy, ref ())
                    end
            in
            trty ty
            end

end