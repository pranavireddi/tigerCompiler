L2197:
lw $s0, -4($fp)
lw $s0, -4($s0)
lw $s0, -8($s0)
move $v0, $s0
j L2196
L2196:
L2199:
move $a0, $fp
jal L2195
move $s0, $v0
move $v0, $s0
j L2198
L2198:
L2201:
li $s0, 5
sw $s0, -8($fp)
move $a0, $fp
jal L2194
move $s0, $v0
move $v0, $s0
j L2200
L2200:
