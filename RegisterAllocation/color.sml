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

            fun select [] = ()
                | select (n::nodes) =
                    let val used = List.foldl (fn (m,l) => 
                            case Temp.Table.look(!colorMap, gtemp m) of
                                SOME color => color::l
                                | NONE => l)
                            [] (G.adj n)
               
                        val avail = List.find (fn reg => not (List.exists (fn m => m = reg) used)) registers
                    in
                        case avail of
                            SOME color => colorMap := Temp.Table.enter(!colorMap, gtemp n, color)
                            | NONE => spills := gtemp n :: !spills;
                        select nodes
                    end
        in
            simplify();
            (* coalesce(); *)
            print ("stack size = " ^ Int.toString(length(!stack)) ^ "\n");
            select(!stack);
            (!colorMap, !spills)
        end
    end