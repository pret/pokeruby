	.include "constants/gba_constants.inc"
	.include "constants/species_constants.inc"
	.include "asm/macros.inc"

	.syntax unified

	.text

	thumb_func_start sub_81150FC
sub_81150FC: @ 81150FC
	push {lr}
	bl RunTasks
	bl AnimateSprites
	bl BuildOamBuffer
	ldr r0, _08115120 @ =0x02019000
	adds r1, r0, 0
	adds r1, 0xB8
	ldrb r0, [r1]
	cmp r0, 0
	beq _0811511C
	adds r0, r1, 0
	bl task_tutorial_controls_fadein
_0811511C:
	pop {r0}
	bx r0
	.align 2, 0
_08115120: .4byte 0x02019000
	thumb_func_end sub_81150FC

	thumb_func_start sub_8115124
sub_8115124: @ 8115124
	push {r4,lr}
	sub sp, 0x4
	bl LoadOam
	bl ProcessSpriteCopyRequests
	bl TransferPlttBuffer
	bl sub_8117434
	ldr r2, _08115188 @ =REG_BG1HOFS
	ldr r3, _0811518C @ =0x02019000
	ldrh r1, [r3, 0x26]
	movs r4, 0x80
	lsls r4, 2
	adds r0, r4, 0
	subs r0, r1
	strh r0, [r2]
	ldrb r0, [r3, 0x1]
	cmp r0, 0
	beq _08115154
	ldr r1, _08115190 @ =REG_BLDALPHA
	ldrh r0, [r3, 0x34]
	strh r0, [r1]
_08115154:
	movs r1, 0x2A
	ldrsh r0, [r3, r1]
	cmp r0, 0
	beq _08115170
	ldr r1, _08115194 @ =0x040000d4
	ldr r0, _08115198 @ =gBG1TilemapBuffer + 0x1C0
	str r0, [r1]
	ldr r0, _0811519C @ =0x060021c0
	str r0, [r1, 0x4]
	ldr r0, _081151A0 @ =0x800001a0
	str r0, [r1, 0x8]
	ldr r0, [r1, 0x8]
	movs r0, 0
	strh r0, [r3, 0x2A]
_08115170:
	movs r2, 0x28
	ldrsh r0, [r3, r2]
	cmp r0, 0x1
	beq _081151A4
	cmp r0, 0x1
	ble _0811521A
	cmp r0, 0x2
	beq _081151D4
	cmp r0, 0xFF
	beq _081151F8
	b _0811521A
	.align 2, 0
_08115188: .4byte REG_BG1HOFS
_0811518C: .4byte 0x02019000
_08115190: .4byte REG_BLDALPHA
_08115194: .4byte 0x040000d4
_08115198: .4byte gBG1TilemapBuffer + 0x1C0
_0811519C: .4byte 0x060021c0
_081151A0: .4byte 0x800001a0
_081151A4:
	ldr r1, _081151C4 @ =REG_BG0CNT
	movs r4, 0xF8
	lsls r4, 5
	adds r0, r4, 0
	strh r0, [r1]
	adds r1, 0xCC
	ldr r0, _081151C8 @ =gBG2TilemapBuffer + 0x1C0
	str r0, [r1]
	ldr r0, _081151CC @ =0x0600f9c0
	str r0, [r1, 0x4]
	ldr r0, _081151D0 @ =0x800001a0
	str r0, [r1, 0x8]
	ldr r0, [r1, 0x8]
	movs r0, 0x2
	b _08115218
	.align 2, 0
_081151C4: .4byte REG_BG0CNT
_081151C8: .4byte gBG2TilemapBuffer + 0x1C0
_081151CC: .4byte 0x0600f9c0
_081151D0: .4byte 0x800001a0
_081151D4:
	ldr r1, _081151E8 @ =0x040000d4
	ldr r0, _081151EC @ =gBG2TilemapBuffer + 0x1C0
	str r0, [r1]
	ldr r0, _081151F0 @ =0x0600f9c0
	str r0, [r1, 0x4]
	ldr r0, _081151F4 @ =0x800001a0
	str r0, [r1, 0x8]
	ldr r0, [r1, 0x8]
	b _0811521A
	.align 2, 0
_081151E8: .4byte 0x040000d4
_081151EC: .4byte gBG2TilemapBuffer + 0x1C0
_081151F0: .4byte 0x0600f9c0
_081151F4: .4byte 0x800001a0
_081151F8:
	ldr r1, _08115224 @ =REG_BG0CNT
	ldr r2, _08115228 @ =0x00001f08
	adds r0, r2, 0
	strh r0, [r1]
	mov r1, sp
	movs r0, 0
	strh r0, [r1]
	ldr r1, _0811522C @ =0x040000d4
	mov r4, sp
	str r4, [r1]
	ldr r0, _08115230 @ =0x0600f9c0
	str r0, [r1, 0x4]
	ldr r0, _08115234 @ =0x810001a0
	str r0, [r1, 0x8]
	ldr r0, [r1, 0x8]
	movs r0, 0
_08115218:
	strh r0, [r3, 0x28]
_0811521A:
	add sp, 0x4
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08115224: .4byte REG_BG0CNT
_08115228: .4byte 0x00001f08
_0811522C: .4byte 0x040000d4
_08115230: .4byte 0x0600f9c0
_08115234: .4byte 0x810001a0
	thumb_func_end sub_8115124

	thumb_func_start sub_8115238
sub_8115238: @ 8115238
	push {r4-r6,lr}
	sub sp, 0x8
	ldr r1, _081152C0 @ =gUnknown_083F8EC4
	mov r0, sp
	movs r2, 0x6
	bl memcpy
	ldr r5, _081152C4 @ =0x02019000
	movs r2, 0xBE
	lsls r2, 1
	adds r0, r5, 0
	movs r1, 0
	bl memset
	ldr r0, _081152C8 @ =gUnknown_0202E8CC
	ldrh r2, [r0]
	movs r0, 0x1
	ands r0, r2
	ldrb r1, [r5, 0x4]
	movs r3, 0x4
	negs r3, r3
	ands r3, r1
	orrs r3, r0
	strb r3, [r5, 0x4]
	movs r0, 0x80
	ands r0, r2
	cmp r0, 0
	beq _08115276
	movs r0, 0x80
	orrs r3, r0
	strb r3, [r5, 0x4]
_08115276:
	ldr r3, _081152CC @ =gUnknown_083F8DF4
	ldrb r2, [r5, 0x4]
	lsls r1, r2, 30
	lsrs r0, r1, 25
	adds r0, r3
	ldrb r0, [r0, 0x3]
	adds r4, r5, 0
	adds r4, 0x22
	strb r0, [r4]
	lsrs r0, r1, 25
	adds r0, r3
	ldrb r0, [r0, 0x4]
	adds r3, r5, 0
	adds r3, 0x23
	strb r0, [r3]
	ldr r0, _081152D0 @ =gUnknown_083F8DF0
	lsrs r1, 30
	lsls r2, 24
	lsrs r2, 31
	lsls r2, 1
	adds r1, r2
	adds r1, r0
	ldrb r2, [r1]
	strb r2, [r5, 0x19]
	ldrb r1, [r5, 0x1A]
	movs r0, 0xF
	ands r0, r1
	movs r1, 0x10
	orrs r0, r1
	strb r0, [r5, 0x1A]
	cmp r2, 0x1
	bne _081152DC
	ldr r4, _081152D4 @ =gPlttBufferUnfaded
	ldr r3, _081152D8 @ =gPlttBufferFaded
	mov r0, sp
	ldrh r2, [r0]
	b _081152E4
	.align 2, 0
_081152C0: .4byte gUnknown_083F8EC4
_081152C4: .4byte 0x02019000
_081152C8: .4byte gUnknown_0202E8CC
_081152CC: .4byte gUnknown_083F8DF4
_081152D0: .4byte gUnknown_083F8DF0
_081152D4: .4byte gPlttBufferUnfaded
_081152D8: .4byte gPlttBufferFaded
_081152DC:
	ldr r4, _08115348 @ =gPlttBufferUnfaded
	ldr r3, _0811534C @ =gPlttBufferFaded
	mov r0, sp
	ldrh r2, [r0, 0x2]
_081152E4:
	adds r0, r3, 0
	adds r0, 0xA2
	strh r2, [r0]
	ldr r1, _08115350 @ =0x0000ffff
	adds r0, r1, 0
	ands r0, r2
	strh r0, [r3]
	ands r0, r1
	adds r2, r4, 0
	adds r2, 0xA2
	strh r0, [r2]
	ands r0, r1
	strh r0, [r4]
	ldr r0, _08115354 @ =0x020190b8
	bl sub_8124918
	movs r4, 0
	ldr r5, _08115358 @ =gUnknown_083F8E34
_08115308:
	lsls r2, r4, 3
	adds r2, r5
	ldr r0, _08115354 @ =0x020190b8
	adds r1, r4, 0
	bl sub_812492C
	adds r0, r4, 0x1
	lsls r0, 24
	lsrs r4, r0, 24
	cmp r4, 0xC
	bls _08115308
	movs r4, 0
	ldr r5, _0811535C @ =0x02019000
_08115322:
	movs r0, 0x64
	muls r0, r4
	ldr r1, _08115360 @ =gPlayerParty
	adds r0, r1
	movs r1, 0x41
	bl GetMonData
	adds r1, r0, 0
	movs r0, 0x98
	lsls r0, 1
	cmp r1, r0
	beq _08115364
	adds r0, 0x2
	cmp r1, r0
	bne _0811536C
	ldrb r0, [r5, 0x2]
	movs r1, 0x1
	b _08115368
	.align 2, 0
_08115348: .4byte gPlttBufferUnfaded
_0811534C: .4byte gPlttBufferFaded
_08115350: .4byte 0x0000ffff
_08115354: .4byte 0x020190b8
_08115358: .4byte gUnknown_083F8E34
_0811535C: .4byte 0x02019000
_08115360: .4byte gPlayerParty
_08115364:
	ldrb r0, [r5, 0x2]
	movs r1, 0x2
_08115368:
	orrs r0, r1
	strb r0, [r5, 0x2]
_0811536C:
	adds r0, r4, 0x1
	lsls r0, 24
	lsrs r4, r0, 24
	cmp r4, 0x5
	bls _08115322
	bl RtcCalcLocalTime
	add sp, 0x8
	pop {r4-r6}
	pop {r0}
	bx r0
	thumb_func_end sub_8115238

	thumb_func_start sub_8115384
sub_8115384: @ 8115384
	push {r4,lr}
	sub sp, 0x4
	ldr r1, _081153A4 @ =gMain
	ldr r2, _081153A8 @ =0x0000043c
	adds r0, r1, r2
	ldrb r0, [r0]
	adds r2, r1, 0
	cmp r0, 0x7
	bls _08115398
	b _081155FE
_08115398:
	lsls r0, 2
	ldr r1, _081153AC @ =_081153B0
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_081153A4: .4byte gMain
_081153A8: .4byte 0x0000043c
_081153AC: .4byte _081153B0
	.align 2, 0
_081153B0:
	.4byte _081153D0
	.4byte _08115444
	.4byte _08115460
	.4byte _08115494
	.4byte _081154CC
	.4byte _081154FC
	.4byte _0811556C
	.4byte _0811558C
_081153D0:
	movs r0, 0
	bl SetVBlankCallback
	bl remove_some_task
	bl sub_80F9438
	bl sub_80F9368
	ldr r1, _08115420 @ =REG_BG2CNT
	ldr r3, _08115424 @ =0x00004686
	adds r0, r3, 0
	strh r0, [r1]
	subs r1, 0x2
	ldr r2, _08115428 @ =0x00004401
	adds r0, r2, 0
	strh r0, [r1]
	adds r1, 0x46
	movs r3, 0x90
	lsls r3, 6
	adds r0, r3, 0
	strh r0, [r1]
	adds r1, 0x2
	ldr r2, _0811542C @ =0x0000060a
	adds r0, r2, 0
	strh r0, [r1]
	ldr r0, _08115430 @ =gUnknown_08E8096C
	movs r1, 0xC0
	lsls r1, 19
	bl LZ77UnCompVram
	ldr r0, _08115434 @ =gUnknown_08E81098
	ldr r1, _08115438 @ =0x06004000
	bl LZ77UnCompVram
	ldr r1, _0811543C @ =gMain
	ldr r3, _08115440 @ =0x0000043c
	adds r1, r3
	b _0811557A
	.align 2, 0
_08115420: .4byte REG_BG2CNT
_08115424: .4byte 0x00004686
_08115428: .4byte 0x00004401
_0811542C: .4byte 0x0000060a
_08115430: .4byte gUnknown_08E8096C
_08115434: .4byte gUnknown_08E81098
_08115438: .4byte 0x06004000
_0811543C: .4byte gMain
_08115440: .4byte 0x0000043c
_08115444:
	bl ResetPaletteFade
	bl ResetSpriteData
	bl ResetTasks
	ldr r1, _08115458 @ =gMain
	ldr r0, _0811545C @ =0x0000043c
	adds r1, r0
	b _0811557A
	.align 2, 0
_08115458: .4byte gMain
_0811545C: .4byte 0x0000043c
_08115460:
	ldr r0, _08115480 @ =gWindowConfig_81E6C3C
	bl SetUpWindowConfig
	ldr r0, _08115484 @ =gWindowConfig_81E6CE4
	bl InitMenuWindow
	ldr r0, _08115488 @ =gUnknown_083F86BC
	movs r2, 0xE0
	lsls r2, 1
	movs r1, 0
	bl LoadPalette
	ldr r1, _0811548C @ =gMain
	ldr r2, _08115490 @ =0x0000043c
	adds r1, r2
	b _0811557A
	.align 2, 0
_08115480: .4byte gWindowConfig_81E6C3C
_08115484: .4byte gWindowConfig_81E6CE4
_08115488: .4byte gUnknown_083F86BC
_0811548C: .4byte gMain
_08115490: .4byte 0x0000043c
_08115494:
	bl sub_8115238
	bl sub_80F9020
	ldr r0, _081154B4 @ =gUnknown_083F88BC
	ldr r1, _081154B8 @ =0x02018800
	bl LZ77UnCompWram
	ldr r0, _081154BC @ =gUnknown_083F8A60
	ldr r1, _081154C0 @ =0x06003000
	bl LZ77UnCompVram
	ldr r1, _081154C4 @ =gMain
	ldr r3, _081154C8 @ =0x0000043c
	adds r1, r3
	b _0811557A
	.align 2, 0
_081154B4: .4byte gUnknown_083F88BC
_081154B8: .4byte 0x02018800
_081154BC: .4byte gUnknown_083F8A60
_081154C0: .4byte 0x06003000
_081154C4: .4byte gMain
_081154C8: .4byte 0x0000043c
_081154CC:
	movs r0, 0
	bl sub_8117838
	bl sub_811857C
	bl sub_81184D8
	bl sub_8117F2C
	bl sub_8117900
	bl sub_8117BBC
	bl sub_8117DF4
	ldr r1, _081154F4 @ =gMain
	ldr r0, _081154F8 @ =0x0000043c
	adds r1, r0
	b _0811557A
	.align 2, 0
_081154F4: .4byte gMain
_081154F8: .4byte 0x0000043c
_081154FC:
	bl AnimateSprites
	bl BuildOamBuffer
	ldr r0, _08115550 @ =gSaveBlock1
	ldr r1, _08115554 @ =0x00000494
	adds r0, r1
	ldrh r0, [r0]
	bl sub_81180F4
	movs r0, 0x6
	bl sub_81182F8
	movs r0, 0
	bl sub_811829C
	movs r0, 0
	bl sub_8117158
	movs r0, 0
	movs r1, 0xE
	movs r2, 0x1D
	movs r3, 0x13
	bl MenuDrawTextWindow
	ldr r0, _08115558 @ =gUnknown_081C4157
	movs r1, 0x1
	movs r2, 0xF
	bl MenuPrint
	ldr r1, _0811555C @ =gSpriteCoordOffsetX
	movs r2, 0x3C
	negs r2, r2
	adds r0, r2, 0
	strh r0, [r1]
	ldr r1, _08115560 @ =gSpriteCoordOffsetY
	movs r0, 0
	strh r0, [r1]
	ldr r1, _08115564 @ =gMain
	ldr r3, _08115568 @ =0x0000043c
	adds r1, r3
	b _0811557A
	.align 2, 0
_08115550: .4byte gSaveBlock1
_08115554: .4byte 0x00000494
_08115558: .4byte gUnknown_081C4157
_0811555C: .4byte gSpriteCoordOffsetX
_08115560: .4byte gSpriteCoordOffsetY
_08115564: .4byte gMain
_08115568: .4byte 0x0000043c
_0811556C:
	movs r1, 0x80
	lsls r1, 19
	ldr r3, _08115584 @ =0x00001741
	adds r0, r3, 0
	strh r0, [r1]
	ldr r0, _08115588 @ =0x0000043c
	adds r1, r2, r0
_0811557A:
	ldrb r0, [r1]
	adds r0, 0x1
	strb r0, [r1]
	b _081155FE
	.align 2, 0
_08115584: .4byte 0x00001741
_08115588: .4byte 0x0000043c
_0811558C:
	ldr r3, _08115608 @ =0x04000208
	ldrh r2, [r3]
	movs r0, 0
	strh r0, [r3]
	ldr r4, _0811560C @ =0x04000200
	ldrh r0, [r4]
	movs r1, 0x1
	orrs r0, r1
	strh r0, [r4]
	strh r2, [r3]
	ldr r2, _08115610 @ =REG_DISPSTAT
	ldrh r0, [r2]
	movs r1, 0x8
	orrs r0, r1
	strh r0, [r2]
	ldr r0, _08115614 @ =sub_8115124
	bl SetVBlankCallback
	movs r0, 0x1
	str r0, [sp]
	movs r0, 0xFF
	movs r1, 0
	movs r2, 0x10
	movs r3, 0
	bl BeginHardwarePaletteFade
	ldr r0, _08115618 @ =sub_81156BC
	movs r1, 0
	bl CreateTask
	ldr r4, _0811561C @ =0x02019000
	adds r1, r4, 0
	adds r1, 0xA4
	strb r0, [r1]
	lsls r0, 24
	lsrs r0, 24
	ldr r2, _08115620 @ =gTasks
	lsls r1, r0, 2
	adds r1, r0
	lsls r1, 3
	adds r1, r2
	movs r0, 0x6
	strh r0, [r1, 0x14]
	ldr r0, _08115624 @ =gSaveBlock1
	ldr r2, _08115628 @ =0x00000494
	adds r0, r2
	ldrh r0, [r0]
	strh r0, [r1, 0x22]
	ldr r0, _0811562C @ =sub_8115634
	movs r1, 0x1
	bl CreateTask
	adds r4, 0xA5
	strb r0, [r4]
	ldr r0, _08115630 @ =sub_81150FC
	bl SetMainCallback2
_081155FE:
	add sp, 0x4
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08115608: .4byte 0x04000208
_0811560C: .4byte 0x04000200
_08115610: .4byte REG_DISPSTAT
_08115614: .4byte sub_8115124
_08115618: .4byte sub_81156BC
_0811561C: .4byte 0x02019000
_08115620: .4byte gTasks
_08115624: .4byte gSaveBlock1
_08115628: .4byte 0x00000494
_0811562C: .4byte sub_8115634
_08115630: .4byte sub_81150FC
	thumb_func_end sub_8115384

	thumb_func_start sub_8115634
sub_8115634: @ 8115634
	push {r4-r6,lr}
	ldr r0, _081156B8 @ =0x02019000
	adds r3, r0, 0
	adds r3, 0x21
	ldrb r1, [r3]
	adds r2, r1, 0x1
	strb r2, [r3]
	adds r2, r0, 0
	adds r2, 0x23
	lsls r1, 24
	lsrs r1, 24
	adds r6, r0, 0
	ldrb r2, [r2]
	cmp r1, r2
	bne _08115674
	movs r0, 0
	strb r0, [r3]
	adds r2, r6, 0
	adds r2, 0x22
	ldrb r1, [r2]
	ldrh r0, [r6, 0x24]
	subs r0, r1
	strh r0, [r6, 0x24]
	lsls r0, 16
	cmp r0, 0
	bge _08115674
	ldrb r1, [r2]
	movs r2, 0xB4
	lsls r2, 1
	adds r0, r2, 0
	subs r0, r1
	strh r0, [r6, 0x24]
_08115674:
	adds r4, r6, 0
	ldrh r0, [r4, 0x24]
	bl Sin2
	lsls r0, 16
	lsrs r5, r0, 16
	ldrh r0, [r4, 0x24]
	bl Cos2
	lsls r0, 16
	lsrs r1, r0, 16
	lsls r0, r5, 16
	asrs r0, 16
	cmp r0, 0
	bge _08115694
	adds r0, 0xF
_08115694:
	lsls r0, 12
	lsrs r5, r0, 16
	lsls r0, r1, 16
	asrs r0, 16
	cmp r0, 0
	bge _081156A2
	adds r0, 0xF
_081156A2:
	asrs r0, 4
	strh r0, [r6, 0x32]
	strh r0, [r6, 0x2C]
	strh r5, [r6, 0x2E]
	lsls r0, r5, 16
	asrs r0, 16
	negs r0, r0
	strh r0, [r6, 0x30]
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_081156B8: .4byte 0x02019000
	thumb_func_end sub_8115634

	thumb_func_start sub_81156BC
sub_81156BC: @ 81156BC
	push {r4,r5,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	bl UpdatePaletteFade
	lsls r0, 24
	lsrs r3, r0, 24
	cmp r3, 0
	bne _08115716
	ldr r2, _0811571C @ =REG_BLDCNT
	ldrh r0, [r2]
	movs r5, 0x90
	lsls r5, 6
	adds r1, r5, 0
	orrs r0, r1
	strh r0, [r2]
	ldr r1, _08115720 @ =REG_BLDALPHA
	ldr r2, _08115724 @ =0x00000808
	adds r0, r2, 0
	strh r0, [r1]
	ldr r1, _08115728 @ =gTasks
	lsls r0, r4, 2
	adds r0, r4
	lsls r0, 3
	adds r0, r1
	strh r3, [r0, 0x14]
	adds r0, r4, 0
	bl sub_8116CAC
	bl sub_8116CF8
	bl sub_81185E8
	movs r0, 0
	bl sub_8117158
	movs r0, 0x6
	bl sub_81182F8
	ldr r1, _0811572C @ =sub_81159BC
	ldr r2, _08115730 @ =0x0000ffff
	adds r0, r4, 0
	movs r3, 0x3
	bl sub_8116C34
_08115716:
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_0811571C: .4byte REG_BLDCNT
_08115720: .4byte REG_BLDALPHA
_08115724: .4byte 0x00000808
_08115728: .4byte gTasks
_0811572C: .4byte sub_81159BC
_08115730: .4byte 0x0000ffff
	thumb_func_end sub_81156BC

	thumb_func_start sub_8115734
sub_8115734: @ 8115734
	push {r4,lr}
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	movs r0, 0x14
	movs r1, 0x8
	movs r2, 0x1
	bl DisplayYesNoMenu
	ldr r0, _08115770 @ =0x00002d9e
	bl sub_814AAF8
	movs r0, 0
	movs r1, 0xE
	movs r2, 0x1D
	movs r3, 0x13
	bl MenuDrawTextWindow
	ldr r0, _08115774 @ =gUnknown_081C41E3
	movs r1, 0x1
	movs r2, 0xF
	bl MenuPrint
	ldr r1, _08115778 @ =gUnknown_083F8EBC
	adds r0, r4, 0
	bl sub_80F914C
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08115770: .4byte 0x00002d9e
_08115774: .4byte gUnknown_081C41E3
_08115778: .4byte gUnknown_083F8EBC
	thumb_func_end sub_8115734

	thumb_func_start sub_811577C
sub_811577C: @ 811577C
	push {r4,lr}
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	movs r0, 0x14
	movs r1, 0x8
	movs r2, 0x1A
	movs r3, 0xD
	bl MenuZeroFillWindowRect
	ldr r1, _081157A4 @ =gTasks
	lsls r0, r4, 2
	adds r0, r4
	lsls r0, 3
	adds r0, r1
	ldr r1, _081157A8 @ =sub_81159BC
	str r1, [r0]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_081157A4: .4byte gTasks
_081157A8: .4byte sub_81159BC
	thumb_func_end sub_811577C

	thumb_func_start sub_81157AC
sub_81157AC: @ 81157AC
	push {r4,lr}
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	ldr r0, _081157CC @ =0x02019000
	adds r0, 0xA5
	ldrb r0, [r0]
	bl DestroyTask
	adds r0, r4, 0
	bl sub_8116AB0
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_081157CC: .4byte 0x02019000
	thumb_func_end sub_81157AC

	thumb_func_start sub_81157D0
sub_81157D0: @ 81157D0
	push {r4-r7,lr}
	sub sp, 0x8
	lsls r0, 24
	lsrs r4, r0, 24
	cmp r4, 0xF
	bhi _081158C8
	lsls r0, r4, 2
	ldr r1, _081157E8 @ =_081157EC
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_081157E8: .4byte _081157EC
	.align 2, 0
_081157EC:
	.4byte _0811582C
	.4byte _08115848
	.4byte _08115848
	.4byte _08115848
	.4byte _08115848
	.4byte _08115884
	.4byte _081158C8
	.4byte _081158C8
	.4byte _081158C8
	.4byte _081158C8
	.4byte _08115884
	.4byte _081158C8
	.4byte _081158C8
	.4byte _081158C8
	.4byte _081158C8
	.4byte _08115884
_0811582C:
	ldr r0, _08115844 @ =gBG2TilemapBuffer
	movs r1, 0x10
	str r1, [sp]
	movs r1, 0xD
	str r1, [sp, 0x4]
	movs r1, 0
	movs r2, 0xE
	movs r3, 0x7
	bl sub_8124DDC
	b _08115918
	.align 2, 0
_08115844: .4byte gBG2TilemapBuffer
_08115848:
	lsls r0, r4, 1
	adds r0, r4
	adds r0, 0xE
	lsls r0, 24
	lsrs r7, r0, 24
	ldr r5, _0811587C @ =gBG2TilemapBuffer
	movs r0, 0x10
	str r0, [sp]
	movs r4, 0xD
	str r4, [sp, 0x4]
	adds r0, r5, 0
	movs r1, 0
	movs r2, 0xE
	movs r3, 0x7
	bl sub_8124DDC
	ldr r1, _08115880 @ =0x02018a32
	movs r0, 0x3
	str r0, [sp]
	str r4, [sp, 0x4]
	adds r0, r5, 0
	adds r2, r7, 0
	movs r3, 0x7
	bl sub_8124E2C
	b _08115918
	.align 2, 0
_0811587C: .4byte gBG2TilemapBuffer
_08115880: .4byte 0x02018a32
_08115884:
	subs r0, r4, 0x1
	movs r1, 0x5
	bl __divsi3
	lsls r1, r0, 1
	adds r1, r0
	adds r1, 0xA
	lsls r1, 24
	lsrs r6, r1, 24
	ldr r5, _081158C0 @ =gBG2TilemapBuffer
	movs r4, 0x10
	str r4, [sp]
	movs r0, 0xD
	str r0, [sp, 0x4]
	adds r0, r5, 0
	movs r1, 0
	movs r2, 0xE
	movs r3, 0x7
	bl sub_8124DDC
	ldr r1, _081158C4 @ =0x02018a80
	str r4, [sp]
	movs r0, 0x3
	str r0, [sp, 0x4]
	adds r0, r5, 0
	movs r2, 0xE
	adds r3, r6, 0
	bl sub_8124E2C
	b _08115918
	.align 2, 0
_081158C0: .4byte gBG2TilemapBuffer
_081158C4: .4byte 0x02018a80
_081158C8:
	adds r0, r4, 0
	movs r1, 0x5
	bl __umodsi3
	lsls r0, 24
	lsrs r0, 24
	lsls r1, r0, 1
	adds r1, r0
	adds r1, 0xE
	lsls r1, 24
	lsrs r7, r1, 24
	subs r0, r4, 0x1
	movs r1, 0x5
	bl __divsi3
	lsls r1, r0, 1
	adds r1, r0
	adds r1, 0x7
	lsls r1, 24
	lsrs r6, r1, 24
	ldr r4, _08115920 @ =gBG2TilemapBuffer
	movs r0, 0x10
	str r0, [sp]
	movs r0, 0xD
	str r0, [sp, 0x4]
	adds r0, r4, 0
	movs r1, 0
	movs r2, 0xE
	movs r3, 0x7
	bl sub_8124DDC
	ldr r1, _08115924 @ =0x02018a20
	movs r0, 0x3
	str r0, [sp]
	str r0, [sp, 0x4]
	adds r0, r4, 0
	adds r2, r7, 0
	adds r3, r6, 0
	bl sub_8124E2C
_08115918:
	add sp, 0x8
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_08115920: .4byte gBG2TilemapBuffer
_08115924: .4byte 0x02018a20
	thumb_func_end sub_81157D0

	thumb_func_start sub_8115928
sub_8115928: @ 8115928
	push {r4,r5,lr}
	lsls r0, 24
	lsrs r5, r0, 24
	lsls r1, 24
	cmp r1, 0
	bne _0811594C
	ldr r1, _08115948 @ =gTasks
	lsls r4, r5, 2
	adds r0, r4, r5
	lsls r0, 3
	adds r0, r1
	ldrb r0, [r0, 0x10]
	bl sub_811829C
	b _08115960
	.align 2, 0
_08115948: .4byte gTasks
_0811594C:
	ldr r0, _08115974 @ =0x02019000
	ldrb r1, [r0, 0x1A]
	lsls r1, 28
	lsrs r1, 28
	adds r0, 0x1B
	adds r1, r0
	ldrb r0, [r1]
	bl sub_811829C
	lsls r4, r5, 2
_08115960:
	ldr r0, _08115978 @ =gTasks
	adds r1, r4, r5
	lsls r1, 3
	adds r1, r0
	ldrb r0, [r1, 0x10]
	bl sub_81157D0
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_08115974: .4byte 0x02019000
_08115978: .4byte gTasks
	thumb_func_end sub_8115928

	thumb_func_start sub_811597C
sub_811597C: @ 811597C
	push {r4-r6,lr}
	lsls r0, 24
	lsrs r0, 24
	ldr r5, _081159B0 @ =0x02019000
	movs r6, 0
	movs r1, 0x1
	strh r1, [r5, 0x28]
	ldr r1, _081159B4 @ =gTasks
	lsls r4, r0, 2
	adds r4, r0
	lsls r4, 3
	adds r4, r1
	ldrb r0, [r4, 0x10]
	bl sub_81157D0
	adds r1, r5, 0
	adds r1, 0x23
	movs r0, 0x2
	strb r0, [r1]
	adds r5, 0x21
	strb r6, [r5]
	ldr r0, _081159B8 @ =sub_8115E14
	str r0, [r4]
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_081159B0: .4byte 0x02019000
_081159B4: .4byte gTasks
_081159B8: .4byte sub_8115E14
	thumb_func_end sub_811597C

	thumb_func_start sub_81159BC
sub_81159BC: @ 81159BC
	push {r4-r7,lr}
	lsls r0, 24
	lsrs r6, r0, 24
	ldr r3, _08115A10 @ =0x02019000
	ldr r1, [r3, 0x8]
	movs r0, 0x20
	ands r0, r1
	cmp r0, 0
	beq _08115A1C
	movs r2, 0xB
	ldr r5, _08115A14 @ =gUnknown_083F8C00
	adds r0, r5, 0
	adds r0, 0xE4
	ldr r0, [r0]
	ands r1, r0
	ldr r0, _08115A18 @ =gTasks
	mov r12, r0
	lsls r7, r6, 2
	cmp r1, 0
	beq _08115A5A
	adds r4, r3, 0
	adds r3, r5, 0
	adds r3, 0x8
_081159EA:
	lsls r0, r2, 16
	movs r1, 0x80
	lsls r1, 9
	adds r0, r1
	lsrs r2, r0, 16
	asrs r1, r0, 16
	cmp r1, 0xD
	bgt _08115A5A
	lsls r0, r1, 2
	adds r0, r1
	lsls r0, 2
	adds r0, r3
	ldr r1, [r4, 0x8]
	ldr r0, [r0]
	ands r1, r0
	cmp r1, 0
	bne _081159EA
	b _08115A5A
	.align 2, 0
_08115A10: .4byte 0x02019000
_08115A14: .4byte gUnknown_083F8C00
_08115A18: .4byte gTasks
_08115A1C:
	movs r2, 0x6
	ldr r5, _08115A88 @ =gUnknown_083F8C00
	adds r0, r5, 0
	adds r0, 0x80
	ldr r0, [r0]
	ands r1, r0
	ldr r0, _08115A8C @ =gTasks
	mov r12, r0
	lsls r7, r6, 2
	cmp r1, 0
	beq _08115A5A
	adds r4, r3, 0
	adds r3, r5, 0
	adds r3, 0x8
_08115A38:
	lsls r0, r2, 16
	movs r1, 0x80
	lsls r1, 9
	adds r0, r1
	lsrs r2, r0, 16
	asrs r1, r0, 16
	cmp r1, 0x9
	bgt _08115A5A
	lsls r0, r1, 2
	adds r0, r1
	lsls r0, 2
	adds r0, r3
	ldr r1, [r4, 0x8]
	ldr r0, [r0]
	ands r1, r0
	cmp r1, 0
	bne _08115A38
_08115A5A:
	adds r4, r7, r6
	lsls r4, 3
	add r4, r12
	movs r5, 0
	strh r2, [r4, 0x10]
	adds r0, r6, 0
	bl sub_8116CAC
	ldrb r0, [r4, 0x10]
	bl sub_8117158
	ldrb r0, [r4, 0x10]
	bl sub_811829C
	ldrb r0, [r4, 0x10]
	bl sub_8116EF8
	strh r5, [r4, 0xA]
	ldr r0, _08115A90 @ =sub_811597C
	str r0, [r4]
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_08115A88: .4byte gUnknown_083F8C00
_08115A8C: .4byte gTasks
_08115A90: .4byte sub_811597C
	thumb_func_end sub_81159BC

	thumb_func_start sub_8115A94
sub_8115A94: @ 8115A94
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	sub sp, 0x4
	adds r4, r0, 0
	lsls r1, 24
	lsrs r5, r1, 24
	movs r6, 0
	movs r7, 0
	ldr r1, _08115ADC @ =gUnknown_083F8ECA
	mov r0, sp
	movs r2, 0x4
	bl memcpy
	ldrb r0, [r4]
	mov r8, r0
	cmp r5, 0
	blt _08115B08
	cmp r5, 0x1
	bgt _08115AE0
	movs r1, 0
	ldrsh r0, [r4, r1]
	movs r1, 0x5
	bl __modsi3
	lsls r0, 24
	lsrs r6, r0, 24
	movs r2, 0xF0
	lsls r2, 20
	adds r1, r0, r2
	lsrs r7, r1, 24
	cmp r0, 0
	bne _08115B08
	movs r6, 0x5
	b _08115B08
	.align 2, 0
_08115ADC: .4byte gUnknown_083F8ECA
_08115AE0:
	cmp r5, 0x3
	bgt _08115B08
	movs r1, 0
	ldrsh r0, [r4, r1]
	movs r1, 0x5
	bl __divsi3
	lsls r0, 16
	asrs r0, 16
	lsls r1, r0, 2
	adds r1, r0
	lsls r1, 24
	lsrs r6, r1, 24
	movs r2, 0x80
	lsls r2, 19
	adds r0, r1, r2
	lsrs r7, r0, 24
	cmp r1, 0
	bne _08115B08
	movs r6, 0x1
_08115B08:
	mov r1, sp
	adds r0, r1, r5
	ldrb r0, [r0]
	lsls r0, 24
	asrs r0, 24
	ldrh r2, [r4]
	adds r0, r2
	strh r0, [r4]
	lsls r1, r6, 24
	asrs r3, r1, 24
	lsls r0, 16
	asrs r0, 16
	lsls r2, r7, 24
	cmp r0, r3
	bge _08115B2A
	asrs r0, r2, 24
	strh r0, [r4]
_08115B2A:
	movs r0, 0
	ldrsh r1, [r4, r0]
	asrs r0, r2, 24
	cmp r1, r0
	ble _08115B36
	strh r3, [r4]
_08115B36:
	mov r1, r8
	lsls r0, r1, 24
	movs r2, 0
	ldrsh r1, [r4, r2]
	asrs r0, 24
	cmp r1, r0
	bne _08115B48
	movs r0, 0
	b _08115B4A
_08115B48:
	movs r0, 0x1
_08115B4A:
	add sp, 0x4
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r1}
	bx r1
	thumb_func_end sub_8115A94

	thumb_func_start sub_8115B58
sub_8115B58: @ 8115B58
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	lsls r0, 24
	lsrs r7, r0, 24
	movs r0, 0
	mov r8, r0
	movs r5, 0
	ldr r4, _08115D30 @ =gMain
	ldrh r1, [r4, 0x2E]
	movs r0, 0x40
	ands r0, r1
	cmp r0, 0
	beq _08115B94
	movs r5, 0x1
	lsls r0, r7, 2
	adds r0, r7
	lsls r0, 3
	ldr r1, _08115D34 @ =gTasks + 0x8
	adds r0, r1
	adds r0, 0x8
	movs r1, 0
	bl sub_8115A94
	lsls r0, 24
	cmp r0, 0
	bne _08115B94
	b _08115D20
_08115B94:
	ldrh r1, [r4, 0x2E]
	movs r0, 0x80
	ands r0, r1
	cmp r0, 0
	beq _08115BBA
	movs r5, 0x1
	lsls r0, r7, 2
	adds r0, r7
	lsls r0, 3
	ldr r1, _08115D34 @ =gTasks + 0x8
	adds r0, r1
	adds r0, 0x8
	movs r1, 0x1
	bl sub_8115A94
	lsls r0, 24
	cmp r0, 0
	bne _08115BBA
	b _08115D20
_08115BBA:
	ldrh r1, [r4, 0x2E]
	movs r0, 0x20
	ands r0, r1
	cmp r0, 0
	beq _08115BE0
	movs r5, 0x1
	lsls r0, r7, 2
	adds r0, r7
	lsls r0, 3
	ldr r1, _08115D34 @ =gTasks + 0x8
	adds r0, r1
	adds r0, 0x8
	movs r1, 0x2
	bl sub_8115A94
	lsls r0, 24
	cmp r0, 0
	bne _08115BE0
	b _08115D20
_08115BE0:
	ldrh r1, [r4, 0x2E]
	movs r0, 0x10
	ands r0, r1
	cmp r0, 0
	beq _08115C06
	movs r5, 0x1
	lsls r0, r7, 2
	adds r0, r7
	lsls r0, 3
	ldr r1, _08115D34 @ =gTasks + 0x8
	adds r0, r1
	adds r0, 0x8
	movs r1, 0x3
	bl sub_8115A94
	lsls r0, 24
	cmp r0, 0
	bne _08115C06
	b _08115D20
_08115C06:
	cmp r5, 0
	bne _08115C0C
	b _08115D20
_08115C0C:
	ldr r0, _08115D38 @ =gTasks
	lsls r6, r7, 2
	adds r4, r6, r7
	lsls r4, 3
	adds r4, r0
	ldrb r0, [r4, 0x10]
	bl sub_8117158
	adds r0, r7, 0
	movs r1, 0
	bl sub_8115928
	mov r1, r8
	strh r1, [r4, 0xA]
	movs r0, 0x5
	bl PlaySE
	ldr r5, _08115D3C @ =0x020190b8
	ldr r1, _08115D40 @ =0x0000ffff
	adds r0, r5, 0
	bl sub_8124D3C
	adds r3, r5, 0
	adds r3, 0xB8
	ldrb r2, [r3]
	movs r1, 0x7F
	adds r0, r1, 0
	ands r0, r2
	strb r0, [r3]
	subs r3, 0xC
	ldrb r2, [r3]
	adds r0, r1, 0
	ands r0, r2
	strb r0, [r3]
	adds r2, r5, 0
	adds r2, 0xA0
	ldrb r0, [r2]
	ands r1, r0
	strb r1, [r2]
	ldrb r0, [r4, 0x10]
	bl sub_8116EF8
	movs r4, 0
	mov r12, r6
	ldr r6, _08115D44 @ =gSprites
	movs r2, 0x7C
	negs r2, r2
	adds r2, r5
	mov r10, r2
	movs r0, 0x8
	adds r0, r6
	mov r8, r0
	ldr r1, _08115D48 @ =0xfffffc00
	mov r9, r1
	ldr r2, _08115D4C @ =0x000003ff
	adds r5, r2, 0
_08115C7C:
	adds r0, r4, 0
	adds r0, 0x29
	add r0, r10
	ldrb r1, [r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r3, r0, r6
	adds r2, r3, 0
	adds r2, 0x40
	add r0, r8
	ldr r0, [r0]
	ldr r0, [r0]
	ldrh r1, [r0]
	ldrh r2, [r2]
	adds r1, r2
	ands r1, r5
	ldrh r2, [r3, 0x4]
	mov r0, r9
	ands r0, r2
	orrs r0, r1
	strh r0, [r3, 0x4]
	adds r0, r4, 0x1
	lsls r0, 24
	lsrs r4, r0, 24
	cmp r4, 0x3
	bls _08115C7C
	ldr r0, _08115D38 @ =gTasks
	mov r2, r12
	adds r1, r2, r7
	lsls r1, 3
	adds r1, r0
	ldrh r3, [r1, 0x10]
	subs r0, r3, 0x1
	lsls r0, 16
	lsrs r0, 16
	cmp r0, 0x3
	bhi _08115D20
	ldr r2, _08115D50 @ =gUnknown_083F8C00
	movs r0, 0x10
	ldrsh r1, [r1, r0]
	lsls r0, r1, 2
	adds r0, r1
	lsls r0, 2
	adds r2, 0x8
	adds r0, r2
	ldr r2, _08115D54 @ =0x02019000
	ldr r1, [r2, 0x8]
	ldr r0, [r0]
	ands r1, r0
	cmp r1, 0
	bne _08115D20
	subs r0, r3, 0x1
	lsls r0, 24
	lsrs r0, 24
	mov r8, r0
	adds r0, r2, 0
	add r0, r8
	adds r0, 0x65
	ldrb r1, [r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	ldr r1, _08115D44 @ =gSprites
	adds r3, r0, r1
	adds r2, r3, 0
	adds r2, 0x40
	adds r1, 0x8
	adds r0, r1
	ldr r0, [r0]
	ldr r0, [r0]
	ldrh r1, [r0, 0x4]
	ldrh r2, [r2]
	adds r1, r2
	ldr r2, _08115D4C @ =0x000003ff
	adds r0, r2, 0
	ands r1, r0
	ldrh r2, [r3, 0x4]
	ldr r0, _08115D48 @ =0xfffffc00
	ands r0, r2
	orrs r0, r1
	strh r0, [r3, 0x4]
_08115D20:
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_08115D30: .4byte gMain
_08115D34: .4byte gTasks + 0x8
_08115D38: .4byte gTasks
_08115D3C: .4byte 0x020190b8
_08115D40: .4byte 0x0000ffff
_08115D44: .4byte gSprites
_08115D48: .4byte 0xfffffc00
_08115D4C: .4byte 0x000003ff
_08115D50: .4byte gUnknown_083F8C00
_08115D54: .4byte 0x02019000
	thumb_func_end sub_8115B58

	thumb_func_start sub_8115D58
sub_8115D58: @ 8115D58
	push {lr}
	lsls r0, 24
	lsrs r3, r0, 24
	ldr r1, _08115D70 @ =0x02019000
	movs r0, 0xFF
	strh r0, [r1, 0x28]
	ldrb r0, [r1, 0x19]
	cmp r0, 0x1
	bne _08115D74
	adds r2, r1, 0
	adds r2, 0x23
	b _08115D7A
	.align 2, 0
_08115D70: .4byte 0x02019000
_08115D74:
	adds r2, r1, 0
	adds r2, 0x23
	movs r0, 0
_08115D7A:
	strb r0, [r2]
	adds r1, 0x21
	movs r0, 0
	strb r0, [r1]
	ldr r1, _08115D98 @ =gTasks
	lsls r0, r3, 2
	adds r0, r3
	lsls r0, 3
	adds r0, r1
	movs r1, 0x20
	strh r1, [r0, 0xA]
	ldr r1, _08115D9C @ =sub_8115ECC
	str r1, [r0]
	pop {r0}
	bx r0
	.align 2, 0
_08115D98: .4byte gTasks
_08115D9C: .4byte sub_8115ECC
	thumb_func_end sub_8115D58

	thumb_func_start sub_8115DA0
sub_8115DA0: @ 8115DA0
	push {r4-r6,lr}
	lsls r0, 24
	lsrs r0, 24
	ldr r4, _08115E08 @ =0x02019000
	ldrb r2, [r4, 0x1A]
	lsls r2, 28
	lsrs r2, 28
	adds r5, r4, 0
	adds r5, 0x1B
	adds r2, r5
	ldr r3, _08115E0C @ =gTasks
	lsls r1, r0, 2
	adds r1, r0
	lsls r1, 3
	adds r6, r1, r3
	ldrh r0, [r6, 0x10]
	strb r0, [r2]
	ldrb r0, [r4, 0x1A]
	lsls r0, 28
	lsrs r0, 28
	adds r0, r5
	ldrb r0, [r0]
	bl sub_8117380
	lsls r0, 24
	lsrs r0, 24
	strh r0, [r6, 0xC]
	ldrb r0, [r4, 0x1A]
	lsls r0, 28
	lsrs r0, 28
	adds r0, r5
	ldrb r0, [r0]
	bl sub_811829C
	ldrb r1, [r4, 0x19]
	ldrh r0, [r6, 0x22]
	subs r0, r1
	strh r0, [r6, 0x22]
	lsls r0, 16
	cmp r0, 0
	bge _08115DF6
	movs r0, 0
	strh r0, [r6, 0x22]
_08115DF6:
	ldrh r0, [r6, 0x22]
	bl sub_81180F4
	ldr r0, _08115E10 @ =sub_8115D58
	str r0, [r6]
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_08115E08: .4byte 0x02019000
_08115E0C: .4byte gTasks
_08115E10: .4byte sub_8115D58
	thumb_func_end sub_8115DA0

	thumb_func_start sub_8115E14
sub_8115E14: @ 8115E14
	push {r4,r5,lr}
	lsls r0, 24
	lsrs r5, r0, 24
	adds r0, r5, 0
	bl sub_8115B58
	ldr r1, _08115E3C @ =gTasks
	lsls r0, r5, 2
	adds r0, r5
	lsls r0, 3
	adds r4, r0, r1
	movs r1, 0xA
	ldrsh r0, [r4, r1]
	cmp r0, 0x1E
	beq _08115E4A
	cmp r0, 0x1E
	bgt _08115E40
	cmp r0, 0
	beq _08115E46
	b _08115E5E
	.align 2, 0
_08115E3C: .4byte gTasks
_08115E40:
	cmp r0, 0x3B
	beq _08115E58
	b _08115E5E
_08115E46:
	ldrb r0, [r4, 0x10]
	b _08115E4C
_08115E4A:
	movs r0, 0
_08115E4C:
	bl sub_81157D0
	ldrh r0, [r4, 0xA]
	adds r0, 0x1
	strh r0, [r4, 0xA]
	b _08115E6E
_08115E58:
	movs r0, 0
	strh r0, [r4, 0xA]
	b _08115E6E
_08115E5E:
	ldr r0, _08115EA8 @ =gTasks
	lsls r1, r5, 2
	adds r1, r5
	lsls r1, 3
	adds r1, r0
	ldrh r0, [r1, 0xA]
	adds r0, 0x1
	strh r0, [r1, 0xA]
_08115E6E:
	ldr r0, _08115EAC @ =gMain
	ldrh r1, [r0, 0x2E]
	movs r0, 0x1
	ands r0, r1
	cmp r0, 0
	beq _08115EC2
	ldr r3, _08115EB0 @ =0x02019000
	ldr r2, _08115EB4 @ =gUnknown_083F8C00
	ldr r1, _08115EA8 @ =gTasks
	lsls r0, r5, 2
	adds r0, r5
	lsls r0, 3
	adds r4, r0, r1
	movs r0, 0x10
	ldrsh r1, [r4, r0]
	lsls r0, r1, 2
	adds r0, r1
	lsls r0, 2
	adds r2, 0x8
	adds r0, r2
	ldr r1, [r3, 0x8]
	ldr r0, [r0]
	ands r1, r0
	cmp r1, 0
	beq _08115EB8
	movs r0, 0x16
	bl PlaySE
	b _08115EC2
	.align 2, 0
_08115EA8: .4byte gTasks
_08115EAC: .4byte gMain
_08115EB0: .4byte 0x02019000
_08115EB4: .4byte gUnknown_083F8C00
_08115EB8:
	movs r0, 0x5F
	bl m4aSongNumStart
	ldr r0, _08115EC8 @ =sub_8115DA0
	str r0, [r4]
_08115EC2:
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_08115EC8: .4byte sub_8115DA0
	thumb_func_end sub_8115E14

	thumb_func_start sub_8115ECC
sub_8115ECC: @ 8115ECC
	push {r4,lr}
	lsls r0, 24
	lsrs r0, 24
	ldr r2, _08115F20 @ =gTasks
	lsls r1, r0, 2
	adds r1, r0
	lsls r1, 3
	adds r4, r1, r2
	ldrh r0, [r4, 0xA]
	subs r1, r0, 0x1
	strh r1, [r4, 0xA]
	lsls r0, 16
	cmp r0, 0
	ble _08115F34
	lsls r0, r1, 16
	asrs r0, 16
	cmp r0, 0x2
	ble _08115EF8
	ldr r1, _08115F24 @ =gSpriteCoordOffsetX
	ldrh r0, [r1]
	adds r0, 0x2
	strh r0, [r1]
_08115EF8:
	ldr r1, _08115F28 @ =0x02019000
	ldrh r0, [r1, 0x26]
	adds r0, 0x4
	strh r0, [r1, 0x26]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x68
	bne _08115F4C
	ldr r2, _08115F2C @ =gSprites
	adds r0, r1, 0
	adds r0, 0x55
	ldrb r1, [r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r2, 0x1C
	adds r0, r2
	ldr r1, _08115F30 @ =SpriteCallbackDummy
	str r1, [r0]
	b _08115F4C
	.align 2, 0
_08115F20: .4byte gTasks
_08115F24: .4byte gSpriteCoordOffsetX
_08115F28: .4byte 0x02019000
_08115F2C: .4byte gSprites
_08115F30: .4byte SpriteCallbackDummy
_08115F34:
	movs r0, 0x1
	movs r1, 0xFF
	bl sub_8117AA8
	movs r0, 0x1
	movs r1, 0xFF
	bl sub_8117C60
	ldr r0, _08115F54 @ =sub_8116100
	str r0, [r4]
	movs r0, 0
	strh r0, [r4, 0xA]
_08115F4C:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08115F54: .4byte sub_8116100
	thumb_func_end sub_8115ECC

	thumb_func_start sub_8115F58
sub_8115F58: @ 8115F58
	push {r4,lr}
	lsls r0, 16
	lsrs r3, r0, 16
	lsls r1, 16
	lsrs r1, 16
	ldr r0, _08115F74 @ =0x02019000
	ldrb r2, [r0, 0x2]
	adds r4, r0, 0
	cmp r2, 0x2
	bgt _08115F78
	cmp r2, 0x1
	bge _08115F7E
	b _08116048
	.align 2, 0
_08115F74: .4byte 0x02019000
_08115F78:
	cmp r2, 0x3
	beq _08115FE0
	b _08116048
_08115F7E:
	ldr r0, _08115FA8 @ =gLocalTime
	ldrb r0, [r0, 0x2]
	subs r0, 0x4
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x5
	bhi _08115FB0
	cmp r3, 0xB
	bls _08115F98
	movs r0, 0x1
	ands r0, r1
	cmp r0, 0
	beq _0811605E
_08115F98:
	ldr r0, _08115FAC @ =gUnknown_083F8DF4
	ldrb r1, [r4, 0x4]
	lsls r1, 30
	lsrs r1, 25
	adds r1, r0
	ldrb r0, [r1, 0x2]
	lsrs r0, 1
	b _081160F4
	.align 2, 0
_08115FA8: .4byte gLocalTime
_08115FAC: .4byte gUnknown_083F8DF4
_08115FB0:
	movs r0, 0x3
	ands r0, r1
	cmp r0, 0
	bne _08115FCC
	ldr r0, _08115FC8 @ =gUnknown_083F8DF4
	ldrb r1, [r4, 0x4]
	lsls r1, 30
	lsrs r1, 25
	adds r1, r0
	ldrb r0, [r1, 0x2]
	lsrs r0, 1
	b _081160F4
	.align 2, 0
_08115FC8: .4byte gUnknown_083F8DF4
_08115FCC:
	ldr r0, _08115FDC @ =gUnknown_083F8DF4
	ldrb r1, [r4, 0x4]
	lsls r1, 30
	lsrs r1, 25
	adds r1, r0
	ldrb r0, [r1, 0x2]
	b _081160F4
	.align 2, 0
_08115FDC: .4byte gUnknown_083F8DF4
_08115FE0:
	ldr r0, _0811600C @ =gLocalTime
	ldrb r0, [r0, 0x2]
	subs r0, 0x4
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x6
	bhi _08116014
	cmp r3, 0x5
	bls _08115FFA
	movs r0, 0x1
	ands r0, r1
	cmp r0, 0
	beq _0811605E
_08115FFA:
	ldr r0, _08116010 @ =gUnknown_083F8DF4
	ldrb r1, [r4, 0x4]
	lsls r1, 30
	lsrs r1, 25
	adds r1, r0
	ldrb r0, [r1, 0x2]
	lsrs r0, 1
	b _081160F4
	.align 2, 0
_0811600C: .4byte gLocalTime
_08116010: .4byte gUnknown_083F8DF4
_08116014:
	movs r0, 0x1
	ands r0, r1
	cmp r0, 0
	beq _08116034
	cmp r3, 0x6
	bls _08116034
	ldr r0, _08116030 @ =gUnknown_083F8DF4
	ldrb r1, [r4, 0x4]
	lsls r1, 30
	lsrs r1, 25
	adds r1, r0
	ldrb r0, [r1, 0x2]
	lsrs r0, 2
	b _081160F4
	.align 2, 0
_08116030: .4byte gUnknown_083F8DF4
_08116034:
	ldr r0, _08116044 @ =gUnknown_083F8DF4
	ldrb r1, [r4, 0x4]
	lsls r1, 30
	lsrs r1, 25
	adds r1, r0
	ldrb r0, [r1, 0x2]
	lsrs r0, 1
	b _081160F4
	.align 2, 0
_08116044: .4byte gUnknown_083F8DF4
_08116048:
	ldr r0, _08116064 @ =gLocalTime
	ldrb r0, [r0, 0x2]
	subs r0, 0x4
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x5
	bhi _0811607C
	movs r0, 0x3
	ands r0, r1
	cmp r0, 0
	bne _08116068
_0811605E:
	movs r0, 0x1
	b _081160F4
	.align 2, 0
_08116064: .4byte gLocalTime
_08116068:
	ldr r0, _08116078 @ =gUnknown_083F8DF4
	ldrb r1, [r4, 0x4]
	lsls r1, 30
	lsrs r1, 25
	adds r1, r0
	ldrb r0, [r1, 0x2]
	lsrs r0, 1
	b _081160F4
	.align 2, 0
_08116078: .4byte gUnknown_083F8DF4
_0811607C:
	movs r0, 0x3
	ands r0, r1
	cmp r0, 0
	bne _081160B0
	cmp r3, 0xC
	bls _0811609C
	ldr r0, _08116098 @ =gUnknown_083F8DF4
	ldrb r1, [r4, 0x4]
	lsls r1, 30
	lsrs r1, 25
	adds r1, r0
	ldrb r0, [r1, 0x2]
	lsrs r0, 1
	b _081160F4
	.align 2, 0
_08116098: .4byte gUnknown_083F8DF4
_0811609C:
	ldr r0, _081160AC @ =gUnknown_083F8DF4
	ldrb r1, [r4, 0x4]
	lsls r1, 30
	lsrs r1, 25
	adds r1, r0
	ldrb r0, [r1, 0x2]
	b _081160F4
	.align 2, 0
_081160AC: .4byte gUnknown_083F8DF4
_081160B0:
	movs r0, 0x80
	lsls r0, 8
	ands r0, r1
	cmp r0, 0
	beq _081160E4
	cmp r3, 0xC
	bls _081160D0
	ldr r0, _081160CC @ =gUnknown_083F8DF4
	ldrb r1, [r4, 0x4]
	lsls r1, 30
	lsrs r1, 25
	adds r1, r0
	ldrb r0, [r1, 0x2]
	b _081160F4
	.align 2, 0
_081160CC: .4byte gUnknown_083F8DF4
_081160D0:
	ldr r0, _081160E0 @ =gUnknown_083F8DF4
	ldrb r1, [r4, 0x4]
	lsls r1, 30
	lsrs r1, 25
	adds r1, r0
	ldrb r0, [r1, 0x1]
	b _081160F4
	.align 2, 0
_081160E0: .4byte gUnknown_083F8DF4
_081160E4:
	ldr r0, _081160FC @ =gUnknown_083F8DF4
	ldrb r1, [r4, 0x4]
	lsls r1, 30
	lsrs r1, 25
	adds r1, r0
	ldrb r0, [r1, 0x1]
	lsls r0, 25
	lsrs r0, 24
_081160F4:
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_081160FC: .4byte gUnknown_083F8DF4
	thumb_func_end sub_8115F58

	thumb_func_start sub_8116100
sub_8116100: @ 8116100
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	sub sp, 0x8
	lsls r0, 24
	lsrs r0, 24
	mov r9, r0
	movs r4, 0
	ldr r1, _08116188 @ =gUnknown_083F8ECE
	mov r0, sp
	movs r2, 0x8
	bl memcpy
	bl Random
	lsls r0, 16
	lsrs r7, r0, 16
	adds r0, r7, 0
	movs r1, 0x64
	bl __umodsi3
	lsls r0, 16
	lsrs r6, r0, 16
	ldr r3, _0811618C @ =0x02019000
	ldr r1, _08116190 @ =gTasks
	mov r2, r9
	lsls r0, r2, 2
	add r0, r9
	lsls r0, 3
	adds r0, r1
	ldrh r2, [r0, 0x14]
	adds r1, r3, 0
	adds r1, 0x7C
	strb r2, [r1]
	adds r1, 0x3
	strb r4, [r1]
	subs r1, 0x1
	strb r4, [r1]
	subs r1, 0x1
	strb r4, [r1]
	ldrh r0, [r0, 0x18]
	adds r1, r7, 0
	bl sub_8115F58
	adds r4, r0, 0
	lsls r4, 24
	lsrs r1, r4, 24
	adds r0, r7, 0
	bl __modsi3
	lsrs r4, 25
	subs r0, r4
	lsls r0, 24
	lsrs r4, r0, 24
	ldr r0, _08116194 @ =gLocalTime
	ldrb r0, [r0, 0x2]
	lsls r0, 24
	asrs r0, 24
	movs r5, 0x1
	cmp r0, 0xC
	bgt _08116180
	movs r5, 0
_08116180:
	cmp r6, 0x4F
	bhi _08116198
	lsls r0, r5, 25
	b _081161A2
	.align 2, 0
_08116188: .4byte gUnknown_083F8ECE
_0811618C: .4byte 0x02019000
_08116190: .4byte gTasks
_08116194: .4byte gLocalTime
_08116198:
	lsls r1, r5, 24
	asrs r1, 24
	movs r0, 0x1
	subs r0, r1
	lsls r0, 25
_081161A2:
	lsrs r5, r0, 24
	ldr r6, _081162D8 @ =0x02019000
	ldrb r0, [r6, 0x4]
	lsls r0, 30
	mov r10, r0
	lsrs r0, 25
	ldr r1, _081162DC @ =gUnknown_083F8DF4
	adds r0, r1
	lsls r4, 24
	asrs r4, 24
	ldrh r0, [r0, 0x1A]
	adds r4, r0
	adds r0, r6, 0
	adds r0, 0x80
	strh r4, [r0]
	lsls r4, 16
	asrs r4, 16
	adds r0, r4, 0
	bl __floatsisf
	cmp r4, 0
	bge _081161D4
	ldr r1, _081162E0 @ =0x47800000
	bl __addsf3
_081161D4:
	ldr r1, _081162E4 @ =0x40a00000
	bl __divsf3
	bl __fixunssfsi
	lsls r0, 16
	lsrs r4, r0, 16
	lsls r0, r4, 1
	adds r0, r4
	mov r8, r0
	adds r0, r6, 0
	adds r0, 0x82
	mov r2, r8
	strh r2, [r0]
	adds r0, 0x2
	strh r4, [r0]
	adds r0, 0x2
	strh r4, [r0]
	movs r0, 0x1
	ands r0, r7
	lsls r1, r5, 24
	asrs r1, 24
	adds r0, r1
	lsls r0, 1
	add r0, sp
	movs r1, 0
	ldrsh r4, [r0, r1]
	adds r0, r4, 0
	bl __floatsisf
	cmp r4, 0
	bge _0811621A
	ldr r1, _081162E0 @ =0x47800000
	bl __addsf3
_0811621A:
	ldr r2, _081162E8 @ =0x02019088
	str r0, [r2]
	adds r7, r6, 0
	adds r7, 0x8C
	mov r1, r10
	lsrs r0, r1, 25
	ldr r2, _081162DC @ =gUnknown_083F8DF4
	adds r0, r2
	movs r1, 0x18
	ldrsh r4, [r0, r1]
	adds r0, r4, 0
	bl __floatsisf
	adds r5, r0, 0
	cmp r4, 0
	bge _08116242
	ldr r1, _081162E0 @ =0x47800000
	bl __addsf3
	adds r5, r0, 0
_08116242:
	str r5, [r7]
	adds r7, r6, 0
	adds r7, 0x90
	ldr r1, _081162EC @ =0x3f000000
	adds r0, r5, 0
	bl __mulsf3
	adds r1, r5, 0
	bl __subsf3
	adds r5, r0, 0
	mov r2, r8
	lsls r0, r2, 16
	asrs r4, r0, 16
	adds r0, r4, 0
	bl __floatsisf
	adds r2, r0, 0
	cmp r4, 0
	bge _08116272
	ldr r1, _081162E0 @ =0x47800000
	bl __addsf3
	adds r2, r0, 0
_08116272:
	adds r0, r5, 0
	adds r1, r2, 0
	bl __divsf3
	str r0, [r7]
	adds r1, r6, 0
	adds r1, 0x94
	ldr r0, _081162F0 @ =0x42880000
	str r0, [r1]
	adds r1, 0x8
	ldr r0, _081162F4 @ =0x00000000
	str r0, [r1]
	adds r5, r6, 0
	adds r5, 0x98
	adds r0, r4, 0
	bl __floatsisf
	adds r2, r0, 0
	cmp r4, 0
	bge _081162A2
	ldr r1, _081162E0 @ =0x47800000
	bl __addsf3
	adds r2, r0, 0
_081162A2:
	ldr r0, _081162F8 @ =0x41000000
	adds r1, r2, 0
	bl __divsf3
	bl __negsf2
	str r0, [r5]
	adds r1, r6, 0
	adds r1, 0xA0
	ldr r0, _081162FC @ =0x42100000
	str r0, [r1]
	ldr r1, _08116300 @ =gTasks
	mov r2, r9
	lsls r0, r2, 2
	add r0, r9
	lsls r0, 3
	adds r0, r1
	ldr r1, _08116304 @ =sub_8116308
	str r1, [r0]
	add sp, 0x8
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_081162D8: .4byte 0x02019000
_081162DC: .4byte gUnknown_083F8DF4
_081162E0: .4byte 0x47800000
_081162E4: .4byte 0x40a00000
_081162E8: .4byte 0x02019088
_081162EC: .4byte 0x3f000000
_081162F0: .4byte 0x42880000
_081162F4: .4byte 0x00000000
_081162F8: .4byte 0x41000000
_081162FC: .4byte 0x42100000
_08116300: .4byte gTasks
_08116304: .4byte sub_8116308
	thumb_func_end sub_8116100

	thumb_func_start sub_8116308
sub_8116308: @ 8116308
	push {r4,lr}
	lsls r0, 24
	lsrs r0, 24
	ldr r3, _08116368 @ =0x02019000
	ldrb r1, [r3, 0x3]
	movs r2, 0x80
	orrs r1, r2
	strb r1, [r3, 0x3]
	adds r2, r3, 0
	adds r2, 0x7C
	adds r1, r3, 0
	adds r1, 0x3C
	ldrb r2, [r2]
	adds r1, r2
	ldrb r2, [r1]
	lsls r1, r2, 4
	adds r1, r2
	lsls r1, 2
	ldr r2, _0811636C @ =gSprites
	adds r1, r2
	str r1, [r3, 0x38]
	ldr r2, _08116370 @ =sub_81191F4
	str r2, [r1, 0x1C]
	ldr r1, _08116374 @ =gTasks
	lsls r4, r0, 2
	adds r4, r0
	lsls r4, 3
	adds r4, r1
	ldrh r1, [r4, 0x14]
	adds r1, 0x1
	strh r1, [r4, 0x14]
	ldrh r0, [r4, 0x18]
	adds r0, 0x1
	strh r0, [r4, 0x18]
	movs r0, 0x6
	subs r0, r1
	lsls r0, 24
	lsrs r0, 24
	bl sub_81182F8
	movs r0, 0x5C
	bl m4aSongNumStart
	ldr r0, _08116378 @ =sub_811637C
	str r0, [r4]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08116368: .4byte 0x02019000
_0811636C: .4byte gSprites
_08116370: .4byte sub_81191F4
_08116374: .4byte gTasks
_08116378: .4byte sub_811637C
	thumb_func_end sub_8116308

	thumb_func_start sub_811637C
sub_811637C: @ 811637C
	push {r4-r7,lr}
	lsls r0, 24
	lsrs r5, r0, 24
	ldr r4, _081163B0 @ =0x02019000
	adds r0, r4, 0
	adds r0, 0x7D
	ldrb r0, [r0]
	cmp r0, 0
	beq _08116464
	ldrb r1, [r4, 0x3]
	movs r0, 0x20
	ands r0, r1
	cmp r0, 0
	beq _081163B4
	movs r0, 0x40
	ands r0, r1
	cmp r0, 0
	beq _08116464
	movs r0, 0x41
	negs r0, r0
	ands r0, r1
	movs r1, 0x21
	negs r1, r1
	ands r0, r1
	strb r0, [r4, 0x3]
	b _08116464
	.align 2, 0
_081163B0: .4byte 0x02019000
_081163B4:
	ldr r2, _08116428 @ =gTasks
	lsls r1, r5, 2
	adds r0, r1, r5
	lsls r0, 3
	adds r6, r0, r2
	movs r2, 0xA
	ldrsh r0, [r6, r2]
	adds r7, r1, 0
	cmp r0, 0
	bne _08116400
	adds r0, r4, 0
	adds r0, 0x7E
	ldrb r1, [r0]
	adds r0, r5, 0
	bl sub_8116D54
	lsls r0, 24
	lsrs r0, 24
	ldrb r1, [r4, 0x1A]
	lsls r1, 28
	lsrs r1, 28
	adds r2, r4, 0
	adds r2, 0x1B
	adds r1, r2
	ldrb r1, [r1]
	bl sub_8116E5C
	lsls r0, 24
	lsrs r0, 24
	strh r0, [r6, 0x12]
	cmp r0, 0x1
	bne _08116400
	adds r0, r4, 0
	adds r0, 0xB8
	movs r1, 0x80
	lsls r1, 5
	bl sub_8124CE8
_08116400:
	ldr r0, _08116428 @ =gTasks
	adds r1, r7, r5
	lsls r1, 3
	adds r4, r1, r0
	movs r1, 0xA
	ldrsh r0, [r4, r1]
	cmp r0, 0x3C
	bgt _08116430
	ldr r0, _0811642C @ =gMain
	ldrh r1, [r0, 0x2E]
	movs r0, 0x1
	ands r0, r1
	cmp r0, 0
	beq _08116420
	movs r0, 0x3C
	strh r0, [r4, 0xA]
_08116420:
	ldrh r0, [r4, 0xA]
	adds r0, 0x1
	strh r0, [r4, 0xA]
	b _08116464
	.align 2, 0
_08116428: .4byte gTasks
_0811642C: .4byte gMain
_08116430:
	ldr r1, _0811646C @ =0x02019000
	ldrb r0, [r1, 0x1A]
	lsls r0, 28
	lsrs r0, 28
	adds r1, 0x1B
	adds r0, r1
	ldrb r0, [r0]
	bl sub_8117158
	ldrh r1, [r4, 0x20]
	lsls r1, 24
	lsrs r1, 24
	movs r0, 0
	bl sub_8117AA8
	ldrb r1, [r4, 0x14]
	subs r1, 0x1
	lsls r1, 24
	lsrs r1, 24
	movs r0, 0
	bl sub_8117C60
	movs r0, 0x20
	strh r0, [r4, 0xA]
	ldr r0, _08116470 @ =sub_8116474
	str r0, [r4]
_08116464:
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_0811646C: .4byte 0x02019000
_08116470: .4byte sub_8116474
	thumb_func_end sub_811637C

	thumb_func_start sub_8116474
sub_8116474: @ 8116474
	push {r4,r5,lr}
	lsls r0, 24
	lsrs r5, r0, 24
	ldr r1, _081164C8 @ =gTasks
	lsls r0, r5, 2
	adds r0, r5
	lsls r0, 3
	adds r4, r0, r1
	ldrh r0, [r4, 0xA]
	subs r1, r0, 0x1
	strh r1, [r4, 0xA]
	lsls r0, 16
	cmp r0, 0
	ble _081164DC
	lsls r0, r1, 16
	asrs r0, 16
	cmp r0, 0x2
	ble _081164A0
	ldr r1, _081164CC @ =gSpriteCoordOffsetX
	ldrh r0, [r1]
	subs r0, 0x2
	strh r0, [r1]
_081164A0:
	ldr r1, _081164D0 @ =0x02019000
	ldrh r0, [r1, 0x26]
	subs r0, 0x4
	strh r0, [r1, 0x26]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x68
	bne _08116504
	ldr r2, _081164D4 @ =gSprites
	adds r0, r1, 0
	adds r0, 0x55
	ldrb r1, [r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r2, 0x1C
	adds r0, r2
	ldr r1, _081164D8 @ =sub_81184CC
	str r1, [r0]
	b _08116504
	.align 2, 0
_081164C8: .4byte gTasks
_081164CC: .4byte gSpriteCoordOffsetX
_081164D0: .4byte 0x02019000
_081164D4: .4byte gSprites
_081164D8: .4byte sub_81184CC
_081164DC:
	ldrh r0, [r4, 0x20]
	lsls r0, 24
	lsrs r0, 24
	bl sub_8117D68
	movs r1, 0x12
	ldrsh r0, [r4, r1]
	cmp r0, 0x1
	bne _081164F2
	movs r0, 0x79
	b _081164F4
_081164F2:
	movs r0, 0x3D
_081164F4:
	strh r0, [r4, 0xA]
	ldr r0, _0811650C @ =gTasks
	lsls r1, r5, 2
	adds r1, r5
	lsls r1, 3
	adds r1, r0
	ldr r0, _08116510 @ =sub_8116514
	str r0, [r1]
_08116504:
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_0811650C: .4byte gTasks
_08116510: .4byte sub_8116514
	thumb_func_end sub_8116474

	thumb_func_start sub_8116514
sub_8116514: @ 8116514
	push {r4,lr}
	lsls r0, 24
	lsrs r2, r0, 24
	ldr r1, _08116564 @ =gTasks
	lsls r0, r2, 2
	adds r0, r2
	lsls r0, 3
	adds r4, r0, r1
	ldrh r0, [r4, 0xA]
	subs r1, r0, 0x1
	strh r1, [r4, 0xA]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x1
	ble _08116584
	movs r0, 0xA
	ldrsh r1, [r4, r0]
	adds r0, r1, 0
	cmp r1, 0
	bge _0811653E
	adds r0, 0xF
_0811653E:
	asrs r0, 4
	lsls r0, 4
	subs r0, r1, r0
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0
	beq _08116568
	cmp r0, 0x8
	bne _08116590
	movs r0, 0
	movs r1, 0xFF
	bl sub_8117AA8
	movs r0, 0
	movs r1, 0xFF
	bl sub_8117C60
	b _08116590
	.align 2, 0
_08116564: .4byte gTasks
_08116568:
	ldrh r1, [r4, 0x20]
	lsls r1, 24
	lsrs r1, 24
	movs r0, 0
	bl sub_8117AA8
	ldrb r1, [r4, 0x14]
	subs r1, 0x1
	lsls r1, 24
	lsrs r1, 24
	movs r0, 0
	bl sub_8117C60
	b _08116590
_08116584:
	ldr r1, _08116598 @ =sub_8116638
	adds r0, r2, 0
	movs r2, 0x1E
	movs r3, 0
	bl sub_8116C34
_08116590:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08116598: .4byte sub_8116638
	thumb_func_end sub_8116514

	thumb_func_start sub_811659C
sub_811659C: @ 811659C
	push {r4,r5,lr}
	lsls r0, 24
	lsrs r5, r0, 24
	ldr r1, _081165F4 @ =gTasks
	lsls r0, r5, 2
	adds r0, r5
	lsls r0, 3
	adds r4, r0, r1
	movs r1, 0x12
	ldrsh r0, [r4, r1]
	cmp r0, 0
	beq _08116600
	cmp r0, 0
	blt _08116600
	cmp r0, 0x2
	bgt _08116600
	bl IsFanfareTaskInactive
	lsls r0, 24
	cmp r0, 0
	beq _08116624
	movs r0, 0x1D
	bl sub_8053108
	ldrh r1, [r4, 0x1E]
	adds r1, 0x1
	strh r1, [r4, 0x1E]
	lsls r1, 16
	asrs r1, 16
	cmp r0, r1
	bcs _081165E4
	movs r0, 0x1E
	ldrsh r1, [r4, r0]
	movs r0, 0x1D
	bl sav12_xor_set
_081165E4:
	ldr r1, _081165F8 @ =sub_811677C
	ldr r2, _081165FC @ =0x0000ffff
	adds r0, r5, 0
	movs r3, 0x3
	bl sub_8116C34
	b _08116624
	.align 2, 0
_081165F4: .4byte gTasks
_081165F8: .4byte sub_811677C
_081165FC: .4byte 0x0000ffff
_08116600:
	bl IsSEPlaying
	lsls r0, 24
	lsrs r2, r0, 24
	cmp r2, 0
	bne _08116624
	ldr r1, _0811662C @ =gTasks
	lsls r0, r5, 2
	adds r0, r5
	lsls r0, 3
	adds r0, r1
	strh r2, [r0, 0x1E]
	ldr r1, _08116630 @ =sub_81167F4
	ldr r2, _08116634 @ =0x0000ffff
	adds r0, r5, 0
	movs r3, 0x3
	bl sub_8116C34
_08116624:
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_0811662C: .4byte gTasks
_08116630: .4byte sub_81167F4
_08116634: .4byte 0x0000ffff
	thumb_func_end sub_811659C

	thumb_func_start sub_8116638
sub_8116638: @ 8116638
	push {r4,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	ldr r1, _08116678 @ =gTasks
	lsls r0, r4, 2
	adds r0, r4
	lsls r0, 3
	adds r0, r1
	movs r2, 0x12
	ldrsh r1, [r0, r2]
	cmp r1, 0
	beq _081166A8
	cmp r1, 0
	blt _081166A8
	cmp r1, 0x2
	bgt _081166A8
	movs r1, 0xC
	ldrsh r0, [r0, r1]
	cmp r0, 0xC
	bne _08116684
	ldr r0, _0811667C @ =0x00000185
	bl PlayFanfare
	movs r0, 0
	movs r1, 0xE
	movs r2, 0x1D
	movs r3, 0x13
	bl MenuDrawTextWindow
	ldr r0, _08116680 @ =gUnknown_081C41A5
	b _0811669A
	.align 2, 0
_08116678: .4byte gTasks
_0811667C: .4byte 0x00000185
_08116680: .4byte gUnknown_081C41A5
_08116684:
	movs r0, 0xC3
	lsls r0, 1
	bl PlayFanfare
	movs r0, 0
	movs r1, 0xE
	movs r2, 0x1D
	movs r3, 0x13
	bl MenuDrawTextWindow
	ldr r0, _081166A4 @ =gUnknown_081C4199
_0811669A:
	movs r1, 0x1
	movs r2, 0xF
	bl MenuPrint
	b _081166C4
	.align 2, 0
_081166A4: .4byte gUnknown_081C4199
_081166A8:
	movs r0, 0x20
	bl m4aSongNumStart
	movs r0, 0
	movs r1, 0xE
	movs r2, 0x1D
	movs r3, 0x13
	bl MenuDrawTextWindow
	ldr r0, _081166DC @ =gUnknown_081C41AE
	movs r1, 0x1
	movs r2, 0xF
	bl MenuPrint
_081166C4:
	ldr r1, _081166E0 @ =gTasks
	lsls r0, r4, 2
	adds r0, r4
	lsls r0, 3
	adds r0, r1
	movs r1, 0
	strh r1, [r0, 0xA]
	ldr r1, _081166E4 @ =sub_811659C
	str r1, [r0]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_081166DC: .4byte gUnknown_081C41AE
_081166E0: .4byte gTasks
_081166E4: .4byte sub_811659C
	thumb_func_end sub_8116638

	thumb_func_start sub_81166E8
sub_81166E8: @ 81166E8
	push {r4-r6,lr}
	lsls r0, 24
	lsrs r6, r0, 24
	ldr r1, _0811670C @ =gTasks
	lsls r0, r6, 2
	adds r0, r6
	lsls r0, 3
	adds r4, r0, r1
	movs r0, 0x16
	ldrsh r5, [r4, r0]
	cmp r5, 0
	beq _08116710
	cmp r5, 0x3
	beq _08116740
	ldrh r0, [r4, 0x16]
	adds r0, 0x1
	b _08116748
	.align 2, 0
_0811670C: .4byte gTasks
_08116710:
	ldrh r0, [r4, 0x22]
	adds r0, 0x1
	strh r0, [r4, 0x22]
	movs r0, 0x15
	bl m4aSongNumStart
	ldrh r0, [r4, 0x22]
	bl sub_81180F4
	movs r2, 0x22
	ldrsh r1, [r4, r2]
	ldr r0, _08116730 @ =0x0000270e
	cmp r1, r0
	ble _08116734
	strh r5, [r4, 0xA]
	b _0811674A
	.align 2, 0
_08116730: .4byte 0x0000270e
_08116734:
	ldrh r0, [r4, 0xA]
	subs r0, 0x1
	strh r0, [r4, 0xA]
	ldrh r0, [r4, 0x16]
	adds r0, 0x1
	b _08116748
_08116740:
	movs r0, 0x15
	bl m4aSongNumStop
	movs r0, 0
_08116748:
	strh r0, [r4, 0x16]
_0811674A:
	ldr r0, _08116770 @ =gTasks
	lsls r1, r6, 2
	adds r1, r6
	lsls r1, 3
	adds r1, r0
	movs r2, 0xA
	ldrsh r0, [r1, r2]
	cmp r0, 0
	bne _08116768
	ldr r1, _08116774 @ =sub_81167F4
	ldr r2, _08116778 @ =0x0000ffff
	adds r0, r6, 0
	movs r3, 0x3
	bl sub_8116C34
_08116768:
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_08116770: .4byte gTasks
_08116774: .4byte sub_81167F4
_08116778: .4byte 0x0000ffff
	thumb_func_end sub_81166E8

	thumb_func_start sub_811677C
sub_811677C: @ 811677C
	push {r4-r6,lr}
	lsls r0, 24
	lsrs r0, 24
	ldr r3, _081167DC @ =gStringVar1
	ldr r6, _081167E0 @ =0x02019000
	ldrb r2, [r6, 0x19]
	ldr r1, _081167E4 @ =gTasks
	lsls r4, r0, 2
	adds r4, r0
	lsls r4, 3
	adds r4, r1
	movs r1, 0xC
	ldrsh r0, [r4, r1]
	adds r1, r2, 0
	muls r1, r0
	adds r0, r3, 0
	movs r2, 0
	movs r3, 0x2
	bl ConvertIntToDecimalStringN
	ldr r5, _081167E8 @ =gStringVar4
	ldr r1, _081167EC @ =gUnknown_081C41BD
	adds r0, r5, 0
	bl StringExpandPlaceholders
	movs r0, 0
	movs r1, 0xE
	movs r2, 0x1D
	movs r3, 0x13
	bl MenuDrawTextWindow
	adds r0, r5, 0
	movs r1, 0x1
	movs r2, 0xF
	bl MenuPrint
	ldrb r1, [r6, 0x19]
	movs r2, 0xC
	ldrsh r0, [r4, r2]
	muls r0, r1
	movs r1, 0
	strh r0, [r4, 0xA]
	strh r1, [r4, 0x16]
	ldr r0, _081167F0 @ =sub_81166E8
	str r0, [r4]
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_081167DC: .4byte gStringVar1
_081167E0: .4byte 0x02019000
_081167E4: .4byte gTasks
_081167E8: .4byte gStringVar4
_081167EC: .4byte gUnknown_081C41BD
_081167F0: .4byte sub_81166E8
	thumb_func_end sub_811677C

	thumb_func_start sub_81167F4
sub_81167F4: @ 81167F4
	push {r4-r6,lr}
	adds r5, r0, 0
	lsls r5, 24
	lsrs r5, 24
	ldr r4, _08116868 @ =0x020190b8
	ldr r1, _0811686C @ =0x0000ffff
	adds r0, r4, 0
	bl sub_8124D3C
	adds r3, r4, 0
	adds r3, 0xB8
	ldrb r2, [r3]
	movs r1, 0x7F
	adds r0, r1, 0
	ands r0, r2
	strb r0, [r3]
	subs r3, 0xC
	ldrb r2, [r3]
	adds r0, r1, 0
	ands r0, r2
	strb r0, [r3]
	adds r2, r4, 0
	adds r2, 0xA0
	ldrb r0, [r2]
	ands r1, r0
	strb r1, [r2]
	ldr r6, _08116870 @ =gSprites
	ldr r2, _08116874 @ =gUnknown_083F8C00
	ldr r0, _08116878 @ =gTasks
	lsls r3, r5, 2
	adds r3, r5
	lsls r3, 3
	adds r3, r0
	movs r0, 0x20
	ldrsh r1, [r3, r0]
	lsls r0, r1, 2
	adds r0, r1
	lsls r0, 2
	adds r0, r2
	ldrb r0, [r0]
	adds r4, r0
	subs r4, 0x75
	ldrb r1, [r4]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r6
	adds r0, 0x3E
	ldrb r1, [r0]
	movs r2, 0x4
	orrs r1, r2
	strb r1, [r0]
	ldr r0, _0811687C @ =sub_8116880
	str r0, [r3]
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_08116868: .4byte 0x020190b8
_0811686C: .4byte 0x0000ffff
_08116870: .4byte gSprites
_08116874: .4byte gUnknown_083F8C00
_08116878: .4byte gTasks
_0811687C: .4byte sub_8116880
	thumb_func_end sub_81167F4

	thumb_func_start sub_8116880
sub_8116880: @ 8116880
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	lsls r0, 24
	lsrs r6, r0, 24
	movs r5, 0
	ldr r1, _08116954 @ =gTasks
	lsls r0, r6, 2
	adds r0, r6
	lsls r0, 3
	adds r0, r1
	movs r2, 0
	strh r5, [r0, 0x10]
	ldr r4, _08116958 @ =0x02019000
	ldrb r0, [r4, 0x1A]
	lsls r0, 28
	lsrs r0, 28
	adds r1, r4, 0
	adds r1, 0x1B
	adds r0, r1
	strb r2, [r0]
	movs r0, 0
	bl sub_8117158
	ldr r3, _0811695C @ =gSprites
	adds r0, r4, 0
	adds r0, 0x6C
	ldrb r1, [r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r3
	adds r0, 0x3E
	ldrb r1, [r0]
	movs r2, 0x4
	orrs r1, r2
	strb r1, [r0]
	adds r7, r3, 0
	movs r0, 0x3C
	adds r0, r4
	mov r10, r0
	movs r1, 0x8
	adds r1, r7
	mov r8, r1
	ldr r0, _08116960 @ =0xfffffc00
	mov r9, r0
	ldr r1, _08116964 @ =0x000003ff
	mov r12, r1
_081168E4:
	adds r0, r5, 0
	adds r0, 0x29
	add r0, r10
	ldrb r1, [r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r3, r0, r7
	adds r2, r3, 0
	adds r2, 0x40
	add r0, r8
	ldr r0, [r0]
	ldr r0, [r0]
	ldrh r1, [r0]
	ldrh r2, [r2]
	adds r1, r2
	mov r0, r12
	ands r1, r0
	ldrh r2, [r3, 0x4]
	mov r0, r9
	ands r0, r2
	orrs r0, r1
	strh r0, [r3, 0x4]
	adds r0, r5, 0x1
	lsls r0, 24
	lsrs r5, r0, 24
	cmp r5, 0x3
	bls _081168E4
	ldr r0, _08116954 @ =gTasks
	lsls r1, r6, 2
	adds r1, r6
	lsls r1, 3
	adds r2, r1, r0
	movs r1, 0x22
	ldrsh r0, [r2, r1]
	ldrb r4, [r4, 0x19]
	cmp r0, r4
	blt _081169BC
	movs r1, 0x14
	ldrsh r0, [r2, r1]
	cmp r0, 0x6
	bne _08116970
	movs r0, 0
	movs r1, 0xE
	movs r2, 0x1D
	movs r3, 0x13
	bl MenuDrawTextWindow
	ldr r0, _08116968 @ =gUnknown_081C41F1
	movs r1, 0x1
	movs r2, 0xF
	bl MenuPrint
	ldr r1, _0811696C @ =dp01t_12_3_battle_menu
	b _08116992
	.align 2, 0
_08116954: .4byte gTasks
_08116958: .4byte 0x02019000
_0811695C: .4byte gSprites
_08116960: .4byte 0xfffffc00
_08116964: .4byte 0x000003ff
_08116968: .4byte gUnknown_081C41F1
_0811696C: .4byte dp01t_12_3_battle_menu
_08116970:
	movs r0, 0x22
	ldrsh r1, [r2, r0]
	ldr r0, _081169A0 @ =0x0000270f
	cmp r1, r0
	bne _081169B0
	movs r0, 0
	movs r1, 0xE
	movs r2, 0x1D
	movs r3, 0x13
	bl MenuDrawTextWindow
	ldr r0, _081169A4 @ =gUnknown_081C4231
	movs r1, 0x1
	movs r2, 0xF
	bl MenuPrint
	ldr r1, _081169A8 @ =sub_8115734
_08116992:
	ldr r2, _081169AC @ =0x0000ffff
	adds r0, r6, 0
	movs r3, 0x3
	bl sub_8116C34
	b _081169DE
	.align 2, 0
_081169A0: .4byte 0x0000270f
_081169A4: .4byte gUnknown_081C4231
_081169A8: .4byte sub_8115734
_081169AC: .4byte 0x0000ffff
_081169B0:
	ldr r0, _081169B8 @ =sub_8115734
	str r0, [r2]
	b _081169DE
	.align 2, 0
_081169B8: .4byte sub_8115734
_081169BC:
	movs r0, 0
	movs r1, 0xE
	movs r2, 0x1D
	movs r3, 0x13
	bl MenuDrawTextWindow
	ldr r0, _081169EC @ =gUnknown_081C41D2
	movs r1, 0x1
	movs r2, 0xF
	bl MenuPrint
	ldr r1, _081169F0 @ =sub_81157AC
	adds r0, r6, 0
	movs r2, 0x3C
	movs r3, 0x3
	bl sub_8116C34
_081169DE:
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_081169EC: .4byte gUnknown_081C41D2
_081169F0: .4byte sub_81157AC
	thumb_func_end sub_8116880

	thumb_func_start dp01t_12_3_battle_menu
dp01t_12_3_battle_menu: @ 81169F4
	push {r4-r7,lr}
	lsls r0, 24
	lsrs r5, r0, 24
	movs r4, 0
	ldr r1, _08116A84 @ =gTasks
	lsls r0, r5, 2
	adds r0, r5
	lsls r0, 3
	adds r0, r1
	strh r4, [r0, 0x14]
	adds r0, r5, 0
	bl sub_8116CAC
	bl sub_8116CF8
	bl sub_81185E8
	movs r0, 0
	bl sub_8117158
	movs r0, 0x6
	bl sub_81182F8
	ldr r7, _08116A88 @ =gSprites
	ldr r3, _08116A8C @ =0x0201903c
	movs r6, 0x5
	negs r6, r6
_08116A2A:
	adds r0, r4, 0x7
	adds r0, r3
	ldrb r0, [r0]
	lsls r1, r0, 4
	adds r1, r0
	lsls r1, 2
	adds r1, r7
	adds r1, 0x3E
	ldrb r2, [r1]
	adds r0, r6, 0
	ands r0, r2
	strb r0, [r1]
	adds r0, r4, 0x1
	lsls r0, 24
	lsrs r4, r0, 24
	cmp r4, 0xB
	bls _08116A2A
	ldr r1, _08116A84 @ =gTasks
	lsls r0, r5, 2
	adds r0, r5
	lsls r0, 3
	adds r2, r0, r1
	movs r0, 0x22
	ldrsh r1, [r2, r0]
	ldr r0, _08116A90 @ =0x0000270f
	cmp r1, r0
	bne _08116AA0
	movs r0, 0
	movs r1, 0xE
	movs r2, 0x1D
	movs r3, 0x13
	bl MenuDrawTextWindow
	ldr r0, _08116A94 @ =gUnknown_081C4231
	movs r1, 0x1
	movs r2, 0xF
	bl MenuPrint
	ldr r1, _08116A98 @ =sub_8115734
	ldr r2, _08116A9C @ =0x0000ffff
	adds r0, r5, 0
	movs r3, 0x3
	bl sub_8116C34
	b _08116AA4
	.align 2, 0
_08116A84: .4byte gTasks
_08116A88: .4byte gSprites
_08116A8C: .4byte 0x0201903c
_08116A90: .4byte 0x0000270f
_08116A94: .4byte gUnknown_081C4231
_08116A98: .4byte sub_8115734
_08116A9C: .4byte 0x0000ffff
_08116AA0:
	ldr r0, _08116AAC @ =sub_8115734
	str r0, [r2]
_08116AA4:
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_08116AAC: .4byte sub_8115734
	thumb_func_end dp01t_12_3_battle_menu

	thumb_func_start sub_8116AB0
sub_8116AB0: @ 8116AB0
	push {r4,r5,lr}
	sub sp, 0x4
	lsls r0, 24
	lsrs r5, r0, 24
	ldr r4, _08116AF0 @ =0x020190b8
	ldr r1, _08116AF4 @ =0x0000ffff
	adds r0, r4, 0
	bl sub_8124D3C
	adds r0, r4, 0
	bl sub_8124918
	ldr r1, _08116AF8 @ =gSaveBlock1
	ldr r2, _08116AFC @ =gTasks
	lsls r0, r5, 2
	adds r0, r5
	lsls r0, 3
	adds r0, r2
	ldrh r0, [r0, 0x22]
	ldr r2, _08116B00 @ =0x00000494
	adds r1, r2
	strh r0, [r1]
	subs r4, 0xB8
	lsls r0, 16
	lsrs r0, 16
	ldrb r4, [r4, 0x19]
	cmp r0, r4
	bcs _08116B08
	ldr r1, _08116B04 @ =gUnknown_0202E8CC
	movs r0, 0x1
	b _08116B0C
	.align 2, 0
_08116AF0: .4byte 0x020190b8
_08116AF4: .4byte 0x0000ffff
_08116AF8: .4byte gSaveBlock1
_08116AFC: .4byte gTasks
_08116B00: .4byte 0x00000494
_08116B04: .4byte gUnknown_0202E8CC
_08116B08:
	ldr r1, _08116B34 @ =gUnknown_0202E8CC
	movs r0, 0
_08116B0C:
	strh r0, [r1]
	movs r0, 0
	str r0, [sp]
	movs r0, 0xFF
	movs r1, 0
	movs r2, 0
	movs r3, 0x10
	bl BeginHardwarePaletteFade
	ldr r1, _08116B38 @ =gTasks
	lsls r0, r5, 2
	adds r0, r5
	lsls r0, 3
	adds r0, r1
	ldr r1, _08116B3C @ =sub_8116B40
	str r1, [r0]
	add sp, 0x4
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_08116B34: .4byte gUnknown_0202E8CC
_08116B38: .4byte gTasks
_08116B3C: .4byte sub_8116B40
	thumb_func_end sub_8116AB0

	thumb_func_start sub_8116B40
sub_8116B40: @ 8116B40
	push {r4,r5,lr}
	lsls r0, 24
	lsrs r5, r0, 24
	bl UpdatePaletteFade
	lsls r0, 24
	lsrs r4, r0, 24
	cmp r4, 0
	bne _08116B9E
	movs r0, 0
	bl SetVBlankCallback
	ldr r0, _08116BA4 @ =0x02019000
	movs r2, 0xBE
	lsls r2, 1
	movs r1, 0
	bl memset
	ldr r1, _08116BA8 @ =gSpriteCoordOffsetX
	ldr r0, _08116BAC @ =gSpriteCoordOffsetY
	strh r4, [r0]
	strh r4, [r1]
	bl sub_80F9368
	bl FreeAllSpritePalettes
	bl ResetPaletteFade
	bl ResetSpriteData
	bl sub_80F9020
	ldr r0, _08116BB0 @ =REG_BLDCNT
	strh r4, [r0]
	adds r0, 0x2
	strh r4, [r0]
	adds r0, 0x2
	strh r4, [r0]
	ldr r1, _08116BB4 @ =gUnknown_0300485C
	ldr r0, _08116BB8 @ =sub_8080990
	str r0, [r1]
	ldr r0, _08116BBC @ =c2_exit_to_overworld_2_switch
	bl SetMainCallback2
	adds r0, r5, 0
	bl DestroyTask
_08116B9E:
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_08116BA4: .4byte 0x02019000
_08116BA8: .4byte gSpriteCoordOffsetX
_08116BAC: .4byte gSpriteCoordOffsetY
_08116BB0: .4byte REG_BLDCNT
_08116BB4: .4byte gUnknown_0300485C
_08116BB8: .4byte sub_8080990
_08116BBC: .4byte c2_exit_to_overworld_2_switch
	thumb_func_end sub_8116B40

	thumb_func_start sub_8116BC0
sub_8116BC0: @ 8116BC0
	push {r4-r7,lr}
	lsls r0, 24
	lsrs r3, r0, 24
	ldr r0, _08116C24 @ =0x02019000
	adds r7, r0, 0
	adds r7, 0xA8
	ldrh r1, [r7]
	adds r6, r0, 0
	cmp r1, 0
	beq _08116BE4
	ldr r0, _08116C28 @ =gMain
	adds r2, r6, 0
	adds r2, 0xAA
	ldrh r1, [r0, 0x2E]
	ldrh r0, [r2]
	ands r0, r1
	cmp r0, 0
	beq _08116C0E
_08116BE4:
	ldr r1, _08116C2C @ =gTasks
	lsls r0, r3, 2
	adds r0, r3
	lsls r0, 3
	adds r0, r1
	adds r5, r6, 0
	adds r5, 0xAC
	ldr r1, [r5]
	str r1, [r0]
	adds r4, r6, 0
	adds r4, 0xAA
	ldrh r0, [r4]
	cmp r0, 0
	beq _08116C06
	movs r0, 0x5
	bl PlaySE
_08116C06:
	movs r0, 0
	str r0, [r5]
	strh r0, [r4]
	strh r0, [r7]
_08116C0E:
	adds r2, r6, 0
	adds r2, 0xA8
	ldrh r1, [r2]
	ldr r0, _08116C30 @ =0x0000ffff
	cmp r1, r0
	beq _08116C1E
	subs r0, r1, 0x1
	strh r0, [r2]
_08116C1E:
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_08116C24: .4byte 0x02019000
_08116C28: .4byte gMain
_08116C2C: .4byte gTasks
_08116C30: .4byte 0x0000ffff
	thumb_func_end sub_8116BC0

	thumb_func_start sub_8116C34
sub_8116C34: @ 8116C34
	push {r4-r7,lr}
	adds r5, r1, 0
	lsls r0, 24
	lsrs r6, r0, 24
	lsls r2, 16
	lsrs r4, r2, 16
	lsls r3, 16
	lsrs r3, 16
	ldr r0, _08116C84 @ =0x02019000
	mov r12, r0
	mov r2, r12
	adds r2, 0xB4
	ldr r1, _08116C88 @ =gTasks
	lsls r0, r6, 2
	adds r0, r6
	lsls r0, 3
	adds r0, r1
	ldr r0, [r0]
	str r0, [r2]
	mov r2, r12
	adds r7, r1, 0
	cmp r5, 0
	bne _08116C64
	adds r5, r0, 0
_08116C64:
	adds r0, r2, 0
	adds r0, 0xAC
	str r5, [r0]
	subs r0, 0x4
	strh r4, [r0]
	ldr r0, _08116C8C @ =0x0000ffff
	cmp r4, r0
	bne _08116C90
	cmp r3, 0
	bne _08116C90
	adds r1, r2, 0
	adds r1, 0xAA
	ldrh r0, [r1]
	orrs r4, r0
	strh r4, [r1]
	b _08116C96
	.align 2, 0
_08116C84: .4byte 0x02019000
_08116C88: .4byte gTasks
_08116C8C: .4byte 0x0000ffff
_08116C90:
	adds r0, r2, 0
	adds r0, 0xAA
	strh r3, [r0]
_08116C96:
	lsls r0, r6, 2
	adds r0, r6
	lsls r0, 3
	adds r0, r7
	ldr r1, _08116CA8 @ =sub_8116BC0
	str r1, [r0]
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_08116CA8: .4byte sub_8116BC0
	thumb_func_end sub_8116C34

	thumb_func_start sub_8116CAC
sub_8116CAC: @ 8116CAC
	push {r4-r6,lr}
	lsls r0, 24
	lsrs r5, r0, 24
	movs r2, 0
	ldr r0, _08116CF0 @ =0x02019000
	strb r2, [r0]
	movs r1, 0
	strb r1, [r0, 0x3]
	adds r3, r0, 0
	ldr r6, _08116CF4 @ =gTasks
	adds r4, r3, 0
	adds r4, 0x1B
_08116CC4:
	adds r0, r2, r4
	strb r1, [r0]
	adds r0, r2, 0x1
	lsls r0, 24
	lsrs r2, r0, 24
	cmp r2, 0x5
	bls _08116CC4
	ldrb r1, [r3, 0x1A]
	movs r0, 0x10
	negs r0, r0
	ands r0, r1
	strb r0, [r3, 0x1A]
	lsls r0, r5, 2
	adds r0, r5
	lsls r0, 3
	adds r0, r6
	movs r1, 0
	strh r1, [r0, 0xA]
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_08116CF0: .4byte 0x02019000
_08116CF4: .4byte gTasks
	thumb_func_end sub_8116CAC

	thumb_func_start sub_8116CF8
sub_8116CF8: @ 8116CF8
	push {lr}
	ldr r1, _08116D48 @ =0x02019000
	movs r0, 0
	str r0, [r1, 0x8]
	movs r2, 0
	adds r1, 0xC
	movs r3, 0
_08116D06:
	adds r0, r2, r1
	strb r3, [r0]
	adds r0, r2, 0x1
	lsls r0, 24
	lsrs r2, r0, 24
	cmp r2, 0x5
	bls _08116D06
	movs r2, 0
	ldr r3, _08116D4C @ =0x02019012
	movs r1, 0
_08116D1A:
	adds r0, r2, r3
	strb r1, [r0]
	adds r0, r2, 0x1
	lsls r0, 24
	lsrs r2, r0, 24
	cmp r2, 0x3
	bls _08116D1A
	movs r2, 0
	ldr r3, _08116D50 @ =0x02019016
	movs r1, 0
_08116D2E:
	adds r0, r2, r3
	strb r1, [r0]
	adds r0, r2, 0x1
	lsls r0, 24
	lsrs r2, r0, 24
	cmp r2, 0x2
	bls _08116D2E
	movs r0, 0x1
	movs r1, 0xFF
	bl sub_8117C60
	pop {r0}
	bx r0
	.align 2, 0
_08116D48: .4byte 0x02019000
_08116D4C: .4byte 0x02019012
_08116D50: .4byte 0x02019016
	thumb_func_end sub_8116CF8

	thumb_func_start sub_8116D54
sub_8116D54: @ 8116D54
	push {r4-r7,lr}
	mov r7, r9
	mov r6, r8
	push {r6,r7}
	sub sp, 0x1C
	lsls r0, 24
	lsrs r3, r0, 24
	lsls r1, 24
	lsrs r5, r1, 24
	mov r1, sp
	ldr r0, _08116D88 @ =gUnknown_083F8ED8
	ldm r0!, {r2,r4,r6}
	stm r1!, {r2,r4,r6}
	ldr r0, [r0]
	str r0, [r1]
	add r2, sp, 0x10
	adds r1, r2, 0
	ldr r0, _08116D8C @ =gUnknown_083F8EE8
	ldm r0!, {r4,r6,r7}
	stm r1!, {r4,r6,r7}
	mov r9, r2
	cmp r5, 0xB
	bls _08116D90
	movs r0, 0
	b _08116E38
	.align 2, 0
_08116D88: .4byte gUnknown_083F8ED8
_08116D8C: .4byte gUnknown_083F8EE8
_08116D90:
	ldr r6, _08116E48 @ =0x02019000
	ldr r1, _08116E4C @ =gTasks
	lsls r0, r3, 2
	adds r0, r3
	lsls r0, 3
	adds r0, r1
	movs r7, 0x14
	ldrsh r2, [r0, r7]
	adds r2, r6, r2
	ldr r4, _08116E50 @ =gUnknown_083F8D90
	lsls r5, 3
	adds r3, r5, r4
	ldrb r1, [r3, 0x2]
	strb r1, [r2, 0xB]
	ldrb r1, [r3, 0x2]
	strh r1, [r0, 0x20]
	adds r0, r4, 0x4
	adds r0, r5, r0
	ldr r1, [r6, 0x8]
	ldr r0, [r0]
	orrs r1, r0
	str r1, [r6, 0x8]
	movs r3, 0
	mov r8, r4
	mov r12, r5
	adds r5, r0, 0
	adds r4, r6, 0
	adds r4, 0x12
_08116DC8:
	lsls r0, r3, 2
	mov r1, sp
	adds r2, r1, r0
	ldr r0, [r2]
	ands r0, r5
	cmp r0, 0
	beq _08116DDE
	adds r1, r3, r4
	ldrb r0, [r1]
	adds r0, 0x1
	strb r0, [r1]
_08116DDE:
	adds r0, r3, r4
	ldrb r0, [r0]
	cmp r0, 0x2
	bls _08116DEE
	ldr r0, [r6, 0x8]
	ldr r1, [r2]
	orrs r0, r1
	str r0, [r6, 0x8]
_08116DEE:
	adds r0, r3, 0x1
	lsls r0, 24
	lsrs r3, r0, 24
	cmp r3, 0x3
	bls _08116DC8
	movs r2, 0
	ldr r0, _08116E54 @ =gUnknown_083F8D94
	add r0, r12
	ldr r7, [r0]
	ldr r4, _08116E58 @ =0x02019016
	mov r5, r9
_08116E04:
	lsls r0, r2, 2
	adds r3, r5, r0
	ldr r0, [r3]
	ands r0, r7
	cmp r0, 0
	beq _08116E18
	adds r1, r2, r4
	ldrb r0, [r1]
	adds r0, 0x1
	strb r0, [r1]
_08116E18:
	adds r0, r2, r4
	ldrb r0, [r0]
	cmp r0, 0x3
	bls _08116E28
	ldr r0, [r6, 0x8]
	ldr r1, [r3]
	orrs r0, r1
	str r0, [r6, 0x8]
_08116E28:
	adds r0, r2, 0x1
	lsls r0, 24
	lsrs r2, r0, 24
	cmp r2, 0x2
	bls _08116E04
	mov r0, r12
	add r0, r8
	ldrb r0, [r0, 0x2]
_08116E38:
	add sp, 0x1C
	pop {r3,r4}
	mov r8, r3
	mov r9, r4
	pop {r4-r7}
	pop {r1}
	bx r1
	.align 2, 0
_08116E48: .4byte 0x02019000
_08116E4C: .4byte gTasks
_08116E50: .4byte gUnknown_083F8D90
_08116E54: .4byte gUnknown_083F8D94
_08116E58: .4byte 0x02019016
	thumb_func_end sub_8116D54

	thumb_func_start sub_8116E5C
sub_8116E5C: @ 8116E5C
	push {lr}
	lsls r0, 24
	lsls r1, 24
	lsrs r2, r1, 24
	lsrs r3, r0, 24
	movs r1, 0xFF
	lsls r1, 24
	adds r0, r1
	lsrs r0, 24
	cmp r0, 0x12
	bhi _08116EF0
	cmp r2, 0xF
	bhi _08116EEC
	lsls r0, r2, 2
	ldr r1, _08116E80 @ =_08116E84
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_08116E80: .4byte _08116E84
	.align 2, 0
_08116E84:
	.4byte _08116EC4
	.4byte _08116EC8
	.4byte _08116EC8
	.4byte _08116EC8
	.4byte _08116EC8
	.4byte _08116EDC
	.4byte _08116EEC
	.4byte _08116EEC
	.4byte _08116EEC
	.4byte _08116EEC
	.4byte _08116EDC
	.4byte _08116EEC
	.4byte _08116EEC
	.4byte _08116EEC
	.4byte _08116EEC
	.4byte _08116EDC
_08116EC4:
	movs r0, 0x3
	b _08116EF2
_08116EC8:
	adds r0, r2, 0x5
	cmp r3, r0
	beq _08116EE8
	adds r0, 0x5
	cmp r3, r0
	beq _08116EE8
	adds r0, 0x5
	cmp r3, r0
	bne _08116EF0
	b _08116EE8
_08116EDC:
	adds r0, r2, 0x1
	cmp r3, r0
	blt _08116EF0
	adds r0, r2, 0x4
	cmp r3, r0
	bgt _08116EF0
_08116EE8:
	movs r0, 0x1
	b _08116EF2
_08116EEC:
	cmp r3, r2
	beq _08116EE8
_08116EF0:
	movs r0, 0
_08116EF2:
	pop {r1}
	bx r1
	thumb_func_end sub_8116E5C

	thumb_func_start sub_8116EF8
sub_8116EF8: @ 8116EF8
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	sub sp, 0x20
	lsls r0, 24
	lsrs r6, r0, 24
	movs r0, 0
	str r0, [sp, 0x18]
	cmp r6, 0xA
	beq _08116F1E
	cmp r6, 0xA
	bgt _08116F1A
	cmp r6, 0x5
	beq _08116F1E
	b _08116F7C
_08116F1A:
	cmp r6, 0xF
	bne _08116F7C
_08116F1E:
	adds r0, r6, 0x1
	lsls r0, 24
	lsrs r4, r0, 24
	adds r0, r6, 0x5
	ldr r7, _08116F70 @ =0x020190b8
	cmp r4, r0
	bge _08116F5E
	adds r1, r7, 0
	subs r1, 0xB8
	ldr r3, _08116F74 @ =gUnknown_083F8C00
	ldr r5, [r1, 0x8]
	adds r6, r3, 0
	adds r6, 0x8
	adds r2, r0, 0
_08116F3A:
	lsls r0, r4, 2
	adds r0, r4
	lsls r1, r0, 2
	adds r0, r1, r6
	ldr r0, [r0]
	ands r0, r5
	cmp r0, 0
	bne _08116F54
	adds r0, r1, r3
	ldrh r0, [r0, 0x10]
	ldr r1, [sp, 0x18]
	orrs r1, r0
	str r1, [sp, 0x18]
_08116F54:
	adds r0, r4, 0x1
	lsls r0, 24
	lsrs r4, r0, 24
	cmp r4, r2
	blt _08116F3A
_08116F5E:
	ldr r0, _08116F78 @ =0x0000dfff
	ldr r2, [sp, 0x18]
	ands r2, r0
	str r2, [sp, 0x18]
	adds r0, r7, 0
	adds r1, r2, 0
	bl sub_8124CE8
	b _0811713C
	.align 2, 0
_08116F70: .4byte 0x020190b8
_08116F74: .4byte gUnknown_083F8C00
_08116F78: .4byte 0x0000dfff
_08116F7C:
	mov r0, sp
	ldr r1, _08116FC8 @ =gUnknown_083F8E9C
	ldm r1!, {r2-r4}
	stm r0!, {r2-r4}
	ldm r1!, {r2-r4}
	stm r0!, {r2-r4}
	subs r0, r6, 0x1
	lsls r0, 24
	lsrs r0, 24
	movs r3, 0x1
	mov r10, r3
	cmp r0, 0x3
	bhi _08116F9A
	movs r4, 0x3
	mov r10, r4
_08116F9A:
	adds r0, r6, 0
	movs r1, 0x5
	bl __udivsi3
	lsls r0, 24
	lsrs r0, 8
	ldr r1, _08116FCC @ =0xffff0000
	adds r0, r1
	lsrs r7, r0, 16
	adds r0, r6, 0
	movs r1, 0x5
	bl __umodsi3
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x2
	beq _08116FF8
	cmp r0, 0x2
	bgt _08116FD4
	cmp r0, 0x1
	beq _08116FE4
	ldr r4, _08116FD0 @ =0x02019000
	b _0811703A
	.align 2, 0
_08116FC8: .4byte gUnknown_083F8E9C
_08116FCC: .4byte 0xffff0000
_08116FD0: .4byte 0x02019000
_08116FD4:
	cmp r0, 0x3
	beq _0811700C
	cmp r0, 0x4
	beq _08117020
	ldr r4, _08116FE0 @ =0x02019000
	b _0811703A
	.align 2, 0
_08116FE0: .4byte 0x02019000
_08116FE4:
	ldr r3, _08116FF0 @ =gSprites
	ldr r2, _08116FF4 @ =0x02019000
	adds r0, r2, 0
	adds r0, 0x43
	b _08117028
	.align 2, 0
_08116FF0: .4byte gSprites
_08116FF4: .4byte 0x02019000
_08116FF8:
	ldr r3, _08117004 @ =gSprites
	ldr r2, _08117008 @ =0x02019000
	adds r0, r2, 0
	adds r0, 0x44
	b _08117028
	.align 2, 0
_08117004: .4byte gSprites
_08117008: .4byte 0x02019000
_0811700C:
	ldr r3, _08117018 @ =gSprites
	ldr r2, _0811701C @ =0x02019000
	adds r0, r2, 0
	adds r0, 0x45
	b _08117028
	.align 2, 0
_08117018: .4byte gSprites
_0811701C: .4byte 0x02019000
_08117020:
	ldr r3, _08117088 @ =gSprites
	ldr r2, _0811708C @ =0x02019000
	adds r0, r2, 0
	adds r0, 0x46
_08117028:
	ldrb r1, [r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r3
	ldrb r0, [r0, 0x5]
	lsrs r0, 4
	lsls r7, r0, 4
	adds r4, r2, 0
_0811703A:
	mov r2, r10
	cmp r2, 0x1
	bne _08117094
	ldr r1, _08117090 @ =gUnknown_083F8C00
	lsls r2, r6, 2
	adds r0, r2, r6
	lsls r0, 2
	adds r1, 0x8
	adds r0, r1
	ldr r1, [r4, 0x8]
	ldr r0, [r0]
	ands r1, r0
	str r2, [sp, 0x1C]
	cmp r1, 0
	bne _0811713C
	adds r0, r6, 0
	movs r1, 0x5
	bl __udivsi3
	lsls r0, 24
	lsrs r0, 24
	subs r1, r0, 0x1
	lsls r1, 3
	mov r3, sp
	adds r2, r3, r1
	ldrh r1, [r2, 0x2]
	adds r1, r7, r1
	strh r1, [r2, 0x2]
	adds r1, r4, 0
	adds r1, 0xB8
	lsls r0, 3
	subs r0, 0x8
	adds r2, r3, r0
	adds r0, r1, 0
	movs r1, 0xD
	bl sub_812492C
	b _08117122
	.align 2, 0
_08117088: .4byte gSprites
_0811708C: .4byte 0x02019000
_08117090: .4byte gUnknown_083F8C00
_08117094:
	movs r4, 0
	lsls r0, r6, 2
	str r0, [sp, 0x1C]
	ldr r1, _0811714C @ =0x02019000
	mov r8, r1
	ldr r2, _08117150 @ =gUnknown_083F8C00
	mov r9, r2
_081170A2:
	lsls r0, r4, 2
	adds r0, r4
	adds r0, r6, r0
	adds r0, 0x5
	lsls r0, 24
	lsrs r2, r0, 24
	lsls r0, r2, 2
	adds r0, r2
	lsls r5, r0, 2
	mov r0, r9
	adds r0, 0x8
	adds r0, r5, r0
	mov r3, r8
	ldr r1, [r3, 0x8]
	ldr r0, [r0]
	ands r1, r0
	cmp r1, 0
	bne _0811710E
	adds r0, r2, 0
	movs r1, 0x5
	bl __udivsi3
	lsls r0, 24
	lsrs r0, 24
	subs r1, r0, 0x1
	lsls r1, 3
	mov r3, sp
	adds r2, r3, r1
	ldrh r1, [r2, 0x2]
	adds r1, r7, r1
	strh r1, [r2, 0x2]
	adds r1, r4, 0
	adds r1, 0xD
	lsls r1, 24
	lsrs r1, 24
	lsls r0, 3
	subs r0, 0x8
	adds r2, r3, r0
	mov r0, r8
	adds r0, 0xB8
	bl sub_812492C
	mov r0, r10
	cmp r0, 0x3
	bne _08117104
	mov r1, r9
	adds r0, r5, r1
	ldrh r0, [r0, 0x10]
	str r0, [sp, 0x18]
_08117104:
	mov r0, r10
	subs r0, 0x1
	lsls r0, 24
	lsrs r0, 24
	mov r10, r0
_0811710E:
	adds r0, r4, 0x1
	lsls r0, 24
	lsrs r4, r0, 24
	cmp r4, 0x2
	bls _081170A2
	mov r2, r10
	cmp r2, 0x2
	beq _08117122
	movs r3, 0
	str r3, [sp, 0x18]
_08117122:
	ldr r0, _08117154 @ =0x020190b8
	ldr r2, _08117150 @ =gUnknown_083F8C00
	ldr r4, [sp, 0x1C]
	adds r1, r4, r6
	lsls r1, 2
	adds r1, r2
	ldrh r1, [r1, 0x10]
	ldr r2, [sp, 0x18]
	orrs r2, r1
	str r2, [sp, 0x18]
	adds r1, r2, 0
	bl sub_8124CE8
_0811713C:
	add sp, 0x20
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_0811714C: .4byte 0x02019000
_08117150: .4byte gUnknown_083F8C00
_08117154: .4byte 0x020190b8
	thumb_func_end sub_8116EF8

	thumb_func_start sub_8117158
sub_8117158: @ 8117158
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	sub sp, 0x24
	lsls r0, 24
	lsrs r5, r0, 24
	ldr r4, _0811719C @ =0x02019000
	movs r0, 0x1
	strh r0, [r4, 0x2A]
	movs r0, 0
	movs r1, 0
	bl sub_8117AA8
	ldr r0, _081171A0 @ =gBG1TilemapBuffer
	ldr r1, _081171A4 @ =0xfffff800
	adds r4, r1
	movs r1, 0x10
	str r1, [sp]
	movs r1, 0xD
	str r1, [sp, 0x4]
	adds r1, r4, 0
	movs r2, 0xE
	movs r3, 0x7
	bl sub_8124E2C
	cmp r5, 0xF
	bhi _08117250
	lsls r0, r5, 2
	ldr r1, _081171A8 @ =_081171AC
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_0811719C: .4byte 0x02019000
_081171A0: .4byte gBG1TilemapBuffer
_081171A4: .4byte 0xfffff800
_081171A8: .4byte _081171AC
	.align 2, 0
_081171AC:
	.4byte _08117360
	.4byte _081171EC
	.4byte _081171EC
	.4byte _081171EC
	.4byte _081171EC
	.4byte _08117220
	.4byte _08117250
	.4byte _08117250
	.4byte _08117250
	.4byte _08117250
	.4byte _08117220
	.4byte _08117250
	.4byte _08117250
	.4byte _08117250
	.4byte _08117250
	.4byte _08117220
_081171EC:
	movs r0, 0x4
	str r0, [sp, 0x18]
	add r1, sp, 0x8
	movs r0, 0
	strb r0, [r1]
	adds r0, r1, 0
	ldrb r0, [r0]
	cmp r0, 0x3
	bhi _08117258
	add r4, sp, 0x10
	adds r3, r1, 0
_08117202:
	ldrb r2, [r3]
	adds r2, r4
	ldrb r1, [r3]
	lsls r0, r1, 2
	adds r0, r1
	adds r0, r5, r0
	strb r0, [r2]
	ldrb r0, [r3]
	adds r0, 0x1
	strb r0, [r3]
	ldrb r0, [r3]
	ldr r1, [sp, 0x18]
	cmp r0, r1
	bcc _08117202
	b _08117258
_08117220:
	movs r0, 0x5
	str r0, [sp, 0x18]
	add r1, sp, 0x8
	movs r0, 0
	strb r0, [r1]
	adds r0, r1, 0
	ldrb r0, [r0]
	cmp r0, 0x4
	bhi _08117258
	add r3, sp, 0x10
	adds r2, r1, 0
_08117236:
	ldrb r1, [r2]
	adds r1, r3
	ldrb r0, [r2]
	adds r0, r5, r0
	strb r0, [r1]
	ldrb r0, [r2]
	adds r0, 0x1
	strb r0, [r2]
	ldrb r0, [r2]
	ldr r1, [sp, 0x18]
	cmp r0, r1
	bcc _08117236
	b _08117258
_08117250:
	movs r0, 0x1
	str r0, [sp, 0x18]
	add r0, sp, 0x10
	strb r5, [r0]
_08117258:
	add r1, sp, 0x8
	movs r0, 0
	strb r0, [r1]
	adds r0, r1, 0
	ldrb r0, [r0]
	ldr r1, [sp, 0x18]
	cmp r0, r1
	bcs _08117360
	mov r0, sp
	adds r0, 0xE
	str r0, [sp, 0x1C]
	add r1, sp, 0x10
	mov r9, r1
	add r0, sp, 0x8
	mov r12, r0
	mov r1, sp
	adds r1, 0xA
	str r1, [sp, 0x20]
_0811727C:
	mov r1, r12
	ldrb r0, [r1]
	add r0, r9
	ldrb r1, [r0]
	lsls r0, r1, 2
	adds r0, r1
	lsls r0, 2
	ldr r1, _08117370 @ =gUnknown_083F8C00
	adds r0, r1
	ldrb r0, [r0, 0x6]
	ldr r1, [sp, 0x1C]
	strb r0, [r1]
	mov r1, r12
	ldrb r0, [r1]
	add r0, r9
	ldrb r1, [r0]
	lsls r0, r1, 2
	adds r0, r1
	lsls r0, 2
	ldr r1, _08117370 @ =gUnknown_083F8C00
	adds r0, r1
	ldrb r0, [r0, 0x3]
	ldr r1, [sp, 0x20]
	strh r0, [r1]
	mov r4, sp
	adds r4, 0x9
	movs r0, 0
	strb r0, [r4]
	ldrb r0, [r4]
	cmp r0, 0x2
	bhi _08117350
	add r5, sp, 0xC
	ldr r7, [sp, 0x20]
	ldr r0, _08117374 @ =gBG1TilemapBuffer
	mov r8, r0
	ldr r6, [sp, 0x1C]
	ldr r1, _08117378 @ =0x020189a0
	mov r10, r1
_081172C8:
	mov r1, r12
	ldrb r0, [r1]
	add r0, r9
	ldrb r0, [r0]
	lsls r1, r0, 2
	adds r1, r0
	lsls r1, 2
	ldr r0, _08117370 @ =gUnknown_083F8C00
	adds r1, r0
	adds r3, r4, 0
	ldrb r0, [r4]
	ldrb r1, [r1, 0x4]
	adds r0, r1
	lsls r0, 5
	strh r0, [r5]
	ldrh r0, [r7]
	ldrh r2, [r5]
	adds r2, r0
	lsls r2, 1
	add r2, r8
	ldrb r0, [r6]
	ldrb r1, [r4]
	adds r1, r0
	lsls r0, r1, 1
	adds r0, r1
	lsls r0, 1
	add r0, r10
	ldrh r0, [r0]
	strh r0, [r2]
	ldrh r0, [r7]
	ldrh r2, [r5]
	adds r2, r0
	adds r2, 0x1
	lsls r2, 1
	add r2, r8
	ldrb r0, [r6]
	ldrb r1, [r4]
	adds r1, r0
	lsls r0, r1, 1
	adds r0, r1
	lsls r0, 1
	mov r1, r10
	adds r1, 0x2
	adds r0, r1
	ldrh r0, [r0]
	strh r0, [r2]
	ldrh r0, [r7]
	ldrh r2, [r5]
	adds r2, r0
	adds r2, 0x2
	lsls r2, 1
	add r2, r8
	ldrb r0, [r6]
	ldrb r1, [r4]
	adds r1, r0
	lsls r0, r1, 1
	adds r0, r1
	lsls r0, 1
	ldr r1, _0811737C @ =0x020189a4
	adds r0, r1
	ldrh r0, [r0]
	strh r0, [r2]
	ldrb r0, [r4]
	adds r0, 0x1
	strb r0, [r4]
	ldrb r0, [r3]
	cmp r0, 0x2
	bls _081172C8
_08117350:
	mov r1, r12
	ldrb r0, [r1]
	adds r0, 0x1
	strb r0, [r1]
	ldrb r0, [r1]
	ldr r1, [sp, 0x18]
	cmp r0, r1
	bcc _0811727C
_08117360:
	add sp, 0x24
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_08117370: .4byte gUnknown_083F8C00
_08117374: .4byte gBG1TilemapBuffer
_08117378: .4byte 0x020189a0
_0811737C: .4byte 0x020189a4
	thumb_func_end sub_8117158

	thumb_func_start sub_8117380
sub_8117380: @ 8117380
	push {r4,lr}
	sub sp, 0x8
	lsls r0, 24
	lsrs r4, r0, 24
	ldr r1, _081173B8 @ =gUnknown_083F8EF4
	mov r0, sp
	movs r2, 0x5
	bl memcpy
	cmp r4, 0x13
	bls _08117398
	movs r4, 0
_08117398:
	ldr r3, _081173BC @ =gUnknown_083F8C00
	lsls r0, r4, 2
	adds r0, r4
	lsls r2, r0, 2
	adds r0, r2, r3
	ldrb r0, [r0, 0x1]
	lsls r0, 28
	lsrs r0, 28
	cmp r0, 0x4
	beq _081173EC
	cmp r0, 0x4
	bgt _081173C0
	cmp r0, 0x3
	beq _081173C6
	b _08117428
	.align 2, 0
_081173B8: .4byte gUnknown_083F8EF4
_081173BC: .4byte gUnknown_083F8C00
_081173C0:
	cmp r0, 0xC
	beq _0811740C
	b _08117428
_081173C6:
	adds r0, r4, 0
	movs r1, 0x5
	bl __udivsi3
	subs r0, 0x1
	lsls r0, 24
	lsrs r4, r0, 24
	ldr r0, _081173E8 @ =0x02019000
	adds r0, 0x16
	adds r1, r4, r0
	ldrb r0, [r1]
	cmp r0, 0x3
	bhi _08117428
	ldrb r0, [r1]
	adds r0, 0x1
	b _08117402
	.align 2, 0
_081173E8: .4byte 0x02019000
_081173EC:
	subs r0, r4, 0x1
	lsls r0, 24
	lsrs r4, r0, 24
	ldr r0, _08117408 @ =0x02019000
	adds r0, 0x12
	adds r1, r4, r0
	ldrb r0, [r1]
	cmp r0, 0x2
	bhi _08117428
	ldrb r0, [r1]
	adds r0, 0x2
_08117402:
	add r0, sp
	ldrb r0, [r0]
	b _0811742A
	.align 2, 0
_08117408: .4byte 0x02019000
_0811740C:
	ldr r1, _08117424 @ =0x02019000
	adds r0, r3, 0
	adds r0, 0x8
	adds r0, r2, r0
	ldr r1, [r1, 0x8]
	ldr r0, [r0]
	ands r1, r0
	cmp r1, 0
	bne _08117428
	mov r0, sp
	ldrb r0, [r0, 0x4]
	b _0811742A
	.align 2, 0
_08117424: .4byte 0x02019000
_08117428:
	movs r0, 0
_0811742A:
	add sp, 0x8
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end sub_8117380

	thumb_func_start sub_8117434
sub_8117434: @ 8117434
	push {r4-r6,lr}
	ldr r1, _081174AC @ =REG_BG2PA
	ldr r4, _081174B0 @ =0x02019000
	ldrh r0, [r4, 0x2C]
	strh r0, [r1]
	adds r1, 0x2
	ldrh r0, [r4, 0x2E]
	strh r0, [r1]
	adds r1, 0x2
	ldrh r0, [r4, 0x30]
	strh r0, [r1]
	adds r1, 0x2
	ldrh r0, [r4, 0x32]
	strh r0, [r1]
	movs r0, 0x2E
	ldrsh r2, [r4, r0]
	ldr r0, _081174B4 @ =gSpriteCoordOffsetY
	movs r3, 0
	ldrsh r1, [r0, r3]
	adds r1, 0x50
	adds r0, r2, 0
	muls r0, r1
	movs r2, 0xE8
	lsls r2, 7
	subs r2, r0
	movs r6, 0x2C
	ldrsh r5, [r4, r6]
	ldr r0, _081174B8 @ =gSpriteCoordOffsetX
	movs r6, 0
	ldrsh r3, [r0, r6]
	adds r3, 0x74
	adds r0, r5, 0
	muls r0, r3
	subs r2, r0
	movs r5, 0x32
	ldrsh r0, [r4, r5]
	muls r0, r1
	movs r1, 0xA8
	lsls r1, 7
	subs r1, r0
	movs r6, 0x30
	ldrsh r0, [r4, r6]
	muls r0, r3
	subs r1, r0
	ldr r0, _081174BC @ =REG_BG2X_L
	strh r2, [r0]
	adds r0, 0x2
	ldr r3, _081174C0 @ =0x0fff0000
	ands r2, r3
	asrs r2, 16
	strh r2, [r0]
	adds r0, 0x2
	strh r1, [r0]
	adds r0, 0x2
	ands r1, r3
	asrs r1, 16
	strh r1, [r0]
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_081174AC: .4byte REG_BG2PA
_081174B0: .4byte 0x02019000
_081174B4: .4byte gSpriteCoordOffsetY
_081174B8: .4byte gSpriteCoordOffsetX
_081174BC: .4byte REG_BG2X_L
_081174C0: .4byte 0x0fff0000
	thumb_func_end sub_8117434

	thumb_func_start sub_81174C4
sub_81174C4: @ 81174C4
	push {lr}
	lsls r0, 16
	asrs r0, 16
	lsls r1, 16
	asrs r1, 16
	muls r0, r1
	adds r1, r0, 0
	cmp r0, 0
	bge _081174D8
	adds r1, 0xFF
_081174D8:
	lsls r0, r1, 8
	asrs r0, 16
	pop {r1}
	bx r1
	thumb_func_end sub_81174C4

	thumb_func_start sub_81174E0
sub_81174E0: @ 81174E0
	push {lr}
	adds r1, r0, 0
	movs r0, 0x80
	lsls r0, 9
	lsls r1, 16
	asrs r1, 16
	bl __divsi3
	lsls r0, 16
	asrs r0, 16
	pop {r1}
	bx r1
	thumb_func_end sub_81174E0

	thumb_func_start sub_81174F8
sub_81174F8: @ 81174F8
	push {r4,lr}
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	movs r0, 0x14
	movs r1, 0x8
	movs r2, 0x1
	bl DisplayYesNoMenu
	ldr r0, _08117520 @ =0x00002d9e
	bl sub_814AAF8
	ldr r1, _08117524 @ =gUnknown_083F8EB4
	adds r0, r4, 0
	bl sub_80F914C
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08117520: .4byte 0x00002d9e
_08117524: .4byte gUnknown_083F8EB4
	thumb_func_end sub_81174F8

	thumb_func_start sub_8117528
sub_8117528: @ 8117528
	push {r4,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	ldr r0, _08117554 @ =gPaletteFade
	ldrb r1, [r0, 0x7]
	movs r0, 0x80
	ands r0, r1
	cmp r0, 0
	bne _0811754C
	movs r0, 0
	bl SetVBlankCallback
	ldr r0, _08117558 @ =sub_8115384
	bl SetMainCallback2
	adds r0, r4, 0
	bl DestroyTask
_0811754C:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08117554: .4byte gPaletteFade
_08117558: .4byte sub_8115384
	thumb_func_end sub_8117528

	thumb_func_start sub_811755C
sub_811755C: @ 811755C
	push {r4,lr}
	sub sp, 0x4
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	movs r0, 0x14
	movs r1, 0x8
	movs r2, 0x1A
	movs r3, 0xD
	bl MenuZeroFillWindowRect
	bl MenuZeroFillScreen
	movs r0, 0x1
	negs r0, r0
	movs r1, 0
	str r1, [sp]
	movs r2, 0
	movs r3, 0x10
	bl BeginNormalPaletteFade
	ldr r2, _081175B4 @ =gPaletteFade
	ldrb r1, [r2, 0x8]
	lsls r1, 26
	lsrs r1, 26
	ldrb r3, [r2, 0x4]
	movs r0, 0x40
	negs r0, r0
	ands r0, r3
	orrs r0, r1
	strb r0, [r2, 0x4]
	bl UpdatePaletteFade
	ldr r1, _081175B8 @ =gTasks
	lsls r0, r4, 2
	adds r0, r4
	lsls r0, 3
	adds r0, r1
	ldr r1, _081175BC @ =sub_8117528
	str r1, [r0]
	add sp, 0x4
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_081175B4: .4byte gPaletteFade
_081175B8: .4byte gTasks
_081175BC: .4byte sub_8117528
	thumb_func_end sub_811755C

	thumb_func_start sub_81175C0
sub_81175C0: @ 81175C0
	push {r4,lr}
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	bl MenuZeroFillScreen
	bl ScriptContext2_Disable
	adds r0, r4, 0
	bl DestroyTask
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end sub_81175C0

	thumb_func_start sub_81175DC
sub_81175DC: @ 81175DC
	push {r4,lr}
	lsls r0, 24
	lsrs r0, 24
	adds r4, r0, 0
	ldr r1, _08117624 @ =gTasks
	lsls r0, r4, 2
	adds r0, r4
	lsls r0, 3
	adds r0, r1
	ldrh r1, [r0, 0x8]
	adds r2, r1, 0x1
	strh r2, [r0, 0x8]
	ldr r0, _08117628 @ =gMain
	ldrh r1, [r0, 0x2E]
	movs r0, 0x3
	ands r0, r1
	cmp r0, 0
	bne _08117608
	lsls r0, r2, 16
	asrs r0, 16
	cmp r0, 0x3C
	ble _0811761C
_08117608:
	ldr r1, _0811762C @ =gUnknown_0202E8CC
	movs r0, 0x1
	strh r0, [r1]
	bl MenuZeroFillScreen
	bl ScriptContext2_Disable
	adds r0, r4, 0
	bl DestroyTask
_0811761C:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08117624: .4byte gTasks
_08117628: .4byte gMain
_0811762C: .4byte gUnknown_0202E8CC
	thumb_func_end sub_81175DC

	thumb_func_start sub_8117630
sub_8117630: @ 8117630
	push {r4,r5,lr}
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	ldr r2, _0811768C @ =gUnknown_083F8DF0
	ldr r0, _08117690 @ =gUnknown_0202E8CC
	ldrh r1, [r0]
	movs r0, 0x1
	ands r0, r1
	lsrs r1, 7
	lsls r1, 1
	adds r0, r1
	adds r0, r2
	ldrb r1, [r0]
	ldr r0, _08117694 @ =gStringVar1
	movs r2, 0x2
	movs r3, 0x1
	bl ConvertIntToDecimalStringN
	ldr r5, _08117698 @ =gStringVar4
	ldr r1, _0811769C @ =gUnknown_081C40DF
	adds r0, r5, 0
	bl StringExpandPlaceholders
	movs r0, 0
	movs r1, 0xE
	movs r2, 0x1D
	movs r3, 0x13
	bl MenuDrawTextWindow
	adds r0, r5, 0
	movs r1, 0x1
	movs r2, 0xF
	bl MenuPrint
	ldr r1, _081176A0 @ =gTasks
	lsls r0, r4, 2
	adds r0, r4
	lsls r0, 3
	adds r0, r1
	ldr r1, _081176A4 @ =sub_81174F8
	str r1, [r0]
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_0811768C: .4byte gUnknown_083F8DF0
_08117690: .4byte gUnknown_0202E8CC
_08117694: .4byte gStringVar1
_08117698: .4byte gStringVar4
_0811769C: .4byte gUnknown_081C40DF
_081176A0: .4byte gTasks
_081176A4: .4byte sub_81174F8
	thumb_func_end sub_8117630

	thumb_func_start Task_Roulette_0
Task_Roulette_0: @ 81176A8
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	lsls r0, 24
	lsrs r7, r0, 24
	ldr r0, _08117758 @ =gStringVar1
	mov r10, r0
	ldr r1, _0811775C @ =gTasks
	lsls r0, r7, 2
	adds r0, r7
	lsls r0, 3
	adds r6, r0, r1
	movs r0, 0x22
	ldrsh r1, [r6, r0]
	mov r0, r10
	movs r2, 0x1
	movs r3, 0x4
	bl ConvertIntToDecimalStringN
	ldr r5, _08117760 @ =gStringVar4
	ldr r1, _08117764 @ =gOtherText_Coins
	adds r0, r5, 0
	bl StringExpandPlaceholders
	movs r0, 0
	movs r1, 0
	movs r2, 0x9
	movs r3, 0x3
	bl MenuDrawTextWindow
	adds r0, r5, 0
	movs r1, 0x9
	movs r2, 0x1
	bl MenuPrint_RightAligned
	ldr r2, _08117768 @ =gUnknown_083F8DF0
	ldr r1, _0811776C @ =gUnknown_0202E8CC
	mov r8, r1
	ldrh r1, [r1]
	movs r0, 0x1
	mov r9, r0
	ands r0, r1
	lsrs r1, 7
	lsls r1, 1
	adds r0, r1
	adds r0, r2
	ldrb r4, [r0]
	mov r0, r10
	adds r1, r4, 0
	movs r2, 0x2
	movs r3, 0x1
	bl ConvertIntToDecimalStringN
	movs r1, 0x22
	ldrsh r0, [r6, r1]
	cmp r0, r4
	blt _081177BC
	mov r0, r8
	ldrh r1, [r0]
	movs r0, 0x80
	ands r0, r1
	cmp r0, 0
	beq _0811777C
	mov r0, r9
	ands r0, r1
	cmp r0, 0
	beq _0811777C
	movs r0, 0
	movs r1, 0xE
	movs r2, 0x1D
	movs r3, 0x13
	bl MenuDrawTextWindow
	ldr r0, _08117770 @ =gUnknown_081C4139
	movs r1, 0x1
	movs r2, 0xF
	bl MenuPrint
	ldr r1, _08117774 @ =sub_8117630
	ldr r2, _08117778 @ =0x0000ffff
	adds r0, r7, 0
	movs r3, 0x3
	bl sub_8116C34
	b _081177E4
	.align 2, 0
_08117758: .4byte gStringVar1
_0811775C: .4byte gTasks
_08117760: .4byte gStringVar4
_08117764: .4byte gOtherText_Coins
_08117768: .4byte gUnknown_083F8DF0
_0811776C: .4byte gUnknown_0202E8CC
_08117770: .4byte gUnknown_081C4139
_08117774: .4byte sub_8117630
_08117778: .4byte 0x0000ffff
_0811777C:
	ldr r4, _081177AC @ =gStringVar4
	ldr r1, _081177B0 @ =gUnknown_081C40DF
	adds r0, r4, 0
	bl StringExpandPlaceholders
	movs r0, 0
	movs r1, 0xE
	movs r2, 0x1D
	movs r3, 0x13
	bl MenuDrawTextWindow
	adds r0, r4, 0
	movs r1, 0x1
	movs r2, 0xF
	bl MenuPrint
	ldr r1, _081177B4 @ =gTasks
	lsls r0, r7, 2
	adds r0, r7
	lsls r0, 3
	adds r0, r1
	ldr r1, _081177B8 @ =sub_81174F8
	str r1, [r0]
	b _081177E4
	.align 2, 0
_081177AC: .4byte gStringVar4
_081177B0: .4byte gUnknown_081C40DF
_081177B4: .4byte gTasks
_081177B8: .4byte sub_81174F8
_081177BC:
	ldr r1, _081177F4 @ =gUnknown_081C411C
	adds r0, r5, 0
	bl StringExpandPlaceholders
	movs r0, 0
	movs r1, 0xE
	movs r2, 0x1D
	movs r3, 0x13
	bl MenuDrawTextWindow
	adds r0, r5, 0
	movs r1, 0x1
	movs r2, 0xF
	bl MenuPrint
	ldr r0, _081177F8 @ =sub_81175DC
	str r0, [r6]
	movs r0, 0
	strh r0, [r6, 0x22]
	strh r0, [r6, 0x8]
_081177E4:
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_081177F4: .4byte gUnknown_081C411C
_081177F8: .4byte sub_81175DC
	thumb_func_end Task_Roulette_0

	thumb_func_start PlayRoulette
PlayRoulette: @ 81177FC
	push {lr}
	bl ScriptContext2_Enable
	ldr r0, _08117828 @ =sub_81176A8
	movs r1, 0
	bl CreateTask
	lsls r0, 24
	lsrs r0, 24
	ldr r2, _0811782C @ =gTasks
	lsls r1, r0, 2
	adds r1, r0
	lsls r1, 3
	adds r1, r2
	ldr r0, _08117830 @ =gSaveBlock1
	ldr r2, _08117834 @ =0x00000494
	adds r0, r2
	ldrh r0, [r0]
	strh r0, [r1, 0x22]
	pop {r0}
	bx r0
	.align 2, 0
_08117828: .4byte Task_Roulette_0
_0811782C: .4byte gTasks
_08117830: .4byte gSaveBlock1
_08117834: .4byte 0x00000494
	thumb_func_end PlayRoulette

	thumb_func_start sub_8117838
sub_8117838: @ 8117838
	push {r4,lr}
	lsls r0, 24
	cmp r0, 0
	bne _08117884
	bl FreeAllSpritePalettes
	ldr r0, _08117870 @ =gUnknown_083F9E30
	bl LoadSpritePalettes
	ldr r0, _08117874 @ =gUnknown_083F92A8
	ldr r4, _08117878 @ =0x02017000
	adds r1, r4, 0
	bl LZ77UnCompWram
	ldr r0, _0811787C @ =gUnknown_083F90FC
	movs r2, 0xE0
	lsls r2, 4
	adds r1, r4, r2
	bl LZ77UnCompWram
	ldr r0, _08117880 @ =gUnknown_083F9D3C
	movs r1, 0x80
	lsls r1, 5
	adds r4, r1
	adds r1, r4, 0
	bl LZ77UnCompWram
	b _08117888
	.align 2, 0
_08117870: .4byte gUnknown_083F9E30
_08117874: .4byte gUnknown_083F92A8
_08117878: .4byte 0x02017000
_0811787C: .4byte gUnknown_083F90FC
_08117880: .4byte gUnknown_083F9D3C
_08117884:
	bl FreeAllSpritePalettes
_08117888:
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end sub_8117838

	thumb_func_start sub_8117890
sub_8117890: @ 8117890
	push {r4-r6,lr}
	adds r4, r1, 0
	adds r6, r2, 0
	lsls r4, 24
	lsrs r4, 24
	ldr r1, [r0, 0x4]
	ldrb r3, [r1]
	movs r1, 0x74
	movs r2, 0x50
	bl CreateSprite
	lsls r0, 24
	lsrs r0, 24
	adds r5, r0, 0
	ldr r0, _081178F4 @ =gSprites
	lsls r1, r5, 4
	adds r1, r5
	lsls r1, 2
	adds r1, r0
	ldrh r0, [r6]
	strh r0, [r1, 0x2E]
	strh r4, [r1, 0x30]
	adds r3, r1, 0
	adds r3, 0x3E
	ldrb r0, [r3]
	movs r2, 0x2
	orrs r0, r2
	strb r0, [r3]
	adds r1, 0x2C
	ldrb r0, [r1]
	movs r2, 0x40
	orrs r0, r2
	movs r2, 0x80
	orrs r0, r2
	strb r0, [r1]
	ldrh r2, [r6]
	adds r0, r2, 0
	adds r0, 0x1E
	strh r0, [r6]
	lsls r0, 16
	ldr r1, _081178F8 @ =0x01670000
	cmp r0, r1
	bls _081178EC
	ldr r1, _081178FC @ =0xfffffeb6
	adds r0, r2, r1
	strh r0, [r6]
_081178EC:
	adds r0, r5, 0
	pop {r4-r6}
	pop {r1}
	bx r1
	.align 2, 0
_081178F4: .4byte gSprites
_081178F8: .4byte 0x01670000
_081178FC: .4byte 0xfffffeb6
	thumb_func_end sub_8117890

	thumb_func_start sub_8117900
sub_8117900: @ 8117900
	push {r4-r7,lr}
	mov r7, r9
	mov r6, r8
	push {r6,r7}
	sub sp, 0x8
	ldr r4, _08117A50 @ =gUnknown_083F9F54
	ldr r0, [r4]
	ldr r5, _08117A54 @ =0x02000000
	adds r1, r5, 0
	bl LZ77UnCompWram
	str r5, [sp]
	mov r6, sp
	ldrh r1, [r4, 0x6]
	lsls r1, 16
	ldrh r0, [r4, 0x4]
	orrs r0, r1
	str r0, [sp, 0x4]
	mov r0, sp
	bl LoadSpriteSheet
	ldr r4, _08117A58 @ =gUnknown_083F9F5C
	ldr r0, [r4]
	adds r1, r5, 0
	bl LZ77UnCompWram
	str r5, [sp]
	ldrh r0, [r4, 0x4]
	strh r0, [r6, 0x4]
	ldrh r0, [r4, 0x6]
	strh r0, [r6, 0x6]
	mov r0, sp
	bl LoadSpriteSheet
	movs r7, 0
	ldr r0, _08117A5C @ =0x0001903c
	adds r0, r5
	mov r9, r0
	ldr r0, _08117A60 @ =gSprites
	mov r8, r0
_08117950:
	lsls r0, r7, 1
	adds r0, r7
	lsls r0, 27
	lsrs r4, r0, 24
	movs r6, 0
	lsls r5, r7, 2
_0811795C:
	lsls r1, r6, 1
	adds r1, r6
	lsls r1, 3
	ldr r0, _08117A64 @ =gSpriteTemplate_83FA07C
	adds r0, r1, r0
	adds r1, 0x94
	adds r2, r4, 0
	adds r2, 0x5C
	movs r3, 0x1E
	bl CreateSprite
	adds r1, r6, 0
	adds r1, 0x1D
	adds r1, r5, r1
	add r1, r9
	strb r0, [r1]
	lsls r0, 24
	lsrs r1, r0, 24
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	add r0, r8
	adds r0, 0x2C
	ldrb r1, [r0]
	movs r2, 0x40
	orrs r1, r2
	strb r1, [r0]
	adds r0, r4, 0
	adds r0, 0x18
	lsls r0, 24
	lsrs r4, r0, 24
	cmp r4, 0x47
	bls _081179A0
	movs r4, 0
_081179A0:
	adds r0, r6, 0x1
	lsls r0, 24
	lsrs r6, r0, 24
	cmp r6, 0x3
	bls _0811795C
	adds r0, r7, 0x1
	lsls r0, 24
	lsrs r7, r0, 24
	cmp r7, 0x2
	bls _08117950
	movs r7, 0
	ldr r5, _08117A68 @ =0x0201903c
	ldr r4, _08117A60 @ =gSprites
_081179BA:
	lsls r1, r7, 1
	adds r1, r7
	lsls r1, 3
	ldr r0, _08117A6C @ =gSpriteTemplate_83F9FD4
	adds r0, r1, r0
	adds r1, 0x94
	lsls r1, 16
	asrs r1, 16
	movs r2, 0x46
	movs r3, 0x1E
	bl CreateSprite
	adds r1, r7, 0
	adds r1, 0x29
	adds r1, r5
	strb r0, [r1]
	lsls r0, 24
	lsrs r1, r0, 24
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r4
	adds r0, 0x2C
	ldrb r1, [r0]
	movs r2, 0x40
	orrs r1, r2
	strb r1, [r0]
	adds r0, r7, 0x1
	lsls r0, 24
	lsrs r7, r0, 24
	cmp r7, 0x3
	bls _081179BA
	movs r7, 0
	ldr r5, _08117A68 @ =0x0201903c
	ldr r4, _08117A60 @ =gSprites
_08117A00:
	lsls r2, r7, 1
	adds r2, r7
	lsls r2, 3
	ldr r0, _08117A70 @ =gSpriteTemplate_83FA034
	adds r0, r2, r0
	adds r2, 0x5C
	lsls r2, 16
	asrs r2, 16
	movs r1, 0x7E
	movs r3, 0x1E
	bl CreateSprite
	adds r1, r7, 0
	adds r1, 0x2D
	adds r1, r5
	strb r0, [r1]
	lsls r0, 24
	lsrs r1, r0, 24
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r4
	adds r0, 0x2C
	ldrb r1, [r0]
	movs r2, 0x40
	orrs r1, r2
	strb r1, [r0]
	adds r0, r7, 0x1
	lsls r0, 24
	lsrs r7, r0, 24
	cmp r7, 0x2
	bls _08117A00
	add sp, 0x8
	pop {r3,r4}
	mov r8, r3
	mov r9, r4
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_08117A50: .4byte gUnknown_083F9F54
_08117A54: .4byte 0x02000000
_08117A58: .4byte gUnknown_083F9F5C
_08117A5C: .4byte 0x0001903c
_08117A60: .4byte gSprites
_08117A64: .4byte gSpriteTemplate_83FA07C
_08117A68: .4byte 0x0201903c
_08117A6C: .4byte gSpriteTemplate_83F9FD4
_08117A70: .4byte gSpriteTemplate_83FA034
	thumb_func_end sub_8117900

	thumb_func_start unref_sub_8117A74
unref_sub_8117A74: @ 8117A74
	push {r4,r5,lr}
	movs r4, 0
	ldr r5, _08117AA0 @ =0x0201903c
_08117A7A:
	adds r0, r4, 0
	adds r0, 0x1D
	adds r0, r5
	ldrb r1, [r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	ldr r1, _08117AA4 @ =gSprites
	adds r0, r1
	bl DestroySprite
	adds r0, r4, 0x1
	lsls r0, 24
	lsrs r4, r0, 24
	cmp r4, 0xB
	bls _08117A7A
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_08117AA0: .4byte 0x0201903c
_08117AA4: .4byte gSprites
	thumb_func_end unref_sub_8117A74

	thumb_func_start sub_8117AA8
sub_8117AA8: @ 8117AA8
	push {r4-r7,lr}
	mov r7, r9
	mov r6, r8
	push {r6,r7}
	lsls r0, 24
	lsrs r0, 24
	lsls r1, 24
	lsrs r1, 24
	mov r8, r1
	cmp r0, 0
	beq _08117AF8
	cmp r0, 0x1
	bne _08117BA8
	movs r3, 0
	ldr r5, _08117AF0 @ =gSprites
	ldr r4, _08117AF4 @ =0x0201903c
	movs r2, 0x4
_08117ACA:
	adds r0, r3, 0
	adds r0, 0x1D
	adds r0, r4
	ldrb r1, [r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r5
	adds r0, 0x3E
	ldrb r1, [r0]
	orrs r1, r2
	strb r1, [r0]
	adds r0, r3, 0x1
	lsls r0, 24
	lsrs r3, r0, 24
	cmp r3, 0x12
	bls _08117ACA
	b _08117BA8
	.align 2, 0
_08117AF0: .4byte gSprites
_08117AF4: .4byte 0x0201903c
_08117AF8:
	movs r3, 0
	ldr r0, _08117B48 @ =gUnknown_083F8D90
	mov r12, r0
	ldr r7, _08117B4C @ =0x02019000
	movs r1, 0x4
	add r1, r12
	mov r9, r1
	ldr r5, _08117B50 @ =gSprites
	adds r4, r7, 0
	adds r4, 0x3C
	movs r6, 0x5
	negs r6, r6
_08117B10:
	lsls r2, r3, 3
	mov r1, r9
	adds r0, r2, r1
	ldr r1, [r7, 0x8]
	ldr r0, [r0]
	ands r1, r0
	cmp r1, 0
	beq _08117B54
	mov r1, r12
	adds r0, r2, r1
	ldrb r0, [r0, 0x2]
	cmp r0, r8
	beq _08117B54
	adds r0, r3, 0
	adds r0, 0x1D
	adds r0, r4
	ldrb r1, [r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r5
	adds r0, 0x3E
	ldrb r1, [r0]
	movs r2, 0x4
	orrs r1, r2
	strb r1, [r0]
	b _08117B6E
	.align 2, 0
_08117B48: .4byte gUnknown_083F8D90
_08117B4C: .4byte 0x02019000
_08117B50: .4byte gSprites
_08117B54:
	adds r0, r3, 0
	adds r0, 0x1D
	adds r0, r4
	ldrb r0, [r0]
	lsls r1, r0, 4
	adds r1, r0
	lsls r1, 2
	adds r1, r5
	adds r1, 0x3E
	ldrb r2, [r1]
	adds r0, r6, 0
	ands r0, r2
	strb r0, [r1]
_08117B6E:
	adds r0, r3, 0x1
	lsls r0, 24
	lsrs r3, r0, 24
	cmp r3, 0xB
	bls _08117B10
	cmp r3, 0x12
	bhi _08117BA8
	ldr r6, _08117BB4 @ =gSprites
	ldr r4, _08117BB8 @ =0x0201903c
	movs r5, 0x5
	negs r5, r5
_08117B84:
	adds r0, r3, 0
	adds r0, 0x1D
	adds r0, r4
	ldrb r0, [r0]
	lsls r1, r0, 4
	adds r1, r0
	lsls r1, 2
	adds r1, r6
	adds r1, 0x3E
	ldrb r2, [r1]
	adds r0, r5, 0
	ands r0, r2
	strb r0, [r1]
	adds r0, r3, 0x1
	lsls r0, 24
	lsrs r3, r0, 24
	cmp r3, 0x12
	bls _08117B84
_08117BA8:
	pop {r3,r4}
	mov r8, r3
	mov r9, r4
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_08117BB4: .4byte gSprites
_08117BB8: .4byte 0x0201903c
	thumb_func_end sub_8117AA8

	thumb_func_start sub_8117BBC
sub_8117BBC: @ 8117BBC
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	movs r5, 0
	ldr r0, _08117C50 @ =0x0201903c
	mov r8, r0
	ldr r4, _08117C54 @ =gSprites
	movs r6, 0x4
_08117BCC:
	ldr r0, _08117C58 @ =gSpriteTemplate_83FA40C
	movs r1, 0x74
	movs r2, 0x14
	movs r3, 0xA
	bl CreateSprite
	adds r3, r5, 0
	adds r3, 0x31
	add r3, r8
	strb r0, [r3]
	ldrb r1, [r3]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r4
	adds r0, 0x3E
	ldrb r1, [r0]
	orrs r1, r6
	strb r1, [r0]
	ldrb r1, [r3]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r4
	movs r1, 0x1
	strh r1, [r0, 0x2E]
	ldrb r1, [r3]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r1, r4, 0
	adds r1, 0x1C
	adds r0, r1
	ldr r1, _08117C5C @ =sub_81184CC
	str r1, [r0]
	ldrb r1, [r3]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r4
	ldrb r1, [r0, 0x5]
	movs r7, 0xD
	negs r7, r7
	adds r2, r7, 0
	ands r1, r2
	orrs r1, r6
	strb r1, [r0, 0x5]
	ldrb r1, [r3]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r4
	movs r1, 0x8
	bl StartSpriteAnim
	adds r0, r5, 0x1
	lsls r0, 24
	lsrs r5, r0, 24
	cmp r5, 0x5
	bls _08117BCC
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_08117C50: .4byte 0x0201903c
_08117C54: .4byte gSprites
_08117C58: .4byte gSpriteTemplate_83FA40C
_08117C5C: .4byte sub_81184CC
	thumb_func_end sub_8117BBC

	thumb_func_start sub_8117C60
sub_8117C60: @ 8117C60
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	lsls r0, 24
	lsls r1, 24
	lsrs r1, 24
	mov r9, r1
	movs r5, 0
	cmp r0, 0
	beq _08117CAC
	ldr r4, _08117CA4 @ =gSprites
	ldr r3, _08117CA8 @ =0x0201903c
	movs r2, 0x4
_08117C7E:
	adds r0, r5, 0
	adds r0, 0x31
	adds r0, r3
	ldrb r1, [r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r4
	adds r0, 0x3E
	ldrb r1, [r0]
	orrs r1, r2
	strb r1, [r0]
	adds r0, r5, 0x1
	lsls r0, 24
	lsrs r5, r0, 24
	cmp r5, 0x5
	bls _08117C7E
	b _08117D58
	.align 2, 0
_08117CA4: .4byte gSprites
_08117CA8: .4byte 0x0201903c
_08117CAC:
	ldr r0, _08117CEC @ =0x02019000
	mov r12, r0
	ldr r6, _08117CF0 @ =gSprites
	movs r0, 0x3C
	add r0, r12
	mov r8, r0
	ldr r7, _08117CF4 @ =gUnknown_083F8C00
	movs r0, 0x5
	negs r0, r0
	mov r10, r0
_08117CC0:
	mov r0, r12
	adds r0, 0xC
	adds r4, r5, r0
	ldrb r0, [r4]
	cmp r0, 0
	beq _08117CD0
	cmp r5, r9
	bne _08117CF8
_08117CD0:
	adds r0, r5, 0
	adds r0, 0x31
	add r0, r8
	ldrb r1, [r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r6
	adds r0, 0x3E
	ldrb r1, [r0]
	movs r2, 0x4
	orrs r1, r2
	strb r1, [r0]
	b _08117D4E
	.align 2, 0
_08117CEC: .4byte 0x02019000
_08117CF0: .4byte gSprites
_08117CF4: .4byte gUnknown_083F8C00
_08117CF8:
	adds r3, r5, 0
	adds r3, 0x31
	add r3, r8
	ldrb r0, [r3]
	lsls r1, r0, 4
	adds r1, r0
	lsls r1, 2
	adds r1, r6
	adds r1, 0x3E
	ldrb r2, [r1]
	mov r0, r10
	ands r0, r2
	strb r0, [r1]
	ldrb r0, [r3]
	lsls r2, r0, 4
	adds r2, r0
	lsls r2, 2
	adds r2, r6
	ldrb r1, [r4]
	lsls r0, r1, 2
	adds r0, r1
	lsls r0, 2
	adds r0, r7
	ldrb r0, [r0, 0x3]
	adds r0, 0x1
	lsls r0, 3
	adds r0, 0x4
	strh r0, [r2, 0x20]
	ldrb r0, [r3]
	lsls r2, r0, 4
	adds r2, r0
	lsls r2, 2
	adds r2, r6
	ldrb r1, [r4]
	lsls r0, r1, 2
	adds r0, r1
	lsls r0, 2
	adds r0, r7
	ldrb r0, [r0, 0x4]
	adds r0, 0x1
	lsls r0, 3
	adds r0, 0x3
	strh r0, [r2, 0x22]
_08117D4E:
	adds r0, r5, 0x1
	lsls r0, 24
	lsrs r5, r0, 24
	cmp r5, 0x5
	bls _08117CC0
_08117D58:
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	thumb_func_end sub_8117C60

	thumb_func_start sub_8117D68
sub_8117D68: @ 8117D68
	push {r4,r5,lr}
	lsls r0, 24
	lsrs r5, r0, 24
	cmp r5, 0
	bne _08117D98
	ldr r2, _08117D90 @ =gSprites
	ldr r0, _08117D94 @ =0x02019000
	adds r0, 0x6C
	ldrb r1, [r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r2
	adds r0, 0x3E
	ldrb r1, [r0]
	movs r2, 0x4
	orrs r1, r2
	strb r1, [r0]
	b _08117DE2
	.align 2, 0
_08117D90: .4byte gSprites
_08117D94: .4byte 0x02019000
_08117D98:
	ldr r4, _08117DE8 @ =gSprites
	ldr r3, _08117DEC @ =0x02019000
	adds r3, 0x6C
	ldrb r1, [r3]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r4
	adds r0, 0x3E
	ldrb r2, [r0]
	movs r1, 0x5
	negs r1, r1
	ands r1, r2
	strb r1, [r0]
	ldrb r0, [r3]
	lsls r1, r0, 4
	adds r1, r0
	lsls r1, 2
	adds r1, r4
	ldr r0, _08117DF0 @ =gUnknown_083F8C00
	lsls r2, r5, 2
	adds r2, r5
	lsls r2, 2
	adds r2, r0
	ldrb r0, [r2, 0x3]
	adds r0, 0x2
	lsls r0, 3
	strh r0, [r1, 0x20]
	ldrb r0, [r3]
	lsls r1, r0, 4
	adds r1, r0
	lsls r1, 2
	adds r1, r4
	ldrb r0, [r2, 0x4]
	adds r0, 0x2
	lsls r0, 3
	strh r0, [r1, 0x22]
_08117DE2:
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_08117DE8: .4byte gSprites
_08117DEC: .4byte 0x02019000
_08117DF0: .4byte gUnknown_083F8C00
	thumb_func_end sub_8117D68

	thumb_func_start sub_8117DF4
sub_8117DF4: @ 8117DF4
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	sub sp, 0xC
	ldr r4, _08117E84 @ =gUnknown_083F9EE8
	ldr r0, [r4]
	ldr r5, _08117E88 @ =0x02000000
	adds r1, r5, 0
	bl LZ77UnCompWram
	str r5, [sp, 0x4]
	add r0, sp, 0x4
	ldrh r2, [r4, 0x6]
	lsls r2, 16
	ldrh r1, [r4, 0x4]
	orrs r1, r2
	str r1, [r0, 0x4]
	bl LoadSpriteSheet
	movs r1, 0xF
	mov r0, sp
	strh r1, [r0]
	movs r0, 0
	ldr r1, _08117E8C @ =0x0001903c
	adds r1, r5
	mov r8, r1
	ldr r7, _08117E90 @ =gSprites
_08117E2A:
	movs r4, 0
	adds r6, r0, 0x1
	lsls r5, r0, 2
_08117E30:
	adds r1, r5, r4
	lsls r0, r1, 1
	adds r0, r1
	lsls r0, 3
	ldr r1, _08117E94 @ =gSpriteTemplate_83FA0DC
	adds r0, r1
	movs r1, 0x28
	mov r2, sp
	bl sub_8117890
	adds r1, r4, 0x7
	adds r1, r5, r1
	add r1, r8
	strb r0, [r1]
	lsls r0, 24
	lsrs r0, 24
	lsls r1, r0, 4
	adds r1, r0
	lsls r1, 2
	adds r1, r7
	adds r1, 0x2C
	ldrb r0, [r1]
	movs r2, 0x40
	orrs r0, r2
	movs r2, 0x80
	orrs r0, r2
	strb r0, [r1]
	adds r0, r4, 0x1
	lsls r0, 24
	lsrs r4, r0, 24
	cmp r4, 0x3
	bls _08117E30
	lsls r0, r6, 24
	lsrs r0, 24
	cmp r0, 0x2
	bls _08117E2A
	add sp, 0xC
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_08117E84: .4byte gUnknown_083F9EE8
_08117E88: .4byte 0x02000000
_08117E8C: .4byte 0x0001903c
_08117E90: .4byte gSprites
_08117E94: .4byte gSpriteTemplate_83FA0DC
	thumb_func_end sub_8117DF4

	thumb_func_start sub_8117E98
sub_8117E98: @ 8117E98
	push {r4-r6,lr}
	adds r6, r0, 0
	ldr r0, _08117F1C @ =0x02019000
	ldrh r1, [r6, 0x2E]
	ldrh r0, [r0, 0x24]
	adds r1, r0
	lsls r1, 16
	lsrs r4, r1, 16
	asrs r1, 16
	ldr r0, _08117F20 @ =0x00000167
	cmp r1, r0
	ble _08117EB8
	ldr r2, _08117F24 @ =0xfffffe98
	adds r0, r1, r2
	lsls r0, 16
	lsrs r4, r0, 16
_08117EB8:
	adds r0, r4, 0
	bl Sin2
	lsls r0, 16
	lsrs r5, r0, 16
	adds r0, r4, 0
	bl Cos2
	lsls r2, r5, 16
	asrs r2, 16
	movs r3, 0x30
	ldrsh r1, [r6, r3]
	muls r1, r2
	asrs r1, 12
	strh r1, [r6, 0x24]
	lsls r0, 16
	asrs r4, r0, 16
	negs r1, r4
	movs r3, 0x30
	ldrsh r0, [r6, r3]
	muls r0, r1
	asrs r0, 12
	strh r0, [r6, 0x26]
	ldrb r0, [r6, 0x3]
	lsls r0, 26
	lsrs r3, r0, 27
	cmp r2, 0
	bge _08117EF2
	adds r2, 0xF
_08117EF2:
	lsls r0, r2, 12
	lsrs r5, r0, 16
	ldr r1, _08117F28 @ =gOamMatrices
	lsls r0, r3, 3
	adds r1, r0, r1
	adds r0, r4, 0
	cmp r0, 0
	bge _08117F04
	adds r0, 0xF
_08117F04:
	asrs r0, 4
	strh r0, [r1, 0x6]
	strh r0, [r1]
	strh r5, [r1, 0x2]
	lsls r0, r5, 16
	asrs r0, 16
	negs r0, r0
	strh r0, [r1, 0x4]
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_08117F1C: .4byte 0x02019000
_08117F20: .4byte 0x00000167
_08117F24: .4byte 0xfffffe98
_08117F28: .4byte gOamMatrices
	thumb_func_end sub_8117E98

	thumb_func_start sub_8117F2C
sub_8117F2C: @ 8117F2C
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	sub sp, 0x8
	movs r5, 0
	ldr r7, _081180C8 @ =0x02000000
	mov r6, sp
_08117F3A:
	ldr r0, _081180CC @ =gUnknown_083FA21C
	lsls r4, r5, 3
	adds r4, r0
	ldr r0, [r4]
	adds r1, r7, 0
	bl LZ77UnCompWram
	str r7, [sp]
	ldrh r2, [r4, 0x4]
	ldr r0, _081180D0 @ =0xffff0000
	ldr r1, [r6, 0x4]
	ands r1, r0
	orrs r1, r2
	str r1, [r6, 0x4]
	ldrh r2, [r4, 0x6]
	lsls r2, 16
	ldr r0, _081180D4 @ =0x0000ffff
	ands r0, r1
	orrs r0, r2
	str r0, [r6, 0x4]
	mov r0, sp
	bl LoadSpriteSheet
	adds r0, r5, 0x1
	lsls r0, 24
	lsrs r5, r0, 24
	cmp r5, 0x4
	bls _08117F3A
	ldr r0, _081180D8 @ =gSpriteTemplate_83FA2B0
	movs r1, 0xD0
	movs r2, 0x10
	movs r3, 0x4
	bl CreateSprite
	ldr r4, _081180DC @ =0x02019000
	adds r1, r4, 0
	adds r1, 0x50
	strb r0, [r1]
	ldr r3, _081180E0 @ =gSprites
	ldrb r1, [r1]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r3
	adds r0, 0x2C
	ldrb r1, [r0]
	movs r2, 0x40
	orrs r1, r2
	strb r1, [r0]
	movs r5, 0
	adds r4, 0x3C
	adds r7, r3, 0
_08117FA2:
	lsls r1, r5, 19
	movs r0, 0xC4
	lsls r0, 16
	adds r1, r0
	asrs r1, 16
	ldr r0, _081180E4 @ =gSpriteTemplate_83FA2C8
	movs r2, 0x18
	movs r3, 0
	bl CreateSprite
	adds r3, r5, 0
	adds r3, 0x15
	adds r3, r4
	strb r0, [r3]
	ldrb r1, [r3]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r7
	adds r0, 0x3E
	ldrb r1, [r0]
	movs r2, 0x4
	orrs r1, r2
	strb r1, [r0]
	ldrb r1, [r3]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r7
	adds r0, 0x2C
	ldrb r1, [r0]
	movs r6, 0x40
	orrs r1, r6
	strb r1, [r0]
	adds r0, r5, 0x1
	lsls r0, 24
	lsrs r5, r0, 24
	cmp r5, 0x3
	bls _08117FA2
	ldr r0, _081180E8 @ =gSpriteTemplate_83FA2E0
	movs r1, 0x78
	movs r2, 0x44
	movs r3, 0x4
	bl CreateSprite
	ldr r3, _081180DC @ =0x02019000
	adds r1, r3, 0
	adds r1, 0x55
	strb r0, [r1]
	ldr r2, _081180E0 @ =gSprites
	ldrb r1, [r1]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r2
	adds r0, 0x2C
	ldrb r1, [r0]
	orrs r1, r6
	strb r1, [r0]
	movs r5, 0
	adds r3, 0x3C
	mov r8, r3
	adds r4, r2, 0
_08118020:
	lsls r1, r5, 20
	movs r0, 0xC0
	lsls r0, 16
	adds r1, r0
	asrs r1, 16
	ldr r0, _081180EC @ =gSpriteTemplate_83FA2F8
	movs r2, 0x24
	movs r3, 0x4
	bl CreateSprite
	adds r2, r5, 0
	adds r2, 0x1A
	add r2, r8
	strb r0, [r2]
	ldrb r1, [r2]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r4
	adds r0, 0x3E
	ldrb r1, [r0]
	movs r7, 0x4
	orrs r1, r7
	strb r1, [r0]
	ldrb r1, [r2]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r4
	adds r0, 0x2C
	ldrb r1, [r0]
	movs r6, 0x40
	orrs r1, r6
	strb r1, [r0]
	adds r0, r5, 0x1
	lsls r0, 24
	lsrs r5, r0, 24
	cmp r5, 0x2
	bls _08118020
	ldr r0, _081180F0 @ =gSpriteTemplate_83FA310
	movs r1, 0x98
	movs r2, 0x60
	movs r3, 0x9
	bl CreateSprite
	ldr r3, _081180DC @ =0x02019000
	adds r3, 0x6C
	strb r0, [r3]
	ldr r4, _081180E0 @ =gSprites
	ldrb r0, [r3]
	lsls r1, r0, 4
	adds r1, r0
	lsls r1, 2
	adds r1, r4
	ldrb r2, [r1, 0x5]
	movs r0, 0xD
	negs r0, r0
	ands r0, r2
	orrs r0, r7
	strb r0, [r1, 0x5]
	ldrb r1, [r3]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r4
	adds r0, 0x2C
	ldrb r1, [r0]
	orrs r1, r6
	strb r1, [r0]
	ldrb r1, [r3]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r4
	adds r0, 0x3E
	ldrb r1, [r0]
	orrs r1, r7
	strb r1, [r0]
	add sp, 0x8
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_081180C8: .4byte 0x02000000
_081180CC: .4byte gUnknown_083FA21C
_081180D0: .4byte 0xffff0000
_081180D4: .4byte 0x0000ffff
_081180D8: .4byte gSpriteTemplate_83FA2B0
_081180DC: .4byte 0x02019000
_081180E0: .4byte gSprites
_081180E4: .4byte gSpriteTemplate_83FA2C8
_081180E8: .4byte gSpriteTemplate_83FA2E0
_081180EC: .4byte gSpriteTemplate_83FA2F8
_081180F0: .4byte gSpriteTemplate_83FA310
	thumb_func_end sub_8117F2C

	thumb_func_start sub_81180F4
sub_81180F4: @ 81180F4
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	lsls r0, 16
	lsrs r7, r0, 16
	movs r0, 0xFA
	lsls r0, 2
	mov r8, r0
	movs r4, 0
	movs r6, 0
	ldr r1, _081181D4 @ =0x02019000
	mov r9, r1
	ldr r0, _081181D8 @ =gSprites
	mov r10, r0
_08118114:
	adds r0, r7, 0
	mov r1, r8
	bl __udivsi3
	lsls r0, 24
	lsrs r5, r0, 24
	adds r3, r6, 0
	adds r3, 0x15
	mov r0, r9
	adds r0, 0x3C
	adds r0, r3, r0
	ldrb r1, [r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	ldr r1, _081181D8 @ =gSprites
	adds r0, r1
	adds r0, 0x3E
	ldrb r1, [r0]
	movs r2, 0x4
	orrs r1, r2
	strb r1, [r0]
	adds r0, r3, 0
	cmp r5, 0
	bne _0811814E
	cmp r4, 0
	bne _0811814E
	cmp r6, 0x3
	bne _081181A2
_0811814E:
	mov r3, r9
	adds r3, 0x3C
	adds r3, r0, r3
	ldrb r1, [r3]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	add r0, r10
	adds r0, 0x3E
	ldrb r1, [r0]
	movs r4, 0x5
	negs r4, r4
	adds r2, r4, 0
	ands r1, r2
	strb r1, [r0]
	ldrb r1, [r3]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	mov r1, r10
	adds r3, r0, r1
	adds r4, r3, 0
	adds r4, 0x40
	ldr r1, _081181DC @ =gSprites + 0x8
	adds r0, r1
	ldr r0, [r0]
	ldr r1, [r0]
	lsls r0, r5, 2
	adds r0, r1
	ldrh r2, [r0]
	ldrh r4, [r4]
	adds r2, r4
	ldr r4, _081181E0 @ =0x000003ff
	adds r0, r4, 0
	ands r2, r0
	ldrh r0, [r3, 0x4]
	ldr r4, _081181E4 @ =0xfffffc00
	adds r1, r4, 0
	ands r0, r1
	orrs r0, r2
	strh r0, [r3, 0x4]
	movs r4, 0x1
_081181A2:
	adds r0, r7, 0
	mov r1, r8
	bl __umodsi3
	lsls r0, 16
	lsrs r7, r0, 16
	mov r0, r8
	movs r1, 0xA
	bl __udivsi3
	lsls r0, 16
	lsrs r0, 16
	mov r8, r0
	adds r0, r6, 0x1
	lsls r0, 24
	lsrs r6, r0, 24
	cmp r6, 0x3
	bls _08118114
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_081181D4: .4byte 0x02019000
_081181D8: .4byte gSprites
_081181DC: .4byte gSprites + 0x8
_081181E0: .4byte 0x000003ff
_081181E4: .4byte 0xfffffc00
	thumb_func_end sub_81180F4

	thumb_func_start sub_81181E8
sub_81181E8: @ 81181E8
	push {r4,lr}
	sub sp, 0x8
	lsls r0, 24
	lsrs r4, r0, 24
	ldr r1, _08118220 @ =gUnknown_083FA608
	mov r0, sp
	movs r2, 0x5
	bl memcpy
	cmp r4, 0x13
	bls _08118200
	movs r4, 0
_08118200:
	ldr r3, _08118224 @ =gUnknown_083F8C00
	lsls r0, r4, 2
	adds r0, r4
	lsls r2, r0, 2
	adds r0, r2, r3
	ldrb r0, [r0, 0x1]
	lsls r0, 28
	lsrs r0, 28
	cmp r0, 0x4
	beq _08118254
	cmp r0, 0x4
	bgt _08118228
	cmp r0, 0x3
	beq _0811822E
	b _08118290
	.align 2, 0
_08118220: .4byte gUnknown_083FA608
_08118224: .4byte gUnknown_083F8C00
_08118228:
	cmp r0, 0xC
	beq _08118274
	b _08118290
_0811822E:
	adds r0, r4, 0
	movs r1, 0x5
	bl __udivsi3
	subs r0, 0x1
	lsls r0, 24
	lsrs r4, r0, 24
	ldr r0, _08118250 @ =0x02019000
	adds r0, 0x16
	adds r1, r4, r0
	ldrb r0, [r1]
	cmp r0, 0x3
	bhi _08118290
	ldrb r0, [r1]
	adds r0, 0x1
	b _0811826A
	.align 2, 0
_08118250: .4byte 0x02019000
_08118254:
	subs r0, r4, 0x1
	lsls r0, 24
	lsrs r4, r0, 24
	ldr r0, _08118270 @ =0x02019000
	adds r0, 0x12
	adds r1, r4, r0
	ldrb r0, [r1]
	cmp r0, 0x2
	bhi _08118290
	ldrb r0, [r1]
	adds r0, 0x2
_0811826A:
	add r0, sp
	ldrb r0, [r0]
	b _08118292
	.align 2, 0
_08118270: .4byte 0x02019000
_08118274:
	ldr r1, _0811828C @ =0x02019000
	adds r0, r3, 0
	adds r0, 0x8
	adds r0, r2, r0
	ldr r1, [r1, 0x8]
	ldr r0, [r0]
	ands r1, r0
	cmp r1, 0
	bne _08118290
	mov r0, sp
	ldrb r0, [r0, 0x4]
	b _08118292
	.align 2, 0
_0811828C: .4byte 0x02019000
_08118290:
	movs r0, 0
_08118292:
	add sp, 0x8
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end sub_81181E8

	thumb_func_start sub_811829C
sub_811829C: @ 811829C
	push {r4,lr}
	lsls r0, 24
	lsrs r0, 24
	ldr r1, _081182E8 @ =0x02019000
	adds r1, 0x55
	ldrb r2, [r1]
	lsls r1, r2, 4
	adds r1, r2
	lsls r1, 2
	ldr r2, _081182EC @ =gSprites
	adds r4, r1, r2
	bl sub_81181E8
	adds r3, r4, 0
	adds r3, 0x2B
	strb r0, [r3]
	adds r2, r4, 0
	adds r2, 0x40
	ldr r1, [r4, 0x8]
	ldrb r0, [r3]
	ldr r1, [r1]
	lsls r0, 2
	adds r0, r1
	ldrh r1, [r0]
	ldrh r2, [r2]
	adds r1, r2
	ldr r2, _081182F0 @ =0x000003ff
	adds r0, r2, 0
	ands r1, r0
	ldrh r2, [r4, 0x4]
	ldr r0, _081182F4 @ =0xfffffc00
	ands r0, r2
	orrs r0, r1
	strh r0, [r4, 0x4]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_081182E8: .4byte 0x02019000
_081182EC: .4byte gSprites
_081182F0: .4byte 0x000003ff
_081182F4: .4byte 0xfffffc00
	thumb_func_end sub_811829C

	thumb_func_start sub_81182F8
sub_81182F8: @ 81182F8
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	lsls r0, 24
	lsrs r2, r0, 24
	movs r5, 0
	ldr r0, _08118320 @ =0x02019000
	ldrb r1, [r0, 0x19]
	adds r3, r0, 0
	cmp r1, 0x1
	bne _08118310
	movs r5, 0x2
_08118310:
	cmp r2, 0x6
	bls _08118316
	b _08118464
_08118316:
	lsls r0, r2, 2
	ldr r1, _08118324 @ =_08118328
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_08118320: .4byte 0x02019000
_08118324: .4byte _08118328
	.align 2, 0
_08118328:
	.4byte _08118464
	.4byte _08118420
	.4byte _081183F8
	.4byte _081183EC
	.4byte _081183C4
	.4byte _081183B8
	.4byte _08118344
_08118344:
	movs r4, 0
	ldr r5, _081183A8 @ =gSprites
	ldr r0, _081183AC @ =0x0201903c
	mov r8, r0
	movs r2, 0x5
	negs r2, r2
	mov r12, r2
	adds r6, r5, 0
	adds r6, 0x8
	ldr r7, _081183B0 @ =0xfffffc00
_08118358:
	adds r3, r4, 0
	adds r3, 0x1A
	add r3, r8
	ldrb r0, [r3]
	lsls r1, r0, 4
	adds r1, r0
	lsls r1, 2
	adds r1, r5
	adds r1, 0x3E
	ldrb r2, [r1]
	mov r0, r12
	ands r0, r2
	strb r0, [r1]
	ldrb r1, [r3]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r3, r0, r5
	adds r2, r3, 0
	adds r2, 0x40
	adds r0, r6
	ldr r0, [r0]
	ldr r0, [r0]
	ldrh r1, [r0]
	ldrh r2, [r2]
	adds r1, r2
	ldr r2, _081183B4 @ =0x000003ff
	adds r0, r2, 0
	ands r1, r0
	ldrh r2, [r3, 0x4]
	adds r0, r7, 0
	ands r0, r2
	orrs r0, r1
	strh r0, [r3, 0x4]
	adds r0, r4, 0x1
	lsls r0, 24
	lsrs r4, r0, 24
	cmp r4, 0x2
	bls _08118358
	b _081184B2
	.align 2, 0
_081183A8: .4byte gSprites
_081183AC: .4byte 0x0201903c
_081183B0: .4byte 0xfffffc00
_081183B4: .4byte 0x000003ff
_081183B8:
	ldr r2, _081183C0 @ =gSprites
	adds r0, r3, 0
	adds r0, 0x58
	b _08118426
	.align 2, 0
_081183C0: .4byte gSprites
_081183C4:
	ldr r2, _081183E8 @ =gSprites
	adds r0, r3, 0
	adds r0, 0x58
	ldrb r1, [r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r3, r0, r2
	adds r4, r3, 0
	adds r4, 0x40
	adds r2, 0x8
	adds r0, r2
	ldr r0, [r0]
	ldr r1, [r0]
	lsls r0, r5, 2
	adds r0, r1
	ldrh r1, [r0, 0x8]
	b _08118442
	.align 2, 0
_081183E8: .4byte gSprites
_081183EC:
	ldr r2, _081183F4 @ =gSprites
	adds r0, r3, 0
	adds r0, 0x57
	b _08118426
	.align 2, 0
_081183F4: .4byte gSprites
_081183F8:
	ldr r2, _0811841C @ =gSprites
	adds r0, r3, 0
	adds r0, 0x57
	ldrb r1, [r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r3, r0, r2
	adds r4, r3, 0
	adds r4, 0x40
	adds r2, 0x8
	adds r0, r2
	ldr r0, [r0]
	ldr r1, [r0]
	lsls r0, r5, 2
	adds r0, r1
	ldrh r1, [r0, 0x8]
	b _08118442
	.align 2, 0
_0811841C: .4byte gSprites
_08118420:
	ldr r2, _08118458 @ =gSprites
	adds r0, r3, 0
	adds r0, 0x56
_08118426:
	ldrb r1, [r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r3, r0, r2
	adds r4, r3, 0
	adds r4, 0x40
	adds r2, 0x8
	adds r0, r2
	ldr r0, [r0]
	ldr r1, [r0]
	lsls r0, r5, 2
	adds r0, r1
	ldrh r1, [r0, 0x4]
_08118442:
	ldrh r4, [r4]
	adds r1, r4
	ldr r2, _0811845C @ =0x000003ff
	adds r0, r2, 0
	ands r1, r0
	ldrh r2, [r3, 0x4]
	ldr r0, _08118460 @ =0xfffffc00
	ands r0, r2
	orrs r0, r1
	strh r0, [r3, 0x4]
	b _081184B2
	.align 2, 0
_08118458: .4byte gSprites
_0811845C: .4byte 0x000003ff
_08118460: .4byte 0xfffffc00
_08118464:
	movs r4, 0
	lsls r6, r5, 2
	ldr r5, _081184BC @ =gSprites
	ldr r0, _081184C0 @ =0x0201903c
	mov r8, r0
	adds r7, r5, 0
	adds r7, 0x8
	ldr r2, _081184C4 @ =0xfffffc00
	mov r12, r2
_08118476:
	adds r0, r4, 0
	adds r0, 0x1A
	add r0, r8
	ldrb r1, [r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r3, r0, r5
	adds r2, r3, 0
	adds r2, 0x40
	adds r0, r7
	ldr r0, [r0]
	ldr r0, [r0]
	adds r0, r6, r0
	ldrh r1, [r0, 0x8]
	ldrh r2, [r2]
	adds r1, r2
	ldr r2, _081184C8 @ =0x000003ff
	adds r0, r2, 0
	ands r1, r0
	ldrh r2, [r3, 0x4]
	mov r0, r12
	ands r0, r2
	orrs r0, r1
	strh r0, [r3, 0x4]
	adds r0, r4, 0x1
	lsls r0, 24
	lsrs r4, r0, 24
	cmp r4, 0x2
	bls _08118476
_081184B2:
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_081184BC: .4byte gSprites
_081184C0: .4byte 0x0201903c
_081184C4: .4byte 0xfffffc00
_081184C8: .4byte 0x000003ff
	thumb_func_end sub_81182F8

	thumb_func_start sub_81184CC
sub_81184CC: @ 81184CC
	ldr r1, _081184D4 @ =0x02019000
	ldrh r1, [r1, 0x26]
	strh r1, [r0, 0x24]
	bx lr
	.align 2, 0
_081184D4: .4byte 0x02019000
	thumb_func_end sub_81184CC

	thumb_func_start sub_81184D8
sub_81184D8: @ 81184D8
	push {r4,r5,lr}
	sub sp, 0x8
	ldr r4, _08118544 @ =gUnknown_083FA42C
	ldr r0, [r4]
	ldr r5, _08118548 @ =0x02000000
	adds r1, r5, 0
	bl LZ77UnCompWram
	str r5, [sp]
	ldrh r1, [r4, 0x6]
	lsls r1, 16
	ldrh r0, [r4, 0x4]
	orrs r0, r1
	str r0, [sp, 0x4]
	mov r0, sp
	bl LoadSpriteSheet
	ldr r0, _0811854C @ =gSpriteTemplate_83FA434
	movs r1, 0x74
	movs r2, 0x50
	movs r3, 0x51
	bl CreateSprite
	lsls r0, 24
	lsrs r0, 24
	ldr r2, _08118550 @ =gSprites
	lsls r1, r0, 4
	adds r1, r0
	lsls r1, 2
	adds r1, r2
	movs r0, 0xC8
	lsls r0, 9
	adds r5, r0
	ldrh r0, [r5, 0x24]
	movs r2, 0
	strh r0, [r1, 0x2E]
	strh r2, [r1, 0x30]
	adds r3, r1, 0
	adds r3, 0x2C
	ldrb r0, [r3]
	movs r2, 0x40
	orrs r0, r2
	movs r2, 0x80
	orrs r0, r2
	strb r0, [r3]
	adds r1, 0x3E
	ldrb r0, [r1]
	movs r2, 0x2
	orrs r0, r2
	strb r0, [r1]
	add sp, 0x8
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_08118544: .4byte gUnknown_083FA42C
_08118548: .4byte 0x02000000
_0811854C: .4byte gSpriteTemplate_83FA434
_08118550: .4byte gSprites
	thumb_func_end sub_81184D8

	thumb_func_start sub_8118554
sub_8118554: @ 8118554
	ldrb r0, [r0, 0x3]
	lsls r0, 26
	lsrs r0, 27
	ldr r1, _08118574 @ =gOamMatrices
	lsls r0, 3
	adds r0, r1
	ldr r2, _08118578 @ =0x02019000
	ldrh r1, [r2, 0x2C]
	strh r1, [r0, 0x6]
	ldrh r1, [r2, 0x2C]
	strh r1, [r0]
	ldrh r1, [r2, 0x2E]
	strh r1, [r0, 0x2]
	ldrh r1, [r2, 0x30]
	strh r1, [r0, 0x4]
	bx lr
	.align 2, 0
_08118574: .4byte gOamMatrices
_08118578: .4byte 0x02019000
	thumb_func_end sub_8118554

	thumb_func_start sub_811857C
sub_811857C: @ 811857C
	push {r4-r6,lr}
	movs r4, 0
	ldr r6, _081185DC @ =0x0201903c
	ldr r5, _081185E0 @ =gSprites
_08118584:
	movs r3, 0x39
	subs r3, r4
	lsls r3, 24
	lsrs r3, 24
	ldr r0, _081185E4 @ =gSpriteTemplate_83FA40C
	movs r1, 0x74
	movs r2, 0x50
	bl CreateSprite
	adds r3, r4, r6
	strb r0, [r3]
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x40
	beq _081185CA
	ldrb r1, [r3]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r5
	adds r0, 0x3E
	ldrb r1, [r0]
	movs r2, 0x4
	orrs r1, r2
	strb r1, [r0]
	ldrb r1, [r3]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r5
	adds r0, 0x3E
	ldrb r1, [r0]
	movs r2, 0x2
	orrs r1, r2
	strb r1, [r0]
_081185CA:
	adds r0, r4, 0x1
	lsls r0, 24
	lsrs r4, r0, 24
	cmp r4, 0x5
	bls _08118584
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_081185DC: .4byte 0x0201903c
_081185E0: .4byte gSprites
_081185E4: .4byte gSpriteTemplate_83FA40C
	thumb_func_end sub_811857C

	thumb_func_start sub_81185E8
sub_81185E8: @ 81185E8
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	ldr r0, _08118660 @ =0x02019000
	adds r0, 0x3C
	ldrb r5, [r0]
	movs r6, 0
	ldr r7, _08118664 @ =gSprites
	movs r0, 0x1C
	adds r0, r7
	mov r10, r0
	movs r1, 0x2E
	adds r1, r7
	mov r9, r1
	mov r8, r6
_0811860A:
	lsls r4, r5, 4
	adds r4, r5
	lsls r4, 2
	adds r0, r4, r7
	adds r3, r0, 0
	adds r3, 0x3E
	ldrb r1, [r3]
	movs r2, 0x4
	orrs r1, r2
	strb r1, [r3]
	mov r1, r10
	adds r2, r4, r1
	ldr r1, _08118668 @ =SpriteCallbackDummy
	str r1, [r2]
	movs r1, 0
	bl StartSpriteAnim
	movs r1, 0
	adds r2, r5, 0x1
	adds r3, r6, 0x1
_08118632:
	lsls r0, r1, 1
	adds r0, r4
	add r0, r9
	mov r5, r8
	strh r5, [r0]
	adds r0, r1, 0x1
	lsls r0, 24
	lsrs r1, r0, 24
	cmp r1, 0x7
	bls _08118632
	lsls r0, r2, 24
	lsrs r5, r0, 24
	lsls r0, r3, 24
	lsrs r6, r0, 24
	cmp r6, 0x5
	bls _0811860A
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_08118660: .4byte 0x02019000
_08118664: .4byte gSprites
_08118668: .4byte SpriteCallbackDummy
	thumb_func_end sub_81185E8

	thumb_func_start sub_811866C
sub_811866C: @ 811866C
	push {r4,r5,lr}
	adds r3, r0, 0
	ldr r0, _0811869C @ =0x02019000
	ldrh r4, [r0, 0x24]
	movs r2, 0x24
	ldrsh r1, [r0, r2]
	ldrh r2, [r3, 0x34]
	movs r5, 0x34
	ldrsh r0, [r3, r5]
	cmp r1, r0
	ble _081186A8
	movs r1, 0xB4
	lsls r1, 1
	adds r0, r2, r1
	subs r2, r0, r4
	strh r2, [r3, 0x3A]
	lsls r1, r2, 16
	ldr r0, _081186A0 @ =0x01670000
	cmp r1, r0
	ble _081186AC
	ldr r5, _081186A4 @ =0xfffffe98
	adds r0, r2, r5
	b _081186AA
	.align 2, 0
_0811869C: .4byte 0x02019000
_081186A0: .4byte 0x01670000
_081186A4: .4byte 0xfffffe98
_081186A8:
	subs r0, r2, r4
_081186AA:
	strh r0, [r3, 0x3A]
_081186AC:
	movs r1, 0x3A
	ldrsh r0, [r3, r1]
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end sub_811866C

	thumb_func_start sub_81186B8
sub_81186B8: @ 81186B8
	push {r4,lr}
	bl sub_811866C
	ldr r4, _081186E0 @ =0x02019000
	lsls r0, 16
	asrs r0, 16
	bl __floatsisf
	ldr r1, _081186E4 @ =0x41f00000
	bl __divsf3
	bl __fixunssfsi
	adds r4, 0x7E
	strb r0, [r4]
	ldrb r0, [r4]
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_081186E0: .4byte 0x02019000
_081186E4: .4byte 0x41f00000
	thumb_func_end sub_81186B8

	thumb_func_start sub_81186E8
sub_81186E8: @ 81186E8
	push {r4,lr}
	adds r4, r0, 0
	bl sub_811866C
	lsls r0, 16
	asrs r0, 16
	movs r1, 0x1E
	bl __modsi3
	lsls r0, 16
	asrs r1, r0, 16
	cmp r1, 0xE
	bne _08118708
	movs r0, 0
	strh r0, [r4, 0x32]
	b _0811871E
_08118708:
	cmp r1, 0xD
	bgt _08118710
	movs r0, 0xE
	b _08118712
_08118710:
	movs r0, 0x2B
_08118712:
	subs r0, r1
	lsls r0, 16
	lsrs r0, 16
	strh r0, [r4, 0x32]
	lsls r0, 16
	asrs r0, 16
_0811871E:
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end sub_81186E8

	thumb_func_start sub_8118724
sub_8118724: @ 8118724
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	adds r6, r0, 0
	ldr r5, _08118770 @ =0x02019000
	adds r4, r5, 0
	adds r4, 0x8C
	adds r1, r5, 0
	adds r1, 0x90
	ldr r0, [r4]
	ldr r1, [r1]
	bl __addsf3
	adds r1, r0, 0
	str r1, [r4]
	movs r0, 0x88
	adds r0, r5
	mov r8, r0
	ldr r0, [r0]
	bl __addsf3
	adds r4, r0, 0
	mov r1, r8
	str r4, [r1]
	ldr r7, _08118774 @ =0x43b40000
	adds r1, r7, 0
	bl __gesf2
	cmp r0, 0
	blt _08118778
	adds r0, r4, 0
	adds r1, r7, 0
	bl __subsf3
	mov r2, r8
	str r0, [r2]
	b _08118790
	.align 2, 0
_08118770: .4byte 0x02019000
_08118774: .4byte 0x43b40000
_08118778:
	ldr r1, _08118824 @ =0x00000000
	adds r0, r4, 0
	bl __ltsf2
	cmp r0, 0
	bge _08118790
	adds r0, r4, 0
	adds r1, r7, 0
	bl __addsf3
	mov r1, r8
	str r0, [r1]
_08118790:
	adds r0, r5, 0
	adds r0, 0x88
	ldr r0, [r0]
	bl __fixsfsi
	strh r0, [r6, 0x34]
	adds r4, r5, 0
	adds r4, 0x98
	adds r1, r5, 0
	adds r1, 0x9C
	ldr r0, [r4]
	ldr r1, [r1]
	bl __addsf3
	adds r1, r0, 0
	str r1, [r4]
	subs r4, 0x4
	ldr r0, [r4]
	bl __addsf3
	str r0, [r4]
	bl __fixsfsi
	strh r0, [r6, 0x36]
	ldrh r0, [r6, 0x34]
	bl Sin2
	adds r4, r0, 0
	lsls r4, 16
	lsrs r4, 16
	ldrh r0, [r6, 0x34]
	bl Cos2
	lsls r4, 16
	asrs r4, 16
	movs r2, 0x36
	ldrsh r1, [r6, r2]
	muls r1, r4
	asrs r1, 12
	strh r1, [r6, 0x24]
	lsls r0, 16
	asrs r0, 16
	negs r0, r0
	movs r2, 0x36
	ldrsh r1, [r6, r2]
	muls r0, r1
	asrs r0, 12
	strh r0, [r6, 0x26]
	bl IsSEPlaying
	lsls r0, 24
	cmp r0, 0
	beq _08118818
	ldr r0, _08118828 @ =gMPlay_SE1
	ldr r4, _0811882C @ =0x0000ffff
	ldrh r2, [r6, 0x24]
	lsls r2, 24
	asrs r2, 24
	adds r1, r4, 0
	bl m4aMPlayPanpotControl
	ldr r0, _08118830 @ =gMPlay_SE2
	ldrh r2, [r6, 0x24]
	lsls r2, 24
	asrs r2, 24
	adds r1, r4, 0
	bl m4aMPlayPanpotControl
_08118818:
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_08118824: .4byte 0x00000000
_08118828: .4byte gMPlay_SE1
_0811882C: .4byte 0x0000ffff
_08118830: .4byte gMPlay_SE2
	thumb_func_end sub_8118724

	thumb_func_start sub_8118834
sub_8118834: @ 8118834
	push {r4,r5,lr}
	adds r5, r0, 0
	ldr r1, _0811888C @ =0x02019000
	ldrh r0, [r5, 0x3A]
	ldrh r1, [r1, 0x24]
	adds r2, r0, r1
	strh r2, [r5, 0x34]
	lsls r1, r2, 16
	ldr r0, _08118890 @ =0x01670000
	cmp r1, r0
	ble _08118850
	ldr r1, _08118894 @ =0xfffffe98
	adds r0, r2, r1
	strh r0, [r5, 0x34]
_08118850:
	ldrh r0, [r5, 0x34]
	bl Sin2
	adds r4, r0, 0
	lsls r4, 16
	lsrs r4, 16
	ldrh r0, [r5, 0x34]
	bl Cos2
	lsls r4, 16
	asrs r4, 16
	movs r2, 0x36
	ldrsh r1, [r5, r2]
	muls r1, r4
	asrs r1, 12
	strh r1, [r5, 0x24]
	lsls r0, 16
	asrs r0, 16
	negs r0, r0
	movs r2, 0x36
	ldrsh r1, [r5, r2]
	muls r0, r1
	ldr r1, _08118898 @ =gSpriteCoordOffsetY
	asrs r0, 12
	ldrh r1, [r1]
	adds r0, r1
	strh r0, [r5, 0x26]
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_0811888C: .4byte 0x02019000
_08118890: .4byte 0x01670000
_08118894: .4byte 0xfffffe98
_08118898: .4byte gSpriteCoordOffsetY
	thumb_func_end sub_8118834

	thumb_func_start sub_811889C
sub_811889C: @ 811889C
	push {r4-r6,lr}
	adds r5, r0, 0
	bl sub_8118724
	ldrh r0, [r5, 0x32]
	adds r0, 0x1
	strh r0, [r5, 0x32]
	ldrh r0, [r5, 0x36]
	adds r0, 0x84
	lsls r0, 16
	lsrs r0, 16
	cmp r0, 0xD4
	bls _081188C2
	adds r2, r5, 0
	adds r2, 0x3E
	ldrb r0, [r2]
	movs r1, 0x4
	orrs r0, r1
	b _081188CE
_081188C2:
	adds r2, r5, 0
	adds r2, 0x3E
	ldrb r1, [r2]
	movs r0, 0x5
	negs r0, r0
	ands r0, r1
_081188CE:
	strb r0, [r2]
	movs r1, 0x32
	ldrsh r0, [r5, r1]
	cmp r0, 0x1D
	ble _0811898E
	movs r1, 0x2E
	ldrsh r0, [r5, r1]
	cmp r0, 0
	bne _08118908
	ldr r6, _08118900 @ =0x02019000
	adds r4, r6, 0
	adds r4, 0x94
	adds r0, r6, 0
	adds r0, 0xA0
	ldr r0, [r0]
	ldr r1, _08118904 @ =0x40000000
	bl __subsf3
	adds r1, r0, 0
	ldr r0, [r4]
	bl __lesf2
	cmp r0, 0
	bgt _0811898E
	b _08118926
	.align 2, 0
_08118900: .4byte 0x02019000
_08118904: .4byte 0x40000000
_08118908:
	ldr r6, _08118994 @ =0x02019000
	adds r4, r6, 0
	adds r4, 0x94
	adds r0, r6, 0
	adds r0, 0xA0
	ldr r0, [r0]
	ldr r1, _08118998 @ =0x40000000
	bl __subsf3
	adds r1, r0, 0
	ldr r0, [r4]
	bl __gesf2
	cmp r0, 0
	blt _0811898E
_08118926:
	adds r1, r6, 0
	adds r1, 0x7D
	movs r0, 0xFF
	strb r0, [r1]
	ldrb r1, [r6, 0x3]
	movs r0, 0x7F
	ands r0, r1
	strb r0, [r6, 0x3]
	adds r0, r5, 0
	adds r0, 0x2B
	ldrb r1, [r0]
	adds r1, 0x3
	lsls r1, 24
	lsrs r1, 24
	adds r0, r5, 0
	bl StartSpriteAnim
	adds r0, r5, 0
	bl sub_81186B8
	movs r0, 0x1E
	strh r0, [r5, 0x36]
	adds r0, r5, 0
	bl sub_811866C
	movs r1, 0x3A
	ldrsh r0, [r5, r1]
	movs r1, 0x1E
	bl __divsi3
	lsls r0, 16
	asrs r0, 16
	lsls r1, r0, 4
	subs r1, r0
	lsls r1, 1
	adds r1, 0xF
	strh r1, [r5, 0x3A]
	ldr r0, _0811899C @ =sub_8118834
	str r0, [r5, 0x1C]
	movs r0, 0x47
	bl m4aSongNumStartOrChange
	adds r2, r6, 0
	adds r2, 0x9C
	adds r1, r6, 0
	adds r1, 0x98
	ldr r0, _081189A0 @ =0x00000000
	str r0, [r1]
	str r0, [r2]
	subs r1, 0xC
	ldr r0, _081189A4 @ =0xbf800000
	str r0, [r1]
_0811898E:
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_08118994: .4byte 0x02019000
_08118998: .4byte 0x40000000
_0811899C: .4byte sub_8118834
_081189A0: .4byte 0x00000000
_081189A4: .4byte 0xbf800000
	thumb_func_end sub_811889C

	thumb_func_start sub_81189A8
sub_81189A8: @ 81189A8
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	adds r7, r0, 0
	bl sub_8118724
	movs r1, 0x34
	ldrsh r0, [r7, r1]
	cmp r0, 0
	beq _081189C6
	cmp r0, 0xB4
	beq _08118A2C
	b _08118B0C
_081189C6:
	movs r1, 0x2E
	ldrsh r0, [r7, r1]
	cmp r0, 0x1
	bne _081189D0
	b _08118B0C
_081189D0:
	movs r1, 0x3C
	ldrsh r0, [r7, r1]
	bl __floatsisf
	mov r8, r0
	ldr r0, _08118A24 @ =gUnknown_083F8DF4
	mov r9, r0
	ldr r1, _08118A28 @ =0x02019000
	mov r10, r1
	ldrb r4, [r1, 0x4]
	lsls r4, 30
	lsrs r0, r4, 25
	add r0, r9
	ldrb r0, [r0, 0x1]
	bl __floatsisf
	adds r1, r0, 0
	mov r0, r8
	bl __mulsf3
	adds r6, r0, 0
	lsrs r0, r4, 25
	add r0, r9
	ldrb r0, [r0, 0x2]
	subs r0, 0x1
	bl __floatsisf
	adds r1, r0, 0
	adds r0, r6, 0
	bl __addsf3
	adds r5, r0, 0
	lsrs r4, 25
	add r4, r9
	ldrh r0, [r4, 0xC]
	bl __floatsisf
	adds r1, r0, 0
	mov r0, r8
	bl __divsf3
	b _08118A8A
	.align 2, 0
_08118A24: .4byte gUnknown_083F8DF4
_08118A28: .4byte 0x02019000
_08118A2C:
	movs r1, 0x2E
	ldrsh r0, [r7, r1]
	cmp r0, 0
	beq _08118B0C
	movs r1, 0x3C
	ldrsh r0, [r7, r1]
	bl __floatsisf
	mov r8, r0
	ldr r0, _08118B1C @ =gUnknown_083F8DF4
	mov r9, r0
	ldr r1, _08118B20 @ =0x02019000
	mov r10, r1
	ldrb r4, [r1, 0x4]
	lsls r4, 30
	lsrs r0, r4, 25
	add r0, r9
	ldrb r0, [r0, 0x1]
	bl __floatsisf
	adds r1, r0, 0
	mov r0, r8
	bl __mulsf3
	adds r6, r0, 0
	lsrs r0, r4, 25
	add r0, r9
	ldrb r0, [r0, 0x2]
	subs r0, 0x1
	bl __floatsisf
	adds r1, r0, 0
	adds r0, r6, 0
	bl __addsf3
	adds r5, r0, 0
	lsrs r4, 25
	add r4, r9
	ldrh r0, [r4, 0xC]
	bl __floatsisf
	adds r1, r0, 0
	mov r0, r8
	bl __divsf3
	bl __negsf2
_08118A8A:
	adds r2, r0, 0
	mov r6, r10
	adds r1, r6, 0
	adds r1, 0xA0
	adds r0, r6, 0
	adds r0, 0x94
	ldr r0, [r0]
	str r0, [r1]
	adds r0, r6, 0
	adds r0, 0x98
	str r2, [r0]
	movs r0, 0x9C
	adds r0, r6
	mov r8, r0
	adds r0, r2, 0
	adds r1, r2, 0
	bl __addsf3
	adds r1, r5, 0
	bl __divsf3
	adds r4, r0, 0
	adds r0, r5, 0
	adds r1, r5, 0
	bl __mulsf3
	adds r1, r0, 0
	ldr r0, _08118B24 @ =0x40000000
	bl __divsf3
	adds r1, r0, 0
	adds r0, r4, 0
	bl __addsf3
	bl __negsf2
	mov r1, r8
	str r0, [r1]
	adds r1, r6, 0
	adds r1, 0x8C
	ldr r0, _08118B28 @ =0x00000000
	str r0, [r1]
	adds r2, r7, 0
	adds r2, 0x2C
	ldrb r1, [r2]
	movs r0, 0x41
	negs r0, r0
	ands r0, r1
	strb r0, [r2]
	adds r0, r7, 0
	adds r0, 0x2A
	movs r2, 0
	strb r2, [r0]
	adds r3, r7, 0
	adds r3, 0x3F
	ldrb r0, [r3]
	movs r1, 0x4
	orrs r0, r1
	movs r1, 0x11
	negs r1, r1
	ands r0, r1
	strb r0, [r3]
	ldr r0, _08118B2C @ =sub_811889C
	str r0, [r7, 0x1C]
	strh r2, [r7, 0x32]
_08118B0C:
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_08118B1C: .4byte gUnknown_083F8DF4
_08118B20: .4byte 0x02019000
_08118B24: .4byte 0x40000000
_08118B28: .4byte 0x00000000
_08118B2C: .4byte sub_811889C
	thumb_func_end sub_81189A8

	thumb_func_start sub_8118B30
sub_8118B30: @ 8118B30
	push {r4,r5,lr}
	adds r5, r0, 0
	movs r1, 0x32
	ldrsh r0, [r5, r1]
	bl __floatsisf
	adds r4, r0, 0
	ldr r1, _08118BCC @ =0x3d4ccccd
	bl __mulsf3
	adds r1, r4, 0
	bl __mulsf3
	bl __fixsfsi
	adds r1, r0, 0
	subs r1, 0x2D
	strh r1, [r5, 0x26]
	ldrh r0, [r5, 0x32]
	adds r0, 0x1
	strh r0, [r5, 0x32]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x1D
	ble _08118BC6
	lsls r0, r1, 16
	cmp r0, 0
	blt _08118BC6
	ldr r4, _08118BD0 @ =0x02019000
	adds r1, r4, 0
	adds r1, 0x7D
	movs r0, 0xFF
	strb r0, [r1]
	ldrb r1, [r4, 0x3]
	movs r0, 0x7F
	ands r0, r1
	strb r0, [r4, 0x3]
	adds r0, r5, 0
	adds r0, 0x2B
	ldrb r1, [r0]
	adds r1, 0x3
	lsls r1, 24
	lsrs r1, 24
	adds r0, r5, 0
	bl StartSpriteAnim
	adds r0, r5, 0
	bl sub_81186B8
	movs r0, 0x1E
	strh r0, [r5, 0x36]
	adds r0, r5, 0
	bl sub_811866C
	movs r1, 0x3A
	ldrsh r0, [r5, r1]
	movs r1, 0x1E
	bl __divsi3
	lsls r0, 16
	asrs r0, 16
	lsls r1, r0, 4
	subs r1, r0
	lsls r1, 1
	adds r1, 0xF
	strh r1, [r5, 0x3A]
	ldr r0, _08118BD4 @ =sub_8118834
	str r0, [r5, 0x1C]
	movs r0, 0x47
	bl m4aSongNumStartOrChange
	ldrb r0, [r4, 0x3]
	movs r1, 0x40
	orrs r0, r1
	strb r0, [r4, 0x3]
_08118BC6:
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_08118BCC: .4byte 0x3d4ccccd
_08118BD0: .4byte 0x02019000
_08118BD4: .4byte sub_8118834
	thumb_func_end sub_8118B30

	thumb_func_start sub_8118BD8
sub_8118BD8: @ 8118BD8
	push {r4,lr}
	adds r3, r0, 0
	ldrh r0, [r3, 0x32]
	adds r1, r0, 0x1
	strh r1, [r3, 0x32]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x2C
	bgt _08118C1C
	ldrh r4, [r3, 0x26]
	subs r0, r4, 0x1
	strh r0, [r3, 0x26]
	lsls r0, r1, 16
	asrs r0, 16
	cmp r0, 0x2D
	bne _08118CA2
	ldr r2, _08118C14 @ =gSprites
	ldr r0, _08118C18 @ =0x02019000
	adds r0, 0x73
	ldrb r1, [r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r2
	adds r0, 0x2B
	ldrb r0, [r0]
	cmp r0, 0x1
	bne _08118CA2
	strh r4, [r3, 0x26]
	b _08118CA2
	.align 2, 0
_08118C14: .4byte gSprites
_08118C18: .4byte 0x02019000
_08118C1C:
	lsls r0, r1, 16
	asrs r0, 16
	movs r2, 0x3C
	ldrsh r1, [r3, r2]
	cmp r0, r1
	bge _08118C68
	ldr r2, _08118C58 @ =gSprites
	ldr r0, _08118C5C @ =0x02019000
	adds r0, 0x73
	ldrb r1, [r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r1, r0, r2
	adds r0, r1, 0
	adds r0, 0x2C
	ldrb r0, [r0]
	lsls r0, 26
	cmp r0, 0
	bne _08118CA2
	adds r0, r1, 0
	adds r0, 0x2B
	ldrb r0, [r0]
	cmp r0, 0x1
	bne _08118C60
	ldrh r0, [r3, 0x26]
	adds r0, 0x1
	strh r0, [r3, 0x26]
	b _08118CA2
	.align 2, 0
_08118C58: .4byte gSprites
_08118C5C: .4byte 0x02019000
_08118C60:
	ldrh r0, [r3, 0x26]
	subs r0, 0x1
	strh r0, [r3, 0x26]
	b _08118CA2
_08118C68:
	adds r2, r3, 0
	adds r2, 0x2C
	ldrb r1, [r2]
	movs r0, 0x41
	negs r0, r0
	ands r0, r1
	strb r0, [r2]
	adds r1, r3, 0
	adds r1, 0x2A
	movs r2, 0
	movs r0, 0x1
	strb r0, [r1]
	movs r0, 0x3F
	adds r0, r3
	mov r12, r0
	ldrb r0, [r0]
	movs r1, 0x4
	orrs r0, r1
	movs r1, 0x11
	negs r1, r1
	ands r0, r1
	mov r1, r12
	strb r0, [r1]
	strh r2, [r3, 0x32]
	ldr r0, _08118CA8 @ =sub_8118B30
	str r0, [r3, 0x1C]
	movs r0, 0x3D
	bl m4aSongNumStart
_08118CA2:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08118CA8: .4byte sub_8118B30
	thumb_func_end sub_8118BD8

	thumb_func_start sub_8118CAC
sub_8118CAC: @ 8118CAC
	push {r4,lr}
	adds r4, r0, 0
	bl sub_8118724
	movs r0, 0x34
	ldrsh r1, [r4, r0]
	cmp r1, 0x5A
	beq _08118CC6
	movs r0, 0x87
	lsls r0, 1
	cmp r1, r0
	beq _08118CD0
	b _08118CE0
_08118CC6:
	movs r1, 0x2E
	ldrsh r0, [r4, r1]
	cmp r0, 0x1
	beq _08118CE0
	b _08118CD8
_08118CD0:
	movs r1, 0x2E
	ldrsh r0, [r4, r1]
	cmp r0, 0
	beq _08118CE0
_08118CD8:
	ldr r0, _08118CE8 @ =sub_8118BD8
	str r0, [r4, 0x1C]
	movs r0, 0
	strh r0, [r4, 0x32]
_08118CE0:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08118CE8: .4byte sub_8118BD8
	thumb_func_end sub_8118CAC

	thumb_func_start sub_8118CEC
sub_8118CEC: @ 8118CEC
	push {r4,lr}
	adds r4, r0, 0
	bl sub_8118724
	ldr r0, _08118D10 @ =0x02019000
	ldrb r0, [r0, 0x3]
	lsls r0, 27
	lsrs r0, 27
	cmp r0, 0
	beq _08118D04
	cmp r0, 0x1
	beq _08118D18
_08118D04:
	adds r0, r4, 0
	bl sub_8119224
	ldr r0, _08118D14 @ =sub_81189A8
	b _08118D20
	.align 2, 0
_08118D10: .4byte 0x02019000
_08118D14: .4byte sub_81189A8
_08118D18:
	adds r0, r4, 0
	bl sub_81193D4
	ldr r0, _08118D28 @ =sub_8118CAC
_08118D20:
	str r0, [r4, 0x1C]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08118D28: .4byte sub_8118CAC
	thumb_func_end sub_8118CEC

	thumb_func_start sub_8118D2C
sub_8118D2C: @ 8118D2C
	push {r4,r5,lr}
	adds r5, r0, 0
	bl sub_8118724
	ldrh r0, [r5, 0x32]
	subs r0, 0x1
	strh r0, [r5, 0x32]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0xF
	bne _08118D50
	ldr r4, _08118DB8 @ =0x02019000
	adds r4, 0x98
	ldr r0, [r4]
	ldr r1, _08118DBC @ =0xbf800000
	bl __mulsf3
	str r0, [r4]
_08118D50:
	movs r1, 0x32
	ldrsh r0, [r5, r1]
	cmp r0, 0
	bne _08118DDC
	movs r1, 0x2E
	ldrsh r0, [r5, r1]
	cmp r0, 0
	bne _08118DC4
	ldr r1, _08118DB8 @ =0x02019000
	adds r2, r1, 0
	adds r2, 0x7D
	movs r0, 0xFF
	strb r0, [r2]
	ldrb r2, [r1, 0x3]
	movs r0, 0x7F
	ands r0, r2
	strb r0, [r1, 0x3]
	adds r0, r5, 0
	adds r0, 0x2B
	ldrb r1, [r0]
	adds r1, 0x3
	lsls r1, 24
	lsrs r1, 24
	adds r0, r5, 0
	bl StartSpriteAnim
	adds r0, r5, 0
	bl sub_81186B8
	movs r0, 0x1E
	strh r0, [r5, 0x36]
	adds r0, r5, 0
	bl sub_811866C
	movs r1, 0x3A
	ldrsh r0, [r5, r1]
	movs r1, 0x1E
	bl __divsi3
	lsls r0, 16
	asrs r0, 16
	lsls r1, r0, 4
	subs r1, r0
	lsls r1, 1
	adds r1, 0xF
	strh r1, [r5, 0x3A]
	ldr r0, _08118DC0 @ =sub_8118834
	str r0, [r5, 0x1C]
	movs r0, 0x47
	bl m4aSongNumStartOrChange
	b _08118DDC
	.align 2, 0
_08118DB8: .4byte 0x02019000
_08118DBC: .4byte 0xbf800000
_08118DC0: .4byte sub_8118834
_08118DC4:
	adds r0, r5, 0
	adds r0, 0x2C
	ldrb r1, [r0]
	movs r2, 0x40
	orrs r1, r2
	strb r1, [r0]
	movs r0, 0x38
	bl m4aSongNumStart
	adds r0, r5, 0
	bl sub_811952C
_08118DDC:
	pop {r4,r5}
	pop {r0}
	bx r0
	thumb_func_end sub_8118D2C

	thumb_func_start sub_8118DE4
sub_8118DE4: @ 8118DE4
	push {r4-r7,lr}
	mov r7, r9
	mov r6, r8
	push {r6,r7}
	adds r7, r0, 0
	bl sub_8118724
	movs r0, 0
	strh r0, [r7, 0x32]
	adds r0, r7, 0
	bl sub_81186B8
	ldr r1, _08118E70 @ =gUnknown_083F8D90
	ldr r6, _08118E74 @ =0x02019000
	movs r0, 0x7E
	adds r0, r6
	mov r8, r0
	ldrb r0, [r0]
	lsls r0, 3
	adds r1, 0x4
	adds r0, r1
	ldr r0, [r0]
	ldr r1, [r6, 0x8]
	ands r0, r1
	cmp r0, 0
	bne _08118E7C
	adds r1, r6, 0
	adds r1, 0x7D
	movs r0, 0xFF
	strb r0, [r1]
	ldrb r1, [r6, 0x3]
	movs r0, 0x7F
	ands r0, r1
	strb r0, [r6, 0x3]
	adds r0, r7, 0
	adds r0, 0x2B
	ldrb r1, [r0]
	adds r1, 0x3
	lsls r1, 24
	lsrs r1, 24
	adds r0, r7, 0
	bl StartSpriteAnim
	adds r0, r7, 0
	bl sub_81186B8
	movs r0, 0x1E
	strh r0, [r7, 0x36]
	adds r0, r7, 0
	bl sub_811866C
	movs r1, 0x3A
	ldrsh r0, [r7, r1]
	movs r1, 0x1E
	bl __divsi3
	lsls r0, 16
	asrs r0, 16
	lsls r1, r0, 4
	subs r1, r0
	lsls r1, 1
	adds r1, 0xF
	strh r1, [r7, 0x3A]
	ldr r0, _08118E78 @ =sub_8118834
	str r0, [r7, 0x1C]
	movs r0, 0x47
	bl m4aSongNumStartOrChange
	b _08118F74
	.align 2, 0
_08118E70: .4byte gUnknown_083F8D90
_08118E74: .4byte 0x02019000
_08118E78: .4byte sub_8118834
_08118E7C:
	movs r0, 0x38
	bl m4aSongNumStart
	bl Random
	movs r2, 0x1
	mov r9, r2
	mov r1, r9
	ands r1, r0
	mov r9, r1
	cmp r1, 0
	beq _08118EC0
	adds r1, r6, 0
	adds r1, 0x8C
	ldr r0, _08118EB8 @ =0x00000000
	str r0, [r1]
	mov r2, r8
	ldrb r0, [r2]
	adds r0, 0x1
	movs r1, 0xC
	bl __modsi3
	lsls r1, r0, 24
	lsrs r2, r1, 24
	adds r1, r6, 0
	adds r1, 0x7F
	strb r0, [r1]
	ldr r5, _08118EBC @ =gUnknown_083F8DF4
	b _08118EF4
	.align 2, 0
_08118EB8: .4byte 0x00000000
_08118EBC: .4byte gUnknown_083F8DF4
_08118EC0:
	adds r4, r6, 0
	adds r4, 0x8C
	ldr r5, _08118F1C @ =gUnknown_083F8DF4
	ldrb r0, [r6, 0x4]
	lsls r0, 30
	lsrs r0, 25
	adds r1, r5, 0
	adds r1, 0x1C
	adds r0, r1
	ldr r1, [r0]
	adds r0, r1, 0
	bl __addsf3
	str r0, [r4]
	mov r0, r8
	ldrb r4, [r0]
	adds r0, r4, 0
	adds r0, 0xB
	movs r1, 0xC
	bl __modsi3
	lsls r0, 24
	lsrs r2, r0, 24
	adds r0, r6, 0
	adds r0, 0x7F
	strb r4, [r0]
_08118EF4:
	ldr r0, _08118F20 @ =gUnknown_083F8D90
	lsls r1, r2, 3
	adds r0, 0x4
	adds r1, r0
	ldr r2, _08118F24 @ =0x02019000
	ldr r1, [r1]
	ldr r0, [r2, 0x8]
	ands r1, r0
	cmp r1, 0
	beq _08118F28
	movs r0, 0x1
	strh r0, [r7, 0x2E]
	ldrb r0, [r2, 0x4]
	lsls r0, 30
	lsrs r0, 25
	adds r0, r5
	ldrb r0, [r0, 0x2]
	strh r0, [r7, 0x32]
	b _08118F64
	.align 2, 0
_08118F1C: .4byte gUnknown_083F8DF4
_08118F20: .4byte gUnknown_083F8D90
_08118F24: .4byte 0x02019000
_08118F28:
	strh r1, [r7, 0x2E]
	ldrb r1, [r2, 0x4]
	movs r0, 0x3
	ands r0, r1
	cmp r0, 0
	beq _08118F40
	lsls r0, r1, 30
	lsrs r0, 25
	adds r0, r5
	ldrb r0, [r0, 0x1]
	strh r0, [r7, 0x32]
	b _08118F64
_08118F40:
	lsls r0, r1, 30
	lsrs r0, 25
	adds r0, r5
	ldrb r0, [r0, 0x2]
	strh r0, [r7, 0x32]
	mov r1, r9
	cmp r1, 0
	beq _08118F5C
	adds r1, r2, 0
	adds r1, 0x8C
	ldr r0, _08118F58 @ =0x3f000000
	b _08118F62
	.align 2, 0
_08118F58: .4byte 0x3f000000
_08118F5C:
	adds r1, r2, 0
	adds r1, 0x8C
	ldr r0, _08118F80 @ =0xbfc00000
_08118F62:
	str r0, [r1]
_08118F64:
	adds r1, r2, 0
	adds r1, 0x98
	ldr r0, _08118F84 @ =0x3dae147b
	str r0, [r1]
	ldr r0, _08118F88 @ =prev_quest_read_x24_hm_usage
	str r0, [r7, 0x1C]
	movs r0, 0x5
	strh r0, [r7, 0x30]
_08118F74:
	pop {r3,r4}
	mov r8, r3
	mov r9, r4
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_08118F80: .4byte 0xbfc00000
_08118F84: .4byte 0x3dae147b
_08118F88: .4byte sub_8118D2C
	thumb_func_end sub_8118DE4

	thumb_func_start sub_8118F8C
sub_8118F8C: @ 8118F8C
	push {r4-r7,lr}
	mov r7, r9
	mov r6, r8
	push {r6,r7}
	adds r6, r0, 0
	bl sub_8118724
	ldr r5, _08119018 @ =0x02019000
	movs r0, 0x8C
	adds r0, r5
	mov r8, r0
	ldr r0, [r0]
	ldr r1, _0811901C @ =0x3f000000
	bl __gtsf2
	cmp r0, 0
	bgt _0811906E
	adds r0, r6, 0
	bl sub_81186B8
	adds r0, r6, 0
	bl sub_81186E8
	lsls r0, 16
	cmp r0, 0
	bne _08119030
	adds r1, r5, 0
	adds r1, 0x90
	ldr r0, _08119020 @ =0x00000000
	str r0, [r1]
	ldr r1, _08119024 @ =gUnknown_083F8DF4
	mov r9, r1
	ldrb r0, [r5, 0x4]
	lsls r7, r0, 30
	lsrs r0, r7, 25
	add r0, r9
	movs r4, 0x3
	ldrsb r4, [r0, r4]
	adds r0, r4, 0
	bl __floatsisf
	adds r5, r0, 0
	cmp r4, 0
	bge _08118FEC
	ldr r1, _08119028 @ =0x43800000
	bl __addsf3
	adds r5, r0, 0
_08118FEC:
	lsrs r0, r7, 25
	add r0, r9
	ldrb r0, [r0, 0x4]
	adds r0, 0x1
	bl __floatsisf
	adds r1, r0, 0
	adds r0, r5, 0
	bl __divsf3
	adds r1, r0, 0
	mov r2, r8
	ldr r0, [r2]
	bl __subsf3
	mov r1, r8
	str r0, [r1]
	movs r0, 0x4
	strh r0, [r6, 0x30]
	ldr r0, _0811902C @ =sub_8118DE4
	str r0, [r6, 0x1C]
	b _0811906E
	.align 2, 0
_08119018: .4byte 0x02019000
_0811901C: .4byte 0x3f000000
_08119020: .4byte 0x00000000
_08119024: .4byte gUnknown_083F8DF4
_08119028: .4byte 0x43800000
_0811902C: .4byte sub_8118DE4
_08119030:
	adds r6, r5, 0
	adds r6, 0x90
	ldr r0, [r6]
	ldr r4, _0811907C @ =0x00000000
	adds r1, r4, 0
	bl __nesf2
	cmp r0, 0
	beq _0811906E
	mov r2, r8
	ldr r0, [r2]
	adds r1, r4, 0
	bl __ltsf2
	cmp r0, 0
	bge _0811906E
	str r4, [r6]
	mov r0, r8
	str r4, [r0]
	adds r4, r5, 0
	adds r4, 0x98
	ldr r0, [r4]
	bl __extendsfdf2
	ldr r2, _08119080 @ =0x3ff33333
	ldr r3, _08119084 @ =0x33333333
	bl __divdf3
	bl __truncdfsf2
	str r0, [r4]
_0811906E:
	pop {r3,r4}
	mov r8, r3
	mov r9, r4
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_0811907C: .4byte 0x00000000
_08119080: .4byte 0x3ff33333
_08119084: .4byte 0x33333333
	thumb_func_end sub_8118F8C

	thumb_func_start sub_8119088
sub_8119088: @ 8119088
	push {r4-r7,lr}
	adds r6, r0, 0
	bl sub_8118724
	ldr r5, _08119120 @ =0x02019000
	adds r0, r5, 0
	adds r0, 0x94
	ldr r0, [r0]
	ldr r1, _08119124 @ =0x42200000
	bl __gtsf2
	cmp r0, 0
	bgt _0811911A
	adds r7, r5, 0
	adds r7, 0x98
	adds r0, r5, 0
	adds r0, 0x86
	movs r1, 0
	ldrsh r4, [r0, r1]
	adds r0, r4, 0
	bl __floatsisf
	adds r2, r0, 0
	cmp r4, 0
	bge _081190C2
	ldr r1, _08119128 @ =0x47800000
	bl __addsf3
	adds r2, r0, 0
_081190C2:
	ldr r0, _0811912C @ =0x40800000
	adds r1, r2, 0
	bl __divsf3
	bl __negsf2
	str r0, [r7]
	adds r7, r5, 0
	adds r7, 0x90
	adds r5, 0x8C
	adds r0, r4, 0
	bl __floatsisf
	adds r2, r0, 0
	cmp r4, 0
	bge _081190EA
	ldr r1, _08119128 @ =0x47800000
	bl __addsf3
	adds r2, r0, 0
_081190EA:
	ldr r0, [r5]
	adds r1, r2, 0
	bl __divsf3
	bl __negsf2
	str r0, [r7]
	adds r1, r6, 0
	adds r1, 0x2A
	movs r0, 0x2
	strb r0, [r1]
	adds r2, r6, 0
	adds r2, 0x3F
	ldrb r0, [r2]
	movs r1, 0x4
	orrs r0, r1
	movs r1, 0x11
	negs r1, r1
	ands r0, r1
	strb r0, [r2]
	movs r0, 0x3
	strh r0, [r6, 0x30]
	ldr r0, _08119130 @ =sub_8118F8C
	str r0, [r6, 0x1C]
_0811911A:
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_08119120: .4byte 0x02019000
_08119124: .4byte 0x42200000
_08119128: .4byte 0x47800000
_0811912C: .4byte 0x40800000
_08119130: .4byte sub_8118F8C
	thumb_func_end sub_8119088

	thumb_func_start sub_8119134
sub_8119134: @ 8119134
	push {r4-r7,lr}
	adds r6, r0, 0
	bl sub_8118724
	ldr r4, _081191DC @ =0x02019000
	adds r0, r4, 0
	adds r0, 0x94
	ldr r0, [r0]
	ldr r1, _081191E0 @ =0x42700000
	bl __gtsf2
	cmp r0, 0
	bgt _081191D4
	movs r0, 0x5D
	bl m4aSongNumStartOrChange
	adds r7, r4, 0
	adds r7, 0x98
	adds r0, r4, 0
	adds r0, 0x84
	movs r1, 0
	ldrsh r5, [r0, r1]
	adds r0, r5, 0
	bl __floatsisf
	adds r2, r0, 0
	cmp r5, 0
	bge _08119174
	ldr r1, _081191E4 @ =0x47800000
	bl __addsf3
	adds r2, r0, 0
_08119174:
	ldr r0, _081191E8 @ =0x41a00000
	adds r1, r2, 0
	bl __divsf3
	bl __negsf2
	str r0, [r7]
	adds r7, r4, 0
	adds r7, 0x90
	adds r0, r4, 0
	adds r0, 0x8C
	ldr r1, [r0]
	ldr r0, _081191EC @ =0x3f800000
	bl __subsf3
	adds r4, r0, 0
	adds r0, r5, 0
	bl __floatsisf
	adds r2, r0, 0
	cmp r5, 0
	bge _081191A8
	ldr r1, _081191E4 @ =0x47800000
	bl __addsf3
	adds r2, r0, 0
_081191A8:
	adds r0, r4, 0
	adds r1, r2, 0
	bl __divsf3
	str r0, [r7]
	adds r1, r6, 0
	adds r1, 0x2A
	movs r0, 0x1
	strb r0, [r1]
	adds r2, r6, 0
	adds r2, 0x3F
	ldrb r0, [r2]
	movs r1, 0x4
	orrs r0, r1
	movs r1, 0x11
	negs r1, r1
	ands r0, r1
	strb r0, [r2]
	movs r0, 0x2
	strh r0, [r6, 0x30]
	ldr r0, _081191F0 @ =sub_8119088
	str r0, [r6, 0x1C]
_081191D4:
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_081191DC: .4byte 0x02019000
_081191E0: .4byte 0x42700000
_081191E4: .4byte 0x47800000
_081191E8: .4byte 0x41a00000
_081191EC: .4byte 0x3f800000
_081191F0: .4byte sub_8119088
	thumb_func_end sub_8119134

	thumb_func_start sub_81191F4
sub_81191F4: @ 81191F4
	push {r4,lr}
	adds r4, r0, 0
	movs r1, 0
	movs r0, 0x1
	strh r0, [r4, 0x30]
	strh r1, [r4, 0x32]
	adds r0, r4, 0
	bl sub_8118724
	adds r2, r4, 0
	adds r2, 0x3E
	ldrb r1, [r2]
	movs r0, 0x5
	negs r0, r0
	ands r0, r1
	strb r0, [r2]
	ldr r0, _08119220 @ =sub_8119134
	str r0, [r4, 0x1C]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08119220: .4byte sub_8119134
	thumb_func_end sub_81191F4

	thumb_func_start sub_8119224
sub_8119224: @ 8119224
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	sub sp, 0x8
	adds r7, r0, 0
	ldr r1, _081193B8 @ =gUnknown_083FA60E
	mov r0, sp
	movs r2, 0x8
	bl memcpy
	ldrh r0, [r7, 0x3C]
	subs r0, 0x2
	lsls r0, 16
	lsrs r0, 16
	mov r9, r0
	ldr r5, _081193BC @ =0x02019000
	ldr r0, _081193C0 @ =gSpriteTemplate_83FA50C
	movs r2, 0xC
	negs r2, r2
	movs r1, 0x24
	movs r3, 0x32
	bl CreateSprite
	adds r1, r5, 0
	adds r1, 0x73
	strb r0, [r1]
	ldr r4, _081193C4 @ =gSpriteTemplate_83FA5C0
	movs r0, 0x2E
	ldrsh r2, [r7, r0]
	lsls r2, 2
	mov r1, sp
	adds r0, r1, r2
	movs r3, 0
	ldrsh r1, [r0, r3]
	mov r0, sp
	adds r0, 0x2
	adds r0, r2
	movs r3, 0
	ldrsh r2, [r0, r3]
	adds r0, r4, 0
	movs r3, 0x3B
	bl CreateSprite
	adds r1, r5, 0
	adds r1, 0x74
	strb r0, [r1]
	adds r4, 0x18
	adds r0, r4, 0
	movs r1, 0x24
	movs r2, 0x8C
	movs r3, 0x33
	bl CreateSprite
	adds r1, r5, 0
	adds r1, 0x75
	strb r0, [r1]
	ldr r3, _081193C8 @ =gSprites
	ldrb r1, [r1]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r3
	ldrb r2, [r0, 0x1]
	movs r1, 0xD
	negs r1, r1
	ands r1, r2
	movs r2, 0x4
	orrs r1, r2
	strb r1, [r0, 0x1]
	movs r6, 0
	adds r4, r3, 0
	mov r12, r5
	ldr r0, _081193CC @ =gUnknown_083F8DF4
	mov r8, r0
	mov r10, r12
_081192BE:
	mov r1, r12
	adds r3, r1, r6
	adds r3, 0x73
	ldrb r0, [r3]
	lsls r1, r0, 4
	adds r1, r0
	lsls r1, 2
	adds r1, r4
	adds r1, 0x3E
	ldrb r2, [r1]
	movs r0, 0x3
	negs r0, r0
	ands r0, r2
	strb r0, [r1]
	ldrb r1, [r3]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r4
	adds r0, 0x3E
	ldrb r1, [r0]
	movs r2, 0x4
	orrs r1, r2
	strb r1, [r0]
	ldrb r1, [r3]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r4
	adds r0, 0x2C
	ldrb r1, [r0]
	movs r2, 0x40
	orrs r1, r2
	strb r1, [r0]
	ldrb r1, [r3]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r4
	adds r0, 0x2C
	ldrb r1, [r0]
	movs r2, 0x80
	orrs r1, r2
	strb r1, [r0]
	ldrb r1, [r3]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r4
	mov r1, r12
	adds r1, 0x73
	ldrb r1, [r1]
	strh r1, [r0, 0x36]
	ldrb r1, [r3]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r4
	mov r5, r12
	adds r5, 0x74
	ldrb r1, [r5]
	strh r1, [r0, 0x38]
	ldrb r1, [r3]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r4
	mov r1, r12
	adds r1, 0x75
	ldrb r1, [r1]
	strh r1, [r0, 0x3A]
	ldrb r1, [r3]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r4
	mov r1, r9
	strh r1, [r0, 0x32]
	ldrb r0, [r3]
	lsls r2, r0, 4
	adds r2, r0
	lsls r2, 2
	adds r2, r4
	movs r0, 0x3C
	ldrsh r3, [r7, r0]
	mov r0, r12
	ldrb r1, [r0, 0x4]
	lsls r1, 30
	lsrs r0, r1, 25
	add r0, r8
	ldrb r0, [r0, 0x1]
	muls r3, r0
	lsrs r1, 25
	add r1, r8
	ldrb r0, [r1, 0x2]
	ldr r1, _081193D0 @ =0x0000ffff
	adds r0, r1
	adds r3, r0
	strh r3, [r2, 0x34]
	adds r0, r6, 0x1
	lsls r0, 24
	lsrs r6, r0, 24
	ldr r2, _081193C8 @ =gSprites
	cmp r6, 0x2
	bls _081192BE
	ldrb r1, [r5]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r2
	adds r0, 0x3E
	ldrb r1, [r0]
	movs r2, 0x2
	orrs r1, r2
	strb r1, [r0]
	mov r3, r10
	str r7, [r3, 0x38]
	add sp, 0x8
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_081193B8: .4byte gUnknown_083FA60E
_081193BC: .4byte 0x02019000
_081193C0: .4byte gSpriteTemplate_83FA50C
_081193C4: .4byte gSpriteTemplate_83FA5C0
_081193C8: .4byte gSprites
_081193CC: .4byte gUnknown_083F8DF4
_081193D0: .4byte 0x0000ffff
	thumb_func_end sub_8119224

	thumb_func_start sub_81193D4
sub_81193D4: @ 81193D4
	push {r4-r7,lr}
	mov r7, r9
	mov r6, r8
	push {r6,r7}
	sub sp, 0x8
	adds r7, r0, 0
	movs r0, 0
	mov r8, r0
	ldr r1, _08119514 @ =gUnknown_083FA616
	mov r0, sp
	movs r2, 0x8
	bl memcpy
	ldrh r0, [r7, 0x3C]
	subs r0, 0x2
	lsls r0, 16
	lsrs r0, 16
	mov r9, r0
	ldr r0, _08119518 @ =gSpriteTemplate_83FA524
	movs r1, 0x2E
	ldrsh r2, [r7, r1]
	lsls r2, 2
	mov r3, sp
	adds r1, r3, r2
	movs r3, 0
	ldrsh r1, [r1, r3]
	mov r4, sp
	adds r4, 0x2
	adds r2, r4, r2
	movs r3, 0
	ldrsh r2, [r2, r3]
	movs r3, 0x32
	bl CreateSprite
	ldr r6, _0811951C @ =0x02019000
	adds r1, r6, 0
	adds r1, 0x73
	strb r0, [r1]
	ldrb r1, [r1]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	ldr r5, _08119520 @ =gSprites
	adds r0, r5
	ldrh r1, [r7, 0x2E]
	lsls r1, 24
	lsrs r1, 24
	bl StartSpriteAnim
	ldr r0, _08119524 @ =gSpriteTemplate_83FA5F0
	movs r1, 0x2E
	ldrsh r2, [r7, r1]
	lsls r2, 2
	mov r3, sp
	adds r1, r3, r2
	movs r3, 0
	ldrsh r1, [r1, r3]
	adds r4, r2
	movs r3, 0
	ldrsh r2, [r4, r3]
	movs r3, 0x33
	bl CreateSprite
	adds r4, r6, 0
	adds r4, 0x74
	strb r0, [r4]
	ldrb r1, [r4]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r5
	adds r0, 0x2C
	ldrb r1, [r0]
	movs r2, 0x80
	orrs r1, r2
	strb r1, [r0]
	ldrb r1, [r4]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r5
	adds r0, 0x2C
	ldrb r1, [r0]
	movs r2, 0x40
	orrs r1, r2
	strb r1, [r0]
	mov r0, r9
	lsls r2, r0, 16
	asrs r2, 16
	ldr r3, _08119528 @ =gUnknown_083F8DF4
	ldrb r1, [r6, 0x4]
	lsls r1, 30
	lsrs r0, r1, 25
	adds r0, r3
	ldrb r0, [r0, 0x1]
	muls r2, r0
	lsrs r1, 25
	adds r1, r3
	ldrh r0, [r1, 0x10]
	adds r0, 0x2D
	adds r2, r0
	strh r2, [r7, 0x3C]
	adds r3, r6, 0
_081194A2:
	mov r1, r8
	adds r2, r6, r1
	adds r2, 0x73
	ldrb r1, [r2]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r5
	adds r1, r6, 0
	adds r1, 0x73
	ldrb r1, [r1]
	strh r1, [r0, 0x36]
	ldrb r1, [r2]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r5
	ldrb r1, [r4]
	strh r1, [r0, 0x38]
	ldrb r1, [r2]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r5
	ldrb r1, [r4]
	strh r1, [r0, 0x3A]
	ldrb r1, [r2]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r5
	mov r1, r9
	strh r1, [r0, 0x32]
	ldrb r0, [r2]
	lsls r1, r0, 4
	adds r1, r0
	lsls r1, 2
	adds r1, r5
	ldrh r0, [r7, 0x3C]
	subs r0, 0x2D
	strh r0, [r1, 0x34]
	mov r0, r8
	adds r0, 0x1
	lsls r0, 24
	lsrs r0, 24
	mov r8, r0
	cmp r0, 0x1
	bls _081194A2
	str r7, [r3, 0x38]
	add sp, 0x8
	pop {r3,r4}
	mov r8, r3
	mov r9, r4
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_08119514: .4byte gUnknown_083FA616
_08119518: .4byte gSpriteTemplate_83FA524
_0811951C: .4byte 0x02019000
_08119520: .4byte gSprites
_08119524: .4byte gSpriteTemplate_83FA5F0
_08119528: .4byte gUnknown_083F8DF4
	thumb_func_end sub_81193D4

	thumb_func_start sub_811952C
sub_811952C: @ 811952C
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	sub sp, 0x14
	mov r8, r0
	movs r0, 0
	mov r10, r0
	movs r1, 0x5
	mov r9, r1
	movs r2, 0
	str r2, [sp, 0xC]
	mov r0, sp
	movs r1, 0
	movs r2, 0xA
	bl memset
	bl Random
	lsls r0, 16
	lsrs r0, 16
	str r0, [sp, 0x10]
	ldr r7, _08119610 @ =0x02019000
	adds r0, r7, 0
	adds r0, 0x7D
	movs r6, 0x1
	strb r6, [r0]
	ldrb r4, [r7, 0x3]
	movs r0, 0x20
	orrs r4, r0
	movs r0, 0x41
	negs r0, r0
	ands r4, r0
	strb r4, [r7, 0x3]
	adds r1, r7, 0
	adds r1, 0x7E
	movs r0, 0xFF
	strb r0, [r1]
	adds r5, r7, 0
	adds r5, 0x88
	mov r3, r8
	movs r1, 0x34
	ldrsh r0, [r3, r1]
	bl __floatsisf
	str r0, [r5]
	adds r1, r7, 0
	adds r1, 0x98
	ldr r0, _08119614 @ =0x00000000
	str r0, [r1]
	adds r3, r7, 0
	adds r3, 0x8C
	ldr r2, _08119618 @ =gUnknown_083F8DF4
	ldrb r0, [r7, 0x4]
	lsls r0, 30
	lsrs r1, r0, 25
	adds r2, 0x1C
	adds r1, r2
	ldr r1, [r1]
	str r1, [r3]
	lsrs r0, 30
	lsls r1, r0, 4
	subs r1, r0
	lsls r1, 1
	adds r1, 0x21
	lsls r4, 27
	lsrs r4, 27
	subs r6, r4
	lsls r0, r6, 4
	subs r0, r6
	adds r1, r0
	lsls r1, 16
	lsrs r1, 16
	mov r5, r10
	mov r3, r8
	movs r0, 0x34
	ldrsh r2, [r3, r0]
_081195C8:
	cmp r1, r2
	bge _081195D4
	adds r0, r1, 0
	adds r0, 0x5A
	cmp r2, r0
	ble _08119638
_081195D4:
	cmp r5, 0x3
	beq _0811961C
	adds r0, r1, 0
	adds r0, 0x5A
	lsls r0, 16
	lsrs r1, r0, 16
	adds r0, r5, 0x1
	lsls r0, 24
	lsrs r5, r0, 24
	cmp r5, 0x3
	bls _081195C8
_081195EA:
	ldr r0, _08119610 @ =0x02019000
	ldrb r1, [r0, 0x3]
	movs r0, 0x1F
	ands r0, r1
	cmp r0, 0
	beq _08119664
	mov r1, r8
	movs r2, 0x2E
	ldrsh r0, [r1, r2]
	cmp r0, 0
	beq _08119658
	movs r0, 0x98
	lsls r0, 1
	movs r1, 0x3F
	negs r1, r1
	bl PlayCry1
	b _08119670
	.align 2, 0
_08119610: .4byte 0x02019000
_08119614: .4byte 0x00000000
_08119618: .4byte gUnknown_083F8DF4
_0811961C:
	movs r0, 0x1
	mov r3, r8
	strh r0, [r3, 0x2E]
	ldr r2, _08119634 @ =0x02019000
	ldrb r1, [r2, 0x3]
	subs r0, 0x21
	ands r0, r1
	movs r1, 0x1
	orrs r0, r1
	strb r0, [r2, 0x3]
	b _081195EA
	.align 2, 0
_08119634: .4byte 0x02019000
_08119638:
	lsrs r0, r5, 1
	mov r1, r8
	strh r0, [r1, 0x2E]
	ldr r3, _08119654 @ =0x02019000
	movs r1, 0x1
	ands r1, r5
	ldrb r2, [r3, 0x3]
	movs r0, 0x20
	negs r0, r0
	ands r0, r2
	orrs r0, r1
	strb r0, [r3, 0x3]
	b _081195EA
	.align 2, 0
_08119654: .4byte 0x02019000
_08119658:
	movs r0, 0x98
	lsls r0, 1
	movs r1, 0x3F
	bl PlayCry1
	b _08119670
_08119664:
	movs r0, 0x99
	lsls r0, 1
	movs r1, 0x3F
	negs r1, r1
	bl PlayCry1
_08119670:
	movs r5, 0x2
	ldr r4, _081196A0 @ =0x02019000
	adds r0, r4, 0
	adds r0, 0x7F
	ldrb r0, [r0]
	adds r0, 0x2
	movs r1, 0xC
	bl __modsi3
	lsls r0, 24
	lsrs r3, r0, 24
	ldrb r1, [r4, 0x3]
	movs r0, 0x1F
	ands r0, r1
	cmp r0, 0x1
	bne _081196A4
	ldrb r1, [r4, 0x4]
	movs r0, 0x3
	ands r0, r1
	cmp r0, 0x1
	bne _081196A4
	mov r0, r9
	adds r0, 0x6
	b _081196A8
	.align 2, 0
_081196A0: .4byte 0x02019000
_081196A4:
	mov r2, r9
	adds r0, r2, r5
_081196A8:
	lsls r0, 24
	lsrs r0, 24
	mov r9, r0
	cmp r5, r9
	bcs _0811970E
	ldr r6, _08119734 @ =0x02019000
	ldr r7, _08119738 @ =gUnknown_083F8C0C
_081196B6:
	lsls r0, r3, 3
	ldr r1, _0811973C @ =gUnknown_083F8D94
	adds r0, r1
	ldr r1, [r6, 0x8]
	ldr r2, [r0]
	ands r1, r2
	cmp r1, 0
	bne _081196F8
	mov r0, r10
	adds r1, r0, 0x1
	lsls r1, 24
	lsrs r1, 24
	mov r10, r1
	add r0, sp
	strb r5, [r0]
	ldr r0, [sp, 0xC]
	cmp r0, 0
	bne _081196F8
	ldrb r0, [r6, 0x1A]
	lsls r0, 28
	lsrs r0, 28
	ldr r1, _08119740 @ =0x0201901b
	adds r0, r1
	ldrb r1, [r0]
	lsls r0, r1, 2
	adds r0, r1
	lsls r0, 2
	adds r0, r7
	ldr r0, [r0]
	ands r2, r0
	cmp r2, 0
	beq _081196F8
	str r5, [sp, 0xC]
_081196F8:
	adds r0, r3, 0x1
	movs r1, 0xC
	bl __modsi3
	lsls r0, 24
	lsrs r3, r0, 24
	adds r0, r5, 0x1
	lsls r0, 24
	lsrs r5, r0, 24
	cmp r5, r9
	bcc _081196B6
_0811970E:
	ldrb r0, [r4, 0x3]
	lsls r0, 27
	lsrs r0, 27
	adds r0, 0x1
	ldrb r1, [r4, 0x2]
	ands r0, r1
	cmp r0, 0
	beq _08119756
	ldr r2, [sp, 0xC]
	cmp r2, 0
	beq _08119744
	movs r0, 0xFF
	ldr r3, [sp, 0x10]
	ands r0, r3
	cmp r0, 0xBF
	bhi _08119744
	mov r0, r8
	strh r2, [r0, 0x3C]
	b _08119766
	.align 2, 0
_08119734: .4byte 0x02019000
_08119738: .4byte gUnknown_083F8C0C
_0811973C: .4byte gUnknown_083F8D94
_08119740: .4byte 0x0201901b
_08119744:
	ldr r0, [sp, 0x10]
	mov r1, r10
	bl __modsi3
	add r0, sp
	ldrb r0, [r0]
	mov r1, r8
	strh r0, [r1, 0x3C]
	b _08119766
_08119756:
	ldr r0, [sp, 0x10]
	mov r1, r10
	bl __modsi3
	add r0, sp
	ldrb r0, [r0]
	mov r2, r8
	strh r0, [r2, 0x3C]
_08119766:
	ldr r3, _0811977C @ =sub_8118CEC
	mov r0, r8
	str r3, [r0, 0x1C]
	add sp, 0x14
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_0811977C: .4byte sub_8118CEC
	thumb_func_end sub_811952C

	thumb_func_start sub_8119780
sub_8119780: @ 8119780
	push {r4,lr}
	adds r2, r0, 0
	ldrh r0, [r2, 0x30]
	adds r1, r0, 0x1
	strh r1, [r2, 0x30]
	lsls r0, 16
	asrs r0, 16
	movs r3, 0x34
	ldrsh r1, [r2, r3]
	cmp r0, r1
	blt _081197CA
	ldrh r0, [r2, 0x20]
	subs r0, 0x2
	strh r0, [r2, 0x20]
	lsls r0, 16
	asrs r0, 16
	movs r1, 0x10
	negs r1, r1
	cmp r0, r1
	bge _081197CA
	ldr r4, _081197D0 @ =0x02019000
	ldrb r1, [r4, 0x3]
	movs r0, 0x40
	ands r0, r1
	cmp r0, 0
	bne _081197BA
	movs r0, 0x40
	orrs r0, r1
	strb r0, [r4, 0x3]
_081197BA:
	adds r0, r2, 0
	bl DestroySprite
	movs r0, 0
	strb r0, [r4, 0x1]
	ldr r0, _081197D4 @ =gUnknown_083FA61E
	ldrh r0, [r0]
	strh r0, [r4, 0x34]
_081197CA:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_081197D0: .4byte 0x02019000
_081197D4: .4byte gUnknown_083FA61E
	thumb_func_end sub_8119780

	thumb_func_start sub_81197D8
sub_81197D8: @ 81197D8
	push {r4,lr}
	sub sp, 0x18
	adds r4, r0, 0
	ldr r1, _08119854 @ =gUnknown_083FA632
	mov r0, sp
	movs r2, 0x18
	bl memcpy
	ldrh r0, [r4, 0x30]
	adds r2, r0, 0x1
	strh r2, [r4, 0x30]
	lsls r0, 16
	asrs r0, 16
	movs r3, 0x34
	ldrsh r1, [r4, r3]
	cmp r0, r1
	bge _0811985C
	movs r0, 0x1
	ands r2, r0
	cmp r2, 0
	beq _08119836
	ldr r3, _08119858 @ =gSpriteCoordOffsetY
	movs r0, 0x3C
	ldrsh r2, [r4, r0]
	lsls r2, 1
	movs r1, 0x32
	ldrsh r0, [r4, r1]
	lsrs r1, r0, 31
	adds r0, r1
	asrs r0, 1
	lsls r0, 3
	adds r2, r0
	mov r1, sp
	adds r0, r1, r2
	ldrh r0, [r0]
	strh r0, [r3]
	movs r3, 0x3C
	ldrsh r2, [r4, r3]
	adds r1, r2, 0x1
	adds r0, r1, 0
	cmp r1, 0
	bge _0811982E
	adds r0, r2, 0x4
_0811982E:
	asrs r0, 2
	lsls r0, 2
	subs r0, r1, r0
	strh r0, [r4, 0x3C]
_08119836:
	adds r3, r4, 0
	adds r3, 0x3E
	ldrb r2, [r3]
	lsls r0, r2, 29
	lsrs r0, 31
	movs r1, 0x1
	eors r1, r0
	lsls r1, 2
	movs r0, 0x5
	negs r0, r0
	ands r0, r2
	orrs r0, r1
	strb r0, [r3]
	b _08119884
	.align 2, 0
_08119854: .4byte gUnknown_083FA632
_08119858: .4byte gSpriteCoordOffsetY
_0811985C:
	ldr r1, _0811988C @ =gSpriteCoordOffsetY
	movs r0, 0
	strh r0, [r1]
	ldr r2, _08119890 @ =gSprites
	ldr r0, _08119894 @ =0x02019000
	adds r0, 0x73
	ldrb r1, [r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r2
	adds r0, 0x2C
	ldrb r2, [r0]
	movs r1, 0x41
	negs r1, r1
	ands r1, r2
	strb r1, [r0]
	adds r0, r4, 0
	bl DestroySprite
_08119884:
	add sp, 0x18
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0811988C: .4byte gSpriteCoordOffsetY
_08119890: .4byte gSprites
_08119894: .4byte 0x02019000
	thumb_func_end sub_81197D8

	thumb_func_start sub_8119898
sub_8119898: @ 8119898
	push {r4,r5,lr}
	adds r5, r0, 0
	ldrh r0, [r5, 0x30]
	adds r0, 0x1
	strh r0, [r5, 0x30]
	movs r1, 0x30
	ldrsh r0, [r5, r1]
	bl __floatsisf
	adds r4, r0, 0
	ldr r1, _08119948 @ =0x3d1fbe77
	bl __mulsf3
	adds r1, r4, 0
	bl __mulsf3
	bl __fixsfsi
	strh r0, [r5, 0x26]
	ldr r3, _0811994C @ =0x02019000
	ldr r2, _08119950 @ =gUnknown_083FA61E
	ldrb r0, [r3, 0x1]
	subs r0, 0x1
	lsrs r1, r0, 31
	adds r0, r1
	asrs r0, 1
	lsls r0, 1
	adds r0, r2
	ldrh r0, [r0]
	strh r0, [r3, 0x34]
	ldrb r0, [r3, 0x1]
	cmp r0, 0x12
	bhi _081198DE
	adds r0, 0x1
	strb r0, [r3, 0x1]
_081198DE:
	movs r1, 0x30
	ldrsh r0, [r5, r1]
	cmp r0, 0x3C
	ble _08119940
	movs r0, 0
	strh r0, [r5, 0x30]
	ldr r3, _08119954 @ =sub_8119780
	str r3, [r5, 0x1C]
	ldr r2, _08119958 @ =gSprites
	movs r0, 0x3A
	ldrsh r1, [r5, r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r4, r2, 0
	adds r4, 0x1C
	adds r0, r4
	str r3, [r0]
	movs r0, 0x3A
	ldrsh r1, [r5, r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r2
	ldr r1, _0811995C @ =0x0000fffe
	strh r1, [r0, 0x30]
	movs r0, 0x38
	ldrsh r1, [r5, r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r2
	adds r0, 0x3E
	ldrb r2, [r0]
	movs r1, 0x5
	negs r1, r1
	ands r1, r2
	strb r1, [r0]
	movs r0, 0x38
	ldrsh r1, [r5, r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r4
	ldr r1, _08119960 @ =sub_81197D8
	str r1, [r0]
	movs r0, 0xD6
	bl m4aSongNumStart
_08119940:
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_08119948: .4byte 0x3d1fbe77
_0811994C: .4byte 0x02019000
_08119950: .4byte gUnknown_083FA61E
_08119954: .4byte sub_8119780
_08119958: .4byte gSprites
_0811995C: .4byte 0x0000fffe
_08119960: .4byte sub_81197D8
	thumb_func_end sub_8119898

	thumb_func_start sub_8119964
sub_8119964: @ 8119964
	push {r4,lr}
	adds r4, r0, 0
	movs r1, 0x3C
	ldrsh r0, [r4, r1]
	cmp r0, 0
	bne _081199E4
	ldr r3, _08119990 @ =0x02019000
	ldr r1, [r3, 0x38]
	movs r2, 0x2E
	ldrsh r0, [r1, r2]
	cmp r0, 0
	bne _08119998
	movs r0, 0x34
	ldrsh r2, [r1, r0]
	ldr r1, _08119994 @ =gUnknown_083F8DF4
	ldrb r0, [r3, 0x4]
	lsls r0, 30
	lsrs r0, 25
	adds r0, r1
	ldrh r0, [r0, 0x8]
	b _081199AA
	.align 2, 0
_08119990: .4byte 0x02019000
_08119994: .4byte gUnknown_083F8DF4
_08119998:
	movs r0, 0x34
	ldrsh r2, [r1, r0]
	ldr r1, _081199D8 @ =gUnknown_083F8DF4
	ldrb r0, [r3, 0x4]
	lsls r0, 30
	lsrs r0, 25
	adds r0, r1
	ldrh r0, [r0, 0x8]
	adds r0, 0xB4
_081199AA:
	cmp r2, r0
	bne _08119A78
	adds r2, r4, 0
	adds r2, 0x3E
	ldrb r1, [r2]
	movs r0, 0x5
	negs r0, r0
	ands r0, r1
	strb r0, [r2]
	ldrh r0, [r4, 0x3C]
	adds r0, 0x1
	strh r0, [r4, 0x3C]
	movs r0, 0x2B
	bl m4aSongNumStart
	ldr r1, _081199DC @ =0x02019000
	movs r0, 0x1
	strb r0, [r1, 0x1]
	ldr r0, _081199E0 @ =gUnknown_083FA61E
	ldrh r0, [r0]
	strh r0, [r1, 0x34]
	b _08119A78
	.align 2, 0
_081199D8: .4byte gUnknown_083F8DF4
_081199DC: .4byte 0x02019000
_081199E0: .4byte gUnknown_083FA61E
_081199E4:
	ldr r3, _08119A20 @ =0x02019000
	ldr r2, _08119A24 @ =gUnknown_083FA61E
	ldrb r0, [r3, 0x1]
	subs r0, 0x1
	lsrs r1, r0, 31
	adds r0, r1
	asrs r0, 1
	lsls r0, 1
	adds r0, r2
	ldrh r0, [r0]
	strh r0, [r3, 0x34]
	ldrb r0, [r3, 0x1]
	cmp r0, 0x12
	bhi _08119A04
	adds r0, 0x1
	strb r0, [r3, 0x1]
_08119A04:
	ldr r1, [r3, 0x38]
	movs r2, 0x2E
	ldrsh r0, [r1, r2]
	cmp r0, 0
	bne _08119A2C
	movs r0, 0x34
	ldrsh r2, [r1, r0]
	ldr r1, _08119A28 @ =gUnknown_083F8DF4
	ldrb r0, [r3, 0x4]
	lsls r0, 30
	lsrs r0, 25
	adds r0, r1
	ldrh r0, [r0, 0xA]
	b _08119A3E
	.align 2, 0
_08119A20: .4byte 0x02019000
_08119A24: .4byte gUnknown_083FA61E
_08119A28: .4byte gUnknown_083F8DF4
_08119A2C:
	movs r0, 0x34
	ldrsh r2, [r1, r0]
	ldr r1, _08119A80 @ =gUnknown_083F8DF4
	ldrb r0, [r3, 0x4]
	lsls r0, 30
	lsrs r0, 25
	adds r0, r1
	ldrh r0, [r0, 0xA]
	adds r0, 0xB4
_08119A3E:
	cmp r2, r0
	bne _08119A78
	ldr r2, _08119A84 @ =gSprites
	movs r0, 0x36
	ldrsh r1, [r4, r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r1, r2, 0
	adds r1, 0x1C
	adds r0, r1
	ldr r1, _08119A88 @ =sub_8119898
	str r1, [r0]
	movs r0, 0x36
	ldrsh r1, [r4, r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r2
	adds r0, 0x3E
	ldrb r2, [r0]
	movs r1, 0x5
	negs r1, r1
	ands r1, r2
	strb r1, [r0]
	ldr r0, _08119A8C @ =SpriteCallbackDummy
	str r0, [r4, 0x1C]
	movs r0, 0
	strh r0, [r4, 0x3C]
_08119A78:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08119A80: .4byte gUnknown_083F8DF4
_08119A84: .4byte gSprites
_08119A88: .4byte sub_8119898
_08119A8C: .4byte SpriteCallbackDummy
	thumb_func_end sub_8119964

	thumb_func_start sub_8119A90
sub_8119A90: @ 8119A90
	adds r0, 0x3E
	ldrb r3, [r0]
	lsls r1, r3, 29
	lsrs r1, 31
	movs r2, 0x1
	eors r2, r1
	lsls r2, 2
	movs r1, 0x5
	negs r1, r1
	ands r1, r3
	orrs r1, r2
	strb r1, [r0]
	bx lr
	thumb_func_end sub_8119A90

	thumb_func_start sub_8119AAC
sub_8119AAC: @ 8119AAC
	push {r4,r5,lr}
	adds r4, r0, 0
	ldrh r2, [r4, 0x22]
	movs r0, 0x22
	ldrsh r1, [r4, r0]
	movs r0, 0x10
	negs r0, r0
	cmp r1, r0
	ble _08119AC4
	subs r0, r2, 0x1
	strh r0, [r4, 0x22]
	b _08119B12
_08119AC4:
	ldr r0, _08119B18 @ =SpriteCallbackDummy
	str r0, [r4, 0x1C]
	adds r2, r4, 0
	adds r2, 0x3E
	ldrb r0, [r2]
	movs r1, 0x4
	orrs r0, r1
	strb r0, [r2]
	subs r2, 0x12
	ldrb r0, [r2]
	movs r1, 0x40
	orrs r0, r1
	strb r0, [r2]
	movs r0, 0x5E
	bl m4aSongNumStop
	adds r0, r4, 0
	bl DestroySprite
	ldr r5, _08119B1C @ =gSprites
	ldr r4, _08119B20 @ =0x02019000
	adds r4, 0x74
	ldrb r1, [r4]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r5
	ldrb r0, [r0, 0x3]
	lsls r0, 26
	lsrs r0, 27
	bl FreeOamMatrix
	ldrb r1, [r4]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r5
	bl DestroySprite
_08119B12:
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_08119B18: .4byte SpriteCallbackDummy
_08119B1C: .4byte gSprites
_08119B20: .4byte 0x02019000
	thumb_func_end sub_8119AAC

	thumb_func_start sub_8119B24
sub_8119B24: @ 8119B24
	push {r4,lr}
	adds r4, r0, 0
	ldrh r1, [r4, 0x30]
	movs r2, 0x30
	ldrsh r0, [r4, r2]
	cmp r0, 0
	blt _08119B4E
	subs r1, 0x1
	strh r1, [r4, 0x30]
	ldrh r0, [r4, 0x22]
	subs r0, 0x1
	strh r0, [r4, 0x22]
	lsls r1, 16
	cmp r1, 0
	bne _08119BB8
	adds r0, r4, 0
	adds r0, 0x2B
	ldrb r0, [r0]
	cmp r0, 0x1
	bne _08119BB8
	b _08119B74
_08119B4E:
	ldrh r1, [r4, 0x34]
	movs r2, 0x34
	ldrsh r0, [r4, r2]
	cmp r0, 0
	blt _08119B84
	subs r0, r1, 0x1
	strh r0, [r4, 0x34]
	adds r0, r4, 0
	adds r0, 0x2C
	ldrb r1, [r0]
	movs r0, 0x3F
	ands r0, r1
	cmp r0, 0
	bne _08119BB8
	adds r0, r4, 0
	adds r0, 0x2B
	ldrb r0, [r0]
	cmp r0, 0x1
	bne _08119B7C
_08119B74:
	ldrh r0, [r4, 0x26]
	adds r0, 0x1
	strh r0, [r4, 0x26]
	b _08119BB8
_08119B7C:
	ldrh r0, [r4, 0x26]
	subs r0, 0x1
	strh r0, [r4, 0x26]
	b _08119BB8
_08119B84:
	movs r0, 0x2B
	bl m4aSongNumStart
	ldr r0, _08119BC0 @ =0x02019000
	ldr r0, [r0, 0x38]
	ldrh r1, [r0, 0x2E]
	adds r1, 0x4
	lsls r1, 24
	lsrs r1, 24
	adds r0, r4, 0
	bl StartSpriteAnim
	ldr r0, _08119BC4 @ =sub_8119AAC
	str r0, [r4, 0x1C]
	ldr r2, _08119BC8 @ =gSprites
	movs r0, 0x3A
	ldrsh r1, [r4, r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r2
	adds r0, 0x2C
	ldrb r2, [r0]
	movs r1, 0x7F
	ands r1, r2
	strb r1, [r0]
_08119BB8:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08119BC0: .4byte 0x02019000
_08119BC4: .4byte sub_8119AAC
_08119BC8: .4byte gSprites
	thumb_func_end sub_8119B24

	thumb_func_start sub_8119BCC
sub_8119BCC: @ 8119BCC
	push {r4,r5,lr}
	sub sp, 0x14
	adds r4, r0, 0
	ldr r1, _08119C44 @ =gUnknown_083FA64A
	mov r0, sp
	movs r2, 0x2
	bl memcpy
	add r5, sp, 0x4
	ldr r1, _08119C48 @ =gUnknown_083FA64C
	adds r0, r5, 0
	movs r2, 0x10
	bl memcpy
	ldrh r0, [r4, 0x30]
	subs r1, r0, 0x1
	strh r1, [r4, 0x30]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x7
	ble _08119C5C
	ldr r0, _08119C4C @ =0x02019000
	ldr r0, [r0, 0x38]
	movs r1, 0x2E
	ldrsh r0, [r0, r1]
	add r0, sp
	ldrb r0, [r0]
	lsls r0, 24
	asrs r0, 24
	lsls r0, 1
	ldrh r2, [r4, 0x20]
	adds r0, r2
	strh r0, [r4, 0x20]
	bl IsSEPlaying
	lsls r0, 24
	cmp r0, 0
	beq _08119CF6
	movs r1, 0x20
	ldrsh r0, [r4, r1]
	movs r4, 0x74
	subs r4, r0
	lsrs r0, r4, 31
	adds r4, r0
	asrs r4, 1
	negs r4, r4
	ldr r0, _08119C50 @ =gMPlay_SE1
	ldr r5, _08119C54 @ =0x0000ffff
	lsls r4, 24
	asrs r4, 24
	adds r1, r5, 0
	adds r2, r4, 0
	bl m4aMPlayPanpotControl
	ldr r0, _08119C58 @ =gMPlay_SE2
	adds r1, r5, 0
	adds r2, r4, 0
	bl m4aMPlayPanpotControl
	b _08119CF6
	.align 2, 0
_08119C44: .4byte gUnknown_083FA64A
_08119C48: .4byte gUnknown_083FA64C
_08119C4C: .4byte 0x02019000
_08119C50: .4byte gMPlay_SE1
_08119C54: .4byte 0x0000ffff
_08119C58: .4byte gMPlay_SE2
_08119C5C:
	lsls r0, r1, 16
	cmp r0, 0
	blt _08119CAC
	ldr r0, _08119CA8 @ =0x02019000
	ldr r0, [r0, 0x38]
	movs r2, 0x2E
	ldrsh r0, [r0, r2]
	add r0, sp
	movs r2, 0
	ldrsb r2, [r0, r2]
	movs r1, 0x30
	ldrsh r0, [r4, r1]
	movs r1, 0x7
	subs r0, r1, r0
	lsls r0, 1
	adds r0, r5, r0
	ldrb r0, [r0]
	lsls r0, 24
	asrs r0, 24
	muls r0, r2
	ldrh r2, [r4, 0x20]
	adds r0, r2
	strh r0, [r4, 0x20]
	movs r2, 0x30
	ldrsh r0, [r4, r2]
	subs r1, r0
	lsls r1, 1
	mov r0, sp
	adds r0, 0x5
	adds r0, r1
	ldrb r0, [r0]
	lsls r0, 24
	asrs r0, 24
	ldrh r1, [r4, 0x22]
	adds r0, r1
	strh r0, [r4, 0x22]
	b _08119CF6
	.align 2, 0
_08119CA8: .4byte 0x02019000
_08119CAC:
	movs r0, 0x5E
	bl m4aSongNumStartOrChange
	ldr r0, _08119CCC @ =0x02019000
	ldr r0, [r0, 0x38]
	movs r2, 0x2E
	ldrsh r0, [r0, r2]
	cmp r0, 0
	bne _08119CD0
	movs r0, 0x98
	lsls r0, 1
	movs r1, 0x3F
	bl PlayCry1
	b _08119CDC
	.align 2, 0
_08119CCC: .4byte 0x02019000
_08119CD0:
	movs r0, 0x98
	lsls r0, 1
	movs r1, 0x3F
	negs r1, r1
	bl PlayCry1
_08119CDC:
	ldr r0, _08119D00 @ =0x02019000
	ldr r0, [r0, 0x38]
	ldrh r1, [r0, 0x2E]
	adds r1, 0x2
	lsls r1, 24
	lsrs r1, 24
	adds r0, r4, 0
	bl StartSpriteAnim
	movs r0, 0x2D
	strh r0, [r4, 0x30]
	ldr r0, _08119D04 @ =sub_8119B24
	str r0, [r4, 0x1C]
_08119CF6:
	add sp, 0x14
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_08119D00: .4byte 0x02019000
_08119D04: .4byte sub_8119B24
	thumb_func_end sub_8119BCC

	thumb_func_start sub_8119D08
sub_8119D08: @ 8119D08
	push {r4,lr}
	sub sp, 0x4
	adds r4, r0, 0
	ldr r1, _08119D64 @ =gUnknown_083FA64A
	mov r0, sp
	movs r2, 0x2
	bl memcpy
	ldrh r0, [r4, 0x30]
	subs r1, r0, 0x1
	strh r1, [r4, 0x30]
	lsls r0, 16
	cmp r0, 0
	blt _08119D70
	ldr r0, _08119D68 @ =0x02019000
	ldr r0, [r0, 0x38]
	movs r1, 0x2E
	ldrsh r0, [r0, r1]
	add r0, sp
	ldrb r0, [r0]
	lsls r0, 24
	asrs r0, 24
	lsls r0, 1
	ldrh r2, [r4, 0x20]
	adds r0, r2
	strh r0, [r4, 0x20]
	ldr r1, _08119D6C @ =gSprites
	movs r2, 0x3A
	ldrsh r0, [r4, r2]
	lsls r2, r0, 4
	adds r2, r0
	lsls r2, 2
	adds r2, r1
	adds r2, 0x3E
	ldrb r3, [r2]
	lsls r0, r3, 29
	lsrs r0, 31
	movs r1, 0x1
	eors r1, r0
	lsls r1, 2
	movs r0, 0x5
	negs r0, r0
	ands r0, r3
	orrs r0, r1
	strb r0, [r2]
	b _08119D74
	.align 2, 0
_08119D64: .4byte gUnknown_083FA64A
_08119D68: .4byte 0x02019000
_08119D6C: .4byte gSprites
_08119D70:
	ldr r0, _08119D7C @ =sub_8119A90
	str r0, [r4, 0x1C]
_08119D74:
	add sp, 0x4
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08119D7C: .4byte sub_8119A90
	thumb_func_end sub_8119D08

	thumb_func_start sub_8119D80
sub_8119D80: @ 8119D80
	push {r4,lr}
	adds r4, r0, 0
	ldr r3, _08119DB8 @ =0x02019000
	ldr r1, [r3, 0x38]
	movs r2, 0x2E
	ldrsh r0, [r1, r2]
	cmp r0, 0
	bne _08119DC4
	movs r0, 0x34
	ldrsh r2, [r1, r0]
	ldr r1, _08119DBC @ =gUnknown_083F8DF4
	ldrb r0, [r3, 0x4]
	lsls r0, 30
	lsrs r0, 25
	adds r0, r1
	ldrh r0, [r0, 0x12]
	adds r0, 0x5A
	cmp r2, r0
	bne _08119E26
	ldr r2, _08119DC0 @ =gSprites
	movs r0, 0x3A
	ldrsh r1, [r4, r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r2
	movs r3, 0x34
	b _08119DEE
	.align 2, 0
_08119DB8: .4byte 0x02019000
_08119DBC: .4byte gUnknown_083F8DF4
_08119DC0: .4byte gSprites
_08119DC4:
	movs r0, 0x34
	ldrsh r2, [r1, r0]
	ldr r1, _08119E2C @ =gUnknown_083F8DF4
	ldrb r0, [r3, 0x4]
	lsls r0, 30
	lsrs r0, 25
	adds r0, r1
	ldrh r0, [r0, 0x14]
	movs r1, 0x87
	lsls r1, 1
	adds r0, r1
	cmp r2, r0
	bne _08119E26
	ldr r2, _08119E30 @ =gSprites
	movs r0, 0x3A
	ldrsh r1, [r4, r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r2
	movs r3, 0x2E
_08119DEE:
	strh r3, [r0, 0x30]
	movs r0, 0x36
	ldrsh r1, [r4, r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r2
	strh r3, [r0, 0x30]
	movs r0, 0x3A
	ldrsh r1, [r4, r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r2, 0x1C
	adds r0, r2
	ldr r1, _08119E34 @ =sub_8119D08
	str r1, [r0]
	movs r0, 0x36
	ldrsh r1, [r4, r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r2
	ldr r1, _08119E38 @ =sub_8119BCC
	str r1, [r0]
	movs r0, 0x2B
	bl m4aSongNumStart
_08119E26:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08119E2C: .4byte gUnknown_083F8DF4
_08119E30: .4byte gSprites
_08119E34: .4byte sub_8119D08
_08119E38: .4byte sub_8119BCC
	thumb_func_end sub_8119D80

	.align 2, 0 @ Don't pad with nop.
