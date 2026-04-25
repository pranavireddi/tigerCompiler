
.data

.text
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
li $s0, 5
move $a0, $s0
li $s0, 0
move $a1, $s0
jal tig_initArray
move $s0, $v0
move $s0, $s0
move $s0, $s0
li $s1, 0
beq $s0, $s1, L5
j L4
L4:
li $s1, 1
li $s2, 0
li $s3, 4
mul $s2, $s2, $s3 
add $s2, $s0, $s2 
sw $s1, 0($s2)
move $s0, $s0
li $s1, 0
beq $s0, $s1, L7
j L6
L6:
li $s1, 2
li $s2, 1
li $s3, 4
mul $s2, $s2, $s3 
add $s2, $s0, $s2 
sw $s1, 0($s2)
move $s0, $s0
li $s1, 0
beq $s0, $s1, L9
j L8
L8:
li $s1, 3
li $s2, 2
li $s3, 4
mul $s2, $s2, $s3 
add $s2, $s0, $s2 
sw $s1, 0($s2)
move $s0, $s0
li $s1, 0
beq $s0, $s1, L11
j L10
L10:
li $s1, 4
li $s2, 3
li $s3, 4
mul $s2, $s2, $s3 
add $s2, $s0, $s2 
sw $s1, 0($s2)
move $s0, $s0
li $s1, 0
beq $s0, $s1, L13
j L12
L12:
li $s1, 5
li $s2, 4
li $s3, 4
mul $s2, $s2, $s3 
add $s2, $s0, $s2 
sw $s1, 0($s2)
move $s0, $s0
li $s1, 0
beq $s0, $s1, L15
j L14
L14:
li $s1, 2
li $s2, 4
mul $s1, $s1, $s2 
add $s0, $s0, $s1 
lw $s0, 0($s0)
move $v0, $s0
j L16
L5:
jal tig_nilerror
move $s1, $v0
j L4
L7:
jal tig_nilerror
move $s1, $v0
j L6
L9:
jal tig_nilerror
move $s1, $v0
j L8
L11:
jal tig_nilerror
move $s1, $v0
j L10
L13:
jal tig_nilerror
move $s1, $v0
j L12
L15:
jal tig_nilerror
move $s1, $v0
j L14
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
