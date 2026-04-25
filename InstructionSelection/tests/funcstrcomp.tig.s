L14:
move t104, t157
move t105, t158
jal stringEqual
move t161, t102
move t160, t161
li t162, 0
bne t160, t162, L6
j L7
L7:
li t163, 0
move t159, t163
L8:
move t102, t159
j L13
L6:
li t164, 1
move t159, t164
j L8
L13:
L9: .asciiz "a"
L10: .asciiz "a"
L11: .asciiz "a"
L12: .asciiz "a"
L16:
move t104, t130
la t166, L9
move t105, t166
la t167, L10
move t106, t167
jal L5
move t165, t102
move t102, t165
j L15
L15:
