L2150:
addi $s0, $s0, 1
move $v0, $s0
j L2149
L2149:
L2152:
li $s0, 1
move $s0, $s0
move $a0, $fp
li $s0, 10
move $a1, $s0
jal L2148
move $s0, $v0
move $v0, $s0
j L2151
L2151:
