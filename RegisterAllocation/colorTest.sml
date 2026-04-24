structure ColorTest =
struct
  structure G = Graph
  structure T = Temp
  structure L = Liveness
  structure C = Color

  fun assert msg b =
    if b then print ("PASS: " ^ msg ^ "\n")
    else print ("FAIL: " ^ msg ^ "\n")

  fun testTwoInterfere () =
    let
      val g = G.newGraph()

      val t1 = T.newtemp()
      val t2 = T.newtemp()

      val n1 = G.newNode g
      val n2 = G.newNode g

      val _ = G.mk_edge {from=n1, to=n2}

      val tnode =
        T.Table.enter(
          T.Table.enter(T.Table.empty, t1, n1),
          t2, n2
        )

      val gtemp =
        G.Table.enter(
          G.Table.enter(G.Table.empty, n1, t1),
          n2, t2
        )

      fun lookupGTemp n =
        case G.Table.look(gtemp, n) of
          SOME t => t
        | NONE => raise Fail "missing gtemp"

      val igraph =
        L.IGRAPH {
          graph = g,
          tnode = fn t =>
            (case T.Table.look(tnode, t) of
               SOME n => n
             | NONE => raise Fail "missing tnode"),
          gtemp = lookupGTemp,
          moves = []
        }

      val (alloc, spills) =
        C.color {
          interference = igraph,
          initial = MipsFrame.tempMap,
          spillCost = fn _ => 1,
          registers = ["$t0", "$t1"]
        }

      val c1 = T.Table.look(alloc, t1)
      val c2 = T.Table.look(alloc, t2)
    in
      assert "no spills" (null spills);
      assert "both temps colored" (Option.isSome c1 andalso Option.isSome c2);
      assert "interfering temps get different registers" (c1 <> c2)
    end

    
end