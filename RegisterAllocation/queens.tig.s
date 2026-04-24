
.data
L1029:
  .word 2
  .ascii " O"
  .space 2
L1030:
  .word 2
  .ascii " ."
  .space 2
L1042:
  .word 1
  .ascii "
"
  .space 3

.text
.globl L1023
L1023:
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
L1086:
sw $a0, -44($fp)
sw $a1, -48($fp)
li $s0, 0
move $s0, $s0
lw $s1, -44($fp)
lw $s1, -52($s1)
addi $s1, $s1, -1
move $s1, $s1
ble $s0, $s1, L1044
j L1025
L1025:
la $s0, L1042
move $a0, $s0
jal tig_print
move $s0, $v0
move $v0, $s0
j L1085
L1044:
li $s2, 0
move $s2, $s2
lw $s3, -44($fp)
lw $s3, -52($s3)
addi $s3, $s3, -1
move $s3, $s3
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
li $s5, 4
mul $s5, $s0, $s5 
add $s4, $s4, $s5 
lw $s4, 0($s4)
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
.globl L1024
L1024:
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
li $s0, 0
move $s0, $s0
lw $s1, -44($fp)
lw $s1, -52($s1)
addi $s1, $s1, -1
move $s1, $s1
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
li $s3, 4
mul $s3, $s0, $s3 
add $s2, $s2, $s3 
lw $s2, 0($s2)
li $s3, 0
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
li $s2, 1
move $s2, $s2
lw $s3, -44($fp)
lw $s3, -64($s3)
move $s3, $s3
li $s4, 0
beq $s3, $s4, L1050
j L1049
L1049:
lw $s4, -48($fp)
add $s4, $s0, $s4 
li $s5, 4
mul $s4, $s4, $s5 
add $s3, $s3, $s4 
lw $s3, 0($s3)
li $s4, 0
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
li $s2, 1
move $s2, $s2
lw $s3, -44($fp)
lw $s3, -68($s3)
move $s3, $s3
li $s4, 0
beq $s3, $s4, L1057
j L1056
L1056:
addi $s4, $s0, 7
lw $s5, -48($fp)
sub $s4, $s4, $s5 
li $s5, 4
mul $s4, $s4, $s5 
add $s3, $s3, $s4 
lw $s3, 0($s3)
li $s4, 0
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
li $s3, 1
li $s4, 4
mul $s4, $s0, $s4 
add $s2, $s2, $s4 
sw $s3, 0($s2)
lw $s2, -44($fp)
lw $s2, -64($s2)
move $s2, $s2
li $s3, 0
beq $s2, $s3, L1066
j L1065
L1065:
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
beq $s2, $s3, L1068
j L1067
L1067:
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
beq $s2, $s3, L1070
j L1069
L1069:
lw $s3, -48($fp)
li $s4, 4
mul $s3, $s3, $s4 
add $s2, $s2, $s3 
sw $s0, 0($s2)
lw $s2, -44($fp)
move $a0, $s2
lw $s2, -48($fp)
addi $s2, $s2, 1
move $a1, $s2
jal L1024
move $s2, $v0
lw $s2, -44($fp)
lw $s2, -56($s2)
move $s2, $s2
li $s3, 0
beq $s2, $s3, L1072
j L1071
L1071:
li $s3, 0
li $s4, 4
mul $s4, $s0, $s4 
add $s2, $s2, $s4 
sw $s3, 0($s2)
lw $s2, -44($fp)
lw $s2, -64($s2)
move $s2, $s2
li $s3, 0
beq $s2, $s3, L1074
j L1073
L1073:
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
beq $s2, $s3, L1076
j L1075
L1075:
li $s3, 0
addi $s4, $s0, 7
lw $s5, -48($fp)
sub $s4, $s4, $s5 
li $s5, 4
mul $s4, $s4, $s5 
add $s2, $s2, $s4 
sw $s3, 0($s2)
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
addi $sp, $sp, -108
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
L1090:
sw $a0, -44($fp)
li $s0, 8
sw $s0, -52($fp)
addi $s0, $fp, -56
move $s0, $s0
lw $s1, -52($fp)
move $a0, $s1
li $s1, 0
move $a1, $s1
jal tig_initArray
move $s1, $v0
move $s1, $s1
sw $s1, 0($s0)
addi $s0, $fp, -60
move $s0, $s0
lw $s1, -52($fp)
move $a0, $s1
li $s1, 0
move $a1, $s1
jal tig_initArray
move $s1, $v0
move $s1, $s1
sw $s1, 0($s0)
addi $s0, $fp, -64
move $s0, $s0
lw $s1, -52($fp)
lw $s2, -52($fp)
add $s1, $s1, $s2 
addi $s1, $s1, -1
move $a0, $s1
li $s1, 0
move $a1, $s1
jal tig_initArray
move $s1, $v0
move $s1, $s1
sw $s1, 0($s0)
addi $s0, $fp, -68
move $s0, $s0
lw $s1, -52($fp)
lw $s2, -52($fp)
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
jal L1024
move $s0, $v0
move $v0, $s0
j L1089
L1089:
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
addi $sp, $sp, 108
jr $ra
