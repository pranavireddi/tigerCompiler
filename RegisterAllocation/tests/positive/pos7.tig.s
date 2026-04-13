L2098:
li $s0, 0
move $s0, $s0
L2095:
li $s1, 20
blt $s0, $s1, L2096
j L2092
L2092:
move $v0, $s0
j L2097
L2096:
addi $s0, $s0, 1
move $s0, $s0
li $s1, 5
beq $s0, $s1, L2093
j L2094
L2094:
j L2095
L2093:
j L2092
L2097:
