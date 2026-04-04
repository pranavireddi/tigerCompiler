(* Manages spilling and calls up Color as a subroutine *)
signature REG_ALLOC =
sig
    structure Frame : FRAME
    type allocation = Frame.register Temp.Table.table
    val alloc : Assem.instr list * Frame.frame -> Assem.instr list * allocation
end

structure RegAlloc : REG_ALLOC =
struct

structure Frame = MipsFrame
