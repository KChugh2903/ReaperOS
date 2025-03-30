
reaperos.elf:     file format elf32-littlearm


Disassembly of section .text:

80008000 <entry>:
80008000:	e59fd0e4 	ldr	sp, [pc, #228]	@ 800080ec <irq_entry+0x30>
80008004:	eb000004 	bl	8000801c <enable_paging>
80008008:	eb00000d 	bl	80008044 <copy_interrupt_table>
8000800c:	eb000337 	bl	80008cf0 <use_high_interrupts>
80008010:	eb000332 	bl	80008ce0 <enable_interrupts>
80008014:	eb000357 	bl	80008d78 <jump_to_high_mem>
80008018:	eb0002ba 	bl	80008b08 <c_entry>

8000801c <enable_paging>:
8000801c:	e1a0200e 	mov	r2, lr
80008020:	e3a00001 	mov	r0, #1
80008024:	eb00034f 	bl	80008d68 <set_domain_access_control>
80008028:	e59f00c0 	ldr	r0, [pc, #192]	@ 800080f0 <irq_entry+0x34>
8000802c:	e2400102 	sub	r0, r0, #-2147483648	@ 0x80000000
80008030:	eb00034e 	bl	80008d70 <set_translation_table_base>
80008034:	eb000347 	bl	80008d58 <read_control_register>
80008038:	e3800001 	orr	r0, r0, #1
8000803c:	eb000347 	bl	80008d60 <set_control_register>
80008040:	e1a0f002 	mov	pc, r2

80008044 <copy_interrupt_table>:
80008044:	e3a00000 	mov	r0, #0
80008048:	e59f10a4 	ldr	r1, [pc, #164]	@ 800080f4 <irq_entry+0x38>
8000804c:	e59f30a4 	ldr	r3, [pc, #164]	@ 800080f8 <irq_entry+0x3c>

80008050 <copy_loop_start>:
80008050:	e5912000 	ldr	r2, [r1]
80008054:	e5802000 	str	r2, [r0]
80008058:	e2800004 	add	r0, r0, #4
8000805c:	e2811004 	add	r1, r1, #4
80008060:	e1510003 	cmp	r1, r3
80008064:	1afffff9 	bne	80008050 <copy_loop_start>
80008068:	e1a0f00e 	mov	pc, lr

8000806c <interrupt_table_start>:
8000806c:	e320f000 	nop	{0}
80008070:	e25ef004 	subs	pc, lr, #4
80008074:	e59ff00c 	ldr	pc, [pc, #12]	@ 80008088 <syscall_entry_address>
80008078:	e25ef004 	subs	pc, lr, #4
8000807c:	e25ef004 	subs	pc, lr, #4
80008080:	e25ef004 	subs	pc, lr, #4
80008084:	e59ff000 	ldr	pc, [pc]	@ 8000808c <irq_entry_address>

80008088 <syscall_entry_address>:
80008088:	80008090 	mulhi	r0, r0, r0

8000808c <irq_entry_address>:
8000808c:	800080bc 	strhhi	r8, [r0], -ip

80008090 <interrupt_table_end>:
80008090:	e59fd054 	ldr	sp, [pc, #84]	@ 800080ec <irq_entry+0x30>
80008094:	e92d4001 	push	{r0, lr}
80008098:	e1a0000e 	mov	r0, lr
8000809c:	eb000bdc 	bl	8000b014 <save_context_1>
800080a0:	e8bd4001 	pop	{r0, lr}
800080a4:	e52de004 	push	{lr}		@ (str lr, [sp, #-4]!)
800080a8:	eb000be9 	bl	8000b054 <save_context_2>
800080ac:	e49de004 	pop	{lr}		@ (ldr lr, [sp], #4)
800080b0:	e92d5ffe 	push	{r1, r2, r3, r4, r5, r6, r7, r8, r9, sl, fp, ip, lr}
800080b4:	eb0002f3 	bl	80008c88 <handle_syscall>
800080b8:	e8fd9ffe 	ldm	sp!, {r1, r2, r3, r4, r5, r6, r7, r8, r9, sl, fp, ip, pc}^

800080bc <irq_entry>:
800080bc:	e24ee004 	sub	lr, lr, #4
800080c0:	e59fd034 	ldr	sp, [pc, #52]	@ 800080fc <irq_entry+0x40>
800080c4:	e92d4001 	push	{r0, lr}
800080c8:	e1a0000e 	mov	r0, lr
800080cc:	eb000bd0 	bl	8000b014 <save_context_1>
800080d0:	e8bd4001 	pop	{r0, lr}
800080d4:	e52de004 	push	{lr}		@ (str lr, [sp, #-4]!)
800080d8:	eb000bdd 	bl	8000b054 <save_context_2>
800080dc:	e49de004 	pop	{lr}		@ (ldr lr, [sp], #4)
800080e0:	e92d5fff 	push	{r0, r1, r2, r3, r4, r5, r6, r7, r8, r9, sl, fp, ip, lr}
800080e4:	eb0002ba 	bl	80008bd4 <dispatch_interrupts>
800080e8:	e8fd9fff 	ldm	sp!, {r0, r1, r2, r3, r4, r5, r6, r7, r8, r9, sl, fp, ip, pc}^
800080ec:	80059010 	andhi	r9, r5, r0, lsl r0
800080f0:	8001c000 	andhi	ip, r1, r0
800080f4:	8000806c 	andhi	r8, r0, ip, rrx
800080f8:	80008090 	mulhi	r0, r0, r0
800080fc:	8005a010 	andhi	sl, r5, r0, lsl r0

80008100 <console_init>:
80008100:	e1a0c00d 	mov	ip, sp
80008104:	e92dd800 	push	{fp, ip, lr, pc}
80008108:	e24cb004 	sub	fp, ip, #4
8000810c:	e59f3038 	ldr	r3, [pc, #56]	@ 8000814c <console_init+0x4c>
80008110:	e08f3003 	add	r3, pc, r3
80008114:	e3a02000 	mov	r2, #0
80008118:	e5832000 	str	r2, [r3]
8000811c:	e59f302c 	ldr	r3, [pc, #44]	@ 80008150 <console_init+0x50>
80008120:	e08f3003 	add	r3, pc, r3
80008124:	e3a02000 	mov	r2, #0
80008128:	e5832000 	str	r2, [r3]
8000812c:	eb000e8a 	bl	8000bb5c <uart_init>
80008130:	e59f301c 	ldr	r3, [pc, #28]	@ 80008154 <console_init+0x54>
80008134:	e08f3003 	add	r3, pc, r3
80008138:	e1a01003 	mov	r1, r3
8000813c:	e3a0001d 	mov	r0, #29
80008140:	eb00028f 	bl	80008b84 <register_interrupt_handler>
80008144:	e320f000 	nop	{0}
80008148:	e89da800 	ldm	sp, {fp, sp, pc}
8000814c:	0001fef8 	strdeq	pc, [r1], -r8
80008150:	0001feec 	andeq	pc, r1, ip, ror #29
80008154:	00000288 	andeq	r0, r0, r8, lsl #5

80008158 <kputch>:
80008158:	e1a0c00d 	mov	ip, sp
8000815c:	e92dd800 	push	{fp, ip, lr, pc}
80008160:	e24cb004 	sub	fp, ip, #4
80008164:	e24dd018 	sub	sp, sp, #24
80008168:	e50b0020 	str	r0, [fp, #-32]	@ 0xffffffe0
8000816c:	e3a03000 	mov	r3, #0
80008170:	e50b3018 	str	r3, [fp, #-24]	@ 0xffffffe8
80008174:	e3a03000 	mov	r3, #0
80008178:	e50b3010 	str	r3, [fp, #-16]
8000817c:	e51b0020 	ldr	r0, [fp, #-32]	@ 0xffffffe0
80008180:	eb000128 	bl	80008628 <get_special_key_sequence>
80008184:	e50b0014 	str	r0, [fp, #-20]	@ 0xffffffec
80008188:	e51b3020 	ldr	r3, [fp, #-32]	@ 0xffffffe0
8000818c:	e353000a 	cmp	r3, #10
80008190:	1a000001 	bne	8000819c <kputch+0x44>
80008194:	e3a00072 	mov	r0, #114	@ 0x72
80008198:	ebffffee 	bl	80008158 <kputch>
8000819c:	e51b3014 	ldr	r3, [fp, #-20]	@ 0xffffffec
800081a0:	e3530000 	cmp	r3, #0
800081a4:	1a000009 	bne	800081d0 <kputch+0x78>
800081a8:	e24b301c 	sub	r3, fp, #28
800081ac:	e50b3014 	str	r3, [fp, #-20]	@ 0xffffffec
800081b0:	e51b3020 	ldr	r3, [fp, #-32]	@ 0xffffffe0
800081b4:	e6ef2073 	uxtb	r2, r3
800081b8:	e51b3014 	ldr	r3, [fp, #-20]	@ 0xffffffec
800081bc:	e5c32000 	strb	r2, [r3]
800081c0:	e51b3014 	ldr	r3, [fp, #-20]	@ 0xffffffec
800081c4:	e2833001 	add	r3, r3, #1
800081c8:	e3a02000 	mov	r2, #0
800081cc:	e5c32000 	strb	r2, [r3]
800081d0:	e51b0014 	ldr	r0, [fp, #-20]	@ 0xffffffec
800081d4:	eb0010ff 	bl	8000c5d8 <strlen>
800081d8:	e1a03000 	mov	r3, r0
800081dc:	e50b3018 	str	r3, [fp, #-24]	@ 0xffffffe8
800081e0:	e3a03000 	mov	r3, #0
800081e4:	e50b3010 	str	r3, [fp, #-16]
800081e8:	ea000008 	b	80008210 <kputch+0xb8>
800081ec:	e51b3010 	ldr	r3, [fp, #-16]
800081f0:	e51b2014 	ldr	r2, [fp, #-20]	@ 0xffffffec
800081f4:	e0823003 	add	r3, r2, r3
800081f8:	e5d33000 	ldrb	r3, [r3]
800081fc:	e1a00003 	mov	r0, r3
80008200:	eb000ea9 	bl	8000bcac <uart_transmit>
80008204:	e51b3010 	ldr	r3, [fp, #-16]
80008208:	e2833001 	add	r3, r3, #1
8000820c:	e50b3010 	str	r3, [fp, #-16]
80008210:	e51b2010 	ldr	r2, [fp, #-16]
80008214:	e51b3018 	ldr	r3, [fp, #-24]	@ 0xffffffe8
80008218:	e1520003 	cmp	r2, r3
8000821c:	bafffff2 	blt	800081ec <kputch+0x94>
80008220:	e320f000 	nop	{0}
80008224:	e320f000 	nop	{0}
80008228:	e24bd00c 	sub	sp, fp, #12
8000822c:	e89da800 	ldm	sp, {fp, sp, pc}

80008230 <syscall_putch>:
80008230:	e1a0c00d 	mov	ip, sp
80008234:	e92dd800 	push	{fp, ip, lr, pc}
80008238:	e24cb004 	sub	fp, ip, #4
8000823c:	e24dd008 	sub	sp, sp, #8
80008240:	e50b0010 	str	r0, [fp, #-16]
80008244:	e51b0010 	ldr	r0, [fp, #-16]
80008248:	ebffffc2 	bl	80008158 <kputch>
8000824c:	e3a03000 	mov	r3, #0
80008250:	e1a00003 	mov	r0, r3
80008254:	e24bd00c 	sub	sp, fp, #12
80008258:	e89da800 	ldm	sp, {fp, sp, pc}

8000825c <kgetch>:
8000825c:	e1a0c00d 	mov	ip, sp
80008260:	e92dd800 	push	{fp, ip, lr, pc}
80008264:	e24cb004 	sub	fp, ip, #4
80008268:	e24dd010 	sub	sp, sp, #16
8000826c:	e3a03000 	mov	r3, #0
80008270:	e50b3010 	str	r3, [fp, #-16]
80008274:	e24b301c 	sub	r3, fp, #28
80008278:	e3a02000 	mov	r2, #0
8000827c:	e5832000 	str	r2, [r3]
80008280:	e1c320b4 	strh	r2, [r3, #4]
80008284:	e3a03000 	mov	r3, #0
80008288:	e50b3014 	str	r3, [fp, #-20]	@ 0xffffffec
8000828c:	ea000017 	b	800082f0 <kgetch+0x94>
80008290:	e59f30f8 	ldr	r3, [pc, #248]	@ 80008390 <kgetch+0x134>
80008294:	e08f3003 	add	r3, pc, r3
80008298:	e5933000 	ldr	r3, [r3]
8000829c:	e59f20f0 	ldr	r2, [pc, #240]	@ 80008394 <kgetch+0x138>
800082a0:	e08f2002 	add	r2, pc, r2
800082a4:	e7d21003 	ldrb	r1, [r2, r3]
800082a8:	e24b201c 	sub	r2, fp, #28
800082ac:	e51b3014 	ldr	r3, [fp, #-20]	@ 0xffffffec
800082b0:	e0823003 	add	r3, r2, r3
800082b4:	e1a02001 	mov	r2, r1
800082b8:	e5c32000 	strb	r2, [r3]
800082bc:	e59f30d4 	ldr	r3, [pc, #212]	@ 80008398 <kgetch+0x13c>
800082c0:	e08f3003 	add	r3, pc, r3
800082c4:	e5933000 	ldr	r3, [r3]
800082c8:	e3a01010 	mov	r1, #16
800082cc:	e1a00003 	mov	r0, r3
800082d0:	eb00006a 	bl	80008480 <circular_inc>
800082d4:	e1a02000 	mov	r2, r0
800082d8:	e59f30bc 	ldr	r3, [pc, #188]	@ 8000839c <kgetch+0x140>
800082dc:	e08f3003 	add	r3, pc, r3
800082e0:	e5832000 	str	r2, [r3]
800082e4:	e51b3014 	ldr	r3, [fp, #-20]	@ 0xffffffec
800082e8:	e2833001 	add	r3, r3, #1
800082ec:	e50b3014 	str	r3, [fp, #-20]	@ 0xffffffec
800082f0:	e59f30a8 	ldr	r3, [pc, #168]	@ 800083a0 <kgetch+0x144>
800082f4:	e08f3003 	add	r3, pc, r3
800082f8:	e5932000 	ldr	r2, [r3]
800082fc:	e59f30a0 	ldr	r3, [pc, #160]	@ 800083a4 <kgetch+0x148>
80008300:	e08f3003 	add	r3, pc, r3
80008304:	e5933000 	ldr	r3, [r3]
80008308:	e1520003 	cmp	r2, r3
8000830c:	0a00000b 	beq	80008340 <kgetch+0xe4>
80008310:	e24b301c 	sub	r3, fp, #28
80008314:	e1a00003 	mov	r0, r3
80008318:	eb00006b 	bl	800084cc <is_special_key_sequence_prefix>
8000831c:	e1a03000 	mov	r3, r0
80008320:	e3530000 	cmp	r3, #0
80008324:	0a000005 	beq	80008340 <kgetch+0xe4>
80008328:	e24b301c 	sub	r3, fp, #28
8000832c:	e1a00003 	mov	r0, r3
80008330:	eb000090 	bl	80008578 <get_special_key_code>
80008334:	e1a03000 	mov	r3, r0
80008338:	e3530000 	cmp	r3, #0
8000833c:	0affffd3 	beq	80008290 <kgetch+0x34>
80008340:	e24b301c 	sub	r3, fp, #28
80008344:	e1a00003 	mov	r0, r3
80008348:	eb00008a 	bl	80008578 <get_special_key_code>
8000834c:	e50b0010 	str	r0, [fp, #-16]
80008350:	e51b3010 	ldr	r3, [fp, #-16]
80008354:	e3530000 	cmp	r3, #0
80008358:	1a000008 	bne	80008380 <kgetch+0x124>
8000835c:	e51b3014 	ldr	r3, [fp, #-20]	@ 0xffffffec
80008360:	e3530000 	cmp	r3, #0
80008364:	0a000005 	beq	80008380 <kgetch+0x124>
80008368:	e51b3014 	ldr	r3, [fp, #-20]	@ 0xffffffec
8000836c:	e2433001 	sub	r3, r3, #1
80008370:	e243300c 	sub	r3, r3, #12
80008374:	e083300b 	add	r3, r3, fp
80008378:	e5533010 	ldrb	r3, [r3, #-16]
8000837c:	e50b3010 	str	r3, [fp, #-16]
80008380:	e51b3010 	ldr	r3, [fp, #-16]
80008384:	e1a00003 	mov	r0, r3
80008388:	e24bd00c 	sub	sp, fp, #12
8000838c:	e89da800 	ldm	sp, {fp, sp, pc}
80008390:	0001fd78 	andeq	pc, r1, r8, ror sp	@ <UNPREDICTABLE>
80008394:	0001fd58 	andeq	pc, r1, r8, asr sp	@ <UNPREDICTABLE>
80008398:	0001fd4c 	andeq	pc, r1, ip, asr #26
8000839c:	0001fd30 	andeq	pc, r1, r0, lsr sp	@ <UNPREDICTABLE>
800083a0:	0001fd14 	andeq	pc, r1, r4, lsl sp	@ <UNPREDICTABLE>
800083a4:	0001fd0c 	andeq	pc, r1, ip, lsl #26

800083a8 <syscall_getch>:
800083a8:	e1a0c00d 	mov	ip, sp
800083ac:	e92dd800 	push	{fp, ip, lr, pc}
800083b0:	e24cb004 	sub	fp, ip, #4
800083b4:	ebffffa8 	bl	8000825c <kgetch>
800083b8:	e1a03000 	mov	r3, r0
800083bc:	e1a00003 	mov	r0, r3
800083c0:	e89da800 	ldm	sp, {fp, sp, pc}

800083c4 <uart_interrupt_handler>:
800083c4:	e1a0c00d 	mov	ip, sp
800083c8:	e92dd800 	push	{fp, ip, lr, pc}
800083cc:	e24cb004 	sub	fp, ip, #4
800083d0:	e24dd008 	sub	sp, sp, #8
800083d4:	ea00001c 	b	8000844c <uart_interrupt_handler+0x88>
800083d8:	e3a03000 	mov	r3, #0
800083dc:	e50b3010 	str	r3, [fp, #-16]
800083e0:	eb000e59 	bl	8000bd4c <uart_receive>
800083e4:	e50b0014 	str	r0, [fp, #-20]	@ 0xffffffec
800083e8:	e59f307c 	ldr	r3, [pc, #124]	@ 8000846c <uart_interrupt_handler+0xa8>
800083ec:	e08f3003 	add	r3, pc, r3
800083f0:	e5933000 	ldr	r3, [r3]
800083f4:	e3a01010 	mov	r1, #16
800083f8:	e1a00003 	mov	r0, r3
800083fc:	eb00001f 	bl	80008480 <circular_inc>
80008400:	e50b0010 	str	r0, [fp, #-16]
80008404:	e59f3064 	ldr	r3, [pc, #100]	@ 80008470 <uart_interrupt_handler+0xac>
80008408:	e08f3003 	add	r3, pc, r3
8000840c:	e5933000 	ldr	r3, [r3]
80008410:	e51b2010 	ldr	r2, [fp, #-16]
80008414:	e1520003 	cmp	r2, r3
80008418:	0a00000b 	beq	8000844c <uart_interrupt_handler+0x88>
8000841c:	e59f3050 	ldr	r3, [pc, #80]	@ 80008474 <uart_interrupt_handler+0xb0>
80008420:	e08f3003 	add	r3, pc, r3
80008424:	e5933000 	ldr	r3, [r3]
80008428:	e51b2014 	ldr	r2, [fp, #-20]	@ 0xffffffec
8000842c:	e6ef1072 	uxtb	r1, r2
80008430:	e59f2040 	ldr	r2, [pc, #64]	@ 80008478 <uart_interrupt_handler+0xb4>
80008434:	e08f2002 	add	r2, pc, r2
80008438:	e7c21003 	strb	r1, [r2, r3]
8000843c:	e59f3038 	ldr	r3, [pc, #56]	@ 8000847c <uart_interrupt_handler+0xb8>
80008440:	e08f3003 	add	r3, pc, r3
80008444:	e51b2010 	ldr	r2, [fp, #-16]
80008448:	e5832000 	str	r2, [r3]
8000844c:	eb000e2d 	bl	8000bd08 <uart_can_receive>
80008450:	e1a03000 	mov	r3, r0
80008454:	e3530000 	cmp	r3, #0
80008458:	1affffde 	bne	800083d8 <uart_interrupt_handler+0x14>
8000845c:	e320f000 	nop	{0}
80008460:	e320f000 	nop	{0}
80008464:	e24bd00c 	sub	sp, fp, #12
80008468:	e89da800 	ldm	sp, {fp, sp, pc}
8000846c:	0001fc1c 	andeq	pc, r1, ip, lsl ip	@ <UNPREDICTABLE>
80008470:	0001fc04 	andeq	pc, r1, r4, lsl #24
80008474:	0001fbe8 	andeq	pc, r1, r8, ror #23
80008478:	0001fbc4 	andeq	pc, r1, r4, asr #23
8000847c:	0001fbc8 	andeq	pc, r1, r8, asr #23

80008480 <circular_inc>:
80008480:	e1a0c00d 	mov	ip, sp
80008484:	e92dd800 	push	{fp, ip, lr, pc}
80008488:	e24cb004 	sub	fp, ip, #4
8000848c:	e24dd008 	sub	sp, sp, #8
80008490:	e50b0010 	str	r0, [fp, #-16]
80008494:	e50b1014 	str	r1, [fp, #-20]	@ 0xffffffec
80008498:	e51b3010 	ldr	r3, [fp, #-16]
8000849c:	e2833001 	add	r3, r3, #1
800084a0:	e50b3010 	str	r3, [fp, #-16]
800084a4:	e51b2010 	ldr	r2, [fp, #-16]
800084a8:	e51b3014 	ldr	r3, [fp, #-20]	@ 0xffffffec
800084ac:	e1520003 	cmp	r2, r3
800084b0:	1a000001 	bne	800084bc <circular_inc+0x3c>
800084b4:	e3a03000 	mov	r3, #0
800084b8:	e50b3010 	str	r3, [fp, #-16]
800084bc:	e51b3010 	ldr	r3, [fp, #-16]
800084c0:	e1a00003 	mov	r0, r3
800084c4:	e24bd00c 	sub	sp, fp, #12
800084c8:	e89da800 	ldm	sp, {fp, sp, pc}

800084cc <is_special_key_sequence_prefix>:
800084cc:	e1a0c00d 	mov	ip, sp
800084d0:	e92dd800 	push	{fp, ip, lr, pc}
800084d4:	e24cb004 	sub	fp, ip, #4
800084d8:	e24dd018 	sub	sp, sp, #24
800084dc:	e50b0020 	str	r0, [fp, #-32]	@ 0xffffffe0
800084e0:	e3a03000 	mov	r3, #0
800084e4:	e50b3010 	str	r3, [fp, #-16]
800084e8:	e3a03000 	mov	r3, #0
800084ec:	e50b3014 	str	r3, [fp, #-20]	@ 0xffffffec
800084f0:	e51b0020 	ldr	r0, [fp, #-32]	@ 0xffffffe0
800084f4:	eb001037 	bl	8000c5d8 <strlen>
800084f8:	e1a03000 	mov	r3, r0
800084fc:	e50b3018 	str	r3, [fp, #-24]	@ 0xffffffe8
80008500:	e3a03000 	mov	r3, #0
80008504:	e50b3014 	str	r3, [fp, #-20]	@ 0xffffffec
80008508:	ea000012 	b	80008558 <is_special_key_sequence_prefix+0x8c>
8000850c:	e51b3014 	ldr	r3, [fp, #-20]	@ 0xffffffec
80008510:	e1a03183 	lsl	r3, r3, #3
80008514:	e59f2058 	ldr	r2, [pc, #88]	@ 80008574 <is_special_key_sequence_prefix+0xa8>
80008518:	e08f2002 	add	r2, pc, r2
8000851c:	e0833002 	add	r3, r3, r2
80008520:	e2833002 	add	r3, r3, #2
80008524:	e51b2018 	ldr	r2, [fp, #-24]	@ 0xffffffe8
80008528:	e1a01003 	mov	r1, r3
8000852c:	e51b0020 	ldr	r0, [fp, #-32]	@ 0xffffffe0
80008530:	eb000f51 	bl	8000c27c <strncmp>
80008534:	e1a03000 	mov	r3, r0
80008538:	e3530000 	cmp	r3, #0
8000853c:	1a000002 	bne	8000854c <is_special_key_sequence_prefix+0x80>
80008540:	e3a03001 	mov	r3, #1
80008544:	e50b3010 	str	r3, [fp, #-16]
80008548:	ea000005 	b	80008564 <is_special_key_sequence_prefix+0x98>
8000854c:	e51b3014 	ldr	r3, [fp, #-20]	@ 0xffffffec
80008550:	e2833001 	add	r3, r3, #1
80008554:	e50b3014 	str	r3, [fp, #-20]	@ 0xffffffec
80008558:	e51b3014 	ldr	r3, [fp, #-20]	@ 0xffffffec
8000855c:	e3530005 	cmp	r3, #5
80008560:	9affffe9 	bls	8000850c <is_special_key_sequence_prefix+0x40>
80008564:	e51b3010 	ldr	r3, [fp, #-16]
80008568:	e1a00003 	mov	r0, r3
8000856c:	e24bd00c 	sub	sp, fp, #12
80008570:	e89da800 	ldm	sp, {fp, sp, pc}
80008574:	00004894 	muleq	r0, r4, r8

80008578 <get_special_key_code>:
80008578:	e1a0c00d 	mov	ip, sp
8000857c:	e92dd800 	push	{fp, ip, lr, pc}
80008580:	e24cb004 	sub	fp, ip, #4
80008584:	e24dd010 	sub	sp, sp, #16
80008588:	e50b0018 	str	r0, [fp, #-24]	@ 0xffffffe8
8000858c:	e3a03000 	mov	r3, #0
80008590:	e50b3010 	str	r3, [fp, #-16]
80008594:	e3a03000 	mov	r3, #0
80008598:	e50b3014 	str	r3, [fp, #-20]	@ 0xffffffec
8000859c:	e3a03000 	mov	r3, #0
800085a0:	e50b3014 	str	r3, [fp, #-20]	@ 0xffffffec
800085a4:	ea000016 	b	80008604 <get_special_key_code+0x8c>
800085a8:	e51b3014 	ldr	r3, [fp, #-20]	@ 0xffffffec
800085ac:	e1a03183 	lsl	r3, r3, #3
800085b0:	e59f2068 	ldr	r2, [pc, #104]	@ 80008620 <get_special_key_code+0xa8>
800085b4:	e08f2002 	add	r2, pc, r2
800085b8:	e0833002 	add	r3, r3, r2
800085bc:	e2833002 	add	r3, r3, #2
800085c0:	e1a01003 	mov	r1, r3
800085c4:	e51b0018 	ldr	r0, [fp, #-24]	@ 0xffffffe8
800085c8:	eb000f07 	bl	8000c1ec <strcmp>
800085cc:	e1a03000 	mov	r3, r0
800085d0:	e3530000 	cmp	r3, #0
800085d4:	1a000007 	bne	800085f8 <get_special_key_code+0x80>
800085d8:	e59f2044 	ldr	r2, [pc, #68]	@ 80008624 <get_special_key_code+0xac>
800085dc:	e08f2002 	add	r2, pc, r2
800085e0:	e51b3014 	ldr	r3, [fp, #-20]	@ 0xffffffec
800085e4:	e1a03183 	lsl	r3, r3, #3
800085e8:	e0823003 	add	r3, r2, r3
800085ec:	e1d330b0 	ldrh	r3, [r3]
800085f0:	e50b3010 	str	r3, [fp, #-16]
800085f4:	ea000005 	b	80008610 <get_special_key_code+0x98>
800085f8:	e51b3014 	ldr	r3, [fp, #-20]	@ 0xffffffec
800085fc:	e2833001 	add	r3, r3, #1
80008600:	e50b3014 	str	r3, [fp, #-20]	@ 0xffffffec
80008604:	e51b3014 	ldr	r3, [fp, #-20]	@ 0xffffffec
80008608:	e3530005 	cmp	r3, #5
8000860c:	9affffe5 	bls	800085a8 <get_special_key_code+0x30>
80008610:	e51b3010 	ldr	r3, [fp, #-16]
80008614:	e1a00003 	mov	r0, r3
80008618:	e24bd00c 	sub	sp, fp, #12
8000861c:	e89da800 	ldm	sp, {fp, sp, pc}
80008620:	000047f8 	strdeq	r4, [r0], -r8
80008624:	000047d0 	ldrdeq	r4, [r0], -r0

80008628 <get_special_key_sequence>:
80008628:	e1a0c00d 	mov	ip, sp
8000862c:	e92dd800 	push	{fp, ip, lr, pc}
80008630:	e24cb004 	sub	fp, ip, #4
80008634:	e24dd010 	sub	sp, sp, #16
80008638:	e50b0018 	str	r0, [fp, #-24]	@ 0xffffffe8
8000863c:	e3a03000 	mov	r3, #0
80008640:	e50b3010 	str	r3, [fp, #-16]
80008644:	e3a03000 	mov	r3, #0
80008648:	e50b3014 	str	r3, [fp, #-20]	@ 0xffffffec
8000864c:	e3a03000 	mov	r3, #0
80008650:	e50b3014 	str	r3, [fp, #-20]	@ 0xffffffec
80008654:	ea000014 	b	800086ac <get_special_key_sequence+0x84>
80008658:	e59f2068 	ldr	r2, [pc, #104]	@ 800086c8 <get_special_key_sequence+0xa0>
8000865c:	e08f2002 	add	r2, pc, r2
80008660:	e51b3014 	ldr	r3, [fp, #-20]	@ 0xffffffec
80008664:	e1a03183 	lsl	r3, r3, #3
80008668:	e0823003 	add	r3, r2, r3
8000866c:	e1d330b0 	ldrh	r3, [r3]
80008670:	e1a02003 	mov	r2, r3
80008674:	e51b3018 	ldr	r3, [fp, #-24]	@ 0xffffffe8
80008678:	e1530002 	cmp	r3, r2
8000867c:	1a000007 	bne	800086a0 <get_special_key_sequence+0x78>
80008680:	e51b3014 	ldr	r3, [fp, #-20]	@ 0xffffffec
80008684:	e1a03183 	lsl	r3, r3, #3
80008688:	e59f203c 	ldr	r2, [pc, #60]	@ 800086cc <get_special_key_sequence+0xa4>
8000868c:	e08f2002 	add	r2, pc, r2
80008690:	e0833002 	add	r3, r3, r2
80008694:	e2833002 	add	r3, r3, #2
80008698:	e50b3010 	str	r3, [fp, #-16]
8000869c:	ea000005 	b	800086b8 <get_special_key_sequence+0x90>
800086a0:	e51b3014 	ldr	r3, [fp, #-20]	@ 0xffffffec
800086a4:	e2833001 	add	r3, r3, #1
800086a8:	e50b3014 	str	r3, [fp, #-20]	@ 0xffffffec
800086ac:	e51b3014 	ldr	r3, [fp, #-20]	@ 0xffffffec
800086b0:	e3530005 	cmp	r3, #5
800086b4:	9affffe7 	bls	80008658 <get_special_key_sequence+0x30>
800086b8:	e51b3010 	ldr	r3, [fp, #-16]
800086bc:	e1a00003 	mov	r0, r3
800086c0:	e24bd00c 	sub	sp, fp, #12
800086c4:	e89da800 	ldm	sp, {fp, sp, pc}
800086c8:	00004750 	andeq	r4, r0, r0, asr r7
800086cc:	00004720 	andeq	r4, r0, r0, lsr #14

800086d0 <get_debug_info>:
800086d0:	e1a0c00d 	mov	ip, sp
800086d4:	e92dd810 	push	{r4, fp, ip, lr, pc}
800086d8:	e24cb004 	sub	fp, ip, #4
800086dc:	e24ddfcd 	sub	sp, sp, #820	@ 0x334
800086e0:	e50b0340 	str	r0, [fp, #-832]	@ 0xfffffcc0
800086e4:	e50b1344 	str	r1, [fp, #-836]	@ 0xfffffcbc
800086e8:	e59f4094 	ldr	r4, [pc, #148]	@ 80008784 <get_debug_info+0xb4>
800086ec:	e08f4004 	add	r4, pc, r4
800086f0:	e3a03000 	mov	r3, #0
800086f4:	e50b3018 	str	r3, [fp, #-24]	@ 0xffffffe8
800086f8:	e24b3fce 	sub	r3, fp, #824	@ 0x338
800086fc:	e1a00003 	mov	r0, r3
80008700:	eb000072 	bl	800088d0 <init_debug_info>
80008704:	e59f307c 	ldr	r3, [pc, #124]	@ 80008788 <get_debug_info+0xb8>
80008708:	e7943003 	ldr	r3, [r4, r3]
8000870c:	e50b3018 	str	r3, [fp, #-24]	@ 0xffffffe8
80008710:	ea00000b 	b	80008744 <get_debug_info+0x74>
80008714:	e24b3fce 	sub	r3, fp, #824	@ 0x338
80008718:	e51b1018 	ldr	r1, [fp, #-24]	@ 0xffffffe8
8000871c:	e1a00003 	mov	r0, r3
80008720:	eb000084 	bl	80008938 <update_debug_info>
80008724:	e51b301c 	ldr	r3, [fp, #-28]	@ 0xffffffe4
80008728:	e1a02003 	mov	r2, r3
8000872c:	e51b3344 	ldr	r3, [fp, #-836]	@ 0xfffffcbc
80008730:	e1520003 	cmp	r2, r3
80008734:	2a000008 	bcs	8000875c <get_debug_info+0x8c>
80008738:	e51b3018 	ldr	r3, [fp, #-24]	@ 0xffffffe8
8000873c:	e283300c 	add	r3, r3, #12
80008740:	e50b3018 	str	r3, [fp, #-24]	@ 0xffffffe8
80008744:	e51b3018 	ldr	r3, [fp, #-24]	@ 0xffffffe8
80008748:	e59f203c 	ldr	r2, [pc, #60]	@ 8000878c <get_debug_info+0xbc>
8000874c:	e7942002 	ldr	r2, [r4, r2]
80008750:	e1530002 	cmp	r3, r2
80008754:	1affffee 	bne	80008714 <get_debug_info+0x44>
80008758:	ea000000 	b	80008760 <get_debug_info+0x90>
8000875c:	e320f000 	nop	{0}
80008760:	e51b3340 	ldr	r3, [fp, #-832]	@ 0xfffffcc0
80008764:	e1a00003 	mov	r0, r3
80008768:	e24b3fce 	sub	r3, fp, #824	@ 0x338
8000876c:	e3a02e32 	mov	r2, #800	@ 0x320
80008770:	e1a01003 	mov	r1, r3
80008774:	eb000e2d 	bl	8000c030 <memcpy>
80008778:	e51b0340 	ldr	r0, [fp, #-832]	@ 0xfffffcc0
8000877c:	e24bd010 	sub	sp, fp, #16
80008780:	e89da810 	ldm	sp, {r4, fp, sp, pc}
80008784:	0001790c 	andeq	r7, r1, ip, lsl #18
80008788:	00000004 	andeq	r0, r0, r4
8000878c:	00000038 	andeq	r0, r0, r8, lsr r0

80008790 <get_function_bounds>:
80008790:	e1a0c00d 	mov	ip, sp
80008794:	e92dd810 	push	{r4, fp, ip, lr, pc}
80008798:	e24cb004 	sub	fp, ip, #4
8000879c:	e24dd09c 	sub	sp, sp, #156	@ 0x9c
800087a0:	e50b00a0 	str	r0, [fp, #-160]	@ 0xffffff60
800087a4:	e50b10a4 	str	r1, [fp, #-164]	@ 0xffffff5c
800087a8:	e50b20a8 	str	r2, [fp, #-168]	@ 0xffffff58
800087ac:	e59f4110 	ldr	r4, [pc, #272]	@ 800088c4 <get_function_bounds+0x134>
800087b0:	e08f4004 	add	r4, pc, r4
800087b4:	e3a03000 	mov	r3, #0
800087b8:	e50b3018 	str	r3, [fp, #-24]	@ 0xffffffe8
800087bc:	e51b30a8 	ldr	r3, [fp, #-168]	@ 0xffffff58
800087c0:	e3e02000 	mvn	r2, #0
800087c4:	e5832000 	str	r2, [r3]
800087c8:	e51b30a8 	ldr	r3, [fp, #-168]	@ 0xffffff58
800087cc:	e5932000 	ldr	r2, [r3]
800087d0:	e51b30a4 	ldr	r3, [fp, #-164]	@ 0xffffff5c
800087d4:	e5832000 	str	r2, [r3]
800087d8:	e59f30e8 	ldr	r3, [pc, #232]	@ 800088c8 <get_function_bounds+0x138>
800087dc:	e7943003 	ldr	r3, [r4, r3]
800087e0:	e50b3018 	str	r3, [fp, #-24]	@ 0xffffffe8
800087e4:	ea000021 	b	80008870 <get_function_bounds+0xe0>
800087e8:	e51b3018 	ldr	r3, [fp, #-24]	@ 0xffffffe8
800087ec:	e5d33004 	ldrb	r3, [r3, #4]
800087f0:	e3530024 	cmp	r3, #36	@ 0x24
800087f4:	1a00001a 	bne	80008864 <get_function_bounds+0xd4>
800087f8:	e24b3098 	sub	r3, fp, #152	@ 0x98
800087fc:	e1a01003 	mov	r1, r3
80008800:	e51b0018 	ldr	r0, [fp, #-24]	@ 0xffffffe8
80008804:	eb0000a2 	bl	80008a94 <get_symbol_name>
80008808:	e24b3098 	sub	r3, fp, #152	@ 0x98
8000880c:	e51b10a0 	ldr	r1, [fp, #-160]	@ 0xffffff60
80008810:	e1a00003 	mov	r0, r3
80008814:	eb000e74 	bl	8000c1ec <strcmp>
80008818:	e1a03000 	mov	r3, r0
8000881c:	e3530000 	cmp	r3, #0
80008820:	1a000005 	bne	8000883c <get_function_bounds+0xac>
80008824:	e51b3018 	ldr	r3, [fp, #-24]	@ 0xffffffe8
80008828:	e5933008 	ldr	r3, [r3, #8]
8000882c:	e1a02003 	mov	r2, r3
80008830:	e51b30a4 	ldr	r3, [fp, #-164]	@ 0xffffff5c
80008834:	e5832000 	str	r2, [r3]
80008838:	ea000009 	b	80008864 <get_function_bounds+0xd4>
8000883c:	e51b30a4 	ldr	r3, [fp, #-164]	@ 0xffffff5c
80008840:	e5933000 	ldr	r3, [r3]
80008844:	e3730001 	cmn	r3, #1
80008848:	0a000005 	beq	80008864 <get_function_bounds+0xd4>
8000884c:	e51b3018 	ldr	r3, [fp, #-24]	@ 0xffffffe8
80008850:	e5933008 	ldr	r3, [r3, #8]
80008854:	e1a02003 	mov	r2, r3
80008858:	e51b30a8 	ldr	r3, [fp, #-168]	@ 0xffffff58
8000885c:	e5832000 	str	r2, [r3]
80008860:	ea000007 	b	80008884 <get_function_bounds+0xf4>
80008864:	e51b3018 	ldr	r3, [fp, #-24]	@ 0xffffffe8
80008868:	e283300c 	add	r3, r3, #12
8000886c:	e50b3018 	str	r3, [fp, #-24]	@ 0xffffffe8
80008870:	e51b3018 	ldr	r3, [fp, #-24]	@ 0xffffffe8
80008874:	e59f2050 	ldr	r2, [pc, #80]	@ 800088cc <get_function_bounds+0x13c>
80008878:	e7942002 	ldr	r2, [r4, r2]
8000887c:	e1530002 	cmp	r3, r2
80008880:	1affffd8 	bne	800087e8 <get_function_bounds+0x58>
80008884:	e51b30a4 	ldr	r3, [fp, #-164]	@ 0xffffff5c
80008888:	e5933000 	ldr	r3, [r3]
8000888c:	e3730001 	cmn	r3, #1
80008890:	0a000008 	beq	800088b8 <get_function_bounds+0x128>
80008894:	e51b30a8 	ldr	r3, [fp, #-168]	@ 0xffffff58
80008898:	e5933000 	ldr	r3, [r3]
8000889c:	e3730001 	cmn	r3, #1
800088a0:	1a000004 	bne	800088b8 <get_function_bounds+0x128>
800088a4:	e59f3020 	ldr	r3, [pc, #32]	@ 800088cc <get_function_bounds+0x13c>
800088a8:	e7943003 	ldr	r3, [r4, r3]
800088ac:	e1a02003 	mov	r2, r3
800088b0:	e51b30a8 	ldr	r3, [fp, #-168]	@ 0xffffff58
800088b4:	e5832000 	str	r2, [r3]
800088b8:	e320f000 	nop	{0}
800088bc:	e24bd010 	sub	sp, fp, #16
800088c0:	e89da810 	ldm	sp, {r4, fp, sp, pc}
800088c4:	00017848 	andeq	r7, r1, r8, asr #16
800088c8:	00000004 	andeq	r0, r0, r4
800088cc:	00000038 	andeq	r0, r0, r8, lsr r0

800088d0 <init_debug_info>:
800088d0:	e1a0c00d 	mov	ip, sp
800088d4:	e92dd800 	push	{fp, ip, lr, pc}
800088d8:	e24cb004 	sub	fp, ip, #4
800088dc:	e24dd008 	sub	sp, sp, #8
800088e0:	e50b0010 	str	r0, [fp, #-16]
800088e4:	e51b3010 	ldr	r3, [fp, #-16]
800088e8:	e3a02000 	mov	r2, #0
800088ec:	e5c32000 	strb	r2, [r3]
800088f0:	e51b3010 	ldr	r3, [fp, #-16]
800088f4:	e3a02000 	mov	r2, #0
800088f8:	e5c32080 	strb	r2, [r3, #128]	@ 0x80
800088fc:	e51b3010 	ldr	r3, [fp, #-16]
80008900:	e3a02000 	mov	r2, #0
80008904:	e5832100 	str	r2, [r3, #256]	@ 0x100
80008908:	e51b3010 	ldr	r3, [fp, #-16]
8000890c:	e3a02000 	mov	r2, #0
80008910:	e5832104 	str	r2, [r3, #260]	@ 0x104
80008914:	e51b3010 	ldr	r3, [fp, #-16]
80008918:	e3a02000 	mov	r2, #0
8000891c:	e5832318 	str	r2, [r3, #792]	@ 0x318
80008920:	e51b3010 	ldr	r3, [fp, #-16]
80008924:	e3a02000 	mov	r2, #0
80008928:	e583231c 	str	r2, [r3, #796]	@ 0x31c
8000892c:	e320f000 	nop	{0}
80008930:	e24bd00c 	sub	sp, fp, #12
80008934:	e89da800 	ldm	sp, {fp, sp, pc}

80008938 <update_debug_info>:
80008938:	e1a0c00d 	mov	ip, sp
8000893c:	e92dd800 	push	{fp, ip, lr, pc}
80008940:	e24cb004 	sub	fp, ip, #4
80008944:	e24dd088 	sub	sp, sp, #136	@ 0x88
80008948:	e50b0090 	str	r0, [fp, #-144]	@ 0xffffff70
8000894c:	e50b1094 	str	r1, [fp, #-148]	@ 0xffffff6c
80008950:	e24b308c 	sub	r3, fp, #140	@ 0x8c
80008954:	e1a01003 	mov	r1, r3
80008958:	e51b0094 	ldr	r0, [fp, #-148]	@ 0xffffff6c
8000895c:	eb00004c 	bl	80008a94 <get_symbol_name>
80008960:	e51b3094 	ldr	r3, [fp, #-148]	@ 0xffffff6c
80008964:	e5d33004 	ldrb	r3, [r3, #4]
80008968:	e35300a0 	cmp	r3, #160	@ 0xa0
8000896c:	0a00001f 	beq	800089f0 <update_debug_info+0xb8>
80008970:	e35300a0 	cmp	r3, #160	@ 0xa0
80008974:	ca000043 	bgt	80008a88 <update_debug_info+0x150>
80008978:	e3530064 	cmp	r3, #100	@ 0x64
8000897c:	0a000006 	beq	8000899c <update_debug_info+0x64>
80008980:	e3530064 	cmp	r3, #100	@ 0x64
80008984:	ca00003f 	bgt	80008a88 <update_debug_info+0x150>
80008988:	e3530024 	cmp	r3, #36	@ 0x24
8000898c:	0a000008 	beq	800089b4 <update_debug_info+0x7c>
80008990:	e3530044 	cmp	r3, #68	@ 0x44
80008994:	0a00002c 	beq	80008a4c <update_debug_info+0x114>
80008998:	ea00003a 	b	80008a88 <update_debug_info+0x150>
8000899c:	e51b3090 	ldr	r3, [fp, #-144]	@ 0xffffff70
800089a0:	e24b208c 	sub	r2, fp, #140	@ 0x8c
800089a4:	e1a01002 	mov	r1, r2
800089a8:	e1a00003 	mov	r0, r3
800089ac:	eb000dc2 	bl	8000c0bc <strcpy>
800089b0:	ea000034 	b	80008a88 <update_debug_info+0x150>
800089b4:	e51b3090 	ldr	r3, [fp, #-144]	@ 0xffffff70
800089b8:	e2833080 	add	r3, r3, #128	@ 0x80
800089bc:	e24b208c 	sub	r2, fp, #140	@ 0x8c
800089c0:	e1a01002 	mov	r1, r2
800089c4:	e1a00003 	mov	r0, r3
800089c8:	eb000dbb 	bl	8000c0bc <strcpy>
800089cc:	e51b3094 	ldr	r3, [fp, #-148]	@ 0xffffff6c
800089d0:	e5933008 	ldr	r3, [r3, #8]
800089d4:	e1a02003 	mov	r2, r3
800089d8:	e51b3090 	ldr	r3, [fp, #-144]	@ 0xffffff70
800089dc:	e5832100 	str	r2, [r3, #256]	@ 0x100
800089e0:	e51b3090 	ldr	r3, [fp, #-144]	@ 0xffffff70
800089e4:	e3a02000 	mov	r2, #0
800089e8:	e5832104 	str	r2, [r3, #260]	@ 0x104
800089ec:	ea000025 	b	80008a88 <update_debug_info+0x150>
800089f0:	e51b3090 	ldr	r3, [fp, #-144]	@ 0xffffff70
800089f4:	e5933104 	ldr	r3, [r3, #260]	@ 0x104
800089f8:	e1a03383 	lsl	r3, r3, #7
800089fc:	e2833f42 	add	r3, r3, #264	@ 0x108
80008a00:	e51b2090 	ldr	r2, [fp, #-144]	@ 0xffffff70
80008a04:	e0823003 	add	r3, r2, r3
80008a08:	e24b208c 	sub	r2, fp, #140	@ 0x8c
80008a0c:	e1a01002 	mov	r1, r2
80008a10:	e1a00003 	mov	r0, r3
80008a14:	eb000da8 	bl	8000c0bc <strcpy>
80008a18:	e51b3094 	ldr	r3, [fp, #-148]	@ 0xffffff6c
80008a1c:	e5931008 	ldr	r1, [r3, #8]
80008a20:	e51b3090 	ldr	r3, [fp, #-144]	@ 0xffffff70
80008a24:	e5932104 	ldr	r2, [r3, #260]	@ 0x104
80008a28:	e51b3090 	ldr	r3, [fp, #-144]	@ 0xffffff70
80008a2c:	e28220c2 	add	r2, r2, #194	@ 0xc2
80008a30:	e7831102 	str	r1, [r3, r2, lsl #2]
80008a34:	e51b3090 	ldr	r3, [fp, #-144]	@ 0xffffff70
80008a38:	e5933104 	ldr	r3, [r3, #260]	@ 0x104
80008a3c:	e2832001 	add	r2, r3, #1
80008a40:	e51b3090 	ldr	r3, [fp, #-144]	@ 0xffffff70
80008a44:	e5832104 	str	r2, [r3, #260]	@ 0x104
80008a48:	ea00000e 	b	80008a88 <update_debug_info+0x150>
80008a4c:	e51b3090 	ldr	r3, [fp, #-144]	@ 0xffffff70
80008a50:	e5933100 	ldr	r3, [r3, #256]	@ 0x100
80008a54:	e1a02003 	mov	r2, r3
80008a58:	e51b3094 	ldr	r3, [fp, #-148]	@ 0xffffff6c
80008a5c:	e5933008 	ldr	r3, [r3, #8]
80008a60:	e0823003 	add	r3, r2, r3
80008a64:	e1a02003 	mov	r2, r3
80008a68:	e51b3090 	ldr	r3, [fp, #-144]	@ 0xffffff70
80008a6c:	e583231c 	str	r2, [r3, #796]	@ 0x31c
80008a70:	e51b3094 	ldr	r3, [fp, #-148]	@ 0xffffff6c
80008a74:	e1d330b6 	ldrh	r3, [r3, #6]
80008a78:	e2432001 	sub	r2, r3, #1
80008a7c:	e51b3090 	ldr	r3, [fp, #-144]	@ 0xffffff70
80008a80:	e5832318 	str	r2, [r3, #792]	@ 0x318
80008a84:	e320f000 	nop	{0}
80008a88:	e320f000 	nop	{0}
80008a8c:	e24bd00c 	sub	sp, fp, #12
80008a90:	e89da800 	ldm	sp, {fp, sp, pc}

80008a94 <get_symbol_name>:
80008a94:	e1a0c00d 	mov	ip, sp
80008a98:	e92dd800 	push	{fp, ip, lr, pc}
80008a9c:	e24cb004 	sub	fp, ip, #4
80008aa0:	e24dd010 	sub	sp, sp, #16
80008aa4:	e50b0018 	str	r0, [fp, #-24]	@ 0xffffffe8
80008aa8:	e50b101c 	str	r1, [fp, #-28]	@ 0xffffffe4
80008aac:	e59f1048 	ldr	r1, [pc, #72]	@ 80008afc <get_symbol_name+0x68>
80008ab0:	e08f1001 	add	r1, pc, r1
80008ab4:	e51b3018 	ldr	r3, [fp, #-24]	@ 0xffffffe8
80008ab8:	e5933000 	ldr	r3, [r3]
80008abc:	e59f203c 	ldr	r2, [pc, #60]	@ 80008b00 <get_symbol_name+0x6c>
80008ac0:	e7912002 	ldr	r2, [r1, r2]
80008ac4:	e0833002 	add	r3, r3, r2
80008ac8:	e50b3010 	str	r3, [fp, #-16]
80008acc:	e3a02080 	mov	r2, #128	@ 0x80
80008ad0:	e51b1010 	ldr	r1, [fp, #-16]
80008ad4:	e51b001c 	ldr	r0, [fp, #-28]	@ 0xffffffe4
80008ad8:	eb000d95 	bl	8000c134 <strlcpy>
80008adc:	e59f3020 	ldr	r3, [pc, #32]	@ 80008b04 <get_symbol_name+0x70>
80008ae0:	e08f3003 	add	r3, pc, r3
80008ae4:	e1a01003 	mov	r1, r3
80008ae8:	e51b001c 	ldr	r0, [fp, #-28]	@ 0xffffffe4
80008aec:	eb000e35 	bl	8000c3c8 <strtok>
80008af0:	e320f000 	nop	{0}
80008af4:	e24bd00c 	sub	sp, fp, #12
80008af8:	e89da800 	ldm	sp, {fp, sp, pc}
80008afc:	00017548 	andeq	r7, r1, r8, asr #10
80008b00:	00000014 	andeq	r0, r0, r4, lsl r0
80008b04:	000042fc 	strdeq	r4, [r0], -ip

80008b08 <c_entry>:
80008b08:	e1a0c00d 	mov	ip, sp
80008b0c:	e92dd800 	push	{fp, ip, lr, pc}
80008b10:	e24cb004 	sub	fp, ip, #4
80008b14:	e24dd008 	sub	sp, sp, #8
80008b18:	e59f2058 	ldr	r2, [pc, #88]	@ 80008b78 <c_entry+0x70>
80008b1c:	e08f2002 	add	r2, pc, r2
80008b20:	e59f3054 	ldr	r3, [pc, #84]	@ 80008b7c <c_entry+0x74>
80008b24:	e7923003 	ldr	r3, [r2, r3]
80008b28:	e2833602 	add	r3, r3, #2097152	@ 0x200000
80008b2c:	e3a01482 	mov	r1, #-2113929216	@ 0x82000000
80008b30:	e1a00003 	mov	r0, r3
80008b34:	eb000096 	bl	80008d94 <kalloc_init>
80008b38:	eb000181 	bl	80009144 <vm_init>
80008b3c:	eb000729 	bl	8000a7e8 <proc_init>
80008b40:	ebfffd6e 	bl	80008100 <console_init>
80008b44:	e59f1034 	ldr	r1, [pc, #52]	@ 80008b80 <c_entry+0x78>
80008b48:	e3a00482 	mov	r0, #-2113929216	@ 0x82000000
80008b4c:	eb000090 	bl	80008d94 <kalloc_init>
80008b50:	eb000749 	bl	8000a87c <proc_create>
80008b54:	e50b0010 	str	r0, [fp, #-16]
80008b58:	e3a01000 	mov	r1, #0
80008b5c:	e51b0010 	ldr	r0, [fp, #-16]
80008b60:	eb000af1 	bl	8000b72c <proc_load_program>
80008b64:	eb00094c 	bl	8000b09c <scheduler_init>
80008b68:	eb000961 	bl	8000b0f4 <schedule>
80008b6c:	e320f000 	nop	{0}
80008b70:	e24bd00c 	sub	sp, fp, #12
80008b74:	e89da800 	ldm	sp, {fp, sp, pc}
80008b78:	000174dc 	ldrdeq	r7, [r1], -ip
80008b7c:	00000020 	andeq	r0, r0, r0, lsr #32
80008b80:	9ff00000 	svcls	0x00f00000	@ IMB

80008b84 <register_interrupt_handler>:
80008b84:	e1a0c00d 	mov	ip, sp
80008b88:	e92dd810 	push	{r4, fp, ip, lr, pc}
80008b8c:	e24cb004 	sub	fp, ip, #4
80008b90:	e24dd00c 	sub	sp, sp, #12
80008b94:	e50b0018 	str	r0, [fp, #-24]	@ 0xffffffe8
80008b98:	e50b101c 	str	r1, [fp, #-28]	@ 0xffffffe4
80008b9c:	e59f4028 	ldr	r4, [pc, #40]	@ 80008bcc <register_interrupt_handler+0x48>
80008ba0:	e08f4004 	add	r4, pc, r4
80008ba4:	e51b0018 	ldr	r0, [fp, #-24]	@ 0xffffffe8
80008ba8:	eb000b91 	bl	8000b9f4 <enable_irq_line>
80008bac:	e59f301c 	ldr	r3, [pc, #28]	@ 80008bd0 <register_interrupt_handler+0x4c>
80008bb0:	e7943003 	ldr	r3, [r4, r3]
80008bb4:	e51b2018 	ldr	r2, [fp, #-24]	@ 0xffffffe8
80008bb8:	e51b101c 	ldr	r1, [fp, #-28]	@ 0xffffffe4
80008bbc:	e7831102 	str	r1, [r3, r2, lsl #2]
80008bc0:	e320f000 	nop	{0}
80008bc4:	e24bd010 	sub	sp, fp, #16
80008bc8:	e89da810 	ldm	sp, {r4, fp, sp, pc}
80008bcc:	00017458 	andeq	r7, r1, r8, asr r4
80008bd0:	00000040 	andeq	r0, r0, r0, asr #32

80008bd4 <dispatch_interrupts>:
80008bd4:	e1a0c00d 	mov	ip, sp
80008bd8:	e92dd810 	push	{r4, fp, ip, lr, pc}
80008bdc:	e24cb004 	sub	fp, ip, #4
80008be0:	e24dd08c 	sub	sp, sp, #140	@ 0x8c
80008be4:	e59f4094 	ldr	r4, [pc, #148]	@ 80008c80 <dispatch_interrupts+0xac>
80008be8:	e08f4004 	add	r4, pc, r4
80008bec:	e3a03000 	mov	r3, #0
80008bf0:	e50b301c 	str	r3, [fp, #-28]	@ 0xffffffe4
80008bf4:	e3a03000 	mov	r3, #0
80008bf8:	e50b3018 	str	r3, [fp, #-24]	@ 0xffffffe8
80008bfc:	e24b309c 	sub	r3, fp, #156	@ 0x9c
80008c00:	e1a00003 	mov	r0, r3
80008c04:	eb000b88 	bl	8000ba2c <get_pending_irqs>
80008c08:	e3a03000 	mov	r3, #0
80008c0c:	e50b3018 	str	r3, [fp, #-24]	@ 0xffffffe8
80008c10:	ea000013 	b	80008c64 <dispatch_interrupts+0x90>
80008c14:	e51b3018 	ldr	r3, [fp, #-24]	@ 0xffffffe8
80008c18:	e1a03103 	lsl	r3, r3, #2
80008c1c:	e2433014 	sub	r3, r3, #20
80008c20:	e083300b 	add	r3, r3, fp
80008c24:	e5133088 	ldr	r3, [r3, #-136]	@ 0xffffff78
80008c28:	e3530000 	cmp	r3, #0
80008c2c:	0a000009 	beq	80008c58 <dispatch_interrupts+0x84>
80008c30:	e59f304c 	ldr	r3, [pc, #76]	@ 80008c84 <dispatch_interrupts+0xb0>
80008c34:	e7943003 	ldr	r3, [r4, r3]
80008c38:	e51b2018 	ldr	r2, [fp, #-24]	@ 0xffffffe8
80008c3c:	e7933102 	ldr	r3, [r3, r2, lsl #2]
80008c40:	e50b301c 	str	r3, [fp, #-28]	@ 0xffffffe4
80008c44:	e51b301c 	ldr	r3, [fp, #-28]	@ 0xffffffe4
80008c48:	e3530000 	cmp	r3, #0
80008c4c:	0a000001 	beq	80008c58 <dispatch_interrupts+0x84>
80008c50:	e51b301c 	ldr	r3, [fp, #-28]	@ 0xffffffe4
80008c54:	e12fff33 	blx	r3
80008c58:	e51b3018 	ldr	r3, [fp, #-24]	@ 0xffffffe8
80008c5c:	e2833001 	add	r3, r3, #1
80008c60:	e50b3018 	str	r3, [fp, #-24]	@ 0xffffffe8
80008c64:	e51b3018 	ldr	r3, [fp, #-24]	@ 0xffffffe8
80008c68:	e353001f 	cmp	r3, #31
80008c6c:	daffffe8 	ble	80008c14 <dispatch_interrupts+0x40>
80008c70:	e320f000 	nop	{0}
80008c74:	e320f000 	nop	{0}
80008c78:	e24bd010 	sub	sp, fp, #16
80008c7c:	e89da810 	ldm	sp, {r4, fp, sp, pc}
80008c80:	00017410 	andeq	r7, r1, r0, lsl r4
80008c84:	00000040 	andeq	r0, r0, r0, asr #32

80008c88 <handle_syscall>:
80008c88:	e1a0c00d 	mov	ip, sp
80008c8c:	e92dd800 	push	{fp, ip, lr, pc}
80008c90:	e24cb004 	sub	fp, ip, #4
80008c94:	e24dd010 	sub	sp, sp, #16
80008c98:	e50b1014 	str	r1, [fp, #-20]	@ 0xffffffec
80008c9c:	e50b2018 	str	r2, [fp, #-24]	@ 0xffffffe8
80008ca0:	e50b301c 	str	r3, [fp, #-28]	@ 0xffffffe4
80008ca4:	e1a03000 	mov	r3, r0
80008ca8:	e54b300d 	strb	r3, [fp, #-13]
80008cac:	e55b200d 	ldrb	r2, [fp, #-13]
80008cb0:	e59f3024 	ldr	r3, [pc, #36]	@ 80008cdc <handle_syscall+0x54>
80008cb4:	e08f3003 	add	r3, pc, r3
80008cb8:	e7933102 	ldr	r3, [r3, r2, lsl #2]
80008cbc:	e51b201c 	ldr	r2, [fp, #-28]	@ 0xffffffe4
80008cc0:	e51b1018 	ldr	r1, [fp, #-24]	@ 0xffffffe8
80008cc4:	e51b0014 	ldr	r0, [fp, #-20]	@ 0xffffffec
80008cc8:	e12fff33 	blx	r3
80008ccc:	e1a03000 	mov	r3, r0
80008cd0:	e1a00003 	mov	r0, r3
80008cd4:	e24bd00c 	sub	sp, fp, #12
80008cd8:	e89da800 	ldm	sp, {fp, sp, pc}
80008cdc:	000173e0 	andeq	r7, r1, r0, ror #7

80008ce0 <enable_interrupts>:
80008ce0:	e10f1000 	mrs	r1, CPSR
80008ce4:	e3c11080 	bic	r1, r1, #128	@ 0x80
80008ce8:	e121f001 	msr	CPSR_c, r1
80008cec:	e1a0f00e 	mov	pc, lr

80008cf0 <use_high_interrupts>:
80008cf0:	e52de004 	push	{lr}		@ (str lr, [sp, #-4]!)
80008cf4:	eb000017 	bl	80008d58 <read_control_register>
80008cf8:	e3800a02 	orr	r0, r0, #8192	@ 0x2000
80008cfc:	eb000017 	bl	80008d60 <set_control_register>
80008d00:	e49de004 	pop	{lr}		@ (ldr lr, [sp], #4)
80008d04:	e1a0f00e 	mov	pc, lr

80008d08 <get_stack_pointer>:
80008d08:	e1a03000 	mov	r3, r0
80008d0c:	e10f1000 	mrs	r1, CPSR
80008d10:	e3c1201f 	bic	r2, r1, #31
80008d14:	e1822003 	orr	r2, r2, r3
80008d18:	e129f002 	msr	CPSR_fc, r2
80008d1c:	e1a0000d 	mov	r0, sp
80008d20:	e129f001 	msr	CPSR_fc, r1
80008d24:	e1a0f00e 	mov	pc, lr

80008d28 <read_cpsr>:
80008d28:	e10f0000 	mrs	r0, CPSR
80008d2c:	e1a0f00e 	mov	pc, lr

80008d30 <read_fp>:
80008d30:	e1a0000b 	mov	r0, fp
80008d34:	e1a0f00e 	mov	pc, lr

80008d38 <read_cpu_id>:
80008d38:	ee100f10 	mrc	15, 0, r0, cr0, cr0, {0}
80008d3c:	e1a0f00e 	mov	pc, lr

80008d40 <read_cache_type>:
80008d40:	ee100f30 	mrc	15, 0, r0, cr0, cr0, {1}
80008d44:	e1a0f00e 	mov	pc, lr

80008d48 <read_tcm_type>:
80008d48:	ee100f50 	mrc	15, 0, r0, cr0, cr0, {2}
80008d4c:	e1a0f00e 	mov	pc, lr

80008d50 <read_tlb_type>:
80008d50:	ee100f70 	mrc	15, 0, r0, cr0, cr0, {3}
80008d54:	e1a0f00e 	mov	pc, lr

80008d58 <read_control_register>:
80008d58:	ee110f10 	mrc	15, 0, r0, cr1, cr0, {0}
80008d5c:	e1a0f00e 	mov	pc, lr

80008d60 <set_control_register>:
80008d60:	ee010f10 	mcr	15, 0, r0, cr1, cr0, {0}
80008d64:	e1a0f00e 	mov	pc, lr

80008d68 <set_domain_access_control>:
80008d68:	ee030f10 	mcr	15, 0, r0, cr3, cr0, {0}
80008d6c:	e1a0f00e 	mov	pc, lr

80008d70 <set_translation_table_base>:
80008d70:	ee020f10 	mcr	15, 0, r0, cr2, cr0, {0}
80008d74:	e1a0f00e 	mov	pc, lr

80008d78 <jump_to_high_mem>:
80008d78:	e28ee102 	add	lr, lr, #-2147483648	@ 0x80000000
80008d7c:	e1a0f00e 	mov	pc, lr

80008d80 <switch_to_context>:
80008d80:	e8b05000 	ldm	r0!, {ip, lr}
80008d84:	e16ff00c 	msr	SPSR_fsxc, ip
80008d88:	e8d07fff 	ldm	r0, {r0, r1, r2, r3, r4, r5, r6, r7, r8, r9, sl, fp, ip, sp, lr}^
80008d8c:	e320f000 	nop	{0}
80008d90:	e1b0f00e 	movs	pc, lr

80008d94 <kalloc_init>:
80008d94:	e1a0c00d 	mov	ip, sp
80008d98:	e92dd800 	push	{fp, ip, lr, pc}
80008d9c:	e24cb004 	sub	fp, ip, #4
80008da0:	e24dd018 	sub	sp, sp, #24
80008da4:	e50b0020 	str	r0, [fp, #-32]	@ 0xffffffe0
80008da8:	e50b1024 	str	r1, [fp, #-36]	@ 0xffffffdc
80008dac:	e51b3020 	ldr	r3, [fp, #-32]	@ 0xffffffe0
80008db0:	e2833eff 	add	r3, r3, #4080	@ 0xff0
80008db4:	e283300f 	add	r3, r3, #15
80008db8:	e3c33eff 	bic	r3, r3, #4080	@ 0xff0
80008dbc:	e3c3300f 	bic	r3, r3, #15
80008dc0:	e50b3014 	str	r3, [fp, #-20]	@ 0xffffffec
80008dc4:	e51b3024 	ldr	r3, [fp, #-36]	@ 0xffffffdc
80008dc8:	e3c33eff 	bic	r3, r3, #4080	@ 0xff0
80008dcc:	e3c3300f 	bic	r3, r3, #15
80008dd0:	e50b3018 	str	r3, [fp, #-24]	@ 0xffffffe8
80008dd4:	e3a03000 	mov	r3, #0
80008dd8:	e50b3010 	str	r3, [fp, #-16]
80008ddc:	e59f3078 	ldr	r3, [pc, #120]	@ 80008e5c <kalloc_init+0xc8>
80008de0:	e08f3003 	add	r3, pc, r3
80008de4:	e3a02000 	mov	r2, #0
80008de8:	e5832000 	str	r2, [r3]
80008dec:	e59f306c 	ldr	r3, [pc, #108]	@ 80008e60 <kalloc_init+0xcc>
80008df0:	e08f3003 	add	r3, pc, r3
80008df4:	e3a02000 	mov	r2, #0
80008df8:	e5832000 	str	r2, [r3]
80008dfc:	e51b3014 	ldr	r3, [fp, #-20]	@ 0xffffffec
80008e00:	e50b3010 	str	r3, [fp, #-16]
80008e04:	ea00000c 	b	80008e3c <kalloc_init+0xa8>
80008e08:	e59f3054 	ldr	r3, [pc, #84]	@ 80008e64 <kalloc_init+0xd0>
80008e0c:	e08f3003 	add	r3, pc, r3
80008e10:	e5933000 	ldr	r3, [r3]
80008e14:	e51b1010 	ldr	r1, [fp, #-16]
80008e18:	e1a00003 	mov	r0, r3
80008e1c:	eb0000b9 	bl	80009108 <page_list_prepend>
80008e20:	e1a02000 	mov	r2, r0
80008e24:	e59f303c 	ldr	r3, [pc, #60]	@ 80008e68 <kalloc_init+0xd4>
80008e28:	e08f3003 	add	r3, pc, r3
80008e2c:	e5832000 	str	r2, [r3]
80008e30:	e51b3010 	ldr	r3, [fp, #-16]
80008e34:	e2833a01 	add	r3, r3, #4096	@ 0x1000
80008e38:	e50b3010 	str	r3, [fp, #-16]
80008e3c:	e51b2010 	ldr	r2, [fp, #-16]
80008e40:	e51b3018 	ldr	r3, [fp, #-24]	@ 0xffffffe8
80008e44:	e1520003 	cmp	r2, r3
80008e48:	1affffee 	bne	80008e08 <kalloc_init+0x74>
80008e4c:	e320f000 	nop	{0}
80008e50:	e320f000 	nop	{0}
80008e54:	e24bd00c 	sub	sp, fp, #12
80008e58:	e89da800 	ldm	sp, {fp, sp, pc}
80008e5c:	0001f2b0 			@ <UNDEFINED> instruction: 0x0001f2b0
80008e60:	0001f2a4 	andeq	pc, r1, r4, lsr #5
80008e64:	0001f284 	andeq	pc, r1, r4, lsl #5
80008e68:	0001f268 	andeq	pc, r1, r8, ror #4

80008e6c <kalloc>:
80008e6c:	e1a0c00d 	mov	ip, sp
80008e70:	e92dd800 	push	{fp, ip, lr, pc}
80008e74:	e24cb004 	sub	fp, ip, #4
80008e78:	e24dd008 	sub	sp, sp, #8
80008e7c:	e3a03000 	mov	r3, #0
80008e80:	e50b3010 	str	r3, [fp, #-16]
80008e84:	e59f3048 	ldr	r3, [pc, #72]	@ 80008ed4 <kalloc+0x68>
80008e88:	e08f3003 	add	r3, pc, r3
80008e8c:	e5933000 	ldr	r3, [r3]
80008e90:	e3530000 	cmp	r3, #0
80008e94:	0a00000a 	beq	80008ec4 <kalloc+0x58>
80008e98:	e59f3038 	ldr	r3, [pc, #56]	@ 80008ed8 <kalloc+0x6c>
80008e9c:	e08f3003 	add	r3, pc, r3
80008ea0:	e5933000 	ldr	r3, [r3]
80008ea4:	e50b3010 	str	r3, [fp, #-16]
80008ea8:	e59f302c 	ldr	r3, [pc, #44]	@ 80008edc <kalloc+0x70>
80008eac:	e08f3003 	add	r3, pc, r3
80008eb0:	e5933000 	ldr	r3, [r3]
80008eb4:	e5932000 	ldr	r2, [r3]
80008eb8:	e59f3020 	ldr	r3, [pc, #32]	@ 80008ee0 <kalloc+0x74>
80008ebc:	e08f3003 	add	r3, pc, r3
80008ec0:	e5832000 	str	r2, [r3]
80008ec4:	e51b3010 	ldr	r3, [fp, #-16]
80008ec8:	e1a00003 	mov	r0, r3
80008ecc:	e24bd00c 	sub	sp, fp, #12
80008ed0:	e89da800 	ldm	sp, {fp, sp, pc}
80008ed4:	0001f208 	andeq	pc, r1, r8, lsl #4
80008ed8:	0001f1f4 	strdeq	pc, [r1], -r4
80008edc:	0001f1e4 	andeq	pc, r1, r4, ror #3
80008ee0:	0001f1d4 	ldrdeq	pc, [r1], -r4

80008ee4 <kalloc1k>:
80008ee4:	e1a0c00d 	mov	ip, sp
80008ee8:	e92dd800 	push	{fp, ip, lr, pc}
80008eec:	e24cb004 	sub	fp, ip, #4
80008ef0:	e24dd008 	sub	sp, sp, #8
80008ef4:	e3a03000 	mov	r3, #0
80008ef8:	e50b3010 	str	r3, [fp, #-16]
80008efc:	e59f30a8 	ldr	r3, [pc, #168]	@ 80008fac <kalloc1k+0xc8>
80008f00:	e08f3003 	add	r3, pc, r3
80008f04:	e5933000 	ldr	r3, [r3]
80008f08:	e3530000 	cmp	r3, #0
80008f0c:	0a000012 	beq	80008f5c <kalloc1k+0x78>
80008f10:	ebffffd5 	bl	80008e6c <kalloc>
80008f14:	e50b0014 	str	r0, [fp, #-20]	@ 0xffffffec
80008f18:	e51b3014 	ldr	r3, [fp, #-20]	@ 0xffffffec
80008f1c:	e3530000 	cmp	r3, #0
80008f20:	0a00000d 	beq	80008f5c <kalloc1k+0x78>
80008f24:	e51b0014 	ldr	r0, [fp, #-20]	@ 0xffffffec
80008f28:	eb000038 	bl	80009010 <kfree1k>
80008f2c:	e51b3014 	ldr	r3, [fp, #-20]	@ 0xffffffec
80008f30:	e2833b01 	add	r3, r3, #1024	@ 0x400
80008f34:	e1a00003 	mov	r0, r3
80008f38:	eb000034 	bl	80009010 <kfree1k>
80008f3c:	e51b3014 	ldr	r3, [fp, #-20]	@ 0xffffffec
80008f40:	e2833b02 	add	r3, r3, #2048	@ 0x800
80008f44:	e1a00003 	mov	r0, r3
80008f48:	eb000030 	bl	80009010 <kfree1k>
80008f4c:	e51b3014 	ldr	r3, [fp, #-20]	@ 0xffffffec
80008f50:	e2833b03 	add	r3, r3, #3072	@ 0xc00
80008f54:	e1a00003 	mov	r0, r3
80008f58:	eb00002c 	bl	80009010 <kfree1k>
80008f5c:	e59f304c 	ldr	r3, [pc, #76]	@ 80008fb0 <kalloc1k+0xcc>
80008f60:	e08f3003 	add	r3, pc, r3
80008f64:	e5933000 	ldr	r3, [r3]
80008f68:	e3530000 	cmp	r3, #0
80008f6c:	0a00000a 	beq	80008f9c <kalloc1k+0xb8>
80008f70:	e59f303c 	ldr	r3, [pc, #60]	@ 80008fb4 <kalloc1k+0xd0>
80008f74:	e08f3003 	add	r3, pc, r3
80008f78:	e5933000 	ldr	r3, [r3]
80008f7c:	e50b3010 	str	r3, [fp, #-16]
80008f80:	e59f3030 	ldr	r3, [pc, #48]	@ 80008fb8 <kalloc1k+0xd4>
80008f84:	e08f3003 	add	r3, pc, r3
80008f88:	e5933000 	ldr	r3, [r3]
80008f8c:	e5932000 	ldr	r2, [r3]
80008f90:	e59f3024 	ldr	r3, [pc, #36]	@ 80008fbc <kalloc1k+0xd8>
80008f94:	e08f3003 	add	r3, pc, r3
80008f98:	e5832000 	str	r2, [r3]
80008f9c:	e51b3010 	ldr	r3, [fp, #-16]
80008fa0:	e1a00003 	mov	r0, r3
80008fa4:	e24bd00c 	sub	sp, fp, #12
80008fa8:	e89da800 	ldm	sp, {fp, sp, pc}
80008fac:	0001f194 	muleq	r1, r4, r1
80008fb0:	0001f134 	andeq	pc, r1, r4, lsr r1	@ <UNPREDICTABLE>
80008fb4:	0001f120 	andeq	pc, r1, r0, lsr #2
80008fb8:	0001f110 	andeq	pc, r1, r0, lsl r1	@ <UNPREDICTABLE>
80008fbc:	0001f100 	andeq	pc, r1, r0, lsl #2

80008fc0 <kfree>:
80008fc0:	e1a0c00d 	mov	ip, sp
80008fc4:	e92dd800 	push	{fp, ip, lr, pc}
80008fc8:	e24cb004 	sub	fp, ip, #4
80008fcc:	e24dd008 	sub	sp, sp, #8
80008fd0:	e50b0010 	str	r0, [fp, #-16]
80008fd4:	e59f302c 	ldr	r3, [pc, #44]	@ 80009008 <kfree+0x48>
80008fd8:	e08f3003 	add	r3, pc, r3
80008fdc:	e5933000 	ldr	r3, [r3]
80008fe0:	e51b1010 	ldr	r1, [fp, #-16]
80008fe4:	e1a00003 	mov	r0, r3
80008fe8:	eb000046 	bl	80009108 <page_list_prepend>
80008fec:	e1a02000 	mov	r2, r0
80008ff0:	e59f3014 	ldr	r3, [pc, #20]	@ 8000900c <kfree+0x4c>
80008ff4:	e08f3003 	add	r3, pc, r3
80008ff8:	e5832000 	str	r2, [r3]
80008ffc:	e320f000 	nop	{0}
80009000:	e24bd00c 	sub	sp, fp, #12
80009004:	e89da800 	ldm	sp, {fp, sp, pc}
80009008:	0001f0b8 	strheq	pc, [r1], -r8	@ <UNPREDICTABLE>
8000900c:	0001f09c 	muleq	r1, ip, r0

80009010 <kfree1k>:
80009010:	e1a0c00d 	mov	ip, sp
80009014:	e92dd800 	push	{fp, ip, lr, pc}
80009018:	e24cb004 	sub	fp, ip, #4
8000901c:	e24dd008 	sub	sp, sp, #8
80009020:	e50b0010 	str	r0, [fp, #-16]
80009024:	e59f302c 	ldr	r3, [pc, #44]	@ 80009058 <kfree1k+0x48>
80009028:	e08f3003 	add	r3, pc, r3
8000902c:	e5933000 	ldr	r3, [r3]
80009030:	e51b1010 	ldr	r1, [fp, #-16]
80009034:	e1a00003 	mov	r0, r3
80009038:	eb000032 	bl	80009108 <page_list_prepend>
8000903c:	e1a02000 	mov	r2, r0
80009040:	e59f3014 	ldr	r3, [pc, #20]	@ 8000905c <kfree1k+0x4c>
80009044:	e08f3003 	add	r3, pc, r3
80009048:	e5832000 	str	r2, [r3]
8000904c:	e320f000 	nop	{0}
80009050:	e24bd00c 	sub	sp, fp, #12
80009054:	e89da800 	ldm	sp, {fp, sp, pc}
80009058:	0001f06c 	andeq	pc, r1, ip, rrx
8000905c:	0001f050 	andeq	pc, r1, r0, asr r0	@ <UNPREDICTABLE>

80009060 <get_free_memory_size>:
80009060:	e1a0c00d 	mov	ip, sp
80009064:	e92dd800 	push	{fp, ip, lr, pc}
80009068:	e24cb004 	sub	fp, ip, #4
8000906c:	e24dd008 	sub	sp, sp, #8
80009070:	e3a03000 	mov	r3, #0
80009074:	e50b3010 	str	r3, [fp, #-16]
80009078:	e3a03000 	mov	r3, #0
8000907c:	e50b3014 	str	r3, [fp, #-20]	@ 0xffffffec
80009080:	e59f3078 	ldr	r3, [pc, #120]	@ 80009100 <get_free_memory_size+0xa0>
80009084:	e08f3003 	add	r3, pc, r3
80009088:	e5933000 	ldr	r3, [r3]
8000908c:	e50b3014 	str	r3, [fp, #-20]	@ 0xffffffec
80009090:	ea000005 	b	800090ac <get_free_memory_size+0x4c>
80009094:	e51b3010 	ldr	r3, [fp, #-16]
80009098:	e2833b01 	add	r3, r3, #1024	@ 0x400
8000909c:	e50b3010 	str	r3, [fp, #-16]
800090a0:	e51b3014 	ldr	r3, [fp, #-20]	@ 0xffffffec
800090a4:	e5933000 	ldr	r3, [r3]
800090a8:	e50b3014 	str	r3, [fp, #-20]	@ 0xffffffec
800090ac:	e51b3014 	ldr	r3, [fp, #-20]	@ 0xffffffec
800090b0:	e3530000 	cmp	r3, #0
800090b4:	1afffff6 	bne	80009094 <get_free_memory_size+0x34>
800090b8:	e59f3044 	ldr	r3, [pc, #68]	@ 80009104 <get_free_memory_size+0xa4>
800090bc:	e08f3003 	add	r3, pc, r3
800090c0:	e5933000 	ldr	r3, [r3]
800090c4:	e50b3014 	str	r3, [fp, #-20]	@ 0xffffffec
800090c8:	ea000005 	b	800090e4 <get_free_memory_size+0x84>
800090cc:	e51b3010 	ldr	r3, [fp, #-16]
800090d0:	e2833a01 	add	r3, r3, #4096	@ 0x1000
800090d4:	e50b3010 	str	r3, [fp, #-16]
800090d8:	e51b3014 	ldr	r3, [fp, #-20]	@ 0xffffffec
800090dc:	e5933000 	ldr	r3, [r3]
800090e0:	e50b3014 	str	r3, [fp, #-20]	@ 0xffffffec
800090e4:	e51b3014 	ldr	r3, [fp, #-20]	@ 0xffffffec
800090e8:	e3530000 	cmp	r3, #0
800090ec:	1afffff6 	bne	800090cc <get_free_memory_size+0x6c>
800090f0:	e51b3010 	ldr	r3, [fp, #-16]
800090f4:	e1a00003 	mov	r0, r3
800090f8:	e24bd00c 	sub	sp, fp, #12
800090fc:	e89da800 	ldm	sp, {fp, sp, pc}
80009100:	0001f010 	andeq	pc, r1, r0, lsl r0	@ <UNPREDICTABLE>
80009104:	0001efd8 	ldrdeq	lr, [r1], -r8

80009108 <page_list_prepend>:
80009108:	e1a0c00d 	mov	ip, sp
8000910c:	e92dd800 	push	{fp, ip, lr, pc}
80009110:	e24cb004 	sub	fp, ip, #4
80009114:	e24dd010 	sub	sp, sp, #16
80009118:	e50b0018 	str	r0, [fp, #-24]	@ 0xffffffe8
8000911c:	e50b101c 	str	r1, [fp, #-28]	@ 0xffffffe4
80009120:	e51b301c 	ldr	r3, [fp, #-28]	@ 0xffffffe4
80009124:	e50b3010 	str	r3, [fp, #-16]
80009128:	e51b3010 	ldr	r3, [fp, #-16]
8000912c:	e51b2018 	ldr	r2, [fp, #-24]	@ 0xffffffe8
80009130:	e5832000 	str	r2, [r3]
80009134:	e51b3010 	ldr	r3, [fp, #-16]
80009138:	e1a00003 	mov	r0, r3
8000913c:	e24bd00c 	sub	sp, fp, #12
80009140:	e89da800 	ldm	sp, {fp, sp, pc}

80009144 <vm_init>:
80009144:	e1a0c00d 	mov	ip, sp
80009148:	e92dd800 	push	{fp, ip, lr, pc}
8000914c:	e24cb004 	sub	fp, ip, #4
80009150:	e59f304c 	ldr	r3, [pc, #76]	@ 800091a4 <vm_init+0x60>
80009154:	e08f3003 	add	r3, pc, r3
80009158:	e59f2048 	ldr	r2, [pc, #72]	@ 800091a8 <vm_init+0x64>
8000915c:	e7932002 	ldr	r2, [r3, r2]
80009160:	e2822dff 	add	r2, r2, #16320	@ 0x3fc0
80009164:	e282203f 	add	r2, r2, #63	@ 0x3f
80009168:	e3c22dff 	bic	r2, r2, #16320	@ 0x3fc0
8000916c:	e3c2203f 	bic	r2, r2, #63	@ 0x3f
80009170:	e1a01002 	mov	r1, r2
80009174:	e59f2030 	ldr	r2, [pc, #48]	@ 800091ac <vm_init+0x68>
80009178:	e7932002 	ldr	r2, [r3, r2]
8000917c:	e5821000 	str	r1, [r2]
80009180:	e59f2024 	ldr	r2, [pc, #36]	@ 800091ac <vm_init+0x68>
80009184:	e7933002 	ldr	r3, [r3, r2]
80009188:	e5933000 	ldr	r3, [r3]
8000918c:	e1a00003 	mov	r0, r3
80009190:	eb000006 	bl	800091b0 <setup_kernel_vm>
80009194:	e3a00000 	mov	r0, #0
80009198:	ebfffef4 	bl	80008d70 <set_translation_table_base>
8000919c:	e320f000 	nop	{0}
800091a0:	e89da800 	ldm	sp, {fp, sp, pc}
800091a4:	00016ea4 	andeq	r6, r1, r4, lsr #29
800091a8:	00000020 	andeq	r0, r0, r0, lsr #32
800091ac:	0000000c 	andeq	r0, r0, ip

800091b0 <setup_kernel_vm>:
800091b0:	e1a0c00d 	mov	ip, sp
800091b4:	e92dd800 	push	{fp, ip, lr, pc}
800091b8:	e24cb004 	sub	fp, ip, #4
800091bc:	e24dd018 	sub	sp, sp, #24
800091c0:	e50b0018 	str	r0, [fp, #-24]	@ 0xffffffe8
800091c4:	e3a03000 	mov	r3, #0
800091c8:	e50b3010 	str	r3, [fp, #-16]
800091cc:	e3a02901 	mov	r2, #16384	@ 0x4000
800091d0:	e3a01000 	mov	r1, #0
800091d4:	e51b0018 	ldr	r0, [fp, #-24]	@ 0xffffffe8
800091d8:	eb000cdf 	bl	8000c55c <memset>
800091dc:	e3a03000 	mov	r3, #0
800091e0:	e50b3010 	str	r3, [fp, #-16]
800091e4:	ea00000e 	b	80009224 <setup_kernel_vm+0x74>
800091e8:	e59f2054 	ldr	r2, [pc, #84]	@ 80009244 <setup_kernel_vm+0x94>
800091ec:	e08f2002 	add	r2, pc, r2
800091f0:	e51b1010 	ldr	r1, [fp, #-16]
800091f4:	e1a03201 	lsl	r3, r1, #4
800091f8:	e0823003 	add	r3, r2, r3
800091fc:	e593300c 	ldr	r3, [r3, #12]
80009200:	e58d3000 	str	r3, [sp]
80009204:	e1a03201 	lsl	r3, r1, #4
80009208:	e0823003 	add	r3, r2, r3
8000920c:	e893000e 	ldm	r3, {r1, r2, r3}
80009210:	e51b0018 	ldr	r0, [fp, #-24]	@ 0xffffffe8
80009214:	eb00000b 	bl	80009248 <map_pages>
80009218:	e51b3010 	ldr	r3, [fp, #-16]
8000921c:	e2833001 	add	r3, r3, #1
80009220:	e50b3010 	str	r3, [fp, #-16]
80009224:	e3a02004 	mov	r2, #4
80009228:	e51b3010 	ldr	r3, [fp, #-16]
8000922c:	e1530002 	cmp	r3, r2
80009230:	baffffec 	blt	800091e8 <setup_kernel_vm+0x38>
80009234:	e320f000 	nop	{0}
80009238:	e320f000 	nop	{0}
8000923c:	e24bd00c 	sub	sp, fp, #12
80009240:	e89da800 	ldm	sp, {fp, sp, pc}
80009244:	00018d28 	andeq	r8, r1, r8, lsr #26

80009248 <map_pages>:
80009248:	e1a0c00d 	mov	ip, sp
8000924c:	e24dd010 	sub	sp, sp, #16
80009250:	e92dd800 	push	{fp, ip, lr, pc}
80009254:	e24cb014 	sub	fp, ip, #20
80009258:	e24dd020 	sub	sp, sp, #32
8000925c:	e50b0028 	str	r0, [fp, #-40]	@ 0xffffffd8
80009260:	e28b0008 	add	r0, fp, #8
80009264:	e880000e 	stm	r0, {r1, r2, r3}
80009268:	e3a03000 	mov	r3, #0
8000926c:	e50b3010 	str	r3, [fp, #-16]
80009270:	e3a03000 	mov	r3, #0
80009274:	e50b3014 	str	r3, [fp, #-20]	@ 0xffffffec
80009278:	e59b3008 	ldr	r3, [fp, #8]
8000927c:	e3c33eff 	bic	r3, r3, #4080	@ 0xff0
80009280:	e3c3300f 	bic	r3, r3, #15
80009284:	e50b3018 	str	r3, [fp, #-24]	@ 0xffffffe8
80009288:	e59b300c 	ldr	r3, [fp, #12]
8000928c:	e3c33eff 	bic	r3, r3, #4080	@ 0xff0
80009290:	e3c3300f 	bic	r3, r3, #15
80009294:	e50b301c 	str	r3, [fp, #-28]	@ 0xffffffe4
80009298:	e59b3010 	ldr	r3, [fp, #16]
8000929c:	e3c33eff 	bic	r3, r3, #4080	@ 0xff0
800092a0:	e3c3300f 	bic	r3, r3, #15
800092a4:	e50b3020 	str	r3, [fp, #-32]	@ 0xffffffe0
800092a8:	e51b3018 	ldr	r3, [fp, #-24]	@ 0xffffffe8
800092ac:	e50b3014 	str	r3, [fp, #-20]	@ 0xffffffec
800092b0:	e51b301c 	ldr	r3, [fp, #-28]	@ 0xffffffe4
800092b4:	e50b3010 	str	r3, [fp, #-16]
800092b8:	ea00000a 	b	800092e8 <map_pages+0xa0>
800092bc:	e59b3014 	ldr	r3, [fp, #20]
800092c0:	e51b2014 	ldr	r2, [fp, #-20]	@ 0xffffffec
800092c4:	e51b1010 	ldr	r1, [fp, #-16]
800092c8:	e51b0028 	ldr	r0, [fp, #-40]	@ 0xffffffd8
800092cc:	eb000035 	bl	800093a8 <map_page>
800092d0:	e51b3014 	ldr	r3, [fp, #-20]	@ 0xffffffec
800092d4:	e2833a01 	add	r3, r3, #4096	@ 0x1000
800092d8:	e50b3014 	str	r3, [fp, #-20]	@ 0xffffffec
800092dc:	e51b3010 	ldr	r3, [fp, #-16]
800092e0:	e2833a01 	add	r3, r3, #4096	@ 0x1000
800092e4:	e50b3010 	str	r3, [fp, #-16]
800092e8:	e51b2010 	ldr	r2, [fp, #-16]
800092ec:	e51b3020 	ldr	r3, [fp, #-32]	@ 0xffffffe0
800092f0:	e1520003 	cmp	r2, r3
800092f4:	1afffff0 	bne	800092bc <map_pages+0x74>
800092f8:	e320f000 	nop	{0}
800092fc:	e320f000 	nop	{0}
80009300:	e24bd00c 	sub	sp, fp, #12
80009304:	e89da800 	ldm	sp, {fp, sp, pc}

80009308 <free_vm_page_tables>:
80009308:	e1a0c00d 	mov	ip, sp
8000930c:	e92dd800 	push	{fp, ip, lr, pc}
80009310:	e24cb004 	sub	fp, ip, #4
80009314:	e24dd010 	sub	sp, sp, #16
80009318:	e50b0018 	str	r0, [fp, #-24]	@ 0xffffffe8
8000931c:	e3a03000 	mov	r3, #0
80009320:	e50b3010 	str	r3, [fp, #-16]
80009324:	e3a03000 	mov	r3, #0
80009328:	e50b3010 	str	r3, [fp, #-16]
8000932c:	ea000016 	b	8000938c <free_vm_page_tables+0x84>
80009330:	e51b3010 	ldr	r3, [fp, #-16]
80009334:	e1a03103 	lsl	r3, r3, #2
80009338:	e51b2018 	ldr	r2, [fp, #-24]	@ 0xffffffe8
8000933c:	e0823003 	add	r3, r2, r3
80009340:	e5d33000 	ldrb	r3, [r3]
80009344:	e2033003 	and	r3, r3, #3
80009348:	e6ef3073 	uxtb	r3, r3
8000934c:	e3530000 	cmp	r3, #0
80009350:	0a00000a 	beq	80009380 <free_vm_page_tables+0x78>
80009354:	e51b3010 	ldr	r3, [fp, #-16]
80009358:	e1a03103 	lsl	r3, r3, #2
8000935c:	e51b2018 	ldr	r2, [fp, #-24]	@ 0xffffffe8
80009360:	e0823003 	add	r3, r2, r3
80009364:	e5933000 	ldr	r3, [r3]
80009368:	e1a03523 	lsr	r3, r3, #10
8000936c:	e1a03503 	lsl	r3, r3, #10
80009370:	e2833102 	add	r3, r3, #-2147483648	@ 0x80000000
80009374:	e50b3014 	str	r3, [fp, #-20]	@ 0xffffffec
80009378:	e51b0014 	ldr	r0, [fp, #-20]	@ 0xffffffec
8000937c:	ebffff23 	bl	80009010 <kfree1k>
80009380:	e51b3010 	ldr	r3, [fp, #-16]
80009384:	e2833001 	add	r3, r3, #1
80009388:	e50b3010 	str	r3, [fp, #-16]
8000938c:	e51b3010 	ldr	r3, [fp, #-16]
80009390:	e3530a01 	cmp	r3, #4096	@ 0x1000
80009394:	baffffe5 	blt	80009330 <free_vm_page_tables+0x28>
80009398:	e320f000 	nop	{0}
8000939c:	e320f000 	nop	{0}
800093a0:	e24bd00c 	sub	sp, fp, #12
800093a4:	e89da800 	ldm	sp, {fp, sp, pc}

800093a8 <map_page>:
800093a8:	e1a0c00d 	mov	ip, sp
800093ac:	e92dd800 	push	{fp, ip, lr, pc}
800093b0:	e24cb004 	sub	fp, ip, #4
800093b4:	e24dd020 	sub	sp, sp, #32
800093b8:	e50b0020 	str	r0, [fp, #-32]	@ 0xffffffe0
800093bc:	e50b1024 	str	r1, [fp, #-36]	@ 0xffffffdc
800093c0:	e50b2028 	str	r2, [fp, #-40]	@ 0xffffffd8
800093c4:	e50b302c 	str	r3, [fp, #-44]	@ 0xffffffd4
800093c8:	e3a03000 	mov	r3, #0
800093cc:	e50b3010 	str	r3, [fp, #-16]
800093d0:	e51b3028 	ldr	r3, [fp, #-40]	@ 0xffffffd8
800093d4:	e1a03a23 	lsr	r3, r3, #20
800093d8:	e50b3014 	str	r3, [fp, #-20]	@ 0xffffffec
800093dc:	e51b3028 	ldr	r3, [fp, #-40]	@ 0xffffffd8
800093e0:	e1a03623 	lsr	r3, r3, #12
800093e4:	e6ef3073 	uxtb	r3, r3
800093e8:	e50b3018 	str	r3, [fp, #-24]	@ 0xffffffe8
800093ec:	e51b3014 	ldr	r3, [fp, #-20]	@ 0xffffffec
800093f0:	e1a03103 	lsl	r3, r3, #2
800093f4:	e51b2020 	ldr	r2, [fp, #-32]	@ 0xffffffe0
800093f8:	e0823003 	add	r3, r2, r3
800093fc:	e5d33000 	ldrb	r3, [r3]
80009400:	e2033003 	and	r3, r3, #3
80009404:	e6ef3073 	uxtb	r3, r3
80009408:	e3530000 	cmp	r3, #0
8000940c:	1a000024 	bne	800094a4 <map_page+0xfc>
80009410:	ebfffeb3 	bl	80008ee4 <kalloc1k>
80009414:	e50b0010 	str	r0, [fp, #-16]
80009418:	e3a02b01 	mov	r2, #1024	@ 0x400
8000941c:	e3a01000 	mov	r1, #0
80009420:	e51b0010 	ldr	r0, [fp, #-16]
80009424:	eb000c4c 	bl	8000c55c <memset>
80009428:	e51b3010 	ldr	r3, [fp, #-16]
8000942c:	e2833102 	add	r3, r3, #-2147483648	@ 0x80000000
80009430:	e1a03523 	lsr	r3, r3, #10
80009434:	e51b2014 	ldr	r2, [fp, #-20]	@ 0xffffffec
80009438:	e1a02102 	lsl	r2, r2, #2
8000943c:	e51b1020 	ldr	r1, [fp, #-32]	@ 0xffffffe0
80009440:	e0811002 	add	r1, r1, r2
80009444:	e3c324ff 	bic	r2, r3, #-16777216	@ 0xff000000
80009448:	e3c22503 	bic	r2, r2, #12582912	@ 0xc00000
8000944c:	e5913000 	ldr	r3, [r1]
80009450:	e1a02502 	lsl	r2, r2, #10
80009454:	e1a03b03 	lsl	r3, r3, #22
80009458:	e1a03b23 	lsr	r3, r3, #22
8000945c:	e1833002 	orr	r3, r3, r2
80009460:	e5813000 	str	r3, [r1]
80009464:	e51b3014 	ldr	r3, [fp, #-20]	@ 0xffffffec
80009468:	e1a03103 	lsl	r3, r3, #2
8000946c:	e51b2020 	ldr	r2, [fp, #-32]	@ 0xffffffe0
80009470:	e0822003 	add	r2, r2, r3
80009474:	e5d23000 	ldrb	r3, [r2]
80009478:	e3c33002 	bic	r3, r3, #2
8000947c:	e3833001 	orr	r3, r3, #1
80009480:	e5c23000 	strb	r3, [r2]
80009484:	e51b3014 	ldr	r3, [fp, #-20]	@ 0xffffffec
80009488:	e1a03103 	lsl	r3, r3, #2
8000948c:	e51b2020 	ldr	r2, [fp, #-32]	@ 0xffffffe0
80009490:	e0822003 	add	r2, r2, r3
80009494:	e1d230b0 	ldrh	r3, [r2]
80009498:	e3c33e1e 	bic	r3, r3, #480	@ 0x1e0
8000949c:	e1c230b0 	strh	r3, [r2]
800094a0:	ea000008 	b	800094c8 <map_page+0x120>
800094a4:	e51b3014 	ldr	r3, [fp, #-20]	@ 0xffffffec
800094a8:	e1a03103 	lsl	r3, r3, #2
800094ac:	e51b2020 	ldr	r2, [fp, #-32]	@ 0xffffffe0
800094b0:	e0823003 	add	r3, r2, r3
800094b4:	e5933000 	ldr	r3, [r3]
800094b8:	e1a03523 	lsr	r3, r3, #10
800094bc:	e1a03503 	lsl	r3, r3, #10
800094c0:	e2833102 	add	r3, r3, #-2147483648	@ 0x80000000
800094c4:	e50b3010 	str	r3, [fp, #-16]
800094c8:	e51b3018 	ldr	r3, [fp, #-24]	@ 0xffffffe8
800094cc:	e1a03103 	lsl	r3, r3, #2
800094d0:	e51b2010 	ldr	r2, [fp, #-16]
800094d4:	e0822003 	add	r2, r2, r3
800094d8:	e5d23000 	ldrb	r3, [r2]
800094dc:	e3c33001 	bic	r3, r3, #1
800094e0:	e3833002 	orr	r3, r3, #2
800094e4:	e5c23000 	strb	r3, [r2]
800094e8:	e51b3018 	ldr	r3, [fp, #-24]	@ 0xffffffe8
800094ec:	e1a03103 	lsl	r3, r3, #2
800094f0:	e51b2010 	ldr	r2, [fp, #-16]
800094f4:	e0822003 	add	r2, r2, r3
800094f8:	e5d23000 	ldrb	r3, [r2]
800094fc:	e3c33004 	bic	r3, r3, #4
80009500:	e5c23000 	strb	r3, [r2]
80009504:	e51b3018 	ldr	r3, [fp, #-24]	@ 0xffffffe8
80009508:	e1a03103 	lsl	r3, r3, #2
8000950c:	e51b2010 	ldr	r2, [fp, #-16]
80009510:	e0822003 	add	r2, r2, r3
80009514:	e5d23000 	ldrb	r3, [r2]
80009518:	e3c33008 	bic	r3, r3, #8
8000951c:	e5c23000 	strb	r3, [r2]
80009520:	e51b3018 	ldr	r3, [fp, #-24]	@ 0xffffffe8
80009524:	e1a03103 	lsl	r3, r3, #2
80009528:	e51b2010 	ldr	r2, [fp, #-16]
8000952c:	e0821003 	add	r1, r2, r3
80009530:	e51b302c 	ldr	r3, [fp, #-44]	@ 0xffffffd4
80009534:	e6ef3073 	uxtb	r3, r3
80009538:	e1d120b0 	ldrh	r2, [r1]
8000953c:	e6ef3073 	uxtb	r3, r3
80009540:	e3c22eff 	bic	r2, r2, #4080	@ 0xff0
80009544:	e1a03203 	lsl	r3, r3, #4
80009548:	e1833002 	orr	r3, r3, r2
8000954c:	e1a02003 	mov	r2, r3
80009550:	e1c120b0 	strh	r2, [r1]
80009554:	e51b3024 	ldr	r3, [fp, #-36]	@ 0xffffffdc
80009558:	e1a03623 	lsr	r3, r3, #12
8000955c:	e51b2018 	ldr	r2, [fp, #-24]	@ 0xffffffe8
80009560:	e1a02102 	lsl	r2, r2, #2
80009564:	e51b1010 	ldr	r1, [fp, #-16]
80009568:	e0811002 	add	r1, r1, r2
8000956c:	e3c324ff 	bic	r2, r3, #-16777216	@ 0xff000000
80009570:	e3c2260f 	bic	r2, r2, #15728640	@ 0xf00000
80009574:	e5913000 	ldr	r3, [r1]
80009578:	e1a02602 	lsl	r2, r2, #12
8000957c:	e1a03a03 	lsl	r3, r3, #20
80009580:	e1a03a23 	lsr	r3, r3, #20
80009584:	e1833002 	orr	r3, r3, r2
80009588:	e5813000 	str	r3, [r1]
8000958c:	e320f000 	nop	{0}
80009590:	e24bd00c 	sub	sp, fp, #12
80009594:	e89da800 	ldm	sp, {fp, sp, pc}

80009598 <unmap_page>:
80009598:	e1a0c00d 	mov	ip, sp
8000959c:	e92dd800 	push	{fp, ip, lr, pc}
800095a0:	e24cb004 	sub	fp, ip, #4
800095a4:	e24dd018 	sub	sp, sp, #24
800095a8:	e50b0020 	str	r0, [fp, #-32]	@ 0xffffffe0
800095ac:	e50b1024 	str	r1, [fp, #-36]	@ 0xffffffdc
800095b0:	e3a03000 	mov	r3, #0
800095b4:	e50b3010 	str	r3, [fp, #-16]
800095b8:	e51b3024 	ldr	r3, [fp, #-36]	@ 0xffffffdc
800095bc:	e1a03a23 	lsr	r3, r3, #20
800095c0:	e50b3014 	str	r3, [fp, #-20]	@ 0xffffffec
800095c4:	e51b3024 	ldr	r3, [fp, #-36]	@ 0xffffffdc
800095c8:	e1a03623 	lsr	r3, r3, #12
800095cc:	e6ef3073 	uxtb	r3, r3
800095d0:	e50b3018 	str	r3, [fp, #-24]	@ 0xffffffe8
800095d4:	e51b3014 	ldr	r3, [fp, #-20]	@ 0xffffffec
800095d8:	e1a03103 	lsl	r3, r3, #2
800095dc:	e51b2020 	ldr	r2, [fp, #-32]	@ 0xffffffe0
800095e0:	e0823003 	add	r3, r2, r3
800095e4:	e5933000 	ldr	r3, [r3]
800095e8:	e1a03523 	lsr	r3, r3, #10
800095ec:	e1a03503 	lsl	r3, r3, #10
800095f0:	e2833102 	add	r3, r3, #-2147483648	@ 0x80000000
800095f4:	e50b3010 	str	r3, [fp, #-16]
800095f8:	e51b3018 	ldr	r3, [fp, #-24]	@ 0xffffffe8
800095fc:	e1a03103 	lsl	r3, r3, #2
80009600:	e51b2010 	ldr	r2, [fp, #-16]
80009604:	e0822003 	add	r2, r2, r3
80009608:	e5d23000 	ldrb	r3, [r2]
8000960c:	e3c33003 	bic	r3, r3, #3
80009610:	e5c23000 	strb	r3, [r2]
80009614:	e320f000 	nop	{0}
80009618:	e24bd00c 	sub	sp, fp, #12
8000961c:	e89da800 	ldm	sp, {fp, sp, pc}

80009620 <resolve_physical_address>:
80009620:	e1a0c00d 	mov	ip, sp
80009624:	e92dd800 	push	{fp, ip, lr, pc}
80009628:	e24cb004 	sub	fp, ip, #4
8000962c:	e24dd018 	sub	sp, sp, #24
80009630:	e50b0020 	str	r0, [fp, #-32]	@ 0xffffffe0
80009634:	e50b1024 	str	r1, [fp, #-36]	@ 0xffffffdc
80009638:	e3a03000 	mov	r3, #0
8000963c:	e50b3010 	str	r3, [fp, #-16]
80009640:	e3a03000 	mov	r3, #0
80009644:	e50b3014 	str	r3, [fp, #-20]	@ 0xffffffec
80009648:	e3a03000 	mov	r3, #0
8000964c:	e50b3018 	str	r3, [fp, #-24]	@ 0xffffffe8
80009650:	e3a03000 	mov	r3, #0
80009654:	e50b301c 	str	r3, [fp, #-28]	@ 0xffffffe4
80009658:	e51b3024 	ldr	r3, [fp, #-36]	@ 0xffffffdc
8000965c:	e1a03a23 	lsr	r3, r3, #20
80009660:	e1a02103 	lsl	r2, r3, #2
80009664:	e51b3020 	ldr	r3, [fp, #-32]	@ 0xffffffe0
80009668:	e1823003 	orr	r3, r2, r3
8000966c:	e50b3010 	str	r3, [fp, #-16]
80009670:	e51b3010 	ldr	r3, [fp, #-16]
80009674:	e5933000 	ldr	r3, [r3]
80009678:	e1a03523 	lsr	r3, r3, #10
8000967c:	e1a03503 	lsl	r3, r3, #10
80009680:	e50b301c 	str	r3, [fp, #-28]	@ 0xffffffe4
80009684:	e51b3024 	ldr	r3, [fp, #-36]	@ 0xffffffdc
80009688:	e1a03523 	lsr	r3, r3, #10
8000968c:	e2032fff 	and	r2, r3, #1020	@ 0x3fc
80009690:	e51b301c 	ldr	r3, [fp, #-28]	@ 0xffffffe4
80009694:	e1823003 	orr	r3, r2, r3
80009698:	e50b3014 	str	r3, [fp, #-20]	@ 0xffffffec
8000969c:	e51b3014 	ldr	r3, [fp, #-20]	@ 0xffffffec
800096a0:	e5933000 	ldr	r3, [r3]
800096a4:	e1a03623 	lsr	r3, r3, #12
800096a8:	e1a02603 	lsl	r2, r3, #12
800096ac:	e51b3024 	ldr	r3, [fp, #-36]	@ 0xffffffdc
800096b0:	e1a03a03 	lsl	r3, r3, #20
800096b4:	e1a03a23 	lsr	r3, r3, #20
800096b8:	e1823003 	orr	r3, r2, r3
800096bc:	e50b3018 	str	r3, [fp, #-24]	@ 0xffffffe8
800096c0:	e51b3018 	ldr	r3, [fp, #-24]	@ 0xffffffe8
800096c4:	e1a00003 	mov	r0, r3
800096c8:	e24bd00c 	sub	sp, fp, #12
800096cc:	e89da800 	ldm	sp, {fp, sp, pc}

800096d0 <mon_backtrace>:
800096d0:	e1a0c00d 	mov	ip, sp
800096d4:	e92dd810 	push	{r4, fp, ip, lr, pc}
800096d8:	e24cb004 	sub	fp, ip, #4
800096dc:	e24ddfd1 	sub	sp, sp, #836	@ 0x344
800096e0:	e50b0348 	str	r0, [fp, #-840]	@ 0xfffffcb8
800096e4:	e50b134c 	str	r1, [fp, #-844]	@ 0xfffffcb4
800096e8:	e59f40e0 	ldr	r4, [pc, #224]	@ 800097d0 <mon_backtrace+0x100>
800096ec:	e08f4004 	add	r4, pc, r4
800096f0:	e3a03000 	mov	r3, #0
800096f4:	e50b3018 	str	r3, [fp, #-24]	@ 0xffffffe8
800096f8:	e3a03000 	mov	r3, #0
800096fc:	e50b301c 	str	r3, [fp, #-28]	@ 0xffffffe4
80009700:	ea000029 	b	800097ac <mon_backtrace+0xdc>
80009704:	e51b3018 	ldr	r3, [fp, #-24]	@ 0xffffffe8
80009708:	e5133004 	ldr	r3, [r3, #-4]
8000970c:	e50b3020 	str	r3, [fp, #-32]	@ 0xffffffe0
80009710:	e24b3d0d 	sub	r3, fp, #832	@ 0x340
80009714:	e51b101c 	ldr	r1, [fp, #-28]	@ 0xffffffe4
80009718:	e1a00003 	mov	r0, r3
8000971c:	ebfffbeb 	bl	800086d0 <get_debug_info>
80009720:	e51b3018 	ldr	r3, [fp, #-24]	@ 0xffffffe8
80009724:	e51b2020 	ldr	r2, [fp, #-32]	@ 0xffffffe0
80009728:	e1520003 	cmp	r2, r3
8000972c:	0a000022 	beq	800097bc <mon_backtrace+0xec>
80009730:	e51b3020 	ldr	r3, [fp, #-32]	@ 0xffffffe0
80009734:	e51b2018 	ldr	r2, [fp, #-24]	@ 0xffffffe8
80009738:	e59f1094 	ldr	r1, [pc, #148]	@ 800097d4 <mon_backtrace+0x104>
8000973c:	e08f1001 	add	r1, pc, r1
80009740:	e59f0090 	ldr	r0, [pc, #144]	@ 800097d8 <mon_backtrace+0x108>
80009744:	e7940000 	ldr	r0, [r4, r0]
80009748:	eb000c0c 	bl	8000c780 <printf_base>
8000974c:	e51b3028 	ldr	r3, [fp, #-40]	@ 0xffffffd8
80009750:	e24b2d0d 	sub	r2, fp, #832	@ 0x340
80009754:	e2821080 	add	r1, r2, #128	@ 0x80
80009758:	e24b2d0d 	sub	r2, fp, #832	@ 0x340
8000975c:	e58d3000 	str	r3, [sp]
80009760:	e1a03001 	mov	r3, r1
80009764:	e59f1070 	ldr	r1, [pc, #112]	@ 800097dc <mon_backtrace+0x10c>
80009768:	e08f1001 	add	r1, pc, r1
8000976c:	e59f0064 	ldr	r0, [pc, #100]	@ 800097d8 <mon_backtrace+0x108>
80009770:	e7940000 	ldr	r0, [r4, r0]
80009774:	eb000c01 	bl	8000c780 <printf_base>
80009778:	e51b323c 	ldr	r3, [fp, #-572]	@ 0xfffffdc4
8000977c:	e3530000 	cmp	r3, #0
80009780:	0a000003 	beq	80009794 <mon_backtrace+0xc4>
80009784:	e24b3d0d 	sub	r3, fp, #832	@ 0x340
80009788:	e51b1018 	ldr	r1, [fp, #-24]	@ 0xffffffe8
8000978c:	e1a00003 	mov	r0, r3
80009790:	eb000012 	bl	800097e0 <print_args>
80009794:	e51b3020 	ldr	r3, [fp, #-32]	@ 0xffffffe0
80009798:	e50b301c 	str	r3, [fp, #-28]	@ 0xffffffe4
8000979c:	e51b3018 	ldr	r3, [fp, #-24]	@ 0xffffffe8
800097a0:	e243300c 	sub	r3, r3, #12
800097a4:	e5933000 	ldr	r3, [r3]
800097a8:	e50b3018 	str	r3, [fp, #-24]	@ 0xffffffe8
800097ac:	e51b3018 	ldr	r3, [fp, #-24]	@ 0xffffffe8
800097b0:	e3530000 	cmp	r3, #0
800097b4:	1affffd2 	bne	80009704 <mon_backtrace+0x34>
800097b8:	ea000000 	b	800097c0 <mon_backtrace+0xf0>
800097bc:	e320f000 	nop	{0}
800097c0:	e3a03000 	mov	r3, #0
800097c4:	e1a00003 	mov	r0, r3
800097c8:	e24bd010 	sub	sp, fp, #16
800097cc:	e89da810 	ldm	sp, {r4, fp, sp, pc}
800097d0:	0001690c 	andeq	r6, r1, ip, lsl #18
800097d4:	00003bf8 	strdeq	r3, [r0], -r8
800097d8:	0000002c 	andeq	r0, r0, ip, lsr #32
800097dc:	00003be0 	andeq	r3, r0, r0, ror #23

800097e0 <print_args>:
800097e0:	e1a0c00d 	mov	ip, sp
800097e4:	e92dd810 	push	{r4, fp, ip, lr, pc}
800097e8:	e24cb004 	sub	fp, ip, #4
800097ec:	e24dd01c 	sub	sp, sp, #28
800097f0:	e50b0028 	str	r0, [fp, #-40]	@ 0xffffffd8
800097f4:	e50b102c 	str	r1, [fp, #-44]	@ 0xffffffd4
800097f8:	e59f40dc 	ldr	r4, [pc, #220]	@ 800098dc <print_args+0xfc>
800097fc:	e08f4004 	add	r4, pc, r4
80009800:	e3a03000 	mov	r3, #0
80009804:	e50b3018 	str	r3, [fp, #-24]	@ 0xffffffe8
80009808:	e59f30d0 	ldr	r3, [pc, #208]	@ 800098e0 <print_args+0x100>
8000980c:	e08f3003 	add	r3, pc, r3
80009810:	e1a01003 	mov	r1, r3
80009814:	e59f30c8 	ldr	r3, [pc, #200]	@ 800098e4 <print_args+0x104>
80009818:	e7943003 	ldr	r3, [r4, r3]
8000981c:	e1a00003 	mov	r0, r3
80009820:	eb000bd6 	bl	8000c780 <printf_base>
80009824:	e3a03000 	mov	r3, #0
80009828:	e50b3018 	str	r3, [fp, #-24]	@ 0xffffffe8
8000982c:	ea00001b 	b	800098a0 <print_args+0xc0>
80009830:	e51b3018 	ldr	r3, [fp, #-24]	@ 0xffffffe8
80009834:	e1a03383 	lsl	r3, r3, #7
80009838:	e2833f42 	add	r3, r3, #264	@ 0x108
8000983c:	e51b2028 	ldr	r2, [fp, #-40]	@ 0xffffffd8
80009840:	e0823003 	add	r3, r2, r3
80009844:	e50b301c 	str	r3, [fp, #-28]	@ 0xffffffe4
80009848:	e51b3028 	ldr	r3, [fp, #-40]	@ 0xffffffd8
8000984c:	e51b2018 	ldr	r2, [fp, #-24]	@ 0xffffffe8
80009850:	e28220c2 	add	r2, r2, #194	@ 0xc2
80009854:	e7933102 	ldr	r3, [r3, r2, lsl #2]
80009858:	e50b3020 	str	r3, [fp, #-32]	@ 0xffffffe0
8000985c:	e51b3020 	ldr	r3, [fp, #-32]	@ 0xffffffe0
80009860:	e1a03143 	asr	r3, r3, #2
80009864:	e1a03103 	lsl	r3, r3, #2
80009868:	e51b202c 	ldr	r2, [fp, #-44]	@ 0xffffffd4
8000986c:	e0823003 	add	r3, r2, r3
80009870:	e5933000 	ldr	r3, [r3]
80009874:	e50b3024 	str	r3, [fp, #-36]	@ 0xffffffdc
80009878:	e51b3024 	ldr	r3, [fp, #-36]	@ 0xffffffdc
8000987c:	e51b201c 	ldr	r2, [fp, #-28]	@ 0xffffffe4
80009880:	e59f1060 	ldr	r1, [pc, #96]	@ 800098e8 <print_args+0x108>
80009884:	e08f1001 	add	r1, pc, r1
80009888:	e59f0054 	ldr	r0, [pc, #84]	@ 800098e4 <print_args+0x104>
8000988c:	e7940000 	ldr	r0, [r4, r0]
80009890:	eb000bba 	bl	8000c780 <printf_base>
80009894:	e51b3018 	ldr	r3, [fp, #-24]	@ 0xffffffe8
80009898:	e2833001 	add	r3, r3, #1
8000989c:	e50b3018 	str	r3, [fp, #-24]	@ 0xffffffe8
800098a0:	e51b3028 	ldr	r3, [fp, #-40]	@ 0xffffffd8
800098a4:	e5933104 	ldr	r3, [r3, #260]	@ 0x104
800098a8:	e51b2018 	ldr	r2, [fp, #-24]	@ 0xffffffe8
800098ac:	e1520003 	cmp	r2, r3
800098b0:	baffffde 	blt	80009830 <print_args+0x50>
800098b4:	e59f3030 	ldr	r3, [pc, #48]	@ 800098ec <print_args+0x10c>
800098b8:	e08f3003 	add	r3, pc, r3
800098bc:	e1a01003 	mov	r1, r3
800098c0:	e59f301c 	ldr	r3, [pc, #28]	@ 800098e4 <print_args+0x104>
800098c4:	e7943003 	ldr	r3, [r4, r3]
800098c8:	e1a00003 	mov	r0, r3
800098cc:	eb000bab 	bl	8000c780 <printf_base>
800098d0:	e320f000 	nop	{0}
800098d4:	e24bd010 	sub	sp, fp, #16
800098d8:	e89da810 	ldm	sp, {r4, fp, sp, pc}
800098dc:	000167fc 	strdeq	r6, [r1], -ip
800098e0:	00003b4c 	andeq	r3, r0, ip, asr #22
800098e4:	0000002c 	andeq	r0, r0, ip, lsr #32
800098e8:	00003ae4 	andeq	r3, r0, r4, ror #21
800098ec:	00003ab8 			@ <UNDEFINED> instruction: 0x00003ab8

800098f0 <mon_execute>:
800098f0:	e1a0c00d 	mov	ip, sp
800098f4:	e92dd810 	push	{r4, fp, ip, lr, pc}
800098f8:	e24cb004 	sub	fp, ip, #4
800098fc:	e24dd01c 	sub	sp, sp, #28
80009900:	e50b0028 	str	r0, [fp, #-40]	@ 0xffffffd8
80009904:	e50b102c 	str	r1, [fp, #-44]	@ 0xffffffd4
80009908:	e59f40b8 	ldr	r4, [pc, #184]	@ 800099c8 <mon_execute+0xd8>
8000990c:	e08f4004 	add	r4, pc, r4
80009910:	e3a03000 	mov	r3, #0
80009914:	e50b3018 	str	r3, [fp, #-24]	@ 0xffffffe8
80009918:	e3a03000 	mov	r3, #0
8000991c:	e50b301c 	str	r3, [fp, #-28]	@ 0xffffffe4
80009920:	e3a03000 	mov	r3, #0
80009924:	e50b3020 	str	r3, [fp, #-32]	@ 0xffffffe0
80009928:	e51b3028 	ldr	r3, [fp, #-40]	@ 0xffffffd8
8000992c:	e3530001 	cmp	r3, #1
80009930:	ca000008 	bgt	80009958 <mon_execute+0x68>
80009934:	e59f3090 	ldr	r3, [pc, #144]	@ 800099cc <mon_execute+0xdc>
80009938:	e08f3003 	add	r3, pc, r3
8000993c:	e1a01003 	mov	r1, r3
80009940:	e59f3088 	ldr	r3, [pc, #136]	@ 800099d0 <mon_execute+0xe0>
80009944:	e7943003 	ldr	r3, [r4, r3]
80009948:	e1a00003 	mov	r0, r3
8000994c:	eb000b8b 	bl	8000c780 <printf_base>
80009950:	e3e03000 	mvn	r3, #0
80009954:	ea000018 	b	800099bc <mon_execute+0xcc>
80009958:	e51b302c 	ldr	r3, [fp, #-44]	@ 0xffffffd4
8000995c:	e2833004 	add	r3, r3, #4
80009960:	e5933000 	ldr	r3, [r3]
80009964:	e5d33000 	ldrb	r3, [r3]
80009968:	e2433030 	sub	r3, r3, #48	@ 0x30
8000996c:	e50b301c 	str	r3, [fp, #-28]	@ 0xffffffe4
80009970:	eb0003c1 	bl	8000a87c <proc_create>
80009974:	e50b0018 	str	r0, [fp, #-24]	@ 0xffffffe8
80009978:	e51b101c 	ldr	r1, [fp, #-28]	@ 0xffffffe4
8000997c:	e51b0018 	ldr	r0, [fp, #-24]	@ 0xffffffe8
80009980:	eb000769 	bl	8000b72c <proc_load_program>
80009984:	e50b0020 	str	r0, [fp, #-32]	@ 0xffffffe0
80009988:	e51b3020 	ldr	r3, [fp, #-32]	@ 0xffffffe0
8000998c:	e3530000 	cmp	r3, #0
80009990:	0a000001 	beq	8000999c <mon_execute+0xac>
80009994:	eb0005d6 	bl	8000b0f4 <schedule>
80009998:	ea000006 	b	800099b8 <mon_execute+0xc8>
8000999c:	e59f3030 	ldr	r3, [pc, #48]	@ 800099d4 <mon_execute+0xe4>
800099a0:	e08f3003 	add	r3, pc, r3
800099a4:	e1a01003 	mov	r1, r3
800099a8:	e59f3020 	ldr	r3, [pc, #32]	@ 800099d0 <mon_execute+0xe0>
800099ac:	e7943003 	ldr	r3, [r4, r3]
800099b0:	e1a00003 	mov	r0, r3
800099b4:	eb000b71 	bl	8000c780 <printf_base>
800099b8:	e3a03000 	mov	r3, #0
800099bc:	e1a00003 	mov	r0, r3
800099c0:	e24bd010 	sub	sp, fp, #16
800099c4:	e89da810 	ldm	sp, {r4, fp, sp, pc}
800099c8:	000166ec 	andeq	r6, r1, ip, ror #13
800099cc:	00003c9c 	muleq	r0, ip, ip
800099d0:	0000002c 	andeq	r0, r0, ip, lsr #32
800099d4:	00003c60 	andeq	r3, r0, r0, ror #24

800099d8 <mon_help>:
800099d8:	e1a0c00d 	mov	ip, sp
800099dc:	e92dd810 	push	{r4, fp, ip, lr, pc}
800099e0:	e24cb004 	sub	fp, ip, #4
800099e4:	e24dd014 	sub	sp, sp, #20
800099e8:	e50b0020 	str	r0, [fp, #-32]	@ 0xffffffe0
800099ec:	e50b1024 	str	r1, [fp, #-36]	@ 0xffffffdc
800099f0:	e59f40a0 	ldr	r4, [pc, #160]	@ 80009a98 <mon_help+0xc0>
800099f4:	e08f4004 	add	r4, pc, r4
800099f8:	e3a03000 	mov	r3, #0
800099fc:	e50b3018 	str	r3, [fp, #-24]	@ 0xffffffe8
80009a00:	e3a03000 	mov	r3, #0
80009a04:	e50b3018 	str	r3, [fp, #-24]	@ 0xffffffe8
80009a08:	ea00001b 	b	80009a7c <mon_help+0xa4>
80009a0c:	e59f1088 	ldr	r1, [pc, #136]	@ 80009a9c <mon_help+0xc4>
80009a10:	e08f1001 	add	r1, pc, r1
80009a14:	e51b2018 	ldr	r2, [fp, #-24]	@ 0xffffffe8
80009a18:	e1a03002 	mov	r3, r2
80009a1c:	e1a03083 	lsl	r3, r3, #1
80009a20:	e0833002 	add	r3, r3, r2
80009a24:	e1a03103 	lsl	r3, r3, #2
80009a28:	e0813003 	add	r3, r1, r3
80009a2c:	e5930000 	ldr	r0, [r3]
80009a30:	e59f1068 	ldr	r1, [pc, #104]	@ 80009aa0 <mon_help+0xc8>
80009a34:	e08f1001 	add	r1, pc, r1
80009a38:	e51b2018 	ldr	r2, [fp, #-24]	@ 0xffffffe8
80009a3c:	e1a03002 	mov	r3, r2
80009a40:	e1a03083 	lsl	r3, r3, #1
80009a44:	e0833002 	add	r3, r3, r2
80009a48:	e1a03103 	lsl	r3, r3, #2
80009a4c:	e0813003 	add	r3, r1, r3
80009a50:	e2833004 	add	r3, r3, #4
80009a54:	e5933000 	ldr	r3, [r3]
80009a58:	e1a02000 	mov	r2, r0
80009a5c:	e59f1040 	ldr	r1, [pc, #64]	@ 80009aa4 <mon_help+0xcc>
80009a60:	e08f1001 	add	r1, pc, r1
80009a64:	e59f003c 	ldr	r0, [pc, #60]	@ 80009aa8 <mon_help+0xd0>
80009a68:	e7940000 	ldr	r0, [r4, r0]
80009a6c:	eb000b43 	bl	8000c780 <printf_base>
80009a70:	e51b3018 	ldr	r3, [fp, #-24]	@ 0xffffffe8
80009a74:	e2833001 	add	r3, r3, #1
80009a78:	e50b3018 	str	r3, [fp, #-24]	@ 0xffffffe8
80009a7c:	e51b3018 	ldr	r3, [fp, #-24]	@ 0xffffffe8
80009a80:	e3530005 	cmp	r3, #5
80009a84:	9affffe0 	bls	80009a0c <mon_help+0x34>
80009a88:	e3a03000 	mov	r3, #0
80009a8c:	e1a00003 	mov	r0, r3
80009a90:	e24bd010 	sub	sp, fp, #16
80009a94:	e89da810 	ldm	sp, {r4, fp, sp, pc}
80009a98:	00016604 	andeq	r6, r1, r4, lsl #12
80009a9c:	00016734 	andeq	r6, r1, r4, lsr r7
80009aa0:	00016710 	andeq	r6, r1, r0, lsl r7
80009aa4:	00003d08 	andeq	r3, r0, r8, lsl #26
80009aa8:	0000002c 	andeq	r0, r0, ip, lsr #32

80009aac <mon_hextee>:
80009aac:	e1a0c00d 	mov	ip, sp
80009ab0:	e92dd810 	push	{r4, fp, ip, lr, pc}
80009ab4:	e24cb004 	sub	fp, ip, #4
80009ab8:	e24dd014 	sub	sp, sp, #20
80009abc:	e50b0020 	str	r0, [fp, #-32]	@ 0xffffffe0
80009ac0:	e50b1024 	str	r1, [fp, #-36]	@ 0xffffffdc
80009ac4:	e59f4090 	ldr	r4, [pc, #144]	@ 80009b5c <mon_hextee+0xb0>
80009ac8:	e08f4004 	add	r4, pc, r4
80009acc:	e59f308c 	ldr	r3, [pc, #140]	@ 80009b60 <mon_hextee+0xb4>
80009ad0:	e08f3003 	add	r3, pc, r3
80009ad4:	e1a01003 	mov	r1, r3
80009ad8:	e59f3084 	ldr	r3, [pc, #132]	@ 80009b64 <mon_hextee+0xb8>
80009adc:	e7943003 	ldr	r3, [r4, r3]
80009ae0:	e1a00003 	mov	r0, r3
80009ae4:	eb000b25 	bl	8000c780 <printf_base>
80009ae8:	ebfff9db 	bl	8000825c <kgetch>
80009aec:	e50b0018 	str	r0, [fp, #-24]	@ 0xffffffe8
80009af0:	e51b3018 	ldr	r3, [fp, #-24]	@ 0xffffffe8
80009af4:	e3530071 	cmp	r3, #113	@ 0x71
80009af8:	1a000007 	bne	80009b1c <mon_hextee+0x70>
80009afc:	e59f3064 	ldr	r3, [pc, #100]	@ 80009b68 <mon_hextee+0xbc>
80009b00:	e08f3003 	add	r3, pc, r3
80009b04:	e1a01003 	mov	r1, r3
80009b08:	e59f3054 	ldr	r3, [pc, #84]	@ 80009b64 <mon_hextee+0xb8>
80009b0c:	e7943003 	ldr	r3, [r4, r3]
80009b10:	e1a00003 	mov	r0, r3
80009b14:	eb000b19 	bl	8000c780 <printf_base>
80009b18:	ea00000b 	b	80009b4c <mon_hextee+0xa0>
80009b1c:	e51b3018 	ldr	r3, [fp, #-24]	@ 0xffffffe8
80009b20:	e3530000 	cmp	r3, #0
80009b24:	0affffef 	beq	80009ae8 <mon_hextee+0x3c>
80009b28:	e51b2018 	ldr	r2, [fp, #-24]	@ 0xffffffe8
80009b2c:	e59f3038 	ldr	r3, [pc, #56]	@ 80009b6c <mon_hextee+0xc0>
80009b30:	e08f3003 	add	r3, pc, r3
80009b34:	e1a01003 	mov	r1, r3
80009b38:	e59f3024 	ldr	r3, [pc, #36]	@ 80009b64 <mon_hextee+0xb8>
80009b3c:	e7943003 	ldr	r3, [r4, r3]
80009b40:	e1a00003 	mov	r0, r3
80009b44:	eb000b0d 	bl	8000c780 <printf_base>
80009b48:	eaffffe6 	b	80009ae8 <mon_hextee+0x3c>
80009b4c:	e3a03000 	mov	r3, #0
80009b50:	e1a00003 	mov	r0, r3
80009b54:	e24bd010 	sub	sp, fp, #16
80009b58:	e89da810 	ldm	sp, {r4, fp, sp, pc}
80009b5c:	00016530 	andeq	r6, r1, r0, lsr r5
80009b60:	00003df0 	strdeq	r3, [r0], -r0
80009b64:	0000002c 	andeq	r0, r0, ip, lsr #32
80009b68:	00003dd8 	ldrdeq	r3, [r0], -r8
80009b6c:	00003dac 	andeq	r3, r0, ip, lsr #27

80009b70 <mon_kerninfo>:
80009b70:	e1a0c00d 	mov	ip, sp
80009b74:	e92dd810 	push	{r4, fp, ip, lr, pc}
80009b78:	e24cb004 	sub	fp, ip, #4
80009b7c:	e24dd014 	sub	sp, sp, #20
80009b80:	e50b0020 	str	r0, [fp, #-32]	@ 0xffffffe0
80009b84:	e50b1024 	str	r1, [fp, #-36]	@ 0xffffffdc
80009b88:	e59f4128 	ldr	r4, [pc, #296]	@ 80009cb8 <mon_kerninfo+0x148>
80009b8c:	e08f4004 	add	r4, pc, r4
80009b90:	e59f3124 	ldr	r3, [pc, #292]	@ 80009cbc <mon_kerninfo+0x14c>
80009b94:	e7943003 	ldr	r3, [r4, r3]
80009b98:	e1a02003 	mov	r2, r3
80009b9c:	e59f311c 	ldr	r3, [pc, #284]	@ 80009cc0 <mon_kerninfo+0x150>
80009ba0:	e7943003 	ldr	r3, [r4, r3]
80009ba4:	e0423003 	sub	r3, r2, r3
80009ba8:	e2833fff 	add	r3, r3, #1020	@ 0x3fc
80009bac:	e2833003 	add	r3, r3, #3
80009bb0:	e2832fff 	add	r2, r3, #1020	@ 0x3fc
80009bb4:	e2822003 	add	r2, r2, #3
80009bb8:	e3530000 	cmp	r3, #0
80009bbc:	b1a03002 	movlt	r3, r2
80009bc0:	a1a03003 	movge	r3, r3
80009bc4:	e1a03543 	asr	r3, r3, #10
80009bc8:	e50b3018 	str	r3, [fp, #-24]	@ 0xffffffe8
80009bcc:	e59f30f0 	ldr	r3, [pc, #240]	@ 80009cc4 <mon_kerninfo+0x154>
80009bd0:	e08f3003 	add	r3, pc, r3
80009bd4:	e1a01003 	mov	r1, r3
80009bd8:	e59f30e8 	ldr	r3, [pc, #232]	@ 80009cc8 <mon_kerninfo+0x158>
80009bdc:	e7943003 	ldr	r3, [r4, r3]
80009be0:	e1a00003 	mov	r0, r3
80009be4:	eb000ae5 	bl	8000c780 <printf_base>
80009be8:	e59f30d0 	ldr	r3, [pc, #208]	@ 80009cc0 <mon_kerninfo+0x150>
80009bec:	e7943003 	ldr	r3, [r4, r3]
80009bf0:	e1a02003 	mov	r2, r3
80009bf4:	e59f30d0 	ldr	r3, [pc, #208]	@ 80009ccc <mon_kerninfo+0x15c>
80009bf8:	e08f3003 	add	r3, pc, r3
80009bfc:	e1a01003 	mov	r1, r3
80009c00:	e59f30c0 	ldr	r3, [pc, #192]	@ 80009cc8 <mon_kerninfo+0x158>
80009c04:	e7943003 	ldr	r3, [r4, r3]
80009c08:	e1a00003 	mov	r0, r3
80009c0c:	eb000adb 	bl	8000c780 <printf_base>
80009c10:	e59f30b8 	ldr	r3, [pc, #184]	@ 80009cd0 <mon_kerninfo+0x160>
80009c14:	e7943003 	ldr	r3, [r4, r3]
80009c18:	e1a02003 	mov	r2, r3
80009c1c:	e59f30b0 	ldr	r3, [pc, #176]	@ 80009cd4 <mon_kerninfo+0x164>
80009c20:	e08f3003 	add	r3, pc, r3
80009c24:	e1a01003 	mov	r1, r3
80009c28:	e59f3098 	ldr	r3, [pc, #152]	@ 80009cc8 <mon_kerninfo+0x158>
80009c2c:	e7943003 	ldr	r3, [r4, r3]
80009c30:	e1a00003 	mov	r0, r3
80009c34:	eb000ad1 	bl	8000c780 <printf_base>
80009c38:	e59f3098 	ldr	r3, [pc, #152]	@ 80009cd8 <mon_kerninfo+0x168>
80009c3c:	e7943003 	ldr	r3, [r4, r3]
80009c40:	e1a02003 	mov	r2, r3
80009c44:	e59f3090 	ldr	r3, [pc, #144]	@ 80009cdc <mon_kerninfo+0x16c>
80009c48:	e08f3003 	add	r3, pc, r3
80009c4c:	e1a01003 	mov	r1, r3
80009c50:	e59f3070 	ldr	r3, [pc, #112]	@ 80009cc8 <mon_kerninfo+0x158>
80009c54:	e7943003 	ldr	r3, [r4, r3]
80009c58:	e1a00003 	mov	r0, r3
80009c5c:	eb000ac7 	bl	8000c780 <printf_base>
80009c60:	e59f3054 	ldr	r3, [pc, #84]	@ 80009cbc <mon_kerninfo+0x14c>
80009c64:	e7943003 	ldr	r3, [r4, r3]
80009c68:	e1a02003 	mov	r2, r3
80009c6c:	e59f306c 	ldr	r3, [pc, #108]	@ 80009ce0 <mon_kerninfo+0x170>
80009c70:	e08f3003 	add	r3, pc, r3
80009c74:	e1a01003 	mov	r1, r3
80009c78:	e59f3048 	ldr	r3, [pc, #72]	@ 80009cc8 <mon_kerninfo+0x158>
80009c7c:	e7943003 	ldr	r3, [r4, r3]
80009c80:	e1a00003 	mov	r0, r3
80009c84:	eb000abd 	bl	8000c780 <printf_base>
80009c88:	e51b2018 	ldr	r2, [fp, #-24]	@ 0xffffffe8
80009c8c:	e59f3050 	ldr	r3, [pc, #80]	@ 80009ce4 <mon_kerninfo+0x174>
80009c90:	e08f3003 	add	r3, pc, r3
80009c94:	e1a01003 	mov	r1, r3
80009c98:	e59f3028 	ldr	r3, [pc, #40]	@ 80009cc8 <mon_kerninfo+0x158>
80009c9c:	e7943003 	ldr	r3, [r4, r3]
80009ca0:	e1a00003 	mov	r0, r3
80009ca4:	eb000ab5 	bl	8000c780 <printf_base>
80009ca8:	e3a03000 	mov	r3, #0
80009cac:	e1a00003 	mov	r0, r3
80009cb0:	e24bd010 	sub	sp, fp, #16
80009cb4:	e89da810 	ldm	sp, {r4, fp, sp, pc}
80009cb8:	0001646c 	andeq	r6, r1, ip, ror #8
80009cbc:	00000020 	andeq	r0, r0, r0, lsr #32
80009cc0:	00000000 	andeq	r0, r0, r0
80009cc4:	00003e5c 	andeq	r3, r0, ip, asr lr
80009cc8:	0000002c 	andeq	r0, r0, ip, lsr #32
80009ccc:	00003e50 	andeq	r3, r0, r0, asr lr
80009cd0:	0000001c 	andeq	r0, r0, ip, lsl r0
80009cd4:	00003e3c 	andeq	r3, r0, ip, lsr lr
80009cd8:	00000010 	andeq	r0, r0, r0, lsl r0
80009cdc:	00003e28 	andeq	r3, r0, r8, lsr #28
80009ce0:	00003e14 	andeq	r3, r0, r4, lsl lr
80009ce4:	00003e08 	andeq	r3, r0, r8, lsl #28

80009ce8 <mon_status>:
80009ce8:	e1a0c00d 	mov	ip, sp
80009cec:	e92dd800 	push	{fp, ip, lr, pc}
80009cf0:	e24cb004 	sub	fp, ip, #4
80009cf4:	e24dd008 	sub	sp, sp, #8
80009cf8:	e50b0010 	str	r0, [fp, #-16]
80009cfc:	e50b1014 	str	r1, [fp, #-20]	@ 0xffffffec
80009d00:	eb00000b 	bl	80009d34 <print_cpu_id>
80009d04:	eb00003e 	bl	80009e04 <print_cache_type>
80009d08:	eb000073 	bl	80009edc <print_tcm_type>
80009d0c:	eb000093 	bl	80009f60 <print_tlb_type>
80009d10:	eb0000c6 	bl	8000a030 <print_control_register>
80009d14:	eb000148 	bl	8000a23c <print_cpsr_status>
80009d18:	eb000197 	bl	8000a37c <print_supervisor_sp>
80009d1c:	eb0001b4 	bl	8000a3f4 <print_irq_sp>
80009d20:	eb0001d1 	bl	8000a46c <print_free_memory>
80009d24:	e3a03000 	mov	r3, #0
80009d28:	e1a00003 	mov	r0, r3
80009d2c:	e24bd00c 	sub	sp, fp, #12
80009d30:	e89da800 	ldm	sp, {fp, sp, pc}

80009d34 <print_cpu_id>:
80009d34:	e1a0c00d 	mov	ip, sp
80009d38:	e92dd810 	push	{r4, fp, ip, lr, pc}
80009d3c:	e24cb004 	sub	fp, ip, #4
80009d40:	e24dd01c 	sub	sp, sp, #28
80009d44:	e59f40a0 	ldr	r4, [pc, #160]	@ 80009dec <print_cpu_id+0xb8>
80009d48:	e08f4004 	add	r4, pc, r4
80009d4c:	ebfffbf9 	bl	80008d38 <read_cpu_id>
80009d50:	e50b0018 	str	r0, [fp, #-24]	@ 0xffffffe8
80009d54:	e51b3018 	ldr	r3, [fp, #-24]	@ 0xffffffe8
80009d58:	e3a0147f 	mov	r1, #2130706432	@ 0x7f000000
80009d5c:	e1a00003 	mov	r0, r3
80009d60:	eb0001d7 	bl	8000a4c4 <get_bits>
80009d64:	e1a03000 	mov	r3, r0
80009d68:	e50b301c 	str	r3, [fp, #-28]	@ 0xffffffe4
80009d6c:	e51b3018 	ldr	r3, [fp, #-24]	@ 0xffffffe8
80009d70:	e3a0180f 	mov	r1, #983040	@ 0xf0000
80009d74:	e1a00003 	mov	r0, r3
80009d78:	eb0001d1 	bl	8000a4c4 <get_bits>
80009d7c:	e1a03000 	mov	r3, r0
80009d80:	e50b3020 	str	r3, [fp, #-32]	@ 0xffffffe0
80009d84:	e51b3018 	ldr	r3, [fp, #-24]	@ 0xffffffe8
80009d88:	e59f1060 	ldr	r1, [pc, #96]	@ 80009df0 <print_cpu_id+0xbc>
80009d8c:	e1a00003 	mov	r0, r3
80009d90:	eb0001cb 	bl	8000a4c4 <get_bits>
80009d94:	e1a03000 	mov	r3, r0
80009d98:	e50b3024 	str	r3, [fp, #-36]	@ 0xffffffdc
80009d9c:	e59f3050 	ldr	r3, [pc, #80]	@ 80009df4 <print_cpu_id+0xc0>
80009da0:	e08f3003 	add	r3, pc, r3
80009da4:	e51b201c 	ldr	r2, [fp, #-28]	@ 0xffffffe4
80009da8:	e7931102 	ldr	r1, [r3, r2, lsl #2]
80009dac:	e59f3044 	ldr	r3, [pc, #68]	@ 80009df8 <print_cpu_id+0xc4>
80009db0:	e08f3003 	add	r3, pc, r3
80009db4:	e51b2020 	ldr	r2, [fp, #-32]	@ 0xffffffe0
80009db8:	e7932102 	ldr	r2, [r3, r2, lsl #2]
80009dbc:	e51b3024 	ldr	r3, [fp, #-36]	@ 0xffffffdc
80009dc0:	e58d3000 	str	r3, [sp]
80009dc4:	e1a03002 	mov	r3, r2
80009dc8:	e1a02001 	mov	r2, r1
80009dcc:	e59f1028 	ldr	r1, [pc, #40]	@ 80009dfc <print_cpu_id+0xc8>
80009dd0:	e08f1001 	add	r1, pc, r1
80009dd4:	e59f0024 	ldr	r0, [pc, #36]	@ 80009e00 <print_cpu_id+0xcc>
80009dd8:	e7940000 	ldr	r0, [r4, r0]
80009ddc:	eb000a67 	bl	8000c780 <printf_base>
80009de0:	e320f000 	nop	{0}
80009de4:	e24bd010 	sub	sp, fp, #16
80009de8:	e89da810 	ldm	sp, {r4, fp, sp, pc}
80009dec:	000162b0 			@ <UNDEFINED> instruction: 0x000162b0
80009df0:	0000fff0 	strdeq	pc, [r0], -r0
80009df4:	00016e94 	muleq	r1, r4, lr
80009df8:	00016e44 	andeq	r6, r1, r4, asr #28
80009dfc:	00003f54 	andeq	r3, r0, r4, asr pc
80009e00:	0000002c 	andeq	r0, r0, ip, lsr #32

80009e04 <print_cache_type>:
80009e04:	e1a0c00d 	mov	ip, sp
80009e08:	e92dd810 	push	{r4, fp, ip, lr, pc}
80009e0c:	e24cb004 	sub	fp, ip, #4
80009e10:	e24dd01c 	sub	sp, sp, #28
80009e14:	e59f40a4 	ldr	r4, [pc, #164]	@ 80009ec0 <print_cache_type+0xbc>
80009e18:	e08f4004 	add	r4, pc, r4
80009e1c:	ebfffbc7 	bl	80008d40 <read_cache_type>
80009e20:	e50b0018 	str	r0, [fp, #-24]	@ 0xffffffe8
80009e24:	e51b3018 	ldr	r3, [fp, #-24]	@ 0xffffffe8
80009e28:	e3a01401 	mov	r1, #16777216	@ 0x1000000
80009e2c:	e1a00003 	mov	r0, r3
80009e30:	eb0001a3 	bl	8000a4c4 <get_bits>
80009e34:	e1a03000 	mov	r3, r0
80009e38:	e50b301c 	str	r3, [fp, #-28]	@ 0xffffffe4
80009e3c:	e51b3018 	ldr	r3, [fp, #-24]	@ 0xffffffe8
80009e40:	e59f107c 	ldr	r1, [pc, #124]	@ 80009ec4 <print_cache_type+0xc0>
80009e44:	e1a00003 	mov	r0, r3
80009e48:	eb00019d 	bl	8000a4c4 <get_bits>
80009e4c:	e1a03000 	mov	r3, r0
80009e50:	e50b3020 	str	r3, [fp, #-32]	@ 0xffffffe0
80009e54:	e51b3018 	ldr	r3, [fp, #-24]	@ 0xffffffe8
80009e58:	e59f1068 	ldr	r1, [pc, #104]	@ 80009ec8 <print_cache_type+0xc4>
80009e5c:	e1a00003 	mov	r0, r3
80009e60:	eb000197 	bl	8000a4c4 <get_bits>
80009e64:	e1a03000 	mov	r3, r0
80009e68:	e50b3024 	str	r3, [fp, #-36]	@ 0xffffffdc
80009e6c:	e51b301c 	ldr	r3, [fp, #-28]	@ 0xffffffe4
80009e70:	e3530000 	cmp	r3, #0
80009e74:	0a000003 	beq	80009e88 <print_cache_type+0x84>
80009e78:	e59f304c 	ldr	r3, [pc, #76]	@ 80009ecc <print_cache_type+0xc8>
80009e7c:	e08f3003 	add	r3, pc, r3
80009e80:	e1a02003 	mov	r2, r3
80009e84:	ea000002 	b	80009e94 <print_cache_type+0x90>
80009e88:	e59f3040 	ldr	r3, [pc, #64]	@ 80009ed0 <print_cache_type+0xcc>
80009e8c:	e08f3003 	add	r3, pc, r3
80009e90:	e1a02003 	mov	r2, r3
80009e94:	e51b3024 	ldr	r3, [fp, #-36]	@ 0xffffffdc
80009e98:	e58d3000 	str	r3, [sp]
80009e9c:	e51b3020 	ldr	r3, [fp, #-32]	@ 0xffffffe0
80009ea0:	e59f102c 	ldr	r1, [pc, #44]	@ 80009ed4 <print_cache_type+0xd0>
80009ea4:	e08f1001 	add	r1, pc, r1
80009ea8:	e59f0028 	ldr	r0, [pc, #40]	@ 80009ed8 <print_cache_type+0xd4>
80009eac:	e7940000 	ldr	r0, [r4, r0]
80009eb0:	eb000a32 	bl	8000c780 <printf_base>
80009eb4:	e320f000 	nop	{0}
80009eb8:	e24bd010 	sub	sp, fp, #16
80009ebc:	e89da810 	ldm	sp, {r4, fp, sp, pc}
80009ec0:	000161e0 	andeq	r6, r1, r0, ror #3
80009ec4:	00fff000 	rscseq	pc, pc, r0
80009ec8:	00000fff 	strdeq	r0, [r0], -pc	@ <UNPREDICTABLE>
80009ecc:	00003ee0 	andeq	r3, r0, r0, ror #29
80009ed0:	00003edc 	ldrdeq	r3, [r0], -ip
80009ed4:	00003ecc 	andeq	r3, r0, ip, asr #29
80009ed8:	0000002c 	andeq	r0, r0, ip, lsr #32

80009edc <print_tcm_type>:
80009edc:	e1a0c00d 	mov	ip, sp
80009ee0:	e92dd810 	push	{r4, fp, ip, lr, pc}
80009ee4:	e24cb004 	sub	fp, ip, #4
80009ee8:	e24dd014 	sub	sp, sp, #20
80009eec:	e59f4060 	ldr	r4, [pc, #96]	@ 80009f54 <print_tcm_type+0x78>
80009ef0:	e08f4004 	add	r4, pc, r4
80009ef4:	ebfffb93 	bl	80008d48 <read_tcm_type>
80009ef8:	e50b0018 	str	r0, [fp, #-24]	@ 0xffffffe8
80009efc:	e51b3018 	ldr	r3, [fp, #-24]	@ 0xffffffe8
80009f00:	e3a01807 	mov	r1, #458752	@ 0x70000
80009f04:	e1a00003 	mov	r0, r3
80009f08:	eb00016d 	bl	8000a4c4 <get_bits>
80009f0c:	e1a03000 	mov	r3, r0
80009f10:	e50b301c 	str	r3, [fp, #-28]	@ 0xffffffe4
80009f14:	e51b3018 	ldr	r3, [fp, #-24]	@ 0xffffffe8
80009f18:	e3a01007 	mov	r1, #7
80009f1c:	e1a00003 	mov	r0, r3
80009f20:	eb000167 	bl	8000a4c4 <get_bits>
80009f24:	e1a03000 	mov	r3, r0
80009f28:	e50b3020 	str	r3, [fp, #-32]	@ 0xffffffe0
80009f2c:	e51b3020 	ldr	r3, [fp, #-32]	@ 0xffffffe0
80009f30:	e51b201c 	ldr	r2, [fp, #-28]	@ 0xffffffe4
80009f34:	e59f101c 	ldr	r1, [pc, #28]	@ 80009f58 <print_tcm_type+0x7c>
80009f38:	e08f1001 	add	r1, pc, r1
80009f3c:	e59f0018 	ldr	r0, [pc, #24]	@ 80009f5c <print_tcm_type+0x80>
80009f40:	e7940000 	ldr	r0, [r4, r0]
80009f44:	eb000a0d 	bl	8000c780 <printf_base>
80009f48:	e320f000 	nop	{0}
80009f4c:	e24bd010 	sub	sp, fp, #16
80009f50:	e89da810 	ldm	sp, {r4, fp, sp, pc}
80009f54:	00016108 	andeq	r6, r1, r8, lsl #2
80009f58:	00003e6c 	andeq	r3, r0, ip, ror #28
80009f5c:	0000002c 	andeq	r0, r0, ip, lsr #32

80009f60 <print_tlb_type>:
80009f60:	e1a0c00d 	mov	ip, sp
80009f64:	e92dd810 	push	{r4, fp, ip, lr, pc}
80009f68:	e24cb004 	sub	fp, ip, #4
80009f6c:	e24dd01c 	sub	sp, sp, #28
80009f70:	e59f40a4 	ldr	r4, [pc, #164]	@ 8000a01c <print_tlb_type+0xbc>
80009f74:	e08f4004 	add	r4, pc, r4
80009f78:	ebfffb74 	bl	80008d50 <read_tlb_type>
80009f7c:	e50b0018 	str	r0, [fp, #-24]	@ 0xffffffe8
80009f80:	e51b3018 	ldr	r3, [fp, #-24]	@ 0xffffffe8
80009f84:	e3a01001 	mov	r1, #1
80009f88:	e1a00003 	mov	r0, r3
80009f8c:	eb00014c 	bl	8000a4c4 <get_bits>
80009f90:	e1a03000 	mov	r3, r0
80009f94:	e50b301c 	str	r3, [fp, #-28]	@ 0xffffffe4
80009f98:	e51b3018 	ldr	r3, [fp, #-24]	@ 0xffffffe8
80009f9c:	e3a018ff 	mov	r1, #16711680	@ 0xff0000
80009fa0:	e1a00003 	mov	r0, r3
80009fa4:	eb000146 	bl	8000a4c4 <get_bits>
80009fa8:	e1a03000 	mov	r3, r0
80009fac:	e50b3020 	str	r3, [fp, #-32]	@ 0xffffffe0
80009fb0:	e51b3018 	ldr	r3, [fp, #-24]	@ 0xffffffe8
80009fb4:	e3a01cff 	mov	r1, #65280	@ 0xff00
80009fb8:	e1a00003 	mov	r0, r3
80009fbc:	eb000140 	bl	8000a4c4 <get_bits>
80009fc0:	e1a03000 	mov	r3, r0
80009fc4:	e50b3024 	str	r3, [fp, #-36]	@ 0xffffffdc
80009fc8:	e51b301c 	ldr	r3, [fp, #-28]	@ 0xffffffe4
80009fcc:	e3530000 	cmp	r3, #0
80009fd0:	0a000003 	beq	80009fe4 <print_tlb_type+0x84>
80009fd4:	e59f3044 	ldr	r3, [pc, #68]	@ 8000a020 <print_tlb_type+0xc0>
80009fd8:	e08f3003 	add	r3, pc, r3
80009fdc:	e1a02003 	mov	r2, r3
80009fe0:	ea000002 	b	80009ff0 <print_tlb_type+0x90>
80009fe4:	e59f3038 	ldr	r3, [pc, #56]	@ 8000a024 <print_tlb_type+0xc4>
80009fe8:	e08f3003 	add	r3, pc, r3
80009fec:	e1a02003 	mov	r2, r3
80009ff0:	e51b3024 	ldr	r3, [fp, #-36]	@ 0xffffffdc
80009ff4:	e58d3000 	str	r3, [sp]
80009ff8:	e51b3020 	ldr	r3, [fp, #-32]	@ 0xffffffe0
80009ffc:	e59f1024 	ldr	r1, [pc, #36]	@ 8000a028 <print_tlb_type+0xc8>
8000a000:	e08f1001 	add	r1, pc, r1
8000a004:	e59f0020 	ldr	r0, [pc, #32]	@ 8000a02c <print_tlb_type+0xcc>
8000a008:	e7940000 	ldr	r0, [r4, r0]
8000a00c:	eb0009db 	bl	8000c780 <printf_base>
8000a010:	e320f000 	nop	{0}
8000a014:	e24bd010 	sub	sp, fp, #16
8000a018:	e89da810 	ldm	sp, {r4, fp, sp, pc}
8000a01c:	00016084 	andeq	r6, r1, r4, lsl #1
8000a020:	00003d84 	andeq	r3, r0, r4, lsl #27
8000a024:	00003d80 	andeq	r3, r0, r0, lsl #27
8000a028:	00003de4 	andeq	r3, r0, r4, ror #27
8000a02c:	0000002c 	andeq	r0, r0, ip, lsr #32

8000a030 <print_control_register>:
8000a030:	e1a0c00d 	mov	ip, sp
8000a034:	e92dd810 	push	{r4, fp, ip, lr, pc}
8000a038:	e24cb004 	sub	fp, ip, #4
8000a03c:	e24dd034 	sub	sp, sp, #52	@ 0x34
8000a040:	e59f41b8 	ldr	r4, [pc, #440]	@ 8000a200 <print_control_register+0x1d0>
8000a044:	e08f4004 	add	r4, pc, r4
8000a048:	ebfffb42 	bl	80008d58 <read_control_register>
8000a04c:	e50b0018 	str	r0, [fp, #-24]	@ 0xffffffe8
8000a050:	e51b3018 	ldr	r3, [fp, #-24]	@ 0xffffffe8
8000a054:	e3a01001 	mov	r1, #1
8000a058:	e1a00003 	mov	r0, r3
8000a05c:	eb000118 	bl	8000a4c4 <get_bits>
8000a060:	e1a03000 	mov	r3, r0
8000a064:	e50b301c 	str	r3, [fp, #-28]	@ 0xffffffe4
8000a068:	e51b3018 	ldr	r3, [fp, #-24]	@ 0xffffffe8
8000a06c:	e3a01002 	mov	r1, #2
8000a070:	e1a00003 	mov	r0, r3
8000a074:	eb000112 	bl	8000a4c4 <get_bits>
8000a078:	e1a03000 	mov	r3, r0
8000a07c:	e50b3020 	str	r3, [fp, #-32]	@ 0xffffffe0
8000a080:	e51b3018 	ldr	r3, [fp, #-24]	@ 0xffffffe8
8000a084:	e3a01004 	mov	r1, #4
8000a088:	e1a00003 	mov	r0, r3
8000a08c:	eb00010c 	bl	8000a4c4 <get_bits>
8000a090:	e1a03000 	mov	r3, r0
8000a094:	e50b3024 	str	r3, [fp, #-36]	@ 0xffffffdc
8000a098:	e51b3018 	ldr	r3, [fp, #-24]	@ 0xffffffe8
8000a09c:	e3a01a01 	mov	r1, #4096	@ 0x1000
8000a0a0:	e1a00003 	mov	r0, r3
8000a0a4:	eb000106 	bl	8000a4c4 <get_bits>
8000a0a8:	e1a03000 	mov	r3, r0
8000a0ac:	e50b3028 	str	r3, [fp, #-40]	@ 0xffffffd8
8000a0b0:	e51b3018 	ldr	r3, [fp, #-24]	@ 0xffffffe8
8000a0b4:	e3a01008 	mov	r1, #8
8000a0b8:	e1a00003 	mov	r0, r3
8000a0bc:	eb000100 	bl	8000a4c4 <get_bits>
8000a0c0:	e1a03000 	mov	r3, r0
8000a0c4:	e50b302c 	str	r3, [fp, #-44]	@ 0xffffffd4
8000a0c8:	e51b3018 	ldr	r3, [fp, #-24]	@ 0xffffffe8
8000a0cc:	e3a01a02 	mov	r1, #8192	@ 0x2000
8000a0d0:	e1a00003 	mov	r0, r3
8000a0d4:	eb0000fa 	bl	8000a4c4 <get_bits>
8000a0d8:	e1a03000 	mov	r3, r0
8000a0dc:	e50b3030 	str	r3, [fp, #-48]	@ 0xffffffd0
8000a0e0:	e51b301c 	ldr	r3, [fp, #-28]	@ 0xffffffe4
8000a0e4:	e3530000 	cmp	r3, #0
8000a0e8:	0a000003 	beq	8000a0fc <print_control_register+0xcc>
8000a0ec:	e59f3110 	ldr	r3, [pc, #272]	@ 8000a204 <print_control_register+0x1d4>
8000a0f0:	e08f3003 	add	r3, pc, r3
8000a0f4:	e1a0c003 	mov	ip, r3
8000a0f8:	ea000002 	b	8000a108 <print_control_register+0xd8>
8000a0fc:	e59f3104 	ldr	r3, [pc, #260]	@ 8000a208 <print_control_register+0x1d8>
8000a100:	e08f3003 	add	r3, pc, r3
8000a104:	e1a0c003 	mov	ip, r3
8000a108:	e51b3020 	ldr	r3, [fp, #-32]	@ 0xffffffe0
8000a10c:	e3530000 	cmp	r3, #0
8000a110:	0a000003 	beq	8000a124 <print_control_register+0xf4>
8000a114:	e59f30f0 	ldr	r3, [pc, #240]	@ 8000a20c <print_control_register+0x1dc>
8000a118:	e08f3003 	add	r3, pc, r3
8000a11c:	e1a0e003 	mov	lr, r3
8000a120:	ea000002 	b	8000a130 <print_control_register+0x100>
8000a124:	e59f30e4 	ldr	r3, [pc, #228]	@ 8000a210 <print_control_register+0x1e0>
8000a128:	e08f3003 	add	r3, pc, r3
8000a12c:	e1a0e003 	mov	lr, r3
8000a130:	e51b3024 	ldr	r3, [fp, #-36]	@ 0xffffffdc
8000a134:	e3530000 	cmp	r3, #0
8000a138:	0a000003 	beq	8000a14c <print_control_register+0x11c>
8000a13c:	e59f30d0 	ldr	r3, [pc, #208]	@ 8000a214 <print_control_register+0x1e4>
8000a140:	e08f3003 	add	r3, pc, r3
8000a144:	e1a02003 	mov	r2, r3
8000a148:	ea000002 	b	8000a158 <print_control_register+0x128>
8000a14c:	e59f30c4 	ldr	r3, [pc, #196]	@ 8000a218 <print_control_register+0x1e8>
8000a150:	e08f3003 	add	r3, pc, r3
8000a154:	e1a02003 	mov	r2, r3
8000a158:	e51b3028 	ldr	r3, [fp, #-40]	@ 0xffffffd8
8000a15c:	e3530000 	cmp	r3, #0
8000a160:	0a000003 	beq	8000a174 <print_control_register+0x144>
8000a164:	e59f30b0 	ldr	r3, [pc, #176]	@ 8000a21c <print_control_register+0x1ec>
8000a168:	e08f3003 	add	r3, pc, r3
8000a16c:	e1a01003 	mov	r1, r3
8000a170:	ea000002 	b	8000a180 <print_control_register+0x150>
8000a174:	e59f30a4 	ldr	r3, [pc, #164]	@ 8000a220 <print_control_register+0x1f0>
8000a178:	e08f3003 	add	r3, pc, r3
8000a17c:	e1a01003 	mov	r1, r3
8000a180:	e51b302c 	ldr	r3, [fp, #-44]	@ 0xffffffd4
8000a184:	e3530000 	cmp	r3, #0
8000a188:	0a000003 	beq	8000a19c <print_control_register+0x16c>
8000a18c:	e59f3090 	ldr	r3, [pc, #144]	@ 8000a224 <print_control_register+0x1f4>
8000a190:	e08f3003 	add	r3, pc, r3
8000a194:	e1a00003 	mov	r0, r3
8000a198:	ea000002 	b	8000a1a8 <print_control_register+0x178>
8000a19c:	e59f3084 	ldr	r3, [pc, #132]	@ 8000a228 <print_control_register+0x1f8>
8000a1a0:	e08f3003 	add	r3, pc, r3
8000a1a4:	e1a00003 	mov	r0, r3
8000a1a8:	e51b3030 	ldr	r3, [fp, #-48]	@ 0xffffffd0
8000a1ac:	e3530000 	cmp	r3, #0
8000a1b0:	0a000002 	beq	8000a1c0 <print_control_register+0x190>
8000a1b4:	e59f3070 	ldr	r3, [pc, #112]	@ 8000a22c <print_control_register+0x1fc>
8000a1b8:	e08f3003 	add	r3, pc, r3
8000a1bc:	ea000001 	b	8000a1c8 <print_control_register+0x198>
8000a1c0:	e59f3068 	ldr	r3, [pc, #104]	@ 8000a230 <print_control_register+0x200>
8000a1c4:	e08f3003 	add	r3, pc, r3
8000a1c8:	e58d300c 	str	r3, [sp, #12]
8000a1cc:	e58d0008 	str	r0, [sp, #8]
8000a1d0:	e58d1004 	str	r1, [sp, #4]
8000a1d4:	e58d2000 	str	r2, [sp]
8000a1d8:	e1a0300e 	mov	r3, lr
8000a1dc:	e1a0200c 	mov	r2, ip
8000a1e0:	e59f104c 	ldr	r1, [pc, #76]	@ 8000a234 <print_control_register+0x204>
8000a1e4:	e08f1001 	add	r1, pc, r1
8000a1e8:	e59f0048 	ldr	r0, [pc, #72]	@ 8000a238 <print_control_register+0x208>
8000a1ec:	e7940000 	ldr	r0, [r4, r0]
8000a1f0:	eb000962 	bl	8000c780 <printf_base>
8000a1f4:	e320f000 	nop	{0}
8000a1f8:	e24bd010 	sub	sp, fp, #16
8000a1fc:	e89da810 	ldm	sp, {r4, fp, sp, pc}
8000a200:	00015fb4 			@ <UNDEFINED> instruction: 0x00015fb4
8000a204:	00003d44 	andeq	r3, r0, r4, asr #26
8000a208:	00003d3c 	andeq	r3, r0, ip, lsr sp
8000a20c:	00003d30 	andeq	r3, r0, r0, lsr sp
8000a210:	00003d28 	andeq	r3, r0, r8, lsr #26
8000a214:	00003cf4 	strdeq	r3, [r0], -r4
8000a218:	00003cec 	andeq	r3, r0, ip, ror #25
8000a21c:	00003ccc 	andeq	r3, r0, ip, asr #25
8000a220:	00003cc4 	andeq	r3, r0, r4, asr #25
8000a224:	00003ca4 	andeq	r3, r0, r4, lsr #25
8000a228:	00003c9c 	muleq	r0, ip, ip
8000a22c:	00003ca4 	andeq	r3, r0, r4, lsr #25
8000a230:	00003ca0 	andeq	r3, r0, r0, lsr #25
8000a234:	00003c84 	andeq	r3, r0, r4, lsl #25
8000a238:	0000002c 	andeq	r0, r0, ip, lsr #32

8000a23c <print_cpsr_status>:
8000a23c:	e1a0c00d 	mov	ip, sp
8000a240:	e92dd810 	push	{r4, fp, ip, lr, pc}
8000a244:	e24cb004 	sub	fp, ip, #4
8000a248:	e24dd024 	sub	sp, sp, #36	@ 0x24
8000a24c:	e59f4100 	ldr	r4, [pc, #256]	@ 8000a354 <print_cpsr_status+0x118>
8000a250:	e08f4004 	add	r4, pc, r4
8000a254:	ebfffab3 	bl	80008d28 <read_cpsr>
8000a258:	e50b0018 	str	r0, [fp, #-24]	@ 0xffffffe8
8000a25c:	e51b3018 	ldr	r3, [fp, #-24]	@ 0xffffffe8
8000a260:	e3a0101f 	mov	r1, #31
8000a264:	e1a00003 	mov	r0, r3
8000a268:	eb000095 	bl	8000a4c4 <get_bits>
8000a26c:	e1a03000 	mov	r3, r0
8000a270:	e50b301c 	str	r3, [fp, #-28]	@ 0xffffffe4
8000a274:	e51b3018 	ldr	r3, [fp, #-24]	@ 0xffffffe8
8000a278:	e59f10d8 	ldr	r1, [pc, #216]	@ 8000a358 <print_cpsr_status+0x11c>
8000a27c:	e1a00003 	mov	r0, r3
8000a280:	eb00008f 	bl	8000a4c4 <get_bits>
8000a284:	e1a03000 	mov	r3, r0
8000a288:	e50b3020 	str	r3, [fp, #-32]	@ 0xffffffe0
8000a28c:	e51b3018 	ldr	r3, [fp, #-24]	@ 0xffffffe8
8000a290:	e3a01080 	mov	r1, #128	@ 0x80
8000a294:	e1a00003 	mov	r0, r3
8000a298:	eb000089 	bl	8000a4c4 <get_bits>
8000a29c:	e1a03000 	mov	r3, r0
8000a2a0:	e50b3024 	str	r3, [fp, #-36]	@ 0xffffffdc
8000a2a4:	e51b3018 	ldr	r3, [fp, #-24]	@ 0xffffffe8
8000a2a8:	e3a01040 	mov	r1, #64	@ 0x40
8000a2ac:	e1a00003 	mov	r0, r3
8000a2b0:	eb000083 	bl	8000a4c4 <get_bits>
8000a2b4:	e1a03000 	mov	r3, r0
8000a2b8:	e50b3028 	str	r3, [fp, #-40]	@ 0xffffffd8
8000a2bc:	e59f3098 	ldr	r3, [pc, #152]	@ 8000a35c <print_cpsr_status+0x120>
8000a2c0:	e08f3003 	add	r3, pc, r3
8000a2c4:	e51b201c 	ldr	r2, [fp, #-28]	@ 0xffffffe4
8000a2c8:	e7931102 	ldr	r1, [r3, r2, lsl #2]
8000a2cc:	e59f308c 	ldr	r3, [pc, #140]	@ 8000a360 <print_cpsr_status+0x124>
8000a2d0:	e08f3003 	add	r3, pc, r3
8000a2d4:	e51b2020 	ldr	r2, [fp, #-32]	@ 0xffffffe0
8000a2d8:	e7932102 	ldr	r2, [r3, r2, lsl #2]
8000a2dc:	e51b3024 	ldr	r3, [fp, #-36]	@ 0xffffffdc
8000a2e0:	e3530000 	cmp	r3, #0
8000a2e4:	0a000003 	beq	8000a2f8 <print_cpsr_status+0xbc>
8000a2e8:	e59f3074 	ldr	r3, [pc, #116]	@ 8000a364 <print_cpsr_status+0x128>
8000a2ec:	e08f3003 	add	r3, pc, r3
8000a2f0:	e1a00003 	mov	r0, r3
8000a2f4:	ea000002 	b	8000a304 <print_cpsr_status+0xc8>
8000a2f8:	e59f3068 	ldr	r3, [pc, #104]	@ 8000a368 <print_cpsr_status+0x12c>
8000a2fc:	e08f3003 	add	r3, pc, r3
8000a300:	e1a00003 	mov	r0, r3
8000a304:	e51b3028 	ldr	r3, [fp, #-40]	@ 0xffffffd8
8000a308:	e3530000 	cmp	r3, #0
8000a30c:	0a000002 	beq	8000a31c <print_cpsr_status+0xe0>
8000a310:	e59f3054 	ldr	r3, [pc, #84]	@ 8000a36c <print_cpsr_status+0x130>
8000a314:	e08f3003 	add	r3, pc, r3
8000a318:	ea000001 	b	8000a324 <print_cpsr_status+0xe8>
8000a31c:	e59f304c 	ldr	r3, [pc, #76]	@ 8000a370 <print_cpsr_status+0x134>
8000a320:	e08f3003 	add	r3, pc, r3
8000a324:	e58d3004 	str	r3, [sp, #4]
8000a328:	e58d0000 	str	r0, [sp]
8000a32c:	e1a03002 	mov	r3, r2
8000a330:	e1a02001 	mov	r2, r1
8000a334:	e59f1038 	ldr	r1, [pc, #56]	@ 8000a374 <print_cpsr_status+0x138>
8000a338:	e08f1001 	add	r1, pc, r1
8000a33c:	e59f0034 	ldr	r0, [pc, #52]	@ 8000a378 <print_cpsr_status+0x13c>
8000a340:	e7940000 	ldr	r0, [r4, r0]
8000a344:	eb00090d 	bl	8000c780 <printf_base>
8000a348:	e320f000 	nop	{0}
8000a34c:	e24bd010 	sub	sp, fp, #16
8000a350:	e89da810 	ldm	sp, {r4, fp, sp, pc}
8000a354:	00015da8 	andeq	r5, r1, r8, lsr #27
8000a358:	01000020 	tsteq	r0, r0, lsr #32
8000a35c:	000168a4 	andeq	r6, r1, r4, lsr #17
8000a360:	00016914 	andeq	r6, r1, r4, lsl r9
8000a364:	00003b50 	andeq	r3, r0, r0, asr fp
8000a368:	00003b38 	andeq	r3, r0, r8, lsr fp
8000a36c:	00003b28 	andeq	r3, r0, r8, lsr #22
8000a370:	00003b14 	andeq	r3, r0, r4, lsl fp
8000a374:	00003ba0 	andeq	r3, r0, r0, lsr #23
8000a378:	0000002c 	andeq	r0, r0, ip, lsr #32

8000a37c <print_supervisor_sp>:
8000a37c:	e1a0c00d 	mov	ip, sp
8000a380:	e92dd810 	push	{r4, fp, ip, lr, pc}
8000a384:	e24cb004 	sub	fp, ip, #4
8000a388:	e24dd014 	sub	sp, sp, #20
8000a38c:	e59f4050 	ldr	r4, [pc, #80]	@ 8000a3e4 <print_supervisor_sp+0x68>
8000a390:	e08f4004 	add	r4, pc, r4
8000a394:	e3a00013 	mov	r0, #19
8000a398:	ebfffa5a 	bl	80008d08 <get_stack_pointer>
8000a39c:	e50b0018 	str	r0, [fp, #-24]	@ 0xffffffe8
8000a3a0:	e59f3040 	ldr	r3, [pc, #64]	@ 8000a3e8 <print_supervisor_sp+0x6c>
8000a3a4:	e7943003 	ldr	r3, [r4, r3]
8000a3a8:	e1a02003 	mov	r2, r3
8000a3ac:	e51b3018 	ldr	r3, [fp, #-24]	@ 0xffffffe8
8000a3b0:	e0423003 	sub	r3, r2, r3
8000a3b4:	e58d3000 	str	r3, [sp]
8000a3b8:	e51b3018 	ldr	r3, [fp, #-24]	@ 0xffffffe8
8000a3bc:	e59f2024 	ldr	r2, [pc, #36]	@ 8000a3e8 <print_supervisor_sp+0x6c>
8000a3c0:	e7942002 	ldr	r2, [r4, r2]
8000a3c4:	e59f1020 	ldr	r1, [pc, #32]	@ 8000a3ec <print_supervisor_sp+0x70>
8000a3c8:	e08f1001 	add	r1, pc, r1
8000a3cc:	e59f001c 	ldr	r0, [pc, #28]	@ 8000a3f0 <print_supervisor_sp+0x74>
8000a3d0:	e7940000 	ldr	r0, [r4, r0]
8000a3d4:	eb0008e9 	bl	8000c780 <printf_base>
8000a3d8:	e320f000 	nop	{0}
8000a3dc:	e24bd010 	sub	sp, fp, #16
8000a3e0:	e89da810 	ldm	sp, {r4, fp, sp, pc}
8000a3e4:	00015c68 	andeq	r5, r1, r8, ror #24
8000a3e8:	00000028 	andeq	r0, r0, r8, lsr #32
8000a3ec:	00003b48 	andeq	r3, r0, r8, asr #22
8000a3f0:	0000002c 	andeq	r0, r0, ip, lsr #32

8000a3f4 <print_irq_sp>:
8000a3f4:	e1a0c00d 	mov	ip, sp
8000a3f8:	e92dd810 	push	{r4, fp, ip, lr, pc}
8000a3fc:	e24cb004 	sub	fp, ip, #4
8000a400:	e24dd014 	sub	sp, sp, #20
8000a404:	e59f4050 	ldr	r4, [pc, #80]	@ 8000a45c <print_irq_sp+0x68>
8000a408:	e08f4004 	add	r4, pc, r4
8000a40c:	e3a00012 	mov	r0, #18
8000a410:	ebfffa3c 	bl	80008d08 <get_stack_pointer>
8000a414:	e50b0018 	str	r0, [fp, #-24]	@ 0xffffffe8
8000a418:	e59f3040 	ldr	r3, [pc, #64]	@ 8000a460 <print_irq_sp+0x6c>
8000a41c:	e7943003 	ldr	r3, [r4, r3]
8000a420:	e1a02003 	mov	r2, r3
8000a424:	e51b3018 	ldr	r3, [fp, #-24]	@ 0xffffffe8
8000a428:	e0423003 	sub	r3, r2, r3
8000a42c:	e58d3000 	str	r3, [sp]
8000a430:	e51b3018 	ldr	r3, [fp, #-24]	@ 0xffffffe8
8000a434:	e59f2024 	ldr	r2, [pc, #36]	@ 8000a460 <print_irq_sp+0x6c>
8000a438:	e7942002 	ldr	r2, [r4, r2]
8000a43c:	e59f1020 	ldr	r1, [pc, #32]	@ 8000a464 <print_irq_sp+0x70>
8000a440:	e08f1001 	add	r1, pc, r1
8000a444:	e59f001c 	ldr	r0, [pc, #28]	@ 8000a468 <print_irq_sp+0x74>
8000a448:	e7940000 	ldr	r0, [r4, r0]
8000a44c:	eb0008cb 	bl	8000c780 <printf_base>
8000a450:	e320f000 	nop	{0}
8000a454:	e24bd010 	sub	sp, fp, #16
8000a458:	e89da810 	ldm	sp, {r4, fp, sp, pc}
8000a45c:	00015bf0 	strdeq	r5, [r1], -r0
8000a460:	00000030 	andeq	r0, r0, r0, lsr r0
8000a464:	00003b10 	andeq	r3, r0, r0, lsl fp
8000a468:	0000002c 	andeq	r0, r0, ip, lsr #32

8000a46c <print_free_memory>:
8000a46c:	e1a0c00d 	mov	ip, sp
8000a470:	e92dd810 	push	{r4, fp, ip, lr, pc}
8000a474:	e24cb004 	sub	fp, ip, #4
8000a478:	e24dd00c 	sub	sp, sp, #12
8000a47c:	e59f4034 	ldr	r4, [pc, #52]	@ 8000a4b8 <print_free_memory+0x4c>
8000a480:	e08f4004 	add	r4, pc, r4
8000a484:	ebfffaf5 	bl	80009060 <get_free_memory_size>
8000a488:	e50b0018 	str	r0, [fp, #-24]	@ 0xffffffe8
8000a48c:	e51b2018 	ldr	r2, [fp, #-24]	@ 0xffffffe8
8000a490:	e59f3024 	ldr	r3, [pc, #36]	@ 8000a4bc <print_free_memory+0x50>
8000a494:	e08f3003 	add	r3, pc, r3
8000a498:	e1a01003 	mov	r1, r3
8000a49c:	e59f301c 	ldr	r3, [pc, #28]	@ 8000a4c0 <print_free_memory+0x54>
8000a4a0:	e7943003 	ldr	r3, [r4, r3]
8000a4a4:	e1a00003 	mov	r0, r3
8000a4a8:	eb0008b4 	bl	8000c780 <printf_base>
8000a4ac:	e320f000 	nop	{0}
8000a4b0:	e24bd010 	sub	sp, fp, #16
8000a4b4:	e89da810 	ldm	sp, {r4, fp, sp, pc}
8000a4b8:	00015b78 	andeq	r5, r1, r8, ror fp
8000a4bc:	00003af4 	strdeq	r3, [r0], -r4
8000a4c0:	0000002c 	andeq	r0, r0, ip, lsr #32

8000a4c4 <get_bits>:
8000a4c4:	e1a0c00d 	mov	ip, sp
8000a4c8:	e92dd800 	push	{fp, ip, lr, pc}
8000a4cc:	e24cb004 	sub	fp, ip, #4
8000a4d0:	e24dd010 	sub	sp, sp, #16
8000a4d4:	e50b0018 	str	r0, [fp, #-24]	@ 0xffffffe8
8000a4d8:	e50b101c 	str	r1, [fp, #-28]	@ 0xffffffe4
8000a4dc:	e3a03000 	mov	r3, #0
8000a4e0:	e50b3010 	str	r3, [fp, #-16]
8000a4e4:	e3a03000 	mov	r3, #0
8000a4e8:	e50b3014 	str	r3, [fp, #-20]	@ 0xffffffec
8000a4ec:	e3a0301f 	mov	r3, #31
8000a4f0:	e50b3014 	str	r3, [fp, #-20]	@ 0xffffffec
8000a4f4:	ea000017 	b	8000a558 <get_bits+0x94>
8000a4f8:	e3a02001 	mov	r2, #1
8000a4fc:	e51b3014 	ldr	r3, [fp, #-20]	@ 0xffffffec
8000a500:	e1a02312 	lsl	r2, r2, r3
8000a504:	e51b301c 	ldr	r3, [fp, #-28]	@ 0xffffffe4
8000a508:	e0033002 	and	r3, r3, r2
8000a50c:	e3530000 	cmp	r3, #0
8000a510:	0a00000d 	beq	8000a54c <get_bits+0x88>
8000a514:	e51b3010 	ldr	r3, [fp, #-16]
8000a518:	e1a03083 	lsl	r3, r3, #1
8000a51c:	e3a01001 	mov	r1, #1
8000a520:	e51b2014 	ldr	r2, [fp, #-20]	@ 0xffffffec
8000a524:	e1a01211 	lsl	r1, r1, r2
8000a528:	e51b2018 	ldr	r2, [fp, #-24]	@ 0xffffffe8
8000a52c:	e0022001 	and	r2, r2, r1
8000a530:	e3520000 	cmp	r2, #0
8000a534:	0a000001 	beq	8000a540 <get_bits+0x7c>
8000a538:	e3a02001 	mov	r2, #1
8000a53c:	ea000000 	b	8000a544 <get_bits+0x80>
8000a540:	e3a02000 	mov	r2, #0
8000a544:	e0823003 	add	r3, r2, r3
8000a548:	e50b3010 	str	r3, [fp, #-16]
8000a54c:	e51b3014 	ldr	r3, [fp, #-20]	@ 0xffffffec
8000a550:	e2433001 	sub	r3, r3, #1
8000a554:	e50b3014 	str	r3, [fp, #-20]	@ 0xffffffec
8000a558:	e51b3014 	ldr	r3, [fp, #-20]	@ 0xffffffec
8000a55c:	e3530000 	cmp	r3, #0
8000a560:	aaffffe4 	bge	8000a4f8 <get_bits+0x34>
8000a564:	e51b3010 	ldr	r3, [fp, #-16]
8000a568:	e1a00003 	mov	r0, r3
8000a56c:	e24bd00c 	sub	sp, fp, #12
8000a570:	e89da800 	ldm	sp, {fp, sp, pc}

8000a574 <monitor>:
8000a574:	e1a0c00d 	mov	ip, sp
8000a578:	e92dd810 	push	{r4, fp, ip, lr, pc}
8000a57c:	e24cb004 	sub	fp, ip, #4
8000a580:	e24ddf4d 	sub	sp, sp, #308	@ 0x134
8000a584:	e59f40cc 	ldr	r4, [pc, #204]	@ 8000a658 <monitor+0xe4>
8000a588:	e08f4004 	add	r4, pc, r4
8000a58c:	e3a03000 	mov	r3, #0
8000a590:	e50b3144 	str	r3, [fp, #-324]	@ 0xfffffebc
8000a594:	e3a03000 	mov	r3, #0
8000a598:	e50b3018 	str	r3, [fp, #-24]	@ 0xffffffe8
8000a59c:	e59f30b8 	ldr	r3, [pc, #184]	@ 8000a65c <monitor+0xe8>
8000a5a0:	e08f3003 	add	r3, pc, r3
8000a5a4:	e1a01003 	mov	r1, r3
8000a5a8:	e59f30b0 	ldr	r3, [pc, #176]	@ 8000a660 <monitor+0xec>
8000a5ac:	e7943003 	ldr	r3, [r4, r3]
8000a5b0:	e1a00003 	mov	r0, r3
8000a5b4:	eb000871 	bl	8000c780 <printf_base>
8000a5b8:	e24b3f46 	sub	r3, fp, #280	@ 0x118
8000a5bc:	e1a02003 	mov	r2, r3
8000a5c0:	e59f3098 	ldr	r3, [pc, #152]	@ 8000a660 <monitor+0xec>
8000a5c4:	e7943003 	ldr	r3, [r4, r3]
8000a5c8:	e1a01003 	mov	r1, r3
8000a5cc:	e59f3090 	ldr	r3, [pc, #144]	@ 8000a664 <monitor+0xf0>
8000a5d0:	e7943003 	ldr	r3, [r4, r3]
8000a5d4:	e1a00003 	mov	r0, r3
8000a5d8:	eb000814 	bl	8000c630 <gets_base>
8000a5dc:	e24b2d05 	sub	r2, fp, #320	@ 0x140
8000a5e0:	e24b1f51 	sub	r1, fp, #324	@ 0x144
8000a5e4:	e24b3f46 	sub	r3, fp, #280	@ 0x118
8000a5e8:	e1a00003 	mov	r0, r3
8000a5ec:	eb00001e 	bl	8000a66c <tokenize_command>
8000a5f0:	e51b3144 	ldr	r3, [fp, #-324]	@ 0xfffffebc
8000a5f4:	e3530000 	cmp	r3, #0
8000a5f8:	0a000014 	beq	8000a650 <monitor+0xdc>
8000a5fc:	e51b3140 	ldr	r3, [fp, #-320]	@ 0xfffffec0
8000a600:	e1a00003 	mov	r0, r3
8000a604:	eb000047 	bl	8000a728 <get_command_handler>
8000a608:	e50b0018 	str	r0, [fp, #-24]	@ 0xffffffe8
8000a60c:	e51b3018 	ldr	r3, [fp, #-24]	@ 0xffffffe8
8000a610:	e3530000 	cmp	r3, #0
8000a614:	1a000007 	bne	8000a638 <monitor+0xc4>
8000a618:	e59f3048 	ldr	r3, [pc, #72]	@ 8000a668 <monitor+0xf4>
8000a61c:	e08f3003 	add	r3, pc, r3
8000a620:	e1a01003 	mov	r1, r3
8000a624:	e59f3034 	ldr	r3, [pc, #52]	@ 8000a660 <monitor+0xec>
8000a628:	e7943003 	ldr	r3, [r4, r3]
8000a62c:	e1a00003 	mov	r0, r3
8000a630:	eb000852 	bl	8000c780 <printf_base>
8000a634:	eaffffd6 	b	8000a594 <monitor+0x20>
8000a638:	e51b2144 	ldr	r2, [fp, #-324]	@ 0xfffffebc
8000a63c:	e24b1d05 	sub	r1, fp, #320	@ 0x140
8000a640:	e51b3018 	ldr	r3, [fp, #-24]	@ 0xffffffe8
8000a644:	e1a00002 	mov	r0, r2
8000a648:	e12fff33 	blx	r3
8000a64c:	eaffffd0 	b	8000a594 <monitor+0x20>
8000a650:	e320f000 	nop	{0}
8000a654:	eaffffce 	b	8000a594 <monitor+0x20>
8000a658:	00015a70 	andeq	r5, r1, r0, ror sl
8000a65c:	00003b54 	andeq	r3, r0, r4, asr fp
8000a660:	0000002c 	andeq	r0, r0, ip, lsr #32
8000a664:	00000034 	andeq	r0, r0, r4, lsr r0
8000a668:	00003adc 	ldrdeq	r3, [r0], -ip

8000a66c <tokenize_command>:
8000a66c:	e1a0c00d 	mov	ip, sp
8000a670:	e92dd800 	push	{fp, ip, lr, pc}
8000a674:	e24cb004 	sub	fp, ip, #4
8000a678:	e24dd018 	sub	sp, sp, #24
8000a67c:	e50b0018 	str	r0, [fp, #-24]	@ 0xffffffe8
8000a680:	e50b101c 	str	r1, [fp, #-28]	@ 0xffffffe4
8000a684:	e50b2020 	str	r2, [fp, #-32]	@ 0xffffffe0
8000a688:	e3a03000 	mov	r3, #0
8000a68c:	e50b3010 	str	r3, [fp, #-16]
8000a690:	e3a03000 	mov	r3, #0
8000a694:	e50b3014 	str	r3, [fp, #-20]	@ 0xffffffec
8000a698:	e59f3080 	ldr	r3, [pc, #128]	@ 8000a720 <tokenize_command+0xb4>
8000a69c:	e08f3003 	add	r3, pc, r3
8000a6a0:	e1a01003 	mov	r1, r3
8000a6a4:	e51b0018 	ldr	r0, [fp, #-24]	@ 0xffffffe8
8000a6a8:	eb000746 	bl	8000c3c8 <strtok>
8000a6ac:	e50b0010 	str	r0, [fp, #-16]
8000a6b0:	ea00000e 	b	8000a6f0 <tokenize_command+0x84>
8000a6b4:	e51b3014 	ldr	r3, [fp, #-20]	@ 0xffffffec
8000a6b8:	e1a03103 	lsl	r3, r3, #2
8000a6bc:	e51b2020 	ldr	r2, [fp, #-32]	@ 0xffffffe0
8000a6c0:	e0823003 	add	r3, r2, r3
8000a6c4:	e51b2010 	ldr	r2, [fp, #-16]
8000a6c8:	e5832000 	str	r2, [r3]
8000a6cc:	e51b3014 	ldr	r3, [fp, #-20]	@ 0xffffffec
8000a6d0:	e2833001 	add	r3, r3, #1
8000a6d4:	e50b3014 	str	r3, [fp, #-20]	@ 0xffffffec
8000a6d8:	e59f3044 	ldr	r3, [pc, #68]	@ 8000a724 <tokenize_command+0xb8>
8000a6dc:	e08f3003 	add	r3, pc, r3
8000a6e0:	e1a01003 	mov	r1, r3
8000a6e4:	e3a00000 	mov	r0, #0
8000a6e8:	eb000736 	bl	8000c3c8 <strtok>
8000a6ec:	e50b0010 	str	r0, [fp, #-16]
8000a6f0:	e51b3010 	ldr	r3, [fp, #-16]
8000a6f4:	e3530000 	cmp	r3, #0
8000a6f8:	0a000002 	beq	8000a708 <tokenize_command+0x9c>
8000a6fc:	e51b3014 	ldr	r3, [fp, #-20]	@ 0xffffffec
8000a700:	e3530009 	cmp	r3, #9
8000a704:	daffffea 	ble	8000a6b4 <tokenize_command+0x48>
8000a708:	e51b301c 	ldr	r3, [fp, #-28]	@ 0xffffffe4
8000a70c:	e51b2014 	ldr	r2, [fp, #-20]	@ 0xffffffec
8000a710:	e5832000 	str	r2, [r3]
8000a714:	e320f000 	nop	{0}
8000a718:	e24bd00c 	sub	sp, fp, #12
8000a71c:	e89da800 	ldm	sp, {fp, sp, pc}
8000a720:	00003a70 	andeq	r3, r0, r0, ror sl
8000a724:	00003a30 	andeq	r3, r0, r0, lsr sl

8000a728 <get_command_handler>:
8000a728:	e1a0c00d 	mov	ip, sp
8000a72c:	e92dd800 	push	{fp, ip, lr, pc}
8000a730:	e24cb004 	sub	fp, ip, #4
8000a734:	e24dd010 	sub	sp, sp, #16
8000a738:	e50b0018 	str	r0, [fp, #-24]	@ 0xffffffe8
8000a73c:	e3a03000 	mov	r3, #0
8000a740:	e50b3010 	str	r3, [fp, #-16]
8000a744:	e3a03000 	mov	r3, #0
8000a748:	e50b3010 	str	r3, [fp, #-16]
8000a74c:	ea00001c 	b	8000a7c4 <get_command_handler+0x9c>
8000a750:	e59f1088 	ldr	r1, [pc, #136]	@ 8000a7e0 <get_command_handler+0xb8>
8000a754:	e08f1001 	add	r1, pc, r1
8000a758:	e51b2010 	ldr	r2, [fp, #-16]
8000a75c:	e1a03002 	mov	r3, r2
8000a760:	e1a03083 	lsl	r3, r3, #1
8000a764:	e0833002 	add	r3, r3, r2
8000a768:	e1a03103 	lsl	r3, r3, #2
8000a76c:	e0813003 	add	r3, r1, r3
8000a770:	e5933000 	ldr	r3, [r3]
8000a774:	e51b1018 	ldr	r1, [fp, #-24]	@ 0xffffffe8
8000a778:	e1a00003 	mov	r0, r3
8000a77c:	eb00069a 	bl	8000c1ec <strcmp>
8000a780:	e1a03000 	mov	r3, r0
8000a784:	e3530000 	cmp	r3, #0
8000a788:	1a00000a 	bne	8000a7b8 <get_command_handler+0x90>
8000a78c:	e59f1050 	ldr	r1, [pc, #80]	@ 8000a7e4 <get_command_handler+0xbc>
8000a790:	e08f1001 	add	r1, pc, r1
8000a794:	e51b2010 	ldr	r2, [fp, #-16]
8000a798:	e1a03002 	mov	r3, r2
8000a79c:	e1a03083 	lsl	r3, r3, #1
8000a7a0:	e0833002 	add	r3, r3, r2
8000a7a4:	e1a03103 	lsl	r3, r3, #2
8000a7a8:	e0813003 	add	r3, r1, r3
8000a7ac:	e2833008 	add	r3, r3, #8
8000a7b0:	e5933000 	ldr	r3, [r3]
8000a7b4:	ea000006 	b	8000a7d4 <get_command_handler+0xac>
8000a7b8:	e51b3010 	ldr	r3, [fp, #-16]
8000a7bc:	e2833001 	add	r3, r3, #1
8000a7c0:	e50b3010 	str	r3, [fp, #-16]
8000a7c4:	e51b3010 	ldr	r3, [fp, #-16]
8000a7c8:	e3530005 	cmp	r3, #5
8000a7cc:	9affffdf 	bls	8000a750 <get_command_handler+0x28>
8000a7d0:	e3a03000 	mov	r3, #0
8000a7d4:	e1a00003 	mov	r0, r3
8000a7d8:	e24bd00c 	sub	sp, fp, #12
8000a7dc:	e89da800 	ldm	sp, {fp, sp, pc}
8000a7e0:	00015b10 	andeq	r5, r1, r0, lsl fp
8000a7e4:	00015ad4 	ldrdeq	r5, [r1], -r4

8000a7e8 <proc_init>:
8000a7e8:	e1a0c00d 	mov	ip, sp
8000a7ec:	e92dd800 	push	{fp, ip, lr, pc}
8000a7f0:	e24cb004 	sub	fp, ip, #4
8000a7f4:	e24dd008 	sub	sp, sp, #8
8000a7f8:	e59f1070 	ldr	r1, [pc, #112]	@ 8000a870 <proc_init+0x88>
8000a7fc:	e08f1001 	add	r1, pc, r1
8000a800:	e3a03000 	mov	r3, #0
8000a804:	e50b3010 	str	r3, [fp, #-16]
8000a808:	ea00000e 	b	8000a848 <proc_init+0x60>
8000a80c:	e59f3060 	ldr	r3, [pc, #96]	@ 8000a874 <proc_init+0x8c>
8000a810:	e7910003 	ldr	r0, [r1, r3]
8000a814:	e51b2010 	ldr	r2, [fp, #-16]
8000a818:	e1a03002 	mov	r3, r2
8000a81c:	e1a03083 	lsl	r3, r3, #1
8000a820:	e0833002 	add	r3, r3, r2
8000a824:	e1a03103 	lsl	r3, r3, #2
8000a828:	e0833002 	add	r3, r3, r2
8000a82c:	e1a03183 	lsl	r3, r3, #3
8000a830:	e0803003 	add	r3, r0, r3
8000a834:	e3a02000 	mov	r2, #0
8000a838:	e5c32000 	strb	r2, [r3]
8000a83c:	e51b3010 	ldr	r3, [fp, #-16]
8000a840:	e2833001 	add	r3, r3, #1
8000a844:	e50b3010 	str	r3, [fp, #-16]
8000a848:	e51b3010 	ldr	r3, [fp, #-16]
8000a84c:	e3530009 	cmp	r3, #9
8000a850:	daffffed 	ble	8000a80c <proc_init+0x24>
8000a854:	e59f301c 	ldr	r3, [pc, #28]	@ 8000a878 <proc_init+0x90>
8000a858:	e7913003 	ldr	r3, [r1, r3]
8000a85c:	e3a02000 	mov	r2, #0
8000a860:	e5832000 	str	r2, [r3]
8000a864:	e320f000 	nop	{0}
8000a868:	e24bd00c 	sub	sp, fp, #12
8000a86c:	e89da800 	ldm	sp, {fp, sp, pc}
8000a870:	000157fc 	strdeq	r5, [r1], -ip
8000a874:	00000044 	andeq	r0, r0, r4, asr #32
8000a878:	0000003c 	andeq	r0, r0, ip, lsr r0

8000a87c <proc_create>:
8000a87c:	e1a0c00d 	mov	ip, sp
8000a880:	e92dd810 	push	{r4, fp, ip, lr, pc}
8000a884:	e24cb004 	sub	fp, ip, #4
8000a888:	e24dd044 	sub	sp, sp, #68	@ 0x44
8000a88c:	e59f41f4 	ldr	r4, [pc, #500]	@ 8000aa88 <proc_create+0x20c>
8000a890:	e08f4004 	add	r4, pc, r4
8000a894:	e3a03000 	mov	r3, #0
8000a898:	e50b3020 	str	r3, [fp, #-32]	@ 0xffffffe0
8000a89c:	e3e03000 	mvn	r3, #0
8000a8a0:	e50b301c 	str	r3, [fp, #-28]	@ 0xffffffe4
8000a8a4:	e3a03000 	mov	r3, #0
8000a8a8:	e50b3024 	str	r3, [fp, #-36]	@ 0xffffffdc
8000a8ac:	e3a03000 	mov	r3, #0
8000a8b0:	e50b3028 	str	r3, [fp, #-40]	@ 0xffffffd8
8000a8b4:	e3a03000 	mov	r3, #0
8000a8b8:	e50b302c 	str	r3, [fp, #-44]	@ 0xffffffd4
8000a8bc:	e3a03000 	mov	r3, #0
8000a8c0:	e50b3018 	str	r3, [fp, #-24]	@ 0xffffffe8
8000a8c4:	ea000013 	b	8000a918 <proc_create+0x9c>
8000a8c8:	e59f31bc 	ldr	r3, [pc, #444]	@ 8000aa8c <proc_create+0x210>
8000a8cc:	e7941003 	ldr	r1, [r4, r3]
8000a8d0:	e51b2018 	ldr	r2, [fp, #-24]	@ 0xffffffe8
8000a8d4:	e1a03002 	mov	r3, r2
8000a8d8:	e1a03083 	lsl	r3, r3, #1
8000a8dc:	e0833002 	add	r3, r3, r2
8000a8e0:	e1a03103 	lsl	r3, r3, #2
8000a8e4:	e0833002 	add	r3, r3, r2
8000a8e8:	e1a03183 	lsl	r3, r3, #3
8000a8ec:	e0813003 	add	r3, r1, r3
8000a8f0:	e5d33000 	ldrb	r3, [r3]
8000a8f4:	e3530000 	cmp	r3, #0
8000a8f8:	1a000003 	bne	8000a90c <proc_create+0x90>
8000a8fc:	e51b3018 	ldr	r3, [fp, #-24]	@ 0xffffffe8
8000a900:	e2833001 	add	r3, r3, #1
8000a904:	e50b301c 	str	r3, [fp, #-28]	@ 0xffffffe4
8000a908:	ea000005 	b	8000a924 <proc_create+0xa8>
8000a90c:	e51b3018 	ldr	r3, [fp, #-24]	@ 0xffffffe8
8000a910:	e2833001 	add	r3, r3, #1
8000a914:	e50b3018 	str	r3, [fp, #-24]	@ 0xffffffe8
8000a918:	e51b3018 	ldr	r3, [fp, #-24]	@ 0xffffffe8
8000a91c:	e3530009 	cmp	r3, #9
8000a920:	daffffe8 	ble	8000a8c8 <proc_create+0x4c>
8000a924:	e51b301c 	ldr	r3, [fp, #-28]	@ 0xffffffe4
8000a928:	e3730001 	cmn	r3, #1
8000a92c:	1a000001 	bne	8000a938 <proc_create+0xbc>
8000a930:	e3a03000 	mov	r3, #0
8000a934:	ea000050 	b	8000aa7c <proc_create+0x200>
8000a938:	ebfff94b 	bl	80008e6c <kalloc>
8000a93c:	e50b0028 	str	r0, [fp, #-40]	@ 0xffffffd8
8000a940:	ebfff949 	bl	80008e6c <kalloc>
8000a944:	e50b002c 	str	r0, [fp, #-44]	@ 0xffffffd4
8000a948:	e51b301c 	ldr	r3, [fp, #-28]	@ 0xffffffe4
8000a94c:	e2433001 	sub	r3, r3, #1
8000a950:	e1a03703 	lsl	r3, r3, #14
8000a954:	e59f2134 	ldr	r2, [pc, #308]	@ 8000aa90 <proc_create+0x214>
8000a958:	e7942002 	ldr	r2, [r4, r2]
8000a95c:	e0833002 	add	r3, r3, r2
8000a960:	e50b3024 	str	r3, [fp, #-36]	@ 0xffffffdc
8000a964:	e51b0024 	ldr	r0, [fp, #-36]	@ 0xffffffdc
8000a968:	ebfffa10 	bl	800091b0 <setup_kernel_vm>
8000a96c:	e59f3120 	ldr	r3, [pc, #288]	@ 8000aa94 <proc_create+0x218>
8000a970:	e50b303c 	str	r3, [fp, #-60]	@ 0xffffffc4
8000a974:	e51b3028 	ldr	r3, [fp, #-40]	@ 0xffffffd8
8000a978:	e2833102 	add	r3, r3, #-2147483648	@ 0x80000000
8000a97c:	e50b3038 	str	r3, [fp, #-56]	@ 0xffffffc8
8000a980:	e51b3028 	ldr	r3, [fp, #-40]	@ 0xffffffd8
8000a984:	e2833102 	add	r3, r3, #-2147483648	@ 0x80000000
8000a988:	e2833a01 	add	r3, r3, #4096	@ 0x1000
8000a98c:	e50b3034 	str	r3, [fp, #-52]	@ 0xffffffcc
8000a990:	e3a030aa 	mov	r3, #170	@ 0xaa
8000a994:	e50b3030 	str	r3, [fp, #-48]	@ 0xffffffd0
8000a998:	e51b3030 	ldr	r3, [fp, #-48]	@ 0xffffffd0
8000a99c:	e58d3000 	str	r3, [sp]
8000a9a0:	e24b303c 	sub	r3, fp, #60	@ 0x3c
8000a9a4:	e893000e 	ldm	r3, {r1, r2, r3}
8000a9a8:	e51b0024 	ldr	r0, [fp, #-36]	@ 0xffffffdc
8000a9ac:	ebfffa25 	bl	80009248 <map_pages>
8000a9b0:	e59f30e0 	ldr	r3, [pc, #224]	@ 8000aa98 <proc_create+0x21c>
8000a9b4:	e50b304c 	str	r3, [fp, #-76]	@ 0xffffffb4
8000a9b8:	e51b3028 	ldr	r3, [fp, #-40]	@ 0xffffffd8
8000a9bc:	e2833102 	add	r3, r3, #-2147483648	@ 0x80000000
8000a9c0:	e50b3048 	str	r3, [fp, #-72]	@ 0xffffffb8
8000a9c4:	e51b3028 	ldr	r3, [fp, #-40]	@ 0xffffffd8
8000a9c8:	e2833102 	add	r3, r3, #-2147483648	@ 0x80000000
8000a9cc:	e2833a01 	add	r3, r3, #4096	@ 0x1000
8000a9d0:	e50b3044 	str	r3, [fp, #-68]	@ 0xffffffbc
8000a9d4:	e3a030aa 	mov	r3, #170	@ 0xaa
8000a9d8:	e50b3040 	str	r3, [fp, #-64]	@ 0xffffffc0
8000a9dc:	e51b3040 	ldr	r3, [fp, #-64]	@ 0xffffffc0
8000a9e0:	e58d3000 	str	r3, [sp]
8000a9e4:	e24b304c 	sub	r3, fp, #76	@ 0x4c
8000a9e8:	e893000e 	ldm	r3, {r1, r2, r3}
8000a9ec:	e51b0024 	ldr	r0, [fp, #-36]	@ 0xffffffdc
8000a9f0:	ebfffa14 	bl	80009248 <map_pages>
8000a9f4:	e51b301c 	ldr	r3, [fp, #-28]	@ 0xffffffe4
8000a9f8:	e2432001 	sub	r2, r3, #1
8000a9fc:	e1a03002 	mov	r3, r2
8000aa00:	e1a03083 	lsl	r3, r3, #1
8000aa04:	e0833002 	add	r3, r3, r2
8000aa08:	e1a03103 	lsl	r3, r3, #2
8000aa0c:	e0833002 	add	r3, r3, r2
8000aa10:	e1a03183 	lsl	r3, r3, #3
8000aa14:	e59f2070 	ldr	r2, [pc, #112]	@ 8000aa8c <proc_create+0x210>
8000aa18:	e7942002 	ldr	r2, [r4, r2]
8000aa1c:	e0833002 	add	r3, r3, r2
8000aa20:	e50b3020 	str	r3, [fp, #-32]	@ 0xffffffe0
8000aa24:	e51b3020 	ldr	r3, [fp, #-32]	@ 0xffffffe0
8000aa28:	e51b201c 	ldr	r2, [fp, #-28]	@ 0xffffffe4
8000aa2c:	e5832004 	str	r2, [r3, #4]
8000aa30:	e51b3020 	ldr	r3, [fp, #-32]	@ 0xffffffe0
8000aa34:	e3a02001 	mov	r2, #1
8000aa38:	e5c32000 	strb	r2, [r3]
8000aa3c:	e51b3020 	ldr	r3, [fp, #-32]	@ 0xffffffe0
8000aa40:	e51b2024 	ldr	r2, [fp, #-36]	@ 0xffffffdc
8000aa44:	e583200c 	str	r2, [r3, #12]
8000aa48:	e51b3020 	ldr	r3, [fp, #-32]	@ 0xffffffe0
8000aa4c:	e3a02000 	mov	r2, #0
8000aa50:	e5832010 	str	r2, [r3, #16]
8000aa54:	e51b3020 	ldr	r3, [fp, #-32]	@ 0xffffffe0
8000aa58:	e51b2028 	ldr	r2, [fp, #-40]	@ 0xffffffd8
8000aa5c:	e5832018 	str	r2, [r3, #24]
8000aa60:	e51b3020 	ldr	r3, [fp, #-32]	@ 0xffffffe0
8000aa64:	e51b202c 	ldr	r2, [fp, #-44]	@ 0xffffffd4
8000aa68:	e5832014 	str	r2, [r3, #20]
8000aa6c:	e51b3020 	ldr	r3, [fp, #-32]	@ 0xffffffe0
8000aa70:	e3e02000 	mvn	r2, #0
8000aa74:	e5832060 	str	r2, [r3, #96]	@ 0x60
8000aa78:	e51b3020 	ldr	r3, [fp, #-32]	@ 0xffffffe0
8000aa7c:	e1a00003 	mov	r0, r3
8000aa80:	e24bd010 	sub	sp, fp, #16
8000aa84:	e89da810 	ldm	sp, {r4, fp, sp, pc}
8000aa88:	00015768 	andeq	r5, r1, r8, ror #14
8000aa8c:	00000044 	andeq	r0, r0, r4, asr #32
8000aa90:	00000024 	andeq	r0, r0, r4, lsr #32
8000aa94:	7fffe000 	svcvc	0x00ffe000
8000aa98:	7fffd000 	svcvc	0x00ffd000

8000aa9c <proc_free>:
8000aa9c:	e1a0c00d 	mov	ip, sp
8000aaa0:	e92dd800 	push	{fp, ip, lr, pc}
8000aaa4:	e24cb004 	sub	fp, ip, #4
8000aaa8:	e24dd008 	sub	sp, sp, #8
8000aaac:	e50b0010 	str	r0, [fp, #-16]
8000aab0:	e51b3010 	ldr	r3, [fp, #-16]
8000aab4:	e5933018 	ldr	r3, [r3, #24]
8000aab8:	e1a00003 	mov	r0, r3
8000aabc:	ebfff93f 	bl	80008fc0 <kfree>
8000aac0:	e51b3010 	ldr	r3, [fp, #-16]
8000aac4:	e5933014 	ldr	r3, [r3, #20]
8000aac8:	e1a00003 	mov	r0, r3
8000aacc:	ebfff93b 	bl	80008fc0 <kfree>
8000aad0:	e51b3010 	ldr	r3, [fp, #-16]
8000aad4:	e5933010 	ldr	r3, [r3, #16]
8000aad8:	e1a03623 	lsr	r3, r3, #12
8000aadc:	e1a01003 	mov	r1, r3
8000aae0:	e51b0010 	ldr	r0, [fp, #-16]
8000aae4:	eb00003d 	bl	8000abe0 <proc_shrink_memory>
8000aae8:	e51b3010 	ldr	r3, [fp, #-16]
8000aaec:	e593300c 	ldr	r3, [r3, #12]
8000aaf0:	e1a00003 	mov	r0, r3
8000aaf4:	ebfffa03 	bl	80009308 <free_vm_page_tables>
8000aaf8:	e51b3010 	ldr	r3, [fp, #-16]
8000aafc:	e3a02000 	mov	r2, #0
8000ab00:	e5c32000 	strb	r2, [r3]
8000ab04:	e320f000 	nop	{0}
8000ab08:	e24bd00c 	sub	sp, fp, #12
8000ab0c:	e89da800 	ldm	sp, {fp, sp, pc}

8000ab10 <proc_expand_memory>:
8000ab10:	e1a0c00d 	mov	ip, sp
8000ab14:	e92dd800 	push	{fp, ip, lr, pc}
8000ab18:	e24cb004 	sub	fp, ip, #4
8000ab1c:	e24dd028 	sub	sp, sp, #40	@ 0x28
8000ab20:	e50b0028 	str	r0, [fp, #-40]	@ 0xffffffd8
8000ab24:	e50b102c 	str	r1, [fp, #-44]	@ 0xffffffd4
8000ab28:	e3a03000 	mov	r3, #0
8000ab2c:	e50b3010 	str	r3, [fp, #-16]
8000ab30:	e3a03000 	mov	r3, #0
8000ab34:	e50b3010 	str	r3, [fp, #-16]
8000ab38:	ea000020 	b	8000abc0 <proc_expand_memory+0xb0>
8000ab3c:	ebfff8ca 	bl	80008e6c <kalloc>
8000ab40:	e50b0014 	str	r0, [fp, #-20]	@ 0xffffffec
8000ab44:	e3a02a01 	mov	r2, #4096	@ 0x1000
8000ab48:	e3a01000 	mov	r1, #0
8000ab4c:	e51b0014 	ldr	r0, [fp, #-20]	@ 0xffffffec
8000ab50:	eb000681 	bl	8000c55c <memset>
8000ab54:	e51b3028 	ldr	r3, [fp, #-40]	@ 0xffffffd8
8000ab58:	e593000c 	ldr	r0, [r3, #12]
8000ab5c:	e51b3028 	ldr	r3, [fp, #-40]	@ 0xffffffd8
8000ab60:	e5933010 	ldr	r3, [r3, #16]
8000ab64:	e50b3024 	str	r3, [fp, #-36]	@ 0xffffffdc
8000ab68:	e51b3014 	ldr	r3, [fp, #-20]	@ 0xffffffec
8000ab6c:	e2833102 	add	r3, r3, #-2147483648	@ 0x80000000
8000ab70:	e50b3020 	str	r3, [fp, #-32]	@ 0xffffffe0
8000ab74:	e51b3014 	ldr	r3, [fp, #-20]	@ 0xffffffec
8000ab78:	e2833102 	add	r3, r3, #-2147483648	@ 0x80000000
8000ab7c:	e2833a01 	add	r3, r3, #4096	@ 0x1000
8000ab80:	e50b301c 	str	r3, [fp, #-28]	@ 0xffffffe4
8000ab84:	e3a030ff 	mov	r3, #255	@ 0xff
8000ab88:	e50b3018 	str	r3, [fp, #-24]	@ 0xffffffe8
8000ab8c:	e51b3018 	ldr	r3, [fp, #-24]	@ 0xffffffe8
8000ab90:	e58d3000 	str	r3, [sp]
8000ab94:	e24b3024 	sub	r3, fp, #36	@ 0x24
8000ab98:	e893000e 	ldm	r3, {r1, r2, r3}
8000ab9c:	ebfff9a9 	bl	80009248 <map_pages>
8000aba0:	e51b3028 	ldr	r3, [fp, #-40]	@ 0xffffffd8
8000aba4:	e5933010 	ldr	r3, [r3, #16]
8000aba8:	e2832a01 	add	r2, r3, #4096	@ 0x1000
8000abac:	e51b3028 	ldr	r3, [fp, #-40]	@ 0xffffffd8
8000abb0:	e5832010 	str	r2, [r3, #16]
8000abb4:	e51b3010 	ldr	r3, [fp, #-16]
8000abb8:	e2833001 	add	r3, r3, #1
8000abbc:	e50b3010 	str	r3, [fp, #-16]
8000abc0:	e51b2010 	ldr	r2, [fp, #-16]
8000abc4:	e51b302c 	ldr	r3, [fp, #-44]	@ 0xffffffd4
8000abc8:	e1520003 	cmp	r2, r3
8000abcc:	baffffda 	blt	8000ab3c <proc_expand_memory+0x2c>
8000abd0:	e320f000 	nop	{0}
8000abd4:	e320f000 	nop	{0}
8000abd8:	e24bd00c 	sub	sp, fp, #12
8000abdc:	e89da800 	ldm	sp, {fp, sp, pc}

8000abe0 <proc_shrink_memory>:
8000abe0:	e1a0c00d 	mov	ip, sp
8000abe4:	e92dd800 	push	{fp, ip, lr, pc}
8000abe8:	e24cb004 	sub	fp, ip, #4
8000abec:	e24dd018 	sub	sp, sp, #24
8000abf0:	e50b0020 	str	r0, [fp, #-32]	@ 0xffffffe0
8000abf4:	e50b1024 	str	r1, [fp, #-36]	@ 0xffffffdc
8000abf8:	e3a03000 	mov	r3, #0
8000abfc:	e50b3010 	str	r3, [fp, #-16]
8000ac00:	e3a03000 	mov	r3, #0
8000ac04:	e50b3010 	str	r3, [fp, #-16]
8000ac08:	ea000020 	b	8000ac90 <proc_shrink_memory+0xb0>
8000ac0c:	e51b3020 	ldr	r3, [fp, #-32]	@ 0xffffffe0
8000ac10:	e5933010 	ldr	r3, [r3, #16]
8000ac14:	e2433a01 	sub	r3, r3, #4096	@ 0x1000
8000ac18:	e50b3014 	str	r3, [fp, #-20]	@ 0xffffffec
8000ac1c:	e51b3020 	ldr	r3, [fp, #-32]	@ 0xffffffe0
8000ac20:	e593300c 	ldr	r3, [r3, #12]
8000ac24:	e51b1014 	ldr	r1, [fp, #-20]	@ 0xffffffec
8000ac28:	e1a00003 	mov	r0, r3
8000ac2c:	ebfffa7b 	bl	80009620 <resolve_physical_address>
8000ac30:	e50b0018 	str	r0, [fp, #-24]	@ 0xffffffe8
8000ac34:	e51b3018 	ldr	r3, [fp, #-24]	@ 0xffffffe8
8000ac38:	e2833102 	add	r3, r3, #-2147483648	@ 0x80000000
8000ac3c:	e50b301c 	str	r3, [fp, #-28]	@ 0xffffffe4
8000ac40:	e51b301c 	ldr	r3, [fp, #-28]	@ 0xffffffe4
8000ac44:	e1a00003 	mov	r0, r3
8000ac48:	ebfff8dc 	bl	80008fc0 <kfree>
8000ac4c:	e51b3020 	ldr	r3, [fp, #-32]	@ 0xffffffe0
8000ac50:	e593300c 	ldr	r3, [r3, #12]
8000ac54:	e51b1014 	ldr	r1, [fp, #-20]	@ 0xffffffec
8000ac58:	e1a00003 	mov	r0, r3
8000ac5c:	ebfffa4d 	bl	80009598 <unmap_page>
8000ac60:	e51b3020 	ldr	r3, [fp, #-32]	@ 0xffffffe0
8000ac64:	e5933010 	ldr	r3, [r3, #16]
8000ac68:	e2432a01 	sub	r2, r3, #4096	@ 0x1000
8000ac6c:	e51b3020 	ldr	r3, [fp, #-32]	@ 0xffffffe0
8000ac70:	e5832010 	str	r2, [r3, #16]
8000ac74:	e51b3020 	ldr	r3, [fp, #-32]	@ 0xffffffe0
8000ac78:	e5933010 	ldr	r3, [r3, #16]
8000ac7c:	e3530000 	cmp	r3, #0
8000ac80:	0a000007 	beq	8000aca4 <proc_shrink_memory+0xc4>
8000ac84:	e51b3010 	ldr	r3, [fp, #-16]
8000ac88:	e2833001 	add	r3, r3, #1
8000ac8c:	e50b3010 	str	r3, [fp, #-16]
8000ac90:	e51b2010 	ldr	r2, [fp, #-16]
8000ac94:	e51b3024 	ldr	r3, [fp, #-36]	@ 0xffffffdc
8000ac98:	e1520003 	cmp	r2, r3
8000ac9c:	baffffda 	blt	8000ac0c <proc_shrink_memory+0x2c>
8000aca0:	ea000000 	b	8000aca8 <proc_shrink_memory+0xc8>
8000aca4:	e320f000 	nop	{0}
8000aca8:	e320f000 	nop	{0}
8000acac:	e24bd00c 	sub	sp, fp, #12
8000acb0:	e89da800 	ldm	sp, {fp, sp, pc}

8000acb4 <proc_load>:
8000acb4:	e1a0c00d 	mov	ip, sp
8000acb8:	e92dd800 	push	{fp, ip, lr, pc}
8000acbc:	e24cb004 	sub	fp, ip, #4
8000acc0:	e24dd038 	sub	sp, sp, #56	@ 0x38
8000acc4:	e50b0038 	str	r0, [fp, #-56]	@ 0xffffffc8
8000acc8:	e50b103c 	str	r1, [fp, #-60]	@ 0xffffffc4
8000accc:	e50b2040 	str	r2, [fp, #-64]	@ 0xffffffc0
8000acd0:	e3a03000 	mov	r3, #0
8000acd4:	e50b3010 	str	r3, [fp, #-16]
8000acd8:	e3a03000 	mov	r3, #0
8000acdc:	e50b301c 	str	r3, [fp, #-28]	@ 0xffffffe4
8000ace0:	e3a03000 	mov	r3, #0
8000ace4:	e50b3014 	str	r3, [fp, #-20]	@ 0xffffffec
8000ace8:	e51b303c 	ldr	r3, [fp, #-60]	@ 0xffffffc4
8000acec:	e5933000 	ldr	r3, [r3]
8000acf0:	e50b3020 	str	r3, [fp, #-32]	@ 0xffffffe0
8000acf4:	e51b3020 	ldr	r3, [fp, #-32]	@ 0xffffffe0
8000acf8:	e1d331b0 	ldrh	r3, [r3, #16]
8000acfc:	e3530002 	cmp	r3, #2
8000ad00:	0a000001 	beq	8000ad0c <proc_load+0x58>
8000ad04:	e3a03000 	mov	r3, #0
8000ad08:	ea000076 	b	8000aee8 <proc_load+0x234>
8000ad0c:	e51b3020 	ldr	r3, [fp, #-32]	@ 0xffffffe0
8000ad10:	e593301c 	ldr	r3, [r3, #28]
8000ad14:	e50b3010 	str	r3, [fp, #-16]
8000ad18:	e51b3020 	ldr	r3, [fp, #-32]	@ 0xffffffe0
8000ad1c:	e1d332bc 	ldrh	r3, [r3, #44]	@ 0x2c
8000ad20:	e50b301c 	str	r3, [fp, #-28]	@ 0xffffffe4
8000ad24:	e3a03000 	mov	r3, #0
8000ad28:	e50b3014 	str	r3, [fp, #-20]	@ 0xffffffec
8000ad2c:	ea00004f 	b	8000ae70 <proc_load+0x1bc>
8000ad30:	e3a03000 	mov	r3, #0
8000ad34:	e50b3018 	str	r3, [fp, #-24]	@ 0xffffffe8
8000ad38:	e51b303c 	ldr	r3, [fp, #-60]	@ 0xffffffc4
8000ad3c:	e5932000 	ldr	r2, [r3]
8000ad40:	e51b3010 	ldr	r3, [fp, #-16]
8000ad44:	e0823003 	add	r3, r2, r3
8000ad48:	e50b3024 	str	r3, [fp, #-36]	@ 0xffffffdc
8000ad4c:	ea000002 	b	8000ad5c <proc_load+0xa8>
8000ad50:	e3a01001 	mov	r1, #1
8000ad54:	e51b0038 	ldr	r0, [fp, #-56]	@ 0xffffffc8
8000ad58:	ebffff6c 	bl	8000ab10 <proc_expand_memory>
8000ad5c:	e51b3038 	ldr	r3, [fp, #-56]	@ 0xffffffc8
8000ad60:	e5932010 	ldr	r2, [r3, #16]
8000ad64:	e51b3024 	ldr	r3, [fp, #-36]	@ 0xffffffdc
8000ad68:	e5931008 	ldr	r1, [r3, #8]
8000ad6c:	e51b3024 	ldr	r3, [fp, #-36]	@ 0xffffffdc
8000ad70:	e5933014 	ldr	r3, [r3, #20]
8000ad74:	e0813003 	add	r3, r1, r3
8000ad78:	e1520003 	cmp	r2, r3
8000ad7c:	3afffff3 	bcc	8000ad50 <proc_load+0x9c>
8000ad80:	e3a03000 	mov	r3, #0
8000ad84:	e50b3018 	str	r3, [fp, #-24]	@ 0xffffffe8
8000ad88:	ea00002d 	b	8000ae44 <proc_load+0x190>
8000ad8c:	e51b3024 	ldr	r3, [fp, #-36]	@ 0xffffffdc
8000ad90:	e5932008 	ldr	r2, [r3, #8]
8000ad94:	e51b3018 	ldr	r3, [fp, #-24]	@ 0xffffffe8
8000ad98:	e0823003 	add	r3, r2, r3
8000ad9c:	e50b3028 	str	r3, [fp, #-40]	@ 0xffffffd8
8000ada0:	e51b3038 	ldr	r3, [fp, #-56]	@ 0xffffffc8
8000ada4:	e593300c 	ldr	r3, [r3, #12]
8000ada8:	e51b2028 	ldr	r2, [fp, #-40]	@ 0xffffffd8
8000adac:	e1a01002 	mov	r1, r2
8000adb0:	e1a00003 	mov	r0, r3
8000adb4:	ebfffa19 	bl	80009620 <resolve_physical_address>
8000adb8:	e1a03000 	mov	r3, r0
8000adbc:	e50b302c 	str	r3, [fp, #-44]	@ 0xffffffd4
8000adc0:	e51b302c 	ldr	r3, [fp, #-44]	@ 0xffffffd4
8000adc4:	e2833102 	add	r3, r3, #-2147483648	@ 0x80000000
8000adc8:	e50b3030 	str	r3, [fp, #-48]	@ 0xffffffd0
8000adcc:	e51b3024 	ldr	r3, [fp, #-36]	@ 0xffffffdc
8000add0:	e5932004 	ldr	r2, [r3, #4]
8000add4:	e51b3018 	ldr	r3, [fp, #-24]	@ 0xffffffe8
8000add8:	e0823003 	add	r3, r2, r3
8000addc:	e50b3034 	str	r3, [fp, #-52]	@ 0xffffffcc
8000ade0:	e51b3034 	ldr	r3, [fp, #-52]	@ 0xffffffcc
8000ade4:	e2832eff 	add	r2, r3, #4080	@ 0xff0
8000ade8:	e282200f 	add	r2, r2, #15
8000adec:	e3530000 	cmp	r3, #0
8000adf0:	b1a03002 	movlt	r3, r2
8000adf4:	a1a03003 	movge	r3, r3
8000adf8:	e1a03643 	asr	r3, r3, #12
8000adfc:	e1a03103 	lsl	r3, r3, #2
8000ae00:	e51b203c 	ldr	r2, [fp, #-60]	@ 0xffffffc4
8000ae04:	e0823003 	add	r3, r2, r3
8000ae08:	e5931000 	ldr	r1, [r3]
8000ae0c:	e51b3034 	ldr	r3, [fp, #-52]	@ 0xffffffcc
8000ae10:	e2732000 	rsbs	r2, r3, #0
8000ae14:	e1a03a03 	lsl	r3, r3, #20
8000ae18:	e1a03a23 	lsr	r3, r3, #20
8000ae1c:	e1a02a02 	lsl	r2, r2, #20
8000ae20:	e1a02a22 	lsr	r2, r2, #20
8000ae24:	52623000 	rsbpl	r3, r2, #0
8000ae28:	e0813003 	add	r3, r1, r3
8000ae2c:	e5d32000 	ldrb	r2, [r3]
8000ae30:	e51b3030 	ldr	r3, [fp, #-48]	@ 0xffffffd0
8000ae34:	e5c32000 	strb	r2, [r3]
8000ae38:	e51b3018 	ldr	r3, [fp, #-24]	@ 0xffffffe8
8000ae3c:	e2833001 	add	r3, r3, #1
8000ae40:	e50b3018 	str	r3, [fp, #-24]	@ 0xffffffe8
8000ae44:	e51b3024 	ldr	r3, [fp, #-36]	@ 0xffffffdc
8000ae48:	e5933014 	ldr	r3, [r3, #20]
8000ae4c:	e51b2018 	ldr	r2, [fp, #-24]	@ 0xffffffe8
8000ae50:	e1520003 	cmp	r2, r3
8000ae54:	3affffcc 	bcc	8000ad8c <proc_load+0xd8>
8000ae58:	e51b3010 	ldr	r3, [fp, #-16]
8000ae5c:	e2833020 	add	r3, r3, #32
8000ae60:	e50b3010 	str	r3, [fp, #-16]
8000ae64:	e51b3014 	ldr	r3, [fp, #-20]	@ 0xffffffec
8000ae68:	e2833001 	add	r3, r3, #1
8000ae6c:	e50b3014 	str	r3, [fp, #-20]	@ 0xffffffec
8000ae70:	e51b2014 	ldr	r2, [fp, #-20]	@ 0xffffffec
8000ae74:	e51b301c 	ldr	r3, [fp, #-28]	@ 0xffffffe4
8000ae78:	e1520003 	cmp	r2, r3
8000ae7c:	baffffab 	blt	8000ad30 <proc_load+0x7c>
8000ae80:	e51b3020 	ldr	r3, [fp, #-32]	@ 0xffffffe0
8000ae84:	e5933018 	ldr	r3, [r3, #24]
8000ae88:	e1a02003 	mov	r2, r3
8000ae8c:	e51b3038 	ldr	r3, [fp, #-56]	@ 0xffffffc8
8000ae90:	e5832008 	str	r2, [r3, #8]
8000ae94:	e51b3038 	ldr	r3, [fp, #-56]	@ 0xffffffc8
8000ae98:	e3a02003 	mov	r2, #3
8000ae9c:	e5c32000 	strb	r2, [r3]
8000aea0:	e51b3038 	ldr	r3, [fp, #-56]	@ 0xffffffc8
8000aea4:	e283301c 	add	r3, r3, #28
8000aea8:	e3a02044 	mov	r2, #68	@ 0x44
8000aeac:	e3a01000 	mov	r1, #0
8000aeb0:	e1a00003 	mov	r0, r3
8000aeb4:	eb0005a8 	bl	8000c55c <memset>
8000aeb8:	e51b3038 	ldr	r3, [fp, #-56]	@ 0xffffffc8
8000aebc:	e3a02010 	mov	r2, #16
8000aec0:	e583201c 	str	r2, [r3, #28]
8000aec4:	e51b3038 	ldr	r3, [fp, #-56]	@ 0xffffffc8
8000aec8:	e5933008 	ldr	r3, [r3, #8]
8000aecc:	e1a02003 	mov	r2, r3
8000aed0:	e51b3038 	ldr	r3, [fp, #-56]	@ 0xffffffc8
8000aed4:	e5832020 	str	r2, [r3, #32]
8000aed8:	e51b3038 	ldr	r3, [fp, #-56]	@ 0xffffffc8
8000aedc:	e59f2010 	ldr	r2, [pc, #16]	@ 8000aef4 <proc_load+0x240>
8000aee0:	e5832058 	str	r2, [r3, #88]	@ 0x58
8000aee4:	e3a03001 	mov	r3, #1
8000aee8:	e1a00003 	mov	r0, r3
8000aeec:	e24bd00c 	sub	sp, fp, #12
8000aef0:	e89da800 	ldm	sp, {fp, sp, pc}
8000aef4:	7fffe000 	svcvc	0x00ffe000

8000aef8 <proc_start>:
8000aef8:	e1a0c00d 	mov	ip, sp
8000aefc:	e92dd800 	push	{fp, ip, lr, pc}
8000af00:	e24cb004 	sub	fp, ip, #4
8000af04:	e24dd008 	sub	sp, sp, #8
8000af08:	e50b0010 	str	r0, [fp, #-16]
8000af0c:	e59f2048 	ldr	r2, [pc, #72]	@ 8000af5c <proc_start+0x64>
8000af10:	e08f2002 	add	r2, pc, r2
8000af14:	e59f3044 	ldr	r3, [pc, #68]	@ 8000af60 <proc_start+0x68>
8000af18:	e7923003 	ldr	r3, [r2, r3]
8000af1c:	e51b2010 	ldr	r2, [fp, #-16]
8000af20:	e5832000 	str	r2, [r3]
8000af24:	e51b3010 	ldr	r3, [fp, #-16]
8000af28:	e593300c 	ldr	r3, [r3, #12]
8000af2c:	e2833102 	add	r3, r3, #-2147483648	@ 0x80000000
8000af30:	e1a00003 	mov	r0, r3
8000af34:	ebfff78d 	bl	80008d70 <set_translation_table_base>
8000af38:	e3a04000 	mov	r4, #0
8000af3c:	ee084f17 	mcr	15, 0, r4, cr8, cr7, {0}
8000af40:	e51b3010 	ldr	r3, [fp, #-16]
8000af44:	e283301c 	add	r3, r3, #28
8000af48:	e1a00003 	mov	r0, r3
8000af4c:	ebfff78b 	bl	80008d80 <switch_to_context>
8000af50:	e320f000 	nop	{0}
8000af54:	e24bd00c 	sub	sp, fp, #12
8000af58:	e89da800 	ldm	sp, {fp, sp, pc}
8000af5c:	000150e8 	andeq	r5, r1, r8, ror #1
8000af60:	0000003c 	andeq	r0, r0, ip, lsr r0

8000af64 <get_current_context>:
8000af64:	e1a0c00d 	mov	ip, sp
8000af68:	e92dd800 	push	{fp, ip, lr, pc}
8000af6c:	e24cb004 	sub	fp, ip, #4
8000af70:	e59f2018 	ldr	r2, [pc, #24]	@ 8000af90 <get_current_context+0x2c>
8000af74:	e08f2002 	add	r2, pc, r2
8000af78:	e59f3014 	ldr	r3, [pc, #20]	@ 8000af94 <get_current_context+0x30>
8000af7c:	e7923003 	ldr	r3, [r2, r3]
8000af80:	e5933000 	ldr	r3, [r3]
8000af84:	e283301c 	add	r3, r3, #28
8000af88:	e1a00003 	mov	r0, r3
8000af8c:	e89da800 	ldm	sp, {fp, sp, pc}
8000af90:	00015084 	andeq	r5, r1, r4, lsl #1
8000af94:	0000003c 	andeq	r0, r0, ip, lsr r0

8000af98 <proc_get>:
8000af98:	e1a0c00d 	mov	ip, sp
8000af9c:	e92dd800 	push	{fp, ip, lr, pc}
8000afa0:	e24cb004 	sub	fp, ip, #4
8000afa4:	e24dd008 	sub	sp, sp, #8
8000afa8:	e50b0010 	str	r0, [fp, #-16]
8000afac:	e59f1058 	ldr	r1, [pc, #88]	@ 8000b00c <proc_get+0x74>
8000afb0:	e08f1001 	add	r1, pc, r1
8000afb4:	e51b3010 	ldr	r3, [fp, #-16]
8000afb8:	e3530000 	cmp	r3, #0
8000afbc:	da00000e 	ble	8000affc <proc_get+0x64>
8000afc0:	e51b3010 	ldr	r3, [fp, #-16]
8000afc4:	e353000a 	cmp	r3, #10
8000afc8:	ca00000b 	bgt	8000affc <proc_get+0x64>
8000afcc:	e51b3010 	ldr	r3, [fp, #-16]
8000afd0:	e2432001 	sub	r2, r3, #1
8000afd4:	e1a03002 	mov	r3, r2
8000afd8:	e1a03083 	lsl	r3, r3, #1
8000afdc:	e0833002 	add	r3, r3, r2
8000afe0:	e1a03103 	lsl	r3, r3, #2
8000afe4:	e0833002 	add	r3, r3, r2
8000afe8:	e1a03183 	lsl	r3, r3, #3
8000afec:	e59f201c 	ldr	r2, [pc, #28]	@ 8000b010 <proc_get+0x78>
8000aff0:	e7912002 	ldr	r2, [r1, r2]
8000aff4:	e0833002 	add	r3, r3, r2
8000aff8:	ea000000 	b	8000b000 <proc_get+0x68>
8000affc:	e3a03000 	mov	r3, #0
8000b000:	e1a00003 	mov	r0, r3
8000b004:	e24bd00c 	sub	sp, fp, #12
8000b008:	e89da800 	ldm	sp, {fp, sp, pc}
8000b00c:	00015048 	andeq	r5, r1, r8, asr #32
8000b010:	00000044 	andeq	r0, r0, r4, asr #32

8000b014 <save_context_1>:
8000b014:	e92d5fff 	push	{r0, r1, r2, r3, r4, r5, r6, r7, r8, r9, sl, fp, ip, lr}
8000b018:	e1a0e000 	mov	lr, r0
8000b01c:	e92d5ffe 	push	{r1, r2, r3, r4, r5, r6, r7, r8, r9, sl, fp, ip, lr}
8000b020:	ebffffcf 	bl	8000af64 <get_current_context>
8000b024:	e8bd5ffe 	pop	{r1, r2, r3, r4, r5, r6, r7, r8, r9, sl, fp, ip, lr}
8000b028:	03500000 	cmpeq	r0, #0
8000b02c:	0a000011 	beq	8000b078 <save_context_return>
8000b030:	e52d1004 	push	{r1}		@ (str r1, [sp, #-4]!)
8000b034:	e14f1000 	mrs	r1, SPSR
8000b038:	e5801000 	str	r1, [r0]
8000b03c:	e49d1004 	pop	{r1}		@ (ldr r1, [sp], #4)
8000b040:	e2800004 	add	r0, r0, #4
8000b044:	e580e000 	str	lr, [r0]
8000b048:	e2800008 	add	r0, r0, #8
8000b04c:	e8c07ffe 	stmia	r0, {r1, r2, r3, r4, r5, r6, r7, r8, r9, sl, fp, ip, sp, lr}^
8000b050:	ea000008 	b	8000b078 <save_context_return>

8000b054 <save_context_2>:
8000b054:	e92d5fff 	push	{r0, r1, r2, r3, r4, r5, r6, r7, r8, r9, sl, fp, ip, lr}
8000b058:	e1a01000 	mov	r1, r0
8000b05c:	e92d5ffe 	push	{r1, r2, r3, r4, r5, r6, r7, r8, r9, sl, fp, ip, lr}
8000b060:	ebffffbf 	bl	8000af64 <get_current_context>
8000b064:	e8bd5ffe 	pop	{r1, r2, r3, r4, r5, r6, r7, r8, r9, sl, fp, ip, lr}
8000b068:	03500000 	cmpeq	r0, #0
8000b06c:	0a000001 	beq	8000b078 <save_context_return>
8000b070:	e2800008 	add	r0, r0, #8
8000b074:	e5801000 	str	r1, [r0]

8000b078 <save_context_return>:
8000b078:	e8bd5fff 	pop	{r0, r1, r2, r3, r4, r5, r6, r7, r8, r9, sl, fp, ip, lr}
8000b07c:	e1a0f00e 	mov	pc, lr

8000b080 <handle_timer>:
8000b080:	e1a0c00d 	mov	ip, sp
8000b084:	e92dd800 	push	{fp, ip, lr, pc}
8000b088:	e24cb004 	sub	fp, ip, #4
8000b08c:	eb00035e 	bl	8000be0c <timer_clear_interrupt>
8000b090:	eb000017 	bl	8000b0f4 <schedule>
8000b094:	e320f000 	nop	{0}
8000b098:	e89da800 	ldm	sp, {fp, sp, pc}

8000b09c <scheduler_init>:
8000b09c:	e1a0c00d 	mov	ip, sp
8000b0a0:	e92dd830 	push	{r4, r5, fp, ip, lr, pc}
8000b0a4:	e24cb004 	sub	fp, ip, #4
8000b0a8:	e59f4034 	ldr	r4, [pc, #52]	@ 8000b0e4 <scheduler_init+0x48>
8000b0ac:	e08f4004 	add	r4, pc, r4
8000b0b0:	e59f3030 	ldr	r3, [pc, #48]	@ 8000b0e8 <scheduler_init+0x4c>
8000b0b4:	e08f3003 	add	r3, pc, r3
8000b0b8:	e3a02001 	mov	r2, #1
8000b0bc:	e5832000 	str	r2, [r3]
8000b0c0:	e59f0024 	ldr	r0, [pc, #36]	@ 8000b0ec <scheduler_init+0x50>
8000b0c4:	eb000342 	bl	8000bdd4 <timer_set_interval>
8000b0c8:	e59f3020 	ldr	r3, [pc, #32]	@ 8000b0f0 <scheduler_init+0x54>
8000b0cc:	e7943003 	ldr	r3, [r4, r3]
8000b0d0:	e1a01003 	mov	r1, r3
8000b0d4:	e3a00001 	mov	r0, #1
8000b0d8:	ebfff6a9 	bl	80008b84 <register_interrupt_handler>
8000b0dc:	e320f000 	nop	{0}
8000b0e0:	e89da830 	ldm	sp, {r4, r5, fp, sp, pc}
8000b0e4:	00014f4c 	andeq	r4, r1, ip, asr #30
8000b0e8:	0004cf48 	andeq	ip, r4, r8, asr #30
8000b0ec:	00030d40 	andeq	r0, r3, r0, asr #26
8000b0f0:	00000008 	andeq	r0, r0, r8

8000b0f4 <schedule>:
8000b0f4:	e1a0c00d 	mov	ip, sp
8000b0f8:	e92dd810 	push	{r4, fp, ip, lr, pc}
8000b0fc:	e24cb004 	sub	fp, ip, #4
8000b100:	e24dd00c 	sub	sp, sp, #12
8000b104:	e59f4108 	ldr	r4, [pc, #264]	@ 8000b214 <schedule+0x120>
8000b108:	e08f4004 	add	r4, pc, r4
8000b10c:	e3a03000 	mov	r3, #0
8000b110:	e50b3018 	str	r3, [fp, #-24]	@ 0xffffffe8
8000b114:	e3a03000 	mov	r3, #0
8000b118:	e50b3018 	str	r3, [fp, #-24]	@ 0xffffffe8
8000b11c:	ea00002c 	b	8000b1d4 <schedule+0xe0>
8000b120:	e3a03000 	mov	r3, #0
8000b124:	e50b301c 	str	r3, [fp, #-28]	@ 0xffffffe4
8000b128:	e59f30e8 	ldr	r3, [pc, #232]	@ 8000b218 <schedule+0x124>
8000b12c:	e08f3003 	add	r3, pc, r3
8000b130:	e5933000 	ldr	r3, [r3]
8000b134:	e2831001 	add	r1, r3, #1
8000b138:	e59f30dc 	ldr	r3, [pc, #220]	@ 8000b21c <schedule+0x128>
8000b13c:	e0c32193 	smull	r2, r3, r3, r1
8000b140:	e1a02143 	asr	r2, r3, #2
8000b144:	e1a03fc1 	asr	r3, r1, #31
8000b148:	e0422003 	sub	r2, r2, r3
8000b14c:	e1a03002 	mov	r3, r2
8000b150:	e1a03103 	lsl	r3, r3, #2
8000b154:	e0833002 	add	r3, r3, r2
8000b158:	e1a03083 	lsl	r3, r3, #1
8000b15c:	e0412003 	sub	r2, r1, r3
8000b160:	e59f30b8 	ldr	r3, [pc, #184]	@ 8000b220 <schedule+0x12c>
8000b164:	e08f3003 	add	r3, pc, r3
8000b168:	e5832000 	str	r2, [r3]
8000b16c:	e59f30b0 	ldr	r3, [pc, #176]	@ 8000b224 <schedule+0x130>
8000b170:	e08f3003 	add	r3, pc, r3
8000b174:	e5932000 	ldr	r2, [r3]
8000b178:	e1a03002 	mov	r3, r2
8000b17c:	e1a03083 	lsl	r3, r3, #1
8000b180:	e0833002 	add	r3, r3, r2
8000b184:	e1a03103 	lsl	r3, r3, #2
8000b188:	e0833002 	add	r3, r3, r2
8000b18c:	e1a03183 	lsl	r3, r3, #3
8000b190:	e59f2090 	ldr	r2, [pc, #144]	@ 8000b228 <schedule+0x134>
8000b194:	e7942002 	ldr	r2, [r4, r2]
8000b198:	e0833002 	add	r3, r3, r2
8000b19c:	e50b301c 	str	r3, [fp, #-28]	@ 0xffffffe4
8000b1a0:	e51b301c 	ldr	r3, [fp, #-28]	@ 0xffffffe4
8000b1a4:	e5d33000 	ldrb	r3, [r3]
8000b1a8:	e3530003 	cmp	r3, #3
8000b1ac:	1a000005 	bne	8000b1c8 <schedule+0xd4>
8000b1b0:	e59f3074 	ldr	r3, [pc, #116]	@ 8000b22c <schedule+0x138>
8000b1b4:	e7943003 	ldr	r3, [r4, r3]
8000b1b8:	e51b201c 	ldr	r2, [fp, #-28]	@ 0xffffffe4
8000b1bc:	e5832000 	str	r2, [r3]
8000b1c0:	e51b001c 	ldr	r0, [fp, #-28]	@ 0xffffffe4
8000b1c4:	ebffff4b 	bl	8000aef8 <proc_start>
8000b1c8:	e51b3018 	ldr	r3, [fp, #-24]	@ 0xffffffe8
8000b1cc:	e2833001 	add	r3, r3, #1
8000b1d0:	e50b3018 	str	r3, [fp, #-24]	@ 0xffffffe8
8000b1d4:	e51b3018 	ldr	r3, [fp, #-24]	@ 0xffffffe8
8000b1d8:	e3530009 	cmp	r3, #9
8000b1dc:	daffffcf 	ble	8000b120 <schedule+0x2c>
8000b1e0:	e3a01000 	mov	r1, #0
8000b1e4:	e3a00000 	mov	r0, #0
8000b1e8:	ebfffabe 	bl	80009ce8 <mon_status>
8000b1ec:	eb000011 	bl	8000b238 <dump_scheduler_status>
8000b1f0:	e59f3038 	ldr	r3, [pc, #56]	@ 8000b230 <schedule+0x13c>
8000b1f4:	e08f3003 	add	r3, pc, r3
8000b1f8:	e1a01003 	mov	r1, r3
8000b1fc:	e59f3030 	ldr	r3, [pc, #48]	@ 8000b234 <schedule+0x140>
8000b200:	e7943003 	ldr	r3, [r4, r3]
8000b204:	e1a00003 	mov	r0, r3
8000b208:	eb00055c 	bl	8000c780 <printf_base>
8000b20c:	e320f000 	nop	{0}
8000b210:	eafffffd 	b	8000b20c <schedule+0x118>
8000b214:	00014ef0 	strdeq	r4, [r1], -r0
8000b218:	0004ced0 	ldrdeq	ip, [r4], -r0
8000b21c:	66666667 	strbtvs	r6, [r6], -r7, ror #12
8000b220:	0004ce98 	muleq	r4, r8, lr
8000b224:	0004ce8c 	andeq	ip, r4, ip, lsl #29
8000b228:	00000044 	andeq	r0, r0, r4, asr #32
8000b22c:	0000003c 	andeq	r0, r0, ip, lsr r0
8000b230:	000032c0 	andeq	r3, r0, r0, asr #5
8000b234:	0000002c 	andeq	r0, r0, ip, lsr #32

8000b238 <dump_scheduler_status>:
8000b238:	e1a0c00d 	mov	ip, sp
8000b23c:	e92dd810 	push	{r4, fp, ip, lr, pc}
8000b240:	e24cb004 	sub	fp, ip, #4
8000b244:	e24dd00c 	sub	sp, sp, #12
8000b248:	e59f4188 	ldr	r4, [pc, #392]	@ 8000b3d8 <dump_scheduler_status+0x1a0>
8000b24c:	e08f4004 	add	r4, pc, r4
8000b250:	e3a03000 	mov	r3, #0
8000b254:	e50b3018 	str	r3, [fp, #-24]	@ 0xffffffe8
8000b258:	ea000017 	b	8000b2bc <dump_scheduler_status+0x84>
8000b25c:	e59f3178 	ldr	r3, [pc, #376]	@ 8000b3dc <dump_scheduler_status+0x1a4>
8000b260:	e08f3003 	add	r3, pc, r3
8000b264:	e5933000 	ldr	r3, [r3]
8000b268:	e51b2018 	ldr	r2, [fp, #-24]	@ 0xffffffe8
8000b26c:	e1520003 	cmp	r2, r3
8000b270:	1a000007 	bne	8000b294 <dump_scheduler_status+0x5c>
8000b274:	e59f3164 	ldr	r3, [pc, #356]	@ 8000b3e0 <dump_scheduler_status+0x1a8>
8000b278:	e08f3003 	add	r3, pc, r3
8000b27c:	e1a01003 	mov	r1, r3
8000b280:	e59f315c 	ldr	r3, [pc, #348]	@ 8000b3e4 <dump_scheduler_status+0x1ac>
8000b284:	e7943003 	ldr	r3, [r4, r3]
8000b288:	e1a00003 	mov	r0, r3
8000b28c:	eb00053b 	bl	8000c780 <printf_base>
8000b290:	ea000006 	b	8000b2b0 <dump_scheduler_status+0x78>
8000b294:	e59f314c 	ldr	r3, [pc, #332]	@ 8000b3e8 <dump_scheduler_status+0x1b0>
8000b298:	e08f3003 	add	r3, pc, r3
8000b29c:	e1a01003 	mov	r1, r3
8000b2a0:	e59f313c 	ldr	r3, [pc, #316]	@ 8000b3e4 <dump_scheduler_status+0x1ac>
8000b2a4:	e7943003 	ldr	r3, [r4, r3]
8000b2a8:	e1a00003 	mov	r0, r3
8000b2ac:	eb000533 	bl	8000c780 <printf_base>
8000b2b0:	e51b3018 	ldr	r3, [fp, #-24]	@ 0xffffffe8
8000b2b4:	e2833001 	add	r3, r3, #1
8000b2b8:	e50b3018 	str	r3, [fp, #-24]	@ 0xffffffe8
8000b2bc:	e51b3018 	ldr	r3, [fp, #-24]	@ 0xffffffe8
8000b2c0:	e3530009 	cmp	r3, #9
8000b2c4:	daffffe4 	ble	8000b25c <dump_scheduler_status+0x24>
8000b2c8:	e59f311c 	ldr	r3, [pc, #284]	@ 8000b3ec <dump_scheduler_status+0x1b4>
8000b2cc:	e08f3003 	add	r3, pc, r3
8000b2d0:	e1a01003 	mov	r1, r3
8000b2d4:	e59f3108 	ldr	r3, [pc, #264]	@ 8000b3e4 <dump_scheduler_status+0x1ac>
8000b2d8:	e7943003 	ldr	r3, [r4, r3]
8000b2dc:	e1a00003 	mov	r0, r3
8000b2e0:	eb000526 	bl	8000c780 <printf_base>
8000b2e4:	e3a03000 	mov	r3, #0
8000b2e8:	e50b3018 	str	r3, [fp, #-24]	@ 0xffffffe8
8000b2ec:	ea000009 	b	8000b318 <dump_scheduler_status+0xe0>
8000b2f0:	e59f30f8 	ldr	r3, [pc, #248]	@ 8000b3f0 <dump_scheduler_status+0x1b8>
8000b2f4:	e08f3003 	add	r3, pc, r3
8000b2f8:	e1a01003 	mov	r1, r3
8000b2fc:	e59f30e0 	ldr	r3, [pc, #224]	@ 8000b3e4 <dump_scheduler_status+0x1ac>
8000b300:	e7943003 	ldr	r3, [r4, r3]
8000b304:	e1a00003 	mov	r0, r3
8000b308:	eb00051c 	bl	8000c780 <printf_base>
8000b30c:	e51b3018 	ldr	r3, [fp, #-24]	@ 0xffffffe8
8000b310:	e2833001 	add	r3, r3, #1
8000b314:	e50b3018 	str	r3, [fp, #-24]	@ 0xffffffe8
8000b318:	e51b3018 	ldr	r3, [fp, #-24]	@ 0xffffffe8
8000b31c:	e3530009 	cmp	r3, #9
8000b320:	dafffff2 	ble	8000b2f0 <dump_scheduler_status+0xb8>
8000b324:	e59f30c8 	ldr	r3, [pc, #200]	@ 8000b3f4 <dump_scheduler_status+0x1bc>
8000b328:	e08f3003 	add	r3, pc, r3
8000b32c:	e1a01003 	mov	r1, r3
8000b330:	e59f30ac 	ldr	r3, [pc, #172]	@ 8000b3e4 <dump_scheduler_status+0x1ac>
8000b334:	e7943003 	ldr	r3, [r4, r3]
8000b338:	e1a00003 	mov	r0, r3
8000b33c:	eb00050f 	bl	8000c780 <printf_base>
8000b340:	e3a03000 	mov	r3, #0
8000b344:	e50b3018 	str	r3, [fp, #-24]	@ 0xffffffe8
8000b348:	ea000015 	b	8000b3a4 <dump_scheduler_status+0x16c>
8000b34c:	e59f30a4 	ldr	r3, [pc, #164]	@ 8000b3f8 <dump_scheduler_status+0x1c0>
8000b350:	e7941003 	ldr	r1, [r4, r3]
8000b354:	e51b2018 	ldr	r2, [fp, #-24]	@ 0xffffffe8
8000b358:	e1a03002 	mov	r3, r2
8000b35c:	e1a03083 	lsl	r3, r3, #1
8000b360:	e0833002 	add	r3, r3, r2
8000b364:	e1a03103 	lsl	r3, r3, #2
8000b368:	e0833002 	add	r3, r3, r2
8000b36c:	e1a03183 	lsl	r3, r3, #3
8000b370:	e0813003 	add	r3, r1, r3
8000b374:	e5d33000 	ldrb	r3, [r3]
8000b378:	e1a02003 	mov	r2, r3
8000b37c:	e59f3078 	ldr	r3, [pc, #120]	@ 8000b3fc <dump_scheduler_status+0x1c4>
8000b380:	e08f3003 	add	r3, pc, r3
8000b384:	e1a01003 	mov	r1, r3
8000b388:	e59f3054 	ldr	r3, [pc, #84]	@ 8000b3e4 <dump_scheduler_status+0x1ac>
8000b38c:	e7943003 	ldr	r3, [r4, r3]
8000b390:	e1a00003 	mov	r0, r3
8000b394:	eb0004f9 	bl	8000c780 <printf_base>
8000b398:	e51b3018 	ldr	r3, [fp, #-24]	@ 0xffffffe8
8000b39c:	e2833001 	add	r3, r3, #1
8000b3a0:	e50b3018 	str	r3, [fp, #-24]	@ 0xffffffe8
8000b3a4:	e51b3018 	ldr	r3, [fp, #-24]	@ 0xffffffe8
8000b3a8:	e3530009 	cmp	r3, #9
8000b3ac:	daffffe6 	ble	8000b34c <dump_scheduler_status+0x114>
8000b3b0:	e59f3048 	ldr	r3, [pc, #72]	@ 8000b400 <dump_scheduler_status+0x1c8>
8000b3b4:	e08f3003 	add	r3, pc, r3
8000b3b8:	e1a01003 	mov	r1, r3
8000b3bc:	e59f3020 	ldr	r3, [pc, #32]	@ 8000b3e4 <dump_scheduler_status+0x1ac>
8000b3c0:	e7943003 	ldr	r3, [r4, r3]
8000b3c4:	e1a00003 	mov	r0, r3
8000b3c8:	eb0004ec 	bl	8000c780 <printf_base>
8000b3cc:	e320f000 	nop	{0}
8000b3d0:	e24bd010 	sub	sp, fp, #16
8000b3d4:	e89da810 	ldm	sp, {r4, fp, sp, pc}
8000b3d8:	00014dac 	andeq	r4, r1, ip, lsr #27
8000b3dc:	0004cd9c 	muleq	r4, ip, sp
8000b3e0:	00003244 	andeq	r3, r0, r4, asr #4
8000b3e4:	0000002c 	andeq	r0, r0, ip, lsr #32
8000b3e8:	00003228 	andeq	r3, r0, r8, lsr #4
8000b3ec:	000031f8 	strdeq	r3, [r0], -r8
8000b3f0:	000031d4 	ldrdeq	r3, [r0], -r4
8000b3f4:	0000319c 	muleq	r0, ip, r1
8000b3f8:	00000044 	andeq	r0, r0, r4, asr #32
8000b3fc:	00003150 	andeq	r3, r0, r0, asr r1
8000b400:	00003110 	andeq	r3, r0, r0, lsl r1

8000b404 <syscall_exit>:
8000b404:	e1a0c00d 	mov	ip, sp
8000b408:	e92dd810 	push	{r4, fp, ip, lr, pc}
8000b40c:	e24cb004 	sub	fp, ip, #4
8000b410:	e24dd014 	sub	sp, sp, #20
8000b414:	e50b0020 	str	r0, [fp, #-32]	@ 0xffffffe0
8000b418:	e59f4108 	ldr	r4, [pc, #264]	@ 8000b528 <syscall_exit+0x124>
8000b41c:	e08f4004 	add	r4, pc, r4
8000b420:	e59f3104 	ldr	r3, [pc, #260]	@ 8000b52c <syscall_exit+0x128>
8000b424:	e7943003 	ldr	r3, [r4, r3]
8000b428:	e5933000 	ldr	r3, [r3]
8000b42c:	e3530000 	cmp	r3, #0
8000b430:	1a000001 	bne	8000b43c <syscall_exit+0x38>
8000b434:	e3e03000 	mvn	r3, #0
8000b438:	ea000037 	b	8000b51c <syscall_exit+0x118>
8000b43c:	e59f30ec 	ldr	r3, [pc, #236]	@ 8000b530 <syscall_exit+0x12c>
8000b440:	e7943003 	ldr	r3, [r4, r3]
8000b444:	e5933000 	ldr	r3, [r3]
8000b448:	e2833102 	add	r3, r3, #-2147483648	@ 0x80000000
8000b44c:	e1a00003 	mov	r0, r3
8000b450:	ebfff646 	bl	80008d70 <set_translation_table_base>
8000b454:	e59fd0dc 	ldr	sp, [pc, #220]	@ 8000b538 <syscall_exit+0x134>
8000b458:	e3a03000 	mov	r3, #0
8000b45c:	e50b3018 	str	r3, [fp, #-24]	@ 0xffffffe8
8000b460:	ea00001f 	b	8000b4e4 <syscall_exit+0xe0>
8000b464:	e51b2018 	ldr	r2, [fp, #-24]	@ 0xffffffe8
8000b468:	e1a03002 	mov	r3, r2
8000b46c:	e1a03083 	lsl	r3, r3, #1
8000b470:	e0833002 	add	r3, r3, r2
8000b474:	e1a03103 	lsl	r3, r3, #2
8000b478:	e0833002 	add	r3, r3, r2
8000b47c:	e1a03183 	lsl	r3, r3, #3
8000b480:	e59f20ac 	ldr	r2, [pc, #172]	@ 8000b534 <syscall_exit+0x130>
8000b484:	e7942002 	ldr	r2, [r4, r2]
8000b488:	e0833002 	add	r3, r3, r2
8000b48c:	e50b301c 	str	r3, [fp, #-28]	@ 0xffffffe4
8000b490:	e51b301c 	ldr	r3, [fp, #-28]	@ 0xffffffe4
8000b494:	e5d33000 	ldrb	r3, [r3]
8000b498:	e3530002 	cmp	r3, #2
8000b49c:	1a00000d 	bne	8000b4d8 <syscall_exit+0xd4>
8000b4a0:	e51b301c 	ldr	r3, [fp, #-28]	@ 0xffffffe4
8000b4a4:	e5932060 	ldr	r2, [r3, #96]	@ 0x60
8000b4a8:	e59f307c 	ldr	r3, [pc, #124]	@ 8000b52c <syscall_exit+0x128>
8000b4ac:	e7943003 	ldr	r3, [r4, r3]
8000b4b0:	e5933000 	ldr	r3, [r3]
8000b4b4:	e5933004 	ldr	r3, [r3, #4]
8000b4b8:	e1520003 	cmp	r2, r3
8000b4bc:	1a000005 	bne	8000b4d8 <syscall_exit+0xd4>
8000b4c0:	e51b301c 	ldr	r3, [fp, #-28]	@ 0xffffffe4
8000b4c4:	e3e02000 	mvn	r2, #0
8000b4c8:	e5832060 	str	r2, [r3, #96]	@ 0x60
8000b4cc:	e51b301c 	ldr	r3, [fp, #-28]	@ 0xffffffe4
8000b4d0:	e3a02003 	mov	r2, #3
8000b4d4:	e5c32000 	strb	r2, [r3]
8000b4d8:	e51b3018 	ldr	r3, [fp, #-24]	@ 0xffffffe8
8000b4dc:	e2833001 	add	r3, r3, #1
8000b4e0:	e50b3018 	str	r3, [fp, #-24]	@ 0xffffffe8
8000b4e4:	e51b3018 	ldr	r3, [fp, #-24]	@ 0xffffffe8
8000b4e8:	e3530009 	cmp	r3, #9
8000b4ec:	daffffdc 	ble	8000b464 <syscall_exit+0x60>
8000b4f0:	e59f3034 	ldr	r3, [pc, #52]	@ 8000b52c <syscall_exit+0x128>
8000b4f4:	e7943003 	ldr	r3, [r4, r3]
8000b4f8:	e5933000 	ldr	r3, [r3]
8000b4fc:	e1a00003 	mov	r0, r3
8000b500:	ebfffd65 	bl	8000aa9c <proc_free>
8000b504:	e59f3020 	ldr	r3, [pc, #32]	@ 8000b52c <syscall_exit+0x128>
8000b508:	e7943003 	ldr	r3, [r4, r3]
8000b50c:	e3a02000 	mov	r2, #0
8000b510:	e5832000 	str	r2, [r3]
8000b514:	ebfffef6 	bl	8000b0f4 <schedule>
8000b518:	e3a03000 	mov	r3, #0
8000b51c:	e1a00003 	mov	r0, r3
8000b520:	e24bd010 	sub	sp, fp, #16
8000b524:	e89da810 	ldm	sp, {r4, fp, sp, pc}
8000b528:	00014bdc 	ldrdeq	r4, [r1], -ip
8000b52c:	0000003c 	andeq	r0, r0, ip, lsr r0
8000b530:	0000000c 	andeq	r0, r0, ip
8000b534:	00000044 	andeq	r0, r0, r4, asr #32
8000b538:	80059010 	andhi	r9, r5, r0, lsl r0

8000b53c <syscall_getpid>:
8000b53c:	e1a0c00d 	mov	ip, sp
8000b540:	e92dd800 	push	{fp, ip, lr, pc}
8000b544:	e24cb004 	sub	fp, ip, #4
8000b548:	e59f2018 	ldr	r2, [pc, #24]	@ 8000b568 <syscall_getpid+0x2c>
8000b54c:	e08f2002 	add	r2, pc, r2
8000b550:	e59f3014 	ldr	r3, [pc, #20]	@ 8000b56c <syscall_getpid+0x30>
8000b554:	e7923003 	ldr	r3, [r2, r3]
8000b558:	e5933000 	ldr	r3, [r3]
8000b55c:	e5933004 	ldr	r3, [r3, #4]
8000b560:	e1a00003 	mov	r0, r3
8000b564:	e89da800 	ldm	sp, {fp, sp, pc}
8000b568:	00014aac 	andeq	r4, r1, ip, lsr #21
8000b56c:	0000003c 	andeq	r0, r0, ip, lsr r0

8000b570 <syscall_fork>:
8000b570:	e1a0c00d 	mov	ip, sp
8000b574:	e92dd800 	push	{fp, ip, lr, pc}
8000b578:	e24cb004 	sub	fp, ip, #4
8000b57c:	e24dd018 	sub	sp, sp, #24
8000b580:	e59f212c 	ldr	r2, [pc, #300]	@ 8000b6b4 <syscall_fork+0x144>
8000b584:	e08f2002 	add	r2, pc, r2
8000b588:	e3a03000 	mov	r3, #0
8000b58c:	e50b3014 	str	r3, [fp, #-20]	@ 0xffffffec
8000b590:	e59f3120 	ldr	r3, [pc, #288]	@ 8000b6b8 <syscall_fork+0x148>
8000b594:	e7923003 	ldr	r3, [r2, r3]
8000b598:	e5933000 	ldr	r3, [r3]
8000b59c:	e50b3018 	str	r3, [fp, #-24]	@ 0xffffffe8
8000b5a0:	e3a03000 	mov	r3, #0
8000b5a4:	e50b3010 	str	r3, [fp, #-16]
8000b5a8:	ebfffcb3 	bl	8000a87c <proc_create>
8000b5ac:	e50b0014 	str	r0, [fp, #-20]	@ 0xffffffec
8000b5b0:	e51b3018 	ldr	r3, [fp, #-24]	@ 0xffffffe8
8000b5b4:	e5933010 	ldr	r3, [r3, #16]
8000b5b8:	e1a03623 	lsr	r3, r3, #12
8000b5bc:	e1a01003 	mov	r1, r3
8000b5c0:	e51b0014 	ldr	r0, [fp, #-20]	@ 0xffffffec
8000b5c4:	ebfffd51 	bl	8000ab10 <proc_expand_memory>
8000b5c8:	e3a03000 	mov	r3, #0
8000b5cc:	e50b3010 	str	r3, [fp, #-16]
8000b5d0:	ea000012 	b	8000b620 <syscall_fork+0xb0>
8000b5d4:	e51b3014 	ldr	r3, [fp, #-20]	@ 0xffffffec
8000b5d8:	e593300c 	ldr	r3, [r3, #12]
8000b5dc:	e51b1010 	ldr	r1, [fp, #-16]
8000b5e0:	e1a00003 	mov	r0, r3
8000b5e4:	ebfff80d 	bl	80009620 <resolve_physical_address>
8000b5e8:	e1a03000 	mov	r3, r0
8000b5ec:	e50b301c 	str	r3, [fp, #-28]	@ 0xffffffe4
8000b5f0:	e51b301c 	ldr	r3, [fp, #-28]	@ 0xffffffe4
8000b5f4:	e2833102 	add	r3, r3, #-2147483648	@ 0x80000000
8000b5f8:	e50b3020 	str	r3, [fp, #-32]	@ 0xffffffe0
8000b5fc:	e51b3010 	ldr	r3, [fp, #-16]
8000b600:	e50b3024 	str	r3, [fp, #-36]	@ 0xffffffdc
8000b604:	e51b3024 	ldr	r3, [fp, #-36]	@ 0xffffffdc
8000b608:	e5d32000 	ldrb	r2, [r3]
8000b60c:	e51b3020 	ldr	r3, [fp, #-32]	@ 0xffffffe0
8000b610:	e5c32000 	strb	r2, [r3]
8000b614:	e51b3010 	ldr	r3, [fp, #-16]
8000b618:	e2833001 	add	r3, r3, #1
8000b61c:	e50b3010 	str	r3, [fp, #-16]
8000b620:	e51b3018 	ldr	r3, [fp, #-24]	@ 0xffffffe8
8000b624:	e5933010 	ldr	r3, [r3, #16]
8000b628:	e51b2010 	ldr	r2, [fp, #-16]
8000b62c:	e1520003 	cmp	r2, r3
8000b630:	3affffe7 	bcc	8000b5d4 <syscall_fork+0x64>
8000b634:	e51b3014 	ldr	r3, [fp, #-20]	@ 0xffffffec
8000b638:	e5930018 	ldr	r0, [r3, #24]
8000b63c:	e51b3018 	ldr	r3, [fp, #-24]	@ 0xffffffe8
8000b640:	e5933018 	ldr	r3, [r3, #24]
8000b644:	e3a02a01 	mov	r2, #4096	@ 0x1000
8000b648:	e1a01003 	mov	r1, r3
8000b64c:	eb000277 	bl	8000c030 <memcpy>
8000b650:	e51b3014 	ldr	r3, [fp, #-20]	@ 0xffffffec
8000b654:	e5930014 	ldr	r0, [r3, #20]
8000b658:	e51b3018 	ldr	r3, [fp, #-24]	@ 0xffffffe8
8000b65c:	e5933014 	ldr	r3, [r3, #20]
8000b660:	e3a02a01 	mov	r2, #4096	@ 0x1000
8000b664:	e1a01003 	mov	r1, r3
8000b668:	eb000270 	bl	8000c030 <memcpy>
8000b66c:	e51b3014 	ldr	r3, [fp, #-20]	@ 0xffffffec
8000b670:	e283001c 	add	r0, r3, #28
8000b674:	e51b3018 	ldr	r3, [fp, #-24]	@ 0xffffffe8
8000b678:	e283301c 	add	r3, r3, #28
8000b67c:	e3a02044 	mov	r2, #68	@ 0x44
8000b680:	e1a01003 	mov	r1, r3
8000b684:	eb000269 	bl	8000c030 <memcpy>
8000b688:	e51b3014 	ldr	r3, [fp, #-20]	@ 0xffffffec
8000b68c:	e3a02000 	mov	r2, #0
8000b690:	e5832024 	str	r2, [r3, #36]	@ 0x24
8000b694:	e51b3014 	ldr	r3, [fp, #-20]	@ 0xffffffec
8000b698:	e3a02003 	mov	r2, #3
8000b69c:	e5c32000 	strb	r2, [r3]
8000b6a0:	e51b3014 	ldr	r3, [fp, #-20]	@ 0xffffffec
8000b6a4:	e5933004 	ldr	r3, [r3, #4]
8000b6a8:	e1a00003 	mov	r0, r3
8000b6ac:	e24bd00c 	sub	sp, fp, #12
8000b6b0:	e89da800 	ldm	sp, {fp, sp, pc}
8000b6b4:	00014a74 	andeq	r4, r1, r4, ror sl
8000b6b8:	0000003c 	andeq	r0, r0, ip, lsr r0

8000b6bc <syscall_exec>:
8000b6bc:	e1a0c00d 	mov	ip, sp
8000b6c0:	e92dd810 	push	{r4, fp, ip, lr, pc}
8000b6c4:	e24cb004 	sub	fp, ip, #4
8000b6c8:	e24dd014 	sub	sp, sp, #20
8000b6cc:	e50b0020 	str	r0, [fp, #-32]	@ 0xffffffe0
8000b6d0:	e59f404c 	ldr	r4, [pc, #76]	@ 8000b724 <syscall_exec+0x68>
8000b6d4:	e08f4004 	add	r4, pc, r4
8000b6d8:	e59f3048 	ldr	r3, [pc, #72]	@ 8000b728 <syscall_exec+0x6c>
8000b6dc:	e7943003 	ldr	r3, [r4, r3]
8000b6e0:	e5933000 	ldr	r3, [r3]
8000b6e4:	e51b1020 	ldr	r1, [fp, #-32]	@ 0xffffffe0
8000b6e8:	e1a00003 	mov	r0, r3
8000b6ec:	eb00000e 	bl	8000b72c <proc_load_program>
8000b6f0:	e50b0018 	str	r0, [fp, #-24]	@ 0xffffffe8
8000b6f4:	e51b3018 	ldr	r3, [fp, #-24]	@ 0xffffffe8
8000b6f8:	e3530000 	cmp	r3, #0
8000b6fc:	0a000004 	beq	8000b714 <syscall_exec+0x58>
8000b700:	e59f3020 	ldr	r3, [pc, #32]	@ 8000b728 <syscall_exec+0x6c>
8000b704:	e7943003 	ldr	r3, [r4, r3]
8000b708:	e5933000 	ldr	r3, [r3]
8000b70c:	e1a00003 	mov	r0, r3
8000b710:	ebfffdf8 	bl	8000aef8 <proc_start>
8000b714:	e3e03000 	mvn	r3, #0
8000b718:	e1a00003 	mov	r0, r3
8000b71c:	e24bd010 	sub	sp, fp, #16
8000b720:	e89da810 	ldm	sp, {r4, fp, sp, pc}
8000b724:	00014924 	andeq	r4, r1, r4, lsr #18
8000b728:	0000003c 	andeq	r0, r0, ip, lsr r0

8000b72c <proc_load_program>:
8000b72c:	e1a0c00d 	mov	ip, sp
8000b730:	e92dd800 	push	{fp, ip, lr, pc}
8000b734:	e24cb004 	sub	fp, ip, #4
8000b738:	e24dd018 	sub	sp, sp, #24
8000b73c:	e50b0020 	str	r0, [fp, #-32]	@ 0xffffffe0
8000b740:	e50b1024 	str	r1, [fp, #-36]	@ 0xffffffdc
8000b744:	e59f1078 	ldr	r1, [pc, #120]	@ 8000b7c4 <proc_load_program+0x98>
8000b748:	e08f1001 	add	r1, pc, r1
8000b74c:	e3a03000 	mov	r3, #0
8000b750:	e50b3010 	str	r3, [fp, #-16]
8000b754:	e3a03000 	mov	r3, #0
8000b758:	e50b3014 	str	r3, [fp, #-20]	@ 0xffffffec
8000b75c:	e3a03000 	mov	r3, #0
8000b760:	e50b3018 	str	r3, [fp, #-24]	@ 0xffffffe8
8000b764:	e51b3024 	ldr	r3, [fp, #-36]	@ 0xffffffdc
8000b768:	e1a03603 	lsl	r3, r3, #12
8000b76c:	e59f2054 	ldr	r2, [pc, #84]	@ 8000b7c8 <proc_load_program+0x9c>
8000b770:	e7912002 	ldr	r2, [r1, r2]
8000b774:	e0833002 	add	r3, r3, r2
8000b778:	e24b2018 	sub	r2, fp, #24
8000b77c:	e24b1014 	sub	r1, fp, #20
8000b780:	e1a00003 	mov	r0, r3
8000b784:	eb000010 	bl	8000b7cc <decode_process_image>
8000b788:	e51b3014 	ldr	r3, [fp, #-20]	@ 0xffffffec
8000b78c:	e51b2018 	ldr	r2, [fp, #-24]	@ 0xffffffe8
8000b790:	e1a01003 	mov	r1, r3
8000b794:	e51b0020 	ldr	r0, [fp, #-32]	@ 0xffffffe0
8000b798:	ebfffd45 	bl	8000acb4 <proc_load>
8000b79c:	e50b0010 	str	r0, [fp, #-16]
8000b7a0:	e51b3014 	ldr	r3, [fp, #-20]	@ 0xffffffec
8000b7a4:	e51b2018 	ldr	r2, [fp, #-24]	@ 0xffffffe8
8000b7a8:	e1a01002 	mov	r1, r2
8000b7ac:	e1a00003 	mov	r0, r3
8000b7b0:	eb000048 	bl	8000b8d8 <free_process_image>
8000b7b4:	e51b3010 	ldr	r3, [fp, #-16]
8000b7b8:	e1a00003 	mov	r0, r3
8000b7bc:	e24bd00c 	sub	sp, fp, #12
8000b7c0:	e89da800 	ldm	sp, {fp, sp, pc}
8000b7c4:	000148b0 			@ <UNDEFINED> instruction: 0x000148b0
8000b7c8:	00000018 	andeq	r0, r0, r8, lsl r0

8000b7cc <decode_process_image>:
8000b7cc:	e1a0c00d 	mov	ip, sp
8000b7d0:	e92dd810 	push	{r4, fp, ip, lr, pc}
8000b7d4:	e24cb004 	sub	fp, ip, #4
8000b7d8:	e24dd01c 	sub	sp, sp, #28
8000b7dc:	e50b0020 	str	r0, [fp, #-32]	@ 0xffffffe0
8000b7e0:	e50b1024 	str	r1, [fp, #-36]	@ 0xffffffdc
8000b7e4:	e50b2028 	str	r2, [fp, #-40]	@ 0xffffffd8
8000b7e8:	e3a03000 	mov	r3, #0
8000b7ec:	e50b3018 	str	r3, [fp, #-24]	@ 0xffffffe8
8000b7f0:	ebfff59d 	bl	80008e6c <kalloc>
8000b7f4:	e1a02000 	mov	r2, r0
8000b7f8:	e51b3024 	ldr	r3, [fp, #-36]	@ 0xffffffdc
8000b7fc:	e5832000 	str	r2, [r3]
8000b800:	e3a03000 	mov	r3, #0
8000b804:	e50b3018 	str	r3, [fp, #-24]	@ 0xffffffe8
8000b808:	ea000027 	b	8000b8ac <decode_process_image+0xe0>
8000b80c:	e3a03000 	mov	r3, #0
8000b810:	e50b301c 	str	r3, [fp, #-28]	@ 0xffffffe4
8000b814:	e51b3024 	ldr	r3, [fp, #-36]	@ 0xffffffdc
8000b818:	e5932000 	ldr	r2, [r3]
8000b81c:	e51b3018 	ldr	r3, [fp, #-24]	@ 0xffffffe8
8000b820:	e1a03103 	lsl	r3, r3, #2
8000b824:	e0824003 	add	r4, r2, r3
8000b828:	ebfff58f 	bl	80008e6c <kalloc>
8000b82c:	e1a03000 	mov	r3, r0
8000b830:	e5843000 	str	r3, [r4]
8000b834:	e51b3018 	ldr	r3, [fp, #-24]	@ 0xffffffe8
8000b838:	e1a03103 	lsl	r3, r3, #2
8000b83c:	e51b2020 	ldr	r2, [fp, #-32]	@ 0xffffffe0
8000b840:	e0823003 	add	r3, r2, r3
8000b844:	e5934000 	ldr	r4, [r3]
8000b848:	e51b3018 	ldr	r3, [fp, #-24]	@ 0xffffffe8
8000b84c:	e1a03103 	lsl	r3, r3, #2
8000b850:	e51b2020 	ldr	r2, [fp, #-32]	@ 0xffffffe0
8000b854:	e0823003 	add	r3, r2, r3
8000b858:	e5933000 	ldr	r3, [r3]
8000b85c:	e1a00003 	mov	r0, r3
8000b860:	eb00035c 	bl	8000c5d8 <strlen>
8000b864:	e1a03000 	mov	r3, r0
8000b868:	e1a01003 	mov	r1, r3
8000b86c:	e51b3024 	ldr	r3, [fp, #-36]	@ 0xffffffdc
8000b870:	e5932000 	ldr	r2, [r3]
8000b874:	e51b3018 	ldr	r3, [fp, #-24]	@ 0xffffffe8
8000b878:	e1a03103 	lsl	r3, r3, #2
8000b87c:	e0823003 	add	r3, r2, r3
8000b880:	e5932000 	ldr	r2, [r3]
8000b884:	e24b301c 	sub	r3, fp, #28
8000b888:	e1a00004 	mov	r0, r4
8000b88c:	eb0001ad 	bl	8000bf48 <b16decode>
8000b890:	e51b3018 	ldr	r3, [fp, #-24]	@ 0xffffffe8
8000b894:	e2832001 	add	r2, r3, #1
8000b898:	e51b3028 	ldr	r3, [fp, #-40]	@ 0xffffffd8
8000b89c:	e5832000 	str	r2, [r3]
8000b8a0:	e51b3018 	ldr	r3, [fp, #-24]	@ 0xffffffe8
8000b8a4:	e2833001 	add	r3, r3, #1
8000b8a8:	e50b3018 	str	r3, [fp, #-24]	@ 0xffffffe8
8000b8ac:	e51b3018 	ldr	r3, [fp, #-24]	@ 0xffffffe8
8000b8b0:	e1a03103 	lsl	r3, r3, #2
8000b8b4:	e51b2020 	ldr	r2, [fp, #-32]	@ 0xffffffe0
8000b8b8:	e0823003 	add	r3, r2, r3
8000b8bc:	e5933000 	ldr	r3, [r3]
8000b8c0:	e3530000 	cmp	r3, #0
8000b8c4:	1affffd0 	bne	8000b80c <decode_process_image+0x40>
8000b8c8:	e320f000 	nop	{0}
8000b8cc:	e320f000 	nop	{0}
8000b8d0:	e24bd010 	sub	sp, fp, #16
8000b8d4:	e89da810 	ldm	sp, {r4, fp, sp, pc}

8000b8d8 <free_process_image>:
8000b8d8:	e1a0c00d 	mov	ip, sp
8000b8dc:	e92dd800 	push	{fp, ip, lr, pc}
8000b8e0:	e24cb004 	sub	fp, ip, #4
8000b8e4:	e24dd010 	sub	sp, sp, #16
8000b8e8:	e50b0018 	str	r0, [fp, #-24]	@ 0xffffffe8
8000b8ec:	e50b101c 	str	r1, [fp, #-28]	@ 0xffffffe4
8000b8f0:	e3a03000 	mov	r3, #0
8000b8f4:	e50b3010 	str	r3, [fp, #-16]
8000b8f8:	e3a03000 	mov	r3, #0
8000b8fc:	e50b3010 	str	r3, [fp, #-16]
8000b900:	ea000009 	b	8000b92c <free_process_image+0x54>
8000b904:	e51b3010 	ldr	r3, [fp, #-16]
8000b908:	e1a03103 	lsl	r3, r3, #2
8000b90c:	e51b2018 	ldr	r2, [fp, #-24]	@ 0xffffffe8
8000b910:	e0823003 	add	r3, r2, r3
8000b914:	e5933000 	ldr	r3, [r3]
8000b918:	e1a00003 	mov	r0, r3
8000b91c:	ebfff5a7 	bl	80008fc0 <kfree>
8000b920:	e51b3010 	ldr	r3, [fp, #-16]
8000b924:	e2833001 	add	r3, r3, #1
8000b928:	e50b3010 	str	r3, [fp, #-16]
8000b92c:	e51b2010 	ldr	r2, [fp, #-16]
8000b930:	e51b301c 	ldr	r3, [fp, #-28]	@ 0xffffffe4
8000b934:	e1520003 	cmp	r2, r3
8000b938:	bafffff1 	blt	8000b904 <free_process_image+0x2c>
8000b93c:	e51b0018 	ldr	r0, [fp, #-24]	@ 0xffffffe8
8000b940:	ebfff59e 	bl	80008fc0 <kfree>
8000b944:	e320f000 	nop	{0}
8000b948:	e24bd00c 	sub	sp, fp, #12
8000b94c:	e89da800 	ldm	sp, {fp, sp, pc}

8000b950 <syscall_yield>:
8000b950:	e1a0c00d 	mov	ip, sp
8000b954:	e92dd800 	push	{fp, ip, lr, pc}
8000b958:	e24cb004 	sub	fp, ip, #4
8000b95c:	ebfffde4 	bl	8000b0f4 <schedule>
8000b960:	e3a03000 	mov	r3, #0
8000b964:	e1a00003 	mov	r0, r3
8000b968:	e89da800 	ldm	sp, {fp, sp, pc}

8000b96c <syscall_wait>:
8000b96c:	e1a0c00d 	mov	ip, sp
8000b970:	e92dd810 	push	{r4, fp, ip, lr, pc}
8000b974:	e24cb004 	sub	fp, ip, #4
8000b978:	e24dd014 	sub	sp, sp, #20
8000b97c:	e50b0020 	str	r0, [fp, #-32]	@ 0xffffffe0
8000b980:	e59f4064 	ldr	r4, [pc, #100]	@ 8000b9ec <syscall_wait+0x80>
8000b984:	e08f4004 	add	r4, pc, r4
8000b988:	e51b0020 	ldr	r0, [fp, #-32]	@ 0xffffffe0
8000b98c:	ebfffd81 	bl	8000af98 <proc_get>
8000b990:	e50b0018 	str	r0, [fp, #-24]	@ 0xffffffe8
8000b994:	e51b3018 	ldr	r3, [fp, #-24]	@ 0xffffffe8
8000b998:	e3530000 	cmp	r3, #0
8000b99c:	0a00000e 	beq	8000b9dc <syscall_wait+0x70>
8000b9a0:	e51b3018 	ldr	r3, [fp, #-24]	@ 0xffffffe8
8000b9a4:	e5d33000 	ldrb	r3, [r3]
8000b9a8:	e3530000 	cmp	r3, #0
8000b9ac:	0a00000a 	beq	8000b9dc <syscall_wait+0x70>
8000b9b0:	e59f3038 	ldr	r3, [pc, #56]	@ 8000b9f0 <syscall_wait+0x84>
8000b9b4:	e7943003 	ldr	r3, [r4, r3]
8000b9b8:	e5933000 	ldr	r3, [r3]
8000b9bc:	e51b2020 	ldr	r2, [fp, #-32]	@ 0xffffffe0
8000b9c0:	e5832060 	str	r2, [r3, #96]	@ 0x60
8000b9c4:	e59f3024 	ldr	r3, [pc, #36]	@ 8000b9f0 <syscall_wait+0x84>
8000b9c8:	e7943003 	ldr	r3, [r4, r3]
8000b9cc:	e5933000 	ldr	r3, [r3]
8000b9d0:	e3a02002 	mov	r2, #2
8000b9d4:	e5c32000 	strb	r2, [r3]
8000b9d8:	ebfffdc5 	bl	8000b0f4 <schedule>
8000b9dc:	e3a03000 	mov	r3, #0
8000b9e0:	e1a00003 	mov	r0, r3
8000b9e4:	e24bd010 	sub	sp, fp, #16
8000b9e8:	e89da810 	ldm	sp, {r4, fp, sp, pc}
8000b9ec:	00014674 	andeq	r4, r1, r4, ror r6
8000b9f0:	0000003c 	andeq	r0, r0, ip, lsr r0

8000b9f4 <enable_irq_line>:
8000b9f4:	e1a0c00d 	mov	ip, sp
8000b9f8:	e92dd800 	push	{fp, ip, lr, pc}
8000b9fc:	e24cb004 	sub	fp, ip, #4
8000ba00:	e24dd008 	sub	sp, sp, #8
8000ba04:	e50b0010 	str	r0, [fp, #-16]
8000ba08:	e3a02001 	mov	r2, #1
8000ba0c:	e51b3010 	ldr	r3, [fp, #-16]
8000ba10:	e1a02312 	lsl	r2, r2, r3
8000ba14:	e59f300c 	ldr	r3, [pc, #12]	@ 8000ba28 <enable_irq_line+0x34>
8000ba18:	e5832000 	str	r2, [r3]
8000ba1c:	e320f000 	nop	{0}
8000ba20:	e24bd00c 	sub	sp, fp, #12
8000ba24:	e89da800 	ldm	sp, {fp, sp, pc}
8000ba28:	c0000210 	andgt	r0, r0, r0, lsl r2

8000ba2c <get_pending_irqs>:
8000ba2c:	e1a0c00d 	mov	ip, sp
8000ba30:	e92dd800 	push	{fp, ip, lr, pc}
8000ba34:	e24cb004 	sub	fp, ip, #4
8000ba38:	e24dd010 	sub	sp, sp, #16
8000ba3c:	e50b0018 	str	r0, [fp, #-24]	@ 0xffffffe8
8000ba40:	e3a03000 	mov	r3, #0
8000ba44:	e50b3010 	str	r3, [fp, #-16]
8000ba48:	e59f3078 	ldr	r3, [pc, #120]	@ 8000bac8 <get_pending_irqs+0x9c>
8000ba4c:	e5933000 	ldr	r3, [r3]
8000ba50:	e50b3014 	str	r3, [fp, #-20]	@ 0xffffffec
8000ba54:	e3a02080 	mov	r2, #128	@ 0x80
8000ba58:	e3a01000 	mov	r1, #0
8000ba5c:	e51b0018 	ldr	r0, [fp, #-24]	@ 0xffffffe8
8000ba60:	eb0002bd 	bl	8000c55c <memset>
8000ba64:	e3a03000 	mov	r3, #0
8000ba68:	e50b3010 	str	r3, [fp, #-16]
8000ba6c:	ea00000e 	b	8000baac <get_pending_irqs+0x80>
8000ba70:	e51b2014 	ldr	r2, [fp, #-20]	@ 0xffffffec
8000ba74:	e51b3010 	ldr	r3, [fp, #-16]
8000ba78:	e1a03332 	lsr	r3, r2, r3
8000ba7c:	e2033001 	and	r3, r3, #1
8000ba80:	e3530000 	cmp	r3, #0
8000ba84:	0a000005 	beq	8000baa0 <get_pending_irqs+0x74>
8000ba88:	e51b3010 	ldr	r3, [fp, #-16]
8000ba8c:	e1a03103 	lsl	r3, r3, #2
8000ba90:	e51b2018 	ldr	r2, [fp, #-24]	@ 0xffffffe8
8000ba94:	e0823003 	add	r3, r2, r3
8000ba98:	e3a02001 	mov	r2, #1
8000ba9c:	e5832000 	str	r2, [r3]
8000baa0:	e51b3010 	ldr	r3, [fp, #-16]
8000baa4:	e2833001 	add	r3, r3, #1
8000baa8:	e50b3010 	str	r3, [fp, #-16]
8000baac:	e51b3010 	ldr	r3, [fp, #-16]
8000bab0:	e353001f 	cmp	r3, #31
8000bab4:	daffffed 	ble	8000ba70 <get_pending_irqs+0x44>
8000bab8:	e320f000 	nop	{0}
8000babc:	e320f000 	nop	{0}
8000bac0:	e24bd00c 	sub	sp, fp, #12
8000bac4:	e89da800 	ldm	sp, {fp, sp, pc}
8000bac8:	c0000204 	andgt	r0, r0, r4, lsl #4

8000bacc <PUT32>:
8000bacc:	e1a0c00d 	mov	ip, sp
8000bad0:	e92dd800 	push	{fp, ip, lr, pc}
8000bad4:	e24cb004 	sub	fp, ip, #4
8000bad8:	e24dd008 	sub	sp, sp, #8
8000badc:	e50b0010 	str	r0, [fp, #-16]
8000bae0:	e50b1014 	str	r1, [fp, #-20]	@ 0xffffffec
8000bae4:	e51b3010 	ldr	r3, [fp, #-16]
8000bae8:	e283320a 	add	r3, r3, #-1610612736	@ 0xa0000000
8000baec:	e1a02003 	mov	r2, r3
8000baf0:	e51b3014 	ldr	r3, [fp, #-20]	@ 0xffffffec
8000baf4:	e5823000 	str	r3, [r2]
8000baf8:	e320f000 	nop	{0}
8000bafc:	e24bd00c 	sub	sp, fp, #12
8000bb00:	e89da800 	ldm	sp, {fp, sp, pc}

8000bb04 <GET32>:
8000bb04:	e1a0c00d 	mov	ip, sp
8000bb08:	e92dd800 	push	{fp, ip, lr, pc}
8000bb0c:	e24cb004 	sub	fp, ip, #4
8000bb10:	e24dd008 	sub	sp, sp, #8
8000bb14:	e50b0010 	str	r0, [fp, #-16]
8000bb18:	e51b3010 	ldr	r3, [fp, #-16]
8000bb1c:	e283320a 	add	r3, r3, #-1610612736	@ 0xa0000000
8000bb20:	e5933000 	ldr	r3, [r3]
8000bb24:	e1a00003 	mov	r0, r3
8000bb28:	e24bd00c 	sub	sp, fp, #12
8000bb2c:	e89da800 	ldm	sp, {fp, sp, pc}

8000bb30 <delay>:
8000bb30:	e1a0c00d 	mov	ip, sp
8000bb34:	e92dd800 	push	{fp, ip, lr, pc}
8000bb38:	e24cb004 	sub	fp, ip, #4
8000bb3c:	e24dd008 	sub	sp, sp, #8
8000bb40:	e50b0010 	str	r0, [fp, #-16]
8000bb44:	e51b3010 	ldr	r3, [fp, #-16]

8000bb48 <__delay_56>:
8000bb48:	e2533001 	subs	r3, r3, #1
8000bb4c:	1afffffd 	bne	8000bb48 <__delay_56>
8000bb50:	e320f000 	nop	{0}
8000bb54:	e24bd00c 	sub	sp, fp, #12
8000bb58:	e89da800 	ldm	sp, {fp, sp, pc}

8000bb5c <uart_init>:
8000bb5c:	e1a0c00d 	mov	ip, sp
8000bb60:	e92dd800 	push	{fp, ip, lr, pc}
8000bb64:	e24cb004 	sub	fp, ip, #4
8000bb68:	e24dd008 	sub	sp, sp, #8
8000bb6c:	e3a01202 	mov	r1, #536870912	@ 0x20000000
8000bb70:	e59f0100 	ldr	r0, [pc, #256]	@ 8000bc78 <uart_init+0x11c>
8000bb74:	ebffffd4 	bl	8000bacc <PUT32>
8000bb78:	e3a01001 	mov	r1, #1
8000bb7c:	e59f00f8 	ldr	r0, [pc, #248]	@ 8000bc7c <uart_init+0x120>
8000bb80:	ebffffd1 	bl	8000bacc <PUT32>
8000bb84:	e3a01000 	mov	r1, #0
8000bb88:	e59f00f0 	ldr	r0, [pc, #240]	@ 8000bc80 <uart_init+0x124>
8000bb8c:	ebffffce 	bl	8000bacc <PUT32>
8000bb90:	e3a01000 	mov	r1, #0
8000bb94:	e59f00e8 	ldr	r0, [pc, #232]	@ 8000bc84 <uart_init+0x128>
8000bb98:	ebffffcb 	bl	8000bacc <PUT32>
8000bb9c:	e3a01003 	mov	r1, #3
8000bba0:	e59f00e0 	ldr	r0, [pc, #224]	@ 8000bc88 <uart_init+0x12c>
8000bba4:	ebffffc8 	bl	8000bacc <PUT32>
8000bba8:	e3a01000 	mov	r1, #0
8000bbac:	e59f00d8 	ldr	r0, [pc, #216]	@ 8000bc8c <uart_init+0x130>
8000bbb0:	ebffffc5 	bl	8000bacc <PUT32>
8000bbb4:	e3a01005 	mov	r1, #5
8000bbb8:	e59f00c0 	ldr	r0, [pc, #192]	@ 8000bc80 <uart_init+0x124>
8000bbbc:	ebffffc2 	bl	8000bacc <PUT32>
8000bbc0:	e3a010c6 	mov	r1, #198	@ 0xc6
8000bbc4:	e59f00c4 	ldr	r0, [pc, #196]	@ 8000bc90 <uart_init+0x134>
8000bbc8:	ebffffbf 	bl	8000bacc <PUT32>
8000bbcc:	e59f10c0 	ldr	r1, [pc, #192]	@ 8000bc94 <uart_init+0x138>
8000bbd0:	e59f00c0 	ldr	r0, [pc, #192]	@ 8000bc98 <uart_init+0x13c>
8000bbd4:	ebffffbc 	bl	8000bacc <PUT32>
8000bbd8:	e59f00bc 	ldr	r0, [pc, #188]	@ 8000bc9c <uart_init+0x140>
8000bbdc:	ebffffc8 	bl	8000bb04 <GET32>
8000bbe0:	e50b0010 	str	r0, [fp, #-16]
8000bbe4:	e51b3010 	ldr	r3, [fp, #-16]
8000bbe8:	e3c33a07 	bic	r3, r3, #28672	@ 0x7000
8000bbec:	e50b3010 	str	r3, [fp, #-16]
8000bbf0:	e51b3010 	ldr	r3, [fp, #-16]
8000bbf4:	e3833a02 	orr	r3, r3, #8192	@ 0x2000
8000bbf8:	e50b3010 	str	r3, [fp, #-16]
8000bbfc:	e51b3010 	ldr	r3, [fp, #-16]
8000bc00:	e3c3390e 	bic	r3, r3, #229376	@ 0x38000
8000bc04:	e50b3010 	str	r3, [fp, #-16]
8000bc08:	e51b3010 	ldr	r3, [fp, #-16]
8000bc0c:	e3833801 	orr	r3, r3, #65536	@ 0x10000
8000bc10:	e50b3010 	str	r3, [fp, #-16]
8000bc14:	e51b1010 	ldr	r1, [fp, #-16]
8000bc18:	e59f007c 	ldr	r0, [pc, #124]	@ 8000bc9c <uart_init+0x140>
8000bc1c:	ebffffaa 	bl	8000bacc <PUT32>
8000bc20:	e3a01000 	mov	r1, #0
8000bc24:	e59f0074 	ldr	r0, [pc, #116]	@ 8000bca0 <uart_init+0x144>
8000bc28:	ebffffa7 	bl	8000bacc <PUT32>
8000bc2c:	e3a00096 	mov	r0, #150	@ 0x96
8000bc30:	ebffffbe 	bl	8000bb30 <delay>
8000bc34:	e3a01903 	mov	r1, #49152	@ 0xc000
8000bc38:	e59f0064 	ldr	r0, [pc, #100]	@ 8000bca4 <uart_init+0x148>
8000bc3c:	ebffffa2 	bl	8000bacc <PUT32>
8000bc40:	e3a00096 	mov	r0, #150	@ 0x96
8000bc44:	ebffffb9 	bl	8000bb30 <delay>
8000bc48:	e3a01000 	mov	r1, #0
8000bc4c:	e59f0050 	ldr	r0, [pc, #80]	@ 8000bca4 <uart_init+0x148>
8000bc50:	ebffff9d 	bl	8000bacc <PUT32>
8000bc54:	e3a01003 	mov	r1, #3
8000bc58:	e59f0024 	ldr	r0, [pc, #36]	@ 8000bc84 <uart_init+0x128>
8000bc5c:	ebffff9a 	bl	8000bacc <PUT32>
8000bc60:	e3a01202 	mov	r1, #536870912	@ 0x20000000
8000bc64:	e59f003c 	ldr	r0, [pc, #60]	@ 8000bca8 <uart_init+0x14c>
8000bc68:	ebffff97 	bl	8000bacc <PUT32>
8000bc6c:	e320f000 	nop	{0}
8000bc70:	e24bd00c 	sub	sp, fp, #12
8000bc74:	e89da800 	ldm	sp, {fp, sp, pc}
8000bc78:	2000b21c 	andcs	fp, r0, ip, lsl r2
8000bc7c:	20215004 	eorcs	r5, r1, r4
8000bc80:	20215044 	eorcs	r5, r1, r4, asr #32
8000bc84:	20215060 	eorcs	r5, r1, r0, rrx
8000bc88:	2021504c 	eorcs	r5, r1, ip, asr #32
8000bc8c:	20215050 	eorcs	r5, r1, r0, asr r0
8000bc90:	20215048 	eorcs	r5, r1, r8, asr #32
8000bc94:	0000010e 	andeq	r0, r0, lr, lsl #2
8000bc98:	20215068 	eorcs	r5, r1, r8, rrx
8000bc9c:	20200004 	eorcs	r0, r0, r4
8000bca0:	20200094 	mlacs	r0, r4, r0, r0
8000bca4:	20200098 	mlacs	r0, r8, r0, r0
8000bca8:	2000b210 	andcs	fp, r0, r0, lsl r2

8000bcac <uart_transmit>:
8000bcac:	e1a0c00d 	mov	ip, sp
8000bcb0:	e92dd800 	push	{fp, ip, lr, pc}
8000bcb4:	e24cb004 	sub	fp, ip, #4
8000bcb8:	e24dd008 	sub	sp, sp, #8
8000bcbc:	e1a03000 	mov	r3, r0
8000bcc0:	e54b300d 	strb	r3, [fp, #-13]
8000bcc4:	e59f0034 	ldr	r0, [pc, #52]	@ 8000bd00 <uart_transmit+0x54>
8000bcc8:	ebffff8d 	bl	8000bb04 <GET32>
8000bccc:	e1a03000 	mov	r3, r0
8000bcd0:	e2033020 	and	r3, r3, #32
8000bcd4:	e3530000 	cmp	r3, #0
8000bcd8:	1a000000 	bne	8000bce0 <uart_transmit+0x34>
8000bcdc:	eafffff8 	b	8000bcc4 <uart_transmit+0x18>
8000bce0:	e320f000 	nop	{0}
8000bce4:	e55b300d 	ldrb	r3, [fp, #-13]
8000bce8:	e1a01003 	mov	r1, r3
8000bcec:	e59f0010 	ldr	r0, [pc, #16]	@ 8000bd04 <uart_transmit+0x58>
8000bcf0:	ebffff75 	bl	8000bacc <PUT32>
8000bcf4:	e320f000 	nop	{0}
8000bcf8:	e24bd00c 	sub	sp, fp, #12
8000bcfc:	e89da800 	ldm	sp, {fp, sp, pc}
8000bd00:	20215054 	eorcs	r5, r1, r4, asr r0
8000bd04:	20215040 	eorcs	r5, r1, r0, asr #32

8000bd08 <uart_can_receive>:
8000bd08:	e1a0c00d 	mov	ip, sp
8000bd0c:	e92dd800 	push	{fp, ip, lr, pc}
8000bd10:	e24cb004 	sub	fp, ip, #4
8000bd14:	e24dd008 	sub	sp, sp, #8
8000bd18:	e59f0028 	ldr	r0, [pc, #40]	@ 8000bd48 <uart_can_receive+0x40>
8000bd1c:	ebffff78 	bl	8000bb04 <GET32>
8000bd20:	e50b0010 	str	r0, [fp, #-16]
8000bd24:	e51b3010 	ldr	r3, [fp, #-16]
8000bd28:	e2033001 	and	r3, r3, #1
8000bd2c:	e3530000 	cmp	r3, #0
8000bd30:	03a03001 	moveq	r3, #1
8000bd34:	13a03000 	movne	r3, #0
8000bd38:	e6ef3073 	uxtb	r3, r3
8000bd3c:	e1a00003 	mov	r0, r3
8000bd40:	e24bd00c 	sub	sp, fp, #12
8000bd44:	e89da800 	ldm	sp, {fp, sp, pc}
8000bd48:	20215048 	eorcs	r5, r1, r8, asr #32

8000bd4c <uart_receive>:
8000bd4c:	e1a0c00d 	mov	ip, sp
8000bd50:	e92dd800 	push	{fp, ip, lr, pc}
8000bd54:	e24cb004 	sub	fp, ip, #4
8000bd58:	e59f000c 	ldr	r0, [pc, #12]	@ 8000bd6c <uart_receive+0x20>
8000bd5c:	ebffff68 	bl	8000bb04 <GET32>
8000bd60:	e1a03000 	mov	r3, r0
8000bd64:	e1a00003 	mov	r0, r3
8000bd68:	e89da800 	ldm	sp, {fp, sp, pc}
8000bd6c:	20215040 	eorcs	r5, r1, r0, asr #32

8000bd70 <PUT32>:
8000bd70:	e1a0c00d 	mov	ip, sp
8000bd74:	e92dd800 	push	{fp, ip, lr, pc}
8000bd78:	e24cb004 	sub	fp, ip, #4
8000bd7c:	e24dd008 	sub	sp, sp, #8
8000bd80:	e50b0010 	str	r0, [fp, #-16]
8000bd84:	e50b1014 	str	r1, [fp, #-20]	@ 0xffffffec
8000bd88:	e51b3010 	ldr	r3, [fp, #-16]
8000bd8c:	e283320a 	add	r3, r3, #-1610612736	@ 0xa0000000
8000bd90:	e1a02003 	mov	r2, r3
8000bd94:	e51b3014 	ldr	r3, [fp, #-20]	@ 0xffffffec
8000bd98:	e5823000 	str	r3, [r2]
8000bd9c:	e320f000 	nop	{0}
8000bda0:	e24bd00c 	sub	sp, fp, #12
8000bda4:	e89da800 	ldm	sp, {fp, sp, pc}

8000bda8 <GET32>:
8000bda8:	e1a0c00d 	mov	ip, sp
8000bdac:	e92dd800 	push	{fp, ip, lr, pc}
8000bdb0:	e24cb004 	sub	fp, ip, #4
8000bdb4:	e24dd008 	sub	sp, sp, #8
8000bdb8:	e50b0010 	str	r0, [fp, #-16]
8000bdbc:	e51b3010 	ldr	r3, [fp, #-16]
8000bdc0:	e283320a 	add	r3, r3, #-1610612736	@ 0xa0000000
8000bdc4:	e5933000 	ldr	r3, [r3]
8000bdc8:	e1a00003 	mov	r0, r3
8000bdcc:	e24bd00c 	sub	sp, fp, #12
8000bdd0:	e89da800 	ldm	sp, {fp, sp, pc}

8000bdd4 <timer_set_interval>:
8000bdd4:	e1a0c00d 	mov	ip, sp
8000bdd8:	e92dd800 	push	{fp, ip, lr, pc}
8000bddc:	e24cb004 	sub	fp, ip, #4
8000bde0:	e24dd008 	sub	sp, sp, #8
8000bde4:	e50b0010 	str	r0, [fp, #-16]
8000bde8:	e59f3018 	ldr	r3, [pc, #24]	@ 8000be08 <timer_set_interval+0x34>
8000bdec:	e08f3003 	add	r3, pc, r3
8000bdf0:	e51b2010 	ldr	r2, [fp, #-16]
8000bdf4:	e5832000 	str	r2, [r3]
8000bdf8:	eb000003 	bl	8000be0c <timer_clear_interrupt>
8000bdfc:	e320f000 	nop	{0}
8000be00:	e24bd00c 	sub	sp, fp, #12
8000be04:	e89da800 	ldm	sp, {fp, sp, pc}
8000be08:	0004c214 	andeq	ip, r4, r4, lsl r2

8000be0c <timer_clear_interrupt>:
8000be0c:	e1a0c00d 	mov	ip, sp
8000be10:	e92dd800 	push	{fp, ip, lr, pc}
8000be14:	e24cb004 	sub	fp, ip, #4
8000be18:	e24dd008 	sub	sp, sp, #8
8000be1c:	e3a01002 	mov	r1, #2
8000be20:	e59f003c 	ldr	r0, [pc, #60]	@ 8000be64 <timer_clear_interrupt+0x58>
8000be24:	ebffffd1 	bl	8000bd70 <PUT32>
8000be28:	e59f0038 	ldr	r0, [pc, #56]	@ 8000be68 <timer_clear_interrupt+0x5c>
8000be2c:	ebffffdd 	bl	8000bda8 <GET32>
8000be30:	e50b0010 	str	r0, [fp, #-16]
8000be34:	e59f3030 	ldr	r3, [pc, #48]	@ 8000be6c <timer_clear_interrupt+0x60>
8000be38:	e08f3003 	add	r3, pc, r3
8000be3c:	e5933000 	ldr	r3, [r3]
8000be40:	e51b2010 	ldr	r2, [fp, #-16]
8000be44:	e0823003 	add	r3, r2, r3
8000be48:	e50b3010 	str	r3, [fp, #-16]
8000be4c:	e51b1010 	ldr	r1, [fp, #-16]
8000be50:	e59f0018 	ldr	r0, [pc, #24]	@ 8000be70 <timer_clear_interrupt+0x64>
8000be54:	ebffffc5 	bl	8000bd70 <PUT32>
8000be58:	e320f000 	nop	{0}
8000be5c:	e24bd00c 	sub	sp, fp, #12
8000be60:	e89da800 	ldm	sp, {fp, sp, pc}
8000be64:	20003000 	andcs	r3, r0, r0
8000be68:	20003004 	andcs	r3, r0, r4
8000be6c:	0004c1c8 	andeq	ip, r4, r8, asr #3
8000be70:	20003010 	andcs	r3, r0, r0, lsl r0

8000be74 <b16encode>:
8000be74:	e1a0c00d 	mov	ip, sp
8000be78:	e92dd800 	push	{fp, ip, lr, pc}
8000be7c:	e24cb004 	sub	fp, ip, #4
8000be80:	e24dd018 	sub	sp, sp, #24
8000be84:	e50b0018 	str	r0, [fp, #-24]	@ 0xffffffe8
8000be88:	e50b101c 	str	r1, [fp, #-28]	@ 0xffffffe4
8000be8c:	e50b2020 	str	r2, [fp, #-32]	@ 0xffffffe0
8000be90:	e50b3024 	str	r3, [fp, #-36]	@ 0xffffffdc
8000be94:	e3a03000 	mov	r3, #0
8000be98:	e50b3010 	str	r3, [fp, #-16]
8000be9c:	ea00001e 	b	8000bf1c <b16encode+0xa8>
8000bea0:	e51b3010 	ldr	r3, [fp, #-16]
8000bea4:	e51b2018 	ldr	r2, [fp, #-24]	@ 0xffffffe8
8000bea8:	e0823003 	add	r3, r2, r3
8000beac:	e5d33000 	ldrb	r3, [r3]
8000beb0:	e203300f 	and	r3, r3, #15
8000beb4:	e6ef2073 	uxtb	r2, r3
8000beb8:	e51b3010 	ldr	r3, [fp, #-16]
8000bebc:	e1a03083 	lsl	r3, r3, #1
8000bec0:	e1a01003 	mov	r1, r3
8000bec4:	e51b3020 	ldr	r3, [fp, #-32]	@ 0xffffffe0
8000bec8:	e0833001 	add	r3, r3, r1
8000becc:	e2822041 	add	r2, r2, #65	@ 0x41
8000bed0:	e6ef2072 	uxtb	r2, r2
8000bed4:	e5c32000 	strb	r2, [r3]
8000bed8:	e51b3010 	ldr	r3, [fp, #-16]
8000bedc:	e51b2018 	ldr	r2, [fp, #-24]	@ 0xffffffe8
8000bee0:	e0823003 	add	r3, r2, r3
8000bee4:	e5d33000 	ldrb	r3, [r3]
8000bee8:	e1a03223 	lsr	r3, r3, #4
8000beec:	e6ef2073 	uxtb	r2, r3
8000bef0:	e51b3010 	ldr	r3, [fp, #-16]
8000bef4:	e1a03083 	lsl	r3, r3, #1
8000bef8:	e2833001 	add	r3, r3, #1
8000befc:	e51b1020 	ldr	r1, [fp, #-32]	@ 0xffffffe0
8000bf00:	e0813003 	add	r3, r1, r3
8000bf04:	e2822041 	add	r2, r2, #65	@ 0x41
8000bf08:	e6ef2072 	uxtb	r2, r2
8000bf0c:	e5c32000 	strb	r2, [r3]
8000bf10:	e51b3010 	ldr	r3, [fp, #-16]
8000bf14:	e2833001 	add	r3, r3, #1
8000bf18:	e50b3010 	str	r3, [fp, #-16]
8000bf1c:	e51b2010 	ldr	r2, [fp, #-16]
8000bf20:	e51b301c 	ldr	r3, [fp, #-28]	@ 0xffffffe4
8000bf24:	e1520003 	cmp	r2, r3
8000bf28:	baffffdc 	blt	8000bea0 <b16encode+0x2c>
8000bf2c:	e51b301c 	ldr	r3, [fp, #-28]	@ 0xffffffe4
8000bf30:	e1a02083 	lsl	r2, r3, #1
8000bf34:	e51b3024 	ldr	r3, [fp, #-36]	@ 0xffffffdc
8000bf38:	e5832000 	str	r2, [r3]
8000bf3c:	e320f000 	nop	{0}
8000bf40:	e24bd00c 	sub	sp, fp, #12
8000bf44:	e89da800 	ldm	sp, {fp, sp, pc}

8000bf48 <b16decode>:
8000bf48:	e1a0c00d 	mov	ip, sp
8000bf4c:	e92dd800 	push	{fp, ip, lr, pc}
8000bf50:	e24cb004 	sub	fp, ip, #4
8000bf54:	e24dd020 	sub	sp, sp, #32
8000bf58:	e50b0020 	str	r0, [fp, #-32]	@ 0xffffffe0
8000bf5c:	e50b1024 	str	r1, [fp, #-36]	@ 0xffffffdc
8000bf60:	e50b2028 	str	r2, [fp, #-40]	@ 0xffffffd8
8000bf64:	e50b302c 	str	r3, [fp, #-44]	@ 0xffffffd4
8000bf68:	e3a03000 	mov	r3, #0
8000bf6c:	e50b3010 	str	r3, [fp, #-16]
8000bf70:	ea00001f 	b	8000bff4 <b16decode+0xac>
8000bf74:	e51b3010 	ldr	r3, [fp, #-16]
8000bf78:	e1a03083 	lsl	r3, r3, #1
8000bf7c:	e1a02003 	mov	r2, r3
8000bf80:	e51b3020 	ldr	r3, [fp, #-32]	@ 0xffffffe0
8000bf84:	e0833002 	add	r3, r3, r2
8000bf88:	e5d33000 	ldrb	r3, [r3]
8000bf8c:	e2433041 	sub	r3, r3, #65	@ 0x41
8000bf90:	e50b3014 	str	r3, [fp, #-20]	@ 0xffffffec
8000bf94:	e51b3010 	ldr	r3, [fp, #-16]
8000bf98:	e1a03083 	lsl	r3, r3, #1
8000bf9c:	e2833001 	add	r3, r3, #1
8000bfa0:	e51b2020 	ldr	r2, [fp, #-32]	@ 0xffffffe0
8000bfa4:	e0823003 	add	r3, r2, r3
8000bfa8:	e5d33000 	ldrb	r3, [r3]
8000bfac:	e2433041 	sub	r3, r3, #65	@ 0x41
8000bfb0:	e50b3018 	str	r3, [fp, #-24]	@ 0xffffffe8
8000bfb4:	e51b3018 	ldr	r3, [fp, #-24]	@ 0xffffffe8
8000bfb8:	e6af3073 	sxtb	r3, r3
8000bfbc:	e1a03203 	lsl	r3, r3, #4
8000bfc0:	e6af2073 	sxtb	r2, r3
8000bfc4:	e51b3014 	ldr	r3, [fp, #-20]	@ 0xffffffec
8000bfc8:	e6af3073 	sxtb	r3, r3
8000bfcc:	e1823003 	orr	r3, r2, r3
8000bfd0:	e6af1073 	sxtb	r1, r3
8000bfd4:	e51b3010 	ldr	r3, [fp, #-16]
8000bfd8:	e51b2028 	ldr	r2, [fp, #-40]	@ 0xffffffd8
8000bfdc:	e0823003 	add	r3, r2, r3
8000bfe0:	e6ef2071 	uxtb	r2, r1
8000bfe4:	e5c32000 	strb	r2, [r3]
8000bfe8:	e51b3010 	ldr	r3, [fp, #-16]
8000bfec:	e2833001 	add	r3, r3, #1
8000bff0:	e50b3010 	str	r3, [fp, #-16]
8000bff4:	e51b3024 	ldr	r3, [fp, #-36]	@ 0xffffffdc
8000bff8:	e1a02fa3 	lsr	r2, r3, #31
8000bffc:	e0823003 	add	r3, r2, r3
8000c000:	e1a030c3 	asr	r3, r3, #1
8000c004:	e1a02003 	mov	r2, r3
8000c008:	e51b3010 	ldr	r3, [fp, #-16]
8000c00c:	e1530002 	cmp	r3, r2
8000c010:	baffffd7 	blt	8000bf74 <b16decode+0x2c>
8000c014:	e51b3024 	ldr	r3, [fp, #-36]	@ 0xffffffdc
8000c018:	e1a020c3 	asr	r2, r3, #1
8000c01c:	e51b302c 	ldr	r3, [fp, #-44]	@ 0xffffffd4
8000c020:	e5832000 	str	r2, [r3]
8000c024:	e320f000 	nop	{0}
8000c028:	e24bd00c 	sub	sp, fp, #12
8000c02c:	e89da800 	ldm	sp, {fp, sp, pc}

8000c030 <memcpy>:
8000c030:	e1a0c00d 	mov	ip, sp
8000c034:	e92dd800 	push	{fp, ip, lr, pc}
8000c038:	e24cb004 	sub	fp, ip, #4
8000c03c:	e24dd020 	sub	sp, sp, #32
8000c040:	e50b0020 	str	r0, [fp, #-32]	@ 0xffffffe0
8000c044:	e50b1024 	str	r1, [fp, #-36]	@ 0xffffffdc
8000c048:	e50b2028 	str	r2, [fp, #-40]	@ 0xffffffd8
8000c04c:	e51b3020 	ldr	r3, [fp, #-32]	@ 0xffffffe0
8000c050:	e50b3014 	str	r3, [fp, #-20]	@ 0xffffffec
8000c054:	e51b3024 	ldr	r3, [fp, #-36]	@ 0xffffffdc
8000c058:	e50b3018 	str	r3, [fp, #-24]	@ 0xffffffe8
8000c05c:	e3a03000 	mov	r3, #0
8000c060:	e50b3010 	str	r3, [fp, #-16]
8000c064:	e3a03000 	mov	r3, #0
8000c068:	e50b3010 	str	r3, [fp, #-16]
8000c06c:	ea00000a 	b	8000c09c <memcpy+0x6c>
8000c070:	e51b2018 	ldr	r2, [fp, #-24]	@ 0xffffffe8
8000c074:	e51b3010 	ldr	r3, [fp, #-16]
8000c078:	e0822003 	add	r2, r2, r3
8000c07c:	e51b1014 	ldr	r1, [fp, #-20]	@ 0xffffffec
8000c080:	e51b3010 	ldr	r3, [fp, #-16]
8000c084:	e0813003 	add	r3, r1, r3
8000c088:	e5d22000 	ldrb	r2, [r2]
8000c08c:	e5c32000 	strb	r2, [r3]
8000c090:	e51b3010 	ldr	r3, [fp, #-16]
8000c094:	e2833001 	add	r3, r3, #1
8000c098:	e50b3010 	str	r3, [fp, #-16]
8000c09c:	e51b2010 	ldr	r2, [fp, #-16]
8000c0a0:	e51b3028 	ldr	r3, [fp, #-40]	@ 0xffffffd8
8000c0a4:	e1520003 	cmp	r2, r3
8000c0a8:	3afffff0 	bcc	8000c070 <memcpy+0x40>
8000c0ac:	e51b3020 	ldr	r3, [fp, #-32]	@ 0xffffffe0
8000c0b0:	e1a00003 	mov	r0, r3
8000c0b4:	e24bd00c 	sub	sp, fp, #12
8000c0b8:	e89da800 	ldm	sp, {fp, sp, pc}

8000c0bc <strcpy>:
8000c0bc:	e1a0c00d 	mov	ip, sp
8000c0c0:	e92dd800 	push	{fp, ip, lr, pc}
8000c0c4:	e24cb004 	sub	fp, ip, #4
8000c0c8:	e24dd010 	sub	sp, sp, #16
8000c0cc:	e50b0018 	str	r0, [fp, #-24]	@ 0xffffffe8
8000c0d0:	e50b101c 	str	r1, [fp, #-28]	@ 0xffffffe4
8000c0d4:	e51b3018 	ldr	r3, [fp, #-24]	@ 0xffffffe8
8000c0d8:	e50b3010 	str	r3, [fp, #-16]
8000c0dc:	ea000009 	b	8000c108 <strcpy+0x4c>
8000c0e0:	e51b301c 	ldr	r3, [fp, #-28]	@ 0xffffffe4
8000c0e4:	e5d32000 	ldrb	r2, [r3]
8000c0e8:	e51b3018 	ldr	r3, [fp, #-24]	@ 0xffffffe8
8000c0ec:	e5c32000 	strb	r2, [r3]
8000c0f0:	e51b3018 	ldr	r3, [fp, #-24]	@ 0xffffffe8
8000c0f4:	e2833001 	add	r3, r3, #1
8000c0f8:	e50b3018 	str	r3, [fp, #-24]	@ 0xffffffe8
8000c0fc:	e51b301c 	ldr	r3, [fp, #-28]	@ 0xffffffe4
8000c100:	e2833001 	add	r3, r3, #1
8000c104:	e50b301c 	str	r3, [fp, #-28]	@ 0xffffffe4
8000c108:	e51b301c 	ldr	r3, [fp, #-28]	@ 0xffffffe4
8000c10c:	e5d33000 	ldrb	r3, [r3]
8000c110:	e3530000 	cmp	r3, #0
8000c114:	1afffff1 	bne	8000c0e0 <strcpy+0x24>
8000c118:	e51b3018 	ldr	r3, [fp, #-24]	@ 0xffffffe8
8000c11c:	e3a02000 	mov	r2, #0
8000c120:	e5c32000 	strb	r2, [r3]
8000c124:	e51b3010 	ldr	r3, [fp, #-16]
8000c128:	e1a00003 	mov	r0, r3
8000c12c:	e24bd00c 	sub	sp, fp, #12
8000c130:	e89da800 	ldm	sp, {fp, sp, pc}

8000c134 <strlcpy>:
8000c134:	e1a0c00d 	mov	ip, sp
8000c138:	e92dd800 	push	{fp, ip, lr, pc}
8000c13c:	e24cb004 	sub	fp, ip, #4
8000c140:	e24dd018 	sub	sp, sp, #24
8000c144:	e50b0018 	str	r0, [fp, #-24]	@ 0xffffffe8
8000c148:	e50b101c 	str	r1, [fp, #-28]	@ 0xffffffe4
8000c14c:	e50b2020 	str	r2, [fp, #-32]	@ 0xffffffe0
8000c150:	e3a03000 	mov	r3, #0
8000c154:	e50b3014 	str	r3, [fp, #-20]	@ 0xffffffec
8000c158:	e3a03000 	mov	r3, #0
8000c15c:	e50b3010 	str	r3, [fp, #-16]
8000c160:	ea00000a 	b	8000c190 <strlcpy+0x5c>
8000c164:	e51b201c 	ldr	r2, [fp, #-28]	@ 0xffffffe4
8000c168:	e51b3010 	ldr	r3, [fp, #-16]
8000c16c:	e0822003 	add	r2, r2, r3
8000c170:	e51b1018 	ldr	r1, [fp, #-24]	@ 0xffffffe8
8000c174:	e51b3010 	ldr	r3, [fp, #-16]
8000c178:	e0813003 	add	r3, r1, r3
8000c17c:	e5d22000 	ldrb	r2, [r2]
8000c180:	e5c32000 	strb	r2, [r3]
8000c184:	e51b3010 	ldr	r3, [fp, #-16]
8000c188:	e2833001 	add	r3, r3, #1
8000c18c:	e50b3010 	str	r3, [fp, #-16]
8000c190:	e51b3010 	ldr	r3, [fp, #-16]
8000c194:	e2833001 	add	r3, r3, #1
8000c198:	e51b2020 	ldr	r2, [fp, #-32]	@ 0xffffffe0
8000c19c:	e1520003 	cmp	r2, r3
8000c1a0:	9a000005 	bls	8000c1bc <strlcpy+0x88>
8000c1a4:	e51b201c 	ldr	r2, [fp, #-28]	@ 0xffffffe4
8000c1a8:	e51b3010 	ldr	r3, [fp, #-16]
8000c1ac:	e0823003 	add	r3, r2, r3
8000c1b0:	e5d33000 	ldrb	r3, [r3]
8000c1b4:	e3530000 	cmp	r3, #0
8000c1b8:	1affffe9 	bne	8000c164 <strlcpy+0x30>
8000c1bc:	e51b2018 	ldr	r2, [fp, #-24]	@ 0xffffffe8
8000c1c0:	e51b3010 	ldr	r3, [fp, #-16]
8000c1c4:	e0823003 	add	r3, r2, r3
8000c1c8:	e3a02000 	mov	r2, #0
8000c1cc:	e5c32000 	strb	r2, [r3]
8000c1d0:	e51b001c 	ldr	r0, [fp, #-28]	@ 0xffffffe4
8000c1d4:	eb0000ff 	bl	8000c5d8 <strlen>
8000c1d8:	e50b0014 	str	r0, [fp, #-20]	@ 0xffffffec
8000c1dc:	e51b3014 	ldr	r3, [fp, #-20]	@ 0xffffffec
8000c1e0:	e1a00003 	mov	r0, r3
8000c1e4:	e24bd00c 	sub	sp, fp, #12
8000c1e8:	e89da800 	ldm	sp, {fp, sp, pc}

8000c1ec <strcmp>:
8000c1ec:	e1a0c00d 	mov	ip, sp
8000c1f0:	e92dd800 	push	{fp, ip, lr, pc}
8000c1f4:	e24cb004 	sub	fp, ip, #4
8000c1f8:	e24dd008 	sub	sp, sp, #8
8000c1fc:	e50b0010 	str	r0, [fp, #-16]
8000c200:	e50b1014 	str	r1, [fp, #-20]	@ 0xffffffec
8000c204:	ea000005 	b	8000c220 <strcmp+0x34>
8000c208:	e51b3010 	ldr	r3, [fp, #-16]
8000c20c:	e2833001 	add	r3, r3, #1
8000c210:	e50b3010 	str	r3, [fp, #-16]
8000c214:	e51b3014 	ldr	r3, [fp, #-20]	@ 0xffffffec
8000c218:	e2833001 	add	r3, r3, #1
8000c21c:	e50b3014 	str	r3, [fp, #-20]	@ 0xffffffec
8000c220:	e51b3010 	ldr	r3, [fp, #-16]
8000c224:	e5d32000 	ldrb	r2, [r3]
8000c228:	e51b3014 	ldr	r3, [fp, #-20]	@ 0xffffffec
8000c22c:	e5d33000 	ldrb	r3, [r3]
8000c230:	e1520003 	cmp	r2, r3
8000c234:	1a000007 	bne	8000c258 <strcmp+0x6c>
8000c238:	e51b3010 	ldr	r3, [fp, #-16]
8000c23c:	e5d33000 	ldrb	r3, [r3]
8000c240:	e3530000 	cmp	r3, #0
8000c244:	0a000003 	beq	8000c258 <strcmp+0x6c>
8000c248:	e51b3014 	ldr	r3, [fp, #-20]	@ 0xffffffec
8000c24c:	e5d33000 	ldrb	r3, [r3]
8000c250:	e3530000 	cmp	r3, #0
8000c254:	1affffeb 	bne	8000c208 <strcmp+0x1c>
8000c258:	e51b3010 	ldr	r3, [fp, #-16]
8000c25c:	e5d33000 	ldrb	r3, [r3]
8000c260:	e1a02003 	mov	r2, r3
8000c264:	e51b3014 	ldr	r3, [fp, #-20]	@ 0xffffffec
8000c268:	e5d33000 	ldrb	r3, [r3]
8000c26c:	e0423003 	sub	r3, r2, r3
8000c270:	e1a00003 	mov	r0, r3
8000c274:	e24bd00c 	sub	sp, fp, #12
8000c278:	e89da800 	ldm	sp, {fp, sp, pc}

8000c27c <strncmp>:
8000c27c:	e1a0c00d 	mov	ip, sp
8000c280:	e92dd800 	push	{fp, ip, lr, pc}
8000c284:	e24cb004 	sub	fp, ip, #4
8000c288:	e24dd018 	sub	sp, sp, #24
8000c28c:	e50b0018 	str	r0, [fp, #-24]	@ 0xffffffe8
8000c290:	e50b101c 	str	r1, [fp, #-28]	@ 0xffffffe4
8000c294:	e50b2020 	str	r2, [fp, #-32]	@ 0xffffffe0
8000c298:	e3a03000 	mov	r3, #0
8000c29c:	e50b3010 	str	r3, [fp, #-16]
8000c2a0:	e51b3020 	ldr	r3, [fp, #-32]	@ 0xffffffe0
8000c2a4:	e3530000 	cmp	r3, #0
8000c2a8:	1a00000a 	bne	8000c2d8 <strncmp+0x5c>
8000c2ac:	e3a03000 	mov	r3, #0
8000c2b0:	ea000021 	b	8000c33c <strncmp+0xc0>
8000c2b4:	e51b3018 	ldr	r3, [fp, #-24]	@ 0xffffffe8
8000c2b8:	e2833001 	add	r3, r3, #1
8000c2bc:	e50b3018 	str	r3, [fp, #-24]	@ 0xffffffe8
8000c2c0:	e51b301c 	ldr	r3, [fp, #-28]	@ 0xffffffe4
8000c2c4:	e2833001 	add	r3, r3, #1
8000c2c8:	e50b301c 	str	r3, [fp, #-28]	@ 0xffffffe4
8000c2cc:	e51b3010 	ldr	r3, [fp, #-16]
8000c2d0:	e2833001 	add	r3, r3, #1
8000c2d4:	e50b3010 	str	r3, [fp, #-16]
8000c2d8:	e51b3018 	ldr	r3, [fp, #-24]	@ 0xffffffe8
8000c2dc:	e5d32000 	ldrb	r2, [r3]
8000c2e0:	e51b301c 	ldr	r3, [fp, #-28]	@ 0xffffffe4
8000c2e4:	e5d33000 	ldrb	r3, [r3]
8000c2e8:	e1520003 	cmp	r2, r3
8000c2ec:	1a00000c 	bne	8000c324 <strncmp+0xa8>
8000c2f0:	e51b3018 	ldr	r3, [fp, #-24]	@ 0xffffffe8
8000c2f4:	e5d33000 	ldrb	r3, [r3]
8000c2f8:	e3530000 	cmp	r3, #0
8000c2fc:	0a000008 	beq	8000c324 <strncmp+0xa8>
8000c300:	e51b301c 	ldr	r3, [fp, #-28]	@ 0xffffffe4
8000c304:	e5d33000 	ldrb	r3, [r3]
8000c308:	e3530000 	cmp	r3, #0
8000c30c:	0a000004 	beq	8000c324 <strncmp+0xa8>
8000c310:	e51b3020 	ldr	r3, [fp, #-32]	@ 0xffffffe0
8000c314:	e2433001 	sub	r3, r3, #1
8000c318:	e51b2010 	ldr	r2, [fp, #-16]
8000c31c:	e1520003 	cmp	r2, r3
8000c320:	3affffe3 	bcc	8000c2b4 <strncmp+0x38>
8000c324:	e51b3018 	ldr	r3, [fp, #-24]	@ 0xffffffe8
8000c328:	e5d33000 	ldrb	r3, [r3]
8000c32c:	e1a02003 	mov	r2, r3
8000c330:	e51b301c 	ldr	r3, [fp, #-28]	@ 0xffffffe4
8000c334:	e5d33000 	ldrb	r3, [r3]
8000c338:	e0423003 	sub	r3, r2, r3
8000c33c:	e1a00003 	mov	r0, r3
8000c340:	e24bd00c 	sub	sp, fp, #12
8000c344:	e89da800 	ldm	sp, {fp, sp, pc}

8000c348 <strchr>:
8000c348:	e1a0c00d 	mov	ip, sp
8000c34c:	e92dd800 	push	{fp, ip, lr, pc}
8000c350:	e24cb004 	sub	fp, ip, #4
8000c354:	e24dd008 	sub	sp, sp, #8
8000c358:	e50b0010 	str	r0, [fp, #-16]
8000c35c:	e50b1014 	str	r1, [fp, #-20]	@ 0xffffffec
8000c360:	ea000002 	b	8000c370 <strchr+0x28>
8000c364:	e51b3010 	ldr	r3, [fp, #-16]
8000c368:	e2833001 	add	r3, r3, #1
8000c36c:	e50b3010 	str	r3, [fp, #-16]
8000c370:	e51b3010 	ldr	r3, [fp, #-16]
8000c374:	e5d33000 	ldrb	r3, [r3]
8000c378:	e3530000 	cmp	r3, #0
8000c37c:	0a000005 	beq	8000c398 <strchr+0x50>
8000c380:	e51b3010 	ldr	r3, [fp, #-16]
8000c384:	e5d33000 	ldrb	r3, [r3]
8000c388:	e1a02003 	mov	r2, r3
8000c38c:	e51b3014 	ldr	r3, [fp, #-20]	@ 0xffffffec
8000c390:	e1530002 	cmp	r3, r2
8000c394:	1afffff2 	bne	8000c364 <strchr+0x1c>
8000c398:	e51b3010 	ldr	r3, [fp, #-16]
8000c39c:	e5d33000 	ldrb	r3, [r3]
8000c3a0:	e1a02003 	mov	r2, r3
8000c3a4:	e51b3014 	ldr	r3, [fp, #-20]	@ 0xffffffec
8000c3a8:	e1530002 	cmp	r3, r2
8000c3ac:	1a000001 	bne	8000c3b8 <strchr+0x70>
8000c3b0:	e51b3010 	ldr	r3, [fp, #-16]
8000c3b4:	ea000000 	b	8000c3bc <strchr+0x74>
8000c3b8:	e3a03000 	mov	r3, #0
8000c3bc:	e1a00003 	mov	r0, r3
8000c3c0:	e24bd00c 	sub	sp, fp, #12
8000c3c4:	e89da800 	ldm	sp, {fp, sp, pc}

8000c3c8 <strtok>:
8000c3c8:	e1a0c00d 	mov	ip, sp
8000c3cc:	e92dd800 	push	{fp, ip, lr, pc}
8000c3d0:	e24cb004 	sub	fp, ip, #4
8000c3d4:	e24dd010 	sub	sp, sp, #16
8000c3d8:	e50b0018 	str	r0, [fp, #-24]	@ 0xffffffe8
8000c3dc:	e50b101c 	str	r1, [fp, #-28]	@ 0xffffffe4
8000c3e0:	e3a03000 	mov	r3, #0
8000c3e4:	e50b3010 	str	r3, [fp, #-16]
8000c3e8:	e51b3018 	ldr	r3, [fp, #-24]	@ 0xffffffe8
8000c3ec:	e3530000 	cmp	r3, #0
8000c3f0:	0a000003 	beq	8000c404 <strtok+0x3c>
8000c3f4:	e59f3134 	ldr	r3, [pc, #308]	@ 8000c530 <strtok+0x168>
8000c3f8:	e08f3003 	add	r3, pc, r3
8000c3fc:	e51b2018 	ldr	r2, [fp, #-24]	@ 0xffffffe8
8000c400:	e5832000 	str	r2, [r3]
8000c404:	e59f3128 	ldr	r3, [pc, #296]	@ 8000c534 <strtok+0x16c>
8000c408:	e08f3003 	add	r3, pc, r3
8000c40c:	e5933000 	ldr	r3, [r3]
8000c410:	e50b3010 	str	r3, [fp, #-16]
8000c414:	ea000002 	b	8000c424 <strtok+0x5c>
8000c418:	e51b3010 	ldr	r3, [fp, #-16]
8000c41c:	e2833001 	add	r3, r3, #1
8000c420:	e50b3010 	str	r3, [fp, #-16]
8000c424:	e51b3010 	ldr	r3, [fp, #-16]
8000c428:	e5d33000 	ldrb	r3, [r3]
8000c42c:	e3530000 	cmp	r3, #0
8000c430:	0a000007 	beq	8000c454 <strtok+0x8c>
8000c434:	e51b3010 	ldr	r3, [fp, #-16]
8000c438:	e5d33000 	ldrb	r3, [r3]
8000c43c:	e1a01003 	mov	r1, r3
8000c440:	e51b001c 	ldr	r0, [fp, #-28]	@ 0xffffffe4
8000c444:	ebffffbf 	bl	8000c348 <strchr>
8000c448:	e1a03000 	mov	r3, r0
8000c44c:	e3530000 	cmp	r3, #0
8000c450:	1afffff0 	bne	8000c418 <strtok+0x50>
8000c454:	e51b3010 	ldr	r3, [fp, #-16]
8000c458:	e5d33000 	ldrb	r3, [r3]
8000c45c:	e3530000 	cmp	r3, #0
8000c460:	1a00000c 	bne	8000c498 <strtok+0xd0>
8000c464:	e59f30cc 	ldr	r3, [pc, #204]	@ 8000c538 <strtok+0x170>
8000c468:	e08f3003 	add	r3, pc, r3
8000c46c:	e3a02000 	mov	r2, #0
8000c470:	e5832000 	str	r2, [r3]
8000c474:	e3a03000 	mov	r3, #0
8000c478:	ea000029 	b	8000c524 <strtok+0x15c>
8000c47c:	e59f30b8 	ldr	r3, [pc, #184]	@ 8000c53c <strtok+0x174>
8000c480:	e08f3003 	add	r3, pc, r3
8000c484:	e5933000 	ldr	r3, [r3]
8000c488:	e2832001 	add	r2, r3, #1
8000c48c:	e59f30ac 	ldr	r3, [pc, #172]	@ 8000c540 <strtok+0x178>
8000c490:	e08f3003 	add	r3, pc, r3
8000c494:	e5832000 	str	r2, [r3]
8000c498:	e59f30a4 	ldr	r3, [pc, #164]	@ 8000c544 <strtok+0x17c>
8000c49c:	e08f3003 	add	r3, pc, r3
8000c4a0:	e5933000 	ldr	r3, [r3]
8000c4a4:	e5d33000 	ldrb	r3, [r3]
8000c4a8:	e3530000 	cmp	r3, #0
8000c4ac:	0a000009 	beq	8000c4d8 <strtok+0x110>
8000c4b0:	e59f3090 	ldr	r3, [pc, #144]	@ 8000c548 <strtok+0x180>
8000c4b4:	e08f3003 	add	r3, pc, r3
8000c4b8:	e5933000 	ldr	r3, [r3]
8000c4bc:	e5d33000 	ldrb	r3, [r3]
8000c4c0:	e1a01003 	mov	r1, r3
8000c4c4:	e51b001c 	ldr	r0, [fp, #-28]	@ 0xffffffe4
8000c4c8:	ebffff9e 	bl	8000c348 <strchr>
8000c4cc:	e1a03000 	mov	r3, r0
8000c4d0:	e3530000 	cmp	r3, #0
8000c4d4:	0affffe8 	beq	8000c47c <strtok+0xb4>
8000c4d8:	e59f306c 	ldr	r3, [pc, #108]	@ 8000c54c <strtok+0x184>
8000c4dc:	e08f3003 	add	r3, pc, r3
8000c4e0:	e5933000 	ldr	r3, [r3]
8000c4e4:	e5d33000 	ldrb	r3, [r3]
8000c4e8:	e3530000 	cmp	r3, #0
8000c4ec:	0a00000b 	beq	8000c520 <strtok+0x158>
8000c4f0:	e59f3058 	ldr	r3, [pc, #88]	@ 8000c550 <strtok+0x188>
8000c4f4:	e08f3003 	add	r3, pc, r3
8000c4f8:	e5933000 	ldr	r3, [r3]
8000c4fc:	e3a02000 	mov	r2, #0
8000c500:	e5c32000 	strb	r2, [r3]
8000c504:	e59f3048 	ldr	r3, [pc, #72]	@ 8000c554 <strtok+0x18c>
8000c508:	e08f3003 	add	r3, pc, r3
8000c50c:	e5933000 	ldr	r3, [r3]
8000c510:	e2832001 	add	r2, r3, #1
8000c514:	e59f303c 	ldr	r3, [pc, #60]	@ 8000c558 <strtok+0x190>
8000c518:	e08f3003 	add	r3, pc, r3
8000c51c:	e5832000 	str	r2, [r3]
8000c520:	e51b3010 	ldr	r3, [fp, #-16]
8000c524:	e1a00003 	mov	r0, r3
8000c528:	e24bd00c 	sub	sp, fp, #12
8000c52c:	e89da800 	ldm	sp, {fp, sp, pc}
8000c530:	0004bc0c 	andeq	fp, r4, ip, lsl #24
8000c534:	0004bbfc 	strdeq	fp, [r4], -ip
8000c538:	0004bb9c 	muleq	r4, ip, fp
8000c53c:	0004bb84 	andeq	fp, r4, r4, lsl #23
8000c540:	0004bb74 	andeq	fp, r4, r4, ror fp
8000c544:	0004bb68 	andeq	fp, r4, r8, ror #22
8000c548:	0004bb50 	andeq	fp, r4, r0, asr fp
8000c54c:	0004bb28 	andeq	fp, r4, r8, lsr #22
8000c550:	0004bb10 	andeq	fp, r4, r0, lsl fp
8000c554:	0004bafc 	strdeq	fp, [r4], -ip
8000c558:	0004baec 	andeq	fp, r4, ip, ror #21

8000c55c <memset>:
8000c55c:	e1a0c00d 	mov	ip, sp
8000c560:	e92dd800 	push	{fp, ip, lr, pc}
8000c564:	e24cb004 	sub	fp, ip, #4
8000c568:	e24dd018 	sub	sp, sp, #24
8000c56c:	e50b0018 	str	r0, [fp, #-24]	@ 0xffffffe8
8000c570:	e50b101c 	str	r1, [fp, #-28]	@ 0xffffffe4
8000c574:	e50b2020 	str	r2, [fp, #-32]	@ 0xffffffe0
8000c578:	e51b3018 	ldr	r3, [fp, #-24]	@ 0xffffffe8
8000c57c:	e50b3014 	str	r3, [fp, #-20]	@ 0xffffffec
8000c580:	e3a03000 	mov	r3, #0
8000c584:	e50b3010 	str	r3, [fp, #-16]
8000c588:	e3a03000 	mov	r3, #0
8000c58c:	e50b3010 	str	r3, [fp, #-16]
8000c590:	ea000008 	b	8000c5b8 <memset+0x5c>
8000c594:	e51b2014 	ldr	r2, [fp, #-20]	@ 0xffffffec
8000c598:	e51b3010 	ldr	r3, [fp, #-16]
8000c59c:	e0823003 	add	r3, r2, r3
8000c5a0:	e51b201c 	ldr	r2, [fp, #-28]	@ 0xffffffe4
8000c5a4:	e6ef2072 	uxtb	r2, r2
8000c5a8:	e5c32000 	strb	r2, [r3]
8000c5ac:	e51b3010 	ldr	r3, [fp, #-16]
8000c5b0:	e2833001 	add	r3, r3, #1
8000c5b4:	e50b3010 	str	r3, [fp, #-16]
8000c5b8:	e51b2010 	ldr	r2, [fp, #-16]
8000c5bc:	e51b3020 	ldr	r3, [fp, #-32]	@ 0xffffffe0
8000c5c0:	e1520003 	cmp	r2, r3
8000c5c4:	3afffff2 	bcc	8000c594 <memset+0x38>
8000c5c8:	e51b3018 	ldr	r3, [fp, #-24]	@ 0xffffffe8
8000c5cc:	e1a00003 	mov	r0, r3
8000c5d0:	e24bd00c 	sub	sp, fp, #12
8000c5d4:	e89da800 	ldm	sp, {fp, sp, pc}

8000c5d8 <strlen>:
8000c5d8:	e1a0c00d 	mov	ip, sp
8000c5dc:	e92dd800 	push	{fp, ip, lr, pc}
8000c5e0:	e24cb004 	sub	fp, ip, #4
8000c5e4:	e24dd010 	sub	sp, sp, #16
8000c5e8:	e50b0018 	str	r0, [fp, #-24]	@ 0xffffffe8
8000c5ec:	e3a03000 	mov	r3, #0
8000c5f0:	e50b3010 	str	r3, [fp, #-16]
8000c5f4:	ea000005 	b	8000c610 <strlen+0x38>
8000c5f8:	e51b3018 	ldr	r3, [fp, #-24]	@ 0xffffffe8
8000c5fc:	e2833001 	add	r3, r3, #1
8000c600:	e50b3018 	str	r3, [fp, #-24]	@ 0xffffffe8
8000c604:	e51b3010 	ldr	r3, [fp, #-16]
8000c608:	e2833001 	add	r3, r3, #1
8000c60c:	e50b3010 	str	r3, [fp, #-16]
8000c610:	e51b3018 	ldr	r3, [fp, #-24]	@ 0xffffffe8
8000c614:	e5d33000 	ldrb	r3, [r3]
8000c618:	e3530000 	cmp	r3, #0
8000c61c:	1afffff5 	bne	8000c5f8 <strlen+0x20>
8000c620:	e51b3010 	ldr	r3, [fp, #-16]
8000c624:	e1a00003 	mov	r0, r3
8000c628:	e24bd00c 	sub	sp, fp, #12
8000c62c:	e89da800 	ldm	sp, {fp, sp, pc}

8000c630 <gets_base>:
8000c630:	e1a0c00d 	mov	ip, sp
8000c634:	e92dd800 	push	{fp, ip, lr, pc}
8000c638:	e24cb004 	sub	fp, ip, #4
8000c63c:	e24dd018 	sub	sp, sp, #24
8000c640:	e50b0018 	str	r0, [fp, #-24]	@ 0xffffffe8
8000c644:	e50b101c 	str	r1, [fp, #-28]	@ 0xffffffe4
8000c648:	e50b2020 	str	r2, [fp, #-32]	@ 0xffffffe0
8000c64c:	e3a03000 	mov	r3, #0
8000c650:	e50b3010 	str	r3, [fp, #-16]
8000c654:	e3a03000 	mov	r3, #0
8000c658:	e50b3014 	str	r3, [fp, #-20]	@ 0xffffffec
8000c65c:	ea000033 	b	8000c730 <gets_base+0x100>
8000c660:	e51b3018 	ldr	r3, [fp, #-24]	@ 0xffffffe8
8000c664:	e12fff33 	blx	r3
8000c668:	e50b0014 	str	r0, [fp, #-20]	@ 0xffffffec
8000c66c:	e51b3014 	ldr	r3, [fp, #-20]	@ 0xffffffec
8000c670:	e3530000 	cmp	r3, #0
8000c674:	0a00002c 	beq	8000c72c <gets_base+0xfc>
8000c678:	e51b3014 	ldr	r3, [fp, #-20]	@ 0xffffffec
8000c67c:	e353000d 	cmp	r3, #13
8000c680:	0a000030 	beq	8000c748 <gets_base+0x118>
8000c684:	e51b3014 	ldr	r3, [fp, #-20]	@ 0xffffffec
8000c688:	e353000a 	cmp	r3, #10
8000c68c:	0a00002d 	beq	8000c748 <gets_base+0x118>
8000c690:	e51b3014 	ldr	r3, [fp, #-20]	@ 0xffffffec
8000c694:	e59f20dc 	ldr	r2, [pc, #220]	@ 8000c778 <gets_base+0x148>
8000c698:	e1530002 	cmp	r3, r2
8000c69c:	1a00000f 	bne	8000c6e0 <gets_base+0xb0>
8000c6a0:	e51b3010 	ldr	r3, [fp, #-16]
8000c6a4:	e3530000 	cmp	r3, #0
8000c6a8:	0a000020 	beq	8000c730 <gets_base+0x100>
8000c6ac:	e51b301c 	ldr	r3, [fp, #-28]	@ 0xffffffe4
8000c6b0:	e59f00c4 	ldr	r0, [pc, #196]	@ 8000c77c <gets_base+0x14c>
8000c6b4:	e12fff33 	blx	r3
8000c6b8:	e51b301c 	ldr	r3, [fp, #-28]	@ 0xffffffe4
8000c6bc:	e3a00020 	mov	r0, #32
8000c6c0:	e12fff33 	blx	r3
8000c6c4:	e51b301c 	ldr	r3, [fp, #-28]	@ 0xffffffe4
8000c6c8:	e59f00ac 	ldr	r0, [pc, #172]	@ 8000c77c <gets_base+0x14c>
8000c6cc:	e12fff33 	blx	r3
8000c6d0:	e51b3010 	ldr	r3, [fp, #-16]
8000c6d4:	e2433001 	sub	r3, r3, #1
8000c6d8:	e50b3010 	str	r3, [fp, #-16]
8000c6dc:	ea000013 	b	8000c730 <gets_base+0x100>
8000c6e0:	e51b3014 	ldr	r3, [fp, #-20]	@ 0xffffffec
8000c6e4:	e353001f 	cmp	r3, #31
8000c6e8:	da000010 	ble	8000c730 <gets_base+0x100>
8000c6ec:	e51b3014 	ldr	r3, [fp, #-20]	@ 0xffffffec
8000c6f0:	e353007f 	cmp	r3, #127	@ 0x7f
8000c6f4:	ca00000d 	bgt	8000c730 <gets_base+0x100>
8000c6f8:	e51b301c 	ldr	r3, [fp, #-28]	@ 0xffffffe4
8000c6fc:	e51b0014 	ldr	r0, [fp, #-20]	@ 0xffffffec
8000c700:	e12fff33 	blx	r3
8000c704:	e51b3010 	ldr	r3, [fp, #-16]
8000c708:	e51b2020 	ldr	r2, [fp, #-32]	@ 0xffffffe0
8000c70c:	e0823003 	add	r3, r2, r3
8000c710:	e51b2014 	ldr	r2, [fp, #-20]	@ 0xffffffec
8000c714:	e6ef2072 	uxtb	r2, r2
8000c718:	e5c32000 	strb	r2, [r3]
8000c71c:	e51b3010 	ldr	r3, [fp, #-16]
8000c720:	e2833001 	add	r3, r3, #1
8000c724:	e50b3010 	str	r3, [fp, #-16]
8000c728:	ea000000 	b	8000c730 <gets_base+0x100>
8000c72c:	e320f000 	nop	{0}
8000c730:	e51b3014 	ldr	r3, [fp, #-20]	@ 0xffffffec
8000c734:	e353000d 	cmp	r3, #13
8000c738:	0a000002 	beq	8000c748 <gets_base+0x118>
8000c73c:	e51b3014 	ldr	r3, [fp, #-20]	@ 0xffffffec
8000c740:	e353000a 	cmp	r3, #10
8000c744:	1affffc5 	bne	8000c660 <gets_base+0x30>
8000c748:	e51b301c 	ldr	r3, [fp, #-28]	@ 0xffffffe4
8000c74c:	e3a0000a 	mov	r0, #10
8000c750:	e12fff33 	blx	r3
8000c754:	e51b3010 	ldr	r3, [fp, #-16]
8000c758:	e51b2020 	ldr	r2, [fp, #-32]	@ 0xffffffe0
8000c75c:	e0823003 	add	r3, r2, r3
8000c760:	e3a02000 	mov	r2, #0
8000c764:	e5c32000 	strb	r2, [r3]
8000c768:	e51b3020 	ldr	r3, [fp, #-32]	@ 0xffffffe0
8000c76c:	e1a00003 	mov	r0, r3
8000c770:	e24bd00c 	sub	sp, fp, #12
8000c774:	e89da800 	ldm	sp, {fp, sp, pc}
8000c778:	00001005 	andeq	r1, r0, r5
8000c77c:	00001004 	andeq	r1, r0, r4

8000c780 <printf_base>:
8000c780:	e1a0c00d 	mov	ip, sp
8000c784:	e92d000e 	push	{r1, r2, r3}
8000c788:	e92dd800 	push	{fp, ip, lr, pc}
8000c78c:	e24cb010 	sub	fp, ip, #16
8000c790:	e24ddf47 	sub	sp, sp, #284	@ 0x11c
8000c794:	e50b0124 	str	r0, [fp, #-292]	@ 0xfffffedc
8000c798:	e3a03000 	mov	r3, #0
8000c79c:	e50b3018 	str	r3, [fp, #-24]	@ 0xffffffe8
8000c7a0:	e3a03000 	mov	r3, #0
8000c7a4:	e50b3014 	str	r3, [fp, #-20]	@ 0xffffffec
8000c7a8:	e28b3008 	add	r3, fp, #8
8000c7ac:	e50b311c 	str	r3, [fp, #-284]	@ 0xfffffee4
8000c7b0:	e24b3f46 	sub	r3, fp, #280	@ 0x118
8000c7b4:	e51b211c 	ldr	r2, [fp, #-284]	@ 0xfffffee4
8000c7b8:	e59b1004 	ldr	r1, [fp, #4]
8000c7bc:	e1a00003 	mov	r0, r3
8000c7c0:	eb000016 	bl	8000c820 <vsprintf>
8000c7c4:	e50b0018 	str	r0, [fp, #-24]	@ 0xffffffe8
8000c7c8:	ea00000a 	b	8000c7f8 <printf_base+0x78>
8000c7cc:	e24b2f46 	sub	r2, fp, #280	@ 0x118
8000c7d0:	e51b3014 	ldr	r3, [fp, #-20]	@ 0xffffffec
8000c7d4:	e0823003 	add	r3, r2, r3
8000c7d8:	e5d33000 	ldrb	r3, [r3]
8000c7dc:	e1a02003 	mov	r2, r3
8000c7e0:	e51b3124 	ldr	r3, [fp, #-292]	@ 0xfffffedc
8000c7e4:	e1a00002 	mov	r0, r2
8000c7e8:	e12fff33 	blx	r3
8000c7ec:	e51b3014 	ldr	r3, [fp, #-20]	@ 0xffffffec
8000c7f0:	e2833001 	add	r3, r3, #1
8000c7f4:	e50b3014 	str	r3, [fp, #-20]	@ 0xffffffec
8000c7f8:	e24b2f46 	sub	r2, fp, #280	@ 0x118
8000c7fc:	e51b3014 	ldr	r3, [fp, #-20]	@ 0xffffffec
8000c800:	e0823003 	add	r3, r2, r3
8000c804:	e5d33000 	ldrb	r3, [r3]
8000c808:	e3530000 	cmp	r3, #0
8000c80c:	1affffee 	bne	8000c7cc <printf_base+0x4c>
8000c810:	e51b3018 	ldr	r3, [fp, #-24]	@ 0xffffffe8
8000c814:	e1a00003 	mov	r0, r3
8000c818:	e24bd00c 	sub	sp, fp, #12
8000c81c:	e89da800 	ldm	sp, {fp, sp, pc}

8000c820 <vsprintf>:
8000c820:	e1a0c00d 	mov	ip, sp
8000c824:	e92dd800 	push	{fp, ip, lr, pc}
8000c828:	e24cb004 	sub	fp, ip, #4
8000c82c:	e24dd030 	sub	sp, sp, #48	@ 0x30
8000c830:	e50b0030 	str	r0, [fp, #-48]	@ 0xffffffd0
8000c834:	e50b1034 	str	r1, [fp, #-52]	@ 0xffffffcc
8000c838:	e50b2038 	str	r2, [fp, #-56]	@ 0xffffffc8
8000c83c:	e3a03000 	mov	r3, #0
8000c840:	e50b3010 	str	r3, [fp, #-16]
8000c844:	e3a03000 	mov	r3, #0
8000c848:	e50b3014 	str	r3, [fp, #-20]	@ 0xffffffec
8000c84c:	ea000096 	b	8000caac <vsprintf+0x28c>
8000c850:	e3a03000 	mov	r3, #0
8000c854:	e54b3015 	strb	r3, [fp, #-21]	@ 0xffffffeb
8000c858:	ea00000d 	b	8000c894 <vsprintf+0x74>
8000c85c:	e51b3010 	ldr	r3, [fp, #-16]
8000c860:	e51b2034 	ldr	r2, [fp, #-52]	@ 0xffffffcc
8000c864:	e0822003 	add	r2, r2, r3
8000c868:	e51b3014 	ldr	r3, [fp, #-20]	@ 0xffffffec
8000c86c:	e51b1030 	ldr	r1, [fp, #-48]	@ 0xffffffd0
8000c870:	e0813003 	add	r3, r1, r3
8000c874:	e5d22000 	ldrb	r2, [r2]
8000c878:	e5c32000 	strb	r2, [r3]
8000c87c:	e51b3014 	ldr	r3, [fp, #-20]	@ 0xffffffec
8000c880:	e2833001 	add	r3, r3, #1
8000c884:	e50b3014 	str	r3, [fp, #-20]	@ 0xffffffec
8000c888:	e51b3010 	ldr	r3, [fp, #-16]
8000c88c:	e2833001 	add	r3, r3, #1
8000c890:	e50b3010 	str	r3, [fp, #-16]
8000c894:	e51b3010 	ldr	r3, [fp, #-16]
8000c898:	e51b2034 	ldr	r2, [fp, #-52]	@ 0xffffffcc
8000c89c:	e0823003 	add	r3, r2, r3
8000c8a0:	e5d33000 	ldrb	r3, [r3]
8000c8a4:	e3530025 	cmp	r3, #37	@ 0x25
8000c8a8:	0a000005 	beq	8000c8c4 <vsprintf+0xa4>
8000c8ac:	e51b3010 	ldr	r3, [fp, #-16]
8000c8b0:	e51b2034 	ldr	r2, [fp, #-52]	@ 0xffffffcc
8000c8b4:	e0823003 	add	r3, r2, r3
8000c8b8:	e5d33000 	ldrb	r3, [r3]
8000c8bc:	e3530000 	cmp	r3, #0
8000c8c0:	1affffe5 	bne	8000c85c <vsprintf+0x3c>
8000c8c4:	e51b3010 	ldr	r3, [fp, #-16]
8000c8c8:	e51b2034 	ldr	r2, [fp, #-52]	@ 0xffffffcc
8000c8cc:	e0823003 	add	r3, r2, r3
8000c8d0:	e5d33000 	ldrb	r3, [r3]
8000c8d4:	e3530000 	cmp	r3, #0
8000c8d8:	0a000079 	beq	8000cac4 <vsprintf+0x2a4>
8000c8dc:	e51b3010 	ldr	r3, [fp, #-16]
8000c8e0:	e2833001 	add	r3, r3, #1
8000c8e4:	e51b2034 	ldr	r2, [fp, #-52]	@ 0xffffffcc
8000c8e8:	e0823003 	add	r3, r2, r3
8000c8ec:	e5d33000 	ldrb	r3, [r3]
8000c8f0:	e3530000 	cmp	r3, #0
8000c8f4:	0a000072 	beq	8000cac4 <vsprintf+0x2a4>
8000c8f8:	e51b3010 	ldr	r3, [fp, #-16]
8000c8fc:	e2833001 	add	r3, r3, #1
8000c900:	e51b2034 	ldr	r2, [fp, #-52]	@ 0xffffffcc
8000c904:	e0823003 	add	r3, r2, r3
8000c908:	e5d33000 	ldrb	r3, [r3]
8000c90c:	e54b3015 	strb	r3, [fp, #-21]	@ 0xffffffeb
8000c910:	e55b3015 	ldrb	r3, [fp, #-21]	@ 0xffffffeb
8000c914:	e2433063 	sub	r3, r3, #99	@ 0x63
8000c918:	e59f21c8 	ldr	r2, [pc, #456]	@ 8000cae8 <vsprintf+0x2c8>
8000c91c:	e08f2002 	add	r2, pc, r2
8000c920:	e3530015 	cmp	r3, #21
8000c924:	8a00005d 	bhi	8000caa0 <vsprintf+0x280>
8000c928:	e7923103 	ldr	r3, [r2, r3, lsl #2]
8000c92c:	e08ff003 	add	pc, pc, r3
8000c930:	e320f000 	nop	{0}
8000c934:	e51b3038 	ldr	r3, [fp, #-56]	@ 0xffffffc8
8000c938:	e2832004 	add	r2, r3, #4
8000c93c:	e50b2038 	str	r2, [fp, #-56]	@ 0xffffffc8
8000c940:	e5933000 	ldr	r3, [r3]
8000c944:	e50b3024 	str	r3, [fp, #-36]	@ 0xffffffdc
8000c948:	e51b3014 	ldr	r3, [fp, #-20]	@ 0xffffffec
8000c94c:	e51b2030 	ldr	r2, [fp, #-48]	@ 0xffffffd0
8000c950:	e0823003 	add	r3, r2, r3
8000c954:	e51b1024 	ldr	r1, [fp, #-36]	@ 0xffffffdc
8000c958:	e1a00003 	mov	r0, r3
8000c95c:	eb000063 	bl	8000caf0 <print_string>
8000c960:	e1a02000 	mov	r2, r0
8000c964:	e51b3014 	ldr	r3, [fp, #-20]	@ 0xffffffec
8000c968:	e0833002 	add	r3, r3, r2
8000c96c:	e50b3014 	str	r3, [fp, #-20]	@ 0xffffffec
8000c970:	ea00004a 	b	8000caa0 <vsprintf+0x280>
8000c974:	e51b3038 	ldr	r3, [fp, #-56]	@ 0xffffffc8
8000c978:	e2832004 	add	r2, r3, #4
8000c97c:	e50b2038 	str	r2, [fp, #-56]	@ 0xffffffc8
8000c980:	e5931000 	ldr	r1, [r3]
8000c984:	e51b3014 	ldr	r3, [fp, #-20]	@ 0xffffffec
8000c988:	e51b2030 	ldr	r2, [fp, #-48]	@ 0xffffffd0
8000c98c:	e0823003 	add	r3, r2, r3
8000c990:	e6ef2071 	uxtb	r2, r1
8000c994:	e5c32000 	strb	r2, [r3]
8000c998:	e51b3014 	ldr	r3, [fp, #-20]	@ 0xffffffec
8000c99c:	e2833001 	add	r3, r3, #1
8000c9a0:	e50b3014 	str	r3, [fp, #-20]	@ 0xffffffec
8000c9a4:	ea00003d 	b	8000caa0 <vsprintf+0x280>
8000c9a8:	e51b3038 	ldr	r3, [fp, #-56]	@ 0xffffffc8
8000c9ac:	e2832004 	add	r2, r3, #4
8000c9b0:	e50b2038 	str	r2, [fp, #-56]	@ 0xffffffc8
8000c9b4:	e5933000 	ldr	r3, [r3]
8000c9b8:	e50b3028 	str	r3, [fp, #-40]	@ 0xffffffd8
8000c9bc:	e51b3014 	ldr	r3, [fp, #-20]	@ 0xffffffec
8000c9c0:	e51b2030 	ldr	r2, [fp, #-48]	@ 0xffffffd0
8000c9c4:	e0823003 	add	r3, r2, r3
8000c9c8:	e51b1028 	ldr	r1, [fp, #-40]	@ 0xffffffd8
8000c9cc:	e1a00003 	mov	r0, r3
8000c9d0:	eb000069 	bl	8000cb7c <print_int>
8000c9d4:	e1a02000 	mov	r2, r0
8000c9d8:	e51b3014 	ldr	r3, [fp, #-20]	@ 0xffffffec
8000c9dc:	e0833002 	add	r3, r3, r2
8000c9e0:	e50b3014 	str	r3, [fp, #-20]	@ 0xffffffec
8000c9e4:	ea00002d 	b	8000caa0 <vsprintf+0x280>
8000c9e8:	e51b3038 	ldr	r3, [fp, #-56]	@ 0xffffffc8
8000c9ec:	e2832004 	add	r2, r3, #4
8000c9f0:	e50b2038 	str	r2, [fp, #-56]	@ 0xffffffc8
8000c9f4:	e5933000 	ldr	r3, [r3]
8000c9f8:	e50b3020 	str	r3, [fp, #-32]	@ 0xffffffe0
8000c9fc:	e51b3014 	ldr	r3, [fp, #-20]	@ 0xffffffec
8000ca00:	e51b2030 	ldr	r2, [fp, #-48]	@ 0xffffffd0
8000ca04:	e0823003 	add	r3, r2, r3
8000ca08:	e3a0200a 	mov	r2, #10
8000ca0c:	e51b1020 	ldr	r1, [fp, #-32]	@ 0xffffffe0
8000ca10:	e1a00003 	mov	r0, r3
8000ca14:	eb00007e 	bl	8000cc14 <print_uint_in_base>
8000ca18:	e1a02000 	mov	r2, r0
8000ca1c:	e51b3014 	ldr	r3, [fp, #-20]	@ 0xffffffec
8000ca20:	e0833002 	add	r3, r3, r2
8000ca24:	e50b3014 	str	r3, [fp, #-20]	@ 0xffffffec
8000ca28:	ea00001c 	b	8000caa0 <vsprintf+0x280>
8000ca2c:	e51b3038 	ldr	r3, [fp, #-56]	@ 0xffffffc8
8000ca30:	e2832004 	add	r2, r3, #4
8000ca34:	e50b2038 	str	r2, [fp, #-56]	@ 0xffffffc8
8000ca38:	e5933000 	ldr	r3, [r3]
8000ca3c:	e50b301c 	str	r3, [fp, #-28]	@ 0xffffffe4
8000ca40:	e51b3014 	ldr	r3, [fp, #-20]	@ 0xffffffec
8000ca44:	e51b2030 	ldr	r2, [fp, #-48]	@ 0xffffffd0
8000ca48:	e0823003 	add	r3, r2, r3
8000ca4c:	e59f2098 	ldr	r2, [pc, #152]	@ 8000caec <vsprintf+0x2cc>
8000ca50:	e08f2002 	add	r2, pc, r2
8000ca54:	e1a01002 	mov	r1, r2
8000ca58:	e1a00003 	mov	r0, r3
8000ca5c:	eb000023 	bl	8000caf0 <print_string>
8000ca60:	e1a02000 	mov	r2, r0
8000ca64:	e51b3014 	ldr	r3, [fp, #-20]	@ 0xffffffec
8000ca68:	e0833002 	add	r3, r3, r2
8000ca6c:	e50b3014 	str	r3, [fp, #-20]	@ 0xffffffec
8000ca70:	e51b3014 	ldr	r3, [fp, #-20]	@ 0xffffffec
8000ca74:	e51b2030 	ldr	r2, [fp, #-48]	@ 0xffffffd0
8000ca78:	e0823003 	add	r3, r2, r3
8000ca7c:	e51b101c 	ldr	r1, [fp, #-28]	@ 0xffffffe4
8000ca80:	e3a02010 	mov	r2, #16
8000ca84:	e1a00003 	mov	r0, r3
8000ca88:	eb000061 	bl	8000cc14 <print_uint_in_base>
8000ca8c:	e1a02000 	mov	r2, r0
8000ca90:	e51b3014 	ldr	r3, [fp, #-20]	@ 0xffffffec
8000ca94:	e0833002 	add	r3, r3, r2
8000ca98:	e50b3014 	str	r3, [fp, #-20]	@ 0xffffffec
8000ca9c:	e320f000 	nop	{0}
8000caa0:	e51b3010 	ldr	r3, [fp, #-16]
8000caa4:	e2833002 	add	r3, r3, #2
8000caa8:	e50b3010 	str	r3, [fp, #-16]
8000caac:	e51b3010 	ldr	r3, [fp, #-16]
8000cab0:	e51b2034 	ldr	r2, [fp, #-52]	@ 0xffffffcc
8000cab4:	e0823003 	add	r3, r2, r3
8000cab8:	e5d33000 	ldrb	r3, [r3]
8000cabc:	e3530000 	cmp	r3, #0
8000cac0:	1affff62 	bne	8000c850 <vsprintf+0x30>
8000cac4:	e51b3014 	ldr	r3, [fp, #-20]	@ 0xffffffec
8000cac8:	e51b2030 	ldr	r2, [fp, #-48]	@ 0xffffffd0
8000cacc:	e0823003 	add	r3, r2, r3
8000cad0:	e3a02000 	mov	r2, #0
8000cad4:	e5c32000 	strb	r2, [r3]
8000cad8:	e51b3014 	ldr	r3, [fp, #-20]	@ 0xffffffec
8000cadc:	e1a00003 	mov	r0, r3
8000cae0:	e24bd00c 	sub	sp, fp, #12
8000cae4:	e89da800 	ldm	sp, {fp, sp, pc}
8000cae8:	0000d54c 	andeq	sp, r0, ip, asr #10
8000caec:	0000d414 	andeq	sp, r0, r4, lsl r4

8000caf0 <print_string>:
8000caf0:	e1a0c00d 	mov	ip, sp
8000caf4:	e92dd800 	push	{fp, ip, lr, pc}
8000caf8:	e24cb004 	sub	fp, ip, #4
8000cafc:	e24dd010 	sub	sp, sp, #16
8000cb00:	e50b0018 	str	r0, [fp, #-24]	@ 0xffffffe8
8000cb04:	e50b101c 	str	r1, [fp, #-28]	@ 0xffffffe4
8000cb08:	e3a03000 	mov	r3, #0
8000cb0c:	e50b3010 	str	r3, [fp, #-16]
8000cb10:	e3a03000 	mov	r3, #0
8000cb14:	e50b3014 	str	r3, [fp, #-20]	@ 0xffffffec
8000cb18:	ea00000d 	b	8000cb54 <print_string+0x64>
8000cb1c:	e51b3014 	ldr	r3, [fp, #-20]	@ 0xffffffec
8000cb20:	e51b201c 	ldr	r2, [fp, #-28]	@ 0xffffffe4
8000cb24:	e0822003 	add	r2, r2, r3
8000cb28:	e51b3010 	ldr	r3, [fp, #-16]
8000cb2c:	e51b1018 	ldr	r1, [fp, #-24]	@ 0xffffffe8
8000cb30:	e0813003 	add	r3, r1, r3
8000cb34:	e5d22000 	ldrb	r2, [r2]
8000cb38:	e5c32000 	strb	r2, [r3]
8000cb3c:	e51b3010 	ldr	r3, [fp, #-16]
8000cb40:	e2833001 	add	r3, r3, #1
8000cb44:	e50b3010 	str	r3, [fp, #-16]
8000cb48:	e51b3014 	ldr	r3, [fp, #-20]	@ 0xffffffec
8000cb4c:	e2833001 	add	r3, r3, #1
8000cb50:	e50b3014 	str	r3, [fp, #-20]	@ 0xffffffec
8000cb54:	e51b3014 	ldr	r3, [fp, #-20]	@ 0xffffffec
8000cb58:	e51b201c 	ldr	r2, [fp, #-28]	@ 0xffffffe4
8000cb5c:	e0823003 	add	r3, r2, r3
8000cb60:	e5d33000 	ldrb	r3, [r3]
8000cb64:	e3530000 	cmp	r3, #0
8000cb68:	1affffeb 	bne	8000cb1c <print_string+0x2c>
8000cb6c:	e51b3014 	ldr	r3, [fp, #-20]	@ 0xffffffec
8000cb70:	e1a00003 	mov	r0, r3
8000cb74:	e24bd00c 	sub	sp, fp, #12
8000cb78:	e89da800 	ldm	sp, {fp, sp, pc}

8000cb7c <print_int>:
8000cb7c:	e1a0c00d 	mov	ip, sp
8000cb80:	e92dd800 	push	{fp, ip, lr, pc}
8000cb84:	e24cb004 	sub	fp, ip, #4
8000cb88:	e24dd010 	sub	sp, sp, #16
8000cb8c:	e50b0018 	str	r0, [fp, #-24]	@ 0xffffffe8
8000cb90:	e50b101c 	str	r1, [fp, #-28]	@ 0xffffffe4
8000cb94:	e3a03000 	mov	r3, #0
8000cb98:	e50b3010 	str	r3, [fp, #-16]
8000cb9c:	e51b301c 	ldr	r3, [fp, #-28]	@ 0xffffffe4
8000cba0:	e3530000 	cmp	r3, #0
8000cba4:	aa000010 	bge	8000cbec <print_int+0x70>
8000cba8:	e51b3018 	ldr	r3, [fp, #-24]	@ 0xffffffe8
8000cbac:	e3a0202d 	mov	r2, #45	@ 0x2d
8000cbb0:	e5c32000 	strb	r2, [r3]
8000cbb4:	e3a03001 	mov	r3, #1
8000cbb8:	e50b3010 	str	r3, [fp, #-16]
8000cbbc:	e51b3018 	ldr	r3, [fp, #-24]	@ 0xffffffe8
8000cbc0:	e2830001 	add	r0, r3, #1
8000cbc4:	e51b301c 	ldr	r3, [fp, #-28]	@ 0xffffffe4
8000cbc8:	e2633000 	rsb	r3, r3, #0
8000cbcc:	e3a0200a 	mov	r2, #10
8000cbd0:	e1a01003 	mov	r1, r3
8000cbd4:	eb00000e 	bl	8000cc14 <print_uint_in_base>
8000cbd8:	e1a02000 	mov	r2, r0
8000cbdc:	e51b3010 	ldr	r3, [fp, #-16]
8000cbe0:	e0833002 	add	r3, r3, r2
8000cbe4:	e50b3010 	str	r3, [fp, #-16]
8000cbe8:	ea000005 	b	8000cc04 <print_int+0x88>
8000cbec:	e51b301c 	ldr	r3, [fp, #-28]	@ 0xffffffe4
8000cbf0:	e3a0200a 	mov	r2, #10
8000cbf4:	e1a01003 	mov	r1, r3
8000cbf8:	e51b0018 	ldr	r0, [fp, #-24]	@ 0xffffffe8
8000cbfc:	eb000004 	bl	8000cc14 <print_uint_in_base>
8000cc00:	e50b0010 	str	r0, [fp, #-16]
8000cc04:	e51b3010 	ldr	r3, [fp, #-16]
8000cc08:	e1a00003 	mov	r0, r3
8000cc0c:	e24bd00c 	sub	sp, fp, #12
8000cc10:	e89da800 	ldm	sp, {fp, sp, pc}

8000cc14 <print_uint_in_base>:
8000cc14:	e1a0c00d 	mov	ip, sp
8000cc18:	e92dd800 	push	{fp, ip, lr, pc}
8000cc1c:	e24cb004 	sub	fp, ip, #4
8000cc20:	e24dd020 	sub	sp, sp, #32
8000cc24:	e50b0020 	str	r0, [fp, #-32]	@ 0xffffffe0
8000cc28:	e50b1024 	str	r1, [fp, #-36]	@ 0xffffffdc
8000cc2c:	e50b2028 	str	r2, [fp, #-40]	@ 0xffffffd8
8000cc30:	e3a03000 	mov	r3, #0
8000cc34:	e50b3010 	str	r3, [fp, #-16]
8000cc38:	e3a03000 	mov	r3, #0
8000cc3c:	e50b3018 	str	r3, [fp, #-24]	@ 0xffffffe8
8000cc40:	e3a03000 	mov	r3, #0
8000cc44:	e50b3014 	str	r3, [fp, #-20]	@ 0xffffffec
8000cc48:	e24b3018 	sub	r3, fp, #24
8000cc4c:	e1a02003 	mov	r2, r3
8000cc50:	e51b1028 	ldr	r1, [fp, #-40]	@ 0xffffffd8
8000cc54:	e51b0024 	ldr	r0, [fp, #-36]	@ 0xffffffdc
8000cc58:	eb000018 	bl	8000ccc0 <unsigned_divmod>
8000cc5c:	e50b0014 	str	r0, [fp, #-20]	@ 0xffffffec
8000cc60:	e51b3014 	ldr	r3, [fp, #-20]	@ 0xffffffec
8000cc64:	e3530000 	cmp	r3, #0
8000cc68:	0a000004 	beq	8000cc80 <print_uint_in_base+0x6c>
8000cc6c:	e51b2028 	ldr	r2, [fp, #-40]	@ 0xffffffd8
8000cc70:	e51b1014 	ldr	r1, [fp, #-20]	@ 0xffffffec
8000cc74:	e51b0020 	ldr	r0, [fp, #-32]	@ 0xffffffe0
8000cc78:	ebffffe5 	bl	8000cc14 <print_uint_in_base>
8000cc7c:	e50b0010 	str	r0, [fp, #-16]
8000cc80:	e51b2018 	ldr	r2, [fp, #-24]	@ 0xffffffe8
8000cc84:	e51b3010 	ldr	r3, [fp, #-16]
8000cc88:	e51b1020 	ldr	r1, [fp, #-32]	@ 0xffffffe0
8000cc8c:	e0813003 	add	r3, r1, r3
8000cc90:	e59f1024 	ldr	r1, [pc, #36]	@ 8000ccbc <print_uint_in_base+0xa8>
8000cc94:	e08f1001 	add	r1, pc, r1
8000cc98:	e7d12002 	ldrb	r2, [r1, r2]
8000cc9c:	e5c32000 	strb	r2, [r3]
8000cca0:	e51b3010 	ldr	r3, [fp, #-16]
8000cca4:	e2833001 	add	r3, r3, #1
8000cca8:	e50b3010 	str	r3, [fp, #-16]
8000ccac:	e51b3010 	ldr	r3, [fp, #-16]
8000ccb0:	e1a00003 	mov	r0, r3
8000ccb4:	e24bd00c 	sub	sp, fp, #12
8000ccb8:	e89da800 	ldm	sp, {fp, sp, pc}
8000ccbc:	0000d22c 	andeq	sp, r0, ip, lsr #4

8000ccc0 <unsigned_divmod>:
8000ccc0:	e1a0c00d 	mov	ip, sp
8000ccc4:	e92dd800 	push	{fp, ip, lr, pc}
8000ccc8:	e24cb004 	sub	fp, ip, #4
8000cccc:	e24dd020 	sub	sp, sp, #32
8000ccd0:	e50b0020 	str	r0, [fp, #-32]	@ 0xffffffe0
8000ccd4:	e50b1024 	str	r1, [fp, #-36]	@ 0xffffffdc
8000ccd8:	e50b2028 	str	r2, [fp, #-40]	@ 0xffffffd8
8000ccdc:	e3a03000 	mov	r3, #0
8000cce0:	e50b3010 	str	r3, [fp, #-16]
8000cce4:	e3a03000 	mov	r3, #0
8000cce8:	e50b3014 	str	r3, [fp, #-20]	@ 0xffffffec
8000ccec:	e3a03000 	mov	r3, #0
8000ccf0:	e50b3018 	str	r3, [fp, #-24]	@ 0xffffffe8
8000ccf4:	e3a0301f 	mov	r3, #31
8000ccf8:	e50b3010 	str	r3, [fp, #-16]
8000ccfc:	ea00001f 	b	8000cd80 <unsigned_divmod+0xc0>
8000cd00:	e3a02001 	mov	r2, #1
8000cd04:	e51b3010 	ldr	r3, [fp, #-16]
8000cd08:	e1a02312 	lsl	r2, r2, r3
8000cd0c:	e51b3020 	ldr	r3, [fp, #-32]	@ 0xffffffe0
8000cd10:	e0033002 	and	r3, r3, r2
8000cd14:	e3530000 	cmp	r3, #0
8000cd18:	13a03001 	movne	r3, #1
8000cd1c:	03a03000 	moveq	r3, #0
8000cd20:	e6ef3073 	uxtb	r3, r3
8000cd24:	e50b301c 	str	r3, [fp, #-28]	@ 0xffffffe4
8000cd28:	e51b3018 	ldr	r3, [fp, #-24]	@ 0xffffffe8
8000cd2c:	e1a03083 	lsl	r3, r3, #1
8000cd30:	e51b201c 	ldr	r2, [fp, #-28]	@ 0xffffffe4
8000cd34:	e1823003 	orr	r3, r2, r3
8000cd38:	e50b3018 	str	r3, [fp, #-24]	@ 0xffffffe8
8000cd3c:	e51b2018 	ldr	r2, [fp, #-24]	@ 0xffffffe8
8000cd40:	e51b3024 	ldr	r3, [fp, #-36]	@ 0xffffffdc
8000cd44:	e1520003 	cmp	r2, r3
8000cd48:	3a000009 	bcc	8000cd74 <unsigned_divmod+0xb4>
8000cd4c:	e51b2018 	ldr	r2, [fp, #-24]	@ 0xffffffe8
8000cd50:	e51b3024 	ldr	r3, [fp, #-36]	@ 0xffffffdc
8000cd54:	e0423003 	sub	r3, r2, r3
8000cd58:	e50b3018 	str	r3, [fp, #-24]	@ 0xffffffe8
8000cd5c:	e3a02001 	mov	r2, #1
8000cd60:	e51b3010 	ldr	r3, [fp, #-16]
8000cd64:	e1a03312 	lsl	r3, r2, r3
8000cd68:	e51b2014 	ldr	r2, [fp, #-20]	@ 0xffffffec
8000cd6c:	e1823003 	orr	r3, r2, r3
8000cd70:	e50b3014 	str	r3, [fp, #-20]	@ 0xffffffec
8000cd74:	e51b3010 	ldr	r3, [fp, #-16]
8000cd78:	e2433001 	sub	r3, r3, #1
8000cd7c:	e50b3010 	str	r3, [fp, #-16]
8000cd80:	e51b3010 	ldr	r3, [fp, #-16]
8000cd84:	e3530000 	cmp	r3, #0
8000cd88:	aaffffdc 	bge	8000cd00 <unsigned_divmod+0x40>
8000cd8c:	e51b3028 	ldr	r3, [fp, #-40]	@ 0xffffffd8
8000cd90:	e3530000 	cmp	r3, #0
8000cd94:	0a000002 	beq	8000cda4 <unsigned_divmod+0xe4>
8000cd98:	e51b3028 	ldr	r3, [fp, #-40]	@ 0xffffffd8
8000cd9c:	e51b2018 	ldr	r2, [fp, #-24]	@ 0xffffffe8
8000cda0:	e5832000 	str	r2, [r3]
8000cda4:	e51b3014 	ldr	r3, [fp, #-20]	@ 0xffffffec
8000cda8:	e1a00003 	mov	r0, r3
8000cdac:	e24bd00c 	sub	sp, fp, #12
8000cdb0:	e89da800 	ldm	sp, {fp, sp, pc}

Disassembly of section .rodata:

8000cdb4 <SPECIAL_KEY_SEQUENCES>:
8000cdb4:	5b1b1001 	blpl	806d0dc0 <irq_stack_start+0x676db0>
8000cdb8:	00000041 	andeq	r0, r0, r1, asr #32
8000cdbc:	5b1b1002 	blpl	806d0dcc <irq_stack_start+0x676dbc>
8000cdc0:	00000042 	andeq	r0, r0, r2, asr #32
8000cdc4:	5b1b1003 	blpl	806d0dd8 <irq_stack_start+0x676dc8>
8000cdc8:	00000043 	andeq	r0, r0, r3, asr #32
8000cdcc:	5b1b1004 	blpl	806d0de4 <irq_stack_start+0x676dd4>
8000cdd0:	00000044 	andeq	r0, r0, r4, asr #32
8000cdd4:	007f1005 	rsbseq	r1, pc, r5
8000cdd8:	00000000 	andeq	r0, r0, r0
8000cddc:	00081005 	andeq	r1, r8, r5
8000cde0:	00000000 	andeq	r0, r0, r0
8000cde4:	0000003a 	andeq	r0, r0, sl, lsr r0

8000cde8 <SPECIAL_KEY_SEQUENCES>:
8000cde8:	5b1b1001 	blpl	806d0df4 <irq_stack_start+0x676de4>
8000cdec:	00000041 	andeq	r0, r0, r1, asr #32
8000cdf0:	5b1b1002 	blpl	806d0e00 <irq_stack_start+0x676df0>
8000cdf4:	00000042 	andeq	r0, r0, r2, asr #32
8000cdf8:	5b1b1003 	blpl	806d0e0c <irq_stack_start+0x676dfc>
8000cdfc:	00000043 	andeq	r0, r0, r3, asr #32
8000ce00:	5b1b1004 	blpl	806d0e18 <irq_stack_start+0x676e08>
8000ce04:	00000044 	andeq	r0, r0, r4, asr #32
8000ce08:	007f1005 	rsbseq	r1, pc, r5
8000ce0c:	00000000 	andeq	r0, r0, r0
8000ce10:	00081005 	andeq	r1, r8, r5
8000ce14:	00000000 	andeq	r0, r0, r0
8000ce18:	706c6568 	rsbvc	r6, ip, r8, ror #10
8000ce1c:	00000000 	andeq	r0, r0, r0
8000ce20:	70736944 	rsbsvc	r6, r3, r4, asr #18
8000ce24:	7379616c 	cmnvc	r9, #108, 2
8000ce28:	69687420 	stmdbvs	r8!, {r5, sl, ip, sp, lr}^
8000ce2c:	696c2073 	stmdbvs	ip!, {r0, r1, r4, r5, r6, sp}^
8000ce30:	6f207473 	svcvs	0x00207473
8000ce34:	6f632066 	svcvs	0x00632066
8000ce38:	6e616d6d 	cdpvs	13, 6, cr6, cr1, cr13, {3}
8000ce3c:	00007364 	andeq	r7, r0, r4, ror #6
8000ce40:	6b636162 	blvs	818e53d0 <irq_stack_start+0x188b3c0>
8000ce44:	63617274 	cmnvs	r1, #116, 4	@ 0x40000007
8000ce48:	00000065 	andeq	r0, r0, r5, rrx
8000ce4c:	70736944 	rsbsvc	r6, r3, r4, asr #18
8000ce50:	7379616c 	cmnvc	r9, #108, 2
8000ce54:	65687420 	strbvs	r7, [r8, #-1056]!	@ 0xfffffbe0
8000ce58:	72756320 	rsbsvc	r6, r5, #32, 6	@ 0x80000000
8000ce5c:	746e6572 	strbtvc	r6, [lr], #-1394	@ 0xfffffa8e
8000ce60:	61747320 	cmnvs	r4, r0, lsr #6
8000ce64:	62206b63 	eorvs	r6, r0, #101376	@ 0x18c00
8000ce68:	746b6361 	strbtvc	r6, [fp], #-865	@ 0xfffffc9f
8000ce6c:	65636172 	strbvs	r6, [r3, #-370]!	@ 0xfffffe8e
8000ce70:	00000000 	andeq	r0, r0, r0
8000ce74:	74786568 	ldrbtvc	r6, [r8], #-1384	@ 0xfffffa98
8000ce78:	00006565 	andeq	r6, r0, r5, ror #10
8000ce7c:	64616552 	strbtvs	r6, [r1], #-1362	@ 0xfffffaae
8000ce80:	72662073 	rsbvc	r2, r6, #115	@ 0x73
8000ce84:	69206d6f 	stmdbvs	r0!, {r0, r1, r2, r3, r5, r6, r8, sl, fp, sp, lr}
8000ce88:	7475706e 	ldrbtvc	r7, [r5], #-110	@ 0xffffff92
8000ce8c:	646e6120 	strbtvs	r6, [lr], #-288	@ 0xfffffee0
8000ce90:	74756f20 	ldrbtvc	r6, [r5], #-3872	@ 0xfffff0e0
8000ce94:	73747570 	cmnvc	r4, #112, 10	@ 0x1c000000
8000ce98:	65687420 	strbvs	r7, [r8, #-1056]!	@ 0xfffffbe0
8000ce9c:	78656820 	stmdavc	r5!, {r5, fp, sp, lr}^
8000cea0:	63656461 	cmnvs	r5, #1627389952	@ 0x61000000
8000cea4:	6c616d69 	stclvs	13, cr6, [r1], #-420	@ 0xfffffe5c
8000cea8:	646f6320 	strbtvs	r6, [pc], #-800	@ 8000ceb0 <SPECIAL_KEY_SEQUENCES+0xc8>
8000ceac:	00007365 	andeq	r7, r0, r5, ror #6
8000ceb0:	6e72656b 	cdpvs	5, 7, cr6, cr2, cr11, {3}
8000ceb4:	6f666e69 	svcvs	0x00666e69
8000ceb8:	00000000 	andeq	r0, r0, r0
8000cebc:	70736944 	rsbsvc	r6, r3, r4, asr #18
8000cec0:	7379616c 	cmnvc	r9, #108, 2
8000cec4:	666e6920 	strbtvs	r6, [lr], -r0, lsr #18
8000cec8:	616d726f 	cmnvs	sp, pc, ror #4
8000cecc:	6e6f6974 			@ <UNDEFINED> instruction: 0x6e6f6974
8000ced0:	6f626120 	svcvs	0x00626120
8000ced4:	74207475 	strtvc	r7, [r0], #-1141	@ 0xfffffb8b
8000ced8:	6b206568 	blvs	80826480 <irq_stack_start+0x7cc470>
8000cedc:	656e7265 	strbvs	r7, [lr, #-613]!	@ 0xfffffd9b
8000cee0:	0000006c 	andeq	r0, r0, ip, rrx
8000cee4:	74617473 	strbtvc	r7, [r1], #-1139	@ 0xfffffb8d
8000cee8:	00007375 	andeq	r7, r0, r5, ror r3
8000ceec:	70736944 	rsbsvc	r6, r3, r4, asr #18
8000cef0:	7379616c 	cmnvc	r9, #108, 2
8000cef4:	72756320 	rsbsvc	r6, r5, #32, 6	@ 0x80000000
8000cef8:	746e6572 	strbtvc	r6, [lr], #-1394	@ 0xfffffa8e
8000cefc:	61747320 	cmnvs	r4, r0, lsr #6
8000cf00:	20737574 	rsbscs	r7, r3, r4, ror r5
8000cf04:	7420666f 	strtvc	r6, [r0], #-1647	@ 0xfffff991
8000cf08:	73206568 			@ <UNDEFINED> instruction: 0x73206568
8000cf0c:	65747379 	ldrbvs	r7, [r4, #-889]!	@ 0xfffffc87
8000cf10:	0000006d 	andeq	r0, r0, sp, rrx
8000cf14:	63657865 	cmnvs	r5, #6619136	@ 0x650000
8000cf18:	00657475 	rsbeq	r7, r5, r5, ror r4
8000cf1c:	63657845 	cmnvs	r5, #4521984	@ 0x450000
8000cf20:	73657475 	cmnvc	r5, #1962934272	@ 0x75000000
8000cf24:	75206120 	strvc	r6, [r0, #-288]!	@ 0xfffffee0
8000cf28:	20726573 	rsbscs	r6, r2, r3, ror r5
8000cf2c:	676f7270 			@ <UNDEFINED> instruction: 0x676f7270
8000cf30:	006d6172 	rsbeq	r6, sp, r2, ror r1

8000cf34 <SPECIAL_KEY_SEQUENCES>:
8000cf34:	5b1b1001 	blpl	806d0f40 <irq_stack_start+0x676f30>
8000cf38:	00000041 	andeq	r0, r0, r1, asr #32
8000cf3c:	5b1b1002 	blpl	806d0f4c <irq_stack_start+0x676f3c>
8000cf40:	00000042 	andeq	r0, r0, r2, asr #32
8000cf44:	5b1b1003 	blpl	806d0f58 <irq_stack_start+0x676f48>
8000cf48:	00000043 	andeq	r0, r0, r3, asr #32
8000cf4c:	5b1b1004 	blpl	806d0f64 <irq_stack_start+0x676f54>
8000cf50:	00000044 	andeq	r0, r0, r4, asr #32
8000cf54:	007f1005 	rsbseq	r1, pc, r5
8000cf58:	00000000 	andeq	r0, r0, r0
8000cf5c:	00081005 	andeq	r1, r8, r5
8000cf60:	00000000 	andeq	r0, r0, r0

8000cf64 <SPECIAL_KEY_SEQUENCES>:
8000cf64:	5b1b1001 	blpl	806d0f70 <irq_stack_start+0x676f60>
8000cf68:	00000041 	andeq	r0, r0, r1, asr #32
8000cf6c:	5b1b1002 	blpl	806d0f7c <irq_stack_start+0x676f6c>
8000cf70:	00000042 	andeq	r0, r0, r2, asr #32
8000cf74:	5b1b1003 	blpl	806d0f88 <irq_stack_start+0x676f78>
8000cf78:	00000043 	andeq	r0, r0, r3, asr #32
8000cf7c:	5b1b1004 	blpl	806d0f94 <irq_stack_start+0x676f84>
8000cf80:	00000044 	andeq	r0, r0, r4, asr #32
8000cf84:	007f1005 	rsbseq	r1, pc, r5
8000cf88:	00000000 	andeq	r0, r0, r0
8000cf8c:	00081005 	andeq	r1, r8, r5
8000cf90:	00000000 	andeq	r0, r0, r0

8000cf94 <SPECIAL_KEY_SEQUENCES>:
8000cf94:	5b1b1001 	blpl	806d0fa0 <irq_stack_start+0x676f90>
8000cf98:	00000041 	andeq	r0, r0, r1, asr #32
8000cf9c:	5b1b1002 	blpl	806d0fac <irq_stack_start+0x676f9c>
8000cfa0:	00000042 	andeq	r0, r0, r2, asr #32
8000cfa4:	5b1b1003 	blpl	806d0fb8 <irq_stack_start+0x676fa8>
8000cfa8:	00000043 	andeq	r0, r0, r3, asr #32
8000cfac:	5b1b1004 	blpl	806d0fc4 <irq_stack_start+0x676fb4>
8000cfb0:	00000044 	andeq	r0, r0, r4, asr #32
8000cfb4:	007f1005 	rsbseq	r1, pc, r5
8000cfb8:	00000000 	andeq	r0, r0, r0
8000cfbc:	00081005 	andeq	r1, r8, r5
8000cfc0:	00000000 	andeq	r0, r0, r0
8000cfc4:	72657375 	rsbvc	r7, r5, #-738197503	@ 0xd4000001
8000cfc8:	00000000 	andeq	r0, r0, r0
8000cfcc:	00716966 	rsbseq	r6, r1, r6, ror #18
8000cfd0:	00717269 	rsbseq	r7, r1, r9, ror #4
8000cfd4:	65707573 	ldrbvs	r7, [r0, #-1395]!	@ 0xfffffa8d
8000cfd8:	73697672 	cmnvc	r9, #119537664	@ 0x7200000
8000cfdc:	0000726f 	andeq	r7, r0, pc, ror #4
8000cfe0:	726f6261 	rsbvc	r6, pc, #268435462	@ 0x10000006
8000cfe4:	00000074 	andeq	r0, r0, r4, ror r0
8000cfe8:	65646e75 	strbvs	r6, [r4, #-3701]!	@ 0xfffff18b
8000cfec:	656e6966 	strbvs	r6, [lr, #-2406]!	@ 0xfffff69a
8000cff0:	00000064 	andeq	r0, r0, r4, rrx
8000cff4:	74737973 	ldrbtvc	r7, [r3], #-2419	@ 0xfffff68d
8000cff8:	00006d65 	andeq	r6, r0, r5, ror #26
8000cffc:	006d7261 	rsbeq	r7, sp, r1, ror #4
8000d000:	6d756874 	ldclvs	8, cr6, [r5, #-464]!	@ 0xfffffe30
8000d004:	00000062 	andeq	r0, r0, r2, rrx
8000d008:	657a616a 	ldrbvs	r6, [sl, #-362]!	@ 0xfffffe96
8000d00c:	00656c6c 	rsbeq	r6, r5, ip, ror #24
8000d010:	00412f4e 	subeq	r2, r1, lr, asr #30
8000d014:	204d5241 	subcs	r5, sp, r1, asr #4
8000d018:	00003476 	andeq	r3, r0, r6, ror r4
8000d01c:	204d5241 	subcs	r5, sp, r1, asr #4
8000d020:	00543476 	subseq	r3, r4, r6, ror r4
8000d024:	204d5241 	subcs	r5, sp, r1, asr #4
8000d028:	00003576 	andeq	r3, r0, r6, ror r5
8000d02c:	204d5241 	subcs	r5, sp, r1, asr #4
8000d030:	00543576 	subseq	r3, r4, r6, ror r5
8000d034:	204d5241 	subcs	r5, sp, r1, asr #4
8000d038:	45543576 	ldrbmi	r3, [r4, #-1398]	@ 0xfffffa8a
8000d03c:	00000000 	andeq	r0, r0, r0
8000d040:	204d5241 	subcs	r5, sp, r1, asr #4
8000d044:	45543576 	ldrbmi	r3, [r4, #-1398]	@ 0xfffffa8a
8000d048:	0000004a 	andeq	r0, r0, sl, asr #32
8000d04c:	204d5241 	subcs	r5, sp, r1, asr #4
8000d050:	00003676 	andeq	r3, r0, r6, ror r6
8000d054:	204d5241 	subcs	r5, sp, r1, asr #4
8000d058:	696d694c 	stmdbvs	sp!, {r2, r3, r6, r8, fp, sp, lr}^
8000d05c:	00646574 	rsbeq	r6, r4, r4, ror r5
8000d060:	69676944 	stmdbvs	r7!, {r2, r6, r8, fp, sp, lr}^
8000d064:	206c6174 	rsbcs	r6, ip, r4, ror r1
8000d068:	69757145 	ldmdbvs	r5!, {r0, r2, r6, r8, ip, sp, lr}^
8000d06c:	6e656d70 	mcrvs	13, 3, r6, cr5, cr0, {3}
8000d070:	6f432074 	svcvs	0x00432074
8000d074:	726f7072 	rsbvc	r7, pc, #114	@ 0x72
8000d078:	6f697461 	svcvs	0x00697461
8000d07c:	0000006e 	andeq	r0, r0, lr, rrx
8000d080:	6f746f4d 	svcvs	0x00746f4d
8000d084:	616c6f72 	smcvs	50930	@ 0xc6f2
8000d088:	46202d20 	strtmi	r2, [r0], -r0, lsr #26
8000d08c:	73656572 	cmnvc	r5, #478150656	@ 0x1c800000
8000d090:	656c6163 	strbvs	r6, [ip, #-355]!	@ 0xfffffe9d
8000d094:	6d655320 	stclvs	3, cr5, [r5, #-128]!	@ 0xffffff80
8000d098:	6e6f6369 	cdpvs	3, 6, cr6, cr15, cr9, {3}
8000d09c:	74637564 	strbtvc	r7, [r3], #-1380	@ 0xfffffa9c
8000d0a0:	4920726f 	stmdbmi	r0!, {r0, r1, r2, r3, r5, r6, r9, ip, sp, lr}
8000d0a4:	002e636e 	eoreq	r6, lr, lr, ror #6
8000d0a8:	7672614d 	ldrbtvc	r6, [r2], -sp, asr #2
8000d0ac:	206c6c65 	rsbcs	r6, ip, r5, ror #24
8000d0b0:	696d6553 	stmdbvs	sp!, {r0, r1, r4, r6, r8, sl, sp, lr}^
8000d0b4:	646e6f63 	strbtvs	r6, [lr], #-3939	@ 0xfffff09d
8000d0b8:	6f746375 	svcvs	0x00746375
8000d0bc:	6e492072 	mcrvs	0, 2, r2, cr9, cr2, {3}
8000d0c0:	00002e63 	andeq	r2, r0, r3, ror #28
8000d0c4:	65746e49 	ldrbvs	r6, [r4, #-3657]!	@ 0xfffff1b7
8000d0c8:	6f43206c 	svcvs	0x0043206c
8000d0cc:	726f7072 	rsbvc	r7, pc, #114	@ 0x72
8000d0d0:	6f697461 	svcvs	0x00697461
8000d0d4:	0000006e 	andeq	r0, r0, lr, rrx

8000d0d8 <kernel_mapping_count>:
8000d0d8:	00000004 	andeq	r0, r0, r4
8000d0dc:	706c6568 	rsbvc	r6, ip, r8, ror #10
8000d0e0:	00000000 	andeq	r0, r0, r0
8000d0e4:	70736944 	rsbsvc	r6, r3, r4, asr #18
8000d0e8:	7379616c 	cmnvc	r9, #108, 2
8000d0ec:	69687420 	stmdbvs	r8!, {r5, sl, ip, sp, lr}^
8000d0f0:	696c2073 	stmdbvs	ip!, {r0, r1, r4, r5, r6, sp}^
8000d0f4:	6f207473 	svcvs	0x00207473
8000d0f8:	6f632066 	svcvs	0x00632066
8000d0fc:	6e616d6d 	cdpvs	13, 6, cr6, cr1, cr13, {3}
8000d100:	00007364 	andeq	r7, r0, r4, ror #6
8000d104:	6b636162 	blvs	818e5694 <irq_stack_start+0x188b684>
8000d108:	63617274 	cmnvs	r1, #116, 4	@ 0x40000007
8000d10c:	00000065 	andeq	r0, r0, r5, rrx
8000d110:	70736944 	rsbsvc	r6, r3, r4, asr #18
8000d114:	7379616c 	cmnvc	r9, #108, 2
8000d118:	65687420 	strbvs	r7, [r8, #-1056]!	@ 0xfffffbe0
8000d11c:	72756320 	rsbsvc	r6, r5, #32, 6	@ 0x80000000
8000d120:	746e6572 	strbtvc	r6, [lr], #-1394	@ 0xfffffa8e
8000d124:	61747320 	cmnvs	r4, r0, lsr #6
8000d128:	62206b63 	eorvs	r6, r0, #101376	@ 0x18c00
8000d12c:	746b6361 	strbtvc	r6, [fp], #-865	@ 0xfffffc9f
8000d130:	65636172 	strbvs	r6, [r3, #-370]!	@ 0xfffffe8e
8000d134:	00000000 	andeq	r0, r0, r0
8000d138:	74786568 	ldrbtvc	r6, [r8], #-1384	@ 0xfffffa98
8000d13c:	00006565 	andeq	r6, r0, r5, ror #10
8000d140:	64616552 	strbtvs	r6, [r1], #-1362	@ 0xfffffaae
8000d144:	72662073 	rsbvc	r2, r6, #115	@ 0x73
8000d148:	69206d6f 	stmdbvs	r0!, {r0, r1, r2, r3, r5, r6, r8, sl, fp, sp, lr}
8000d14c:	7475706e 	ldrbtvc	r7, [r5], #-110	@ 0xffffff92
8000d150:	646e6120 	strbtvs	r6, [lr], #-288	@ 0xfffffee0
8000d154:	74756f20 	ldrbtvc	r6, [r5], #-3872	@ 0xfffff0e0
8000d158:	73747570 	cmnvc	r4, #112, 10	@ 0x1c000000
8000d15c:	65687420 	strbvs	r7, [r8, #-1056]!	@ 0xfffffbe0
8000d160:	78656820 	stmdavc	r5!, {r5, fp, sp, lr}^
8000d164:	63656461 	cmnvs	r5, #1627389952	@ 0x61000000
8000d168:	6c616d69 	stclvs	13, cr6, [r1], #-420	@ 0xfffffe5c
8000d16c:	646f6320 	strbtvs	r6, [pc], #-800	@ 8000d174 <kernel_mapping_count+0x9c>
8000d170:	00007365 	andeq	r7, r0, r5, ror #6
8000d174:	6e72656b 	cdpvs	5, 7, cr6, cr2, cr11, {3}
8000d178:	6f666e69 	svcvs	0x00666e69
8000d17c:	00000000 	andeq	r0, r0, r0
8000d180:	70736944 	rsbsvc	r6, r3, r4, asr #18
8000d184:	7379616c 	cmnvc	r9, #108, 2
8000d188:	666e6920 	strbtvs	r6, [lr], -r0, lsr #18
8000d18c:	616d726f 	cmnvs	sp, pc, ror #4
8000d190:	6e6f6974 			@ <UNDEFINED> instruction: 0x6e6f6974
8000d194:	6f626120 	svcvs	0x00626120
8000d198:	74207475 	strtvc	r7, [r0], #-1141	@ 0xfffffb8b
8000d19c:	6b206568 	blvs	80826744 <irq_stack_start+0x7cc734>
8000d1a0:	656e7265 	strbvs	r7, [lr, #-613]!	@ 0xfffffd9b
8000d1a4:	0000006c 	andeq	r0, r0, ip, rrx
8000d1a8:	74617473 	strbtvc	r7, [r1], #-1139	@ 0xfffffb8d
8000d1ac:	00007375 	andeq	r7, r0, r5, ror r3
8000d1b0:	70736944 	rsbsvc	r6, r3, r4, asr #18
8000d1b4:	7379616c 	cmnvc	r9, #108, 2
8000d1b8:	72756320 	rsbsvc	r6, r5, #32, 6	@ 0x80000000
8000d1bc:	746e6572 	strbtvc	r6, [lr], #-1394	@ 0xfffffa8e
8000d1c0:	61747320 	cmnvs	r4, r0, lsr #6
8000d1c4:	20737574 	rsbscs	r7, r3, r4, ror r5
8000d1c8:	7420666f 	strtvc	r6, [r0], #-1647	@ 0xfffff991
8000d1cc:	73206568 			@ <UNDEFINED> instruction: 0x73206568
8000d1d0:	65747379 	ldrbvs	r7, [r4, #-889]!	@ 0xfffffc87
8000d1d4:	0000006d 	andeq	r0, r0, sp, rrx
8000d1d8:	63657865 	cmnvs	r5, #6619136	@ 0x650000
8000d1dc:	00657475 	rsbeq	r7, r5, r5, ror r4
8000d1e0:	63657845 	cmnvs	r5, #4521984	@ 0x450000
8000d1e4:	73657475 	cmnvc	r5, #1962934272	@ 0x75000000
8000d1e8:	75206120 	strvc	r6, [r0, #-288]!	@ 0xfffffee0
8000d1ec:	20726573 	rsbscs	r6, r2, r3, ror r5
8000d1f0:	676f7270 			@ <UNDEFINED> instruction: 0x676f7270
8000d1f4:	006d6172 	rsbeq	r6, sp, r2, ror r1

8000d1f8 <SPECIAL_KEY_SEQUENCES>:
8000d1f8:	5b1b1001 	blpl	806d1204 <irq_stack_start+0x6771f4>
8000d1fc:	00000041 	andeq	r0, r0, r1, asr #32
8000d200:	5b1b1002 	blpl	806d1210 <irq_stack_start+0x677200>
8000d204:	00000042 	andeq	r0, r0, r2, asr #32
8000d208:	5b1b1003 	blpl	806d121c <irq_stack_start+0x67720c>
8000d20c:	00000043 	andeq	r0, r0, r3, asr #32
8000d210:	5b1b1004 	blpl	806d1228 <irq_stack_start+0x677218>
8000d214:	00000044 	andeq	r0, r0, r4, asr #32
8000d218:	007f1005 	rsbseq	r1, pc, r5
8000d21c:	00000000 	andeq	r0, r0, r0
8000d220:	00081005 	andeq	r1, r8, r5
8000d224:	00000000 	andeq	r0, r0, r0
8000d228:	72657375 	rsbvc	r7, r5, #-738197503	@ 0xd4000001
8000d22c:	00000000 	andeq	r0, r0, r0
8000d230:	00716966 	rsbseq	r6, r1, r6, ror #18
8000d234:	00717269 	rsbseq	r7, r1, r9, ror #4
8000d238:	65707573 	ldrbvs	r7, [r0, #-1395]!	@ 0xfffffa8d
8000d23c:	73697672 	cmnvc	r9, #119537664	@ 0x7200000
8000d240:	0000726f 	andeq	r7, r0, pc, ror #4
8000d244:	726f6261 	rsbvc	r6, pc, #268435462	@ 0x10000006
8000d248:	00000074 	andeq	r0, r0, r4, ror r0
8000d24c:	65646e75 	strbvs	r6, [r4, #-3701]!	@ 0xfffff18b
8000d250:	656e6966 	strbvs	r6, [lr, #-2406]!	@ 0xfffff69a
8000d254:	00000064 	andeq	r0, r0, r4, rrx
8000d258:	74737973 	ldrbtvc	r7, [r3], #-2419	@ 0xfffff68d
8000d25c:	00006d65 	andeq	r6, r0, r5, ror #26
8000d260:	006d7261 	rsbeq	r7, sp, r1, ror #4
8000d264:	6d756874 	ldclvs	8, cr6, [r5, #-464]!	@ 0xfffffe30
8000d268:	00000062 	andeq	r0, r0, r2, rrx
8000d26c:	657a616a 	ldrbvs	r6, [sl, #-362]!	@ 0xfffffe96
8000d270:	00656c6c 	rsbeq	r6, r5, ip, ror #24
8000d274:	00412f4e 	subeq	r2, r1, lr, asr #30
8000d278:	204d5241 	subcs	r5, sp, r1, asr #4
8000d27c:	00003476 	andeq	r3, r0, r6, ror r4
8000d280:	204d5241 	subcs	r5, sp, r1, asr #4
8000d284:	00543476 	subseq	r3, r4, r6, ror r4
8000d288:	204d5241 	subcs	r5, sp, r1, asr #4
8000d28c:	00003576 	andeq	r3, r0, r6, ror r5
8000d290:	204d5241 	subcs	r5, sp, r1, asr #4
8000d294:	00543576 	subseq	r3, r4, r6, ror r5
8000d298:	204d5241 	subcs	r5, sp, r1, asr #4
8000d29c:	45543576 	ldrbmi	r3, [r4, #-1398]	@ 0xfffffa8a
8000d2a0:	00000000 	andeq	r0, r0, r0
8000d2a4:	204d5241 	subcs	r5, sp, r1, asr #4
8000d2a8:	45543576 	ldrbmi	r3, [r4, #-1398]	@ 0xfffffa8a
8000d2ac:	0000004a 	andeq	r0, r0, sl, asr #32
8000d2b0:	204d5241 	subcs	r5, sp, r1, asr #4
8000d2b4:	00003676 	andeq	r3, r0, r6, ror r6
8000d2b8:	204d5241 	subcs	r5, sp, r1, asr #4
8000d2bc:	696d694c 	stmdbvs	sp!, {r2, r3, r6, r8, fp, sp, lr}^
8000d2c0:	00646574 	rsbeq	r6, r4, r4, ror r5
8000d2c4:	69676944 	stmdbvs	r7!, {r2, r6, r8, fp, sp, lr}^
8000d2c8:	206c6174 	rsbcs	r6, ip, r4, ror r1
8000d2cc:	69757145 	ldmdbvs	r5!, {r0, r2, r6, r8, ip, sp, lr}^
8000d2d0:	6e656d70 	mcrvs	13, 3, r6, cr5, cr0, {3}
8000d2d4:	6f432074 	svcvs	0x00432074
8000d2d8:	726f7072 	rsbvc	r7, pc, #114	@ 0x72
8000d2dc:	6f697461 	svcvs	0x00697461
8000d2e0:	0000006e 	andeq	r0, r0, lr, rrx
8000d2e4:	6f746f4d 	svcvs	0x00746f4d
8000d2e8:	616c6f72 	smcvs	50930	@ 0xc6f2
8000d2ec:	46202d20 	strtmi	r2, [r0], -r0, lsr #26
8000d2f0:	73656572 	cmnvc	r5, #478150656	@ 0x1c800000
8000d2f4:	656c6163 	strbvs	r6, [ip, #-355]!	@ 0xfffffe9d
8000d2f8:	6d655320 	stclvs	3, cr5, [r5, #-128]!	@ 0xffffff80
8000d2fc:	6e6f6369 	cdpvs	3, 6, cr6, cr15, cr9, {3}
8000d300:	74637564 	strbtvc	r7, [r3], #-1380	@ 0xfffffa9c
8000d304:	4920726f 	stmdbmi	r0!, {r0, r1, r2, r3, r5, r6, r9, ip, sp, lr}
8000d308:	002e636e 	eoreq	r6, lr, lr, ror #6
8000d30c:	7672614d 	ldrbtvc	r6, [r2], -sp, asr #2
8000d310:	206c6c65 	rsbcs	r6, ip, r5, ror #24
8000d314:	696d6553 	stmdbvs	sp!, {r0, r1, r4, r6, r8, sl, sp, lr}^
8000d318:	646e6f63 	strbtvs	r6, [lr], #-3939	@ 0xfffff09d
8000d31c:	6f746375 	svcvs	0x00746375
8000d320:	6e492072 	mcrvs	0, 2, r2, cr9, cr2, {3}
8000d324:	00002e63 	andeq	r2, r0, r3, ror #28
8000d328:	65746e49 	ldrbvs	r6, [r4, #-3657]!	@ 0xfffff1b7
8000d32c:	6f43206c 	svcvs	0x0043206c
8000d330:	726f7072 	rsbvc	r7, pc, #114	@ 0x72
8000d334:	6f697461 	svcvs	0x00697461
8000d338:	0000006e 	andeq	r0, r0, lr, rrx
8000d33c:	70662020 	rsbvc	r2, r6, r0, lsr #32
8000d340:	7825203a 	stmdavc	r5!, {r1, r3, r4, r5, sp}
8000d344:	726c202c 	rsbvc	r2, ip, #44	@ 0x2c
8000d348:	7825203a 	stmdavc	r5!, {r1, r3, r4, r5, sp}
8000d34c:	0000000a 	andeq	r0, r0, sl
8000d350:	20202020 	eorcs	r2, r0, r0, lsr #32
8000d354:	253a7325 	ldrcs	r7, [sl, #-805]!	@ 0xfffffcdb
8000d358:	64253a73 	strtvs	r3, [r5], #-2675	@ 0xfffff58d
8000d35c:	0000000a 	andeq	r0, r0, sl
8000d360:	61202020 			@ <UNDEFINED> instruction: 0x61202020
8000d364:	6d756772 	ldclvs	7, cr6, [r5, #-456]!	@ 0xfffffe38
8000d368:	73746e65 	cmnvc	r4, #1616	@ 0x650
8000d36c:	0000203a 	andeq	r2, r0, sl, lsr r0
8000d370:	253d7325 	ldrcs	r7, [sp, #-805]!	@ 0xfffffcdb
8000d374:	00002064 	andeq	r2, r0, r4, rrx
8000d378:	0000000a 	andeq	r0, r0, sl
8000d37c:	706c6568 	rsbvc	r6, ip, r8, ror #10
8000d380:	00000000 	andeq	r0, r0, r0
8000d384:	70736944 	rsbsvc	r6, r3, r4, asr #18
8000d388:	7379616c 	cmnvc	r9, #108, 2
8000d38c:	69687420 	stmdbvs	r8!, {r5, sl, ip, sp, lr}^
8000d390:	696c2073 	stmdbvs	ip!, {r0, r1, r4, r5, r6, sp}^
8000d394:	6f207473 	svcvs	0x00207473
8000d398:	6f632066 	svcvs	0x00632066
8000d39c:	6e616d6d 	cdpvs	13, 6, cr6, cr1, cr13, {3}
8000d3a0:	00007364 	andeq	r7, r0, r4, ror #6
8000d3a4:	6b636162 	blvs	818e5934 <irq_stack_start+0x188b924>
8000d3a8:	63617274 	cmnvs	r1, #116, 4	@ 0x40000007
8000d3ac:	00000065 	andeq	r0, r0, r5, rrx
8000d3b0:	70736944 	rsbsvc	r6, r3, r4, asr #18
8000d3b4:	7379616c 	cmnvc	r9, #108, 2
8000d3b8:	65687420 	strbvs	r7, [r8, #-1056]!	@ 0xfffffbe0
8000d3bc:	72756320 	rsbsvc	r6, r5, #32, 6	@ 0x80000000
8000d3c0:	746e6572 	strbtvc	r6, [lr], #-1394	@ 0xfffffa8e
8000d3c4:	61747320 	cmnvs	r4, r0, lsr #6
8000d3c8:	62206b63 	eorvs	r6, r0, #101376	@ 0x18c00
8000d3cc:	746b6361 	strbtvc	r6, [fp], #-865	@ 0xfffffc9f
8000d3d0:	65636172 	strbvs	r6, [r3, #-370]!	@ 0xfffffe8e
8000d3d4:	00000000 	andeq	r0, r0, r0
8000d3d8:	74786568 	ldrbtvc	r6, [r8], #-1384	@ 0xfffffa98
8000d3dc:	00006565 	andeq	r6, r0, r5, ror #10
8000d3e0:	64616552 	strbtvs	r6, [r1], #-1362	@ 0xfffffaae
8000d3e4:	72662073 	rsbvc	r2, r6, #115	@ 0x73
8000d3e8:	69206d6f 	stmdbvs	r0!, {r0, r1, r2, r3, r5, r6, r8, sl, fp, sp, lr}
8000d3ec:	7475706e 	ldrbtvc	r7, [r5], #-110	@ 0xffffff92
8000d3f0:	646e6120 	strbtvs	r6, [lr], #-288	@ 0xfffffee0
8000d3f4:	74756f20 	ldrbtvc	r6, [r5], #-3872	@ 0xfffff0e0
8000d3f8:	73747570 	cmnvc	r4, #112, 10	@ 0x1c000000
8000d3fc:	65687420 	strbvs	r7, [r8, #-1056]!	@ 0xfffffbe0
8000d400:	78656820 	stmdavc	r5!, {r5, fp, sp, lr}^
8000d404:	63656461 	cmnvs	r5, #1627389952	@ 0x61000000
8000d408:	6c616d69 	stclvs	13, cr6, [r1], #-420	@ 0xfffffe5c
8000d40c:	646f6320 	strbtvs	r6, [pc], #-800	@ 8000d414 <SPECIAL_KEY_SEQUENCES+0x21c>
8000d410:	00007365 	andeq	r7, r0, r5, ror #6
8000d414:	6e72656b 	cdpvs	5, 7, cr6, cr2, cr11, {3}
8000d418:	6f666e69 	svcvs	0x00666e69
8000d41c:	00000000 	andeq	r0, r0, r0
8000d420:	70736944 	rsbsvc	r6, r3, r4, asr #18
8000d424:	7379616c 	cmnvc	r9, #108, 2
8000d428:	666e6920 	strbtvs	r6, [lr], -r0, lsr #18
8000d42c:	616d726f 	cmnvs	sp, pc, ror #4
8000d430:	6e6f6974 			@ <UNDEFINED> instruction: 0x6e6f6974
8000d434:	6f626120 	svcvs	0x00626120
8000d438:	74207475 	strtvc	r7, [r0], #-1141	@ 0xfffffb8b
8000d43c:	6b206568 	blvs	808269e4 <irq_stack_start+0x7cc9d4>
8000d440:	656e7265 	strbvs	r7, [lr, #-613]!	@ 0xfffffd9b
8000d444:	0000006c 	andeq	r0, r0, ip, rrx
8000d448:	74617473 	strbtvc	r7, [r1], #-1139	@ 0xfffffb8d
8000d44c:	00007375 	andeq	r7, r0, r5, ror r3
8000d450:	70736944 	rsbsvc	r6, r3, r4, asr #18
8000d454:	7379616c 	cmnvc	r9, #108, 2
8000d458:	72756320 	rsbsvc	r6, r5, #32, 6	@ 0x80000000
8000d45c:	746e6572 	strbtvc	r6, [lr], #-1394	@ 0xfffffa8e
8000d460:	61747320 	cmnvs	r4, r0, lsr #6
8000d464:	20737574 	rsbscs	r7, r3, r4, ror r5
8000d468:	7420666f 	strtvc	r6, [r0], #-1647	@ 0xfffff991
8000d46c:	73206568 			@ <UNDEFINED> instruction: 0x73206568
8000d470:	65747379 	ldrbvs	r7, [r4, #-889]!	@ 0xfffffc87
8000d474:	0000006d 	andeq	r0, r0, sp, rrx
8000d478:	63657865 	cmnvs	r5, #6619136	@ 0x650000
8000d47c:	00657475 	rsbeq	r7, r5, r5, ror r4
8000d480:	63657845 	cmnvs	r5, #4521984	@ 0x450000
8000d484:	73657475 	cmnvc	r5, #1962934272	@ 0x75000000
8000d488:	75206120 	strvc	r6, [r0, #-288]!	@ 0xfffffee0
8000d48c:	20726573 	rsbscs	r6, r2, r3, ror r5
8000d490:	676f7270 			@ <UNDEFINED> instruction: 0x676f7270
8000d494:	006d6172 	rsbeq	r6, sp, r2, ror r1

8000d498 <SPECIAL_KEY_SEQUENCES>:
8000d498:	5b1b1001 	blpl	806d14a4 <irq_stack_start+0x677494>
8000d49c:	00000041 	andeq	r0, r0, r1, asr #32
8000d4a0:	5b1b1002 	blpl	806d14b0 <irq_stack_start+0x6774a0>
8000d4a4:	00000042 	andeq	r0, r0, r2, asr #32
8000d4a8:	5b1b1003 	blpl	806d14bc <irq_stack_start+0x6774ac>
8000d4ac:	00000043 	andeq	r0, r0, r3, asr #32
8000d4b0:	5b1b1004 	blpl	806d14c8 <irq_stack_start+0x6774b8>
8000d4b4:	00000044 	andeq	r0, r0, r4, asr #32
8000d4b8:	007f1005 	rsbseq	r1, pc, r5
8000d4bc:	00000000 	andeq	r0, r0, r0
8000d4c0:	00081005 	andeq	r1, r8, r5
8000d4c4:	00000000 	andeq	r0, r0, r0
8000d4c8:	72657375 	rsbvc	r7, r5, #-738197503	@ 0xd4000001
8000d4cc:	00000000 	andeq	r0, r0, r0
8000d4d0:	00716966 	rsbseq	r6, r1, r6, ror #18
8000d4d4:	00717269 	rsbseq	r7, r1, r9, ror #4
8000d4d8:	65707573 	ldrbvs	r7, [r0, #-1395]!	@ 0xfffffa8d
8000d4dc:	73697672 	cmnvc	r9, #119537664	@ 0x7200000
8000d4e0:	0000726f 	andeq	r7, r0, pc, ror #4
8000d4e4:	726f6261 	rsbvc	r6, pc, #268435462	@ 0x10000006
8000d4e8:	00000074 	andeq	r0, r0, r4, ror r0
8000d4ec:	65646e75 	strbvs	r6, [r4, #-3701]!	@ 0xfffff18b
8000d4f0:	656e6966 	strbvs	r6, [lr, #-2406]!	@ 0xfffff69a
8000d4f4:	00000064 	andeq	r0, r0, r4, rrx
8000d4f8:	74737973 	ldrbtvc	r7, [r3], #-2419	@ 0xfffff68d
8000d4fc:	00006d65 	andeq	r6, r0, r5, ror #26
8000d500:	006d7261 	rsbeq	r7, sp, r1, ror #4
8000d504:	6d756874 	ldclvs	8, cr6, [r5, #-464]!	@ 0xfffffe30
8000d508:	00000062 	andeq	r0, r0, r2, rrx
8000d50c:	657a616a 	ldrbvs	r6, [sl, #-362]!	@ 0xfffffe96
8000d510:	00656c6c 	rsbeq	r6, r5, ip, ror #24
8000d514:	00412f4e 	subeq	r2, r1, lr, asr #30
8000d518:	204d5241 	subcs	r5, sp, r1, asr #4
8000d51c:	00003476 	andeq	r3, r0, r6, ror r4
8000d520:	204d5241 	subcs	r5, sp, r1, asr #4
8000d524:	00543476 	subseq	r3, r4, r6, ror r4
8000d528:	204d5241 	subcs	r5, sp, r1, asr #4
8000d52c:	00003576 	andeq	r3, r0, r6, ror r5
8000d530:	204d5241 	subcs	r5, sp, r1, asr #4
8000d534:	00543576 	subseq	r3, r4, r6, ror r5
8000d538:	204d5241 	subcs	r5, sp, r1, asr #4
8000d53c:	45543576 	ldrbmi	r3, [r4, #-1398]	@ 0xfffffa8a
8000d540:	00000000 	andeq	r0, r0, r0
8000d544:	204d5241 	subcs	r5, sp, r1, asr #4
8000d548:	45543576 	ldrbmi	r3, [r4, #-1398]	@ 0xfffffa8a
8000d54c:	0000004a 	andeq	r0, r0, sl, asr #32
8000d550:	204d5241 	subcs	r5, sp, r1, asr #4
8000d554:	00003676 	andeq	r3, r0, r6, ror r6
8000d558:	204d5241 	subcs	r5, sp, r1, asr #4
8000d55c:	696d694c 	stmdbvs	sp!, {r2, r3, r6, r8, fp, sp, lr}^
8000d560:	00646574 	rsbeq	r6, r4, r4, ror r5
8000d564:	69676944 	stmdbvs	r7!, {r2, r6, r8, fp, sp, lr}^
8000d568:	206c6174 	rsbcs	r6, ip, r4, ror r1
8000d56c:	69757145 	ldmdbvs	r5!, {r0, r2, r6, r8, ip, sp, lr}^
8000d570:	6e656d70 	mcrvs	13, 3, r6, cr5, cr0, {3}
8000d574:	6f432074 	svcvs	0x00432074
8000d578:	726f7072 	rsbvc	r7, pc, #114	@ 0x72
8000d57c:	6f697461 	svcvs	0x00697461
8000d580:	0000006e 	andeq	r0, r0, lr, rrx
8000d584:	6f746f4d 	svcvs	0x00746f4d
8000d588:	616c6f72 	smcvs	50930	@ 0xc6f2
8000d58c:	46202d20 	strtmi	r2, [r0], -r0, lsr #26
8000d590:	73656572 	cmnvc	r5, #478150656	@ 0x1c800000
8000d594:	656c6163 	strbvs	r6, [ip, #-355]!	@ 0xfffffe9d
8000d598:	6d655320 	stclvs	3, cr5, [r5, #-128]!	@ 0xffffff80
8000d59c:	6e6f6369 	cdpvs	3, 6, cr6, cr15, cr9, {3}
8000d5a0:	74637564 	strbtvc	r7, [r3], #-1380	@ 0xfffffa9c
8000d5a4:	4920726f 	stmdbmi	r0!, {r0, r1, r2, r3, r5, r6, r9, ip, sp, lr}
8000d5a8:	002e636e 	eoreq	r6, lr, lr, ror #6
8000d5ac:	7672614d 	ldrbtvc	r6, [r2], -sp, asr #2
8000d5b0:	206c6c65 	rsbcs	r6, ip, r5, ror #24
8000d5b4:	696d6553 	stmdbvs	sp!, {r0, r1, r4, r6, r8, sl, sp, lr}^
8000d5b8:	646e6f63 	strbtvs	r6, [lr], #-3939	@ 0xfffff09d
8000d5bc:	6f746375 	svcvs	0x00746375
8000d5c0:	6e492072 	mcrvs	0, 2, r2, cr9, cr2, {3}
8000d5c4:	00002e63 	andeq	r2, r0, r3, ror #28
8000d5c8:	65746e49 	ldrbvs	r6, [r4, #-3657]!	@ 0xfffff1b7
8000d5cc:	6f43206c 	svcvs	0x0043206c
8000d5d0:	726f7072 	rsbvc	r7, pc, #114	@ 0x72
8000d5d4:	6f697461 	svcvs	0x00697461
8000d5d8:	0000006e 	andeq	r0, r0, lr, rrx
8000d5dc:	63657865 	cmnvs	r5, #6619136	@ 0x650000
8000d5e0:	20657475 	rsbcs	r7, r5, r5, ror r4
8000d5e4:	75716572 	ldrbvc	r6, [r1, #-1394]!	@ 0xfffffa8e
8000d5e8:	73657269 	cmnvc	r5, #-1879048186	@ 0x90000006
8000d5ec:	20746120 	rsbscs	r6, r4, r0, lsr #2
8000d5f0:	7361656c 	cmnvc	r1, #108, 10	@ 0x1b000000
8000d5f4:	6e6f2074 	mcrvs	0, 3, r2, cr15, cr4, {3}
8000d5f8:	72612065 	rsbvc	r2, r1, #101	@ 0x65
8000d5fc:	656d7567 	strbvs	r7, [sp, #-1383]!	@ 0xfffffa99
8000d600:	0a2e746e 	beq	80baa7c0 <irq_stack_start+0xb507b0>
8000d604:	00000000 	andeq	r0, r0, r0
8000d608:	6c756f63 	ldclvs	15, cr6, [r5], #-396	@ 0xfffffe74
8000d60c:	74276e64 	strtvc	r6, [r7], #-3684	@ 0xfffff19c
8000d610:	616f6c20 	cmnvs	pc, r0, lsr #24
8000d614:	68742064 	ldmdavs	r4!, {r2, r5, r6, sp}^
8000d618:	72702065 	rsbsvc	r2, r0, #101	@ 0x65
8000d61c:	7365636f 	cmnvc	r5, #-1140850687	@ 0xbc000001
8000d620:	000a2e73 	andeq	r2, sl, r3, ror lr
8000d624:	706c6568 	rsbvc	r6, ip, r8, ror #10
8000d628:	00000000 	andeq	r0, r0, r0
8000d62c:	70736944 	rsbsvc	r6, r3, r4, asr #18
8000d630:	7379616c 	cmnvc	r9, #108, 2
8000d634:	69687420 	stmdbvs	r8!, {r5, sl, ip, sp, lr}^
8000d638:	696c2073 	stmdbvs	ip!, {r0, r1, r4, r5, r6, sp}^
8000d63c:	6f207473 	svcvs	0x00207473
8000d640:	6f632066 	svcvs	0x00632066
8000d644:	6e616d6d 	cdpvs	13, 6, cr6, cr1, cr13, {3}
8000d648:	00007364 	andeq	r7, r0, r4, ror #6
8000d64c:	6b636162 	blvs	818e5bdc <irq_stack_start+0x188bbcc>
8000d650:	63617274 	cmnvs	r1, #116, 4	@ 0x40000007
8000d654:	00000065 	andeq	r0, r0, r5, rrx
8000d658:	70736944 	rsbsvc	r6, r3, r4, asr #18
8000d65c:	7379616c 	cmnvc	r9, #108, 2
8000d660:	65687420 	strbvs	r7, [r8, #-1056]!	@ 0xfffffbe0
8000d664:	72756320 	rsbsvc	r6, r5, #32, 6	@ 0x80000000
8000d668:	746e6572 	strbtvc	r6, [lr], #-1394	@ 0xfffffa8e
8000d66c:	61747320 	cmnvs	r4, r0, lsr #6
8000d670:	62206b63 	eorvs	r6, r0, #101376	@ 0x18c00
8000d674:	746b6361 	strbtvc	r6, [fp], #-865	@ 0xfffffc9f
8000d678:	65636172 	strbvs	r6, [r3, #-370]!	@ 0xfffffe8e
8000d67c:	00000000 	andeq	r0, r0, r0
8000d680:	74786568 	ldrbtvc	r6, [r8], #-1384	@ 0xfffffa98
8000d684:	00006565 	andeq	r6, r0, r5, ror #10
8000d688:	64616552 	strbtvs	r6, [r1], #-1362	@ 0xfffffaae
8000d68c:	72662073 	rsbvc	r2, r6, #115	@ 0x73
8000d690:	69206d6f 	stmdbvs	r0!, {r0, r1, r2, r3, r5, r6, r8, sl, fp, sp, lr}
8000d694:	7475706e 	ldrbtvc	r7, [r5], #-110	@ 0xffffff92
8000d698:	646e6120 	strbtvs	r6, [lr], #-288	@ 0xfffffee0
8000d69c:	74756f20 	ldrbtvc	r6, [r5], #-3872	@ 0xfffff0e0
8000d6a0:	73747570 	cmnvc	r4, #112, 10	@ 0x1c000000
8000d6a4:	65687420 	strbvs	r7, [r8, #-1056]!	@ 0xfffffbe0
8000d6a8:	78656820 	stmdavc	r5!, {r5, fp, sp, lr}^
8000d6ac:	63656461 	cmnvs	r5, #1627389952	@ 0x61000000
8000d6b0:	6c616d69 	stclvs	13, cr6, [r1], #-420	@ 0xfffffe5c
8000d6b4:	646f6320 	strbtvs	r6, [pc], #-800	@ 8000d6bc <SPECIAL_KEY_SEQUENCES+0x224>
8000d6b8:	00007365 	andeq	r7, r0, r5, ror #6
8000d6bc:	6e72656b 	cdpvs	5, 7, cr6, cr2, cr11, {3}
8000d6c0:	6f666e69 	svcvs	0x00666e69
8000d6c4:	00000000 	andeq	r0, r0, r0
8000d6c8:	70736944 	rsbsvc	r6, r3, r4, asr #18
8000d6cc:	7379616c 	cmnvc	r9, #108, 2
8000d6d0:	666e6920 	strbtvs	r6, [lr], -r0, lsr #18
8000d6d4:	616d726f 	cmnvs	sp, pc, ror #4
8000d6d8:	6e6f6974 			@ <UNDEFINED> instruction: 0x6e6f6974
8000d6dc:	6f626120 	svcvs	0x00626120
8000d6e0:	74207475 	strtvc	r7, [r0], #-1141	@ 0xfffffb8b
8000d6e4:	6b206568 	blvs	80826c8c <irq_stack_start+0x7ccc7c>
8000d6e8:	656e7265 	strbvs	r7, [lr, #-613]!	@ 0xfffffd9b
8000d6ec:	0000006c 	andeq	r0, r0, ip, rrx
8000d6f0:	74617473 	strbtvc	r7, [r1], #-1139	@ 0xfffffb8d
8000d6f4:	00007375 	andeq	r7, r0, r5, ror r3
8000d6f8:	70736944 	rsbsvc	r6, r3, r4, asr #18
8000d6fc:	7379616c 	cmnvc	r9, #108, 2
8000d700:	72756320 	rsbsvc	r6, r5, #32, 6	@ 0x80000000
8000d704:	746e6572 	strbtvc	r6, [lr], #-1394	@ 0xfffffa8e
8000d708:	61747320 	cmnvs	r4, r0, lsr #6
8000d70c:	20737574 	rsbscs	r7, r3, r4, ror r5
8000d710:	7420666f 	strtvc	r6, [r0], #-1647	@ 0xfffff991
8000d714:	73206568 			@ <UNDEFINED> instruction: 0x73206568
8000d718:	65747379 	ldrbvs	r7, [r4, #-889]!	@ 0xfffffc87
8000d71c:	0000006d 	andeq	r0, r0, sp, rrx
8000d720:	63657865 	cmnvs	r5, #6619136	@ 0x650000
8000d724:	00657475 	rsbeq	r7, r5, r5, ror r4
8000d728:	63657845 	cmnvs	r5, #4521984	@ 0x450000
8000d72c:	73657475 	cmnvc	r5, #1962934272	@ 0x75000000
8000d730:	75206120 	strvc	r6, [r0, #-288]!	@ 0xfffffee0
8000d734:	20726573 	rsbscs	r6, r2, r3, ror r5
8000d738:	676f7270 			@ <UNDEFINED> instruction: 0x676f7270
8000d73c:	006d6172 	rsbeq	r6, sp, r2, ror r1

8000d740 <SPECIAL_KEY_SEQUENCES>:
8000d740:	5b1b1001 	blpl	806d174c <irq_stack_start+0x67773c>
8000d744:	00000041 	andeq	r0, r0, r1, asr #32
8000d748:	5b1b1002 	blpl	806d1758 <irq_stack_start+0x677748>
8000d74c:	00000042 	andeq	r0, r0, r2, asr #32
8000d750:	5b1b1003 	blpl	806d1764 <irq_stack_start+0x677754>
8000d754:	00000043 	andeq	r0, r0, r3, asr #32
8000d758:	5b1b1004 	blpl	806d1770 <irq_stack_start+0x677760>
8000d75c:	00000044 	andeq	r0, r0, r4, asr #32
8000d760:	007f1005 	rsbseq	r1, pc, r5
8000d764:	00000000 	andeq	r0, r0, r0
8000d768:	00081005 	andeq	r1, r8, r5
8000d76c:	00000000 	andeq	r0, r0, r0
8000d770:	2d207325 	stccs	3, cr7, [r0, #-148]!	@ 0xffffff6c
8000d774:	0a732520 	beq	81cd6bfc <irq_stack_start+0x1c7cbec>
8000d778:	00000000 	andeq	r0, r0, r0
8000d77c:	706c6568 	rsbvc	r6, ip, r8, ror #10
8000d780:	00000000 	andeq	r0, r0, r0
8000d784:	70736944 	rsbsvc	r6, r3, r4, asr #18
8000d788:	7379616c 	cmnvc	r9, #108, 2
8000d78c:	69687420 	stmdbvs	r8!, {r5, sl, ip, sp, lr}^
8000d790:	696c2073 	stmdbvs	ip!, {r0, r1, r4, r5, r6, sp}^
8000d794:	6f207473 	svcvs	0x00207473
8000d798:	6f632066 	svcvs	0x00632066
8000d79c:	6e616d6d 	cdpvs	13, 6, cr6, cr1, cr13, {3}
8000d7a0:	00007364 	andeq	r7, r0, r4, ror #6
8000d7a4:	6b636162 	blvs	818e5d34 <irq_stack_start+0x188bd24>
8000d7a8:	63617274 	cmnvs	r1, #116, 4	@ 0x40000007
8000d7ac:	00000065 	andeq	r0, r0, r5, rrx
8000d7b0:	70736944 	rsbsvc	r6, r3, r4, asr #18
8000d7b4:	7379616c 	cmnvc	r9, #108, 2
8000d7b8:	65687420 	strbvs	r7, [r8, #-1056]!	@ 0xfffffbe0
8000d7bc:	72756320 	rsbsvc	r6, r5, #32, 6	@ 0x80000000
8000d7c0:	746e6572 	strbtvc	r6, [lr], #-1394	@ 0xfffffa8e
8000d7c4:	61747320 	cmnvs	r4, r0, lsr #6
8000d7c8:	62206b63 	eorvs	r6, r0, #101376	@ 0x18c00
8000d7cc:	746b6361 	strbtvc	r6, [fp], #-865	@ 0xfffffc9f
8000d7d0:	65636172 	strbvs	r6, [r3, #-370]!	@ 0xfffffe8e
8000d7d4:	00000000 	andeq	r0, r0, r0
8000d7d8:	74786568 	ldrbtvc	r6, [r8], #-1384	@ 0xfffffa98
8000d7dc:	00006565 	andeq	r6, r0, r5, ror #10
8000d7e0:	64616552 	strbtvs	r6, [r1], #-1362	@ 0xfffffaae
8000d7e4:	72662073 	rsbvc	r2, r6, #115	@ 0x73
8000d7e8:	69206d6f 	stmdbvs	r0!, {r0, r1, r2, r3, r5, r6, r8, sl, fp, sp, lr}
8000d7ec:	7475706e 	ldrbtvc	r7, [r5], #-110	@ 0xffffff92
8000d7f0:	646e6120 	strbtvs	r6, [lr], #-288	@ 0xfffffee0
8000d7f4:	74756f20 	ldrbtvc	r6, [r5], #-3872	@ 0xfffff0e0
8000d7f8:	73747570 	cmnvc	r4, #112, 10	@ 0x1c000000
8000d7fc:	65687420 	strbvs	r7, [r8, #-1056]!	@ 0xfffffbe0
8000d800:	78656820 	stmdavc	r5!, {r5, fp, sp, lr}^
8000d804:	63656461 	cmnvs	r5, #1627389952	@ 0x61000000
8000d808:	6c616d69 	stclvs	13, cr6, [r1], #-420	@ 0xfffffe5c
8000d80c:	646f6320 	strbtvs	r6, [pc], #-800	@ 8000d814 <SPECIAL_KEY_SEQUENCES+0xd4>
8000d810:	00007365 	andeq	r7, r0, r5, ror #6
8000d814:	6e72656b 	cdpvs	5, 7, cr6, cr2, cr11, {3}
8000d818:	6f666e69 	svcvs	0x00666e69
8000d81c:	00000000 	andeq	r0, r0, r0
8000d820:	70736944 	rsbsvc	r6, r3, r4, asr #18
8000d824:	7379616c 	cmnvc	r9, #108, 2
8000d828:	666e6920 	strbtvs	r6, [lr], -r0, lsr #18
8000d82c:	616d726f 	cmnvs	sp, pc, ror #4
8000d830:	6e6f6974 			@ <UNDEFINED> instruction: 0x6e6f6974
8000d834:	6f626120 	svcvs	0x00626120
8000d838:	74207475 	strtvc	r7, [r0], #-1141	@ 0xfffffb8b
8000d83c:	6b206568 	blvs	80826de4 <irq_stack_start+0x7ccdd4>
8000d840:	656e7265 	strbvs	r7, [lr, #-613]!	@ 0xfffffd9b
8000d844:	0000006c 	andeq	r0, r0, ip, rrx
8000d848:	74617473 	strbtvc	r7, [r1], #-1139	@ 0xfffffb8d
8000d84c:	00007375 	andeq	r7, r0, r5, ror r3
8000d850:	70736944 	rsbsvc	r6, r3, r4, asr #18
8000d854:	7379616c 	cmnvc	r9, #108, 2
8000d858:	72756320 	rsbsvc	r6, r5, #32, 6	@ 0x80000000
8000d85c:	746e6572 	strbtvc	r6, [lr], #-1394	@ 0xfffffa8e
8000d860:	61747320 	cmnvs	r4, r0, lsr #6
8000d864:	20737574 	rsbscs	r7, r3, r4, ror r5
8000d868:	7420666f 	strtvc	r6, [r0], #-1647	@ 0xfffff991
8000d86c:	73206568 			@ <UNDEFINED> instruction: 0x73206568
8000d870:	65747379 	ldrbvs	r7, [r4, #-889]!	@ 0xfffffc87
8000d874:	0000006d 	andeq	r0, r0, sp, rrx
8000d878:	63657865 	cmnvs	r5, #6619136	@ 0x650000
8000d87c:	00657475 	rsbeq	r7, r5, r5, ror r4
8000d880:	63657845 	cmnvs	r5, #4521984	@ 0x450000
8000d884:	73657475 	cmnvc	r5, #1962934272	@ 0x75000000
8000d888:	75206120 	strvc	r6, [r0, #-288]!	@ 0xfffffee0
8000d88c:	20726573 	rsbscs	r6, r2, r3, ror r5
8000d890:	676f7270 			@ <UNDEFINED> instruction: 0x676f7270
8000d894:	006d6172 	rsbeq	r6, sp, r2, ror r1

8000d898 <SPECIAL_KEY_SEQUENCES>:
8000d898:	5b1b1001 	blpl	806d18a4 <irq_stack_start+0x677894>
8000d89c:	00000041 	andeq	r0, r0, r1, asr #32
8000d8a0:	5b1b1002 	blpl	806d18b0 <irq_stack_start+0x6778a0>
8000d8a4:	00000042 	andeq	r0, r0, r2, asr #32
8000d8a8:	5b1b1003 	blpl	806d18bc <irq_stack_start+0x6778ac>
8000d8ac:	00000043 	andeq	r0, r0, r3, asr #32
8000d8b0:	5b1b1004 	blpl	806d18c8 <irq_stack_start+0x6778b8>
8000d8b4:	00000044 	andeq	r0, r0, r4, asr #32
8000d8b8:	007f1005 	rsbseq	r1, pc, r5
8000d8bc:	00000000 	andeq	r0, r0, r0
8000d8c0:	00081005 	andeq	r1, r8, r5
8000d8c4:	00000000 	andeq	r0, r0, r0
8000d8c8:	73657270 	cmnvc	r5, #112, 4
8000d8cc:	71272073 			@ <UNDEFINED> instruction: 0x71272073
8000d8d0:	6f742027 	svcvs	0x00742027
8000d8d4:	69786520 	ldmdbvs	r8!, {r5, r8, sl, sp, lr}^
8000d8d8:	0a202e74 	beq	808192b0 <irq_stack_start+0x7bf2a0>
8000d8dc:	00000000 	andeq	r0, r0, r0
8000d8e0:	0000000a 	andeq	r0, r0, sl
8000d8e4:	00207825 	eoreq	r7, r0, r5, lsr #16
8000d8e8:	706c6568 	rsbvc	r6, ip, r8, ror #10
8000d8ec:	00000000 	andeq	r0, r0, r0
8000d8f0:	70736944 	rsbsvc	r6, r3, r4, asr #18
8000d8f4:	7379616c 	cmnvc	r9, #108, 2
8000d8f8:	69687420 	stmdbvs	r8!, {r5, sl, ip, sp, lr}^
8000d8fc:	696c2073 	stmdbvs	ip!, {r0, r1, r4, r5, r6, sp}^
8000d900:	6f207473 	svcvs	0x00207473
8000d904:	6f632066 	svcvs	0x00632066
8000d908:	6e616d6d 	cdpvs	13, 6, cr6, cr1, cr13, {3}
8000d90c:	00007364 	andeq	r7, r0, r4, ror #6
8000d910:	6b636162 	blvs	818e5ea0 <irq_stack_start+0x188be90>
8000d914:	63617274 	cmnvs	r1, #116, 4	@ 0x40000007
8000d918:	00000065 	andeq	r0, r0, r5, rrx
8000d91c:	70736944 	rsbsvc	r6, r3, r4, asr #18
8000d920:	7379616c 	cmnvc	r9, #108, 2
8000d924:	65687420 	strbvs	r7, [r8, #-1056]!	@ 0xfffffbe0
8000d928:	72756320 	rsbsvc	r6, r5, #32, 6	@ 0x80000000
8000d92c:	746e6572 	strbtvc	r6, [lr], #-1394	@ 0xfffffa8e
8000d930:	61747320 	cmnvs	r4, r0, lsr #6
8000d934:	62206b63 	eorvs	r6, r0, #101376	@ 0x18c00
8000d938:	746b6361 	strbtvc	r6, [fp], #-865	@ 0xfffffc9f
8000d93c:	65636172 	strbvs	r6, [r3, #-370]!	@ 0xfffffe8e
8000d940:	00000000 	andeq	r0, r0, r0
8000d944:	74786568 	ldrbtvc	r6, [r8], #-1384	@ 0xfffffa98
8000d948:	00006565 	andeq	r6, r0, r5, ror #10
8000d94c:	64616552 	strbtvs	r6, [r1], #-1362	@ 0xfffffaae
8000d950:	72662073 	rsbvc	r2, r6, #115	@ 0x73
8000d954:	69206d6f 	stmdbvs	r0!, {r0, r1, r2, r3, r5, r6, r8, sl, fp, sp, lr}
8000d958:	7475706e 	ldrbtvc	r7, [r5], #-110	@ 0xffffff92
8000d95c:	646e6120 	strbtvs	r6, [lr], #-288	@ 0xfffffee0
8000d960:	74756f20 	ldrbtvc	r6, [r5], #-3872	@ 0xfffff0e0
8000d964:	73747570 	cmnvc	r4, #112, 10	@ 0x1c000000
8000d968:	65687420 	strbvs	r7, [r8, #-1056]!	@ 0xfffffbe0
8000d96c:	78656820 	stmdavc	r5!, {r5, fp, sp, lr}^
8000d970:	63656461 	cmnvs	r5, #1627389952	@ 0x61000000
8000d974:	6c616d69 	stclvs	13, cr6, [r1], #-420	@ 0xfffffe5c
8000d978:	646f6320 	strbtvs	r6, [pc], #-800	@ 8000d980 <SPECIAL_KEY_SEQUENCES+0xe8>
8000d97c:	00007365 	andeq	r7, r0, r5, ror #6
8000d980:	6e72656b 	cdpvs	5, 7, cr6, cr2, cr11, {3}
8000d984:	6f666e69 	svcvs	0x00666e69
8000d988:	00000000 	andeq	r0, r0, r0
8000d98c:	70736944 	rsbsvc	r6, r3, r4, asr #18
8000d990:	7379616c 	cmnvc	r9, #108, 2
8000d994:	666e6920 	strbtvs	r6, [lr], -r0, lsr #18
8000d998:	616d726f 	cmnvs	sp, pc, ror #4
8000d99c:	6e6f6974 			@ <UNDEFINED> instruction: 0x6e6f6974
8000d9a0:	6f626120 	svcvs	0x00626120
8000d9a4:	74207475 	strtvc	r7, [r0], #-1141	@ 0xfffffb8b
8000d9a8:	6b206568 	blvs	80826f50 <irq_stack_start+0x7ccf40>
8000d9ac:	656e7265 	strbvs	r7, [lr, #-613]!	@ 0xfffffd9b
8000d9b0:	0000006c 	andeq	r0, r0, ip, rrx
8000d9b4:	74617473 	strbtvc	r7, [r1], #-1139	@ 0xfffffb8d
8000d9b8:	00007375 	andeq	r7, r0, r5, ror r3
8000d9bc:	70736944 	rsbsvc	r6, r3, r4, asr #18
8000d9c0:	7379616c 	cmnvc	r9, #108, 2
8000d9c4:	72756320 	rsbsvc	r6, r5, #32, 6	@ 0x80000000
8000d9c8:	746e6572 	strbtvc	r6, [lr], #-1394	@ 0xfffffa8e
8000d9cc:	61747320 	cmnvs	r4, r0, lsr #6
8000d9d0:	20737574 	rsbscs	r7, r3, r4, ror r5
8000d9d4:	7420666f 	strtvc	r6, [r0], #-1647	@ 0xfffff991
8000d9d8:	73206568 			@ <UNDEFINED> instruction: 0x73206568
8000d9dc:	65747379 	ldrbvs	r7, [r4, #-889]!	@ 0xfffffc87
8000d9e0:	0000006d 	andeq	r0, r0, sp, rrx
8000d9e4:	63657865 	cmnvs	r5, #6619136	@ 0x650000
8000d9e8:	00657475 	rsbeq	r7, r5, r5, ror r4
8000d9ec:	63657845 	cmnvs	r5, #4521984	@ 0x450000
8000d9f0:	73657475 	cmnvc	r5, #1962934272	@ 0x75000000
8000d9f4:	75206120 	strvc	r6, [r0, #-288]!	@ 0xfffffee0
8000d9f8:	20726573 	rsbscs	r6, r2, r3, ror r5
8000d9fc:	676f7270 			@ <UNDEFINED> instruction: 0x676f7270
8000da00:	006d6172 	rsbeq	r6, sp, r2, ror r1

8000da04 <SPECIAL_KEY_SEQUENCES>:
8000da04:	5b1b1001 	blpl	806d1a10 <irq_stack_start+0x677a00>
8000da08:	00000041 	andeq	r0, r0, r1, asr #32
8000da0c:	5b1b1002 	blpl	806d1a1c <irq_stack_start+0x677a0c>
8000da10:	00000042 	andeq	r0, r0, r2, asr #32
8000da14:	5b1b1003 	blpl	806d1a28 <irq_stack_start+0x677a18>
8000da18:	00000043 	andeq	r0, r0, r3, asr #32
8000da1c:	5b1b1004 	blpl	806d1a34 <irq_stack_start+0x677a24>
8000da20:	00000044 	andeq	r0, r0, r4, asr #32
8000da24:	007f1005 	rsbseq	r1, pc, r5
8000da28:	00000000 	andeq	r0, r0, r0
8000da2c:	00081005 	andeq	r1, r8, r5
8000da30:	00000000 	andeq	r0, r0, r0
8000da34:	63657053 	cmnvs	r5, #83	@ 0x53
8000da38:	206c6169 	rsbcs	r6, ip, r9, ror #2
8000da3c:	6e72656b 	cdpvs	5, 7, cr6, cr2, cr11, {3}
8000da40:	73206c65 			@ <UNDEFINED> instruction: 0x73206c65
8000da44:	6f626d79 	svcvs	0x00626d79
8000da48:	0a3a736c 	beq	80eaa800 <irq_stack_start+0xe507f0>
8000da4c:	00000000 	andeq	r0, r0, r0
8000da50:	6e652020 	cdpvs	0, 6, cr2, cr5, cr0, {1}
8000da54:	20797274 	rsbscs	r7, r9, r4, ror r2
8000da58:	20782520 	rsbscs	r2, r8, r0, lsr #10
8000da5c:	79687028 	stmdbvc	r8!, {r3, r5, ip, sp, lr}^
8000da60:	000a2973 	andeq	r2, sl, r3, ror r9
8000da64:	74652020 	strbtvc	r2, [r5], #-32	@ 0xffffffe0
8000da68:	20747865 	rsbscs	r7, r4, r5, ror #16
8000da6c:	20782520 	rsbscs	r2, r8, r0, lsr #10
8000da70:	79687028 	stmdbvc	r8!, {r3, r5, ip, sp, lr}^
8000da74:	000a2973 	andeq	r2, sl, r3, ror r9
8000da78:	64652020 	strbtvs	r2, [r5], #-32	@ 0xffffffe0
8000da7c:	20617461 	rsbcs	r7, r1, r1, ror #8
8000da80:	20782520 	rsbscs	r2, r8, r0, lsr #10
8000da84:	79687028 	stmdbvc	r8!, {r3, r5, ip, sp, lr}^
8000da88:	000a2973 	andeq	r2, sl, r3, ror r9
8000da8c:	6e652020 	cdpvs	0, 6, cr2, cr5, cr0, {1}
8000da90:	20202064 	eorcs	r2, r0, r4, rrx
8000da94:	20782520 	rsbscs	r2, r8, r0, lsr #10
8000da98:	79687028 	stmdbvc	r8!, {r3, r5, ip, sp, lr}^
8000da9c:	000a2973 	andeq	r2, sl, r3, ror r9
8000daa0:	6e72654b 	cdpvs	5, 7, cr6, cr2, cr11, {2}
8000daa4:	65206c65 	strvs	r6, [r0, #-3173]!	@ 0xfffff39b
8000daa8:	75636578 	strbvc	r6, [r3, #-1400]!	@ 0xfffffa88
8000daac:	6c626174 	stclvs	1, cr6, [r2], #-464	@ 0xfffffe30
8000dab0:	656d2065 	strbvs	r2, [sp, #-101]!	@ 0xffffff9b
8000dab4:	79726f6d 	ldmdbvc	r2!, {r0, r2, r3, r5, r6, r8, r9, sl, fp, sp, lr}^
8000dab8:	6f6f6620 	svcvs	0x006f6620
8000dabc:	69727074 	ldmdbvs	r2!, {r2, r4, r5, r6, ip, sp, lr}^
8000dac0:	203a746e 	eorscs	r7, sl, lr, ror #8
8000dac4:	424b6425 	submi	r6, fp, #620756992	@ 0x25000000
8000dac8:	0000000a 	andeq	r0, r0, sl
8000dacc:	706c6568 	rsbvc	r6, ip, r8, ror #10
8000dad0:	00000000 	andeq	r0, r0, r0
8000dad4:	70736944 	rsbsvc	r6, r3, r4, asr #18
8000dad8:	7379616c 	cmnvc	r9, #108, 2
8000dadc:	69687420 	stmdbvs	r8!, {r5, sl, ip, sp, lr}^
8000dae0:	696c2073 	stmdbvs	ip!, {r0, r1, r4, r5, r6, sp}^
8000dae4:	6f207473 	svcvs	0x00207473
8000dae8:	6f632066 	svcvs	0x00632066
8000daec:	6e616d6d 	cdpvs	13, 6, cr6, cr1, cr13, {3}
8000daf0:	00007364 	andeq	r7, r0, r4, ror #6
8000daf4:	6b636162 	blvs	818e6084 <irq_stack_start+0x188c074>
8000daf8:	63617274 	cmnvs	r1, #116, 4	@ 0x40000007
8000dafc:	00000065 	andeq	r0, r0, r5, rrx
8000db00:	70736944 	rsbsvc	r6, r3, r4, asr #18
8000db04:	7379616c 	cmnvc	r9, #108, 2
8000db08:	65687420 	strbvs	r7, [r8, #-1056]!	@ 0xfffffbe0
8000db0c:	72756320 	rsbsvc	r6, r5, #32, 6	@ 0x80000000
8000db10:	746e6572 	strbtvc	r6, [lr], #-1394	@ 0xfffffa8e
8000db14:	61747320 	cmnvs	r4, r0, lsr #6
8000db18:	62206b63 	eorvs	r6, r0, #101376	@ 0x18c00
8000db1c:	746b6361 	strbtvc	r6, [fp], #-865	@ 0xfffffc9f
8000db20:	65636172 	strbvs	r6, [r3, #-370]!	@ 0xfffffe8e
8000db24:	00000000 	andeq	r0, r0, r0
8000db28:	74786568 	ldrbtvc	r6, [r8], #-1384	@ 0xfffffa98
8000db2c:	00006565 	andeq	r6, r0, r5, ror #10
8000db30:	64616552 	strbtvs	r6, [r1], #-1362	@ 0xfffffaae
8000db34:	72662073 	rsbvc	r2, r6, #115	@ 0x73
8000db38:	69206d6f 	stmdbvs	r0!, {r0, r1, r2, r3, r5, r6, r8, sl, fp, sp, lr}
8000db3c:	7475706e 	ldrbtvc	r7, [r5], #-110	@ 0xffffff92
8000db40:	646e6120 	strbtvs	r6, [lr], #-288	@ 0xfffffee0
8000db44:	74756f20 	ldrbtvc	r6, [r5], #-3872	@ 0xfffff0e0
8000db48:	73747570 	cmnvc	r4, #112, 10	@ 0x1c000000
8000db4c:	65687420 	strbvs	r7, [r8, #-1056]!	@ 0xfffffbe0
8000db50:	78656820 	stmdavc	r5!, {r5, fp, sp, lr}^
8000db54:	63656461 	cmnvs	r5, #1627389952	@ 0x61000000
8000db58:	6c616d69 	stclvs	13, cr6, [r1], #-420	@ 0xfffffe5c
8000db5c:	646f6320 	strbtvs	r6, [pc], #-800	@ 8000db64 <SPECIAL_KEY_SEQUENCES+0x160>
8000db60:	00007365 	andeq	r7, r0, r5, ror #6
8000db64:	6e72656b 	cdpvs	5, 7, cr6, cr2, cr11, {3}
8000db68:	6f666e69 	svcvs	0x00666e69
8000db6c:	00000000 	andeq	r0, r0, r0
8000db70:	70736944 	rsbsvc	r6, r3, r4, asr #18
8000db74:	7379616c 	cmnvc	r9, #108, 2
8000db78:	666e6920 	strbtvs	r6, [lr], -r0, lsr #18
8000db7c:	616d726f 	cmnvs	sp, pc, ror #4
8000db80:	6e6f6974 			@ <UNDEFINED> instruction: 0x6e6f6974
8000db84:	6f626120 	svcvs	0x00626120
8000db88:	74207475 	strtvc	r7, [r0], #-1141	@ 0xfffffb8b
8000db8c:	6b206568 	blvs	80827134 <irq_stack_start+0x7cd124>
8000db90:	656e7265 	strbvs	r7, [lr, #-613]!	@ 0xfffffd9b
8000db94:	0000006c 	andeq	r0, r0, ip, rrx
8000db98:	74617473 	strbtvc	r7, [r1], #-1139	@ 0xfffffb8d
8000db9c:	00007375 	andeq	r7, r0, r5, ror r3
8000dba0:	70736944 	rsbsvc	r6, r3, r4, asr #18
8000dba4:	7379616c 	cmnvc	r9, #108, 2
8000dba8:	72756320 	rsbsvc	r6, r5, #32, 6	@ 0x80000000
8000dbac:	746e6572 	strbtvc	r6, [lr], #-1394	@ 0xfffffa8e
8000dbb0:	61747320 	cmnvs	r4, r0, lsr #6
8000dbb4:	20737574 	rsbscs	r7, r3, r4, ror r5
8000dbb8:	7420666f 	strtvc	r6, [r0], #-1647	@ 0xfffff991
8000dbbc:	73206568 			@ <UNDEFINED> instruction: 0x73206568
8000dbc0:	65747379 	ldrbvs	r7, [r4, #-889]!	@ 0xfffffc87
8000dbc4:	0000006d 	andeq	r0, r0, sp, rrx
8000dbc8:	63657865 	cmnvs	r5, #6619136	@ 0x650000
8000dbcc:	00657475 	rsbeq	r7, r5, r5, ror r4
8000dbd0:	63657845 	cmnvs	r5, #4521984	@ 0x450000
8000dbd4:	73657475 	cmnvc	r5, #1962934272	@ 0x75000000
8000dbd8:	75206120 	strvc	r6, [r0, #-288]!	@ 0xfffffee0
8000dbdc:	20726573 	rsbscs	r6, r2, r3, ror r5
8000dbe0:	676f7270 			@ <UNDEFINED> instruction: 0x676f7270
8000dbe4:	006d6172 	rsbeq	r6, sp, r2, ror r1

8000dbe8 <SPECIAL_KEY_SEQUENCES>:
8000dbe8:	5b1b1001 	blpl	806d1bf4 <irq_stack_start+0x677be4>
8000dbec:	00000041 	andeq	r0, r0, r1, asr #32
8000dbf0:	5b1b1002 	blpl	806d1c00 <irq_stack_start+0x677bf0>
8000dbf4:	00000042 	andeq	r0, r0, r2, asr #32
8000dbf8:	5b1b1003 	blpl	806d1c0c <irq_stack_start+0x677bfc>
8000dbfc:	00000043 	andeq	r0, r0, r3, asr #32
8000dc00:	5b1b1004 	blpl	806d1c18 <irq_stack_start+0x677c08>
8000dc04:	00000044 	andeq	r0, r0, r4, asr #32
8000dc08:	007f1005 	rsbseq	r1, pc, r5
8000dc0c:	00000000 	andeq	r0, r0, r0
8000dc10:	00081005 	andeq	r1, r8, r5
8000dc14:	00000000 	andeq	r0, r0, r0
8000dc18:	72657375 	rsbvc	r7, r5, #-738197503	@ 0xd4000001
8000dc1c:	00000000 	andeq	r0, r0, r0
8000dc20:	00716966 	rsbseq	r6, r1, r6, ror #18
8000dc24:	00717269 	rsbseq	r7, r1, r9, ror #4
8000dc28:	65707573 	ldrbvs	r7, [r0, #-1395]!	@ 0xfffffa8d
8000dc2c:	73697672 	cmnvc	r9, #119537664	@ 0x7200000
8000dc30:	0000726f 	andeq	r7, r0, pc, ror #4
8000dc34:	726f6261 	rsbvc	r6, pc, #268435462	@ 0x10000006
8000dc38:	00000074 	andeq	r0, r0, r4, ror r0
8000dc3c:	65646e75 	strbvs	r6, [r4, #-3701]!	@ 0xfffff18b
8000dc40:	656e6966 	strbvs	r6, [lr, #-2406]!	@ 0xfffff69a
8000dc44:	00000064 	andeq	r0, r0, r4, rrx
8000dc48:	74737973 	ldrbtvc	r7, [r3], #-2419	@ 0xfffff68d
8000dc4c:	00006d65 	andeq	r6, r0, r5, ror #26
8000dc50:	006d7261 	rsbeq	r7, sp, r1, ror #4
8000dc54:	6d756874 	ldclvs	8, cr6, [r5, #-464]!	@ 0xfffffe30
8000dc58:	00000062 	andeq	r0, r0, r2, rrx
8000dc5c:	657a616a 	ldrbvs	r6, [sl, #-362]!	@ 0xfffffe96
8000dc60:	00656c6c 	rsbeq	r6, r5, ip, ror #24
8000dc64:	00412f4e 	subeq	r2, r1, lr, asr #30
8000dc68:	204d5241 	subcs	r5, sp, r1, asr #4
8000dc6c:	00003476 	andeq	r3, r0, r6, ror r4
8000dc70:	204d5241 	subcs	r5, sp, r1, asr #4
8000dc74:	00543476 	subseq	r3, r4, r6, ror r4
8000dc78:	204d5241 	subcs	r5, sp, r1, asr #4
8000dc7c:	00003576 	andeq	r3, r0, r6, ror r5
8000dc80:	204d5241 	subcs	r5, sp, r1, asr #4
8000dc84:	00543576 	subseq	r3, r4, r6, ror r5
8000dc88:	204d5241 	subcs	r5, sp, r1, asr #4
8000dc8c:	45543576 	ldrbmi	r3, [r4, #-1398]	@ 0xfffffa8a
8000dc90:	00000000 	andeq	r0, r0, r0
8000dc94:	204d5241 	subcs	r5, sp, r1, asr #4
8000dc98:	45543576 	ldrbmi	r3, [r4, #-1398]	@ 0xfffffa8a
8000dc9c:	0000004a 	andeq	r0, r0, sl, asr #32
8000dca0:	204d5241 	subcs	r5, sp, r1, asr #4
8000dca4:	00003676 	andeq	r3, r0, r6, ror r6
8000dca8:	204d5241 	subcs	r5, sp, r1, asr #4
8000dcac:	696d694c 	stmdbvs	sp!, {r2, r3, r6, r8, fp, sp, lr}^
8000dcb0:	00646574 	rsbeq	r6, r4, r4, ror r5
8000dcb4:	69676944 	stmdbvs	r7!, {r2, r6, r8, fp, sp, lr}^
8000dcb8:	206c6174 	rsbcs	r6, ip, r4, ror r1
8000dcbc:	69757145 	ldmdbvs	r5!, {r0, r2, r6, r8, ip, sp, lr}^
8000dcc0:	6e656d70 	mcrvs	13, 3, r6, cr5, cr0, {3}
8000dcc4:	6f432074 	svcvs	0x00432074
8000dcc8:	726f7072 	rsbvc	r7, pc, #114	@ 0x72
8000dccc:	6f697461 	svcvs	0x00697461
8000dcd0:	0000006e 	andeq	r0, r0, lr, rrx
8000dcd4:	6f746f4d 	svcvs	0x00746f4d
8000dcd8:	616c6f72 	smcvs	50930	@ 0xc6f2
8000dcdc:	46202d20 	strtmi	r2, [r0], -r0, lsr #26
8000dce0:	73656572 	cmnvc	r5, #478150656	@ 0x1c800000
8000dce4:	656c6163 	strbvs	r6, [ip, #-355]!	@ 0xfffffe9d
8000dce8:	6d655320 	stclvs	3, cr5, [r5, #-128]!	@ 0xffffff80
8000dcec:	6e6f6369 	cdpvs	3, 6, cr6, cr15, cr9, {3}
8000dcf0:	74637564 	strbtvc	r7, [r3], #-1380	@ 0xfffffa9c
8000dcf4:	4920726f 	stmdbmi	r0!, {r0, r1, r2, r3, r5, r6, r9, ip, sp, lr}
8000dcf8:	002e636e 	eoreq	r6, lr, lr, ror #6
8000dcfc:	7672614d 	ldrbtvc	r6, [r2], -sp, asr #2
8000dd00:	206c6c65 	rsbcs	r6, ip, r5, ror #24
8000dd04:	696d6553 	stmdbvs	sp!, {r0, r1, r4, r6, r8, sl, sp, lr}^
8000dd08:	646e6f63 	strbtvs	r6, [lr], #-3939	@ 0xfffff09d
8000dd0c:	6f746375 	svcvs	0x00746375
8000dd10:	6e492072 	mcrvs	0, 2, r2, cr9, cr2, {3}
8000dd14:	00002e63 	andeq	r2, r0, r3, ror #28
8000dd18:	65746e49 	ldrbvs	r6, [r4, #-3657]!	@ 0xfffff1b7
8000dd1c:	6f43206c 	svcvs	0x0043206c
8000dd20:	726f7072 	rsbvc	r7, pc, #114	@ 0x72
8000dd24:	6f697461 	svcvs	0x00697461
8000dd28:	0000006e 	andeq	r0, r0, lr, rrx
8000dd2c:	3a757063 	bcc	81d69ec0 <irq_stack_start+0x1d0feb0>
8000dd30:	706d6920 	rsbvc	r6, sp, r0, lsr #18
8000dd34:	656d656c 	strbvs	r6, [sp, #-1388]!	@ 0xfffffa94
8000dd38:	726f746e 	rsbvc	r7, pc, #1845493760	@ 0x6e000000
8000dd3c:	2c73253d 	ldclcs	5, cr2, [r3], #-244	@ 0xffffff0c
8000dd40:	63726120 	cmnvs	r2, #32, 2
8000dd44:	65746968 	ldrbvs	r6, [r4, #-2408]!	@ 0xfffff698
8000dd48:	72757463 	rsbsvc	r7, r5, #1660944384	@ 0x63000000
8000dd4c:	73253d65 			@ <UNDEFINED> instruction: 0x73253d65
8000dd50:	6170202c 	cmnvs	r0, ip, lsr #32
8000dd54:	6e5f7472 	mrcvs	4, 2, r7, cr15, cr2, {3}
8000dd58:	65626d75 	strbvs	r6, [r2, #-3445]!	@ 0xfffff28b
8000dd5c:	78253d72 	stmdavc	r5!, {r1, r4, r5, r6, r8, sl, fp, ip, sp}
8000dd60:	0000000a 	andeq	r0, r0, sl
8000dd64:	61706573 	cmnvs	r0, r3, ror r5
8000dd68:	65746172 	ldrbvs	r6, [r4, #-370]!	@ 0xfffffe8e
8000dd6c:	00000000 	andeq	r0, r0, r0
8000dd70:	66696e75 			@ <UNDEFINED> instruction: 0x66696e75
8000dd74:	00646569 	rsbeq	r6, r4, r9, ror #10
8000dd78:	68636163 	stmdavs	r3!, {r0, r1, r5, r6, r8, sp, lr}^
8000dd7c:	74203a65 	strtvc	r3, [r0], #-2661	@ 0xfffff59b
8000dd80:	3d657079 	stclcc	0, cr7, [r5, #-484]!	@ 0xfffffe1c
8000dd84:	202c7325 	eorcs	r7, ip, r5, lsr #6
8000dd88:	61746164 	cmnvs	r4, r4, ror #2
8000dd8c:	7a69735f 	bvc	81a6ab10 <irq_stack_start+0x1a10b00>
8000dd90:	64253d65 	strtvs	r3, [r5], #-3429	@ 0xfffff29b
8000dd94:	6e69202c 	cdpvs	0, 6, cr2, cr9, cr12, {1}
8000dd98:	75727473 	ldrbvc	r7, [r2, #-1139]!	@ 0xfffffb8d
8000dd9c:	6f697463 	svcvs	0x00697463
8000dda0:	69735f6e 	ldmdbvs	r3!, {r1, r2, r3, r5, r6, r8, r9, sl, fp, ip, lr}^
8000dda4:	253d657a 	ldrcs	r6, [sp, #-1402]!	@ 0xfffffa86
8000dda8:	00000a64 	andeq	r0, r0, r4, ror #20
8000ddac:	68676974 	stmdavs	r7!, {r2, r4, r5, r6, r8, fp, sp, lr}^
8000ddb0:	20796c74 	rsbscs	r6, r9, r4, ror ip
8000ddb4:	70756f63 	rsbsvc	r6, r5, r3, ror #30
8000ddb8:	2064656c 	rsbcs	r6, r4, ip, ror #10
8000ddbc:	6f6d656d 	svcvs	0x006d656d
8000ddc0:	203a7972 	eorscs	r7, sl, r2, ror r9
8000ddc4:	61746164 	cmnvs	r4, r4, ror #2
8000ddc8:	756f635f 	strbvc	r6, [pc, #-863]!	@ 8000da71 <SPECIAL_KEY_SEQUENCES+0x6d>
8000ddcc:	253d746e 	ldrcs	r7, [sp, #-1134]!	@ 0xfffffb92
8000ddd0:	69202c64 	stmdbvs	r0!, {r2, r5, r6, sl, fp, sp}
8000ddd4:	7274736e 	rsbsvc	r7, r4, #-1207959551	@ 0xb8000001
8000ddd8:	69746375 	ldmdbvs	r4!, {r0, r2, r4, r5, r6, r8, r9, sp, lr}^
8000dddc:	635f6e6f 	cmpvs	pc, #1776	@ 0x6f0
8000dde0:	746e756f 	strbtvc	r7, [lr], #-1391	@ 0xfffffa91
8000dde4:	0a64253d 	beq	819172e0 <irq_stack_start+0x18bd2d0>
8000dde8:	00000000 	andeq	r0, r0, r0
8000ddec:	6e617274 	mcrvs	2, 3, r7, cr1, cr4, {3}
8000ddf0:	74616c73 	strbtvc	r6, [r1], #-3187	@ 0xfffff38d
8000ddf4:	206e6f69 	rsbcs	r6, lr, r9, ror #30
8000ddf8:	6b6f6f6c 	blvs	81be9bb0 <irq_stack_start+0x1b8fba0>
8000ddfc:	64697361 	strbtvs	r7, [r9], #-865	@ 0xfffffc9f
8000de00:	75622065 	strbvc	r2, [r2, #-101]!	@ 0xffffff9b
8000de04:	72656666 	rsbvc	r6, r5, #106954752	@ 0x6600000
8000de08:	74203a73 	strtvc	r3, [r0], #-2675	@ 0xfffff58d
8000de0c:	3d657079 	stclcc	0, cr7, [r5, #-484]!	@ 0xfffffe1c
8000de10:	202c7325 	eorcs	r7, ip, r5, lsr #6
8000de14:	74736e69 	ldrbtvc	r6, [r3], #-3689	@ 0xfffff197
8000de18:	74637572 	strbtvc	r7, [r3], #-1394	@ 0xfffffa8e
8000de1c:	5f6e6f69 	svcpl	0x006e6f69
8000de20:	6b636f6c 	blvs	818e9bd8 <irq_stack_start+0x188fbc8>
8000de24:	64253d73 	strtvs	r3, [r5], #-3443	@ 0xfffff28d
8000de28:	6164202c 	cmnvs	r4, ip, lsr #32
8000de2c:	6c5f6174 	mrrcvs	1, 7, r6, pc, cr4	@ <UNPREDICTABLE>
8000de30:	736b636f 	cmnvc	fp, #-1140850687	@ 0xbc000001
8000de34:	0a64253d 	beq	81917330 <irq_stack_start+0x18bd320>
8000de38:	00000000 	andeq	r0, r0, r0
8000de3c:	62616e65 	rsbvs	r6, r1, #1616	@ 0x650
8000de40:	0064656c 	rsbeq	r6, r4, ip, ror #10
8000de44:	61736964 	cmnvs	r3, r4, ror #18
8000de48:	64656c62 	strbtvs	r6, [r5], #-3170	@ 0xfffff39e
8000de4c:	00000000 	andeq	r0, r0, r0
8000de50:	69727473 	ldmdbvs	r2!, {r0, r1, r4, r5, r6, sl, ip, sp, lr}^
8000de54:	00007463 	andeq	r7, r0, r3, ror #8
8000de58:	20746f6e 	rsbscs	r6, r4, lr, ror #30
8000de5c:	69727473 	ldmdbvs	r2!, {r0, r1, r4, r5, r6, sl, ip, sp, lr}^
8000de60:	00007463 	andeq	r7, r0, r3, ror #8
8000de64:	68676968 	stmdavs	r7!, {r3, r5, r6, r8, fp, sp, lr}^
8000de68:	00000000 	andeq	r0, r0, r0
8000de6c:	00776f6c 	rsbseq	r6, r7, ip, ror #30
8000de70:	746e6f63 	strbtvc	r6, [lr], #-3939	@ 0xfffff09d
8000de74:	206c6f72 	rsbcs	r6, ip, r2, ror pc
8000de78:	69676572 	stmdbvs	r7!, {r1, r4, r5, r6, r8, sl, sp, lr}^
8000de7c:	72657473 	rsbvc	r7, r5, #1929379840	@ 0x73000000
8000de80:	6d6d203a 	stclvs	0, cr2, [sp, #-232]!	@ 0xffffff18
8000de84:	73252075 			@ <UNDEFINED> instruction: 0x73252075
8000de88:	6c61202c 	stclvs	0, cr2, [r1], #-176	@ 0xffffff50
8000de8c:	6d6e6769 	stclvs	7, cr6, [lr, #-420]!	@ 0xfffffe5c
8000de90:	20746e65 	rsbscs	r6, r4, r5, ror #28
8000de94:	202c7325 	eorcs	r7, ip, r5, lsr #6
8000de98:	6420316c 	strtvs	r3, [r0], #-364	@ 0xfffffe94
8000de9c:	20617461 	rsbcs	r7, r1, r1, ror #8
8000dea0:	202c7325 	eorcs	r7, ip, r5, lsr #6
8000dea4:	6920316c 	stmdbvs	r0!, {r2, r3, r5, r6, r8, ip, sp}
8000dea8:	7274736e 	rsbsvc	r7, r4, #-1207959551	@ 0xb8000001
8000deac:	69746375 	ldmdbvs	r4!, {r0, r2, r4, r5, r6, r8, r9, sp, lr}^
8000deb0:	25206e6f 	strcs	r6, [r0, #-3695]!	@ 0xfffff191
8000deb4:	77202c73 			@ <UNDEFINED> instruction: 0x77202c73
8000deb8:	65746972 	ldrbvs	r6, [r4, #-2418]!	@ 0xfffff68e
8000debc:	75622072 	strbvc	r2, [r2, #-114]!	@ 0xffffff8e
8000dec0:	72656666 	rsbvc	r6, r5, #106954752	@ 0x6600000
8000dec4:	2c732520 	ldclcs	5, cr2, [r3], #-128	@ 0xffffff80
8000dec8:	20732520 	rsbscs	r2, r3, r0, lsr #10
8000decc:	65637865 	strbvs	r7, [r3, #-2149]!	@ 0xfffff79b
8000ded0:	6f697470 	svcvs	0x00697470
8000ded4:	6576206e 	ldrbvs	r2, [r6, #-110]!	@ 0xffffff92
8000ded8:	726f7463 	rsbvc	r7, pc, #1660944384	@ 0x63000000
8000dedc:	00000a73 	andeq	r0, r0, r3, ror sl
8000dee0:	72737063 	rsbsvc	r7, r3, #99	@ 0x63
8000dee4:	7063203a 	rsbvc	r2, r3, sl, lsr r0
8000dee8:	6f6d5f75 	svcvs	0x006d5f75
8000deec:	253d6564 	ldrcs	r6, [sp, #-1380]!	@ 0xfffffa9c
8000def0:	69202c73 	stmdbvs	r0!, {r0, r1, r4, r5, r6, sl, fp, sp}
8000def4:	7274736e 	rsbsvc	r7, r4, #-1207959551	@ 0xb8000001
8000def8:	69746375 	ldmdbvs	r4!, {r0, r2, r4, r5, r6, r8, r9, sp, lr}^
8000defc:	735f6e6f 	cmpvc	pc, #1776	@ 0x6f0
8000df00:	253d7465 	ldrcs	r7, [sp, #-1125]!	@ 0xfffffb9b
8000df04:	69202c73 	stmdbvs	r0!, {r0, r1, r4, r5, r6, sl, fp, sp}
8000df08:	253d7172 	ldrcs	r7, [sp, #-370]!	@ 0xfffffe8e
8000df0c:	66202c73 			@ <UNDEFINED> instruction: 0x66202c73
8000df10:	253d7169 	ldrcs	r7, [sp, #-361]!	@ 0xfffffe97
8000df14:	00000a73 	andeq	r0, r0, r3, ror sl
8000df18:	65707573 	ldrbvs	r7, [r0, #-1395]!	@ 0xfffffa8d
8000df1c:	73697672 	cmnvc	r9, #119537664	@ 0x7200000
8000df20:	7320726f 			@ <UNDEFINED> instruction: 0x7320726f
8000df24:	6b636174 	blvs	818e64fc <irq_stack_start+0x188c4ec>
8000df28:	696f7020 	stmdbvs	pc!, {r5, ip, sp, lr}^	@ <UNPREDICTABLE>
8000df2c:	7265746e 	rsbvc	r7, r5, #1845493760	@ 0x6e000000
8000df30:	7825203a 	stmdavc	r5!, {r1, r3, r4, r5, sp}
8000df34:	74732820 	ldrbtvc	r2, [r3], #-2080	@ 0xfffff7e0
8000df38:	29747261 	ldmdbcs	r4!, {r0, r5, r6, r9, ip, sp, lr}^
8000df3c:	7825202c 	stmdavc	r5!, {r2, r3, r5, sp}
8000df40:	75632820 	strbvc	r2, [r3, #-2080]!	@ 0xfffff7e0
8000df44:	6e657272 	mcrvs	2, 3, r7, cr5, cr2, {3}
8000df48:	202c2974 	eorcs	r2, ip, r4, ror r9
8000df4c:	28207825 	stmdacs	r0!, {r0, r2, r5, fp, ip, sp, lr}
8000df50:	657a6973 	ldrbvs	r6, [sl, #-2419]!	@ 0xfffff68d
8000df54:	00000a29 	andeq	r0, r0, r9, lsr #20
8000df58:	20717269 	rsbscs	r7, r1, r9, ror #4
8000df5c:	63617473 	cmnvs	r1, #1929379840	@ 0x73000000
8000df60:	6f70206b 	svcvs	0x0070206b
8000df64:	65746e69 	ldrbvs	r6, [r4, #-3689]!	@ 0xfffff197
8000df68:	25203a72 	strcs	r3, [r0, #-2674]!	@ 0xfffff58e
8000df6c:	73282078 			@ <UNDEFINED> instruction: 0x73282078
8000df70:	74726174 	ldrbtvc	r6, [r2], #-372	@ 0xfffffe8c
8000df74:	25202c29 	strcs	r2, [r0, #-3113]!	@ 0xfffff3d7
8000df78:	63282078 			@ <UNDEFINED> instruction: 0x63282078
8000df7c:	65727275 	ldrbvs	r7, [r2, #-629]!	@ 0xfffffd8b
8000df80:	2c29746e 	stccs	4, cr7, [r9], #-440	@ 0xfffffe48
8000df84:	20782520 	rsbscs	r2, r8, r0, lsr #10
8000df88:	7a697328 	bvc	81a6ac30 <irq_stack_start+0x1a10c20>
8000df8c:	000a2965 	andeq	r2, sl, r5, ror #18
8000df90:	65657266 	strbvs	r7, [r5, #-614]!	@ 0xfffffd9a
8000df94:	6d656d20 	stclvs	13, cr6, [r5, #-128]!	@ 0xffffff80
8000df98:	2079726f 	rsbscs	r7, r9, pc, ror #4
8000df9c:	657a6973 	ldrbvs	r6, [sl, #-2419]!	@ 0xfffff68d
8000dfa0:	6425203a 	strtvs	r2, [r5], #-58	@ 0xffffffc6
8000dfa4:	79622820 	stmdbvc	r2!, {r5, fp, sp}^
8000dfa8:	29736574 	ldmdbcs	r3!, {r2, r4, r5, r6, r8, sl, sp, lr}^
8000dfac:	0000000a 	andeq	r0, r0, sl
8000dfb0:	706c6568 	rsbvc	r6, ip, r8, ror #10
8000dfb4:	00000000 	andeq	r0, r0, r0
8000dfb8:	70736944 	rsbsvc	r6, r3, r4, asr #18
8000dfbc:	7379616c 	cmnvc	r9, #108, 2
8000dfc0:	69687420 	stmdbvs	r8!, {r5, sl, ip, sp, lr}^
8000dfc4:	696c2073 	stmdbvs	ip!, {r0, r1, r4, r5, r6, sp}^
8000dfc8:	6f207473 	svcvs	0x00207473
8000dfcc:	6f632066 	svcvs	0x00632066
8000dfd0:	6e616d6d 	cdpvs	13, 6, cr6, cr1, cr13, {3}
8000dfd4:	00007364 	andeq	r7, r0, r4, ror #6
8000dfd8:	6b636162 	blvs	818e6568 <irq_stack_start+0x188c558>
8000dfdc:	63617274 	cmnvs	r1, #116, 4	@ 0x40000007
8000dfe0:	00000065 	andeq	r0, r0, r5, rrx
8000dfe4:	70736944 	rsbsvc	r6, r3, r4, asr #18
8000dfe8:	7379616c 	cmnvc	r9, #108, 2
8000dfec:	65687420 	strbvs	r7, [r8, #-1056]!	@ 0xfffffbe0
8000dff0:	72756320 	rsbsvc	r6, r5, #32, 6	@ 0x80000000
8000dff4:	746e6572 	strbtvc	r6, [lr], #-1394	@ 0xfffffa8e
8000dff8:	61747320 	cmnvs	r4, r0, lsr #6
8000dffc:	62206b63 	eorvs	r6, r0, #101376	@ 0x18c00
8000e000:	746b6361 	strbtvc	r6, [fp], #-865	@ 0xfffffc9f
8000e004:	65636172 	strbvs	r6, [r3, #-370]!	@ 0xfffffe8e
8000e008:	00000000 	andeq	r0, r0, r0
8000e00c:	74786568 	ldrbtvc	r6, [r8], #-1384	@ 0xfffffa98
8000e010:	00006565 	andeq	r6, r0, r5, ror #10
8000e014:	64616552 	strbtvs	r6, [r1], #-1362	@ 0xfffffaae
8000e018:	72662073 	rsbvc	r2, r6, #115	@ 0x73
8000e01c:	69206d6f 	stmdbvs	r0!, {r0, r1, r2, r3, r5, r6, r8, sl, fp, sp, lr}
8000e020:	7475706e 	ldrbtvc	r7, [r5], #-110	@ 0xffffff92
8000e024:	646e6120 	strbtvs	r6, [lr], #-288	@ 0xfffffee0
8000e028:	74756f20 	ldrbtvc	r6, [r5], #-3872	@ 0xfffff0e0
8000e02c:	73747570 	cmnvc	r4, #112, 10	@ 0x1c000000
8000e030:	65687420 	strbvs	r7, [r8, #-1056]!	@ 0xfffffbe0
8000e034:	78656820 	stmdavc	r5!, {r5, fp, sp, lr}^
8000e038:	63656461 	cmnvs	r5, #1627389952	@ 0x61000000
8000e03c:	6c616d69 	stclvs	13, cr6, [r1], #-420	@ 0xfffffe5c
8000e040:	646f6320 	strbtvs	r6, [pc], #-800	@ 8000e048 <SPECIAL_KEY_SEQUENCES+0x460>
8000e044:	00007365 	andeq	r7, r0, r5, ror #6
8000e048:	6e72656b 	cdpvs	5, 7, cr6, cr2, cr11, {3}
8000e04c:	6f666e69 	svcvs	0x00666e69
8000e050:	00000000 	andeq	r0, r0, r0
8000e054:	70736944 	rsbsvc	r6, r3, r4, asr #18
8000e058:	7379616c 	cmnvc	r9, #108, 2
8000e05c:	666e6920 	strbtvs	r6, [lr], -r0, lsr #18
8000e060:	616d726f 	cmnvs	sp, pc, ror #4
8000e064:	6e6f6974 			@ <UNDEFINED> instruction: 0x6e6f6974
8000e068:	6f626120 	svcvs	0x00626120
8000e06c:	74207475 	strtvc	r7, [r0], #-1141	@ 0xfffffb8b
8000e070:	6b206568 	blvs	80827618 <irq_stack_start+0x7cd608>
8000e074:	656e7265 	strbvs	r7, [lr, #-613]!	@ 0xfffffd9b
8000e078:	0000006c 	andeq	r0, r0, ip, rrx
8000e07c:	74617473 	strbtvc	r7, [r1], #-1139	@ 0xfffffb8d
8000e080:	00007375 	andeq	r7, r0, r5, ror r3
8000e084:	70736944 	rsbsvc	r6, r3, r4, asr #18
8000e088:	7379616c 	cmnvc	r9, #108, 2
8000e08c:	72756320 	rsbsvc	r6, r5, #32, 6	@ 0x80000000
8000e090:	746e6572 	strbtvc	r6, [lr], #-1394	@ 0xfffffa8e
8000e094:	61747320 	cmnvs	r4, r0, lsr #6
8000e098:	20737574 	rsbscs	r7, r3, r4, ror r5
8000e09c:	7420666f 	strtvc	r6, [r0], #-1647	@ 0xfffff991
8000e0a0:	73206568 			@ <UNDEFINED> instruction: 0x73206568
8000e0a4:	65747379 	ldrbvs	r7, [r4, #-889]!	@ 0xfffffc87
8000e0a8:	0000006d 	andeq	r0, r0, sp, rrx
8000e0ac:	63657865 	cmnvs	r5, #6619136	@ 0x650000
8000e0b0:	00657475 	rsbeq	r7, r5, r5, ror r4
8000e0b4:	63657845 	cmnvs	r5, #4521984	@ 0x450000
8000e0b8:	73657475 	cmnvc	r5, #1962934272	@ 0x75000000
8000e0bc:	75206120 	strvc	r6, [r0, #-288]!	@ 0xfffffee0
8000e0c0:	20726573 	rsbscs	r6, r2, r3, ror r5
8000e0c4:	676f7270 			@ <UNDEFINED> instruction: 0x676f7270
8000e0c8:	006d6172 	rsbeq	r6, sp, r2, ror r1

8000e0cc <SPECIAL_KEY_SEQUENCES>:
8000e0cc:	5b1b1001 	blpl	806d20d8 <irq_stack_start+0x6780c8>
8000e0d0:	00000041 	andeq	r0, r0, r1, asr #32
8000e0d4:	5b1b1002 	blpl	806d20e4 <irq_stack_start+0x6780d4>
8000e0d8:	00000042 	andeq	r0, r0, r2, asr #32
8000e0dc:	5b1b1003 	blpl	806d20f0 <irq_stack_start+0x6780e0>
8000e0e0:	00000043 	andeq	r0, r0, r3, asr #32
8000e0e4:	5b1b1004 	blpl	806d20fc <irq_stack_start+0x6780ec>
8000e0e8:	00000044 	andeq	r0, r0, r4, asr #32
8000e0ec:	007f1005 	rsbseq	r1, pc, r5
8000e0f0:	00000000 	andeq	r0, r0, r0
8000e0f4:	00081005 	andeq	r1, r8, r5
8000e0f8:	00000000 	andeq	r0, r0, r0
8000e0fc:	00203e4b 	eoreq	r3, r0, fp, asr #28
8000e100:	6d6d6f63 	stclvs	15, cr6, [sp, #-396]!	@ 0xfffffe74
8000e104:	20646e61 	rsbcs	r6, r4, r1, ror #28
8000e108:	20746f6e 	rsbscs	r6, r4, lr, ror #30
8000e10c:	6e756f66 	cdpvs	15, 7, cr6, cr5, cr6, {3}
8000e110:	000a2e64 	andeq	r2, sl, r4, ror #28
8000e114:	00000020 	andeq	r0, r0, r0, lsr #32

8000e118 <SPECIAL_KEY_SEQUENCES>:
8000e118:	5b1b1001 	blpl	806d2124 <irq_stack_start+0x678114>
8000e11c:	00000041 	andeq	r0, r0, r1, asr #32
8000e120:	5b1b1002 	blpl	806d2130 <irq_stack_start+0x678120>
8000e124:	00000042 	andeq	r0, r0, r2, asr #32
8000e128:	5b1b1003 	blpl	806d213c <irq_stack_start+0x67812c>
8000e12c:	00000043 	andeq	r0, r0, r3, asr #32
8000e130:	5b1b1004 	blpl	806d2148 <irq_stack_start+0x678138>
8000e134:	00000044 	andeq	r0, r0, r4, asr #32
8000e138:	007f1005 	rsbseq	r1, pc, r5
8000e13c:	00000000 	andeq	r0, r0, r0
8000e140:	00081005 	andeq	r1, r8, r5
8000e144:	00000000 	andeq	r0, r0, r0
8000e148:	72657375 	rsbvc	r7, r5, #-738197503	@ 0xd4000001
8000e14c:	00000000 	andeq	r0, r0, r0
8000e150:	00716966 	rsbseq	r6, r1, r6, ror #18
8000e154:	00717269 	rsbseq	r7, r1, r9, ror #4
8000e158:	65707573 	ldrbvs	r7, [r0, #-1395]!	@ 0xfffffa8d
8000e15c:	73697672 	cmnvc	r9, #119537664	@ 0x7200000
8000e160:	0000726f 	andeq	r7, r0, pc, ror #4
8000e164:	726f6261 	rsbvc	r6, pc, #268435462	@ 0x10000006
8000e168:	00000074 	andeq	r0, r0, r4, ror r0
8000e16c:	65646e75 	strbvs	r6, [r4, #-3701]!	@ 0xfffff18b
8000e170:	656e6966 	strbvs	r6, [lr, #-2406]!	@ 0xfffff69a
8000e174:	00000064 	andeq	r0, r0, r4, rrx
8000e178:	74737973 	ldrbtvc	r7, [r3], #-2419	@ 0xfffff68d
8000e17c:	00006d65 	andeq	r6, r0, r5, ror #26
8000e180:	006d7261 	rsbeq	r7, sp, r1, ror #4
8000e184:	6d756874 	ldclvs	8, cr6, [r5, #-464]!	@ 0xfffffe30
8000e188:	00000062 	andeq	r0, r0, r2, rrx
8000e18c:	657a616a 	ldrbvs	r6, [sl, #-362]!	@ 0xfffffe96
8000e190:	00656c6c 	rsbeq	r6, r5, ip, ror #24
8000e194:	00412f4e 	subeq	r2, r1, lr, asr #30
8000e198:	204d5241 	subcs	r5, sp, r1, asr #4
8000e19c:	00003476 	andeq	r3, r0, r6, ror r4
8000e1a0:	204d5241 	subcs	r5, sp, r1, asr #4
8000e1a4:	00543476 	subseq	r3, r4, r6, ror r4
8000e1a8:	204d5241 	subcs	r5, sp, r1, asr #4
8000e1ac:	00003576 	andeq	r3, r0, r6, ror r5
8000e1b0:	204d5241 	subcs	r5, sp, r1, asr #4
8000e1b4:	00543576 	subseq	r3, r4, r6, ror r5
8000e1b8:	204d5241 	subcs	r5, sp, r1, asr #4
8000e1bc:	45543576 	ldrbmi	r3, [r4, #-1398]	@ 0xfffffa8a
8000e1c0:	00000000 	andeq	r0, r0, r0
8000e1c4:	204d5241 	subcs	r5, sp, r1, asr #4
8000e1c8:	45543576 	ldrbmi	r3, [r4, #-1398]	@ 0xfffffa8a
8000e1cc:	0000004a 	andeq	r0, r0, sl, asr #32
8000e1d0:	204d5241 	subcs	r5, sp, r1, asr #4
8000e1d4:	00003676 	andeq	r3, r0, r6, ror r6
8000e1d8:	204d5241 	subcs	r5, sp, r1, asr #4
8000e1dc:	696d694c 	stmdbvs	sp!, {r2, r3, r6, r8, fp, sp, lr}^
8000e1e0:	00646574 	rsbeq	r6, r4, r4, ror r5
8000e1e4:	69676944 	stmdbvs	r7!, {r2, r6, r8, fp, sp, lr}^
8000e1e8:	206c6174 	rsbcs	r6, ip, r4, ror r1
8000e1ec:	69757145 	ldmdbvs	r5!, {r0, r2, r6, r8, ip, sp, lr}^
8000e1f0:	6e656d70 	mcrvs	13, 3, r6, cr5, cr0, {3}
8000e1f4:	6f432074 	svcvs	0x00432074
8000e1f8:	726f7072 	rsbvc	r7, pc, #114	@ 0x72
8000e1fc:	6f697461 	svcvs	0x00697461
8000e200:	0000006e 	andeq	r0, r0, lr, rrx
8000e204:	6f746f4d 	svcvs	0x00746f4d
8000e208:	616c6f72 	smcvs	50930	@ 0xc6f2
8000e20c:	46202d20 	strtmi	r2, [r0], -r0, lsr #26
8000e210:	73656572 	cmnvc	r5, #478150656	@ 0x1c800000
8000e214:	656c6163 	strbvs	r6, [ip, #-355]!	@ 0xfffffe9d
8000e218:	6d655320 	stclvs	3, cr5, [r5, #-128]!	@ 0xffffff80
8000e21c:	6e6f6369 	cdpvs	3, 6, cr6, cr15, cr9, {3}
8000e220:	74637564 	strbtvc	r7, [r3], #-1380	@ 0xfffffa9c
8000e224:	4920726f 	stmdbmi	r0!, {r0, r1, r2, r3, r5, r6, r9, ip, sp, lr}
8000e228:	002e636e 	eoreq	r6, lr, lr, ror #6
8000e22c:	7672614d 	ldrbtvc	r6, [r2], -sp, asr #2
8000e230:	206c6c65 	rsbcs	r6, ip, r5, ror #24
8000e234:	696d6553 	stmdbvs	sp!, {r0, r1, r4, r6, r8, sl, sp, lr}^
8000e238:	646e6f63 	strbtvs	r6, [lr], #-3939	@ 0xfffff09d
8000e23c:	6f746375 	svcvs	0x00746375
8000e240:	6e492072 	mcrvs	0, 2, r2, cr9, cr2, {3}
8000e244:	00002e63 	andeq	r2, r0, r3, ror #28
8000e248:	65746e49 	ldrbvs	r6, [r4, #-3657]!	@ 0xfffff1b7
8000e24c:	6f43206c 	svcvs	0x0043206c
8000e250:	726f7072 	rsbvc	r7, pc, #114	@ 0x72
8000e254:	6f697461 	svcvs	0x00697461
8000e258:	0000006e 	andeq	r0, r0, lr, rrx
8000e25c:	706c6568 	rsbvc	r6, ip, r8, ror #10
8000e260:	00000000 	andeq	r0, r0, r0
8000e264:	70736944 	rsbsvc	r6, r3, r4, asr #18
8000e268:	7379616c 	cmnvc	r9, #108, 2
8000e26c:	69687420 	stmdbvs	r8!, {r5, sl, ip, sp, lr}^
8000e270:	696c2073 	stmdbvs	ip!, {r0, r1, r4, r5, r6, sp}^
8000e274:	6f207473 	svcvs	0x00207473
8000e278:	6f632066 	svcvs	0x00632066
8000e27c:	6e616d6d 	cdpvs	13, 6, cr6, cr1, cr13, {3}
8000e280:	00007364 	andeq	r7, r0, r4, ror #6
8000e284:	6b636162 	blvs	818e6814 <irq_stack_start+0x188c804>
8000e288:	63617274 	cmnvs	r1, #116, 4	@ 0x40000007
8000e28c:	00000065 	andeq	r0, r0, r5, rrx
8000e290:	70736944 	rsbsvc	r6, r3, r4, asr #18
8000e294:	7379616c 	cmnvc	r9, #108, 2
8000e298:	65687420 	strbvs	r7, [r8, #-1056]!	@ 0xfffffbe0
8000e29c:	72756320 	rsbsvc	r6, r5, #32, 6	@ 0x80000000
8000e2a0:	746e6572 	strbtvc	r6, [lr], #-1394	@ 0xfffffa8e
8000e2a4:	61747320 	cmnvs	r4, r0, lsr #6
8000e2a8:	62206b63 	eorvs	r6, r0, #101376	@ 0x18c00
8000e2ac:	746b6361 	strbtvc	r6, [fp], #-865	@ 0xfffffc9f
8000e2b0:	65636172 	strbvs	r6, [r3, #-370]!	@ 0xfffffe8e
8000e2b4:	00000000 	andeq	r0, r0, r0
8000e2b8:	74786568 	ldrbtvc	r6, [r8], #-1384	@ 0xfffffa98
8000e2bc:	00006565 	andeq	r6, r0, r5, ror #10
8000e2c0:	64616552 	strbtvs	r6, [r1], #-1362	@ 0xfffffaae
8000e2c4:	72662073 	rsbvc	r2, r6, #115	@ 0x73
8000e2c8:	69206d6f 	stmdbvs	r0!, {r0, r1, r2, r3, r5, r6, r8, sl, fp, sp, lr}
8000e2cc:	7475706e 	ldrbtvc	r7, [r5], #-110	@ 0xffffff92
8000e2d0:	646e6120 	strbtvs	r6, [lr], #-288	@ 0xfffffee0
8000e2d4:	74756f20 	ldrbtvc	r6, [r5], #-3872	@ 0xfffff0e0
8000e2d8:	73747570 	cmnvc	r4, #112, 10	@ 0x1c000000
8000e2dc:	65687420 	strbvs	r7, [r8, #-1056]!	@ 0xfffffbe0
8000e2e0:	78656820 	stmdavc	r5!, {r5, fp, sp, lr}^
8000e2e4:	63656461 	cmnvs	r5, #1627389952	@ 0x61000000
8000e2e8:	6c616d69 	stclvs	13, cr6, [r1], #-420	@ 0xfffffe5c
8000e2ec:	646f6320 	strbtvs	r6, [pc], #-800	@ 8000e2f4 <SPECIAL_KEY_SEQUENCES+0x1dc>
8000e2f0:	00007365 	andeq	r7, r0, r5, ror #6
8000e2f4:	6e72656b 	cdpvs	5, 7, cr6, cr2, cr11, {3}
8000e2f8:	6f666e69 	svcvs	0x00666e69
8000e2fc:	00000000 	andeq	r0, r0, r0
8000e300:	70736944 	rsbsvc	r6, r3, r4, asr #18
8000e304:	7379616c 	cmnvc	r9, #108, 2
8000e308:	666e6920 	strbtvs	r6, [lr], -r0, lsr #18
8000e30c:	616d726f 	cmnvs	sp, pc, ror #4
8000e310:	6e6f6974 			@ <UNDEFINED> instruction: 0x6e6f6974
8000e314:	6f626120 	svcvs	0x00626120
8000e318:	74207475 	strtvc	r7, [r0], #-1141	@ 0xfffffb8b
8000e31c:	6b206568 	blvs	808278c4 <irq_stack_start+0x7cd8b4>
8000e320:	656e7265 	strbvs	r7, [lr, #-613]!	@ 0xfffffd9b
8000e324:	0000006c 	andeq	r0, r0, ip, rrx
8000e328:	74617473 	strbtvc	r7, [r1], #-1139	@ 0xfffffb8d
8000e32c:	00007375 	andeq	r7, r0, r5, ror r3
8000e330:	70736944 	rsbsvc	r6, r3, r4, asr #18
8000e334:	7379616c 	cmnvc	r9, #108, 2
8000e338:	72756320 	rsbsvc	r6, r5, #32, 6	@ 0x80000000
8000e33c:	746e6572 	strbtvc	r6, [lr], #-1394	@ 0xfffffa8e
8000e340:	61747320 	cmnvs	r4, r0, lsr #6
8000e344:	20737574 	rsbscs	r7, r3, r4, ror r5
8000e348:	7420666f 	strtvc	r6, [r0], #-1647	@ 0xfffff991
8000e34c:	73206568 			@ <UNDEFINED> instruction: 0x73206568
8000e350:	65747379 	ldrbvs	r7, [r4, #-889]!	@ 0xfffffc87
8000e354:	0000006d 	andeq	r0, r0, sp, rrx
8000e358:	63657865 	cmnvs	r5, #6619136	@ 0x650000
8000e35c:	00657475 	rsbeq	r7, r5, r5, ror r4
8000e360:	63657845 	cmnvs	r5, #4521984	@ 0x450000
8000e364:	73657475 	cmnvc	r5, #1962934272	@ 0x75000000
8000e368:	75206120 	strvc	r6, [r0, #-288]!	@ 0xfffffee0
8000e36c:	20726573 	rsbscs	r6, r2, r3, ror r5
8000e370:	676f7270 			@ <UNDEFINED> instruction: 0x676f7270
8000e374:	006d6172 	rsbeq	r6, sp, r2, ror r1
8000e378:	72657375 	rsbvc	r7, r5, #-738197503	@ 0xd4000001
8000e37c:	00000000 	andeq	r0, r0, r0
8000e380:	00716966 	rsbseq	r6, r1, r6, ror #18
8000e384:	00717269 	rsbseq	r7, r1, r9, ror #4
8000e388:	65707573 	ldrbvs	r7, [r0, #-1395]!	@ 0xfffffa8d
8000e38c:	73697672 	cmnvc	r9, #119537664	@ 0x7200000
8000e390:	0000726f 	andeq	r7, r0, pc, ror #4
8000e394:	726f6261 	rsbvc	r6, pc, #268435462	@ 0x10000006
8000e398:	00000074 	andeq	r0, r0, r4, ror r0
8000e39c:	65646e75 	strbvs	r6, [r4, #-3701]!	@ 0xfffff18b
8000e3a0:	656e6966 	strbvs	r6, [lr, #-2406]!	@ 0xfffff69a
8000e3a4:	00000064 	andeq	r0, r0, r4, rrx
8000e3a8:	74737973 	ldrbtvc	r7, [r3], #-2419	@ 0xfffff68d
8000e3ac:	00006d65 	andeq	r6, r0, r5, ror #26
8000e3b0:	006d7261 	rsbeq	r7, sp, r1, ror #4
8000e3b4:	6d756874 	ldclvs	8, cr6, [r5, #-464]!	@ 0xfffffe30
8000e3b8:	00000062 	andeq	r0, r0, r2, rrx
8000e3bc:	657a616a 	ldrbvs	r6, [sl, #-362]!	@ 0xfffffe96
8000e3c0:	00656c6c 	rsbeq	r6, r5, ip, ror #24
8000e3c4:	00412f4e 	subeq	r2, r1, lr, asr #30
8000e3c8:	204d5241 	subcs	r5, sp, r1, asr #4
8000e3cc:	00003476 	andeq	r3, r0, r6, ror r4
8000e3d0:	204d5241 	subcs	r5, sp, r1, asr #4
8000e3d4:	00543476 	subseq	r3, r4, r6, ror r4
8000e3d8:	204d5241 	subcs	r5, sp, r1, asr #4
8000e3dc:	00003576 	andeq	r3, r0, r6, ror r5
8000e3e0:	204d5241 	subcs	r5, sp, r1, asr #4
8000e3e4:	00543576 	subseq	r3, r4, r6, ror r5
8000e3e8:	204d5241 	subcs	r5, sp, r1, asr #4
8000e3ec:	45543576 	ldrbmi	r3, [r4, #-1398]	@ 0xfffffa8a
8000e3f0:	00000000 	andeq	r0, r0, r0
8000e3f4:	204d5241 	subcs	r5, sp, r1, asr #4
8000e3f8:	45543576 	ldrbmi	r3, [r4, #-1398]	@ 0xfffffa8a
8000e3fc:	0000004a 	andeq	r0, r0, sl, asr #32
8000e400:	204d5241 	subcs	r5, sp, r1, asr #4
8000e404:	00003676 	andeq	r3, r0, r6, ror r6
8000e408:	204d5241 	subcs	r5, sp, r1, asr #4
8000e40c:	696d694c 	stmdbvs	sp!, {r2, r3, r6, r8, fp, sp, lr}^
8000e410:	00646574 	rsbeq	r6, r4, r4, ror r5
8000e414:	69676944 	stmdbvs	r7!, {r2, r6, r8, fp, sp, lr}^
8000e418:	206c6174 	rsbcs	r6, ip, r4, ror r1
8000e41c:	69757145 	ldmdbvs	r5!, {r0, r2, r6, r8, ip, sp, lr}^
8000e420:	6e656d70 	mcrvs	13, 3, r6, cr5, cr0, {3}
8000e424:	6f432074 	svcvs	0x00432074
8000e428:	726f7072 	rsbvc	r7, pc, #114	@ 0x72
8000e42c:	6f697461 	svcvs	0x00697461
8000e430:	0000006e 	andeq	r0, r0, lr, rrx
8000e434:	6f746f4d 	svcvs	0x00746f4d
8000e438:	616c6f72 	smcvs	50930	@ 0xc6f2
8000e43c:	46202d20 	strtmi	r2, [r0], -r0, lsr #26
8000e440:	73656572 	cmnvc	r5, #478150656	@ 0x1c800000
8000e444:	656c6163 	strbvs	r6, [ip, #-355]!	@ 0xfffffe9d
8000e448:	6d655320 	stclvs	3, cr5, [r5, #-128]!	@ 0xffffff80
8000e44c:	6e6f6369 	cdpvs	3, 6, cr6, cr15, cr9, {3}
8000e450:	74637564 	strbtvc	r7, [r3], #-1380	@ 0xfffffa9c
8000e454:	4920726f 	stmdbmi	r0!, {r0, r1, r2, r3, r5, r6, r9, ip, sp, lr}
8000e458:	002e636e 	eoreq	r6, lr, lr, ror #6
8000e45c:	7672614d 	ldrbtvc	r6, [r2], -sp, asr #2
8000e460:	206c6c65 	rsbcs	r6, ip, r5, ror #24
8000e464:	696d6553 	stmdbvs	sp!, {r0, r1, r4, r6, r8, sl, sp, lr}^
8000e468:	646e6f63 	strbtvs	r6, [lr], #-3939	@ 0xfffff09d
8000e46c:	6f746375 	svcvs	0x00746375
8000e470:	6e492072 	mcrvs	0, 2, r2, cr9, cr2, {3}
8000e474:	00002e63 	andeq	r2, r0, r3, ror #28
8000e478:	65746e49 	ldrbvs	r6, [r4, #-3657]!	@ 0xfffff1b7
8000e47c:	6f43206c 	svcvs	0x0043206c
8000e480:	726f7072 	rsbvc	r7, pc, #114	@ 0x72
8000e484:	6f697461 	svcvs	0x00697461
8000e488:	0000006e 	andeq	r0, r0, lr, rrx

8000e48c <SPECIAL_KEY_SEQUENCES>:
8000e48c:	5b1b1001 	blpl	806d2498 <irq_stack_start+0x678488>
8000e490:	00000041 	andeq	r0, r0, r1, asr #32
8000e494:	5b1b1002 	blpl	806d24a4 <irq_stack_start+0x678494>
8000e498:	00000042 	andeq	r0, r0, r2, asr #32
8000e49c:	5b1b1003 	blpl	806d24b0 <irq_stack_start+0x6784a0>
8000e4a0:	00000043 	andeq	r0, r0, r3, asr #32
8000e4a4:	5b1b1004 	blpl	806d24bc <irq_stack_start+0x6784ac>
8000e4a8:	00000044 	andeq	r0, r0, r4, asr #32
8000e4ac:	007f1005 	rsbseq	r1, pc, r5
8000e4b0:	00000000 	andeq	r0, r0, r0
8000e4b4:	00081005 	andeq	r1, r8, r5
8000e4b8:	00000000 	andeq	r0, r0, r0
8000e4bc:	494e4150 	stmdbmi	lr, {r4, r6, r8, lr}^
8000e4c0:	00000043 	andeq	r0, r0, r3, asr #32
8000e4c4:	00000076 	andeq	r0, r0, r6, ror r0
8000e4c8:	00000020 	andeq	r0, r0, r0, lsr #32
8000e4cc:	0000000a 	andeq	r0, r0, sl
8000e4d0:	202c6425 	eorcs	r6, ip, r5, lsr #8
8000e4d4:	00000069 	andeq	r0, r0, r9, rrx
8000e4d8:	00006425 	andeq	r6, r0, r5, lsr #8
8000e4dc:	72657375 	rsbvc	r7, r5, #-738197503	@ 0xd4000001
8000e4e0:	00000000 	andeq	r0, r0, r0
8000e4e4:	00716966 	rsbseq	r6, r1, r6, ror #18
8000e4e8:	00717269 	rsbseq	r7, r1, r9, ror #4
8000e4ec:	65707573 	ldrbvs	r7, [r0, #-1395]!	@ 0xfffffa8d
8000e4f0:	73697672 	cmnvc	r9, #119537664	@ 0x7200000
8000e4f4:	0000726f 	andeq	r7, r0, pc, ror #4
8000e4f8:	726f6261 	rsbvc	r6, pc, #268435462	@ 0x10000006
8000e4fc:	00000074 	andeq	r0, r0, r4, ror r0
8000e500:	65646e75 	strbvs	r6, [r4, #-3701]!	@ 0xfffff18b
8000e504:	656e6966 	strbvs	r6, [lr, #-2406]!	@ 0xfffff69a
8000e508:	00000064 	andeq	r0, r0, r4, rrx
8000e50c:	74737973 	ldrbtvc	r7, [r3], #-2419	@ 0xfffff68d
8000e510:	00006d65 	andeq	r6, r0, r5, ror #26
8000e514:	006d7261 	rsbeq	r7, sp, r1, ror #4
8000e518:	6d756874 	ldclvs	8, cr6, [r5, #-464]!	@ 0xfffffe30
8000e51c:	00000062 	andeq	r0, r0, r2, rrx
8000e520:	657a616a 	ldrbvs	r6, [sl, #-362]!	@ 0xfffffe96
8000e524:	00656c6c 	rsbeq	r6, r5, ip, ror #24
8000e528:	00412f4e 	subeq	r2, r1, lr, asr #30
8000e52c:	204d5241 	subcs	r5, sp, r1, asr #4
8000e530:	00003476 	andeq	r3, r0, r6, ror r4
8000e534:	204d5241 	subcs	r5, sp, r1, asr #4
8000e538:	00543476 	subseq	r3, r4, r6, ror r4
8000e53c:	204d5241 	subcs	r5, sp, r1, asr #4
8000e540:	00003576 	andeq	r3, r0, r6, ror r5
8000e544:	204d5241 	subcs	r5, sp, r1, asr #4
8000e548:	00543576 	subseq	r3, r4, r6, ror r5
8000e54c:	204d5241 	subcs	r5, sp, r1, asr #4
8000e550:	45543576 	ldrbmi	r3, [r4, #-1398]	@ 0xfffffa8a
8000e554:	00000000 	andeq	r0, r0, r0
8000e558:	204d5241 	subcs	r5, sp, r1, asr #4
8000e55c:	45543576 	ldrbmi	r3, [r4, #-1398]	@ 0xfffffa8a
8000e560:	0000004a 	andeq	r0, r0, sl, asr #32
8000e564:	204d5241 	subcs	r5, sp, r1, asr #4
8000e568:	00003676 	andeq	r3, r0, r6, ror r6
8000e56c:	204d5241 	subcs	r5, sp, r1, asr #4
8000e570:	696d694c 	stmdbvs	sp!, {r2, r3, r6, r8, fp, sp, lr}^
8000e574:	00646574 	rsbeq	r6, r4, r4, ror r5
8000e578:	69676944 	stmdbvs	r7!, {r2, r6, r8, fp, sp, lr}^
8000e57c:	206c6174 	rsbcs	r6, ip, r4, ror r1
8000e580:	69757145 	ldmdbvs	r5!, {r0, r2, r6, r8, ip, sp, lr}^
8000e584:	6e656d70 	mcrvs	13, 3, r6, cr5, cr0, {3}
8000e588:	6f432074 	svcvs	0x00432074
8000e58c:	726f7072 	rsbvc	r7, pc, #114	@ 0x72
8000e590:	6f697461 	svcvs	0x00697461
8000e594:	0000006e 	andeq	r0, r0, lr, rrx
8000e598:	6f746f4d 	svcvs	0x00746f4d
8000e59c:	616c6f72 	smcvs	50930	@ 0xc6f2
8000e5a0:	46202d20 	strtmi	r2, [r0], -r0, lsr #26
8000e5a4:	73656572 	cmnvc	r5, #478150656	@ 0x1c800000
8000e5a8:	656c6163 	strbvs	r6, [ip, #-355]!	@ 0xfffffe9d
8000e5ac:	6d655320 	stclvs	3, cr5, [r5, #-128]!	@ 0xffffff80
8000e5b0:	6e6f6369 	cdpvs	3, 6, cr6, cr15, cr9, {3}
8000e5b4:	74637564 	strbtvc	r7, [r3], #-1380	@ 0xfffffa9c
8000e5b8:	4920726f 	stmdbmi	r0!, {r0, r1, r2, r3, r5, r6, r9, ip, sp, lr}
8000e5bc:	002e636e 	eoreq	r6, lr, lr, ror #6
8000e5c0:	7672614d 	ldrbtvc	r6, [r2], -sp, asr #2
8000e5c4:	206c6c65 	rsbcs	r6, ip, r5, ror #24
8000e5c8:	696d6553 	stmdbvs	sp!, {r0, r1, r4, r6, r8, sl, sp, lr}^
8000e5cc:	646e6f63 	strbtvs	r6, [lr], #-3939	@ 0xfffff09d
8000e5d0:	6f746375 	svcvs	0x00746375
8000e5d4:	6e492072 	mcrvs	0, 2, r2, cr9, cr2, {3}
8000e5d8:	00002e63 	andeq	r2, r0, r3, ror #28
8000e5dc:	65746e49 	ldrbvs	r6, [r4, #-3657]!	@ 0xfffff1b7
8000e5e0:	6f43206c 	svcvs	0x0043206c
8000e5e4:	726f7072 	rsbvc	r7, pc, #114	@ 0x72
8000e5e8:	6f697461 	svcvs	0x00697461
8000e5ec:	0000006e 	andeq	r0, r0, lr, rrx
8000e5f0:	72657375 	rsbvc	r7, r5, #-738197503	@ 0xd4000001
8000e5f4:	00000000 	andeq	r0, r0, r0
8000e5f8:	00716966 	rsbseq	r6, r1, r6, ror #18
8000e5fc:	00717269 	rsbseq	r7, r1, r9, ror #4
8000e600:	65707573 	ldrbvs	r7, [r0, #-1395]!	@ 0xfffffa8d
8000e604:	73697672 	cmnvc	r9, #119537664	@ 0x7200000
8000e608:	0000726f 	andeq	r7, r0, pc, ror #4
8000e60c:	726f6261 	rsbvc	r6, pc, #268435462	@ 0x10000006
8000e610:	00000074 	andeq	r0, r0, r4, ror r0
8000e614:	65646e75 	strbvs	r6, [r4, #-3701]!	@ 0xfffff18b
8000e618:	656e6966 	strbvs	r6, [lr, #-2406]!	@ 0xfffff69a
8000e61c:	00000064 	andeq	r0, r0, r4, rrx
8000e620:	74737973 	ldrbtvc	r7, [r3], #-2419	@ 0xfffff68d
8000e624:	00006d65 	andeq	r6, r0, r5, ror #26
8000e628:	006d7261 	rsbeq	r7, sp, r1, ror #4
8000e62c:	6d756874 	ldclvs	8, cr6, [r5, #-464]!	@ 0xfffffe30
8000e630:	00000062 	andeq	r0, r0, r2, rrx
8000e634:	657a616a 	ldrbvs	r6, [sl, #-362]!	@ 0xfffffe96
8000e638:	00656c6c 	rsbeq	r6, r5, ip, ror #24
8000e63c:	00412f4e 	subeq	r2, r1, lr, asr #30
8000e640:	204d5241 	subcs	r5, sp, r1, asr #4
8000e644:	00003476 	andeq	r3, r0, r6, ror r4
8000e648:	204d5241 	subcs	r5, sp, r1, asr #4
8000e64c:	00543476 	subseq	r3, r4, r6, ror r4
8000e650:	204d5241 	subcs	r5, sp, r1, asr #4
8000e654:	00003576 	andeq	r3, r0, r6, ror r5
8000e658:	204d5241 	subcs	r5, sp, r1, asr #4
8000e65c:	00543576 	subseq	r3, r4, r6, ror r5
8000e660:	204d5241 	subcs	r5, sp, r1, asr #4
8000e664:	45543576 	ldrbmi	r3, [r4, #-1398]	@ 0xfffffa8a
8000e668:	00000000 	andeq	r0, r0, r0
8000e66c:	204d5241 	subcs	r5, sp, r1, asr #4
8000e670:	45543576 	ldrbmi	r3, [r4, #-1398]	@ 0xfffffa8a
8000e674:	0000004a 	andeq	r0, r0, sl, asr #32
8000e678:	204d5241 	subcs	r5, sp, r1, asr #4
8000e67c:	00003676 	andeq	r3, r0, r6, ror r6
8000e680:	204d5241 	subcs	r5, sp, r1, asr #4
8000e684:	696d694c 	stmdbvs	sp!, {r2, r3, r6, r8, fp, sp, lr}^
8000e688:	00646574 	rsbeq	r6, r4, r4, ror r5
8000e68c:	69676944 	stmdbvs	r7!, {r2, r6, r8, fp, sp, lr}^
8000e690:	206c6174 	rsbcs	r6, ip, r4, ror r1
8000e694:	69757145 	ldmdbvs	r5!, {r0, r2, r6, r8, ip, sp, lr}^
8000e698:	6e656d70 	mcrvs	13, 3, r6, cr5, cr0, {3}
8000e69c:	6f432074 	svcvs	0x00432074
8000e6a0:	726f7072 	rsbvc	r7, pc, #114	@ 0x72
8000e6a4:	6f697461 	svcvs	0x00697461
8000e6a8:	0000006e 	andeq	r0, r0, lr, rrx
8000e6ac:	6f746f4d 	svcvs	0x00746f4d
8000e6b0:	616c6f72 	smcvs	50930	@ 0xc6f2
8000e6b4:	46202d20 	strtmi	r2, [r0], -r0, lsr #26
8000e6b8:	73656572 	cmnvc	r5, #478150656	@ 0x1c800000
8000e6bc:	656c6163 	strbvs	r6, [ip, #-355]!	@ 0xfffffe9d
8000e6c0:	6d655320 	stclvs	3, cr5, [r5, #-128]!	@ 0xffffff80
8000e6c4:	6e6f6369 	cdpvs	3, 6, cr6, cr15, cr9, {3}
8000e6c8:	74637564 	strbtvc	r7, [r3], #-1380	@ 0xfffffa9c
8000e6cc:	4920726f 	stmdbmi	r0!, {r0, r1, r2, r3, r5, r6, r9, ip, sp, lr}
8000e6d0:	002e636e 	eoreq	r6, lr, lr, ror #6
8000e6d4:	7672614d 	ldrbtvc	r6, [r2], -sp, asr #2
8000e6d8:	206c6c65 	rsbcs	r6, ip, r5, ror #24
8000e6dc:	696d6553 	stmdbvs	sp!, {r0, r1, r4, r6, r8, sl, sp, lr}^
8000e6e0:	646e6f63 	strbtvs	r6, [lr], #-3939	@ 0xfffff09d
8000e6e4:	6f746375 	svcvs	0x00746375
8000e6e8:	6e492072 	mcrvs	0, 2, r2, cr9, cr2, {3}
8000e6ec:	00002e63 	andeq	r2, r0, r3, ror #28
8000e6f0:	65746e49 	ldrbvs	r6, [r4, #-3657]!	@ 0xfffff1b7
8000e6f4:	6f43206c 	svcvs	0x0043206c
8000e6f8:	726f7072 	rsbvc	r7, pc, #114	@ 0x72
8000e6fc:	6f697461 	svcvs	0x00697461
8000e700:	0000006e 	andeq	r0, r0, lr, rrx
8000e704:	72657375 	rsbvc	r7, r5, #-738197503	@ 0xd4000001
8000e708:	00000000 	andeq	r0, r0, r0
8000e70c:	00716966 	rsbseq	r6, r1, r6, ror #18
8000e710:	00717269 	rsbseq	r7, r1, r9, ror #4
8000e714:	65707573 	ldrbvs	r7, [r0, #-1395]!	@ 0xfffffa8d
8000e718:	73697672 	cmnvc	r9, #119537664	@ 0x7200000
8000e71c:	0000726f 	andeq	r7, r0, pc, ror #4
8000e720:	726f6261 	rsbvc	r6, pc, #268435462	@ 0x10000006
8000e724:	00000074 	andeq	r0, r0, r4, ror r0
8000e728:	65646e75 	strbvs	r6, [r4, #-3701]!	@ 0xfffff18b
8000e72c:	656e6966 	strbvs	r6, [lr, #-2406]!	@ 0xfffff69a
8000e730:	00000064 	andeq	r0, r0, r4, rrx
8000e734:	74737973 	ldrbtvc	r7, [r3], #-2419	@ 0xfffff68d
8000e738:	00006d65 	andeq	r6, r0, r5, ror #26
8000e73c:	006d7261 	rsbeq	r7, sp, r1, ror #4
8000e740:	6d756874 	ldclvs	8, cr6, [r5, #-464]!	@ 0xfffffe30
8000e744:	00000062 	andeq	r0, r0, r2, rrx
8000e748:	657a616a 	ldrbvs	r6, [sl, #-362]!	@ 0xfffffe96
8000e74c:	00656c6c 	rsbeq	r6, r5, ip, ror #24
8000e750:	00412f4e 	subeq	r2, r1, lr, asr #30
8000e754:	204d5241 	subcs	r5, sp, r1, asr #4
8000e758:	00003476 	andeq	r3, r0, r6, ror r4
8000e75c:	204d5241 	subcs	r5, sp, r1, asr #4
8000e760:	00543476 	subseq	r3, r4, r6, ror r4
8000e764:	204d5241 	subcs	r5, sp, r1, asr #4
8000e768:	00003576 	andeq	r3, r0, r6, ror r5
8000e76c:	204d5241 	subcs	r5, sp, r1, asr #4
8000e770:	00543576 	subseq	r3, r4, r6, ror r5
8000e774:	204d5241 	subcs	r5, sp, r1, asr #4
8000e778:	45543576 	ldrbmi	r3, [r4, #-1398]	@ 0xfffffa8a
8000e77c:	00000000 	andeq	r0, r0, r0
8000e780:	204d5241 	subcs	r5, sp, r1, asr #4
8000e784:	45543576 	ldrbmi	r3, [r4, #-1398]	@ 0xfffffa8a
8000e788:	0000004a 	andeq	r0, r0, sl, asr #32
8000e78c:	204d5241 	subcs	r5, sp, r1, asr #4
8000e790:	00003676 	andeq	r3, r0, r6, ror r6
8000e794:	204d5241 	subcs	r5, sp, r1, asr #4
8000e798:	696d694c 	stmdbvs	sp!, {r2, r3, r6, r8, fp, sp, lr}^
8000e79c:	00646574 	rsbeq	r6, r4, r4, ror r5
8000e7a0:	69676944 	stmdbvs	r7!, {r2, r6, r8, fp, sp, lr}^
8000e7a4:	206c6174 	rsbcs	r6, ip, r4, ror r1
8000e7a8:	69757145 	ldmdbvs	r5!, {r0, r2, r6, r8, ip, sp, lr}^
8000e7ac:	6e656d70 	mcrvs	13, 3, r6, cr5, cr0, {3}
8000e7b0:	6f432074 	svcvs	0x00432074
8000e7b4:	726f7072 	rsbvc	r7, pc, #114	@ 0x72
8000e7b8:	6f697461 	svcvs	0x00697461
8000e7bc:	0000006e 	andeq	r0, r0, lr, rrx
8000e7c0:	6f746f4d 	svcvs	0x00746f4d
8000e7c4:	616c6f72 	smcvs	50930	@ 0xc6f2
8000e7c8:	46202d20 	strtmi	r2, [r0], -r0, lsr #26
8000e7cc:	73656572 	cmnvc	r5, #478150656	@ 0x1c800000
8000e7d0:	656c6163 	strbvs	r6, [ip, #-355]!	@ 0xfffffe9d
8000e7d4:	6d655320 	stclvs	3, cr5, [r5, #-128]!	@ 0xffffff80
8000e7d8:	6e6f6369 	cdpvs	3, 6, cr6, cr15, cr9, {3}
8000e7dc:	74637564 	strbtvc	r7, [r3], #-1380	@ 0xfffffa9c
8000e7e0:	4920726f 	stmdbmi	r0!, {r0, r1, r2, r3, r5, r6, r9, ip, sp, lr}
8000e7e4:	002e636e 	eoreq	r6, lr, lr, ror #6
8000e7e8:	7672614d 	ldrbtvc	r6, [r2], -sp, asr #2
8000e7ec:	206c6c65 	rsbcs	r6, ip, r5, ror #24
8000e7f0:	696d6553 	stmdbvs	sp!, {r0, r1, r4, r6, r8, sl, sp, lr}^
8000e7f4:	646e6f63 	strbtvs	r6, [lr], #-3939	@ 0xfffff09d
8000e7f8:	6f746375 	svcvs	0x00746375
8000e7fc:	6e492072 	mcrvs	0, 2, r2, cr9, cr2, {3}
8000e800:	00002e63 	andeq	r2, r0, r3, ror #28
8000e804:	65746e49 	ldrbvs	r6, [r4, #-3657]!	@ 0xfffff1b7
8000e808:	6f43206c 	svcvs	0x0043206c
8000e80c:	726f7072 	rsbvc	r7, pc, #114	@ 0x72
8000e810:	6f697461 	svcvs	0x00697461
8000e814:	0000006e 	andeq	r0, r0, lr, rrx
8000e818:	72657375 	rsbvc	r7, r5, #-738197503	@ 0xd4000001
8000e81c:	00000000 	andeq	r0, r0, r0
8000e820:	00716966 	rsbseq	r6, r1, r6, ror #18
8000e824:	00717269 	rsbseq	r7, r1, r9, ror #4
8000e828:	65707573 	ldrbvs	r7, [r0, #-1395]!	@ 0xfffffa8d
8000e82c:	73697672 	cmnvc	r9, #119537664	@ 0x7200000
8000e830:	0000726f 	andeq	r7, r0, pc, ror #4
8000e834:	726f6261 	rsbvc	r6, pc, #268435462	@ 0x10000006
8000e838:	00000074 	andeq	r0, r0, r4, ror r0
8000e83c:	65646e75 	strbvs	r6, [r4, #-3701]!	@ 0xfffff18b
8000e840:	656e6966 	strbvs	r6, [lr, #-2406]!	@ 0xfffff69a
8000e844:	00000064 	andeq	r0, r0, r4, rrx
8000e848:	74737973 	ldrbtvc	r7, [r3], #-2419	@ 0xfffff68d
8000e84c:	00006d65 	andeq	r6, r0, r5, ror #26
8000e850:	006d7261 	rsbeq	r7, sp, r1, ror #4
8000e854:	6d756874 	ldclvs	8, cr6, [r5, #-464]!	@ 0xfffffe30
8000e858:	00000062 	andeq	r0, r0, r2, rrx
8000e85c:	657a616a 	ldrbvs	r6, [sl, #-362]!	@ 0xfffffe96
8000e860:	00656c6c 	rsbeq	r6, r5, ip, ror #24
8000e864:	00412f4e 	subeq	r2, r1, lr, asr #30
8000e868:	204d5241 	subcs	r5, sp, r1, asr #4
8000e86c:	00003476 	andeq	r3, r0, r6, ror r4
8000e870:	204d5241 	subcs	r5, sp, r1, asr #4
8000e874:	00543476 	subseq	r3, r4, r6, ror r4
8000e878:	204d5241 	subcs	r5, sp, r1, asr #4
8000e87c:	00003576 	andeq	r3, r0, r6, ror r5
8000e880:	204d5241 	subcs	r5, sp, r1, asr #4
8000e884:	00543576 	subseq	r3, r4, r6, ror r5
8000e888:	204d5241 	subcs	r5, sp, r1, asr #4
8000e88c:	45543576 	ldrbmi	r3, [r4, #-1398]	@ 0xfffffa8a
8000e890:	00000000 	andeq	r0, r0, r0
8000e894:	204d5241 	subcs	r5, sp, r1, asr #4
8000e898:	45543576 	ldrbmi	r3, [r4, #-1398]	@ 0xfffffa8a
8000e89c:	0000004a 	andeq	r0, r0, sl, asr #32
8000e8a0:	204d5241 	subcs	r5, sp, r1, asr #4
8000e8a4:	00003676 	andeq	r3, r0, r6, ror r6
8000e8a8:	204d5241 	subcs	r5, sp, r1, asr #4
8000e8ac:	696d694c 	stmdbvs	sp!, {r2, r3, r6, r8, fp, sp, lr}^
8000e8b0:	00646574 	rsbeq	r6, r4, r4, ror r5
8000e8b4:	69676944 	stmdbvs	r7!, {r2, r6, r8, fp, sp, lr}^
8000e8b8:	206c6174 	rsbcs	r6, ip, r4, ror r1
8000e8bc:	69757145 	ldmdbvs	r5!, {r0, r2, r6, r8, ip, sp, lr}^
8000e8c0:	6e656d70 	mcrvs	13, 3, r6, cr5, cr0, {3}
8000e8c4:	6f432074 	svcvs	0x00432074
8000e8c8:	726f7072 	rsbvc	r7, pc, #114	@ 0x72
8000e8cc:	6f697461 	svcvs	0x00697461
8000e8d0:	0000006e 	andeq	r0, r0, lr, rrx
8000e8d4:	6f746f4d 	svcvs	0x00746f4d
8000e8d8:	616c6f72 	smcvs	50930	@ 0xc6f2
8000e8dc:	46202d20 	strtmi	r2, [r0], -r0, lsr #26
8000e8e0:	73656572 	cmnvc	r5, #478150656	@ 0x1c800000
8000e8e4:	656c6163 	strbvs	r6, [ip, #-355]!	@ 0xfffffe9d
8000e8e8:	6d655320 	stclvs	3, cr5, [r5, #-128]!	@ 0xffffff80
8000e8ec:	6e6f6369 	cdpvs	3, 6, cr6, cr15, cr9, {3}
8000e8f0:	74637564 	strbtvc	r7, [r3], #-1380	@ 0xfffffa9c
8000e8f4:	4920726f 	stmdbmi	r0!, {r0, r1, r2, r3, r5, r6, r9, ip, sp, lr}
8000e8f8:	002e636e 	eoreq	r6, lr, lr, ror #6
8000e8fc:	7672614d 	ldrbtvc	r6, [r2], -sp, asr #2
8000e900:	206c6c65 	rsbcs	r6, ip, r5, ror #24
8000e904:	696d6553 	stmdbvs	sp!, {r0, r1, r4, r6, r8, sl, sp, lr}^
8000e908:	646e6f63 	strbtvs	r6, [lr], #-3939	@ 0xfffff09d
8000e90c:	6f746375 	svcvs	0x00746375
8000e910:	6e492072 	mcrvs	0, 2, r2, cr9, cr2, {3}
8000e914:	00002e63 	andeq	r2, r0, r3, ror #28
8000e918:	65746e49 	ldrbvs	r6, [r4, #-3657]!	@ 0xfffff1b7
8000e91c:	6f43206c 	svcvs	0x0043206c
8000e920:	726f7072 	rsbvc	r7, pc, #114	@ 0x72
8000e924:	6f697461 	svcvs	0x00697461
8000e928:	0000006e 	andeq	r0, r0, lr, rrx

8000e92c <SPECIAL_KEY_SEQUENCES>:
8000e92c:	5b1b1001 	blpl	806d2938 <irq_stack_start+0x678928>
8000e930:	00000041 	andeq	r0, r0, r1, asr #32
8000e934:	5b1b1002 	blpl	806d2944 <irq_stack_start+0x678934>
8000e938:	00000042 	andeq	r0, r0, r2, asr #32
8000e93c:	5b1b1003 	blpl	806d2950 <irq_stack_start+0x678940>
8000e940:	00000043 	andeq	r0, r0, r3, asr #32
8000e944:	5b1b1004 	blpl	806d295c <irq_stack_start+0x67894c>
8000e948:	00000044 	andeq	r0, r0, r4, asr #32
8000e94c:	007f1005 	rsbseq	r1, pc, r5
8000e950:	00000000 	andeq	r0, r0, r0
8000e954:	00081005 	andeq	r1, r8, r5
8000e958:	00000000 	andeq	r0, r0, r0

8000e95c <SPECIAL_KEY_SEQUENCES>:
8000e95c:	5b1b1001 	blpl	806d2968 <irq_stack_start+0x678958>
8000e960:	00000041 	andeq	r0, r0, r1, asr #32
8000e964:	5b1b1002 	blpl	806d2974 <irq_stack_start+0x678964>
8000e968:	00000042 	andeq	r0, r0, r2, asr #32
8000e96c:	5b1b1003 	blpl	806d2980 <irq_stack_start+0x678970>
8000e970:	00000043 	andeq	r0, r0, r3, asr #32
8000e974:	5b1b1004 	blpl	806d298c <irq_stack_start+0x67897c>
8000e978:	00000044 	andeq	r0, r0, r4, asr #32
8000e97c:	007f1005 	rsbseq	r1, pc, r5
8000e980:	00000000 	andeq	r0, r0, r0
8000e984:	00081005 	andeq	r1, r8, r5
8000e988:	00000000 	andeq	r0, r0, r0

8000e98c <SPECIAL_KEY_SEQUENCES>:
8000e98c:	5b1b1001 	blpl	806d2998 <irq_stack_start+0x678988>
8000e990:	00000041 	andeq	r0, r0, r1, asr #32
8000e994:	5b1b1002 	blpl	806d29a4 <irq_stack_start+0x678994>
8000e998:	00000042 	andeq	r0, r0, r2, asr #32
8000e99c:	5b1b1003 	blpl	806d29b0 <irq_stack_start+0x6789a0>
8000e9a0:	00000043 	andeq	r0, r0, r3, asr #32
8000e9a4:	5b1b1004 	blpl	806d29bc <irq_stack_start+0x6789ac>
8000e9a8:	00000044 	andeq	r0, r0, r4, asr #32
8000e9ac:	007f1005 	rsbseq	r1, pc, r5
8000e9b0:	00000000 	andeq	r0, r0, r0
8000e9b4:	00081005 	andeq	r1, r8, r5
8000e9b8:	00000000 	andeq	r0, r0, r0

8000e9bc <SPECIAL_KEY_SEQUENCES>:
8000e9bc:	5b1b1001 	blpl	806d29c8 <irq_stack_start+0x6789b8>
8000e9c0:	00000041 	andeq	r0, r0, r1, asr #32
8000e9c4:	5b1b1002 	blpl	806d29d4 <irq_stack_start+0x6789c4>
8000e9c8:	00000042 	andeq	r0, r0, r2, asr #32
8000e9cc:	5b1b1003 	blpl	806d29e0 <irq_stack_start+0x6789d0>
8000e9d0:	00000043 	andeq	r0, r0, r3, asr #32
8000e9d4:	5b1b1004 	blpl	806d29ec <irq_stack_start+0x6789dc>
8000e9d8:	00000044 	andeq	r0, r0, r4, asr #32
8000e9dc:	007f1005 	rsbseq	r1, pc, r5
8000e9e0:	00000000 	andeq	r0, r0, r0
8000e9e4:	00081005 	andeq	r1, r8, r5
8000e9e8:	00000000 	andeq	r0, r0, r0
8000e9ec:	45464850 	strbmi	r4, [r6, #-2128]	@ 0xfffff7b0
8000e9f0:	4547454d 	strbmi	r4, [r7, #-1357]	@ 0xfffffab3
8000e9f4:	41424142 	cmpmi	r2, r2, asr #2
8000e9f8:	41414142 	cmpmi	r1, r2, asr #2
8000e9fc:	41414141 	cmpmi	r1, r1, asr #2
8000ea00:	41414141 	cmpmi	r1, r1, asr #2
8000ea04:	41414141 	cmpmi	r1, r1, asr #2
8000ea08:	41414141 	cmpmi	r1, r1, asr #2
8000ea0c:	41414143 	cmpmi	r1, r3, asr #2
8000ea10:	41414349 	cmpmi	r1, r9, asr #6
8000ea14:	41414142 	cmpmi	r1, r2, asr #2
8000ea18:	41414141 	cmpmi	r1, r1, asr #2
8000ea1c:	41424141 	cmpmi	r2, r1, asr #2
8000ea20:	41414141 	cmpmi	r1, r1, asr #2
8000ea24:	41414445 	cmpmi	r1, r5, asr #8
8000ea28:	41414141 	cmpmi	r1, r1, asr #2
8000ea2c:	42424a45 	submi	r4, r2, #282624	@ 0x45000
8000ea30:	41414141 	cmpmi	r1, r1, asr #2
8000ea34:	41434141 	cmpmi	r3, r1, asr #2
8000ea38:	41464141 	cmpmi	r6, r1, asr #2
8000ea3c:	41414445 	cmpmi	r1, r5, asr #8
8000ea40:	41414341 	cmpmi	r1, r1, asr #6
8000ea44:	41414143 	cmpmi	r1, r3, asr #2
8000ea48:	41414349 	cmpmi	r1, r9, asr #6
8000ea4c:	4141414c 	cmpmi	r1, ip, asr #2
8000ea50:	4141414b 	cmpmi	r1, fp, asr #2
8000ea54:	41414142 	cmpmi	r1, r2, asr #2
8000ea58:	41414141 	cmpmi	r1, r1, asr #2
8000ea5c:	41414141 	cmpmi	r1, r1, asr #2
8000ea60:	41414141 	cmpmi	r1, r1, asr #2
8000ea64:	41414141 	cmpmi	r1, r1, asr #2
8000ea68:	41414141 	cmpmi	r1, r1, asr #2
8000ea6c:	41414141 	cmpmi	r1, r1, asr #2
8000ea70:	41414141 	cmpmi	r1, r1, asr #2
8000ea74:	414c4e46 	cmpmi	ip, r6, asr #28
8000ea78:	41414141 	cmpmi	r1, r1, asr #2
8000ea7c:	414c4e46 	cmpmi	ip, r6, asr #28
8000ea80:	41414141 	cmpmi	r1, r1, asr #2
8000ea84:	41414146 	cmpmi	r1, r6, asr #2
8000ea88:	41414141 	cmpmi	r1, r1, asr #2
8000ea8c:	42414141 	submi	r4, r1, #1073741840	@ 0x40000010
8000ea90:	41414141 	cmpmi	r1, r1, asr #2
8000ea94:	41414142 	cmpmi	r1, r2, asr #2
8000ea98:	41414141 	cmpmi	r1, r1, asr #2
8000ea9c:	414c4e49 	cmpmi	ip, r9, asr #28
8000eaa0:	41414141 	cmpmi	r1, r1, asr #2
8000eaa4:	424c4e49 	submi	r4, ip, #1168	@ 0x490
8000eaa8:	41414141 	cmpmi	r1, r1, asr #2
8000eaac:	424c4e49 	submi	r4, ip, #1168	@ 0x490
8000eab0:	41414141 	cmpmi	r1, r1, asr #2
8000eab4:	41414245 	cmpmi	r1, r5, asr #4
8000eab8:	41414141 	cmpmi	r1, r1, asr #2
8000eabc:	41414245 	cmpmi	r1, r5, asr #4
8000eac0:	41414141 	cmpmi	r1, r1, asr #2
8000eac4:	41414147 	cmpmi	r1, r7, asr #2
8000eac8:	41414141 	cmpmi	r1, r1, asr #2
8000eacc:	42414141 	submi	r4, r1, #1073741840	@ 0x40000010
8000ead0:	41414141 	cmpmi	r1, r1, asr #2
8000ead4:	41414141 	cmpmi	r1, r1, asr #2
8000ead8:	41414141 	cmpmi	r1, r1, asr #2
8000eadc:	41414141 	cmpmi	r1, r1, asr #2
8000eae0:	41414141 	cmpmi	r1, r1, asr #2
8000eae4:	41414141 	cmpmi	r1, r1, asr #2
8000eae8:	41414141 	cmpmi	r1, r1, asr #2
8000eaec:	41414141 	cmpmi	r1, r1, asr #2
8000eaf0:	41414141 	cmpmi	r1, r1, asr #2
8000eaf4:	41414141 	cmpmi	r1, r1, asr #2
8000eaf8:	41414141 	cmpmi	r1, r1, asr #2
8000eafc:	41414141 	cmpmi	r1, r1, asr #2
8000eb00:	41414141 	cmpmi	r1, r1, asr #2
8000eb04:	41414141 	cmpmi	r1, r1, asr #2
8000eb08:	41414141 	cmpmi	r1, r1, asr #2
8000eb0c:	41414141 	cmpmi	r1, r1, asr #2
8000eb10:	41414141 	cmpmi	r1, r1, asr #2
8000eb14:	41414141 	cmpmi	r1, r1, asr #2
8000eb18:	41414141 	cmpmi	r1, r1, asr #2
8000eb1c:	41414141 	cmpmi	r1, r1, asr #2
8000eb20:	41414141 	cmpmi	r1, r1, asr #2
8000eb24:	41414141 	cmpmi	r1, r1, asr #2
8000eb28:	41414141 	cmpmi	r1, r1, asr #2
8000eb2c:	41414141 	cmpmi	r1, r1, asr #2
8000eb30:	41414141 	cmpmi	r1, r1, asr #2
8000eb34:	41414141 	cmpmi	r1, r1, asr #2
8000eb38:	41414141 	cmpmi	r1, r1, asr #2
8000eb3c:	41414141 	cmpmi	r1, r1, asr #2
8000eb40:	41414141 	cmpmi	r1, r1, asr #2
8000eb44:	41414141 	cmpmi	r1, r1, asr #2
8000eb48:	41414141 	cmpmi	r1, r1, asr #2
8000eb4c:	41414141 	cmpmi	r1, r1, asr #2
8000eb50:	41414141 	cmpmi	r1, r1, asr #2
8000eb54:	41414141 	cmpmi	r1, r1, asr #2
8000eb58:	41414141 	cmpmi	r1, r1, asr #2
8000eb5c:	41414141 	cmpmi	r1, r1, asr #2
8000eb60:	41414141 	cmpmi	r1, r1, asr #2
8000eb64:	41414141 	cmpmi	r1, r1, asr #2
8000eb68:	41414141 	cmpmi	r1, r1, asr #2
8000eb6c:	41414141 	cmpmi	r1, r1, asr #2
8000eb70:	41414141 	cmpmi	r1, r1, asr #2
8000eb74:	41414141 	cmpmi	r1, r1, asr #2
8000eb78:	41414141 	cmpmi	r1, r1, asr #2
8000eb7c:	41414141 	cmpmi	r1, r1, asr #2
8000eb80:	41414141 	cmpmi	r1, r1, asr #2
8000eb84:	41414141 	cmpmi	r1, r1, asr #2
8000eb88:	41414141 	cmpmi	r1, r1, asr #2
8000eb8c:	41414141 	cmpmi	r1, r1, asr #2
8000eb90:	41414141 	cmpmi	r1, r1, asr #2
8000eb94:	41414141 	cmpmi	r1, r1, asr #2
8000eb98:	41414141 	cmpmi	r1, r1, asr #2
8000eb9c:	41414141 	cmpmi	r1, r1, asr #2
8000eba0:	41414141 	cmpmi	r1, r1, asr #2
8000eba4:	41414141 	cmpmi	r1, r1, asr #2
8000eba8:	41414141 	cmpmi	r1, r1, asr #2
8000ebac:	41414141 	cmpmi	r1, r1, asr #2
8000ebb0:	41414141 	cmpmi	r1, r1, asr #2
8000ebb4:	41414141 	cmpmi	r1, r1, asr #2
8000ebb8:	41414141 	cmpmi	r1, r1, asr #2
8000ebbc:	41414141 	cmpmi	r1, r1, asr #2
8000ebc0:	41414141 	cmpmi	r1, r1, asr #2
8000ebc4:	41414141 	cmpmi	r1, r1, asr #2
8000ebc8:	41414141 	cmpmi	r1, r1, asr #2
8000ebcc:	41414141 	cmpmi	r1, r1, asr #2
8000ebd0:	41414141 	cmpmi	r1, r1, asr #2
8000ebd4:	41414141 	cmpmi	r1, r1, asr #2
8000ebd8:	41414141 	cmpmi	r1, r1, asr #2
8000ebdc:	41414141 	cmpmi	r1, r1, asr #2
8000ebe0:	41414141 	cmpmi	r1, r1, asr #2
8000ebe4:	41414141 	cmpmi	r1, r1, asr #2
8000ebe8:	41414141 	cmpmi	r1, r1, asr #2
8000ebec:	4d41414e 	stclmi	1, cr4, [r1, #-312]	@ 0xfffffec8
8000ebf0:	4f424b41 	svcmi	0x00424b41
8000ebf4:	4e494241 	cdpmi	2, 4, cr4, cr9, cr1, {2}
8000ebf8:	4f4a434e 	svcmi	0x004a434e
8000ebfc:	4c414145 	mcrrmi	1, 4, r4, r1, cr5
8000ec00:	4f43454d 	svcmi	0x0043454d
8000ec04:	4e41494d 	vmlsmi.f16	s9, s2, s26	@ <UNPREDICTABLE>
8000ec08:	4f43454e 	svcmi	0x0043454e
8000ec0c:	45414b49 	strbmi	r4, [r1, #-2889]	@ 0xfffff4b7
8000ec10:	4f464a50 	svcmi	0x00464a50
8000ec14:	45414145 	strbmi	r4, [r1, #-325]	@ 0xfffffebb
8000ec18:	4f414950 	svcmi	0x00414950
8000ec1c:	44414141 	strbmi	r4, [r1], #-321	@ 0xfffffebf
8000ec20:	4f444b41 	svcmi	0x00444b41
8000ec24:	44414249 	strbmi	r4, [r1], #-585	@ 0xfffffdb7
8000ec28:	4f46414c 	svcmi	0x0046414c
8000ec2c:	44414141 	strbmi	r4, [r1], #-321	@ 0xfffffebf
8000ec30:	4f444b41 	svcmi	0x00444b41
8000ec34:	4441424d 	strbmi	r4, [r1], #-589	@ 0xfffffdb3
8000ec38:	4f46414c 	svcmi	0x0046414c
8000ec3c:	44414a45 	strbmi	r4, [r1], #-2629	@ 0xfffff5bb
8000ec40:	4f464a50 	svcmi	0x00464a50
8000ec44:	44414144 	strbmi	r4, [r1], #-324	@ 0xfffffebc
8000ec48:	4f414950 	svcmi	0x00414950
8000ec4c:	42414144 	submi	r4, r1, #68, 2
8000ec50:	4f424b41 	svcmi	0x00424b41
8000ec54:	4441494d 	strbmi	r4, [r1], #-2381	@ 0xfffff6b3
8000ec58:	4f464a50 	svcmi	0x00464a50
8000ec5c:	44414144 	strbmi	r4, [r1], #-324	@ 0xfffffebc
8000ec60:	4f484a45 	svcmi	0x00484a45
8000ec64:	41414144 	cmpmi	r1, r4, asr #2
8000ec68:	4f424b41 	svcmi	0x00424b41
8000ec6c:	41414f4f 	cmpmi	r1, pc, asr #30
8000ec70:	4f4c4141 	svcmi	0x004c4141
8000ec74:	44414a4d 	strbmi	r4, [r1], #-2637	@ 0xfffff5b3
8000ec78:	4f43454c 	svcmi	0x0043454c
8000ec7c:	43414144 	movtmi	r4, #4420	@ 0x1144
8000ec80:	4f424b41 	svcmi	0x00424b41
8000ec84:	44414845 	strbmi	r4, [r1], #-2117	@ 0xfffff7bb
8000ec88:	4f464a50 	svcmi	0x00464a50
8000ec8c:	44414144 	strbmi	r4, [r1], #-324	@ 0xfffffebc
8000ec90:	4f484a45 	svcmi	0x00484a45
8000ec94:	42414144 	submi	r4, r1, #68, 2
8000ec98:	4f424b41 	svcmi	0x00424b41
8000ec9c:	4441474d 	strbmi	r4, [r1], #-1869	@ 0xfffff8b3
8000eca0:	4f464a50 	svcmi	0x00464a50
8000eca4:	44414144 	strbmi	r4, [r1], #-324	@ 0xfffffebc
8000eca8:	4f484a45 	svcmi	0x00484a45
8000ecac:	41414144 	cmpmi	r1, r4, asr #2
8000ecb0:	4f424b41 	svcmi	0x00424b41
8000ecb4:	41414a42 	cmpmi	r1, r2, asr #20
8000ecb8:	4f4c4141 	svcmi	0x004c4141
8000ecbc:	44414a4d 	strbmi	r4, [r1], #-2637	@ 0xfffff5b3
8000ecc0:	4f46464c 	svcmi	0x0046464c
8000ecc4:	41414350 	cmpmi	r1, r0, asr r3
8000ecc8:	4f444644 	svcmi	0x00444644
8000eccc:	41414241 	cmpmi	r1, r1, asr #4
8000ecd0:	4a4b4141 	bmi	812df1dc <irq_stack_start+0x12851cc>
8000ecd4:	44414a4d 	strbmi	r4, [r1], #-2637	@ 0xfffff5b3
8000ecd8:	4f46464c 	svcmi	0x0046464c
8000ecdc:	4141444a 	cmpmi	r1, sl, asr #8
8000ece0:	4f444644 	svcmi	0x00444644
8000ece4:	4141414e 	cmpmi	r1, lr, asr #2
8000ece8:	494b4141 	stmdbmi	fp, {r0, r6, r8, lr}^
8000ecec:	44414a4d 	strbmi	r4, [r1], #-2637	@ 0xfffff5b3
8000ecf0:	4f46464c 	svcmi	0x0046464c
8000ecf4:	44414441 	strbmi	r4, [r1], #-1089	@ 0xfffffbbf
8000ecf8:	4f434544 	svcmi	0x00434544
8000ecfc:	44414249 	strbmi	r4, [r1], #-585	@ 0xfffffdb7
8000ed00:	4f46414c 	svcmi	0x0046414c
8000ed04:	41414743 	cmpmi	r1, r3, asr #14
8000ed08:	4f4c4141 	svcmi	0x004c4141
8000ed0c:	4141424d 	cmpmi	r1, sp, asr #4
8000ed10:	4f46414c 	svcmi	0x0046414c
8000ed14:	4441424d 	strbmi	r4, [r1], #-589	@ 0xfffffdb3
8000ed18:	4f46424c 	svcmi	0x0046424c
8000ed1c:	41414141 	cmpmi	r1, r1, asr #2
8000ed20:	4f444644 	svcmi	0x00444644
8000ed24:	41414143 	cmpmi	r1, r3, asr #2
8000ed28:	424b4141 	submi	r4, fp, #1073741840	@ 0x40000010
8000ed2c:	41414249 	cmpmi	r1, r9, asr #4
8000ed30:	4f46424c 	svcmi	0x0046424c
8000ed34:	41414745 	cmpmi	r1, r5, asr #14
8000ed38:	4f4c4141 	svcmi	0x004c4141
8000ed3c:	50504e4f 	subspl	r4, r0, pc, asr #28
8000ed40:	4f4b5050 	svcmi	0x004b5050
8000ed44:	4141424d 	cmpmi	r1, sp, asr #4
8000ed48:	4f46424c 	svcmi	0x0046424c
8000ed4c:	41414844 	cmpmi	r1, r4, asr #16
8000ed50:	4f4c4141 	svcmi	0x004c4141
8000ed54:	50504e4c 	subspl	r4, r0, ip, asr #28
8000ed58:	4f4b5050 	svcmi	0x004b5050
8000ed5c:	50414141 	subpl	r4, r1, r1, asr #2
8000ed60:	4f444341 	svcmi	0x00444341
8000ed64:	50504e4a 	subspl	r4, r0, sl, asr #28
8000ed68:	4f4b5050 	svcmi	0x004b5050
8000ed6c:	424b4c4d 	submi	r4, fp, #19712	@ 0x4d00
8000ed70:	41414141 	cmpmi	r1, r1, asr #2
8000ed74:	414b4141 	cmpmi	fp, r1, asr #2
8000ed78:	41414141 	cmpmi	r1, r1, asr #2
8000ed7c:	4141414d 	cmpmi	r1, sp, asr #2
8000ed80:	41414141 	cmpmi	r1, r1, asr #2
8000ed84:	41414241 	cmpmi	r1, r1, asr #4
8000ed88:	41414141 	cmpmi	r1, r1, asr #2
8000ed8c:	4d41414e 	stclmi	1, cr4, [r1, #-312]	@ 0xfffffec8
8000ed90:	4f424b41 	svcmi	0x00424b41
8000ed94:	4e494141 	cdpmi	1, 4, cr4, cr9, cr1, {2}
8000ed98:	4f4a434e 	svcmi	0x004a434e
8000ed9c:	4c414145 	mcrrmi	1, 4, r4, r1, cr5
8000eda0:	4f43454d 	svcmi	0x0043454d
8000eda4:	4e414241 	cdpmi	2, 4, cr4, cr1, cr1, {2}
8000eda8:	4f43454e 	svcmi	0x0043454e
8000edac:	44414141 	strbmi	r4, [r1], #-321	@ 0xfffffebf
8000edb0:	4f424b41 	svcmi	0x00424b41
8000edb4:	44414246 	strbmi	r4, [r1], #-582	@ 0xfffffdba
8000edb8:	4f46454c 	svcmi	0x0046454c
8000edbc:	41414246 	cmpmi	r1, r6, asr #4
8000edc0:	4f46424c 	svcmi	0x0046424c
8000edc4:	41414141 	cmpmi	r1, r1, asr #2
8000edc8:	4f504141 	svcmi	0x00504141
8000edcc:	41414241 	cmpmi	r1, r1, asr #4
8000edd0:	4f46414c 	svcmi	0x0046414c
8000edd4:	44414241 	strbmi	r4, [r1], #-577	@ 0xfffffdbf
8000edd8:	4f46424c 	svcmi	0x0046424c
8000eddc:	41414144 	cmpmi	r1, r4, asr #2
8000ede0:	4f424b41 	svcmi	0x00424b41
8000ede4:	4e41414d 	cdpmi	1, 4, cr4, cr1, cr13, {2}
8000ede8:	4f43454c 	svcmi	0x0043454c
8000edec:	4b494141 	blmi	8125f2f8 <irq_stack_start+0x12052e8>
8000edf0:	4f494a4e 	svcmi	0x00494a4e
8000edf4:	4d41414e 	stclmi	1, cr4, [r1, #-312]	@ 0xfffffec8
8000edf8:	4f424b41 	svcmi	0x00424b41
8000edfc:	4e494141 	cdpmi	1, 4, cr4, cr9, cr1, {2}
8000ee00:	4f4a434e 	svcmi	0x004a434e
8000ee04:	4c414145 	mcrrmi	1, 4, r4, r1, cr5
8000ee08:	4f43454d 	svcmi	0x0043454d
8000ee0c:	4e414241 	cdpmi	2, 4, cr4, cr1, cr1, {2}
8000ee10:	4f43454e 	svcmi	0x0043454e
8000ee14:	44414141 	strbmi	r4, [r1], #-321	@ 0xfffffebf
8000ee18:	4f424b41 	svcmi	0x00424b41
8000ee1c:	4241424d 	submi	r4, r1, #-805306364	@ 0xd0000004
8000ee20:	4f46414c 	svcmi	0x0046414c
8000ee24:	44414246 	strbmi	r4, [r1], #-582	@ 0xfffffdba
8000ee28:	4f46454c 	svcmi	0x0046454c
8000ee2c:	41414246 	cmpmi	r1, r6, asr #4
8000ee30:	4f46424c 	svcmi	0x0046424c
8000ee34:	4241424d 	submi	r4, r1, #-805306364	@ 0xd0000004
8000ee38:	4f46424c 	svcmi	0x0046424c
8000ee3c:	41414141 	cmpmi	r1, r1, asr #2
8000ee40:	4f504141 	svcmi	0x00504141
8000ee44:	41414241 	cmpmi	r1, r1, asr #4
8000ee48:	4f46414c 	svcmi	0x0046414c
8000ee4c:	44414241 	strbmi	r4, [r1], #-577	@ 0xfffffdbf
8000ee50:	4f46424c 	svcmi	0x0046424c
8000ee54:	41414144 	cmpmi	r1, r4, asr #2
8000ee58:	4f424b41 	svcmi	0x00424b41
8000ee5c:	4e41414d 	cdpmi	1, 4, cr4, cr1, cr13, {2}
8000ee60:	4f43454c 	svcmi	0x0043454c
8000ee64:	4b494141 	blmi	8125f370 <irq_stack_start+0x1205360>
8000ee68:	4f494a4e 	svcmi	0x00494a4e
8000ee6c:	4d41414e 	stclmi	1, cr4, [r1, #-312]	@ 0xfffffec8
8000ee70:	4f424b41 	svcmi	0x00424b41
8000ee74:	4e494141 	cdpmi	1, 4, cr4, cr9, cr1, {2}
8000ee78:	4f4a434e 	svcmi	0x004a434e
8000ee7c:	4c414145 	mcrrmi	1, 4, r4, r1, cr5
8000ee80:	4f43454d 	svcmi	0x0043454d
8000ee84:	4e414249 	cdpmi	2, 4, cr4, cr1, cr9, {2}
8000ee88:	4f43454e 	svcmi	0x0043454e
8000ee8c:	44414141 	strbmi	r4, [r1], #-321	@ 0xfffffebf
8000ee90:	4f424b41 	svcmi	0x00424b41
8000ee94:	4241424d 	submi	r4, r1, #-805306364	@ 0xd0000004
8000ee98:	4f46414c 	svcmi	0x0046414c
8000ee9c:	43414341 	movtmi	r4, #4929	@ 0x1341
8000eea0:	4f46414c 	svcmi	0x0046414c
8000eea4:	44414246 	strbmi	r4, [r1], #-582	@ 0xfffffdba
8000eea8:	4f46454c 	svcmi	0x0046454c
8000eeac:	41414246 	cmpmi	r1, r6, asr #4
8000eeb0:	4f46424c 	svcmi	0x0046424c
8000eeb4:	4241424d 	submi	r4, r1, #-805306364	@ 0xd0000004
8000eeb8:	4f46424c 	svcmi	0x0046424c
8000eebc:	43414341 	movtmi	r4, #4929	@ 0x1341
8000eec0:	4f46424c 	svcmi	0x0046424c
8000eec4:	41414141 	cmpmi	r1, r1, asr #2
8000eec8:	4f504141 	svcmi	0x00504141
8000eecc:	41414241 	cmpmi	r1, r1, asr #4
8000eed0:	4f46414c 	svcmi	0x0046414c
8000eed4:	44414241 	strbmi	r4, [r1], #-577	@ 0xfffffdbf
8000eed8:	4f46424c 	svcmi	0x0046424c
8000eedc:	41414144 	cmpmi	r1, r4, asr #2
8000eee0:	4f424b41 	svcmi	0x00424b41
8000eee4:	4e41414d 	cdpmi	1, 4, cr4, cr1, cr13, {2}
8000eee8:	4f43454c 	svcmi	0x0043454c
8000eeec:	4b494141 	blmi	8125f3f8 <irq_stack_start+0x12053e8>
8000eef0:	4f494a4e 	svcmi	0x00494a4e
8000eef4:	4d41414e 	stclmi	1, cr4, [r1, #-312]	@ 0xfffffec8
8000eef8:	4f424b41 	svcmi	0x00424b41
8000eefc:	4e494141 	cdpmi	1, 4, cr4, cr9, cr1, {2}
8000ef00:	4f4a434e 	svcmi	0x004a434e
8000ef04:	4c414145 	mcrrmi	1, 4, r4, r1, cr5
8000ef08:	4f43454d 	svcmi	0x0043454d
8000ef0c:	4e414149 	cdpmi	1, 4, cr4, cr1, cr9, {2}
8000ef10:	4f43454e 	svcmi	0x0043454e
8000ef14:	41414241 	cmpmi	r1, r1, asr #4
8000ef18:	4f46414c 	svcmi	0x0046414c
8000ef1c:	42414241 	submi	r4, r1, #268435460	@ 0x10000004
8000ef20:	4f46424c 	svcmi	0x0046424c
8000ef24:	41414141 	cmpmi	r1, r1, asr #2
8000ef28:	4f444b41 	svcmi	0x00444b41
8000ef2c:	50504e48 	subspl	r4, r0, r8, asr #28
8000ef30:	4f4c5050 	svcmi	0x004c5050
8000ef34:	50414141 	subpl	r4, r1, r1, asr #2
8000ef38:	4f444341 	svcmi	0x00444341
8000ef3c:	4e41414d 	cdpmi	1, 4, cr4, cr1, cr13, {2}
8000ef40:	4f43454c 	svcmi	0x0043454c
8000ef44:	4b494141 	blmi	8125f450 <irq_stack_start+0x1205440>
8000ef48:	4f494a4e 	svcmi	0x00494a4e
8000ef4c:	4d41414e 	stclmi	1, cr4, [r1, #-312]	@ 0xfffffec8
8000ef50:	4f424b41 	svcmi	0x00424b41
8000ef54:	4e494141 	cdpmi	1, 4, cr4, cr9, cr1, {2}
8000ef58:	4f4a434e 	svcmi	0x004a434e
8000ef5c:	4c414145 	mcrrmi	1, 4, r4, r1, cr5
8000ef60:	4f43454d 	svcmi	0x0043454d
8000ef64:	41414142 	cmpmi	r1, r2, asr #2
8000ef68:	4f444b41 	svcmi	0x00444b41
8000ef6c:	50504d43 	subspl	r4, r0, r3, asr #26
8000ef70:	4f4c5050 	svcmi	0x004c5050
8000ef74:	44414141 	strbmi	r4, [r1], #-321	@ 0xfffffebf
8000ef78:	4f424b41 	svcmi	0x00424b41
8000ef7c:	41414144 	cmpmi	r1, r4, asr #2
8000ef80:	4f424b41 	svcmi	0x00424b41
8000ef84:	4b494141 	blmi	8125f490 <irq_stack_start+0x1205480>
8000ef88:	4f494a4e 	svcmi	0x00494a4e
8000ef8c:	4d41414e 	stclmi	1, cr4, [r1, #-312]	@ 0xfffffec8
8000ef90:	4f424b41 	svcmi	0x00424b41
8000ef94:	4e494141 	cdpmi	1, 4, cr4, cr9, cr1, {2}
8000ef98:	4f4a434e 	svcmi	0x004a434e
8000ef9c:	4c414145 	mcrrmi	1, 4, r4, r1, cr5
8000efa0:	4f43454d 	svcmi	0x0043454d
8000efa4:	4e414149 	cdpmi	1, 4, cr4, cr1, cr9, {2}
8000efa8:	4f43454e 	svcmi	0x0043454e
8000efac:	41414241 	cmpmi	r1, r1, asr #4
8000efb0:	4f46414c 	svcmi	0x0046414c
8000efb4:	42414241 	submi	r4, r1, #268435460	@ 0x10000004
8000efb8:	4f46424c 	svcmi	0x0046424c
8000efbc:	41414143 	cmpmi	r1, r3, asr #2
8000efc0:	4f444b41 	svcmi	0x00444b41
8000efc4:	50504d45 	subspl	r4, r0, r5, asr #26
8000efc8:	4f4c5050 	svcmi	0x004c5050
8000efcc:	50414141 	subpl	r4, r1, r1, asr #2
8000efd0:	4f444341 	svcmi	0x00444341
8000efd4:	4e41414d 	cdpmi	1, 4, cr4, cr1, cr13, {2}
8000efd8:	4f43454c 	svcmi	0x0043454c
8000efdc:	4b494141 	blmi	8125f4e8 <irq_stack_start+0x12054d8>
8000efe0:	4f494a4e 	svcmi	0x00494a4e
8000efe4:	4d41414e 	stclmi	1, cr4, [r1, #-312]	@ 0xfffffec8
8000efe8:	4f424b41 	svcmi	0x00424b41
8000efec:	4e494141 	cdpmi	1, 4, cr4, cr9, cr1, {2}
8000eff0:	4f4a434e 	svcmi	0x004a434e
8000eff4:	4c414145 	mcrrmi	1, 4, r4, r1, cr5
8000eff8:	4f43454d 	svcmi	0x0043454d
8000effc:	41414144 	cmpmi	r1, r4, asr #2
8000f000:	4f444b41 	svcmi	0x00444b41
8000f004:	50504b50 	subspl	r4, r0, r0, asr fp
8000f008:	4f4c5050 	svcmi	0x004c5050
8000f00c:	44414141 	strbmi	r4, [r1], #-321	@ 0xfffffebf
8000f010:	4f424b41 	svcmi	0x00424b41
8000f014:	41414144 	cmpmi	r1, r4, asr #2
8000f018:	4f424b41 	svcmi	0x00424b41
8000f01c:	4b494141 	blmi	8125f528 <irq_stack_start+0x1205518>
8000f020:	4f494a4e 	svcmi	0x00494a4e
8000f024:	4d41414e 	stclmi	1, cr4, [r1, #-312]	@ 0xfffffec8
8000f028:	4f424b41 	svcmi	0x00424b41
8000f02c:	4e494141 	cdpmi	1, 4, cr4, cr9, cr1, {2}
8000f030:	4f4a434e 	svcmi	0x004a434e
8000f034:	4c414145 	mcrrmi	1, 4, r4, r1, cr5
8000f038:	4f43454d 	svcmi	0x0043454d
8000f03c:	41414145 	cmpmi	r1, r5, asr #2
8000f040:	4f444b41 	svcmi	0x00444b41
8000f044:	50504b48 	subspl	r4, r0, r8, asr #22
8000f048:	4f4c5050 	svcmi	0x004c5050
8000f04c:	44414141 	strbmi	r4, [r1], #-321	@ 0xfffffebf
8000f050:	4f424b41 	svcmi	0x00424b41
8000f054:	41414144 	cmpmi	r1, r4, asr #2
8000f058:	4f424b41 	svcmi	0x00424b41
8000f05c:	4b494141 	blmi	8125f568 <irq_stack_start+0x1205558>
8000f060:	4f494a4e 	svcmi	0x00494a4e
8000f064:	4d41414e 	stclmi	1, cr4, [r1, #-312]	@ 0xfffffec8
8000f068:	4f424b41 	svcmi	0x00424b41
8000f06c:	4e494141 	cdpmi	1, 4, cr4, cr9, cr1, {2}
8000f070:	4f4a434e 	svcmi	0x004a434e
8000f074:	4c414145 	mcrrmi	1, 4, r4, r1, cr5
8000f078:	4f43454d 	svcmi	0x0043454d
8000f07c:	4e414149 	cdpmi	1, 4, cr4, cr1, cr9, {2}
8000f080:	4f43454e 	svcmi	0x0043454e
8000f084:	41414241 	cmpmi	r1, r1, asr #4
8000f088:	4f46414c 	svcmi	0x0046414c
8000f08c:	42414241 	submi	r4, r1, #268435460	@ 0x10000004
8000f090:	4f46424c 	svcmi	0x0046424c
8000f094:	41414146 	cmpmi	r1, r6, asr #2
8000f098:	4f444b41 	svcmi	0x00444b41
8000f09c:	50504b4a 	subspl	r4, r0, sl, asr #22
8000f0a0:	4f4c5050 	svcmi	0x004c5050
8000f0a4:	50414141 	subpl	r4, r1, r1, asr #2
8000f0a8:	4f444341 	svcmi	0x00444341
8000f0ac:	4e41414d 	cdpmi	1, 4, cr4, cr1, cr13, {2}
8000f0b0:	4f43454c 	svcmi	0x0043454c
8000f0b4:	4b494141 	blmi	8125f5c0 <irq_stack_start+0x12055b0>
8000f0b8:	4f494a4e 	svcmi	0x00494a4e
8000f0bc:	4d41414e 	stclmi	1, cr4, [r1, #-312]	@ 0xfffffec8
8000f0c0:	4f424b41 	svcmi	0x00424b41
8000f0c4:	4e494141 	cdpmi	1, 4, cr4, cr9, cr1, {2}
8000f0c8:	4f4a434e 	svcmi	0x004a434e
8000f0cc:	4c414145 	mcrrmi	1, 4, r4, r1, cr5
8000f0d0:	4f43454d 	svcmi	0x0043454d
8000f0d4:	41414147 	cmpmi	r1, r7, asr #2
8000f0d8:	4f444b41 	svcmi	0x00444b41
8000f0dc:	50504a45 	subspl	r4, r0, r5, asr #20
8000f0e0:	4f4c5050 	svcmi	0x004c5050
8000f0e4:	50414141 	subpl	r4, r1, r1, asr #2
8000f0e8:	4f444341 	svcmi	0x00444341
8000f0ec:	4b494141 	blmi	8125f5f8 <irq_stack_start+0x12055e8>
8000f0f0:	4f494a4e 	svcmi	0x00494a4e
8000f0f4:	4d41414e 	stclmi	1, cr4, [r1, #-312]	@ 0xfffffec8
8000f0f8:	4f424b41 	svcmi	0x00424b41
8000f0fc:	4e494141 	cdpmi	1, 4, cr4, cr9, cr1, {2}
8000f100:	4f4a434e 	svcmi	0x004a434e
8000f104:	4c414145 	mcrrmi	1, 4, r4, r1, cr5
8000f108:	4f43454d 	svcmi	0x0043454d
8000f10c:	4e414149 	cdpmi	1, 4, cr4, cr1, cr9, {2}
8000f110:	4f43454e 	svcmi	0x0043454e
8000f114:	41414241 	cmpmi	r1, r1, asr #4
8000f118:	4f46414c 	svcmi	0x0046414c
8000f11c:	42414241 	submi	r4, r1, #268435460	@ 0x10000004
8000f120:	4f46424c 	svcmi	0x0046424c
8000f124:	41414148 	cmpmi	r1, r8, asr #2
8000f128:	4f444b41 	svcmi	0x00444b41
8000f12c:	50504a48 	subspl	r4, r0, r8, asr #20
8000f130:	4f4c5050 	svcmi	0x004c5050
8000f134:	50414141 	subpl	r4, r1, r1, asr #2
8000f138:	4f444341 	svcmi	0x00444341
8000f13c:	4e41414d 	cdpmi	1, 4, cr4, cr1, cr13, {2}
8000f140:	4f43454c 	svcmi	0x0043454c
8000f144:	4b494141 	blmi	8125f650 <irq_stack_start+0x1205640>
8000f148:	4f494a4e 	svcmi	0x00494a4e
8000f14c:	4d41414e 	stclmi	1, cr4, [r1, #-312]	@ 0xfffffec8
8000f150:	4f424b41 	svcmi	0x00424b41
8000f154:	4e494141 	cdpmi	1, 4, cr4, cr9, cr1, {2}
8000f158:	4f4a434e 	svcmi	0x004a434e
8000f15c:	4c414145 	mcrrmi	1, 4, r4, r1, cr5
8000f160:	4f43454d 	svcmi	0x0043454d
8000f164:	4e414249 	cdpmi	2, 4, cr4, cr1, cr9, {2}
8000f168:	4f43454e 	svcmi	0x0043454e
8000f16c:	41414249 	cmpmi	r1, r9, asr #4
8000f170:	4f46414c 	svcmi	0x0046414c
8000f174:	4241424d 	submi	r4, r1, #-805306364	@ 0xd0000004
8000f178:	4f46414c 	svcmi	0x0046414c
8000f17c:	43414341 	movtmi	r4, #4929	@ 0x1341
8000f180:	4f46414c 	svcmi	0x0046414c
8000f184:	44414141 	strbmi	r4, [r1], #-321	@ 0xfffffebf
8000f188:	4f444b41 	svcmi	0x00444b41
8000f18c:	44414241 	strbmi	r4, [r1], #-577	@ 0xfffffdbf
8000f190:	4f46414c 	svcmi	0x0046414c
8000f194:	44414141 	strbmi	r4, [r1], #-321	@ 0xfffffebf
8000f198:	4f444b41 	svcmi	0x00444b41
8000f19c:	44414245 	strbmi	r4, [r1], #-581	@ 0xfffffdbb
8000f1a0:	4f46414c 	svcmi	0x0046414c
8000f1a4:	41414444 	cmpmi	r1, r4, asr #8
8000f1a8:	4f4b4141 	svcmi	0x004b4141
8000f1ac:	44414249 	strbmi	r4, [r1], #-585	@ 0xfffffdb7
8000f1b0:	4f46424c 	svcmi	0x0046424c
8000f1b4:	50504444 	subspl	r4, r0, r4, asr #8
8000f1b8:	4f424350 	svcmi	0x00424350
8000f1bc:	41414245 	cmpmi	r1, r5, asr #4
8000f1c0:	4f46414c 	svcmi	0x0046414c
8000f1c4:	44414245 	strbmi	r4, [r1], #-581	@ 0xfffffdbb
8000f1c8:	4f46424c 	svcmi	0x0046424c
8000f1cc:	41414141 	cmpmi	r1, r1, asr #2
8000f1d0:	4f444644 	svcmi	0x00444644
8000f1d4:	4141434d 	cmpmi	r1, sp, asr #6
8000f1d8:	414b4141 	cmpmi	fp, r1, asr #2
8000f1dc:	44414245 	strbmi	r4, [r1], #-581	@ 0xfffffdbb
8000f1e0:	4f46424c 	svcmi	0x0046424c
8000f1e4:	4141414e 	cmpmi	r1, lr, asr #2
8000f1e8:	4f444644 	svcmi	0x00444644
8000f1ec:	41414441 	cmpmi	r1, r1, asr #8
8000f1f0:	414b4141 	cmpmi	fp, r1, asr #2
8000f1f4:	44414245 	strbmi	r4, [r1], #-581	@ 0xfffffdbb
8000f1f8:	4f46424c 	svcmi	0x0046424c
8000f1fc:	4141414b 	cmpmi	r1, fp, asr #2
8000f200:	4f444644 	svcmi	0x00444644
8000f204:	4141434e 	cmpmi	r1, lr, asr #6
8000f208:	414b4141 	cmpmi	fp, r1, asr #2
8000f20c:	44414245 	strbmi	r4, [r1], #-581	@ 0xfffffdbb
8000f210:	4f46424c 	svcmi	0x0046424c
8000f214:	43414e4d 	movtmi	r4, #7757	@ 0x1e4d
8000f218:	4f464a50 	svcmi	0x00464a50
8000f21c:	41414143 	cmpmi	r1, r3, asr #2
8000f220:	4f424644 	svcmi	0x00424644
8000f224:	41414150 	cmpmi	r1, r0, asr r1
8000f228:	424b4141 	submi	r4, fp, #1073741840	@ 0x40000010
8000f22c:	44414241 	strbmi	r4, [r1], #-577	@ 0xfffffdbf
8000f230:	4f46424c 	svcmi	0x0046424c
8000f234:	41414141 	cmpmi	r1, r1, asr #2
8000f238:	4f444644 	svcmi	0x00444644
8000f23c:	41414341 	cmpmi	r1, r1, asr #6
8000f240:	414b4141 	cmpmi	fp, r1, asr #2
8000f244:	4441424d 	strbmi	r4, [r1], #-589	@ 0xfffffdb3
8000f248:	4f46424c 	svcmi	0x0046424c
8000f24c:	41414d45 	cmpmi	r1, r5, asr #26
8000f250:	4f464a50 	svcmi	0x00464a50
8000f254:	50504444 	subspl	r4, r0, r4, asr #8
8000f258:	4f424350 	svcmi	0x00424350
8000f25c:	4441424d 	strbmi	r4, [r1], #-589	@ 0xfffffdb3
8000f260:	4f46424c 	svcmi	0x0046424c
8000f264:	41414341 	cmpmi	r1, r1, asr #6
8000f268:	4f444b41 	svcmi	0x00444b41
8000f26c:	50504444 	subspl	r4, r0, r4, asr #8
8000f270:	4f424350 	svcmi	0x00424350
8000f274:	4441424d 	strbmi	r4, [r1], #-589	@ 0xfffffdb3
8000f278:	4f46424c 	svcmi	0x0046424c
8000f27c:	41414b4d 	cmpmi	r1, sp, asr #22
8000f280:	4f464a50 	svcmi	0x00464a50
8000f284:	50504444 	subspl	r4, r0, r4, asr #8
8000f288:	4f424350 	svcmi	0x00424350
8000f28c:	44414241 	strbmi	r4, [r1], #-577	@ 0xfffffdbf
8000f290:	4f46424c 	svcmi	0x0046424c
8000f294:	44414142 	strbmi	r4, [r1], #-322	@ 0xfffffebe
8000f298:	4f434544 	svcmi	0x00434544
8000f29c:	44414241 	strbmi	r4, [r1], #-577	@ 0xfffffdbf
8000f2a0:	4f46414c 	svcmi	0x0046414c
8000f2a4:	41414244 	cmpmi	r1, r4, asr #4
8000f2a8:	4f4b4141 	svcmi	0x004b4141
8000f2ac:	44414245 	strbmi	r4, [r1], #-581	@ 0xfffffdbb
8000f2b0:	4f46424c 	svcmi	0x0046424c
8000f2b4:	41414250 	cmpmi	r1, r0, asr r2
8000f2b8:	4f444644 	svcmi	0x00444644
8000f2bc:	41414241 	cmpmi	r1, r1, asr #4
8000f2c0:	4e4b4141 	cdpmi	1, 4, cr4, cr11, cr1, {2}
8000f2c4:	44414245 	strbmi	r4, [r1], #-581	@ 0xfffffdbb
8000f2c8:	4f46424c 	svcmi	0x0046424c
8000f2cc:	41414850 	cmpmi	r1, r0, asr r8
8000f2d0:	4f444644 	svcmi	0x00444644
8000f2d4:	4141414e 	cmpmi	r1, lr, asr #2
8000f2d8:	4d4b4141 	stclmi	1, cr4, [fp, #-260]	@ 0xfffffefc
8000f2dc:	4441424d 	strbmi	r4, [r1], #-589	@ 0xfffffdb3
8000f2e0:	4f46424c 	svcmi	0x0046424c
8000f2e4:	41414245 	cmpmi	r1, r5, asr #4
8000f2e8:	4f46424c 	svcmi	0x0046424c
8000f2ec:	50504444 	subspl	r4, r0, r4, asr #8
8000f2f0:	4f424350 	svcmi	0x00424350
8000f2f4:	44414241 	strbmi	r4, [r1], #-577	@ 0xfffffdbf
8000f2f8:	4f46424c 	svcmi	0x0046424c
8000f2fc:	43414341 	movtmi	r4, #4929	@ 0x1341
8000f300:	4f46424c 	svcmi	0x0046424c
8000f304:	44414144 	strbmi	r4, [r1], #-324	@ 0xfffffebc
8000f308:	4f414943 	svcmi	0x00414943
8000f30c:	43414245 	movtmi	r4, #4677	@ 0x1245
8000f310:	4f46424c 	svcmi	0x0046424c
8000f314:	43414843 	movtmi	r4, #6211	@ 0x1843
8000f318:	4f474f50 	svcmi	0x00474f50
8000f31c:	43414141 	movtmi	r4, #4417	@ 0x1141
8000f320:	4f464d44 	svcmi	0x00464d44
8000f324:	44414241 	strbmi	r4, [r1], #-577	@ 0xfffffdbf
8000f328:	4f46424c 	svcmi	0x0046424c
8000f32c:	44414142 	strbmi	r4, [r1], #-322	@ 0xfffffebe
8000f330:	4f434944 	svcmi	0x00434944
8000f334:	44414241 	strbmi	r4, [r1], #-577	@ 0xfffffdbf
8000f338:	4f46414c 	svcmi	0x0046414c
8000f33c:	41414141 	cmpmi	r1, r1, asr #2
8000f340:	4f4b4141 	svcmi	0x004b4141
8000f344:	50414141 	subpl	r4, r1, r1, asr #2
8000f348:	4f444341 	svcmi	0x00444341
8000f34c:	44414245 	strbmi	r4, [r1], #-581	@ 0xfffffdbb
8000f350:	4f46424c 	svcmi	0x0046424c
8000f354:	4141414e 	cmpmi	r1, lr, asr #2
8000f358:	4f444644 	svcmi	0x00444644
8000f35c:	41414143 	cmpmi	r1, r3, asr #2
8000f360:	414b4141 	cmpmi	fp, r1, asr #2
8000f364:	44414245 	strbmi	r4, [r1], #-581	@ 0xfffffdbb
8000f368:	4f46424c 	svcmi	0x0046424c
8000f36c:	4141414b 	cmpmi	r1, fp, asr #2
8000f370:	4f444644 	svcmi	0x00444644
8000f374:	50504d46 	subspl	r4, r0, r6, asr #26
8000f378:	424b5050 	submi	r5, fp, #80	@ 0x50
8000f37c:	4441424d 	strbmi	r4, [r1], #-589	@ 0xfffffdb3
8000f380:	4f46424c 	svcmi	0x0046424c
8000f384:	4141414b 	cmpmi	r1, fp, asr #2
8000f388:	4f444b41 	svcmi	0x00444b41
8000f38c:	50504444 	subspl	r4, r0, r4, asr #8
8000f390:	4f424350 	svcmi	0x00424350
8000f394:	44414241 	strbmi	r4, [r1], #-577	@ 0xfffffdbf
8000f398:	4f46424c 	svcmi	0x0046424c
8000f39c:	43414341 	movtmi	r4, #4929	@ 0x1341
8000f3a0:	4f46424c 	svcmi	0x0046424c
8000f3a4:	44414144 	strbmi	r4, [r1], #-324	@ 0xfffffebc
8000f3a8:	4f414943 	svcmi	0x00414943
8000f3ac:	43414141 	movtmi	r4, #4417	@ 0x1141
8000f3b0:	4f444b41 	svcmi	0x00444b41
8000f3b4:	43414141 	movtmi	r4, #4417	@ 0x1141
8000f3b8:	4f464d44 	svcmi	0x00464d44
8000f3bc:	44414341 	strbmi	r4, [r1], #-833	@ 0xfffffcbf
8000f3c0:	4f46424c 	svcmi	0x0046424c
8000f3c4:	41414144 	cmpmi	r1, r4, asr #2
8000f3c8:	4f424b41 	svcmi	0x00424b41
8000f3cc:	4e41414d 	cdpmi	1, 4, cr4, cr1, cr13, {2}
8000f3d0:	4f43454c 	svcmi	0x0043454c
8000f3d4:	4b494141 	blmi	8125f8e0 <irq_stack_start+0x12058d0>
8000f3d8:	4f494a4e 	svcmi	0x00494a4e
8000f3dc:	42414146 	submi	r4, r1, #-2147483631	@ 0x80000011
8000f3e0:	41414141 	cmpmi	r1, r1, asr #2
8000f3e4:	42414145 	submi	r4, r1, #1073741841	@ 0x40000011
8000f3e8:	41414141 	cmpmi	r1, r1, asr #2
8000f3ec:	4d41414e 	stclmi	1, cr4, [r1, #-312]	@ 0xfffffec8
8000f3f0:	4f424b41 	svcmi	0x00424b41
8000f3f4:	4141414f 	cmpmi	r1, pc, asr #2
8000f3f8:	4f4a434e 	svcmi	0x004a434e
8000f3fc:	4e494141 	cdpmi	1, 4, cr4, cr9, cr1, {2}
8000f400:	4f4a434e 	svcmi	0x004a434e
8000f404:	4c414241 	mcrrmi	2, 4, r4, r1, cr1
8000f408:	4f43454d 	svcmi	0x0043454d
8000f40c:	4e504548 	cdpmi	5, 5, cr4, cr0, cr8, {2}
8000f410:	4f43454e 	svcmi	0x0043454e
8000f414:	41424345 	cmpmi	r2, r5, asr #6
8000f418:	4f46414c 	svcmi	0x0046414c
8000f41c:	44414141 	strbmi	r4, [r1], #-321	@ 0xfffffebf
8000f420:	4f444b41 	svcmi	0x00444b41
8000f424:	44414249 	strbmi	r4, [r1], #-585	@ 0xfffffdb7
8000f428:	4f46414c 	svcmi	0x0046414c
8000f42c:	44414141 	strbmi	r4, [r1], #-321	@ 0xfffffebf
8000f430:	4f444b41 	svcmi	0x00444b41
8000f434:	44414245 	strbmi	r4, [r1], #-581	@ 0xfffffdbb
8000f438:	4f46414c 	svcmi	0x0046414c
8000f43c:	44414149 	strbmi	r4, [r1], #-329	@ 0xfffffeb7
8000f440:	4f43494c 	svcmi	0x0043494c
8000f444:	4442424d 	strbmi	r4, [r2], #-589	@ 0xfffffdb3
8000f448:	4f46414c 	svcmi	0x0046414c
8000f44c:	44504547 	ldrbmi	r4, [r0], #-1351	@ 0xfffffab9
8000f450:	4f43454c 	svcmi	0x0043454c
8000f454:	4342424d 	movtmi	r4, #8781	@ 0x224d
8000f458:	4f46424c 	svcmi	0x0046424c
8000f45c:	42414145 	submi	r4, r1, #1073741841	@ 0x40000011
8000f460:	4f464a4c 	svcmi	0x00464a4c
8000f464:	41414144 	cmpmi	r1, r4, asr #2
8000f468:	4f424b41 	svcmi	0x00424b41
8000f46c:	41414247 	cmpmi	r1, r7, asr #4
8000f470:	4f4c4141 	svcmi	0x004c4141
8000f474:	41414249 	cmpmi	r1, r9, asr #4
8000f478:	4f46414c 	svcmi	0x0046414c
8000f47c:	4141414b 	cmpmi	r1, fp, asr #2
8000f480:	4f4b4141 	svcmi	0x004b4141
8000f484:	43504547 	cmpmi	r0, #297795584	@ 0x11c00000
8000f488:	4f43454c 	svcmi	0x0043454c
8000f48c:	44414245 	strbmi	r4, [r1], #-581	@ 0xfffffdbb
8000f490:	4f46424c 	svcmi	0x0046424c
8000f494:	44414144 	strbmi	r4, [r1], #-324	@ 0xfffffebc
8000f498:	4f414943 	svcmi	0x00414943
8000f49c:	44414141 	strbmi	r4, [r1], #-321	@ 0xfffffebf
8000f4a0:	4f464e44 	svcmi	0x00464e44
8000f4a4:	43414144 	movtmi	r4, #4420	@ 0x1144
8000f4a8:	4f424b41 	svcmi	0x00424b41
8000f4ac:	44424345 	strbmi	r4, [r2], #-837	@ 0xfffffcbb
8000f4b0:	4f46424c 	svcmi	0x0046424c
8000f4b4:	41414143 	cmpmi	r1, r3, asr #2
8000f4b8:	4f424b41 	svcmi	0x00424b41
8000f4bc:	50504444 	subspl	r4, r0, r4, asr #8
8000f4c0:	4f424350 	svcmi	0x00424350
8000f4c4:	44414245 	strbmi	r4, [r1], #-581	@ 0xfffffdbb
8000f4c8:	4f46424c 	svcmi	0x0046424c
8000f4cc:	44414142 	strbmi	r4, [r1], #-322	@ 0xfffffebe
8000f4d0:	4f434944 	svcmi	0x00434944
8000f4d4:	44414245 	strbmi	r4, [r1], #-581	@ 0xfffffdbb
8000f4d8:	4f46414c 	svcmi	0x0046414c
8000f4dc:	43504547 	cmpmi	r0, #297795584	@ 0x11c00000
8000f4e0:	4f43454c 	svcmi	0x0043454c
8000f4e4:	44414245 	strbmi	r4, [r1], #-581	@ 0xfffffdbb
8000f4e8:	4f46424c 	svcmi	0x0046424c
8000f4ec:	44414144 	strbmi	r4, [r1], #-324	@ 0xfffffebc
8000f4f0:	4f414943 	svcmi	0x00414943
8000f4f4:	44414141 	strbmi	r4, [r1], #-321	@ 0xfffffebf
8000f4f8:	4f464e44 	svcmi	0x00464e44
8000f4fc:	41414141 	cmpmi	r1, r1, asr #2
8000f500:	4f444644 	svcmi	0x00444644
8000f504:	50504f4f 	subspl	r4, r0, pc, asr #30
8000f508:	424b5050 	submi	r5, fp, #80	@ 0x50
8000f50c:	44414249 	strbmi	r4, [r1], #-585	@ 0xfffffdb7
8000f510:	4f46424c 	svcmi	0x0046424c
8000f514:	41414144 	cmpmi	r1, r4, asr #2
8000f518:	4f424b41 	svcmi	0x00424b41
8000f51c:	4e41414d 	cdpmi	1, 4, cr4, cr1, cr13, {2}
8000f520:	4f43454c 	svcmi	0x0043454c
8000f524:	4b494141 	blmi	8125fa30 <irq_stack_start+0x1205a20>
8000f528:	4f494a4e 	svcmi	0x00494a4e
8000f52c:	4d41414e 	stclmi	1, cr4, [r1, #-312]	@ 0xfffffec8
8000f530:	4f424b41 	svcmi	0x00424b41
8000f534:	4e494141 	cdpmi	1, 4, cr4, cr9, cr1, {2}
8000f538:	4f4a434e 	svcmi	0x004a434e
8000f53c:	4c414145 	mcrrmi	1, 4, r4, r1, cr5
8000f540:	4f43454d 	svcmi	0x0043454d
8000f544:	4e414441 	cdpmi	4, 4, cr4, cr1, cr1, {2}
8000f548:	4f43454e 	svcmi	0x0043454e
8000f54c:	41414441 	cmpmi	r1, r1, asr #8
8000f550:	4f46414c 	svcmi	0x0046414c
8000f554:	42414445 	submi	r4, r1, #1157627904	@ 0x45000000
8000f558:	4f46414c 	svcmi	0x0046414c
8000f55c:	43414449 	movtmi	r4, #5193	@ 0x1449
8000f560:	4f46414c 	svcmi	0x0046414c
8000f564:	44414141 	strbmi	r4, [r1], #-321	@ 0xfffffebf
8000f568:	4f444b41 	svcmi	0x00444b41
8000f56c:	44414241 	strbmi	r4, [r1], #-577	@ 0xfffffdbf
8000f570:	4f46414c 	svcmi	0x0046414c
8000f574:	44414141 	strbmi	r4, [r1], #-321	@ 0xfffffebf
8000f578:	4f444b41 	svcmi	0x00444b41
8000f57c:	44414245 	strbmi	r4, [r1], #-581	@ 0xfffffdbb
8000f580:	4f46414c 	svcmi	0x0046414c
8000f584:	41414a47 	cmpmi	r1, r7, asr #20
8000f588:	4f4b4141 	svcmi	0x004b4141
8000f58c:	44414141 	strbmi	r4, [r1], #-321	@ 0xfffffebf
8000f590:	4f444b41 	svcmi	0x00444b41
8000f594:	44414246 	strbmi	r4, [r1], #-582	@ 0xfffffdba
8000f598:	4f46454c 	svcmi	0x0046454c
8000f59c:	4141414e 	cmpmi	r1, lr, asr #2
8000f5a0:	4f4b4141 	svcmi	0x004b4141
8000f5a4:	44414241 	strbmi	r4, [r1], #-577	@ 0xfffffdbf
8000f5a8:	4f46424c 	svcmi	0x0046424c
8000f5ac:	43414445 	movtmi	r4, #5189	@ 0x1445
8000f5b0:	4f46424c 	svcmi	0x0046424c
8000f5b4:	43414144 	movtmi	r4, #4420	@ 0x1144
8000f5b8:	4f414943 	svcmi	0x00414943
8000f5bc:	44414245 	strbmi	r4, [r1], #-581	@ 0xfffffdbb
8000f5c0:	4f46424c 	svcmi	0x0046424c
8000f5c4:	42414441 	submi	r4, r1, #1090519040	@ 0x41000000
8000f5c8:	4f46424c 	svcmi	0x0046424c
8000f5cc:	44414144 	strbmi	r4, [r1], #-324	@ 0xfffffebc
8000f5d0:	4f414942 	svcmi	0x00414942
8000f5d4:	43414141 	movtmi	r4, #4417	@ 0x1141
8000f5d8:	4f464e43 	svcmi	0x00464e43
8000f5dc:	43414141 	movtmi	r4, #4417	@ 0x1141
8000f5e0:	4f464d44 	svcmi	0x00464d44
8000f5e4:	44414245 	strbmi	r4, [r1], #-581	@ 0xfffffdbb
8000f5e8:	4f46424c 	svcmi	0x0046424c
8000f5ec:	44414142 	strbmi	r4, [r1], #-322	@ 0xfffffebe
8000f5f0:	4f434944 	svcmi	0x00434944
8000f5f4:	44414245 	strbmi	r4, [r1], #-581	@ 0xfffffdbb
8000f5f8:	4f46414c 	svcmi	0x0046414c
8000f5fc:	44414241 	strbmi	r4, [r1], #-577	@ 0xfffffdbf
8000f600:	4f46424c 	svcmi	0x0046424c
8000f604:	44414142 	strbmi	r4, [r1], #-322	@ 0xfffffebe
8000f608:	4f434944 	svcmi	0x00434944
8000f60c:	44414241 	strbmi	r4, [r1], #-577	@ 0xfffffdbf
8000f610:	4f46414c 	svcmi	0x0046414c
8000f614:	44414241 	strbmi	r4, [r1], #-577	@ 0xfffffdbf
8000f618:	4f46424c 	svcmi	0x0046424c
8000f61c:	43414445 	movtmi	r4, #5189	@ 0x1445
8000f620:	4f46424c 	svcmi	0x0046424c
8000f624:	44414144 	strbmi	r4, [r1], #-324	@ 0xfffffebc
8000f628:	4f414943 	svcmi	0x00414943
8000f62c:	44414141 	strbmi	r4, [r1], #-321	@ 0xfffffebf
8000f630:	4f464e44 	svcmi	0x00464e44
8000f634:	41414346 	cmpmi	r1, r6, asr #6
8000f638:	4f444644 	svcmi	0x00444644
8000f63c:	41414146 	cmpmi	r1, r6, asr #2
8000f640:	414b4141 	cmpmi	fp, r1, asr #2
8000f644:	44414241 	strbmi	r4, [r1], #-577	@ 0xfffffdbf
8000f648:	4f46424c 	svcmi	0x0046424c
8000f64c:	43414445 	movtmi	r4, #5189	@ 0x1445
8000f650:	4f46424c 	svcmi	0x0046424c
8000f654:	44414144 	strbmi	r4, [r1], #-324	@ 0xfffffebc
8000f658:	4f414943 	svcmi	0x00414943
8000f65c:	44414141 	strbmi	r4, [r1], #-321	@ 0xfffffebf
8000f660:	4f464e44 	svcmi	0x00464e44
8000f664:	41414141 	cmpmi	r1, r1, asr #2
8000f668:	4f444644 	svcmi	0x00444644
8000f66c:	50504f46 	subspl	r4, r0, r6, asr #30
8000f670:	424b5050 	submi	r5, fp, #80	@ 0x50
8000f674:	44414241 	strbmi	r4, [r1], #-577	@ 0xfffffdbf
8000f678:	4f46424c 	svcmi	0x0046424c
8000f67c:	43414445 	movtmi	r4, #5189	@ 0x1445
8000f680:	4f46424c 	svcmi	0x0046424c
8000f684:	44414144 	strbmi	r4, [r1], #-324	@ 0xfffffebc
8000f688:	4f414943 	svcmi	0x00414943
8000f68c:	44414141 	strbmi	r4, [r1], #-321	@ 0xfffffebf
8000f690:	4f464e44 	svcmi	0x00464e44
8000f694:	41414141 	cmpmi	r1, r1, asr #2
8000f698:	4f444644 	svcmi	0x00444644
8000f69c:	4141484a 	cmpmi	r1, sl, asr #16
8000f6a0:	414b4141 	cmpmi	fp, r1, asr #2
8000f6a4:	44414241 	strbmi	r4, [r1], #-577	@ 0xfffffdbf
8000f6a8:	4f46424c 	svcmi	0x0046424c
8000f6ac:	44414142 	strbmi	r4, [r1], #-322	@ 0xfffffebe
8000f6b0:	4f434944 	svcmi	0x00434944
8000f6b4:	43414445 	movtmi	r4, #5189	@ 0x1445
8000f6b8:	4f46424c 	svcmi	0x0046424c
8000f6bc:	44414144 	strbmi	r4, [r1], #-324	@ 0xfffffebc
8000f6c0:	4f414943 	svcmi	0x00414943
8000f6c4:	44414141 	strbmi	r4, [r1], #-321	@ 0xfffffebf
8000f6c8:	4f464e44 	svcmi	0x00464e44
8000f6cc:	41414141 	cmpmi	r1, r1, asr #2
8000f6d0:	4f444644 	svcmi	0x00444644
8000f6d4:	41414843 	cmpmi	r1, r3, asr #16
8000f6d8:	414b4141 	cmpmi	fp, r1, asr #2
8000f6dc:	44414241 	strbmi	r4, [r1], #-577	@ 0xfffffdbf
8000f6e0:	4f46424c 	svcmi	0x0046424c
8000f6e4:	44414142 	strbmi	r4, [r1], #-322	@ 0xfffffebe
8000f6e8:	4f434944 	svcmi	0x00434944
8000f6ec:	43414445 	movtmi	r4, #5189	@ 0x1445
8000f6f0:	4f46424c 	svcmi	0x0046424c
8000f6f4:	44414144 	strbmi	r4, [r1], #-324	@ 0xfffffebc
8000f6f8:	4f414943 	svcmi	0x00414943
8000f6fc:	44414141 	strbmi	r4, [r1], #-321	@ 0xfffffebf
8000f700:	4f464e44 	svcmi	0x00464e44
8000f704:	44414246 	strbmi	r4, [r1], #-582	@ 0xfffffdba
8000f708:	4f46454c 	svcmi	0x0046454c
8000f70c:	44414246 	strbmi	r4, [r1], #-582	@ 0xfffffdba
8000f710:	4f46464c 	svcmi	0x0046464c
8000f714:	44414744 	strbmi	r4, [r1], #-1860	@ 0xfffff8bc
8000f718:	4f434544 	svcmi	0x00434544
8000f71c:	43424d49 	movtmi	r4, #11593	@ 0x2d49
8000f720:	4f464a50 	svcmi	0x00464a50
8000f724:	43414143 	movtmi	r4, #4419	@ 0x1143
8000f728:	4f414950 	svcmi	0x00414950
8000f72c:	41414246 	cmpmi	r1, r6, asr #4
8000f730:	4f444644 	svcmi	0x00444644
8000f734:	4141464e 	cmpmi	r1, lr, asr #12
8000f738:	494b4141 	stmdbmi	fp, {r0, r6, r8, lr}^
8000f73c:	44424144 	strbmi	r4, [r2], #-324	@ 0xfffffebc
8000f740:	4f484a43 	svcmi	0x00484a43
8000f744:	50414144 	subpl	r4, r1, r4, asr #2
8000f748:	4f414950 	svcmi	0x00414950
8000f74c:	50414141 	subpl	r4, r1, r1, asr #2
8000f750:	4f444341 	svcmi	0x00444341
8000f754:	44414449 	strbmi	r4, [r1], #-1097	@ 0xfffffbb7
8000f758:	4f46424c 	svcmi	0x0046424c
8000f75c:	43414145 	movtmi	r4, #4421	@ 0x1145
8000f760:	4f434944 	svcmi	0x00434944
8000f764:	43414449 	movtmi	r4, #5193	@ 0x1449
8000f768:	4f46414c 	svcmi	0x0046414c
8000f76c:	44414141 	strbmi	r4, [r1], #-321	@ 0xfffffebf
8000f770:	4f464a44 	svcmi	0x00464a44
8000f774:	44414345 	strbmi	r4, [r1], #-837	@ 0xfffffcbb
8000f778:	4f46414c 	svcmi	0x0046414c
8000f77c:	44414245 	strbmi	r4, [r1], #-581	@ 0xfffffdbb
8000f780:	4f46424c 	svcmi	0x0046424c
8000f784:	43414441 	movtmi	r4, #5185	@ 0x1441
8000f788:	4f46424c 	svcmi	0x0046424c
8000f78c:	44414144 	strbmi	r4, [r1], #-324	@ 0xfffffebc
8000f790:	4f414943 	svcmi	0x00414943
8000f794:	42414345 	submi	r4, r1, #335544321	@ 0x14000001
8000f798:	4f46424c 	svcmi	0x0046424c
8000f79c:	41414144 	cmpmi	r1, r4, asr #2
8000f7a0:	4f424b41 	svcmi	0x00424b41
8000f7a4:	41414744 	cmpmi	r1, r4, asr #14
8000f7a8:	4f4c4141 	svcmi	0x004c4141
8000f7ac:	43414141 	movtmi	r4, #4417	@ 0x1141
8000f7b0:	4f424b41 	svcmi	0x00424b41
8000f7b4:	44414245 	strbmi	r4, [r1], #-581	@ 0xfffffdbb
8000f7b8:	4f46424c 	svcmi	0x0046424c
8000f7bc:	44414143 	strbmi	r4, [r1], #-323	@ 0xfffffebd
8000f7c0:	4f414944 	svcmi	0x00414944
8000f7c4:	44414245 	strbmi	r4, [r1], #-581	@ 0xfffffdbb
8000f7c8:	4f46414c 	svcmi	0x0046414c
8000f7cc:	4141454b 	cmpmi	r1, fp, asr #10
8000f7d0:	4f4b4141 	svcmi	0x004b4141
8000f7d4:	44414449 	strbmi	r4, [r1], #-1097	@ 0xfffffbb7
8000f7d8:	4f46424c 	svcmi	0x0046424c
8000f7dc:	43414145 	movtmi	r4, #4421	@ 0x1145
8000f7e0:	4f434944 	svcmi	0x00434944
8000f7e4:	43414449 	movtmi	r4, #5193	@ 0x1449
8000f7e8:	4f46414c 	svcmi	0x0046414c
8000f7ec:	42414141 	submi	r4, r1, #1073741840	@ 0x40000010
8000f7f0:	4f464a44 	svcmi	0x00464a44
8000f7f4:	44414245 	strbmi	r4, [r1], #-581	@ 0xfffffdbb
8000f7f8:	4f46424c 	svcmi	0x0046424c
8000f7fc:	43414441 	movtmi	r4, #5185	@ 0x1441
8000f800:	4f46424c 	svcmi	0x0046424c
8000f804:	44414144 	strbmi	r4, [r1], #-324	@ 0xfffffebc
8000f808:	4f414943 	svcmi	0x00414943
8000f80c:	43414842 	movtmi	r4, #6210	@ 0x1842
8000f810:	4f474f50 	svcmi	0x00474f50
8000f814:	43414141 	movtmi	r4, #4417	@ 0x1141
8000f818:	4f464d44 	svcmi	0x00464d44
8000f81c:	44414245 	strbmi	r4, [r1], #-581	@ 0xfffffdbb
8000f820:	4f46424c 	svcmi	0x0046424c
8000f824:	44414142 	strbmi	r4, [r1], #-322	@ 0xfffffebe
8000f828:	4f434944 	svcmi	0x00434944
8000f82c:	44414245 	strbmi	r4, [r1], #-581	@ 0xfffffdbb
8000f830:	4f46414c 	svcmi	0x0046414c
8000f834:	4141444e 	cmpmi	r1, lr, asr #8
8000f838:	4f4b4141 	svcmi	0x004b4141
8000f83c:	44414449 	strbmi	r4, [r1], #-1097	@ 0xfffffbb7
8000f840:	4f46424c 	svcmi	0x0046424c
8000f844:	43414145 	movtmi	r4, #4421	@ 0x1145
8000f848:	4f434944 	svcmi	0x00434944
8000f84c:	43414449 	movtmi	r4, #5193	@ 0x1449
8000f850:	4f46414c 	svcmi	0x0046414c
8000f854:	44414141 	strbmi	r4, [r1], #-321	@ 0xfffffebf
8000f858:	4f464a44 	svcmi	0x00464a44
8000f85c:	44414349 	strbmi	r4, [r1], #-841	@ 0xfffffcb7
8000f860:	4f46414c 	svcmi	0x0046414c
8000f864:	44414245 	strbmi	r4, [r1], #-581	@ 0xfffffdbb
8000f868:	4f46424c 	svcmi	0x0046424c
8000f86c:	43414441 	movtmi	r4, #5185	@ 0x1441
8000f870:	4f46424c 	svcmi	0x0046424c
8000f874:	44414144 	strbmi	r4, [r1], #-324	@ 0xfffffebc
8000f878:	4f414943 	svcmi	0x00414943
8000f87c:	42414349 	submi	r4, r1, #603979777	@ 0x24000001
8000f880:	4f46424c 	svcmi	0x0046424c
8000f884:	41414144 	cmpmi	r1, r4, asr #2
8000f888:	4f424b41 	svcmi	0x00424b41
8000f88c:	4141474a 	cmpmi	r1, sl, asr #14
8000f890:	4f4c4141 	svcmi	0x004c4141
8000f894:	43414141 	movtmi	r4, #4417	@ 0x1141
8000f898:	4f424b41 	svcmi	0x00424b41
8000f89c:	44414245 	strbmi	r4, [r1], #-581	@ 0xfffffdbb
8000f8a0:	4f46424c 	svcmi	0x0046424c
8000f8a4:	44414143 	strbmi	r4, [r1], #-323	@ 0xfffffebd
8000f8a8:	4f414944 	svcmi	0x00414944
8000f8ac:	44414245 	strbmi	r4, [r1], #-581	@ 0xfffffdbb
8000f8b0:	4f46414c 	svcmi	0x0046414c
8000f8b4:	4141434e 	cmpmi	r1, lr, asr #6
8000f8b8:	4f4b4141 	svcmi	0x004b4141
8000f8bc:	44414449 	strbmi	r4, [r1], #-1097	@ 0xfffffbb7
8000f8c0:	4f46424c 	svcmi	0x0046424c
8000f8c4:	43414145 	movtmi	r4, #4421	@ 0x1145
8000f8c8:	4f434944 	svcmi	0x00434944
8000f8cc:	43414449 	movtmi	r4, #5193	@ 0x1449
8000f8d0:	4f46414c 	svcmi	0x0046414c
8000f8d4:	44414141 	strbmi	r4, [r1], #-321	@ 0xfffffebf
8000f8d8:	4f464a44 	svcmi	0x00464a44
8000f8dc:	44414341 	strbmi	r4, [r1], #-833	@ 0xfffffcbf
8000f8e0:	4f46414c 	svcmi	0x0046414c
8000f8e4:	44414245 	strbmi	r4, [r1], #-581	@ 0xfffffdbb
8000f8e8:	4f46424c 	svcmi	0x0046424c
8000f8ec:	43414441 	movtmi	r4, #5185	@ 0x1441
8000f8f0:	4f46424c 	svcmi	0x0046424c
8000f8f4:	44414144 	strbmi	r4, [r1], #-324	@ 0xfffffebc
8000f8f8:	4f414943 	svcmi	0x00414943
8000f8fc:	4341414b 	movtmi	r4, #4427	@ 0x114b
8000f900:	4f444b41 	svcmi	0x00444b41
8000f904:	42414341 	submi	r4, r1, #67108865	@ 0x4000001
8000f908:	4f46424c 	svcmi	0x0046424c
8000f90c:	41414144 	cmpmi	r1, r4, asr #2
8000f910:	4f424b41 	svcmi	0x00424b41
8000f914:	4141484f 	cmpmi	r1, pc, asr #16
8000f918:	4f4c4141 	svcmi	0x004c4141
8000f91c:	43414141 	movtmi	r4, #4417	@ 0x1141
8000f920:	4f424b41 	svcmi	0x00424b41
8000f924:	44414245 	strbmi	r4, [r1], #-581	@ 0xfffffdbb
8000f928:	4f46424c 	svcmi	0x0046424c
8000f92c:	44414143 	strbmi	r4, [r1], #-323	@ 0xfffffebd
8000f930:	4f414944 	svcmi	0x00414944
8000f934:	44414245 	strbmi	r4, [r1], #-581	@ 0xfffffdbb
8000f938:	4f46414c 	svcmi	0x0046414c
8000f93c:	4141424d 	cmpmi	r1, sp, asr #4
8000f940:	4f4b4141 	svcmi	0x004b4141
8000f944:	44414449 	strbmi	r4, [r1], #-1097	@ 0xfffffbb7
8000f948:	4f46424c 	svcmi	0x0046424c
8000f94c:	43414145 	movtmi	r4, #4421	@ 0x1145
8000f950:	4f434944 	svcmi	0x00434944
8000f954:	43414449 	movtmi	r4, #5193	@ 0x1449
8000f958:	4f46414c 	svcmi	0x0046414c
8000f95c:	44414141 	strbmi	r4, [r1], #-321	@ 0xfffffebf
8000f960:	4f464a44 	svcmi	0x00464a44
8000f964:	4441424d 	strbmi	r4, [r1], #-589	@ 0xfffffdb3
8000f968:	4f46414c 	svcmi	0x0046414c
8000f96c:	44414245 	strbmi	r4, [r1], #-581	@ 0xfffffdbb
8000f970:	4f46424c 	svcmi	0x0046424c
8000f974:	43414441 	movtmi	r4, #5185	@ 0x1441
8000f978:	4f46424c 	svcmi	0x0046424c
8000f97c:	44414144 	strbmi	r4, [r1], #-324	@ 0xfffffebc
8000f980:	4f414943 	svcmi	0x00414943
8000f984:	43414a49 	movtmi	r4, #6729	@ 0x1a49
8000f988:	4f464a50 	svcmi	0x00464a50
8000f98c:	43414143 	movtmi	r4, #4419	@ 0x1143
8000f990:	4f414950 	svcmi	0x00414950
8000f994:	42414143 	submi	r4, r1, #-1073741808	@ 0xc0000010
8000f998:	4f424b41 	svcmi	0x00424b41
8000f99c:	41414144 	cmpmi	r1, r4, asr #2
8000f9a0:	4f424b41 	svcmi	0x00424b41
8000f9a4:	41414344 	cmpmi	r1, r4, asr #6
8000f9a8:	4f4c4141 	svcmi	0x004c4141
8000f9ac:	43414141 	movtmi	r4, #4417	@ 0x1141
8000f9b0:	4f424b41 	svcmi	0x00424b41
8000f9b4:	44414245 	strbmi	r4, [r1], #-581	@ 0xfffffdbb
8000f9b8:	4f46424c 	svcmi	0x0046424c
8000f9bc:	44414143 	strbmi	r4, [r1], #-323	@ 0xfffffebd
8000f9c0:	4f414944 	svcmi	0x00414944
8000f9c4:	44414245 	strbmi	r4, [r1], #-581	@ 0xfffffdbb
8000f9c8:	4f46414c 	svcmi	0x0046414c
8000f9cc:	44414245 	strbmi	r4, [r1], #-581	@ 0xfffffdbb
8000f9d0:	4f46424c 	svcmi	0x0046424c
8000f9d4:	43414441 	movtmi	r4, #5185	@ 0x1441
8000f9d8:	4f46424c 	svcmi	0x0046424c
8000f9dc:	44414144 	strbmi	r4, [r1], #-324	@ 0xfffffebc
8000f9e0:	4f414943 	svcmi	0x00414943
8000f9e4:	4241424d 	submi	r4, r1, #-805306364	@ 0xd0000004
8000f9e8:	4f46424c 	svcmi	0x0046424c
8000f9ec:	43414241 	movtmi	r4, #4673	@ 0x1241
8000f9f0:	4f444b41 	svcmi	0x00444b41
8000f9f4:	41414144 	cmpmi	r1, r4, asr #2
8000f9f8:	4f424b41 	svcmi	0x00424b41
8000f9fc:	41414742 	cmpmi	r1, r2, asr #14
8000fa00:	4f4c4141 	svcmi	0x004c4141
8000fa04:	43414141 	movtmi	r4, #4417	@ 0x1141
8000fa08:	4f424b41 	svcmi	0x00424b41
8000fa0c:	44414245 	strbmi	r4, [r1], #-581	@ 0xfffffdbb
8000fa10:	4f46424c 	svcmi	0x0046424c
8000fa14:	44414143 	strbmi	r4, [r1], #-323	@ 0xfffffebd
8000fa18:	4f414944 	svcmi	0x00414944
8000fa1c:	44414245 	strbmi	r4, [r1], #-581	@ 0xfffffdbb
8000fa20:	4f46414c 	svcmi	0x0046414c
8000fa24:	50414141 	subpl	r4, r1, r1, asr #2
8000fa28:	4f444341 	svcmi	0x00444341
8000fa2c:	44414241 	strbmi	r4, [r1], #-577	@ 0xfffffdbf
8000fa30:	4f46424c 	svcmi	0x0046424c
8000fa34:	44414143 	strbmi	r4, [r1], #-323	@ 0xfffffebd
8000fa38:	4f434944 	svcmi	0x00434944
8000fa3c:	44414241 	strbmi	r4, [r1], #-577	@ 0xfffffdbf
8000fa40:	4f46414c 	svcmi	0x0046414c
8000fa44:	44414241 	strbmi	r4, [r1], #-577	@ 0xfffffdbf
8000fa48:	4f46424c 	svcmi	0x0046424c
8000fa4c:	43414445 	movtmi	r4, #5189	@ 0x1445
8000fa50:	4f46424c 	svcmi	0x0046424c
8000fa54:	44414144 	strbmi	r4, [r1], #-324	@ 0xfffffebc
8000fa58:	4f414943 	svcmi	0x00414943
8000fa5c:	44414141 	strbmi	r4, [r1], #-321	@ 0xfffffebf
8000fa60:	4f464e44 	svcmi	0x00464e44
8000fa64:	41414141 	cmpmi	r1, r1, asr #2
8000fa68:	4f444644 	svcmi	0x00444644
8000fa6c:	50504743 	subspl	r4, r0, r3, asr #14
8000fa70:	424b5050 	submi	r5, fp, #80	@ 0x50
8000fa74:	44414245 	strbmi	r4, [r1], #-581	@ 0xfffffdbb
8000fa78:	4f46424c 	svcmi	0x0046424c
8000fa7c:	43414441 	movtmi	r4, #5185	@ 0x1441
8000fa80:	4f46424c 	svcmi	0x0046424c
8000fa84:	44414144 	strbmi	r4, [r1], #-324	@ 0xfffffebc
8000fa88:	4f414943 	svcmi	0x00414943
8000fa8c:	43414141 	movtmi	r4, #4417	@ 0x1141
8000fa90:	4f444b41 	svcmi	0x00444b41
8000fa94:	43414141 	movtmi	r4, #4417	@ 0x1141
8000fa98:	4f464d44 	svcmi	0x00464d44
8000fa9c:	44414245 	strbmi	r4, [r1], #-581	@ 0xfffffdbb
8000faa0:	4f46424c 	svcmi	0x0046424c
8000faa4:	41414144 	cmpmi	r1, r4, asr #2
8000faa8:	4f424b41 	svcmi	0x00424b41
8000faac:	4e41414d 	cdpmi	1, 4, cr4, cr1, cr13, {2}
8000fab0:	4f43454c 	svcmi	0x0043454c
8000fab4:	4b494141 	blmi	8125ffc0 <irq_stack_start+0x1205fb0>
8000fab8:	4f494a4e 	svcmi	0x00494a4e
8000fabc:	41454d49 	cmpmi	r5, r9, asr #26
8000fac0:	41414141 	cmpmi	r1, r1, asr #2
8000fac4:	41444a41 	cmpmi	r4, r1, asr #20
8000fac8:	41414141 	cmpmi	r1, r1, asr #2
8000facc:	4d41414e 	stclmi	1, cr4, [r1, #-312]	@ 0xfffffec8
8000fad0:	4f424b41 	svcmi	0x00424b41
8000fad4:	4e494141 	cdpmi	1, 4, cr4, cr9, cr1, {2}
8000fad8:	4f4a434e 	svcmi	0x004a434e
8000fadc:	4c414145 	mcrrmi	1, 4, r4, r1, cr5
8000fae0:	4f43454d 	svcmi	0x0043454d
8000fae4:	4e414241 	cdpmi	2, 4, cr4, cr1, cr1, {2}
8000fae8:	4f43454e 	svcmi	0x0043454e
8000faec:	41414249 	cmpmi	r1, r9, asr #4
8000faf0:	4f46414c 	svcmi	0x0046414c
8000faf4:	4241424d 	submi	r4, r1, #-805306364	@ 0xd0000004
8000faf8:	4f46414c 	svcmi	0x0046414c
8000fafc:	44414141 	strbmi	r4, [r1], #-321	@ 0xfffffebf
8000fb00:	4f444b41 	svcmi	0x00444b41
8000fb04:	44414241 	strbmi	r4, [r1], #-577	@ 0xfffffdbf
8000fb08:	4f46414c 	svcmi	0x0046414c
8000fb0c:	44414141 	strbmi	r4, [r1], #-321	@ 0xfffffebf
8000fb10:	4f444b41 	svcmi	0x00444b41
8000fb14:	44414245 	strbmi	r4, [r1], #-581	@ 0xfffffdbb
8000fb18:	4f46414c 	svcmi	0x0046414c
8000fb1c:	4141414e 	cmpmi	r1, lr, asr #2
8000fb20:	4f4b4141 	svcmi	0x004b4141
8000fb24:	44414245 	strbmi	r4, [r1], #-581	@ 0xfffffdbb
8000fb28:	4f46424c 	svcmi	0x0046424c
8000fb2c:	4341424d 	movtmi	r4, #4685	@ 0x124d
8000fb30:	4f46424c 	svcmi	0x0046424c
8000fb34:	43414144 	movtmi	r4, #4420	@ 0x1144
8000fb38:	4f414943 	svcmi	0x00414943
8000fb3c:	44414241 	strbmi	r4, [r1], #-577	@ 0xfffffdbf
8000fb40:	4f46424c 	svcmi	0x0046424c
8000fb44:	42414249 	submi	r4, r1, #-1879048188	@ 0x90000004
8000fb48:	4f46424c 	svcmi	0x0046424c
8000fb4c:	44414144 	strbmi	r4, [r1], #-324	@ 0xfffffebc
8000fb50:	4f414942 	svcmi	0x00414942
8000fb54:	43414141 	movtmi	r4, #4417	@ 0x1141
8000fb58:	4f464e43 	svcmi	0x00464e43
8000fb5c:	43414141 	movtmi	r4, #4417	@ 0x1141
8000fb60:	4f464d44 	svcmi	0x00464d44
8000fb64:	44414241 	strbmi	r4, [r1], #-577	@ 0xfffffdbf
8000fb68:	4f46424c 	svcmi	0x0046424c
8000fb6c:	44414142 	strbmi	r4, [r1], #-322	@ 0xfffffebe
8000fb70:	4f434944 	svcmi	0x00434944
8000fb74:	44414241 	strbmi	r4, [r1], #-577	@ 0xfffffdbf
8000fb78:	4f46414c 	svcmi	0x0046414c
8000fb7c:	44414245 	strbmi	r4, [r1], #-581	@ 0xfffffdbb
8000fb80:	4f46424c 	svcmi	0x0046424c
8000fb84:	44414142 	strbmi	r4, [r1], #-322	@ 0xfffffebe
8000fb88:	4f434944 	svcmi	0x00434944
8000fb8c:	44414245 	strbmi	r4, [r1], #-581	@ 0xfffffdbb
8000fb90:	4f46414c 	svcmi	0x0046414c
8000fb94:	44414245 	strbmi	r4, [r1], #-581	@ 0xfffffdbb
8000fb98:	4f46424c 	svcmi	0x0046424c
8000fb9c:	4341424d 	movtmi	r4, #4685	@ 0x124d
8000fba0:	4f46424c 	svcmi	0x0046424c
8000fba4:	44414144 	strbmi	r4, [r1], #-324	@ 0xfffffebc
8000fba8:	4f414943 	svcmi	0x00414943
8000fbac:	44414141 	strbmi	r4, [r1], #-321	@ 0xfffffebf
8000fbb0:	4f464e44 	svcmi	0x00464e44
8000fbb4:	41414141 	cmpmi	r1, r1, asr #2
8000fbb8:	4f444644 	svcmi	0x00444644
8000fbbc:	50504f4c 	subspl	r4, r0, ip, asr #30
8000fbc0:	424b5050 	submi	r5, fp, #80	@ 0x50
8000fbc4:	44414245 	strbmi	r4, [r1], #-581	@ 0xfffffdbb
8000fbc8:	4f46424c 	svcmi	0x0046424c
8000fbcc:	41414144 	cmpmi	r1, r4, asr #2
8000fbd0:	4f424b41 	svcmi	0x00424b41
8000fbd4:	4e41414d 	cdpmi	1, 4, cr4, cr1, cr13, {2}
8000fbd8:	4f43454c 	svcmi	0x0043454c
8000fbdc:	4b494141 	blmi	812600e8 <irq_stack_start+0x12060d8>
8000fbe0:	4f494a4e 	svcmi	0x00494a4e
8000fbe4:	4d41414e 	stclmi	1, cr4, [r1, #-312]	@ 0xfffffec8
8000fbe8:	4f424b41 	svcmi	0x00424b41
8000fbec:	4e494141 	cdpmi	1, 4, cr4, cr9, cr1, {2}
8000fbf0:	4f4a434e 	svcmi	0x004a434e
8000fbf4:	4c414145 	mcrrmi	1, 4, r4, r1, cr5
8000fbf8:	4f43454d 	svcmi	0x0043454d
8000fbfc:	4e414241 	cdpmi	2, 4, cr4, cr1, cr1, {2}
8000fc00:	4f43454e 	svcmi	0x0043454e
8000fc04:	41414249 	cmpmi	r1, r9, asr #4
8000fc08:	4f46414c 	svcmi	0x0046414c
8000fc0c:	4241424d 	submi	r4, r1, #-805306364	@ 0xd0000004
8000fc10:	4f46414c 	svcmi	0x0046414c
8000fc14:	44414141 	strbmi	r4, [r1], #-321	@ 0xfffffebf
8000fc18:	4f444b41 	svcmi	0x00444b41
8000fc1c:	44414241 	strbmi	r4, [r1], #-577	@ 0xfffffdbf
8000fc20:	4f46414c 	svcmi	0x0046414c
8000fc24:	4441424d 	strbmi	r4, [r1], #-589	@ 0xfffffdb3
8000fc28:	4f46424c 	svcmi	0x0046424c
8000fc2c:	41414141 	cmpmi	r1, r1, asr #2
8000fc30:	4f444644 	svcmi	0x00444644
8000fc34:	41414241 	cmpmi	r1, r1, asr #4
8000fc38:	4b4b4141 	blmi	812e0144 <irq_stack_start+0x1286134>
8000fc3c:	44414249 	strbmi	r4, [r1], #-585	@ 0xfffffdb7
8000fc40:	4f46424c 	svcmi	0x0046424c
8000fc44:	4341434e 	movtmi	r4, #4942	@ 0x134e
8000fc48:	4f444b41 	svcmi	0x00444b41
8000fc4c:	43414141 	movtmi	r4, #4417	@ 0x1141
8000fc50:	4f464d44 	svcmi	0x00464d44
8000fc54:	44414142 	strbmi	r4, [r1], #-322	@ 0xfffffebe
8000fc58:	4f444b41 	svcmi	0x00444b41
8000fc5c:	44414241 	strbmi	r4, [r1], #-577	@ 0xfffffdbf
8000fc60:	4f46414c 	svcmi	0x0046414c
8000fc64:	44414249 	strbmi	r4, [r1], #-585	@ 0xfffffdb7
8000fc68:	4f46424c 	svcmi	0x0046424c
8000fc6c:	41414142 	cmpmi	r1, r2, asr #2
8000fc70:	4f434944 	svcmi	0x00434944
8000fc74:	4441424d 	strbmi	r4, [r1], #-589	@ 0xfffffdb3
8000fc78:	4f46424c 	svcmi	0x0046424c
8000fc7c:	44414141 	strbmi	r4, [r1], #-321	@ 0xfffffebf
8000fc80:	4f434744 	svcmi	0x00434744
8000fc84:	4341414b 	movtmi	r4, #4427	@ 0x114b
8000fc88:	4f444b41 	svcmi	0x00444b41
8000fc8c:	42414144 	submi	r4, r1, #68, 2
8000fc90:	4f424b41 	svcmi	0x00424b41
8000fc94:	4141414f 	cmpmi	r1, pc, asr #2
8000fc98:	4f4c4141 	svcmi	0x004c4141
8000fc9c:	43414141 	movtmi	r4, #4417	@ 0x1141
8000fca0:	4f424b41 	svcmi	0x00424b41
8000fca4:	44414241 	strbmi	r4, [r1], #-577	@ 0xfffffdbf
8000fca8:	4f46424c 	svcmi	0x0046424c
8000fcac:	44414143 	strbmi	r4, [r1], #-323	@ 0xfffffebd
8000fcb0:	4f414944 	svcmi	0x00414944
8000fcb4:	44414241 	strbmi	r4, [r1], #-577	@ 0xfffffdbf
8000fcb8:	4f46414c 	svcmi	0x0046414c
8000fcbc:	41414146 	cmpmi	r1, r6, asr #2
8000fcc0:	4f4b4141 	svcmi	0x004b4141
8000fcc4:	4441424d 	strbmi	r4, [r1], #-589	@ 0xfffffdb3
8000fcc8:	4f46424c 	svcmi	0x0046424c
8000fccc:	4341414b 	movtmi	r4, #4427	@ 0x114b
8000fcd0:	4f444b41 	svcmi	0x00444b41
8000fcd4:	42414144 	submi	r4, r1, #68, 2
8000fcd8:	4f424b41 	svcmi	0x00424b41
8000fcdc:	41414249 	cmpmi	r1, r9, asr #4
8000fce0:	4f46424c 	svcmi	0x0046424c
8000fce4:	41414145 	cmpmi	r1, r5, asr #2
8000fce8:	4f4c4141 	svcmi	0x004c4141
8000fcec:	41414241 	cmpmi	r1, r1, asr #4
8000fcf0:	4f46414c 	svcmi	0x0046414c
8000fcf4:	44414241 	strbmi	r4, [r1], #-577	@ 0xfffffdbf
8000fcf8:	4f46424c 	svcmi	0x0046424c
8000fcfc:	41414144 	cmpmi	r1, r4, asr #2
8000fd00:	4f424b41 	svcmi	0x00424b41
8000fd04:	4e41414d 	cdpmi	1, 4, cr4, cr1, cr13, {2}
8000fd08:	4f43454c 	svcmi	0x0043454c
8000fd0c:	4b494141 	blmi	81260218 <irq_stack_start+0x1206208>
8000fd10:	4f494a4e 	svcmi	0x00494a4e
8000fd14:	4d41414e 	stclmi	1, cr4, [r1, #-312]	@ 0xfffffec8
8000fd18:	4f424b41 	svcmi	0x00424b41
8000fd1c:	4e494141 	cdpmi	1, 4, cr4, cr9, cr1, {2}
8000fd20:	4f4a434e 	svcmi	0x004a434e
8000fd24:	4c414145 	mcrrmi	1, 4, r4, r1, cr5
8000fd28:	4f43454d 	svcmi	0x0043454d
8000fd2c:	4e414341 	cdpmi	3, 4, cr4, cr1, cr1, {2}
8000fd30:	4f43454e 	svcmi	0x0043454e
8000fd34:	41414341 	cmpmi	r1, r1, asr #6
8000fd38:	4f46414c 	svcmi	0x0046414c
8000fd3c:	42414345 	submi	r4, r1, #335544321	@ 0x14000001
8000fd40:	4f46414c 	svcmi	0x0046414c
8000fd44:	43414349 	movtmi	r4, #4937	@ 0x1349
8000fd48:	4f46414c 	svcmi	0x0046414c
8000fd4c:	44414141 	strbmi	r4, [r1], #-321	@ 0xfffffebf
8000fd50:	4f444b41 	svcmi	0x00444b41
8000fd54:	44414241 	strbmi	r4, [r1], #-577	@ 0xfffffdbf
8000fd58:	4f46414c 	svcmi	0x0046414c
8000fd5c:	44414141 	strbmi	r4, [r1], #-321	@ 0xfffffebf
8000fd60:	4f444b41 	svcmi	0x00444b41
8000fd64:	44414249 	strbmi	r4, [r1], #-585	@ 0xfffffdb7
8000fd68:	4f46414c 	svcmi	0x0046414c
8000fd6c:	44414141 	strbmi	r4, [r1], #-321	@ 0xfffffebf
8000fd70:	4f444b41 	svcmi	0x00444b41
8000fd74:	44414245 	strbmi	r4, [r1], #-581	@ 0xfffffdbb
8000fd78:	4f46414c 	svcmi	0x0046414c
8000fd7c:	44414249 	strbmi	r4, [r1], #-585	@ 0xfffffdb7
8000fd80:	4f43454c 	svcmi	0x0043454c
8000fd84:	43414144 	movtmi	r4, #4420	@ 0x1144
8000fd88:	4f424b41 	svcmi	0x00424b41
8000fd8c:	42414349 	submi	r4, r1, #603979777	@ 0x24000001
8000fd90:	4f46424c 	svcmi	0x0046424c
8000fd94:	41414345 	cmpmi	r1, r5, asr #6
8000fd98:	4f46424c 	svcmi	0x0046424c
8000fd9c:	41414249 	cmpmi	r1, r9, asr #4
8000fda0:	4f4c4141 	svcmi	0x004c4141
8000fda4:	41414245 	cmpmi	r1, r5, asr #4
8000fda8:	4f46414c 	svcmi	0x0046414c
8000fdac:	44414245 	strbmi	r4, [r1], #-581	@ 0xfffffdbb
8000fdb0:	4f46424c 	svcmi	0x0046424c
8000fdb4:	41414141 	cmpmi	r1, r1, asr #2
8000fdb8:	4f444644 	svcmi	0x00444644
8000fdbc:	41414145 	cmpmi	r1, r5, asr #2
8000fdc0:	414b4141 	cmpmi	fp, r1, asr #2
8000fdc4:	43414349 	movtmi	r4, #4937	@ 0x1349
8000fdc8:	4f46424c 	svcmi	0x0046424c
8000fdcc:	42414245 	submi	r4, r1, #1342177284	@ 0x50000004
8000fdd0:	4f46424c 	svcmi	0x0046424c
8000fdd4:	41414341 	cmpmi	r1, r1, asr #6
8000fdd8:	4f46424c 	svcmi	0x0046424c
8000fddc:	50504f46 	subspl	r4, r0, r6, asr #30
8000fde0:	4f4c5050 	svcmi	0x004c5050
8000fde4:	41414241 	cmpmi	r1, r1, asr #4
8000fde8:	4f46414c 	svcmi	0x0046414c
8000fdec:	43414249 	movtmi	r4, #4681	@ 0x1249
8000fdf0:	4f46424c 	svcmi	0x0046424c
8000fdf4:	44414241 	strbmi	r4, [r1], #-577	@ 0xfffffdbf
8000fdf8:	4f46424c 	svcmi	0x0046424c
8000fdfc:	42414341 	submi	r4, r1, #67108865	@ 0x4000001
8000fe00:	4f46424c 	svcmi	0x0046424c
8000fe04:	44414144 	strbmi	r4, [r1], #-324	@ 0xfffffebc
8000fe08:	4f414942 	svcmi	0x00414942
8000fe0c:	42414345 	submi	r4, r1, #335544321	@ 0x14000001
8000fe10:	4f464a50 	svcmi	0x00464a50
8000fe14:	42414142 	submi	r4, r1, #-2147483632	@ 0x80000010
8000fe18:	4f414950 	svcmi	0x00414950
8000fe1c:	43414143 	movtmi	r4, #4419	@ 0x1143
8000fe20:	4f484e42 	svcmi	0x00484e42
8000fe24:	43414141 	movtmi	r4, #4417	@ 0x1141
8000fe28:	4f464d44 	svcmi	0x00464d44
8000fe2c:	44414241 	strbmi	r4, [r1], #-577	@ 0xfffffdbf
8000fe30:	4f46424c 	svcmi	0x0046424c
8000fe34:	44414142 	strbmi	r4, [r1], #-322	@ 0xfffffebe
8000fe38:	4f434944 	svcmi	0x00434944
8000fe3c:	44414241 	strbmi	r4, [r1], #-577	@ 0xfffffdbf
8000fe40:	4f46414c 	svcmi	0x0046414c
8000fe44:	44414241 	strbmi	r4, [r1], #-577	@ 0xfffffdbf
8000fe48:	4f46424c 	svcmi	0x0046424c
8000fe4c:	41414144 	cmpmi	r1, r4, asr #2
8000fe50:	4f424b41 	svcmi	0x00424b41
8000fe54:	4e41414d 	cdpmi	1, 4, cr4, cr1, cr13, {2}
8000fe58:	4f43454c 	svcmi	0x0043454c
8000fe5c:	4b494141 	blmi	81260368 <irq_stack_start+0x1206358>
8000fe60:	4f494a4e 	svcmi	0x00494a4e
8000fe64:	41424b49 	cmpmi	r2, r9, asr #22
8000fe68:	41414141 	cmpmi	r1, r1, asr #2
8000fe6c:	4d41414e 	stclmi	1, cr4, [r1, #-312]	@ 0xfffffec8
8000fe70:	4f424b41 	svcmi	0x00424b41
8000fe74:	4e494141 	cdpmi	1, 4, cr4, cr9, cr1, {2}
8000fe78:	4f4a434e 	svcmi	0x004a434e
8000fe7c:	4c414145 	mcrrmi	1, 4, r4, r1, cr5
8000fe80:	4f43454d 	svcmi	0x0043454d
8000fe84:	4e414341 	cdpmi	3, 4, cr4, cr1, cr1, {2}
8000fe88:	4f43454e 	svcmi	0x0043454e
8000fe8c:	41414341 	cmpmi	r1, r1, asr #6
8000fe90:	4f46414c 	svcmi	0x0046414c
8000fe94:	42414345 	submi	r4, r1, #335544321	@ 0x14000001
8000fe98:	4f46414c 	svcmi	0x0046414c
8000fe9c:	43414349 	movtmi	r4, #4937	@ 0x1349
8000fea0:	4f46414c 	svcmi	0x0046414c
8000fea4:	44414141 	strbmi	r4, [r1], #-321	@ 0xfffffebf
8000fea8:	4f444b41 	svcmi	0x00444b41
8000feac:	44414241 	strbmi	r4, [r1], #-577	@ 0xfffffdbf
8000feb0:	4f46414c 	svcmi	0x0046414c
8000feb4:	44414141 	strbmi	r4, [r1], #-321	@ 0xfffffebf
8000feb8:	4f444b41 	svcmi	0x00444b41
8000febc:	44414245 	strbmi	r4, [r1], #-581	@ 0xfffffdbb
8000fec0:	4f46414c 	svcmi	0x0046414c
8000fec4:	44414141 	strbmi	r4, [r1], #-321	@ 0xfffffebf
8000fec8:	4f444b41 	svcmi	0x00444b41
8000fecc:	44414249 	strbmi	r4, [r1], #-585	@ 0xfffffdb7
8000fed0:	4f46414c 	svcmi	0x0046414c
8000fed4:	44414250 	strbmi	r4, [r1], #-592	@ 0xfffffdb0
8000fed8:	4f444b41 	svcmi	0x00444b41
8000fedc:	44414241 	strbmi	r4, [r1], #-577	@ 0xfffffdbf
8000fee0:	4f46414c 	svcmi	0x0046414c
8000fee4:	41414250 	cmpmi	r1, r0, asr r2
8000fee8:	4f4b4141 	svcmi	0x004b4141
8000feec:	43414142 	movtmi	r4, #4418	@ 0x1142
8000fef0:	4f444b41 	svcmi	0x00444b41
8000fef4:	44414241 	strbmi	r4, [r1], #-577	@ 0xfffffdbf
8000fef8:	4f46424c 	svcmi	0x0046424c
8000fefc:	43444243 	movtmi	r4, #16963	@ 0x4243
8000ff00:	4f424b41 	svcmi	0x00424b41
8000ff04:	44414341 	strbmi	r4, [r1], #-833	@ 0xfffffcbf
8000ff08:	4f46424c 	svcmi	0x0046424c
8000ff0c:	44414143 	strbmi	r4, [r1], #-323	@ 0xfffffebd
8000ff10:	4f414144 	svcmi	0x00414144
8000ff14:	41414141 	cmpmi	r1, r1, asr #2
8000ff18:	4f444644 	svcmi	0x00444644
8000ff1c:	44414142 	strbmi	r4, [r1], #-322	@ 0xfffffebe
8000ff20:	42444b41 	submi	r4, r4, #66560	@ 0x10400
8000ff24:	44414141 	strbmi	r4, [r1], #-321	@ 0xfffffebf
8000ff28:	41444b41 	cmpmi	r4, r1, asr #22
8000ff2c:	44414844 	strbmi	r4, [r1], #-2116	@ 0xfffff7bc
8000ff30:	4f474f50 	svcmi	0x00474f50
8000ff34:	4441424d 	strbmi	r4, [r1], #-589	@ 0xfffffdb3
8000ff38:	4f46414c 	svcmi	0x0046414c
8000ff3c:	44414249 	strbmi	r4, [r1], #-585	@ 0xfffffdb7
8000ff40:	4f46424c 	svcmi	0x0046424c
8000ff44:	44414944 	strbmi	r4, [r1], #-2372	@ 0xfffff6bc
8000ff48:	4f424b41 	svcmi	0x00424b41
8000ff4c:	4341424d 	movtmi	r4, #4685	@ 0x124d
8000ff50:	4f46424c 	svcmi	0x0046424c
8000ff54:	44414144 	strbmi	r4, [r1], #-324	@ 0xfffffebc
8000ff58:	4f424943 	svcmi	0x00424943
8000ff5c:	44414249 	strbmi	r4, [r1], #-585	@ 0xfffffdb7
8000ff60:	4f46414c 	svcmi	0x0046414c
8000ff64:	43414249 	movtmi	r4, #4681	@ 0x1249
8000ff68:	4f46424c 	svcmi	0x0046424c
8000ff6c:	44414345 	strbmi	r4, [r1], #-837	@ 0xfffffcbb
8000ff70:	4f46424c 	svcmi	0x0046424c
8000ff74:	41414144 	cmpmi	r1, r4, asr #2
8000ff78:	4f424643 	svcmi	0x00424643
8000ff7c:	4141414a 	cmpmi	r1, sl, asr #2
8000ff80:	444b4141 	strbmi	r4, [fp], #-321	@ 0xfffffebf
8000ff84:	43414249 	movtmi	r4, #4681	@ 0x1249
8000ff88:	4f46424c 	svcmi	0x0046424c
8000ff8c:	44414345 	strbmi	r4, [r1], #-837	@ 0xfffffcbb
8000ff90:	4f46424c 	svcmi	0x0046424c
8000ff94:	44414144 	strbmi	r4, [r1], #-324	@ 0xfffffebc
8000ff98:	4f414543 	svcmi	0x00414543
8000ff9c:	44414249 	strbmi	r4, [r1], #-585	@ 0xfffffdb7
8000ffa0:	4f46414c 	svcmi	0x0046414c
8000ffa4:	43414142 	movtmi	r4, #4418	@ 0x1142
8000ffa8:	4f444b41 	svcmi	0x00444b41
8000ffac:	44414241 	strbmi	r4, [r1], #-577	@ 0xfffffdbf
8000ffb0:	4f46424c 	svcmi	0x0046424c
8000ffb4:	44444243 	strbmi	r4, [r4], #-579	@ 0xfffffdbd
8000ffb8:	4f424b41 	svcmi	0x00424b41
8000ffbc:	43414245 	movtmi	r4, #4677	@ 0x1245
8000ffc0:	4f46424c 	svcmi	0x0046424c
8000ffc4:	44414144 	strbmi	r4, [r1], #-324	@ 0xfffffebc
8000ffc8:	4f424943 	svcmi	0x00424943
8000ffcc:	44414245 	strbmi	r4, [r1], #-581	@ 0xfffffdbb
8000ffd0:	4f46414c 	svcmi	0x0046414c
8000ffd4:	44414241 	strbmi	r4, [r1], #-577	@ 0xfffffdbf
8000ffd8:	4f46424c 	svcmi	0x0046424c
8000ffdc:	44414142 	strbmi	r4, [r1], #-322	@ 0xfffffebe
8000ffe0:	4f434544 	svcmi	0x00434544
8000ffe4:	44414241 	strbmi	r4, [r1], #-577	@ 0xfffffdbf
8000ffe8:	4f46414c 	svcmi	0x0046414c
8000ffec:	44414241 	strbmi	r4, [r1], #-577	@ 0xfffffdbf
8000fff0:	4f46424c 	svcmi	0x0046424c
8000fff4:	41414141 	cmpmi	r1, r1, asr #2
8000fff8:	4f444644 	svcmi	0x00444644
8000fffc:	50504e4d 	subspl	r4, r0, sp, asr #28
80010000:	4b4b5050 	blmi	812e4148 <irq_stack_start+0x128a138>
80010004:	44414349 	strbmi	r4, [r1], #-841	@ 0xfffffcb7
80010008:	4f46424c 	svcmi	0x0046424c
8001000c:	41414141 	cmpmi	r1, r1, asr #2
80010010:	4f444644 	svcmi	0x00444644
80010014:	41414143 	cmpmi	r1, r3, asr #2
80010018:	414b4141 	cmpmi	fp, r1, asr #2
8001001c:	44414349 	strbmi	r4, [r1], #-841	@ 0xfffffcb7
80010020:	4f46424c 	svcmi	0x0046424c
80010024:	43414249 	movtmi	r4, #4681	@ 0x1249
80010028:	4f46424c 	svcmi	0x0046424c
8001002c:	43414141 	movtmi	r4, #4417	@ 0x1141
80010030:	4f464944 	svcmi	0x00464944
80010034:	44414245 	strbmi	r4, [r1], #-581	@ 0xfffffdbb
80010038:	4f46424c 	svcmi	0x0046424c
8001003c:	41414144 	cmpmi	r1, r4, asr #2
80010040:	4f424b41 	svcmi	0x00424b41
80010044:	4e41414d 	cdpmi	1, 4, cr4, cr1, cr13, {2}
80010048:	4f43454c 	svcmi	0x0043454c
8001004c:	4b494141 	blmi	81260558 <irq_stack_start+0x1206548>
80010050:	4f494a4e 	svcmi	0x00494a4e
80010054:	43414345 	movtmi	r4, #4933	@ 0x1345
80010058:	41414141 	cmpmi	r1, r1, asr #2
8001005c:	42414142 	submi	r4, r1, #-2147483632	@ 0x80000010
80010060:	464c424c 	strbmi	r4, [ip], -ip, asr #4
80010064:	41414542 	cmpmi	r1, r2, asr #10
80010068:	41414141 	cmpmi	r1, r1, asr #2
8001006c:	42414143 	submi	r4, r1, #-1073741808	@ 0xc0000010
80010070:	464c424c 	strbmi	r4, [ip], -ip, asr #4
80010074:	41414543 	cmpmi	r1, r3, asr #10
80010078:	41414141 	cmpmi	r1, r1, asr #2
8001007c:	42414144 	submi	r4, r1, #68, 2
80010080:	464c424c 	strbmi	r4, [ip], -ip, asr #4
80010084:	41414544 	cmpmi	r1, r4, asr #10
80010088:	41414141 	cmpmi	r1, r1, asr #2
8001008c:	42414145 	submi	r4, r1, #1073741841	@ 0x40000011
80010090:	464c424c 	strbmi	r4, [ip], -ip, asr #4
80010094:	41414545 	cmpmi	r1, r5, asr #10
80010098:	41414141 	cmpmi	r1, r1, asr #2
8001009c:	42414146 	submi	r4, r1, #-2147483631	@ 0x80000011
800100a0:	41414850 	cmpmi	r1, r0, asr r8
800100a4:	41414141 	cmpmi	r1, r1, asr #2
800100a8:	41414141 	cmpmi	r1, r1, asr #2
800100ac:	42414146 	submi	r4, r1, #-2147483631	@ 0x80000011
800100b0:	41414149 	cmpmi	r1, r9, asr #2
800100b4:	41414141 	cmpmi	r1, r1, asr #2
800100b8:	41414141 	cmpmi	r1, r1, asr #2
800100bc:	48494441 	stmdami	r9, {r0, r6, sl, lr}^
800100c0:	41414141 	cmpmi	r1, r1, asr #2
800100c4:	41414541 	cmpmi	r1, r1, asr #10
800100c8:	41414141 	cmpmi	r1, r1, asr #2
800100cc:	41414845 	cmpmi	r1, r5, asr #16
800100d0:	41414141 	cmpmi	r1, r1, asr #2
800100d4:	4142474d 	cmpmi	r2, sp, asr #14
800100d8:	41414141 	cmpmi	r1, r1, asr #2
800100dc:	4142474d 	cmpmi	r2, sp, asr #14
800100e0:	41414141 	cmpmi	r1, r1, asr #2
800100e4:	4142474d 	cmpmi	r2, sp, asr #14
800100e8:	41414141 	cmpmi	r1, r1, asr #2
800100ec:	4142474d 	cmpmi	r2, sp, asr #14
800100f0:	41414141 	cmpmi	r1, r1, asr #2
800100f4:	4142474d 	cmpmi	r2, sp, asr #14
800100f8:	41414141 	cmpmi	r1, r1, asr #2
800100fc:	4142474d 	cmpmi	r2, sp, asr #14
80010100:	41414141 	cmpmi	r1, r1, asr #2
80010104:	4142474d 	cmpmi	r2, sp, asr #14
80010108:	41414141 	cmpmi	r1, r1, asr #2
8001010c:	4142474d 	cmpmi	r2, sp, asr #14
80010110:	41414141 	cmpmi	r1, r1, asr #2
80010114:	4142474d 	cmpmi	r2, sp, asr #14
80010118:	41414141 	cmpmi	r1, r1, asr #2
8001011c:	4142474d 	cmpmi	r2, sp, asr #14
80010120:	41414141 	cmpmi	r1, r1, asr #2
80010124:	4142474d 	cmpmi	r2, sp, asr #14
80010128:	41414141 	cmpmi	r1, r1, asr #2
8001012c:	4142474d 	cmpmi	r2, sp, asr #14
80010130:	41414141 	cmpmi	r1, r1, asr #2
80010134:	4142474d 	cmpmi	r2, sp, asr #14
80010138:	41414141 	cmpmi	r1, r1, asr #2
8001013c:	4142474d 	cmpmi	r2, sp, asr #14
80010140:	41414141 	cmpmi	r1, r1, asr #2
80010144:	41414141 	cmpmi	r1, r1, asr #2
80010148:	41414141 	cmpmi	r1, r1, asr #2
8001014c:	4142474d 	cmpmi	r2, sp, asr #14
80010150:	41414141 	cmpmi	r1, r1, asr #2
80010154:	41414c45 	cmpmi	r1, r5, asr #24
80010158:	41414141 	cmpmi	r1, r1, asr #2
8001015c:	4142474d 	cmpmi	r2, sp, asr #14
80010160:	41414141 	cmpmi	r1, r1, asr #2
80010164:	4142474d 	cmpmi	r2, sp, asr #14
80010168:	41414141 	cmpmi	r1, r1, asr #2
8001016c:	41415049 	cmpmi	r1, r9, asr #32
80010170:	41414141 	cmpmi	r1, r1, asr #2
80010174:	44424441 	strbmi	r4, [r2], #-1089	@ 0xfffffbbf
80010178:	44444443 	strbmi	r4, [r4], #-1091	@ 0xfffffbbd
8001017c:	44464445 	strbmi	r4, [r6], #-1093	@ 0xfffffbbb
80010180:	44484447 	strbmi	r4, [r8], #-1095	@ 0xfffffbb9
80010184:	444a4449 	strbmi	r4, [sl], #-1097	@ 0xfffffbb7
80010188:	47434742 	strbmi	r4, [r3, -r2, asr #14]
8001018c:	47454744 	strbmi	r4, [r5, -r4, asr #14]
80010190:	47474746 	strbmi	r4, [r7, -r6, asr #14]
80010194:	41414141 	cmpmi	r1, r1, asr #2
80010198:	41414141 	cmpmi	r1, r1, asr #2
8001019c:	41414141 	cmpmi	r1, r1, asr #2
800101a0:	41414141 	cmpmi	r1, r1, asr #2
800101a4:	41414141 	cmpmi	r1, r1, asr #2
800101a8:	41414141 	cmpmi	r1, r1, asr #2
800101ac:	41414141 	cmpmi	r1, r1, asr #2
800101b0:	41414141 	cmpmi	r1, r1, asr #2
800101b4:	41434945 	cmpmi	r3, r5, asr #18
800101b8:	41414141 	cmpmi	r1, r1, asr #2
800101bc:	41434c41 	cmpmi	r3, r1, asr #24
800101c0:	41414141 	cmpmi	r1, r1, asr #2
800101c4:	45444548 	strbmi	r4, [r4, #-1352]	@ 0xfffffab8
800101c8:	444b4544 	strbmi	r4, [fp], #-1348	@ 0xfffffabc
800101cc:	43494341 	movtmi	r4, #37697	@ 0x9341
800101d0:	48434542 	stmdami	r3, {r1, r6, r8, sl, lr}^
800101d4:	47494744 	strbmi	r4, [r9, -r4, asr #14]
800101d8:	46434341 	strbmi	r4, [r3], -r1, asr #6
800101dc:	48414746 	stmdami	r1, {r1, r2, r6, r8, r9, sl, lr}^
800101e0:	48444750 	stmdami	r4, {r4, r6, r8, r9, sl, lr}^
800101e4:	4845474a 	stmdami	r5, {r1, r3, r6, r8, r9, sl, lr}^
800101e8:	48434750 	stmdami	r3, {r4, r6, r8, r9, sl, lr}^
800101ec:	434a484a 	movtmi	r4, #43082	@ 0xa84a
800101f0:	44424341 	strbmi	r4, [r2], #-833	@ 0xfffffcbf
800101f4:	434f4445 	movtmi	r4, #62533	@ 0xf445
800101f8:	434f4443 	movtmi	r4, #62531	@ 0xf443
800101fc:	41414441 	cmpmi	r1, r1, asr #8
80010200:	434f4542 	movtmi	r4, #62786	@ 0xf542
80010204:	41414141 	cmpmi	r1, r1, asr #2
80010208:	47424141 	strbmi	r4, [r2, -r1, asr #2]
8001020c:	47424746 	strbmi	r4, [r2, -r6, asr #14]
80010210:	474a4743 	strbmi	r4, [sl, -r3, asr #14]
80010214:	41424141 	cmpmi	r2, r1, asr #2
80010218:	41414345 	cmpmi	r1, r5, asr #6
8001021c:	41414141 	cmpmi	r1, r1, asr #2
80010220:	44474146 	strbmi	r4, [r7], #-326	@ 0xfffffeba
80010224:	464b454c 	strbmi	r4, [fp], -ip, asr #10
80010228:	41474141 	cmpmi	r7, r1, asr #2
8001022c:	41494148 	cmpmi	r9, r8, asr #2
80010230:	414a4142 	cmpmi	sl, r2, asr #2
80010234:	42434142 	submi	r4, r3, #-2147483632	@ 0x80000010
80010238:	42454145 	submi	r4, r5, #1073741841	@ 0x40000011
8001023c:	42464142 	submi	r4, r6, #-2147483632	@ 0x80000010
80010240:	42484142 	submi	r4, r8, #-2147483632	@ 0x80000010
80010244:	42494144 	submi	r4, r9, #68, 2
80010248:	424a4142 	submi	r4, sl, #-2147483632	@ 0x80000010
8001024c:	424b4142 	submi	r4, fp, #-2147483632	@ 0x80000010
80010250:	424f4142 	submi	r4, pc, #-2147483632	@ 0x80000010
80010254:	43434147 	movtmi	r4, #12615	@ 0x3147
80010258:	45454142 	strbmi	r4, [r5, #-322]	@ 0xfffffebe
8001025c:	41414142 	cmpmi	r1, r2, asr #2
80010260:	41414141 	cmpmi	r1, r1, asr #2
80010264:	41414141 	cmpmi	r1, r1, asr #2
80010268:	41414141 	cmpmi	r1, r1, asr #2
8001026c:	41414141 	cmpmi	r1, r1, asr #2
80010270:	41414141 	cmpmi	r1, r1, asr #2
80010274:	41414141 	cmpmi	r1, r1, asr #2
80010278:	41414141 	cmpmi	r1, r1, asr #2
8001027c:	41414141 	cmpmi	r1, r1, asr #2
80010280:	41414141 	cmpmi	r1, r1, asr #2
80010284:	41414141 	cmpmi	r1, r1, asr #2
80010288:	41414141 	cmpmi	r1, r1, asr #2
8001028c:	41424141 	cmpmi	r2, r1, asr #2
80010290:	41414141 	cmpmi	r1, r1, asr #2
80010294:	41414141 	cmpmi	r1, r1, asr #2
80010298:	41414141 	cmpmi	r1, r1, asr #2
8001029c:	41414144 	cmpmi	r1, r4, asr #2
800102a0:	41414142 	cmpmi	r1, r2, asr #2
800102a4:	41414141 	cmpmi	r1, r1, asr #2
800102a8:	41414141 	cmpmi	r1, r1, asr #2
800102ac:	414c4445 	cmpmi	ip, r5, asr #8
800102b0:	41414141 	cmpmi	r1, r1, asr #2
800102b4:	41414141 	cmpmi	r1, r1, asr #2
800102b8:	41414141 	cmpmi	r1, r1, asr #2
800102bc:	41414144 	cmpmi	r1, r4, asr #2
800102c0:	41414143 	cmpmi	r1, r3, asr #2
800102c4:	41414141 	cmpmi	r1, r1, asr #2
800102c8:	41414141 	cmpmi	r1, r1, asr #2
800102cc:	424c4e49 	submi	r4, ip, #1168	@ 0x490
800102d0:	41414141 	cmpmi	r1, r1, asr #2
800102d4:	41414141 	cmpmi	r1, r1, asr #2
800102d8:	41414141 	cmpmi	r1, r1, asr #2
800102dc:	41414144 	cmpmi	r1, r4, asr #2
800102e0:	41414144 	cmpmi	r1, r4, asr #2
800102e4:	41414141 	cmpmi	r1, r1, asr #2
800102e8:	41414141 	cmpmi	r1, r1, asr #2
800102ec:	424c4f4d 	submi	r4, ip, #308	@ 0x134
800102f0:	41414141 	cmpmi	r1, r1, asr #2
800102f4:	41414141 	cmpmi	r1, r1, asr #2
800102f8:	41414141 	cmpmi	r1, r1, asr #2
800102fc:	41414144 	cmpmi	r1, r4, asr #2
80010300:	41414145 	cmpmi	r1, r5, asr #2
80010304:	41414141 	cmpmi	r1, r1, asr #2
80010308:	41414141 	cmpmi	r1, r1, asr #2
8001030c:	424c4f4d 	submi	r4, ip, #308	@ 0x134
80010310:	41414141 	cmpmi	r1, r1, asr #2
80010314:	41414141 	cmpmi	r1, r1, asr #2
80010318:	41414141 	cmpmi	r1, r1, asr #2
8001031c:	41414144 	cmpmi	r1, r4, asr #2
80010320:	41414146 	cmpmi	r1, r6, asr #2
80010324:	41414141 	cmpmi	r1, r1, asr #2
80010328:	41414141 	cmpmi	r1, r1, asr #2
8001032c:	41414141 	cmpmi	r1, r1, asr #2
80010330:	41414141 	cmpmi	r1, r1, asr #2
80010334:	41414141 	cmpmi	r1, r1, asr #2
80010338:	41414141 	cmpmi	r1, r1, asr #2
8001033c:	41414144 	cmpmi	r1, r4, asr #2
80010340:	41414147 	cmpmi	r1, r7, asr #2
80010344:	41414141 	cmpmi	r1, r1, asr #2
80010348:	41414141 	cmpmi	r1, r1, asr #2
8001034c:	41414141 	cmpmi	r1, r1, asr #2
80010350:	41414141 	cmpmi	r1, r1, asr #2
80010354:	41414141 	cmpmi	r1, r1, asr #2
80010358:	41414141 	cmpmi	r1, r1, asr #2
8001035c:	41414144 	cmpmi	r1, r4, asr #2
80010360:	41414148 	cmpmi	r1, r8, asr #2
80010364:	41414142 	cmpmi	r1, r2, asr #2
80010368:	41414141 	cmpmi	r1, r1, asr #2
8001036c:	41414141 	cmpmi	r1, r1, asr #2
80010370:	41414141 	cmpmi	r1, r1, asr #2
80010374:	41414141 	cmpmi	r1, r1, asr #2
80010378:	41414141 	cmpmi	r1, r1, asr #2
8001037c:	41414145 	cmpmi	r1, r5, asr #2
80010380:	50505042 	subspl	r5, r0, r2, asr #32
80010384:	4141414a 	cmpmi	r1, sl, asr #2
80010388:	41414141 	cmpmi	r1, r1, asr #2
8001038c:	414c4445 	cmpmi	ip, r5, asr #8
80010390:	41414141 	cmpmi	r1, r1, asr #2
80010394:	41414141 	cmpmi	r1, r1, asr #2
80010398:	41414141 	cmpmi	r1, r1, asr #2
8001039c:	41414141 	cmpmi	r1, r1, asr #2
800103a0:	41414143 	cmpmi	r1, r3, asr #2
800103a4:	4141414d 	cmpmi	r1, sp, asr #2
800103a8:	41414141 	cmpmi	r1, r1, asr #2
800103ac:	41424141 	cmpmi	r2, r1, asr #2
800103b0:	41414141 	cmpmi	r1, r1, asr #2
800103b4:	41414141 	cmpmi	r1, r1, asr #2
800103b8:	41414141 	cmpmi	r1, r1, asr #2
800103bc:	41414141 	cmpmi	r1, r1, asr #2
800103c0:	41414142 	cmpmi	r1, r2, asr #2
800103c4:	4141414a 	cmpmi	r1, sl, asr #2
800103c8:	41414141 	cmpmi	r1, r1, asr #2
800103cc:	41424d41 	cmpmi	r2, r1, asr #26
800103d0:	41414141 	cmpmi	r1, r1, asr #2
800103d4:	41414141 	cmpmi	r1, r1, asr #2
800103d8:	41414141 	cmpmi	r1, r1, asr #2
800103dc:	41414141 	cmpmi	r1, r1, asr #2
800103e0:	41414142 	cmpmi	r1, r2, asr #2
800103e4:	41414150 	cmpmi	r1, r0, asr r1
800103e8:	41414141 	cmpmi	r1, r1, asr #2
800103ec:	41414141 	cmpmi	r1, r1, asr #2
800103f0:	41414141 	cmpmi	r1, r1, asr #2
800103f4:	41414141 	cmpmi	r1, r1, asr #2
800103f8:	41414141 	cmpmi	r1, r1, asr #2
800103fc:	41414145 	cmpmi	r1, r5, asr #2
80010400:	50505042 	subspl	r5, r0, r2, asr #32
80010404:	4141414d 	cmpmi	r1, sp, asr #2
80010408:	41414141 	cmpmi	r1, r1, asr #2
8001040c:	41424e41 	cmpmi	r2, r1, asr #28
80010410:	41414141 	cmpmi	r1, r1, asr #2
80010414:	41414141 	cmpmi	r1, r1, asr #2
80010418:	41414141 	cmpmi	r1, r1, asr #2
8001041c:	41414141 	cmpmi	r1, r1, asr #2
80010420:	41414142 	cmpmi	r1, r2, asr #2
80010424:	4141424a 	cmpmi	r1, sl, asr #4
80010428:	41414141 	cmpmi	r1, r1, asr #2
8001042c:	41414141 	cmpmi	r1, r1, asr #2
80010430:	41414141 	cmpmi	r1, r1, asr #2
80010434:	41414141 	cmpmi	r1, r1, asr #2
80010438:	41414141 	cmpmi	r1, r1, asr #2
8001043c:	41414145 	cmpmi	r1, r5, asr #2
80010440:	50505042 	subspl	r5, r0, r2, asr #32
80010444:	4141414a 	cmpmi	r1, sl, asr #2
80010448:	41414141 	cmpmi	r1, r1, asr #2
8001044c:	414c4449 	cmpmi	ip, r9, asr #8
80010450:	41414141 	cmpmi	r1, r1, asr #2
80010454:	41414141 	cmpmi	r1, r1, asr #2
80010458:	41414141 	cmpmi	r1, r1, asr #2
8001045c:	41414141 	cmpmi	r1, r1, asr #2
80010460:	41414143 	cmpmi	r1, r3, asr #2
80010464:	41414341 	cmpmi	r1, r1, asr #6
80010468:	41414141 	cmpmi	r1, r1, asr #2
8001046c:	414c4449 	cmpmi	ip, r9, asr #8
80010470:	41414141 	cmpmi	r1, r1, asr #2
80010474:	41414441 	cmpmi	r1, r1, asr #8
80010478:	41414141 	cmpmi	r1, r1, asr #2
8001047c:	41414142 	cmpmi	r1, r2, asr #2
80010480:	41414143 	cmpmi	r1, r3, asr #2
80010484:	4141414d 	cmpmi	r1, sp, asr #2
80010488:	41414141 	cmpmi	r1, r1, asr #2
8001048c:	41444c41 	cmpmi	r4, r1, asr #24
80010490:	41414141 	cmpmi	r1, r1, asr #2
80010494:	41414141 	cmpmi	r1, r1, asr #2
80010498:	41414141 	cmpmi	r1, r1, asr #2
8001049c:	41414141 	cmpmi	r1, r1, asr #2
800104a0:	41414142 	cmpmi	r1, r2, asr #2
800104a4:	4141414a 	cmpmi	r1, sl, asr #2
800104a8:	41414141 	cmpmi	r1, r1, asr #2
800104ac:	41455049 	cmpmi	r5, r9, asr #32
800104b0:	41414141 	cmpmi	r1, r1, asr #2
800104b4:	41414141 	cmpmi	r1, r1, asr #2
800104b8:	41414141 	cmpmi	r1, r1, asr #2
800104bc:	41414141 	cmpmi	r1, r1, asr #2
800104c0:	41414142 	cmpmi	r1, r2, asr #2
800104c4:	41414449 	cmpmi	r1, r9, asr #8
800104c8:	41414141 	cmpmi	r1, r1, asr #2
800104cc:	41414141 	cmpmi	r1, r1, asr #2
800104d0:	41414141 	cmpmi	r1, r1, asr #2
800104d4:	41414141 	cmpmi	r1, r1, asr #2
800104d8:	41414141 	cmpmi	r1, r1, asr #2
800104dc:	41414145 	cmpmi	r1, r5, asr #2
800104e0:	50505042 	subspl	r5, r0, r2, asr #32
800104e4:	4141414d 	cmpmi	r1, sp, asr #2
800104e8:	41414141 	cmpmi	r1, r1, asr #2
800104ec:	41464141 	cmpmi	r6, r1, asr #2
800104f0:	41414141 	cmpmi	r1, r1, asr #2
800104f4:	41414141 	cmpmi	r1, r1, asr #2
800104f8:	41414141 	cmpmi	r1, r1, asr #2
800104fc:	41414141 	cmpmi	r1, r1, asr #2
80010500:	41414142 	cmpmi	r1, r2, asr #2
80010504:	41414447 	cmpmi	r1, r7, asr #8
80010508:	41414141 	cmpmi	r1, r1, asr #2
8001050c:	41414141 	cmpmi	r1, r1, asr #2
80010510:	41414141 	cmpmi	r1, r1, asr #2
80010514:	41414141 	cmpmi	r1, r1, asr #2
80010518:	41414141 	cmpmi	r1, r1, asr #2
8001051c:	41414145 	cmpmi	r1, r5, asr #2
80010520:	50505042 	subspl	r5, r0, r2, asr #32
80010524:	4141414a 	cmpmi	r1, sl, asr #2
80010528:	41414141 	cmpmi	r1, r1, asr #2
8001052c:	414c4749 	cmpmi	ip, r9, asr #14
80010530:	41414141 	cmpmi	r1, r1, asr #2
80010534:	41414141 	cmpmi	r1, r1, asr #2
80010538:	41414141 	cmpmi	r1, r1, asr #2
8001053c:	41414141 	cmpmi	r1, r1, asr #2
80010540:	41414143 	cmpmi	r1, r3, asr #2
80010544:	4141414d 	cmpmi	r1, sp, asr #2
80010548:	41414141 	cmpmi	r1, r1, asr #2
8001054c:	41464b41 	cmpmi	r6, r1, asr #22
80010550:	41414141 	cmpmi	r1, r1, asr #2
80010554:	41414141 	cmpmi	r1, r1, asr #2
80010558:	41414141 	cmpmi	r1, r1, asr #2
8001055c:	41414141 	cmpmi	r1, r1, asr #2
80010560:	41414142 	cmpmi	r1, r2, asr #2
80010564:	41414542 	cmpmi	r1, r2, asr #10
80010568:	41414141 	cmpmi	r1, r1, asr #2
8001056c:	41494841 	cmpmi	r9, r1, asr #16
80010570:	41414141 	cmpmi	r1, r1, asr #2
80010574:	4141494d 	cmpmi	r1, sp, asr #18
80010578:	41414141 	cmpmi	r1, r1, asr #2
8001057c:	41414143 	cmpmi	r1, r3, asr #2
80010580:	41414142 	cmpmi	r1, r2, asr #2
80010584:	4141454f 	cmpmi	r1, pc, asr #10
80010588:	41414141 	cmpmi	r1, r1, asr #2
8001058c:	4149504d 	cmpmi	r9, sp, asr #32
80010590:	41414141 	cmpmi	r1, r1, asr #2
80010594:	41414a49 	cmpmi	r1, r9, asr #20
80010598:	41414141 	cmpmi	r1, r1, asr #2
8001059c:	41414143 	cmpmi	r1, r3, asr #2
800105a0:	41414142 	cmpmi	r1, r2, asr #2
800105a4:	41414649 	cmpmi	r1, r9, asr #12
800105a8:	41414141 	cmpmi	r1, r1, asr #2
800105ac:	414a4a45 	cmpmi	sl, r5, asr #20
800105b0:	41414141 	cmpmi	r1, r1, asr #2
800105b4:	41414b4d 	cmpmi	r1, sp, asr #22
800105b8:	41414141 	cmpmi	r1, r1, asr #2
800105bc:	41414143 	cmpmi	r1, r3, asr #2
800105c0:	41414142 	cmpmi	r1, r2, asr #2
800105c4:	4141414a 	cmpmi	r1, sl, asr #2
800105c8:	41414141 	cmpmi	r1, r1, asr #2
800105cc:	41494749 	cmpmi	r9, r9, asr #14
800105d0:	41414141 	cmpmi	r1, r1, asr #2
800105d4:	41414141 	cmpmi	r1, r1, asr #2
800105d8:	41414141 	cmpmi	r1, r1, asr #2
800105dc:	41414141 	cmpmi	r1, r1, asr #2
800105e0:	41414142 	cmpmi	r1, r2, asr #2
800105e4:	4141414d 	cmpmi	r1, sp, asr #2
800105e8:	41414141 	cmpmi	r1, r1, asr #2
800105ec:	41494841 	cmpmi	r9, r1, asr #16
800105f0:	41414141 	cmpmi	r1, r1, asr #2
800105f4:	41414141 	cmpmi	r1, r1, asr #2
800105f8:	41414141 	cmpmi	r1, r1, asr #2
800105fc:	41414141 	cmpmi	r1, r1, asr #2
80010600:	41414142 	cmpmi	r1, r2, asr #2
80010604:	4141414a 	cmpmi	r1, sl, asr #2
80010608:	41414141 	cmpmi	r1, r1, asr #2
8001060c:	414b444d 	cmpmi	fp, sp, asr #8
80010610:	41414141 	cmpmi	r1, r1, asr #2
80010614:	41414141 	cmpmi	r1, r1, asr #2
80010618:	41414141 	cmpmi	r1, r1, asr #2
8001061c:	41414141 	cmpmi	r1, r1, asr #2
80010620:	41414142 	cmpmi	r1, r2, asr #2
80010624:	4141474c 	cmpmi	r1, ip, asr #14
80010628:	41414141 	cmpmi	r1, r1, asr #2
8001062c:	41414141 	cmpmi	r1, r1, asr #2
80010630:	41414141 	cmpmi	r1, r1, asr #2
80010634:	41414141 	cmpmi	r1, r1, asr #2
80010638:	41414141 	cmpmi	r1, r1, asr #2
8001063c:	41414145 	cmpmi	r1, r5, asr #2
80010640:	50505042 	subspl	r5, r0, r2, asr #32
80010644:	4141414d 	cmpmi	r1, sp, asr #2
80010648:	41414141 	cmpmi	r1, r1, asr #2
8001064c:	414b4541 	cmpmi	fp, r1, asr #10
80010650:	41414141 	cmpmi	r1, r1, asr #2
80010654:	41414141 	cmpmi	r1, r1, asr #2
80010658:	41414141 	cmpmi	r1, r1, asr #2
8001065c:	41414141 	cmpmi	r1, r1, asr #2
80010660:	41414142 	cmpmi	r1, r2, asr #2
80010664:	41414141 	cmpmi	r1, r1, asr #2
80010668:	41414141 	cmpmi	r1, r1, asr #2
8001066c:	41414141 	cmpmi	r1, r1, asr #2
80010670:	41414141 	cmpmi	r1, r1, asr #2
80010674:	41414141 	cmpmi	r1, r1, asr #2
80010678:	41414141 	cmpmi	r1, r1, asr #2
8001067c:	41414145 	cmpmi	r1, r5, asr #2
80010680:	50505042 	subspl	r5, r0, r2, asr #32
80010684:	41414843 	cmpmi	r1, r3, asr #16
80010688:	41414141 	cmpmi	r1, r1, asr #2
8001068c:	424c4e49 	submi	r4, ip, #1168	@ 0x490
80010690:	41414141 	cmpmi	r1, r1, asr #2
80010694:	41414141 	cmpmi	r1, r1, asr #2
80010698:	41414141 	cmpmi	r1, r1, asr #2
8001069c:	41414142 	cmpmi	r1, r2, asr #2
800106a0:	41414144 	cmpmi	r1, r4, asr #2
800106a4:	41414949 	cmpmi	r1, r9, asr #18
800106a8:	41414141 	cmpmi	r1, r1, asr #2
800106ac:	41444749 	cmpmi	r4, r9, asr #14
800106b0:	41414141 	cmpmi	r1, r1, asr #2
800106b4:	4141424d 	cmpmi	r1, sp, asr #4
800106b8:	41414141 	cmpmi	r1, r1, asr #2
800106bc:	41414243 	cmpmi	r1, r3, asr #4
800106c0:	41414142 	cmpmi	r1, r2, asr #2
800106c4:	4141494f 	cmpmi	r1, pc, asr #18
800106c8:	41414141 	cmpmi	r1, r1, asr #2
800106cc:	41464b41 	cmpmi	r6, r1, asr #22
800106d0:	41414141 	cmpmi	r1, r1, asr #2
800106d4:	41434e41 	cmpmi	r3, r1, asr #28
800106d8:	41414141 	cmpmi	r1, r1, asr #2
800106dc:	41414243 	cmpmi	r1, r3, asr #4
800106e0:	41414142 	cmpmi	r1, r2, asr #2
800106e4:	41414a48 	cmpmi	r1, r8, asr #20
800106e8:	41414141 	cmpmi	r1, r1, asr #2
800106ec:	41424e41 	cmpmi	r2, r1, asr #28
800106f0:	41414141 	cmpmi	r1, r1, asr #2
800106f4:	41414445 	cmpmi	r1, r5, asr #8
800106f8:	41414141 	cmpmi	r1, r1, asr #2
800106fc:	41414243 	cmpmi	r1, r3, asr #4
80010700:	41414142 	cmpmi	r1, r2, asr #2
80010704:	41414f41 	cmpmi	r1, r1, asr #30
80010708:	41414141 	cmpmi	r1, r1, asr #2
8001070c:	424c4f4d 	submi	r4, ip, #308	@ 0x134
80010710:	41414141 	cmpmi	r1, r1, asr #2
80010714:	41414141 	cmpmi	r1, r1, asr #2
80010718:	41414141 	cmpmi	r1, r1, asr #2
8001071c:	41414241 	cmpmi	r1, r1, asr #4
80010720:	41414144 	cmpmi	r1, r4, asr #2
80010724:	41414b41 	cmpmi	r1, r1, asr #22
80010728:	41414141 	cmpmi	r1, r1, asr #2
8001072c:	4143504d 	cmpmi	r3, sp, asr #32
80010730:	41414141 	cmpmi	r1, r1, asr #2
80010734:	41414341 	cmpmi	r1, r1, asr #6
80010738:	41414141 	cmpmi	r1, r1, asr #2
8001073c:	41414243 	cmpmi	r1, r3, asr #4
80010740:	41414142 	cmpmi	r1, r2, asr #2
80010744:	41414b48 	cmpmi	r1, r8, asr #22
80010748:	41414141 	cmpmi	r1, r1, asr #2
8001074c:	424c4f4d 	submi	r4, ip, #308	@ 0x134
80010750:	41414141 	cmpmi	r1, r1, asr #2
80010754:	41414141 	cmpmi	r1, r1, asr #2
80010758:	41414141 	cmpmi	r1, r1, asr #2
8001075c:	41414241 	cmpmi	r1, r1, asr #4
80010760:	41414144 	cmpmi	r1, r4, asr #2
80010764:	41414c46 	cmpmi	r1, r6, asr #24
80010768:	41414141 	cmpmi	r1, r1, asr #2
8001076c:	414b4541 	cmpmi	fp, r1, asr #10
80010770:	41414141 	cmpmi	r1, r1, asr #2
80010774:	41415045 	cmpmi	r1, r5, asr #32
80010778:	41414141 	cmpmi	r1, r1, asr #2
8001077c:	41414243 	cmpmi	r1, r3, asr #4
80010780:	41414142 	cmpmi	r1, r2, asr #2
80010784:	41414d46 	cmpmi	r1, r6, asr #26
80010788:	41414141 	cmpmi	r1, r1, asr #2
8001078c:	41434945 	cmpmi	r3, r5, asr #18
80010790:	41414141 	cmpmi	r1, r1, asr #2
80010794:	4141434d 	cmpmi	r1, sp, asr #6
80010798:	41414141 	cmpmi	r1, r1, asr #2
8001079c:	41414243 	cmpmi	r1, r3, asr #4
800107a0:	41414142 	cmpmi	r1, r2, asr #2
800107a4:	41414d4c 	cmpmi	r1, ip, asr #26
800107a8:	41414141 	cmpmi	r1, r1, asr #2
800107ac:	41434c41 	cmpmi	r3, r1, asr #24
800107b0:	41414141 	cmpmi	r1, r1, asr #2
800107b4:	41414341 	cmpmi	r1, r1, asr #6
800107b8:	41414141 	cmpmi	r1, r1, asr #2
800107bc:	41414243 	cmpmi	r1, r3, asr #4
800107c0:	41414142 	cmpmi	r1, r2, asr #2
800107c4:	41414e42 	cmpmi	r1, r2, asr #28
800107c8:	41414141 	cmpmi	r1, r1, asr #2
800107cc:	41434541 	cmpmi	r3, r1, asr #10
800107d0:	41414141 	cmpmi	r1, r1, asr #2
800107d4:	41414545 	cmpmi	r1, r5, asr #10
800107d8:	41414141 	cmpmi	r1, r1, asr #2
800107dc:	41414243 	cmpmi	r1, r3, asr #4
800107e0:	41414142 	cmpmi	r1, r2, asr #2
800107e4:	41414e4b 	cmpmi	r1, fp, asr #28
800107e8:	41414141 	cmpmi	r1, r1, asr #2
800107ec:	4144444d 	cmpmi	r4, sp, asr #8
800107f0:	41414141 	cmpmi	r1, r1, asr #2
800107f4:	4141434d 	cmpmi	r1, sp, asr #6
800107f8:	41414141 	cmpmi	r1, r1, asr #2
800107fc:	41414243 	cmpmi	r1, r3, asr #4
80010800:	41414142 	cmpmi	r1, r2, asr #2
80010804:	41414e50 	cmpmi	r1, r0, asr lr
80010808:	41414141 	cmpmi	r1, r1, asr #2
8001080c:	424c4f4d 	submi	r4, ip, #308	@ 0x134
80010810:	41414141 	cmpmi	r1, r1, asr #2
80010814:	41414141 	cmpmi	r1, r1, asr #2
80010818:	41414141 	cmpmi	r1, r1, asr #2
8001081c:	41414241 	cmpmi	r1, r1, asr #4
80010820:	41414144 	cmpmi	r1, r4, asr #2
80010824:	41414f4c 	cmpmi	r1, ip, asr #30
80010828:	41414141 	cmpmi	r1, r1, asr #2
8001082c:	41444945 	cmpmi	r4, r5, asr #18
80010830:	41414141 	cmpmi	r1, r1, asr #2
80010834:	4141434d 	cmpmi	r1, sp, asr #6
80010838:	41414141 	cmpmi	r1, r1, asr #2
8001083c:	41414243 	cmpmi	r1, r3, asr #4
80010840:	41414142 	cmpmi	r1, r2, asr #2
80010844:	4142444d 	cmpmi	r2, sp, asr #8
80010848:	41414141 	cmpmi	r1, r1, asr #2
8001084c:	41424141 	cmpmi	r2, r1, asr #2
80010850:	41414141 	cmpmi	r1, r1, asr #2
80010854:	41414e41 	cmpmi	r1, r1, asr #28
80010858:	41414141 	cmpmi	r1, r1, asr #2
8001085c:	41414243 	cmpmi	r1, r3, asr #4
80010860:	41414142 	cmpmi	r1, r2, asr #2
80010864:	41415041 	cmpmi	r1, r1, asr #32
80010868:	41414141 	cmpmi	r1, r1, asr #2
8001086c:	4144424d 	cmpmi	r4, sp, asr #4
80010870:	41414141 	cmpmi	r1, r1, asr #2
80010874:	41414341 	cmpmi	r1, r1, asr #6
80010878:	41414141 	cmpmi	r1, r1, asr #2
8001087c:	41414243 	cmpmi	r1, r3, asr #4
80010880:	41414142 	cmpmi	r1, r2, asr #2
80010884:	41415046 	cmpmi	r1, r6, asr #32
80010888:	41414141 	cmpmi	r1, r1, asr #2
8001088c:	424c4f4d 	submi	r4, ip, #308	@ 0x134
80010890:	41414141 	cmpmi	r1, r1, asr #2
80010894:	41414141 	cmpmi	r1, r1, asr #2
80010898:	41414141 	cmpmi	r1, r1, asr #2
8001089c:	41414241 	cmpmi	r1, r1, asr #4
800108a0:	41414144 	cmpmi	r1, r4, asr #2
800108a4:	41424142 	cmpmi	r2, r2, asr #2
800108a8:	41414141 	cmpmi	r1, r1, asr #2
800108ac:	424c4f4d 	submi	r4, ip, #308	@ 0x134
800108b0:	41414141 	cmpmi	r1, r1, asr #2
800108b4:	41414141 	cmpmi	r1, r1, asr #2
800108b8:	41414141 	cmpmi	r1, r1, asr #2
800108bc:	41414241 	cmpmi	r1, r1, asr #4
800108c0:	41414144 	cmpmi	r1, r4, asr #2
800108c4:	4142414a 	cmpmi	r2, sl, asr #2
800108c8:	41414141 	cmpmi	r1, r1, asr #2
800108cc:	41434145 	cmpmi	r3, r5, asr #2
800108d0:	41414141 	cmpmi	r1, r1, asr #2
800108d4:	4141444d 	cmpmi	r1, sp, asr #8
800108d8:	41414141 	cmpmi	r1, r1, asr #2
800108dc:	41414243 	cmpmi	r1, r3, asr #4
800108e0:	41414142 	cmpmi	r1, r2, asr #2
800108e4:	41424243 	cmpmi	r2, r3, asr #4
800108e8:	41414141 	cmpmi	r1, r1, asr #2
800108ec:	41464141 	cmpmi	r6, r1, asr #2
800108f0:	41414141 	cmpmi	r1, r1, asr #2
800108f4:	41414b41 	cmpmi	r1, r1, asr #22
800108f8:	41414141 	cmpmi	r1, r1, asr #2
800108fc:	41414243 	cmpmi	r1, r3, asr #4
80010900:	41414142 	cmpmi	r1, r2, asr #2
80010904:	4142424f 	cmpmi	r2, pc, asr #4
80010908:	41414141 	cmpmi	r1, r1, asr #2
8001090c:	424c4f4d 	submi	r4, ip, #308	@ 0x134
80010910:	41414141 	cmpmi	r1, r1, asr #2
80010914:	41414141 	cmpmi	r1, r1, asr #2
80010918:	41414141 	cmpmi	r1, r1, asr #2
8001091c:	41414241 	cmpmi	r1, r1, asr #4
80010920:	41414144 	cmpmi	r1, r4, asr #2
80010924:	41424346 	cmpmi	r2, r6, asr #6
80010928:	41414141 	cmpmi	r1, r1, asr #2
8001092c:	424c4f4d 	submi	r4, ip, #308	@ 0x134
80010930:	41414141 	cmpmi	r1, r1, asr #2
80010934:	41414141 	cmpmi	r1, r1, asr #2
80010938:	41414141 	cmpmi	r1, r1, asr #2
8001093c:	41414241 	cmpmi	r1, r1, asr #4
80010940:	41414144 	cmpmi	r1, r4, asr #2
80010944:	4142434b 	cmpmi	r2, fp, asr #6
80010948:	41414141 	cmpmi	r1, r1, asr #2
8001094c:	41434e41 	cmpmi	r3, r1, asr #28
80010950:	41414141 	cmpmi	r1, r1, asr #2
80010954:	4141434d 	cmpmi	r1, sp, asr #6
80010958:	41414141 	cmpmi	r1, r1, asr #2
8001095c:	41414243 	cmpmi	r1, r3, asr #4
80010960:	41414142 	cmpmi	r1, r2, asr #2
80010964:	41424350 	cmpmi	r2, r0, asr r3
80010968:	41414141 	cmpmi	r1, r1, asr #2
8001096c:	41414141 	cmpmi	r1, r1, asr #2
80010970:	41414149 	cmpmi	r1, r9, asr #2
80010974:	41414141 	cmpmi	r1, r1, asr #2
80010978:	41414141 	cmpmi	r1, r1, asr #2
8001097c:	41414241 	cmpmi	r1, r1, asr #4
80010980:	41414146 	cmpmi	r1, r6, asr #2
80010984:	41424447 	cmpmi	r2, r7, asr #8
80010988:	41414141 	cmpmi	r1, r1, asr #2
8001098c:	424c4f4d 	submi	r4, ip, #308	@ 0x134
80010990:	41414141 	cmpmi	r1, r1, asr #2
80010994:	41414141 	cmpmi	r1, r1, asr #2
80010998:	41414141 	cmpmi	r1, r1, asr #2
8001099c:	41414241 	cmpmi	r1, r1, asr #4
800109a0:	41414144 	cmpmi	r1, r4, asr #2
800109a4:	41424544 	cmpmi	r2, r4, asr #10
800109a8:	41414141 	cmpmi	r1, r1, asr #2
800109ac:	41444c41 	cmpmi	r4, r1, asr #24
800109b0:	41414141 	cmpmi	r1, r1, asr #2
800109b4:	41424641 	cmpmi	r2, r1, asr #12
800109b8:	41414141 	cmpmi	r1, r1, asr #2
800109bc:	41414243 	cmpmi	r1, r3, asr #4
800109c0:	41414142 	cmpmi	r1, r2, asr #2
800109c4:	48444141 	stmdami	r4, {r0, r6, r8, lr}^
800109c8:	47464749 	strbmi	r4, [r6, -r9, asr #14]
800109cc:	474d474d 	strbmi	r4, [sp, -sp, asr #14]
800109d0:	4744434f 	strbmi	r4, [r4, -pc, asr #6]
800109d4:	43454141 	movtmi	r4, #20801	@ 0x5141
800109d8:	41414745 	cmpmi	r1, r5, asr #14
800109dc:	47424345 	strbmi	r4, [r2, -r5, asr #6]
800109e0:	48444141 	stmdami	r4, {r0, r6, r8, lr}^
800109e4:	4844484a 	stmdami	r4, {r1, r3, r6, fp, lr}^
800109e8:	47424744 	strbmi	r4, [r2, -r4, asr #14]
800109ec:	00000000 	andeq	r0, r0, r0
800109f0:	474d474d 	strbmi	r4, [sp, -sp, asr #14]
800109f4:	4744434f 	strbmi	r4, [r4, -pc, asr #6]
800109f8:	47484141 	strbmi	r4, [r8, -r1, asr #2]
800109fc:	48454746 	stmdami	r5, {r1, r2, r6, r8, r9, sl, lr}^
80010a00:	434f4844 	movtmi	r4, #63556	@ 0xf844
80010a04:	41414744 	cmpmi	r1, r4, asr #14
80010a08:	46414644 	strbmi	r4, [r1], -r4, asr #12
80010a0c:	45444546 	strbmi	r4, [r4, #-1350]	@ 0xfffffaba
80010a10:	4542454a 	strbmi	r4, [r2, #-1354]	@ 0xfffffab6
80010a14:	4650454d 	ldrbmi	r4, [r0], -sp, asr #10
80010a18:	4546454c 	strbmi	r4, [r6, #-1356]	@ 0xfffffab4
80010a1c:	4650464a 	ldrbmi	r4, [r0], -sl, asr #12
80010a20:	45464644 	strbmi	r4, [r6, #-1604]	@ 0xfffff9bc
80010a24:	46464642 	strbmi	r4, [r6], -r2, asr #12
80010a28:	454f4546 	strbmi	r4, [pc, #-1350]	@ 800104ea <SPECIAL_KEY_SEQUENCES+0x1b2e>
80010a2c:	45464544 	strbmi	r4, [r6, #-1348]	@ 0xfffffabc
80010a30:	41414644 	cmpmi	r1, r4, asr #12
80010a34:	48444847 	stmdami	r4, {r0, r1, r2, r6, fp, lr}^
80010a38:	48434841 	stmdami	r3, {r0, r6, fp, lr}^
80010a3c:	474f474a 	strbmi	r4, [pc, -sl, asr #14]
80010a40:	47474845 	strbmi	r4, [r7, -r5, asr #16]
80010a44:	4744434f 	strbmi	r4, [r4, -pc, asr #6]
80010a48:	48414141 	stmdami	r1, {r0, r6, r8, lr}^
80010a4c:	474a4843 	strbmi	r4, [sl, -r3, asr #16]
80010a50:	4845474f 	stmdami	r5, {r0, r1, r2, r3, r6, r8, r9, sl, lr}^
80010a54:	48444650 	stmdami	r4, {r4, r6, r9, sl, lr}^
80010a58:	48434845 	stmdami	r3, {r0, r2, r6, fp, lr}^
80010a5c:	474f474a 	strbmi	r4, [pc, -sl, asr #14]
80010a60:	41414748 	cmpmi	r1, r8, asr #14
80010a64:	48434841 	stmdami	r3, {r0, r6, fp, lr}^
80010a68:	474f474a 	strbmi	r4, [pc, -sl, asr #14]
80010a6c:	46504845 	ldrbmi	r4, [r0], -r5, asr #16
80010a70:	474f474a 	strbmi	r4, [pc, -sl, asr #14]
80010a74:	41414845 	cmpmi	r1, r5, asr #16
80010a78:	48434841 	stmdami	r3, {r0, r6, fp, lr}^
80010a7c:	474f474a 	strbmi	r4, [pc, -sl, asr #14]
80010a80:	46504845 	ldrbmi	r4, [r0], -r5, asr #16
80010a84:	474a4846 	strbmi	r4, [sl, -r6, asr #16]
80010a88:	4845474f 	stmdami	r5, {r0, r1, r2, r3, r6, r8, r9, sl, lr}^
80010a8c:	474a4650 	smlsldmi	r4, sl, r0, r6
80010a90:	4650474f 	ldrbmi	r4, [r0], -pc, asr #14
80010a94:	47424743 	strbmi	r4, [r2, -r3, asr #14]
80010a98:	47464844 	strbmi	r4, [r6, -r4, asr #16]
80010a9c:	474e4141 	strbmi	r4, [lr, -r1, asr #2]
80010aa0:	48454742 	stmdami	r5, {r1, r6, r8, r9, sl, lr}^
80010aa4:	434f4749 	movtmi	r4, #63305	@ 0xf749
80010aa8:	41414744 	cmpmi	r1, r4, asr #14
80010aac:	45484650 	strbmi	r4, [r8, #-1616]	@ 0xfffff9b0
80010ab0:	4550454d 	ldrbmi	r4, [r0, #-1357]	@ 0xfffffab3
80010ab4:	45424543 	strbmi	r4, [r2, #-1347]	@ 0xfffffabd
80010ab8:	4650454d 	ldrbmi	r4, [r0], -sp, asr #10
80010abc:	45474550 	strbmi	r4, [r7, #-1360]	@ 0xfffffab0
80010ac0:	46444547 	strbmi	r4, [r4], -r7, asr #10
80010ac4:	46454546 	strbmi	r4, [r5], -r6, asr #10
80010ac8:	46454650 			@ <UNDEFINED> instruction: 0x46454650
80010acc:	45434542 	strbmi	r4, [r3, #-1346]	@ 0xfffffabe
80010ad0:	4546454d 	strbmi	r4, [r6, #-1357]	@ 0xfffffab3
80010ad4:	41414650 	cmpmi	r1, r0, asr r6
80010ad8:	474a484a 	strbmi	r4, [sl, -sl, asr #16]
80010adc:	474d4746 	strbmi	r4, [sp, -r6, asr #14]
80010ae0:	41414745 	cmpmi	r1, r5, asr #14
80010ae4:	48444847 	stmdami	r4, {r0, r1, r2, r6, fp, lr}^
80010ae8:	48434841 	stmdami	r3, {r0, r6, fp, lr}^
80010aec:	474f474a 	strbmi	r4, [pc, -sl, asr #14]
80010af0:	47474845 	strbmi	r4, [r7, -r5, asr #16]
80010af4:	48444141 	stmdami	r4, {r0, r6, r8, lr}^
80010af8:	4844484a 	stmdami	r4, {r1, r3, r6, fp, lr}^
80010afc:	47424744 	strbmi	r4, [r2, -r4, asr #14]
80010b00:	474d474d 	strbmi	r4, [sp, -sp, asr #14]
80010b04:	41414441 	cmpmi	r1, r1, asr #8
80010b08:	47464748 	strbmi	r4, [r6, -r8, asr #14]
80010b0c:	48414845 	stmdami	r1, {r0, r2, r6, fp, lr}^
80010b10:	4745474a 	strbmi	r4, [r5, -sl, asr #14]
80010b14:	46504141 	ldrbmi	r4, [r0], -r1, asr #2
80010b18:	47434650 	smlsldmi	r4, r3, r0, r6
80010b1c:	48444844 	stmdami	r4, {r2, r6, fp, lr}^
80010b20:	48444650 	stmdami	r4, {r4, r6, r9, sl, lr}^
80010b24:	47424845 	strbmi	r4, [r2, -r5, asr #16]
80010b28:	48454843 	stmdami	r5, {r0, r1, r6, fp, lr}^
80010b2c:	46504650 			@ <UNDEFINED> instruction: 0x46504650
80010b30:	48464141 	stmdami	r6, {r0, r6, r8, lr}^
80010b34:	4844474f 	stmdami	r4, {r0, r1, r2, r3, r6, r8, r9, sl, lr}^
80010b38:	4748474a 	strbmi	r4, [r8, -sl, asr #14]
80010b3c:	4746474f 	strbmi	r4, [r6, -pc, asr #14]
80010b40:	46504745 	ldrbmi	r4, [r0], -r5, asr #14
80010b44:	474a4745 	strbmi	r4, [sl, -r5, asr #14]
80010b48:	474e4847 	strbmi	r4, [lr, -r7, asr #16]
80010b4c:	47454750 	smlsldmi	r4, r5, r0, r7
80010b50:	48414141 	stmdami	r1, {r0, r6, r8, lr}^
80010b54:	48454846 	stmdami	r5, {r1, r2, r6, fp, lr}^
80010b58:	47494744 	strbmi	r4, [r9, -r4, asr #14]
80010b5c:	47484141 	strbmi	r4, [r8, -r1, asr #2]
80010b60:	48454746 	stmdami	r5, {r1, r2, r6, r8, r9, sl, lr}^
80010b64:	47494744 	strbmi	r4, [r9, -r4, asr #14]
80010b68:	48444141 	stmdami	r4, {r0, r6, r8, lr}^
80010b6c:	4844484a 	stmdami	r4, {r1, r3, r6, fp, lr}^
80010b70:	47424744 	strbmi	r4, [r2, -r4, asr #14]
80010b74:	474d474d 	strbmi	r4, [sp, -sp, asr #14]
80010b78:	41414443 	cmpmi	r1, r3, asr #8
80010b7c:	48494746 	stmdami	r9, {r1, r2, r6, r8, r9, sl, lr}^
80010b80:	47444746 	strbmi	r4, [r4, -r6, asr #14]
80010b84:	46504141 	ldrbmi	r4, [r0], -r1, asr #2
80010b88:	47434650 	smlsldmi	r4, r3, r0, r6
80010b8c:	48444844 	stmdami	r4, {r2, r6, fp, lr}^
80010b90:	47464650 	smlsldmi	r4, r6, r0, r6
80010b94:	4745474f 	strbmi	r4, [r5, -pc, asr #14]
80010b98:	46504650 			@ <UNDEFINED> instruction: 0x46504650
80010b9c:	48484141 	stmdami	r8, {r0, r6, r8, lr}^
80010ba0:	474a4742 	strbmi	r4, [sl, -r2, asr #14]
80010ba4:	41414845 	cmpmi	r1, r5, asr #16
80010ba8:	47504747 	ldrbmi	r4, [r0, -r7, asr #14]
80010bac:	474c4843 	strbmi	r4, [ip, -r3, asr #16]
80010bb0:	46504141 	ldrbmi	r4, [r0], -r1, asr #2
80010bb4:	47434650 	smlsldmi	r4, r3, r0, r6
80010bb8:	48444844 	stmdami	r4, {r2, r6, fp, lr}^
80010bbc:	48444650 	stmdami	r4, {r4, r6, r9, sl, lr}^
80010bc0:	47424845 	strbmi	r4, [r2, -r5, asr #16]
80010bc4:	48454843 	stmdami	r5, {r0, r1, r6, fp, lr}^
80010bc8:	46504141 	ldrbmi	r4, [r0], -r1, asr #2
80010bcc:	47464650 	smlsldmi	r4, r6, r0, r6
80010bd0:	4745474f 	strbmi	r4, [r5, -pc, asr #14]
80010bd4:	46504650 			@ <UNDEFINED> instruction: 0x46504650
80010bd8:	48444141 	stmdami	r4, {r0, r6, r8, lr}^
80010bdc:	4844484a 	stmdami	r4, {r1, r3, r6, fp, lr}^
80010be0:	47424744 	strbmi	r4, [r2, -r4, asr #14]
80010be4:	474d474d 	strbmi	r4, [sp, -sp, asr #14]
80010be8:	41414442 	cmpmi	r1, r2, asr #8
80010bec:	48434841 	stmdami	r3, {r0, r6, fp, lr}^
80010bf0:	474f474a 	strbmi	r4, [pc, -sl, asr #14]
80010bf4:	47474845 	strbmi	r4, [r7, -r5, asr #16]
80010bf8:	47434650 	smlsldmi	r4, r3, r0, r6
80010bfc:	48444742 	stmdami	r4, {r1, r6, r8, r9, sl, lr}^
80010c00:	41414746 	cmpmi	r1, r6, asr #14
80010c04:	47464650 	smlsldmi	r4, r6, r0, r6
80010c08:	47424745 	strbmi	r4, [r2, -r5, asr #14]
80010c0c:	47424845 	strbmi	r4, [r2, -r5, asr #16]
80010c10:	46504141 	ldrbmi	r4, [r0], -r1, asr #2
80010c14:	474f4746 	strbmi	r4, [pc, -r6, asr #14]
80010c18:	41414745 	cmpmi	r1, r5, asr #14
80010c1c:	48494746 	stmdami	r9, {r1, r2, r6, r8, r9, sl, lr}^
80010c20:	4845474a 	stmdami	r5, {r1, r3, r6, r8, r9, sl, lr}^
80010c24:	46504141 	ldrbmi	r4, [r0], -r1, asr #2
80010c28:	48454844 	stmdami	r5, {r2, r6, fp, lr}^
80010c2c:	47444742 	strbmi	r4, [r4, -r2, asr #14]
80010c30:	4141474c 	cmpmi	r1, ip, asr #14
80010c34:	46504650 			@ <UNDEFINED> instruction: 0x46504650
80010c38:	47424745 	strbmi	r4, [r2, -r5, asr #14]
80010c3c:	47424845 	strbmi	r4, [r2, -r5, asr #16]
80010c40:	48444650 	stmdami	r4, {r4, r6, r9, sl, lr}^
80010c44:	47424845 	strbmi	r4, [r2, -r5, asr #16]
80010c48:	48454843 	stmdami	r5, {r0, r1, r6, fp, lr}^
80010c4c:	47484141 	strbmi	r4, [r8, -r1, asr #2]
80010c50:	48454746 	stmdami	r5, {r1, r2, r6, r8, r9, sl, lr}^
80010c54:	46504844 	ldrbmi	r4, [r0], -r4, asr #16
80010c58:	47424743 	strbmi	r4, [r2, -r3, asr #14]
80010c5c:	47464844 	strbmi	r4, [r6, -r4, asr #16]
80010c60:	41414141 	cmpmi	r1, r1, asr #2
80010c64:	4844434f 	stmdami	r4, {r0, r1, r2, r3, r6, r8, r9, lr}^
80010c68:	474e484a 	strbmi	r4, [lr, -sl, asr #16]
80010c6c:	47424845 	strbmi	r4, [r2, -r5, asr #16]
80010c70:	41414743 	cmpmi	r1, r3, asr #14
80010c74:	4844434f 	stmdami	r4, {r0, r1, r2, r3, r6, r8, r9, lr}^
80010c78:	48434845 	stmdami	r3, {r0, r2, r6, fp, lr}^
80010c7c:	47424845 	strbmi	r4, [r2, -r5, asr #16]
80010c80:	41414743 	cmpmi	r1, r3, asr #14
80010c84:	4844434f 	stmdami	r4, {r0, r1, r2, r3, r6, r8, r9, lr}^
80010c88:	48444749 	stmdami	r4, {r0, r3, r6, r8, r9, sl, lr}^
80010c8c:	48434845 	stmdami	r3, {r0, r2, r6, fp, lr}^
80010c90:	47424845 	strbmi	r4, [r2, -r5, asr #16]
80010c94:	41414743 	cmpmi	r1, r3, asr #14
80010c98:	4845434f 	stmdami	r5, {r0, r1, r2, r3, r6, r8, r9, lr}^
80010c9c:	48494746 	stmdami	r9, {r1, r2, r6, r8, r9, sl, lr}^
80010ca0:	41414845 	cmpmi	r1, r5, asr #16
80010ca4:	4843434f 	stmdami	r3, {r0, r1, r2, r3, r6, r8, r9, lr}^
80010ca8:	47454750 	smlsldmi	r4, r5, r0, r7
80010cac:	48454742 	stmdami	r5, {r1, r6, r8, r9, sl, lr}^
80010cb0:	41414742 	cmpmi	r1, r2, asr #14
80010cb4:	4748434f 	strbmi	r4, [r8, -pc, asr #6]
80010cb8:	48454750 	stmdami	r5, {r4, r6, r8, r9, sl, lr}^
80010cbc:	434f4141 	movtmi	r4, #61761	@ 0xf141
80010cc0:	47464841 	strbmi	r4, [r6, -r1, asr #16]
80010cc4:	48444843 	stmdami	r4, {r0, r1, r6, fp, lr}^
80010cc8:	4844474a 	stmdami	r4, {r1, r3, r6, r8, r9, sl, lr}^
80010ccc:	47464845 	strbmi	r4, [r6, -r5, asr #16]
80010cd0:	4845474f 	stmdami	r5, {r0, r1, r2, r3, r6, r8, r9, sl, lr}^
80010cd4:	434f4141 	movtmi	r4, #61761	@ 0xf141
80010cd8:	4750474f 	ldrbmi	r4, [r0, -pc, asr #14]
80010cdc:	474f474a 	strbmi	r4, [pc, -sl, asr #14]
80010ce0:	4845474a 	stmdami	r5, {r1, r3, r6, r8, r9, sl, lr}^
80010ce4:	434f4141 	movtmi	r4, #61761	@ 0xf141
80010ce8:	47504744 	ldrbmi	r4, [r0, -r4, asr #14]
80010cec:	474e474e 	strbmi	r4, [lr, -lr, asr #14]
80010cf0:	474f4746 	strbmi	r4, [pc, -r6, asr #14]
80010cf4:	41414845 	cmpmi	r1, r5, asr #16
80010cf8:	4542434f 	strbmi	r4, [r2, #-847]	@ 0xfffffcb1
80010cfc:	454e4643 	strbmi	r4, [lr, #-1603]	@ 0xfffff9bd
80010d00:	4742434f 	strbmi	r4, [r2, -pc, asr #6]
80010d04:	48454845 	stmdami	r5, {r0, r2, r6, fp, lr}^
80010d08:	474a4843 	strbmi	r4, [sl, -r3, asr #16]
80010d0c:	48464743 	stmdami	r6, {r0, r1, r6, r8, r9, sl, lr}^
80010d10:	47464845 	strbmi	r4, [r6, -r5, asr #16]
80010d14:	41414844 	cmpmi	r1, r4, asr #16
80010d18:	41414141 	cmpmi	r1, r1, asr #2
80010d1c:	41414141 	cmpmi	r1, r1, asr #2
80010d20:	41414141 	cmpmi	r1, r1, asr #2
80010d24:	41414141 	cmpmi	r1, r1, asr #2
80010d28:	41414141 	cmpmi	r1, r1, asr #2
80010d2c:	41414141 	cmpmi	r1, r1, asr #2
80010d30:	41414141 	cmpmi	r1, r1, asr #2
80010d34:	41414141 	cmpmi	r1, r1, asr #2
80010d38:	41414141 	cmpmi	r1, r1, asr #2
80010d3c:	41414141 	cmpmi	r1, r1, asr #2
80010d40:	41414141 	cmpmi	r1, r1, asr #2
80010d44:	41414141 	cmpmi	r1, r1, asr #2
80010d48:	41414141 	cmpmi	r1, r1, asr #2
80010d4c:	41414141 	cmpmi	r1, r1, asr #2
80010d50:	41414141 	cmpmi	r1, r1, asr #2
80010d54:	41414141 	cmpmi	r1, r1, asr #2
80010d58:	41414141 	cmpmi	r1, r1, asr #2
80010d5c:	41414141 	cmpmi	r1, r1, asr #2
80010d60:	41414141 	cmpmi	r1, r1, asr #2
80010d64:	41414141 	cmpmi	r1, r1, asr #2
80010d68:	4141424c 	cmpmi	r1, ip, asr #4
80010d6c:	41414141 	cmpmi	r1, r1, asr #2
80010d70:	41414142 	cmpmi	r1, r2, asr #2
80010d74:	41414141 	cmpmi	r1, r1, asr #2
80010d78:	41414147 	cmpmi	r1, r7, asr #2
80010d7c:	41414141 	cmpmi	r1, r1, asr #2
80010d80:	41424141 	cmpmi	r2, r1, asr #2
80010d84:	41414141 	cmpmi	r1, r1, asr #2
80010d88:	41424141 	cmpmi	r2, r1, asr #2
80010d8c:	41414141 	cmpmi	r1, r1, asr #2
80010d90:	414b4445 	cmpmi	fp, r5, asr #8
80010d94:	41414141 	cmpmi	r1, r1, asr #2
80010d98:	41414141 	cmpmi	r1, r1, asr #2
80010d9c:	41414141 	cmpmi	r1, r1, asr #2
80010da0:	41414141 	cmpmi	r1, r1, asr #2
80010da4:	41414141 	cmpmi	r1, r1, asr #2
80010da8:	41414145 	cmpmi	r1, r5, asr #2
80010dac:	41414141 	cmpmi	r1, r1, asr #2
80010db0:	41414141 	cmpmi	r1, r1, asr #2
80010db4:	41414141 	cmpmi	r1, r1, asr #2
80010db8:	41414342 	cmpmi	r1, r2, asr #6
80010dbc:	41414141 	cmpmi	r1, r1, asr #2
80010dc0:	41414142 	cmpmi	r1, r2, asr #2
80010dc4:	41414141 	cmpmi	r1, r1, asr #2
80010dc8:	41414143 	cmpmi	r1, r3, asr #2
80010dcc:	41414141 	cmpmi	r1, r1, asr #2
80010dd0:	414c4445 	cmpmi	ip, r5, asr #8
80010dd4:	41414141 	cmpmi	r1, r1, asr #2
80010dd8:	414c4445 	cmpmi	ip, r5, asr #8
80010ddc:	41414141 	cmpmi	r1, r1, asr #2
80010de0:	41414b42 	cmpmi	r1, r2, asr #22
80010de4:	41414141 	cmpmi	r1, r1, asr #2
80010de8:	41414141 	cmpmi	r1, r1, asr #2
80010dec:	41414141 	cmpmi	r1, r1, asr #2
80010df0:	41414141 	cmpmi	r1, r1, asr #2
80010df4:	41414141 	cmpmi	r1, r1, asr #2
80010df8:	41414145 	cmpmi	r1, r5, asr #2
80010dfc:	41414141 	cmpmi	r1, r1, asr #2
80010e00:	41414141 	cmpmi	r1, r1, asr #2
80010e04:	41414141 	cmpmi	r1, r1, asr #2
80010e08:	4141434a 	cmpmi	r1, sl, asr #6
80010e0c:	41414141 	cmpmi	r1, r1, asr #2
80010e10:	41414142 	cmpmi	r1, r2, asr #2
80010e14:	41414141 	cmpmi	r1, r1, asr #2
80010e18:	41414144 	cmpmi	r1, r4, asr #2
80010e1c:	41414141 	cmpmi	r1, r1, asr #2
80010e20:	424c4e49 	submi	r4, ip, #1168	@ 0x490
80010e24:	41414141 	cmpmi	r1, r1, asr #2
80010e28:	414c4e49 	cmpmi	ip, r9, asr #28
80010e2c:	41414141 	cmpmi	r1, r1, asr #2
80010e30:	41414245 	cmpmi	r1, r5, asr #4
80010e34:	41414141 	cmpmi	r1, r1, asr #2
80010e38:	41414141 	cmpmi	r1, r1, asr #2
80010e3c:	41414141 	cmpmi	r1, r1, asr #2
80010e40:	41414141 	cmpmi	r1, r1, asr #2
80010e44:	41414141 	cmpmi	r1, r1, asr #2
80010e48:	41414145 	cmpmi	r1, r5, asr #2
80010e4c:	41414141 	cmpmi	r1, r1, asr #2
80010e50:	41414145 	cmpmi	r1, r5, asr #2
80010e54:	41414141 	cmpmi	r1, r1, asr #2
80010e58:	4141434f 	cmpmi	r1, pc, asr #6
80010e5c:	41414141 	cmpmi	r1, r1, asr #2
80010e60:	41414142 	cmpmi	r1, r2, asr #2
80010e64:	41414141 	cmpmi	r1, r1, asr #2
80010e68:	41414144 	cmpmi	r1, r4, asr #2
80010e6c:	41414141 	cmpmi	r1, r1, asr #2
80010e70:	424c4f4d 	submi	r4, ip, #308	@ 0x134
80010e74:	41414141 	cmpmi	r1, r1, asr #2
80010e78:	414c4f4d 	cmpmi	ip, sp, asr #30
80010e7c:	41414141 	cmpmi	r1, r1, asr #2
80010e80:	41414141 	cmpmi	r1, r1, asr #2
80010e84:	41414141 	cmpmi	r1, r1, asr #2
80010e88:	41414141 	cmpmi	r1, r1, asr #2
80010e8c:	41414141 	cmpmi	r1, r1, asr #2
80010e90:	41414141 	cmpmi	r1, r1, asr #2
80010e94:	41414141 	cmpmi	r1, r1, asr #2
80010e98:	41414145 	cmpmi	r1, r5, asr #2
80010e9c:	41414141 	cmpmi	r1, r1, asr #2
80010ea0:	41414141 	cmpmi	r1, r1, asr #2
80010ea4:	41414141 	cmpmi	r1, r1, asr #2
80010ea8:	4141444b 	cmpmi	r1, fp, asr #8
80010eac:	41414141 	cmpmi	r1, r1, asr #2
80010eb0:	41414149 	cmpmi	r1, r9, asr #2
80010eb4:	41414141 	cmpmi	r1, r1, asr #2
80010eb8:	41414144 	cmpmi	r1, r4, asr #2
80010ebc:	41414141 	cmpmi	r1, r1, asr #2
80010ec0:	424c4f4d 	submi	r4, ip, #308	@ 0x134
80010ec4:	41414141 	cmpmi	r1, r1, asr #2
80010ec8:	41414141 	cmpmi	r1, r1, asr #2
80010ecc:	41414141 	cmpmi	r1, r1, asr #2
80010ed0:	41414141 	cmpmi	r1, r1, asr #2
80010ed4:	41414141 	cmpmi	r1, r1, asr #2
80010ed8:	41414141 	cmpmi	r1, r1, asr #2
80010edc:	41414141 	cmpmi	r1, r1, asr #2
80010ee0:	41414141 	cmpmi	r1, r1, asr #2
80010ee4:	41414141 	cmpmi	r1, r1, asr #2
80010ee8:	41414145 	cmpmi	r1, r5, asr #2
80010eec:	41414141 	cmpmi	r1, r1, asr #2
80010ef0:	41414141 	cmpmi	r1, r1, asr #2
80010ef4:	41414141 	cmpmi	r1, r1, asr #2
80010ef8:	41414543 	cmpmi	r1, r3, asr #10
80010efc:	41414141 	cmpmi	r1, r1, asr #2
80010f00:	41414142 	cmpmi	r1, r2, asr #2
80010f04:	41414141 	cmpmi	r1, r1, asr #2
80010f08:	41414441 	cmpmi	r1, r1, asr #8
80010f0c:	41414141 	cmpmi	r1, r1, asr #2
80010f10:	41414141 	cmpmi	r1, r1, asr #2
80010f14:	41414141 	cmpmi	r1, r1, asr #2
80010f18:	414c4f4d 	cmpmi	ip, sp, asr #30
80010f1c:	41414141 	cmpmi	r1, r1, asr #2
80010f20:	4141424f 	cmpmi	r1, pc, asr #4
80010f24:	41414141 	cmpmi	r1, r1, asr #2
80010f28:	41414141 	cmpmi	r1, r1, asr #2
80010f2c:	41414141 	cmpmi	r1, r1, asr #2
80010f30:	41414141 	cmpmi	r1, r1, asr #2
80010f34:	41414141 	cmpmi	r1, r1, asr #2
80010f38:	41414142 	cmpmi	r1, r2, asr #2
80010f3c:	41414141 	cmpmi	r1, r1, asr #2
80010f40:	41414142 	cmpmi	r1, r2, asr #2
80010f44:	41414141 	cmpmi	r1, r1, asr #2
80010f48:	4141454c 	cmpmi	r1, ip, asr #10
80010f4c:	41414141 	cmpmi	r1, r1, asr #2
80010f50:	41414144 	cmpmi	r1, r4, asr #2
80010f54:	48414141 	stmdami	r1, {r0, r6, r8, lr}^
80010f58:	41414141 	cmpmi	r1, r1, asr #2
80010f5c:	41414141 	cmpmi	r1, r1, asr #2
80010f60:	41414141 	cmpmi	r1, r1, asr #2
80010f64:	41414141 	cmpmi	r1, r1, asr #2
80010f68:	414d414b 	cmpmi	sp, fp, asr #2
80010f6c:	41414141 	cmpmi	r1, r1, asr #2
80010f70:	41414350 	cmpmi	r1, r0, asr r3
80010f74:	41414141 	cmpmi	r1, r1, asr #2
80010f78:	41414141 	cmpmi	r1, r1, asr #2
80010f7c:	41414141 	cmpmi	r1, r1, asr #2
80010f80:	41414141 	cmpmi	r1, r1, asr #2
80010f84:	41414141 	cmpmi	r1, r1, asr #2
80010f88:	41414142 	cmpmi	r1, r2, asr #2
80010f8c:	41414141 	cmpmi	r1, r1, asr #2
80010f90:	41414141 	cmpmi	r1, r1, asr #2
80010f94:	41414141 	cmpmi	r1, r1, asr #2
80010f98:	41414142 	cmpmi	r1, r2, asr #2
80010f9c:	41414141 	cmpmi	r1, r1, asr #2
80010fa0:	41414143 	cmpmi	r1, r3, asr #2
80010fa4:	41414141 	cmpmi	r1, r1, asr #2
80010fa8:	41414141 	cmpmi	r1, r1, asr #2
80010fac:	41414141 	cmpmi	r1, r1, asr #2
80010fb0:	41414141 	cmpmi	r1, r1, asr #2
80010fb4:	41414141 	cmpmi	r1, r1, asr #2
80010fb8:	414d444d 	cmpmi	sp, sp, asr #8
80010fbc:	41414141 	cmpmi	r1, r1, asr #2
80010fc0:	41444c41 	cmpmi	r4, r1, asr #24
80010fc4:	41414141 	cmpmi	r1, r1, asr #2
80010fc8:	4141414a 	cmpmi	r1, sl, asr #2
80010fcc:	41414141 	cmpmi	r1, r1, asr #2
80010fd0:	41414343 	cmpmi	r1, r3, asr #6
80010fd4:	41414141 	cmpmi	r1, r1, asr #2
80010fd8:	41414145 	cmpmi	r1, r5, asr #2
80010fdc:	41414141 	cmpmi	r1, r1, asr #2
80010fe0:	41414241 	cmpmi	r1, r1, asr #4
80010fe4:	41414141 	cmpmi	r1, r1, asr #2
80010fe8:	4141414a 	cmpmi	r1, sl, asr #2
80010fec:	41414141 	cmpmi	r1, r1, asr #2
80010ff0:	41414144 	cmpmi	r1, r4, asr #2
80010ff4:	41414141 	cmpmi	r1, r1, asr #2
80010ff8:	41414141 	cmpmi	r1, r1, asr #2
80010ffc:	41414141 	cmpmi	r1, r1, asr #2
80011000:	41414141 	cmpmi	r1, r1, asr #2
80011004:	41414141 	cmpmi	r1, r1, asr #2
80011008:	41504f4d 	cmpmi	r0, sp, asr #30
8001100c:	41414141 	cmpmi	r1, r1, asr #2
80011010:	4142454e 	cmpmi	r2, lr, asr #10
80011014:	41414141 	cmpmi	r1, r1, asr #2
80011018:	41414141 	cmpmi	r1, r1, asr #2
8001101c:	41414141 	cmpmi	r1, r1, asr #2
80011020:	41414141 	cmpmi	r1, r1, asr #2
80011024:	41414141 	cmpmi	r1, r1, asr #2
80011028:	41414142 	cmpmi	r1, r2, asr #2
8001102c:	41414141 	cmpmi	r1, r1, asr #2
80011030:	41414141 	cmpmi	r1, r1, asr #2
80011034:	41414141 	cmpmi	r1, r1, asr #2
80011038:	41414242 	cmpmi	r1, r2, asr #4
8001103c:	41414141 	cmpmi	r1, r1, asr #2
80011040:	41414144 	cmpmi	r1, r4, asr #2
80011044:	41414141 	cmpmi	r1, r1, asr #2
80011048:	41414141 	cmpmi	r1, r1, asr #2
8001104c:	41414141 	cmpmi	r1, r1, asr #2
80011050:	41414141 	cmpmi	r1, r1, asr #2
80011054:	41414141 	cmpmi	r1, r1, asr #2
80011058:	4242444a 	submi	r4, r2, #1241513984	@ 0x4a000000
8001105c:	41414141 	cmpmi	r1, r1, asr #2
80011060:	4141464c 	cmpmi	r1, ip, asr #12
80011064:	41414141 	cmpmi	r1, r1, asr #2
80011068:	41414141 	cmpmi	r1, r1, asr #2
8001106c:	41414141 	cmpmi	r1, r1, asr #2
80011070:	41414141 	cmpmi	r1, r1, asr #2
80011074:	41414141 	cmpmi	r1, r1, asr #2
80011078:	41414142 	cmpmi	r1, r2, asr #2
8001107c:	41414141 	cmpmi	r1, r1, asr #2
80011080:	41414141 	cmpmi	r1, r1, asr #2
80011084:	41414141 	cmpmi	r1, r1, asr #2
80011088:	00000000 	andeq	r0, r0, r0
8001108c:	45464850 	strbmi	r4, [r6, #-2128]	@ 0xfffff7b0
80011090:	4547454d 	strbmi	r4, [r7, #-1357]	@ 0xfffffab3
80011094:	41424142 	cmpmi	r2, r2, asr #2
80011098:	41414142 	cmpmi	r1, r2, asr #2
8001109c:	41414141 	cmpmi	r1, r1, asr #2
800110a0:	41414141 	cmpmi	r1, r1, asr #2
800110a4:	41414141 	cmpmi	r1, r1, asr #2
800110a8:	41414141 	cmpmi	r1, r1, asr #2
800110ac:	41414143 	cmpmi	r1, r3, asr #2
800110b0:	41414349 	cmpmi	r1, r9, asr #6
800110b4:	41414142 	cmpmi	r1, r2, asr #2
800110b8:	41414141 	cmpmi	r1, r1, asr #2
800110bc:	41424141 	cmpmi	r2, r1, asr #2
800110c0:	41414141 	cmpmi	r1, r1, asr #2
800110c4:	41414445 	cmpmi	r1, r5, asr #8
800110c8:	41414141 	cmpmi	r1, r1, asr #2
800110cc:	42424d49 	submi	r4, r2, #4672	@ 0x1240
800110d0:	41414141 	cmpmi	r1, r1, asr #2
800110d4:	41434141 	cmpmi	r3, r1, asr #2
800110d8:	41464141 	cmpmi	r6, r1, asr #2
800110dc:	41414445 	cmpmi	r1, r5, asr #8
800110e0:	41414341 	cmpmi	r1, r1, asr #6
800110e4:	41414143 	cmpmi	r1, r3, asr #2
800110e8:	41414349 	cmpmi	r1, r9, asr #6
800110ec:	4141414c 	cmpmi	r1, ip, asr #2
800110f0:	4141414b 	cmpmi	r1, fp, asr #2
800110f4:	41414142 	cmpmi	r1, r2, asr #2
800110f8:	41414141 	cmpmi	r1, r1, asr #2
800110fc:	41414141 	cmpmi	r1, r1, asr #2
80011100:	41414141 	cmpmi	r1, r1, asr #2
80011104:	41414141 	cmpmi	r1, r1, asr #2
80011108:	41414141 	cmpmi	r1, r1, asr #2
8001110c:	41414141 	cmpmi	r1, r1, asr #2
80011110:	41414141 	cmpmi	r1, r1, asr #2
80011114:	414d414a 	cmpmi	sp, sl, asr #2
80011118:	41414141 	cmpmi	r1, r1, asr #2
8001111c:	414d414a 	cmpmi	sp, sl, asr #2
80011120:	41414141 	cmpmi	r1, r1, asr #2
80011124:	41414146 	cmpmi	r1, r6, asr #2
80011128:	41414141 	cmpmi	r1, r1, asr #2
8001112c:	42414141 	submi	r4, r1, #1073741840	@ 0x40000010
80011130:	41414141 	cmpmi	r1, r1, asr #2
80011134:	41414142 	cmpmi	r1, r2, asr #2
80011138:	41414141 	cmpmi	r1, r1, asr #2
8001113c:	414d414d 	cmpmi	sp, sp, asr #2
80011140:	41414141 	cmpmi	r1, r1, asr #2
80011144:	424d414d 	submi	r4, sp, #1073741843	@ 0x40000013
80011148:	41414141 	cmpmi	r1, r1, asr #2
8001114c:	424d414d 	submi	r4, sp, #1073741843	@ 0x40000013
80011150:	41414141 	cmpmi	r1, r1, asr #2
80011154:	41414245 	cmpmi	r1, r5, asr #4
80011158:	41414141 	cmpmi	r1, r1, asr #2
8001115c:	41414245 	cmpmi	r1, r5, asr #4
80011160:	41414141 	cmpmi	r1, r1, asr #2
80011164:	41414147 	cmpmi	r1, r7, asr #2
80011168:	41414141 	cmpmi	r1, r1, asr #2
8001116c:	42414141 	submi	r4, r1, #1073741840	@ 0x40000010
80011170:	41414141 	cmpmi	r1, r1, asr #2
80011174:	41414141 	cmpmi	r1, r1, asr #2
80011178:	41414141 	cmpmi	r1, r1, asr #2
8001117c:	41414141 	cmpmi	r1, r1, asr #2
80011180:	41414141 	cmpmi	r1, r1, asr #2
80011184:	41414141 	cmpmi	r1, r1, asr #2
80011188:	41414141 	cmpmi	r1, r1, asr #2
8001118c:	41414141 	cmpmi	r1, r1, asr #2
80011190:	41414141 	cmpmi	r1, r1, asr #2
80011194:	41414141 	cmpmi	r1, r1, asr #2
80011198:	41414141 	cmpmi	r1, r1, asr #2
8001119c:	41414141 	cmpmi	r1, r1, asr #2
800111a0:	41414141 	cmpmi	r1, r1, asr #2
800111a4:	41414141 	cmpmi	r1, r1, asr #2
800111a8:	41414141 	cmpmi	r1, r1, asr #2
800111ac:	41414141 	cmpmi	r1, r1, asr #2
800111b0:	41414141 	cmpmi	r1, r1, asr #2
800111b4:	41414141 	cmpmi	r1, r1, asr #2
800111b8:	41414141 	cmpmi	r1, r1, asr #2
800111bc:	41414141 	cmpmi	r1, r1, asr #2
800111c0:	41414141 	cmpmi	r1, r1, asr #2
800111c4:	41414141 	cmpmi	r1, r1, asr #2
800111c8:	41414141 	cmpmi	r1, r1, asr #2
800111cc:	41414141 	cmpmi	r1, r1, asr #2
800111d0:	41414141 	cmpmi	r1, r1, asr #2
800111d4:	41414141 	cmpmi	r1, r1, asr #2
800111d8:	41414141 	cmpmi	r1, r1, asr #2
800111dc:	41414141 	cmpmi	r1, r1, asr #2
800111e0:	41414141 	cmpmi	r1, r1, asr #2
800111e4:	41414141 	cmpmi	r1, r1, asr #2
800111e8:	41414141 	cmpmi	r1, r1, asr #2
800111ec:	41414141 	cmpmi	r1, r1, asr #2
800111f0:	41414141 	cmpmi	r1, r1, asr #2
800111f4:	41414141 	cmpmi	r1, r1, asr #2
800111f8:	41414141 	cmpmi	r1, r1, asr #2
800111fc:	41414141 	cmpmi	r1, r1, asr #2
80011200:	41414141 	cmpmi	r1, r1, asr #2
80011204:	41414141 	cmpmi	r1, r1, asr #2
80011208:	41414141 	cmpmi	r1, r1, asr #2
8001120c:	41414141 	cmpmi	r1, r1, asr #2
80011210:	41414141 	cmpmi	r1, r1, asr #2
80011214:	41414141 	cmpmi	r1, r1, asr #2
80011218:	41414141 	cmpmi	r1, r1, asr #2
8001121c:	41414141 	cmpmi	r1, r1, asr #2
80011220:	41414141 	cmpmi	r1, r1, asr #2
80011224:	41414141 	cmpmi	r1, r1, asr #2
80011228:	41414141 	cmpmi	r1, r1, asr #2
8001122c:	41414141 	cmpmi	r1, r1, asr #2
80011230:	41414141 	cmpmi	r1, r1, asr #2
80011234:	41414141 	cmpmi	r1, r1, asr #2
80011238:	41414141 	cmpmi	r1, r1, asr #2
8001123c:	41414141 	cmpmi	r1, r1, asr #2
80011240:	41414141 	cmpmi	r1, r1, asr #2
80011244:	41414141 	cmpmi	r1, r1, asr #2
80011248:	41414141 	cmpmi	r1, r1, asr #2
8001124c:	41414141 	cmpmi	r1, r1, asr #2
80011250:	41414141 	cmpmi	r1, r1, asr #2
80011254:	41414141 	cmpmi	r1, r1, asr #2
80011258:	41414141 	cmpmi	r1, r1, asr #2
8001125c:	41414141 	cmpmi	r1, r1, asr #2
80011260:	41414141 	cmpmi	r1, r1, asr #2
80011264:	41414141 	cmpmi	r1, r1, asr #2
80011268:	41414141 	cmpmi	r1, r1, asr #2
8001126c:	41414141 	cmpmi	r1, r1, asr #2
80011270:	41414141 	cmpmi	r1, r1, asr #2
80011274:	41414141 	cmpmi	r1, r1, asr #2
80011278:	41414141 	cmpmi	r1, r1, asr #2
8001127c:	41414141 	cmpmi	r1, r1, asr #2
80011280:	41414141 	cmpmi	r1, r1, asr #2
80011284:	41414141 	cmpmi	r1, r1, asr #2
80011288:	41414141 	cmpmi	r1, r1, asr #2
8001128c:	4d41414e 	stclmi	1, cr4, [r1, #-312]	@ 0xfffffec8
80011290:	4f424b41 	svcmi	0x00424b41
80011294:	4e494241 	cdpmi	2, 4, cr4, cr9, cr1, {2}
80011298:	4f4a434e 	svcmi	0x004a434e
8001129c:	4c414145 	mcrrmi	1, 4, r4, r1, cr5
800112a0:	4f43454d 	svcmi	0x0043454d
800112a4:	4e41494d 	vmlsmi.f16	s9, s2, s26	@ <UNPREDICTABLE>
800112a8:	4f43454e 	svcmi	0x0043454e
800112ac:	45414a49 	strbmi	r4, [r1, #-2633]	@ 0xfffff5b7
800112b0:	4f464a50 	svcmi	0x00464a50
800112b4:	45414145 	strbmi	r4, [r1, #-325]	@ 0xfffffebb
800112b8:	4f414950 	svcmi	0x00414950
800112bc:	44414142 	strbmi	r4, [r1], #-322	@ 0xfffffebe
800112c0:	4f444b41 	svcmi	0x00444b41
800112c4:	44414141 	strbmi	r4, [r1], #-321	@ 0xfffffebf
800112c8:	4f46494e 	svcmi	0x0046494e
800112cc:	4441494d 	strbmi	r4, [r1], #-2381	@ 0xfffff6b3
800112d0:	4f464a50 	svcmi	0x00464a50
800112d4:	44414144 	strbmi	r4, [r1], #-324	@ 0xfffffebc
800112d8:	4f414950 	svcmi	0x00414950
800112dc:	43414949 	movtmi	r4, #6473	@ 0x1949
800112e0:	4f464a50 	svcmi	0x00464a50
800112e4:	43414143 	movtmi	r4, #4419	@ 0x1143
800112e8:	4f414950 	svcmi	0x00414950
800112ec:	42414945 	submi	r4, r1, #1130496	@ 0x114000
800112f0:	4f464a50 	svcmi	0x00464a50
800112f4:	42414142 	submi	r4, r1, #-2147483632	@ 0x80000010
800112f8:	4f414950 	svcmi	0x00414950
800112fc:	41414941 	cmpmi	r1, r1, asr #18
80011300:	4f464a50 	svcmi	0x00464a50
80011304:	41414141 	cmpmi	r1, r1, asr #2
80011308:	4f484a45 	svcmi	0x00484a45
8001130c:	41414f4f 	cmpmi	r1, pc, asr #30
80011310:	4f4c4141 	svcmi	0x004c4141
80011314:	44414849 	strbmi	r4, [r1], #-2121	@ 0xfffff7b7
80011318:	4f464a50 	svcmi	0x00464a50
8001131c:	44414144 	strbmi	r4, [r1], #-324	@ 0xfffffebc
80011320:	4f414950 	svcmi	0x00414950
80011324:	42414144 	submi	r4, r1, #68, 2
80011328:	4f424b41 	svcmi	0x00424b41
8001132c:	44414749 	strbmi	r4, [r1], #-1865	@ 0xfffff8b7
80011330:	4f464a50 	svcmi	0x00464a50
80011334:	44414144 	strbmi	r4, [r1], #-324	@ 0xfffffebc
80011338:	4f484a45 	svcmi	0x00484a45
8001133c:	41414144 	cmpmi	r1, r4, asr #2
80011340:	4f424b41 	svcmi	0x00424b41
80011344:	41414f48 	cmpmi	r1, r8, asr #30
80011348:	4f4c4141 	svcmi	0x004c4141
8001134c:	44414a45 	strbmi	r4, [r1], #-2629	@ 0xfffff5bb
80011350:	4f43454c 	svcmi	0x0043454c
80011354:	43414144 	movtmi	r4, #4420	@ 0x1144
80011358:	4f424b41 	svcmi	0x00424b41
8001135c:	44414641 	strbmi	r4, [r1], #-1601	@ 0xfffff9bf
80011360:	4f464a50 	svcmi	0x00464a50
80011364:	44414144 	strbmi	r4, [r1], #-324	@ 0xfffffebc
80011368:	4f484a45 	svcmi	0x00484a45
8001136c:	42414144 	submi	r4, r1, #68, 2
80011370:	4f424b41 	svcmi	0x00424b41
80011374:	4441454d 	strbmi	r4, [r1], #-1357	@ 0xfffffab3
80011378:	4f464a50 	svcmi	0x00464a50
8001137c:	44414144 	strbmi	r4, [r1], #-324	@ 0xfffffebc
80011380:	4f484a45 	svcmi	0x00484a45
80011384:	41414144 	cmpmi	r1, r4, asr #2
80011388:	4f424b41 	svcmi	0x00424b41
8001138c:	4141494b 	cmpmi	r1, fp, asr #18
80011390:	4f4c4141 	svcmi	0x004c4141
80011394:	44414a45 	strbmi	r4, [r1], #-2629	@ 0xfffff5bb
80011398:	4f43454c 	svcmi	0x0043454c
8001139c:	43414144 	movtmi	r4, #4420	@ 0x1144
800113a0:	4f424b41 	svcmi	0x00424b41
800113a4:	44414449 	strbmi	r4, [r1], #-1097	@ 0xfffffbb7
800113a8:	4f464a50 	svcmi	0x00464a50
800113ac:	44414144 	strbmi	r4, [r1], #-324	@ 0xfffffebc
800113b0:	4f414950 	svcmi	0x00414950
800113b4:	42414144 	submi	r4, r1, #68, 2
800113b8:	4f424b41 	svcmi	0x00424b41
800113bc:	44414341 	strbmi	r4, [r1], #-833	@ 0xfffffcbf
800113c0:	4f464a50 	svcmi	0x00464a50
800113c4:	44414144 	strbmi	r4, [r1], #-324	@ 0xfffffebc
800113c8:	4f484a45 	svcmi	0x00484a45
800113cc:	41414144 	cmpmi	r1, r4, asr #2
800113d0:	4f424b41 	svcmi	0x00424b41
800113d4:	41414e46 	cmpmi	r1, r6, asr #28
800113d8:	4f4c4141 	svcmi	0x004c4141
800113dc:	41414141 	cmpmi	r1, r1, asr #2
800113e0:	4f444b41 	svcmi	0x00444b41
800113e4:	41414548 	cmpmi	r1, r8, asr #10
800113e8:	4f4c4141 	svcmi	0x004c4141
800113ec:	424b5041 	submi	r5, fp, #65	@ 0x41
800113f0:	41414141 	cmpmi	r1, r1, asr #2
800113f4:	414b4149 	cmpmi	fp, r9, asr #2
800113f8:	41414141 	cmpmi	r1, r1, asr #2
800113fc:	414b4149 	cmpmi	fp, r9, asr #2
80011400:	41414141 	cmpmi	r1, r1, asr #2
80011404:	414b4149 	cmpmi	fp, r9, asr #2
80011408:	41414141 	cmpmi	r1, r1, asr #2
8001140c:	4141414d 	cmpmi	r1, sp, asr #2
80011410:	41414141 	cmpmi	r1, r1, asr #2
80011414:	414b4141 	cmpmi	fp, r1, asr #2
80011418:	41414141 	cmpmi	r1, r1, asr #2
8001141c:	41414241 	cmpmi	r1, r1, asr #4
80011420:	41414141 	cmpmi	r1, r1, asr #2
80011424:	414a4e41 	cmpmi	sl, r1, asr #28
80011428:	41414141 	cmpmi	r1, r1, asr #2
8001142c:	4d41414e 	stclmi	1, cr4, [r1, #-312]	@ 0xfffffec8
80011430:	4f424b41 	svcmi	0x00424b41
80011434:	4e494141 	cdpmi	1, 4, cr4, cr9, cr1, {2}
80011438:	4f4a434e 	svcmi	0x004a434e
8001143c:	4c414145 	mcrrmi	1, 4, r4, r1, cr5
80011440:	4f43454d 	svcmi	0x0043454d
80011444:	4e414241 	cdpmi	2, 4, cr4, cr1, cr1, {2}
80011448:	4f43454e 	svcmi	0x0043454e
8001144c:	44414141 	strbmi	r4, [r1], #-321	@ 0xfffffebf
80011450:	4f424b41 	svcmi	0x00424b41
80011454:	44414246 	strbmi	r4, [r1], #-582	@ 0xfffffdba
80011458:	4f46454c 	svcmi	0x0046454c
8001145c:	41414246 	cmpmi	r1, r6, asr #4
80011460:	4f46424c 	svcmi	0x0046424c
80011464:	41414141 	cmpmi	r1, r1, asr #2
80011468:	4f504141 	svcmi	0x00504141
8001146c:	41414241 	cmpmi	r1, r1, asr #4
80011470:	4f46414c 	svcmi	0x0046414c
80011474:	44414241 	strbmi	r4, [r1], #-577	@ 0xfffffdbf
80011478:	4f46424c 	svcmi	0x0046424c
8001147c:	41414144 	cmpmi	r1, r4, asr #2
80011480:	4f424b41 	svcmi	0x00424b41
80011484:	4e41414d 	cdpmi	1, 4, cr4, cr1, cr13, {2}
80011488:	4f43454c 	svcmi	0x0043454c
8001148c:	4b494141 	blmi	81261998 <irq_stack_start+0x1207988>
80011490:	4f494a4e 	svcmi	0x00494a4e
80011494:	4d41414e 	stclmi	1, cr4, [r1, #-312]	@ 0xfffffec8
80011498:	4f424b41 	svcmi	0x00424b41
8001149c:	4e494141 	cdpmi	1, 4, cr4, cr9, cr1, {2}
800114a0:	4f4a434e 	svcmi	0x004a434e
800114a4:	4c414145 	mcrrmi	1, 4, r4, r1, cr5
800114a8:	4f43454d 	svcmi	0x0043454d
800114ac:	4e414241 	cdpmi	2, 4, cr4, cr1, cr1, {2}
800114b0:	4f43454e 	svcmi	0x0043454e
800114b4:	44414141 	strbmi	r4, [r1], #-321	@ 0xfffffebf
800114b8:	4f424b41 	svcmi	0x00424b41
800114bc:	4241424d 	submi	r4, r1, #-805306364	@ 0xd0000004
800114c0:	4f46414c 	svcmi	0x0046414c
800114c4:	44414246 	strbmi	r4, [r1], #-582	@ 0xfffffdba
800114c8:	4f46454c 	svcmi	0x0046454c
800114cc:	41414246 	cmpmi	r1, r6, asr #4
800114d0:	4f46424c 	svcmi	0x0046424c
800114d4:	4241424d 	submi	r4, r1, #-805306364	@ 0xd0000004
800114d8:	4f46424c 	svcmi	0x0046424c
800114dc:	41414141 	cmpmi	r1, r1, asr #2
800114e0:	4f504141 	svcmi	0x00504141
800114e4:	41414241 	cmpmi	r1, r1, asr #4
800114e8:	4f46414c 	svcmi	0x0046414c
800114ec:	44414241 	strbmi	r4, [r1], #-577	@ 0xfffffdbf
800114f0:	4f46424c 	svcmi	0x0046424c
800114f4:	41414144 	cmpmi	r1, r4, asr #2
800114f8:	4f424b41 	svcmi	0x00424b41
800114fc:	4e41414d 	cdpmi	1, 4, cr4, cr1, cr13, {2}
80011500:	4f43454c 	svcmi	0x0043454c
80011504:	4b494141 	blmi	81261a10 <irq_stack_start+0x1207a00>
80011508:	4f494a4e 	svcmi	0x00494a4e
8001150c:	4d41414e 	stclmi	1, cr4, [r1, #-312]	@ 0xfffffec8
80011510:	4f424b41 	svcmi	0x00424b41
80011514:	4e494141 	cdpmi	1, 4, cr4, cr9, cr1, {2}
80011518:	4f4a434e 	svcmi	0x004a434e
8001151c:	4c414145 	mcrrmi	1, 4, r4, r1, cr5
80011520:	4f43454d 	svcmi	0x0043454d
80011524:	4e414249 	cdpmi	2, 4, cr4, cr1, cr9, {2}
80011528:	4f43454e 	svcmi	0x0043454e
8001152c:	44414141 	strbmi	r4, [r1], #-321	@ 0xfffffebf
80011530:	4f424b41 	svcmi	0x00424b41
80011534:	4241424d 	submi	r4, r1, #-805306364	@ 0xd0000004
80011538:	4f46414c 	svcmi	0x0046414c
8001153c:	43414341 	movtmi	r4, #4929	@ 0x1341
80011540:	4f46414c 	svcmi	0x0046414c
80011544:	44414246 	strbmi	r4, [r1], #-582	@ 0xfffffdba
80011548:	4f46454c 	svcmi	0x0046454c
8001154c:	41414246 	cmpmi	r1, r6, asr #4
80011550:	4f46424c 	svcmi	0x0046424c
80011554:	4241424d 	submi	r4, r1, #-805306364	@ 0xd0000004
80011558:	4f46424c 	svcmi	0x0046424c
8001155c:	43414341 	movtmi	r4, #4929	@ 0x1341
80011560:	4f46424c 	svcmi	0x0046424c
80011564:	41414141 	cmpmi	r1, r1, asr #2
80011568:	4f504141 	svcmi	0x00504141
8001156c:	41414241 	cmpmi	r1, r1, asr #4
80011570:	4f46414c 	svcmi	0x0046414c
80011574:	44414241 	strbmi	r4, [r1], #-577	@ 0xfffffdbf
80011578:	4f46424c 	svcmi	0x0046424c
8001157c:	41414144 	cmpmi	r1, r4, asr #2
80011580:	4f424b41 	svcmi	0x00424b41
80011584:	4e41414d 	cdpmi	1, 4, cr4, cr1, cr13, {2}
80011588:	4f43454c 	svcmi	0x0043454c
8001158c:	4b494141 	blmi	81261a98 <irq_stack_start+0x1207a88>
80011590:	4f494a4e 	svcmi	0x00494a4e
80011594:	4d41414e 	stclmi	1, cr4, [r1, #-312]	@ 0xfffffec8
80011598:	4f424b41 	svcmi	0x00424b41
8001159c:	4e494141 	cdpmi	1, 4, cr4, cr9, cr1, {2}
800115a0:	4f4a434e 	svcmi	0x004a434e
800115a4:	4c414145 	mcrrmi	1, 4, r4, r1, cr5
800115a8:	4f43454d 	svcmi	0x0043454d
800115ac:	4e414149 	cdpmi	1, 4, cr4, cr1, cr9, {2}
800115b0:	4f43454e 	svcmi	0x0043454e
800115b4:	41414241 	cmpmi	r1, r1, asr #4
800115b8:	4f46414c 	svcmi	0x0046414c
800115bc:	42414241 	submi	r4, r1, #268435460	@ 0x10000004
800115c0:	4f46424c 	svcmi	0x0046424c
800115c4:	41414141 	cmpmi	r1, r1, asr #2
800115c8:	4f444b41 	svcmi	0x00444b41
800115cc:	50504e48 	subspl	r4, r0, r8, asr #28
800115d0:	4f4c5050 	svcmi	0x004c5050
800115d4:	50414141 	subpl	r4, r1, r1, asr #2
800115d8:	4f444341 	svcmi	0x00444341
800115dc:	4e41414d 	cdpmi	1, 4, cr4, cr1, cr13, {2}
800115e0:	4f43454c 	svcmi	0x0043454c
800115e4:	4b494141 	blmi	81261af0 <irq_stack_start+0x1207ae0>
800115e8:	4f494a4e 	svcmi	0x00494a4e
800115ec:	4d41414e 	stclmi	1, cr4, [r1, #-312]	@ 0xfffffec8
800115f0:	4f424b41 	svcmi	0x00424b41
800115f4:	4e494141 	cdpmi	1, 4, cr4, cr9, cr1, {2}
800115f8:	4f4a434e 	svcmi	0x004a434e
800115fc:	4c414145 	mcrrmi	1, 4, r4, r1, cr5
80011600:	4f43454d 	svcmi	0x0043454d
80011604:	41414142 	cmpmi	r1, r2, asr #2
80011608:	4f444b41 	svcmi	0x00444b41
8001160c:	50504d43 	subspl	r4, r0, r3, asr #26
80011610:	4f4c5050 	svcmi	0x004c5050
80011614:	44414141 	strbmi	r4, [r1], #-321	@ 0xfffffebf
80011618:	4f424b41 	svcmi	0x00424b41
8001161c:	41414144 	cmpmi	r1, r4, asr #2
80011620:	4f424b41 	svcmi	0x00424b41
80011624:	4b494141 	blmi	81261b30 <irq_stack_start+0x1207b20>
80011628:	4f494a4e 	svcmi	0x00494a4e
8001162c:	4d41414e 	stclmi	1, cr4, [r1, #-312]	@ 0xfffffec8
80011630:	4f424b41 	svcmi	0x00424b41
80011634:	4e494141 	cdpmi	1, 4, cr4, cr9, cr1, {2}
80011638:	4f4a434e 	svcmi	0x004a434e
8001163c:	4c414145 	mcrrmi	1, 4, r4, r1, cr5
80011640:	4f43454d 	svcmi	0x0043454d
80011644:	4e414149 	cdpmi	1, 4, cr4, cr1, cr9, {2}
80011648:	4f43454e 	svcmi	0x0043454e
8001164c:	41414241 	cmpmi	r1, r1, asr #4
80011650:	4f46414c 	svcmi	0x0046414c
80011654:	42414241 	submi	r4, r1, #268435460	@ 0x10000004
80011658:	4f46424c 	svcmi	0x0046424c
8001165c:	41414143 	cmpmi	r1, r3, asr #2
80011660:	4f444b41 	svcmi	0x00444b41
80011664:	50504d45 	subspl	r4, r0, r5, asr #26
80011668:	4f4c5050 	svcmi	0x004c5050
8001166c:	50414141 	subpl	r4, r1, r1, asr #2
80011670:	4f444341 	svcmi	0x00444341
80011674:	4e41414d 	cdpmi	1, 4, cr4, cr1, cr13, {2}
80011678:	4f43454c 	svcmi	0x0043454c
8001167c:	4b494141 	blmi	81261b88 <irq_stack_start+0x1207b78>
80011680:	4f494a4e 	svcmi	0x00494a4e
80011684:	4d41414e 	stclmi	1, cr4, [r1, #-312]	@ 0xfffffec8
80011688:	4f424b41 	svcmi	0x00424b41
8001168c:	4e494141 	cdpmi	1, 4, cr4, cr9, cr1, {2}
80011690:	4f4a434e 	svcmi	0x004a434e
80011694:	4c414145 	mcrrmi	1, 4, r4, r1, cr5
80011698:	4f43454d 	svcmi	0x0043454d
8001169c:	41414144 	cmpmi	r1, r4, asr #2
800116a0:	4f444b41 	svcmi	0x00444b41
800116a4:	50504b50 	subspl	r4, r0, r0, asr fp
800116a8:	4f4c5050 	svcmi	0x004c5050
800116ac:	44414141 	strbmi	r4, [r1], #-321	@ 0xfffffebf
800116b0:	4f424b41 	svcmi	0x00424b41
800116b4:	41414144 	cmpmi	r1, r4, asr #2
800116b8:	4f424b41 	svcmi	0x00424b41
800116bc:	4b494141 	blmi	81261bc8 <irq_stack_start+0x1207bb8>
800116c0:	4f494a4e 	svcmi	0x00494a4e
800116c4:	4d41414e 	stclmi	1, cr4, [r1, #-312]	@ 0xfffffec8
800116c8:	4f424b41 	svcmi	0x00424b41
800116cc:	4e494141 	cdpmi	1, 4, cr4, cr9, cr1, {2}
800116d0:	4f4a434e 	svcmi	0x004a434e
800116d4:	4c414145 	mcrrmi	1, 4, r4, r1, cr5
800116d8:	4f43454d 	svcmi	0x0043454d
800116dc:	41414145 	cmpmi	r1, r5, asr #2
800116e0:	4f444b41 	svcmi	0x00444b41
800116e4:	50504b48 	subspl	r4, r0, r8, asr #22
800116e8:	4f4c5050 	svcmi	0x004c5050
800116ec:	44414141 	strbmi	r4, [r1], #-321	@ 0xfffffebf
800116f0:	4f424b41 	svcmi	0x00424b41
800116f4:	41414144 	cmpmi	r1, r4, asr #2
800116f8:	4f424b41 	svcmi	0x00424b41
800116fc:	4b494141 	blmi	81261c08 <irq_stack_start+0x1207bf8>
80011700:	4f494a4e 	svcmi	0x00494a4e
80011704:	4d41414e 	stclmi	1, cr4, [r1, #-312]	@ 0xfffffec8
80011708:	4f424b41 	svcmi	0x00424b41
8001170c:	4e494141 	cdpmi	1, 4, cr4, cr9, cr1, {2}
80011710:	4f4a434e 	svcmi	0x004a434e
80011714:	4c414145 	mcrrmi	1, 4, r4, r1, cr5
80011718:	4f43454d 	svcmi	0x0043454d
8001171c:	4e414149 	cdpmi	1, 4, cr4, cr1, cr9, {2}
80011720:	4f43454e 	svcmi	0x0043454e
80011724:	41414241 	cmpmi	r1, r1, asr #4
80011728:	4f46414c 	svcmi	0x0046414c
8001172c:	42414241 	submi	r4, r1, #268435460	@ 0x10000004
80011730:	4f46424c 	svcmi	0x0046424c
80011734:	41414146 	cmpmi	r1, r6, asr #2
80011738:	4f444b41 	svcmi	0x00444b41
8001173c:	50504b4a 	subspl	r4, r0, sl, asr #22
80011740:	4f4c5050 	svcmi	0x004c5050
80011744:	50414141 	subpl	r4, r1, r1, asr #2
80011748:	4f444341 	svcmi	0x00444341
8001174c:	4e41414d 	cdpmi	1, 4, cr4, cr1, cr13, {2}
80011750:	4f43454c 	svcmi	0x0043454c
80011754:	4b494141 	blmi	81261c60 <irq_stack_start+0x1207c50>
80011758:	4f494a4e 	svcmi	0x00494a4e
8001175c:	4d41414e 	stclmi	1, cr4, [r1, #-312]	@ 0xfffffec8
80011760:	4f424b41 	svcmi	0x00424b41
80011764:	4e494141 	cdpmi	1, 4, cr4, cr9, cr1, {2}
80011768:	4f4a434e 	svcmi	0x004a434e
8001176c:	4c414145 	mcrrmi	1, 4, r4, r1, cr5
80011770:	4f43454d 	svcmi	0x0043454d
80011774:	41414147 	cmpmi	r1, r7, asr #2
80011778:	4f444b41 	svcmi	0x00444b41
8001177c:	50504a45 	subspl	r4, r0, r5, asr #20
80011780:	4f4c5050 	svcmi	0x004c5050
80011784:	50414141 	subpl	r4, r1, r1, asr #2
80011788:	4f444341 	svcmi	0x00444341
8001178c:	4b494141 	blmi	81261c98 <irq_stack_start+0x1207c88>
80011790:	4f494a4e 	svcmi	0x00494a4e
80011794:	4d41414e 	stclmi	1, cr4, [r1, #-312]	@ 0xfffffec8
80011798:	4f424b41 	svcmi	0x00424b41
8001179c:	4e494141 	cdpmi	1, 4, cr4, cr9, cr1, {2}
800117a0:	4f4a434e 	svcmi	0x004a434e
800117a4:	4c414145 	mcrrmi	1, 4, r4, r1, cr5
800117a8:	4f43454d 	svcmi	0x0043454d
800117ac:	4e414149 	cdpmi	1, 4, cr4, cr1, cr9, {2}
800117b0:	4f43454e 	svcmi	0x0043454e
800117b4:	41414241 	cmpmi	r1, r1, asr #4
800117b8:	4f46414c 	svcmi	0x0046414c
800117bc:	42414241 	submi	r4, r1, #268435460	@ 0x10000004
800117c0:	4f46424c 	svcmi	0x0046424c
800117c4:	41414148 	cmpmi	r1, r8, asr #2
800117c8:	4f444b41 	svcmi	0x00444b41
800117cc:	50504a48 	subspl	r4, r0, r8, asr #20
800117d0:	4f4c5050 	svcmi	0x004c5050
800117d4:	50414141 	subpl	r4, r1, r1, asr #2
800117d8:	4f444341 	svcmi	0x00444341
800117dc:	4e41414d 	cdpmi	1, 4, cr4, cr1, cr13, {2}
800117e0:	4f43454c 	svcmi	0x0043454c
800117e4:	4b494141 	blmi	81261cf0 <irq_stack_start+0x1207ce0>
800117e8:	4f494a4e 	svcmi	0x00494a4e
800117ec:	4d41414e 	stclmi	1, cr4, [r1, #-312]	@ 0xfffffec8
800117f0:	4f424b41 	svcmi	0x00424b41
800117f4:	4e494141 	cdpmi	1, 4, cr4, cr9, cr1, {2}
800117f8:	4f4a434e 	svcmi	0x004a434e
800117fc:	4c414145 	mcrrmi	1, 4, r4, r1, cr5
80011800:	4f43454d 	svcmi	0x0043454d
80011804:	4e414249 	cdpmi	2, 4, cr4, cr1, cr9, {2}
80011808:	4f43454e 	svcmi	0x0043454e
8001180c:	41414249 	cmpmi	r1, r9, asr #4
80011810:	4f46414c 	svcmi	0x0046414c
80011814:	4241424d 	submi	r4, r1, #-805306364	@ 0xd0000004
80011818:	4f46414c 	svcmi	0x0046414c
8001181c:	43414341 	movtmi	r4, #4929	@ 0x1341
80011820:	4f46414c 	svcmi	0x0046414c
80011824:	44414141 	strbmi	r4, [r1], #-321	@ 0xfffffebf
80011828:	4f444b41 	svcmi	0x00444b41
8001182c:	44414241 	strbmi	r4, [r1], #-577	@ 0xfffffdbf
80011830:	4f46414c 	svcmi	0x0046414c
80011834:	44414141 	strbmi	r4, [r1], #-321	@ 0xfffffebf
80011838:	4f444b41 	svcmi	0x00444b41
8001183c:	44414245 	strbmi	r4, [r1], #-581	@ 0xfffffdbb
80011840:	4f46414c 	svcmi	0x0046414c
80011844:	41414444 	cmpmi	r1, r4, asr #8
80011848:	4f4b4141 	svcmi	0x004b4141
8001184c:	44414249 	strbmi	r4, [r1], #-585	@ 0xfffffdb7
80011850:	4f46424c 	svcmi	0x0046424c
80011854:	50504444 	subspl	r4, r0, r4, asr #8
80011858:	4f424350 	svcmi	0x00424350
8001185c:	41414245 	cmpmi	r1, r5, asr #4
80011860:	4f46414c 	svcmi	0x0046414c
80011864:	44414245 	strbmi	r4, [r1], #-581	@ 0xfffffdbb
80011868:	4f46424c 	svcmi	0x0046424c
8001186c:	41414141 	cmpmi	r1, r1, asr #2
80011870:	4f444644 	svcmi	0x00444644
80011874:	4141434d 	cmpmi	r1, sp, asr #6
80011878:	414b4141 	cmpmi	fp, r1, asr #2
8001187c:	44414245 	strbmi	r4, [r1], #-581	@ 0xfffffdbb
80011880:	4f46424c 	svcmi	0x0046424c
80011884:	4141414e 	cmpmi	r1, lr, asr #2
80011888:	4f444644 	svcmi	0x00444644
8001188c:	41414441 	cmpmi	r1, r1, asr #8
80011890:	414b4141 	cmpmi	fp, r1, asr #2
80011894:	44414245 	strbmi	r4, [r1], #-581	@ 0xfffffdbb
80011898:	4f46424c 	svcmi	0x0046424c
8001189c:	4141414b 	cmpmi	r1, fp, asr #2
800118a0:	4f444644 	svcmi	0x00444644
800118a4:	4141434e 	cmpmi	r1, lr, asr #6
800118a8:	414b4141 	cmpmi	fp, r1, asr #2
800118ac:	44414245 	strbmi	r4, [r1], #-581	@ 0xfffffdbb
800118b0:	4f46424c 	svcmi	0x0046424c
800118b4:	43414e4d 	movtmi	r4, #7757	@ 0x1e4d
800118b8:	4f464a50 	svcmi	0x00464a50
800118bc:	41414143 	cmpmi	r1, r3, asr #2
800118c0:	4f424644 	svcmi	0x00424644
800118c4:	41414150 	cmpmi	r1, r0, asr r1
800118c8:	424b4141 	submi	r4, fp, #1073741840	@ 0x40000010
800118cc:	44414241 	strbmi	r4, [r1], #-577	@ 0xfffffdbf
800118d0:	4f46424c 	svcmi	0x0046424c
800118d4:	41414141 	cmpmi	r1, r1, asr #2
800118d8:	4f444644 	svcmi	0x00444644
800118dc:	41414341 	cmpmi	r1, r1, asr #6
800118e0:	414b4141 	cmpmi	fp, r1, asr #2
800118e4:	4441424d 	strbmi	r4, [r1], #-589	@ 0xfffffdb3
800118e8:	4f46424c 	svcmi	0x0046424c
800118ec:	41414d45 	cmpmi	r1, r5, asr #26
800118f0:	4f464a50 	svcmi	0x00464a50
800118f4:	50504444 	subspl	r4, r0, r4, asr #8
800118f8:	4f424350 	svcmi	0x00424350
800118fc:	4441424d 	strbmi	r4, [r1], #-589	@ 0xfffffdb3
80011900:	4f46424c 	svcmi	0x0046424c
80011904:	41414341 	cmpmi	r1, r1, asr #6
80011908:	4f444b41 	svcmi	0x00444b41
8001190c:	50504444 	subspl	r4, r0, r4, asr #8
80011910:	4f424350 	svcmi	0x00424350
80011914:	4441424d 	strbmi	r4, [r1], #-589	@ 0xfffffdb3
80011918:	4f46424c 	svcmi	0x0046424c
8001191c:	41414b4d 	cmpmi	r1, sp, asr #22
80011920:	4f464a50 	svcmi	0x00464a50
80011924:	50504444 	subspl	r4, r0, r4, asr #8
80011928:	4f424350 	svcmi	0x00424350
8001192c:	44414241 	strbmi	r4, [r1], #-577	@ 0xfffffdbf
80011930:	4f46424c 	svcmi	0x0046424c
80011934:	44414142 	strbmi	r4, [r1], #-322	@ 0xfffffebe
80011938:	4f434544 	svcmi	0x00434544
8001193c:	44414241 	strbmi	r4, [r1], #-577	@ 0xfffffdbf
80011940:	4f46414c 	svcmi	0x0046414c
80011944:	41414244 	cmpmi	r1, r4, asr #4
80011948:	4f4b4141 	svcmi	0x004b4141
8001194c:	44414245 	strbmi	r4, [r1], #-581	@ 0xfffffdbb
80011950:	4f46424c 	svcmi	0x0046424c
80011954:	41414250 	cmpmi	r1, r0, asr r2
80011958:	4f444644 	svcmi	0x00444644
8001195c:	41414241 	cmpmi	r1, r1, asr #4
80011960:	4e4b4141 	cdpmi	1, 4, cr4, cr11, cr1, {2}
80011964:	44414245 	strbmi	r4, [r1], #-581	@ 0xfffffdbb
80011968:	4f46424c 	svcmi	0x0046424c
8001196c:	41414850 	cmpmi	r1, r0, asr r8
80011970:	4f444644 	svcmi	0x00444644
80011974:	4141414e 	cmpmi	r1, lr, asr #2
80011978:	4d4b4141 	stclmi	1, cr4, [fp, #-260]	@ 0xfffffefc
8001197c:	4441424d 	strbmi	r4, [r1], #-589	@ 0xfffffdb3
80011980:	4f46424c 	svcmi	0x0046424c
80011984:	41414245 	cmpmi	r1, r5, asr #4
80011988:	4f46424c 	svcmi	0x0046424c
8001198c:	50504444 	subspl	r4, r0, r4, asr #8
80011990:	4f424350 	svcmi	0x00424350
80011994:	44414241 	strbmi	r4, [r1], #-577	@ 0xfffffdbf
80011998:	4f46424c 	svcmi	0x0046424c
8001199c:	43414341 	movtmi	r4, #4929	@ 0x1341
800119a0:	4f46424c 	svcmi	0x0046424c
800119a4:	44414144 	strbmi	r4, [r1], #-324	@ 0xfffffebc
800119a8:	4f414943 	svcmi	0x00414943
800119ac:	43414245 	movtmi	r4, #4677	@ 0x1245
800119b0:	4f46424c 	svcmi	0x0046424c
800119b4:	43414843 	movtmi	r4, #6211	@ 0x1843
800119b8:	4f474f50 	svcmi	0x00474f50
800119bc:	43414141 	movtmi	r4, #4417	@ 0x1141
800119c0:	4f464d44 	svcmi	0x00464d44
800119c4:	44414241 	strbmi	r4, [r1], #-577	@ 0xfffffdbf
800119c8:	4f46424c 	svcmi	0x0046424c
800119cc:	44414142 	strbmi	r4, [r1], #-322	@ 0xfffffebe
800119d0:	4f434944 	svcmi	0x00434944
800119d4:	44414241 	strbmi	r4, [r1], #-577	@ 0xfffffdbf
800119d8:	4f46414c 	svcmi	0x0046414c
800119dc:	41414141 	cmpmi	r1, r1, asr #2
800119e0:	4f4b4141 	svcmi	0x004b4141
800119e4:	50414141 	subpl	r4, r1, r1, asr #2
800119e8:	4f444341 	svcmi	0x00444341
800119ec:	44414245 	strbmi	r4, [r1], #-581	@ 0xfffffdbb
800119f0:	4f46424c 	svcmi	0x0046424c
800119f4:	4141414e 	cmpmi	r1, lr, asr #2
800119f8:	4f444644 	svcmi	0x00444644
800119fc:	41414143 	cmpmi	r1, r3, asr #2
80011a00:	414b4141 	cmpmi	fp, r1, asr #2
80011a04:	44414245 	strbmi	r4, [r1], #-581	@ 0xfffffdbb
80011a08:	4f46424c 	svcmi	0x0046424c
80011a0c:	4141414b 	cmpmi	r1, fp, asr #2
80011a10:	4f444644 	svcmi	0x00444644
80011a14:	50504d46 	subspl	r4, r0, r6, asr #26
80011a18:	424b5050 	submi	r5, fp, #80	@ 0x50
80011a1c:	4441424d 	strbmi	r4, [r1], #-589	@ 0xfffffdb3
80011a20:	4f46424c 	svcmi	0x0046424c
80011a24:	4141414b 	cmpmi	r1, fp, asr #2
80011a28:	4f444b41 	svcmi	0x00444b41
80011a2c:	50504444 	subspl	r4, r0, r4, asr #8
80011a30:	4f424350 	svcmi	0x00424350
80011a34:	44414241 	strbmi	r4, [r1], #-577	@ 0xfffffdbf
80011a38:	4f46424c 	svcmi	0x0046424c
80011a3c:	43414341 	movtmi	r4, #4929	@ 0x1341
80011a40:	4f46424c 	svcmi	0x0046424c
80011a44:	44414144 	strbmi	r4, [r1], #-324	@ 0xfffffebc
80011a48:	4f414943 	svcmi	0x00414943
80011a4c:	43414141 	movtmi	r4, #4417	@ 0x1141
80011a50:	4f444b41 	svcmi	0x00444b41
80011a54:	43414141 	movtmi	r4, #4417	@ 0x1141
80011a58:	4f464d44 	svcmi	0x00464d44
80011a5c:	44414341 	strbmi	r4, [r1], #-833	@ 0xfffffcbf
80011a60:	4f46424c 	svcmi	0x0046424c
80011a64:	41414144 	cmpmi	r1, r4, asr #2
80011a68:	4f424b41 	svcmi	0x00424b41
80011a6c:	4e41414d 	cdpmi	1, 4, cr4, cr1, cr13, {2}
80011a70:	4f43454c 	svcmi	0x0043454c
80011a74:	4b494141 	blmi	81261f80 <irq_stack_start+0x1207f70>
80011a78:	4f494a4e 	svcmi	0x00494a4e
80011a7c:	42414146 	submi	r4, r1, #-2147483631	@ 0x80000011
80011a80:	41414141 	cmpmi	r1, r1, asr #2
80011a84:	42414145 	submi	r4, r1, #1073741841	@ 0x40000011
80011a88:	41414141 	cmpmi	r1, r1, asr #2
80011a8c:	4d41414e 	stclmi	1, cr4, [r1, #-312]	@ 0xfffffec8
80011a90:	4f424b41 	svcmi	0x00424b41
80011a94:	4141414f 	cmpmi	r1, pc, asr #2
80011a98:	4f4a434e 	svcmi	0x004a434e
80011a9c:	4e494141 	cdpmi	1, 4, cr4, cr9, cr1, {2}
80011aa0:	4f4a434e 	svcmi	0x004a434e
80011aa4:	4c414241 	mcrrmi	2, 4, r4, r1, cr1
80011aa8:	4f43454d 	svcmi	0x0043454d
80011aac:	4e504548 	cdpmi	5, 5, cr4, cr0, cr8, {2}
80011ab0:	4f43454e 	svcmi	0x0043454e
80011ab4:	41424345 	cmpmi	r2, r5, asr #6
80011ab8:	4f46414c 	svcmi	0x0046414c
80011abc:	44414141 	strbmi	r4, [r1], #-321	@ 0xfffffebf
80011ac0:	4f444b41 	svcmi	0x00444b41
80011ac4:	44414249 	strbmi	r4, [r1], #-585	@ 0xfffffdb7
80011ac8:	4f46414c 	svcmi	0x0046414c
80011acc:	44414141 	strbmi	r4, [r1], #-321	@ 0xfffffebf
80011ad0:	4f444b41 	svcmi	0x00444b41
80011ad4:	44414245 	strbmi	r4, [r1], #-581	@ 0xfffffdbb
80011ad8:	4f46414c 	svcmi	0x0046414c
80011adc:	44414149 	strbmi	r4, [r1], #-329	@ 0xfffffeb7
80011ae0:	4f43494c 	svcmi	0x0043494c
80011ae4:	4442424d 	strbmi	r4, [r2], #-589	@ 0xfffffdb3
80011ae8:	4f46414c 	svcmi	0x0046414c
80011aec:	44504547 	ldrbmi	r4, [r0], #-1351	@ 0xfffffab9
80011af0:	4f43454c 	svcmi	0x0043454c
80011af4:	4342424d 	movtmi	r4, #8781	@ 0x224d
80011af8:	4f46424c 	svcmi	0x0046424c
80011afc:	42414145 	submi	r4, r1, #1073741841	@ 0x40000011
80011b00:	4f464a4c 	svcmi	0x00464a4c
80011b04:	41414144 	cmpmi	r1, r4, asr #2
80011b08:	4f424b41 	svcmi	0x00424b41
80011b0c:	41414247 	cmpmi	r1, r7, asr #4
80011b10:	4f4c4141 	svcmi	0x004c4141
80011b14:	41414249 	cmpmi	r1, r9, asr #4
80011b18:	4f46414c 	svcmi	0x0046414c
80011b1c:	4141414b 	cmpmi	r1, fp, asr #2
80011b20:	4f4b4141 	svcmi	0x004b4141
80011b24:	43504547 	cmpmi	r0, #297795584	@ 0x11c00000
80011b28:	4f43454c 	svcmi	0x0043454c
80011b2c:	44414245 	strbmi	r4, [r1], #-581	@ 0xfffffdbb
80011b30:	4f46424c 	svcmi	0x0046424c
80011b34:	44414144 	strbmi	r4, [r1], #-324	@ 0xfffffebc
80011b38:	4f414943 	svcmi	0x00414943
80011b3c:	44414141 	strbmi	r4, [r1], #-321	@ 0xfffffebf
80011b40:	4f464e44 	svcmi	0x00464e44
80011b44:	43414144 	movtmi	r4, #4420	@ 0x1144
80011b48:	4f424b41 	svcmi	0x00424b41
80011b4c:	44424345 	strbmi	r4, [r2], #-837	@ 0xfffffcbb
80011b50:	4f46424c 	svcmi	0x0046424c
80011b54:	41414143 	cmpmi	r1, r3, asr #2
80011b58:	4f424b41 	svcmi	0x00424b41
80011b5c:	50504444 	subspl	r4, r0, r4, asr #8
80011b60:	4f424350 	svcmi	0x00424350
80011b64:	44414245 	strbmi	r4, [r1], #-581	@ 0xfffffdbb
80011b68:	4f46424c 	svcmi	0x0046424c
80011b6c:	44414142 	strbmi	r4, [r1], #-322	@ 0xfffffebe
80011b70:	4f434944 	svcmi	0x00434944
80011b74:	44414245 	strbmi	r4, [r1], #-581	@ 0xfffffdbb
80011b78:	4f46414c 	svcmi	0x0046414c
80011b7c:	43504547 	cmpmi	r0, #297795584	@ 0x11c00000
80011b80:	4f43454c 	svcmi	0x0043454c
80011b84:	44414245 	strbmi	r4, [r1], #-581	@ 0xfffffdbb
80011b88:	4f46424c 	svcmi	0x0046424c
80011b8c:	44414144 	strbmi	r4, [r1], #-324	@ 0xfffffebc
80011b90:	4f414943 	svcmi	0x00414943
80011b94:	44414141 	strbmi	r4, [r1], #-321	@ 0xfffffebf
80011b98:	4f464e44 	svcmi	0x00464e44
80011b9c:	41414141 	cmpmi	r1, r1, asr #2
80011ba0:	4f444644 	svcmi	0x00444644
80011ba4:	50504f4f 	subspl	r4, r0, pc, asr #30
80011ba8:	424b5050 	submi	r5, fp, #80	@ 0x50
80011bac:	44414249 	strbmi	r4, [r1], #-585	@ 0xfffffdb7
80011bb0:	4f46424c 	svcmi	0x0046424c
80011bb4:	41414144 	cmpmi	r1, r4, asr #2
80011bb8:	4f424b41 	svcmi	0x00424b41
80011bbc:	4e41414d 	cdpmi	1, 4, cr4, cr1, cr13, {2}
80011bc0:	4f43454c 	svcmi	0x0043454c
80011bc4:	4b494141 	blmi	812620d0 <irq_stack_start+0x12080c0>
80011bc8:	4f494a4e 	svcmi	0x00494a4e
80011bcc:	4d41414e 	stclmi	1, cr4, [r1, #-312]	@ 0xfffffec8
80011bd0:	4f424b41 	svcmi	0x00424b41
80011bd4:	4e494141 	cdpmi	1, 4, cr4, cr9, cr1, {2}
80011bd8:	4f4a434e 	svcmi	0x004a434e
80011bdc:	4c414145 	mcrrmi	1, 4, r4, r1, cr5
80011be0:	4f43454d 	svcmi	0x0043454d
80011be4:	4e414441 	cdpmi	4, 4, cr4, cr1, cr1, {2}
80011be8:	4f43454e 	svcmi	0x0043454e
80011bec:	41414441 	cmpmi	r1, r1, asr #8
80011bf0:	4f46414c 	svcmi	0x0046414c
80011bf4:	42414445 	submi	r4, r1, #1157627904	@ 0x45000000
80011bf8:	4f46414c 	svcmi	0x0046414c
80011bfc:	43414449 	movtmi	r4, #5193	@ 0x1449
80011c00:	4f46414c 	svcmi	0x0046414c
80011c04:	44414141 	strbmi	r4, [r1], #-321	@ 0xfffffebf
80011c08:	4f444b41 	svcmi	0x00444b41
80011c0c:	44414241 	strbmi	r4, [r1], #-577	@ 0xfffffdbf
80011c10:	4f46414c 	svcmi	0x0046414c
80011c14:	44414141 	strbmi	r4, [r1], #-321	@ 0xfffffebf
80011c18:	4f444b41 	svcmi	0x00444b41
80011c1c:	44414245 	strbmi	r4, [r1], #-581	@ 0xfffffdbb
80011c20:	4f46414c 	svcmi	0x0046414c
80011c24:	41414a47 	cmpmi	r1, r7, asr #20
80011c28:	4f4b4141 	svcmi	0x004b4141
80011c2c:	44414141 	strbmi	r4, [r1], #-321	@ 0xfffffebf
80011c30:	4f444b41 	svcmi	0x00444b41
80011c34:	44414246 	strbmi	r4, [r1], #-582	@ 0xfffffdba
80011c38:	4f46454c 	svcmi	0x0046454c
80011c3c:	4141414e 	cmpmi	r1, lr, asr #2
80011c40:	4f4b4141 	svcmi	0x004b4141
80011c44:	44414241 	strbmi	r4, [r1], #-577	@ 0xfffffdbf
80011c48:	4f46424c 	svcmi	0x0046424c
80011c4c:	43414445 	movtmi	r4, #5189	@ 0x1445
80011c50:	4f46424c 	svcmi	0x0046424c
80011c54:	43414144 	movtmi	r4, #4420	@ 0x1144
80011c58:	4f414943 	svcmi	0x00414943
80011c5c:	44414245 	strbmi	r4, [r1], #-581	@ 0xfffffdbb
80011c60:	4f46424c 	svcmi	0x0046424c
80011c64:	42414441 	submi	r4, r1, #1090519040	@ 0x41000000
80011c68:	4f46424c 	svcmi	0x0046424c
80011c6c:	44414144 	strbmi	r4, [r1], #-324	@ 0xfffffebc
80011c70:	4f414942 	svcmi	0x00414942
80011c74:	43414141 	movtmi	r4, #4417	@ 0x1141
80011c78:	4f464e43 	svcmi	0x00464e43
80011c7c:	43414141 	movtmi	r4, #4417	@ 0x1141
80011c80:	4f464d44 	svcmi	0x00464d44
80011c84:	44414245 	strbmi	r4, [r1], #-581	@ 0xfffffdbb
80011c88:	4f46424c 	svcmi	0x0046424c
80011c8c:	44414142 	strbmi	r4, [r1], #-322	@ 0xfffffebe
80011c90:	4f434944 	svcmi	0x00434944
80011c94:	44414245 	strbmi	r4, [r1], #-581	@ 0xfffffdbb
80011c98:	4f46414c 	svcmi	0x0046414c
80011c9c:	44414241 	strbmi	r4, [r1], #-577	@ 0xfffffdbf
80011ca0:	4f46424c 	svcmi	0x0046424c
80011ca4:	44414142 	strbmi	r4, [r1], #-322	@ 0xfffffebe
80011ca8:	4f434944 	svcmi	0x00434944
80011cac:	44414241 	strbmi	r4, [r1], #-577	@ 0xfffffdbf
80011cb0:	4f46414c 	svcmi	0x0046414c
80011cb4:	44414241 	strbmi	r4, [r1], #-577	@ 0xfffffdbf
80011cb8:	4f46424c 	svcmi	0x0046424c
80011cbc:	43414445 	movtmi	r4, #5189	@ 0x1445
80011cc0:	4f46424c 	svcmi	0x0046424c
80011cc4:	44414144 	strbmi	r4, [r1], #-324	@ 0xfffffebc
80011cc8:	4f414943 	svcmi	0x00414943
80011ccc:	44414141 	strbmi	r4, [r1], #-321	@ 0xfffffebf
80011cd0:	4f464e44 	svcmi	0x00464e44
80011cd4:	41414346 	cmpmi	r1, r6, asr #6
80011cd8:	4f444644 	svcmi	0x00444644
80011cdc:	41414146 	cmpmi	r1, r6, asr #2
80011ce0:	414b4141 	cmpmi	fp, r1, asr #2
80011ce4:	44414241 	strbmi	r4, [r1], #-577	@ 0xfffffdbf
80011ce8:	4f46424c 	svcmi	0x0046424c
80011cec:	43414445 	movtmi	r4, #5189	@ 0x1445
80011cf0:	4f46424c 	svcmi	0x0046424c
80011cf4:	44414144 	strbmi	r4, [r1], #-324	@ 0xfffffebc
80011cf8:	4f414943 	svcmi	0x00414943
80011cfc:	44414141 	strbmi	r4, [r1], #-321	@ 0xfffffebf
80011d00:	4f464e44 	svcmi	0x00464e44
80011d04:	41414141 	cmpmi	r1, r1, asr #2
80011d08:	4f444644 	svcmi	0x00444644
80011d0c:	50504f46 	subspl	r4, r0, r6, asr #30
80011d10:	424b5050 	submi	r5, fp, #80	@ 0x50
80011d14:	44414241 	strbmi	r4, [r1], #-577	@ 0xfffffdbf
80011d18:	4f46424c 	svcmi	0x0046424c
80011d1c:	43414445 	movtmi	r4, #5189	@ 0x1445
80011d20:	4f46424c 	svcmi	0x0046424c
80011d24:	44414144 	strbmi	r4, [r1], #-324	@ 0xfffffebc
80011d28:	4f414943 	svcmi	0x00414943
80011d2c:	44414141 	strbmi	r4, [r1], #-321	@ 0xfffffebf
80011d30:	4f464e44 	svcmi	0x00464e44
80011d34:	41414141 	cmpmi	r1, r1, asr #2
80011d38:	4f444644 	svcmi	0x00444644
80011d3c:	4141484a 	cmpmi	r1, sl, asr #16
80011d40:	414b4141 	cmpmi	fp, r1, asr #2
80011d44:	44414241 	strbmi	r4, [r1], #-577	@ 0xfffffdbf
80011d48:	4f46424c 	svcmi	0x0046424c
80011d4c:	44414142 	strbmi	r4, [r1], #-322	@ 0xfffffebe
80011d50:	4f434944 	svcmi	0x00434944
80011d54:	43414445 	movtmi	r4, #5189	@ 0x1445
80011d58:	4f46424c 	svcmi	0x0046424c
80011d5c:	44414144 	strbmi	r4, [r1], #-324	@ 0xfffffebc
80011d60:	4f414943 	svcmi	0x00414943
80011d64:	44414141 	strbmi	r4, [r1], #-321	@ 0xfffffebf
80011d68:	4f464e44 	svcmi	0x00464e44
80011d6c:	41414141 	cmpmi	r1, r1, asr #2
80011d70:	4f444644 	svcmi	0x00444644
80011d74:	41414843 	cmpmi	r1, r3, asr #16
80011d78:	414b4141 	cmpmi	fp, r1, asr #2
80011d7c:	44414241 	strbmi	r4, [r1], #-577	@ 0xfffffdbf
80011d80:	4f46424c 	svcmi	0x0046424c
80011d84:	44414142 	strbmi	r4, [r1], #-322	@ 0xfffffebe
80011d88:	4f434944 	svcmi	0x00434944
80011d8c:	43414445 	movtmi	r4, #5189	@ 0x1445
80011d90:	4f46424c 	svcmi	0x0046424c
80011d94:	44414144 	strbmi	r4, [r1], #-324	@ 0xfffffebc
80011d98:	4f414943 	svcmi	0x00414943
80011d9c:	44414141 	strbmi	r4, [r1], #-321	@ 0xfffffebf
80011da0:	4f464e44 	svcmi	0x00464e44
80011da4:	44414246 	strbmi	r4, [r1], #-582	@ 0xfffffdba
80011da8:	4f46454c 	svcmi	0x0046454c
80011dac:	44414246 	strbmi	r4, [r1], #-582	@ 0xfffffdba
80011db0:	4f46464c 	svcmi	0x0046464c
80011db4:	44414744 	strbmi	r4, [r1], #-1860	@ 0xfffff8bc
80011db8:	4f434544 	svcmi	0x00434544
80011dbc:	43424d49 	movtmi	r4, #11593	@ 0x2d49
80011dc0:	4f464a50 	svcmi	0x00464a50
80011dc4:	43414143 	movtmi	r4, #4419	@ 0x1143
80011dc8:	4f414950 	svcmi	0x00414950
80011dcc:	41414246 	cmpmi	r1, r6, asr #4
80011dd0:	4f444644 	svcmi	0x00444644
80011dd4:	4141464e 	cmpmi	r1, lr, asr #12
80011dd8:	494b4141 	stmdbmi	fp, {r0, r6, r8, lr}^
80011ddc:	44424144 	strbmi	r4, [r2], #-324	@ 0xfffffebc
80011de0:	4f484a43 	svcmi	0x00484a43
80011de4:	50414144 	subpl	r4, r1, r4, asr #2
80011de8:	4f414950 	svcmi	0x00414950
80011dec:	50414141 	subpl	r4, r1, r1, asr #2
80011df0:	4f444341 	svcmi	0x00444341
80011df4:	44414449 	strbmi	r4, [r1], #-1097	@ 0xfffffbb7
80011df8:	4f46424c 	svcmi	0x0046424c
80011dfc:	43414145 	movtmi	r4, #4421	@ 0x1145
80011e00:	4f434944 	svcmi	0x00434944
80011e04:	43414449 	movtmi	r4, #5193	@ 0x1449
80011e08:	4f46414c 	svcmi	0x0046414c
80011e0c:	44414141 	strbmi	r4, [r1], #-321	@ 0xfffffebf
80011e10:	4f464a44 	svcmi	0x00464a44
80011e14:	44414345 	strbmi	r4, [r1], #-837	@ 0xfffffcbb
80011e18:	4f46414c 	svcmi	0x0046414c
80011e1c:	44414245 	strbmi	r4, [r1], #-581	@ 0xfffffdbb
80011e20:	4f46424c 	svcmi	0x0046424c
80011e24:	43414441 	movtmi	r4, #5185	@ 0x1441
80011e28:	4f46424c 	svcmi	0x0046424c
80011e2c:	44414144 	strbmi	r4, [r1], #-324	@ 0xfffffebc
80011e30:	4f414943 	svcmi	0x00414943
80011e34:	42414345 	submi	r4, r1, #335544321	@ 0x14000001
80011e38:	4f46424c 	svcmi	0x0046424c
80011e3c:	41414144 	cmpmi	r1, r4, asr #2
80011e40:	4f424b41 	svcmi	0x00424b41
80011e44:	41414744 	cmpmi	r1, r4, asr #14
80011e48:	4f4c4141 	svcmi	0x004c4141
80011e4c:	43414141 	movtmi	r4, #4417	@ 0x1141
80011e50:	4f424b41 	svcmi	0x00424b41
80011e54:	44414245 	strbmi	r4, [r1], #-581	@ 0xfffffdbb
80011e58:	4f46424c 	svcmi	0x0046424c
80011e5c:	44414143 	strbmi	r4, [r1], #-323	@ 0xfffffebd
80011e60:	4f414944 	svcmi	0x00414944
80011e64:	44414245 	strbmi	r4, [r1], #-581	@ 0xfffffdbb
80011e68:	4f46414c 	svcmi	0x0046414c
80011e6c:	4141454b 	cmpmi	r1, fp, asr #10
80011e70:	4f4b4141 	svcmi	0x004b4141
80011e74:	44414449 	strbmi	r4, [r1], #-1097	@ 0xfffffbb7
80011e78:	4f46424c 	svcmi	0x0046424c
80011e7c:	43414145 	movtmi	r4, #4421	@ 0x1145
80011e80:	4f434944 	svcmi	0x00434944
80011e84:	43414449 	movtmi	r4, #5193	@ 0x1449
80011e88:	4f46414c 	svcmi	0x0046414c
80011e8c:	42414141 	submi	r4, r1, #1073741840	@ 0x40000010
80011e90:	4f464a44 	svcmi	0x00464a44
80011e94:	44414245 	strbmi	r4, [r1], #-581	@ 0xfffffdbb
80011e98:	4f46424c 	svcmi	0x0046424c
80011e9c:	43414441 	movtmi	r4, #5185	@ 0x1441
80011ea0:	4f46424c 	svcmi	0x0046424c
80011ea4:	44414144 	strbmi	r4, [r1], #-324	@ 0xfffffebc
80011ea8:	4f414943 	svcmi	0x00414943
80011eac:	43414842 	movtmi	r4, #6210	@ 0x1842
80011eb0:	4f474f50 	svcmi	0x00474f50
80011eb4:	43414141 	movtmi	r4, #4417	@ 0x1141
80011eb8:	4f464d44 	svcmi	0x00464d44
80011ebc:	44414245 	strbmi	r4, [r1], #-581	@ 0xfffffdbb
80011ec0:	4f46424c 	svcmi	0x0046424c
80011ec4:	44414142 	strbmi	r4, [r1], #-322	@ 0xfffffebe
80011ec8:	4f434944 	svcmi	0x00434944
80011ecc:	44414245 	strbmi	r4, [r1], #-581	@ 0xfffffdbb
80011ed0:	4f46414c 	svcmi	0x0046414c
80011ed4:	4141444e 	cmpmi	r1, lr, asr #8
80011ed8:	4f4b4141 	svcmi	0x004b4141
80011edc:	44414449 	strbmi	r4, [r1], #-1097	@ 0xfffffbb7
80011ee0:	4f46424c 	svcmi	0x0046424c
80011ee4:	43414145 	movtmi	r4, #4421	@ 0x1145
80011ee8:	4f434944 	svcmi	0x00434944
80011eec:	43414449 	movtmi	r4, #5193	@ 0x1449
80011ef0:	4f46414c 	svcmi	0x0046414c
80011ef4:	44414141 	strbmi	r4, [r1], #-321	@ 0xfffffebf
80011ef8:	4f464a44 	svcmi	0x00464a44
80011efc:	44414349 	strbmi	r4, [r1], #-841	@ 0xfffffcb7
80011f00:	4f46414c 	svcmi	0x0046414c
80011f04:	44414245 	strbmi	r4, [r1], #-581	@ 0xfffffdbb
80011f08:	4f46424c 	svcmi	0x0046424c
80011f0c:	43414441 	movtmi	r4, #5185	@ 0x1441
80011f10:	4f46424c 	svcmi	0x0046424c
80011f14:	44414144 	strbmi	r4, [r1], #-324	@ 0xfffffebc
80011f18:	4f414943 	svcmi	0x00414943
80011f1c:	42414349 	submi	r4, r1, #603979777	@ 0x24000001
80011f20:	4f46424c 	svcmi	0x0046424c
80011f24:	41414144 	cmpmi	r1, r4, asr #2
80011f28:	4f424b41 	svcmi	0x00424b41
80011f2c:	4141474a 	cmpmi	r1, sl, asr #14
80011f30:	4f4c4141 	svcmi	0x004c4141
80011f34:	43414141 	movtmi	r4, #4417	@ 0x1141
80011f38:	4f424b41 	svcmi	0x00424b41
80011f3c:	44414245 	strbmi	r4, [r1], #-581	@ 0xfffffdbb
80011f40:	4f46424c 	svcmi	0x0046424c
80011f44:	44414143 	strbmi	r4, [r1], #-323	@ 0xfffffebd
80011f48:	4f414944 	svcmi	0x00414944
80011f4c:	44414245 	strbmi	r4, [r1], #-581	@ 0xfffffdbb
80011f50:	4f46414c 	svcmi	0x0046414c
80011f54:	4141434e 	cmpmi	r1, lr, asr #6
80011f58:	4f4b4141 	svcmi	0x004b4141
80011f5c:	44414449 	strbmi	r4, [r1], #-1097	@ 0xfffffbb7
80011f60:	4f46424c 	svcmi	0x0046424c
80011f64:	43414145 	movtmi	r4, #4421	@ 0x1145
80011f68:	4f434944 	svcmi	0x00434944
80011f6c:	43414449 	movtmi	r4, #5193	@ 0x1449
80011f70:	4f46414c 	svcmi	0x0046414c
80011f74:	44414141 	strbmi	r4, [r1], #-321	@ 0xfffffebf
80011f78:	4f464a44 	svcmi	0x00464a44
80011f7c:	44414341 	strbmi	r4, [r1], #-833	@ 0xfffffcbf
80011f80:	4f46414c 	svcmi	0x0046414c
80011f84:	44414245 	strbmi	r4, [r1], #-581	@ 0xfffffdbb
80011f88:	4f46424c 	svcmi	0x0046424c
80011f8c:	43414441 	movtmi	r4, #5185	@ 0x1441
80011f90:	4f46424c 	svcmi	0x0046424c
80011f94:	44414144 	strbmi	r4, [r1], #-324	@ 0xfffffebc
80011f98:	4f414943 	svcmi	0x00414943
80011f9c:	4341414b 	movtmi	r4, #4427	@ 0x114b
80011fa0:	4f444b41 	svcmi	0x00444b41
80011fa4:	42414341 	submi	r4, r1, #67108865	@ 0x4000001
80011fa8:	4f46424c 	svcmi	0x0046424c
80011fac:	41414144 	cmpmi	r1, r4, asr #2
80011fb0:	4f424b41 	svcmi	0x00424b41
80011fb4:	4141484f 	cmpmi	r1, pc, asr #16
80011fb8:	4f4c4141 	svcmi	0x004c4141
80011fbc:	43414141 	movtmi	r4, #4417	@ 0x1141
80011fc0:	4f424b41 	svcmi	0x00424b41
80011fc4:	44414245 	strbmi	r4, [r1], #-581	@ 0xfffffdbb
80011fc8:	4f46424c 	svcmi	0x0046424c
80011fcc:	44414143 	strbmi	r4, [r1], #-323	@ 0xfffffebd
80011fd0:	4f414944 	svcmi	0x00414944
80011fd4:	44414245 	strbmi	r4, [r1], #-581	@ 0xfffffdbb
80011fd8:	4f46414c 	svcmi	0x0046414c
80011fdc:	4141424d 	cmpmi	r1, sp, asr #4
80011fe0:	4f4b4141 	svcmi	0x004b4141
80011fe4:	44414449 	strbmi	r4, [r1], #-1097	@ 0xfffffbb7
80011fe8:	4f46424c 	svcmi	0x0046424c
80011fec:	43414145 	movtmi	r4, #4421	@ 0x1145
80011ff0:	4f434944 	svcmi	0x00434944
80011ff4:	43414449 	movtmi	r4, #5193	@ 0x1449
80011ff8:	4f46414c 	svcmi	0x0046414c
80011ffc:	44414141 	strbmi	r4, [r1], #-321	@ 0xfffffebf
80012000:	4f464a44 	svcmi	0x00464a44
80012004:	4441424d 	strbmi	r4, [r1], #-589	@ 0xfffffdb3
80012008:	4f46414c 	svcmi	0x0046414c
8001200c:	44414245 	strbmi	r4, [r1], #-581	@ 0xfffffdbb
80012010:	4f46424c 	svcmi	0x0046424c
80012014:	43414441 	movtmi	r4, #5185	@ 0x1441
80012018:	4f46424c 	svcmi	0x0046424c
8001201c:	44414144 	strbmi	r4, [r1], #-324	@ 0xfffffebc
80012020:	4f414943 	svcmi	0x00414943
80012024:	43414a49 	movtmi	r4, #6729	@ 0x1a49
80012028:	4f464a50 	svcmi	0x00464a50
8001202c:	43414143 	movtmi	r4, #4419	@ 0x1143
80012030:	4f414950 	svcmi	0x00414950
80012034:	42414143 	submi	r4, r1, #-1073741808	@ 0xc0000010
80012038:	4f424b41 	svcmi	0x00424b41
8001203c:	41414144 	cmpmi	r1, r4, asr #2
80012040:	4f424b41 	svcmi	0x00424b41
80012044:	41414344 	cmpmi	r1, r4, asr #6
80012048:	4f4c4141 	svcmi	0x004c4141
8001204c:	43414141 	movtmi	r4, #4417	@ 0x1141
80012050:	4f424b41 	svcmi	0x00424b41
80012054:	44414245 	strbmi	r4, [r1], #-581	@ 0xfffffdbb
80012058:	4f46424c 	svcmi	0x0046424c
8001205c:	44414143 	strbmi	r4, [r1], #-323	@ 0xfffffebd
80012060:	4f414944 	svcmi	0x00414944
80012064:	44414245 	strbmi	r4, [r1], #-581	@ 0xfffffdbb
80012068:	4f46414c 	svcmi	0x0046414c
8001206c:	44414245 	strbmi	r4, [r1], #-581	@ 0xfffffdbb
80012070:	4f46424c 	svcmi	0x0046424c
80012074:	43414441 	movtmi	r4, #5185	@ 0x1441
80012078:	4f46424c 	svcmi	0x0046424c
8001207c:	44414144 	strbmi	r4, [r1], #-324	@ 0xfffffebc
80012080:	4f414943 	svcmi	0x00414943
80012084:	4241424d 	submi	r4, r1, #-805306364	@ 0xd0000004
80012088:	4f46424c 	svcmi	0x0046424c
8001208c:	43414241 	movtmi	r4, #4673	@ 0x1241
80012090:	4f444b41 	svcmi	0x00444b41
80012094:	41414144 	cmpmi	r1, r4, asr #2
80012098:	4f424b41 	svcmi	0x00424b41
8001209c:	41414742 	cmpmi	r1, r2, asr #14
800120a0:	4f4c4141 	svcmi	0x004c4141
800120a4:	43414141 	movtmi	r4, #4417	@ 0x1141
800120a8:	4f424b41 	svcmi	0x00424b41
800120ac:	44414245 	strbmi	r4, [r1], #-581	@ 0xfffffdbb
800120b0:	4f46424c 	svcmi	0x0046424c
800120b4:	44414143 	strbmi	r4, [r1], #-323	@ 0xfffffebd
800120b8:	4f414944 	svcmi	0x00414944
800120bc:	44414245 	strbmi	r4, [r1], #-581	@ 0xfffffdbb
800120c0:	4f46414c 	svcmi	0x0046414c
800120c4:	50414141 	subpl	r4, r1, r1, asr #2
800120c8:	4f444341 	svcmi	0x00444341
800120cc:	44414241 	strbmi	r4, [r1], #-577	@ 0xfffffdbf
800120d0:	4f46424c 	svcmi	0x0046424c
800120d4:	44414143 	strbmi	r4, [r1], #-323	@ 0xfffffebd
800120d8:	4f434944 	svcmi	0x00434944
800120dc:	44414241 	strbmi	r4, [r1], #-577	@ 0xfffffdbf
800120e0:	4f46414c 	svcmi	0x0046414c
800120e4:	44414241 	strbmi	r4, [r1], #-577	@ 0xfffffdbf
800120e8:	4f46424c 	svcmi	0x0046424c
800120ec:	43414445 	movtmi	r4, #5189	@ 0x1445
800120f0:	4f46424c 	svcmi	0x0046424c
800120f4:	44414144 	strbmi	r4, [r1], #-324	@ 0xfffffebc
800120f8:	4f414943 	svcmi	0x00414943
800120fc:	44414141 	strbmi	r4, [r1], #-321	@ 0xfffffebf
80012100:	4f464e44 	svcmi	0x00464e44
80012104:	41414141 	cmpmi	r1, r1, asr #2
80012108:	4f444644 	svcmi	0x00444644
8001210c:	50504743 	subspl	r4, r0, r3, asr #14
80012110:	424b5050 	submi	r5, fp, #80	@ 0x50
80012114:	44414245 	strbmi	r4, [r1], #-581	@ 0xfffffdbb
80012118:	4f46424c 	svcmi	0x0046424c
8001211c:	43414441 	movtmi	r4, #5185	@ 0x1441
80012120:	4f46424c 	svcmi	0x0046424c
80012124:	44414144 	strbmi	r4, [r1], #-324	@ 0xfffffebc
80012128:	4f414943 	svcmi	0x00414943
8001212c:	43414141 	movtmi	r4, #4417	@ 0x1141
80012130:	4f444b41 	svcmi	0x00444b41
80012134:	43414141 	movtmi	r4, #4417	@ 0x1141
80012138:	4f464d44 	svcmi	0x00464d44
8001213c:	44414245 	strbmi	r4, [r1], #-581	@ 0xfffffdbb
80012140:	4f46424c 	svcmi	0x0046424c
80012144:	41414144 	cmpmi	r1, r4, asr #2
80012148:	4f424b41 	svcmi	0x00424b41
8001214c:	4e41414d 	cdpmi	1, 4, cr4, cr1, cr13, {2}
80012150:	4f43454c 	svcmi	0x0043454c
80012154:	4b494141 	blmi	81262660 <irq_stack_start+0x1208650>
80012158:	4f494a4e 	svcmi	0x00494a4e
8001215c:	4145504d 	cmpmi	r5, sp, asr #32
80012160:	41414141 	cmpmi	r1, r1, asr #2
80012164:	41444d45 	cmpmi	r4, r5, asr #26
80012168:	41414141 	cmpmi	r1, r1, asr #2
8001216c:	4d41414e 	stclmi	1, cr4, [r1, #-312]	@ 0xfffffec8
80012170:	4f424b41 	svcmi	0x00424b41
80012174:	4e494141 	cdpmi	1, 4, cr4, cr9, cr1, {2}
80012178:	4f4a434e 	svcmi	0x004a434e
8001217c:	4c414145 	mcrrmi	1, 4, r4, r1, cr5
80012180:	4f43454d 	svcmi	0x0043454d
80012184:	4e414241 	cdpmi	2, 4, cr4, cr1, cr1, {2}
80012188:	4f43454e 	svcmi	0x0043454e
8001218c:	41414249 	cmpmi	r1, r9, asr #4
80012190:	4f46414c 	svcmi	0x0046414c
80012194:	4241424d 	submi	r4, r1, #-805306364	@ 0xd0000004
80012198:	4f46414c 	svcmi	0x0046414c
8001219c:	44414141 	strbmi	r4, [r1], #-321	@ 0xfffffebf
800121a0:	4f444b41 	svcmi	0x00444b41
800121a4:	44414241 	strbmi	r4, [r1], #-577	@ 0xfffffdbf
800121a8:	4f46414c 	svcmi	0x0046414c
800121ac:	44414141 	strbmi	r4, [r1], #-321	@ 0xfffffebf
800121b0:	4f444b41 	svcmi	0x00444b41
800121b4:	44414245 	strbmi	r4, [r1], #-581	@ 0xfffffdbb
800121b8:	4f46414c 	svcmi	0x0046414c
800121bc:	4141414e 	cmpmi	r1, lr, asr #2
800121c0:	4f4b4141 	svcmi	0x004b4141
800121c4:	44414245 	strbmi	r4, [r1], #-581	@ 0xfffffdbb
800121c8:	4f46424c 	svcmi	0x0046424c
800121cc:	4341424d 	movtmi	r4, #4685	@ 0x124d
800121d0:	4f46424c 	svcmi	0x0046424c
800121d4:	43414144 	movtmi	r4, #4420	@ 0x1144
800121d8:	4f414943 	svcmi	0x00414943
800121dc:	44414241 	strbmi	r4, [r1], #-577	@ 0xfffffdbf
800121e0:	4f46424c 	svcmi	0x0046424c
800121e4:	42414249 	submi	r4, r1, #-1879048188	@ 0x90000004
800121e8:	4f46424c 	svcmi	0x0046424c
800121ec:	44414144 	strbmi	r4, [r1], #-324	@ 0xfffffebc
800121f0:	4f414942 	svcmi	0x00414942
800121f4:	43414141 	movtmi	r4, #4417	@ 0x1141
800121f8:	4f464e43 	svcmi	0x00464e43
800121fc:	43414141 	movtmi	r4, #4417	@ 0x1141
80012200:	4f464d44 	svcmi	0x00464d44
80012204:	44414241 	strbmi	r4, [r1], #-577	@ 0xfffffdbf
80012208:	4f46424c 	svcmi	0x0046424c
8001220c:	44414142 	strbmi	r4, [r1], #-322	@ 0xfffffebe
80012210:	4f434944 	svcmi	0x00434944
80012214:	44414241 	strbmi	r4, [r1], #-577	@ 0xfffffdbf
80012218:	4f46414c 	svcmi	0x0046414c
8001221c:	44414245 	strbmi	r4, [r1], #-581	@ 0xfffffdbb
80012220:	4f46424c 	svcmi	0x0046424c
80012224:	44414142 	strbmi	r4, [r1], #-322	@ 0xfffffebe
80012228:	4f434944 	svcmi	0x00434944
8001222c:	44414245 	strbmi	r4, [r1], #-581	@ 0xfffffdbb
80012230:	4f46414c 	svcmi	0x0046414c
80012234:	44414245 	strbmi	r4, [r1], #-581	@ 0xfffffdbb
80012238:	4f46424c 	svcmi	0x0046424c
8001223c:	4341424d 	movtmi	r4, #4685	@ 0x124d
80012240:	4f46424c 	svcmi	0x0046424c
80012244:	44414144 	strbmi	r4, [r1], #-324	@ 0xfffffebc
80012248:	4f414943 	svcmi	0x00414943
8001224c:	44414141 	strbmi	r4, [r1], #-321	@ 0xfffffebf
80012250:	4f464e44 	svcmi	0x00464e44
80012254:	41414141 	cmpmi	r1, r1, asr #2
80012258:	4f444644 	svcmi	0x00444644
8001225c:	50504f4c 	subspl	r4, r0, ip, asr #30
80012260:	424b5050 	submi	r5, fp, #80	@ 0x50
80012264:	44414245 	strbmi	r4, [r1], #-581	@ 0xfffffdbb
80012268:	4f46424c 	svcmi	0x0046424c
8001226c:	41414144 	cmpmi	r1, r4, asr #2
80012270:	4f424b41 	svcmi	0x00424b41
80012274:	4e41414d 	cdpmi	1, 4, cr4, cr1, cr13, {2}
80012278:	4f43454c 	svcmi	0x0043454c
8001227c:	4b494141 	blmi	81262788 <irq_stack_start+0x1208778>
80012280:	4f494a4e 	svcmi	0x00494a4e
80012284:	4d41414e 	stclmi	1, cr4, [r1, #-312]	@ 0xfffffec8
80012288:	4f424b41 	svcmi	0x00424b41
8001228c:	4e494141 	cdpmi	1, 4, cr4, cr9, cr1, {2}
80012290:	4f4a434e 	svcmi	0x004a434e
80012294:	4c414145 	mcrrmi	1, 4, r4, r1, cr5
80012298:	4f43454d 	svcmi	0x0043454d
8001229c:	4e414241 	cdpmi	2, 4, cr4, cr1, cr1, {2}
800122a0:	4f43454e 	svcmi	0x0043454e
800122a4:	41414249 	cmpmi	r1, r9, asr #4
800122a8:	4f46414c 	svcmi	0x0046414c
800122ac:	4241424d 	submi	r4, r1, #-805306364	@ 0xd0000004
800122b0:	4f46414c 	svcmi	0x0046414c
800122b4:	44414141 	strbmi	r4, [r1], #-321	@ 0xfffffebf
800122b8:	4f444b41 	svcmi	0x00444b41
800122bc:	44414241 	strbmi	r4, [r1], #-577	@ 0xfffffdbf
800122c0:	4f46414c 	svcmi	0x0046414c
800122c4:	4441424d 	strbmi	r4, [r1], #-589	@ 0xfffffdb3
800122c8:	4f46424c 	svcmi	0x0046424c
800122cc:	41414141 	cmpmi	r1, r1, asr #2
800122d0:	4f444644 	svcmi	0x00444644
800122d4:	41414241 	cmpmi	r1, r1, asr #4
800122d8:	4b4b4141 	blmi	812e27e4 <irq_stack_start+0x12887d4>
800122dc:	44414249 	strbmi	r4, [r1], #-585	@ 0xfffffdb7
800122e0:	4f46424c 	svcmi	0x0046424c
800122e4:	4341434e 	movtmi	r4, #4942	@ 0x134e
800122e8:	4f444b41 	svcmi	0x00444b41
800122ec:	43414141 	movtmi	r4, #4417	@ 0x1141
800122f0:	4f464d44 	svcmi	0x00464d44
800122f4:	44414142 	strbmi	r4, [r1], #-322	@ 0xfffffebe
800122f8:	4f444b41 	svcmi	0x00444b41
800122fc:	44414241 	strbmi	r4, [r1], #-577	@ 0xfffffdbf
80012300:	4f46414c 	svcmi	0x0046414c
80012304:	44414249 	strbmi	r4, [r1], #-585	@ 0xfffffdb7
80012308:	4f46424c 	svcmi	0x0046424c
8001230c:	41414142 	cmpmi	r1, r2, asr #2
80012310:	4f434944 	svcmi	0x00434944
80012314:	4441424d 	strbmi	r4, [r1], #-589	@ 0xfffffdb3
80012318:	4f46424c 	svcmi	0x0046424c
8001231c:	44414141 	strbmi	r4, [r1], #-321	@ 0xfffffebf
80012320:	4f434744 	svcmi	0x00434744
80012324:	4341414b 	movtmi	r4, #4427	@ 0x114b
80012328:	4f444b41 	svcmi	0x00444b41
8001232c:	42414144 	submi	r4, r1, #68, 2
80012330:	4f424b41 	svcmi	0x00424b41
80012334:	4141414f 	cmpmi	r1, pc, asr #2
80012338:	4f4c4141 	svcmi	0x004c4141
8001233c:	43414141 	movtmi	r4, #4417	@ 0x1141
80012340:	4f424b41 	svcmi	0x00424b41
80012344:	44414241 	strbmi	r4, [r1], #-577	@ 0xfffffdbf
80012348:	4f46424c 	svcmi	0x0046424c
8001234c:	44414143 	strbmi	r4, [r1], #-323	@ 0xfffffebd
80012350:	4f414944 	svcmi	0x00414944
80012354:	44414241 	strbmi	r4, [r1], #-577	@ 0xfffffdbf
80012358:	4f46414c 	svcmi	0x0046414c
8001235c:	41414146 	cmpmi	r1, r6, asr #2
80012360:	4f4b4141 	svcmi	0x004b4141
80012364:	4441424d 	strbmi	r4, [r1], #-589	@ 0xfffffdb3
80012368:	4f46424c 	svcmi	0x0046424c
8001236c:	4341414b 	movtmi	r4, #4427	@ 0x114b
80012370:	4f444b41 	svcmi	0x00444b41
80012374:	42414144 	submi	r4, r1, #68, 2
80012378:	4f424b41 	svcmi	0x00424b41
8001237c:	41414249 	cmpmi	r1, r9, asr #4
80012380:	4f46424c 	svcmi	0x0046424c
80012384:	41414145 	cmpmi	r1, r5, asr #2
80012388:	4f4c4141 	svcmi	0x004c4141
8001238c:	41414241 	cmpmi	r1, r1, asr #4
80012390:	4f46414c 	svcmi	0x0046414c
80012394:	44414241 	strbmi	r4, [r1], #-577	@ 0xfffffdbf
80012398:	4f46424c 	svcmi	0x0046424c
8001239c:	41414144 	cmpmi	r1, r4, asr #2
800123a0:	4f424b41 	svcmi	0x00424b41
800123a4:	4e41414d 	cdpmi	1, 4, cr4, cr1, cr13, {2}
800123a8:	4f43454c 	svcmi	0x0043454c
800123ac:	4b494141 	blmi	812628b8 <irq_stack_start+0x12088a8>
800123b0:	4f494a4e 	svcmi	0x00494a4e
800123b4:	4d41414e 	stclmi	1, cr4, [r1, #-312]	@ 0xfffffec8
800123b8:	4f424b41 	svcmi	0x00424b41
800123bc:	4e494141 	cdpmi	1, 4, cr4, cr9, cr1, {2}
800123c0:	4f4a434e 	svcmi	0x004a434e
800123c4:	4c414145 	mcrrmi	1, 4, r4, r1, cr5
800123c8:	4f43454d 	svcmi	0x0043454d
800123cc:	4e414341 	cdpmi	3, 4, cr4, cr1, cr1, {2}
800123d0:	4f43454e 	svcmi	0x0043454e
800123d4:	41414341 	cmpmi	r1, r1, asr #6
800123d8:	4f46414c 	svcmi	0x0046414c
800123dc:	42414345 	submi	r4, r1, #335544321	@ 0x14000001
800123e0:	4f46414c 	svcmi	0x0046414c
800123e4:	43414349 	movtmi	r4, #4937	@ 0x1349
800123e8:	4f46414c 	svcmi	0x0046414c
800123ec:	44414141 	strbmi	r4, [r1], #-321	@ 0xfffffebf
800123f0:	4f444b41 	svcmi	0x00444b41
800123f4:	44414241 	strbmi	r4, [r1], #-577	@ 0xfffffdbf
800123f8:	4f46414c 	svcmi	0x0046414c
800123fc:	44414141 	strbmi	r4, [r1], #-321	@ 0xfffffebf
80012400:	4f444b41 	svcmi	0x00444b41
80012404:	44414249 	strbmi	r4, [r1], #-585	@ 0xfffffdb7
80012408:	4f46414c 	svcmi	0x0046414c
8001240c:	44414141 	strbmi	r4, [r1], #-321	@ 0xfffffebf
80012410:	4f444b41 	svcmi	0x00444b41
80012414:	44414245 	strbmi	r4, [r1], #-581	@ 0xfffffdbb
80012418:	4f46414c 	svcmi	0x0046414c
8001241c:	44414249 	strbmi	r4, [r1], #-585	@ 0xfffffdb7
80012420:	4f43454c 	svcmi	0x0043454c
80012424:	43414144 	movtmi	r4, #4420	@ 0x1144
80012428:	4f424b41 	svcmi	0x00424b41
8001242c:	42414349 	submi	r4, r1, #603979777	@ 0x24000001
80012430:	4f46424c 	svcmi	0x0046424c
80012434:	41414345 	cmpmi	r1, r5, asr #6
80012438:	4f46424c 	svcmi	0x0046424c
8001243c:	41414249 	cmpmi	r1, r9, asr #4
80012440:	4f4c4141 	svcmi	0x004c4141
80012444:	41414245 	cmpmi	r1, r5, asr #4
80012448:	4f46414c 	svcmi	0x0046414c
8001244c:	44414245 	strbmi	r4, [r1], #-581	@ 0xfffffdbb
80012450:	4f46424c 	svcmi	0x0046424c
80012454:	41414141 	cmpmi	r1, r1, asr #2
80012458:	4f444644 	svcmi	0x00444644
8001245c:	41414145 	cmpmi	r1, r5, asr #2
80012460:	414b4141 	cmpmi	fp, r1, asr #2
80012464:	43414349 	movtmi	r4, #4937	@ 0x1349
80012468:	4f46424c 	svcmi	0x0046424c
8001246c:	42414245 	submi	r4, r1, #1342177284	@ 0x50000004
80012470:	4f46424c 	svcmi	0x0046424c
80012474:	41414341 	cmpmi	r1, r1, asr #6
80012478:	4f46424c 	svcmi	0x0046424c
8001247c:	50504f46 	subspl	r4, r0, r6, asr #30
80012480:	4f4c5050 	svcmi	0x004c5050
80012484:	41414241 	cmpmi	r1, r1, asr #4
80012488:	4f46414c 	svcmi	0x0046414c
8001248c:	43414249 	movtmi	r4, #4681	@ 0x1249
80012490:	4f46424c 	svcmi	0x0046424c
80012494:	44414241 	strbmi	r4, [r1], #-577	@ 0xfffffdbf
80012498:	4f46424c 	svcmi	0x0046424c
8001249c:	42414341 	submi	r4, r1, #67108865	@ 0x4000001
800124a0:	4f46424c 	svcmi	0x0046424c
800124a4:	44414144 	strbmi	r4, [r1], #-324	@ 0xfffffebc
800124a8:	4f414942 	svcmi	0x00414942
800124ac:	42414345 	submi	r4, r1, #335544321	@ 0x14000001
800124b0:	4f464a50 	svcmi	0x00464a50
800124b4:	42414142 	submi	r4, r1, #-2147483632	@ 0x80000010
800124b8:	4f414950 	svcmi	0x00414950
800124bc:	43414143 	movtmi	r4, #4419	@ 0x1143
800124c0:	4f484e42 	svcmi	0x00484e42
800124c4:	43414141 	movtmi	r4, #4417	@ 0x1141
800124c8:	4f464d44 	svcmi	0x00464d44
800124cc:	44414241 	strbmi	r4, [r1], #-577	@ 0xfffffdbf
800124d0:	4f46424c 	svcmi	0x0046424c
800124d4:	44414142 	strbmi	r4, [r1], #-322	@ 0xfffffebe
800124d8:	4f434944 	svcmi	0x00434944
800124dc:	44414241 	strbmi	r4, [r1], #-577	@ 0xfffffdbf
800124e0:	4f46414c 	svcmi	0x0046414c
800124e4:	44414241 	strbmi	r4, [r1], #-577	@ 0xfffffdbf
800124e8:	4f46424c 	svcmi	0x0046424c
800124ec:	41414144 	cmpmi	r1, r4, asr #2
800124f0:	4f424b41 	svcmi	0x00424b41
800124f4:	4e41414d 	cdpmi	1, 4, cr4, cr1, cr13, {2}
800124f8:	4f43454c 	svcmi	0x0043454c
800124fc:	4b494141 	blmi	81262a08 <irq_stack_start+0x12089f8>
80012500:	4f494a4e 	svcmi	0x00494a4e
80012504:	41424e4d 	cmpmi	r2, sp, asr #28
80012508:	41414141 	cmpmi	r1, r1, asr #2
8001250c:	4d41414e 	stclmi	1, cr4, [r1, #-312]	@ 0xfffffec8
80012510:	4f424b41 	svcmi	0x00424b41
80012514:	4e494141 	cdpmi	1, 4, cr4, cr9, cr1, {2}
80012518:	4f4a434e 	svcmi	0x004a434e
8001251c:	4c414145 	mcrrmi	1, 4, r4, r1, cr5
80012520:	4f43454d 	svcmi	0x0043454d
80012524:	4e414341 	cdpmi	3, 4, cr4, cr1, cr1, {2}
80012528:	4f43454e 	svcmi	0x0043454e
8001252c:	41414341 	cmpmi	r1, r1, asr #6
80012530:	4f46414c 	svcmi	0x0046414c
80012534:	42414345 	submi	r4, r1, #335544321	@ 0x14000001
80012538:	4f46414c 	svcmi	0x0046414c
8001253c:	43414349 	movtmi	r4, #4937	@ 0x1349
80012540:	4f46414c 	svcmi	0x0046414c
80012544:	44414141 	strbmi	r4, [r1], #-321	@ 0xfffffebf
80012548:	4f444b41 	svcmi	0x00444b41
8001254c:	44414241 	strbmi	r4, [r1], #-577	@ 0xfffffdbf
80012550:	4f46414c 	svcmi	0x0046414c
80012554:	44414141 	strbmi	r4, [r1], #-321	@ 0xfffffebf
80012558:	4f444b41 	svcmi	0x00444b41
8001255c:	44414245 	strbmi	r4, [r1], #-581	@ 0xfffffdbb
80012560:	4f46414c 	svcmi	0x0046414c
80012564:	44414141 	strbmi	r4, [r1], #-321	@ 0xfffffebf
80012568:	4f444b41 	svcmi	0x00444b41
8001256c:	44414249 	strbmi	r4, [r1], #-585	@ 0xfffffdb7
80012570:	4f46414c 	svcmi	0x0046414c
80012574:	44414250 	strbmi	r4, [r1], #-592	@ 0xfffffdb0
80012578:	4f444b41 	svcmi	0x00444b41
8001257c:	44414241 	strbmi	r4, [r1], #-577	@ 0xfffffdbf
80012580:	4f46414c 	svcmi	0x0046414c
80012584:	41414250 	cmpmi	r1, r0, asr r2
80012588:	4f4b4141 	svcmi	0x004b4141
8001258c:	43414142 	movtmi	r4, #4418	@ 0x1142
80012590:	4f444b41 	svcmi	0x00444b41
80012594:	44414241 	strbmi	r4, [r1], #-577	@ 0xfffffdbf
80012598:	4f46424c 	svcmi	0x0046424c
8001259c:	43444243 	movtmi	r4, #16963	@ 0x4243
800125a0:	4f424b41 	svcmi	0x00424b41
800125a4:	44414341 	strbmi	r4, [r1], #-833	@ 0xfffffcbf
800125a8:	4f46424c 	svcmi	0x0046424c
800125ac:	44414143 	strbmi	r4, [r1], #-323	@ 0xfffffebd
800125b0:	4f414144 	svcmi	0x00414144
800125b4:	41414141 	cmpmi	r1, r1, asr #2
800125b8:	4f444644 	svcmi	0x00444644
800125bc:	44414142 	strbmi	r4, [r1], #-322	@ 0xfffffebe
800125c0:	42444b41 	submi	r4, r4, #66560	@ 0x10400
800125c4:	44414141 	strbmi	r4, [r1], #-321	@ 0xfffffebf
800125c8:	41444b41 	cmpmi	r4, r1, asr #22
800125cc:	44414844 	strbmi	r4, [r1], #-2116	@ 0xfffff7bc
800125d0:	4f474f50 	svcmi	0x00474f50
800125d4:	4441424d 	strbmi	r4, [r1], #-589	@ 0xfffffdb3
800125d8:	4f46414c 	svcmi	0x0046414c
800125dc:	44414249 	strbmi	r4, [r1], #-585	@ 0xfffffdb7
800125e0:	4f46424c 	svcmi	0x0046424c
800125e4:	44414944 	strbmi	r4, [r1], #-2372	@ 0xfffff6bc
800125e8:	4f424b41 	svcmi	0x00424b41
800125ec:	4341424d 	movtmi	r4, #4685	@ 0x124d
800125f0:	4f46424c 	svcmi	0x0046424c
800125f4:	44414144 	strbmi	r4, [r1], #-324	@ 0xfffffebc
800125f8:	4f424943 	svcmi	0x00424943
800125fc:	44414249 	strbmi	r4, [r1], #-585	@ 0xfffffdb7
80012600:	4f46414c 	svcmi	0x0046414c
80012604:	43414249 	movtmi	r4, #4681	@ 0x1249
80012608:	4f46424c 	svcmi	0x0046424c
8001260c:	44414345 	strbmi	r4, [r1], #-837	@ 0xfffffcbb
80012610:	4f46424c 	svcmi	0x0046424c
80012614:	41414144 	cmpmi	r1, r4, asr #2
80012618:	4f424643 	svcmi	0x00424643
8001261c:	4141414a 	cmpmi	r1, sl, asr #2
80012620:	444b4141 	strbmi	r4, [fp], #-321	@ 0xfffffebf
80012624:	43414249 	movtmi	r4, #4681	@ 0x1249
80012628:	4f46424c 	svcmi	0x0046424c
8001262c:	44414345 	strbmi	r4, [r1], #-837	@ 0xfffffcbb
80012630:	4f46424c 	svcmi	0x0046424c
80012634:	44414144 	strbmi	r4, [r1], #-324	@ 0xfffffebc
80012638:	4f414543 	svcmi	0x00414543
8001263c:	44414249 	strbmi	r4, [r1], #-585	@ 0xfffffdb7
80012640:	4f46414c 	svcmi	0x0046414c
80012644:	43414142 	movtmi	r4, #4418	@ 0x1142
80012648:	4f444b41 	svcmi	0x00444b41
8001264c:	44414241 	strbmi	r4, [r1], #-577	@ 0xfffffdbf
80012650:	4f46424c 	svcmi	0x0046424c
80012654:	44444243 	strbmi	r4, [r4], #-579	@ 0xfffffdbd
80012658:	4f424b41 	svcmi	0x00424b41
8001265c:	43414245 	movtmi	r4, #4677	@ 0x1245
80012660:	4f46424c 	svcmi	0x0046424c
80012664:	44414144 	strbmi	r4, [r1], #-324	@ 0xfffffebc
80012668:	4f424943 	svcmi	0x00424943
8001266c:	44414245 	strbmi	r4, [r1], #-581	@ 0xfffffdbb
80012670:	4f46414c 	svcmi	0x0046414c
80012674:	44414241 	strbmi	r4, [r1], #-577	@ 0xfffffdbf
80012678:	4f46424c 	svcmi	0x0046424c
8001267c:	44414142 	strbmi	r4, [r1], #-322	@ 0xfffffebe
80012680:	4f434544 	svcmi	0x00434544
80012684:	44414241 	strbmi	r4, [r1], #-577	@ 0xfffffdbf
80012688:	4f46414c 	svcmi	0x0046414c
8001268c:	44414241 	strbmi	r4, [r1], #-577	@ 0xfffffdbf
80012690:	4f46424c 	svcmi	0x0046424c
80012694:	41414141 	cmpmi	r1, r1, asr #2
80012698:	4f444644 	svcmi	0x00444644
8001269c:	50504e4d 	subspl	r4, r0, sp, asr #28
800126a0:	4b4b5050 	blmi	812e67e8 <irq_stack_start+0x128c7d8>
800126a4:	44414349 	strbmi	r4, [r1], #-841	@ 0xfffffcb7
800126a8:	4f46424c 	svcmi	0x0046424c
800126ac:	41414141 	cmpmi	r1, r1, asr #2
800126b0:	4f444644 	svcmi	0x00444644
800126b4:	41414143 	cmpmi	r1, r3, asr #2
800126b8:	414b4141 	cmpmi	fp, r1, asr #2
800126bc:	44414349 	strbmi	r4, [r1], #-841	@ 0xfffffcb7
800126c0:	4f46424c 	svcmi	0x0046424c
800126c4:	43414249 	movtmi	r4, #4681	@ 0x1249
800126c8:	4f46424c 	svcmi	0x0046424c
800126cc:	43414141 	movtmi	r4, #4417	@ 0x1141
800126d0:	4f464944 	svcmi	0x00464944
800126d4:	44414245 	strbmi	r4, [r1], #-581	@ 0xfffffdbb
800126d8:	4f46424c 	svcmi	0x0046424c
800126dc:	41414144 	cmpmi	r1, r4, asr #2
800126e0:	4f424b41 	svcmi	0x00424b41
800126e4:	4e41414d 	cdpmi	1, 4, cr4, cr1, cr13, {2}
800126e8:	4f43454c 	svcmi	0x0043454c
800126ec:	4b494141 	blmi	81262bf8 <irq_stack_start+0x1208be8>
800126f0:	4f494a4e 	svcmi	0x00494a4e
800126f4:	47504848 	ldrbmi	r4, [r0, -r8, asr #16]
800126f8:	474d4843 	strbmi	r4, [sp, -r3, asr #16]
800126fc:	41414745 	cmpmi	r1, r5, asr #14
80012700:	41414141 	cmpmi	r1, r1, asr #2
80012704:	47464749 	strbmi	r4, [r6, -r9, asr #14]
80012708:	474d474d 	strbmi	r4, [sp, -sp, asr #14]
8001270c:	41414750 	cmpmi	r1, r0, asr r7
80012710:	41414141 	cmpmi	r1, r1, asr #2
80012714:	48444346 	stmdami	r4, {r1, r2, r6, r8, r9, lr}^
80012718:	43464341 	movtmi	r4, #25409	@ 0x6341
8001271c:	43414844 	movtmi	r4, #6212	@ 0x1844
80012720:	47454346 	strbmi	r4, [r5, -r6, asr #6]
80012724:	4141414b 	cmpmi	r1, fp, asr #2
80012728:	41414141 	cmpmi	r1, r1, asr #2
8001272c:	474d4641 	strbmi	r4, [sp, -r1, asr #12]
80012730:	47424746 	strbmi	r4, [r2, -r6, asr #14]
80012734:	47464844 	strbmi	r4, [r6, -r4, asr #16]
80012738:	47464341 	strbmi	r4, [r6, -r1, asr #6]
8001273c:	4845474f 	stmdami	r5, {r0, r1, r2, r3, r6, r8, r9, sl, lr}^
80012740:	48434746 	stmdami	r3, {r1, r2, r6, r8, r9, sl, lr}^
80012744:	47424341 	strbmi	r4, [r2, -r1, asr #6]
80012748:	48444341 	stmdami	r4, {r0, r6, r8, r9, lr}^
8001274c:	48434845 	stmdami	r3, {r0, r2, r6, fp, lr}^
80012750:	474f474a 	strbmi	r4, [pc, -sl, asr #14]
80012754:	444b4748 	strbmi	r4, [fp], #-1864	@ 0xfffff8b8
80012758:	41414341 	cmpmi	r1, r1, asr #6
8001275c:	48444346 	stmdami	r4, {r1, r2, r6, r8, r9, lr}^
80012760:	4141414b 	cmpmi	r1, fp, asr #2
80012764:	42414142 	submi	r4, r1, #-2147483632	@ 0x80000010
80012768:	464c424c 	strbmi	r4, [ip], -ip, asr #4
8001276c:	41414542 	cmpmi	r1, r2, asr #10
80012770:	41414141 	cmpmi	r1, r1, asr #2
80012774:	42414143 	submi	r4, r1, #-1073741808	@ 0xc0000010
80012778:	464c424c 	strbmi	r4, [ip], -ip, asr #4
8001277c:	41414543 	cmpmi	r1, r3, asr #10
80012780:	41414141 	cmpmi	r1, r1, asr #2
80012784:	42414144 	submi	r4, r1, #68, 2
80012788:	464c424c 	strbmi	r4, [ip], -ip, asr #4
8001278c:	41414544 	cmpmi	r1, r4, asr #10
80012790:	41414141 	cmpmi	r1, r1, asr #2
80012794:	42414145 	submi	r4, r1, #1073741841	@ 0x40000011
80012798:	464c424c 	strbmi	r4, [ip], -ip, asr #4
8001279c:	41414545 	cmpmi	r1, r5, asr #10
800127a0:	41414141 	cmpmi	r1, r1, asr #2
800127a4:	42414146 	submi	r4, r1, #-2147483631	@ 0x80000011
800127a8:	41414850 	cmpmi	r1, r0, asr r8
800127ac:	41414141 	cmpmi	r1, r1, asr #2
800127b0:	41414141 	cmpmi	r1, r1, asr #2
800127b4:	42414146 	submi	r4, r1, #-2147483631	@ 0x80000011
800127b8:	41414149 	cmpmi	r1, r9, asr #2
800127bc:	41414141 	cmpmi	r1, r1, asr #2
800127c0:	41414141 	cmpmi	r1, r1, asr #2
800127c4:	48494441 	stmdami	r9, {r0, r6, sl, lr}^
800127c8:	41414141 	cmpmi	r1, r1, asr #2
800127cc:	41414541 	cmpmi	r1, r1, asr #10
800127d0:	41414141 	cmpmi	r1, r1, asr #2
800127d4:	41414845 	cmpmi	r1, r5, asr #16
800127d8:	41414141 	cmpmi	r1, r1, asr #2
800127dc:	4142474d 	cmpmi	r2, sp, asr #14
800127e0:	41414141 	cmpmi	r1, r1, asr #2
800127e4:	4142474d 	cmpmi	r2, sp, asr #14
800127e8:	41414141 	cmpmi	r1, r1, asr #2
800127ec:	4142474d 	cmpmi	r2, sp, asr #14
800127f0:	41414141 	cmpmi	r1, r1, asr #2
800127f4:	4142474d 	cmpmi	r2, sp, asr #14
800127f8:	41414141 	cmpmi	r1, r1, asr #2
800127fc:	4142474d 	cmpmi	r2, sp, asr #14
80012800:	41414141 	cmpmi	r1, r1, asr #2
80012804:	4142474d 	cmpmi	r2, sp, asr #14
80012808:	41414141 	cmpmi	r1, r1, asr #2
8001280c:	4142474d 	cmpmi	r2, sp, asr #14
80012810:	41414141 	cmpmi	r1, r1, asr #2
80012814:	4142474d 	cmpmi	r2, sp, asr #14
80012818:	41414141 	cmpmi	r1, r1, asr #2
8001281c:	4142474d 	cmpmi	r2, sp, asr #14
80012820:	41414141 	cmpmi	r1, r1, asr #2
80012824:	4142474d 	cmpmi	r2, sp, asr #14
80012828:	41414141 	cmpmi	r1, r1, asr #2
8001282c:	4142474d 	cmpmi	r2, sp, asr #14
80012830:	41414141 	cmpmi	r1, r1, asr #2
80012834:	4142474d 	cmpmi	r2, sp, asr #14
80012838:	41414141 	cmpmi	r1, r1, asr #2
8001283c:	4142474d 	cmpmi	r2, sp, asr #14
80012840:	41414141 	cmpmi	r1, r1, asr #2
80012844:	4142474d 	cmpmi	r2, sp, asr #14
80012848:	41414141 	cmpmi	r1, r1, asr #2
8001284c:	41414141 	cmpmi	r1, r1, asr #2
80012850:	41414141 	cmpmi	r1, r1, asr #2
80012854:	4142474d 	cmpmi	r2, sp, asr #14
80012858:	41414141 	cmpmi	r1, r1, asr #2
8001285c:	41414c45 	cmpmi	r1, r5, asr #24
80012860:	41414141 	cmpmi	r1, r1, asr #2
80012864:	4142474d 	cmpmi	r2, sp, asr #14
80012868:	41414141 	cmpmi	r1, r1, asr #2
8001286c:	4142474d 	cmpmi	r2, sp, asr #14
80012870:	41414141 	cmpmi	r1, r1, asr #2
80012874:	41415049 	cmpmi	r1, r9, asr #32
80012878:	41414141 	cmpmi	r1, r1, asr #2
8001287c:	44424441 	strbmi	r4, [r2], #-1089	@ 0xfffffbbf
80012880:	44444443 	strbmi	r4, [r4], #-1091	@ 0xfffffbbd
80012884:	44464445 	strbmi	r4, [r6], #-1093	@ 0xfffffbbb
80012888:	44484447 	strbmi	r4, [r8], #-1095	@ 0xfffffbb9
8001288c:	444a4449 	strbmi	r4, [sl], #-1097	@ 0xfffffbb7
80012890:	47434742 	strbmi	r4, [r3, -r2, asr #14]
80012894:	47454744 	strbmi	r4, [r5, -r4, asr #14]
80012898:	47474746 	strbmi	r4, [r7, -r6, asr #14]
8001289c:	41414141 	cmpmi	r1, r1, asr #2
800128a0:	41414141 	cmpmi	r1, r1, asr #2
800128a4:	41414141 	cmpmi	r1, r1, asr #2
800128a8:	41414141 	cmpmi	r1, r1, asr #2
800128ac:	41414141 	cmpmi	r1, r1, asr #2
800128b0:	41414141 	cmpmi	r1, r1, asr #2
800128b4:	41414141 	cmpmi	r1, r1, asr #2
800128b8:	41414141 	cmpmi	r1, r1, asr #2
800128bc:	41434945 	cmpmi	r3, r5, asr #18
800128c0:	41414141 	cmpmi	r1, r1, asr #2
800128c4:	41434c41 	cmpmi	r3, r1, asr #24
800128c8:	41414141 	cmpmi	r1, r1, asr #2
800128cc:	45444548 	strbmi	r4, [r4, #-1352]	@ 0xfffffab8
800128d0:	444b4544 	strbmi	r4, [fp], #-1348	@ 0xfffffabc
800128d4:	43494341 	movtmi	r4, #37697	@ 0x9341
800128d8:	48434542 	stmdami	r3, {r1, r6, r8, sl, lr}^
800128dc:	47494744 	strbmi	r4, [r9, -r4, asr #14]
800128e0:	46434341 	strbmi	r4, [r3], -r1, asr #6
800128e4:	48414746 	stmdami	r1, {r1, r2, r6, r8, r9, sl, lr}^
800128e8:	48444750 	stmdami	r4, {r4, r6, r8, r9, sl, lr}^
800128ec:	4845474a 	stmdami	r5, {r1, r3, r6, r8, r9, sl, lr}^
800128f0:	48434750 	stmdami	r3, {r4, r6, r8, r9, sl, lr}^
800128f4:	434a484a 	movtmi	r4, #43082	@ 0xa84a
800128f8:	44424341 	strbmi	r4, [r2], #-833	@ 0xfffffcbf
800128fc:	434f4445 	movtmi	r4, #62533	@ 0xf445
80012900:	434f4443 	movtmi	r4, #62531	@ 0xf443
80012904:	41414441 	cmpmi	r1, r1, asr #8
80012908:	434f4542 	movtmi	r4, #62786	@ 0xf542
8001290c:	41414141 	cmpmi	r1, r1, asr #2
80012910:	47424141 	strbmi	r4, [r2, -r1, asr #2]
80012914:	47424746 	strbmi	r4, [r2, -r6, asr #14]
80012918:	474a4743 	strbmi	r4, [sl, -r3, asr #14]
8001291c:	41424141 	cmpmi	r2, r1, asr #2
80012920:	41414345 	cmpmi	r1, r5, asr #6
80012924:	41414141 	cmpmi	r1, r1, asr #2
80012928:	44474146 	strbmi	r4, [r7], #-326	@ 0xfffffeba
8001292c:	464b454c 	strbmi	r4, [fp], -ip, asr #10
80012930:	41474141 	cmpmi	r7, r1, asr #2
80012934:	41494148 	cmpmi	r9, r8, asr #2
80012938:	414a4142 	cmpmi	sl, r2, asr #2
8001293c:	42434142 	submi	r4, r3, #-2147483632	@ 0x80000010
80012940:	42454145 	submi	r4, r5, #1073741841	@ 0x40000011
80012944:	42464142 	submi	r4, r6, #-2147483632	@ 0x80000010
80012948:	42484142 	submi	r4, r8, #-2147483632	@ 0x80000010
8001294c:	42494144 	submi	r4, r9, #68, 2
80012950:	424a4142 	submi	r4, sl, #-2147483632	@ 0x80000010
80012954:	424b4142 	submi	r4, fp, #-2147483632	@ 0x80000010
80012958:	424f4142 	submi	r4, pc, #-2147483632	@ 0x80000010
8001295c:	43434147 	movtmi	r4, #12615	@ 0x3147
80012960:	45454142 	strbmi	r4, [r5, #-322]	@ 0xfffffebe
80012964:	41414142 	cmpmi	r1, r2, asr #2
80012968:	41414141 	cmpmi	r1, r1, asr #2
8001296c:	41414141 	cmpmi	r1, r1, asr #2
80012970:	41414141 	cmpmi	r1, r1, asr #2
80012974:	41414141 	cmpmi	r1, r1, asr #2
80012978:	41414141 	cmpmi	r1, r1, asr #2
8001297c:	41414141 	cmpmi	r1, r1, asr #2
80012980:	41414141 	cmpmi	r1, r1, asr #2
80012984:	41414141 	cmpmi	r1, r1, asr #2
80012988:	41414141 	cmpmi	r1, r1, asr #2
8001298c:	41414141 	cmpmi	r1, r1, asr #2
80012990:	41414141 	cmpmi	r1, r1, asr #2
80012994:	41424141 	cmpmi	r2, r1, asr #2
80012998:	41414141 	cmpmi	r1, r1, asr #2
8001299c:	41414141 	cmpmi	r1, r1, asr #2
800129a0:	41414141 	cmpmi	r1, r1, asr #2
800129a4:	41414144 	cmpmi	r1, r4, asr #2
800129a8:	41414142 	cmpmi	r1, r2, asr #2
800129ac:	41414141 	cmpmi	r1, r1, asr #2
800129b0:	41414141 	cmpmi	r1, r1, asr #2
800129b4:	414c4445 	cmpmi	ip, r5, asr #8
800129b8:	41414141 	cmpmi	r1, r1, asr #2
800129bc:	41414141 	cmpmi	r1, r1, asr #2
800129c0:	41414141 	cmpmi	r1, r1, asr #2
800129c4:	41414144 	cmpmi	r1, r4, asr #2
800129c8:	41414143 	cmpmi	r1, r3, asr #2
800129cc:	41414141 	cmpmi	r1, r1, asr #2
800129d0:	41414141 	cmpmi	r1, r1, asr #2
800129d4:	424d414d 	submi	r4, sp, #1073741843	@ 0x40000013
800129d8:	41414141 	cmpmi	r1, r1, asr #2
800129dc:	41414141 	cmpmi	r1, r1, asr #2
800129e0:	41414141 	cmpmi	r1, r1, asr #2
800129e4:	41414144 	cmpmi	r1, r4, asr #2
800129e8:	41414144 	cmpmi	r1, r4, asr #2
800129ec:	41414141 	cmpmi	r1, r1, asr #2
800129f0:	41414141 	cmpmi	r1, r1, asr #2
800129f4:	424d4341 	submi	r4, sp, #67108865	@ 0x4000001
800129f8:	41414141 	cmpmi	r1, r1, asr #2
800129fc:	41414141 	cmpmi	r1, r1, asr #2
80012a00:	41414141 	cmpmi	r1, r1, asr #2
80012a04:	41414144 	cmpmi	r1, r4, asr #2
80012a08:	41414145 	cmpmi	r1, r5, asr #2
80012a0c:	41414141 	cmpmi	r1, r1, asr #2
80012a10:	41414141 	cmpmi	r1, r1, asr #2
80012a14:	424d4341 	submi	r4, sp, #67108865	@ 0x4000001
80012a18:	41414141 	cmpmi	r1, r1, asr #2
80012a1c:	41414141 	cmpmi	r1, r1, asr #2
80012a20:	41414141 	cmpmi	r1, r1, asr #2
80012a24:	41414144 	cmpmi	r1, r4, asr #2
80012a28:	41414146 	cmpmi	r1, r6, asr #2
80012a2c:	41414141 	cmpmi	r1, r1, asr #2
80012a30:	41414141 	cmpmi	r1, r1, asr #2
80012a34:	41414141 	cmpmi	r1, r1, asr #2
80012a38:	41414141 	cmpmi	r1, r1, asr #2
80012a3c:	41414141 	cmpmi	r1, r1, asr #2
80012a40:	41414141 	cmpmi	r1, r1, asr #2
80012a44:	41414144 	cmpmi	r1, r4, asr #2
80012a48:	41414147 	cmpmi	r1, r7, asr #2
80012a4c:	41414141 	cmpmi	r1, r1, asr #2
80012a50:	41414141 	cmpmi	r1, r1, asr #2
80012a54:	41414141 	cmpmi	r1, r1, asr #2
80012a58:	41414141 	cmpmi	r1, r1, asr #2
80012a5c:	41414141 	cmpmi	r1, r1, asr #2
80012a60:	41414141 	cmpmi	r1, r1, asr #2
80012a64:	41414144 	cmpmi	r1, r4, asr #2
80012a68:	41414148 	cmpmi	r1, r8, asr #2
80012a6c:	41414142 	cmpmi	r1, r2, asr #2
80012a70:	41414141 	cmpmi	r1, r1, asr #2
80012a74:	41414141 	cmpmi	r1, r1, asr #2
80012a78:	41414141 	cmpmi	r1, r1, asr #2
80012a7c:	41414141 	cmpmi	r1, r1, asr #2
80012a80:	41414141 	cmpmi	r1, r1, asr #2
80012a84:	41414145 	cmpmi	r1, r5, asr #2
80012a88:	50505042 	subspl	r5, r0, r2, asr #32
80012a8c:	4141414a 	cmpmi	r1, sl, asr #2
80012a90:	41414141 	cmpmi	r1, r1, asr #2
80012a94:	414c4445 	cmpmi	ip, r5, asr #8
80012a98:	41414141 	cmpmi	r1, r1, asr #2
80012a9c:	41414141 	cmpmi	r1, r1, asr #2
80012aa0:	41414141 	cmpmi	r1, r1, asr #2
80012aa4:	41414141 	cmpmi	r1, r1, asr #2
80012aa8:	41414143 	cmpmi	r1, r3, asr #2
80012aac:	4141414d 	cmpmi	r1, sp, asr #2
80012ab0:	41414141 	cmpmi	r1, r1, asr #2
80012ab4:	41424141 	cmpmi	r2, r1, asr #2
80012ab8:	41414141 	cmpmi	r1, r1, asr #2
80012abc:	41414141 	cmpmi	r1, r1, asr #2
80012ac0:	41414141 	cmpmi	r1, r1, asr #2
80012ac4:	41414141 	cmpmi	r1, r1, asr #2
80012ac8:	41414142 	cmpmi	r1, r2, asr #2
80012acc:	4141414a 	cmpmi	r1, sl, asr #2
80012ad0:	41414141 	cmpmi	r1, r1, asr #2
80012ad4:	41424c41 	cmpmi	r2, r1, asr #24
80012ad8:	41414141 	cmpmi	r1, r1, asr #2
80012adc:	41414141 	cmpmi	r1, r1, asr #2
80012ae0:	41414141 	cmpmi	r1, r1, asr #2
80012ae4:	41414141 	cmpmi	r1, r1, asr #2
80012ae8:	41414142 	cmpmi	r1, r2, asr #2
80012aec:	41414150 	cmpmi	r1, r0, asr r1
80012af0:	41414141 	cmpmi	r1, r1, asr #2
80012af4:	41414141 	cmpmi	r1, r1, asr #2
80012af8:	41414141 	cmpmi	r1, r1, asr #2
80012afc:	41414141 	cmpmi	r1, r1, asr #2
80012b00:	41414141 	cmpmi	r1, r1, asr #2
80012b04:	41414145 	cmpmi	r1, r5, asr #2
80012b08:	50505042 	subspl	r5, r0, r2, asr #32
80012b0c:	4141414d 	cmpmi	r1, sp, asr #2
80012b10:	41414141 	cmpmi	r1, r1, asr #2
80012b14:	41424e41 	cmpmi	r2, r1, asr #28
80012b18:	41414141 	cmpmi	r1, r1, asr #2
80012b1c:	41414141 	cmpmi	r1, r1, asr #2
80012b20:	41414141 	cmpmi	r1, r1, asr #2
80012b24:	41414141 	cmpmi	r1, r1, asr #2
80012b28:	41414142 	cmpmi	r1, r2, asr #2
80012b2c:	4141424a 	cmpmi	r1, sl, asr #4
80012b30:	41414141 	cmpmi	r1, r1, asr #2
80012b34:	41414141 	cmpmi	r1, r1, asr #2
80012b38:	41414141 	cmpmi	r1, r1, asr #2
80012b3c:	41414141 	cmpmi	r1, r1, asr #2
80012b40:	41414141 	cmpmi	r1, r1, asr #2
80012b44:	41414145 	cmpmi	r1, r5, asr #2
80012b48:	50505042 	subspl	r5, r0, r2, asr #32
80012b4c:	4141414a 	cmpmi	r1, sl, asr #2
80012b50:	41414141 	cmpmi	r1, r1, asr #2
80012b54:	414c474d 	cmpmi	ip, sp, asr #14
80012b58:	41414141 	cmpmi	r1, r1, asr #2
80012b5c:	41414141 	cmpmi	r1, r1, asr #2
80012b60:	41414141 	cmpmi	r1, r1, asr #2
80012b64:	41414141 	cmpmi	r1, r1, asr #2
80012b68:	41414143 	cmpmi	r1, r3, asr #2
80012b6c:	41414341 	cmpmi	r1, r1, asr #6
80012b70:	41414141 	cmpmi	r1, r1, asr #2
80012b74:	414c474d 	cmpmi	ip, sp, asr #14
80012b78:	41414141 	cmpmi	r1, r1, asr #2
80012b7c:	41414441 	cmpmi	r1, r1, asr #8
80012b80:	41414141 	cmpmi	r1, r1, asr #2
80012b84:	41414142 	cmpmi	r1, r2, asr #2
80012b88:	41414143 	cmpmi	r1, r3, asr #2
80012b8c:	4141414d 	cmpmi	r1, sp, asr #2
80012b90:	41414141 	cmpmi	r1, r1, asr #2
80012b94:	41444c41 	cmpmi	r4, r1, asr #24
80012b98:	41414141 	cmpmi	r1, r1, asr #2
80012b9c:	41414141 	cmpmi	r1, r1, asr #2
80012ba0:	41414141 	cmpmi	r1, r1, asr #2
80012ba4:	41414141 	cmpmi	r1, r1, asr #2
80012ba8:	41414142 	cmpmi	r1, r2, asr #2
80012bac:	4141414a 	cmpmi	r1, sl, asr #2
80012bb0:	41414141 	cmpmi	r1, r1, asr #2
80012bb4:	41455049 	cmpmi	r5, r9, asr #32
80012bb8:	41414141 	cmpmi	r1, r1, asr #2
80012bbc:	41414141 	cmpmi	r1, r1, asr #2
80012bc0:	41414141 	cmpmi	r1, r1, asr #2
80012bc4:	41414141 	cmpmi	r1, r1, asr #2
80012bc8:	41414142 	cmpmi	r1, r2, asr #2
80012bcc:	41414449 	cmpmi	r1, r9, asr #8
80012bd0:	41414141 	cmpmi	r1, r1, asr #2
80012bd4:	41414141 	cmpmi	r1, r1, asr #2
80012bd8:	41414141 	cmpmi	r1, r1, asr #2
80012bdc:	41414141 	cmpmi	r1, r1, asr #2
80012be0:	41414141 	cmpmi	r1, r1, asr #2
80012be4:	41414145 	cmpmi	r1, r5, asr #2
80012be8:	50505042 	subspl	r5, r0, r2, asr #32
80012bec:	4141414d 	cmpmi	r1, sp, asr #2
80012bf0:	41414141 	cmpmi	r1, r1, asr #2
80012bf4:	41464141 	cmpmi	r6, r1, asr #2
80012bf8:	41414141 	cmpmi	r1, r1, asr #2
80012bfc:	41414141 	cmpmi	r1, r1, asr #2
80012c00:	41414141 	cmpmi	r1, r1, asr #2
80012c04:	41414141 	cmpmi	r1, r1, asr #2
80012c08:	41414142 	cmpmi	r1, r2, asr #2
80012c0c:	41414447 	cmpmi	r1, r7, asr #8
80012c10:	41414141 	cmpmi	r1, r1, asr #2
80012c14:	41414141 	cmpmi	r1, r1, asr #2
80012c18:	41414141 	cmpmi	r1, r1, asr #2
80012c1c:	41414141 	cmpmi	r1, r1, asr #2
80012c20:	41414141 	cmpmi	r1, r1, asr #2
80012c24:	41414145 	cmpmi	r1, r5, asr #2
80012c28:	50505042 	subspl	r5, r0, r2, asr #32
80012c2c:	4141414a 	cmpmi	r1, sl, asr #2
80012c30:	41414141 	cmpmi	r1, r1, asr #2
80012c34:	414c4a4d 	cmpmi	ip, sp, asr #20
80012c38:	41414141 	cmpmi	r1, r1, asr #2
80012c3c:	41414141 	cmpmi	r1, r1, asr #2
80012c40:	41414141 	cmpmi	r1, r1, asr #2
80012c44:	41414141 	cmpmi	r1, r1, asr #2
80012c48:	41414143 	cmpmi	r1, r3, asr #2
80012c4c:	4141414d 	cmpmi	r1, sp, asr #2
80012c50:	41414141 	cmpmi	r1, r1, asr #2
80012c54:	41464b41 	cmpmi	r6, r1, asr #22
80012c58:	41414141 	cmpmi	r1, r1, asr #2
80012c5c:	41414141 	cmpmi	r1, r1, asr #2
80012c60:	41414141 	cmpmi	r1, r1, asr #2
80012c64:	41414141 	cmpmi	r1, r1, asr #2
80012c68:	41414142 	cmpmi	r1, r2, asr #2
80012c6c:	41414542 	cmpmi	r1, r2, asr #10
80012c70:	41414141 	cmpmi	r1, r1, asr #2
80012c74:	41494841 	cmpmi	r9, r1, asr #16
80012c78:	41414141 	cmpmi	r1, r1, asr #2
80012c7c:	4141494d 	cmpmi	r1, sp, asr #18
80012c80:	41414141 	cmpmi	r1, r1, asr #2
80012c84:	41414143 	cmpmi	r1, r3, asr #2
80012c88:	41414142 	cmpmi	r1, r2, asr #2
80012c8c:	4141454f 	cmpmi	r1, pc, asr #10
80012c90:	41414141 	cmpmi	r1, r1, asr #2
80012c94:	4149504d 	cmpmi	r9, sp, asr #32
80012c98:	41414141 	cmpmi	r1, r1, asr #2
80012c9c:	41414a49 	cmpmi	r1, r9, asr #20
80012ca0:	41414141 	cmpmi	r1, r1, asr #2
80012ca4:	41414143 	cmpmi	r1, r3, asr #2
80012ca8:	41414142 	cmpmi	r1, r2, asr #2
80012cac:	41414649 	cmpmi	r1, r9, asr #12
80012cb0:	41414141 	cmpmi	r1, r1, asr #2
80012cb4:	414a4a45 	cmpmi	sl, r5, asr #20
80012cb8:	41414141 	cmpmi	r1, r1, asr #2
80012cbc:	41414b4d 	cmpmi	r1, sp, asr #22
80012cc0:	41414141 	cmpmi	r1, r1, asr #2
80012cc4:	41414143 	cmpmi	r1, r3, asr #2
80012cc8:	41414142 	cmpmi	r1, r2, asr #2
80012ccc:	4141414a 	cmpmi	r1, sl, asr #2
80012cd0:	41414141 	cmpmi	r1, r1, asr #2
80012cd4:	41494749 	cmpmi	r9, r9, asr #14
80012cd8:	41414141 	cmpmi	r1, r1, asr #2
80012cdc:	41414141 	cmpmi	r1, r1, asr #2
80012ce0:	41414141 	cmpmi	r1, r1, asr #2
80012ce4:	41414141 	cmpmi	r1, r1, asr #2
80012ce8:	41414142 	cmpmi	r1, r2, asr #2
80012cec:	4141414d 	cmpmi	r1, sp, asr #2
80012cf0:	41414141 	cmpmi	r1, r1, asr #2
80012cf4:	41494841 	cmpmi	r9, r1, asr #16
80012cf8:	41414141 	cmpmi	r1, r1, asr #2
80012cfc:	41414141 	cmpmi	r1, r1, asr #2
80012d00:	41414141 	cmpmi	r1, r1, asr #2
80012d04:	41414141 	cmpmi	r1, r1, asr #2
80012d08:	41414142 	cmpmi	r1, r2, asr #2
80012d0c:	4141414a 	cmpmi	r1, sl, asr #2
80012d10:	41414141 	cmpmi	r1, r1, asr #2
80012d14:	414b444d 	cmpmi	fp, sp, asr #8
80012d18:	41414141 	cmpmi	r1, r1, asr #2
80012d1c:	41414141 	cmpmi	r1, r1, asr #2
80012d20:	41414141 	cmpmi	r1, r1, asr #2
80012d24:	41414141 	cmpmi	r1, r1, asr #2
80012d28:	41414142 	cmpmi	r1, r2, asr #2
80012d2c:	4141474c 	cmpmi	r1, ip, asr #14
80012d30:	41414141 	cmpmi	r1, r1, asr #2
80012d34:	41414141 	cmpmi	r1, r1, asr #2
80012d38:	41414141 	cmpmi	r1, r1, asr #2
80012d3c:	41414141 	cmpmi	r1, r1, asr #2
80012d40:	41414141 	cmpmi	r1, r1, asr #2
80012d44:	41414145 	cmpmi	r1, r5, asr #2
80012d48:	50505042 	subspl	r5, r0, r2, asr #32
80012d4c:	4141414d 	cmpmi	r1, sp, asr #2
80012d50:	41414141 	cmpmi	r1, r1, asr #2
80012d54:	414b4541 	cmpmi	fp, r1, asr #10
80012d58:	41414141 	cmpmi	r1, r1, asr #2
80012d5c:	41414141 	cmpmi	r1, r1, asr #2
80012d60:	41414141 	cmpmi	r1, r1, asr #2
80012d64:	41414141 	cmpmi	r1, r1, asr #2
80012d68:	41414142 	cmpmi	r1, r2, asr #2
80012d6c:	41414141 	cmpmi	r1, r1, asr #2
80012d70:	41414141 	cmpmi	r1, r1, asr #2
80012d74:	41414141 	cmpmi	r1, r1, asr #2
80012d78:	41414141 	cmpmi	r1, r1, asr #2
80012d7c:	41414141 	cmpmi	r1, r1, asr #2
80012d80:	41414141 	cmpmi	r1, r1, asr #2
80012d84:	41414145 	cmpmi	r1, r5, asr #2
80012d88:	50505042 	subspl	r5, r0, r2, asr #32
80012d8c:	41414843 	cmpmi	r1, r3, asr #16
80012d90:	41414141 	cmpmi	r1, r1, asr #2
80012d94:	424d414d 	submi	r4, sp, #1073741843	@ 0x40000013
80012d98:	41414141 	cmpmi	r1, r1, asr #2
80012d9c:	41414141 	cmpmi	r1, r1, asr #2
80012da0:	41414141 	cmpmi	r1, r1, asr #2
80012da4:	41414142 	cmpmi	r1, r2, asr #2
80012da8:	41414144 	cmpmi	r1, r4, asr #2
80012dac:	41414949 	cmpmi	r1, r9, asr #18
80012db0:	41414141 	cmpmi	r1, r1, asr #2
80012db4:	41444749 	cmpmi	r4, r9, asr #14
80012db8:	41414141 	cmpmi	r1, r1, asr #2
80012dbc:	4141424d 	cmpmi	r1, sp, asr #4
80012dc0:	41414141 	cmpmi	r1, r1, asr #2
80012dc4:	41414243 	cmpmi	r1, r3, asr #4
80012dc8:	41414142 	cmpmi	r1, r2, asr #2
80012dcc:	4141494f 	cmpmi	r1, pc, asr #18
80012dd0:	41414141 	cmpmi	r1, r1, asr #2
80012dd4:	41464b41 	cmpmi	r6, r1, asr #22
80012dd8:	41414141 	cmpmi	r1, r1, asr #2
80012ddc:	41434e41 	cmpmi	r3, r1, asr #28
80012de0:	41414141 	cmpmi	r1, r1, asr #2
80012de4:	41414243 	cmpmi	r1, r3, asr #4
80012de8:	41414142 	cmpmi	r1, r2, asr #2
80012dec:	41414a48 	cmpmi	r1, r8, asr #20
80012df0:	41414141 	cmpmi	r1, r1, asr #2
80012df4:	41424e41 	cmpmi	r2, r1, asr #28
80012df8:	41414141 	cmpmi	r1, r1, asr #2
80012dfc:	41414445 	cmpmi	r1, r5, asr #8
80012e00:	41414141 	cmpmi	r1, r1, asr #2
80012e04:	41414243 	cmpmi	r1, r3, asr #4
80012e08:	41414142 	cmpmi	r1, r2, asr #2
80012e0c:	41414f41 	cmpmi	r1, r1, asr #30
80012e10:	41414141 	cmpmi	r1, r1, asr #2
80012e14:	424d4341 	submi	r4, sp, #67108865	@ 0x4000001
80012e18:	41414141 	cmpmi	r1, r1, asr #2
80012e1c:	41414141 	cmpmi	r1, r1, asr #2
80012e20:	41414141 	cmpmi	r1, r1, asr #2
80012e24:	41414241 	cmpmi	r1, r1, asr #4
80012e28:	41414144 	cmpmi	r1, r4, asr #2
80012e2c:	41414b41 	cmpmi	r1, r1, asr #22
80012e30:	41414141 	cmpmi	r1, r1, asr #2
80012e34:	4143504d 	cmpmi	r3, sp, asr #32
80012e38:	41414141 	cmpmi	r1, r1, asr #2
80012e3c:	41414341 	cmpmi	r1, r1, asr #6
80012e40:	41414141 	cmpmi	r1, r1, asr #2
80012e44:	41414243 	cmpmi	r1, r3, asr #4
80012e48:	41414142 	cmpmi	r1, r2, asr #2
80012e4c:	41414b48 	cmpmi	r1, r8, asr #22
80012e50:	41414141 	cmpmi	r1, r1, asr #2
80012e54:	424d4341 	submi	r4, sp, #67108865	@ 0x4000001
80012e58:	41414141 	cmpmi	r1, r1, asr #2
80012e5c:	41414141 	cmpmi	r1, r1, asr #2
80012e60:	41414141 	cmpmi	r1, r1, asr #2
80012e64:	41414241 	cmpmi	r1, r1, asr #4
80012e68:	41414144 	cmpmi	r1, r4, asr #2
80012e6c:	41414c46 	cmpmi	r1, r6, asr #24
80012e70:	41414141 	cmpmi	r1, r1, asr #2
80012e74:	414b4541 	cmpmi	fp, r1, asr #10
80012e78:	41414141 	cmpmi	r1, r1, asr #2
80012e7c:	41415045 	cmpmi	r1, r5, asr #32
80012e80:	41414141 	cmpmi	r1, r1, asr #2
80012e84:	41414243 	cmpmi	r1, r3, asr #4
80012e88:	41414142 	cmpmi	r1, r2, asr #2
80012e8c:	41414d46 	cmpmi	r1, r6, asr #26
80012e90:	41414141 	cmpmi	r1, r1, asr #2
80012e94:	41434945 	cmpmi	r3, r5, asr #18
80012e98:	41414141 	cmpmi	r1, r1, asr #2
80012e9c:	4141434d 	cmpmi	r1, sp, asr #6
80012ea0:	41414141 	cmpmi	r1, r1, asr #2
80012ea4:	41414243 	cmpmi	r1, r3, asr #4
80012ea8:	41414142 	cmpmi	r1, r2, asr #2
80012eac:	41414d4c 	cmpmi	r1, ip, asr #26
80012eb0:	41414141 	cmpmi	r1, r1, asr #2
80012eb4:	41434c41 	cmpmi	r3, r1, asr #24
80012eb8:	41414141 	cmpmi	r1, r1, asr #2
80012ebc:	41414341 	cmpmi	r1, r1, asr #6
80012ec0:	41414141 	cmpmi	r1, r1, asr #2
80012ec4:	41414243 	cmpmi	r1, r3, asr #4
80012ec8:	41414142 	cmpmi	r1, r2, asr #2
80012ecc:	41414e42 	cmpmi	r1, r2, asr #28
80012ed0:	41414141 	cmpmi	r1, r1, asr #2
80012ed4:	41434541 	cmpmi	r3, r1, asr #10
80012ed8:	41414141 	cmpmi	r1, r1, asr #2
80012edc:	41414545 	cmpmi	r1, r5, asr #10
80012ee0:	41414141 	cmpmi	r1, r1, asr #2
80012ee4:	41414243 	cmpmi	r1, r3, asr #4
80012ee8:	41414142 	cmpmi	r1, r2, asr #2
80012eec:	41414e4b 	cmpmi	r1, fp, asr #28
80012ef0:	41414141 	cmpmi	r1, r1, asr #2
80012ef4:	4144444d 	cmpmi	r4, sp, asr #8
80012ef8:	41414141 	cmpmi	r1, r1, asr #2
80012efc:	4141434d 	cmpmi	r1, sp, asr #6
80012f00:	41414141 	cmpmi	r1, r1, asr #2
80012f04:	41414243 	cmpmi	r1, r3, asr #4
80012f08:	41414142 	cmpmi	r1, r2, asr #2
80012f0c:	41414e50 	cmpmi	r1, r0, asr lr
80012f10:	41414141 	cmpmi	r1, r1, asr #2
80012f14:	424d4341 	submi	r4, sp, #67108865	@ 0x4000001
80012f18:	41414141 	cmpmi	r1, r1, asr #2
80012f1c:	41414141 	cmpmi	r1, r1, asr #2
80012f20:	41414141 	cmpmi	r1, r1, asr #2
80012f24:	41414241 	cmpmi	r1, r1, asr #4
80012f28:	41414144 	cmpmi	r1, r4, asr #2
80012f2c:	41414f4c 	cmpmi	r1, ip, asr #30
80012f30:	41414141 	cmpmi	r1, r1, asr #2
80012f34:	41444945 	cmpmi	r4, r5, asr #18
80012f38:	41414141 	cmpmi	r1, r1, asr #2
80012f3c:	4141434d 	cmpmi	r1, sp, asr #6
80012f40:	41414141 	cmpmi	r1, r1, asr #2
80012f44:	41414243 	cmpmi	r1, r3, asr #4
80012f48:	41414142 	cmpmi	r1, r2, asr #2
80012f4c:	4142444d 	cmpmi	r2, sp, asr #8
80012f50:	41414141 	cmpmi	r1, r1, asr #2
80012f54:	41424141 	cmpmi	r2, r1, asr #2
80012f58:	41414141 	cmpmi	r1, r1, asr #2
80012f5c:	41414e41 	cmpmi	r1, r1, asr #28
80012f60:	41414141 	cmpmi	r1, r1, asr #2
80012f64:	41414243 	cmpmi	r1, r3, asr #4
80012f68:	41414142 	cmpmi	r1, r2, asr #2
80012f6c:	41415041 	cmpmi	r1, r1, asr #32
80012f70:	41414141 	cmpmi	r1, r1, asr #2
80012f74:	4144424d 	cmpmi	r4, sp, asr #4
80012f78:	41414141 	cmpmi	r1, r1, asr #2
80012f7c:	41414341 	cmpmi	r1, r1, asr #6
80012f80:	41414141 	cmpmi	r1, r1, asr #2
80012f84:	41414243 	cmpmi	r1, r3, asr #4
80012f88:	41414142 	cmpmi	r1, r2, asr #2
80012f8c:	41415046 	cmpmi	r1, r6, asr #32
80012f90:	41414141 	cmpmi	r1, r1, asr #2
80012f94:	424d4341 	submi	r4, sp, #67108865	@ 0x4000001
80012f98:	41414141 	cmpmi	r1, r1, asr #2
80012f9c:	41414141 	cmpmi	r1, r1, asr #2
80012fa0:	41414141 	cmpmi	r1, r1, asr #2
80012fa4:	41414241 	cmpmi	r1, r1, asr #4
80012fa8:	41414144 	cmpmi	r1, r4, asr #2
80012fac:	41424142 	cmpmi	r2, r2, asr #2
80012fb0:	41414141 	cmpmi	r1, r1, asr #2
80012fb4:	424d4341 	submi	r4, sp, #67108865	@ 0x4000001
80012fb8:	41414141 	cmpmi	r1, r1, asr #2
80012fbc:	41414141 	cmpmi	r1, r1, asr #2
80012fc0:	41414141 	cmpmi	r1, r1, asr #2
80012fc4:	41414241 	cmpmi	r1, r1, asr #4
80012fc8:	41414144 	cmpmi	r1, r4, asr #2
80012fcc:	4142414a 	cmpmi	r2, sl, asr #2
80012fd0:	41414141 	cmpmi	r1, r1, asr #2
80012fd4:	41434145 	cmpmi	r3, r5, asr #2
80012fd8:	41414141 	cmpmi	r1, r1, asr #2
80012fdc:	4141444d 	cmpmi	r1, sp, asr #8
80012fe0:	41414141 	cmpmi	r1, r1, asr #2
80012fe4:	41414243 	cmpmi	r1, r3, asr #4
80012fe8:	41414142 	cmpmi	r1, r2, asr #2
80012fec:	41424243 	cmpmi	r2, r3, asr #4
80012ff0:	41414141 	cmpmi	r1, r1, asr #2
80012ff4:	41464141 	cmpmi	r6, r1, asr #2
80012ff8:	41414141 	cmpmi	r1, r1, asr #2
80012ffc:	41414b41 	cmpmi	r1, r1, asr #22
80013000:	41414141 	cmpmi	r1, r1, asr #2
80013004:	41414243 	cmpmi	r1, r3, asr #4
80013008:	41414142 	cmpmi	r1, r2, asr #2
8001300c:	4142424f 	cmpmi	r2, pc, asr #4
80013010:	41414141 	cmpmi	r1, r1, asr #2
80013014:	424d4341 	submi	r4, sp, #67108865	@ 0x4000001
80013018:	41414141 	cmpmi	r1, r1, asr #2
8001301c:	41414141 	cmpmi	r1, r1, asr #2
80013020:	41414141 	cmpmi	r1, r1, asr #2
80013024:	41414241 	cmpmi	r1, r1, asr #4
80013028:	41414144 	cmpmi	r1, r4, asr #2
8001302c:	41424346 	cmpmi	r2, r6, asr #6
80013030:	41414141 	cmpmi	r1, r1, asr #2
80013034:	424d4341 	submi	r4, sp, #67108865	@ 0x4000001
80013038:	41414141 	cmpmi	r1, r1, asr #2
8001303c:	41414141 	cmpmi	r1, r1, asr #2
80013040:	41414141 	cmpmi	r1, r1, asr #2
80013044:	41414241 	cmpmi	r1, r1, asr #4
80013048:	41414144 	cmpmi	r1, r4, asr #2
8001304c:	4142434b 	cmpmi	r2, fp, asr #6
80013050:	41414141 	cmpmi	r1, r1, asr #2
80013054:	41434e41 	cmpmi	r3, r1, asr #28
80013058:	41414141 	cmpmi	r1, r1, asr #2
8001305c:	4141434d 	cmpmi	r1, sp, asr #6
80013060:	41414141 	cmpmi	r1, r1, asr #2
80013064:	41414243 	cmpmi	r1, r3, asr #4
80013068:	41414142 	cmpmi	r1, r2, asr #2
8001306c:	41424350 	cmpmi	r2, r0, asr r3
80013070:	41414141 	cmpmi	r1, r1, asr #2
80013074:	41414141 	cmpmi	r1, r1, asr #2
80013078:	41414149 	cmpmi	r1, r9, asr #2
8001307c:	41414141 	cmpmi	r1, r1, asr #2
80013080:	41414141 	cmpmi	r1, r1, asr #2
80013084:	41414241 	cmpmi	r1, r1, asr #4
80013088:	41414146 	cmpmi	r1, r6, asr #2
8001308c:	00000000 	andeq	r0, r0, r0
80013090:	41424447 	cmpmi	r2, r7, asr #8
80013094:	41414141 	cmpmi	r1, r1, asr #2
80013098:	424d4341 	submi	r4, sp, #67108865	@ 0x4000001
8001309c:	41414141 	cmpmi	r1, r1, asr #2
800130a0:	41414141 	cmpmi	r1, r1, asr #2
800130a4:	41414141 	cmpmi	r1, r1, asr #2
800130a8:	41414241 	cmpmi	r1, r1, asr #4
800130ac:	41414144 	cmpmi	r1, r4, asr #2
800130b0:	41424544 	cmpmi	r2, r4, asr #10
800130b4:	41414141 	cmpmi	r1, r1, asr #2
800130b8:	41444c41 	cmpmi	r4, r1, asr #24
800130bc:	41414141 	cmpmi	r1, r1, asr #2
800130c0:	41424641 	cmpmi	r2, r1, asr #12
800130c4:	41414141 	cmpmi	r1, r1, asr #2
800130c8:	41414243 	cmpmi	r1, r3, asr #4
800130cc:	41414142 	cmpmi	r1, r2, asr #2
800130d0:	47494141 	strbmi	r4, [r9, -r1, asr #2]
800130d4:	474d4746 	strbmi	r4, [sp, -r6, asr #14]
800130d8:	4750474d 	ldrbmi	r4, [r0, -sp, asr #14]
800130dc:	4744434f 	strbmi	r4, [r4, -pc, asr #6]
800130e0:	43454141 	movtmi	r4, #20801	@ 0x5141
800130e4:	41414745 	cmpmi	r1, r5, asr #14
800130e8:	47424345 	strbmi	r4, [r2, -r5, asr #6]
800130ec:	48444141 	stmdami	r4, {r0, r6, r8, lr}^
800130f0:	4844484a 	stmdami	r4, {r1, r3, r6, fp, lr}^
800130f4:	47424744 	strbmi	r4, [r2, -r4, asr #14]
800130f8:	474d474d 	strbmi	r4, [sp, -sp, asr #14]
800130fc:	4744434f 	strbmi	r4, [r4, -pc, asr #6]
80013100:	47484141 	strbmi	r4, [r8, -r1, asr #2]
80013104:	48454746 	stmdami	r5, {r1, r2, r6, r8, r9, sl, lr}^
80013108:	434f4844 	movtmi	r4, #63556	@ 0xf844
8001310c:	41414744 	cmpmi	r1, r4, asr #14
80013110:	46414644 	strbmi	r4, [r1], -r4, asr #12
80013114:	45444546 	strbmi	r4, [r4, #-1350]	@ 0xfffffaba
80013118:	4542454a 	strbmi	r4, [r2, #-1354]	@ 0xfffffab6
8001311c:	4650454d 	ldrbmi	r4, [r0], -sp, asr #10
80013120:	4546454c 	strbmi	r4, [r6, #-1356]	@ 0xfffffab4
80013124:	4650464a 	ldrbmi	r4, [r0], -sl, asr #12
80013128:	45464644 	strbmi	r4, [r6, #-1604]	@ 0xfffff9bc
8001312c:	46464642 	strbmi	r4, [r6], -r2, asr #12
80013130:	454f4546 	strbmi	r4, [pc, #-1350]	@ 80012bf2 <SPECIAL_KEY_SEQUENCES+0x4236>
80013134:	45464544 	strbmi	r4, [r6, #-1348]	@ 0xfffffabc
80013138:	41414644 	cmpmi	r1, r4, asr #12
8001313c:	48444847 	stmdami	r4, {r0, r1, r2, r6, fp, lr}^
80013140:	48434841 	stmdami	r3, {r0, r6, fp, lr}^
80013144:	474f474a 	strbmi	r4, [pc, -sl, asr #14]
80013148:	47474845 	strbmi	r4, [r7, -r5, asr #16]
8001314c:	4744434f 	strbmi	r4, [r4, -pc, asr #6]
80013150:	48414141 	stmdami	r1, {r0, r6, r8, lr}^
80013154:	474a4843 	strbmi	r4, [sl, -r3, asr #16]
80013158:	4845474f 	stmdami	r5, {r0, r1, r2, r3, r6, r8, r9, sl, lr}^
8001315c:	48444650 	stmdami	r4, {r4, r6, r9, sl, lr}^
80013160:	48434845 	stmdami	r3, {r0, r2, r6, fp, lr}^
80013164:	474f474a 	strbmi	r4, [pc, -sl, asr #14]
80013168:	41414748 	cmpmi	r1, r8, asr #14
8001316c:	48434841 	stmdami	r3, {r0, r6, fp, lr}^
80013170:	474f474a 	strbmi	r4, [pc, -sl, asr #14]
80013174:	46504845 	ldrbmi	r4, [r0], -r5, asr #16
80013178:	474f474a 	strbmi	r4, [pc, -sl, asr #14]
8001317c:	41414845 	cmpmi	r1, r5, asr #16
80013180:	48434841 	stmdami	r3, {r0, r6, fp, lr}^
80013184:	474f474a 	strbmi	r4, [pc, -sl, asr #14]
80013188:	46504845 	ldrbmi	r4, [r0], -r5, asr #16
8001318c:	474a4846 	strbmi	r4, [sl, -r6, asr #16]
80013190:	4845474f 	stmdami	r5, {r0, r1, r2, r3, r6, r8, r9, sl, lr}^
80013194:	474a4650 	smlsldmi	r4, sl, r0, r6
80013198:	4650474f 	ldrbmi	r4, [r0], -pc, asr #14
8001319c:	47424743 	strbmi	r4, [r2, -r3, asr #14]
800131a0:	47464844 	strbmi	r4, [r6, -r4, asr #16]
800131a4:	474e4141 	strbmi	r4, [lr, -r1, asr #2]
800131a8:	48454742 	stmdami	r5, {r1, r6, r8, r9, sl, lr}^
800131ac:	434f4749 	movtmi	r4, #63305	@ 0xf749
800131b0:	41414744 	cmpmi	r1, r4, asr #14
800131b4:	45484650 	strbmi	r4, [r8, #-1616]	@ 0xfffff9b0
800131b8:	4550454d 	ldrbmi	r4, [r0, #-1357]	@ 0xfffffab3
800131bc:	45424543 	strbmi	r4, [r2, #-1347]	@ 0xfffffabd
800131c0:	4650454d 	ldrbmi	r4, [r0], -sp, asr #10
800131c4:	45474550 	strbmi	r4, [r7, #-1360]	@ 0xfffffab0
800131c8:	46444547 	strbmi	r4, [r4], -r7, asr #10
800131cc:	46454546 	strbmi	r4, [r5], -r6, asr #10
800131d0:	46454650 			@ <UNDEFINED> instruction: 0x46454650
800131d4:	45434542 	strbmi	r4, [r3, #-1346]	@ 0xfffffabe
800131d8:	4546454d 	strbmi	r4, [r6, #-1357]	@ 0xfffffab3
800131dc:	41414650 	cmpmi	r1, r0, asr r6
800131e0:	474a484a 	strbmi	r4, [sl, -sl, asr #16]
800131e4:	474d4746 	strbmi	r4, [sp, -r6, asr #14]
800131e8:	41414745 	cmpmi	r1, r5, asr #14
800131ec:	48444847 	stmdami	r4, {r0, r1, r2, r6, fp, lr}^
800131f0:	48434841 	stmdami	r3, {r0, r6, fp, lr}^
800131f4:	474f474a 	strbmi	r4, [pc, -sl, asr #14]
800131f8:	47474845 	strbmi	r4, [r7, -r5, asr #16]
800131fc:	48444141 	stmdami	r4, {r0, r6, r8, lr}^
80013200:	4844484a 	stmdami	r4, {r1, r3, r6, fp, lr}^
80013204:	47424744 	strbmi	r4, [r2, -r4, asr #14]
80013208:	474d474d 	strbmi	r4, [sp, -sp, asr #14]
8001320c:	41414441 	cmpmi	r1, r1, asr #8
80013210:	47464748 	strbmi	r4, [r6, -r8, asr #14]
80013214:	48414845 	stmdami	r1, {r0, r2, r6, fp, lr}^
80013218:	4745474a 	strbmi	r4, [r5, -sl, asr #14]
8001321c:	46504141 	ldrbmi	r4, [r0], -r1, asr #2
80013220:	47434650 	smlsldmi	r4, r3, r0, r6
80013224:	48444844 	stmdami	r4, {r2, r6, fp, lr}^
80013228:	48444650 	stmdami	r4, {r4, r6, r9, sl, lr}^
8001322c:	47424845 	strbmi	r4, [r2, -r5, asr #16]
80013230:	48454843 	stmdami	r5, {r0, r1, r6, fp, lr}^
80013234:	46504650 			@ <UNDEFINED> instruction: 0x46504650
80013238:	48464141 	stmdami	r6, {r0, r6, r8, lr}^
8001323c:	4844474f 	stmdami	r4, {r0, r1, r2, r3, r6, r8, r9, sl, lr}^
80013240:	4748474a 	strbmi	r4, [r8, -sl, asr #14]
80013244:	4746474f 	strbmi	r4, [r6, -pc, asr #14]
80013248:	46504745 	ldrbmi	r4, [r0], -r5, asr #14
8001324c:	474a4745 	strbmi	r4, [sl, -r5, asr #14]
80013250:	474e4847 	strbmi	r4, [lr, -r7, asr #16]
80013254:	47454750 	smlsldmi	r4, r5, r0, r7
80013258:	48414141 	stmdami	r1, {r0, r6, r8, lr}^
8001325c:	48454846 	stmdami	r5, {r1, r2, r6, fp, lr}^
80013260:	47494744 	strbmi	r4, [r9, -r4, asr #14]
80013264:	47484141 	strbmi	r4, [r8, -r1, asr #2]
80013268:	48454746 	stmdami	r5, {r1, r2, r6, r8, r9, sl, lr}^
8001326c:	47494744 	strbmi	r4, [r9, -r4, asr #14]
80013270:	48444141 	stmdami	r4, {r0, r6, r8, lr}^
80013274:	4844484a 	stmdami	r4, {r1, r3, r6, fp, lr}^
80013278:	47424744 	strbmi	r4, [r2, -r4, asr #14]
8001327c:	474d474d 	strbmi	r4, [sp, -sp, asr #14]
80013280:	41414443 	cmpmi	r1, r3, asr #8
80013284:	48494746 	stmdami	r9, {r1, r2, r6, r8, r9, sl, lr}^
80013288:	47444746 	strbmi	r4, [r4, -r6, asr #14]
8001328c:	46504141 	ldrbmi	r4, [r0], -r1, asr #2
80013290:	47434650 	smlsldmi	r4, r3, r0, r6
80013294:	48444844 	stmdami	r4, {r2, r6, fp, lr}^
80013298:	47464650 	smlsldmi	r4, r6, r0, r6
8001329c:	4745474f 	strbmi	r4, [r5, -pc, asr #14]
800132a0:	46504650 			@ <UNDEFINED> instruction: 0x46504650
800132a4:	48484141 	stmdami	r8, {r0, r6, r8, lr}^
800132a8:	474a4742 	strbmi	r4, [sl, -r2, asr #14]
800132ac:	41414845 	cmpmi	r1, r5, asr #16
800132b0:	47504747 	ldrbmi	r4, [r0, -r7, asr #14]
800132b4:	474c4843 	strbmi	r4, [ip, -r3, asr #16]
800132b8:	46504141 	ldrbmi	r4, [r0], -r1, asr #2
800132bc:	47434650 	smlsldmi	r4, r3, r0, r6
800132c0:	48444844 	stmdami	r4, {r2, r6, fp, lr}^
800132c4:	48444650 	stmdami	r4, {r4, r6, r9, sl, lr}^
800132c8:	47424845 	strbmi	r4, [r2, -r5, asr #16]
800132cc:	48454843 	stmdami	r5, {r0, r1, r6, fp, lr}^
800132d0:	46504141 	ldrbmi	r4, [r0], -r1, asr #2
800132d4:	47464650 	smlsldmi	r4, r6, r0, r6
800132d8:	4745474f 	strbmi	r4, [r5, -pc, asr #14]
800132dc:	46504650 			@ <UNDEFINED> instruction: 0x46504650
800132e0:	48444141 	stmdami	r4, {r0, r6, r8, lr}^
800132e4:	4844484a 	stmdami	r4, {r1, r3, r6, fp, lr}^
800132e8:	47424744 	strbmi	r4, [r2, -r4, asr #14]
800132ec:	474d474d 	strbmi	r4, [sp, -sp, asr #14]
800132f0:	41414442 	cmpmi	r1, r2, asr #8
800132f4:	48434841 	stmdami	r3, {r0, r6, fp, lr}^
800132f8:	474f474a 	strbmi	r4, [pc, -sl, asr #14]
800132fc:	47474845 	strbmi	r4, [r7, -r5, asr #16]
80013300:	47434650 	smlsldmi	r4, r3, r0, r6
80013304:	48444742 	stmdami	r4, {r1, r6, r8, r9, sl, lr}^
80013308:	41414746 	cmpmi	r1, r6, asr #14
8001330c:	47464650 	smlsldmi	r4, r6, r0, r6
80013310:	47424745 	strbmi	r4, [r2, -r5, asr #14]
80013314:	47424845 	strbmi	r4, [r2, -r5, asr #16]
80013318:	46504141 	ldrbmi	r4, [r0], -r1, asr #2
8001331c:	474f4746 	strbmi	r4, [pc, -r6, asr #14]
80013320:	41414745 	cmpmi	r1, r5, asr #14
80013324:	48494746 	stmdami	r9, {r1, r2, r6, r8, r9, sl, lr}^
80013328:	4845474a 	stmdami	r5, {r1, r3, r6, r8, r9, sl, lr}^
8001332c:	46504141 	ldrbmi	r4, [r0], -r1, asr #2
80013330:	48454844 	stmdami	r5, {r2, r6, fp, lr}^
80013334:	47444742 	strbmi	r4, [r4, -r2, asr #14]
80013338:	4141474c 	cmpmi	r1, ip, asr #14
8001333c:	46504650 			@ <UNDEFINED> instruction: 0x46504650
80013340:	47424745 	strbmi	r4, [r2, -r5, asr #14]
80013344:	47424845 	strbmi	r4, [r2, -r5, asr #16]
80013348:	48444650 	stmdami	r4, {r4, r6, r9, sl, lr}^
8001334c:	47424845 	strbmi	r4, [r2, -r5, asr #16]
80013350:	48454843 	stmdami	r5, {r0, r1, r6, fp, lr}^
80013354:	47484141 	strbmi	r4, [r8, -r1, asr #2]
80013358:	48454746 	stmdami	r5, {r1, r2, r6, r8, r9, sl, lr}^
8001335c:	46504844 	ldrbmi	r4, [r0], -r4, asr #16
80013360:	47424743 	strbmi	r4, [r2, -r3, asr #14]
80013364:	47464844 	strbmi	r4, [r6, -r4, asr #16]
80013368:	41414141 	cmpmi	r1, r1, asr #2
8001336c:	4844434f 	stmdami	r4, {r0, r1, r2, r3, r6, r8, r9, lr}^
80013370:	474e484a 	strbmi	r4, [lr, -sl, asr #16]
80013374:	47424845 	strbmi	r4, [r2, -r5, asr #16]
80013378:	41414743 	cmpmi	r1, r3, asr #14
8001337c:	4844434f 	stmdami	r4, {r0, r1, r2, r3, r6, r8, r9, lr}^
80013380:	48434845 	stmdami	r3, {r0, r2, r6, fp, lr}^
80013384:	47424845 	strbmi	r4, [r2, -r5, asr #16]
80013388:	41414743 	cmpmi	r1, r3, asr #14
8001338c:	4844434f 	stmdami	r4, {r0, r1, r2, r3, r6, r8, r9, lr}^
80013390:	48444749 	stmdami	r4, {r0, r3, r6, r8, r9, sl, lr}^
80013394:	48434845 	stmdami	r3, {r0, r2, r6, fp, lr}^
80013398:	47424845 	strbmi	r4, [r2, -r5, asr #16]
8001339c:	41414743 	cmpmi	r1, r3, asr #14
800133a0:	4845434f 	stmdami	r5, {r0, r1, r2, r3, r6, r8, r9, lr}^
800133a4:	48494746 	stmdami	r9, {r1, r2, r6, r8, r9, sl, lr}^
800133a8:	41414845 	cmpmi	r1, r5, asr #16
800133ac:	4843434f 	stmdami	r3, {r0, r1, r2, r3, r6, r8, r9, lr}^
800133b0:	47454750 	smlsldmi	r4, r5, r0, r7
800133b4:	48454742 	stmdami	r5, {r1, r6, r8, r9, sl, lr}^
800133b8:	41414742 	cmpmi	r1, r2, asr #14
800133bc:	4748434f 	strbmi	r4, [r8, -pc, asr #6]
800133c0:	48454750 	stmdami	r5, {r4, r6, r8, r9, sl, lr}^
800133c4:	434f4141 	movtmi	r4, #61761	@ 0xf141
800133c8:	47464841 	strbmi	r4, [r6, -r1, asr #16]
800133cc:	48444843 	stmdami	r4, {r0, r1, r6, fp, lr}^
800133d0:	4844474a 	stmdami	r4, {r1, r3, r6, r8, r9, sl, lr}^
800133d4:	47464845 	strbmi	r4, [r6, -r5, asr #16]
800133d8:	4845474f 	stmdami	r5, {r0, r1, r2, r3, r6, r8, r9, sl, lr}^
800133dc:	434f4141 	movtmi	r4, #61761	@ 0xf141
800133e0:	4750474f 	ldrbmi	r4, [r0, -pc, asr #14]
800133e4:	474f474a 	strbmi	r4, [pc, -sl, asr #14]
800133e8:	4845474a 	stmdami	r5, {r1, r3, r6, r8, r9, sl, lr}^
800133ec:	434f4141 	movtmi	r4, #61761	@ 0xf141
800133f0:	47504744 	ldrbmi	r4, [r0, -r4, asr #14]
800133f4:	474e474e 	strbmi	r4, [lr, -lr, asr #14]
800133f8:	474f4746 	strbmi	r4, [pc, -r6, asr #14]
800133fc:	41414845 	cmpmi	r1, r5, asr #16
80013400:	4542434f 	strbmi	r4, [r2, #-847]	@ 0xfffffcb1
80013404:	454e4643 	strbmi	r4, [lr, #-1603]	@ 0xfffff9bd
80013408:	4742434f 	strbmi	r4, [r2, -pc, asr #6]
8001340c:	48454845 	stmdami	r5, {r0, r2, r6, fp, lr}^
80013410:	474a4843 	strbmi	r4, [sl, -r3, asr #16]
80013414:	48464743 	stmdami	r6, {r0, r1, r6, r8, r9, sl, lr}^
80013418:	47464845 	strbmi	r4, [r6, -r5, asr #16]
8001341c:	41414844 	cmpmi	r1, r4, asr #16
80013420:	41414141 	cmpmi	r1, r1, asr #2
80013424:	41414141 	cmpmi	r1, r1, asr #2
80013428:	41414141 	cmpmi	r1, r1, asr #2
8001342c:	41414141 	cmpmi	r1, r1, asr #2
80013430:	41414141 	cmpmi	r1, r1, asr #2
80013434:	41414141 	cmpmi	r1, r1, asr #2
80013438:	41414141 	cmpmi	r1, r1, asr #2
8001343c:	41414141 	cmpmi	r1, r1, asr #2
80013440:	41414141 	cmpmi	r1, r1, asr #2
80013444:	41414141 	cmpmi	r1, r1, asr #2
80013448:	41414141 	cmpmi	r1, r1, asr #2
8001344c:	41414141 	cmpmi	r1, r1, asr #2
80013450:	41414141 	cmpmi	r1, r1, asr #2
80013454:	41414141 	cmpmi	r1, r1, asr #2
80013458:	41414141 	cmpmi	r1, r1, asr #2
8001345c:	41414141 	cmpmi	r1, r1, asr #2
80013460:	41414141 	cmpmi	r1, r1, asr #2
80013464:	41414141 	cmpmi	r1, r1, asr #2
80013468:	41414141 	cmpmi	r1, r1, asr #2
8001346c:	41414141 	cmpmi	r1, r1, asr #2
80013470:	4141424c 	cmpmi	r1, ip, asr #4
80013474:	41414141 	cmpmi	r1, r1, asr #2
80013478:	41414142 	cmpmi	r1, r2, asr #2
8001347c:	41414141 	cmpmi	r1, r1, asr #2
80013480:	41414147 	cmpmi	r1, r7, asr #2
80013484:	41414141 	cmpmi	r1, r1, asr #2
80013488:	41424141 	cmpmi	r2, r1, asr #2
8001348c:	41414141 	cmpmi	r1, r1, asr #2
80013490:	41424141 	cmpmi	r2, r1, asr #2
80013494:	41414141 	cmpmi	r1, r1, asr #2
80013498:	414b4445 	cmpmi	fp, r5, asr #8
8001349c:	41414141 	cmpmi	r1, r1, asr #2
800134a0:	41414141 	cmpmi	r1, r1, asr #2
800134a4:	41414141 	cmpmi	r1, r1, asr #2
800134a8:	41414141 	cmpmi	r1, r1, asr #2
800134ac:	41414141 	cmpmi	r1, r1, asr #2
800134b0:	41414145 	cmpmi	r1, r5, asr #2
800134b4:	41414141 	cmpmi	r1, r1, asr #2
800134b8:	41414141 	cmpmi	r1, r1, asr #2
800134bc:	41414141 	cmpmi	r1, r1, asr #2
800134c0:	41414342 	cmpmi	r1, r2, asr #6
800134c4:	41414141 	cmpmi	r1, r1, asr #2
800134c8:	41414142 	cmpmi	r1, r2, asr #2
800134cc:	41414141 	cmpmi	r1, r1, asr #2
800134d0:	41414143 	cmpmi	r1, r3, asr #2
800134d4:	41414141 	cmpmi	r1, r1, asr #2
800134d8:	414c4445 	cmpmi	ip, r5, asr #8
800134dc:	41414141 	cmpmi	r1, r1, asr #2
800134e0:	414c4445 	cmpmi	ip, r5, asr #8
800134e4:	41414141 	cmpmi	r1, r1, asr #2
800134e8:	41414e46 	cmpmi	r1, r6, asr #28
800134ec:	41414141 	cmpmi	r1, r1, asr #2
800134f0:	41414141 	cmpmi	r1, r1, asr #2
800134f4:	41414141 	cmpmi	r1, r1, asr #2
800134f8:	41414141 	cmpmi	r1, r1, asr #2
800134fc:	41414141 	cmpmi	r1, r1, asr #2
80013500:	41414145 	cmpmi	r1, r5, asr #2
80013504:	41414141 	cmpmi	r1, r1, asr #2
80013508:	41414141 	cmpmi	r1, r1, asr #2
8001350c:	41414141 	cmpmi	r1, r1, asr #2
80013510:	4141434a 	cmpmi	r1, sl, asr #6
80013514:	41414141 	cmpmi	r1, r1, asr #2
80013518:	41414142 	cmpmi	r1, r2, asr #2
8001351c:	41414141 	cmpmi	r1, r1, asr #2
80013520:	41414144 	cmpmi	r1, r4, asr #2
80013524:	41414141 	cmpmi	r1, r1, asr #2
80013528:	424d414d 	submi	r4, sp, #1073741843	@ 0x40000013
8001352c:	41414141 	cmpmi	r1, r1, asr #2
80013530:	414d414d 	cmpmi	sp, sp, asr #2
80013534:	41414141 	cmpmi	r1, r1, asr #2
80013538:	41414245 	cmpmi	r1, r5, asr #4
8001353c:	41414141 	cmpmi	r1, r1, asr #2
80013540:	41414141 	cmpmi	r1, r1, asr #2
80013544:	41414141 	cmpmi	r1, r1, asr #2
80013548:	41414141 	cmpmi	r1, r1, asr #2
8001354c:	41414141 	cmpmi	r1, r1, asr #2
80013550:	41414145 	cmpmi	r1, r5, asr #2
80013554:	41414141 	cmpmi	r1, r1, asr #2
80013558:	41414145 	cmpmi	r1, r5, asr #2
8001355c:	41414141 	cmpmi	r1, r1, asr #2
80013560:	4141434f 	cmpmi	r1, pc, asr #6
80013564:	41414141 	cmpmi	r1, r1, asr #2
80013568:	41414142 	cmpmi	r1, r2, asr #2
8001356c:	41414141 	cmpmi	r1, r1, asr #2
80013570:	41414144 	cmpmi	r1, r4, asr #2
80013574:	41414141 	cmpmi	r1, r1, asr #2
80013578:	424d4341 	submi	r4, sp, #67108865	@ 0x4000001
8001357c:	41414141 	cmpmi	r1, r1, asr #2
80013580:	414d4341 	cmpmi	sp, r1, asr #6
80013584:	41414141 	cmpmi	r1, r1, asr #2
80013588:	41414141 	cmpmi	r1, r1, asr #2
8001358c:	41414141 	cmpmi	r1, r1, asr #2
80013590:	41414141 	cmpmi	r1, r1, asr #2
80013594:	41414141 	cmpmi	r1, r1, asr #2
80013598:	41414141 	cmpmi	r1, r1, asr #2
8001359c:	41414141 	cmpmi	r1, r1, asr #2
800135a0:	41414145 	cmpmi	r1, r5, asr #2
800135a4:	41414141 	cmpmi	r1, r1, asr #2
800135a8:	41414141 	cmpmi	r1, r1, asr #2
800135ac:	41414141 	cmpmi	r1, r1, asr #2
800135b0:	4141444b 	cmpmi	r1, fp, asr #8
800135b4:	41414141 	cmpmi	r1, r1, asr #2
800135b8:	41414149 	cmpmi	r1, r9, asr #2
800135bc:	41414141 	cmpmi	r1, r1, asr #2
800135c0:	41414144 	cmpmi	r1, r4, asr #2
800135c4:	41414141 	cmpmi	r1, r1, asr #2
800135c8:	424d4341 	submi	r4, sp, #67108865	@ 0x4000001
800135cc:	41414141 	cmpmi	r1, r1, asr #2
800135d0:	41414141 	cmpmi	r1, r1, asr #2
800135d4:	41414141 	cmpmi	r1, r1, asr #2
800135d8:	41414141 	cmpmi	r1, r1, asr #2
800135dc:	41414141 	cmpmi	r1, r1, asr #2
800135e0:	41414141 	cmpmi	r1, r1, asr #2
800135e4:	41414141 	cmpmi	r1, r1, asr #2
800135e8:	41414141 	cmpmi	r1, r1, asr #2
800135ec:	41414141 	cmpmi	r1, r1, asr #2
800135f0:	41414145 	cmpmi	r1, r5, asr #2
800135f4:	41414141 	cmpmi	r1, r1, asr #2
800135f8:	41414141 	cmpmi	r1, r1, asr #2
800135fc:	41414141 	cmpmi	r1, r1, asr #2
80013600:	41414543 	cmpmi	r1, r3, asr #10
80013604:	41414141 	cmpmi	r1, r1, asr #2
80013608:	41414142 	cmpmi	r1, r2, asr #2
8001360c:	41414141 	cmpmi	r1, r1, asr #2
80013610:	41414441 	cmpmi	r1, r1, asr #8
80013614:	41414141 	cmpmi	r1, r1, asr #2
80013618:	41414141 	cmpmi	r1, r1, asr #2
8001361c:	41414141 	cmpmi	r1, r1, asr #2
80013620:	414d4341 	cmpmi	sp, r1, asr #6
80013624:	41414141 	cmpmi	r1, r1, asr #2
80013628:	4141424f 	cmpmi	r1, pc, asr #4
8001362c:	41414141 	cmpmi	r1, r1, asr #2
80013630:	41414141 	cmpmi	r1, r1, asr #2
80013634:	41414141 	cmpmi	r1, r1, asr #2
80013638:	41414141 	cmpmi	r1, r1, asr #2
8001363c:	41414141 	cmpmi	r1, r1, asr #2
80013640:	41414142 	cmpmi	r1, r2, asr #2
80013644:	41414141 	cmpmi	r1, r1, asr #2
80013648:	41414142 	cmpmi	r1, r2, asr #2
8001364c:	41414141 	cmpmi	r1, r1, asr #2
80013650:	4141454c 	cmpmi	r1, ip, asr #10
80013654:	41414141 	cmpmi	r1, r1, asr #2
80013658:	41414144 	cmpmi	r1, r4, asr #2
8001365c:	48414141 	stmdami	r1, {r0, r6, r8, lr}^
80013660:	41414141 	cmpmi	r1, r1, asr #2
80013664:	41414141 	cmpmi	r1, r1, asr #2
80013668:	41414141 	cmpmi	r1, r1, asr #2
8001366c:	41414141 	cmpmi	r1, r1, asr #2
80013670:	414d444f 	cmpmi	sp, pc, asr #8
80013674:	41414141 	cmpmi	r1, r1, asr #2
80013678:	41414350 	cmpmi	r1, r0, asr r3
8001367c:	41414141 	cmpmi	r1, r1, asr #2
80013680:	41414141 	cmpmi	r1, r1, asr #2
80013684:	41414141 	cmpmi	r1, r1, asr #2
80013688:	41414141 	cmpmi	r1, r1, asr #2
8001368c:	41414141 	cmpmi	r1, r1, asr #2
80013690:	41414142 	cmpmi	r1, r2, asr #2
80013694:	41414141 	cmpmi	r1, r1, asr #2
80013698:	41414141 	cmpmi	r1, r1, asr #2
8001369c:	41414141 	cmpmi	r1, r1, asr #2
800136a0:	41414142 	cmpmi	r1, r2, asr #2
800136a4:	41414141 	cmpmi	r1, r1, asr #2
800136a8:	41414143 	cmpmi	r1, r3, asr #2
800136ac:	41414141 	cmpmi	r1, r1, asr #2
800136b0:	41414141 	cmpmi	r1, r1, asr #2
800136b4:	41414141 	cmpmi	r1, r1, asr #2
800136b8:	41414141 	cmpmi	r1, r1, asr #2
800136bc:	41414141 	cmpmi	r1, r1, asr #2
800136c0:	414d4841 	cmpmi	sp, r1, asr #16
800136c4:	41414141 	cmpmi	r1, r1, asr #2
800136c8:	41444c41 	cmpmi	r4, r1, asr #24
800136cc:	41414141 	cmpmi	r1, r1, asr #2
800136d0:	4141414a 	cmpmi	r1, sl, asr #2
800136d4:	41414141 	cmpmi	r1, r1, asr #2
800136d8:	41414343 	cmpmi	r1, r3, asr #6
800136dc:	41414141 	cmpmi	r1, r1, asr #2
800136e0:	41414145 	cmpmi	r1, r5, asr #2
800136e4:	41414141 	cmpmi	r1, r1, asr #2
800136e8:	41414241 	cmpmi	r1, r1, asr #4
800136ec:	41414141 	cmpmi	r1, r1, asr #2
800136f0:	4141414a 	cmpmi	r1, sl, asr #2
800136f4:	41414141 	cmpmi	r1, r1, asr #2
800136f8:	41414144 	cmpmi	r1, r4, asr #2
800136fc:	41414141 	cmpmi	r1, r1, asr #2
80013700:	41414141 	cmpmi	r1, r1, asr #2
80013704:	41414141 	cmpmi	r1, r1, asr #2
80013708:	41414141 	cmpmi	r1, r1, asr #2
8001370c:	41414141 	cmpmi	r1, r1, asr #2
80013710:	42414341 	submi	r4, r1, #67108865	@ 0x4000001
80013714:	41414141 	cmpmi	r1, r1, asr #2
80013718:	4142454e 	cmpmi	r2, lr, asr #10
8001371c:	41414141 	cmpmi	r1, r1, asr #2
80013720:	41414141 	cmpmi	r1, r1, asr #2
80013724:	41414141 	cmpmi	r1, r1, asr #2
80013728:	41414141 	cmpmi	r1, r1, asr #2
8001372c:	41414141 	cmpmi	r1, r1, asr #2
80013730:	41414142 	cmpmi	r1, r2, asr #2
80013734:	41414141 	cmpmi	r1, r1, asr #2
80013738:	41414141 	cmpmi	r1, r1, asr #2
8001373c:	41414141 	cmpmi	r1, r1, asr #2
80013740:	41414242 	cmpmi	r1, r2, asr #4
80013744:	41414141 	cmpmi	r1, r1, asr #2
80013748:	41414144 	cmpmi	r1, r4, asr #2
8001374c:	41414141 	cmpmi	r1, r1, asr #2
80013750:	41414141 	cmpmi	r1, r1, asr #2
80013754:	41414141 	cmpmi	r1, r1, asr #2
80013758:	41414141 	cmpmi	r1, r1, asr #2
8001375c:	41414141 	cmpmi	r1, r1, asr #2
80013760:	4242474e 	submi	r4, r2, #20447232	@ 0x1380000
80013764:	41414141 	cmpmi	r1, r1, asr #2
80013768:	4141464c 	cmpmi	r1, ip, asr #12
8001376c:	41414141 	cmpmi	r1, r1, asr #2
80013770:	41414141 	cmpmi	r1, r1, asr #2
80013774:	41414141 	cmpmi	r1, r1, asr #2
80013778:	41414141 	cmpmi	r1, r1, asr #2
8001377c:	41414141 	cmpmi	r1, r1, asr #2
80013780:	41414142 	cmpmi	r1, r2, asr #2
80013784:	41414141 	cmpmi	r1, r1, asr #2
80013788:	41414141 	cmpmi	r1, r1, asr #2
8001378c:	41414141 	cmpmi	r1, r1, asr #2
80013790:	00000000 	andeq	r0, r0, r0
80013794:	45464850 	strbmi	r4, [r6, #-2128]	@ 0xfffff7b0
80013798:	4547454d 	strbmi	r4, [r7, #-1357]	@ 0xfffffab3
8001379c:	41424142 	cmpmi	r2, r2, asr #2
800137a0:	41414142 	cmpmi	r1, r2, asr #2
800137a4:	41414141 	cmpmi	r1, r1, asr #2
800137a8:	41414141 	cmpmi	r1, r1, asr #2
800137ac:	41414141 	cmpmi	r1, r1, asr #2
800137b0:	41414141 	cmpmi	r1, r1, asr #2
800137b4:	41414143 	cmpmi	r1, r3, asr #2
800137b8:	41414349 	cmpmi	r1, r9, asr #6
800137bc:	41414142 	cmpmi	r1, r2, asr #2
800137c0:	41414141 	cmpmi	r1, r1, asr #2
800137c4:	41424141 	cmpmi	r2, r1, asr #2
800137c8:	41414141 	cmpmi	r1, r1, asr #2
800137cc:	41414445 	cmpmi	r1, r5, asr #8
800137d0:	41414141 	cmpmi	r1, r1, asr #2
800137d4:	4150454d 	cmpmi	r0, sp, asr #10
800137d8:	41414141 	cmpmi	r1, r1, asr #2
800137dc:	41434141 	cmpmi	r3, r1, asr #2
800137e0:	41464141 	cmpmi	r6, r1, asr #2
800137e4:	41414445 	cmpmi	r1, r5, asr #8
800137e8:	41414341 	cmpmi	r1, r1, asr #6
800137ec:	41414143 	cmpmi	r1, r3, asr #2
800137f0:	41414349 	cmpmi	r1, r9, asr #6
800137f4:	4141414c 	cmpmi	r1, ip, asr #2
800137f8:	4141414b 	cmpmi	r1, fp, asr #2
800137fc:	41414142 	cmpmi	r1, r2, asr #2
80013800:	41414141 	cmpmi	r1, r1, asr #2
80013804:	41414141 	cmpmi	r1, r1, asr #2
80013808:	41414141 	cmpmi	r1, r1, asr #2
8001380c:	41414141 	cmpmi	r1, r1, asr #2
80013810:	41414141 	cmpmi	r1, r1, asr #2
80013814:	41414141 	cmpmi	r1, r1, asr #2
80013818:	41414141 	cmpmi	r1, r1, asr #2
8001381c:	414b4242 	cmpmi	fp, r2, asr #4
80013820:	41414141 	cmpmi	r1, r1, asr #2
80013824:	414b4242 	cmpmi	fp, r2, asr #4
80013828:	41414141 	cmpmi	r1, r1, asr #2
8001382c:	41414146 	cmpmi	r1, r6, asr #2
80013830:	41414141 	cmpmi	r1, r1, asr #2
80013834:	42414141 	submi	r4, r1, #1073741840	@ 0x40000010
80013838:	41414141 	cmpmi	r1, r1, asr #2
8001383c:	41414142 	cmpmi	r1, r2, asr #2
80013840:	41414141 	cmpmi	r1, r1, asr #2
80013844:	414b4245 	cmpmi	fp, r5, asr #4
80013848:	41414141 	cmpmi	r1, r1, asr #2
8001384c:	424b4245 	submi	r4, fp, #1342177284	@ 0x50000004
80013850:	41414141 	cmpmi	r1, r1, asr #2
80013854:	424b4245 	submi	r4, fp, #1342177284	@ 0x50000004
80013858:	41414141 	cmpmi	r1, r1, asr #2
8001385c:	41414241 	cmpmi	r1, r1, asr #4
80013860:	41414141 	cmpmi	r1, r1, asr #2
80013864:	41414241 	cmpmi	r1, r1, asr #4
80013868:	41414141 	cmpmi	r1, r1, asr #2
8001386c:	41414147 	cmpmi	r1, r7, asr #2
80013870:	41414141 	cmpmi	r1, r1, asr #2
80013874:	42414141 	submi	r4, r1, #1073741840	@ 0x40000010
80013878:	41414141 	cmpmi	r1, r1, asr #2
8001387c:	41414141 	cmpmi	r1, r1, asr #2
80013880:	41414141 	cmpmi	r1, r1, asr #2
80013884:	41414141 	cmpmi	r1, r1, asr #2
80013888:	41414141 	cmpmi	r1, r1, asr #2
8001388c:	41414141 	cmpmi	r1, r1, asr #2
80013890:	41414141 	cmpmi	r1, r1, asr #2
80013894:	41414141 	cmpmi	r1, r1, asr #2
80013898:	41414141 	cmpmi	r1, r1, asr #2
8001389c:	41414141 	cmpmi	r1, r1, asr #2
800138a0:	41414141 	cmpmi	r1, r1, asr #2
800138a4:	41414141 	cmpmi	r1, r1, asr #2
800138a8:	41414141 	cmpmi	r1, r1, asr #2
800138ac:	41414141 	cmpmi	r1, r1, asr #2
800138b0:	41414141 	cmpmi	r1, r1, asr #2
800138b4:	41414141 	cmpmi	r1, r1, asr #2
800138b8:	41414141 	cmpmi	r1, r1, asr #2
800138bc:	41414141 	cmpmi	r1, r1, asr #2
800138c0:	41414141 	cmpmi	r1, r1, asr #2
800138c4:	41414141 	cmpmi	r1, r1, asr #2
800138c8:	41414141 	cmpmi	r1, r1, asr #2
800138cc:	41414141 	cmpmi	r1, r1, asr #2
800138d0:	41414141 	cmpmi	r1, r1, asr #2
800138d4:	41414141 	cmpmi	r1, r1, asr #2
800138d8:	41414141 	cmpmi	r1, r1, asr #2
800138dc:	41414141 	cmpmi	r1, r1, asr #2
800138e0:	41414141 	cmpmi	r1, r1, asr #2
800138e4:	41414141 	cmpmi	r1, r1, asr #2
800138e8:	41414141 	cmpmi	r1, r1, asr #2
800138ec:	41414141 	cmpmi	r1, r1, asr #2
800138f0:	41414141 	cmpmi	r1, r1, asr #2
800138f4:	41414141 	cmpmi	r1, r1, asr #2
800138f8:	41414141 	cmpmi	r1, r1, asr #2
800138fc:	41414141 	cmpmi	r1, r1, asr #2
80013900:	41414141 	cmpmi	r1, r1, asr #2
80013904:	41414141 	cmpmi	r1, r1, asr #2
80013908:	41414141 	cmpmi	r1, r1, asr #2
8001390c:	41414141 	cmpmi	r1, r1, asr #2
80013910:	41414141 	cmpmi	r1, r1, asr #2
80013914:	41414141 	cmpmi	r1, r1, asr #2
80013918:	41414141 	cmpmi	r1, r1, asr #2
8001391c:	41414141 	cmpmi	r1, r1, asr #2
80013920:	41414141 	cmpmi	r1, r1, asr #2
80013924:	41414141 	cmpmi	r1, r1, asr #2
80013928:	41414141 	cmpmi	r1, r1, asr #2
8001392c:	41414141 	cmpmi	r1, r1, asr #2
80013930:	41414141 	cmpmi	r1, r1, asr #2
80013934:	41414141 	cmpmi	r1, r1, asr #2
80013938:	41414141 	cmpmi	r1, r1, asr #2
8001393c:	41414141 	cmpmi	r1, r1, asr #2
80013940:	41414141 	cmpmi	r1, r1, asr #2
80013944:	41414141 	cmpmi	r1, r1, asr #2
80013948:	41414141 	cmpmi	r1, r1, asr #2
8001394c:	41414141 	cmpmi	r1, r1, asr #2
80013950:	41414141 	cmpmi	r1, r1, asr #2
80013954:	41414141 	cmpmi	r1, r1, asr #2
80013958:	41414141 	cmpmi	r1, r1, asr #2
8001395c:	41414141 	cmpmi	r1, r1, asr #2
80013960:	41414141 	cmpmi	r1, r1, asr #2
80013964:	41414141 	cmpmi	r1, r1, asr #2
80013968:	41414141 	cmpmi	r1, r1, asr #2
8001396c:	41414141 	cmpmi	r1, r1, asr #2
80013970:	41414141 	cmpmi	r1, r1, asr #2
80013974:	41414141 	cmpmi	r1, r1, asr #2
80013978:	41414141 	cmpmi	r1, r1, asr #2
8001397c:	41414141 	cmpmi	r1, r1, asr #2
80013980:	41414141 	cmpmi	r1, r1, asr #2
80013984:	41414141 	cmpmi	r1, r1, asr #2
80013988:	41414141 	cmpmi	r1, r1, asr #2
8001398c:	41414141 	cmpmi	r1, r1, asr #2
80013990:	41414141 	cmpmi	r1, r1, asr #2
80013994:	4d41414e 	stclmi	1, cr4, [r1, #-312]	@ 0xfffffec8
80013998:	4f424b41 	svcmi	0x00424b41
8001399c:	4e494241 	cdpmi	2, 4, cr4, cr9, cr1, {2}
800139a0:	4f4a434e 	svcmi	0x004a434e
800139a4:	4c414145 	mcrrmi	1, 4, r4, r1, cr5
800139a8:	4f43454d 	svcmi	0x0043454d
800139ac:	4e41414d 	cdpmi	1, 4, cr4, cr1, cr13, {2}
800139b0:	4f43454e 	svcmi	0x0043454e
800139b4:	45414545 	strbmi	r4, [r1, #-1349]	@ 0xfffffabb
800139b8:	4f464a50 	svcmi	0x00464a50
800139bc:	45414145 	strbmi	r4, [r1, #-325]	@ 0xfffffebb
800139c0:	4f414950 	svcmi	0x00414950
800139c4:	44414141 	strbmi	r4, [r1], #-321	@ 0xfffffebf
800139c8:	4f444b41 	svcmi	0x00444b41
800139cc:	44414249 	strbmi	r4, [r1], #-585	@ 0xfffffdb7
800139d0:	4f46414c 	svcmi	0x0046414c
800139d4:	44414141 	strbmi	r4, [r1], #-321	@ 0xfffffebf
800139d8:	4f444b41 	svcmi	0x00444b41
800139dc:	4441424d 	strbmi	r4, [r1], #-589	@ 0xfffffdb3
800139e0:	4f46414c 	svcmi	0x0046414c
800139e4:	41414742 	cmpmi	r1, r2, asr #14
800139e8:	4f4c4141 	svcmi	0x004c4141
800139ec:	4141424d 	cmpmi	r1, sp, asr #4
800139f0:	4f46414c 	svcmi	0x0046414c
800139f4:	41414648 	cmpmi	r1, r8, asr #12
800139f8:	4f4c4141 	svcmi	0x004c4141
800139fc:	41414249 	cmpmi	r1, r9, asr #4
80013a00:	4f46414c 	svcmi	0x0046414c
80013a04:	4441424d 	strbmi	r4, [r1], #-589	@ 0xfffffdb3
80013a08:	4f46424c 	svcmi	0x0046424c
80013a0c:	43414249 	movtmi	r4, #4681	@ 0x1249
80013a10:	4f46424c 	svcmi	0x0046424c
80013a14:	42414249 	submi	r4, r1, #-1879048188	@ 0x90000004
80013a18:	4f464a50 	svcmi	0x00464a50
80013a1c:	42414142 	submi	r4, r1, #-2147483632	@ 0x80000010
80013a20:	4f414950 	svcmi	0x00414950
80013a24:	41414245 	cmpmi	r1, r5, asr #4
80013a28:	4f464a50 	svcmi	0x00464a50
80013a2c:	41414141 	cmpmi	r1, r1, asr #2
80013a30:	4f484a45 	svcmi	0x00484a45
80013a34:	4141484d 	cmpmi	r1, sp, asr #16
80013a38:	4f4c4141 	svcmi	0x004c4141
80013a3c:	41414141 	cmpmi	r1, r1, asr #2
80013a40:	4f444b41 	svcmi	0x00444b41
80013a44:	41414543 	cmpmi	r1, r3, asr #10
80013a48:	4f4c4141 	svcmi	0x004c4141
80013a4c:	42495049 	submi	r5, r9, #73	@ 0x49
80013a50:	41414141 	cmpmi	r1, r1, asr #2
80013a54:	41494441 	cmpmi	r9, r1, asr #8
80013a58:	41414141 	cmpmi	r1, r1, asr #2
80013a5c:	4141414d 	cmpmi	r1, sp, asr #2
80013a60:	41414141 	cmpmi	r1, r1, asr #2
80013a64:	4d41414e 	stclmi	1, cr4, [r1, #-312]	@ 0xfffffec8
80013a68:	4f424b41 	svcmi	0x00424b41
80013a6c:	4e494141 	cdpmi	1, 4, cr4, cr9, cr1, {2}
80013a70:	4f4a434e 	svcmi	0x004a434e
80013a74:	4c414145 	mcrrmi	1, 4, r4, r1, cr5
80013a78:	4f43454d 	svcmi	0x0043454d
80013a7c:	4e414241 	cdpmi	2, 4, cr4, cr1, cr1, {2}
80013a80:	4f43454e 	svcmi	0x0043454e
80013a84:	44414141 	strbmi	r4, [r1], #-321	@ 0xfffffebf
80013a88:	4f424b41 	svcmi	0x00424b41
80013a8c:	44414246 	strbmi	r4, [r1], #-582	@ 0xfffffdba
80013a90:	4f46454c 	svcmi	0x0046454c
80013a94:	41414246 	cmpmi	r1, r6, asr #4
80013a98:	4f46424c 	svcmi	0x0046424c
80013a9c:	41414141 	cmpmi	r1, r1, asr #2
80013aa0:	4f504141 	svcmi	0x00504141
80013aa4:	41414241 	cmpmi	r1, r1, asr #4
80013aa8:	4f46414c 	svcmi	0x0046414c
80013aac:	44414241 	strbmi	r4, [r1], #-577	@ 0xfffffdbf
80013ab0:	4f46424c 	svcmi	0x0046424c
80013ab4:	41414144 	cmpmi	r1, r4, asr #2
80013ab8:	4f424b41 	svcmi	0x00424b41
80013abc:	4e41414d 	cdpmi	1, 4, cr4, cr1, cr13, {2}
80013ac0:	4f43454c 	svcmi	0x0043454c
80013ac4:	4b494141 	blmi	81263fd0 <irq_stack_start+0x1209fc0>
80013ac8:	4f494a4e 	svcmi	0x00494a4e
80013acc:	4d41414e 	stclmi	1, cr4, [r1, #-312]	@ 0xfffffec8
80013ad0:	4f424b41 	svcmi	0x00424b41
80013ad4:	4e494141 	cdpmi	1, 4, cr4, cr9, cr1, {2}
80013ad8:	4f4a434e 	svcmi	0x004a434e
80013adc:	4c414145 	mcrrmi	1, 4, r4, r1, cr5
80013ae0:	4f43454d 	svcmi	0x0043454d
80013ae4:	4e414241 	cdpmi	2, 4, cr4, cr1, cr1, {2}
80013ae8:	4f43454e 	svcmi	0x0043454e
80013aec:	44414141 	strbmi	r4, [r1], #-321	@ 0xfffffebf
80013af0:	4f424b41 	svcmi	0x00424b41
80013af4:	4241424d 	submi	r4, r1, #-805306364	@ 0xd0000004
80013af8:	4f46414c 	svcmi	0x0046414c
80013afc:	44414246 	strbmi	r4, [r1], #-582	@ 0xfffffdba
80013b00:	4f46454c 	svcmi	0x0046454c
80013b04:	41414246 	cmpmi	r1, r6, asr #4
80013b08:	4f46424c 	svcmi	0x0046424c
80013b0c:	4241424d 	submi	r4, r1, #-805306364	@ 0xd0000004
80013b10:	4f46424c 	svcmi	0x0046424c
80013b14:	41414141 	cmpmi	r1, r1, asr #2
80013b18:	4f504141 	svcmi	0x00504141
80013b1c:	41414241 	cmpmi	r1, r1, asr #4
80013b20:	4f46414c 	svcmi	0x0046414c
80013b24:	44414241 	strbmi	r4, [r1], #-577	@ 0xfffffdbf
80013b28:	4f46424c 	svcmi	0x0046424c
80013b2c:	41414144 	cmpmi	r1, r4, asr #2
80013b30:	4f424b41 	svcmi	0x00424b41
80013b34:	4e41414d 	cdpmi	1, 4, cr4, cr1, cr13, {2}
80013b38:	4f43454c 	svcmi	0x0043454c
80013b3c:	4b494141 	blmi	81264048 <irq_stack_start+0x120a038>
80013b40:	4f494a4e 	svcmi	0x00494a4e
80013b44:	4d41414e 	stclmi	1, cr4, [r1, #-312]	@ 0xfffffec8
80013b48:	4f424b41 	svcmi	0x00424b41
80013b4c:	4e494141 	cdpmi	1, 4, cr4, cr9, cr1, {2}
80013b50:	4f4a434e 	svcmi	0x004a434e
80013b54:	4c414145 	mcrrmi	1, 4, r4, r1, cr5
80013b58:	4f43454d 	svcmi	0x0043454d
80013b5c:	4e414249 	cdpmi	2, 4, cr4, cr1, cr9, {2}
80013b60:	4f43454e 	svcmi	0x0043454e
80013b64:	44414141 	strbmi	r4, [r1], #-321	@ 0xfffffebf
80013b68:	4f424b41 	svcmi	0x00424b41
80013b6c:	4241424d 	submi	r4, r1, #-805306364	@ 0xd0000004
80013b70:	4f46414c 	svcmi	0x0046414c
80013b74:	43414341 	movtmi	r4, #4929	@ 0x1341
80013b78:	4f46414c 	svcmi	0x0046414c
80013b7c:	44414246 	strbmi	r4, [r1], #-582	@ 0xfffffdba
80013b80:	4f46454c 	svcmi	0x0046454c
80013b84:	41414246 	cmpmi	r1, r6, asr #4
80013b88:	4f46424c 	svcmi	0x0046424c
80013b8c:	4241424d 	submi	r4, r1, #-805306364	@ 0xd0000004
80013b90:	4f46424c 	svcmi	0x0046424c
80013b94:	43414341 	movtmi	r4, #4929	@ 0x1341
80013b98:	4f46424c 	svcmi	0x0046424c
80013b9c:	41414141 	cmpmi	r1, r1, asr #2
80013ba0:	4f504141 	svcmi	0x00504141
80013ba4:	41414241 	cmpmi	r1, r1, asr #4
80013ba8:	4f46414c 	svcmi	0x0046414c
80013bac:	44414241 	strbmi	r4, [r1], #-577	@ 0xfffffdbf
80013bb0:	4f46424c 	svcmi	0x0046424c
80013bb4:	41414144 	cmpmi	r1, r4, asr #2
80013bb8:	4f424b41 	svcmi	0x00424b41
80013bbc:	4e41414d 	cdpmi	1, 4, cr4, cr1, cr13, {2}
80013bc0:	4f43454c 	svcmi	0x0043454c
80013bc4:	4b494141 	blmi	812640d0 <irq_stack_start+0x120a0c0>
80013bc8:	4f494a4e 	svcmi	0x00494a4e
80013bcc:	4d41414e 	stclmi	1, cr4, [r1, #-312]	@ 0xfffffec8
80013bd0:	4f424b41 	svcmi	0x00424b41
80013bd4:	4e494141 	cdpmi	1, 4, cr4, cr9, cr1, {2}
80013bd8:	4f4a434e 	svcmi	0x004a434e
80013bdc:	4c414145 	mcrrmi	1, 4, r4, r1, cr5
80013be0:	4f43454d 	svcmi	0x0043454d
80013be4:	4e414149 	cdpmi	1, 4, cr4, cr1, cr9, {2}
80013be8:	4f43454e 	svcmi	0x0043454e
80013bec:	41414241 	cmpmi	r1, r1, asr #4
80013bf0:	4f46414c 	svcmi	0x0046414c
80013bf4:	42414241 	submi	r4, r1, #268435460	@ 0x10000004
80013bf8:	4f46424c 	svcmi	0x0046424c
80013bfc:	41414141 	cmpmi	r1, r1, asr #2
80013c00:	4f444b41 	svcmi	0x00444b41
80013c04:	50504e48 	subspl	r4, r0, r8, asr #28
80013c08:	4f4c5050 	svcmi	0x004c5050
80013c0c:	50414141 	subpl	r4, r1, r1, asr #2
80013c10:	4f444341 	svcmi	0x00444341
80013c14:	4e41414d 	cdpmi	1, 4, cr4, cr1, cr13, {2}
80013c18:	4f43454c 	svcmi	0x0043454c
80013c1c:	4b494141 	blmi	81264128 <irq_stack_start+0x120a118>
80013c20:	4f494a4e 	svcmi	0x00494a4e
80013c24:	4d41414e 	stclmi	1, cr4, [r1, #-312]	@ 0xfffffec8
80013c28:	4f424b41 	svcmi	0x00424b41
80013c2c:	4e494141 	cdpmi	1, 4, cr4, cr9, cr1, {2}
80013c30:	4f4a434e 	svcmi	0x004a434e
80013c34:	4c414145 	mcrrmi	1, 4, r4, r1, cr5
80013c38:	4f43454d 	svcmi	0x0043454d
80013c3c:	41414142 	cmpmi	r1, r2, asr #2
80013c40:	4f444b41 	svcmi	0x00444b41
80013c44:	50504d43 	subspl	r4, r0, r3, asr #26
80013c48:	4f4c5050 	svcmi	0x004c5050
80013c4c:	44414141 	strbmi	r4, [r1], #-321	@ 0xfffffebf
80013c50:	4f424b41 	svcmi	0x00424b41
80013c54:	41414144 	cmpmi	r1, r4, asr #2
80013c58:	4f424b41 	svcmi	0x00424b41
80013c5c:	4b494141 	blmi	81264168 <irq_stack_start+0x120a158>
80013c60:	4f494a4e 	svcmi	0x00494a4e
80013c64:	4d41414e 	stclmi	1, cr4, [r1, #-312]	@ 0xfffffec8
80013c68:	4f424b41 	svcmi	0x00424b41
80013c6c:	4e494141 	cdpmi	1, 4, cr4, cr9, cr1, {2}
80013c70:	4f4a434e 	svcmi	0x004a434e
80013c74:	4c414145 	mcrrmi	1, 4, r4, r1, cr5
80013c78:	4f43454d 	svcmi	0x0043454d
80013c7c:	4e414149 	cdpmi	1, 4, cr4, cr1, cr9, {2}
80013c80:	4f43454e 	svcmi	0x0043454e
80013c84:	41414241 	cmpmi	r1, r1, asr #4
80013c88:	4f46414c 	svcmi	0x0046414c
80013c8c:	42414241 	submi	r4, r1, #268435460	@ 0x10000004
80013c90:	4f46424c 	svcmi	0x0046424c
80013c94:	41414143 	cmpmi	r1, r3, asr #2
80013c98:	4f444b41 	svcmi	0x00444b41
80013c9c:	50504d45 	subspl	r4, r0, r5, asr #26
80013ca0:	4f4c5050 	svcmi	0x004c5050
80013ca4:	50414141 	subpl	r4, r1, r1, asr #2
80013ca8:	4f444341 	svcmi	0x00444341
80013cac:	4e41414d 	cdpmi	1, 4, cr4, cr1, cr13, {2}
80013cb0:	4f43454c 	svcmi	0x0043454c
80013cb4:	4b494141 	blmi	812641c0 <irq_stack_start+0x120a1b0>
80013cb8:	4f494a4e 	svcmi	0x00494a4e
80013cbc:	4d41414e 	stclmi	1, cr4, [r1, #-312]	@ 0xfffffec8
80013cc0:	4f424b41 	svcmi	0x00424b41
80013cc4:	4e494141 	cdpmi	1, 4, cr4, cr9, cr1, {2}
80013cc8:	4f4a434e 	svcmi	0x004a434e
80013ccc:	4c414145 	mcrrmi	1, 4, r4, r1, cr5
80013cd0:	4f43454d 	svcmi	0x0043454d
80013cd4:	41414144 	cmpmi	r1, r4, asr #2
80013cd8:	4f444b41 	svcmi	0x00444b41
80013cdc:	50504b50 	subspl	r4, r0, r0, asr fp
80013ce0:	4f4c5050 	svcmi	0x004c5050
80013ce4:	44414141 	strbmi	r4, [r1], #-321	@ 0xfffffebf
80013ce8:	4f424b41 	svcmi	0x00424b41
80013cec:	41414144 	cmpmi	r1, r4, asr #2
80013cf0:	4f424b41 	svcmi	0x00424b41
80013cf4:	4b494141 	blmi	81264200 <irq_stack_start+0x120a1f0>
80013cf8:	4f494a4e 	svcmi	0x00494a4e
80013cfc:	4d41414e 	stclmi	1, cr4, [r1, #-312]	@ 0xfffffec8
80013d00:	4f424b41 	svcmi	0x00424b41
80013d04:	4e494141 	cdpmi	1, 4, cr4, cr9, cr1, {2}
80013d08:	4f4a434e 	svcmi	0x004a434e
80013d0c:	4c414145 	mcrrmi	1, 4, r4, r1, cr5
80013d10:	4f43454d 	svcmi	0x0043454d
80013d14:	41414145 	cmpmi	r1, r5, asr #2
80013d18:	4f444b41 	svcmi	0x00444b41
80013d1c:	50504b48 	subspl	r4, r0, r8, asr #22
80013d20:	4f4c5050 	svcmi	0x004c5050
80013d24:	44414141 	strbmi	r4, [r1], #-321	@ 0xfffffebf
80013d28:	4f424b41 	svcmi	0x00424b41
80013d2c:	41414144 	cmpmi	r1, r4, asr #2
80013d30:	4f424b41 	svcmi	0x00424b41
80013d34:	4b494141 	blmi	81264240 <irq_stack_start+0x120a230>
80013d38:	4f494a4e 	svcmi	0x00494a4e
80013d3c:	4d41414e 	stclmi	1, cr4, [r1, #-312]	@ 0xfffffec8
80013d40:	4f424b41 	svcmi	0x00424b41
80013d44:	4e494141 	cdpmi	1, 4, cr4, cr9, cr1, {2}
80013d48:	4f4a434e 	svcmi	0x004a434e
80013d4c:	4c414145 	mcrrmi	1, 4, r4, r1, cr5
80013d50:	4f43454d 	svcmi	0x0043454d
80013d54:	4e414149 	cdpmi	1, 4, cr4, cr1, cr9, {2}
80013d58:	4f43454e 	svcmi	0x0043454e
80013d5c:	41414241 	cmpmi	r1, r1, asr #4
80013d60:	4f46414c 	svcmi	0x0046414c
80013d64:	42414241 	submi	r4, r1, #268435460	@ 0x10000004
80013d68:	4f46424c 	svcmi	0x0046424c
80013d6c:	41414146 	cmpmi	r1, r6, asr #2
80013d70:	4f444b41 	svcmi	0x00444b41
80013d74:	50504b4a 	subspl	r4, r0, sl, asr #22
80013d78:	4f4c5050 	svcmi	0x004c5050
80013d7c:	50414141 	subpl	r4, r1, r1, asr #2
80013d80:	4f444341 	svcmi	0x00444341
80013d84:	4e41414d 	cdpmi	1, 4, cr4, cr1, cr13, {2}
80013d88:	4f43454c 	svcmi	0x0043454c
80013d8c:	4b494141 	blmi	81264298 <irq_stack_start+0x120a288>
80013d90:	4f494a4e 	svcmi	0x00494a4e
80013d94:	4d41414e 	stclmi	1, cr4, [r1, #-312]	@ 0xfffffec8
80013d98:	4f424b41 	svcmi	0x00424b41
80013d9c:	4e494141 	cdpmi	1, 4, cr4, cr9, cr1, {2}
80013da0:	4f4a434e 	svcmi	0x004a434e
80013da4:	4c414145 	mcrrmi	1, 4, r4, r1, cr5
80013da8:	4f43454d 	svcmi	0x0043454d
80013dac:	41414147 	cmpmi	r1, r7, asr #2
80013db0:	4f444b41 	svcmi	0x00444b41
80013db4:	50504a45 	subspl	r4, r0, r5, asr #20
80013db8:	4f4c5050 	svcmi	0x004c5050
80013dbc:	50414141 	subpl	r4, r1, r1, asr #2
80013dc0:	4f444341 	svcmi	0x00444341
80013dc4:	4b494141 	blmi	812642d0 <irq_stack_start+0x120a2c0>
80013dc8:	4f494a4e 	svcmi	0x00494a4e
80013dcc:	4d41414e 	stclmi	1, cr4, [r1, #-312]	@ 0xfffffec8
80013dd0:	4f424b41 	svcmi	0x00424b41
80013dd4:	4e494141 	cdpmi	1, 4, cr4, cr9, cr1, {2}
80013dd8:	4f4a434e 	svcmi	0x004a434e
80013ddc:	4c414145 	mcrrmi	1, 4, r4, r1, cr5
80013de0:	4f43454d 	svcmi	0x0043454d
80013de4:	4e414149 	cdpmi	1, 4, cr4, cr1, cr9, {2}
80013de8:	4f43454e 	svcmi	0x0043454e
80013dec:	41414241 	cmpmi	r1, r1, asr #4
80013df0:	4f46414c 	svcmi	0x0046414c
80013df4:	42414241 	submi	r4, r1, #268435460	@ 0x10000004
80013df8:	4f46424c 	svcmi	0x0046424c
80013dfc:	41414148 	cmpmi	r1, r8, asr #2
80013e00:	4f444b41 	svcmi	0x00444b41
80013e04:	50504a48 	subspl	r4, r0, r8, asr #20
80013e08:	4f4c5050 	svcmi	0x004c5050
80013e0c:	50414141 	subpl	r4, r1, r1, asr #2
80013e10:	4f444341 	svcmi	0x00444341
80013e14:	4e41414d 	cdpmi	1, 4, cr4, cr1, cr13, {2}
80013e18:	4f43454c 	svcmi	0x0043454c
80013e1c:	4b494141 	blmi	81264328 <irq_stack_start+0x120a318>
80013e20:	4f494a4e 	svcmi	0x00494a4e
80013e24:	4d41414e 	stclmi	1, cr4, [r1, #-312]	@ 0xfffffec8
80013e28:	4f424b41 	svcmi	0x00424b41
80013e2c:	4141414f 	cmpmi	r1, pc, asr #2
80013e30:	4f4a434e 	svcmi	0x004a434e
80013e34:	4e494141 	cdpmi	1, 4, cr4, cr9, cr1, {2}
80013e38:	4f4a434e 	svcmi	0x004a434e
80013e3c:	4c414241 	mcrrmi	2, 4, r4, r1, cr1
80013e40:	4f43454d 	svcmi	0x0043454d
80013e44:	4e504548 	cdpmi	5, 5, cr4, cr0, cr8, {2}
80013e48:	4f43454e 	svcmi	0x0043454e
80013e4c:	41424345 	cmpmi	r2, r5, asr #6
80013e50:	4f46414c 	svcmi	0x0046414c
80013e54:	44414141 	strbmi	r4, [r1], #-321	@ 0xfffffebf
80013e58:	4f444b41 	svcmi	0x00444b41
80013e5c:	44414249 	strbmi	r4, [r1], #-585	@ 0xfffffdb7
80013e60:	4f46414c 	svcmi	0x0046414c
80013e64:	44414141 	strbmi	r4, [r1], #-321	@ 0xfffffebf
80013e68:	4f444b41 	svcmi	0x00444b41
80013e6c:	44414245 	strbmi	r4, [r1], #-581	@ 0xfffffdbb
80013e70:	4f46414c 	svcmi	0x0046414c
80013e74:	44414149 	strbmi	r4, [r1], #-329	@ 0xfffffeb7
80013e78:	4f43494c 	svcmi	0x0043494c
80013e7c:	4442424d 	strbmi	r4, [r2], #-589	@ 0xfffffdb3
80013e80:	4f46414c 	svcmi	0x0046414c
80013e84:	44504547 	ldrbmi	r4, [r0], #-1351	@ 0xfffffab9
80013e88:	4f43454c 	svcmi	0x0043454c
80013e8c:	4342424d 	movtmi	r4, #8781	@ 0x224d
80013e90:	4f46424c 	svcmi	0x0046424c
80013e94:	42414145 	submi	r4, r1, #1073741841	@ 0x40000011
80013e98:	4f464a4c 	svcmi	0x00464a4c
80013e9c:	41414144 	cmpmi	r1, r4, asr #2
80013ea0:	4f424b41 	svcmi	0x00424b41
80013ea4:	41414247 	cmpmi	r1, r7, asr #4
80013ea8:	4f4c4141 	svcmi	0x004c4141
80013eac:	41414249 	cmpmi	r1, r9, asr #4
80013eb0:	4f46414c 	svcmi	0x0046414c
80013eb4:	4141414b 	cmpmi	r1, fp, asr #2
80013eb8:	4f4b4141 	svcmi	0x004b4141
80013ebc:	43504547 	cmpmi	r0, #297795584	@ 0x11c00000
80013ec0:	4f43454c 	svcmi	0x0043454c
80013ec4:	44414245 	strbmi	r4, [r1], #-581	@ 0xfffffdbb
80013ec8:	4f46424c 	svcmi	0x0046424c
80013ecc:	44414144 	strbmi	r4, [r1], #-324	@ 0xfffffebc
80013ed0:	4f414943 	svcmi	0x00414943
80013ed4:	44414141 	strbmi	r4, [r1], #-321	@ 0xfffffebf
80013ed8:	4f464e44 	svcmi	0x00464e44
80013edc:	43414144 	movtmi	r4, #4420	@ 0x1144
80013ee0:	4f424b41 	svcmi	0x00424b41
80013ee4:	44424345 	strbmi	r4, [r2], #-837	@ 0xfffffcbb
80013ee8:	4f46424c 	svcmi	0x0046424c
80013eec:	41414143 	cmpmi	r1, r3, asr #2
80013ef0:	4f424b41 	svcmi	0x00424b41
80013ef4:	50504444 	subspl	r4, r0, r4, asr #8
80013ef8:	4f424350 	svcmi	0x00424350
80013efc:	44414245 	strbmi	r4, [r1], #-581	@ 0xfffffdbb
80013f00:	4f46424c 	svcmi	0x0046424c
80013f04:	44414142 	strbmi	r4, [r1], #-322	@ 0xfffffebe
80013f08:	4f434944 	svcmi	0x00434944
80013f0c:	44414245 	strbmi	r4, [r1], #-581	@ 0xfffffdbb
80013f10:	4f46414c 	svcmi	0x0046414c
80013f14:	43504547 	cmpmi	r0, #297795584	@ 0x11c00000
80013f18:	4f43454c 	svcmi	0x0043454c
80013f1c:	44414245 	strbmi	r4, [r1], #-581	@ 0xfffffdbb
80013f20:	4f46424c 	svcmi	0x0046424c
80013f24:	44414144 	strbmi	r4, [r1], #-324	@ 0xfffffebc
80013f28:	4f414943 	svcmi	0x00414943
80013f2c:	44414141 	strbmi	r4, [r1], #-321	@ 0xfffffebf
80013f30:	4f464e44 	svcmi	0x00464e44
80013f34:	41414141 	cmpmi	r1, r1, asr #2
80013f38:	4f444644 	svcmi	0x00444644
80013f3c:	50504f4f 	subspl	r4, r0, pc, asr #30
80013f40:	424b5050 	submi	r5, fp, #80	@ 0x50
80013f44:	44414249 	strbmi	r4, [r1], #-585	@ 0xfffffdb7
80013f48:	4f46424c 	svcmi	0x0046424c
80013f4c:	41414144 	cmpmi	r1, r4, asr #2
80013f50:	4f424b41 	svcmi	0x00424b41
80013f54:	4e41414d 	cdpmi	1, 4, cr4, cr1, cr13, {2}
80013f58:	4f43454c 	svcmi	0x0043454c
80013f5c:	4b494141 	blmi	81264468 <irq_stack_start+0x120a458>
80013f60:	4f494a4e 	svcmi	0x00494a4e
80013f64:	4d41414e 	stclmi	1, cr4, [r1, #-312]	@ 0xfffffec8
80013f68:	4f424b41 	svcmi	0x00424b41
80013f6c:	4e494141 	cdpmi	1, 4, cr4, cr9, cr1, {2}
80013f70:	4f4a434e 	svcmi	0x004a434e
80013f74:	4c414145 	mcrrmi	1, 4, r4, r1, cr5
80013f78:	4f43454d 	svcmi	0x0043454d
80013f7c:	4e414441 	cdpmi	4, 4, cr4, cr1, cr1, {2}
80013f80:	4f43454e 	svcmi	0x0043454e
80013f84:	41414441 	cmpmi	r1, r1, asr #8
80013f88:	4f46414c 	svcmi	0x0046414c
80013f8c:	42414445 	submi	r4, r1, #1157627904	@ 0x45000000
80013f90:	4f46414c 	svcmi	0x0046414c
80013f94:	43414449 	movtmi	r4, #5193	@ 0x1449
80013f98:	4f46414c 	svcmi	0x0046414c
80013f9c:	44414141 	strbmi	r4, [r1], #-321	@ 0xfffffebf
80013fa0:	4f444b41 	svcmi	0x00444b41
80013fa4:	44414241 	strbmi	r4, [r1], #-577	@ 0xfffffdbf
80013fa8:	4f46414c 	svcmi	0x0046414c
80013fac:	44414141 	strbmi	r4, [r1], #-321	@ 0xfffffebf
80013fb0:	4f444b41 	svcmi	0x00444b41
80013fb4:	44414245 	strbmi	r4, [r1], #-581	@ 0xfffffdbb
80013fb8:	4f46414c 	svcmi	0x0046414c
80013fbc:	41414a47 	cmpmi	r1, r7, asr #20
80013fc0:	4f4b4141 	svcmi	0x004b4141
80013fc4:	44414141 	strbmi	r4, [r1], #-321	@ 0xfffffebf
80013fc8:	4f444b41 	svcmi	0x00444b41
80013fcc:	44414246 	strbmi	r4, [r1], #-582	@ 0xfffffdba
80013fd0:	4f46454c 	svcmi	0x0046454c
80013fd4:	4141414e 	cmpmi	r1, lr, asr #2
80013fd8:	4f4b4141 	svcmi	0x004b4141
80013fdc:	44414241 	strbmi	r4, [r1], #-577	@ 0xfffffdbf
80013fe0:	4f46424c 	svcmi	0x0046424c
80013fe4:	43414445 	movtmi	r4, #5189	@ 0x1445
80013fe8:	4f46424c 	svcmi	0x0046424c
80013fec:	43414144 	movtmi	r4, #4420	@ 0x1144
80013ff0:	4f414943 	svcmi	0x00414943
80013ff4:	44414245 	strbmi	r4, [r1], #-581	@ 0xfffffdbb
80013ff8:	4f46424c 	svcmi	0x0046424c
80013ffc:	42414441 	submi	r4, r1, #1090519040	@ 0x41000000
80014000:	4f46424c 	svcmi	0x0046424c
80014004:	44414144 	strbmi	r4, [r1], #-324	@ 0xfffffebc
80014008:	4f414942 	svcmi	0x00414942
8001400c:	43414141 	movtmi	r4, #4417	@ 0x1141
80014010:	4f464e43 	svcmi	0x00464e43
80014014:	43414141 	movtmi	r4, #4417	@ 0x1141
80014018:	4f464d44 	svcmi	0x00464d44
8001401c:	44414245 	strbmi	r4, [r1], #-581	@ 0xfffffdbb
80014020:	4f46424c 	svcmi	0x0046424c
80014024:	44414142 	strbmi	r4, [r1], #-322	@ 0xfffffebe
80014028:	4f434944 	svcmi	0x00434944
8001402c:	44414245 	strbmi	r4, [r1], #-581	@ 0xfffffdbb
80014030:	4f46414c 	svcmi	0x0046414c
80014034:	44414241 	strbmi	r4, [r1], #-577	@ 0xfffffdbf
80014038:	4f46424c 	svcmi	0x0046424c
8001403c:	44414142 	strbmi	r4, [r1], #-322	@ 0xfffffebe
80014040:	4f434944 	svcmi	0x00434944
80014044:	44414241 	strbmi	r4, [r1], #-577	@ 0xfffffdbf
80014048:	4f46414c 	svcmi	0x0046414c
8001404c:	44414241 	strbmi	r4, [r1], #-577	@ 0xfffffdbf
80014050:	4f46424c 	svcmi	0x0046424c
80014054:	43414445 	movtmi	r4, #5189	@ 0x1445
80014058:	4f46424c 	svcmi	0x0046424c
8001405c:	44414144 	strbmi	r4, [r1], #-324	@ 0xfffffebc
80014060:	4f414943 	svcmi	0x00414943
80014064:	44414141 	strbmi	r4, [r1], #-321	@ 0xfffffebf
80014068:	4f464e44 	svcmi	0x00464e44
8001406c:	41414346 	cmpmi	r1, r6, asr #6
80014070:	4f444644 	svcmi	0x00444644
80014074:	41414146 	cmpmi	r1, r6, asr #2
80014078:	414b4141 	cmpmi	fp, r1, asr #2
8001407c:	44414241 	strbmi	r4, [r1], #-577	@ 0xfffffdbf
80014080:	4f46424c 	svcmi	0x0046424c
80014084:	43414445 	movtmi	r4, #5189	@ 0x1445
80014088:	4f46424c 	svcmi	0x0046424c
8001408c:	44414144 	strbmi	r4, [r1], #-324	@ 0xfffffebc
80014090:	4f414943 	svcmi	0x00414943
80014094:	44414141 	strbmi	r4, [r1], #-321	@ 0xfffffebf
80014098:	4f464e44 	svcmi	0x00464e44
8001409c:	41414141 	cmpmi	r1, r1, asr #2
800140a0:	4f444644 	svcmi	0x00444644
800140a4:	50504f46 	subspl	r4, r0, r6, asr #30
800140a8:	424b5050 	submi	r5, fp, #80	@ 0x50
800140ac:	44414241 	strbmi	r4, [r1], #-577	@ 0xfffffdbf
800140b0:	4f46424c 	svcmi	0x0046424c
800140b4:	43414445 	movtmi	r4, #5189	@ 0x1445
800140b8:	4f46424c 	svcmi	0x0046424c
800140bc:	44414144 	strbmi	r4, [r1], #-324	@ 0xfffffebc
800140c0:	4f414943 	svcmi	0x00414943
800140c4:	44414141 	strbmi	r4, [r1], #-321	@ 0xfffffebf
800140c8:	4f464e44 	svcmi	0x00464e44
800140cc:	41414141 	cmpmi	r1, r1, asr #2
800140d0:	4f444644 	svcmi	0x00444644
800140d4:	4141484a 	cmpmi	r1, sl, asr #16
800140d8:	414b4141 	cmpmi	fp, r1, asr #2
800140dc:	44414241 	strbmi	r4, [r1], #-577	@ 0xfffffdbf
800140e0:	4f46424c 	svcmi	0x0046424c
800140e4:	44414142 	strbmi	r4, [r1], #-322	@ 0xfffffebe
800140e8:	4f434944 	svcmi	0x00434944
800140ec:	43414445 	movtmi	r4, #5189	@ 0x1445
800140f0:	4f46424c 	svcmi	0x0046424c
800140f4:	44414144 	strbmi	r4, [r1], #-324	@ 0xfffffebc
800140f8:	4f414943 	svcmi	0x00414943
800140fc:	44414141 	strbmi	r4, [r1], #-321	@ 0xfffffebf
80014100:	4f464e44 	svcmi	0x00464e44
80014104:	41414141 	cmpmi	r1, r1, asr #2
80014108:	4f444644 	svcmi	0x00444644
8001410c:	41414843 	cmpmi	r1, r3, asr #16
80014110:	414b4141 	cmpmi	fp, r1, asr #2
80014114:	44414241 	strbmi	r4, [r1], #-577	@ 0xfffffdbf
80014118:	4f46424c 	svcmi	0x0046424c
8001411c:	44414142 	strbmi	r4, [r1], #-322	@ 0xfffffebe
80014120:	4f434944 	svcmi	0x00434944
80014124:	43414445 	movtmi	r4, #5189	@ 0x1445
80014128:	4f46424c 	svcmi	0x0046424c
8001412c:	44414144 	strbmi	r4, [r1], #-324	@ 0xfffffebc
80014130:	4f414943 	svcmi	0x00414943
80014134:	44414141 	strbmi	r4, [r1], #-321	@ 0xfffffebf
80014138:	4f464e44 	svcmi	0x00464e44
8001413c:	44414246 	strbmi	r4, [r1], #-582	@ 0xfffffdba
80014140:	4f46454c 	svcmi	0x0046454c
80014144:	44414246 	strbmi	r4, [r1], #-582	@ 0xfffffdba
80014148:	4f46464c 	svcmi	0x0046464c
8001414c:	44414744 	strbmi	r4, [r1], #-1860	@ 0xfffff8bc
80014150:	4f434544 	svcmi	0x00434544
80014154:	43424d49 	movtmi	r4, #11593	@ 0x2d49
80014158:	4f464a50 	svcmi	0x00464a50
8001415c:	43414143 	movtmi	r4, #4419	@ 0x1143
80014160:	4f414950 	svcmi	0x00414950
80014164:	41414246 	cmpmi	r1, r6, asr #4
80014168:	4f444644 	svcmi	0x00444644
8001416c:	4141464e 	cmpmi	r1, lr, asr #12
80014170:	494b4141 	stmdbmi	fp, {r0, r6, r8, lr}^
80014174:	44424144 	strbmi	r4, [r2], #-324	@ 0xfffffebc
80014178:	4f484a43 	svcmi	0x00484a43
8001417c:	50414144 	subpl	r4, r1, r4, asr #2
80014180:	4f414950 	svcmi	0x00414950
80014184:	50414141 	subpl	r4, r1, r1, asr #2
80014188:	4f444341 	svcmi	0x00444341
8001418c:	44414449 	strbmi	r4, [r1], #-1097	@ 0xfffffbb7
80014190:	4f46424c 	svcmi	0x0046424c
80014194:	43414145 	movtmi	r4, #4421	@ 0x1145
80014198:	4f434944 	svcmi	0x00434944
8001419c:	43414449 	movtmi	r4, #5193	@ 0x1449
800141a0:	4f46414c 	svcmi	0x0046414c
800141a4:	44414141 	strbmi	r4, [r1], #-321	@ 0xfffffebf
800141a8:	4f464a44 	svcmi	0x00464a44
800141ac:	44414345 	strbmi	r4, [r1], #-837	@ 0xfffffcbb
800141b0:	4f46414c 	svcmi	0x0046414c
800141b4:	44414245 	strbmi	r4, [r1], #-581	@ 0xfffffdbb
800141b8:	4f46424c 	svcmi	0x0046424c
800141bc:	43414441 	movtmi	r4, #5185	@ 0x1441
800141c0:	4f46424c 	svcmi	0x0046424c
800141c4:	44414144 	strbmi	r4, [r1], #-324	@ 0xfffffebc
800141c8:	4f414943 	svcmi	0x00414943
800141cc:	42414345 	submi	r4, r1, #335544321	@ 0x14000001
800141d0:	4f46424c 	svcmi	0x0046424c
800141d4:	41414144 	cmpmi	r1, r4, asr #2
800141d8:	4f424b41 	svcmi	0x00424b41
800141dc:	41414744 	cmpmi	r1, r4, asr #14
800141e0:	4f4c4141 	svcmi	0x004c4141
800141e4:	43414141 	movtmi	r4, #4417	@ 0x1141
800141e8:	4f424b41 	svcmi	0x00424b41
800141ec:	44414245 	strbmi	r4, [r1], #-581	@ 0xfffffdbb
800141f0:	4f46424c 	svcmi	0x0046424c
800141f4:	44414143 	strbmi	r4, [r1], #-323	@ 0xfffffebd
800141f8:	4f414944 	svcmi	0x00414944
800141fc:	44414245 	strbmi	r4, [r1], #-581	@ 0xfffffdbb
80014200:	4f46414c 	svcmi	0x0046414c
80014204:	4141454b 	cmpmi	r1, fp, asr #10
80014208:	4f4b4141 	svcmi	0x004b4141
8001420c:	44414449 	strbmi	r4, [r1], #-1097	@ 0xfffffbb7
80014210:	4f46424c 	svcmi	0x0046424c
80014214:	43414145 	movtmi	r4, #4421	@ 0x1145
80014218:	4f434944 	svcmi	0x00434944
8001421c:	43414449 	movtmi	r4, #5193	@ 0x1449
80014220:	4f46414c 	svcmi	0x0046414c
80014224:	42414141 	submi	r4, r1, #1073741840	@ 0x40000010
80014228:	4f464a44 	svcmi	0x00464a44
8001422c:	44414245 	strbmi	r4, [r1], #-581	@ 0xfffffdbb
80014230:	4f46424c 	svcmi	0x0046424c
80014234:	43414441 	movtmi	r4, #5185	@ 0x1441
80014238:	4f46424c 	svcmi	0x0046424c
8001423c:	44414144 	strbmi	r4, [r1], #-324	@ 0xfffffebc
80014240:	4f414943 	svcmi	0x00414943
80014244:	43414842 	movtmi	r4, #6210	@ 0x1842
80014248:	4f474f50 	svcmi	0x00474f50
8001424c:	43414141 	movtmi	r4, #4417	@ 0x1141
80014250:	4f464d44 	svcmi	0x00464d44
80014254:	44414245 	strbmi	r4, [r1], #-581	@ 0xfffffdbb
80014258:	4f46424c 	svcmi	0x0046424c
8001425c:	44414142 	strbmi	r4, [r1], #-322	@ 0xfffffebe
80014260:	4f434944 	svcmi	0x00434944
80014264:	44414245 	strbmi	r4, [r1], #-581	@ 0xfffffdbb
80014268:	4f46414c 	svcmi	0x0046414c
8001426c:	4141444e 	cmpmi	r1, lr, asr #8
80014270:	4f4b4141 	svcmi	0x004b4141
80014274:	44414449 	strbmi	r4, [r1], #-1097	@ 0xfffffbb7
80014278:	4f46424c 	svcmi	0x0046424c
8001427c:	43414145 	movtmi	r4, #4421	@ 0x1145
80014280:	4f434944 	svcmi	0x00434944
80014284:	43414449 	movtmi	r4, #5193	@ 0x1449
80014288:	4f46414c 	svcmi	0x0046414c
8001428c:	44414141 	strbmi	r4, [r1], #-321	@ 0xfffffebf
80014290:	4f464a44 	svcmi	0x00464a44
80014294:	44414349 	strbmi	r4, [r1], #-841	@ 0xfffffcb7
80014298:	4f46414c 	svcmi	0x0046414c
8001429c:	44414245 	strbmi	r4, [r1], #-581	@ 0xfffffdbb
800142a0:	4f46424c 	svcmi	0x0046424c
800142a4:	43414441 	movtmi	r4, #5185	@ 0x1441
800142a8:	4f46424c 	svcmi	0x0046424c
800142ac:	44414144 	strbmi	r4, [r1], #-324	@ 0xfffffebc
800142b0:	4f414943 	svcmi	0x00414943
800142b4:	42414349 	submi	r4, r1, #603979777	@ 0x24000001
800142b8:	4f46424c 	svcmi	0x0046424c
800142bc:	41414144 	cmpmi	r1, r4, asr #2
800142c0:	4f424b41 	svcmi	0x00424b41
800142c4:	4141474a 	cmpmi	r1, sl, asr #14
800142c8:	4f4c4141 	svcmi	0x004c4141
800142cc:	43414141 	movtmi	r4, #4417	@ 0x1141
800142d0:	4f424b41 	svcmi	0x00424b41
800142d4:	44414245 	strbmi	r4, [r1], #-581	@ 0xfffffdbb
800142d8:	4f46424c 	svcmi	0x0046424c
800142dc:	44414143 	strbmi	r4, [r1], #-323	@ 0xfffffebd
800142e0:	4f414944 	svcmi	0x00414944
800142e4:	44414245 	strbmi	r4, [r1], #-581	@ 0xfffffdbb
800142e8:	4f46414c 	svcmi	0x0046414c
800142ec:	4141434e 	cmpmi	r1, lr, asr #6
800142f0:	4f4b4141 	svcmi	0x004b4141
800142f4:	44414449 	strbmi	r4, [r1], #-1097	@ 0xfffffbb7
800142f8:	4f46424c 	svcmi	0x0046424c
800142fc:	43414145 	movtmi	r4, #4421	@ 0x1145
80014300:	4f434944 	svcmi	0x00434944
80014304:	43414449 	movtmi	r4, #5193	@ 0x1449
80014308:	4f46414c 	svcmi	0x0046414c
8001430c:	44414141 	strbmi	r4, [r1], #-321	@ 0xfffffebf
80014310:	4f464a44 	svcmi	0x00464a44
80014314:	44414341 	strbmi	r4, [r1], #-833	@ 0xfffffcbf
80014318:	4f46414c 	svcmi	0x0046414c
8001431c:	44414245 	strbmi	r4, [r1], #-581	@ 0xfffffdbb
80014320:	4f46424c 	svcmi	0x0046424c
80014324:	43414441 	movtmi	r4, #5185	@ 0x1441
80014328:	4f46424c 	svcmi	0x0046424c
8001432c:	44414144 	strbmi	r4, [r1], #-324	@ 0xfffffebc
80014330:	4f414943 	svcmi	0x00414943
80014334:	4341414b 	movtmi	r4, #4427	@ 0x114b
80014338:	4f444b41 	svcmi	0x00444b41
8001433c:	42414341 	submi	r4, r1, #67108865	@ 0x4000001
80014340:	4f46424c 	svcmi	0x0046424c
80014344:	41414144 	cmpmi	r1, r4, asr #2
80014348:	4f424b41 	svcmi	0x00424b41
8001434c:	4141484f 	cmpmi	r1, pc, asr #16
80014350:	4f4c4141 	svcmi	0x004c4141
80014354:	43414141 	movtmi	r4, #4417	@ 0x1141
80014358:	4f424b41 	svcmi	0x00424b41
8001435c:	44414245 	strbmi	r4, [r1], #-581	@ 0xfffffdbb
80014360:	4f46424c 	svcmi	0x0046424c
80014364:	44414143 	strbmi	r4, [r1], #-323	@ 0xfffffebd
80014368:	4f414944 	svcmi	0x00414944
8001436c:	44414245 	strbmi	r4, [r1], #-581	@ 0xfffffdbb
80014370:	4f46414c 	svcmi	0x0046414c
80014374:	4141424d 	cmpmi	r1, sp, asr #4
80014378:	4f4b4141 	svcmi	0x004b4141
8001437c:	44414449 	strbmi	r4, [r1], #-1097	@ 0xfffffbb7
80014380:	4f46424c 	svcmi	0x0046424c
80014384:	43414145 	movtmi	r4, #4421	@ 0x1145
80014388:	4f434944 	svcmi	0x00434944
8001438c:	43414449 	movtmi	r4, #5193	@ 0x1449
80014390:	4f46414c 	svcmi	0x0046414c
80014394:	44414141 	strbmi	r4, [r1], #-321	@ 0xfffffebf
80014398:	4f464a44 	svcmi	0x00464a44
8001439c:	4441424d 	strbmi	r4, [r1], #-589	@ 0xfffffdb3
800143a0:	4f46414c 	svcmi	0x0046414c
800143a4:	44414245 	strbmi	r4, [r1], #-581	@ 0xfffffdbb
800143a8:	4f46424c 	svcmi	0x0046424c
800143ac:	43414441 	movtmi	r4, #5185	@ 0x1441
800143b0:	4f46424c 	svcmi	0x0046424c
800143b4:	44414144 	strbmi	r4, [r1], #-324	@ 0xfffffebc
800143b8:	4f414943 	svcmi	0x00414943
800143bc:	43414a49 	movtmi	r4, #6729	@ 0x1a49
800143c0:	4f464a50 	svcmi	0x00464a50
800143c4:	43414143 	movtmi	r4, #4419	@ 0x1143
800143c8:	4f414950 	svcmi	0x00414950
800143cc:	42414143 	submi	r4, r1, #-1073741808	@ 0xc0000010
800143d0:	4f424b41 	svcmi	0x00424b41
800143d4:	41414144 	cmpmi	r1, r4, asr #2
800143d8:	4f424b41 	svcmi	0x00424b41
800143dc:	41414344 	cmpmi	r1, r4, asr #6
800143e0:	4f4c4141 	svcmi	0x004c4141
800143e4:	43414141 	movtmi	r4, #4417	@ 0x1141
800143e8:	4f424b41 	svcmi	0x00424b41
800143ec:	44414245 	strbmi	r4, [r1], #-581	@ 0xfffffdbb
800143f0:	4f46424c 	svcmi	0x0046424c
800143f4:	44414143 	strbmi	r4, [r1], #-323	@ 0xfffffebd
800143f8:	4f414944 	svcmi	0x00414944
800143fc:	44414245 	strbmi	r4, [r1], #-581	@ 0xfffffdbb
80014400:	4f46414c 	svcmi	0x0046414c
80014404:	44414245 	strbmi	r4, [r1], #-581	@ 0xfffffdbb
80014408:	4f46424c 	svcmi	0x0046424c
8001440c:	43414441 	movtmi	r4, #5185	@ 0x1441
80014410:	4f46424c 	svcmi	0x0046424c
80014414:	44414144 	strbmi	r4, [r1], #-324	@ 0xfffffebc
80014418:	4f414943 	svcmi	0x00414943
8001441c:	4241424d 	submi	r4, r1, #-805306364	@ 0xd0000004
80014420:	4f46424c 	svcmi	0x0046424c
80014424:	43414241 	movtmi	r4, #4673	@ 0x1241
80014428:	4f444b41 	svcmi	0x00444b41
8001442c:	41414144 	cmpmi	r1, r4, asr #2
80014430:	4f424b41 	svcmi	0x00424b41
80014434:	41414742 	cmpmi	r1, r2, asr #14
80014438:	4f4c4141 	svcmi	0x004c4141
8001443c:	43414141 	movtmi	r4, #4417	@ 0x1141
80014440:	4f424b41 	svcmi	0x00424b41
80014444:	44414245 	strbmi	r4, [r1], #-581	@ 0xfffffdbb
80014448:	4f46424c 	svcmi	0x0046424c
8001444c:	44414143 	strbmi	r4, [r1], #-323	@ 0xfffffebd
80014450:	4f414944 	svcmi	0x00414944
80014454:	44414245 	strbmi	r4, [r1], #-581	@ 0xfffffdbb
80014458:	4f46414c 	svcmi	0x0046414c
8001445c:	50414141 	subpl	r4, r1, r1, asr #2
80014460:	4f444341 	svcmi	0x00444341
80014464:	44414241 	strbmi	r4, [r1], #-577	@ 0xfffffdbf
80014468:	4f46424c 	svcmi	0x0046424c
8001446c:	44414143 	strbmi	r4, [r1], #-323	@ 0xfffffebd
80014470:	4f434944 	svcmi	0x00434944
80014474:	44414241 	strbmi	r4, [r1], #-577	@ 0xfffffdbf
80014478:	4f46414c 	svcmi	0x0046414c
8001447c:	44414241 	strbmi	r4, [r1], #-577	@ 0xfffffdbf
80014480:	4f46424c 	svcmi	0x0046424c
80014484:	43414445 	movtmi	r4, #5189	@ 0x1445
80014488:	4f46424c 	svcmi	0x0046424c
8001448c:	44414144 	strbmi	r4, [r1], #-324	@ 0xfffffebc
80014490:	4f414943 	svcmi	0x00414943
80014494:	44414141 	strbmi	r4, [r1], #-321	@ 0xfffffebf
80014498:	4f464e44 	svcmi	0x00464e44
8001449c:	41414141 	cmpmi	r1, r1, asr #2
800144a0:	4f444644 	svcmi	0x00444644
800144a4:	50504743 	subspl	r4, r0, r3, asr #14
800144a8:	424b5050 	submi	r5, fp, #80	@ 0x50
800144ac:	44414245 	strbmi	r4, [r1], #-581	@ 0xfffffdbb
800144b0:	4f46424c 	svcmi	0x0046424c
800144b4:	43414441 	movtmi	r4, #5185	@ 0x1441
800144b8:	4f46424c 	svcmi	0x0046424c
800144bc:	44414144 	strbmi	r4, [r1], #-324	@ 0xfffffebc
800144c0:	4f414943 	svcmi	0x00414943
800144c4:	43414141 	movtmi	r4, #4417	@ 0x1141
800144c8:	4f444b41 	svcmi	0x00444b41
800144cc:	43414141 	movtmi	r4, #4417	@ 0x1141
800144d0:	4f464d44 	svcmi	0x00464d44
800144d4:	44414245 	strbmi	r4, [r1], #-581	@ 0xfffffdbb
800144d8:	4f46424c 	svcmi	0x0046424c
800144dc:	41414144 	cmpmi	r1, r4, asr #2
800144e0:	4f424b41 	svcmi	0x00424b41
800144e4:	4e41414d 	cdpmi	1, 4, cr4, cr1, cr13, {2}
800144e8:	4f43454c 	svcmi	0x0043454c
800144ec:	4b494141 	blmi	812649f8 <irq_stack_start+0x120a9e8>
800144f0:	4f494a4e 	svcmi	0x00494a4e
800144f4:	41454c4d 	cmpmi	r5, sp, asr #24
800144f8:	41414141 	cmpmi	r1, r1, asr #2
800144fc:	41444945 	cmpmi	r4, r5, asr #18
80014500:	41414141 	cmpmi	r1, r1, asr #2
80014504:	4d41414e 	stclmi	1, cr4, [r1, #-312]	@ 0xfffffec8
80014508:	4f424b41 	svcmi	0x00424b41
8001450c:	4e494141 	cdpmi	1, 4, cr4, cr9, cr1, {2}
80014510:	4f4a434e 	svcmi	0x004a434e
80014514:	4c414145 	mcrrmi	1, 4, r4, r1, cr5
80014518:	4f43454d 	svcmi	0x0043454d
8001451c:	4e414241 	cdpmi	2, 4, cr4, cr1, cr1, {2}
80014520:	4f43454e 	svcmi	0x0043454e
80014524:	41414249 	cmpmi	r1, r9, asr #4
80014528:	4f46414c 	svcmi	0x0046414c
8001452c:	4241424d 	submi	r4, r1, #-805306364	@ 0xd0000004
80014530:	4f46414c 	svcmi	0x0046414c
80014534:	44414141 	strbmi	r4, [r1], #-321	@ 0xfffffebf
80014538:	4f444b41 	svcmi	0x00444b41
8001453c:	44414241 	strbmi	r4, [r1], #-577	@ 0xfffffdbf
80014540:	4f46414c 	svcmi	0x0046414c
80014544:	44414141 	strbmi	r4, [r1], #-321	@ 0xfffffebf
80014548:	4f444b41 	svcmi	0x00444b41
8001454c:	44414245 	strbmi	r4, [r1], #-581	@ 0xfffffdbb
80014550:	4f46414c 	svcmi	0x0046414c
80014554:	4141414e 	cmpmi	r1, lr, asr #2
80014558:	4f4b4141 	svcmi	0x004b4141
8001455c:	44414245 	strbmi	r4, [r1], #-581	@ 0xfffffdbb
80014560:	4f46424c 	svcmi	0x0046424c
80014564:	4341424d 	movtmi	r4, #4685	@ 0x124d
80014568:	4f46424c 	svcmi	0x0046424c
8001456c:	43414144 	movtmi	r4, #4420	@ 0x1144
80014570:	4f414943 	svcmi	0x00414943
80014574:	44414241 	strbmi	r4, [r1], #-577	@ 0xfffffdbf
80014578:	4f46424c 	svcmi	0x0046424c
8001457c:	42414249 	submi	r4, r1, #-1879048188	@ 0x90000004
80014580:	4f46424c 	svcmi	0x0046424c
80014584:	44414144 	strbmi	r4, [r1], #-324	@ 0xfffffebc
80014588:	4f414942 	svcmi	0x00414942
8001458c:	43414141 	movtmi	r4, #4417	@ 0x1141
80014590:	4f464e43 	svcmi	0x00464e43
80014594:	43414141 	movtmi	r4, #4417	@ 0x1141
80014598:	4f464d44 	svcmi	0x00464d44
8001459c:	44414241 	strbmi	r4, [r1], #-577	@ 0xfffffdbf
800145a0:	4f46424c 	svcmi	0x0046424c
800145a4:	44414142 	strbmi	r4, [r1], #-322	@ 0xfffffebe
800145a8:	4f434944 	svcmi	0x00434944
800145ac:	44414241 	strbmi	r4, [r1], #-577	@ 0xfffffdbf
800145b0:	4f46414c 	svcmi	0x0046414c
800145b4:	44414245 	strbmi	r4, [r1], #-581	@ 0xfffffdbb
800145b8:	4f46424c 	svcmi	0x0046424c
800145bc:	44414142 	strbmi	r4, [r1], #-322	@ 0xfffffebe
800145c0:	4f434944 	svcmi	0x00434944
800145c4:	44414245 	strbmi	r4, [r1], #-581	@ 0xfffffdbb
800145c8:	4f46414c 	svcmi	0x0046414c
800145cc:	44414245 	strbmi	r4, [r1], #-581	@ 0xfffffdbb
800145d0:	4f46424c 	svcmi	0x0046424c
800145d4:	4341424d 	movtmi	r4, #4685	@ 0x124d
800145d8:	4f46424c 	svcmi	0x0046424c
800145dc:	44414144 	strbmi	r4, [r1], #-324	@ 0xfffffebc
800145e0:	4f414943 	svcmi	0x00414943
800145e4:	44414141 	strbmi	r4, [r1], #-321	@ 0xfffffebf
800145e8:	4f464e44 	svcmi	0x00464e44
800145ec:	41414141 	cmpmi	r1, r1, asr #2
800145f0:	4f444644 	svcmi	0x00444644
800145f4:	50504f4c 	subspl	r4, r0, ip, asr #30
800145f8:	424b5050 	submi	r5, fp, #80	@ 0x50
800145fc:	44414245 	strbmi	r4, [r1], #-581	@ 0xfffffdbb
80014600:	4f46424c 	svcmi	0x0046424c
80014604:	41414144 	cmpmi	r1, r4, asr #2
80014608:	4f424b41 	svcmi	0x00424b41
8001460c:	4e41414d 	cdpmi	1, 4, cr4, cr1, cr13, {2}
80014610:	4f43454c 	svcmi	0x0043454c
80014614:	4b494141 	blmi	81264b20 <irq_stack_start+0x120ab10>
80014618:	4f494a4e 	svcmi	0x00494a4e
8001461c:	4d41414e 	stclmi	1, cr4, [r1, #-312]	@ 0xfffffec8
80014620:	4f424b41 	svcmi	0x00424b41
80014624:	4e494141 	cdpmi	1, 4, cr4, cr9, cr1, {2}
80014628:	4f4a434e 	svcmi	0x004a434e
8001462c:	4c414145 	mcrrmi	1, 4, r4, r1, cr5
80014630:	4f43454d 	svcmi	0x0043454d
80014634:	4e414241 	cdpmi	2, 4, cr4, cr1, cr1, {2}
80014638:	4f43454e 	svcmi	0x0043454e
8001463c:	41414249 	cmpmi	r1, r9, asr #4
80014640:	4f46414c 	svcmi	0x0046414c
80014644:	4241424d 	submi	r4, r1, #-805306364	@ 0xd0000004
80014648:	4f46414c 	svcmi	0x0046414c
8001464c:	44414141 	strbmi	r4, [r1], #-321	@ 0xfffffebf
80014650:	4f444b41 	svcmi	0x00444b41
80014654:	44414241 	strbmi	r4, [r1], #-577	@ 0xfffffdbf
80014658:	4f46414c 	svcmi	0x0046414c
8001465c:	4441424d 	strbmi	r4, [r1], #-589	@ 0xfffffdb3
80014660:	4f46424c 	svcmi	0x0046424c
80014664:	41414141 	cmpmi	r1, r1, asr #2
80014668:	4f444644 	svcmi	0x00444644
8001466c:	41414241 	cmpmi	r1, r1, asr #4
80014670:	4b4b4141 	blmi	812e4b7c <irq_stack_start+0x128ab6c>
80014674:	44414249 	strbmi	r4, [r1], #-585	@ 0xfffffdb7
80014678:	4f46424c 	svcmi	0x0046424c
8001467c:	4341434e 	movtmi	r4, #4942	@ 0x134e
80014680:	4f444b41 	svcmi	0x00444b41
80014684:	43414141 	movtmi	r4, #4417	@ 0x1141
80014688:	4f464d44 	svcmi	0x00464d44
8001468c:	44414142 	strbmi	r4, [r1], #-322	@ 0xfffffebe
80014690:	4f444b41 	svcmi	0x00444b41
80014694:	44414241 	strbmi	r4, [r1], #-577	@ 0xfffffdbf
80014698:	4f46414c 	svcmi	0x0046414c
8001469c:	44414249 	strbmi	r4, [r1], #-585	@ 0xfffffdb7
800146a0:	4f46424c 	svcmi	0x0046424c
800146a4:	41414142 	cmpmi	r1, r2, asr #2
800146a8:	4f434944 	svcmi	0x00434944
800146ac:	4441424d 	strbmi	r4, [r1], #-589	@ 0xfffffdb3
800146b0:	4f46424c 	svcmi	0x0046424c
800146b4:	44414141 	strbmi	r4, [r1], #-321	@ 0xfffffebf
800146b8:	4f434744 	svcmi	0x00434744
800146bc:	4341414b 	movtmi	r4, #4427	@ 0x114b
800146c0:	4f444b41 	svcmi	0x00444b41
800146c4:	42414144 	submi	r4, r1, #68, 2
800146c8:	4f424b41 	svcmi	0x00424b41
800146cc:	4141414f 	cmpmi	r1, pc, asr #2
800146d0:	4f4c4141 	svcmi	0x004c4141
800146d4:	43414141 	movtmi	r4, #4417	@ 0x1141
800146d8:	4f424b41 	svcmi	0x00424b41
800146dc:	44414241 	strbmi	r4, [r1], #-577	@ 0xfffffdbf
800146e0:	4f46424c 	svcmi	0x0046424c
800146e4:	44414143 	strbmi	r4, [r1], #-323	@ 0xfffffebd
800146e8:	4f414944 	svcmi	0x00414944
800146ec:	44414241 	strbmi	r4, [r1], #-577	@ 0xfffffdbf
800146f0:	4f46414c 	svcmi	0x0046414c
800146f4:	41414146 	cmpmi	r1, r6, asr #2
800146f8:	4f4b4141 	svcmi	0x004b4141
800146fc:	4441424d 	strbmi	r4, [r1], #-589	@ 0xfffffdb3
80014700:	4f46424c 	svcmi	0x0046424c
80014704:	4341414b 	movtmi	r4, #4427	@ 0x114b
80014708:	4f444b41 	svcmi	0x00444b41
8001470c:	42414144 	submi	r4, r1, #68, 2
80014710:	4f424b41 	svcmi	0x00424b41
80014714:	41414249 	cmpmi	r1, r9, asr #4
80014718:	4f46424c 	svcmi	0x0046424c
8001471c:	41414145 	cmpmi	r1, r5, asr #2
80014720:	4f4c4141 	svcmi	0x004c4141
80014724:	41414241 	cmpmi	r1, r1, asr #4
80014728:	4f46414c 	svcmi	0x0046414c
8001472c:	44414241 	strbmi	r4, [r1], #-577	@ 0xfffffdbf
80014730:	4f46424c 	svcmi	0x0046424c
80014734:	41414144 	cmpmi	r1, r4, asr #2
80014738:	4f424b41 	svcmi	0x00424b41
8001473c:	4e41414d 	cdpmi	1, 4, cr4, cr1, cr13, {2}
80014740:	4f43454c 	svcmi	0x0043454c
80014744:	4b494141 	blmi	81264c50 <irq_stack_start+0x120ac40>
80014748:	4f494a4e 	svcmi	0x00494a4e
8001474c:	4d41414e 	stclmi	1, cr4, [r1, #-312]	@ 0xfffffec8
80014750:	4f424b41 	svcmi	0x00424b41
80014754:	4e494141 	cdpmi	1, 4, cr4, cr9, cr1, {2}
80014758:	4f4a434e 	svcmi	0x004a434e
8001475c:	4c414145 	mcrrmi	1, 4, r4, r1, cr5
80014760:	4f43454d 	svcmi	0x0043454d
80014764:	4e414341 	cdpmi	3, 4, cr4, cr1, cr1, {2}
80014768:	4f43454e 	svcmi	0x0043454e
8001476c:	41414341 	cmpmi	r1, r1, asr #6
80014770:	4f46414c 	svcmi	0x0046414c
80014774:	42414345 	submi	r4, r1, #335544321	@ 0x14000001
80014778:	4f46414c 	svcmi	0x0046414c
8001477c:	43414349 	movtmi	r4, #4937	@ 0x1349
80014780:	4f46414c 	svcmi	0x0046414c
80014784:	44414141 	strbmi	r4, [r1], #-321	@ 0xfffffebf
80014788:	4f444b41 	svcmi	0x00444b41
8001478c:	44414241 	strbmi	r4, [r1], #-577	@ 0xfffffdbf
80014790:	4f46414c 	svcmi	0x0046414c
80014794:	44414141 	strbmi	r4, [r1], #-321	@ 0xfffffebf
80014798:	4f444b41 	svcmi	0x00444b41
8001479c:	44414249 	strbmi	r4, [r1], #-585	@ 0xfffffdb7
800147a0:	4f46414c 	svcmi	0x0046414c
800147a4:	44414141 	strbmi	r4, [r1], #-321	@ 0xfffffebf
800147a8:	4f444b41 	svcmi	0x00444b41
800147ac:	44414245 	strbmi	r4, [r1], #-581	@ 0xfffffdbb
800147b0:	4f46414c 	svcmi	0x0046414c
800147b4:	44414249 	strbmi	r4, [r1], #-585	@ 0xfffffdb7
800147b8:	4f43454c 	svcmi	0x0043454c
800147bc:	43414144 	movtmi	r4, #4420	@ 0x1144
800147c0:	4f424b41 	svcmi	0x00424b41
800147c4:	42414349 	submi	r4, r1, #603979777	@ 0x24000001
800147c8:	4f46424c 	svcmi	0x0046424c
800147cc:	41414345 	cmpmi	r1, r5, asr #6
800147d0:	4f46424c 	svcmi	0x0046424c
800147d4:	41414249 	cmpmi	r1, r9, asr #4
800147d8:	4f4c4141 	svcmi	0x004c4141
800147dc:	41414245 	cmpmi	r1, r5, asr #4
800147e0:	4f46414c 	svcmi	0x0046414c
800147e4:	44414245 	strbmi	r4, [r1], #-581	@ 0xfffffdbb
800147e8:	4f46424c 	svcmi	0x0046424c
800147ec:	41414141 	cmpmi	r1, r1, asr #2
800147f0:	4f444644 	svcmi	0x00444644
800147f4:	41414145 	cmpmi	r1, r5, asr #2
800147f8:	414b4141 	cmpmi	fp, r1, asr #2
800147fc:	43414349 	movtmi	r4, #4937	@ 0x1349
80014800:	4f46424c 	svcmi	0x0046424c
80014804:	42414245 	submi	r4, r1, #1342177284	@ 0x50000004
80014808:	4f46424c 	svcmi	0x0046424c
8001480c:	41414341 	cmpmi	r1, r1, asr #6
80014810:	4f46424c 	svcmi	0x0046424c
80014814:	50504f46 	subspl	r4, r0, r6, asr #30
80014818:	4f4c5050 	svcmi	0x004c5050
8001481c:	41414241 	cmpmi	r1, r1, asr #4
80014820:	4f46414c 	svcmi	0x0046414c
80014824:	43414249 	movtmi	r4, #4681	@ 0x1249
80014828:	4f46424c 	svcmi	0x0046424c
8001482c:	44414241 	strbmi	r4, [r1], #-577	@ 0xfffffdbf
80014830:	4f46424c 	svcmi	0x0046424c
80014834:	42414341 	submi	r4, r1, #67108865	@ 0x4000001
80014838:	4f46424c 	svcmi	0x0046424c
8001483c:	44414144 	strbmi	r4, [r1], #-324	@ 0xfffffebc
80014840:	4f414942 	svcmi	0x00414942
80014844:	42414345 	submi	r4, r1, #335544321	@ 0x14000001
80014848:	4f464a50 	svcmi	0x00464a50
8001484c:	42414142 	submi	r4, r1, #-2147483632	@ 0x80000010
80014850:	4f414950 	svcmi	0x00414950
80014854:	43414143 	movtmi	r4, #4419	@ 0x1143
80014858:	4f484e42 	svcmi	0x00484e42
8001485c:	43414141 	movtmi	r4, #4417	@ 0x1141
80014860:	4f464d44 	svcmi	0x00464d44
80014864:	44414241 	strbmi	r4, [r1], #-577	@ 0xfffffdbf
80014868:	4f46424c 	svcmi	0x0046424c
8001486c:	44414142 	strbmi	r4, [r1], #-322	@ 0xfffffebe
80014870:	4f434944 	svcmi	0x00434944
80014874:	44414241 	strbmi	r4, [r1], #-577	@ 0xfffffdbf
80014878:	4f46414c 	svcmi	0x0046414c
8001487c:	44414241 	strbmi	r4, [r1], #-577	@ 0xfffffdbf
80014880:	4f46424c 	svcmi	0x0046424c
80014884:	41414144 	cmpmi	r1, r4, asr #2
80014888:	4f424b41 	svcmi	0x00424b41
8001488c:	4e41414d 	cdpmi	1, 4, cr4, cr1, cr13, {2}
80014890:	4f43454c 	svcmi	0x0043454c
80014894:	4b494141 	blmi	81264da0 <irq_stack_start+0x120ad90>
80014898:	4f494a4e 	svcmi	0x00494a4e
8001489c:	41424a4d 	cmpmi	r2, sp, asr #20
800148a0:	41414141 	cmpmi	r1, r1, asr #2
800148a4:	4d41414e 	stclmi	1, cr4, [r1, #-312]	@ 0xfffffec8
800148a8:	4f424b41 	svcmi	0x00424b41
800148ac:	4e494141 	cdpmi	1, 4, cr4, cr9, cr1, {2}
800148b0:	4f4a434e 	svcmi	0x004a434e
800148b4:	4c414145 	mcrrmi	1, 4, r4, r1, cr5
800148b8:	4f43454d 	svcmi	0x0043454d
800148bc:	4e414341 	cdpmi	3, 4, cr4, cr1, cr1, {2}
800148c0:	4f43454e 	svcmi	0x0043454e
800148c4:	41414341 	cmpmi	r1, r1, asr #6
800148c8:	4f46414c 	svcmi	0x0046414c
800148cc:	42414345 	submi	r4, r1, #335544321	@ 0x14000001
800148d0:	4f46414c 	svcmi	0x0046414c
800148d4:	43414349 	movtmi	r4, #4937	@ 0x1349
800148d8:	4f46414c 	svcmi	0x0046414c
800148dc:	44414141 	strbmi	r4, [r1], #-321	@ 0xfffffebf
800148e0:	4f444b41 	svcmi	0x00444b41
800148e4:	44414241 	strbmi	r4, [r1], #-577	@ 0xfffffdbf
800148e8:	4f46414c 	svcmi	0x0046414c
800148ec:	44414141 	strbmi	r4, [r1], #-321	@ 0xfffffebf
800148f0:	4f444b41 	svcmi	0x00444b41
800148f4:	44414245 	strbmi	r4, [r1], #-581	@ 0xfffffdbb
800148f8:	4f46414c 	svcmi	0x0046414c
800148fc:	44414141 	strbmi	r4, [r1], #-321	@ 0xfffffebf
80014900:	4f444b41 	svcmi	0x00444b41
80014904:	44414249 	strbmi	r4, [r1], #-585	@ 0xfffffdb7
80014908:	4f46414c 	svcmi	0x0046414c
8001490c:	44414250 	strbmi	r4, [r1], #-592	@ 0xfffffdb0
80014910:	4f444b41 	svcmi	0x00444b41
80014914:	44414241 	strbmi	r4, [r1], #-577	@ 0xfffffdbf
80014918:	4f46414c 	svcmi	0x0046414c
8001491c:	41414250 	cmpmi	r1, r0, asr r2
80014920:	4f4b4141 	svcmi	0x004b4141
80014924:	43414142 	movtmi	r4, #4418	@ 0x1142
80014928:	4f444b41 	svcmi	0x00444b41
8001492c:	44414241 	strbmi	r4, [r1], #-577	@ 0xfffffdbf
80014930:	4f46424c 	svcmi	0x0046424c
80014934:	43444243 	movtmi	r4, #16963	@ 0x4243
80014938:	4f424b41 	svcmi	0x00424b41
8001493c:	44414341 	strbmi	r4, [r1], #-833	@ 0xfffffcbf
80014940:	4f46424c 	svcmi	0x0046424c
80014944:	44414143 	strbmi	r4, [r1], #-323	@ 0xfffffebd
80014948:	4f414144 	svcmi	0x00414144
8001494c:	41414141 	cmpmi	r1, r1, asr #2
80014950:	4f444644 	svcmi	0x00444644
80014954:	44414142 	strbmi	r4, [r1], #-322	@ 0xfffffebe
80014958:	42444b41 	submi	r4, r4, #66560	@ 0x10400
8001495c:	44414141 	strbmi	r4, [r1], #-321	@ 0xfffffebf
80014960:	41444b41 	cmpmi	r4, r1, asr #22
80014964:	44414844 	strbmi	r4, [r1], #-2116	@ 0xfffff7bc
80014968:	4f474f50 	svcmi	0x00474f50
8001496c:	4441424d 	strbmi	r4, [r1], #-589	@ 0xfffffdb3
80014970:	4f46414c 	svcmi	0x0046414c
80014974:	44414249 	strbmi	r4, [r1], #-585	@ 0xfffffdb7
80014978:	4f46424c 	svcmi	0x0046424c
8001497c:	44414944 	strbmi	r4, [r1], #-2372	@ 0xfffff6bc
80014980:	4f424b41 	svcmi	0x00424b41
80014984:	4341424d 	movtmi	r4, #4685	@ 0x124d
80014988:	4f46424c 	svcmi	0x0046424c
8001498c:	44414144 	strbmi	r4, [r1], #-324	@ 0xfffffebc
80014990:	4f424943 	svcmi	0x00424943
80014994:	44414249 	strbmi	r4, [r1], #-585	@ 0xfffffdb7
80014998:	4f46414c 	svcmi	0x0046414c
8001499c:	43414249 	movtmi	r4, #4681	@ 0x1249
800149a0:	4f46424c 	svcmi	0x0046424c
800149a4:	44414345 	strbmi	r4, [r1], #-837	@ 0xfffffcbb
800149a8:	4f46424c 	svcmi	0x0046424c
800149ac:	41414144 	cmpmi	r1, r4, asr #2
800149b0:	4f424643 	svcmi	0x00424643
800149b4:	4141414a 	cmpmi	r1, sl, asr #2
800149b8:	444b4141 	strbmi	r4, [fp], #-321	@ 0xfffffebf
800149bc:	43414249 	movtmi	r4, #4681	@ 0x1249
800149c0:	4f46424c 	svcmi	0x0046424c
800149c4:	44414345 	strbmi	r4, [r1], #-837	@ 0xfffffcbb
800149c8:	4f46424c 	svcmi	0x0046424c
800149cc:	44414144 	strbmi	r4, [r1], #-324	@ 0xfffffebc
800149d0:	4f414543 	svcmi	0x00414543
800149d4:	44414249 	strbmi	r4, [r1], #-585	@ 0xfffffdb7
800149d8:	4f46414c 	svcmi	0x0046414c
800149dc:	43414142 	movtmi	r4, #4418	@ 0x1142
800149e0:	4f444b41 	svcmi	0x00444b41
800149e4:	44414241 	strbmi	r4, [r1], #-577	@ 0xfffffdbf
800149e8:	4f46424c 	svcmi	0x0046424c
800149ec:	44444243 	strbmi	r4, [r4], #-579	@ 0xfffffdbd
800149f0:	4f424b41 	svcmi	0x00424b41
800149f4:	43414245 	movtmi	r4, #4677	@ 0x1245
800149f8:	4f46424c 	svcmi	0x0046424c
800149fc:	44414144 	strbmi	r4, [r1], #-324	@ 0xfffffebc
80014a00:	4f424943 	svcmi	0x00424943
80014a04:	44414245 	strbmi	r4, [r1], #-581	@ 0xfffffdbb
80014a08:	4f46414c 	svcmi	0x0046414c
80014a0c:	44414241 	strbmi	r4, [r1], #-577	@ 0xfffffdbf
80014a10:	4f46424c 	svcmi	0x0046424c
80014a14:	44414142 	strbmi	r4, [r1], #-322	@ 0xfffffebe
80014a18:	4f434544 	svcmi	0x00434544
80014a1c:	44414241 	strbmi	r4, [r1], #-577	@ 0xfffffdbf
80014a20:	4f46414c 	svcmi	0x0046414c
80014a24:	44414241 	strbmi	r4, [r1], #-577	@ 0xfffffdbf
80014a28:	4f46424c 	svcmi	0x0046424c
80014a2c:	41414141 	cmpmi	r1, r1, asr #2
80014a30:	4f444644 	svcmi	0x00444644
80014a34:	50504e4d 	subspl	r4, r0, sp, asr #28
80014a38:	4b4b5050 	blmi	812e8b80 <irq_stack_start+0x128eb70>
80014a3c:	44414349 	strbmi	r4, [r1], #-841	@ 0xfffffcb7
80014a40:	4f46424c 	svcmi	0x0046424c
80014a44:	41414141 	cmpmi	r1, r1, asr #2
80014a48:	4f444644 	svcmi	0x00444644
80014a4c:	41414143 	cmpmi	r1, r3, asr #2
80014a50:	414b4141 	cmpmi	fp, r1, asr #2
80014a54:	44414349 	strbmi	r4, [r1], #-841	@ 0xfffffcb7
80014a58:	4f46424c 	svcmi	0x0046424c
80014a5c:	43414249 	movtmi	r4, #4681	@ 0x1249
80014a60:	4f46424c 	svcmi	0x0046424c
80014a64:	43414141 	movtmi	r4, #4417	@ 0x1141
80014a68:	4f464944 	svcmi	0x00464944
80014a6c:	44414245 	strbmi	r4, [r1], #-581	@ 0xfffffdbb
80014a70:	4f46424c 	svcmi	0x0046424c
80014a74:	41414144 	cmpmi	r1, r4, asr #2
80014a78:	4f424b41 	svcmi	0x00424b41
80014a7c:	4e41414d 	cdpmi	1, 4, cr4, cr1, cr13, {2}
80014a80:	4f43454c 	svcmi	0x0043454c
80014a84:	4b494141 	blmi	81264f90 <irq_stack_start+0x120af80>
80014a88:	4f494a4e 	svcmi	0x00494a4e
80014a8c:	47464749 	strbmi	r4, [r6, -r9, asr #14]
80014a90:	474d474d 	strbmi	r4, [sp, -sp, asr #14]
80014a94:	43414750 	movtmi	r4, #5968	@ 0x1750
80014a98:	48434747 	stmdami	r3, {r0, r1, r2, r6, r8, r9, sl, lr}^
80014a9c:	474e4750 	smlsldmi	r4, lr, r0, r7
80014aa0:	48414341 	stmdami	r1, {r0, r6, r8, r9, lr}^
80014aa4:	4745474a 	strbmi	r4, [r5, -sl, asr #14]
80014aa8:	4341444b 	movtmi	r4, #5195	@ 0x144b
80014aac:	47454346 	strbmi	r4, [r5, -r6, asr #6]
80014ab0:	4341434d 	movtmi	r4, #4941	@ 0x134d
80014ab4:	47504747 	ldrbmi	r4, [r0, -r7, asr #14]
80014ab8:	474c4843 	strbmi	r4, [ip, -r3, asr #16]
80014abc:	48434341 	stmdami	r3, {r0, r6, r8, r9, lr}^
80014ac0:	48454746 	stmdami	r5, {r1, r2, r6, r8, r9, sl, lr}^
80014ac4:	48434846 	stmdami	r3, {r1, r2, r6, fp, lr}^
80014ac8:	4746474f 	strbmi	r4, [r6, -pc, asr #14]
80014acc:	444b4745 	strbmi	r4, [fp], #-1861	@ 0xfffff8bb
80014ad0:	43464341 	movtmi	r4, #25409	@ 0x6341
80014ad4:	414b4745 	cmpmi	fp, r5, asr #14
80014ad8:	41414141 	cmpmi	r1, r1, asr #2
80014adc:	48494441 	stmdami	r9, {r0, r6, sl, lr}^
80014ae0:	41414141 	cmpmi	r1, r1, asr #2
80014ae4:	41414541 	cmpmi	r1, r1, asr #10
80014ae8:	41414141 	cmpmi	r1, r1, asr #2
80014aec:	41414845 	cmpmi	r1, r5, asr #16
80014af0:	41414141 	cmpmi	r1, r1, asr #2
80014af4:	4142474d 	cmpmi	r2, sp, asr #14
80014af8:	41414141 	cmpmi	r1, r1, asr #2
80014afc:	4142474d 	cmpmi	r2, sp, asr #14
80014b00:	41414141 	cmpmi	r1, r1, asr #2
80014b04:	4142474d 	cmpmi	r2, sp, asr #14
80014b08:	41414141 	cmpmi	r1, r1, asr #2
80014b0c:	4142474d 	cmpmi	r2, sp, asr #14
80014b10:	41414141 	cmpmi	r1, r1, asr #2
80014b14:	4142474d 	cmpmi	r2, sp, asr #14
80014b18:	41414141 	cmpmi	r1, r1, asr #2
80014b1c:	4142474d 	cmpmi	r2, sp, asr #14
80014b20:	41414141 	cmpmi	r1, r1, asr #2
80014b24:	4142474d 	cmpmi	r2, sp, asr #14
80014b28:	41414141 	cmpmi	r1, r1, asr #2
80014b2c:	4142474d 	cmpmi	r2, sp, asr #14
80014b30:	41414141 	cmpmi	r1, r1, asr #2
80014b34:	4142474d 	cmpmi	r2, sp, asr #14
80014b38:	41414141 	cmpmi	r1, r1, asr #2
80014b3c:	4142474d 	cmpmi	r2, sp, asr #14
80014b40:	41414141 	cmpmi	r1, r1, asr #2
80014b44:	4142474d 	cmpmi	r2, sp, asr #14
80014b48:	41414141 	cmpmi	r1, r1, asr #2
80014b4c:	4142474d 	cmpmi	r2, sp, asr #14
80014b50:	41414141 	cmpmi	r1, r1, asr #2
80014b54:	4142474d 	cmpmi	r2, sp, asr #14
80014b58:	41414141 	cmpmi	r1, r1, asr #2
80014b5c:	4142474d 	cmpmi	r2, sp, asr #14
80014b60:	41414141 	cmpmi	r1, r1, asr #2
80014b64:	41414141 	cmpmi	r1, r1, asr #2
80014b68:	41414141 	cmpmi	r1, r1, asr #2
80014b6c:	4142474d 	cmpmi	r2, sp, asr #14
80014b70:	41414141 	cmpmi	r1, r1, asr #2
80014b74:	41414c45 	cmpmi	r1, r5, asr #24
80014b78:	41414141 	cmpmi	r1, r1, asr #2
80014b7c:	4142474d 	cmpmi	r2, sp, asr #14
80014b80:	41414141 	cmpmi	r1, r1, asr #2
80014b84:	4142474d 	cmpmi	r2, sp, asr #14
80014b88:	41414141 	cmpmi	r1, r1, asr #2
80014b8c:	41415049 	cmpmi	r1, r9, asr #32
80014b90:	41414141 	cmpmi	r1, r1, asr #2
80014b94:	44424441 	strbmi	r4, [r2], #-1089	@ 0xfffffbbf
80014b98:	44444443 	strbmi	r4, [r4], #-1091	@ 0xfffffbbd
80014b9c:	44464445 	strbmi	r4, [r6], #-1093	@ 0xfffffbbb
80014ba0:	44484447 	strbmi	r4, [r8], #-1095	@ 0xfffffbb9
80014ba4:	444a4449 	strbmi	r4, [sl], #-1097	@ 0xfffffbb7
80014ba8:	47434742 	strbmi	r4, [r3, -r2, asr #14]
80014bac:	47454744 	strbmi	r4, [r5, -r4, asr #14]
80014bb0:	47474746 	strbmi	r4, [r7, -r6, asr #14]
80014bb4:	41414141 	cmpmi	r1, r1, asr #2
80014bb8:	41414141 	cmpmi	r1, r1, asr #2
80014bbc:	41414141 	cmpmi	r1, r1, asr #2
80014bc0:	41414141 	cmpmi	r1, r1, asr #2
80014bc4:	41414141 	cmpmi	r1, r1, asr #2
80014bc8:	41414141 	cmpmi	r1, r1, asr #2
80014bcc:	41414141 	cmpmi	r1, r1, asr #2
80014bd0:	41414141 	cmpmi	r1, r1, asr #2
80014bd4:	4143424d 	cmpmi	r3, sp, asr #4
80014bd8:	41414141 	cmpmi	r1, r1, asr #2
80014bdc:	45444548 	strbmi	r4, [r4, #-1352]	@ 0xfffffab8
80014be0:	444b4544 	strbmi	r4, [fp], #-1348	@ 0xfffffabc
80014be4:	43494341 	movtmi	r4, #37697	@ 0x9341
80014be8:	48434542 	stmdami	r3, {r1, r6, r8, sl, lr}^
80014bec:	47494744 	strbmi	r4, [r9, -r4, asr #14]
80014bf0:	46434341 	strbmi	r4, [r3], -r1, asr #6
80014bf4:	48414746 	stmdami	r1, {r1, r2, r6, r8, r9, sl, lr}^
80014bf8:	48444750 	stmdami	r4, {r4, r6, r8, r9, sl, lr}^
80014bfc:	4845474a 	stmdami	r5, {r1, r3, r6, r8, r9, sl, lr}^
80014c00:	48434750 	stmdami	r3, {r4, r6, r8, r9, sl, lr}^
80014c04:	434a484a 	movtmi	r4, #43082	@ 0xa84a
80014c08:	44424341 	strbmi	r4, [r2], #-833	@ 0xfffffcbf
80014c0c:	434f4445 	movtmi	r4, #62533	@ 0xf445
80014c10:	434f4443 	movtmi	r4, #62531	@ 0xf443
80014c14:	41414441 	cmpmi	r1, r1, asr #8
80014c18:	434f4542 	movtmi	r4, #62786	@ 0xf542
80014c1c:	41414141 	cmpmi	r1, r1, asr #2
80014c20:	47424141 	strbmi	r4, [r2, -r1, asr #2]
80014c24:	47424746 	strbmi	r4, [r2, -r6, asr #14]
80014c28:	474a4743 	strbmi	r4, [sl, -r3, asr #14]
80014c2c:	41424141 	cmpmi	r2, r1, asr #2
80014c30:	41414345 	cmpmi	r1, r5, asr #6
80014c34:	41414141 	cmpmi	r1, r1, asr #2
80014c38:	44474146 	strbmi	r4, [r7], #-326	@ 0xfffffeba
80014c3c:	464b454c 	strbmi	r4, [fp], -ip, asr #10
80014c40:	41474141 	cmpmi	r7, r1, asr #2
80014c44:	41494148 	cmpmi	r9, r8, asr #2
80014c48:	414a4142 	cmpmi	sl, r2, asr #2
80014c4c:	42434142 	submi	r4, r3, #-2147483632	@ 0x80000010
80014c50:	42454145 	submi	r4, r5, #1073741841	@ 0x40000011
80014c54:	42464142 	submi	r4, r6, #-2147483632	@ 0x80000010
80014c58:	42484142 	submi	r4, r8, #-2147483632	@ 0x80000010
80014c5c:	42494144 	submi	r4, r9, #68, 2
80014c60:	424a4142 	submi	r4, sl, #-2147483632	@ 0x80000010
80014c64:	424b4142 	submi	r4, fp, #-2147483632	@ 0x80000010
80014c68:	424f4142 	submi	r4, pc, #-2147483632	@ 0x80000010
80014c6c:	43434147 	movtmi	r4, #12615	@ 0x3147
80014c70:	45454142 	strbmi	r4, [r5, #-322]	@ 0xfffffebe
80014c74:	41414142 	cmpmi	r1, r2, asr #2
80014c78:	41414141 	cmpmi	r1, r1, asr #2
80014c7c:	41414141 	cmpmi	r1, r1, asr #2
80014c80:	41414141 	cmpmi	r1, r1, asr #2
80014c84:	41414141 	cmpmi	r1, r1, asr #2
80014c88:	41414141 	cmpmi	r1, r1, asr #2
80014c8c:	41414141 	cmpmi	r1, r1, asr #2
80014c90:	41414141 	cmpmi	r1, r1, asr #2
80014c94:	41414141 	cmpmi	r1, r1, asr #2
80014c98:	41414141 	cmpmi	r1, r1, asr #2
80014c9c:	41414141 	cmpmi	r1, r1, asr #2
80014ca0:	41414141 	cmpmi	r1, r1, asr #2
80014ca4:	41424141 	cmpmi	r2, r1, asr #2
80014ca8:	41414141 	cmpmi	r1, r1, asr #2
80014cac:	41414141 	cmpmi	r1, r1, asr #2
80014cb0:	41414141 	cmpmi	r1, r1, asr #2
80014cb4:	41414144 	cmpmi	r1, r4, asr #2
80014cb8:	41414142 	cmpmi	r1, r2, asr #2
80014cbc:	41414141 	cmpmi	r1, r1, asr #2
80014cc0:	41414141 	cmpmi	r1, r1, asr #2
80014cc4:	414a484d 	cmpmi	sl, sp, asr #16
80014cc8:	41414141 	cmpmi	r1, r1, asr #2
80014ccc:	41414141 	cmpmi	r1, r1, asr #2
80014cd0:	41414141 	cmpmi	r1, r1, asr #2
80014cd4:	41414144 	cmpmi	r1, r4, asr #2
80014cd8:	41414143 	cmpmi	r1, r3, asr #2
80014cdc:	41414141 	cmpmi	r1, r1, asr #2
80014ce0:	41414141 	cmpmi	r1, r1, asr #2
80014ce4:	424b4245 	submi	r4, fp, #1342177284	@ 0x50000004
80014ce8:	41414141 	cmpmi	r1, r1, asr #2
80014cec:	41414141 	cmpmi	r1, r1, asr #2
80014cf0:	41414141 	cmpmi	r1, r1, asr #2
80014cf4:	41414144 	cmpmi	r1, r4, asr #2
80014cf8:	41414144 	cmpmi	r1, r4, asr #2
80014cfc:	41414141 	cmpmi	r1, r1, asr #2
80014d00:	41414141 	cmpmi	r1, r1, asr #2
80014d04:	424b4345 	submi	r4, fp, #335544321	@ 0x14000001
80014d08:	41414141 	cmpmi	r1, r1, asr #2
80014d0c:	41414141 	cmpmi	r1, r1, asr #2
80014d10:	41414141 	cmpmi	r1, r1, asr #2
80014d14:	41414144 	cmpmi	r1, r4, asr #2
80014d18:	41414145 	cmpmi	r1, r5, asr #2
80014d1c:	41414141 	cmpmi	r1, r1, asr #2
80014d20:	41414141 	cmpmi	r1, r1, asr #2
80014d24:	424b4345 	submi	r4, fp, #335544321	@ 0x14000001
80014d28:	41414141 	cmpmi	r1, r1, asr #2
80014d2c:	41414141 	cmpmi	r1, r1, asr #2
80014d30:	41414141 	cmpmi	r1, r1, asr #2
80014d34:	41414144 	cmpmi	r1, r4, asr #2
80014d38:	41414146 	cmpmi	r1, r6, asr #2
80014d3c:	41414141 	cmpmi	r1, r1, asr #2
80014d40:	41414141 	cmpmi	r1, r1, asr #2
80014d44:	41414141 	cmpmi	r1, r1, asr #2
80014d48:	41414141 	cmpmi	r1, r1, asr #2
80014d4c:	41414141 	cmpmi	r1, r1, asr #2
80014d50:	41414141 	cmpmi	r1, r1, asr #2
80014d54:	41414144 	cmpmi	r1, r4, asr #2
80014d58:	41414147 	cmpmi	r1, r7, asr #2
80014d5c:	41414141 	cmpmi	r1, r1, asr #2
80014d60:	41414141 	cmpmi	r1, r1, asr #2
80014d64:	41414141 	cmpmi	r1, r1, asr #2
80014d68:	41414141 	cmpmi	r1, r1, asr #2
80014d6c:	41414141 	cmpmi	r1, r1, asr #2
80014d70:	41414141 	cmpmi	r1, r1, asr #2
80014d74:	41414144 	cmpmi	r1, r4, asr #2
80014d78:	41414148 	cmpmi	r1, r8, asr #2
80014d7c:	41414142 	cmpmi	r1, r2, asr #2
80014d80:	41414141 	cmpmi	r1, r1, asr #2
80014d84:	41414141 	cmpmi	r1, r1, asr #2
80014d88:	41414141 	cmpmi	r1, r1, asr #2
80014d8c:	41414141 	cmpmi	r1, r1, asr #2
80014d90:	41414141 	cmpmi	r1, r1, asr #2
80014d94:	41414145 	cmpmi	r1, r5, asr #2
80014d98:	50505042 	subspl	r5, r0, r2, asr #32
80014d9c:	4141414e 	cmpmi	r1, lr, asr #2
80014da0:	41414141 	cmpmi	r1, r1, asr #2
80014da4:	414a484d 	cmpmi	sl, sp, asr #16
80014da8:	41414141 	cmpmi	r1, r1, asr #2
80014dac:	41414141 	cmpmi	r1, r1, asr #2
80014db0:	41414141 	cmpmi	r1, r1, asr #2
80014db4:	41414141 	cmpmi	r1, r1, asr #2
80014db8:	41414143 	cmpmi	r1, r3, asr #2
80014dbc:	41414241 	cmpmi	r1, r1, asr #4
80014dc0:	41414141 	cmpmi	r1, r1, asr #2
80014dc4:	41424141 	cmpmi	r2, r1, asr #2
80014dc8:	41414141 	cmpmi	r1, r1, asr #2
80014dcc:	41414141 	cmpmi	r1, r1, asr #2
80014dd0:	41414141 	cmpmi	r1, r1, asr #2
80014dd4:	41414141 	cmpmi	r1, r1, asr #2
80014dd8:	41414142 	cmpmi	r1, r2, asr #2
80014ddc:	4141414e 	cmpmi	r1, lr, asr #2
80014de0:	41414141 	cmpmi	r1, r1, asr #2
80014de4:	4142464d 	cmpmi	r2, sp, asr #12
80014de8:	41414141 	cmpmi	r1, r1, asr #2
80014dec:	41414141 	cmpmi	r1, r1, asr #2
80014df0:	41414141 	cmpmi	r1, r1, asr #2
80014df4:	41414141 	cmpmi	r1, r1, asr #2
80014df8:	41414142 	cmpmi	r1, r2, asr #2
80014dfc:	41414244 	cmpmi	r1, r4, asr #4
80014e00:	41414141 	cmpmi	r1, r1, asr #2
80014e04:	41414141 	cmpmi	r1, r1, asr #2
80014e08:	41414141 	cmpmi	r1, r1, asr #2
80014e0c:	41414141 	cmpmi	r1, r1, asr #2
80014e10:	41414141 	cmpmi	r1, r1, asr #2
80014e14:	41414145 	cmpmi	r1, r5, asr #2
80014e18:	50505042 	subspl	r5, r0, r2, asr #32
80014e1c:	41414241 	cmpmi	r1, r1, asr #4
80014e20:	41414141 	cmpmi	r1, r1, asr #2
80014e24:	41424749 	cmpmi	r2, r9, asr #14
80014e28:	41414141 	cmpmi	r1, r1, asr #2
80014e2c:	41414141 	cmpmi	r1, r1, asr #2
80014e30:	41414141 	cmpmi	r1, r1, asr #2
80014e34:	41414141 	cmpmi	r1, r1, asr #2
80014e38:	41414142 	cmpmi	r1, r2, asr #2
80014e3c:	41414250 	cmpmi	r1, r0, asr r2
80014e40:	41414141 	cmpmi	r1, r1, asr #2
80014e44:	41414141 	cmpmi	r1, r1, asr #2
80014e48:	41414141 	cmpmi	r1, r1, asr #2
80014e4c:	41414141 	cmpmi	r1, r1, asr #2
80014e50:	41414141 	cmpmi	r1, r1, asr #2
80014e54:	41414145 	cmpmi	r1, r5, asr #2
80014e58:	50505042 	subspl	r5, r0, r2, asr #32
80014e5c:	41414241 	cmpmi	r1, r1, asr #4
80014e60:	41414141 	cmpmi	r1, r1, asr #2
80014e64:	41444549 	cmpmi	r4, r9, asr #10
80014e68:	41414141 	cmpmi	r1, r1, asr #2
80014e6c:	41414141 	cmpmi	r1, r1, asr #2
80014e70:	41414141 	cmpmi	r1, r1, asr #2
80014e74:	41414141 	cmpmi	r1, r1, asr #2
80014e78:	41414142 	cmpmi	r1, r2, asr #2
80014e7c:	4141424e 	cmpmi	r1, lr, asr #4
80014e80:	41414141 	cmpmi	r1, r1, asr #2
80014e84:	41414141 	cmpmi	r1, r1, asr #2
80014e88:	41414141 	cmpmi	r1, r1, asr #2
80014e8c:	41414141 	cmpmi	r1, r1, asr #2
80014e90:	41414141 	cmpmi	r1, r1, asr #2
80014e94:	41414145 	cmpmi	r1, r5, asr #2
80014e98:	50505042 	subspl	r5, r0, r2, asr #32
80014e9c:	4141414e 	cmpmi	r1, lr, asr #2
80014ea0:	41414141 	cmpmi	r1, r1, asr #2
80014ea4:	414a4b45 	cmpmi	sl, r5, asr #22
80014ea8:	41414141 	cmpmi	r1, r1, asr #2
80014eac:	41414141 	cmpmi	r1, r1, asr #2
80014eb0:	41414141 	cmpmi	r1, r1, asr #2
80014eb4:	41414141 	cmpmi	r1, r1, asr #2
80014eb8:	41414143 	cmpmi	r1, r3, asr #2
80014ebc:	41414241 	cmpmi	r1, r1, asr #4
80014ec0:	41414141 	cmpmi	r1, r1, asr #2
80014ec4:	41444f49 	cmpmi	r4, r9, asr #30
80014ec8:	41414141 	cmpmi	r1, r1, asr #2
80014ecc:	41414141 	cmpmi	r1, r1, asr #2
80014ed0:	41414141 	cmpmi	r1, r1, asr #2
80014ed4:	41414141 	cmpmi	r1, r1, asr #2
80014ed8:	41414142 	cmpmi	r1, r2, asr #2
80014edc:	41414349 	cmpmi	r1, r9, asr #6
80014ee0:	41414141 	cmpmi	r1, r1, asr #2
80014ee4:	41474c49 	cmpmi	r7, r9, asr #24
80014ee8:	41414141 	cmpmi	r1, r1, asr #2
80014eec:	4141494d 	cmpmi	r1, sp, asr #18
80014ef0:	41414141 	cmpmi	r1, r1, asr #2
80014ef4:	41414143 	cmpmi	r1, r3, asr #2
80014ef8:	41414142 	cmpmi	r1, r2, asr #2
80014efc:	41414446 	cmpmi	r1, r6, asr #8
80014f00:	41414141 	cmpmi	r1, r1, asr #2
80014f04:	41484545 	cmpmi	r8, r5, asr #10
80014f08:	41414141 	cmpmi	r1, r1, asr #2
80014f0c:	41414a49 	cmpmi	r1, r9, asr #20
80014f10:	41414141 	cmpmi	r1, r1, asr #2
80014f14:	41414143 	cmpmi	r1, r3, asr #2
80014f18:	41414142 	cmpmi	r1, r2, asr #2
80014f1c:	41414450 	cmpmi	r1, r0, asr r4
80014f20:	41414141 	cmpmi	r1, r1, asr #2
80014f24:	41484e4d 	cmpmi	r8, sp, asr #28
80014f28:	41414141 	cmpmi	r1, r1, asr #2
80014f2c:	41414b4d 	cmpmi	r1, sp, asr #22
80014f30:	41414141 	cmpmi	r1, r1, asr #2
80014f34:	41414143 	cmpmi	r1, r3, asr #2
80014f38:	41414142 	cmpmi	r1, r2, asr #2
80014f3c:	4141414e 	cmpmi	r1, lr, asr #2
80014f40:	41414141 	cmpmi	r1, r1, asr #2
80014f44:	41474c41 	cmpmi	r7, r1, asr #24
80014f48:	41414141 	cmpmi	r1, r1, asr #2
80014f4c:	41414141 	cmpmi	r1, r1, asr #2
80014f50:	41414141 	cmpmi	r1, r1, asr #2
80014f54:	41414141 	cmpmi	r1, r1, asr #2
80014f58:	41414142 	cmpmi	r1, r2, asr #2
80014f5c:	41414241 	cmpmi	r1, r1, asr #4
80014f60:	41414141 	cmpmi	r1, r1, asr #2
80014f64:	41474c49 	cmpmi	r7, r9, asr #24
80014f68:	41414141 	cmpmi	r1, r1, asr #2
80014f6c:	41414141 	cmpmi	r1, r1, asr #2
80014f70:	41414141 	cmpmi	r1, r1, asr #2
80014f74:	41414141 	cmpmi	r1, r1, asr #2
80014f78:	41414142 	cmpmi	r1, r2, asr #2
80014f7c:	4141414e 	cmpmi	r1, lr, asr #2
80014f80:	41414141 	cmpmi	r1, r1, asr #2
80014f84:	41494945 	cmpmi	r9, r5, asr #18
80014f88:	41414141 	cmpmi	r1, r1, asr #2
80014f8c:	41414141 	cmpmi	r1, r1, asr #2
80014f90:	41414141 	cmpmi	r1, r1, asr #2
80014f94:	41414141 	cmpmi	r1, r1, asr #2
80014f98:	41414142 	cmpmi	r1, r2, asr #2
80014f9c:	41414643 	cmpmi	r1, r3, asr #12
80014fa0:	41414141 	cmpmi	r1, r1, asr #2
80014fa4:	41414141 	cmpmi	r1, r1, asr #2
80014fa8:	41414141 	cmpmi	r1, r1, asr #2
80014fac:	41414141 	cmpmi	r1, r1, asr #2
80014fb0:	41414141 	cmpmi	r1, r1, asr #2
80014fb4:	41414145 	cmpmi	r1, r5, asr #2
80014fb8:	50505042 	subspl	r5, r0, r2, asr #32
80014fbc:	41414241 	cmpmi	r1, r1, asr #4
80014fc0:	41414141 	cmpmi	r1, r1, asr #2
80014fc4:	41494949 	cmpmi	r9, r9, asr #18
80014fc8:	41414141 	cmpmi	r1, r1, asr #2
80014fcc:	41414141 	cmpmi	r1, r1, asr #2
80014fd0:	41414141 	cmpmi	r1, r1, asr #2
80014fd4:	41414141 	cmpmi	r1, r1, asr #2
80014fd8:	41414142 	cmpmi	r1, r2, asr #2
80014fdc:	41414141 	cmpmi	r1, r1, asr #2
80014fe0:	41414141 	cmpmi	r1, r1, asr #2
80014fe4:	41414141 	cmpmi	r1, r1, asr #2
80014fe8:	41414141 	cmpmi	r1, r1, asr #2
80014fec:	41414141 	cmpmi	r1, r1, asr #2
80014ff0:	41414141 	cmpmi	r1, r1, asr #2
80014ff4:	41414145 	cmpmi	r1, r5, asr #2
80014ff8:	50505042 	subspl	r5, r0, r2, asr #32
80014ffc:	4141464a 	cmpmi	r1, sl, asr #12
80015000:	41414141 	cmpmi	r1, r1, asr #2
80015004:	424b4245 	submi	r4, fp, #1342177284	@ 0x50000004
80015008:	41414141 	cmpmi	r1, r1, asr #2
8001500c:	41414141 	cmpmi	r1, r1, asr #2
80015010:	41414141 	cmpmi	r1, r1, asr #2
80015014:	41414142 	cmpmi	r1, r2, asr #2
80015018:	41414144 	cmpmi	r1, r4, asr #2
8001501c:	41414750 	cmpmi	r1, r0, asr r7
80015020:	41414141 	cmpmi	r1, r1, asr #2
80015024:	41444141 	cmpmi	r4, r1, asr #2
80015028:	41414141 	cmpmi	r1, r1, asr #2
8001502c:	4141424d 	cmpmi	r1, sp, asr #4
80015030:	41414141 	cmpmi	r1, r1, asr #2
80015034:	41414243 	cmpmi	r1, r3, asr #4
80015038:	41414142 	cmpmi	r1, r2, asr #2
8001503c:	41414846 	cmpmi	r1, r6, asr #16
80015040:	41414141 	cmpmi	r1, r1, asr #2
80015044:	41444f49 	cmpmi	r4, r9, asr #30
80015048:	41414141 	cmpmi	r1, r1, asr #2
8001504c:	41434e41 	cmpmi	r3, r1, asr #28
80015050:	41414141 	cmpmi	r1, r1, asr #2
80015054:	41414243 	cmpmi	r1, r3, asr #4
80015058:	41414142 	cmpmi	r1, r2, asr #2
8001505c:	4141484f 	cmpmi	r1, pc, asr #16
80015060:	41414141 	cmpmi	r1, r1, asr #2
80015064:	41424749 	cmpmi	r2, r9, asr #14
80015068:	41414141 	cmpmi	r1, r1, asr #2
8001506c:	41414445 	cmpmi	r1, r5, asr #8
80015070:	41414141 	cmpmi	r1, r1, asr #2
80015074:	41414243 	cmpmi	r1, r3, asr #4
80015078:	41414142 	cmpmi	r1, r2, asr #2
8001507c:	41414d48 	cmpmi	r1, r8, asr #26
80015080:	41414141 	cmpmi	r1, r1, asr #2
80015084:	424b4345 	submi	r4, fp, #335544321	@ 0x14000001
80015088:	41414141 	cmpmi	r1, r1, asr #2
8001508c:	41414141 	cmpmi	r1, r1, asr #2
80015090:	41414141 	cmpmi	r1, r1, asr #2
80015094:	41414241 	cmpmi	r1, r1, asr #4
80015098:	41414144 	cmpmi	r1, r4, asr #2
8001509c:	41414948 	cmpmi	r1, r8, asr #18
800150a0:	41414141 	cmpmi	r1, r1, asr #2
800150a4:	41434a45 	cmpmi	r3, r5, asr #20
800150a8:	41414141 	cmpmi	r1, r1, asr #2
800150ac:	41414341 	cmpmi	r1, r1, asr #6
800150b0:	41414141 	cmpmi	r1, r1, asr #2
800150b4:	41414243 	cmpmi	r1, r3, asr #4
800150b8:	41414142 	cmpmi	r1, r2, asr #2
800150bc:	4141494f 	cmpmi	r1, pc, asr #18
800150c0:	41414141 	cmpmi	r1, r1, asr #2
800150c4:	424b4345 	submi	r4, fp, #335544321	@ 0x14000001
800150c8:	41414141 	cmpmi	r1, r1, asr #2
800150cc:	41414141 	cmpmi	r1, r1, asr #2
800150d0:	41414141 	cmpmi	r1, r1, asr #2
800150d4:	41414241 	cmpmi	r1, r1, asr #4
800150d8:	41414144 	cmpmi	r1, r4, asr #2
800150dc:	41414a4d 	cmpmi	r1, sp, asr #20
800150e0:	41414141 	cmpmi	r1, r1, asr #2
800150e4:	41494949 	cmpmi	r9, r9, asr #18
800150e8:	41414141 	cmpmi	r1, r1, asr #2
800150ec:	41415045 	cmpmi	r1, r5, asr #32
800150f0:	41414141 	cmpmi	r1, r1, asr #2
800150f4:	41414243 	cmpmi	r1, r3, asr #4
800150f8:	41414142 	cmpmi	r1, r2, asr #2
800150fc:	41414b4d 	cmpmi	r1, sp, asr #22
80015100:	41414141 	cmpmi	r1, r1, asr #2
80015104:	4143424d 	cmpmi	r3, sp, asr #4
80015108:	41414141 	cmpmi	r1, r1, asr #2
8001510c:	4141434d 	cmpmi	r1, sp, asr #6
80015110:	41414141 	cmpmi	r1, r1, asr #2
80015114:	41414243 	cmpmi	r1, r3, asr #4
80015118:	41414142 	cmpmi	r1, r2, asr #2
8001511c:	41414c43 	cmpmi	r1, r3, asr #24
80015120:	41414141 	cmpmi	r1, r1, asr #2
80015124:	41434549 	cmpmi	r3, r9, asr #10
80015128:	41414141 	cmpmi	r1, r1, asr #2
8001512c:	41414341 	cmpmi	r1, r1, asr #6
80015130:	41414141 	cmpmi	r1, r1, asr #2
80015134:	41414243 	cmpmi	r1, r3, asr #4
80015138:	41414142 	cmpmi	r1, r2, asr #2
8001513c:	41414c49 	cmpmi	r1, r9, asr #24
80015140:	41414141 	cmpmi	r1, r1, asr #2
80015144:	41424e49 	cmpmi	r2, r9, asr #28
80015148:	41414141 	cmpmi	r1, r1, asr #2
8001514c:	41414545 	cmpmi	r1, r5, asr #10
80015150:	41414141 	cmpmi	r1, r1, asr #2
80015154:	41414243 	cmpmi	r1, r3, asr #4
80015158:	41414142 	cmpmi	r1, r2, asr #2
8001515c:	41414d42 	cmpmi	r1, r2, asr #26
80015160:	41414141 	cmpmi	r1, r1, asr #2
80015164:	41434e45 	cmpmi	r3, r5, asr #28
80015168:	41414141 	cmpmi	r1, r1, asr #2
8001516c:	4141434d 	cmpmi	r1, sp, asr #6
80015170:	41414141 	cmpmi	r1, r1, asr #2
80015174:	41414243 	cmpmi	r1, r3, asr #4
80015178:	41414142 	cmpmi	r1, r2, asr #2
8001517c:	41414d47 	cmpmi	r1, r7, asr #26
80015180:	41414141 	cmpmi	r1, r1, asr #2
80015184:	424b4345 	submi	r4, fp, #335544321	@ 0x14000001
80015188:	41414141 	cmpmi	r1, r1, asr #2
8001518c:	41414141 	cmpmi	r1, r1, asr #2
80015190:	41414141 	cmpmi	r1, r1, asr #2
80015194:	41414241 	cmpmi	r1, r1, asr #4
80015198:	41414144 	cmpmi	r1, r4, asr #2
8001519c:	41414e43 	cmpmi	r1, r3, asr #28
800151a0:	41414141 	cmpmi	r1, r1, asr #2
800151a4:	4144424d 	cmpmi	r4, sp, asr #4
800151a8:	41414141 	cmpmi	r1, r1, asr #2
800151ac:	4141434d 	cmpmi	r1, sp, asr #6
800151b0:	41414141 	cmpmi	r1, r1, asr #2
800151b4:	41414243 	cmpmi	r1, r3, asr #4
800151b8:	41414142 	cmpmi	r1, r2, asr #2
800151bc:	41424344 	cmpmi	r2, r4, asr #6
800151c0:	41414141 	cmpmi	r1, r1, asr #2
800151c4:	41424141 	cmpmi	r2, r1, asr #2
800151c8:	41414141 	cmpmi	r1, r1, asr #2
800151cc:	41414749 	cmpmi	r1, r9, asr #14
800151d0:	41414141 	cmpmi	r1, r1, asr #2
800151d4:	41414243 	cmpmi	r1, r3, asr #4
800151d8:	41414142 	cmpmi	r1, r2, asr #2
800151dc:	41414e48 	cmpmi	r1, r8, asr #28
800151e0:	41414141 	cmpmi	r1, r1, asr #2
800151e4:	41434c45 	cmpmi	r3, r5, asr #24
800151e8:	41414141 	cmpmi	r1, r1, asr #2
800151ec:	41414341 	cmpmi	r1, r1, asr #6
800151f0:	41414141 	cmpmi	r1, r1, asr #2
800151f4:	41414243 	cmpmi	r1, r3, asr #4
800151f8:	41414142 	cmpmi	r1, r2, asr #2
800151fc:	41414e4d 	cmpmi	r1, sp, asr #28
80015200:	41414141 	cmpmi	r1, r1, asr #2
80015204:	424b4345 	submi	r4, fp, #335544321	@ 0x14000001
80015208:	41414141 	cmpmi	r1, r1, asr #2
8001520c:	41414141 	cmpmi	r1, r1, asr #2
80015210:	41414141 	cmpmi	r1, r1, asr #2
80015214:	41414241 	cmpmi	r1, r1, asr #4
80015218:	41414144 	cmpmi	r1, r4, asr #2
8001521c:	41414f49 	cmpmi	r1, r9, asr #30
80015220:	41414141 	cmpmi	r1, r1, asr #2
80015224:	424b4345 	submi	r4, fp, #335544321	@ 0x14000001
80015228:	41414141 	cmpmi	r1, r1, asr #2
8001522c:	41414141 	cmpmi	r1, r1, asr #2
80015230:	41414141 	cmpmi	r1, r1, asr #2
80015234:	41414241 	cmpmi	r1, r1, asr #4
80015238:	41414144 	cmpmi	r1, r4, asr #2
8001523c:	41415041 	cmpmi	r1, r1, asr #32
80015240:	41414141 	cmpmi	r1, r1, asr #2
80015244:	41424a4d 	cmpmi	r2, sp, asr #20
80015248:	41414141 	cmpmi	r1, r1, asr #2
8001524c:	4141444d 	cmpmi	r1, sp, asr #8
80015250:	41414141 	cmpmi	r1, r1, asr #2
80015254:	41414243 	cmpmi	r1, r3, asr #4
80015258:	41414142 	cmpmi	r1, r2, asr #2
8001525c:	4141504a 	cmpmi	r1, sl, asr #32
80015260:	41414141 	cmpmi	r1, r1, asr #2
80015264:	41444549 	cmpmi	r4, r9, asr #10
80015268:	41414141 	cmpmi	r1, r1, asr #2
8001526c:	41414b41 	cmpmi	r1, r1, asr #22
80015270:	41414141 	cmpmi	r1, r1, asr #2
80015274:	41414243 	cmpmi	r1, r3, asr #4
80015278:	41414142 	cmpmi	r1, r2, asr #2
8001527c:	41424146 	cmpmi	r2, r6, asr #2
80015280:	41414141 	cmpmi	r1, r1, asr #2
80015284:	424b4345 	submi	r4, fp, #335544321	@ 0x14000001
80015288:	41414141 	cmpmi	r1, r1, asr #2
8001528c:	41414141 	cmpmi	r1, r1, asr #2
80015290:	41414141 	cmpmi	r1, r1, asr #2
80015294:	41414241 	cmpmi	r1, r1, asr #4
80015298:	41414144 	cmpmi	r1, r4, asr #2
8001529c:	4142414d 	cmpmi	r2, sp, asr #2
800152a0:	41414141 	cmpmi	r1, r1, asr #2
800152a4:	424b4345 	submi	r4, fp, #335544321	@ 0x14000001
800152a8:	41414141 	cmpmi	r1, r1, asr #2
800152ac:	41414141 	cmpmi	r1, r1, asr #2
800152b0:	41414141 	cmpmi	r1, r1, asr #2
800152b4:	41414241 	cmpmi	r1, r1, asr #4
800152b8:	41414144 	cmpmi	r1, r4, asr #2
800152bc:	41424242 	cmpmi	r2, r2, asr #4
800152c0:	41414141 	cmpmi	r1, r1, asr #2
800152c4:	41434749 	cmpmi	r3, r9, asr #14
800152c8:	41414141 	cmpmi	r1, r1, asr #2
800152cc:	4141434d 	cmpmi	r1, sp, asr #6
800152d0:	41414141 	cmpmi	r1, r1, asr #2
800152d4:	41414243 	cmpmi	r1, r3, asr #4
800152d8:	41414142 	cmpmi	r1, r2, asr #2
800152dc:	41424247 	cmpmi	r2, r7, asr #4
800152e0:	41414141 	cmpmi	r1, r1, asr #2
800152e4:	41414141 	cmpmi	r1, r1, asr #2
800152e8:	41414149 	cmpmi	r1, r9, asr #2
800152ec:	41414141 	cmpmi	r1, r1, asr #2
800152f0:	41414141 	cmpmi	r1, r1, asr #2
800152f4:	41414241 	cmpmi	r1, r1, asr #4
800152f8:	41414146 	cmpmi	r1, r6, asr #2
800152fc:	4142424e 	cmpmi	r2, lr, asr #4
80015300:	41414141 	cmpmi	r1, r1, asr #2
80015304:	424b4345 	submi	r4, fp, #335544321	@ 0x14000001
80015308:	41414141 	cmpmi	r1, r1, asr #2
8001530c:	41414141 	cmpmi	r1, r1, asr #2
80015310:	41414141 	cmpmi	r1, r1, asr #2
80015314:	41414241 	cmpmi	r1, r1, asr #4
80015318:	41414144 	cmpmi	r1, r4, asr #2
8001531c:	47474141 	strbmi	r4, [r7, -r1, asr #2]
80015320:	48434750 	stmdami	r3, {r4, r6, r8, r9, sl, lr}^
80015324:	4650474c 	ldrbmi	r4, [r0], -ip, asr #14
80015328:	47464845 	strbmi	r4, [r6, -r5, asr #16]
8001532c:	48454844 	stmdami	r5, {r2, r6, fp, lr}^
80015330:	4744434f 	strbmi	r4, [r4, -pc, asr #6]
80015334:	43454141 	movtmi	r4, #20801	@ 0x5141
80015338:	41414745 	cmpmi	r1, r5, asr #14
8001533c:	47424345 	strbmi	r4, [r2, -r5, asr #6]
80015340:	48444141 	stmdami	r4, {r0, r6, r8, lr}^
80015344:	4844484a 	stmdami	r4, {r1, r3, r6, fp, lr}^
80015348:	47424744 	strbmi	r4, [r2, -r4, asr #14]
8001534c:	474d474d 	strbmi	r4, [sp, -sp, asr #14]
80015350:	4744434f 	strbmi	r4, [r4, -pc, asr #6]
80015354:	48474141 	stmdami	r7, {r0, r6, r8, lr}^
80015358:	48414844 	stmdami	r1, {r2, r6, fp, lr}^
8001535c:	474a4843 	strbmi	r4, [sl, -r3, asr #16]
80015360:	4845474f 	stmdami	r5, {r0, r1, r2, r3, r6, r8, r9, sl, lr}^
80015364:	434f4747 	movtmi	r4, #63303	@ 0xf747
80015368:	41414744 	cmpmi	r1, r4, asr #14
8001536c:	48434841 	stmdami	r3, {r0, r6, fp, lr}^
80015370:	474f474a 	strbmi	r4, [pc, -sl, asr #14]
80015374:	46504845 	ldrbmi	r4, [r0], -r5, asr #16
80015378:	48454844 	stmdami	r5, {r2, r6, fp, lr}^
8001537c:	474a4843 	strbmi	r4, [sl, -r3, asr #16]
80015380:	4748474f 	strbmi	r4, [r8, -pc, asr #14]
80015384:	48414141 	stmdami	r1, {r0, r6, r8, lr}^
80015388:	474a4843 	strbmi	r4, [sl, -r3, asr #16]
8001538c:	4845474f 	stmdami	r5, {r0, r1, r2, r3, r6, r8, r9, sl, lr}^
80015390:	474a4650 	smlsldmi	r4, sl, r0, r6
80015394:	4845474f 	stmdami	r5, {r0, r1, r2, r3, r6, r8, r9, sl, lr}^
80015398:	48414141 	stmdami	r1, {r0, r6, r8, lr}^
8001539c:	474a4843 	strbmi	r4, [sl, -r3, asr #16]
800153a0:	4845474f 	stmdami	r5, {r0, r1, r2, r3, r6, r8, r9, sl, lr}^
800153a4:	48464650 	stmdami	r6, {r4, r6, r9, sl, lr}^
800153a8:	474f474a 	strbmi	r4, [pc, -sl, asr #14]
800153ac:	46504845 	ldrbmi	r4, [r0], -r5, asr #16
800153b0:	474f474a 	strbmi	r4, [pc, -sl, asr #14]
800153b4:	47434650 	smlsldmi	r4, r3, r0, r6
800153b8:	48444742 	stmdami	r4, {r1, r6, r8, r9, sl, lr}^
800153bc:	41414746 	cmpmi	r1, r6, asr #14
800153c0:	4742474e 	strbmi	r4, [r2, -lr, asr #14]
800153c4:	47494845 	strbmi	r4, [r9, -r5, asr #16]
800153c8:	4744434f 	strbmi	r4, [r4, -pc, asr #6]
800153cc:	46504141 	ldrbmi	r4, [r0], -r1, asr #2
800153d0:	454d4548 	strbmi	r4, [sp, #-1352]	@ 0xfffffab8
800153d4:	45434550 	strbmi	r4, [r3, #-1360]	@ 0xfffffab0
800153d8:	454d4542 	strbmi	r4, [sp, #-1346]	@ 0xfffffabe
800153dc:	45504650 	ldrbmi	r4, [r0, #-1616]	@ 0xfffff9b0
800153e0:	45474547 	strbmi	r4, [r7, #-1351]	@ 0xfffffab9
800153e4:	45464644 	strbmi	r4, [r6, #-1604]	@ 0xfffff9bc
800153e8:	46504645 	ldrbmi	r4, [r0], -r5, asr #12
800153ec:	45424645 	strbmi	r4, [r2, #-1605]	@ 0xfffff9bb
800153f0:	454d4543 	strbmi	r4, [sp, #-1347]	@ 0xfffffabd
800153f4:	46504546 	ldrbmi	r4, [r0], -r6, asr #10
800153f8:	484a4141 	stmdami	sl, {r0, r6, r8, lr}^
800153fc:	4746474a 	strbmi	r4, [r6, -sl, asr #14]
80015400:	4745474d 	strbmi	r4, [r5, -sp, asr #14]
80015404:	48474141 	stmdami	r7, {r0, r6, r8, lr}^
80015408:	48414844 	stmdami	r1, {r2, r6, fp, lr}^
8001540c:	474a4843 	strbmi	r4, [sl, -r3, asr #16]
80015410:	4845474f 	stmdami	r5, {r0, r1, r2, r3, r6, r8, r9, sl, lr}^
80015414:	41414747 	cmpmi	r1, r7, asr #14
80015418:	484a4844 	stmdami	sl, {r2, r6, fp, lr}^
8001541c:	47444844 	strbmi	r4, [r4, -r4, asr #16]
80015420:	474d4742 	strbmi	r4, [sp, -r2, asr #14]
80015424:	4441474d 	strbmi	r4, [r1], #-1869	@ 0xfffff8b3
80015428:	47484141 	strbmi	r4, [r8, -r1, asr #2]
8001542c:	48454746 	stmdami	r5, {r1, r2, r6, r8, r9, sl, lr}^
80015430:	474a4841 	strbmi	r4, [sl, -r1, asr #16]
80015434:	41414745 	cmpmi	r1, r5, asr #14
80015438:	46504650 			@ <UNDEFINED> instruction: 0x46504650
8001543c:	48444743 	stmdami	r4, {r0, r1, r6, r8, r9, sl, lr}^
80015440:	46504844 	ldrbmi	r4, [r0], -r4, asr #16
80015444:	48454844 	stmdami	r5, {r2, r6, fp, lr}^
80015448:	48434742 	stmdami	r3, {r1, r6, r8, r9, sl, lr}^
8001544c:	46504845 	ldrbmi	r4, [r0], -r5, asr #16
80015450:	41414650 	cmpmi	r1, r0, asr r6
80015454:	474f4846 	strbmi	r4, [pc, -r6, asr #16]
80015458:	474a4844 	strbmi	r4, [sl, -r4, asr #16]
8001545c:	474f4748 	strbmi	r4, [pc, -r8, asr #14]
80015460:	47454746 	strbmi	r4, [r5, -r6, asr #14]
80015464:	47454650 	smlsldmi	r4, r5, r0, r6
80015468:	4847474a 	stmdami	r7, {r1, r3, r6, r8, r9, sl, lr}^
8001546c:	4750474e 	ldrbmi	r4, [r0, -lr, asr #14]
80015470:	41414745 	cmpmi	r1, r5, asr #14
80015474:	48464841 	stmdami	r6, {r0, r6, fp, lr}^
80015478:	47444845 	strbmi	r4, [r4, -r5, asr #16]
8001547c:	41414749 	cmpmi	r1, r9, asr #14
80015480:	47464748 	strbmi	r4, [r6, -r8, asr #14]
80015484:	47444845 	strbmi	r4, [r4, -r5, asr #16]
80015488:	41414749 	cmpmi	r1, r9, asr #14
8001548c:	484a4844 	stmdami	sl, {r2, r6, fp, lr}^
80015490:	47444844 	strbmi	r4, [r4, -r4, asr #16]
80015494:	474d4742 	strbmi	r4, [sp, -r2, asr #14]
80015498:	4443474d 	strbmi	r4, [r3], #-1869	@ 0xfffff8b3
8001549c:	47464141 	strbmi	r4, [r6, -r1, asr #2]
800154a0:	47464849 	strbmi	r4, [r6, -r9, asr #16]
800154a4:	41414744 	cmpmi	r1, r4, asr #14
800154a8:	46504650 			@ <UNDEFINED> instruction: 0x46504650
800154ac:	48444743 	stmdami	r4, {r0, r1, r6, r8, r9, sl, lr}^
800154b0:	46504844 	ldrbmi	r4, [r0], -r4, asr #16
800154b4:	474f4746 	strbmi	r4, [pc, -r6, asr #14]
800154b8:	46504745 	ldrbmi	r4, [r0], -r5, asr #14
800154bc:	41414650 	cmpmi	r1, r0, asr r6
800154c0:	47424848 	strbmi	r4, [r2, -r8, asr #16]
800154c4:	4845474a 	stmdami	r5, {r1, r3, r6, r8, r9, sl, lr}^
800154c8:	47474141 	strbmi	r4, [r7, -r1, asr #2]
800154cc:	48434750 	stmdami	r3, {r4, r6, r8, r9, sl, lr}^
800154d0:	4141474c 	cmpmi	r1, ip, asr #14
800154d4:	46504650 			@ <UNDEFINED> instruction: 0x46504650
800154d8:	48444743 	stmdami	r4, {r0, r1, r6, r8, r9, sl, lr}^
800154dc:	46504844 	ldrbmi	r4, [r0], -r4, asr #16
800154e0:	48454844 	stmdami	r5, {r2, r6, fp, lr}^
800154e4:	48434742 	stmdami	r3, {r1, r6, r8, r9, sl, lr}^
800154e8:	41414845 	cmpmi	r1, r5, asr #16
800154ec:	46504650 			@ <UNDEFINED> instruction: 0x46504650
800154f0:	474f4746 	strbmi	r4, [pc, -r6, asr #14]
800154f4:	46504745 	ldrbmi	r4, [r0], -r5, asr #14
800154f8:	41414650 	cmpmi	r1, r0, asr r6
800154fc:	484a4844 	stmdami	sl, {r2, r6, fp, lr}^
80015500:	47444844 	strbmi	r4, [r4, -r4, asr #16]
80015504:	474d4742 	strbmi	r4, [sp, -r2, asr #14]
80015508:	4442474d 	strbmi	r4, [r2], #-1869	@ 0xfffff8b3
8001550c:	48414141 	stmdami	r1, {r0, r6, r8, lr}^
80015510:	474a4843 	strbmi	r4, [sl, -r3, asr #16]
80015514:	4845474f 	stmdami	r5, {r0, r1, r2, r3, r6, r8, r9, sl, lr}^
80015518:	46504747 	ldrbmi	r4, [r0], -r7, asr #14
8001551c:	47424743 	strbmi	r4, [r2, -r3, asr #14]
80015520:	47464844 	strbmi	r4, [r6, -r4, asr #16]
80015524:	46504141 	ldrbmi	r4, [r0], -r1, asr #2
80015528:	47454746 	strbmi	r4, [r5, -r6, asr #14]
8001552c:	48454742 	stmdami	r5, {r1, r6, r8, r9, sl, lr}^
80015530:	41414742 	cmpmi	r1, r2, asr #14
80015534:	47464650 	smlsldmi	r4, r6, r0, r6
80015538:	4745474f 	strbmi	r4, [r5, -pc, asr #14]
8001553c:	47464141 	strbmi	r4, [r6, -r1, asr #2]
80015540:	474a4849 	strbmi	r4, [sl, -r9, asr #16]
80015544:	41414845 	cmpmi	r1, r5, asr #16
80015548:	48444650 	stmdami	r4, {r4, r6, r9, sl, lr}^
8001554c:	47424845 	strbmi	r4, [r2, -r5, asr #16]
80015550:	474c4744 	strbmi	r4, [ip, -r4, asr #14]
80015554:	46504141 	ldrbmi	r4, [r0], -r1, asr #2
80015558:	47454650 	smlsldmi	r4, r5, r0, r6
8001555c:	48454742 	stmdami	r5, {r1, r6, r8, r9, sl, lr}^
80015560:	46504742 	ldrbmi	r4, [r0], -r2, asr #14
80015564:	48454844 	stmdami	r5, {r2, r6, fp, lr}^
80015568:	48434742 	stmdami	r3, {r1, r6, r8, r9, sl, lr}^
8001556c:	41414845 	cmpmi	r1, r5, asr #16
80015570:	434f4141 	movtmi	r4, #61761	@ 0xf141
80015574:	484a4844 	stmdami	sl, {r2, r6, fp, lr}^
80015578:	4845474e 	stmdami	r5, {r1, r2, r3, r6, r8, r9, sl, lr}^
8001557c:	47434742 	strbmi	r4, [r3, -r2, asr #14]
80015580:	434f4141 	movtmi	r4, #61761	@ 0xf141
80015584:	48454844 	stmdami	r5, {r2, r6, fp, lr}^
80015588:	48454843 	stmdami	r5, {r0, r1, r6, fp, lr}^
8001558c:	47434742 	strbmi	r4, [r3, -r2, asr #14]
80015590:	434f4141 	movtmi	r4, #61761	@ 0xf141
80015594:	47494844 	strbmi	r4, [r9, -r4, asr #16]
80015598:	48454844 	stmdami	r5, {r2, r6, fp, lr}^
8001559c:	48454843 	stmdami	r5, {r0, r1, r6, fp, lr}^
800155a0:	47434742 	strbmi	r4, [r3, -r2, asr #14]
800155a4:	434f4141 	movtmi	r4, #61761	@ 0xf141
800155a8:	47464845 	strbmi	r4, [r6, -r5, asr #16]
800155ac:	48454849 	stmdami	r5, {r0, r3, r6, fp, lr}^
800155b0:	434f4141 	movtmi	r4, #61761	@ 0xf141
800155b4:	47504843 	ldrbmi	r4, [r0, -r3, asr #16]
800155b8:	47424745 	strbmi	r4, [r2, -r5, asr #14]
800155bc:	47424845 	strbmi	r4, [r2, -r5, asr #16]
800155c0:	434f4141 	movtmi	r4, #61761	@ 0xf141
800155c4:	47504748 	ldrbmi	r4, [r0, -r8, asr #14]
800155c8:	41414845 	cmpmi	r1, r5, asr #16
800155cc:	4841434f 	stmdami	r1, {r0, r1, r2, r3, r6, r8, r9, lr}^
800155d0:	48434746 	stmdami	r3, {r1, r2, r6, r8, r9, sl, lr}^
800155d4:	474a4844 	strbmi	r4, [sl, -r4, asr #16]
800155d8:	48454844 	stmdami	r5, {r2, r6, fp, lr}^
800155dc:	474f4746 	strbmi	r4, [pc, -r6, asr #14]
800155e0:	41414845 	cmpmi	r1, r5, asr #16
800155e4:	474f434f 	strbmi	r4, [pc, -pc, asr #6]
800155e8:	474a4750 	smlsldmi	r4, sl, r0, r7
800155ec:	474a474f 	strbmi	r4, [sl, -pc, asr #14]
800155f0:	41414845 	cmpmi	r1, r5, asr #16
800155f4:	4744434f 	strbmi	r4, [r4, -pc, asr #6]
800155f8:	474e4750 	smlsldmi	r4, lr, r0, r7
800155fc:	4746474e 	strbmi	r4, [r6, -lr, asr #14]
80015600:	4845474f 	stmdami	r5, {r0, r1, r2, r3, r6, r8, r9, sl, lr}^
80015604:	434f4141 	movtmi	r4, #61761	@ 0xf141
80015608:	46434542 	strbmi	r4, [r3], -r2, asr #10
8001560c:	434f454e 	movtmi	r4, #62798	@ 0xf54e
80015610:	48454742 	stmdami	r5, {r1, r6, r8, r9, sl, lr}^
80015614:	48434845 	stmdami	r3, {r0, r2, r6, fp, lr}^
80015618:	4743474a 	strbmi	r4, [r3, -sl, asr #14]
8001561c:	48454846 	stmdami	r5, {r1, r2, r6, fp, lr}^
80015620:	48444746 	stmdami	r4, {r1, r2, r6, r8, r9, sl, lr}^
80015624:	41414141 	cmpmi	r1, r1, asr #2
80015628:	41414141 	cmpmi	r1, r1, asr #2
8001562c:	41414141 	cmpmi	r1, r1, asr #2
80015630:	41414141 	cmpmi	r1, r1, asr #2
80015634:	41414141 	cmpmi	r1, r1, asr #2
80015638:	41414141 	cmpmi	r1, r1, asr #2
8001563c:	41414141 	cmpmi	r1, r1, asr #2
80015640:	41414141 	cmpmi	r1, r1, asr #2
80015644:	41414141 	cmpmi	r1, r1, asr #2
80015648:	41414141 	cmpmi	r1, r1, asr #2
8001564c:	41414141 	cmpmi	r1, r1, asr #2
80015650:	41414141 	cmpmi	r1, r1, asr #2
80015654:	41414141 	cmpmi	r1, r1, asr #2
80015658:	41414141 	cmpmi	r1, r1, asr #2
8001565c:	41414141 	cmpmi	r1, r1, asr #2
80015660:	41414141 	cmpmi	r1, r1, asr #2
80015664:	41414141 	cmpmi	r1, r1, asr #2
80015668:	41414141 	cmpmi	r1, r1, asr #2
8001566c:	41414141 	cmpmi	r1, r1, asr #2
80015670:	41414141 	cmpmi	r1, r1, asr #2
80015674:	41414141 	cmpmi	r1, r1, asr #2
80015678:	41414141 	cmpmi	r1, r1, asr #2
8001567c:	4141424c 	cmpmi	r1, ip, asr #4
80015680:	41414141 	cmpmi	r1, r1, asr #2
80015684:	41414142 	cmpmi	r1, r2, asr #2
80015688:	41414141 	cmpmi	r1, r1, asr #2
8001568c:	41414147 	cmpmi	r1, r7, asr #2
80015690:	41414141 	cmpmi	r1, r1, asr #2
80015694:	41424141 	cmpmi	r2, r1, asr #2
80015698:	41414141 	cmpmi	r1, r1, asr #2
8001569c:	41424141 	cmpmi	r2, r1, asr #2
800156a0:	41414141 	cmpmi	r1, r1, asr #2
800156a4:	4149484d 	cmpmi	r9, sp, asr #16
800156a8:	41414141 	cmpmi	r1, r1, asr #2
800156ac:	41414141 	cmpmi	r1, r1, asr #2
800156b0:	41414141 	cmpmi	r1, r1, asr #2
800156b4:	41414141 	cmpmi	r1, r1, asr #2
800156b8:	41414141 	cmpmi	r1, r1, asr #2
800156bc:	41414145 	cmpmi	r1, r5, asr #2
800156c0:	41414141 	cmpmi	r1, r1, asr #2
800156c4:	41414141 	cmpmi	r1, r1, asr #2
800156c8:	41414141 	cmpmi	r1, r1, asr #2
800156cc:	41414342 	cmpmi	r1, r2, asr #6
800156d0:	41414141 	cmpmi	r1, r1, asr #2
800156d4:	41414142 	cmpmi	r1, r2, asr #2
800156d8:	41414141 	cmpmi	r1, r1, asr #2
800156dc:	41414143 	cmpmi	r1, r3, asr #2
800156e0:	41414141 	cmpmi	r1, r1, asr #2
800156e4:	414a484d 	cmpmi	sl, sp, asr #16
800156e8:	41414141 	cmpmi	r1, r1, asr #2
800156ec:	414a484d 	cmpmi	sl, sp, asr #16
800156f0:	41414141 	cmpmi	r1, r1, asr #2
800156f4:	41414a46 	cmpmi	r1, r6, asr #20
800156f8:	41414141 	cmpmi	r1, r1, asr #2
800156fc:	41414141 	cmpmi	r1, r1, asr #2
80015700:	41414141 	cmpmi	r1, r1, asr #2
80015704:	41414141 	cmpmi	r1, r1, asr #2
80015708:	41414141 	cmpmi	r1, r1, asr #2
8001570c:	41414145 	cmpmi	r1, r5, asr #2
80015710:	41414141 	cmpmi	r1, r1, asr #2
80015714:	41414141 	cmpmi	r1, r1, asr #2
80015718:	41414141 	cmpmi	r1, r1, asr #2
8001571c:	4141434a 	cmpmi	r1, sl, asr #6
80015720:	41414141 	cmpmi	r1, r1, asr #2
80015724:	41414142 	cmpmi	r1, r2, asr #2
80015728:	41414141 	cmpmi	r1, r1, asr #2
8001572c:	41414144 	cmpmi	r1, r4, asr #2
80015730:	41414141 	cmpmi	r1, r1, asr #2
80015734:	424b4245 	submi	r4, fp, #1342177284	@ 0x50000004
80015738:	41414141 	cmpmi	r1, r1, asr #2
8001573c:	414b4245 	cmpmi	fp, r5, asr #4
80015740:	41414141 	cmpmi	r1, r1, asr #2
80015744:	41414241 	cmpmi	r1, r1, asr #4
80015748:	41414141 	cmpmi	r1, r1, asr #2
8001574c:	41414141 	cmpmi	r1, r1, asr #2
80015750:	41414141 	cmpmi	r1, r1, asr #2
80015754:	41414141 	cmpmi	r1, r1, asr #2
80015758:	41414141 	cmpmi	r1, r1, asr #2
8001575c:	41414145 	cmpmi	r1, r5, asr #2
80015760:	41414141 	cmpmi	r1, r1, asr #2
80015764:	41414145 	cmpmi	r1, r5, asr #2
80015768:	41414141 	cmpmi	r1, r1, asr #2
8001576c:	4141434f 	cmpmi	r1, pc, asr #6
80015770:	41414141 	cmpmi	r1, r1, asr #2
80015774:	41414142 	cmpmi	r1, r2, asr #2
80015778:	41414141 	cmpmi	r1, r1, asr #2
8001577c:	41414144 	cmpmi	r1, r4, asr #2
80015780:	41414141 	cmpmi	r1, r1, asr #2
80015784:	424b4345 	submi	r4, fp, #335544321	@ 0x14000001
80015788:	41414141 	cmpmi	r1, r1, asr #2
8001578c:	414b4345 	cmpmi	fp, r5, asr #6
80015790:	41414141 	cmpmi	r1, r1, asr #2
80015794:	00000000 	andeq	r0, r0, r0
80015798:	41414141 	cmpmi	r1, r1, asr #2
8001579c:	41414141 	cmpmi	r1, r1, asr #2
800157a0:	41414141 	cmpmi	r1, r1, asr #2
800157a4:	41414141 	cmpmi	r1, r1, asr #2
800157a8:	41414141 	cmpmi	r1, r1, asr #2
800157ac:	41414141 	cmpmi	r1, r1, asr #2
800157b0:	41414145 	cmpmi	r1, r5, asr #2
800157b4:	41414141 	cmpmi	r1, r1, asr #2
800157b8:	41414141 	cmpmi	r1, r1, asr #2
800157bc:	41414141 	cmpmi	r1, r1, asr #2
800157c0:	4141444b 	cmpmi	r1, fp, asr #8
800157c4:	41414141 	cmpmi	r1, r1, asr #2
800157c8:	41414149 	cmpmi	r1, r9, asr #2
800157cc:	41414141 	cmpmi	r1, r1, asr #2
800157d0:	41414144 	cmpmi	r1, r4, asr #2
800157d4:	41414141 	cmpmi	r1, r1, asr #2
800157d8:	424b4345 	submi	r4, fp, #335544321	@ 0x14000001
800157dc:	41414141 	cmpmi	r1, r1, asr #2
800157e0:	41414141 	cmpmi	r1, r1, asr #2
800157e4:	41414141 	cmpmi	r1, r1, asr #2
800157e8:	41414141 	cmpmi	r1, r1, asr #2
800157ec:	41414141 	cmpmi	r1, r1, asr #2
800157f0:	41414141 	cmpmi	r1, r1, asr #2
800157f4:	41414141 	cmpmi	r1, r1, asr #2
800157f8:	41414141 	cmpmi	r1, r1, asr #2
800157fc:	41414141 	cmpmi	r1, r1, asr #2
80015800:	41414145 	cmpmi	r1, r5, asr #2
80015804:	41414141 	cmpmi	r1, r1, asr #2
80015808:	41414141 	cmpmi	r1, r1, asr #2
8001580c:	41414141 	cmpmi	r1, r1, asr #2
80015810:	41414543 	cmpmi	r1, r3, asr #10
80015814:	41414141 	cmpmi	r1, r1, asr #2
80015818:	41414142 	cmpmi	r1, r2, asr #2
8001581c:	41414141 	cmpmi	r1, r1, asr #2
80015820:	41414441 	cmpmi	r1, r1, asr #8
80015824:	41414141 	cmpmi	r1, r1, asr #2
80015828:	41414141 	cmpmi	r1, r1, asr #2
8001582c:	41414141 	cmpmi	r1, r1, asr #2
80015830:	414b4345 	cmpmi	fp, r5, asr #6
80015834:	41414141 	cmpmi	r1, r1, asr #2
80015838:	4141424f 	cmpmi	r1, pc, asr #4
8001583c:	41414141 	cmpmi	r1, r1, asr #2
80015840:	41414141 	cmpmi	r1, r1, asr #2
80015844:	41414141 	cmpmi	r1, r1, asr #2
80015848:	41414141 	cmpmi	r1, r1, asr #2
8001584c:	41414141 	cmpmi	r1, r1, asr #2
80015850:	41414142 	cmpmi	r1, r2, asr #2
80015854:	41414141 	cmpmi	r1, r1, asr #2
80015858:	41414142 	cmpmi	r1, r2, asr #2
8001585c:	41414141 	cmpmi	r1, r1, asr #2
80015860:	4141454c 	cmpmi	r1, ip, asr #10
80015864:	41414141 	cmpmi	r1, r1, asr #2
80015868:	41414144 	cmpmi	r1, r4, asr #2
8001586c:	48414141 	stmdami	r1, {r0, r6, r8, lr}^
80015870:	41414141 	cmpmi	r1, r1, asr #2
80015874:	41414141 	cmpmi	r1, r1, asr #2
80015878:	41414141 	cmpmi	r1, r1, asr #2
8001587c:	41414141 	cmpmi	r1, r1, asr #2
80015880:	414b4543 	cmpmi	fp, r3, asr #10
80015884:	41414141 	cmpmi	r1, r1, asr #2
80015888:	41414350 	cmpmi	r1, r0, asr r3
8001588c:	41414141 	cmpmi	r1, r1, asr #2
80015890:	41414141 	cmpmi	r1, r1, asr #2
80015894:	41414141 	cmpmi	r1, r1, asr #2
80015898:	41414141 	cmpmi	r1, r1, asr #2
8001589c:	41414141 	cmpmi	r1, r1, asr #2
800158a0:	41414142 	cmpmi	r1, r2, asr #2
800158a4:	41414141 	cmpmi	r1, r1, asr #2
800158a8:	41414141 	cmpmi	r1, r1, asr #2
800158ac:	41414141 	cmpmi	r1, r1, asr #2
800158b0:	41414142 	cmpmi	r1, r2, asr #2
800158b4:	41414141 	cmpmi	r1, r1, asr #2
800158b8:	41414143 	cmpmi	r1, r3, asr #2
800158bc:	41414141 	cmpmi	r1, r1, asr #2
800158c0:	41414141 	cmpmi	r1, r1, asr #2
800158c4:	41414141 	cmpmi	r1, r1, asr #2
800158c8:	41414141 	cmpmi	r1, r1, asr #2
800158cc:	41414141 	cmpmi	r1, r1, asr #2
800158d0:	414b4845 	cmpmi	fp, r5, asr #16
800158d4:	41414141 	cmpmi	r1, r1, asr #2
800158d8:	41444641 	cmpmi	r4, r1, asr #12
800158dc:	41414141 	cmpmi	r1, r1, asr #2
800158e0:	4141414a 	cmpmi	r1, sl, asr #2
800158e4:	41414141 	cmpmi	r1, r1, asr #2
800158e8:	4141424e 	cmpmi	r1, lr, asr #4
800158ec:	41414141 	cmpmi	r1, r1, asr #2
800158f0:	41414145 	cmpmi	r1, r5, asr #2
800158f4:	41414141 	cmpmi	r1, r1, asr #2
800158f8:	41414241 	cmpmi	r1, r1, asr #4
800158fc:	41414141 	cmpmi	r1, r1, asr #2
80015900:	4141414a 	cmpmi	r1, sl, asr #2
80015904:	41414141 	cmpmi	r1, r1, asr #2
80015908:	41414144 	cmpmi	r1, r4, asr #2
8001590c:	41414141 	cmpmi	r1, r1, asr #2
80015910:	41414141 	cmpmi	r1, r1, asr #2
80015914:	41414141 	cmpmi	r1, r1, asr #2
80015918:	41414141 	cmpmi	r1, r1, asr #2
8001591c:	41414141 	cmpmi	r1, r1, asr #2
80015920:	414e4d45 	cmpmi	lr, r5, asr #26
80015924:	41414141 	cmpmi	r1, r1, asr #2
80015928:	4142434b 	cmpmi	r2, fp, asr #6
8001592c:	41414141 	cmpmi	r1, r1, asr #2
80015930:	41414141 	cmpmi	r1, r1, asr #2
80015934:	41414141 	cmpmi	r1, r1, asr #2
80015938:	41414141 	cmpmi	r1, r1, asr #2
8001593c:	41414141 	cmpmi	r1, r1, asr #2
80015940:	41414142 	cmpmi	r1, r2, asr #2
80015944:	41414141 	cmpmi	r1, r1, asr #2
80015948:	41414141 	cmpmi	r1, r1, asr #2
8001594c:	41414141 	cmpmi	r1, r1, asr #2
80015950:	41414242 	cmpmi	r1, r2, asr #4
80015954:	41414141 	cmpmi	r1, r1, asr #2
80015958:	41414144 	cmpmi	r1, r4, asr #2
8001595c:	41414141 	cmpmi	r1, r1, asr #2
80015960:	41414141 	cmpmi	r1, r1, asr #2
80015964:	41414141 	cmpmi	r1, r1, asr #2
80015968:	41414141 	cmpmi	r1, r1, asr #2
8001596c:	41414141 	cmpmi	r1, r1, asr #2
80015970:	414f4f4f 	cmpmi	pc, pc, asr #30
80015974:	41414141 	cmpmi	r1, r1, asr #2
80015978:	4141464c 	cmpmi	r1, ip, asr #12
8001597c:	41414141 	cmpmi	r1, r1, asr #2
80015980:	41414141 	cmpmi	r1, r1, asr #2
80015984:	41414141 	cmpmi	r1, r1, asr #2
80015988:	41414141 	cmpmi	r1, r1, asr #2
8001598c:	41414141 	cmpmi	r1, r1, asr #2
80015990:	41414142 	cmpmi	r1, r2, asr #2
80015994:	41414141 	cmpmi	r1, r1, asr #2
80015998:	41414141 	cmpmi	r1, r1, asr #2
8001599c:	41414141 	cmpmi	r1, r1, asr #2
800159a0:	00000000 	andeq	r0, r0, r0
800159a4:	45464850 	strbmi	r4, [r6, #-2128]	@ 0xfffff7b0
800159a8:	4547454d 	strbmi	r4, [r7, #-1357]	@ 0xfffffab3
800159ac:	41424142 	cmpmi	r2, r2, asr #2
800159b0:	41414142 	cmpmi	r1, r2, asr #2
800159b4:	41414141 	cmpmi	r1, r1, asr #2
800159b8:	41414141 	cmpmi	r1, r1, asr #2
800159bc:	41414141 	cmpmi	r1, r1, asr #2
800159c0:	41414141 	cmpmi	r1, r1, asr #2
800159c4:	41414143 	cmpmi	r1, r3, asr #2
800159c8:	41414349 	cmpmi	r1, r9, asr #6
800159cc:	41414142 	cmpmi	r1, r2, asr #2
800159d0:	41414141 	cmpmi	r1, r1, asr #2
800159d4:	41424141 	cmpmi	r2, r1, asr #2
800159d8:	41414141 	cmpmi	r1, r1, asr #2
800159dc:	41414445 	cmpmi	r1, r5, asr #8
800159e0:	41414141 	cmpmi	r1, r1, asr #2
800159e4:	4150484d 	cmpmi	r0, sp, asr #16
800159e8:	41414141 	cmpmi	r1, r1, asr #2
800159ec:	41434141 	cmpmi	r3, r1, asr #2
800159f0:	41464141 	cmpmi	r6, r1, asr #2
800159f4:	41414445 	cmpmi	r1, r5, asr #8
800159f8:	41414341 	cmpmi	r1, r1, asr #6
800159fc:	41414143 	cmpmi	r1, r3, asr #2
80015a00:	41414349 	cmpmi	r1, r9, asr #6
80015a04:	4141414c 	cmpmi	r1, ip, asr #2
80015a08:	4141414b 	cmpmi	r1, fp, asr #2
80015a0c:	41414142 	cmpmi	r1, r2, asr #2
80015a10:	41414141 	cmpmi	r1, r1, asr #2
80015a14:	41414141 	cmpmi	r1, r1, asr #2
80015a18:	41414141 	cmpmi	r1, r1, asr #2
80015a1c:	41414141 	cmpmi	r1, r1, asr #2
80015a20:	41414141 	cmpmi	r1, r1, asr #2
80015a24:	41414141 	cmpmi	r1, r1, asr #2
80015a28:	41414141 	cmpmi	r1, r1, asr #2
80015a2c:	414b4542 	cmpmi	fp, r2, asr #10
80015a30:	41414141 	cmpmi	r1, r1, asr #2
80015a34:	414b4542 	cmpmi	fp, r2, asr #10
80015a38:	41414141 	cmpmi	r1, r1, asr #2
80015a3c:	41414146 	cmpmi	r1, r6, asr #2
80015a40:	41414141 	cmpmi	r1, r1, asr #2
80015a44:	42414141 	submi	r4, r1, #1073741840	@ 0x40000010
80015a48:	41414141 	cmpmi	r1, r1, asr #2
80015a4c:	41414142 	cmpmi	r1, r2, asr #2
80015a50:	41414141 	cmpmi	r1, r1, asr #2
80015a54:	414b4545 	cmpmi	fp, r5, asr #10
80015a58:	41414141 	cmpmi	r1, r1, asr #2
80015a5c:	424b4545 	submi	r4, fp, #289406976	@ 0x11400000
80015a60:	41414141 	cmpmi	r1, r1, asr #2
80015a64:	424b4545 	submi	r4, fp, #289406976	@ 0x11400000
80015a68:	41414141 	cmpmi	r1, r1, asr #2
80015a6c:	41414241 	cmpmi	r1, r1, asr #4
80015a70:	41414141 	cmpmi	r1, r1, asr #2
80015a74:	41414241 	cmpmi	r1, r1, asr #4
80015a78:	41414141 	cmpmi	r1, r1, asr #2
80015a7c:	41414147 	cmpmi	r1, r7, asr #2
80015a80:	41414141 	cmpmi	r1, r1, asr #2
80015a84:	42414141 	submi	r4, r1, #1073741840	@ 0x40000010
80015a88:	41414141 	cmpmi	r1, r1, asr #2
80015a8c:	41414141 	cmpmi	r1, r1, asr #2
80015a90:	41414141 	cmpmi	r1, r1, asr #2
80015a94:	41414141 	cmpmi	r1, r1, asr #2
80015a98:	41414141 	cmpmi	r1, r1, asr #2
80015a9c:	41414141 	cmpmi	r1, r1, asr #2
80015aa0:	41414141 	cmpmi	r1, r1, asr #2
80015aa4:	41414141 	cmpmi	r1, r1, asr #2
80015aa8:	41414141 	cmpmi	r1, r1, asr #2
80015aac:	41414141 	cmpmi	r1, r1, asr #2
80015ab0:	41414141 	cmpmi	r1, r1, asr #2
80015ab4:	41414141 	cmpmi	r1, r1, asr #2
80015ab8:	41414141 	cmpmi	r1, r1, asr #2
80015abc:	41414141 	cmpmi	r1, r1, asr #2
80015ac0:	41414141 	cmpmi	r1, r1, asr #2
80015ac4:	41414141 	cmpmi	r1, r1, asr #2
80015ac8:	41414141 	cmpmi	r1, r1, asr #2
80015acc:	41414141 	cmpmi	r1, r1, asr #2
80015ad0:	41414141 	cmpmi	r1, r1, asr #2
80015ad4:	41414141 	cmpmi	r1, r1, asr #2
80015ad8:	41414141 	cmpmi	r1, r1, asr #2
80015adc:	41414141 	cmpmi	r1, r1, asr #2
80015ae0:	41414141 	cmpmi	r1, r1, asr #2
80015ae4:	41414141 	cmpmi	r1, r1, asr #2
80015ae8:	41414141 	cmpmi	r1, r1, asr #2
80015aec:	41414141 	cmpmi	r1, r1, asr #2
80015af0:	41414141 	cmpmi	r1, r1, asr #2
80015af4:	41414141 	cmpmi	r1, r1, asr #2
80015af8:	41414141 	cmpmi	r1, r1, asr #2
80015afc:	41414141 	cmpmi	r1, r1, asr #2
80015b00:	41414141 	cmpmi	r1, r1, asr #2
80015b04:	41414141 	cmpmi	r1, r1, asr #2
80015b08:	41414141 	cmpmi	r1, r1, asr #2
80015b0c:	41414141 	cmpmi	r1, r1, asr #2
80015b10:	41414141 	cmpmi	r1, r1, asr #2
80015b14:	41414141 	cmpmi	r1, r1, asr #2
80015b18:	41414141 	cmpmi	r1, r1, asr #2
80015b1c:	41414141 	cmpmi	r1, r1, asr #2
80015b20:	41414141 	cmpmi	r1, r1, asr #2
80015b24:	41414141 	cmpmi	r1, r1, asr #2
80015b28:	41414141 	cmpmi	r1, r1, asr #2
80015b2c:	41414141 	cmpmi	r1, r1, asr #2
80015b30:	41414141 	cmpmi	r1, r1, asr #2
80015b34:	41414141 	cmpmi	r1, r1, asr #2
80015b38:	41414141 	cmpmi	r1, r1, asr #2
80015b3c:	41414141 	cmpmi	r1, r1, asr #2
80015b40:	41414141 	cmpmi	r1, r1, asr #2
80015b44:	41414141 	cmpmi	r1, r1, asr #2
80015b48:	41414141 	cmpmi	r1, r1, asr #2
80015b4c:	41414141 	cmpmi	r1, r1, asr #2
80015b50:	41414141 	cmpmi	r1, r1, asr #2
80015b54:	41414141 	cmpmi	r1, r1, asr #2
80015b58:	41414141 	cmpmi	r1, r1, asr #2
80015b5c:	41414141 	cmpmi	r1, r1, asr #2
80015b60:	41414141 	cmpmi	r1, r1, asr #2
80015b64:	41414141 	cmpmi	r1, r1, asr #2
80015b68:	41414141 	cmpmi	r1, r1, asr #2
80015b6c:	41414141 	cmpmi	r1, r1, asr #2
80015b70:	41414141 	cmpmi	r1, r1, asr #2
80015b74:	41414141 	cmpmi	r1, r1, asr #2
80015b78:	41414141 	cmpmi	r1, r1, asr #2
80015b7c:	41414141 	cmpmi	r1, r1, asr #2
80015b80:	41414141 	cmpmi	r1, r1, asr #2
80015b84:	41414141 	cmpmi	r1, r1, asr #2
80015b88:	41414141 	cmpmi	r1, r1, asr #2
80015b8c:	41414141 	cmpmi	r1, r1, asr #2
80015b90:	41414141 	cmpmi	r1, r1, asr #2
80015b94:	41414141 	cmpmi	r1, r1, asr #2
80015b98:	41414141 	cmpmi	r1, r1, asr #2
80015b9c:	41414141 	cmpmi	r1, r1, asr #2
80015ba0:	41414141 	cmpmi	r1, r1, asr #2
80015ba4:	4d41414e 	stclmi	1, cr4, [r1, #-312]	@ 0xfffffec8
80015ba8:	4f424b41 	svcmi	0x00424b41
80015bac:	4e494241 	cdpmi	2, 4, cr4, cr9, cr1, {2}
80015bb0:	4f4a434e 	svcmi	0x004a434e
80015bb4:	4c414145 	mcrrmi	1, 4, r4, r1, cr5
80015bb8:	4f43454d 	svcmi	0x0043454d
80015bbc:	4e41414d 	cdpmi	1, 4, cr4, cr1, cr13, {2}
80015bc0:	4f43454e 	svcmi	0x0043454e
80015bc4:	45414749 	strbmi	r4, [r1, #-1865]	@ 0xfffff8b7
80015bc8:	4f464a50 	svcmi	0x00464a50
80015bcc:	45414145 	strbmi	r4, [r1, #-325]	@ 0xfffffebb
80015bd0:	4f414950 	svcmi	0x00414950
80015bd4:	41414750 	cmpmi	r1, r0, asr r7
80015bd8:	4f4c4141 	svcmi	0x004c4141
80015bdc:	41414249 	cmpmi	r1, r9, asr #4
80015be0:	4f46414c 	svcmi	0x0046414c
80015be4:	44414249 	strbmi	r4, [r1], #-585	@ 0xfffffdb7
80015be8:	4f46424c 	svcmi	0x0046424c
80015bec:	41414141 	cmpmi	r1, r1, asr #2
80015bf0:	4f444644 	svcmi	0x00444644
80015bf4:	4141414a 	cmpmi	r1, sl, asr #2
80015bf8:	424b4141 	submi	r4, fp, #1073741840	@ 0x40000010
80015bfc:	44414641 	strbmi	r4, [r1], #-1601	@ 0xfffff9bf
80015c00:	4f464a50 	svcmi	0x00464a50
80015c04:	44414144 	strbmi	r4, [r1], #-324	@ 0xfffffebc
80015c08:	4f414950 	svcmi	0x00414950
80015c0c:	42414144 	submi	r4, r1, #68, 2
80015c10:	4f424b41 	svcmi	0x00424b41
80015c14:	44414549 	strbmi	r4, [r1], #-1353	@ 0xfffffab7
80015c18:	4f464a50 	svcmi	0x00464a50
80015c1c:	44414144 	strbmi	r4, [r1], #-324	@ 0xfffffebc
80015c20:	4f484a45 	svcmi	0x00484a45
80015c24:	41414144 	cmpmi	r1, r4, asr #2
80015c28:	4f424b41 	svcmi	0x00424b41
80015c2c:	4141494a 	cmpmi	r1, sl, asr #18
80015c30:	4f4c4141 	svcmi	0x004c4141
80015c34:	41414142 	cmpmi	r1, r2, asr #2
80015c38:	4f444b41 	svcmi	0x00444b41
80015c3c:	4141474b 	cmpmi	r1, fp, asr #14
80015c40:	4f4c4141 	svcmi	0x004c4141
80015c44:	41414149 	cmpmi	r1, r9, asr #2
80015c48:	4f4b4141 	svcmi	0x004b4141
80015c4c:	44414441 	strbmi	r4, [r1], #-1089	@ 0xfffffbbf
80015c50:	4f464a50 	svcmi	0x00464a50
80015c54:	44414144 	strbmi	r4, [r1], #-324	@ 0xfffffebc
80015c58:	4f414950 	svcmi	0x00414950
80015c5c:	42414144 	submi	r4, r1, #68, 2
80015c60:	4f424b41 	svcmi	0x00424b41
80015c64:	44414341 	strbmi	r4, [r1], #-833	@ 0xfffffcbf
80015c68:	4f464a50 	svcmi	0x00464a50
80015c6c:	44414144 	strbmi	r4, [r1], #-324	@ 0xfffffebc
80015c70:	4f484a45 	svcmi	0x00484a45
80015c74:	41414144 	cmpmi	r1, r4, asr #2
80015c78:	4f424b41 	svcmi	0x00424b41
80015c7c:	41414850 	cmpmi	r1, r0, asr r8
80015c80:	4f4c4141 	svcmi	0x004c4141
80015c84:	41414249 	cmpmi	r1, r9, asr #4
80015c88:	4f46424c 	svcmi	0x0046424c
80015c8c:	41414843 	cmpmi	r1, r3, asr #16
80015c90:	4f4c4141 	svcmi	0x004c4141
80015c94:	41414141 	cmpmi	r1, r1, asr #2
80015c98:	4f444b41 	svcmi	0x00444b41
80015c9c:	41414544 	cmpmi	r1, r4, asr #10
80015ca0:	4f4c4141 	svcmi	0x004c4141
80015ca4:	424a4349 	submi	r4, sl, #603979777	@ 0x24000001
80015ca8:	41414141 	cmpmi	r1, r1, asr #2
80015cac:	4149474d 	cmpmi	r9, sp, asr #14
80015cb0:	41414141 	cmpmi	r1, r1, asr #2
80015cb4:	4141414d 	cmpmi	r1, sp, asr #2
80015cb8:	41414141 	cmpmi	r1, r1, asr #2
80015cbc:	4149464d 	cmpmi	r9, sp, asr #12
80015cc0:	41414141 	cmpmi	r1, r1, asr #2
80015cc4:	4d41414e 	stclmi	1, cr4, [r1, #-312]	@ 0xfffffec8
80015cc8:	4f424b41 	svcmi	0x00424b41
80015ccc:	4e494141 	cdpmi	1, 4, cr4, cr9, cr1, {2}
80015cd0:	4f4a434e 	svcmi	0x004a434e
80015cd4:	4c414145 	mcrrmi	1, 4, r4, r1, cr5
80015cd8:	4f43454d 	svcmi	0x0043454d
80015cdc:	4e414241 	cdpmi	2, 4, cr4, cr1, cr1, {2}
80015ce0:	4f43454e 	svcmi	0x0043454e
80015ce4:	44414141 	strbmi	r4, [r1], #-321	@ 0xfffffebf
80015ce8:	4f424b41 	svcmi	0x00424b41
80015cec:	44414246 	strbmi	r4, [r1], #-582	@ 0xfffffdba
80015cf0:	4f46454c 	svcmi	0x0046454c
80015cf4:	41414246 	cmpmi	r1, r6, asr #4
80015cf8:	4f46424c 	svcmi	0x0046424c
80015cfc:	41414141 	cmpmi	r1, r1, asr #2
80015d00:	4f504141 	svcmi	0x00504141
80015d04:	41414241 	cmpmi	r1, r1, asr #4
80015d08:	4f46414c 	svcmi	0x0046414c
80015d0c:	44414241 	strbmi	r4, [r1], #-577	@ 0xfffffdbf
80015d10:	4f46424c 	svcmi	0x0046424c
80015d14:	41414144 	cmpmi	r1, r4, asr #2
80015d18:	4f424b41 	svcmi	0x00424b41
80015d1c:	4e41414d 	cdpmi	1, 4, cr4, cr1, cr13, {2}
80015d20:	4f43454c 	svcmi	0x0043454c
80015d24:	4b494141 	blmi	81266230 <irq_stack_start+0x120c220>
80015d28:	4f494a4e 	svcmi	0x00494a4e
80015d2c:	4d41414e 	stclmi	1, cr4, [r1, #-312]	@ 0xfffffec8
80015d30:	4f424b41 	svcmi	0x00424b41
80015d34:	4e494141 	cdpmi	1, 4, cr4, cr9, cr1, {2}
80015d38:	4f4a434e 	svcmi	0x004a434e
80015d3c:	4c414145 	mcrrmi	1, 4, r4, r1, cr5
80015d40:	4f43454d 	svcmi	0x0043454d
80015d44:	4e414241 	cdpmi	2, 4, cr4, cr1, cr1, {2}
80015d48:	4f43454e 	svcmi	0x0043454e
80015d4c:	44414141 	strbmi	r4, [r1], #-321	@ 0xfffffebf
80015d50:	4f424b41 	svcmi	0x00424b41
80015d54:	4241424d 	submi	r4, r1, #-805306364	@ 0xd0000004
80015d58:	4f46414c 	svcmi	0x0046414c
80015d5c:	44414246 	strbmi	r4, [r1], #-582	@ 0xfffffdba
80015d60:	4f46454c 	svcmi	0x0046454c
80015d64:	41414246 	cmpmi	r1, r6, asr #4
80015d68:	4f46424c 	svcmi	0x0046424c
80015d6c:	4241424d 	submi	r4, r1, #-805306364	@ 0xd0000004
80015d70:	4f46424c 	svcmi	0x0046424c
80015d74:	41414141 	cmpmi	r1, r1, asr #2
80015d78:	4f504141 	svcmi	0x00504141
80015d7c:	41414241 	cmpmi	r1, r1, asr #4
80015d80:	4f46414c 	svcmi	0x0046414c
80015d84:	44414241 	strbmi	r4, [r1], #-577	@ 0xfffffdbf
80015d88:	4f46424c 	svcmi	0x0046424c
80015d8c:	41414144 	cmpmi	r1, r4, asr #2
80015d90:	4f424b41 	svcmi	0x00424b41
80015d94:	4e41414d 	cdpmi	1, 4, cr4, cr1, cr13, {2}
80015d98:	4f43454c 	svcmi	0x0043454c
80015d9c:	4b494141 	blmi	812662a8 <irq_stack_start+0x120c298>
80015da0:	4f494a4e 	svcmi	0x00494a4e
80015da4:	4d41414e 	stclmi	1, cr4, [r1, #-312]	@ 0xfffffec8
80015da8:	4f424b41 	svcmi	0x00424b41
80015dac:	4e494141 	cdpmi	1, 4, cr4, cr9, cr1, {2}
80015db0:	4f4a434e 	svcmi	0x004a434e
80015db4:	4c414145 	mcrrmi	1, 4, r4, r1, cr5
80015db8:	4f43454d 	svcmi	0x0043454d
80015dbc:	4e414249 	cdpmi	2, 4, cr4, cr1, cr9, {2}
80015dc0:	4f43454e 	svcmi	0x0043454e
80015dc4:	44414141 	strbmi	r4, [r1], #-321	@ 0xfffffebf
80015dc8:	4f424b41 	svcmi	0x00424b41
80015dcc:	4241424d 	submi	r4, r1, #-805306364	@ 0xd0000004
80015dd0:	4f46414c 	svcmi	0x0046414c
80015dd4:	43414341 	movtmi	r4, #4929	@ 0x1341
80015dd8:	4f46414c 	svcmi	0x0046414c
80015ddc:	44414246 	strbmi	r4, [r1], #-582	@ 0xfffffdba
80015de0:	4f46454c 	svcmi	0x0046454c
80015de4:	41414246 	cmpmi	r1, r6, asr #4
80015de8:	4f46424c 	svcmi	0x0046424c
80015dec:	4241424d 	submi	r4, r1, #-805306364	@ 0xd0000004
80015df0:	4f46424c 	svcmi	0x0046424c
80015df4:	43414341 	movtmi	r4, #4929	@ 0x1341
80015df8:	4f46424c 	svcmi	0x0046424c
80015dfc:	41414141 	cmpmi	r1, r1, asr #2
80015e00:	4f504141 	svcmi	0x00504141
80015e04:	41414241 	cmpmi	r1, r1, asr #4
80015e08:	4f46414c 	svcmi	0x0046414c
80015e0c:	44414241 	strbmi	r4, [r1], #-577	@ 0xfffffdbf
80015e10:	4f46424c 	svcmi	0x0046424c
80015e14:	41414144 	cmpmi	r1, r4, asr #2
80015e18:	4f424b41 	svcmi	0x00424b41
80015e1c:	4e41414d 	cdpmi	1, 4, cr4, cr1, cr13, {2}
80015e20:	4f43454c 	svcmi	0x0043454c
80015e24:	4b494141 	blmi	81266330 <irq_stack_start+0x120c320>
80015e28:	4f494a4e 	svcmi	0x00494a4e
80015e2c:	4d41414e 	stclmi	1, cr4, [r1, #-312]	@ 0xfffffec8
80015e30:	4f424b41 	svcmi	0x00424b41
80015e34:	4e494141 	cdpmi	1, 4, cr4, cr9, cr1, {2}
80015e38:	4f4a434e 	svcmi	0x004a434e
80015e3c:	4c414145 	mcrrmi	1, 4, r4, r1, cr5
80015e40:	4f43454d 	svcmi	0x0043454d
80015e44:	4e414149 	cdpmi	1, 4, cr4, cr1, cr9, {2}
80015e48:	4f43454e 	svcmi	0x0043454e
80015e4c:	41414241 	cmpmi	r1, r1, asr #4
80015e50:	4f46414c 	svcmi	0x0046414c
80015e54:	42414241 	submi	r4, r1, #268435460	@ 0x10000004
80015e58:	4f46424c 	svcmi	0x0046424c
80015e5c:	41414141 	cmpmi	r1, r1, asr #2
80015e60:	4f444b41 	svcmi	0x00444b41
80015e64:	50504e48 	subspl	r4, r0, r8, asr #28
80015e68:	4f4c5050 	svcmi	0x004c5050
80015e6c:	50414141 	subpl	r4, r1, r1, asr #2
80015e70:	4f444341 	svcmi	0x00444341
80015e74:	4e41414d 	cdpmi	1, 4, cr4, cr1, cr13, {2}
80015e78:	4f43454c 	svcmi	0x0043454c
80015e7c:	4b494141 	blmi	81266388 <irq_stack_start+0x120c378>
80015e80:	4f494a4e 	svcmi	0x00494a4e
80015e84:	4d41414e 	stclmi	1, cr4, [r1, #-312]	@ 0xfffffec8
80015e88:	4f424b41 	svcmi	0x00424b41
80015e8c:	4e494141 	cdpmi	1, 4, cr4, cr9, cr1, {2}
80015e90:	4f4a434e 	svcmi	0x004a434e
80015e94:	4c414145 	mcrrmi	1, 4, r4, r1, cr5
80015e98:	4f43454d 	svcmi	0x0043454d
80015e9c:	41414142 	cmpmi	r1, r2, asr #2
80015ea0:	4f444b41 	svcmi	0x00444b41
80015ea4:	50504d43 	subspl	r4, r0, r3, asr #26
80015ea8:	4f4c5050 	svcmi	0x004c5050
80015eac:	44414141 	strbmi	r4, [r1], #-321	@ 0xfffffebf
80015eb0:	4f424b41 	svcmi	0x00424b41
80015eb4:	41414144 	cmpmi	r1, r4, asr #2
80015eb8:	4f424b41 	svcmi	0x00424b41
80015ebc:	4b494141 	blmi	812663c8 <irq_stack_start+0x120c3b8>
80015ec0:	4f494a4e 	svcmi	0x00494a4e
80015ec4:	4d41414e 	stclmi	1, cr4, [r1, #-312]	@ 0xfffffec8
80015ec8:	4f424b41 	svcmi	0x00424b41
80015ecc:	4e494141 	cdpmi	1, 4, cr4, cr9, cr1, {2}
80015ed0:	4f4a434e 	svcmi	0x004a434e
80015ed4:	4c414145 	mcrrmi	1, 4, r4, r1, cr5
80015ed8:	4f43454d 	svcmi	0x0043454d
80015edc:	4e414149 	cdpmi	1, 4, cr4, cr1, cr9, {2}
80015ee0:	4f43454e 	svcmi	0x0043454e
80015ee4:	41414241 	cmpmi	r1, r1, asr #4
80015ee8:	4f46414c 	svcmi	0x0046414c
80015eec:	42414241 	submi	r4, r1, #268435460	@ 0x10000004
80015ef0:	4f46424c 	svcmi	0x0046424c
80015ef4:	41414143 	cmpmi	r1, r3, asr #2
80015ef8:	4f444b41 	svcmi	0x00444b41
80015efc:	50504d45 	subspl	r4, r0, r5, asr #26
80015f00:	4f4c5050 	svcmi	0x004c5050
80015f04:	50414141 	subpl	r4, r1, r1, asr #2
80015f08:	4f444341 	svcmi	0x00444341
80015f0c:	4e41414d 	cdpmi	1, 4, cr4, cr1, cr13, {2}
80015f10:	4f43454c 	svcmi	0x0043454c
80015f14:	4b494141 	blmi	81266420 <irq_stack_start+0x120c410>
80015f18:	4f494a4e 	svcmi	0x00494a4e
80015f1c:	4d41414e 	stclmi	1, cr4, [r1, #-312]	@ 0xfffffec8
80015f20:	4f424b41 	svcmi	0x00424b41
80015f24:	4e494141 	cdpmi	1, 4, cr4, cr9, cr1, {2}
80015f28:	4f4a434e 	svcmi	0x004a434e
80015f2c:	4c414145 	mcrrmi	1, 4, r4, r1, cr5
80015f30:	4f43454d 	svcmi	0x0043454d
80015f34:	41414144 	cmpmi	r1, r4, asr #2
80015f38:	4f444b41 	svcmi	0x00444b41
80015f3c:	50504b50 	subspl	r4, r0, r0, asr fp
80015f40:	4f4c5050 	svcmi	0x004c5050
80015f44:	44414141 	strbmi	r4, [r1], #-321	@ 0xfffffebf
80015f48:	4f424b41 	svcmi	0x00424b41
80015f4c:	41414144 	cmpmi	r1, r4, asr #2
80015f50:	4f424b41 	svcmi	0x00424b41
80015f54:	4b494141 	blmi	81266460 <irq_stack_start+0x120c450>
80015f58:	4f494a4e 	svcmi	0x00494a4e
80015f5c:	4d41414e 	stclmi	1, cr4, [r1, #-312]	@ 0xfffffec8
80015f60:	4f424b41 	svcmi	0x00424b41
80015f64:	4e494141 	cdpmi	1, 4, cr4, cr9, cr1, {2}
80015f68:	4f4a434e 	svcmi	0x004a434e
80015f6c:	4c414145 	mcrrmi	1, 4, r4, r1, cr5
80015f70:	4f43454d 	svcmi	0x0043454d
80015f74:	41414145 	cmpmi	r1, r5, asr #2
80015f78:	4f444b41 	svcmi	0x00444b41
80015f7c:	50504b48 	subspl	r4, r0, r8, asr #22
80015f80:	4f4c5050 	svcmi	0x004c5050
80015f84:	44414141 	strbmi	r4, [r1], #-321	@ 0xfffffebf
80015f88:	4f424b41 	svcmi	0x00424b41
80015f8c:	41414144 	cmpmi	r1, r4, asr #2
80015f90:	4f424b41 	svcmi	0x00424b41
80015f94:	4b494141 	blmi	812664a0 <irq_stack_start+0x120c490>
80015f98:	4f494a4e 	svcmi	0x00494a4e
80015f9c:	4d41414e 	stclmi	1, cr4, [r1, #-312]	@ 0xfffffec8
80015fa0:	4f424b41 	svcmi	0x00424b41
80015fa4:	4e494141 	cdpmi	1, 4, cr4, cr9, cr1, {2}
80015fa8:	4f4a434e 	svcmi	0x004a434e
80015fac:	4c414145 	mcrrmi	1, 4, r4, r1, cr5
80015fb0:	4f43454d 	svcmi	0x0043454d
80015fb4:	4e414149 	cdpmi	1, 4, cr4, cr1, cr9, {2}
80015fb8:	4f43454e 	svcmi	0x0043454e
80015fbc:	41414241 	cmpmi	r1, r1, asr #4
80015fc0:	4f46414c 	svcmi	0x0046414c
80015fc4:	42414241 	submi	r4, r1, #268435460	@ 0x10000004
80015fc8:	4f46424c 	svcmi	0x0046424c
80015fcc:	41414146 	cmpmi	r1, r6, asr #2
80015fd0:	4f444b41 	svcmi	0x00444b41
80015fd4:	50504b4a 	subspl	r4, r0, sl, asr #22
80015fd8:	4f4c5050 	svcmi	0x004c5050
80015fdc:	50414141 	subpl	r4, r1, r1, asr #2
80015fe0:	4f444341 	svcmi	0x00444341
80015fe4:	4e41414d 	cdpmi	1, 4, cr4, cr1, cr13, {2}
80015fe8:	4f43454c 	svcmi	0x0043454c
80015fec:	4b494141 	blmi	812664f8 <irq_stack_start+0x120c4e8>
80015ff0:	4f494a4e 	svcmi	0x00494a4e
80015ff4:	4d41414e 	stclmi	1, cr4, [r1, #-312]	@ 0xfffffec8
80015ff8:	4f424b41 	svcmi	0x00424b41
80015ffc:	4e494141 	cdpmi	1, 4, cr4, cr9, cr1, {2}
80016000:	4f4a434e 	svcmi	0x004a434e
80016004:	4c414145 	mcrrmi	1, 4, r4, r1, cr5
80016008:	4f43454d 	svcmi	0x0043454d
8001600c:	41414147 	cmpmi	r1, r7, asr #2
80016010:	4f444b41 	svcmi	0x00444b41
80016014:	50504a45 	subspl	r4, r0, r5, asr #20
80016018:	4f4c5050 	svcmi	0x004c5050
8001601c:	50414141 	subpl	r4, r1, r1, asr #2
80016020:	4f444341 	svcmi	0x00444341
80016024:	4b494141 	blmi	81266530 <irq_stack_start+0x120c520>
80016028:	4f494a4e 	svcmi	0x00494a4e
8001602c:	4d41414e 	stclmi	1, cr4, [r1, #-312]	@ 0xfffffec8
80016030:	4f424b41 	svcmi	0x00424b41
80016034:	4e494141 	cdpmi	1, 4, cr4, cr9, cr1, {2}
80016038:	4f4a434e 	svcmi	0x004a434e
8001603c:	4c414145 	mcrrmi	1, 4, r4, r1, cr5
80016040:	4f43454d 	svcmi	0x0043454d
80016044:	4e414149 	cdpmi	1, 4, cr4, cr1, cr9, {2}
80016048:	4f43454e 	svcmi	0x0043454e
8001604c:	41414241 	cmpmi	r1, r1, asr #4
80016050:	4f46414c 	svcmi	0x0046414c
80016054:	42414241 	submi	r4, r1, #268435460	@ 0x10000004
80016058:	4f46424c 	svcmi	0x0046424c
8001605c:	41414148 	cmpmi	r1, r8, asr #2
80016060:	4f444b41 	svcmi	0x00444b41
80016064:	50504a48 	subspl	r4, r0, r8, asr #20
80016068:	4f4c5050 	svcmi	0x004c5050
8001606c:	50414141 	subpl	r4, r1, r1, asr #2
80016070:	4f444341 	svcmi	0x00444341
80016074:	4e41414d 	cdpmi	1, 4, cr4, cr1, cr13, {2}
80016078:	4f43454c 	svcmi	0x0043454c
8001607c:	4b494141 	blmi	81266588 <irq_stack_start+0x120c578>
80016080:	4f494a4e 	svcmi	0x00494a4e
80016084:	4d41414e 	stclmi	1, cr4, [r1, #-312]	@ 0xfffffec8
80016088:	4f424b41 	svcmi	0x00424b41
8001608c:	4141414f 	cmpmi	r1, pc, asr #2
80016090:	4f4a434e 	svcmi	0x004a434e
80016094:	4e494141 	cdpmi	1, 4, cr4, cr9, cr1, {2}
80016098:	4f4a434e 	svcmi	0x004a434e
8001609c:	4c414241 	mcrrmi	2, 4, r4, r1, cr1
800160a0:	4f43454d 	svcmi	0x0043454d
800160a4:	4e504548 	cdpmi	5, 5, cr4, cr0, cr8, {2}
800160a8:	4f43454e 	svcmi	0x0043454e
800160ac:	41424345 	cmpmi	r2, r5, asr #6
800160b0:	4f46414c 	svcmi	0x0046414c
800160b4:	44414141 	strbmi	r4, [r1], #-321	@ 0xfffffebf
800160b8:	4f444b41 	svcmi	0x00444b41
800160bc:	44414249 	strbmi	r4, [r1], #-585	@ 0xfffffdb7
800160c0:	4f46414c 	svcmi	0x0046414c
800160c4:	44414141 	strbmi	r4, [r1], #-321	@ 0xfffffebf
800160c8:	4f444b41 	svcmi	0x00444b41
800160cc:	44414245 	strbmi	r4, [r1], #-581	@ 0xfffffdbb
800160d0:	4f46414c 	svcmi	0x0046414c
800160d4:	44414149 	strbmi	r4, [r1], #-329	@ 0xfffffeb7
800160d8:	4f43494c 	svcmi	0x0043494c
800160dc:	4442424d 	strbmi	r4, [r2], #-589	@ 0xfffffdb3
800160e0:	4f46414c 	svcmi	0x0046414c
800160e4:	44504547 	ldrbmi	r4, [r0], #-1351	@ 0xfffffab9
800160e8:	4f43454c 	svcmi	0x0043454c
800160ec:	4342424d 	movtmi	r4, #8781	@ 0x224d
800160f0:	4f46424c 	svcmi	0x0046424c
800160f4:	42414145 	submi	r4, r1, #1073741841	@ 0x40000011
800160f8:	4f464a4c 	svcmi	0x00464a4c
800160fc:	41414144 	cmpmi	r1, r4, asr #2
80016100:	4f424b41 	svcmi	0x00424b41
80016104:	41414247 	cmpmi	r1, r7, asr #4
80016108:	4f4c4141 	svcmi	0x004c4141
8001610c:	41414249 	cmpmi	r1, r9, asr #4
80016110:	4f46414c 	svcmi	0x0046414c
80016114:	4141414b 	cmpmi	r1, fp, asr #2
80016118:	4f4b4141 	svcmi	0x004b4141
8001611c:	43504547 	cmpmi	r0, #297795584	@ 0x11c00000
80016120:	4f43454c 	svcmi	0x0043454c
80016124:	44414245 	strbmi	r4, [r1], #-581	@ 0xfffffdbb
80016128:	4f46424c 	svcmi	0x0046424c
8001612c:	44414144 	strbmi	r4, [r1], #-324	@ 0xfffffebc
80016130:	4f414943 	svcmi	0x00414943
80016134:	44414141 	strbmi	r4, [r1], #-321	@ 0xfffffebf
80016138:	4f464e44 	svcmi	0x00464e44
8001613c:	43414144 	movtmi	r4, #4420	@ 0x1144
80016140:	4f424b41 	svcmi	0x00424b41
80016144:	44424345 	strbmi	r4, [r2], #-837	@ 0xfffffcbb
80016148:	4f46424c 	svcmi	0x0046424c
8001614c:	41414143 	cmpmi	r1, r3, asr #2
80016150:	4f424b41 	svcmi	0x00424b41
80016154:	50504444 	subspl	r4, r0, r4, asr #8
80016158:	4f424350 	svcmi	0x00424350
8001615c:	44414245 	strbmi	r4, [r1], #-581	@ 0xfffffdbb
80016160:	4f46424c 	svcmi	0x0046424c
80016164:	44414142 	strbmi	r4, [r1], #-322	@ 0xfffffebe
80016168:	4f434944 	svcmi	0x00434944
8001616c:	44414245 	strbmi	r4, [r1], #-581	@ 0xfffffdbb
80016170:	4f46414c 	svcmi	0x0046414c
80016174:	43504547 	cmpmi	r0, #297795584	@ 0x11c00000
80016178:	4f43454c 	svcmi	0x0043454c
8001617c:	44414245 	strbmi	r4, [r1], #-581	@ 0xfffffdbb
80016180:	4f46424c 	svcmi	0x0046424c
80016184:	44414144 	strbmi	r4, [r1], #-324	@ 0xfffffebc
80016188:	4f414943 	svcmi	0x00414943
8001618c:	44414141 	strbmi	r4, [r1], #-321	@ 0xfffffebf
80016190:	4f464e44 	svcmi	0x00464e44
80016194:	41414141 	cmpmi	r1, r1, asr #2
80016198:	4f444644 	svcmi	0x00444644
8001619c:	50504f4f 	subspl	r4, r0, pc, asr #30
800161a0:	424b5050 	submi	r5, fp, #80	@ 0x50
800161a4:	44414249 	strbmi	r4, [r1], #-585	@ 0xfffffdb7
800161a8:	4f46424c 	svcmi	0x0046424c
800161ac:	41414144 	cmpmi	r1, r4, asr #2
800161b0:	4f424b41 	svcmi	0x00424b41
800161b4:	4e41414d 	cdpmi	1, 4, cr4, cr1, cr13, {2}
800161b8:	4f43454c 	svcmi	0x0043454c
800161bc:	4b494141 	blmi	812666c8 <irq_stack_start+0x120c6b8>
800161c0:	4f494a4e 	svcmi	0x00494a4e
800161c4:	4d41414e 	stclmi	1, cr4, [r1, #-312]	@ 0xfffffec8
800161c8:	4f424b41 	svcmi	0x00424b41
800161cc:	4e494141 	cdpmi	1, 4, cr4, cr9, cr1, {2}
800161d0:	4f4a434e 	svcmi	0x004a434e
800161d4:	4c414145 	mcrrmi	1, 4, r4, r1, cr5
800161d8:	4f43454d 	svcmi	0x0043454d
800161dc:	4e414441 	cdpmi	4, 4, cr4, cr1, cr1, {2}
800161e0:	4f43454e 	svcmi	0x0043454e
800161e4:	41414441 	cmpmi	r1, r1, asr #8
800161e8:	4f46414c 	svcmi	0x0046414c
800161ec:	42414445 	submi	r4, r1, #1157627904	@ 0x45000000
800161f0:	4f46414c 	svcmi	0x0046414c
800161f4:	43414449 	movtmi	r4, #5193	@ 0x1449
800161f8:	4f46414c 	svcmi	0x0046414c
800161fc:	44414141 	strbmi	r4, [r1], #-321	@ 0xfffffebf
80016200:	4f444b41 	svcmi	0x00444b41
80016204:	44414241 	strbmi	r4, [r1], #-577	@ 0xfffffdbf
80016208:	4f46414c 	svcmi	0x0046414c
8001620c:	44414141 	strbmi	r4, [r1], #-321	@ 0xfffffebf
80016210:	4f444b41 	svcmi	0x00444b41
80016214:	44414245 	strbmi	r4, [r1], #-581	@ 0xfffffdbb
80016218:	4f46414c 	svcmi	0x0046414c
8001621c:	41414a47 	cmpmi	r1, r7, asr #20
80016220:	4f4b4141 	svcmi	0x004b4141
80016224:	44414141 	strbmi	r4, [r1], #-321	@ 0xfffffebf
80016228:	4f444b41 	svcmi	0x00444b41
8001622c:	44414246 	strbmi	r4, [r1], #-582	@ 0xfffffdba
80016230:	4f46454c 	svcmi	0x0046454c
80016234:	4141414e 	cmpmi	r1, lr, asr #2
80016238:	4f4b4141 	svcmi	0x004b4141
8001623c:	44414241 	strbmi	r4, [r1], #-577	@ 0xfffffdbf
80016240:	4f46424c 	svcmi	0x0046424c
80016244:	43414445 	movtmi	r4, #5189	@ 0x1445
80016248:	4f46424c 	svcmi	0x0046424c
8001624c:	43414144 	movtmi	r4, #4420	@ 0x1144
80016250:	4f414943 	svcmi	0x00414943
80016254:	44414245 	strbmi	r4, [r1], #-581	@ 0xfffffdbb
80016258:	4f46424c 	svcmi	0x0046424c
8001625c:	42414441 	submi	r4, r1, #1090519040	@ 0x41000000
80016260:	4f46424c 	svcmi	0x0046424c
80016264:	44414144 	strbmi	r4, [r1], #-324	@ 0xfffffebc
80016268:	4f414942 	svcmi	0x00414942
8001626c:	43414141 	movtmi	r4, #4417	@ 0x1141
80016270:	4f464e43 	svcmi	0x00464e43
80016274:	43414141 	movtmi	r4, #4417	@ 0x1141
80016278:	4f464d44 	svcmi	0x00464d44
8001627c:	44414245 	strbmi	r4, [r1], #-581	@ 0xfffffdbb
80016280:	4f46424c 	svcmi	0x0046424c
80016284:	44414142 	strbmi	r4, [r1], #-322	@ 0xfffffebe
80016288:	4f434944 	svcmi	0x00434944
8001628c:	44414245 	strbmi	r4, [r1], #-581	@ 0xfffffdbb
80016290:	4f46414c 	svcmi	0x0046414c
80016294:	44414241 	strbmi	r4, [r1], #-577	@ 0xfffffdbf
80016298:	4f46424c 	svcmi	0x0046424c
8001629c:	44414142 	strbmi	r4, [r1], #-322	@ 0xfffffebe
800162a0:	4f434944 	svcmi	0x00434944
800162a4:	44414241 	strbmi	r4, [r1], #-577	@ 0xfffffdbf
800162a8:	4f46414c 	svcmi	0x0046414c
800162ac:	44414241 	strbmi	r4, [r1], #-577	@ 0xfffffdbf
800162b0:	4f46424c 	svcmi	0x0046424c
800162b4:	43414445 	movtmi	r4, #5189	@ 0x1445
800162b8:	4f46424c 	svcmi	0x0046424c
800162bc:	44414144 	strbmi	r4, [r1], #-324	@ 0xfffffebc
800162c0:	4f414943 	svcmi	0x00414943
800162c4:	44414141 	strbmi	r4, [r1], #-321	@ 0xfffffebf
800162c8:	4f464e44 	svcmi	0x00464e44
800162cc:	41414346 	cmpmi	r1, r6, asr #6
800162d0:	4f444644 	svcmi	0x00444644
800162d4:	41414146 	cmpmi	r1, r6, asr #2
800162d8:	414b4141 	cmpmi	fp, r1, asr #2
800162dc:	44414241 	strbmi	r4, [r1], #-577	@ 0xfffffdbf
800162e0:	4f46424c 	svcmi	0x0046424c
800162e4:	43414445 	movtmi	r4, #5189	@ 0x1445
800162e8:	4f46424c 	svcmi	0x0046424c
800162ec:	44414144 	strbmi	r4, [r1], #-324	@ 0xfffffebc
800162f0:	4f414943 	svcmi	0x00414943
800162f4:	44414141 	strbmi	r4, [r1], #-321	@ 0xfffffebf
800162f8:	4f464e44 	svcmi	0x00464e44
800162fc:	41414141 	cmpmi	r1, r1, asr #2
80016300:	4f444644 	svcmi	0x00444644
80016304:	50504f46 	subspl	r4, r0, r6, asr #30
80016308:	424b5050 	submi	r5, fp, #80	@ 0x50
8001630c:	44414241 	strbmi	r4, [r1], #-577	@ 0xfffffdbf
80016310:	4f46424c 	svcmi	0x0046424c
80016314:	43414445 	movtmi	r4, #5189	@ 0x1445
80016318:	4f46424c 	svcmi	0x0046424c
8001631c:	44414144 	strbmi	r4, [r1], #-324	@ 0xfffffebc
80016320:	4f414943 	svcmi	0x00414943
80016324:	44414141 	strbmi	r4, [r1], #-321	@ 0xfffffebf
80016328:	4f464e44 	svcmi	0x00464e44
8001632c:	41414141 	cmpmi	r1, r1, asr #2
80016330:	4f444644 	svcmi	0x00444644
80016334:	4141484a 	cmpmi	r1, sl, asr #16
80016338:	414b4141 	cmpmi	fp, r1, asr #2
8001633c:	44414241 	strbmi	r4, [r1], #-577	@ 0xfffffdbf
80016340:	4f46424c 	svcmi	0x0046424c
80016344:	44414142 	strbmi	r4, [r1], #-322	@ 0xfffffebe
80016348:	4f434944 	svcmi	0x00434944
8001634c:	43414445 	movtmi	r4, #5189	@ 0x1445
80016350:	4f46424c 	svcmi	0x0046424c
80016354:	44414144 	strbmi	r4, [r1], #-324	@ 0xfffffebc
80016358:	4f414943 	svcmi	0x00414943
8001635c:	44414141 	strbmi	r4, [r1], #-321	@ 0xfffffebf
80016360:	4f464e44 	svcmi	0x00464e44
80016364:	41414141 	cmpmi	r1, r1, asr #2
80016368:	4f444644 	svcmi	0x00444644
8001636c:	41414843 	cmpmi	r1, r3, asr #16
80016370:	414b4141 	cmpmi	fp, r1, asr #2
80016374:	44414241 	strbmi	r4, [r1], #-577	@ 0xfffffdbf
80016378:	4f46424c 	svcmi	0x0046424c
8001637c:	44414142 	strbmi	r4, [r1], #-322	@ 0xfffffebe
80016380:	4f434944 	svcmi	0x00434944
80016384:	43414445 	movtmi	r4, #5189	@ 0x1445
80016388:	4f46424c 	svcmi	0x0046424c
8001638c:	44414144 	strbmi	r4, [r1], #-324	@ 0xfffffebc
80016390:	4f414943 	svcmi	0x00414943
80016394:	44414141 	strbmi	r4, [r1], #-321	@ 0xfffffebf
80016398:	4f464e44 	svcmi	0x00464e44
8001639c:	44414246 	strbmi	r4, [r1], #-582	@ 0xfffffdba
800163a0:	4f46454c 	svcmi	0x0046454c
800163a4:	44414246 	strbmi	r4, [r1], #-582	@ 0xfffffdba
800163a8:	4f46464c 	svcmi	0x0046464c
800163ac:	44414744 	strbmi	r4, [r1], #-1860	@ 0xfffff8bc
800163b0:	4f434544 	svcmi	0x00434544
800163b4:	43424d49 	movtmi	r4, #11593	@ 0x2d49
800163b8:	4f464a50 	svcmi	0x00464a50
800163bc:	43414143 	movtmi	r4, #4419	@ 0x1143
800163c0:	4f414950 	svcmi	0x00414950
800163c4:	41414246 	cmpmi	r1, r6, asr #4
800163c8:	4f444644 	svcmi	0x00444644
800163cc:	4141464e 	cmpmi	r1, lr, asr #12
800163d0:	494b4141 	stmdbmi	fp, {r0, r6, r8, lr}^
800163d4:	44424144 	strbmi	r4, [r2], #-324	@ 0xfffffebc
800163d8:	4f484a43 	svcmi	0x00484a43
800163dc:	50414144 	subpl	r4, r1, r4, asr #2
800163e0:	4f414950 	svcmi	0x00414950
800163e4:	50414141 	subpl	r4, r1, r1, asr #2
800163e8:	4f444341 	svcmi	0x00444341
800163ec:	44414449 	strbmi	r4, [r1], #-1097	@ 0xfffffbb7
800163f0:	4f46424c 	svcmi	0x0046424c
800163f4:	43414145 	movtmi	r4, #4421	@ 0x1145
800163f8:	4f434944 	svcmi	0x00434944
800163fc:	43414449 	movtmi	r4, #5193	@ 0x1449
80016400:	4f46414c 	svcmi	0x0046414c
80016404:	44414141 	strbmi	r4, [r1], #-321	@ 0xfffffebf
80016408:	4f464a44 	svcmi	0x00464a44
8001640c:	44414345 	strbmi	r4, [r1], #-837	@ 0xfffffcbb
80016410:	4f46414c 	svcmi	0x0046414c
80016414:	44414245 	strbmi	r4, [r1], #-581	@ 0xfffffdbb
80016418:	4f46424c 	svcmi	0x0046424c
8001641c:	43414441 	movtmi	r4, #5185	@ 0x1441
80016420:	4f46424c 	svcmi	0x0046424c
80016424:	44414144 	strbmi	r4, [r1], #-324	@ 0xfffffebc
80016428:	4f414943 	svcmi	0x00414943
8001642c:	42414345 	submi	r4, r1, #335544321	@ 0x14000001
80016430:	4f46424c 	svcmi	0x0046424c
80016434:	41414144 	cmpmi	r1, r4, asr #2
80016438:	4f424b41 	svcmi	0x00424b41
8001643c:	41414744 	cmpmi	r1, r4, asr #14
80016440:	4f4c4141 	svcmi	0x004c4141
80016444:	43414141 	movtmi	r4, #4417	@ 0x1141
80016448:	4f424b41 	svcmi	0x00424b41
8001644c:	44414245 	strbmi	r4, [r1], #-581	@ 0xfffffdbb
80016450:	4f46424c 	svcmi	0x0046424c
80016454:	44414143 	strbmi	r4, [r1], #-323	@ 0xfffffebd
80016458:	4f414944 	svcmi	0x00414944
8001645c:	44414245 	strbmi	r4, [r1], #-581	@ 0xfffffdbb
80016460:	4f46414c 	svcmi	0x0046414c
80016464:	4141454b 	cmpmi	r1, fp, asr #10
80016468:	4f4b4141 	svcmi	0x004b4141
8001646c:	44414449 	strbmi	r4, [r1], #-1097	@ 0xfffffbb7
80016470:	4f46424c 	svcmi	0x0046424c
80016474:	43414145 	movtmi	r4, #4421	@ 0x1145
80016478:	4f434944 	svcmi	0x00434944
8001647c:	43414449 	movtmi	r4, #5193	@ 0x1449
80016480:	4f46414c 	svcmi	0x0046414c
80016484:	42414141 	submi	r4, r1, #1073741840	@ 0x40000010
80016488:	4f464a44 	svcmi	0x00464a44
8001648c:	44414245 	strbmi	r4, [r1], #-581	@ 0xfffffdbb
80016490:	4f46424c 	svcmi	0x0046424c
80016494:	43414441 	movtmi	r4, #5185	@ 0x1441
80016498:	4f46424c 	svcmi	0x0046424c
8001649c:	44414144 	strbmi	r4, [r1], #-324	@ 0xfffffebc
800164a0:	4f414943 	svcmi	0x00414943
800164a4:	43414842 	movtmi	r4, #6210	@ 0x1842
800164a8:	4f474f50 	svcmi	0x00474f50
800164ac:	43414141 	movtmi	r4, #4417	@ 0x1141
800164b0:	4f464d44 	svcmi	0x00464d44
800164b4:	44414245 	strbmi	r4, [r1], #-581	@ 0xfffffdbb
800164b8:	4f46424c 	svcmi	0x0046424c
800164bc:	44414142 	strbmi	r4, [r1], #-322	@ 0xfffffebe
800164c0:	4f434944 	svcmi	0x00434944
800164c4:	44414245 	strbmi	r4, [r1], #-581	@ 0xfffffdbb
800164c8:	4f46414c 	svcmi	0x0046414c
800164cc:	4141444e 	cmpmi	r1, lr, asr #8
800164d0:	4f4b4141 	svcmi	0x004b4141
800164d4:	44414449 	strbmi	r4, [r1], #-1097	@ 0xfffffbb7
800164d8:	4f46424c 	svcmi	0x0046424c
800164dc:	43414145 	movtmi	r4, #4421	@ 0x1145
800164e0:	4f434944 	svcmi	0x00434944
800164e4:	43414449 	movtmi	r4, #5193	@ 0x1449
800164e8:	4f46414c 	svcmi	0x0046414c
800164ec:	44414141 	strbmi	r4, [r1], #-321	@ 0xfffffebf
800164f0:	4f464a44 	svcmi	0x00464a44
800164f4:	44414349 	strbmi	r4, [r1], #-841	@ 0xfffffcb7
800164f8:	4f46414c 	svcmi	0x0046414c
800164fc:	44414245 	strbmi	r4, [r1], #-581	@ 0xfffffdbb
80016500:	4f46424c 	svcmi	0x0046424c
80016504:	43414441 	movtmi	r4, #5185	@ 0x1441
80016508:	4f46424c 	svcmi	0x0046424c
8001650c:	44414144 	strbmi	r4, [r1], #-324	@ 0xfffffebc
80016510:	4f414943 	svcmi	0x00414943
80016514:	42414349 	submi	r4, r1, #603979777	@ 0x24000001
80016518:	4f46424c 	svcmi	0x0046424c
8001651c:	41414144 	cmpmi	r1, r4, asr #2
80016520:	4f424b41 	svcmi	0x00424b41
80016524:	4141474a 	cmpmi	r1, sl, asr #14
80016528:	4f4c4141 	svcmi	0x004c4141
8001652c:	43414141 	movtmi	r4, #4417	@ 0x1141
80016530:	4f424b41 	svcmi	0x00424b41
80016534:	44414245 	strbmi	r4, [r1], #-581	@ 0xfffffdbb
80016538:	4f46424c 	svcmi	0x0046424c
8001653c:	44414143 	strbmi	r4, [r1], #-323	@ 0xfffffebd
80016540:	4f414944 	svcmi	0x00414944
80016544:	44414245 	strbmi	r4, [r1], #-581	@ 0xfffffdbb
80016548:	4f46414c 	svcmi	0x0046414c
8001654c:	4141434e 	cmpmi	r1, lr, asr #6
80016550:	4f4b4141 	svcmi	0x004b4141
80016554:	44414449 	strbmi	r4, [r1], #-1097	@ 0xfffffbb7
80016558:	4f46424c 	svcmi	0x0046424c
8001655c:	43414145 	movtmi	r4, #4421	@ 0x1145
80016560:	4f434944 	svcmi	0x00434944
80016564:	43414449 	movtmi	r4, #5193	@ 0x1449
80016568:	4f46414c 	svcmi	0x0046414c
8001656c:	44414141 	strbmi	r4, [r1], #-321	@ 0xfffffebf
80016570:	4f464a44 	svcmi	0x00464a44
80016574:	44414341 	strbmi	r4, [r1], #-833	@ 0xfffffcbf
80016578:	4f46414c 	svcmi	0x0046414c
8001657c:	44414245 	strbmi	r4, [r1], #-581	@ 0xfffffdbb
80016580:	4f46424c 	svcmi	0x0046424c
80016584:	43414441 	movtmi	r4, #5185	@ 0x1441
80016588:	4f46424c 	svcmi	0x0046424c
8001658c:	44414144 	strbmi	r4, [r1], #-324	@ 0xfffffebc
80016590:	4f414943 	svcmi	0x00414943
80016594:	4341414b 	movtmi	r4, #4427	@ 0x114b
80016598:	4f444b41 	svcmi	0x00444b41
8001659c:	42414341 	submi	r4, r1, #67108865	@ 0x4000001
800165a0:	4f46424c 	svcmi	0x0046424c
800165a4:	41414144 	cmpmi	r1, r4, asr #2
800165a8:	4f424b41 	svcmi	0x00424b41
800165ac:	4141484f 	cmpmi	r1, pc, asr #16
800165b0:	4f4c4141 	svcmi	0x004c4141
800165b4:	43414141 	movtmi	r4, #4417	@ 0x1141
800165b8:	4f424b41 	svcmi	0x00424b41
800165bc:	44414245 	strbmi	r4, [r1], #-581	@ 0xfffffdbb
800165c0:	4f46424c 	svcmi	0x0046424c
800165c4:	44414143 	strbmi	r4, [r1], #-323	@ 0xfffffebd
800165c8:	4f414944 	svcmi	0x00414944
800165cc:	44414245 	strbmi	r4, [r1], #-581	@ 0xfffffdbb
800165d0:	4f46414c 	svcmi	0x0046414c
800165d4:	4141424d 	cmpmi	r1, sp, asr #4
800165d8:	4f4b4141 	svcmi	0x004b4141
800165dc:	44414449 	strbmi	r4, [r1], #-1097	@ 0xfffffbb7
800165e0:	4f46424c 	svcmi	0x0046424c
800165e4:	43414145 	movtmi	r4, #4421	@ 0x1145
800165e8:	4f434944 	svcmi	0x00434944
800165ec:	43414449 	movtmi	r4, #5193	@ 0x1449
800165f0:	4f46414c 	svcmi	0x0046414c
800165f4:	44414141 	strbmi	r4, [r1], #-321	@ 0xfffffebf
800165f8:	4f464a44 	svcmi	0x00464a44
800165fc:	4441424d 	strbmi	r4, [r1], #-589	@ 0xfffffdb3
80016600:	4f46414c 	svcmi	0x0046414c
80016604:	44414245 	strbmi	r4, [r1], #-581	@ 0xfffffdbb
80016608:	4f46424c 	svcmi	0x0046424c
8001660c:	43414441 	movtmi	r4, #5185	@ 0x1441
80016610:	4f46424c 	svcmi	0x0046424c
80016614:	44414144 	strbmi	r4, [r1], #-324	@ 0xfffffebc
80016618:	4f414943 	svcmi	0x00414943
8001661c:	43414a49 	movtmi	r4, #6729	@ 0x1a49
80016620:	4f464a50 	svcmi	0x00464a50
80016624:	43414143 	movtmi	r4, #4419	@ 0x1143
80016628:	4f414950 	svcmi	0x00414950
8001662c:	42414143 	submi	r4, r1, #-1073741808	@ 0xc0000010
80016630:	4f424b41 	svcmi	0x00424b41
80016634:	41414144 	cmpmi	r1, r4, asr #2
80016638:	4f424b41 	svcmi	0x00424b41
8001663c:	41414344 	cmpmi	r1, r4, asr #6
80016640:	4f4c4141 	svcmi	0x004c4141
80016644:	43414141 	movtmi	r4, #4417	@ 0x1141
80016648:	4f424b41 	svcmi	0x00424b41
8001664c:	44414245 	strbmi	r4, [r1], #-581	@ 0xfffffdbb
80016650:	4f46424c 	svcmi	0x0046424c
80016654:	44414143 	strbmi	r4, [r1], #-323	@ 0xfffffebd
80016658:	4f414944 	svcmi	0x00414944
8001665c:	44414245 	strbmi	r4, [r1], #-581	@ 0xfffffdbb
80016660:	4f46414c 	svcmi	0x0046414c
80016664:	44414245 	strbmi	r4, [r1], #-581	@ 0xfffffdbb
80016668:	4f46424c 	svcmi	0x0046424c
8001666c:	43414441 	movtmi	r4, #5185	@ 0x1441
80016670:	4f46424c 	svcmi	0x0046424c
80016674:	44414144 	strbmi	r4, [r1], #-324	@ 0xfffffebc
80016678:	4f414943 	svcmi	0x00414943
8001667c:	4241424d 	submi	r4, r1, #-805306364	@ 0xd0000004
80016680:	4f46424c 	svcmi	0x0046424c
80016684:	43414241 	movtmi	r4, #4673	@ 0x1241
80016688:	4f444b41 	svcmi	0x00444b41
8001668c:	41414144 	cmpmi	r1, r4, asr #2
80016690:	4f424b41 	svcmi	0x00424b41
80016694:	41414742 	cmpmi	r1, r2, asr #14
80016698:	4f4c4141 	svcmi	0x004c4141
8001669c:	43414141 	movtmi	r4, #4417	@ 0x1141
800166a0:	4f424b41 	svcmi	0x00424b41
800166a4:	44414245 	strbmi	r4, [r1], #-581	@ 0xfffffdbb
800166a8:	4f46424c 	svcmi	0x0046424c
800166ac:	44414143 	strbmi	r4, [r1], #-323	@ 0xfffffebd
800166b0:	4f414944 	svcmi	0x00414944
800166b4:	44414245 	strbmi	r4, [r1], #-581	@ 0xfffffdbb
800166b8:	4f46414c 	svcmi	0x0046414c
800166bc:	50414141 	subpl	r4, r1, r1, asr #2
800166c0:	4f444341 	svcmi	0x00444341
800166c4:	44414241 	strbmi	r4, [r1], #-577	@ 0xfffffdbf
800166c8:	4f46424c 	svcmi	0x0046424c
800166cc:	44414143 	strbmi	r4, [r1], #-323	@ 0xfffffebd
800166d0:	4f434944 	svcmi	0x00434944
800166d4:	44414241 	strbmi	r4, [r1], #-577	@ 0xfffffdbf
800166d8:	4f46414c 	svcmi	0x0046414c
800166dc:	44414241 	strbmi	r4, [r1], #-577	@ 0xfffffdbf
800166e0:	4f46424c 	svcmi	0x0046424c
800166e4:	43414445 	movtmi	r4, #5189	@ 0x1445
800166e8:	4f46424c 	svcmi	0x0046424c
800166ec:	44414144 	strbmi	r4, [r1], #-324	@ 0xfffffebc
800166f0:	4f414943 	svcmi	0x00414943
800166f4:	44414141 	strbmi	r4, [r1], #-321	@ 0xfffffebf
800166f8:	4f464e44 	svcmi	0x00464e44
800166fc:	41414141 	cmpmi	r1, r1, asr #2
80016700:	4f444644 	svcmi	0x00444644
80016704:	50504743 	subspl	r4, r0, r3, asr #14
80016708:	424b5050 	submi	r5, fp, #80	@ 0x50
8001670c:	44414245 	strbmi	r4, [r1], #-581	@ 0xfffffdbb
80016710:	4f46424c 	svcmi	0x0046424c
80016714:	43414441 	movtmi	r4, #5185	@ 0x1441
80016718:	4f46424c 	svcmi	0x0046424c
8001671c:	44414144 	strbmi	r4, [r1], #-324	@ 0xfffffebc
80016720:	4f414943 	svcmi	0x00414943
80016724:	43414141 	movtmi	r4, #4417	@ 0x1141
80016728:	4f444b41 	svcmi	0x00444b41
8001672c:	43414141 	movtmi	r4, #4417	@ 0x1141
80016730:	4f464d44 	svcmi	0x00464d44
80016734:	44414245 	strbmi	r4, [r1], #-581	@ 0xfffffdbb
80016738:	4f46424c 	svcmi	0x0046424c
8001673c:	41414144 	cmpmi	r1, r4, asr #2
80016740:	4f424b41 	svcmi	0x00424b41
80016744:	4e41414d 	cdpmi	1, 4, cr4, cr1, cr13, {2}
80016748:	4f43454c 	svcmi	0x0043454c
8001674c:	4b494141 	blmi	81266c58 <irq_stack_start+0x120cc48>
80016750:	4f494a4e 	svcmi	0x00494a4e
80016754:	41454d45 	cmpmi	r5, r5, asr #26
80016758:	41414141 	cmpmi	r1, r1, asr #2
8001675c:	4144494d 	cmpmi	r4, sp, asr #18
80016760:	41414141 	cmpmi	r1, r1, asr #2
80016764:	4d41414e 	stclmi	1, cr4, [r1, #-312]	@ 0xfffffec8
80016768:	4f424b41 	svcmi	0x00424b41
8001676c:	4e494141 	cdpmi	1, 4, cr4, cr9, cr1, {2}
80016770:	4f4a434e 	svcmi	0x004a434e
80016774:	4c414145 	mcrrmi	1, 4, r4, r1, cr5
80016778:	4f43454d 	svcmi	0x0043454d
8001677c:	4e414241 	cdpmi	2, 4, cr4, cr1, cr1, {2}
80016780:	4f43454e 	svcmi	0x0043454e
80016784:	41414249 	cmpmi	r1, r9, asr #4
80016788:	4f46414c 	svcmi	0x0046414c
8001678c:	4241424d 	submi	r4, r1, #-805306364	@ 0xd0000004
80016790:	4f46414c 	svcmi	0x0046414c
80016794:	44414141 	strbmi	r4, [r1], #-321	@ 0xfffffebf
80016798:	4f444b41 	svcmi	0x00444b41
8001679c:	44414241 	strbmi	r4, [r1], #-577	@ 0xfffffdbf
800167a0:	4f46414c 	svcmi	0x0046414c
800167a4:	44414141 	strbmi	r4, [r1], #-321	@ 0xfffffebf
800167a8:	4f444b41 	svcmi	0x00444b41
800167ac:	44414245 	strbmi	r4, [r1], #-581	@ 0xfffffdbb
800167b0:	4f46414c 	svcmi	0x0046414c
800167b4:	4141414e 	cmpmi	r1, lr, asr #2
800167b8:	4f4b4141 	svcmi	0x004b4141
800167bc:	44414245 	strbmi	r4, [r1], #-581	@ 0xfffffdbb
800167c0:	4f46424c 	svcmi	0x0046424c
800167c4:	4341424d 	movtmi	r4, #4685	@ 0x124d
800167c8:	4f46424c 	svcmi	0x0046424c
800167cc:	43414144 	movtmi	r4, #4420	@ 0x1144
800167d0:	4f414943 	svcmi	0x00414943
800167d4:	44414241 	strbmi	r4, [r1], #-577	@ 0xfffffdbf
800167d8:	4f46424c 	svcmi	0x0046424c
800167dc:	42414249 	submi	r4, r1, #-1879048188	@ 0x90000004
800167e0:	4f46424c 	svcmi	0x0046424c
800167e4:	44414144 	strbmi	r4, [r1], #-324	@ 0xfffffebc
800167e8:	4f414942 	svcmi	0x00414942
800167ec:	43414141 	movtmi	r4, #4417	@ 0x1141
800167f0:	4f464e43 	svcmi	0x00464e43
800167f4:	43414141 	movtmi	r4, #4417	@ 0x1141
800167f8:	4f464d44 	svcmi	0x00464d44
800167fc:	44414241 	strbmi	r4, [r1], #-577	@ 0xfffffdbf
80016800:	4f46424c 	svcmi	0x0046424c
80016804:	44414142 	strbmi	r4, [r1], #-322	@ 0xfffffebe
80016808:	4f434944 	svcmi	0x00434944
8001680c:	44414241 	strbmi	r4, [r1], #-577	@ 0xfffffdbf
80016810:	4f46414c 	svcmi	0x0046414c
80016814:	44414245 	strbmi	r4, [r1], #-581	@ 0xfffffdbb
80016818:	4f46424c 	svcmi	0x0046424c
8001681c:	44414142 	strbmi	r4, [r1], #-322	@ 0xfffffebe
80016820:	4f434944 	svcmi	0x00434944
80016824:	44414245 	strbmi	r4, [r1], #-581	@ 0xfffffdbb
80016828:	4f46414c 	svcmi	0x0046414c
8001682c:	44414245 	strbmi	r4, [r1], #-581	@ 0xfffffdbb
80016830:	4f46424c 	svcmi	0x0046424c
80016834:	4341424d 	movtmi	r4, #4685	@ 0x124d
80016838:	4f46424c 	svcmi	0x0046424c
8001683c:	44414144 	strbmi	r4, [r1], #-324	@ 0xfffffebc
80016840:	4f414943 	svcmi	0x00414943
80016844:	44414141 	strbmi	r4, [r1], #-321	@ 0xfffffebf
80016848:	4f464e44 	svcmi	0x00464e44
8001684c:	41414141 	cmpmi	r1, r1, asr #2
80016850:	4f444644 	svcmi	0x00444644
80016854:	50504f4c 	subspl	r4, r0, ip, asr #30
80016858:	424b5050 	submi	r5, fp, #80	@ 0x50
8001685c:	44414245 	strbmi	r4, [r1], #-581	@ 0xfffffdbb
80016860:	4f46424c 	svcmi	0x0046424c
80016864:	41414144 	cmpmi	r1, r4, asr #2
80016868:	4f424b41 	svcmi	0x00424b41
8001686c:	4e41414d 	cdpmi	1, 4, cr4, cr1, cr13, {2}
80016870:	4f43454c 	svcmi	0x0043454c
80016874:	4b494141 	blmi	81266d80 <irq_stack_start+0x120cd70>
80016878:	4f494a4e 	svcmi	0x00494a4e
8001687c:	4d41414e 	stclmi	1, cr4, [r1, #-312]	@ 0xfffffec8
80016880:	4f424b41 	svcmi	0x00424b41
80016884:	4e494141 	cdpmi	1, 4, cr4, cr9, cr1, {2}
80016888:	4f4a434e 	svcmi	0x004a434e
8001688c:	4c414145 	mcrrmi	1, 4, r4, r1, cr5
80016890:	4f43454d 	svcmi	0x0043454d
80016894:	4e414241 	cdpmi	2, 4, cr4, cr1, cr1, {2}
80016898:	4f43454e 	svcmi	0x0043454e
8001689c:	41414249 	cmpmi	r1, r9, asr #4
800168a0:	4f46414c 	svcmi	0x0046414c
800168a4:	4241424d 	submi	r4, r1, #-805306364	@ 0xd0000004
800168a8:	4f46414c 	svcmi	0x0046414c
800168ac:	44414141 	strbmi	r4, [r1], #-321	@ 0xfffffebf
800168b0:	4f444b41 	svcmi	0x00444b41
800168b4:	44414241 	strbmi	r4, [r1], #-577	@ 0xfffffdbf
800168b8:	4f46414c 	svcmi	0x0046414c
800168bc:	4441424d 	strbmi	r4, [r1], #-589	@ 0xfffffdb3
800168c0:	4f46424c 	svcmi	0x0046424c
800168c4:	41414141 	cmpmi	r1, r1, asr #2
800168c8:	4f444644 	svcmi	0x00444644
800168cc:	41414241 	cmpmi	r1, r1, asr #4
800168d0:	4b4b4141 	blmi	812e6ddc <irq_stack_start+0x128cdcc>
800168d4:	44414249 	strbmi	r4, [r1], #-585	@ 0xfffffdb7
800168d8:	4f46424c 	svcmi	0x0046424c
800168dc:	4341434e 	movtmi	r4, #4942	@ 0x134e
800168e0:	4f444b41 	svcmi	0x00444b41
800168e4:	43414141 	movtmi	r4, #4417	@ 0x1141
800168e8:	4f464d44 	svcmi	0x00464d44
800168ec:	44414142 	strbmi	r4, [r1], #-322	@ 0xfffffebe
800168f0:	4f444b41 	svcmi	0x00444b41
800168f4:	44414241 	strbmi	r4, [r1], #-577	@ 0xfffffdbf
800168f8:	4f46414c 	svcmi	0x0046414c
800168fc:	44414249 	strbmi	r4, [r1], #-585	@ 0xfffffdb7
80016900:	4f46424c 	svcmi	0x0046424c
80016904:	41414142 	cmpmi	r1, r2, asr #2
80016908:	4f434944 	svcmi	0x00434944
8001690c:	4441424d 	strbmi	r4, [r1], #-589	@ 0xfffffdb3
80016910:	4f46424c 	svcmi	0x0046424c
80016914:	44414141 	strbmi	r4, [r1], #-321	@ 0xfffffebf
80016918:	4f434744 	svcmi	0x00434744
8001691c:	4341414b 	movtmi	r4, #4427	@ 0x114b
80016920:	4f444b41 	svcmi	0x00444b41
80016924:	42414144 	submi	r4, r1, #68, 2
80016928:	4f424b41 	svcmi	0x00424b41
8001692c:	4141414f 	cmpmi	r1, pc, asr #2
80016930:	4f4c4141 	svcmi	0x004c4141
80016934:	43414141 	movtmi	r4, #4417	@ 0x1141
80016938:	4f424b41 	svcmi	0x00424b41
8001693c:	44414241 	strbmi	r4, [r1], #-577	@ 0xfffffdbf
80016940:	4f46424c 	svcmi	0x0046424c
80016944:	44414143 	strbmi	r4, [r1], #-323	@ 0xfffffebd
80016948:	4f414944 	svcmi	0x00414944
8001694c:	44414241 	strbmi	r4, [r1], #-577	@ 0xfffffdbf
80016950:	4f46414c 	svcmi	0x0046414c
80016954:	41414146 	cmpmi	r1, r6, asr #2
80016958:	4f4b4141 	svcmi	0x004b4141
8001695c:	4441424d 	strbmi	r4, [r1], #-589	@ 0xfffffdb3
80016960:	4f46424c 	svcmi	0x0046424c
80016964:	4341414b 	movtmi	r4, #4427	@ 0x114b
80016968:	4f444b41 	svcmi	0x00444b41
8001696c:	42414144 	submi	r4, r1, #68, 2
80016970:	4f424b41 	svcmi	0x00424b41
80016974:	41414249 	cmpmi	r1, r9, asr #4
80016978:	4f46424c 	svcmi	0x0046424c
8001697c:	41414145 	cmpmi	r1, r5, asr #2
80016980:	4f4c4141 	svcmi	0x004c4141
80016984:	41414241 	cmpmi	r1, r1, asr #4
80016988:	4f46414c 	svcmi	0x0046414c
8001698c:	44414241 	strbmi	r4, [r1], #-577	@ 0xfffffdbf
80016990:	4f46424c 	svcmi	0x0046424c
80016994:	41414144 	cmpmi	r1, r4, asr #2
80016998:	4f424b41 	svcmi	0x00424b41
8001699c:	4e41414d 	cdpmi	1, 4, cr4, cr1, cr13, {2}
800169a0:	4f43454c 	svcmi	0x0043454c
800169a4:	4b494141 	blmi	81266eb0 <irq_stack_start+0x120cea0>
800169a8:	4f494a4e 	svcmi	0x00494a4e
800169ac:	4d41414e 	stclmi	1, cr4, [r1, #-312]	@ 0xfffffec8
800169b0:	4f424b41 	svcmi	0x00424b41
800169b4:	4e494141 	cdpmi	1, 4, cr4, cr9, cr1, {2}
800169b8:	4f4a434e 	svcmi	0x004a434e
800169bc:	4c414145 	mcrrmi	1, 4, r4, r1, cr5
800169c0:	4f43454d 	svcmi	0x0043454d
800169c4:	4e414341 	cdpmi	3, 4, cr4, cr1, cr1, {2}
800169c8:	4f43454e 	svcmi	0x0043454e
800169cc:	41414341 	cmpmi	r1, r1, asr #6
800169d0:	4f46414c 	svcmi	0x0046414c
800169d4:	42414345 	submi	r4, r1, #335544321	@ 0x14000001
800169d8:	4f46414c 	svcmi	0x0046414c
800169dc:	43414349 	movtmi	r4, #4937	@ 0x1349
800169e0:	4f46414c 	svcmi	0x0046414c
800169e4:	44414141 	strbmi	r4, [r1], #-321	@ 0xfffffebf
800169e8:	4f444b41 	svcmi	0x00444b41
800169ec:	44414241 	strbmi	r4, [r1], #-577	@ 0xfffffdbf
800169f0:	4f46414c 	svcmi	0x0046414c
800169f4:	44414141 	strbmi	r4, [r1], #-321	@ 0xfffffebf
800169f8:	4f444b41 	svcmi	0x00444b41
800169fc:	44414249 	strbmi	r4, [r1], #-585	@ 0xfffffdb7
80016a00:	4f46414c 	svcmi	0x0046414c
80016a04:	44414141 	strbmi	r4, [r1], #-321	@ 0xfffffebf
80016a08:	4f444b41 	svcmi	0x00444b41
80016a0c:	44414245 	strbmi	r4, [r1], #-581	@ 0xfffffdbb
80016a10:	4f46414c 	svcmi	0x0046414c
80016a14:	44414249 	strbmi	r4, [r1], #-585	@ 0xfffffdb7
80016a18:	4f43454c 	svcmi	0x0043454c
80016a1c:	43414144 	movtmi	r4, #4420	@ 0x1144
80016a20:	4f424b41 	svcmi	0x00424b41
80016a24:	42414349 	submi	r4, r1, #603979777	@ 0x24000001
80016a28:	4f46424c 	svcmi	0x0046424c
80016a2c:	41414345 	cmpmi	r1, r5, asr #6
80016a30:	4f46424c 	svcmi	0x0046424c
80016a34:	41414249 	cmpmi	r1, r9, asr #4
80016a38:	4f4c4141 	svcmi	0x004c4141
80016a3c:	41414245 	cmpmi	r1, r5, asr #4
80016a40:	4f46414c 	svcmi	0x0046414c
80016a44:	44414245 	strbmi	r4, [r1], #-581	@ 0xfffffdbb
80016a48:	4f46424c 	svcmi	0x0046424c
80016a4c:	41414141 	cmpmi	r1, r1, asr #2
80016a50:	4f444644 	svcmi	0x00444644
80016a54:	41414145 	cmpmi	r1, r5, asr #2
80016a58:	414b4141 	cmpmi	fp, r1, asr #2
80016a5c:	43414349 	movtmi	r4, #4937	@ 0x1349
80016a60:	4f46424c 	svcmi	0x0046424c
80016a64:	42414245 	submi	r4, r1, #1342177284	@ 0x50000004
80016a68:	4f46424c 	svcmi	0x0046424c
80016a6c:	41414341 	cmpmi	r1, r1, asr #6
80016a70:	4f46424c 	svcmi	0x0046424c
80016a74:	50504f46 	subspl	r4, r0, r6, asr #30
80016a78:	4f4c5050 	svcmi	0x004c5050
80016a7c:	41414241 	cmpmi	r1, r1, asr #4
80016a80:	4f46414c 	svcmi	0x0046414c
80016a84:	43414249 	movtmi	r4, #4681	@ 0x1249
80016a88:	4f46424c 	svcmi	0x0046424c
80016a8c:	44414241 	strbmi	r4, [r1], #-577	@ 0xfffffdbf
80016a90:	4f46424c 	svcmi	0x0046424c
80016a94:	42414341 	submi	r4, r1, #67108865	@ 0x4000001
80016a98:	4f46424c 	svcmi	0x0046424c
80016a9c:	44414144 	strbmi	r4, [r1], #-324	@ 0xfffffebc
80016aa0:	4f414942 	svcmi	0x00414942
80016aa4:	42414345 	submi	r4, r1, #335544321	@ 0x14000001
80016aa8:	4f464a50 	svcmi	0x00464a50
80016aac:	42414142 	submi	r4, r1, #-2147483632	@ 0x80000010
80016ab0:	4f414950 	svcmi	0x00414950
80016ab4:	43414143 	movtmi	r4, #4419	@ 0x1143
80016ab8:	4f484e42 	svcmi	0x00484e42
80016abc:	43414141 	movtmi	r4, #4417	@ 0x1141
80016ac0:	4f464d44 	svcmi	0x00464d44
80016ac4:	44414241 	strbmi	r4, [r1], #-577	@ 0xfffffdbf
80016ac8:	4f46424c 	svcmi	0x0046424c
80016acc:	44414142 	strbmi	r4, [r1], #-322	@ 0xfffffebe
80016ad0:	4f434944 	svcmi	0x00434944
80016ad4:	44414241 	strbmi	r4, [r1], #-577	@ 0xfffffdbf
80016ad8:	4f46414c 	svcmi	0x0046414c
80016adc:	44414241 	strbmi	r4, [r1], #-577	@ 0xfffffdbf
80016ae0:	4f46424c 	svcmi	0x0046424c
80016ae4:	41414144 	cmpmi	r1, r4, asr #2
80016ae8:	4f424b41 	svcmi	0x00424b41
80016aec:	4e41414d 	cdpmi	1, 4, cr4, cr1, cr13, {2}
80016af0:	4f43454c 	svcmi	0x0043454c
80016af4:	4b494141 	blmi	81267000 <irq_stack_start+0x120cff0>
80016af8:	4f494a4e 	svcmi	0x00494a4e
80016afc:	41424b45 	cmpmi	r2, r5, asr #22
80016b00:	41414141 	cmpmi	r1, r1, asr #2
80016b04:	4d41414e 	stclmi	1, cr4, [r1, #-312]	@ 0xfffffec8
80016b08:	4f424b41 	svcmi	0x00424b41
80016b0c:	4e494141 	cdpmi	1, 4, cr4, cr9, cr1, {2}
80016b10:	4f4a434e 	svcmi	0x004a434e
80016b14:	4c414145 	mcrrmi	1, 4, r4, r1, cr5
80016b18:	4f43454d 	svcmi	0x0043454d
80016b1c:	4e414341 	cdpmi	3, 4, cr4, cr1, cr1, {2}
80016b20:	4f43454e 	svcmi	0x0043454e
80016b24:	41414341 	cmpmi	r1, r1, asr #6
80016b28:	4f46414c 	svcmi	0x0046414c
80016b2c:	42414345 	submi	r4, r1, #335544321	@ 0x14000001
80016b30:	4f46414c 	svcmi	0x0046414c
80016b34:	43414349 	movtmi	r4, #4937	@ 0x1349
80016b38:	4f46414c 	svcmi	0x0046414c
80016b3c:	44414141 	strbmi	r4, [r1], #-321	@ 0xfffffebf
80016b40:	4f444b41 	svcmi	0x00444b41
80016b44:	44414241 	strbmi	r4, [r1], #-577	@ 0xfffffdbf
80016b48:	4f46414c 	svcmi	0x0046414c
80016b4c:	44414141 	strbmi	r4, [r1], #-321	@ 0xfffffebf
80016b50:	4f444b41 	svcmi	0x00444b41
80016b54:	44414245 	strbmi	r4, [r1], #-581	@ 0xfffffdbb
80016b58:	4f46414c 	svcmi	0x0046414c
80016b5c:	44414141 	strbmi	r4, [r1], #-321	@ 0xfffffebf
80016b60:	4f444b41 	svcmi	0x00444b41
80016b64:	44414249 	strbmi	r4, [r1], #-585	@ 0xfffffdb7
80016b68:	4f46414c 	svcmi	0x0046414c
80016b6c:	44414250 	strbmi	r4, [r1], #-592	@ 0xfffffdb0
80016b70:	4f444b41 	svcmi	0x00444b41
80016b74:	44414241 	strbmi	r4, [r1], #-577	@ 0xfffffdbf
80016b78:	4f46414c 	svcmi	0x0046414c
80016b7c:	41414250 	cmpmi	r1, r0, asr r2
80016b80:	4f4b4141 	svcmi	0x004b4141
80016b84:	43414142 	movtmi	r4, #4418	@ 0x1142
80016b88:	4f444b41 	svcmi	0x00444b41
80016b8c:	44414241 	strbmi	r4, [r1], #-577	@ 0xfffffdbf
80016b90:	4f46424c 	svcmi	0x0046424c
80016b94:	43444243 	movtmi	r4, #16963	@ 0x4243
80016b98:	4f424b41 	svcmi	0x00424b41
80016b9c:	44414341 	strbmi	r4, [r1], #-833	@ 0xfffffcbf
80016ba0:	4f46424c 	svcmi	0x0046424c
80016ba4:	44414143 	strbmi	r4, [r1], #-323	@ 0xfffffebd
80016ba8:	4f414144 	svcmi	0x00414144
80016bac:	41414141 	cmpmi	r1, r1, asr #2
80016bb0:	4f444644 	svcmi	0x00444644
80016bb4:	44414142 	strbmi	r4, [r1], #-322	@ 0xfffffebe
80016bb8:	42444b41 	submi	r4, r4, #66560	@ 0x10400
80016bbc:	44414141 	strbmi	r4, [r1], #-321	@ 0xfffffebf
80016bc0:	41444b41 	cmpmi	r4, r1, asr #22
80016bc4:	44414844 	strbmi	r4, [r1], #-2116	@ 0xfffff7bc
80016bc8:	4f474f50 	svcmi	0x00474f50
80016bcc:	4441424d 	strbmi	r4, [r1], #-589	@ 0xfffffdb3
80016bd0:	4f46414c 	svcmi	0x0046414c
80016bd4:	44414249 	strbmi	r4, [r1], #-585	@ 0xfffffdb7
80016bd8:	4f46424c 	svcmi	0x0046424c
80016bdc:	44414944 	strbmi	r4, [r1], #-2372	@ 0xfffff6bc
80016be0:	4f424b41 	svcmi	0x00424b41
80016be4:	4341424d 	movtmi	r4, #4685	@ 0x124d
80016be8:	4f46424c 	svcmi	0x0046424c
80016bec:	44414144 	strbmi	r4, [r1], #-324	@ 0xfffffebc
80016bf0:	4f424943 	svcmi	0x00424943
80016bf4:	44414249 	strbmi	r4, [r1], #-585	@ 0xfffffdb7
80016bf8:	4f46414c 	svcmi	0x0046414c
80016bfc:	43414249 	movtmi	r4, #4681	@ 0x1249
80016c00:	4f46424c 	svcmi	0x0046424c
80016c04:	44414345 	strbmi	r4, [r1], #-837	@ 0xfffffcbb
80016c08:	4f46424c 	svcmi	0x0046424c
80016c0c:	41414144 	cmpmi	r1, r4, asr #2
80016c10:	4f424643 	svcmi	0x00424643
80016c14:	4141414a 	cmpmi	r1, sl, asr #2
80016c18:	444b4141 	strbmi	r4, [fp], #-321	@ 0xfffffebf
80016c1c:	43414249 	movtmi	r4, #4681	@ 0x1249
80016c20:	4f46424c 	svcmi	0x0046424c
80016c24:	44414345 	strbmi	r4, [r1], #-837	@ 0xfffffcbb
80016c28:	4f46424c 	svcmi	0x0046424c
80016c2c:	44414144 	strbmi	r4, [r1], #-324	@ 0xfffffebc
80016c30:	4f414543 	svcmi	0x00414543
80016c34:	44414249 	strbmi	r4, [r1], #-585	@ 0xfffffdb7
80016c38:	4f46414c 	svcmi	0x0046414c
80016c3c:	43414142 	movtmi	r4, #4418	@ 0x1142
80016c40:	4f444b41 	svcmi	0x00444b41
80016c44:	44414241 	strbmi	r4, [r1], #-577	@ 0xfffffdbf
80016c48:	4f46424c 	svcmi	0x0046424c
80016c4c:	44444243 	strbmi	r4, [r4], #-579	@ 0xfffffdbd
80016c50:	4f424b41 	svcmi	0x00424b41
80016c54:	43414245 	movtmi	r4, #4677	@ 0x1245
80016c58:	4f46424c 	svcmi	0x0046424c
80016c5c:	44414144 	strbmi	r4, [r1], #-324	@ 0xfffffebc
80016c60:	4f424943 	svcmi	0x00424943
80016c64:	44414245 	strbmi	r4, [r1], #-581	@ 0xfffffdbb
80016c68:	4f46414c 	svcmi	0x0046414c
80016c6c:	44414241 	strbmi	r4, [r1], #-577	@ 0xfffffdbf
80016c70:	4f46424c 	svcmi	0x0046424c
80016c74:	44414142 	strbmi	r4, [r1], #-322	@ 0xfffffebe
80016c78:	4f434544 	svcmi	0x00434544
80016c7c:	44414241 	strbmi	r4, [r1], #-577	@ 0xfffffdbf
80016c80:	4f46414c 	svcmi	0x0046414c
80016c84:	44414241 	strbmi	r4, [r1], #-577	@ 0xfffffdbf
80016c88:	4f46424c 	svcmi	0x0046424c
80016c8c:	41414141 	cmpmi	r1, r1, asr #2
80016c90:	4f444644 	svcmi	0x00444644
80016c94:	50504e4d 	subspl	r4, r0, sp, asr #28
80016c98:	4b4b5050 	blmi	812eade0 <irq_stack_start+0x1290dd0>
80016c9c:	44414349 	strbmi	r4, [r1], #-841	@ 0xfffffcb7
80016ca0:	4f46424c 	svcmi	0x0046424c
80016ca4:	41414141 	cmpmi	r1, r1, asr #2
80016ca8:	4f444644 	svcmi	0x00444644
80016cac:	41414143 	cmpmi	r1, r3, asr #2
80016cb0:	414b4141 	cmpmi	fp, r1, asr #2
80016cb4:	44414349 	strbmi	r4, [r1], #-841	@ 0xfffffcb7
80016cb8:	4f46424c 	svcmi	0x0046424c
80016cbc:	43414249 	movtmi	r4, #4681	@ 0x1249
80016cc0:	4f46424c 	svcmi	0x0046424c
80016cc4:	43414141 	movtmi	r4, #4417	@ 0x1141
80016cc8:	4f464944 	svcmi	0x00464944
80016ccc:	44414245 	strbmi	r4, [r1], #-581	@ 0xfffffdbb
80016cd0:	4f46424c 	svcmi	0x0046424c
80016cd4:	41414144 	cmpmi	r1, r4, asr #2
80016cd8:	4f424b41 	svcmi	0x00424b41
80016cdc:	4e41414d 	cdpmi	1, 4, cr4, cr1, cr13, {2}
80016ce0:	4f43454c 	svcmi	0x0043454c
80016ce4:	4b494141 	blmi	812671f0 <irq_stack_start+0x120d1e0>
80016ce8:	4f494a4e 	svcmi	0x00494a4e
80016cec:	48454844 	stmdami	r5, {r2, r6, fp, lr}^
80016cf0:	48434742 	stmdami	r3, {r1, r6, r8, r9, sl, lr}^
80016cf4:	474a4845 	strbmi	r4, [sl, -r5, asr #16]
80016cf8:	4748474f 	strbmi	r4, [r8, -pc, asr #14]
80016cfc:	48414341 	stmdami	r1, {r0, r6, r8, r9, lr}^
80016d00:	47504843 	ldrbmi	r4, [r0, -r3, asr #16]
80016d04:	48434748 	stmdami	r3, {r3, r6, r8, r9, sl, lr}^
80016d08:	474e4742 	strbmi	r4, [lr, -r2, asr #14]
80016d0c:	44424341 	strbmi	r4, [r2], #-833	@ 0xfffffcbf
80016d10:	434f4341 	movtmi	r4, #62273	@ 0xf341
80016d14:	434f434f 	movtmi	r4, #62287	@ 0xf34f
80016d18:	4141414b 	cmpmi	r1, fp, asr #2
80016d1c:	4746474e 	strbmi	r4, [r6, -lr, asr #14]
80016d20:	48444844 	stmdami	r4, {r2, r6, fp, lr}^
80016d24:	47484742 	strbmi	r4, [r8, -r2, asr #14]
80016d28:	43414746 	movtmi	r4, #5958	@ 0x1746
80016d2c:	48434747 	stmdami	r3, {r0, r1, r2, r6, r8, r9, sl, lr}^
80016d30:	474e4750 	smlsldmi	r4, lr, r0, r7
80016d34:	48414341 	stmdami	r1, {r0, r6, r8, r9, lr}^
80016d38:	48434742 	stmdami	r3, {r1, r6, r8, r9, sl, lr}^
80016d3c:	474f4746 	strbmi	r4, [pc, -r6, asr #14]
80016d40:	434f4845 	movtmi	r4, #63557	@ 0xf845
80016d44:	4141414b 	cmpmi	r1, fp, asr #2
80016d48:	41414141 	cmpmi	r1, r1, asr #2
80016d4c:	48494441 	stmdami	r9, {r0, r6, sl, lr}^
80016d50:	41414141 	cmpmi	r1, r1, asr #2
80016d54:	41414541 	cmpmi	r1, r1, asr #10
80016d58:	41414141 	cmpmi	r1, r1, asr #2
80016d5c:	41414845 	cmpmi	r1, r5, asr #16
80016d60:	41414141 	cmpmi	r1, r1, asr #2
80016d64:	4142474d 	cmpmi	r2, sp, asr #14
80016d68:	41414141 	cmpmi	r1, r1, asr #2
80016d6c:	4142474d 	cmpmi	r2, sp, asr #14
80016d70:	41414141 	cmpmi	r1, r1, asr #2
80016d74:	4142474d 	cmpmi	r2, sp, asr #14
80016d78:	41414141 	cmpmi	r1, r1, asr #2
80016d7c:	4142474d 	cmpmi	r2, sp, asr #14
80016d80:	41414141 	cmpmi	r1, r1, asr #2
80016d84:	4142474d 	cmpmi	r2, sp, asr #14
80016d88:	41414141 	cmpmi	r1, r1, asr #2
80016d8c:	4142474d 	cmpmi	r2, sp, asr #14
80016d90:	41414141 	cmpmi	r1, r1, asr #2
80016d94:	4142474d 	cmpmi	r2, sp, asr #14
80016d98:	41414141 	cmpmi	r1, r1, asr #2
80016d9c:	4142474d 	cmpmi	r2, sp, asr #14
80016da0:	41414141 	cmpmi	r1, r1, asr #2
80016da4:	4142474d 	cmpmi	r2, sp, asr #14
80016da8:	41414141 	cmpmi	r1, r1, asr #2
80016dac:	4142474d 	cmpmi	r2, sp, asr #14
80016db0:	41414141 	cmpmi	r1, r1, asr #2
80016db4:	4142474d 	cmpmi	r2, sp, asr #14
80016db8:	41414141 	cmpmi	r1, r1, asr #2
80016dbc:	4142474d 	cmpmi	r2, sp, asr #14
80016dc0:	41414141 	cmpmi	r1, r1, asr #2
80016dc4:	4142474d 	cmpmi	r2, sp, asr #14
80016dc8:	41414141 	cmpmi	r1, r1, asr #2
80016dcc:	4142474d 	cmpmi	r2, sp, asr #14
80016dd0:	41414141 	cmpmi	r1, r1, asr #2
80016dd4:	41414141 	cmpmi	r1, r1, asr #2
80016dd8:	41414141 	cmpmi	r1, r1, asr #2
80016ddc:	4142474d 	cmpmi	r2, sp, asr #14
80016de0:	41414141 	cmpmi	r1, r1, asr #2
80016de4:	41414c45 	cmpmi	r1, r5, asr #24
80016de8:	41414141 	cmpmi	r1, r1, asr #2
80016dec:	4142474d 	cmpmi	r2, sp, asr #14
80016df0:	41414141 	cmpmi	r1, r1, asr #2
80016df4:	4142474d 	cmpmi	r2, sp, asr #14
80016df8:	41414141 	cmpmi	r1, r1, asr #2
80016dfc:	41415049 	cmpmi	r1, r9, asr #32
80016e00:	41414141 	cmpmi	r1, r1, asr #2
80016e04:	44424441 	strbmi	r4, [r2], #-1089	@ 0xfffffbbf
80016e08:	44444443 	strbmi	r4, [r4], #-1091	@ 0xfffffbbd
80016e0c:	44464445 	strbmi	r4, [r6], #-1093	@ 0xfffffbbb
80016e10:	44484447 	strbmi	r4, [r8], #-1095	@ 0xfffffbb9
80016e14:	444a4449 	strbmi	r4, [sl], #-1097	@ 0xfffffbb7
80016e18:	47434742 	strbmi	r4, [r3, -r2, asr #14]
80016e1c:	47454744 	strbmi	r4, [r5, -r4, asr #14]
80016e20:	47474746 	strbmi	r4, [r7, -r6, asr #14]
80016e24:	41414141 	cmpmi	r1, r1, asr #2
80016e28:	41414141 	cmpmi	r1, r1, asr #2
80016e2c:	41414141 	cmpmi	r1, r1, asr #2
80016e30:	41414141 	cmpmi	r1, r1, asr #2
80016e34:	41414141 	cmpmi	r1, r1, asr #2
80016e38:	41414141 	cmpmi	r1, r1, asr #2
80016e3c:	41414141 	cmpmi	r1, r1, asr #2
80016e40:	41414141 	cmpmi	r1, r1, asr #2
80016e44:	41434545 	cmpmi	r3, r5, asr #10
80016e48:	41414141 	cmpmi	r1, r1, asr #2
80016e4c:	45444548 	strbmi	r4, [r4, #-1352]	@ 0xfffffab8
80016e50:	444b4544 	strbmi	r4, [fp], #-1348	@ 0xfffffabc
80016e54:	43494341 	movtmi	r4, #37697	@ 0x9341
80016e58:	48434542 	stmdami	r3, {r1, r6, r8, sl, lr}^
80016e5c:	47494744 	strbmi	r4, [r9, -r4, asr #14]
80016e60:	46434341 	strbmi	r4, [r3], -r1, asr #6
80016e64:	48414746 	stmdami	r1, {r1, r2, r6, r8, r9, sl, lr}^
80016e68:	48444750 	stmdami	r4, {r4, r6, r8, r9, sl, lr}^
80016e6c:	4845474a 	stmdami	r5, {r1, r3, r6, r8, r9, sl, lr}^
80016e70:	48434750 	stmdami	r3, {r4, r6, r8, r9, sl, lr}^
80016e74:	434a484a 	movtmi	r4, #43082	@ 0xa84a
80016e78:	44424341 	strbmi	r4, [r2], #-833	@ 0xfffffcbf
80016e7c:	434f4445 	movtmi	r4, #62533	@ 0xf445
80016e80:	434f4443 	movtmi	r4, #62531	@ 0xf443
80016e84:	41414441 	cmpmi	r1, r1, asr #8
80016e88:	434f4542 	movtmi	r4, #62786	@ 0xf542
80016e8c:	41414141 	cmpmi	r1, r1, asr #2
80016e90:	47424141 	strbmi	r4, [r2, -r1, asr #2]
80016e94:	47424746 	strbmi	r4, [r2, -r6, asr #14]
80016e98:	474a4743 	strbmi	r4, [sl, -r3, asr #14]
80016e9c:	41424141 	cmpmi	r2, r1, asr #2
80016ea0:	41414345 	cmpmi	r1, r5, asr #6
80016ea4:	41414141 	cmpmi	r1, r1, asr #2
80016ea8:	44474146 	strbmi	r4, [r7], #-326	@ 0xfffffeba
80016eac:	464b454c 	strbmi	r4, [fp], -ip, asr #10
80016eb0:	41474141 	cmpmi	r7, r1, asr #2
80016eb4:	41494148 	cmpmi	r9, r8, asr #2
80016eb8:	414a4142 	cmpmi	sl, r2, asr #2
80016ebc:	42434142 	submi	r4, r3, #-2147483632	@ 0x80000010
80016ec0:	42454145 	submi	r4, r5, #1073741841	@ 0x40000011
80016ec4:	42464142 	submi	r4, r6, #-2147483632	@ 0x80000010
80016ec8:	42484142 	submi	r4, r8, #-2147483632	@ 0x80000010
80016ecc:	42494144 	submi	r4, r9, #68, 2
80016ed0:	424a4142 	submi	r4, sl, #-2147483632	@ 0x80000010
80016ed4:	424b4142 	submi	r4, fp, #-2147483632	@ 0x80000010
80016ed8:	424f4142 	submi	r4, pc, #-2147483632	@ 0x80000010
80016edc:	43434147 	movtmi	r4, #12615	@ 0x3147
80016ee0:	45454142 	strbmi	r4, [r5, #-322]	@ 0xfffffebe
80016ee4:	41414142 	cmpmi	r1, r2, asr #2
80016ee8:	41414141 	cmpmi	r1, r1, asr #2
80016eec:	41414141 	cmpmi	r1, r1, asr #2
80016ef0:	41414141 	cmpmi	r1, r1, asr #2
80016ef4:	41414141 	cmpmi	r1, r1, asr #2
80016ef8:	41414141 	cmpmi	r1, r1, asr #2
80016efc:	41414141 	cmpmi	r1, r1, asr #2
80016f00:	41414141 	cmpmi	r1, r1, asr #2
80016f04:	41414141 	cmpmi	r1, r1, asr #2
80016f08:	41414141 	cmpmi	r1, r1, asr #2
80016f0c:	41414141 	cmpmi	r1, r1, asr #2
80016f10:	41414141 	cmpmi	r1, r1, asr #2
80016f14:	41424141 	cmpmi	r2, r1, asr #2
80016f18:	41414141 	cmpmi	r1, r1, asr #2
80016f1c:	41414141 	cmpmi	r1, r1, asr #2
80016f20:	41414141 	cmpmi	r1, r1, asr #2
80016f24:	41414144 	cmpmi	r1, r4, asr #2
80016f28:	41414142 	cmpmi	r1, r2, asr #2
80016f2c:	41414141 	cmpmi	r1, r1, asr #2
80016f30:	41414141 	cmpmi	r1, r1, asr #2
80016f34:	414a4b45 	cmpmi	sl, r5, asr #22
80016f38:	41414141 	cmpmi	r1, r1, asr #2
80016f3c:	41414141 	cmpmi	r1, r1, asr #2
80016f40:	41414141 	cmpmi	r1, r1, asr #2
80016f44:	41414144 	cmpmi	r1, r4, asr #2
80016f48:	41414143 	cmpmi	r1, r3, asr #2
80016f4c:	41414141 	cmpmi	r1, r1, asr #2
80016f50:	41414141 	cmpmi	r1, r1, asr #2
80016f54:	424b4545 	submi	r4, fp, #289406976	@ 0x11400000
80016f58:	41414141 	cmpmi	r1, r1, asr #2
80016f5c:	41414141 	cmpmi	r1, r1, asr #2
80016f60:	41414141 	cmpmi	r1, r1, asr #2
80016f64:	41414144 	cmpmi	r1, r4, asr #2
80016f68:	41414144 	cmpmi	r1, r4, asr #2
80016f6c:	41414141 	cmpmi	r1, r1, asr #2
80016f70:	41414141 	cmpmi	r1, r1, asr #2
80016f74:	424b4645 	submi	r4, fp, #72351744	@ 0x4500000
80016f78:	41414141 	cmpmi	r1, r1, asr #2
80016f7c:	41414141 	cmpmi	r1, r1, asr #2
80016f80:	41414141 	cmpmi	r1, r1, asr #2
80016f84:	41414144 	cmpmi	r1, r4, asr #2
80016f88:	41414145 	cmpmi	r1, r5, asr #2
80016f8c:	41414141 	cmpmi	r1, r1, asr #2
80016f90:	41414141 	cmpmi	r1, r1, asr #2
80016f94:	424b4645 	submi	r4, fp, #72351744	@ 0x4500000
80016f98:	41414141 	cmpmi	r1, r1, asr #2
80016f9c:	41414141 	cmpmi	r1, r1, asr #2
80016fa0:	41414141 	cmpmi	r1, r1, asr #2
80016fa4:	41414144 	cmpmi	r1, r4, asr #2
80016fa8:	41414146 	cmpmi	r1, r6, asr #2
80016fac:	41414141 	cmpmi	r1, r1, asr #2
80016fb0:	41414141 	cmpmi	r1, r1, asr #2
80016fb4:	41414141 	cmpmi	r1, r1, asr #2
80016fb8:	41414141 	cmpmi	r1, r1, asr #2
80016fbc:	41414141 	cmpmi	r1, r1, asr #2
80016fc0:	41414141 	cmpmi	r1, r1, asr #2
80016fc4:	41414144 	cmpmi	r1, r4, asr #2
80016fc8:	41414147 	cmpmi	r1, r7, asr #2
80016fcc:	41414141 	cmpmi	r1, r1, asr #2
80016fd0:	41414141 	cmpmi	r1, r1, asr #2
80016fd4:	41414141 	cmpmi	r1, r1, asr #2
80016fd8:	41414141 	cmpmi	r1, r1, asr #2
80016fdc:	41414141 	cmpmi	r1, r1, asr #2
80016fe0:	41414141 	cmpmi	r1, r1, asr #2
80016fe4:	41414144 	cmpmi	r1, r4, asr #2
80016fe8:	41414148 	cmpmi	r1, r8, asr #2
80016fec:	41414142 	cmpmi	r1, r2, asr #2
80016ff0:	41414141 	cmpmi	r1, r1, asr #2
80016ff4:	41414141 	cmpmi	r1, r1, asr #2
80016ff8:	41414141 	cmpmi	r1, r1, asr #2
80016ffc:	41414141 	cmpmi	r1, r1, asr #2
80017000:	41414141 	cmpmi	r1, r1, asr #2
80017004:	41414145 	cmpmi	r1, r5, asr #2
80017008:	50505042 	subspl	r5, r0, r2, asr #32
8001700c:	4141414e 	cmpmi	r1, lr, asr #2
80017010:	41414141 	cmpmi	r1, r1, asr #2
80017014:	414a4b45 	cmpmi	sl, r5, asr #22
80017018:	41414141 	cmpmi	r1, r1, asr #2
8001701c:	41414141 	cmpmi	r1, r1, asr #2
80017020:	41414141 	cmpmi	r1, r1, asr #2
80017024:	41414141 	cmpmi	r1, r1, asr #2
80017028:	41414143 	cmpmi	r1, r3, asr #2
8001702c:	41414241 	cmpmi	r1, r1, asr #4
80017030:	41414141 	cmpmi	r1, r1, asr #2
80017034:	41424141 	cmpmi	r2, r1, asr #2
80017038:	41414141 	cmpmi	r1, r1, asr #2
8001703c:	41414141 	cmpmi	r1, r1, asr #2
80017040:	41414141 	cmpmi	r1, r1, asr #2
80017044:	41414141 	cmpmi	r1, r1, asr #2
80017048:	41414142 	cmpmi	r1, r2, asr #2
8001704c:	4141414e 	cmpmi	r1, lr, asr #2
80017050:	41414141 	cmpmi	r1, r1, asr #2
80017054:	41424941 	cmpmi	r2, r1, asr #18
80017058:	41414141 	cmpmi	r1, r1, asr #2
8001705c:	41414141 	cmpmi	r1, r1, asr #2
80017060:	41414141 	cmpmi	r1, r1, asr #2
80017064:	41414141 	cmpmi	r1, r1, asr #2
80017068:	41414142 	cmpmi	r1, r2, asr #2
8001706c:	41414244 	cmpmi	r1, r4, asr #4
80017070:	41414141 	cmpmi	r1, r1, asr #2
80017074:	41414141 	cmpmi	r1, r1, asr #2
80017078:	41414141 	cmpmi	r1, r1, asr #2
8001707c:	41414141 	cmpmi	r1, r1, asr #2
80017080:	41414141 	cmpmi	r1, r1, asr #2
80017084:	41414145 	cmpmi	r1, r5, asr #2
80017088:	50505042 	subspl	r5, r0, r2, asr #32
8001708c:	41414241 	cmpmi	r1, r1, asr #4
80017090:	41414141 	cmpmi	r1, r1, asr #2
80017094:	41424a41 	cmpmi	r2, r1, asr #20
80017098:	41414141 	cmpmi	r1, r1, asr #2
8001709c:	41414141 	cmpmi	r1, r1, asr #2
800170a0:	41414141 	cmpmi	r1, r1, asr #2
800170a4:	41414141 	cmpmi	r1, r1, asr #2
800170a8:	41414142 	cmpmi	r1, r2, asr #2
800170ac:	41414250 	cmpmi	r1, r0, asr r2
800170b0:	41414141 	cmpmi	r1, r1, asr #2
800170b4:	41414141 	cmpmi	r1, r1, asr #2
800170b8:	41414141 	cmpmi	r1, r1, asr #2
800170bc:	41414141 	cmpmi	r1, r1, asr #2
800170c0:	41414141 	cmpmi	r1, r1, asr #2
800170c4:	41414145 	cmpmi	r1, r5, asr #2
800170c8:	50505042 	subspl	r5, r0, r2, asr #32
800170cc:	41414241 	cmpmi	r1, r1, asr #4
800170d0:	41414141 	cmpmi	r1, r1, asr #2
800170d4:	41444841 	cmpmi	r4, r1, asr #16
800170d8:	41414141 	cmpmi	r1, r1, asr #2
800170dc:	41414141 	cmpmi	r1, r1, asr #2
800170e0:	41414141 	cmpmi	r1, r1, asr #2
800170e4:	41414141 	cmpmi	r1, r1, asr #2
800170e8:	41414142 	cmpmi	r1, r2, asr #2
800170ec:	4141424e 	cmpmi	r1, lr, asr #4
800170f0:	41414141 	cmpmi	r1, r1, asr #2
800170f4:	41414141 	cmpmi	r1, r1, asr #2
800170f8:	41414141 	cmpmi	r1, r1, asr #2
800170fc:	41414141 	cmpmi	r1, r1, asr #2
80017100:	41414141 	cmpmi	r1, r1, asr #2
80017104:	41414145 	cmpmi	r1, r5, asr #2
80017108:	50505042 	subspl	r5, r0, r2, asr #32
8001710c:	4141414e 	cmpmi	r1, lr, asr #2
80017110:	41414141 	cmpmi	r1, r1, asr #2
80017114:	414a4e45 	cmpmi	sl, r5, asr #28
80017118:	41414141 	cmpmi	r1, r1, asr #2
8001711c:	41414141 	cmpmi	r1, r1, asr #2
80017120:	41414141 	cmpmi	r1, r1, asr #2
80017124:	41414141 	cmpmi	r1, r1, asr #2
80017128:	41414143 	cmpmi	r1, r3, asr #2
8001712c:	41414241 	cmpmi	r1, r1, asr #4
80017130:	41414141 	cmpmi	r1, r1, asr #2
80017134:	41454241 	cmpmi	r5, r1, asr #4
80017138:	41414141 	cmpmi	r1, r1, asr #2
8001713c:	41414141 	cmpmi	r1, r1, asr #2
80017140:	41414141 	cmpmi	r1, r1, asr #2
80017144:	41414141 	cmpmi	r1, r1, asr #2
80017148:	41414142 	cmpmi	r1, r2, asr #2
8001714c:	41414349 	cmpmi	r1, r9, asr #6
80017150:	41414141 	cmpmi	r1, r1, asr #2
80017154:	41474f41 	cmpmi	r7, r1, asr #30
80017158:	41414141 	cmpmi	r1, r1, asr #2
8001715c:	4141494d 	cmpmi	r1, sp, asr #18
80017160:	41414141 	cmpmi	r1, r1, asr #2
80017164:	41414143 	cmpmi	r1, r3, asr #2
80017168:	41414142 	cmpmi	r1, r2, asr #2
8001716c:	41414446 	cmpmi	r1, r6, asr #8
80017170:	41414141 	cmpmi	r1, r1, asr #2
80017174:	4148474d 	cmpmi	r8, sp, asr #14
80017178:	41414141 	cmpmi	r1, r1, asr #2
8001717c:	41414a49 	cmpmi	r1, r9, asr #20
80017180:	41414141 	cmpmi	r1, r1, asr #2
80017184:	41414143 	cmpmi	r1, r3, asr #2
80017188:	41414142 	cmpmi	r1, r2, asr #2
8001718c:	41414450 	cmpmi	r1, r0, asr r4
80017190:	41414141 	cmpmi	r1, r1, asr #2
80017194:	41494145 	cmpmi	r9, r5, asr #2
80017198:	41414141 	cmpmi	r1, r1, asr #2
8001719c:	41414b4d 	cmpmi	r1, sp, asr #22
800171a0:	41414141 	cmpmi	r1, r1, asr #2
800171a4:	41414143 	cmpmi	r1, r3, asr #2
800171a8:	41414142 	cmpmi	r1, r2, asr #2
800171ac:	4141414e 	cmpmi	r1, lr, asr #2
800171b0:	41414141 	cmpmi	r1, r1, asr #2
800171b4:	41474e49 	cmpmi	r7, r9, asr #28
800171b8:	41414141 	cmpmi	r1, r1, asr #2
800171bc:	41414141 	cmpmi	r1, r1, asr #2
800171c0:	41414141 	cmpmi	r1, r1, asr #2
800171c4:	41414141 	cmpmi	r1, r1, asr #2
800171c8:	41414142 	cmpmi	r1, r2, asr #2
800171cc:	41414241 	cmpmi	r1, r1, asr #4
800171d0:	41414141 	cmpmi	r1, r1, asr #2
800171d4:	41474f41 	cmpmi	r7, r1, asr #30
800171d8:	41414141 	cmpmi	r1, r1, asr #2
800171dc:	41414141 	cmpmi	r1, r1, asr #2
800171e0:	41414141 	cmpmi	r1, r1, asr #2
800171e4:	41414141 	cmpmi	r1, r1, asr #2
800171e8:	41414142 	cmpmi	r1, r2, asr #2
800171ec:	4141414e 	cmpmi	r1, lr, asr #2
800171f0:	41414141 	cmpmi	r1, r1, asr #2
800171f4:	41494b4d 	cmpmi	r9, sp, asr #22
800171f8:	41414141 	cmpmi	r1, r1, asr #2
800171fc:	41414141 	cmpmi	r1, r1, asr #2
80017200:	41414141 	cmpmi	r1, r1, asr #2
80017204:	41414141 	cmpmi	r1, r1, asr #2
80017208:	41414142 	cmpmi	r1, r2, asr #2
8001720c:	41414643 	cmpmi	r1, r3, asr #12
80017210:	41414141 	cmpmi	r1, r1, asr #2
80017214:	41414141 	cmpmi	r1, r1, asr #2
80017218:	41414141 	cmpmi	r1, r1, asr #2
8001721c:	41414141 	cmpmi	r1, r1, asr #2
80017220:	41414141 	cmpmi	r1, r1, asr #2
80017224:	41414145 	cmpmi	r1, r5, asr #2
80017228:	50505042 	subspl	r5, r0, r2, asr #32
8001722c:	41414241 	cmpmi	r1, r1, asr #4
80017230:	41414141 	cmpmi	r1, r1, asr #2
80017234:	41494c41 	cmpmi	r9, r1, asr #24
80017238:	41414141 	cmpmi	r1, r1, asr #2
8001723c:	41414141 	cmpmi	r1, r1, asr #2
80017240:	41414141 	cmpmi	r1, r1, asr #2
80017244:	41414141 	cmpmi	r1, r1, asr #2
80017248:	41414142 	cmpmi	r1, r2, asr #2
8001724c:	41414141 	cmpmi	r1, r1, asr #2
80017250:	41414141 	cmpmi	r1, r1, asr #2
80017254:	41414141 	cmpmi	r1, r1, asr #2
80017258:	41414141 	cmpmi	r1, r1, asr #2
8001725c:	41414141 	cmpmi	r1, r1, asr #2
80017260:	41414141 	cmpmi	r1, r1, asr #2
80017264:	41414145 	cmpmi	r1, r5, asr #2
80017268:	50505042 	subspl	r5, r0, r2, asr #32
8001726c:	4141464a 	cmpmi	r1, sl, asr #12
80017270:	41414141 	cmpmi	r1, r1, asr #2
80017274:	424b4545 	submi	r4, fp, #289406976	@ 0x11400000
80017278:	41414141 	cmpmi	r1, r1, asr #2
8001727c:	41414141 	cmpmi	r1, r1, asr #2
80017280:	41414141 	cmpmi	r1, r1, asr #2
80017284:	41414142 	cmpmi	r1, r2, asr #2
80017288:	41414144 	cmpmi	r1, r4, asr #2
8001728c:	41414750 	cmpmi	r1, r0, asr r7
80017290:	41414141 	cmpmi	r1, r1, asr #2
80017294:	41444349 	cmpmi	r4, r9, asr #6
80017298:	41414141 	cmpmi	r1, r1, asr #2
8001729c:	4141424d 	cmpmi	r1, sp, asr #4
800172a0:	41414141 	cmpmi	r1, r1, asr #2
800172a4:	41414243 	cmpmi	r1, r3, asr #4
800172a8:	41414142 	cmpmi	r1, r2, asr #2
800172ac:	41414846 	cmpmi	r1, r6, asr #16
800172b0:	41414141 	cmpmi	r1, r1, asr #2
800172b4:	41454241 	cmpmi	r5, r1, asr #4
800172b8:	41414141 	cmpmi	r1, r1, asr #2
800172bc:	41434e41 	cmpmi	r3, r1, asr #28
800172c0:	41414141 	cmpmi	r1, r1, asr #2
800172c4:	41414243 	cmpmi	r1, r3, asr #4
800172c8:	41414142 	cmpmi	r1, r2, asr #2
800172cc:	4141484f 	cmpmi	r1, pc, asr #16
800172d0:	41414141 	cmpmi	r1, r1, asr #2
800172d4:	41424a41 	cmpmi	r2, r1, asr #20
800172d8:	41414141 	cmpmi	r1, r1, asr #2
800172dc:	41414445 	cmpmi	r1, r5, asr #8
800172e0:	41414141 	cmpmi	r1, r1, asr #2
800172e4:	41414243 	cmpmi	r1, r3, asr #4
800172e8:	41414142 	cmpmi	r1, r2, asr #2
800172ec:	41414d48 	cmpmi	r1, r8, asr #26
800172f0:	41414141 	cmpmi	r1, r1, asr #2
800172f4:	424b4645 	submi	r4, fp, #72351744	@ 0x4500000
800172f8:	41414141 	cmpmi	r1, r1, asr #2
800172fc:	41414141 	cmpmi	r1, r1, asr #2
80017300:	41414141 	cmpmi	r1, r1, asr #2
80017304:	41414241 	cmpmi	r1, r1, asr #4
80017308:	41414144 	cmpmi	r1, r4, asr #2
8001730c:	41414948 	cmpmi	r1, r8, asr #18
80017310:	41414141 	cmpmi	r1, r1, asr #2
80017314:	41434c4d 	cmpmi	r3, sp, asr #24
80017318:	41414141 	cmpmi	r1, r1, asr #2
8001731c:	41414341 	cmpmi	r1, r1, asr #6
80017320:	41414141 	cmpmi	r1, r1, asr #2
80017324:	41414243 	cmpmi	r1, r3, asr #4
80017328:	41414142 	cmpmi	r1, r2, asr #2
8001732c:	4141494f 	cmpmi	r1, pc, asr #18
80017330:	41414141 	cmpmi	r1, r1, asr #2
80017334:	424b4645 	submi	r4, fp, #72351744	@ 0x4500000
80017338:	41414141 	cmpmi	r1, r1, asr #2
8001733c:	41414141 	cmpmi	r1, r1, asr #2
80017340:	41414141 	cmpmi	r1, r1, asr #2
80017344:	41414241 	cmpmi	r1, r1, asr #4
80017348:	41414144 	cmpmi	r1, r4, asr #2
8001734c:	41414a4d 	cmpmi	r1, sp, asr #20
80017350:	41414141 	cmpmi	r1, r1, asr #2
80017354:	41494c41 	cmpmi	r9, r1, asr #24
80017358:	41414141 	cmpmi	r1, r1, asr #2
8001735c:	41415045 	cmpmi	r1, r5, asr #32
80017360:	41414141 	cmpmi	r1, r1, asr #2
80017364:	41414243 	cmpmi	r1, r3, asr #4
80017368:	41414142 	cmpmi	r1, r2, asr #2
8001736c:	41414b4d 	cmpmi	r1, sp, asr #22
80017370:	41414141 	cmpmi	r1, r1, asr #2
80017374:	41434545 	cmpmi	r3, r5, asr #10
80017378:	41414141 	cmpmi	r1, r1, asr #2
8001737c:	4141434d 	cmpmi	r1, sp, asr #6
80017380:	41414141 	cmpmi	r1, r1, asr #2
80017384:	41414243 	cmpmi	r1, r3, asr #4
80017388:	41414142 	cmpmi	r1, r2, asr #2
8001738c:	41414c43 	cmpmi	r1, r3, asr #24
80017390:	41414141 	cmpmi	r1, r1, asr #2
80017394:	41434841 	cmpmi	r3, r1, asr #16
80017398:	41414141 	cmpmi	r1, r1, asr #2
8001739c:	41414341 	cmpmi	r1, r1, asr #6
800173a0:	41414141 	cmpmi	r1, r1, asr #2
800173a4:	41414243 	cmpmi	r1, r3, asr #4
800173a8:	41414142 	cmpmi	r1, r2, asr #2
800173ac:	41414c49 	cmpmi	r1, r9, asr #24
800173b0:	41414141 	cmpmi	r1, r1, asr #2
800173b4:	41434141 	cmpmi	r3, r1, asr #2
800173b8:	41414141 	cmpmi	r1, r1, asr #2
800173bc:	41414545 	cmpmi	r1, r5, asr #10
800173c0:	41414141 	cmpmi	r1, r1, asr #2
800173c4:	41414243 	cmpmi	r1, r3, asr #4
800173c8:	41414142 	cmpmi	r1, r2, asr #2
800173cc:	41414d42 	cmpmi	r1, r2, asr #26
800173d0:	41414141 	cmpmi	r1, r1, asr #2
800173d4:	4143504d 	cmpmi	r3, sp, asr #32
800173d8:	41414141 	cmpmi	r1, r1, asr #2
800173dc:	4141434d 	cmpmi	r1, sp, asr #6
800173e0:	41414141 	cmpmi	r1, r1, asr #2
800173e4:	41414243 	cmpmi	r1, r3, asr #4
800173e8:	41414142 	cmpmi	r1, r2, asr #2
800173ec:	41414d47 	cmpmi	r1, r7, asr #26
800173f0:	41414141 	cmpmi	r1, r1, asr #2
800173f4:	424b4645 	submi	r4, fp, #72351744	@ 0x4500000
800173f8:	41414141 	cmpmi	r1, r1, asr #2
800173fc:	41414141 	cmpmi	r1, r1, asr #2
80017400:	41414141 	cmpmi	r1, r1, asr #2
80017404:	41414241 	cmpmi	r1, r1, asr #4
80017408:	41414144 	cmpmi	r1, r4, asr #2
8001740c:	41414e43 	cmpmi	r1, r3, asr #28
80017410:	41414141 	cmpmi	r1, r1, asr #2
80017414:	41444545 	cmpmi	r4, r5, asr #10
80017418:	41414141 	cmpmi	r1, r1, asr #2
8001741c:	4141434d 	cmpmi	r1, sp, asr #6
80017420:	41414141 	cmpmi	r1, r1, asr #2
80017424:	41414243 	cmpmi	r1, r3, asr #4
80017428:	41414142 	cmpmi	r1, r2, asr #2
8001742c:	41424344 	cmpmi	r2, r4, asr #6
80017430:	41414141 	cmpmi	r1, r1, asr #2
80017434:	41424141 	cmpmi	r2, r1, asr #2
80017438:	41414141 	cmpmi	r1, r1, asr #2
8001743c:	41414a41 	cmpmi	r1, r1, asr #20
80017440:	41414141 	cmpmi	r1, r1, asr #2
80017444:	41414243 	cmpmi	r1, r3, asr #4
80017448:	41414142 	cmpmi	r1, r2, asr #2
8001744c:	41414e48 	cmpmi	r1, r8, asr #28
80017450:	41414141 	cmpmi	r1, r1, asr #2
80017454:	41434e4d 	cmpmi	r3, sp, asr #28
80017458:	41414141 	cmpmi	r1, r1, asr #2
8001745c:	41414341 	cmpmi	r1, r1, asr #6
80017460:	41414141 	cmpmi	r1, r1, asr #2
80017464:	41414243 	cmpmi	r1, r3, asr #4
80017468:	41414142 	cmpmi	r1, r2, asr #2
8001746c:	41414e4d 	cmpmi	r1, sp, asr #28
80017470:	41414141 	cmpmi	r1, r1, asr #2
80017474:	424b4645 	submi	r4, fp, #72351744	@ 0x4500000
80017478:	41414141 	cmpmi	r1, r1, asr #2
8001747c:	41414141 	cmpmi	r1, r1, asr #2
80017480:	41414141 	cmpmi	r1, r1, asr #2
80017484:	41414241 	cmpmi	r1, r1, asr #4
80017488:	41414144 	cmpmi	r1, r4, asr #2
8001748c:	41414f49 	cmpmi	r1, r9, asr #30
80017490:	41414141 	cmpmi	r1, r1, asr #2
80017494:	424b4645 	submi	r4, fp, #72351744	@ 0x4500000
80017498:	41414141 	cmpmi	r1, r1, asr #2
8001749c:	41414141 	cmpmi	r1, r1, asr #2
800174a0:	41414141 	cmpmi	r1, r1, asr #2
800174a4:	41414241 	cmpmi	r1, r1, asr #4
800174a8:	41414144 	cmpmi	r1, r4, asr #2
800174ac:	41415041 	cmpmi	r1, r1, asr #32
800174b0:	41414141 	cmpmi	r1, r1, asr #2
800174b4:	41424d45 	cmpmi	r2, r5, asr #26
800174b8:	41414141 	cmpmi	r1, r1, asr #2
800174bc:	4141444d 	cmpmi	r1, sp, asr #8
800174c0:	41414141 	cmpmi	r1, r1, asr #2
800174c4:	41414243 	cmpmi	r1, r3, asr #4
800174c8:	41414142 	cmpmi	r1, r2, asr #2
800174cc:	4141504a 	cmpmi	r1, sl, asr #32
800174d0:	41414141 	cmpmi	r1, r1, asr #2
800174d4:	41444841 	cmpmi	r4, r1, asr #16
800174d8:	41414141 	cmpmi	r1, r1, asr #2
800174dc:	41414b41 	cmpmi	r1, r1, asr #22
800174e0:	41414141 	cmpmi	r1, r1, asr #2
800174e4:	41414243 	cmpmi	r1, r3, asr #4
800174e8:	41414142 	cmpmi	r1, r2, asr #2
800174ec:	41424146 	cmpmi	r2, r6, asr #2
800174f0:	41414141 	cmpmi	r1, r1, asr #2
800174f4:	424b4645 	submi	r4, fp, #72351744	@ 0x4500000
800174f8:	41414141 	cmpmi	r1, r1, asr #2
800174fc:	41414141 	cmpmi	r1, r1, asr #2
80017500:	41414141 	cmpmi	r1, r1, asr #2
80017504:	41414241 	cmpmi	r1, r1, asr #4
80017508:	41414144 	cmpmi	r1, r4, asr #2
8001750c:	4142414d 	cmpmi	r2, sp, asr #2
80017510:	41414141 	cmpmi	r1, r1, asr #2
80017514:	424b4645 	submi	r4, fp, #72351744	@ 0x4500000
80017518:	41414141 	cmpmi	r1, r1, asr #2
8001751c:	41414141 	cmpmi	r1, r1, asr #2
80017520:	41414141 	cmpmi	r1, r1, asr #2
80017524:	41414241 	cmpmi	r1, r1, asr #4
80017528:	41414144 	cmpmi	r1, r4, asr #2
8001752c:	41424242 	cmpmi	r2, r2, asr #4
80017530:	41414141 	cmpmi	r1, r1, asr #2
80017534:	41434a41 	cmpmi	r3, r1, asr #20
80017538:	41414141 	cmpmi	r1, r1, asr #2
8001753c:	4141434d 	cmpmi	r1, sp, asr #6
80017540:	41414141 	cmpmi	r1, r1, asr #2
80017544:	41414243 	cmpmi	r1, r3, asr #4
80017548:	41414142 	cmpmi	r1, r2, asr #2
8001754c:	41424247 	cmpmi	r2, r7, asr #4
80017550:	41414141 	cmpmi	r1, r1, asr #2
80017554:	41414141 	cmpmi	r1, r1, asr #2
80017558:	41414149 	cmpmi	r1, r9, asr #2
8001755c:	41414141 	cmpmi	r1, r1, asr #2
80017560:	41414141 	cmpmi	r1, r1, asr #2
80017564:	41414241 	cmpmi	r1, r1, asr #4
80017568:	41414146 	cmpmi	r1, r6, asr #2
8001756c:	4142424e 	cmpmi	r2, lr, asr #4
80017570:	41414141 	cmpmi	r1, r1, asr #2
80017574:	424b4645 	submi	r4, fp, #72351744	@ 0x4500000
80017578:	41414141 	cmpmi	r1, r1, asr #2
8001757c:	41414141 	cmpmi	r1, r1, asr #2
80017580:	41414141 	cmpmi	r1, r1, asr #2
80017584:	41414241 	cmpmi	r1, r1, asr #4
80017588:	41414144 	cmpmi	r1, r4, asr #2
8001758c:	47464141 	strbmi	r4, [r6, -r1, asr #2]
80017590:	47464849 	strbmi	r4, [r6, -r9, asr #16]
80017594:	46504744 	ldrbmi	r4, [r0], -r4, asr #14
80017598:	47464845 	strbmi	r4, [r6, -r5, asr #16]
8001759c:	48454844 	stmdami	r5, {r2, r6, fp, lr}^
800175a0:	4744434f 	strbmi	r4, [r4, -pc, asr #6]
800175a4:	43454141 	movtmi	r4, #20801	@ 0x5141
800175a8:	41414745 	cmpmi	r1, r5, asr #14
800175ac:	47424345 	strbmi	r4, [r2, -r5, asr #6]
800175b0:	48444141 	stmdami	r4, {r0, r6, r8, lr}^
800175b4:	4844484a 	stmdami	r4, {r1, r3, r6, fp, lr}^
800175b8:	47424744 	strbmi	r4, [r2, -r4, asr #14]
800175bc:	474d474d 	strbmi	r4, [sp, -sp, asr #14]
800175c0:	4744434f 	strbmi	r4, [r4, -pc, asr #6]
800175c4:	48474141 	stmdami	r7, {r0, r6, r8, lr}^
800175c8:	48414844 	stmdami	r1, {r2, r6, fp, lr}^
800175cc:	474a4843 	strbmi	r4, [sl, -r3, asr #16]
800175d0:	4845474f 	stmdami	r5, {r0, r1, r2, r3, r6, r8, r9, sl, lr}^
800175d4:	434f4747 	movtmi	r4, #63303	@ 0xf747
800175d8:	41414744 	cmpmi	r1, r4, asr #14
800175dc:	48434841 	stmdami	r3, {r0, r6, fp, lr}^
800175e0:	474f474a 	strbmi	r4, [pc, -sl, asr #14]
800175e4:	46504845 	ldrbmi	r4, [r0], -r5, asr #16
800175e8:	48454844 	stmdami	r5, {r2, r6, fp, lr}^
800175ec:	474a4843 	strbmi	r4, [sl, -r3, asr #16]
800175f0:	4748474f 	strbmi	r4, [r8, -pc, asr #14]
800175f4:	48414141 	stmdami	r1, {r0, r6, r8, lr}^
800175f8:	474a4843 	strbmi	r4, [sl, -r3, asr #16]
800175fc:	4845474f 	stmdami	r5, {r0, r1, r2, r3, r6, r8, r9, sl, lr}^
80017600:	474a4650 	smlsldmi	r4, sl, r0, r6
80017604:	4845474f 	stmdami	r5, {r0, r1, r2, r3, r6, r8, r9, sl, lr}^
80017608:	48414141 	stmdami	r1, {r0, r6, r8, lr}^
8001760c:	474a4843 	strbmi	r4, [sl, -r3, asr #16]
80017610:	4845474f 	stmdami	r5, {r0, r1, r2, r3, r6, r8, r9, sl, lr}^
80017614:	48464650 	stmdami	r6, {r4, r6, r9, sl, lr}^
80017618:	474f474a 	strbmi	r4, [pc, -sl, asr #14]
8001761c:	46504845 	ldrbmi	r4, [r0], -r5, asr #16
80017620:	474f474a 	strbmi	r4, [pc, -sl, asr #14]
80017624:	47434650 	smlsldmi	r4, r3, r0, r6
80017628:	48444742 	stmdami	r4, {r1, r6, r8, r9, sl, lr}^
8001762c:	41414746 	cmpmi	r1, r6, asr #14
80017630:	4742474e 	strbmi	r4, [r2, -lr, asr #14]
80017634:	47494845 	strbmi	r4, [r9, -r5, asr #16]
80017638:	4744434f 	strbmi	r4, [r4, -pc, asr #6]
8001763c:	46504141 	ldrbmi	r4, [r0], -r1, asr #2
80017640:	454d4548 	strbmi	r4, [sp, #-1352]	@ 0xfffffab8
80017644:	45434550 	strbmi	r4, [r3, #-1360]	@ 0xfffffab0
80017648:	454d4542 	strbmi	r4, [sp, #-1346]	@ 0xfffffabe
8001764c:	45504650 	ldrbmi	r4, [r0, #-1616]	@ 0xfffff9b0
80017650:	45474547 	strbmi	r4, [r7, #-1351]	@ 0xfffffab9
80017654:	45464644 	strbmi	r4, [r6, #-1604]	@ 0xfffff9bc
80017658:	46504645 	ldrbmi	r4, [r0], -r5, asr #12
8001765c:	45424645 	strbmi	r4, [r2, #-1605]	@ 0xfffff9bb
80017660:	454d4543 	strbmi	r4, [sp, #-1347]	@ 0xfffffabd
80017664:	46504546 	ldrbmi	r4, [r0], -r6, asr #10
80017668:	484a4141 	stmdami	sl, {r0, r6, r8, lr}^
8001766c:	4746474a 	strbmi	r4, [r6, -sl, asr #14]
80017670:	4745474d 	strbmi	r4, [r5, -sp, asr #14]
80017674:	48474141 	stmdami	r7, {r0, r6, r8, lr}^
80017678:	48414844 	stmdami	r1, {r2, r6, fp, lr}^
8001767c:	474a4843 	strbmi	r4, [sl, -r3, asr #16]
80017680:	4845474f 	stmdami	r5, {r0, r1, r2, r3, r6, r8, r9, sl, lr}^
80017684:	41414747 	cmpmi	r1, r7, asr #14
80017688:	484a4844 	stmdami	sl, {r2, r6, fp, lr}^
8001768c:	47444844 	strbmi	r4, [r4, -r4, asr #16]
80017690:	474d4742 	strbmi	r4, [sp, -r2, asr #14]
80017694:	4441474d 	strbmi	r4, [r1], #-1869	@ 0xfffff8b3
80017698:	47484141 	strbmi	r4, [r8, -r1, asr #2]
8001769c:	48454746 	stmdami	r5, {r1, r2, r6, r8, r9, sl, lr}^
800176a0:	474a4841 	strbmi	r4, [sl, -r1, asr #16]
800176a4:	41414745 	cmpmi	r1, r5, asr #14
800176a8:	46504650 			@ <UNDEFINED> instruction: 0x46504650
800176ac:	48444743 	stmdami	r4, {r0, r1, r6, r8, r9, sl, lr}^
800176b0:	46504844 	ldrbmi	r4, [r0], -r4, asr #16
800176b4:	48454844 	stmdami	r5, {r2, r6, fp, lr}^
800176b8:	48434742 	stmdami	r3, {r1, r6, r8, r9, sl, lr}^
800176bc:	46504845 	ldrbmi	r4, [r0], -r5, asr #16
800176c0:	41414650 	cmpmi	r1, r0, asr r6
800176c4:	474f4846 	strbmi	r4, [pc, -r6, asr #16]
800176c8:	474a4844 	strbmi	r4, [sl, -r4, asr #16]
800176cc:	474f4748 	strbmi	r4, [pc, -r8, asr #14]
800176d0:	47454746 	strbmi	r4, [r5, -r6, asr #14]
800176d4:	47454650 	smlsldmi	r4, r5, r0, r6
800176d8:	4847474a 	stmdami	r7, {r1, r3, r6, r8, r9, sl, lr}^
800176dc:	4750474e 	ldrbmi	r4, [r0, -lr, asr #14]
800176e0:	41414745 	cmpmi	r1, r5, asr #14
800176e4:	48464841 	stmdami	r6, {r0, r6, fp, lr}^
800176e8:	47444845 	strbmi	r4, [r4, -r5, asr #16]
800176ec:	41414749 	cmpmi	r1, r9, asr #14
800176f0:	47464748 	strbmi	r4, [r6, -r8, asr #14]
800176f4:	47444845 	strbmi	r4, [r4, -r5, asr #16]
800176f8:	41414749 	cmpmi	r1, r9, asr #14
800176fc:	484a4844 	stmdami	sl, {r2, r6, fp, lr}^
80017700:	47444844 	strbmi	r4, [r4, -r4, asr #16]
80017704:	474d4742 	strbmi	r4, [sp, -r2, asr #14]
80017708:	4443474d 	strbmi	r4, [r3], #-1869	@ 0xfffff8b3
8001770c:	47464141 	strbmi	r4, [r6, -r1, asr #2]
80017710:	47464849 	strbmi	r4, [r6, -r9, asr #16]
80017714:	41414744 	cmpmi	r1, r4, asr #14
80017718:	46504650 			@ <UNDEFINED> instruction: 0x46504650
8001771c:	48444743 	stmdami	r4, {r0, r1, r6, r8, r9, sl, lr}^
80017720:	46504844 	ldrbmi	r4, [r0], -r4, asr #16
80017724:	474f4746 	strbmi	r4, [pc, -r6, asr #14]
80017728:	46504745 	ldrbmi	r4, [r0], -r5, asr #14
8001772c:	41414650 	cmpmi	r1, r0, asr r6
80017730:	47424848 	strbmi	r4, [r2, -r8, asr #16]
80017734:	4845474a 	stmdami	r5, {r1, r3, r6, r8, r9, sl, lr}^
80017738:	47474141 	strbmi	r4, [r7, -r1, asr #2]
8001773c:	48434750 	stmdami	r3, {r4, r6, r8, r9, sl, lr}^
80017740:	4141474c 	cmpmi	r1, ip, asr #14
80017744:	46504650 			@ <UNDEFINED> instruction: 0x46504650
80017748:	48444743 	stmdami	r4, {r0, r1, r6, r8, r9, sl, lr}^
8001774c:	46504844 	ldrbmi	r4, [r0], -r4, asr #16
80017750:	48454844 	stmdami	r5, {r2, r6, fp, lr}^
80017754:	48434742 	stmdami	r3, {r1, r6, r8, r9, sl, lr}^
80017758:	41414845 	cmpmi	r1, r5, asr #16
8001775c:	46504650 			@ <UNDEFINED> instruction: 0x46504650
80017760:	474f4746 	strbmi	r4, [pc, -r6, asr #14]
80017764:	46504745 	ldrbmi	r4, [r0], -r5, asr #14
80017768:	41414650 	cmpmi	r1, r0, asr r6
8001776c:	484a4844 	stmdami	sl, {r2, r6, fp, lr}^
80017770:	47444844 	strbmi	r4, [r4, -r4, asr #16]
80017774:	474d4742 	strbmi	r4, [sp, -r2, asr #14]
80017778:	4442474d 	strbmi	r4, [r2], #-1869	@ 0xfffff8b3
8001777c:	48414141 	stmdami	r1, {r0, r6, r8, lr}^
80017780:	474a4843 	strbmi	r4, [sl, -r3, asr #16]
80017784:	4845474f 	stmdami	r5, {r0, r1, r2, r3, r6, r8, r9, sl, lr}^
80017788:	46504747 	ldrbmi	r4, [r0], -r7, asr #14
8001778c:	47424743 	strbmi	r4, [r2, -r3, asr #14]
80017790:	47464844 	strbmi	r4, [r6, -r4, asr #16]
80017794:	46504141 	ldrbmi	r4, [r0], -r1, asr #2
80017798:	47454746 	strbmi	r4, [r5, -r6, asr #14]
8001779c:	48454742 	stmdami	r5, {r1, r6, r8, r9, sl, lr}^
800177a0:	41414742 	cmpmi	r1, r2, asr #14
800177a4:	47464650 	smlsldmi	r4, r6, r0, r6
800177a8:	4745474f 	strbmi	r4, [r5, -pc, asr #14]
800177ac:	47464141 	strbmi	r4, [r6, -r1, asr #2]
800177b0:	474a4849 	strbmi	r4, [sl, -r9, asr #16]
800177b4:	41414845 	cmpmi	r1, r5, asr #16
800177b8:	48444650 	stmdami	r4, {r4, r6, r9, sl, lr}^
800177bc:	47424845 	strbmi	r4, [r2, -r5, asr #16]
800177c0:	474c4744 	strbmi	r4, [ip, -r4, asr #14]
800177c4:	46504141 	ldrbmi	r4, [r0], -r1, asr #2
800177c8:	47454650 	smlsldmi	r4, r5, r0, r6
800177cc:	48454742 	stmdami	r5, {r1, r6, r8, r9, sl, lr}^
800177d0:	46504742 	ldrbmi	r4, [r0], -r2, asr #14
800177d4:	48454844 	stmdami	r5, {r2, r6, fp, lr}^
800177d8:	48434742 	stmdami	r3, {r1, r6, r8, r9, sl, lr}^
800177dc:	41414845 	cmpmi	r1, r5, asr #16
800177e0:	434f4141 	movtmi	r4, #61761	@ 0xf141
800177e4:	484a4844 	stmdami	sl, {r2, r6, fp, lr}^
800177e8:	4845474e 	stmdami	r5, {r1, r2, r3, r6, r8, r9, sl, lr}^
800177ec:	47434742 	strbmi	r4, [r3, -r2, asr #14]
800177f0:	434f4141 	movtmi	r4, #61761	@ 0xf141
800177f4:	48454844 	stmdami	r5, {r2, r6, fp, lr}^
800177f8:	48454843 	stmdami	r5, {r0, r1, r6, fp, lr}^
800177fc:	47434742 	strbmi	r4, [r3, -r2, asr #14]
80017800:	434f4141 	movtmi	r4, #61761	@ 0xf141
80017804:	47494844 	strbmi	r4, [r9, -r4, asr #16]
80017808:	48454844 	stmdami	r5, {r2, r6, fp, lr}^
8001780c:	48454843 	stmdami	r5, {r0, r1, r6, fp, lr}^
80017810:	47434742 	strbmi	r4, [r3, -r2, asr #14]
80017814:	434f4141 	movtmi	r4, #61761	@ 0xf141
80017818:	47464845 	strbmi	r4, [r6, -r5, asr #16]
8001781c:	48454849 	stmdami	r5, {r0, r3, r6, fp, lr}^
80017820:	434f4141 	movtmi	r4, #61761	@ 0xf141
80017824:	47504843 	ldrbmi	r4, [r0, -r3, asr #16]
80017828:	47424745 	strbmi	r4, [r2, -r5, asr #14]
8001782c:	47424845 	strbmi	r4, [r2, -r5, asr #16]
80017830:	434f4141 	movtmi	r4, #61761	@ 0xf141
80017834:	47504748 	ldrbmi	r4, [r0, -r8, asr #14]
80017838:	41414845 	cmpmi	r1, r5, asr #16
8001783c:	4841434f 	stmdami	r1, {r0, r1, r2, r3, r6, r8, r9, lr}^
80017840:	48434746 	stmdami	r3, {r1, r2, r6, r8, r9, sl, lr}^
80017844:	474a4844 	strbmi	r4, [sl, -r4, asr #16]
80017848:	48454844 	stmdami	r5, {r2, r6, fp, lr}^
8001784c:	474f4746 	strbmi	r4, [pc, -r6, asr #14]
80017850:	41414845 	cmpmi	r1, r5, asr #16
80017854:	474f434f 	strbmi	r4, [pc, -pc, asr #6]
80017858:	474a4750 	smlsldmi	r4, sl, r0, r7
8001785c:	474a474f 	strbmi	r4, [sl, -pc, asr #14]
80017860:	41414845 	cmpmi	r1, r5, asr #16
80017864:	4744434f 	strbmi	r4, [r4, -pc, asr #6]
80017868:	474e4750 	smlsldmi	r4, lr, r0, r7
8001786c:	4746474e 	strbmi	r4, [r6, -lr, asr #14]
80017870:	4845474f 	stmdami	r5, {r0, r1, r2, r3, r6, r8, r9, sl, lr}^
80017874:	434f4141 	movtmi	r4, #61761	@ 0xf141
80017878:	46434542 	strbmi	r4, [r3], -r2, asr #10
8001787c:	434f454e 	movtmi	r4, #62798	@ 0xf54e
80017880:	48454742 	stmdami	r5, {r1, r6, r8, r9, sl, lr}^
80017884:	48434845 	stmdami	r3, {r0, r2, r6, fp, lr}^
80017888:	4743474a 	strbmi	r4, [r3, -sl, asr #14]
8001788c:	48454846 	stmdami	r5, {r1, r2, r6, fp, lr}^
80017890:	48444746 	stmdami	r4, {r1, r2, r6, r8, r9, sl, lr}^
80017894:	41414141 	cmpmi	r1, r1, asr #2
80017898:	41414141 	cmpmi	r1, r1, asr #2
8001789c:	41414141 	cmpmi	r1, r1, asr #2
800178a0:	41414141 	cmpmi	r1, r1, asr #2
800178a4:	41414141 	cmpmi	r1, r1, asr #2
800178a8:	41414141 	cmpmi	r1, r1, asr #2
800178ac:	41414141 	cmpmi	r1, r1, asr #2
800178b0:	41414141 	cmpmi	r1, r1, asr #2
800178b4:	41414141 	cmpmi	r1, r1, asr #2
800178b8:	41414141 	cmpmi	r1, r1, asr #2
800178bc:	41414141 	cmpmi	r1, r1, asr #2
800178c0:	41414141 	cmpmi	r1, r1, asr #2
800178c4:	41414141 	cmpmi	r1, r1, asr #2
800178c8:	41414141 	cmpmi	r1, r1, asr #2
800178cc:	41414141 	cmpmi	r1, r1, asr #2
800178d0:	41414141 	cmpmi	r1, r1, asr #2
800178d4:	41414141 	cmpmi	r1, r1, asr #2
800178d8:	41414141 	cmpmi	r1, r1, asr #2
800178dc:	41414141 	cmpmi	r1, r1, asr #2
800178e0:	41414141 	cmpmi	r1, r1, asr #2
800178e4:	41414141 	cmpmi	r1, r1, asr #2
800178e8:	41414141 	cmpmi	r1, r1, asr #2
800178ec:	4141424c 	cmpmi	r1, ip, asr #4
800178f0:	41414141 	cmpmi	r1, r1, asr #2
800178f4:	41414142 	cmpmi	r1, r2, asr #2
800178f8:	41414141 	cmpmi	r1, r1, asr #2
800178fc:	41414147 	cmpmi	r1, r7, asr #2
80017900:	41414141 	cmpmi	r1, r1, asr #2
80017904:	41424141 	cmpmi	r2, r1, asr #2
80017908:	41414141 	cmpmi	r1, r1, asr #2
8001790c:	41424141 	cmpmi	r2, r1, asr #2
80017910:	41414141 	cmpmi	r1, r1, asr #2
80017914:	41494b45 	cmpmi	r9, r5, asr #22
80017918:	41414141 	cmpmi	r1, r1, asr #2
8001791c:	41414141 	cmpmi	r1, r1, asr #2
80017920:	41414141 	cmpmi	r1, r1, asr #2
80017924:	41414141 	cmpmi	r1, r1, asr #2
80017928:	41414141 	cmpmi	r1, r1, asr #2
8001792c:	41414145 	cmpmi	r1, r5, asr #2
80017930:	41414141 	cmpmi	r1, r1, asr #2
80017934:	41414141 	cmpmi	r1, r1, asr #2
80017938:	41414141 	cmpmi	r1, r1, asr #2
8001793c:	41414342 	cmpmi	r1, r2, asr #6
80017940:	41414141 	cmpmi	r1, r1, asr #2
80017944:	41414142 	cmpmi	r1, r2, asr #2
80017948:	41414141 	cmpmi	r1, r1, asr #2
8001794c:	41414143 	cmpmi	r1, r3, asr #2
80017950:	41414141 	cmpmi	r1, r1, asr #2
80017954:	414a4b45 	cmpmi	sl, r5, asr #22
80017958:	41414141 	cmpmi	r1, r1, asr #2
8001795c:	414a4b45 	cmpmi	sl, r5, asr #22
80017960:	41414141 	cmpmi	r1, r1, asr #2
80017964:	41414a4e 	cmpmi	r1, lr, asr #20
80017968:	41414141 	cmpmi	r1, r1, asr #2
8001796c:	41414141 	cmpmi	r1, r1, asr #2
80017970:	41414141 	cmpmi	r1, r1, asr #2
80017974:	41414141 	cmpmi	r1, r1, asr #2
80017978:	41414141 	cmpmi	r1, r1, asr #2
8001797c:	41414145 	cmpmi	r1, r5, asr #2
80017980:	41414141 	cmpmi	r1, r1, asr #2
80017984:	41414141 	cmpmi	r1, r1, asr #2
80017988:	41414141 	cmpmi	r1, r1, asr #2
8001798c:	4141434a 	cmpmi	r1, sl, asr #6
80017990:	41414141 	cmpmi	r1, r1, asr #2
80017994:	41414142 	cmpmi	r1, r2, asr #2
80017998:	41414141 	cmpmi	r1, r1, asr #2
8001799c:	41414144 	cmpmi	r1, r4, asr #2
800179a0:	41414141 	cmpmi	r1, r1, asr #2
800179a4:	00000000 	andeq	r0, r0, r0
800179a8:	424b4545 	submi	r4, fp, #289406976	@ 0x11400000
800179ac:	41414141 	cmpmi	r1, r1, asr #2
800179b0:	414b4545 	cmpmi	fp, r5, asr #10
800179b4:	41414141 	cmpmi	r1, r1, asr #2
800179b8:	41414241 	cmpmi	r1, r1, asr #4
800179bc:	41414141 	cmpmi	r1, r1, asr #2
800179c0:	41414141 	cmpmi	r1, r1, asr #2
800179c4:	41414141 	cmpmi	r1, r1, asr #2
800179c8:	41414141 	cmpmi	r1, r1, asr #2
800179cc:	41414141 	cmpmi	r1, r1, asr #2
800179d0:	41414145 	cmpmi	r1, r5, asr #2
800179d4:	41414141 	cmpmi	r1, r1, asr #2
800179d8:	41414145 	cmpmi	r1, r5, asr #2
800179dc:	41414141 	cmpmi	r1, r1, asr #2
800179e0:	4141434f 	cmpmi	r1, pc, asr #6
800179e4:	41414141 	cmpmi	r1, r1, asr #2
800179e8:	41414142 	cmpmi	r1, r2, asr #2
800179ec:	41414141 	cmpmi	r1, r1, asr #2
800179f0:	41414144 	cmpmi	r1, r4, asr #2
800179f4:	41414141 	cmpmi	r1, r1, asr #2
800179f8:	424b4645 	submi	r4, fp, #72351744	@ 0x4500000
800179fc:	41414141 	cmpmi	r1, r1, asr #2
80017a00:	414b4645 	cmpmi	fp, r5, asr #12
80017a04:	41414141 	cmpmi	r1, r1, asr #2
80017a08:	41414141 	cmpmi	r1, r1, asr #2
80017a0c:	41414141 	cmpmi	r1, r1, asr #2
80017a10:	41414141 	cmpmi	r1, r1, asr #2
80017a14:	41414141 	cmpmi	r1, r1, asr #2
80017a18:	41414141 	cmpmi	r1, r1, asr #2
80017a1c:	41414141 	cmpmi	r1, r1, asr #2
80017a20:	41414145 	cmpmi	r1, r5, asr #2
80017a24:	41414141 	cmpmi	r1, r1, asr #2
80017a28:	41414141 	cmpmi	r1, r1, asr #2
80017a2c:	41414141 	cmpmi	r1, r1, asr #2
80017a30:	4141444b 	cmpmi	r1, fp, asr #8
80017a34:	41414141 	cmpmi	r1, r1, asr #2
80017a38:	41414149 	cmpmi	r1, r9, asr #2
80017a3c:	41414141 	cmpmi	r1, r1, asr #2
80017a40:	41414144 	cmpmi	r1, r4, asr #2
80017a44:	41414141 	cmpmi	r1, r1, asr #2
80017a48:	424b4645 	submi	r4, fp, #72351744	@ 0x4500000
80017a4c:	41414141 	cmpmi	r1, r1, asr #2
80017a50:	41414141 	cmpmi	r1, r1, asr #2
80017a54:	41414141 	cmpmi	r1, r1, asr #2
80017a58:	41414141 	cmpmi	r1, r1, asr #2
80017a5c:	41414141 	cmpmi	r1, r1, asr #2
80017a60:	41414141 	cmpmi	r1, r1, asr #2
80017a64:	41414141 	cmpmi	r1, r1, asr #2
80017a68:	41414141 	cmpmi	r1, r1, asr #2
80017a6c:	41414141 	cmpmi	r1, r1, asr #2
80017a70:	41414145 	cmpmi	r1, r5, asr #2
80017a74:	41414141 	cmpmi	r1, r1, asr #2
80017a78:	41414141 	cmpmi	r1, r1, asr #2
80017a7c:	41414141 	cmpmi	r1, r1, asr #2
80017a80:	41414543 	cmpmi	r1, r3, asr #10
80017a84:	41414141 	cmpmi	r1, r1, asr #2
80017a88:	41414142 	cmpmi	r1, r2, asr #2
80017a8c:	41414141 	cmpmi	r1, r1, asr #2
80017a90:	41414441 	cmpmi	r1, r1, asr #8
80017a94:	41414141 	cmpmi	r1, r1, asr #2
80017a98:	41414141 	cmpmi	r1, r1, asr #2
80017a9c:	41414141 	cmpmi	r1, r1, asr #2
80017aa0:	414b4645 	cmpmi	fp, r5, asr #12
80017aa4:	41414141 	cmpmi	r1, r1, asr #2
80017aa8:	4141424f 	cmpmi	r1, pc, asr #4
80017aac:	41414141 	cmpmi	r1, r1, asr #2
80017ab0:	41414141 	cmpmi	r1, r1, asr #2
80017ab4:	41414141 	cmpmi	r1, r1, asr #2
80017ab8:	41414141 	cmpmi	r1, r1, asr #2
80017abc:	41414141 	cmpmi	r1, r1, asr #2
80017ac0:	41414142 	cmpmi	r1, r2, asr #2
80017ac4:	41414141 	cmpmi	r1, r1, asr #2
80017ac8:	41414142 	cmpmi	r1, r2, asr #2
80017acc:	41414141 	cmpmi	r1, r1, asr #2
80017ad0:	4141454c 	cmpmi	r1, ip, asr #10
80017ad4:	41414141 	cmpmi	r1, r1, asr #2
80017ad8:	41414144 	cmpmi	r1, r4, asr #2
80017adc:	48414141 	stmdami	r1, {r0, r6, r8, lr}^
80017ae0:	41414141 	cmpmi	r1, r1, asr #2
80017ae4:	41414141 	cmpmi	r1, r1, asr #2
80017ae8:	41414141 	cmpmi	r1, r1, asr #2
80017aec:	41414141 	cmpmi	r1, r1, asr #2
80017af0:	414b4843 	cmpmi	fp, r3, asr #16
80017af4:	41414141 	cmpmi	r1, r1, asr #2
80017af8:	41414350 	cmpmi	r1, r0, asr r3
80017afc:	41414141 	cmpmi	r1, r1, asr #2
80017b00:	41414141 	cmpmi	r1, r1, asr #2
80017b04:	41414141 	cmpmi	r1, r1, asr #2
80017b08:	41414141 	cmpmi	r1, r1, asr #2
80017b0c:	41414141 	cmpmi	r1, r1, asr #2
80017b10:	41414142 	cmpmi	r1, r2, asr #2
80017b14:	41414141 	cmpmi	r1, r1, asr #2
80017b18:	41414141 	cmpmi	r1, r1, asr #2
80017b1c:	41414141 	cmpmi	r1, r1, asr #2
80017b20:	41414142 	cmpmi	r1, r2, asr #2
80017b24:	41414141 	cmpmi	r1, r1, asr #2
80017b28:	41414143 	cmpmi	r1, r3, asr #2
80017b2c:	41414141 	cmpmi	r1, r1, asr #2
80017b30:	41414141 	cmpmi	r1, r1, asr #2
80017b34:	41414141 	cmpmi	r1, r1, asr #2
80017b38:	41414141 	cmpmi	r1, r1, asr #2
80017b3c:	41414141 	cmpmi	r1, r1, asr #2
80017b40:	414b4b45 	cmpmi	fp, r5, asr #22
80017b44:	41414141 	cmpmi	r1, r1, asr #2
80017b48:	41444641 	cmpmi	r4, r1, asr #12
80017b4c:	41414141 	cmpmi	r1, r1, asr #2
80017b50:	4141414a 	cmpmi	r1, sl, asr #2
80017b54:	41414141 	cmpmi	r1, r1, asr #2
80017b58:	4141424e 	cmpmi	r1, lr, asr #4
80017b5c:	41414141 	cmpmi	r1, r1, asr #2
80017b60:	41414145 	cmpmi	r1, r5, asr #2
80017b64:	41414141 	cmpmi	r1, r1, asr #2
80017b68:	41414241 	cmpmi	r1, r1, asr #4
80017b6c:	41414141 	cmpmi	r1, r1, asr #2
80017b70:	4141414a 	cmpmi	r1, sl, asr #2
80017b74:	41414141 	cmpmi	r1, r1, asr #2
80017b78:	41414144 	cmpmi	r1, r4, asr #2
80017b7c:	41414141 	cmpmi	r1, r1, asr #2
80017b80:	41414141 	cmpmi	r1, r1, asr #2
80017b84:	41414141 	cmpmi	r1, r1, asr #2
80017b88:	41414141 	cmpmi	r1, r1, asr #2
80017b8c:	41414141 	cmpmi	r1, r1, asr #2
80017b90:	414e5045 	cmpmi	lr, r5, asr #32
80017b94:	41414141 	cmpmi	r1, r1, asr #2
80017b98:	4142434b 	cmpmi	r2, fp, asr #6
80017b9c:	41414141 	cmpmi	r1, r1, asr #2
80017ba0:	41414141 	cmpmi	r1, r1, asr #2
80017ba4:	41414141 	cmpmi	r1, r1, asr #2
80017ba8:	41414141 	cmpmi	r1, r1, asr #2
80017bac:	41414141 	cmpmi	r1, r1, asr #2
80017bb0:	41414142 	cmpmi	r1, r2, asr #2
80017bb4:	41414141 	cmpmi	r1, r1, asr #2
80017bb8:	41414141 	cmpmi	r1, r1, asr #2
80017bbc:	41414141 	cmpmi	r1, r1, asr #2
80017bc0:	41414242 	cmpmi	r1, r2, asr #4
80017bc4:	41414141 	cmpmi	r1, r1, asr #2
80017bc8:	41414144 	cmpmi	r1, r4, asr #2
80017bcc:	41414141 	cmpmi	r1, r1, asr #2
80017bd0:	41414141 	cmpmi	r1, r1, asr #2
80017bd4:	41414141 	cmpmi	r1, r1, asr #2
80017bd8:	41414141 	cmpmi	r1, r1, asr #2
80017bdc:	41414141 	cmpmi	r1, r1, asr #2
80017be0:	4150424f 	cmpmi	r0, pc, asr #4
80017be4:	41414141 	cmpmi	r1, r1, asr #2
80017be8:	4141464c 	cmpmi	r1, ip, asr #12
80017bec:	41414141 	cmpmi	r1, r1, asr #2
80017bf0:	41414141 	cmpmi	r1, r1, asr #2
80017bf4:	41414141 	cmpmi	r1, r1, asr #2
80017bf8:	41414141 	cmpmi	r1, r1, asr #2
80017bfc:	41414141 	cmpmi	r1, r1, asr #2
80017c00:	41414142 	cmpmi	r1, r2, asr #2
80017c04:	41414141 	cmpmi	r1, r1, asr #2
80017c08:	41414141 	cmpmi	r1, r1, asr #2
80017c0c:	41414141 	cmpmi	r1, r1, asr #2
80017c10:	00000000 	andeq	r0, r0, r0
80017c14:	45464850 	strbmi	r4, [r6, #-2128]	@ 0xfffff7b0
80017c18:	4547454d 	strbmi	r4, [r7, #-1357]	@ 0xfffffab3
80017c1c:	41424142 	cmpmi	r2, r2, asr #2
80017c20:	41414142 	cmpmi	r1, r2, asr #2
80017c24:	41414141 	cmpmi	r1, r1, asr #2
80017c28:	41414141 	cmpmi	r1, r1, asr #2
80017c2c:	41414141 	cmpmi	r1, r1, asr #2
80017c30:	41414141 	cmpmi	r1, r1, asr #2
80017c34:	41414143 	cmpmi	r1, r3, asr #2
80017c38:	41414349 	cmpmi	r1, r9, asr #6
80017c3c:	41414142 	cmpmi	r1, r2, asr #2
80017c40:	41414141 	cmpmi	r1, r1, asr #2
80017c44:	41424141 	cmpmi	r2, r1, asr #2
80017c48:	41414141 	cmpmi	r1, r1, asr #2
80017c4c:	41414445 	cmpmi	r1, r5, asr #8
80017c50:	41414141 	cmpmi	r1, r1, asr #2
80017c54:	41504649 	cmpmi	r0, r9, asr #12
80017c58:	41414141 	cmpmi	r1, r1, asr #2
80017c5c:	41434141 	cmpmi	r3, r1, asr #2
80017c60:	41464141 	cmpmi	r6, r1, asr #2
80017c64:	41414445 	cmpmi	r1, r5, asr #8
80017c68:	41414341 	cmpmi	r1, r1, asr #6
80017c6c:	41414143 	cmpmi	r1, r3, asr #2
80017c70:	41414349 	cmpmi	r1, r9, asr #6
80017c74:	4141414c 	cmpmi	r1, ip, asr #2
80017c78:	4141414b 	cmpmi	r1, fp, asr #2
80017c7c:	41414142 	cmpmi	r1, r2, asr #2
80017c80:	41414141 	cmpmi	r1, r1, asr #2
80017c84:	41414141 	cmpmi	r1, r1, asr #2
80017c88:	41414141 	cmpmi	r1, r1, asr #2
80017c8c:	41414141 	cmpmi	r1, r1, asr #2
80017c90:	41414141 	cmpmi	r1, r1, asr #2
80017c94:	41414141 	cmpmi	r1, r1, asr #2
80017c98:	41414141 	cmpmi	r1, r1, asr #2
80017c9c:	414b424a 	cmpmi	fp, sl, asr #4
80017ca0:	41414141 	cmpmi	r1, r1, asr #2
80017ca4:	414b424a 	cmpmi	fp, sl, asr #4
80017ca8:	41414141 	cmpmi	r1, r1, asr #2
80017cac:	41414146 	cmpmi	r1, r6, asr #2
80017cb0:	41414141 	cmpmi	r1, r1, asr #2
80017cb4:	42414141 	submi	r4, r1, #1073741840	@ 0x40000010
80017cb8:	41414141 	cmpmi	r1, r1, asr #2
80017cbc:	41414142 	cmpmi	r1, r2, asr #2
80017cc0:	41414141 	cmpmi	r1, r1, asr #2
80017cc4:	414b424d 	cmpmi	fp, sp, asr #4
80017cc8:	41414141 	cmpmi	r1, r1, asr #2
80017ccc:	424b424d 	submi	r4, fp, #-805306364	@ 0xd0000004
80017cd0:	41414141 	cmpmi	r1, r1, asr #2
80017cd4:	424b424d 	submi	r4, fp, #-805306364	@ 0xd0000004
80017cd8:	41414141 	cmpmi	r1, r1, asr #2
80017cdc:	41414241 	cmpmi	r1, r1, asr #4
80017ce0:	41414141 	cmpmi	r1, r1, asr #2
80017ce4:	41414241 	cmpmi	r1, r1, asr #4
80017ce8:	41414141 	cmpmi	r1, r1, asr #2
80017cec:	41414147 	cmpmi	r1, r7, asr #2
80017cf0:	41414141 	cmpmi	r1, r1, asr #2
80017cf4:	42414141 	submi	r4, r1, #1073741840	@ 0x40000010
80017cf8:	41414141 	cmpmi	r1, r1, asr #2
80017cfc:	41414141 	cmpmi	r1, r1, asr #2
80017d00:	41414141 	cmpmi	r1, r1, asr #2
80017d04:	41414141 	cmpmi	r1, r1, asr #2
80017d08:	41414141 	cmpmi	r1, r1, asr #2
80017d0c:	41414141 	cmpmi	r1, r1, asr #2
80017d10:	41414141 	cmpmi	r1, r1, asr #2
80017d14:	41414141 	cmpmi	r1, r1, asr #2
80017d18:	41414141 	cmpmi	r1, r1, asr #2
80017d1c:	41414141 	cmpmi	r1, r1, asr #2
80017d20:	41414141 	cmpmi	r1, r1, asr #2
80017d24:	41414141 	cmpmi	r1, r1, asr #2
80017d28:	41414141 	cmpmi	r1, r1, asr #2
80017d2c:	41414141 	cmpmi	r1, r1, asr #2
80017d30:	41414141 	cmpmi	r1, r1, asr #2
80017d34:	41414141 	cmpmi	r1, r1, asr #2
80017d38:	41414141 	cmpmi	r1, r1, asr #2
80017d3c:	41414141 	cmpmi	r1, r1, asr #2
80017d40:	41414141 	cmpmi	r1, r1, asr #2
80017d44:	41414141 	cmpmi	r1, r1, asr #2
80017d48:	41414141 	cmpmi	r1, r1, asr #2
80017d4c:	41414141 	cmpmi	r1, r1, asr #2
80017d50:	41414141 	cmpmi	r1, r1, asr #2
80017d54:	41414141 	cmpmi	r1, r1, asr #2
80017d58:	41414141 	cmpmi	r1, r1, asr #2
80017d5c:	41414141 	cmpmi	r1, r1, asr #2
80017d60:	41414141 	cmpmi	r1, r1, asr #2
80017d64:	41414141 	cmpmi	r1, r1, asr #2
80017d68:	41414141 	cmpmi	r1, r1, asr #2
80017d6c:	41414141 	cmpmi	r1, r1, asr #2
80017d70:	41414141 	cmpmi	r1, r1, asr #2
80017d74:	41414141 	cmpmi	r1, r1, asr #2
80017d78:	41414141 	cmpmi	r1, r1, asr #2
80017d7c:	41414141 	cmpmi	r1, r1, asr #2
80017d80:	41414141 	cmpmi	r1, r1, asr #2
80017d84:	41414141 	cmpmi	r1, r1, asr #2
80017d88:	41414141 	cmpmi	r1, r1, asr #2
80017d8c:	41414141 	cmpmi	r1, r1, asr #2
80017d90:	41414141 	cmpmi	r1, r1, asr #2
80017d94:	41414141 	cmpmi	r1, r1, asr #2
80017d98:	41414141 	cmpmi	r1, r1, asr #2
80017d9c:	41414141 	cmpmi	r1, r1, asr #2
80017da0:	41414141 	cmpmi	r1, r1, asr #2
80017da4:	41414141 	cmpmi	r1, r1, asr #2
80017da8:	41414141 	cmpmi	r1, r1, asr #2
80017dac:	41414141 	cmpmi	r1, r1, asr #2
80017db0:	41414141 	cmpmi	r1, r1, asr #2
80017db4:	41414141 	cmpmi	r1, r1, asr #2
80017db8:	41414141 	cmpmi	r1, r1, asr #2
80017dbc:	41414141 	cmpmi	r1, r1, asr #2
80017dc0:	41414141 	cmpmi	r1, r1, asr #2
80017dc4:	41414141 	cmpmi	r1, r1, asr #2
80017dc8:	41414141 	cmpmi	r1, r1, asr #2
80017dcc:	41414141 	cmpmi	r1, r1, asr #2
80017dd0:	41414141 	cmpmi	r1, r1, asr #2
80017dd4:	41414141 	cmpmi	r1, r1, asr #2
80017dd8:	41414141 	cmpmi	r1, r1, asr #2
80017ddc:	41414141 	cmpmi	r1, r1, asr #2
80017de0:	41414141 	cmpmi	r1, r1, asr #2
80017de4:	41414141 	cmpmi	r1, r1, asr #2
80017de8:	41414141 	cmpmi	r1, r1, asr #2
80017dec:	41414141 	cmpmi	r1, r1, asr #2
80017df0:	41414141 	cmpmi	r1, r1, asr #2
80017df4:	41414141 	cmpmi	r1, r1, asr #2
80017df8:	41414141 	cmpmi	r1, r1, asr #2
80017dfc:	41414141 	cmpmi	r1, r1, asr #2
80017e00:	41414141 	cmpmi	r1, r1, asr #2
80017e04:	41414141 	cmpmi	r1, r1, asr #2
80017e08:	41414141 	cmpmi	r1, r1, asr #2
80017e0c:	41414141 	cmpmi	r1, r1, asr #2
80017e10:	41414141 	cmpmi	r1, r1, asr #2
80017e14:	4d41414e 	stclmi	1, cr4, [r1, #-312]	@ 0xfffffec8
80017e18:	4f424b41 	svcmi	0x00424b41
80017e1c:	4e494241 	cdpmi	2, 4, cr4, cr9, cr1, {2}
80017e20:	4f4a434e 	svcmi	0x004a434e
80017e24:	4c414145 	mcrrmi	1, 4, r4, r1, cr5
80017e28:	4f43454d 	svcmi	0x0043454d
80017e2c:	4e41414d 	cdpmi	1, 4, cr4, cr1, cr13, {2}
80017e30:	4f43454e 	svcmi	0x0043454e
80017e34:	4541464d 	strbmi	r4, [r1, #-1613]	@ 0xfffff9b3
80017e38:	4f464a50 	svcmi	0x00464a50
80017e3c:	45414145 	strbmi	r4, [r1, #-325]	@ 0xfffffebb
80017e40:	4f414950 	svcmi	0x00414950
80017e44:	44414141 	strbmi	r4, [r1], #-321	@ 0xfffffebf
80017e48:	4f444b41 	svcmi	0x00444b41
80017e4c:	44414249 	strbmi	r4, [r1], #-585	@ 0xfffffdb7
80017e50:	4f46414c 	svcmi	0x0046414c
80017e54:	4141474b 	cmpmi	r1, fp, asr #14
80017e58:	4f4c4141 	svcmi	0x004c4141
80017e5c:	44414141 	strbmi	r4, [r1], #-321	@ 0xfffffebf
80017e60:	4f444b41 	svcmi	0x00444b41
80017e64:	44414249 	strbmi	r4, [r1], #-585	@ 0xfffffdb7
80017e68:	4f46414c 	svcmi	0x0046414c
80017e6c:	4141414b 	cmpmi	r1, fp, asr #2
80017e70:	4f4b4141 	svcmi	0x004b4141
80017e74:	4141464f 	cmpmi	r1, pc, asr #12
80017e78:	4f4c4141 	svcmi	0x004c4141
80017e7c:	44414141 	strbmi	r4, [r1], #-321	@ 0xfffffebf
80017e80:	4f424b41 	svcmi	0x00424b41
80017e84:	43414249 	movtmi	r4, #4681	@ 0x1249
80017e88:	4f46424c 	svcmi	0x0046424c
80017e8c:	42414445 	submi	r4, r1, #1157627904	@ 0x45000000
80017e90:	4f464a50 	svcmi	0x00464a50
80017e94:	42414142 	submi	r4, r1, #-2147483632	@ 0x80000010
80017e98:	4f414950 	svcmi	0x00414950
80017e9c:	41414441 	cmpmi	r1, r1, asr #8
80017ea0:	4f464a50 	svcmi	0x00464a50
80017ea4:	41414141 	cmpmi	r1, r1, asr #2
80017ea8:	4f484a45 	svcmi	0x00484a45
80017eac:	41414945 	cmpmi	r1, r5, asr #18
80017eb0:	4f4c4141 	svcmi	0x004c4141
80017eb4:	44414249 	strbmi	r4, [r1], #-585	@ 0xfffffdb7
80017eb8:	4f46424c 	svcmi	0x0046424c
80017ebc:	44414142 	strbmi	r4, [r1], #-322	@ 0xfffffebe
80017ec0:	4f434944 	svcmi	0x00434944
80017ec4:	44414249 	strbmi	r4, [r1], #-585	@ 0xfffffdb7
80017ec8:	4f46414c 	svcmi	0x0046414c
80017ecc:	44414249 	strbmi	r4, [r1], #-585	@ 0xfffffdb7
80017ed0:	4f46424c 	svcmi	0x0046424c
80017ed4:	43414249 	movtmi	r4, #4681	@ 0x1249
80017ed8:	4f464a50 	svcmi	0x00464a50
80017edc:	41414143 	cmpmi	r1, r3, asr #2
80017ee0:	4f424644 	svcmi	0x00424644
80017ee4:	50505041 	subspl	r5, r0, r1, asr #32
80017ee8:	4e4b5050 	mcrmi	0, 2, r5, cr11, cr0, {2}
80017eec:	41414141 	cmpmi	r1, r1, asr #2
80017ef0:	4f444b41 	svcmi	0x00444b41
80017ef4:	41414544 	cmpmi	r1, r4, asr #10
80017ef8:	4f4c4141 	svcmi	0x004c4141
80017efc:	424a4141 	submi	r4, sl, #1073741840	@ 0x40000010
80017f00:	41414141 	cmpmi	r1, r1, asr #2
80017f04:	41494641 	cmpmi	r9, r1, asr #12
80017f08:	41414141 	cmpmi	r1, r1, asr #2
80017f0c:	4141414d 	cmpmi	r1, sp, asr #2
80017f10:	41414141 	cmpmi	r1, r1, asr #2
80017f14:	4d444550 	stclmi	5, cr4, [r4, #-320]	@ 0xfffffec0
80017f18:	41414141 	cmpmi	r1, r1, asr #2
80017f1c:	4d41414e 	stclmi	1, cr4, [r1, #-312]	@ 0xfffffec8
80017f20:	4f424b41 	svcmi	0x00424b41
80017f24:	4e494141 	cdpmi	1, 4, cr4, cr9, cr1, {2}
80017f28:	4f4a434e 	svcmi	0x004a434e
80017f2c:	4c414145 	mcrrmi	1, 4, r4, r1, cr5
80017f30:	4f43454d 	svcmi	0x0043454d
80017f34:	4e414241 	cdpmi	2, 4, cr4, cr1, cr1, {2}
80017f38:	4f43454e 	svcmi	0x0043454e
80017f3c:	44414141 	strbmi	r4, [r1], #-321	@ 0xfffffebf
80017f40:	4f424b41 	svcmi	0x00424b41
80017f44:	44414246 	strbmi	r4, [r1], #-582	@ 0xfffffdba
80017f48:	4f46454c 	svcmi	0x0046454c
80017f4c:	41414246 	cmpmi	r1, r6, asr #4
80017f50:	4f46424c 	svcmi	0x0046424c
80017f54:	41414141 	cmpmi	r1, r1, asr #2
80017f58:	4f504141 	svcmi	0x00504141
80017f5c:	41414241 	cmpmi	r1, r1, asr #4
80017f60:	4f46414c 	svcmi	0x0046414c
80017f64:	44414241 	strbmi	r4, [r1], #-577	@ 0xfffffdbf
80017f68:	4f46424c 	svcmi	0x0046424c
80017f6c:	41414144 	cmpmi	r1, r4, asr #2
80017f70:	4f424b41 	svcmi	0x00424b41
80017f74:	4e41414d 	cdpmi	1, 4, cr4, cr1, cr13, {2}
80017f78:	4f43454c 	svcmi	0x0043454c
80017f7c:	4b494141 	blmi	81268488 <irq_stack_start+0x120e478>
80017f80:	4f494a4e 	svcmi	0x00494a4e
80017f84:	4d41414e 	stclmi	1, cr4, [r1, #-312]	@ 0xfffffec8
80017f88:	4f424b41 	svcmi	0x00424b41
80017f8c:	4e494141 	cdpmi	1, 4, cr4, cr9, cr1, {2}
80017f90:	4f4a434e 	svcmi	0x004a434e
80017f94:	4c414145 	mcrrmi	1, 4, r4, r1, cr5
80017f98:	4f43454d 	svcmi	0x0043454d
80017f9c:	4e414241 	cdpmi	2, 4, cr4, cr1, cr1, {2}
80017fa0:	4f43454e 	svcmi	0x0043454e
80017fa4:	44414141 	strbmi	r4, [r1], #-321	@ 0xfffffebf
80017fa8:	4f424b41 	svcmi	0x00424b41
80017fac:	4241424d 	submi	r4, r1, #-805306364	@ 0xd0000004
80017fb0:	4f46414c 	svcmi	0x0046414c
80017fb4:	44414246 	strbmi	r4, [r1], #-582	@ 0xfffffdba
80017fb8:	4f46454c 	svcmi	0x0046454c
80017fbc:	41414246 	cmpmi	r1, r6, asr #4
80017fc0:	4f46424c 	svcmi	0x0046424c
80017fc4:	4241424d 	submi	r4, r1, #-805306364	@ 0xd0000004
80017fc8:	4f46424c 	svcmi	0x0046424c
80017fcc:	41414141 	cmpmi	r1, r1, asr #2
80017fd0:	4f504141 	svcmi	0x00504141
80017fd4:	41414241 	cmpmi	r1, r1, asr #4
80017fd8:	4f46414c 	svcmi	0x0046414c
80017fdc:	44414241 	strbmi	r4, [r1], #-577	@ 0xfffffdbf
80017fe0:	4f46424c 	svcmi	0x0046424c
80017fe4:	41414144 	cmpmi	r1, r4, asr #2
80017fe8:	4f424b41 	svcmi	0x00424b41
80017fec:	4e41414d 	cdpmi	1, 4, cr4, cr1, cr13, {2}
80017ff0:	4f43454c 	svcmi	0x0043454c
80017ff4:	4b494141 	blmi	81268500 <irq_stack_start+0x120e4f0>
80017ff8:	4f494a4e 	svcmi	0x00494a4e
80017ffc:	4d41414e 	stclmi	1, cr4, [r1, #-312]	@ 0xfffffec8
80018000:	4f424b41 	svcmi	0x00424b41
80018004:	4e494141 	cdpmi	1, 4, cr4, cr9, cr1, {2}
80018008:	4f4a434e 	svcmi	0x004a434e
8001800c:	4c414145 	mcrrmi	1, 4, r4, r1, cr5
80018010:	4f43454d 	svcmi	0x0043454d
80018014:	4e414249 	cdpmi	2, 4, cr4, cr1, cr9, {2}
80018018:	4f43454e 	svcmi	0x0043454e
8001801c:	44414141 	strbmi	r4, [r1], #-321	@ 0xfffffebf
80018020:	4f424b41 	svcmi	0x00424b41
80018024:	4241424d 	submi	r4, r1, #-805306364	@ 0xd0000004
80018028:	4f46414c 	svcmi	0x0046414c
8001802c:	43414341 	movtmi	r4, #4929	@ 0x1341
80018030:	4f46414c 	svcmi	0x0046414c
80018034:	44414246 	strbmi	r4, [r1], #-582	@ 0xfffffdba
80018038:	4f46454c 	svcmi	0x0046454c
8001803c:	41414246 	cmpmi	r1, r6, asr #4
80018040:	4f46424c 	svcmi	0x0046424c
80018044:	4241424d 	submi	r4, r1, #-805306364	@ 0xd0000004
80018048:	4f46424c 	svcmi	0x0046424c
8001804c:	43414341 	movtmi	r4, #4929	@ 0x1341
80018050:	4f46424c 	svcmi	0x0046424c
80018054:	41414141 	cmpmi	r1, r1, asr #2
80018058:	4f504141 	svcmi	0x00504141
8001805c:	41414241 	cmpmi	r1, r1, asr #4
80018060:	4f46414c 	svcmi	0x0046414c
80018064:	44414241 	strbmi	r4, [r1], #-577	@ 0xfffffdbf
80018068:	4f46424c 	svcmi	0x0046424c
8001806c:	41414144 	cmpmi	r1, r4, asr #2
80018070:	4f424b41 	svcmi	0x00424b41
80018074:	4e41414d 	cdpmi	1, 4, cr4, cr1, cr13, {2}
80018078:	4f43454c 	svcmi	0x0043454c
8001807c:	4b494141 	blmi	81268588 <irq_stack_start+0x120e578>
80018080:	4f494a4e 	svcmi	0x00494a4e
80018084:	4d41414e 	stclmi	1, cr4, [r1, #-312]	@ 0xfffffec8
80018088:	4f424b41 	svcmi	0x00424b41
8001808c:	4e494141 	cdpmi	1, 4, cr4, cr9, cr1, {2}
80018090:	4f4a434e 	svcmi	0x004a434e
80018094:	4c414145 	mcrrmi	1, 4, r4, r1, cr5
80018098:	4f43454d 	svcmi	0x0043454d
8001809c:	4e414149 	cdpmi	1, 4, cr4, cr1, cr9, {2}
800180a0:	4f43454e 	svcmi	0x0043454e
800180a4:	41414241 	cmpmi	r1, r1, asr #4
800180a8:	4f46414c 	svcmi	0x0046414c
800180ac:	42414241 	submi	r4, r1, #268435460	@ 0x10000004
800180b0:	4f46424c 	svcmi	0x0046424c
800180b4:	41414141 	cmpmi	r1, r1, asr #2
800180b8:	4f444b41 	svcmi	0x00444b41
800180bc:	50504e48 	subspl	r4, r0, r8, asr #28
800180c0:	4f4c5050 	svcmi	0x004c5050
800180c4:	50414141 	subpl	r4, r1, r1, asr #2
800180c8:	4f444341 	svcmi	0x00444341
800180cc:	4e41414d 	cdpmi	1, 4, cr4, cr1, cr13, {2}
800180d0:	4f43454c 	svcmi	0x0043454c
800180d4:	4b494141 	blmi	812685e0 <irq_stack_start+0x120e5d0>
800180d8:	4f494a4e 	svcmi	0x00494a4e
800180dc:	4d41414e 	stclmi	1, cr4, [r1, #-312]	@ 0xfffffec8
800180e0:	4f424b41 	svcmi	0x00424b41
800180e4:	4e494141 	cdpmi	1, 4, cr4, cr9, cr1, {2}
800180e8:	4f4a434e 	svcmi	0x004a434e
800180ec:	4c414145 	mcrrmi	1, 4, r4, r1, cr5
800180f0:	4f43454d 	svcmi	0x0043454d
800180f4:	41414142 	cmpmi	r1, r2, asr #2
800180f8:	4f444b41 	svcmi	0x00444b41
800180fc:	50504d43 	subspl	r4, r0, r3, asr #26
80018100:	4f4c5050 	svcmi	0x004c5050
80018104:	44414141 	strbmi	r4, [r1], #-321	@ 0xfffffebf
80018108:	4f424b41 	svcmi	0x00424b41
8001810c:	41414144 	cmpmi	r1, r4, asr #2
80018110:	4f424b41 	svcmi	0x00424b41
80018114:	4b494141 	blmi	81268620 <irq_stack_start+0x120e610>
80018118:	4f494a4e 	svcmi	0x00494a4e
8001811c:	4d41414e 	stclmi	1, cr4, [r1, #-312]	@ 0xfffffec8
80018120:	4f424b41 	svcmi	0x00424b41
80018124:	4e494141 	cdpmi	1, 4, cr4, cr9, cr1, {2}
80018128:	4f4a434e 	svcmi	0x004a434e
8001812c:	4c414145 	mcrrmi	1, 4, r4, r1, cr5
80018130:	4f43454d 	svcmi	0x0043454d
80018134:	4e414149 	cdpmi	1, 4, cr4, cr1, cr9, {2}
80018138:	4f43454e 	svcmi	0x0043454e
8001813c:	41414241 	cmpmi	r1, r1, asr #4
80018140:	4f46414c 	svcmi	0x0046414c
80018144:	42414241 	submi	r4, r1, #268435460	@ 0x10000004
80018148:	4f46424c 	svcmi	0x0046424c
8001814c:	41414143 	cmpmi	r1, r3, asr #2
80018150:	4f444b41 	svcmi	0x00444b41
80018154:	50504d45 	subspl	r4, r0, r5, asr #26
80018158:	4f4c5050 	svcmi	0x004c5050
8001815c:	50414141 	subpl	r4, r1, r1, asr #2
80018160:	4f444341 	svcmi	0x00444341
80018164:	4e41414d 	cdpmi	1, 4, cr4, cr1, cr13, {2}
80018168:	4f43454c 	svcmi	0x0043454c
8001816c:	4b494141 	blmi	81268678 <irq_stack_start+0x120e668>
80018170:	4f494a4e 	svcmi	0x00494a4e
80018174:	4d41414e 	stclmi	1, cr4, [r1, #-312]	@ 0xfffffec8
80018178:	4f424b41 	svcmi	0x00424b41
8001817c:	4e494141 	cdpmi	1, 4, cr4, cr9, cr1, {2}
80018180:	4f4a434e 	svcmi	0x004a434e
80018184:	4c414145 	mcrrmi	1, 4, r4, r1, cr5
80018188:	4f43454d 	svcmi	0x0043454d
8001818c:	41414144 	cmpmi	r1, r4, asr #2
80018190:	4f444b41 	svcmi	0x00444b41
80018194:	50504b50 	subspl	r4, r0, r0, asr fp
80018198:	4f4c5050 	svcmi	0x004c5050
8001819c:	44414141 	strbmi	r4, [r1], #-321	@ 0xfffffebf
800181a0:	4f424b41 	svcmi	0x00424b41
800181a4:	41414144 	cmpmi	r1, r4, asr #2
800181a8:	4f424b41 	svcmi	0x00424b41
800181ac:	4b494141 	blmi	812686b8 <irq_stack_start+0x120e6a8>
800181b0:	4f494a4e 	svcmi	0x00494a4e
800181b4:	4d41414e 	stclmi	1, cr4, [r1, #-312]	@ 0xfffffec8
800181b8:	4f424b41 	svcmi	0x00424b41
800181bc:	4e494141 	cdpmi	1, 4, cr4, cr9, cr1, {2}
800181c0:	4f4a434e 	svcmi	0x004a434e
800181c4:	4c414145 	mcrrmi	1, 4, r4, r1, cr5
800181c8:	4f43454d 	svcmi	0x0043454d
800181cc:	41414145 	cmpmi	r1, r5, asr #2
800181d0:	4f444b41 	svcmi	0x00444b41
800181d4:	50504b48 	subspl	r4, r0, r8, asr #22
800181d8:	4f4c5050 	svcmi	0x004c5050
800181dc:	44414141 	strbmi	r4, [r1], #-321	@ 0xfffffebf
800181e0:	4f424b41 	svcmi	0x00424b41
800181e4:	41414144 	cmpmi	r1, r4, asr #2
800181e8:	4f424b41 	svcmi	0x00424b41
800181ec:	4b494141 	blmi	812686f8 <irq_stack_start+0x120e6e8>
800181f0:	4f494a4e 	svcmi	0x00494a4e
800181f4:	4d41414e 	stclmi	1, cr4, [r1, #-312]	@ 0xfffffec8
800181f8:	4f424b41 	svcmi	0x00424b41
800181fc:	4e494141 	cdpmi	1, 4, cr4, cr9, cr1, {2}
80018200:	4f4a434e 	svcmi	0x004a434e
80018204:	4c414145 	mcrrmi	1, 4, r4, r1, cr5
80018208:	4f43454d 	svcmi	0x0043454d
8001820c:	4e414149 	cdpmi	1, 4, cr4, cr1, cr9, {2}
80018210:	4f43454e 	svcmi	0x0043454e
80018214:	41414241 	cmpmi	r1, r1, asr #4
80018218:	4f46414c 	svcmi	0x0046414c
8001821c:	42414241 	submi	r4, r1, #268435460	@ 0x10000004
80018220:	4f46424c 	svcmi	0x0046424c
80018224:	41414146 	cmpmi	r1, r6, asr #2
80018228:	4f444b41 	svcmi	0x00444b41
8001822c:	50504b4a 	subspl	r4, r0, sl, asr #22
80018230:	4f4c5050 	svcmi	0x004c5050
80018234:	50414141 	subpl	r4, r1, r1, asr #2
80018238:	4f444341 	svcmi	0x00444341
8001823c:	4e41414d 	cdpmi	1, 4, cr4, cr1, cr13, {2}
80018240:	4f43454c 	svcmi	0x0043454c
80018244:	4b494141 	blmi	81268750 <irq_stack_start+0x120e740>
80018248:	4f494a4e 	svcmi	0x00494a4e
8001824c:	4d41414e 	stclmi	1, cr4, [r1, #-312]	@ 0xfffffec8
80018250:	4f424b41 	svcmi	0x00424b41
80018254:	4e494141 	cdpmi	1, 4, cr4, cr9, cr1, {2}
80018258:	4f4a434e 	svcmi	0x004a434e
8001825c:	4c414145 	mcrrmi	1, 4, r4, r1, cr5
80018260:	4f43454d 	svcmi	0x0043454d
80018264:	41414147 	cmpmi	r1, r7, asr #2
80018268:	4f444b41 	svcmi	0x00444b41
8001826c:	50504a45 	subspl	r4, r0, r5, asr #20
80018270:	4f4c5050 	svcmi	0x004c5050
80018274:	50414141 	subpl	r4, r1, r1, asr #2
80018278:	4f444341 	svcmi	0x00444341
8001827c:	4b494141 	blmi	81268788 <irq_stack_start+0x120e778>
80018280:	4f494a4e 	svcmi	0x00494a4e
80018284:	4d41414e 	stclmi	1, cr4, [r1, #-312]	@ 0xfffffec8
80018288:	4f424b41 	svcmi	0x00424b41
8001828c:	4e494141 	cdpmi	1, 4, cr4, cr9, cr1, {2}
80018290:	4f4a434e 	svcmi	0x004a434e
80018294:	4c414145 	mcrrmi	1, 4, r4, r1, cr5
80018298:	4f43454d 	svcmi	0x0043454d
8001829c:	4e414149 	cdpmi	1, 4, cr4, cr1, cr9, {2}
800182a0:	4f43454e 	svcmi	0x0043454e
800182a4:	41414241 	cmpmi	r1, r1, asr #4
800182a8:	4f46414c 	svcmi	0x0046414c
800182ac:	42414241 	submi	r4, r1, #268435460	@ 0x10000004
800182b0:	4f46424c 	svcmi	0x0046424c
800182b4:	41414148 	cmpmi	r1, r8, asr #2
800182b8:	4f444b41 	svcmi	0x00444b41
800182bc:	50504a48 	subspl	r4, r0, r8, asr #20
800182c0:	4f4c5050 	svcmi	0x004c5050
800182c4:	50414141 	subpl	r4, r1, r1, asr #2
800182c8:	4f444341 	svcmi	0x00444341
800182cc:	4e41414d 	cdpmi	1, 4, cr4, cr1, cr13, {2}
800182d0:	4f43454c 	svcmi	0x0043454c
800182d4:	4b494141 	blmi	812687e0 <irq_stack_start+0x120e7d0>
800182d8:	4f494a4e 	svcmi	0x00494a4e
800182dc:	4d41414e 	stclmi	1, cr4, [r1, #-312]	@ 0xfffffec8
800182e0:	4f424b41 	svcmi	0x00424b41
800182e4:	4141414f 	cmpmi	r1, pc, asr #2
800182e8:	4f4a434e 	svcmi	0x004a434e
800182ec:	4e494141 	cdpmi	1, 4, cr4, cr9, cr1, {2}
800182f0:	4f4a434e 	svcmi	0x004a434e
800182f4:	4c414241 	mcrrmi	2, 4, r4, r1, cr1
800182f8:	4f43454d 	svcmi	0x0043454d
800182fc:	4e504548 	cdpmi	5, 5, cr4, cr0, cr8, {2}
80018300:	4f43454e 	svcmi	0x0043454e
80018304:	41424345 	cmpmi	r2, r5, asr #6
80018308:	4f46414c 	svcmi	0x0046414c
8001830c:	44414141 	strbmi	r4, [r1], #-321	@ 0xfffffebf
80018310:	4f444b41 	svcmi	0x00444b41
80018314:	44414249 	strbmi	r4, [r1], #-585	@ 0xfffffdb7
80018318:	4f46414c 	svcmi	0x0046414c
8001831c:	44414141 	strbmi	r4, [r1], #-321	@ 0xfffffebf
80018320:	4f444b41 	svcmi	0x00444b41
80018324:	44414245 	strbmi	r4, [r1], #-581	@ 0xfffffdbb
80018328:	4f46414c 	svcmi	0x0046414c
8001832c:	44414149 	strbmi	r4, [r1], #-329	@ 0xfffffeb7
80018330:	4f43494c 	svcmi	0x0043494c
80018334:	4442424d 	strbmi	r4, [r2], #-589	@ 0xfffffdb3
80018338:	4f46414c 	svcmi	0x0046414c
8001833c:	44504547 	ldrbmi	r4, [r0], #-1351	@ 0xfffffab9
80018340:	4f43454c 	svcmi	0x0043454c
80018344:	4342424d 	movtmi	r4, #8781	@ 0x224d
80018348:	4f46424c 	svcmi	0x0046424c
8001834c:	42414145 	submi	r4, r1, #1073741841	@ 0x40000011
80018350:	4f464a4c 	svcmi	0x00464a4c
80018354:	41414144 	cmpmi	r1, r4, asr #2
80018358:	4f424b41 	svcmi	0x00424b41
8001835c:	41414247 	cmpmi	r1, r7, asr #4
80018360:	4f4c4141 	svcmi	0x004c4141
80018364:	41414249 	cmpmi	r1, r9, asr #4
80018368:	4f46414c 	svcmi	0x0046414c
8001836c:	4141414b 	cmpmi	r1, fp, asr #2
80018370:	4f4b4141 	svcmi	0x004b4141
80018374:	43504547 	cmpmi	r0, #297795584	@ 0x11c00000
80018378:	4f43454c 	svcmi	0x0043454c
8001837c:	44414245 	strbmi	r4, [r1], #-581	@ 0xfffffdbb
80018380:	4f46424c 	svcmi	0x0046424c
80018384:	44414144 	strbmi	r4, [r1], #-324	@ 0xfffffebc
80018388:	4f414943 	svcmi	0x00414943
8001838c:	44414141 	strbmi	r4, [r1], #-321	@ 0xfffffebf
80018390:	4f464e44 	svcmi	0x00464e44
80018394:	43414144 	movtmi	r4, #4420	@ 0x1144
80018398:	4f424b41 	svcmi	0x00424b41
8001839c:	44424345 	strbmi	r4, [r2], #-837	@ 0xfffffcbb
800183a0:	4f46424c 	svcmi	0x0046424c
800183a4:	41414143 	cmpmi	r1, r3, asr #2
800183a8:	4f424b41 	svcmi	0x00424b41
800183ac:	50504444 	subspl	r4, r0, r4, asr #8
800183b0:	4f424350 	svcmi	0x00424350
800183b4:	44414245 	strbmi	r4, [r1], #-581	@ 0xfffffdbb
800183b8:	4f46424c 	svcmi	0x0046424c
800183bc:	44414142 	strbmi	r4, [r1], #-322	@ 0xfffffebe
800183c0:	4f434944 	svcmi	0x00434944
800183c4:	44414245 	strbmi	r4, [r1], #-581	@ 0xfffffdbb
800183c8:	4f46414c 	svcmi	0x0046414c
800183cc:	43504547 	cmpmi	r0, #297795584	@ 0x11c00000
800183d0:	4f43454c 	svcmi	0x0043454c
800183d4:	44414245 	strbmi	r4, [r1], #-581	@ 0xfffffdbb
800183d8:	4f46424c 	svcmi	0x0046424c
800183dc:	44414144 	strbmi	r4, [r1], #-324	@ 0xfffffebc
800183e0:	4f414943 	svcmi	0x00414943
800183e4:	44414141 	strbmi	r4, [r1], #-321	@ 0xfffffebf
800183e8:	4f464e44 	svcmi	0x00464e44
800183ec:	41414141 	cmpmi	r1, r1, asr #2
800183f0:	4f444644 	svcmi	0x00444644
800183f4:	50504f4f 	subspl	r4, r0, pc, asr #30
800183f8:	424b5050 	submi	r5, fp, #80	@ 0x50
800183fc:	44414249 	strbmi	r4, [r1], #-585	@ 0xfffffdb7
80018400:	4f46424c 	svcmi	0x0046424c
80018404:	41414144 	cmpmi	r1, r4, asr #2
80018408:	4f424b41 	svcmi	0x00424b41
8001840c:	4e41414d 	cdpmi	1, 4, cr4, cr1, cr13, {2}
80018410:	4f43454c 	svcmi	0x0043454c
80018414:	4b494141 	blmi	81268920 <irq_stack_start+0x120e910>
80018418:	4f494a4e 	svcmi	0x00494a4e
8001841c:	4d41414e 	stclmi	1, cr4, [r1, #-312]	@ 0xfffffec8
80018420:	4f424b41 	svcmi	0x00424b41
80018424:	4e494141 	cdpmi	1, 4, cr4, cr9, cr1, {2}
80018428:	4f4a434e 	svcmi	0x004a434e
8001842c:	4c414145 	mcrrmi	1, 4, r4, r1, cr5
80018430:	4f43454d 	svcmi	0x0043454d
80018434:	4e414441 	cdpmi	4, 4, cr4, cr1, cr1, {2}
80018438:	4f43454e 	svcmi	0x0043454e
8001843c:	41414441 	cmpmi	r1, r1, asr #8
80018440:	4f46414c 	svcmi	0x0046414c
80018444:	42414445 	submi	r4, r1, #1157627904	@ 0x45000000
80018448:	4f46414c 	svcmi	0x0046414c
8001844c:	43414449 	movtmi	r4, #5193	@ 0x1449
80018450:	4f46414c 	svcmi	0x0046414c
80018454:	44414141 	strbmi	r4, [r1], #-321	@ 0xfffffebf
80018458:	4f444b41 	svcmi	0x00444b41
8001845c:	44414241 	strbmi	r4, [r1], #-577	@ 0xfffffdbf
80018460:	4f46414c 	svcmi	0x0046414c
80018464:	44414141 	strbmi	r4, [r1], #-321	@ 0xfffffebf
80018468:	4f444b41 	svcmi	0x00444b41
8001846c:	44414245 	strbmi	r4, [r1], #-581	@ 0xfffffdbb
80018470:	4f46414c 	svcmi	0x0046414c
80018474:	41414a47 	cmpmi	r1, r7, asr #20
80018478:	4f4b4141 	svcmi	0x004b4141
8001847c:	44414141 	strbmi	r4, [r1], #-321	@ 0xfffffebf
80018480:	4f444b41 	svcmi	0x00444b41
80018484:	44414246 	strbmi	r4, [r1], #-582	@ 0xfffffdba
80018488:	4f46454c 	svcmi	0x0046454c
8001848c:	4141414e 	cmpmi	r1, lr, asr #2
80018490:	4f4b4141 	svcmi	0x004b4141
80018494:	44414241 	strbmi	r4, [r1], #-577	@ 0xfffffdbf
80018498:	4f46424c 	svcmi	0x0046424c
8001849c:	43414445 	movtmi	r4, #5189	@ 0x1445
800184a0:	4f46424c 	svcmi	0x0046424c
800184a4:	43414144 	movtmi	r4, #4420	@ 0x1144
800184a8:	4f414943 	svcmi	0x00414943
800184ac:	44414245 	strbmi	r4, [r1], #-581	@ 0xfffffdbb
800184b0:	4f46424c 	svcmi	0x0046424c
800184b4:	42414441 	submi	r4, r1, #1090519040	@ 0x41000000
800184b8:	4f46424c 	svcmi	0x0046424c
800184bc:	44414144 	strbmi	r4, [r1], #-324	@ 0xfffffebc
800184c0:	4f414942 	svcmi	0x00414942
800184c4:	43414141 	movtmi	r4, #4417	@ 0x1141
800184c8:	4f464e43 	svcmi	0x00464e43
800184cc:	43414141 	movtmi	r4, #4417	@ 0x1141
800184d0:	4f464d44 	svcmi	0x00464d44
800184d4:	44414245 	strbmi	r4, [r1], #-581	@ 0xfffffdbb
800184d8:	4f46424c 	svcmi	0x0046424c
800184dc:	44414142 	strbmi	r4, [r1], #-322	@ 0xfffffebe
800184e0:	4f434944 	svcmi	0x00434944
800184e4:	44414245 	strbmi	r4, [r1], #-581	@ 0xfffffdbb
800184e8:	4f46414c 	svcmi	0x0046414c
800184ec:	44414241 	strbmi	r4, [r1], #-577	@ 0xfffffdbf
800184f0:	4f46424c 	svcmi	0x0046424c
800184f4:	44414142 	strbmi	r4, [r1], #-322	@ 0xfffffebe
800184f8:	4f434944 	svcmi	0x00434944
800184fc:	44414241 	strbmi	r4, [r1], #-577	@ 0xfffffdbf
80018500:	4f46414c 	svcmi	0x0046414c
80018504:	44414241 	strbmi	r4, [r1], #-577	@ 0xfffffdbf
80018508:	4f46424c 	svcmi	0x0046424c
8001850c:	43414445 	movtmi	r4, #5189	@ 0x1445
80018510:	4f46424c 	svcmi	0x0046424c
80018514:	44414144 	strbmi	r4, [r1], #-324	@ 0xfffffebc
80018518:	4f414943 	svcmi	0x00414943
8001851c:	44414141 	strbmi	r4, [r1], #-321	@ 0xfffffebf
80018520:	4f464e44 	svcmi	0x00464e44
80018524:	41414346 	cmpmi	r1, r6, asr #6
80018528:	4f444644 	svcmi	0x00444644
8001852c:	41414146 	cmpmi	r1, r6, asr #2
80018530:	414b4141 	cmpmi	fp, r1, asr #2
80018534:	44414241 	strbmi	r4, [r1], #-577	@ 0xfffffdbf
80018538:	4f46424c 	svcmi	0x0046424c
8001853c:	43414445 	movtmi	r4, #5189	@ 0x1445
80018540:	4f46424c 	svcmi	0x0046424c
80018544:	44414144 	strbmi	r4, [r1], #-324	@ 0xfffffebc
80018548:	4f414943 	svcmi	0x00414943
8001854c:	44414141 	strbmi	r4, [r1], #-321	@ 0xfffffebf
80018550:	4f464e44 	svcmi	0x00464e44
80018554:	41414141 	cmpmi	r1, r1, asr #2
80018558:	4f444644 	svcmi	0x00444644
8001855c:	50504f46 	subspl	r4, r0, r6, asr #30
80018560:	424b5050 	submi	r5, fp, #80	@ 0x50
80018564:	44414241 	strbmi	r4, [r1], #-577	@ 0xfffffdbf
80018568:	4f46424c 	svcmi	0x0046424c
8001856c:	43414445 	movtmi	r4, #5189	@ 0x1445
80018570:	4f46424c 	svcmi	0x0046424c
80018574:	44414144 	strbmi	r4, [r1], #-324	@ 0xfffffebc
80018578:	4f414943 	svcmi	0x00414943
8001857c:	44414141 	strbmi	r4, [r1], #-321	@ 0xfffffebf
80018580:	4f464e44 	svcmi	0x00464e44
80018584:	41414141 	cmpmi	r1, r1, asr #2
80018588:	4f444644 	svcmi	0x00444644
8001858c:	4141484a 	cmpmi	r1, sl, asr #16
80018590:	414b4141 	cmpmi	fp, r1, asr #2
80018594:	44414241 	strbmi	r4, [r1], #-577	@ 0xfffffdbf
80018598:	4f46424c 	svcmi	0x0046424c
8001859c:	44414142 	strbmi	r4, [r1], #-322	@ 0xfffffebe
800185a0:	4f434944 	svcmi	0x00434944
800185a4:	43414445 	movtmi	r4, #5189	@ 0x1445
800185a8:	4f46424c 	svcmi	0x0046424c
800185ac:	44414144 	strbmi	r4, [r1], #-324	@ 0xfffffebc
800185b0:	4f414943 	svcmi	0x00414943
800185b4:	44414141 	strbmi	r4, [r1], #-321	@ 0xfffffebf
800185b8:	4f464e44 	svcmi	0x00464e44
800185bc:	41414141 	cmpmi	r1, r1, asr #2
800185c0:	4f444644 	svcmi	0x00444644
800185c4:	41414843 	cmpmi	r1, r3, asr #16
800185c8:	414b4141 	cmpmi	fp, r1, asr #2
800185cc:	44414241 	strbmi	r4, [r1], #-577	@ 0xfffffdbf
800185d0:	4f46424c 	svcmi	0x0046424c
800185d4:	44414142 	strbmi	r4, [r1], #-322	@ 0xfffffebe
800185d8:	4f434944 	svcmi	0x00434944
800185dc:	43414445 	movtmi	r4, #5189	@ 0x1445
800185e0:	4f46424c 	svcmi	0x0046424c
800185e4:	44414144 	strbmi	r4, [r1], #-324	@ 0xfffffebc
800185e8:	4f414943 	svcmi	0x00414943
800185ec:	44414141 	strbmi	r4, [r1], #-321	@ 0xfffffebf
800185f0:	4f464e44 	svcmi	0x00464e44
800185f4:	44414246 	strbmi	r4, [r1], #-582	@ 0xfffffdba
800185f8:	4f46454c 	svcmi	0x0046454c
800185fc:	44414246 	strbmi	r4, [r1], #-582	@ 0xfffffdba
80018600:	4f46464c 	svcmi	0x0046464c
80018604:	44414744 	strbmi	r4, [r1], #-1860	@ 0xfffff8bc
80018608:	4f434544 	svcmi	0x00434544
8001860c:	43424d49 	movtmi	r4, #11593	@ 0x2d49
80018610:	4f464a50 	svcmi	0x00464a50
80018614:	43414143 	movtmi	r4, #4419	@ 0x1143
80018618:	4f414950 	svcmi	0x00414950
8001861c:	41414246 	cmpmi	r1, r6, asr #4
80018620:	4f444644 	svcmi	0x00444644
80018624:	4141464e 	cmpmi	r1, lr, asr #12
80018628:	494b4141 	stmdbmi	fp, {r0, r6, r8, lr}^
8001862c:	44424144 	strbmi	r4, [r2], #-324	@ 0xfffffebc
80018630:	4f484a43 	svcmi	0x00484a43
80018634:	50414144 	subpl	r4, r1, r4, asr #2
80018638:	4f414950 	svcmi	0x00414950
8001863c:	50414141 	subpl	r4, r1, r1, asr #2
80018640:	4f444341 	svcmi	0x00444341
80018644:	44414449 	strbmi	r4, [r1], #-1097	@ 0xfffffbb7
80018648:	4f46424c 	svcmi	0x0046424c
8001864c:	43414145 	movtmi	r4, #4421	@ 0x1145
80018650:	4f434944 	svcmi	0x00434944
80018654:	43414449 	movtmi	r4, #5193	@ 0x1449
80018658:	4f46414c 	svcmi	0x0046414c
8001865c:	44414141 	strbmi	r4, [r1], #-321	@ 0xfffffebf
80018660:	4f464a44 	svcmi	0x00464a44
80018664:	44414345 	strbmi	r4, [r1], #-837	@ 0xfffffcbb
80018668:	4f46414c 	svcmi	0x0046414c
8001866c:	44414245 	strbmi	r4, [r1], #-581	@ 0xfffffdbb
80018670:	4f46424c 	svcmi	0x0046424c
80018674:	43414441 	movtmi	r4, #5185	@ 0x1441
80018678:	4f46424c 	svcmi	0x0046424c
8001867c:	44414144 	strbmi	r4, [r1], #-324	@ 0xfffffebc
80018680:	4f414943 	svcmi	0x00414943
80018684:	42414345 	submi	r4, r1, #335544321	@ 0x14000001
80018688:	4f46424c 	svcmi	0x0046424c
8001868c:	41414144 	cmpmi	r1, r4, asr #2
80018690:	4f424b41 	svcmi	0x00424b41
80018694:	41414744 	cmpmi	r1, r4, asr #14
80018698:	4f4c4141 	svcmi	0x004c4141
8001869c:	43414141 	movtmi	r4, #4417	@ 0x1141
800186a0:	4f424b41 	svcmi	0x00424b41
800186a4:	44414245 	strbmi	r4, [r1], #-581	@ 0xfffffdbb
800186a8:	4f46424c 	svcmi	0x0046424c
800186ac:	44414143 	strbmi	r4, [r1], #-323	@ 0xfffffebd
800186b0:	4f414944 	svcmi	0x00414944
800186b4:	44414245 	strbmi	r4, [r1], #-581	@ 0xfffffdbb
800186b8:	4f46414c 	svcmi	0x0046414c
800186bc:	4141454b 	cmpmi	r1, fp, asr #10
800186c0:	4f4b4141 	svcmi	0x004b4141
800186c4:	44414449 	strbmi	r4, [r1], #-1097	@ 0xfffffbb7
800186c8:	4f46424c 	svcmi	0x0046424c
800186cc:	43414145 	movtmi	r4, #4421	@ 0x1145
800186d0:	4f434944 	svcmi	0x00434944
800186d4:	43414449 	movtmi	r4, #5193	@ 0x1449
800186d8:	4f46414c 	svcmi	0x0046414c
800186dc:	42414141 	submi	r4, r1, #1073741840	@ 0x40000010
800186e0:	4f464a44 	svcmi	0x00464a44
800186e4:	44414245 	strbmi	r4, [r1], #-581	@ 0xfffffdbb
800186e8:	4f46424c 	svcmi	0x0046424c
800186ec:	43414441 	movtmi	r4, #5185	@ 0x1441
800186f0:	4f46424c 	svcmi	0x0046424c
800186f4:	44414144 	strbmi	r4, [r1], #-324	@ 0xfffffebc
800186f8:	4f414943 	svcmi	0x00414943
800186fc:	43414842 	movtmi	r4, #6210	@ 0x1842
80018700:	4f474f50 	svcmi	0x00474f50
80018704:	43414141 	movtmi	r4, #4417	@ 0x1141
80018708:	4f464d44 	svcmi	0x00464d44
8001870c:	44414245 	strbmi	r4, [r1], #-581	@ 0xfffffdbb
80018710:	4f46424c 	svcmi	0x0046424c
80018714:	44414142 	strbmi	r4, [r1], #-322	@ 0xfffffebe
80018718:	4f434944 	svcmi	0x00434944
8001871c:	44414245 	strbmi	r4, [r1], #-581	@ 0xfffffdbb
80018720:	4f46414c 	svcmi	0x0046414c
80018724:	4141444e 	cmpmi	r1, lr, asr #8
80018728:	4f4b4141 	svcmi	0x004b4141
8001872c:	44414449 	strbmi	r4, [r1], #-1097	@ 0xfffffbb7
80018730:	4f46424c 	svcmi	0x0046424c
80018734:	43414145 	movtmi	r4, #4421	@ 0x1145
80018738:	4f434944 	svcmi	0x00434944
8001873c:	43414449 	movtmi	r4, #5193	@ 0x1449
80018740:	4f46414c 	svcmi	0x0046414c
80018744:	44414141 	strbmi	r4, [r1], #-321	@ 0xfffffebf
80018748:	4f464a44 	svcmi	0x00464a44
8001874c:	44414349 	strbmi	r4, [r1], #-841	@ 0xfffffcb7
80018750:	4f46414c 	svcmi	0x0046414c
80018754:	44414245 	strbmi	r4, [r1], #-581	@ 0xfffffdbb
80018758:	4f46424c 	svcmi	0x0046424c
8001875c:	43414441 	movtmi	r4, #5185	@ 0x1441
80018760:	4f46424c 	svcmi	0x0046424c
80018764:	44414144 	strbmi	r4, [r1], #-324	@ 0xfffffebc
80018768:	4f414943 	svcmi	0x00414943
8001876c:	42414349 	submi	r4, r1, #603979777	@ 0x24000001
80018770:	4f46424c 	svcmi	0x0046424c
80018774:	41414144 	cmpmi	r1, r4, asr #2
80018778:	4f424b41 	svcmi	0x00424b41
8001877c:	4141474a 	cmpmi	r1, sl, asr #14
80018780:	4f4c4141 	svcmi	0x004c4141
80018784:	43414141 	movtmi	r4, #4417	@ 0x1141
80018788:	4f424b41 	svcmi	0x00424b41
8001878c:	44414245 	strbmi	r4, [r1], #-581	@ 0xfffffdbb
80018790:	4f46424c 	svcmi	0x0046424c
80018794:	44414143 	strbmi	r4, [r1], #-323	@ 0xfffffebd
80018798:	4f414944 	svcmi	0x00414944
8001879c:	44414245 	strbmi	r4, [r1], #-581	@ 0xfffffdbb
800187a0:	4f46414c 	svcmi	0x0046414c
800187a4:	4141434e 	cmpmi	r1, lr, asr #6
800187a8:	4f4b4141 	svcmi	0x004b4141
800187ac:	44414449 	strbmi	r4, [r1], #-1097	@ 0xfffffbb7
800187b0:	4f46424c 	svcmi	0x0046424c
800187b4:	43414145 	movtmi	r4, #4421	@ 0x1145
800187b8:	4f434944 	svcmi	0x00434944
800187bc:	43414449 	movtmi	r4, #5193	@ 0x1449
800187c0:	4f46414c 	svcmi	0x0046414c
800187c4:	44414141 	strbmi	r4, [r1], #-321	@ 0xfffffebf
800187c8:	4f464a44 	svcmi	0x00464a44
800187cc:	44414341 	strbmi	r4, [r1], #-833	@ 0xfffffcbf
800187d0:	4f46414c 	svcmi	0x0046414c
800187d4:	44414245 	strbmi	r4, [r1], #-581	@ 0xfffffdbb
800187d8:	4f46424c 	svcmi	0x0046424c
800187dc:	43414441 	movtmi	r4, #5185	@ 0x1441
800187e0:	4f46424c 	svcmi	0x0046424c
800187e4:	44414144 	strbmi	r4, [r1], #-324	@ 0xfffffebc
800187e8:	4f414943 	svcmi	0x00414943
800187ec:	4341414b 	movtmi	r4, #4427	@ 0x114b
800187f0:	4f444b41 	svcmi	0x00444b41
800187f4:	42414341 	submi	r4, r1, #67108865	@ 0x4000001
800187f8:	4f46424c 	svcmi	0x0046424c
800187fc:	41414144 	cmpmi	r1, r4, asr #2
80018800:	4f424b41 	svcmi	0x00424b41
80018804:	4141484f 	cmpmi	r1, pc, asr #16
80018808:	4f4c4141 	svcmi	0x004c4141
8001880c:	43414141 	movtmi	r4, #4417	@ 0x1141
80018810:	4f424b41 	svcmi	0x00424b41
80018814:	44414245 	strbmi	r4, [r1], #-581	@ 0xfffffdbb
80018818:	4f46424c 	svcmi	0x0046424c
8001881c:	44414143 	strbmi	r4, [r1], #-323	@ 0xfffffebd
80018820:	4f414944 	svcmi	0x00414944
80018824:	44414245 	strbmi	r4, [r1], #-581	@ 0xfffffdbb
80018828:	4f46414c 	svcmi	0x0046414c
8001882c:	4141424d 	cmpmi	r1, sp, asr #4
80018830:	4f4b4141 	svcmi	0x004b4141
80018834:	44414449 	strbmi	r4, [r1], #-1097	@ 0xfffffbb7
80018838:	4f46424c 	svcmi	0x0046424c
8001883c:	43414145 	movtmi	r4, #4421	@ 0x1145
80018840:	4f434944 	svcmi	0x00434944
80018844:	43414449 	movtmi	r4, #5193	@ 0x1449
80018848:	4f46414c 	svcmi	0x0046414c
8001884c:	44414141 	strbmi	r4, [r1], #-321	@ 0xfffffebf
80018850:	4f464a44 	svcmi	0x00464a44
80018854:	4441424d 	strbmi	r4, [r1], #-589	@ 0xfffffdb3
80018858:	4f46414c 	svcmi	0x0046414c
8001885c:	44414245 	strbmi	r4, [r1], #-581	@ 0xfffffdbb
80018860:	4f46424c 	svcmi	0x0046424c
80018864:	43414441 	movtmi	r4, #5185	@ 0x1441
80018868:	4f46424c 	svcmi	0x0046424c
8001886c:	44414144 	strbmi	r4, [r1], #-324	@ 0xfffffebc
80018870:	4f414943 	svcmi	0x00414943
80018874:	43414a49 	movtmi	r4, #6729	@ 0x1a49
80018878:	4f464a50 	svcmi	0x00464a50
8001887c:	43414143 	movtmi	r4, #4419	@ 0x1143
80018880:	4f414950 	svcmi	0x00414950
80018884:	42414143 	submi	r4, r1, #-1073741808	@ 0xc0000010
80018888:	4f424b41 	svcmi	0x00424b41
8001888c:	41414144 	cmpmi	r1, r4, asr #2
80018890:	4f424b41 	svcmi	0x00424b41
80018894:	41414344 	cmpmi	r1, r4, asr #6
80018898:	4f4c4141 	svcmi	0x004c4141
8001889c:	43414141 	movtmi	r4, #4417	@ 0x1141
800188a0:	4f424b41 	svcmi	0x00424b41
800188a4:	44414245 	strbmi	r4, [r1], #-581	@ 0xfffffdbb
800188a8:	4f46424c 	svcmi	0x0046424c
800188ac:	44414143 	strbmi	r4, [r1], #-323	@ 0xfffffebd
800188b0:	4f414944 	svcmi	0x00414944
800188b4:	44414245 	strbmi	r4, [r1], #-581	@ 0xfffffdbb
800188b8:	4f46414c 	svcmi	0x0046414c
800188bc:	44414245 	strbmi	r4, [r1], #-581	@ 0xfffffdbb
800188c0:	4f46424c 	svcmi	0x0046424c
800188c4:	43414441 	movtmi	r4, #5185	@ 0x1441
800188c8:	4f46424c 	svcmi	0x0046424c
800188cc:	44414144 	strbmi	r4, [r1], #-324	@ 0xfffffebc
800188d0:	4f414943 	svcmi	0x00414943
800188d4:	4241424d 	submi	r4, r1, #-805306364	@ 0xd0000004
800188d8:	4f46424c 	svcmi	0x0046424c
800188dc:	43414241 	movtmi	r4, #4673	@ 0x1241
800188e0:	4f444b41 	svcmi	0x00444b41
800188e4:	41414144 	cmpmi	r1, r4, asr #2
800188e8:	4f424b41 	svcmi	0x00424b41
800188ec:	41414742 	cmpmi	r1, r2, asr #14
800188f0:	4f4c4141 	svcmi	0x004c4141
800188f4:	43414141 	movtmi	r4, #4417	@ 0x1141
800188f8:	4f424b41 	svcmi	0x00424b41
800188fc:	44414245 	strbmi	r4, [r1], #-581	@ 0xfffffdbb
80018900:	4f46424c 	svcmi	0x0046424c
80018904:	44414143 	strbmi	r4, [r1], #-323	@ 0xfffffebd
80018908:	4f414944 	svcmi	0x00414944
8001890c:	44414245 	strbmi	r4, [r1], #-581	@ 0xfffffdbb
80018910:	4f46414c 	svcmi	0x0046414c
80018914:	50414141 	subpl	r4, r1, r1, asr #2
80018918:	4f444341 	svcmi	0x00444341
8001891c:	44414241 	strbmi	r4, [r1], #-577	@ 0xfffffdbf
80018920:	4f46424c 	svcmi	0x0046424c
80018924:	44414143 	strbmi	r4, [r1], #-323	@ 0xfffffebd
80018928:	4f434944 	svcmi	0x00434944
8001892c:	44414241 	strbmi	r4, [r1], #-577	@ 0xfffffdbf
80018930:	4f46414c 	svcmi	0x0046414c
80018934:	44414241 	strbmi	r4, [r1], #-577	@ 0xfffffdbf
80018938:	4f46424c 	svcmi	0x0046424c
8001893c:	43414445 	movtmi	r4, #5189	@ 0x1445
80018940:	4f46424c 	svcmi	0x0046424c
80018944:	44414144 	strbmi	r4, [r1], #-324	@ 0xfffffebc
80018948:	4f414943 	svcmi	0x00414943
8001894c:	44414141 	strbmi	r4, [r1], #-321	@ 0xfffffebf
80018950:	4f464e44 	svcmi	0x00464e44
80018954:	41414141 	cmpmi	r1, r1, asr #2
80018958:	4f444644 	svcmi	0x00444644
8001895c:	50504743 	subspl	r4, r0, r3, asr #14
80018960:	424b5050 	submi	r5, fp, #80	@ 0x50
80018964:	44414245 	strbmi	r4, [r1], #-581	@ 0xfffffdbb
80018968:	4f46424c 	svcmi	0x0046424c
8001896c:	43414441 	movtmi	r4, #5185	@ 0x1441
80018970:	4f46424c 	svcmi	0x0046424c
80018974:	44414144 	strbmi	r4, [r1], #-324	@ 0xfffffebc
80018978:	4f414943 	svcmi	0x00414943
8001897c:	43414141 	movtmi	r4, #4417	@ 0x1141
80018980:	4f444b41 	svcmi	0x00444b41
80018984:	43414141 	movtmi	r4, #4417	@ 0x1141
80018988:	4f464d44 	svcmi	0x00464d44
8001898c:	44414245 	strbmi	r4, [r1], #-581	@ 0xfffffdbb
80018990:	4f46424c 	svcmi	0x0046424c
80018994:	41414144 	cmpmi	r1, r4, asr #2
80018998:	4f424b41 	svcmi	0x00424b41
8001899c:	4e41414d 	cdpmi	1, 4, cr4, cr1, cr13, {2}
800189a0:	4f43454c 	svcmi	0x0043454c
800189a4:	4b494141 	blmi	81268eb0 <irq_stack_start+0x120eea0>
800189a8:	4f494a4e 	svcmi	0x00494a4e
800189ac:	41454b49 	cmpmi	r5, r9, asr #22
800189b0:	41414141 	cmpmi	r1, r1, asr #2
800189b4:	41444841 	cmpmi	r4, r1, asr #16
800189b8:	41414141 	cmpmi	r1, r1, asr #2
800189bc:	4d41414e 	stclmi	1, cr4, [r1, #-312]	@ 0xfffffec8
800189c0:	4f424b41 	svcmi	0x00424b41
800189c4:	4e494141 	cdpmi	1, 4, cr4, cr9, cr1, {2}
800189c8:	4f4a434e 	svcmi	0x004a434e
800189cc:	4c414145 	mcrrmi	1, 4, r4, r1, cr5
800189d0:	4f43454d 	svcmi	0x0043454d
800189d4:	4e414241 	cdpmi	2, 4, cr4, cr1, cr1, {2}
800189d8:	4f43454e 	svcmi	0x0043454e
800189dc:	41414249 	cmpmi	r1, r9, asr #4
800189e0:	4f46414c 	svcmi	0x0046414c
800189e4:	4241424d 	submi	r4, r1, #-805306364	@ 0xd0000004
800189e8:	4f46414c 	svcmi	0x0046414c
800189ec:	44414141 	strbmi	r4, [r1], #-321	@ 0xfffffebf
800189f0:	4f444b41 	svcmi	0x00444b41
800189f4:	44414241 	strbmi	r4, [r1], #-577	@ 0xfffffdbf
800189f8:	4f46414c 	svcmi	0x0046414c
800189fc:	44414141 	strbmi	r4, [r1], #-321	@ 0xfffffebf
80018a00:	4f444b41 	svcmi	0x00444b41
80018a04:	44414245 	strbmi	r4, [r1], #-581	@ 0xfffffdbb
80018a08:	4f46414c 	svcmi	0x0046414c
80018a0c:	4141414e 	cmpmi	r1, lr, asr #2
80018a10:	4f4b4141 	svcmi	0x004b4141
80018a14:	44414245 	strbmi	r4, [r1], #-581	@ 0xfffffdbb
80018a18:	4f46424c 	svcmi	0x0046424c
80018a1c:	4341424d 	movtmi	r4, #4685	@ 0x124d
80018a20:	4f46424c 	svcmi	0x0046424c
80018a24:	43414144 	movtmi	r4, #4420	@ 0x1144
80018a28:	4f414943 	svcmi	0x00414943
80018a2c:	44414241 	strbmi	r4, [r1], #-577	@ 0xfffffdbf
80018a30:	4f46424c 	svcmi	0x0046424c
80018a34:	42414249 	submi	r4, r1, #-1879048188	@ 0x90000004
80018a38:	4f46424c 	svcmi	0x0046424c
80018a3c:	44414144 	strbmi	r4, [r1], #-324	@ 0xfffffebc
80018a40:	4f414942 	svcmi	0x00414942
80018a44:	43414141 	movtmi	r4, #4417	@ 0x1141
80018a48:	4f464e43 	svcmi	0x00464e43
80018a4c:	43414141 	movtmi	r4, #4417	@ 0x1141
80018a50:	4f464d44 	svcmi	0x00464d44
80018a54:	44414241 	strbmi	r4, [r1], #-577	@ 0xfffffdbf
80018a58:	4f46424c 	svcmi	0x0046424c
80018a5c:	44414142 	strbmi	r4, [r1], #-322	@ 0xfffffebe
80018a60:	4f434944 	svcmi	0x00434944
80018a64:	44414241 	strbmi	r4, [r1], #-577	@ 0xfffffdbf
80018a68:	4f46414c 	svcmi	0x0046414c
80018a6c:	44414245 	strbmi	r4, [r1], #-581	@ 0xfffffdbb
80018a70:	4f46424c 	svcmi	0x0046424c
80018a74:	44414142 	strbmi	r4, [r1], #-322	@ 0xfffffebe
80018a78:	4f434944 	svcmi	0x00434944
80018a7c:	44414245 	strbmi	r4, [r1], #-581	@ 0xfffffdbb
80018a80:	4f46414c 	svcmi	0x0046414c
80018a84:	44414245 	strbmi	r4, [r1], #-581	@ 0xfffffdbb
80018a88:	4f46424c 	svcmi	0x0046424c
80018a8c:	4341424d 	movtmi	r4, #4685	@ 0x124d
80018a90:	4f46424c 	svcmi	0x0046424c
80018a94:	44414144 	strbmi	r4, [r1], #-324	@ 0xfffffebc
80018a98:	4f414943 	svcmi	0x00414943
80018a9c:	44414141 	strbmi	r4, [r1], #-321	@ 0xfffffebf
80018aa0:	4f464e44 	svcmi	0x00464e44
80018aa4:	41414141 	cmpmi	r1, r1, asr #2
80018aa8:	4f444644 	svcmi	0x00444644
80018aac:	50504f4c 	subspl	r4, r0, ip, asr #30
80018ab0:	424b5050 	submi	r5, fp, #80	@ 0x50
80018ab4:	44414245 	strbmi	r4, [r1], #-581	@ 0xfffffdbb
80018ab8:	4f46424c 	svcmi	0x0046424c
80018abc:	41414144 	cmpmi	r1, r4, asr #2
80018ac0:	4f424b41 	svcmi	0x00424b41
80018ac4:	4e41414d 	cdpmi	1, 4, cr4, cr1, cr13, {2}
80018ac8:	4f43454c 	svcmi	0x0043454c
80018acc:	4b494141 	blmi	81268fd8 <irq_stack_start+0x120efc8>
80018ad0:	4f494a4e 	svcmi	0x00494a4e
80018ad4:	4d41414e 	stclmi	1, cr4, [r1, #-312]	@ 0xfffffec8
80018ad8:	4f424b41 	svcmi	0x00424b41
80018adc:	4e494141 	cdpmi	1, 4, cr4, cr9, cr1, {2}
80018ae0:	4f4a434e 	svcmi	0x004a434e
80018ae4:	4c414145 	mcrrmi	1, 4, r4, r1, cr5
80018ae8:	4f43454d 	svcmi	0x0043454d
80018aec:	4e414241 	cdpmi	2, 4, cr4, cr1, cr1, {2}
80018af0:	4f43454e 	svcmi	0x0043454e
80018af4:	41414249 	cmpmi	r1, r9, asr #4
80018af8:	4f46414c 	svcmi	0x0046414c
80018afc:	4241424d 	submi	r4, r1, #-805306364	@ 0xd0000004
80018b00:	4f46414c 	svcmi	0x0046414c
80018b04:	44414141 	strbmi	r4, [r1], #-321	@ 0xfffffebf
80018b08:	4f444b41 	svcmi	0x00444b41
80018b0c:	44414241 	strbmi	r4, [r1], #-577	@ 0xfffffdbf
80018b10:	4f46414c 	svcmi	0x0046414c
80018b14:	4441424d 	strbmi	r4, [r1], #-589	@ 0xfffffdb3
80018b18:	4f46424c 	svcmi	0x0046424c
80018b1c:	41414141 	cmpmi	r1, r1, asr #2
80018b20:	4f444644 	svcmi	0x00444644
80018b24:	41414241 	cmpmi	r1, r1, asr #4
80018b28:	4b4b4141 	blmi	812e9034 <irq_stack_start+0x128f024>
80018b2c:	44414249 	strbmi	r4, [r1], #-585	@ 0xfffffdb7
80018b30:	4f46424c 	svcmi	0x0046424c
80018b34:	4341434e 	movtmi	r4, #4942	@ 0x134e
80018b38:	4f444b41 	svcmi	0x00444b41
80018b3c:	43414141 	movtmi	r4, #4417	@ 0x1141
80018b40:	4f464d44 	svcmi	0x00464d44
80018b44:	44414142 	strbmi	r4, [r1], #-322	@ 0xfffffebe
80018b48:	4f444b41 	svcmi	0x00444b41
80018b4c:	44414241 	strbmi	r4, [r1], #-577	@ 0xfffffdbf
80018b50:	4f46414c 	svcmi	0x0046414c
80018b54:	44414249 	strbmi	r4, [r1], #-585	@ 0xfffffdb7
80018b58:	4f46424c 	svcmi	0x0046424c
80018b5c:	41414142 	cmpmi	r1, r2, asr #2
80018b60:	4f434944 	svcmi	0x00434944
80018b64:	4441424d 	strbmi	r4, [r1], #-589	@ 0xfffffdb3
80018b68:	4f46424c 	svcmi	0x0046424c
80018b6c:	44414141 	strbmi	r4, [r1], #-321	@ 0xfffffebf
80018b70:	4f434744 	svcmi	0x00434744
80018b74:	4341414b 	movtmi	r4, #4427	@ 0x114b
80018b78:	4f444b41 	svcmi	0x00444b41
80018b7c:	42414144 	submi	r4, r1, #68, 2
80018b80:	4f424b41 	svcmi	0x00424b41
80018b84:	4141414f 	cmpmi	r1, pc, asr #2
80018b88:	4f4c4141 	svcmi	0x004c4141
80018b8c:	43414141 	movtmi	r4, #4417	@ 0x1141
80018b90:	4f424b41 	svcmi	0x00424b41
80018b94:	44414241 	strbmi	r4, [r1], #-577	@ 0xfffffdbf
80018b98:	4f46424c 	svcmi	0x0046424c
80018b9c:	44414143 	strbmi	r4, [r1], #-323	@ 0xfffffebd
80018ba0:	4f414944 	svcmi	0x00414944
80018ba4:	44414241 	strbmi	r4, [r1], #-577	@ 0xfffffdbf
80018ba8:	4f46414c 	svcmi	0x0046414c
80018bac:	41414146 	cmpmi	r1, r6, asr #2
80018bb0:	4f4b4141 	svcmi	0x004b4141
80018bb4:	4441424d 	strbmi	r4, [r1], #-589	@ 0xfffffdb3
80018bb8:	4f46424c 	svcmi	0x0046424c
80018bbc:	4341414b 	movtmi	r4, #4427	@ 0x114b
80018bc0:	4f444b41 	svcmi	0x00444b41
80018bc4:	42414144 	submi	r4, r1, #68, 2
80018bc8:	4f424b41 	svcmi	0x00424b41
80018bcc:	41414249 	cmpmi	r1, r9, asr #4
80018bd0:	4f46424c 	svcmi	0x0046424c
80018bd4:	41414145 	cmpmi	r1, r5, asr #2
80018bd8:	4f4c4141 	svcmi	0x004c4141
80018bdc:	41414241 	cmpmi	r1, r1, asr #4
80018be0:	4f46414c 	svcmi	0x0046414c
80018be4:	44414241 	strbmi	r4, [r1], #-577	@ 0xfffffdbf
80018be8:	4f46424c 	svcmi	0x0046424c
80018bec:	41414144 	cmpmi	r1, r4, asr #2
80018bf0:	4f424b41 	svcmi	0x00424b41
80018bf4:	4e41414d 	cdpmi	1, 4, cr4, cr1, cr13, {2}
80018bf8:	4f43454c 	svcmi	0x0043454c
80018bfc:	4b494141 	blmi	81269108 <irq_stack_start+0x120f0f8>
80018c00:	4f494a4e 	svcmi	0x00494a4e
80018c04:	4d41414e 	stclmi	1, cr4, [r1, #-312]	@ 0xfffffec8
80018c08:	4f424b41 	svcmi	0x00424b41
80018c0c:	4e494141 	cdpmi	1, 4, cr4, cr9, cr1, {2}
80018c10:	4f4a434e 	svcmi	0x004a434e
80018c14:	4c414145 	mcrrmi	1, 4, r4, r1, cr5
80018c18:	4f43454d 	svcmi	0x0043454d
80018c1c:	4e414341 	cdpmi	3, 4, cr4, cr1, cr1, {2}
80018c20:	4f43454e 	svcmi	0x0043454e
80018c24:	41414341 	cmpmi	r1, r1, asr #6
80018c28:	4f46414c 	svcmi	0x0046414c
80018c2c:	42414345 	submi	r4, r1, #335544321	@ 0x14000001
80018c30:	4f46414c 	svcmi	0x0046414c
80018c34:	43414349 	movtmi	r4, #4937	@ 0x1349
80018c38:	4f46414c 	svcmi	0x0046414c
80018c3c:	44414141 	strbmi	r4, [r1], #-321	@ 0xfffffebf
80018c40:	4f444b41 	svcmi	0x00444b41
80018c44:	44414241 	strbmi	r4, [r1], #-577	@ 0xfffffdbf
80018c48:	4f46414c 	svcmi	0x0046414c
80018c4c:	44414141 	strbmi	r4, [r1], #-321	@ 0xfffffebf
80018c50:	4f444b41 	svcmi	0x00444b41
80018c54:	44414249 	strbmi	r4, [r1], #-585	@ 0xfffffdb7
80018c58:	4f46414c 	svcmi	0x0046414c
80018c5c:	44414141 	strbmi	r4, [r1], #-321	@ 0xfffffebf
80018c60:	4f444b41 	svcmi	0x00444b41
80018c64:	44414245 	strbmi	r4, [r1], #-581	@ 0xfffffdbb
80018c68:	4f46414c 	svcmi	0x0046414c
80018c6c:	44414249 	strbmi	r4, [r1], #-585	@ 0xfffffdb7
80018c70:	4f43454c 	svcmi	0x0043454c
80018c74:	43414144 	movtmi	r4, #4420	@ 0x1144
80018c78:	4f424b41 	svcmi	0x00424b41
80018c7c:	42414349 	submi	r4, r1, #603979777	@ 0x24000001
80018c80:	4f46424c 	svcmi	0x0046424c
80018c84:	41414345 	cmpmi	r1, r5, asr #6
80018c88:	4f46424c 	svcmi	0x0046424c
80018c8c:	41414249 	cmpmi	r1, r9, asr #4
80018c90:	4f4c4141 	svcmi	0x004c4141
80018c94:	41414245 	cmpmi	r1, r5, asr #4
80018c98:	4f46414c 	svcmi	0x0046414c
80018c9c:	44414245 	strbmi	r4, [r1], #-581	@ 0xfffffdbb
80018ca0:	4f46424c 	svcmi	0x0046424c
80018ca4:	41414141 	cmpmi	r1, r1, asr #2
80018ca8:	4f444644 	svcmi	0x00444644
80018cac:	41414145 	cmpmi	r1, r5, asr #2
80018cb0:	414b4141 	cmpmi	fp, r1, asr #2
80018cb4:	43414349 	movtmi	r4, #4937	@ 0x1349
80018cb8:	4f46424c 	svcmi	0x0046424c
80018cbc:	42414245 	submi	r4, r1, #1342177284	@ 0x50000004
80018cc0:	4f46424c 	svcmi	0x0046424c
80018cc4:	41414341 	cmpmi	r1, r1, asr #6
80018cc8:	4f46424c 	svcmi	0x0046424c
80018ccc:	50504f46 	subspl	r4, r0, r6, asr #30
80018cd0:	4f4c5050 	svcmi	0x004c5050
80018cd4:	41414241 	cmpmi	r1, r1, asr #4
80018cd8:	4f46414c 	svcmi	0x0046414c
80018cdc:	43414249 	movtmi	r4, #4681	@ 0x1249
80018ce0:	4f46424c 	svcmi	0x0046424c
80018ce4:	44414241 	strbmi	r4, [r1], #-577	@ 0xfffffdbf
80018ce8:	4f46424c 	svcmi	0x0046424c
80018cec:	42414341 	submi	r4, r1, #67108865	@ 0x4000001
80018cf0:	4f46424c 	svcmi	0x0046424c
80018cf4:	44414144 	strbmi	r4, [r1], #-324	@ 0xfffffebc
80018cf8:	4f414942 	svcmi	0x00414942
80018cfc:	42414345 	submi	r4, r1, #335544321	@ 0x14000001
80018d00:	4f464a50 	svcmi	0x00464a50
80018d04:	42414142 	submi	r4, r1, #-2147483632	@ 0x80000010
80018d08:	4f414950 	svcmi	0x00414950
80018d0c:	43414143 	movtmi	r4, #4419	@ 0x1143
80018d10:	4f484e42 	svcmi	0x00484e42
80018d14:	43414141 	movtmi	r4, #4417	@ 0x1141
80018d18:	4f464d44 	svcmi	0x00464d44
80018d1c:	44414241 	strbmi	r4, [r1], #-577	@ 0xfffffdbf
80018d20:	4f46424c 	svcmi	0x0046424c
80018d24:	44414142 	strbmi	r4, [r1], #-322	@ 0xfffffebe
80018d28:	4f434944 	svcmi	0x00434944
80018d2c:	44414241 	strbmi	r4, [r1], #-577	@ 0xfffffdbf
80018d30:	4f46414c 	svcmi	0x0046414c
80018d34:	44414241 	strbmi	r4, [r1], #-577	@ 0xfffffdbf
80018d38:	4f46424c 	svcmi	0x0046424c
80018d3c:	41414144 	cmpmi	r1, r4, asr #2
80018d40:	4f424b41 	svcmi	0x00424b41
80018d44:	4e41414d 	cdpmi	1, 4, cr4, cr1, cr13, {2}
80018d48:	4f43454c 	svcmi	0x0043454c
80018d4c:	4b494141 	blmi	81269258 <irq_stack_start+0x120f248>
80018d50:	4f494a4e 	svcmi	0x00494a4e
80018d54:	41424949 	cmpmi	r2, r9, asr #18
80018d58:	41414141 	cmpmi	r1, r1, asr #2
80018d5c:	4d41414e 	stclmi	1, cr4, [r1, #-312]	@ 0xfffffec8
80018d60:	4f424b41 	svcmi	0x00424b41
80018d64:	4e494141 	cdpmi	1, 4, cr4, cr9, cr1, {2}
80018d68:	4f4a434e 	svcmi	0x004a434e
80018d6c:	4c414145 	mcrrmi	1, 4, r4, r1, cr5
80018d70:	4f43454d 	svcmi	0x0043454d
80018d74:	4e414341 	cdpmi	3, 4, cr4, cr1, cr1, {2}
80018d78:	4f43454e 	svcmi	0x0043454e
80018d7c:	41414341 	cmpmi	r1, r1, asr #6
80018d80:	4f46414c 	svcmi	0x0046414c
80018d84:	42414345 	submi	r4, r1, #335544321	@ 0x14000001
80018d88:	4f46414c 	svcmi	0x0046414c
80018d8c:	43414349 	movtmi	r4, #4937	@ 0x1349
80018d90:	4f46414c 	svcmi	0x0046414c
80018d94:	44414141 	strbmi	r4, [r1], #-321	@ 0xfffffebf
80018d98:	4f444b41 	svcmi	0x00444b41
80018d9c:	44414241 	strbmi	r4, [r1], #-577	@ 0xfffffdbf
80018da0:	4f46414c 	svcmi	0x0046414c
80018da4:	44414141 	strbmi	r4, [r1], #-321	@ 0xfffffebf
80018da8:	4f444b41 	svcmi	0x00444b41
80018dac:	44414245 	strbmi	r4, [r1], #-581	@ 0xfffffdbb
80018db0:	4f46414c 	svcmi	0x0046414c
80018db4:	44414141 	strbmi	r4, [r1], #-321	@ 0xfffffebf
80018db8:	4f444b41 	svcmi	0x00444b41
80018dbc:	44414249 	strbmi	r4, [r1], #-585	@ 0xfffffdb7
80018dc0:	4f46414c 	svcmi	0x0046414c
80018dc4:	44414250 	strbmi	r4, [r1], #-592	@ 0xfffffdb0
80018dc8:	4f444b41 	svcmi	0x00444b41
80018dcc:	44414241 	strbmi	r4, [r1], #-577	@ 0xfffffdbf
80018dd0:	4f46414c 	svcmi	0x0046414c
80018dd4:	41414250 	cmpmi	r1, r0, asr r2
80018dd8:	4f4b4141 	svcmi	0x004b4141
80018ddc:	43414142 	movtmi	r4, #4418	@ 0x1142
80018de0:	4f444b41 	svcmi	0x00444b41
80018de4:	44414241 	strbmi	r4, [r1], #-577	@ 0xfffffdbf
80018de8:	4f46424c 	svcmi	0x0046424c
80018dec:	43444243 	movtmi	r4, #16963	@ 0x4243
80018df0:	4f424b41 	svcmi	0x00424b41
80018df4:	44414341 	strbmi	r4, [r1], #-833	@ 0xfffffcbf
80018df8:	4f46424c 	svcmi	0x0046424c
80018dfc:	44414143 	strbmi	r4, [r1], #-323	@ 0xfffffebd
80018e00:	4f414144 	svcmi	0x00414144
80018e04:	41414141 	cmpmi	r1, r1, asr #2
80018e08:	4f444644 	svcmi	0x00444644
80018e0c:	44414142 	strbmi	r4, [r1], #-322	@ 0xfffffebe
80018e10:	42444b41 	submi	r4, r4, #66560	@ 0x10400
80018e14:	44414141 	strbmi	r4, [r1], #-321	@ 0xfffffebf
80018e18:	41444b41 	cmpmi	r4, r1, asr #22
80018e1c:	44414844 	strbmi	r4, [r1], #-2116	@ 0xfffff7bc
80018e20:	4f474f50 	svcmi	0x00474f50
80018e24:	4441424d 	strbmi	r4, [r1], #-589	@ 0xfffffdb3
80018e28:	4f46414c 	svcmi	0x0046414c
80018e2c:	44414249 	strbmi	r4, [r1], #-585	@ 0xfffffdb7
80018e30:	4f46424c 	svcmi	0x0046424c
80018e34:	44414944 	strbmi	r4, [r1], #-2372	@ 0xfffff6bc
80018e38:	4f424b41 	svcmi	0x00424b41
80018e3c:	4341424d 	movtmi	r4, #4685	@ 0x124d
80018e40:	4f46424c 	svcmi	0x0046424c
80018e44:	44414144 	strbmi	r4, [r1], #-324	@ 0xfffffebc
80018e48:	4f424943 	svcmi	0x00424943
80018e4c:	44414249 	strbmi	r4, [r1], #-585	@ 0xfffffdb7
80018e50:	4f46414c 	svcmi	0x0046414c
80018e54:	43414249 	movtmi	r4, #4681	@ 0x1249
80018e58:	4f46424c 	svcmi	0x0046424c
80018e5c:	44414345 	strbmi	r4, [r1], #-837	@ 0xfffffcbb
80018e60:	4f46424c 	svcmi	0x0046424c
80018e64:	41414144 	cmpmi	r1, r4, asr #2
80018e68:	4f424643 	svcmi	0x00424643
80018e6c:	4141414a 	cmpmi	r1, sl, asr #2
80018e70:	444b4141 	strbmi	r4, [fp], #-321	@ 0xfffffebf
80018e74:	43414249 	movtmi	r4, #4681	@ 0x1249
80018e78:	4f46424c 	svcmi	0x0046424c
80018e7c:	44414345 	strbmi	r4, [r1], #-837	@ 0xfffffcbb
80018e80:	4f46424c 	svcmi	0x0046424c
80018e84:	44414144 	strbmi	r4, [r1], #-324	@ 0xfffffebc
80018e88:	4f414543 	svcmi	0x00414543
80018e8c:	44414249 	strbmi	r4, [r1], #-585	@ 0xfffffdb7
80018e90:	4f46414c 	svcmi	0x0046414c
80018e94:	43414142 	movtmi	r4, #4418	@ 0x1142
80018e98:	4f444b41 	svcmi	0x00444b41
80018e9c:	44414241 	strbmi	r4, [r1], #-577	@ 0xfffffdbf
80018ea0:	4f46424c 	svcmi	0x0046424c
80018ea4:	44444243 	strbmi	r4, [r4], #-579	@ 0xfffffdbd
80018ea8:	4f424b41 	svcmi	0x00424b41
80018eac:	43414245 	movtmi	r4, #4677	@ 0x1245
80018eb0:	4f46424c 	svcmi	0x0046424c
80018eb4:	44414144 	strbmi	r4, [r1], #-324	@ 0xfffffebc
80018eb8:	4f424943 	svcmi	0x00424943
80018ebc:	44414245 	strbmi	r4, [r1], #-581	@ 0xfffffdbb
80018ec0:	4f46414c 	svcmi	0x0046414c
80018ec4:	44414241 	strbmi	r4, [r1], #-577	@ 0xfffffdbf
80018ec8:	4f46424c 	svcmi	0x0046424c
80018ecc:	44414142 	strbmi	r4, [r1], #-322	@ 0xfffffebe
80018ed0:	4f434544 	svcmi	0x00434544
80018ed4:	44414241 	strbmi	r4, [r1], #-577	@ 0xfffffdbf
80018ed8:	4f46414c 	svcmi	0x0046414c
80018edc:	44414241 	strbmi	r4, [r1], #-577	@ 0xfffffdbf
80018ee0:	4f46424c 	svcmi	0x0046424c
80018ee4:	41414141 	cmpmi	r1, r1, asr #2
80018ee8:	4f444644 	svcmi	0x00444644
80018eec:	50504e4d 	subspl	r4, r0, sp, asr #28
80018ef0:	4b4b5050 	blmi	812ed038 <irq_stack_start+0x1293028>
80018ef4:	44414349 	strbmi	r4, [r1], #-841	@ 0xfffffcb7
80018ef8:	4f46424c 	svcmi	0x0046424c
80018efc:	41414141 	cmpmi	r1, r1, asr #2
80018f00:	4f444644 	svcmi	0x00444644
80018f04:	41414143 	cmpmi	r1, r3, asr #2
80018f08:	414b4141 	cmpmi	fp, r1, asr #2
80018f0c:	44414349 	strbmi	r4, [r1], #-841	@ 0xfffffcb7
80018f10:	4f46424c 	svcmi	0x0046424c
80018f14:	43414249 	movtmi	r4, #4681	@ 0x1249
80018f18:	4f46424c 	svcmi	0x0046424c
80018f1c:	43414141 	movtmi	r4, #4417	@ 0x1141
80018f20:	4f464944 	svcmi	0x00464944
80018f24:	44414245 	strbmi	r4, [r1], #-581	@ 0xfffffdbb
80018f28:	4f46424c 	svcmi	0x0046424c
80018f2c:	41414144 	cmpmi	r1, r4, asr #2
80018f30:	4f424b41 	svcmi	0x00424b41
80018f34:	4e41414d 	cdpmi	1, 4, cr4, cr1, cr13, {2}
80018f38:	4f43454c 	svcmi	0x0043454c
80018f3c:	4b494141 	blmi	81269448 <irq_stack_start+0x120f438>
80018f40:	4f494a4e 	svcmi	0x00494a4e
80018f44:	48454844 	stmdami	r5, {r2, r6, fp, lr}^
80018f48:	48414746 	stmdami	r1, {r1, r2, r6, r8, r9, sl, lr}^
80018f4c:	43464341 	movtmi	r4, #25409	@ 0x6341
80018f50:	43414745 	movtmi	r4, #5957	@ 0x1745
80018f54:	48454742 	stmdami	r5, {r1, r6, r8, r9, sl, lr}^
80018f58:	48414341 	stmdami	r1, {r0, r6, r8, r9, lr}^
80018f5c:	4745474a 	strbmi	r4, [r5, -sl, asr #14]
80018f60:	43464341 	movtmi	r4, #25409	@ 0x6341
80018f64:	414b4745 	cmpmi	fp, r5, asr #14
80018f68:	41414141 	cmpmi	r1, r1, asr #2
80018f6c:	48494441 	stmdami	r9, {r0, r6, sl, lr}^
80018f70:	41414141 	cmpmi	r1, r1, asr #2
80018f74:	41414541 	cmpmi	r1, r1, asr #10
80018f78:	41414141 	cmpmi	r1, r1, asr #2
80018f7c:	41414845 	cmpmi	r1, r5, asr #16
80018f80:	41414141 	cmpmi	r1, r1, asr #2
80018f84:	4142474d 	cmpmi	r2, sp, asr #14
80018f88:	41414141 	cmpmi	r1, r1, asr #2
80018f8c:	4142474d 	cmpmi	r2, sp, asr #14
80018f90:	41414141 	cmpmi	r1, r1, asr #2
80018f94:	4142474d 	cmpmi	r2, sp, asr #14
80018f98:	41414141 	cmpmi	r1, r1, asr #2
80018f9c:	4142474d 	cmpmi	r2, sp, asr #14
80018fa0:	41414141 	cmpmi	r1, r1, asr #2
80018fa4:	4142474d 	cmpmi	r2, sp, asr #14
80018fa8:	41414141 	cmpmi	r1, r1, asr #2
80018fac:	4142474d 	cmpmi	r2, sp, asr #14
80018fb0:	41414141 	cmpmi	r1, r1, asr #2
80018fb4:	4142474d 	cmpmi	r2, sp, asr #14
80018fb8:	41414141 	cmpmi	r1, r1, asr #2
80018fbc:	4142474d 	cmpmi	r2, sp, asr #14
80018fc0:	41414141 	cmpmi	r1, r1, asr #2
80018fc4:	4142474d 	cmpmi	r2, sp, asr #14
80018fc8:	41414141 	cmpmi	r1, r1, asr #2
80018fcc:	4142474d 	cmpmi	r2, sp, asr #14
80018fd0:	41414141 	cmpmi	r1, r1, asr #2
80018fd4:	4142474d 	cmpmi	r2, sp, asr #14
80018fd8:	41414141 	cmpmi	r1, r1, asr #2
80018fdc:	4142474d 	cmpmi	r2, sp, asr #14
80018fe0:	41414141 	cmpmi	r1, r1, asr #2
80018fe4:	4142474d 	cmpmi	r2, sp, asr #14
80018fe8:	41414141 	cmpmi	r1, r1, asr #2
80018fec:	4142474d 	cmpmi	r2, sp, asr #14
80018ff0:	41414141 	cmpmi	r1, r1, asr #2
80018ff4:	41414141 	cmpmi	r1, r1, asr #2
80018ff8:	41414141 	cmpmi	r1, r1, asr #2
80018ffc:	4142474d 	cmpmi	r2, sp, asr #14
80019000:	41414141 	cmpmi	r1, r1, asr #2
80019004:	41414c45 	cmpmi	r1, r5, asr #24
80019008:	41414141 	cmpmi	r1, r1, asr #2
8001900c:	4142474d 	cmpmi	r2, sp, asr #14
80019010:	41414141 	cmpmi	r1, r1, asr #2
80019014:	4142474d 	cmpmi	r2, sp, asr #14
80019018:	41414141 	cmpmi	r1, r1, asr #2
8001901c:	41415049 	cmpmi	r1, r9, asr #32
80019020:	41414141 	cmpmi	r1, r1, asr #2
80019024:	44424441 	strbmi	r4, [r2], #-1089	@ 0xfffffbbf
80019028:	44444443 	strbmi	r4, [r4], #-1091	@ 0xfffffbbd
8001902c:	44464445 	strbmi	r4, [r6], #-1093	@ 0xfffffbbb
80019030:	44484447 	strbmi	r4, [r8], #-1095	@ 0xfffffbb9
80019034:	444a4449 	strbmi	r4, [sl], #-1097	@ 0xfffffbb7
80019038:	47434742 	strbmi	r4, [r3, -r2, asr #14]
8001903c:	47454744 	strbmi	r4, [r5, -r4, asr #14]
80019040:	47474746 	strbmi	r4, [r7, -r6, asr #14]
80019044:	41414141 	cmpmi	r1, r1, asr #2
80019048:	41414141 	cmpmi	r1, r1, asr #2
8001904c:	41414141 	cmpmi	r1, r1, asr #2
80019050:	41414141 	cmpmi	r1, r1, asr #2
80019054:	41414141 	cmpmi	r1, r1, asr #2
80019058:	41414141 	cmpmi	r1, r1, asr #2
8001905c:	41414141 	cmpmi	r1, r1, asr #2
80019060:	41414141 	cmpmi	r1, r1, asr #2
80019064:	41434449 	cmpmi	r3, r9, asr #8
80019068:	41414141 	cmpmi	r1, r1, asr #2
8001906c:	45444548 	strbmi	r4, [r4, #-1352]	@ 0xfffffab8
80019070:	444b4544 	strbmi	r4, [fp], #-1348	@ 0xfffffabc
80019074:	43494341 	movtmi	r4, #37697	@ 0x9341
80019078:	48434542 	stmdami	r3, {r1, r6, r8, sl, lr}^
8001907c:	47494744 	strbmi	r4, [r9, -r4, asr #14]
80019080:	46434341 	strbmi	r4, [r3], -r1, asr #6
80019084:	48414746 	stmdami	r1, {r1, r2, r6, r8, r9, sl, lr}^
80019088:	48444750 	stmdami	r4, {r4, r6, r8, r9, sl, lr}^
8001908c:	4845474a 	stmdami	r5, {r1, r3, r6, r8, r9, sl, lr}^
80019090:	48434750 	stmdami	r3, {r4, r6, r8, r9, sl, lr}^
80019094:	434a484a 	movtmi	r4, #43082	@ 0xa84a
80019098:	44424341 	strbmi	r4, [r2], #-833	@ 0xfffffcbf
8001909c:	434f4445 	movtmi	r4, #62533	@ 0xf445
800190a0:	434f4443 	movtmi	r4, #62531	@ 0xf443
800190a4:	41414441 	cmpmi	r1, r1, asr #8
800190a8:	434f4542 	movtmi	r4, #62786	@ 0xf542
800190ac:	41414141 	cmpmi	r1, r1, asr #2
800190b0:	47424141 	strbmi	r4, [r2, -r1, asr #2]
800190b4:	47424746 	strbmi	r4, [r2, -r6, asr #14]
800190b8:	474a4743 	strbmi	r4, [sl, -r3, asr #14]
800190bc:	41424141 	cmpmi	r2, r1, asr #2
800190c0:	41414345 	cmpmi	r1, r5, asr #6
800190c4:	41414141 	cmpmi	r1, r1, asr #2
800190c8:	44474146 	strbmi	r4, [r7], #-326	@ 0xfffffeba
800190cc:	464b454c 	strbmi	r4, [fp], -ip, asr #10
800190d0:	41474141 	cmpmi	r7, r1, asr #2
800190d4:	41494148 	cmpmi	r9, r8, asr #2
800190d8:	414a4142 	cmpmi	sl, r2, asr #2
800190dc:	42434142 	submi	r4, r3, #-2147483632	@ 0x80000010
800190e0:	42454145 	submi	r4, r5, #1073741841	@ 0x40000011
800190e4:	42464142 	submi	r4, r6, #-2147483632	@ 0x80000010
800190e8:	42484142 	submi	r4, r8, #-2147483632	@ 0x80000010
800190ec:	42494144 	submi	r4, r9, #68, 2
800190f0:	424a4142 	submi	r4, sl, #-2147483632	@ 0x80000010
800190f4:	424b4142 	submi	r4, fp, #-2147483632	@ 0x80000010
800190f8:	424f4142 	submi	r4, pc, #-2147483632	@ 0x80000010
800190fc:	43434147 	movtmi	r4, #12615	@ 0x3147
80019100:	45454142 	strbmi	r4, [r5, #-322]	@ 0xfffffebe
80019104:	41414142 	cmpmi	r1, r2, asr #2
80019108:	41414141 	cmpmi	r1, r1, asr #2
8001910c:	41414141 	cmpmi	r1, r1, asr #2
80019110:	41414141 	cmpmi	r1, r1, asr #2
80019114:	41414141 	cmpmi	r1, r1, asr #2
80019118:	41414141 	cmpmi	r1, r1, asr #2
8001911c:	41414141 	cmpmi	r1, r1, asr #2
80019120:	41414141 	cmpmi	r1, r1, asr #2
80019124:	41414141 	cmpmi	r1, r1, asr #2
80019128:	41414141 	cmpmi	r1, r1, asr #2
8001912c:	41414141 	cmpmi	r1, r1, asr #2
80019130:	41414141 	cmpmi	r1, r1, asr #2
80019134:	41424141 	cmpmi	r2, r1, asr #2
80019138:	41414141 	cmpmi	r1, r1, asr #2
8001913c:	41414141 	cmpmi	r1, r1, asr #2
80019140:	41414141 	cmpmi	r1, r1, asr #2
80019144:	41414144 	cmpmi	r1, r4, asr #2
80019148:	41414142 	cmpmi	r1, r2, asr #2
8001914c:	41414141 	cmpmi	r1, r1, asr #2
80019150:	41414141 	cmpmi	r1, r1, asr #2
80019154:	414a4a49 	cmpmi	sl, r9, asr #20
80019158:	41414141 	cmpmi	r1, r1, asr #2
8001915c:	41414141 	cmpmi	r1, r1, asr #2
80019160:	41414141 	cmpmi	r1, r1, asr #2
80019164:	41414144 	cmpmi	r1, r4, asr #2
80019168:	41414143 	cmpmi	r1, r3, asr #2
8001916c:	41414141 	cmpmi	r1, r1, asr #2
80019170:	41414141 	cmpmi	r1, r1, asr #2
80019174:	424b424d 	submi	r4, fp, #-805306364	@ 0xd0000004
80019178:	41414141 	cmpmi	r1, r1, asr #2
8001917c:	41414141 	cmpmi	r1, r1, asr #2
80019180:	41414141 	cmpmi	r1, r1, asr #2
80019184:	41414144 	cmpmi	r1, r4, asr #2
80019188:	41414144 	cmpmi	r1, r4, asr #2
8001918c:	41414141 	cmpmi	r1, r1, asr #2
80019190:	41414141 	cmpmi	r1, r1, asr #2
80019194:	424b434d 	submi	r4, fp, #872415233	@ 0x34000001
80019198:	41414141 	cmpmi	r1, r1, asr #2
8001919c:	41414141 	cmpmi	r1, r1, asr #2
800191a0:	41414141 	cmpmi	r1, r1, asr #2
800191a4:	41414144 	cmpmi	r1, r4, asr #2
800191a8:	41414145 	cmpmi	r1, r5, asr #2
800191ac:	41414141 	cmpmi	r1, r1, asr #2
800191b0:	41414141 	cmpmi	r1, r1, asr #2
800191b4:	424b434d 	submi	r4, fp, #872415233	@ 0x34000001
800191b8:	41414141 	cmpmi	r1, r1, asr #2
800191bc:	41414141 	cmpmi	r1, r1, asr #2
800191c0:	41414141 	cmpmi	r1, r1, asr #2
800191c4:	41414144 	cmpmi	r1, r4, asr #2
800191c8:	41414146 	cmpmi	r1, r6, asr #2
800191cc:	41414141 	cmpmi	r1, r1, asr #2
800191d0:	41414141 	cmpmi	r1, r1, asr #2
800191d4:	41414141 	cmpmi	r1, r1, asr #2
800191d8:	41414141 	cmpmi	r1, r1, asr #2
800191dc:	41414141 	cmpmi	r1, r1, asr #2
800191e0:	41414141 	cmpmi	r1, r1, asr #2
800191e4:	41414144 	cmpmi	r1, r4, asr #2
800191e8:	41414147 	cmpmi	r1, r7, asr #2
800191ec:	41414141 	cmpmi	r1, r1, asr #2
800191f0:	41414141 	cmpmi	r1, r1, asr #2
800191f4:	41414141 	cmpmi	r1, r1, asr #2
800191f8:	41414141 	cmpmi	r1, r1, asr #2
800191fc:	41414141 	cmpmi	r1, r1, asr #2
80019200:	41414141 	cmpmi	r1, r1, asr #2
80019204:	41414144 	cmpmi	r1, r4, asr #2
80019208:	41414148 	cmpmi	r1, r8, asr #2
8001920c:	41414142 	cmpmi	r1, r2, asr #2
80019210:	41414141 	cmpmi	r1, r1, asr #2
80019214:	41414141 	cmpmi	r1, r1, asr #2
80019218:	41414141 	cmpmi	r1, r1, asr #2
8001921c:	41414141 	cmpmi	r1, r1, asr #2
80019220:	41414141 	cmpmi	r1, r1, asr #2
80019224:	41414145 	cmpmi	r1, r5, asr #2
80019228:	50505042 	subspl	r5, r0, r2, asr #32
8001922c:	41414245 	cmpmi	r1, r5, asr #4
80019230:	41414141 	cmpmi	r1, r1, asr #2
80019234:	414a4a49 	cmpmi	sl, r9, asr #20
80019238:	41414141 	cmpmi	r1, r1, asr #2
8001923c:	41414141 	cmpmi	r1, r1, asr #2
80019240:	41414141 	cmpmi	r1, r1, asr #2
80019244:	41414141 	cmpmi	r1, r1, asr #2
80019248:	41414143 	cmpmi	r1, r3, asr #2
8001924c:	41414248 	cmpmi	r1, r8, asr #4
80019250:	41414141 	cmpmi	r1, r1, asr #2
80019254:	41424141 	cmpmi	r2, r1, asr #2
80019258:	41414141 	cmpmi	r1, r1, asr #2
8001925c:	41414141 	cmpmi	r1, r1, asr #2
80019260:	41414141 	cmpmi	r1, r1, asr #2
80019264:	41414141 	cmpmi	r1, r1, asr #2
80019268:	41414142 	cmpmi	r1, r2, asr #2
8001926c:	41414245 	cmpmi	r1, r5, asr #4
80019270:	41414141 	cmpmi	r1, r1, asr #2
80019274:	41424845 	cmpmi	r2, r5, asr #16
80019278:	41414141 	cmpmi	r1, r1, asr #2
8001927c:	41414141 	cmpmi	r1, r1, asr #2
80019280:	41414141 	cmpmi	r1, r1, asr #2
80019284:	41414141 	cmpmi	r1, r1, asr #2
80019288:	41414142 	cmpmi	r1, r2, asr #2
8001928c:	4141424b 	cmpmi	r1, fp, asr #4
80019290:	41414141 	cmpmi	r1, r1, asr #2
80019294:	41414141 	cmpmi	r1, r1, asr #2
80019298:	41414141 	cmpmi	r1, r1, asr #2
8001929c:	41414141 	cmpmi	r1, r1, asr #2
800192a0:	41414141 	cmpmi	r1, r1, asr #2
800192a4:	41414145 	cmpmi	r1, r5, asr #2
800192a8:	50505042 	subspl	r5, r0, r2, asr #32
800192ac:	41414248 	cmpmi	r1, r8, asr #4
800192b0:	41414141 	cmpmi	r1, r1, asr #2
800192b4:	41424945 	cmpmi	r2, r5, asr #18
800192b8:	41414141 	cmpmi	r1, r1, asr #2
800192bc:	41414141 	cmpmi	r1, r1, asr #2
800192c0:	41414141 	cmpmi	r1, r1, asr #2
800192c4:	41414141 	cmpmi	r1, r1, asr #2
800192c8:	41414142 	cmpmi	r1, r2, asr #2
800192cc:	41414347 	cmpmi	r1, r7, asr #6
800192d0:	41414141 	cmpmi	r1, r1, asr #2
800192d4:	41414141 	cmpmi	r1, r1, asr #2
800192d8:	41414141 	cmpmi	r1, r1, asr #2
800192dc:	41414141 	cmpmi	r1, r1, asr #2
800192e0:	41414141 	cmpmi	r1, r1, asr #2
800192e4:	41414145 	cmpmi	r1, r5, asr #2
800192e8:	50505042 	subspl	r5, r0, r2, asr #32
800192ec:	41414248 	cmpmi	r1, r8, asr #4
800192f0:	41414141 	cmpmi	r1, r1, asr #2
800192f4:	41444745 	cmpmi	r4, r5, asr #14
800192f8:	41414141 	cmpmi	r1, r1, asr #2
800192fc:	41414141 	cmpmi	r1, r1, asr #2
80019300:	41414141 	cmpmi	r1, r1, asr #2
80019304:	41414141 	cmpmi	r1, r1, asr #2
80019308:	41414142 	cmpmi	r1, r2, asr #2
8001930c:	41414345 	cmpmi	r1, r5, asr #6
80019310:	41414141 	cmpmi	r1, r1, asr #2
80019314:	41414141 	cmpmi	r1, r1, asr #2
80019318:	41414141 	cmpmi	r1, r1, asr #2
8001931c:	41414141 	cmpmi	r1, r1, asr #2
80019320:	41414141 	cmpmi	r1, r1, asr #2
80019324:	41414145 	cmpmi	r1, r5, asr #2
80019328:	50505042 	subspl	r5, r0, r2, asr #32
8001932c:	41414245 	cmpmi	r1, r5, asr #4
80019330:	41414141 	cmpmi	r1, r1, asr #2
80019334:	414a4b4d 	cmpmi	sl, sp, asr #22
80019338:	41414141 	cmpmi	r1, r1, asr #2
8001933c:	41414141 	cmpmi	r1, r1, asr #2
80019340:	41414141 	cmpmi	r1, r1, asr #2
80019344:	41414141 	cmpmi	r1, r1, asr #2
80019348:	41414143 	cmpmi	r1, r3, asr #2
8001934c:	41414248 	cmpmi	r1, r8, asr #4
80019350:	41414141 	cmpmi	r1, r1, asr #2
80019354:	41454145 	cmpmi	r5, r5, asr #2
80019358:	41414141 	cmpmi	r1, r1, asr #2
8001935c:	41414141 	cmpmi	r1, r1, asr #2
80019360:	41414141 	cmpmi	r1, r1, asr #2
80019364:	41414141 	cmpmi	r1, r1, asr #2
80019368:	41414142 	cmpmi	r1, r2, asr #2
8001936c:	41414350 	cmpmi	r1, r0, asr r3
80019370:	41414141 	cmpmi	r1, r1, asr #2
80019374:	41474e45 	cmpmi	r7, r5, asr #28
80019378:	41414141 	cmpmi	r1, r1, asr #2
8001937c:	4141494d 	cmpmi	r1, sp, asr #18
80019380:	41414141 	cmpmi	r1, r1, asr #2
80019384:	41414143 	cmpmi	r1, r3, asr #2
80019388:	41414142 	cmpmi	r1, r2, asr #2
8001938c:	4141444d 	cmpmi	r1, sp, asr #8
80019390:	41414141 	cmpmi	r1, r1, asr #2
80019394:	41484741 	cmpmi	r8, r1, asr #14
80019398:	41414141 	cmpmi	r1, r1, asr #2
8001939c:	41414a49 	cmpmi	r1, r9, asr #20
800193a0:	41414141 	cmpmi	r1, r1, asr #2
800193a4:	41414143 	cmpmi	r1, r3, asr #2
800193a8:	41414142 	cmpmi	r1, r2, asr #2
800193ac:	41414547 	cmpmi	r1, r7, asr #10
800193b0:	41414141 	cmpmi	r1, r1, asr #2
800193b4:	41485049 	cmpmi	r8, r9, asr #32
800193b8:	41414141 	cmpmi	r1, r1, asr #2
800193bc:	41414b4d 	cmpmi	r1, sp, asr #22
800193c0:	41414141 	cmpmi	r1, r1, asr #2
800193c4:	41414143 	cmpmi	r1, r3, asr #2
800193c8:	41414142 	cmpmi	r1, r2, asr #2
800193cc:	41414245 	cmpmi	r1, r5, asr #4
800193d0:	41414141 	cmpmi	r1, r1, asr #2
800193d4:	41474d4d 	cmpmi	r7, sp, asr #26
800193d8:	41414141 	cmpmi	r1, r1, asr #2
800193dc:	41414141 	cmpmi	r1, r1, asr #2
800193e0:	41414141 	cmpmi	r1, r1, asr #2
800193e4:	41414141 	cmpmi	r1, r1, asr #2
800193e8:	41414142 	cmpmi	r1, r2, asr #2
800193ec:	41414248 	cmpmi	r1, r8, asr #4
800193f0:	41414141 	cmpmi	r1, r1, asr #2
800193f4:	41474e45 	cmpmi	r7, r5, asr #28
800193f8:	41414141 	cmpmi	r1, r1, asr #2
800193fc:	41414141 	cmpmi	r1, r1, asr #2
80019400:	41414141 	cmpmi	r1, r1, asr #2
80019404:	41414141 	cmpmi	r1, r1, asr #2
80019408:	41414142 	cmpmi	r1, r2, asr #2
8001940c:	41414245 	cmpmi	r1, r5, asr #4
80019410:	41414141 	cmpmi	r1, r1, asr #2
80019414:	41494b41 	cmpmi	r9, r1, asr #22
80019418:	41414141 	cmpmi	r1, r1, asr #2
8001941c:	41414141 	cmpmi	r1, r1, asr #2
80019420:	41414141 	cmpmi	r1, r1, asr #2
80019424:	41414141 	cmpmi	r1, r1, asr #2
80019428:	41414142 	cmpmi	r1, r2, asr #2
8001942c:	4141464a 	cmpmi	r1, sl, asr #12
80019430:	41414141 	cmpmi	r1, r1, asr #2
80019434:	41414141 	cmpmi	r1, r1, asr #2
80019438:	41414141 	cmpmi	r1, r1, asr #2
8001943c:	41414141 	cmpmi	r1, r1, asr #2
80019440:	41414141 	cmpmi	r1, r1, asr #2
80019444:	41414145 	cmpmi	r1, r5, asr #2
80019448:	50505042 	subspl	r5, r0, r2, asr #32
8001944c:	41414248 	cmpmi	r1, r8, asr #4
80019450:	41414141 	cmpmi	r1, r1, asr #2
80019454:	41494b45 	cmpmi	r9, r5, asr #22
80019458:	41414141 	cmpmi	r1, r1, asr #2
8001945c:	41414141 	cmpmi	r1, r1, asr #2
80019460:	41414141 	cmpmi	r1, r1, asr #2
80019464:	41414141 	cmpmi	r1, r1, asr #2
80019468:	41414142 	cmpmi	r1, r2, asr #2
8001946c:	41414141 	cmpmi	r1, r1, asr #2
80019470:	41414141 	cmpmi	r1, r1, asr #2
80019474:	41414141 	cmpmi	r1, r1, asr #2
80019478:	41414141 	cmpmi	r1, r1, asr #2
8001947c:	41414141 	cmpmi	r1, r1, asr #2
80019480:	41414141 	cmpmi	r1, r1, asr #2
80019484:	41414145 	cmpmi	r1, r5, asr #2
80019488:	50505042 	subspl	r5, r0, r2, asr #32
8001948c:	41414741 	cmpmi	r1, r1, asr #14
80019490:	41414141 	cmpmi	r1, r1, asr #2
80019494:	424b424d 	submi	r4, fp, #-805306364	@ 0xd0000004
80019498:	41414141 	cmpmi	r1, r1, asr #2
8001949c:	41414141 	cmpmi	r1, r1, asr #2
800194a0:	41414141 	cmpmi	r1, r1, asr #2
800194a4:	41414142 	cmpmi	r1, r2, asr #2
800194a8:	41414144 	cmpmi	r1, r4, asr #2
800194ac:	41414847 	cmpmi	r1, r7, asr #16
800194b0:	41414141 	cmpmi	r1, r1, asr #2
800194b4:	4144424d 	cmpmi	r4, sp, asr #4
800194b8:	41414141 	cmpmi	r1, r1, asr #2
800194bc:	4141424d 	cmpmi	r1, sp, asr #4
800194c0:	41414141 	cmpmi	r1, r1, asr #2
800194c4:	41414243 	cmpmi	r1, r3, asr #4
800194c8:	41414142 	cmpmi	r1, r2, asr #2
800194cc:	4141484d 	cmpmi	r1, sp, asr #16
800194d0:	41414141 	cmpmi	r1, r1, asr #2
800194d4:	41454145 	cmpmi	r5, r5, asr #2
800194d8:	41414141 	cmpmi	r1, r1, asr #2
800194dc:	41434e41 	cmpmi	r3, r1, asr #28
800194e0:	41414141 	cmpmi	r1, r1, asr #2
800194e4:	41414243 	cmpmi	r1, r3, asr #4
800194e8:	41414142 	cmpmi	r1, r2, asr #2
800194ec:	41414946 	cmpmi	r1, r6, asr #18
800194f0:	41414141 	cmpmi	r1, r1, asr #2
800194f4:	41424945 	cmpmi	r2, r5, asr #18
800194f8:	41414141 	cmpmi	r1, r1, asr #2
800194fc:	41414445 	cmpmi	r1, r5, asr #8
80019500:	41414141 	cmpmi	r1, r1, asr #2
80019504:	41414243 	cmpmi	r1, r3, asr #4
80019508:	41414142 	cmpmi	r1, r2, asr #2
8001950c:	41414d4f 	cmpmi	r1, pc, asr #26
80019510:	41414141 	cmpmi	r1, r1, asr #2
80019514:	424b434d 	submi	r4, fp, #872415233	@ 0x34000001
80019518:	41414141 	cmpmi	r1, r1, asr #2
8001951c:	41414141 	cmpmi	r1, r1, asr #2
80019520:	41414141 	cmpmi	r1, r1, asr #2
80019524:	41414241 	cmpmi	r1, r1, asr #4
80019528:	41414144 	cmpmi	r1, r4, asr #2
8001952c:	4141494f 	cmpmi	r1, pc, asr #18
80019530:	41414141 	cmpmi	r1, r1, asr #2
80019534:	41434c41 	cmpmi	r3, r1, asr #24
80019538:	41414141 	cmpmi	r1, r1, asr #2
8001953c:	41414341 	cmpmi	r1, r1, asr #6
80019540:	41414141 	cmpmi	r1, r1, asr #2
80019544:	41414243 	cmpmi	r1, r3, asr #4
80019548:	41414142 	cmpmi	r1, r2, asr #2
8001954c:	41414a46 	cmpmi	r1, r6, asr #20
80019550:	41414141 	cmpmi	r1, r1, asr #2
80019554:	424b434d 	submi	r4, fp, #872415233	@ 0x34000001
80019558:	41414141 	cmpmi	r1, r1, asr #2
8001955c:	41414141 	cmpmi	r1, r1, asr #2
80019560:	41414141 	cmpmi	r1, r1, asr #2
80019564:	41414241 	cmpmi	r1, r1, asr #4
80019568:	41414144 	cmpmi	r1, r4, asr #2
8001956c:	41414b44 	cmpmi	r1, r4, asr #22
80019570:	41414141 	cmpmi	r1, r1, asr #2
80019574:	41494b45 	cmpmi	r9, r5, asr #22
80019578:	41414141 	cmpmi	r1, r1, asr #2
8001957c:	41415045 	cmpmi	r1, r5, asr #32
80019580:	41414141 	cmpmi	r1, r1, asr #2
80019584:	41414243 	cmpmi	r1, r3, asr #4
80019588:	41414142 	cmpmi	r1, r2, asr #2
8001958c:	41414c44 	cmpmi	r1, r4, asr #24
80019590:	41414141 	cmpmi	r1, r1, asr #2
80019594:	41434449 	cmpmi	r3, r9, asr #8
80019598:	41414141 	cmpmi	r1, r1, asr #2
8001959c:	4141434d 	cmpmi	r1, sp, asr #6
800195a0:	41414141 	cmpmi	r1, r1, asr #2
800195a4:	41414243 	cmpmi	r1, r3, asr #4
800195a8:	41414142 	cmpmi	r1, r2, asr #2
800195ac:	41414c4a 	cmpmi	r1, sl, asr #24
800195b0:	41414141 	cmpmi	r1, r1, asr #2
800195b4:	41434745 	cmpmi	r3, r5, asr #14
800195b8:	41414141 	cmpmi	r1, r1, asr #2
800195bc:	41414341 	cmpmi	r1, r1, asr #6
800195c0:	41414141 	cmpmi	r1, r1, asr #2
800195c4:	41414243 	cmpmi	r1, r3, asr #4
800195c8:	41414142 	cmpmi	r1, r2, asr #2
800195cc:	41414c50 	cmpmi	r1, r0, asr ip
800195d0:	41414141 	cmpmi	r1, r1, asr #2
800195d4:	41425045 	cmpmi	r2, r5, asr #32
800195d8:	41414141 	cmpmi	r1, r1, asr #2
800195dc:	41414545 	cmpmi	r1, r5, asr #10
800195e0:	41414141 	cmpmi	r1, r1, asr #2
800195e4:	41414243 	cmpmi	r1, r3, asr #4
800195e8:	41414142 	cmpmi	r1, r2, asr #2
800195ec:	41414d49 	cmpmi	r1, r9, asr #26
800195f0:	41414141 	cmpmi	r1, r1, asr #2
800195f4:	41435041 	cmpmi	r3, r1, asr #32
800195f8:	41414141 	cmpmi	r1, r1, asr #2
800195fc:	4141434d 	cmpmi	r1, sp, asr #6
80019600:	41414141 	cmpmi	r1, r1, asr #2
80019604:	41414243 	cmpmi	r1, r3, asr #4
80019608:	41414142 	cmpmi	r1, r2, asr #2
8001960c:	41414d4e 	cmpmi	r1, lr, asr #26
80019610:	41414141 	cmpmi	r1, r1, asr #2
80019614:	424b434d 	submi	r4, fp, #872415233	@ 0x34000001
80019618:	41414141 	cmpmi	r1, r1, asr #2
8001961c:	41414141 	cmpmi	r1, r1, asr #2
80019620:	41414141 	cmpmi	r1, r1, asr #2
80019624:	41414241 	cmpmi	r1, r1, asr #4
80019628:	41414144 	cmpmi	r1, r4, asr #2
8001962c:	41414e4a 	cmpmi	r1, sl, asr #28
80019630:	41414141 	cmpmi	r1, r1, asr #2
80019634:	41444449 	cmpmi	r4, r9, asr #8
80019638:	41414141 	cmpmi	r1, r1, asr #2
8001963c:	4141434d 	cmpmi	r1, sp, asr #6
80019640:	41414141 	cmpmi	r1, r1, asr #2
80019644:	41414243 	cmpmi	r1, r3, asr #4
80019648:	41414142 	cmpmi	r1, r2, asr #2
8001964c:	4142434b 	cmpmi	r2, fp, asr #6
80019650:	41414141 	cmpmi	r1, r1, asr #2
80019654:	41424141 	cmpmi	r2, r1, asr #2
80019658:	41414141 	cmpmi	r1, r1, asr #2
8001965c:	41414945 	cmpmi	r1, r5, asr #18
80019660:	41414141 	cmpmi	r1, r1, asr #2
80019664:	41414243 	cmpmi	r1, r3, asr #4
80019668:	41414142 	cmpmi	r1, r2, asr #2
8001966c:	41414e4f 	cmpmi	r1, pc, asr #28
80019670:	41414141 	cmpmi	r1, r1, asr #2
80019674:	41434e41 	cmpmi	r3, r1, asr #28
80019678:	41414141 	cmpmi	r1, r1, asr #2
8001967c:	41414341 	cmpmi	r1, r1, asr #6
80019680:	41414141 	cmpmi	r1, r1, asr #2
80019684:	41414243 	cmpmi	r1, r3, asr #4
80019688:	41414142 	cmpmi	r1, r2, asr #2
8001968c:	41414f44 	cmpmi	r1, r4, asr #30
80019690:	41414141 	cmpmi	r1, r1, asr #2
80019694:	424b434d 	submi	r4, fp, #872415233	@ 0x34000001
80019698:	41414141 	cmpmi	r1, r1, asr #2
8001969c:	41414141 	cmpmi	r1, r1, asr #2
800196a0:	41414141 	cmpmi	r1, r1, asr #2
800196a4:	41414241 	cmpmi	r1, r1, asr #4
800196a8:	41414144 	cmpmi	r1, r4, asr #2
800196ac:	41414f50 	cmpmi	r1, r0, asr pc
800196b0:	41414141 	cmpmi	r1, r1, asr #2
800196b4:	424b434d 	submi	r4, fp, #872415233	@ 0x34000001
800196b8:	41414141 	cmpmi	r1, r1, asr #2
800196bc:	41414141 	cmpmi	r1, r1, asr #2
800196c0:	41414141 	cmpmi	r1, r1, asr #2
800196c4:	41414241 	cmpmi	r1, r1, asr #4
800196c8:	41414144 	cmpmi	r1, r4, asr #2
800196cc:	41415048 	cmpmi	r1, r8, asr #32
800196d0:	41414141 	cmpmi	r1, r1, asr #2
800196d4:	41424c49 	cmpmi	r2, r9, asr #24
800196d8:	41414141 	cmpmi	r1, r1, asr #2
800196dc:	4141444d 	cmpmi	r1, sp, asr #8
800196e0:	41414141 	cmpmi	r1, r1, asr #2
800196e4:	41414243 	cmpmi	r1, r3, asr #4
800196e8:	41414142 	cmpmi	r1, r2, asr #2
800196ec:	41424141 	cmpmi	r2, r1, asr #2
800196f0:	41414141 	cmpmi	r1, r1, asr #2
800196f4:	41444745 	cmpmi	r4, r5, asr #14
800196f8:	41414141 	cmpmi	r1, r1, asr #2
800196fc:	41414b41 	cmpmi	r1, r1, asr #22
80019700:	41414141 	cmpmi	r1, r1, asr #2
80019704:	41414243 	cmpmi	r1, r3, asr #4
80019708:	41414142 	cmpmi	r1, r2, asr #2
8001970c:	4142414d 	cmpmi	r2, sp, asr #2
80019710:	41414141 	cmpmi	r1, r1, asr #2
80019714:	424b434d 	submi	r4, fp, #872415233	@ 0x34000001
80019718:	41414141 	cmpmi	r1, r1, asr #2
8001971c:	41414141 	cmpmi	r1, r1, asr #2
80019720:	41414141 	cmpmi	r1, r1, asr #2
80019724:	41414241 	cmpmi	r1, r1, asr #4
80019728:	41414144 	cmpmi	r1, r4, asr #2
8001972c:	41424244 	cmpmi	r2, r4, asr #4
80019730:	41414141 	cmpmi	r1, r1, asr #2
80019734:	424b434d 	submi	r4, fp, #872415233	@ 0x34000001
80019738:	41414141 	cmpmi	r1, r1, asr #2
8001973c:	41414141 	cmpmi	r1, r1, asr #2
80019740:	41414141 	cmpmi	r1, r1, asr #2
80019744:	41414241 	cmpmi	r1, r1, asr #4
80019748:	41414144 	cmpmi	r1, r4, asr #2
8001974c:	41424249 	cmpmi	r2, r9, asr #4
80019750:	41414141 	cmpmi	r1, r1, asr #2
80019754:	41434945 	cmpmi	r3, r5, asr #18
80019758:	41414141 	cmpmi	r1, r1, asr #2
8001975c:	4141434d 	cmpmi	r1, sp, asr #6
80019760:	41414141 	cmpmi	r1, r1, asr #2
80019764:	41414243 	cmpmi	r1, r3, asr #4
80019768:	41414142 	cmpmi	r1, r2, asr #2
8001976c:	4142424e 	cmpmi	r2, lr, asr #4
80019770:	41414141 	cmpmi	r1, r1, asr #2
80019774:	41414141 	cmpmi	r1, r1, asr #2
80019778:	41414149 	cmpmi	r1, r9, asr #2
8001977c:	41414141 	cmpmi	r1, r1, asr #2
80019780:	41414141 	cmpmi	r1, r1, asr #2
80019784:	41414241 	cmpmi	r1, r1, asr #4
80019788:	41414146 	cmpmi	r1, r6, asr #2
8001978c:	41424345 	cmpmi	r2, r5, asr #6
80019790:	41414141 	cmpmi	r1, r1, asr #2
80019794:	424b434d 	submi	r4, fp, #872415233	@ 0x34000001
80019798:	41414141 	cmpmi	r1, r1, asr #2
8001979c:	41414141 	cmpmi	r1, r1, asr #2
800197a0:	41414141 	cmpmi	r1, r1, asr #2
800197a4:	41414241 	cmpmi	r1, r1, asr #4
800197a8:	41414144 	cmpmi	r1, r4, asr #2
800197ac:	47444141 	strbmi	r4, [r4, -r1, asr #2]
800197b0:	474f4750 	smlsldmi	r4, pc, r0, r7	@ <UNPREDICTABLE>
800197b4:	48464744 	stmdami	r6, {r2, r6, r8, r9, sl, lr}^
800197b8:	48434843 	stmdami	r3, {r0, r1, r6, fp, lr}^
800197bc:	474f4746 	strbmi	r4, [pc, -r6, asr #14]
800197c0:	484a4744 	stmdami	sl, {r2, r6, r8, r9, sl, lr}^
800197c4:	48454650 	stmdami	r5, {r4, r6, r9, sl, lr}^
800197c8:	48444746 	stmdami	r4, {r1, r2, r6, r8, r9, sl, lr}^
800197cc:	434f4845 	movtmi	r4, #63557	@ 0xf845
800197d0:	41414744 	cmpmi	r1, r4, asr #14
800197d4:	47454345 	strbmi	r4, [r5, -r5, asr #6]
800197d8:	43454141 	movtmi	r4, #20801	@ 0x5141
800197dc:	41414742 	cmpmi	r1, r2, asr #14
800197e0:	484a4844 	stmdami	sl, {r2, r6, fp, lr}^
800197e4:	47444844 	strbmi	r4, [r4, -r4, asr #16]
800197e8:	474d4742 	strbmi	r4, [sp, -r2, asr #14]
800197ec:	434f474d 	movtmi	r4, #63309	@ 0xf74d
800197f0:	41414744 	cmpmi	r1, r4, asr #14
800197f4:	48444847 	stmdami	r4, {r0, r1, r2, r6, fp, lr}^
800197f8:	48434841 	stmdami	r3, {r0, r6, fp, lr}^
800197fc:	474f474a 	strbmi	r4, [pc, -sl, asr #14]
80019800:	47474845 	strbmi	r4, [r7, -r5, asr #16]
80019804:	4744434f 	strbmi	r4, [r4, -pc, asr #6]
80019808:	48414141 	stmdami	r1, {r0, r6, r8, lr}^
8001980c:	474a4843 	strbmi	r4, [sl, -r3, asr #16]
80019810:	4845474f 	stmdami	r5, {r0, r1, r2, r3, r6, r8, r9, sl, lr}^
80019814:	48444650 	stmdami	r4, {r4, r6, r9, sl, lr}^
80019818:	48434845 	stmdami	r3, {r0, r2, r6, fp, lr}^
8001981c:	474f474a 	strbmi	r4, [pc, -sl, asr #14]
80019820:	41414748 	cmpmi	r1, r8, asr #14
80019824:	48434841 	stmdami	r3, {r0, r6, fp, lr}^
80019828:	474f474a 	strbmi	r4, [pc, -sl, asr #14]
8001982c:	46504845 	ldrbmi	r4, [r0], -r5, asr #16
80019830:	474f474a 	strbmi	r4, [pc, -sl, asr #14]
80019834:	41414845 	cmpmi	r1, r5, asr #16
80019838:	48434841 	stmdami	r3, {r0, r6, fp, lr}^
8001983c:	474f474a 	strbmi	r4, [pc, -sl, asr #14]
80019840:	46504845 	ldrbmi	r4, [r0], -r5, asr #16
80019844:	474a4846 	strbmi	r4, [sl, -r6, asr #16]
80019848:	4845474f 	stmdami	r5, {r0, r1, r2, r3, r6, r8, r9, sl, lr}^
8001984c:	474a4650 	smlsldmi	r4, sl, r0, r6
80019850:	4650474f 	ldrbmi	r4, [r0], -pc, asr #14
80019854:	47424743 	strbmi	r4, [r2, -r3, asr #14]
80019858:	47464844 	strbmi	r4, [r6, -r4, asr #16]
8001985c:	474e4141 	strbmi	r4, [lr, -r1, asr #2]
80019860:	48454742 	stmdami	r5, {r1, r6, r8, r9, sl, lr}^
80019864:	434f4749 	movtmi	r4, #63305	@ 0xf749
80019868:	41414744 	cmpmi	r1, r4, asr #14
8001986c:	45484650 	strbmi	r4, [r8, #-1616]	@ 0xfffff9b0
80019870:	4550454d 	ldrbmi	r4, [r0, #-1357]	@ 0xfffffab3
80019874:	45424543 	strbmi	r4, [r2, #-1347]	@ 0xfffffabd
80019878:	4650454d 	ldrbmi	r4, [r0], -sp, asr #10
8001987c:	45474550 	strbmi	r4, [r7, #-1360]	@ 0xfffffab0
80019880:	46444547 	strbmi	r4, [r4], -r7, asr #10
80019884:	46454546 	strbmi	r4, [r5], -r6, asr #10
80019888:	46454650 			@ <UNDEFINED> instruction: 0x46454650
8001988c:	45434542 	strbmi	r4, [r3, #-1346]	@ 0xfffffabe
80019890:	4546454d 	strbmi	r4, [r6, #-1357]	@ 0xfffffab3
80019894:	41414650 	cmpmi	r1, r0, asr r6
80019898:	474a484a 	strbmi	r4, [sl, -sl, asr #16]
8001989c:	474d4746 	strbmi	r4, [sp, -r6, asr #14]
800198a0:	41414745 	cmpmi	r1, r5, asr #14
800198a4:	48444847 	stmdami	r4, {r0, r1, r2, r6, fp, lr}^
800198a8:	48434841 	stmdami	r3, {r0, r6, fp, lr}^
800198ac:	474f474a 	strbmi	r4, [pc, -sl, asr #14]
800198b0:	47474845 	strbmi	r4, [r7, -r5, asr #16]
800198b4:	48444141 	stmdami	r4, {r0, r6, r8, lr}^
800198b8:	4844484a 	stmdami	r4, {r1, r3, r6, fp, lr}^
800198bc:	47424744 	strbmi	r4, [r2, -r4, asr #14]
800198c0:	474d474d 	strbmi	r4, [sp, -sp, asr #14]
800198c4:	41414441 	cmpmi	r1, r1, asr #8
800198c8:	47464748 	strbmi	r4, [r6, -r8, asr #14]
800198cc:	48414845 	stmdami	r1, {r0, r2, r6, fp, lr}^
800198d0:	4745474a 	strbmi	r4, [r5, -sl, asr #14]
800198d4:	46504141 	ldrbmi	r4, [r0], -r1, asr #2
800198d8:	47434650 	smlsldmi	r4, r3, r0, r6
800198dc:	48444844 	stmdami	r4, {r2, r6, fp, lr}^
800198e0:	48444650 	stmdami	r4, {r4, r6, r9, sl, lr}^
800198e4:	47424845 	strbmi	r4, [r2, -r5, asr #16]
800198e8:	48454843 	stmdami	r5, {r0, r1, r6, fp, lr}^
800198ec:	46504650 			@ <UNDEFINED> instruction: 0x46504650
800198f0:	48464141 	stmdami	r6, {r0, r6, r8, lr}^
800198f4:	4844474f 	stmdami	r4, {r0, r1, r2, r3, r6, r8, r9, sl, lr}^
800198f8:	4748474a 	strbmi	r4, [r8, -sl, asr #14]
800198fc:	4746474f 	strbmi	r4, [r6, -pc, asr #14]
80019900:	46504745 	ldrbmi	r4, [r0], -r5, asr #14
80019904:	474a4745 	strbmi	r4, [sl, -r5, asr #14]
80019908:	474e4847 	strbmi	r4, [lr, -r7, asr #16]
8001990c:	47454750 	smlsldmi	r4, r5, r0, r7
80019910:	48414141 	stmdami	r1, {r0, r6, r8, lr}^
80019914:	48454846 	stmdami	r5, {r1, r2, r6, fp, lr}^
80019918:	47494744 	strbmi	r4, [r9, -r4, asr #14]
8001991c:	47484141 	strbmi	r4, [r8, -r1, asr #2]
80019920:	48454746 	stmdami	r5, {r1, r2, r6, r8, r9, sl, lr}^
80019924:	47494744 	strbmi	r4, [r9, -r4, asr #14]
80019928:	48444141 	stmdami	r4, {r0, r6, r8, lr}^
8001992c:	4844484a 	stmdami	r4, {r1, r3, r6, fp, lr}^
80019930:	47424744 	strbmi	r4, [r2, -r4, asr #14]
80019934:	474d474d 	strbmi	r4, [sp, -sp, asr #14]
80019938:	41414443 	cmpmi	r1, r3, asr #8
8001993c:	48494746 	stmdami	r9, {r1, r2, r6, r8, r9, sl, lr}^
80019940:	47444746 	strbmi	r4, [r4, -r6, asr #14]
80019944:	46504141 	ldrbmi	r4, [r0], -r1, asr #2
80019948:	47434650 	smlsldmi	r4, r3, r0, r6
8001994c:	48444844 	stmdami	r4, {r2, r6, fp, lr}^
80019950:	47464650 	smlsldmi	r4, r6, r0, r6
80019954:	4745474f 	strbmi	r4, [r5, -pc, asr #14]
80019958:	46504650 			@ <UNDEFINED> instruction: 0x46504650
8001995c:	48484141 	stmdami	r8, {r0, r6, r8, lr}^
80019960:	474a4742 	strbmi	r4, [sl, -r2, asr #14]
80019964:	41414845 	cmpmi	r1, r5, asr #16
80019968:	47504747 	ldrbmi	r4, [r0, -r7, asr #14]
8001996c:	474c4843 	strbmi	r4, [ip, -r3, asr #16]
80019970:	46504141 	ldrbmi	r4, [r0], -r1, asr #2
80019974:	47434650 	smlsldmi	r4, r3, r0, r6
80019978:	48444844 	stmdami	r4, {r2, r6, fp, lr}^
8001997c:	48444650 	stmdami	r4, {r4, r6, r9, sl, lr}^
80019980:	47424845 	strbmi	r4, [r2, -r5, asr #16]
80019984:	48454843 	stmdami	r5, {r0, r1, r6, fp, lr}^
80019988:	46504141 	ldrbmi	r4, [r0], -r1, asr #2
8001998c:	47464650 	smlsldmi	r4, r6, r0, r6
80019990:	4745474f 	strbmi	r4, [r5, -pc, asr #14]
80019994:	46504650 			@ <UNDEFINED> instruction: 0x46504650
80019998:	48444141 	stmdami	r4, {r0, r6, r8, lr}^
8001999c:	4844484a 	stmdami	r4, {r1, r3, r6, fp, lr}^
800199a0:	47424744 	strbmi	r4, [r2, -r4, asr #14]
800199a4:	474d474d 	strbmi	r4, [sp, -sp, asr #14]
800199a8:	41414442 	cmpmi	r1, r2, asr #8
800199ac:	48434841 	stmdami	r3, {r0, r6, fp, lr}^
800199b0:	474f474a 	strbmi	r4, [pc, -sl, asr #14]
800199b4:	47474845 	strbmi	r4, [r7, -r5, asr #16]
800199b8:	47434650 	smlsldmi	r4, r3, r0, r6
800199bc:	48444742 	stmdami	r4, {r1, r6, r8, r9, sl, lr}^
800199c0:	41414746 	cmpmi	r1, r6, asr #14
800199c4:	47464650 	smlsldmi	r4, r6, r0, r6
800199c8:	47424745 	strbmi	r4, [r2, -r5, asr #14]
800199cc:	47424845 	strbmi	r4, [r2, -r5, asr #16]
800199d0:	46504141 	ldrbmi	r4, [r0], -r1, asr #2
800199d4:	474f4746 	strbmi	r4, [pc, -r6, asr #14]
800199d8:	41414745 	cmpmi	r1, r5, asr #14
800199dc:	48494746 	stmdami	r9, {r1, r2, r6, r8, r9, sl, lr}^
800199e0:	4845474a 	stmdami	r5, {r1, r3, r6, r8, r9, sl, lr}^
800199e4:	46504141 	ldrbmi	r4, [r0], -r1, asr #2
800199e8:	48454844 	stmdami	r5, {r2, r6, fp, lr}^
800199ec:	47444742 	strbmi	r4, [r4, -r2, asr #14]
800199f0:	4141474c 	cmpmi	r1, ip, asr #14
800199f4:	46504650 			@ <UNDEFINED> instruction: 0x46504650
800199f8:	47424745 	strbmi	r4, [r2, -r5, asr #14]
800199fc:	47424845 	strbmi	r4, [r2, -r5, asr #16]
80019a00:	48444650 	stmdami	r4, {r4, r6, r9, sl, lr}^
80019a04:	47424845 	strbmi	r4, [r2, -r5, asr #16]
80019a08:	48454843 	stmdami	r5, {r0, r1, r6, fp, lr}^
80019a0c:	41414141 	cmpmi	r1, r1, asr #2
80019a10:	4844434f 	stmdami	r4, {r0, r1, r2, r3, r6, r8, r9, lr}^
80019a14:	474e484a 	strbmi	r4, [lr, -sl, asr #16]
80019a18:	47424845 	strbmi	r4, [r2, -r5, asr #16]
80019a1c:	41414743 	cmpmi	r1, r3, asr #14
80019a20:	4844434f 	stmdami	r4, {r0, r1, r2, r3, r6, r8, r9, lr}^
80019a24:	48434845 	stmdami	r3, {r0, r2, r6, fp, lr}^
80019a28:	47424845 	strbmi	r4, [r2, -r5, asr #16]
80019a2c:	41414743 	cmpmi	r1, r3, asr #14
80019a30:	4844434f 	stmdami	r4, {r0, r1, r2, r3, r6, r8, r9, lr}^
80019a34:	48444749 	stmdami	r4, {r0, r3, r6, r8, r9, sl, lr}^
80019a38:	48434845 	stmdami	r3, {r0, r2, r6, fp, lr}^
80019a3c:	47424845 	strbmi	r4, [r2, -r5, asr #16]
80019a40:	41414743 	cmpmi	r1, r3, asr #14
80019a44:	4845434f 	stmdami	r5, {r0, r1, r2, r3, r6, r8, r9, lr}^
80019a48:	48494746 	stmdami	r9, {r1, r2, r6, r8, r9, sl, lr}^
80019a4c:	41414845 	cmpmi	r1, r5, asr #16
80019a50:	4843434f 	stmdami	r3, {r0, r1, r2, r3, r6, r8, r9, lr}^
80019a54:	47454750 	smlsldmi	r4, r5, r0, r7
80019a58:	48454742 	stmdami	r5, {r1, r6, r8, r9, sl, lr}^
80019a5c:	41414742 	cmpmi	r1, r2, asr #14
80019a60:	4748434f 	strbmi	r4, [r8, -pc, asr #6]
80019a64:	48454750 	stmdami	r5, {r4, r6, r8, r9, sl, lr}^
80019a68:	434f4141 	movtmi	r4, #61761	@ 0xf141
80019a6c:	47464841 	strbmi	r4, [r6, -r1, asr #16]
80019a70:	48444843 	stmdami	r4, {r0, r1, r6, fp, lr}^
80019a74:	4844474a 	stmdami	r4, {r1, r3, r6, r8, r9, sl, lr}^
80019a78:	47464845 	strbmi	r4, [r6, -r5, asr #16]
80019a7c:	4845474f 	stmdami	r5, {r0, r1, r2, r3, r6, r8, r9, sl, lr}^
80019a80:	434f4141 	movtmi	r4, #61761	@ 0xf141
80019a84:	4750474f 	ldrbmi	r4, [r0, -pc, asr #14]
80019a88:	474f474a 	strbmi	r4, [pc, -sl, asr #14]
80019a8c:	4845474a 	stmdami	r5, {r1, r3, r6, r8, r9, sl, lr}^
80019a90:	434f4141 	movtmi	r4, #61761	@ 0xf141
80019a94:	47504744 	ldrbmi	r4, [r0, -r4, asr #14]
80019a98:	474e474e 	strbmi	r4, [lr, -lr, asr #14]
80019a9c:	474f4746 	strbmi	r4, [pc, -r6, asr #14]
80019aa0:	41414845 	cmpmi	r1, r5, asr #16
80019aa4:	4542434f 	strbmi	r4, [r2, #-847]	@ 0xfffffcb1
80019aa8:	454e4643 	strbmi	r4, [lr, #-1603]	@ 0xfffff9bd
80019aac:	4742434f 	strbmi	r4, [r2, -pc, asr #6]
80019ab0:	48454845 	stmdami	r5, {r0, r2, r6, fp, lr}^
80019ab4:	474a4843 	strbmi	r4, [sl, -r3, asr #16]
80019ab8:	48464743 	stmdami	r6, {r0, r1, r6, r8, r9, sl, lr}^
80019abc:	47464845 	strbmi	r4, [r6, -r5, asr #16]
80019ac0:	41414844 	cmpmi	r1, r4, asr #16
80019ac4:	41414141 	cmpmi	r1, r1, asr #2
80019ac8:	41414141 	cmpmi	r1, r1, asr #2
80019acc:	41414141 	cmpmi	r1, r1, asr #2
80019ad0:	41414141 	cmpmi	r1, r1, asr #2
80019ad4:	41414141 	cmpmi	r1, r1, asr #2
80019ad8:	41414141 	cmpmi	r1, r1, asr #2
80019adc:	41414141 	cmpmi	r1, r1, asr #2
80019ae0:	41414141 	cmpmi	r1, r1, asr #2
80019ae4:	41414141 	cmpmi	r1, r1, asr #2
80019ae8:	41414141 	cmpmi	r1, r1, asr #2
80019aec:	41414141 	cmpmi	r1, r1, asr #2
80019af0:	41414141 	cmpmi	r1, r1, asr #2
80019af4:	41414141 	cmpmi	r1, r1, asr #2
80019af8:	41414141 	cmpmi	r1, r1, asr #2
80019afc:	41414141 	cmpmi	r1, r1, asr #2
80019b00:	41414141 	cmpmi	r1, r1, asr #2
80019b04:	41414141 	cmpmi	r1, r1, asr #2
80019b08:	41414141 	cmpmi	r1, r1, asr #2
80019b0c:	41414141 	cmpmi	r1, r1, asr #2
80019b10:	41414141 	cmpmi	r1, r1, asr #2
80019b14:	4141424c 	cmpmi	r1, ip, asr #4
80019b18:	41414141 	cmpmi	r1, r1, asr #2
80019b1c:	41414142 	cmpmi	r1, r2, asr #2
80019b20:	41414141 	cmpmi	r1, r1, asr #2
80019b24:	41414147 	cmpmi	r1, r7, asr #2
80019b28:	41414141 	cmpmi	r1, r1, asr #2
80019b2c:	41424141 	cmpmi	r2, r1, asr #2
80019b30:	41414141 	cmpmi	r1, r1, asr #2
80019b34:	41424141 	cmpmi	r2, r1, asr #2
80019b38:	41414141 	cmpmi	r1, r1, asr #2
80019b3c:	41494a49 	cmpmi	r9, r9, asr #20
80019b40:	41414141 	cmpmi	r1, r1, asr #2
80019b44:	41414141 	cmpmi	r1, r1, asr #2
80019b48:	41414141 	cmpmi	r1, r1, asr #2
80019b4c:	41414141 	cmpmi	r1, r1, asr #2
80019b50:	41414141 	cmpmi	r1, r1, asr #2
80019b54:	41414145 	cmpmi	r1, r5, asr #2
80019b58:	41414141 	cmpmi	r1, r1, asr #2
80019b5c:	41414141 	cmpmi	r1, r1, asr #2
80019b60:	41414141 	cmpmi	r1, r1, asr #2
80019b64:	41414342 	cmpmi	r1, r2, asr #6
80019b68:	41414141 	cmpmi	r1, r1, asr #2
80019b6c:	41414142 	cmpmi	r1, r2, asr #2
80019b70:	41414141 	cmpmi	r1, r1, asr #2
80019b74:	41414143 	cmpmi	r1, r3, asr #2
80019b78:	41414141 	cmpmi	r1, r1, asr #2
80019b7c:	414a4a49 	cmpmi	sl, r9, asr #20
80019b80:	41414141 	cmpmi	r1, r1, asr #2
80019b84:	414a4a49 	cmpmi	sl, r9, asr #20
80019b88:	41414141 	cmpmi	r1, r1, asr #2
80019b8c:	41414942 	cmpmi	r1, r2, asr #18
80019b90:	41414141 	cmpmi	r1, r1, asr #2
80019b94:	41414141 	cmpmi	r1, r1, asr #2
80019b98:	41414141 	cmpmi	r1, r1, asr #2
80019b9c:	41414141 	cmpmi	r1, r1, asr #2
80019ba0:	41414141 	cmpmi	r1, r1, asr #2
80019ba4:	41414145 	cmpmi	r1, r5, asr #2
80019ba8:	41414141 	cmpmi	r1, r1, asr #2
80019bac:	41414141 	cmpmi	r1, r1, asr #2
80019bb0:	41414141 	cmpmi	r1, r1, asr #2
80019bb4:	4141434a 	cmpmi	r1, sl, asr #6
80019bb8:	41414141 	cmpmi	r1, r1, asr #2
80019bbc:	41414142 	cmpmi	r1, r2, asr #2
80019bc0:	41414141 	cmpmi	r1, r1, asr #2
80019bc4:	41414144 	cmpmi	r1, r4, asr #2
80019bc8:	41414141 	cmpmi	r1, r1, asr #2
80019bcc:	424b424d 	submi	r4, fp, #-805306364	@ 0xd0000004
80019bd0:	41414141 	cmpmi	r1, r1, asr #2
80019bd4:	414b424d 	cmpmi	fp, sp, asr #4
80019bd8:	41414141 	cmpmi	r1, r1, asr #2
80019bdc:	41414241 	cmpmi	r1, r1, asr #4
80019be0:	41414141 	cmpmi	r1, r1, asr #2
80019be4:	41414141 	cmpmi	r1, r1, asr #2
80019be8:	41414141 	cmpmi	r1, r1, asr #2
80019bec:	41414141 	cmpmi	r1, r1, asr #2
80019bf0:	41414141 	cmpmi	r1, r1, asr #2
80019bf4:	41414145 	cmpmi	r1, r5, asr #2
80019bf8:	41414141 	cmpmi	r1, r1, asr #2
80019bfc:	41414145 	cmpmi	r1, r5, asr #2
80019c00:	41414141 	cmpmi	r1, r1, asr #2
80019c04:	4141434f 	cmpmi	r1, pc, asr #6
80019c08:	41414141 	cmpmi	r1, r1, asr #2
80019c0c:	41414142 	cmpmi	r1, r2, asr #2
80019c10:	41414141 	cmpmi	r1, r1, asr #2
80019c14:	00000000 	andeq	r0, r0, r0
80019c18:	41414144 	cmpmi	r1, r4, asr #2
80019c1c:	41414141 	cmpmi	r1, r1, asr #2
80019c20:	424b434d 	submi	r4, fp, #872415233	@ 0x34000001
80019c24:	41414141 	cmpmi	r1, r1, asr #2
80019c28:	414b434d 	cmpmi	fp, sp, asr #6
80019c2c:	41414141 	cmpmi	r1, r1, asr #2
80019c30:	41414141 	cmpmi	r1, r1, asr #2
80019c34:	41414141 	cmpmi	r1, r1, asr #2
80019c38:	41414141 	cmpmi	r1, r1, asr #2
80019c3c:	41414141 	cmpmi	r1, r1, asr #2
80019c40:	41414141 	cmpmi	r1, r1, asr #2
80019c44:	41414141 	cmpmi	r1, r1, asr #2
80019c48:	41414145 	cmpmi	r1, r5, asr #2
80019c4c:	41414141 	cmpmi	r1, r1, asr #2
80019c50:	41414141 	cmpmi	r1, r1, asr #2
80019c54:	41414141 	cmpmi	r1, r1, asr #2
80019c58:	4141444b 	cmpmi	r1, fp, asr #8
80019c5c:	41414141 	cmpmi	r1, r1, asr #2
80019c60:	41414149 	cmpmi	r1, r9, asr #2
80019c64:	41414141 	cmpmi	r1, r1, asr #2
80019c68:	41414144 	cmpmi	r1, r4, asr #2
80019c6c:	41414141 	cmpmi	r1, r1, asr #2
80019c70:	424b434d 	submi	r4, fp, #872415233	@ 0x34000001
80019c74:	41414141 	cmpmi	r1, r1, asr #2
80019c78:	41414141 	cmpmi	r1, r1, asr #2
80019c7c:	41414141 	cmpmi	r1, r1, asr #2
80019c80:	41414141 	cmpmi	r1, r1, asr #2
80019c84:	41414141 	cmpmi	r1, r1, asr #2
80019c88:	41414141 	cmpmi	r1, r1, asr #2
80019c8c:	41414141 	cmpmi	r1, r1, asr #2
80019c90:	41414141 	cmpmi	r1, r1, asr #2
80019c94:	41414141 	cmpmi	r1, r1, asr #2
80019c98:	41414145 	cmpmi	r1, r5, asr #2
80019c9c:	41414141 	cmpmi	r1, r1, asr #2
80019ca0:	41414141 	cmpmi	r1, r1, asr #2
80019ca4:	41414141 	cmpmi	r1, r1, asr #2
80019ca8:	41414543 	cmpmi	r1, r3, asr #10
80019cac:	41414141 	cmpmi	r1, r1, asr #2
80019cb0:	41414142 	cmpmi	r1, r2, asr #2
80019cb4:	41414141 	cmpmi	r1, r1, asr #2
80019cb8:	41414441 	cmpmi	r1, r1, asr #8
80019cbc:	41414141 	cmpmi	r1, r1, asr #2
80019cc0:	41414141 	cmpmi	r1, r1, asr #2
80019cc4:	41414141 	cmpmi	r1, r1, asr #2
80019cc8:	414b434d 	cmpmi	fp, sp, asr #6
80019ccc:	41414141 	cmpmi	r1, r1, asr #2
80019cd0:	4141424f 	cmpmi	r1, pc, asr #4
80019cd4:	41414141 	cmpmi	r1, r1, asr #2
80019cd8:	41414141 	cmpmi	r1, r1, asr #2
80019cdc:	41414141 	cmpmi	r1, r1, asr #2
80019ce0:	41414141 	cmpmi	r1, r1, asr #2
80019ce4:	41414141 	cmpmi	r1, r1, asr #2
80019ce8:	41414142 	cmpmi	r1, r2, asr #2
80019cec:	41414141 	cmpmi	r1, r1, asr #2
80019cf0:	41414142 	cmpmi	r1, r2, asr #2
80019cf4:	41414141 	cmpmi	r1, r1, asr #2
80019cf8:	4141454c 	cmpmi	r1, ip, asr #10
80019cfc:	41414141 	cmpmi	r1, r1, asr #2
80019d00:	41414144 	cmpmi	r1, r4, asr #2
80019d04:	48414141 	stmdami	r1, {r0, r6, r8, lr}^
80019d08:	41414141 	cmpmi	r1, r1, asr #2
80019d0c:	41414141 	cmpmi	r1, r1, asr #2
80019d10:	41414141 	cmpmi	r1, r1, asr #2
80019d14:	41414141 	cmpmi	r1, r1, asr #2
80019d18:	414b454b 	cmpmi	fp, fp, asr #10
80019d1c:	41414141 	cmpmi	r1, r1, asr #2
80019d20:	41414350 	cmpmi	r1, r0, asr r3
80019d24:	41414141 	cmpmi	r1, r1, asr #2
80019d28:	41414141 	cmpmi	r1, r1, asr #2
80019d2c:	41414141 	cmpmi	r1, r1, asr #2
80019d30:	41414141 	cmpmi	r1, r1, asr #2
80019d34:	41414141 	cmpmi	r1, r1, asr #2
80019d38:	41414142 	cmpmi	r1, r2, asr #2
80019d3c:	41414141 	cmpmi	r1, r1, asr #2
80019d40:	41414141 	cmpmi	r1, r1, asr #2
80019d44:	41414141 	cmpmi	r1, r1, asr #2
80019d48:	41414142 	cmpmi	r1, r2, asr #2
80019d4c:	41414141 	cmpmi	r1, r1, asr #2
80019d50:	41414143 	cmpmi	r1, r3, asr #2
80019d54:	41414141 	cmpmi	r1, r1, asr #2
80019d58:	41414141 	cmpmi	r1, r1, asr #2
80019d5c:	41414141 	cmpmi	r1, r1, asr #2
80019d60:	41414141 	cmpmi	r1, r1, asr #2
80019d64:	41414141 	cmpmi	r1, r1, asr #2
80019d68:	414b484d 	cmpmi	fp, sp, asr #16
80019d6c:	41414141 	cmpmi	r1, r1, asr #2
80019d70:	41444641 	cmpmi	r4, r1, asr #12
80019d74:	41414141 	cmpmi	r1, r1, asr #2
80019d78:	4141414a 	cmpmi	r1, sl, asr #2
80019d7c:	41414141 	cmpmi	r1, r1, asr #2
80019d80:	4141424e 	cmpmi	r1, lr, asr #4
80019d84:	41414141 	cmpmi	r1, r1, asr #2
80019d88:	41414145 	cmpmi	r1, r5, asr #2
80019d8c:	41414141 	cmpmi	r1, r1, asr #2
80019d90:	41414241 	cmpmi	r1, r1, asr #4
80019d94:	41414141 	cmpmi	r1, r1, asr #2
80019d98:	4141414a 	cmpmi	r1, sl, asr #2
80019d9c:	41414141 	cmpmi	r1, r1, asr #2
80019da0:	41414144 	cmpmi	r1, r4, asr #2
80019da4:	41414141 	cmpmi	r1, r1, asr #2
80019da8:	41414141 	cmpmi	r1, r1, asr #2
80019dac:	41414141 	cmpmi	r1, r1, asr #2
80019db0:	41414141 	cmpmi	r1, r1, asr #2
80019db4:	41414141 	cmpmi	r1, r1, asr #2
80019db8:	414e4d4d 	cmpmi	lr, sp, asr #26
80019dbc:	41414141 	cmpmi	r1, r1, asr #2
80019dc0:	41424442 	cmpmi	r2, r2, asr #8
80019dc4:	41414141 	cmpmi	r1, r1, asr #2
80019dc8:	41414141 	cmpmi	r1, r1, asr #2
80019dcc:	41414141 	cmpmi	r1, r1, asr #2
80019dd0:	41414141 	cmpmi	r1, r1, asr #2
80019dd4:	41414141 	cmpmi	r1, r1, asr #2
80019dd8:	41414142 	cmpmi	r1, r2, asr #2
80019ddc:	41414141 	cmpmi	r1, r1, asr #2
80019de0:	41414141 	cmpmi	r1, r1, asr #2
80019de4:	41414141 	cmpmi	r1, r1, asr #2
80019de8:	41414242 	cmpmi	r1, r2, asr #4
80019dec:	41414141 	cmpmi	r1, r1, asr #2
80019df0:	41414144 	cmpmi	r1, r4, asr #2
80019df4:	41414141 	cmpmi	r1, r1, asr #2
80019df8:	41414141 	cmpmi	r1, r1, asr #2
80019dfc:	41414141 	cmpmi	r1, r1, asr #2
80019e00:	41414141 	cmpmi	r1, r1, asr #2
80019e04:	41414141 	cmpmi	r1, r1, asr #2
80019e08:	414f504e 	cmpmi	pc, lr, asr #32
80019e0c:	41414141 	cmpmi	r1, r1, asr #2
80019e10:	4141464c 	cmpmi	r1, ip, asr #12
80019e14:	41414141 	cmpmi	r1, r1, asr #2
80019e18:	41414141 	cmpmi	r1, r1, asr #2
80019e1c:	41414141 	cmpmi	r1, r1, asr #2
80019e20:	41414141 	cmpmi	r1, r1, asr #2
80019e24:	41414141 	cmpmi	r1, r1, asr #2
80019e28:	41414142 	cmpmi	r1, r2, asr #2
80019e2c:	41414141 	cmpmi	r1, r1, asr #2
80019e30:	41414141 	cmpmi	r1, r1, asr #2
80019e34:	41414141 	cmpmi	r1, r1, asr #2
80019e38:	00000000 	andeq	r0, r0, r0

80019e3c <SPECIAL_KEY_SEQUENCES>:
80019e3c:	5b1b1001 	blpl	806dde48 <irq_stack_start+0x683e38>
80019e40:	00000041 	andeq	r0, r0, r1, asr #32
80019e44:	5b1b1002 	blpl	806dde54 <irq_stack_start+0x683e44>
80019e48:	00000042 	andeq	r0, r0, r2, asr #32
80019e4c:	5b1b1003 	blpl	806dde60 <irq_stack_start+0x683e50>
80019e50:	00000043 	andeq	r0, r0, r3, asr #32
80019e54:	5b1b1004 	blpl	806dde6c <irq_stack_start+0x683e5c>
80019e58:	00000044 	andeq	r0, r0, r4, asr #32
80019e5c:	007f1005 	rsbseq	r1, pc, r5
80019e60:	00000000 	andeq	r0, r0, r0
80019e64:	00081005 	andeq	r1, r8, r5
80019e68:	00000000 	andeq	r0, r0, r0
80019e6c:	00007830 	andeq	r7, r0, r0, lsr r8
80019e70:	00000040 	andeq	r0, r0, r0, asr #32
80019e74:	00000074 	andeq	r0, r0, r4, ror r0
80019e78:	0000016c 	andeq	r0, r0, ip, ror #2
80019e7c:	0000016c 	andeq	r0, r0, ip, ror #2
80019e80:	0000016c 	andeq	r0, r0, ip, ror #2
80019e84:	0000016c 	andeq	r0, r0, ip, ror #2
80019e88:	0000016c 	andeq	r0, r0, ip, ror #2
80019e8c:	0000016c 	andeq	r0, r0, ip, ror #2
80019e90:	0000016c 	andeq	r0, r0, ip, ror #2
80019e94:	0000016c 	andeq	r0, r0, ip, ror #2
80019e98:	0000016c 	andeq	r0, r0, ip, ror #2
80019e9c:	0000016c 	andeq	r0, r0, ip, ror #2
80019ea0:	0000016c 	andeq	r0, r0, ip, ror #2
80019ea4:	0000016c 	andeq	r0, r0, ip, ror #2
80019ea8:	0000016c 	andeq	r0, r0, ip, ror #2
80019eac:	0000016c 	andeq	r0, r0, ip, ror #2
80019eb0:	00000000 	andeq	r0, r0, r0
80019eb4:	0000016c 	andeq	r0, r0, ip, ror #2
80019eb8:	000000b4 	strheq	r0, [r0], -r4
80019ebc:	0000016c 	andeq	r0, r0, ip, ror #2
80019ec0:	0000016c 	andeq	r0, r0, ip, ror #2
80019ec4:	000000f8 	strdeq	r0, [r0], -r8
80019ec8:	33323130 	teqcc	r2, #48, 2
80019ecc:	37363534 			@ <UNDEFINED> instruction: 0x37363534
80019ed0:	62613938 	rsbvs	r3, r1, #56, 18	@ 0xe0000
80019ed4:	66656463 	strbtvs	r6, [r5], -r3, ror #8
	...

Disassembly of section .stab:

80019ed9 <STAB_BEGIN>:
	...

Disassembly of section .stabstr:

80019eda <STABSTR_BEGIN>:
	...

Disassembly of section .data:

8001c000 <startup_sectiontable>:
8001c000:	00000802 	andeq	r0, r0, r2, lsl #16
8001c004:	00100802 	andseq	r0, r0, r2, lsl #16
8001c008:	00200802 	eoreq	r0, r0, r2, lsl #16
8001c00c:	00300802 	eorseq	r0, r0, r2, lsl #16
8001c010:	00400802 	subeq	r0, r0, r2, lsl #16
8001c014:	00500802 	subseq	r0, r0, r2, lsl #16
8001c018:	00600802 	rsbeq	r0, r0, r2, lsl #16
8001c01c:	00700802 	rsbseq	r0, r0, r2, lsl #16
8001c020:	00800802 	addeq	r0, r0, r2, lsl #16
8001c024:	00900802 	addseq	r0, r0, r2, lsl #16
8001c028:	00a00802 	adceq	r0, r0, r2, lsl #16
8001c02c:	00b00802 	adcseq	r0, r0, r2, lsl #16
8001c030:	00c00802 	sbceq	r0, r0, r2, lsl #16
8001c034:	00d00802 	sbcseq	r0, r0, r2, lsl #16
8001c038:	00e00802 	rsceq	r0, r0, r2, lsl #16
8001c03c:	00f00802 	rscseq	r0, r0, r2, lsl #16
8001c040:	01000802 	tsteq	r0, r2, lsl #16
8001c044:	01100802 	tsteq	r0, r2, lsl #16
8001c048:	01200802 			@ <UNDEFINED> instruction: 0x01200802
8001c04c:	01300802 	teqeq	r0, r2, lsl #16
8001c050:	01400802 	cmpeq	r0, r2, lsl #16
8001c054:	01500802 	cmpeq	r0, r2, lsl #16
8001c058:	01600802 	cmneq	r0, r2, lsl #16
8001c05c:	01700802 	cmneq	r0, r2, lsl #16
8001c060:	01800802 	orreq	r0, r0, r2, lsl #16
8001c064:	01900802 	orrseq	r0, r0, r2, lsl #16
8001c068:	01a00802 	lsleq	r0, r2, #16
8001c06c:	01b00802 	lslseq	r0, r2, #16
8001c070:	01c00802 	biceq	r0, r0, r2, lsl #16
8001c074:	01d00802 	bicseq	r0, r0, r2, lsl #16
8001c078:	01e00802 	mvneq	r0, r2, lsl #16
8001c07c:	01f00802 	mvnseq	r0, r2, lsl #16
	...
8001e000:	00000802 	andeq	r0, r0, r2, lsl #16
8001e004:	00100802 	andseq	r0, r0, r2, lsl #16
8001e008:	00200802 	eoreq	r0, r0, r2, lsl #16
8001e00c:	00300802 	eorseq	r0, r0, r2, lsl #16
8001e010:	00400802 	subeq	r0, r0, r2, lsl #16
8001e014:	00500802 	subseq	r0, r0, r2, lsl #16
8001e018:	00600802 	rsbeq	r0, r0, r2, lsl #16
8001e01c:	00700802 	rsbseq	r0, r0, r2, lsl #16
8001e020:	00800802 	addeq	r0, r0, r2, lsl #16
8001e024:	00900802 	addseq	r0, r0, r2, lsl #16
8001e028:	00a00802 	adceq	r0, r0, r2, lsl #16
8001e02c:	00b00802 	adcseq	r0, r0, r2, lsl #16
8001e030:	00c00802 	sbceq	r0, r0, r2, lsl #16
8001e034:	00d00802 	sbcseq	r0, r0, r2, lsl #16
8001e038:	00e00802 	rsceq	r0, r0, r2, lsl #16
8001e03c:	00f00802 	rscseq	r0, r0, r2, lsl #16
8001e040:	01000802 	tsteq	r0, r2, lsl #16
8001e044:	01100802 	tsteq	r0, r2, lsl #16
8001e048:	01200802 			@ <UNDEFINED> instruction: 0x01200802
8001e04c:	01300802 	teqeq	r0, r2, lsl #16
8001e050:	01400802 	cmpeq	r0, r2, lsl #16
8001e054:	01500802 	cmpeq	r0, r2, lsl #16
8001e058:	01600802 	cmneq	r0, r2, lsl #16
8001e05c:	01700802 	cmneq	r0, r2, lsl #16
8001e060:	01800802 	orreq	r0, r0, r2, lsl #16
8001e064:	01900802 	orrseq	r0, r0, r2, lsl #16
8001e068:	01a00802 	lsleq	r0, r2, #16
8001e06c:	01b00802 	lslseq	r0, r2, #16
8001e070:	01c00802 	biceq	r0, r0, r2, lsl #16
8001e074:	01d00802 	bicseq	r0, r0, r2, lsl #16
8001e078:	01e00802 	mvneq	r0, r2, lsl #16
8001e07c:	01f00802 	mvnseq	r0, r2, lsl #16
	...

Disassembly of section .got:

80020000 <.got>:
80020000:	80008000 	andhi	r8, r0, r0
80020004:	80019ed9 	ldrdhi	r9, [r1], -r9	@ <UNPREDICTABLE>
80020008:	8000b080 	andhi	fp, r0, r0, lsl #1
8002000c:	800280a0 	andhi	r8, r2, r0, lsr #1
80020010:	80020000 	andhi	r0, r2, r0
80020014:	80019eda 	ldrdhi	r9, [r1], -sl
80020018:	80021f5c 	andhi	r1, r2, ip, asr pc
8002001c:	8000cdb4 			@ <UNDEFINED> instruction: 0x8000cdb4
80020020:	8005a010 	andhi	sl, r5, r0, lsl r0
80020024:	80030000 	andhi	r0, r3, r0
80020028:	80059010 	andhi	r9, r5, r0, lsl r0
8002002c:	80008158 	andhi	r8, r0, r8, asr r1
80020030:	8005a010 	andhi	sl, r5, r0, lsl r0
80020034:	8000825c 	andhi	r8, r0, ip, asr r2
80020038:	80019ed9 	ldrdhi	r9, [r1], -r9	@ <UNPREDICTABLE>
8002003c:	80058000 	andhi	r8, r5, r0
80020040:	80028018 	andhi	r8, r2, r8, lsl r0
80020044:	8002c000 	andhi	ip, r2, r0

Disassembly of section .got.plt:

80020048 <_GLOBAL_OFFSET_TABLE_>:
	...

Disassembly of section .data.rel.ro:

80020054 <commands>:
80020054:	8000ce18 	andhi	ip, r0, r8, lsl lr
80020058:	8000ce20 	andhi	ip, r0, r0, lsr #28
8002005c:	800099d8 	ldrdhi	r9, [r0], -r8
80020060:	8000ce40 	andhi	ip, r0, r0, asr #28
80020064:	8000ce4c 	andhi	ip, r0, ip, asr #28
80020068:	800096d0 	ldrdhi	r9, [r0], -r0
8002006c:	8000ce74 	andhi	ip, r0, r4, ror lr
80020070:	8000ce7c 	andhi	ip, r0, ip, ror lr
80020074:	80009aac 	andhi	r9, r0, ip, lsr #21
80020078:	8000ceb0 			@ <UNDEFINED> instruction: 0x8000ceb0
8002007c:	8000cebc 			@ <UNDEFINED> instruction: 0x8000cebc
80020080:	80009b70 	andhi	r9, r0, r0, ror fp
80020084:	8000cee4 	andhi	ip, r0, r4, ror #29
80020088:	8000ceec 	andhi	ip, r0, ip, ror #29
8002008c:	80009ce8 	andhi	r9, r0, r8, ror #25
80020090:	8000cf14 	andhi	ip, r0, r4, lsl pc
80020094:	8000cf1c 	andhi	ip, r0, ip, lsl pc
80020098:	800098f0 	strdhi	r9, [r0], -r0

8002009c <syscall_handler>:
8002009c:	80008230 	andhi	r8, r0, r0, lsr r2
800200a0:	800083a8 	andhi	r8, r0, r8, lsr #7
800200a4:	8000b404 	andhi	fp, r0, r4, lsl #8
800200a8:	8000b53c 	andhi	fp, r0, ip, lsr r5
800200ac:	8000b570 	andhi	fp, r0, r0, ror r5
800200b0:	8000b6bc 			@ <UNDEFINED> instruction: 0x8000b6bc
800200b4:	8000b950 	andhi	fp, r0, r0, asr r9
800200b8:	8000b96c 	andhi	fp, r0, ip, ror #18

800200bc <commands>:
800200bc:	8000d0dc 	ldrdhi	sp, [r0], -ip
800200c0:	8000d0e4 	andhi	sp, r0, r4, ror #1
800200c4:	800099d8 	ldrdhi	r9, [r0], -r8
800200c8:	8000d104 	andhi	sp, r0, r4, lsl #2
800200cc:	8000d110 	andhi	sp, r0, r0, lsl r1
800200d0:	800096d0 	ldrdhi	r9, [r0], -r0
800200d4:	8000d138 	andhi	sp, r0, r8, lsr r1
800200d8:	8000d140 	andhi	sp, r0, r0, asr #2
800200dc:	80009aac 	andhi	r9, r0, ip, lsr #21
800200e0:	8000d174 	andhi	sp, r0, r4, ror r1
800200e4:	8000d180 	andhi	sp, r0, r0, lsl #3
800200e8:	80009b70 	andhi	r9, r0, r0, ror fp
800200ec:	8000d1a8 	andhi	sp, r0, r8, lsr #3
800200f0:	8000d1b0 			@ <UNDEFINED> instruction: 0x8000d1b0
800200f4:	80009ce8 	andhi	r9, r0, r8, ror #25
800200f8:	8000d1d8 	ldrdhi	sp, [r0], -r8
800200fc:	8000d1e0 	andhi	sp, r0, r0, ror #3
80020100:	800098f0 	strdhi	r9, [r0], -r0

80020104 <commands>:
80020104:	8000d37c 	andhi	sp, r0, ip, ror r3
80020108:	8000d384 	andhi	sp, r0, r4, lsl #7
8002010c:	800099d8 	ldrdhi	r9, [r0], -r8
80020110:	8000d3a4 	andhi	sp, r0, r4, lsr #7
80020114:	8000d3b0 			@ <UNDEFINED> instruction: 0x8000d3b0
80020118:	800096d0 	ldrdhi	r9, [r0], -r0
8002011c:	8000d3d8 	ldrdhi	sp, [r0], -r8
80020120:	8000d3e0 	andhi	sp, r0, r0, ror #7
80020124:	80009aac 	andhi	r9, r0, ip, lsr #21
80020128:	8000d414 	andhi	sp, r0, r4, lsl r4
8002012c:	8000d420 	andhi	sp, r0, r0, lsr #8
80020130:	80009b70 	andhi	r9, r0, r0, ror fp
80020134:	8000d448 	andhi	sp, r0, r8, asr #8
80020138:	8000d450 	andhi	sp, r0, r0, asr r4
8002013c:	80009ce8 	andhi	r9, r0, r8, ror #25
80020140:	8000d478 	andhi	sp, r0, r8, ror r4
80020144:	8000d480 	andhi	sp, r0, r0, lsl #9
80020148:	800098f0 	strdhi	r9, [r0], -r0

8002014c <commands>:
8002014c:	8000d624 	andhi	sp, r0, r4, lsr #12
80020150:	8000d62c 	andhi	sp, r0, ip, lsr #12
80020154:	800099d8 	ldrdhi	r9, [r0], -r8
80020158:	8000d64c 	andhi	sp, r0, ip, asr #12
8002015c:	8000d658 	andhi	sp, r0, r8, asr r6
80020160:	800096d0 	ldrdhi	r9, [r0], -r0
80020164:	8000d680 	andhi	sp, r0, r0, lsl #13
80020168:	8000d688 	andhi	sp, r0, r8, lsl #13
8002016c:	80009aac 	andhi	r9, r0, ip, lsr #21
80020170:	8000d6bc 			@ <UNDEFINED> instruction: 0x8000d6bc
80020174:	8000d6c8 	andhi	sp, r0, r8, asr #13
80020178:	80009b70 	andhi	r9, r0, r0, ror fp
8002017c:	8000d6f0 	strdhi	sp, [r0], -r0
80020180:	8000d6f8 	strdhi	sp, [r0], -r8
80020184:	80009ce8 	andhi	r9, r0, r8, ror #25
80020188:	8000d720 	andhi	sp, r0, r0, lsr #14
8002018c:	8000d728 	andhi	sp, r0, r8, lsr #14
80020190:	800098f0 	strdhi	r9, [r0], -r0

80020194 <commands>:
80020194:	8000d77c 	andhi	sp, r0, ip, ror r7
80020198:	8000d784 	andhi	sp, r0, r4, lsl #15
8002019c:	800099d8 	ldrdhi	r9, [r0], -r8
800201a0:	8000d7a4 	andhi	sp, r0, r4, lsr #15
800201a4:	8000d7b0 			@ <UNDEFINED> instruction: 0x8000d7b0
800201a8:	800096d0 	ldrdhi	r9, [r0], -r0
800201ac:	8000d7d8 	ldrdhi	sp, [r0], -r8
800201b0:	8000d7e0 	andhi	sp, r0, r0, ror #15
800201b4:	80009aac 	andhi	r9, r0, ip, lsr #21
800201b8:	8000d814 	andhi	sp, r0, r4, lsl r8
800201bc:	8000d820 	andhi	sp, r0, r0, lsr #16
800201c0:	80009b70 	andhi	r9, r0, r0, ror fp
800201c4:	8000d848 	andhi	sp, r0, r8, asr #16
800201c8:	8000d850 	andhi	sp, r0, r0, asr r8
800201cc:	80009ce8 	andhi	r9, r0, r8, ror #25
800201d0:	8000d878 	andhi	sp, r0, r8, ror r8
800201d4:	8000d880 	andhi	sp, r0, r0, lsl #17
800201d8:	800098f0 	strdhi	r9, [r0], -r0

800201dc <commands>:
800201dc:	8000d8e8 	andhi	sp, r0, r8, ror #17
800201e0:	8000d8f0 	strdhi	sp, [r0], -r0
800201e4:	800099d8 	ldrdhi	r9, [r0], -r8
800201e8:	8000d910 	andhi	sp, r0, r0, lsl r9
800201ec:	8000d91c 	andhi	sp, r0, ip, lsl r9
800201f0:	800096d0 	ldrdhi	r9, [r0], -r0
800201f4:	8000d944 	andhi	sp, r0, r4, asr #18
800201f8:	8000d94c 	andhi	sp, r0, ip, asr #18
800201fc:	80009aac 	andhi	r9, r0, ip, lsr #21
80020200:	8000d980 	andhi	sp, r0, r0, lsl #19
80020204:	8000d98c 	andhi	sp, r0, ip, lsl #19
80020208:	80009b70 	andhi	r9, r0, r0, ror fp
8002020c:	8000d9b4 			@ <UNDEFINED> instruction: 0x8000d9b4
80020210:	8000d9bc 			@ <UNDEFINED> instruction: 0x8000d9bc
80020214:	80009ce8 	andhi	r9, r0, r8, ror #25
80020218:	8000d9e4 	andhi	sp, r0, r4, ror #19
8002021c:	8000d9ec 	andhi	sp, r0, ip, ror #19
80020220:	800098f0 	strdhi	r9, [r0], -r0

80020224 <commands>:
80020224:	8000dacc 	andhi	sp, r0, ip, asr #21
80020228:	8000dad4 	ldrdhi	sp, [r0], -r4
8002022c:	800099d8 	ldrdhi	r9, [r0], -r8
80020230:	8000daf4 	strdhi	sp, [r0], -r4
80020234:	8000db00 	andhi	sp, r0, r0, lsl #22
80020238:	800096d0 	ldrdhi	r9, [r0], -r0
8002023c:	8000db28 	andhi	sp, r0, r8, lsr #22
80020240:	8000db30 	andhi	sp, r0, r0, lsr fp
80020244:	80009aac 	andhi	r9, r0, ip, lsr #21
80020248:	8000db64 	andhi	sp, r0, r4, ror #22
8002024c:	8000db70 	andhi	sp, r0, r0, ror fp
80020250:	80009b70 	andhi	r9, r0, r0, ror fp
80020254:	8000db98 	mulhi	r0, r8, fp
80020258:	8000dba0 	andhi	sp, r0, r0, lsr #23
8002025c:	80009ce8 	andhi	r9, r0, r8, ror #25
80020260:	8000dbc8 	andhi	sp, r0, r8, asr #23
80020264:	8000dbd0 	ldrdhi	sp, [r0], -r0
80020268:	800098f0 	strdhi	r9, [r0], -r0

8002026c <commands>:
8002026c:	8000dfb0 			@ <UNDEFINED> instruction: 0x8000dfb0
80020270:	8000dfb8 			@ <UNDEFINED> instruction: 0x8000dfb8
80020274:	800099d8 	ldrdhi	r9, [r0], -r8
80020278:	8000dfd8 	ldrdhi	sp, [r0], -r8
8002027c:	8000dfe4 	andhi	sp, r0, r4, ror #31
80020280:	800096d0 	ldrdhi	r9, [r0], -r0
80020284:	8000e00c 	andhi	lr, r0, ip
80020288:	8000e014 	andhi	lr, r0, r4, lsl r0
8002028c:	80009aac 	andhi	r9, r0, ip, lsr #21
80020290:	8000e048 	andhi	lr, r0, r8, asr #32
80020294:	8000e054 	andhi	lr, r0, r4, asr r0
80020298:	80009b70 	andhi	r9, r0, r0, ror fp
8002029c:	8000e07c 	andhi	lr, r0, ip, ror r0
800202a0:	8000e084 	andhi	lr, r0, r4, lsl #1
800202a4:	80009ce8 	andhi	r9, r0, r8, ror #25
800202a8:	8000e0ac 	andhi	lr, r0, ip, lsr #1
800202ac:	8000e0b4 	strhhi	lr, [r0], -r4
800202b0:	800098f0 	strdhi	r9, [r0], -r0

800202b4 <commands>:
800202b4:	8000e25c 	andhi	lr, r0, ip, asr r2
800202b8:	8000e264 	andhi	lr, r0, r4, ror #4
800202bc:	800099d8 	ldrdhi	r9, [r0], -r8
800202c0:	8000e284 	andhi	lr, r0, r4, lsl #5
800202c4:	8000e290 	mulhi	r0, r0, r2
800202c8:	800096d0 	ldrdhi	r9, [r0], -r0
800202cc:	8000e2b8 			@ <UNDEFINED> instruction: 0x8000e2b8
800202d0:	8000e2c0 	andhi	lr, r0, r0, asr #5
800202d4:	80009aac 	andhi	r9, r0, ip, lsr #21
800202d8:	8000e2f4 	strdhi	lr, [r0], -r4
800202dc:	8000e300 	andhi	lr, r0, r0, lsl #6
800202e0:	80009b70 	andhi	r9, r0, r0, ror fp
800202e4:	8000e328 	andhi	lr, r0, r8, lsr #6
800202e8:	8000e330 	andhi	lr, r0, r0, lsr r3
800202ec:	80009ce8 	andhi	r9, r0, r8, ror #25
800202f0:	8000e358 	andhi	lr, r0, r8, asr r3
800202f4:	8000e360 	andhi	lr, r0, r0, ror #6
800202f8:	800098f0 	strdhi	r9, [r0], -r0

Disassembly of section .data.rel.ro.local:

800202fc <cpu_mode_string>:
	...
8002033c:	8000cfc4 	andhi	ip, r0, r4, asr #31
80020340:	8000cfcc 	andhi	ip, r0, ip, asr #31
80020344:	8000cfd0 	ldrdhi	ip, [r0], -r0
80020348:	8000cfd4 	ldrdhi	ip, [r0], -r4
	...
80020358:	8000cfe0 	andhi	ip, r0, r0, ror #31
	...
80020368:	8000cfe8 	andhi	ip, r0, r8, ror #31
	...
80020378:	8000cff4 	strdhi	ip, [r0], -r4

8002037c <instruction_set_string>:
8002037c:	8000cffc 	strdhi	ip, [r0], -ip	@ <UNPREDICTABLE>
80020380:	8000d000 	andhi	sp, r0, r0
80020384:	8000d008 	andhi	sp, r0, r8
80020388:	8000d010 	andhi	sp, r0, r0, lsl r0

8002038c <architecture_code_string>:
8002038c:	00000000 	andeq	r0, r0, r0
80020390:	8000d014 	andhi	sp, r0, r4, lsl r0
80020394:	8000d01c 	andhi	sp, r0, ip, lsl r0
80020398:	8000d024 	andhi	sp, r0, r4, lsr #32
8002039c:	8000d02c 	andhi	sp, r0, ip, lsr #32
800203a0:	8000d034 	andhi	sp, r0, r4, lsr r0
800203a4:	8000d040 	andhi	sp, r0, r0, asr #32
800203a8:	8000d04c 	andhi	sp, r0, ip, asr #32
	...

800203cc <implementor_string>:
	...
800204d0:	8000d054 	andhi	sp, r0, r4, asr r0
	...
800204dc:	8000d060 	andhi	sp, r0, r0, rrx
	...
80020500:	8000d080 	andhi	sp, r0, r0, lsl #1
	...
80020524:	8000d0a8 	andhi	sp, r0, r8, lsr #1
	...
80020570:	8000d0c4 	andhi	sp, r0, r4, asr #1
	...

800205cc <cpu_mode_string>:
	...
8002060c:	8000d228 	andhi	sp, r0, r8, lsr #4
80020610:	8000d230 	andhi	sp, r0, r0, lsr r2
80020614:	8000d234 	andhi	sp, r0, r4, lsr r2
80020618:	8000d238 	andhi	sp, r0, r8, lsr r2
	...
80020628:	8000d244 	andhi	sp, r0, r4, asr #4
	...
80020638:	8000d24c 	andhi	sp, r0, ip, asr #4
	...
80020648:	8000d258 	andhi	sp, r0, r8, asr r2

8002064c <instruction_set_string>:
8002064c:	8000d260 	andhi	sp, r0, r0, ror #4
80020650:	8000d264 	andhi	sp, r0, r4, ror #4
80020654:	8000d26c 	andhi	sp, r0, ip, ror #4
80020658:	8000d274 	andhi	sp, r0, r4, ror r2

8002065c <architecture_code_string>:
8002065c:	00000000 	andeq	r0, r0, r0
80020660:	8000d278 	andhi	sp, r0, r8, ror r2
80020664:	8000d280 	andhi	sp, r0, r0, lsl #5
80020668:	8000d288 	andhi	sp, r0, r8, lsl #5
8002066c:	8000d290 	mulhi	r0, r0, r2
80020670:	8000d298 	mulhi	r0, r8, r2
80020674:	8000d2a4 	andhi	sp, r0, r4, lsr #5
80020678:	8000d2b0 			@ <UNDEFINED> instruction: 0x8000d2b0
	...

8002069c <implementor_string>:
	...
800207a0:	8000d2b8 			@ <UNDEFINED> instruction: 0x8000d2b8
	...
800207ac:	8000d2c4 	andhi	sp, r0, r4, asr #5
	...
800207d0:	8000d2e4 	andhi	sp, r0, r4, ror #5
	...
800207f4:	8000d30c 	andhi	sp, r0, ip, lsl #6
	...
80020840:	8000d328 	andhi	sp, r0, r8, lsr #6
	...

8002089c <cpu_mode_string>:
	...
800208dc:	8000d4c8 	andhi	sp, r0, r8, asr #9
800208e0:	8000d4d0 	ldrdhi	sp, [r0], -r0
800208e4:	8000d4d4 	ldrdhi	sp, [r0], -r4
800208e8:	8000d4d8 	ldrdhi	sp, [r0], -r8
	...
800208f8:	8000d4e4 	andhi	sp, r0, r4, ror #9
	...
80020908:	8000d4ec 	andhi	sp, r0, ip, ror #9
	...
80020918:	8000d4f8 	strdhi	sp, [r0], -r8

8002091c <instruction_set_string>:
8002091c:	8000d500 	andhi	sp, r0, r0, lsl #10
80020920:	8000d504 	andhi	sp, r0, r4, lsl #10
80020924:	8000d50c 	andhi	sp, r0, ip, lsl #10
80020928:	8000d514 	andhi	sp, r0, r4, lsl r5

8002092c <architecture_code_string>:
8002092c:	00000000 	andeq	r0, r0, r0
80020930:	8000d518 	andhi	sp, r0, r8, lsl r5
80020934:	8000d520 	andhi	sp, r0, r0, lsr #10
80020938:	8000d528 	andhi	sp, r0, r8, lsr #10
8002093c:	8000d530 	andhi	sp, r0, r0, lsr r5
80020940:	8000d538 	andhi	sp, r0, r8, lsr r5
80020944:	8000d544 	andhi	sp, r0, r4, asr #10
80020948:	8000d550 	andhi	sp, r0, r0, asr r5
	...

8002096c <implementor_string>:
	...
80020a70:	8000d558 	andhi	sp, r0, r8, asr r5
	...
80020a7c:	8000d564 	andhi	sp, r0, r4, ror #10
	...
80020aa0:	8000d584 	andhi	sp, r0, r4, lsl #11
	...
80020ac4:	8000d5ac 	andhi	sp, r0, ip, lsr #11
	...
80020b10:	8000d5c8 	andhi	sp, r0, r8, asr #11
	...

80020b6c <cpu_mode_string>:
	...
80020bac:	8000dc18 	andhi	sp, r0, r8, lsl ip
80020bb0:	8000dc20 	andhi	sp, r0, r0, lsr #24
80020bb4:	8000dc24 	andhi	sp, r0, r4, lsr #24
80020bb8:	8000dc28 	andhi	sp, r0, r8, lsr #24
	...
80020bc8:	8000dc34 	andhi	sp, r0, r4, lsr ip
	...
80020bd8:	8000dc3c 	andhi	sp, r0, ip, lsr ip
	...
80020be8:	8000dc48 	andhi	sp, r0, r8, asr #24

80020bec <instruction_set_string>:
80020bec:	8000dc50 	andhi	sp, r0, r0, asr ip
80020bf0:	8000dc54 	andhi	sp, r0, r4, asr ip
80020bf4:	8000dc5c 	andhi	sp, r0, ip, asr ip
80020bf8:	8000dc64 	andhi	sp, r0, r4, ror #24

80020bfc <architecture_code_string>:
80020bfc:	00000000 	andeq	r0, r0, r0
80020c00:	8000dc68 	andhi	sp, r0, r8, ror #24
80020c04:	8000dc70 	andhi	sp, r0, r0, ror ip
80020c08:	8000dc78 	andhi	sp, r0, r8, ror ip
80020c0c:	8000dc80 	andhi	sp, r0, r0, lsl #25
80020c10:	8000dc88 	andhi	sp, r0, r8, lsl #25
80020c14:	8000dc94 	mulhi	r0, r4, ip
80020c18:	8000dca0 	andhi	sp, r0, r0, lsr #25
	...

80020c3c <implementor_string>:
	...
80020d40:	8000dca8 	andhi	sp, r0, r8, lsr #25
	...
80020d4c:	8000dcb4 			@ <UNDEFINED> instruction: 0x8000dcb4
	...
80020d70:	8000dcd4 	ldrdhi	sp, [r0], -r4
	...
80020d94:	8000dcfc 	strdhi	sp, [r0], -ip
	...
80020de0:	8000dd18 	andhi	sp, r0, r8, lsl sp
	...

80020e3c <cpu_mode_string>:
	...
80020e7c:	8000e148 	andhi	lr, r0, r8, asr #2
80020e80:	8000e150 	andhi	lr, r0, r0, asr r1
80020e84:	8000e154 	andhi	lr, r0, r4, asr r1
80020e88:	8000e158 	andhi	lr, r0, r8, asr r1
	...
80020e98:	8000e164 	andhi	lr, r0, r4, ror #2
	...
80020ea8:	8000e16c 	andhi	lr, r0, ip, ror #2
	...
80020eb8:	8000e178 	andhi	lr, r0, r8, ror r1

80020ebc <instruction_set_string>:
80020ebc:	8000e180 	andhi	lr, r0, r0, lsl #3
80020ec0:	8000e184 	andhi	lr, r0, r4, lsl #3
80020ec4:	8000e18c 	andhi	lr, r0, ip, lsl #3
80020ec8:	8000e194 	mulhi	r0, r4, r1

80020ecc <architecture_code_string>:
80020ecc:	00000000 	andeq	r0, r0, r0
80020ed0:	8000e198 	mulhi	r0, r8, r1
80020ed4:	8000e1a0 	andhi	lr, r0, r0, lsr #3
80020ed8:	8000e1a8 	andhi	lr, r0, r8, lsr #3
80020edc:	8000e1b0 			@ <UNDEFINED> instruction: 0x8000e1b0
80020ee0:	8000e1b8 			@ <UNDEFINED> instruction: 0x8000e1b8
80020ee4:	8000e1c4 	andhi	lr, r0, r4, asr #3
80020ee8:	8000e1d0 	ldrdhi	lr, [r0], -r0
	...

80020f0c <implementor_string>:
	...
80021010:	8000e1d8 	ldrdhi	lr, [r0], -r8
	...
8002101c:	8000e1e4 	andhi	lr, r0, r4, ror #3
	...
80021040:	8000e204 	andhi	lr, r0, r4, lsl #4
	...
80021064:	8000e22c 	andhi	lr, r0, ip, lsr #4
	...
800210b0:	8000e248 	andhi	lr, r0, r8, asr #4
	...

8002110c <cpu_mode_string>:
	...
8002114c:	8000e378 	andhi	lr, r0, r8, ror r3
80021150:	8000e380 	andhi	lr, r0, r0, lsl #7
80021154:	8000e384 	andhi	lr, r0, r4, lsl #7
80021158:	8000e388 	andhi	lr, r0, r8, lsl #7
	...
80021168:	8000e394 	mulhi	r0, r4, r3
	...
80021178:	8000e39c 	mulhi	r0, ip, r3
	...
80021188:	8000e3a8 	andhi	lr, r0, r8, lsr #7

8002118c <instruction_set_string>:
8002118c:	8000e3b0 			@ <UNDEFINED> instruction: 0x8000e3b0
80021190:	8000e3b4 			@ <UNDEFINED> instruction: 0x8000e3b4
80021194:	8000e3bc 			@ <UNDEFINED> instruction: 0x8000e3bc
80021198:	8000e3c4 	andhi	lr, r0, r4, asr #7

8002119c <architecture_code_string>:
8002119c:	00000000 	andeq	r0, r0, r0
800211a0:	8000e3c8 	andhi	lr, r0, r8, asr #7
800211a4:	8000e3d0 	ldrdhi	lr, [r0], -r0
800211a8:	8000e3d8 	ldrdhi	lr, [r0], -r8
800211ac:	8000e3e0 	andhi	lr, r0, r0, ror #7
800211b0:	8000e3e8 	andhi	lr, r0, r8, ror #7
800211b4:	8000e3f4 	strdhi	lr, [r0], -r4
800211b8:	8000e400 	andhi	lr, r0, r0, lsl #8
	...

800211dc <implementor_string>:
	...
800212e0:	8000e408 	andhi	lr, r0, r8, lsl #8
	...
800212ec:	8000e414 	andhi	lr, r0, r4, lsl r4
	...
80021310:	8000e434 	andhi	lr, r0, r4, lsr r4
	...
80021334:	8000e45c 	andhi	lr, r0, ip, asr r4
	...
80021380:	8000e478 	andhi	lr, r0, r8, ror r4
	...

800213dc <cpu_mode_string>:
	...
8002141c:	8000e4dc 	ldrdhi	lr, [r0], -ip
80021420:	8000e4e4 	andhi	lr, r0, r4, ror #9
80021424:	8000e4e8 	andhi	lr, r0, r8, ror #9
80021428:	8000e4ec 	andhi	lr, r0, ip, ror #9
	...
80021438:	8000e4f8 	strdhi	lr, [r0], -r8
	...
80021448:	8000e500 	andhi	lr, r0, r0, lsl #10
	...
80021458:	8000e50c 	andhi	lr, r0, ip, lsl #10

8002145c <instruction_set_string>:
8002145c:	8000e514 	andhi	lr, r0, r4, lsl r5
80021460:	8000e518 	andhi	lr, r0, r8, lsl r5
80021464:	8000e520 	andhi	lr, r0, r0, lsr #10
80021468:	8000e528 	andhi	lr, r0, r8, lsr #10

8002146c <architecture_code_string>:
8002146c:	00000000 	andeq	r0, r0, r0
80021470:	8000e52c 	andhi	lr, r0, ip, lsr #10
80021474:	8000e534 	andhi	lr, r0, r4, lsr r5
80021478:	8000e53c 	andhi	lr, r0, ip, lsr r5
8002147c:	8000e544 	andhi	lr, r0, r4, asr #10
80021480:	8000e54c 	andhi	lr, r0, ip, asr #10
80021484:	8000e558 	andhi	lr, r0, r8, asr r5
80021488:	8000e564 	andhi	lr, r0, r4, ror #10
	...

800214ac <implementor_string>:
	...
800215b0:	8000e56c 	andhi	lr, r0, ip, ror #10
	...
800215bc:	8000e578 	andhi	lr, r0, r8, ror r5
	...
800215e0:	8000e598 	mulhi	r0, r8, r5
	...
80021604:	8000e5c0 	andhi	lr, r0, r0, asr #11
	...
80021650:	8000e5dc 	ldrdhi	lr, [r0], -ip
	...

800216ac <cpu_mode_string>:
	...
800216ec:	8000e5f0 	strdhi	lr, [r0], -r0
800216f0:	8000e5f8 	strdhi	lr, [r0], -r8
800216f4:	8000e5fc 	strdhi	lr, [r0], -ip
800216f8:	8000e600 	andhi	lr, r0, r0, lsl #12
	...
80021708:	8000e60c 	andhi	lr, r0, ip, lsl #12
	...
80021718:	8000e614 	andhi	lr, r0, r4, lsl r6
	...
80021728:	8000e620 	andhi	lr, r0, r0, lsr #12

8002172c <instruction_set_string>:
8002172c:	8000e628 	andhi	lr, r0, r8, lsr #12
80021730:	8000e62c 	andhi	lr, r0, ip, lsr #12
80021734:	8000e634 	andhi	lr, r0, r4, lsr r6
80021738:	8000e63c 	andhi	lr, r0, ip, lsr r6

8002173c <architecture_code_string>:
8002173c:	00000000 	andeq	r0, r0, r0
80021740:	8000e640 	andhi	lr, r0, r0, asr #12
80021744:	8000e648 	andhi	lr, r0, r8, asr #12
80021748:	8000e650 	andhi	lr, r0, r0, asr r6
8002174c:	8000e658 	andhi	lr, r0, r8, asr r6
80021750:	8000e660 	andhi	lr, r0, r0, ror #12
80021754:	8000e66c 	andhi	lr, r0, ip, ror #12
80021758:	8000e678 	andhi	lr, r0, r8, ror r6
	...

8002177c <implementor_string>:
	...
80021880:	8000e680 	andhi	lr, r0, r0, lsl #13
	...
8002188c:	8000e68c 	andhi	lr, r0, ip, lsl #13
	...
800218b0:	8000e6ac 	andhi	lr, r0, ip, lsr #13
	...
800218d4:	8000e6d4 	ldrdhi	lr, [r0], -r4
	...
80021920:	8000e6f0 	strdhi	lr, [r0], -r0
	...

8002197c <cpu_mode_string>:
	...
800219bc:	8000e704 	andhi	lr, r0, r4, lsl #14
800219c0:	8000e70c 	andhi	lr, r0, ip, lsl #14
800219c4:	8000e710 	andhi	lr, r0, r0, lsl r7
800219c8:	8000e714 	andhi	lr, r0, r4, lsl r7
	...
800219d8:	8000e720 	andhi	lr, r0, r0, lsr #14
	...
800219e8:	8000e728 	andhi	lr, r0, r8, lsr #14
	...
800219f8:	8000e734 	andhi	lr, r0, r4, lsr r7

800219fc <instruction_set_string>:
800219fc:	8000e73c 	andhi	lr, r0, ip, lsr r7
80021a00:	8000e740 	andhi	lr, r0, r0, asr #14
80021a04:	8000e748 	andhi	lr, r0, r8, asr #14
80021a08:	8000e750 	andhi	lr, r0, r0, asr r7

80021a0c <architecture_code_string>:
80021a0c:	00000000 	andeq	r0, r0, r0
80021a10:	8000e754 	andhi	lr, r0, r4, asr r7
80021a14:	8000e75c 	andhi	lr, r0, ip, asr r7
80021a18:	8000e764 	andhi	lr, r0, r4, ror #14
80021a1c:	8000e76c 	andhi	lr, r0, ip, ror #14
80021a20:	8000e774 	andhi	lr, r0, r4, ror r7
80021a24:	8000e780 	andhi	lr, r0, r0, lsl #15
80021a28:	8000e78c 	andhi	lr, r0, ip, lsl #15
	...

80021a4c <implementor_string>:
	...
80021b50:	8000e794 	mulhi	r0, r4, r7
	...
80021b5c:	8000e7a0 	andhi	lr, r0, r0, lsr #15
	...
80021b80:	8000e7c0 	andhi	lr, r0, r0, asr #15
	...
80021ba4:	8000e7e8 	andhi	lr, r0, r8, ror #15
	...
80021bf0:	8000e804 	andhi	lr, r0, r4, lsl #16
	...

80021c4c <cpu_mode_string>:
	...
80021c8c:	8000e818 	andhi	lr, r0, r8, lsl r8
80021c90:	8000e820 	andhi	lr, r0, r0, lsr #16
80021c94:	8000e824 	andhi	lr, r0, r4, lsr #16
80021c98:	8000e828 	andhi	lr, r0, r8, lsr #16
	...
80021ca8:	8000e834 	andhi	lr, r0, r4, lsr r8
	...
80021cb8:	8000e83c 	andhi	lr, r0, ip, lsr r8
	...
80021cc8:	8000e848 	andhi	lr, r0, r8, asr #16

80021ccc <instruction_set_string>:
80021ccc:	8000e850 	andhi	lr, r0, r0, asr r8
80021cd0:	8000e854 	andhi	lr, r0, r4, asr r8
80021cd4:	8000e85c 	andhi	lr, r0, ip, asr r8
80021cd8:	8000e864 	andhi	lr, r0, r4, ror #16

80021cdc <architecture_code_string>:
80021cdc:	00000000 	andeq	r0, r0, r0
80021ce0:	8000e868 	andhi	lr, r0, r8, ror #16
80021ce4:	8000e870 	andhi	lr, r0, r0, ror r8
80021ce8:	8000e878 	andhi	lr, r0, r8, ror r8
80021cec:	8000e880 	andhi	lr, r0, r0, lsl #17
80021cf0:	8000e888 	andhi	lr, r0, r8, lsl #17
80021cf4:	8000e894 	mulhi	r0, r4, r8
80021cf8:	8000e8a0 	andhi	lr, r0, r0, lsr #17
	...

80021d1c <implementor_string>:
	...
80021e20:	8000e8a8 	andhi	lr, r0, r8, lsr #17
	...
80021e2c:	8000e8b4 			@ <UNDEFINED> instruction: 0x8000e8b4
	...
80021e50:	8000e8d4 	ldrdhi	lr, [r0], -r4
	...
80021e74:	8000e8fc 	strdhi	lr, [r0], -ip
	...
80021ec0:	8000e918 	andhi	lr, r0, r8, lsl r9
	...

Disassembly of section .data.rel:

80021f1c <kernel_mappings>:
80021f1c:	80000000 	andhi	r0, r0, r0
80021f20:	00000000 	andeq	r0, r0, r0
80021f24:	0005a010 	andeq	sl, r5, r0, lsl r0
80021f28:	00000055 	andeq	r0, r0, r5, asr r0
80021f2c:	c0000000 	andgt	r0, r0, r0
80021f30:	20000000 	andcs	r0, r0, r0
80021f34:	20400000 	subcs	r0, r0, r0
80021f38:	00000055 	andeq	r0, r0, r5, asr r0
80021f3c:	ffff0000 			@ <UNDEFINED> instruction: 0xffff0000
80021f40:	00000000 	andeq	r0, r0, r0
80021f44:	00001000 	andeq	r1, r0, r0
80021f48:	00000055 	andeq	r0, r0, r5, asr r0
80021f4c:	8025a010 	eorhi	sl, r5, r0, lsl r0
80021f50:	0025a010 	eoreq	sl, r5, r0, lsl r0
80021f54:	1ff00000 	svcne	0x00f00000	@ IMB
80021f58:	00000055 	andeq	r0, r0, r5, asr r0

Disassembly of section .data.rel.local:

80021f5c <user_programs>:
80021f5c:	8000e9ec 	andhi	lr, r0, ip, ror #19
80021f60:	800109f0 	strdhi	r0, [r1], -r0	@ <UNPREDICTABLE>
	...
80022f5c:	8001108c 	andhi	r1, r1, ip, lsl #1
80022f60:	80013090 	mulhi	r1, r0, r0
	...
80023f5c:	80013794 	mulhi	r1, r4, r7
80023f60:	80015798 	mulhi	r1, r8, r7
	...
80024f5c:	800159a4 	andhi	r5, r1, r4, lsr #19
80024f60:	800179a8 	andhi	r7, r1, r8, lsr #19
	...
80025f5c:	80017c14 	andhi	r7, r1, r4, lsl ip
80025f60:	80019c18 	andhi	r9, r1, r8, lsl ip
	...

Disassembly of section .ARM.attributes:

00000000 <.ARM.attributes>:
   0:	00002a41 	andeq	r2, r0, r1, asr #20
   4:	61656100 	cmnvs	r5, r0, lsl #2
   8:	01006962 	tsteq	r0, r2, ror #18
   c:	00000020 	andeq	r0, r0, r0, lsr #32
  10:	5a4b3605 	bpl	12cd82c <start_address+0x12c582c>
  14:	08070600 	stmdaeq	r7, {r9, sl}
  18:	12010901 	andne	r0, r1, #16384	@ 0x4000
  1c:	15011404 	strne	r1, [r1, #-1028]	@ 0xfffffbfc
  20:	18031701 	stmdane	r3, {r0, r8, r9, sl, ip}
  24:	22011a01 	andcs	r1, r1, #4096	@ 0x1000
  28:	Address 0x28 is out of bounds.


Disassembly of section .comment:

00000000 <.comment>:
   0:	3a434347 	bcc	10d0d24 <start_address+0x10c8d24>
   4:	72412820 	subvc	r2, r1, #32, 16	@ 0x200000
   8:	52206863 	eorpl	r6, r0, #6488064	@ 0x630000
   c:	736f7065 	cmnvc	pc, #101	@ 0x65
  10:	726f7469 	rsbvc	r7, pc, #1761607680	@ 0x69000000
  14:	31202979 			@ <UNDEFINED> instruction: 0x31202979
  18:	2e322e34 	mrccs	14, 1, r2, cr2, cr4, {1}
  1c:	Address 0x1c is out of bounds.


Disassembly of section .debug_line:

00000000 <.debug_line>:
   0:	0000007c 	andeq	r0, r0, ip, ror r0
   4:	00040005 	andeq	r0, r4, r5
   8:	0000002e 	andeq	r0, r0, lr, lsr #32
   c:	fb010102 	blx	4041e <start_address+0x3841e>
  10:	01000d0e 	tsteq	r0, lr, lsl #26
  14:	00010101 	andeq	r0, r1, r1, lsl #2
  18:	00010000 	andeq	r0, r1, r0
  1c:	01010100 	mrseq	r0, (UNDEF: 17)
  20:	0000021f 	andeq	r0, r0, pc, lsl r2
  24:	001e0000 	andseq	r0, lr, r0
  28:	01020000 	mrseq	r0, (UNDEF: 2)
  2c:	020f021f 	andeq	r0, pc, #-268435455	@ 0xf0000001
  30:	00000025 	andeq	r0, r0, r5, lsr #32
  34:	00002501 	andeq	r2, r0, r1, lsl #10
  38:	05000100 	streq	r0, [r0, #-256]	@ 0xffffff00
  3c:	00800002 	addeq	r0, r0, r2
  40:	2f2f1780 	svccs	0x002f1780
  44:	2f2f2f2f 	svccs	0x002f2f2f
  48:	2f2f2f31 	svccs	0x002f2f31
  4c:	2f2f2f2f 	svccs	0x002f2f2f
  50:	2f312f2f 	svccs	0x00312f2f
  54:	2f2f312f 	svccs	0x002f312f
  58:	302f2f2f 	eorcc	r2, pc, pc, lsr #30
  5c:	2f2f2f31 	svccs	0x002f2f31
  60:	6c2f2f2f 	stcvs	15, cr2, [pc], #-188	@ ffffffac <irq_stack_start+0x7ffa5f9c>
  64:	2f2fd72f 	svccs	0x002fd72f
  68:	d72f2f31 			@ <UNDEFINED> instruction: 0xd72f2f31
  6c:	44032f2f 	strmi	r2, [r3], #-3887	@ 0xfffff0d1
  70:	2e0c032e 	cdpcs	3, 0, cr0, cr12, cr14, {1}
  74:	2f2e0a03 	svccs	0x002e0a03
  78:	022e2103 	eoreq	r2, lr, #-1073741824	@ 0xc0000000
  7c:	01010002 	tsteq	r1, r2
  80:	0000006f 	andeq	r0, r0, pc, rrx
  84:	00040005 	andeq	r0, r4, r5
  88:	0000002e 	andeq	r0, r0, lr, lsr #32
  8c:	fb010102 	blx	4049e <start_address+0x3849e>
  90:	01000d0e 	tsteq	r0, lr, lsl #26
  94:	00010101 	andeq	r0, r1, r1, lsl #2
  98:	00010000 	andeq	r0, r1, r0
  9c:	01010100 	mrseq	r0, (UNDEF: 17)
  a0:	0000021f 	andeq	r0, r0, pc, lsl r2
  a4:	001e0000 	andseq	r0, lr, r0
  a8:	01020000 	mrseq	r0, (UNDEF: 2)
  ac:	020f021f 	andeq	r0, pc, #-268435455	@ 0xf0000001
  b0:	0000002f 	andeq	r0, r0, pc, lsr #32
  b4:	00002f01 	andeq	r2, r0, r1, lsl #30
  b8:	05000100 	streq	r0, [r0, #-256]	@ 0xffffff00
  bc:	008ce002 	addeq	lr, ip, r2
  c0:	2f2f1680 	svccs	0x002f1680
  c4:	2f2f322f 	svccs	0x002f322f
  c8:	322f2f2f 	eorcc	r2, pc, #47, 30	@ 0xbc
  cc:	2f2f2f2f 	svccs	0x002f2f2f
  d0:	322f2f2f 	eorcc	r2, pc, #47, 30	@ 0xbc
  d4:	322f322f 	eorcc	r3, pc, #-268435454	@ 0xf0000002
  d8:	322f322f 	eorcc	r3, pc, #-268435454	@ 0xf0000002
  dc:	322f322f 	eorcc	r3, pc, #-268435454	@ 0xf0000002
  e0:	322f322f 	eorcc	r3, pc, #-268435454	@ 0xf0000002
  e4:	322f322f 	eorcc	r3, pc, #-268435454	@ 0xf0000002
  e8:	2f2f322f 	svccs	0x002f322f
  ec:	02022f2f 	andeq	r2, r2, #47, 30	@ 0xbc
  f0:	5d010100 	stcpl	1, cr0, [r1, #-0]
  f4:	05000000 	streq	r0, [r0, #-0]
  f8:	2e000400 	cdpcs	4, 0, cr0, cr0, cr0, {0}
  fc:	02000000 	andeq	r0, r0, #0
 100:	0efb0101 	cdpeq	1, 15, cr0, cr11, cr1, {0}
 104:	0101000d 	tsteq	r1, sp
 108:	00000101 	andeq	r0, r0, r1, lsl #2
 10c:	00000100 	andeq	r0, r0, r0, lsl #2
 110:	1f010101 	svcne	0x00010101
 114:	00000002 	andeq	r0, r0, r2
 118:	00003800 	andeq	r3, r0, r0, lsl #16
 11c:	1f010200 	svcne	0x00010200
 120:	44020f02 	strmi	r0, [r2], #-3842	@ 0xfffff0fe
 124:	01000000 	mrseq	r0, (UNDEF: 0)
 128:	00000044 	andeq	r0, r0, r4, asr #32
 12c:	02050001 	andeq	r0, r5, #1
 130:	8000b014 	andhi	fp, r0, r4, lsl r0
 134:	2f2f2f14 	svccs	0x002f2f14
 138:	2f2f2f2f 	svccs	0x002f2f2f
 13c:	2f2f2f2f 	svccs	0x002f2f2f
 140:	2f2f2f2f 	svccs	0x002f2f2f
 144:	2f2f2f32 	svccs	0x002f2f32
 148:	2f2f2f2f 	svccs	0x002f2f2f
 14c:	022f312f 	eoreq	r3, pc, #-1073741813	@ 0xc000000b
 150:	01010002 	tsteq	r1, r2

Disassembly of section .debug_line_str:

00000000 <.debug_line_str>:
   0:	6d6f682f 	stclvs	8, cr6, [pc, #-188]!	@ ffffff4c <irq_stack_start+0x7ffa5f3c>
   4:	68632f65 	stmdavs	r3!, {r0, r2, r5, r6, r8, r9, sl, fp, sp}^
   8:	73686775 	cmnvc	r8, #30670848	@ 0x1d40000
   c:	2f726574 	svccs	0x00726574
  10:	65646f43 	strbvs	r6, [r4, #-3907]!	@ 0xfffff0bd
  14:	6165522f 	cmnvs	r5, pc, lsr #4
  18:	4f726570 	svcmi	0x00726570
  1c:	656b0053 	strbvs	r0, [fp, #-83]!	@ 0xffffffad
  20:	6c656e72 	stclvs	14, cr6, [r5], #-456	@ 0xfffffe38
  24:	61747300 	cmnvs	r4, r0, lsl #6
  28:	70757472 	rsbsvc	r7, r5, r2, ror r4
  2c:	7300532e 	movwvc	r5, #814	@ 0x32e
  30:	65747379 	ldrbvs	r7, [r4, #-889]!	@ 0xfffffc87
  34:	00532e6d 	subseq	r2, r3, sp, ror #28
  38:	6e72656b 	cdpvs	5, 7, cr6, cr2, cr11, {3}
  3c:	702f6c65 	eorvc	r6, pc, r5, ror #24
  40:	00636f72 	rsbeq	r6, r3, r2, ror pc
  44:	65766173 	ldrbvs	r6, [r6, #-371]!	@ 0xfffffe8d
  48:	6e6f635f 	mcrvs	3, 3, r6, cr15, cr15, {2}
  4c:	74786574 	ldrbtvc	r6, [r8], #-1396	@ 0xfffffa8c
  50:	Address 0x50 is out of bounds.


Disassembly of section .debug_info:

00000000 <.debug_info>:
   0:	00000021 	andeq	r0, r0, r1, lsr #32
   4:	04010005 	streq	r0, [r1], #-5
   8:	00000000 	andeq	r0, r0, r0
   c:	00000001 	andeq	r0, r0, r1
  10:	00800000 	addeq	r0, r0, r0
  14:	00028080 	andeq	r8, r2, r0, lsl #1
  18:	11000000 	mrsne	r0, (UNDEF: 0)
  1c:	2f000000 	svccs	0x00000000
  20:	01000000 	mrseq	r0, (UNDEF: 0)
  24:	00002180 	andeq	r2, r0, r0, lsl #3
  28:	01000500 	tsteq	r0, r0, lsl #10
  2c:	00001404 	andeq	r1, r0, r4, lsl #8
  30:	00800100 	addeq	r0, r0, r0, lsl #2
  34:	8ce00000 	stclhi	0, cr0, [r0]
  38:	01b48000 			@ <UNDEFINED> instruction: 0x01b48000
  3c:	0000003b 	andeq	r0, r0, fp, lsr r0
  40:	00000011 	andeq	r0, r0, r1, lsl r0
  44:	0000002f 	andeq	r0, r0, pc, lsr #32
  48:	00208001 	eoreq	r8, r0, r1
  4c:	00050000 	andeq	r0, r5, r0
  50:	00280401 	eoreq	r0, r8, r1, lsl #8
  54:	f3010000 	vhadd.u8	d0, d1, d0
  58:	14000000 	strne	r0, [r0], #-0
  5c:	6c8000b0 	stcvs	0, cr0, [r0], {176}	@ 0xb0
  60:	0000004b 	andeq	r0, r0, fp, asr #32
  64:	00000011 	andeq	r0, r0, r1, lsl r0
  68:	0000002f 	andeq	r0, r0, pc, lsr #32
  6c:	Address 0x6c is out of bounds.


Disassembly of section .debug_abbrev:

00000000 <.debug_abbrev>:
   0:	10001101 	andne	r1, r0, r1, lsl #2
   4:	12011117 	andne	r1, r1, #-1073741819	@ 0xc0000005
   8:	1b0e030f 	blne	380c4c <start_address+0x378c4c>
   c:	130e250e 	movwne	r2, #58638	@ 0xe50e
  10:	00000005 	andeq	r0, r0, r5
  14:	10001101 	andne	r1, r0, r1, lsl #2
  18:	12011117 	andne	r1, r1, #-1073741819	@ 0xc0000005
  1c:	1b0e030f 	blne	380c60 <start_address+0x378c60>
  20:	130e250e 	movwne	r2, #58638	@ 0xe50e
  24:	00000005 	andeq	r0, r0, r5
  28:	10001101 	andne	r1, r0, r1, lsl #2
  2c:	12011117 	andne	r1, r1, #-1073741819	@ 0xc0000005
  30:	1b0e030f 	blne	380c74 <start_address+0x378c74>
  34:	130e250e 	movwne	r2, #58638	@ 0xe50e
  38:	00000005 	andeq	r0, r0, r5

Disassembly of section .debug_aranges:

00000000 <.debug_aranges>:
   0:	0000001c 	andeq	r0, r0, ip, lsl r0
   4:	00000002 	andeq	r0, r0, r2
   8:	00040000 	andeq	r0, r4, r0
   c:	00000000 	andeq	r0, r0, r0
  10:	80008000 	andhi	r8, r0, r0
  14:	00000100 	andeq	r0, r0, r0, lsl #2
	...
  20:	0000001c 	andeq	r0, r0, ip, lsl r0
  24:	00250002 	eoreq	r0, r5, r2
  28:	00040000 	andeq	r0, r4, r0
  2c:	00000000 	andeq	r0, r0, r0
  30:	80008ce0 	andhi	r8, r0, r0, ror #25
  34:	000000b4 	strheq	r0, [r0], -r4
	...
  40:	0000001c 	andeq	r0, r0, ip, lsl r0
  44:	004a0002 	subeq	r0, sl, r2
  48:	00040000 	andeq	r0, r4, r0
  4c:	00000000 	andeq	r0, r0, r0
  50:	8000b014 	andhi	fp, r0, r4, lsl r0
  54:	0000006c 	andeq	r0, r0, ip, rrx
	...

Disassembly of section .debug_str:

00000000 <.debug_str>:
   0:	6e72656b 	cdpvs	5, 7, cr6, cr2, cr11, {3}
   4:	732f6c65 			@ <UNDEFINED> instruction: 0x732f6c65
   8:	74726174 	ldrbtvc	r6, [r2], #-372	@ 0xfffffe8c
   c:	532e7075 			@ <UNDEFINED> instruction: 0x532e7075
  10:	6f682f00 	svcvs	0x00682f00
  14:	632f656d 			@ <UNDEFINED> instruction: 0x632f656d
  18:	68677568 	stmdavs	r7!, {r3, r5, r6, r8, sl, ip, sp, lr}^
  1c:	72657473 	rsbvc	r7, r5, #1929379840	@ 0x73000000
  20:	646f432f 	strbtvs	r4, [pc], #-815	@ 28 <start_address-0x7fd8>
  24:	65522f65 	ldrbvs	r2, [r2, #-3941]	@ 0xfffff09b
  28:	72657061 	rsbvc	r7, r5, #97	@ 0x61
  2c:	4700534f 	strmi	r5, [r0, -pc, asr #6]
  30:	4120554e 			@ <UNDEFINED> instruction: 0x4120554e
  34:	2e322053 	mrccs	0, 1, r2, cr2, cr3, {2}
  38:	6b003334 	blvs	cd10 <start_address+0x4d10>
  3c:	656e7265 	strbvs	r7, [lr, #-613]!	@ 0xfffffd9b
  40:	79732f6c 	ldmdbvc	r3!, {r2, r3, r5, r6, r8, r9, sl, fp, sp}^
  44:	6d657473 	stclvs	4, cr7, [r5, #-460]!	@ 0xfffffe34
  48:	6b00532e 	blvs	14d08 <start_address+0xcd08>
  4c:	656e7265 	strbvs	r7, [lr, #-613]!	@ 0xfffffd9b
  50:	72702f6c 	rsbsvc	r2, r0, #108, 30	@ 0x1b0
  54:	732f636f 			@ <UNDEFINED> instruction: 0x732f636f
  58:	5f657661 	svcpl	0x00657661
  5c:	746e6f63 	strbtvc	r6, [lr], #-3939	@ 0xfffff09d
  60:	2e747865 	cdpcs	8, 7, cr7, cr4, cr5, {3}
  64:	Address 0x64 is out of bounds.

