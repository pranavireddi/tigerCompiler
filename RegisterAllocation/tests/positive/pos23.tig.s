.data

.text
.globl main
main:
addi $sp, $sp, -16
sw $ra, 0($sp)
sw $fp, 4($sp)
move $fp, $sp
L2856:
sw $a0, -4($fp)
sw $a1, -8($fp)
lw $s0, -4($fp)
lw $s0, -4($s0)
lw $s0, -8($s0)
move $v0, $s0
j L2855
L2855:
move $sp, $fp
lw $ra, 0($sp)
lw $fp, 4($sp)
addi $sp, $sp, 16
jr $ra
addi $sp, $sp, -16
sw $ra, 0($sp)
sw $fp, 4($sp)
move $fp, $sp
L2858:
sw $a0, -4($fp)
sw $a1, -8($fp)
move $a0, $fp
jal L2854
move $s0, $v0
move $v0, $s0
j L2857
L2857:
move $sp, $fp
lw $ra, 0($sp)
lw $fp, 4($sp)
addi $sp, $sp, 16
jr $ra
addi $sp, $sp, -16
sw $ra, 0($sp)
sw $fp, 4($sp)
move $fp, $sp
L2860:
sw $a0, -4($fp)
li $s0, 5
sw $s0, -8($fp)
move $a0, $fp
jal L2853
move $s0, $v0
move $v0, $s0
j L2859
L2859:
move $sp, $fp
lw $ra, 0($sp)
lw $fp, 4($sp)
addi $sp, $sp, 16
jr $ra
