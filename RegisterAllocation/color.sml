(* Does the graph coloring *)
(* Given an interference graph, produces an extension of the precoloring and assigns all temps used in the flow graph *)
signature COLOR =
sig
    structure Frame : FRAME

    type allocation = Frame.register Temp.Table.table

    val color: {interference: Liveness.igraph,
                initial: allocation,
                spillCost: Graph.node -> interference,
                registers: Frame.register list}
                -> allocation * Temp.temp list
end

structure Color : COLOR =
struct

    structure Frame = MipsFrame

    type allocation = 

    fun color 

(* {interference: Liveness.igraph,
            initial: allocation,
            spillCost: Graph.node -> interference,
            registers: Frame.register list}
            -> allocation * Temp.temp list *)