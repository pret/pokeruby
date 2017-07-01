	.include "constants/gba_constants.inc"
	.include "constants/species_constants.inc"
	.include "asm/macros.inc"

	.syntax unified

	.text

	thumb_func_start sub_80A3118
sub_80A3118: @ 80A3118
	push {lr}
	bl AnimateSprites
	bl BuildOamBuffer
	bl RunTasks
	bl sub_80A740C
	bl UpdatePaletteFade
	pop {r0}
	bx r0
	thumb_func_end sub_80A3118

	thumb_func_start sub_80A3134
sub_80A3134: @ 80A3134
	push {lr}
	bl LoadOam
	bl ProcessSpriteCopyRequests
	bl TransferPlttBuffer
	ldr r1, _080A3168 @ =gBGTilemapBuffers + 0x800
	ldr r2, _080A316C @ =0x06002000
	ldr r0, _080A3170 @ =0x040000d4
	str r1, [r0]
	str r2, [r0, 0x4]
	ldr r3, _080A3174 @ =0x80000400
	str r3, [r0, 0x8]
	ldr r2, [r0, 0x8]
	movs r2, 0x80
	lsls r2, 4
	adds r1, r2
	ldr r2, _080A3178 @ =0x06006000
	str r1, [r0]
	str r2, [r0, 0x4]
	str r3, [r0, 0x8]
	ldr r0, [r0, 0x8]
	pop {r0}
	bx r0
	.align 2, 0
_080A3168: .4byte gBGTilemapBuffers + 0x800
_080A316C: .4byte 0x06002000
_080A3170: .4byte 0x040000d4
_080A3174: .4byte 0x80000400
_080A3178: .4byte 0x06006000
	thumb_func_end sub_80A3134

	thumb_func_start sub_80A317C
sub_80A317C: @ 80A317C
	push {r4,r5,lr}
	sub sp, 0x4
	ldr r0, _080A3198 @ =gMain
	ldr r1, _080A319C @ =0x0000043c
	adds r0, r1
	ldrb r0, [r0]
	cmp r0, 0x10
	bls _080A318E
	b _080A34A8
_080A318E:
	lsls r0, 2
	ldr r1, _080A31A0 @ =_080A31A4
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_080A3198: .4byte gMain
_080A319C: .4byte 0x0000043c
_080A31A0: .4byte _080A31A4
	.align 2, 0
_080A31A4:
	.4byte _080A31E8
	.4byte _080A31F2
	.4byte _080A3208
	.4byte _080A320E
	.4byte _080A3228
	.4byte _080A324C
	.4byte _080A3252
	.4byte _080A3270
	.4byte _080A327C
	.4byte _080A3298
	.4byte _080A32A4
	.4byte _080A3328
	.4byte _080A338C
	.4byte _080A33F4
	.4byte _080A3404
	.4byte _080A345C
	.4byte _080A347C
_080A31E8:
	bl sub_80F9438
	bl sub_80A34E8
	b _080A3464
_080A31F2:
	bl remove_some_task
	ldr r1, _080A3200 @ =gMain
	ldr r0, _080A3204 @ =0x0000043c
	adds r1, r0
	b _080A346A
	.align 2, 0
_080A3200: .4byte gMain
_080A3204: .4byte 0x0000043c
_080A3208:
	bl gpu_pal_allocator_reset__manage_upper_four
	b _080A3464
_080A320E:
	bl sub_80F9020
	ldr r0, _080A3220 @ =0x02000000
	ldr r1, _080A3224 @ =0x0001ffff
	adds r0, r1
	movs r1, 0
	strb r1, [r0]
	b _080A3464
	.align 2, 0
_080A3220: .4byte 0x02000000
_080A3224: .4byte 0x0001ffff
_080A3228:
	bl ResetPaletteFade
	ldr r2, _080A3240 @ =gPaletteFade
	ldrb r0, [r2, 0x8]
	movs r1, 0x80
	orrs r0, r1
	strb r0, [r2, 0x8]
	ldr r1, _080A3244 @ =gMain
	ldr r0, _080A3248 @ =0x0000043c
	adds r1, r0
	b _080A346A
	.align 2, 0
_080A3240: .4byte gPaletteFade
_080A3244: .4byte gMain
_080A3248: .4byte 0x0000043c
_080A324C:
	bl ResetSpriteData
	b _080A3464
_080A3252:
	bl sub_80A3520
	lsls r0, 24
	cmp r0, 0
	bne _080A325E
	b _080A34A8
_080A325E:
	ldr r1, _080A3268 @ =gMain
	ldr r0, _080A326C @ =0x0000043c
	adds r1, r0
	b _080A346A
	.align 2, 0
_080A3268: .4byte gMain
_080A326C: .4byte 0x0000043c
_080A3270:
	ldr r0, _080A3278 @ =gWindowConfig_81E6DFC
	bl SetUpWindowConfig
	b _080A3464
	.align 2, 0
_080A3278: .4byte gWindowConfig_81E6DFC
_080A327C:
	ldr r0, _080A328C @ =gWindowConfig_81E6DFC
	bl MultistepInitMenuWindowBegin
	ldr r1, _080A3290 @ =gMain
	ldr r0, _080A3294 @ =0x0000043c
	adds r1, r0
	b _080A346A
	.align 2, 0
_080A328C: .4byte gWindowConfig_81E6DFC
_080A3290: .4byte gMain
_080A3294: .4byte 0x0000043c
_080A3298:
	bl MultistepInitMenuWindowContinue
	cmp r0, 0
	bne _080A32A2
	b _080A34A8
_080A32A2:
	b _080A3464
_080A32A4:
	bl sub_80F944C
	bl LoadScrollIndicatorPalette
	movs r0, 0
	movs r1, 0xAC
	movs r2, 0xC
	bl CreateVerticalScrollIndicators
	movs r0, 0x1
	movs r1, 0xAC
	movs r2, 0x94
	bl CreateVerticalScrollIndicators
	movs r0, 0x2
	movs r1, 0x1C
	movs r2, 0x58
	bl CreateVerticalScrollIndicators
	movs r0, 0x3
	movs r1, 0x64
	movs r2, 0x58
	bl CreateVerticalScrollIndicators
	movs r0, 0
	movs r1, 0x2
	bl sub_80F9988
	movs r0, 0x1
	movs r1, 0x2
	bl sub_80F9988
	movs r0, 0x2
	movs r1, 0x2
	bl sub_80F9988
	movs r0, 0x3
	movs r1, 0x2
	bl sub_80F9988
	ldr r0, _080A331C @ =gUnknown_03000701
	ldrb r0, [r0]
	subs r0, 0x4
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bhi _080A3312
	movs r0, 0x2
	movs r1, 0x1
	bl sub_80F979C
	movs r0, 0x3
	movs r1, 0x1
	bl sub_80F979C
_080A3312:
	ldr r1, _080A3320 @ =gMain
	ldr r0, _080A3324 @ =0x0000043c
	adds r1, r0
	b _080A346A
	.align 2, 0
_080A331C: .4byte gUnknown_03000701
_080A3320: .4byte gMain
_080A3324: .4byte 0x0000043c
_080A3328:
	ldr r1, _080A3378 @ =gUnknown_0203855A
	movs r0, 0x10
	strb r0, [r1]
	ldr r4, _080A337C @ =gBGTilemapBuffers + 0x1000
	ldr r5, _080A3380 @ =gUnknown_02038559
	ldrb r1, [r5]
	adds r1, 0x1
	lsls r1, 24
	lsrs r1, 24
	adds r0, r4, 0
	bl sub_80A39B8
	ldrb r1, [r5]
	adds r0, r4, 0
	bl sub_80A3AC0
	bl sub_80A3D08
	ldr r4, _080A3384 @ =gBagPockets
	ldr r0, [r4, 0x10]
	ldr r1, [r4, 0x14]
	bl sub_80A3C34
	ldr r0, [r4, 0x18]
	ldr r1, [r4, 0x1C]
	bl sub_80A3C34
	bl sub_80A3D40
	ldr r1, _080A3388 @ =gUnknown_03005D24
	movs r0, 0
	ldrsb r0, [r5, r0]
	lsls r0, 3
	adds r0, r4
	ldr r0, [r0]
	str r0, [r1]
	bl sub_80A362C
	b _080A3464
	.align 2, 0
_080A3378: .4byte gUnknown_0203855A
_080A337C: .4byte gBGTilemapBuffers + 0x1000
_080A3380: .4byte gUnknown_02038559
_080A3384: .4byte gBagPockets
_080A3388: .4byte gUnknown_03005D24
_080A338C:
	ldr r0, _080A33D4 @ =0x0000ffff
	movs r1, 0
	movs r2, 0x7
	bl sub_80A48E8
	ldr r1, _080A33D8 @ =gUnknown_03005D10
	ldr r4, _080A33DC @ =gUnknown_02038559
	movs r0, 0
	ldrsb r0, [r4, r0]
	lsls r0, 2
	adds r0, r1
	ldrb r1, [r0, 0x1]
	ldrb r0, [r0]
	adds r1, r0
	ldr r0, _080A33E0 @ =gUnknown_03005D24
	ldr r0, [r0]
	lsls r1, 2
	adds r1, r0
	movs r2, 0
	ldrsh r0, [r1, r2]
	bl ItemListMenu_InitDescription
	bl ItemListMenu_InitMenu
	ldr r1, _080A33E4 @ =gUnknown_0203855B
	ldrb r0, [r4]
	adds r0, 0x1
	strb r0, [r1]
	ldr r1, _080A33E8 @ =gUnknown_0203855C
	movs r0, 0
	strb r0, [r1]
	ldr r1, _080A33EC @ =gMain
	ldr r0, _080A33F0 @ =0x0000043c
	adds r1, r0
	b _080A346A
	.align 2, 0
_080A33D4: .4byte 0x0000ffff
_080A33D8: .4byte gUnknown_03005D10
_080A33DC: .4byte gUnknown_02038559
_080A33E0: .4byte gUnknown_03005D24
_080A33E4: .4byte gUnknown_0203855B
_080A33E8: .4byte gUnknown_0203855C
_080A33EC: .4byte gMain
_080A33F0: .4byte 0x0000043c
_080A33F4:
	bl CreateBagSprite
	movs r0, 0
	bl CreateBagPokeballSprite
	bl sub_80A3740
	b _080A3464
_080A3404:
	ldr r3, _080A3444 @ =0x04000208
	ldrh r2, [r3]
	movs r0, 0
	strh r0, [r3]
	ldr r4, _080A3448 @ =0x04000200
	ldrh r0, [r4]
	movs r1, 0x1
	orrs r0, r1
	strh r0, [r4]
	strh r2, [r3]
	ldr r2, _080A344C @ =REG_DISPSTAT
	ldrh r0, [r2]
	movs r1, 0x8
	orrs r0, r1
	strh r0, [r2]
	movs r0, 0x1
	negs r0, r0
	movs r1, 0
	str r1, [sp]
	movs r2, 0x10
	movs r3, 0
	bl BeginNormalPaletteFade
	ldr r2, _080A3450 @ =gPaletteFade
	ldrb r1, [r2, 0x8]
	movs r0, 0x7F
	ands r0, r1
	strb r0, [r2, 0x8]
	ldr r1, _080A3454 @ =gMain
	ldr r0, _080A3458 @ =0x0000043c
	adds r1, r0
	b _080A346A
	.align 2, 0
_080A3444: .4byte 0x04000208
_080A3448: .4byte 0x04000200
_080A344C: .4byte REG_DISPSTAT
_080A3450: .4byte gPaletteFade
_080A3454: .4byte gMain
_080A3458: .4byte 0x0000043c
_080A345C:
	bl sub_8055870
	cmp r0, 0x1
	beq _080A34A8
_080A3464:
	ldr r1, _080A3474 @ =gMain
	ldr r2, _080A3478 @ =0x0000043c
	adds r1, r2
_080A346A:
	ldrb r0, [r1]
	adds r0, 0x1
	strb r0, [r1]
	b _080A34A8
	.align 2, 0
_080A3474: .4byte gMain
_080A3478: .4byte 0x0000043c
_080A347C:
	ldr r0, _080A34A0 @ =sub_80A3134
	bl SetVBlankCallback
	ldr r0, _080A34A4 @ =sub_80A3118
	bl SetMainCallback2
	bl sub_80A751C
	bl sub_80A7630
	bl sub_80A770C
	bl sub_80A7828
	bl sub_80A78B8
	movs r0, 0x1
	b _080A34AA
	.align 2, 0
_080A34A0: .4byte sub_80A3134
_080A34A4: .4byte sub_80A3118
_080A34A8:
	movs r0, 0
_080A34AA:
	add sp, 0x4
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end sub_80A317C

	thumb_func_start sub_80A34B4
sub_80A34B4: @ 80A34B4
	push {lr}
_080A34B6:
	bl sub_80A317C
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	beq _080A34D2
	bl sub_80F9344
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _080A34B6
	movs r0, 0
	b _080A34DE
_080A34D2:
	ldr r1, _080A34E4 @ =gUnknown_03000700
	movs r0, 0
	strb r0, [r1]
	bl ResetTasks
	movs r0, 0x1
_080A34DE:
	pop {r1}
	bx r1
	.align 2, 0
_080A34E4: .4byte gUnknown_03000700
	thumb_func_end sub_80A34B4

	thumb_func_start sub_80A34E8
sub_80A34E8: @ 80A34E8
	push {lr}
	bl sub_80F9368
	ldr r1, _080A3514 @ =REG_BG2CNT
	ldr r2, _080A3518 @ =0x00000c06
	adds r0, r2, 0
	strh r0, [r1]
	subs r1, 0x2
	ldr r2, _080A351C @ =0x00000405
	adds r0, r2, 0
	strh r0, [r1]
	subs r1, 0xA
	movs r2, 0xBA
	lsls r2, 5
	adds r0, r2, 0
	strh r0, [r1]
	adds r1, 0x50
	movs r0, 0
	strh r0, [r1]
	pop {r0}
	bx r0
	.align 2, 0
_080A3514: .4byte REG_BG2CNT
_080A3518: .4byte 0x00000c06
_080A351C: .4byte 0x00000405
	thumb_func_end sub_80A34E8

	thumb_func_start sub_80A3520
sub_80A3520: @ 80A3520
	push {lr}
	ldr r0, _080A353C @ =0x02000000
	ldr r1, _080A3540 @ =0x0001ffff
	adds r0, r1
	ldrb r0, [r0]
	cmp r0, 0x4
	bls _080A3530
	b _080A3624
_080A3530:
	lsls r0, 2
	ldr r1, _080A3544 @ =_080A3548
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_080A353C: .4byte 0x02000000
_080A3540: .4byte 0x0001ffff
_080A3544: .4byte _080A3548
	.align 2, 0
_080A3548:
	.4byte _080A355C
	.4byte _080A3570
	.4byte _080A3588
	.4byte _080A35C0
	.4byte _080A3604
_080A355C:
	ldr r0, _080A3568 @ =gBagScreen_Gfx
	ldr r1, _080A356C @ =0x06004000
	bl LZDecompressVram
	b _080A35EA
	.align 2, 0
_080A3568: .4byte gBagScreen_Gfx
_080A356C: .4byte 0x06004000
_080A3570:
	ldr r0, _080A3580 @ =gUnknown_08E77004
	ldr r1, _080A3584 @ =gBGTilemapBuffers + 0x1000
	movs r2, 0x80
	lsls r2, 3
	bl CpuSet
	b _080A35EA
	.align 2, 0
_080A3580: .4byte gUnknown_08E77004
_080A3584: .4byte gBGTilemapBuffers + 0x1000
_080A3588:
	ldr r0, _080A35A4 @ =gSaveBlock2
	ldrb r0, [r0, 0x8]
	cmp r0, 0
	beq _080A3598
	ldr r0, _080A35A8 @ =gUnknown_03000701
	ldrb r0, [r0]
	cmp r0, 0x7
	bne _080A35B0
_080A3598:
	ldr r0, _080A35AC @ =gBagScreenMale_Pal
	movs r1, 0
	movs r2, 0x40
	bl LoadCompressedPalette
	b _080A35EA
	.align 2, 0
_080A35A4: .4byte gSaveBlock2
_080A35A8: .4byte gUnknown_03000701
_080A35AC: .4byte gBagScreenMale_Pal
_080A35B0:
	ldr r0, _080A35BC @ =gBagScreenFemale_Pal
	movs r1, 0
	movs r2, 0x40
	bl LoadCompressedPalette
	b _080A35EA
	.align 2, 0
_080A35BC: .4byte gBagScreenFemale_Pal
_080A35C0:
	ldr r0, _080A35D8 @ =gSaveBlock2
	ldrb r0, [r0, 0x8]
	cmp r0, 0
	beq _080A35D0
	ldr r0, _080A35DC @ =gUnknown_03000701
	ldrb r0, [r0]
	cmp r0, 0x7
	bne _080A35E4
_080A35D0:
	ldr r0, _080A35E0 @ =gUnknown_083C1CC8
	bl LoadCompressedObjectPic
	b _080A35EA
	.align 2, 0
_080A35D8: .4byte gSaveBlock2
_080A35DC: .4byte gUnknown_03000701
_080A35E0: .4byte gUnknown_083C1CC8
_080A35E4:
	ldr r0, _080A35F8 @ =gUnknown_083C1CD0
	bl LoadCompressedObjectPic
_080A35EA:
	ldr r1, _080A35FC @ =0x02000000
	ldr r0, _080A3600 @ =0x0001ffff
	adds r1, r0
	ldrb r0, [r1]
	adds r0, 0x1
	strb r0, [r1]
	b _080A3624
	.align 2, 0
_080A35F8: .4byte gUnknown_083C1CD0
_080A35FC: .4byte 0x02000000
_080A3600: .4byte 0x0001ffff
_080A3604:
	ldr r0, _080A3618 @ =gUnknown_083C1CD8
	bl LoadCompressedObjectPalette
	ldr r0, _080A361C @ =0x02000000
	ldr r1, _080A3620 @ =0x0001ffff
	adds r0, r1
	movs r1, 0
	strb r1, [r0]
	movs r0, 0x1
	b _080A3626
	.align 2, 0
_080A3618: .4byte gUnknown_083C1CD8
_080A361C: .4byte 0x02000000
_080A3620: .4byte 0x0001ffff
_080A3624:
	movs r0, 0
_080A3626:
	pop {r1}
	bx r1
	thumb_func_end sub_80A3520

	thumb_func_start sub_80A362C
sub_80A362C: @ 80A362C
	push {r4-r6,lr}
	movs r4, 0
	ldr r6, _080A3648 @ =gUnknown_03000701
	ldr r5, _080A364C @ =gUnknown_03005D10
_080A3634:
	ldrb r0, [r6]
	cmp r0, 0x5
	bne _080A3650
	lsls r1, r4, 2
	adds r0, r1, r5
	ldrb r0, [r0, 0x2]
	subs r0, 0x1
	lsls r0, 24
	lsrs r3, r0, 24
	b _080A3656
	.align 2, 0
_080A3648: .4byte gUnknown_03000701
_080A364C: .4byte gUnknown_03005D10
_080A3650:
	lsls r1, r4, 2
	adds r0, r1, r5
	ldrb r3, [r0, 0x2]
_080A3656:
	adds r1, r5
	ldrb r0, [r1, 0x1]
	cmp r0, 0
	beq _080A366C
	ldrb r2, [r1, 0x3]
	adds r0, r2
	cmp r0, r3
	ble _080A3674
	subs r0, r3, r2
	strb r0, [r1, 0x1]
	b _080A3674
_080A366C:
	ldrb r0, [r1]
	cmp r0, r3
	bls _080A3674
	strb r3, [r1]
_080A3674:
	adds r0, r4, 0x1
	lsls r0, 24
	lsrs r4, r0, 24
	cmp r4, 0x4
	bls _080A3634
	pop {r4-r6}
	pop {r0}
	bx r0
	thumb_func_end sub_80A362C

	thumb_func_start sub_80A3684
sub_80A3684: @ 80A3684
	push {r4,lr}
	movs r2, 0
	ldr r4, _080A36B0 @ =gUnknown_02038559
	ldr r3, _080A36B4 @ =gUnknown_03005D10
	movs r1, 0
_080A368E:
	lsls r0, r2, 2
	adds r0, r3
	strb r1, [r0]
	strb r1, [r0, 0x1]
	strb r1, [r0, 0x2]
	strb r1, [r0, 0x3]
	adds r0, r2, 0x1
	lsls r0, 16
	lsrs r2, r0, 16
	cmp r2, 0x4
	bls _080A368E
	movs r0, 0
	strb r0, [r4]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080A36B0: .4byte gUnknown_02038559
_080A36B4: .4byte gUnknown_03005D10
	thumb_func_end sub_80A3684

	thumb_func_start sub_80A36B8
sub_80A36B8: @ 80A36B8
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	adds r6, r0, 0
	ldr r0, [sp, 0x18]
	lsls r1, 24
	lsrs r1, 24
	mov r8, r1
	lsls r2, 24
	lsls r3, 24
	lsrs r3, 24
	mov r12, r3
	lsls r0, 24
	lsrs r0, 24
	lsrs r2, 24
	adds r0, r2, r0
	cmp r2, r0
	bgt _080A370A
	adds r7, r0, 0
_080A36DE:
	mov r1, r8
	mov r3, r12
	adds r0, r1, r3
	adds r4, r2, 0x1
	cmp r1, r0
	bgt _080A3702
	lsls r3, r2, 5
	movs r5, 0
	adds r2, r0, 0
_080A36F0:
	adds r0, r1, r3
	lsls r0, 1
	adds r0, r6
	strh r5, [r0]
	adds r0, r1, 0x1
	lsls r0, 16
	lsrs r1, r0, 16
	cmp r1, r2
	ble _080A36F0
_080A3702:
	lsls r0, r4, 16
	lsrs r2, r0, 16
	cmp r2, r7
	ble _080A36DE
_080A370A:
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r0}
	bx r0
	thumb_func_end sub_80A36B8

	thumb_func_start ClearBag
ClearBag: @ 80A3714
	push {r4,r5,lr}
	movs r4, 0
	ldr r5, _080A373C @ =gBagPockets
_080A371A:
	lsls r1, r4, 3
	adds r1, r5
	ldr r0, [r1]
	ldrb r1, [r1, 0x4]
	bl ClearItemSlots
	adds r0, r4, 0x1
	lsls r0, 16
	lsrs r4, r0, 16
	cmp r4, 0x4
	bls _080A371A
	bl sub_80A3684
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080A373C: .4byte gBagPockets
	thumb_func_end ClearBag

	thumb_func_start sub_80A3740
sub_80A3740: @ 80A3740
	push {lr}
	sub sp, 0x4
	ldr r1, _080A376C @ =gUnknown_083C1704
	mov r0, sp
	movs r2, 0x4
	bl memcpy
	mov r0, sp
	adds r0, 0x2
	movs r1, 0xD1
	movs r2, 0x2
	bl LoadPalette
	mov r0, sp
	movs r1, 0xD8
	movs r2, 0x2
	bl LoadPalette
	add sp, 0x4
	pop {r0}
	bx r0
	.align 2, 0
_080A376C: .4byte gUnknown_083C1704
	thumb_func_end sub_80A3740

	thumb_func_start sub_80A3770
sub_80A3770: @ 80A3770
	push {lr}
	ldr r0, _080A379C @ =gUnknown_03000701
	ldrb r0, [r0]
	cmp r0, 0
	bne _080A37B6
	ldr r3, _080A37A0 @ =gUnknown_03000704
	ldr r2, _080A37A4 @ =gUnknown_02038559
	movs r1, 0
	ldrsb r1, [r2, r1]
	lsls r0, r1, 1
	adds r0, r1
	lsls r0, 1
	ldr r1, _080A37A8 @ =gUnknown_083C1690
	adds r0, r1
	str r0, [r3]
	movs r0, 0
	ldrsb r0, [r2, r0]
	cmp r0, 0x3
	beq _080A37B0
	ldr r1, _080A37AC @ =gUnknown_02038564
	movs r0, 0x4
	b _080A37B4
	.align 2, 0
_080A379C: .4byte gUnknown_03000701
_080A37A0: .4byte gUnknown_03000704
_080A37A4: .4byte gUnknown_02038559
_080A37A8: .4byte gUnknown_083C1690
_080A37AC: .4byte gUnknown_02038564
_080A37B0:
	ldr r1, _080A37BC @ =gUnknown_02038564
	movs r0, 0x6
_080A37B4:
	strb r0, [r1]
_080A37B6:
	pop {r0}
	bx r0
	.align 2, 0
_080A37BC: .4byte gUnknown_02038564
	thumb_func_end sub_80A3770

	thumb_func_start sub_80A37C0
sub_80A37C0: @ 80A37C0
	push {lr}
	lsls r0, 24
	lsrs r0, 24
	ldr r2, _080A37F0 @ =gTasks
	lsls r1, r0, 2
	adds r1, r0
	lsls r1, 3
	adds r1, r2
	ldr r0, _080A37F4 @ =sub_80A50C8
	str r0, [r1]
	movs r0, 0
	bl StartVerticalScrollIndicators
	movs r0, 0x1
	bl StartVerticalScrollIndicators
	movs r0, 0x2
	bl StartVerticalScrollIndicators
	movs r0, 0x3
	bl StartVerticalScrollIndicators
	pop {r0}
	bx r0
	.align 2, 0
_080A37F0: .4byte gTasks
_080A37F4: .4byte sub_80A50C8
	thumb_func_end sub_80A37C0

	thumb_func_start sub_80A37F8
sub_80A37F8: @ 80A37F8
	push {r4-r7,lr}
	lsls r0, 24
	lsrs r7, r0, 24
	ldr r6, _080A3854 @ =gUnknown_0203855A
	ldrb r5, [r6]
	cmp r5, 0xF
	bhi _080A3868
	adds r0, r5, 0x1
	strb r0, [r6]
	ldr r4, _080A3858 @ =gBGTilemapBuffers + 0x1000
	ldrb r2, [r6]
	adds r0, r4, 0
	adds r1, r5, 0
	movs r3, 0x4F
	bl sub_80A396C
	ldr r0, _080A385C @ =gUnknown_02038559
	ldrb r1, [r0]
	adds r1, 0x1
	lsls r1, 24
	lsrs r1, 24
	ldrb r2, [r6]
	lsrs r2, 1
	ldr r3, _080A3860 @ =gTasks
	lsls r0, r7, 2
	adds r0, r7
	lsls r0, 3
	adds r0, r3
	movs r3, 0x12
	ldrsb r3, [r0, r3]
	adds r0, r4, 0
	bl sub_80A39E4
	ldr r4, _080A3864 @ =gUnknown_02038558
	movs r0, 0x1
	strb r0, [r4]
	lsrs r1, r5, 1
	ldrb r2, [r6]
	lsrs r2, 1
	subs r2, 0x1
	adds r0, r7, 0
	bl sub_80A48E8
	movs r0, 0
	strb r0, [r4]
	b _080A3932
	.align 2, 0
_080A3854: .4byte gUnknown_0203855A
_080A3858: .4byte gBGTilemapBuffers + 0x1000
_080A385C: .4byte gUnknown_02038559
_080A3860: .4byte gTasks
_080A3864: .4byte gUnknown_02038558
_080A3868:
	ldr r0, _080A38A0 @ =gLinkOpen
	ldrb r0, [r0]
	cmp r0, 0x1
	bne _080A38B4
	ldr r1, _080A38A4 @ =gUnknown_03005D10
	ldr r0, _080A38A8 @ =gUnknown_02038559
	ldrb r0, [r0]
	lsls r0, 24
	asrs r0, 24
	lsls r0, 2
	adds r0, r1
	ldrb r1, [r0, 0x1]
	ldrb r0, [r0]
	adds r1, r0
	ldr r0, _080A38AC @ =gUnknown_03005D24
	ldr r0, [r0]
	lsls r1, 2
	adds r1, r0
	movs r2, 0
	ldrsh r0, [r1, r2]
	ldr r4, _080A38B0 @ =gUnknown_02038562
	ldrb r1, [r4]
	bl ItemListMenu_ChangeDescription
	ldrb r0, [r4]
	adds r0, 0x1
	strb r0, [r4]
	b _080A38F2
	.align 2, 0
_080A38A0: .4byte gLinkOpen
_080A38A4: .4byte gUnknown_03005D10
_080A38A8: .4byte gUnknown_02038559
_080A38AC: .4byte gUnknown_03005D24
_080A38B0: .4byte gUnknown_02038562
_080A38B4:
	ldr r1, _080A3938 @ =gUnknown_02038562
	ldrb r0, [r1]
	cmp r0, 0x2
	bhi _080A38F2
	ldr r5, _080A393C @ =gUnknown_03005D10
	adds r4, r1, 0
_080A38C0:
	ldr r0, _080A3940 @ =gUnknown_02038559
	ldrb r0, [r0]
	lsls r0, 24
	asrs r0, 24
	lsls r0, 2
	adds r0, r5
	ldrb r1, [r0, 0x1]
	ldrb r0, [r0]
	adds r1, r0
	ldr r0, _080A3944 @ =gUnknown_03005D24
	ldr r0, [r0]
	lsls r1, 2
	adds r1, r0
	movs r2, 0
	ldrsh r0, [r1, r2]
	ldrb r1, [r4]
	bl ItemListMenu_ChangeDescription
	ldrb r0, [r4]
	adds r0, 0x1
	strb r0, [r4]
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x2
	bls _080A38C0
_080A38F2:
	ldr r0, _080A3938 @ =gUnknown_02038562
	ldrb r0, [r0]
	cmp r0, 0x3
	bne _080A3932
	ldr r1, _080A3948 @ =gUnknown_0203855A
	movs r0, 0x10
	strb r0, [r1]
	ldr r1, _080A394C @ =gUnknown_0203855B
	ldr r0, _080A3940 @ =gUnknown_02038559
	ldrb r0, [r0]
	adds r0, 0x1
	strb r0, [r1]
	ldr r0, _080A3950 @ =sub_80A4F68
	bl FindTaskIdByFunc
	lsls r0, 24
	lsrs r0, 24
	bl sub_80A37C0
	adds r0, r7, 0
	bl DestroyTask
	bl ItemListMenu_InitMenu
	movs r0, 0x2
	movs r1, 0
	bl sub_80F979C
	movs r0, 0x3
	movs r1, 0
	bl sub_80F979C
_080A3932:
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080A3938: .4byte gUnknown_02038562
_080A393C: .4byte gUnknown_03005D10
_080A3940: .4byte gUnknown_02038559
_080A3944: .4byte gUnknown_03005D24
_080A3948: .4byte gUnknown_0203855A
_080A394C: .4byte gUnknown_0203855B
_080A3950: .4byte sub_80A4F68
	thumb_func_end sub_80A37F8

	thumb_func_start sub_80A3954
sub_80A3954: @ 80A3954
	push {lr}
	adds r1, r0, 0
	ldr r0, _080A3968 @ =gUnknown_08E77004
	movs r2, 0x80
	lsls r2, 3
	bl CpuSet
	pop {r0}
	bx r0
	.align 2, 0
_080A3968: .4byte gUnknown_08E77004
	thumb_func_end sub_80A3954

	thumb_func_start sub_80A396C
sub_80A396C: @ 80A396C
	push {r4-r7,lr}
	lsls r1, 24
	lsrs r5, r1, 24
	adds r4, r5, 0
	lsls r2, 24
	lsrs r7, r2, 24
	lsls r3, 24
	lsrs r6, r3, 24
	adds r1, r4, 0x2
	lsls r1, 6
	adds r1, 0x1C
	adds r2, r0, r1
	adds r0, r4, 0x1
	lsls r0, 24
	lsrs r5, r0, 24
	cmp r7, r4
	bls _080A39B2
_080A398E:
	movs r1, 0
	adds r3, r5, 0x1
	adds r4, r2, 0
	adds r4, 0x40
_080A3996:
	lsls r0, r1, 1
	adds r0, r2
	strh r6, [r0]
	adds r0, r1, 0x1
	lsls r0, 16
	lsrs r1, r0, 16
	cmp r1, 0xE
	bls _080A3996
	adds r2, r4, 0
	adds r1, r5, 0
	lsls r0, r3, 24
	lsrs r5, r0, 24
	cmp r7, r1
	bhi _080A398E
_080A39B2:
	pop {r4-r7}
	pop {r0}
	bx r0
	thumb_func_end sub_80A396C

	thumb_func_start sub_80A39B8
sub_80A39B8: @ 80A39B8
	push {lr}
	sub sp, 0x10
	lsls r1, 25
	lsrs r1, 24
	ldr r3, _080A39E0 @ =gUnknown_08E96EC8
	movs r2, 0
	str r2, [sp]
	str r1, [sp, 0x4]
	movs r1, 0x8
	str r1, [sp, 0x8]
	movs r1, 0x2
	str r1, [sp, 0xC]
	movs r1, 0x4
	movs r2, 0xA
	bl sub_809D104
	add sp, 0x10
	pop {r0}
	bx r0
	.align 2, 0
_080A39E0: .4byte gUnknown_08E96EC8
	thumb_func_end sub_80A39B8

	thumb_func_start sub_80A39E4
sub_80A39E4: @ 80A39E4
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	sub sp, 0x10
	mov r8, r0
	lsls r1, 24
	lsrs r1, 24
	adds r4, r1, 0
	lsls r2, 24
	lsrs r6, r2, 24
	adds r5, r6, 0
	lsls r2, r1, 1
	mov r9, r2
	lsls r3, 24
	asrs r3, 24
	movs r0, 0x1
	negs r0, r0
	cmp r3, r0
	bne _080A3A5C
	adds r0, r1, 0x1
	lsls r7, r0, 1
	cmp r1, 0x5
	bne _080A3A18
	movs r7, 0x2
_080A3A18:
	ldr r0, _080A3A58 @ =gUnknown_08E96EC8
	mov r10, r0
	movs r4, 0x8
	subs r4, r6
	lsls r4, 16
	lsrs r4, 16
	str r4, [sp]
	str r2, [sp, 0x4]
	str r6, [sp, 0x8]
	movs r0, 0x2
	mov r9, r0
	str r0, [sp, 0xC]
	mov r0, r8
	movs r1, 0x4
	movs r2, 0xA
	mov r3, r10
	bl sub_809D104
	adds r1, r6, 0x4
	movs r0, 0
	str r0, [sp]
	str r7, [sp, 0x4]
	str r4, [sp, 0x8]
	mov r0, r9
	str r0, [sp, 0xC]
	mov r0, r8
	movs r2, 0xA
	mov r3, r10
	bl sub_809D104
	b _080A3AAA
	.align 2, 0
_080A3A58: .4byte gUnknown_08E96EC8
_080A3A5C:
	cmp r3, 0x1
	bne _080A3AAA
	subs r0, r4, 0x1
	lsls r0, 17
	lsrs r7, r0, 16
	cmp r4, 0x1
	bne _080A3A6C
	movs r7, 0xA
_080A3A6C:
	ldr r6, _080A3ABC @ =gUnknown_08E96EC8
	str r5, [sp]
	str r7, [sp, 0x4]
	movs r0, 0x8
	subs r0, r5
	lsls r0, 16
	lsrs r0, 16
	str r0, [sp, 0x8]
	movs r4, 0x2
	str r4, [sp, 0xC]
	mov r0, r8
	movs r1, 0x4
	movs r2, 0xA
	adds r3, r6, 0
	bl sub_809D104
	movs r1, 0xC
	subs r1, r5
	lsls r1, 16
	lsrs r1, 16
	movs r0, 0
	str r0, [sp]
	mov r0, r9
	str r0, [sp, 0x4]
	str r5, [sp, 0x8]
	str r4, [sp, 0xC]
	mov r0, r8
	movs r2, 0xA
	adds r3, r6, 0
	bl sub_809D104
_080A3AAA:
	add sp, 0x10
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080A3ABC: .4byte gUnknown_08E96EC8
	thumb_func_end sub_80A39E4

	thumb_func_start sub_80A3AC0
sub_80A3AC0: @ 80A3AC0
	push {r4-r6,lr}
	adds r3, r0, 0
	lsls r1, 24
	lsrs r4, r1, 24
	movs r2, 0
	ldr r1, _080A3AE4 @ =0x0000024a
	ldr r0, _080A3AE8 @ =0x0000107d
	adds r6, r0, 0
	subs r0, 0x1
	adds r5, r0, 0
_080A3AD4:
	cmp r2, r4
	bne _080A3AEC
	lsls r0, r2, 1
	adds r0, r3
	adds r0, r1
	strh r6, [r0]
	b _080A3AF4
	.align 2, 0
_080A3AE4: .4byte 0x0000024a
_080A3AE8: .4byte 0x0000107d
_080A3AEC:
	lsls r0, r2, 1
	adds r0, r3
	adds r0, r1
	strh r5, [r0]
_080A3AF4:
	adds r0, r2, 0x1
	lsls r0, 24
	lsrs r2, r0, 24
	cmp r2, 0x4
	bls _080A3AD4
	pop {r4-r6}
	pop {r0}
	bx r0
	thumb_func_end sub_80A3AC0

	thumb_func_start sub_80A3B04
sub_80A3B04: @ 80A3B04
	push {r4-r6,lr}
	adds r5, r0, 0
	ldr r4, _080A3BA4 @ =gUnknown_02038559
	ldrb r0, [r4]
	lsls r1, 24
	asrs r6, r1, 24
	adds r0, r6, r0
	strb r0, [r4]
	lsls r0, 24
	asrs r0, 24
	cmp r0, 0x4
	ble _080A3B20
	movs r0, 0
	strb r0, [r4]
_080A3B20:
	movs r0, 0
	ldrsb r0, [r4, r0]
	cmp r0, 0
	bge _080A3B2C
	movs r0, 0x4
	strb r0, [r4]
_080A3B2C:
	bl sub_80A76A0
	bl sub_80A7590
	ldr r2, _080A3BA8 @ =gUnknown_03005D24
	ldr r1, _080A3BAC @ =gBagPockets
	movs r0, 0
	ldrsb r0, [r4, r0]
	lsls r0, 3
	adds r0, r1
	ldr r0, [r0]
	str r0, [r2]
	ldrb r0, [r4]
	bl sub_80A3D24
	ldr r0, _080A3BB0 @ =gUnknown_0203855A
	movs r4, 0
	strb r4, [r0]
	adds r0, r5, 0
	bl sub_80A3954
	adds r0, r5, 0
	movs r1, 0
	movs r2, 0x10
	movs r3, 0x3
	bl sub_80A396C
	adds r0, r5, 0
	movs r1, 0
	bl sub_80A39B8
	ldr r1, _080A3BB4 @ =gUnknown_0203855B
	movs r0, 0x6
	strb r0, [r1]
	ldr r0, _080A3BB8 @ =gUnknown_02038562
	strb r4, [r0]
	ldr r4, _080A3BBC @ =sub_80A37F8
	adds r0, r4, 0
	bl FindTaskIdByFunc
	lsls r0, 24
	lsrs r2, r0, 24
	cmp r2, 0xFF
	bne _080A3B90
	adds r0, r4, 0
	movs r1, 0x8
	bl CreateTask
	lsls r0, 24
	lsrs r2, r0, 24
_080A3B90:
	ldr r1, _080A3BC0 @ =gTasks
	lsls r0, r2, 2
	adds r0, r2
	lsls r0, 3
	adds r0, r1
	strh r6, [r0, 0x12]
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_080A3BA4: .4byte gUnknown_02038559
_080A3BA8: .4byte gUnknown_03005D24
_080A3BAC: .4byte gBagPockets
_080A3BB0: .4byte gUnknown_0203855A
_080A3BB4: .4byte gUnknown_0203855B
_080A3BB8: .4byte gUnknown_02038562
_080A3BBC: .4byte sub_80A37F8
_080A3BC0: .4byte gTasks
	thumb_func_end sub_80A3B04

	thumb_func_start swap32
swap32: @ 80A3BC4
	ldr r3, [r0]
	ldr r2, [r1]
	str r2, [r0]
	str r3, [r1]
	bx lr
	thumb_func_end swap32

	thumb_func_start sub_80A3BD0
sub_80A3BD0: @ 80A3BD0
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	sub sp, 0x4
	adds r7, r1, 0
	adds r6, r0, 0
	movs r3, 0
	b _080A3C1A
_080A3BE0:
	adds r0, r3, 0x1
	lsls r1, r0, 16
	lsrs r4, r1, 16
	lsls r1, r2, 24
	lsrs r1, 24
	mov r8, r0
	cmp r4, r1
	bcs _080A3C14
	lsls r0, r3, 2
	adds r5, r0, r6
	adds r2, r1, 0
_080A3BF6:
	ldrh r0, [r5, 0x2]
	cmp r0, 0
	bne _080A3C0A
	lsls r1, r4, 2
	adds r1, r6
	adds r0, r5, 0
	str r2, [sp]
	bl swap32
	ldr r2, [sp]
_080A3C0A:
	adds r0, r4, 0x1
	lsls r0, 16
	lsrs r4, r0, 16
	cmp r4, r2
	bcc _080A3BF6
_080A3C14:
	mov r1, r8
	lsls r0, r1, 16
	lsrs r3, r0, 16
_080A3C1A:
	adds r2, r7, 0
	lsls r0, r2, 24
	lsrs r0, 24
	subs r0, 0x1
	cmp r3, r0
	blt _080A3BE0
	add sp, 0x4
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r0}
	bx r0
	thumb_func_end sub_80A3BD0

	thumb_func_start sub_80A3C34
sub_80A3C34: @ 80A3C34
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	sub sp, 0x4
	adds r7, r1, 0
	adds r6, r0, 0
	adds r2, r7, 0
	lsls r0, r2, 24
	movs r3, 0
	cmp r0, 0
	beq _080A3C9C
_080A3C4A:
	adds r0, r3, 0x1
	lsls r1, r0, 16
	lsrs r4, r1, 16
	lsls r1, r2, 24
	lsrs r1, 24
	mov r8, r0
	cmp r4, r1
	bcs _080A3C8C
	lsls r0, r3, 2
	adds r5, r0, r6
	adds r2, r1, 0
_080A3C60:
	ldrh r0, [r5, 0x2]
	cmp r0, 0
	beq _080A3C82
	lsls r0, r4, 2
	adds r1, r0, r6
	ldrh r0, [r1, 0x2]
	cmp r0, 0
	beq _080A3C82
	ldrh r0, [r5]
	ldrh r3, [r1]
	cmp r0, r3
	bls _080A3C82
	adds r0, r5, 0
	str r2, [sp]
	bl swap32
	ldr r2, [sp]
_080A3C82:
	adds r0, r4, 0x1
	lsls r0, 16
	lsrs r4, r0, 16
	cmp r4, r2
	bcc _080A3C60
_080A3C8C:
	mov r1, r8
	lsls r0, r1, 16
	lsrs r3, r0, 16
	adds r2, r7, 0
	lsls r0, r2, 24
	lsrs r0, 24
	cmp r3, r0
	bcc _080A3C4A
_080A3C9C:
	add sp, 0x4
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r0}
	bx r0
	thumb_func_end sub_80A3C34

	thumb_func_start sub_80A3CA8
sub_80A3CA8: @ 80A3CA8
	push {r4-r7,lr}
	lsls r0, 24
	lsrs r6, r0, 24
	ldr r1, _080A3D00 @ =gUnknown_03005D10
	lsls r0, r6, 2
	adds r3, r0, r1
	movs r0, 0
	strb r0, [r3, 0x2]
	movs r4, 0
	ldr r0, _080A3D04 @ =gBagPockets
	lsls r2, r6, 3
	adds r1, r2, r0
	mov r12, r0
	ldrb r1, [r1, 0x4]
	cmp r4, r1
	bcs _080A3CEC
	mov r7, r12
	adds r5, r3, 0
_080A3CCC:
	adds r3, r2, r7
	ldr r0, [r3]
	lsls r1, r4, 2
	adds r1, r0
	ldrh r0, [r1, 0x2]
	cmp r0, 0
	beq _080A3CE0
	ldrb r0, [r5, 0x2]
	adds r0, 0x1
	strb r0, [r5, 0x2]
_080A3CE0:
	adds r0, r4, 0x1
	lsls r0, 16
	lsrs r4, r0, 16
	ldrb r3, [r3, 0x4]
	cmp r4, r3
	bcc _080A3CCC
_080A3CEC:
	lsls r0, r6, 3
	add r0, r12
	ldr r1, [r0, 0x4]
	ldr r0, [r0]
	bl sub_80A3BD0
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080A3D00: .4byte gUnknown_03005D10
_080A3D04: .4byte gBagPockets
	thumb_func_end sub_80A3CA8

	thumb_func_start sub_80A3D08
sub_80A3D08: @ 80A3D08
	push {r4,lr}
	movs r4, 0
_080A3D0C:
	adds r0, r4, 0
	bl sub_80A3CA8
	adds r0, r4, 0x1
	lsls r0, 24
	lsrs r4, r0, 24
	cmp r4, 0x4
	bls _080A3D0C
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end sub_80A3D08

	thumb_func_start sub_80A3D24
sub_80A3D24: @ 80A3D24
	push {lr}
	lsls r0, 24
	ldr r1, _080A3D3C @ =gUnknown_03005D10
	lsrs r0, 22
	adds r1, r0, r1
	ldrb r0, [r1, 0x2]
	cmp r0, 0x6
	bls _080A3D36
	movs r0, 0x7
_080A3D36:
	strb r0, [r1, 0x3]
	pop {r0}
	bx r0
	.align 2, 0
_080A3D3C: .4byte gUnknown_03005D10
	thumb_func_end sub_80A3D24

	thumb_func_start sub_80A3D40
sub_80A3D40: @ 80A3D40
	push {r4,lr}
	movs r4, 0
_080A3D44:
	adds r0, r4, 0
	bl sub_80A3D24
	adds r0, r4, 0x1
	lsls r0, 24
	lsrs r4, r0, 24
	cmp r4, 0x4
	bls _080A3D44
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end sub_80A3D40

	thumb_func_start sub_80A3D5C
sub_80A3D5C: @ 80A3D5C
	push {r4-r7,lr}
	mov r7, r9
	mov r6, r8
	push {r6,r7}
	lsls r0, 24
	lsrs r0, 24
	ldr r1, _080A3DF4 @ =gUnknown_03005D10
	mov r9, r1
	ldr r2, _080A3DF8 @ =gUnknown_02038559
	mov r8, r2
	movs r1, 0
	ldrsb r1, [r2, r1]
	lsls r1, 2
	add r1, r9
	ldrb r2, [r1, 0x1]
	ldrb r1, [r1]
	adds r2, r1
	ldr r7, _080A3DFC @ =gUnknown_03005D24
	ldr r1, [r7]
	lsls r6, r2, 2
	adds r3, r6, r1
	ldr r2, _080A3E00 @ =gTasks
	lsls r1, r0, 2
	adds r1, r0
	lsls r1, 3
	adds r1, r2
	ldrh r0, [r3, 0x2]
	ldrh r1, [r1, 0xA]
	subs r0, r1
	strh r0, [r3, 0x2]
	lsls r0, 16
	lsrs r4, r0, 16
	cmp r4, 0
	bne _080A3DE0
	ldr r0, _080A3E04 @ =gSaveBlock1
	ldr r1, _080A3E08 @ =0x00000496
	adds r5, r0, r1
	ldrh r0, [r5]
	ldrh r3, [r3]
	cmp r0, r3
	bne _080A3DB4
	bl sub_80A40D0
	strh r4, [r5]
_080A3DB4:
	ldr r0, [r7]
	adds r0, r6, r0
	strh r4, [r0]
	mov r2, r8
	movs r0, 0
	ldrsb r0, [r2, r0]
	lsls r0, 2
	mov r3, r9
	adds r2, r0, r3
	ldrb r1, [r2, 0x1]
	adds r0, r1, 0x7
	ldrb r3, [r2, 0x2]
	cmp r0, r3
	bne _080A3DD8
	cmp r1, 0
	beq _080A3DD8
	subs r0, r1, 0x1
	strb r0, [r2, 0x1]
_080A3DD8:
	ldr r0, _080A3DF8 @ =gUnknown_02038559
	ldrb r0, [r0]
	bl sub_80A3CA8
_080A3DE0:
	ldr r0, _080A3DF8 @ =gUnknown_02038559
	ldrb r0, [r0]
	bl sub_80A3D24
	pop {r3,r4}
	mov r8, r3
	mov r9, r4
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080A3DF4: .4byte gUnknown_03005D10
_080A3DF8: .4byte gUnknown_02038559
_080A3DFC: .4byte gUnknown_03005D24
_080A3E00: .4byte gTasks
_080A3E04: .4byte gSaveBlock1
_080A3E08: .4byte 0x00000496
	thumb_func_end sub_80A3D5C

	thumb_func_start sub_80A3E0C
sub_80A3E0C: @ 80A3E0C
	push {lr}
	ldr r3, _080A3E60 @ =gUnknown_03005D10
	ldr r2, _080A3E64 @ =gUnknown_02038559
	movs r0, 0
	ldrsb r0, [r2, r0]
	lsls r0, 2
	adds r0, r3
	ldrb r1, [r0, 0x1]
	ldrb r0, [r0]
	adds r1, r0
	ldr r0, _080A3E68 @ =gUnknown_03005D24
	ldr r0, [r0]
	lsls r1, 2
	adds r1, r0
	ldrh r0, [r1, 0x2]
	cmp r0, 0
	bne _080A3E52
	strh r0, [r1]
	movs r0, 0
	ldrsb r0, [r2, r0]
	lsls r0, 2
	adds r2, r0, r3
	ldrb r1, [r2, 0x1]
	adds r0, r1, 0x7
	ldrb r3, [r2, 0x2]
	cmp r0, r3
	bne _080A3E4A
	cmp r1, 0
	beq _080A3E4A
	subs r0, r1, 0x1
	strb r0, [r2, 0x1]
_080A3E4A:
	ldr r0, _080A3E64 @ =gUnknown_02038559
	ldrb r0, [r0]
	bl sub_80A3CA8
_080A3E52:
	ldr r0, _080A3E64 @ =gUnknown_02038559
	ldrb r0, [r0]
	bl sub_80A3D24
	pop {r0}
	bx r0
	.align 2, 0
_080A3E60: .4byte gUnknown_03005D10
_080A3E64: .4byte gUnknown_02038559
_080A3E68: .4byte gUnknown_03005D24
	thumb_func_end sub_80A3E0C

	thumb_func_start nullsub_16
nullsub_16: @ 80A3E6C
	bx lr
	thumb_func_end nullsub_16

	thumb_func_start sub_80A3E70
sub_80A3E70: @ 80A3E70
	lsls r0, 24
	lsls r1, 24
	ldr r2, _080A3E8C @ =gUnknown_03005D24
	ldr r2, [r2]
	lsrs r0, 22
	adds r0, r2
	ldr r3, [r0]
	lsrs r1, 22
	adds r1, r2
	ldr r2, [r1]
	str r2, [r0]
	str r3, [r1]
	bx lr
	.align 2, 0
_080A3E8C: .4byte gUnknown_03005D24
	thumb_func_end sub_80A3E70

	thumb_func_start sub_80A3E90
sub_80A3E90: @ 80A3E90
	push {r4,r5,lr}
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	movs r0, 0x5
	bl PlaySE
	bl nullsub_16
	ldr r0, _080A3EE8 @ =gTasks
	lsls r5, r4, 2
	adds r5, r4
	lsls r5, 3
	adds r5, r0
	ldrb r0, [r5, 0x1C]
	subs r0, 0x1
	lsls r0, 24
	lsrs r0, 24
	ldr r3, _080A3EEC @ =gUnknown_03005D10
	ldr r1, _080A3EF0 @ =gUnknown_02038559
	movs r2, 0
	ldrsb r2, [r1, r2]
	lsls r2, 2
	adds r2, r3
	ldrb r1, [r2, 0x1]
	ldrb r2, [r2]
	adds r1, r2
	lsls r1, 24
	lsrs r1, 24
	bl sub_80A3E70
	movs r0, 0
	strh r0, [r5, 0x1C]
	bl sub_80A763C
	movs r0, 0
	bl sub_80A7528
	bl ItemListMenu_InitMenu
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080A3EE8: .4byte gTasks
_080A3EEC: .4byte gUnknown_03005D10
_080A3EF0: .4byte gUnknown_02038559
	thumb_func_end sub_80A3E90

	thumb_func_start sub_80A3EF4
sub_80A3EF4: @ 80A3EF4
	push {r4,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	movs r0, 0x5
	bl PlaySE
	bl nullsub_16
	ldr r0, _080A3F44 @ =gTasks
	lsls r1, r4, 2
	adds r1, r4
	lsls r1, 3
	adds r1, r0
	ldr r2, _080A3F48 @ =gUnknown_03005D10
	ldr r0, _080A3F4C @ =gUnknown_02038559
	ldrb r0, [r0]
	lsls r0, 24
	asrs r0, 24
	lsls r0, 2
	adds r0, r2
	ldrb r0, [r0, 0x1]
	mvns r0, r0
	ldrb r2, [r1, 0x1C]
	adds r0, r2
	lsls r0, 24
	lsrs r2, r0, 24
	movs r0, 0
	strh r0, [r1, 0x1C]
	cmp r2, 0x7
	bhi _080A3F38
	adds r0, r4, 0
	adds r1, r2, 0
	bl sub_80A48E8
_080A3F38:
	movs r0, 0
	bl sub_80A7528
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080A3F44: .4byte gTasks
_080A3F48: .4byte gUnknown_03005D10
_080A3F4C: .4byte gUnknown_02038559
	thumb_func_end sub_80A3EF4

	thumb_func_start sub_80A3F50
sub_80A3F50: @ 80A3F50
	push {r4,r5,lr}
	lsls r0, 24
	lsrs r0, 24
	ldr r1, _080A3F94 @ =gTasks
	lsls r3, r0, 2
	adds r3, r0
	lsls r3, 3
	adds r3, r1
	ldr r5, _080A3F98 @ =gUnknown_03005D10
	ldr r4, _080A3F9C @ =gUnknown_02038559
	movs r1, 0
	ldrsb r1, [r4, r1]
	lsls r1, 2
	adds r1, r5
	ldrb r2, [r1, 0x1]
	ldrb r1, [r1]
	adds r2, r1
	adds r2, 0x1
	strh r2, [r3, 0x1C]
	movs r1, 0
	ldrsb r1, [r4, r1]
	lsls r1, 2
	adds r1, r5
	ldrb r2, [r1]
	adds r1, r2, 0
	bl sub_80A48E8
	movs r0, 0x1
	bl sub_80A7528
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080A3F94: .4byte gTasks
_080A3F98: .4byte gUnknown_03005D10
_080A3F9C: .4byte gUnknown_02038559
	thumb_func_end sub_80A3F50

	thumb_func_start sub_80A3FA0
sub_80A3FA0: @ 80A3FA0
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	adds r7, r0, 0
	ldr r0, [sp, 0x18]
	ldr r4, [sp, 0x1C]
	lsls r1, 24
	lsrs r5, r1, 24
	lsls r2, 24
	lsls r3, 24
	lsrs r3, 24
	lsls r0, 24
	lsrs r0, 24
	lsls r4, 16
	lsrs r6, r4, 16
	lsrs r2, 24
	adds r0, r2, r0
	cmp r2, r0
	bge _080A3FFC
	mov r8, r5
	adds r4, r5, r3
	mov r12, r0
_080A3FCC:
	adds r0, r5, 0
	lsls r3, r2, 16
	cmp r8, r4
	bge _080A3FEE
	asrs r2, r3, 11
_080A3FD6:
	lsls r1, r0, 16
	asrs r1, 16
	adds r0, r1, r2
	lsls r0, 1
	adds r0, r7
	strh r6, [r0]
	adds r1, 0x1
	lsls r1, 16
	lsrs r0, r1, 16
	asrs r1, 16
	cmp r1, r4
	blt _080A3FD6
_080A3FEE:
	movs r1, 0x80
	lsls r1, 9
	adds r0, r3, r1
	lsrs r2, r0, 16
	asrs r0, 16
	cmp r0, r12
	blt _080A3FCC
_080A3FFC:
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r0}
	bx r0
	thumb_func_end sub_80A3FA0

	thumb_func_start sub_80A4008
sub_80A4008: @ 80A4008
	push {r4,lr}
	sub sp, 0x8
	ldr r4, [sp, 0x10]
	lsls r1, 24
	lsrs r1, 24
	lsls r2, 24
	lsrs r2, 24
	lsls r3, 24
	lsrs r3, 24
	lsls r4, 24
	lsrs r4, 24
	str r4, [sp]
	movs r4, 0x1
	str r4, [sp, 0x4]
	bl sub_80A3FA0
	add sp, 0x8
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end sub_80A4008

	thumb_func_start sub_80A4030
sub_80A4030: @ 80A4030
	ldr r1, _080A4058 @ =gBGTilemapBuffers + 0x1000 + 0xB4
	lsls r0, 7
	adds r1, r0, r1
	movs r0, 0x5A
	strh r0, [r1]
	movs r0, 0x5B
	strh r0, [r1, 0x2]
	movs r0, 0x5C
	strh r0, [r1, 0x4]
	adds r2, r1, 0
	adds r2, 0x40
	movs r0, 0x6A
	strh r0, [r2]
	adds r2, 0x2
	movs r0, 0x6B
	strh r0, [r2]
	adds r1, 0x44
	movs r0, 0x6C
	strh r0, [r1]
	bx lr
	.align 2, 0
_080A4058: .4byte gBGTilemapBuffers + 0x1000 + 0xB4
	thumb_func_end sub_80A4030

	thumb_func_start sub_80A405C
sub_80A405C: @ 80A405C
	push {r4,lr}
	lsls r0, 24
	lsrs r3, r0, 24
	ldr r2, _080A40A8 @ =gBGTilemapBuffers + 0x1000 + 0xB4
	movs r0, 0
	adds r4, r2, 0
	movs r1, 0x4F
_080A406A:
	strh r1, [r2]
	strh r1, [r2, 0x2]
	strh r1, [r2, 0x4]
	adds r2, 0x40
	adds r0, 0x1
	lsls r0, 16
	lsrs r0, 16
	cmp r0, 0xF
	bls _080A406A
	lsls r0, r3, 7
	adds r2, r0, r4
	movs r0, 0x5A
	strh r0, [r2]
	movs r0, 0x5B
	strh r0, [r2, 0x2]
	movs r0, 0x5C
	strh r0, [r2, 0x4]
	adds r1, r2, 0
	adds r1, 0x40
	movs r0, 0x6A
	strh r0, [r1]
	adds r1, 0x2
	movs r0, 0x6B
	strh r0, [r1]
	adds r1, 0x2
	movs r0, 0x6C
	strh r0, [r1]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080A40A8: .4byte gBGTilemapBuffers + 0x1000 + 0xB4
	thumb_func_end sub_80A405C

	thumb_func_start sub_80A40AC
sub_80A40AC: @ 80A40AC
	lsls r0, 24
	ldr r1, _080A40CC @ =gBGTilemapBuffers + 0x1000 + 0xB4
	lsrs r0, 17
	adds r1, r0, r1
	movs r2, 0x4F
	strh r2, [r1]
	strh r2, [r1, 0x2]
	strh r2, [r1, 0x4]
	adds r0, r1, 0
	adds r0, 0x40
	strh r2, [r0]
	adds r0, 0x2
	strh r2, [r0]
	adds r1, 0x44
	strh r2, [r1]
	bx lr
	.align 2, 0
_080A40CC: .4byte gBGTilemapBuffers + 0x1000 + 0xB4
	thumb_func_end sub_80A40AC

	thumb_func_start sub_80A40D0
sub_80A40D0: @ 80A40D0
	push {r4-r7,lr}
	movs r4, 0
	ldr r2, _080A4114 @ =gUnknown_03005D10
	ldr r3, _080A4118 @ =gUnknown_02038559
	movs r0, 0
	ldrsb r0, [r3, r0]
	lsls r0, 2
	adds r0, r2
	ldrb r1, [r0, 0x1]
	adds r7, r2, 0
	adds r6, r3, 0
	ldrb r0, [r0, 0x2]
	cmp r1, r0
	beq _080A4136
	ldr r5, _080A411C @ =gSaveBlock1 + 0x496
_080A40EE:
	movs r0, 0
	ldrsb r0, [r6, r0]
	lsls r0, 2
	adds r3, r0, r7
	ldrb r2, [r3, 0x1]
	adds r1, r2, r4
	ldr r0, _080A4120 @ =gUnknown_03005D24
	ldr r0, [r0]
	lsls r1, 2
	adds r1, r0
	ldrh r0, [r1]
	ldrh r1, [r5]
	cmp r0, r1
	bne _080A4124
	adds r0, r4, 0
	bl sub_80A40AC
	b _080A4136
	.align 2, 0
_080A4114: .4byte gUnknown_03005D10
_080A4118: .4byte gUnknown_02038559
_080A411C: .4byte gSaveBlock1 + 0x496
_080A4120: .4byte gUnknown_03005D24
_080A4124:
	adds r0, r4, 0x1
	lsls r0, 24
	lsrs r4, r0, 24
	cmp r4, 0x7
	bhi _080A4136
	adds r0, r2, r4
	ldrb r3, [r3, 0x2]
	cmp r0, r3
	bne _080A40EE
_080A4136:
	pop {r4-r7}
	pop {r0}
	bx r0
	thumb_func_end sub_80A40D0

	thumb_func_start sub_80A413C
sub_80A413C: @ 80A413C
	push {lr}
	bl sub_80A40D0
	ldr r1, _080A415C @ =gUnknown_03005D10
	ldr r0, _080A4160 @ =gUnknown_02038559
	ldrb r0, [r0]
	lsls r0, 24
	asrs r0, 24
	lsls r0, 2
	adds r0, r1
	ldrb r0, [r0]
	bl sub_80A405C
	pop {r0}
	bx r0
	.align 2, 0
_080A415C: .4byte gUnknown_03005D10
_080A4160: .4byte gUnknown_02038559
	thumb_func_end sub_80A413C

	thumb_func_start sub_80A4164
sub_80A4164: @ 80A4164
	push {r4,lr}
	lsls r1, 16
	lsrs r1, 16
	lsls r3, 24
	lsrs r3, 24
	movs r4, 0xB9
	strb r4, [r0]
	adds r0, 0x1
	movs r4, 0xFC
	strb r4, [r0]
	movs r4, 0x14
	strb r4, [r0, 0x1]
	movs r4, 0x6
	strb r4, [r0, 0x2]
	adds r0, 0x3
	bl ConvertIntToDecimalStringN
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end sub_80A4164

	thumb_func_start sub_80A418C
sub_80A418C: @ 80A418C
	push {r4-r6,lr}
	mov r6, r9
	mov r5, r8
	push {r5,r6}
	adds r4, r0, 0
	mov r9, r1
	adds r5, r2, 0
	adds r6, r3, 0
	ldr r3, [sp, 0x18]
	lsls r4, 16
	lsrs r4, 16
	lsls r5, 24
	lsrs r5, 24
	lsls r6, 24
	lsrs r6, 24
	lsls r3, 24
	lsrs r3, 24
	ldr r0, _080A41D0 @ =gStringVar1
	mov r8, r0
	adds r1, r4, 0
	mov r2, r9
	bl sub_80A4164
	mov r0, r8
	adds r1, r5, 0
	adds r2, r6, 0
	bl MenuPrint
	pop {r3,r4}
	mov r8, r3
	mov r9, r4
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_080A41D0: .4byte gStringVar1
	thumb_func_end sub_80A418C

	thumb_func_start sub_80A41D4
sub_80A41D4: @ 80A41D4
	push {lr}
	bl sub_80A763C
	pop {r0}
	bx r0
	thumb_func_end sub_80A41D4

	thumb_func_start sub_80A41E0
sub_80A41E0: @ 80A41E0
	push {r4-r7,lr}
	mov r7, r9
	mov r6, r8
	push {r6,r7}
	adds r7, r0, 0
	mov r9, r2
	adds r5, r3, 0
	ldr r4, [sp, 0x1C]
	lsls r1, 16
	lsrs r1, 16
	lsls r5, 16
	lsrs r5, 16
	lsls r4, 24
	lsrs r4, 24
	movs r0, 0xFC
	mov r8, r0
	strb r0, [r7]
	movs r6, 0x13
	strb r6, [r7, 0x1]
	movs r0, 0x8
	strb r0, [r7, 0x2]
	adds r7, 0x3
	adds r0, r7, 0
	movs r2, 0x2
	movs r3, 0x2
	bl ConvertIntToDecimalStringN
	mov r1, r8
	strb r1, [r0]
	strb r6, [r0, 0x1]
	movs r1, 0x18
	strb r1, [r0, 0x2]
	adds r7, r0, 0x3
	adds r4, 0x1
	lsls r0, r4, 1
	adds r0, r4
	lsls r0, 1
	movs r2, 0x78
	subs r2, r0
	lsls r2, 24
	lsrs r2, 24
	adds r0, r7, 0
	mov r1, r9
	movs r3, 0
	bl sub_8072C74
	movs r1, 0xB9
	strb r1, [r0]
	adds r7, r0, 0x1
	adds r0, r7, 0
	adds r1, r5, 0
	movs r2, 0x78
	movs r3, 0x1
	bl sub_8072C14
	pop {r3,r4}
	mov r8, r3
	mov r9, r4
	pop {r4-r7}
	pop {r0}
	bx r0
	thumb_func_end sub_80A41E0

	thumb_func_start sub_80A425C
sub_80A425C: @ 80A425C
	push {r4,lr}
	adds r4, r1, 0
	lsls r0, 24
	lsrs r0, 24
	lsls r2, 24
	lsrs r2, 24
	ldr r3, _080A42A4 @ =gTasks
	lsls r1, r0, 2
	adds r1, r0
	lsls r1, 3
	adds r1, r3
	movs r0, 0x1C
	ldrsh r1, [r1, r0]
	ldr r3, _080A42A8 @ =gUnknown_03005D10
	ldr r0, _080A42AC @ =gUnknown_02038559
	ldrb r0, [r0]
	lsls r0, 24
	asrs r0, 24
	lsls r0, 2
	adds r0, r3
	ldrb r0, [r0, 0x1]
	subs r1, r0
	subs r1, 0x1
	cmp r1, r2
	bne _080A429C
	movs r0, 0xFC
	strb r0, [r4]
	movs r0, 0x1
	strb r0, [r4, 0x1]
	movs r0, 0x2
	strb r0, [r4, 0x2]
	adds r4, 0x3
_080A429C:
	adds r0, r4, 0
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_080A42A4: .4byte gTasks
_080A42A8: .4byte gUnknown_03005D10
_080A42AC: .4byte gUnknown_02038559
	thumb_func_end sub_80A425C

	thumb_func_start sub_80A42B0
sub_80A42B0: @ 80A42B0
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	adds r7, r1, 0
	lsls r0, 24
	lsrs r0, 24
	adds r6, r0, 0
	ldr r0, _080A4344 @ =gUnknown_02038540
	mov r8, r0
	ldr r1, _080A4348 @ =gUnknown_03005D10
	ldr r0, _080A434C @ =gUnknown_02038559
	ldrb r0, [r0]
	lsls r0, 24
	asrs r0, 24
	lsls r0, 2
	adds r0, r1
	ldrb r1, [r0, 0x1]
	adds r1, r6
	ldrb r0, [r0, 0x2]
	cmp r1, r0
	bgt _080A4370
	cmp r1, r0
	bne _080A4374
	ldr r0, _080A4350 @ =gUnknown_03000701
	ldrb r0, [r0]
	cmp r0, 0x5
	beq _080A4370
	lsls r0, r6, 25
	movs r1, 0x80
	lsls r1, 18
	adds r0, r1
	lsrs r5, r0, 24
	ldr r4, _080A4354 @ =gStringVar1
	ldr r1, _080A4358 @ =gOtherText_CloseBag
	adds r0, r4, 0
	movs r2, 0x78
	movs r3, 0
	bl sub_8072C74
	adds r0, r4, 0
	movs r1, 0xE
	adds r2, r5, 0
	bl MenuPrint
	lsls r0, r5, 6
	ldr r1, _080A435C @ =gBGTilemapBuffers + 0x1000 + 0x1C
	adds r0, r1
	movs r2, 0x4F
	strh r2, [r0]
	strh r2, [r0, 0x2]
	adds r1, r0, 0
	adds r1, 0x40
	strh r2, [r1]
	adds r0, 0x42
	strh r2, [r0]
	cmp r6, 0x7
	beq _080A4370
	cmp r7, 0x1
	bne _080A432E
	mov r1, r8
	ldrb r0, [r1, 0x2]
	cmp r0, 0
	bne _080A4332
_080A432E:
	cmp r7, 0x2
	bne _080A4360
_080A4332:
	adds r1, r5, 0x2
	lsls r1, 24
	lsrs r1, 24
	movs r0, 0xE
	movs r2, 0x1D
	movs r3, 0xD
	bl MenuFillWindowRectWithBlankTile
	b _080A4370
	.align 2, 0
_080A4344: .4byte gUnknown_02038540
_080A4348: .4byte gUnknown_03005D10
_080A434C: .4byte gUnknown_02038559
_080A4350: .4byte gUnknown_03000701
_080A4354: .4byte gStringVar1
_080A4358: .4byte gOtherText_CloseBag
_080A435C: .4byte gBGTilemapBuffers + 0x1000 + 0x1C
_080A4360:
	adds r1, r5, 0x2
	lsls r1, 24
	lsrs r1, 24
	movs r0, 0xE
	movs r2, 0x1D
	movs r3, 0x11
	bl MenuFillWindowRectWithBlankTile
_080A4370:
	movs r0, 0x1
	b _080A4376
_080A4374:
	movs r0, 0
_080A4376:
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r1}
	bx r1
	thumb_func_end sub_80A42B0

	thumb_func_start sub_80A4380
sub_80A4380: @ 80A4380
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	sub sp, 0x4
	str r2, [sp]
	mov r10, r3
	lsls r0, 16
	lsrs r0, 16
	mov r9, r0
	lsls r1, 24
	lsrs r7, r1, 24
	ldr r0, _080A43A0 @ =gUnknown_03005D24
	mov r8, r0
	b _080A441A
	.align 2, 0
_080A43A0: .4byte gUnknown_03005D24
_080A43A4:
	ldr r1, _080A4440 @ =gUnknown_03005D10
	ldr r0, _080A4444 @ =gUnknown_02038559
	ldrb r0, [r0]
	lsls r0, 24
	asrs r0, 24
	lsls r0, 2
	adds r0, r1
	ldrb r4, [r0, 0x1]
	adds r4, r7, r4
	lsls r4, 24
	lsrs r4, 24
	lsls r5, r7, 25
	movs r1, 0x80
	lsls r1, 18
	adds r5, r1
	lsrs r5, 24
	ldr r6, _080A4448 @ =gStringVar1
	mov r1, r9
	lsls r0, r1, 24
	lsrs r0, 24
	adds r1, r6, 0
	adds r2, r7, 0
	bl sub_80A425C
	adds r6, r0, 0
	mov r1, r8
	ldr r0, [r1]
	lsls r4, 2
	adds r0, r4, r0
	ldrh r0, [r0]
	bl ItemId_GetItem
	adds r1, r0, 0
	adds r0, r6, 0
	movs r2, 0x66
	movs r3, 0
	bl sub_8072C74
	adds r6, r0, 0
	movs r0, 0xB9
	strb r0, [r6]
	adds r6, 0x1
	mov r1, r8
	ldr r0, [r1]
	adds r4, r0
	ldrh r1, [r4, 0x2]
	adds r0, r6, 0
	movs r2, 0x78
	movs r3, 0x1
	bl sub_8072C14
	ldr r0, _080A4448 @ =gStringVar1
	movs r1, 0xE
	adds r2, r5, 0
	bl MenuPrint
	adds r0, r7, 0x1
	lsls r0, 24
	lsrs r7, r0, 24
_080A441A:
	ldr r0, [sp]
	cmp r7, r0
	bgt _080A4430
	adds r0, r7, 0
	mov r1, r10
	bl sub_80A42B0
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _080A43A4
_080A4430:
	add sp, 0x4
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080A4440: .4byte gUnknown_03005D10
_080A4444: .4byte gUnknown_02038559
_080A4448: .4byte gStringVar1
	thumb_func_end sub_80A4380

	thumb_func_start sub_80A444C
sub_80A444C: @ 80A444C
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	sub sp, 0x8
	str r2, [sp]
	str r3, [sp, 0x4]
	lsls r0, 16
	lsrs r0, 16
	mov r10, r0
	lsls r1, 24
	lsrs r6, r1, 24
	ldr r0, _080A446C @ =gSaveBlock1 + 0x496
	mov r9, r0
	b _080A4520
	.align 2, 0
_080A446C: .4byte gSaveBlock1 + 0x496
_080A4470:
	ldr r1, _080A44E8 @ =gUnknown_03005D10
	ldr r0, _080A44EC @ =gUnknown_02038559
	ldrb r0, [r0]
	lsls r0, 24
	asrs r0, 24
	lsls r0, 2
	adds r0, r1
	ldrb r4, [r0, 0x1]
	adds r4, r6, r4
	lsls r4, 24
	lsrs r4, 24
	lsls r5, r6, 25
	movs r1, 0x80
	lsls r1, 18
	adds r5, r1
	lsrs r5, 24
	ldr r7, _080A44F0 @ =gStringVar1
	mov r2, r10
	lsls r0, r2, 24
	lsrs r0, 24
	adds r1, r7, 0
	adds r2, r6, 0
	bl sub_80A425C
	adds r7, r0, 0
	ldr r0, _080A44F4 @ =gUnknown_03005D24
	mov r8, r0
	ldr r0, [r0]
	lsls r4, 2
	adds r0, r4, r0
	ldrh r0, [r0]
	bl ItemId_GetItem
	adds r1, r0, 0
	adds r0, r7, 0
.ifdef ENGLISH
	movs r2, 0x60
.else
	movs r2, 0x63
.endif
	movs r3, 0
	bl sub_8072C74
	ldr r0, _080A44F0 @ =gStringVar1
	movs r1, 0xE
	adds r2, r5, 0
	bl MenuPrint
	ldr r0, _080A44F8 @ =gUnknown_02038558
	ldrb r0, [r0]
	cmp r0, 0
	beq _080A44FC
	mov r1, r8
	ldr r0, [r1]
	adds r0, r4, r0
	ldrh r0, [r0]
	mov r2, r9
	ldrh r2, [r2]
	cmp r0, r2
	bne _080A451A
	adds r0, r6, 0
	bl sub_80A4030
	b _080A451A
	.align 2, 0
_080A44E8: .4byte gUnknown_03005D10
_080A44EC: .4byte gUnknown_02038559
_080A44F0: .4byte gStringVar1
_080A44F4: .4byte gUnknown_03005D24
_080A44F8: .4byte gUnknown_02038558
_080A44FC:
	mov r1, r8
	ldr r0, [r1]
	adds r0, r4, r0
	ldrh r0, [r0]
	mov r2, r9
	ldrh r2, [r2]
	cmp r0, r2
	bne _080A4514
	adds r0, r6, 0
	bl sub_80A405C
	b _080A451A
_080A4514:
	adds r0, r6, 0
	bl sub_80A40AC
_080A451A:
	adds r0, r6, 0x1
	lsls r0, 24
	lsrs r6, r0, 24
_080A4520:
	ldr r0, [sp]
	cmp r6, r0
	bgt _080A4536
	adds r0, r6, 0
	ldr r1, [sp, 0x4]
	bl sub_80A42B0
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _080A4470
_080A4536:
	add sp, 0x8
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	thumb_func_end sub_80A444C

	thumb_func_start sub_80A4548
sub_80A4548: @ 80A4548
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	sub sp, 0x14
	str r2, [sp, 0x8]
	str r3, [sp, 0xC]
	lsls r0, 16
	lsrs r0, 16
	str r0, [sp, 0x4]
	lsls r1, 24
	lsrs r1, 24
	mov r8, r1
	ldr r0, _080A456C @ =gBGTilemapBuffers + 0x1000
	mov r9, r0
	b _080A46C2
	.align 2, 0
_080A456C: .4byte gBGTilemapBuffers + 0x1000
_080A4570:
	ldr r1, _080A461C @ =gUnknown_03005D10
	ldr r0, _080A4620 @ =gUnknown_02038559
	ldrb r0, [r0]
	lsls r0, 24
	asrs r0, 24
	lsls r0, 2
	adds r0, r1
	ldrb r4, [r0, 0x1]
	add r4, r8
	lsls r4, 24
	lsrs r4, 24
	mov r1, r8
	lsls r0, r1, 25
	movs r3, 0x80
	lsls r3, 18
	adds r0, r3
	lsrs r0, 24
	str r0, [sp, 0x10]
	lsls r0, 5
	adds r0, 0xE
	adds r5, r0, 0
	ldr r6, _080A4624 @ =gStringVar1
	ldr r1, [sp, 0x4]
	lsls r0, r1, 24
	lsrs r0, 24
	adds r1, r6, 0
	mov r2, r8
	bl sub_80A425C
	adds r6, r0, 0
	ldr r3, _080A4628 @ =gUnknown_03005D24
	mov r10, r3
	ldr r0, [r3]
	lsls r7, r4, 2
	adds r3, r7, r0
	ldrh r1, [r3]
	movs r0, 0xA9
	lsls r0, 1
	cmp r1, r0
	bhi _080A4634
	lsls r0, r5, 1
	add r0, r9
	movs r1, 0x59
	strh r1, [r0]
	adds r0, r5, 0x1
	lsls r0, 1
	add r0, r9
	movs r2, 0x4F
	strh r2, [r0]
	adds r0, r5, 0
	adds r0, 0x20
	lsls r0, 1
	add r0, r9
	movs r1, 0x69
	strh r1, [r0]
	adds r0, r5, 0
	adds r0, 0x21
	lsls r0, 1
	add r0, r9
	strh r2, [r0]
	ldrh r0, [r3]
	bl ItemIdToBattleMoveId
	lsls r0, 16
	lsrs r0, 16
	movs r1, 0xD
	adds r2, r0, 0
	muls r2, r1
	ldr r0, _080A462C @ =gMoveNames
	adds r2, r0
	mov r1, r10
	ldr r0, [r1]
	adds r0, r7, r0
	ldr r3, _080A4630 @ =0xfffffee0
	adds r1, r3, 0
	ldrh r3, [r0]
	adds r1, r3
	lsls r1, 16
	lsrs r1, 16
	ldrh r3, [r0, 0x2]
	movs r0, 0x2
	str r0, [sp]
	adds r0, r6, 0
	bl sub_80A41E0
	b _080A46AE
	.align 2, 0
_080A461C: .4byte gUnknown_03005D10
_080A4620: .4byte gUnknown_02038559
_080A4624: .4byte gStringVar1
_080A4628: .4byte gUnknown_03005D24
_080A462C: .4byte gMoveNames
_080A4630: .4byte 0xfffffee0
_080A4634:
	lsls r0, r5, 1
	add r0, r9
	ldr r1, _080A46EC @ =0x0000105d
	strh r1, [r0]
	adds r0, r5, 0x1
	lsls r0, 1
	add r0, r9
	adds r1, 0x1
	strh r1, [r0]
	adds r0, r5, 0
	adds r0, 0x20
	lsls r0, 1
	add r0, r9
	adds r1, 0xF
	strh r1, [r0]
	adds r0, r5, 0
	adds r0, 0x21
	lsls r0, 1
	add r0, r9
	adds r1, 0x1
	strh r1, [r0]
	movs r0, 0xFC
	strb r0, [r6]
	movs r4, 0x13
	strb r4, [r6, 0x1]
	movs r0, 0x11
	strb r0, [r6, 0x2]
	adds r6, 0x3
	mov r1, r10
	ldr r0, [r1]
	adds r0, r7, r0
	ldrh r1, [r0]
	ldr r3, _080A46F0 @ =0xfffffeae
	adds r1, r3
	adds r0, r6, 0
	bl ConvertIntToDecimalString
	adds r6, r0, 0
	movs r0, 0xFC
	strb r0, [r6]
	strb r4, [r6, 0x1]
	movs r0, 0x18
	strb r0, [r6, 0x2]
	adds r6, 0x3
	mov r1, r10
	ldr r0, [r1]
	adds r0, r7, r0
	ldrh r0, [r0]
	bl ItemIdToBattleMoveId
	lsls r0, 16
	lsrs r0, 16
	movs r1, 0xD
	muls r1, r0
	ldr r0, _080A46F4 @ =gMoveNames
	adds r1, r0
	adds r0, r6, 0
	movs r2, 0x78
	movs r3, 0
	bl sub_8072C74
_080A46AE:
	ldr r0, _080A46F8 @ =gStringVar1
	movs r1, 0xE
	ldr r2, [sp, 0x10]
	bl MenuPrint
	mov r0, r8
	adds r0, 0x1
	lsls r0, 24
	lsrs r0, 24
	mov r8, r0
_080A46C2:
	ldr r3, [sp, 0x8]
	cmp r8, r3
	bgt _080A46DA
	mov r0, r8
	ldr r1, [sp, 0xC]
	bl sub_80A42B0
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	beq _080A46DA
	b _080A4570
_080A46DA:
	add sp, 0x14
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080A46EC: .4byte 0x0000105d
_080A46F0: .4byte 0xfffffeae
_080A46F4: .4byte gMoveNames
_080A46F8: .4byte gStringVar1
	thumb_func_end sub_80A4548

	thumb_func_start sub_80A46FC
sub_80A46FC: @ 80A46FC
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	sub sp, 0x10
	str r2, [sp, 0x8]
	str r3, [sp, 0xC]
	lsls r0, 16
	lsrs r0, 16
	str r0, [sp, 0x4]
	lsls r1, 24
	lsrs r6, r1, 24
	ldr r0, _080A4724 @ =gBGTilemapBuffers + 0x1000
	mov r10, r0
	ldr r1, _080A4728 @ =gStringVar2
	mov r9, r1
	ldr r0, _080A472C @ =gUnknown_03005D24
	mov r8, r0
	b _080A47B4
	.align 2, 0
_080A4724: .4byte gBGTilemapBuffers + 0x1000
_080A4728: .4byte gStringVar2
_080A472C: .4byte gUnknown_03005D24
_080A4730:
	ldr r1, _080A47DC @ =gUnknown_03005D10
	ldr r0, _080A47E0 @ =gUnknown_02038559
	ldrb r0, [r0]
	lsls r0, 24
	asrs r0, 24
	lsls r0, 2
	adds r0, r1
	ldrb r4, [r0, 0x1]
	adds r4, r6, r4
	lsls r4, 24
	lsrs r4, 24
	lsls r5, r6, 25
	movs r1, 0x80
	lsls r1, 18
	adds r5, r1
	lsrs r5, 24
	lsls r0, r5, 5
	adds r0, 0xE
	lsls r1, r0, 1
	add r1, r10
	movs r2, 0x59
	strh r2, [r1]
	adds r0, 0x20
	lsls r0, 1
	add r0, r10
	movs r1, 0x69
	strh r1, [r0]
	ldr r7, _080A47E4 @ =gStringVar1
	ldr r1, [sp, 0x4]
	lsls r0, r1, 24
	lsrs r0, 24
	adds r1, r7, 0
	adds r2, r6, 0
	bl sub_80A425C
	adds r7, r0, 0
	mov r1, r8
	ldr r0, [r1]
	lsls r4, 2
	adds r0, r4, r0
	ldrh r0, [r0]
	mov r1, r9
	bl CopyItemName
	mov r1, r8
	ldr r0, [r1]
	adds r4, r0
	ldrh r1, [r4]
	subs r1, 0x84
	lsls r1, 16
	lsrs r1, 16
	ldrh r3, [r4, 0x2]
	movs r0, 0x3
	str r0, [sp]
	adds r0, r7, 0
	mov r2, r9
	bl sub_80A41E0
	ldr r0, _080A47E4 @ =gStringVar1
	movs r1, 0xE
	adds r2, r5, 0
	bl MenuPrint
	adds r0, r6, 0x1
	lsls r0, 24
	lsrs r6, r0, 24
_080A47B4:
	ldr r0, [sp, 0x8]
	cmp r6, r0
	bgt _080A47CA
	adds r0, r6, 0
	ldr r1, [sp, 0xC]
	bl sub_80A42B0
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _080A4730
_080A47CA:
	add sp, 0x10
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080A47DC: .4byte gUnknown_03005D10
_080A47E0: .4byte gUnknown_02038559
_080A47E4: .4byte gStringVar1
	thumb_func_end sub_80A46FC

	thumb_func_start sub_80A47E8
sub_80A47E8: @ 80A47E8
	push {r4,r5,lr}
	adds r4, r1, 0
	adds r5, r2, 0
	lsls r0, 16
	lsrs r2, r0, 16
	ldr r0, _080A4808 @ =gUnknown_02038559
	ldrb r0, [r0]
	lsls r0, 24
	asrs r0, 24
	cmp r0, 0x4
	bhi _080A4852
	lsls r0, 2
	ldr r1, _080A480C @ =_080A4810
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_080A4808: .4byte gUnknown_02038559
_080A480C: .4byte _080A4810
	.align 2, 0
_080A4810:
	.4byte _080A4824
	.4byte _080A4824
	.4byte _080A483C
	.4byte _080A4848
	.4byte _080A4830
_080A4824:
	adds r0, r2, 0
	adds r1, r4, 0
	adds r2, r5, 0
	bl sub_80A4380
	b _080A4852
_080A4830:
	adds r0, r2, 0
	adds r1, r4, 0
	adds r2, r5, 0
	bl sub_80A444C
	b _080A4852
_080A483C:
	adds r0, r2, 0
	adds r1, r4, 0
	adds r2, r5, 0
	bl sub_80A4548
	b _080A4852
_080A4848:
	adds r0, r2, 0
	adds r1, r4, 0
	adds r2, r5, 0
	bl sub_80A46FC
_080A4852:
	ldr r1, _080A4870 @ =gUnknown_03005D10
	ldr r0, _080A4874 @ =gUnknown_02038559
	ldrb r0, [r0]
	lsls r0, 24
	asrs r0, 24
	lsls r0, 2
	adds r0, r1
	ldrb r0, [r0, 0x1]
	cmp r0, 0
	beq _080A4878
	movs r0, 0
	movs r1, 0
	bl sub_80F979C
	b _080A4880
	.align 2, 0
_080A4870: .4byte gUnknown_03005D10
_080A4874: .4byte gUnknown_02038559
_080A4878:
	movs r0, 0
	movs r1, 0x1
	bl sub_80F979C
_080A4880:
	ldr r0, _080A48A4 @ =gUnknown_03000701
	ldrb r0, [r0]
	cmp r0, 0x5
	beq _080A48B0
	ldr r1, _080A48A8 @ =gUnknown_03005D10
	ldr r0, _080A48AC @ =gUnknown_02038559
	ldrb r0, [r0]
	lsls r0, 24
	asrs r0, 24
	lsls r0, 2
	adds r0, r1
	ldrb r1, [r0, 0x1]
	adds r1, 0x8
	ldrb r0, [r0, 0x2]
	adds r0, 0x1
	cmp r1, r0
	blt _080A48C6
	b _080A48D8
	.align 2, 0
_080A48A4: .4byte gUnknown_03000701
_080A48A8: .4byte gUnknown_03005D10
_080A48AC: .4byte gUnknown_02038559
_080A48B0:
	ldr r2, _080A48D0 @ =gUnknown_03005D10
	ldr r0, _080A48D4 @ =gUnknown_02038559
	movs r1, 0
	ldrsb r1, [r0, r1]
	lsls r1, 2
	adds r1, r2
	ldrb r0, [r1, 0x1]
	adds r0, 0x8
	ldrb r1, [r1, 0x2]
	cmp r0, r1
	bge _080A48D8
_080A48C6:
	movs r0, 0x1
	movs r1, 0
	bl sub_80F979C
	b _080A48E0
	.align 2, 0
_080A48D0: .4byte gUnknown_03005D10
_080A48D4: .4byte gUnknown_02038559
_080A48D8:
	movs r0, 0x1
	movs r1, 0x1
	bl sub_80F979C
_080A48E0:
	pop {r4,r5}
	pop {r0}
	bx r0
	thumb_func_end sub_80A47E8

	thumb_func_start sub_80A48E8
sub_80A48E8: @ 80A48E8
	push {lr}
	lsls r0, 16
	lsrs r0, 16
	movs r3, 0
	bl sub_80A47E8
	pop {r0}
	bx r0
	thumb_func_end sub_80A48E8

	thumb_func_start sub_80A48F8
sub_80A48F8: @ 80A48F8
	push {lr}
	lsls r0, 16
	lsrs r0, 16
	movs r1, 0
	movs r2, 0x5
	movs r3, 0x2
	bl sub_80A47E8
	pop {r0}
	bx r0
	thumb_func_end sub_80A48F8

	thumb_func_start ItemListMenu_InitDescription
ItemListMenu_InitDescription: @ 80A490C
	push {r4,r5,lr}
	sub sp, 0x4
	lsls r0, 16
	lsrs r3, r0, 16
	ldr r1, _080A4960 @ =gUnknown_03005D10
	ldr r0, _080A4964 @ =gUnknown_02038559
	ldrb r0, [r0]
	lsls r0, 24
	asrs r0, 24
	lsls r0, 2
	adds r0, r1
	ldrb r1, [r0, 0x1]
	ldrb r2, [r0]
	adds r1, r2
	ldrb r0, [r0, 0x2]
	cmp r1, r0
	bne _080A4974
	ldr r0, _080A4968 @ =gOtherText_ReturnTo
	movs r4, 0x1
	str r4, [sp]
	movs r1, 0x4
	movs r2, 0x68
	movs r3, 0x68
	bl sub_8072A18
	lsls r0, 24
	lsrs r5, r0, 24
	ldr r1, _080A496C @ =gUnknown_0840E740
	ldr r0, _080A4970 @ =gUnknown_03000701
	ldrb r0, [r0]
	lsls r0, 2
	adds r0, r1
	ldr r0, [r0]
	str r4, [sp]
	movs r1, 0x4
	movs r2, 0x78
	movs r3, 0x68
	bl sub_8072A18
	adds r0, r5, r0
	b _080A4988
	.align 2, 0
_080A4960: .4byte gUnknown_03005D10
_080A4964: .4byte gUnknown_02038559
_080A4968: .4byte gOtherText_ReturnTo
_080A496C: .4byte gUnknown_0840E740
_080A4970: .4byte gUnknown_03000701
_080A4974:
	adds r0, r3, 0
	bl ItemId_GetDescription
	movs r1, 0x1
	str r1, [sp]
	movs r1, 0x4
	movs r2, 0x68
	movs r3, 0x68
	bl sub_8072A18
_080A4988:
	lsls r0, 24
	lsrs r5, r0, 24
	cmp r5, 0x2
	bhi _080A49A4
	lsls r1, r5, 25
	movs r0, 0xD0
	lsls r0, 20
	adds r1, r0
	lsrs r1, 24
	movs r0, 0
	movs r2, 0xD
	movs r3, 0x14
	bl MenuZeroFillWindowRect
_080A49A4:
	add sp, 0x4
	pop {r4,r5}
	pop {r0}
	bx r0
	thumb_func_end ItemListMenu_InitDescription

	thumb_func_start ItemListMenu_ChangeDescription
ItemListMenu_ChangeDescription: @ 80A49AC
	push {r4,r5,lr}
	sub sp, 0x64
	adds r4, r1, 0
	lsls r0, 16
	lsrs r5, r0, 16
	ldr r1, _080A49E8 @ =gUnknown_03005D10
	ldr r0, _080A49EC @ =gUnknown_02038559
	ldrb r0, [r0]
	lsls r0, 24
	asrs r0, 24
	lsls r0, 2
	adds r0, r1
	ldrb r1, [r0, 0x1]
	ldrb r2, [r0]
	adds r1, r2
	ldrb r0, [r0, 0x2]
	cmp r1, r0
	bne _080A4A18
	cmp r4, 0
	bne _080A49F4
	movs r0, 0
	movs r1, 0xD
	movs r2, 0xD
	movs r3, 0x14
	bl MenuZeroFillWindowRect
	ldr r0, _080A49F0 @ =gOtherText_ReturnTo
	movs r1, 0x4
	movs r2, 0x68
	b _080A4A08
	.align 2, 0
_080A49E8: .4byte gUnknown_03005D10
_080A49EC: .4byte gUnknown_02038559
_080A49F0: .4byte gOtherText_ReturnTo
_080A49F4:
	cmp r4, 0x1
	bne _080A4A4C
	ldr r1, _080A4A10 @ =gUnknown_0840E740
	ldr r0, _080A4A14 @ =gUnknown_03000701
	ldrb r0, [r0]
	lsls r0, 2
	adds r0, r1
	ldr r0, [r0]
	movs r1, 0x4
	movs r2, 0x78
_080A4A08:
	movs r3, 0
	bl MenuPrint_PixelCoords
	b _080A4A4C
	.align 2, 0
_080A4A10: .4byte gUnknown_0840E740
_080A4A14: .4byte gUnknown_03000701
_080A4A18:
	cmp r4, 0
	bne _080A4A28
	movs r0, 0
	movs r1, 0xD
	movs r2, 0xD
	movs r3, 0x14
	bl MenuZeroFillWindowRect
_080A4A28:
	lsls r1, r5, 16
	asrs r1, 16
	mov r0, sp
	adds r2, r4, 0
	bl ItemId_CopyDescription
	cmp r0, 0
	beq _080A4A4C
	lsls r2, r4, 20
	movs r0, 0xD0
	lsls r0, 15
	adds r2, r0
	lsrs r2, 16
	mov r0, sp
	movs r1, 0x4
	movs r3, 0
	bl MenuPrint_PixelCoords
_080A4A4C:
	add sp, 0x64
	pop {r4,r5}
	pop {r0}
	bx r0
	thumb_func_end ItemListMenu_ChangeDescription

	thumb_func_start sub_80A4A54
sub_80A4A54: @ 80A4A54
	push {r4,r5,lr}
	adds r5, r0, 0
	adds r4, r2, 0x1
	adds r2, r1, 0
	adds r1, r5, 0
_080A4A5E:
	ldrb r3, [r2]
	adds r0, r3, 0x2
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bhi _080A4A8A
	subs r4, 0x1
	cmp r4, 0
	bne _080A4A78
	movs r0, 0xFF
	strb r0, [r1]
	movs r0, 0x1
	b _080A4A92
_080A4A78:
	lsls r0, r3, 24
	lsrs r0, 24
	cmp r0, 0xFF
	bne _080A4A84
	movs r0, 0
	b _080A4A92
_080A4A84:
	adds r1, r5, 0
	adds r2, 0x1
	b _080A4A5E
_080A4A8A:
	strb r3, [r1]
	adds r2, 0x1
	adds r1, 0x1
	b _080A4A5E
_080A4A92:
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end sub_80A4A54

	thumb_func_start sub_80A4A98
sub_80A4A98: @ 80A4A98
	push {r4,r5,lr}
	sub sp, 0x64
	adds r5, r0, 0
	adds r4, r1, 0
	cmp r4, 0
	bne _080A4AB0
	movs r0, 0
	movs r1, 0xD
	movs r2, 0xD
	movs r3, 0x14
	bl MenuZeroFillWindowRect
_080A4AB0:
	mov r0, sp
	adds r1, r5, 0
	adds r2, r4, 0
	bl sub_80A4A54
	cmp r0, 0
	beq _080A4AD2
	lsls r2, r4, 20
	movs r0, 0xD0
	lsls r0, 15
	adds r2, r0
	lsrs r2, 16
	mov r0, sp
	movs r1, 0x4
	movs r3, 0
	bl MenuPrint_PixelCoords
_080A4AD2:
	add sp, 0x64
	pop {r4,r5}
	pop {r0}
	bx r0
	thumb_func_end sub_80A4A98

	thumb_func_start sub_80A4ADC
sub_80A4ADC: @ 80A4ADC
	push {lr}
	lsls r0, 24
	lsrs r0, 24
	ldr r2, _080A4B0C @ =gTasks
	lsls r1, r0, 2
	adds r1, r0
	lsls r1, 3
	adds r1, r2
	movs r2, 0x1C
	ldrsh r0, [r1, r2]
	cmp r0, 0
	bne _080A4AFA
	movs r0, 0
	bl sub_80A7528
_080A4AFA:
	movs r0, 0x5
	bl PlaySE
	ldr r1, _080A4B10 @ =gUnknown_0203855C
	movs r0, 0x1
	strb r0, [r1]
	pop {r0}
	bx r0
	.align 2, 0
_080A4B0C: .4byte gTasks
_080A4B10: .4byte gUnknown_0203855C
	thumb_func_end sub_80A4ADC

	thumb_func_start sub_80A4B14
sub_80A4B14: @ 80A4B14
	push {r4,lr}
	adds r4, r1, 0
	lsls r0, 24
	lsls r4, 24
	lsrs r4, 24
	ldr r2, _080A4B50 @ =gUnknown_03005D10
	ldr r1, _080A4B54 @ =gUnknown_02038559
	ldrb r1, [r1]
	lsls r1, 24
	asrs r1, 24
	lsls r1, 2
	adds r1, r2
	lsrs r0, 24
	ldrb r2, [r1, 0x1]
	adds r0, r2
	strb r0, [r1, 0x1]
	movs r0, 0
	bl MoveMenuCursor
	bl sub_80A73C0
	bl sub_80A763C
	adds r0, r4, 0
	bl sub_80A4ADC
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080A4B50: .4byte gUnknown_03005D10
_080A4B54: .4byte gUnknown_02038559
	thumb_func_end sub_80A4B14

	thumb_func_start sub_80A4B58
sub_80A4B58: @ 80A4B58
	push {r4,lr}
	adds r4, r1, 0
	lsls r4, 24
	lsrs r4, 24
	lsls r0, 24
	asrs r0, 24
	bl MoveMenuCursor
	ldr r2, _080A4B88 @ =gUnknown_03005D10
	ldr r1, _080A4B8C @ =gUnknown_02038559
	ldrb r1, [r1]
	lsls r1, 24
	asrs r1, 24
	lsls r1, 2
	adds r1, r2
	strb r0, [r1]
	bl sub_80A73C0
	adds r0, r4, 0
	bl sub_80A4ADC
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080A4B88: .4byte gUnknown_03005D10
_080A4B8C: .4byte gUnknown_02038559
	thumb_func_end sub_80A4B58

	thumb_func_start sub_80A4B90
sub_80A4B90: @ 80A4B90
	push {r4,lr}
	lsls r0, 16
	lsrs r4, r0, 16
	movs r0, 0x6
	bl TestPlayerAvatarFlags
	lsls r0, 24
	cmp r0, 0
	beq _080A4BBC
	ldr r0, _080A4BB4 @ =0x00000103
	cmp r4, r0
	beq _080A4BAE
	adds r0, 0xD
	cmp r4, r0
	bne _080A4BBC
_080A4BAE:
	ldr r0, _080A4BB8 @ =gOtherText_Walk
	b _080A4BE6
	.align 2, 0
_080A4BB4: .4byte 0x00000103
_080A4BB8: .4byte gOtherText_Walk
_080A4BBC:
	adds r0, r4, 0
	bl ItemIsMail
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	beq _080A4BE4
	ldr r1, _080A4BDC @ =gUnknown_083C1640
	ldr r0, _080A4BE0 @ =gUnknown_03000704
	ldr r0, [r0]
	ldrb r0, [r0]
	lsls r0, 3
	adds r0, r1
	ldr r0, [r0]
	b _080A4BE6
	.align 2, 0
_080A4BDC: .4byte gUnknown_083C1640
_080A4BE0: .4byte gUnknown_03000704
_080A4BE4:
	ldr r0, _080A4BEC @ =gOtherText_Check
_080A4BE6:
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_080A4BEC: .4byte gOtherText_Check
	thumb_func_end sub_80A4B90

	thumb_func_start sub_80A4BF0
sub_80A4BF0: @ 80A4BF0
	push {r4-r7,lr}
	sub sp, 0x8
	adds r5, r0, 0
	ldr r7, _080A4C38 @ =gUnknown_02038564
	ldrb r4, [r7]
	cmp r4, 0x4
	beq _080A4C00
	b _080A4CF8
_080A4C00:
	movs r0, 0
	movs r1, 0x7
	movs r2, 0xD
	movs r3, 0xC
	bl MenuDrawTextWindow
	str r4, [sp]
	adds r0, r5, 0
	movs r1, 0x1
	movs r2, 0x8
	movs r3, 0xC
	bl sub_80A4008
	bl sub_80F9344
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _080A4C40
	ldr r0, _080A4C3C @ =gUnknown_03000701
	ldrb r0, [r0]
	cmp r0, 0x5
	bne _080A4C40
	movs r0, 0x1
	movs r1, 0
	bl sub_80A7834
	b _080A4CA0
	.align 2, 0
_080A4C38: .4byte gUnknown_02038564
_080A4C3C: .4byte gUnknown_03000701
_080A4C40:
	movs r6, 0
	ldr r0, _080A4C5C @ =gUnknown_02038564
	ldrb r0, [r0]
	cmp r6, r0
	bcs _080A4CA0
	ldr r4, _080A4C60 @ =gUnknown_083C1640
_080A4C4C:
	cmp r6, 0
	bne _080A4C68
	ldr r0, _080A4C64 @ =gScriptItemId
	ldrh r0, [r0]
	bl sub_80A4B90
	adds r3, r0, 0
	b _080A4C76
	.align 2, 0
_080A4C5C: .4byte gUnknown_02038564
_080A4C60: .4byte gUnknown_083C1640
_080A4C64: .4byte gScriptItemId
_080A4C68:
	ldr r0, _080A4CC4 @ =gUnknown_03000704
	ldr r0, [r0]
	adds r0, r6
	ldrb r0, [r0]
	lsls r0, 3
	adds r0, r4
	ldr r3, [r0]
_080A4C76:
	lsrs r0, r6, 1
	lsls r1, r0, 1
	adds r1, r0
	lsls r1, 1
	adds r1, 0x1
	lsls r1, 24
	lsrs r1, 24
	movs r2, 0x1
	ands r2, r6
	lsls r2, 1
	adds r2, 0x8
	adds r0, r3, 0
	bl MenuPrint
	adds r0, r6, 0x1
	lsls r0, 24
	lsrs r6, r0, 24
	ldr r0, _080A4CC8 @ =gUnknown_02038564
	ldrb r0, [r0]
	cmp r6, r0
	bcc _080A4C4C
_080A4CA0:
	ldr r0, _080A4CCC @ =gUnknown_03000701
	ldrb r0, [r0]
	cmp r0, 0x5
	bne _080A4CD4
	ldr r0, _080A4CC8 @ =gUnknown_02038564
	ldrb r3, [r0]
	ldr r0, _080A4CD0 @ =gUnknown_03000700
	ldrb r0, [r0]
	str r0, [sp]
	movs r0, 0x1
	str r0, [sp, 0x4]
	movs r0, 0
	movs r1, 0x1
	movs r2, 0x8
	bl InitMenu
	b _080A4CEA
	.align 2, 0
_080A4CC4: .4byte gUnknown_03000704
_080A4CC8: .4byte gUnknown_02038564
_080A4CCC: .4byte gUnknown_03000701
_080A4CD0: .4byte gUnknown_03000700
_080A4CD4:
	ldr r0, _080A4CF4 @ =gUnknown_02038564
	ldrb r3, [r0]
	movs r0, 0
	str r0, [sp]
	movs r0, 0x1
	str r0, [sp, 0x4]
	movs r0, 0
	movs r1, 0x1
	movs r2, 0x8
	bl InitMenu
_080A4CEA:
	movs r0, 0x2F
	bl sub_8072DCC
	b _080A4D8A
	.align 2, 0
_080A4CF4: .4byte gUnknown_02038564
_080A4CF8:
	movs r0, 0
	movs r1, 0x5
	movs r2, 0xD
	movs r3, 0xC
	bl MenuDrawTextWindow
	movs r0, 0x6
	str r0, [sp]
	adds r0, r5, 0
	movs r1, 0x1
	movs r2, 0x6
	movs r3, 0xC
	bl sub_80A4008
	movs r6, 0
	ldrb r7, [r7]
	cmp r6, r7
	bcs _080A4D6E
	ldr r7, _080A4D98 @ =gUnknown_083C1640
_080A4D1E:
	ldr r0, _080A4D9C @ =gUnknown_03000704
	ldr r0, [r0]
	adds r0, r6
	ldrb r0, [r0]
	lsls r0, 3
	adds r0, r7
	ldr r5, [r0]
	adds r0, r6, 0
	movs r1, 0x3
	bl __udivsi3
	lsls r0, 24
	lsrs r0, 24
	lsls r4, r0, 1
	adds r4, r0
	lsls r4, 1
	adds r4, 0x1
	lsls r4, 24
	lsrs r4, 24
	adds r0, r6, 0
	movs r1, 0x3
	bl __umodsi3
	adds r2, r0, 0
	lsls r2, 25
	movs r0, 0xC0
	lsls r0, 19
	adds r2, r0
	lsrs r2, 24
	adds r0, r5, 0
	adds r1, r4, 0
	bl MenuPrint
	adds r0, r6, 0x1
	lsls r0, 24
	lsrs r6, r0, 24
	ldr r0, _080A4DA0 @ =gUnknown_02038564
	ldrb r0, [r0]
	cmp r6, r0
	bcc _080A4D1E
_080A4D6E:
	ldr r0, _080A4DA0 @ =gUnknown_02038564
	ldrb r3, [r0]
	movs r0, 0
	str r0, [sp]
	movs r0, 0x1
	str r0, [sp, 0x4]
	movs r0, 0
	movs r1, 0x1
	movs r2, 0x6
	bl InitMenu
	movs r0, 0x2F
	bl sub_8072DCC
_080A4D8A:
	movs r0, 0x2
	bl sub_80A7528
	add sp, 0x8
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080A4D98: .4byte gUnknown_083C1640
_080A4D9C: .4byte gUnknown_03000704
_080A4DA0: .4byte gUnknown_02038564
	thumb_func_end sub_80A4BF0

	thumb_func_start sub_80A4DA4
sub_80A4DA4: @ 80A4DA4
	push {r4,lr}
	sub sp, 0x4
	adds r4, r0, 0
	bl sub_80A73FC
	movs r0, 0x6
	str r0, [sp]
	adds r0, r4, 0
	movs r1, 0
	movs r2, 0x6
	movs r3, 0xD
	bl sub_80A36B8
	movs r0, 0
	movs r1, 0x5
	movs r2, 0xD
	movs r3, 0xC
	bl MenuZeroFillWindowRect
	bl sub_80A7590
	add sp, 0x4
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end sub_80A4DA4

	thumb_func_start sub_80A4DD8
sub_80A4DD8: @ 80A4DD8
	push {r4-r6,lr}
	mov r6, r10
	mov r5, r9
	mov r4, r8
	push {r4-r6}
	sub sp, 0x4
	adds r4, r1, 0
	adds r1, r2, 0
	adds r6, r3, 0
	ldr r5, [sp, 0x20]
	ldr r2, [sp, 0x24]
	lsls r0, 24
	lsrs r0, 24
	lsls r4, 24
	lsrs r4, 24
	lsls r1, 24
	lsrs r1, 24
	lsls r6, 24
	lsrs r6, 24
	lsls r5, 24
	lsrs r5, 24
	lsls r2, 24
	lsrs r2, 24
	mov r10, r2
	ldr r3, _080A4E84 @ =gTasks
	lsls r2, r0, 2
	adds r2, r0
	lsls r2, 3
	adds r2, r3
	movs r0, 0x1
	strh r0, [r2, 0xA]
	adds r0, r4, 0x2
	mov r9, r0
	strh r0, [r2, 0xC]
	adds r0, r1, 0x1
	mov r8, r0
	strh r0, [r2, 0xE]
	adds r2, r4, r6
	lsls r2, 24
	lsrs r2, 24
	adds r3, r1, r5
	lsls r3, 24
	lsrs r3, 24
	adds r0, r4, 0
	bl MenuDrawTextWindow
	ldr r0, _080A4E88 @ =gBGTilemapBuffers + 0x800
	adds r4, 0x1
	lsls r4, 24
	lsrs r4, 24
	mov r1, r8
	lsls r1, 24
	lsrs r1, 24
	mov r8, r1
	subs r6, 0x1
	lsls r6, 24
	lsrs r6, 24
	subs r5, 0x1
	lsls r5, 24
	lsrs r5, 24
	str r5, [sp]
	adds r1, r4, 0
	mov r2, r8
	adds r3, r6, 0
	bl sub_80A4008
	mov r2, r9
	lsls r2, 24
	lsrs r2, 24
	mov r9, r2
	mov r0, r10
	str r0, [sp]
	movs r0, 0x1
	movs r1, 0x1
	mov r3, r8
	bl sub_80A418C
	add sp, 0x4
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_080A4E84: .4byte gTasks
_080A4E88: .4byte gBGTilemapBuffers + 0x800
	thumb_func_end sub_80A4DD8

	thumb_func_start sub_80A4E8C
sub_80A4E8C: @ 80A4E8C
	push {r4-r6,lr}
	adds r4, r0, 0
	adds r6, r1, 0
	lsls r4, 24
	lsrs r4, 24
	lsls r6, 24
	lsrs r6, 24
	movs r0, 0x5
	bl PlaySE
	movs r0, 0
	movs r1, 0x1
	bl sub_80F979C
	movs r0, 0x1
	movs r1, 0x1
	bl sub_80F979C
	movs r0, 0x2
	movs r1, 0x1
	bl sub_80F979C
	movs r0, 0x3
	movs r1, 0x1
	bl sub_80F979C
	movs r0, 0
	bl PauseVerticalScrollIndicator
	movs r0, 0x1
	bl PauseVerticalScrollIndicator
	movs r0, 0x2
	bl PauseVerticalScrollIndicator
	movs r0, 0x3
	bl PauseVerticalScrollIndicator
	ldr r5, _080A4F04 @ =gBGTilemapBuffers + 0x1000
	lsls r4, 24
	asrs r4, 24
	adds r0, r5, 0
	adds r1, r4, 0
	bl sub_80A3B04
	ldr r0, _080A4F08 @ =gUnknown_02038559
	ldrb r1, [r0]
	adds r0, r5, 0
	bl sub_80A3AC0
	bl sub_80A3770
	bl sub_80A7C64
	adds r0, r6, 0
	bl CreateBagPokeballSprite
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_080A4F04: .4byte gBGTilemapBuffers + 0x1000
_080A4F08: .4byte gUnknown_02038559
	thumb_func_end sub_80A4E8C

	thumb_func_start sub_80A4F0C
sub_80A4F0C: @ 80A4F0C
	push {r4,lr}
	ldr r0, _080A4F38 @ =gUnknown_03000701
	ldrb r0, [r0]
	subs r0, 0x4
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bls _080A4F60
	ldr r4, _080A4F3C @ =gMain
	ldrh r0, [r4, 0x2E]
	cmp r0, 0x10
	beq _080A4F30
	bl sub_80F9284
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x2
	bne _080A4F40
_080A4F30:
	movs r0, 0x1
	movs r1, 0x2
	b _080A4F58
	.align 2, 0
_080A4F38: .4byte gUnknown_03000701
_080A4F3C: .4byte gMain
_080A4F40:
	ldrh r0, [r4, 0x2E]
	cmp r0, 0x20
	beq _080A4F52
	bl sub_80F9284
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _080A4F60
_080A4F52:
	movs r0, 0x1
	negs r0, r0
	movs r1, 0x1
_080A4F58:
	bl sub_80A4E8C
	movs r0, 0x1
	b _080A4F62
_080A4F60:
	movs r0, 0
_080A4F62:
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end sub_80A4F0C

	thumb_func_start sub_80A4F68
sub_80A4F68: @ 80A4F68
	push {lr}
	bl sub_80A4F0C
	pop {r0}
	bx r0
	thumb_func_end sub_80A4F68

	thumb_func_start sub_80A4F74
sub_80A4F74: @ 80A4F74
	push {r4,r5,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	adds r2, r4, 0
	movs r5, 0
	ldr r0, _080A4FAC @ =gMain
	ldrh r0, [r0, 0x30]
	movs r1, 0xF0
	ands r1, r0
	cmp r1, 0x40
	bne _080A4FE8
	ldr r1, _080A4FB0 @ =gUnknown_03005D10
	ldr r0, _080A4FB4 @ =gUnknown_02038559
	ldrb r0, [r0]
	lsls r0, 24
	asrs r0, 24
	lsls r0, 2
	adds r1, r0, r1
	ldrb r0, [r1]
	cmp r0, 0
	beq _080A4FB8
	movs r0, 0x1
	negs r0, r0
	adds r1, r4, 0
	bl sub_80A4B58
	b _080A4FC8
	.align 2, 0
_080A4FAC: .4byte gMain
_080A4FB0: .4byte gUnknown_03005D10
_080A4FB4: .4byte gUnknown_02038559
_080A4FB8:
	ldrb r0, [r1, 0x1]
	cmp r0, 0
	beq _080A4FC8
	movs r0, 0x1
	negs r0, r0
	adds r1, r4, 0
	bl sub_80A4B14
_080A4FC8:
	ldr r0, _080A4FE0 @ =gLinkOpen
	ldrb r0, [r0]
	cmp r0, 0x1
	bne _080A50AE
	ldr r1, _080A4FE4 @ =gMain
	ldrh r0, [r1, 0x32]
	cmp r0, 0x5
	bne _080A50AE
	movs r0, 0xB
	strh r0, [r1, 0x32]
	b _080A50AE
	.align 2, 0
_080A4FE0: .4byte gLinkOpen
_080A4FE4: .4byte gMain
_080A4FE8:
	cmp r1, 0x80
	bne _080A5088
	ldr r0, _080A5020 @ =gUnknown_03000701
	ldrb r0, [r0]
	cmp r0, 0x5
	beq _080A502C
	ldr r1, _080A5024 @ =gUnknown_03005D10
	ldr r0, _080A5028 @ =gUnknown_02038559
	ldrb r0, [r0]
	lsls r0, 24
	asrs r0, 24
	lsls r0, 2
	adds r2, r0, r1
	ldrb r0, [r2]
	ldrb r1, [r2, 0x3]
	cmp r0, r1
	bne _080A504E
	ldrb r0, [r2, 0x1]
	ldrb r1, [r2]
	adds r0, r1
	ldrb r2, [r2, 0x2]
	cmp r0, r2
	beq _080A5068
	movs r0, 0x1
	adds r1, r4, 0
	bl sub_80A4B14
	b _080A5068
	.align 2, 0
_080A5020: .4byte gUnknown_03000701
_080A5024: .4byte gUnknown_03005D10
_080A5028: .4byte gUnknown_02038559
_080A502C:
	ldr r1, _080A5058 @ =gUnknown_03005D10
	ldr r0, _080A505C @ =gUnknown_02038559
	ldrb r0, [r0]
	lsls r0, 24
	asrs r0, 24
	lsls r0, 2
	adds r2, r0, r1
	ldrb r1, [r2, 0x1]
	ldrb r3, [r2]
	adds r1, r3
	ldrb r0, [r2, 0x2]
	subs r0, 0x1
	cmp r1, r0
	beq _080A5068
	ldrb r2, [r2, 0x3]
	cmp r3, r2
	beq _080A5060
_080A504E:
	movs r0, 0x1
	adds r1, r4, 0
	bl sub_80A4B58
	b _080A5068
	.align 2, 0
_080A5058: .4byte gUnknown_03005D10
_080A505C: .4byte gUnknown_02038559
_080A5060:
	movs r0, 0x1
	adds r1, r4, 0
	bl sub_80A4B14
_080A5068:
	movs r5, 0x1
	ldr r0, _080A5080 @ =gLinkOpen
	ldrb r0, [r0]
	cmp r0, 0x1
	bne _080A50C0
	ldr r1, _080A5084 @ =gMain
	ldrh r0, [r1, 0x32]
	cmp r0, 0x5
	bne _080A50C0
	movs r0, 0xB
	strh r0, [r1, 0x32]
	b _080A50C0
	.align 2, 0
_080A5080: .4byte gLinkOpen
_080A5084: .4byte gMain
_080A5088:
	ldr r0, _080A50B4 @ =gTasks
	lsls r1, r2, 2
	adds r1, r2
	lsls r1, 3
	adds r4, r1, r0
	movs r1, 0x1C
	ldrsh r0, [r4, r1]
	cmp r0, 0
	bne _080A50BC
	bl sub_80A4F0C
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _080A50BC
	bl sub_80A73F0
	ldr r0, _080A50B8 @ =sub_80A4F68
	str r0, [r4]
_080A50AE:
	movs r5, 0x1
	b _080A50C0
	.align 2, 0
_080A50B4: .4byte gTasks
_080A50B8: .4byte sub_80A4F68
_080A50BC:
	bl sub_80A73C0
_080A50C0:
	adds r0, r5, 0
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end sub_80A4F74

	thumb_func_start sub_80A50C8
sub_80A50C8: @ 80A50C8
	push {r4-r7,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	lsls r0, r4, 2
	adds r0, r4
	lsls r0, 3
	ldr r1, _080A5148 @ =gTasks + 0x8
	adds r5, r0, r1
	ldr r0, _080A514C @ =gPaletteFade
	ldrb r1, [r0, 0x7]
	movs r0, 0x80
	ands r0, r1
	cmp r0, 0
	beq _080A50E6
	b _080A52BC
_080A50E6:
	adds r0, r4, 0
	bl sub_80A4F74
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _080A50F6
	b _080A526A
_080A50F6:
	ldr r2, _080A5150 @ =gMain
	ldrh r1, [r2, 0x2E]
	movs r0, 0x4
	ands r0, r1
	cmp r0, 0
	beq _080A5190
	ldr r3, _080A5154 @ =gUnknown_02038559
	ldrb r0, [r3]
	subs r0, 0x2
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bls _080A5190
	ldr r0, _080A5158 @ =gUnknown_03000701
	ldrb r0, [r0]
	cmp r0, 0x1
	bhi _080A5190
	movs r1, 0x14
	ldrsh r0, [r5, r1]
	cmp r0, 0
	bne _080A5160
	ldr r1, _080A515C @ =gUnknown_03005D10
	movs r0, 0
	ldrsb r0, [r3, r0]
	lsls r0, 2
	adds r0, r1
	ldrb r1, [r0, 0x1]
	ldrb r2, [r0]
	adds r1, r2
	ldrb r0, [r0, 0x2]
	cmp r1, r0
	bne _080A5138
	b _080A526A
_080A5138:
	movs r0, 0x5
	bl PlaySE
	adds r0, r4, 0
	bl sub_80A3F50
	b _080A526A
	.align 2, 0
_080A5148: .4byte gTasks + 0x8
_080A514C: .4byte gPaletteFade
_080A5150: .4byte gMain
_080A5154: .4byte gUnknown_02038559
_080A5158: .4byte gUnknown_03000701
_080A515C: .4byte gUnknown_03005D10
_080A5160:
	ldr r1, _080A5184 @ =gUnknown_03005D10
	movs r0, 0
	ldrsb r0, [r3, r0]
	lsls r0, 2
	adds r0, r1
	ldrb r1, [r0, 0x1]
	ldrb r2, [r0]
	adds r1, r2
	ldrb r0, [r0, 0x2]
	cmp r1, r0
	beq _080A5188
	movs r0, 0x5
	bl PlaySE
	adds r0, r4, 0
	bl sub_80A3E90
	b _080A526A
	.align 2, 0
_080A5184: .4byte gUnknown_03005D10
_080A5188:
	adds r0, r4, 0
	bl sub_80A3EF4
	b _080A526A
_080A5190:
	ldrh r2, [r2, 0x2E]
	movs r0, 0x1
	ands r0, r2
	cmp r0, 0
	beq _080A5272
	ldr r7, _080A51D4 @ =gUnknown_03005D10
	ldr r6, _080A51D8 @ =gUnknown_02038559
	movs r0, 0
	ldrsb r0, [r6, r0]
	lsls r0, 2
	adds r0, r7
	ldrb r1, [r0, 0x1]
	ldrb r2, [r0]
	adds r1, r2
	ldrb r0, [r0, 0x2]
	cmp r1, r0
	bne _080A51F0
	movs r0, 0x14
	ldrsh r1, [r5, r0]
	cmp r1, 0
	bne _080A51E8
	ldr r0, _080A51DC @ =gScriptItemId
	strh r1, [r0]
	ldr r1, _080A51E0 @ =gUnknown_083C16BC
	ldr r0, _080A51E4 @ =gUnknown_03000701
	ldrb r0, [r0]
	lsls r0, 3
	adds r1, 0x4
	adds r0, r1
	ldr r1, [r0]
	adds r0, r4, 0
	bl _call_via_r1
	b _080A526A
	.align 2, 0
_080A51D4: .4byte gUnknown_03005D10
_080A51D8: .4byte gUnknown_02038559
_080A51DC: .4byte gScriptItemId
_080A51E0: .4byte gUnknown_083C16BC
_080A51E4: .4byte gUnknown_03000701
_080A51E8:
	adds r0, r4, 0
	bl sub_80A3EF4
	b _080A526A
_080A51F0:
	movs r1, 0x14
	ldrsh r0, [r5, r1]
	cmp r0, 0
	bne _080A5264
	movs r0, 0x5
	bl PlaySE
	ldr r2, _080A5250 @ =gUnknown_02038560
	movs r1, 0
	ldrsb r1, [r6, r1]
	lsls r1, 2
	adds r1, r7
	ldrb r0, [r1]
	ldrb r1, [r1, 0x1]
	adds r0, r1
	strb r0, [r2]
	ldr r3, _080A5254 @ =gScriptItemId
	ldrb r0, [r2]
	ldr r1, _080A5258 @ =gUnknown_03005D24
	ldr r1, [r1]
	lsls r0, 2
	adds r0, r1
	ldrh r0, [r0]
	strh r0, [r3]
	ldr r1, _080A525C @ =gUnknown_083C16BC
	ldr r0, _080A5260 @ =gUnknown_03000701
	ldrb r0, [r0]
	lsls r0, 3
	adds r0, r1
	ldr r1, [r0]
	adds r0, r4, 0
	bl _call_via_r1
	movs r0, 0
	bl sub_80F98A4
	movs r0, 0x1
	bl sub_80F98A4
	movs r0, 0x2
	bl sub_80F98A4
	movs r0, 0x3
	bl sub_80F98A4
	bl sub_80A797C
	b _080A526A
	.align 2, 0
_080A5250: .4byte gUnknown_02038560
_080A5254: .4byte gScriptItemId
_080A5258: .4byte gUnknown_03005D24
_080A525C: .4byte gUnknown_083C16BC
_080A5260: .4byte gUnknown_03000701
_080A5264:
	adds r0, r4, 0
	bl sub_80A3E90
_080A526A:
	adds r0, r4, 0
	bl sub_808B5B4
	b _080A52BC
_080A5272:
	movs r0, 0x2
	ands r0, r2
	cmp r0, 0
	beq _080A52BC
	movs r0, 0x14
	ldrsh r1, [r5, r0]
	cmp r1, 0
	bne _080A52B0
	ldr r2, _080A52A4 @ =gUnknown_03000701
	ldrb r0, [r2]
	cmp r0, 0x5
	beq _080A52B6
	ldr r0, _080A52A8 @ =gScriptItemId
	strh r1, [r0]
	ldr r1, _080A52AC @ =gUnknown_083C16BC
	ldrb r0, [r2]
	lsls r0, 3
	adds r1, 0x4
	adds r0, r1
	ldr r1, [r0]
	adds r0, r4, 0
	bl _call_via_r1
	b _080A52B6
	.align 2, 0
_080A52A4: .4byte gUnknown_03000701
_080A52A8: .4byte gScriptItemId
_080A52AC: .4byte gUnknown_083C16BC
_080A52B0:
	adds r0, r4, 0
	bl sub_80A3EF4
_080A52B6:
	adds r0, r4, 0
	bl sub_808B5B4
_080A52BC:
	pop {r4-r7}
	pop {r0}
	bx r0
	thumb_func_end sub_80A50C8

	thumb_func_start sub_80A52C4
sub_80A52C4: @ 80A52C4
	push {r4,lr}
	lsls r0, 24
	lsrs r0, 24
	lsls r1, 16
	lsrs r3, r1, 16
	adds r4, r3, 0
	lsls r1, r0, 2
	adds r1, r0
	lsls r1, 3
	ldr r0, _080A52F4 @ =gTasks + 0x8
	adds r1, r0
	ldr r0, _080A52F8 @ =gMain
	ldrh r0, [r0, 0x30]
	movs r2, 0xF0
	ands r2, r0
	cmp r2, 0x40
	bne _080A52FC
	movs r2, 0x2
	ldrsh r0, [r1, r2]
	cmp r0, r3
	beq _080A533E
	ldrh r0, [r1, 0x2]
	adds r0, 0x1
	b _080A5340
	.align 2, 0
_080A52F4: .4byte gTasks + 0x8
_080A52F8: .4byte gMain
_080A52FC:
	cmp r2, 0x80
	bne _080A5312
	ldrh r2, [r1, 0x2]
	movs r4, 0x2
	ldrsh r0, [r1, r4]
	cmp r0, 0x1
	beq _080A530E
	subs r0, r2, 0x1
	b _080A5340
_080A530E:
	strh r3, [r1, 0x2]
	b _080A5342
_080A5312:
	cmp r2, 0x10
	bne _080A532A
	movs r2, 0x2
	ldrsh r0, [r1, r2]
	adds r0, 0xA
	cmp r0, r3
	bge _080A5326
	ldrh r0, [r1, 0x2]
	adds r0, 0xA
	b _080A5340
_080A5326:
	strh r4, [r1, 0x2]
	b _080A5342
_080A532A:
	cmp r2, 0x20
	bne _080A5346
	ldrh r2, [r1, 0x2]
	movs r3, 0x2
	ldrsh r0, [r1, r3]
	cmp r0, 0xA
	ble _080A533E
	adds r0, r2, 0
	subs r0, 0xA
	b _080A5340
_080A533E:
	movs r0, 0x1
_080A5340:
	strh r0, [r1, 0x2]
_080A5342:
	movs r0, 0x1
	b _080A5348
_080A5346:
	movs r0, 0
_080A5348:
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end sub_80A52C4

	thumb_func_start sub_80A5350
sub_80A5350: @ 80A5350
	push {r4,lr}
	sub sp, 0x4
	lsls r0, 24
	lsrs r0, 24
	lsls r1, r0, 2
	adds r1, r0
	lsls r1, 3
	ldr r2, _080A539C @ =gTasks + 0x8
	adds r4, r1, r2
	ldr r1, _080A53A0 @ =gUnknown_02038560
	ldrb r1, [r1]
	ldr r2, _080A53A4 @ =gUnknown_03005D24
	ldr r2, [r2]
	lsls r1, 2
	adds r1, r2
	ldrh r1, [r1, 0x2]
	bl sub_80A52C4
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _080A53C0
	ldr r0, _080A53A8 @ =gUnknown_02038559
	ldrb r0, [r0]
	lsls r0, 24
	asrs r0, 24
	cmp r0, 0x3
	bne _080A53AC
	ldrh r0, [r4, 0x2]
	ldrb r2, [r4, 0x4]
	ldrb r3, [r4, 0x6]
	movs r1, 0x3
	str r1, [sp]
	movs r1, 0x1
	bl sub_80A418C
	b _080A53BC
	.align 2, 0
_080A539C: .4byte gTasks + 0x8
_080A53A0: .4byte gUnknown_02038560
_080A53A4: .4byte gUnknown_03005D24
_080A53A8: .4byte gUnknown_02038559
_080A53AC:
	ldrh r0, [r4, 0x2]
	ldrb r2, [r4, 0x4]
	ldrb r3, [r4, 0x6]
	movs r1, 0x2
	str r1, [sp]
	movs r1, 0x1
	bl sub_80A418C
_080A53BC:
	movs r0, 0x1
	b _080A53C2
_080A53C0:
	movs r0, 0
_080A53C2:
	add sp, 0x4
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end sub_80A5350

	thumb_func_start sub_80A53CC
sub_80A53CC: @ 80A53CC
	push {lr}
	bl sub_80A34B4
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _080A53EA
	bl sub_80A3770
	ldr r0, _080A53F0 @ =sub_80A50C8
	movs r1, 0
	bl CreateTask
	ldr r1, _080A53F4 @ =gUnknown_02038563
	strb r0, [r1]
_080A53EA:
	pop {r0}
	bx r0
	.align 2, 0
_080A53F0: .4byte sub_80A50C8
_080A53F4: .4byte gUnknown_02038563
	thumb_func_end sub_80A53CC

	thumb_func_start sub_80A53F8
sub_80A53F8: @ 80A53F8
	push {lr}
	ldr r0, _080A540C @ =gUnknown_03000701
	movs r1, 0
	strb r1, [r0]
	ldr r0, _080A5410 @ =sub_80A53CC
	bl SetMainCallback2
	pop {r0}
	bx r0
	.align 2, 0
_080A540C: .4byte gUnknown_03000701
_080A5410: .4byte sub_80A53CC
	thumb_func_end sub_80A53F8

	thumb_func_start sub_80A5414
sub_80A5414: @ 80A5414
	push {r4,r5,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	movs r5, 0
	bl sub_80A78A0
	cmp r0, 0
	bne _080A5426
	b _080A5552
_080A5426:
	ldr r2, _080A5460 @ =gMain
	ldrh r0, [r2, 0x30]
	movs r1, 0xF0
	ands r1, r0
	cmp r1, 0x40
	bne _080A546C
	ldr r4, _080A5464 @ =gUnknown_03000700
	ldrb r1, [r4]
	movs r0, 0x1
	ands r0, r1
	cmp r0, 0
	bne _080A5440
	b _080A5552
_080A5440:
	ldrb r1, [r4]
	ldr r0, _080A5468 @ =gUnknown_03000704
	ldr r0, [r0]
	adds r1, r0
	subs r1, 0x1
	ldrb r0, [r1]
	cmp r0, 0x8
	bne _080A5452
	b _080A5552
_080A5452:
	movs r0, 0x5
	bl PlaySE
	movs r0, 0x1
	negs r0, r0
	b _080A54EE
	.align 2, 0
_080A5460: .4byte gMain
_080A5464: .4byte gUnknown_03000700
_080A5468: .4byte gUnknown_03000704
_080A546C:
	cmp r1, 0x80
	bne _080A549C
	ldr r4, _080A5494 @ =gUnknown_03000700
	ldrb r1, [r4]
	movs r0, 0x1
	ands r0, r1
	cmp r0, 0
	bne _080A5552
	ldrb r1, [r4]
	ldr r0, _080A5498 @ =gUnknown_03000704
	ldr r0, [r0]
	adds r1, r0
	ldrb r0, [r1, 0x1]
	cmp r0, 0x8
	beq _080A5552
	movs r0, 0x5
	bl PlaySE
	movs r0, 0x1
	b _080A54EE
	.align 2, 0
_080A5494: .4byte gUnknown_03000700
_080A5498: .4byte gUnknown_03000704
_080A549C:
	cmp r1, 0x20
	bne _080A54CC
	ldr r4, _080A54C4 @ =gUnknown_03000700
	ldrb r0, [r4]
	cmp r0, 0x1
	bls _080A5552
	adds r1, r0, 0
	ldr r0, _080A54C8 @ =gUnknown_03000704
	ldr r0, [r0]
	adds r1, r0
	subs r1, 0x2
	ldrb r0, [r1]
	cmp r0, 0x8
	beq _080A5552
	movs r0, 0x5
	bl PlaySE
	movs r0, 0x2
	negs r0, r0
	b _080A54EE
	.align 2, 0
_080A54C4: .4byte gUnknown_03000700
_080A54C8: .4byte gUnknown_03000704
_080A54CC:
	cmp r1, 0x10
	bne _080A5500
	ldr r4, _080A54F8 @ =gUnknown_03000700
	ldrb r0, [r4]
	cmp r0, 0x1
	bhi _080A5552
	adds r1, r0, 0
	ldr r0, _080A54FC @ =gUnknown_03000704
	ldr r0, [r0]
	adds r1, r0
	ldrb r0, [r1, 0x2]
	cmp r0, 0x8
	beq _080A5552
	movs r0, 0x5
	bl PlaySE
	movs r0, 0x2
_080A54EE:
	bl MoveMenuCursor3
	strb r0, [r4]
	b _080A5552
	.align 2, 0
_080A54F8: .4byte gUnknown_03000700
_080A54FC: .4byte gUnknown_03000704
_080A5500:
	ldrh r1, [r2, 0x2E]
	movs r0, 0x1
	ands r0, r1
	cmp r0, 0
	bne _080A5590
	movs r0, 0x2
	ands r0, r1
	cmp r0, 0
	beq _080A5552
	ldr r1, _080A5570 @ =gTasks
	lsls r0, r4, 2
	adds r0, r4
	lsls r0, 3
	adds r0, r1
	strh r5, [r0, 0x1C]
	ldr r1, _080A5574 @ =gUnknown_03005D10
	ldr r0, _080A5578 @ =gUnknown_02038559
	ldrb r0, [r0]
	lsls r0, 24
	asrs r0, 24
	lsls r0, 2
	adds r0, r1
	ldrb r2, [r0]
	adds r0, r4, 0
	adds r1, r2, 0
	bl sub_80A48E8
	ldr r0, _080A557C @ =gBGTilemapBuffers + 0x800
	bl sub_80A4DA4
	ldr r1, _080A5580 @ =gUnknown_083C1640
	ldr r0, _080A5584 @ =gUnknown_03000704
	ldr r0, [r0]
	ldrb r0, [r0, 0x3]
	lsls r0, 3
	adds r1, 0x4
	adds r0, r1
	ldr r5, [r0]
	adds r0, r4, 0
	bl _call_via_r5
_080A5552:
	cmp r5, 0
	bne _080A55FA
	ldr r0, _080A5588 @ =gUnknown_03000701
	ldrb r0, [r0]
	cmp r0, 0x5
	bne _080A55E0
	ldr r0, _080A558C @ =gUnknown_03000700
	ldrb r0, [r0]
	cmp r0, 0
	bne _080A55D4
	movs r0, 0xC
	bl sub_8072DDC
	b _080A55FA
	.align 2, 0
_080A5570: .4byte gTasks
_080A5574: .4byte gUnknown_03005D10
_080A5578: .4byte gUnknown_02038559
_080A557C: .4byte gBGTilemapBuffers + 0x800
_080A5580: .4byte gUnknown_083C1640
_080A5584: .4byte gUnknown_03000704
_080A5588: .4byte gUnknown_03000701
_080A558C: .4byte gUnknown_03000700
_080A5590:
	ldr r1, _080A55C0 @ =gTasks
	lsls r0, r4, 2
	adds r0, r4
	lsls r0, 3
	adds r0, r1
	strh r5, [r0, 0x1C]
	ldr r0, _080A55C4 @ =gBGTilemapBuffers + 0x800
	bl sub_80A4DA4
	ldr r1, _080A55C8 @ =gUnknown_083C1640
	ldr r0, _080A55CC @ =gUnknown_03000700
	ldrb r2, [r0]
	ldr r0, _080A55D0 @ =gUnknown_03000704
	ldr r0, [r0]
	adds r0, r2
	ldrb r0, [r0]
	lsls r0, 3
	adds r1, 0x4
	adds r0, r1
	ldr r5, [r0]
	adds r0, r4, 0
	bl _call_via_r5
	b _080A5552
	.align 2, 0
_080A55C0: .4byte gTasks
_080A55C4: .4byte gBGTilemapBuffers + 0x800
_080A55C8: .4byte gUnknown_083C1640
_080A55CC: .4byte gUnknown_03000700
_080A55D0: .4byte gUnknown_03000704
_080A55D4:
	cmp r0, 0x1
	bls _080A55E8
	movs r0, 0x30
	bl sub_8072DCC
	b _080A55FA
_080A55E0:
	ldr r0, _080A55F0 @ =gUnknown_03000700
	ldrb r0, [r0]
	cmp r0, 0x1
	bhi _080A55F4
_080A55E8:
	movs r0, 0x2F
	bl sub_8072DCC
	b _080A55FA
	.align 2, 0
_080A55F0: .4byte gUnknown_03000700
_080A55F4:
	movs r0, 0x30
	bl sub_8072DCC
_080A55FA:
	pop {r4,r5}
	pop {r0}
	bx r0
	thumb_func_end sub_80A5414

	thumb_func_start sub_80A5600
sub_80A5600: @ 80A5600
	push {r4,r5,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	movs r5, 0
	ldr r2, _080A563C @ =gMain
	ldrh r0, [r2, 0x30]
	movs r1, 0xF0
	ands r1, r0
	cmp r1, 0x40
	bne _080A5648
	ldr r4, _080A5640 @ =gUnknown_03000700
	ldrb r0, [r4]
	cmp r0, 0
	bne _080A561E
	b _080A5736
_080A561E:
	adds r1, r0, 0
	ldr r0, _080A5644 @ =gUnknown_03000704
	ldr r0, [r0]
	adds r1, r0
	subs r1, 0x1
	ldrb r0, [r1]
	cmp r0, 0x8
	bne _080A5630
	b _080A5736
_080A5630:
	movs r0, 0x5
	bl PlaySE
	movs r0, 0x1
	negs r0, r0
	b _080A56D2
	.align 2, 0
_080A563C: .4byte gMain
_080A5640: .4byte gUnknown_03000700
_080A5644: .4byte gUnknown_03000704
_080A5648:
	cmp r1, 0x80
	bne _080A5680
	ldr r4, _080A5674 @ =gUnknown_03000700
	ldrb r1, [r4]
	ldr r0, _080A5678 @ =gUnknown_02038564
	ldrb r0, [r0]
	subs r0, 0x1
	cmp r1, r0
	beq _080A5736
	cmp r1, 0x2
	beq _080A5736
	ldr r0, _080A567C @ =gUnknown_03000704
	ldr r0, [r0]
	adds r0, r1, r0
	ldrb r0, [r0, 0x1]
	cmp r0, 0x8
	beq _080A5736
	movs r0, 0x5
	bl PlaySE
	movs r0, 0x1
	b _080A56D2
	.align 2, 0
_080A5674: .4byte gUnknown_03000700
_080A5678: .4byte gUnknown_02038564
_080A567C: .4byte gUnknown_03000704
_080A5680:
	cmp r1, 0x20
	bne _080A56B0
	ldr r4, _080A56A8 @ =gUnknown_03000700
	ldrb r0, [r4]
	cmp r0, 0x2
	bls _080A5736
	adds r1, r0, 0
	ldr r0, _080A56AC @ =gUnknown_03000704
	ldr r0, [r0]
	adds r1, r0
	subs r1, 0x3
	ldrb r0, [r1]
	cmp r0, 0x8
	beq _080A5736
	movs r0, 0x5
	bl PlaySE
	movs r0, 0x3
	negs r0, r0
	b _080A56D2
	.align 2, 0
_080A56A8: .4byte gUnknown_03000700
_080A56AC: .4byte gUnknown_03000704
_080A56B0:
	cmp r1, 0x10
	bne _080A56E4
	ldr r4, _080A56DC @ =gUnknown_03000700
	ldrb r0, [r4]
	cmp r0, 0x2
	bhi _080A5736
	adds r1, r0, 0
	ldr r0, _080A56E0 @ =gUnknown_03000704
	ldr r0, [r0]
	adds r1, r0
	ldrb r0, [r1, 0x3]
	cmp r0, 0x8
	beq _080A5736
	movs r0, 0x5
	bl PlaySE
	movs r0, 0x3
_080A56D2:
	bl MoveMenuCursor3
	strb r0, [r4]
	b _080A5736
	.align 2, 0
_080A56DC: .4byte gUnknown_03000700
_080A56E0: .4byte gUnknown_03000704
_080A56E4:
	ldrh r1, [r2, 0x2E]
	movs r0, 0x1
	ands r0, r1
	cmp r0, 0
	bne _080A5768
	movs r0, 0x2
	ands r0, r1
	cmp r0, 0
	beq _080A5736
	ldr r1, _080A574C @ =gTasks
	lsls r0, r4, 2
	adds r0, r4
	lsls r0, 3
	adds r0, r1
	strh r5, [r0, 0x1C]
	ldr r1, _080A5750 @ =gUnknown_03005D10
	ldr r0, _080A5754 @ =gUnknown_02038559
	ldrb r0, [r0]
	lsls r0, 24
	asrs r0, 24
	lsls r0, 2
	adds r0, r1
	ldrb r2, [r0]
	adds r0, r4, 0
	adds r1, r2, 0
	bl sub_80A48E8
	ldr r0, _080A5758 @ =gBGTilemapBuffers + 0x800
	bl sub_80A4DA4
	ldr r1, _080A575C @ =gUnknown_083C1640
	ldr r0, _080A5760 @ =gUnknown_03000704
	ldr r0, [r0]
	ldrb r0, [r0, 0x5]
	lsls r0, 3
	adds r1, 0x4
	adds r0, r1
	ldr r5, [r0]
	adds r0, r4, 0
	bl _call_via_r5
_080A5736:
	cmp r5, 0
	bne _080A57BE
	ldr r0, _080A5764 @ =gUnknown_03000700
	ldrb r0, [r0]
	cmp r0, 0
	bne _080A57AC
	movs r0, 0xC
	bl sub_8072DDC
	b _080A57BE
	.align 2, 0
_080A574C: .4byte gTasks
_080A5750: .4byte gUnknown_03005D10
_080A5754: .4byte gUnknown_02038559
_080A5758: .4byte gBGTilemapBuffers + 0x800
_080A575C: .4byte gUnknown_083C1640
_080A5760: .4byte gUnknown_03000704
_080A5764: .4byte gUnknown_03000700
_080A5768:
	ldr r1, _080A5798 @ =gTasks
	lsls r0, r4, 2
	adds r0, r4
	lsls r0, 3
	adds r0, r1
	strh r5, [r0, 0x1C]
	ldr r0, _080A579C @ =gBGTilemapBuffers + 0x800
	bl sub_80A4DA4
	ldr r1, _080A57A0 @ =gUnknown_083C1640
	ldr r0, _080A57A4 @ =gUnknown_03000700
	ldrb r2, [r0]
	ldr r0, _080A57A8 @ =gUnknown_03000704
	ldr r0, [r0]
	adds r0, r2
	ldrb r0, [r0]
	lsls r0, 3
	adds r1, 0x4
	adds r0, r1
	ldr r5, [r0]
	adds r0, r4, 0
	bl _call_via_r5
	b _080A5736
	.align 2, 0
_080A5798: .4byte gTasks
_080A579C: .4byte gBGTilemapBuffers + 0x800
_080A57A0: .4byte gUnknown_083C1640
_080A57A4: .4byte gUnknown_03000700
_080A57A8: .4byte gUnknown_03000704
_080A57AC:
	cmp r0, 0x2
	bhi _080A57B8
	movs r0, 0x2F
	bl sub_8072DCC
	b _080A57BE
_080A57B8:
	movs r0, 0x30
	bl sub_8072DCC
_080A57BE:
	pop {r4,r5}
	pop {r0}
	bx r0
	thumb_func_end sub_80A5600

	thumb_func_start sub_80A57C4
sub_80A57C4: @ 80A57C4
	push {r4-r6,lr}
	sub sp, 0x8
	ldr r5, _080A57EC @ =gUnknown_03000704
	ldr r0, _080A57F0 @ =gUnknown_02038559
	movs r1, 0
	ldrsb r1, [r0, r1]
	lsls r1, 1
	ldr r4, _080A57F4 @ =gUnknown_083C16AE
	adds r1, r4
	str r1, [r5]
	ldrb r0, [r0]
	lsls r0, 24
	asrs r0, 24
	cmp r0, 0x4
	bne _080A57FC
	ldr r1, _080A57F8 @ =gUnknown_02038564
	movs r0, 0x1
	strb r0, [r1]
	movs r5, 0x9
	b _080A582C
	.align 2, 0
_080A57EC: .4byte gUnknown_03000704
_080A57F0: .4byte gUnknown_02038559
_080A57F4: .4byte gUnknown_083C16AE
_080A57F8: .4byte gUnknown_02038564
_080A57FC:
	ldr r0, _080A581C @ =gScriptItemId
	ldrh r0, [r0]
	bl sub_80F92F4
	lsls r0, 24
	cmp r0, 0
	bne _080A5824
	adds r0, r4, 0
	adds r0, 0x8
	str r0, [r5]
	ldr r1, _080A5820 @ =gUnknown_02038564
	movs r0, 0x1
	strb r0, [r1]
	movs r5, 0x9
	b _080A582C
	.align 2, 0
_080A581C: .4byte gScriptItemId
_080A5820: .4byte gUnknown_02038564
_080A5824:
	ldr r1, _080A5880 @ =gUnknown_02038564
	movs r0, 0x2
	strb r0, [r1]
	movs r5, 0x7
_080A582C:
	adds r6, r1, 0
	ldr r0, _080A5884 @ =gBGTilemapBuffers + 0x800
	adds r4, r5, 0x1
	ldrb r1, [r6]
	lsls r1, 25
	lsrs r1, 24
	str r1, [sp]
	movs r1, 0x7
	adds r2, r4, 0
	movs r3, 0x6
	bl sub_80A4008
	ldrb r3, [r6]
	lsls r3, 1
	adds r3, 0x1
	adds r3, r5, r3
	lsls r3, 24
	lsrs r3, 24
	movs r0, 0x6
	adds r1, r5, 0
	movs r2, 0xD
	bl MenuDrawTextWindow
	movs r0, 0
	adds r1, r5, 0
	bl sub_80A7834
	ldrb r3, [r6]
	movs r0, 0
	str r0, [sp]
	movs r0, 0x6
	str r0, [sp, 0x4]
	movs r0, 0
	movs r1, 0x7
	adds r2, r4, 0
	bl InitMenu
	add sp, 0x8
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_080A5880: .4byte gUnknown_02038564
_080A5884: .4byte gBGTilemapBuffers + 0x800
	thumb_func_end sub_80A57C4

	thumb_func_start sub_80A5888
sub_80A5888: @ 80A5888
	push {r4,r5,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	adds r5, r4, 0
	bl sub_80A78A0
	cmp r0, 0
	beq _080A5988
	ldr r2, _080A58B8 @ =gMain
	ldrh r1, [r2, 0x30]
	movs r0, 0x40
	ands r0, r1
	cmp r0, 0
	beq _080A58C0
	ldr r4, _080A58BC @ =gUnknown_03000700
	ldrb r0, [r4]
	cmp r0, 0
	beq _080A5988
	movs r0, 0x5
	bl PlaySE
	movs r0, 0x1
	negs r0, r0
	b _080A58E2
	.align 2, 0
_080A58B8: .4byte gMain
_080A58BC: .4byte gUnknown_03000700
_080A58C0:
	movs r0, 0x80
	ands r0, r1
	lsls r0, 16
	lsrs r3, r0, 16
	cmp r3, 0
	beq _080A58F4
	ldr r4, _080A58EC @ =gUnknown_03000700
	ldrb r1, [r4]
	ldr r0, _080A58F0 @ =gUnknown_02038564
	ldrb r0, [r0]
	subs r0, 0x1
	cmp r1, r0
	beq _080A5988
	movs r0, 0x5
	bl PlaySE
	movs r0, 0x1
_080A58E2:
	bl MoveMenuCursor
	strb r0, [r4]
	b _080A5988
	.align 2, 0
_080A58EC: .4byte gUnknown_03000700
_080A58F0: .4byte gUnknown_02038564
_080A58F4:
	ldrh r1, [r2, 0x2E]
	movs r2, 0x1
	ands r2, r1
	cmp r2, 0
	beq _080A5964
	ldr r1, _080A5948 @ =gTasks
	lsls r0, r4, 2
	adds r0, r4
	lsls r0, 3
	adds r0, r1
	strh r3, [r0, 0x1C]
	ldr r1, _080A594C @ =gUnknown_03005D10
	ldr r0, _080A5950 @ =gUnknown_02038559
	ldrb r0, [r0]
	lsls r0, 24
	asrs r0, 24
	lsls r0, 2
	adds r0, r1
	ldrb r2, [r0]
	adds r0, r4, 0
	adds r1, r2, 0
	bl sub_80A48E8
	ldr r0, _080A5954 @ =gBGTilemapBuffers + 0x800
	bl sub_80A4DA4
	ldr r1, _080A5958 @ =gUnknown_083C1640
	ldr r0, _080A595C @ =gUnknown_03000700
	ldrb r2, [r0]
	ldr r0, _080A5960 @ =gUnknown_03000704
	ldr r0, [r0]
	adds r0, r2
	ldrb r0, [r0]
	lsls r0, 3
	adds r1, 0x4
	adds r0, r1
	ldr r1, [r0]
	adds r0, r4, 0
	bl _call_via_r1
	b _080A5988
	.align 2, 0
_080A5948: .4byte gTasks
_080A594C: .4byte gUnknown_03005D10
_080A5950: .4byte gUnknown_02038559
_080A5954: .4byte gBGTilemapBuffers + 0x800
_080A5958: .4byte gUnknown_083C1640
_080A595C: .4byte gUnknown_03000700
_080A5960: .4byte gUnknown_03000704
_080A5964:
	movs r0, 0x2
	ands r0, r1
	cmp r0, 0
	beq _080A5988
	ldr r1, _080A5990 @ =gTasks
	lsls r0, r5, 2
	adds r0, r5
	lsls r0, 3
	adds r0, r1
	strh r2, [r0, 0x1C]
	ldr r0, _080A5994 @ =gBGTilemapBuffers + 0x800
	bl sub_80A4DA4
	ldr r0, _080A5998 @ =gUnknown_083C1640
	ldr r1, [r0, 0x14]
	adds r0, r5, 0
	bl _call_via_r1
_080A5988:
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080A5990: .4byte gTasks
_080A5994: .4byte gBGTilemapBuffers + 0x800
_080A5998: .4byte gUnknown_083C1640
	thumb_func_end sub_80A5888

	thumb_func_start sub_80A599C
sub_80A599C: @ 80A599C
	push {r4,lr}
	lsls r0, 24
	lsrs r0, 24
	ldr r2, _080A59C4 @ =gTasks
	lsls r1, r0, 2
	adds r1, r0
	lsls r1, 3
	adds r1, r2
	ldr r3, _080A59C8 @ =sub_805469C
	lsrs r2, r3, 16
	movs r4, 0
	strh r2, [r1, 0x18]
	strh r3, [r1, 0x1A]
	ldr r1, _080A59CC @ =gLastFieldPokeMenuOpened
	strb r4, [r1]
	bl sub_80A5AE4
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080A59C4: .4byte gTasks
_080A59C8: .4byte sub_805469C
_080A59CC: .4byte gLastFieldPokeMenuOpened
	thumb_func_end sub_80A599C

	thumb_func_start sub_80A59D0
sub_80A59D0: @ 80A59D0
	push {r4-r7,lr}
	lsls r0, 24
	lsrs r5, r0, 24
	ldr r1, _080A5A3C @ =gUnknown_03000700
	movs r0, 0
	strb r0, [r1]
	ldr r7, _080A5A40 @ =gUnknown_03000701
	ldrb r0, [r7]
	cmp r0, 0x5
	bne _080A59E8
	movs r0, 0x1
	strb r0, [r1]
_080A59E8:
	ldr r1, _080A5A44 @ =gTasks
	lsls r4, r5, 2
	adds r0, r4, r5
	lsls r0, 3
	adds r6, r0, r1
	ldr r3, _080A5A48 @ =gUnknown_03005D10
	ldr r2, _080A5A4C @ =gUnknown_02038559
	movs r0, 0
	ldrsb r0, [r2, r0]
	lsls r0, 2
	adds r0, r3
	ldrb r1, [r0, 0x1]
	ldrb r0, [r0]
	adds r1, r0
	adds r1, 0x1
	strh r1, [r6, 0x1C]
	movs r0, 0
	ldrsb r0, [r2, r0]
	lsls r0, 2
	adds r0, r3
	ldrb r2, [r0]
	adds r0, r5, 0
	adds r1, r2, 0
	bl sub_80A48E8
	bl sub_80A73FC
	bl sub_80F9344
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _080A5A54
	ldrb r0, [r7]
	cmp r0, 0x5
	beq _080A5A54
	bl sub_80A57C4
	ldr r0, _080A5A50 @ =sub_80A5888
	str r0, [r6]
	b _080A5A9C
	.align 2, 0
_080A5A3C: .4byte gUnknown_03000700
_080A5A40: .4byte gUnknown_03000701
_080A5A44: .4byte gTasks
_080A5A48: .4byte gUnknown_03005D10
_080A5A4C: .4byte gUnknown_02038559
_080A5A50: .4byte sub_80A5888
_080A5A54:
	ldr r0, _080A5A7C @ =gBGTilemapBuffers + 0x800
	bl sub_80A4BF0
	ldr r0, _080A5A80 @ =gUnknown_02038559
	ldrb r0, [r0]
	lsls r0, 24
	asrs r0, 24
	cmp r0, 0x3
	bne _080A5A6E
	ldr r0, _080A5A84 @ =gUnknown_03000701
	ldrb r0, [r0]
	cmp r0, 0x5
	bne _080A5A90
_080A5A6E:
	ldr r0, _080A5A88 @ =gTasks
	adds r1, r4, r5
	lsls r1, 3
	adds r1, r0
	ldr r0, _080A5A8C @ =sub_80A5414
	b _080A5A9A
	.align 2, 0
_080A5A7C: .4byte gBGTilemapBuffers + 0x800
_080A5A80: .4byte gUnknown_02038559
_080A5A84: .4byte gUnknown_03000701
_080A5A88: .4byte gTasks
_080A5A8C: .4byte sub_80A5414
_080A5A90:
	ldr r0, _080A5AA4 @ =gTasks
	adds r1, r4, r5
	lsls r1, 3
	adds r1, r0
	ldr r0, _080A5AA8 @ =sub_80A5600
_080A5A9A:
	str r0, [r1]
_080A5A9C:
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080A5AA4: .4byte gTasks
_080A5AA8: .4byte sub_80A5600
	thumb_func_end sub_80A59D0

	thumb_func_start sub_80A5AAC
sub_80A5AAC: @ 80A5AAC
	push {r4,lr}
	sub sp, 0x4
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	movs r0, 0x1
	negs r0, r0
	movs r1, 0
	str r1, [sp]
	movs r2, 0
	movs r3, 0x10
	bl BeginNormalPaletteFade
	ldr r1, _080A5ADC @ =gTasks
	lsls r0, r4, 2
	adds r0, r4
	lsls r0, 3
	adds r0, r1
	ldr r1, _080A5AE0 @ =HandleItemMenuPaletteFade
	str r1, [r0]
	add sp, 0x4
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080A5ADC: .4byte gTasks
_080A5AE0: .4byte HandleItemMenuPaletteFade
	thumb_func_end sub_80A5AAC

	thumb_func_start sub_80A5AE4
sub_80A5AE4: @ 80A5AE4
	push {r4,lr}
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	movs r0, 0x5
	bl PlaySE
	adds r0, r4, 0
	bl sub_80A5AAC
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end sub_80A5AE4

	thumb_func_start HandleItemMenuPaletteFade
HandleItemMenuPaletteFade: @ 80A5B00
	push {r4,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	lsls r0, r4, 2
	adds r0, r4
	lsls r0, 3
	ldr r1, _080A5B38 @ =gTasks + 0x8
	adds r2, r0, r1
	ldr r0, _080A5B3C @ =gPaletteFade
	ldrb r1, [r0, 0x7]
	movs r0, 0x80
	ands r0, r1
	cmp r0, 0
	bne _080A5B32
	ldrh r0, [r2, 0x10]
	lsls r0, 16
	ldrh r1, [r2, 0x12]
	orrs r0, r1
	bl SetMainCallback2
	bl gpu_pal_allocator_reset__manage_upper_four
	adds r0, r4, 0
	bl DestroyTask
_080A5B32:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080A5B38: .4byte gTasks + 0x8
_080A5B3C: .4byte gPaletteFade
	thumb_func_end HandleItemMenuPaletteFade

	thumb_func_start sub_80A5B40
sub_80A5B40: @ 80A5B40
	push {lr}
_080A5B42:
	bl sub_80A317C
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _080A5B68
	bl ResetTasks
	ldr r0, _080A5B60 @ =sub_80A50C8
	movs r1, 0
	bl CreateTask
	ldr r1, _080A5B64 @ =gUnknown_02038563
	strb r0, [r1]
	b _080A5B74
	.align 2, 0
_080A5B60: .4byte sub_80A50C8
_080A5B64: .4byte gUnknown_02038563
_080A5B68:
	bl sub_80F9344
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _080A5B42
_080A5B74:
	pop {r0}
	bx r0
	thumb_func_end sub_80A5B40

	thumb_func_start sub_80A5B78
sub_80A5B78: @ 80A5B78
	push {r4,r5,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	ldr r5, _080A5BB0 @ =gScriptItemId
	ldrh r0, [r5]
	bl ItemId_GetFieldFunc
	cmp r0, 0
	beq _080A5BF2
	movs r0, 0x5
	bl PlaySE
	bl CalculatePlayerPartyCount
	lsls r0, 24
	cmp r0, 0
	bne _080A5BB4
	ldrh r0, [r5]
	bl ItemId_GetType
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _080A5BB4
	adds r0, r4, 0
	bl sub_80A5BF8
	b _080A5BF2
	.align 2, 0
_080A5BB0: .4byte gScriptItemId
_080A5BB4:
	ldr r1, _080A5BE0 @ =gTasks
	lsls r0, r4, 2
	adds r0, r4
	lsls r0, 3
	adds r0, r1
	movs r1, 0
	strh r1, [r0, 0xC]
	ldr r0, _080A5BE4 @ =gUnknown_02038559
	ldrb r0, [r0]
	lsls r0, 24
	asrs r0, 24
	cmp r0, 0x3
	beq _080A5BEC
	ldr r0, _080A5BE8 @ =gScriptItemId
	ldrh r0, [r0]
	bl ItemId_GetFieldFunc
	adds r1, r0, 0
	adds r0, r4, 0
	bl _call_via_r1
	b _080A5BF2
	.align 2, 0
_080A5BE0: .4byte gTasks
_080A5BE4: .4byte gUnknown_02038559
_080A5BE8: .4byte gScriptItemId
_080A5BEC:
	adds r0, r4, 0
	bl sub_80C9C7C
_080A5BF2:
	pop {r4,r5}
	pop {r0}
	bx r0
	thumb_func_end sub_80A5B78

	thumb_func_start sub_80A5BF8
sub_80A5BF8: @ 80A5BF8
	push {r4,lr}
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	bl sub_80A73FC
	bl sub_80A7590
	ldr r1, _080A5C1C @ =gOtherText_NoPokemon
	ldr r2, _080A5C20 @ =CleanUpItemMenuMessage
	adds r0, r4, 0
	movs r3, 0x1
	bl DisplayCannotUseItemMessage
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080A5C1C: .4byte gOtherText_NoPokemon
_080A5C20: .4byte CleanUpItemMenuMessage
	thumb_func_end sub_80A5BF8

	thumb_func_start sub_80A5C24
sub_80A5C24: @ 80A5C24
	push {r4,lr}
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	movs r0, 0
	bl sub_80A7528
	adds r0, r4, 0
	bl sub_80A41D4
	bl ItemListMenu_InitMenu
	adds r0, r4, 0
	bl sub_80A37C0
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end sub_80A5C24

	thumb_func_start CleanUpItemMenuMessage
CleanUpItemMenuMessage: @ 80A5C48
	push {r4,lr}
	sub sp, 0x4
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	ldr r0, _080A5C90 @ =gBGTilemapBuffers + 0x800
	movs r1, 0x1F
	str r1, [sp]
	movs r1, 0
	movs r2, 0
	movs r3, 0x1F
	bl sub_80A36B8
	movs r0, 0x7
	movs r1, 0x7
	movs r2, 0xD
	movs r3, 0xC
	bl MenuZeroFillWindowRect
	movs r0, 0
	movs r1, 0xE
	movs r2, 0x1D
	movs r3, 0x13
	bl MenuZeroFillWindowRect
	ldr r1, _080A5C94 @ =gTasks
	lsls r0, r4, 2
	adds r0, r4
	lsls r0, 3
	adds r0, r1
	ldr r1, _080A5C98 @ =sub_80A5C24
	str r1, [r0]
	add sp, 0x4
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080A5C90: .4byte gBGTilemapBuffers + 0x800
_080A5C94: .4byte gTasks
_080A5C98: .4byte sub_80A5C24
	thumb_func_end CleanUpItemMenuMessage

	thumb_func_start CleanUpOverworldMessage
CleanUpOverworldMessage: @ 80A5C9C
	push {r4,lr}
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	movs r0, 0
	movs r1, 0xD
	movs r2, 0x1D
	movs r3, 0x13
	bl MenuZeroFillWindowRect
	adds r0, r4, 0
	bl DestroyTask
	bl sub_8064E2C
	bl ScriptContext2_Disable
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end CleanUpOverworldMessage

	thumb_func_start ExecuteItemUseFromBlackPalette
ExecuteItemUseFromBlackPalette: @ 80A5CC4
	push {lr}
	bl pal_fill_black
	ldr r0, _080A5CD8 @ =Task_CallItemUseOnFieldCallback
	movs r1, 0x8
	bl CreateTask
	pop {r0}
	bx r0
	.align 2, 0
_080A5CD8: .4byte Task_CallItemUseOnFieldCallback
	thumb_func_end ExecuteItemUseFromBlackPalette

	thumb_func_start Task_CallItemUseOnFieldCallback
Task_CallItemUseOnFieldCallback: @ 80A5CDC
	push {r4,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	bl sub_807D770
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _080A5CF8
	ldr r0, _080A5D00 @ =gUnknown_03005D00
	ldr r1, [r0]
	adds r0, r4, 0
	bl _call_via_r1
_080A5CF8:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080A5D00: .4byte gUnknown_03005D00
	thumb_func_end Task_CallItemUseOnFieldCallback

	thumb_func_start sub_80A5D04
sub_80A5D04: @ 80A5D04
	push {lr}
_080A5D06:
	bl sub_80A317C
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _080A5D28
	ldr r0, _080A5D20 @ =sub_80A50C8
	movs r1, 0
	bl CreateTask
	ldr r1, _080A5D24 @ =gUnknown_02038563
	strb r0, [r1]
	b _080A5D34
	.align 2, 0
_080A5D20: .4byte sub_80A50C8
_080A5D24: .4byte gUnknown_02038563
_080A5D28:
	bl sub_80F9344
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _080A5D06
_080A5D34:
	pop {r0}
	bx r0
	thumb_func_end sub_80A5D04

	thumb_func_start sub_80A5D38
sub_80A5D38: @ 80A5D38
	push {r4,lr}
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	ldr r1, _080A5D70 @ =gTasks
	lsls r0, r4, 2
	adds r0, r4
	lsls r0, 3
	adds r0, r1
	movs r1, 0
	strh r1, [r0, 0xA]
	ldr r0, _080A5D74 @ =gBGTilemapBuffers + 0x800
	bl sub_80A4DA4
	movs r0, 0
	bl sub_80A7528
	adds r0, r4, 0
	bl sub_80A41D4
	bl ItemListMenu_InitMenu
	adds r0, r4, 0
	bl sub_80A37C0
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080A5D70: .4byte gTasks
_080A5D74: .4byte gBGTilemapBuffers + 0x800
	thumb_func_end sub_80A5D38

	thumb_func_start sub_80A5D78
sub_80A5D78: @ 80A5D78
	push {lr}
	sub sp, 0x4
	ldr r0, _080A5D9C @ =gBGTilemapBuffers + 0x800
	movs r1, 0x4
	str r1, [sp]
	movs r1, 0x8
	movs r2, 0x8
	movs r3, 0x5
	bl sub_80A4008
	movs r0, 0x7
	movs r1, 0x7
	movs r2, 0x1
	bl DisplayYesNoMenu
	add sp, 0x4
	pop {r0}
	bx r0
	.align 2, 0
_080A5D9C: .4byte gBGTilemapBuffers + 0x800
	thumb_func_end sub_80A5D78

	thumb_func_start sub_80A5DA0
sub_80A5DA0: @ 80A5DA0
	push {r4,lr}
	lsls r0, 16
	lsrs r0, 16
	lsls r1, 16
	lsrs r4, r1, 16
	ldr r1, _080A5DC4 @ =gStringVar1
	bl CopyItemName
	cmp r4, 0x63
	bls _080A5DCC
	ldr r0, _080A5DC8 @ =gStringVar2
	adds r1, r4, 0
	movs r2, 0
	movs r3, 0x3
	bl ConvertIntToDecimalStringN
	b _080A5DD8
	.align 2, 0
_080A5DC4: .4byte gStringVar1
_080A5DC8: .4byte gStringVar2
_080A5DCC:
	ldr r0, _080A5DF0 @ =gStringVar2
	adds r1, r4, 0
	movs r2, 0
	movs r3, 0x2
	bl ConvertIntToDecimalStringN
_080A5DD8:
	ldr r0, _080A5DF4 @ =gBGTilemapBuffers + 0x800
	bl sub_80A4DA4
	movs r0, 0x5
	bl sub_80A7528
	bl sub_80A5D78
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080A5DF0: .4byte gStringVar2
_080A5DF4: .4byte gBGTilemapBuffers + 0x800
	thumb_func_end sub_80A5DA0

	thumb_func_start sub_80A5DF8
sub_80A5DF8: @ 80A5DF8
	push {lr}
	ldr r0, _080A5E18 @ =gBGTilemapBuffers + 0x800
	bl sub_80A4DA4
	movs r0, 0x7
	movs r1, 0x6
	movs r2, 0xB
	movs r3, 0xD
	bl MenuZeroFillWindowRect
	movs r0, 0x4
	bl sub_80A7528
	pop {r0}
	bx r0
	.align 2, 0
_080A5E18: .4byte gBGTilemapBuffers + 0x800
	thumb_func_end sub_80A5DF8

	thumb_func_start sub_80A5E1C
sub_80A5E1C: @ 80A5E1C
	push {r4,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	ldr r0, _080A5E58 @ =gMain
	ldrh r1, [r0, 0x2E]
	movs r0, 0x1
	ands r0, r1
	cmp r0, 0
	bne _080A5E36
	movs r0, 0x2
	ands r0, r1
	cmp r0, 0
	beq _080A5E50
_080A5E36:
	ldr r0, _080A5E5C @ =gTasks
	lsls r1, r4, 2
	adds r1, r4
	lsls r1, 3
	adds r1, r0
	movs r0, 0
	strh r0, [r1, 0x1C]
	adds r0, r4, 0
	bl sub_80A41D4
	adds r0, r4, 0
	bl sub_80A5D38
_080A5E50:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080A5E58: .4byte gMain
_080A5E5C: .4byte gTasks
	thumb_func_end sub_80A5E1C

	thumb_func_start sub_80A5E60
sub_80A5E60: @ 80A5E60
	push {r4,lr}
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	bl sub_80A5DF8
	adds r0, r4, 0
	bl sub_80A3D5C
	ldr r1, _080A5E88 @ =gTasks
	lsls r0, r4, 2
	adds r0, r4
	lsls r0, 3
	adds r0, r1
	ldr r1, _080A5E8C @ =sub_80A5E1C
	str r1, [r0]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080A5E88: .4byte gTasks
_080A5E8C: .4byte sub_80A5E1C
	thumb_func_end sub_80A5E60

	thumb_func_start sub_80A5E90
sub_80A5E90: @ 80A5E90
	push {lr}
	lsls r0, 24
	lsrs r0, 24
	bl sub_80A5D38
	pop {r0}
	bx r0
	thumb_func_end sub_80A5E90

	thumb_func_start sub_80A5EA0
sub_80A5EA0: @ 80A5EA0
	push {r4,r5,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	adds r5, r4, 0
	adds r0, r4, 0
	bl sub_80A5350
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	beq _080A5F0C
	ldr r0, _080A5EE8 @ =gMain
	ldrh r1, [r0, 0x2E]
	movs r0, 0x1
	ands r0, r1
	cmp r0, 0
	beq _080A5EF8
	movs r0, 0x5
	bl PlaySE
	ldr r0, _080A5EEC @ =gScriptItemId
	ldrh r0, [r0]
	ldr r2, _080A5EF0 @ =gTasks
	lsls r1, r4, 2
	adds r1, r4
	lsls r1, 3
	adds r1, r2
	ldrh r1, [r1, 0xA]
	bl sub_80A5DA0
	ldr r1, _080A5EF4 @ =gUnknown_083C16F4
	adds r0, r4, 0
	bl DoYesNoFuncWithChoice
	b _080A5F0C
	.align 2, 0
_080A5EE8: .4byte gMain
_080A5EEC: .4byte gScriptItemId
_080A5EF0: .4byte gTasks
_080A5EF4: .4byte gUnknown_083C16F4
_080A5EF8:
	movs r0, 0x2
	ands r0, r1
	cmp r0, 0
	beq _080A5F0C
	movs r0, 0x5
	bl PlaySE
	adds r0, r5, 0
	bl sub_80A5D38
_080A5F0C:
	pop {r4,r5}
	pop {r0}
	bx r0
	thumb_func_end sub_80A5EA0

	thumb_func_start sub_80A5F14
sub_80A5F14: @ 80A5F14
	push {r4,lr}
	sub sp, 0x8
	lsls r0, 24
	lsrs r4, r0, 24
	movs r0, 0x5
	bl PlaySE
	ldr r1, _080A5F58 @ =gTasks
	lsls r0, r4, 2
	adds r0, r4
	lsls r0, 3
	adds r0, r1
	ldr r1, _080A5F5C @ =sub_80A5EA0
	str r1, [r0]
	movs r0, 0x3
	bl sub_80A7528
	ldr r0, _080A5F60 @ =gUnknown_02038559
	ldrb r0, [r0]
	lsls r0, 24
	asrs r0, 24
	cmp r0, 0x3
	bne _080A5F64
	movs r0, 0x3
	str r0, [sp]
	str r0, [sp, 0x4]
	adds r0, r4, 0
	movs r1, 0x6
	movs r2, 0x9
	movs r3, 0x7
	bl sub_80A4DD8
	b _080A5F78
	.align 2, 0
_080A5F58: .4byte gTasks
_080A5F5C: .4byte sub_80A5EA0
_080A5F60: .4byte gUnknown_02038559
_080A5F64:
	movs r0, 0x3
	str r0, [sp]
	movs r0, 0x2
	str r0, [sp, 0x4]
	adds r0, r4, 0
	movs r1, 0x7
	movs r2, 0x9
	movs r3, 0x6
	bl sub_80A4DD8
_080A5F78:
	add sp, 0x8
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end sub_80A5F14

	thumb_func_start sub_80A5F80
sub_80A5F80: @ 80A5F80
	push {r4,lr}
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	movs r0, 0x5
	bl PlaySE
	movs r0, 0
	bl sub_80A7528
	adds r0, r4, 0
	bl sub_80A41D4
	bl ItemListMenu_InitMenu
	adds r0, r4, 0
	bl sub_80A37C0
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end sub_80A5F80

	thumb_func_start sub_80A5FAC
sub_80A5FAC: @ 80A5FAC
	push {r4-r6,lr}
	lsls r0, 24
	lsrs r6, r0, 24
	movs r0, 0x5
	bl PlaySE
	ldr r0, _080A5FD0 @ =gSaveBlock1
	ldr r1, _080A5FD4 @ =0x00000496
	adds r4, r0, r1
	ldr r5, _080A5FD8 @ =gScriptItemId
	ldrh r0, [r4]
	ldrh r1, [r5]
	cmp r0, r1
	bne _080A5FDC
	bl sub_80A40D0
	movs r0, 0
	b _080A5FE2
	.align 2, 0
_080A5FD0: .4byte gSaveBlock1
_080A5FD4: .4byte 0x00000496
_080A5FD8: .4byte gScriptItemId
_080A5FDC:
	bl sub_80A413C
	ldrh r0, [r5]
_080A5FE2:
	strh r0, [r4]
	movs r0, 0
	bl sub_80A7528
	adds r0, r6, 0
	bl sub_80A41D4
	bl ItemListMenu_InitMenu
	adds r0, r6, 0
	bl sub_80A37C0
	pop {r4-r6}
	pop {r0}
	bx r0
	thumb_func_end sub_80A5FAC

	thumb_func_start sub_80A6000
sub_80A6000: @ 80A6000
	push {r4,lr}
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	movs r0, 0
	bl sub_80A7528
	adds r0, r4, 0
	bl sub_80A41D4
	bl ItemListMenu_InitMenu
	adds r0, r4, 0
	bl sub_80A37C0
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end sub_80A6000

	thumb_func_start sub_80A6024
sub_80A6024: @ 80A6024
	push {r4,lr}
	sub sp, 0x4
	lsls r0, 24
	lsrs r4, r0, 24
	ldr r0, _080A606C @ =gMain
	ldrh r1, [r0, 0x2E]
	movs r0, 0x1
	ands r0, r1
	cmp r0, 0
	beq _080A6062
	ldr r0, _080A6070 @ =gBGTilemapBuffers + 0x800
	movs r1, 0x1F
	str r1, [sp]
	movs r1, 0
	movs r2, 0
	movs r3, 0x1F
	bl sub_80A36B8
	movs r0, 0
	movs r1, 0xE
	movs r2, 0x1D
	movs r3, 0x13
	bl MenuZeroFillWindowRect
	ldr r1, _080A6074 @ =gTasks
	lsls r0, r4, 2
	adds r0, r4
	lsls r0, 3
	adds r0, r1
	ldr r1, _080A6078 @ =sub_80A6000
	str r1, [r0]
_080A6062:
	add sp, 0x4
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080A606C: .4byte gMain
_080A6070: .4byte gBGTilemapBuffers + 0x800
_080A6074: .4byte gTasks
_080A6078: .4byte sub_80A6000
	thumb_func_end sub_80A6024

	thumb_func_start DisplayCannotBeHeldMessage
DisplayCannotBeHeldMessage: @ 80A607C
	push {r4,r5,lr}
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	bl sub_80A73FC
	ldr r0, _080A60B4 @ =gScriptItemId
	ldrh r0, [r0]
	ldr r1, _080A60B8 @ =gStringVar1
	bl CopyItemName
	ldr r5, _080A60BC @ =gStringVar4
	ldr r1, _080A60C0 @ =gOtherText_CantBeHeld
	adds r0, r5, 0
	bl StringExpandPlaceholders
	bl sub_80A7590
	ldr r2, _080A60C4 @ =sub_80A6024
	adds r0, r4, 0
	adds r1, r5, 0
	movs r3, 0x1
	bl DisplayCannotUseItemMessage
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080A60B4: .4byte gScriptItemId
_080A60B8: .4byte gStringVar1
_080A60BC: .4byte gStringVar4
_080A60C0: .4byte gOtherText_CantBeHeld
_080A60C4: .4byte sub_80A6024
	thumb_func_end DisplayCannotBeHeldMessage

	thumb_func_start ItemMenu_Give
ItemMenu_Give: @ 80A60C8
	push {r4-r6,lr}
	sub sp, 0x4
	lsls r0, 24
	lsrs r4, r0, 24
	adds r6, r4, 0
	movs r0, 0x5
	bl PlaySE
	ldr r5, _080A60FC @ =gScriptItemId
	ldrh r0, [r5]
	bl sub_80F931C
	lsls r0, 24
	cmp r0, 0
	bne _080A6108
	bl sub_80A73FC
	bl sub_80A7590
	ldr r1, _080A6100 @ =gOtherText_CantWriteMail
	ldr r2, _080A6104 @ =sub_80A6024
	adds r0, r4, 0
	movs r3, 0x1
	bl DisplayCannotUseItemMessage
	b _080A616E
	.align 2, 0
_080A60FC: .4byte gScriptItemId
_080A6100: .4byte gOtherText_CantWriteMail
_080A6104: .4byte sub_80A6024
_080A6108:
	ldrh r0, [r5]
	bl ItemId_GetImportance
	lsls r0, 24
	lsrs r5, r0, 24
	cmp r5, 0
	bne _080A6168
	bl CalculatePlayerPartyCount
	lsls r0, 24
	cmp r0, 0
	bne _080A6128
	adds r0, r4, 0
	bl sub_80A5BF8
	b _080A616E
_080A6128:
	ldr r1, _080A6158 @ =gTasks
	lsls r0, r4, 2
	adds r0, r4
	lsls r0, 3
	adds r0, r1
	ldr r2, _080A615C @ =sub_808B020
	lsrs r1, r2, 16
	strh r1, [r0, 0x18]
	strh r2, [r0, 0x1A]
	ldr r1, _080A6160 @ =HandleItemMenuPaletteFade
	str r1, [r0]
	ldr r1, _080A6164 @ =gUnknown_02038561
	movs r0, 0x1
	strb r0, [r1]
	movs r0, 0x1
	negs r0, r0
	str r5, [sp]
	movs r1, 0
	movs r2, 0
	movs r3, 0x10
	bl BeginNormalPaletteFade
	b _080A616E
	.align 2, 0
_080A6158: .4byte gTasks
_080A615C: .4byte sub_808B020
_080A6160: .4byte HandleItemMenuPaletteFade
_080A6164: .4byte gUnknown_02038561
_080A6168:
	adds r0, r6, 0
	bl DisplayCannotBeHeldMessage
_080A616E:
	add sp, 0x4
	pop {r4-r6}
	pop {r0}
	bx r0
	thumb_func_end ItemMenu_Give

	thumb_func_start sub_80A6178
sub_80A6178: @ 80A6178
	push {r4,lr}
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	adds r0, r4, 0
	bl sub_80A5AE4
	ldr r1, _080A61A0 @ =gTasks
	lsls r0, r4, 2
	adds r0, r4
	lsls r0, 3
	adds r0, r1
	ldr r2, _080A61A4 @ =BerryTagScreen_814625C
	lsrs r1, r2, 16
	strh r1, [r0, 0x18]
	strh r2, [r0, 0x1A]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080A61A0: .4byte gTasks
_080A61A4: .4byte BerryTagScreen_814625C
	thumb_func_end sub_80A6178

	thumb_func_start sub_80A61A8
sub_80A61A8: @ 80A61A8
	push {lr}
	bl sub_80A34B4
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _080A61C2
	ldr r0, _080A61C8 @ =sub_80A50C8
	movs r1, 0
	bl CreateTask
	ldr r1, _080A61CC @ =gUnknown_02038563
	strb r0, [r1]
_080A61C2:
	pop {r0}
	bx r0
	.align 2, 0
_080A61C8: .4byte sub_80A50C8
_080A61CC: .4byte gUnknown_02038563
	thumb_func_end sub_80A61A8

	thumb_func_start sub_80A61D0
sub_80A61D0: @ 80A61D0
	push {lr}
	ldr r0, _080A61E4 @ =gUnknown_03000701
	movs r1, 0x2
	strb r1, [r0]
	ldr r0, _080A61E8 @ =sub_80A61A8
	bl SetMainCallback2
	pop {r0}
	bx r0
	.align 2, 0
_080A61E4: .4byte gUnknown_03000701
_080A61E8: .4byte sub_80A61A8
	thumb_func_end sub_80A61D0

	thumb_func_start sub_80A61EC
sub_80A61EC: @ 80A61EC
	push {lr}
	lsls r0, 24
	lsrs r0, 24
	ldr r2, _080A620C @ =gTasks
	lsls r1, r0, 2
	adds r1, r0
	lsls r1, 3
	adds r1, r2
	ldr r3, _080A6210 @ =sub_808A3F8
	lsrs r2, r3, 16
	strh r2, [r1, 0x18]
	strh r3, [r1, 0x1A]
	bl sub_80A5AE4
	pop {r0}
	bx r0
	.align 2, 0
_080A620C: .4byte gTasks
_080A6210: .4byte sub_808A3F8
	thumb_func_end sub_80A61EC

	thumb_func_start sub_80A6214
sub_80A6214: @ 80A6214
	push {r4-r6,lr}
	lsls r0, 24
	lsrs r5, r0, 24
	ldr r0, _080A6244 @ =gUnknown_02038559
	ldrb r0, [r0]
	adds r0, 0x1
	lsls r0, 24
	lsrs r6, r0, 24
	ldr r4, _080A6248 @ =gScriptItemId
	ldrh r0, [r4]
	bl sub_80F931C
	lsls r0, 24
	cmp r0, 0
	bne _080A6254
	bl sub_80A73FC
	bl sub_80A7590
	ldr r1, _080A624C @ =gOtherText_CantWriteMail
	ldr r2, _080A6250 @ =sub_80A6024
	adds r0, r5, 0
	b _080A6280
	.align 2, 0
_080A6244: .4byte gUnknown_02038559
_080A6248: .4byte gScriptItemId
_080A624C: .4byte gOtherText_CantWriteMail
_080A6250: .4byte sub_80A6024
_080A6254:
	ldrh r0, [r4]
	bl sub_80F92F4
	lsls r0, 24
	cmp r0, 0
	bne _080A6298
	bl sub_80A73FC
	ldrh r0, [r4]
	ldr r1, _080A6288 @ =gStringVar1
	bl CopyItemName
	ldr r4, _080A628C @ =gStringVar4
	ldr r1, _080A6290 @ =gOtherText_CantBeHeldHere
	adds r0, r4, 0
	bl StringExpandPlaceholders
	bl sub_80A7590
	ldr r2, _080A6294 @ =sub_80A6024
	adds r0, r5, 0
	adds r1, r4, 0
_080A6280:
	movs r3, 0x1
	bl DisplayCannotUseItemMessage
	b _080A62D2
	.align 2, 0
_080A6288: .4byte gStringVar1
_080A628C: .4byte gStringVar4
_080A6290: .4byte gOtherText_CantBeHeldHere
_080A6294: .4byte sub_80A6024
_080A6298:
	cmp r6, 0x5
	beq _080A62CC
	ldrh r0, [r4]
	bl ItemId_GetImportance
	lsls r0, 24
	cmp r0, 0
	bne _080A62CC
	ldr r1, _080A62C4 @ =gTasks
	lsls r0, r5, 2
	adds r0, r5
	lsls r0, 3
	adds r0, r1
	ldr r2, _080A62C8 @ =sub_808A3F8
	lsrs r1, r2, 16
	strh r1, [r0, 0x18]
	strh r2, [r0, 0x1A]
	adds r0, r5, 0
	bl sub_80A5AAC
	b _080A62D2
	.align 2, 0
_080A62C4: .4byte gTasks
_080A62C8: .4byte sub_808A3F8
_080A62CC:
	adds r0, r5, 0
	bl DisplayCannotBeHeldMessage
_080A62D2:
	pop {r4-r6}
	pop {r0}
	bx r0
	thumb_func_end sub_80A6214

	thumb_func_start sub_80A62D8
sub_80A62D8: @ 80A62D8
	push {lr}
	bl sub_80A34B4
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _080A62F2
	ldr r0, _080A62F8 @ =sub_80A50C8
	movs r1, 0
	bl CreateTask
	ldr r1, _080A62FC @ =gUnknown_02038563
	strb r0, [r1]
_080A62F2:
	pop {r0}
	bx r0
	.align 2, 0
_080A62F8: .4byte sub_80A50C8
_080A62FC: .4byte gUnknown_02038563
	thumb_func_end sub_80A62D8

	thumb_func_start sub_80A6300
sub_80A6300: @ 80A6300
	push {lr}
	ldr r0, _080A6314 @ =gUnknown_03000701
	movs r1, 0x3
	strb r1, [r0]
	ldr r0, _080A6318 @ =sub_80A62D8
	bl SetMainCallback2
	pop {r0}
	bx r0
	.align 2, 0
_080A6314: .4byte gUnknown_03000701
_080A6318: .4byte sub_80A62D8
	thumb_func_end sub_80A6300

	thumb_func_start sub_80A631C
sub_80A631C: @ 80A631C
	push {lr}
	lsls r0, 24
	lsrs r0, 24
	ldr r2, _080A6344 @ =gFieldCallback
	ldr r1, _080A6348 @ =sub_80B3050
	str r1, [r2]
	ldr r2, _080A634C @ =gTasks
	lsls r1, r0, 2
	adds r1, r0
	lsls r1, 3
	adds r1, r2
	ldr r3, _080A6350 @ =c2_exit_to_overworld_2_switch
	lsrs r2, r3, 16
	strh r2, [r1, 0x18]
	strh r3, [r1, 0x1A]
	bl sub_80A5AE4
	pop {r0}
	bx r0
	.align 2, 0
_080A6344: .4byte gFieldCallback
_080A6348: .4byte sub_80B3050
_080A634C: .4byte gTasks
_080A6350: .4byte c2_exit_to_overworld_2_switch
	thumb_func_end sub_80A631C

	thumb_func_start sub_80A6354
sub_80A6354: @ 80A6354
	push {r4,r5,lr}
	lsls r0, 24
	lsrs r5, r0, 24
	bl sub_80A7590
	ldr r0, _080A63C4 @ =gTasks
	lsls r2, r5, 2
	adds r2, r5
	lsls r2, 3
	adds r2, r0
	ldr r4, _080A63C8 @ =gUnknown_03005D10
	ldr r3, _080A63CC @ =gUnknown_02038559
	movs r0, 0
	ldrsb r0, [r3, r0]
	lsls r0, 2
	adds r0, r4
	ldrb r1, [r0, 0x1]
	ldrb r0, [r0]
	adds r1, r0
	adds r1, 0x1
	strh r1, [r2, 0x1C]
	movs r0, 0
	ldrsb r0, [r3, r0]
	lsls r0, 2
	adds r0, r4
	ldrb r2, [r0]
	adds r0, r5, 0
	adds r1, r2, 0
	bl sub_80A48E8
	bl sub_80A73FC
	ldr r4, _080A63D0 @ =gScriptItemId
	ldrh r0, [r4]
	ldr r1, _080A63D4 @ =gStringVar2
	bl CopyItemName
	ldrh r0, [r4]
	bl ItemId_GetPrice
	lsls r0, 16
	cmp r0, 0
	bne _080A63E4
	ldr r4, _080A63D8 @ =gStringVar4
	ldr r1, _080A63DC @ =gOtherText_CantBuyThat
	adds r0, r4, 0
	bl StringExpandPlaceholders
	ldr r2, _080A63E0 @ =sub_80A6444
	adds r0, r5, 0
	adds r1, r4, 0
	movs r3, 0x1
	bl DisplayCannotUseItemMessage
	b _080A63FA
	.align 2, 0
_080A63C4: .4byte gTasks
_080A63C8: .4byte gUnknown_03005D10
_080A63CC: .4byte gUnknown_02038559
_080A63D0: .4byte gScriptItemId
_080A63D4: .4byte gStringVar2
_080A63D8: .4byte gStringVar4
_080A63DC: .4byte gOtherText_CantBuyThat
_080A63E0: .4byte sub_80A6444
_080A63E4:
	ldr r4, _080A6400 @ =gStringVar4
	ldr r1, _080A6404 @ =gOtherText_HowManyToSell
	adds r0, r4, 0
	bl StringExpandPlaceholders
	ldr r2, _080A6408 @ =sub_80A648C
	adds r0, r5, 0
	adds r1, r4, 0
	movs r3, 0x1
	bl DisplayCannotUseItemMessage
_080A63FA:
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080A6400: .4byte gStringVar4
_080A6404: .4byte gOtherText_HowManyToSell
_080A6408: .4byte sub_80A648C
	thumb_func_end sub_80A6354

	thumb_func_start sub_80A640C
sub_80A640C: @ 80A640C
	push {r4,lr}
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	ldr r1, _080A6440 @ =gTasks
	lsls r0, r4, 2
	adds r0, r4
	lsls r0, 3
	adds r0, r1
	movs r1, 0
	strh r1, [r0, 0x1C]
	movs r0, 0
	bl sub_80A7528
	adds r0, r4, 0
	bl sub_80A41D4
	bl ItemListMenu_InitMenu
	adds r0, r4, 0
	bl sub_80A37C0
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080A6440: .4byte gTasks
	thumb_func_end sub_80A640C

	thumb_func_start sub_80A6444
sub_80A6444: @ 80A6444
	push {r4,lr}
	sub sp, 0x4
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	ldr r0, _080A6480 @ =gBGTilemapBuffers + 0x800
	movs r1, 0x1F
	str r1, [sp]
	movs r1, 0
	movs r2, 0
	movs r3, 0x1F
	bl sub_80A36B8
	movs r0, 0
	movs r1, 0xE
	movs r2, 0x1D
	movs r3, 0x13
	bl MenuZeroFillWindowRect
	ldr r1, _080A6484 @ =gTasks
	lsls r0, r4, 2
	adds r0, r4
	lsls r0, 3
	adds r0, r1
	ldr r1, _080A6488 @ =sub_80A640C
	str r1, [r0]
	add sp, 0x4
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080A6480: .4byte gBGTilemapBuffers + 0x800
_080A6484: .4byte gTasks
_080A6488: .4byte sub_80A640C
	thumb_func_end sub_80A6444

	thumb_func_start sub_80A648C
sub_80A648C: @ 80A648C
	push {r4,r5,lr}
	sub sp, 0x4
	lsls r0, 24
	lsrs r0, 24
	ldr r1, _080A64E8 @ =gTasks
	lsls r4, r0, 2
	adds r4, r0
	lsls r4, 3
	adds r4, r1
	ldr r0, _080A64EC @ =Task_BuyHowManyDialogueHandleInput
	str r0, [r4]
	ldr r0, _080A64F0 @ =gBGTilemapBuffers + 0x800
	movs r5, 0x2
	str r5, [sp]
	movs r1, 0x1
	movs r2, 0xB
	movs r3, 0xC
	bl sub_80A4008
	movs r0, 0
	movs r1, 0xA
	movs r2, 0xD
	movs r3, 0xD
	bl MenuDrawTextWindow
	movs r0, 0x1
	strh r0, [r4, 0xA]
	strh r0, [r4, 0xC]
	movs r0, 0xB
	strh r0, [r4, 0xE]
	ldr r0, _080A64F4 @ =gUnknown_02038559
	ldrb r0, [r0]
	lsls r0, 24
	asrs r0, 24
	cmp r0, 0x3
	bne _080A64F8
	movs r0, 0x3
	str r0, [sp]
	movs r0, 0x1
	movs r1, 0x1
	movs r2, 0x1
	movs r3, 0xB
	bl sub_80A418C
	b _080A6506
	.align 2, 0
_080A64E8: .4byte gTasks
_080A64EC: .4byte Task_BuyHowManyDialogueHandleInput
_080A64F0: .4byte gBGTilemapBuffers + 0x800
_080A64F4: .4byte gUnknown_02038559
_080A64F8:
	str r5, [sp]
	movs r0, 0x1
	movs r1, 0x1
	movs r2, 0x1
	movs r3, 0xB
	bl sub_80A418C
_080A6506:
	ldr r0, _080A651C @ =gScriptItemId
	ldrh r0, [r0]
	movs r1, 0x1
	bl BuyMenuDisplayMessage
	bl sub_80A683C
	add sp, 0x4
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080A651C: .4byte gScriptItemId
	thumb_func_end sub_80A648C

	thumb_func_start sub_80A6520
sub_80A6520: @ 80A6520
	push {r4,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	ldr r0, _080A6544 @ =gMain
	ldrh r1, [r0, 0x2E]
	movs r0, 0x1
	ands r0, r1
	cmp r0, 0
	beq _080A653E
	movs r0, 0x5
	bl PlaySE
	adds r0, r4, 0
	bl BuyMenuPrintItemQuantityAndPrice
_080A653E:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080A6544: .4byte gMain
	thumb_func_end sub_80A6520

	thumb_func_start sub_80A6548
sub_80A6548: @ 80A6548
	push {r4,lr}
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	adds r0, r4, 0
	bl sub_80A48F8
	ldr r1, _080A656C @ =gTasks
	lsls r0, r4, 2
	adds r0, r4
	lsls r0, 3
	adds r0, r1
	ldr r1, _080A6570 @ =sub_80A6520
	str r1, [r0]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080A656C: .4byte gTasks
_080A6570: .4byte sub_80A6520
	thumb_func_end sub_80A6548

	thumb_func_start sub_80A6574
sub_80A6574: @ 80A6574
	push {r4,r5,lr}
	adds r5, r0, 0
	lsls r5, 24
	lsrs r5, 24
	movs r0, 0x5F
	bl PlaySE
	ldr r0, _080A65A0 @ =gScriptItemId
	ldrh r0, [r0]
	ldr r1, _080A65A4 @ =gTasks
	lsls r4, r5, 2
	adds r4, r5
	lsls r4, 3
	adds r4, r1
	ldrb r1, [r4, 0xA]
	bl sub_80A6870
	ldr r0, _080A65A8 @ =sub_80A6548
	str r0, [r4]
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080A65A0: .4byte gScriptItemId
_080A65A4: .4byte gTasks
_080A65A8: .4byte sub_80A6548
	thumb_func_end sub_80A6574

	thumb_func_start sub_80A65AC
sub_80A65AC: @ 80A65AC
	push {r4,r5,lr}
	sub sp, 0x4
	adds r5, r0, 0
	lsls r5, 24
	lsrs r5, 24
	movs r0, 0x7
	movs r1, 0x6
	movs r2, 0xD
	movs r3, 0xC
	bl MenuZeroFillWindowRect
	ldr r0, _080A6600 @ =gBGTilemapBuffers + 0x800
	movs r1, 0x6
	str r1, [sp]
	movs r1, 0x7
	movs r2, 0x6
	movs r3, 0x6
	bl sub_80A36B8
	ldr r0, _080A6604 @ =gScriptItemId
	ldrh r0, [r0]
	ldr r1, _080A6608 @ =gStringVar2
	bl CopyItemName
	ldr r4, _080A660C @ =gStringVar4
	ldr r1, _080A6610 @ =gOtherText_SoldItem
	adds r0, r4, 0
	bl StringExpandPlaceholders
	ldr r2, _080A6614 @ =sub_80A6574
	adds r0, r5, 0
	adds r1, r4, 0
	movs r3, 0x1
	bl DisplayCannotUseItemMessage
	adds r0, r5, 0
	bl sub_80A3D5C
	add sp, 0x4
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080A6600: .4byte gBGTilemapBuffers + 0x800
_080A6604: .4byte gScriptItemId
_080A6608: .4byte gStringVar2
_080A660C: .4byte gStringVar4
_080A6610: .4byte gOtherText_SoldItem
_080A6614: .4byte sub_80A6574
	thumb_func_end sub_80A65AC

	thumb_func_start sub_80A6618
sub_80A6618: @ 80A6618
	push {r4,lr}
	sub sp, 0x4
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	movs r0, 0x7
	movs r1, 0x6
	movs r2, 0xD
	movs r3, 0xC
	bl MenuZeroFillWindowRect
	ldr r0, _080A664C @ =gBGTilemapBuffers + 0x800
	movs r1, 0x6
	str r1, [sp]
	movs r1, 0x7
	movs r2, 0x6
	movs r3, 0x6
	bl sub_80A36B8
	adds r0, r4, 0
	bl BuyMenuPrintItemQuantityAndPrice
	add sp, 0x4
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080A664C: .4byte gBGTilemapBuffers + 0x800
	thumb_func_end sub_80A6618

	thumb_func_start sub_80A6650
sub_80A6650: @ 80A6650
	push {r4,lr}
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	bl sub_80A5D78
	ldr r1, _080A666C @ =gUnknown_083C16FC
	adds r0, r4, 0
	bl DoYesNoFuncWithChoice
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080A666C: .4byte gUnknown_083C16FC
	thumb_func_end sub_80A6650

	thumb_func_start Task_BuyHowManyDialogueHandleInput
Task_BuyHowManyDialogueHandleInput: @ 80A6670
	push {r4,r5,lr}
	sub sp, 0x4
	lsls r0, 24
	lsrs r5, r0, 24
	adds r4, r5, 0
	adds r0, r5, 0
	bl sub_80A5350
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _080A66B4
	movs r0, 0x6
	movs r1, 0xB
	movs r2, 0xC
	movs r3, 0xB
	bl MenuZeroFillWindowRect
	ldr r0, _080A66AC @ =gScriptItemId
	ldrh r0, [r0]
	ldr r2, _080A66B0 @ =gTasks
	lsls r1, r5, 2
	adds r1, r5
	lsls r1, 3
	adds r1, r2
	ldrh r1, [r1, 0xA]
	bl BuyMenuDisplayMessage
	b _080A6758
	.align 2, 0
_080A66AC: .4byte gScriptItemId
_080A66B0: .4byte gTasks
_080A66B4:
	ldr r0, _080A6724 @ =gMain
	ldrh r1, [r0, 0x2E]
	movs r0, 0x1
	ands r0, r1
	cmp r0, 0
	beq _080A6744
	movs r0, 0x5
	bl PlaySE
	movs r0, 0
	movs r1, 0xA
	movs r2, 0xD
	movs r3, 0xD
	bl MenuZeroFillWindowRect
	ldr r0, _080A6728 @ =gBGTilemapBuffers + 0x800
	movs r1, 0x3
	str r1, [sp]
	movs r1, 0
	movs r2, 0xA
	movs r3, 0xD
	bl sub_80A36B8
	ldr r4, _080A672C @ =gStringVar1
	ldr r0, _080A6730 @ =gScriptItemId
	ldrh r0, [r0]
	bl ItemId_GetPrice
	lsls r0, 16
	lsrs r0, 17
	ldr r2, _080A6734 @ =gTasks
	lsls r1, r5, 2
	adds r1, r5
	lsls r1, 3
	adds r1, r2
	movs r2, 0xA
	ldrsh r1, [r1, r2]
	muls r1, r0
	adds r0, r4, 0
	movs r2, 0
	movs r3, 0x6
	bl ConvertIntToDecimalStringN
	ldr r4, _080A6738 @ =gStringVar4
	ldr r1, _080A673C @ =gOtherText_CanPay
	adds r0, r4, 0
	bl StringExpandPlaceholders
	ldr r2, _080A6740 @ =sub_80A6650
	adds r0, r5, 0
	adds r1, r4, 0
	movs r3, 0x1
	bl DisplayCannotUseItemMessage
	b _080A6758
	.align 2, 0
_080A6724: .4byte gMain
_080A6728: .4byte gBGTilemapBuffers + 0x800
_080A672C: .4byte gStringVar1
_080A6730: .4byte gScriptItemId
_080A6734: .4byte gTasks
_080A6738: .4byte gStringVar4
_080A673C: .4byte gOtherText_CanPay
_080A6740: .4byte sub_80A6650
_080A6744:
	movs r0, 0x2
	ands r0, r1
	cmp r0, 0
	beq _080A6758
	movs r0, 0x5
	bl PlaySE
	adds r0, r4, 0
	bl BuyMenuPrintItemQuantityAndPrice
_080A6758:
	add sp, 0x4
	pop {r4,r5}
	pop {r0}
	bx r0
	thumb_func_end Task_BuyHowManyDialogueHandleInput

	thumb_func_start sub_80A6760
sub_80A6760: @ 80A6760
	push {r4,lr}
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	ldr r1, _080A6794 @ =gTasks
	lsls r0, r4, 2
	adds r0, r4
	lsls r0, 3
	adds r0, r1
	movs r1, 0
	strh r1, [r0, 0x1C]
	movs r0, 0
	bl sub_80A7528
	adds r0, r4, 0
	bl sub_80A41D4
	bl ItemListMenu_InitMenu
	adds r0, r4, 0
	bl sub_80A37C0
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080A6794: .4byte gTasks
	thumb_func_end sub_80A6760

	thumb_func_start BuyMenuPrintItemQuantityAndPrice
BuyMenuPrintItemQuantityAndPrice: @ 80A6798
	push {r4,lr}
	sub sp, 0x4
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	ldr r0, _080A67E8 @ =gBGTilemapBuffers + 0x800
	movs r1, 0x1F
	str r1, [sp]
	movs r1, 0
	movs r2, 0
	movs r3, 0x1F
	bl sub_80A36B8
	movs r0, 0
	movs r1, 0
	bl RemoveMoneyLabelObject
	movs r0, 0
	movs r1, 0x4
	movs r2, 0xD
	movs r3, 0xD
	bl MenuZeroFillWindowRect
	movs r0, 0
	movs r1, 0xE
	movs r2, 0x1D
	movs r3, 0x13
	bl MenuZeroFillWindowRect
	ldr r1, _080A67EC @ =gTasks
	lsls r0, r4, 2
	adds r0, r4
	lsls r0, 3
	adds r0, r1
	ldr r1, _080A67F0 @ =sub_80A6760
	str r1, [r0]
	add sp, 0x4
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080A67E8: .4byte gBGTilemapBuffers + 0x800
_080A67EC: .4byte gTasks
_080A67F0: .4byte sub_80A6760
	thumb_func_end BuyMenuPrintItemQuantityAndPrice

	thumb_func_start BuyMenuDisplayMessage
BuyMenuDisplayMessage: @ 80A67F4
	push {r4-r6,lr}
	adds r4, r0, 0
	adds r5, r1, 0
	lsls r4, 16
	lsrs r4, 16
	lsls r5, 16
	lsrs r5, 16
	adds r0, r4, 0
	bl ItemId_GetPrice
	lsls r0, 16
	lsrs r0, 17
	muls r0, r5
	movs r1, 0x6
	movs r2, 0x6
	movs r3, 0xB
	bl sub_80B7A94
	ldr r6, _080A6838 @ =gStringVar1
	adds r0, r4, 0
	bl ItemId_GetPrice
	lsls r0, 16
	lsrs r0, 17
	adds r1, r0, 0
	muls r1, r5
	adds r0, r6, 0
	movs r2, 0
	movs r3, 0x6
	bl ConvertIntToDecimalStringN
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_080A6838: .4byte gStringVar1
	thumb_func_end BuyMenuDisplayMessage

	thumb_func_start sub_80A683C
sub_80A683C: @ 80A683C
	push {lr}
	sub sp, 0x4
	ldr r0, _080A6868 @ =gSaveBlock1
	movs r1, 0x92
	lsls r1, 3
	adds r0, r1
	ldr r0, [r0]
	movs r1, 0
	movs r2, 0
	bl sub_80B7C14
	ldr r0, _080A686C @ =gBGTilemapBuffers + 0x800
	movs r1, 0x2
	str r1, [sp]
	movs r1, 0x1
	movs r2, 0x1
	movs r3, 0xC
	bl sub_80A4008
	add sp, 0x4
	pop {r0}
	bx r0
	.align 2, 0
_080A6868: .4byte gSaveBlock1
_080A686C: .4byte gBGTilemapBuffers + 0x800
	thumb_func_end sub_80A683C

	thumb_func_start sub_80A6870
sub_80A6870: @ 80A6870
	push {r4,r5,lr}
	adds r4, r1, 0
	lsls r0, 16
	lsrs r0, 16
	lsls r4, 24
	lsrs r4, 24
	ldr r5, _080A68A0 @ =gSaveBlock1 + 0x490
	bl ItemId_GetPrice
	lsls r0, 16
	lsrs r0, 17
	adds r1, r0, 0
	muls r1, r4
	adds r0, r5, 0
	bl sub_80B79B8
	ldr r0, [r5]
	movs r1, 0
	movs r2, 0
	bl sub_80B7BEC
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080A68A0: .4byte gSaveBlock1 + 0x490
	thumb_func_end sub_80A6870

	thumb_func_start sub_80A68A4
sub_80A68A4: @ 80A68A4
	push {lr}
	bl sub_80A34B4
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _080A68BE
	ldr r0, _080A68C4 @ =sub_80A50C8
	movs r1, 0
	bl CreateTask
	ldr r1, _080A68C8 @ =gUnknown_02038563
	strb r0, [r1]
_080A68BE:
	pop {r0}
	bx r0
	.align 2, 0
_080A68C4: .4byte sub_80A50C8
_080A68C8: .4byte gUnknown_02038563
	thumb_func_end sub_80A68A4

	thumb_func_start sub_80A68CC
sub_80A68CC: @ 80A68CC
	push {lr}
	ldr r1, _080A68E4 @ =gUnknown_02038559
	movs r0, 0x3
	strb r0, [r1]
	ldr r1, _080A68E8 @ =gUnknown_03000701
	movs r0, 0x4
	strb r0, [r1]
	ldr r0, _080A68EC @ =sub_80A68A4
	bl SetMainCallback2
	pop {r0}
	bx r0
	.align 2, 0
_080A68E4: .4byte gUnknown_02038559
_080A68E8: .4byte gUnknown_03000701
_080A68EC: .4byte sub_80A68A4
	thumb_func_end sub_80A68CC

	thumb_func_start sub_80A68F0
sub_80A68F0: @ 80A68F0
	push {lr}
	lsls r0, 24
	lsrs r0, 24
	ldr r2, _080A6910 @ =gTasks
	lsls r1, r0, 2
	adds r1, r0
	lsls r1, 3
	adds r1, r2
	ldr r3, _080A6914 @ =sub_80546B8
	lsrs r2, r3, 16
	strh r2, [r1, 0x18]
	strh r3, [r1, 0x1A]
	bl sub_80A5AE4
	pop {r0}
	bx r0
	.align 2, 0
_080A6910: .4byte gTasks
_080A6914: .4byte sub_80546B8
	thumb_func_end sub_80A68F0

	thumb_func_start sub_80A6918
sub_80A6918: @ 80A6918
	push {lr}
	lsls r0, 24
	lsrs r0, 24
	ldr r2, _080A6938 @ =gTasks
	lsls r1, r0, 2
	adds r1, r0
	lsls r1, 3
	adds r1, r2
	ldr r3, _080A693C @ =sub_80546B8
	lsrs r2, r3, 16
	strh r2, [r1, 0x18]
	strh r3, [r1, 0x1A]
	bl sub_80A5AAC
	pop {r0}
	bx r0
	.align 2, 0
_080A6938: .4byte gTasks
_080A693C: .4byte sub_80546B8
	thumb_func_end sub_80A6918

	thumb_func_start sub_80A6940
sub_80A6940: @ 80A6940
	push {lr}
_080A6942:
	bl sub_80A317C
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _080A6968
	ldr r0, _080A6960 @ =sub_80A50C8
	movs r1, 0
	bl CreateTask
	ldr r1, _080A6964 @ =gUnknown_02038563
	strb r0, [r1]
	bl sub_80A699C
	b _080A6974
	.align 2, 0
_080A6960: .4byte sub_80A50C8
_080A6964: .4byte gUnknown_02038563
_080A6968:
	bl sub_80F9344
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _080A6942
_080A6974:
	pop {r0}
	bx r0
	thumb_func_end sub_80A6940

	thumb_func_start sub_80A6978
sub_80A6978: @ 80A6978
	push {lr}
	ldr r1, _080A6990 @ =gUnknown_02038559
	movs r0, 0x3
	strb r0, [r1]
	ldr r1, _080A6994 @ =gUnknown_03000701
	movs r0, 0x5
	strb r0, [r1]
	ldr r0, _080A6998 @ =sub_80A6940
	bl SetMainCallback2
	pop {r0}
	bx r0
	.align 2, 0
_080A6990: .4byte gUnknown_02038559
_080A6994: .4byte gUnknown_03000701
_080A6998: .4byte sub_80A6940
	thumb_func_end sub_80A6978

	thumb_func_start sub_80A699C
sub_80A699C: @ 80A699C
	ldr r1, _080A69AC @ =gUnknown_03000704
	ldr r0, _080A69B0 @ =gUnknown_083C16B8
	str r0, [r1]
	ldr r1, _080A69B4 @ =gUnknown_02038564
	movs r0, 0x4
	strb r0, [r1]
	bx lr
	.align 2, 0
_080A69AC: .4byte gUnknown_03000704
_080A69B0: .4byte gUnknown_083C16B8
_080A69B4: .4byte gUnknown_02038564
	thumb_func_end sub_80A699C

	thumb_func_start sub_80A69B8
sub_80A69B8: @ 80A69B8
	push {lr}
	lsls r0, 24
	lsrs r0, 24
	ldr r2, _080A69D8 @ =gTasks
	lsls r1, r0, 2
	adds r1, r0
	lsls r1, 3
	adds r1, r2
	ldr r3, _080A69DC @ =sub_804E990
	lsrs r2, r3, 16
	strh r2, [r1, 0x18]
	strh r3, [r1, 0x1A]
	bl sub_80A5AE4
	pop {r0}
	bx r0
	.align 2, 0
_080A69D8: .4byte gTasks
_080A69DC: .4byte sub_804E990
	thumb_func_end sub_80A69B8

	thumb_func_start sub_80A69E0
sub_80A69E0: @ 80A69E0
	push {lr}
	lsls r0, 24
	lsrs r0, 24
	ldr r2, _080A6A00 @ =gTasks
	lsls r1, r0, 2
	adds r1, r0
	lsls r1, 3
	adds r1, r2
	ldr r3, _080A6A04 @ =sub_804E990
	lsrs r2, r3, 16
	strh r2, [r1, 0x18]
	strh r3, [r1, 0x1A]
	bl sub_80A5AAC
	pop {r0}
	bx r0
	.align 2, 0
_080A6A00: .4byte gTasks
_080A6A04: .4byte sub_804E990
	thumb_func_end sub_80A69E0

	thumb_func_start sub_80A6A08
sub_80A6A08: @ 80A6A08
	push {lr}
	bl sub_80A34B4
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _080A6A22
	ldr r0, _080A6A28 @ =sub_80A50C8
	movs r1, 0
	bl CreateTask
	ldr r1, _080A6A2C @ =gUnknown_02038563
	strb r0, [r1]
_080A6A22:
	pop {r0}
	bx r0
	.align 2, 0
_080A6A28: .4byte sub_80A50C8
_080A6A2C: .4byte gUnknown_02038563
	thumb_func_end sub_80A6A08

	thumb_func_start sub_80A6A30
sub_80A6A30: @ 80A6A30
	push {lr}
	ldr r0, _080A6A44 @ =gUnknown_03000701
	movs r1, 0x6
	strb r1, [r0]
	ldr r0, _080A6A48 @ =sub_80A6A08
	bl SetMainCallback2
	pop {r0}
	bx r0
	.align 2, 0
_080A6A44: .4byte gUnknown_03000701
_080A6A48: .4byte sub_80A6A08
	thumb_func_end sub_80A6A30

	thumb_func_start sub_80A6A4C
sub_80A6A4C: @ 80A6A4C
	push {lr}
	lsls r0, 24
	lsrs r0, 24
	ldr r2, _080A6A74 @ =gFieldCallback
	ldr r1, _080A6A78 @ =ItemStorage_ReturnToMenuAfterDeposit
	str r1, [r2]
	ldr r2, _080A6A7C @ =gTasks
	lsls r1, r0, 2
	adds r1, r0
	lsls r1, 3
	adds r1, r2
	ldr r3, _080A6A80 @ =c2_exit_to_overworld_2_switch
	lsrs r2, r3, 16
	strh r2, [r1, 0x18]
	strh r3, [r1, 0x1A]
	bl sub_80A5AE4
	pop {r0}
	bx r0
	.align 2, 0
_080A6A74: .4byte gFieldCallback
_080A6A78: .4byte ItemStorage_ReturnToMenuAfterDeposit
_080A6A7C: .4byte gTasks
_080A6A80: .4byte c2_exit_to_overworld_2_switch
	thumb_func_end sub_80A6A4C

	thumb_func_start sub_80A6A84
sub_80A6A84: @ 80A6A84
	push {r4-r6,lr}
	mov r6, r8
	push {r6}
	adds r5, r0, 0
	lsls r5, 24
	lsrs r5, 24
	lsls r4, r5, 2
	adds r4, r5
	lsls r4, 3
	ldr r6, _080A6AE8 @ =gTasks + 0x8
	adds r0, r4, r6
	mov r8, r0
	ldr r0, _080A6AEC @ =gBGTilemapBuffers + 0x800
	bl sub_80A4DA4
	ldr r0, _080A6AF0 @ =gScriptItemId
	ldrh r0, [r0]
	ldr r1, _080A6AF4 @ =gStringVar1
	bl CopyItemName
	ldr r0, _080A6AF8 @ =gStringVar2
	mov r2, r8
	movs r3, 0x2
	ldrsh r1, [r2, r3]
	movs r2, 0
	movs r3, 0x3
	bl ConvertIntToDecimalStringN
	movs r0, 0x7
	movs r1, 0x6
	movs r2, 0xB
	movs r3, 0xD
	bl MenuZeroFillWindowRect
	movs r0, 0x7
	bl sub_80A7528
	adds r0, r5, 0
	bl sub_80A3D5C
	subs r6, 0x8
	adds r4, r6
	ldr r0, _080A6AFC @ =sub_80A5E1C
	str r0, [r4]
	pop {r3}
	mov r8, r3
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_080A6AE8: .4byte gTasks + 0x8
_080A6AEC: .4byte gBGTilemapBuffers + 0x800
_080A6AF0: .4byte gScriptItemId
_080A6AF4: .4byte gStringVar1
_080A6AF8: .4byte gStringVar2
_080A6AFC: .4byte sub_80A5E1C
	thumb_func_end sub_80A6A84

	thumb_func_start sub_80A6B00
sub_80A6B00: @ 80A6B00
	push {r4,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	ldr r0, _080A6B54 @ =gMain
	ldrh r1, [r0, 0x2E]
	movs r0, 0x1
	ands r0, r1
	cmp r0, 0
	bne _080A6B1A
	movs r0, 0x2
	ands r0, r1
	cmp r0, 0
	beq _080A6B4C
_080A6B1A:
	ldr r1, _080A6B58 @ =gTasks
	lsls r0, r4, 2
	adds r0, r4
	lsls r0, 3
	adds r0, r1
	movs r1, 0
	strh r1, [r0, 0x1C]
	ldr r1, _080A6B5C @ =gUnknown_03005D10
	ldr r0, _080A6B60 @ =gUnknown_02038559
	ldrb r0, [r0]
	lsls r0, 24
	asrs r0, 24
	lsls r0, 2
	adds r0, r1
	ldrb r2, [r0]
	adds r0, r4, 0
	adds r1, r2, 0
	bl sub_80A48E8
	movs r0, 0x5
	bl PlaySE
	adds r0, r4, 0
	bl sub_80A5D38
_080A6B4C:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080A6B54: .4byte gMain
_080A6B58: .4byte gTasks
_080A6B5C: .4byte gUnknown_03005D10
_080A6B60: .4byte gUnknown_02038559
	thumb_func_end sub_80A6B00

	thumb_func_start sub_80A6B64
sub_80A6B64: @ 80A6B64
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	lsls r0, 24
	lsrs r4, r0, 24
	lsls r0, r4, 2
	adds r0, r4
	lsls r5, r0, 3
	ldr r6, _080A6B9C @ =gTasks + 0x8
	adds r7, r5, r6
	ldr r0, _080A6BA0 @ =gScriptItemId
	mov r8, r0
	ldrh r0, [r0]
	bl ItemId_GetImportance
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x2
	bne _080A6BA8
	adds r0, r6, 0
	subs r0, 0x8
	adds r0, r5, r0
	ldr r1, _080A6BA4 @ =sub_80A6B00
	str r1, [r0]
	movs r0, 0x9
	bl sub_80A7528
	b _080A6BD2
	.align 2, 0
_080A6B9C: .4byte gTasks + 0x8
_080A6BA0: .4byte gScriptItemId
_080A6BA4: .4byte sub_80A6B00
_080A6BA8:
	mov r1, r8
	ldrh r0, [r1]
	ldrh r1, [r7, 0x2]
	bl AddPCItem
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _080A6BC2
	adds r0, r4, 0
	bl sub_80A6A84
	b _080A6BD2
_080A6BC2:
	adds r0, r6, 0
	subs r0, 0x8
	adds r0, r5, r0
	ldr r1, _080A6BDC @ =sub_80A6B00
	str r1, [r0]
	movs r0, 0x8
	bl sub_80A7528
_080A6BD2:
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080A6BDC: .4byte sub_80A6B00
	thumb_func_end sub_80A6B64

	thumb_func_start sub_80A6BE0
sub_80A6BE0: @ 80A6BE0
	push {r4,r5,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	adds r5, r4, 0
	adds r0, r4, 0
	bl sub_80A5350
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	beq _080A6C58
	ldr r0, _080A6C18 @ =gMain
	ldrh r1, [r0, 0x2E]
	movs r2, 0x1
	ands r2, r1
	cmp r2, 0
	beq _080A6C20
	movs r0, 0x5
	bl PlaySE
	ldr r0, _080A6C1C @ =gBGTilemapBuffers + 0x800
	bl sub_80A4DA4
	adds r0, r4, 0
	bl sub_80A6B64
	b _080A6C58
	.align 2, 0
_080A6C18: .4byte gMain
_080A6C1C: .4byte gBGTilemapBuffers + 0x800
_080A6C20:
	movs r0, 0x2
	ands r0, r1
	cmp r0, 0
	beq _080A6C58
	ldr r1, _080A6C60 @ =gTasks
	lsls r0, r5, 2
	adds r0, r5
	lsls r0, 3
	adds r0, r1
	strh r2, [r0, 0x1C]
	ldr r1, _080A6C64 @ =gUnknown_03005D10
	ldr r0, _080A6C68 @ =gUnknown_02038559
	ldrb r0, [r0]
	lsls r0, 24
	asrs r0, 24
	lsls r0, 2
	adds r0, r1
	ldrb r2, [r0]
	adds r0, r5, 0
	adds r1, r2, 0
	bl sub_80A48E8
	movs r0, 0x5
	bl PlaySE
	adds r0, r5, 0
	bl sub_80A5D38
_080A6C58:
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080A6C60: .4byte gTasks
_080A6C64: .4byte gUnknown_03005D10
_080A6C68: .4byte gUnknown_02038559
	thumb_func_end sub_80A6BE0

	thumb_func_start sub_80A6C6C
sub_80A6C6C: @ 80A6C6C
	push {r4-r6,lr}
	sub sp, 0x8
	lsls r0, 24
	lsrs r4, r0, 24
	ldr r1, _080A6CE4 @ =gTasks
	lsls r0, r4, 2
	adds r0, r4
	lsls r0, 3
	adds r5, r0, r1
	ldr r2, _080A6CE8 @ =gUnknown_03005D10
	ldr r6, _080A6CEC @ =gUnknown_02038559
	movs r0, 0
	ldrsb r0, [r6, r0]
	lsls r0, 2
	adds r0, r2
	ldrb r1, [r0, 0x1]
	ldrb r0, [r0]
	adds r1, r0
	adds r1, 0x1
	strh r1, [r5, 0x1C]
	movs r0, 0
	ldrsb r0, [r6, r0]
	lsls r0, 2
	adds r0, r2
	ldrb r2, [r0]
	adds r0, r4, 0
	adds r1, r2, 0
	bl sub_80A48E8
	bl sub_80A73FC
	movs r0, 0x5
	bl PlaySE
	bl sub_80A7590
	movs r0, 0
	ldrsb r0, [r6, r0]
	cmp r0, 0x4
	beq _080A6D0A
	ldr r0, _080A6CF0 @ =sub_80A6BE0
	str r0, [r5]
	movs r0, 0x6
	bl sub_80A7528
	movs r0, 0
	ldrsb r0, [r6, r0]
	cmp r0, 0x3
	bne _080A6CF4
	movs r0, 0x3
	str r0, [sp]
	str r0, [sp, 0x4]
	adds r0, r4, 0
	movs r1, 0x6
	movs r2, 0x9
	movs r3, 0x7
	bl sub_80A4DD8
	b _080A6D14
	.align 2, 0
_080A6CE4: .4byte gTasks
_080A6CE8: .4byte gUnknown_03005D10
_080A6CEC: .4byte gUnknown_02038559
_080A6CF0: .4byte sub_80A6BE0
_080A6CF4:
	movs r0, 0x3
	str r0, [sp]
	movs r0, 0x2
	str r0, [sp, 0x4]
	adds r0, r4, 0
	movs r1, 0x7
	movs r2, 0x9
	movs r3, 0x6
	bl sub_80A4DD8
	b _080A6D14
_080A6D0A:
	movs r0, 0x1
	strh r0, [r5, 0xA]
	adds r0, r4, 0
	bl sub_80A6B64
_080A6D14:
	add sp, 0x8
	pop {r4-r6}
	pop {r0}
	bx r0
	thumb_func_end sub_80A6C6C

	thumb_func_start sub_80A6D1C
sub_80A6D1C: @ 80A6D1C
	push {r4,r5,lr}
	bl HideMapNamePopup
	ldr r0, _080A6D70 @ =gSaveBlock1
	ldr r1, _080A6D74 @ =0x00000496
	adds r4, r0, r1
	ldrh r0, [r4]
	cmp r0, 0
	beq _080A6D84
	movs r1, 0x1
	bl CheckBagHasItem
	lsls r0, 24
	lsrs r5, r0, 24
	cmp r5, 0x1
	bne _080A6D80
	bl ScriptContext2_Enable
	bl FreezeMapObjects
	bl sub_80594C0
	bl sub_80597F4
	ldr r1, _080A6D78 @ =gScriptItemId
	ldrh r0, [r4]
	strh r0, [r1]
	ldrh r0, [r4]
	bl ItemId_GetFieldFunc
	movs r1, 0x8
	bl CreateTask
	lsls r0, 24
	lsrs r0, 24
	ldr r2, _080A6D7C @ =gTasks
	lsls r1, r0, 2
	adds r1, r0
	lsls r1, 3
	adds r1, r2
	strh r5, [r1, 0xC]
	b _080A6D8A
	.align 2, 0
_080A6D70: .4byte gSaveBlock1
_080A6D74: .4byte 0x00000496
_080A6D78: .4byte gScriptItemId
_080A6D7C: .4byte gTasks
_080A6D80:
	movs r0, 0
	strh r0, [r4]
_080A6D84:
	ldr r0, _080A6D94 @ =Event_NoRegisteredItem
	bl ScriptContext1_SetupScript
_080A6D8A:
	movs r0, 0x1
	pop {r4,r5}
	pop {r1}
	bx r1
	.align 2, 0
_080A6D94: .4byte Event_NoRegisteredItem
	thumb_func_end sub_80A6D1C

	thumb_func_start sub_80A6D98
sub_80A6D98: @ 80A6D98
	push {lr}
_080A6D9A:
	bl sub_80A317C
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _080A6DBC
	ldr r0, _080A6DB4 @ =sub_80A50C8
	movs r1, 0
	bl CreateTask
	ldr r1, _080A6DB8 @ =gUnknown_02038563
	strb r0, [r1]
	b _080A6DC8
	.align 2, 0
_080A6DB4: .4byte sub_80A50C8
_080A6DB8: .4byte gUnknown_02038563
_080A6DBC:
	bl sub_80F9344
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _080A6D9A
_080A6DC8:
	pop {r0}
	bx r0
	thumb_func_end sub_80A6D98

	thumb_func_start sub_80A6DCC
sub_80A6DCC: @ 80A6DCC
	push {lr}
	ldr r1, _080A6DE4 @ =gUnknown_03000700
	movs r0, 0
	strb r0, [r1]
	ldr r1, _080A6DE8 @ =gUnknown_03000701
	movs r0, 0x1
	strb r0, [r1]
	ldr r0, _080A6DEC @ =sub_80A6D98
	bl SetMainCallback2
	pop {r0}
	bx r0
	.align 2, 0
_080A6DE4: .4byte gUnknown_03000700
_080A6DE8: .4byte gUnknown_03000701
_080A6DEC: .4byte sub_80A6D98
	thumb_func_end sub_80A6DCC

	thumb_func_start sub_80A6DF0
sub_80A6DF0: @ 80A6DF0
	push {r4-r6,lr}
	sub sp, 0x8
	adds r5, r0, 0
	ldr r4, _080A6E4C @ =gUnknown_02038564
	ldrb r0, [r4]
	subs r0, 0x1
	lsls r0, 25
	lsrs r6, r0, 24
	movs r1, 0x9
	subs r1, r6
	lsls r1, 24
	lsrs r1, 24
	movs r0, 0x7
	movs r2, 0xD
	movs r3, 0xC
	bl MenuDrawTextWindow
	movs r2, 0xA
	subs r2, r6
	lsls r2, 24
	lsrs r2, 24
	adds r0, r6, 0x2
	lsls r0, 24
	lsrs r0, 24
	str r0, [sp]
	adds r0, r5, 0
	movs r1, 0x8
	movs r3, 0x5
	bl sub_80A4008
	ldrb r0, [r4]
	cmp r0, 0x1
	bne _080A6E58
	ldr r1, _080A6E50 @ =gUnknown_083C1640
	ldr r0, _080A6E54 @ =gUnknown_03000704
	ldr r0, [r0]
	ldrb r0, [r0]
	lsls r0, 3
	adds r0, r1
	ldr r0, [r0]
	movs r1, 0x8
	movs r2, 0xA
	bl MenuPrint
	b _080A6E80
	.align 2, 0
_080A6E4C: .4byte gUnknown_02038564
_080A6E50: .4byte gUnknown_083C1640
_080A6E54: .4byte gUnknown_03000704
_080A6E58:
	ldr r5, _080A6EAC @ =gUnknown_083C1640
	ldr r4, _080A6EB0 @ =gUnknown_03000704
	ldr r0, [r4]
	ldrb r0, [r0]
	lsls r0, 3
	adds r0, r5
	ldr r0, [r0]
	movs r1, 0x8
	movs r2, 0x8
	bl MenuPrint
	ldr r0, [r4]
	ldrb r0, [r0, 0x1]
	lsls r0, 3
	adds r0, r5
	ldr r0, [r0]
	movs r1, 0x8
	movs r2, 0xA
	bl MenuPrint
_080A6E80:
	movs r2, 0xA
	subs r2, r6
	lsls r2, 24
	lsrs r2, 24
	ldr r0, _080A6EB4 @ =gUnknown_02038564
	ldrb r3, [r0]
	movs r0, 0
	str r0, [sp]
	movs r0, 0x5
	str r0, [sp, 0x4]
	movs r0, 0
	movs r1, 0x8
	bl InitMenu
	movs r0, 0x2
	bl sub_80A7528
	add sp, 0x8
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_080A6EAC: .4byte gUnknown_083C1640
_080A6EB0: .4byte gUnknown_03000704
_080A6EB4: .4byte gUnknown_02038564
	thumb_func_end sub_80A6DF0

	thumb_func_start sub_80A6EB8
sub_80A6EB8: @ 80A6EB8
	push {r4,r5,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	adds r5, r4, 0
	ldr r2, _080A6EE0 @ =gMain
	ldrh r0, [r2, 0x30]
	movs r1, 0xF0
	ands r1, r0
	cmp r1, 0x40
	bne _080A6EE8
	ldr r4, _080A6EE4 @ =gUnknown_03000700
	ldrb r0, [r4]
	cmp r0, 0x1
	bne _080A6FC0
	movs r0, 0x5
	bl PlaySE
	movs r0, 0x1
	negs r0, r0
	b _080A6F02
	.align 2, 0
_080A6EE0: .4byte gMain
_080A6EE4: .4byte gUnknown_03000700
_080A6EE8:
	cmp r1, 0x80
	bne _080A6F14
	ldr r4, _080A6F0C @ =gUnknown_03000700
	ldrb r0, [r4]
	adds r0, 0x1
	ldr r1, _080A6F10 @ =gUnknown_02038564
	ldrb r1, [r1]
	cmp r0, r1
	bge _080A6FC0
	movs r0, 0x5
	bl PlaySE
	movs r0, 0x1
_080A6F02:
	bl MoveMenuCursor
	strb r0, [r4]
	b _080A6FC0
	.align 2, 0
_080A6F0C: .4byte gUnknown_03000700
_080A6F10: .4byte gUnknown_02038564
_080A6F14:
	ldrh r1, [r2, 0x2E]
	movs r2, 0x1
	ands r2, r1
	cmp r2, 0
	beq _080A6F84
	ldr r1, _080A6F68 @ =gTasks
	lsls r0, r4, 2
	adds r0, r4
	lsls r0, 3
	adds r0, r1
	movs r1, 0
	strh r1, [r0, 0x1C]
	ldr r1, _080A6F6C @ =gUnknown_03005D10
	ldr r0, _080A6F70 @ =gUnknown_02038559
	ldrb r0, [r0]
	lsls r0, 24
	asrs r0, 24
	lsls r0, 2
	adds r0, r1
	ldrb r2, [r0]
	adds r0, r4, 0
	adds r1, r2, 0
	bl sub_80A48E8
	ldr r0, _080A6F74 @ =gBGTilemapBuffers + 0x800
	bl sub_80A4DA4
	ldr r1, _080A6F78 @ =gUnknown_083C1640
	ldr r0, _080A6F7C @ =gUnknown_03000700
	ldrb r2, [r0]
	ldr r0, _080A6F80 @ =gUnknown_03000704
	ldr r0, [r0]
	adds r0, r2
	ldrb r0, [r0]
	lsls r0, 3
	adds r1, 0x4
	adds r0, r1
	ldr r1, [r0]
	adds r0, r4, 0
	bl _call_via_r1
	b _080A6FC0
	.align 2, 0
_080A6F68: .4byte gTasks
_080A6F6C: .4byte gUnknown_03005D10
_080A6F70: .4byte gUnknown_02038559
_080A6F74: .4byte gBGTilemapBuffers + 0x800
_080A6F78: .4byte gUnknown_083C1640
_080A6F7C: .4byte gUnknown_03000700
_080A6F80: .4byte gUnknown_03000704
_080A6F84:
	movs r0, 0x2
	ands r0, r1
	cmp r0, 0
	beq _080A6FC0
	ldr r1, _080A6FC8 @ =gTasks
	lsls r0, r5, 2
	adds r0, r5
	lsls r0, 3
	adds r0, r1
	strh r2, [r0, 0x1C]
	ldr r1, _080A6FCC @ =gUnknown_03005D10
	ldr r0, _080A6FD0 @ =gUnknown_02038559
	ldrb r0, [r0]
	lsls r0, 24
	asrs r0, 24
	lsls r0, 2
	adds r0, r1
	ldrb r2, [r0]
	adds r0, r5, 0
	adds r1, r2, 0
	bl sub_80A48E8
	ldr r0, _080A6FD4 @ =gBGTilemapBuffers + 0x800
	bl sub_80A4DA4
	ldr r0, _080A6FD8 @ =gUnknown_083C1640
	ldr r1, [r0, 0x2C]
	adds r0, r5, 0
	bl _call_via_r1
_080A6FC0:
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080A6FC8: .4byte gTasks
_080A6FCC: .4byte gUnknown_03005D10
_080A6FD0: .4byte gUnknown_02038559
_080A6FD4: .4byte gBGTilemapBuffers + 0x800
_080A6FD8: .4byte gUnknown_083C1640
	thumb_func_end sub_80A6EB8

	thumb_func_start sub_80A6FDC
sub_80A6FDC: @ 80A6FDC
	push {lr}
	ldr r0, _080A6FF8 @ =gScriptItemId
	ldrh r0, [r0]
	bl ItemId_GetBattleUsage
	lsls r0, 24
	cmp r0, 0
	beq _080A7008
	ldr r1, _080A6FFC @ =gUnknown_03000704
	ldr r0, _080A7000 @ =gUnknown_083C1708
	str r0, [r1]
	ldr r1, _080A7004 @ =gUnknown_02038564
	movs r0, 0x2
	b _080A7012
	.align 2, 0
_080A6FF8: .4byte gScriptItemId
_080A6FFC: .4byte gUnknown_03000704
_080A7000: .4byte gUnknown_083C1708
_080A7004: .4byte gUnknown_02038564
_080A7008:
	ldr r1, _080A7018 @ =gUnknown_03000704
	ldr r0, _080A701C @ =gUnknown_083C170A
	str r0, [r1]
	ldr r1, _080A7020 @ =gUnknown_02038564
	movs r0, 0x1
_080A7012:
	strb r0, [r1]
	pop {r0}
	bx r0
	.align 2, 0
_080A7018: .4byte gUnknown_03000704
_080A701C: .4byte gUnknown_083C170A
_080A7020: .4byte gUnknown_02038564
	thumb_func_end sub_80A6FDC

	thumb_func_start sub_80A7024
sub_80A7024: @ 80A7024
	push {r4,r5,lr}
	adds r5, r0, 0
	lsls r5, 24
	lsrs r5, 24
	ldr r1, _080A707C @ =gUnknown_03000700
	movs r0, 0
	strb r0, [r1]
	bl sub_80A6FDC
	ldr r0, _080A7080 @ =gTasks
	lsls r4, r5, 2
	adds r4, r5
	lsls r4, 3
	adds r4, r0
	ldr r3, _080A7084 @ =gUnknown_03005D10
	ldr r2, _080A7088 @ =gUnknown_02038559
	movs r0, 0
	ldrsb r0, [r2, r0]
	lsls r0, 2
	adds r0, r3
	ldrb r1, [r0, 0x1]
	ldrb r0, [r0]
	adds r1, r0
	adds r1, 0x1
	strh r1, [r4, 0x1C]
	movs r0, 0
	ldrsb r0, [r2, r0]
	lsls r0, 2
	adds r0, r3
	ldrb r2, [r0]
	adds r0, r5, 0
	adds r1, r2, 0
	bl sub_80A48E8
	bl sub_80A73FC
	ldr r0, _080A708C @ =gBGTilemapBuffers + 0x800
	bl sub_80A6DF0
	ldr r0, _080A7090 @ =sub_80A6EB8
	str r0, [r4]
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080A707C: .4byte gUnknown_03000700
_080A7080: .4byte gTasks
_080A7084: .4byte gUnknown_03005D10
_080A7088: .4byte gUnknown_02038559
_080A708C: .4byte gBGTilemapBuffers + 0x800
_080A7090: .4byte sub_80A6EB8
	thumb_func_end sub_80A7024

	thumb_func_start sub_80A7094
sub_80A7094: @ 80A7094
	push {lr}
	sub sp, 0x4
	lsls r0, 24
	lsrs r0, 24
	ldr r2, _080A70CC @ =gTasks
	lsls r1, r0, 2
	adds r1, r0
	lsls r1, 3
	adds r1, r2
	ldr r2, _080A70D0 @ =sub_802E424
	lsrs r0, r2, 16
	movs r3, 0
	strh r0, [r1, 0x18]
	strh r2, [r1, 0x1A]
	ldr r0, _080A70D4 @ =HandleItemMenuPaletteFade
	str r0, [r1]
	movs r0, 0x1
	negs r0, r0
	str r3, [sp]
	movs r1, 0
	movs r2, 0
	movs r3, 0x10
	bl BeginNormalPaletteFade
	add sp, 0x4
	pop {r0}
	bx r0
	.align 2, 0
_080A70CC: .4byte gTasks
_080A70D0: .4byte sub_802E424
_080A70D4: .4byte HandleItemMenuPaletteFade
	thumb_func_end sub_80A7094

	thumb_func_start sub_80A70D8
sub_80A70D8: @ 80A70D8
	push {r4,lr}
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	movs r0, 0x5
	bl PlaySE
	adds r0, r4, 0
	bl sub_80A7094
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end sub_80A70D8

	thumb_func_start ItemMenu_UseInBattle
ItemMenu_UseInBattle: @ 80A70F4
	push {r4,r5,lr}
	lsls r0, 24
	lsrs r5, r0, 24
	ldr r4, _080A7120 @ =gScriptItemId
	ldrh r0, [r4]
	bl ItemId_GetBattleFunc
	cmp r0, 0
	beq _080A711A
	movs r0, 0x5
	bl PlaySE
	ldrh r0, [r4]
	bl ItemId_GetBattleFunc
	adds r1, r0, 0
	adds r0, r5, 0
	bl _call_via_r1
_080A711A:
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080A7120: .4byte gScriptItemId
	thumb_func_end ItemMenu_UseInBattle

	thumb_func_start sub_80A7124
sub_80A7124: @ 80A7124
	push {r4,lr}
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	movs r0, 0x5
	bl PlaySE
	movs r0, 0
	bl sub_80A7528
	adds r0, r4, 0
	bl sub_80A41D4
	bl ItemListMenu_InitMenu
	adds r0, r4, 0
	bl sub_80A37C0
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end sub_80A7124

	thumb_func_start sub_80A7150
sub_80A7150: @ 80A7150
	push {r4,r5,lr}
	ldr r4, _080A7158 @ =gUnknown_02038563
	ldr r5, _080A715C @ =gTasks
	b _080A716C
	.align 2, 0
_080A7158: .4byte gUnknown_02038563
_080A715C: .4byte gTasks
_080A7160:
	bl sub_80F9344
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	beq _080A7190
_080A716C:
	bl sub_80A317C
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _080A7160
	ldr r0, _080A7198 @ =sub_80A7230
	movs r1, 0
	bl CreateTask
	strb r0, [r4]
	ldrb r1, [r4]
	lsls r0, r1, 2
	adds r0, r1
	lsls r0, 3
	adds r0, r5
	movs r1, 0
	strh r1, [r0, 0x26]
_080A7190:
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080A7198: .4byte sub_80A7230
	thumb_func_end sub_80A7150

	thumb_func_start PrepareBagForWallyTutorial
PrepareBagForWallyTutorial: @ 80A719C
	push {r4,r5,lr}
	ldr r0, _080A7214 @ =gUnknown_03000700
	movs r1, 0
	strb r1, [r0]
	ldr r0, _080A7218 @ =gUnknown_02038559
	strb r1, [r0]
	movs r1, 0
	ldr r4, _080A721C @ =0x0201e000
	ldr r5, _080A7220 @ =gSaveBlock1 + 0x560
	ldr r3, _080A7224 @ =gUnknown_03005D10
	movs r2, 0
_080A71B2:
	lsls r0, r1, 2
	adds r0, r3
	strb r2, [r0]
	strb r2, [r0, 0x1]
	adds r0, r1, 0x1
	lsls r0, 24
	lsrs r1, r0, 24
	cmp r1, 0x4
	bls _080A71B2
	adds r0, r4, 0
	adds r1, r5, 0
	movs r2, 0x50
	bl memcpy
	movs r1, 0x80
	lsls r1, 5
	adds r0, r4, r1
	adds r4, r5, 0
	adds r4, 0xA0
	adds r1, r4, 0
	movs r2, 0x40
	bl memcpy
	adds r0, r5, 0
	movs r1, 0x14
	bl ClearItemSlots
	adds r0, r4, 0
	movs r1, 0x10
	bl ClearItemSlots
	movs r0, 0xD
	movs r1, 0x1
	bl AddBagItem
	movs r0, 0x4
	movs r1, 0x1
	bl AddBagItem
	ldr r1, _080A7228 @ =gUnknown_03000701
	movs r0, 0x7
	strb r0, [r1]
	ldr r0, _080A722C @ =sub_80A7150
	bl SetMainCallback2
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080A7214: .4byte gUnknown_03000700
_080A7218: .4byte gUnknown_02038559
_080A721C: .4byte 0x0201e000
_080A7220: .4byte gSaveBlock1 + 0x560
_080A7224: .4byte gUnknown_03005D10
_080A7228: .4byte gUnknown_03000701
_080A722C: .4byte sub_80A7150
	thumb_func_end PrepareBagForWallyTutorial

	thumb_func_start sub_80A7230
sub_80A7230: @ 80A7230
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	sub sp, 0x4
	lsls r0, 24
	lsrs r5, r0, 24
	lsls r0, r5, 2
	adds r0, r5
	lsls r6, r0, 3
	ldr r0, _080A725C @ =gTasks + 0x8
	mov r8, r0
	adds r7, r6, r0
	movs r0, 0x1E
	ldrsh r1, [r7, r0]
	cmp r1, 0xCC
	beq _080A727A
	cmp r1, 0xCC
	bgt _080A7260
	cmp r1, 0x66
	beq _080A726A
	b _080A7358
	.align 2, 0
_080A725C: .4byte gTasks + 0x8
_080A7260:
	movs r0, 0x99
	lsls r0, 1
	cmp r1, r0
	beq _080A72F4
	b _080A7358
_080A726A:
	movs r0, 0x5
	bl PlaySE
	movs r0, 0x1
	movs r1, 0x2
	bl sub_80A4E8C
	b _080A7358
_080A727A:
	movs r0, 0x5
	bl PlaySE
	movs r0, 0x2
	bl sub_80F98A4
	movs r0, 0x3
	bl sub_80F98A4
	ldr r1, _080A72D8 @ =gScriptItemId
	movs r0, 0x4
	strh r0, [r1]
	ldr r1, _080A72DC @ =gUnknown_03000704
	ldr r0, _080A72E0 @ =gUnknown_083C1708
	str r0, [r1]
	ldr r1, _080A72E4 @ =gUnknown_02038564
	movs r0, 0x2
	strb r0, [r1]
	mov r0, r8
	adds r4, r0, r6
	ldr r3, _080A72E8 @ =gUnknown_03005D10
	ldr r2, _080A72EC @ =gUnknown_02038559
	movs r0, 0
	ldrsb r0, [r2, r0]
	lsls r0, 2
	adds r0, r3
	ldrb r1, [r0, 0x1]
	ldrb r0, [r0]
	adds r1, r0
	adds r1, 0x1
	strh r1, [r4, 0x14]
	movs r0, 0
	ldrsb r0, [r2, r0]
	lsls r0, 2
	adds r0, r3
	ldrb r2, [r0]
	adds r0, r5, 0
	adds r1, r2, 0
	bl sub_80A48E8
	bl sub_80A73FC
	ldr r0, _080A72F0 @ =gBGTilemapBuffers + 0x800
	bl sub_80A6DF0
	b _080A7358
	.align 2, 0
_080A72D8: .4byte gScriptItemId
_080A72DC: .4byte gUnknown_03000704
_080A72E0: .4byte gUnknown_083C1708
_080A72E4: .4byte gUnknown_02038564
_080A72E8: .4byte gUnknown_03005D10
_080A72EC: .4byte gUnknown_02038559
_080A72F0: .4byte gBGTilemapBuffers + 0x800
_080A72F4:
	movs r0, 0x5
	bl PlaySE
	ldr r0, _080A7344 @ =gBGTilemapBuffers + 0x800
	bl sub_80A4DA4
	ldr r4, _080A7348 @ =gSaveBlock1 + 0x560
	ldr r5, _080A734C @ =0x0201e000
	adds r0, r4, 0
	adds r1, r5, 0
	movs r2, 0x50
	bl memcpy
	adds r4, 0xA0
	movs r0, 0x80
	lsls r0, 5
	adds r5, r0
	adds r0, r4, 0
	adds r1, r5, 0
	movs r2, 0x40
	bl memcpy
	ldr r1, _080A7350 @ =sub_802E424
	lsrs r0, r1, 16
	strh r0, [r7, 0x10]
	strh r1, [r7, 0x12]
	mov r0, r8
	subs r0, 0x8
	adds r0, r6, r0
	ldr r1, _080A7354 @ =HandleItemMenuPaletteFade
	str r1, [r0]
	movs r0, 0x1
	negs r0, r0
	movs r1, 0
	str r1, [sp]
	movs r2, 0
	movs r3, 0x10
	bl BeginNormalPaletteFade
	b _080A735E
	.align 2, 0
_080A7344: .4byte gBGTilemapBuffers + 0x800
_080A7348: .4byte gSaveBlock1 + 0x560
_080A734C: .4byte 0x0201e000
_080A7350: .4byte sub_802E424
_080A7354: .4byte HandleItemMenuPaletteFade
_080A7358:
	ldrh r0, [r7, 0x1E]
	adds r0, 0x1
	strh r0, [r7, 0x1E]
_080A735E:
	add sp, 0x4
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r0}
	bx r0
	thumb_func_end sub_80A7230

	thumb_func_start ItemListMenu_InitMenu
ItemListMenu_InitMenu: @ 80A736C
	push {lr}
	sub sp, 0x8
	ldr r1, _080A73B0 @ =gUnknown_03005D10
	ldr r0, _080A73B4 @ =gUnknown_02038559
	ldrb r0, [r0]
	lsls r0, 24
	asrs r0, 24
	lsls r0, 2
	adds r0, r1
	ldrb r3, [r0, 0x3]
	adds r3, 0x1
	lsls r3, 24
	lsrs r3, 24
	ldrb r0, [r0]
	str r0, [sp]
	movs r0, 0
	str r0, [sp, 0x4]
	movs r1, 0xE
	movs r2, 0x2
	bl InitMenu
	ldr r1, _080A73B8 @ =0x0000ffff
	ldr r3, _080A73BC @ =0x00002d9f
	movs r0, 0xF
	str r0, [sp]
	movs r0, 0x10
	movs r2, 0xC
	bl CreateBlendedOutlineCursor
	bl sub_80A73C0
	add sp, 0x8
	pop {r0}
	bx r0
	.align 2, 0
_080A73B0: .4byte gUnknown_03005D10
_080A73B4: .4byte gUnknown_02038559
_080A73B8: .4byte 0x0000ffff
_080A73BC: .4byte 0x00002d9f
	thumb_func_end ItemListMenu_InitMenu

	thumb_func_start sub_80A73C0
sub_80A73C0: @ 80A73C0
	push {lr}
	ldr r1, _080A73E8 @ =gUnknown_03005D10
	ldr r0, _080A73EC @ =gUnknown_02038559
	ldrb r0, [r0]
	lsls r0, 24
	asrs r0, 24
	lsls r0, 2
	adds r0, r1
	ldrb r1, [r0]
	lsls r1, 28
	movs r0, 0x80
	lsls r0, 21
	adds r1, r0
	lsrs r1, 24
	movs r0, 0x70
	bl sub_814AD7C
	pop {r0}
	bx r0
	.align 2, 0
_080A73E8: .4byte gUnknown_03005D10
_080A73EC: .4byte gUnknown_02038559
	thumb_func_end sub_80A73C0

	thumb_func_start sub_80A73F0
sub_80A73F0: @ 80A73F0
	push {lr}
	bl sub_814ADC8
	pop {r0}
	bx r0
	thumb_func_end sub_80A73F0

	thumb_func_start sub_80A73FC
sub_80A73FC: @ 80A73FC
	push {lr}
	bl HandleDestroyMenuCursors
	bl sub_814AD44
	pop {r0}
	bx r0
	thumb_func_end sub_80A73FC

	thumb_func_start sub_80A740C
sub_80A740C: @ 80A740C
	push {lr}
	bl sub_80A75E4
	bl sub_80A7768
	bl sub_80A7420
	pop {r0}
	bx r0
	thumb_func_end sub_80A740C

	thumb_func_start sub_80A7420
sub_80A7420: @ 80A7420
	push {r4,lr}
	ldr r4, _080A7438 @ =gUnknown_0203853C
	ldrb r0, [r4]
	cmp r0, 0x2
	beq _080A743C
	cmp r0, 0x3
	beq _080A7430
	b _080A7512
_080A7430:
	movs r0, 0x2
	strb r0, [r4]
	b _080A7512
	.align 2, 0
_080A7438: .4byte gUnknown_0203853C
_080A743C:
	ldrb r0, [r4, 0x2]
	cmp r0, 0x9
	bhi _080A74FC
	lsls r0, 2
	ldr r1, _080A744C @ =_080A7450
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_080A744C: .4byte _080A7450
	.align 2, 0
_080A7450:
	.4byte _080A7478
	.4byte _080A74AC
	.4byte _080A74B4
	.4byte _080A74BC
	.4byte _080A74C4
	.4byte _080A74CC
	.4byte _080A74D4
	.4byte _080A74DC
	.4byte _080A74E4
	.4byte _080A74F4
_080A7478:
	ldr r1, _080A74A0 @ =gUnknown_03005D10
	ldr r0, _080A74A4 @ =gUnknown_02038559
	ldrb r0, [r0]
	lsls r0, 24
	asrs r0, 24
	lsls r0, 2
	adds r0, r1
	ldrb r1, [r0, 0x1]
	ldrb r0, [r0]
	adds r1, r0
	ldr r0, _080A74A8 @ =gUnknown_03005D24
	ldr r0, [r0]
	lsls r1, 2
	adds r1, r0
	movs r2, 0
	ldrsh r0, [r1, r2]
	ldrb r1, [r4, 0x1]
	bl ItemListMenu_ChangeDescription
	b _080A74FC
	.align 2, 0
_080A74A0: .4byte gUnknown_03005D10
_080A74A4: .4byte gUnknown_02038559
_080A74A8: .4byte gUnknown_03005D24
_080A74AC:
	ldr r0, _080A74B0 @ =gOtherText_SwitchWhichItem
	b _080A74E6
	.align 2, 0
_080A74B0: .4byte gOtherText_SwitchWhichItem
_080A74B4:
	ldr r0, _080A74B8 @ =gOtherText_WhatWillYouDo2
	b _080A74E6
	.align 2, 0
_080A74B8: .4byte gOtherText_WhatWillYouDo2
_080A74BC:
	ldr r0, _080A74C0 @ =gOtherText_HowManyToToss
	b _080A74E6
	.align 2, 0
_080A74C0: .4byte gOtherText_HowManyToToss
_080A74C4:
	ldr r0, _080A74C8 @ =gOtherText_ThrewAwayItem
	b _080A74E6
	.align 2, 0
_080A74C8: .4byte gOtherText_ThrewAwayItem
_080A74CC:
	ldr r0, _080A74D0 @ =gOtherText_OkayToThrowAwayPrompt
	b _080A74E6
	.align 2, 0
_080A74D0: .4byte gOtherText_OkayToThrowAwayPrompt
_080A74D4:
	ldr r0, _080A74D8 @ =gOtherText_HowManyToDeposit
	b _080A74E6
	.align 2, 0
_080A74D8: .4byte gOtherText_HowManyToDeposit
_080A74DC:
	ldr r0, _080A74E0 @ =gOtherText_DepositedItems
	b _080A74E6
	.align 2, 0
_080A74E0: .4byte gOtherText_DepositedItems
_080A74E4:
	ldr r0, _080A74F0 @ =gOtherText_NoRoomForItems
_080A74E6:
	ldrb r1, [r4, 0x1]
	bl sub_80A4A98
	b _080A74FC
	.align 2, 0
_080A74F0: .4byte gOtherText_NoRoomForItems
_080A74F4:
	ldr r0, _080A7518 @ =gOtherText_CantStoreSomeoneItem
	ldrb r1, [r4, 0x1]
	bl sub_80A4A98
_080A74FC:
	ldrb r0, [r4, 0x1]
	adds r0, 0x1
	strb r0, [r4, 0x1]
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x3
	bne _080A7512
	movs r0, 0
	strb r0, [r4]
	bl sub_80A7918
_080A7512:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080A7518: .4byte gOtherText_CantStoreSomeoneItem
	thumb_func_end sub_80A7420

	thumb_func_start sub_80A751C
sub_80A751C: @ 80A751C
	ldr r1, _080A7524 @ =gUnknown_0203853C
	movs r0, 0
	strb r0, [r1]
	bx lr
	.align 2, 0
_080A7524: .4byte gUnknown_0203853C
	thumb_func_end sub_80A751C

	thumb_func_start sub_80A7528
sub_80A7528: @ 80A7528
	push {r4,lr}
	ldr r4, _080A7544 @ =gUnknown_0203853C
	movs r1, 0
	strb r1, [r4, 0x1]
	strb r0, [r4, 0x2]
	bl sub_80A78F4
	cmp r0, 0x1
	beq _080A755E
	cmp r0, 0x1
	bgt _080A7548
	cmp r0, 0
	beq _080A754E
	b _080A7566
	.align 2, 0
_080A7544: .4byte gUnknown_0203853C
_080A7548:
	cmp r0, 0x2
	beq _080A7562
	b _080A7566
_080A754E:
	movs r0, 0x2
	strb r0, [r4]
_080A7552:
	bl sub_80A7420
	ldrb r0, [r4]
	cmp r0, 0
	bne _080A7552
	b _080A7566
_080A755E:
	movs r0, 0x3
	b _080A7564
_080A7562:
	movs r0, 0x1
_080A7564:
	strb r0, [r4]
_080A7566:
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end sub_80A7528

	thumb_func_start sub_80A756C
sub_80A756C: @ 80A756C
	push {r4,lr}
	ldr r4, _080A758C @ =gUnknown_0203853C
	ldrb r0, [r4]
	subs r0, 0x2
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bhi _080A7580
	bl sub_80A7918
_080A7580:
	movs r0, 0
	strb r0, [r4]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080A758C: .4byte gUnknown_0203853C
	thumb_func_end sub_80A756C

	thumb_func_start sub_80A7590
sub_80A7590: @ 80A7590
	push {lr}
	movs r0, 0
	movs r1, 0xD
	movs r2, 0xD
	movs r3, 0x14
	bl MenuZeroFillWindowRect
	bl sub_80A756C
	pop {r0}
	bx r0
	thumb_func_end sub_80A7590

	thumb_func_start sub_80A75A8
sub_80A75A8: @ 80A75A8
	push {lr}
	ldr r1, _080A75C0 @ =gUnknown_0203853C
	ldrb r0, [r1]
	subs r0, 0x2
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bhi _080A75BC
	movs r0, 0x1
	strb r0, [r1]
_080A75BC:
	pop {r0}
	bx r0
	.align 2, 0
_080A75C0: .4byte gUnknown_0203853C
	thumb_func_end sub_80A75A8

	thumb_func_start sub_80A75C4
sub_80A75C4: @ 80A75C4
	push {lr}
	ldr r1, _080A75D8 @ =gUnknown_0203853C
	ldrb r0, [r1]
	cmp r0, 0
	beq _080A75DC
	cmp r0, 0x1
	bne _080A75E0
	movs r0, 0x3
	strb r0, [r1]
	b _080A75E0
	.align 2, 0
_080A75D8: .4byte gUnknown_0203853C
_080A75DC:
	bl sub_80A7918
_080A75E0:
	pop {r0}
	bx r0
	thumb_func_end sub_80A75C4

	thumb_func_start sub_80A75E4
sub_80A75E4: @ 80A75E4
	push {r4,r5,lr}
	ldr r4, _080A7628 @ =gUnknown_02038540
	ldrb r0, [r4]
	cmp r0, 0x1
	bne _080A7622
	bl sub_80A7988
	adds r5, r0, 0
	cmp r5, 0
	bne _080A7622
	ldr r0, _080A762C @ =gUnknown_02038563
	ldrb r0, [r0]
	ldrb r2, [r4, 0x1]
	adds r1, r2, 0
	movs r3, 0x1
	bl sub_80A47E8
	ldrb r0, [r4, 0x1]
	adds r0, 0x1
	strb r0, [r4, 0x1]
	ldrb r0, [r4, 0x2]
	movs r1, 0x7
	cmp r0, 0
	beq _080A7616
	movs r1, 0x5
_080A7616:
	ldrb r0, [r4, 0x1]
	cmp r1, r0
	bge _080A7622
	strb r5, [r4]
	bl sub_80A78E8
_080A7622:
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080A7628: .4byte gUnknown_02038540
_080A762C: .4byte gUnknown_02038563
	thumb_func_end sub_80A75E4

	thumb_func_start sub_80A7630
sub_80A7630: @ 80A7630
	ldr r1, _080A7638 @ =gUnknown_02038540
	movs r0, 0
	strb r0, [r1]
	bx lr
	.align 2, 0
_080A7638: .4byte gUnknown_02038540
	thumb_func_end sub_80A7630

	thumb_func_start sub_80A763C
sub_80A763C: @ 80A763C
	push {r4,lr}
	ldr r4, _080A7650 @ =gUnknown_02038540
	bl sub_80A78C4
	adds r1, r0, 0
	cmp r1, 0
	beq _080A7654
	cmp r1, 0x1
	beq _080A7668
	b _080A7670
	.align 2, 0
_080A7650: .4byte gUnknown_02038540
_080A7654:
	ldr r0, _080A7664 @ =gUnknown_02038563
	ldrb r0, [r0]
	movs r1, 0
	movs r2, 0x7
	bl sub_80A48E8
	b _080A7670
	.align 2, 0
_080A7664: .4byte gUnknown_02038563
_080A7668:
	movs r0, 0
	strb r1, [r4]
	strb r0, [r4, 0x1]
	strb r0, [r4, 0x2]
_080A7670:
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end sub_80A763C

	thumb_func_start sub_80A7678
sub_80A7678: @ 80A7678
	push {r4,lr}
	ldr r4, _080A7690 @ =gUnknown_02038540
	ldrb r0, [r4]
	cmp r0, 0x1
	bne _080A7686
	bl sub_80A78E8
_080A7686:
	movs r0, 0
	strb r0, [r4]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080A7690: .4byte gUnknown_02038540
	thumb_func_end sub_80A7678

	thumb_func_start sub_80A7694
sub_80A7694: @ 80A7694
	ldr r1, _080A769C @ =gUnknown_02038540
	movs r0, 0x1
	strb r0, [r1, 0x2]
	bx lr
	.align 2, 0
_080A769C: .4byte gUnknown_02038540
	thumb_func_end sub_80A7694

	thumb_func_start sub_80A76A0
sub_80A76A0: @ 80A76A0
	push {lr}
	movs r0, 0xE
	movs r1, 0x2
	movs r2, 0x1D
	movs r3, 0x12
	bl MenuZeroFillWindowRect
	bl sub_80A7678
	pop {r0}
	bx r0
	thumb_func_end sub_80A76A0

	thumb_func_start sub_80A76B8
sub_80A76B8: @ 80A76B8
	push {lr}
	ldr r0, _080A76CC @ =gUnknown_02038540
	movs r1, 0
	ldrb r0, [r0]
	cmp r0, 0
	bne _080A76C6
	movs r1, 0x1
_080A76C6:
	adds r0, r1, 0
	pop {r1}
	bx r1
	.align 2, 0
_080A76CC: .4byte gUnknown_02038540
	thumb_func_end sub_80A76B8

	thumb_func_start sub_80A76D0
sub_80A76D0: @ 80A76D0
	push {lr}
	ldr r0, _080A76E4 @ =gUnknown_02038540
	movs r1, 0
	ldrb r0, [r0, 0x1]
	cmp r0, 0x5
	bls _080A76DE
	movs r1, 0x1
_080A76DE:
	adds r0, r1, 0
	pop {r1}
	bx r1
	.align 2, 0
_080A76E4: .4byte gUnknown_02038540
	thumb_func_end sub_80A76D0

	thumb_func_start sub_80A76E8
sub_80A76E8: @ 80A76E8
	push {r4,lr}
	ldr r4, _080A7708 @ =gUnknown_02038544
	ldrb r0, [r4]
	cmp r0, 0x1
	bne _080A7702
	ldrb r0, [r4, 0x1]
	ldr r1, [r4, 0x4]
	ldr r2, [r4, 0x8]
	ldrh r3, [r4, 0x2]
	bl DisplayItemMessageOnField
	movs r0, 0
	strb r0, [r4]
_080A7702:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080A7708: .4byte gUnknown_02038544
	thumb_func_end sub_80A76E8

	thumb_func_start sub_80A770C
sub_80A770C: @ 80A770C
	ldr r1, _080A7714 @ =gUnknown_02038544
	movs r0, 0
	strb r0, [r1]
	bx lr
	.align 2, 0
_080A7714: .4byte gUnknown_02038544
	thumb_func_end sub_80A770C

	thumb_func_start DisplayCannotUseItemMessage
DisplayCannotUseItemMessage: @ 80A7718
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	adds r5, r0, 0
	adds r7, r1, 0
	mov r8, r2
	adds r6, r3, 0
	ldr r4, _080A7738 @ =gUnknown_02038544
	bl sub_80A7924
	cmp r0, 0
	beq _080A773C
	cmp r0, 0x2
	beq _080A774E
	b _080A775C
	.align 2, 0
_080A7738: .4byte gUnknown_02038544
_080A773C:
	lsls r0, r5, 24
	lsrs r0, 24
	lsls r3, r6, 16
	lsrs r3, 16
	adds r1, r7, 0
	mov r2, r8
	bl DisplayItemMessageOnField
	b _080A775C
_080A774E:
	movs r0, 0x1
	strb r0, [r4]
	strb r5, [r4, 0x1]
	str r7, [r4, 0x4]
	mov r0, r8
	str r0, [r4, 0x8]
	strh r6, [r4, 0x2]
_080A775C:
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r0}
	bx r0
	thumb_func_end DisplayCannotUseItemMessage

	thumb_func_start sub_80A7768
sub_80A7768: @ 80A7768
	push {r4,lr}
	ldr r4, _080A77A8 @ =gUnknown_02038550
	ldrb r0, [r4]
	cmp r0, 0x2
	bne _080A7814
	ldrb r1, [r4, 0x1]
	cmp r1, 0
	beq _080A780E
	ldrb r0, [r4, 0x2]
	cmp r0, 0x1
	beq _080A77B4
	ldr r2, _080A77AC @ =gUnknown_083C1640
	ldr r0, _080A77B0 @ =gUnknown_03000704
	ldr r0, [r0]
	adds r0, r1, r0
	subs r0, 0x1
	ldrb r0, [r0]
	lsls r0, 3
	adds r0, r2
	ldr r0, [r0]
	subs r1, 0x1
	lsls r1, 1
	adds r1, 0x1
	ldrb r2, [r4, 0x3]
	adds r2, r1
	lsls r2, 24
	lsrs r2, 24
	movs r1, 0x7
	bl MenuPrint
	b _080A77FC
	.align 2, 0
_080A77A8: .4byte gUnknown_02038550
_080A77AC: .4byte gUnknown_083C1640
_080A77B0: .4byte gUnknown_03000704
_080A77B4:
	cmp r1, 0x1
	bne _080A77C8
	ldr r0, _080A77C4 @ =gScriptItemId
	ldrh r0, [r0]
	bl sub_80A4B90
	adds r3, r0, 0
	b _080A77DC
	.align 2, 0
_080A77C4: .4byte gScriptItemId
_080A77C8:
	ldr r2, _080A781C @ =gUnknown_083C1640
	ldrb r0, [r4, 0x1]
	ldr r1, _080A7820 @ =gUnknown_03000704
	ldr r1, [r1]
	adds r0, r1
	subs r0, 0x1
	ldrb r0, [r0]
	lsls r0, 3
	adds r0, r2
	ldr r3, [r0]
_080A77DC:
	ldrb r2, [r4, 0x1]
	subs r2, 0x1
	asrs r0, r2, 1
	lsls r1, r0, 1
	adds r1, r0
	lsls r1, 1
	adds r1, 0x1
	lsls r1, 24
	lsrs r1, 24
	movs r0, 0x1
	ands r2, r0
	lsls r2, 1
	adds r2, 0x8
	adds r0, r3, 0
	bl MenuPrint
_080A77FC:
	ldr r1, _080A7824 @ =gUnknown_02038564
	ldrb r0, [r4, 0x1]
	ldrb r1, [r1]
	cmp r0, r1
	bne _080A780E
	movs r0, 0
	strb r0, [r4]
	bl sub_80A7970
_080A780E:
	ldrb r0, [r4, 0x1]
	adds r0, 0x1
	strb r0, [r4, 0x1]
_080A7814:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080A781C: .4byte gUnknown_083C1640
_080A7820: .4byte gUnknown_03000704
_080A7824: .4byte gUnknown_02038564
	thumb_func_end sub_80A7768

	thumb_func_start sub_80A7828
sub_80A7828: @ 80A7828
	ldr r1, _080A7830 @ =gUnknown_02038550
	movs r0, 0
	strb r0, [r1]
	bx lr
	.align 2, 0
_080A7830: .4byte gUnknown_02038550
	thumb_func_end sub_80A7828

	thumb_func_start sub_80A7834
sub_80A7834: @ 80A7834
	push {r4-r6,lr}
	adds r5, r0, 0
	adds r6, r1, 0
	ldr r4, _080A784C @ =gUnknown_02038550
	bl sub_80A7958
	cmp r0, 0x1
	beq _080A7850
	cmp r0, 0x2
	beq _080A7856
	b _080A7862
	.align 2, 0
_080A784C: .4byte gUnknown_02038550
_080A7850:
	movs r1, 0
	movs r0, 0x2
	b _080A785A
_080A7856:
	movs r1, 0
	movs r0, 0x1
_080A785A:
	strb r0, [r4]
	strb r1, [r4, 0x1]
	strb r5, [r4, 0x2]
	strb r6, [r4, 0x3]
_080A7862:
	pop {r4-r6}
	pop {r0}
	bx r0
	thumb_func_end sub_80A7834

	thumb_func_start sub_80A7868
sub_80A7868: @ 80A7868
	push {lr}
	ldr r1, _080A787C @ =gUnknown_02038550
	ldrb r0, [r1]
	cmp r0, 0x2
	bne _080A7876
	movs r0, 0x1
	strb r0, [r1]
_080A7876:
	pop {r0}
	bx r0
	.align 2, 0
_080A787C: .4byte gUnknown_02038550
	thumb_func_end sub_80A7868

	thumb_func_start sub_80A7880
sub_80A7880: @ 80A7880
	push {lr}
	ldr r1, _080A7894 @ =gUnknown_02038550
	ldrb r0, [r1]
	cmp r0, 0
	beq _080A7898
	cmp r0, 0x1
	bne _080A789C
	movs r0, 0x2
	strb r0, [r1]
	b _080A789C
	.align 2, 0
_080A7894: .4byte gUnknown_02038550
_080A7898:
	bl sub_80A7970
_080A789C:
	pop {r0}
	bx r0
	thumb_func_end sub_80A7880

	thumb_func_start sub_80A78A0
sub_80A78A0: @ 80A78A0
	push {lr}
	ldr r0, _080A78B4 @ =gUnknown_02038550
	movs r1, 0
	ldrb r0, [r0]
	cmp r0, 0
	bne _080A78AE
	movs r1, 0x1
_080A78AE:
	adds r0, r1, 0
	pop {r1}
	bx r1
	.align 2, 0
_080A78B4: .4byte gUnknown_02038550
	thumb_func_end sub_80A78A0

	thumb_func_start sub_80A78B8
sub_80A78B8: @ 80A78B8
	ldr r1, _080A78C0 @ =gUnknown_02038554
	movs r0, 0
	strb r0, [r1]
	bx lr
	.align 2, 0
_080A78C0: .4byte gUnknown_02038554
	thumb_func_end sub_80A78B8

	thumb_func_start sub_80A78C4
sub_80A78C4: @ 80A78C4
	push {lr}
	ldr r0, _080A78DC @ =gLinkOpen
	ldrb r0, [r0]
	cmp r0, 0x1
	bne _080A78E0
	bl sub_80A7868
	bl sub_80A75A8
	movs r0, 0x1
	b _080A78E2
	.align 2, 0
_080A78DC: .4byte gLinkOpen
_080A78E0:
	movs r0, 0
_080A78E2:
	pop {r1}
	bx r1
	thumb_func_end sub_80A78C4

	thumb_func_start sub_80A78E8
sub_80A78E8: @ 80A78E8
	push {lr}
	bl sub_80A7880
	pop {r0}
	bx r0
	thumb_func_end sub_80A78E8

	thumb_func_start sub_80A78F4
sub_80A78F4: @ 80A78F4
	push {lr}
	ldr r0, _080A790C @ =gLinkOpen
	ldrb r0, [r0]
	cmp r0, 0x1
	bne _080A7910
	bl sub_80A76B8
	movs r1, 0x2
	cmp r0, 0
	beq _080A7912
	movs r1, 0x1
	b _080A7912
	.align 2, 0
_080A790C: .4byte gLinkOpen
_080A7910:
	movs r1, 0
_080A7912:
	adds r0, r1, 0
	pop {r1}
	bx r1
	thumb_func_end sub_80A78F4

	thumb_func_start sub_80A7918
sub_80A7918: @ 80A7918
	push {lr}
	bl sub_80A76E8
	pop {r0}
	bx r0
	thumb_func_end sub_80A7918

	thumb_func_start sub_80A7924
sub_80A7924: @ 80A7924
	push {lr}
	ldr r0, _080A7948 @ =gLinkOpen
	ldrb r0, [r0]
	cmp r0, 0x1
	bne _080A7942
	bl sub_80A76B8
	cmp r0, 0
	bne _080A7942
	bl sub_80A76D0
	cmp r0, 0
	beq _080A794C
	bl sub_80A7678
_080A7942:
	movs r0, 0
	b _080A7952
	.align 2, 0
_080A7948: .4byte gLinkOpen
_080A794C:
	bl sub_80A7694
	movs r0, 0x2
_080A7952:
	pop {r1}
	bx r1
	thumb_func_end sub_80A7924

	thumb_func_start sub_80A7958
sub_80A7958: @ 80A7958
	push {lr}
	bl sub_80A76B8
	cmp r0, 0
	beq _080A796A
	bl sub_80A75A8
	movs r0, 0x1
	b _080A796C
_080A796A:
	movs r0, 0x2
_080A796C:
	pop {r1}
	bx r1
	thumb_func_end sub_80A7958

	thumb_func_start sub_80A7970
sub_80A7970: @ 80A7970
	push {lr}
	bl sub_80A75C4
	pop {r0}
	bx r0
	thumb_func_end sub_80A7970

	thumb_func_start sub_80A797C
sub_80A797C: @ 80A797C
	ldr r1, _080A7984 @ =gUnknown_02038554
	movs r0, 0x1
	strb r0, [r1]
	bx lr
	.align 2, 0
_080A7984: .4byte gUnknown_02038554
	thumb_func_end sub_80A797C

	thumb_func_start sub_80A7988
sub_80A7988: @ 80A7988
	ldr r1, _080A7994 @ =gUnknown_02038554
	ldrb r0, [r1]
	movs r2, 0
	strb r2, [r1]
	bx lr
	.align 2, 0
_080A7994: .4byte gUnknown_02038554
	thumb_func_end sub_80A7988

	thumb_func_start sub_80A7998
sub_80A7998: @ 80A7998
	adds r2, r0, 0
	adds r2, 0x2A
	movs r1, 0
	strb r1, [r2]
	strh r1, [r0, 0x2E]
	strh r1, [r0, 0x30]
	strh r1, [r0, 0x32]
	strh r1, [r0, 0x34]
	strh r1, [r0, 0x36]
	ldr r1, _080A79B0 @ =sub_80A79B4
	str r1, [r0, 0x1C]
	bx lr
	.align 2, 0
_080A79B0: .4byte sub_80A79B4
	thumb_func_end sub_80A7998

	thumb_func_start sub_80A79B4
sub_80A79B4: @ 80A79B4
	push {r4,lr}
	adds r4, r0, 0
	ldr r0, _080A79E4 @ =gUnknown_0203855B
	movs r1, 0
	ldrsb r1, [r0, r1]
	movs r0, 0x1
	negs r0, r0
	cmp r1, r0
	beq _080A79CC
	adds r0, r4, 0
	bl sub_80A79EC
_080A79CC:
	ldr r0, _080A79E8 @ =gUnknown_0203855C
	ldrb r0, [r0]
	lsls r0, 24
	asrs r0, 24
	cmp r0, 0
	beq _080A79DE
	adds r0, r4, 0
	bl sub_80A7A94
_080A79DE:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080A79E4: .4byte gUnknown_0203855B
_080A79E8: .4byte gUnknown_0203855C
	thumb_func_end sub_80A79B4

	thumb_func_start sub_80A79EC
sub_80A79EC: @ 80A79EC
	push {r4-r6,lr}
	adds r2, r0, 0
	movs r0, 0x34
	ldrsh r4, [r2, r0]
	cmp r4, 0
	beq _080A79FE
	cmp r4, 0x1
	beq _080A7A54
	b _080A7A8A
_080A79FE:
	ldr r5, _080A7A28 @ =gUnknown_0203855B
	ldrb r6, [r5]
	movs r0, 0
	ldrsb r0, [r5, r0]
	cmp r0, 0x6
	beq _080A7A2C
	adds r3, r2, 0
	adds r3, 0x3F
	ldrb r0, [r3]
	movs r1, 0x4
	orrs r0, r1
	strb r0, [r3]
	adds r0, r2, 0
	adds r0, 0x2A
	strb r6, [r0]
	movs r1, 0x1
	negs r1, r1
	adds r0, r1, 0
	strb r0, [r5]
	b _080A7A8A
	.align 2, 0
_080A7A28: .4byte gUnknown_0203855B
_080A7A2C:
	adds r3, r2, 0
	adds r3, 0x3F
	ldrb r0, [r3]
	movs r1, 0x4
	orrs r0, r1
	strb r0, [r3]
	adds r0, r2, 0
	adds r0, 0x2A
	strb r4, [r0]
	ldrh r0, [r2, 0x22]
	subs r0, 0x4
	strh r0, [r2, 0x22]
	movs r0, 0x4
	strh r0, [r2, 0x2E]
	movs r0, 0x1
	strh r0, [r2, 0x34]
	adds r0, r2, 0
	bl sub_80A7AE4
	b _080A7A8A
_080A7A54:
	ldrh r4, [r2, 0x2E]
	movs r0, 0x2E
	ldrsh r3, [r2, r0]
	cmp r3, 0
	beq _080A7A7C
	ldrh r1, [r2, 0x30]
	movs r3, 0x30
	ldrsh r0, [r2, r3]
	cmp r0, 0
	beq _080A7A72
	ldrh r0, [r2, 0x22]
	adds r0, 0x1
	strh r0, [r2, 0x22]
	subs r0, r4, 0x1
	strh r0, [r2, 0x2E]
_080A7A72:
	adds r0, r1, 0x1
	movs r1, 0x1
	ands r0, r1
	strh r0, [r2, 0x30]
	b _080A7A8A
_080A7A7C:
	ldr r1, _080A7A90 @ =gUnknown_0203855B
	movs r4, 0x1
	negs r4, r4
	adds r0, r4, 0
	strb r0, [r1]
	strh r3, [r2, 0x30]
	strh r3, [r2, 0x34]
_080A7A8A:
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_080A7A90: .4byte gUnknown_0203855B
	thumb_func_end sub_80A79EC

	thumb_func_start sub_80A7A94
sub_80A7A94: @ 80A7A94
	push {r4,lr}
	adds r4, r0, 0
	movs r1, 0x36
	ldrsh r0, [r4, r1]
	cmp r0, 0
	beq _080A7AA6
	cmp r0, 0x1
	beq _080A7AC8
	b _080A7ADC
_080A7AA6:
	ldrb r1, [r4, 0x1]
	movs r0, 0x4
	negs r0, r0
	ands r0, r1
	movs r1, 0x1
	orrs r0, r1
	strb r0, [r4, 0x1]
	ldr r0, _080A7AC4 @ =gSpriteAffineAnimTable_83C1CC4
	str r0, [r4, 0x10]
	adds r0, r4, 0
	bl InitSpriteAffineAnim
	movs r0, 0x1
	strh r0, [r4, 0x36]
	b _080A7ADC
	.align 2, 0
_080A7AC4: .4byte gSpriteAffineAnimTable_83C1CC4
_080A7AC8:
	ldrh r0, [r4, 0x32]
	adds r0, 0x1
	strh r0, [r4, 0x32]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0xC
	bne _080A7ADC
	adds r0, r4, 0
	bl sub_80A7AE4
_080A7ADC:
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end sub_80A7A94

	thumb_func_start sub_80A7AE4
sub_80A7AE4: @ 80A7AE4
	push {lr}
	ldr r2, _080A7B0C @ =gUnknown_0203855C
	movs r1, 0
	strb r1, [r2]
	ldrb r2, [r0, 0x1]
	movs r1, 0x4
	negs r1, r1
	ands r1, r2
	strb r1, [r0, 0x1]
	movs r1, 0
	strh r1, [r0, 0x32]
	strh r1, [r0, 0x36]
	ldrb r0, [r0, 0x3]
	lsls r0, 26
	lsrs r0, 27
	bl FreeOamMatrix
	pop {r0}
	bx r0
	.align 2, 0
_080A7B0C: .4byte gUnknown_0203855C
	thumb_func_end sub_80A7AE4

	thumb_func_start CreateBagSprite
CreateBagSprite: @ 80A7B10
	push {lr}
	ldr r0, _080A7B24 @ =gSpriteTemplate_83C1CE0
	movs r1, 0x3A
	movs r2, 0x28
	movs r3, 0
	bl CreateSprite
	pop {r0}
	bx r0
	.align 2, 0
_080A7B24: .4byte gSpriteTemplate_83C1CE0
	thumb_func_end CreateBagSprite

	thumb_func_start sub_80A7B28
sub_80A7B28: @ 80A7B28
	push {r4,lr}
	adds r4, r0, 0
	movs r0, 0
	strh r0, [r4, 0x34]
	strh r0, [r4, 0x2E]
	adds r0, r4, 0
	bl sub_80A7B6C
	ldr r0, _080A7B44 @ =sub_80A7B6C
	str r0, [r4, 0x1C]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080A7B44: .4byte sub_80A7B6C
	thumb_func_end sub_80A7B28

	thumb_func_start sub_80A7B48
sub_80A7B48: @ 80A7B48
	ldrh r2, [r0, 0x38]
	ldrh r1, [r0, 0x2E]
	adds r1, 0x1
	movs r3, 0x1
	ands r1, r3
	subs r2, r1
	adds r1, r0, 0
	adds r1, 0x28
	strb r2, [r1]
	ldrh r2, [r0, 0x3A]
	ldrh r1, [r0, 0x2E]
	adds r1, 0x1
	ands r1, r3
	subs r2, r1
	adds r0, 0x29
	strb r2, [r0]
	bx lr
	thumb_func_end sub_80A7B48

	thumb_func_start sub_80A7B6C
sub_80A7B6C: @ 80A7B6C
	push {r4,r5,lr}
	adds r4, r0, 0
	movs r0, 0x3C
	ldrsh r2, [r4, r0]
	cmp r2, 0
	beq _080A7C16
	movs r1, 0x34
	ldrsh r0, [r4, r1]
	cmp r0, 0
	beq _080A7B86
	cmp r0, 0x1
	beq _080A7BD4
	b _080A7C16
_080A7B86:
	ldrb r0, [r4, 0x1]
	movs r1, 0x4
	negs r1, r1
	ands r1, r0
	movs r0, 0x1
	orrs r1, r0
	strb r1, [r4, 0x1]
	cmp r2, 0x1
	bne _080A7BA0
	ldr r0, _080A7B9C @ =gSpriteAffineAnimTable_83C1D20
	b _080A7BA2
	.align 2, 0
_080A7B9C: .4byte gSpriteAffineAnimTable_83C1D20
_080A7BA0:
	ldr r0, _080A7BD0 @ =gSpriteAffineAnimTable_83C1D20 + 0x4
_080A7BA2:
	str r0, [r4, 0x10]
	adds r0, r4, 0
	bl InitSpriteAffineAnim
	movs r0, 0x1
	strh r0, [r4, 0x34]
	adds r0, r4, 0
	adds r0, 0x28
	ldrb r0, [r0]
	lsls r0, 24
	asrs r0, 24
	strh r0, [r4, 0x38]
	adds r0, r4, 0
	adds r0, 0x29
	ldrb r0, [r0]
	lsls r0, 24
	asrs r0, 24
	strh r0, [r4, 0x3A]
	adds r0, r4, 0
	bl sub_80A7B48
	b _080A7C16
	.align 2, 0
_080A7BD0: .4byte gSpriteAffineAnimTable_83C1D20 + 0x4
_080A7BD4:
	ldrh r0, [r4, 0x2E]
	adds r0, 0x1
	movs r5, 0
	strh r0, [r4, 0x2E]
	adds r0, r4, 0
	bl sub_80A7B48
	movs r1, 0x2E
	ldrsh r0, [r4, r1]
	cmp r0, 0x20
	bne _080A7C16
	strh r5, [r4, 0x2E]
	strh r5, [r4, 0x34]
	ldrh r1, [r4, 0x38]
	adds r0, r4, 0
	adds r0, 0x28
	strb r1, [r0]
	ldrh r0, [r4, 0x3A]
	adds r1, r4, 0
	adds r1, 0x29
	strb r0, [r1]
	ldrb r0, [r4, 0x3]
	lsls r0, 26
	lsrs r0, 27
	bl FreeOamMatrix
	ldrb r1, [r4, 0x1]
	movs r0, 0x4
	negs r0, r0
	ands r0, r1
	strb r0, [r4, 0x1]
	ldr r0, _080A7C1C @ =SpriteCallbackDummy
	str r0, [r4, 0x1C]
_080A7C16:
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080A7C1C: .4byte SpriteCallbackDummy
	thumb_func_end sub_80A7B6C

	thumb_func_start CreateBagPokeballSprite
CreateBagPokeballSprite: @ 80A7C20
	push {r4,lr}
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	ldr r0, _080A7C54 @ =gUnknown_083C1D30
	bl LoadSpritePalette
	ldr r0, _080A7C58 @ =gSpriteTemplate_83C1D38
	movs r1, 0x10
	movs r2, 0x58
	movs r3, 0
	bl CreateSprite
	ldr r1, _080A7C5C @ =gUnknown_02038568
	strb r0, [r1]
	ldr r2, _080A7C60 @ =gSprites
	ldrb r1, [r1]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r2
	strh r4, [r0, 0x3C]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080A7C54: .4byte gUnknown_083C1D30
_080A7C58: .4byte gSpriteTemplate_83C1D38
_080A7C5C: .4byte gUnknown_02038568
_080A7C60: .4byte gSprites
	thumb_func_end CreateBagPokeballSprite

	thumb_func_start sub_80A7C64
sub_80A7C64: @ 80A7C64
	push {r4,r5,lr}
	movs r0, 0x8
	bl FreeSpritePaletteByTag
	ldr r5, _080A7C98 @ =gSprites
	ldr r4, _080A7C9C @ =gUnknown_02038568
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
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080A7C98: .4byte gSprites
_080A7C9C: .4byte gUnknown_02038568
	thumb_func_end sub_80A7C64

	thumb_func_start sub_80A7CA0
sub_80A7CA0: @ 80A7CA0
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	adds r6, r0, 0
	adds r4, r1, 0
	movs r2, 0x80
	lsls r2, 4
	adds r0, r4, 0
	movs r1, 0
	bl memset
	movs r0, 0x80
	lsls r0, 1
	adds r4, r0
	movs r7, 0
_080A7CBE:
	adds r4, 0x20
	movs r5, 0
	adds r1, r7, 0x1
	mov r8, r1
_080A7CC6:
	adds r0, r4, 0
	adds r1, r6, 0
	movs r2, 0x20
	bl memcpy
	adds r4, 0x20
	adds r6, 0x20
	adds r0, r5, 0x1
	lsls r0, 24
	lsrs r5, r0, 24
	cmp r5, 0x5
	bls _080A7CC6
	cmp r7, 0x5
	beq _080A7CE4
	adds r4, 0x20
_080A7CE4:
	mov r1, r8
	lsls r0, r1, 24
	lsrs r7, r0, 24
	cmp r7, 0x5
	bls _080A7CBE
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r0}
	bx r0
	thumb_func_end sub_80A7CA0

	thumb_func_start sub_80A7CF8
sub_80A7CF8: @ 80A7CF8
	push {r4,r5,lr}
	sub sp, 0x8
	lsls r0, 24
	lsrs r4, r0, 24
	cmp r4, 0x2A
	bne _080A7D44
	bl IsEnigmaBerryValid
	cmp r0, 0x1
	bne _080A7D44
	ldr r4, _080A7D34 @ =gSaveBlock1 + 0x317C
	ldr r1, _080A7D38 @ =0x02000000
	adds r0, r4, 0
	bl sub_80A7CA0
	movs r0, 0x90
	lsls r0, 3
	adds r4, r0
	str r4, [sp]
	ldr r1, _080A7D3C @ =0xffff0000
	ldr r0, [sp, 0x4]
	ands r0, r1
	ldr r1, _080A7D40 @ =0x00007544
	orrs r0, r1
	str r0, [sp, 0x4]
	mov r0, sp
	bl LoadSpritePalette
	b _080A7D72
	.align 2, 0
_080A7D34: .4byte gSaveBlock1 + 0x317C
_080A7D38: .4byte 0x02000000
_080A7D3C: .4byte 0xffff0000
_080A7D40: .4byte 0x00007544
_080A7D44:
	ldr r5, _080A7D7C @ =gBerryGraphicsTable
	lsls r4, 3
	adds r0, r5, 0x4
	adds r0, r4, r0
	ldr r0, [r0]
	str r0, [sp]
	mov r1, sp
	ldr r0, _080A7D80 @ =0x00007544
	strh r0, [r1, 0x4]
	mov r0, sp
	bl LoadCompressedObjectPalette
	adds r4, r5
	ldr r0, [r4]
	ldr r4, _080A7D84 @ =0x02001000
	adds r1, r4, 0
	bl sub_800D238
	ldr r0, _080A7D88 @ =0xfffff000
	adds r1, r4, r0
	adds r0, r4, 0
	bl sub_80A7CA0
_080A7D72:
	add sp, 0x8
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080A7D7C: .4byte gBerryGraphicsTable
_080A7D80: .4byte 0x00007544
_080A7D84: .4byte 0x02001000
_080A7D88: .4byte 0xfffff000
	thumb_func_end sub_80A7CF8

	thumb_func_start sub_80A7D8C
sub_80A7D8C: @ 80A7D8C
	push {r4,r5,lr}
	adds r4, r1, 0
	adds r5, r2, 0
	lsls r0, 24
	lsrs r0, 24
	lsls r4, 16
	lsrs r4, 16
	lsls r5, 16
	lsrs r5, 16
	bl sub_80A7CF8
	ldr r0, _080A7DC0 @ =gSpriteTemplate_83C1D74
	lsls r4, 16
	asrs r4, 16
	lsls r5, 16
	asrs r5, 16
	adds r1, r4, 0
	adds r2, r5, 0
	movs r3, 0
	bl CreateSprite
	lsls r0, 24
	lsrs r0, 24
	pop {r4,r5}
	pop {r1}
	bx r1
	.align 2, 0
_080A7DC0: .4byte gSpriteTemplate_83C1D74
	thumb_func_end sub_80A7D8C

	thumb_func_start sub_80A7DC4
sub_80A7DC4: @ 80A7DC4
	ldr r1, _080A7DD0 @ =gUnknown_030041B4
	ldrh r1, [r1]
	negs r1, r1
	strh r1, [r0, 0x26]
	bx lr
	.align 2, 0
_080A7DD0: .4byte gUnknown_030041B4
	thumb_func_end sub_80A7DC4

	thumb_func_start sub_80A7DD4
sub_80A7DD4: @ 80A7DD4
	push {lr}
	ldr r0, _080A7DE8 @ =0x00007544
	bl FreeSpritePaletteByTag
	movs r0, 0x8
	bl FreeSpritePaletteByTag
	pop {r0}
	bx r0
	.align 2, 0
_080A7DE8: .4byte 0x00007544
	thumb_func_end sub_80A7DD4

	thumb_func_start sub_80A7DEC
sub_80A7DEC: @ 80A7DEC
	push {r4-r6,lr}
	mov r6, r8
	push {r6}
	adds r4, r0, 0
	adds r5, r1, 0
	adds r6, r2, 0
	mov r8, r3
	lsls r4, 24
	lsrs r4, 24
	lsls r5, 24
	lsrs r5, 24
	lsls r6, 24
	lsrs r6, 24
	mov r0, r8
	lsls r0, 24
	lsrs r0, 24
	mov r8, r0
	ldr r0, _080A7E50 @ =0x00007544
	bl FreeSpritePaletteByTag
	adds r0, r4, 0
	bl sub_80A7CF8
	ldr r0, _080A7E54 @ =gSpriteTemplate_83C1E04
	adds r1, r5, 0
	adds r2, r6, 0
	movs r3, 0
	bl CreateSprite
	lsls r0, 24
	lsrs r1, r0, 24
	adds r4, r1, 0
	mov r0, r8
	cmp r0, 0x1
	bne _080A7E42
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	ldr r1, _080A7E58 @ =gSprites
	adds r0, r1
	movs r1, 0x1
	bl StartSpriteAffineAnim
_080A7E42:
	adds r0, r4, 0
	pop {r3}
	mov r8, r3
	pop {r4-r6}
	pop {r1}
	bx r1
	.align 2, 0
_080A7E50: .4byte 0x00007544
_080A7E54: .4byte gSpriteTemplate_83C1E04
_080A7E58: .4byte gSprites
	thumb_func_end sub_80A7DEC

	thumb_func_start sub_80A7E5C
sub_80A7E5C: @ 80A7E5C
	push {lr}
	adds r1, r0, 0
	ldr r0, _080A7E78 @ =gSpriteTemplate_83C1F98
	lsls r1, 16
	asrs r1, 16
	movs r2, 0x63
	movs r3, 0
	bl CreateSprite
	lsls r0, 24
	lsrs r0, 24
	pop {r1}
	bx r1
	.align 2, 0
_080A7E78: .4byte gSpriteTemplate_83C1F98
	thumb_func_end sub_80A7E5C

	.align 2, 0 @ Don't pad with nop.
