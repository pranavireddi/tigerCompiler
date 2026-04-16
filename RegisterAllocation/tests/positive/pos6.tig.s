.data

.text
.globl main
main:
addi $sp, $sp, -12
sw $ra, 0($sp)
sw $fp, 4($sp)
move $fp, $sp
L2749:
sw $a0, -4($fp)
li $s0, 2
li $s1, 0
bne $s0, $s1, L2746
j L2747
L2747:
li $s0, 0
move $v0, $s0
j L2748
L2746:
j L2747
L2748:
move $sp, $fp
lw $ra, 0($sp)
lw $fp, 4($sp)
addi $sp, $sp, 12
jr $ra
