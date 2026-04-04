(* #NOTE: creating a frame abstraction so that we can use this across different machine types. *)

signature FRAME = 

sig type frame

(* #NOTE: so access can represent where the var will be (registers or from like FP offset) *)
  type access
  val newFrame: {name: Temp.label, formals: bool list} -> frame
  val name : frame -> Temp.label
  val formals: frame -> access list
  val allocLocal: frame -> bool -> access

  val wordSize: int

  val FP: Temp.temp
  val RV: Temp.temp
  val SP: Temp.temp
  val RA: Temp.temp

  val procEntryExit1 : (frame * Tree.stm) -> Tree.stm
  val procEntryExit2 : frame * Assem.instr list -> Assem.instr list
  val procEntryExit3 : frame * Assem.instr list -> {prolog: string, body: Assem.instr list, epilog: string}
  
  val string : Temp.label * string -> string

  val exp: (access * Tree.exp) -> Tree.exp
  datatype frag = ProcFrag of {body: Tree.stm, frame: frame} 
               | StringFrag of {label: Temp.label, str: string}

  val externalCall: string * Tree.exp list -> Tree.exp

  type register = string
  val tempMap: register Temp.Table.table

  val specialregs : Temp.temp list
  val argregs : Temp.temp list
  val calleesaves : Temp.temp list
  val callersaves : Temp.temp list
end
