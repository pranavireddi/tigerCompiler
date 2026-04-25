
.data
L6:
  .word 2
  .ascii " O"
  .space 2
L7:
  .word 2
  .ascii " ."
  .space 2
L19:
  .word 1
  .ascii "
"
  .space 3

.text
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
L63:
sw $a0, 40($fp)
sw $a1, 44($fp)
li $s0, 0
move $s1, $s0
lw $s0, 40($fp)
lw $s0, 44($s0)
addi $s0, $s0, -1
move $s2, $s0
ble $s1, $s2, L21
j L2
L2:
la $s0, L19
move $a0, $s0
jal tig_print
move $s0, $v0
move $v0, $s0
j L62
L21:
li $s0, 0
move $s3, $s0
lw $s0, 40($fp)
lw $s0, 44($s0)
addi $s0, $s0, -1
move $s4, $s0
ble $s3, $s4, L17
j L3
L3:
la $s0, L19
move $a0, $s0
jal tig_print
move $s0, $v0
bge $s1, $s2, L2
j L22
L22:
addi $s0, $s1, 1
move $s1, $s0
j L21
L17:
lw $s0, 40($fp)
lw $s0, 52($s0)
move $s0, $s0
li $s5, 0
beq $s0, $s5, L5
j L4
L4:
li $s5, 4
mul $s5, $s1, $s5 
addi $s5, $s5, 4
add $s0, $s0, $s5 
lw $s0, 0($s0)
beq $s0, $s3, L8
j L9
L9:
la $s0, L7
move $s0, $s0
L10:
move $a0, $s0
jal tig_print
move $s0, $v0
bge $s3, $s4, L3
j L18
L18:
addi $s0, $s3, 1
move $s3, $s0
j L17
L5:
jal tig_nilerror
move $s5, $v0
j L4
L8:
la $s0, L6
move $s0, $s0
j L10
L62:
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
L65:
sw $a0, 40($fp)
sw $a1, 44($fp)
move $s0, $a2
lw $s0, 44($fp)
lw $s1, 40($fp)
lw $s1, 44($s1)
beq $s0, $s1, L59
j L60
L60:
li $s0, 0
move $s1, $s0
lw $s0, 40($fp)
lw $s0, 44($s0)
addi $s0, $s0, -1
move $s2, $s0
ble $s1, $s2, L57
j L23
L23:
li $s0, 0
move $s0, $s0
L61:
move $v0, $s0
j L64
L59:
lw $s0, 40($fp)
move $a0, $s0
jal L0
move $s0, $v0
move $s0, $s0
j L61
L57:
lw $s0, 40($fp)
lw $s0, 48($s0)
move $s0, $s0
li $s3, 0
beq $s0, $s3, L25
j L24
L24:
li $s3, 4
mul $s3, $s1, $s3 
addi $s3, $s3, 4
add $s0, $s0, $s3 
lw $s0, 0($s0)
li $s3, 0
beq $s0, $s3, L28
j L29
L29:
li $s0, 0
move $s0, $s0
L30:
li $s3, 0
bne $s0, $s3, L35
j L36
L36:
li $s0, 0
move $s0, $s0
L37:
li $s3, 0
bne $s0, $s3, L54
j L55
L55:
bge $s1, $s2, L23
j L58
L58:
addi $s0, $s1, 1
move $s1, $s0
j L57
L25:
jal tig_nilerror
move $s3, $v0
j L24
L28:
li $s0, 1
move $s0, $s0
lw $s3, 40($fp)
lw $s3, 56($s3)
move $s3, $s3
li $s4, 0
beq $s3, $s4, L27
j L26
L26:
lw $s4, 44($fp)
add $s4, $s1, $s4 
li $s5, 4
mul $s4, $s4, $s5 
addi $s4, $s4, 4
add $s3, $s3, $s4 
lw $s3, 0($s3)
li $s4, 0
beq $s3, $s4, L31
j L32
L32:
li $s0, 0
move $s0, $s0
L31:
move $s0, $s0
j L30
L27:
jal tig_nilerror
move $s4, $v0
j L26
L35:
li $s0, 1
move $s0, $s0
lw $s3, 40($fp)
lw $s3, 60($s3)
move $s3, $s3
li $s4, 0
beq $s3, $s4, L34
j L33
L33:
addi $s4, $s1, 7
lw $s5, 44($fp)
sub $s4, $s4, $s5 
li $s5, 4
mul $s4, $s4, $s5 
addi $s4, $s4, 4
add $s3, $s3, $s4 
lw $s3, 0($s3)
li $s4, 0
beq $s3, $s4, L38
j L39
L39:
li $s0, 0
move $s0, $s0
L38:
move $s0, $s0
j L37
L34:
jal tig_nilerror
move $s4, $v0
j L33
L54:
lw $s0, 40($fp)
lw $s0, 48($s0)
move $s0, $s0
li $s3, 0
beq $s0, $s3, L41
j L40
L40:
li $s3, 1
li $s4, 4
mul $s4, $s1, $s4 
addi $s4, $s4, 4
add $s0, $s0, $s4 
sw $s3, 0($s0)
lw $s0, 40($fp)
lw $s0, 56($s0)
move $s0, $s0
li $s3, 0
beq $s0, $s3, L43
j L42
L42:
li $s3, 1
lw $s4, 44($fp)
add $s4, $s1, $s4 
li $s5, 4
mul $s4, $s4, $s5 
addi $s4, $s4, 4
add $s0, $s0, $s4 
sw $s3, 0($s0)
lw $s0, 40($fp)
lw $s0, 60($s0)
move $s0, $s0
li $s3, 0
beq $s0, $s3, L45
j L44
L44:
li $s3, 1
addi $s4, $s1, 7
lw $s5, 44($fp)
sub $s4, $s4, $s5 
li $s5, 4
mul $s4, $s4, $s5 
addi $s4, $s4, 4
add $s0, $s0, $s4 
sw $s3, 0($s0)
lw $s0, 40($fp)
lw $s0, 52($s0)
move $s0, $s0
li $s3, 0
beq $s0, $s3, L47
j L46
L46:
lw $s3, 44($fp)
li $s4, 4
mul $s3, $s3, $s4 
addi $s3, $s3, 4
add $s0, $s0, $s3 
sw $s1, 0($s0)
lw $s0, 40($fp)
move $a0, $s0
lw $s0, 44($fp)
addi $s0, $s0, 1
move $a1, $s0
jal L1
move $s0, $v0
lw $s0, 40($fp)
lw $s0, 48($s0)
move $s0, $s0
li $s3, 0
beq $s0, $s3, L49
j L48
L48:
li $s3, 0
li $s4, 4
mul $s4, $s1, $s4 
addi $s4, $s4, 4
add $s0, $s0, $s4 
sw $s3, 0($s0)
lw $s0, 40($fp)
lw $s0, 56($s0)
move $s0, $s0
li $s3, 0
beq $s0, $s3, L51
j L50
L50:
li $s3, 0
lw $s4, 44($fp)
add $s4, $s1, $s4 
li $s5, 4
mul $s4, $s4, $s5 
addi $s4, $s4, 4
add $s0, $s0, $s4 
sw $s3, 0($s0)
lw $s0, 40($fp)
lw $s0, 60($s0)
move $s0, $s0
li $s3, 0
beq $s0, $s3, L53
j L52
L52:
li $s3, 0
addi $s4, $s1, 7
lw $s5, 44($fp)
sub $s4, $s4, $s5 
li $s5, 4
mul $s4, $s4, $s5 
addi $s4, $s4, 4
add $s0, $s0, $s4 
sw $s3, 0($s0)
j L55
L41:
jal tig_nilerror
move $s3, $v0
j L40
L43:
jal tig_nilerror
move $s3, $v0
j L42
L45:
jal tig_nilerror
move $s3, $v0
j L44
L47:
jal tig_nilerror
move $s3, $v0
j L46
L49:
jal tig_nilerror
move $s3, $v0
j L48
L51:
jal tig_nilerror
move $s3, $v0
j L50
L53:
jal tig_nilerror
move $s3, $v0
j L52
L64:
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
addi $sp, $sp, -64
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
L67:
sw $a0, 40($fp)
li $s0, 8
sw $s0, 44($fp)
addi $s0, $fp, 48
move $s0, $s0
lw $s1, 44($fp)
move $a0, $s1
li $s1, 0
move $a1, $s1
jal tig_initArray
move $s1, $v0
move $s1, $s1
sw $s1, 0($s0)
addi $s0, $fp, 52
move $s0, $s0
lw $s1, 44($fp)
move $a0, $s1
li $s1, 0
move $a1, $s1
jal tig_initArray
move $s1, $v0
move $s1, $s1
sw $s1, 0($s0)
addi $s0, $fp, 56
move $s0, $s0
lw $s1, 44($fp)
lw $s2, 44($fp)
add $s1, $s1, $s2 
addi $s1, $s1, -1
move $a0, $s1
li $s1, 0
move $a1, $s1
jal tig_initArray
move $s1, $v0
move $s1, $s1
sw $s1, 0($s0)
addi $s0, $fp, 60
move $s1, $s0
lw $s0, 44($fp)
lw $s2, 44($fp)
add $s0, $s0, $s2 
addi $s0, $s0, -1
move $a0, $s0
li $s0, 0
move $a1, $s0
jal tig_initArray
move $s0, $v0
move $s0, $s0
sw $s0, 0($s1)
move $a0, $fp
li $s0, 0
move $a1, $s0
jal L1
move $s0, $v0
move $v0, $s0
j L66
L66:
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
addi $sp, $sp, 64
jr $ra
