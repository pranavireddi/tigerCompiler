(* #NOTE: the general idea here is to convert assem.sml instructions to a flow graph *)
structure MakeGraph :
sig 
    val instrs2graph : Assem.instr list -> Flow.flowgraph * Graph.node list
end =


(* #NOTE: thought this would be helpful to reference: 
  datatype instr = OPER of {assem: string,
							dst: temp list,
							src: temp list,
							jump: label list option}
                 | LABEL of {assem: string, lab: Temp.label}
                 | MOVE of {assem: string, 
							dst: temp,
							src: temp} *)

struct

    structure G = Graph
    structure F = Flow

    fun defsInInstr (Assem.OPER {dst, ...}) = dst
      | defsInInstr (Assem.MOVE {dst, ...}) = [dst]
      | defsInInstr (Assem.LABEL _) = []

    fun usesInInstr (Assem.OPER {src, ...}) = src
      | usesInInstr (Assem.MOVE {src, ...}) = [src]
      | usesInInstr (Assem.LABEL _) = []

    fun isMoveInstr (Assem.MOVE _) = true
      | isMoveInstr _ = false


    (* #NOTE: we want to store the sources and destinations of instructions in auxillary tables so that nodes don't become to heavy *)
    (* #NOTE: wanna return FlowGraph and nodes from this function *)
    (* 
        datatype flowgraph = FGRAPH of {control: Graph.graph,
				    def: Temp.temp list Graph.Table.table,
				    use: Temp.temp list Graph.Table.table,
				    ismove: bool Graph.Table.table} *)

    fun instrs2graph (instrs : Assem.instr list) =
        let
            val control = G.newGraph() 
            val defVals = ref G.Table.empty
            val useVals = ref G.Table.empty
            val ismoveVals = ref G.Table.empty

            fun insertNode instr =
                let
                    val node = G.newNode control
                in
                    defVals := G.Table.enter(!defVals, node, defsInInstr instr);
                    useVals := G.Table.enter(!useVals, node, usesInInstr instr);
                    ismoveVals := G.Table.enter(!ismoveVals, node, isMoveInstr instr);
                    node
                end

            (* #NOTE: node to instruction mapping we need to return  *)
            val nodes = map insertNode instrs
            val instrNodePairs = ListPair.zip (instrs, nodes)

            (* #TODO: connect nodes in graph to assem labels bc this is how jump logic is set up*)
            fun mapLabels ((Assem.LABEL {lab, ...}, node), table) =
                  Symbol.enter(table, lab, node)
              | mapLabels ((_, _), table) = table

            val labelMap = foldl mapLabels Symbol.empty instrNodePairs

            (* #NOTE: helper function to deal w jump cases bc conditional jumps can't be treated sequentially i think *)
            fun startsWith (s, prefix) =
                let
                    val n = size prefix
                in
                    size s >= n andalso String.substring(s, 0, n) = prefix
                end

            (* #NOTE: these are cases where u explicitly have to jump, so like u should not link w the next instr/node i think. lwk need to confirm !! *)
            fun isUnconditionalJump (Assem.OPER {assem, jump = SOME _, ...}) =
                  startsWith(assem, "j ")
                  orelse startsWith(assem, "jr ")
              | isUnconditionalJump _ = false

            fun canFallThrough instr = not (isUnconditionalJump instr)

            (* #NOTE: dealing w fall through cases *)
            fun addSeqInstr ((pair1 as (instr1, node1)) :: (pair2 as (_, node2)) :: rest) =
                  (
                    if canFallThrough instr1
                    then G.mk_edge {from=node1, to=node2}
                    else ();
                    addSeqInstr (pair2 :: rest)
                  )
              | addSeqInstr _ = ()

            (* #NOTE: dealing w jump cases *)
            fun addJumpEdges (Assem.OPER {jump = SOME labels, ...}, node) =
                  let
                      fun addOne label =
                          case Symbol.look(labelMap, label) of
                              SOME target => G.mk_edge {from=node, to=target}
                            | NONE => ()
                  in
                      List.app addOne labels
                  end
              | addJumpEdges (_, _) = ()

            val _ = addSeqInstr instrNodePairs
            val _ = List.app addJumpEdges instrNodePairs

            val finalFlowGraph =
                F.FGRAPH
                  { control = control,
                    def = !defVals,
                    use = !useVals,
                    ismove = !ismoveVals }
        in
            (* #NOTE: prints the entire graph we constructed. can comment out if this becomes annoying lol. *)
            PrintGraph.printGraph finalFlowGraph;
            (finalFlowGraph, nodes)
        end

end