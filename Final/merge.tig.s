
.data
L3:
  .word 1
  .ascii "0"
  .space 3
L4:
  .word 1
  .ascii "9"
  .space 3
L10:
  .word 1
  .ascii " "
  .space 3
L11:
  .word 1
  .ascii "
"
  .space 3
L60:
  .word 1
  .ascii "-"
  .space 3

.text
.globl L1
L1:
addi $sp, $sp, -48
sw $ra, 0($sp)
sw $fp, 4($sp)
sw $s0, 8($sp)
sw $s1, 12($sp)
sw $s2, 16($sp)
sw $s3, 20($sp)
sw $s4, 24($sp)
sw $s5, 28($sp)
sw $s6, 32($sp)
sw $s7, 36($sp)
move $fp, $sp
L79:
sw $a0, 40($fp)
sw $a1, 44($fp)
move $s0, $a2
lw $s0, 40($fp)
lw $s0, 40($s0)
lw $s0, 44($s0)
move $a0, $s0
jal tig_ord
move $s0, $v0
move $s0, $s0
move $s0, $s0
la $s1, L3
move $a0, $s1
jal tig_ord
move $s1, $v0
move $s1, $s1
bge $s0, $s1, L5
j L6
L6:
li $s0, 0
move $s0, $s0
L7:
move $v0, $s0
j L78
L5:
li $s0, 1
move $s0, $s0
lw $s1, 40($fp)
lw $s1, 40($s1)
lw $s1, 44($s1)
move $a0, $s1
jal tig_ord
move $s1, $v0
move $s1, $s1
move $s1, $s1
la $s2, L4
move $a0, $s2
jal tig_ord
move $s2, $v0
move $s2, $s2
ble $s1, $s2, L8
j L9
L9:
li $s0, 0
move $s0, $s0
L8:
move $s0, $s0
j L7
L78:
move $sp, $fp
lw $s0, 8($sp)
lw $s1, 12($sp)
lw $s2, 16($sp)
lw $s3, 20($sp)
lw $s4, 24($sp)
lw $s5, 28($sp)
lw $s6, 32($sp)
lw $s7, 36($sp)
lw $ra, 0($sp)
lw $fp, 4($sp)
addi $sp, $sp, 48
jr $ra
.globl L2
L2:
addi $sp, $sp, -48
sw $ra, 0($sp)
sw $fp, 4($sp)
sw $s0, 8($sp)
sw $s1, 12($sp)
sw $s2, 16($sp)
sw $s3, 20($sp)
sw $s4, 24($sp)
sw $s5, 28($sp)
sw $s6, 32($sp)
sw $s7, 36($sp)
move $fp, $sp
L81:
sw $a0, 40($fp)
sw $a1, 44($fp)
L16:
lw $s0, 40($fp)
lw $s0, 40($s0)
lw $s0, 44($s0)
move $a0, $s0
la $s0, L10
move $a1, $s0
jal tig_stringEqual
move $s0, $v0
move $s0, $s0
li $s1, 0
bne $s0, $s1, L12
j L13
L13:
lw $s0, 40($fp)
lw $s0, 40($s0)
lw $s0, 44($s0)
move $a0, $s0
la $s0, L11
move $a1, $s0
jal tig_stringEqual
move $s0, $v0
move $s0, $s0
L14:
li $s1, 0
bne $s0, $s1, L17
j L15
L15:
li $s0, 0
move $v0, $s0
j L80
L12:
li $s0, 1
move $s0, $s0
j L14
L17:
lw $s0, 40($fp)
lw $s0, 40($s0)
addi $s0, $s0, 44
move $s1, $s0
jal tig_getchar
move $s0, $v0
move $s0, $s0
sw $s0, 0($s1)
j L16
L80:
move $sp, $fp
lw $s0, 8($sp)
lw $s1, 12($sp)
lw $s2, 16($sp)
lw $s3, 20($sp)
lw $s4, 24($sp)
lw $s5, 28($sp)
lw $s6, 32($sp)
lw $s7, 36($sp)
lw $ra, 0($sp)
lw $fp, 4($sp)
addi $sp, $sp, 48
jr $ra
.globl L0
L0:
addi $sp, $sp, -48
sw $ra, 0($sp)
sw $fp, 4($sp)
sw $s0, 8($sp)
sw $s1, 12($sp)
sw $s2, 16($sp)
sw $s3, 20($sp)
sw $s4, 24($sp)
sw $s5, 28($sp)
sw $s6, 32($sp)
sw $s7, 36($sp)
move $fp, $sp
L83:
sw $a0, 40($fp)
sw $a1, 44($fp)
move $s0, $a2
li $s0, 0
move $s1, $s0
move $a0, $fp
jal L2
move $s0, $v0
lw $s0, 44($fp)
move $s0, $s0
li $s2, 0
beq $s0, $s2, L19
j L18
L18:
addi $s0, $s0, 0
move $s0, $s0
move $a0, $fp
lw $s2, 40($fp)
lw $s2, 44($s2)
move $a1, $s2
jal L1
move $s2, $v0
move $s2, $s2
sw $s2, 0($s0)
L21:
move $a0, $fp
lw $s0, 40($fp)
lw $s0, 44($s0)
move $a1, $s0
jal L1
move $s0, $v0
move $s0, $s0
li $s2, 0
bne $s0, $s2, L22
j L20
L20:
move $v0, $s1
j L82
L19:
jal tig_nilerror
move $s2, $v0
j L18
L22:
li $s0, 10
mul $s0, $s1, $s0 
move $s0, $s0
lw $s1, 40($fp)
lw $s1, 44($s1)
move $a0, $s1
jal tig_ord
move $s1, $v0
move $s1, $s1
add $s0, $s0, $s1 
move $s0, $s0
la $s1, L3
move $a0, $s1
jal tig_ord
move $s1, $v0
move $s1, $s1
sub $s0, $s0, $s1 
move $s1, $s0
lw $s0, 40($fp)
addi $s0, $s0, 44
move $s2, $s0
jal tig_getchar
move $s0, $v0
move $s0, $s0
sw $s0, 0($s2)
j L21
L82:
move $sp, $fp
lw $s0, 8($sp)
lw $s1, 12($sp)
lw $s2, 16($sp)
lw $s3, 20($sp)
lw $s4, 24($sp)
lw $s5, 28($sp)
lw $s6, 32($sp)
lw $s7, 36($sp)
lw $ra, 0($sp)
lw $fp, 4($sp)
addi $sp, $sp, 48
jr $ra
.globl L23
L23:
addi $sp, $sp, -48
sw $ra, 0($sp)
sw $fp, 4($sp)
sw $s0, 8($sp)
sw $s1, 12($sp)
sw $s2, 16($sp)
sw $s3, 20($sp)
sw $s4, 24($sp)
sw $s5, 28($sp)
sw $s6, 32($sp)
sw $s7, 36($sp)
move $fp, $sp
L85:
sw $a0, 40($fp)
sw $a1, 44($fp)
li $s0, 4
move $a0, $s0
jal tig_allocRecord
move $s0, $v0
move $s0, $s0
li $s1, 0
sw $s1, 0($s0)
move $s0, $s0
lw $s1, 40($fp)
move $a0, $s1
move $a1, $s0
jal L0
move $s1, $v0
move $s1, $s1
move $s0, $s0
li $s2, 0
beq $s0, $s2, L28
j L27
L27:
lw $s0, 0($s0)
li $s2, 0
bne $s0, $s2, L29
j L30
L30:
li $s0, 0
move $s0, $s0
L31:
move $v0, $s0
j L84
L28:
jal tig_nilerror
move $s2, $v0
j L27
L29:
li $s0, 8
move $a0, $s0
jal tig_allocRecord
move $s0, $v0
move $s0, $s0
sw $s1, 0($s0)
addi $s1, $s0, 4
move $s1, $s1
lw $s2, 40($fp)
move $a0, $s2
jal L23
move $s2, $v0
move $s2, $s2
sw $s2, 0($s1)
move $s0, $s0
j L31
L84:
move $sp, $fp
lw $s0, 8($sp)
lw $s1, 12($sp)
lw $s2, 16($sp)
lw $s3, 20($sp)
lw $s4, 24($sp)
lw $s5, 28($sp)
lw $s6, 32($sp)
lw $s7, 36($sp)
lw $ra, 0($sp)
lw $fp, 4($sp)
addi $sp, $sp, 48
jr $ra
.globl L24
L24:
addi $sp, $sp, -48
sw $ra, 0($sp)
sw $fp, 4($sp)
sw $s0, 8($sp)
sw $s1, 12($sp)
sw $s2, 16($sp)
sw $s3, 20($sp)
sw $s4, 24($sp)
sw $s5, 28($sp)
sw $s6, 32($sp)
sw $s7, 36($sp)
move $fp, $sp
L87:
sw $a0, 40($fp)
sw $a1, 44($fp)
move $s0, $a2
move $s1, $a3
lw $s1, 44($fp)
li $s2, 0
beq $s1, $s2, L54
j L55
L55:
li $s1, 0
beq $s0, $s1, L51
j L52
L52:
lw $s1, 44($fp)
move $s1, $s1
li $s2, 0
beq $s1, $s2, L33
j L32
L32:
lw $s1, 0($s1)
move $s1, $s1
move $s0, $s0
li $s2, 0
beq $s0, $s2, L35
j L34
L34:
lw $s2, 0($s0)
blt $s1, $s2, L48
j L49
L49:
li $s1, 8
move $a0, $s1
jal tig_allocRecord
move $s1, $v0
move $s1, $s1
addi $s2, $s1, 0
move $s2, $s2
move $s0, $s0
li $s3, 0
beq $s0, $s3, L43
j L42
L42:
lw $s3, 0($s0)
sw $s3, 0($s2)
addi $s2, $s1, 4
move $s2, $s2
lw $s3, 40($fp)
move $s3, $s3
lw $s4, 44($fp)
move $s4, $s4
move $s0, $s0
li $s5, 0
beq $s0, $s5, L45
j L44
L44:
move $a0, $s3
move $a1, $s4
lw $s0, 4($s0)
move $a2, $s0
jal L24
move $s0, $v0
move $s0, $s0
sw $s0, 0($s2)
move $s0, $s1
L50:
move $s0, $s0
L53:
move $s0, $s0
L56:
move $v0, $s0
j L86
L54:
move $s0, $s0
j L56
L51:
lw $s0, 44($fp)
move $s0, $s0
j L53
L33:
jal tig_nilerror
move $s2, $v0
j L32
L35:
jal tig_nilerror
move $s2, $v0
j L34
L48:
li $s1, 8
move $a0, $s1
jal tig_allocRecord
move $s1, $v0
move $s1, $s1
addi $s2, $s1, 0
move $s2, $s2
lw $s3, 44($fp)
move $s3, $s3
li $s4, 0
beq $s3, $s4, L37
j L36
L36:
lw $s3, 0($s3)
sw $s3, 0($s2)
addi $s2, $s1, 4
move $s2, $s2
lw $s3, 40($fp)
move $s3, $s3
lw $s4, 44($fp)
move $s4, $s4
li $s5, 0
beq $s4, $s5, L39
j L38
L38:
move $a0, $s3
lw $s3, 4($s4)
move $a1, $s3
move $a2, $s0
jal L24
move $s0, $v0
move $s0, $s0
sw $s0, 0($s2)
move $s0, $s1
j L50
L37:
jal tig_nilerror
move $s4, $v0
j L36
L39:
jal tig_nilerror
move $s5, $v0
j L38
L43:
jal tig_nilerror
move $s3, $v0
j L42
L45:
jal tig_nilerror
move $s5, $v0
j L44
L86:
move $sp, $fp
lw $s0, 8($sp)
lw $s1, 12($sp)
lw $s2, 16($sp)
lw $s3, 20($sp)
lw $s4, 24($sp)
lw $s5, 28($sp)
lw $s6, 32($sp)
lw $s7, 36($sp)
lw $ra, 0($sp)
lw $fp, 4($sp)
addi $sp, $sp, 48
jr $ra
.globl L57
L57:
addi $sp, $sp, -48
sw $ra, 0($sp)
sw $fp, 4($sp)
sw $s0, 8($sp)
sw $s1, 12($sp)
sw $s2, 16($sp)
sw $s3, 20($sp)
sw $s4, 24($sp)
sw $s5, 28($sp)
sw $s6, 32($sp)
sw $s7, 36($sp)
move $fp, $sp
L89:
sw $a0, 40($fp)
sw $a1, 44($fp)
move $s0, $a2
lw $s0, 44($fp)
li $s1, 0
bgt $s0, $s1, L58
j L59
L59:
li $s0, 0
move $v0, $s0
j L88
L58:
lw $s0, 40($fp)
move $a0, $s0
lw $s0, 44($fp)
li $s1, 10
div $s0, $s1
mflo $s0
move $a1, $s0
jal L57
move $s0, $v0
lw $s0, 44($fp)
lw $s1, 44($fp)
li $s2, 10
div $s1, $s2
mflo $s1
li $s2, 10
mul $s1, $s1, $s2 
sub $s0, $s0, $s1 
move $s0, $s0
la $s1, L3
move $a0, $s1
jal tig_ord
move $s1, $v0
move $s1, $s1
add $s0, $s0, $s1 
move $a0, $s0
jal tig_chr
move $s0, $v0
move $s0, $s0
move $a0, $s0
jal tig_print
move $s0, $v0
j L59
L88:
move $sp, $fp
lw $s0, 8($sp)
lw $s1, 12($sp)
lw $s2, 16($sp)
lw $s3, 20($sp)
lw $s4, 24($sp)
lw $s5, 28($sp)
lw $s6, 32($sp)
lw $s7, 36($sp)
lw $ra, 0($sp)
lw $fp, 4($sp)
addi $sp, $sp, 48
jr $ra
.globl L25
L25:
addi $sp, $sp, -48
sw $ra, 0($sp)
sw $fp, 4($sp)
sw $s0, 8($sp)
sw $s1, 12($sp)
sw $s2, 16($sp)
sw $s3, 20($sp)
sw $s4, 24($sp)
sw $s5, 28($sp)
sw $s6, 32($sp)
sw $s7, 36($sp)
move $fp, $sp
L91:
sw $a0, 40($fp)
sw $a1, 44($fp)
move $s0, $a2
lw $s0, 44($fp)
li $s1, 0
blt $s0, $s1, L64
j L65
L65:
lw $s0, 44($fp)
li $s1, 0
bgt $s0, $s1, L61
j L62
L62:
la $s0, L3
move $a0, $s0
jal tig_print
move $s0, $v0
move $s0, $s0
L63:
move $s0, $s0
L66:
move $v0, $s0
j L90
L64:
la $s0, L60
move $a0, $s0
jal tig_print
move $s0, $v0
move $a0, $fp
li $s0, 0
lw $s1, 44($fp)
sub $s0, $s0, $s1 
move $a1, $s0
jal L57
move $s0, $v0
move $s0, $s0
j L66
L61:
move $a0, $fp
lw $s0, 44($fp)
move $a1, $s0
jal L57
move $s0, $v0
move $s0, $s0
j L63
L90:
move $sp, $fp
lw $s0, 8($sp)
lw $s1, 12($sp)
lw $s2, 16($sp)
lw $s3, 20($sp)
lw $s4, 24($sp)
lw $s5, 28($sp)
lw $s6, 32($sp)
lw $s7, 36($sp)
lw $ra, 0($sp)
lw $fp, 4($sp)
addi $sp, $sp, 48
jr $ra
.globl L26
L26:
addi $sp, $sp, -48
sw $ra, 0($sp)
sw $fp, 4($sp)
sw $s0, 8($sp)
sw $s1, 12($sp)
sw $s2, 16($sp)
sw $s3, 20($sp)
sw $s4, 24($sp)
sw $s5, 28($sp)
sw $s6, 32($sp)
sw $s7, 36($sp)
move $fp, $sp
L93:
sw $a0, 40($fp)
sw $a1, 44($fp)
move $s0, $a2
lw $s0, 44($fp)
li $s1, 0
beq $s0, $s1, L75
j L76
L76:
lw $s0, 40($fp)
move $s0, $s0
lw $s1, 44($fp)
move $s1, $s1
li $s2, 0
beq $s1, $s2, L68
j L67
L67:
move $a0, $s0
lw $s0, 0($s1)
move $a1, $s0
jal L25
move $s0, $v0
la $s0, L10
move $a0, $s0
jal tig_print
move $s0, $v0
lw $s0, 40($fp)
move $s0, $s0
lw $s1, 44($fp)
move $s1, $s1
li $s2, 0
beq $s1, $s2, L72
j L71
L71:
move $a0, $s0
lw $s0, 4($s1)
move $a1, $s0
jal L26
move $s0, $v0
move $s0, $s0
L77:
move $v0, $s0
j L92
L75:
la $s0, L11
move $a0, $s0
jal tig_print
move $s0, $v0
move $s0, $s0
j L77
L68:
jal tig_nilerror
move $s2, $v0
j L67
L72:
jal tig_nilerror
move $s2, $v0
j L71
L92:
move $sp, $fp
lw $s0, 8($sp)
lw $s1, 12($sp)
lw $s2, 16($sp)
lw $s3, 20($sp)
lw $s4, 24($sp)
lw $s5, 28($sp)
lw $s6, 32($sp)
lw $s7, 36($sp)
lw $ra, 0($sp)
lw $fp, 4($sp)
addi $sp, $sp, 48
jr $ra
.globl tig_main
tig_main:
addi $sp, $sp, -48
sw $ra, 0($sp)
sw $fp, 4($sp)
sw $s0, 8($sp)
sw $s1, 12($sp)
sw $s2, 16($sp)
sw $s3, 20($sp)
sw $s4, 24($sp)
sw $s5, 28($sp)
sw $s6, 32($sp)
sw $s7, 36($sp)
move $fp, $sp
L95:
sw $a0, 40($fp)
addi $s0, $fp, 44
move $s0, $s0
jal tig_getchar
move $s1, $v0
move $s1, $s1
sw $s1, 0($s0)
move $a0, $fp
jal L23
move $s0, $v0
move $s0, $s0
addi $s1, $fp, 44
move $s1, $s1
jal tig_getchar
move $s2, $v0
move $s2, $s2
sw $s2, 0($s1)
move $a0, $fp
jal L23
move $s1, $v0
move $s1, $s1
move $s2, $fp
move $a0, $fp
move $a1, $s0
move $a2, $s1
jal L24
move $s0, $v0
move $s0, $s0
move $a0, $s2
move $a1, $s0
jal L26
move $s0, $v0
move $v0, $s0
j L94
L94:
move $sp, $fp
lw $s0, 8($sp)
lw $s1, 12($sp)
lw $s2, 16($sp)
lw $s3, 20($sp)
lw $s4, 24($sp)
lw $s5, 28($sp)
lw $s6, 32($sp)
lw $s7, 36($sp)
lw $ra, 0($sp)
lw $fp, 4($sp)
addi $sp, $sp, 48
jr $ra
