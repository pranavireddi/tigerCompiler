
.data
L187:
  .word 5
  .ascii "aname"
  .space 3
L188:
  .word 9
  .ascii "somewhere"
  .space 3
L189:
  .word 0
  .ascii ""
L190:
  .word 7
  .ascii "Kapoios"
  .space 1
L191:
  .word 5
  .ascii "Kapou"
  .space 3
L192:
  .word 5
  .ascii "Allos"
  .space 3
L201:
  .word 4
  .ascii "kati"
L208:
  .word 3
  .ascii "sfd"
  .space 1
L211:
  .word 3
  .ascii "sdf"
  .space 1

.text
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
L221:
sw $a0, -44($fp)
li $s0, 10
move $a0, $s0
li $s0, 0
move $a1, $s0
jal tig_initArray
move $s0, $v0
move $s0, $s0
li $s1, 16
move $a0, $s1
jal tig_allocRecord
move $s1, $v0
move $s1, $s1
la $s2, L187
sw $s2, 0($s1)
la $s2, L188
sw $s2, 4($s1)
li $s2, 0
sw $s2, 8($s1)
li $s2, 0
sw $s2, 12($s1)
li $s2, 5
move $a0, $s2
move $a1, $s1
jal tig_initArray
move $s1, $v0
move $s1, $s1
li $s2, 100
move $a0, $s2
la $s2, L189
move $a1, $s2
jal tig_initArray
move $s2, $v0
move $s2, $s2
li $s3, 16
move $a0, $s3
jal tig_allocRecord
move $s3, $v0
move $s3, $s3
la $s4, L190
sw $s4, 0($s3)
la $s4, L191
sw $s4, 4($s3)
li $s4, 2432
sw $s4, 8($s3)
li $s4, 44
sw $s4, 12($s3)
move $s3, $s3
li $s4, 8
move $a0, $s4
jal tig_allocRecord
move $s4, $v0
move $s4, $s4
la $s5, L192
sw $s5, 0($s4)
addi $s5, $s4, 4
move $s5, $s5
li $s6, 3
move $a0, $s6
li $s6, 1900
move $a1, $s6
jal tig_initArray
move $s6, $v0
move $s6, $s6
sw $s6, 0($s5)
move $s4, $s4
move $s0, $s0
li $s5, 0
beq $s0, $s5, L194
j L193
L193:
li $s5, 1
li $s6, 0
li $s7, 4
mul $s6, $s6, $s7 
add $s6, $s0, $s6 
sw $s5, 0($s6)
move $s0, $s0
li $s5, 0
beq $s0, $s5, L196
j L195
L195:
li $s5, 3
li $s6, 9
li $s7, 4
mul $s6, $s6, $s7 
add $s0, $s0, $s6 
sw $s5, 0($s0)
move $s0, $s1
li $s5, 0
beq $s0, $s5, L198
j L197
L197:
li $s5, 3
li $s6, 4
mul $s5, $s5, $s6 
add $s0, $s0, $s5 
lw $s0, 0($s0)
move $s0, $s0
li $s5, 0
beq $s0, $s5, L200
j L199
L199:
la $s5, L201
sw $s5, 0($s0)
move $s0, $s1
li $s1, 0
beq $s0, $s1, L203
j L202
L202:
li $s1, 1
li $s5, 4
mul $s1, $s1, $s5 
add $s0, $s0, $s1 
lw $s0, 0($s0)
move $s0, $s0
li $s1, 0
beq $s0, $s1, L205
j L204
L204:
li $s1, 23
sw $s1, 12($s0)
move $s0, $s2
li $s1, 0
beq $s0, $s1, L207
j L206
L206:
la $s1, L208
li $s2, 34
li $s5, 4
mul $s2, $s2, $s5 
add $s0, $s0, $s2 
sw $s1, 0($s0)
move $s0, $s3
li $s1, 0
beq $s0, $s1, L210
j L209
L209:
la $s1, L211
sw $s1, 0($s0)
move $s0, $s4
li $s1, 0
beq $s0, $s1, L213
j L212
L212:
lw $s0, 4($s0)
move $s0, $s0
li $s1, 0
beq $s0, $s1, L215
j L214
L214:
li $s1, 2323
li $s2, 0
li $s3, 4
mul $s2, $s2, $s3 
add $s0, $s0, $s2 
sw $s1, 0($s0)
move $s0, $s4
li $s1, 0
beq $s0, $s1, L217
j L216
L216:
lw $s0, 4($s0)
move $s0, $s0
li $s1, 0
beq $s0, $s1, L219
j L218
L218:
li $s1, 2323
li $s2, 2
li $s3, 4
mul $s2, $s2, $s3 
add $s0, $s0, $s2 
sw $s1, 0($s0)
li $s0, 0
move $v0, $s0
j L220
L194:
jal tig_nilerror
move $s5, $v0
j L193
L196:
jal tig_nilerror
move $s5, $v0
j L195
L198:
jal tig_nilerror
move $s5, $v0
j L197
L200:
jal tig_nilerror
move $s5, $v0
j L199
L203:
jal tig_nilerror
move $s1, $v0
j L202
L205:
jal tig_nilerror
move $s1, $v0
j L204
L207:
jal tig_nilerror
move $s1, $v0
j L206
L210:
jal tig_nilerror
move $s1, $v0
j L209
L213:
jal tig_nilerror
move $s1, $v0
j L212
L215:
jal tig_nilerror
move $s1, $v0
j L214
L217:
jal tig_nilerror
move $s1, $v0
j L216
L219:
jal tig_nilerror
move $s1, $v0
j L218
L220:
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
