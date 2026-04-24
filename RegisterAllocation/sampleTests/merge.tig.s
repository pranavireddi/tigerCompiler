.data
L483: .asciiz "0"
L484: .asciiz "9"
L490: .asciiz " "
L491: .asciiz "
"
L540: .asciiz "-"

.text
.globl tig_main
L481:
sw $ra, -4($sp)
sw $fp, -8($sp)
move $fp, $sp
addi $sp, $sp, -16
L559:
sw $a0, -4($fp)
sw $a1, -8($fp)
move $s0, $a2
li $s0, 0
move $a0, $s0
lw $s0, -4($fp)
lw $s0, -4($s0)
lw $s0, -8($s0)
move $a1, $s0
	jal tig_ord
move $s0, $v0
move $s0, $s0
move $s0, $s0
li $s1, 0
move $a0, $s1
la $s1, L483
move $a1, $s1
	jal tig_ord
move $s1, $v0
move $s1, $s1
bge $s0, $s1, L485
j L486
L486:
li $s0, 0
move $s0, $s0
L487:
move $v0, $s0
j L558
L485:
li $s0, 1
move $s0, $s0
li $s1, 0
move $a0, $s1
lw $s1, -4($fp)
lw $s1, -4($s1)
lw $s1, -8($s1)
move $a1, $s1
	jal tig_ord
move $s1, $v0
move $s1, $s1
move $s1, $s1
li $s2, 0
move $a0, $s2
la $s2, L484
move $a1, $s2
	jal tig_ord
move $s2, $v0
move $s2, $s2
ble $s1, $s2, L488
j L489
L489:
li $s0, 0
move $s0, $s0
L488:
move $s0, $s0
j L487
L558:
move $sp, $fp
lw $ra, -4($sp)
lw $fp, -8($sp)
jr $ra
L482:
sw $ra, -4($sp)
sw $fp, -8($sp)
move $fp, $sp
addi $sp, $sp, -16
L561:
sw $a0, -4($fp)
sw $a1, -8($fp)
L496:
lw $s0, -4($fp)
lw $s0, -4($s0)
lw $s0, -8($s0)
move $a0, $s0
la $s0, L490
move $a1, $s0
	jal tig_stringEqual
move $s0, $v0
move $s0, $s0
li $s1, 0
bne $s0, $s1, L492
j L493
L493:
lw $s0, -4($fp)
lw $s0, -4($s0)
lw $s0, -8($s0)
move $a0, $s0
la $s0, L491
move $a1, $s0
	jal tig_stringEqual
move $s0, $v0
move $s0, $s0
L494:
li $s1, 0
bne $s0, $s1, L497
j L495
L495:
li $s0, 0
move $v0, $s0
j L560
L492:
li $s0, 1
move $s0, $s0
j L494
L497:
lw $s0, -4($fp)
lw $s0, -4($s0)
addi $s0, $s0, -8
move $s0, $s0
li $s1, 0
move $a0, $s1
	jal tig_getchar
move $s1, $v0
move $s1, $s1
sw $s1, 0($s0)
j L496
L560:
move $sp, $fp
lw $ra, -4($sp)
lw $fp, -8($sp)
jr $ra
L480:
sw $ra, -4($sp)
sw $fp, -8($sp)
move $fp, $sp
addi $sp, $sp, -16
L563:
sw $a0, -4($fp)
sw $a1, -8($fp)
move $s0, $a2
li $s1, 0
move $s1, $s1
move $a0, $fp
jal L482
move $s2, $v0
move $s0, $s0
li $s2, 0
beq $s0, $s2, L499
j L498
L498:
addi $s0, $s0, 0
move $s0, $s0
move $a0, $fp
lw $s2, -4($fp)
lw $s2, -8($s2)
move $a1, $s2
jal L481
move $s2, $v0
move $s2, $s2
sw $s2, 0($s0)
L501:
move $a0, $fp
lw $s0, -4($fp)
lw $s0, -8($s0)
move $a1, $s0
jal L481
move $s0, $v0
move $s0, $s0
li $s2, 0
bne $s0, $s2, L502
j L500
L500:
move $v0, $s1
j L562
L499:
jal nilerror
move $s2, $v0
j L498
L502:
li $s0, 10
mul $s0, $s1, $s0 
move $s0, $s0
li $s1, 0
move $a0, $s1
lw $s1, -4($fp)
lw $s1, -8($s1)
move $a1, $s1
	jal tig_ord
move $s1, $v0
move $s1, $s1
add $s0, $s0, $s1 
move $s0, $s0
li $s1, 0
move $a0, $s1
la $s1, L483
move $a1, $s1
	jal tig_ord
move $s1, $v0
move $s1, $s1
sub $s0, $s0, $s1 
move $s1, $s0
lw $s0, -4($fp)
addi $s0, $s0, -8
move $s0, $s0
li $s2, 0
move $a0, $s2
	jal tig_getchar
move $s2, $v0
move $s2, $s2
sw $s2, 0($s0)
j L501
L562:
move $sp, $fp
lw $ra, -4($sp)
lw $fp, -8($sp)
jr $ra
L503:
sw $ra, -4($sp)
sw $fp, -8($sp)
move $fp, $sp
addi $sp, $sp, -16
L565:
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
jal L480
move $s1, $v0
move $s1, $s1
move $s0, $s0
li $s2, 0
beq $s0, $s2, L508
j L507
L507:
lw $s0, 0($s0)
li $s2, 0
bne $s0, $s2, L509
j L510
L510:
li $s0, 0
move $s0, $s0
L511:
move $v0, $s0
j L564
L508:
jal nilerror
move $s2, $v0
j L507
L509:
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
jal L503
move $s2, $v0
move $s2, $s2
sw $s2, 0($s1)
move $s0, $s0
j L511
L564:
move $sp, $fp
lw $ra, -4($sp)
lw $fp, -8($sp)
jr $ra
L504:
sw $ra, -4($sp)
sw $fp, -8($sp)
move $fp, $sp
addi $sp, $sp, -16
L567:
sw $a0, -4($fp)
sw $a1, -8($fp)
move $s0, $a2
move $s1, $a3
li $s2, 0
beq $s0, $s2, L534
j L535
L535:
li $s2, 0
beq $s1, $s2, L531
j L532
L532:
move $s0, $s0
li $s2, 0
beq $s0, $s2, L513
j L512
L512:
lw $s2, 0($s0)
move $s2, $s2
move $s1, $s1
li $s3, 0
beq $s1, $s3, L515
j L514
L514:
lw $s3, 0($s1)
blt $s2, $s3, L528
j L529
L529:
li $s2, 8
move $a0, $s2
	jal tig_allocRecord
move $s2, $v0
move $s2, $s2
addi $s3, $s2, 0
move $s3, $s3
move $s1, $s1
li $s4, 0
beq $s1, $s4, L523
j L522
L522:
lw $s4, 0($s1)
sw $s4, 0($s3)
addi $s3, $s2, 4
move $s3, $s3
lw $s4, -4($fp)
move $s4, $s4
move $s0, $s0
move $s1, $s1
li $s5, 0
beq $s1, $s5, L525
j L524
L524:
move $a0, $s4
move $a1, $s0
lw $s0, 4($s1)
move $a2, $s0
jal L504
move $s0, $v0
move $s0, $s0
sw $s0, 0($s3)
move $s0, $s2
L530:
move $s0, $s0
L533:
move $s0, $s0
L536:
move $v0, $s0
j L566
L534:
move $s0, $s1
j L536
L531:
move $s0, $s0
j L533
L513:
jal nilerror
move $s2, $v0
j L512
L515:
jal nilerror
move $s3, $v0
j L514
L528:
li $s2, 8
move $a0, $s2
	jal tig_allocRecord
move $s2, $v0
move $s2, $s2
addi $s3, $s2, 0
move $s3, $s3
move $s0, $s0
li $s4, 0
beq $s0, $s4, L517
j L516
L516:
lw $s4, 0($s0)
sw $s4, 0($s3)
addi $s3, $s2, 4
move $s3, $s3
lw $s4, -4($fp)
move $s4, $s4
move $s0, $s0
li $s5, 0
beq $s0, $s5, L519
j L518
L518:
move $a0, $s4
lw $s0, 4($s0)
move $a1, $s0
move $a2, $s1
jal L504
move $s0, $v0
move $s0, $s0
sw $s0, 0($s3)
move $s0, $s2
j L530
L517:
jal nilerror
move $s4, $v0
j L516
L519:
jal nilerror
move $s5, $v0
j L518
L523:
jal nilerror
move $s4, $v0
j L522
L525:
jal nilerror
move $s5, $v0
j L524
L566:
move $sp, $fp
lw $ra, -4($sp)
lw $fp, -8($sp)
jr $ra
L537:
sw $ra, -4($sp)
sw $fp, -8($sp)
move $fp, $sp
addi $sp, $sp, -16
L569:
sw $a0, -4($fp)
sw $a1, -8($fp)
move $s0, $a2
li $s1, 0
bgt $s0, $s1, L538
j L539
L539:
li $s0, 0
move $v0, $s0
j L568
L538:
lw $s1, -4($fp)
move $a0, $s1
li $s1, 10
div $s0, $s1
mflo $s1
move $a1, $s1
jal L537
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
la $s1, L483
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
j L539
L568:
move $sp, $fp
lw $ra, -4($sp)
lw $fp, -8($sp)
jr $ra
L505:
sw $ra, -4($sp)
sw $fp, -8($sp)
move $fp, $sp
addi $sp, $sp, -16
L571:
sw $a0, -4($fp)
sw $a1, -8($fp)
move $s0, $a2
li $s1, 0
blt $s0, $s1, L544
j L545
L545:
li $s1, 0
bgt $s0, $s1, L541
j L542
L542:
li $s0, 0
move $a0, $s0
la $s0, L483
move $a1, $s0
	jal tig_print
move $s0, $v0
move $s0, $s0
L543:
move $s0, $s0
L546:
move $v0, $s0
j L570
L544:
li $s1, 0
move $a0, $s1
la $s1, L540
move $a1, $s1
	jal tig_print
move $s1, $v0
move $a0, $fp
li $s1, 0
sub $s0, $s1, $s0 
move $a1, $s0
jal L537
move $s0, $v0
move $s0, $s0
j L546
L541:
move $a0, $fp
move $a1, $s0
jal L537
move $s0, $v0
move $s0, $s0
j L543
L570:
move $sp, $fp
lw $ra, -4($sp)
lw $fp, -8($sp)
jr $ra
L506:
sw $ra, -4($sp)
sw $fp, -8($sp)
move $fp, $sp
addi $sp, $sp, -16
L573:
sw $a0, -4($fp)
sw $a1, -8($fp)
move $s0, $a2
li $s1, 0
beq $s0, $s1, L555
j L556
L556:
lw $s1, -4($fp)
move $s1, $s1
move $s0, $s0
li $s2, 0
beq $s0, $s2, L548
j L547
L547:
move $a0, $s1
lw $s1, 0($s0)
move $a1, $s1
jal L505
move $s1, $v0
li $s1, 0
move $a0, $s1
la $s1, L490
move $a1, $s1
	jal tig_print
move $s1, $v0
lw $s1, -4($fp)
move $s1, $s1
move $s0, $s0
li $s2, 0
beq $s0, $s2, L552
j L551
L551:
move $a0, $s1
lw $s0, 4($s0)
move $a1, $s0
jal L506
move $s0, $v0
move $s0, $s0
L557:
move $v0, $s0
j L572
L555:
li $s0, 0
move $a0, $s0
la $s0, L491
move $a1, $s0
	jal tig_print
move $s0, $v0
move $s0, $s0
j L557
L548:
jal nilerror
move $s2, $v0
j L547
L552:
jal nilerror
move $s2, $v0
j L551
L572:
move $sp, $fp
lw $ra, -4($sp)
lw $fp, -8($sp)
jr $ra
tig_main:
sw $ra, -4($sp)
sw $fp, -8($sp)
move $fp, $sp
addi $sp, $sp, -16
L575:
sw $a0, -4($fp)
addi $s0, $fp, -8
move $s0, $s0
li $s1, 0
move $a0, $s1
	jal tig_getchar
move $s1, $v0
move $s1, $s1
sw $s1, 0($s0)
move $a0, $fp
jal L503
move $s0, $v0
move $s0, $s0
addi $s1, $fp, -8
move $s1, $s1
li $s2, 0
move $a0, $s2
	jal tig_getchar
move $s2, $v0
move $s2, $s2
sw $s2, 0($s1)
move $a0, $fp
jal L503
move $s1, $v0
move $s1, $s1
move $s2, $fp
move $a0, $fp
move $a1, $s0
move $a2, $s1
jal L504
move $s0, $v0
move $s0, $s0
move $a0, $s2
move $a1, $s0
jal L506
move $s0, $v0
move $v0, $s0
j L574
L574:
move $sp, $fp
lw $ra, -4($sp)
lw $fp, -8($sp)
jr $ra
