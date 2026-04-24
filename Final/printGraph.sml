structure PrintGraph =
struct
    structure G = Graph
    structure F = Flow
    structure T = Temp

    fun boolToString b =
        if b then "true" else "false"

    fun tempToString t =
        T.makestring t

    fun tempListToString temps =
        case temps of
            [] => ""
          | _ =>
                String.concatWith " "
                    (List.map tempToString temps)

    fun nodeListToString nodes =
        case nodes of
            [] => ""
          | _ =>
                String.concatWith " "
                    (List.map (fn n => (G.nodename n)) nodes)

    fun lookupDef defTable node =
        case G.Table.look(defTable, node) of
            SOME xs => xs
          | NONE => []

    fun lookupUse useTable node =
        case G.Table.look(useTable, node) of
            SOME xs => xs
          | NONE => []

    fun lookupIsMove ismoveTable node =
        case G.Table.look(ismoveTable, node) of
            SOME b => b
          | NONE => false

    fun printNode (defTable, useTable, ismoveTable) node =
        let
            val nodeName = G.nodename node
            val defs = lookupDef defTable node
            val uses = lookupUse useTable node
            val isMove = lookupIsMove ismoveTable node
            val succs = G.succ node
        in
            print ("Node " ^ nodeName ^ ":\n");
            print ("  def: " ^ tempListToString defs ^ "\n");
            print ("  use: " ^ tempListToString uses ^ "\n");
            print ("  ismove: " ^ boolToString isMove ^ "\n");
            print ("  succ: " ^ nodeListToString succs ^ "\n");
            print "\n"
        end

    fun printEdges control =
        let
            val nodes = G.nodes control

            fun printFrom node =
                let
                    val fromName = G.nodename node
                    val succs = G.succ node
                in
                    List.app
                        (fn succ =>
                            print (fromName ^ " -> " ^
                                   (G.nodename succ) ^ "\n"))
                        succs
                end
        in
            print "Edges:\n";
            List.app printFrom nodes;
            print "\n"
        end

    fun printGraph (F.FGRAPH {control, def, use, ismove}) =
        let
            val nodes = G.nodes control
        in
            print "Flow graph:\n\n";
            List.app (printNode (def, use, ismove)) nodes;
            printEdges control
        end

    fun printMakeGraphResult (flowgraph, nodes) =
        let
            fun printInstrOrder [] = ()
              | printInstrOrder (n :: rest) =
                    (
                        print ("  " ^ (G.nodename n) ^ "\n");
                        printInstrOrder rest
                    )
        in
            printGraph flowgraph;
            print "Instruction-order nodes:\n";
            printInstrOrder nodes;
            print "\n"
        end
end