
.data
L2866:
  .word 15
  .ascii "ok_static_link
"
  .space 1
L2867:
  .word 16
  .ascii "bad_static_link
"

.text
.globl L2865
L2865:
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
L2872:
sw $a0, 40($fp)
sw $a1, 44($fp)
move $s0, $a2
lw $s0, 40($fp)
lw $s0, 40($s0)
lw $s0, 44($s0)
lw $s1, 40($fp)
lw $s1, 40($s1)
lw $s1, 52($s1)
add $s0, $s0, $s1 
lw $s1, 40($fp)
lw $s1, 44($s1)
add $s0, $s0, $s1 
lw $s1, 40($fp)
lw $s1, 52($s1)
add $s0, $s0, $s1 
lw $s1, 44($fp)
add $s0, $s0, $s1 
move $v0, $s0
j L2871
L2871:
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
.globl L2864
L2864:
addi $sp, $sp, -56
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
L2874:
sw $a0, 40($fp)
sw $a1, 44($fp)
sw $a2, 48($fp)
li $s0, 40
sw $s0, 52($fp)
move $a0, $fp
li $s0, 5
move $a1, $s0
jal L2865
move $s0, $v0
move $v0, $s0
j L2873
L2873:
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
addi $sp, $sp, 56
jr $ra
.globl L2863
L2863:
addi $sp, $sp, -56
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
L2876:
sw $a0, 40($fp)
sw $a1, 44($fp)
sw $a2, 48($fp)
li $s0, 20
sw $s0, 52($fp)
move $a0, $fp
li $s0, 30
move $a1, $s0
jal L2864
move $s0, $v0
move $v0, $s0
j L2875
L2875:
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
addi $sp, $sp, 56
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
L2878:
sw $a0, 40($fp)
move $a0, $fp
li $s0, 10
move $a1, $s0
jal L2863
move $s0, $v0
move $s0, $s0
li $s1, 105
beq $s0, $s1, L2868
j L2869
L2869:
la $s0, L2867
move $a0, $s0
jal tig_print
move $s0, $v0
move $s0, $s0
L2870:
move $v0, $s0
j L2877
L2868:
la $s0, L2866
move $a0, $s0
jal tig_print
move $s0, $v0
move $s0, $s0
j L2870
L2877:
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
