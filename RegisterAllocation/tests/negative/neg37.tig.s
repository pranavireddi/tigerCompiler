L2002:
li $s0, 0
beq $s1, $s0, L1968
j L1969
L1969:
lw $s0, -4($fp)
move $a0, $s0
addi $s0, $s1, -1
move $a1, $s0
jal L1967
move $s0, $v0
move $s0, $s0
L1970:
move $v0, $s0
j L2001
L1968:
li $s0, 1
move $s0, $s0
j L1970
L2001:
L2004:
li $s0, 0
beq $s1, $s0, L1971
j L1972
L1972:
lw $s0, -4($fp)
move $a0, $s0
addi $s0, $s1, -1
move $a1, $s0
jal L1966
move $s0, $v0
move $s0, $s0
L1973:
move $v0, $s0
j L2003
L1971:
li $s0, 0
move $s0, $s0
j L1973
L2003:
L1974: .asciiz "hello"
L1976: .asciiz "shadowing is legal"
L1991: .asciiz "Senior"
L1992: .asciiz "Senior"
L1993: .asciiz "Junior"
L1994: .asciiz "Junior"
L2006:
li $s0, 8
move $a0, $s0
jal allocRecord
move $s0, $v0
move $s0, $s0
la $s1, L1974
sw $s1, 0($s0)
li $s1, 1
sw $s1, 4($s0)
move $s0, $s0
li $s1, 10
move $a0, $s1
li $s1, 0
move $a1, $s1
jal initArray
move $s1, $v0
move $s1, $s1
li $s2, 5
move $s2, $s2
li $s3, 0
move $s3, $s3
li $s4, 10
move $s4, $s4
ble $s3, $s4, L1978
j L1975
L1975:
L1983:
li $s3, 0
bgt $s2, $s3, L1984
j L1980
L1980:
move $s0, $s0
li $s3, 0
beq $s0, $s3, L1986
j L1985
L1985:
addi $s3, $s0, 4
move $s3, $s3
move $s1, $s1
li $s4, 0
beq $s1, $s4, L1988
j L1987
L1987:
li $s4, 0
li $s5, 4
mul $s4, $s4, $s5 
add $s1, $s1, $s4 
lw $s1, 0($s1)
add $s1, $s1, $s2 
sw $s1, 0($s3)
move $s0, $s0
li $s1, 0
beq $s0, $s1, L1990
j L1989
L1989:
lw $s0, 4($s0)
li $s1, 20
bgt $s0, $s1, L1995
j L1996
L1996:
li $s0, 0
move $a0, $s0
la $s0, L1993
move $a1, $s0
jal print
move $s0, $v0
move $s0, $s0
L1997:
li $s0, 0
move $s0, $s0
li $s1, 0
beq $s0, $s1, L1998
j L1999
L1999:
li $s0, 0
move $s2, $s0
li $s0, 0
move $s0, $s0
L2000:
move $a0, $fp
move $a1, $s2
jal L1966
move $s0, $v0
move $v0, $s0
j L2005
L1978:
la $s5, L1976
move $s5, $s5
li $s6, 0
move $a0, $s6
move $a1, $s5
jal print
move $s5, $v0
bge $s3, $s4, L1975
j L1979
L1979:
addi $s3, $s3, 1
move $s3, $s3
j L1978
L1984:
li $s3, 2
beq $s2, $s3, L1981
j L1982
L1982:
addi $s2, $s2, -1
move $s2, $s2
j L1983
L1981:
j L1980
L1986:
jal nilerror
move $s3, $v0
j L1985
L1988:
jal nilerror
move $s4, $v0
j L1987
L1990:
jal nilerror
move $s1, $v0
j L1989
L1995:
li $s0, 0
move $a0, $s0
la $s0, L1991
move $a1, $s0
jal print
move $s0, $v0
move $s0, $s0
j L1997
L1998:
li $s0, 1
move $s2, $s0
li $s0, 0
move $s0, $s0
j L2000
L2005:
