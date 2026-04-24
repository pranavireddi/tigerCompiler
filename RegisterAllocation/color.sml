(* Does the graph coloring *)
(* Given an interference graph, produces an extension of the precoloring and assigns all temps used in the flow graph *)
signature COLOR =
sig
    structure Frame : FRAME

    type allocation = Frame.register Temp.Table.table

    (* spillcost: specifies filling cost of each temp *)
    (* initial: Frame.tempMap provdied by Frame, initial precoloring of temps *)
    (* registers: list of all machine registers *)

    val color: {interference: Liveness.igraph, 
                initial: allocation,
                spillCost: Graph.node -> int,
                registers: Frame.register list}
                -> allocation * Temp.temp list
end

structure Color : COLOR =
struct

    structure Frame = MipsFrame
    structure G = Graph
    structure L = Liveness

    type allocation = Frame.register Temp.Table.table
    
    fun color {interference = L.IGRAPH{graph, tnode, gtemp, moves}, initial, spillCost, registers} =
        let val K = length registers
            val stack = ref []
            val colorMap = ref initial
            val spills = ref []

            fun isPrecolored n =
                case Temp.Table.look(initial, gtemp n) of
                    SOME _ => true
                    | NONE => false

            fun isInGraph n =
                not (isPrecolored n) andalso
                not (List.exists (fn a => G.eq(n,a)) (!stack))

            fun simplify () = 
                case List.find (fn n => isInGraph n andalso length (List.filter isInGraph (G.adj n)) < K) (G.nodes graph) of
                    SOME n => (stack := n :: !stack; simplify ())
                    | NONE => ()

            and coalesce () =
                let fun briggs (u, v) =
                        let val uAdj = G.adj u
                            val vAdj = G.adj v
                            val combined = List.filter (fn n => not(G.eq(n,u)) andalso not (G.eq(n,v))) (uAdj @ vAdj)
                        in
                            length combined < K
                        end

                    fun george (u, v) = false

                    fun canCoalesce (u, v) =
                        not (isPrecolored u) andalso
                        not (isPrecolored v) andalso
                        not (G.eq(u,v)) andalso
                        not (List.exists (fn n => G.eq(n, u)) (G.adj v)) andalso
                        (briggs (u,v) orelse george (u,v))

                    fun doCoalesce (u, v) =
                        (List.app (fn n =>
                            if not (List.exists (fn m => G.eq(m, n)) (G.adj u)) andalso not (G.eq(u, n))
                            then G.mk_edge {from=u, to=n}
                            else ()) (G.adj v);
                        stack := v :: !stack)

                    fun tryCoalesce [] = false
                        | tryCoalesce ((u,v)::l) = 
                                if canCoalesce (u,v) 
                                then (doCoalesce (u,v); true)
                                else tryCoalesce l

                        and coalesce () =
                            if tryCoalesce moves
                            then (simplify (); coalesce ())
                            else ()
                in
                    tryCoalesce moves
                end

            fun select [] = ()
                | select (n::nodes) =
                    let val used = List.foldl (fn (m,l) => 
                            case Temp.Table.look(!colorMap, gtemp m) of
                                SOME color => color::l
                                | NONE => l)
                            [] (G.adj n)
               
                        val avail = List.find (fn reg => not (List.exists (fn m => m = reg) used)) registers
                    in
                        (case avail of
                            SOME color => colorMap := Temp.Table.enter(!colorMap, gtemp n, color)
                            | NONE => spills := gtemp n :: !spills);
                        select nodes
                    end
        in
            simplify();
            coalesce();
            print ("stack size = " ^ Int.toString(length(!stack)) ^ "\n");
            select(!stack);
            (!colorMap, !spills)
        end
    end