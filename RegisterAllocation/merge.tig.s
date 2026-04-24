
.data
L2739:
  .word 1
  .ascii "0"
  .space 3
L2740:
  .word 1
  .ascii "9"
  .space 3
L2746:
  .word 1
  .ascii " "
  .space 3
L2747:
  .word 1
  .ascii "
"
  .space 3
L2796:
  .word 1
  .ascii "-"
  .space 3

.text
.globl L2737
L2737:
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
L2815:
sw $a0, 40($fp)
sw $a1, 44($fp)
move $s0, $a2
lw $s0, 40($fp)
lw $s0, 40($s0)
lw $s0, 44($s0)
move $a0, $s0
jal tig_ord
move $s0, $v0
move $s0, $s0
move $s0, $s0
la $s1, L2739
move $a0, $s1
jal tig_ord
move $s1, $v0
move $s1, $s1
bge $s0, $s1, L2741
j L2742
L2742:
li $s0, 0
move $s0, $s0
L2743:
move $v0, $s0
j L2814
L2741:
li $s0, 1
move $s0, $s0
lw $s1, 40($fp)
lw $s1, 40($s1)
lw $s1, 44($s1)
move $a0, $s1
jal tig_ord
move $s1, $v0
move $s1, $s1
move $s1, $s1
la $s2, L2740
move $a0, $s2
jal tig_ord
move $s2, $v0
move $s2, $s2
ble $s1, $s2, L2744
j L2745
L2745:
li $s0, 0
move $s0, $s0
L2744:
move $s0, $s0
j L2743
L2814:
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
.globl L2738
L2738:
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
L2817:
sw $a0, 40($fp)
sw $a1, 44($fp)
L2752:
lw $s0, 40($fp)
lw $s0, 40($s0)
lw $s0, 44($s0)
move $a0, $s0
la $s0, L2746
move $a1, $s0
jal tig_stringEqual
move $s0, $v0
move $s0, $s0
li $s1, 0
bne $s0, $s1, L2748
j L2749
L2749:
lw $s0, 40($fp)
lw $s0, 40($s0)
lw $s0, 44($s0)
move $a0, $s0
la $s0, L2747
move $a1, $s0
jal tig_stringEqual
move $s0, $v0
move $s0, $s0
L2750:
li $s1, 0
bne $s0, $s1, L2753
j L2751
L2751:
li $s0, 0
move $v0, $s0
j L2816
L2748:
li $s0, 1
move $s0, $s0
j L2750
L2753:
lw $s0, 40($fp)
lw $s0, 40($s0)
addi $s0, $s0, 44
move $s0, $s0
jal tig_getchar
move $s1, $v0
move $s1, $s1
sw $s1, 0($s0)
j L2752
L2816:
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
.globl L2736
L2736:
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
L2819:
sw $a0, 40($fp)
sw $a1, 44($fp)
move $s0, $a2
li $s0, 0
move $s0, $s0
move $a0, $fp
jal L2738
move $s1, $v0
lw $s1, 44($fp)
move $s1, $s1
li $s2, 0
beq $s1, $s2, L2755
j L2754
L2754:
addi $s1, $s1, 0
move $s1, $s1
move $a0, $fp
lw $s2, 40($fp)
lw $s2, 44($s2)
move $a1, $s2
jal L2737
move $s2, $v0
move $s2, $s2
sw $s2, 0($s1)
L2757:
move $a0, $fp
lw $s1, 40($fp)
lw $s1, 44($s1)
move $a1, $s1
jal L2737
move $s1, $v0
move $s1, $s1
li $s2, 0
bne $s1, $s2, L2758
j L2756
L2756:
move $v0, $s0
j L2818
L2755:
jal tig_nilerror
move $s2, $v0
j L2754
L2758:
li $s1, 10
mul $s0, $s0, $s1 
move $s0, $s0
lw $s1, 40($fp)
lw $s1, 44($s1)
move $a0, $s1
jal tig_ord
move $s1, $v0
move $s1, $s1
add $s0, $s0, $s1 
move $s0, $s0
la $s1, L2739
move $a0, $s1
jal tig_ord
move $s1, $v0
move $s1, $s1
sub $s0, $s0, $s1 
move $s0, $s0
lw $s1, 40($fp)
addi $s1, $s1, 44
move $s1, $s1
jal tig_getchar
move $s2, $v0
move $s2, $s2
sw $s2, 0($s1)
j L2757
L2818:
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
.globl L2759
L2759:
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
L2821:
sw $a0, 40($fp)
sw $a1, 44($fp)
li $s0, 4
move $a0, $s0
jal tig_allocRecord
move $s0, $v0
move $s0, $s0
li $s1, 0
sw $s1, 0($s0)
move $s0, $s0
lw $s1, 40($fp)
move $a0, $s1
move $a1, $s0
jal L2736
move $s1, $v0
move $s1, $s1
move $s0, $s0
li $s2, 0
beq $s0, $s2, L2764
j L2763
L2763:
lw $s0, 0($s0)
li $s2, 0
bne $s0, $s2, L2765
j L2766
L2766:
li $s0, 0
move $s0, $s0
L2767:
move $v0, $s0
j L2820
L2764:
jal tig_nilerror
move $s2, $v0
j L2763
L2765:
li $s0, 8
move $a0, $s0
jal tig_allocRecord
move $s0, $v0
move $s0, $s0
sw $s1, 0($s0)
addi $s1, $s0, 4
move $s1, $s1
lw $s2, 40($fp)
move $a0, $s2
jal L2759
move $s2, $v0
move $s2, $s2
sw $s2, 0($s1)
move $s0, $s0
j L2767
L2820:
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
.globl L2760
L2760:
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
L2823:
sw $a0, 40($fp)
sw $a1, 44($fp)
move $s0, $a2
move $s1, $a3
lw $s1, 44($fp)
li $s2, 0
beq $s1, $s2, L2790
j L2791
L2791:
li $s1, 0
beq $s0, $s1, L2787
j L2788
L2788:
lw $s1, 44($fp)
move $s1, $s1
li $s2, 0
beq $s1, $s2, L2769
j L2768
L2768:
lw $s1, 0($s1)
move $s1, $s1
move $s0, $s0
li $s2, 0
beq $s0, $s2, L2771
j L2770
L2770:
lw $s2, 0($s0)
blt $s1, $s2, L2784
j L2785
L2785:
li $s1, 8
move $a0, $s1
jal tig_allocRecord
move $s1, $v0
move $s1, $s1
addi $s2, $s1, 0
move $s2, $s2
move $s0, $s0
li $s3, 0
beq $s0, $s3, L2779
j L2778
L2778:
lw $s3, 0($s0)
sw $s3, 0($s2)
addi $s2, $s1, 4
move $s2, $s2
lw $s3, 40($fp)
move $s3, $s3
lw $s4, 44($fp)
move $s4, $s4
move $s0, $s0
li $s5, 0
beq $s0, $s5, L2781
j L2780
L2780:
move $a0, $s3
move $a1, $s4
lw $s0, 4($s0)
move $a2, $s0
jal L2760
move $s0, $v0
move $s0, $s0
sw $s0, 0($s2)
move $s0, $s1
L2786:
move $s0, $s0
L2789:
move $s0, $s0
L2792:
move $v0, $s0
j L2822
L2790:
move $s0, $s0
j L2792
L2787:
lw $s0, 44($fp)
move $s0, $s0
j L2789
L2769:
jal tig_nilerror
move $s2, $v0
j L2768
L2771:
jal tig_nilerror
move $s2, $v0
j L2770
L2784:
li $s1, 8
move $a0, $s1
jal tig_allocRecord
move $s1, $v0
move $s1, $s1
addi $s2, $s1, 0
move $s2, $s2
lw $s3, 44($fp)
move $s3, $s3
li $s4, 0
beq $s3, $s4, L2773
j L2772
L2772:
lw $s3, 0($s3)
sw $s3, 0($s2)
addi $s2, $s1, 4
move $s2, $s2
lw $s3, 40($fp)
move $s3, $s3
lw $s4, 44($fp)
move $s4, $s4
li $s5, 0
beq $s4, $s5, L2775
j L2774
L2774:
move $a0, $s3
lw $s3, 4($s4)
move $a1, $s3
move $a2, $s0
jal L2760
move $s0, $v0
move $s0, $s0
sw $s0, 0($s2)
move $s0, $s1
j L2786
L2773:
jal tig_nilerror
move $s4, $v0
j L2772
L2775:
jal tig_nilerror
move $s5, $v0
j L2774
L2779:
jal tig_nilerror
move $s3, $v0
j L2778
L2781:
jal tig_nilerror
move $s5, $v0
j L2780
L2822:
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
.globl L2793
L2793:
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
L2825:
sw $a0, 40($fp)
sw $a1, 44($fp)
move $s0, $a2
lw $s0, 44($fp)
li $s1, 0
bgt $s0, $s1, L2794
j L2795
L2795:
li $s0, 0
move $v0, $s0
j L2824
L2794:
lw $s0, 40($fp)
move $a0, $s0
lw $s0, 44($fp)
li $s1, 10
div $s0, $s1
mflo $s0
move $a1, $s0
jal L2793
move $s0, $v0
lw $s0, 44($fp)
lw $s1, 44($fp)
li $s2, 10
div $s1, $s2
mflo $s1
li $s2, 10
mul $s1, $s1, $s2 
sub $s0, $s0, $s1 
move $s0, $s0
la $s1, L2739
move $a0, $s1
jal tig_ord
move $s1, $v0
move $s1, $s1
add $s0, $s0, $s1 
move $a0, $s0
jal tig_chr
move $s0, $v0
move $s0, $s0
move $a0, $s0
jal tig_print
move $s0, $v0
j L2795
L2824:
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
.globl L2761
L2761:
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
L2827:
sw $a0, 40($fp)
sw $a1, 44($fp)
move $s0, $a2
lw $s0, 44($fp)
li $s1, 0
blt $s0, $s1, L2800
j L2801
L2801:
lw $s0, 44($fp)
li $s1, 0
bgt $s0, $s1, L2797
j L2798
L2798:
la $s0, L2739
move $a0, $s0
jal tig_print
move $s0, $v0
move $s0, $s0
L2799:
move $s0, $s0
L2802:
move $v0, $s0
j L2826
L2800:
la $s0, L2796
move $a0, $s0
jal tig_print
move $s0, $v0
move $a0, $fp
li $s0, 0
lw $s1, 44($fp)
sub $s0, $s0, $s1 
move $a1, $s0
jal L2793
move $s0, $v0
move $s0, $s0
j L2802
L2797:
move $a0, $fp
lw $s0, 44($fp)
move $a1, $s0
jal L2793
move $s0, $v0
move $s0, $s0
j L2799
L2826:
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
.globl L2762
L2762:
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
L2829:
sw $a0, 40($fp)
sw $a1, 44($fp)
move $s0, $a2
lw $s0, 44($fp)
li $s1, 0
beq $s0, $s1, L2811
j L2812
L2812:
lw $s0, 40($fp)
move $s0, $s0
lw $s1, 44($fp)
move $s1, $s1
li $s2, 0
beq $s1, $s2, L2804
j L2803
L2803:
move $a0, $s0
lw $s0, 0($s1)
move $a1, $s0
jal L2761
move $s0, $v0
la $s0, L2746
move $a0, $s0
jal tig_print
move $s0, $v0
lw $s0, 40($fp)
move $s0, $s0
lw $s1, 44($fp)
move $s1, $s1
li $s2, 0
beq $s1, $s2, L2808
j L2807
L2807:
move $a0, $s0
lw $s0, 4($s1)
move $a1, $s0
jal L2762
move $s0, $v0
move $s0, $s0
L2813:
move $v0, $s0
j L2828
L2811:
la $s0, L2747
move $a0, $s0
jal tig_print
move $s0, $v0
move $s0, $s0
j L2813
L2804:
jal tig_nilerror
move $s2, $v0
j L2803
L2808:
jal tig_nilerror
move $s2, $v0
j L2807
L2828:
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
L2831:
sw $a0, 40($fp)
addi $s0, $fp, 44
move $s0, $s0
jal tig_getchar
move $s1, $v0
move $s1, $s1
sw $s1, 0($s0)
move $a0, $fp
jal L2759
move $s0, $v0
move $s0, $s0
addi $s1, $fp, 44
move $s1, $s1
jal tig_getchar
move $s2, $v0
move $s2, $s2
sw $s2, 0($s1)
move $a0, $fp
jal L2759
move $s1, $v0
move $s1, $s1
move $s2, $fp
move $a0, $fp
move $a1, $s0
move $a2, $s1
jal L2760
move $s0, $v0
move $s0, $s0
move $a0, $s2
move $a1, $s0
jal L2762
move $s0, $v0
move $v0, $s0
j L2830
L2830:
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
