.data

.text
.globl main
main:
addi $sp, $sp, -12
sw $ra, 0($sp)
sw $fp, 4($sp)
move $fp, $sp
L2745:
sw $a0, -4($fp)
L2741:
li $s0, 0
move $s0, $s0
L2743:
move $v0, $s0
j L2744
L2742:
li $s0, 0
move $s0, $s0
j L2743
L2744:
move $sp, $fp
lw $ra, 0($sp)
lw $fp, 4($sp)
addi $sp, $sp, 12
jr $ra
