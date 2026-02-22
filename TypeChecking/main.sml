(* #NOTE: main module to run parser (using appel parser.parse impl for lexer stuff) to get abstract syntax that we can type check yippee! *)

structure Main =
struct
    fun main filename =
        (let
            val absyn = Parse.parse filename
            val _ = Semant.transProg absyn
        in
            ()
        end) handle ErrorMsg.Error =>
            (print "ahh broken compilation :| \n")

end



