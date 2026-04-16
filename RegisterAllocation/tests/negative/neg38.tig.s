.data
L2700: .asciiz "fail"

.text
.globl main
main:
addi $sp, $sp, -16
sw $ra, 0($sp)
sw $fp, 4($sp)
move $fp, $sp
L2708:
sw $a0, -4($fp)
sw $a1, -8($fp)
li $s0, 0
move $v0, $s0
j L2707
L2707:
move $sp, $fp
lw $ra, 0($sp)
lw $fp, 4($sp)
addi $sp, $sp, 16
jr $ra
addi $sp, $sp, -16
sw $ra, 0($sp)
sw $fp, 4($sp)
move $fp, $sp
L2710:
sw $a0, -4($fp)
sw $a1, -8($fp)
li $s0, 0
move $v0, $s0
j L2709
L2709:
move $sp, $fp
lw $ra, 0($sp)
lw $fp, 4($sp)
addi $sp, $sp, 16
jr $ra
addi $sp, $sp, -12
sw $ra, 0($sp)
sw $fp, 4($sp)
move $fp, $sp
L2712:
sw $a0, -4($fp)
li $s0, 0
move $s0, $s0
L2669:
L2670:
li $s1, 10
bgt $s0, $s1, L2667
j L2668
L2668:
addi $s0, $s0, 1
move $s0, $s0
j L2669
L2667:
L2666:
li $s1, 0
move $s1, $s1
li $s2, 10
move $s2, $s2
ble $s1, $s2, L2675
j L2671
L2671:
li $s1, 0
move $s1, $s1
li $s2, 10
move $s2, $s2
ble $s1, $s2, L2680
j L2677
L2677:
L2691:
L2692:
li $s1, 0
move $s1, $s1
li $s2, 10
move $s2, $s2
ble $s1, $s2, L2687
j L2683
L2683:
li $s1, 100
bgt $s0, $s1, L2689
j L2690
L2690:
j L2691
L2675:
li $s3, 5
beq $s1, $s3, L2672
j L2673
L2673:
bge $s1, $s2, L2671
j L2676
L2676:
addi $s1, $s1, 1
move $s1, $s1
j L2675
L2672:
j L2671
L2680:
move $a0, $fp
jal L2678
move $s3, $v0
bge $s1, $s2, L2677
j L2681
L2681:
addi $s1, $s1, 1
move $s1, $s1
j L2680
L2687:
li $s3, 5
beq $s1, $s3, L2684
j L2685
L2685:
addi $s0, $s0, 1
move $s0, $s0
bge $s1, $s2, L2683
j L2688
L2688:
addi $s1, $s1, 1
move $s1, $s1
j L2687
L2684:
j L2683
L2689:
L2682:
li $s1, 0
move $s1, $s1
li $s2, 10
move $s2, $s2
ble $s1, $s2, L2697
j L2693
L2693:
L2701:
L2702:
L2699:
L2705:
L2706:
move $a0, $fp
jal L2704
move $s0, $v0
j L2705
L2697:
li $s3, 0
move $s3, $s3
li $s4, 0
beq $s3, $s4, L2694
j L2695
L2695:
bge $s1, $s2, L2693
j L2698
L2698:
addi $s1, $s1, 1
move $s1, $s1
j L2697
L2694:
addi $s0, $s0, 1
move $s0, $s0
j L2693
L2713:
li $s0, 5
move $s0, $s0
li $s0, 0
move $a0, $s0
la $s0, L2700
move $a1, $s0
jal print
move $s0, $v0
j L2701
L2703:
li $s0, 0
move $v0, $s0
j L2711
L2711:
move $sp, $fp
lw $ra, 0($sp)
lw $fp, 4($sp)
addi $sp, $sp, 12
jr $ra
