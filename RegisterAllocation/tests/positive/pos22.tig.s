L2191:
lw $s0, -4($fp)
lw $s0, -8($s0)
move $v0, $s0
j L2190
L2190:
L2193:
li $s0, 5
sw $s0, -8($fp)
move $a0, $fp
jal L2189
move $s0, $v0
move $v0, $s0
j L2192
L2192:
