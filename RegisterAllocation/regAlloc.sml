(* Manages spilling and calls up Color as a subroutine *)
signature REG_ALLOC =
sig
    structure Frame : FRAME
    type allocation = Frame.register Temp.Table.table
    val alloc : Assem.instr list * Frame.frame -> Assem.instr list * allocation
end

structure RegAlloc : REG_ALLOC =
struct

    structure Frame = MipsFrame
    type allocation = Frame.register Temp.Table.table

    fun alloc (instrs, frame) =
        let val (flowgraph, nodes) = MakeGraph.instrs2graph instrs
            val (igraph, liveout) = Liveness.interferenceGraph flowgraph
            val (alloc, spills) = Color.color{interference = igraph,
                                initial = Frame.tempMap,
                                spillCost = (fn _ => 1),
                                registers = Frame.registers}
        in
            if null spills then
                (instrs, alloc)
            else
                let val instrs' = RewriteProgram(instrs, spills, frame)
                in
                    alloc(instrs', frame)
                end
        end
end