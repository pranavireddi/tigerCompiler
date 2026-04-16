.data

.text
.globl main
main:
addi $sp, $sp, -16
sw $ra, 0($sp)
sw $fp, 4($sp)
move $fp, $sp
L2835:
sw $a0, -4($fp)
sw $a1, -8($fp)
lw $s0, -4($fp)
move $a0, $s0
jal L2833
move $s0, $v0
move $v0, $s0
j L2834
L2834:
move $sp, $fp
lw $ra, 0($sp)
lw $fp, 4($sp)
addi $sp, $sp, 16
jr $ra
addi $sp, $sp, -16
sw $ra, 0($sp)
sw $fp, 4($sp)
move $fp, $sp
L2837:
sw $a0, -4($fp)
sw $a1, -8($fp)
li $s0, 1
move $v0, $s0
j L2836
L2836:
move $sp, $fp
lw $ra, 0($sp)
lw $fp, 4($sp)
addi $sp, $sp, 16
jr $ra
addi $sp, $sp, -12
sw $ra, 0($sp)
sw $fp, 4($sp)
move $fp, $sp
L2839:
sw $a0, -4($fp)
move $a0, $fp
jal L2832
move $s0, $v0
move $v0, $s0
j L2838
L2838:
move $sp, $fp
lw $ra, 0($sp)
lw $fp, 4($sp)
addi $sp, $sp, 12
jr $ra
