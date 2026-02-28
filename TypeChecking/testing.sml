fun run file =
  ( print ("Running: " ^ file ^ "\n");
    Main.main file;
    print "----------------------------------\n"
  );

(* helper to generate test1.tig ... test48.tig *)
fun makeTests n =
  List.tabulate (n, fn i =>
      "tests/positive/pos" ^ Int.toString(i+1) ^ ".tig");

fun makeTestsneg n =
  List.tabulate (n, fn i =>
      "tests/negative/neg" ^ Int.toString(i+1) ^ ".tig");

val numberedTests = makeTests 20;
val negTests = makeTestsneg 27;

val allTests = negTests @ numberedTests;

List.app run allTests;