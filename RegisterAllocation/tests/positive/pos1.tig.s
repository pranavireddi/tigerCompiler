L2061:
li $s0, 10
move $s0, $s0
li $s1, 1
move $s1, $s1
ble $s0, $s1, L2058
j L2056
L2056:
li $s0, 0
move $v0, $s0
j L2060
L2058:
bge $s0, $s1, L2056
j L2059
L2059:
addi $s0, $s0, 1
move $s0, $s0
j L2058
L2060:
