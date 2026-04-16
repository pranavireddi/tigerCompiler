.data
L2468: .asciiz ""

.text
.globl main
main:
addi $sp, $sp, -12
sw $ra, 0($sp)
sw $fp, 4($sp)
move $fp, $sp
L2470:
sw $a0, -4($fp)
li $s0, 0
move $v0, $s0
j L2469
L2469:
move $sp, $fp
lw $ra, 0($sp)
lw $fp, 4($sp)
addi $sp, $sp, 12
jr $ra
