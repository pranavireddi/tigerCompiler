.data

.text
.globl main
main:
addi $sp, $sp, -16
sw $ra, 0($sp)
sw $fp, 4($sp)
move $fp, $sp
L2606:
sw $a0, -4($fp)
sw $a1, -8($fp)
move $s0, $a2
move $s1, $a3
add $s0, $s0, $s1 
move $v0, $s0
j L2605
L2605:
move $sp, $fp
lw $ra, 0($sp)
lw $fp, 4($sp)
addi $sp, $sp, 16
jr $ra
addi $sp, $sp, -12
sw $ra, 0($sp)
sw $fp, 4($sp)
move $fp, $sp
L2608:
sw $a0, -4($fp)
move $a0, $fp
li $s0, 1
move $a1, $s0
jal L2604
move $s0, $v0
move $v0, $s0
j L2607
L2607:
move $sp, $fp
lw $ra, 0($sp)
lw $fp, 4($sp)
addi $sp, $sp, 12
jr $ra
