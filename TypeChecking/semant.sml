structure Semant =
struct
    structure A = Absyn
    structure T = Types
    structure S = Symbol

    type venv = Env.enventry S.table
    type tenv = T.ty S.Table

    (* 
    transVar: venv * tenv * A.var -> expty
    transExp: venv * tenv * A.exp -> expty
    transDec: venv * tenv * A.dec -> {venv: venv, tenv: tenv}
    transTy: tenv * A.ty -> T.ty 

    type expty = {exp: Translate.exp, ty: Types.ty}
    *)

    fun checkInt ({exp, ty}, pos) = 
        case ty of 
            T.INT => () 
          | _ => Err.error pos "error: integer required";
    

    fun transExp (venv, tenv) : expty = 
        let 
            fun trexp (A.OpExp{left, oper=A.PlusOp, right, pos}) = (
                            checkInt(trexp left, pos);
                            checkInt(trexp right, pos);
                            {exp=(), ty=Types.INT}
                        )
              | trexp (A.RecordExp{}) = T.UNIT
              | trexp (A.LetExp{decs, body, pos}) = (
                            let 
                                val {venv=venv1, tenv=tenv1} = transDec(venv, tenv, decs)
                            in
                                transExp(venv1, tenv1) body
                            end
                        )
              | 
end