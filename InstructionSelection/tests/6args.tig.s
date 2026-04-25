L2:
add t139, t132, t133 
lw t140, 0(t130)
add t138, t139, t140 
lw t141, 4(t130)
add t137, t138, t141 
lw t142, 8(t130)
add t136, t137, t142 
lw t143, 12(t130)
add t135, t136, t143 
move t102, t135
j L1
L1:
L4:
li t145, 0
move t134, t145
move t104, t130
li t147, 10
move t105, t147
li t148, 20
move t106, t148
li t149, 30
move t107, t149
li t150, 40
sw t150, 0(t129)
li t151, 50
sw t151, 4(t129)
li t152, 60
sw t152, 8(t129)
jal L0
move t146, t102
move t134, t146
li t154, 0
move t104, t154
move t105, t134
jal chr
move t153, t102
move t144, t153
li t156, 0
move t104, t156
move t105, t144
jal print
move t155, t102
move t102, t155
j L3
L3:
