.data
L3: .asciiz "0"
L4: .asciiz "9"
L10: .asciiz " "
L11: .asciiz "
"
L60: .asciiz "-"

.text
.globl main
main:
sw $ra, -4($sp)
sw $fp, -8($sp)
move $fp, $sp
addi $sp, $sp, -16
L79:
sw $a0, -4($fp)
sw $a1, -8($fp)
move $s0, $a2
li $s0, 0
move $a0, $s0
lw $s0, -4($fp)
lw $s0, -4($s0)
lw $s0, -8($s0)
move $a1, $s0
jal ord
move $s0, $v0
move $s0, $s0
move $s0, $s0
li $s1, 0
move $a0, $s1
la $s1, L3
move $a1, $s1
jal ord
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
li $s1, 0
move $a0, $s1
lw $s1, -4($fp)
lw $s1, -4($s1)
lw $s1, -8($s1)
move $a1, $s1
jal ord
move $s1, $v0
move $s1, $s1
move $s1, $s1
li $s2, 0
move $a0, $s2
la $s2, L4
move $a1, $s2
jal ord
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
lw $ra, -4($sp)
lw $fp, -8($sp)
jr $ra
sw $ra, -4($sp)
sw $fp, -8($sp)
move $fp, $sp
addi $sp, $sp, -16
L81:
sw $a0, -4($fp)
sw $a1, -8($fp)
L16:
lw $s0, -4($fp)
lw $s0, -4($s0)
lw $s0, -8($s0)
move $a0, $s0
la $s0, L10
move $a1, $s0
jal stringEqual
move $s0, $v0
move $s0, $s0
li $s1, 0
bne $s0, $s1, L12
j L13
L13:
lw $s0, -4($fp)
lw $s0, -4($s0)
lw $s0, -8($s0)
move $a0, $s0
la $s0, L11
move $a1, $s0
jal stringEqual
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
lw $s0, -4($fp)
lw $s0, -4($s0)
addi $s0, $s0, -8
move $s0, $s0
li $s1, 0
move $a0, $s1
jal getchar
move $s1, $v0
move $s1, $s1
sw $s1, 0($s0)
j L16
L80:
move $sp, $fp
lw $ra, -4($sp)
lw $fp, -8($sp)
jr $ra
sw $ra, -4($sp)
sw $fp, -8($sp)
move $fp, $sp
addi $sp, $sp, -16
L83:
sw $a0, -4($fp)
sw $a1, -8($fp)
move $s0, $a2
li $s1, 0
move $s1, $s1
move $a0, $fp
jal L2
move $s2, $v0
move $s0, $s0
li $s2, 0
beq $s0, $s2, L19
j L18
L18:
addi $s0, $s0, 0
move $s0, $s0
move $a0, $fp
lw $s2, -4($fp)
lw $s2, -8($s2)
move $a1, $s2
jal L1
move $s2, $v0
move $s2, $s2
sw $s2, 0($s0)
L21:
move $a0, $fp
lw $s0, -4($fp)
lw $s0, -8($s0)
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
jal nilerror
move $s2, $v0
j L18
L22:
li $s0, 10
mul $s0, $s1, $s0 
move $s0, $s0
li $s1, 0
move $a0, $s1
lw $s1, -4($fp)
lw $s1, -8($s1)
move $a1, $s1
jal ord
move $s1, $v0
move $s1, $s1
add $s0, $s0, $s1 
move $s0, $s0
li $s1, 0
move $a0, $s1
la $s1, L3
move $a1, $s1
jal ord
move $s1, $v0
move $s1, $s1
sub $s0, $s0, $s1 
move $s1, $s0
lw $s0, -4($fp)
addi $s0, $s0, -8
move $s0, $s0
li $s2, 0
move $a0, $s2
jal getchar
move $s2, $v0
move $s2, $s2
sw $s2, 0($s0)
j L21
L82:
move $sp, $fp
lw $ra, -4($sp)
lw $fp, -8($sp)
jr $ra
sw $ra, -4($sp)
sw $fp, -8($sp)
move $fp, $sp
addi $sp, $sp, -16
L85:
sw $a0, -4($fp)
sw $a1, -8($fp)
li $s0, 4
move $a0, $s0
jal allocRecord
move $s0, $v0
move $s0, $s0
li $s1, 0
sw $s1, 0($s0)
move $s0, $s0
lw $s1, -4($fp)
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
jal nilerror
move $s2, $v0
j L27
L29:
li $s0, 8
move $a0, $s0
jal allocRecord
move $s0, $v0
move $s0, $s0
sw $s1, 0($s0)
addi $s1, $s0, 4
move $s1, $s1
lw $s2, -4($fp)
move $a0, $s2
jal L23
move $s2, $v0
move $s2, $s2
sw $s2, 0($s1)
move $s0, $s0
j L31
L84:
move $sp, $fp
lw $ra, -4($sp)
lw $fp, -8($sp)
jr $ra
sw $ra, -4($sp)
sw $fp, -8($sp)
move $fp, $sp
addi $sp, $sp, -16
L87:
sw $a0, -4($fp)
sw $a1, -8($fp)
move $s0, $a2
move $s1, $a3
li $s2, 0
beq $s0, $s2, L54
j L55
L55:
li $s2, 0
beq $s1, $s2, L51
j L52
L52:
move $s0, $s0
li $s2, 0
beq $s0, $s2, L33
j L32
L32:
lw $s2, 0($s0)
move $s2, $s2
move $s1, $s1
li $s3, 0
beq $s1, $s3, L35
j L34
L34:
lw $s3, 0($s1)
blt $s2, $s3, L48
j L49
L49:
li $s2, 8
move $a0, $s2
jal allocRecord
move $s2, $v0
move $s2, $s2
addi $s3, $s2, 0
move $s3, $s3
move $s1, $s1
li $s4, 0
beq $s1, $s4, L43
j L42
L42:
lw $s4, 0($s1)
sw $s4, 0($s3)
addi $s3, $s2, 4
move $s3, $s3
lw $s4, -4($fp)
move $s4, $s4
move $s0, $s0
move $s1, $s1
li $s5, 0
beq $s1, $s5, L45
j L44
L44:
move $a0, $s4
move $a1, $s0
lw $s0, 4($s1)
move $a2, $s0
jal L24
move $s0, $v0
move $s0, $s0
sw $s0, 0($s3)
move $s0, $s2
L50:
move $s0, $s0
L53:
move $s0, $s0
L56:
move $v0, $s0
j L86
L54:
move $s0, $s1
j L56
L51:
move $s0, $s0
j L53
L33:
jal nilerror
move $s2, $v0
j L32
L35:
jal nilerror
move $s3, $v0
j L34
L48:
li $s2, 8
move $a0, $s2
jal allocRecord
move $s2, $v0
move $s2, $s2
addi $s3, $s2, 0
move $s3, $s3
move $s0, $s0
li $s4, 0
beq $s0, $s4, L37
j L36
L36:
lw $s4, 0($s0)
sw $s4, 0($s3)
addi $s3, $s2, 4
move $s3, $s3
lw $s4, -4($fp)
move $s4, $s4
move $s0, $s0
li $s5, 0
beq $s0, $s5, L39
j L38
L38:
move $a0, $s4
lw $s0, 4($s0)
move $a1, $s0
move $a2, $s1
jal L24
move $s0, $v0
move $s0, $s0
sw $s0, 0($s3)
move $s0, $s2
j L50
L37:
jal nilerror
move $s4, $v0
j L36
L39:
jal nilerror
move $s5, $v0
j L38
L43:
jal nilerror
move $s4, $v0
j L42
L45:
jal nilerror
move $s5, $v0
j L44
L86:
move $sp, $fp
lw $ra, -4($sp)
lw $fp, -8($sp)
jr $ra
sw $ra, -4($sp)
sw $fp, -8($sp)
move $fp, $sp
addi $sp, $sp, -16
L89:
sw $a0, -4($fp)
sw $a1, -8($fp)
move $s0, $a2
li $s1, 0
bgt $s0, $s1, L58
j L59
L59:
li $s0, 0
move $v0, $s0
j L88
L58:
lw $s1, -4($fp)
move $a0, $s1
li $s1, 10
div $s0, $s1
mflo $s1
move $a1, $s1
jal L57
move $s1, $v0
li $s1, 10
div $s0, $s1
mflo $s1
li $s2, 10
mul $s1, $s1, $s2 
sub $s0, $s0, $s1 
move $s0, $s0
li $s1, 0
move $a0, $s1
la $s1, L3
move $a1, $s1
jal ord
move $s1, $v0
move $s1, $s1
li $s2, 0
move $a0, $s2
add $s0, $s0, $s1 
move $a1, $s0
jal chr
move $s0, $v0
move $s0, $s0
li $s1, 0
move $a0, $s1
move $a1, $s0
jal print
move $s0, $v0
j L59
L88:
move $sp, $fp
lw $ra, -4($sp)
lw $fp, -8($sp)
jr $ra
sw $ra, -4($sp)
sw $fp, -8($sp)
move $fp, $sp
addi $sp, $sp, -16
L91:
sw $a0, -4($fp)
sw $a1, -8($fp)
move $s0, $a2
li $s1, 0
blt $s0, $s1, L64
j L65
L65:
li $s1, 0
bgt $s0, $s1, L61
j L62
L62:
li $s0, 0
move $a0, $s0
la $s0, L3
move $a1, $s0
jal print
move $s0, $v0
move $s0, $s0
L63:
move $s0, $s0
L66:
move $v0, $s0
j L90
L64:
li $s1, 0
move $a0, $s1
la $s1, L60
move $a1, $s1
jal print
move $s1, $v0
move $a0, $fp
li $s1, 0
sub $s0, $s1, $s0 
move $a1, $s0
jal L57
move $s0, $v0
move $s0, $s0
j L66
L61:
move $a0, $fp
move $a1, $s0
jal L57
move $s0, $v0
move $s0, $s0
j L63
L90:
move $sp, $fp
lw $ra, -4($sp)
lw $fp, -8($sp)
jr $ra
sw $ra, -4($sp)
sw $fp, -8($sp)
move $fp, $sp
addi $sp, $sp, -16
L93:
sw $a0, -4($fp)
sw $a1, -8($fp)
move $s0, $a2
li $s1, 0
beq $s0, $s1, L75
j L76
L76:
lw $s1, -4($fp)
move $s1, $s1
move $s0, $s0
li $s2, 0
beq $s0, $s2, L68
j L67
L67:
move $a0, $s1
lw $s1, 0($s0)
move $a1, $s1
jal L25
move $s1, $v0
li $s1, 0
move $a0, $s1
la $s1, L10
move $a1, $s1
jal print
move $s1, $v0
lw $s1, -4($fp)
move $s1, $s1
move $s0, $s0
li $s2, 0
beq $s0, $s2, L72
j L71
L71:
move $a0, $s1
lw $s0, 4($s0)
move $a1, $s0
jal L26
move $s0, $v0
move $s0, $s0
L77:
move $v0, $s0
j L92
L75:
li $s0, 0
move $a0, $s0
la $s0, L11
move $a1, $s0
jal print
move $s0, $v0
move $s0, $s0
j L77
L68:
jal nilerror
move $s2, $v0
j L67
L72:
jal nilerror
move $s2, $v0
j L71
L92:
move $sp, $fp
lw $ra, -4($sp)
lw $fp, -8($sp)
jr $ra
sw $ra, -4($sp)
sw $fp, -8($sp)
move $fp, $sp
addi $sp, $sp, -16
L95:
sw $a0, -4($fp)
addi $s0, $fp, -8
move $s0, $s0
li $s1, 0
move $a0, $s1
jal getchar
move $s1, $v0
move $s1, $s1
sw $s1, 0($s0)
move $a0, $fp
jal L23
move $s0, $v0
move $s0, $s0
addi $s1, $fp, -8
move $s1, $s1
li $s2, 0
move $a0, $s2
jal getchar
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
lw $ra, -4($sp)
lw $fp, -8($sp)
jr $ra
