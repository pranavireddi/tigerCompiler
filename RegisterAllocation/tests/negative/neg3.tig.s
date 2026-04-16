.data

.text
.globl main
main:
addi $sp, $sp, -16
sw $ra, 0($sp)
sw $fp, 4($sp)
move $fp, $sp
L2479:
sw $a0, -4($fp)
sw $a1, -8($fp)
li $s0, 0
move $v0, $s0
j L2478
L2478:
move $sp, $fp
lw $ra, 0($sp)
lw $fp, 4($sp)
addi $sp, $sp, 16
jr $ra
addi $sp, $sp, -12
sw $ra, 0($sp)
sw $fp, 4($sp)
move $fp, $sp
L2481:
sw $a0, -4($fp)
li $s0, 0
move $s0, $s0
li $s1, 10
move $s1, $s1
ble $s0, $s1, L2476
j L2473
L2473:
li $s0, 0
move $v0, $s0
j L2480
L2476:
move $a0, $fp
jal L2474
move $s2, $v0
bge $s0, $s1, L2473
j L2477
L2477:
addi $s0, $s0, 1
move $s0, $s0
j L2476
L2480:
move $sp, $fp
lw $ra, 0($sp)
lw $fp, 4($sp)
addi $sp, $sp, 12
jr $ra
