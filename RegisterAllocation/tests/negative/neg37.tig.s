.data
L2635: .asciiz "hello"
L2637: .asciiz "shadowing is legal"
L2652: .asciiz "Senior"
L2653: .asciiz "Junior"

.text
.globl main
main:
addi $sp, $sp, -16
sw $ra, 0($sp)
sw $fp, 4($sp)
move $fp, $sp
L2661:
sw $a0, -4($fp)
sw $a1, -8($fp)
move $s0, $a2
li $s1, 0
beq $s0, $s1, L2629
j L2630
L2630:
lw $s1, -4($fp)
move $a0, $s1
addi $s0, $s0, -1
move $a1, $s0
jal L2628
move $s0, $v0
move $s0, $s0
L2631:
move $v0, $s0
j L2660
L2629:
li $s0, 1
move $s0, $s0
j L2631
L2660:
move $sp, $fp
lw $ra, 0($sp)
lw $fp, 4($sp)
addi $sp, $sp, 16
jr $ra
addi $sp, $sp, -16
sw $ra, 0($sp)
sw $fp, 4($sp)
move $fp, $sp
L2663:
sw $a0, -4($fp)
sw $a1, -8($fp)
move $s0, $a2
li $s1, 0
beq $s0, $s1, L2632
j L2633
L2633:
lw $s1, -4($fp)
move $a0, $s1
addi $s0, $s0, -1
move $a1, $s0
jal L2627
move $s0, $v0
move $s0, $s0
L2634:
move $v0, $s0
j L2662
L2632:
li $s0, 0
move $s0, $s0
j L2634
L2662:
move $sp, $fp
lw $ra, 0($sp)
lw $fp, 4($sp)
addi $sp, $sp, 16
jr $ra
addi $sp, $sp, -12
sw $ra, 0($sp)
sw $fp, 4($sp)
move $fp, $sp
L2665:
sw $a0, -4($fp)
li $s0, 8
move $a0, $s0
jal allocRecord
move $s0, $v0
move $s0, $s0
la $s1, L2635
sw $s1, 0($s0)
li $s1, 1
sw $s1, 4($s0)
move $s0, $s0
li $s1, 10
move $a0, $s1
li $s1, 0
move $a1, $s1
jal initArray
move $s1, $v0
move $s1, $s1
li $s2, 5
move $s2, $s2
li $s3, 0
move $s3, $s3
li $s4, 10
move $s4, $s4
ble $s3, $s4, L2639
j L2636
L2636:
L2644:
li $s3, 0
bgt $s2, $s3, L2645
j L2641
L2641:
move $s0, $s0
li $s3, 0
beq $s0, $s3, L2647
j L2646
L2646:
addi $s3, $s0, 4
move $s3, $s3
move $s1, $s1
li $s4, 0
beq $s1, $s4, L2649
j L2648
L2648:
li $s4, 0
li $s5, 4
mul $s4, $s4, $s5 
add $s1, $s1, $s4 
lw $s1, 0($s1)
add $s1, $s1, $s2 
sw $s1, 0($s3)
move $s0, $s0
li $s1, 0
beq $s0, $s1, L2651
j L2650
L2650:
lw $s0, 4($s0)
li $s1, 20
bgt $s0, $s1, L2654
j L2655
L2655:
li $s0, 0
move $a0, $s0
la $s0, L2653
move $a1, $s0
jal print
move $s0, $v0
move $s0, $s0
L2656:
li $s0, 0
move $s0, $s0
li $s1, 0
beq $s0, $s1, L2657
j L2658
L2658:
li $s0, 0
move $s2, $s0
li $s0, 0
move $s0, $s0
L2659:
move $a0, $fp
move $a1, $s2
jal L2627
move $s0, $v0
move $v0, $s0
j L2664
L2639:
la $s5, L2637
move $s5, $s5
li $s6, 0
move $a0, $s6
move $a1, $s5
jal print
move $s5, $v0
bge $s3, $s4, L2636
j L2640
L2640:
addi $s3, $s3, 1
move $s3, $s3
j L2639
L2645:
li $s3, 2
beq $s2, $s3, L2642
j L2643
L2643:
addi $s2, $s2, -1
move $s2, $s2
j L2644
L2642:
j L2641
L2647:
jal nilerror
move $s3, $v0
j L2646
L2649:
jal nilerror
move $s4, $v0
j L2648
L2651:
jal nilerror
move $s1, $v0
j L2650
L2654:
li $s0, 0
move $a0, $s0
la $s0, L2652
move $a1, $s0
jal print
move $s0, $v0
move $s0, $s0
j L2656
L2657:
li $s0, 1
move $s2, $s0
li $s0, 0
move $s0, $s0
j L2659
L2664:
move $sp, $fp
lw $ra, 0($sp)
lw $fp, 4($sp)
addi $sp, $sp, 12
jr $ra
