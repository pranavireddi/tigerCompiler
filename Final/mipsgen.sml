structure MipsGen : CODEGEN =
struct
    structure Frame = MipsFrame
    structure F = Frame
    structure T = Tree
    structure A = Assem

    fun iToS i =
        if (i<0) then "-" ^ Int.toString(~i)
        else Int.toString i

    fun codegen (frame) (stm: T.stm) : A.instr list = 
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

            fun munchStm (T.SEQ(a,b)) = (munchStm a; munchStm b)
                (* jumps *)
                | munchStm (T.JUMP(T.NAME lab, _)) =
                    emit(A.OPER{assem="j `j0\n",
                                src = [], dst = [],
                                jump = SOME[lab]})
                | munchStm (T.JUMP(e, labs)) =
                    emit(A.OPER{assem="jr `s0\n",
                                src = [munchExp e],
                                dst = [], jump = SOME labs})
    
                (* branch *)
                | munchStm (T.CJUMP(T.EQ, e1, e2, t, f)) =
                    emit(A.OPER{assem="beq `s0, `s1, `j0\nj `j1\n",
                                src = [munchExp e1, munchExp e2],
                                dst = [], jump = SOME[t,f]})
                | munchStm (T.CJUMP(T.NE, e1, e2, t, f)) =
                    emit(A.OPER{assem="bne `s0, `s1, `j0\nj `j1\n",
                                src = [munchExp e1, munchExp e2],
                                dst = [], jump = SOME[t,f]})
                | munchStm (T.CJUMP(T.GT, e1, e2, t, f)) =
                    emit(A.OPER{assem="bgt `s0, `s1, `j0\nj `j1\n",
                                src = [munchExp e1, munchExp e2],
                                dst = [], jump = SOME[t,f]})
                | munchStm (T.CJUMP(T.GE, e1, e2, t, f)) =
                    emit(A.OPER{assem="bge `s0, `s1, `j0\nj `j1\n",
                                src = [munchExp e1, munchExp e2],
                                dst = [], jump = SOME[t,f]})
                | munchStm (T.CJUMP(T.LT, e1, e2, t, f)) =
                    emit(A.OPER{assem="blt `s0, `s1, `j0\nj `j1\n",
                                src = [munchExp e1, munchExp e2],
                                dst = [], jump = SOME[t,f]})
                | munchStm (T.CJUMP(T.LE, e1, e2, t, f)) =
                    emit(A.OPER{assem="ble `s0, `s1, `j0\nj `j1\n",
                                src = [munchExp e1, munchExp e2],
                                dst = [], jump = SOME[t,f]})
                (* do i need unsigned? technically not in mips *)
                (* | munchStm (T.CJUMP(T.UGT, e1, e2, t, f)) =
                    emit(A.OPER{assem="bgtu `s0, `s1, `j0\nj `j1",
                                src = [munchExp e1, munchExp e2],
                                dst = [], jump = SOME[t,f]})
                | munchStm (T.CJUMP(T.UGE, e1, e2, t, f)) =
                    emit(A.OPER{assem="bgeu `s0, `s1, `j0\nj `j1",
                                src = [munchExp e1, munchExp e2],
                                dst = [], jump = SOME[t,f]})
                | munchStm (T.CJUMP(T.ULT, e1, e2, t, f)) =
                    emit(A.OPER{assem="bltu `s0, `s1, `j0\nj `j1",
                                src = [munchExp e1, munchExp e2],
                                dst = [], jump = SOME[t,f]})
                | munchStm (T.CJUMP(T.ULE, e1, e2, t, f)) =
                    emit(A.OPER{assem="bleu `s0, `s1, `j0\nj `j1",
                                src = [munchExp e1, munchExp e2],
                                dst = [], jump = SOME[t,f]}) *)
                (* sw *)
                | munchStm (T.MOVE(T.MEM(T.BINOP(T.PLUS, e1, T.CONST i)), e2)) =
                    emit(A.OPER{assem="sw `s0, " ^ iToS i ^ "(`s1)\n",
                                src = [munchExp e2, munchExp e1],
                                dst = [], jump=NONE})
                | munchStm(T.MOVE(T.MEM(T.BINOP(T.PLUS,T.CONST i,e1)),e2)) =
                    emit(A.OPER{assem="sw `s0, " ^ iToS i ^ "(`s1)\n",
                                src=[munchExp e2, munchExp e1],
                                dst=[], jump=NONE})
                | munchStm(T.MOVE(T.MEM(e1),e2)) =
                    emit(A.OPER{assem="sw `s0, 0(`s1)\n",
                                src=[munchExp e2, munchExp e1],
                                dst= [] ,jump=NONE})
                | munchStm(T.MOVE(T.TEMP i, e)) =
                    emit(A.MOVE{assem="move `d0, `s0\n",
                                src=munchExp e,
                                dst=i})
                | munchStm(T.LABEL lab) =
                    emit(A.LABEL{assem=Symbol.name lab ^ ":\n", lab=lab})
                | munchStm (T.EXP e) = 
                    (munchExp e; ())
                | munchStm _ = ErrorMsg.impossible "Could not munch statement"

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
                                assem="addi `d0, `s0, " ^ iToS i ^ "\n",
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
                    munchExp (T.BINOP(T.PLUS, e1, T.CONST(~i)))
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
                                assem="div `s0, `s1\n",
                                dst=[],
                                src=[munchExp e1, munchExp e2],
                                jump=NONE
                            });
                        emit (A.OPER{
                                assem="mflo `d0\n",
                                dst=[t],
                                src=[],
                                jump=NONE
                            })
                    ))

            (* BINOP - AND *)
              | munchExp (T.BINOP(T.AND, e1, T.CONST i)) = 
                    result(fn t => emit (A.OPER{
                                assem="andi `d0, `s0, " ^ iToS i ^ "\n",
                                dst=[t], 
                                src=[munchExp e1], 
                                jump=NONE
                            }))
            | munchExp (T.BINOP(T.AND, e1, e2)) = 
                    result(fn t => emit (A.OPER{
                                assem="and `d0, `s0, `s1\n",
                                dst=[t], 
                                src=[munchExp e1, munchExp e2], 
                                jump=NONE
                            }))

            (* BINOP - OR *) 
              | munchExp (T.BINOP(T.OR, e1, T.CONST i)) = 
                    result(fn t => emit (A.OPER{
                                assem="ori `d0, `s0, " ^ iToS i ^ "\n",
                                dst=[t], 
                                src=[munchExp e1], 
                                jump=NONE
                            }))
              | munchExp (T.BINOP(T.OR, e1, e2)) = 
                    result(fn t => emit (A.OPER{
                                assem="or `d0, `s0, `s1\n",
                                dst=[t], 
                                src=[munchExp e1, munchExp e2], 
                                jump=NONE
                            }))

            (* BINOP - LSHIFT *)
              | munchExp (T.BINOP(T.LSHIFT, e1, T.CONST i)) = 
                    result(fn t => emit (A.OPER{
                                assem="sll `d0, `s0, " ^ iToS i ^ "\n",
                                dst=[t], 
                                src=[munchExp e1], 
                                jump=NONE
                            }))

            (* BINOP - RSHIFT *)
              | munchExp (T.BINOP(T.RSHIFT, e1, T.CONST i)) = 
                    result(fn t => emit (A.OPER{
                                assem="srl `d0, `s0, " ^ iToS i ^ "\n",
                                dst=[t], 
                                src=[munchExp e1], 
                                jump=NONE
                            }))

            (* BINOP - ARSHIFT *)
              | munchExp (T.BINOP(T.ARSHIFT, e1, T.CONST i)) = 
                    result(fn t => emit (A.OPER{
                                assem="sra `d0, `s0, " ^ iToS i ^ "\n",
                                dst=[t], 
                                src=[munchExp e1], 
                                jump=NONE
                            }))

            (* BINOP - XOR *)
              | munchExp (T.BINOP(T.XOR, e1, T.CONST i)) = 
                    result(fn t => emit (A.OPER{
                                assem="xori `d0, `s0, " ^ iToS i ^ "\n",
                                dst=[t], 
                                src=[munchExp e1], 
                                jump=NONE
                            }))
              | munchExp (T.BINOP(T.XOR, e1, e2)) = 
                    result(fn t => emit (A.OPER{
                                assem="xor `d0, `s0, `s1\n",
                                dst=[t], 
                                src=[munchExp e1, munchExp e2], 
                                jump=NONE
                            }))

            (* MEM *)
              | munchExp (T.MEM(T.BINOP(T.PLUS, e1, T.CONST i))) = 
                    result(fn t => emit (A.OPER{
                                assem="lw `d0, " ^ iToS i ^ "(`s0)\n",
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
              | munchExp (T.CALL(T.NAME lab, args)) =
                    result(fn t => (
                        emit (A.OPER{
                                assem="jal " ^ Symbol.name lab ^ "\n",
                                dst=F.callersaves @ [F.RV, F.RA],
                                src=munchArgs(args, 0),
                                jump=NONE
                            });
                        emit (A.OPER{
                                assem="move `d0, `s0\n",
                                dst=[t],
                                src=[F.RV],
                                jump=NONE
                            })
                    ))
              | munchExp _ = ErrorMsg.impossible "Could not munch expression"
            (* moves args to correct positions (outgoing param registers or mem *)
            (* returns list of temps passed to machine's call insn, list as srcs *)
            and munchArgs ([], _) = []
                | munchArgs (arg::args,i) = 
                    if i<List.length F.argregs then (* all in regs *)
                        let val reg = List.nth(F.argregs, i)
                        in
                            munchStm(T.MOVE(T.TEMP reg, arg));
                            reg :: munchArgs(args,i+1)
                        end
                    else (* push to stack *)
                        let val offset = (i-4)*F.wordSize
                        in
                            munchStm(T.MOVE(T.MEM(T.BINOP(T.PLUS, T.TEMP F.SP, T.CONST offset)), arg));
                            munchArgs(args, i+1)
                        end
        in 
            munchStm stm;
            rev (!ilist)
        end
end