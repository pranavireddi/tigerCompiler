L2137:
li $s0, 0
move $s0, $s0
li $s1, 10
move $s1, $s1
ble $s0, $s1, L2131
j L2127
L2127:
li $s0, 0
move $v0, $s0
j L2136
L2131:
li $s2, 5
beq $s0, $s2, L2128
j L2129
L2129:
bge $s0, $s1, L2127
j L2132
L2132:
addi $s0, $s0, 1
move $s0, $s0
j L2131
L2128:
j L2127
L2136:
L2139:
li $s0, 0
move $s0, $s0
li $s1, 10
move $s1, $s1
ble $s0, $s1, L2134
j L2125
L2125:
li $s0, 0
move $v0, $s0
j L2138
L2134:
move $a0, $fp
jal L2126
move $s2, $v0
bge $s0, $s1, L2125
j L2135
L2135:
addi $s0, $s0, 1
move $s0, $s0
j L2134
L2138:
