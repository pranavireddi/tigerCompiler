L2143:
lw $s0, -4($fp)
move $a0, $s0
move $a1, $s1
jal L2141
move $s0, $v0
move $v0, $s0
j L2142
L2142:
L2145:
lw $s0, -4($fp)
move $a0, $s0
move $a1, $s1
jal L2140
move $s0, $v0
move $v0, $s0
j L2144
L2144:
L2147:
move $a0, $fp
li $s0, 1
move $a1, $s0
jal L2140
move $s0, $v0
move $v0, $s0
j L2146
L2146:
