signature CODEGEN = 
sig
    structure Frame : FRAME 
    val codegen : Frame.frame -> Tree.stm -> Assem.instr list
end 


structure MipsGen : CODEGEN =
struct
    structure F = MipsFrame
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
                    emit(A.OPER{assem="move `d0, `s0\n",
                                src=[munchExp e],
                                dst=[i],jump=NONE})
                | munchStm(T.LABEL lab) =
                    emit(A.LABEL{assem=lab ^ ":\n", lab=lab})
                | munchStm (T.EXP e) = 
                    (munchExp e; ())
                | munchStm _ = ErrorMsg.impossible "Could not munch statement"

            and munchExp (T.CONST i) = 
                    result(fn t => emit (A.OPER{
                                assem="li `d0 " ^ Int.toString i ^ "\n",
                                dst=[t],
                                src=[],
                                jump=NONE
                            }))
              | munchExp (T.BINOP(T.PLUS, e1, e2)) = 
        in 
            munchStm stm;
            rev (!ilist)
        end
end