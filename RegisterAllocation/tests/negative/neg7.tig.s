.data

.text
.globl main
main:
addi $sp, $sp, -12
sw $ra, 0($sp)
sw $fp, 4($sp)
move $fp, $sp
L2505:
sw $a0, -4($fp)
li $s0, 4
move $a0, $s0
jal allocRecord
move $s0, $v0
move $s0, $s0
li $s1, 1
sw $s1, 0($s0)
move $s0, $s0
li $s0, 4
move $a0, $s0
jal allocRecord
move $s0, $v0
move $s0, $s0
li $s1, 1
sw $s1, 0($s0)
move $s0, $s0
li $s0, 0
move $v0, $s0
j L2504
L2504:
move $sp, $fp
lw $ra, 0($sp)
lw $fp, 4($sp)
addi $sp, $sp, 12
jr $ra
