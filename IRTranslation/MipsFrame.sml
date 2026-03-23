(* #NOTE: so like translate takes our type-checked AST and makes frags which represent our IR trees (mipsFrame is used here to determine where things are stored)
 We then do like unEx or UnNx to convert the IR trees to like the Tree.exp. This Tree.Exp then can be converted to assembly. 
ahhhh soooo many complex connections lol. *)

structure Tr = Tree

structure MipsFrame: FRAME = 
struct 
    val wordSize = 4
    val k = 4
    datatype access = InFrame of int | InReg of Temp.temp
    type frame = {name: Temp.label, formals: access list, localOffset: int ref}

    (* #NOTE: procFrag is for procedures and stringFrag for string into data sections *)
    datatype frag = ProcFrag of {body: Tr.stm, frame: frame} 
              | StringFrag of {label: Temp.label, str: string}

    val FP = Temp.newtemp()
    val RV = Temp.newtemp()
    fun procEntryExit1 (frame, body) = body

    fun name ({name, ...} : frame) = name

    fun formals({formals, ...} : frame) = formals

    (* #NOTE: use this when allocating local variables in function and looks at the escape flag to determine where things go. *)
    fun allocLocal(frame: frame) escape =
        if escape then
            let
                val offset = !(#localOffset frame) - wordSize
                val _ = (#localOffset frame) := offset
            in
                InFrame offset
            end
        else
            InReg (Temp.newtemp())

    (* 
    Handling more than 4 params: the first 4 params (static link + 3 args) arrive in registers (a0-a3),
    the rest are passed via the stack (in caller's stack frame)
    Cases: 
        - 0-4, escape: arrive in reg, move to callee frame (neg offset from current FP, increment localOffset)
        - 0-4, local : arrive in reg, keep in reg
        - 4+         : arrive in caller frame, keep in caller frame (pos offset from current FP)
    *)

    fun newFrame({name, formals}) = 
        let
            val nextLocal = ref 0

            fun alloc (esc, idx) = 
                if idx < k then
                    if esc then 
                        (nextLocal := !nextLocal - 4;
                        InFrame (!nextLocal))
                    else 
                        InReg(Temp.newtemp())
                else (* 4+th params are passed in the caller's frame so have positive offset (upward from current fp) *)
                    InFrame ((idx - 4) * 4) (* offset 0 for 5th, 4 for 6th, etc... *)

            fun allocFormals ([], idx) = []
              | allocFormals (formal :: rest, idx) = alloc(formal, idx) :: allocFormals(rest, idx + 1)

            val formalsAccesses = allocFormals (formals, 0)
        in
            {name = name, formals = formalsAccesses, localOffset = nextLocal}
        end

    (* #NOTE: this is to access variables given frame pointer and access val. *)
    fun exp (accessVal, fp) = 
        case accessVal of
            InFrame offset => Tr.MEM(Tr.BINOP(Tr.PLUS, fp, Tr.CONST offset))
          | InReg temp => Tr.TEMP(temp)

    fun externalCall (func, args) = Tr.CALL(Tr.NAME(Temp.namedLabel func), args)

end

