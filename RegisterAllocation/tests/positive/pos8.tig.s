L2107:
li $s0, 0
move $s0, $s0
li $s1, 10
move $s1, $s1
ble $s0, $s1, L2104
j L2099
L2099:
li $s0, 0
move $v0, $s0
j L2106
L2104:
li $s2, 5
beq $s0, $s2, L2100
j L2101
L2101:
addi $s0, $s0, 1
move $s0, $s0
li $s2, 0
move $s2, $s2
L2102:
bge $s0, $s1, L2099
j L2105
L2105:
addi $s0, $s0, 1
move $s0, $s0
j L2104
L2100:
j L2099
L2108:
li $s2, 0
move $s2, $s2
j L2102
L2106:
