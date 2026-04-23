
.data
L291:
  .word 1
  .ascii "0"
  .space 3
L292:
  .word 1
  .ascii "9"
  .space 3
L298:
  .word 1
  .ascii " "
  .space 3
L299:
  .word 1
  .ascii "
"
  .space 3
L348:
  .word 1
  .ascii "-"
  .space 3

.text
.globl L289
L289:
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
L367:
sw $a0, -44($fp)
sw $a1, -48($fp)
move $s0, $a2
li $s0, 0
move $a0, $s0
lw $s0, -44($fp)
lw $s0, -44($s0)
lw $s0, -52($s0)
move $a1, $s0
jal tig_ord
move $s0, $v0
move $s0, $s0
move $s0, $s0
li $s1, 0
move $a0, $s1
la $s1, L291
move $a1, $s1
jal tig_ord
move $s1, $v0
move $s1, $s1
bge $s0, $s1, L293
j L294
L294:
li $s0, 0
move $s0, $s0
L295:
move $v0, $s0
j L366
L293:
li $s0, 1
move $s0, $s0
li $s1, 0
move $a0, $s1
lw $s1, -44($fp)
lw $s1, -44($s1)
lw $s1, -52($s1)
move $a1, $s1
jal tig_ord
move $s1, $v0
move $s1, $s1
move $s1, $s1
li $s2, 0
move $a0, $s2
la $s2, L292
move $a1, $s2
jal tig_ord
move $s2, $v0
move $s2, $s2
ble $s1, $s2, L296
j L297
L297:
li $s0, 0
move $s0, $s0
L296:
move $s0, $s0
j L295
L366:
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
.globl L290
L290:
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
L369:
sw $a0, -44($fp)
sw $a1, -48($fp)
L304:
lw $s0, -44($fp)
lw $s0, -44($s0)
lw $s0, -52($s0)
move $a0, $s0
la $s0, L298
move $a1, $s0
jal tig_stringEqual
move $s0, $v0
move $s0, $s0
li $s1, 0
bne $s0, $s1, L300
j L301
L301:
lw $s0, -44($fp)
lw $s0, -44($s0)
lw $s0, -52($s0)
move $a0, $s0
la $s0, L299
move $a1, $s0
jal tig_stringEqual
move $s0, $v0
move $s0, $s0
L302:
li $s1, 0
bne $s0, $s1, L305
j L303
L303:
li $s0, 0
move $v0, $s0
j L368
L300:
li $s0, 1
move $s0, $s0
j L302
L305:
lw $s0, -44($fp)
lw $s0, -44($s0)
addi $s0, $s0, -52
move $s0, $s0
li $s1, 0
move $a0, $s1
jal tig_getchar
move $s1, $v0
move $s1, $s1
sw $s1, 0($s0)
j L304
L368:
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
.globl L288
L288:
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
L371:
sw $a0, -44($fp)
sw $a1, -48($fp)
move $s0, $a2
li $s1, 0
move $s1, $s1
move $a0, $fp
jal L290
move $s2, $v0
move $s0, $s0
li $s2, 0
beq $s0, $s2, L307
j L306
L306:
addi $s0, $s0, 0
move $s0, $s0
move $a0, $fp
lw $s2, -44($fp)
lw $s2, -52($s2)
move $a1, $s2
jal L289
move $s2, $v0
move $s2, $s2
sw $s2, 0($s0)
L309:
move $a0, $fp
lw $s0, -44($fp)
lw $s0, -52($s0)
move $a1, $s0
jal L289
move $s0, $v0
move $s0, $s0
li $s2, 0
bne $s0, $s2, L310
j L308
L308:
move $v0, $s1
j L370
L307:
jal tig_nilerror
move $s2, $v0
j L306
L310:
li $s0, 10
mul $s0, $s1, $s0 
move $s0, $s0
li $s1, 0
move $a0, $s1
lw $s1, -44($fp)
lw $s1, -52($s1)
move $a1, $s1
jal tig_ord
move $s1, $v0
move $s1, $s1
add $s0, $s0, $s1 
move $s0, $s0
li $s1, 0
move $a0, $s1
la $s1, L291
move $a1, $s1
jal tig_ord
move $s1, $v0
move $s1, $s1
sub $s0, $s0, $s1 
move $s1, $s0
lw $s0, -44($fp)
addi $s0, $s0, -52
move $s0, $s0
li $s2, 0
move $a0, $s2
jal tig_getchar
move $s2, $v0
move $s2, $s2
sw $s2, 0($s0)
j L309
L370:
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
.globl L311
L311:
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
L373:
sw $a0, -44($fp)
sw $a1, -48($fp)
li $s0, 4
move $a0, $s0
jal tig_allocRecord
move $s0, $v0
move $s0, $s0
li $s1, 0
sw $s1, 0($s0)
move $s0, $s0
lw $s1, -44($fp)
move $a0, $s1
move $a1, $s0
jal L288
move $s1, $v0
move $s1, $s1
move $s0, $s0
li $s2, 0
beq $s0, $s2, L316
j L315
L315:
lw $s0, 0($s0)
li $s2, 0
bne $s0, $s2, L317
j L318
L318:
li $s0, 0
move $s0, $s0
L319:
move $v0, $s0
j L372
L316:
jal tig_nilerror
move $s2, $v0
j L315
L317:
li $s0, 8
move $a0, $s0
jal tig_allocRecord
move $s0, $v0
move $s0, $s0
sw $s1, 0($s0)
addi $s1, $s0, 4
move $s1, $s1
lw $s2, -44($fp)
move $a0, $s2
jal L311
move $s2, $v0
move $s2, $s2
sw $s2, 0($s1)
move $s0, $s0
j L319
L372:
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
.globl L312
L312:
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
L375:
sw $a0, -44($fp)
sw $a1, -48($fp)
move $s0, $a2
move $s1, $a3
li $s2, 0
beq $s0, $s2, L342
j L343
L343:
li $s2, 0
beq $s1, $s2, L339
j L340
L340:
move $s0, $s0
li $s2, 0
beq $s0, $s2, L321
j L320
L320:
lw $s2, 0($s0)
move $s2, $s2
move $s1, $s1
li $s3, 0
beq $s1, $s3, L323
j L322
L322:
lw $s3, 0($s1)
blt $s2, $s3, L336
j L337
L337:
li $s2, 8
move $a0, $s2
jal tig_allocRecord
move $s2, $v0
move $s2, $s2
addi $s3, $s2, 0
move $s3, $s3
move $s1, $s1
li $s4, 0
beq $s1, $s4, L331
j L330
L330:
lw $s4, 0($s1)
sw $s4, 0($s3)
addi $s3, $s2, 4
move $s3, $s3
lw $s4, -44($fp)
move $s4, $s4
move $s0, $s0
move $s1, $s1
li $s5, 0
beq $s1, $s5, L333
j L332
L332:
move $a0, $s4
move $a1, $s0
lw $s0, 4($s1)
move $a2, $s0
jal L312
move $s0, $v0
move $s0, $s0
sw $s0, 0($s3)
move $s0, $s2
L338:
move $s0, $s0
L341:
move $s0, $s0
L344:
move $v0, $s0
j L374
L342:
move $s0, $s1
j L344
L339:
move $s0, $s0
j L341
L321:
jal tig_nilerror
move $s2, $v0
j L320
L323:
jal tig_nilerror
move $s3, $v0
j L322
L336:
li $s2, 8
move $a0, $s2
jal tig_allocRecord
move $s2, $v0
move $s2, $s2
addi $s3, $s2, 0
move $s3, $s3
move $s0, $s0
li $s4, 0
beq $s0, $s4, L325
j L324
L324:
lw $s4, 0($s0)
sw $s4, 0($s3)
addi $s3, $s2, 4
move $s3, $s3
lw $s4, -44($fp)
move $s4, $s4
move $s0, $s0
li $s5, 0
beq $s0, $s5, L327
j L326
L326:
move $a0, $s4
lw $s0, 4($s0)
move $a1, $s0
move $a2, $s1
jal L312
move $s0, $v0
move $s0, $s0
sw $s0, 0($s3)
move $s0, $s2
j L338
L325:
jal tig_nilerror
move $s4, $v0
j L324
L327:
jal tig_nilerror
move $s5, $v0
j L326
L331:
jal tig_nilerror
move $s4, $v0
j L330
L333:
jal tig_nilerror
move $s5, $v0
j L332
L374:
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
.globl L345
L345:
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
L377:
sw $a0, -44($fp)
sw $a1, -48($fp)
move $s0, $a2
li $s1, 0
bgt $s0, $s1, L346
j L347
L347:
li $s0, 0
move $v0, $s0
j L376
L346:
lw $s1, -44($fp)
move $a0, $s1
li $s1, 10
div $s0, $s1
mflo $s1
move $a1, $s1
jal L345
move $s1, $v0
li $s1, 10
div $s0, $s1
mflo $s1
li $s2, 10
mul $s1, $s1, $s2 
sub $s0, $s0, $s1 
move $s0, $s0
li $s1, 0
move $a0, $s1
la $s1, L291
move $a1, $s1
jal tig_ord
move $s1, $v0
move $s1, $s1
li $s2, 0
move $a0, $s2
add $s0, $s0, $s1 
move $a1, $s0
jal tig_chr
move $s0, $v0
move $s0, $s0
li $s1, 0
move $a0, $s1
move $a1, $s0
jal tig_print
move $s0, $v0
j L347
L376:
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
.globl L313
L313:
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
L379:
sw $a0, -44($fp)
sw $a1, -48($fp)
move $s0, $a2
li $s1, 0
blt $s0, $s1, L352
j L353
L353:
li $s1, 0
bgt $s0, $s1, L349
j L350
L350:
li $s0, 0
move $a0, $s0
la $s0, L291
move $a1, $s0
jal tig_print
move $s0, $v0
move $s0, $s0
L351:
move $s0, $s0
L354:
move $v0, $s0
j L378
L352:
li $s1, 0
move $a0, $s1
la $s1, L348
move $a1, $s1
jal tig_print
move $s1, $v0
move $a0, $fp
li $s1, 0
sub $s0, $s1, $s0 
move $a1, $s0
jal L345
move $s0, $v0
move $s0, $s0
j L354
L349:
move $a0, $fp
move $a1, $s0
jal L345
move $s0, $v0
move $s0, $s0
j L351
L378:
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
.globl L314
L314:
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
L381:
sw $a0, -44($fp)
sw $a1, -48($fp)
move $s0, $a2
li $s1, 0
beq $s0, $s1, L363
j L364
L364:
lw $s1, -44($fp)
move $s1, $s1
move $s0, $s0
li $s2, 0
beq $s0, $s2, L356
j L355
L355:
move $a0, $s1
lw $s1, 0($s0)
move $a1, $s1
jal L313
move $s1, $v0
li $s1, 0
move $a0, $s1
la $s1, L298
move $a1, $s1
jal tig_print
move $s1, $v0
lw $s1, -44($fp)
move $s1, $s1
move $s0, $s0
li $s2, 0
beq $s0, $s2, L360
j L359
L359:
move $a0, $s1
lw $s0, 4($s0)
move $a1, $s0
jal L314
move $s0, $v0
move $s0, $s0
L365:
move $v0, $s0
j L380
L363:
li $s0, 0
move $a0, $s0
la $s0, L299
move $a1, $s0
jal tig_print
move $s0, $v0
move $s0, $s0
j L365
L356:
jal tig_nilerror
move $s2, $v0
j L355
L360:
jal tig_nilerror
move $s2, $v0
j L359
L380:
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
L383:
sw $a0, -44($fp)
addi $s0, $fp, -52
move $s0, $s0
li $s1, 0
move $a0, $s1
jal tig_getchar
move $s1, $v0
move $s1, $s1
sw $s1, 0($s0)
move $a0, $fp
jal L311
move $s0, $v0
move $s0, $s0
addi $s1, $fp, -52
move $s1, $s1
li $s2, 0
move $a0, $s2
jal tig_getchar
move $s2, $v0
move $s2, $s2
sw $s2, 0($s1)
move $a0, $fp
jal L311
move $s1, $v0
move $s1, $s1
move $s2, $fp
move $a0, $fp
move $a1, $s0
move $a2, $s1
jal L312
move $s0, $v0
move $s0, $s0
move $a0, $s2
move $a1, $s0
jal L314
move $s0, $v0
move $v0, $s0
j L382
L382:
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
