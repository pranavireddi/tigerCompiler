(* #NOTE: we build this off the abstraction in frame.sml. This allows us to have MIPS specific frame details! *)

structure MipsFrame: FRAME = 
struct 
    val wordSize = 4
    val k = 4
    datatype access = InFrame of int | InReg of Temp.temp
    type frame = {name: Temp.label, formals: access list, localOffset: int ref}

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

    
    val FP = 
    val exp = 
end

