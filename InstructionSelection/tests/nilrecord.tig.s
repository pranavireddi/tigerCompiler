L8:
li t142, 0
move t139, t142
move t140, t139
li t143, 0
beq t140, t143, L4
j L3
L3:
li t145, 0
move t104, t145
lw t146, 0(t140)
move t105, t146
jal print
move t144, t102
move t102, t144
j L7
L4:
jal nilerror
move t147, t102
j L3
L7:
