	.include "asm/macros.s"

	.syntax unified

	.text

	thumb_func_start sub_8007080
sub_8007080: @ 8007080
	push {lr}
	lsls r0, 24
	lsrs r0, 24
	bl DestroyTask
	pop {r0}
	bx r0
	thumb_func_end sub_8007080

	thumb_func_start sub_8007090
sub_8007090: @ 8007090
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	lsls r1, 24
	lsrs r5, r1, 24
	mov r8, r5
	lsls r2, 24
	lsrs r6, r2, 24
	lsls r3, 24
	lsrs r7, r3, 24
	ldr r0, _080070E0
	lsls r1, r4, 4
	movs r2, 0x20
	bl gpu_pal_apply
	ldr r2, _080070E4
	ldr r0, _080070E8
	str r0, [r2]
	lsls r0, r7, 14
	movs r1, 0xC0
	lsls r1, 19
	adds r0, r1
	str r0, [r2, 0x4]
	ldr r0, _080070EC
	str r0, [r2, 0x8]
	ldr r0, [r2, 0x8]
	ldr r0, _080070F0
	str r6, [r0]
	str r4, [r0, 0x4]
	cmp r5, 0x2
	beq _08007104
	cmp r5, 0x2
	bgt _080070F4
	cmp r5, 0x1
	beq _080070FC
	b _0800711A
	.align 2, 0
_080070E0: .4byte gUnknown_081E7330
_080070E4: .4byte 0x040000d4
_080070E8: .4byte gUnknown_081E7350
_080070EC: .4byte 0x80000110
_080070F0: .4byte 0x03002fb0
_080070F4:
	mov r0, r8
	cmp r0, 0x3
	beq _0800710C
	b _0800711A
_080070FC:
	ldr r2, _08007100
	b _0800710E
	.align 2, 0
_08007100: .4byte 0x0400000a
_08007104:
	ldr r2, _08007108
	b _0800710E
	.align 2, 0
_08007108: .4byte 0x0400000c
_0800710C:
	ldr r2, _08007124
_0800710E:
	lsls r0, r6, 8
	movs r1, 0x1
	orrs r0, r1
	lsls r1, r7, 2
	orrs r0, r1
	strh r0, [r2]
_0800711A:
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_08007124: .4byte 0x0400000e
	thumb_func_end sub_8007090

	thumb_func_start sub_8007128
sub_8007128: @ 8007128
	push {r4-r6,lr}
	mov r6, r8
	push {r6}
	mov r8, r0
	adds r5, r1, 0
	adds r4, r2, 0
	adds r6, r3, 0
	lsls r0, 24
	lsrs r0, 24
	mov r8, r0
	lsls r5, 24
	lsrs r5, 24
	lsls r4, 24
	lsrs r4, 24
	lsls r6, 24
	lsrs r6, 24
	ldr r0, _0800718C
	mov r2, r8
	lsls r1, r2, 4
	movs r2, 0x20
	bl gpu_pal_apply
	ldr r2, _08007190
	ldr r0, _08007194
	str r0, [r2]
	lsls r0, r6, 14
	movs r1, 0xC0
	lsls r1, 19
	adds r0, r1
	str r0, [r2, 0x4]
	ldr r0, _08007198
	str r0, [r2, 0x8]
	ldr r0, [r2, 0x8]
	ldr r0, _0800719C
	str r4, [r0]
	mov r1, r8
	str r1, [r0, 0x4]
	ldr r0, _080071A0
	lsls r5, 2
	adds r5, r0
	ldr r0, [r5]
	lsls r4, 8
	lsls r6, 2
	orrs r4, r6
	strh r4, [r0]
	pop {r3}
	mov r8, r3
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_0800718C: .4byte gUnknown_081E7330
_08007190: .4byte 0x040000d4
_08007194: .4byte gUnknown_081E7350
_08007198: .4byte 0x80000110
_0800719C: .4byte 0x03002fb0
_080071A0: .4byte gUnknown_081E29A8
	thumb_func_end sub_8007128

	thumb_func_start sub_80071A4
sub_80071A4: @ 80071A4
	push {r4-r6,lr}
	bl ResetSpriteData
	bl FreeAllSpritePalettes
	bl ResetTasks
	ldr r0, _08007248
	bl SetVBlankCallback
	ldr r4, _0800724C
	adds r0, r4, 0
	bl sub_8002A34
	adds r0, r4, 0
	bl sub_8071C4C
	bl sub_8007CEC
	ldr r1, _08007250
	ldr r2, _08007254
	adds r0, r2, 0
	strh r0, [r1]
	bl sub_8007378
	ldr r0, _08007258
	ldrh r0, [r0, 0x20]
	bl SeedRng
	movs r4, 0
	ldr r6, _0800725C
	movs r5, 0xFF
_080071E4:
	bl Random
	adds r1, r4, r6
	lsls r0, 16
	lsrs r0, 16
	ands r0, r5
	strb r0, [r1]
	adds r4, 0x1
	cmp r4, 0x3
	ble _080071E4
	movs r0, 0
	movs r1, 0x2
	movs r2, 0x4
	movs r3, 0
	bl sub_8007090
	movs r1, 0x80
	lsls r1, 19
	movs r2, 0xAA
	lsls r2, 5
	adds r0, r2, 0
	strh r0, [r1]
	ldr r0, _08007260
	movs r1, 0
	bl CreateTask
	bl RunTasks
	bl AnimateSprites
	bl BuildOamBuffer
	bl fade_and_return_progress_probably
	ldr r1, _08007264
	movs r0, 0
	str r0, [r1]
	bl sub_8007280
	ldr r0, _08007268
	movs r1, 0
	bl CreateTask
	ldr r0, _0800726C
	bl SetMainCallback2
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_08007248: .4byte sub_8007300
_0800724C: .4byte gUnknown_081E6CE4
_08007250: .4byte 0x03002b74
_08007254: .4byte 0x00001111
_08007258: .4byte 0x03001770
_0800725C: .4byte 0x02024eae
_08007260: .4byte sub_8007080
_08007264: .4byte 0x03000444
_08007268: .4byte task00_link_test
_0800726C: .4byte c2_08009A8C
	thumb_func_end sub_80071A4

	thumb_func_start sub_8007270
sub_8007270: @ 8007270
	lsls r0, 24
	lsrs r0, 24
	ldr r1, _0800727C
	strh r0, [r1, 0x18]
	bx lr
	.align 2, 0
_0800727C: .4byte 0x03002a00
	thumb_func_end sub_8007270

	thumb_func_start sub_8007280
sub_8007280: @ 8007280
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	ldr r3, _080072EC
	ldr r2, _080072F0
	ldrb r1, [r2, 0xA]
	ldrb r0, [r2, 0xB]
	lsls r0, 8
	orrs r1, r0
	ldrb r0, [r2, 0xC]
	lsls r0, 16
	orrs r1, r0
	ldrb r0, [r2, 0xD]
	lsls r0, 24
	orrs r1, r0
	str r1, [r3, 0x4]
	movs r4, 0
	adds r6, r2, 0
	ldr r7, _080072F4
	ldr r0, _080072F8
	mov r12, r0
	ldr r1, _080072FC
	mov r8, r1
	adds r5, r3, 0
	adds r5, 0x8
_080072B2:
	adds r0, r4, r5
	adds r1, r4, r2
	ldrb r1, [r1]
	strb r1, [r0]
	adds r4, 0x1
	cmp r4, 0xA
	ble _080072B2
	ldrb r0, [r6, 0x8]
	movs r2, 0
	strb r0, [r3, 0x13]
	ldrh r0, [r7]
	str r0, [r3, 0x14]
	mov r4, r12
	ldrb r0, [r4]
	strh r0, [r3, 0x1A]
	mov r1, r8
	ldrb r0, [r1]
	movs r4, 0x80
	lsls r4, 7
	adds r1, r4, 0
	adds r0, r1
	strh r0, [r3]
	strh r2, [r3, 0x2]
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080072EC: .4byte 0x03002a00
_080072F0: .4byte 0x02024ea4
_080072F4: .4byte 0x03002b74
_080072F8: .4byte gGameLanguage
_080072FC: .4byte gGameVersion
	thumb_func_end sub_8007280

	thumb_func_start sub_8007300
sub_8007300: @ 8007300
	push {lr}
	bl LoadOam
	bl ProcessSpriteCopyRequests
	bl copy_pal_bg_faded_to_pal_ram
	pop {r0}
	bx r0
	thumb_func_end sub_8007300

	thumb_func_start sub_8007314
sub_8007314: @ 8007314
	push {lr}
	ldr r3, _08007334
	ldr r1, _08007338
	ldr r2, _0800733C
	adds r0, r1, 0
	adds r0, 0xE
_08007320:
	strh r2, [r0]
	subs r0, 0x2
	cmp r0, r1
	bge _08007320
	movs r0, 0x1
	strb r0, [r3]
	bl sub_800877C
	pop {r0}
	bx r0
	.align 2, 0
_08007334: .4byte 0x020238c0
_08007338: .4byte 0x03002f90
_0800733C: .4byte 0x0000efff
	thumb_func_end sub_8007314

	thumb_func_start task02_080097CC
task02_080097CC: @ 8007340
	push {lr}
	lsls r0, 24
	lsrs r2, r0, 24
	ldr r0, _08007370
	lsls r1, r2, 2
	adds r1, r2
	lsls r1, 3
	adds r1, r0
	ldrh r0, [r1, 0x8]
	adds r0, 0x1
	strh r0, [r1, 0x8]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x5
	bne _0800736A
	ldr r1, _08007374
	movs r0, 0x1
	strb r0, [r1]
	adds r0, r2, 0
	bl DestroyTask
_0800736A:
	pop {r0}
	bx r0
	.align 2, 0
_08007370: .4byte 0x03004b20
_08007374: .4byte 0x03003040
	thumb_func_end task02_080097CC

	thumb_func_start sub_8007378
sub_8007378: @ 8007378
	push {r4-r6,lr}
	bl sub_8008838
	bl sub_8007314
	ldr r1, _080073D8
	ldr r0, _080073DC
	str r0, [r1]
	ldr r0, _080073E0
	movs r1, 0
	strb r1, [r0]
	ldr r0, _080073E4
	strb r1, [r0]
	ldr r0, _080073E8
	strb r1, [r0]
	bl sub_8007F18
	ldr r0, _080073EC
	movs r1, 0
	str r1, [r0]
	ldr r0, _080073F0
	strb r1, [r0]
	ldr r0, _080073F4
	strb r1, [r0]
	ldr r0, _080073F8
	strb r1, [r0]
	ldr r6, _080073FC
	movs r2, 0
	movs r5, 0x1
	ldr r4, _08007400
	ldr r3, _08007404
_080073B6:
	adds r0, r1, r6
	strb r5, [r0]
	adds r0, r1, r4
	strb r2, [r0]
	adds r0, r1, r3
	strb r2, [r0]
	adds r1, 0x1
	cmp r1, 0x3
	ble _080073B6
	ldr r0, _08007408
	movs r1, 0x2
	bl CreateTask
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_080073D8: .4byte 0x03002fc0
_080073DC: .4byte sub_800802C
_080073E0: .4byte 0x03001bf8
_080073E4: .4byte 0x0300295c
_080073E8: .4byte 0x03002f80
_080073EC: .4byte 0x0300042c
_080073F0: .4byte 0x03002a68
_080073F4: .4byte 0x03002a64
_080073F8: .4byte 0x03002fa4
_080073FC: .4byte 0x0300296c
_08007400: .4byte 0x03002b78
_08007404: .4byte 0x03002b70
_08007408: .4byte task02_080097CC
	thumb_func_end sub_8007378

	thumb_func_start AllocZeroed
AllocZeroed: @ 800740C
	push {lr}
	ldr r0, _08007420
	movs r1, 0
	strb r1, [r0]
	ldr r0, _08007424
	strb r1, [r0]
	bl sub_800871C
	pop {r0}
	bx r0
	.align 2, 0
_08007420: .4byte 0x03002fa4
_08007424: .4byte 0x020238c0
	thumb_func_end AllocZeroed

	thumb_func_start sub_8007428
sub_8007428: @ 8007428
	push {r4-r7,lr}
	mov r7, r9
	mov r6, r8
	push {r6,r7}
	ldr r5, _080074EC
	ldr r4, _080074F0
	ldrb r0, [r5]
	ldrh r1, [r4]
	cmp r0, r1
	beq _0800744C
	ldrh r0, [r4]
	movs r1, 0x2
	movs r2, 0x3
	movs r3, 0x2
	bl sub_8007FD8
	ldrh r0, [r4]
	strb r0, [r5]
_0800744C:
	movs r5, 0
	ldr r7, _080074F4
_08007450:
	ldr r0, _080074F8
	adds r6, r5, r0
	lsls r0, r5, 1
	adds r0, r5
	lsls r0, 2
	adds r4, r0, r7
	ldrb r0, [r6]
	ldrh r1, [r4]
	cmp r0, r1
	beq _08007478
	ldrh r0, [r4]
	adds r2, r5, 0x4
	lsls r2, 24
	lsrs r2, 24
	movs r1, 0x2
	movs r3, 0x2
	bl sub_8007FD8
	ldrh r0, [r4]
	strb r0, [r6]
_08007478:
	adds r0, r5, 0x1
	lsls r0, 24
	lsrs r5, r0, 24
	cmp r5, 0x3
	bls _08007450
	bl sub_8007EE4
	lsls r0, 24
	lsrs r7, r0, 24
	cmp r7, 0xF
	bne _080074DE
	movs r5, 0
	ldr r0, _080074F4
	mov r9, r0
	ldr r1, _080074FC
	mov r8, r1
_08007498:
	adds r0, r7, 0
	asrs r0, r5
	movs r1, 0x1
	ands r0, r1
	cmp r0, 0
	beq _080074D4
	lsls r0, r5, 8
	ldr r1, _08007500
	adds r0, r1
	lsls r4, r5, 1
	adds r1, r4, r5
	lsls r1, 2
	add r1, r9
	ldrh r1, [r1, 0x2]
	bl sub_8007F74
	ldr r1, _08007504
	adds r4, r1
	movs r6, 0
	strh r0, [r4]
	adds r0, r5, 0
	bl sub_8007F30
	ldrh r0, [r4]
	cmp r0, r8
	beq _080074D4
	ldr r0, _08007508
	strb r6, [r0]
	ldr r0, _0800750C
	strb r6, [r0]
_080074D4:
	adds r0, r5, 0x1
	lsls r0, 24
	lsrs r5, r0, 24
	cmp r5, 0x3
	bls _08007498
_080074DE:
	pop {r3,r4}
	mov r8, r3
	mov r9, r4
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080074EC: .4byte 0x03000448
_080074F0: .4byte 0x030003e8
_080074F4: .4byte 0x030003f8
_080074F8: .4byte 0x0300044c
_080074FC: .4byte 0x00000342
_08007500: .4byte 0x03002b80
_08007504: .4byte 0x03003048
_08007508: .4byte 0x020238b4
_0800750C: .4byte 0x020238b5
	thumb_func_end sub_8007428

	thumb_func_start sub_8007510
sub_8007510: @ 8007510
	push {r4,r5,lr}
	sub sp, 0x4
	ldr r4, _080075B0
	ldrh r1, [r4, 0x2E]
	movs r0, 0x1
	ands r0, r1
	cmp r0, 0
	beq _08007526
	ldr r1, _080075B4
	movs r0, 0x1
	strb r0, [r1]
_08007526:
	ldrh r1, [r4, 0x2C]
	movs r5, 0x2
	adds r0, r5, 0
	ands r0, r1
	cmp r0, 0
	beq _0800753A
	ldr r0, _080075B8
	ldr r1, _080075BC
	bl sub_8007D00
_0800753A:
	ldrh r1, [r4, 0x2E]
	movs r0, 0x80
	lsls r0, 2
	ands r0, r1
	cmp r0, 0
	beq _08007556
	movs r0, 0x1
	negs r0, r0
	str r5, [sp]
	movs r1, 0
	movs r2, 0x10
	movs r3, 0
	bl pal_fade_maybe
_08007556:
	ldrh r1, [r4, 0x2E]
	movs r0, 0x8
	ands r0, r1
	cmp r0, 0
	beq _08007566
	movs r0, 0x1
	bl sub_8008704
_08007566:
	ldrh r1, [r4, 0x2E]
	movs r0, 0x80
	lsls r0, 1
	ands r0, r1
	cmp r0, 0
	beq _08007578
	movs r0, 0x1
	bl sub_8125D44
_08007578:
	ldrh r1, [r4, 0x2E]
	movs r0, 0x4
	ands r0, r1
	cmp r0, 0
	beq _08007586
	bl sub_800832C
_08007586:
	ldr r0, _080075C0
	ldrb r0, [r0]
	cmp r0, 0
	beq _080075A6
	ldr r2, [r4, 0x20]
	ldr r0, _080075C4
	ldrb r1, [r0]
	ldr r0, _080075C8
	ldr r0, [r0]
	cmp r0, 0
	bne _080075A0
	movs r0, 0x10
	orrs r1, r0
_080075A0:
	adds r0, r2, 0
	bl sub_8008184
_080075A6:
	add sp, 0x4
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080075B0: .4byte 0x03001770
_080075B4: .4byte 0x03003040
_080075B8: .4byte 0x02004000
_080075BC: .4byte 0x00002004
_080075C0: .4byte 0x020238b4
_080075C4: .4byte 0x03001bf8
_080075C8: .4byte 0x03002fc0
	thumb_func_end sub_8007510

	thumb_func_start c2_08009A8C
c2_08009A8C: @ 80075CC
	push {lr}
	bl sub_8007510
	movs r0, 0x1
	movs r1, 0x1
	movs r2, 0
	bl sub_8007428
	bl RunTasks
	bl AnimateSprites
	bl BuildOamBuffer
	bl fade_and_return_progress_probably
	pop {r0}
	bx r0
	thumb_func_end c2_08009A8C

	thumb_func_start sub_80075F0
sub_80075F0: @ 80075F0
	push {r4,r5,lr}
	adds r4, r0, 0
	ldr r0, _08007600
	ldrb r0, [r0]
	cmp r0, 0
	bne _08007604
	movs r0, 0
	b _0800764C
	.align 2, 0
_08007600: .4byte 0x020238c0
_08007604:
	movs r1, 0
	ldr r5, _08007654
	ldr r3, _08007658
	movs r2, 0
_0800760C:
	lsls r0, r1, 1
	adds r0, r3
	strh r2, [r0]
	adds r0, r1, 0x1
	lsls r0, 24
	lsrs r1, r0, 24
	cmp r1, 0x7
	bls _0800760C
	ldrh r0, [r4]
	strh r0, [r5]
	ldr r0, _0800765C
	ldr r0, [r0]
	movs r1, 0x40
	ands r0, r1
	cmp r0, 0
	beq _08007648
	ldr r0, _08007660
	ldr r0, [r0]
	lsls r0, 26
	lsrs r0, 30
	bl sub_80076B0
	ldr r0, _08007664
	ldr r0, [r0]
	cmp r0, 0
	beq _08007644
	bl _call_via_r0
_08007644:
	bl sub_800854C
_08007648:
	ldr r0, _0800765C
	ldrh r0, [r0]
_0800764C:
	pop {r4,r5}
	pop {r1}
	bx r1
	.align 2, 0
_08007654: .4byte 0x030029e8
_08007658: .4byte 0x03002f90
_0800765C: .4byte 0x03002a60
_08007660: .4byte 0x04000128
_08007664: .4byte 0x03002fc0
	thumb_func_end sub_80075F0

	thumb_func_start sub_8007668
sub_8007668: @ 8007668
	push {r4-r6,lr}
	lsls r0, 24
	lsrs r0, 24
	movs r5, 0
	ldr r1, _0800767C
	adds r0, r1
	strb r5, [r0]
	movs r4, 0
	adds r6, r1, 0
	b _08007688
	.align 2, 0
_0800767C: .4byte 0x0300296c
_08007680:
	adds r0, r4, r6
	ldrb r0, [r0]
	adds r5, r0
	adds r4, 0x1
_08007688:
	bl sub_8008300
	lsls r0, 24
	lsrs r0, 24
	cmp r4, r0
	blt _08007680
	cmp r5, 0
	bne _080076A4
	ldr r1, _080076AC
	ldrb r0, [r1]
	cmp r0, 0
	bne _080076A4
	movs r0, 0x1
	strb r0, [r1]
_080076A4:
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_080076AC: .4byte 0x03002fa4
	thumb_func_end sub_8007668

	thumb_func_start sub_80076B0
sub_80076B0: @ 80076B0
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	sub sp, 0x4
	movs r7, 0
	ldr r0, _08007708
	mov r8, r0
_080076C2:
	ldr r0, _0800770C
	lsls r4, r7, 1
	adds r2, r4, r0
	movs r1, 0
	strh r1, [r2]
	mov r3, r8
	adds r1, r4, r3
	ldrh r0, [r1]
	mov r9, r4
	adds r5, r7, 0x1
	str r5, [sp]
	cmp r0, 0
	bne _080076DE
	b _0800798A
_080076DE:
	ldrh r1, [r1]
	ldr r0, _08007710
	cmp r1, r0
	bne _080076E8
	b _0800792A
_080076E8:
	cmp r1, r0
	bgt _08007734
	ldr r0, _08007714
	cmp r1, r0
	bne _080076F4
	b _08007980
_080076F4:
	cmp r1, r0
	bgt _08007720
	ldr r0, _08007718
	cmp r1, r0
	beq _08007788
	ldr r0, _0800771C
	cmp r1, r0
	bne _08007706
	b _08007934
_08007706:
	b _0800798A
	.align 2, 0
_08007708: .4byte 0x03002a20
_0800770C: .4byte 0x03002910
_08007710: .4byte 0x00005fff
_08007714: .4byte 0x00004444
_08007718: .4byte 0x00002222
_0800771C: .4byte 0x00002ffe
_08007720:
	ldr r0, _08007730
	cmp r1, r0
	beq _080077D8
	adds r0, 0x11
	cmp r1, r0
	beq _080077D8
	b _0800798A
	.align 2, 0
_08007730: .4byte 0x00005555
_08007734:
	ldr r0, _08007750
	cmp r1, r0
	bne _0800773C
	b _0800794A
_0800773C:
	cmp r1, r0
	bgt _0800775C
	ldr r0, _08007754
	cmp r1, r0
	beq _0800780C
	ldr r0, _08007758
	cmp r1, r0
	bne _0800774E
	b _08007944
_0800774E:
	b _0800798A
	.align 2, 0
_08007750: .4byte 0x0000aaab
_08007754: .4byte 0x00008888
_08007758: .4byte 0x0000aaaa
_0800775C:
	ldr r0, _08007770
	cmp r1, r0
	bne _08007764
	b _08007980
_08007764:
	cmp r1, r0
	bgt _08007778
	ldr r0, _08007774
	cmp r1, r0
	beq _080077E4
	b _0800798A
	.align 2, 0
_08007770: .4byte 0x0000cafe
_08007774: .4byte 0x0000bbbb
_08007778:
	ldr r0, _08007784
	cmp r1, r0
	bne _08007780
	b _0800795C
_08007780:
	b _0800798A
	.align 2, 0
_08007784: .4byte 0x0000cccc
_08007788:
	bl sub_8007280
	ldr r0, _080077CC
	adds r2, r0, 0
	adds r2, 0x10
	ldr r1, _080077D0
	ldm r1!, {r3,r4,r6}
	stm r2!, {r3,r4,r6}
	ldm r1!, {r3,r5,r6}
	stm r2!, {r3,r5,r6}
	ldr r1, [r1]
	str r1, [r2]
	ldr r4, _080077D4
	adds r2, r0, 0
	adds r1, r4, 0
	ldm r1!, {r3,r5,r6}
	stm r2!, {r3,r5,r6}
	ldrh r3, [r1]
	strh r3, [r2]
	ldrb r1, [r1, 0x2]
	strb r1, [r2, 0x2]
	adds r1, r0, 0
	adds r1, 0x2C
	ldm r4!, {r2,r5,r6}
	stm r1!, {r2,r5,r6}
	ldrh r2, [r4]
	strh r2, [r1]
	ldrb r2, [r4, 0x2]
	strb r2, [r1, 0x2]
	movs r1, 0x3C
	bl sub_8007D00
	b _0800798A
	.align 2, 0
_080077CC: .4byte 0x03002920
_080077D0: .4byte 0x03002a00
_080077D4: .4byte gUnknown_081E75FC
_080077D8:
	ldr r1, _080077E0
	movs r0, 0x1
	strb r0, [r1]
	b _0800798A
	.align 2, 0
_080077E0: .4byte 0x03002a68
_080077E4:
	adds r1, r4, r7
	lsls r1, 2
	ldr r3, _08007808
	adds r1, r3
	movs r5, 0
	strh r5, [r1]
	mov r0, r8
	adds r0, 0x8
	adds r0, r4, r0
	ldrh r0, [r0]
	strh r0, [r1, 0x2]
	mov r0, r8
	adds r0, 0x10
	adds r0, r4, r0
	ldrh r0, [r0]
	strb r0, [r1, 0x9]
	b _0800798A
	.align 2, 0
_08007808: .4byte 0x030003f8
_0800780C:
	adds r0, r4, r7
	lsls r0, 2
	ldr r6, _08007848
	adds r3, r0, r6
	ldrh r1, [r3, 0x2]
	movs r0, 0x80
	lsls r0, 1
	adds r2, r6, 0
	mov r10, r2
	cmp r1, r0
	bls _08007854
	ldr r6, _0800784C
	movs r2, 0
	ldr r5, _08007850
_08007828:
	ldrh r1, [r3]
	lsrs r1, 1
	adds r1, r2
	lsls r1, 1
	adds r1, r6
	adds r2, 0x1
	lsls r0, r2, 3
	adds r0, r4, r0
	adds r0, r5
	ldrh r0, [r0]
	strh r0, [r1]
	lsls r2, 16
	lsrs r2, 16
	cmp r2, 0x6
	bls _08007828
	b _08007882
	.align 2, 0
_08007848: .4byte 0x030003f8
_0800784C: .4byte 0x02000000
_08007850: .4byte 0x03002a20
_08007854:
	movs r2, 0
	ldr r5, _080078E8
	mov r12, r5
	adds r5, r4, 0
	adds r4, r3, 0
	ldr r6, _080078EC
	lsls r3, r7, 8
_08007862:
	ldrh r1, [r4]
	lsrs r1, 1
	adds r1, r2
	lsls r1, 1
	adds r1, r3
	add r1, r12
	adds r2, 0x1
	lsls r0, r2, 3
	adds r0, r5, r0
	adds r0, r6
	ldrh r0, [r0]
	strh r0, [r1]
	lsls r2, 16
	lsrs r2, 16
	cmp r2, 0x6
	bls _08007862
_08007882:
	mov r6, r9
	adds r1, r6, r7
	lsls r1, 2
	add r1, r10
	ldrh r0, [r1]
	adds r0, 0xE
	strh r0, [r1]
	lsls r0, 16
	lsrs r0, 16
	ldrh r1, [r1, 0x2]
	cmp r0, r1
	bcc _0800798A
	ldr r0, _080078F0
	adds r0, r7, r0
	ldrb r0, [r0]
	cmp r0, 0x1
	bne _08007920
	lsls r1, r7, 8
	ldr r0, _080078E8
	adds r5, r1, r0
	lsls r4, r7, 3
	subs r1, r4, r7
	lsls r1, 2
	ldr r0, _080078F4
	adds r1, r0
	adds r0, r5, 0
	adds r0, 0x10
	ldm r0!, {r2,r3,r6}
	stm r1!, {r2,r3,r6}
	ldm r0!, {r2,r3,r6}
	stm r1!, {r2,r3,r6}
	ldr r0, [r0]
	str r0, [r1]
	ldr r6, _080078F8
	adds r0, r5, 0
	adds r1, r6, 0
	bl strcmp
	cmp r0, 0
	bne _080078E0
	adds r0, r5, 0
	adds r0, 0x2C
	adds r1, r6, 0
	bl strcmp
	cmp r0, 0
	beq _08007900
_080078E0:
	ldr r0, _080078FC
	bl SetMainCallback2
	b _08007908
	.align 2, 0
_080078E8: .4byte 0x03002b80
_080078EC: .4byte 0x03002a20
_080078F0: .4byte 0x0300296c
_080078F4: .4byte 0x03002970
_080078F8: .4byte gUnknown_081E75FC
_080078FC: .4byte sub_80085BC
_08007900:
	lsls r0, r7, 24
	lsrs r0, 24
	bl sub_8007668
_08007908:
	subs r2, r4, r7
	lsls r2, 2
	ldr r1, _0800791C
	adds r0, r2, r1
	adds r1, r2
	ldrb r1, [r1, 0x12]
	bl StopMusicWhileStringIsPrinted
	b _0800798A
	.align 2, 0
_0800791C: .4byte 0x03002978
_08007920:
	lsls r0, r7, 24
	lsrs r0, 24
	bl schedule_bg_copy_tilemap_to_vram
	b _0800798A
_0800792A:
	ldr r0, _08007930
	b _08007936
	.align 2, 0
_08007930: .4byte 0x03002b78
_08007934:
	ldr r0, _08007940
_08007936:
	adds r0, r7, r0
	movs r1, 0x1
	strb r1, [r0]
	b _0800798A
	.align 2, 0
_08007940: .4byte 0x03002b70
_08007944:
	bl sub_8007E24
	b _0800798A
_0800794A:
	lsls r0, r7, 24
	lsrs r0, 24
	mov r1, r8
	adds r1, 0x8
	adds r1, r4, r1
	ldrh r1, [r1]
	bl sub_80516C4
	b _0800798A
_0800795C:
	ldr r3, _0800797C
	mov r0, r8
	adds r0, 0x8
	adds r0, r4, r0
	ldrh r2, [r0]
	lsls r2, 3
	adds r0, r2, r3
	ldr r1, [r0]
	adds r3, 0x4
	adds r2, r3
	ldrh r2, [r2]
	movs r0, 0
	bl sub_8007E88
	b _0800798A
	.align 2, 0
_0800797C: .4byte gUnknown_081E75CC
_08007980:
	mov r0, r8
	adds r0, 0x8
	adds r0, r4, r0
	ldrh r0, [r0]
	strh r0, [r2]
_0800798A:
	ldr r1, [sp]
	lsls r0, r1, 16
	lsrs r7, r0, 16
	cmp r7, 0x3
	bhi _08007996
	b _080076C2
_08007996:
	add sp, 0x4
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	thumb_func_end sub_80076B0

	thumb_func_start sub_80079A8
sub_80079A8: @ 80079A8
	push {lr}
	lsls r0, 16
	lsrs r2, r0, 16
	ldr r0, _080079CC
	cmp r2, r0
	beq _08007A70
	cmp r2, r0
	bgt _08007A00
	ldr r0, _080079D0
	cmp r2, r0
	beq _08007A5C
	cmp r2, r0
	bgt _080079DC
	ldr r0, _080079D4
	cmp r2, r0
	beq _08007A48
	ldr r0, _080079D8
	b _080079F2
	.align 2, 0
_080079CC: .4byte 0x00006666
_080079D0: .4byte 0x00004444
_080079D4: .4byte 0x00002222
_080079D8: .4byte 0x00002ffe
_080079DC:
	ldr r0, _080079EC
	cmp r2, r0
	bne _080079E4
	b _08007AE0
_080079E4:
	cmp r2, r0
	bgt _080079F0
	subs r0, 0x11
	b _080079F2
	.align 2, 0
_080079EC: .4byte 0x00005566
_080079F0:
	ldr r0, _080079FC
_080079F2:
	cmp r2, r0
	bne _080079F8
	b _08007AE0
_080079F8:
	b _08007B02
	.align 2, 0
_080079FC: .4byte 0x00005fff
_08007A00:
	ldr r0, _08007A14
	cmp r2, r0
	beq _08007AB8
	cmp r2, r0
	bgt _08007A20
	ldr r0, _08007A18
	cmp r2, r0
	beq _08007A7C
	ldr r0, _08007A1C
	b _080079F2
	.align 2, 0
_08007A14: .4byte 0x0000aaab
_08007A18: .4byte 0x00007777
_08007A1C: .4byte 0x0000aaaa
_08007A20:
	ldr r0, _08007A34
	cmp r2, r0
	beq _08007AEC
	cmp r2, r0
	bgt _08007A3C
	ldr r0, _08007A38
	cmp r2, r0
	beq _08007A9C
	b _08007B02
	.align 2, 0
_08007A34: .4byte 0x0000cafe
_08007A38: .4byte 0x0000bbbb
_08007A3C:
	ldr r0, _08007A44
	cmp r2, r0
	beq _08007ACC
	b _08007B02
	.align 2, 0
_08007A44: .4byte 0x0000cccc
_08007A48:
	ldr r0, _08007A54
	strh r2, [r0]
	ldr r1, _08007A58
	ldrh r1, [r1]
	b _08007B00
	.align 2, 0
_08007A54: .4byte 0x03002f90
_08007A58: .4byte 0x03002b74
_08007A5C:
	ldr r0, _08007A68
	strh r2, [r0]
	ldr r1, _08007A6C
	ldrh r1, [r1, 0x2C]
	b _08007B00
	.align 2, 0
_08007A68: .4byte 0x03002f90
_08007A6C: .4byte 0x03001770
_08007A70:
	ldr r0, _08007A78
	movs r1, 0
	b _08007AFE
	.align 2, 0
_08007A78: .4byte 0x03002f90
_08007A7C:
	ldr r0, _08007A98
	strh r2, [r0]
	movs r1, 0
	adds r3, r0, 0
	movs r2, 0xEE
_08007A86:
	adds r1, 0x1
	lsls r0, r1, 1
	adds r0, r3
	strh r2, [r0]
	lsls r1, 24
	lsrs r1, 24
	cmp r1, 0x4
	bls _08007A86
	b _08007B02
	.align 2, 0
_08007A98: .4byte 0x03002f90
_08007A9C:
	ldr r1, _08007AB0
	strh r2, [r1]
	ldr r2, _08007AB4
	ldrh r0, [r2, 0x2]
	strh r0, [r1, 0x2]
	ldrb r0, [r2, 0x9]
	adds r0, 0x80
	strh r0, [r1, 0x4]
	b _08007B02
	.align 2, 0
_08007AB0: .4byte 0x03002f90
_08007AB4: .4byte 0x030003e8
_08007AB8:
	ldr r0, _08007AC4
	strh r2, [r0]
	ldr r1, _08007AC8
	ldrh r1, [r1]
	b _08007B00
	.align 2, 0
_08007AC4: .4byte 0x03002f90
_08007AC8: .4byte 0x0203855e
_08007ACC:
	ldr r0, _08007AD8
	strh r2, [r0]
	ldr r1, _08007ADC
	ldrb r1, [r1]
	b _08007B00
	.align 2, 0
_08007AD8: .4byte 0x03002f90
_08007ADC: .4byte 0x03003054
_08007AE0:
	ldr r0, _08007AE8
	strh r2, [r0]
	b _08007B02
	.align 2, 0
_08007AE8: .4byte 0x03002f90
_08007AEC:
	ldr r0, _08007B08
	ldrh r1, [r0]
	cmp r1, 0
	beq _08007B02
	ldr r0, _08007B0C
	ldrb r0, [r0]
	cmp r0, 0
	bne _08007B02
	ldr r0, _08007B10
_08007AFE:
	strh r2, [r0]
_08007B00:
	strh r1, [r0, 0x2]
_08007B02:
	pop {r0}
	bx r0
	.align 2, 0
_08007B08: .4byte 0x03004858
_08007B0C: .4byte 0x03001764
_08007B10: .4byte 0x03002f90
	thumb_func_end sub_80079A8

	thumb_func_start sub_8007B14
sub_8007B14: @ 8007B14
	ldr r1, _08007B1C
	ldr r0, _08007B20
	str r0, [r1]
	bx lr
	.align 2, 0
_08007B1C: .4byte 0x03002fc0
_08007B20: .4byte sub_8007B44
	thumb_func_end sub_8007B14

	thumb_func_start sub_8007B24
sub_8007B24: @ 8007B24
	push {lr}
	ldr r0, _08007B34
	ldr r1, [r0]
	ldr r0, _08007B38
	cmp r1, r0
	beq _08007B3C
	movs r0, 0
	b _08007B3E
	.align 2, 0
_08007B34: .4byte 0x03002fc0
_08007B38: .4byte sub_8007B44
_08007B3C:
	movs r0, 0x1
_08007B3E:
	pop {r1}
	bx r1
	thumb_func_end sub_8007B24

	thumb_func_start sub_8007B44
sub_8007B44: @ 8007B44
	push {lr}
	ldr r0, _08007B58
	ldrb r0, [r0]
	cmp r0, 0x1
	bne _08007B54
	ldr r0, _08007B5C
	bl sub_80079A8
_08007B54:
	pop {r0}
	bx r0
	.align 2, 0
_08007B58: .4byte 0x03002fa4
_08007B5C: .4byte 0x0000cafe
	thumb_func_end sub_8007B44

	thumb_func_start sub_8007B60
sub_8007B60: @ 8007B60
	ldr r1, _08007B68
	movs r0, 0
	str r0, [r1]
	bx lr
	.align 2, 0
_08007B68: .4byte 0x03002fc0
	thumb_func_end sub_8007B60

	thumb_func_start sub_8007B6C
sub_8007B6C: @ 8007B6C
	ldr r1, _08007B74
	movs r0, 0
	str r0, [r1]
	bx lr
	.align 2, 0
_08007B74: .4byte 0x03002fc0
	thumb_func_end sub_8007B6C

	thumb_func_start sub_8007B78
sub_8007B78: @ 8007B78
	ldr r0, _08007B84
	ldr r0, [r0]
	movs r1, 0x1C
	ands r0, r1
	lsrs r0, 2
	bx lr
	.align 2, 0
_08007B84: .4byte 0x03002a60
	thumb_func_end sub_8007B78

	thumb_func_start sub_8007B88
sub_8007B88: @ 8007B88
	push {lr}
	ldr r0, _08007B9C
	movs r1, 0
	str r1, [r0]
	ldr r0, _08007BA0
	strh r1, [r0]
	bl sub_8007378
	pop {r0}
	bx r0
	.align 2, 0
_08007B9C: .4byte 0x03000434
_08007BA0: .4byte 0x030029ec
	thumb_func_end sub_8007B88

	thumb_func_start sub_8007BA4
sub_8007BA4: @ 8007BA4
	push {r4-r7,lr}
	movs r7, 0
	ldr r0, _08007BCC
	ldrb r4, [r0]
	cmp r4, 0x1
	bne _08007C20
	bl sub_8007B78
	lsls r0, 24
	cmp r0, 0
	bne _08007BC2
	ldr r0, _08007BD0
	strb r4, [r0]
	bl AllocZeroed
_08007BC2:
	movs r6, 0
	ldr r4, _08007BD4
	movs r5, 0
	b _08007BEC
	.align 2, 0
_08007BCC: .4byte 0x03002fa4
_08007BD0: .4byte 0x0300295c
_08007BD4: .4byte 0x03002970
_08007BD8:
	adds r0, r4, 0
	adds r0, 0x14
	adds r0, r5, r0
	ldr r1, [r0]
	ldr r0, [r4, 0x14]
	cmp r1, r0
	bne _08007BE8
	adds r7, 0x1
_08007BE8:
	adds r5, 0x1C
	adds r6, 0x1
_08007BEC:
	bl sub_8007B78
	lsls r0, 24
	lsrs r0, 24
	cmp r6, r0
	blt _08007BD8
	bl sub_8007B78
	lsls r0, 24
	lsrs r0, 24
	cmp r7, r0
	bne _08007C10
	ldr r1, _08007C0C
	movs r0, 0x1
	b _08007C14
	.align 2, 0
_08007C0C: .4byte 0x03000434
_08007C10:
	ldr r1, _08007C1C
	movs r0, 0x3
_08007C14:
	str r0, [r1]
	adds r2, r1, 0
	b _08007C38
	.align 2, 0
_08007C1C: .4byte 0x03000434
_08007C20:
	ldr r0, _08007C40
	ldrh r1, [r0]
	adds r1, 0x1
	strh r1, [r0]
	lsls r1, 16
	movs r0, 0x96
	lsls r0, 18
	ldr r2, _08007C44
	cmp r1, r0
	bls _08007C38
	movs r0, 0x2
	str r0, [r2]
_08007C38:
	ldrb r0, [r2]
	pop {r4-r7}
	pop {r1}
	bx r1
	.align 2, 0
_08007C40: .4byte 0x030029ec
_08007C44: .4byte 0x03000434
	thumb_func_end sub_8007BA4

	thumb_func_start sub_8007C48
sub_8007C48: @ 8007C48
	push {r4-r6,lr}
	movs r6, 0
	movs r4, 0
	ldr r5, _08007C54
	b _08007C78
	.align 2, 0
_08007C54: .4byte 0x03002970
_08007C58:
	lsls r0, r4, 3
	subs r0, r4
	lsls r0, 2
	adds r1, r5, 0
	adds r1, 0x14
	adds r0, r1
	ldr r1, [r0]
	ldr r0, [r5, 0x14]
	cmp r1, r0
	bne _08007C72
	adds r0, r6, 0x1
	lsls r0, 24
	lsrs r6, r0, 24
_08007C72:
	adds r0, r4, 0x1
	lsls r0, 24
	lsrs r4, r0, 24
_08007C78:
	bl sub_8007B78
	lsls r0, 24
	lsrs r0, 24
	cmp r4, r0
	bcc _08007C58
	bl sub_8007B78
	lsls r0, 24
	lsrs r0, 24
	cmp r6, r0
	bne _08007C9C
	movs r2, 0x1
	ldr r0, _08007C98
	str r2, [r0]
	b _08007CA4
	.align 2, 0
_08007C98: .4byte 0x03000434
_08007C9C:
	movs r2, 0
	ldr r1, _08007CAC
	movs r0, 0x3
	str r0, [r1]
_08007CA4:
	adds r0, r2, 0
	pop {r4-r6}
	pop {r1}
	bx r1
	.align 2, 0
_08007CAC: .4byte 0x03000434
	thumb_func_end sub_8007C48

	thumb_func_start sub_8007CB0
sub_8007CB0: @ 8007CB0
	lsls r0, 24
	lsrs r0, 24
	ldr r2, _08007CC4
	lsls r1, r0, 3
	subs r1, r0
	lsls r1, 2
	adds r2, 0x4
	adds r1, r2
	ldr r0, [r1]
	bx lr
	.align 2, 0
_08007CC4: .4byte 0x03002970
	thumb_func_end sub_8007CB0

	thumb_func_start sub_8007CC8
sub_8007CC8: @ 8007CC8
	push {r4,r5,lr}
	ldr r5, _08007CE8
	movs r4, 0x3
_08007CCE:
	adds r0, r5, 0
	movs r1, 0
	movs r2, 0x1C
	bl memset
	adds r5, 0x1C
	subs r4, 0x1
	cmp r4, 0
	bge _08007CCE
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_08007CE8: .4byte 0x03002970
	thumb_func_end sub_8007CC8

	thumb_func_start sub_8007CEC
sub_8007CEC: @ 8007CEC
	ldr r1, _08007CFC
	movs r0, 0
	strb r0, [r1, 0x8]
	strh r0, [r1]
	strh r0, [r1, 0x2]
	str r0, [r1, 0x4]
	bx lr
	.align 2, 0
_08007CFC: .4byte 0x030003e8
	thumb_func_end sub_8007CEC

	thumb_func_start sub_8007D00
sub_8007D00: @ 8007D00
	push {r4-r7,lr}
	adds r7, r0, 0
	adds r6, r1, 0
	ldr r4, _08007D14
	ldrb r5, [r4, 0x8]
	cmp r5, 0
	beq _08007D18
	movs r0, 0
	b _08007D56
	.align 2, 0
_08007D14: .4byte 0x030003e8
_08007D18:
	bl link_get_multiplayer_id
	strb r0, [r4, 0x9]
	movs r0, 0x1
	strb r0, [r4, 0x8]
	strh r6, [r4, 0x2]
	strh r5, [r4]
	adds r0, 0xFF
	cmp r6, r0
	bls _08007D30
	str r7, [r4, 0x4]
	b _08007D42
_08007D30:
	ldr r5, _08007D5C
	cmp r7, r5
	beq _08007D40
	adds r0, r5, 0
	adds r1, r7, 0
	adds r2, r6, 0
	bl memcpy
_08007D40:
	str r5, [r4, 0x4]
_08007D42:
	ldr r0, _08007D60
	bl sub_80079A8
	ldr r1, _08007D64
	ldr r0, _08007D68
	str r0, [r1]
	ldr r1, _08007D6C
	movs r0, 0
	str r0, [r1]
	movs r0, 0x1
_08007D56:
	pop {r4-r7}
	pop {r1}
	bx r1
	.align 2, 0
_08007D5C: .4byte 0x03002a70
_08007D60: .4byte 0x0000bbbb
_08007D64: .4byte 0x03002fc0
_08007D68: .4byte sub_8007D70
_08007D6C: .4byte 0x03000428
	thumb_func_end sub_8007D00

	thumb_func_start sub_8007D70
sub_8007D70: @ 8007D70
	push {lr}
	ldr r1, _08007D88
	ldr r0, [r1]
	adds r0, 0x1
	str r0, [r1]
	cmp r0, 0x2
	bls _08007D84
	ldr r1, _08007D8C
	ldr r0, _08007D90
	str r0, [r1]
_08007D84:
	pop {r0}
	bx r0
	.align 2, 0
_08007D88: .4byte 0x03000428
_08007D8C: .4byte 0x03002fc0
_08007D90: .4byte sub_8007D94
	thumb_func_end sub_8007D70

	thumb_func_start sub_8007D94
sub_8007D94: @ 8007D94
	push {r4-r6,lr}
	ldr r0, _08007DE4
	ldr r5, [r0, 0x4]
	ldr r2, _08007DE8
	ldr r1, _08007DEC
	strh r1, [r2]
	movs r3, 0
	adds r4, r0, 0
	adds r6, r4, 0
	adds r2, 0x2
_08007DA8:
	lsls r0, r3, 1
	ldrh r1, [r6]
	adds r0, r1
	adds r0, r5
	ldrb r1, [r0, 0x1]
	lsls r1, 8
	ldrb r0, [r0]
	orrs r0, r1
	strh r0, [r2]
	adds r2, 0x2
	adds r3, 0x1
	cmp r3, 0x6
	ble _08007DA8
	ldrh r0, [r4]
	adds r0, 0xE
	strh r0, [r4]
	ldrh r1, [r4, 0x2]
	lsls r0, 16
	lsrs r0, 16
	cmp r1, r0
	bhi _08007DDC
	movs r0, 0
	strb r0, [r4, 0x8]
	ldr r1, _08007DF0
	ldr r0, _08007DF4
	str r0, [r1]
_08007DDC:
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_08007DE4: .4byte 0x030003e8
_08007DE8: .4byte 0x03002f90
_08007DEC: .4byte 0x00008888
_08007DF0: .4byte 0x03002fc0
_08007DF4: .4byte sub_8007DF8
	thumb_func_end sub_8007D94

	thumb_func_start sub_8007DF8
sub_8007DF8: @ 8007DF8
	ldr r1, _08007E00
	movs r0, 0
	str r0, [r1]
	bx lr
	.align 2, 0
_08007E00: .4byte 0x03002fc0
	thumb_func_end sub_8007DF8

	thumb_func_start sub_8007E04
sub_8007E04: @ 8007E04
	push {lr}
	bl link_get_multiplayer_id
	ldr r0, _08007E1C
	bl sub_80079A8
	ldr r1, _08007E20
	ldr r0, [r1]
	adds r0, 0x1
	str r0, [r1]
	pop {r0}
	bx r0
	.align 2, 0
_08007E1C: .4byte 0x00004444
_08007E20: .4byte 0x020238bc
	thumb_func_end sub_8007E04

	thumb_func_start sub_8007E24
sub_8007E24: @ 8007E24
	ldr r1, _08007E34
	movs r0, 0
	str r0, [r1]
	ldr r1, _08007E38
	ldr r0, _08007E3C
	str r0, [r1]
	bx lr
	.align 2, 0
_08007E34: .4byte 0x020238bc
_08007E38: .4byte 0x03002fc0
_08007E3C: .4byte sub_8007E04
	thumb_func_end sub_8007E24

	thumb_func_start sub_8007E40
sub_8007E40: @ 8007E40
	ldr r0, _08007E48
	ldr r0, [r0]
	bx lr
	.align 2, 0
_08007E48: .4byte 0x020238bc
	thumb_func_end sub_8007E40

	thumb_func_start sub_8007E4C
sub_8007E4C: @ 8007E4C
	push {lr}
	ldr r0, _08007E58
	bl sub_80079A8
	pop {r0}
	bx r0
	.align 2, 0
_08007E58: .4byte 0x0000aaaa
	thumb_func_end sub_8007E4C

	thumb_func_start link_get_multiplayer_id
link_get_multiplayer_id: @ 8007E5C
	ldr r0, _08007E68
	ldr r0, [r0]
	lsls r0, 26
	lsrs r0, 30
	bx lr
	.align 2, 0
_08007E68: .4byte 0x04000128
	thumb_func_end link_get_multiplayer_id

	thumb_func_start bitmask_all_link_players_but_self
bitmask_all_link_players_but_self: @ 8007E6C
	push {lr}
	bl link_get_multiplayer_id
	adds r1, r0, 0
	lsls r1, 24
	lsrs r1, 24
	movs r0, 0x1
	lsls r0, r1
	movs r1, 0xF
	eors r0, r1
	lsls r0, 24
	lsrs r0, 24
	pop {r1}
	bx r1
	thumb_func_end bitmask_all_link_players_but_self

	thumb_func_start sub_8007E88
sub_8007E88: @ 8007E88
	push {lr}
	adds r0, r1, 0
	lsls r1, r2, 16
	lsrs r1, 16
	bl sub_8007D00
	lsls r0, 24
	lsrs r0, 24
	pop {r1}
	bx r1
	thumb_func_end sub_8007E88

	thumb_func_start sub_8007E9C
sub_8007E9C: @ 8007E9C
	push {lr}
	lsls r0, 24
	lsrs r1, r0, 24
	ldr r0, _08007EB0
	ldr r0, [r0]
	cmp r0, 0
	beq _08007EB4
	movs r0, 0
	b _08007EC0
	.align 2, 0
_08007EB0: .4byte 0x03002fc0
_08007EB4:
	ldr r0, _08007EC4
	strb r1, [r0]
	ldr r0, _08007EC8
	bl sub_80079A8
	movs r0, 0x1
_08007EC0:
	pop {r1}
	bx r1
	.align 2, 0
_08007EC4: .4byte 0x03003054
_08007EC8: .4byte 0x0000cccc
	thumb_func_end sub_8007E9C

	thumb_func_start sub_8007ECC
sub_8007ECC: @ 8007ECC
	push {lr}
	movs r1, 0
	ldr r0, _08007EE0
	ldr r0, [r0]
	cmp r0, 0
	bne _08007EDA
	movs r1, 0x1
_08007EDA:
	adds r0, r1, 0
	pop {r1}
	bx r1
	.align 2, 0
_08007EE0: .4byte 0x03002fc0
	thumb_func_end sub_8007ECC

	thumb_func_start sub_8007EE4
sub_8007EE4: @ 8007EE4
	ldr r2, _08007F00
	ldrb r0, [r2, 0x3]
	lsls r0, 3
	ldrb r1, [r2, 0x2]
	lsls r1, 2
	orrs r0, r1
	ldrb r1, [r2, 0x1]
	lsls r1, 1
	orrs r0, r1
	ldrb r1, [r2]
	orrs r0, r1
	lsls r0, 24
	lsrs r0, 24
	bx lr
	.align 2, 0
_08007F00: .4byte 0x030029e0
	thumb_func_end sub_8007EE4

	thumb_func_start schedule_bg_copy_tilemap_to_vram
schedule_bg_copy_tilemap_to_vram: @ 8007F04
	lsls r0, 24
	lsrs r0, 24
	ldr r1, _08007F14
	adds r0, r1
	movs r1, 0x1
	strb r1, [r0]
	bx lr
	.align 2, 0
_08007F14: .4byte 0x030029e0
	thumb_func_end schedule_bg_copy_tilemap_to_vram

	thumb_func_start sub_8007F18
sub_8007F18: @ 8007F18
	push {lr}
	ldr r1, _08007F2C
	movs r2, 0
	adds r0, r1, 0x3
_08007F20:
	strb r2, [r0]
	subs r0, 0x1
	cmp r0, r1
	bge _08007F20
	pop {r0}
	bx r0
	.align 2, 0
_08007F2C: .4byte 0x030029e0
	thumb_func_end sub_8007F18

	thumb_func_start sub_8007F30
sub_8007F30: @ 8007F30
	push {lr}
	lsls r0, 24
	lsrs r0, 24
	ldr r1, _08007F48
	adds r1, r0, r1
	ldrb r0, [r1]
	cmp r0, 0
	beq _08007F44
	movs r0, 0
	strb r0, [r1]
_08007F44:
	pop {r0}
	bx r0
	.align 2, 0
_08007F48: .4byte 0x030029e0
	thumb_func_end sub_8007F30

	thumb_func_start sub_8007F4C
sub_8007F4C: @ 8007F4C
	push {lr}
	ldr r0, _08007F6C
	ldr r1, [r0]
	movs r0, 0x20
	ands r0, r1
	cmp r0, 0
	beq _08007F68
	movs r0, 0x1C
	ands r1, r0
	cmp r1, 0x4
	bls _08007F68
	ldr r1, _08007F70
	movs r0, 0x1
	strb r0, [r1]
_08007F68:
	pop {r0}
	bx r0
	.align 2, 0
_08007F6C: .4byte 0x03002a60
_08007F70: .4byte 0x03003040
	thumb_func_end sub_8007F4C

	thumb_func_start sub_8007F74
sub_8007F74: @ 8007F74
	push {r4,lr}
	adds r4, r0, 0
	lsls r1, 16
	movs r3, 0
	movs r2, 0
	lsrs r1, 17
	cmp r3, r1
	bcs _08007F9A
_08007F84:
	lsls r0, r2, 1
	adds r0, r4
	ldrh r0, [r0]
	adds r0, r3, r0
	lsls r0, 16
	lsrs r3, r0, 16
	adds r0, r2, 0x1
	lsls r0, 16
	lsrs r2, r0, 16
	cmp r2, r1
	bcc _08007F84
_08007F9A:
	adds r0, r3, 0
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end sub_8007F74

	thumb_func_start sub_8007FA4
sub_8007FA4: @ 8007FA4
	push {r4,r5,lr}
	lsls r0, 24
	lsrs r0, 24
	lsls r1, 24
	lsrs r1, 24
	lsls r2, 24
	ldr r4, _08007FD4
	ldr r3, [r4]
	lsls r3, 11
	movs r5, 0xC0
	lsls r5, 19
	adds r3, r5
	lsrs r2, 19
	adds r2, r1
	lsls r2, 1
	adds r2, r3
	ldr r1, [r4, 0x4]
	lsls r1, 12
	adds r0, 0x1
	orrs r1, r0
	strh r1, [r2]
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_08007FD4: .4byte 0x03002fb0
	thumb_func_end sub_8007FA4

	thumb_func_start sub_8007FD8
sub_8007FD8: @ 8007FD8
	push {r4-r7,lr}
	sub sp, 0x10
	adds r5, r0, 0
	lsls r1, 24
	lsrs r6, r1, 24
	lsls r2, 24
	lsrs r7, r2, 24
	lsls r3, 24
	lsrs r3, 24
	movs r4, 0
	cmp r4, r3
	bge _08008004
	movs r2, 0xF
_08007FF2:
	mov r0, sp
	adds r1, r0, r4
	adds r0, r5, 0
	ands r0, r2
	strb r0, [r1]
	lsrs r5, 4
	adds r4, 0x1
	cmp r4, r3
	blt _08007FF2
_08008004:
	subs r4, r3, 0x1
	cmp r4, 0
	blt _08008024
_0800800A:
	mov r1, sp
	adds r0, r1, r4
	ldrb r0, [r0]
	adds r1, r6, 0
	adds r2, r7, 0
	bl sub_8007FA4
	adds r0, r6, 0x1
	lsls r0, 24
	lsrs r6, r0, 24
	subs r4, 0x1
	cmp r4, 0
	bge _0800800A
_08008024:
	add sp, 0x10
	pop {r4-r7}
	pop {r0}
	bx r0
	thumb_func_end sub_8007FD8

	thumb_func_start sub_800802C
sub_800802C: @ 800802C
	push {lr}
	ldr r0, _0800804C
	ldr r0, [r0]
	movs r1, 0x20
	ands r0, r1
	cmp r0, 0
	beq _08008040
	ldr r0, _08008050
	bl sub_80079A8
_08008040:
	ldr r1, _08008054
	movs r0, 0
	str r0, [r1]
	pop {r0}
	bx r0
	.align 2, 0
_0800804C: .4byte 0x03002a60
_08008050: .4byte 0x00002222
_08008054: .4byte 0x03002fc0
	thumb_func_end sub_800802C

	thumb_func_start task00_link_test
task00_link_test: @ 8008058
	push {r4-r6,lr}
	ldr r0, _08008164
	ldrb r0, [r0]
	movs r1, 0x2
	movs r2, 0x1
	movs r3, 0x2
	bl sub_8007FD8
	ldr r4, _08008168
	ldr r0, [r4]
	movs r1, 0xF
	movs r2, 0x1
	movs r3, 0x8
	bl sub_8007FD8
	ldr r0, _0800816C
	ldrb r0, [r0, 0x1]
	movs r1, 0x2
	movs r2, 0xA
	movs r3, 0x2
	bl sub_8007FD8
	ldr r0, [r4]
	movs r1, 0x1C
	ands r0, r1
	lsrs r0, 2
	movs r1, 0xF
	movs r2, 0xA
	movs r3, 0x2
	bl sub_8007FD8
	bl link_get_multiplayer_id
	lsls r0, 24
	lsrs r0, 24
	movs r1, 0xF
	movs r2, 0xC
	movs r3, 0x2
	bl sub_8007FD8
	ldr r0, _08008170
	ldrb r0, [r0]
	movs r1, 0x19
	movs r2, 0x1
	movs r3, 0x2
	bl sub_8007FD8
	ldr r0, _08008174
	ldrb r0, [r0]
	movs r1, 0x19
	movs r2, 0x2
	movs r3, 0x2
	bl sub_8007FD8
	bl sub_8007EE4
	lsls r0, 24
	lsrs r0, 24
	movs r1, 0xF
	movs r2, 0x5
	movs r3, 0x2
	bl sub_8007FD8
	ldr r0, _08008178
	ldr r0, [r0]
	movs r1, 0x2
	movs r2, 0xC
	movs r3, 0x8
	bl sub_8007FD8
	ldr r0, _0800817C
	ldr r0, [r0]
	movs r1, 0x2
	movs r2, 0xD
	movs r3, 0x8
	bl sub_8007FD8
	bl sub_80086BC
	lsls r0, 24
	lsrs r0, 24
	movs r1, 0x19
	movs r2, 0x5
	movs r3, 0x1
	bl sub_8007FD8
	bl sub_80086CC
	lsls r0, 24
	lsrs r0, 24
	movs r1, 0x19
	movs r2, 0x6
	movs r3, 0x1
	bl sub_8007FD8
	bl sub_80086F4
	lsls r0, 24
	lsrs r0, 24
	movs r1, 0x19
	movs r2, 0x7
	movs r3, 0x1
	bl sub_8007FD8
	bl sub_8008710
	lsls r0, 24
	lsrs r0, 24
	movs r1, 0x19
	movs r2, 0x8
	movs r3, 0x1
	bl sub_8007FD8
	movs r6, 0
	movs r5, 0x80
	lsls r5, 19
	ldr r4, _08008180
_08008142:
	ldrh r0, [r4]
	lsrs r2, r5, 24
	movs r1, 0xA
	movs r3, 0x4
	bl sub_8007FD8
	movs r0, 0x80
	lsls r0, 17
	adds r5, r0
	adds r4, 0x2
	adds r6, 0x1
	cmp r6, 0x3
	ble _08008142
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_08008164: .4byte 0x03003040
_08008168: .4byte 0x03002a60
_0800816C: .4byte 0x03003070
_08008170: .4byte 0x03003060
_08008174: .4byte 0x03004030
_08008178: .4byte 0x03002918
_0800817C: .4byte 0x03002964
_08008180: .4byte 0x03003048
	thumb_func_end task00_link_test

	thumb_func_start sub_8008184
sub_8008184: @ 8008184
	ldr r2, _08008190
	str r0, [r2]
	ldr r0, _08008194
	str r1, [r0]
	bx lr
	.align 2, 0
_08008190: .4byte 0x03002918
_08008194: .4byte 0x03002964
	thumb_func_end sub_8008184

	thumb_func_start sub_8008198
sub_8008198: @ 8008198
	push {r4,lr}
	movs r1, 0
	movs r2, 0
	ldr r0, _080081C4
	ldrb r0, [r0]
	cmp r1, r0
	bge _080081BA
	movs r4, 0x1
	adds r3, r0, 0
_080081AA:
	adds r0, r4, 0
	lsls r0, r2
	orrs r1, r0
	lsls r0, r1, 24
	lsrs r1, r0, 24
	adds r2, 0x1
	cmp r2, r3
	blt _080081AA
_080081BA:
	adds r0, r1, 0
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_080081C4: .4byte 0x03002f84
	thumb_func_end sub_8008198

	thumb_func_start sub_80081C8
sub_80081C8: @ 80081C8
	push {r4-r7,lr}
	ldr r1, _080081FC
	strb r0, [r1]
	bl link_get_multiplayer_id
	ldr r1, _08008200
	strb r0, [r1]
	ldr r4, _08008204
	ldr r3, _08008208
	movs r2, 0x3
_080081DC:
	adds r0, r3, 0
	adds r1, r4, 0
	ldm r1!, {r5-r7}
	stm r0!, {r5-r7}
	ldm r1!, {r5-r7}
	stm r0!, {r5-r7}
	ldr r1, [r1]
	str r1, [r0]
	adds r4, 0x1C
	adds r3, 0x1C
	subs r2, 0x1
	cmp r2, 0
	bge _080081DC
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080081FC: .4byte 0x03002f84
_08008200: .4byte 0x03002fa0
_08008204: .4byte 0x03002970
_08008208: .4byte 0x03002fd0
	thumb_func_end sub_80081C8

	thumb_func_start sub_800820C
sub_800820C: @ 800820C
	ldr r0, _08008214
	ldrb r0, [r0]
	bx lr
	.align 2, 0
_08008214: .4byte 0x03002f84
	thumb_func_end sub_800820C

	thumb_func_start sub_8008218
sub_8008218: @ 8008218
	ldr r0, _08008220
	ldrb r0, [r0]
	bx lr
	.align 2, 0
_08008220: .4byte 0x03002fa0
	thumb_func_end sub_8008218

	thumb_func_start sub_8008224
sub_8008224: @ 8008224
	push {r4-r6,lr}
	movs r5, 0
	ldr r0, _08008258
	ldrb r2, [r0]
	adds r6, r0, 0
	cmp r5, r2
	bge _0800824E
	ldr r1, _0800825C
	ldr r0, _08008260
	adds r4, r0, 0x4
	adds r3, r1, 0x4
_0800823A:
	ldr r1, [r3]
	ldr r0, [r4]
	cmp r1, r0
	bne _08008244
	adds r5, 0x1
_08008244:
	adds r4, 0x1C
	adds r3, 0x1C
	subs r2, 0x1
	cmp r2, 0
	bne _0800823A
_0800824E:
	ldrb r6, [r6]
	cmp r5, r6
	beq _08008264
	movs r0, 0
	b _08008266
	.align 2, 0
_08008258: .4byte 0x03002f84
_0800825C: .4byte 0x03002970
_08008260: .4byte 0x03002fd0
_08008264:
	movs r0, 0x1
_08008266:
	pop {r4-r6}
	pop {r1}
	bx r1
	thumb_func_end sub_8008224

	thumb_func_start sub_800826C
sub_800826C: @ 800826C
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	movs r4, 0
	ldr r0, _080082D8
	ldrb r0, [r0]
	cmp r4, r0
	bcs _080082CC
	ldr r6, _080082DC
	ldr r5, _080082E0
	movs r0, 0x8
	adds r0, r6
	mov r8, r0
	adds r7, r5, 0
	adds r7, 0x8
_0800828A:
	lsls r0, r4, 3
	subs r0, r4
	lsls r2, r0, 2
	adds r1, r6, 0x4
	adds r1, r2, r1
	adds r0, r5, 0x4
	adds r0, r2, r0
	ldr r1, [r1]
	ldr r0, [r0]
	cmp r1, r0
	bne _080082AE
	mov r1, r8
	adds r0, r2, r1
	adds r1, r2, r7
	bl CompareStringWithoutExtendedControlCodes
	cmp r0, 0
	beq _080082BE
_080082AE:
	ldr r1, _080082E4
	movs r0, 0x1
	strb r0, [r1]
	bl AllocZeroed
	ldr r0, _080082E8
	bl SetMainCallback2
_080082BE:
	adds r0, r4, 0x1
	lsls r0, 24
	lsrs r4, r0, 24
	ldr r0, _080082D8
	ldrb r0, [r0]
	cmp r4, r0
	bcc _0800828A
_080082CC:
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080082D8: .4byte 0x03002f84
_080082DC: .4byte 0x03002fd0
_080082E0: .4byte 0x03002970
_080082E4: .4byte 0x0300295c
_080082E8: .4byte sub_80085BC
	thumb_func_end sub_800826C

	thumb_func_start sub_80082EC
sub_80082EC: @ 80082EC
	ldr r0, _080082F8
	movs r1, 0
	strb r1, [r0]
	ldr r0, _080082FC
	strb r1, [r0]
	bx lr
	.align 2, 0
_080082F8: .4byte 0x03002f84
_080082FC: .4byte 0x03002fa0
	thumb_func_end sub_80082EC

	thumb_func_start sub_8008300
sub_8008300: @ 8008300
	ldr r0, _0800830C
	ldr r0, [r0]
	movs r1, 0x1C
	ands r0, r1
	lsrs r0, 2
	bx lr
	.align 2, 0
_0800830C: .4byte 0x03002a60
	thumb_func_end sub_8008300

	thumb_func_start sub_8008310
sub_8008310: @ 8008310
	ldr r0, _0800831C
	ldr r0, [r0]
	lsrs r0, 5
	movs r1, 0x1
	ands r0, r1
	bx lr
	.align 2, 0
_0800831C: .4byte 0x03002a60
	thumb_func_end sub_8008310

	thumb_func_start sub_8008320
sub_8008320: @ 8008320
	ldr r0, _08008328
	ldrb r0, [r0]
	bx lr
	.align 2, 0
_08008328: .4byte 0x03000430
	thumb_func_end sub_8008320

	thumb_func_start sub_800832C
sub_800832C: @ 800832C
	push {lr}
	ldr r2, _08008344
	ldr r1, [r2]
	cmp r1, 0
	bne _0800833E
	ldr r0, _08008348
	str r0, [r2]
	ldr r0, _0800834C
	strb r1, [r0]
_0800833E:
	pop {r0}
	bx r0
	.align 2, 0
_08008344: .4byte 0x03002fc0
_08008348: .4byte sub_8008350
_0800834C: .4byte 0x03002a64
	thumb_func_end sub_800832C

	thumb_func_start sub_8008350
sub_8008350: @ 8008350
	push {lr}
	ldr r0, _0800836C
	ldrb r0, [r0]
	cmp r0, 0
	bne _08008366
	ldr r0, _08008370
	bl sub_80079A8
	ldr r1, _08008374
	ldr r0, _08008378
	str r0, [r1]
_08008366:
	pop {r0}
	bx r0
	.align 2, 0
_0800836C: .4byte 0x03004030
_08008370: .4byte 0x00005fff
_08008374: .4byte 0x03002fc0
_08008378: .4byte sub_800837C
	thumb_func_end sub_8008350

	thumb_func_start sub_800837C
sub_800837C: @ 800837C
	push {r4,lr}
	bl sub_8007B78
	lsls r0, 24
	lsrs r2, r0, 24
	movs r3, 0
	movs r1, 0
	cmp r3, r2
	bge _080083A0
	ldr r4, _080083C8
_08008390:
	adds r0, r1, r4
	ldrb r0, [r0]
	cmp r0, 0
	beq _0800839A
	adds r3, 0x1
_0800839A:
	adds r1, 0x1
	cmp r1, r2
	blt _08008390
_080083A0:
	cmp r3, r2
	bne _080083C2
	ldr r2, _080083CC
	ldrh r1, [r2]
	ldr r0, _080083D0
	ands r0, r1
	strh r0, [r2]
	ldr r0, _080083D4
	movs r4, 0x1
	strb r4, [r0]
	bl AllocZeroed
	ldr r1, _080083D8
	movs r0, 0
	str r0, [r1]
	ldr r0, _080083DC
	strb r4, [r0]
_080083C2:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080083C8: .4byte 0x03002b78
_080083CC: .4byte 0x020239f8
_080083D0: .4byte 0x0000ffdf
_080083D4: .4byte 0x03001bf8
_080083D8: .4byte 0x03002fc0
_080083DC: .4byte 0x03002a64
	thumb_func_end sub_800837C

	thumb_func_start sub_80083E0
sub_80083E0: @ 80083E0
	push {r4,r5,lr}
	bl sub_8007B78
	lsls r0, 24
	lsrs r3, r0, 24
	movs r1, 0
	movs r2, 0
	cmp r1, r3
	bge _0800840E
	ldr r5, _08008438
	ldr r4, _0800843C
_080083F6:
	ldrh r0, [r4, 0x1A]
	cmp r0, 0x1
	beq _08008404
	adds r0, r2, r5
	ldrb r0, [r0]
	cmp r0, 0
	beq _08008406
_08008404:
	adds r1, 0x1
_08008406:
	adds r4, 0x1C
	adds r2, 0x1
	cmp r2, r3
	blt _080083F6
_0800840E:
	cmp r1, r3
	bne _08008430
	ldr r2, _08008440
	ldrh r1, [r2]
	ldr r0, _08008444
	ands r0, r1
	strh r0, [r2]
	ldr r0, _08008448
	movs r4, 0x1
	strb r4, [r0]
	bl AllocZeroed
	ldr r1, _0800844C
	movs r0, 0
	str r0, [r1]
	ldr r0, _08008450
	strb r4, [r0]
_08008430:
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_08008438: .4byte 0x03002b78
_0800843C: .4byte 0x03002970
_08008440: .4byte 0x020239f8
_08008444: .4byte 0x0000ffdf
_08008448: .4byte 0x03001bf8
_0800844C: .4byte 0x03002fc0
_08008450: .4byte 0x03002a64
	thumb_func_end sub_80083E0

	thumb_func_start sub_8008454
sub_8008454: @ 8008454
	push {lr}
	ldr r0, _08008470
	ldrb r0, [r0]
	cmp r0, 0
	bne _0800846A
	ldr r0, _08008474
	bl sub_80079A8
	ldr r1, _08008478
	ldr r0, _0800847C
	str r0, [r1]
_0800846A:
	pop {r0}
	bx r0
	.align 2, 0
_08008470: .4byte 0x03004030
_08008474: .4byte 0x00005fff
_08008478: .4byte 0x03002fc0
_0800847C: .4byte sub_80083E0
	thumb_func_end sub_8008454

	thumb_func_start sub_8008480
sub_8008480: @ 8008480
	push {lr}
	ldr r2, _08008498
	ldr r1, [r2]
	cmp r1, 0
	bne _08008492
	ldr r0, _0800849C
	str r0, [r2]
	ldr r0, _080084A0
	strb r1, [r0]
_08008492:
	pop {r0}
	bx r0
	.align 2, 0
_08008498: .4byte 0x03002fc0
_0800849C: .4byte sub_8008454
_080084A0: .4byte 0x03002a64
	thumb_func_end sub_8008480

	thumb_func_start sub_80084A4
sub_80084A4: @ 80084A4
	push {lr}
	ldr r1, _080084BC
	ldr r0, [r1]
	cmp r0, 0
	bne _080084B2
	ldr r0, _080084C0
	str r0, [r1]
_080084B2:
	ldr r1, _080084C4
	movs r0, 0
	strb r0, [r1]
	pop {r0}
	bx r0
	.align 2, 0
_080084BC: .4byte 0x03002fc0
_080084C0: .4byte sub_80084C8
_080084C4: .4byte 0x03002a64
	thumb_func_end sub_80084A4

	thumb_func_start sub_80084C8
sub_80084C8: @ 80084C8
	push {lr}
	ldr r0, _080084E4
	ldrb r0, [r0]
	cmp r0, 0
	bne _080084DE
	ldr r0, _080084E8
	bl sub_80079A8
	ldr r1, _080084EC
	ldr r0, _080084F0
	str r0, [r1]
_080084DE:
	pop {r0}
	bx r0
	.align 2, 0
_080084E4: .4byte 0x03004030
_080084E8: .4byte 0x00002ffe
_080084EC: .4byte 0x03002fc0
_080084F0: .4byte sub_80084F4
	thumb_func_end sub_80084C8

	thumb_func_start sub_80084F4
sub_80084F4: @ 80084F4
	push {r4,lr}
	bl sub_8007B78
	lsls r0, 24
	lsrs r2, r0, 24
	movs r1, 0
	cmp r1, r2
	bcs _0800851E
	ldr r3, _08008544
	ldrb r0, [r3]
	cmp r0, 0
	beq _0800851E
_0800850C:
	adds r0, r1, 0x1
	lsls r0, 24
	lsrs r1, r0, 24
	cmp r1, r2
	bcs _0800851E
	adds r0, r1, r3
	ldrb r0, [r0]
	cmp r0, 0
	bne _0800850C
_0800851E:
	cmp r1, r2
	bne _0800853C
	movs r1, 0
	ldr r4, _08008548
	ldr r3, _08008544
	movs r2, 0
_0800852A:
	adds r0, r1, r3
	strb r2, [r0]
	adds r0, r1, 0x1
	lsls r0, 24
	lsrs r1, r0, 24
	cmp r1, 0x3
	bls _0800852A
	movs r0, 0
	str r0, [r4]
_0800853C:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08008544: .4byte 0x03002b70
_08008548: .4byte 0x03002fc0
	thumb_func_end sub_80084F4

	thumb_func_start sub_800854C
sub_800854C: @ 800854C
	push {lr}
	ldr r0, _08008594
	ldrb r0, [r0]
	cmp r0, 0
	beq _08008590
	ldr r0, _08008598
	ldr r1, [r0]
	movs r0, 0xFE
	lsls r0, 11
	ands r0, r1
	cmp r0, 0
	beq _08008590
	ldr r0, _0800859C
	ldrb r0, [r0]
	cmp r0, 0
	bne _08008586
	ldr r0, _080085A0
	str r1, [r0]
	ldr r1, _080085A4
	ldr r0, _080085A8
	ldrb r0, [r0]
	str r0, [r1]
	ldr r1, _080085AC
	ldr r0, _080085B0
	ldrb r0, [r0]
	str r0, [r1]
	ldr r0, _080085B4
	bl SetMainCallback2
_08008586:
	ldr r1, _080085B8
	movs r0, 0x1
	strb r0, [r1]
	bl AllocZeroed
_08008590:
	pop {r0}
	bx r0
	.align 2, 0
_08008594: .4byte 0x020238c0
_08008598: .4byte 0x03002a60
_0800859C: .4byte 0x03002f80
_080085A0: .4byte 0x03000438
_080085A4: .4byte 0x0300043c
_080085A8: .4byte 0x03004030
_080085AC: .4byte 0x03000440
_080085B0: .4byte 0x03003060
_080085B4: .4byte sub_80085BC
_080085B8: .4byte 0x0300295c
	thumb_func_end sub_800854C

	thumb_func_start sub_80085BC
sub_80085BC: @ 80085BC
	push {r4,lr}
	bl ResetSpriteData
	bl FreeAllSpritePalettes
	bl pal_fade_control_reset_maybe
	movs r0, 0
	movs r1, 0
	movs r2, 0x2
	bl rboxid_80040B8
	bl ResetTasks
	ldr r0, _08008638
	bl SetVBlankCallback
	ldr r4, _0800863C
	adds r0, r4, 0
	bl sub_8002A34
	adds r0, r4, 0
	bl sub_8071C4C
	bl sub_8071EF4
	ldr r0, _08008640
	movs r1, 0
	strh r1, [r0]
	subs r0, 0x40
	strh r1, [r0]
	subs r0, 0x2
	strh r1, [r0]
	movs r2, 0x80
	lsls r2, 19
	movs r3, 0xA0
	lsls r3, 1
	adds r0, r3, 0
	strh r0, [r2]
	ldr r0, _08008644
	strb r1, [r0]
	ldr r0, _08008648
	movs r1, 0
	bl CreateTask
	bl sub_8074D08
	bl RunTasks
	bl AnimateSprites
	bl BuildOamBuffer
	bl fade_and_return_progress_probably
	ldr r0, _0800864C
	bl SetMainCallback2
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08008638: .4byte sub_8007300
_0800863C: .4byte gUnknown_081E7198
_08008640: .4byte 0x04000052
_08008644: .4byte 0x03001bb4
_08008648: .4byte sub_8007080
_0800864C: .4byte sub_8008650
	thumb_func_end sub_80085BC

	thumb_func_start sub_8008650
sub_8008650: @ 8008650
	push {lr}
	sub sp, 0x40
	ldr r0, _0800866C
	ldr r1, _08008670
	adds r0, r1
	ldrb r0, [r0]
	cmp r0, 0x1E
	beq _08008690
	cmp r0, 0x1E
	bgt _08008674
	cmp r0, 0
	beq _0800867E
	b _0800869E
	.align 2, 0
_0800866C: .4byte 0x03001770
_08008670: .4byte 0x0000043c
_08008674:
	cmp r0, 0x3C
	beq _08008690
	cmp r0, 0x5A
	beq _08008698
	b _0800869E
_0800867E:
	ldr r0, _0800868C
	movs r1, 0x14
	movs r2, 0x38
	movs r3, 0x1
	bl sub_80729D8
	b _0800869E
	.align 2, 0
_0800868C: .4byte gUnknown_0842C34C
_08008690:
	movs r0, 0x16
	bl audio_play
	b _0800869E
_08008698:
	movs r0, 0x16
	bl audio_play
_0800869E:
	ldr r0, _080086B4
	ldr r2, _080086B8
	adds r1, r0, r2
	ldrb r0, [r1]
	cmp r0, 0xC8
	beq _080086AE
	adds r0, 0x1
	strb r0, [r1]
_080086AE:
	add sp, 0x40
	pop {r0}
	bx r0
	.align 2, 0
_080086B4: .4byte 0x03001770
_080086B8: .4byte 0x0000043c
	thumb_func_end sub_8008650

	thumb_func_start sub_80086BC
sub_80086BC: @ 80086BC
	ldr r0, _080086C8
	ldrh r0, [r0]
	lsrs r0, 2
	movs r1, 0x1
	ands r0, r1
	bx lr
	.align 2, 0
_080086C8: .4byte 0x04000128
	thumb_func_end sub_80086BC

	thumb_func_start sub_80086CC
sub_80086CC: @ 80086CC
	push {lr}
	movs r3, 0
	ldr r2, _080086F0
	ldrh r1, [r2]
	movs r0, 0x8
	ands r0, r1
	cmp r0, 0
	beq _080086E8
	ldrh r1, [r2]
	movs r0, 0x4
	ands r0, r1
	cmp r0, 0
	bne _080086E8
	movs r3, 0x1
_080086E8:
	adds r0, r3, 0
	pop {r1}
	bx r1
	.align 2, 0
_080086F0: .4byte 0x04000128
	thumb_func_end sub_80086CC

	thumb_func_start sub_80086F4
sub_80086F4: @ 80086F4
	ldr r0, _08008700
	ldr r0, [r0]
	lsrs r0, 6
	movs r1, 0x1
	ands r0, r1
	bx lr
	.align 2, 0
_08008700: .4byte 0x03002a60
	thumb_func_end sub_80086F4

	thumb_func_start sub_8008704
sub_8008704: @ 8008704
	ldr r1, _0800870C
	strb r0, [r1]
	bx lr
	.align 2, 0
_0800870C: .4byte 0x03002f80
	thumb_func_end sub_8008704

	thumb_func_start sub_8008710
sub_8008710: @ 8008710
	ldr r0, _08008718
	ldrb r0, [r0]
	bx lr
	.align 2, 0
_08008718: .4byte 0x0300295c
	thumb_func_end sub_8008710

	thumb_func_start sub_800871C
sub_800871C: @ 800871C
	push {r4,r5,lr}
	sub sp, 0x4
	ldr r0, _0800875C
	ldr r2, _08008760
	ldrh r5, [r2]
	strh r5, [r0]
	movs r4, 0
	strh r4, [r2]
	ldr r3, _08008764
	ldrh r1, [r3]
	ldr r0, _08008768
	ands r0, r1
	strh r0, [r3]
	strh r5, [r2]
	ldr r0, _0800876C
	strh r4, [r0]
	subs r0, 0x1A
	strh r4, [r0]
	ldr r1, _08008770
	movs r0, 0xC0
	strh r0, [r1]
	movs r0, 0
	str r0, [sp]
	ldr r1, _08008774
	ldr r2, _08008778
	mov r0, sp
	bl CpuSet
	add sp, 0x4
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_0800875C: .4byte 0x03004034
_08008760: .4byte 0x04000208
_08008764: .4byte 0x04000200
_08008768: .4byte 0x0000ff3f
_0800876C: .4byte 0x04000128
_08008770: .4byte 0x04000202
_08008774: .4byte 0x03003070
_08008778: .4byte 0x050003f0
	thumb_func_end sub_800871C

	thumb_func_start sub_800877C
sub_800877C: @ 800877C
	push {r4-r7,lr}
	sub sp, 0x4
	ldr r6, _080087F4
	ldr r3, _080087F8
	ldrh r2, [r3]
	movs r4, 0
	strh r4, [r3]
	ldr r5, _080087FC
	ldrh r1, [r5]
	ldr r0, _08008800
	ands r0, r1
	strh r0, [r5]
	strh r2, [r3]
	ldr r0, _08008804
	strh r4, [r0]
	ldr r2, _08008808
	movs r1, 0x80
	lsls r1, 6
	adds r0, r1, 0
	strh r0, [r2]
	ldrh r0, [r2]
	ldr r7, _0800880C
	adds r1, r7, 0
	orrs r0, r1
	strh r0, [r2]
	ldrh r2, [r3]
	strh r2, [r6]
	strh r4, [r3]
	ldrh r0, [r5]
	movs r1, 0x80
	orrs r0, r1
	strh r0, [r5]
	strh r2, [r3]
	ldr r0, _08008810
	strh r4, [r0]
	movs r5, 0
	str r5, [sp]
	ldr r1, _08008814
	ldr r2, _08008818
	mov r0, sp
	bl CpuSet
	ldr r0, _0800881C
	strb r4, [r0]
	ldr r0, _08008820
	strh r5, [r0]
	ldr r0, _08008824
	strh r5, [r0]
	ldr r0, _08008828
	strb r4, [r0]
	ldr r0, _0800882C
	strb r4, [r0]
	ldr r0, _08008830
	strb r4, [r0]
	ldr r0, _08008834
	strb r4, [r0]
	add sp, 0x4
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080087F4: .4byte 0x03004034
_080087F8: .4byte 0x04000208
_080087FC: .4byte 0x04000200
_08008800: .4byte 0x0000ff3f
_08008804: .4byte 0x04000134
_08008808: .4byte 0x04000128
_0800880C: .4byte 0x00004003
_08008810: .4byte 0x0400012a
_08008814: .4byte 0x03003070
_08008818: .4byte 0x050003f0
_0800881C: .4byte 0x03000450
_08008820: .4byte 0x03000452
_08008824: .4byte 0x03000454
_08008828: .4byte 0x03000456
_0800882C: .4byte 0x03000457
_08008830: .4byte 0x03003060
_08008834: .4byte 0x03004030
	thumb_func_end sub_800877C

	thumb_func_start sub_8008838
sub_8008838: @ 8008838
	push {lr}
	bl sub_800877C
	bl sub_800871C
	pop {r0}
	bx r0
	thumb_func_end sub_8008838

	thumb_func_start sub_8008848
sub_8008848: @ 8008848
	push {r4-r7,lr}
	adds r4, r0, 0
	adds r5, r1, 0
	adds r6, r2, 0
	ldr r0, _08008864
	ldrb r0, [r0, 0x1]
	cmp r0, 0x4
	bhi _080088FA
	lsls r0, 2
	ldr r1, _08008868
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_08008864: .4byte 0x03003070
_08008868: .4byte _0800886C
	.align 2, 0
_0800886C:
	.4byte _08008880
	.4byte _08008890
	.4byte _080088A8
	.4byte _080088E4
	.4byte _080088EE
_08008880:
	bl sub_800871C
	ldr r1, _0800888C
	movs r0, 0x1
	strb r0, [r1, 0x1]
	b _080088FA
	.align 2, 0
_0800888C: .4byte 0x03003070
_08008890:
	ldrb r0, [r4]
	cmp r0, 0x1
	bne _080088FA
	bl sub_800877C
	ldr r1, _080088A4
	movs r0, 0x2
	strb r0, [r1, 0x1]
	b _080088FA
	.align 2, 0
_080088A4: .4byte 0x03003070
_080088A8:
	ldrb r1, [r4]
	cmp r1, 0x1
	beq _080088B8
	cmp r1, 0x2
	beq _080088D0
	bl sub_8008974
	b _080088FA
_080088B8:
	ldr r2, _080088CC
	ldrb r0, [r2]
	cmp r0, 0x8
	bne _080088FA
	ldrb r0, [r2, 0x3]
	cmp r0, 0x1
	bls _080088FA
	strb r1, [r2, 0xE]
	b _080088FA
	.align 2, 0
_080088CC: .4byte 0x03003070
_080088D0:
	ldr r0, _080088DC
	movs r1, 0
	strb r1, [r0, 0x1]
	ldr r0, _080088E0
	strh r1, [r0]
	b _080088FA
	.align 2, 0
_080088DC: .4byte 0x03003070
_080088E0: .4byte 0x0400012a
_080088E4:
	bl sub_80089A0
	ldr r1, _08008934
	movs r0, 0x4
	strb r0, [r1, 0x1]
_080088EE:
	adds r0, r5, 0
	bl sub_80089F0
	adds r0, r6, 0
	bl sub_8008AD8
_080088FA:
	movs r0, 0
	strb r0, [r4]
	ldr r1, _08008934
	ldrb r2, [r1, 0x2]
	ldrb r0, [r1, 0x3]
	lsls r0, 2
	orrs r2, r0
	ldrb r0, [r1]
	cmp r0, 0x8
	bne _08008912
	movs r0, 0x20
	orrs r2, r0
_08008912:
	ldrb r0, [r1, 0xC]
	lsls r3, r0, 8
	ldrb r0, [r1, 0xF]
	lsls r4, r0, 9
	ldrb r0, [r1, 0x10]
	lsls r5, r0, 12
	ldrb r0, [r1, 0x11]
	lsls r6, r0, 13
	ldrb r0, [r1, 0x12]
	lsls r7, r0, 14
	ldrb r0, [r1, 0x1]
	cmp r0, 0x4
	bne _08008938
	movs r0, 0x40
	orrs r0, r3
	orrs r0, r2
	b _0800893C
	.align 2, 0
_08008934: .4byte 0x03003070
_08008938:
	adds r0, r2, 0
	orrs r0, r3
_0800893C:
	orrs r0, r4
	orrs r0, r5
	orrs r0, r6
	orrs r0, r7
	adds r2, r0, 0
	ldrb r3, [r1, 0x13]
	cmp r3, 0x1
	bne _08008952
	movs r0, 0x80
	lsls r0, 9
	orrs r2, r0
_08008952:
	ldrb r0, [r1, 0x2]
	cmp r0, 0x3
	bls _0800895E
	movs r0, 0x80
	lsls r0, 10
	orrs r2, r0
_0800895E:
	adds r1, r2, 0
	cmp r3, 0x2
	bne _0800896A
	movs r0, 0x80
	lsls r0, 11
	orrs r1, r0
_0800896A:
	adds r0, r1, 0
	pop {r4-r7}
	pop {r1}
	bx r1
	thumb_func_end sub_8008848

	thumb_func_start sub_8008974
sub_8008974: @ 8008974
	push {lr}
	ldr r0, _08008990
	ldr r1, [r0]
	movs r0, 0xC
	ands r1, r0
	ldr r2, _08008994
	cmp r1, 0x8
	bne _08008998
	ldrb r0, [r2, 0x2]
	cmp r0, 0
	bne _08008998
	strb r1, [r2]
	b _0800899C
	.align 2, 0
_08008990: .4byte 0x04000128
_08008994: .4byte 0x03003070
_08008998:
	movs r0, 0
	strb r0, [r2]
_0800899C:
	pop {r0}
	bx r0
	thumb_func_end sub_8008974

	thumb_func_start sub_80089A0
sub_80089A0: @ 80089A0
	push {r4,lr}
	ldr r0, _080089D8
	ldrb r0, [r0]
	cmp r0, 0
	beq _080089D0
	ldr r1, _080089DC
	ldr r2, _080089E0
	adds r0, r2, 0
	strh r0, [r1]
	adds r1, 0x2
	movs r0, 0x41
	strh r0, [r1]
	ldr r0, _080089E4
	ldr r2, _080089E8
	ldrh r4, [r2]
	strh r4, [r0]
	movs r0, 0
	strh r0, [r2]
	ldr r3, _080089EC
	ldrh r0, [r3]
	movs r1, 0x40
	orrs r0, r1
	strh r0, [r3]
	strh r4, [r2]
_080089D0:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080089D8: .4byte 0x03003070
_080089DC: .4byte 0x0400010c
_080089E0: .4byte 0x0000ff3b
_080089E4: .4byte 0x03004034
_080089E8: .4byte 0x04000208
_080089EC: .4byte 0x04000200
	thumb_func_end sub_80089A0

	thumb_func_start sub_80089F0
sub_80089F0: @ 80089F0
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	adds r3, r0, 0
	ldr r2, _08008A68
	ldr r1, _08008A6C
	ldrh r0, [r1]
	strh r0, [r2]
	movs r0, 0
	strh r0, [r1]
	ldr r1, _08008A70
	ldr r4, _08008A74
	adds r0, r1, r4
	ldrb r4, [r0]
	adds r6, r1, 0
	cmp r4, 0x31
	bhi _08008A80
	movs r1, 0xCE
	lsls r1, 2
	adds r0, r6, r1
	ldrb r0, [r0]
	adds r0, r4, r0
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x31
	bls _08008A2E
	subs r0, 0x32
	lsls r0, 24
	lsrs r0, 24
_08008A2E:
	movs r2, 0
	ldr r4, _08008A78
	mov r9, r4
	ldr r1, _08008A7C
	mov r10, r1
	lsls r5, r0, 1
	movs r0, 0x18
	adds r0, r6
	mov r8, r0
	mov r12, r2
	movs r7, 0x64
_08008A44:
	ldrh r0, [r4]
	ldrh r1, [r3]
	orrs r0, r1
	strh r0, [r4]
	adds r0, r2, 0
	muls r0, r7
	adds r0, r5, r0
	add r0, r8
	strh r1, [r0]
	mov r1, r12
	strh r1, [r3]
	adds r3, 0x2
	adds r0, r2, 0x1
	lsls r0, 24
	lsrs r2, r0, 24
	cmp r2, 0x7
	bls _08008A44
	b _08008A8C
	.align 2, 0
_08008A68: .4byte 0x03004034
_08008A6C: .4byte 0x04000208
_08008A70: .4byte 0x03003070
_08008A74: .4byte 0x00000339
_08008A78: .4byte 0x03000452
_08008A7C: .4byte 0x03003060
_08008A80:
	movs r0, 0x1
	strb r0, [r6, 0x12]
	ldr r2, _08008AC4
	mov r9, r2
	ldr r4, _08008AC8
	mov r10, r4
_08008A8C:
	mov r1, r9
	ldrh r0, [r1]
	cmp r0, 0
	beq _08008AA4
	ldr r2, _08008ACC
	adds r0, r6, r2
	ldrb r1, [r0]
	adds r1, 0x1
	movs r2, 0
	strb r1, [r0]
	mov r4, r9
	strh r2, [r4]
_08008AA4:
	ldr r1, _08008AD0
	ldr r2, _08008AD4
	ldrh r0, [r2]
	strh r0, [r1]
	ldr r4, _08008ACC
	adds r0, r6, r4
	ldrb r0, [r0]
	mov r1, r10
	strb r0, [r1]
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_08008AC4: .4byte 0x03000452
_08008AC8: .4byte 0x03003060
_08008ACC: .4byte 0x00000339
_08008AD0: .4byte 0x04000208
_08008AD4: .4byte 0x03004034
	thumb_func_end sub_80089F0

	thumb_func_start sub_8008AD8
sub_8008AD8: @ 8008AD8
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	mov r12, r0
	ldr r2, _08008B38
	ldr r1, _08008B3C
	ldrh r0, [r1]
	strh r0, [r2]
	movs r0, 0
	strh r0, [r1]
	ldr r1, _08008B40
	ldr r3, _08008B44
	adds r0, r1, r3
	ldrb r0, [r0]
	adds r7, r1, 0
	cmp r0, 0
	bne _08008B48
	movs r3, 0
	mov r8, r7
	ldrb r6, [r7, 0x3]
_08008B04:
	movs r2, 0
	adds r5, r3, 0x1
	cmp r2, r6
	bcs _08008B28
	lsls r0, r3, 3
	mov r1, r12
	adds r3, r0, r1
	movs r4, 0
	mov r0, r8
	ldrb r1, [r0, 0x3]
_08008B18:
	lsls r0, r2, 1
	adds r0, r3
	strh r4, [r0]
	adds r0, r2, 0x1
	lsls r0, 24
	lsrs r2, r0, 24
	cmp r2, r1
	bcc _08008B18
_08008B28:
	lsls r0, r5, 24
	lsrs r3, r0, 24
	cmp r3, 0x7
	bls _08008B04
	movs r0, 0x1
	strb r0, [r7, 0xC]
	b _08008BC0
	.align 2, 0
_08008B38: .4byte 0x03004034
_08008B3C: .4byte 0x04000208
_08008B40: .4byte 0x03003070
_08008B44: .4byte 0x00000fbd
_08008B48:
	movs r3, 0
	ldrb r1, [r7, 0x3]
	mov r9, r1
	movs r2, 0xCF
	lsls r2, 2
	adds r2, r7
	mov r8, r2
	mov r10, r7
_08008B58:
	movs r2, 0
	adds r5, r3, 0x1
	cmp r2, r9
	bcs _08008B94
	lsls r0, r3, 3
	mov r1, r12
	adds r6, r0, r1
	ldr r0, _08008BD8
	ldrb r1, [r0]
	lsls r1, 1
	mov r0, r10
	ldrb r4, [r0, 0x3]
	movs r0, 0x64
	muls r0, r3
	adds r3, r1, r0
_08008B76:
	lsls r0, r2, 1
	adds r1, r0, r6
	adds r0, r2
	lsls r0, 3
	adds r0, r2
	lsls r0, 5
	adds r0, r3, r0
	add r0, r8
	ldrh r0, [r0]
	strh r0, [r1]
	adds r0, r2, 0x1
	lsls r0, 24
	lsrs r2, r0, 24
	cmp r2, r4
	bcc _08008B76
_08008B94:
	lsls r0, r5, 24
	lsrs r3, r0, 24
	cmp r3, 0x7
	bls _08008B58
	adds r2, r7, 0
	ldr r3, _08008BDC
	adds r1, r2, r3
	ldrb r0, [r1]
	subs r0, 0x1
	movs r3, 0
	strb r0, [r1]
	ldr r0, _08008BE0
	adds r2, r0
	ldrb r0, [r2]
	adds r0, 0x1
	strb r0, [r2]
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x31
	bls _08008BBE
	strb r3, [r2]
_08008BBE:
	strb r3, [r7, 0xC]
_08008BC0:
	ldr r1, _08008BE4
	ldr r2, _08008BE8
	ldrh r0, [r2]
	strh r0, [r1]
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_08008BD8: .4byte 0x0300402c
_08008BDC: .4byte 0x00000fbd
_08008BE0: .4byte 0x00000fbc
_08008BE4: .4byte 0x04000208
_08008BE8: .4byte 0x03004034
	thumb_func_end sub_8008AD8

	thumb_func_start sub_8008BEC
sub_8008BEC: @ 8008BEC
	push {r4,lr}
	ldr r3, _08008C14
	ldrb r4, [r3]
	cmp r4, 0
	beq _08008C28
	ldrb r0, [r3, 0x1]
	cmp r0, 0x2
	beq _08008C22
	cmp r0, 0x4
	bne _08008C52
	movs r0, 0xD
	ldrsb r0, [r3, r0]
	cmp r0, 0x8
	bgt _08008C18
	ldrb r0, [r3, 0x10]
	cmp r0, 0x1
	beq _08008C22
	movs r0, 0x1
	strb r0, [r3, 0x13]
	b _08008C52
	.align 2, 0
_08008C14: .4byte 0x03003070
_08008C18:
	ldrb r0, [r3, 0x13]
	cmp r0, 0x1
	beq _08008C52
	movs r0, 0
	strb r0, [r3, 0xD]
_08008C22:
	bl sub_8008CF4
	b _08008C52
_08008C28:
	ldrb r2, [r3, 0x1]
	cmp r2, 0x4
	beq _08008C32
	cmp r2, 0x2
	bne _08008C52
_08008C32:
	ldr r1, _08008C58
	ldrb r0, [r1]
	adds r0, 0x1
	strb r0, [r1]
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0xA
	bls _08008C52
	cmp r2, 0x4
	bne _08008C4A
	movs r0, 0x2
	strb r0, [r3, 0x13]
_08008C4A:
	cmp r2, 0x2
	bne _08008C52
	strb r4, [r3, 0x3]
	strb r4, [r3, 0xF]
_08008C52:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08008C58: .4byte 0x03000450
	thumb_func_end sub_8008BEC

	thumb_func_start Timer3Intr
Timer3Intr: @ 8008C5C
	push {lr}
	bl sub_8008FCC
	bl sub_8008CF4
	pop {r0}
	bx r0
	thumb_func_end Timer3Intr

	thumb_func_start sub_8008C6C
sub_8008C6C: @ 8008C6C
	push {r4,lr}
	ldr r4, _08008C98
	ldr r0, _08008C9C
	ldr r1, [r0]
	lsls r0, r1, 26
	lsrs r0, 30
	strb r0, [r4, 0x2]
	ldrb r0, [r4, 0x1]
	cmp r0, 0x2
	beq _08008CA0
	cmp r0, 0x4
	bne _08008CBE
	lsls r0, r1, 25
	lsrs r0, 31
	strb r0, [r4, 0x10]
	bl sub_8008E00
	bl sub_8008F18
	bl sub_8009000
	b _08008CBE
	.align 2, 0
_08008C98: .4byte 0x03003070
_08008C9C: .4byte 0x04000128
_08008CA0:
	bl sub_8008D04
	lsls r0, 24
	cmp r0, 0
	beq _08008CBE
	ldrb r0, [r4]
	cmp r0, 0
	beq _08008CBA
	movs r0, 0x3
	strb r0, [r4, 0x1]
	movs r0, 0x8
	strb r0, [r4, 0xD]
	b _08008CBE
_08008CBA:
	movs r0, 0x4
	strb r0, [r4, 0x1]
_08008CBE:
	ldr r3, _08008CE4
	ldrb r0, [r3, 0xD]
	adds r0, 0x1
	movs r2, 0
	strb r0, [r3, 0xD]
	ldr r1, _08008CE8
	strb r2, [r1]
	lsls r0, 24
	asrs r0, 24
	cmp r0, 0x8
	bne _08008CDE
	ldr r0, _08008CEC
	ldr r2, _08008CF0
	adds r1, r3, r2
	ldrb r1, [r1]
	strb r1, [r0]
_08008CDE:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08008CE4: .4byte 0x03003070
_08008CE8: .4byte 0x03000450
_08008CEC: .4byte 0x03004030
_08008CF0: .4byte 0x00000fbd
	thumb_func_end sub_8008C6C

	thumb_func_start sub_8008CF4
sub_8008CF4: @ 8008CF4
	ldr r0, _08008D00
	ldrh r1, [r0]
	movs r2, 0x80
	orrs r1, r2
	strh r1, [r0]
	bx lr
	.align 2, 0
_08008D00: .4byte 0x04000128
	thumb_func_end sub_8008CF4

	thumb_func_start sub_8008D04
sub_8008D04: @ 8008D04
	push {r4-r7,lr}
	mov r7, r9
	mov r6, r8
	push {r6,r7}
	movs r5, 0
	ldr r6, _08008D20
	ldr r0, _08008D24
	ldrb r1, [r0, 0xE]
	adds r7, r0, 0
	cmp r1, 0x1
	bne _08008D30
	ldr r1, _08008D28
	ldr r2, _08008D2C
	b _08008D34
	.align 2, 0
_08008D20: .4byte 0x0000ffff
_08008D24: .4byte 0x03003070
_08008D28: .4byte 0x0400012a
_08008D2C: .4byte 0x00008fff
_08008D30:
	ldr r1, _08008D88
	ldr r2, _08008D8C
_08008D34:
	adds r0, r2, 0
	strh r0, [r1]
	ldr r2, _08008D90
	ldr r3, _08008D94
	ldr r0, [r3]
	ldr r1, [r3, 0x4]
	str r0, [r2]
	str r1, [r2, 0x4]
	movs r0, 0
	movs r1, 0
	str r0, [r3]
	str r1, [r3, 0x4]
	strb r0, [r2, 0xA]
	movs r4, 0
	ldr r0, _08008D98
	mov r9, r0
	mov r8, r2
	ldr r2, _08008D9C
	ldr r1, _08008DA0
	mov r12, r1
_08008D5C:
	lsls r0, r4, 1
	add r0, r8
	ldrh r3, [r0]
	movs r0, 0x4
	negs r0, r0
	ands r0, r3
	ldr r1, _08008D8C
	cmp r0, r1
	beq _08008D74
	adds r0, r3, 0
	cmp r0, r2
	bne _08008DA4
_08008D74:
	adds r0, r5, 0x1
	lsls r0, 24
	lsrs r5, r0, 24
	adds r0, r3, 0
	cmp r6, r0
	bls _08008DAC
	cmp r0, 0
	beq _08008DAC
	adds r6, r3, 0
	b _08008DAC
	.align 2, 0
_08008D88: .4byte 0x0400012a
_08008D8C: .4byte 0x0000b9a0
_08008D90: .4byte 0x03003074
_08008D94: .4byte 0x04000120
_08008D98: .4byte 0x03000457
_08008D9C: .4byte 0x00008fff
_08008DA0: .4byte 0x0000ffff
_08008DA4:
	cmp r0, r12
	beq _08008DB6
	movs r5, 0
	b _08008DB6
_08008DAC:
	adds r0, r4, 0x1
	lsls r0, 24
	lsrs r4, r0, 24
	cmp r4, 0x3
	bls _08008D5C
_08008DB6:
	strb r5, [r7, 0x3]
	adds r0, r5, 0
	cmp r0, 0x1
	bls _08008DE6
	mov r2, r9
	ldrb r2, [r2]
	cmp r0, r2
	bne _08008DD8
	ldrh r1, [r7, 0x4]
	ldr r0, _08008DD4
	cmp r1, r0
	bne _08008DD8
	movs r0, 0x1
	b _08008DF2
	.align 2, 0
_08008DD4: .4byte 0x00008fff
_08008DD8:
	ldrb r0, [r7, 0x3]
	cmp r0, 0x1
	bls _08008DE6
	movs r0, 0x3
	ands r6, r0
	adds r0, r6, 0x1
	b _08008DE8
_08008DE6:
	movs r0, 0
_08008DE8:
	strb r0, [r7, 0xF]
	ldrb r0, [r7, 0x3]
	mov r1, r9
	strb r0, [r1]
	movs r0, 0
_08008DF2:
	pop {r3,r4}
	mov r8, r3
	mov r9, r4
	pop {r4-r7}
	pop {r1}
	bx r1
	thumb_func_end sub_8008D04

	thumb_func_start sub_8008E00
sub_8008E00: @ 8008E00
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	sub sp, 0x8
	ldr r0, _08008E58
	ldr r1, [r0, 0x4]
	ldr r0, [r0]
	str r0, [sp]
	str r1, [sp, 0x4]
	ldr r0, _08008E5C
	ldrb r1, [r0, 0x16]
	adds r6, r0, 0
	cmp r1, 0
	bne _08008E64
	movs r4, 0
	ldr r7, _08008E60
	ldrb r0, [r6, 0x3]
	cmp r4, r0
	bcs _08008E4E
	adds r5, r6, 0
	ldrh r1, [r6, 0x14]
	adds r3, r7, 0
	adds r2, r6, 0
_08008E2E:
	lsls r0, r4, 1
	add r0, sp
	ldrh r0, [r0]
	cmp r1, r0
	beq _08008E42
	ldrb r0, [r3]
	cmp r0, 0
	beq _08008E42
	movs r0, 0x1
	strb r0, [r5, 0x11]
_08008E42:
	adds r0, r4, 0x1
	lsls r0, 24
	lsrs r4, r0, 24
	ldrb r0, [r2, 0x3]
	cmp r4, r0
	bcc _08008E2E
_08008E4E:
	movs r0, 0
	strh r0, [r6, 0x14]
	movs r0, 0x1
	strb r0, [r7]
	b _08008F04
	.align 2, 0
_08008E58: .4byte 0x04000120
_08008E5C: .4byte 0x03003070
_08008E60: .4byte 0x03000456
_08008E64:
	ldr r2, _08008ED4
	adds r1, r6, r2
	adds r2, 0x1
	adds r0, r6, r2
	ldrb r2, [r0]
	ldrb r1, [r1]
	adds r0, r2, r1
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x31
	bls _08008E80
	subs r0, 0x32
	lsls r0, 24
	lsrs r0, 24
_08008E80:
	cmp r2, 0x31
	bhi _08008EDC
	movs r4, 0
	ldrb r1, [r6, 0x3]
	cmp r4, r1
	bcs _08008EE0
	adds r5, r6, 0
	ldr r7, _08008ED8
	lsls r0, 1
	mov r12, r0
	movs r2, 0xCF
	lsls r2, 2
	adds r2, r6
	mov r8, r2
_08008E9C:
	lsls r1, r4, 1
	mov r2, sp
	adds r0, r2, r1
	ldrh r3, [r0]
	ldrh r2, [r5, 0x14]
	adds r0, r3, r2
	strh r0, [r5, 0x14]
	ldrh r0, [r7]
	orrs r0, r3
	strh r0, [r7]
	ldrb r2, [r5, 0x17]
	movs r0, 0x64
	muls r0, r2
	add r0, r12
	adds r1, r4
	lsls r1, 3
	adds r1, r4
	lsls r1, 5
	adds r0, r1
	add r0, r8
	strh r3, [r0]
	adds r0, r4, 0x1
	lsls r0, 24
	lsrs r4, r0, 24
	ldrb r0, [r5, 0x3]
	cmp r4, r0
	bcc _08008E9C
	b _08008EE0
	.align 2, 0
_08008ED4: .4byte 0x00000fbc
_08008ED8: .4byte 0x03000454
_08008EDC:
	movs r0, 0x2
	strb r0, [r6, 0x12]
_08008EE0:
	ldrb r0, [r6, 0x17]
	adds r0, 0x1
	strb r0, [r6, 0x17]
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x8
	bne _08008F04
	ldr r2, _08008F10
	ldrh r0, [r2]
	cmp r0, 0
	beq _08008F04
	ldr r1, _08008F14
	adds r0, r6, r1
	ldrb r1, [r0]
	adds r1, 0x1
	strb r1, [r0]
	movs r0, 0
	strh r0, [r2]
_08008F04:
	add sp, 0x8
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_08008F10: .4byte 0x03000454
_08008F14: .4byte 0x00000fbd
	thumb_func_end sub_8008E00

	thumb_func_start sub_8008F18
sub_8008F18: @ 8008F18
	push {r4,lr}
	ldr r0, _08008F54
	ldrb r1, [r0, 0x16]
	adds r4, r0, 0
	cmp r1, 0x8
	bne _08008F6A
	ldr r1, _08008F58
	ldrh r0, [r4, 0x14]
	strh r0, [r1]
	ldr r1, _08008F5C
	ldrb r2, [r1]
	cmp r2, 0
	bne _08008F64
	ldr r0, _08008F60
	adds r1, r4, r0
	ldrb r0, [r1]
	subs r0, 0x1
	strb r0, [r1]
	movs r0, 0xCE
	lsls r0, 2
	adds r1, r4, r0
	ldrb r0, [r1]
	adds r0, 0x1
	strb r0, [r1]
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x31
	bls _08008FC0
	strb r2, [r1]
	b _08008FC0
	.align 2, 0
_08008F54: .4byte 0x03003070
_08008F58: .4byte 0x0400012a
_08008F5C: .4byte 0x03000451
_08008F60: .4byte 0x00000339
_08008F64:
	movs r0, 0
	strb r0, [r1]
	b _08008FC0
_08008F6A:
	ldr r1, _08008F90
	ldrb r0, [r1]
	cmp r0, 0
	bne _08008F86
	ldr r2, _08008F94
	adds r0, r4, r2
	ldrb r0, [r0]
	cmp r0, 0
	bne _08008F80
	movs r0, 0x1
	strb r0, [r1]
_08008F80:
	ldrb r0, [r1]
	cmp r0, 0
	beq _08008F9C
_08008F86:
	ldr r1, _08008F98
	movs r0, 0
	strh r0, [r1]
	b _08008FBA
	.align 2, 0
_08008F90: .4byte 0x03000451
_08008F94: .4byte 0x00000339
_08008F98: .4byte 0x0400012a
_08008F9C:
	ldr r3, _08008FC8
	movs r1, 0xCE
	lsls r1, 2
	adds r0, r4, r1
	ldrb r0, [r0]
	lsls r0, 1
	ldrb r2, [r4, 0x16]
	movs r1, 0x64
	muls r1, r2
	adds r0, r1
	adds r1, r4, 0
	adds r1, 0x18
	adds r0, r1
	ldrh r0, [r0]
	strh r0, [r3]
_08008FBA:
	ldrb r0, [r4, 0x16]
	adds r0, 0x1
	strb r0, [r4, 0x16]
_08008FC0:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08008FC8: .4byte 0x0400012a
	thumb_func_end sub_8008F18

	thumb_func_start sub_8008FCC
sub_8008FCC: @ 8008FCC
	push {lr}
	ldr r0, _08008FEC
	ldrb r0, [r0]
	cmp r0, 0
	beq _08008FE8
	ldr r2, _08008FF0
	ldrh r1, [r2]
	ldr r0, _08008FF4
	ands r0, r1
	strh r0, [r2]
	ldr r1, _08008FF8
	ldr r2, _08008FFC
	adds r0, r2, 0
	strh r0, [r1]
_08008FE8:
	pop {r0}
	bx r0
	.align 2, 0
_08008FEC: .4byte 0x03003070
_08008FF0: .4byte 0x0400010e
_08008FF4: .4byte 0x0000ff7f
_08008FF8: .4byte 0x0400010c
_08008FFC: .4byte 0x0000ff3b
	thumb_func_end sub_8008FCC

	thumb_func_start sub_8009000
sub_8009000: @ 8009000
	push {lr}
	ldr r1, _08009014
	ldrb r0, [r1, 0x17]
	cmp r0, 0x8
	bne _08009018
	movs r0, 0
	strb r0, [r1, 0x16]
	strb r0, [r1, 0x17]
	b _08009028
	.align 2, 0
_08009014: .4byte 0x03003070
_08009018:
	ldrb r0, [r1]
	cmp r0, 0
	beq _08009028
	ldr r0, _0800902C
	ldrh r1, [r0]
	movs r2, 0x80
	orrs r1, r2
	strh r1, [r0]
_08009028:
	pop {r0}
	bx r0
	.align 2, 0
_0800902C: .4byte 0x0400010e
	thumb_func_end sub_8009000

	thumb_func_start sub_8009030
sub_8009030: @ 8009030
	push {r4-r6,lr}
	ldr r1, _08009078
	ldr r2, _0800907C
	adds r0, r1, r2
	movs r2, 0
	strb r2, [r0]
	movs r3, 0xCE
	lsls r3, 2
	adds r0, r1, r3
	strb r2, [r0]
	movs r0, 0
	movs r6, 0x64
	adds r5, r1, 0
	adds r5, 0x18
	ldr r4, _08009080
_0800904E:
	movs r2, 0
	adds r1, r0, 0x1
	adds r3, r0, 0
	muls r3, r6
_08009056:
	lsls r0, r2, 1
	adds r0, r3
	adds r0, r5
	strh r4, [r0]
	adds r0, r2, 0x1
	lsls r0, 24
	lsrs r2, r0, 24
	cmp r2, 0x31
	bls _08009056
	lsls r0, r1, 24
	lsrs r0, 24
	cmp r0, 0x7
	bls _0800904E
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_08009078: .4byte 0x03003070
_0800907C: .4byte 0x00000339
_08009080: .4byte 0x0000efff
	thumb_func_end sub_8009030

	thumb_func_start sub_8009084
sub_8009084: @ 8009084
	push {r4-r7,lr}
	ldr r1, _080090E4
	ldr r2, _080090E8
	adds r0, r1, r2
	movs r2, 0
	strb r2, [r0]
	ldr r3, _080090EC
	adds r0, r1, r3
	strb r2, [r0]
	movs r0, 0x64
	mov r12, r0
	movs r3, 0xCF
	lsls r3, 2
	adds r7, r1, r3
	ldr r6, _080090F0
_080090A2:
	movs r3, 0
	lsls r0, r2, 1
	adds r5, r2, 0x1
	adds r0, r2
	lsls r0, 3
	adds r0, r2
	lsls r4, r0, 5
_080090B0:
	movs r2, 0
	adds r1, r3, 0x1
	mov r0, r12
	muls r0, r3
	adds r3, r0, 0
_080090BA:
	lsls r0, r2, 1
	adds r0, r3
	adds r0, r4
	adds r0, r7
	strh r6, [r0]
	adds r0, r2, 0x1
	lsls r0, 24
	lsrs r2, r0, 24
	cmp r2, 0x31
	bls _080090BA
	lsls r0, r1, 24
	lsrs r3, r0, 24
	cmp r3, 0x7
	bls _080090B0
	lsls r0, r5, 24
	lsrs r2, r0, 24
	cmp r2, 0x3
	bls _080090A2
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080090E4: .4byte 0x03003070
_080090E8: .4byte 0x00000fbd
_080090EC: .4byte 0x00000fbc
_080090F0: .4byte 0x0000efff
	thumb_func_end sub_8009084
