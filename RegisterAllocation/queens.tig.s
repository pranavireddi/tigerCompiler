
.data
L21:
  .word 2
  .ascii " O"
  .space 2
L22:
  .word 2
  .ascii " ."
  .space 2
L34:
  .word 1
  .ascii "
"
  .space 3

.text
.globl L15
L15:
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
L78:
sw $a0, 40($fp)
sw $a1, 44($fp)
li $s0, 0
move $s1, $s0
lw $s0, 40($fp)
lw $s0, 44($s0)
addi $s0, $s0, -1
move $s2, $s0
ble $s1, $s2, L36
j L17
L17:
la $s0, L34
move $a0, $s0
jal tig_print
move $s0, $v0
move $v0, $s0
j L77
L36:
li $s0, 0
move $s3, $s0
lw $s0, 40($fp)
lw $s0, 44($s0)
addi $s0, $s0, -1
move $s4, $s0
ble $s3, $s4, L32
j L18
L18:
la $s0, L34
move $a0, $s0
jal tig_print
move $s0, $v0
bge $s1, $s2, L17
j L37
L37:
addi $s0, $s1, 1
move $s1, $s0
j L36
L32:
lw $s0, 40($fp)
lw $s0, 52($s0)
move $s0, $s0
li $s5, 0
beq $s0, $s5, L20
j L19
L19:
li $s5, 4
mul $s5, $s1, $s5 
addi $s5, $s5, 4
add $s0, $s0, $s5 
lw $s0, 0($s0)
beq $s0, $s3, L23
j L24
L24:
la $s0, L22
move $s0, $s0
L25:
move $a0, $s0
jal tig_print
move $s0, $v0
bge $s3, $s4, L18
j L33
L33:
addi $s0, $s3, 1
move $s3, $s0
j L32
L20:
jal tig_nilerror
move $s5, $v0
j L19
L23:
la $s0, L21
move $s0, $s0
j L25
L77:
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
.globl L16
L16:
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
L80:
sw $a0, 40($fp)
sw $a1, 44($fp)
move $s0, $a2
lw $s0, 44($fp)
lw $s1, 40($fp)
lw $s1, 44($s1)
beq $s0, $s1, L74
j L75
L75:
li $s0, 0
move $s1, $s0
lw $s0, 40($fp)
lw $s0, 44($s0)
addi $s0, $s0, -1
move $s2, $s0
ble $s1, $s2, L72
j L38
L38:
li $s0, 0
move $s0, $s0
L76:
move $v0, $s0
j L79
L74:
lw $s0, 40($fp)
move $a0, $s0
jal L15
move $s0, $v0
move $s0, $s0
j L76
L72:
lw $s0, 40($fp)
lw $s0, 48($s0)
move $s0, $s0
li $s3, 0
beq $s0, $s3, L40
j L39
L39:
li $s3, 4
mul $s3, $s1, $s3 
addi $s3, $s3, 4
add $s0, $s0, $s3 
lw $s0, 0($s0)
li $s3, 0
beq $s0, $s3, L43
j L44
L44:
li $s0, 0
move $s0, $s0
L45:
li $s3, 0
bne $s0, $s3, L50
j L51
L51:
li $s0, 0
move $s0, $s0
L52:
li $s3, 0
bne $s0, $s3, L69
j L70
L70:
bge $s1, $s2, L38
j L73
L73:
addi $s0, $s1, 1
move $s1, $s0
j L72
L40:
jal tig_nilerror
move $s3, $v0
j L39
L43:
li $s0, 1
move $s0, $s0
lw $s3, 40($fp)
lw $s3, 56($s3)
move $s3, $s3
li $s4, 0
beq $s3, $s4, L42
j L41
L41:
lw $s4, 44($fp)
add $s4, $s1, $s4 
li $s5, 4
mul $s4, $s4, $s5 
addi $s4, $s4, 4
add $s3, $s3, $s4 
lw $s3, 0($s3)
li $s4, 0
beq $s3, $s4, L46
j L47
L47:
li $s0, 0
move $s0, $s0
L46:
move $s0, $s0
j L45
L42:
jal tig_nilerror
move $s4, $v0
j L41
L50:
li $s0, 1
move $s0, $s0
lw $s3, 40($fp)
lw $s3, 60($s3)
move $s3, $s3
li $s4, 0
beq $s3, $s4, L49
j L48
L48:
addi $s4, $s1, 7
lw $s5, 44($fp)
sub $s4, $s4, $s5 
li $s5, 4
mul $s4, $s4, $s5 
addi $s4, $s4, 4
add $s3, $s3, $s4 
lw $s3, 0($s3)
li $s4, 0
beq $s3, $s4, L53
j L54
L54:
li $s0, 0
move $s0, $s0
L53:
move $s0, $s0
j L52
L49:
jal tig_nilerror
move $s4, $v0
j L48
L69:
lw $s0, 40($fp)
lw $s0, 48($s0)
move $s0, $s0
li $s3, 0
beq $s0, $s3, L56
j L55
L55:
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
beq $s0, $s3, L58
j L57
L57:
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
beq $s0, $s3, L60
j L59
L59:
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
beq $s0, $s3, L62
j L61
L61:
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
jal L16
move $s0, $v0
lw $s0, 40($fp)
lw $s0, 48($s0)
move $s0, $s0
li $s3, 0
beq $s0, $s3, L64
j L63
L63:
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
beq $s0, $s3, L66
j L65
L65:
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
beq $s0, $s3, L68
j L67
L67:
li $s3, 0
addi $s4, $s1, 7
lw $s5, 44($fp)
sub $s4, $s4, $s5 
li $s5, 4
mul $s4, $s4, $s5 
addi $s4, $s4, 4
add $s0, $s0, $s4 
sw $s3, 0($s0)
j L70
L56:
jal tig_nilerror
move $s3, $v0
j L55
L58:
jal tig_nilerror
move $s3, $v0
j L57
L60:
jal tig_nilerror
move $s3, $v0
j L59
L62:
jal tig_nilerror
move $s3, $v0
j L61
L64:
jal tig_nilerror
move $s3, $v0
j L63
L66:
jal tig_nilerror
move $s3, $v0
j L65
L68:
jal tig_nilerror
move $s3, $v0
j L67
L79:
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
L82:
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
jal L16
move $s0, $v0
move $v0, $s0
j L81
L81:
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
