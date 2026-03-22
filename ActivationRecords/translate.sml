(* #NOTE: so this should manage local variables and static links for nested functions. as a reminder, static links have
pointer to parent stack frame *)

signature TRANSLATE =
sig
    type level
    type access
    type exp

    val outermost : level
    val newLevel : {parent: level, name: Temp.label, formals: bool list} -> level

    val formals : level -> access list
    val allocLocal : level -> bool -> access
end

structure Translate : TRANSLATE =
struct
    datatype level =
        OUTERMOST
      | LEVEL of {parent: level, frame: MipsFrame.frame}

    (* #TODO: fill out placeholder later *)
    type exp = unit

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
end