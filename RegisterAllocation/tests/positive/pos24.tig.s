.data

.text
.globl main
main:
addi $sp, $sp, -16
sw $ra, 0($sp)
sw $fp, 4($sp)
move $fp, $sp
L2864:
sw $a0, -4($fp)
sw $a1, -8($fp)
move $s0, $a2
lw $s1, -4($fp)
lw $s1, -4($s1)
lw $s1, -8($s1)
add $s0, $s1, $s0 
move $v0, $s0
j L2863
L2863:
move $sp, $fp
lw $ra, 0($sp)
lw $fp, 4($sp)
addi $sp, $sp, 16
jr $ra
addi $sp, $sp, -16
sw $ra, 0($sp)
sw $fp, 4($sp)
move $fp, $sp
L2866:
sw $a0, -4($fp)
sw $a1, -8($fp)
li $s0, 2
move $s0, $s0
move $a0, $fp
move $a1, $s0
jal L2862
move $s0, $v0
move $v0, $s0
j L2865
L2865:
move $sp, $fp
lw $ra, 0($sp)
lw $fp, 4($sp)
addi $sp, $sp, 16
jr $ra
addi $sp, $sp, -16
sw $ra, 0($sp)
sw $fp, 4($sp)
move $fp, $sp
L2868:
sw $a0, -4($fp)
li $s0, 5
sw $s0, -8($fp)
move $a0, $fp
jal L2861
move $s0, $v0
move $v0, $s0
j L2867
L2867:
move $sp, $fp
lw $ra, 0($sp)
lw $fp, 4($sp)
addi $sp, $sp, 16
jr $ra
