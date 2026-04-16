.data

.text
.globl main
main:
addi $sp, $sp, -12
sw $ra, 0($sp)
sw $fp, 4($sp)
move $fp, $sp
L2821:
sw $a0, -4($fp)
li $s0, 4
move $a0, $s0
jal allocRecord
move $s0, $v0
move $s0, $s0
li $s1, 5
sw $s1, 0($s0)
move $s0, $s0
move $s0, $s0
li $s1, 0
beq $s0, $s1, L2819
j L2818
L2818:
lw $s0, 0($s0)
move $v0, $s0
j L2820
L2819:
jal nilerror
move $s1, $v0
j L2818
L2820:
move $sp, $fp
lw $ra, 0($sp)
lw $fp, 4($sp)
addi $sp, $sp, 12
jr $ra
