structure MakeGraphTest2 =
struct
    structure G = Graph
    structure A = Assem
    structure T = Temp
    structure F = Flow

    exception TestFail of string

    fun assertTrue (msg, b) =
        if b then ()
        else raise TestFail msg

    fun containsNode (target, lst) =
        List.exists (fn n => G.eq(n, target)) lst

    fun assertEdge (msg, fromNode, toNode) =
        assertTrue (msg, containsNode (toNode, G.succ fromNode))

    fun run () =
        let
            val t1 = T.newtemp()
            val t2 = T.newtemp()
            val t3 = T.newtemp()

            val l1 = T.newLabel()

            val instrs =
                [ A.OPER {assem="beq `s0, `s1, `j0\n",
                          dst=[], src=[t1,t2], jump=SOME [l1]}

                , A.OPER {assem="add `d0, `s0, `s1\n",
                          dst=[t3], src=[t1,t2], jump=NONE}

                , A.LABEL {assem=Symbol.name l1 ^ ":\n", lab=l1}

                , A.OPER {assem="sub `d0, `s0, `s1\n",
                          dst=[t1], src=[t3,t2], jump=NONE}
                ]

            val (flowgraph, nodes) = MakeGraph.instrs2graph instrs
            val F.FGRAPH {control, ...} = flowgraph

            val n0 = List.nth(nodes, 0)   (* beq *)
            val n1 = List.nth(nodes, 1)   (* add *)
            val n2 = List.nth(nodes, 2)   (* label *)
            val n3 = List.nth(nodes, 3)   (* sub *)

        in
            (* For a conditional branch, both of these should exist *)
            assertEdge ("beq should fall through to add", n0, n1);
            assertEdge ("beq should jump to label", n0, n2);

            assertEdge ("add should fall through to label", n1, n2);
            assertEdge ("label should fall through to sub", n2, n3);

            print "MakeGraph conditional-jump test passed.\n"
        end
end