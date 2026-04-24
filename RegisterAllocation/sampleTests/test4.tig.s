
.data

.text
.globl L10
L10:
addi $sp, $sp, -92
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
L15:
sw $a0, -44($fp)
sw $a1, -48($fp)
move $s0, $a2
lw $s0, -48($fp)
li $s1, 0
beq $s0, $s1, L11
j L12
L12:
lw $s0, -48($fp)
move $s0, $s0
lw $s1, -44($fp)
move $a0, $s1
lw $s1, -48($fp)
addi $s1, $s1, -1
move $a1, $s1
jal L10
move $s1, $v0
move $s1, $s1
mul $s0, $s0, $s1 
move $s0, $s0
L13:
move $v0, $s0
j L14
L11:
li $s0, 1
move $s0, $s0
j L13
L14:
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
addi $sp, $sp, 92
jr $ra
.globl tig_main
tig_main:
addi $sp, $sp, -88
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
L17:
sw $a0, -44($fp)
move $a0, $fp
li $s0, 10
move $a1, $s0
jal L10
move $s0, $v0
move $v0, $s0
j L16
L16:
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
addi $sp, $sp, 88
jr $ra
