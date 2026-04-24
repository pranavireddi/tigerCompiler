
.data

.text
.globl L422
L422:
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
L424:
sw $a0, -44($fp)
sw $a1, -48($fp)
move $s0, $a2
lw $s0, -44($fp)
lw $s0, -44($s0)
lw $s0, -52($s0)
lw $s1, -48($fp)
add $s0, $s0, $s1 
move $v0, $s0
j L423
L423:
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
.globl L421
L421:
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
L426:
sw $a0, -44($fp)
sw $a1, -48($fp)
li $s0, 2
move $s0, $s0
move $a0, $fp
move $a1, $s0
jal L422
move $s0, $v0
move $v0, $s0
j L425
L425:
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
L428:
sw $a0, -44($fp)
li $s0, 5
sw $s0, -52($fp)
move $a0, $fp
jal L421
move $s0, $v0
move $v0, $s0
j L427
L427:
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
