fun endsWith suffix s =
  let
    val n = size s
    val m = size suffix
  in
    n >= m andalso String.substring(s, n - m, m) = suffix
  end;

fun runAll path =
  let
    val dir = OS.FileSys.openDir path

    fun collect acc =
      case OS.FileSys.readDir dir of
           NONE => acc
         | SOME file => collect (file :: acc)

    val files = collect []
    val _ = OS.FileSys.closeDir dir

    val tigFiles = List.filter (endsWith ".tig") files

    val sorted =
      ListMergeSort.sort (fn (a, b) => a < b) tigFiles

    fun run [] = ()
      | run (f::fs) =
          (
            print ("Running " ^ f ^ "\n");
            (Main.main (path ^ "/" ^ f)
             handle _ => print ("Error in " ^ f ^ "\n"));
            run fs
          )

  in
    run sorted
  end;