
.data
L944:
  .word 10
  .ascii "ok_static
"
  .space 2
L945:
  .word 11
  .ascii "bad_static
"
  .space 1

.text
.globl L943
L943:
addi $sp, $sp, -48
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
L950:
sw $a0, -4($fp)
sw $a1, -8($fp)
move $s0, $a2
lw $s0, -4($fp)
lw $s0, -8($s0)
lw $s1, -8($fp)
add $s0, $s0, $s1 
move $v0, $s0
j L949
L949:
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
addi $sp, $sp, 48
jr $ra
.globl L942
L942:
addi $sp, $sp, -52
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
L952:
sw $a0, -4($fp)
sw $a1, -8($fp)
sw $a2, -12($fp)
move $a0, $fp
li $s0, 5
move $a1, $s0
jal L943
move $s0, $v0
move $v0, $s0
j L951
L951:
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
addi $sp, $sp, 52
jr $ra
.globl tig_main
tig_main:
addi $sp, $sp, -44
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
L954:
sw $a0, -4($fp)
move $a0, $fp
li $s0, 10
move $a1, $s0
jal L942
move $s0, $v0
move $s0, $s0
li $s1, 15
beq $s0, $s1, L946
j L947
L947:
la $s0, L945
move $a0, $s0
jal tig_print
move $s0, $v0
move $s0, $s0
L948:
move $v0, $s0
j L953
L946:
la $s0, L944
move $a0, $s0
jal tig_print
move $s0, $v0
move $s0, $s0
j L948
L953:
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
addi $sp, $sp, 44
jr $ra
