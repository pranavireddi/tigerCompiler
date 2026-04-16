.data
L2610: .asciiz "hello"

.text
.globl main
main:
addi $sp, $sp, -16
sw $ra, 0($sp)
sw $fp, 4($sp)
move $fp, $sp
L2612:
sw $a0, -4($fp)
sw $a1, -8($fp)
move $s0, $a2
move $v0, $s0
j L2611
L2611:
move $sp, $fp
lw $ra, 0($sp)
lw $fp, 4($sp)
addi $sp, $sp, 16
jr $ra
addi $sp, $sp, -12
sw $ra, 0($sp)
sw $fp, 4($sp)
move $fp, $sp
L2614:
sw $a0, -4($fp)
move $a0, $fp
la $s0, L2610
move $a1, $s0
jal L2609
move $s0, $v0
move $v0, $s0
j L2613
L2613:
move $sp, $fp
lw $ra, 0($sp)
lw $fp, 4($sp)
addi $sp, $sp, 12
jr $ra
