
.data
L236:
  .word 4
  .ascii "fail"

.text
.globl L214
L214:
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
L244:
sw $a0, -44($fp)
sw $a1, -48($fp)
li $s0, 0
move $v0, $s0
j L243
L243:
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
.globl L240
L240:
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
L246:
sw $a0, -44($fp)
sw $a1, -48($fp)
li $s0, 0
move $v0, $s0
j L245
L245:
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
L248:
sw $a0, -44($fp)
li $s0, 0
move $s0, $s0
L205:
L206:
li $s1, 10
bgt $s0, $s1, L203
j L204
L204:
addi $s0, $s0, 1
move $s0, $s0
j L205
L203:
L202:
li $s1, 0
move $s1, $s1
li $s2, 10
move $s2, $s2
ble $s1, $s2, L211
j L207
L207:
li $s1, 0
move $s1, $s1
li $s2, 10
move $s2, $s2
ble $s1, $s2, L216
j L213
L213:
L227:
L228:
li $s1, 0
move $s1, $s1
li $s2, 10
move $s2, $s2
ble $s1, $s2, L223
j L219
L219:
li $s1, 100
bgt $s0, $s1, L225
j L226
L226:
j L227
L211:
li $s3, 5
beq $s1, $s3, L208
j L209
L209:
bge $s1, $s2, L207
j L212
L212:
addi $s1, $s1, 1
move $s1, $s1
j L211
L208:
j L207
L216:
move $a0, $fp
jal L214
move $s3, $v0
bge $s1, $s2, L213
j L217
L217:
addi $s1, $s1, 1
move $s1, $s1
j L216
L223:
li $s3, 5
beq $s1, $s3, L220
j L221
L221:
addi $s0, $s0, 1
move $s0, $s0
bge $s1, $s2, L219
j L224
L224:
addi $s1, $s1, 1
move $s1, $s1
j L223
L220:
j L219
L225:
L218:
li $s1, 0
move $s1, $s1
li $s2, 10
move $s2, $s2
ble $s1, $s2, L233
j L229
L229:
L237:
L238:
L235:
L241:
L242:
move $a0, $fp
jal L240
move $s0, $v0
j L241
L233:
li $s3, 0
move $s3, $s3
li $s4, 0
beq $s3, $s4, L230
j L231
L231:
bge $s1, $s2, L229
j L234
L234:
addi $s1, $s1, 1
move $s1, $s1
j L233
L230:
addi $s0, $s0, 1
move $s0, $s0
j L229
L249:
li $s0, 5
move $s0, $s0
la $s0, L236
move $a0, $s0
jal tig_print
move $s0, $v0
j L237
L239:
li $s0, 0
move $v0, $s0
j L247
L247:
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
