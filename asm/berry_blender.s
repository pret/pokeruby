	.include "constants/gba_constants.s"
	.include "constants/species_constants.s"
	.include "asm/macros.s"

	.syntax unified

	.text

	thumb_func_start sub_804E290
sub_804E290: @ 804E290
	push {lr}
	ldr r0, _0804E2B0 @ =gMPlay_SE2
	ldr r1, _0804E2B4 @ =0x0000ffff
	ldr r2, _0804E2B8 @ =gUnknown_03004854
	ldr r2, [r2]
	adds r2, 0x56
	movs r3, 0
	ldrsh r2, [r2, r3]
	subs r2, 0x80
	lsls r2, 17
	asrs r2, 16
	bl m4aMPlayPitchControl
	pop {r0}
	bx r0
	.align 2, 0
_0804E2B0: .4byte gMPlay_SE2
_0804E2B4: .4byte 0x0000ffff
_0804E2B8: .4byte gUnknown_03004854
	thumb_func_end sub_804E290

	thumb_func_start sub_804E2BC
sub_804E2BC: @ 804E2BC
	push {lr}
	bl sub_80514A4
	bl sub_80514F0
	bl LoadOam
	bl ProcessSpriteCopyRequests
	bl TransferPlttBuffer
	pop {r0}
	bx r0
	thumb_func_end sub_804E2BC

	thumb_func_start sub_804E2D8
sub_804E2D8: @ 804E2D8
	push {lr}
	bl LoadOam
	bl ProcessSpriteCopyRequests
	bl TransferPlttBuffer
	pop {r0}
	bx r0
	thumb_func_end sub_804E2D8

	thumb_func_start sub_804E2EC
sub_804E2EC: @ 804E2EC
	push {r4-r7,lr}
	ldr r1, _0804E308 @ =gUnknown_03004854
	ldr r0, [r1]
	ldrb r0, [r0, 0x1]
	mov r12, r1
	cmp r0, 0x9
	bls _0804E2FC
	b _0804E4F4
_0804E2FC:
	lsls r0, 2
	ldr r1, _0804E30C @ =_0804E310
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_0804E308: .4byte gUnknown_03004854
_0804E30C: .4byte _0804E310
	.align 2, 0
_0804E310:
	.4byte _0804E338
	.4byte _0804E34C
	.4byte _0804E380
	.4byte _0804E3C4
	.4byte _0804E3D8
	.4byte _0804E3EC
	.4byte _0804E410
	.4byte _0804E434
	.4byte _0804E48C
	.4byte _0804E4BC
_0804E338:
	ldr r0, _0804E344 @ =gUnknown_08E6C100
	ldr r1, _0804E348 @ =0x02010000
	bl sub_800D238
	b _0804E49E
	.align 2, 0
_0804E344: .4byte gUnknown_08E6C100
_0804E348: .4byte 0x02010000
_0804E34C:
	ldr r1, _0804E36C @ =gUnknown_08215C2C
	ldr r2, _0804E370 @ =0x06004000
	ldr r0, _0804E374 @ =0x040000d4
	str r1, [r0]
	str r2, [r0, 0x4]
	ldr r1, _0804E378 @ =0x80000200
	str r1, [r0, 0x8]
	ldr r0, [r0, 0x8]
	ldr r0, _0804E37C @ =gUnknown_08215C0C
	movs r2, 0x80
	lsls r2, 1
	movs r1, 0
	bl LoadPalette
	b _0804E49E
	.align 2, 0
_0804E36C: .4byte gUnknown_08215C2C
_0804E370: .4byte 0x06004000
_0804E374: .4byte 0x040000d4
_0804E378: .4byte 0x80000200
_0804E37C: .4byte gUnknown_08215C0C
_0804E380:
	ldr r3, _0804E3B8 @ =0x02010000
	movs r4, 0xC0
	lsls r4, 19
	movs r5, 0x80
	lsls r5, 6
	ldr r1, _0804E3BC @ =0x040000d4
	ldr r6, _0804E3C0 @ =0x80000800
	movs r2, 0x80
	lsls r2, 5
	movs r7, 0x80
	lsls r7, 24
_0804E396:
	str r3, [r1]
	str r4, [r1, 0x4]
	str r6, [r1, 0x8]
	ldr r0, [r1, 0x8]
	adds r3, r2
	adds r4, r2
	subs r5, r2
	cmp r5, r2
	bhi _0804E396
	str r3, [r1]
	str r4, [r1, 0x4]
	lsrs r0, r5, 1
	orrs r0, r7
	str r0, [r1, 0x8]
	ldr r0, [r1, 0x8]
	mov r0, r12
	b _0804E4A0
	.align 2, 0
_0804E3B8: .4byte 0x02010000
_0804E3BC: .4byte 0x040000d4
_0804E3C0: .4byte 0x80000800
_0804E3C4:
	ldr r0, _0804E3D0 @ =gUnknown_08E6C920
	ldr r1, _0804E3D4 @ =0x02010000
	bl sub_800D238
	b _0804E49E
	.align 2, 0
_0804E3D0: .4byte gUnknown_08E6C920
_0804E3D4: .4byte 0x02010000
_0804E3D8:
	ldr r0, _0804E3E4 @ =gUnknown_08E6D354
	ldr r1, _0804E3E8 @ =0x02013000
	bl sub_800D238
	b _0804E49E
	.align 2, 0
_0804E3E4: .4byte gUnknown_08E6D354
_0804E3E8: .4byte 0x02013000
_0804E3EC:
	ldr r1, _0804E400 @ =0x02010000
	ldr r2, _0804E404 @ =0x0600e000
	ldr r0, _0804E408 @ =0x040000d4
	str r1, [r0]
	str r2, [r0, 0x4]
	ldr r1, _0804E40C @ =0x80000800
	str r1, [r0, 0x8]
	ldr r0, [r0, 0x8]
	mov r0, r12
	b _0804E4A0
	.align 2, 0
_0804E400: .4byte 0x02010000
_0804E404: .4byte 0x0600e000
_0804E408: .4byte 0x040000d4
_0804E40C: .4byte 0x80000800
_0804E410:
	ldr r1, _0804E424 @ =0x02011000
	ldr r2, _0804E428 @ =0x0600f000
	ldr r0, _0804E42C @ =0x040000d4
	str r1, [r0]
	str r2, [r0, 0x4]
	ldr r1, _0804E430 @ =0x80000800
	str r1, [r0, 0x8]
	ldr r0, [r0, 0x8]
	mov r0, r12
	b _0804E4A0
	.align 2, 0
_0804E424: .4byte 0x02011000
_0804E428: .4byte 0x0600f000
_0804E42C: .4byte 0x040000d4
_0804E430: .4byte 0x80000800
_0804E434:
	ldr r3, _0804E474 @ =0x02013000
	movs r2, 0
	adds r6, r3, 0
	ldr r7, _0804E478 @ =gUnknown_0821602C
	movs r0, 0x80
	lsls r0, 1
	adds r5, r0, 0
	ldr r4, _0804E47C @ =0x0000027f
_0804E444:
	lsls r0, r2, 1
	adds r0, r3
	ldrh r1, [r0]
	orrs r1, r5
	strh r1, [r0]
	adds r0, r2, 0x1
	lsls r0, 16
	lsrs r2, r0, 16
	cmp r2, r4
	bls _0804E444
	ldr r1, _0804E480 @ =0x06006000
	ldr r0, _0804E484 @ =0x040000d4
	str r6, [r0]
	str r1, [r0, 0x4]
	ldr r1, _0804E488 @ =0x80000280
	str r1, [r0, 0x8]
	ldr r0, [r0, 0x8]
	adds r0, r7, 0
	movs r1, 0x80
	movs r2, 0x20
	bl LoadPalette
	b _0804E49E
	.align 2, 0
_0804E474: .4byte 0x02013000
_0804E478: .4byte gUnknown_0821602C
_0804E47C: .4byte 0x0000027f
_0804E480: .4byte 0x06006000
_0804E484: .4byte 0x040000d4
_0804E488: .4byte 0x80000280
_0804E48C:
	ldr r0, _0804E4AC @ =gUnknown_082163DC
	bl LoadSpriteSheet
	ldr r0, _0804E4B0 @ =gUnknown_082164F4
	bl LoadSpriteSheet
	ldr r0, _0804E4B4 @ =gUnknown_08216454
	bl LoadSpriteSheet
_0804E49E:
	ldr r0, _0804E4B8 @ =gUnknown_03004854
_0804E4A0:
	ldr r1, [r0]
	ldrb r0, [r1, 0x1]
	adds r0, 0x1
	strb r0, [r1, 0x1]
	b _0804E4F4
	.align 2, 0
_0804E4AC: .4byte gUnknown_082163DC
_0804E4B0: .4byte gUnknown_082164F4
_0804E4B4: .4byte gUnknown_08216454
_0804E4B8: .4byte gUnknown_03004854
_0804E4BC:
	ldr r0, _0804E4E0 @ =gUnknown_08216540
	bl LoadSpriteSheet
	ldr r0, _0804E4E4 @ =gUnknown_08216574
	bl LoadSpriteSheet
	ldr r0, _0804E4E8 @ =gUnknown_082163EC
	bl LoadSpritePalette
	ldr r0, _0804E4EC @ =gUnknown_082163E4
	bl LoadSpritePalette
	ldr r0, _0804E4F0 @ =gUnknown_03004854
	ldr r1, [r0]
	movs r0, 0
	strb r0, [r1, 0x1]
	movs r0, 0x1
	b _0804E4F6
	.align 2, 0
_0804E4E0: .4byte gUnknown_08216540
_0804E4E4: .4byte gUnknown_08216574
_0804E4E8: .4byte gUnknown_082163EC
_0804E4EC: .4byte gUnknown_082163E4
_0804E4F0: .4byte gUnknown_03004854
_0804E4F4:
	movs r0, 0
_0804E4F6:
	pop {r4-r7}
	pop {r1}
	bx r1
	thumb_func_end sub_804E2EC

	thumb_func_start sub_804E4FC
sub_804E4FC: @ 804E4FC
	movs r1, 0x80
	lsls r1, 19
	ldr r2, _0804E52C @ =0x00001341
	adds r0, r2, 0
	strh r0, [r1]
	adds r1, 0xC
	movs r2, 0x91
	lsls r2, 7
	adds r0, r2, 0
	strh r0, [r1]
	subs r1, 0x2
	ldr r2, _0804E530 @ =0x00000c0d
	adds r0, r2, 0
	strh r0, [r1]
	ldr r0, _0804E534 @ =REG_BG0HOFS
	movs r1, 0
	strh r1, [r0]
	adds r0, 0x2
	strh r1, [r0]
	adds r0, 0x2
	strh r1, [r0]
	adds r0, 0x2
	strh r1, [r0]
	bx lr
	.align 2, 0
_0804E52C: .4byte 0x00001341
_0804E530: .4byte 0x00000c0d
_0804E534: .4byte REG_BG0HOFS
	thumb_func_end sub_804E4FC

	thumb_func_start sub_804E538
sub_804E538: @ 804E538
	push {lr}
	ldr r1, _0804E55C @ =gUnknown_03004854
	ldr r0, _0804E560 @ =0x02018000
	str r0, [r1]
	adds r2, r0, 0
	adds r2, 0x6F
	movs r1, 0
	strb r1, [r0]
	strb r1, [r2]
	ldr r0, _0804E564 @ =gUnknown_0202E8CC
	ldrb r0, [r0]
	bl sub_804E884
	ldr r0, _0804E568 @ =sub_804E56C
	bl SetMainCallback2
	pop {r0}
	bx r0
	.align 2, 0
_0804E55C: .4byte gUnknown_03004854
_0804E560: .4byte 0x02018000
_0804E564: .4byte gUnknown_0202E8CC
_0804E568: .4byte sub_804E56C
	thumb_func_end sub_804E538

	thumb_func_start sub_804E56C
sub_804E56C: @ 804E56C
	push {r4-r6,lr}
	sub sp, 0x4
	ldr r0, _0804E588 @ =gUnknown_03004854
	ldr r0, [r0]
	ldrb r0, [r0]
	cmp r0, 0x6
	bls _0804E57C
	b _0804E71A
_0804E57C:
	lsls r0, 2
	ldr r1, _0804E58C @ =_0804E590
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_0804E588: .4byte gUnknown_03004854
_0804E58C: .4byte _0804E590
	.align 2, 0
_0804E590:
	.4byte _0804E5AC
	.4byte _0804E614
	.4byte _0804E67C
	.4byte _0804E692
	.4byte _0804E6A8
	.4byte _0804E6D4
	.4byte _0804E700
_0804E5AC:
	movs r0, 0x80
	lsls r0, 19
	movs r5, 0
	strh r5, [r0]
	bl ResetSpriteData
	bl FreeAllSpritePalettes
	movs r0, 0
	bl SetVBlankCallback
	ldr r4, _0804E60C @ =gWindowConfig_81E6F68
	adds r0, r4, 0
	bl SetUpWindowConfig
	adds r0, r4, 0
	bl InitMenuWindow
	ldr r3, _0804E610 @ =gUnknown_03004854
	ldr r2, [r3]
	ldrb r0, [r2]
	adds r0, 0x1
	movs r1, 0
	strb r0, [r2]
	ldr r2, [r3]
	movs r3, 0xA0
	lsls r3, 1
	adds r0, r2, r3
	strh r1, [r0]
	subs r3, 0x2
	adds r0, r2, r3
	strh r1, [r0]
	movs r0, 0xA1
	lsls r0, 1
	adds r3, r2, r0
	movs r0, 0x50
	strh r0, [r3]
	movs r3, 0xA2
	lsls r3, 1
	adds r0, r2, r3
	strh r1, [r0]
	adds r3, 0x2
	adds r0, r2, r3
	strh r1, [r0]
	strb r5, [r2, 0x1]
	bl sub_8051474
	b _0804E71A
	.align 2, 0
_0804E60C: .4byte gWindowConfig_81E6F68
_0804E610: .4byte gUnknown_03004854
_0804E614:
	bl sub_804E2EC
	lsls r0, 24
	cmp r0, 0
	bne _0804E620
	b _0804E71A
_0804E620:
	movs r4, 0
	ldr r5, _0804E668 @ =gUnknown_082162E4
	ldr r6, _0804E66C @ =gUnknown_03004854
_0804E626:
	ldrb r1, [r5]
	ldrb r2, [r5, 0x1]
	ldr r0, _0804E670 @ =gSpriteTemplate_82163F4
	movs r3, 0x1
	bl CreateSprite
	ldr r1, [r6]
	adds r1, 0x5C
	adds r1, r4
	strb r0, [r1]
	ldr r0, [r6]
	adds r0, 0x5C
	adds r0, r4
	ldrb r1, [r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	ldr r1, _0804E674 @ =gSprites
	adds r0, r1
	adds r1, r4, 0
	adds r1, 0x8
	lsls r1, 24
	lsrs r1, 24
	bl StartSpriteAnim
	adds r5, 0x2
	adds r4, 0x1
	cmp r4, 0x3
	ble _0804E626
	ldr r0, _0804E678 @ =sub_804E2BC
	bl SetVBlankCallback
	b _0804E6BE
	.align 2, 0
_0804E668: .4byte gUnknown_082162E4
_0804E66C: .4byte gUnknown_03004854
_0804E670: .4byte gSpriteTemplate_82163F4
_0804E674: .4byte gSprites
_0804E678: .4byte sub_804E2BC
_0804E67C:
	movs r0, 0x1
	negs r0, r0
	movs r1, 0
	str r1, [sp]
	movs r2, 0x10
	movs r3, 0
	bl BeginNormalPaletteFade
	bl sub_8051474
	b _0804E6BE
_0804E692:
	bl sub_804E4FC
	ldr r0, _0804E6A4 @ =gPaletteFade
	ldrb r1, [r0, 0x7]
	movs r0, 0x80
	ands r0, r1
	cmp r0, 0
	bne _0804E71A
	b _0804E6BE
	.align 2, 0
_0804E6A4: .4byte gPaletteFade
_0804E6A8:
	movs r0, 0
	movs r1, 0xE
	movs r2, 0x1D
	movs r3, 0x13
	bl MenuDrawTextWindow
	ldr r0, _0804E6CC @ =gOtherText_BlenderChooseBerry
	movs r1, 0x1
	movs r2, 0xF
	bl MenuPrintMessage
_0804E6BE:
	ldr r0, _0804E6D0 @ =gUnknown_03004854
	ldr r1, [r0]
	ldrb r0, [r1]
	adds r0, 0x1
	strb r0, [r1]
	b _0804E71A
	.align 2, 0
_0804E6CC: .4byte gOtherText_BlenderChooseBerry
_0804E6D0: .4byte gUnknown_03004854
_0804E6D4:
	bl MenuUpdateWindowText
	lsls r0, 24
	cmp r0, 0
	beq _0804E71A
	ldr r0, _0804E6FC @ =gUnknown_03004854
	ldr r1, [r0]
	ldrb r0, [r1]
	adds r0, 0x1
	movs r2, 0
	strb r0, [r1]
	movs r0, 0x1
	negs r0, r0
	str r2, [sp]
	movs r1, 0
	movs r3, 0x10
	bl BeginNormalPaletteFade
	b _0804E71A
	.align 2, 0
_0804E6FC: .4byte gUnknown_03004854
_0804E700:
	ldr r0, _0804E730 @ =gPaletteFade
	ldrb r1, [r0, 0x7]
	movs r0, 0x80
	ands r0, r1
	lsls r0, 24
	lsrs r4, r0, 24
	cmp r4, 0
	bne _0804E71A
	bl sub_80A6978
	ldr r0, _0804E734 @ =gUnknown_03004854
	ldr r0, [r0]
	strb r4, [r0]
_0804E71A:
	bl AnimateSprites
	bl BuildOamBuffer
	bl UpdatePaletteFade
	add sp, 0x4
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_0804E730: .4byte gPaletteFade
_0804E734: .4byte gUnknown_03004854
	thumb_func_end sub_804E56C

	thumb_func_start sub_804E738
sub_804E738: @ 804E738
	push {r4,lr}
	adds r4, r0, 0
	ldrh r0, [r4, 0x3A]
	ldrh r1, [r4, 0x30]
	adds r0, r1
	strh r0, [r4, 0x30]
	ldrh r1, [r4, 0x32]
	ldrh r2, [r4, 0x36]
	subs r1, r2
	ldrh r0, [r4, 0x3C]
	adds r1, r0
	strh r1, [r4, 0x32]
	ldrh r3, [r4, 0x2E]
	adds r0, r3
	strh r0, [r4, 0x2E]
	subs r2, 0x1
	strh r2, [r4, 0x36]
	lsls r0, 16
	lsls r1, 16
	cmp r0, r1
	bge _0804E786
	ldrh r0, [r4, 0x34]
	subs r0, 0x1
	strh r0, [r4, 0x36]
	strh r0, [r4, 0x34]
	ldrh r0, [r4, 0x38]
	adds r0, 0x1
	strh r0, [r4, 0x38]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x3
	ble _0804E780
	adds r0, r4, 0
	bl DestroySprite
	b _0804E786
_0804E780:
	movs r0, 0x74
	bl PlaySE
_0804E786:
	ldrh r0, [r4, 0x30]
	strh r0, [r4, 0x20]
	ldrh r0, [r4, 0x32]
	strh r0, [r4, 0x22]
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end sub_804E738

	thumb_func_start sub_804E794
sub_804E794: @ 804E794
	push {r4-r6,lr}
	ldr r5, [sp, 0x10]
	ldr r6, [sp, 0x14]
	lsls r2, 16
	lsrs r2, 16
	movs r4, 0
	strh r2, [r0, 0x2E]
	strh r1, [r0, 0x30]
	strh r2, [r0, 0x32]
	strh r3, [r0, 0x34]
	movs r1, 0xA
	strh r1, [r0, 0x36]
	strh r4, [r0, 0x38]
	strh r5, [r0, 0x3A]
	strh r6, [r0, 0x3C]
	ldr r1, _0804E7BC @ =sub_804E738
	str r1, [r0, 0x1C]
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_0804E7BC: .4byte sub_804E738
	thumb_func_end sub_804E794

	thumb_func_start sub_804E7C0
sub_804E7C0: @ 804E7C0
	push {r4-r6,lr}
	mov r6, r8
	push {r6}
	sub sp, 0x8
	adds r6, r1, 0
	lsls r6, 24
	lsrs r6, 24
	lsls r0, 24
	movs r1, 0xF6
	lsls r1, 23
	adds r0, r1
	lsrs r0, 24
	movs r3, 0x1
	ands r3, r6
	movs r1, 0
	movs r2, 0x50
	bl sub_80A7DEC
	lsls r0, 24
	lsrs r0, 24
	lsls r2, r0, 4
	mov r8, r2
	add r8, r0
	mov r3, r8
	lsls r3, 2
	mov r8, r3
	ldr r0, _0804E83C @ =gSprites
	add r8, r0
	ldr r5, _0804E840 @ =gUnknown_08216594
	lsls r4, r6, 2
	adds r4, r6
	lsls r4, 1
	adds r0, r4, r5
	movs r6, 0
	ldrsh r1, [r0, r6]
	adds r0, r5, 0x2
	adds r0, r4, r0
	movs r3, 0
	ldrsh r2, [r0, r3]
	adds r0, r5, 0x4
	adds r0, r4, r0
	movs r6, 0
	ldrsh r3, [r0, r6]
	adds r0, r5, 0x6
	adds r0, r4, r0
	movs r6, 0
	ldrsh r0, [r0, r6]
	str r0, [sp]
	adds r5, 0x8
	adds r4, r5
	movs r5, 0
	ldrsh r0, [r4, r5]
	str r0, [sp, 0x4]
	mov r0, r8
	bl sub_804E794
	add sp, 0x8
	pop {r3}
	mov r8, r3
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_0804E83C: .4byte gSprites
_0804E840: .4byte gUnknown_08216594
	thumb_func_end sub_804E7C0

	thumb_func_start sub_804E844
sub_804E844: @ 804E844
	push {r4-r6,lr}
	adds r6, r0, 0
	lsls r5, r1, 16
	lsrs r5, 16
	adds r0, r5, 0
	adds r0, 0x7C
	lsls r0, 24
	lsrs r0, 24
	bl GetBerryInfo
	adds r4, r0, 0
	strh r5, [r6]
	adds r0, r6, 0x2
	adds r1, r4, 0
	bl StringCopy
	ldrb r0, [r4, 0x15]
	strb r0, [r6, 0x9]
	ldrb r0, [r4, 0x16]
	strb r0, [r6, 0xA]
	ldrb r0, [r4, 0x17]
	strb r0, [r6, 0xB]
	ldrb r0, [r4, 0x18]
	strb r0, [r6, 0xC]
	ldrb r0, [r4, 0x19]
	strb r0, [r6, 0xD]
	ldrb r0, [r4, 0x1A]
	strb r0, [r6, 0xE]
	pop {r4-r6}
	pop {r0}
	bx r0
	thumb_func_end sub_804E844

	thumb_func_start sub_804E884
sub_804E884: @ 804E884
	push {r4,r5,lr}
	lsls r0, 24
	lsrs r1, r0, 24
	cmp r1, 0
	beq _0804E89E
	ldr r2, _0804E8AC @ =gLinkPlayers
	movs r3, 0x2
	adds r0, r2, 0
	adds r0, 0x54
_0804E896:
	strh r3, [r0, 0x1A]
	subs r0, 0x1C
	cmp r0, r2
	bge _0804E896
_0804E89E:
	cmp r1, 0x1
	beq _0804E8C4
	cmp r1, 0x1
	bgt _0804E8B0
	cmp r1, 0
	beq _0804E8BA
	b _0804E974
	.align 2, 0
_0804E8AC: .4byte gLinkPlayers
_0804E8B0:
	cmp r1, 0x2
	beq _0804E8F8
	cmp r1, 0x3
	beq _0804E93C
	b _0804E974
_0804E8BA:
	ldr r0, _0804E8C0 @ =gUnknown_03004834
	strb r1, [r0]
	b _0804E974
	.align 2, 0
_0804E8C0: .4byte gUnknown_03004834
_0804E8C4:
	ldr r0, _0804E8E4 @ =gUnknown_03004834
	strb r1, [r0]
	ldr r0, _0804E8E8 @ =gUnknown_03004854
	ldr r0, [r0]
	adds r0, 0x88
	movs r1, 0x2
	strb r1, [r0]
	ldr r4, _0804E8EC @ =gLinkPlayers + 0x8
	ldr r1, _0804E8F0 @ =gSaveBlock2
	adds r0, r4, 0
	bl StringCopy
	adds r4, 0x1C
	ldr r0, _0804E8F4 @ =gUnknown_082162B8
	ldr r1, [r0]
	b _0804E920
	.align 2, 0
_0804E8E4: .4byte gUnknown_03004834
_0804E8E8: .4byte gUnknown_03004854
_0804E8EC: .4byte gLinkPlayers + 0x8
_0804E8F0: .4byte gSaveBlock2
_0804E8F4: .4byte gUnknown_082162B8
_0804E8F8:
	ldr r0, _0804E928 @ =gUnknown_03004834
	strb r1, [r0]
	ldr r0, _0804E92C @ =gUnknown_03004854
	ldr r0, [r0]
	adds r0, 0x88
	movs r1, 0x3
	strb r1, [r0]
	ldr r4, _0804E930 @ =gLinkPlayers + 0x8
	ldr r1, _0804E934 @ =gSaveBlock2
	adds r0, r4, 0
	bl StringCopy
	adds r0, r4, 0
	adds r0, 0x1C
	ldr r5, _0804E938 @ =gUnknown_082162B8
	ldr r1, [r5]
	bl StringCopy
	adds r4, 0x38
	ldr r1, [r5, 0x4]
_0804E920:
	adds r0, r4, 0
	bl StringCopy
	b _0804E974
	.align 2, 0
_0804E928: .4byte gUnknown_03004834
_0804E92C: .4byte gUnknown_03004854
_0804E930: .4byte gLinkPlayers + 0x8
_0804E934: .4byte gSaveBlock2
_0804E938: .4byte gUnknown_082162B8
_0804E93C:
	ldr r0, _0804E97C @ =gUnknown_03004834
	strb r1, [r0]
	ldr r0, _0804E980 @ =gUnknown_03004854
	ldr r0, [r0]
	adds r0, 0x88
	movs r1, 0x4
	strb r1, [r0]
	ldr r4, _0804E984 @ =gLinkPlayers + 0x8
	ldr r1, _0804E988 @ =gSaveBlock2
	adds r0, r4, 0
	bl StringCopy
	adds r0, r4, 0
	adds r0, 0x1C
	ldr r5, _0804E98C @ =gUnknown_082162B8
	ldr r1, [r5]
	bl StringCopy
	adds r0, r4, 0
	adds r0, 0x38
	ldr r1, [r5, 0x4]
	bl StringCopy
	adds r4, 0x54
	ldr r1, [r5, 0x8]
	adds r0, r4, 0
	bl StringCopy
_0804E974:
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_0804E97C: .4byte gUnknown_03004834
_0804E980: .4byte gUnknown_03004854
_0804E984: .4byte gLinkPlayers + 0x8
_0804E988: .4byte gSaveBlock2
_0804E98C: .4byte gUnknown_082162B8
	thumb_func_end sub_804E884

	thumb_func_start sub_804E990
sub_804E990: @ 804E990
	push {r4,r5,lr}
	movs r0, 0x80
	lsls r0, 19
	movs r2, 0
	strh r2, [r0]
	ldr r3, _0804E9D8 @ =gUnknown_03004854
	ldr r0, _0804E9DC @ =0x02018000
	str r0, [r3]
	movs r1, 0
	strb r2, [r0]
	movs r2, 0x9A
	lsls r2, 1
	adds r0, r2
	str r1, [r0]
	movs r2, 0
	ldr r5, _0804E9E0 @ =gUnknown_0202E8CC
	adds r4, r3, 0
	movs r3, 0
_0804E9B4:
	ldr r0, [r4]
	lsls r1, r2, 1
	adds r0, 0x80
	adds r0, r1
	strh r3, [r0]
	adds r2, 0x1
	cmp r2, 0x3
	ble _0804E9B4
	ldrb r0, [r5]
	bl sub_804E884
	ldrh r0, [r5]
	cmp r0, 0
	bne _0804E9E8
	ldr r0, _0804E9E4 @ =sub_804E9F8
	bl SetMainCallback2
	b _0804E9EE
	.align 2, 0
_0804E9D8: .4byte gUnknown_03004854
_0804E9DC: .4byte 0x02018000
_0804E9E0: .4byte gUnknown_0202E8CC
_0804E9E4: .4byte sub_804E9F8
_0804E9E8:
	ldr r0, _0804E9F4 @ =sub_804F378
	bl SetMainCallback2
_0804E9EE:
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_0804E9F4: .4byte sub_804F378
	thumb_func_end sub_804E990

	thumb_func_start sub_804E9F8
sub_804E9F8: @ 804E9F8
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	sub sp, 0x4
	ldr r1, _0804EA18 @ =gUnknown_03004854
	ldr r0, [r1]
	ldrb r0, [r0]
	mov r8, r1
	cmp r0, 0x66
	bls _0804EA0E
	b _0804F0CE
_0804EA0E:
	lsls r0, 2
	ldr r1, _0804EA1C @ =_0804EA20
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_0804EA18: .4byte gUnknown_03004854
_0804EA1C: .4byte _0804EA20
	.align 2, 0
_0804EA20:
	.4byte _0804EBBC
	.4byte _0804EC74
	.4byte _0804EC94
	.4byte _0804ECE8
	.4byte _0804ECFA
	.4byte _0804ED14
	.4byte _0804F0CE
	.4byte _0804F0CE
	.4byte _0804ED48
	.4byte _0804ED94
	.4byte _0804EDB8
	.4byte _0804EE46
	.4byte _0804EEA0
	.4byte _0804EF16
	.4byte _0804EF34
	.4byte _0804EFD8
	.4byte _0804F00C
	.4byte _0804F0CE
	.4byte _0804F020
	.4byte _0804F024
	.4byte _0804F02A
	.4byte _0804F03A
	.4byte _0804F0CE
	.4byte _0804F0CE
	.4byte _0804F0CE
	.4byte _0804F0CE
	.4byte _0804F0CE
	.4byte _0804F0CE
	.4byte _0804F0CE
	.4byte _0804F0CE
	.4byte _0804F0CE
	.4byte _0804F0CE
	.4byte _0804F0CE
	.4byte _0804F0CE
	.4byte _0804F0CE
	.4byte _0804F0CE
	.4byte _0804F0CE
	.4byte _0804F0CE
	.4byte _0804F0CE
	.4byte _0804F0CE
	.4byte _0804F0CE
	.4byte _0804F0CE
	.4byte _0804F0CE
	.4byte _0804F0CE
	.4byte _0804F0CE
	.4byte _0804F0CE
	.4byte _0804F0CE
	.4byte _0804F0CE
	.4byte _0804F0CE
	.4byte _0804F0CE
	.4byte _0804F0CE
	.4byte _0804F0CE
	.4byte _0804F0CE
	.4byte _0804F0CE
	.4byte _0804F0CE
	.4byte _0804F0CE
	.4byte _0804F0CE
	.4byte _0804F0CE
	.4byte _0804F0CE
	.4byte _0804F0CE
	.4byte _0804F0CE
	.4byte _0804F0CE
	.4byte _0804F0CE
	.4byte _0804F0CE
	.4byte _0804F0CE
	.4byte _0804F0CE
	.4byte _0804F0CE
	.4byte _0804F0CE
	.4byte _0804F0CE
	.4byte _0804F0CE
	.4byte _0804F0CE
	.4byte _0804F0CE
	.4byte _0804F0CE
	.4byte _0804F0CE
	.4byte _0804F0CE
	.4byte _0804F0CE
	.4byte _0804F0CE
	.4byte _0804F0CE
	.4byte _0804F0CE
	.4byte _0804F0CE
	.4byte _0804F0CE
	.4byte _0804F0CE
	.4byte _0804F0CE
	.4byte _0804F0CE
	.4byte _0804F0CE
	.4byte _0804F0CE
	.4byte _0804F0CE
	.4byte _0804F0CE
	.4byte _0804F0CE
	.4byte _0804F0CE
	.4byte _0804F0CE
	.4byte _0804F0CE
	.4byte _0804F0CE
	.4byte _0804F0CE
	.4byte _0804F0CE
	.4byte _0804F0CE
	.4byte _0804F0CE
	.4byte _0804F0CE
	.4byte _0804F0CE
	.4byte _0804F0CE
	.4byte _0804F084
	.4byte _0804F0A0
	.4byte _0804F0BC
_0804EBBC:
	bl ResetSpriteData
	bl FreeAllSpritePalettes
	bl ResetTasks
	ldr r0, _0804EC60 @ =sub_804E2BC
	bl SetVBlankCallback
	ldr r4, _0804EC64 @ =gWindowConfig_81E6F68
	adds r0, r4, 0
	bl SetUpWindowConfig
	adds r0, r4, 0
	bl InitMenuWindow
	ldr r1, _0804EC68 @ =gLinkType
	ldr r2, _0804EC6C @ =0x00004422
	adds r0, r2, 0
	strh r0, [r1]
	ldr r3, _0804EC70 @ =gUnknown_03004854
	ldr r1, [r3]
	ldrb r0, [r1]
	adds r0, 0x1
	movs r2, 0
	strb r0, [r1]
	ldr r0, [r3]
	adds r4, r0, 0
	adds r4, 0x4E
	movs r1, 0
	strh r2, [r4]
	adds r0, 0x7E
	strb r1, [r0]
	ldr r1, [r3]
	movs r4, 0xA2
	lsls r4, 1
	adds r0, r1, r4
	strh r2, [r0]
	adds r4, 0x2
	adds r0, r1, r4
	strh r2, [r0]
	movs r5, 0
	movs r6, 0
	mov r8, r3
	movs r7, 0xA6
	lsls r7, 1
_0804EC18:
	ldr r0, [r3]
	lsls r1, r5, 1
	adds r0, 0x70
	adds r0, r1
	strh r6, [r0]
	adds r4, r5, 0x1
	adds r1, r5
	lsls r1, 1
	movs r2, 0x2
_0804EC2A:
	ldr r0, [r3]
	adds r0, r7
	adds r0, r1
	strh r6, [r0]
	adds r1, 0x2
	subs r2, 0x1
	cmp r2, 0
	bge _0804EC2A
	adds r5, r4, 0
	cmp r5, 0x3
	ble _0804EC18
	mov r0, r8
	ldr r3, [r0]
	adds r0, r3, 0
	adds r0, 0x7C
	movs r2, 0
	movs r1, 0
	strh r1, [r0]
	subs r0, 0x26
	strh r1, [r0]
	subs r0, 0x2
	strh r1, [r0]
	adds r0, 0x6
	strh r1, [r0]
	strb r2, [r3, 0x1]
	b _0804F0CE
	.align 2, 0
_0804EC60: .4byte sub_804E2BC
_0804EC64: .4byte gWindowConfig_81E6F68
_0804EC68: .4byte gLinkType
_0804EC6C: .4byte 0x00004422
_0804EC70: .4byte gUnknown_03004854
_0804EC74:
	bl sub_804E2EC
	lsls r0, 24
	cmp r0, 0
	bne _0804EC80
	b _0804F0CE
_0804EC80:
	ldr r0, _0804EC90 @ =gUnknown_03004854
	ldr r1, [r0]
	ldrb r0, [r1]
	adds r0, 0x1
	strb r0, [r1]
	bl sub_8051474
	b _0804F0CE
	.align 2, 0
_0804EC90: .4byte gUnknown_03004854
_0804EC94:
	movs r5, 0
	ldr r4, _0804ECD8 @ =gUnknown_082162E4
	ldr r6, _0804ECDC @ =gUnknown_03004854
_0804EC9A:
	ldrb r1, [r4]
	ldrb r2, [r4, 0x1]
	ldr r0, _0804ECE0 @ =gSpriteTemplate_82163F4
	movs r3, 0x1
	bl CreateSprite
	ldr r1, [r6]
	adds r1, 0x60
	adds r1, r5
	strb r0, [r1]
	ldr r0, [r6]
	adds r0, 0x60
	adds r0, r5
	ldrb r1, [r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	ldr r1, _0804ECE4 @ =gSprites
	adds r0, r1
	adds r1, r5, 0
	adds r1, 0x8
	lsls r1, 24
	lsrs r1, 24
	bl StartSpriteAnim
	adds r4, 0x2
	adds r5, 0x1
	cmp r5, 0x3
	ble _0804EC9A
	b _0804F0AA
	.align 2, 0
_0804ECD8: .4byte gUnknown_082162E4
_0804ECDC: .4byte gUnknown_03004854
_0804ECE0: .4byte gSpriteTemplate_82163F4
_0804ECE4: .4byte gSprites
_0804ECE8:
	movs r0, 0x1
	negs r0, r0
	movs r1, 0
	str r1, [sp]
	movs r2, 0x10
	movs r3, 0
	bl BeginNormalPaletteFade
	b _0804F0AA
_0804ECFA:
	bl sub_804E4FC
	ldr r0, _0804ED10 @ =gPaletteFade
	ldrb r1, [r0, 0x7]
	movs r0, 0x80
	ands r0, r1
	cmp r0, 0
	beq _0804ED0C
	b _0804F0CE
_0804ED0C:
	b _0804F0AA
	.align 2, 0
_0804ED10: .4byte gPaletteFade
_0804ED14:
	movs r0, 0
	movs r1, 0xD
	movs r2, 0x1D
	movs r3, 0x13
	bl MenuDrawTextWindow
	ldr r0, _0804ED40 @ =gOtherText_LinkStandby3
	movs r1, 0x1
	movs r2, 0xE
	bl MenuPrint
	ldr r2, _0804ED44 @ =gUnknown_03004854
	ldr r1, [r2]
	movs r3, 0
	movs r0, 0x8
	strb r0, [r1]
	ldr r0, [r2]
	movs r1, 0x98
	lsls r1, 1
	adds r0, r1
	str r3, [r0]
	b _0804F0CE
	.align 2, 0
_0804ED40: .4byte gOtherText_LinkStandby3
_0804ED44: .4byte gUnknown_03004854
_0804ED48:
	mov r2, r8
	ldr r1, [r2]
	ldrb r0, [r1]
	adds r0, 0x1
	movs r5, 0
	strb r0, [r1]
	ldr r0, [r2]
	movs r3, 0x9E
	lsls r3, 1
	adds r0, r3
	strb r5, [r0]
	ldr r0, [r2]
	movs r4, 0xBE
	lsls r4, 1
	adds r0, r4
	ldr r1, _0804ED8C @ =word_203855E
	ldrh r1, [r1]
	bl sub_804E844
	ldr r0, _0804ED90 @ =gBlockSendBuffer
	mov r2, r8
	ldr r1, [r2]
	adds r1, r4
	movs r2, 0x10
	bl memcpy
	bl sub_80084A4
	mov r3, r8
	ldr r0, [r3]
	subs r4, 0x4C
	adds r0, r4
	str r5, [r0]
	b _0804F0CE
	.align 2, 0
_0804ED8C: .4byte word_203855E
_0804ED90: .4byte gBlockSendBuffer
_0804ED94:
	bl sub_8007ECC
	lsls r0, 24
	cmp r0, 0
	bne _0804EDA0
	b _0804F0CE
_0804EDA0:
	bl ResetBlockReceivedFlags
	bl GetMultiplayerId
	lsls r0, 24
	cmp r0, 0
	beq _0804EDB0
	b _0804F0AA
_0804EDB0:
	movs r0, 0x4
	bl sub_8007E9C
	b _0804F0AA
_0804EDB8:
	mov r0, r8
	ldr r1, [r0]
	movs r2, 0x98
	lsls r2, 1
	adds r1, r2
	ldr r0, [r1]
	adds r0, 0x1
	str r0, [r1]
	cmp r0, 0x14
	bgt _0804EDCE
	b _0804F0CE
_0804EDCE:
	bl MenuZeroFillScreen
	bl GetBlockRecievedStatus
	adds r4, r0, 0
	bl sub_8008198
	lsls r4, 24
	lsls r0, 24
	cmp r4, r0
	beq _0804EDE6
	b _0804F0CE
_0804EDE6:
	movs r5, 0
	mov r7, r8
	movs r6, 0xBE
	lsls r6, 1
	b _0804EE18
_0804EDF0:
	ldr r0, [r7]
	lsls r4, r5, 4
	adds r0, r4, r0
	adds r0, r6
	lsls r1, r5, 8
	ldr r2, _0804EE2C @ =gBlockRecvBuffer
	adds r1, r2
	movs r2, 0x10
	bl memcpy
	ldr r0, [r7]
	lsls r2, r5, 1
	adds r1, r0, 0
	adds r1, 0x80
	adds r1, r2
	adds r0, r4
	adds r0, r6
	ldrh r0, [r0]
	strh r0, [r1]
	adds r5, 0x1
_0804EE18:
	bl GetLinkPlayerCount
	lsls r0, 24
	lsrs r0, 24
	cmp r5, r0
	blt _0804EDF0
	bl ResetBlockReceivedFlags
	b _0804F0AA
	.align 2, 0
_0804EE2C: .4byte gBlockRecvBuffer
_0804EE30:
	ldrb r1, [r4]
	lsls r1, 1
	adds r0, r2, 0
	adds r0, 0x80
	adds r0, r1
	ldrh r0, [r0]
	lsls r1, r5, 24
	lsrs r1, 24
	bl sub_804E7C0
	b _0804EE7A
_0804EE46:
	bl GetLinkPlayerCount
	ldr r2, _0804EE98 @ =gUnknown_03004854
	ldr r1, [r2]
	adds r1, 0x88
	strb r0, [r1]
	movs r5, 0
	ldr r2, [r2]
	movs r3, 0x9E
	lsls r3, 1
	adds r4, r2, r3
	ldr r1, _0804EE9C @ =gUnknown_082162EC
	adds r0, r2, 0
	adds r0, 0x88
	ldrb r0, [r0]
	subs r0, 0x2
	lsls r0, 2
	ldrb r3, [r4]
	adds r0, r1
_0804EE6C:
	ldrb r1, [r0]
	cmp r3, r1
	beq _0804EE30
	adds r0, 0x1
	adds r5, 0x1
	cmp r5, 0x3
	ble _0804EE6C
_0804EE7A:
	ldr r3, _0804EE98 @ =gUnknown_03004854
	ldr r1, [r3]
	movs r4, 0x98
	lsls r4, 1
	adds r2, r1, r4
	movs r0, 0
	str r0, [r2]
	ldrb r0, [r1]
	adds r0, 0x1
	strb r0, [r1]
	ldr r1, [r3]
	movs r0, 0x9E
	lsls r0, 1
	adds r1, r0
	b _0804F0AE
	.align 2, 0
_0804EE98: .4byte gUnknown_03004854
_0804EE9C: .4byte gUnknown_082162EC
_0804EEA0:
	mov r1, r8
	ldr r2, [r1]
	movs r3, 0x98
	lsls r3, 1
	adds r1, r2, r3
	ldr r0, [r1]
	adds r0, 0x1
	str r0, [r1]
	cmp r0, 0x3C
	bgt _0804EEB6
	b _0804F0CE
_0804EEB6:
	movs r4, 0x9E
	lsls r4, 1
	adds r0, r2, r4
	adds r1, r2, 0
	adds r1, 0x88
	ldrb r0, [r0]
	ldrb r1, [r1]
	cmp r0, r1
	bcc _0804EF00
	ldrb r0, [r2]
	adds r0, 0x1
	strb r0, [r2]
	mov r0, r8
	ldr r2, [r0]
	ldr r3, _0804EEF4 @ =gUnknown_082162F8
	ldr r1, _0804EEF8 @ =gUnknown_08216300
	adds r0, r2, 0
	adds r0, 0x88
	ldrb r0, [r0]
	subs r0, 0x2
	adds r0, r1
	ldrb r0, [r0]
	lsls r0, 1
	adds r0, r3
	ldr r3, _0804EEFC @ =0xffffa800
	adds r1, r3, 0
	ldrh r0, [r0]
	adds r1, r0
	adds r2, 0x54
	strh r1, [r2]
	b _0804EF06
	.align 2, 0
_0804EEF4: .4byte gUnknown_082162F8
_0804EEF8: .4byte gUnknown_08216300
_0804EEFC: .4byte 0xffffa800
_0804EF00:
	ldrb r0, [r2]
	subs r0, 0x1
	strb r0, [r2]
_0804EF06:
	mov r4, r8
	ldr r0, [r4]
	movs r1, 0x98
	lsls r1, 1
	adds r0, r1
	movs r1, 0
	str r1, [r0]
	b _0804F0CE
_0804EF16:
	bl sub_8007ECC
	lsls r0, 24
	cmp r0, 0
	bne _0804EF22
	b _0804F0CE
_0804EF22:
	ldr r2, _0804EF30 @ =gUnknown_03004854
	ldr r1, [r2]
	ldrb r0, [r1]
	adds r0, 0x1
	strb r0, [r1]
	ldr r0, [r2]
	b _0804EFBC
	.align 2, 0
_0804EF30: .4byte gUnknown_03004854
_0804EF34:
	movs r2, 0x80
	lsls r2, 19
	ldrh r0, [r2]
	movs r3, 0x80
	lsls r3, 3
	adds r1, r3, 0
	orrs r0, r1
	strh r0, [r2]
	mov r4, r8
	ldr r2, [r4]
	adds r1, r2, 0
	adds r1, 0x54
	movs r3, 0x80
	lsls r3, 2
	adds r0, r3, 0
	ldrh r4, [r1]
	adds r0, r4
	strh r0, [r1]
	movs r0, 0xA1
	lsls r0, 1
	adds r1, r2, r0
	ldrh r0, [r1]
	adds r0, 0x4
	strh r0, [r1]
	lsls r0, 16
	lsrs r0, 16
	cmp r0, 0xFF
	bls _0804EFB8
	ldrb r0, [r2]
	adds r0, 0x1
	strb r0, [r2]
	mov r1, r8
	ldr r3, [r1]
	movs r2, 0xA1
	lsls r2, 1
	adds r1, r3, r2
	movs r0, 0x80
	lsls r0, 1
	strh r0, [r1]
	ldr r2, _0804EFC8 @ =gUnknown_082162F8
	ldr r1, _0804EFCC @ =gUnknown_08216300
	adds r0, r3, 0
	adds r0, 0x88
	ldrb r0, [r0]
	subs r0, 0x2
	adds r0, r1
	ldrb r0, [r0]
	lsls r0, 1
	adds r0, r2
	ldrh r1, [r0]
	adds r0, r3, 0
	adds r0, 0x54
	strh r1, [r0]
	ldr r1, _0804EFD0 @ =REG_BG2CNT
	ldr r4, _0804EFD4 @ =0x00004882
	adds r0, r4, 0
	strh r0, [r1]
	movs r0, 0x98
	lsls r0, 1
	adds r1, r3, r0
	movs r0, 0
	str r0, [r1]
	bl sub_804F238
	bl BuyMenuDrawFieldObjects
_0804EFB8:
	mov r1, r8
	ldr r0, [r1]
_0804EFBC:
	movs r2, 0xB4
	lsls r2, 1
	adds r0, r2
	bl sub_8051414
	b _0804F0CE
	.align 2, 0
_0804EFC8: .4byte gUnknown_082162F8
_0804EFCC: .4byte gUnknown_08216300
_0804EFD0: .4byte REG_BG2CNT
_0804EFD4: .4byte 0x00004882
_0804EFD8:
	bl sub_8051B8C
	lsls r0, 24
	cmp r0, 0
	beq _0804EFF6
	ldr r0, _0804F008 @ =gUnknown_03004854
	ldr r1, [r0]
	movs r3, 0x98
	lsls r3, 1
	adds r2, r1, r3
	movs r0, 0
	str r0, [r2]
	ldrb r0, [r1]
	adds r0, 0x1
	strb r0, [r1]
_0804EFF6:
	ldr r0, _0804F008 @ =gUnknown_03004854
	ldr r0, [r0]
	movs r4, 0xB4
	lsls r4, 1
	adds r0, r4
	bl sub_8051414
	b _0804F0CE
	.align 2, 0
_0804F008: .4byte gUnknown_03004854
_0804F00C:
	ldr r0, _0804F01C @ =gSpriteTemplate_8216548
	movs r2, 0x10
	negs r2, r2
	movs r1, 0x78
	movs r3, 0x3
	bl CreateSprite
	b _0804F0AA
	.align 2, 0
_0804F01C: .4byte gSpriteTemplate_8216548
_0804F020:
	mov r0, r8
	b _0804F0AC
_0804F024:
	bl sub_80084A4
	b _0804F0AA
_0804F02A:
	bl sub_8007ECC
	lsls r0, 24
	cmp r0, 0
	beq _0804F0CE
	bl sub_8007E24
	b _0804F0AA
_0804F03A:
	mov r1, r8
	ldr r3, [r1]
	adds r2, r3, 0
	adds r2, 0x56
	movs r1, 0
	movs r0, 0x80
	strh r0, [r2]
	movs r2, 0x96
	lsls r2, 1
	adds r0, r3, r2
	str r1, [r0]
	ldr r0, _0804F07C @ =sub_80501FC
	bl SetMainCallback2
	bl GetCurrentMapMusic
	lsls r0, 16
	lsrs r0, 16
	ldr r4, _0804F080 @ =0x00000193
	cmp r0, r4
	beq _0804F074
	bl GetCurrentMapMusic
	mov r3, r8
	ldr r1, [r3]
	movs r2, 0xBC
	lsls r2, 1
	adds r1, r2
	strh r0, [r1]
_0804F074:
	adds r0, r4, 0
	bl PlayBGM
	b _0804F0CE
	.align 2, 0
_0804F07C: .4byte sub_80501FC
_0804F080: .4byte 0x00000193
_0804F084:
	movs r0, 0
	movs r1, 0xD
	movs r2, 0x1D
	movs r3, 0x13
	bl MenuDrawTextWindow
	ldr r0, _0804F09C @ =gOtherText_LinkNotFound
	movs r1, 0x1
	movs r2, 0xF
	bl MenuPrintMessage
	b _0804F0AA
	.align 2, 0
_0804F09C: .4byte gOtherText_LinkNotFound
_0804F0A0:
	bl MenuUpdateWindowText
	lsls r0, 24
	cmp r0, 0
	beq _0804F0CE
_0804F0AA:
	ldr r0, _0804F0B8 @ =gUnknown_03004854
_0804F0AC:
	ldr r1, [r0]
_0804F0AE:
	ldrb r0, [r1]
	adds r0, 0x1
	strb r0, [r1]
	b _0804F0CE
	.align 2, 0
_0804F0B8: .4byte gUnknown_03004854
_0804F0BC:
	ldr r0, _0804F0EC @ =gPaletteFade
	ldrb r1, [r0, 0x7]
	movs r0, 0x80
	ands r0, r1
	cmp r0, 0
	bne _0804F0CE
	ldr r0, _0804F0F0 @ =c2_exit_to_overworld_1_continue_scripts_restart_music
	bl SetMainCallback2
_0804F0CE:
	bl RunTasks
	bl AnimateSprites
	bl BuildOamBuffer
	bl UpdatePaletteFade
	add sp, 0x4
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_0804F0EC: .4byte gPaletteFade
_0804F0F0: .4byte c2_exit_to_overworld_1_continue_scripts_restart_music
	thumb_func_end sub_804E9F8

	thumb_func_start sub_804F0F4
sub_804F0F4: @ 804F0F4
	push {r4,lr}
	movs r1, 0x80
	lsls r1, 19
	movs r0, 0
	strh r0, [r1]
	bl ResetSpriteData
	bl FreeAllSpritePalettes
	bl ResetTasks
	ldr r0, _0804F158 @ =sub_804E2BC
	bl SetVBlankCallback
	ldr r4, _0804F15C @ =gWindowConfig_81E6F68
	adds r0, r4, 0
	bl SetUpWindowConfig
	adds r0, r4, 0
	bl InitMenuWindow
	ldr r1, _0804F160 @ =gLinkType
	ldr r2, _0804F164 @ =0x00004422
	adds r0, r2, 0
	strh r0, [r1]
	ldr r0, _0804F168 @ =gUnknown_03004854
	ldr r2, [r0]
	adds r0, r2, 0
	adds r0, 0x4E
	movs r1, 0
	strh r1, [r0]
	adds r0, 0x8
	strh r1, [r0]
	subs r0, 0x2
	strh r1, [r0]
	adds r0, 0x6
	strh r1, [r0]
	movs r3, 0xA2
	lsls r3, 1
	adds r0, r2, r3
	strh r1, [r0]
	adds r3, 0x2
	adds r0, r2, r3
	strh r1, [r0]
	ldrb r0, [r2]
	adds r0, 0x1
	strb r0, [r2]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0804F158: .4byte sub_804E2BC
_0804F15C: .4byte gWindowConfig_81E6F68
_0804F160: .4byte gLinkType
_0804F164: .4byte 0x00004422
_0804F168: .4byte gUnknown_03004854
	thumb_func_end sub_804F0F4

	thumb_func_start task_tutorial_oak_boy_girl
task_tutorial_oak_boy_girl: @ 804F16C
	push {lr}
	lsls r0, 16
	lsls r1, 24
	lsrs r0, 24
	adds r2, r0, 0
	adds r2, 0x18
	ldr r0, _0804F1A8 @ =gUnknown_03004854
	ldr r0, [r0]
	lsrs r1, 23
	adds r0, 0xA2
	adds r0, r1
	ldrb r0, [r0]
	ldr r1, _0804F1AC @ =gUnknown_08216303
	adds r0, r1
	ldrb r1, [r0]
	cmp r2, r1
	bcc _0804F1B4
	adds r0, r1, 0
	adds r0, 0x30
	cmp r2, r0
	bcs _0804F1B4
	subs r0, 0x1C
	cmp r2, r0
	bcc _0804F1B0
	adds r0, 0x8
	cmp r2, r0
	bcs _0804F1B0
	movs r0, 0x2
	b _0804F1B6
	.align 2, 0
_0804F1A8: .4byte gUnknown_03004854
_0804F1AC: .4byte gUnknown_08216303
_0804F1B0:
	movs r0, 0x1
	b _0804F1B6
_0804F1B4:
	movs r0, 0
_0804F1B6:
	pop {r1}
	bx r1
	thumb_func_end task_tutorial_oak_boy_girl

	thumb_func_start sub_804F1BC
sub_804F1BC: @ 804F1BC
	push {r4-r7,lr}
	lsls r0, 16
	lsrs r0, 16
	lsls r1, 24
	lsrs r1, 24
	movs r4, 0
	cmp r0, 0xAF
	bne _0804F1EE
	movs r3, 0
	subs r5, r1, 0x1
	adds r2, 0x9
_0804F1D2:
	adds r0, r2, r4
	adds r1, r2, r3
	ldrb r0, [r0]
	ldrb r1, [r1]
	cmp r0, r1
	bls _0804F1E0
	adds r4, r3, 0
_0804F1E0:
	adds r0, r3, 0x1
	lsls r0, 16
	lsrs r3, r0, 16
	cmp r3, 0x4
	bls _0804F1D2
	adds r0, r4, 0x5
	b _0804F204
_0804F1EE:
	subs r0, 0x85
	lsls r0, 16
	lsrs r4, r0, 16
	subs r5, r1, 0x1
	cmp r4, 0x4
	bls _0804F208
	adds r0, r4, 0
	movs r1, 0x5
	bl __umodsi3
	adds r0, 0x5
_0804F204:
	lsls r0, 16
	lsrs r4, r0, 16
_0804F208:
	movs r3, 0
	cmp r3, r5
	bge _0804F22E
	ldr r7, _0804F234 @ =gUnknown_082165BC
	lsls r0, r4, 1
	adds r6, r0, r4
_0804F214:
	adds r4, r3, 0x1
	lsls r0, r4, 24
	lsrs r0, 24
	adds r1, r3, r6
	adds r1, r7
	ldrb r1, [r1]
	adds r1, 0x85
	bl sub_80516C4
	lsls r4, 16
	lsrs r3, r4, 16
	cmp r3, r5
	blt _0804F214
_0804F22E:
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_0804F234: .4byte gUnknown_082165BC
	thumb_func_end sub_804F1BC

	thumb_func_start sub_804F238
sub_804F238: @ 804F238
	push {r4-r7,lr}
	movs r4, 0
	ldr r7, _0804F2A0 @ =gUnknown_03004854
	movs r6, 0xFF
	ldr r5, _0804F2A4 @ =gUnknown_082162EC
_0804F242:
	ldr r3, [r7]
	lsls r2, r4, 1
	adds r0, r3, 0
	adds r0, 0xA2
	adds r0, r2
	strh r6, [r0]
	adds r1, r3, 0
	adds r1, 0x9A
	adds r1, r2
	adds r0, r3, 0
	adds r0, 0x88
	ldrb r0, [r0]
	subs r0, 0x2
	lsls r0, 2
	adds r0, r4, r0
	adds r0, r5
	ldrb r0, [r0]
	strh r0, [r1]
	adds r4, 0x1
	cmp r4, 0x3
	ble _0804F242
	movs r3, 0
	ldr r7, _0804F2A0 @ =gUnknown_03004854
_0804F270:
	movs r4, 0
	adds r6, r3, 0x1
	lsls r5, r3, 1
_0804F276:
	ldr r2, [r7]
	lsls r0, r4, 1
	adds r1, r2, 0
	adds r1, 0x9A
	adds r1, r0
	ldrh r0, [r1]
	cmp r0, r3
	bne _0804F28E
	adds r0, r2, 0
	adds r0, 0xA2
	adds r0, r5
	strh r4, [r0]
_0804F28E:
	adds r4, 0x1
	cmp r4, 0x3
	ble _0804F276
	adds r3, r6, 0
	cmp r3, 0x3
	ble _0804F270
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_0804F2A0: .4byte gUnknown_03004854
_0804F2A4: .4byte gUnknown_082162EC
	thumb_func_end sub_804F238

	thumb_func_start BuyMenuDrawFieldObjects
BuyMenuDrawFieldObjects: @ 804F2A8
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	movs r6, 0
	ldr r7, _0804F360 @ =gUnknown_03004854
	ldr r0, _0804F364 @ =gUnknown_082162D4
	mov r8, r0
_0804F2B6:
	ldr r2, [r7]
	lsls r4, r6, 1
	adds r0, r2, 0
	adds r0, 0x9A
	adds r3, r0, r4
	ldrh r0, [r3]
	cmp r0, 0xFF
	beq _0804F34A
	ldr r5, _0804F368 @ =gStringVar1
	adds r1, r2, 0
	adds r1, 0x5C
	ldrh r3, [r3]
	adds r1, r3
	adds r0, r2, 0
	adds r0, 0x60
	adds r0, r6
	ldrb r0, [r0]
	strb r0, [r1]
	ldr r0, [r7]
	adds r1, r0, 0
	adds r1, 0x9A
	adds r1, r4
	adds r0, 0x5C
	ldrh r1, [r1]
	adds r0, r1
	ldrb r1, [r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	ldr r1, _0804F36C @ =gSprites
	adds r0, r1
	lsls r1, r6, 24
	lsrs r1, 24
	bl StartSpriteAnim
	bl GetMultiplayerId
	lsls r0, 24
	ldr r1, [r7]
	adds r1, 0x9A
	adds r1, r4
	lsrs r0, 24
	ldrh r1, [r1]
	cmp r0, r1
	bne _0804F31A
	adds r0, r5, 0
	ldr r1, _0804F370 @ =gUnknown_082162C4
	bl StringCopy
	adds r5, r0, 0
_0804F31A:
	ldr r0, [r7]
	adds r0, 0x9A
	adds r0, r4
	ldrh r0, [r0]
	lsls r1, r0, 3
	subs r1, r0
	lsls r1, 2
	ldr r0, _0804F374 @ =gLinkPlayers + 0x8
	adds r1, r0
	adds r0, r5, 0
	bl StringCopy
	mov r0, r8
	ldrb r1, [r0]
	lsls r1, 3
	adds r1, 0x1
	lsls r1, 24
	lsrs r1, 24
	ldrb r2, [r0, 0x1]
	lsls r2, 3
	ldr r0, _0804F368 @ =gStringVar1
	movs r3, 0x1
	bl MenuPrint_PixelCoords
_0804F34A:
	movs r0, 0x2
	add r8, r0
	adds r6, 0x1
	cmp r6, 0x3
	ble _0804F2B6
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_0804F360: .4byte gUnknown_03004854
_0804F364: .4byte gUnknown_082162D4
_0804F368: .4byte gStringVar1
_0804F36C: .4byte gSprites
_0804F370: .4byte gUnknown_082162C4
_0804F374: .4byte gLinkPlayers + 0x8
	thumb_func_end BuyMenuDrawFieldObjects

	thumb_func_start sub_804F378
sub_804F378: @ 804F378
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	sub sp, 0x4
	ldr r1, _0804F398 @ =gUnknown_03004854
	ldr r0, [r1]
	ldrb r0, [r0]
	mov r8, r1
	cmp r0, 0x15
	bls _0804F38E
	b _0804F7E6
_0804F38E:
	lsls r0, 2
	ldr r1, _0804F39C @ =_0804F3A0
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_0804F398: .4byte gUnknown_03004854
_0804F39C: .4byte _0804F3A0
	.align 2, 0
_0804F3A0:
	.4byte _0804F3F8
	.4byte _0804F474
	.4byte _0804F494
	.4byte _0804F4EC
	.4byte _0804F518
	.4byte _0804F7E6
	.4byte _0804F7E6
	.4byte _0804F7E6
	.4byte _0804F54C
	.4byte _0804F7E6
	.4byte _0804F7E6
	.4byte _0804F578
	.4byte _0804F5C8
	.4byte _0804F636
	.4byte _0804F650
	.4byte _0804F6F8
	.4byte _0804F720
	.4byte _0804F7E6
	.4byte _0804F73C
	.4byte _0804F742
	.4byte _0804F748
	.4byte _0804F754
_0804F3F8:
	bl sub_804F0F4
	ldr r4, _0804F46C @ =word_203855E
	ldrh r1, [r4]
	movs r0, 0
	bl sub_80516C4
	ldr r5, _0804F470 @ =gUnknown_03004854
	ldr r0, [r5]
	movs r6, 0xBE
	lsls r6, 1
	adds r0, r6
	ldrh r1, [r4]
	bl sub_804E844
	ldrh r0, [r4]
	ldr r2, [r5]
	adds r1, r2, 0
	adds r1, 0x88
	ldrb r1, [r1]
	adds r2, r6
	bl sub_804F1BC
	movs r4, 0
	movs r6, 0
	mov r8, r5
	movs r7, 0xA6
	lsls r7, 1
_0804F430:
	ldr r0, [r5]
	lsls r1, r4, 1
	adds r0, 0x70
	adds r0, r1
	strh r6, [r0]
	adds r3, r4, 0x1
	adds r1, r4
	lsls r1, 1
	movs r2, 0x2
_0804F442:
	ldr r0, [r5]
	adds r0, r7
	adds r0, r1
	strh r6, [r0]
	adds r1, 0x2
	subs r2, 0x1
	cmp r2, 0
	bge _0804F442
	adds r4, r3, 0
	cmp r4, 0x3
	ble _0804F430
	mov r0, r8
	ldr r3, [r0]
	adds r1, r3, 0
	adds r1, 0x7C
	movs r2, 0
	movs r0, 0
	strh r0, [r1]
	strb r2, [r3, 0x1]
	b _0804F7E6
	.align 2, 0
_0804F46C: .4byte word_203855E
_0804F470: .4byte gUnknown_03004854
_0804F474:
	bl sub_804E2EC
	lsls r0, 24
	cmp r0, 0
	bne _0804F480
	b _0804F7E6
_0804F480:
	ldr r0, _0804F490 @ =gUnknown_03004854
	ldr r1, [r0]
	ldrb r0, [r1]
	adds r0, 0x1
	strb r0, [r1]
	bl sub_8051474
	b _0804F7E6
	.align 2, 0
_0804F490: .4byte gUnknown_03004854
_0804F494:
	movs r4, 0
	ldr r5, _0804F4DC @ =gUnknown_082162E4
	ldr r6, _0804F4E0 @ =gUnknown_03004854
_0804F49A:
	ldrb r1, [r5]
	ldrb r2, [r5, 0x1]
	ldr r0, _0804F4E4 @ =gSpriteTemplate_82163F4
	movs r3, 0x1
	bl CreateSprite
	ldr r1, [r6]
	adds r1, 0x60
	adds r1, r4
	strb r0, [r1]
	ldr r0, [r6]
	adds r0, 0x60
	adds r0, r4
	ldrb r1, [r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	ldr r1, _0804F4E8 @ =gSprites
	adds r0, r1
	adds r1, r4, 0
	adds r1, 0x8
	lsls r1, 24
	lsrs r1, 24
	bl StartSpriteAnim
	adds r5, 0x2
	adds r4, 0x1
	cmp r4, 0x3
	ble _0804F49A
	ldr r0, _0804F4E0 @ =gUnknown_03004854
	ldr r1, [r0]
	b _0804F74C
	.align 2, 0
_0804F4DC: .4byte gUnknown_082162E4
_0804F4E0: .4byte gUnknown_03004854
_0804F4E4: .4byte gSpriteTemplate_82163F4
_0804F4E8: .4byte gSprites
_0804F4EC:
	movs r0, 0x1
	negs r0, r0
	movs r4, 0
	str r4, [sp]
	movs r1, 0
	movs r2, 0x10
	movs r3, 0
	bl BeginNormalPaletteFade
	ldr r2, _0804F514 @ =gUnknown_03004854
	ldr r1, [r2]
	ldrb r0, [r1]
	adds r0, 0x1
	strb r0, [r1]
	ldr r0, [r2]
	movs r1, 0x98
	lsls r1, 1
	adds r0, r1
	str r4, [r0]
	b _0804F7E6
	.align 2, 0
_0804F514: .4byte gUnknown_03004854
_0804F518:
	mov r2, r8
	ldr r1, [r2]
	movs r3, 0x98
	lsls r3, 1
	adds r1, r3
	ldr r0, [r1]
	adds r0, 0x1
	str r0, [r1]
	cmp r0, 0x2
	bne _0804F530
	bl sub_804E4FC
_0804F530:
	ldr r0, _0804F548 @ =gPaletteFade
	ldrb r1, [r0, 0x7]
	movs r0, 0x80
	ands r0, r1
	cmp r0, 0
	beq _0804F53E
	b _0804F7E6
_0804F53E:
	mov r5, r8
	ldr r1, [r5]
	movs r0, 0x8
	strb r0, [r1]
	b _0804F7E6
	.align 2, 0
_0804F548: .4byte gPaletteFade
_0804F54C:
	mov r0, r8
	ldr r1, [r0]
	movs r2, 0
	movs r0, 0xB
	strb r0, [r1]
	mov r1, r8
	ldr r0, [r1]
	movs r3, 0x9E
	lsls r3, 1
	adds r0, r3
	strb r2, [r0]
	b _0804F7E6
_0804F564:
	lsls r1, 1
	adds r0, r3, 0
	adds r0, 0x80
	adds r0, r1
	ldrh r0, [r0]
	lsls r1, r4, 24
	lsrs r1, 24
	bl sub_804E7C0
	b _0804F5A2
_0804F578:
	movs r4, 0
	ldr r2, _0804F5C0 @ =gUnknown_082162EC
	ldr r0, _0804F5C4 @ =gUnknown_03004854
	ldr r3, [r0]
	adds r0, r3, 0
	adds r0, 0x88
	ldrb r0, [r0]
	subs r0, 0x2
	lsls r0, 2
	movs r5, 0x9E
	lsls r5, 1
	adds r1, r3, r5
	ldrb r1, [r1]
	adds r0, r2
_0804F594:
	ldrb r2, [r0]
	cmp r1, r2
	beq _0804F564
	adds r0, 0x1
	adds r4, 0x1
	cmp r4, 0x3
	ble _0804F594
_0804F5A2:
	ldr r3, _0804F5C4 @ =gUnknown_03004854
	ldr r1, [r3]
	movs r5, 0x98
	lsls r5, 1
	adds r2, r1, r5
	movs r0, 0
	str r0, [r2]
	ldrb r0, [r1]
	adds r0, 0x1
	strb r0, [r1]
	ldr r1, [r3]
	movs r0, 0x9E
	lsls r0, 1
	adds r1, r0
	b _0804F74C
	.align 2, 0
_0804F5C0: .4byte gUnknown_082162EC
_0804F5C4: .4byte gUnknown_03004854
_0804F5C8:
	mov r1, r8
	ldr r3, [r1]
	movs r2, 0x98
	lsls r2, 1
	adds r1, r3, r2
	ldr r0, [r1]
	adds r0, 0x1
	str r0, [r1]
	cmp r0, 0x3C
	bgt _0804F5DE
	b _0804F7E6
_0804F5DE:
	movs r5, 0x9E
	lsls r5, 1
	adds r0, r3, r5
	adds r4, r3, 0
	adds r4, 0x88
	ldrb r0, [r0]
	ldrb r1, [r4]
	cmp r0, r1
	bcc _0804F620
	ldr r2, _0804F614 @ =gUnknown_082162F8
	ldr r1, _0804F618 @ =gUnknown_08216300
	ldrb r0, [r4]
	subs r0, 0x2
	adds r0, r1
	ldrb r0, [r0]
	lsls r0, 1
	adds r0, r2
	ldr r2, _0804F61C @ =0xffffa800
	adds r1, r2, 0
	ldrh r0, [r0]
	adds r1, r0
	adds r0, r3, 0
	adds r0, 0x54
	strh r1, [r0]
	ldrb r0, [r3]
	adds r0, 0x1
	b _0804F624
	.align 2, 0
_0804F614: .4byte gUnknown_082162F8
_0804F618: .4byte gUnknown_08216300
_0804F61C: .4byte 0xffffa800
_0804F620:
	ldrb r0, [r3]
	subs r0, 0x1
_0804F624:
	strb r0, [r3]
	mov r3, r8
	ldr r0, [r3]
	movs r5, 0x98
	lsls r5, 1
	adds r0, r5
	movs r1, 0
	str r1, [r0]
	b _0804F7E6
_0804F636:
	mov r1, r8
	ldr r0, [r1]
	ldrb r1, [r0]
	adds r1, 0x1
	strb r1, [r0]
	bl sub_804F238
	movs r0, 0x2B
	bl PlaySE
	mov r2, r8
	ldr r0, [r2]
	b _0804F710
_0804F650:
	movs r2, 0x80
	lsls r2, 19
	ldrh r0, [r2]
	movs r5, 0x80
	lsls r5, 3
	adds r1, r5, 0
	orrs r0, r1
	strh r0, [r2]
	mov r0, r8
	ldr r2, [r0]
	adds r1, r2, 0
	adds r1, 0x54
	movs r3, 0x80
	lsls r3, 2
	adds r0, r3, 0
	ldrh r5, [r1]
	adds r0, r5
	strh r0, [r1]
	movs r0, 0xA1
	lsls r0, 1
	adds r1, r2, r0
	ldrh r0, [r1]
	adds r0, 0x4
	strh r0, [r1]
	lsls r0, 16
	lsrs r0, 16
	cmp r0, 0xFF
	bls _0804F6D6
	ldrb r0, [r2]
	adds r0, 0x1
	strb r0, [r2]
	mov r1, r8
	ldr r3, [r1]
	movs r2, 0xA1
	lsls r2, 1
	adds r1, r3, r2
	movs r0, 0x80
	lsls r0, 1
	strh r0, [r1]
	ldr r2, _0804F6E8 @ =gUnknown_082162F8
	ldr r1, _0804F6EC @ =gUnknown_08216300
	adds r0, r3, 0
	adds r0, 0x88
	ldrb r0, [r0]
	subs r0, 0x2
	adds r0, r1
	ldrb r0, [r0]
	lsls r0, 1
	adds r0, r2
	ldrh r1, [r0]
	adds r0, r3, 0
	adds r0, 0x54
	strh r1, [r0]
	ldr r1, _0804F6F0 @ =REG_BG2CNT
	ldr r5, _0804F6F4 @ =0x00004882
	adds r0, r5, 0
	strh r0, [r1]
	movs r0, 0x98
	lsls r0, 1
	adds r1, r3, r0
	movs r0, 0
	str r0, [r1]
	movs r0, 0x34
	bl PlaySE
	bl BuyMenuDrawFieldObjects
_0804F6D6:
	mov r1, r8
	ldr r0, [r1]
	movs r2, 0xB4
	lsls r2, 1
	adds r0, r2
	bl sub_8051414
	b _0804F7E6
	.align 2, 0
_0804F6E8: .4byte gUnknown_082162F8
_0804F6EC: .4byte gUnknown_08216300
_0804F6F0: .4byte REG_BG2CNT
_0804F6F4: .4byte 0x00004882
_0804F6F8:
	bl sub_8051B8C
	lsls r0, 24
	cmp r0, 0
	beq _0804F70C
	ldr r0, _0804F71C @ =gUnknown_03004854
	ldr r1, [r0]
	ldrb r0, [r1]
	adds r0, 0x1
	strb r0, [r1]
_0804F70C:
	ldr r0, _0804F71C @ =gUnknown_03004854
	ldr r0, [r0]
_0804F710:
	movs r3, 0xB4
	lsls r3, 1
	adds r0, r3
	bl sub_8051414
	b _0804F7E6
	.align 2, 0
_0804F71C: .4byte gUnknown_03004854
_0804F720:
	ldr r0, _0804F734 @ =gSpriteTemplate_8216548
	movs r2, 0x10
	negs r2, r2
	movs r1, 0x78
	movs r3, 0x3
	bl CreateSprite
	ldr r0, _0804F738 @ =gUnknown_03004854
	ldr r1, [r0]
	b _0804F74C
	.align 2, 0
_0804F734: .4byte gSpriteTemplate_8216548
_0804F738: .4byte gUnknown_03004854
_0804F73C:
	mov r5, r8
	ldr r1, [r5]
	b _0804F74C
_0804F742:
	mov r0, r8
	ldr r1, [r0]
	b _0804F74C
_0804F748:
	mov r2, r8
	ldr r1, [r2]
_0804F74C:
	ldrb r0, [r1]
	adds r0, 0x1
	strb r0, [r1]
	b _0804F7E6
_0804F754:
	bl sub_804F81C
	ldr r3, _0804F804 @ =gUnknown_03004854
	ldr r4, [r3]
	adds r5, r4, 0
	adds r5, 0x56
	movs r2, 0
	movs r1, 0
	movs r0, 0x80
	strh r0, [r5]
	movs r5, 0x96
	lsls r5, 1
	adds r0, r4, r5
	str r1, [r0]
	ldr r1, _0804F808 @ =0x0000014b
	adds r0, r4, r1
	strb r2, [r0]
	ldr r0, [r3]
	adds r0, 0x7E
	strb r2, [r0]
	ldr r0, _0804F80C @ =sub_80501FC
	bl SetMainCallback2
	movs r4, 0
	ldr r0, _0804F810 @ =gUnknown_0202E8CC
	ldrh r0, [r0]
	cmp r4, r0
	bge _0804F7B8
	movs r5, 0xA0
	lsls r5, 20
	ldr r6, _0804F814 @ =gUnknown_08216308
_0804F792:
	ldm r6!, {r0}
	lsrs r1, r5, 24
	bl CreateTask
	ldr r1, _0804F804 @ =gUnknown_03004854
	ldr r1, [r1]
	movs r2, 0xA4
	lsls r2, 1
	adds r1, r2
	adds r1, r4
	strb r0, [r1]
	movs r3, 0x80
	lsls r3, 17
	adds r5, r3
	adds r4, 0x1
	ldr r0, _0804F810 @ =gUnknown_0202E8CC
	ldrh r0, [r0]
	cmp r4, r0
	blt _0804F792
_0804F7B8:
	bl GetCurrentMapMusic
	lsls r0, 16
	lsrs r0, 16
	ldr r4, _0804F818 @ =0x00000193
	cmp r0, r4
	beq _0804F7D6
	bl GetCurrentMapMusic
	ldr r1, _0804F804 @ =gUnknown_03004854
	ldr r1, [r1]
	movs r5, 0xBC
	lsls r5, 1
	adds r1, r5
	strh r0, [r1]
_0804F7D6:
	adds r0, r4, 0
	bl PlayBGM
	movs r0, 0x35
	bl PlaySE
	bl sub_804E290
_0804F7E6:
	bl RunTasks
	bl AnimateSprites
	bl BuildOamBuffer
	bl UpdatePaletteFade
	add sp, 0x4
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_0804F804: .4byte gUnknown_03004854
_0804F808: .4byte 0x0000014b
_0804F80C: .4byte sub_80501FC
_0804F810: .4byte gUnknown_0202E8CC
_0804F814: .4byte gUnknown_08216308
_0804F818: .4byte 0x00000193
	thumb_func_end sub_804F378

	thumb_func_start sub_804F81C
sub_804F81C: @ 804F81C
	push {lr}
	ldr r3, _0804F83C @ =gSendCmd
	movs r0, 0
	ldr r1, _0804F840 @ =gRecvCmds
	movs r2, 0x3
_0804F826:
	strh r0, [r3]
	strh r0, [r3, 0x4]
	strh r0, [r1]
	strh r0, [r1, 0x10]
	adds r1, 0x2
	subs r2, 0x1
	cmp r2, 0
	bge _0804F826
	pop {r0}
	bx r0
	.align 2, 0
_0804F83C: .4byte gSendCmd
_0804F840: .4byte gRecvCmds
	thumb_func_end sub_804F81C

	thumb_func_start sub_804F844
sub_804F844: @ 804F844
	push {r4,lr}
	lsls r0, 24
	lsrs r3, r0, 24
	ldr r1, _0804F884 @ =gTasks
	lsls r0, r3, 2
	adds r0, r3
	lsls r0, 3
	adds r2, r0, r1
	ldrh r0, [r2, 0x8]
	adds r0, 0x1
	strh r0, [r2, 0x8]
	lsls r0, 16
	asrs r0, 16
	movs r4, 0xA
	ldrsh r1, [r2, r4]
	cmp r0, r1
	ble _0804F87C
	ldr r0, _0804F888 @ =gRecvCmds
	movs r4, 0xC
	ldrsh r1, [r2, r4]
	lsls r1, 1
	adds r0, 0x10
	adds r1, r0
	ldr r0, _0804F88C @ =0x00002345
	strh r0, [r1]
	adds r0, r3, 0
	bl DestroyTask
_0804F87C:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0804F884: .4byte gTasks
_0804F888: .4byte gRecvCmds
_0804F88C: .4byte 0x00002345
	thumb_func_end sub_804F844

	thumb_func_start sub_804F890
sub_804F890: @ 804F890
	push {r4,r5,lr}
	adds r5, r0, 0
	adds r4, r1, 0
	lsls r5, 24
	lsrs r5, 24
	lsls r4, 24
	lsrs r4, 24
	ldr r0, _0804F8C0 @ =sub_804F844
	movs r1, 0x50
	bl CreateTask
	lsls r0, 24
	lsrs r0, 24
	ldr r2, _0804F8C4 @ =gTasks
	lsls r1, r0, 2
	adds r1, r0
	lsls r1, 3
	adds r1, r2
	strh r4, [r1, 0xA]
	strh r5, [r1, 0xC]
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_0804F8C0: .4byte sub_804F844
_0804F8C4: .4byte gTasks
	thumb_func_end sub_804F890

	thumb_func_start sub_804F8C8
sub_804F8C8: @ 804F8C8
	push {r4-r6,lr}
	lsls r0, 24
	lsrs r5, r0, 24
	ldr r4, _0804F934 @ =gUnknown_03004854
	ldr r0, [r4]
	adds r0, 0x54
	ldrh r0, [r0]
	movs r1, 0x1
	bl task_tutorial_oak_boy_girl
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x2
	beq _0804F8E6
	b _0804F9DC
_0804F8E6:
	ldr r2, _0804F938 @ =gTasks
	lsls r1, r5, 2
	adds r0, r1, r5
	lsls r0, 3
	adds r0, r2
	movs r2, 0x8
	ldrsh r0, [r0, r2]
	adds r6, r1, 0
	cmp r0, 0
	beq _0804F8FC
	b _0804F9EA
_0804F8FC:
	ldr r0, [r4]
	ldr r1, _0804F93C @ =0x0000014b
	adds r0, r1
	ldrb r0, [r0]
	cmp r0, 0
	bne _0804F9BE
	bl Random
	lsls r0, 16
	lsrs r0, 16
	ldr r1, _0804F940 @ =0x0000028f
	bl __udivsi3
	lsls r0, 24
	lsrs r1, r0, 24
	adds r3, r1, 0
	ldr r0, [r4]
	adds r0, 0x56
	movs r4, 0
	ldrsh r2, [r0, r4]
	ldr r0, _0804F944 @ =0x000001f3
	cmp r2, r0
	bgt _0804F964
	cmp r1, 0x4B
	bls _0804F950
	ldr r1, _0804F948 @ =gRecvCmds
	ldr r0, _0804F94C @ =0x00004523
	b _0804F954
	.align 2, 0
_0804F934: .4byte gUnknown_03004854
_0804F938: .4byte gTasks
_0804F93C: .4byte 0x0000014b
_0804F940: .4byte 0x0000028f
_0804F944: .4byte 0x000001f3
_0804F948: .4byte gRecvCmds
_0804F94C: .4byte 0x00004523
_0804F950:
	ldr r1, _0804F95C @ =gRecvCmds
	ldr r0, _0804F960 @ =0x00005432
_0804F954:
	strh r0, [r1, 0x12]
	ldr r0, _0804F960 @ =0x00005432
	b _0804F9C2
	.align 2, 0
_0804F95C: .4byte gRecvCmds
_0804F960: .4byte 0x00005432
_0804F964:
	ldr r0, _0804F980 @ =0x000005db
	cmp r2, r0
	bgt _0804F992
	cmp r1, 0x50
	bhi _0804F9BE
	adds r0, r1, 0
	subs r0, 0x15
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x3B
	bhi _0804F98C
	ldr r1, _0804F984 @ =gRecvCmds
	ldr r0, _0804F988 @ =0x00005432
	b _0804F9C2
	.align 2, 0
_0804F980: .4byte 0x000005db
_0804F984: .4byte gRecvCmds
_0804F988: .4byte 0x00005432
_0804F98C:
	cmp r1, 0x9
	bhi _0804F9C4
	b _0804F9B4
_0804F992:
	cmp r1, 0x5A
	bhi _0804F9BE
	adds r0, r1, 0
	subs r0, 0x47
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x13
	bhi _0804F9B0
	ldr r1, _0804F9A8 @ =gRecvCmds
	ldr r0, _0804F9AC @ =0x00005432
	b _0804F9C2
	.align 2, 0
_0804F9A8: .4byte gRecvCmds
_0804F9AC: .4byte 0x00005432
_0804F9B0:
	cmp r3, 0x1D
	bhi _0804F9C4
_0804F9B4:
	movs r0, 0x1
	movs r1, 0x5
	bl sub_804F890
	b _0804F9C4
_0804F9BE:
	ldr r1, _0804F9D0 @ =gRecvCmds
	ldr r0, _0804F9D4 @ =0x00004523
_0804F9C2:
	strh r0, [r1, 0x12]
_0804F9C4:
	ldr r0, _0804F9D8 @ =gTasks
	adds r1, r6, r5
	lsls r1, 3
	adds r1, r0
	movs r0, 0x1
	b _0804F9E8
	.align 2, 0
_0804F9D0: .4byte gRecvCmds
_0804F9D4: .4byte 0x00004523
_0804F9D8: .4byte gTasks
_0804F9DC:
	ldr r0, _0804F9F0 @ =gTasks
	lsls r1, r5, 2
	adds r1, r5
	lsls r1, 3
	adds r1, r0
	movs r0, 0
_0804F9E8:
	strh r0, [r1, 0x8]
_0804F9EA:
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_0804F9F0: .4byte gTasks
	thumb_func_end sub_804F8C8

	thumb_func_start sub_804F9F4
sub_804F9F4: @ 804F9F4
	push {r4-r6,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	ldr r6, _0804FA78 @ =gUnknown_03004854
	ldr r3, [r6]
	adds r0, r3, 0
	adds r0, 0x54
	ldrh r0, [r0]
	movs r1, 0xC0
	lsls r1, 5
	adds r0, r1
	ldr r1, _0804FA7C @ =0x0000ffff
	ands r0, r1
	adds r1, r3, 0
	adds r1, 0xA6
	ldrb r1, [r1]
	lsrs r2, r0, 8
	ldr r0, _0804FA80 @ =gUnknown_08216303
	adds r1, r0
	ldrb r1, [r1]
	adds r0, r1, 0
	adds r0, 0x14
	cmp r2, r0
	bls _0804FB04
	adds r0, 0x14
	cmp r2, r0
	bcs _0804FB04
	ldr r2, _0804FA84 @ =gTasks
	lsls r1, r4, 2
	adds r0, r1, r4
	lsls r0, 3
	adds r2, r0, r2
	movs r5, 0x8
	ldrsh r0, [r2, r5]
	adds r5, r1, 0
	cmp r0, 0
	bne _0804FB12
	ldr r1, _0804FA88 @ =0x0000014b
	adds r0, r3, r1
	ldrb r0, [r0]
	cmp r0, 0
	bne _0804FAF0
	bl Random
	lsls r0, 16
	lsrs r0, 16
	ldr r1, _0804FA8C @ =0x0000028f
	bl __udivsi3
	lsls r0, 24
	lsrs r2, r0, 24
	adds r3, r2, 0
	ldr r0, [r6]
	adds r0, 0x56
	movs r6, 0
	ldrsh r1, [r0, r6]
	ldr r0, _0804FA90 @ =0x000001f3
	cmp r1, r0
	bgt _0804FAAC
	cmp r2, 0x42
	bls _0804FA9C
	ldr r1, _0804FA94 @ =gRecvCmds
	ldr r0, _0804FA98 @ =0x00004523
	strh r0, [r1, 0x14]
	b _0804FAD4
	.align 2, 0
_0804FA78: .4byte gUnknown_03004854
_0804FA7C: .4byte 0x0000ffff
_0804FA80: .4byte gUnknown_08216303
_0804FA84: .4byte gTasks
_0804FA88: .4byte 0x0000014b
_0804FA8C: .4byte 0x0000028f
_0804FA90: .4byte 0x000001f3
_0804FA94: .4byte gRecvCmds
_0804FA98: .4byte 0x00004523
_0804FA9C:
	ldr r1, _0804FAA4 @ =gRecvCmds
	ldr r0, _0804FAA8 @ =0x00005432
	strh r0, [r1, 0x14]
	b _0804FAD4
	.align 2, 0
_0804FAA4: .4byte gRecvCmds
_0804FAA8: .4byte 0x00005432
_0804FAAC:
	cmp r2, 0x41
	bls _0804FAB6
	ldr r1, _0804FAE0 @ =gRecvCmds
	ldr r0, _0804FAE4 @ =0x00004523
	strh r0, [r1, 0x14]
_0804FAB6:
	adds r0, r2, 0
	subs r0, 0x29
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x18
	bhi _0804FAC8
	ldr r1, _0804FAE0 @ =gRecvCmds
	ldr r0, _0804FAE8 @ =0x00005432
	strh r0, [r1, 0x14]
_0804FAC8:
	cmp r3, 0x9
	bhi _0804FAD4
	movs r0, 0x2
	movs r1, 0x5
	bl sub_804F890
_0804FAD4:
	ldr r0, _0804FAEC @ =gTasks
	adds r1, r5, r4
	lsls r1, 3
	adds r1, r0
	movs r0, 0x1
	b _0804FB10
	.align 2, 0
_0804FAE0: .4byte gRecvCmds
_0804FAE4: .4byte 0x00004523
_0804FAE8: .4byte 0x00005432
_0804FAEC: .4byte gTasks
_0804FAF0:
	ldr r0, _0804FAFC @ =gRecvCmds
	ldr r1, _0804FB00 @ =0x00004523
	strh r1, [r0, 0x14]
	movs r0, 0x1
	strh r0, [r2, 0x8]
	b _0804FB12
	.align 2, 0
_0804FAFC: .4byte gRecvCmds
_0804FB00: .4byte 0x00004523
_0804FB04:
	ldr r0, _0804FB18 @ =gTasks
	lsls r1, r4, 2
	adds r1, r4
	lsls r1, 3
	adds r1, r0
	movs r0, 0
_0804FB10:
	strh r0, [r1, 0x8]
_0804FB12:
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_0804FB18: .4byte gTasks
	thumb_func_end sub_804F9F4

	thumb_func_start sub_804FB1C
sub_804FB1C: @ 804FB1C
	push {r4-r6,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	ldr r5, _0804FB9C @ =gUnknown_03004854
	ldr r3, [r5]
	adds r0, r3, 0
	adds r0, 0x54
	ldrh r0, [r0]
	movs r1, 0xC0
	lsls r1, 5
	adds r0, r1
	ldr r1, _0804FBA0 @ =0x0000ffff
	ands r0, r1
	adds r1, r3, 0
	adds r1, 0xA8
	ldrb r1, [r1]
	lsrs r2, r0, 8
	ldr r0, _0804FBA4 @ =gUnknown_08216303
	adds r1, r0
	ldrb r1, [r1]
	adds r0, r1, 0
	adds r0, 0x14
	cmp r2, r0
	bls _0804FC30
	adds r0, 0x14
	cmp r2, r0
	bcs _0804FC30
	ldr r2, _0804FBA8 @ =gTasks
	lsls r1, r4, 2
	adds r0, r1, r4
	lsls r0, 3
	adds r2, r0, r2
	movs r6, 0x8
	ldrsh r0, [r2, r6]
	adds r6, r1, 0
	cmp r0, 0
	bne _0804FC3E
	ldr r1, _0804FBAC @ =0x0000014b
	adds r0, r3, r1
	ldrb r0, [r0]
	cmp r0, 0
	bne _0804FC1C
	bl Random
	lsls r0, 16
	lsrs r0, 16
	ldr r1, _0804FBB0 @ =0x0000028f
	bl __udivsi3
	lsls r0, 24
	lsrs r2, r0, 24
	ldr r0, [r5]
	adds r0, 0x56
	movs r3, 0
	ldrsh r1, [r0, r3]
	ldr r0, _0804FBB4 @ =0x000001f3
	cmp r1, r0
	bgt _0804FBD0
	cmp r2, 0x58
	bls _0804FBC0
	ldr r1, _0804FBB8 @ =gRecvCmds
	ldr r0, _0804FBBC @ =0x00004523
	strh r0, [r1, 0x16]
	b _0804FC02
	.align 2, 0
_0804FB9C: .4byte gUnknown_03004854
_0804FBA0: .4byte 0x0000ffff
_0804FBA4: .4byte gUnknown_08216303
_0804FBA8: .4byte gTasks
_0804FBAC: .4byte 0x0000014b
_0804FBB0: .4byte 0x0000028f
_0804FBB4: .4byte 0x000001f3
_0804FBB8: .4byte gRecvCmds
_0804FBBC: .4byte 0x00004523
_0804FBC0:
	ldr r1, _0804FBC8 @ =gRecvCmds
	ldr r0, _0804FBCC @ =0x00005432
	strh r0, [r1, 0x16]
	b _0804FC02
	.align 2, 0
_0804FBC8: .4byte gRecvCmds
_0804FBCC: .4byte 0x00005432
_0804FBD0:
	cmp r2, 0x3C
	bls _0804FBE4
	ldr r1, _0804FBDC @ =gRecvCmds
	ldr r0, _0804FBE0 @ =0x00004523
	b _0804FBF4
	.align 2, 0
_0804FBDC: .4byte gRecvCmds
_0804FBE0: .4byte 0x00004523
_0804FBE4:
	adds r0, r2, 0
	subs r0, 0x38
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x4
	bhi _0804FBF6
	ldr r1, _0804FC10 @ =gRecvCmds
	ldr r0, _0804FC14 @ =0x00005432
_0804FBF4:
	strh r0, [r1, 0x16]
_0804FBF6:
	cmp r2, 0x4
	bhi _0804FC02
	movs r0, 0x3
	movs r1, 0x5
	bl sub_804F890
_0804FC02:
	ldr r0, _0804FC18 @ =gTasks
	adds r1, r6, r4
	lsls r1, 3
	adds r1, r0
	movs r0, 0x1
	b _0804FC3C
	.align 2, 0
_0804FC10: .4byte gRecvCmds
_0804FC14: .4byte 0x00005432
_0804FC18: .4byte gTasks
_0804FC1C:
	ldr r0, _0804FC28 @ =gRecvCmds
	ldr r1, _0804FC2C @ =0x00004523
	strh r1, [r0, 0x16]
	movs r0, 0x1
	strh r0, [r2, 0x8]
	b _0804FC3E
	.align 2, 0
_0804FC28: .4byte gRecvCmds
_0804FC2C: .4byte 0x00004523
_0804FC30:
	ldr r0, _0804FC44 @ =gTasks
	lsls r1, r4, 2
	adds r1, r4
	lsls r1, 3
	adds r1, r0
	movs r0, 0
_0804FC3C:
	strh r0, [r1, 0x8]
_0804FC3E:
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_0804FC44: .4byte gTasks
	thumb_func_end sub_804FB1C

	thumb_func_start sub_804FC48
sub_804FC48: @ 804FC48
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	lsls r0, 16
	lsrs r7, r0, 16
	mov r8, r7
	lsls r1, 24
	ldr r0, _0804FCBC @ =gSpriteTemplate_821645C
	ldr r4, _0804FCC0 @ =gUnknown_082162E4
	lsrs r1, 23
	adds r2, r1, r4
	ldrb r6, [r2]
	ldr r5, _0804FCC4 @ =gUnknown_082162CC
	adds r2, r1, r5
	movs r3, 0
	ldrsb r3, [r2, r3]
	lsls r2, r3, 2
	adds r2, r3
	lsls r2, 1
	subs r6, r2
	adds r4, 0x1
	adds r4, r1, r4
	ldrb r2, [r4]
	adds r5, 0x1
	adds r1, r5
	movs r3, 0
	ldrsb r3, [r1, r3]
	lsls r1, r3, 2
	adds r1, r3
	lsls r1, 1
	subs r2, r1
	adds r1, r6, 0
	movs r3, 0x1
	bl CreateSprite
	lsls r0, 24
	lsrs r1, r0, 24
	adds r2, r1, 0
	ldr r0, _0804FCC8 @ =0x00004523
	cmp r7, r0
	bne _0804FCD4
	lsls r4, r1, 4
	adds r4, r1
	lsls r4, 2
	ldr r5, _0804FCCC @ =gSprites
	adds r0, r4, r5
	movs r1, 0x2
	bl StartSpriteAnim
	adds r5, 0x1C
	adds r4, r5
	ldr r0, _0804FCD0 @ =sub_8051684
	str r0, [r4]
	movs r0, 0x28
	bl PlaySE
	b _0804FD18
	.align 2, 0
_0804FCBC: .4byte gSpriteTemplate_821645C
_0804FCC0: .4byte gUnknown_082162E4
_0804FCC4: .4byte gUnknown_082162CC
_0804FCC8: .4byte 0x00004523
_0804FCCC: .4byte gSprites
_0804FCD0: .4byte sub_8051684
_0804FCD4:
	ldr r0, _0804FCF4 @ =0x00005432
	cmp r7, r0
	bne _0804FCFC
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	ldr r1, _0804FCF8 @ =gSprites
	adds r0, r1
	movs r1, 0
	bl StartSpriteAnim
	movs r0, 0x1F
	bl PlaySE
	b _0804FD18
	.align 2, 0
_0804FCF4: .4byte 0x00005432
_0804FCF8: .4byte gSprites
_0804FCFC:
	ldr r0, _0804FD28 @ =0x00002345
	cmp r8, r0
	bne _0804FD18
	lsls r0, r2, 4
	adds r0, r2
	lsls r0, 2
	ldr r1, _0804FD2C @ =gSprites
	adds r0, r1
	movs r1, 0x1
	bl StartSpriteAnim
	movs r0, 0x20
	bl PlaySE
_0804FD18:
	bl sub_805156C
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_0804FD28: .4byte 0x00002345
_0804FD2C: .4byte gSprites
	thumb_func_end sub_804FC48

	thumb_func_start sub_804FD30
sub_804FD30: @ 804FD30
	push {r4-r7,lr}
	lsls r0, 16
	lsrs r4, r0, 16
	adds r5, r4, 0
	bl sub_804E290
	ldr r0, _0804FD50 @ =0x00004523
	cmp r4, r0
	beq _0804FD64
	cmp r4, r0
	bgt _0804FD58
	ldr r0, _0804FD54 @ =0x00002345
	cmp r4, r0
	beq _0804FE34
	b _0804FE60
	.align 2, 0
_0804FD50: .4byte 0x00004523
_0804FD54: .4byte 0x00002345
_0804FD58:
	ldr r0, _0804FD60 @ =0x00005432
	cmp r5, r0
	beq _0804FDFC
	b _0804FE60
	.align 2, 0
_0804FD60: .4byte 0x00005432
_0804FD64:
	ldr r7, _0804FD94 @ =gUnknown_03004854
	ldr r4, [r7]
	adds r5, r4, 0
	adds r5, 0x56
	ldrh r6, [r5]
	movs r0, 0
	ldrsh r1, [r5, r0]
	ldr r0, _0804FD98 @ =0x000005db
	cmp r1, r0
	bgt _0804FDA0
	ldr r1, _0804FD9C @ =gUnknown_082165DA
	adds r0, r4, 0
	adds r0, 0x88
	ldrb r0, [r0]
	adds r0, r1
	ldrb r1, [r0]
	movs r0, 0xC0
	lsls r0, 1
	bl __divsi3
	adds r0, r6, r0
	strh r0, [r5]
	b _0804FE60
	.align 2, 0
_0804FD94: .4byte gUnknown_03004854
_0804FD98: .4byte 0x000005db
_0804FD9C: .4byte gUnknown_082165DA
_0804FDA0:
	ldr r1, _0804FDF8 @ =gUnknown_082165DA
	adds r0, r4, 0
	adds r0, 0x88
	ldrb r0, [r0]
	adds r0, r1
	ldrb r1, [r0]
	movs r0, 0x80
	bl __divsi3
	adds r0, r6, r0
	strh r0, [r5]
	movs r1, 0xA2
	lsls r1, 1
	adds r4, r1
	movs r1, 0
	ldrsh r0, [r5, r1]
	movs r1, 0x64
	bl __divsi3
	adds r1, r0, 0
	subs r1, 0xA
	lsls r1, 16
	lsrs r1, 16
	adds r0, r4, 0
	bl sub_8051AC8
	ldr r0, [r7]
	movs r1, 0xA3
	lsls r1, 1
	adds r4, r0, r1
	adds r0, 0x56
	movs r1, 0
	ldrsh r0, [r0, r1]
	movs r1, 0x64
	bl __divsi3
	adds r1, r0, 0
	subs r1, 0xA
	lsls r1, 16
	lsrs r1, 16
	adds r0, r4, 0
	bl sub_8051AC8
	b _0804FE60
	.align 2, 0
_0804FDF8: .4byte gUnknown_082165DA
_0804FDFC:
	ldr r0, _0804FE28 @ =gUnknown_03004854
	ldr r2, [r0]
	adds r4, r2, 0
	adds r4, 0x56
	ldrh r5, [r4]
	movs r0, 0
	ldrsh r1, [r4, r0]
	ldr r0, _0804FE2C @ =0x000005db
	cmp r1, r0
	bgt _0804FE60
	ldr r1, _0804FE30 @ =gUnknown_082165DA
	adds r0, r2, 0
	adds r0, 0x88
	ldrb r0, [r0]
	adds r0, r1
	ldrb r1, [r0]
	movs r0, 0x80
	lsls r0, 1
	bl __divsi3
	adds r0, r5, r0
	b _0804FE5E
	.align 2, 0
_0804FE28: .4byte gUnknown_03004854
_0804FE2C: .4byte 0x000005db
_0804FE30: .4byte gUnknown_082165DA
_0804FE34:
	ldr r0, _0804FE68 @ =gUnknown_03004854
	ldr r0, [r0]
	adds r4, r0, 0
	adds r4, 0x56
	ldr r1, _0804FE6C @ =gUnknown_082165DA
	adds r0, 0x88
	ldrb r0, [r0]
	adds r0, r1
	ldrb r1, [r0]
	movs r0, 0x80
	lsls r0, 1
	bl __divsi3
	ldrh r1, [r4]
	subs r1, r0
	strh r1, [r4]
	lsls r1, 16
	asrs r1, 16
	cmp r1, 0x7F
	bgt _0804FE60
	movs r0, 0x80
_0804FE5E:
	strh r0, [r4]
_0804FE60:
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_0804FE68: .4byte gUnknown_03004854
_0804FE6C: .4byte gUnknown_082165DA
	thumb_func_end sub_804FD30

	thumb_func_start sub_804FE70
sub_804FE70: @ 804FE70
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	sub sp, 0x4
	ldr r0, _0804FF40 @ =gUnknown_0202E8CC
	ldrh r0, [r0]
	cmp r0, 0
	beq _0804FEB6
	ldr r3, _0804FF44 @ =gSendCmd
	ldrh r0, [r3, 0x4]
	ldr r2, _0804FF48 @ =gRecvCmds
	cmp r0, 0
	beq _0804FE98
	movs r1, 0
	strh r0, [r2, 0x10]
	ldr r0, _0804FF4C @ =0x00004444
	strh r0, [r2]
	strh r1, [r3, 0x4]
_0804FE98:
	ldr r0, _0804FF48 @ =gRecvCmds
	ldr r3, _0804FF4C @ =0x00004444
	adds r1, r2, 0x2
	adds r2, r0, 0
	adds r2, 0x12
	movs r6, 0x2
_0804FEA4:
	ldrh r0, [r2]
	cmp r0, 0
	beq _0804FEAC
	strh r3, [r1]
_0804FEAC:
	adds r1, 0x2
	adds r2, 0x2
	subs r6, 0x1
	cmp r6, 0
	bge _0804FEA4
_0804FEB6:
	movs r6, 0
	ldr r7, _0804FF50 @ =gUnknown_03004854
	adds r1, r7, 0
	ldr r0, [r1]
	adds r0, 0x88
	ldrb r0, [r0]
	cmp r6, r0
	blt _0804FEC8
	b _0805005C
_0804FEC8:
	movs r2, 0
	str r2, [sp]
	mov r9, r2
	ldr r0, _0804FF48 @ =gRecvCmds
	adds r0, 0x10
	mov r8, r0
	ldr r1, _0804FF54 @ =0x00005432
	mov r10, r1
_0804FED8:
	ldr r2, [sp]
	ldr r1, _0804FF48 @ =gRecvCmds
	adds r0, r2, r1
	ldrh r1, [r0]
	ldr r0, _0804FF4C @ =0x00004444
	cmp r1, r0
	beq _0804FEE8
	b _0805003E
_0804FEE8:
	ldr r0, [r7]
	adds r0, 0xA2
	adds r0, r2
	ldrh r5, [r0]
	mov r2, r8
	ldrh r4, [r2]
	ldr r0, _0804FF58 @ =0x00004523
	cmp r4, r0
	bne _0804FF60
	bl sub_804FD30
	ldr r0, [r7]
	movs r1, 0x9F
	lsls r1, 1
	adds r4, r0, r1
	adds r0, 0x56
	movs r2, 0
	ldrsh r0, [r0, r2]
	movs r1, 0x37
	bl __divsi3
	ldrh r1, [r4]
	adds r1, r0
	strh r1, [r4]
	lsls r1, 16
	ldr r0, _0804FF5C @ =0x03e70000
	cmp r1, r0
	bls _0804FF26
	movs r0, 0xFA
	lsls r0, 2
	strh r0, [r4]
_0804FF26:
	lsls r1, r5, 24
	lsrs r1, 24
	ldr r0, _0804FF58 @ =0x00004523
	bl sub_804FC48
	ldr r1, [r7]
	movs r0, 0xA6
	lsls r0, 1
	adds r1, r0
	add r1, r9
	ldrh r0, [r1]
	adds r0, 0x1
	b _0804FFCA
	.align 2, 0
_0804FF40: .4byte gUnknown_0202E8CC
_0804FF44: .4byte gSendCmd
_0804FF48: .4byte gRecvCmds
_0804FF4C: .4byte 0x00004444
_0804FF50: .4byte gUnknown_03004854
_0804FF54: .4byte 0x00005432
_0804FF58: .4byte 0x00004523
_0804FF5C: .4byte 0x03e70000
_0804FF60:
	cmp r4, r10
	bne _0804FF9E
	mov r0, r10
	bl sub_804FD30
	ldr r0, [r7]
	movs r1, 0x9F
	lsls r1, 1
	adds r4, r0, r1
	adds r0, 0x56
	movs r2, 0
	ldrsh r0, [r0, r2]
	movs r1, 0x46
	bl __divsi3
	ldrh r1, [r4]
	adds r1, r0
	strh r1, [r4]
	lsls r1, r5, 24
	lsrs r1, 24
	mov r0, r10
	bl sub_804FC48
	ldr r1, [r7]
	movs r0, 0xA7
	lsls r0, 1
	adds r1, r0
	add r1, r9
	ldrh r0, [r1]
	adds r0, 0x1
	b _0804FFCA
_0804FF9E:
	ldr r0, _08050018 @ =0x00002345
	cmp r4, r0
	bne _0804FFD6
	lsls r1, r5, 24
	lsrs r1, 24
	adds r0, r4, 0
	bl sub_804FC48
	adds r0, r4, 0
	bl sub_804FD30
	ldr r0, [r7]
	movs r1, 0xA8
	lsls r1, 1
	adds r0, r1
	mov r2, r9
	adds r1, r0, r2
	ldrh r2, [r1]
	ldr r0, _0805001C @ =0x000003e6
	cmp r2, r0
	bhi _0804FFCC
	adds r0, r2, 0x1
_0804FFCA:
	strh r0, [r1]
_0804FFCC:
	mov r0, r8
	ldrh r1, [r0]
	ldr r0, _08050018 @ =0x00002345
	cmp r1, r0
	beq _0804FFE4
_0804FFD6:
	mov r1, r8
	ldrh r0, [r1]
	ldr r2, _08050020 @ =0x00004523
	cmp r0, r2
	beq _0804FFE4
	cmp r0, r10
	bne _0805003E
_0804FFE4:
	ldr r0, _08050024 @ =gUnknown_03004854
	ldr r0, [r0]
	adds r2, r0, 0
	adds r2, 0x56
	movs r0, 0
	ldrsh r1, [r2, r0]
	ldr r0, _08050028 @ =0x000005dc
	cmp r1, r0
	ble _08050034
	adds r0, r1, 0
	ldr r2, _0805002C @ =0xfffffd12
	adds r0, r2
	movs r1, 0x14
	bl __divsi3
	adds r1, r0, 0
	movs r0, 0x80
	lsls r0, 1
	adds r1, r0
	lsls r1, 16
	lsrs r1, 16
	ldr r0, _08050030 @ =gMPlay_BGM
	bl m4aMPlayTempoControl
	b _0805003E
	.align 2, 0
_08050018: .4byte 0x00002345
_0805001C: .4byte 0x000003e6
_08050020: .4byte 0x00004523
_08050024: .4byte gUnknown_03004854
_08050028: .4byte 0x000005dc
_0805002C: .4byte 0xfffffd12
_08050030: .4byte gMPlay_BGM
_08050034:
	ldr r0, _08050098 @ =gMPlay_BGM
	movs r1, 0x80
	lsls r1, 1
	bl m4aMPlayTempoControl
_0805003E:
	ldr r1, [sp]
	adds r1, 0x2
	str r1, [sp]
	movs r2, 0x6
	add r9, r2
	movs r0, 0x2
	add r8, r0
	adds r6, 0x1
	ldr r7, _0805009C @ =gUnknown_03004854
	ldr r0, [r7]
	adds r0, 0x88
	ldrb r0, [r0]
	cmp r6, r0
	bge _0805005C
	b _0804FED8
_0805005C:
	ldr r0, _080500A0 @ =gUnknown_0202E8CC
	ldrh r0, [r0]
	cmp r0, 0
	beq _08050088
	movs r6, 0
	ldr r3, _0805009C @ =gUnknown_03004854
	ldr r0, [r3]
	adds r0, 0x88
	ldrb r0, [r0]
	cmp r6, r0
	bge _08050088
	movs r2, 0
	ldr r1, _080500A4 @ =gRecvCmds
_08050076:
	strh r2, [r1]
	strh r2, [r1, 0x10]
	adds r1, 0x2
	adds r6, 0x1
	ldr r0, [r3]
	adds r0, 0x88
	ldrb r0, [r0]
	cmp r6, r0
	blt _08050076
_08050088:
	add sp, 0x4
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_08050098: .4byte gMPlay_BGM
_0805009C: .4byte gUnknown_03004854
_080500A0: .4byte gUnknown_0202E8CC
_080500A4: .4byte gRecvCmds
	thumb_func_end sub_804FE70

	thumb_func_start sub_80500A8
sub_80500A8: @ 80500A8
	push {r4-r6,lr}
	movs r6, 0
	ldr r5, _080500EC @ =gUnknown_03004854
	ldr r4, [r5]
	bl GetMultiplayerId
	lsls r0, 24
	lsrs r0, 23
	adds r4, 0xA2
	adds r4, r0
	ldrb r3, [r4]
	ldr r0, [r5]
	adds r0, 0x6F
	ldrb r0, [r0]
	cmp r0, 0
	bne _0805018A
	ldr r0, _080500F0 @ =gSaveBlock2
	ldrb r0, [r0, 0x13]
	cmp r0, 0x2
	bne _080500FC
	ldr r2, _080500F4 @ =gMain
	ldrh r1, [r2, 0x2E]
	movs r0, 0x1
	ands r0, r1
	cmp r0, 0
	beq _0805010A
	ldrh r0, [r2, 0x28]
	ldr r1, _080500F8 @ =0x00000201
	bics r1, r0
	negs r0, r1
	orrs r0, r1
	lsrs r6, r0, 31
	b _0805010A
	.align 2, 0
_080500EC: .4byte gUnknown_03004854
_080500F0: .4byte gSaveBlock2
_080500F4: .4byte gMain
_080500F8: .4byte 0x00000201
_080500FC:
	ldr r0, _0805015C @ =gMain
	ldrh r1, [r0, 0x2E]
	movs r0, 0x1
	ands r0, r1
	cmp r0, 0
	beq _0805010A
	movs r6, 0x1
_0805010A:
	cmp r6, 0
	beq _0805018A
	ldr r4, _08050160 @ =gUnknown_03004854
	ldr r1, [r4]
	lsls r2, r3, 1
	adds r0, r1, 0
	adds r0, 0x9A
	adds r0, r2
	adds r1, 0x5C
	ldrh r0, [r0]
	adds r1, r0
	ldrb r1, [r1]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	ldr r1, _08050164 @ =gSprites
	adds r0, r1
	adds r1, r3, 0x4
	lsls r1, 24
	lsrs r1, 24
	bl StartSpriteAnim
	ldr r0, [r4]
	adds r0, 0x54
	ldrh r4, [r0]
	bl GetMultiplayerId
	adds r1, r0, 0
	lsls r1, 24
	lsrs r1, 24
	adds r0, r4, 0
	bl task_tutorial_oak_boy_girl
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x2
	bne _08050170
	ldr r1, _08050168 @ =gSendCmd
	ldr r0, _0805016C @ =0x00004523
	b _08050188
	.align 2, 0
_0805015C: .4byte gMain
_08050160: .4byte gUnknown_03004854
_08050164: .4byte gSprites
_08050168: .4byte gSendCmd
_0805016C: .4byte 0x00004523
_08050170:
	cmp r0, 0x1
	bne _08050184
	ldr r1, _0805017C @ =gSendCmd
	ldr r0, _08050180 @ =0x00005432
	b _08050188
	.align 2, 0
_0805017C: .4byte gSendCmd
_08050180: .4byte 0x00005432
_08050184:
	ldr r1, _080501E4 @ =gSendCmd
	ldr r0, _080501E8 @ =0x00002345
_08050188:
	strh r0, [r1, 0x4]
_0805018A:
	ldr r2, _080501EC @ =gUnknown_03004854
	ldr r1, [r2]
	adds r1, 0x7E
	ldrb r0, [r1]
	adds r0, 0x1
	strb r0, [r1]
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x5
	bls _080501BA
	ldr r0, [r2]
	adds r1, r0, 0
	adds r1, 0x56
	ldrh r3, [r1]
	movs r4, 0
	ldrsh r0, [r1, r4]
	cmp r0, 0x80
	ble _080501B2
	subs r0, r3, 0x1
	strh r0, [r1]
_080501B2:
	ldr r0, [r2]
	adds r0, 0x7E
	movs r1, 0
	strb r1, [r0]
_080501BA:
	ldr r0, _080501F0 @ =gUnknown_020297ED
	ldrb r0, [r0]
	cmp r0, 0
	beq _080501DE
	ldr r0, _080501F4 @ =gMain
	ldrh r1, [r0, 0x2E]
	movs r0, 0x80
	lsls r0, 2
	ands r0, r1
	cmp r0, 0
	beq _080501DE
	ldr r0, [r2]
	ldr r1, _080501F8 @ =0x0000014b
	adds r2, r0, r1
	ldrb r0, [r2]
	movs r1, 0x1
	eors r0, r1
	strb r0, [r2]
_080501DE:
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_080501E4: .4byte gSendCmd
_080501E8: .4byte 0x00002345
_080501EC: .4byte gUnknown_03004854
_080501F0: .4byte gUnknown_020297ED
_080501F4: .4byte gMain
_080501F8: .4byte 0x0000014b
	thumb_func_end sub_80500A8

	thumb_func_start sub_80501FC
sub_80501FC: @ 80501FC
	push {r4-r6,lr}
	bl sub_8051474
	ldr r4, _08050294 @ =gUnknown_03004854
	ldr r0, [r4]
	movs r1, 0x96
	lsls r1, 1
	adds r2, r0, r1
	ldr r1, [r2]
	ldr r0, _08050298 @ =0x00057e03
	cmp r1, r0
	bhi _08050218
	adds r0, r1, 0x1
	str r0, [r2]
_08050218:
	bl sub_80500A8
	ldr r1, [r4]
	adds r0, r1, 0
	adds r0, 0x56
	ldrh r0, [r0]
	movs r5, 0x9F
	lsls r5, 1
	adds r1, r5
	ldrh r1, [r1]
	bl SetLinkDebugValues
	bl sub_804FE70
	ldr r0, [r4]
	adds r0, r5
	ldrh r0, [r0]
	movs r6, 0xFA
	lsls r6, 2
	adds r1, r6, 0
	bl sub_805194C
	ldr r0, [r4]
	adds r0, 0x56
	ldrh r0, [r0]
	bl sub_8051A3C
	bl sub_8051B18
	bl sub_805123C
	ldr r2, [r4]
	adds r3, r2, 0
	adds r3, 0x6F
	ldrb r0, [r3]
	cmp r0, 0
	bne _0805027E
	movs r1, 0xA0
	lsls r1, 1
	adds r0, r2, r1
	ldrh r1, [r0]
	ldr r0, _0805029C @ =0x000003e7
	cmp r1, r0
	bls _0805027E
	adds r0, r2, r5
	strh r6, [r0]
	movs r0, 0x1
	strb r0, [r3]
	ldr r0, _080502A0 @ =sub_8050954
	bl SetMainCallback2
_0805027E:
	bl RunTasks
	bl AnimateSprites
	bl BuildOamBuffer
	bl UpdatePaletteFade
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_08050294: .4byte gUnknown_03004854
_08050298: .4byte 0x00057e03
_0805029C: .4byte 0x000003e7
_080502A0: .4byte sub_8050954
	thumb_func_end sub_80501FC

	thumb_func_start help_system_is_not_first_time
help_system_is_not_first_time: @ 80502A4
	push {r4,r5,lr}
	lsls r1, 24
	lsls r2, 24
	lsrs r1, 20
	adds r4, r1, r0
	lsrs r2, 20
	adds r5, r2, r0
	ldrh r0, [r4]
	ldrh r1, [r5]
	cmp r0, r1
	bne _080502E2
	adds r0, r4, 0x2
	adds r1, r5, 0x2
	bl StringCompare
	cmp r0, 0
	bne _080502F0
	ldr r0, [r4, 0x8]
	ldr r2, _080502E8 @ =0xffffff00
	ands r0, r2
	ldr r1, [r5, 0x8]
	ands r1, r2
	cmp r0, r1
	bne _080502F0
	ldr r0, [r4, 0xC]
	ldr r2, _080502EC @ =0x00ffffff
	ands r0, r2
	ldr r1, [r5, 0xC]
	ands r1, r2
	cmp r0, r1
	bne _080502F0
_080502E2:
	movs r0, 0x1
	b _080502F2
	.align 2, 0
_080502E8: .4byte 0xffffff00
_080502EC: .4byte 0x00ffffff
_080502F0:
	movs r0, 0
_080502F2:
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end help_system_is_not_first_time

	thumb_func_start sub_80502F8
sub_80502F8: @ 80502F8
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	sub sp, 0x14
	mov r10, r0
	lsls r2, 24
	lsrs r2, 24
	str r2, [sp, 0x10]
	lsls r3, 24
	lsrs r3, 24
	mov r2, sp
	movs r4, 0x5
_08050314:
	ldrh r0, [r1]
	strh r0, [r2]
	adds r1, 0x2
	adds r2, 0x2
	subs r4, 0x1
	cmp r4, 0
	bge _08050314
	movs r6, 0
	mov r1, sp
	movs r4, 0x4
_08050328:
	movs r2, 0
	ldrsh r0, [r1, r2]
	cmp r0, 0
	bne _08050332
	adds r6, 0x1
_08050332:
	adds r1, 0x2
	subs r4, 0x1
	cmp r4, 0
	bge _08050328
	cmp r6, 0x5
	beq _08050386
	cmp r3, 0x3
	bhi _08050386
	movs r4, 0
	ldr r3, [sp, 0x10]
	cmp r4, r3
	bge _0805039E
	mov r3, r10
_0805034C:
	movs r6, 0
	ldr r7, [sp, 0x10]
	cmp r6, r7
	bge _08050394
	mov r9, r3
	mov r5, r10
	lsls r0, r4, 24
	mov r8, r0
_0805035C:
	mov r1, r9
	ldrh r0, [r1]
	ldrh r2, [r5]
	cmp r0, r2
	bne _0805038A
	cmp r4, r6
	beq _0805038A
	cmp r0, 0xAF
	bne _08050386
	lsls r2, r6, 24
	lsrs r2, 24
	mov r0, r10
	mov r7, r8
	lsrs r1, r7, 24
	str r3, [sp, 0xC]
	bl help_system_is_not_first_time
	lsls r0, 24
	ldr r3, [sp, 0xC]
	cmp r0, 0
	beq _0805038A
_08050386:
	movs r0, 0xC
	b _080504DE
_0805038A:
	adds r5, 0x10
	adds r6, 0x1
	ldr r0, [sp, 0x10]
	cmp r6, r0
	blt _0805035C
_08050394:
	adds r3, 0x10
	adds r4, 0x1
	ldr r1, [sp, 0x10]
	cmp r4, r1
	blt _0805034C
_0805039E:
	movs r2, 0
	mov r1, sp
	movs r4, 0x4
_080503A4:
	movs r3, 0
	ldrsh r0, [r1, r3]
	cmp r0, 0
	ble _080503B2
	adds r0, r2, 0x1
	lsls r0, 24
	lsrs r2, r0, 24
_080503B2:
	adds r1, 0x2
	subs r4, 0x1
	cmp r4, 0
	bge _080503A4
	cmp r2, 0x3
	bls _080503C2
	movs r0, 0xD
	b _080504DE
_080503C2:
	cmp r2, 0x3
	bne _080503CA
	movs r0, 0xB
	b _080504DE
_080503CA:
	movs r4, 0
	mov r1, sp
_080503CE:
	movs r7, 0
	ldrsh r0, [r1, r7]
	cmp r0, 0x32
	ble _080503D8
	b _080504D8
_080503D8:
	adds r1, 0x2
	adds r4, 0x1
	cmp r4, 0x4
	ble _080503CE
	cmp r2, 0x1
	bne _0805042A
	mov r0, sp
	movs r1, 0
	ldrsh r0, [r0, r1]
	cmp r0, 0
	ble _080503F2
	movs r0, 0x1
	b _080504DE
_080503F2:
	mov r0, sp
	ldrh r0, [r0, 0x2]
	lsls r0, 16
	cmp r0, 0
	ble _08050400
	movs r0, 0x2
	b _080504DE
_08050400:
	mov r0, sp
	movs r3, 0x4
	ldrsh r0, [r0, r3]
	cmp r0, 0
	ble _0805040E
	movs r0, 0x3
	b _080504DE
_0805040E:
	mov r0, sp
	movs r4, 0x6
	ldrsh r0, [r0, r4]
	cmp r0, 0
	ble _0805041C
	movs r0, 0x4
	b _080504DE
_0805041C:
	mov r0, sp
	movs r7, 0x8
	ldrsh r0, [r0, r7]
	cmp r0, 0
	ble _0805042A
	movs r0, 0x5
	b _080504DE
_0805042A:
	cmp r2, 0x2
	bne _080504DC
	movs r4, 0
	ldr r5, _08050474 @ =gUnknown_03000520
	mov r1, sp
	adds r2, r5, 0
_08050436:
	movs r3, 0
	ldrsh r0, [r1, r3]
	cmp r0, 0
	ble _08050442
	strh r4, [r2]
	adds r2, 0x2
_08050442:
	adds r1, 0x2
	adds r4, 0x1
	cmp r4, 0x4
	ble _08050436
	movs r4, 0
	ldrsh r3, [r5, r4]
	lsls r0, r3, 1
	mov r7, sp
	adds r1, r7, r0
	movs r0, 0x2
	ldrsh r2, [r5, r0]
	lsls r0, r2, 1
	add r0, sp
	movs r4, 0
	ldrsh r1, [r1, r4]
	movs r7, 0
	ldrsh r0, [r0, r7]
	cmp r1, r0
	blt _08050498
	adds r0, r3, 0
	cmp r0, 0
	bne _08050478
	lsls r0, r2, 16
	b _080504A2
	.align 2, 0
_08050474: .4byte gUnknown_03000520
_08050478:
	cmp r0, 0x1
	bne _08050480
	lsls r0, r2, 16
	b _080504AE
_08050480:
	cmp r0, 0x2
	bne _08050488
	lsls r0, r2, 16
	b _080504BA
_08050488:
	cmp r0, 0x3
	bne _08050490
	lsls r0, r2, 16
	b _080504C6
_08050490:
	cmp r0, 0x4
	bne _080504DC
	lsls r0, r2, 16
	b _080504D2
_08050498:
	movs r2, 0x2
	ldrsh r0, [r5, r2]
	cmp r0, 0
	bne _080504A8
	lsls r0, r3, 16
_080504A2:
	movs r1, 0x6
	orrs r0, r1
	b _080504DE
_080504A8:
	cmp r0, 0x1
	bne _080504B4
	lsls r0, r3, 16
_080504AE:
	movs r1, 0x7
	orrs r0, r1
	b _080504DE
_080504B4:
	cmp r0, 0x2
	bne _080504C0
	lsls r0, r3, 16
_080504BA:
	movs r1, 0x8
	orrs r0, r1
	b _080504DE
_080504C0:
	cmp r0, 0x3
	bne _080504CC
	lsls r0, r3, 16
_080504C6:
	movs r1, 0x9
	orrs r0, r1
	b _080504DE
_080504CC:
	cmp r0, 0x4
	bne _080504DC
	lsls r0, r3, 16
_080504D2:
	movs r1, 0xA
	orrs r0, r1
	b _080504DE
_080504D8:
	movs r0, 0xE
	b _080504DE
_080504DC:
	movs r0, 0
_080504DE:
	add sp, 0x14
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r1}
	bx r1
	thumb_func_end sub_80502F8

	thumb_func_start sub_80504F0
sub_80504F0: @ 80504F0
	ldr r1, _080504F8 @ =gUnknown_0300052C
	strh r0, [r1]
	bx lr
	.align 2, 0
_080504F8: .4byte gUnknown_0300052C
	thumb_func_end sub_80504F0

	thumb_func_start unref_sub_80504FC
unref_sub_80504FC: @ 80504FC
	ldr r0, _08050504 @ =gUnknown_0300052C
	movs r1, 0
	ldrsh r0, [r0, r1]
	bx lr
	.align 2, 0
_08050504: .4byte gUnknown_0300052C
	thumb_func_end unref_sub_80504FC

	thumb_func_start sub_8050508
sub_8050508: @ 8050508
	ldr r1, _08050510 @ =gUnknown_0300052E
	strh r0, [r1]
	bx lr
	.align 2, 0
_08050510: .4byte gUnknown_0300052E
	thumb_func_end sub_8050508

	thumb_func_start unref_sub_8050514
unref_sub_8050514: @ 8050514
	ldr r0, _0805051C @ =gUnknown_0300052E
	movs r1, 0
	ldrsh r0, [r0, r1]
	bx lr
	.align 2, 0
_0805051C: .4byte gUnknown_0300052E
	thumb_func_end unref_sub_8050514

	thumb_func_start sub_8050520
sub_8050520: @ 8050520
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	sub sp, 0x10
	str r0, [sp]
	mov r8, r1
	str r3, [sp, 0x4]
	ldr r0, [sp, 0x30]
	lsls r2, 24
	lsrs r2, 24
	mov r9, r2
	lsls r0, 16
	lsrs r0, 16
	str r0, [sp, 0x8]
	ldr r7, _080505DC @ =gUnknown_03000510
	adds r2, r7, 0
	movs r1, 0
	adds r0, r7, 0
	adds r0, 0xA
_0805054A:
	strh r1, [r0]
	subs r0, 0x2
	cmp r0, r2
	bge _0805054A
	movs r6, 0
	cmp r6, r9
	bge _08050580
	ldr r0, _080505DC @ =gUnknown_03000510
	mov r12, r0
	ldr r5, [sp]
	adds r5, 0x9
_08050560:
	movs r3, 0
	adds r4, r5, 0
	mov r2, r12
_08050566:
	adds r1, r4, r3
	ldrh r0, [r2]
	ldrb r1, [r1]
	adds r0, r1
	strh r0, [r2]
	adds r2, 0x2
	adds r3, 0x1
	cmp r3, 0x5
	ble _08050566
	adds r5, 0x10
	adds r6, 0x1
	cmp r6, r9
	blt _08050560
_08050580:
	movs r1, 0
	ldrsh r3, [r7, r1]
	ldrh r0, [r7]
	ldrh r1, [r7, 0x2]
	subs r0, r1
	strh r0, [r7]
	ldrh r0, [r7, 0x4]
	subs r1, r0
	strh r1, [r7, 0x2]
	ldrh r1, [r7, 0x6]
	subs r0, r1
	strh r0, [r7, 0x4]
	ldrh r0, [r7, 0x8]
	subs r1, r0
	strh r1, [r7, 0x6]
	subs r0, r3
	strh r0, [r7, 0x8]
	movs r3, 0
	movs r2, 0
	adds r1, r7, 0
	movs r6, 0x4
_080505AA:
	movs r4, 0
	ldrsh r0, [r1, r4]
	cmp r0, 0
	bge _080505B6
	strh r2, [r1]
	adds r3, 0x1
_080505B6:
	adds r1, 0x2
	subs r6, 0x1
	cmp r6, 0
	bge _080505AA
	lsls r0, r3, 24
	lsrs r0, 24
	mov r10, r0
	movs r4, 0
	ldr r1, _080505DC @ =gUnknown_03000510
	movs r6, 0x4
_080505CA:
	ldrh r2, [r1]
	movs r5, 0
	ldrsh r0, [r1, r5]
	cmp r0, 0
	ble _080505E4
	cmp r0, r3
	bge _080505E0
	strh r4, [r1]
	b _080505E4
	.align 2, 0
_080505DC: .4byte gUnknown_03000510
_080505E0:
	subs r0, r2, r3
	strh r0, [r1]
_080505E4:
	adds r1, 0x2
	subs r6, 0x1
	cmp r6, 0
	bge _080505CA
	ldr r1, _080506C4 @ =gUnknown_03000510
	ldr r2, _080506C8 @ =gUnknown_03000530
	movs r6, 0x4
_080505F2:
	movs r3, 0
	ldrsh r0, [r1, r3]
	stm r2!, {r0}
	adds r1, 0x2
	subs r6, 0x1
	cmp r6, 0
	bge _080505F2
	ldr r1, _080506CC @ =0x0000014d
	ldr r0, [sp, 0x8]
	bl __udivsi3
	lsls r0, 16
	lsrs r0, 16
	adds r3, r0, 0
	adds r3, 0x64
	ldr r4, _080506D0 @ =gUnknown_0300055C
	str r3, [r4]
	movs r6, 0x4
_08050616:
	movs r0, 0
	ldrsh r5, [r7, r0]
	adds r0, r5, 0
	muls r0, r3
	movs r1, 0xA
	str r3, [sp, 0xC]
	bl __divsi3
	adds r5, r0, 0
	movs r1, 0xA
	bl __modsi3
	adds r4, r0, 0
	adds r0, r5, 0
	movs r1, 0xA
	bl __divsi3
	adds r5, r0, 0
	ldr r3, [sp, 0xC]
	cmp r4, 0x4
	ble _08050642
	adds r5, 0x1
_08050642:
	strh r5, [r7]
	adds r7, 0x2
	subs r6, 0x1
	cmp r6, 0
	bge _08050616
	ldr r1, _080506C4 @ =gUnknown_03000510
	ldr r2, _080506D4 @ =gUnknown_03000548
	movs r6, 0x4
_08050652:
	movs r3, 0
	ldrsh r0, [r1, r3]
	stm r2!, {r0}
	adds r1, 0x2
	subs r6, 0x1
	cmp r6, 0
	bge _08050652
	ldr r4, _080506C4 @ =gUnknown_03000510
	ldr r0, [sp]
	adds r1, r4, 0
	mov r2, r9
	mov r3, r10
	bl sub_80502F8
	mov r5, r8
	strb r0, [r5]
	movs r1, 0xA
	ldrsh r0, [r4, r1]
	mov r1, r9
	bl __divsi3
	mov r3, r9
	subs r0, r3
	strh r0, [r4, 0xA]
	lsls r0, 16
	cmp r0, 0
	bge _0805068C
	movs r0, 0
	strh r0, [r4, 0xA]
_0805068C:
	mov r5, r8
	ldrb r0, [r5]
	cmp r0, 0xC
	bne _080506E6
	bl Random
	lsls r0, 16
	lsrs r0, 16
	movs r1, 0xA
	bl __umodsi3
	lsls r0, 16
	lsrs r3, r0, 16
	movs r6, 0
	ldr r0, _080506D8 @ =gUnknown_082165DF
	adds r0, r3, r0
	ldrb r0, [r0]
	adds r1, r4, 0
	movs r4, 0x1
	movs r3, 0x2
_080506B4:
	adds r2, r0, 0
	asrs r2, r6
	ands r2, r4
	cmp r2, 0
	beq _080506DC
	strh r3, [r1]
	b _080506DE
	.align 2, 0
_080506C4: .4byte gUnknown_03000510
_080506C8: .4byte gUnknown_03000530
_080506CC: .4byte 0x0000014d
_080506D0: .4byte gUnknown_0300055C
_080506D4: .4byte gUnknown_03000548
_080506D8: .4byte gUnknown_082165DF
_080506DC:
	strh r2, [r1]
_080506DE:
	adds r1, 0x2
	adds r6, 0x1
	cmp r6, 0x4
	ble _080506B4
_080506E6:
	ldr r7, _08050740 @ =gUnknown_03000510
	movs r2, 0xFF
	adds r1, r7, 0
	movs r6, 0x5
_080506EE:
	movs r3, 0
	ldrsh r0, [r1, r3]
	cmp r0, 0xFF
	ble _080506F8
	strh r2, [r1]
_080506F8:
	adds r1, 0x2
	subs r6, 0x1
	cmp r6, 0
	bge _080506EE
	ldrh r0, [r7]
	mov r4, r8
	strb r0, [r4, 0x1]
	ldrh r0, [r7, 0x2]
	strb r0, [r4, 0x2]
	ldrh r0, [r7, 0x4]
	strb r0, [r4, 0x3]
	ldrh r0, [r7, 0x6]
	strb r0, [r4, 0x4]
	ldrh r0, [r7, 0x8]
	strb r0, [r4, 0x5]
	ldrh r0, [r7, 0xA]
	strb r0, [r4, 0x6]
	movs r6, 0
	adds r2, r7, 0
_0805071E:
	ldr r5, [sp, 0x4]
	adds r1, r5, r6
	ldrh r0, [r2]
	strb r0, [r1]
	adds r2, 0x2
	adds r6, 0x1
	cmp r6, 0x5
	ble _0805071E
	add sp, 0x10
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_08050740: .4byte gUnknown_03000510
	thumb_func_end sub_8050520

	thumb_func_start sub_8050744
sub_8050744: @ 8050744
	push {r4,lr}
	sub sp, 0x4
	ldr r4, [sp, 0xC]
	lsls r2, 24
	lsrs r2, 24
	lsls r4, 16
	lsrs r4, 16
	str r4, [sp]
	bl sub_8050520
	add sp, 0x4
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end sub_8050744

	thumb_func_start sub_8050760
sub_8050760: @ 8050760
	push {r4-r6,lr}
	ldr r0, _08050780 @ =gUnknown_03004854
	ldr r0, [r0]
	movs r2, 0x96
	lsls r2, 1
	adds r1, r0, r2
	ldrh r1, [r1]
	adds r0, 0x5A
	ldrh r4, [r0]
	movs r2, 0
	ldr r5, _08050784 @ =0x00000383
	cmp r1, r5
	bhi _08050788
	movs r2, 0x5
	b _080507DA
	.align 2, 0
_08050780: .4byte gUnknown_03004854
_08050784: .4byte 0x00000383
_08050788:
	ldr r3, _0805079C @ =0xfffffc7c
	adds r0, r1, r3
	lsls r0, 16
	lsrs r0, 16
	ldr r3, _080507A0 @ =0x00000257
	cmp r0, r3
	bhi _080507A4
	movs r2, 0x4
	b _080507DA
	.align 2, 0
_0805079C: .4byte 0xfffffc7c
_080507A0: .4byte 0x00000257
_080507A4:
	ldr r6, _080507B4 @ =0xfffffa24
	adds r0, r1, r6
	lsls r0, 16
	lsrs r0, 16
	cmp r0, r3
	bhi _080507B8
	movs r2, 0x3
	b _080507DA
	.align 2, 0
_080507B4: .4byte 0xfffffa24
_080507B8:
	ldr r3, _080507C8 @ =0xfffff7cc
	adds r0, r1, r3
	lsls r0, 16
	lsrs r0, 16
	cmp r0, r5
	bhi _080507CC
	movs r2, 0x2
	b _080507DA
	.align 2, 0
_080507C8: .4byte 0xfffff7cc
_080507CC:
	ldr r6, _080507F8 @ =0xfffff31c
	adds r0, r1, r6
	lsls r0, 16
	ldr r1, _080507FC @ =0x012b0000
	cmp r0, r1
	bhi _080507DA
	movs r2, 0x1
_080507DA:
	lsls r0, r2, 16
	asrs r0, 16
	bl sub_8050508
	movs r2, 0
	cmp r4, 0x40
	bhi _080508BC
	adds r0, r4, 0
	subs r0, 0x32
	lsls r0, 16
	lsrs r0, 16
	cmp r0, 0x31
	bhi _08050804
	ldr r2, _08050800 @ =0x0000ffff
	b _080508BC
	.align 2, 0
_080507F8: .4byte 0xfffff31c
_080507FC: .4byte 0x012b0000
_08050800: .4byte 0x0000ffff
_08050804:
	adds r0, r4, 0
	subs r0, 0x64
	lsls r0, 16
	lsrs r0, 16
	cmp r0, 0x31
	bhi _08050818
	ldr r2, _08050814 @ =0x0000fffe
	b _080508BC
	.align 2, 0
_08050814: .4byte 0x0000fffe
_08050818:
	adds r0, r4, 0
	subs r0, 0x96
	lsls r0, 16
	lsrs r0, 16
	cmp r0, 0x31
	bhi _0805082C
	ldr r2, _08050828 @ =0x0000fffd
	b _080508BC
	.align 2, 0
_08050828: .4byte 0x0000fffd
_0805082C:
	adds r0, r4, 0
	subs r0, 0xC8
	lsls r0, 16
	lsrs r0, 16
	cmp r0, 0x31
	bhi _08050840
	ldr r2, _0805083C @ =0x0000fffc
	b _080508BC
	.align 2, 0
_0805083C: .4byte 0x0000fffc
_08050840:
	adds r0, r4, 0
	subs r0, 0xFA
	lsls r0, 16
	lsrs r0, 16
	cmp r0, 0x31
	bhi _08050854
	ldr r2, _08050850 @ =0x0000fffb
	b _080508BC
	.align 2, 0
_08050850: .4byte 0x0000fffb
_08050854:
	ldr r1, _08050864 @ =0xfffffea2
	adds r0, r4, r1
	lsls r0, 16
	lsrs r0, 16
	cmp r0, 0x31
	bhi _0805086C
	ldr r2, _08050868 @ =0x0000fffa
	b _080508BC
	.align 2, 0
_08050864: .4byte 0xfffffea2
_08050868: .4byte 0x0000fffa
_0805086C:
	ldr r3, _0805087C @ =0xfffffe70
	adds r0, r4, r3
	lsls r0, 16
	lsrs r0, 16
	cmp r0, 0x31
	bhi _08050884
	ldr r2, _08050880 @ =0x0000fff9
	b _080508BC
	.align 2, 0
_0805087C: .4byte 0xfffffe70
_08050880: .4byte 0x0000fff9
_08050884:
	ldr r6, _08050894 @ =0xfffffe0c
	adds r0, r4, r6
	lsls r0, 16
	lsrs r0, 16
	cmp r0, 0x31
	bhi _0805089C
	ldr r2, _08050898 @ =0x0000fff8
	b _080508BC
	.align 2, 0
_08050894: .4byte 0xfffffe0c
_08050898: .4byte 0x0000fff8
_0805089C:
	ldr r1, _080508AC @ =0xfffffdda
	adds r0, r4, r1
	lsls r0, 16
	lsrs r0, 16
	cmp r0, 0x31
	bhi _080508B4
	ldr r2, _080508B0 @ =0x0000fff7
	b _080508BC
	.align 2, 0
_080508AC: .4byte 0xfffffdda
_080508B0: .4byte 0x0000fff7
_080508B4:
	ldr r0, _080508CC @ =0x00000257
	cmp r4, r0
	bls _080508BC
	ldr r2, _080508D0 @ =0x0000fff6
_080508BC:
	lsls r0, r2, 16
	asrs r0, 16
	bl sub_80504F0
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_080508CC: .4byte 0x00000257
_080508D0: .4byte 0x0000fff6
	thumb_func_end sub_8050760

	thumb_func_start sub_80508D4
sub_80508D4: @ 80508D4
	push {lr}
	ldr r2, _080508F8 @ =gUnknown_03004854
	ldr r1, [r2]
	adds r1, 0xAA
	strb r0, [r1]
	ldr r0, [r2]
	adds r0, 0xAA
	ldrb r1, [r0]
	lsls r1, 28
	movs r0, 0x90
	lsls r0, 23
	adds r1, r0
	lsrs r1, 24
	movs r0, 0xC0
	bl sub_814A880
	pop {r0}
	bx r0
	.align 2, 0
_080508F8: .4byte gUnknown_03004854
	thumb_func_end sub_80508D4

	thumb_func_start sub_80508FC
sub_80508FC: @ 80508FC
	push {r4,lr}
	sub sp, 0x4
	ldr r4, _08050944 @ =gUnknown_03004854
	ldr r0, [r4]
	adds r0, 0xAA
	movs r1, 0
	strb r1, [r0]
	movs r0, 0x17
	movs r1, 0x8
	movs r2, 0x1C
	movs r3, 0xD
	bl MenuDrawTextWindow
	ldr r1, _08050948 @ =0x0000ffff
	ldr r3, _0805094C @ =0x00002d9f
	movs r0, 0x20
	str r0, [sp]
	movs r0, 0
	movs r2, 0xC
	bl sub_814A5C0
	ldr r0, _08050950 @ =gOtherText_YesNoTerminating
	movs r1, 0x18
	movs r2, 0x9
	bl MenuPrint
	ldr r0, [r4]
	adds r0, 0xAA
	ldrb r0, [r0]
	bl sub_80508D4
	add sp, 0x4
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08050944: .4byte gUnknown_03004854
_08050948: .4byte 0x0000ffff
_0805094C: .4byte 0x00002d9f
_08050950: .4byte gOtherText_YesNoTerminating
	thumb_func_end sub_80508FC

	thumb_func_start sub_8050954
sub_8050954: @ 8050954
	push {r4-r7,lr}
	bl sub_8051474
	bl GetMultiplayerId
	ldr r0, _08050978 @ =gUnknown_03004854
	ldr r0, [r0]
	adds r0, 0x6F
	ldrb r0, [r0]
	subs r0, 0x1
	cmp r0, 0xC
	bls _0805096E
	b _08050CB6
_0805096E:
	lsls r0, 2
	ldr r1, _0805097C @ =_08050980
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_08050978: .4byte gUnknown_03004854
_0805097C: .4byte _08050980
	.align 2, 0
_08050980:
	.4byte _080509B4
	.4byte _080509F8
	.4byte _08050A4C
	.4byte _08050A94
	.4byte _08050AD0
	.4byte _08050ADE
	.4byte _08050B08
	.4byte _08050B34
	.4byte _08050B42
	.4byte _08050B58
	.4byte _08050BE0
	.4byte _08050C64
	.4byte _08050C98
_080509B4:
	bl ClearLinkCallback
	ldr r0, _080509C8 @ =gMPlay_BGM
	movs r1, 0x80
	lsls r1, 1
	bl m4aMPlayTempoControl
	movs r4, 0
	b _080509E4
	.align 2, 0
_080509C8: .4byte gMPlay_BGM
_080509CC:
	ldr r0, _080509F0 @ =gUnknown_03004854
	ldr r0, [r0]
	movs r1, 0xA4
	lsls r1, 1
	adds r0, r1
	adds r0, r4
	ldrb r0, [r0]
	bl DestroyTask
	adds r0, r4, 0x1
	lsls r0, 24
	lsrs r4, r0, 24
_080509E4:
	ldr r0, _080509F4 @ =gUnknown_0202E8CC
	ldrh r0, [r0]
	cmp r4, r0
	bcc _080509CC
	b _08050C82
	.align 2, 0
_080509F0: .4byte gUnknown_03004854
_080509F4: .4byte gUnknown_0202E8CC
_080509F8:
	ldr r1, _08050A24 @ =gUnknown_03004854
	ldr r3, [r1]
	adds r2, r3, 0
	adds r2, 0x56
	ldrh r0, [r2]
	subs r0, 0x20
	strh r0, [r2]
	lsls r0, 16
	adds r4, r1, 0
	cmp r0, 0
	bgt _08050A40
	movs r0, 0
	strh r0, [r2]
	ldr r0, _08050A28 @ =gReceivedRemoteLinkPlayers
	ldrb r0, [r0]
	cmp r0, 0
	beq _08050A2C
	adds r1, r3, 0
	adds r1, 0x6F
	ldrb r0, [r1]
	adds r0, 0x1
	b _08050A32
	.align 2, 0
_08050A24: .4byte gUnknown_03004854
_08050A28: .4byte gReceivedRemoteLinkPlayers
_08050A2C:
	adds r1, r3, 0
	adds r1, 0x6F
	movs r0, 0x5
_08050A32:
	strb r0, [r1]
	ldr r0, [r4]
	movs r1, 0
	strb r1, [r0]
	ldr r0, _08050A48 @ =gMPlay_SE2
	bl m4aMPlayStop
_08050A40:
	bl sub_804E290
	b _08050CB6
	.align 2, 0
_08050A48: .4byte gMPlay_SE2
_08050A4C:
	bl GetMultiplayerId
	lsls r0, 24
	cmp r0, 0
	beq _08050A58
	b _08050C82
_08050A58:
	bl sub_8007ECC
	lsls r0, 24
	cmp r0, 0
	bne _08050A64
	b _08050CB6
_08050A64:
	ldr r4, _08050A90 @ =gUnknown_03004854
	ldr r3, [r4]
	movs r2, 0xDE
	lsls r2, 1
	adds r1, r3, r2
	movs r5, 0x96
	lsls r5, 1
	adds r0, r3, r5
	ldr r0, [r0]
	str r0, [r1]
	adds r0, r3, 0
	adds r0, 0x5A
	ldrh r2, [r0]
	adds r5, 0x94
	adds r0, r3, r5
	strh r2, [r0]
	movs r0, 0
	movs r2, 0x28
	bl SendBlock
	ldr r1, [r4]
	b _08050C86
	.align 2, 0
_08050A90: .4byte gUnknown_03004854
_08050A94:
	bl GetBlockRecievedStatus
	lsls r0, 24
	cmp r0, 0
	bne _08050AA0
	b _08050CB6
_08050AA0:
	ldr r2, _08050AC8 @ =gBlockRecvBuffer
	ldr r0, _08050ACC @ =gUnknown_03004854
	ldr r3, [r0]
	ldrh r0, [r2, 0x4]
	adds r1, r3, 0
	adds r1, 0x5A
	strh r0, [r1]
	movs r0, 0x96
	lsls r0, 1
	adds r1, r3, r0
	ldr r0, [r2]
	str r0, [r1]
	adds r1, r3, 0
	adds r1, 0x6F
	ldrb r0, [r1]
	adds r0, 0x1
	strb r0, [r1]
	bl ResetBlockReceivedFlags
	b _08050CB6
	.align 2, 0
_08050AC8: .4byte gBlockRecvBuffer
_08050ACC: .4byte gUnknown_03004854
_08050AD0:
	bl sub_8052228
	lsls r0, 24
	cmp r0, 0
	bne _08050ADC
	b _08050CB6
_08050ADC:
	b _08050C82
_08050ADE:
	bl sub_8051C58
	lsls r0, 24
	cmp r0, 0
	bne _08050AEA
	b _08050CB6
_08050AEA:
	ldr r0, _08050AFC @ =gUnknown_03004834
	ldrb r0, [r0]
	cmp r0, 0
	bne _08050B00
	movs r0, 0x22
	bl sav12_xor_increment
	b _08050C82
	.align 2, 0
_08050AFC: .4byte gUnknown_03004834
_08050B00:
	movs r0, 0x21
	bl sav12_xor_increment
	b _08050C82
_08050B08:
	ldr r0, _08050B2C @ =gUnknown_03004854
	ldr r1, [r0]
	adds r1, 0x6F
	ldrb r0, [r1]
	adds r0, 0x1
	strb r0, [r1]
	movs r0, 0
	movs r1, 0xE
	movs r2, 0x1D
	movs r3, 0x13
	bl MenuDrawTextWindow
	ldr r0, _08050B30 @ =gOtherText_BlendAnotherBerryPrompt
	movs r1, 0x1
	movs r2, 0xF
	bl MenuPrintMessage
	b _08050CB6
	.align 2, 0
_08050B2C: .4byte gUnknown_03004854
_08050B30: .4byte gOtherText_BlendAnotherBerryPrompt
_08050B34:
	bl MenuUpdateWindowText
	lsls r0, 24
	cmp r0, 0
	bne _08050B40
	b _08050CB6
_08050B40:
	b _08050C82
_08050B42:
	ldr r4, _08050B54 @ =gUnknown_03004854
	ldr r0, [r4]
	adds r0, 0xAA
	movs r1, 0
	strb r1, [r0]
	bl sub_80508FC
	ldr r1, [r4]
	b _08050C86
	.align 2, 0
_08050B54: .4byte gUnknown_03004854
_08050B58:
	ldr r0, _08050B80 @ =gMain
	ldrh r1, [r0, 0x2E]
	movs r0, 0x40
	ands r0, r1
	cmp r0, 0
	beq _08050B88
	ldr r0, _08050B84 @ =gUnknown_03004854
	ldr r0, [r0]
	adds r0, 0xAA
	ldrb r0, [r0]
	cmp r0, 0
	beq _08050B76
	movs r0, 0x5
	bl PlaySE
_08050B76:
	movs r0, 0
	bl sub_80508D4
	b _08050CB6
	.align 2, 0
_08050B80: .4byte gMain
_08050B84: .4byte gUnknown_03004854
_08050B88:
	movs r0, 0x80
	ands r0, r1
	cmp r0, 0
	beq _08050BA8
	ldr r0, _08050BA4 @ =gUnknown_03004854
	ldr r0, [r0]
	adds r0, 0xAA
	ldrb r0, [r0]
	cmp r0, 0x1
	beq _08050BD4
	movs r0, 0x5
	bl PlaySE
	b _08050BD4
	.align 2, 0
_08050BA4: .4byte gUnknown_03004854
_08050BA8:
	movs r0, 0x1
	ands r0, r1
	cmp r0, 0
	beq _08050BB8
	movs r0, 0x5
	bl PlaySE
	b _08050C82
_08050BB8:
	movs r0, 0x2
	ands r0, r1
	cmp r0, 0
	bne _08050BC2
	b _08050CB6
_08050BC2:
	movs r0, 0x5
	bl PlaySE
	ldr r0, _08050BDC @ =gUnknown_03004854
	ldr r1, [r0]
	adds r1, 0x6F
	ldrb r0, [r1]
	adds r0, 0x1
	strb r0, [r1]
_08050BD4:
	movs r0, 0x1
	bl sub_80508D4
	b _08050CB6
	.align 2, 0
_08050BDC: .4byte gUnknown_03004854
_08050BE0:
	ldr r6, _08050C10 @ =gSendCmd
	movs r7, 0
	ldr r0, _08050C14 @ =0x00002fff
	strh r0, [r6]
	ldr r4, _08050C18 @ =gUnknown_03004854
	ldr r2, [r4]
	adds r0, r2, 0
	adds r0, 0xAA
	ldrb r5, [r0]
	cmp r5, 0
	bne _08050C50
	movs r0, 0x4
	bl IsBagPocketNonEmpty
	lsls r0, 24
	cmp r0, 0
	bne _08050C20
	ldr r0, [r4]
	adds r0, 0x7C
	movs r1, 0x2
	strh r1, [r0]
	ldr r0, _08050C1C @ =0x00009999
	b _08050C48
	.align 2, 0
_08050C10: .4byte gSendCmd
_08050C14: .4byte 0x00002fff
_08050C18: .4byte gUnknown_03004854
_08050C1C: .4byte 0x00009999
_08050C20:
	bl sub_810CA00
	lsls r0, 24
	asrs r0, 24
	movs r1, 0x1
	negs r1, r1
	cmp r0, r1
	bne _08050C40
	ldr r0, [r4]
	adds r0, 0x7C
	movs r1, 0x3
	strh r1, [r0]
	ldr r0, _08050C3C @ =0x0000aaaa
	b _08050C48
	.align 2, 0
_08050C3C: .4byte 0x0000aaaa
_08050C40:
	ldr r0, [r4]
	adds r0, 0x7C
	strh r5, [r0]
	ldr r0, _08050C4C @ =0x00007779
_08050C48:
	strh r0, [r6, 0x2]
	b _08050C82
	.align 2, 0
_08050C4C: .4byte 0x00007779
_08050C50:
	adds r1, r2, 0
	adds r1, 0x7C
	movs r0, 0x1
	strh r0, [r1]
	ldr r0, _08050C60 @ =0x00008888
	strh r0, [r6, 0x2]
	subs r1, 0xD
	b _08050C88
	.align 2, 0
_08050C60: .4byte 0x00008888
_08050C64:
	ldr r0, _08050C70 @ =gUnknown_03004834
	ldrb r0, [r0]
	cmp r0, 0
	beq _08050C78
	ldr r0, _08050C74 @ =sub_80510E8
	b _08050CA4
	.align 2, 0
_08050C70: .4byte gUnknown_03004834
_08050C74: .4byte sub_80510E8
_08050C78:
	ldr r0, _08050C90 @ =gOtherText_LinkStandby3
	movs r1, 0x1
	movs r2, 0xF
	bl MenuPrintMessage
_08050C82:
	ldr r0, _08050C94 @ =gUnknown_03004854
	ldr r1, [r0]
_08050C86:
	adds r1, 0x6F
_08050C88:
	ldrb r0, [r1]
	adds r0, 0x1
	strb r0, [r1]
	b _08050CB6
	.align 2, 0
_08050C90: .4byte gOtherText_LinkStandby3
_08050C94: .4byte gUnknown_03004854
_08050C98:
	bl MenuUpdateWindowText
	lsls r0, 24
	cmp r0, 0
	beq _08050CB6
	ldr r0, _08050CE0 @ =sub_8050E30
_08050CA4:
	bl SetMainCallback2
	ldr r2, _08050CE4 @ =gUnknown_03004854
	ldr r0, [r2]
	adds r0, 0x6F
	movs r1, 0
	strb r1, [r0]
	ldr r0, [r2]
	strb r1, [r0]
_08050CB6:
	bl sub_8051B18
	ldr r0, _08050CE4 @ =gUnknown_03004854
	ldr r0, [r0]
	adds r0, 0x56
	ldrh r0, [r0]
	bl sub_8051A3C
	bl sub_805123C
	bl RunTasks
	bl AnimateSprites
	bl BuildOamBuffer
	bl UpdatePaletteFade
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_08050CE0: .4byte sub_8050E30
_08050CE4: .4byte gUnknown_03004854
	thumb_func_end sub_8050954

	thumb_func_start sub_8050CE8
sub_8050CE8: @ 8050CE8
	push {r4,lr}
	ldr r1, _08050D08 @ =gUnknown_03004854
	ldr r0, [r1]
	movs r2, 0xE2
	lsls r2, 1
	adds r0, r2
	ldr r0, [r0]
	adds r4, r1, 0
	cmp r0, 0x6
	bls _08050CFE
	b _08050E28
_08050CFE:
	lsls r0, 2
	ldr r1, _08050D0C @ =_08050D10
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_08050D08: .4byte gUnknown_03004854
_08050D0C: .4byte _08050D10
	.align 2, 0
_08050D10:
	.4byte _08050D2C
	.4byte _08050D44
	.4byte _08050D70
	.4byte _08050D80
	.4byte _08050DA6
	.4byte _08050DEC
	.4byte _08050E06
_08050D2C:
	bl sub_80084A4
	ldr r0, _08050D40 @ =gUnknown_03004854
	ldr r2, [r0]
	movs r3, 0xE2
	lsls r3, 1
	adds r1, r2, r3
	movs r0, 0x1
	b _08050DF8
	.align 2, 0
_08050D40: .4byte gUnknown_03004854
_08050D44:
	bl sub_8007ECC
	lsls r0, 24
	cmp r0, 0
	beq _08050E28
	ldr r0, _08050D68 @ =gUnknown_03004854
	ldr r1, [r0]
	movs r2, 0xE2
	lsls r2, 1
	adds r1, r2
	ldr r0, [r1]
	adds r0, 0x1
	str r0, [r1]
	ldr r1, _08050D6C @ =gUnknown_3001BB4
	movs r0, 0x1
	strb r0, [r1]
	b _08050E28
	.align 2, 0
_08050D68: .4byte gUnknown_03004854
_08050D6C: .4byte gUnknown_3001BB4
_08050D70:
	bl sub_8125E2C
	ldr r0, _08050D7C @ =gUnknown_03004854
	ldr r2, [r0]
	b _08050DEE
	.align 2, 0
_08050D7C: .4byte gUnknown_03004854
_08050D80:
	ldr r1, [r4]
	movs r2, 0x98
	lsls r2, 1
	adds r1, r2
	ldr r0, [r1]
	adds r0, 0x1
	str r0, [r1]
	cmp r0, 0xA
	bne _08050E28
	bl sub_80084A4
	ldr r1, [r4]
	movs r3, 0xE2
	lsls r3, 1
	adds r1, r3
	ldr r0, [r1]
	adds r0, 0x1
	str r0, [r1]
	b _08050E28
_08050DA6:
	bl sub_8007ECC
	lsls r0, 24
	cmp r0, 0
	beq _08050E28
	bl sub_8125E6C
	lsls r0, 24
	lsrs r2, r0, 24
	cmp r2, 0
	beq _08050DD0
	ldr r0, _08050DCC @ =gUnknown_03004854
	ldr r0, [r0]
	movs r1, 0xE2
	lsls r1, 1
	adds r0, r1
	movs r1, 0x5
	str r1, [r0]
	b _08050E28
	.align 2, 0
_08050DCC: .4byte gUnknown_03004854
_08050DD0:
	ldr r0, _08050DE8 @ =gUnknown_03004854
	ldr r1, [r0]
	movs r3, 0x98
	lsls r3, 1
	adds r0, r1, r3
	str r2, [r0]
	movs r0, 0xE2
	lsls r0, 1
	adds r1, r0
	movs r0, 0x3
	str r0, [r1]
	b _08050E28
	.align 2, 0
_08050DE8: .4byte gUnknown_03004854
_08050DEC:
	ldr r2, [r4]
_08050DEE:
	movs r3, 0xE2
	lsls r3, 1
	adds r1, r2, r3
	ldr r0, [r1]
	adds r0, 0x1
_08050DF8:
	str r0, [r1]
	movs r0, 0x98
	lsls r0, 1
	adds r1, r2, r0
	movs r0, 0
	str r0, [r1]
	b _08050E28
_08050E06:
	ldr r1, [r4]
	movs r2, 0x98
	lsls r2, 1
	adds r1, r2
	ldr r0, [r1]
	adds r0, 0x1
	str r0, [r1]
	cmp r0, 0x5
	ble _08050E28
	ldr r1, _08050E24 @ =gUnknown_3001BB4
	movs r0, 0
	strb r0, [r1]
	movs r0, 0x1
	b _08050E2A
	.align 2, 0
_08050E24: .4byte gUnknown_3001BB4
_08050E28:
	movs r0, 0
_08050E2A:
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end sub_8050CE8

	thumb_func_start sub_8050E30
sub_8050E30: @ 8050E30
	push {r4,r5,lr}
	sub sp, 0x4
	ldr r1, _08050E50 @ =gUnknown_03004854
	ldr r0, [r1]
	adds r0, 0x6F
	ldrb r0, [r0]
	adds r5, r1, 0
	cmp r0, 0xC
	bls _08050E44
	b _080510C4
_08050E44:
	lsls r0, 2
	ldr r1, _08050E54 @ =_08050E58
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_08050E50: .4byte gUnknown_03004854
_08050E54: .4byte _08050E58
	.align 2, 0
_08050E58:
	.4byte _08050E8C
	.4byte _08050ED8
	.4byte _08050F18
	.4byte _08050F6C
	.4byte _08050F8C
	.4byte _08050FAA
	.4byte _08050FD4
	.4byte _08051004
	.4byte _08051020
	.4byte _08051030
	.4byte _08051054
	.4byte _08051094
	.4byte _080510B6
_08050E8C:
	ldr r1, [r5]
	adds r0, r1, 0
	adds r0, 0x70
	ldrh r2, [r0]
	ldr r0, _08050EB8 @ =0x00002222
	cmp r2, r0
	bne _08050E9C
	b _08050FA2
_08050E9C:
	ldr r0, _08050EBC @ =0x00001111
	cmp r2, r0
	beq _08050EA4
	b _080510C4
_08050EA4:
	adds r0, r1, 0
	adds r0, 0x78
	ldrh r2, [r0]
	ldr r0, _08050EC0 @ =0x00009999
	cmp r2, r0
	bne _08050EC4
	adds r1, 0x6F
	movs r0, 0x2
	strb r0, [r1]
	b _080510C4
	.align 2, 0
_08050EB8: .4byte 0x00002222
_08050EBC: .4byte 0x00001111
_08050EC0: .4byte 0x00009999
_08050EC4:
	ldr r0, _08050ED4 @ =0x0000aaaa
	cmp r2, r0
	bne _08050FA2
	adds r1, 0x6F
	movs r0, 0x1
	strb r0, [r1]
	b _080510C4
	.align 2, 0
_08050ED4: .4byte 0x0000aaaa
_08050ED8:
	ldr r0, [r5]
	adds r0, 0x6F
	movs r1, 0x3
	strb r1, [r0]
	bl sub_814A7FC
	movs r0, 0x17
	movs r1, 0x8
	movs r2, 0x1C
	movs r3, 0xD
	bl MenuZeroFillWindowRect
	ldr r4, _08050F0C @ =gStringVar4
	ldr r0, [r5]
	adds r0, 0x7A
	ldrh r0, [r0]
	lsls r1, r0, 3
	subs r1, r0
	lsls r1, 2
	ldr r0, _08050F10 @ =gLinkPlayers + 0x8
	adds r1, r0
	adds r0, r4, 0
	bl StringCopy
	ldr r1, _08050F14 @ =gOtherText_OtherCaseIsFull
	b _08050F4C
	.align 2, 0
_08050F0C: .4byte gStringVar4
_08050F10: .4byte gLinkPlayers + 0x8
_08050F14: .4byte gOtherText_OtherCaseIsFull
_08050F18:
	ldr r1, [r5]
	adds r1, 0x6F
	ldrb r0, [r1]
	adds r0, 0x1
	strb r0, [r1]
	bl sub_814A7FC
	movs r0, 0x17
	movs r1, 0x8
	movs r2, 0x1C
	movs r3, 0xD
	bl MenuZeroFillWindowRect
	ldr r4, _08050F60 @ =gStringVar4
	ldr r0, [r5]
	adds r0, 0x7A
	ldrh r0, [r0]
	lsls r1, r0, 3
	subs r1, r0
	lsls r1, 2
	ldr r0, _08050F64 @ =gLinkPlayers + 0x8
	adds r1, r0
	adds r0, r4, 0
	bl StringCopy
	ldr r1, _08050F68 @ =gOtherText_NoBerriesForBlend
_08050F4C:
	adds r0, r4, 0
	bl StringAppend
	adds r0, r4, 0
	movs r1, 0x1
	movs r2, 0xF
	bl MenuPrintMessage
	b _080510C4
	.align 2, 0
_08050F60: .4byte gStringVar4
_08050F64: .4byte gLinkPlayers + 0x8
_08050F68: .4byte gOtherText_NoBerriesForBlend
_08050F6C:
	bl MenuUpdateWindowText
	lsls r0, 24
	cmp r0, 0
	bne _08050F78
	b _080510C4
_08050F78:
	ldr r0, _08050F88 @ =gUnknown_03004854
	ldr r1, [r0]
	movs r0, 0x98
	lsls r0, 1
	adds r2, r1, r0
	movs r0, 0
	str r0, [r2]
	b _080510AC
	.align 2, 0
_08050F88: .4byte gUnknown_03004854
_08050F8C:
	ldr r2, [r5]
	movs r0, 0x98
	lsls r0, 1
	adds r1, r2, r0
	ldr r0, [r1]
	adds r0, 0x1
	str r0, [r1]
	cmp r0, 0x3C
	bgt _08050FA0
	b _080510C4
_08050FA0:
	adds r1, r2, 0
_08050FA2:
	adds r1, 0x6F
	movs r0, 0x5
	strb r0, [r1]
	b _080510C4
_08050FAA:
	movs r0, 0
	movs r1, 0xE
	movs r2, 0x1D
	movs r3, 0x13
	bl MenuDrawTextWindow
	ldr r0, _08050FCC @ =gMultiText_Saving
	movs r1, 0x2
	movs r2, 0xF
	bl MenuPrint
	bl sub_80084A4
	ldr r0, _08050FD0 @ =gUnknown_03004854
	ldr r1, [r0]
	b _080510AC
	.align 2, 0
_08050FCC: .4byte gMultiText_Saving
_08050FD0: .4byte gUnknown_03004854
_08050FD4:
	bl sub_8007ECC
	lsls r0, 24
	cmp r0, 0
	beq _080510C4
	ldr r3, _08051000 @ =gUnknown_03004854
	ldr r1, [r3]
	movs r2, 0x98
	lsls r2, 1
	adds r0, r1, r2
	movs r2, 0
	str r2, [r0]
	adds r1, 0x6F
	ldrb r0, [r1]
	adds r0, 0x1
	strb r0, [r1]
	ldr r0, [r3]
	movs r1, 0xE2
	lsls r1, 1
	adds r0, r1
	str r2, [r0]
	b _080510C4
	.align 2, 0
_08051000: .4byte gUnknown_03004854
_08051004:
	bl sub_8050CE8
	lsls r0, 24
	cmp r0, 0
	beq _080510C4
	movs r0, 0x37
	bl PlaySE
	ldr r0, _0805101C @ =gUnknown_03004854
	ldr r1, [r0]
	b _080510AC
	.align 2, 0
_0805101C: .4byte gUnknown_03004854
_08051020:
	ldr r1, [r5]
	adds r1, 0x6F
	ldrb r0, [r1]
	adds r0, 0x1
	strb r0, [r1]
	bl sub_80084A4
	b _080510C4
_08051030:
	bl sub_8007ECC
	lsls r0, 24
	cmp r0, 0
	beq _080510C4
	movs r0, 0x1
	negs r0, r0
	movs r1, 0
	str r1, [sp]
	movs r2, 0
	movs r3, 0x10
	bl BeginNormalPaletteFade
	ldr r0, _08051050 @ =gUnknown_03004854
	ldr r1, [r0]
	b _080510AC
	.align 2, 0
_08051050: .4byte gUnknown_03004854
_08051054:
	ldr r0, _0805107C @ =gPaletteFade
	ldrb r1, [r0, 0x7]
	movs r0, 0x80
	ands r0, r1
	lsls r0, 24
	lsrs r3, r0, 24
	cmp r3, 0
	bne _080510C4
	ldr r2, [r5]
	adds r0, r2, 0
	adds r0, 0x70
	ldrh r1, [r0]
	ldr r0, _08051080 @ =0x00002222
	cmp r1, r0
	bne _08051088
	ldr r0, _08051084 @ =sub_804E538
	bl SetMainCallback2
	b _080510C4
	.align 2, 0
_0805107C: .4byte gPaletteFade
_08051080: .4byte 0x00002222
_08051084: .4byte sub_804E538
_08051088:
	movs r1, 0x98
	lsls r1, 1
	adds r0, r2, r1
	str r3, [r0]
	adds r1, r2, 0
	b _080510AC
_08051094:
	ldr r1, [r5]
	movs r2, 0x98
	lsls r2, 1
	adds r1, r2
	ldr r0, [r1]
	adds r0, 0x1
	str r0, [r1]
	cmp r0, 0x1E
	ble _080510C4
	bl sub_800832C
	ldr r1, [r5]
_080510AC:
	adds r1, 0x6F
	ldrb r0, [r1]
	adds r0, 0x1
	strb r0, [r1]
	b _080510C4
_080510B6:
	ldr r0, _080510E0 @ =gReceivedRemoteLinkPlayers
	ldrb r0, [r0]
	cmp r0, 0
	bne _080510C4
	ldr r0, _080510E4 @ =c2_exit_to_overworld_1_continue_scripts_restart_music
	bl SetMainCallback2
_080510C4:
	bl sub_805123C
	bl RunTasks
	bl AnimateSprites
	bl BuildOamBuffer
	bl UpdatePaletteFade
	add sp, 0x4
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080510E0: .4byte gReceivedRemoteLinkPlayers
_080510E4: .4byte c2_exit_to_overworld_1_continue_scripts_restart_music
	thumb_func_end sub_8050E30

	thumb_func_start sub_80510E8
sub_80510E8: @ 80510E8
	push {lr}
	ldr r1, _08051104 @ =gUnknown_03004854
	ldr r0, [r1]
	adds r0, 0x6F
	ldrb r0, [r0]
	adds r3, r1, 0
	cmp r0, 0xA
	bls _080510FA
	b _0805121E
_080510FA:
	lsls r0, 2
	ldr r1, _08051108 @ =_0805110C
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_08051104: .4byte gUnknown_03004854
_08051108: .4byte _0805110C
	.align 2, 0
_0805110C:
	.4byte _08051138
	.4byte _0805116E
	.4byte _08051190
	.4byte _080511BC
	.4byte _0805121E
	.4byte _0805121E
	.4byte _0805121E
	.4byte _0805121E
	.4byte _0805121E
	.4byte _080511D8
	.4byte _080511F0
_08051138:
	ldr r1, [r3]
	adds r0, r1, 0
	adds r0, 0x7C
	ldrh r0, [r0]
	cmp r0, 0x1
	bhi _0805114A
	adds r1, 0x6F
	movs r0, 0x9
	strb r0, [r1]
_0805114A:
	ldr r2, [r3]
	adds r0, r2, 0
	adds r0, 0x7C
	ldrh r1, [r0]
	cmp r1, 0x2
	bne _0805115A
	subs r0, 0xD
	strb r1, [r0]
_0805115A:
	ldr r1, [r3]
	adds r0, r1, 0
	adds r0, 0x7C
	ldrh r0, [r0]
	cmp r0, 0x3
	bne _0805121E
	adds r1, 0x6F
	movs r0, 0x1
	strb r0, [r1]
	b _0805121E
_0805116E:
	ldr r0, [r3]
	adds r0, 0x6F
	movs r1, 0x3
	strb r1, [r0]
	bl sub_814A7FC
	movs r0, 0x17
	movs r1, 0x8
	movs r2, 0x1C
	movs r3, 0xD
	bl MenuZeroFillWindowRect
	ldr r0, _0805118C @ =gOtherText_CaseIsFull
	b _080511AC
	.align 2, 0
_0805118C: .4byte gOtherText_CaseIsFull
_08051190:
	ldr r0, [r3]
	adds r0, 0x6F
	ldrb r1, [r0]
	adds r1, 0x1
	strb r1, [r0]
	bl sub_814A7FC
	movs r0, 0x17
	movs r1, 0x8
	movs r2, 0x1C
	movs r3, 0xD
	bl MenuZeroFillWindowRect
	ldr r0, _080511B8 @ =gOtherText_OutOfBerries
_080511AC:
	movs r1, 0x1
	movs r2, 0xF
	bl MenuPrintMessage
	b _0805121E
	.align 2, 0
_080511B8: .4byte gOtherText_OutOfBerries
_080511BC:
	bl MenuUpdateWindowText
	lsls r0, 24
	cmp r0, 0
	beq _0805121E
	ldr r0, _080511D4 @ =gUnknown_03004854
	ldr r0, [r0]
	adds r0, 0x6F
	movs r1, 0x9
	strb r1, [r0]
	b _0805121E
	.align 2, 0
_080511D4: .4byte gUnknown_03004854
_080511D8:
	movs r0, 0x3
	bl BeginFastPaletteFade
	ldr r0, _080511EC @ =gUnknown_03004854
	ldr r1, [r0]
	adds r1, 0x6F
	ldrb r0, [r1]
	adds r0, 0x1
	strb r0, [r1]
	b _0805121E
	.align 2, 0
_080511EC: .4byte gUnknown_03004854
_080511F0:
	ldr r0, _08051210 @ =gPaletteFade
	ldrb r1, [r0, 0x7]
	movs r0, 0x80
	ands r0, r1
	cmp r0, 0
	bne _0805121E
	ldr r0, [r3]
	adds r0, 0x7C
	ldrh r0, [r0]
	cmp r0, 0
	bne _08051218
	ldr r0, _08051214 @ =sub_804E538
	bl SetMainCallback2
	b _0805121E
	.align 2, 0
_08051210: .4byte gPaletteFade
_08051214: .4byte sub_804E538
_08051218:
	ldr r0, _08051238 @ =c2_exit_to_overworld_1_continue_scripts_restart_music
	bl SetMainCallback2
_0805121E:
	bl sub_805123C
	bl RunTasks
	bl AnimateSprites
	bl BuildOamBuffer
	bl UpdatePaletteFade
	pop {r0}
	bx r0
	.align 2, 0
_08051238: .4byte c2_exit_to_overworld_1_continue_scripts_restart_music
	thumb_func_end sub_80510E8

	thumb_func_start sub_805123C
sub_805123C: @ 805123C
	push {r4-r6,lr}
	ldr r0, _0805126C @ =gReceivedRemoteLinkPlayers
	ldrb r0, [r0]
	cmp r0, 0
	bne _08051248
	b _08051404
_08051248:
	ldr r4, _08051270 @ =gRecvCmds
	ldrh r1, [r4]
	ldr r0, _08051274 @ =0x00002fff
	cmp r1, r0
	bne _080512C6
	ldrh r1, [r4, 0x8]
	ldr r0, _08051278 @ =0x00001111
	cmp r1, r0
	bne _080512B8
	ldrh r3, [r4, 0x10]
	ldr r0, _0805127C @ =0x00009999
	cmp r3, r0
	beq _08051298
	cmp r3, r0
	bgt _08051284
	ldr r0, _08051280 @ =0x00008888
	b _08051286
	.align 2, 0
_0805126C: .4byte gReceivedRemoteLinkPlayers
_08051270: .4byte gRecvCmds
_08051274: .4byte 0x00002fff
_08051278: .4byte 0x00001111
_0805127C: .4byte 0x00009999
_08051280: .4byte 0x00008888
_08051284:
	ldr r0, _08051290 @ =0x0000aaaa
_08051286:
	cmp r3, r0
	beq _08051298
	ldr r2, _08051294 @ =gUnknown_03004854
	b _080512A8
	.align 2, 0
_08051290: .4byte 0x0000aaaa
_08051294: .4byte gUnknown_03004854
_08051298:
	ldr r2, _080512B0 @ =gUnknown_03004854
	ldr r0, [r2]
	adds r1, r0, 0
	adds r1, 0x78
	strh r3, [r1]
	ldrh r1, [r4, 0x18]
	adds r0, 0x7A
	strh r1, [r0]
_080512A8:
	ldr r0, [r2]
	adds r0, 0x70
	ldr r1, _080512B4 @ =0x00001111
	b _080512C4
	.align 2, 0
_080512B0: .4byte gUnknown_03004854
_080512B4: .4byte 0x00001111
_080512B8:
	ldr r0, _080512F4 @ =0x00002222
	cmp r1, r0
	bne _080512C6
	ldr r0, _080512F8 @ =gUnknown_03004854
	ldr r0, [r0]
	adds r0, 0x70
_080512C4:
	strh r1, [r0]
_080512C6:
	bl GetMultiplayerId
	lsls r0, 24
	cmp r0, 0
	beq _080512D2
	b _08051404
_080512D2:
	ldr r2, _080512F8 @ =gUnknown_03004854
	ldr r0, [r2]
	adds r0, 0x70
	ldrh r1, [r0]
	ldr r0, _080512FC @ =0x00001111
	cmp r1, r0
	bne _080512E2
	b _08051404
_080512E2:
	ldr r0, _080512F4 @ =0x00002222
	cmp r1, r0
	bne _080512EA
	b _08051404
_080512EA:
	movs r4, 0
	ldr r6, _08051300 @ =0x00002fff
	adds r5, r2, 0
	b _0805134E
	.align 2, 0
_080512F4: .4byte 0x00002222
_080512F8: .4byte gUnknown_03004854
_080512FC: .4byte 0x00001111
_08051300: .4byte 0x00002fff
_08051304:
	ldr r1, _08051328 @ =gRecvCmds
	lsls r2, r4, 1
	adds r0, r2, r1
	ldrh r0, [r0]
	cmp r0, r6
	bne _08051348
	adds r0, r1, 0
	adds r0, 0x8
	adds r0, r2, r0
	ldrh r1, [r0]
	ldr r0, _0805132C @ =0x00008888
	cmp r1, r0
	beq _08051340
	cmp r1, r0
	bgt _08051334
	ldr r0, _08051330 @ =0x00007779
	b _0805133C
	.align 2, 0
_08051328: .4byte gRecvCmds
_0805132C: .4byte 0x00008888
_08051330: .4byte 0x00007779
_08051334:
	ldr r0, _08051360 @ =0x00009999
	cmp r1, r0
	beq _08051340
	ldr r0, _08051364 @ =0x0000aaaa
_0805133C:
	cmp r1, r0
	bne _08051348
_08051340:
	ldr r0, [r5]
	adds r0, 0x70
	adds r0, r2
	strh r1, [r0]
_08051348:
	adds r0, r4, 0x1
	lsls r0, 24
	lsrs r4, r0, 24
_0805134E:
	bl GetLinkPlayerCount
	lsls r0, 24
	lsrs r0, 24
	cmp r4, r0
	bcc _08051304
	movs r4, 0
	b _0805136E
	.align 2, 0
_08051360: .4byte 0x00009999
_08051364: .4byte 0x0000aaaa
_08051368:
	adds r0, r4, 0x1
	lsls r0, 24
	lsrs r4, r0, 24
_0805136E:
	bl GetLinkPlayerCount
	lsls r0, 24
	lsrs r0, 24
	cmp r4, r0
	bcs _0805138A
	ldr r0, _0805139C @ =gUnknown_03004854
	ldr r0, [r0]
	lsls r1, r4, 1
	adds r0, 0x70
	adds r0, r1
	ldrh r0, [r0]
	cmp r0, 0
	bne _08051368
_0805138A:
	bl GetLinkPlayerCount
	lsls r0, 24
	lsrs r0, 24
	cmp r4, r0
	bne _08051404
	movs r4, 0
	ldr r5, _080513A0 @ =0x00007779
	b _080513AA
	.align 2, 0
_0805139C: .4byte gUnknown_03004854
_080513A0: .4byte 0x00007779
_080513A4:
	adds r0, r4, 0x1
	lsls r0, 24
	lsrs r4, r0, 24
_080513AA:
	bl GetLinkPlayerCount
	lsls r0, 24
	lsrs r0, 24
	cmp r4, r0
	bcs _080513C6
	ldr r0, _080513E0 @ =gUnknown_03004854
	ldr r0, [r0]
	lsls r1, r4, 1
	adds r0, 0x70
	adds r0, r1
	ldrh r0, [r0]
	cmp r0, r5
	beq _080513A4
_080513C6:
	ldr r5, _080513E4 @ =gSendCmd
	movs r6, 0
	ldr r0, _080513E8 @ =0x00002fff
	strh r0, [r5]
	bl GetLinkPlayerCount
	lsls r0, 24
	lsrs r0, 24
	cmp r4, r0
	bne _080513F0
	ldr r0, _080513EC @ =0x00002222
	strh r0, [r5, 0x2]
	b _08051404
	.align 2, 0
_080513E0: .4byte gUnknown_03004854
_080513E4: .4byte gSendCmd
_080513E8: .4byte 0x00002fff
_080513EC: .4byte 0x00002222
_080513F0:
	ldr r0, _0805140C @ =0x00001111
	strh r0, [r5, 0x2]
	ldr r0, _08051410 @ =gUnknown_03004854
	ldr r0, [r0]
	lsls r1, r4, 1
	adds r0, 0x70
	adds r0, r1
	ldrh r0, [r0]
	strh r0, [r5, 0x4]
	strh r4, [r5, 0x6]
_08051404:
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_0805140C: .4byte 0x00001111
_08051410: .4byte gUnknown_03004854
	thumb_func_end sub_805123C

	thumb_func_start sub_8051414
sub_8051414: @ 8051414
	push {lr}
	sub sp, 0x14
	adds r1, r0, 0
	movs r0, 0xF0
	lsls r0, 7
	str r0, [sp]
	movs r0, 0xA0
	lsls r0, 7
	str r0, [sp, 0x4]
	mov r3, sp
	ldr r0, _08051470 @ =gUnknown_03004854
	ldr r0, [r0]
	mov r12, r0
	movs r0, 0xA2
	lsls r0, 1
	add r0, r12
	ldrh r2, [r0]
	movs r0, 0x78
	subs r0, r2
	strh r0, [r3, 0x8]
	movs r0, 0xA3
	lsls r0, 1
	add r0, r12
	ldrh r2, [r0]
	movs r0, 0x50
	subs r0, r2
	strh r0, [r3, 0xA]
	mov r2, sp
	movs r3, 0xA1
	lsls r3, 1
	add r3, r12
	ldrh r0, [r3]
	strh r0, [r2, 0xC]
	ldrh r0, [r3]
	strh r0, [r2, 0xE]
	mov r0, r12
	adds r0, 0x54
	ldrh r0, [r0]
	strh r0, [r2, 0x10]
	mov r0, sp
	movs r2, 0x1
	bl BgAffineSet
	add sp, 0x14
	pop {r0}
	bx r0
	.align 2, 0
_08051470: .4byte gUnknown_03004854
	thumb_func_end sub_8051414

	thumb_func_start sub_8051474
sub_8051474: @ 8051474
	push {lr}
	ldr r0, _080514A0 @ =gUnknown_03004854
	ldr r3, [r0]
	adds r1, r3, 0
	adds r1, 0x54
	ldrh r2, [r1]
	adds r0, r3, 0
	adds r0, 0x58
	strh r2, [r0]
	subs r0, 0x2
	ldrh r0, [r0]
	ldrh r2, [r1]
	adds r0, r2
	strh r0, [r1]
	movs r1, 0xB4
	lsls r1, 1
	adds r0, r3, r1
	bl sub_8051414
	pop {r0}
	bx r0
	.align 2, 0
_080514A0: .4byte gUnknown_03004854
	thumb_func_end sub_8051474

	thumb_func_start sub_80514A4
sub_80514A4: @ 80514A4
	ldr r1, _080514E8 @ =REG_BG2PA
	ldr r0, _080514EC @ =gUnknown_03004854
	ldr r2, [r0]
	movs r3, 0xB4
	lsls r3, 1
	adds r0, r2, r3
	ldrh r0, [r0]
	strh r0, [r1]
	adds r1, 0x2
	adds r3, 0x2
	adds r0, r2, r3
	ldrh r0, [r0]
	strh r0, [r1]
	adds r1, 0x2
	adds r3, 0x2
	adds r0, r2, r3
	ldrh r0, [r0]
	strh r0, [r1]
	adds r1, 0x2
	adds r3, 0x2
	adds r0, r2, r3
	ldrh r0, [r0]
	strh r0, [r1]
	adds r1, 0x2
	adds r3, 0x2
	adds r0, r2, r3
	ldr r0, [r0]
	str r0, [r1]
	adds r1, 0x4
	adds r3, 0x4
	adds r0, r2, r3
	ldr r0, [r0]
	str r0, [r1]
	bx lr
	.align 2, 0
_080514E8: .4byte REG_BG2PA
_080514EC: .4byte gUnknown_03004854
	thumb_func_end sub_80514A4

	thumb_func_start sub_80514F0
sub_80514F0: @ 80514F0
	ldr r1, _0805151C @ =REG_BG1HOFS
	ldr r0, _08051520 @ =gUnknown_03004854
	ldr r3, [r0]
	movs r0, 0xA2
	lsls r0, 1
	adds r2, r3, r0
	ldrh r0, [r2]
	strh r0, [r1]
	adds r1, 0x2
	movs r0, 0xA3
	lsls r0, 1
	adds r3, r0
	ldrh r0, [r3]
	strh r0, [r1]
	subs r1, 0x6
	ldrh r0, [r2]
	strh r0, [r1]
	adds r1, 0x2
	ldrh r0, [r3]
	strh r0, [r1]
	bx lr
	.align 2, 0
_0805151C: .4byte REG_BG1HOFS
_08051520: .4byte gUnknown_03004854
	thumb_func_end sub_80514F0

	thumb_func_start sub_8051524
sub_8051524: @ 8051524
	push {lr}
	adds r2, r0, 0
	ldrh r0, [r2, 0x2E]
	ldrh r1, [r2, 0x32]
	adds r0, r1
	strh r0, [r2, 0x32]
	ldrh r0, [r2, 0x30]
	ldrh r1, [r2, 0x34]
	adds r0, r1
	strh r0, [r2, 0x34]
	movs r1, 0x32
	ldrsh r0, [r2, r1]
	cmp r0, 0
	bge _08051542
	adds r0, 0x7
_08051542:
	asrs r0, 3
	strh r0, [r2, 0x24]
	movs r1, 0x34
	ldrsh r0, [r2, r1]
	cmp r0, 0
	bge _08051550
	adds r0, 0x7
_08051550:
	asrs r0, 3
	strh r0, [r2, 0x26]
	adds r0, r2, 0
	adds r0, 0x3F
	ldrb r1, [r0]
	movs r0, 0x10
	ands r0, r1
	cmp r0, 0
	beq _08051568
	adds r0, r2, 0
	bl DestroySprite
_08051568:
	pop {r0}
	bx r0
	thumb_func_end sub_8051524

	thumb_func_start sub_805156C
sub_805156C: @ 805156C
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	bl Random
	lsls r0, 16
	lsrs r1, r0, 16
	movs r0, 0x1
	ands r1, r0
	adds r0, r1, 0x1
	cmp r0, 0
	beq _08051628
	ldr r0, _08051638 @ =gSineTable
	mov r9, r0
	ldr r2, _0805163C @ =gSprites
	mov r10, r2
	adds r6, r1, 0x1
	movs r3, 0x1F
	mov r8, r3
	movs r7, 0x10
_08051598:
	bl Random
	ldr r1, _08051640 @ =gUnknown_03004854
	ldr r4, [r1]
	adds r4, 0x54
	lsls r0, 16
	lsrs r0, 16
	movs r1, 0x14
	bl __umodsi3
	ldrh r1, [r4]
	adds r1, r0
	lsls r1, 16
	movs r0, 0xFF
	lsls r0, 16
	ands r0, r1
	lsrs r2, r0, 16
	adds r0, r2, 0
	adds r0, 0x40
	lsls r0, 1
	add r0, r9
	movs r3, 0
	ldrsh r1, [r0, r3]
	cmp r1, 0
	bge _080515CC
	adds r1, 0x3
_080515CC:
	asrs r1, 2
	lsls r0, r2, 1
	add r0, r9
	movs r2, 0
	ldrsh r0, [r0, r2]
	cmp r0, 0
	bge _080515DC
	adds r0, 0x3
_080515DC:
	asrs r2, r0, 2
	adds r1, 0x78
	adds r2, 0x50
	ldr r0, _08051644 @ =gSpriteTemplate_82164FC
	movs r3, 0x1
	bl CreateSprite
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	bl Random
	lsls r5, r4, 4
	adds r5, r4
	lsls r5, 2
	mov r3, r10
	adds r4, r5, r3
	lsls r0, 16
	lsrs r0, 16
	mov r1, r8
	ands r0, r1
	subs r0, r7, r0
	strh r0, [r4, 0x2E]
	bl Random
	lsls r0, 16
	lsrs r0, 16
	mov r2, r8
	ands r0, r2
	subs r0, r7, r0
	strh r0, [r4, 0x30]
	ldr r3, _08051648 @ =gSprites + 0x1C
	adds r5, r3
	ldr r0, _0805164C @ =sub_8051524
	str r0, [r5]
	subs r6, 0x1
	cmp r6, 0
	bne _08051598
_08051628:
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_08051638: .4byte gSineTable
_0805163C: .4byte gSprites
_08051640: .4byte gUnknown_03004854
_08051644: .4byte gSpriteTemplate_82164FC
_08051648: .4byte gSprites + 0x1C
_0805164C: .4byte sub_8051524
	thumb_func_end sub_805156C

	thumb_func_start sub_8051650
sub_8051650: @ 8051650
	push {r4,lr}
	adds r4, r0, 0
	ldrh r0, [r4, 0x2E]
	adds r0, 0x1
	strh r0, [r4, 0x2E]
	movs r1, 0x2E
	ldrsh r0, [r4, r1]
	movs r1, 0x3
	bl __divsi3
	negs r0, r0
	strh r0, [r4, 0x26]
	adds r0, r4, 0
	adds r0, 0x3F
	ldrb r1, [r0]
	movs r0, 0x10
	ands r0, r1
	cmp r0, 0
	beq _0805167C
	adds r0, r4, 0
	bl DestroySprite
_0805167C:
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end sub_8051650

	thumb_func_start sub_8051684
sub_8051684: @ 8051684
	push {lr}
	adds r2, r0, 0
	ldrh r0, [r2, 0x2E]
	adds r0, 0x1
	strh r0, [r2, 0x2E]
	movs r1, 0x2E
	ldrsh r0, [r2, r1]
	lsls r0, 1
	negs r0, r0
	strh r0, [r2, 0x26]
	lsls r0, 16
	asrs r0, 16
	movs r1, 0xC
	negs r1, r1
	cmp r0, r1
	bge _080516A8
	ldr r0, _080516C0 @ =0x0000fff4
	strh r0, [r2, 0x26]
_080516A8:
	adds r0, r2, 0
	adds r0, 0x3F
	ldrb r1, [r0]
	movs r0, 0x10
	ands r0, r1
	cmp r0, 0
	beq _080516BC
	adds r0, r2, 0
	bl DestroySprite
_080516BC:
	pop {r0}
	bx r0
	.align 2, 0
_080516C0: .4byte 0x0000fff4
	thumb_func_end sub_8051684

	thumb_func_start sub_80516C4
sub_80516C4: @ 80516C4
	push {r4,lr}
	lsls r0, 24
	lsrs r0, 24
	lsls r1, 16
	lsrs r1, 16
	ldr r2, _080516F4 @ =gUnknown_03004854
	ldr r3, [r2]
	lsls r4, r0, 1
	adds r2, r3, 0
	adds r2, 0x80
	adds r2, r4
	strh r1, [r2]
	lsls r0, 4
	movs r2, 0xBE
	lsls r2, 1
	adds r0, r2
	adds r3, r0
	adds r0, r3, 0
	bl sub_804E844
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080516F4: .4byte gUnknown_03004854
	thumb_func_end sub_80516C4

	thumb_func_start unref_sub_80516F8
unref_sub_80516F8: @ 80516F8
	push {r4-r6,lr}
	sub sp, 0x4
	lsls r0, 24
	lsrs r0, 24
	adds r5, r0, 0
	lsls r0, r5, 2
	adds r0, r5
	lsls r0, 3
	ldr r1, _080517B8 @ =gTasks
	adds r4, r0, r1
	ldr r6, _080517BC @ =gReceivedRemoteLinkPlayers
	ldrb r0, [r6]
	cmp r0, 0
	beq _0805180C
	bl GetMultiplayerId
	lsls r0, 24
	lsrs r1, r0, 24
	cmp r1, 0
	bne _080517D4
	ldrh r0, [r4, 0x8]
	adds r0, 0x1
	strh r0, [r4, 0x8]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x78
	ble _08051730
	strh r1, [r4, 0x8]
_08051730:
	movs r1, 0x8
	ldrsh r0, [r4, r1]
	cmp r0, 0x64
	bne _080517A0
	ldr r0, _080517C0 @ =gUnknown_03004854
	ldr r0, [r0]
	adds r0, 0x4
	movs r1, 0x14
	str r1, [sp]
	movs r1, 0
	movs r2, 0
	movs r3, 0x10
	bl ZeroFillWindowRect
	movs r0, 0x4
	movs r1, 0x4
	movs r2, 0xA
	movs r3, 0xC
	bl MenuDrawTextWindow
	movs r2, 0
	ldr r6, _080517C4 @ =gLinkPlayers + 0x4
_0805175C:
	adds r4, r2, 0x1
	lsls r0, r4, 3
	subs r0, r4
	lsls r0, 2
	adds r0, r6
	ldr r0, [r0]
	cmp r0, 0
	beq _08051784
	ldr r1, _080517C8 @ =gUnknown_08216284
	lsls r0, r2, 2
	adds r0, r1
	ldr r0, [r0]
	lsls r2, 25
	movs r1, 0xA0
	lsls r1, 19
	adds r2, r1
	lsrs r2, 24
	movs r1, 0x5
	bl MenuPrint
_08051784:
	movs r0, 0
	movs r1, 0xD
	movs r2, 0x1D
	movs r3, 0x13
	bl MenuDrawTextWindow
	ldr r0, _080517CC @ =gOtherText_PressAToStart
	movs r1, 0x1
	movs r2, 0xF
	bl MenuPrint
	adds r2, r4, 0
	cmp r2, 0x2
	ble _0805175C
_080517A0:
	ldr r0, _080517D0 @ =gMain
	ldrh r1, [r0, 0x2E]
	movs r0, 0x1
	ands r0, r1
	cmp r0, 0
	beq _0805180C
	bl sub_8007E4C
	adds r0, r5, 0
	bl DestroyTask
	b _0805180C
	.align 2, 0
_080517B8: .4byte gTasks
_080517BC: .4byte gReceivedRemoteLinkPlayers
_080517C0: .4byte gUnknown_03004854
_080517C4: .4byte gLinkPlayers + 0x4
_080517C8: .4byte gUnknown_08216284
_080517CC: .4byte gOtherText_PressAToStart
_080517D0: .4byte gMain
_080517D4:
	movs r1, 0x8
	ldrsh r0, [r4, r1]
	cmp r0, 0xA
	bne _080517E6
	ldr r0, _08051814 @ =gOtherText_PleaseWait
	movs r1, 0x3
	movs r2, 0xA
	bl MenuPrint
_080517E6:
	ldrh r0, [r4, 0x8]
	adds r0, 0x1
	strh r0, [r4, 0x8]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x78
	ble _080517F8
	movs r0, 0
	strh r0, [r4, 0x8]
_080517F8:
	ldr r0, _08051818 @ =byte_3002A68
	ldrb r0, [r0]
	cmp r0, 0x4
	bls _0805180C
	ldrb r0, [r6]
	cmp r0, 0x1
	bne _0805180C
	adds r0, r5, 0
	bl DestroyTask
_0805180C:
	add sp, 0x4
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_08051814: .4byte gOtherText_PleaseWait
_08051818: .4byte byte_3002A68
	thumb_func_end unref_sub_80516F8

	thumb_func_start sub_805181C
sub_805181C: @ 805181C
	push {r4,lr}
	adds r4, r0, 0
	movs r1, 0x2E
	ldrsh r0, [r4, r1]
	cmp r0, 0x1
	beq _08051858
	cmp r0, 0x1
	bgt _08051832
	cmp r0, 0
	beq _08051838
	b _080518BE
_08051832:
	cmp r0, 0x2
	beq _08051872
	b _080518BE
_08051838:
	ldrh r0, [r4, 0x30]
	adds r0, 0x8
	strh r0, [r4, 0x30]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x58
	ble _080518BE
	movs r0, 0x58
	strh r0, [r4, 0x30]
	ldrh r0, [r4, 0x2E]
	adds r0, 0x1
	strh r0, [r4, 0x2E]
	movs r0, 0x38
	bl PlaySE
	b _080518BE
_08051858:
	ldrh r0, [r4, 0x32]
	adds r0, 0x1
	strh r0, [r4, 0x32]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x14
	ble _080518BE
	ldrh r0, [r4, 0x2E]
	adds r0, 0x1
	strh r0, [r4, 0x2E]
	movs r0, 0
	strh r0, [r4, 0x32]
	b _080518BE
_08051872:
	ldrh r0, [r4, 0x30]
	adds r0, 0x4
	strh r0, [r4, 0x30]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0xB0
	ble _080518BE
	ldrh r0, [r4, 0x34]
	adds r0, 0x1
	adds r1, r0, 0
	strh r0, [r4, 0x34]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x3
	bne _080518AC
	adds r0, r4, 0
	bl DestroySprite
	ldr r0, _080518A8 @ =gSpriteTemplate_821657C
	movs r2, 0x14
	negs r2, r2
	movs r1, 0x78
	movs r3, 0x2
	bl CreateSprite
	b _080518BE
	.align 2, 0
_080518A8: .4byte gSpriteTemplate_821657C
_080518AC:
	movs r0, 0
	strh r0, [r4, 0x2E]
	ldr r0, _080518C8 @ =0x0000fff0
	strh r0, [r4, 0x30]
	lsls r1, 24
	lsrs r1, 24
	adds r0, r4, 0
	bl StartSpriteAnim
_080518BE:
	ldrh r0, [r4, 0x30]
	strh r0, [r4, 0x26]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080518C8: .4byte 0x0000fff0
	thumb_func_end sub_805181C

	thumb_func_start sub_80518CC
sub_80518CC: @ 80518CC
	push {r4,lr}
	adds r4, r0, 0
	movs r1, 0x2E
	ldrsh r0, [r4, r1]
	cmp r0, 0x1
	beq _08051908
	cmp r0, 0x1
	bgt _080518E2
	cmp r0, 0
	beq _080518E8
	b _0805193C
_080518E2:
	cmp r0, 0x2
	beq _0805191E
	b _0805193C
_080518E8:
	ldrh r0, [r4, 0x30]
	adds r0, 0x8
	strh r0, [r4, 0x30]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x5C
	ble _0805193C
	movs r0, 0x5C
	strh r0, [r4, 0x30]
	ldrh r0, [r4, 0x2E]
	adds r0, 0x1
	strh r0, [r4, 0x2E]
	movs r0, 0x15
	bl PlaySE
	b _0805193C
_08051908:
	ldrh r0, [r4, 0x32]
	adds r0, 0x1
	strh r0, [r4, 0x32]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x14
	ble _0805193C
	ldrh r0, [r4, 0x2E]
	adds r0, 0x1
	strh r0, [r4, 0x2E]
	b _0805193C
_0805191E:
	ldrh r0, [r4, 0x30]
	adds r0, 0x4
	strh r0, [r4, 0x30]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0xB0
	ble _0805193C
	ldr r0, _08051948 @ =gUnknown_03004854
	ldr r1, [r0]
	ldrb r0, [r1]
	adds r0, 0x1
	strb r0, [r1]
	adds r0, r4, 0
	bl DestroySprite
_0805193C:
	ldrh r0, [r4, 0x30]
	strh r0, [r4, 0x26]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08051948: .4byte gUnknown_03004854
	thumb_func_end sub_80518CC

	thumb_func_start sub_805194C
sub_805194C: @ 805194C
	push {lr}
	lsls r0, 16
	lsrs r0, 16
	lsls r1, 16
	lsrs r3, r1, 16
	ldr r1, _08051978 @ =gUnknown_03004854
	ldr r1, [r1]
	movs r2, 0xA0
	lsls r2, 1
	adds r1, r2
	ldrh r2, [r1]
	cmp r2, r0
	bcs _08051972
	adds r0, r2, 0x2
	strh r0, [r1]
	ldrh r0, [r1]
	adds r1, r3, 0
	bl sub_805197C
_08051972:
	pop {r0}
	bx r0
	.align 2, 0
_08051978: .4byte gUnknown_03004854
	thumb_func_end sub_805194C

	thumb_func_start sub_805197C
sub_805197C: @ 805197C
	push {r4-r7,lr}
	lsls r0, 16
	lsls r1, 16
	lsrs r1, 16
	ldr r7, _08051A0C @ =0x06006000
	lsrs r0, 10
	bl __divsi3
	adds r1, r0, 0
	cmp r1, 0
	bge _08051994
	adds r0, r1, 0x7
_08051994:
	asrs r4, r0, 3
	movs r3, 0
	cmp r3, r4
	bge _080519BC
	ldr r0, _08051A10 @ =0x000081e9
	adds r6, r0, 0
	adds r0, 0x10
	adds r5, r0, 0
	adds r2, r7, 0
	adds r2, 0x56
	adds r0, r7, 0
	adds r3, r4, 0
_080519AC:
	strh r6, [r0, 0x16]
	strh r5, [r2]
	adds r2, 0x2
	adds r0, 0x2
	subs r3, 0x1
	cmp r3, 0
	bne _080519AC
	adds r3, r4, 0
_080519BC:
	adds r0, r1, 0
	cmp r1, 0
	bge _080519C4
	adds r0, r1, 0x7
_080519C4:
	asrs r2, r0, 3
	lsls r0, r2, 3
	subs r2, r1, r0
	cmp r2, 0
	beq _080519E2
	lsls r0, r3, 1
	adds r0, r7
	ldr r4, _08051A14 @ =0xffff81e1
	adds r1, r2, r4
	strh r1, [r0, 0x16]
	adds r0, 0x56
	adds r4, 0x10
	adds r1, r2, r4
	strh r1, [r0]
	adds r3, 0x1
_080519E2:
	cmp r3, 0x7
	bgt _08051A06
	ldr r0, _08051A18 @ =0x000081e1
	adds r4, r0, 0
	adds r0, 0x10
	adds r2, r0, 0
	lsls r1, r3, 1
	adds r0, r1, 0
	adds r0, 0x56
	adds r0, r7
	adds r1, r7
_080519F8:
	strh r4, [r1, 0x16]
	strh r2, [r0]
	adds r0, 0x2
	adds r1, 0x2
	adds r3, 0x1
	cmp r3, 0x7
	ble _080519F8
_08051A06:
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_08051A0C: .4byte 0x06006000
_08051A10: .4byte 0x000081e9
_08051A14: .4byte 0xffff81e1
_08051A18: .4byte 0x000081e1
	thumb_func_end sub_805197C

	thumb_func_start sub_8051A1C
sub_8051A1C: @ 8051A1C
	push {lr}
	lsls r0, 16
	lsrs r0, 16
	ldr r1, _08051A34 @ =0x00057e40
	muls r0, r1
	cmp r0, 0
	bge _08051A2E
	ldr r1, _08051A38 @ =0x0000ffff
	adds r0, r1
_08051A2E:
	asrs r0, 16
	pop {r1}
	bx r1
	.align 2, 0
_08051A34: .4byte 0x00057e40
_08051A38: .4byte 0x0000ffff
	thumb_func_end sub_8051A1C

	thumb_func_start sub_8051A3C
sub_8051A3C: @ 8051A3C
	push {r4-r6,lr}
	sub sp, 0x8
	lsls r0, 16
	lsrs r0, 16
	bl sub_8051A1C
	adds r5, r0, 0
	ldr r0, _08051ABC @ =gUnknown_03004854
	ldr r0, [r0]
	adds r1, r0, 0
	adds r1, 0x5A
	ldrh r0, [r1]
	cmp r0, r5
	bcs _08051A5A
	strh r5, [r1]
_08051A5A:
	movs r6, 0
_08051A5C:
	mov r0, sp
	adds r4, r0, r6
	adds r0, r5, 0
	movs r1, 0xA
	bl __umodsi3
	strb r0, [r4]
	adds r0, r5, 0
	movs r1, 0xA
	bl __udivsi3
	adds r5, r0, 0
	adds r0, r6, 0x1
	lsls r0, 24
	lsrs r6, r0, 24
	cmp r6, 0x4
	bls _08051A5C
	ldr r2, _08051AC0 @ =0x06006458
	mov r0, sp
	ldr r3, _08051AC4 @ =0x00008172
	adds r1, r3, 0
	ldrb r0, [r0, 0x4]
	adds r0, r1, r0
	strh r0, [r2]
	adds r2, 0x2
	mov r0, sp
	ldrb r0, [r0, 0x3]
	adds r0, r1
	strh r0, [r2]
	adds r2, 0x2
	mov r0, sp
	ldrb r0, [r0, 0x2]
	adds r0, r1
	strh r0, [r2]
	adds r2, 0x4
	mov r0, sp
	ldrb r0, [r0, 0x1]
	adds r0, r1
	strh r0, [r2]
	adds r2, 0x2
	mov r0, sp
	ldrb r0, [r0]
	adds r1, r0
	strh r1, [r2]
	add sp, 0x8
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_08051ABC: .4byte gUnknown_03004854
_08051AC0: .4byte 0x06006458
_08051AC4: .4byte 0x00008172
	thumb_func_end sub_8051A3C

	thumb_func_start sub_8051AC8
sub_8051AC8: @ 8051AC8
	push {r4-r6,lr}
	adds r6, r0, 0
	lsls r4, r1, 16
	lsrs r5, r4, 16
	movs r1, 0
	ldrsh r0, [r6, r1]
	cmp r0, 0
	bne _08051AEC
	bl Random
	lsls r0, 16
	lsrs r0, 16
	adds r1, r5, 0
	bl __umodsi3
	lsrs r1, r4, 17
	subs r0, r1
	strh r0, [r6]
_08051AEC:
	pop {r4-r6}
	pop {r0}
	bx r0
	thumb_func_end sub_8051AC8

	thumb_func_start sub_8051AF4
sub_8051AF4: @ 8051AF4
	push {lr}
	adds r1, r0, 0
	ldrh r2, [r1]
	movs r3, 0
	ldrsh r0, [r1, r3]
	cmp r0, 0
	bge _08051B06
	adds r0, r2, 0x1
	strh r0, [r1]
_08051B06:
	ldrh r2, [r1]
	movs r3, 0
	ldrsh r0, [r1, r3]
	cmp r0, 0
	ble _08051B14
	subs r0, r2, 0x1
	strh r0, [r1]
_08051B14:
	pop {r0}
	bx r0
	thumb_func_end sub_8051AF4

	thumb_func_start sub_8051B18
sub_8051B18: @ 8051B18
	push {r4,lr}
	ldr r4, _08051B3C @ =gUnknown_03004854
	ldr r0, [r4]
	movs r1, 0xA2
	lsls r1, 1
	adds r0, r1
	bl sub_8051AF4
	ldr r0, [r4]
	movs r1, 0xA3
	lsls r1, 1
	adds r0, r1
	bl sub_8051AF4
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08051B3C: .4byte gUnknown_03004854
	thumb_func_end sub_8051B18

	thumb_func_start sub_8051B40
sub_8051B40: @ 8051B40
	push {r4,r5,lr}
	adds r4, r0, 0
	lsls r1, 16
	lsrs r1, 16
	movs r5, 0x8
	cmp r1, 0x9
	bhi _08051B50
	movs r5, 0x10
_08051B50:
	ldrh r0, [r4]
	movs r2, 0
	ldrsh r1, [r4, r2]
	cmp r1, 0
	bne _08051B6E
	bl Random
	lsls r0, 16
	lsrs r0, 16
	adds r1, r5, 0
	bl __modsi3
	lsrs r1, r5, 1
	subs r0, r1
	b _08051B82
_08051B6E:
	cmp r1, 0
	bge _08051B76
	adds r0, 0x1
	strh r0, [r4]
_08051B76:
	ldrh r1, [r4]
	movs r2, 0
	ldrsh r0, [r4, r2]
	cmp r0, 0
	ble _08051B84
	subs r0, r1, 0x1
_08051B82:
	strh r0, [r4]
_08051B84:
	pop {r4,r5}
	pop {r0}
	bx r0
	thumb_func_end sub_8051B40

	thumb_func_start sub_8051B8C
sub_8051B8C: @ 8051B8C
	push {r4,r5,lr}
	ldr r5, _08051BE4 @ =gUnknown_03004854
	ldr r2, [r5]
	movs r4, 0x98
	lsls r4, 1
	adds r0, r2, r4
	ldr r1, [r0]
	cmp r1, 0
	bne _08051BAC
	movs r3, 0xA2
	lsls r3, 1
	adds r0, r2, r3
	strh r1, [r0]
	adds r3, 0x2
	adds r0, r2, r3
	strh r1, [r0]
_08051BAC:
	ldr r0, [r5]
	adds r2, r0, r4
	ldr r1, [r2]
	adds r1, 0x1
	str r1, [r2]
	movs r2, 0xA2
	lsls r2, 1
	adds r0, r2
	lsls r1, 16
	lsrs r1, 16
	bl sub_8051B40
	ldr r1, [r5]
	movs r3, 0xA3
	lsls r3, 1
	adds r0, r1, r3
	adds r1, r4
	ldrh r1, [r1]
	bl sub_8051B40
	ldr r2, [r5]
	adds r0, r2, r4
	ldr r0, [r0]
	cmp r0, 0x14
	beq _08051BE8
	movs r0, 0
	b _08051BFC
	.align 2, 0
_08051BE4: .4byte gUnknown_03004854
_08051BE8:
	movs r1, 0xA2
	lsls r1, 1
	adds r0, r2, r1
	movs r1, 0
	strh r1, [r0]
	movs r3, 0xA3
	lsls r3, 1
	adds r0, r2, r3
	strh r1, [r0]
	movs r0, 0x1
_08051BFC:
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end sub_8051B8C

	thumb_func_start sub_8051C04
sub_8051C04: @ 8051C04
	ldr r1, _08051C20 @ =gUnknown_03004854
	ldr r2, [r1]
	movs r3, 0xA2
	lsls r3, 1
	adds r1, r2, r3
	ldrh r1, [r1]
	negs r1, r1
	strh r1, [r0, 0x24]
	adds r3, 0x2
	adds r1, r2, r3
	ldrh r1, [r1]
	negs r1, r1
	strh r1, [r0, 0x26]
	bx lr
	.align 2, 0
_08051C20: .4byte gUnknown_03004854
	thumb_func_end sub_8051C04

	thumb_func_start sub_8051C24
sub_8051C24: @ 8051C24
	push {lr}
	ldr r2, _08051C4C @ =gSaveBlock1
	ldr r0, _08051C50 @ =gUnknown_03004854
	ldr r1, [r0]
	adds r0, r1, 0
	adds r0, 0x88
	ldrb r0, [r0]
	subs r0, 0x2
	lsls r0, 1
	ldr r3, _08051C54 @ =0x0000096c
	adds r2, r3
	adds r2, r0, r2
	adds r1, 0x5A
	ldrh r1, [r1]
	ldrh r0, [r2]
	cmp r0, r1
	bcs _08051C48
	strh r1, [r2]
_08051C48:
	pop {r0}
	bx r0
	.align 2, 0
_08051C4C: .4byte gSaveBlock1
_08051C50: .4byte gUnknown_03004854
_08051C54: .4byte 0x0000096c
	thumb_func_end sub_8051C24

	thumb_func_start sub_8051C58
sub_8051C58: @ 8051C58
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	sub sp, 0x34
	ldr r1, _08051C7C @ =gUnknown_03004854
	ldr r0, [r1]
	ldrb r0, [r0]
	adds r2, r1, 0
	cmp r0, 0x6
	bls _08051C72
	b _0805200A
_08051C72:
	lsls r0, 2
	ldr r1, _08051C80 @ =_08051C84
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_08051C7C: .4byte gUnknown_03004854
_08051C80: .4byte _08051C84
	.align 2, 0
_08051C84:
	.4byte _08051CA0
	.4byte _08051CB6
	.4byte _08051CD0
	.4byte _08051D20
	.4byte _08051F44
	.4byte _08051F58
	.4byte _08051FF8
_08051CA0:
	ldr r1, [r2]
	ldrb r0, [r1]
	adds r0, 0x1
	strb r0, [r1]
	ldr r0, [r2]
	movs r1, 0x98
	lsls r1, 1
	adds r0, r1
	movs r1, 0x11
	str r1, [r0]
	b _0805200A
_08051CB6:
	ldr r1, [r2]
	movs r0, 0x98
	lsls r0, 1
	adds r2, r1, r0
	ldr r0, [r2]
	subs r0, 0xA
	str r0, [r2]
	cmp r0, 0
	blt _08051CCA
	b _0805200A
_08051CCA:
	movs r0, 0
	str r0, [r2]
	b _08051FE2
_08051CD0:
	ldr r1, [r2]
	movs r2, 0x98
	lsls r2, 1
	adds r1, r2
	ldr r0, [r1]
	adds r0, 0x1
	str r0, [r1]
	cmp r0, 0x14
	bgt _08051CE4
	b _0805200A
_08051CE4:
	movs r6, 0
_08051CE6:
	ldr r4, _08051D18 @ =gUnknown_03004854
	ldr r0, [r4]
	adds r0, 0x50
	adds r0, r6
	ldrb r1, [r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	ldr r1, _08051D1C @ =gSprites
	adds r0, r1
	bl DestroySprite
	adds r0, r6, 0x1
	lsls r0, 16
	lsrs r6, r0, 16
	cmp r6, 0x2
	bls _08051CE6
	ldr r1, [r4]
	movs r0, 0x98
	lsls r0, 1
	adds r2, r1, r0
	movs r0, 0
	str r0, [r2]
	b _08051FE2
	.align 2, 0
_08051D18: .4byte gUnknown_03004854
_08051D1C: .4byte gSprites
_08051D20:
	movs r0, 0x4
	movs r1, 0x2
	movs r2, 0x19
	movs r3, 0x11
	bl MenuDrawTextWindow
	ldr r0, _08051F14 @ =gOtherText_ResultsOfBlending
	movs r1, 0x5
	movs r2, 0x3
	movs r3, 0xA0
	bl sub_8072BD8
	movs r6, 0
	ldr r1, _08051F18 @ =gUnknown_03004854
	ldr r0, [r1]
	adds r0, 0x88
	add r2, sp, 0xC
	mov r9, r2
	mov r2, sp
	adds r2, 0x16
	str r2, [sp, 0x30]
	ldrb r0, [r0]
	cmp r6, r0
	bcs _08051E04
	mov r8, r1
	ldr r0, _08051F1C @ =gLinkPlayers
	mov r10, r0
_08051D56:
	mov r1, r8
	ldr r2, [r1]
	movs r1, 0xB2
	lsls r1, 1
	adds r0, r2, r1
	adds r0, r6
	ldrb r5, [r0]
	mov r7, r9
	lsls r1, r5, 4
	adds r1, r2
	movs r2, 0xBF
	lsls r2, 1
	adds r1, r2
	adds r0, r7, 0
	bl StringCopy
	lsls r4, r5, 3
	subs r4, r5
	lsls r4, 2
	mov r1, r10
	adds r0, r4, r1
	ldrb r1, [r0, 0x1A]
	adds r0, r7, 0
	bl ConvertInternationalString
	adds r0, r7, 0
	ldr r1, _08051F20 @ =gOtherText_Berry
	bl StringAppend
	mov r2, r8
	ldr r0, [r2]
	adds r7, r0, 0
	adds r7, 0xAB
	adds r5, r6, 0x1
	adds r0, r7, 0
	adds r1, r5, 0
	bl ConvertIntToDecimalString
	adds r7, r0, 0
	movs r1, 0
	strb r1, [r7]
	movs r0, 0xAD
	strb r0, [r7, 0x1]
	strb r1, [r7, 0x2]
	adds r7, 0x3
	ldr r0, _08051F24 @ =gLinkPlayers + 0x8
	adds r4, r0
	adds r0, r7, 0
	adds r1, r4, 0
	movs r2, 0x58
	movs r3, 0
	bl sub_8072C74
	adds r7, r0, 0
	add r1, sp, 0xC
	movs r2, 0x9D
	movs r3, 0
	bl sub_8072C74
	mov r2, r8
	ldr r1, [r2]
	adds r0, r1, 0
	adds r0, 0xAB
	ldr r3, _08051F28 @ =gUnknown_082165E9
	adds r1, 0x88
	ldrb r2, [r1]
	adds r3, r2, r3
	ldr r1, _08051F2C @ =gUnknown_082165EE
	adds r2, r1
	ldrb r1, [r2]
	adds r2, r6, 0
	muls r2, r1
	ldrb r3, [r3]
	adds r2, r3
	lsls r2, 24
	lsrs r2, 24
	movs r1, 0x5
	bl MenuPrint
	lsls r5, 16
	lsrs r6, r5, 16
	mov r1, r8
	ldr r0, [r1]
	adds r0, 0x88
	ldrb r0, [r0]
	cmp r6, r0
	bcc _08051D56
_08051E04:
	ldr r6, _08051F18 @ =gUnknown_03004854
	ldr r0, [r6]
	adds r0, 0x5A
	ldrh r0, [r0]
	movs r1, 0x64
	bl __umodsi3
	adds r1, r0, 0
	lsls r1, 16
	lsrs r1, 16
	mov r0, r9
	movs r2, 0x2
	movs r3, 0x2
	bl ConvertIntToDecimalStringN
	ldr r0, [r6]
	adds r7, r0, 0
	adds r7, 0xAB
	ldr r1, _08051F30 @ =gOtherText_MaxSpeed
	adds r0, r7, 0
	bl StringCopy
	adds r7, r0, 0
	ldr r0, [r6]
	adds r0, 0x5A
	ldrh r0, [r0]
	movs r1, 0x64
	bl __udivsi3
	adds r1, r0, 0
	lsls r1, 16
	lsrs r1, 16
	adds r0, r7, 0
	movs r2, 0x79
	movs r3, 0x1
	bl sub_8072C14
	adds r7, r0, 0
	movs r1, 0
	strb r1, [r7]
	movs r0, 0xAD
	strb r0, [r7, 0x1]
	strb r1, [r7, 0x2]
	adds r7, 0x3
	adds r0, r7, 0
	mov r1, r9
	movs r2, 0x8E
	movs r3, 0x1
	bl sub_8072C74
	adds r7, r0, 0
	ldr r1, _08051F34 @ =gOtherText_RPM
	bl StringCopy
	ldr r0, [r6]
	adds r0, 0xAB
	movs r1, 0x5
	movs r2, 0xD
	bl MenuPrint
	ldr r0, [r6]
	movs r2, 0x96
	lsls r2, 1
	adds r0, r2
	ldr r0, [r0]
	movs r1, 0x3C
	bl __udivsi3
	adds r4, r0, 0
	lsls r4, 16
	lsrs r4, 16
	adds r0, r4, 0
	movs r1, 0x3C
	bl __umodsi3
	adds r5, r0, 0
	lsls r5, 16
	lsrs r5, 16
	adds r0, r4, 0
	movs r1, 0x3C
	bl __udivsi3
	adds r1, r0, 0
	lsls r1, 16
	lsrs r1, 16
	mov r0, r9
	movs r2, 0x2
	movs r3, 0x2
	bl ConvertIntToDecimalStringN
	ldr r0, [sp, 0x30]
	adds r1, r5, 0
	movs r2, 0x2
	movs r3, 0x2
	bl ConvertIntToDecimalStringN
	ldr r0, [r6]
	adds r7, r0, 0
	adds r7, 0xAB
	ldr r1, _08051F38 @ =gOtherText_RequiredTime
	adds r0, r7, 0
	bl StringCopy
	adds r7, r0, 0
	mov r1, r9
	movs r2, 0x66
	movs r3, 0x1
	bl sub_8072C74
	adds r7, r0, 0
	ldr r1, _08051F3C @ =gOtherText_Min
	bl StringAppend
	adds r7, r0, 0
	ldr r1, [sp, 0x30]
	movs r2, 0x88
	movs r3, 0x1
	bl sub_8072C74
	adds r7, r0, 0
	ldr r1, _08051F40 @ =gOtherText_Sec
	bl StringCopy
	ldr r0, [r6]
	adds r0, 0xAB
	movs r1, 0x5
	movs r2, 0xF
	bl MenuPrint
	ldr r1, [r6]
	movs r0, 0x98
	lsls r0, 1
	adds r2, r1, r0
	movs r0, 0
	str r0, [r2]
	b _08051FE2
	.align 2, 0
_08051F14: .4byte gOtherText_ResultsOfBlending
_08051F18: .4byte gUnknown_03004854
_08051F1C: .4byte gLinkPlayers
_08051F20: .4byte gOtherText_Berry
_08051F24: .4byte gLinkPlayers + 0x8
_08051F28: .4byte gUnknown_082165E9
_08051F2C: .4byte gUnknown_082165EE
_08051F30: .4byte gOtherText_MaxSpeed
_08051F34: .4byte gOtherText_RPM
_08051F38: .4byte gOtherText_RequiredTime
_08051F3C: .4byte gOtherText_Min
_08051F40: .4byte gOtherText_Sec
_08051F44:
	ldr r0, _08051F54 @ =gMain
	ldrh r1, [r0, 0x2E]
	movs r0, 0x1
	ands r0, r1
	cmp r0, 0
	beq _0805200A
	ldr r1, [r2]
	b _08051FE2
	.align 2, 0
_08051F54: .4byte gMain
_08051F58:
	bl MenuZeroFillScreen
	movs r0, 0
	movs r1, 0xE
	movs r2, 0x1D
	movs r3, 0x13
	bl MenuDrawTextWindow
	movs r6, 0
	add r5, sp, 0x28
	ldr r0, _08051FEC @ =gUnknown_03004854
	ldr r0, [r0]
	adds r3, r0, 0
	adds r3, 0x80
	add r2, sp, 0x20
_08051F76:
	lsls r1, r6, 1
	adds r0, r3, r1
	ldrh r0, [r0]
	cmp r0, 0
	beq _08051F86
	adds r1, r2, r1
	subs r0, 0x85
	strh r0, [r1]
_08051F86:
	adds r0, r6, 0x1
	lsls r0, 16
	lsrs r6, r0, 16
	cmp r6, 0x3
	bls _08051F76
	bl sub_8050760
	ldr r4, _08051FEC @ =gUnknown_03004854
	ldr r3, [r4]
	movs r1, 0xBE
	lsls r1, 1
	adds r0, r3, r1
	adds r1, r3, 0
	adds r1, 0x88
	ldrb r2, [r1]
	subs r1, 0x2E
	ldrh r1, [r1]
	str r1, [sp]
	adds r1, r5, 0
	add r3, sp, 0x4
	bl sub_8050520
	ldr r1, [r4]
	adds r1, 0xAB
	adds r0, r5, 0
	bl sub_805201C
	ldr r0, _08051FF0 @ =sub_8052BD0
	movs r1, 0x6
	bl CreateTask
	ldr r0, [r4]
	adds r0, 0xAB
	movs r1, 0x1
	movs r2, 0xF
	bl MenuPrintMessage
	ldr r0, _08051FF4 @ =word_203855E
	ldrh r0, [r0]
	movs r1, 0x1
	bl RemoveBagItem
	adds r0, r5, 0
	bl sub_810CA34
	ldr r1, [r4]
_08051FE2:
	ldrb r0, [r1]
	adds r0, 0x1
	strb r0, [r1]
	b _0805200A
	.align 2, 0
_08051FEC: .4byte gUnknown_03004854
_08051FF0: .4byte sub_8052BD0
_08051FF4: .4byte word_203855E
_08051FF8:
	bl MenuUpdateWindowText
	lsls r0, 24
	cmp r0, 0
	beq _0805200A
	bl sub_8051C24
	movs r0, 0x1
	b _0805200C
_0805200A:
	movs r0, 0
_0805200C:
	add sp, 0x34
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r1}
	bx r1
	thumb_func_end sub_8051C58

	thumb_func_start sub_805201C
sub_805201C: @ 805201C
	push {r4-r6,lr}
	sub sp, 0xC
	adds r5, r0, 0
	adds r6, r1, 0
	movs r0, 0xFF
	strb r0, [r6]
	ldr r1, _080520B0 @ =gUnknown_083F7EB8
	ldrb r0, [r5]
	lsls r0, 2
	adds r0, r1
	ldr r1, [r0]
	adds r0, r6, 0
	bl StringCopy
	ldr r1, _080520B4 @ =gOtherText_PokeBlockMade
	adds r0, r6, 0
	bl StringAppend
	ldr r1, _080520B8 @ =gUnknown_082162C8
	adds r0, r6, 0
	bl StringAppend
	adds r0, r5, 0
	bl sub_810C9B0
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	adds r0, r5, 0
	bl sub_810C9E8
	adds r5, r0, 0
	lsls r5, 24
	lsrs r5, 24
	ldr r1, _080520BC @ =gOtherText_BlockLevelIs
	adds r0, r6, 0
	bl StringAppend
	mov r0, sp
	adds r1, r4, 0
	movs r2, 0
	movs r3, 0x3
	bl ConvertIntToDecimalStringN
	adds r0, r6, 0
	mov r1, sp
	bl StringAppend
	ldr r1, _080520C0 @ =gOtherText_BlockFeelIs
	adds r0, r6, 0
	bl StringAppend
	mov r0, sp
	adds r1, r5, 0
	movs r2, 0
	movs r3, 0x3
	bl ConvertIntToDecimalStringN
	adds r0, r6, 0
	mov r1, sp
	bl StringAppend
	ldr r1, _080520C4 @ =gOtherText_Period
	adds r0, r6, 0
	bl StringAppend
	ldr r1, _080520C8 @ =gUnknown_08216249
	adds r0, r6, 0
	bl StringAppend
	add sp, 0xC
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_080520B0: .4byte gUnknown_083F7EB8
_080520B4: .4byte gOtherText_PokeBlockMade
_080520B8: .4byte gUnknown_082162C8
_080520BC: .4byte gOtherText_BlockLevelIs
_080520C0: .4byte gOtherText_BlockFeelIs
_080520C4: .4byte gOtherText_Period
_080520C8: .4byte gUnknown_08216249
	thumb_func_end sub_805201C

	thumb_func_start sub_80520CC
sub_80520CC: @ 80520CC
	push {r4-r7,lr}
	mov r7, r9
	mov r6, r8
	push {r6,r7}
	mov r9, r0
	mov r12, r2
	lsls r1, 24
	lsrs r7, r1, 24
	movs r0, 0
	cmp r0, r7
	bge _08052118
_080520E2:
	movs r5, 0
	adds r1, r0, 0x1
	mov r8, r1
	cmp r5, r7
	bge _08052112
	mov r1, r9
	adds r6, r1, r0
_080520F0:
	ldrb r4, [r6]
	lsls r1, r4, 2
	add r1, r12
	mov r0, r9
	adds r2, r0, r5
	ldrb r3, [r2]
	lsls r0, r3, 2
	add r0, r12
	ldr r1, [r1]
	ldr r0, [r0]
	cmp r1, r0
	bls _0805210C
	strb r3, [r6]
	strb r4, [r2]
_0805210C:
	adds r5, 0x1
	cmp r5, r7
	blt _080520F0
_08052112:
	mov r0, r8
	cmp r0, r7
	blt _080520E2
_08052118:
	pop {r3,r4}
	mov r8, r3
	mov r9, r4
	pop {r4-r7}
	pop {r0}
	bx r0
	thumb_func_end sub_80520CC

	thumb_func_start sub_8052124
sub_8052124: @ 8052124
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	sub sp, 0x18
	movs r5, 0
	ldr r1, _08052144 @ =gUnknown_03004854
	ldr r0, [r1]
	adds r0, 0x88
	mov r10, r1
	mov r2, sp
	adds r2, 0x4
	str r2, [sp, 0x14]
	b _08052158
	.align 2, 0
_08052144: .4byte gUnknown_03004854
_08052148:
	mov r4, sp
	adds r0, r4, r5
	strb r5, [r0]
	adds r0, r5, 0x1
	lsls r0, 24
	lsrs r5, r0, 24
	ldr r0, [r1]
	adds r0, 0x88
_08052158:
	ldrb r0, [r0]
	cmp r5, r0
	bcc _08052148
	movs r5, 0
	mov r1, r10
	ldr r0, [r1]
	adds r1, r0, 0
	adds r1, 0x88
	ldrb r2, [r1]
	cmp r5, r2
	bcs _080521D6
	ldr r4, [sp, 0x14]
	mov r9, r4
	movs r2, 0xA6
	lsls r2, 1
	adds r2, r0
	mov r8, r2
	mov r12, r1
	movs r4, 0xA7
	lsls r4, 1
	adds r7, r0, r4
	movs r1, 0xA8
	lsls r1, 1
	adds r6, r0, r1
_08052188:
	lsls r4, r5, 2
	add r4, r9
	lsls r3, r5, 1
	adds r3, r5
	lsls r3, 1
	mov r2, r8
	adds r0, r2, r3
	ldrh r2, [r0]
	lsls r0, r2, 5
	subs r0, r2
	lsls r1, r0, 6
	subs r1, r0
	lsls r1, 3
	adds r1, r2
	lsls r1, 6
	str r1, [r4]
	adds r0, r7, r3
	ldrh r2, [r0]
	lsls r0, r2, 5
	subs r0, r2
	lsls r0, 2
	adds r0, r2
	lsls r0, 3
	adds r1, r0
	str r1, [r4]
	movs r0, 0xFA
	lsls r0, 2
	adds r1, r0
	adds r3, r6, r3
	ldrh r0, [r3]
	subs r1, r0
	str r1, [r4]
	adds r0, r5, 0x1
	lsls r0, 24
	lsrs r5, r0, 24
	mov r1, r12
	ldrb r1, [r1]
	cmp r5, r1
	bcc _08052188
_080521D6:
	mov r2, r10
	ldr r0, [r2]
	adds r0, 0x88
	ldrb r1, [r0]
	mov r0, sp
	ldr r2, [sp, 0x14]
	bl sub_80520CC
	movs r5, 0
	mov r4, r10
	ldr r0, [r4]
	adds r0, 0x88
	ldrb r0, [r0]
	cmp r5, r0
	bcs _08052218
	mov r2, r10
	movs r3, 0xB2
	lsls r3, 1
_080521FA:
	ldr r1, [r2]
	adds r1, r3
	adds r1, r5
	mov r4, sp
	adds r0, r4, r5
	ldrb r0, [r0]
	strb r0, [r1]
	adds r0, r5, 0x1
	lsls r0, 24
	lsrs r5, r0, 24
	ldr r0, [r2]
	adds r0, 0x88
	ldrb r0, [r0]
	cmp r5, r0
	bcc _080521FA
_08052218:
	add sp, 0x18
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	thumb_func_end sub_8052124

	thumb_func_start sub_8052228
sub_8052228: @ 8052228
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	ldr r1, _08052248 @ =gUnknown_03004854
	ldr r0, [r1]
	ldrb r0, [r0]
	adds r2, r1, 0
	cmp r0, 0x6
	bls _0805223C
	b _080524AE
_0805223C:
	lsls r0, 2
	ldr r1, _0805224C @ =_08052250
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_08052248: .4byte gUnknown_03004854
_0805224C: .4byte _08052250
	.align 2, 0
_08052250:
	.4byte _0805226C
	.4byte _08052282
	.4byte _0805229C
	.4byte _080522B6
	.4byte _08052464
	.4byte _0805247E
	.4byte _080524A4
_0805226C:
	ldr r1, [r2]
	ldrb r0, [r1]
	adds r0, 0x1
	strb r0, [r1]
	ldr r0, [r2]
	movs r1, 0x98
	lsls r1, 1
	adds r0, r1
	movs r1, 0xFF
	str r1, [r0]
	b _080524AE
_08052282:
	ldr r1, [r2]
	movs r0, 0x98
	lsls r0, 1
	adds r2, r1, r0
	ldr r0, [r2]
	subs r0, 0xA
	str r0, [r2]
	cmp r0, 0
	blt _08052296
	b _080524AE
_08052296:
	movs r0, 0
	str r0, [r2]
	b _08052494
_0805229C:
	ldr r1, [r2]
	movs r0, 0x98
	lsls r0, 1
	adds r2, r1, r0
	ldr r0, [r2]
	adds r0, 0x1
	str r0, [r2]
	cmp r0, 0x14
	bgt _080522B0
	b _080524AE
_080522B0:
	movs r0, 0
	str r0, [r2]
	b _08052494
_080522B6:
	movs r0, 0x4
	movs r1, 0x2
	movs r2, 0x19
	movs r3, 0x11
	bl MenuDrawTextWindow
	ldr r0, _0805236C @ =gOtherText_Ranking
	movs r1, 0x5
	movs r2, 0x3
	movs r3, 0xA0
	bl sub_8072BD8
	ldr r6, _08052370 @ =gSpriteTemplate_821645C
	adds r0, r6, 0
	movs r1, 0x8C
	movs r2, 0x34
	movs r3, 0
	bl CreateSprite
	ldr r7, _08052374 @ =gUnknown_03004854
	ldr r1, [r7]
	adds r1, 0x50
	strb r0, [r1]
	ldr r1, _08052378 @ =gSprites
	mov r8, r1
	ldr r2, [r7]
	adds r2, 0x50
	ldrb r1, [r2]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	mov r5, r8
	adds r5, 0x1C
	adds r0, r5
	ldr r4, _0805237C @ =SpriteCallbackDummy
	str r4, [r0]
	ldrb r1, [r2]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	add r0, r8
	movs r1, 0x3
	bl StartSpriteAnim
	adds r0, r6, 0
	movs r1, 0xA4
	movs r2, 0x34
	movs r3, 0
	bl CreateSprite
	ldr r1, [r7]
	adds r1, 0x51
	strb r0, [r1]
	ldr r0, [r7]
	adds r0, 0x51
	ldrb r1, [r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r5
	str r4, [r0]
	adds r0, r6, 0
	movs r1, 0xBC
	movs r2, 0x34
	movs r3, 0
	bl CreateSprite
	ldr r1, [r7]
	adds r1, 0x52
	strb r0, [r1]
	ldr r2, [r7]
	adds r2, 0x52
	ldrb r1, [r2]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r5
	str r4, [r0]
	ldrb r1, [r2]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	add r0, r8
	movs r1, 0x1
	bl StartSpriteAnim
	bl sub_8052124
	movs r2, 0
	mov r8, r2
	b _0805243C
	.align 2, 0
_0805236C: .4byte gOtherText_Ranking
_08052370: .4byte gSpriteTemplate_821645C
_08052374: .4byte gUnknown_03004854
_08052378: .4byte gSprites
_0805237C: .4byte SpriteCallbackDummy
_08052380:
	ldr r1, [r7]
	movs r2, 0xB2
	lsls r2, 1
	adds r0, r1, r2
	add r0, r8
	ldrb r5, [r0]
	adds r2, r1, 0
	adds r2, 0xAB
	movs r0, 0xFC
	strb r0, [r2]
	movs r0, 0x13
	strb r0, [r2, 0x1]
	movs r0, 0x4
	strb r0, [r2, 0x2]
	adds r2, 0x3
	mov r6, r8
	adds r6, 0x1
	adds r0, r2, 0
	adds r1, r6, 0
	bl ConvertIntToDecimalString
	adds r2, r0, 0
	movs r1, 0
	strb r1, [r2]
	movs r0, 0xAD
	strb r0, [r2, 0x1]
	strb r1, [r2, 0x2]
	adds r2, 0x3
	lsls r1, r5, 3
	subs r1, r5
	lsls r1, 2
	ldr r0, _08052458 @ =gLinkPlayers + 0x8
	adds r1, r0
	adds r0, r2, 0
	bl StringCopy
	adds r2, r0, 0
	ldr r0, [r7]
	lsls r4, r5, 1
	adds r4, r5
	lsls r4, 1
	movs r1, 0xA6
	lsls r1, 1
	adds r0, r1
	adds r0, r4
	ldrh r1, [r0]
	adds r0, r2, 0
	movs r2, 0x6C
	movs r3, 0x1
	bl sub_8072C14
	adds r2, r0, 0
	ldr r0, [r7]
	movs r1, 0xA7
	lsls r1, 1
	adds r0, r1
	adds r0, r4
	ldrh r1, [r0]
	adds r0, r2, 0
	movs r2, 0x84
	movs r3, 0x1
	bl sub_8072C14
	adds r2, r0, 0
	ldr r0, [r7]
	movs r1, 0xA8
	lsls r1, 1
	adds r0, r1
	adds r0, r4
	ldrh r1, [r0]
	adds r0, r2, 0
	movs r2, 0x9C
	movs r3, 0x1
	bl sub_8072C14
	ldr r1, [r7]
	adds r0, r1, 0
	adds r0, 0xAB
	ldr r2, _0805245C @ =gUnknown_082165F3
	adds r1, 0x88
	ldrb r1, [r1]
	adds r1, r2
	ldrb r1, [r1]
	mov r2, r8
	muls r2, r1
	adds r2, 0x8
	lsls r2, 24
	lsrs r2, 24
	movs r1, 0x5
	bl MenuPrint
	lsls r6, 16
	lsrs r6, 16
	mov r8, r6
_0805243C:
	ldr r0, [r7]
	adds r0, 0x88
	ldrb r0, [r0]
	cmp r8, r0
	bcc _08052380
	ldr r0, _08052460 @ =gUnknown_03004854
	ldr r1, [r0]
	movs r0, 0x98
	lsls r0, 1
	adds r2, r1, r0
	movs r0, 0
	str r0, [r2]
	b _08052494
	.align 2, 0
_08052458: .4byte gLinkPlayers + 0x8
_0805245C: .4byte gUnknown_082165F3
_08052460: .4byte gUnknown_03004854
_08052464:
	ldr r2, [r2]
	movs r0, 0x98
	lsls r0, 1
	adds r1, r2, r0
	ldr r0, [r1]
	adds r0, 0x1
	str r0, [r1]
	cmp r0, 0x14
	ble _080524AE
	ldrb r0, [r2]
	adds r0, 0x1
	strb r0, [r2]
	b _080524AE
_0805247E:
	ldr r0, _0805249C @ =gMain
	ldrh r1, [r0, 0x2E]
	movs r0, 0x1
	ands r0, r1
	cmp r0, 0
	beq _080524AE
	movs r0, 0x5
	bl PlaySE
	ldr r0, _080524A0 @ =gUnknown_03004854
	ldr r1, [r0]
_08052494:
	ldrb r0, [r1]
	adds r0, 0x1
	strb r0, [r1]
	b _080524AE
	.align 2, 0
_0805249C: .4byte gMain
_080524A0: .4byte gUnknown_03004854
_080524A4:
	ldr r1, [r2]
	movs r0, 0
	strb r0, [r1]
	movs r0, 0x1
	b _080524B0
_080524AE:
	movs r0, 0
_080524B0:
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r1}
	bx r1
	thumb_func_end sub_8052228

	thumb_func_start unref_sub_80524BC
unref_sub_80524BC: @ 80524BC
	push {r4,lr}
	bl ResetSpriteData
	bl FreeAllSpritePalettes
	bl ResetTasks
	ldr r0, _0805251C @ =sub_804E2D8
	bl SetVBlankCallback
	ldr r4, _08052520 @ =gWindowConfig_81E6CE4
	adds r0, r4, 0
	bl SetUpWindowConfig
	adds r0, r4, 0
	bl InitMenuWindow
	ldr r0, _08052524 @ =gMain
	ldrh r0, [r0, 0x20]
	bl SeedRng
	movs r1, 0x80
	lsls r1, 19
	movs r2, 0xAA
	lsls r2, 5
	adds r0, r2, 0
	strh r0, [r1]
	bl RunTasks
	bl AnimateSprites
	bl BuildOamBuffer
	bl UpdatePaletteFade
	ldr r1, _08052528 @ =gUnknown_03000560
	movs r0, 0xFA
	lsls r0, 5
	strh r0, [r1, 0x1A]
	ldrb r0, [r1, 0x10]
	adds r0, 0x1
	strb r0, [r1, 0x10]
	ldr r0, _0805252C @ =sub_8052AF8
	bl SetMainCallback2
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0805251C: .4byte sub_804E2D8
_08052520: .4byte gWindowConfig_81E6CE4
_08052524: .4byte gMain
_08052528: .4byte gUnknown_03000560
_0805252C: .4byte sub_8052AF8
	thumb_func_end unref_sub_80524BC

	thumb_func_start sub_8052530
sub_8052530: @ 8052530
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	sub sp, 0x98
	ldr r1, _080525C8 @ =gOtherText_BPMAndDash
	mov r0, sp
	bl StringCopy
	mov r0, sp
	movs r1, 0x2
	movs r2, 0
	bl MenuPrint
	ldr r4, _080525CC @ =gUnknown_03000560
	movs r1, 0x1A
	ldrsh r0, [r4, r1]
	movs r1, 0x64
	bl __divsi3
	adds r1, r0, 0
	lsls r1, 16
	asrs r1, 16
	mov r0, sp
	movs r2, 0x2
	movs r3, 0x3
	bl ConvertIntToDecimalStringN
	mov r0, sp
	movs r1, 0x6
	movs r2, 0
	bl MenuPrint
	movs r6, 0
	mov r2, sp
	adds r2, 0x3
	str r2, [sp, 0x84]
	mov r3, sp
	adds r3, 0x6
	str r3, [sp, 0x88]
	mov r0, sp
	adds r0, 0x9
	str r0, [sp, 0x8C]
	mov r1, sp
	adds r1, 0xC
	str r1, [sp, 0x90]
	adds r2, 0xC
	str r2, [sp, 0x94]
	mov r8, r4
	mov r7, sp
	ldr r3, _080525D0 @ =gBerries
	mov r9, r3
	ldr r0, _080525D4 @ =gUnknown_082165F8
	mov r10, r0
_0805259E:
	mov r1, r8
	movs r0, 0
	ldrsb r0, [r1, r0]
	cmp r0, r6
	bne _080525D8
	movs r0, 0xEF
	strb r0, [r7]
	mov r0, r8
	adds r0, 0x1
	adds r0, r6, r0
	ldrb r0, [r0]
	lsls r0, 24
	asrs r0, 24
	adds r0, 0x85
	lsls r0, 16
	lsrs r0, 16
	mov r1, sp
	adds r1, 0x1
	bl CopyItemName
	b _080525F8
	.align 2, 0
_080525C8: .4byte gOtherText_BPMAndDash
_080525CC: .4byte gUnknown_03000560
_080525D0: .4byte gBerries
_080525D4: .4byte gUnknown_082165F8
_080525D8:
	mov r0, r8
	adds r0, 0x1
	adds r0, r6, r0
	ldrb r0, [r0]
	lsls r0, 24
	asrs r0, 24
	adds r0, 0x85
	lsls r0, 16
	lsrs r0, 16
	mov r1, sp
	bl CopyItemName
	movs r0, 0
	strb r0, [r7, 0x6]
	movs r0, 0xFF
	strb r0, [r7, 0x7]
_080525F8:
	lsls r5, r6, 1
	adds r5, r6
	adds r5, 0x3
	lsls r5, 24
	lsrs r5, 24
	mov r0, sp
	movs r1, 0x2
	adds r2, r5, 0
	bl MenuPrint
	mov r4, r8
	adds r4, 0x1
	adds r4, r6, r4
	movs r1, 0
	ldrsb r1, [r4, r1]
	lsls r0, r1, 3
	subs r0, r1
	lsls r0, 2
	add r0, r9
	ldrb r1, [r0, 0x15]
	mov r0, sp
	movs r2, 0x2
	movs r3, 0x2
	bl ConvertIntToDecimalStringN
	mov r0, sp
	mov r1, r10
	bl StringAppend
	movs r1, 0
	ldrsb r1, [r4, r1]
	lsls r0, r1, 3
	subs r0, r1
	lsls r0, 2
	add r0, r9
	ldrb r1, [r0, 0x16]
	ldr r0, [sp, 0x84]
	movs r2, 0x2
	movs r3, 0x2
	bl ConvertIntToDecimalStringN
	mov r0, sp
	mov r1, r10
	bl StringAppend
	movs r1, 0
	ldrsb r1, [r4, r1]
	lsls r0, r1, 3
	subs r0, r1
	lsls r0, 2
	add r0, r9
	ldrb r1, [r0, 0x17]
	ldr r0, [sp, 0x88]
	movs r2, 0x2
	movs r3, 0x2
	bl ConvertIntToDecimalStringN
	mov r0, sp
	mov r1, r10
	bl StringAppend
	movs r1, 0
	ldrsb r1, [r4, r1]
	lsls r0, r1, 3
	subs r0, r1
	lsls r0, 2
	add r0, r9
	ldrb r1, [r0, 0x18]
	ldr r0, [sp, 0x8C]
	movs r2, 0x2
	movs r3, 0x2
	bl ConvertIntToDecimalStringN
	mov r0, sp
	mov r1, r10
	bl StringAppend
	movs r1, 0
	ldrsb r1, [r4, r1]
	lsls r0, r1, 3
	subs r0, r1
	lsls r0, 2
	add r0, r9
	ldrb r1, [r0, 0x19]
	ldr r0, [sp, 0x90]
	movs r2, 0x2
	movs r3, 0x2
	bl ConvertIntToDecimalStringN
	mov r0, sp
	mov r1, r10
	bl StringAppend
	movs r1, 0
	ldrsb r1, [r4, r1]
	lsls r0, r1, 3
	subs r0, r1
	lsls r0, 2
	add r0, r9
	ldrb r1, [r0, 0x1A]
	ldr r0, [sp, 0x94]
	movs r2, 0x2
	movs r3, 0x2
	bl ConvertIntToDecimalStringN
	movs r2, 0x1
	negs r2, r2
	add r3, sp, 0x80
	strb r2, [r3]
	movs r0, 0xFF
	strb r0, [r7, 0x11]
	mov r0, sp
	movs r1, 0x7
	adds r2, r5, 0
	bl MenuPrint
	adds r0, r6, 0x1
	lsls r0, 24
	lsrs r6, r0, 24
	cmp r6, 0x3
	bhi _080526EC
	b _0805259E
_080526EC:
	mov r1, r8
	ldrb r0, [r1, 0x8]
	cmp r0, 0
	beq _080527A4
	ldr r1, _080527B4 @ =gUnknown_083F7EB8
	mov r2, r8
	ldrb r0, [r2, 0x8]
	lsls r0, 2
	adds r0, r1
	ldr r1, [r0]
	mov r0, sp
	bl StringCopy
	mov r0, sp
	movs r1, 0x2
	movs r2, 0xF
	bl MenuPrint
	mov r3, r8
	ldrb r1, [r3, 0x11]
	mov r0, sp
	movs r2, 0x2
	movs r3, 0x2
	bl ConvertIntToHexStringN
	ldr r4, _080527B8 @ =gUnknown_082165F8
	mov r0, sp
	adds r1, r4, 0
	bl StringAppend
	mov r0, r8
	ldrb r1, [r0, 0x12]
	ldr r0, [sp, 0x84]
	movs r2, 0x2
	movs r3, 0x2
	bl ConvertIntToHexStringN
	mov r0, sp
	adds r1, r4, 0
	bl StringAppend
	mov r2, r8
	ldrb r1, [r2, 0x13]
	ldr r0, [sp, 0x88]
	movs r2, 0x2
	movs r3, 0x2
	bl ConvertIntToHexStringN
	mov r0, sp
	adds r1, r4, 0
	bl StringAppend
	mov r3, r8
	ldrb r1, [r3, 0x14]
	ldr r0, [sp, 0x8C]
	movs r2, 0x2
	movs r3, 0x2
	bl ConvertIntToHexStringN
	mov r0, sp
	adds r1, r4, 0
	bl StringAppend
	mov r0, r8
	ldrb r1, [r0, 0x15]
	ldr r0, [sp, 0x90]
	movs r2, 0x2
	movs r3, 0x2
	bl ConvertIntToHexStringN
	mov r0, sp
	adds r1, r4, 0
	bl StringAppend
	mov r2, r8
	ldrb r1, [r2, 0x16]
	ldr r0, [sp, 0x94]
	movs r2, 0x2
	movs r3, 0x2
	bl ConvertIntToHexStringN
	mov r1, sp
	ldrb r0, [r1, 0x11]
	add r3, sp, 0x80
	ldrb r3, [r3]
	orrs r0, r3
	strb r0, [r1, 0x11]
	mov r0, sp
	movs r1, 0x7
	movs r2, 0x11
	bl MenuPrint
_080527A4:
	add sp, 0x98
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080527B4: .4byte gUnknown_083F7EB8
_080527B8: .4byte gUnknown_082165F8
	thumb_func_end sub_8052530

	thumb_func_start sub_80527BC
sub_80527BC: @ 80527BC
	push {r4-r7,lr}
	mov r7, r9
	mov r6, r8
	push {r6,r7}
	sub sp, 0x58
	ldr r0, _08052844 @ =gUnknown_020297DC
	ldrb r0, [r0]
	add r6, sp, 0x48
	cmp r0, 0x1
	bne _08052814
	movs r1, 0
	ldr r3, _08052848 @ =gUnknown_03004840
	movs r2, 0
_080527D6:
	lsls r0, r1, 1
	adds r0, r3
	strh r2, [r0]
	adds r0, r1, 0x1
	lsls r0, 16
	lsrs r1, r0, 16
	cmp r1, 0x9
	bls _080527D6
	bl Random
	ldr r1, _0805284C @ =gUnknown_03004830
	strh r0, [r1]
	ldr r1, _08052850 @ =gUnknown_020297E0
	movs r0, 0
	str r0, [r1]
	ldr r1, _08052844 @ =gUnknown_020297DC
	movs r0, 0x2
	strb r0, [r1]
	movs r4, 0
	ldr r2, _08052854 @ =0x02000000
	movs r1, 0
_08052800:
	adds r0, r4, r2
	strb r1, [r0]
	adds r0, r4, 0x1
	lsls r0, 16
	lsrs r4, r0, 16
	cmp r4, 0xC7
	bls _08052800
	ldr r1, _08052858 @ =gUnknown_020297E8
	movs r0, 0
	strb r0, [r1]
_08052814:
	movs r4, 0
	movs r0, 0x1
	mov r8, r0
	ldr r7, _08052858 @ =gUnknown_020297E8
	ldr r5, _08052850 @ =gUnknown_020297E0
	ldr r1, _08052854 @ =0x02000000
	mov r9, r1
	ldr r3, _0805285C @ =gUnknown_020297E4
_08052824:
	str r3, [sp, 0x54]
	bl Random
	lsls r0, 16
	lsrs r0, 31
	mov r1, r8
	ands r0, r1
	ldr r3, [sp, 0x54]
	ldrb r1, [r7]
	cmp r0, r1
	bne _08052860
	ldr r0, [r5]
	adds r0, 0x1
	str r0, [r5]
	b _0805287A
	.align 2, 0
_08052844: .4byte gUnknown_020297DC
_08052848: .4byte gUnknown_03004840
_0805284C: .4byte gUnknown_03004830
_08052850: .4byte gUnknown_020297E0
_08052854: .4byte 0x02000000
_08052858: .4byte gUnknown_020297E8
_0805285C: .4byte gUnknown_020297E4
_08052860:
	ldr r2, [r3]
	lsls r0, r2, 1
	add r0, r9
	ldr r1, [r5]
	strh r1, [r0]
	adds r2, 0x1
	str r2, [r3]
	movs r0, 0
	str r0, [r5]
	ldrb r0, [r7]
	mov r1, r8
	eors r0, r1
	strb r0, [r7]
_0805287A:
	adds r0, r4, 0x1
	lsls r0, 16
	lsrs r4, r0, 16
	cmp r4, 0x63
	bls _08052824
	mov r1, sp
	movs r0, 0xFF
	strb r0, [r1]
	ldr r0, _08052900 @ =gUnknown_03004830
	ldrh r1, [r0]
	adds r0, r6, 0
	movs r2, 0x2
	movs r3, 0x8
	bl ConvertIntToHexStringN
	mov r0, sp
	adds r1, r6, 0
	bl StringAppend
	ldr r1, _08052904 @ =gUnknown_082165F8
	mov r0, sp
	bl StringAppend
	ldr r0, _08052908 @ =gUnknown_020297E0
	ldr r1, [r0]
	adds r0, r6, 0
	movs r2, 0x2
	movs r3, 0x8
	bl ConvertIntToHexStringN
	mov r0, sp
	adds r1, r6, 0
	bl StringAppend
	ldr r1, _0805290C @ =gUnknown_08216600
	mov r0, sp
	bl StringAppend
	ldr r4, _08052910 @ =gUnknown_020297DC
	ldrb r0, [r4]
	cmp r0, 0x3
	bne _080528E8
	ldr r0, _08052914 @ =gUnknown_020297E4
	ldr r1, [r0]
	adds r0, r6, 0
	movs r2, 0x2
	movs r3, 0x10
	bl ConvertIntToHexStringN
	mov r0, sp
	adds r1, r6, 0
	bl StringAppend
	movs r0, 0
	strb r0, [r4]
_080528E8:
	mov r0, sp
	movs r1, 0x2
	movs r2, 0xF
	bl MenuPrint
	add sp, 0x58
	pop {r3,r4}
	mov r8, r3
	mov r9, r4
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_08052900: .4byte gUnknown_03004830
_08052904: .4byte gUnknown_082165F8
_08052908: .4byte gUnknown_020297E0
_0805290C: .4byte gUnknown_08216600
_08052910: .4byte gUnknown_020297DC
_08052914: .4byte gUnknown_020297E4
	thumb_func_end sub_80527BC

	thumb_func_start sub_8052918
sub_8052918: @ 8052918
	push {r4-r6,lr}
	sub sp, 0x4C
	ldr r2, _08052A88 @ =gMain
	ldrh r1, [r2, 0x2E]
	movs r0, 0x80
	lsls r0, 1
	ands r0, r1
	ldr r4, _08052A8C @ =gUnknown_03000560
	cmp r0, 0
	beq _0805294C
	movs r1, 0xFA
	lsls r1, 2
	adds r0, r1, 0
	ldrh r1, [r4, 0x1A]
	adds r0, r1
	strh r0, [r4, 0x1A]
	lsls r0, 16
	ldr r1, _08052A90 @ =0x75300000
	cmp r0, r1
	ble _08052946
	movs r0, 0xFA
	lsls r0, 2
	strh r0, [r4, 0x1A]
_08052946:
	ldrb r0, [r4, 0x10]
	adds r0, 0x1
	strb r0, [r4, 0x10]
_0805294C:
	ldrh r1, [r2, 0x2E]
	movs r0, 0x80
	lsls r0, 2
	ands r0, r1
	cmp r0, 0
	beq _08052972
	ldr r1, _08052A94 @ =0xfffffc18
	adds r0, r1, 0
	ldrh r1, [r4, 0x1A]
	adds r0, r1
	strh r0, [r4, 0x1A]
	lsls r0, 16
	cmp r0, 0
	bge _0805296C
	ldr r0, _08052A98 @ =0x00007530
	strh r0, [r4, 0x1A]
_0805296C:
	ldrb r0, [r4, 0x10]
	adds r0, 0x1
	strb r0, [r4, 0x10]
_08052972:
	ldrh r1, [r2, 0x2E]
	movs r0, 0x40
	ands r0, r1
	cmp r0, 0
	beq _08052992
	ldrb r0, [r4]
	subs r0, 0x1
	strb r0, [r4]
	lsls r0, 24
	cmp r0, 0
	bge _0805298C
	movs r0, 0x3
	strb r0, [r4]
_0805298C:
	ldrb r0, [r4, 0x10]
	adds r0, 0x1
	strb r0, [r4, 0x10]
_08052992:
	ldrh r1, [r2, 0x2E]
	movs r0, 0x80
	ands r0, r1
	cmp r0, 0
	beq _080529B4
	ldrb r0, [r4]
	adds r0, 0x1
	strb r0, [r4]
	lsls r0, 24
	asrs r0, 24
	cmp r0, 0x3
	ble _080529AE
	movs r0, 0
	strb r0, [r4]
_080529AE:
	ldrb r0, [r4, 0x10]
	adds r0, 0x1
	strb r0, [r4, 0x10]
_080529B4:
	ldrh r1, [r2, 0x2E]
	movs r0, 0x20
	ands r0, r1
	cmp r0, 0
	beq _080529E4
	adds r3, r4, 0
	movs r1, 0
	ldrsb r1, [r3, r1]
	adds r5, r3, 0x1
	adds r1, r5
	ldrb r0, [r1]
	subs r0, 0x1
	strb r0, [r1]
	lsls r0, 24
	cmp r0, 0
	bge _080529DE
	movs r0, 0
	ldrsb r0, [r3, r0]
	adds r0, r5
	movs r1, 0x2A
	strb r1, [r0]
_080529DE:
	ldrb r0, [r4, 0x10]
	adds r0, 0x1
	strb r0, [r4, 0x10]
_080529E4:
	ldrh r1, [r2, 0x2E]
	movs r0, 0x10
	ands r0, r1
	cmp r0, 0
	beq _08052A16
	ldr r3, _08052A8C @ =gUnknown_03000560
	movs r1, 0
	ldrsb r1, [r3, r1]
	adds r4, r3, 0x1
	adds r1, r4
	ldrb r0, [r1]
	adds r0, 0x1
	strb r0, [r1]
	lsls r0, 24
	asrs r0, 24
	cmp r0, 0x2A
	ble _08052A10
	movs r0, 0
	ldrsb r0, [r3, r0]
	adds r0, r4
	movs r1, 0
	strb r1, [r0]
_08052A10:
	ldrb r0, [r3, 0x10]
	adds r0, 0x1
	strb r0, [r3, 0x10]
_08052A16:
	ldrh r1, [r2, 0x2E]
	movs r0, 0x1
	ands r0, r1
	cmp r0, 0
	beq _08052AA0
	movs r6, 0
	movs r4, 0
	ldr r5, _08052A8C @ =gUnknown_03000560
_08052A26:
	adds r0, r5, 0x1
	adds r2, r4, r0
	movs r0, 0
	ldrsb r0, [r2, r0]
	cmp r0, 0x2A
	beq _08052A64
	adds r0, r6, 0x1
	lsls r0, 16
	lsrs r6, r0, 16
	lsls r0, r4, 1
	mov r1, sp
	adds r1, r0
	adds r1, 0x4
	movs r0, 0
	ldrsb r0, [r2, r0]
	strh r0, [r1]
	add r0, sp, 0xC
	lsls r1, r4, 4
	adds r0, r1
	movs r1, 0
	ldrsb r1, [r2, r1]
	adds r1, 0x85
	lsls r1, 16
	lsrs r1, 16
	bl sub_804E844
	adds r0, r4, 0x1
	lsls r0, 16
	lsrs r4, r0, 16
	cmp r4, 0x3
	bls _08052A26
_08052A64:
	cmp r6, 0x1
	bls _08052A9C
	add r0, sp, 0xC
	adds r1, r5, 0
	adds r1, 0x8
	lsls r2, r6, 24
	lsrs r2, 24
	adds r3, r5, 0
	adds r3, 0x11
	ldrh r4, [r5, 0x1A]
	str r4, [sp]
	bl sub_8050744
	ldrb r0, [r5, 0x10]
	adds r0, 0x1
	strb r0, [r5, 0x10]
	b _08052AA0
	.align 2, 0
_08052A88: .4byte gMain
_08052A8C: .4byte gUnknown_03000560
_08052A90: .4byte 0x75300000
_08052A94: .4byte 0xfffffc18
_08052A98: .4byte 0x00007530
_08052A9C:
	movs r0, 0xFF
	strb r0, [r5, 0x8]
_08052AA0:
	ldr r4, _08052AE8 @ =gUnknown_03000560
	ldrb r0, [r4, 0x10]
	cmp r0, 0
	beq _08052AB0
	bl sub_8052530
	movs r0, 0
	strb r0, [r4, 0x10]
_08052AB0:
	ldr r3, _08052AEC @ =gMain
	ldrh r1, [r3, 0x2E]
	movs r0, 0x4
	ands r0, r1
	cmp r0, 0
	beq _08052AD4
	ldr r2, _08052AF0 @ =gUnknown_020297DC
	ldrb r0, [r2]
	adds r1, r0, 0
	cmp r1, 0
	bne _08052ADC
	adds r0, 0x1
	strb r0, [r2]
	ldr r0, _08052AF4 @ =gUnknown_020297E0
	str r1, [r0]
	ldrh r0, [r3, 0x20]
	bl SeedRng
_08052AD4:
	ldr r0, _08052AF0 @ =gUnknown_020297DC
	ldrb r0, [r0]
	cmp r0, 0
	beq _08052AE0
_08052ADC:
	bl sub_80527BC
_08052AE0:
	add sp, 0x4C
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_08052AE8: .4byte gUnknown_03000560
_08052AEC: .4byte gMain
_08052AF0: .4byte gUnknown_020297DC
_08052AF4: .4byte gUnknown_020297E0
	thumb_func_end sub_8052918

	thumb_func_start sub_8052AF8
sub_8052AF8: @ 8052AF8
	push {lr}
	bl sub_8052918
	bl RunTasks
	bl AnimateSprites
	bl BuildOamBuffer
	bl UpdatePaletteFade
	pop {r0}
	bx r0
	thumb_func_end sub_8052AF8

	thumb_func_start ShowBerryBlenderRecordWindow
ShowBerryBlenderRecordWindow: @ 8052B14
	push {r4-r7,lr}
	mov r7, r9
	mov r6, r8
	push {r6,r7}
	sub sp, 0x20
	movs r0, 0x6
	movs r1, 0x3
	movs r2, 0x17
	movs r3, 0x10
	bl MenuDrawTextWindow
	ldr r0, _08052BBC @ =gMultiText_BerryBlenderMaxSpeedRecord
	movs r1, 0x8
	movs r2, 0x4
	bl MenuPrint
	ldr r0, _08052BC0 @ =gMultiText_2P3P4P
	movs r1, 0x8
	movs r2, 0x9
	bl MenuPrint
	movs r0, 0
	mov r8, r0
	ldr r0, _08052BC4 @ =gSaveBlock1
	movs r7, 0x90
	lsls r7, 20
	ldr r1, _08052BC8 @ =0x0000096c
	adds r6, r0, r1
	movs r0, 0
	mov r9, r0
_08052B50:
	ldrh r4, [r6]
	adds r0, r4, 0
	movs r1, 0x64
	bl __udivsi3
	adds r1, r0, 0
	mov r0, sp
	movs r2, 0x12
	movs r3, 0x1
	bl sub_8072C14
	adds r5, r0, 0
	mov r1, r9
	strb r1, [r5]
	movs r0, 0xAD
	strb r0, [r5, 0x1]
	strb r1, [r5, 0x2]
	adds r5, 0x3
	adds r0, r4, 0
	movs r1, 0x64
	bl __umodsi3
	adds r1, r0, 0
	adds r0, r5, 0
	movs r2, 0x2
	movs r3, 0x2
	bl ConvertIntToDecimalStringN
	adds r5, r0, 0
	ldr r1, _08052BCC @ =gOtherText_RPM
	bl StringAppend
	lsrs r2, r7, 24
	mov r0, sp
	movs r1, 0xF
	bl MenuPrint
	movs r0, 0x80
	lsls r0, 18
	adds r7, r0
	adds r6, 0x2
	movs r1, 0x1
	add r8, r1
	mov r0, r8
	cmp r0, 0x2
	ble _08052B50
	add sp, 0x20
	pop {r3,r4}
	mov r8, r3
	mov r9, r4
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_08052BBC: .4byte gMultiText_BerryBlenderMaxSpeedRecord
_08052BC0: .4byte gMultiText_2P3P4P
_08052BC4: .4byte gSaveBlock1
_08052BC8: .4byte 0x0000096c
_08052BCC: .4byte gOtherText_RPM
	thumb_func_end ShowBerryBlenderRecordWindow

	thumb_func_start sub_8052BD0
sub_8052BD0: @ 8052BD0
	push {r4,r5,lr}
	lsls r0, 24
	lsrs r0, 24
	adds r5, r0, 0
	ldr r1, _08052C1C @ =gTasks
	lsls r0, r5, 2
	adds r0, r5
	lsls r0, 3
	adds r4, r0, r1
	movs r1, 0x8
	ldrsh r0, [r4, r1]
	cmp r0, 0
	bne _08052BF6
	ldr r0, _08052C20 @ =0x0000016f
	bl PlayFanfare
	ldrh r0, [r4, 0x8]
	adds r0, 0x1
	strh r0, [r4, 0x8]
_08052BF6:
	bl IsFanfareTaskInactive
	lsls r0, 24
	cmp r0, 0
	beq _08052C16
	ldr r0, _08052C24 @ =gUnknown_03004854
	ldr r0, [r0]
	movs r1, 0xBC
	lsls r1, 1
	adds r0, r1
	ldrh r0, [r0]
	bl PlayBGM
	adds r0, r5, 0
	bl DestroyTask
_08052C16:
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_08052C1C: .4byte gTasks
_08052C20: .4byte 0x0000016f
_08052C24: .4byte gUnknown_03004854
	thumb_func_end sub_8052BD0
