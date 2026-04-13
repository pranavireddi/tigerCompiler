L2170:
addi $s0, $s0, 1
move $v0, $s0
j L2169
L2169:
L2172:
li $s0, 5
move $s0, $s0
move $a0, $fp
li $s0, 3
move $a1, $s0
jal L2168
move $s0, $v0
move $v0, $s0
j L2171
L2171:
