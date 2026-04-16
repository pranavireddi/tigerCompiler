.data
L2535: .asciiz "a"

.text
.globl main
main:
addi $sp, $sp, -12
sw $ra, 0($sp)
sw $fp, 4($sp)
move $fp, $sp
L2537:
sw $a0, -4($fp)
li $s0, 0
move $v0, $s0
j L2536
L2536:
move $sp, $fp
lw $ra, 0($sp)
lw $fp, 4($sp)
addi $sp, $sp, 12
jr $ra
