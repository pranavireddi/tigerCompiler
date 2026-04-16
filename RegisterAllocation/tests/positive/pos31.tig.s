.data

.text
.globl main
main:
addi $sp, $sp, -16
sw $ra, 0($sp)
sw $fp, 4($sp)
move $fp, $sp
L2921:
sw $a0, -4($fp)
sw $a1, -8($fp)
lw $s0, -4($fp)
lw $s0, -8($s0)
move $v0, $s0
j L2920
L2920:
move $sp, $fp
lw $ra, 0($sp)
lw $fp, 4($sp)
addi $sp, $sp, 16
jr $ra
addi $sp, $sp, -16
sw $ra, 0($sp)
sw $fp, 4($sp)
move $fp, $sp
L2923:
sw $a0, -4($fp)
li $s0, 0
sw $s0, -8($fp)
li $s0, 10
move $s0, $s0
lw $s1, -8($fp)
ble $s1, $s0, L2918
j L2915
L2915:
li $s0, 0
move $v0, $s0
j L2922
L2918:
move $a0, $fp
jal L2916
move $s1, $v0
lw $s1, -8($fp)
bge $s1, $s0, L2915
j L2919
L2919:
lw $s1, -8($fp)
addi $s1, $s1, 1
sw $s1, -8($fp)
j L2918
L2922:
move $sp, $fp
lw $ra, 0($sp)
lw $fp, 4($sp)
addi $sp, $sp, 16
jr $ra
