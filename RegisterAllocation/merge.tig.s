
.data
<<<<<<< HEAD
<<<<<<< Updated upstream
L958:
  .word 1
  .ascii "0"
  .space 3
L959:
  .word 1
  .ascii "9"
  .space 3
L965:
  .word 1
  .ascii " "
  .space 3
L966:
=======
L326:
  .word 1
  .ascii "0"
  .space 3
L327:
  .word 1
  .ascii "9"
  .space 3
L333:
  .word 1
  .ascii " "
  .space 3
L334:
>>>>>>> Stashed changes
=======
L3:
  .word 1
  .ascii "0"
  .space 3
L4:
  .word 1
  .ascii "9"
  .space 3
L10:
  .word 1
  .ascii " "
  .space 3
L11:
>>>>>>> 5abefe5b1d1eb5aedcc2a1d895f5c667aa71ed28
  .word 1
  .ascii "
"
  .space 3
<<<<<<< HEAD
<<<<<<< Updated upstream
L989:
=======
L383:
>>>>>>> Stashed changes
=======
L60:
>>>>>>> 5abefe5b1d1eb5aedcc2a1d895f5c667aa71ed28
  .word 1
  .ascii "-"
  .space 3

.text
<<<<<<< HEAD
<<<<<<< Updated upstream
.globl L956
L956:
=======
.globl L324
L324:
>>>>>>> Stashed changes
=======
.globl L1
L1:
>>>>>>> 5abefe5b1d1eb5aedcc2a1d895f5c667aa71ed28
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
<<<<<<< HEAD
<<<<<<< Updated upstream
L1008:
sw $a0, -4($fp)
sw $a1, -8($fp)
=======
L402:
sw $a0, 40($fp)
sw $a1, 44($fp)
>>>>>>> Stashed changes
move $s0, $a2
lw $s0, -4($fp)
lw $s0, -4($s0)
lw $s0, -8($s0)
=======
L79:
sw $a0, 40($fp)
sw $a1, 44($fp)
move $s0, $a2
lw $s0, 40($fp)
lw $s0, 40($s0)
lw $s0, 44($s0)
>>>>>>> 5abefe5b1d1eb5aedcc2a1d895f5c667aa71ed28
move $a0, $s0
jal tig_ord
move $s0, $v0
move $s0, $s0
move $s0, $s0
<<<<<<< HEAD
<<<<<<< Updated upstream
la $s1, L958
=======
la $s1, L326
>>>>>>> Stashed changes
=======
la $s1, L3
>>>>>>> 5abefe5b1d1eb5aedcc2a1d895f5c667aa71ed28
move $a0, $s1
jal tig_ord
move $s1, $v0
move $s1, $s1
<<<<<<< HEAD
<<<<<<< Updated upstream
bge $s0, $s1, L960
j L961
L961:
li $s0, 0
move $s0, $s0
L962:
move $v0, $s0
j L1007
L960:
=======
bge $s0, $s1, L328
j L329
L329:
li $s0, 0
move $s0, $s0
L330:
move $v0, $s0
j L401
L328:
>>>>>>> Stashed changes
li $s0, 1
move $s0, $s0
lw $s1, -4($fp)
lw $s1, -4($s1)
lw $s1, -8($s1)
=======
bge $s0, $s1, L5
j L6
L6:
li $s0, 0
move $s0, $s0
L7:
move $v0, $s0
j L78
L5:
li $s0, 1
move $s0, $s0
lw $s1, 40($fp)
lw $s1, 40($s1)
lw $s1, 44($s1)
>>>>>>> 5abefe5b1d1eb5aedcc2a1d895f5c667aa71ed28
move $a0, $s1
jal tig_ord
move $s1, $v0
move $s1, $s1
move $s1, $s1
<<<<<<< HEAD
<<<<<<< Updated upstream
la $s2, L959
=======
la $s2, L327
>>>>>>> Stashed changes
=======
la $s2, L4
>>>>>>> 5abefe5b1d1eb5aedcc2a1d895f5c667aa71ed28
move $a0, $s2
jal tig_ord
move $s2, $v0
move $s2, $s2
<<<<<<< HEAD
<<<<<<< Updated upstream
ble $s1, $s2, L963
j L964
L964:
li $s0, 0
move $s0, $s0
L963:
move $s0, $s0
j L962
L1007:
=======
ble $s1, $s2, L331
j L332
L332:
li $s0, 0
move $s0, $s0
L331:
move $s0, $s0
j L330
L401:
>>>>>>> Stashed changes
=======
ble $s1, $s2, L8
j L9
L9:
li $s0, 0
move $s0, $s0
L8:
move $s0, $s0
j L7
L78:
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
addi $sp, $sp, 48
jr $ra
<<<<<<< HEAD
<<<<<<< Updated upstream
.globl L957
L957:
=======
.globl L325
L325:
>>>>>>> Stashed changes
=======
.globl L2
L2:
>>>>>>> 5abefe5b1d1eb5aedcc2a1d895f5c667aa71ed28
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
<<<<<<< HEAD
<<<<<<< Updated upstream
L1010:
sw $a0, -4($fp)
sw $a1, -8($fp)
L971:
lw $s0, -4($fp)
lw $s0, -4($s0)
lw $s0, -8($s0)
move $a0, $s0
la $s0, L965
=======
L404:
sw $a0, 40($fp)
sw $a1, 44($fp)
L339:
=======
L81:
sw $a0, 40($fp)
sw $a1, 44($fp)
L16:
>>>>>>> 5abefe5b1d1eb5aedcc2a1d895f5c667aa71ed28
lw $s0, 40($fp)
lw $s0, 40($s0)
lw $s0, 44($s0)
move $a0, $s0
<<<<<<< HEAD
la $s0, L333
>>>>>>> Stashed changes
=======
la $s0, L10
>>>>>>> 5abefe5b1d1eb5aedcc2a1d895f5c667aa71ed28
move $a1, $s0
jal tig_stringEqual
move $s0, $v0
move $s0, $s0
li $s1, 0
<<<<<<< HEAD
<<<<<<< Updated upstream
bne $s0, $s1, L967
j L968
L968:
lw $s0, -4($fp)
lw $s0, -4($s0)
lw $s0, -8($s0)
move $a0, $s0
la $s0, L966
=======
bne $s0, $s1, L335
j L336
L336:
=======
bne $s0, $s1, L12
j L13
L13:
>>>>>>> 5abefe5b1d1eb5aedcc2a1d895f5c667aa71ed28
lw $s0, 40($fp)
lw $s0, 40($s0)
lw $s0, 44($s0)
move $a0, $s0
<<<<<<< HEAD
la $s0, L334
>>>>>>> Stashed changes
=======
la $s0, L11
>>>>>>> 5abefe5b1d1eb5aedcc2a1d895f5c667aa71ed28
move $a1, $s0
jal tig_stringEqual
move $s0, $v0
move $s0, $s0
<<<<<<< HEAD
<<<<<<< Updated upstream
L969:
li $s1, 0
bne $s0, $s1, L972
j L970
L970:
li $s0, 0
move $v0, $s0
j L1009
L967:
li $s0, 1
move $s0, $s0
j L969
L972:
lw $s0, -4($fp)
lw $s0, -4($s0)
addi $s0, $s0, -8
=======
L337:
li $s1, 0
bne $s0, $s1, L340
j L338
L338:
li $s0, 0
move $v0, $s0
j L403
L335:
li $s0, 1
move $s0, $s0
j L337
L340:
lw $s0, 40($fp)
lw $s0, 40($s0)
addi $s0, $s0, 44
>>>>>>> Stashed changes
=======
L14:
li $s1, 0
bne $s0, $s1, L17
j L15
L15:
li $s0, 0
move $v0, $s0
j L80
L12:
li $s0, 1
move $s0, $s0
j L14
L17:
lw $s0, 40($fp)
lw $s0, 40($s0)
addi $s0, $s0, 44
>>>>>>> 5abefe5b1d1eb5aedcc2a1d895f5c667aa71ed28
move $s0, $s0
jal tig_getchar
move $s1, $v0
move $s1, $s1
sw $s1, 0($s0)
<<<<<<< HEAD
<<<<<<< Updated upstream
j L971
L1009:
=======
j L339
L403:
>>>>>>> Stashed changes
=======
j L16
L80:
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
addi $sp, $sp, 48
jr $ra
<<<<<<< HEAD
<<<<<<< Updated upstream
.globl L955
L955:
=======
.globl L323
L323:
>>>>>>> Stashed changes
=======
.globl L0
L0:
>>>>>>> 5abefe5b1d1eb5aedcc2a1d895f5c667aa71ed28
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
<<<<<<< HEAD
<<<<<<< Updated upstream
L1012:
sw $a0, -4($fp)
sw $a1, -8($fp)
=======
L406:
sw $a0, 40($fp)
sw $a1, 44($fp)
>>>>>>> Stashed changes
=======
L83:
sw $a0, 40($fp)
sw $a1, 44($fp)
>>>>>>> 5abefe5b1d1eb5aedcc2a1d895f5c667aa71ed28
move $s0, $a2
li $s0, 0
move $s0, $s0
move $a0, $fp
<<<<<<< HEAD
<<<<<<< Updated upstream
jal L957
=======
jal L325
>>>>>>> Stashed changes
move $s1, $v0
lw $s1, -8($fp)
move $s1, $s1
li $s2, 0
<<<<<<< Updated upstream
beq $s1, $s2, L974
j L973
L973:
=======
beq $s1, $s2, L342
j L341
L341:
>>>>>>> Stashed changes
addi $s1, $s1, 0
move $s1, $s1
move $a0, $fp
lw $s2, -4($fp)
lw $s2, -8($s2)
move $a1, $s2
<<<<<<< Updated upstream
jal L956
move $s2, $v0
move $s2, $s2
sw $s2, 0($s1)
L976:
=======
jal L324
move $s2, $v0
move $s2, $s2
sw $s2, 0($s1)
L344:
>>>>>>> Stashed changes
move $a0, $fp
lw $s1, -4($fp)
lw $s1, -8($s1)
move $a1, $s1
<<<<<<< Updated upstream
jal L956
move $s1, $v0
move $s1, $s1
li $s2, 0
bne $s1, $s2, L977
j L975
L975:
move $v0, $s0
j L1011
L974:
jal tig_nilerror
move $s2, $v0
j L973
L977:
=======
jal L324
move $s1, $v0
move $s1, $s1
li $s2, 0
bne $s1, $s2, L345
j L343
L343:
move $v0, $s0
j L405
L342:
jal tig_nilerror
move $s2, $v0
j L341
L345:
>>>>>>> Stashed changes
li $s1, 10
mul $s0, $s0, $s1 
move $s0, $s0
lw $s1, -4($fp)
lw $s1, -8($s1)
=======
jal L2
move $s1, $v0
lw $s1, 44($fp)
move $s1, $s1
li $s2, 0
beq $s1, $s2, L19
j L18
L18:
addi $s1, $s1, 0
move $s1, $s1
move $a0, $fp
lw $s2, 40($fp)
lw $s2, 44($s2)
move $a1, $s2
jal L1
move $s2, $v0
move $s2, $s2
sw $s2, 0($s1)
L21:
move $a0, $fp
lw $s1, 40($fp)
lw $s1, 44($s1)
move $a1, $s1
jal L1
move $s1, $v0
move $s1, $s1
li $s2, 0
bne $s1, $s2, L22
j L20
L20:
move $v0, $s0
j L82
L19:
jal tig_nilerror
move $s2, $v0
j L18
L22:
li $s1, 10
mul $s0, $s0, $s1 
move $s0, $s0
lw $s1, 40($fp)
lw $s1, 44($s1)
>>>>>>> 5abefe5b1d1eb5aedcc2a1d895f5c667aa71ed28
move $a0, $s1
jal tig_ord
move $s1, $v0
move $s1, $s1
add $s0, $s0, $s1 
move $s0, $s0
<<<<<<< HEAD
<<<<<<< Updated upstream
la $s1, L958
=======
la $s1, L326
>>>>>>> Stashed changes
=======
la $s1, L3
>>>>>>> 5abefe5b1d1eb5aedcc2a1d895f5c667aa71ed28
move $a0, $s1
jal tig_ord
move $s1, $v0
move $s1, $s1
sub $s0, $s0, $s1 
move $s0, $s0
<<<<<<< HEAD
lw $s1, -4($fp)
addi $s1, $s1, -8
=======
lw $s1, 40($fp)
addi $s1, $s1, 44
>>>>>>> 5abefe5b1d1eb5aedcc2a1d895f5c667aa71ed28
move $s1, $s1
jal tig_getchar
move $s2, $v0
move $s2, $s2
sw $s2, 0($s1)
<<<<<<< HEAD
<<<<<<< Updated upstream
j L976
L1011:
=======
j L344
L405:
>>>>>>> Stashed changes
=======
j L21
L82:
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
addi $sp, $sp, 48
jr $ra
<<<<<<< HEAD
<<<<<<< Updated upstream
.globl L978
L978:
=======
.globl L346
L346:
>>>>>>> Stashed changes
=======
.globl L23
L23:
>>>>>>> 5abefe5b1d1eb5aedcc2a1d895f5c667aa71ed28
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
<<<<<<< HEAD
<<<<<<< Updated upstream
L1014:
sw $a0, -4($fp)
sw $a1, -8($fp)
=======
L408:
sw $a0, 40($fp)
sw $a1, 44($fp)
>>>>>>> Stashed changes
=======
L85:
sw $a0, 40($fp)
sw $a1, 44($fp)
>>>>>>> 5abefe5b1d1eb5aedcc2a1d895f5c667aa71ed28
li $s0, 4
move $a0, $s0
jal tig_allocRecord
move $s0, $v0
move $s0, $s0
li $s1, 0
sw $s1, 0($s0)
move $s0, $s0
<<<<<<< HEAD
lw $s1, -4($fp)
move $a0, $s1
move $a1, $s0
<<<<<<< Updated upstream
jal L955
=======
jal L323
>>>>>>> Stashed changes
=======
lw $s1, 40($fp)
move $a0, $s1
move $a1, $s0
jal L0
>>>>>>> 5abefe5b1d1eb5aedcc2a1d895f5c667aa71ed28
move $s1, $v0
move $s1, $s1
move $s0, $s0
li $s2, 0
<<<<<<< HEAD
<<<<<<< Updated upstream
beq $s0, $s2, L982
j L981
L981:
lw $s0, 0($s0)
li $s2, 0
bne $s0, $s2, L983
j L984
L984:
li $s0, 0
move $s0, $s0
L985:
move $v0, $s0
j L1013
L982:
jal tig_nilerror
move $s2, $v0
j L981
L983:
=======
beq $s0, $s2, L351
j L350
L350:
lw $s0, 0($s0)
li $s2, 0
bne $s0, $s2, L352
j L353
L353:
li $s0, 0
move $s0, $s0
L354:
move $v0, $s0
j L407
L351:
jal tig_nilerror
move $s2, $v0
j L350
L352:
>>>>>>> Stashed changes
=======
beq $s0, $s2, L28
j L27
L27:
lw $s0, 0($s0)
li $s2, 0
bne $s0, $s2, L29
j L30
L30:
li $s0, 0
move $s0, $s0
L31:
move $v0, $s0
j L84
L28:
jal tig_nilerror
move $s2, $v0
j L27
L29:
>>>>>>> 5abefe5b1d1eb5aedcc2a1d895f5c667aa71ed28
li $s0, 8
move $a0, $s0
jal tig_allocRecord
move $s0, $v0
move $s0, $s0
sw $s1, 0($s0)
addi $s1, $s0, 4
move $s1, $s1
<<<<<<< HEAD
lw $s2, -4($fp)
move $a0, $s2
<<<<<<< Updated upstream
jal L978
=======
jal L346
>>>>>>> Stashed changes
=======
lw $s2, 40($fp)
move $a0, $s2
jal L23
>>>>>>> 5abefe5b1d1eb5aedcc2a1d895f5c667aa71ed28
move $s2, $v0
move $s2, $s2
sw $s2, 0($s1)
move $s0, $s0
<<<<<<< HEAD
<<<<<<< Updated upstream
j L985
L1013:
=======
j L354
L407:
>>>>>>> Stashed changes
=======
j L31
L84:
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
addi $sp, $sp, 48
jr $ra
<<<<<<< HEAD
<<<<<<< Updated upstream
.globl L986
L986:
=======
.globl L347
L347:
>>>>>>> Stashed changes
=======
.globl L24
L24:
>>>>>>> 5abefe5b1d1eb5aedcc2a1d895f5c667aa71ed28
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
<<<<<<< HEAD
<<<<<<< Updated upstream
L1016:
sw $a0, -4($fp)
sw $a1, -8($fp)
move $s0, $a2
lw $s0, -8($fp)
li $s1, 0
bgt $s0, $s1, L987
j L988
L988:
li $s0, 0
move $v0, $s0
j L1015
L987:
lw $s0, -4($fp)
=======
L410:
=======
L87:
>>>>>>> 5abefe5b1d1eb5aedcc2a1d895f5c667aa71ed28
sw $a0, 40($fp)
sw $a1, 44($fp)
move $s0, $a2
move $s1, $a3
lw $s1, 44($fp)
li $s2, 0
<<<<<<< HEAD
beq $s1, $s2, L377
j L378
L378:
li $s1, 0
beq $s0, $s1, L374
j L375
L375:
lw $s1, 44($fp)
move $s1, $s1
li $s2, 0
beq $s1, $s2, L356
j L355
L355:
=======
beq $s1, $s2, L54
j L55
L55:
li $s1, 0
beq $s0, $s1, L51
j L52
L52:
lw $s1, 44($fp)
move $s1, $s1
li $s2, 0
beq $s1, $s2, L33
j L32
L32:
>>>>>>> 5abefe5b1d1eb5aedcc2a1d895f5c667aa71ed28
lw $s1, 0($s1)
move $s1, $s1
move $s0, $s0
li $s2, 0
<<<<<<< HEAD
beq $s0, $s2, L358
j L357
L357:
lw $s2, 0($s0)
blt $s1, $s2, L371
j L372
L372:
=======
beq $s0, $s2, L35
j L34
L34:
lw $s2, 0($s0)
blt $s1, $s2, L48
j L49
L49:
>>>>>>> 5abefe5b1d1eb5aedcc2a1d895f5c667aa71ed28
li $s1, 8
move $a0, $s1
jal tig_allocRecord
move $s1, $v0
move $s1, $s1
addi $s2, $s1, 0
move $s2, $s2
move $s0, $s0
li $s3, 0
<<<<<<< HEAD
beq $s0, $s3, L366
j L365
L365:
=======
beq $s0, $s3, L43
j L42
L42:
>>>>>>> 5abefe5b1d1eb5aedcc2a1d895f5c667aa71ed28
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
<<<<<<< HEAD
beq $s0, $s5, L368
j L367
L367:
=======
beq $s0, $s5, L45
j L44
L44:
>>>>>>> 5abefe5b1d1eb5aedcc2a1d895f5c667aa71ed28
move $a0, $s3
move $a1, $s4
lw $s0, 4($s0)
move $a2, $s0
<<<<<<< HEAD
jal L347
=======
jal L24
>>>>>>> 5abefe5b1d1eb5aedcc2a1d895f5c667aa71ed28
move $s0, $v0
move $s0, $s0
sw $s0, 0($s2)
move $s0, $s1
<<<<<<< HEAD
L373:
move $s0, $s0
L376:
move $s0, $s0
L379:
move $v0, $s0
j L409
L377:
move $s0, $s0
j L379
L374:
lw $s0, 44($fp)
move $s0, $s0
j L376
L356:
jal tig_nilerror
move $s2, $v0
j L355
L358:
jal tig_nilerror
move $s2, $v0
j L357
L371:
=======
L50:
move $s0, $s0
L53:
move $s0, $s0
L56:
move $v0, $s0
j L86
L54:
move $s0, $s0
j L56
L51:
lw $s0, 44($fp)
move $s0, $s0
j L53
L33:
jal tig_nilerror
move $s2, $v0
j L32
L35:
jal tig_nilerror
move $s2, $v0
j L34
L48:
>>>>>>> 5abefe5b1d1eb5aedcc2a1d895f5c667aa71ed28
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
<<<<<<< HEAD
beq $s3, $s4, L360
j L359
L359:
=======
beq $s3, $s4, L37
j L36
L36:
>>>>>>> 5abefe5b1d1eb5aedcc2a1d895f5c667aa71ed28
lw $s3, 0($s3)
sw $s3, 0($s2)
addi $s2, $s1, 4
move $s2, $s2
lw $s3, 40($fp)
move $s3, $s3
lw $s4, 44($fp)
move $s4, $s4
li $s5, 0
<<<<<<< HEAD
beq $s4, $s5, L362
j L361
L361:
=======
beq $s4, $s5, L39
j L38
L38:
>>>>>>> 5abefe5b1d1eb5aedcc2a1d895f5c667aa71ed28
move $a0, $s3
lw $s3, 4($s4)
move $a1, $s3
move $a2, $s0
<<<<<<< HEAD
jal L347
=======
jal L24
>>>>>>> 5abefe5b1d1eb5aedcc2a1d895f5c667aa71ed28
move $s0, $v0
move $s0, $s0
sw $s0, 0($s2)
move $s0, $s1
<<<<<<< HEAD
j L373
L360:
jal tig_nilerror
move $s4, $v0
j L359
L362:
jal tig_nilerror
move $s5, $v0
j L361
L366:
jal tig_nilerror
move $s3, $v0
j L365
L368:
jal tig_nilerror
move $s5, $v0
j L367
L409:
=======
j L50
L37:
jal tig_nilerror
move $s4, $v0
j L36
L39:
jal tig_nilerror
move $s5, $v0
j L38
L43:
jal tig_nilerror
move $s3, $v0
j L42
L45:
jal tig_nilerror
move $s5, $v0
j L44
L86:
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
addi $sp, $sp, 48
jr $ra
<<<<<<< HEAD
.globl L380
L380:
=======
.globl L57
L57:
>>>>>>> 5abefe5b1d1eb5aedcc2a1d895f5c667aa71ed28
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
<<<<<<< HEAD
L412:
=======
L89:
>>>>>>> 5abefe5b1d1eb5aedcc2a1d895f5c667aa71ed28
sw $a0, 40($fp)
sw $a1, 44($fp)
move $s0, $a2
lw $s0, 44($fp)
li $s1, 0
<<<<<<< HEAD
bgt $s0, $s1, L381
j L382
L382:
li $s0, 0
move $v0, $s0
j L411
L381:
lw $s0, 40($fp)
>>>>>>> Stashed changes
move $a0, $s0
lw $s0, -8($fp)
=======
bgt $s0, $s1, L58
j L59
L59:
li $s0, 0
move $v0, $s0
j L88
L58:
lw $s0, 40($fp)
move $a0, $s0
lw $s0, 44($fp)
>>>>>>> 5abefe5b1d1eb5aedcc2a1d895f5c667aa71ed28
li $s1, 10
div $s0, $s1
mflo $s0
move $a1, $s0
<<<<<<< HEAD
<<<<<<< Updated upstream
jal L986
=======
jal L380
>>>>>>> Stashed changes
move $s0, $v0
lw $s0, -8($fp)
lw $s1, -8($fp)
=======
jal L57
move $s0, $v0
lw $s0, 44($fp)
lw $s1, 44($fp)
>>>>>>> 5abefe5b1d1eb5aedcc2a1d895f5c667aa71ed28
li $s2, 10
div $s1, $s2
mflo $s1
li $s2, 10
mul $s1, $s1, $s2 
sub $s0, $s0, $s1 
move $s0, $s0
<<<<<<< HEAD
<<<<<<< Updated upstream
la $s1, L958
=======
la $s1, L326
>>>>>>> Stashed changes
=======
la $s1, L3
>>>>>>> 5abefe5b1d1eb5aedcc2a1d895f5c667aa71ed28
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
<<<<<<< HEAD
<<<<<<< Updated upstream
j L988
L1015:
=======
j L382
L411:
>>>>>>> Stashed changes
=======
j L59
L88:
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
addi $sp, $sp, 48
jr $ra
<<<<<<< HEAD
<<<<<<< Updated upstream
.globl L979
L979:
=======
.globl L348
L348:
>>>>>>> Stashed changes
=======
.globl L25
L25:
>>>>>>> 5abefe5b1d1eb5aedcc2a1d895f5c667aa71ed28
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
<<<<<<< HEAD
<<<<<<< Updated upstream
L1018:
sw $a0, -4($fp)
sw $a1, -8($fp)
=======
L414:
sw $a0, 40($fp)
sw $a1, 44($fp)
>>>>>>> Stashed changes
move $s0, $a2
lw $s0, -8($fp)
li $s1, 0
<<<<<<< Updated upstream
blt $s0, $s1, L993
j L994
L994:
lw $s0, -8($fp)
li $s1, 0
bgt $s0, $s1, L990
j L991
L991:
la $s0, L958
=======
blt $s0, $s1, L387
j L388
L388:
lw $s0, 44($fp)
li $s1, 0
bgt $s0, $s1, L384
j L385
L385:
la $s0, L326
>>>>>>> Stashed changes
=======
L91:
sw $a0, 40($fp)
sw $a1, 44($fp)
move $s0, $a2
lw $s0, 44($fp)
li $s1, 0
blt $s0, $s1, L64
j L65
L65:
lw $s0, 44($fp)
li $s1, 0
bgt $s0, $s1, L61
j L62
L62:
la $s0, L3
>>>>>>> 5abefe5b1d1eb5aedcc2a1d895f5c667aa71ed28
move $a0, $s0
jal tig_print
move $s0, $v0
move $s0, $s0
<<<<<<< HEAD
<<<<<<< Updated upstream
L992:
move $s0, $s0
L995:
move $v0, $s0
j L1017
L993:
la $s0, L989
=======
L386:
move $s0, $s0
L389:
move $v0, $s0
j L413
L387:
la $s0, L383
>>>>>>> Stashed changes
=======
L63:
move $s0, $s0
L66:
move $v0, $s0
j L90
L64:
la $s0, L60
>>>>>>> 5abefe5b1d1eb5aedcc2a1d895f5c667aa71ed28
move $a0, $s0
jal tig_print
move $s0, $v0
move $a0, $fp
li $s0, 0
<<<<<<< HEAD
lw $s1, -8($fp)
sub $s0, $s0, $s1 
move $a1, $s0
<<<<<<< Updated upstream
jal L986
move $s0, $v0
move $s0, $s0
j L995
L990:
=======
jal L380
move $s0, $v0
move $s0, $s0
j L389
L384:
>>>>>>> Stashed changes
move $a0, $fp
lw $s0, -8($fp)
move $a1, $s0
<<<<<<< Updated upstream
jal L986
move $s0, $v0
move $s0, $s0
j L992
L1017:
=======
jal L380
move $s0, $v0
move $s0, $s0
j L386
L413:
>>>>>>> Stashed changes
=======
lw $s1, 44($fp)
sub $s0, $s0, $s1 
move $a1, $s0
jal L57
move $s0, $v0
move $s0, $s0
j L66
L61:
move $a0, $fp
lw $s0, 44($fp)
move $a1, $s0
jal L57
move $s0, $v0
move $s0, $s0
j L63
L90:
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
addi $sp, $sp, 48
jr $ra
<<<<<<< HEAD
<<<<<<< Updated upstream
.globl L980
L980:
=======
.globl L349
L349:
>>>>>>> Stashed changes
=======
.globl L26
L26:
>>>>>>> 5abefe5b1d1eb5aedcc2a1d895f5c667aa71ed28
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
<<<<<<< HEAD
<<<<<<< Updated upstream
L1020:
sw $a0, -4($fp)
sw $a1, -8($fp)
=======
L416:
sw $a0, 40($fp)
sw $a1, 44($fp)
>>>>>>> Stashed changes
move $s0, $a2
lw $s0, -8($fp)
li $s1, 0
<<<<<<< Updated upstream
beq $s0, $s1, L1004
j L1005
L1005:
lw $s0, -4($fp)
=======
beq $s0, $s1, L398
j L399
L399:
lw $s0, 40($fp)
>>>>>>> Stashed changes
move $s0, $s0
lw $s1, -8($fp)
move $s1, $s1
li $s2, 0
<<<<<<< Updated upstream
beq $s1, $s2, L997
j L996
L996:
move $a0, $s0
lw $s0, 0($s1)
move $a1, $s0
jal L979
move $s0, $v0
la $s0, L965
=======
beq $s1, $s2, L391
j L390
L390:
move $a0, $s0
lw $s0, 0($s1)
move $a1, $s0
jal L348
move $s0, $v0
la $s0, L333
>>>>>>> Stashed changes
move $a0, $s0
jal tig_print
move $s0, $v0
lw $s0, -4($fp)
move $s0, $s0
lw $s1, -8($fp)
move $s1, $s1
li $s2, 0
<<<<<<< Updated upstream
beq $s1, $s2, L1001
j L1000
L1000:
move $a0, $s0
lw $s0, 4($s1)
move $a1, $s0
jal L980
move $s0, $v0
move $s0, $s0
L1006:
move $v0, $s0
j L1019
L1004:
la $s0, L966
=======
beq $s1, $s2, L395
j L394
L394:
move $a0, $s0
lw $s0, 4($s1)
move $a1, $s0
jal L349
move $s0, $v0
move $s0, $s0
L400:
move $v0, $s0
j L415
L398:
la $s0, L334
>>>>>>> Stashed changes
=======
L93:
sw $a0, 40($fp)
sw $a1, 44($fp)
move $s0, $a2
lw $s0, 44($fp)
li $s1, 0
beq $s0, $s1, L75
j L76
L76:
lw $s0, 40($fp)
move $s0, $s0
lw $s1, 44($fp)
move $s1, $s1
li $s2, 0
beq $s1, $s2, L68
j L67
L67:
move $a0, $s0
lw $s0, 0($s1)
move $a1, $s0
jal L25
move $s0, $v0
la $s0, L10
move $a0, $s0
jal tig_print
move $s0, $v0
lw $s0, 40($fp)
move $s0, $s0
lw $s1, 44($fp)
move $s1, $s1
li $s2, 0
beq $s1, $s2, L72
j L71
L71:
move $a0, $s0
lw $s0, 4($s1)
move $a1, $s0
jal L26
move $s0, $v0
move $s0, $s0
L77:
move $v0, $s0
j L92
L75:
la $s0, L11
>>>>>>> 5abefe5b1d1eb5aedcc2a1d895f5c667aa71ed28
move $a0, $s0
jal tig_print
move $s0, $v0
move $s0, $s0
<<<<<<< HEAD
<<<<<<< Updated upstream
j L1006
L997:
jal tig_nilerror
move $s2, $v0
j L996
L1001:
jal tig_nilerror
move $s2, $v0
j L1000
L1019:
=======
j L400
L391:
jal tig_nilerror
move $s2, $v0
j L390
L395:
jal tig_nilerror
move $s2, $v0
j L394
L415:
>>>>>>> Stashed changes
=======
j L77
L68:
jal tig_nilerror
move $s2, $v0
j L67
L72:
jal tig_nilerror
move $s2, $v0
j L71
L92:
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
<<<<<<< HEAD
<<<<<<< Updated upstream
L1022:
sw $a0, -4($fp)
addi $s0, $fp, -8
=======
L418:
sw $a0, 40($fp)
addi $s0, $fp, 44
>>>>>>> Stashed changes
=======
L95:
sw $a0, 40($fp)
addi $s0, $fp, 44
>>>>>>> 5abefe5b1d1eb5aedcc2a1d895f5c667aa71ed28
move $s0, $s0
jal tig_getchar
move $s1, $v0
move $s1, $s1
sw $s1, 0($s0)
move $a0, $fp
<<<<<<< HEAD
<<<<<<< Updated upstream
jal L978
move $s0, $v0
move $s0, $s0
move $a0, $fp
move $a1, $s0
jal L980
move $s0, $v0
move $v0, $s0
j L1021
L1021:
=======
jal L346
=======
jal L23
>>>>>>> 5abefe5b1d1eb5aedcc2a1d895f5c667aa71ed28
move $s0, $v0
move $s0, $s0
addi $s1, $fp, 44
move $s1, $s1
jal tig_getchar
move $s2, $v0
move $s2, $s2
sw $s2, 0($s1)
move $a0, $fp
<<<<<<< HEAD
jal L346
=======
jal L23
>>>>>>> 5abefe5b1d1eb5aedcc2a1d895f5c667aa71ed28
move $s1, $v0
move $s1, $s1
move $s2, $fp
move $a0, $fp
move $a1, $s0
move $a2, $s1
<<<<<<< HEAD
jal L347
=======
jal L24
>>>>>>> 5abefe5b1d1eb5aedcc2a1d895f5c667aa71ed28
move $s0, $v0
move $s0, $s0
move $a0, $s2
move $a1, $s0
<<<<<<< HEAD
jal L349
move $s0, $v0
move $v0, $s0
j L417
L417:
>>>>>>> Stashed changes
=======
jal L26
move $s0, $v0
move $v0, $s0
j L94
L94:
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
addi $sp, $sp, 48
jr $ra
