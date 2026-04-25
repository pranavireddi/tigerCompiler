
.data
L86:
  .word 1
  .ascii "0"
  .space 3
L87:
  .word 1
  .ascii "9"
  .space 3
L93:
  .word 1
  .ascii " "
  .space 3
L94:
  .word 1
  .ascii "
"
  .space 3
L143:
  .word 1
  .ascii "-"
  .space 3

.text
.globl L84
L84:
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
L162:
sw $a0, 40($fp)
sw $a1, 44($fp)
move $s0, $a2
lw $s0, 40($fp)
lw $s0, 40($s0)
lw $s0, 44($s0)
move $a0, $s0
jal tig_ord
move $s0, $v0
move $s0, $s0
move $s0, $s0
la $s1, L86
move $a0, $s1
jal tig_ord
move $s1, $v0
move $s1, $s1
bge $s0, $s1, L88
j L89
L89:
li $s0, 0
move $s0, $s0
L90:
move $v0, $s0
j L161
L88:
li $s0, 1
move $s1, $s0
lw $s0, 40($fp)
lw $s0, 40($s0)
lw $s0, 44($s0)
move $a0, $s0
jal tig_ord
move $s0, $v0
move $s0, $s0
move $s2, $s0
la $s0, L87
move $a0, $s0
jal tig_ord
move $s0, $v0
move $s0, $s0
ble $s2, $s0, L91
j L92
L92:
li $s0, 0
move $s1, $s0
L91:
move $s0, $s1
j L90
L161:
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
.globl L85
L85:
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
L164:
sw $a0, 40($fp)
sw $a1, 44($fp)
L99:
lw $s0, 40($fp)
lw $s0, 40($s0)
lw $s0, 44($s0)
move $a0, $s0
la $s0, L93
move $a1, $s0
jal tig_stringEqual
move $s0, $v0
move $s0, $s0
li $s1, 0
bne $s0, $s1, L95
j L96
L96:
lw $s0, 40($fp)
lw $s0, 40($s0)
lw $s0, 44($s0)
move $a0, $s0
la $s0, L94
move $a1, $s0
jal tig_stringEqual
move $s0, $v0
move $s0, $s0
L97:
li $s1, 0
bne $s0, $s1, L100
j L98
L98:
li $s0, 0
move $v0, $s0
j L163
L95:
li $s0, 1
move $s0, $s0
j L97
L100:
lw $s0, 40($fp)
lw $s0, 40($s0)
addi $s0, $s0, 44
move $s1, $s0
jal tig_getchar
move $s0, $v0
move $s0, $s0
sw $s0, 0($s1)
j L99
L163:
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
.globl L83
L83:
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
L166:
sw $a0, 40($fp)
sw $a1, 44($fp)
move $s0, $a2
li $s0, 0
move $s1, $s0
move $a0, $fp
jal L85
move $s0, $v0
lw $s0, 44($fp)
move $s0, $s0
li $s2, 0
beq $s0, $s2, L102
j L101
L101:
addi $s0, $s0, 0
move $s0, $s0
move $a0, $fp
lw $s2, 40($fp)
lw $s2, 44($s2)
move $a1, $s2
jal L84
move $s2, $v0
move $s2, $s2
sw $s2, 0($s0)
L104:
move $a0, $fp
lw $s0, 40($fp)
lw $s0, 44($s0)
move $a1, $s0
jal L84
move $s0, $v0
move $s0, $s0
li $s2, 0
bne $s0, $s2, L105
j L103
L103:
move $v0, $s1
j L165
L102:
jal tig_nilerror
move $s2, $v0
j L101
L105:
li $s0, 10
mul $s0, $s1, $s0 
move $s0, $s0
lw $s1, 40($fp)
lw $s1, 44($s1)
move $a0, $s1
jal tig_ord
move $s1, $v0
move $s1, $s1
add $s0, $s0, $s1 
move $s0, $s0
la $s1, L86
move $a0, $s1
jal tig_ord
move $s1, $v0
move $s1, $s1
sub $s0, $s0, $s1 
move $s1, $s0
lw $s0, 40($fp)
addi $s0, $s0, 44
move $s2, $s0
jal tig_getchar
move $s0, $v0
move $s0, $s0
sw $s0, 0($s2)
j L104
L165:
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
.globl L106
L106:
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
L168:
sw $a0, 40($fp)
sw $a1, 44($fp)
li $s0, 4
move $a0, $s0
jal tig_allocRecord
move $s0, $v0
move $s0, $s0
li $s1, 0
sw $s1, 0($s0)
move $s0, $s0
lw $s1, 40($fp)
move $a0, $s1
move $a1, $s0
jal L83
move $s1, $v0
move $s1, $s1
move $s0, $s0
li $s2, 0
beq $s0, $s2, L111
j L110
L110:
lw $s0, 0($s0)
li $s2, 0
bne $s0, $s2, L112
j L113
L113:
li $s0, 0
move $s0, $s0
L114:
move $v0, $s0
j L167
L111:
jal tig_nilerror
move $s2, $v0
j L110
L112:
li $s0, 8
move $a0, $s0
jal tig_allocRecord
move $s0, $v0
move $s2, $s0
sw $s1, 0($s2)
addi $s0, $s2, 4
move $s1, $s0
lw $s0, 40($fp)
move $a0, $s0
jal L106
move $s0, $v0
move $s0, $s0
sw $s0, 0($s1)
move $s0, $s2
j L114
L167:
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
.globl L107
L107:
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
L170:
sw $a0, 40($fp)
sw $a1, 44($fp)
move $s0, $a2
move $s1, $a3
lw $s1, 44($fp)
li $s2, 0
beq $s1, $s2, L137
j L138
L138:
li $s1, 0
beq $s0, $s1, L134
j L135
L135:
lw $s1, 44($fp)
move $s1, $s1
li $s2, 0
beq $s1, $s2, L116
j L115
L115:
lw $s1, 0($s1)
move $s1, $s1
move $s0, $s0
li $s2, 0
beq $s0, $s2, L118
j L117
L117:
lw $s2, 0($s0)
blt $s1, $s2, L131
j L132
L132:
li $s1, 8
move $a0, $s1
jal tig_allocRecord
move $s1, $v0
move $s1, $s1
addi $s2, $s1, 0
move $s2, $s2
move $s0, $s0
li $s3, 0
beq $s0, $s3, L126
j L125
L125:
lw $s3, 0($s0)
sw $s3, 0($s2)
addi $s2, $s1, 4
move $s2, $s2
lw $s3, 40($fp)
move $s3, $s3
lw $s4, 44($fp)
move $s4, $s4
move $s0, $s0
li $s5, 0
beq $s0, $s5, L128
j L127
L127:
move $a0, $s3
move $a1, $s4
lw $s0, 4($s0)
move $a2, $s0
jal L107
move $s0, $v0
move $s0, $s0
sw $s0, 0($s2)
move $s0, $s1
L133:
move $s0, $s0
L136:
move $s0, $s0
L139:
move $v0, $s0
j L169
L137:
move $s0, $s0
j L139
L134:
lw $s0, 44($fp)
move $s0, $s0
j L136
L116:
jal tig_nilerror
move $s2, $v0
j L115
L118:
jal tig_nilerror
move $s2, $v0
j L117
L131:
li $s1, 8
move $a0, $s1
jal tig_allocRecord
move $s1, $v0
move $s1, $s1
addi $s2, $s1, 0
move $s2, $s2
lw $s3, 44($fp)
move $s3, $s3
li $s4, 0
beq $s3, $s4, L120
j L119
L119:
lw $s3, 0($s3)
sw $s3, 0($s2)
addi $s2, $s1, 4
move $s2, $s2
lw $s3, 40($fp)
move $s3, $s3
lw $s4, 44($fp)
move $s4, $s4
li $s5, 0
beq $s4, $s5, L122
j L121
L121:
move $a0, $s3
lw $s3, 4($s4)
move $a1, $s3
move $a2, $s0
jal L107
move $s0, $v0
move $s0, $s0
sw $s0, 0($s2)
move $s0, $s1
j L133
L120:
jal tig_nilerror
move $s4, $v0
j L119
L122:
jal tig_nilerror
move $s5, $v0
j L121
L126:
jal tig_nilerror
move $s3, $v0
j L125
L128:
jal tig_nilerror
move $s5, $v0
j L127
L169:
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
.globl L140
L140:
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
L172:
sw $a0, 40($fp)
sw $a1, 44($fp)
move $s0, $a2
lw $s0, 44($fp)
li $s1, 0
bgt $s0, $s1, L141
j L142
L142:
li $s0, 0
move $v0, $s0
j L171
L141:
lw $s0, 40($fp)
move $a0, $s0
lw $s0, 44($fp)
li $s1, 10
div $s0, $s1
mflo $s0
move $a1, $s0
jal L140
move $s0, $v0
lw $s0, 44($fp)
lw $s1, 44($fp)
li $s2, 10
div $s1, $s2
mflo $s1
li $s2, 10
mul $s1, $s1, $s2 
sub $s0, $s0, $s1 
move $s0, $s0
la $s1, L86
move $a0, $s1
jal tig_ord
move $s1, $v0
move $s1, $s1
add $s0, $s0, $s1 
move $a0, $s0
jal tig_chr
move $s0, $v0
move $s0, $s0
move $a0, $s0
jal tig_print
move $s0, $v0
j L142
L171:
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
.globl L108
L108:
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
L174:
sw $a0, 40($fp)
sw $a1, 44($fp)
move $s0, $a2
lw $s0, 44($fp)
li $s1, 0
blt $s0, $s1, L147
j L148
L148:
lw $s0, 44($fp)
li $s1, 0
bgt $s0, $s1, L144
j L145
L145:
la $s0, L86
move $a0, $s0
jal tig_print
move $s0, $v0
move $s0, $s0
L146:
move $s0, $s0
L149:
move $v0, $s0
j L173
L147:
la $s0, L143
move $a0, $s0
jal tig_print
move $s0, $v0
move $a0, $fp
li $s0, 0
lw $s1, 44($fp)
sub $s0, $s0, $s1 
move $a1, $s0
jal L140
move $s0, $v0
move $s0, $s0
j L149
L144:
move $a0, $fp
lw $s0, 44($fp)
move $a1, $s0
jal L140
move $s0, $v0
move $s0, $s0
j L146
L173:
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
.globl L109
L109:
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
L176:
sw $a0, 40($fp)
sw $a1, 44($fp)
move $s0, $a2
lw $s0, 44($fp)
li $s1, 0
beq $s0, $s1, L158
j L159
L159:
lw $s0, 40($fp)
move $s0, $s0
lw $s1, 44($fp)
move $s1, $s1
li $s2, 0
beq $s1, $s2, L151
j L150
L150:
move $a0, $s0
lw $s0, 0($s1)
move $a1, $s0
jal L108
move $s0, $v0
la $s0, L93
move $a0, $s0
jal tig_print
move $s0, $v0
lw $s0, 40($fp)
move $s0, $s0
lw $s1, 44($fp)
move $s1, $s1
li $s2, 0
beq $s1, $s2, L155
j L154
L154:
move $a0, $s0
lw $s0, 4($s1)
move $a1, $s0
jal L109
move $s0, $v0
move $s0, $s0
L160:
move $v0, $s0
j L175
L158:
la $s0, L94
move $a0, $s0
jal tig_print
move $s0, $v0
move $s0, $s0
j L160
L151:
jal tig_nilerror
move $s2, $v0
j L150
L155:
jal tig_nilerror
move $s2, $v0
j L154
L175:
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
L178:
sw $a0, 40($fp)
addi $s0, $fp, 44
move $s0, $s0
jal tig_getchar
move $s1, $v0
move $s1, $s1
sw $s1, 0($s0)
move $a0, $fp
jal L106
move $s0, $v0
move $s0, $s0
addi $s1, $fp, 44
move $s1, $s1
jal tig_getchar
move $s2, $v0
move $s2, $s2
sw $s2, 0($s1)
move $a0, $fp
jal L106
move $s1, $v0
move $s1, $s1
move $s2, $fp
move $a0, $fp
move $a1, $s0
move $a2, $s1
jal L107
move $s0, $v0
move $s0, $s0
move $a0, $s2
move $a1, $s0
jal L109
move $s0, $v0
move $v0, $s0
j L177
L177:
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
