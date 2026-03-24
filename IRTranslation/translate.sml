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

    val simpleVar : access * level -> exp
end

structure Translate : TRANSLATE =
struct
    datatype level =
        OUTERMOST
      | LEVEL of {parent: level, frame: MipsFrame.frame}

    (*
    Ex: expression
    Nx: no result
    Cx: conditional, pass in true destination and false destination
    *)
    datatype exp = Ex of Tree.exp 
                 | Nx of Tree.stm
                 | Cx of Temp.label * Temp.label -> Tree.stm

    type access = level * MipsFrame.access

    val outermost = OUTERMOST

    fun frameOf (LEVEL {frame, ...}) = frame
      | frameOf OUTERMOST =
            raise Fail "outermost has no parent frame!"

    (* #NOTE: j append true at the front for the static link to parent *)
    fun newLevel {parent, name, formals} =
        let
            val newFormals = true :: formals
            val frame = MipsFrame.newFrame {name = name, formals = newFormals}
        in
            LEVEL {parent = parent, frame = frame}
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


    structure T = Tree 

    fun unEx(Ex e) = e
      | unEx(Cx genstm) = 
          let 
            val r = Temp.newtemp()
            val t = Temp.newLabel() and f = Temp.newLabel()
          in 
            T.ESEQ(seq[T.MOVE(T.TEMP r, T.CONST 1),
                        genstm(t, f), (* jumps to f if cond eval'd to false --> moves 0 to temp r*)
                        T.LABEL f,
                        T.MOVE(T.TEMP r, T.CONST 0),
                        T.LABEL t], (* execution proceeds here if genstm eval'd to true, do nothing since r already is 1 *)
            T.TEMP r)
          end
      | unEx(Nx s) = T.ESEQ(s, T.CONST 0)


    fun unNx(Ex e) = T.exp e
      | unNx(Nx s) = s 
      | unNx(Cx genstm) = 
            let 
                f = Temp.newLabel() 
                t = Temp.newLabel()
            in 
                T.ESEQ(seq[genstm(t, f),
                            T.LABEL(f),
                            T.LABEL(t)
                        ])
            end 

    fun unCx(Ex e) = (fn (t, f) => T.CJUMP(T.EQ, e, T.CONST 1, t, f))
      | unCx(Cx genstm) = genstm

    
    fun simpleVar((deflevel, mipsframeacc) : access, level) = 
        let 
            
        in
        end

end