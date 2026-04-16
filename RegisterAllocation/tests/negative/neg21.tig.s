.data
L2554: .asciiz "a"

.text
.globl main
main:
addi $sp, $sp, -12
sw $ra, 0($sp)
sw $fp, 4($sp)
move $fp, $sp
L2556:
sw $a0, -4($fp)
li $s0, 0
move $s0, $s0
li $s0, 0
move $v0, $s0
j L2555
L2555:
move $sp, $fp
lw $ra, 0($sp)
lw $fp, 4($sp)
addi $sp, $sp, 12
jr $ra
