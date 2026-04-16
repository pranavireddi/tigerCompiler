.data

.text
.globl main
main:
addi $sp, $sp, -16
sw $ra, 0($sp)
sw $fp, 4($sp)
move $fp, $sp
L2493:
sw $a0, -4($fp)
sw $a1, -8($fp)
li $s0, 0
move $v0, $s0
j L2492
L2492:
move $sp, $fp
lw $ra, 0($sp)
lw $fp, 4($sp)
addi $sp, $sp, 16
jr $ra
addi $sp, $sp, -12
sw $ra, 0($sp)
sw $fp, 4($sp)
move $fp, $sp
L2495:
sw $a0, -4($fp)
li $s0, 0
move $s0, $s0
li $s1, 10
move $s1, $s1
ble $s0, $s1, L2490
j L2488
L2488:
li $s0, 0
move $v0, $s0
j L2494
L2490:
move $a0, $fp
jal L2487
move $s2, $v0
bge $s0, $s1, L2488
j L2491
L2491:
addi $s0, $s0, 1
move $s0, $s0
j L2490
L2494:
move $sp, $fp
lw $ra, 0($sp)
lw $fp, 4($sp)
addi $sp, $sp, 12
jr $ra
