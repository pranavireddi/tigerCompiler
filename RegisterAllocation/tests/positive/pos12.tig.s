.data

.text
.globl main
main:
addi $sp, $sp, -16
sw $ra, 0($sp)
sw $fp, 4($sp)
move $fp, $sp
L2802:
sw $a0, -4($fp)
sw $a1, -8($fp)
move $s0, $a2
lw $s1, -4($fp)
move $a0, $s1
move $a1, $s0
jal L2800
move $s0, $v0
move $v0, $s0
j L2801
L2801:
move $sp, $fp
lw $ra, 0($sp)
lw $fp, 4($sp)
addi $sp, $sp, 16
jr $ra
addi $sp, $sp, -16
sw $ra, 0($sp)
sw $fp, 4($sp)
move $fp, $sp
L2804:
sw $a0, -4($fp)
sw $a1, -8($fp)
move $s0, $a2
lw $s1, -4($fp)
move $a0, $s1
move $a1, $s0
jal L2799
move $s0, $v0
move $v0, $s0
j L2803
L2803:
move $sp, $fp
lw $ra, 0($sp)
lw $fp, 4($sp)
addi $sp, $sp, 16
jr $ra
addi $sp, $sp, -12
sw $ra, 0($sp)
sw $fp, 4($sp)
move $fp, $sp
L2806:
sw $a0, -4($fp)
move $a0, $fp
li $s0, 1
move $a1, $s0
jal L2799
move $s0, $v0
move $v0, $s0
j L2805
L2805:
move $sp, $fp
lw $ra, 0($sp)
lw $fp, 4($sp)
addi $sp, $sp, 12
jr $ra
