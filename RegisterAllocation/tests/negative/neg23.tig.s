.data

.text
.globl main
main:
addi $sp, $sp, -16
sw $ra, 0($sp)
sw $fp, 4($sp)
move $fp, $sp
L2564:
sw $a0, -4($fp)
sw $a1, -8($fp)
move $s0, $a2
li $s0, 1
move $v0, $s0
j L2563
L2563:
move $sp, $fp
lw $ra, 0($sp)
lw $fp, 4($sp)
addi $sp, $sp, 16
jr $ra
addi $sp, $sp, -12
sw $ra, 0($sp)
sw $fp, 4($sp)
move $fp, $sp
L2566:
sw $a0, -4($fp)
li $s0, 0
move $v0, $s0
j L2565
L2565:
move $sp, $fp
lw $ra, 0($sp)
lw $fp, 4($sp)
addi $sp, $sp, 12
jr $ra
