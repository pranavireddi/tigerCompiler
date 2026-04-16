.data

.text
.globl main
main:
addi $sp, $sp, -16
sw $ra, 0($sp)
sw $fp, 4($sp)
move $fp, $sp
L2584:
sw $a0, -4($fp)
sw $a1, -8($fp)
li $s0, 10
move $v0, $s0
j L2583
L2583:
move $sp, $fp
lw $ra, 0($sp)
lw $fp, 4($sp)
addi $sp, $sp, 16
jr $ra
addi $sp, $sp, -12
sw $ra, 0($sp)
sw $fp, 4($sp)
move $fp, $sp
L2586:
sw $a0, -4($fp)
move $a0, $fp
jal L2582
move $s0, $v0
move $v0, $s0
j L2585
L2585:
move $sp, $fp
lw $ra, 0($sp)
lw $fp, 4($sp)
addi $sp, $sp, 12
jr $ra
