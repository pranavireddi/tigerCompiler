signature CODEGEN = 
sig
    structure Frame : FRAME 
    val codegen : Frame.frame -> Tree.stm -> Assem.instr list
end 


structure MipsGen : CODEGEN
struct
    structure F = MipsFrame
    structure T = Tree
    structure A = Assem

    val codegen (frame : F) (tree : T) : A.instr list = 
        let
            val instrList = ref ([] : A.instr list)
            fun emit (i : A.instr) = instrList = i :: instrList 

            fun munchStm = 

            and munchExp (T.CONST i) = 
                    let 
                        val r = Temp.newtemp()
                    in 
                        emit (A.OPER{
                                assem="li `d0 " ^ Int.toString i ^ "\n",
                                dst=[r],
                                src=[],
                                jump=NONE
                            })
                    end 
              | munchExp (T.BINOP(T.PLUS, e1, e2)) = 
        in 
        end
end