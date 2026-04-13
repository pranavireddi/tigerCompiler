L2082:
li $s0, 0
move $s0, $s0
li $s1, 10
move $s1, $s1
ble $s0, $s1, L2079
j L2075
L2075:
li $s0, 0
move $v0, $s0
j L2081
L2079:
li $s2, 5
beq $s0, $s2, L2076
j L2077
L2077:
bge $s0, $s1, L2075
j L2080
L2080:
addi $s0, $s0, 1
move $s0, $s0
j L2079
L2076:
j L2075
L2081:
