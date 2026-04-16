.data

.text
.globl main
main:
addi $sp, $sp, -16
sw $ra, 0($sp)
sw $fp, 4($sp)
move $fp, $sp
L2781:
sw $a0, -4($fp)
sw $a1, -8($fp)
li $s0, 0
move $s0, $s0
li $s1, 10
move $s1, $s1
ble $s0, $s1, L2778
j L2774
L2774:
li $s0, 0
move $v0, $s0
j L2780
L2778:
li $s2, 5
beq $s0, $s2, L2775
j L2776
L2776:
bge $s0, $s1, L2774
j L2779
L2779:
addi $s0, $s0, 1
move $s0, $s0
j L2778
L2775:
j L2774
L2780:
move $sp, $fp
lw $ra, 0($sp)
lw $fp, 4($sp)
addi $sp, $sp, 16
jr $ra
addi $sp, $sp, -12
sw $ra, 0($sp)
sw $fp, 4($sp)
move $fp, $sp
L2783:
sw $a0, -4($fp)
move $a0, $fp
jal L2773
move $s0, $v0
move $v0, $s0
j L2782
L2782:
move $sp, $fp
lw $ra, 0($sp)
lw $fp, 4($sp)
addi $sp, $sp, 12
jr $ra
