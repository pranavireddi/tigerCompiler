
.data

.text
.globl tig_main
tig_main:
addi $sp, $sp, -88
sw $ra, 0($sp)
sw $fp, 4($sp)
sw $s0, 8($sp)
sw $s1, 12($sp)
sw $s2, 16($sp)
sw $s3, 20($sp)
sw $s4, 24($sp)
sw $s5, 28($sp)
sw $s6, 32($sp)
sw $s7, 36($sp)
move $fp, $sp
L292:
sw $a0, -44($fp)
li $s0, 0
move $s0, $s0
L289:
li $s1, 20
blt $s0, $s1, L290
j L286
L286:
move $v0, $s0
j L291
L290:
addi $s0, $s0, 1
move $s0, $s0
li $s1, 5
beq $s0, $s1, L287
j L288
L288:
j L289
L287:
j L286
L291:
move $sp, $fp
lw $s0, 8($sp)
lw $s1, 12($sp)
lw $s2, 16($sp)
lw $s3, 20($sp)
lw $s4, 24($sp)
lw $s5, 28($sp)
lw $s6, 32($sp)
lw $s7, 36($sp)
lw $ra, 0($sp)
lw $fp, 4($sp)
addi $sp, $sp, 88
jr $ra
