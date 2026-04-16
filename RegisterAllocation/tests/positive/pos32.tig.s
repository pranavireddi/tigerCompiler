.data

.text
.globl main
main:
addi $sp, $sp, -16
sw $ra, 0($sp)
sw $fp, 4($sp)
move $fp, $sp
L2926:
sw $a0, -4($fp)
sw $a1, -8($fp)
lw $s0, -4($fp)
lw $s0, -8($s0)
addi $s0, $s0, 1
lw $s1, -4($fp)
sw $s0, -8($s1)
lw $s0, -4($fp)
lw $s0, -8($s0)
move $v0, $s0
j L2925
L2925:
move $sp, $fp
lw $ra, 0($sp)
lw $fp, 4($sp)
addi $sp, $sp, 16
jr $ra
addi $sp, $sp, -16
sw $ra, 0($sp)
sw $fp, 4($sp)
move $fp, $sp
L2928:
sw $a0, -4($fp)
li $s0, 0
sw $s0, -8($fp)
move $a0, $fp
jal L2924
move $s0, $v0
move $v0, $s0
j L2927
L2927:
move $sp, $fp
lw $ra, 0($sp)
lw $fp, 4($sp)
addi $sp, $sp, 16
jr $ra
