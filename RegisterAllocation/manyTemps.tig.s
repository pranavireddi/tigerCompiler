
.data
L3384:
  .word 18
  .ascii "ok_regalloc_small
"
  .space 2
L3385:
  .word 19
  .ascii "bad_regalloc_small
"
  .space 1

.text
.globl L3383
L3383:
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
L3390:
sw $a0, 40($fp)
sw $a1, 44($fp)
move $s0, $a2
move $s1, $a3
lw $s2, 44($fp)
add $s2, $s2, $s0 
move $s2, $s2
add $s0, $s0, $s1 
move $s0, $s0
mul $s0, $s2, $s0 
move $s0, $s0
lw $s2, 44($fp)
add $s0, $s0, $s2 
move $s0, $s0
sub $s0, $s0, $s1 
move $s0, $s0
move $v0, $s0
j L3389
L3389:
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
L3392:
sw $a0, 40($fp)
move $a0, $fp
li $s0, 1
move $a1, $s0
li $s0, 2
move $a2, $s0
li $s0, 3
move $a3, $s0
jal L3383
move $s0, $v0
move $s0, $s0
li $s1, 13
beq $s0, $s1, L3386
j L3387
L3387:
la $s0, L3385
move $a0, $s0
jal tig_print
move $s0, $v0
move $s0, $s0
L3388:
move $v0, $s0
j L3391
L3386:
la $s0, L3384
move $a0, $s0
jal tig_print
move $s0, $v0
move $s0, $s0
j L3388
L3391:
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
