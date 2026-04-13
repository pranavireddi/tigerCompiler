L2091:
li $s0, 2
li $s1, 0
bne $s0, $s1, L2088
j L2089
L2089:
li $s0, 0
move $v0, $s0
j L2090
L2088:
j L2089
L2090:
