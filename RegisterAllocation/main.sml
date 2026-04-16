structure Main = struct

   structure Tr = Translate
   structure F = MipsFrame
   structure R = RegAlloc

 fun getsome (SOME x) = x
        | getsome NONE = raise Fail "getsome: expected SOME"

fun emitProc out (F.ProcFrag{body,frame}) =
        let val stms = Canon.linearize body
            (* val _ = print ("emit " ^ Symbol.name(F.name frame) ^ "\n") *)
            (* val _ = Printtree.printtree(out,body) *)
            (* val _ = app (fn s => Printtree.printtree(out,s)) stms *)
            val stms' = Canon.traceSchedule(Canon.basicBlocks stms)
            val instrs = List.concat(map (MipsGen.codegen frame) stms')
            (* val (flowgraph, nodes) = MakeGraph.instrs2graph instrs *)
            (* val _ = Liveness.interferenceGraph flowgraph *)
            (* val _ = Liveness.show(TextIO.stdOut, igraph) *)
            val instrs = MipsFrame.procEntryExit3(frame, instrs)
            val (instrs, allocation) = RegAlloc.alloc(instrs, frame)
            val tempToString = fn t =>
                (case Temp.Table.look(allocation, t) of
                    SOME name => name
                    | NONE => Temp.makestring t)
            val format0 = Assem.format tempToString
        in
            app (fn i => TextIO.output(out,format0 i)) instrs
        end

   fun emitString out (F.StringFrag{label=lab,str=s}) =
        TextIO.output(out, F.string(lab,s))

   fun emitDataSection out frags =
        let
            val _ = TextIO.output(out, ".data\n")
        in
            app (fn frag =>
                    case frag of
                        F.StringFrag{label=lab,str=s} => emitString out frag
                      | _ => ()) frags
        end

   fun emitTextSection out frags =
        let
            val _ = TextIO.output(out, "\n.text\n.globl main\nmain:\n")
        in
            app (fn frag =>
                    case frag of
                        F.ProcFrag{body,frame} => emitProc out frag
                      | _ => ()) frags
        end

   fun withOpenFile fname f = 
       let val out = TextIO.openOut fname
        in (f out before TextIO.closeOut out) 
            handle e => (TextIO.closeOut out; raise e)
       end 
       
    fun main filename =
        (let val absyn = Parse.parse filename
             val _ = FindEscape.findEscape absyn
             (* val _ = PrintEscape.printEscapes absyn *)
             val frags = Semant.transProg absyn
         in
             withOpenFile (filename ^ ".s")
                 (fn out => (emitDataSection out frags; emitTextSection out frags))
         end)
         handle ErrorMsg.Error => print "Broken compilation \n"

end



