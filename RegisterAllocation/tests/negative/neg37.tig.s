
.data
L171:
  .word 5
  .ascii "hello"
  .space 3
L173:
  .word 18
  .ascii "shadowing is legal"
  .space 2
L188:
  .word 6
  .ascii "Senior"
  .space 2
L189:
  .word 6
  .ascii "Junior"
  .space 2

.text
.globl L163
L163:
addi $sp, $sp, -92
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
L197:
sw $a0, -44($fp)
sw $a1, -48($fp)
move $s0, $a2
lw $s0, -48($fp)
li $s1, 0
beq $s0, $s1, L165
j L166
L166:
lw $s0, -44($fp)
move $a0, $s0
lw $s0, -48($fp)
addi $s0, $s0, -1
move $a1, $s0
jal L164
move $s0, $v0
move $s0, $s0
L167:
move $v0, $s0
j L196
L165:
li $s0, 1
move $s0, $s0
j L167
L196:
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
addi $sp, $sp, 92
jr $ra
.globl L164
L164:
addi $sp, $sp, -92
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
L199:
sw $a0, -44($fp)
sw $a1, -48($fp)
move $s0, $a2
lw $s0, -48($fp)
li $s1, 0
beq $s0, $s1, L168
j L169
L169:
lw $s0, -44($fp)
move $a0, $s0
lw $s0, -48($fp)
addi $s0, $s0, -1
move $a1, $s0
jal L163
move $s0, $v0
move $s0, $s0
L170:
move $v0, $s0
j L198
L168:
li $s0, 0
move $s0, $s0
j L170
L198:
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
addi $sp, $sp, 92
jr $ra
.globl tig_main
tig_main:
addi $sp, $sp, -88
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
L201:
sw $a0, -44($fp)
li $s0, 8
move $a0, $s0
jal tig_allocRecord
move $s0, $v0
move $s0, $s0
la $s1, L171
sw $s1, 0($s0)
li $s1, 1
sw $s1, 4($s0)
move $s0, $s0
li $s1, 10
move $a0, $s1
li $s1, 0
move $a1, $s1
jal tig_initArray
move $s1, $v0
move $s1, $s1
li $s2, 5
move $s2, $s2
li $s3, 0
move $s3, $s3
li $s4, 10
move $s4, $s4
ble $s3, $s4, L175
j L172
L172:
L180:
li $s3, 0
bgt $s2, $s3, L181
j L177
L177:
move $s0, $s0
li $s3, 0
beq $s0, $s3, L183
j L182
L182:
addi $s3, $s0, 4
move $s3, $s3
move $s1, $s1
li $s4, 0
beq $s1, $s4, L185
j L184
L184:
li $s4, 0
li $s5, 4
mul $s4, $s4, $s5 
add $s1, $s1, $s4 
lw $s1, 0($s1)
add $s1, $s1, $s2 
sw $s1, 0($s3)
move $s0, $s0
li $s1, 0
beq $s0, $s1, L187
j L186
L186:
lw $s0, 4($s0)
li $s1, 20
bgt $s0, $s1, L190
j L191
L191:
la $s0, L189
move $a0, $s0
jal tig_print
move $s0, $v0
move $s0, $s0
L192:
li $s0, 0
move $s0, $s0
li $s1, 0
beq $s0, $s1, L193
j L194
L194:
li $s0, 0
move $s2, $s0
li $s0, 0
move $s0, $s0
L195:
move $a0, $fp
move $a1, $s2
jal L163
move $s0, $v0
move $v0, $s0
j L200
L175:
la $s5, L173
move $s5, $s5
move $a0, $s5
jal tig_print
move $s5, $v0
bge $s3, $s4, L172
j L176
L176:
addi $s3, $s3, 1
move $s3, $s3
j L175
L181:
li $s3, 2
beq $s2, $s3, L178
j L179
L179:
addi $s2, $s2, -1
move $s2, $s2
j L180
L178:
j L177
L183:
jal tig_nilerror
move $s3, $v0
j L182
L185:
jal tig_nilerror
move $s4, $v0
j L184
L187:
jal tig_nilerror
move $s1, $v0
j L186
L190:
la $s0, L188
move $a0, $s0
jal tig_print
move $s0, $v0
move $s0, $s0
j L192
L193:
li $s0, 1
move $s2, $s0
li $s0, 0
move $s0, $s0
j L195
L200:
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
addi $sp, $sp, 88
jr $ra
