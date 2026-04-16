.data

.text
.globl main
main:
addi $sp, $sp, -12
sw $ra, 0($sp)
sw $fp, 4($sp)
move $fp, $sp
L2507:
sw $a0, -4($fp)
li $s0, 5
move $a0, $s0
li $s0, 0
move $a1, $s0
jal initArray
move $s0, $v0
move $s0, $s0
li $s0, 5
move $a0, $s0
li $s0, 0
move $a1, $s0
jal initArray
move $s0, $v0
move $s0, $s0
li $s0, 0
move $v0, $s0
j L2506
L2506:
move $sp, $fp
lw $ra, 0($sp)
lw $fp, 4($sp)
addi $sp, $sp, 12
jr $ra
