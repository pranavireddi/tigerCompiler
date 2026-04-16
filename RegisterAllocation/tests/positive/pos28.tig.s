.data

.text
.globl main
main:
addi $sp, $sp, -16
sw $ra, 0($sp)
sw $fp, 4($sp)
move $fp, $sp
L2896:
sw $a0, -4($fp)
sw $a1, -8($fp)
move $s0, $a2
move $v0, $s0
j L2895
L2895:
move $sp, $fp
lw $ra, 0($sp)
lw $fp, 4($sp)
addi $sp, $sp, 16
jr $ra
addi $sp, $sp, -16
sw $ra, 0($sp)
sw $fp, 4($sp)
move $fp, $sp
L2898:
sw $a0, -4($fp)
sw $a1, -8($fp)
li $s0, 2
move $s0, $s0
move $a0, $fp
move $a1, $s0
jal L2894
move $s0, $v0
move $v0, $s0
j L2897
L2897:
move $sp, $fp
lw $ra, 0($sp)
lw $fp, 4($sp)
addi $sp, $sp, 16
jr $ra
addi $sp, $sp, -12
sw $ra, 0($sp)
sw $fp, 4($sp)
move $fp, $sp
L2900:
sw $a0, -4($fp)
li $s0, 5
move $s0, $s0
move $a0, $fp
jal L2893
move $s0, $v0
move $v0, $s0
j L2899
L2899:
move $sp, $fp
lw $ra, 0($sp)
lw $fp, 4($sp)
addi $sp, $sp, 12
jr $ra
