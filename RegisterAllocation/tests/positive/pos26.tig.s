L2221:
lw $s0, -4($fp)
lw $s0, -4($s0)
lw $s0, -8($s0)
add $s0, $s0, $s1 
move $v0, $s0
j L2220
L2220:
L2223:
li $s0, 2
move $s0, $s0
move $a0, $fp
move $a1, $s0
jal L2219
move $s0, $v0
move $v0, $s0
j L2222
L2222:
L2225:
li $s0, 5
sw $s0, -8($fp)
move $a0, $fp
jal L2218
move $s0, $v0
move $v0, $s0
j L2224
L2224:
