
.data

.text
.globl L437
L437:
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
L441:
sw $a0, -44($fp)
sw $a1, -48($fp)
lw $s0, -44($fp)
lw $s0, -52($s0)
move $s0, $s0
li $s1, 0
beq $s0, $s1, L439
j L438
L438:
lw $s0, 0($s0)
move $v0, $s0
j L440
L439:
jal tig_nilerror
move $s1, $v0
j L438
L440:
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
L443:
sw $a0, -44($fp)
addi $s0, $fp, -52
move $s0, $s0
li $s1, 4
move $a0, $s1
jal tig_allocRecord
move $s1, $v0
move $s1, $s1
li $s2, 1
sw $s2, 0($s1)
sw $s1, 0($s0)
move $a0, $fp
jal L437
move $s0, $v0
move $v0, $s0
j L442
L442:
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
