.data
L2590: .asciiz "a"

.text
.globl main
main:
addi $sp, $sp, -16
sw $ra, 0($sp)
sw $fp, 4($sp)
move $fp, $sp
L2592:
sw $a0, -4($fp)
sw $a1, -8($fp)
move $s0, $a2
move $v0, $s0
j L2591
L2591:
move $sp, $fp
lw $ra, 0($sp)
lw $fp, 4($sp)
addi $sp, $sp, 16
jr $ra
addi $sp, $sp, -12
sw $ra, 0($sp)
sw $fp, 4($sp)
move $fp, $sp
L2594:
sw $a0, -4($fp)
move $a0, $fp
li $s0, 0
move $a1, $s0
jal L2589
move $s0, $v0
move $v0, $s0
j L2593
L2593:
move $sp, $fp
lw $ra, 0($sp)
lw $fp, 4($sp)
addi $sp, $sp, 12
jr $ra
