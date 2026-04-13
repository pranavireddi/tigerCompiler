L2237:
move $v0, $s0
j L2236
L2236:
L2239:
li $s0, 2
move $s0, $s0
move $a0, $fp
move $a1, $s0
jal L2235
move $s0, $v0
move $v0, $s0
j L2238
L2238:
L2241:
li $s0, 5
move $s0, $s0
move $a0, $fp
jal L2234
move $s0, $v0
move $v0, $s0
j L2240
L2240:
