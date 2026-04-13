L2273:
lw $s0, -4($fp)
lw $s0, -12($s0)
move $v0, $s0
j L2272
L2272:
L2275:
move $a0, $fp
jal L2271
move $s0, $v0
move $v0, $s0
j L2274
L2274:
L2277:
move $a0, $fp
li $s0, 2
move $a1, $s0
jal L2270
move $s0, $v0
move $v0, $s0
j L2276
L2276:
