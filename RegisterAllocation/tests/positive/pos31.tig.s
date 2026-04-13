L2262:
lw $s0, -4($fp)
lw $s0, -8($s0)
move $v0, $s0
j L2261
L2261:
L2264:
li $s0, 0
sw $s0, -8($fp)
li $s0, 10
move $s0, $s0
lw $s1, -8($fp)
ble $s1, $s0, L2259
j L2256
L2256:
li $s0, 0
move $v0, $s0
j L2263
L2259:
move $a0, $fp
jal L2257
move $s1, $v0
lw $s1, -8($fp)
bge $s1, $s0, L2256
j L2260
L2260:
lw $s1, -8($fp)
addi $s1, $s1, 1
sw $s1, -8($fp)
j L2259
L2263:
