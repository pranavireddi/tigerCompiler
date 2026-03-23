(* #NOTE: creating a frame abstraction so that we can use this across different machine types. *)
structure Tr = Tree

signature FRAME = 

sig type frame

(* #NOTE: so access can represent where the var will be (registers or from like FP offset) *)
  type access
  val newFrame: {name: Temp.label, formals: bool list} -> frame
  val name : frame -> Temp.label
  val formals: frame -> access list
  val allocLocal: frame -> bool -> access

  val FP: Temp.temp
  val RV: Temp.temp
  val procEntryExit1 : (frame * Tr.stm) -> Tr.stm

  val exp: (access * Tr.exp) -> Tr.exp
  datatype frag = ProcFrag of {body: Tr.stm, frame: frame} 
               | StringFrag of {label: Temp.label, str: string}

  val externalCall: string * Tr.exp list -> Tr.exp

end
