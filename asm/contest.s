	.include "constants/gba_constants.inc"
	.include "asm/macros.inc"

	.syntax unified

	.text

	thumb_func_start sub_80B1F4C
sub_80B1F4C: @ 80B1F4C
	push {r4,r5,lr}
	lsls r0, 24
	lsrs r5, r0, 24
	ldr r2, _080B1F7C @ =gTasks
	lsls r0, r5, 2
	adds r0, r5
	lsls r0, 3
	adds r3, r0, r2
	ldrh r0, [r3, 0x1C]
	adds r1, r0, 0x1
	strh r1, [r3, 0x1C]
	lsls r0, 16
	cmp r0, 0
	blt _080B1FC4
	movs r0, 0
	strh r0, [r3, 0x1C]
	movs r1, 0xC
	ldrsh r0, [r3, r1]
	cmp r0, 0
	ble _080B1F80
	ldrh r0, [r3, 0xA]
	adds r0, 0x1
	b _080B1F84
	.align 2, 0
_080B1F7C: .4byte gTasks
_080B1F80:
	ldrh r0, [r3, 0xA]
	subs r0, 0x1
_080B1F84:
	strh r0, [r3, 0xA]
	lsls r4, r5, 2
	adds r4, r5
	lsls r4, 3
	adds r4, r2
	ldrb r2, [r4, 0xA]
	ldrh r3, [r4, 0x8]
	movs r0, 0x11
	movs r1, 0x1
	bl BlendPalette
	ldrb r2, [r4, 0xA]
	ldrh r3, [r4, 0x8]
	movs r0, 0x1A
	movs r1, 0x1
	bl BlendPalette
	movs r2, 0xA
	ldrsh r1, [r4, r2]
	movs r2, 0xE
	ldrsh r0, [r4, r2]
	cmp r1, r0
	bne _080B1FC4
	adds r0, r5, 0
	bl DestroyTask
	ldr r2, _080B1FCC @ =gSharedMem + 0x19204
	ldrb r1, [r2, 0x7]
	movs r0, 0x2
	negs r0, r0
	ands r0, r1
	strb r0, [r2, 0x7]
_080B1FC4:
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080B1FCC: .4byte gSharedMem + 0x19204
	thumb_func_end sub_80B1F4C

	thumb_func_start sub_80B1FD0
sub_80B1FD0: @ 80B1FD0
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	lsls r0, 24
	lsrs r0, 24
	mov r8, r0
	movs r5, 0
	ldr r0, _080B204C @ =gSharedMem + 0x19260
	ldr r6, _080B2050 @ =gSprites
	adds r4, r0, 0
	adds r4, 0xD8
	adds r7, r0, 0
_080B1FE8:
	ldrb r1, [r7, 0x10]
	movs r0, 0xC0
	ands r0, r1
	cmp r0, 0
	beq _080B2064
	mov r0, r8
	cmp r0, 0
	beq _080B2064
	lsls r0, r5, 24
	lsrs r0, 24
	bl sub_80B208C
	ldrb r2, [r4, 0x1]
	lsls r1, r2, 4
	adds r1, r2
	lsls r1, 2
	adds r1, r6
	ldrh r1, [r1, 0x4]
	lsls r1, 22
	lsrs r1, 17
	ldr r2, _080B2054 @ =0x060100a0
	adds r1, r2
	ldr r2, _080B2058 @ =REG_BG0HOFS
	bl CpuSet
	ldrb r0, [r4, 0x1]
	lsls r1, r0, 4
	adds r1, r0
	lsls r1, 2
	adds r1, r6
	ldr r2, _080B205C @ =gUnknown_083CA33C
	ldr r0, _080B2060 @ =gUnknown_02038696
	adds r0, r5, r0
	ldrb r0, [r0]
	adds r0, r2
	ldrb r0, [r0]
	strh r0, [r1, 0x22]
	ldrb r1, [r4, 0x1]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r6
	adds r0, 0x3E
	ldrb r1, [r0]
	movs r3, 0x5
	negs r3, r3
	adds r2, r3, 0
	ands r1, r2
	b _080B2076
	.align 2, 0
_080B204C: .4byte gSharedMem + 0x19260
_080B2050: .4byte gSprites
_080B2054: .4byte 0x060100a0
_080B2058: .4byte REG_BG0HOFS
_080B205C: .4byte gUnknown_083CA33C
_080B2060: .4byte gUnknown_02038696
_080B2064:
	ldrb r1, [r4, 0x1]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r6
	adds r0, 0x3E
	ldrb r1, [r0]
	movs r2, 0x4
	orrs r1, r2
_080B2076:
	strb r1, [r0]
	adds r4, 0x4
	adds r7, 0x1C
	adds r5, 0x1
	cmp r5, 0x3
	ble _080B1FE8
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r0}
	bx r0
	thumb_func_end sub_80B1FD0

	thumb_func_start sub_80B208C
sub_80B208C: @ 80B208C
	push {lr}
	lsls r0, 24
	lsrs r0, 24
	lsls r1, r0, 3
	subs r1, r0
	lsls r1, 2
	ldr r0, _080B20B0 @ =gSharedMem + 0x19260
	adds r2, r1, r0
	ldrb r1, [r2, 0x10]
	movs r0, 0xC0
	ands r0, r1
	cmp r0, 0x40
	bne _080B20B8
	ldrb r0, [r2, 0x19]
	lsls r0, 6
	ldr r1, _080B20B4 @ =gContestNextTurnNumbersGfx
	adds r0, r1
	b _080B20BA
	.align 2, 0
_080B20B0: .4byte gSharedMem + 0x19260
_080B20B4: .4byte gContestNextTurnNumbersGfx
_080B20B8:
	ldr r0, _080B20C0 @ =gContestNextTurnRandomGfx
_080B20BA:
	pop {r1}
	bx r1
	.align 2, 0
_080B20C0: .4byte gContestNextTurnRandomGfx
	thumb_func_end sub_80B208C

	thumb_func_start sub_80B20C4
sub_80B20C4: @ 80B20C4
	push {r4-r7,lr}
	movs r6, 0
	ldr r7, _080B2134 @ =gSharedMem + 0x192DD
_080B20CA:
	adds r0, r6, r7
	ldrb r0, [r0]
	cmp r0, 0
	beq _080B2126
	lsls r0, r6, 24
	lsrs r5, r0, 24
	adds r0, r5, 0
	bl sub_80AF59C
	lsls r0, 24
	cmp r0, 0
	bne _080B2126
	ldr r0, _080B2138 @ =gUnknown_02038696
	adds r0, r6, r0
	ldrb r0, [r0]
	lsls r4, r0, 2
	adds r4, r0
	adds r4, 0x2
	lsls r4, 24
	lsrs r4, 24
	adds r0, r5, 0
	movs r1, 0x3
	bl sub_80AEFE8
	lsls r0, 16
	lsrs r0, 16
	lsls r4, 6
	ldr r2, _080B213C @ =0x0600c028
	adds r1, r4, r2
	strh r0, [r1]
	ldr r1, _080B2140 @ =0x0600c02a
	adds r2, r4, r1
	adds r1, r0, 0x1
	strh r1, [r2]
	ldr r1, _080B2144 @ =0x0600c068
	adds r2, r4, r1
	adds r1, r0, 0
	adds r1, 0x10
	strh r1, [r2]
	ldr r2, _080B2148 @ =0x0600c06a
	adds r4, r2
	adds r0, 0x11
	strh r0, [r4]
	movs r0, 0x63
	bl PlaySE
_080B2126:
	adds r6, 0x1
	cmp r6, 0x3
	ble _080B20CA
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080B2134: .4byte gSharedMem + 0x192DD
_080B2138: .4byte gUnknown_02038696
_080B213C: .4byte 0x0600c028
_080B2140: .4byte 0x0600c02a
_080B2144: .4byte 0x0600c068
_080B2148: .4byte 0x0600c06a
	thumb_func_end sub_80B20C4

	thumb_func_start sub_80B214C
sub_80B214C: @ 80B214C
	push {lr}
	lsls r0, 24
	lsrs r0, 24
	lsls r1, r0, 3
	subs r1, r0
	lsls r1, 2
	ldr r0, _080B2178 @ =gSharedMem + 0x19260
	adds r2, r1, r0
	ldrb r1, [r2, 0x15]
	movs r3, 0x1
	adds r0, r3, 0
	ands r0, r1
	cmp r0, 0
	bne _080B2172
	ldrb r1, [r2, 0xC]
	adds r0, r3, 0
	ands r0, r1
	cmp r0, 0
	beq _080B217C
_080B2172:
	movs r0, 0
	b _080B217E
	.align 2, 0
_080B2178: .4byte gSharedMem + 0x19260
_080B217C:
	movs r0, 0x1
_080B217E:
	pop {r1}
	bx r1
	thumb_func_end sub_80B214C

	thumb_func_start sub_80B2184
sub_80B2184: @ 80B2184
	push {r4-r7,lr}
	sub sp, 0x4
	ldr r4, _080B2250 @ =REG_BG1CNT
	ldrb r1, [r4]
	movs r0, 0x4
	negs r0, r0
	ands r0, r1
	strb r0, [r4]
	ldrb r1, [r4, 0x1]
	movs r0, 0x3F
	ands r0, r1
	movs r1, 0x40
	orrs r0, r1
	strb r0, [r4, 0x1]
	ldrb r1, [r4, 0x1]
	movs r0, 0x21
	negs r0, r0
	ands r0, r1
	strb r0, [r4, 0x1]
	ldr r0, _080B2254 @ =gUnknown_030042C0
	movs r2, 0xF0
	strh r2, [r0]
	ldr r0, _080B2258 @ =gUnknown_030041B4
	movs r1, 0xA0
	strh r1, [r0]
	ldr r0, _080B225C @ =REG_BG1HOFS
	strh r2, [r0]
	adds r0, 0x2
	strh r1, [r0]
	ldr r1, _080B2260 @ =0x0600f000
	movs r0, 0
	str r0, [sp]
	ldr r0, _080B2264 @ =0x040000d4
	mov r2, sp
	str r2, [r0]
	str r1, [r0, 0x4]
	ldr r2, _080B2268 @ =0x85000400
	str r2, [r0, 0x8]
	ldr r0, [r0, 0x8]
	ldr r0, _080B226C @ =gUnknown_08D17C3C
	bl LZDecompressVram
	ldrb r1, [r4]
	movs r2, 0xD
	negs r2, r2
	adds r0, r2, 0
	ands r0, r1
	strb r0, [r4]
	movs r4, 0
	ldr r6, _080B2270 @ =gSprites
	adds r7, r2, 0
	movs r5, 0x4
	ldr r3, _080B2274 @ =gSharedMem + 0x19338
_080B21EE:
	ldrb r0, [r3]
	lsls r1, r0, 4
	adds r1, r0
	lsls r1, 2
	adds r1, r6
	ldrb r2, [r1, 0x5]
	adds r0, r7, 0
	ands r0, r2
	orrs r0, r5
	strb r0, [r1, 0x5]
	ldrb r0, [r3, 0x1]
	lsls r1, r0, 4
	adds r1, r0
	lsls r1, 2
	adds r1, r6
	ldrb r2, [r1, 0x5]
	adds r0, r7, 0
	ands r0, r2
	orrs r0, r5
	strb r0, [r1, 0x5]
	adds r3, 0x4
	adds r4, 0x1
	cmp r4, 0x3
	ble _080B21EE
	ldr r3, _080B2278 @ =REG_BG2CNT
	ldrb r2, [r3]
	movs r1, 0x4
	negs r1, r1
	adds r0, r1, 0
	ands r0, r2
	movs r4, 0x1
	orrs r0, r4
	strb r0, [r3]
	ldr r2, _080B227C @ =REG_BG0CNT
	ldrb r0, [r2]
	ands r1, r0
	orrs r1, r4
	strb r1, [r2]
	adds r2, 0x2
	ldrb r1, [r2, 0x1]
	movs r0, 0x3F
	ands r0, r1
	movs r1, 0x80
	orrs r0, r1
	strb r0, [r2, 0x1]
	add sp, 0x4
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080B2250: .4byte REG_BG1CNT
_080B2254: .4byte gUnknown_030042C0
_080B2258: .4byte gUnknown_030041B4
_080B225C: .4byte REG_BG1HOFS
_080B2260: .4byte 0x0600f000
_080B2264: .4byte 0x040000d4
_080B2268: .4byte 0x85000400
_080B226C: .4byte gUnknown_08D17C3C
_080B2270: .4byte gSprites
_080B2274: .4byte gSharedMem + 0x19338
_080B2278: .4byte REG_BG2CNT
_080B227C: .4byte REG_BG0CNT
	thumb_func_end sub_80B2184

	thumb_func_start sub_80B2280
sub_80B2280: @ 80B2280
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	sub sp, 0x4
	ldr r2, _080B2358 @ =0x06008000
	movs r3, 0x80
	lsls r3, 6
	ldr r0, _080B235C @ =gUnknown_030042C0
	mov r12, r0
	ldr r0, _080B2360 @ =gUnknown_030041B4
	mov r8, r0
	movs r5, 0
	ldr r1, _080B2364 @ =0x040000d4
	movs r4, 0x80
	lsls r4, 5
	ldr r6, _080B2368 @ =0x85000400
	movs r7, 0x85
	lsls r7, 24
_080B22A4:
	str r5, [sp]
	mov r0, sp
	str r0, [r1]
	str r2, [r1, 0x4]
	str r6, [r1, 0x8]
	ldr r0, [r1, 0x8]
	adds r2, r4
	subs r3, r4
	cmp r3, r4
	bhi _080B22A4
	str r5, [sp]
	mov r0, sp
	str r0, [r1]
	str r2, [r1, 0x4]
	lsrs r0, r3, 2
	orrs r0, r7
	str r0, [r1, 0x8]
	ldr r0, [r1, 0x8]
	ldr r1, _080B236C @ =0x0600f000
	movs r2, 0
	str r2, [sp]
	ldr r0, _080B2364 @ =0x040000d4
	mov r3, sp
	str r3, [r0]
	str r1, [r0, 0x4]
	ldr r1, _080B2368 @ =0x85000400
	str r1, [r0, 0x8]
	ldr r0, [r0, 0x8]
	mov r0, r12
	strh r2, [r0]
	mov r3, r8
	strh r2, [r3]
	ldr r2, _080B2370 @ =REG_BG1CNT
	ldrb r1, [r2]
	movs r0, 0x4
	negs r0, r0
	ands r0, r1
	movs r1, 0x1
	orrs r0, r1
	strb r0, [r2]
	ldrb r1, [r2, 0x1]
	movs r0, 0x3F
	ands r0, r1
	strb r0, [r2, 0x1]
	ldrb r1, [r2, 0x1]
	movs r0, 0x21
	negs r0, r0
	ands r0, r1
	strb r0, [r2, 0x1]
	ldrb r1, [r2]
	movs r3, 0xD
	negs r3, r3
	adds r0, r3, 0
	ands r0, r1
	movs r1, 0x8
	orrs r0, r1
	strb r0, [r2]
	movs r4, 0
	ldr r5, _080B2374 @ =gSprites
	adds r6, r3, 0
	ldr r3, _080B2378 @ =gSharedMem + 0x19338
_080B231E:
	ldrb r0, [r3]
	lsls r1, r0, 4
	adds r1, r0
	lsls r1, 2
	adds r1, r5
	ldrb r2, [r1, 0x5]
	adds r0, r6, 0
	ands r0, r2
	strb r0, [r1, 0x5]
	ldrb r0, [r3, 0x1]
	lsls r1, r0, 4
	adds r1, r0
	lsls r1, 2
	adds r1, r5
	ldrb r2, [r1, 0x5]
	adds r0, r6, 0
	ands r0, r2
	strb r0, [r1, 0x5]
	adds r3, 0x4
	adds r4, 0x1
	cmp r4, 0x3
	ble _080B231E
	add sp, 0x4
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080B2358: .4byte 0x06008000
_080B235C: .4byte gUnknown_030042C0
_080B2360: .4byte gUnknown_030041B4
_080B2364: .4byte 0x040000d4
_080B2368: .4byte 0x85000400
_080B236C: .4byte 0x0600f000
_080B2370: .4byte REG_BG1CNT
_080B2374: .4byte gSprites
_080B2378: .4byte gSharedMem + 0x19338
	thumb_func_end sub_80B2280

	thumb_func_start sub_80B237C
sub_80B237C: @ 80B237C
	push {r4,lr}
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	ldr r1, _080B23AC @ =gUnknown_030042C0
	movs r0, 0
	strh r0, [r1]
	ldr r1, _080B23B0 @ =gUnknown_030041B4
	movs r0, 0xA0
	strh r0, [r1]
	movs r0, 0x62
	movs r1, 0
	bl PlaySE12WithPanning
	ldr r1, _080B23B4 @ =gTasks
	lsls r0, r4, 2
	adds r0, r4
	lsls r0, 3
	adds r0, r1
	ldr r1, _080B23B8 @ =sub_80B23BC
	str r1, [r0]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080B23AC: .4byte gUnknown_030042C0
_080B23B0: .4byte gUnknown_030041B4
_080B23B4: .4byte gTasks
_080B23B8: .4byte sub_80B23BC
	thumb_func_end sub_80B237C

	thumb_func_start sub_80B23BC
sub_80B23BC: @ 80B23BC
	push {lr}
	lsls r0, 24
	lsrs r3, r0, 24
	ldr r1, _080B23F4 @ =gUnknown_030041B4
	ldrh r0, [r1]
	subs r0, 0x7
	strh r0, [r1]
	lsls r0, 16
	cmp r0, 0
	bge _080B23D4
	movs r0, 0
	strh r0, [r1]
_080B23D4:
	ldrh r2, [r1]
	cmp r2, 0
	bne _080B23EE
	ldr r0, _080B23F8 @ =gTasks
	lsls r1, r3, 2
	adds r1, r3
	lsls r1, 3
	adds r1, r0
	strh r2, [r1, 0x8]
	strh r2, [r1, 0xA]
	strh r2, [r1, 0xC]
	ldr r0, _080B23FC @ =sub_80B2400
	str r0, [r1]
_080B23EE:
	pop {r0}
	bx r0
	.align 2, 0
_080B23F4: .4byte gUnknown_030041B4
_080B23F8: .4byte gTasks
_080B23FC: .4byte sub_80B2400
	thumb_func_end sub_80B23BC

	thumb_func_start sub_80B2400
sub_80B2400: @ 80B2400
	push {r4-r6,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	ldr r1, _080B2424 @ =gTasks
	lsls r3, r4, 2
	adds r0, r3, r4
	lsls r0, 3
	adds r5, r0, r1
	movs r0, 0x8
	ldrsh r1, [r5, r0]
	cmp r1, 0x1
	beq _080B247C
	cmp r1, 0x1
	bgt _080B2428
	cmp r1, 0
	beq _080B2432
	b _080B24FC
	.align 2, 0
_080B2424: .4byte gTasks
_080B2428:
	cmp r1, 0x2
	beq _080B24D6
	cmp r1, 0x3
	beq _080B24EC
	b _080B24FC
_080B2432:
	movs r2, 0
	adds r6, r3, 0
	ldr r5, _080B2470 @ =gSharedMem + 0x19218
	ldr r3, _080B2474 @ =gUnknown_02038696
_080B243A:
	adds r0, r2, r5
	adds r1, r2, r3
	ldrb r1, [r1]
	strb r1, [r0]
	adds r2, 0x1
	cmp r2, 0x3
	ble _080B243A
	bl sub_80AFA5C
	bl sub_80B0588
	bl sub_80AEF50
	bl sub_80B1118
	movs r0, 0x1
	bl sub_80B1FD0
	bl sub_80AFFA0
	ldr r0, _080B2478 @ =gTasks
	adds r1, r6, r4
	lsls r1, 3
	adds r1, r0
	movs r0, 0x1
	strh r0, [r1, 0x8]
	b _080B24FC
	.align 2, 0
_080B2470: .4byte gSharedMem + 0x19218
_080B2474: .4byte gUnknown_02038696
_080B2478: .4byte gTasks
_080B247C:
	ldr r0, _080B24C0 @ =gIsLinkContest
	ldrb r0, [r0]
	ands r1, r0
	cmp r1, 0
	beq _080B24D0
	ldr r2, _080B24C4 @ =gSharedMem + 0x19204
	ldrb r0, [r2, 0x7]
	movs r1, 0x4
	orrs r0, r1
	strb r0, [r2, 0x7]
	bl sub_80AE074
	lsls r0, 24
	cmp r0, 0
	beq _080B249E
	bl sub_80AF438
_080B249E:
	ldr r4, _080B24C8 @ =sub_80C8C80
	adds r0, r4, 0
	movs r1, 0
	bl CreateTask
	lsls r0, 24
	lsrs r0, 24
	ldr r2, _080B24CC @ =sub_80AD8DC
	adds r1, r4, 0
	bl SetTaskFuncWithFollowupFunc
	bl sub_80AF860
	movs r0, 0x2
	strh r0, [r5, 0x8]
	b _080B24FC
	.align 2, 0
_080B24C0: .4byte gIsLinkContest
_080B24C4: .4byte gSharedMem + 0x19204
_080B24C8: .4byte sub_80C8C80
_080B24CC: .4byte sub_80AD8DC
_080B24D0:
	bl sub_80AF438
	b _080B24E2
_080B24D6:
	ldr r0, _080B24E8 @ =gSharedMem + 0x19204
	ldrb r1, [r0, 0x7]
	movs r0, 0x4
	ands r0, r1
	cmp r0, 0
	bne _080B24FC
_080B24E2:
	movs r0, 0x3
	strh r0, [r5, 0x8]
	b _080B24FC
	.align 2, 0
_080B24E8: .4byte gSharedMem + 0x19204
_080B24EC:
	bl sub_80AF120
	bl sub_80AEB30
	movs r0, 0
	strh r0, [r5, 0x8]
	ldr r0, _080B2504 @ =sub_80B253C
	str r0, [r5]
_080B24FC:
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_080B2504: .4byte sub_80B253C
	thumb_func_end sub_80B2400

	thumb_func_start sub_80B2508
sub_80B2508: @ 80B2508
	push {lr}
	lsls r0, 24
	lsrs r2, r0, 24
	ldr r1, _080B2530 @ =gUnknown_030041B4
	ldrh r0, [r1]
	adds r0, 0x7
	strh r0, [r1]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0xA0
	ble _080B252C
	ldr r0, _080B2534 @ =gTasks
	lsls r1, r2, 2
	adds r1, r2
	lsls r1, 3
	adds r1, r0
	ldr r0, _080B2538 @ =sub_80ADCDC
	str r0, [r1]
_080B252C:
	pop {r0}
	bx r0
	.align 2, 0
_080B2530: .4byte gUnknown_030041B4
_080B2534: .4byte gTasks
_080B2538: .4byte sub_80ADCDC
	thumb_func_end sub_80B2508

	thumb_func_start sub_80B253C
sub_80B253C: @ 80B253C
	push {r4,lr}
	lsls r0, 24
	lsrs r0, 24
	ldr r2, _080B255C @ =gTasks
	lsls r1, r0, 2
	adds r1, r0
	lsls r1, 3
	adds r1, r2
	ldrh r2, [r1, 0xC]
	movs r3, 0xC
	ldrsh r0, [r1, r3]
	cmp r0, 0x9
	bgt _080B2560
	adds r0, r2, 0x1
	strh r0, [r1, 0xC]
	b _080B259C
	.align 2, 0
_080B255C: .4byte gTasks
_080B2560:
	ldrh r3, [r1, 0xA]
	movs r4, 0xA
	ldrsh r0, [r1, r4]
	cmp r0, 0
	bne _080B257E
	ldrh r2, [r1, 0x8]
	movs r4, 0x8
	ldrsh r0, [r1, r4]
	cmp r0, 0x10
	bne _080B257A
	adds r0, r3, 0x1
	strh r0, [r1, 0xA]
	b _080B259C
_080B257A:
	adds r0, r2, 0x1
	b _080B259A
_080B257E:
	ldrh r0, [r1, 0x8]
	movs r3, 0x8
	ldrsh r2, [r1, r3]
	cmp r2, 0
	bne _080B2598
	strh r2, [r1, 0xA]
	strh r2, [r1, 0xC]
	ldr r0, _080B2594 @ =sub_80B25A4
	str r0, [r1]
	b _080B259C
	.align 2, 0
_080B2594: .4byte sub_80B25A4
_080B2598:
	subs r0, 0x1
_080B259A:
	strh r0, [r1, 0x8]
_080B259C:
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end sub_80B253C

	thumb_func_start sub_80B25A4
sub_80B25A4: @ 80B25A4
	push {r4,lr}
	lsls r0, 24
	lsrs r0, 24
	ldr r2, _080B25C4 @ =gTasks
	lsls r1, r0, 2
	adds r1, r0
	lsls r1, 3
	adds r4, r1, r2
	ldrh r1, [r4, 0xC]
	movs r2, 0xC
	ldrsh r0, [r4, r2]
	cmp r0, 0x9
	bgt _080B25C8
	adds r0, r1, 0x1
	strh r0, [r4, 0xC]
	b _080B25D8
	.align 2, 0
_080B25C4: .4byte gTasks
_080B25C8:
	movs r0, 0
	strh r0, [r4, 0xC]
	movs r0, 0x61
	movs r1, 0
	bl PlaySE12WithPanning
	ldr r0, _080B25E0 @ =sub_80B2508
	str r0, [r4]
_080B25D8:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080B25E0: .4byte sub_80B2508
	thumb_func_end sub_80B25A4

	thumb_func_start sub_80B25E4
sub_80B25E4: @ 80B25E4
	push {r4-r7,lr}
	mov r7, r9
	mov r6, r8
	push {r6,r7}
	lsls r0, 24
	lsrs r0, 24
	mov r9, r0
	movs r6, 0
	ldr r5, _080B26B4 @ =gSprites
_080B25F6:
	bl AllocOamMatrix
	lsls r1, r6, 2
	ldr r2, _080B26B8 @ =gSharedMem + 0x19338
	mov r8, r2
	adds r4, r1, r2
	ldrb r1, [r4]
	lsls r3, r1, 4
	adds r3, r1
	lsls r3, 2
	adds r3, r5
	lsls r0, 24
	lsrs r0, 24
	movs r1, 0x1F
	ands r0, r1
	lsls r0, 1
	ldrb r1, [r3, 0x3]
	movs r7, 0x3F
	negs r7, r7
	adds r2, r7, 0
	ands r1, r2
	orrs r1, r0
	strb r1, [r3, 0x3]
	ldrb r1, [r4]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r5
	ldrb r2, [r0, 0x1]
	movs r3, 0x4
	negs r3, r3
	adds r1, r3, 0
	ands r2, r1
	movs r1, 0x1
	orrs r2, r1
	strb r2, [r0, 0x1]
	ldrb r1, [r4]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r5
	mov r1, r9
	bl StartSpriteAffineAnim
	mov r7, r9
	cmp r7, 0x2
	bne _080B267A
	ldrb r1, [r4]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r5
	bl AnimateSprite
	ldrb r1, [r4]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r5
	adds r0, 0x3E
	ldrb r1, [r0]
	movs r3, 0x5
	negs r3, r3
	adds r2, r3, 0
	ands r1, r2
	strb r1, [r0]
_080B267A:
	adds r6, 0x1
	cmp r6, 0x3
	ble _080B25F6
	ldr r0, _080B26BC @ =sub_80B26C8
	movs r1, 0x5
	bl CreateTask
	lsls r0, 24
	lsrs r0, 24
	ldr r2, _080B26C0 @ =gTasks
	lsls r1, r0, 2
	adds r1, r0
	lsls r1, 3
	adds r1, r2
	mov r7, r9
	strh r7, [r1, 0x8]
	ldr r2, _080B26C4 @ =0xfffffecc
	add r2, r8
	ldrb r0, [r2, 0x7]
	movs r1, 0x2
	orrs r0, r1
	strb r0, [r2, 0x7]
	pop {r3,r4}
	mov r8, r3
	mov r9, r4
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080B26B4: .4byte gSprites
_080B26B8: .4byte gSharedMem + 0x19338
_080B26BC: .4byte sub_80B26C8
_080B26C0: .4byte gTasks
_080B26C4: .4byte 0xfffffecc
	thumb_func_end sub_80B25E4

	thumb_func_start sub_80B26C8
sub_80B26C8: @ 80B26C8
	push {r4-r6,lr}
	lsls r0, 24
	lsrs r6, r0, 24
	ldr r2, _080B2750 @ =gSprites
	ldr r4, _080B2754 @ =gSharedMem + 0x19338
	ldrb r1, [r4]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r2
	adds r0, 0x3F
	ldrb r0, [r0]
	lsls r0, 26
	cmp r0, 0
	bge _080B274A
	ldr r0, _080B2758 @ =gTasks
	lsls r1, r6, 2
	adds r1, r6
	lsls r1, 3
	adds r1, r0
	ldrb r0, [r1, 0x8]
	cmp r0, 0x1
	bne _080B2718
	adds r5, r2, 0
	movs r3, 0x4
	adds r2, r4, 0
	movs r4, 0x3
_080B26FE:
	ldrb r0, [r2]
	lsls r1, r0, 4
	adds r1, r0
	lsls r1, 2
	adds r1, r5
	adds r1, 0x3E
	ldrb r0, [r1]
	orrs r0, r3
	strb r0, [r1]
	adds r2, 0x4
	subs r4, 0x1
	cmp r4, 0
	bge _080B26FE
_080B2718:
	movs r4, 0
_080B271A:
	lsls r0, r4, 2
	ldr r5, _080B2754 @ =gSharedMem + 0x19338
	adds r0, r5
	ldrb r1, [r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	ldr r1, _080B2750 @ =gSprites
	adds r0, r1
	bl FreeSpriteOamMatrix
	adds r4, 0x1
	cmp r4, 0x3
	ble _080B271A
	ldr r0, _080B275C @ =0xfffffecc
	adds r2, r5, r0
	ldrb r1, [r2, 0x7]
	movs r0, 0x3
	negs r0, r0
	ands r0, r1
	strb r0, [r2, 0x7]
	adds r0, r6, 0
	bl DestroyTask
_080B274A:
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_080B2750: .4byte gSprites
_080B2754: .4byte gSharedMem + 0x19338
_080B2758: .4byte gTasks
_080B275C: .4byte 0xfffffecc
	thumb_func_end sub_80B26C8

	thumb_func_start sub_80B2760
sub_80B2760: @ 80B2760
	push {lr}
	lsls r0, 16
	lsrs r1, r0, 16
	movs r0, 0xB1
	lsls r0, 1
	cmp r1, r0
	bls _080B2770
	movs r1, 0x1
_080B2770:
	adds r0, r1, 0
	pop {r1}
	bx r1
	thumb_func_end sub_80B2760

	thumb_func_start sub_80B2778
sub_80B2778: @ 80B2778
	push {lr}
	lsls r0, 16
	lsrs r1, r0, 16
	ldr r0, _080B278C @ =0x0000019b
	cmp r1, r0
	bls _080B2786
	movs r1, 0
_080B2786:
	adds r0, r1, 0
	pop {r1}
	bx r1
	.align 2, 0
_080B278C: .4byte 0x0000019b
	thumb_func_end sub_80B2778

	thumb_func_start sub_80B2790
sub_80B2790: @ 80B2790
	push {r4-r7,lr}
	lsls r0, 24
	lsrs r6, r0, 24
	lsls r0, r6, 3
	subs r0, r6
	lsls r0, 2
	ldr r4, _080B27F0 @ =gSharedMem + 0x19260
	adds r0, r4
	ldrh r0, [r0, 0x6]
	bl sub_80B2760
	lsls r0, 16
	lsrs r5, r0, 16
	ldr r1, _080B27F4 @ =gContestMons
	lsls r0, r6, 6
	adds r0, r1
	ldrh r0, [r0]
	bl sub_80B2778
	lsls r0, 16
	lsrs r7, r0, 16
	adds r4, 0xE8
	adds r0, r4, 0
	movs r1, 0
	movs r2, 0x14
	bl memset
	bl battle_anim_clear_some_data
	ldr r1, _080B27F8 @ =gBattleMonForms
	movs r2, 0
	adds r0, r1, 0x3
_080B27D0:
	strb r2, [r0]
	subs r0, 0x1
	cmp r0, r1
	bge _080B27D0
	cmp r5, 0x90
	beq _080B2848
	cmp r5, 0x90
	bgt _080B2806
	cmp r5, 0x4C
	beq _080B2898
	cmp r5, 0x4C
	bgt _080B27FC
	cmp r5, 0xD
	beq _080B2898
	b _080B28BE
	.align 2, 0
_080B27F0: .4byte gSharedMem + 0x19260
_080B27F4: .4byte gContestMons
_080B27F8: .4byte gBattleMonForms
_080B27FC:
	cmp r5, 0x82
	beq _080B2898
	cmp r5, 0x8F
	beq _080B2898
	b _080B28BE
_080B2806:
	cmp r5, 0xD8
	beq _080B2880
	cmp r5, 0xD8
	bgt _080B2814
	cmp r5, 0xAE
	beq _080B2822
	b _080B28BE
_080B2814:
	cmp r5, 0xDA
	beq _080B288C
	movs r0, 0x88
	lsls r0, 1
	cmp r5, r0
	beq _080B2848
	b _080B28BE
_080B2822:
	ldr r0, _080B2840 @ =gBaseStats
	lsls r1, r7, 3
	subs r1, r7
	lsls r1, 2
	adds r1, r0
	ldrb r0, [r1, 0x6]
	cmp r0, 0x7
	beq _080B2838
	ldrb r0, [r1, 0x7]
	cmp r0, 0x7
	bne _080B28B8
_080B2838:
	ldr r1, _080B2844 @ =gUnknown_0202F7C4
	movs r0, 0
	b _080B28BC
	.align 2, 0
_080B2840: .4byte gBaseStats
_080B2844: .4byte gUnknown_0202F7C4
_080B2848:
	lsls r0, r6, 3
	subs r0, r6
	lsls r0, 2
	ldr r4, _080B2878 @ =gSharedMem + 0x19260
	adds r0, r4
	ldrb r5, [r0, 0x1B]
	ldr r6, _080B287C @ =gContestMons
	lsls r5, 6
	adds r0, r5, r6
	ldrh r0, [r0]
	bl sub_80B2778
	adds r4, 0xE8
	strh r0, [r4, 0x2]
	adds r6, 0x38
	adds r5, r6
	ldr r0, [r5]
	str r0, [r4, 0x10]
	ldrb r0, [r4, 0x4]
	movs r1, 0x1
	orrs r0, r1
	strb r0, [r4, 0x4]
	b _080B28BE
	.align 2, 0
_080B2878: .4byte gSharedMem + 0x19260
_080B287C: .4byte gContestMons
_080B2880:
	ldr r1, _080B2888 @ =gHappinessMoveAnim
	movs r0, 0xFF
	b _080B28BC
	.align 2, 0
_080B2888: .4byte gHappinessMoveAnim
_080B288C:
	ldr r1, _080B2894 @ =gHappinessMoveAnim
	movs r0, 0
	b _080B28BC
	.align 2, 0
_080B2894: .4byte gHappinessMoveAnim
_080B2898:
	ldr r0, _080B28B0 @ =gSharedMem + 0x19204
	adds r2, r0, 0
	adds r2, 0x5A
	ldrb r1, [r2]
	cmp r1, 0
	bne _080B28B8
	movs r0, 0x2
	strb r0, [r2]
	ldr r0, _080B28B4 @ =gUnknown_0202F7C4
	strb r1, [r0]
	b _080B28BE
	.align 2, 0
_080B28B0: .4byte gSharedMem + 0x19204
_080B28B4: .4byte gUnknown_0202F7C4
_080B28B8:
	ldr r1, _080B28C8 @ =gUnknown_0202F7C4
	movs r0, 0x1
_080B28BC:
	strb r0, [r1]
_080B28BE:
	bl sub_80B2968
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080B28C8: .4byte gUnknown_0202F7C4
	thumb_func_end sub_80B2790

	thumb_func_start sub_80B28CC
sub_80B28CC: @ 80B28CC
	push {r4,lr}
	ldr r4, _080B28EC @ =gSharedMem + 0x19348
	adds r0, r4, 0
	movs r1, 0
	movs r2, 0x14
	bl memset
	subs r4, 0xEA
	ldrb r0, [r4]
	cmp r0, 0
	beq _080B28E6
	subs r0, 0x1
	strb r0, [r4]
_080B28E6:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080B28EC: .4byte gSharedMem + 0x19348
	thumb_func_end sub_80B28CC

	thumb_func_start sub_80B28F0
sub_80B28F0: @ 80B28F0
	push {r4-r6,lr}
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	ldr r6, _080B2924 @ =gSharedMem + 0x19348
	strb r4, [r6, 0x5]
	ldr r5, _080B2928 @ =gContestMons
	lsls r4, 6
	adds r0, r4, r5
	ldrh r0, [r0]
	bl sub_80B2778
	strh r0, [r6]
	adds r0, r5, 0
	adds r0, 0x38
	adds r0, r4, r0
	ldr r0, [r0]
	str r0, [r6, 0x8]
	adds r5, 0x3C
	adds r4, r5
	ldr r0, [r4]
	str r0, [r6, 0xC]
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_080B2924: .4byte gSharedMem + 0x19348
_080B2928: .4byte gContestMons
	thumb_func_end sub_80B28F0

	thumb_func_start sub_80B292C
sub_80B292C: @ 80B292C
	push {lr}
	ldr r0, _080B2958 @ =SpriteCallbackDummy
	bl CreateInvisibleSpriteWithCallback
	ldr r1, _080B295C @ =gObjectBankIDs
	strb r0, [r1, 0x3]
	ldr r0, _080B2960 @ =gBankTarget
	ldrb r0, [r0]
	adds r0, r1
	ldrb r1, [r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	ldr r1, _080B2964 @ =gSprites
	adds r0, r1
	bl InitSpriteAffineAnim
	bl sub_80B2968
	pop {r0}
	bx r0
	.align 2, 0
_080B2958: .4byte SpriteCallbackDummy
_080B295C: .4byte gObjectBankIDs
_080B2960: .4byte gBankTarget
_080B2964: .4byte gSprites
	thumb_func_end sub_80B292C

	thumb_func_start sub_80B2968
sub_80B2968: @ 80B2968
	push {r4,lr}
	ldr r0, _080B29AC @ =gObjectBankIDs
	ldrb r0, [r0, 0x3]
	lsls r4, r0, 4
	adds r4, r0
	lsls r4, 2
	ldr r0, _080B29B0 @ =gSprites
	adds r4, r0
	movs r0, 0
	strh r0, [r4, 0x24]
	strh r0, [r4, 0x26]
	movs r0, 0x3
	movs r1, 0
	bl sub_8077ABC
	lsls r0, 24
	lsrs r0, 24
	strh r0, [r4, 0x20]
	movs r0, 0x3
	movs r1, 0x1
	bl sub_8077ABC
	lsls r0, 24
	lsrs r0, 24
	strh r0, [r4, 0x22]
	adds r4, 0x3E
	ldrb r0, [r4]
	movs r1, 0x4
	orrs r0, r1
	strb r0, [r4]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080B29AC: .4byte gObjectBankIDs
_080B29B0: .4byte gSprites
	thumb_func_end sub_80B2968

	thumb_func_start sub_80B29B4
sub_80B29B4: @ 80B29B4
	push {lr}
	lsls r0, 16
	lsrs r0, 16
	ldr r2, _080B29D4 @ =gBattleMoves
	lsls r1, r0, 1
	adds r1, r0
	lsls r1, 2
	adds r1, r2
	ldrb r0, [r1, 0x6]
	cmp r0, 0x20
	bhi _080B2A6C
	lsls r0, 2
	ldr r1, _080B29D8 @ =_080B29DC
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_080B29D4: .4byte gBattleMoves
_080B29D8: .4byte _080B29DC
	.align 2, 0
_080B29DC:
	.4byte _080B2A6C
	.4byte _080B2A6C
	.4byte _080B2A60
	.4byte _080B2A6C
	.4byte _080B2A6C
	.4byte _080B2A6C
	.4byte _080B2A6C
	.4byte _080B2A6C
	.4byte _080B2A6C
	.4byte _080B2A6C
	.4byte _080B2A6C
	.4byte _080B2A6C
	.4byte _080B2A6C
	.4byte _080B2A6C
	.4byte _080B2A6C
	.4byte _080B2A6C
	.4byte _080B2A60
	.4byte _080B2A6C
	.4byte _080B2A6C
	.4byte _080B2A6C
	.4byte _080B2A6C
	.4byte _080B2A6C
	.4byte _080B2A6C
	.4byte _080B2A6C
	.4byte _080B2A6C
	.4byte _080B2A6C
	.4byte _080B2A6C
	.4byte _080B2A6C
	.4byte _080B2A6C
	.4byte _080B2A6C
	.4byte _080B2A6C
	.4byte _080B2A6C
	.4byte _080B2A6C
_080B2A60:
	ldr r1, _080B2A68 @ =gBankTarget
	movs r0, 0x2
	b _080B2A70
	.align 2, 0
_080B2A68: .4byte gBankTarget
_080B2A6C:
	ldr r1, _080B2A78 @ =gBankTarget
	movs r0, 0x3
_080B2A70:
	strb r0, [r1]
	pop {r0}
	bx r0
	.align 2, 0
_080B2A78: .4byte gBankTarget
	thumb_func_end sub_80B29B4

	thumb_func_start sub_80B2A7C
sub_80B2A7C: @ 80B2A7C
	push {r4-r7,lr}
	mov r7, r9
	mov r6, r8
	push {r6,r7}
	sub sp, 0x4
	lsls r0, 24
	lsrs r0, 24
	mov r9, r0
	bl Random
	lsls r0, 16
	lsrs r0, 16
	movs r1, 0x3
	bl __umodsi3
	lsls r0, 24
	lsrs r7, r0, 24
	movs r6, 0
	ldr r1, _080B2AC8 @ =gUnknown_02038690
	ldrb r0, [r1]
	cmp r0, 0
	beq _080B2AB6
_080B2AA8:
	adds r6, 0x1
	cmp r6, 0x2
	bgt _080B2AB6
	adds r0, r6, r1
	ldrb r0, [r0]
	cmp r0, 0
	bne _080B2AA8
_080B2AB6:
	mov r0, r9
	cmp r0, 0xFF
	bne _080B2AD0
	ldr r0, _080B2ACC @ =gContestPlayerMonIndex
	ldrb r0, [r0]
	cmp r6, r0
	beq _080B2AD0
	movs r0, 0
	b _080B2C38
	.align 2, 0
_080B2AC8: .4byte gUnknown_02038690
_080B2ACC: .4byte gContestPlayerMonIndex
_080B2AD0:
	ldr r0, _080B2AE4 @ =gScriptContestCategory
	ldrh r0, [r0]
	cmp r0, 0x4
	bhi _080B2B16
	lsls r0, 2
	ldr r1, _080B2AE8 @ =_080B2AEC
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_080B2AE4: .4byte gScriptContestCategory
_080B2AE8: .4byte _080B2AEC
	.align 2, 0
_080B2AEC:
	.4byte _080B2B16
	.4byte _080B2B00
	.4byte _080B2B04
	.4byte _080B2B08
	.4byte _080B2B0E
_080B2B00:
	adds r0, r7, 0x3
	b _080B2B12
_080B2B04:
	adds r0, r7, 0x6
	b _080B2B12
_080B2B08:
	adds r0, r7, 0
	adds r0, 0x9
	b _080B2B12
_080B2B0E:
	adds r0, r7, 0
	adds r0, 0xC
_080B2B12:
	lsls r0, 24
	lsrs r7, r0, 24
_080B2B16:
	mov r1, r9
	cmp r1, 0xFE
	beq _080B2BC4
	mov r0, r9
	movs r1, 0x1
	bl sub_80B2C4C
	adds r4, r0, 0
	lsls r4, 24
	ldr r2, _080B2B98 @ =gSaveBlock1
	lsrs r4, 19
	ldr r0, _080B2B9C @ =0x00002dfc
	adds r1, r2, r0
	adds r1, r4, r1
	ldr r5, _080B2BA0 @ =gContestMons
	lsls r6, 6
	adds r0, r5, 0
	adds r0, 0x38
	adds r0, r6, r0
	ldr r0, [r0]
	str r0, [r1]
	adds r1, r4, r2
	mov r8, r1
	adds r0, r6, r5
	ldrh r1, [r0]
	ldr r0, _080B2BA4 @ =0x00002e04
	add r0, r8
	strh r1, [r0]
	movs r0, 0xB8
	lsls r0, 6
	adds r1, r2, r0
	adds r1, r4, r1
	adds r0, r5, 0
	adds r0, 0x3C
	adds r0, r6, r0
	ldr r0, [r0]
	str r0, [r1]
	ldr r1, _080B2BA8 @ =0x00002e07
	adds r0, r2, r1
	adds r0, r4, r0
	adds r1, r5, 0x2
	adds r1, r6, r1
	str r2, [sp]
	bl StringCopy
	ldr r2, [sp]
	ldr r0, _080B2BAC @ =0x00002e12
	adds r2, r0
	adds r4, r2
	adds r5, 0xD
	adds r6, r5
	adds r0, r4, 0
	adds r1, r6, 0
	bl StringCopy
	mov r1, r9
	cmp r1, 0xFF
	beq _080B2BB8
	ldr r0, _080B2BB0 @ =gScriptContestCategory
	ldrh r1, [r0]
	ldr r0, _080B2BB4 @ =0x00002e06
	add r0, r8
	strb r1, [r0]
	b _080B2C36
	.align 2, 0
_080B2B98: .4byte gSaveBlock1
_080B2B9C: .4byte 0x00002dfc
_080B2BA0: .4byte gContestMons
_080B2BA4: .4byte 0x00002e04
_080B2BA8: .4byte 0x00002e07
_080B2BAC: .4byte 0x00002e12
_080B2BB0: .4byte gScriptContestCategory
_080B2BB4: .4byte 0x00002e06
_080B2BB8:
	ldr r0, _080B2BC0 @ =0x00002e06
	add r0, r8
	strb r7, [r0]
	b _080B2C36
	.align 2, 0
_080B2BC0: .4byte 0x00002e06
_080B2BC4:
	ldr r5, _080B2C14 @ =gSharedMem + 0x15DE0
	ldr r2, _080B2C18 @ =gContestMons
	lsls r4, r6, 6
	adds r0, r2, 0
	adds r0, 0x38
	adds r0, r4, r0
	ldr r0, [r0]
	str r0, [r5]
	adds r0, r2, 0
	adds r0, 0x3C
	adds r0, r4, r0
	ldr r0, [r0]
	str r0, [r5, 0x4]
	adds r0, r4, r2
	ldrh r0, [r0]
	strh r0, [r5, 0x8]
	adds r0, r5, 0
	adds r0, 0xB
	adds r1, r2, 0x2
	adds r1, r4, r1
	str r2, [sp]
	bl StringCopy
	ldr r0, _080B2C1C @ =gIsLinkContest
	ldrb r1, [r0]
	movs r0, 0x1
	ands r0, r1
	ldr r2, [sp]
	cmp r0, 0
	beq _080B2C24
	adds r0, r5, 0
	adds r0, 0x16
	lsls r1, r6, 3
	subs r1, r6
	lsls r1, 2
	ldr r2, _080B2C20 @ =gLinkPlayers + 0x8
	adds r1, r2
	bl StringCopy
	b _080B2C32
	.align 2, 0
_080B2C14: .4byte gSharedMem + 0x15DE0
_080B2C18: .4byte gContestMons
_080B2C1C: .4byte gIsLinkContest
_080B2C20: .4byte gLinkPlayers + 0x8
_080B2C24:
	adds r0, r5, 0
	adds r0, 0x16
	adds r1, r2, 0
	adds r1, 0xD
	adds r1, r4, r1
	bl StringCopy
_080B2C32:
	ldr r0, _080B2C48 @ =gSharedMem + 0x15DE0
	strb r7, [r0, 0xA]
_080B2C36:
	movs r0, 0x1
_080B2C38:
	add sp, 0x4
	pop {r3,r4}
	mov r8, r3
	mov r9, r4
	pop {r4-r7}
	pop {r1}
	bx r1
	.align 2, 0
_080B2C48: .4byte gSharedMem + 0x15DE0
	thumb_func_end sub_80B2A7C

	thumb_func_start sub_80B2C4C
sub_80B2C4C: @ 80B2C4C
	push {r4-r7,lr}
	lsls r0, 24
	lsrs r0, 24
	adds r2, r0, 0
	lsls r1, 24
	lsrs r1, 24
	cmp r0, 0x2
	beq _080B2C6E
	cmp r0, 0x2
	ble _080B2C66
	cmp r0, 0x3
	beq _080B2CA0
	b _080B2CD4
_080B2C66:
	cmp r2, 0
	blt _080B2CD4
	adds r0, r2, 0
	b _080B2D16
_080B2C6E:
	cmp r1, 0
	beq _080B2C98
	movs r2, 0x4
	ldr r0, _080B2C9C @ =gSaveBlock1 + 0x2DFC
	adds r4, r0, 0
	adds r4, 0x60
	adds r3, r0, 0
	adds r3, 0x80
_080B2C7E:
	adds r1, r3, 0
	adds r0, r4, 0
	ldm r0!, {r5-r7}
	stm r1!, {r5-r7}
	ldm r0!, {r5-r7}
	stm r1!, {r5-r7}
	ldm r0!, {r5,r6}
	stm r1!, {r5,r6}
	subs r4, 0x20
	subs r3, 0x20
	subs r2, 0x1
	cmp r2, 0x2
	bgt _080B2C7E
_080B2C98:
	movs r0, 0x2
	b _080B2D16
	.align 2, 0
_080B2C9C: .4byte gSaveBlock1 + 0x2DFC
_080B2CA0:
	cmp r1, 0
	beq _080B2CCA
	movs r2, 0x7
	ldr r0, _080B2CD0 @ =gSaveBlock1 + 0x2DFC
	adds r4, r0, 0
	adds r4, 0xC0
	adds r3, r0, 0
	adds r3, 0xE0
_080B2CB0:
	adds r1, r3, 0
	adds r0, r4, 0
	ldm r0!, {r5-r7}
	stm r1!, {r5-r7}
	ldm r0!, {r5-r7}
	stm r1!, {r5-r7}
	ldm r0!, {r5,r7}
	stm r1!, {r5,r7}
	subs r4, 0x20
	subs r3, 0x20
	subs r2, 0x1
	cmp r2, 0x5
	bgt _080B2CB0
_080B2CCA:
	movs r0, 0x5
	b _080B2D16
	.align 2, 0
_080B2CD0: .4byte gSaveBlock1 + 0x2DFC
_080B2CD4:
	ldr r0, _080B2CE8 @ =gScriptContestCategory
	ldrh r0, [r0]
	cmp r0, 0x4
	bhi _080B2D14
	lsls r0, 2
	ldr r1, _080B2CEC @ =_080B2CF0
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_080B2CE8: .4byte gScriptContestCategory
_080B2CEC: .4byte _080B2CF0
	.align 2, 0
_080B2CF0:
	.4byte _080B2D04
	.4byte _080B2D08
	.4byte _080B2D0C
	.4byte _080B2D10
	.4byte _080B2D14
_080B2D04:
	movs r0, 0x8
	b _080B2D16
_080B2D08:
	movs r0, 0x9
	b _080B2D16
_080B2D0C:
	movs r0, 0xA
	b _080B2D16
_080B2D10:
	movs r0, 0xB
	b _080B2D16
_080B2D14:
	movs r0, 0xC
_080B2D16:
	pop {r4-r7}
	pop {r1}
	bx r1
	thumb_func_end sub_80B2C4C

	thumb_func_start sub_80B2D1C
sub_80B2D1C: @ 80B2D1C
	push {r4-r7,lr}
	ldr r0, _080B2D48 @ =gSaveBlock1
	ldr r4, _080B2D4C @ =gUnknown_083CC5D0
	ldr r1, _080B2D50 @ =0x00002dfc
	adds r3, r0, r1
	movs r2, 0x7
_080B2D28:
	adds r1, r3, 0
	adds r0, r4, 0
	ldm r0!, {r5-r7}
	stm r1!, {r5-r7}
	ldm r0!, {r5-r7}
	stm r1!, {r5-r7}
	ldm r0!, {r5,r6}
	stm r1!, {r5,r6}
	adds r4, 0x20
	adds r3, 0x20
	subs r2, 0x1
	cmp r2, 0
	bge _080B2D28
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080B2D48: .4byte gSaveBlock1
_080B2D4C: .4byte gUnknown_083CC5D0
_080B2D50: .4byte 0x00002dfc
	thumb_func_end sub_80B2D1C

	.align 2, 0 @ Don't pad with nop.
