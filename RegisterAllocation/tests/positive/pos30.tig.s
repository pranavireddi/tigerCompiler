.data

.text
.globl main
main:
addi $sp, $sp, -16
sw $ra, 0($sp)
sw $fp, 4($sp)
move $fp, $sp
L2912:
sw $a0, -4($fp)
sw $a1, -8($fp)
lw $s0, -4($fp)
lw $s0, -12($s0)
move $s0, $s0
li $s1, 0
beq $s0, $s1, L2910
j L2909
L2909:
lw $s1, -4($fp)
lw $s1, -8($s1)
li $s2, 4
mul $s1, $s1, $s2 
add $s0, $s0, $s1 
lw $s0, 0($s0)
move $v0, $s0
j L2911
L2910:
jal nilerror
move $s1, $v0
j L2909
L2911:
move $sp, $fp
lw $ra, 0($sp)
lw $fp, 4($sp)
addi $sp, $sp, 16
jr $ra
addi $sp, $sp, -20
sw $ra, 0($sp)
sw $fp, 4($sp)
move $fp, $sp
L2914:
sw $a0, -4($fp)
li $s0, 3
sw $s0, -8($fp)
addi $s0, $fp, -12
move $s0, $s0
li $s1, 5
move $a0, $s1
li $s1, 0
move $a1, $s1
jal initArray
move $s1, $v0
move $s1, $s1
sw $s1, 0($s0)
move $a0, $fp
jal L2908
move $s0, $v0
move $v0, $s0
j L2913
L2913:
move $sp, $fp
lw $ra, 0($sp)
lw $fp, 4($sp)
addi $sp, $sp, 20
jr $ra
