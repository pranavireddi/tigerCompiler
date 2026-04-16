.data
L288: .asciiz "0"
L289: .asciiz "9"
L295: .asciiz " "
L296: .asciiz "
"
L345: .asciiz "-"

.text
.globl main
main:
L364:
li $s0, 0
move $a0, $s0
lw $s0, -4($fp)
lw $s0, -4($s0)
lw $s0, -8($s0)
move $a1, $s0
jal ord
move $s0, $v0
move $s0, $s0
move $s0, $s0
li $s1, 0
move $a0, $s1
la $s1, L288
move $a1, $s1
jal ord
move $s1, $v0
move $s1, $s1
bge $s0, $s1, L290
j L291
L291:
li $s0, 0
move $s0, $s0
L292:
move $v0, $s0
j L363
L290:
li $s0, 1
move $s0, $s0
li $s1, 0
move $a0, $s1
lw $s1, -4($fp)
lw $s1, -4($s1)
lw $s1, -8($s1)
move $a1, $s1
jal ord
move $s1, $v0
move $s1, $s1
move $s1, $s1
li $s2, 0
move $a0, $s2
la $s2, L289
move $a1, $s2
jal ord
move $s2, $v0
move $s2, $s2
ble $s1, $s2, L293
j L294
L294:
li $s0, 0
move $s0, $s0
L293:
move $s0, $s0
j L292
L363:
L301:
lw $s0, -4($fp)
lw $s0, -4($s0)
lw $s0, -8($s0)
move $a0, $s0
la $s0, L295
move $a1, $s0
jal stringEqual
move $s0, $v0
move $s0, $s0
li $s1, 0
bne $s0, $s1, L297
j L298
L298:
lw $s0, -4($fp)
lw $s0, -4($s0)
lw $s0, -8($s0)
move $a0, $s0
la $s0, L296
move $a1, $s0
jal stringEqual
move $s0, $v0
move $s0, $s0
L299:
li $s1, 0
bne $s0, $s1, L302
j L300
L300:
li $s0, 0
move $v0, $s0
j L365
L297:
li $s0, 1
move $s0, $s0
j L299
L302:
lw $s0, -4($fp)
lw $s0, -4($s0)
addi $s0, $s0, -8
move $s0, $s0
li $s1, 0
move $a0, $s1
jal getchar
move $s1, $v0
move $s1, $s1
sw $s1, 0($s0)
j L301
L365:
L367:
li $s0, 0
move $s0, $s0
move $a0, $fp
jal L287
move $s1, $v0
move $s1, $s2
li $s2, 0
beq $s1, $s2, L304
j L303
L303:
addi $s1, $s1, 0
move $s1, $s1
move $a0, $fp
lw $s2, -4($fp)
lw $s2, -8($s2)
move $a1, $s2
jal L286
move $s2, $v0
move $s2, $s2
sw $s2, 0($s1)
L306:
move $a0, $fp
lw $s1, -4($fp)
lw $s1, -8($s1)
move $a1, $s1
jal L286
move $s1, $v0
move $s1, $s1
li $s2, 0
bne $s1, $s2, L307
j L305
L305:
move $v0, $s0
j L366
L304:
jal nilerror
move $s2, $v0
j L303
L307:
li $s1, 10
mul $s0, $s0, $s1 
move $s0, $s0
li $s1, 0
move $a0, $s1
lw $s1, -4($fp)
lw $s1, -8($s1)
move $a1, $s1
jal ord
move $s1, $v0
move $s1, $s1
add $s0, $s0, $s1 
move $s0, $s0
li $s1, 0
move $a0, $s1
la $s1, L288
move $a1, $s1
jal ord
move $s1, $v0
move $s1, $s1
sub $s0, $s0, $s1 
move $s0, $s0
lw $s1, -4($fp)
addi $s1, $s1, -8
move $s1, $s1
li $s2, 0
move $a0, $s2
jal getchar
move $s2, $v0
move $s2, $s2
sw $s2, 0($s1)
j L306
L366:
L369:
li $s0, 4
move $a0, $s0
jal allocRecord
move $s0, $v0
move $s0, $s0
li $s1, 0
sw $s1, 0($s0)
move $s0, $s0
lw $s1, -4($fp)
move $a0, $s1
move $a1, $s0
jal L285
move $s1, $v0
move $s1, $s1
move $s0, $s0
li $s2, 0
beq $s0, $s2, L313
j L312
L312:
lw $s0, 0($s0)
li $s2, 0
bne $s0, $s2, L314
j L315
L315:
li $s0, 0
move $s0, $s0
L316:
move $v0, $s0
j L368
L313:
jal nilerror
move $s2, $v0
j L312
L314:
li $s0, 8
move $a0, $s0
jal allocRecord
move $s0, $v0
move $s0, $s0
sw $s1, 0($s0)
addi $s1, $s0, 4
move $s1, $s1
lw $s2, -4($fp)
move $a0, $s2
jal L308
move $s2, $v0
move $s2, $s2
sw $s2, 0($s1)
move $s0, $s0
j L316
L368:
L371:
li $s0, 0
beq $s1, $s0, L339
j L340
L340:
li $s0, 0
beq $s1, $s0, L336
j L337
L337:
move $s0, $s1
li $s2, 0
beq $s0, $s2, L318
j L317
L317:
lw $s0, 0($s0)
move $s0, $s0
move $s2, $s1
li $s3, 0
beq $s2, $s3, L320
j L319
L319:
lw $s2, 0($s2)
blt $s0, $s2, L333
j L334
L334:
li $s0, 8
move $a0, $s0
jal allocRecord
move $s0, $v0
move $s0, $s0
addi $s2, $s0, 0
move $s2, $s2
move $s3, $s1
li $s4, 0
beq $s3, $s4, L328
j L327
L327:
lw $s3, 0($s3)
sw $s3, 0($s2)
addi $s2, $s0, 4
move $s2, $s2
lw $s3, -4($fp)
move $s3, $s3
move $s4, $s1
move $s1, $s1
li $s5, 0
beq $s1, $s5, L330
j L329
L329:
move $a0, $s3
move $a1, $s4
lw $s1, 4($s1)
move $a2, $s1
jal L309
move $s1, $v0
move $s1, $s1
sw $s1, 0($s2)
move $s0, $s0
L335:
move $s0, $s0
L338:
move $s0, $s0
L341:
move $v0, $s0
j L370
L339:
move $s0, $s1
j L341
L336:
move $s0, $s1
j L338
L318:
jal nilerror
move $s2, $v0
j L317
L320:
jal nilerror
move $s3, $v0
j L319
L333:
li $s0, 8
move $a0, $s0
jal allocRecord
move $s0, $v0
move $s0, $s0
addi $s2, $s0, 0
move $s2, $s2
move $s3, $s1
li $s4, 0
beq $s3, $s4, L322
j L321
L321:
lw $s3, 0($s3)
sw $s3, 0($s2)
addi $s2, $s0, 4
move $s2, $s2
lw $s3, -4($fp)
move $s3, $s3
move $s4, $s1
li $s5, 0
beq $s4, $s5, L324
j L323
L323:
move $a0, $s3
lw $s3, 4($s4)
move $a1, $s3
move $a2, $s1
jal L309
move $s1, $v0
move $s1, $s1
sw $s1, 0($s2)
move $s0, $s0
j L335
L322:
jal nilerror
move $s4, $v0
j L321
L324:
jal nilerror
move $s5, $v0
j L323
L328:
jal nilerror
move $s4, $v0
j L327
L330:
jal nilerror
move $s5, $v0
j L329
L370:
L373:
li $s0, 0
bgt $s1, $s0, L343
j L344
L344:
li $s0, 0
move $v0, $s0
j L372
L343:
lw $s0, -4($fp)
move $a0, $s0
li $s0, 10
div $s1, $s0
mflo $s0
move $a1, $s0
jal L342
move $s0, $v0
li $s0, 10
div $s1, $s0
mflo $s0
li $s2, 10
mul $s0, $s0, $s2 
sub $s0, $s1, $s0 
move $s0, $s0
li $s1, 0
move $a0, $s1
la $s1, L288
move $a1, $s1
jal ord
move $s1, $v0
move $s1, $s1
li $s2, 0
move $a0, $s2
add $s0, $s0, $s1 
move $a1, $s0
jal chr
move $s0, $v0
move $s0, $s0
li $s1, 0
move $a0, $s1
move $a1, $s0
jal print
move $s0, $v0
j L344
L372:
L375:
li $s0, 0
blt $s1, $s0, L349
j L350
L350:
li $s0, 0
bgt $s1, $s0, L346
j L347
L347:
li $s0, 0
move $a0, $s0
la $s0, L288
move $a1, $s0
jal print
move $s0, $v0
move $s0, $s0
L348:
move $s0, $s0
L351:
move $v0, $s0
j L374
L349:
li $s0, 0
move $a0, $s0
la $s0, L345
move $a1, $s0
jal print
move $s0, $v0
move $a0, $fp
li $s0, 0
sub $s0, $s0, $s1 
move $a1, $s0
jal L342
move $s0, $v0
move $s0, $s0
j L351
L346:
move $a0, $fp
move $a1, $s1
jal L342
move $s0, $v0
move $s0, $s0
j L348
L374:
L377:
li $s0, 0
beq $s1, $s0, L360
j L361
L361:
lw $s0, -4($fp)
move $s0, $s0
move $s1, $s1
li $s2, 0
beq $s1, $s2, L353
j L352
L352:
move $a0, $s0
lw $s0, 0($s1)
move $a1, $s0
jal L310
move $s0, $v0
li $s0, 0
move $a0, $s0
la $s0, L295
move $a1, $s0
jal print
move $s0, $v0
lw $s0, -4($fp)
move $s0, $s0
move $s1, $s1
li $s2, 0
beq $s1, $s2, L357
j L356
L356:
move $a0, $s0
lw $s0, 4($s1)
move $a1, $s0
jal L311
move $s0, $v0
move $s0, $s0
L362:
move $v0, $s0
j L376
L360:
li $s0, 0
move $a0, $s0
la $s0, L296
move $a1, $s0
jal print
move $s0, $v0
move $s0, $s0
j L362
L353:
jal nilerror
move $s2, $v0
j L352
L357:
jal nilerror
move $s2, $v0
j L356
L376:
L379:
addi $s0, $fp, -8
move $s0, $s0
li $s1, 0
move $a0, $s1
jal getchar
move $s1, $v0
move $s1, $s1
sw $s1, 0($s0)
move $a0, $fp
jal L308
move $s0, $v0
move $s0, $s0
addi $s1, $fp, -8
move $s1, $s1
li $s2, 0
move $a0, $s2
jal getchar
move $s2, $v0
move $s2, $s2
sw $s2, 0($s1)
move $a0, $fp
jal L308
move $s1, $v0
move $s1, $s1
move $s2, $fp
move $a0, $fp
move $a1, $s0
move $a2, $s1
jal L309
move $s0, $v0
move $s0, $s0
move $a0, $s2
move $a1, $s0
jal L311
move $s0, $v0
move $v0, $s0
j L378
L378:
