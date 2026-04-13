L2246:
lw $s0, -4($fp)
lw $s0, -8($s0)
move $s0, $s0
li $s1, 0
beq $s0, $s1, L2244
j L2243
L2243:
lw $s0, 0($s0)
move $v0, $s0
j L2245
L2244:
jal nilerror
move $s1, $v0
j L2243
L2245:
L2248:
addi $s0, $fp, -8
move $s0, $s0
li $s1, 4
move $a0, $s1
jal allocRecord
move $s1, $v0
move $s1, $s1
li $s2, 1
sw $s2, 0($s1)
sw $s1, 0($s0)
move $a0, $fp
jal L2242
move $s0, $v0
move $v0, $s0
j L2247
L2247:
