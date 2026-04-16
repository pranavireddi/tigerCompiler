.data

.text
.globl main
main:
addi $sp, $sp, -16
sw $ra, 0($sp)
sw $fp, 4($sp)
move $fp, $sp
L2872:
sw $a0, -4($fp)
sw $a1, -8($fp)
move $s0, $a2
lw $s1, -4($fp)
lw $s1, -4($s1)
lw $s1, -8($s1)
add $s0, $s1, $s0 
move $v0, $s0
j L2871
L2871:
move $sp, $fp
lw $ra, 0($sp)
lw $fp, 4($sp)
addi $sp, $sp, 16
jr $ra
addi $sp, $sp, -16
sw $ra, 0($sp)
sw $fp, 4($sp)
move $fp, $sp
L2874:
sw $a0, -4($fp)
sw $a1, -8($fp)
move $a0, $fp
lw $s0, -4($fp)
lw $s0, -12($s0)
move $a1, $s0
jal L2870
move $s0, $v0
move $v0, $s0
j L2873
L2873:
move $sp, $fp
lw $ra, 0($sp)
lw $fp, 4($sp)
addi $sp, $sp, 16
jr $ra
addi $sp, $sp, -20
sw $ra, 0($sp)
sw $fp, 4($sp)
move $fp, $sp
L2876:
sw $a0, -4($fp)
li $s0, 5
sw $s0, -8($fp)
li $s0, 2
sw $s0, -12($fp)
move $a0, $fp
jal L2869
move $s0, $v0
move $v0, $s0
j L2875
L2875:
move $sp, $fp
lw $ra, 0($sp)
lw $fp, 4($sp)
addi $sp, $sp, 20
jr $ra
