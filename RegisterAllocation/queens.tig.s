
.data
L102:
  .word 2
  .ascii " O"
  .space 2
L103:
  .word 2
  .ascii " ."
  .space 2
L115:
  .word 1
  .ascii "
"
  .space 3

.text
.globl L96
L96:
addi $sp, $sp, -48
sw $ra, 0($sp)
sw $fp, 4($sp)
sw $s0, 8($sp)
sw $s1, 12($sp)
sw $s2, 16($sp)
sw $s3, 20($sp)
sw $s4, 24($sp)
sw $s5, 28($sp)
sw $s6, 32($sp)
sw $s7, 36($sp)
move $fp, $sp
L159:
sw $a0, 40($fp)
sw $a1, 44($fp)
li $s0, 0
move $s0, $s0
lw $s1, 40($fp)
lw $s1, 44($s1)
addi $s1, $s1, -1
move $s1, $s1
ble $s0, $s1, L117
j L98
L98:
la $s0, L115
move $a0, $s0
jal tig_print
move $s0, $v0
move $v0, $s0
j L158
L117:
li $s2, 0
move $s2, $s2
lw $s3, 40($fp)
lw $s3, 44($s3)
addi $s3, $s3, -1
move $s3, $s3
ble $s2, $s3, L113
j L99
L99:
la $s2, L115
move $a0, $s2
jal tig_print
move $s2, $v0
bge $s0, $s1, L98
j L118
L118:
addi $s0, $s0, 1
move $s0, $s0
j L117
L113:
lw $s4, 40($fp)
lw $s4, 52($s4)
move $s4, $s4
li $s5, 0
beq $s4, $s5, L101
j L100
L100:
li $s5, 4
mul $s5, $s0, $s5 
addi $s5, $s5, 4
add $s4, $s4, $s5 
lw $s4, 0($s4)
beq $s4, $s2, L104
j L105
L105:
la $s4, L103
move $s4, $s4
L106:
move $a0, $s4
jal tig_print
move $s4, $v0
bge $s2, $s3, L99
j L114
L114:
addi $s2, $s2, 1
move $s2, $s2
j L113
L101:
jal tig_nilerror
move $s5, $v0
j L100
L104:
la $s4, L102
move $s4, $s4
j L106
L158:
move $sp, $fp
lw $s0, 8($sp)
lw $s1, 12($sp)
lw $s2, 16($sp)
lw $s3, 20($sp)
lw $s4, 24($sp)
lw $s5, 28($sp)
lw $s6, 32($sp)
lw $s7, 36($sp)
lw $ra, 0($sp)
lw $fp, 4($sp)
addi $sp, $sp, 48
jr $ra
.globl L97
L97:
addi $sp, $sp, -48
sw $ra, 0($sp)
sw $fp, 4($sp)
sw $s0, 8($sp)
sw $s1, 12($sp)
sw $s2, 16($sp)
sw $s3, 20($sp)
sw $s4, 24($sp)
sw $s5, 28($sp)
sw $s6, 32($sp)
sw $s7, 36($sp)
move $fp, $sp
L161:
sw $a0, 40($fp)
sw $a1, 44($fp)
move $s0, $a2
lw $s0, 44($fp)
lw $s1, 40($fp)
lw $s1, 44($s1)
beq $s0, $s1, L155
j L156
L156:
li $s0, 0
move $s0, $s0
lw $s1, 40($fp)
lw $s1, 44($s1)
addi $s1, $s1, -1
move $s1, $s1
ble $s0, $s1, L153
j L119
L119:
li $s0, 0
move $s0, $s0
L157:
move $v0, $s0
j L160
L155:
lw $s0, 40($fp)
move $a0, $s0
jal L96
move $s0, $v0
move $s0, $s0
j L157
L153:
lw $s2, 40($fp)
lw $s2, 48($s2)
move $s2, $s2
li $s3, 0
beq $s2, $s3, L121
j L120
L120:
li $s3, 4
mul $s3, $s0, $s3 
addi $s3, $s3, 4
add $s2, $s2, $s3 
lw $s2, 0($s2)
li $s3, 0
beq $s2, $s3, L124
j L125
L125:
li $s2, 0
move $s2, $s2
L126:
li $s3, 0
bne $s2, $s3, L131
j L132
L132:
li $s2, 0
move $s2, $s2
L133:
li $s3, 0
bne $s2, $s3, L150
j L151
L151:
bge $s0, $s1, L119
j L154
L154:
addi $s0, $s0, 1
move $s0, $s0
j L153
L121:
jal tig_nilerror
move $s3, $v0
j L120
L124:
li $s2, 1
move $s2, $s2
lw $s3, 40($fp)
lw $s3, 56($s3)
move $s3, $s3
li $s4, 0
beq $s3, $s4, L123
j L122
L122:
lw $s4, 44($fp)
add $s4, $s0, $s4 
li $s5, 4
mul $s4, $s4, $s5 
addi $s4, $s4, 4
add $s3, $s3, $s4 
lw $s3, 0($s3)
li $s4, 0
beq $s3, $s4, L127
j L128
L128:
li $s2, 0
move $s2, $s2
L127:
move $s2, $s2
j L126
L123:
jal tig_nilerror
move $s4, $v0
j L122
L131:
li $s2, 1
move $s2, $s2
lw $s3, 40($fp)
lw $s3, 60($s3)
move $s3, $s3
li $s4, 0
beq $s3, $s4, L130
j L129
L129:
addi $s4, $s0, 7
lw $s5, 44($fp)
sub $s4, $s4, $s5 
li $s5, 4
mul $s4, $s4, $s5 
addi $s4, $s4, 4
add $s3, $s3, $s4 
lw $s3, 0($s3)
li $s4, 0
beq $s3, $s4, L134
j L135
L135:
li $s2, 0
move $s2, $s2
L134:
move $s2, $s2
j L133
L130:
jal tig_nilerror
move $s4, $v0
j L129
L150:
lw $s2, 40($fp)
lw $s2, 48($s2)
move $s2, $s2
li $s3, 0
beq $s2, $s3, L137
j L136
L136:
li $s3, 1
li $s4, 4
mul $s4, $s0, $s4 
addi $s4, $s4, 4
add $s2, $s2, $s4 
sw $s3, 0($s2)
lw $s2, 40($fp)
lw $s2, 56($s2)
move $s2, $s2
li $s3, 0
beq $s2, $s3, L139
j L138
L138:
li $s3, 1
lw $s4, 44($fp)
add $s4, $s0, $s4 
li $s5, 4
mul $s4, $s4, $s5 
addi $s4, $s4, 4
add $s2, $s2, $s4 
sw $s3, 0($s2)
lw $s2, 40($fp)
lw $s2, 60($s2)
move $s2, $s2
li $s3, 0
beq $s2, $s3, L141
j L140
L140:
li $s3, 1
addi $s4, $s0, 7
lw $s5, 44($fp)
sub $s4, $s4, $s5 
li $s5, 4
mul $s4, $s4, $s5 
addi $s4, $s4, 4
add $s2, $s2, $s4 
sw $s3, 0($s2)
lw $s2, 40($fp)
lw $s2, 52($s2)
move $s2, $s2
li $s3, 0
beq $s2, $s3, L143
j L142
L142:
lw $s3, 44($fp)
li $s4, 4
mul $s3, $s3, $s4 
addi $s3, $s3, 4
add $s2, $s2, $s3 
sw $s0, 0($s2)
lw $s2, 40($fp)
move $a0, $s2
lw $s2, 44($fp)
addi $s2, $s2, 1
move $a1, $s2
jal L97
move $s2, $v0
lw $s2, 40($fp)
lw $s2, 48($s2)
move $s2, $s2
li $s3, 0
beq $s2, $s3, L145
j L144
L144:
li $s3, 0
li $s4, 4
mul $s4, $s0, $s4 
addi $s4, $s4, 4
add $s2, $s2, $s4 
sw $s3, 0($s2)
lw $s2, 40($fp)
lw $s2, 56($s2)
move $s2, $s2
li $s3, 0
beq $s2, $s3, L147
j L146
L146:
li $s3, 0
lw $s4, 44($fp)
add $s4, $s0, $s4 
li $s5, 4
mul $s4, $s4, $s5 
addi $s4, $s4, 4
add $s2, $s2, $s4 
sw $s3, 0($s2)
lw $s2, 40($fp)
lw $s2, 60($s2)
move $s2, $s2
li $s3, 0
beq $s2, $s3, L149
j L148
L148:
li $s3, 0
addi $s4, $s0, 7
lw $s5, 44($fp)
sub $s4, $s4, $s5 
li $s5, 4
mul $s4, $s4, $s5 
addi $s4, $s4, 4
add $s2, $s2, $s4 
sw $s3, 0($s2)
j L151
L137:
jal tig_nilerror
move $s3, $v0
j L136
L139:
jal tig_nilerror
move $s3, $v0
j L138
L141:
jal tig_nilerror
move $s3, $v0
j L140
L143:
jal tig_nilerror
move $s3, $v0
j L142
L145:
jal tig_nilerror
move $s3, $v0
j L144
L147:
jal tig_nilerror
move $s3, $v0
j L146
L149:
jal tig_nilerror
move $s3, $v0
j L148
L160:
move $sp, $fp
lw $s0, 8($sp)
lw $s1, 12($sp)
lw $s2, 16($sp)
lw $s3, 20($sp)
lw $s4, 24($sp)
lw $s5, 28($sp)
lw $s6, 32($sp)
lw $s7, 36($sp)
lw $ra, 0($sp)
lw $fp, 4($sp)
addi $sp, $sp, 48
jr $ra
.globl tig_main
tig_main:
addi $sp, $sp, -64
sw $ra, 0($sp)
sw $fp, 4($sp)
sw $s0, 8($sp)
sw $s1, 12($sp)
sw $s2, 16($sp)
sw $s3, 20($sp)
sw $s4, 24($sp)
sw $s5, 28($sp)
sw $s6, 32($sp)
sw $s7, 36($sp)
move $fp, $sp
L163:
sw $a0, 40($fp)
li $s0, 8
sw $s0, 44($fp)
addi $s0, $fp, 48
move $s0, $s0
lw $s1, 44($fp)
move $a0, $s1
li $s1, 0
move $a1, $s1
jal tig_initArray
move $s1, $v0
move $s1, $s1
sw $s1, 0($s0)
addi $s0, $fp, 52
move $s0, $s0
lw $s1, 44($fp)
move $a0, $s1
li $s1, 0
move $a1, $s1
jal tig_initArray
move $s1, $v0
move $s1, $s1
sw $s1, 0($s0)
addi $s0, $fp, 56
move $s0, $s0
lw $s1, 44($fp)
lw $s2, 44($fp)
add $s1, $s1, $s2 
addi $s1, $s1, -1
move $a0, $s1
li $s1, 0
move $a1, $s1
jal tig_initArray
move $s1, $v0
move $s1, $s1
sw $s1, 0($s0)
addi $s0, $fp, 60
move $s0, $s0
lw $s1, 44($fp)
lw $s2, 44($fp)
add $s1, $s1, $s2 
addi $s1, $s1, -1
move $a0, $s1
li $s1, 0
move $a1, $s1
jal tig_initArray
move $s1, $v0
move $s1, $s1
sw $s1, 0($s0)
move $a0, $fp
li $s0, 0
move $a1, $s0
jal L97
move $s0, $v0
move $v0, $s0
j L162
L162:
move $sp, $fp
lw $s0, 8($sp)
lw $s1, 12($sp)
lw $s2, 16($sp)
lw $s3, 20($sp)
lw $s4, 24($sp)
lw $s5, 28($sp)
lw $s6, 32($sp)
lw $s7, 36($sp)
lw $ra, 0($sp)
lw $fp, 4($sp)
addi $sp, $sp, 64
jr $ra
