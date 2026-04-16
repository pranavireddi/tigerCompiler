.data
L478: .asciiz "0"
L479: .asciiz "9"
L485: .asciiz " "
L486: .asciiz "
"
L535: .asciiz "-"

.text
.globl main
main:
sw $ra, -4($sp)
sw $fp, -8($sp)
move $fp, $sp
addi $sp, $sp, -16
L554:
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
la $s1, L478
move $a1, $s1
jal ord
move $s1, $v0
move $s1, $s1
bge $s0, $s1, L480
j L481
L481:
li $s0, 0
move $s0, $s0
L482:
move $v0, $s0
j L553
L480:
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
la $s2, L479
move $a1, $s2
jal ord
move $s2, $v0
move $s2, $s2
ble $s1, $s2, L483
j L484
L484:
li $s0, 0
move $s0, $s0
L483:
move $s0, $s0
j L482
L553:
move $sp, $fp
lw $ra, -4($sp)
lw $fp, -8($sp)
jr $ra
sw $ra, -4($sp)
sw $fp, -8($sp)
move $fp, $sp
addi $sp, $sp, -16
L491:
lw $s0, -4($fp)
lw $s0, -4($s0)
lw $s0, -8($s0)
move $a0, $s0
la $s0, L485
move $a1, $s0
jal stringEqual
move $s0, $v0
move $s0, $s0
li $s1, 0
bne $s0, $s1, L487
j L488
L488:
lw $s0, -4($fp)
lw $s0, -4($s0)
lw $s0, -8($s0)
move $a0, $s0
la $s0, L486
move $a1, $s0
jal stringEqual
move $s0, $v0
move $s0, $s0
L489:
li $s1, 0
bne $s0, $s1, L492
j L490
L490:
li $s0, 0
move $v0, $s0
j L555
L487:
li $s0, 1
move $s0, $s0
j L489
L492:
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
j L491
L555:
move $sp, $fp
lw $ra, -4($sp)
lw $fp, -8($sp)
jr $ra
sw $ra, -4($sp)
sw $fp, -8($sp)
move $fp, $sp
addi $sp, $sp, -16
L557:
li $s0, 0
move $s0, $s0
move $a0, $fp
jal L477
move $s1, $v0
move $s1, $s2
li $s2, 0
beq $s1, $s2, L494
j L493
L493:
addi $s1, $s1, 0
move $s1, $s1
move $a0, $fp
lw $s2, -4($fp)
lw $s2, -8($s2)
move $a1, $s2
jal L476
move $s2, $v0
move $s2, $s2
sw $s2, 0($s1)
L496:
move $a0, $fp
lw $s1, -4($fp)
lw $s1, -8($s1)
move $a1, $s1
jal L476
move $s1, $v0
move $s1, $s1
li $s2, 0
bne $s1, $s2, L497
j L495
L495:
move $v0, $s0
j L556
L494:
jal nilerror
move $s2, $v0
j L493
L497:
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
la $s1, L478
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
j L496
L556:
move $sp, $fp
lw $ra, -4($sp)
lw $fp, -8($sp)
jr $ra
sw $ra, -4($sp)
sw $fp, -8($sp)
move $fp, $sp
addi $sp, $sp, -16
L559:
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
jal L475
move $s1, $v0
move $s1, $s1
move $s0, $s0
li $s2, 0
beq $s0, $s2, L503
j L502
L502:
lw $s0, 0($s0)
li $s2, 0
bne $s0, $s2, L504
j L505
L505:
li $s0, 0
move $s0, $s0
L506:
move $v0, $s0
j L558
L503:
jal nilerror
move $s2, $v0
j L502
L504:
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
jal L498
move $s2, $v0
move $s2, $s2
sw $s2, 0($s1)
move $s0, $s0
j L506
L558:
move $sp, $fp
lw $ra, -4($sp)
lw $fp, -8($sp)
jr $ra
sw $ra, -4($sp)
sw $fp, -8($sp)
move $fp, $sp
addi $sp, $sp, -16
L561:
li $s0, 0
beq $s1, $s0, L529
j L530
L530:
li $s0, 0
beq $s1, $s0, L526
j L527
L527:
move $s0, $s1
li $s2, 0
beq $s0, $s2, L508
j L507
L507:
lw $s0, 0($s0)
move $s0, $s0
move $s2, $s1
li $s3, 0
beq $s2, $s3, L510
j L509
L509:
lw $s2, 0($s2)
blt $s0, $s2, L523
j L524
L524:
li $s0, 8
move $a0, $s0
jal allocRecord
move $s0, $v0
move $s0, $s0
addi $s2, $s0, 0
move $s2, $s2
move $s3, $s1
li $s4, 0
beq $s3, $s4, L518
j L517
L517:
lw $s3, 0($s3)
sw $s3, 0($s2)
addi $s2, $s0, 4
move $s2, $s2
lw $s3, -4($fp)
move $s3, $s3
move $s4, $s1
move $s1, $s1
li $s5, 0
beq $s1, $s5, L520
j L519
L519:
move $a0, $s3
move $a1, $s4
lw $s1, 4($s1)
move $a2, $s1
jal L499
move $s1, $v0
move $s1, $s1
sw $s1, 0($s2)
move $s0, $s0
L525:
move $s0, $s0
L528:
move $s0, $s0
L531:
move $v0, $s0
j L560
L529:
move $s0, $s1
j L531
L526:
move $s0, $s1
j L528
L508:
jal nilerror
move $s2, $v0
j L507
L510:
jal nilerror
move $s3, $v0
j L509
L523:
li $s0, 8
move $a0, $s0
jal allocRecord
move $s0, $v0
move $s0, $s0
addi $s2, $s0, 0
move $s2, $s2
move $s3, $s1
li $s4, 0
beq $s3, $s4, L512
j L511
L511:
lw $s3, 0($s3)
sw $s3, 0($s2)
addi $s2, $s0, 4
move $s2, $s2
lw $s3, -4($fp)
move $s3, $s3
move $s4, $s1
li $s5, 0
beq $s4, $s5, L514
j L513
L513:
move $a0, $s3
lw $s3, 4($s4)
move $a1, $s3
move $a2, $s1
jal L499
move $s1, $v0
move $s1, $s1
sw $s1, 0($s2)
move $s0, $s0
j L525
L512:
jal nilerror
move $s4, $v0
j L511
L514:
jal nilerror
move $s5, $v0
j L513
L518:
jal nilerror
move $s4, $v0
j L517
L520:
jal nilerror
move $s5, $v0
j L519
L560:
move $sp, $fp
lw $ra, -4($sp)
lw $fp, -8($sp)
jr $ra
sw $ra, -4($sp)
sw $fp, -8($sp)
move $fp, $sp
addi $sp, $sp, -16
L563:
li $s0, 0
bgt $s1, $s0, L533
j L534
L534:
li $s0, 0
move $v0, $s0
j L562
L533:
lw $s0, -4($fp)
move $a0, $s0
li $s0, 10
div $s1, $s0
mflo $s0
move $a1, $s0
jal L532
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
la $s1, L478
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
j L534
L562:
move $sp, $fp
lw $ra, -4($sp)
lw $fp, -8($sp)
jr $ra
sw $ra, -4($sp)
sw $fp, -8($sp)
move $fp, $sp
addi $sp, $sp, -16
L565:
li $s0, 0
blt $s1, $s0, L539
j L540
L540:
li $s0, 0
bgt $s1, $s0, L536
j L537
L537:
li $s0, 0
move $a0, $s0
la $s0, L478
move $a1, $s0
jal print
move $s0, $v0
move $s0, $s0
L538:
move $s0, $s0
L541:
move $v0, $s0
j L564
L539:
li $s0, 0
move $a0, $s0
la $s0, L535
move $a1, $s0
jal print
move $s0, $v0
move $a0, $fp
li $s0, 0
sub $s0, $s0, $s1 
move $a1, $s0
jal L532
move $s0, $v0
move $s0, $s0
j L541
L536:
move $a0, $fp
move $a1, $s1
jal L532
move $s0, $v0
move $s0, $s0
j L538
L564:
move $sp, $fp
lw $ra, -4($sp)
lw $fp, -8($sp)
jr $ra
sw $ra, -4($sp)
sw $fp, -8($sp)
move $fp, $sp
addi $sp, $sp, -16
L567:
li $s0, 0
beq $s1, $s0, L550
j L551
L551:
lw $s0, -4($fp)
move $s0, $s0
move $s1, $s1
li $s2, 0
beq $s1, $s2, L543
j L542
L542:
move $a0, $s0
lw $s0, 0($s1)
move $a1, $s0
jal L500
move $s0, $v0
li $s0, 0
move $a0, $s0
la $s0, L485
move $a1, $s0
jal print
move $s0, $v0
lw $s0, -4($fp)
move $s0, $s0
move $s1, $s1
li $s2, 0
beq $s1, $s2, L547
j L546
L546:
move $a0, $s0
lw $s0, 4($s1)
move $a1, $s0
jal L501
move $s0, $v0
move $s0, $s0
L552:
move $v0, $s0
j L566
L550:
li $s0, 0
move $a0, $s0
la $s0, L486
move $a1, $s0
jal print
move $s0, $v0
move $s0, $s0
j L552
L543:
jal nilerror
move $s2, $v0
j L542
L547:
jal nilerror
move $s2, $v0
j L546
L566:
move $sp, $fp
lw $ra, -4($sp)
lw $fp, -8($sp)
jr $ra
sw $ra, -4($sp)
sw $fp, -8($sp)
move $fp, $sp
addi $sp, $sp, -16
L569:
addi $s0, $fp, -8
move $s0, $s0
li $s1, 0
move $a0, $s1
jal getchar
move $s1, $v0
move $s1, $s1
sw $s1, 0($s0)
move $a0, $fp
jal L498
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
jal L498
move $s1, $v0
move $s1, $s1
move $s2, $fp
move $a0, $fp
move $a1, $s0
move $a2, $s1
jal L499
move $s0, $v0
move $s0, $s0
move $a0, $s2
move $a1, $s0
jal L501
move $s0, $v0
move $v0, $s0
j L568
L568:
move $sp, $fp
lw $ra, -4($sp)
lw $fp, -8($sp)
jr $ra
