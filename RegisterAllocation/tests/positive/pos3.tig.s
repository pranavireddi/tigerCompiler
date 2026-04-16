.data
L2726: .asciiz "a"
L2727: .asciiz "b"

.text
.globl main
main:
addi $sp, $sp, -12
sw $ra, 0($sp)
sw $fp, 4($sp)
move $fp, $sp
L2732:
sw $a0, -4($fp)
L2728:
la $s0, L2726
move $s0, $s0
L2730:
move $v0, $s0
j L2731
L2729:
la $s0, L2727
move $s0, $s0
j L2730
L2731:
move $sp, $fp
lw $ra, 0($sp)
lw $fp, 4($sp)
addi $sp, $sp, 12
jr $ra
