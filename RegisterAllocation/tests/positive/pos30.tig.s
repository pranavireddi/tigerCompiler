
.data

.text
.globl L0
L0:
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
L6:
sw $a0, -44($fp)
sw $a1, -48($fp)
lw $s0, -44($fp)
lw $s0, -56($s0)
move $s0, $s0
li $s1, 0
beq $s0, $s1, L2
j L1
L1:
lw $s1, -44($fp)
lw $s1, -52($s1)
li $s2, 4
mul $s1, $s1, $s2 
add $s0, $s0, $s1 
lw $s0, 0($s0)
move $v0, $s0
j L5
L2:
jal tig_nilerror
move $s1, $v0
j L1
L5:
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
addi $sp, $sp, -96
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
L8:
sw $a0, -44($fp)
li $s0, 4
sw $s0, -52($fp)
addi $s0, $fp, -56
move $s0, $s0
li $s1, 5
move $a0, $s1
li $s1, 0
move $a1, $s1
jal tig_initArray
move $s1, $v0
move $s1, $s1
sw $s1, 0($s0)
lw $s0, -56($fp)
move $s0, $s0
li $s1, 0
beq $s0, $s1, L4
j L3
L3:
li $s1, 4
li $s2, 4
li $s3, 4
mul $s2, $s2, $s3 
add $s0, $s0, $s2 
sw $s1, 0($s0)
move $a0, $fp
jal L0
move $s0, $v0
move $v0, $s0
j L7
L4:
jal tig_nilerror
move $s1, $v0
j L3
L7:
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
addi $sp, $sp, 96
jr $ra
