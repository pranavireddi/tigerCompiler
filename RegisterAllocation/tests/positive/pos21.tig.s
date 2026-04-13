L2184:
lw $s0, -4($fp)
lw $s0, -8($s0)
move $v0, $s0
j L2183
L2183:
L2186:
lw $s0, -4($fp)
move $a0, $s0
jal L2181
move $s0, $v0
move $v0, $s0
j L2185
L2185:
L2188:
li $s0, 5
sw $s0, -8($fp)
move $a0, $fp
jal L2182
move $s0, $v0
move $v0, $s0
j L2187
L2187:
