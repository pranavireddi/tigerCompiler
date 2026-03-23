(* #NOTE: we build this off the abstraction in frame.sml. This allows us to have MIPS specific frame details! *)

structure MipsFrame: FRAME = 
struct 
    val wordSize = 4
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

    fun newFrame({name, formals}) = 
        let
            fun allocFormals (formals, offset) = 
                case formals of 
                    true :: rest => InFrame offset :: allocFormals (rest, offset + wordSize)
                    | false :: rest => InReg (Temp.newtemp()) :: allocFormals (rest, offset + wordSize)
                    | [] => []
            val formalsAccesses = allocFormals (formals, 0)
        in
            {name = name, formals = formalsAccesses, localOffset = ref 0}
        end

end

