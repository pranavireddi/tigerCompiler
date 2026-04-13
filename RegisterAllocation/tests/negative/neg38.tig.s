L2050:
li $s0, 0
move $v0, $s0
j L2049
L2049:
L2041: .asciiz "fail"
L2042: .asciiz "fail"
L2052:
li $s0, 0
move $v0, $s0
j L2051
L2051:
L2054:
li $s0, 0
move $s0, $s0
L2010:
L2011:
li $s1, 10
bgt $s0, $s1, L2008
j L2009
L2009:
addi $s0, $s0, 1
move $s0, $s0
j L2010
L2008:
L2007:
li $s1, 0
move $s1, $s1
li $s2, 10
move $s2, $s2
ble $s1, $s2, L2016
j L2012
L2012:
li $s1, 0
move $s1, $s1
li $s2, 10
move $s2, $s2
ble $s1, $s2, L2021
j L2018
L2018:
L2032:
L2033:
li $s1, 0
move $s1, $s1
li $s2, 10
move $s2, $s2
ble $s1, $s2, L2028
j L2024
L2024:
li $s1, 100
bgt $s0, $s1, L2030
j L2031
L2031:
j L2032
L2016:
li $s3, 5
beq $s1, $s3, L2013
j L2014
L2014:
bge $s1, $s2, L2012
j L2017
L2017:
addi $s1, $s1, 1
move $s1, $s1
j L2016
L2013:
j L2012
L2021:
move $a0, $fp
jal L2019
move $s3, $v0
bge $s1, $s2, L2018
j L2022
L2022:
addi $s1, $s1, 1
move $s1, $s1
j L2021
L2028:
li $s3, 5
beq $s1, $s3, L2025
j L2026
L2026:
addi $s0, $s0, 1
move $s0, $s0
bge $s1, $s2, L2024
j L2029
L2029:
addi $s1, $s1, 1
move $s1, $s1
j L2028
L2025:
j L2024
L2030:
L2023:
li $s1, 0
move $s1, $s1
li $s2, 10
move $s2, $s2
ble $s1, $s2, L2038
j L2034
L2034:
L2043:
L2044:
L2040:
L2047:
L2048:
move $a0, $fp
jal L2046
move $s0, $v0
j L2047
L2038:
li $s3, 0
move $s3, $s3
li $s4, 0
beq $s3, $s4, L2035
j L2036
L2036:
bge $s1, $s2, L2034
j L2039
L2039:
addi $s1, $s1, 1
move $s1, $s1
j L2038
L2035:
addi $s0, $s0, 1
move $s0, $s0
j L2034
L2055:
li $s0, 5
move $s0, $s0
li $s0, 0
move $a0, $s0
la $s0, L2041
move $a1, $s0
jal print
move $s0, $v0
j L2043
L2045:
li $s0, 0
move $v0, $s0
j L2053
L2053:
