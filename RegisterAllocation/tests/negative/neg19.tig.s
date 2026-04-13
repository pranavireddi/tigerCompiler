L1884:
li $s0, 0
move $s0, $s0
li $s1, 10
move $s1, $s1
ble $s0, $s1, L1881
j L1879
L1879:
li $s0, 0
move $v0, $s0
j L1883
L1881:
li $s0, 5
move $s0, $s0
bge $s0, $s1, L1879
j L1882
L1882:
addi $s0, $s0, 1
move $s0, $s0
j L1881
L1883:
