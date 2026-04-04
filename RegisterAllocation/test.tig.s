L47:
lw t170, -4(t130)
lw t169, -4(t170)
lw t168, -8(t169)
move t102, t168
j L46
L46:
L49:
move t104, t130
jal L45
move t171, t102
move t102, t171
j L48
L48:
L51:
li t172, 5
sw t172, -8(t130)
move t104, t130
jal L44
move t173, t102
move t102, t173
j L50
L50:
