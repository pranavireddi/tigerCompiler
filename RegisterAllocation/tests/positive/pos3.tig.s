L2068: .asciiz "a"
L2069: .asciiz "b"
L2074:
L2070:
la $s0, L2068
move $s0, $s0
L2072:
move $v0, $s0
j L2073
L2071:
la $s0, L2069
move $s0, $s0
j L2072
L2073:
