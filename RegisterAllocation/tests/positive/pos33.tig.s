.data

.text
.globl main
main:
addi $sp, $sp, -16
sw $ra, 0($sp)
sw $fp, 4($sp)
move $fp, $sp
L2932:
sw $a0, -4($fp)
sw $a1, -8($fp)
lw $s0, -4($fp)
lw $s0, -12($s0)
move $v0, $s0
j L2931
L2931:
move $sp, $fp
lw $ra, 0($sp)
lw $fp, 4($sp)
addi $sp, $sp, 16
jr $ra
addi $sp, $sp, -20
sw $ra, 0($sp)
sw $fp, 4($sp)
move $fp, $sp
L2934:
sw $a0, -4($fp)
sw $a1, -8($fp)
sw $a2, -12($fp)
move $a0, $fp
jal L2930
move $s0, $v0
move $v0, $s0
j L2933
L2933:
move $sp, $fp
lw $ra, 0($sp)
lw $fp, 4($sp)
addi $sp, $sp, 20
jr $ra
addi $sp, $sp, -12
sw $ra, 0($sp)
sw $fp, 4($sp)
move $fp, $sp
L2936:
sw $a0, -4($fp)
move $a0, $fp
li $s0, 2
move $a1, $s0
jal L2929
move $s0, $v0
move $v0, $s0
j L2935
L2935:
move $sp, $fp
lw $ra, 0($sp)
lw $fp, 4($sp)
addi $sp, $sp, 12
jr $ra
