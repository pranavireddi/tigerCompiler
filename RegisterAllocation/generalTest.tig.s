
.data
L3077:
  .word 5
  .ascii "hello"
  .space 3
L3083:
  .word 1
  .ascii "A"
  .space 3
L3089:
  .word 12
  .ascii "ok_compiler
"
L3090:
  .word 13
  .ascii "bad_compiler
"
  .space 3

.text
.globl L3029
L3029:
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
L3095:
sw $a0, 40($fp)
sw $a1, 44($fp)
move $s0, $a2
lw $s0, 44($fp)
li $s1, 0
beq $s0, $s1, L3034
j L3035
L3035:
lw $s0, 44($fp)
move $s0, $s0
lw $s1, 40($fp)
move $a0, $s1
lw $s1, 44($fp)
addi $s1, $s1, -1
move $a1, $s1
jal L3029
move $s1, $v0
move $s1, $s1
mul $s0, $s0, $s1 
move $s0, $s0
L3036:
move $v0, $s0
j L3094
L3034:
li $s0, 1
move $s0, $s0
j L3036
L3094:
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
.globl L3030
L3030:
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
L3097:
sw $a0, 40($fp)
sw $a1, 44($fp)
move $s0, $a2
move $s1, $a3
li $s1, 0
move $s1, $s1
li $s2, 0
move $s2, $s2
L3040:
blt $s1, $s0, L3041
j L3037
L3037:
move $v0, $s2
j L3096
L3041:
move $s2, $s2
lw $s3, 44($fp)
move $s3, $s3
li $s4, 0
beq $s3, $s4, L3039
j L3038
L3038:
li $s4, 4
mul $s4, $s1, $s4 
addi $s4, $s4, 4
add $s3, $s3, $s4 
lw $s3, 0($s3)
add $s2, $s2, $s3 
move $s2, $s2
addi $s1, $s1, 1
move $s1, $s1
j L3040
L3039:
jal tig_nilerror
move $s4, $v0
j L3038
L3096:
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
.globl L3031
L3031:
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
L3099:
sw $a0, 40($fp)
sw $a1, 44($fp)
move $s0, $a2
move $s1, $a3
li $s1, 8
move $a0, $s1
jal tig_allocRecord
move $s1, $v0
move $s1, $s1
lw $s2, 44($fp)
sw $s2, 0($s1)
sw $s0, 4($s1)
move $v0, $s1
j L3098
L3098:
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
.globl L3042
L3042:
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
L3101:
sw $a0, 40($fp)
sw $a1, 44($fp)
move $s0, $a2
lw $s0, 40($fp)
lw $s0, 44($s0)
lw $s1, 40($fp)
lw $s1, 52($s1)
add $s0, $s0, $s1 
lw $s1, 44($fp)
add $s0, $s0, $s1 
move $v0, $s0
j L3100
L3100:
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
.globl L3032
L3032:
addi $sp, $sp, -56
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
L3103:
sw $a0, 40($fp)
sw $a1, 44($fp)
sw $a2, 48($fp)
li $s0, 20
sw $s0, 52($fp)
move $a0, $fp
li $s0, 30
move $a1, $s0
jal L3042
move $s0, $v0
move $v0, $s0
j L3102
L3102:
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
addi $sp, $sp, 56
jr $ra
.globl L3033
L3033:
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
L3105:
sw $a0, 40($fp)
sw $a1, 44($fp)
move $s0, $a2
move $s1, $a3
lw $s2, 44($fp)
add $s0, $s2, $s0 
move $s0, $s0
lw $s2, 48($fp)
add $s1, $s1, $s2 
move $s1, $s1
lw $s2, 52($fp)
lw $s3, 56($fp)
add $s2, $s2, $s3 
move $s2, $s2
lw $s3, 60($fp)
lw $s4, 64($fp)
add $s3, $s3, $s4 
move $s3, $s3
lw $s4, 68($fp)
lw $s5, 72($fp)
add $s4, $s4, $s5 
move $s4, $s4
mul $s0, $s0, $s1 
move $s0, $s0
mul $s1, $s2, $s3 
move $s1, $s1
add $s0, $s0, $s1 
move $s0, $s0
sub $s0, $s0, $s4 
move $s0, $s0
move $v0, $s0
j L3104
L3104:
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
addi $sp, $sp, -44
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
L3107:
sw $a0, 40($fp)
li $s0, 5
move $a0, $s0
li $s0, 0
move $a1, $s0
jal tig_initArray
move $s0, $v0
move $s0, $s0
move $a0, $fp
li $s1, 7
move $a1, $s1
li $s1, 8
move $a2, $s1
jal L3031
move $s1, $v0
move $s1, $s1
move $s0, $s0
li $s2, 0
beq $s0, $s2, L3044
j L3043
L3043:
li $s2, 1
li $s3, 0
li $s4, 4
mul $s3, $s3, $s4 
addi $s3, $s3, 4
add $s3, $s0, $s3 
sw $s2, 0($s3)
move $s0, $s0
li $s2, 0
beq $s0, $s2, L3046
j L3045
L3045:
li $s2, 2
li $s3, 1
li $s4, 4
mul $s3, $s3, $s4 
addi $s3, $s3, 4
add $s3, $s0, $s3 
sw $s2, 0($s3)
move $s0, $s0
li $s2, 0
beq $s0, $s2, L3048
j L3047
L3047:
li $s2, 3
li $s3, 2
li $s4, 4
mul $s3, $s3, $s4 
addi $s3, $s3, 4
add $s3, $s0, $s3 
sw $s2, 0($s3)
move $s0, $s0
li $s2, 0
beq $s0, $s2, L3050
j L3049
L3049:
li $s2, 4
li $s3, 3
li $s4, 4
mul $s3, $s3, $s4 
addi $s3, $s3, 4
add $s3, $s0, $s3 
sw $s2, 0($s3)
move $s0, $s0
li $s2, 0
beq $s0, $s2, L3052
j L3051
L3051:
li $s2, 5
li $s3, 4
li $s4, 4
mul $s3, $s3, $s4 
addi $s3, $s3, 4
add $s3, $s0, $s3 
sw $s2, 0($s3)
move $a0, $fp
li $s2, 5
move $a1, $s2
jal L3029
move $s2, $v0
move $s2, $s2
li $s3, 120
beq $s2, $s3, L3053
j L3054
L3054:
li $s0, 0
move $s0, $s0
L3055:
li $s2, 0
bne $s0, $s2, L3062
j L3063
L3063:
li $s0, 0
move $s0, $s0
L3064:
li $s1, 0
bne $s0, $s1, L3067
j L3068
L3068:
li $s0, 0
move $s0, $s0
L3069:
li $s1, 0
bne $s0, $s1, L3072
j L3073
L3073:
li $s0, 0
move $s0, $s0
L3074:
li $s1, 0
bne $s0, $s1, L3078
j L3079
L3079:
li $s0, 0
move $s0, $s0
L3080:
li $s1, 0
bne $s0, $s1, L3084
j L3085
L3085:
li $s0, 0
move $s0, $s0
L3086:
li $s1, 0
bne $s0, $s1, L3091
j L3092
L3092:
la $s0, L3090
move $a0, $s0
jal tig_print
move $s0, $v0
move $s0, $s0
L3093:
move $v0, $s0
j L3106
L3044:
jal tig_nilerror
move $s2, $v0
j L3043
L3046:
jal tig_nilerror
move $s2, $v0
j L3045
L3048:
jal tig_nilerror
move $s2, $v0
j L3047
L3050:
jal tig_nilerror
move $s2, $v0
j L3049
L3052:
jal tig_nilerror
move $s2, $v0
j L3051
L3053:
li $s2, 1
move $s2, $s2
move $a0, $fp
move $a1, $s0
li $s0, 5
move $a2, $s0
jal L3030
move $s0, $v0
move $s0, $s0
li $s3, 15
beq $s0, $s3, L3056
j L3057
L3057:
li $s0, 0
move $s2, $s0
L3056:
move $s0, $s2
j L3055
L3062:
li $s0, 1
move $s0, $s0
move $s1, $s1
li $s2, 0
beq $s1, $s2, L3059
j L3058
L3058:
lw $s2, 0($s1)
move $s2, $s2
move $s1, $s1
li $s3, 0
beq $s1, $s3, L3061
j L3060
L3060:
lw $s1, 4($s1)
add $s1, $s2, $s1 
li $s2, 15
beq $s1, $s2, L3065
j L3066
L3066:
li $s0, 0
move $s0, $s0
L3065:
move $s0, $s0
j L3064
L3059:
jal tig_nilerror
move $s2, $v0
j L3058
L3061:
jal tig_nilerror
move $s3, $v0
j L3060
L3067:
li $s0, 1
move $s0, $s0
move $a0, $fp
li $s1, 10
move $a1, $s1
jal L3032
move $s1, $v0
move $s1, $s1
li $s2, 60
beq $s1, $s2, L3070
j L3071
L3071:
li $s0, 0
move $s0, $s0
L3070:
move $s0, $s0
j L3069
L3072:
li $s0, 1
move $s0, $s0
move $a0, $fp
li $s1, 1
move $a1, $s1
li $s1, 2
move $a2, $s1
li $s1, 3
move $a3, $s1
li $s1, 4
sw $s1, 0($sp)
li $s1, 5
sw $s1, 4($sp)
li $s1, 6
sw $s1, 8($sp)
li $s1, 7
sw $s1, 12($sp)
li $s1, 8
sw $s1, 16($sp)
li $s1, 9
sw $s1, 20($sp)
li $s1, 10
sw $s1, 24($sp)
jal L3033
move $s1, $v0
move $s1, $s1
li $s2, 167
beq $s1, $s2, L3075
j L3076
L3076:
li $s0, 0
move $s0, $s0
L3075:
move $s0, $s0
j L3074
L3078:
li $s0, 1
move $s0, $s0
la $s1, L3077
move $a0, $s1
jal tig_size
move $s1, $v0
move $s1, $s1
li $s2, 5
beq $s1, $s2, L3081
j L3082
L3082:
li $s0, 0
move $s0, $s0
L3081:
move $s0, $s0
j L3080
L3084:
li $s0, 1
move $s0, $s0
la $s1, L3083
move $a0, $s1
jal tig_ord
move $s1, $v0
move $s1, $s1
li $s2, 65
beq $s1, $s2, L3087
j L3088
L3088:
li $s0, 0
move $s0, $s0
L3087:
move $s0, $s0
j L3086
L3091:
la $s0, L3089
move $a0, $s0
jal tig_print
move $s0, $v0
move $s0, $s0
j L3093
L3106:
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
addi $sp, $sp, 44
jr $ra
