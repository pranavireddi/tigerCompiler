
.data

.text
.globl tig_main
tig_main:
addi $sp, $sp, -44
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
L4:
sw $a0, 40($fp)
li $s0, 10
li $s1, 20
bgt $s0, $s1, L0
j L1
L1:
li $s0, 40
move $s0, $s0
L2:
move $v0, $s0
j L3
L0:
li $s0, 30
move $s0, $s0
j L2
L3:
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
addi $sp, $sp, 44
jr $ra
