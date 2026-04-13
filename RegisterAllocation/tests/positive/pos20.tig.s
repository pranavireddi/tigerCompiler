L2176:
lw $s0, -4($fp)
move $a0, $s0
jal L2174
move $s0, $v0
move $v0, $s0
j L2175
L2175:
L2178:
li $s0, 1
move $v0, $s0
j L2177
L2177:
L2180:
move $a0, $fp
jal L2173
move $s0, $v0
move $v0, $s0
j L2179
L2179:
