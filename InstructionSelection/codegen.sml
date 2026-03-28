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

    val codegen (frame) (stm: T.stm) : A.instr list = 
        let
            val ilist = ref (nil : A.instr list)
            fun emit x = ilist := x :: !ilist

            fun result(gen) = 
                let 
                    val t = Temp.newtemp()
                in 
                    gen t; 
                    t
                end 

            fun munchStm = 

            and munchExp (T.CONST i) = 
                    result(fn t => emit (A.OPER{
                                assem="li `d0 " ^ Int.toString i ^ "\n",
                                dst=[t],
                                src=[],
                                jump=NONE
                            }))
              | munchExp (T.BINOP(T.PLUS, e1, e2)) = 
        in 
        end
end