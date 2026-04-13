L2122:
li $s0, 0
move $s0, $s0
li $s1, 10
move $s1, $s1
ble $s0, $s1, L2119
j L2115
L2115:
li $s0, 0
move $v0, $s0
j L2121
L2119:
li $s2, 5
beq $s0, $s2, L2116
j L2117
L2117:
bge $s0, $s1, L2115
j L2120
L2120:
addi $s0, $s0, 1
move $s0, $s0
j L2119
L2116:
j L2115
L2121:
L2124:
move $a0, $fp
jal L2114
move $s0, $v0
move $v0, $s0
j L2123
L2123:
