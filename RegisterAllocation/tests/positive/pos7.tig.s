.data

.text
.globl main
main:
addi $sp, $sp, -12
sw $ra, 0($sp)
sw $fp, 4($sp)
move $fp, $sp
L2756:
sw $a0, -4($fp)
li $s0, 0
move $s0, $s0
L2753:
li $s1, 20
blt $s0, $s1, L2754
j L2750
L2750:
move $v0, $s0
j L2755
L2754:
addi $s0, $s0, 1
move $s0, $s0
li $s1, 5
beq $s0, $s1, L2751
j L2752
L2752:
j L2753
L2751:
j L2750
L2755:
move $sp, $fp
lw $ra, 0($sp)
lw $fp, 4($sp)
addi $sp, $sp, 12
jr $ra
