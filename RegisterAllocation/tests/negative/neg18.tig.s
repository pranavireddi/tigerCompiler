L1874: .asciiz "a"
L1876:
li $s0, 0
move $v0, $s0
j L1875
L1875:
L1878:
move $a0, $fp
li $s0, 5
move $a1, $s0
jal L1873
move $s0, $v0
move $v0, $s0
j L1877
L1877:
