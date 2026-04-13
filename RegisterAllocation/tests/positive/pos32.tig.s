L2267:
lw $s0, -4($fp)
lw $s0, -8($s0)
addi $s0, $s0, 1
lw $s1, -4($fp)
sw $s0, -8($s1)
lw $s0, -4($fp)
lw $s0, -8($s0)
move $v0, $s0
j L2266
L2266:
L2269:
li $s0, 0
sw $s0, -8($fp)
move $a0, $fp
jal L2265
move $s0, $v0
move $v0, $s0
j L2268
L2268:
