
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
L233:
sw $a0, -44($fp)
li $s0, 0
move $s0, $s0
li $s1, 0
beq $s0, $s1, L228
j L229
L229:
li $s1, 1
move $s1, $s1
li $s2, 0
bne $s0, $s2, L230
j L231
L231:
li $s0, 0
move $s1, $s0
L230:
move $v0, $s1
j L232
L228:
j L229
L232:
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
