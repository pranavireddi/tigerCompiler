L1963:
move $v0, $s0
j L1962
L1962:
L1960: .asciiz "a"
L1961: .asciiz "a"
L1965:
move $a0, $fp
li $s0, 0
move $a1, $s0
jal L1959
move $s0, $v0
move $v0, $s0
j L1964
L1964:
