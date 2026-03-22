(* 
FindEscape: look for escaping variables, record info in escape fields of the absyn
    - travse the entire absyn tree, look for escape uses of every variable. 
    - must occur before semantic analysis begins (???) because semand needs to know whether a varaible escapes immediately upon seeinb that variable for the first time
    - traversal function is a mutual recursion on absyn esps and vars, like the type checker, use a map binding bool ref (escaped or not escaped)
*)

structure FindEscape: sig val FindEscape: Absyn.esp -> unit end =
struct
    structure Err = ErrorMsg 

    type depth = int
    type escEnv = (depth * bool ref) Symbol.table

    fun traverseVar(env:escEnv, d:depth, s:Absyn.var): unit = 
        case s of 
            Absyn.SimpleVar(symbol, pos) =>         (* regular variables *)
                (case (Symbol.look(env, symbol)) of 
                    SOME (decdepth, ref)   => 
                        if decdepth < d             (* usage is nested deeper than dec -> make var escape bc now var needs to be passed to nested fn via static link *)
                            then escape_ref := true;
                            else ()                 (* escape ref stays false *)
                  | NONE            => (Err.error pos "Error: usage of undeclared variables."))
        
          | Absyn.FieldVar(var, symbol, pos) => traverseVar(env, d, var)   (* x.y *)
          
          | Absyn.SubscriptVar(var, exp, pos) =>   (* x[y] *)
                (traverseVar(env, d, var);
                traverseVar(env, d, exp))
            
    and traverseExp(env:escEnv, d:depth, s:Absyn.exp): unit = 
        case s of
            Absyn.VarExp v => 
                traverseVar(env, d, v)
          | Absyn.CallExp{func, args, pos} => 
                app (fn s => traverseVar(env, d, s)) args
          | Absyn.OpExp{left, oper, right, pos} => (
                traverseExp(env, d, left); 
                traverseExp(env, d, right)
            )
          | Absyn.RecordExp{fields, typ, pos} => 
                app (fn (_, exp, _) => traverseExp(env, d, exp)) fields
          | Absyn.SeqExp{exps} => app (fn (exp, _) => 
                traverseExp(env, d, exp)) exps
          | Absyn.AssignExp{var, exp, pos} => (
                traverseVar(env, d, var); 
                traverseExp(env, d, exp)
            )
          | Absyn.IfExp{test, then', else', pos} => (
                traverseExp(env, d, test);
                traverseExp(env, d, then');
                case else' of 
                    SOME body => traverseExp(env, d, body)
                  | NONE => ()
            )
          | Absyn.WhileExp{test, body, pos} => (
                traverseExp(env, d, test);
                traverseExp(env, d, body)
            )
          | Absyn.ForExp{var, escape, lo, hi, body, pos} => 
                let 
                    val _ = escape := false
                    val env' = Symbol.enter(env, var, (d, escape))
                in
                    traverseExp(env, d, lo)
                    traverseExp(env, d, hi)
                    traverseExp(env', d, body)
                end
          | Absyn.LetExp{decs, body, ...} =>
                let 
                    val env' = traverseDecs(env, d, decs)
                in 
                    traverseExp(env', d, body)
                end
          | Absyn.ArrayExp{typ, size, init, pos} => (
                traverseExp(env, d, size);
                traverseExp(env, d, init)
            )
          | _ => () (* all remaining exp types -- NilExp, IntExp, StringExp, BreakExp -- won't trigger escape change*)

    and traverseDecs(env, d, s:Absyn.dec list): escEnv = 
        case s of 
            Absyn.FunctionDec{decs} => 
          | Absyn.VarDec{name, escape, typ, init, pos} => 
          | Absyn.TypeDec{decs} => 

    fun FindEscape(prog: Absyn.exp) : unit = ... 
end 
