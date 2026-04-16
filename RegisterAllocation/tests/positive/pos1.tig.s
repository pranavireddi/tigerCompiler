.data

.text
.globl main
main:
addi $sp, $sp, -12
sw $ra, 0($sp)
sw $fp, 4($sp)
move $fp, $sp
L2719:
sw $a0, -4($fp)
li $s0, 10
move $s0, $s0
li $s1, 1
move $s1, $s1
ble $s0, $s1, L2716
j L2714
L2714:
li $s0, 0
move $v0, $s0
j L2718
L2716:
bge $s0, $s1, L2714
j L2717
L2717:
addi $s0, $s0, 1
move $s0, $s0
j L2716
L2718:
move $sp, $fp
lw $ra, 0($sp)
lw $fp, 4($sp)
addi $sp, $sp, 12
jr $ra
