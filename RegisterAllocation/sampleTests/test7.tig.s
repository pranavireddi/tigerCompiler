
.data
L32:
  .word 3
  .ascii "str"
  .space 1
L33:
  .word 1
  .ascii " "
  .space 3
L34:
  .word 4
  .ascii "str2"

.text
.globl L30
L30:
addi $sp, $sp, -92
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
L36:
sw $a0, -44($fp)
sw $a1, -48($fp)
move $s0, $a2
move $s0, $a3
lw $s0, -44($fp)
move $a0, $s0
lw $s0, -48($fp)
addi $s0, $s0, 1
move $a1, $s0
jal L31
move $s0, $v0
li $s0, 0
move $v0, $s0
j L35
L35:
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
addi $sp, $sp, 92
jr $ra
.globl L31
L31:
addi $sp, $sp, -92
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
L38:
sw $a0, -44($fp)
sw $a1, -48($fp)
move $s0, $a2
lw $s0, -44($fp)
move $a0, $s0
lw $s0, -48($fp)
move $a1, $s0
la $s0, L32
move $a2, $s0
jal L30
move $s0, $v0
la $s0, L33
move $v0, $s0
j L37
L37:
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
addi $sp, $sp, 92
jr $ra
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
L40:
sw $a0, -44($fp)
move $a0, $fp
li $s0, 0
move $a1, $s0
la $s0, L34
move $a2, $s0
jal L30
move $s0, $v0
move $v0, $s0
j L39
L39:
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
