structure LivenessTest =
struct
    structure G = Graph
    structure T = Temp
    structure F = Flow
    structure L = Liveness

    fun assertTrue (msg, b) =
        if b then
            print ("PASS: " ^ msg ^ "\n")
        else
            print ("FAIL: " ^ msg ^ "\n")

    fun assertSameSet (msg, xs, ys) =
        let
            fun member (x, []) = false
              | member (x, y :: ys) = (x = y) orelse member (x, ys)

            fun subset ([], _) = true
              | subset (x :: xs, ys) = member(x, ys) andalso subset(xs, ys)

            fun sameSet (a, b) = subset(a, b) andalso subset(b, a)
        in
            assertTrue (msg, sameSet(xs, ys))
        end

    fun hasEdge (graph, a, b) =
        List.exists (fn n => G.eq(n, b)) (G.succ a)

    fun runTest () =
        let
            val control = G.newGraph()

            (* temps *)
            val t1 = T.newtemp()
            val t2 = T.newtemp()
            val t3 = T.newtemp()
            val t4 = T.newtemp()
            val t5 = T.newtemp()
            val t6 = T.newtemp()

            (* flow graph nodes *)
            val n1 = G.newNode control
            val n2 = G.newNode control
            val n3 = G.newNode control

            val _ = G.mk_edge {from = n1, to = n2}
            val _ = G.mk_edge {from = n2, to = n3}

            (* def table *)
            val def0 = G.Table.empty
            val def1 = G.Table.enter(def0, n1, [t1])
            val def2 = G.Table.enter(def1, n2, [t4])
            val def3 = G.Table.enter(def2, n3, [t5])

            (* use table *)
            val use0 = G.Table.empty
            val use1 = G.Table.enter(use0, n1, [t2, t3])
            val use2 = G.Table.enter(use1, n2, [t1])       (* move: t4 := t1 *)
            val use3 = G.Table.enter(use2, n3, [t4, t6])

            (* ismove table *)
            val move0 = G.Table.empty
            val move1 = G.Table.enter(move0, n1, false)
            val move2 = G.Table.enter(move1, n2, true)
            val move3 = G.Table.enter(move2, n3, false)

            val flowgraph =
                F.FGRAPH {
                    control = control,
                    def = def3,
                    use = use3,
                    ismove = move3
                }

            val (L.IGRAPH {graph, tnode, gtemp, moves}, liveOutFn) =
                L.interferenceGraph flowgraph

            val liveOut1 = liveOutFn n1
            val liveOut2 = liveOutFn n2
            val liveOut3 = liveOutFn n3

            val t1n = tnode t1
            val t4n = tnode t4
            val t6n = tnode t6

            val _ = print "\n--- Liveness test ---\n"

            (* check liveOut sets *)
            val _ = assertSameSet ("liveOut(n3) = {}", liveOut3, [])
            val _ = assertSameSet ("liveOut(n2) = {t4,t6}", liveOut2, [t4, t6])
            val _ = assertSameSet ("liveOut(n1) = {t1,t6}", liveOut1, [t1, t6])

            (* check interference edges *)
            val _ = assertTrue ("edge t1 <-> t6", hasEdge(graph, t1n, t6n) andalso hasEdge(graph, t6n, t1n))
            val _ = assertTrue ("edge t4 <-> t6", hasEdge(graph, t4n, t6n) andalso hasEdge(graph, t6n, t4n))

            (* move info *)
            val _ = assertTrue ("one move recorded", length moves = 1)

            val _ = print "\n--- Interference graph dump ---\n"
            val _ = L.show (TextIO.stdOut, L.IGRAPH {
                graph = graph,
                tnode = tnode,
                gtemp = gtemp,
                moves = moves
            })
        in
            ()
        end
end