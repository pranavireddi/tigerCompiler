L16: .asciiz "0"
L17: .asciiz "0"
L18: .asciiz "9"
L19: .asciiz "9"
L111:
li t188, 0
move t104, t188
lw t191, -4(t130)
lw t190, -4(t191)
lw t189, -8(t190)
move t105, t189
jal ord
move t187, t102
move t181, t187
move t183, t181
li t193, 0
move t104, t193
la t194, L16
move t105, t194
jal ord
move t192, t102
move t182, t192
bge t183, t182, L20
j L21
L21:
li t195, 0
move t144, t195
L22:
move t102, t144
j L110
L20:
li t196, 1
move t145, t196
li t198, 0
move t104, t198
lw t201, -4(t130)
lw t200, -4(t201)
lw t199, -8(t200)
move t105, t199
jal ord
move t197, t102
move t184, t197
move t186, t184
li t203, 0
move t104, t203
la t204, L18
move t105, t204
jal ord
move t202, t102
move t185, t202
ble t186, t185, L23
j L24
L24:
li t205, 0
move t145, t205
L23:
move t144, t145
j L22
L110:
L25: .asciiz " "
L26: .asciiz "
"
L31:
lw t212, -4(t130)
lw t211, -4(t212)
lw t210, -8(t211)
move t104, t210
la t213, L25
move t105, t213
jal stringEqual
move t209, t102
move t206, t209
li t214, 0
bne t206, t214, L27
j L28
L28:
lw t218, -4(t130)
lw t217, -4(t218)
lw t216, -8(t217)
move t104, t216
la t219, L26
move t105, t219
jal stringEqual
move t215, t102
move t146, t215
L29:
li t220, 0
bne t146, t220, L32
j L30
L30:
li t221, 0
move t102, t221
j L112
L27:
li t222, 1
move t146, t222
j L29
L32:
lw t225, -4(t130)
lw t224, -4(t225)
addi t223, t224, -8
move t208, t223
li t227, 0
move t104, t227
jal getchar
move t226, t102
move t207, t226
sw t207, 0(t208)
j L31
L112:
L36: .asciiz "0"
L37: .asciiz "0"
L114:
li t237, 0
move t142, t237
move t104, t130
jal L15
move t238, t102
move t147, t141
li t239, 0
beq t147, t239, L34
j L33
L33:
addi t240, t147, 0
move t229, t240
move t104, t130
lw t243, -4(t130)
lw t242, -8(t243)
move t105, t242
jal L14
move t241, t102
move t228, t241
sw t228, 0(t229)
L38:
move t104, t130
lw t246, -4(t130)
lw t245, -8(t246)
move t105, t245
jal L14
move t244, t102
move t230, t244
li t247, 0
bne t230, t247, L39
j L35
L35:
move t102, t142
j L113
L34:
jal nilerror
move t248, t102
j L33
L39:
li t250, 10
mul t249, t142, t250 
move t232, t249
li t252, 0
move t104, t252
lw t254, -4(t130)
lw t253, -8(t254)
move t105, t253
jal ord
move t251, t102
move t231, t251
add t255, t232, t231 
move t234, t255
li t257, 0
move t104, t257
la t258, L36
move t105, t258
jal ord
move t256, t102
move t233, t256
sub t259, t234, t233 
move t142, t259
lw t261, -4(t130)
addi t260, t261, -8
move t236, t260
li t263, 0
move t104, t263
jal getchar
move t262, t102
move t235, t262
sw t235, 0(t236)
j L38
L113:
L116:
li t267, 4
move t104, t267
jal allocRecord
move t266, t102
move t152, t266
li t268, 0
sw t268, 0(t152)
move t153, t152
lw t270, -4(t130)
move t104, t270
move t105, t153
jal L13
move t269, t102
move t154, t269
move t155, t153
li t271, 0
beq t155, t271, L45
j L44
L44:
lw t272, 0(t155)
li t273, 0
bne t272, t273, L46
j L47
L47:
li t274, 0
move t157, t274
L48:
move t102, t157
j L115
L45:
jal nilerror
move t275, t102
j L44
L46:
li t277, 8
move t104, t277
jal allocRecord
move t276, t102
move t156, t276
sw t154, 0(t156)
addi t278, t156, 4
move t265, t278
lw t280, -4(t130)
move t104, t280
jal L40
move t279, t102
move t264, t279
sw t264, 0(t265)
move t157, t156
j L48
L115:
L118:
li t291, 0
beq t148, t291, L71
j L72
L72:
li t292, 0
beq t149, t292, L68
j L69
L69:
move t158, t148
li t293, 0
beq t158, t293, L50
j L49
L49:
lw t294, 0(t158)
move t281, t294
move t159, t149
li t295, 0
beq t159, t295, L52
j L51
L51:
lw t296, 0(t159)
blt t281, t296, L65
j L66
L66:
li t298, 8
move t104, t298
jal allocRecord
move t297, t102
move t167, t297
addi t299, t167, 0
move t286, t299
move t164, t149
li t300, 0
beq t164, t300, L60
j L59
L59:
lw t301, 0(t164)
sw t301, 0(t286)
addi t302, t167, 4
move t290, t302
lw t303, -4(t130)
move t289, t303
move t288, t148
move t165, t149
li t304, 0
beq t165, t304, L62
j L61
L61:
move t104, t289
move t105, t288
lw t306, 4(t165)
move t106, t306
jal L41
move t305, t102
move t287, t305
sw t287, 0(t290)
move t168, t167
L67:
move t169, t168
L70:
move t170, t169
L73:
move t102, t170
j L117
L71:
move t170, t149
j L73
L68:
move t169, t148
j L70
L50:
jal nilerror
move t307, t102
j L49
L52:
jal nilerror
move t308, t102
j L51
L65:
li t310, 8
move t104, t310
jal allocRecord
move t309, t102
move t163, t309
addi t311, t163, 0
move t282, t311
move t160, t148
li t312, 0
beq t160, t312, L54
j L53
L53:
lw t313, 0(t160)
sw t313, 0(t282)
addi t314, t163, 4
move t285, t314
lw t315, -4(t130)
move t284, t315
move t161, t148
li t316, 0
beq t161, t316, L56
j L55
L55:
move t104, t284
lw t318, 4(t161)
move t105, t318
move t106, t149
jal L41
move t317, t102
move t283, t317
sw t283, 0(t285)
move t168, t163
j L67
L54:
jal nilerror
move t319, t102
j L53
L56:
jal nilerror
move t320, t102
j L55
L60:
jal nilerror
move t321, t102
j L59
L62:
jal nilerror
move t322, t102
j L61
L117:
L75: .asciiz "0"
L76: .asciiz "0"
L77: .asciiz "0"
L78: .asciiz "0"
L79: .asciiz "0"
L80: .asciiz "0"
L81: .asciiz "0"
L82: .asciiz "0"
L120:
li t326, 0
bgt t171, t326, L83
j L84
L84:
li t327, 0
move t102, t327
j L119
L83:
lw t329, -4(t130)
move t104, t329
li t331, 10
div t171, t331
mflo t330
move t105, t330
jal L74
move t328, t102
li t335, 10
div t171, t335
mflo t334
li t336, 10
mul t333, t334, t336 
sub t332, t171, t333 
move t325, t332
li t338, 0
move t104, t338
la t339, L75
move t105, t339
jal ord
move t337, t102
move t324, t337
li t341, 0
move t104, t341
add t342, t325, t324 
move t105, t342
jal chr
move t340, t102
move t323, t340
li t344, 0
move t104, t344
move t105, t323
jal print
move t343, t102
j L84
L119:
L85: .asciiz "-"
L86: .asciiz "-"
L87: .asciiz "0"
L88: .asciiz "0"
L122:
li t345, 0
blt t150, t345, L92
j L93
L93:
li t346, 0
bgt t150, t346, L89
j L90
L90:
li t348, 0
move t104, t348
la t349, L87
move t105, t349
jal print
move t347, t102
move t172, t347
L91:
move t173, t172
L94:
move t102, t173
j L121
L92:
li t351, 0
move t104, t351
la t352, L85
move t105, t352
jal print
move t350, t102
move t104, t130
li t355, 0
sub t354, t355, t150 
move t105, t354
jal L74
move t353, t102
move t173, t353
j L94
L89:
move t104, t130
move t105, t150
jal L74
move t356, t102
move t172, t356
j L91
L121:
L95: .asciiz "
"
L96: .asciiz "
"
L101: .asciiz " "
L102: .asciiz " "
L124:
li t359, 0
beq t151, t359, L107
j L108
L108:
lw t360, -4(t130)
move t357, t360
move t174, t151
li t361, 0
beq t174, t361, L98
j L97
L97:
move t104, t357
lw t363, 0(t174)
move t105, t363
jal L42
move t362, t102
li t365, 0
move t104, t365
la t366, L101
move t105, t366
jal print
move t364, t102
lw t367, -4(t130)
move t358, t367
move t176, t151
li t368, 0
beq t176, t368, L104
j L103
L103:
move t104, t358
lw t370, 4(t176)
move t105, t370
jal L43
move t369, t102
move t178, t369
L109:
move t102, t178
j L123
L107:
li t372, 0
move t104, t372
la t373, L95
move t105, t373
jal print
move t371, t102
move t178, t371
j L109
L98:
jal nilerror
move t374, t102
j L97
L104:
jal nilerror
move t375, t102
j L103
L123:
L126:
addi t382, t130, -8
move t377, t382
li t384, 0
move t104, t384
jal getchar
move t383, t102
move t376, t383
sw t376, 0(t377)
move t104, t130
jal L40
move t385, t102
move t179, t385
addi t386, t130, -8
move t379, t386
li t388, 0
move t104, t388
jal getchar
move t387, t102
move t378, t387
sw t378, 0(t379)
move t104, t130
jal L40
move t389, t102
move t180, t389
move t381, t130
move t104, t130
move t105, t179
move t106, t180
jal L41
move t390, t102
move t380, t390
move t104, t381
move t105, t380
jal L43
move t391, t102
move t102, t391
j L125
L125:
