
.data
L71:
  .word 1
  .ascii "0"
  .space 3
L72:
  .word 1
  .ascii "9"
  .space 3
L78:
  .word 1
  .ascii " "
  .space 3
L79:
  .word 1
  .ascii "
"
  .space 3
L128:
  .word 1
  .ascii "-"
  .space 3

.text
.globl L69
L69:
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
L147:
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
la $s1, L71
move $a0, $s1
jal tig_ord
move $s1, $v0
move $s1, $s1
bge $s0, $s1, L73
j L74
L74:
li $s0, 0
move $s0, $s0
L75:
move $v0, $s0
j L146
L73:
li $s0, 1
move $s0, $s0
lw $s1, 40($fp)
lw $s1, 40($s1)
lw $s1, 44($s1)
move $a0, $s1
jal tig_ord
move $s1, $v0
move $s1, $s1
move $s1, $s1
la $s2, L72
move $a0, $s2
jal tig_ord
move $s2, $v0
move $s2, $s2
ble $s1, $s2, L76
j L77
L77:
li $s0, 0
move $s0, $s0
L76:
move $s0, $s0
j L75
L146:
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
.globl L70
L70:
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
L149:
sw $a0, 40($fp)
sw $a1, 44($fp)
L84:
lw $s0, 40($fp)
lw $s0, 40($s0)
lw $s0, 44($s0)
move $a0, $s0
la $s0, L78
move $a1, $s0
jal tig_stringEqual
move $s0, $v0
move $s0, $s0
li $s1, 0
bne $s0, $s1, L80
j L81
L81:
lw $s0, 40($fp)
lw $s0, 40($s0)
lw $s0, 44($s0)
move $a0, $s0
la $s0, L79
move $a1, $s0
jal tig_stringEqual
move $s0, $v0
move $s0, $s0
L82:
li $s1, 0
bne $s0, $s1, L85
j L83
L83:
li $s0, 0
move $v0, $s0
j L148
L80:
li $s0, 1
move $s0, $s0
j L82
L85:
lw $s0, 40($fp)
lw $s0, 40($s0)
addi $s0, $s0, 44
move $s0, $s0
jal tig_getchar
move $s1, $v0
move $s1, $s1
sw $s1, 0($s0)
j L84
L148:
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
.globl L68
L68:
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
L151:
sw $a0, 40($fp)
sw $a1, 44($fp)
move $s0, $a2
li $s0, 0
move $s0, $s0
move $a0, $fp
jal L70
move $s1, $v0
lw $s1, 44($fp)
move $s1, $s1
li $s2, 0
beq $s1, $s2, L87
j L86
L86:
addi $s1, $s1, 0
move $s1, $s1
move $a0, $fp
lw $s2, 40($fp)
lw $s2, 44($s2)
move $a1, $s2
jal L69
move $s2, $v0
move $s2, $s2
sw $s2, 0($s1)
L89:
move $a0, $fp
lw $s1, 40($fp)
lw $s1, 44($s1)
move $a1, $s1
jal L69
move $s1, $v0
move $s1, $s1
li $s2, 0
bne $s1, $s2, L90
j L88
L88:
move $v0, $s0
j L150
L87:
jal tig_nilerror
move $s2, $v0
j L86
L90:
li $s1, 10
mul $s0, $s0, $s1 
move $s0, $s0
lw $s1, 40($fp)
lw $s1, 44($s1)
move $a0, $s1
jal tig_ord
move $s1, $v0
move $s1, $s1
add $s0, $s0, $s1 
move $s0, $s0
la $s1, L71
move $a0, $s1
jal tig_ord
move $s1, $v0
move $s1, $s1
sub $s0, $s0, $s1 
move $s0, $s0
lw $s1, 40($fp)
addi $s1, $s1, 44
move $s1, $s1
jal tig_getchar
move $s2, $v0
move $s2, $s2
sw $s2, 0($s1)
j L89
L150:
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
.globl L91
L91:
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
L153:
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
jal L68
move $s1, $v0
move $s1, $s1
move $s0, $s0
li $s2, 0
beq $s0, $s2, L96
j L95
L95:
lw $s0, 0($s0)
li $s2, 0
bne $s0, $s2, L97
j L98
L98:
li $s0, 0
move $s0, $s0
L99:
move $v0, $s0
j L152
L96:
jal tig_nilerror
move $s2, $v0
j L95
L97:
li $s0, 8
move $a0, $s0
jal tig_allocRecord
move $s0, $v0
move $s0, $s0
sw $s1, 0($s0)
addi $s1, $s0, 4
move $s1, $s1
lw $s2, 40($fp)
move $a0, $s2
jal L91
move $s2, $v0
move $s2, $s2
sw $s2, 0($s1)
move $s0, $s0
j L99
L152:
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
.globl L92
L92:
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
L155:
sw $a0, 40($fp)
sw $a1, 44($fp)
move $s0, $a2
move $s1, $a3
lw $s1, 44($fp)
li $s2, 0
beq $s1, $s2, L122
j L123
L123:
li $s1, 0
beq $s0, $s1, L119
j L120
L120:
lw $s1, 44($fp)
move $s1, $s1
li $s2, 0
beq $s1, $s2, L101
j L100
L100:
lw $s1, 0($s1)
move $s1, $s1
move $s0, $s0
li $s2, 0
beq $s0, $s2, L103
j L102
L102:
lw $s2, 0($s0)
blt $s1, $s2, L116
j L117
L117:
li $s1, 8
move $a0, $s1
jal tig_allocRecord
move $s1, $v0
move $s1, $s1
addi $s2, $s1, 0
move $s2, $s2
move $s0, $s0
li $s3, 0
beq $s0, $s3, L111
j L110
L110:
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
beq $s0, $s5, L113
j L112
L112:
move $a0, $s3
move $a1, $s4
lw $s0, 4($s0)
move $a2, $s0
jal L92
move $s0, $v0
move $s0, $s0
sw $s0, 0($s2)
move $s0, $s1
L118:
move $s0, $s0
L121:
move $s0, $s0
L124:
move $v0, $s0
j L154
L122:
move $s0, $s0
j L124
L119:
lw $s0, 44($fp)
move $s0, $s0
j L121
L101:
jal tig_nilerror
move $s2, $v0
j L100
L103:
jal tig_nilerror
move $s2, $v0
j L102
L116:
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
beq $s3, $s4, L105
j L104
L104:
lw $s3, 0($s3)
sw $s3, 0($s2)
addi $s2, $s1, 4
move $s2, $s2
lw $s3, 40($fp)
move $s3, $s3
lw $s4, 44($fp)
move $s4, $s4
li $s5, 0
beq $s4, $s5, L107
j L106
L106:
move $a0, $s3
lw $s3, 4($s4)
move $a1, $s3
move $a2, $s0
jal L92
move $s0, $v0
move $s0, $s0
sw $s0, 0($s2)
move $s0, $s1
j L118
L105:
jal tig_nilerror
move $s4, $v0
j L104
L107:
jal tig_nilerror
move $s5, $v0
j L106
L111:
jal tig_nilerror
move $s3, $v0
j L110
L113:
jal tig_nilerror
move $s5, $v0
j L112
L154:
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
.globl L125
L125:
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
L157:
sw $a0, 40($fp)
sw $a1, 44($fp)
move $s0, $a2
lw $s0, 44($fp)
li $s1, 0
bgt $s0, $s1, L126
j L127
L127:
li $s0, 0
move $v0, $s0
j L156
L126:
lw $s0, 40($fp)
move $a0, $s0
lw $s0, 44($fp)
li $s1, 10
div $s0, $s1
mflo $s0
move $a1, $s0
jal L125
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
la $s1, L71
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
j L127
L156:
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
.globl L93
L93:
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
move $s0, $a2
lw $s0, 44($fp)
li $s1, 0
blt $s0, $s1, L132
j L133
L133:
lw $s0, 44($fp)
li $s1, 0
bgt $s0, $s1, L129
j L130
L130:
la $s0, L71
move $a0, $s0
jal tig_print
move $s0, $v0
move $s0, $s0
L131:
move $s0, $s0
L134:
move $v0, $s0
j L158
L132:
la $s0, L128
move $a0, $s0
jal tig_print
move $s0, $v0
move $a0, $fp
li $s0, 0
lw $s1, 44($fp)
sub $s0, $s0, $s1 
move $a1, $s0
jal L125
move $s0, $v0
move $s0, $s0
j L134
L129:
move $a0, $fp
lw $s0, 44($fp)
move $a1, $s0
jal L125
move $s0, $v0
move $s0, $s0
j L131
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
.globl L94
L94:
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
li $s1, 0
beq $s0, $s1, L143
j L144
L144:
lw $s0, 40($fp)
move $s0, $s0
lw $s1, 44($fp)
move $s1, $s1
li $s2, 0
beq $s1, $s2, L136
j L135
L135:
move $a0, $s0
lw $s0, 0($s1)
move $a1, $s0
jal L93
move $s0, $v0
la $s0, L78
move $a0, $s0
jal tig_print
move $s0, $v0
lw $s0, 40($fp)
move $s0, $s0
lw $s1, 44($fp)
move $s1, $s1
li $s2, 0
beq $s1, $s2, L140
j L139
L139:
move $a0, $s0
lw $s0, 4($s1)
move $a1, $s0
jal L94
move $s0, $v0
move $s0, $s0
L145:
move $v0, $s0
j L160
L143:
la $s0, L79
move $a0, $s0
jal tig_print
move $s0, $v0
move $s0, $s0
j L145
L136:
jal tig_nilerror
move $s2, $v0
j L135
L140:
jal tig_nilerror
move $s2, $v0
j L139
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
L163:
sw $a0, 40($fp)
addi $s0, $fp, 44
move $s0, $s0
jal tig_getchar
move $s1, $v0
move $s1, $s1
sw $s1, 0($s0)
move $a0, $fp
jal L91
move $s0, $v0
move $s0, $s0
addi $s1, $fp, 44
move $s1, $s1
jal tig_getchar
move $s2, $v0
move $s2, $s2
sw $s2, 0($s1)
move $a0, $fp
jal L91
move $s1, $v0
move $s1, $s1
move $s2, $fp
move $a0, $fp
move $a1, $s0
move $a2, $s1
jal L92
move $s0, $v0
move $s0, $s0
move $a0, $s2
move $a1, $s0
jal L94
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
addi $sp, $sp, 48
jr $ra
