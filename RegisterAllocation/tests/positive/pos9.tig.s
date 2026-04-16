.data

.text
.globl main
main:
addi $sp, $sp, -12
sw $ra, 0($sp)
sw $fp, 4($sp)
move $fp, $sp
L2771:
sw $a0, -4($fp)
L2768:
L2769:
L2767:
li $s0, 0
move $v0, $s0
j L2770
L2772:
j L2768
L2770:
move $sp, $fp
lw $ra, 0($sp)
lw $fp, 4($sp)
addi $sp, $sp, 12
jr $ra
