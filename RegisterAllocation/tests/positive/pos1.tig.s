L43:
li t164, 10
move t162, t164
li t165, 1
move t163, t165
ble t162, t163, L40
j L38
L38:
li t166, 0
move t102, t166
j L42
L40:
bge t162, t163, L38
j L41
L41:
addi t167, t162, 1
move t162, t167
j L40
L42:
