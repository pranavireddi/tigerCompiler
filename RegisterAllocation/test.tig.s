
.data
L3283:
  .word 39
  .ascii "yipppee nested func and mut rec works!
"
  .space 1
L3284:
  .word 12
  .ascii "it's cooked
"

.text
.globl L3270
L3270:
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
L3289:
sw $a0, 40($fp)
sw $a1, 44($fp)
move $s0, $a2
lw $s0, 40($fp)
lw $s0, 44($s0)
lw $s1, 44($fp)
add $s0, $s0, $s1 
move $v0, $s0
j L3288
L3288:
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
.globl L3271
L3271:
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
L3291:
sw $a0, 40($fp)
sw $a1, 44($fp)
move $s0, $a2
lw $s0, 44($fp)
li $s1, 0
beq $s0, $s1, L3274
j L3275
L3275:
lw $s0, 40($fp)
move $a0, $s0
lw $s0, 44($fp)
addi $s0, $s0, -1
move $a1, $s0
jal L3271
move $s0, $v0
move $s0, $s0
L3276:
move $v0, $s0
j L3290
L3274:
lw $s0, 40($fp)
lw $s0, 44($s0)
move $s0, $s0
j L3276
L3290:
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
.globl L3272
L3272:
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
L3293:
sw $a0, 40($fp)
sw $a1, 44($fp)
move $s0, $a2
lw $s0, 44($fp)
li $s1, 0
beq $s0, $s1, L3277
j L3278
L3278:
lw $s0, 40($fp)
move $a0, $s0
lw $s0, 44($fp)
addi $s0, $s0, -1
move $a1, $s0
jal L3273
move $s0, $v0
move $s0, $s0
L3279:
move $v0, $s0
j L3292
L3277:
lw $s0, 40($fp)
lw $s0, 44($s0)
move $s0, $s0
j L3279
L3292:
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
.globl L3273
L3273:
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
L3295:
sw $a0, 40($fp)
sw $a1, 44($fp)
move $s0, $a2
lw $s0, 44($fp)
li $s1, 0
beq $s0, $s1, L3280
j L3281
L3281:
lw $s0, 40($fp)
move $a0, $s0
lw $s0, 44($fp)
addi $s0, $s0, -1
move $a1, $s0
jal L3272
move $s0, $v0
move $s0, $s0
L3282:
move $v0, $s0
j L3294
L3280:
li $s0, 0
move $s0, $s0
j L3282
L3294:
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
.globl L3269
L3269:
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
L3297:
sw $a0, 40($fp)
sw $a1, 44($fp)
sw $a2, 48($fp)
move $a0, $fp
li $s0, 5
move $a1, $s0
jal L3270
move $s0, $v0
move $s0, $s0
move $s0, $s0
move $a0, $fp
li $s1, 3
move $a1, $s1
jal L3271
move $s1, $v0
move $s1, $s1
add $s0, $s0, $s1 
move $s0, $s0
move $a0, $fp
li $s1, 4
move $a1, $s1
jal L3272
move $s1, $v0
move $s1, $s1
add $s0, $s0, $s1 
move $v0, $s0
j L3296
L3296:
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
L3299:
sw $a0, 40($fp)
move $a0, $fp
li $s0, 10
move $a1, $s0
jal L3269
move $s0, $v0
move $s0, $s0
li $s1, 35
beq $s0, $s1, L3285
j L3286
L3286:
la $s0, L3284
move $a0, $s0
jal tig_print
move $s0, $v0
move $s0, $s0
L3287:
move $v0, $s0
j L3298
L3285:
la $s0, L3283
move $a0, $s0
jal tig_print
move $s0, $v0
move $s0, $s0
j L3287
L3298:
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
