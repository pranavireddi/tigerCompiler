L2067:
li $s0, 10
move $s0, $s0
li $s1, 20
move $s1, $s1
ble $s0, $s1, L2064
j L2062
L2062:
li $s0, 0
move $v0, $s0
j L2066
L2064:
bge $s0, $s1, L2062
j L2065
L2065:
addi $s0, $s0, 1
move $s0, $s0
j L2064
L2066:
