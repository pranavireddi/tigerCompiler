L1942:
add $s0, $s0, $s0 
move $v0, $s0
j L1941
L1941:
L1944:
move $a0, $fp
li $s0, 1
move $a1, $s0
jal L1940
move $s0, $v0
move $v0, $s0
j L1943
L1943:
