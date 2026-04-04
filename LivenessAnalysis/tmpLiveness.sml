structure Liveness :
sig
  datatype igraph =
      IGRAPH of {
        graph : Graph.graph,
        tnode : Temp.temp -> Graph.node,
        gtemp : Graph.node -> Temp.temp,
        moves : (Graph.node * Graph.node) list
      }

  val interferenceGraph : Flow.flowgraph -> igraph
end
=
struct
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

  (* ------------------------------------------------------ *)
  (* Temp set helpers                                        *)
  (* ------------------------------------------------------ *)

  type tempset = T.temp list

  fun member (_, []) = false
    | member (x, y :: ys) = (x = y) orelse member (x, ys)

  fun add (x, s) =
      if member (x, s) then s else x :: s

  fun union ([], s2) = s2
    | union (x :: xs, s2) = union (xs, add (x, s2))

  fun diff ([], _) = []
    | diff (x :: xs, s2) =
        if member (x, s2) then diff (xs, s2)
        else x :: diff (xs, s2)

  fun equal (s1, s2) =
      let
        fun subset ([], _) = true
          | subset (x :: xs, s) = member (x, s) andalso subset (xs, s)
      in
        subset (s1, s2) andalso subset (s2, s1)
      end

  fun unionList sets =
      foldl union [] sets

  (* ------------------------------------------------------ *)
  (* Helpers for Flow graph                                  *)
  (* ------------------------------------------------------ *)

  fun defOf (flowgraph : F.flowgraph) (n : G.node) : T.temp list =
      let
        val (_, def, _, _) = flowgraph
      in
        case G.Table.look(def, n) of
            SOME ts => ts
          | NONE => []
      end

  fun useOf (flowgraph : F.flowgraph) (n : G.node) : T.temp list =
      let
        val (_, _, use, _) = flowgraph
      in
        case G.Table.look(use, n) of
            SOME ts => ts
          | NONE => []
      end

  fun isMoveOf (flowgraph : F.flowgraph) (n : G.node) : bool =
      let
        val (_, _, _, ismove) = flowgraph
      in
        case G.Table.look(ismove, n) of
            SOME b => b
          | NONE => false
      end

  fun succsOf (n : G.node) : G.node list =
      G.succ n

  fun nodesOf (flowgraph : F.flowgraph) : G.node list =
      let
        val (control, _, _, _) = flowgraph
      in
        G.nodes control
      end

  (* ------------------------------------------------------ *)
  (* in/out tables                                            *)
  (* ------------------------------------------------------ *)

  fun solveLiveness (flowgraph : F.flowgraph)
      : (tempset G.Table.table * tempset G.Table.table) =
      let
        val nodes = nodesOf flowgraph

        val inTable  = ref G.Table.empty
        val outTable = ref G.Table.empty

        fun getIn n =
            case G.Table.look(!inTable, n) of
                SOME s => s
              | NONE => []

        fun getOut n =
            case G.Table.look(!outTable, n) of
                SOME s => s
              | NONE => []

        fun setIn (n, s) =
            inTable := G.Table.enter(!inTable, n, s)

        fun setOut (n, s) =
            outTable := G.Table.enter(!outTable, n, s)

        fun init [] = ()
          | init (n :: ns) =
              (setIn (n, []);
               setOut (n, []);
               init ns)

        fun processNode (n, changed) =
            let
              val oldIn = getIn n
              val oldOut = getOut n

              val useN = useOf flowgraph n
              val defN = defOf flowgraph n

              val newOut =
                  unionList (map getIn (succsOf n))

              val newIn =
                  union (useN, diff (newOut, defN))

              val didChange =
                  (not (equal (oldIn, newIn)))
                  orelse
                  (not (equal (oldOut, newOut)))
            in
              (setIn (n, newIn);
               setOut (n, newOut);
               changed orelse didChange)
            end

        fun iterate () =
            let
              val changed = foldl processNode false nodes
            in
              if changed then iterate ()
              else ()
            end
      in
        init nodes;
        iterate ();
        (!inTable, !outTable)
      end

  (* ------------------------------------------------------ *)
  (* Interference graph helpers                              *)
  (* ------------------------------------------------------ *)

  fun interferenceGraph (flowgraph : F.flowgraph) : igraph =
      let
        val nodes = nodesOf flowgraph
        val (_, outTable) = solveLiveness flowgraph

        val igraph = G.newGraph ()

        val tempToNode = ref ([] : (T.temp * G.node) list)
        val nodeToTemp = ref ([] : (G.node * T.temp) list)

        fun lookupTempNode [] t = NONE
          | lookupTempNode ((t', n) :: rest) t =
              if t = t' then SOME n else lookupTempNode rest t

        fun lookupNodeTemp [] n = NONE
          | lookupNodeTemp ((n', t) :: rest) n0 =
              if n0 = n' then SOME t else lookupNodeTemp rest n0

        fun ensureTempNode (t : T.temp) : G.node =
            case lookupTempNode (!tempToNode) t of
                SOME n => n
              | NONE =>
                  let
                    val n = G.newNode igraph
                  in
                    tempToNode := (t, n) :: !tempToNode;
                    nodeToTemp := (n, t) :: !nodeToTemp;
                    n
                  end

        fun tnode t = ensureTempNode t

        fun gtemp n =
            case lookupNodeTemp (!nodeToTemp) n of
                SOME t => t
              | NONE => raise Fail "gtemp: node not found"

        fun getOut n =
            case G.Table.look(outTable, n) of
                SOME s => s
              | NONE => []

        fun addEdgeTemps (t1, t2) =
            if t1 = t2 then ()
            else
              let
                val n1 = ensureTempNode t1
                val n2 = ensureTempNode t2
              in
                G.mk_edge {from = n1, to = n2};
                G.mk_edge {from = n2, to = n1}
              end

        val moves = ref ([] : (G.node * G.node) list)

        fun addAllTemps [] = ()
          | addAllTemps (t :: ts) =
              (ensureTempNode t; addAllTemps ts)

        fun addNodeInfo n =
            let
              val defN = defOf flowgraph n
              val useN = useOf flowgraph n
              val outN = getOut n
              val isMove = isMoveOf flowgraph n

              val _ = addAllTemps defN
              val _ = addAllTemps useN
              val _ = addAllTemps outN

              fun addDefInterference [] = ()
                | addDefInterference (d :: ds) =
                    let
                      val conflictSet =
                          if isMove
                          then diff (outN, useN)
                          else outN

                      fun addAgainst [] = ()
                        | addAgainst (t :: ts) =
                            (addEdgeTemps (d, t);
                             addAgainst ts)
                    in
                      addAgainst conflictSet;
                      addDefInterference ds
                    end

              fun recordMove () =
                  case (defN, useN) of
                      ([dst], [src]) =>
                        moves := (tnode dst, tnode src) :: !moves
                    | _ => ()
            in
              addDefInterference defN;
              if isMove then recordMove() else ()
            end

        val _ = List.app addNodeInfo nodes
      in
        IGRAPH {
          graph = igraph,
          tnode = tnode,
          gtemp = gtemp,
          moves = !moves
        }
      end

end