structure T = Types
structure A = Absyn
structure S = Symbol


signature ENV =
sig
    type access 
    type ty
    datatype enventry = VarEntry of {ty: ty}
                    | FunEntry of {formals: ty list, result: ty}
    val base_tenv : ty S.table
    val base_venv : enventry S.table
end


structure Env :> ENV = 
struct
    type access = unit  (*TODO: what is access supposed to be ?? *)
    type ty = T.ty
    datatype enventry = VarEntry of {ty: ty}
                    | FunEntry of {formals: ty list, result: ty}
    
    val base_tenv = 
        let 
            val tenv_table = S.empty
            val baseSymbols = [("int", T.INT), ("string", T.STRING)]
            fun addToSymbolTable ((sname, ty), table) = S.enter(table, S.symbol sname, ty)
        in 
            foldl addToSymbolTable tenv_table baseSymbols
        end
    
    val base_venv = 
        let 
            val venv_table = S.empty
            val baseFunctions = [
                ("print", FunEntry {formals = [T.STRING], result = T.UNIT}),
                ("flush", FunEntry {formals = [], result = T.UNIT}),
                ("getChar", FunEntry {formals = [], result = T.STRING}),
                ("ord", FunEntry {formals = [T.STRING], result = T.INT}),
                ("chr", FunEntry {formals = [T.INT], result = T.STRING}),
                ("size", FunEntry {formals = [T.STRING], result = T.INT}),
                ("substring", FunEntry {formals = [T.STRING, T.INT, T.INT], result = T.STRING}),
                ("concat", FunEntry {formals = [T.STRING, T.STRING], result = T.STRING}),
                ("not", FunEntry {formals = [T.INT], result = T.INT}),   (*TODO:  function not(i : integer) : integer -- is INTEGER the same as INT ???*)
                ("exit", FunEntry {formals = [T.INT], result = T.UNIT})
            ]
            fun addToFunctionTable ((fname, funentry), table) = S.enter(table, S.symbol fname, funentry)
        in
            foldl addToFunctionTable venv_table baseFunctions
        end
        
end