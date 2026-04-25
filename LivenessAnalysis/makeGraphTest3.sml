structure MakeGraphTest3 =
struct
    structure G = Graph
    structure A = Assem
    structure T = Temp
    structure F = Flow

    exception TestFail of string

    fun assertTrue (msg, b) =
        if b then ()
        else (print ("TEST FAILED: " ^ msg ^ "\n"); raise TestFail msg)

    fun containsNode (target, lst) =
        List.exists (fn n => G.eq(n, target)) lst

    fun assertEdge (msg, fromNode, toNode) =
        assertTrue (msg, containsNode (toNode, G.succ fromNode))

    fun assertNoEdge (msg, fromNode, toNode) =
        assertTrue (msg, not (containsNode (toNode, G.succ fromNode)))

    fun run () =
        let
            val t1 = T.newtemp()
            val t2 = T.newtemp()
            val l1 = T.newLabel()

            val instrs =
                [ A.OPER {assem="j `j0\n",
                          dst=[], src=[], jump=SOME [l1]}

                , A.OPER {assem="add `d0, `s0, `s1\n",
                          dst=[t1], src=[t1,t2], jump=NONE}

                , A.LABEL {assem=Symbol.name l1 ^ ":\n", lab=l1}
                ]

            val (flowgraph, nodes) = MakeGraph.instrs2graph instrs
            val F.FGRAPH {control, ...} = flowgraph

            val n0 = List.nth(nodes, 0)
            val n1 = List.nth(nodes, 1)
            val n2 = List.nth(nodes, 2)

        in
            assertEdge ("jump should go to label", n0, n2);
            assertNoEdge ("unconditional jump should not fall through", n0, n1);

            print "MakeGraph unconditional-jump test passed.\n"
        end
end