.data

.text
.globl main
main:
addi $sp, $sp, -12
sw $ra, 0($sp)
sw $fp, 4($sp)
move $fp, $sp
L2740:
sw $a0, -4($fp)
li $s0, 0
move $s0, $s0
li $s1, 10
move $s1, $s1
ble $s0, $s1, L2737
j L2733
L2733:
li $s0, 0
move $v0, $s0
j L2739
L2737:
li $s2, 5
beq $s0, $s2, L2734
j L2735
L2735:
bge $s0, $s1, L2733
j L2738
L2738:
addi $s0, $s0, 1
move $s0, $s0
j L2737
L2734:
j L2733
L2739:
move $sp, $fp
lw $ra, 0($sp)
lw $fp, 4($sp)
addi $sp, $sp, 12
jr $ra
