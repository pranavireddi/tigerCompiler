L1828:
li $s0, 0
move $v0, $s0
j L1827
L1827:
L1830:
li $s0, 0
move $s0, $s0
li $s1, 10
move $s1, $s1
ble $s0, $s1, L1825
j L1823
L1823:
li $s0, 0
move $v0, $s0
j L1829
L1825:
move $a0, $fp
jal L1822
move $s2, $v0
bge $s0, $s1, L1823
j L1826
L1826:
addi $s0, $s0, 1
move $s0, $s0
j L1825
L1829:
