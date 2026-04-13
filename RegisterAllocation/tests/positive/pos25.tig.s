L2213:
lw $s0, -4($fp)
lw $s0, -4($s0)
lw $s0, -8($s0)
add $s0, $s0, $s1 
move $v0, $s0
j L2212
L2212:
L2215:
move $a0, $fp
lw $s0, -4($fp)
lw $s0, -12($s0)
move $a1, $s0
jal L2211
move $s0, $v0
move $v0, $s0
j L2214
L2214:
L2217:
li $s0, 5
sw $s0, -8($fp)
li $s0, 2
sw $s0, -12($fp)
move $a0, $fp
jal L2210
move $s0, $v0
move $v0, $s0
j L2216
L2216:
