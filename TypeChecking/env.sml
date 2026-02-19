structure T = Types
structure A = Absyn
structure S = Symbol

(* #NOTE: tryna make this functional, easy to fold w tuples of symbols and correct mappings? *)
fun addToSymbolTable ((sym, value), table) = 
    Symbol.enter(table, S.symbol sym, value)


structure Env = 
struct
    (* #NOTE: j need to differentiate value and function types i think  *)
    datatype enventry = VarEntry of T.ty
                | FunEntry of {formals: T.ty list, result: T.ty}

    (* #NOTE: so like type environments are supposed to map the type name to actual type. 
    base_tenv should have predefined types (int and string from appendix) *)

    val base_tenv: T.ty S.table =
        let 
            val baseSymbols = [("int", T.INT), ("string", T.STRING)]
        in
            foldr addToSymbolTable S.empty baseSymbols
        end

    (* #NOTE: var envs are supposed to make whether an identifier is a variable of function.
    function entry details: formals: formal params and like resul: return type.
    base_venv needs to have bindings for predefined functions from appendix (print, flush, getchar, ord, chr, size, substring, concat, not, exit) *)
    val base_venv: enventry S.table =
        let
            val baseFunctions = [("print", FunEntry {formals=[T.STRING], result=T.UNIT}), 
                           ("flush", FunEntry {formals=[], result=T.UNIT}),
                           ("getchar", FunEntry {formals=[], result=T.STRING}),
                           ("ord", FunEntry {formals=[T.STRING], result=T.INT}),
                           ("chr", FunEntry {formals=[T.INT], result=T.STRING}),
                           ("size", FunEntry {formals=[T.STRING], result=T.INT}),
                           ("substring", FunEntry {formals=[T.STRING, T.INT, T.INT], result=T.STRING}),
                           ("concat", FunEntry {formals=[T.STRING, T.STRING], result=T.STRING}),
                           ("not", FunEntry {formals=[T.INT], result=T.INT}), 
                            ("exit", FunEntry {formals=[T.INT], result=T.UNIT})]
        in
            foldr addToSymbolTable S.empty baseFunctions
        end

    fun findMatchType (table, sym) = S.look(table, sym)

    fun addVarVal(table, name, type) = S.enter(table, name, VarEntry ty)

    fun addTypeVal (table, name, type) = S.enter(table, name, type)
end


