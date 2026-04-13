L2162:
li $s0, 4
move $a0, $s0
jal allocRecord
move $s0, $v0
move $s0, $s0
li $s1, 5
sw $s1, 0($s0)
move $s0, $s0
move $s0, $s0
li $s1, 0
beq $s0, $s1, L2160
j L2159
L2159:
lw $s0, 0($s0)
move $v0, $s0
j L2161
L2160:
jal nilerror
move $s1, $v0
j L2159
L2161:
