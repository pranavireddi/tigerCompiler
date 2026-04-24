
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
L357:
sw $a0, -44($fp)
li $s0, 4
move $a0, $s0
jal tig_allocRecord
move $s0, $v0
move $s0, $s0
li $s1, 5
sw $s1, 0($s0)
move $s0, $s0
move $s0, $s0
li $s1, 0
beq $s0, $s1, L355
j L354
L354:
lw $s0, 0($s0)
move $v0, $s0
j L356
L355:
jal tig_nilerror
move $s1, $v0
j L354
L356:
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
