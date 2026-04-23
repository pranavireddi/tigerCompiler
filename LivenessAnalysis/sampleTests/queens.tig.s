L133: .asciiz " O"
L134: .asciiz " ."
L140: .asciiz " O"
L141: .asciiz " ."
L148: .asciiz "
"
L149: .asciiz "
"
L153: .asciiz "
"
L154: .asciiz "
"
L195:
li t418, 0
move t393, t418
lw t421, -4(t130)
lw t420, -8(t421)
addi t419, t420, -1
move t400, t419
ble t393, t400, L151
j L129
L129:
li t423, 0
move t104, t423
la t424, L153
move t105, t424
jal print
move t422, t102
move t102, t422
j L194
L151:
li t425, 0
move t394, t425
lw t428, -4(t130)
lw t427, -8(t428)
addi t426, t427, -1
move t399, t426
ble t394, t399, L146
j L130
L130:
li t430, 0
move t104, t430
la t431, L148
move t105, t431
jal print
move t429, t102
bge t393, t400, L129
j L152
L152:
addi t432, t393, 1
move t393, t432
j L151
L146:
lw t434, -4(t130)
lw t433, -16(t434)
move t395, t433
li t435, 0
beq t395, t435, L132
j L131
L131:
li t439, 4
mul t438, t393, t439 
add t437, t395, t438 
lw t436, 0(t437)
beq t436, t394, L135
j L136
L136:
la t440, L134
move t396, t440
L137:
li t442, 0
move t104, t442
move t105, t396
jal print
move t441, t102
bge t394, t399, L130
j L147
L147:
addi t443, t394, 1
move t394, t443
j L146
L132:
jal nilerror
move t444, t102
j L131
L135:
la t445, L133
move t396, t445
j L137
L194:
L197:
lw t447, -4(t130)
lw t446, -8(t447)
beq t392, t446, L191
j L192
L192:
li t448, 0
move t401, t448
lw t451, -4(t130)
lw t450, -8(t451)
addi t449, t450, -1
move t416, t449
ble t401, t416, L189
j L155
L155:
li t452, 0
move t417, t452
L193:
move t102, t417
j L196
L191:
lw t454, -4(t130)
move t104, t454
jal L127
move t453, t102
move t417, t453
j L193
L189:
lw t456, -4(t130)
lw t455, -12(t456)
move t402, t455
li t457, 0
beq t402, t457, L157
j L156
L156:
li t461, 4
mul t460, t401, t461 
add t459, t402, t460 
lw t458, 0(t459)
li t462, 0
beq t458, t462, L160
j L161
L161:
li t463, 0
move t404, t463
L162:
li t464, 0
bne t404, t464, L167
j L168
L168:
li t465, 0
move t407, t465
L169:
li t466, 0
bne t407, t466, L186
j L187
L187:
bge t401, t416, L155
j L190
L190:
addi t467, t401, 1
move t401, t467
j L189
L157:
jal nilerror
move t468, t102
j L156
L160:
li t469, 1
move t405, t469
lw t471, -4(t130)
lw t470, -20(t471)
move t403, t470
li t472, 0
beq t403, t472, L159
j L158
L158:
add t476, t401, t392 
li t477, 4
mul t475, t476, t477 
add t474, t403, t475 
lw t473, 0(t474)
li t478, 0
beq t473, t478, L163
j L164
L164:
li t479, 0
move t405, t479
L163:
move t404, t405
j L162
L159:
jal nilerror
move t480, t102
j L158
L167:
li t481, 1
move t408, t481
lw t483, -4(t130)
lw t482, -24(t483)
move t406, t482
li t484, 0
beq t406, t484, L166
j L165
L165:
addi t489, t401, 7
sub t488, t489, t392 
li t490, 4
mul t487, t488, t490 
add t486, t406, t487 
lw t485, 0(t486)
li t491, 0
beq t485, t491, L170
j L171
L171:
li t492, 0
move t408, t492
L170:
move t407, t408
j L169
L166:
jal nilerror
move t493, t102
j L165
L186:
lw t495, -4(t130)
lw t494, -12(t495)
move t409, t494
li t496, 0
beq t409, t496, L173
j L172
L172:
li t497, 1
li t500, 4
mul t499, t401, t500 
add t498, t409, t499 
sw t497, 0(t498)
lw t502, -4(t130)
lw t501, -20(t502)
move t410, t501
li t503, 0
beq t410, t503, L175
j L174
L174:
li t504, 1
add t507, t401, t392 
li t508, 4
mul t506, t507, t508 
add t505, t410, t506 
sw t504, 0(t505)
lw t510, -4(t130)
lw t509, -24(t510)
move t411, t509
li t511, 0
beq t411, t511, L177
j L176
L176:
li t512, 1
addi t516, t401, 7
sub t515, t516, t392 
li t517, 4
mul t514, t515, t517 
add t513, t411, t514 
sw t512, 0(t513)
lw t519, -4(t130)
lw t518, -16(t519)
move t412, t518
li t520, 0
beq t412, t520, L179
j L178
L178:
li t523, 4
mul t522, t392, t523 
add t521, t412, t522 
sw t401, 0(t521)
lw t525, -4(t130)
move t104, t525
addi t526, t392, 1
move t105, t526
jal L128
move t524, t102
lw t528, -4(t130)
lw t527, -12(t528)
move t413, t527
li t529, 0
beq t413, t529, L181
j L180
L180:
li t530, 0
li t533, 4
mul t532, t401, t533 
add t531, t413, t532 
sw t530, 0(t531)
lw t535, -4(t130)
lw t534, -20(t535)
move t414, t534
li t536, 0
beq t414, t536, L183
j L182
L182:
li t537, 0
add t540, t401, t392 
li t541, 4
mul t539, t540, t541 
add t538, t414, t539 
sw t537, 0(t538)
lw t543, -4(t130)
lw t542, -24(t543)
move t415, t542
li t544, 0
beq t415, t544, L185
j L184
L184:
li t545, 0
addi t549, t401, 7
sub t548, t549, t392 
li t550, 4
mul t547, t548, t550 
add t546, t415, t547 
sw t545, 0(t546)
j L187
L173:
jal nilerror
move t551, t102
j L172
L175:
jal nilerror
move t552, t102
j L174
L177:
jal nilerror
move t553, t102
j L176
L179:
jal nilerror
move t554, t102
j L178
L181:
jal nilerror
move t555, t102
j L180
L183:
jal nilerror
move t556, t102
j L182
L185:
jal nilerror
move t557, t102
j L184
L196:
L199:
li t566, 8
sw t566, -8(t130)
addi t567, t130, -12
move t559, t567
lw t569, -8(t130)
move t104, t569
li t570, 0
move t105, t570
jal initArray
move t568, t102
move t558, t568
sw t558, 0(t559)
addi t571, t130, -16
move t561, t571
lw t573, -8(t130)
move t104, t573
li t574, 0
move t105, t574
jal initArray
move t572, t102
move t560, t572
sw t560, 0(t561)
addi t575, t130, -20
move t563, t575
lw t579, -8(t130)
lw t580, -8(t130)
add t578, t579, t580 
addi t577, t578, -1
move t104, t577
li t581, 0
move t105, t581
jal initArray
move t576, t102
move t562, t576
sw t562, 0(t563)
addi t582, t130, -24
move t565, t582
lw t586, -8(t130)
lw t587, -8(t130)
add t585, t586, t587 
addi t584, t585, -1
move t104, t584
li t588, 0
move t105, t588
jal initArray
move t583, t102
move t564, t583
sw t564, 0(t565)
move t104, t130
li t590, 0
move t105, t590
jal L128
move t589, t102
move t102, t589
j L198
L198:
