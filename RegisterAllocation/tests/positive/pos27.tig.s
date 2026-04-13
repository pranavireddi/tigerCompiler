L2229:
lw $s0, -4($fp)
lw $s0, -4($s0)
lw $s0, -8($s0)
add $s0, $s0, $s1 
move $v0, $s0
j L2228
L2228:
L2231:
li $s0, 2
move $s0, $s0
move $a0, $fp
move $a1, $s0
jal L2227
move $s0, $v0
move $v0, $s0
j L2230
L2230:
L2233:
li $s0, 5
sw $s0, -8($fp)
move $a0, $fp
jal L2226
move $s0, $v0
move $v0, $s0
j L2232
L2232:
