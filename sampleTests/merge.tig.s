
.data
L387: .asciiz "0"
L388: .asciiz "9"
L394: .asciiz " "
L395: .asciiz "
"
L444: .asciiz "-"

.text
.globl L385
L385:
addi $sp, $sp, -16
sw $ra, 0($sp)
sw $fp, 4($sp)
move $fp, $sp
L463:
sw $a0, -4($fp)
sw $a1, -8($fp)
move $s0, $a2
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
la $s1, L387
move $a1, $s1
jal ord
move $s1, $v0
move $s1, $s1
bge $s0, $s1, L389
j L390
L390:
li $s0, 0
move $s0, $s0
L391:
move $v0, $s0
j L462
L389:
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
la $s2, L388
move $a1, $s2
jal ord
move $s2, $v0
move $s2, $s2
ble $s1, $s2, L392
j L393
L393:
li $s0, 0
move $s0, $s0
L392:
move $s0, $s0
j L391
L462:
move $sp, $fp
lw $ra, 0($sp)
lw $fp, 4($sp)
addi $sp, $sp, 16
jr $ra
.globl L386
L386:
addi $sp, $sp, -16
sw $ra, 0($sp)
sw $fp, 4($sp)
move $fp, $sp
L465:
sw $a0, -4($fp)
sw $a1, -8($fp)
L400:
lw $s0, -4($fp)
lw $s0, -4($s0)
lw $s0, -8($s0)
move $a0, $s0
la $s0, L394
move $a1, $s0
jal tig_stringEqual
move $s0, $v0
move $s0, $s0
li $s1, 0
bne $s0, $s1, L396
j L397
L397:
lw $s0, -4($fp)
lw $s0, -4($s0)
lw $s0, -8($s0)
move $a0, $s0
la $s0, L395
move $a1, $s0
jal tig_stringEqual
move $s0, $v0
move $s0, $s0
L398:
li $s1, 0
bne $s0, $s1, L401
j L399
L399:
li $s0, 0
move $v0, $s0
j L464
L396:
li $s0, 1
move $s0, $s0
j L398
L401:
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
j L400
L464:
move $sp, $fp
lw $ra, 0($sp)
lw $fp, 4($sp)
addi $sp, $sp, 16
jr $ra
.globl L384
L384:
addi $sp, $sp, -16
sw $ra, 0($sp)
sw $fp, 4($sp)
move $fp, $sp
L467:
sw $a0, -4($fp)
sw $a1, -8($fp)
move $s0, $a2
li $s1, 0
move $s1, $s1
move $a0, $fp
jal L386
move $s2, $v0
move $s0, $s0
li $s2, 0
beq $s0, $s2, L403
j L402
L402:
addi $s0, $s0, 0
move $s0, $s0
move $a0, $fp
lw $s2, -4($fp)
lw $s2, -8($s2)
move $a1, $s2
jal L385
move $s2, $v0
move $s2, $s2
sw $s2, 0($s0)
L405:
move $a0, $fp
lw $s0, -4($fp)
lw $s0, -8($s0)
move $a1, $s0
jal L385
move $s0, $v0
move $s0, $s0
li $s2, 0
bne $s0, $s2, L406
j L404
L404:
move $v0, $s1
j L466
L403:
jal tig_nilerror
move $s2, $v0
j L402
L406:
li $s0, 10
mul $s0, $s1, $s0 
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
la $s1, L387
move $a1, $s1
jal ord
move $s1, $v0
move $s1, $s1
sub $s0, $s0, $s1 
move $s1, $s0
lw $s0, -4($fp)
addi $s0, $s0, -8
move $s0, $s0
li $s2, 0
move $a0, $s2
jal getchar
move $s2, $v0
move $s2, $s2
sw $s2, 0($s0)
j L405
L466:
move $sp, $fp
lw $ra, 0($sp)
lw $fp, 4($sp)
addi $sp, $sp, 16
jr $ra
.globl L407
L407:
addi $sp, $sp, -16
sw $ra, 0($sp)
sw $fp, 4($sp)
move $fp, $sp
L469:
sw $a0, -4($fp)
sw $a1, -8($fp)
li $s0, 4
move $a0, $s0
jal tig_allocRecord
move $s0, $v0
move $s0, $s0
li $s1, 0
sw $s1, 0($s0)
move $s0, $s0
lw $s1, -4($fp)
move $a0, $s1
move $a1, $s0
jal L384
move $s1, $v0
move $s1, $s1
move $s0, $s0
li $s2, 0
beq $s0, $s2, L412
j L411
L411:
lw $s0, 0($s0)
li $s2, 0
bne $s0, $s2, L413
j L414
L414:
li $s0, 0
move $s0, $s0
L415:
move $v0, $s0
j L468
L412:
jal tig_nilerror
move $s2, $v0
j L411
L413:
li $s0, 8
move $a0, $s0
jal tig_allocRecord
move $s0, $v0
move $s0, $s0
sw $s1, 0($s0)
addi $s1, $s0, 4
move $s1, $s1
lw $s2, -4($fp)
move $a0, $s2
jal L407
move $s2, $v0
move $s2, $s2
sw $s2, 0($s1)
move $s0, $s0
j L415
L468:
move $sp, $fp
lw $ra, 0($sp)
lw $fp, 4($sp)
addi $sp, $sp, 16
jr $ra
.globl L408
L408:
addi $sp, $sp, -16
sw $ra, 0($sp)
sw $fp, 4($sp)
move $fp, $sp
L471:
sw $a0, -4($fp)
sw $a1, -8($fp)
move $s0, $a2
move $s1, $a3
li $s2, 0
beq $s0, $s2, L438
j L439
L439:
li $s2, 0
beq $s1, $s2, L435
j L436
L436:
move $s0, $s0
li $s2, 0
beq $s0, $s2, L417
j L416
L416:
lw $s2, 0($s0)
move $s2, $s2
move $s1, $s1
li $s3, 0
beq $s1, $s3, L419
j L418
L418:
lw $s3, 0($s1)
blt $s2, $s3, L432
j L433
L433:
li $s2, 8
move $a0, $s2
jal tig_allocRecord
move $s2, $v0
move $s2, $s2
addi $s3, $s2, 0
move $s3, $s3
move $s1, $s1
li $s4, 0
beq $s1, $s4, L427
j L426
L426:
lw $s4, 0($s1)
sw $s4, 0($s3)
addi $s3, $s2, 4
move $s3, $s3
lw $s4, -4($fp)
move $s4, $s4
move $s0, $s0
move $s1, $s1
li $s5, 0
beq $s1, $s5, L429
j L428
L428:
move $a0, $s4
move $a1, $s0
lw $s0, 4($s1)
move $a2, $s0
jal L408
move $s0, $v0
move $s0, $s0
sw $s0, 0($s3)
move $s0, $s2
L434:
move $s0, $s0
L437:
move $s0, $s0
L440:
move $v0, $s0
j L470
L438:
move $s0, $s1
j L440
L435:
move $s0, $s0
j L437
L417:
jal tig_nilerror
move $s2, $v0
j L416
L419:
jal tig_nilerror
move $s3, $v0
j L418
L432:
li $s2, 8
move $a0, $s2
jal tig_allocRecord
move $s2, $v0
move $s2, $s2
addi $s3, $s2, 0
move $s3, $s3
move $s0, $s0
li $s4, 0
beq $s0, $s4, L421
j L420
L420:
lw $s4, 0($s0)
sw $s4, 0($s3)
addi $s3, $s2, 4
move $s3, $s3
lw $s4, -4($fp)
move $s4, $s4
move $s0, $s0
li $s5, 0
beq $s0, $s5, L423
j L422
L422:
move $a0, $s4
lw $s0, 4($s0)
move $a1, $s0
move $a2, $s1
jal L408
move $s0, $v0
move $s0, $s0
sw $s0, 0($s3)
move $s0, $s2
j L434
L421:
jal tig_nilerror
move $s4, $v0
j L420
L423:
jal tig_nilerror
move $s5, $v0
j L422
L427:
jal tig_nilerror
move $s4, $v0
j L426
L429:
jal tig_nilerror
move $s5, $v0
j L428
L470:
move $sp, $fp
lw $ra, 0($sp)
lw $fp, 4($sp)
addi $sp, $sp, 16
jr $ra
.globl L441
L441:
addi $sp, $sp, -16
sw $ra, 0($sp)
sw $fp, 4($sp)
move $fp, $sp
L473:
sw $a0, -4($fp)
sw $a1, -8($fp)
move $s0, $a2
li $s1, 0
bgt $s0, $s1, L442
j L443
L443:
li $s0, 0
move $v0, $s0
j L472
L442:
lw $s1, -4($fp)
move $a0, $s1
li $s1, 10
div $s0, $s1
mflo $s1
move $a1, $s1
jal L441
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
la $s1, L387
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
j L443
L472:
move $sp, $fp
lw $ra, 0($sp)
lw $fp, 4($sp)
addi $sp, $sp, 16
jr $ra
.globl L409
L409:
addi $sp, $sp, -16
sw $ra, 0($sp)
sw $fp, 4($sp)
move $fp, $sp
L475:
sw $a0, -4($fp)
sw $a1, -8($fp)
move $s0, $a2
li $s1, 0
blt $s0, $s1, L448
j L449
L449:
li $s1, 0
bgt $s0, $s1, L445
j L446
L446:
li $s0, 0
move $a0, $s0
la $s0, L387
move $a1, $s0
jal print
move $s0, $v0
move $s0, $s0
L447:
move $s0, $s0
L450:
move $v0, $s0
j L474
L448:
li $s1, 0
move $a0, $s1
la $s1, L444
move $a1, $s1
jal print
move $s1, $v0
move $a0, $fp
li $s1, 0
sub $s0, $s1, $s0 
move $a1, $s0
jal L441
move $s0, $v0
move $s0, $s0
j L450
L445:
move $a0, $fp
move $a1, $s0
jal L441
move $s0, $v0
move $s0, $s0
j L447
L474:
move $sp, $fp
lw $ra, 0($sp)
lw $fp, 4($sp)
addi $sp, $sp, 16
jr $ra
.globl L410
L410:
addi $sp, $sp, -16
sw $ra, 0($sp)
sw $fp, 4($sp)
move $fp, $sp
L477:
sw $a0, -4($fp)
sw $a1, -8($fp)
move $s0, $a2
li $s1, 0
beq $s0, $s1, L459
j L460
L460:
lw $s1, -4($fp)
move $s1, $s1
move $s0, $s0
li $s2, 0
beq $s0, $s2, L452
j L451
L451:
move $a0, $s1
lw $s1, 0($s0)
move $a1, $s1
jal L409
move $s1, $v0
li $s1, 0
move $a0, $s1
la $s1, L394
move $a1, $s1
jal print
move $s1, $v0
lw $s1, -4($fp)
move $s1, $s1
move $s0, $s0
li $s2, 0
beq $s0, $s2, L456
j L455
L455:
move $a0, $s1
lw $s0, 4($s0)
move $a1, $s0
jal L410
move $s0, $v0
move $s0, $s0
L461:
move $v0, $s0
j L476
L459:
li $s0, 0
move $a0, $s0
la $s0, L395
move $a1, $s0
jal print
move $s0, $v0
move $s0, $s0
j L461
L452:
jal tig_nilerror
move $s2, $v0
j L451
L456:
jal tig_nilerror
move $s2, $v0
j L455
L476:
move $sp, $fp
lw $ra, 0($sp)
lw $fp, 4($sp)
addi $sp, $sp, 16
jr $ra
.globl tig_main
tig_main:
addi $sp, $sp, -16
sw $ra, 0($sp)
sw $fp, 4($sp)
move $fp, $sp
L479:
sw $a0, -4($fp)
addi $s0, $fp, -8
move $s0, $s0
li $s1, 0
move $a0, $s1
jal getchar
move $s1, $v0
move $s1, $s1
sw $s1, 0($s0)
move $a0, $fp
jal L407
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
jal L407
move $s1, $v0
move $s1, $s1
move $s2, $fp
move $a0, $fp
move $a1, $s0
move $a2, $s1
jal L408
move $s0, $v0
move $s0, $s0
move $a0, $s2
move $a1, $s0
jal L410
move $s0, $v0
move $v0, $s0
j L478
L478:
move $sp, $fp
lw $ra, 0($sp)
lw $fp, 4($sp)
addi $sp, $sp, 16
jr $ra
