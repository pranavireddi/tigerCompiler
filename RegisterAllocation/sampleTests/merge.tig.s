
.data
L99: .asciiz "0"
L100: .asciiz "9"
L106: .asciiz " "
L107: .asciiz "
"
L156: .asciiz "-"

.text
.globl L97
L97:
addi $sp, $sp, -16
sw $ra, 0($sp)
sw $fp, 4($sp)
move $fp, $sp
L175:
sw $a0, -4($fp)
sw $a1, -8($fp)
move $s0, $a2
li $s0, 0
move $a0, $s0
lw $s0, -4($fp)
lw $s0, -4($s0)
lw $s0, -8($s0)
move $a1, $s0
jal tig_ord
move $s0, $v0
move $s0, $s0
move $s0, $s0
li $s1, 0
move $a0, $s1
la $s1, L99
move $a1, $s1
jal tig_ord
move $s1, $v0
move $s1, $s1
bge $s0, $s1, L101
j L102
L102:
li $s0, 0
move $s0, $s0
L103:
move $v0, $s0
j L174
L101:
li $s0, 1
move $s0, $s0
li $s1, 0
move $a0, $s1
lw $s1, -4($fp)
lw $s1, -4($s1)
lw $s1, -8($s1)
move $a1, $s1
jal tig_ord
move $s1, $v0
move $s1, $s1
move $s1, $s1
li $s2, 0
move $a0, $s2
la $s2, L100
move $a1, $s2
jal tig_ord
move $s2, $v0
move $s2, $s2
ble $s1, $s2, L104
j L105
L105:
li $s0, 0
move $s0, $s0
L104:
move $s0, $s0
j L103
L174:
move $sp, $fp
lw $ra, 0($sp)
lw $fp, 4($sp)
addi $sp, $sp, 16
jr $ra
.globl L98
L98:
addi $sp, $sp, -16
sw $ra, 0($sp)
sw $fp, 4($sp)
move $fp, $sp
L177:
sw $a0, -4($fp)
sw $a1, -8($fp)
L112:
lw $s0, -4($fp)
lw $s0, -4($s0)
lw $s0, -8($s0)
move $a0, $s0
la $s0, L106
move $a1, $s0
jal tig_stringEqual
move $s0, $v0
move $s0, $s0
li $s1, 0
bne $s0, $s1, L108
j L109
L109:
lw $s0, -4($fp)
lw $s0, -4($s0)
lw $s0, -8($s0)
move $a0, $s0
la $s0, L107
move $a1, $s0
jal tig_stringEqual
move $s0, $v0
move $s0, $s0
L110:
li $s1, 0
bne $s0, $s1, L113
j L111
L111:
li $s0, 0
move $v0, $s0
j L176
L108:
li $s0, 1
move $s0, $s0
j L110
L113:
lw $s0, -4($fp)
lw $s0, -4($s0)
addi $s0, $s0, -8
move $s0, $s0
li $s1, 0
move $a0, $s1
jal tig_getchar
move $s1, $v0
move $s1, $s1
sw $s1, 0($s0)
j L112
L176:
move $sp, $fp
lw $ra, 0($sp)
lw $fp, 4($sp)
addi $sp, $sp, 16
jr $ra
.globl L96
L96:
addi $sp, $sp, -16
sw $ra, 0($sp)
sw $fp, 4($sp)
move $fp, $sp
L179:
sw $a0, -4($fp)
sw $a1, -8($fp)
move $s0, $a2
li $s1, 0
move $s1, $s1
move $a0, $fp
jal L98
move $s2, $v0
move $s0, $s0
li $s2, 0
beq $s0, $s2, L115
j L114
L114:
addi $s0, $s0, 0
move $s0, $s0
move $a0, $fp
lw $s2, -4($fp)
lw $s2, -8($s2)
move $a1, $s2
jal L97
move $s2, $v0
move $s2, $s2
sw $s2, 0($s0)
L117:
move $a0, $fp
lw $s0, -4($fp)
lw $s0, -8($s0)
move $a1, $s0
jal L97
move $s0, $v0
move $s0, $s0
li $s2, 0
bne $s0, $s2, L118
j L116
L116:
move $v0, $s1
j L178
L115:
jal tig_nilerror
move $s2, $v0
j L114
L118:
li $s0, 10
mul $s0, $s1, $s0 
move $s0, $s0
li $s1, 0
move $a0, $s1
lw $s1, -4($fp)
lw $s1, -8($s1)
move $a1, $s1
jal tig_ord
move $s1, $v0
move $s1, $s1
add $s0, $s0, $s1 
move $s0, $s0
li $s1, 0
move $a0, $s1
la $s1, L99
move $a1, $s1
jal tig_ord
move $s1, $v0
move $s1, $s1
sub $s0, $s0, $s1 
move $s1, $s0
lw $s0, -4($fp)
addi $s0, $s0, -8
move $s0, $s0
li $s2, 0
move $a0, $s2
jal tig_getchar
move $s2, $v0
move $s2, $s2
sw $s2, 0($s0)
j L117
L178:
move $sp, $fp
lw $ra, 0($sp)
lw $fp, 4($sp)
addi $sp, $sp, 16
jr $ra
.globl L119
L119:
addi $sp, $sp, -16
sw $ra, 0($sp)
sw $fp, 4($sp)
move $fp, $sp
L181:
sw $a0, -4($fp)
sw $a1, -8($fp)
li $s0, 4
move $a0, $s0
jal tig_allocRecord
move $s0, $v0
move $s0, $s0
li $s1, 0
sw $s1, 0($s0)
move $s0, $s0
lw $s1, -4($fp)
move $a0, $s1
move $a1, $s0
jal L96
move $s1, $v0
move $s1, $s1
move $s0, $s0
li $s2, 0
beq $s0, $s2, L124
j L123
L123:
lw $s0, 0($s0)
li $s2, 0
bne $s0, $s2, L125
j L126
L126:
li $s0, 0
move $s0, $s0
L127:
move $v0, $s0
j L180
L124:
jal tig_nilerror
move $s2, $v0
j L123
L125:
li $s0, 8
move $a0, $s0
jal tig_allocRecord
move $s0, $v0
move $s0, $s0
sw $s1, 0($s0)
addi $s1, $s0, 4
move $s1, $s1
lw $s2, -4($fp)
move $a0, $s2
jal L119
move $s2, $v0
move $s2, $s2
sw $s2, 0($s1)
move $s0, $s0
j L127
L180:
move $sp, $fp
lw $ra, 0($sp)
lw $fp, 4($sp)
addi $sp, $sp, 16
jr $ra
.globl L120
L120:
addi $sp, $sp, -16
sw $ra, 0($sp)
sw $fp, 4($sp)
move $fp, $sp
L183:
sw $a0, -4($fp)
sw $a1, -8($fp)
move $s0, $a2
move $s1, $a3
li $s2, 0
beq $s0, $s2, L150
j L151
L151:
li $s2, 0
beq $s1, $s2, L147
j L148
L148:
move $s0, $s0
li $s2, 0
beq $s0, $s2, L129
j L128
L128:
lw $s2, 0($s0)
move $s2, $s2
move $s1, $s1
li $s3, 0
beq $s1, $s3, L131
j L130
L130:
lw $s3, 0($s1)
blt $s2, $s3, L144
j L145
L145:
li $s2, 8
move $a0, $s2
jal tig_allocRecord
move $s2, $v0
move $s2, $s2
addi $s3, $s2, 0
move $s3, $s3
move $s1, $s1
li $s4, 0
beq $s1, $s4, L139
j L138
L138:
lw $s4, 0($s1)
sw $s4, 0($s3)
addi $s3, $s2, 4
move $s3, $s3
lw $s4, -4($fp)
move $s4, $s4
move $s0, $s0
move $s1, $s1
li $s5, 0
beq $s1, $s5, L141
j L140
L140:
move $a0, $s4
move $a1, $s0
lw $s0, 4($s1)
move $a2, $s0
jal L120
move $s0, $v0
move $s0, $s0
sw $s0, 0($s3)
move $s0, $s2
L146:
move $s0, $s0
L149:
move $s0, $s0
L152:
move $v0, $s0
j L182
L150:
move $s0, $s1
j L152
L147:
move $s0, $s0
j L149
L129:
jal tig_nilerror
move $s2, $v0
j L128
L131:
jal tig_nilerror
move $s3, $v0
j L130
L144:
li $s2, 8
move $a0, $s2
jal tig_allocRecord
move $s2, $v0
move $s2, $s2
addi $s3, $s2, 0
move $s3, $s3
move $s0, $s0
li $s4, 0
beq $s0, $s4, L133
j L132
L132:
lw $s4, 0($s0)
sw $s4, 0($s3)
addi $s3, $s2, 4
move $s3, $s3
lw $s4, -4($fp)
move $s4, $s4
move $s0, $s0
li $s5, 0
beq $s0, $s5, L135
j L134
L134:
move $a0, $s4
lw $s0, 4($s0)
move $a1, $s0
move $a2, $s1
jal L120
move $s0, $v0
move $s0, $s0
sw $s0, 0($s3)
move $s0, $s2
j L146
L133:
jal tig_nilerror
move $s4, $v0
j L132
L135:
jal tig_nilerror
move $s5, $v0
j L134
L139:
jal tig_nilerror
move $s4, $v0
j L138
L141:
jal tig_nilerror
move $s5, $v0
j L140
L182:
move $sp, $fp
lw $ra, 0($sp)
lw $fp, 4($sp)
addi $sp, $sp, 16
jr $ra
.globl L153
L153:
addi $sp, $sp, -16
sw $ra, 0($sp)
sw $fp, 4($sp)
move $fp, $sp
L185:
sw $a0, -4($fp)
sw $a1, -8($fp)
move $s0, $a2
li $s1, 0
bgt $s0, $s1, L154
j L155
L155:
li $s0, 0
move $v0, $s0
j L184
L154:
lw $s1, -4($fp)
move $a0, $s1
li $s1, 10
div $s0, $s1
mflo $s1
move $a1, $s1
jal L153
move $s1, $v0
li $s1, 10
div $s0, $s1
mflo $s1
li $s2, 10
mul $s1, $s1, $s2 
sub $s0, $s0, $s1 
move $s0, $s0
li $s1, 0
move $a0, $s1
la $s1, L99
move $a1, $s1
jal tig_ord
move $s1, $v0
move $s1, $s1
li $s2, 0
move $a0, $s2
add $s0, $s0, $s1 
move $a1, $s0
jal tig_chr
move $s0, $v0
move $s0, $s0
li $s1, 0
move $a0, $s1
move $a1, $s0
jal tig_print
move $s0, $v0
j L155
L184:
move $sp, $fp
lw $ra, 0($sp)
lw $fp, 4($sp)
addi $sp, $sp, 16
jr $ra
.globl L121
L121:
addi $sp, $sp, -16
sw $ra, 0($sp)
sw $fp, 4($sp)
move $fp, $sp
L187:
sw $a0, -4($fp)
sw $a1, -8($fp)
move $s0, $a2
li $s1, 0
blt $s0, $s1, L160
j L161
L161:
li $s1, 0
bgt $s0, $s1, L157
j L158
L158:
li $s0, 0
move $a0, $s0
la $s0, L99
move $a1, $s0
jal tig_print
move $s0, $v0
move $s0, $s0
L159:
move $s0, $s0
L162:
move $v0, $s0
j L186
L160:
li $s1, 0
move $a0, $s1
la $s1, L156
move $a1, $s1
jal tig_print
move $s1, $v0
move $a0, $fp
li $s1, 0
sub $s0, $s1, $s0 
move $a1, $s0
jal L153
move $s0, $v0
move $s0, $s0
j L162
L157:
move $a0, $fp
move $a1, $s0
jal L153
move $s0, $v0
move $s0, $s0
j L159
L186:
move $sp, $fp
lw $ra, 0($sp)
lw $fp, 4($sp)
addi $sp, $sp, 16
jr $ra
.globl L122
L122:
addi $sp, $sp, -16
sw $ra, 0($sp)
sw $fp, 4($sp)
move $fp, $sp
L189:
sw $a0, -4($fp)
sw $a1, -8($fp)
move $s0, $a2
li $s1, 0
beq $s0, $s1, L171
j L172
L172:
lw $s1, -4($fp)
move $s1, $s1
move $s0, $s0
li $s2, 0
beq $s0, $s2, L164
j L163
L163:
move $a0, $s1
lw $s1, 0($s0)
move $a1, $s1
jal L121
move $s1, $v0
li $s1, 0
move $a0, $s1
la $s1, L106
move $a1, $s1
jal tig_print
move $s1, $v0
lw $s1, -4($fp)
move $s1, $s1
move $s0, $s0
li $s2, 0
beq $s0, $s2, L168
j L167
L167:
move $a0, $s1
lw $s0, 4($s0)
move $a1, $s0
jal L122
move $s0, $v0
move $s0, $s0
L173:
move $v0, $s0
j L188
L171:
li $s0, 0
move $a0, $s0
la $s0, L107
move $a1, $s0
jal tig_print
move $s0, $v0
move $s0, $s0
j L173
L164:
jal tig_nilerror
move $s2, $v0
j L163
L168:
jal tig_nilerror
move $s2, $v0
j L167
L188:
move $sp, $fp
lw $ra, 0($sp)
lw $fp, 4($sp)
addi $sp, $sp, 16
jr $ra
.globl tig_main
tig_main:
addi $sp, $sp, -16
sw $ra, 0($sp)
sw $fp, 4($sp)
move $fp, $sp
L191:
sw $a0, -4($fp)
addi $s0, $fp, -8
move $s0, $s0
li $s1, 0
move $a0, $s1
jal tig_getchar
move $s1, $v0
move $s1, $s1
sw $s1, 0($s0)
move $a0, $fp
jal L119
move $s0, $v0
move $s0, $s0
addi $s1, $fp, -8
move $s1, $s1
li $s2, 0
move $a0, $s2
jal tig_getchar
move $s2, $v0
move $s2, $s2
sw $s2, 0($s1)
move $a0, $fp
jal L119
move $s1, $v0
move $s1, $s1
move $s2, $fp
move $a0, $fp
move $a1, $s0
move $a2, $s1
jal L120
move $s0, $v0
move $s0, $s0
move $a0, $s2
move $a1, $s0
jal L122
move $s0, $v0
move $v0, $s0
j L190
L190:
move $sp, $fp
lw $ra, 0($sp)
lw $fp, 4($sp)
addi $sp, $sp, 16
jr $ra
