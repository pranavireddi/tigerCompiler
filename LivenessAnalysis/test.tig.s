L3:
lw t134, -4(t130)
lw t133, -4(t134)
lw t132, -8(t133)
move t102, t132
j L2
L2:
L5:
move t104, t130
jal L1
move t135, t102
move t102, t135
j L4
L4:
L7:
li t136, 5
sw t136, -8(t130)
move t104, t130
jal L0
move t137, t102
move t102, t137
j L6
L6:
