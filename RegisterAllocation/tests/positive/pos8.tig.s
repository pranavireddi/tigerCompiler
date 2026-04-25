
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
L301:
sw $a0, -44($fp)
li $s0, 0
move $s0, $s0
li $s1, 10
move $s1, $s1
ble $s0, $s1, L298
j L293
L293:
li $s0, 0
move $v0, $s0
j L300
L298:
li $s2, 5
beq $s0, $s2, L294
j L295
L295:
addi $s0, $s0, 1
move $s0, $s0
li $s2, 0
move $s2, $s2
L296:
bge $s0, $s1, L293
j L299
L299:
addi $s0, $s0, 1
move $s0, $s0
j L298
L294:
j L293
L302:
li $s2, 0
move $s2, $s2
j L296
L300:
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
