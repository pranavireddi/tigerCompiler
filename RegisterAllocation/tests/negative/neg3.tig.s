L1814:
li $s0, 0
move $v0, $s0
j L1813
L1813:
L1816:
li $s0, 0
move $s0, $s0
li $s1, 10
move $s1, $s1
ble $s0, $s1, L1811
j L1808
L1808:
li $s0, 0
move $v0, $s0
j L1815
L1811:
move $a0, $fp
jal L1809
move $s2, $v0
bge $s0, $s1, L1808
j L1812
L1812:
addi $s0, $s0, 1
move $s0, $s0
j L1811
L1815:
