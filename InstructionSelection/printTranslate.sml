structure printTranslate =
struct
    structure F = MipsFrame

    fun printLine s =
        (print s; print "\n")

    fun labelToString (lab : Temp.label) =
        Symbol.name lab

    fun showProcFrag ({body, frame} : {body : Tree.stm, frame : F.frame}) =
        let
            val _ = printLine "========================================"
            val _ = printLine "PROC FRAG"
            val _ = printLine "----------------------------------------"
            val _ = printLine ("Frame name: " ^ labelToString (F.name frame))
            val _ = printLine ("Number of formals: " ^ Int.toString (length (F.formals frame)))
            val _ = printLine "IR body:"
            val _ = Printtree.printtree (TextIO.stdOut, body)
            val _ = print "\n"
        in
            ()
        end

    fun showStringFrag ({label, str} : {label : Temp.label, str : string}) =
        let
            val _ = printLine "========================================"
            val _ = printLine "STRING FRAG"
            val _ = printLine "----------------------------------------"
            val _ = printLine ("Label: " ^ labelToString label)
            val _ = printLine ("String: " ^ str)
        in
            ()
        end

    fun showFrag frag =
        case frag of
            F.ProcFrag procInfo => showProcFrag procInfo
          | F.StringFrag strInfo => showStringFrag strInfo

    fun run filename =
        let
            val _ = printLine ("Running translation test on: " ^ filename)
            val absyn = Parse.parse filename
            val frags = Semant.transProg absyn
            val _ = printLine ""
            val _ = printLine "===== TRANSLATE / SEMANT OUTPUT ====="
            val _ = List.app showFrag frags
            val _ = printLine "====================================="
        in
            frags
        end
end