(* graph: interference graph *)
(* tnode: mapping from temps of the Assem program to graph nodes *)
(* gtemp: inverse mapping, graph nodes to temps *)
(* moves: list of move insns *)
structure Liveness :
sig
    datatype igraph =
        IGRAPH of {
            graph : Graph.graph,
            tnode : Temp.temp -> Graph.node,
            gtemp : Graph.node -> Temp.temp,
            moves : (Graph.node * Graph.node) list
        }

    val interferenceGraph :
        Flow.flowgraph ->
        igraph * (Graph.node -> Temp.temp list)

    (* #NOTE: for debugging only rlly *)
    val show : TextIO.outstream * igraph -> unit
end
=
struct
    (* #NOTE: we need two things here. 1) compute liveness at every node in the flowGraph. 2) construct interference graph based on liveness *)
    structure G = Graph
    structure T = Temp
    structure F = Flow

    datatype igraph =
        IGRAPH of {
            graph : G.graph,
            tnode : T.temp -> G.node,
            gtemp : G.node -> T.temp,
            moves : (G.node * G.node) list
        }

    (* #NOTE: data structure to hold temps for live in and live outs *)
    type tempHolder = T.temp list

    (* #NOTE: helper functions *)
    fun isSetMember (x, []) = false
      | isSetMember (x, y :: ys) = (x = y) orelse isSetMember (x, ys)

    fun addSet (x, s) =
        if isSetMember (x, s) then s else x :: s

    fun union ([], s2) = s2
      | union (x :: xs, s2) = union(xs, addSet(x, s2))

    fun diffSets ([], _) = []
      | diffSets (value :: vals, set2) =
            if isSetMember(value, set2) then diffSets(vals, set2)
            else value :: diffSets(vals, set2)

    fun subset ([], _) = true
    | subset (x :: xs, ys) =
            isSetMember(x, ys) andalso subset(xs, ys)

    fun sameSets (set1, set2) =
        subset(set1, set2) andalso subset(set2, set1)

    fun sameLiveMap (liveMap1, liveMap2) =
        let
            fun subset ([], _) = true
              | subset (x :: xs, s) = isSetMember(x, s) andalso subset(xs, s)
        in
            subset(liveMap1, liveMap2) andalso subset(liveMap2, liveMap1)
        end

    fun lookupTable (table, node) =
        case G.Table.look(table, node) of
            SOME x => x
          | NONE => []

(* #NOTE: PART ONEEEEE: compute liveness. we can use our dataflow eqs here. oh also, need to iterate to fixed point in reverse order *)

    fun computeLiveness (flowGraph : F.flowgraph)
        : (tempHolder G.Table.table * tempHolder G.Table.table) =
        let
            val F.FGRAPH {control, def, use, ismove} = flowGraph
            val nodes = G.nodes control

            val liveInMap : tempHolder G.Table.table ref = ref G.Table.empty
            val liveOutMap : tempHolder G.Table.table ref = ref G.Table.empty

            fun addNodesInitially [] = ()
            | addNodesInitially (node :: nodes) =
                (
                    liveInMap := G.Table.enter(!liveInMap, node, []);
                    liveOutMap := G.Table.enter(!liveOutMap, node, []);
                    addNodesInitially nodes
                )

            fun liveInSuccNodes [] = []
              | liveInSuccNodes (successor :: successors) =
                union(lookupTable(!liveInMap, successor), liveInSuccNodes successors)

            fun updateNode node =
                let
                    val oldLiveIn = lookupTable(!liveInMap, node)
                    val oldLiveOut = lookupTable(!liveOutMap, node)

                    val useVals =
                        case G.Table.look(use, node) of
                            SOME useVal => useVal
                          | NONE => []

                    val defVals =
                        case G.Table.look(def, node) of
                            SOME useVal => useVal
                          | NONE => []

                    val succs = G.succ node

                    val newLiveOut = liveInSuccNodes succs
                    val newLiveIn = union(useVals, diffSets(newLiveOut, defVals))

                    val changed =
                        not (sameSets(oldLiveIn, newLiveIn)) orelse
                        not (sameSets(oldLiveOut, newLiveOut))
                in
                    liveInMap := G.Table.enter(!liveInMap, node, newLiveIn);
                    liveOutMap := G.Table.enter(!liveOutMap, node, newLiveOut);
                    changed
                end

            fun iterToFixedPoint () =
                let
                    fun loop [] changed = changed
                      | loop (node :: nodes) changed =
                        loop nodes (updateNode node orelse changed)
                in
                    if loop nodes false
                        then iterToFixedPoint() 
                        else ()
                end
        in
            addNodesInitially nodes;
            iterToFixedPoint();
            (!liveInMap, !liveOutMap)
        end
    
    (* #NOTE: PART TWOOO: construct interference graph. basically connect two nodes (registers) if live at same time.  *)
    fun interferenceGraph (flowgraph : F.flowgraph)
        : igraph * (G.node -> T.temp list) =
        let
            val Flow.FGRAPH {control, def, use, ismove} = flowgraph
            val nodes = G.nodes control

            val (liveInMap, liveOutMap) = computeLiveness flowgraph

            val iGraph = G.newGraph()

            val tempToNodeMap : G.node T.Table.table ref = ref T.Table.empty
            val nodeToTempMap : T.temp G.Table.table ref = ref G.Table.empty
            val moves : (G.node * G.node) list ref = ref []

            fun insertTemp temp =
                case T.Table.look(!tempToNodeMap, temp) of
                    SOME node => node
                | NONE =>
                    let
                        val nodeVal = G.newNode iGraph
                    in
                        tempToNodeMap := T.Table.enter(!tempToNodeMap, temp, nodeVal);
                        nodeToTempMap := G.Table.enter(!nodeToTempMap, nodeVal, temp);
                        nodeVal
                    end

            fun getNodeFromTemp temp =
                case T.Table.look(!tempToNodeMap, temp) of
                    SOME node => node
                | NONE => insertTemp temp

            fun getTempFromNode node =
                case G.Table.look(!nodeToTempMap, node) of
                    SOME temp => temp
                | NONE => raise Fail "getTempFromNode Failure: node not found"

            fun totalTemps [] acc = acc
            | totalTemps (node :: rest) acc =
                let
                    val defs =
                        case G.Table.look(def, node) of
                            SOME defsMapping => defsMapping
                        | NONE => []

                    val uses =
                        case G.Table.look(use, node) of
                            SOME usesMapping => usesMapping
                        | NONE => []
                in
                    totalTemps rest (union(defs, union(uses, acc)))
                end

            val allTemps = totalTemps nodes []
            
            val _ = List.app (fn temp => ignore (insertTemp temp)) allTemps

            fun hasEdge (a, b) =
                List.exists (fn x => G.eq(x, b)) (G.succ a)

        fun addEdge (a, b) =
            if G.eq(a, b) then ()
            else (
                if not (hasEdge (a, b)) then G.mk_edge {from = a, to = b} else ();
                if not (hasEdge (b, a)) then G.mk_edge {from = b, to = a} else ()
            )

            fun addInterferenceForDef (defTemp, liveTemps, skipTemps) =
                let
                    val defNode = getNodeFromTemp defTemp

                    fun loop [] = ()
                    | loop (temp :: temps) =
                        (
                            if isSetMember(temp, skipTemps) then ()
                            else addEdge(defNode, getNodeFromTemp temp);
                            loop temps
                        )
                in
                    loop liveTemps
                end

            fun processNode node =
                let
                    val defs =
                        case G.Table.look(def, node) of
                            SOME defVals => defVals
                        | NONE => []

                    val uses =
                        case G.Table.look(use, node) of
                            SOME useVals => useVals
                        | NONE => []

                    val liveOut = lookupTable(liveOutMap, node)

                    val isMoveInstr =
                        case G.Table.look(ismove, node) of
                            SOME moveVal => moveVal
                        | NONE => false
                in
                    if isMoveInstr then
                        (
                            case (defs, uses) of
                                ([dst], [src]) =>
                                    let
                                        val dstNode = getNodeFromTemp dst
                                        val srcNode = getNodeFromTemp src
                                        val _ = moves := (srcNode, dstNode) :: !moves
                                        val liveMinusSrc = diffSets(liveOut, [src])
                                    in
                                        addInterferenceForDef(dst, liveMinusSrc, [])
                                    end
                            | _ =>
                                    List.app (fn def => addInterferenceForDef(def, liveOut, [])) defs
                        )
                    else
                        List.app (fn def => addInterferenceForDef(def, liveOut, [])) defs
                end

            val _ = List.app processNode nodes

            fun liveOutValues node = lookupTable(liveOutMap, node)
        in
            (
                IGRAPH {
                    graph = iGraph,
                    tnode = getNodeFromTemp,
                    gtemp = getTempFromNode,
                    moves = !moves
                },
                liveOutValues
            )
        end

    (* #NOTE: for debugging liveness code. should vis the interference graph. *)
    fun show (out, IGRAPH {graph, gtemp, moves, ...}) =
        let
            val nodes = G.nodes graph

            fun say s = TextIO.output(out, s)

            fun showTemp t =
                say (T.makestring t)

            fun showTempList [] = ()
              | showTempList [t] = showTemp t
              | showTempList (t :: ts) =
                (
                    showTemp t;
                    say ", ";
                    showTempList ts
                )

            fun succTemps n =
                List.map gtemp (G.succ n)

            fun showNode n =
                (
                    showTemp (gtemp n);
                    say " -> {";
                    showTempList (succTemps n);
                    say "}\n"
                )

            fun showMove (a, b) =
                (
                    say "move: ";
                    showTemp (gtemp a);
                    say " <- ";
                    showTemp (gtemp b);
                    say "\n"
                )
        in
            say "Interference graph:\n";
            List.app showNode nodes;
            say "\nMoves:\n";
            List.app showMove moves
        end
end