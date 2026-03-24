(* #NOTE: so this should manage local variables and static links for nested functions. as a reminder, static links have
pointer to parent stack frame *)
signature TRANSLATE =
sig

    type level
    type access  (* NOT the same as frame.access*)
    type exp

    val outermost : level
    val newLevel : {parent: level, name: Temp.label, formals: bool list} -> level

    val formals : level -> access list
    val allocLocal : level -> bool -> access

    val simpleVar: access * level -> exp

    val subscriptVar: exp * exp -> exp
    val fieldVar: exp * int -> exp

    val intExp:int -> exp
    val nilExp: unit -> exp
    val stringExp: string -> exp
    val arrayExp: exp * exp -> exp
    val recordExp: exp list -> exp

    val assignExp : exp * exp -> exp
    val seqExp : exp list -> exp

    val ifExp : exp * exp * exp option -> exp
    val whileExp : exp * exp * Temp.label -> exp
    val forExp : exp * exp * exp * exp * Temp.label -> exp    
    val breakExp : Temp.label -> exp

    val callExp: Temp.label * level * level * exp list -> exp

    val binOpExp : Tree.binop * exp * exp -> exp
    val relOpExp : Tree.relop * exp * exp -> exp

    val procEntryExit : {level: level, body: exp} -> unit
    val resetFrags: unit -> unit
    val getResult : unit -> MipsFrame.frag list
end

structure Translate : TRANSLATE =
struct

    structure Fr = MipsFrame
    structure Tr = Tree
    structure T = Temp
    structure A = Absyn

    datatype level =
        OUTERMOST
      | LEVEL of {parent: level, frame: MipsFrame.frame, unique: unit ref}
    
    (* #NOTE: cx is conditional, still a side effect like Nx so should be stm ? *)
    datatype exp = Ex of Tr.exp
                    | Nx of Tr.stm
                    | Cx of (T.label * T.label -> Tr.stm)

    type access = level * MipsFrame.access

    val outermost = OUTERMOST

    (* #NOTE: we add to this when doing semant.transProg *)
    val frags: Fr.frag list ref = ref []

    fun frameOf (LEVEL {frame, ...}) = frame
      | frameOf OUTERMOST =
            raise Fail "outermost has no parent frame!"

    (* #NOTE: j append true at the front for the static link to parent *)
    fun newLevel {parent, name, formals} =
        let
            val newFormals = true :: formals
            val frame = Fr.newFrame {name = name, formals = newFormals}
        in
            LEVEL {parent = parent, frame = frame, unique = ref ()}
        end

    fun formals level =
        case level of
            OUTERMOST => []
          | LEVEL {frame, ...} =>
                (case MipsFrame.formals frame of
                    [] => []
                  | _ :: rest => List.map (fn formal => (level, formal)) rest)

    fun allocLocal level escape =
        let
            val frame = frameOf level
            val access = MipsFrame.allocLocal (frame) escape
        in
            (level, access)
        end

    (* #NOTE: HELPER FUNCTIONS?! *)
    (* #NOTE: used in static linking *)
    fun levelEqual (OUTERMOST, OUTERMOST) = true
        | levelEqual (LEVEL {unique = u1, ...}, LEVEL {unique = u2, ...}) = (u1 = u2)
        | levelEqual _ = false

    fun seq [] = Tr.EXP(Tr.CONST 0)
        | seq [s] = s
        | seq (s :: rest) = Tr.SEQ(s, seq rest)

    (* #NOTE: basically wanna convert all Nx, Ex,Cx into tree exp so need conversions for all 3 types for each of the 3 types lolz. *)
    (* #NOTE: returning tr.exp here! *)
    fun unEx (Ex e) = e 
    | unEx (Cx genstm) = 
        let 
            val r = T.newtemp()
            val t = T.newLabel()
            and f = T.newLabel()
        in
            Tr.ESEQ(seq[Tr.MOVE(Tr.TEMP r, Tr.CONST 1), 
                        genstm(t,f),
                        Tr.LABEL f,
                        Tr.MOVE(Tr.TEMP r, Tr.CONST 0),
                        Tr.LABEL t],
                        Tr.TEMP r)
        end
    | unEx (Nx s) = Tr.ESEQ(s, Tr.CONST 0)

    (* #NOTE: need to return a statement here! *)
    fun unNx (Ex e) = Tr.EXP e
    | unNx (Nx s) = s
    | unNx (Cx genstm) =
            let
                val t = T.newLabel()
                val f = T.newLabel()
            in
                seq [
                    genstm(t, f),
                    Tr.LABEL t,
                    Tr.LABEL f
                ]
            end

    (* #NOTE: need to return (Tr.label * T.label - > Tr.stm) here ? not full sure ngl. *)
    (* #MYSTERIOUS: look into genstm. also maybe we can write this in terms of the other 2 functions we already have*)
    fun unCx (Cx genstm) = genstm

    (* NOTE: book recommended having these cases separately *)
    | unCx (Ex (Tr.CONST 0)) = (fn (t, f) => Tr.JUMP(Tr.NAME f, [f]))
    | unCx (Ex (Tr.CONST 1)) = (fn (t, f) => Tr.JUMP(Tr.NAME t, [t]))

    | unCx (Ex e) = (fn (t, f) => Tr.CJUMP(Tr.NE, e, Tr.CONST 0, t, f))
    | unCx (Nx _) = raise Fail "Conversion from Nx to Cx not possible!"

    (* #TODO: following static links *)
    fun followingStaticLinks (useLvl : level, defLvl : level, fp : Tr.exp) : Tr.exp =
        (* #NOTE: don;t need to traverse any static links *)
        if levelEqual(useLvl, defLvl) then
            fp
        else
            case useLvl of
                OUTERMOST => raise Fail "followingStaticLinks: cannot traverse beyond outermost for static link"
              | LEVEL {parent, frame, ...} =>
                    let
                        val slAccessVal =
                            case Fr.formals frame of
                                staticLink :: _ => staticLink
                              | [] => raise Fail "followingStaticLinks: missing static link"

                        (* #TODO: double check accessExp *)
                        val parentFp = Fr.exp(slAccessVal, fp)
                    in
                        followingStaticLinks(parent, defLvl, parentFp)
                    end

    fun simpleVar ((defLvl, accVal) : access, useLvl : level) : exp =
        let
            val fpDef = followingStaticLinks(useLvl, defLvl, Tr.TEMP Fr.FP)
        in
            Ex(Fr.exp(accVal, fpDef))
        end

    (* #NOTE: array or record access. do offset from the base addr of arr/rec? *)
    (*
    TODO: later on we should prob also add runtime check for array boundarys (if array has 4 elements, accessing the 5th should throw out of bounds error)
          could be done by adding a size at the start of the array in initarray function and check from there (happens after nil check)
          skipping that for now since we aren't implementing initarray yet.
    *)
    fun subscriptVar (arrExp : exp, indexExp : exp) : exp =
        let
            val offset = Tr.BINOP(Tr.MUL, unEx indexExp, Tr.CONST Fr.wordSize)

            (* for nil pointer checks *)
            val oklabel = T.newLabel()
            val errlabel = T.newLabel()
            val r = T.newTemp()
        in
            Ex(Tr.ESEQ(
                seq[
                    Tr.MOVE(Tr.TEMP r, unEx arrExp),
                    Tr.CJUMP(Tr.EQ, Tr.TEMP r, Tr.CONST 0, errlabel, oklabel),
                    Tr.LABEL errlabel,
                    Tr.EXP(Fr.externalCall("nilerror", [])),
                    Tr.LABEL oklabel
                ],
                Tr.MEM(Tr.BINOP(Tr.PLUS, Tr.TEMP r, offset)) 
                ))
        end

    fun fieldVar (recordExp : exp, indexVal : int) : exp =
        let
            val offset = indexVal * Fr.wordSize

            (* for nil pointer checks *)
            val oklabel = T.newLabel()
            val errlabel = T.newLabel()
            val r = T.newTemp()
        in
            Ex(Tr.ESEQ(
                seq[
                    Tr.MOVE(Tr.TEMP r, unEx recordExp),
                    Tr.CJUMP(Tr.EQ, Tr.TEMP r, Tr.CONST 0, errlabel, oklabel),
                    Tr.LABEL errlabel,
                    Tr.EXP(Fr.externalCall("nilerror", [])),
                    Tr.LABEL oklabel
                ],
                Tr.MEM(Tr.BINOP(Tr.PLUS, Tr.TEMP r, Tr.CONST offset)))
                )
        end

    fun intExp i = Ex(Tr.CONST i)
    fun nilExp () = Ex(Tr.CONST 0)
    
    (* #NOTE: needs to go in data section as literal. secodn type for frag entry. *)
    fun stringExp s =
        let
            val labelVal = T.newLabel()
            val _ = frags := Fr.StringFrag{label = labelVal, str = s} :: !frags
        in
            Ex(Tr.NAME labelVal)
        end

    (* #NOTE: arrayExp and recordExp need to call external funcs *)
    fun arrayExp (sizeExp : exp, initExp : exp) : exp =
        Ex(Fr.externalCall("initArray", [unEx sizeExp, unEx initExp]))

    fun recordExp (fields : exp list) : exp =
        let
            val r = T.newtemp()
            val allocSize = List.length fields * Fr.wordSize

            fun storeFields (_, []) = []
              | storeFields (i, e :: rest) =
                    Tr.MOVE(
                        Tr.MEM(Tr.BINOP(Tr.PLUS, Tr.TEMP r, Tr.CONST (i * Fr.wordSize))),
                        unEx e
                    ) :: storeFields(i + 1, rest)
        in
            Ex(
                Tr.ESEQ(
                    seq (
                        Tr.MOVE(Tr.TEMP r, Fr.externalCall("allocRecord", [Tr.CONST allocSize]))
                        :: storeFields(0, fields)
                    ),
                    Tr.TEMP r
                )
            )
        end


    (* #NOTE: specifically for things like add, subtract, multiple, divide *)
    fun binOpExp (oper : Tr.binop, left : exp, right : exp) : exp = Ex(Tr.BINOP(oper, unEx left, unEx right))

    (* #NOTE: specifically for things like eq, neq, lt, le, gt, ge *)
    fun relOpExp (oper : Tr.relop, left : exp, right : exp) : exp = Cx(fn (t, f) => Tr.CJUMP(oper, unEx left, unEx right, t, f))

    (* #TODO: do we need separate string comparison stuff? *)

    fun assignExp (left : exp, right : exp) : exp = Nx(Tr.MOVE(unEx left, unEx right))

    (* #NOTE: evaluating and converting a list of exps *)
    fun seqExp [] = Ex(Tr.CONST 0)
      | seqExp [e] = e
      | seqExp (e :: rest) = Ex (Tr.ESEQ (unNx e, unEx (seqExp rest)))


    fun ifExp (testExp : exp, thenExp : exp, elseOp : exp option) : exp =
        (* #NOTE: if then case *)
        (case elseOp of
            NONE =>
                let
                    val t = T.newLabel()
                    val f = T.newLabel()
                in
                    Nx(seq [
                        unCx testExp (t, f),
                        Tr.LABEL t,
                        unNx thenExp,
                        Tr.LABEL f
                    ])
                end
            (* #NOTE: if then else case *)
          | SOME elseExp =>
                let
                    val r = T.newtemp()
                    val t = T.newLabel()
                    val f = T.newLabel()
                    val join = T.newLabel()
                in
                    Ex(
                        Tr.ESEQ(
                            seq [
                                unCx testExp (t, f),
                                Tr.LABEL t,
                                Tr.MOVE(Tr.TEMP r, unEx thenExp),
                                Tr.JUMP(Tr.NAME join, [join]),
                                Tr.LABEL f,
                                Tr.MOVE(Tr.TEMP r, unEx elseExp),
                                Tr.LABEL join
                            ],
                            Tr.TEMP r
                        )
                    )
                end)

    fun whileExp (testExp : exp, bodyExp : exp, labelVal : T.label) : exp =
        let
            val testLabel = T.newLabel()
            val bodyLabel = T.newLabel()
        in
            Nx(seq [
                Tr.LABEL testLabel,
                unCx testExp (bodyLabel, labelVal),
                Tr.LABEL bodyLabel,
                unNx bodyExp,
                Tr.JUMP(Tr.NAME testLabel, [testLabel]),
                Tr.LABEL labelVal
            ])
        end

    fun forExp (varExp : exp, loExp : exp, hiExp : exp, bodyExp : exp, doneLabel : Temp.label) : exp =
        let
            val limitTemp = Temp.newtemp ()
            val testLabel = Temp.newLabel ()
            val bodyLabel = Temp.newLabel ()
            val incrLabel = Temp.newLabel ()

            val varVal = unEx varExp
            val loVal = unEx loExp
            val hiVal = unEx hiExp
            val bodyStm = unNx bodyExp
        in
            Nx (
                seq [
                    Tree.MOVE (varVal, loVal),
                    Tree.MOVE (Tree.TEMP limitTemp, hiVal),
                    Tree.CJUMP (Tree.LE, varVal, Tree.TEMP limitTemp, bodyLabel, doneLabel),
                    Tree.LABEL bodyLabel,
                    bodyStm,
                    Tree.CJUMP (Tree.LT, varVal, Tree.TEMP limitTemp, incrLabel, doneLabel),
                    Tree.LABEL incrLabel,
                    Tree.MOVE (varVal, Tree.BINOP (Tree.PLUS, varVal, Tree.CONST 1)),
                    Tree.JUMP (Tree.NAME bodyLabel, [bodyLabel]),
                    Tree.LABEL doneLabel
                ]
            )
        end

    fun breakExp doneLabel =
        Nx(Tr.JUMP(Tr.NAME doneLabel, [doneLabel]))

    fun callExp (funLabel : T.label, fLvl : level, callLvl : level, args : exp list) : exp =
        let
            val argExps = List.map unEx args

            val staticLink =
                case fLvl of
                    OUTERMOST => Tr.CONST 0 (* dummy value bc shouldn't be travesing staticlinks at outermost, but we don't want it to crash here *)
                        (* raise Fail "can't static link w outermost" *)
                  | LEVEL {parent = calleeParent, ...} =>
                        followingStaticLinks(callLvl, calleeParent, Tr.TEMP Fr.FP)
        in
            Ex(Tr.CALL(Tr.NAME funLabel, staticLink :: argExps))
        end

    fun resetFrags () = frags := []

    fun procEntryExit {level, body} =
        let
            val frame = frameOf level
            val bodyVal =
                Tr.MOVE(Tr.TEMP Fr.RV, unEx body)
            val procBody = Fr.procEntryExit1(frame, bodyVal)
        in
            frags := Fr.ProcFrag {body = procBody, frame = frame} :: !frags
        end

    fun getResult () = List.rev (!frags)
  
end