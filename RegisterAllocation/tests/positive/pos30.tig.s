L2253:
lw $s0, -4($fp)
lw $s0, -12($s0)
move $s0, $s0
li $s1, 0
beq $s0, $s1, L2251
j L2250
L2250:
lw $s1, -4($fp)
lw $s1, -8($s1)
li $s2, 4
mul $s1, $s1, $s2 
add $s0, $s0, $s1 
lw $s0, 0($s0)
move $v0, $s0
j L2252
L2251:
jal nilerror
move $s1, $v0
j L2250
L2252:
L2255:
li $s0, 3
sw $s0, -8($fp)
addi $s0, $fp, -12
move $s0, $s0
li $s1, 5
move $a0, $s1
li $s1, 0
move $a1, $s1
jal initArray
move $s1, $v0
move $s1, $s1
sw $s1, 0($s0)
move $a0, $fp
jal L2249
move $s0, $v0
move $v0, $s0
j L2254
L2254:
