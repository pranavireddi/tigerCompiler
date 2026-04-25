structure MakeGraphTest =
struct
    structure G = Graph
    structure A = Assem
    structure T = Temp
    structure F = Flow

    exception TestFail of string

    fun assertTrue (msg, b) =
        if b then ()
        else raise TestFail msg

    fun assertEqualInt (msg, a, b) =
        if a = b then ()
        else raise TestFail (msg ^ ": expected " ^ Int.toString b ^
                             ", got " ^ Int.toString a)

    fun containsNode (target, lst) =
        List.exists (fn n => G.eq(n, target)) lst

    fun assertEdge (msg, fromNode, toNode) =
        assertTrue (msg, containsNode (toNode, G.succ fromNode))

    fun assertNoEdge (msg, fromNode, toNode) =
        assertTrue (msg, not (containsNode (toNode, G.succ fromNode)))

    fun assertTempListEq (msg, actual, expected) =
        assertTrue (msg, actual = expected)

    fun run () =
        let
            val t1 = T.newtemp()
            val t2 = T.newtemp()
            val t3 = T.newtemp()

            val l1 = T.newLabel()

            val instrs =
                [ A.MOVE {assem="move `d0, `s0\n", dst=t1, src=t2}

                , A.OPER {assem="add `d0, `s0, `s1\n",
                          dst=[t3], src=[t1,t2], jump=NONE}

                , A.OPER {assem="beq `s0, `s1, `j0\n",
                          dst=[], src=[t1,t2], jump=SOME [l1]}

                , A.LABEL {assem=Symbol.name l1 ^ ":\n", lab=l1}

                , A.OPER {assem="sub `d0, `s0, `s1\n",
                          dst=[t1], src=[t3,t2], jump=NONE}
                ]

            val (flowgraph, nodes) = MakeGraph.instrs2graph instrs

            val F.FGRAPH {control, def, use, ismove} = flowgraph

            val n0 = List.nth(nodes, 0)
            val n1 = List.nth(nodes, 1)
            val n2 = List.nth(nodes, 2)
            val n3 = List.nth(nodes, 3)
            val n4 = List.nth(nodes, 4)

            fun lookupDef n =
                case G.Table.look(def, n) of
                    SOME xs => xs
                  | NONE => raise TestFail "missing def entry"

            fun lookupUse n =
                case G.Table.look(use, n) of
                    SOME xs => xs
                  | NONE => raise TestFail "missing use entry"

            fun lookupIsMove n =
                case G.Table.look(ismove, n) of
                    SOME b => b
                  | NONE => raise TestFail "missing ismove entry"

        in
            (* 1. node list should correspond exactly to instruction order *)
            assertEqualInt ("wrong number of nodes", length nodes, length instrs);

            (* 2. def/use/ismove checks *)
            assertTempListEq ("MOVE def wrong", lookupDef n0, [t1]);
            assertTempListEq ("MOVE use wrong", lookupUse n0, [t2]);
            assertTrue ("MOVE should be marked ismove", lookupIsMove n0);

            assertTempListEq ("add def wrong", lookupDef n1, [t3]);
            assertTempListEq ("add use wrong", lookupUse n1, [t1,t2]);
            assertTrue ("add should not be move", not (lookupIsMove n1));

            assertTempListEq ("beq def wrong", lookupDef n2, []);
            assertTempListEq ("beq use wrong", lookupUse n2, [t1,t2]);
            assertTrue ("beq should not be move", not (lookupIsMove n2));

            assertTempListEq ("label def wrong", lookupDef n3, []);
            assertTempListEq ("label use wrong", lookupUse n3, []);
            assertTrue ("label should not be move", not (lookupIsMove n3));

            (* 3. control-flow edges *)
            assertEdge ("move should fall through to add", n0, n1);
            assertEdge ("add should fall through to beq", n1, n2);

            (* conditional jump should have BOTH edges *)
            assertEdge ("beq should jump to label", n2, n3);
            assertEdge ("beq should also fall through to next instruction", n2, n3);
            (* in this specific layout, the next instruction IS the label node *)

            assertEdge ("label should fall through to sub", n3, n4);

            print "MakeGraph test passed.\n"
        end
end