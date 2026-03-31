L0: .asciiz "zxy"
L2:
li t135, 8
move t104, t135
jal allocRecord
move t134, t102
move t132, t134
la t136, L0
sw t136, 0(t132)
li t137, 21
sw t137, 4(t132)
move t133, t132
li t138, 0
move t102, t138
j L1
L1:
