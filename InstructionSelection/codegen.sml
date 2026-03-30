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
            
            (* CONSTANTS *)
            and munchExp (T.CONST i) = 
                    result(fn t => emit (A.OPER{
                                assem="li `d0, " ^ Int.toString i ^ "\n",
                                dst=[t],
                                src=[],
                                jump=NONE
                            }))

            (* BINOP - PLUS *)     
              | munchExp (T.BINOP(T.PLUS, e1, T.CONST i)) = 
                    result(fn t => emit (A.OPER{
                                assem="addi `d0, `s0, " ^ Int.toString i ^ "\n",
                                dst=[t],
                                src=[munchExp e1],
                                jump=NONE
                            }))
              | munchExp (T.BINOP(T.PLUS, T.CONST i, e1)) = 
                    munchExp (T.BINOP(T.PLUS, e1, T.CONST i))
              | munchExp (T.BINOP(T.PLUS, e1, e2)) = 
                    result(fn t => emit (A.OPER{
                                assem="add `d0, `s0, `s1 \n",
                                dst=[t],
                                src=[munchExp e1, munchExp e2],
                                jump=NONE
                            }))

            (* BINOP - MINUS *)
              | munchExp (T.BINOP(T.MINUS, e1, T.CONST i)) = 
                    munchExp (T.BINOP(T.PLUS, e1, T.CONST ~i))
              | munchExp (T.BINOP(T.MINUS, e1, e2)) = 
                    result(fn t => emit (A.OPER{
                                assem="sub `d0, `s0, `s1 \n",
                                dst=[t],
                                src=[munchExp e1, munchExp e2],
                                jump=NONE
                            }))

            (* BINOP - MUL *)
              | munchExp (T.BINOP(T.MUL, e1, e2)) = 
                    result(fn t => emit (A.OPER{
                                assem="mul `d0, `s0, `s1 \n",
                                dst=[t],
                                src=[munchExp e1, munchExp e2],
                                jump=NONE
                            }))

            (* BINOP - DIV *)
              | munchExp (T.BINOP(T.DIV, e1, e2)) = 
                    result(fn t =>(
                        emit (A.OPER{
                                assem="div `s0, `s1 \n",
                                dst=[],
                                src=[munchExp e1, munchExp e2],
                                jump=NONE
                            });
                        emit (A.OPER{
                                assem="mflo `d0\n",
                                dst=[t],
                                src=[],
                                jump=NONE
                            });
                    ))

            (* BINOP - AND *)
              | munchExp (T.BINOP(T.AND, e1, e2)) = 
                    result(fn t => emit (A.OPER{
                                assem="and `d0, `s0, `s1\n",
                                dst=[t], 
                                src=[munchExp e1, munchExp e2], 
                                jump=NONE
                            }))
              | munchExp (T.BINOP(T.AND, e1, T.CONST i)) = 
                    result(fn t => emit (A.OPER{
                                assem="andi `d0, `s0, " ^ Int.toString i ^ "\n",
                                dst=[t], 
                                src=[munchExp e1], 
                                jump=NONE
                            }))

            (* BINOP - OR *) 
              | munchExp (T.BINOP(T.OR, e1, e2)) = 
                    result(fn t => emit (A.OPER{
                                assem="or `d0, `s0, `s1\n",
                                dst=[t], 
                                src=[munchExp e1, munchExp e2], 
                                jump=NONE
                            }))
              | munchExp (T.BINOP(T.OR, e1, T.CONST i)) = 
                    result(fn t => emit (A.OPER{
                                assem="ori `d0, `s0, " ^ Int.toString i ^ "\n",
                                dst=[t], 
                                src=[munchExp e1], 
                                jump=NONE
                            }))

            (* BINOP - LSHIFT *)
              | munchExp (T.BINOP(T.LSHIFT, e1, T.CONST i)) = 
                    result(fn t => emit (A.OPER{
                                assem="sll `d0, `s0, " ^ Int.toString i ^ "\n",
                                dst=[t], 
                                src=[munchExp e1], 
                                jump=NONE
                            }))

            (* BINOP - RSHIFT *)
              | munchExp (T.BINOP(T.RSHIFT, e1, T.CONST i)) = 
                    result(fn t => emit (A.OPER{
                                assem="srl `d0, `s0, " ^ Int.toString i ^ "\n",
                                dst=[t], 
                                src=[munchExp e1], 
                                jump=NONE
                            }))

            (* BINOP - ARSHIFT *)
              | munchExp (T.BINOP(T.ARSHIFT, e1, T.CONST i)) = 
                    result(fn t => emit (A.OPER{
                                assem="sra `d0, `s0, " ^ Int.toString i ^ "\n",
                                dst=[t], 
                                src=[munchExp e1], 
                                jump=NONE
                            }))

            (* BINOP - XOR *)
              | munchExp (T.BINOP(T.XOR, e1, e2)) = 
                    result(fn t => emit (A.OPER{
                                assem="xor `d0, `s0, `s1\n",
                                dst=[t], 
                                src=[munchExp e1, munchExp e2], 
                                jump=NONE
                            }))
              | munchExp (T.BINOP(T.XOR, e1, T.CONST i)) = 
                    result(fn t => emit (A.OPER{
                                assem="xori `d0, `s0, " ^ Int.toString i ^ "\n",
                                dst=[t], 
                                src=[munchExp e1], 
                                jump=NONE
                            }))

            (* MEM *)
              | munchExp (T.MEM(T.BINOP(T.PLUS, e1, T.CONST i))) = 
                    result(fn t => emit (A.OPER{
                                assem="lw `d0, " ^ Int.toString i ^ "(`s0)\n",
                                dst=[t], 
                                src=[munchExp e1], 
                                jump=NONE
                            }))
              | munchExp (T.MEM(T.BINOP(T.PLUS, T.CONST i, e1))) = 
                    munchExp(T.MEM(T.BINOP(T.PLUS, e1, T.CONST i)))
              | munchExp (T.MEM e1) = 
                    result(fn t => emit (A.OPER{
                                assem="lw `d0, 0(`s0)\n",
                                dst=[t], 
                                src=[munchExp e1], 
                                jump=NONE
                            }))

            (* TEMP *)
              | munchExp (T.TEMP t) = t

            (* NAME *)
              | munchExp (T.NAME lab) = 
                    result(fn t => emit (A.OPER{
                                assem="la `d0, " ^ Symbol.name lab ^ "\n",
                                dst=[t], 
                                src=[], 
                                jump=NONE
                            }))

            (* CALL *)
              | munchExp (T.CALL(T.NAME lab, args)) = (
                    result(fn t => 
                        emit (A.OPER{
                                assem="jal " ^ Symbol.name lab ^ "\n",
                                dst=F.callersaves @ [F.RV, F.RA],
                                src=munchArgs(args, F.argregs), 
                                jump=NONE
                            }));
                        emit (A.OPER{
                                assem="move `d0, `s0\n",
                                dst=[t],
                                src=[F.RV],
                                jump=NONE
                            });
                        )

            (*NOTE: tree should NOT contain ESEQ anymore after applying ch8 transformations *)
            and munchArgs (_, []) = []
              | munchArgs ([], _) = []
              | munchArgs (arg::args, reg::regs) = 
                    (emit(A.MOVE{
                        assem="move `d0, `s0\n",
                        dst=[reg],
                        src=[munchExp arg]
                    });
                    reg::munchArgs(args, regs))

        in 
        end
end