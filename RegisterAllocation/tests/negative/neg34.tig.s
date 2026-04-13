L1949:
move $v0, $s0
j L1948
L1948:
L1946: .asciiz "hello"
L1947: .asciiz "hello"
L1951:
move $a0, $fp
la $s0, L1946
move $a1, $s0
jal L1945
move $s0, $v0
move $v0, $s0
j L1950
L1950:
