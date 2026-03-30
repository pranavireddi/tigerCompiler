L11:
lw t140, -4(t130)
lw t139, -4(t140)
lw t138, -8(t139)
move t102, t138
j L10
L10:
L13:
move t104, t130
jal L9
move t141, t102
move t102, t141
j L12
L12:
L15:
li t142, 5
sw t142, -8(t130)
move t104, t130
jal L8
move t143, t102
move t102, t143
j L14
L14:
