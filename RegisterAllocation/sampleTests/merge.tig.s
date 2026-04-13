L2281: .asciiz "0"
L2282: .asciiz "0"
L2283: .asciiz "9"
L2284: .asciiz "9"
L2376:
li $s0, 0
move $a0, $s0
lw $s0, -4($fp)
lw $s0, -4($s0)
lw $s0, -8($s0)
move $a1, $s0
jal ord
move $s0, $v0
move $s0, $s0
move $s0, $s0
li $s1, 0
move $a0, $s1
la $s1, L2281
move $a1, $s1
jal ord
move $s1, $v0
move $s1, $s1
bge $s0, $s1, L2285
j L2286
L2286:
li $s0, 0
move $s0, $s0
L2287:
move $v0, $s0
j L2375
L2285:
li $s0, 1
move $s0, $s0
li $s1, 0
move $a0, $s1
lw $s1, -4($fp)
lw $s1, -4($s1)
lw $s1, -8($s1)
move $a1, $s1
jal ord
move $s1, $v0
move $s1, $s1
move $s1, $s1
li $s2, 0
move $a0, $s2
la $s2, L2283
move $a1, $s2
jal ord
move $s2, $v0
move $s2, $s2
ble $s1, $s2, L2288
j L2289
L2289:
li $s0, 0
move $s0, $s0
L2288:
move $s0, $s0
j L2287
L2375:
L2290: .asciiz " "
L2291: .asciiz "
"
L2296:
lw $s0, -4($fp)
lw $s0, -4($s0)
lw $s0, -8($s0)
move $a0, $s0
la $s0, L2290
move $a1, $s0
jal stringEqual
move $s0, $v0
move $s0, $s0
li $s1, 0
bne $s0, $s1, L2292
j L2293
L2293:
lw $s0, -4($fp)
lw $s0, -4($s0)
lw $s0, -8($s0)
move $a0, $s0
la $s0, L2291
move $a1, $s0
jal stringEqual
move $s0, $v0
move $s0, $s0
L2294:
li $s1, 0
bne $s0, $s1, L2297
j L2295
L2295:
li $s0, 0
move $v0, $s0
j L2377
L2292:
li $s0, 1
move $s0, $s0
j L2294
L2297:
lw $s0, -4($fp)
lw $s0, -4($s0)
addi $s0, $s0, -8
move $s0, $s0
li $s1, 0
move $a0, $s1
jal getchar
move $s1, $v0
move $s1, $s1
sw $s1, 0($s0)
j L2296
L2377:
L2301: .asciiz "0"
L2302: .asciiz "0"
L2379:
li $s0, 0
move $s0, $s0
move $a0, $fp
jal L2280
move $s1, $v0
move $s1, $s2
li $s2, 0
beq $s1, $s2, L2299
j L2298
L2298:
addi $s1, $s1, 0
move $s1, $s1
move $a0, $fp
lw $s2, -4($fp)
lw $s2, -8($s2)
move $a1, $s2
jal L2279
move $s2, $v0
move $s2, $s2
sw $s2, 0($s1)
L2303:
move $a0, $fp
lw $s1, -4($fp)
lw $s1, -8($s1)
move $a1, $s1
jal L2279
move $s1, $v0
move $s1, $s1
li $s2, 0
bne $s1, $s2, L2304
j L2300
L2300:
move $v0, $s0
j L2378
L2299:
jal nilerror
move $s2, $v0
j L2298
L2304:
li $s1, 10
mul $s0, $s0, $s1 
move $s0, $s0
li $s1, 0
move $a0, $s1
lw $s1, -4($fp)
lw $s1, -8($s1)
move $a1, $s1
jal ord
move $s1, $v0
move $s1, $s1
add $s0, $s0, $s1 
move $s0, $s0
li $s1, 0
move $a0, $s1
la $s1, L2301
move $a1, $s1
jal ord
move $s1, $v0
move $s1, $s1
sub $s0, $s0, $s1 
move $s0, $s0
lw $s1, -4($fp)
addi $s1, $s1, -8
move $s1, $s1
li $s2, 0
move $a0, $s2
jal getchar
move $s2, $v0
move $s2, $s2
sw $s2, 0($s1)
j L2303
L2378:
L2381:
li $s0, 4
move $a0, $s0
jal allocRecord
move $s0, $v0
move $s0, $s0
li $s1, 0
sw $s1, 0($s0)
move $s0, $s0
lw $s1, -4($fp)
move $a0, $s1
move $a1, $s0
jal L2278
move $s1, $v0
move $s1, $s1
move $s0, $s0
li $s2, 0
beq $s0, $s2, L2310
j L2309
L2309:
lw $s0, 0($s0)
li $s2, 0
bne $s0, $s2, L2311
j L2312
L2312:
li $s0, 0
move $s0, $s0
L2313:
move $v0, $s0
j L2380
L2310:
jal nilerror
move $s2, $v0
j L2309
L2311:
li $s0, 8
move $a0, $s0
jal allocRecord
move $s0, $v0
move $s0, $s0
sw $s1, 0($s0)
addi $s1, $s0, 4
move $s1, $s1
lw $s2, -4($fp)
move $a0, $s2
jal L2305
move $s2, $v0
move $s2, $s2
sw $s2, 0($s1)
move $s0, $s0
j L2313
L2380:
L2383:
li $s0, 0
beq $s1, $s0, L2336
j L2337
L2337:
li $s0, 0
beq $s1, $s0, L2333
j L2334
L2334:
move $s0, $s1
li $s2, 0
beq $s0, $s2, L2315
j L2314
L2314:
lw $s0, 0($s0)
move $s0, $s0
move $s2, $s1
li $s3, 0
beq $s2, $s3, L2317
j L2316
L2316:
lw $s2, 0($s2)
blt $s0, $s2, L2330
j L2331
L2331:
li $s0, 8
move $a0, $s0
jal allocRecord
move $s0, $v0
move $s0, $s0
addi $s2, $s0, 0
move $s2, $s2
move $s3, $s1
li $s4, 0
beq $s3, $s4, L2325
j L2324
L2324:
lw $s3, 0($s3)
sw $s3, 0($s2)
addi $s2, $s0, 4
move $s2, $s2
lw $s3, -4($fp)
move $s3, $s3
move $s4, $s1
move $s1, $s1
li $s5, 0
beq $s1, $s5, L2327
j L2326
L2326:
move $a0, $s3
move $a1, $s4
lw $s1, 4($s1)
move $a2, $s1
jal L2306
move $s1, $v0
move $s1, $s1
sw $s1, 0($s2)
move $s0, $s0
L2332:
move $s0, $s0
L2335:
move $s0, $s0
L2338:
move $v0, $s0
j L2382
L2336:
move $s0, $s1
j L2338
L2333:
move $s0, $s1
j L2335
L2315:
jal nilerror
move $s2, $v0
j L2314
L2317:
jal nilerror
move $s3, $v0
j L2316
L2330:
li $s0, 8
move $a0, $s0
jal allocRecord
move $s0, $v0
move $s0, $s0
addi $s2, $s0, 0
move $s2, $s2
move $s3, $s1
li $s4, 0
beq $s3, $s4, L2319
j L2318
L2318:
lw $s3, 0($s3)
sw $s3, 0($s2)
addi $s2, $s0, 4
move $s2, $s2
lw $s3, -4($fp)
move $s3, $s3
move $s4, $s1
li $s5, 0
beq $s4, $s5, L2321
j L2320
L2320:
move $a0, $s3
lw $s3, 4($s4)
move $a1, $s3
move $a2, $s1
jal L2306
move $s1, $v0
move $s1, $s1
sw $s1, 0($s2)
move $s0, $s0
j L2332
L2319:
jal nilerror
move $s4, $v0
j L2318
L2321:
jal nilerror
move $s5, $v0
j L2320
L2325:
jal nilerror
move $s4, $v0
j L2324
L2327:
jal nilerror
move $s5, $v0
j L2326
L2382:
L2340: .asciiz "0"
L2341: .asciiz "0"
L2342: .asciiz "0"
L2343: .asciiz "0"
L2344: .asciiz "0"
L2345: .asciiz "0"
L2346: .asciiz "0"
L2347: .asciiz "0"
L2385:
li $s0, 0
bgt $s1, $s0, L2348
j L2349
L2349:
li $s0, 0
move $v0, $s0
j L2384
L2348:
lw $s0, -4($fp)
move $a0, $s0
li $s0, 10
div $s1, $s0
mflo $s0
move $a1, $s0
jal L2339
move $s0, $v0
li $s0, 10
div $s1, $s0
mflo $s0
li $s2, 10
mul $s0, $s0, $s2 
sub $s0, $s1, $s0 
move $s0, $s0
li $s1, 0
move $a0, $s1
la $s1, L2340
move $a1, $s1
jal ord
move $s1, $v0
move $s1, $s1
li $s2, 0
move $a0, $s2
add $s0, $s0, $s1 
move $a1, $s0
jal chr
move $s0, $v0
move $s0, $s0
li $s1, 0
move $a0, $s1
move $a1, $s0
jal print
move $s0, $v0
j L2349
L2384:
L2350: .asciiz "-"
L2351: .asciiz "-"
L2352: .asciiz "0"
L2353: .asciiz "0"
L2387:
li $s0, 0
blt $s1, $s0, L2357
j L2358
L2358:
li $s0, 0
bgt $s1, $s0, L2354
j L2355
L2355:
li $s0, 0
move $a0, $s0
la $s0, L2352
move $a1, $s0
jal print
move $s0, $v0
move $s0, $s0
L2356:
move $s0, $s0
L2359:
move $v0, $s0
j L2386
L2357:
li $s0, 0
move $a0, $s0
la $s0, L2350
move $a1, $s0
jal print
move $s0, $v0
move $a0, $fp
li $s0, 0
sub $s0, $s0, $s1 
move $a1, $s0
jal L2339
move $s0, $v0
move $s0, $s0
j L2359
L2354:
move $a0, $fp
move $a1, $s1
jal L2339
move $s0, $v0
move $s0, $s0
j L2356
L2386:
L2360: .asciiz "
"
L2361: .asciiz "
"
L2366: .asciiz " "
L2367: .asciiz " "
L2389:
li $s0, 0
beq $s1, $s0, L2372
j L2373
L2373:
lw $s0, -4($fp)
move $s0, $s0
move $s1, $s1
li $s2, 0
beq $s1, $s2, L2363
j L2362
L2362:
move $a0, $s0
lw $s0, 0($s1)
move $a1, $s0
jal L2307
move $s0, $v0
li $s0, 0
move $a0, $s0
la $s0, L2366
move $a1, $s0
jal print
move $s0, $v0
lw $s0, -4($fp)
move $s0, $s0
move $s1, $s1
li $s2, 0
beq $s1, $s2, L2369
j L2368
L2368:
move $a0, $s0
lw $s0, 4($s1)
move $a1, $s0
jal L2308
move $s0, $v0
move $s0, $s0
L2374:
move $v0, $s0
j L2388
L2372:
li $s0, 0
move $a0, $s0
la $s0, L2360
move $a1, $s0
jal print
move $s0, $v0
move $s0, $s0
j L2374
L2363:
jal nilerror
move $s2, $v0
j L2362
L2369:
jal nilerror
move $s2, $v0
j L2368
L2388:
L2391:
addi $s0, $fp, -8
move $s0, $s0
li $s1, 0
move $a0, $s1
jal getchar
move $s1, $v0
move $s1, $s1
sw $s1, 0($s0)
move $a0, $fp
jal L2305
move $s0, $v0
move $s0, $s0
addi $s1, $fp, -8
move $s1, $s1
li $s2, 0
move $a0, $s2
jal getchar
move $s2, $v0
move $s2, $s2
sw $s2, 0($s1)
move $a0, $fp
jal L2305
move $s1, $v0
move $s1, $s1
move $s2, $fp
move $a0, $fp
move $a1, $s0
move $a2, $s1
jal L2306
move $s0, $v0
move $s0, $s0
move $a0, $s2
move $a1, $s0
jal L2308
move $s0, $v0
move $v0, $s0
j L2390
L2390:
