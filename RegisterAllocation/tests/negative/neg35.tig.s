L1956:
move $v0, $s0
j L1955
L1955:
L1953: .asciiz "a"
L1954: .asciiz "a"
L1958:
move $a0, $fp
li $s0, 0
move $a1, $s0
jal L1952
move $s0, $v0
move $v0, $s0
j L1957
L1957:
