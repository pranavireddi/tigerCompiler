
.data
<<<<<<< HEAD
<<<<<<< Updated upstream
L1029:
  .word 2
  .ascii " O"
  .space 2
L1030:
  .word 2
  .ascii " ."
  .space 2
L1042:
=======
L69:
  .word 2
  .ascii " O"
  .space 2
L70:
  .word 2
  .ascii " ."
  .space 2
L82:
>>>>>>> Stashed changes
=======
L102:
  .word 2
  .ascii " O"
  .space 2
L103:
  .word 2
  .ascii " ."
  .space 2
L115:
>>>>>>> 5abefe5b1d1eb5aedcc2a1d895f5c667aa71ed28
  .word 1
  .ascii "
"
  .space 3

.text
<<<<<<< HEAD
<<<<<<< Updated upstream
.globl L1023
L1023:
addi $sp, $sp, -92
=======
.globl L63
L63:
addi $sp, $sp, -48
>>>>>>> Stashed changes
=======
.globl L96
L96:
addi $sp, $sp, -48
>>>>>>> 5abefe5b1d1eb5aedcc2a1d895f5c667aa71ed28
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
<<<<<<< HEAD
<<<<<<< Updated upstream
L1086:
sw $a0, -44($fp)
sw $a1, -48($fp)
=======
L126:
sw $a0, 40($fp)
sw $a1, 44($fp)
>>>>>>> Stashed changes
li $s0, 0
move $s0, $s0
lw $s1, -44($fp)
lw $s1, -52($s1)
addi $s1, $s1, -1
move $s1, $s1
<<<<<<< Updated upstream
ble $s0, $s1, L1044
j L1025
L1025:
la $s0, L1042
=======
ble $s0, $s1, L84
j L65
L65:
la $s0, L82
>>>>>>> Stashed changes
=======
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
>>>>>>> 5abefe5b1d1eb5aedcc2a1d895f5c667aa71ed28
move $a0, $s0
jal tig_print
move $s0, $v0
move $v0, $s0
<<<<<<< HEAD
<<<<<<< Updated upstream
j L1085
L1044:
=======
j L125
L84:
>>>>>>> Stashed changes
li $s2, 0
move $s2, $s2
lw $s3, -44($fp)
lw $s3, -52($s3)
addi $s3, $s3, -1
move $s3, $s3
<<<<<<< Updated upstream
ble $s2, $s3, L1040
j L1026
L1026:
la $s2, L1042
move $a0, $s2
jal tig_print
move $s2, $v0
bge $s0, $s1, L1025
j L1045
L1045:
addi $s0, $s0, 1
move $s0, $s0
j L1044
L1040:
lw $s4, -44($fp)
lw $s4, -60($s4)
move $s4, $s4
li $s5, 0
beq $s4, $s5, L1028
j L1027
L1027:
=======
ble $s2, $s3, L80
j L66
L66:
la $s2, L82
move $a0, $s2
jal tig_print
move $s2, $v0
bge $s0, $s1, L65
j L85
L85:
addi $s0, $s0, 1
move $s0, $s0
j L84
L80:
=======
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
>>>>>>> 5abefe5b1d1eb5aedcc2a1d895f5c667aa71ed28
lw $s4, 40($fp)
lw $s4, 52($s4)
move $s4, $s4
li $s5, 0
<<<<<<< HEAD
beq $s4, $s5, L68
j L67
L67:
>>>>>>> Stashed changes
li $s5, 4
mul $s5, $s0, $s5 
add $s4, $s4, $s5 
lw $s4, 0($s4)
<<<<<<< Updated upstream
beq $s4, $s2, L1031
j L1032
L1032:
la $s4, L1030
move $s4, $s4
L1033:
move $a0, $s4
jal tig_print
move $s4, $v0
bge $s2, $s3, L1026
j L1041
L1041:
addi $s2, $s2, 1
move $s2, $s2
j L1040
L1028:
jal tig_nilerror
move $s5, $v0
j L1027
L1031:
la $s4, L1029
move $s4, $s4
j L1033
L1085:
=======
beq $s4, $s2, L71
j L72
L72:
la $s4, L70
move $s4, $s4
L73:
move $a0, $s4
jal tig_print
move $s4, $v0
bge $s2, $s3, L66
j L81
L81:
addi $s2, $s2, 1
move $s2, $s2
j L80
L68:
jal tig_nilerror
move $s5, $v0
j L67
L71:
la $s4, L69
move $s4, $s4
j L73
L125:
>>>>>>> Stashed changes
=======
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
>>>>>>> 5abefe5b1d1eb5aedcc2a1d895f5c667aa71ed28
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
<<<<<<< HEAD
addi $sp, $sp, 92
jr $ra
<<<<<<< Updated upstream
.globl L1024
L1024:
addi $sp, $sp, -92
=======
.globl L64
L64:
addi $sp, $sp, -48
>>>>>>> Stashed changes
=======
addi $sp, $sp, 48
jr $ra
.globl L97
L97:
addi $sp, $sp, -48
>>>>>>> 5abefe5b1d1eb5aedcc2a1d895f5c667aa71ed28
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
<<<<<<< HEAD
<<<<<<< Updated upstream
L1088:
sw $a0, -44($fp)
sw $a1, -48($fp)
move $s0, $a2
lw $s0, -48($fp)
lw $s1, -44($fp)
lw $s1, -52($s1)
beq $s0, $s1, L1082
j L1083
L1083:
=======
L128:
=======
L161:
>>>>>>> 5abefe5b1d1eb5aedcc2a1d895f5c667aa71ed28
sw $a0, 40($fp)
sw $a1, 44($fp)
move $s0, $a2
lw $s0, 44($fp)
lw $s1, 40($fp)
lw $s1, 44($s1)
<<<<<<< HEAD
beq $s0, $s1, L122
j L123
L123:
>>>>>>> Stashed changes
li $s0, 0
move $s0, $s0
lw $s1, -44($fp)
lw $s1, -52($s1)
addi $s1, $s1, -1
move $s1, $s1
<<<<<<< Updated upstream
ble $s0, $s1, L1080
j L1046
L1046:
li $s0, 0
move $s0, $s0
L1084:
move $v0, $s0
j L1087
L1082:
lw $s0, -44($fp)
move $a0, $s0
jal L1023
move $s0, $v0
move $s0, $s0
j L1084
L1080:
lw $s2, -44($fp)
lw $s2, -56($s2)
move $s2, $s2
li $s3, 0
beq $s2, $s3, L1048
j L1047
L1047:
=======
ble $s0, $s1, L120
j L86
L86:
li $s0, 0
move $s0, $s0
L124:
move $v0, $s0
j L127
L122:
lw $s0, 40($fp)
move $a0, $s0
jal L63
move $s0, $v0
move $s0, $s0
j L124
L120:
=======
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
>>>>>>> 5abefe5b1d1eb5aedcc2a1d895f5c667aa71ed28
lw $s2, 40($fp)
lw $s2, 48($s2)
move $s2, $s2
li $s3, 0
<<<<<<< HEAD
beq $s2, $s3, L88
j L87
L87:
>>>>>>> Stashed changes
li $s3, 4
mul $s3, $s0, $s3 
add $s2, $s2, $s3 
lw $s2, 0($s2)
li $s3, 0
<<<<<<< Updated upstream
beq $s2, $s3, L1051
j L1052
L1052:
li $s2, 0
move $s2, $s2
L1053:
li $s3, 0
bne $s2, $s3, L1058
j L1059
L1059:
li $s2, 0
move $s2, $s2
L1060:
li $s3, 0
bne $s2, $s3, L1077
j L1078
L1078:
bge $s0, $s1, L1046
j L1081
L1081:
addi $s0, $s0, 1
move $s0, $s0
j L1080
L1048:
jal tig_nilerror
move $s3, $v0
j L1047
L1051:
=======
beq $s2, $s3, L91
j L92
L92:
li $s2, 0
move $s2, $s2
L93:
li $s3, 0
bne $s2, $s3, L98
j L99
L99:
li $s2, 0
move $s2, $s2
L100:
li $s3, 0
bne $s2, $s3, L117
j L118
L118:
bge $s0, $s1, L86
j L121
L121:
addi $s0, $s0, 1
move $s0, $s0
j L120
L88:
jal tig_nilerror
move $s3, $v0
j L87
L91:
>>>>>>> Stashed changes
li $s2, 1
move $s2, $s2
lw $s3, -44($fp)
lw $s3, -64($s3)
move $s3, $s3
li $s4, 0
<<<<<<< Updated upstream
beq $s3, $s4, L1050
j L1049
L1049:
lw $s4, -48($fp)
=======
beq $s3, $s4, L90
j L89
L89:
lw $s4, 44($fp)
>>>>>>> Stashed changes
add $s4, $s0, $s4 
li $s5, 4
mul $s4, $s4, $s5 
add $s3, $s3, $s4 
lw $s3, 0($s3)
li $s4, 0
<<<<<<< Updated upstream
beq $s3, $s4, L1054
j L1055
L1055:
li $s2, 0
move $s2, $s2
L1054:
move $s2, $s2
j L1053
L1050:
jal tig_nilerror
move $s4, $v0
j L1049
L1058:
=======
beq $s3, $s4, L94
j L95
L95:
li $s2, 0
move $s2, $s2
L94:
move $s2, $s2
j L93
L90:
jal tig_nilerror
move $s4, $v0
j L89
L98:
>>>>>>> Stashed changes
li $s2, 1
move $s2, $s2
lw $s3, -44($fp)
lw $s3, -68($s3)
move $s3, $s3
li $s4, 0
<<<<<<< Updated upstream
beq $s3, $s4, L1057
j L1056
L1056:
=======
beq $s3, $s4, L97
j L96
L96:
>>>>>>> Stashed changes
addi $s4, $s0, 7
lw $s5, -48($fp)
sub $s4, $s4, $s5 
li $s5, 4
mul $s4, $s4, $s5 
add $s3, $s3, $s4 
lw $s3, 0($s3)
li $s4, 0
<<<<<<< Updated upstream
beq $s3, $s4, L1061
j L1062
L1062:
li $s2, 0
move $s2, $s2
L1061:
move $s2, $s2
j L1060
L1057:
jal tig_nilerror
move $s4, $v0
j L1056
L1077:
lw $s2, -44($fp)
lw $s2, -56($s2)
move $s2, $s2
li $s3, 0
beq $s2, $s3, L1064
j L1063
L1063:
=======
beq $s3, $s4, L101
j L102
L102:
li $s2, 0
move $s2, $s2
L101:
move $s2, $s2
j L100
L97:
jal tig_nilerror
move $s4, $v0
j L96
L117:
=======
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
>>>>>>> 5abefe5b1d1eb5aedcc2a1d895f5c667aa71ed28
lw $s2, 40($fp)
lw $s2, 48($s2)
move $s2, $s2
li $s3, 0
<<<<<<< HEAD
beq $s2, $s3, L104
j L103
L103:
>>>>>>> Stashed changes
li $s3, 1
li $s4, 4
mul $s4, $s0, $s4 
add $s2, $s2, $s4 
sw $s3, 0($s2)
lw $s2, -44($fp)
lw $s2, -64($s2)
move $s2, $s2
li $s3, 0
<<<<<<< Updated upstream
beq $s2, $s3, L1066
j L1065
L1065:
=======
beq $s2, $s3, L106
j L105
L105:
>>>>>>> Stashed changes
li $s3, 1
lw $s4, -48($fp)
add $s4, $s0, $s4 
li $s5, 4
mul $s4, $s4, $s5 
add $s2, $s2, $s4 
sw $s3, 0($s2)
lw $s2, -44($fp)
lw $s2, -68($s2)
move $s2, $s2
li $s3, 0
<<<<<<< Updated upstream
beq $s2, $s3, L1068
j L1067
L1067:
=======
beq $s2, $s3, L108
j L107
L107:
>>>>>>> Stashed changes
li $s3, 1
addi $s4, $s0, 7
lw $s5, -48($fp)
sub $s4, $s4, $s5 
li $s5, 4
mul $s4, $s4, $s5 
add $s2, $s2, $s4 
sw $s3, 0($s2)
lw $s2, -44($fp)
lw $s2, -60($s2)
move $s2, $s2
li $s3, 0
<<<<<<< Updated upstream
beq $s2, $s3, L1070
j L1069
L1069:
lw $s3, -48($fp)
=======
beq $s2, $s3, L110
j L109
L109:
lw $s3, 44($fp)
>>>>>>> Stashed changes
li $s4, 4
mul $s3, $s3, $s4 
add $s2, $s2, $s3 
sw $s0, 0($s2)
lw $s2, -44($fp)
move $a0, $s2
lw $s2, -48($fp)
addi $s2, $s2, 1
move $a1, $s2
<<<<<<< Updated upstream
jal L1024
=======
jal L64
>>>>>>> Stashed changes
move $s2, $v0
lw $s2, -44($fp)
lw $s2, -56($s2)
move $s2, $s2
li $s3, 0
<<<<<<< Updated upstream
beq $s2, $s3, L1072
j L1071
L1071:
=======
beq $s2, $s3, L112
j L111
L111:
>>>>>>> Stashed changes
li $s3, 0
li $s4, 4
mul $s4, $s0, $s4 
add $s2, $s2, $s4 
sw $s3, 0($s2)
lw $s2, -44($fp)
lw $s2, -64($s2)
move $s2, $s2
li $s3, 0
<<<<<<< Updated upstream
beq $s2, $s3, L1074
j L1073
L1073:
=======
beq $s2, $s3, L114
j L113
L113:
>>>>>>> Stashed changes
li $s3, 0
lw $s4, -48($fp)
add $s4, $s0, $s4 
li $s5, 4
mul $s4, $s4, $s5 
add $s2, $s2, $s4 
sw $s3, 0($s2)
lw $s2, -44($fp)
lw $s2, -68($s2)
move $s2, $s2
li $s3, 0
<<<<<<< Updated upstream
beq $s2, $s3, L1076
j L1075
L1075:
=======
beq $s2, $s3, L116
j L115
L115:
>>>>>>> Stashed changes
li $s3, 0
addi $s4, $s0, 7
lw $s5, -48($fp)
sub $s4, $s4, $s5 
li $s5, 4
mul $s4, $s4, $s5 
add $s2, $s2, $s4 
sw $s3, 0($s2)
<<<<<<< Updated upstream
j L1078
L1064:
jal tig_nilerror
move $s3, $v0
j L1063
L1066:
jal tig_nilerror
move $s3, $v0
j L1065
L1068:
jal tig_nilerror
move $s3, $v0
j L1067
L1070:
jal tig_nilerror
move $s3, $v0
j L1069
L1072:
jal tig_nilerror
move $s3, $v0
j L1071
L1074:
jal tig_nilerror
move $s3, $v0
j L1073
L1076:
jal tig_nilerror
move $s3, $v0
j L1075
L1087:
=======
j L118
L104:
jal tig_nilerror
move $s3, $v0
j L103
L106:
jal tig_nilerror
move $s3, $v0
j L105
L108:
jal tig_nilerror
move $s3, $v0
j L107
L110:
jal tig_nilerror
move $s3, $v0
j L109
L112:
jal tig_nilerror
move $s3, $v0
j L111
L114:
jal tig_nilerror
move $s3, $v0
j L113
L116:
jal tig_nilerror
move $s3, $v0
j L115
L127:
>>>>>>> Stashed changes
=======
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
>>>>>>> 5abefe5b1d1eb5aedcc2a1d895f5c667aa71ed28
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
<<<<<<< HEAD
addi $sp, $sp, 92
jr $ra
.globl tig_main
tig_main:
addi $sp, $sp, -108
=======
addi $sp, $sp, 48
jr $ra
.globl tig_main
tig_main:
addi $sp, $sp, -64
>>>>>>> 5abefe5b1d1eb5aedcc2a1d895f5c667aa71ed28
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
<<<<<<< HEAD
<<<<<<< Updated upstream
L1090:
sw $a0, -44($fp)
=======
L130:
sw $a0, 40($fp)
>>>>>>> Stashed changes
li $s0, 8
sw $s0, -52($fp)
addi $s0, $fp, -56
move $s0, $s0
lw $s1, -52($fp)
=======
L163:
sw $a0, 40($fp)
li $s0, 8
sw $s0, 44($fp)
addi $s0, $fp, 48
move $s0, $s0
lw $s1, 44($fp)
>>>>>>> 5abefe5b1d1eb5aedcc2a1d895f5c667aa71ed28
move $a0, $s1
li $s1, 0
move $a1, $s1
jal tig_initArray
move $s1, $v0
move $s1, $s1
sw $s1, 0($s0)
<<<<<<< HEAD
addi $s0, $fp, -60
move $s0, $s0
lw $s1, -52($fp)
=======
addi $s0, $fp, 52
move $s0, $s0
lw $s1, 44($fp)
>>>>>>> 5abefe5b1d1eb5aedcc2a1d895f5c667aa71ed28
move $a0, $s1
li $s1, 0
move $a1, $s1
jal tig_initArray
move $s1, $v0
move $s1, $s1
sw $s1, 0($s0)
<<<<<<< HEAD
addi $s0, $fp, -64
move $s0, $s0
lw $s1, -52($fp)
lw $s2, -52($fp)
=======
addi $s0, $fp, 56
move $s0, $s0
lw $s1, 44($fp)
lw $s2, 44($fp)
>>>>>>> 5abefe5b1d1eb5aedcc2a1d895f5c667aa71ed28
add $s1, $s1, $s2 
addi $s1, $s1, -1
move $a0, $s1
li $s1, 0
move $a1, $s1
jal tig_initArray
move $s1, $v0
move $s1, $s1
sw $s1, 0($s0)
<<<<<<< HEAD
addi $s0, $fp, -68
move $s0, $s0
lw $s1, -52($fp)
lw $s2, -52($fp)
=======
addi $s0, $fp, 60
move $s0, $s0
lw $s1, 44($fp)
lw $s2, 44($fp)
>>>>>>> 5abefe5b1d1eb5aedcc2a1d895f5c667aa71ed28
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
<<<<<<< HEAD
<<<<<<< Updated upstream
jal L1024
move $s0, $v0
move $v0, $s0
j L1089
L1089:
=======
jal L64
move $s0, $v0
move $v0, $s0
j L129
L129:
>>>>>>> Stashed changes
=======
jal L97
move $s0, $v0
move $v0, $s0
j L162
L162:
>>>>>>> 5abefe5b1d1eb5aedcc2a1d895f5c667aa71ed28
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
<<<<<<< HEAD
addi $sp, $sp, 108
=======
addi $sp, $sp, 64
>>>>>>> 5abefe5b1d1eb5aedcc2a1d895f5c667aa71ed28
jr $ra
