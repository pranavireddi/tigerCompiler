
.data
L958:
  .word 1
  .ascii "0"
  .space 3
L959:
  .word 1
  .ascii "9"
  .space 3
L965:
  .word 1
  .ascii " "
  .space 3
L966:
  .word 1
  .ascii "
"
  .space 3
L989:
  .word 1
  .ascii "-"
  .space 3

.text
.globl L956
L956:
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
L1008:
sw $a0, -4($fp)
sw $a1, -8($fp)
move $s0, $a2
lw $s0, -4($fp)
lw $s0, -4($s0)
lw $s0, -8($s0)
move $a0, $s0
jal tig_ord
move $s0, $v0
move $s0, $s0
move $s0, $s0
la $s1, L958
move $a0, $s1
jal tig_ord
move $s1, $v0
move $s1, $s1
bge $s0, $s1, L960
j L961
L961:
li $s0, 0
move $s0, $s0
L962:
move $v0, $s0
j L1007
L960:
li $s0, 1
move $s0, $s0
lw $s1, -4($fp)
lw $s1, -4($s1)
lw $s1, -8($s1)
move $a0, $s1
jal tig_ord
move $s1, $v0
move $s1, $s1
move $s1, $s1
la $s2, L959
move $a0, $s2
jal tig_ord
move $s2, $v0
move $s2, $s2
ble $s1, $s2, L963
j L964
L964:
li $s0, 0
move $s0, $s0
L963:
move $s0, $s0
j L962
L1007:
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
.globl L957
L957:
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
L1010:
sw $a0, -4($fp)
sw $a1, -8($fp)
L971:
lw $s0, -4($fp)
lw $s0, -4($s0)
lw $s0, -8($s0)
move $a0, $s0
la $s0, L965
move $a1, $s0
jal tig_stringEqual
move $s0, $v0
move $s0, $s0
li $s1, 0
bne $s0, $s1, L967
j L968
L968:
lw $s0, -4($fp)
lw $s0, -4($s0)
lw $s0, -8($s0)
move $a0, $s0
la $s0, L966
move $a1, $s0
jal tig_stringEqual
move $s0, $v0
move $s0, $s0
L969:
li $s1, 0
bne $s0, $s1, L972
j L970
L970:
li $s0, 0
move $v0, $s0
j L1009
L967:
li $s0, 1
move $s0, $s0
j L969
L972:
lw $s0, -4($fp)
lw $s0, -4($s0)
addi $s0, $s0, -8
move $s0, $s0
jal tig_getchar
move $s1, $v0
move $s1, $s1
sw $s1, 0($s0)
j L971
L1009:
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
.globl L955
L955:
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
L1012:
sw $a0, -4($fp)
sw $a1, -8($fp)
move $s0, $a2
li $s0, 0
move $s0, $s0
move $a0, $fp
jal L957
move $s1, $v0
lw $s1, -8($fp)
move $s1, $s1
li $s2, 0
beq $s1, $s2, L974
j L973
L973:
addi $s1, $s1, 0
move $s1, $s1
move $a0, $fp
lw $s2, -4($fp)
lw $s2, -8($s2)
move $a1, $s2
jal L956
move $s2, $v0
move $s2, $s2
sw $s2, 0($s1)
L976:
move $a0, $fp
lw $s1, -4($fp)
lw $s1, -8($s1)
move $a1, $s1
jal L956
move $s1, $v0
move $s1, $s1
li $s2, 0
bne $s1, $s2, L977
j L975
L975:
move $v0, $s0
j L1011
L974:
jal tig_nilerror
move $s2, $v0
j L973
L977:
li $s1, 10
mul $s0, $s0, $s1 
move $s0, $s0
lw $s1, -4($fp)
lw $s1, -8($s1)
move $a0, $s1
jal tig_ord
move $s1, $v0
move $s1, $s1
add $s0, $s0, $s1 
move $s0, $s0
la $s1, L958
move $a0, $s1
jal tig_ord
move $s1, $v0
move $s1, $s1
sub $s0, $s0, $s1 
move $s0, $s0
lw $s1, -4($fp)
addi $s1, $s1, -8
move $s1, $s1
jal tig_getchar
move $s2, $v0
move $s2, $s2
sw $s2, 0($s1)
j L976
L1011:
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
.globl L978
L978:
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
L1014:
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
jal L955
move $s1, $v0
move $s1, $s1
move $s0, $s0
li $s2, 0
beq $s0, $s2, L982
j L981
L981:
lw $s0, 0($s0)
li $s2, 0
bne $s0, $s2, L983
j L984
L984:
li $s0, 0
move $s0, $s0
L985:
move $v0, $s0
j L1013
L982:
jal tig_nilerror
move $s2, $v0
j L981
L983:
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
jal L978
move $s2, $v0
move $s2, $s2
sw $s2, 0($s1)
move $s0, $s0
j L985
L1013:
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
.globl L986
L986:
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
L1016:
sw $a0, -4($fp)
sw $a1, -8($fp)
move $s0, $a2
lw $s0, -8($fp)
li $s1, 0
bgt $s0, $s1, L987
j L988
L988:
li $s0, 0
move $v0, $s0
j L1015
L987:
lw $s0, -4($fp)
move $a0, $s0
lw $s0, -8($fp)
li $s1, 10
div $s0, $s1
mflo $s0
move $a1, $s0
jal L986
move $s0, $v0
lw $s0, -8($fp)
lw $s1, -8($fp)
li $s2, 10
div $s1, $s2
mflo $s1
li $s2, 10
mul $s1, $s1, $s2 
sub $s0, $s0, $s1 
move $s0, $s0
la $s1, L958
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
j L988
L1015:
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
.globl L979
L979:
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
L1018:
sw $a0, -4($fp)
sw $a1, -8($fp)
move $s0, $a2
lw $s0, -8($fp)
li $s1, 0
blt $s0, $s1, L993
j L994
L994:
lw $s0, -8($fp)
li $s1, 0
bgt $s0, $s1, L990
j L991
L991:
la $s0, L958
move $a0, $s0
jal tig_print
move $s0, $v0
move $s0, $s0
L992:
move $s0, $s0
L995:
move $v0, $s0
j L1017
L993:
la $s0, L989
move $a0, $s0
jal tig_print
move $s0, $v0
move $a0, $fp
li $s0, 0
lw $s1, -8($fp)
sub $s0, $s0, $s1 
move $a1, $s0
jal L986
move $s0, $v0
move $s0, $s0
j L995
L990:
move $a0, $fp
lw $s0, -8($fp)
move $a1, $s0
jal L986
move $s0, $v0
move $s0, $s0
j L992
L1017:
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
.globl L980
L980:
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
L1020:
sw $a0, -4($fp)
sw $a1, -8($fp)
move $s0, $a2
lw $s0, -8($fp)
li $s1, 0
beq $s0, $s1, L1004
j L1005
L1005:
lw $s0, -4($fp)
move $s0, $s0
lw $s1, -8($fp)
move $s1, $s1
li $s2, 0
beq $s1, $s2, L997
j L996
L996:
move $a0, $s0
lw $s0, 0($s1)
move $a1, $s0
jal L979
move $s0, $v0
la $s0, L965
move $a0, $s0
jal tig_print
move $s0, $v0
lw $s0, -4($fp)
move $s0, $s0
lw $s1, -8($fp)
move $s1, $s1
li $s2, 0
beq $s1, $s2, L1001
j L1000
L1000:
move $a0, $s0
lw $s0, 4($s1)
move $a1, $s0
jal L980
move $s0, $v0
move $s0, $s0
L1006:
move $v0, $s0
j L1019
L1004:
la $s0, L966
move $a0, $s0
jal tig_print
move $s0, $v0
move $s0, $s0
j L1006
L997:
jal tig_nilerror
move $s2, $v0
j L996
L1001:
jal tig_nilerror
move $s2, $v0
j L1000
L1019:
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
L1022:
sw $a0, -4($fp)
addi $s0, $fp, -8
move $s0, $s0
jal tig_getchar
move $s1, $v0
move $s1, $s1
sw $s1, 0($s0)
move $a0, $fp
jal L978
move $s0, $v0
move $s0, $s0
move $a0, $fp
move $a1, $s0
jal L980
move $s0, $v0
move $v0, $s0
j L1021
L1021:
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
