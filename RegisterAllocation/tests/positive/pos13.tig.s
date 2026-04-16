.data

.text
.globl main
main:
addi $sp, $sp, -16
sw $ra, 0($sp)
sw $fp, 4($sp)
move $fp, $sp
L2809:
sw $a0, -4($fp)
sw $a1, -8($fp)
move $s0, $a2
addi $s0, $s0, 1
move $v0, $s0
j L2808
L2808:
move $sp, $fp
lw $ra, 0($sp)
lw $fp, 4($sp)
addi $sp, $sp, 16
jr $ra
addi $sp, $sp, -12
sw $ra, 0($sp)
sw $fp, 4($sp)
move $fp, $sp
L2811:
sw $a0, -4($fp)
li $s0, 1
move $s0, $s0
move $a0, $fp
li $s0, 10
move $a1, $s0
jal L2807
move $s0, $v0
move $v0, $s0
j L2810
L2810:
move $sp, $fp
lw $ra, 0($sp)
lw $fp, 4($sp)
addi $sp, $sp, 12
jr $ra
