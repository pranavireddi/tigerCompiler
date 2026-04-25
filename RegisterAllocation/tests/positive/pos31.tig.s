
.data

.text
.globl L452
L452:
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
L457:
sw $a0, -44($fp)
sw $a1, -48($fp)
lw $s0, -44($fp)
lw $s0, -52($s0)
move $v0, $s0
j L456
L456:
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
L459:
sw $a0, -44($fp)
li $s0, 0
sw $s0, -52($fp)
li $s0, 10
move $s0, $s0
lw $s1, -52($fp)
ble $s1, $s0, L454
j L451
L451:
li $s0, 0
move $v0, $s0
j L458
L454:
move $a0, $fp
jal L452
move $s1, $v0
lw $s1, -52($fp)
bge $s1, $s0, L451
j L455
L455:
lw $s1, -52($fp)
addi $s1, $s1, 1
sw $s1, -52($fp)
j L454
L458:
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
