L1928:
move $v0, $s0
j L1927
L1927:
L1925: .asciiz "a"
L1926: .asciiz "a"
L1930:
move $a0, $fp
li $s0, 0
move $a1, $s0
jal L1924
move $s0, $v0
move $v0, $s0
j L1929
L1929:
