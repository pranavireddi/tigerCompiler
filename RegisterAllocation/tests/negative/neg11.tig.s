.data

.text
.globl main
main:
addi $sp, $sp, -16
sw $ra, 0($sp)
sw $fp, 4($sp)
move $fp, $sp
L2517:
sw $a0, -4($fp)
sw $a1, -8($fp)
li $s0, 0
move $v0, $s0
j L2516
L2516:
move $sp, $fp
lw $ra, 0($sp)
lw $fp, 4($sp)
addi $sp, $sp, 16
jr $ra
addi $sp, $sp, -12
sw $ra, 0($sp)
sw $fp, 4($sp)
move $fp, $sp
L2519:
sw $a0, -4($fp)
move $a0, $fp
jal L2515
move $s0, $v0
move $v0, $s0
j L2518
L2518:
move $sp, $fp
lw $ra, 0($sp)
lw $fp, 4($sp)
addi $sp, $sp, 12
jr $ra
