structure Env = 
struct

    structure T = Types
    structure A = Absyn
    structure S = Symbol

    (* #NOTE: j need to differentiate value and function types i think  *)
    datatype enventry = VarEntry of {typeVal:T.ty, readonly: bool, access: Translate.access}
                | FunEntry of {formals: T.ty list, result: T.ty, level: Translate.level, label: Temp.label}

    (* #NOTE: tryna make this functional, easy to fold w tuples of symbols and correct mappings? *)
    fun addToSymbolTable ((sym, value), table) = 
        Symbol.enter(table, S.symbol sym, value)

    (* #NOTE: so like type environments are supposed to map the type name to actual type. 
    base_tenv should have predefined types (int and string from appendix) *)

    val base_tenv: T.ty S.table =
        let 
            val baseSymbols = [("int", T.INT), ("string", T.STRING)]
        in
            foldl addToSymbolTable S.empty baseSymbols
        end

    (* #NOTE: var envs are supposed to make whether an identifier is a variable of function.
    function entry details: formals: formal params and like resul: return type.
    base_venv needs to have bindings for predefined functions from appendix (print, flush, getchar, ord, chr, size, substring, concat, not, exit) *)
    val base_venv: enventry S.table =
        let
            val baseFunctions = [("print", FunEntry {formals=[T.STRING], result=T.UNIT, level = Translate.outermost, label=Temp.namedLabel("tig_print")}), 
                           ("flush", FunEntry {formals=[], result=T.UNIT, level = Translate.outermost, label=Temp.namedLabel("tig_flush")}),
                           ("getchar", FunEntry {formals=[], result=T.STRING, level = Translate.outermost, label=Temp.namedLabel("tig_getchar")}),
                           ("ord", FunEntry {formals=[T.STRING], result=T.INT, level = Translate.outermost, label=Temp.namedLabel("tig_ord")}),
                           ("chr", FunEntry {formals=[T.INT], result=T.STRING, level = Translate.outermost, label=Temp.namedLabel("tig_chr")}),
                           ("size", FunEntry {formals=[T.STRING], result=T.INT, level = Translate.outermost, label=Temp.namedLabel("tig_size")}),
                           ("substring", FunEntry {formals=[T.STRING, T.INT, T.INT], result=T.STRING, level = Translate.outermost, label=Temp.namedLabel("tig_substring")}),
                           ("concat", FunEntry {formals=[T.STRING, T.STRING], result=T.STRING, level = Translate.outermost, label=Temp.namedLabel("tig_concat")}),  
                           ("not", FunEntry {formals=[T.INT], result=T.INT, level = Translate.outermost, label=Temp.namedLabel("tig_not")}), 
                            ("exit", FunEntry {formals=[T.INT], result=T.UNIT, level = Translate.outermost, label=Temp.namedLabel("tig_exit")}),
                            ("nilerror", FunEntry {formals=[], result=T.UNIT, level = Translate.outermost, label=Temp.namedLabel("tig_nilerror")})]
        in
            foldl addToSymbolTable S.empty baseFunctions
        end

    fun findMatchType (table, sym) = S.look(table, sym)
    
    (* #TODO: need to include access here *)
    fun addVarVal(table, name, ty, acc) = S.enter(table, name, VarEntry {typeVal=ty, readonly=false, access=acc})
    fun addReadOnlyVarVal(table, name, ty, acc) = S.enter(table, name, VarEntry {typeVal=ty, readonly=true, access=acc})

    fun addTypeVal (table, name, ty) = S.enter(table, name, ty)
end


