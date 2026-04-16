.data

.text
.globl main
main:
addi $sp, $sp, -12
sw $ra, 0($sp)
sw $fp, 4($sp)
move $fp, $sp
L2549:
sw $a0, -4($fp)
li $s0, 0
move $s0, $s0
li $s1, 10
move $s1, $s1
ble $s0, $s1, L2546
j L2544
L2544:
li $s0, 0
move $v0, $s0
j L2548
L2546:
li $s0, 5
move $s0, $s0
bge $s0, $s1, L2544
j L2547
L2547:
addi $s0, $s0, 1
move $s0, $s0
j L2546
L2548:
move $sp, $fp
lw $ra, 0($sp)
lw $fp, 4($sp)
addi $sp, $sp, 12
jr $ra
