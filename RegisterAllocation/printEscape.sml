structure PrintEscape =
struct
    structure A = Absyn
    structure S = Symbol

    fun indent n = String.implode (List.tabulate(n, fn _ => #" "))

    fun printVar (name, escape, depth) =
        print (indent depth ^ "var " ^ S.name name ^
               " escapes = " ^ Bool.toString (!escape) ^ "\n")

    fun printParam (name, escape, depth) =
        print (indent depth ^ "param " ^ S.name name ^
               " escapes = " ^ Bool.toString (!escape) ^ "\n")

    fun printForVar (name, escape, depth) =
        print (indent depth ^ "for-var " ^ S.name name ^
               " escapes = " ^ Bool.toString (!escape) ^ "\n")

    fun traverseVar depth var =
        case var of
            A.SimpleVar _ => ()
          | A.FieldVar(v, _, _) => traverseVar depth v
          | A.SubscriptVar(v, e, _) =>
                (traverseVar depth v;
                 traverseExp depth e)

    and traverseExp depth exp =
        case exp of
            A.VarExp v =>
                traverseVar depth v

          | A.NilExp => ()
          | A.IntExp _ => ()
          | A.StringExp _ => ()

          | A.CallExp {args, ...} =>
                List.app (traverseExp depth) args

          | A.OpExp {left, right, ...} =>
                (traverseExp depth left;
                 traverseExp depth right)

          | A.RecordExp {fields, ...} =>
                List.app (fn (_, e, _) => traverseExp depth e) fields

          | A.SeqExp seqList =>
                List.app (fn (e, _) => traverseExp depth e) seqList

          | A.AssignExp {var, exp, ...} =>
                (traverseVar depth var;
                 traverseExp depth exp)

          | A.IfExp {test, then', else', ...} =>
                (traverseExp depth test;
                 traverseExp depth then';
                 case else' of
                     SOME e => traverseExp depth e
                   | NONE => ())

          | A.WhileExp {test, body, ...} =>
                (traverseExp depth test;
                 traverseExp depth body)

          | A.ForExp {var, escape, lo, hi, body, ...} =>
                (printForVar(var, escape, depth);
                 traverseExp depth lo;
                 traverseExp depth hi;
                 traverseExp (depth + 1) body)

          | A.BreakExp _ => ()

          | A.LetExp {decs, body, ...} =>
                (traverseDecs depth decs;
                 traverseExp depth body)

          | A.ArrayExp {size, init, ...} =>
                (traverseExp depth size;
                 traverseExp depth init)

    and traverseDec depth dec =
        case dec of
            A.VarDec {name, escape, init, ...} =>
                (printVar(name, escape, depth);
                 traverseExp depth init)

          | A.FunctionDec fundecs =>
                List.app (fn {name, params, body, ...} =>
                    let
                        val _ = print (indent depth ^ "function " ^ S.name name ^ "\n")

                        val _ =
                            List.app (fn {name, escape, ...} =>
                                printParam(name, escape, depth + 2)
                            ) params
                    in
                        traverseExp (depth + 2) body
                    end
                ) fundecs

          | A.TypeDec _ => ()

    and traverseDecs depth decs =
        List.app (traverseDec depth) decs

    fun printEscapes exp =
        traverseExp 0 exp
end