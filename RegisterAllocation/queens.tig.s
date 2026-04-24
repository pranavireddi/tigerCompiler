
.data
L3145:
  .word 2
  .ascii " O"
  .space 2
L3146:
  .word 2
  .ascii " ."
  .space 2
L3158:
  .word 1
  .ascii "
"
  .space 3

.text
.globl L3139
L3139:
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
L3202:
sw $a0, 40($fp)
sw $a1, 44($fp)
li $s0, 0
move $s0, $s0
lw $s1, 40($fp)
lw $s1, 44($s1)
addi $s1, $s1, -1
move $s1, $s1
ble $s0, $s1, L3160
j L3141
L3141:
la $s0, L3158
move $a0, $s0
jal tig_print
move $s0, $v0
move $v0, $s0
j L3201
L3160:
li $s2, 0
move $s2, $s2
lw $s3, 40($fp)
lw $s3, 44($s3)
addi $s3, $s3, -1
move $s3, $s3
ble $s2, $s3, L3156
j L3142
L3142:
la $s2, L3158
move $a0, $s2
jal tig_print
move $s2, $v0
bge $s0, $s1, L3141
j L3161
L3161:
addi $s0, $s0, 1
move $s0, $s0
j L3160
L3156:
lw $s4, 40($fp)
lw $s4, 52($s4)
move $s4, $s4
li $s5, 0
beq $s4, $s5, L3144
j L3143
L3143:
li $s5, 4
mul $s5, $s0, $s5 
addi $s5, $s5, 4
add $s4, $s4, $s5 
lw $s4, 0($s4)
beq $s4, $s2, L3147
j L3148
L3148:
la $s4, L3146
move $s4, $s4
L3149:
move $a0, $s4
jal tig_print
move $s4, $v0
bge $s2, $s3, L3142
j L3157
L3157:
addi $s2, $s2, 1
move $s2, $s2
j L3156
L3144:
jal tig_nilerror
move $s5, $v0
j L3143
L3147:
la $s4, L3145
move $s4, $s4
j L3149
L3201:
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
.globl L3140
L3140:
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
L3204:
sw $a0, 40($fp)
sw $a1, 44($fp)
move $s0, $a2
lw $s0, 44($fp)
lw $s1, 40($fp)
lw $s1, 44($s1)
beq $s0, $s1, L3198
j L3199
L3199:
li $s0, 0
move $s0, $s0
lw $s1, 40($fp)
lw $s1, 44($s1)
addi $s1, $s1, -1
move $s1, $s1
ble $s0, $s1, L3196
j L3162
L3162:
li $s0, 0
move $s0, $s0
L3200:
move $v0, $s0
j L3203
L3198:
lw $s0, 40($fp)
move $a0, $s0
jal L3139
move $s0, $v0
move $s0, $s0
j L3200
L3196:
lw $s2, 40($fp)
lw $s2, 48($s2)
move $s2, $s2
li $s3, 0
beq $s2, $s3, L3164
j L3163
L3163:
li $s3, 4
mul $s3, $s0, $s3 
addi $s3, $s3, 4
add $s2, $s2, $s3 
lw $s2, 0($s2)
li $s3, 0
beq $s2, $s3, L3167
j L3168
L3168:
li $s2, 0
move $s2, $s2
L3169:
li $s3, 0
bne $s2, $s3, L3174
j L3175
L3175:
li $s2, 0
move $s2, $s2
L3176:
li $s3, 0
bne $s2, $s3, L3193
j L3194
L3194:
bge $s0, $s1, L3162
j L3197
L3197:
addi $s0, $s0, 1
move $s0, $s0
j L3196
L3164:
jal tig_nilerror
move $s3, $v0
j L3163
L3167:
li $s2, 1
move $s2, $s2
lw $s3, 40($fp)
lw $s3, 56($s3)
move $s3, $s3
li $s4, 0
beq $s3, $s4, L3166
j L3165
L3165:
lw $s4, 44($fp)
add $s4, $s0, $s4 
li $s5, 4
mul $s4, $s4, $s5 
addi $s4, $s4, 4
add $s3, $s3, $s4 
lw $s3, 0($s3)
li $s4, 0
beq $s3, $s4, L3170
j L3171
L3171:
li $s2, 0
move $s2, $s2
L3170:
move $s2, $s2
j L3169
L3166:
jal tig_nilerror
move $s4, $v0
j L3165
L3174:
li $s2, 1
move $s2, $s2
lw $s3, 40($fp)
lw $s3, 60($s3)
move $s3, $s3
li $s4, 0
beq $s3, $s4, L3173
j L3172
L3172:
addi $s4, $s0, 7
lw $s5, 44($fp)
sub $s4, $s4, $s5 
li $s5, 4
mul $s4, $s4, $s5 
addi $s4, $s4, 4
add $s3, $s3, $s4 
lw $s3, 0($s3)
li $s4, 0
beq $s3, $s4, L3177
j L3178
L3178:
li $s2, 0
move $s2, $s2
L3177:
move $s2, $s2
j L3176
L3173:
jal tig_nilerror
move $s4, $v0
j L3172
L3193:
lw $s2, 40($fp)
lw $s2, 48($s2)
move $s2, $s2
li $s3, 0
beq $s2, $s3, L3180
j L3179
L3179:
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
beq $s2, $s3, L3182
j L3181
L3181:
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
beq $s2, $s3, L3184
j L3183
L3183:
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
beq $s2, $s3, L3186
j L3185
L3185:
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
jal L3140
move $s2, $v0
lw $s2, 40($fp)
lw $s2, 48($s2)
move $s2, $s2
li $s3, 0
beq $s2, $s3, L3188
j L3187
L3187:
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
beq $s2, $s3, L3190
j L3189
L3189:
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
beq $s2, $s3, L3192
j L3191
L3191:
li $s3, 0
addi $s4, $s0, 7
lw $s5, 44($fp)
sub $s4, $s4, $s5 
li $s5, 4
mul $s4, $s4, $s5 
addi $s4, $s4, 4
add $s2, $s2, $s4 
sw $s3, 0($s2)
j L3194
L3180:
jal tig_nilerror
move $s3, $v0
j L3179
L3182:
jal tig_nilerror
move $s3, $v0
j L3181
L3184:
jal tig_nilerror
move $s3, $v0
j L3183
L3186:
jal tig_nilerror
move $s3, $v0
j L3185
L3188:
jal tig_nilerror
move $s3, $v0
j L3187
L3190:
jal tig_nilerror
move $s3, $v0
j L3189
L3192:
jal tig_nilerror
move $s3, $v0
j L3191
L3203:
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
L3206:
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
jal L3140
move $s0, $v0
move $v0, $s0
j L3205
L3205:
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
