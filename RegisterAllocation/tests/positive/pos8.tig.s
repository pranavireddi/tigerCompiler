.data

.text
.globl main
main:
addi $sp, $sp, -12
sw $ra, 0($sp)
sw $fp, 4($sp)
move $fp, $sp
L2765:
sw $a0, -4($fp)
li $s0, 0
move $s0, $s0
li $s1, 10
move $s1, $s1
ble $s0, $s1, L2762
j L2757
L2757:
li $s0, 0
move $v0, $s0
j L2764
L2762:
li $s2, 5
beq $s0, $s2, L2758
j L2759
L2759:
addi $s0, $s0, 1
move $s0, $s0
li $s2, 0
move $s2, $s2
L2760:
bge $s0, $s1, L2757
j L2763
L2763:
addi $s0, $s0, 1
move $s0, $s0
j L2762
L2758:
j L2757
L2766:
li $s2, 0
move $s2, $s2
j L2760
L2764:
move $sp, $fp
lw $ra, 0($sp)
lw $fp, 4($sp)
addi $sp, $sp, 12
jr $ra
