.data

.text
.globl main
main:
addi $sp, $sp, -12
sw $ra, 0($sp)
sw $fp, 4($sp)
move $fp, $sp
L2725:
sw $a0, -4($fp)
li $s0, 10
move $s0, $s0
li $s1, 20
move $s1, $s1
ble $s0, $s1, L2722
j L2720
L2720:
li $s0, 0
move $v0, $s0
j L2724
L2722:
bge $s0, $s1, L2720
j L2723
L2723:
addi $s0, $s0, 1
move $s0, $s0
j L2722
L2724:
move $sp, $fp
lw $ra, 0($sp)
lw $fp, 4($sp)
addi $sp, $sp, 12
jr $ra
