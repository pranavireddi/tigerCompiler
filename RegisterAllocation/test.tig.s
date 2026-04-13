L3:
lw $s0, -4($fp)
lw $s0, -4($s0)
lw $s0, -8($s0)
move $v0, $s0
j L2
L2:
L5:
move $a0, $fp
jal L1
move $s0, $v0
move $v0, $s0
j L4
L4:
L7:
li $s0, 5
sw $s0, -8($fp)
move $a0, $fp
jal L0
move $s0, $v0
move $v0, $s0
j L6
L6:
