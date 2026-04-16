.data

.text
.globl main
main:
addi $sp, $sp, -16
sw $ra, 0($sp)
sw $fp, 4($sp)
move $fp, $sp
L2796:
sw $a0, -4($fp)
sw $a1, -8($fp)
li $s0, 0
move $s0, $s0
li $s1, 10
move $s1, $s1
ble $s0, $s1, L2790
j L2786
L2786:
li $s0, 0
move $v0, $s0
j L2795
L2790:
li $s2, 5
beq $s0, $s2, L2787
j L2788
L2788:
bge $s0, $s1, L2786
j L2791
L2791:
addi $s0, $s0, 1
move $s0, $s0
j L2790
L2787:
j L2786
L2795:
move $sp, $fp
lw $ra, 0($sp)
lw $fp, 4($sp)
addi $sp, $sp, 16
jr $ra
addi $sp, $sp, -12
sw $ra, 0($sp)
sw $fp, 4($sp)
move $fp, $sp
L2798:
sw $a0, -4($fp)
li $s0, 0
move $s0, $s0
li $s1, 10
move $s1, $s1
ble $s0, $s1, L2793
j L2784
L2784:
li $s0, 0
move $v0, $s0
j L2797
L2793:
move $a0, $fp
jal L2785
move $s2, $v0
bge $s0, $s1, L2784
j L2794
L2794:
addi $s0, $s0, 1
move $s0, $s0
j L2793
L2797:
move $sp, $fp
lw $ra, 0($sp)
lw $fp, 4($sp)
addi $sp, $sp, 12
jr $ra
