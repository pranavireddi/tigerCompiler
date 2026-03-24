(* #NOTE: creating a frame abstraction so that we can use this across different machine types. *)

signature FRAME = 

sig type frame

(* #NOTE: so access can represent where the var will be (registers or from like FP offset) *)
  type access
  val newFrame: {name: Temp.label, formals: bool list} -> frame
  val name : frame -> Temp.label
  val formals: frame -> access list
  val allocLocal: frame -> bool -> access

  val FP : Temp.temp
  val wordSize : int
  val exp : access -> Tree.exp -> Tree.exp (* used to *)


end
