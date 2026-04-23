(* #NOTE: so like translate takes our type-checked AST and makes frags which represent our IR trees (mipsFrame is used here to determine where things are stored)
 We then do like unEx or UnNx to convert the IR trees to like the Tree.exp. This Tree.Exp then can be converted to assembly. 
ahhhh soooo many complex connections lol. *)
structure MipsFrame: FRAME = 
struct 

    structure Tr = Tree
    structure A = Assem

    type register = string

    val ZERO = Temp.newtemp()
    val AT   = Temp.newtemp() (* assembler temporary *)
    val V0   = Temp.newtemp()
    val V1   = Temp.newtemp()
    val a0 = Temp.newtemp()
    val a1 = Temp.newtemp()
    val a2 = Temp.newtemp()
    val a3 = Temp.newtemp()
    val t0 = Temp.newtemp()
    val t1 = Temp.newtemp()
    val t2 = Temp.newtemp()
    val t3 = Temp.newtemp()
    val t4 = Temp.newtemp()
    val t5 = Temp.newtemp()
    val t6 = Temp.newtemp()
    val t7 = Temp.newtemp()
    val t8 = Temp.newtemp()
    val t9 = Temp.newtemp()
    val s0 = Temp.newtemp()
    val s1 = Temp.newtemp()
    val s2 = Temp.newtemp()
    val s3 = Temp.newtemp()
    val s4 = Temp.newtemp()
    val s5 = Temp.newtemp()
    val s6 = Temp.newtemp()
    val s7 = Temp.newtemp()
    val k0 = Temp.newtemp()
    val k1 = Temp.newtemp()
    val GP = Temp.newtemp()
    val SP = Temp.newtemp()
    val FP = Temp.newtemp()
    val RA = Temp.newtemp()
    val RV = V0

    val specialregs  = [ZERO, AT, V0, V1, GP, SP, FP, RA, k0, k1]
    val argregs      = [a0, a1, a2, a3]
    val calleesaves  = [s0, s1, s2, s3, s4, s5, s6, s7]
    val callersaves  = [t0, t1, t2, t3, t4, t5, t6, t7, t8, t9]
    val registers : register list =
        ["$s0","$s1","$s2","$s3","$s4","$s5","$s6","$s7",
        "$t0","$t1","$t2","$t3","$t4","$t5","$t6","$t7","$t8","$t9",
        "$a0","$a1","$a2","$a3"]
    val tempMap =
        foldl (fn ((temp, name), table) => Temp.Table.enter(table, temp, name))
            Temp.Table.empty
            [(ZERO, "$zero"), (AT, "$at"),   (V0, "$v0"),  (V1, "$v1"),
            (a0,   "$a0"),   (a1, "$a1"),   (a2, "$a2"),  (a3, "$a3"),
            (t0,   "$t0"),   (t1, "$t1"),   (t2, "$t2"),  (t3, "$t3"),
            (t4,   "$t4"),   (t5, "$t5"),   (t6, "$t6"),  (t7, "$t7"),
            (t8,   "$t8"),   (t9, "$t9"),
            (s0,   "$s0"),   (s1, "$s1"),   (s2, "$s2"),  (s3, "$s3"),
            (s4,   "$s4"),   (s5, "$s5"),   (s6, "$s6"),  (s7, "$s7"),
            (k0,   "$k0"),   (k1, "$k1"),
            (GP,   "$gp"),   (SP, "$sp"),   (FP, "$fp"),  (RA, "$ra")]

    val wordSize = 4
    val k = 4
    datatype access = InFrame of int | InReg of Temp.temp
    type frame = {name: Temp.label, formals: access list, localOffset: int ref}

    (* #NOTE: procFrag is for procedures and stringFrag for string into data sections *)
    datatype frag = ProcFrag of {body: Tr.stm, frame: frame} 
              | StringFrag of {label: Temp.label, str: string}

    (* fun procEntryExit1 (frame, body) = body *)
    fun procEntryExit1 ({name, formals, localOffset}: frame, body) =
        let
            val argRegs = [a0, a1, a2, a3]

            fun moveFormals ([], _) = []
            | moveFormals (_, []) = []
            | moveFormals (InFrame offset :: rest, reg :: regs) =
                    Tr.MOVE(
                        Tr.MEM(Tr.BINOP(Tr.PLUS, Tr.TEMP FP, Tr.CONST offset)),
                        Tr.TEMP reg
                    ) :: moveFormals(rest, regs)
            | moveFormals (InReg t :: rest, reg :: regs) =
                    Tr.MOVE(Tr.TEMP t, Tr.TEMP reg) :: moveFormals(rest, regs)

            val moves = moveFormals(formals, argRegs)

            fun seq [] = Tr.EXP(Tr.CONST 0)
            | seq [s] = s
            | seq (s :: rest) = Tr.SEQ(s, seq rest)
        in
            case moves of
                [] => body
            | _  => Tr.SEQ(seq moves, body)
        end

    fun procEntryExit2 (frame, body) =
        body @ [A.OPER{assem="",
                        src=[V0, SP, FP] @ calleesaves,
                        dst=[RA],
                        jump=SOME[]}]

    (* fun procEntryExit3 ({name,formals,localOffset},body) =
        {prolog = "PROCEDURE " ^ Symbol.name name ^ "\n",
        body = body,
        epilog = "END " ^ Symbol.name name ^ "\n"} *)
    fun procEntryExit3 ({name, formals, localOffset}, body) =
    let
        val saveArea = 40  (* ra + fp + s0-s7 *)
        val frameSize = ~(!localOffset) + saveArea

        val prologInstrs = [
            A.LABEL{assem=".globl " ^ Symbol.name name ^ "\n" ^
                        Symbol.name name ^ ":\n", lab=name},
            A.OPER{assem="addi $sp, $sp, -" ^ Int.toString frameSize ^ "\n",
                   src=[SP], dst=[SP], jump=NONE},
            A.OPER{assem="sw $ra, 0($sp)\n", src=[RA,SP], dst=[], jump=NONE},
            A.OPER{assem="sw $fp, 4($sp)\n", src=[FP,SP], dst=[], jump=NONE},
            A.OPER{assem="sw $s0, 8($sp)\n",  src=[s0,SP], dst=[], jump=NONE},
            A.OPER{assem="sw $s1, 12($sp)\n", src=[s1,SP], dst=[], jump=NONE},
            A.OPER{assem="sw $s2, 16($sp)\n", src=[s2,SP], dst=[], jump=NONE},
            A.OPER{assem="sw $s3, 20($sp)\n", src=[s3,SP], dst=[], jump=NONE},
            A.OPER{assem="sw $s4, 24($sp)\n", src=[s4,SP], dst=[], jump=NONE},
            A.OPER{assem="sw $s5, 28($sp)\n", src=[s5,SP], dst=[], jump=NONE},
            A.OPER{assem="sw $s6, 32($sp)\n", src=[s6,SP], dst=[], jump=NONE},
            A.OPER{assem="sw $s7, 36($sp)\n", src=[s7,SP], dst=[], jump=NONE},
            A.OPER{assem="move $fp, $sp\n", src=[SP], dst=[FP], jump=NONE}
        ]

        val epilogInstrs = [
            A.OPER{assem="move $sp, $fp\n", src=[FP], dst=[SP], jump=NONE},
            A.OPER{assem="lw $s0, 8($sp)\n",  src=[SP], dst=[s0], jump=NONE},
            A.OPER{assem="lw $s1, 12($sp)\n", src=[SP], dst=[s1], jump=NONE},
            A.OPER{assem="lw $s2, 16($sp)\n", src=[SP], dst=[s2], jump=NONE},
            A.OPER{assem="lw $s3, 20($sp)\n", src=[SP], dst=[s3], jump=NONE},
            A.OPER{assem="lw $s4, 24($sp)\n", src=[SP], dst=[s4], jump=NONE},
            A.OPER{assem="lw $s5, 28($sp)\n", src=[SP], dst=[s5], jump=NONE},
            A.OPER{assem="lw $s6, 32($sp)\n", src=[SP], dst=[s6], jump=NONE},
            A.OPER{assem="lw $s7, 36($sp)\n", src=[SP], dst=[s7], jump=NONE},
            A.OPER{assem="lw $ra, 0($sp)\n", src=[SP], dst=[RA], jump=NONE},
            A.OPER{assem="lw $fp, 4($sp)\n", src=[SP], dst=[FP], jump=NONE},
            A.OPER{assem="addi $sp, $sp, " ^ Int.toString frameSize ^ "\n",
                   src=[SP], dst=[SP], jump=NONE},
            A.OPER{assem="jr $ra\n", src=[RA], dst=[], jump=SOME[]}
        ]
    in
        prologInstrs @ body @ epilogInstrs
    end

    fun name ({name, ...} : frame) = name

    fun formals({formals, ...} : frame) = formals

    fun string (label, s) =
    let
        val len = size s
    in
        Symbol.name label ^ ":\n" ^
        "  .word " ^ Int.toString len ^ "\n" ^
        "  .ascii \"" ^ s ^ "\"\n" ^
        (if len mod 4 = 0 then ""
         else "  .space " ^ Int.toString (4 - (len mod 4)) ^ "\n")
    end

    (* #NOTE: use this when allocating local variables in function and looks at the escape flag to determine where things go. *)
    fun allocLocal(frame: frame) escape =
        if escape then
            let
                val offset = !(#localOffset frame) - wordSize
                val _ = (#localOffset frame) := offset
            in
                InFrame offset
            end
        else
            InReg (Temp.newtemp())

    (* 
    Handling more than 4 params: the first 4 params (static link + 3 args) arrive in registers (a0-a3),
    the rest are passed via the stack (in caller's stack frame)
    Cases: 
        - 0-4, escape: arrive in reg, move to callee frame (neg offset from current FP, increment localOffset)
        - 0-4, local : arrive in reg, keep in reg
        - 4+         : arrive in caller frame, keep in caller frame (pos offset from current FP)
    *)

    val ARGREGS = 4
    val STARTOFFSET = ~44   (* old fp at -4, saved regs at -8..-40 *)
    fun newFrame ({name, formals} : {name: Temp.label, formals: bool list}) =
        let
            val nextLocal = ref STARTOFFSET

            fun alloc (esc, idx) =
                if idx < k then
                    if esc then
                        let
                            val off = !nextLocal
                            val _ = nextLocal := off - wordSize
                        in
                            InFrame off
                        end
                    else
                        InReg (Temp.newtemp())
                else
                    (* args beyond first k are stack-passed *)
                    InFrame ((idx - k) * wordSize)

            fun allocFormals ([], idx) = []
            | allocFormals (formal :: rest, idx) =
                    alloc(formal, idx) :: allocFormals(rest, idx + 1)

            val formalsAccesses = allocFormals(formals, 0)
        in
            {name = name, formals = formalsAccesses, localOffset = nextLocal}
        end

    (* fun newFrame({name, formals}) = 
        let
            val nextLocal = ref 0

            fun alloc (esc, idx) = 
                if idx < k then
                    if esc then 
                        (nextLocal := !nextLocal - 4;
                        InFrame (!nextLocal))
                    else 
                        InReg(Temp.newtemp())
                else (* 4+th params are passed in the caller's frame so have positive offset (upward from current fp) *)
                    InFrame (8 + (idx - 4) * 4) (* offset 0 for 5th, 4 for 6th, etc... *)

            fun allocFormals ([], idx) = []
              | allocFormals (formal :: rest, idx) = alloc(formal, idx) :: allocFormals(rest, idx + 1)

            val formalsAccesses = allocFormals (formals, 0)
        in
            {name = name, formals = formalsAccesses, localOffset = nextLocal}
        end *)

    (* #NOTE: this is to access variables given frame pointer and access val. *)
    fun exp (accessVal, fp) = 
        case accessVal of
            InFrame offset => Tr.MEM(Tr.BINOP(Tr.PLUS, fp, Tr.CONST offset))
          | InReg temp => Tr.TEMP(temp)

    (* fun externalCall (func, args) = Tr.CALL(Tr.NAME(Temp.namedLabel func), args) *)
    fun externalCall (func, args) = Tr.CALL(Tr.NAME(Temp.namedLabel ("tig_" ^ func)), args)

end

