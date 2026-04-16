.data

.text
.globl main
main:
addi $sp, $sp, -16
sw $ra, 0($sp)
sw $fp, 4($sp)
move $fp, $sp
L2905:
sw $a0, -4($fp)
sw $a1, -8($fp)
lw $s0, -4($fp)
lw $s0, -8($s0)
move $s0, $s0
li $s1, 0
beq $s0, $s1, L2903
j L2902
L2902:
lw $s0, 0($s0)
move $v0, $s0
j L2904
L2903:
jal nilerror
move $s1, $v0
j L2902
L2904:
move $sp, $fp
lw $ra, 0($sp)
lw $fp, 4($sp)
addi $sp, $sp, 16
jr $ra
addi $sp, $sp, -16
sw $ra, 0($sp)
sw $fp, 4($sp)
move $fp, $sp
L2907:
sw $a0, -4($fp)
addi $s0, $fp, -8
move $s0, $s0
li $s1, 4
move $a0, $s1
jal allocRecord
move $s1, $v0
move $s1, $s1
li $s2, 1
sw $s2, 0($s1)
sw $s1, 0($s0)
move $a0, $fp
jal L2901
move $s0, $v0
move $v0, $s0
j L2906
L2906:
move $sp, $fp
lw $ra, 0($sp)
lw $fp, 4($sp)
addi $sp, $sp, 16
jr $ra
