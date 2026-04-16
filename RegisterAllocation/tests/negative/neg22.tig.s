.data

.text
.globl main
main:
addi $sp, $sp, -16
sw $ra, 0($sp)
sw $fp, 4($sp)
move $fp, $sp
L2559:
sw $a0, -4($fp)
sw $a1, -8($fp)
move $s0, $a2
move $s0, $a3
move $v0, $s0
j L2558
L2558:
move $sp, $fp
lw $ra, 0($sp)
lw $fp, 4($sp)
addi $sp, $sp, 16
jr $ra
addi $sp, $sp, -12
sw $ra, 0($sp)
sw $fp, 4($sp)
move $fp, $sp
L2561:
sw $a0, -4($fp)
li $s0, 0
move $v0, $s0
j L2560
L2560:
move $sp, $fp
lw $ra, 0($sp)
lw $fp, 4($sp)
addi $sp, $sp, 12
jr $ra
