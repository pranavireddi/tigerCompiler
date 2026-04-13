L1867: .asciiz "a"
L1869:
li $s0, 4
move $a0, $s0
jal allocRecord
move $s0, $v0
move $s0, $s0
li $s1, 0
sw $s1, 0($s0)
move $v0, $s0
j L1868
L1868:
