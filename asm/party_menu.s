	.include "constants/gba_constants.inc"
	.include "constants/species_constants.inc"
	.include "asm/macros.inc"

	.syntax unified

	.text

	thumb_func_start sub_806AEDC
sub_806AEDC: @ 806AEDC
	push {r4-r6,lr}
	sub sp, 0x4
	bl AnimateSprites
	bl BuildOamBuffer
	ldr r0, _0806AF2C @ =gUnknown_0202E8FA
	ldrb r1, [r0]
	lsls r0, r1, 1
	adds r0, r1
	lsls r0, 4
	ldr r1, _0806AF30 @ =gUnknown_08376BB4
	adds r5, r0, r1
	movs r6, 0
_0806AEF8:
	ldrb r0, [r5]
	lsls r0, 3
	ldrb r1, [r5, 0x1]
	lsls r1, 3
	ldr r2, [r5, 0x4]
	lsls r3, r6, 5
	movs r4, 0x80
	lsls r4, 2
	orrs r3, r4
	str r3, [sp]
	movs r3, 0
	bl sub_800142C
	adds r5, 0x8
	adds r6, 0x1
	cmp r6, 0x5
	ble _0806AEF8
	bl RunTasks
	bl UpdatePaletteFade
	add sp, 0x4
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_0806AF2C: .4byte gUnknown_0202E8FA
_0806AF30: .4byte gUnknown_08376BB4
	thumb_func_end sub_806AEDC

	thumb_func_start sub_806AF34
sub_806AF34: @ 806AF34
	push {lr}
	bl LoadOam
	bl ProcessSpriteCopyRequests
	bl TransferPlttBuffer
	bl sub_806B548
	pop {r0}
	bx r0
	thumb_func_end sub_806AF34

	thumb_func_start sub_806AF4C
sub_806AF4C: @ 806AF4C
	push {r4,r5,lr}
	adds r4, r2, 0
	lsls r0, 24
	lsrs r2, r0, 24
	lsls r1, 24
	lsrs r1, 24
	lsls r3, 24
	lsrs r3, 24
	cmp r1, 0xFF
	beq _0806AF64
	ldr r0, _0806AF84 @ =gUnknown_020239F8
	strh r1, [r0]
_0806AF64:
	ldr r0, _0806AF88 @ =0x0201b000
	movs r5, 0x96
	lsls r5, 2
	adds r1, r0, r5
	strb r2, [r1]
	movs r2, 0x97
	lsls r2, 2
	adds r1, r0, r2
	str r4, [r1]
	adds r5, 0x1
	adds r0, r5
	strb r3, [r0]
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_0806AF84: .4byte gUnknown_020239F8
_0806AF88: .4byte 0x0201b000
	thumb_func_end sub_806AF4C

	thumb_func_start sub_806AF8C
sub_806AF8C: @ 806AF8C
	push {lr}
	lsls r0, 24
	lsrs r0, 24
	lsls r1, 24
	lsrs r1, 24
	lsls r3, 24
	lsrs r3, 24
	bl sub_806AF4C
	ldr r0, _0806AFA8 @ =sub_806B460
	bl SetMainCallback2
	pop {r0}
	bx r0
	.align 2, 0
_0806AFA8: .4byte sub_806B460
	thumb_func_end sub_806AF8C

	thumb_func_start OpenPartyMenu
OpenPartyMenu: @ 806AFAC
	push {lr}
	lsls r0, 24
	lsrs r0, 24
	lsls r1, 24
	lsrs r1, 24
	ldr r2, _0806AFCC @ =gUnknown_08376C74
	lsls r3, r0, 1
	adds r3, r0
	lsls r3, 2
	adds r3, r2
	ldr r2, [r3]
	ldrb r3, [r3, 0x8]
	bl sub_806AF8C
	pop {r0}
	bx r0
	.align 2, 0
_0806AFCC: .4byte gUnknown_08376C74
	thumb_func_end OpenPartyMenu

	thumb_func_start sub_806AFD0
sub_806AFD0: @ 806AFD0
	push {r4,r5,lr}
	ldr r1, _0806AFF0 @ =0x0201b000
	movs r2, 0x99
	lsls r2, 2
	adds r0, r1, r2
	movs r2, 0
	ldrsh r0, [r0, r2]
	adds r4, r1, 0
	cmp r0, 0x9
	bls _0806AFE6
	b _0806B11A
_0806AFE6:
	lsls r0, 2
	ldr r1, _0806AFF4 @ =_0806AFF8
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_0806AFF0: .4byte 0x0201b000
_0806AFF4: .4byte _0806AFF8
	.align 2, 0
_0806AFF8:
	.4byte _0806B020
	.4byte _0806B060
	.4byte _0806B066
	.4byte _0806B07A
	.4byte _0806B0A4
	.4byte _0806B0AA
	.4byte _0806B0BC
	.4byte _0806B0C2
	.4byte _0806B0D4
	.4byte _0806B0EC
_0806B020:
	ldr r0, _0806B048 @ =0x00000266
	adds r5, r4, r0
	movs r1, 0
	ldrsh r3, [r5, r1]
	ldr r0, _0806B04C @ =gPlayerPartyCount
	ldrb r0, [r0]
	cmp r3, r0
	bge _0806B054
	movs r2, 0x98
	lsls r2, 2
	adds r0, r4, r2
	ldrb r0, [r0]
	ldrb r1, [r5]
	movs r2, 0x64
	muls r2, r3
	ldr r3, _0806B050 @ =gPlayerParty
	adds r2, r3
	bl sub_806D90C
	b _0806B114
	.align 2, 0
_0806B048: .4byte 0x00000266
_0806B04C: .4byte gPlayerPartyCount
_0806B050: .4byte gPlayerParty
_0806B054:
	movs r0, 0
	strh r0, [r5]
	movs r0, 0x99
	lsls r0, 2
	adds r1, r4, r0
	b _0806B0E0
_0806B060:
	bl sub_806DA98
	b _0806B0D8
_0806B066:
	movs r1, 0x98
	lsls r1, 2
	adds r0, r4, r1
	ldrb r0, [r0]
	bl sub_806DC34
	movs r2, 0x99
	lsls r2, 2
	adds r1, r4, r2
	b _0806B0E0
_0806B07A:
	movs r1, 0x98
	lsls r1, 2
	adds r0, r4, r1
	ldrb r0, [r0]
	ldr r2, _0806B0A0 @ =0x00000266
	adds r5, r4, r2
	ldrb r1, [r5]
	bl sub_806BD58
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _0806B114
	movs r0, 0
	strh r0, [r5]
	movs r0, 0x99
	lsls r0, 2
	adds r1, r4, r0
	b _0806B0E0
	.align 2, 0
_0806B0A0: .4byte 0x00000266
_0806B0A4:
	bl sub_806E334
	b _0806B0D8
_0806B0AA:
	bl sub_806E0C4
	ldr r1, _0806B0B8 @ =0x0201b000
	movs r0, 0x99
	lsls r0, 2
	adds r1, r0
	b _0806B0E0
	.align 2, 0
_0806B0B8: .4byte 0x0201b000
_0806B0BC:
	bl sub_806E53C
	b _0806B0D8
_0806B0C2:
	bl nullsub_13
	ldr r1, _0806B0D0 @ =0x0201b000
	movs r0, 0x99
	lsls r0, 2
	adds r1, r0
	b _0806B0E0
	.align 2, 0
_0806B0D0: .4byte 0x0201b000
_0806B0D4:
	bl sub_806E6C8
_0806B0D8:
	ldr r1, _0806B0E8 @ =0x0201b000
	movs r2, 0x99
	lsls r2, 2
	adds r1, r2
_0806B0E0:
	ldrh r0, [r1]
	adds r0, 0x1
	strh r0, [r1]
	b _0806B11A
	.align 2, 0
_0806B0E8: .4byte 0x0201b000
_0806B0EC:
	ldr r0, _0806B110 @ =0x00000266
	adds r5, r4, r0
	ldrb r0, [r5]
	bl sub_806B58C
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _0806B114
	movs r1, 0
	strh r1, [r5]
	movs r2, 0x99
	lsls r2, 2
	adds r0, r4, r2
	strh r1, [r0]
	movs r0, 0x1
	b _0806B11C
	.align 2, 0
_0806B110: .4byte 0x00000266
_0806B114:
	ldrh r0, [r5]
	adds r0, 0x1
	strh r0, [r5]
_0806B11A:
	movs r0, 0
_0806B11C:
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end sub_806AFD0

	thumb_func_start sub_806B124
sub_806B124: @ 806B124
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	sub sp, 0xC
	ldr r0, _0806B144 @ =gMain
	ldr r1, _0806B148 @ =0x0000043c
	adds r0, r1
	ldrb r0, [r0]
	cmp r0, 0x11
	bls _0806B13A
	b _0806B450
_0806B13A:
	lsls r0, 2
	ldr r1, _0806B14C @ =_0806B150
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_0806B144: .4byte gMain
_0806B148: .4byte 0x0000043c
_0806B14C: .4byte _0806B150
	.align 2, 0
_0806B150:
	.4byte _0806B198
	.4byte _0806B240
	.4byte _0806B246
	.4byte _0806B27C
	.4byte _0806B282
	.4byte _0806B2AC
	.4byte _0806B2B2
	.4byte _0806B2D0
	.4byte _0806B2EC
	.4byte _0806B318
	.4byte _0806B344
	.4byte _0806B37C
	.4byte _0806B382
	.4byte _0806B3C0
	.4byte _0806B3CC
	.4byte _0806B3E4
	.4byte _0806B40C
	.4byte _0806B440
_0806B198:
	movs r0, 0
	bl SetVBlankCallback
	movs r3, 0xC0
	lsls r3, 19
	movs r4, 0xC0
	lsls r4, 9
	add r2, sp, 0x8
	mov r8, r2
	add r2, sp, 0x4
	movs r6, 0
	ldr r1, _0806B22C @ =0x040000d4
	movs r5, 0x80
	lsls r5, 5
	ldr r7, _0806B230 @ =0x81000800
	movs r0, 0x81
	lsls r0, 24
	mov r12, r0
_0806B1BC:
	strh r6, [r2]
	add r0, sp, 0x4
	str r0, [r1]
	str r3, [r1, 0x4]
	str r7, [r1, 0x8]
	ldr r0, [r1, 0x8]
	adds r3, r5
	subs r4, r5
	cmp r4, r5
	bhi _0806B1BC
	strh r6, [r2]
	add r2, sp, 0x4
	str r2, [r1]
	str r3, [r1, 0x4]
	lsrs r0, r4, 1
	mov r3, r12
	orrs r0, r3
	str r0, [r1, 0x8]
	ldr r0, [r1, 0x8]
	movs r0, 0xE0
	lsls r0, 19
	movs r3, 0x80
	lsls r3, 3
	movs r4, 0
	str r4, [sp, 0x8]
	ldr r2, _0806B22C @ =0x040000d4
	mov r1, r8
	str r1, [r2]
	str r0, [r2, 0x4]
	lsrs r0, r3, 2
	movs r1, 0x85
	lsls r1, 24
	orrs r0, r1
	str r0, [r2, 0x8]
	ldr r0, [r2, 0x8]
	movs r1, 0xA0
	lsls r1, 19
	add r0, sp, 0x4
	strh r4, [r0]
	str r0, [r2]
	str r1, [r2, 0x4]
	lsrs r3, 1
	movs r0, 0x81
	lsls r0, 24
	orrs r3, r0
	str r3, [r2, 0x8]
	ldr r0, [r2, 0x8]
	ldr r2, _0806B234 @ =gPaletteFade
	ldrb r0, [r2, 0x8]
	movs r1, 0x80
	orrs r0, r1
	strb r0, [r2, 0x8]
	ldr r1, _0806B238 @ =gMain
	ldr r2, _0806B23C @ =0x0000043c
	adds r1, r2
	b _0806B42C
	.align 2, 0
_0806B22C: .4byte 0x040000d4
_0806B230: .4byte 0x81000800
_0806B234: .4byte gPaletteFade
_0806B238: .4byte gMain
_0806B23C: .4byte 0x0000043c
_0806B240:
	bl remove_some_task
	b _0806B426
_0806B246:
	bl sub_806B4A8
	ldr r1, _0806B26C @ =0x0201b000
	movs r2, 0x99
	lsls r2, 2
	adds r0, r1, r2
	movs r2, 0
	strh r2, [r0]
	ldr r3, _0806B270 @ =0x00000266
	adds r0, r1, r3
	strh r2, [r0]
	movs r0, 0x9A
	lsls r0, 2
	adds r1, r0
	strh r2, [r1]
	ldr r1, _0806B274 @ =gMain
	ldr r2, _0806B278 @ =0x0000043c
	adds r1, r2
	b _0806B42C
	.align 2, 0
_0806B26C: .4byte 0x0201b000
_0806B270: .4byte 0x00000266
_0806B274: .4byte gMain
_0806B278: .4byte 0x0000043c
_0806B27C:
	bl ResetSpriteData
	b _0806B426
_0806B282:
	ldr r0, _0806B2A0 @ =0x0201b000
	movs r1, 0x96
	lsls r1, 2
	adds r0, r1
	ldrb r0, [r0]
	cmp r0, 0x1
	beq _0806B298
	cmp r0, 0x5
	beq _0806B298
	bl ResetTasks
_0806B298:
	ldr r1, _0806B2A4 @ =gMain
	ldr r2, _0806B2A8 @ =0x0000043c
	adds r1, r2
	b _0806B42C
	.align 2, 0
_0806B2A0: .4byte 0x0201b000
_0806B2A4: .4byte gMain
_0806B2A8: .4byte 0x0000043c
_0806B2AC:
	bl FreeAllSpritePalettes
	b _0806B426
_0806B2B2:
	ldr r4, _0806B2CC @ =0x0201b000
	movs r1, 0x97
	lsls r1, 2
	adds r0, r4, r1
	ldr r0, [r0]
	movs r1, 0
	bl CreateTask
	movs r2, 0x98
	lsls r2, 2
	adds r1, r4, r2
	strb r0, [r1]
	b _0806B426
	.align 2, 0
_0806B2CC: .4byte 0x0201b000
_0806B2D0:
	ldr r0, _0806B2E0 @ =gWindowConfig_81E6C90
	bl SetUpWindowConfig
	ldr r1, _0806B2E4 @ =gMain
	ldr r0, _0806B2E8 @ =0x0000043c
	adds r1, r0
	b _0806B42C
	.align 2, 0
_0806B2E0: .4byte gWindowConfig_81E6C90
_0806B2E4: .4byte gMain
_0806B2E8: .4byte 0x0000043c
_0806B2EC:
	ldr r4, _0806B308 @ =gUnknown_03004210
	ldr r1, _0806B30C @ =gWindowConfig_81E6C90
	adds r0, r4, 0
	bl InitWindowFromConfig
	adds r0, r4, 0
	movs r1, 0x1
	bl MultistepInitWindowTileData
	ldr r1, _0806B310 @ =gMain
	ldr r2, _0806B314 @ =0x0000043c
	adds r1, r2
	b _0806B42C
	.align 2, 0
_0806B308: .4byte gUnknown_03004210
_0806B30C: .4byte gWindowConfig_81E6C90
_0806B310: .4byte gMain
_0806B314: .4byte 0x0000043c
_0806B318:
	bl MultistepLoadFont
	cmp r0, 0
	bne _0806B322
	b _0806B450
_0806B322:
	ldr r0, _0806B338 @ =0x0201b000
	movs r3, 0x99
	lsls r3, 2
	adds r0, r3
	movs r1, 0x1
	strh r1, [r0]
	ldr r1, _0806B33C @ =gMain
	ldr r0, _0806B340 @ =0x0000043c
	adds r1, r0
	b _0806B42C
	.align 2, 0
_0806B338: .4byte 0x0201b000
_0806B33C: .4byte gMain
_0806B340: .4byte 0x0000043c
_0806B344:
	ldr r0, _0806B368 @ =0x0201b000
	movs r1, 0x99
	lsls r1, 2
	adds r4, r0, r1
	ldrb r0, [r4]
	bl sub_806D718
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _0806B374
	movs r0, 0
	strh r0, [r4]
	ldr r1, _0806B36C @ =gMain
	ldr r2, _0806B370 @ =0x0000043c
	adds r1, r2
	b _0806B42C
	.align 2, 0
_0806B368: .4byte 0x0201b000
_0806B36C: .4byte gMain
_0806B370: .4byte 0x0000043c
_0806B374:
	ldrh r0, [r4]
	adds r0, 0x1
	strh r0, [r4]
	b _0806B450
_0806B37C:
	bl sub_809D51C
	b _0806B426
_0806B382:
	ldr r2, _0806B3B0 @ =gUnknown_08376C74
	ldr r0, _0806B3B4 @ =0x0201b000
	movs r1, 0x96
	lsls r1, 2
	adds r0, r1
	ldrb r1, [r0]
	lsls r0, r1, 1
	adds r0, r1
	lsls r0, 2
	adds r2, 0x4
	adds r0, r2
	ldr r0, [r0]
	bl _call_via_r0
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _0806B450
	ldr r1, _0806B3B8 @ =gMain
	ldr r2, _0806B3BC @ =0x0000043c
	adds r1, r2
	b _0806B42C
	.align 2, 0
_0806B3B0: .4byte gUnknown_08376C74
_0806B3B4: .4byte 0x0201b000
_0806B3B8: .4byte gMain
_0806B3BC: .4byte 0x0000043c
_0806B3C0:
	ldr r0, _0806B3C8 @ =gWindowConfig_81E6CC8
	bl MultistepInitMenuWindowBegin
	b _0806B426
	.align 2, 0
_0806B3C8: .4byte gWindowConfig_81E6CC8
_0806B3CC:
	bl MultistepInitMenuWindowContinue
	cmp r0, 0
	beq _0806B450
	ldr r1, _0806B3DC @ =gMain
	ldr r0, _0806B3E0 @ =0x0000043c
	adds r1, r0
	b _0806B42C
	.align 2, 0
_0806B3DC: .4byte gMain
_0806B3E0: .4byte 0x0000043c
_0806B3E4:
	ldr r0, _0806B3FC @ =0x0201b000
	ldr r1, _0806B400 @ =0x00000259
	adds r0, r1
	ldrb r0, [r0]
	movs r1, 0
	bl sub_806D538
	ldr r1, _0806B404 @ =gMain
	ldr r2, _0806B408 @ =0x0000043c
	adds r1, r2
	b _0806B42C
	.align 2, 0
_0806B3FC: .4byte 0x0201b000
_0806B400: .4byte 0x00000259
_0806B404: .4byte gMain
_0806B408: .4byte 0x0000043c
_0806B40C:
	movs r0, 0x1
	negs r0, r0
	movs r1, 0
	str r1, [sp]
	movs r2, 0x10
	movs r3, 0
	bl BeginNormalPaletteFade
	ldr r2, _0806B434 @ =gPaletteFade
	ldrb r1, [r2, 0x8]
	movs r0, 0x7F
	ands r0, r1
	strb r0, [r2, 0x8]
_0806B426:
	ldr r1, _0806B438 @ =gMain
	ldr r3, _0806B43C @ =0x0000043c
	adds r1, r3
_0806B42C:
	ldrb r0, [r1]
	adds r0, 0x1
	strb r0, [r1]
	b _0806B450
	.align 2, 0
_0806B434: .4byte gPaletteFade
_0806B438: .4byte gMain
_0806B43C: .4byte 0x0000043c
_0806B440:
	ldr r0, _0806B44C @ =sub_806AF34
	bl SetVBlankCallback
	movs r0, 0x1
	b _0806B452
	.align 2, 0
_0806B44C: .4byte sub_806AF34
_0806B450:
	movs r0, 0
_0806B452:
	add sp, 0xC
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r1}
	bx r1
	thumb_func_end sub_806B124

	thumb_func_start sub_806B460
sub_806B460: @ 806B460
	push {lr}
	b _0806B470
_0806B464:
	bl sub_80F9344
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	beq _0806B49C
_0806B470:
	bl sub_806B124
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _0806B464
	ldr r1, _0806B4A0 @ =0x0201b000
	movs r2, 0x96
	lsls r2, 2
	adds r0, r1, r2
	ldrb r0, [r0]
	cmp r0, 0x5
	beq _0806B496
	adds r2, 0x8
	adds r0, r1, r2
	ldrb r0, [r0]
	movs r1, 0
	bl sub_806BF74
_0806B496:
	ldr r0, _0806B4A4 @ =sub_806AEDC
	bl SetMainCallback2
_0806B49C:
	pop {r0}
	bx r0
	.align 2, 0
_0806B4A0: .4byte 0x0201b000
_0806B4A4: .4byte sub_806AEDC
	thumb_func_end sub_806B460

	thumb_func_start sub_806B4A8
sub_806B4A8: @ 806B4A8
	push {lr}
	movs r0, 0
	bl SetHBlankCallback
	movs r1, 0x80
	lsls r1, 19
	movs r2, 0xFA
	lsls r2, 5
	adds r0, r2, 0
	strh r0, [r1]
	adds r1, 0x8
	ldr r2, _0806B50C @ =0x00001e05
	adds r0, r2, 0
	strh r0, [r1]
	adds r1, 0x2
	ldr r2, _0806B510 @ =0x00000703
	adds r0, r2, 0
	strh r0, [r1]
	adds r1, 0x2
	ldr r2, _0806B514 @ =0x00000f08
	adds r0, r2, 0
	strh r0, [r1]
	adds r1, 0x2
	ldr r2, _0806B518 @ =0x00000602
	adds r0, r2, 0
	strh r0, [r1]
	ldr r0, _0806B51C @ =REG_BLDCNT
	movs r1, 0
	strh r1, [r0]
	subs r0, 0x40
	strh r1, [r0]
	adds r0, 0x2
	strh r1, [r0]
	adds r0, 0x2
	strh r1, [r0]
	adds r0, 0x2
	strh r1, [r0]
	adds r0, 0x2
	strh r1, [r0]
	adds r0, 0x2
	strh r1, [r0]
	adds r0, 0x2
	strh r1, [r0]
	ldr r2, _0806B520 @ =REG_BG3VOFS
	strh r1, [r2]
	ldr r1, _0806B524 @ =0x0000ffff
	adds r0, r1, 0
	strh r0, [r2]
	pop {r0}
	bx r0
	.align 2, 0
_0806B50C: .4byte 0x00001e05
_0806B510: .4byte 0x00000703
_0806B514: .4byte 0x00000f08
_0806B518: .4byte 0x00000602
_0806B51C: .4byte REG_BLDCNT
_0806B520: .4byte REG_BG3VOFS
_0806B524: .4byte 0x0000ffff
	thumb_func_end sub_806B4A8

	thumb_func_start sub_806B528
sub_806B528: @ 806B528
	push {lr}
	ldr r0, _0806B53C @ =gUnknown_020239F8
	ldrh r1, [r0]
	movs r0, 0x4B
	ands r0, r1
	cmp r0, 0x4B
	beq _0806B540
	movs r0, 0
	b _0806B542
	.align 2, 0
_0806B53C: .4byte gUnknown_020239F8
_0806B540:
	movs r0, 0x1
_0806B542:
	pop {r1}
	bx r1
	thumb_func_end sub_806B528

	thumb_func_start sub_806B548
sub_806B548: @ 806B548
	push {r4,lr}
	ldr r0, _0806B574 @ =0x0201b000
	ldr r1, _0806B578 @ =0x00000261
	adds r4, r0, r1
	ldrb r3, [r4]
	cmp r3, 0
	beq _0806B56E
	ldr r1, _0806B57C @ =gBG2TilemapBuffer
	ldr r2, _0806B580 @ =0x06003000
	ldr r0, _0806B584 @ =0x040000d4
	str r1, [r0]
	str r2, [r0, 0x4]
	ldr r1, _0806B588 @ =0x80000400
	str r1, [r0, 0x8]
	ldr r0, [r0, 0x8]
	cmp r3, 0x2
	bne _0806B56E
	movs r0, 0
	strb r0, [r4]
_0806B56E:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0806B574: .4byte 0x0201b000
_0806B578: .4byte 0x00000261
_0806B57C: .4byte gBG2TilemapBuffer
_0806B580: .4byte 0x06003000
_0806B584: .4byte 0x040000d4
_0806B588: .4byte 0x80000400
	thumb_func_end sub_806B548

	thumb_func_start sub_806B58C
sub_806B58C: @ 806B58C
	push {r4,r5,lr}
	lsls r0, 24
	lsrs r5, r0, 24
	bl battle_type_is_double
	lsls r0, 24
	lsrs r2, r0, 24
	cmp r2, 0
	bne _0806B5A8
	ldr r0, _0806B5A4 @ =gUnknown_0202E8FA
	strb r2, [r0]
	b _0806B5C8
	.align 2, 0
_0806B5A4: .4byte gUnknown_0202E8FA
_0806B5A8:
	bl sub_806B528
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _0806B5C0
	ldr r1, _0806B5BC @ =gUnknown_0202E8FA
	movs r0, 0x2
	b _0806B5C4
	.align 2, 0
_0806B5BC: .4byte gUnknown_0202E8FA
_0806B5C0:
	ldr r1, _0806B5E4 @ =gUnknown_0202E8FA
	movs r0, 0x1
_0806B5C4:
	strb r0, [r1]
	adds r0, r1, 0
_0806B5C8:
	ldrb r0, [r0]
	lsls r1, r0, 1
	adds r1, r0
	lsls r1, 2
	ldr r0, _0806B5E8 @ =gUnknown_083769A8
	adds r4, r1, r0
	cmp r5, 0x8
	bls _0806B5DA
	b _0806B900
_0806B5DA:
	lsls r0, r5, 2
	ldr r1, _0806B5EC @ =_0806B5F0
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_0806B5E4: .4byte gUnknown_0202E8FA
_0806B5E8: .4byte gUnknown_083769A8
_0806B5EC: .4byte _0806B5F0
	.align 2, 0
_0806B5F0:
	.4byte _0806B614
	.4byte _0806B628
	.4byte _0806B638
	.4byte _0806B694
	.4byte _0806B71A
	.4byte _0806B7A2
	.4byte _0806B832
	.4byte _0806B8C6
	.4byte _0806B8E8
_0806B614:
	ldr r0, _0806B624 @ =gBG2TilemapBuffer
	movs r2, 0x80
	lsls r2, 4
	movs r1, 0
	bl memset
	b _0806B900
	.align 2, 0
_0806B624: .4byte gBG2TilemapBuffer
_0806B628:
	ldrb r0, [r4]
	ldrb r1, [r4, 0x1]
	movs r2, 0x3
	bl sub_806B9A4
	adds r0, r4, 0
	movs r1, 0
	b _0806B8A8
_0806B638:
	bl battle_type_is_double
	lsls r0, 24
	cmp r0, 0
	bne _0806B666
	ldr r0, _0806B65C @ =gPlayerPartyCount
	ldrb r0, [r0]
	cmp r0, 0x1
	bls _0806B660
	ldrb r0, [r4, 0x2]
	ldrb r1, [r4, 0x3]
	movs r2, 0
	movs r3, 0x3
	bl sub_806BA94
	adds r0, r4, 0x2
	movs r1, 0x1
	b _0806B8A8
	.align 2, 0
_0806B65C: .4byte gPlayerPartyCount
_0806B660:
	ldrb r0, [r4, 0x2]
	ldrb r1, [r4, 0x3]
	b _0806B8BC
_0806B666:
	bl sub_806B528
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _0806B684
	ldrb r0, [r4, 0x2]
	ldrb r1, [r4, 0x3]
	movs r2, 0x4
	bl sub_806B9A4
	adds r0, r4, 0x2
	movs r1, 0x1
	movs r2, 0x4
	b _0806B8AA
_0806B684:
	ldrb r0, [r4, 0x2]
	ldrb r1, [r4, 0x3]
	movs r2, 0x3
	bl sub_806B9A4
	adds r0, r4, 0x2
	movs r1, 0x1
	b _0806B8A8
_0806B694:
	bl battle_type_is_double
	lsls r0, 24
	cmp r0, 0
	bne _0806B6C2
	ldr r0, _0806B6B8 @ =gPlayerPartyCount
	ldrb r0, [r0]
	cmp r0, 0x2
	bls _0806B6BC
	ldrb r0, [r4, 0x4]
	ldrb r1, [r4, 0x5]
	movs r2, 0
	movs r3, 0x3
	bl sub_806BA94
	adds r0, r4, 0x4
	movs r1, 0x2
	b _0806B8A8
	.align 2, 0
_0806B6B8: .4byte gPlayerPartyCount
_0806B6BC:
	ldrb r0, [r4, 0x4]
	ldrb r1, [r4, 0x5]
	b _0806B8BC
_0806B6C2:
	bl sub_806B528
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _0806B6F6
	ldr r0, _0806B6EC @ =gUnknown_03004428
	movs r1, 0xB
	bl GetMonData
	cmp r0, 0
	beq _0806B6F0
	ldrb r0, [r4, 0x4]
	ldrb r1, [r4, 0x5]
	movs r2, 0
	movs r3, 0x3
	bl sub_806BA94
	adds r0, r4, 0x4
	movs r1, 0x2
	b _0806B8A8
	.align 2, 0
_0806B6EC: .4byte gUnknown_03004428
_0806B6F0:
	ldrb r0, [r4, 0x4]
	ldrb r1, [r4, 0x5]
	b _0806B8BC
_0806B6F6:
	ldr r0, _0806B710 @ =gPlayerPartyCount
	ldrb r0, [r0]
	cmp r0, 0x2
	bls _0806B714
	ldrb r0, [r4, 0x4]
	ldrb r1, [r4, 0x5]
	movs r2, 0
	movs r3, 0x3
	bl sub_806BA94
	adds r0, r4, 0x4
	movs r1, 0x2
	b _0806B8A8
	.align 2, 0
_0806B710: .4byte gPlayerPartyCount
_0806B714:
	ldrb r0, [r4, 0x4]
	ldrb r1, [r4, 0x5]
	b _0806B8BC
_0806B71A:
	bl battle_type_is_double
	lsls r0, 24
	cmp r0, 0
	bne _0806B74A
	ldr r0, _0806B740 @ =gPlayerPartyCount
	ldrb r0, [r0]
	cmp r0, 0x3
	bls _0806B744
	ldrb r0, [r4, 0x6]
	ldrb r1, [r4, 0x7]
	movs r2, 0
	movs r3, 0x3
	bl sub_806BA94
	adds r0, r4, 0x6
	movs r1, 0x3
	b _0806B8A8
	.align 2, 0
_0806B740: .4byte gPlayerPartyCount
_0806B744:
	ldrb r0, [r4, 0x6]
	ldrb r1, [r4, 0x7]
	b _0806B8BC
_0806B74A:
	bl sub_806B528
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _0806B77E
	ldr r0, _0806B774 @ =gUnknown_0300448C
	movs r1, 0xB
	bl GetMonData
	cmp r0, 0
	beq _0806B778
	ldrb r0, [r4, 0x6]
	ldrb r1, [r4, 0x7]
	movs r2, 0
	movs r3, 0x3
	bl sub_806BA94
	adds r0, r4, 0x6
	movs r1, 0x3
	b _0806B8A8
	.align 2, 0
_0806B774: .4byte gUnknown_0300448C
_0806B778:
	ldrb r0, [r4, 0x6]
	ldrb r1, [r4, 0x7]
	b _0806B8BC
_0806B77E:
	ldr r0, _0806B798 @ =gPlayerPartyCount
	ldrb r0, [r0]
	cmp r0, 0x3
	bls _0806B79C
	ldrb r0, [r4, 0x6]
	ldrb r1, [r4, 0x7]
	movs r2, 0
	movs r3, 0x3
	bl sub_806BA94
	adds r0, r4, 0x6
	movs r1, 0x3
	b _0806B8A8
	.align 2, 0
_0806B798: .4byte gPlayerPartyCount
_0806B79C:
	ldrb r0, [r4, 0x6]
	ldrb r1, [r4, 0x7]
	b _0806B8BC
_0806B7A2:
	bl battle_type_is_double
	lsls r0, 24
	cmp r0, 0
	bne _0806B7D2
	ldr r0, _0806B7C8 @ =gPlayerPartyCount
	ldrb r0, [r0]
	cmp r0, 0x4
	bls _0806B7CC
	ldrb r0, [r4, 0x8]
	ldrb r1, [r4, 0x9]
	movs r2, 0
	movs r3, 0x3
	bl sub_806BA94
	adds r0, r4, 0
	adds r0, 0x8
	movs r1, 0x4
	b _0806B8A8
	.align 2, 0
_0806B7C8: .4byte gPlayerPartyCount
_0806B7CC:
	ldrb r0, [r4, 0x8]
	ldrb r1, [r4, 0x9]
	b _0806B8BC
_0806B7D2:
	bl sub_806B528
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _0806B80A
	ldr r0, _0806B800 @ =gUnknown_030044F0
	movs r1, 0xB
	bl GetMonData
	cmp r0, 0
	beq _0806B804
	ldrb r0, [r4, 0x8]
	ldrb r1, [r4, 0x9]
	movs r2, 0
	movs r3, 0x4
	bl sub_806BA94
	adds r0, r4, 0
	adds r0, 0x8
	movs r1, 0x4
	movs r2, 0x4
	b _0806B8AA
	.align 2, 0
_0806B800: .4byte gUnknown_030044F0
_0806B804:
	ldrb r0, [r4, 0x8]
	ldrb r1, [r4, 0x9]
	b _0806B884
_0806B80A:
	ldr r0, _0806B828 @ =gPlayerPartyCount
	ldrb r0, [r0]
	cmp r0, 0x4
	bls _0806B82C
	ldrb r0, [r4, 0x8]
	ldrb r1, [r4, 0x9]
	movs r2, 0
	movs r3, 0x3
	bl sub_806BA94
	adds r0, r4, 0
	adds r0, 0x8
	movs r1, 0x4
	b _0806B8A8
	.align 2, 0
_0806B828: .4byte gPlayerPartyCount
_0806B82C:
	ldrb r0, [r4, 0x8]
	ldrb r1, [r4, 0x9]
	b _0806B8BC
_0806B832:
	bl battle_type_is_double
	lsls r0, 24
	cmp r0, 0
	bne _0806B84C
	ldr r0, _0806B848 @ =gPlayerPartyCount
	ldrb r0, [r0]
	cmp r0, 0x5
	bhi _0806B896
	b _0806B8B8
	.align 2, 0
_0806B848: .4byte gPlayerPartyCount
_0806B84C:
	bl sub_806B528
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _0806B88E
	ldr r0, _0806B87C @ =gUnknown_03004554
	movs r1, 0xB
	bl GetMonData
	cmp r0, 0
	beq _0806B880
	ldrb r0, [r4, 0xA]
	ldrb r1, [r4, 0xB]
	movs r2, 0
	movs r3, 0x4
	bl sub_806BA94
	adds r0, r4, 0
	adds r0, 0xA
	movs r1, 0x5
	movs r2, 0x4
	b _0806B8AA
	.align 2, 0
_0806B87C: .4byte gUnknown_03004554
_0806B880:
	ldrb r0, [r4, 0xA]
	ldrb r1, [r4, 0xB]
_0806B884:
	movs r2, 0x1
	movs r3, 0x4
	bl sub_806BA94
	b _0806B900
_0806B88E:
	ldr r0, _0806B8B4 @ =gPlayerPartyCount
	ldrb r0, [r0]
	cmp r0, 0x5
	bls _0806B8B8
_0806B896:
	ldrb r0, [r4, 0xA]
	ldrb r1, [r4, 0xB]
	movs r2, 0
	movs r3, 0x3
	bl sub_806BA94
	adds r0, r4, 0
	adds r0, 0xA
	movs r1, 0x5
_0806B8A8:
	movs r2, 0x3
_0806B8AA:
	movs r3, 0
	bl sub_806BF24
	b _0806B900
	.align 2, 0
_0806B8B4: .4byte gPlayerPartyCount
_0806B8B8:
	ldrb r0, [r4, 0xA]
	ldrb r1, [r4, 0xB]
_0806B8BC:
	movs r2, 0x1
	movs r3, 0x3
	bl sub_806BA94
	b _0806B900
_0806B8C6:
	ldr r0, _0806B8E4 @ =0x0201b000
	movs r1, 0x96
	lsls r1, 2
	adds r0, r1
	ldrb r0, [r0]
	cmp r0, 0x4
	bne _0806B8DA
	movs r0, 0x1
	bl sub_806BB9C
_0806B8DA:
	movs r0, 0x1
	bl sub_806BBEC
	b _0806B900
	.align 2, 0
_0806B8E4: .4byte 0x0201b000
_0806B8E8:
	ldr r0, _0806B8F8 @ =0x0201b000
	ldr r1, _0806B8FC @ =0x00000261
	adds r0, r1
	movs r1, 0x2
	strb r1, [r0]
	movs r0, 0x1
	b _0806B902
	.align 2, 0
_0806B8F8: .4byte 0x0201b000
_0806B8FC: .4byte 0x00000261
_0806B900:
	movs r0, 0
_0806B902:
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end sub_806B58C

	thumb_func_start sub_806B908
sub_806B908: @ 806B908
	push {r4,r5,lr}
	ldr r0, _0806B948 @ =gBG2TilemapBuffer
	movs r2, 0x80
	lsls r2, 4
	movs r1, 0
	bl memset
	ldr r1, _0806B94C @ =gUnknown_0202E8FA
	movs r0, 0x3
	strb r0, [r1]
	ldr r0, _0806B950 @ =gUnknown_083769A8
	adds r4, r0, 0
	adds r4, 0x24
	ldr r5, _0806B954 @ =gUnknown_030043C4
	ldrb r0, [r4]
	ldrb r1, [r4, 0x1]
	movs r2, 0x3
	bl sub_806B9A4
	adds r0, r5, 0
	movs r1, 0xB
	bl GetMonData
	cmp r0, 0
	beq _0806B958
	ldrb r0, [r4, 0x4]
	ldrb r1, [r4, 0x5]
	movs r2, 0
	movs r3, 0x3
	bl sub_806BA94
	b _0806B964
	.align 2, 0
_0806B948: .4byte gBG2TilemapBuffer
_0806B94C: .4byte gUnknown_0202E8FA
_0806B950: .4byte gUnknown_083769A8
_0806B954: .4byte gUnknown_030043C4
_0806B958:
	ldrb r0, [r4, 0x4]
	ldrb r1, [r4, 0x5]
	movs r2, 0x1
	movs r3, 0x3
	bl sub_806BA94
_0806B964:
	adds r0, r5, 0
	adds r0, 0x64
	movs r1, 0xB
	bl GetMonData
	cmp r0, 0
	beq _0806B980
	ldrb r0, [r4, 0x6]
	ldrb r1, [r4, 0x7]
	movs r2, 0
	movs r3, 0x3
	bl sub_806BA94
	b _0806B98C
_0806B980:
	ldrb r0, [r4, 0x6]
	ldrb r1, [r4, 0x7]
	movs r2, 0x1
	movs r3, 0x3
	bl sub_806BA94
_0806B98C:
	ldr r0, _0806B99C @ =0x0201b000
	ldr r1, _0806B9A0 @ =0x00000261
	adds r0, r1
	movs r1, 0x2
	strb r1, [r0]
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_0806B99C: .4byte 0x0201b000
_0806B9A0: .4byte 0x00000261
	thumb_func_end sub_806B908

	thumb_func_start sub_806B9A4
sub_806B9A4: @ 806B9A4
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	sub sp, 0x8
	lsls r2, 24
	lsrs r2, 24
	str r2, [sp]
	lsls r1, 21
	lsrs r1, 16
	str r1, [sp, 0x4]
	movs r1, 0
	lsls r0, 16
	mov r8, r0
	asrs r0, 16
	mov r10, r0
	ldr r4, _0806BA2C @ =gUnknown_083769D8
	mov r9, r4
_0806B9CA:
	movs r3, 0
	adds r7, r1, 0x1
	mov r0, r10
	cmp r0, 0x1F
	bgt _0806BA12
	mov r4, r8
	asrs r2, r4, 16
	lsls r0, r1, 5
	ldr r4, [sp, 0x4]
	adds r6, r4, r0
	ldr r0, _0806BA30 @ =gBG2TilemapBuffer
	mov r12, r0
	ldr r4, [sp]
	lsls r5, r4, 12
	movs r0, 0xB
	adds r4, r1, 0
	muls r4, r0
_0806B9EC:
	adds r0, r2, r3
	cmp r0, 0
	blt _0806BA02
	adds r0, r6, r0
	lsls r0, 1
	add r0, r12
	adds r1, r4, r3
	add r1, r9
	ldrb r1, [r1]
	orrs r1, r5
	strh r1, [r0]
_0806BA02:
	adds r0, r3, 0x1
	lsls r0, 24
	lsrs r3, r0, 24
	cmp r3, 0xA
	bhi _0806BA12
	adds r0, r2, r3
	cmp r0, 0x1F
	ble _0806B9EC
_0806BA12:
	lsls r0, r7, 24
	lsrs r1, r0, 24
	cmp r1, 0x6
	bls _0806B9CA
	add sp, 0x8
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_0806BA2C: .4byte gUnknown_083769D8
_0806BA30: .4byte gBG2TilemapBuffer
	thumb_func_end sub_806B9A4

	thumb_func_start sub_806BA34
sub_806BA34: @ 806BA34
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	lsls r1, 21
	lsrs r1, 16
	mov r8, r1
	movs r1, 0
	lsls r7, r0, 16
	asrs r0, r7, 16
	mov r12, r0
_0806BA48:
	movs r2, 0
	adds r4, r1, 0x1
	mov r5, r12
	cmp r5, 0x1F
	bgt _0806BA7C
	asrs r3, r7, 16
	lsls r0, r1, 5
	mov r5, r8
	adds r1, r5, r0
	ldr r6, _0806BA90 @ =gBG2TilemapBuffer
	movs r5, 0
_0806BA5E:
	adds r0, r3, r2
	cmp r0, 0
	blt _0806BA6C
	adds r0, r1, r0
	lsls r0, 1
	adds r0, r6
	strh r5, [r0]
_0806BA6C:
	adds r0, r2, 0x1
	lsls r0, 24
	lsrs r2, r0, 24
	cmp r2, 0xA
	bhi _0806BA7C
	adds r0, r3, r2
	cmp r0, 0x1F
	ble _0806BA5E
_0806BA7C:
	lsls r0, r4, 24
	lsrs r1, r0, 24
	cmp r1, 0x6
	bls _0806BA48
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_0806BA90: .4byte gBG2TilemapBuffer
	thumb_func_end sub_806BA34

	thumb_func_start sub_806BA94
sub_806BA94: @ 806BA94
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	sub sp, 0x8
	lsls r0, 16
	lsrs r4, r0, 16
	lsls r1, 16
	lsrs r0, r1, 16
	lsls r2, 24
	lsls r3, 24
	lsrs r3, 24
	str r3, [sp]
	ldr r1, _0806BB30 @ =gUnknown_08376A5E
	mov r9, r1
	cmp r2, 0
	bne _0806BABC
	ldr r1, _0806BB34 @ =gUnknown_08376A25
	mov r9, r1
_0806BABC:
	lsls r0, 21
	lsrs r0, 16
	str r0, [sp, 0x4]
	movs r1, 0
	lsls r4, 16
	mov r12, r4
	asrs r4, 16
	mov r10, r4
_0806BACC:
	movs r2, 0
	adds r7, r1, 0x1
	mov r0, r10
	cmp r0, 0x1F
	bgt _0806BB16
	mov r4, r12
	asrs r3, r4, 16
	lsls r0, r1, 5
	ldr r4, [sp, 0x4]
	adds r6, r4, r0
	ldr r0, _0806BB38 @ =gBG2TilemapBuffer
	mov r8, r0
	ldr r4, [sp]
	lsls r5, r4, 12
	lsls r0, r1, 2
	adds r0, r1
	lsls r0, 2
	subs r4, r0, r1
_0806BAF0:
	adds r0, r3, r2
	cmp r0, 0
	blt _0806BB06
	adds r0, r6, r0
	lsls r0, 1
	add r0, r8
	adds r1, r4, r2
	add r1, r9
	ldrb r1, [r1]
	orrs r1, r5
	strh r1, [r0]
_0806BB06:
	adds r0, r2, 0x1
	lsls r0, 24
	lsrs r2, r0, 24
	cmp r2, 0x12
	bhi _0806BB16
	adds r0, r3, r2
	cmp r0, 0x1F
	ble _0806BAF0
_0806BB16:
	lsls r0, r7, 24
	lsrs r1, r0, 24
	cmp r1, 0x2
	bls _0806BACC
	add sp, 0x8
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_0806BB30: .4byte gUnknown_08376A5E
_0806BB34: .4byte gUnknown_08376A25
_0806BB38: .4byte gBG2TilemapBuffer
	thumb_func_end sub_806BA94

	thumb_func_start sub_806BB3C
sub_806BB3C: @ 806BB3C
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	lsls r1, 21
	lsrs r1, 16
	mov r8, r1
	movs r1, 0
	lsls r7, r0, 16
	asrs r0, r7, 16
	mov r12, r0
_0806BB50:
	movs r2, 0
	adds r4, r1, 0x1
	mov r5, r12
	cmp r5, 0x1F
	bgt _0806BB84
	asrs r3, r7, 16
	lsls r0, r1, 5
	mov r5, r8
	adds r1, r5, r0
	ldr r6, _0806BB98 @ =gBG2TilemapBuffer
	movs r5, 0
_0806BB66:
	adds r0, r3, r2
	cmp r0, 0
	blt _0806BB74
	adds r0, r1, r0
	lsls r0, 1
	adds r0, r6
	strh r5, [r0]
_0806BB74:
	adds r0, r2, 0x1
	lsls r0, 24
	lsrs r2, r0, 24
	cmp r2, 0x12
	bhi _0806BB84
	adds r0, r3, r2
	cmp r0, 0x1F
	ble _0806BB66
_0806BB84:
	lsls r0, r4, 24
	lsrs r1, r0, 24
	cmp r1, 0x2
	bls _0806BB50
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_0806BB98: .4byte gBG2TilemapBuffer
	thumb_func_end sub_806BB3C

	thumb_func_start sub_806BB9C
sub_806BB9C: @ 806BB9C
	push {r4,lr}
	sub sp, 0x18
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	ldr r1, _0806BBE4 @ =gUnknown_08376CD4
	mov r0, sp
	movs r2, 0x18
	bl memcpy
	ldr r3, _0806BBE8 @ =0x06003c30
	movs r2, 0
	lsls r4, 12
_0806BBB6:
	lsls r0, r2, 1
	adds r1, r0, r3
	add r0, sp
	ldrh r0, [r0]
	adds r0, r4
	strh r0, [r1]
	adds r1, 0x40
	adds r0, r2, 0x6
	lsls r0, 1
	add r0, sp
	ldrh r0, [r0]
	adds r0, r4
	strh r0, [r1]
	adds r0, r2, 0x1
	lsls r0, 24
	lsrs r2, r0, 24
	cmp r2, 0x5
	bls _0806BBB6
	add sp, 0x18
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0806BBE4: .4byte gUnknown_08376CD4
_0806BBE8: .4byte 0x06003c30
	thumb_func_end sub_806BB9C

	thumb_func_start sub_806BBEC
sub_806BBEC: @ 806BBEC
	push {r4,lr}
	sub sp, 0x18
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	ldr r1, _0806BC34 @ =gUnknown_08376CEC
	mov r0, sp
	movs r2, 0x18
	bl memcpy
	ldr r3, _0806BC38 @ =0x06003cb0
	movs r2, 0
	lsls r4, 12
_0806BC06:
	lsls r0, r2, 1
	adds r1, r0, r3
	add r0, sp
	ldrh r0, [r0]
	adds r0, r4
	strh r0, [r1]
	adds r1, 0x40
	adds r0, r2, 0x6
	lsls r0, 1
	add r0, sp
	ldrh r0, [r0]
	adds r0, r4
	strh r0, [r1]
	adds r0, r2, 0x1
	lsls r0, 24
	lsrs r2, r0, 24
	cmp r2, 0x5
	bls _0806BC06
	add sp, 0x18
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0806BC34: .4byte gUnknown_08376CEC
_0806BC38: .4byte 0x06003cb0
	thumb_func_end sub_806BBEC

	thumb_func_start sub_806BC3C
sub_806BC3C: @ 806BC3C
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	adds r4, r0, 0
	adds r5, r1, 0
	lsls r4, 24
	lsrs r4, 24
	lsls r5, 24
	lsrs r5, 24
	ldr r6, _0806BCB0 @ =gUnknown_08376918
	bl battle_type_is_double
	lsls r4, 2
	lsls r0, 24
	lsrs r0, 24
	lsls r1, r0, 1
	adds r1, r0
	lsls r1, 3
	adds r4, r1
	adds r4, r6
	ldr r7, [r4]
	movs r6, 0
	adds r0, r5, 0
	movs r1, 0x7
	bl __udivsi3
	lsls r0, 24
	lsrs r4, r0, 19
	ldr r5, _0806BCB4 @ =gUnknown_08E9A300
	movs r0, 0x86
	lsls r0, 1
	adds r3, r0, 0
_0806BC7C:
	adds r1, r6, r4
	lsls r2, r6, 1
	adds r2, r7
	lsls r0, r1, 1
	adds r0, r5
	ldrh r0, [r0]
	adds r0, r3, r0
	strh r0, [r2]
	adds r2, 0x40
	adds r1, 0x20
	lsls r1, 1
	adds r1, r5
	ldrh r1, [r1]
	adds r0, r3, r1
	strh r0, [r2]
	adds r0, r6, 0x1
	lsls r0, 24
	lsrs r6, r0, 24
	cmp r6, 0x6
	bls _0806BC7C
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_0806BCB0: .4byte gUnknown_08376918
_0806BCB4: .4byte gUnknown_08E9A300
	thumb_func_end sub_806BC3C

	thumb_func_start unref_sub_806BCB8
unref_sub_806BCB8: @ 806BCB8
	push {r4-r6,lr}
	lsls r0, 24
	lsrs r5, r0, 24
	movs r4, 0
	ldr r0, _0806BCE4 @ =gPlayerPartyCount
	ldrb r1, [r0]
	cmp r4, r1
	bcs _0806BCDE
	adds r6, r0, 0
_0806BCCA:
	adds r0, r4, 0
	adds r1, r5, 0
	bl sub_806BC3C
	adds r0, r4, 0x1
	lsls r0, 24
	lsrs r4, r0, 24
	ldrb r0, [r6]
	cmp r4, r0
	bcc _0806BCCA
_0806BCDE:
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_0806BCE4: .4byte gPlayerPartyCount
	thumb_func_end unref_sub_806BCB8

	thumb_func_start sub_806BCE8
sub_806BCE8: @ 806BCE8
	push {r4,r5,lr}
	movs r5, 0
	b _0806BD46
_0806BCEE:
	movs r0, 0x64
	adds r1, r5, 0
	muls r1, r0
	ldr r0, _0806BD20 @ =gPlayerParty
	adds r4, r1, r0
	adds r0, r4, 0
	movs r1, 0x2D
	bl GetMonData
	cmp r0, 0
	bne _0806BD38
	adds r0, r4, 0
	bl GetMonGender
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0
	beq _0806BD24
	cmp r0, 0xFE
	beq _0806BD2E
	adds r0, r5, 0
	movs r1, 0x46
	bl sub_806BC3C
	b _0806BD40
	.align 2, 0
_0806BD20: .4byte gPlayerParty
_0806BD24:
	adds r0, r5, 0
	movs r1, 0x54
	bl sub_806BC3C
	b _0806BD40
_0806BD2E:
	adds r0, r5, 0
	movs r1, 0x62
	bl sub_806BC3C
	b _0806BD40
_0806BD38:
	adds r0, r5, 0
	movs r1, 0x46
	bl sub_806BC3C
_0806BD40:
	adds r0, r5, 0x1
	lsls r0, 24
	lsrs r5, r0, 24
_0806BD46:
	ldr r0, _0806BD54 @ =gPlayerPartyCount
	ldrb r0, [r0]
	cmp r5, r0
	bcc _0806BCEE
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_0806BD54: .4byte gPlayerPartyCount
	thumb_func_end sub_806BCE8

	thumb_func_start sub_806BD58
sub_806BD58: @ 806BD58
	push {r4,lr}
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	ldr r0, _0806BD7C @ =SpriteCallbackDummy
	bl object_new_hidden_with_callback
	adds r1, r0, 0
	lsls r1, 24
	lsrs r1, 24
	adds r0, r4, 0
	bl sub_806CA18
	movs r0, 0x1
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_0806BD7C: .4byte SpriteCallbackDummy
	thumb_func_end sub_806BD58

	thumb_func_start sub_806BD80
sub_806BD80: @ 806BD80
	push {r4,r5,lr}
	lsls r0, 24
	lsrs r5, r0, 24
	movs r4, 0
	ldr r0, _0806BD9C @ =gMain
	ldrh r0, [r0, 0x30]
	cmp r0, 0x20
	beq _0806BDB2
	cmp r0, 0x20
	bgt _0806BDA0
	cmp r0, 0x10
	beq _0806BDB6
	b _0806BDB8
	.align 2, 0
_0806BD9C: .4byte gMain
_0806BDA0:
	cmp r0, 0x40
	beq _0806BDAA
	cmp r0, 0x80
	beq _0806BDAE
	b _0806BDB8
_0806BDAA:
	movs r4, 0xFF
	b _0806BDB8
_0806BDAE:
	movs r4, 0x1
	b _0806BDB8
_0806BDB2:
	movs r4, 0xFE
	b _0806BDB8
_0806BDB6:
	movs r4, 0x2
_0806BDB8:
	lsls r0, r4, 24
	cmp r0, 0
	bne _0806BDDC
	bl sub_80F92BC
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	beq _0806BDD0
	cmp r0, 0x2
	beq _0806BDD4
	b _0806BDD6
_0806BDD0:
	movs r4, 0xFF
	b _0806BDD6
_0806BDD4:
	movs r4, 0x1
_0806BDD6:
	lsls r0, r4, 24
	cmp r0, 0
	beq _0806BDF0
_0806BDDC:
	asrs r1, r0, 24
	adds r0, r5, 0
	bl sub_806BF74
	ldr r0, _0806BDEC @ =gMain
	ldrh r0, [r0, 0x30]
	b _0806BE2C
	.align 2, 0
_0806BDEC: .4byte gMain
_0806BDF0:
	ldr r0, _0806BE1C @ =gMain
	ldrh r1, [r0, 0x2E]
	movs r0, 0x1
	ands r0, r1
	cmp r0, 0
	beq _0806BE24
	ldr r4, _0806BE20 @ =gSprites
	adds r0, r5, 0
	bl sub_806CA00
	lsls r0, 24
	lsrs r0, 24
	lsls r1, r0, 4
	adds r1, r0
	lsls r1, 2
	adds r1, r4
	movs r2, 0x2E
	ldrsh r0, [r1, r2]
	cmp r0, 0x7
	bne _0806BE24
	movs r0, 0x2
	b _0806BE2C
	.align 2, 0
_0806BE1C: .4byte gMain
_0806BE20: .4byte gSprites
_0806BE24:
	ldr r0, _0806BE34 @ =gMain
	ldrh r1, [r0, 0x2E]
	movs r0, 0x3
	ands r0, r1
_0806BE2C:
	pop {r4,r5}
	pop {r1}
	bx r1
	.align 2, 0
_0806BE34: .4byte gMain
	thumb_func_end sub_806BD80

	thumb_func_start sub_806BE38
sub_806BE38: @ 806BE38
	push {r4-r6,lr}
	lsls r0, 24
	lsrs r5, r0, 24
	movs r4, 0
	ldr r0, _0806BE54 @ =gMain
	ldrh r1, [r0, 0x30]
	adds r6, r0, 0
	cmp r1, 0x20
	beq _0806BE6A
	cmp r1, 0x20
	bgt _0806BE58
	cmp r1, 0x10
	beq _0806BE6E
	b _0806BE70
	.align 2, 0
_0806BE54: .4byte gMain
_0806BE58:
	cmp r1, 0x40
	beq _0806BE62
	cmp r1, 0x80
	beq _0806BE66
	b _0806BE70
_0806BE62:
	movs r4, 0xFF
	b _0806BE8E
_0806BE66:
	movs r4, 0x1
	b _0806BE8E
_0806BE6A:
	movs r4, 0xFE
	b _0806BE8E
_0806BE6E:
	movs r4, 0x2
_0806BE70:
	cmp r4, 0
	bne _0806BE8E
	bl sub_80F92BC
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	beq _0806BE86
	cmp r0, 0x2
	beq _0806BE8A
	b _0806BE8C
_0806BE86:
	movs r4, 0xFF
	b _0806BE8C
_0806BE8A:
	movs r4, 0x1
_0806BE8C:
	ldr r6, _0806BEA4 @ =gMain
_0806BE8E:
	ldrh r2, [r6, 0x2E]
	movs r0, 0x8
	ands r0, r2
	cmp r0, 0
	beq _0806BEA8
	adds r0, r5, 0
	bl sub_806C890
	movs r0, 0x8
	b _0806BEF0
	.align 2, 0
_0806BEA4: .4byte gMain
_0806BEA8:
	lsls r0, r4, 24
	asrs r1, r0, 24
	cmp r1, 0
	beq _0806BEBA
	adds r0, r5, 0
	bl sub_806C658
	ldrh r0, [r6, 0x30]
	b _0806BEF0
_0806BEBA:
	movs r0, 0x1
	ands r0, r2
	cmp r0, 0
	beq _0806BEE8
	ldr r4, _0806BEE4 @ =gSprites
	adds r0, r5, 0
	bl sub_806CA00
	lsls r0, 24
	lsrs r0, 24
	lsls r1, r0, 4
	adds r1, r0
	lsls r1, 2
	adds r1, r4
	movs r2, 0x2E
	ldrsh r0, [r1, r2]
	cmp r0, 0x7
	bne _0806BEE8
	movs r0, 0x2
	b _0806BEF0
	.align 2, 0
_0806BEE4: .4byte gSprites
_0806BEE8:
	ldr r0, _0806BEF8 @ =gMain
	ldrh r1, [r0, 0x2E]
	movs r0, 0x3
	ands r0, r1
_0806BEF0:
	pop {r4-r6}
	pop {r1}
	bx r1
	.align 2, 0
_0806BEF8: .4byte gMain
	thumb_func_end sub_806BE38

	thumb_func_start task_pc_turn_off
task_pc_turn_off: @ 806BEFC
	push {lr}
	adds r2, r0, 0
	lsls r1, 24
	lsrs r3, r1, 24
	ldrb r0, [r2]
	cmp r0, 0
	beq _0806BF14
	ldrb r1, [r2, 0x1]
	movs r2, 0
	bl sub_806BA94
	b _0806BF1E
_0806BF14:
	ldrb r0, [r2]
	ldrb r1, [r2, 0x1]
	adds r2, r3, 0
	bl sub_806B9A4
_0806BF1E:
	pop {r0}
	bx r0
	thumb_func_end task_pc_turn_off

	thumb_func_start sub_806BF24
sub_806BF24: @ 806BF24
	push {r4-r7,lr}
	adds r7, r0, 0
	lsls r1, 24
	lsrs r1, 24
	lsls r2, 24
	lsrs r4, r2, 24
	lsls r3, 24
	lsrs r6, r3, 24
	movs r0, 0x64
	muls r1, r0
	ldr r0, _0806BF70 @ =gPlayerParty
	adds r5, r1, r0
	adds r0, r5, 0
	movs r1, 0xB
	bl GetMonData
	cmp r0, 0
	beq _0806BF56
	adds r0, r5, 0
	movs r1, 0x39
	bl GetMonData
	cmp r0, 0
	bne _0806BF56
	movs r4, 0x5
_0806BF56:
	cmp r6, 0x1
	bne _0806BF60
	adds r0, r4, 0x4
	lsls r0, 24
	lsrs r4, r0, 24
_0806BF60:
	adds r0, r7, 0
	adds r1, r4, 0
	bl task_pc_turn_off
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_0806BF70: .4byte gPlayerParty
	thumb_func_end sub_806BF24

	thumb_func_start sub_806BF74
sub_806BF74: @ 806BF74
	push {r4-r7,lr}
	mov r7, r9
	mov r6, r8
	push {r6,r7}
	lsls r0, 24
	lsrs r0, 24
	mov r9, r0
	lsls r1, 24
	lsrs r4, r1, 24
	bl sub_806CA00
	lsls r0, 24
	lsrs r6, r0, 24
	ldr r1, _0806C0C4 @ =gSprites
	lsls r0, r6, 4
	adds r0, r6
	lsls r0, 2
	adds r0, r1
	ldrh r0, [r0, 0x2E]
	lsls r0, 24
	lsrs r5, r0, 24
	mov r0, r9
	adds r1, r5, 0
	movs r2, 0
	bl sub_806DA44
	bl sub_806B528
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	beq _0806BFB6
	b _0806C0D8
_0806BFB6:
	cmp r5, 0
	beq _0806BFC2
	cmp r5, 0x2
	beq _0806BFC2
	cmp r5, 0x3
	bne _0806BFD2
_0806BFC2:
	lsls r0, r5, 1
	ldr r1, _0806C0C8 @ =gUnknown_083769C0
	adds r0, r1
	adds r1, r5, 0
	movs r2, 0x3
	movs r3, 0
	bl sub_806BF24
_0806BFD2:
	cmp r5, 0x1
	beq _0806BFDE
	cmp r5, 0x4
	beq _0806BFDE
	cmp r5, 0x5
	bne _0806BFEE
_0806BFDE:
	lsls r0, r5, 1
	ldr r1, _0806C0C8 @ =gUnknown_083769C0
	adds r0, r1
	adds r1, r5, 0
	movs r2, 0x4
	movs r3, 0
	bl sub_806BF24
_0806BFEE:
	cmp r5, 0x7
	bne _0806BFF8
	movs r0, 0x1
	bl sub_806BBEC
_0806BFF8:
	lsls r2, r4, 24
	asrs r2, 24
	adds r0, r6, 0
	adds r1, r5, 0
	bl sub_806C490
	ldr r2, _0806C0C4 @ =gSprites
	lsls r1, r6, 4
	adds r0, r1, r6
	lsls r0, 2
	adds r0, r2
	movs r2, 0x2E
	ldrsh r0, [r0, r2]
	mov r8, r1
	cmp r0, 0
	beq _0806C020
	cmp r0, 0x2
	beq _0806C020
	cmp r0, 0x3
	bne _0806C042
_0806C020:
	ldr r0, _0806C0C4 @ =gSprites
	mov r4, r8
	adds r1, r4, r6
	lsls r1, 2
	adds r1, r0
	movs r7, 0x2E
	ldrsh r0, [r1, r7]
	lsls r0, 1
	ldr r2, _0806C0C8 @ =gUnknown_083769C0
	adds r0, r2
	ldrh r1, [r1, 0x2E]
	lsls r1, 24
	lsrs r1, 24
	movs r2, 0x3
	movs r3, 0x1
	bl sub_806BF24
_0806C042:
	ldr r1, _0806C0C4 @ =gSprites
	mov r2, r8
	adds r0, r2, r6
	lsls r0, 2
	adds r0, r1
	movs r4, 0x2E
	ldrsh r0, [r0, r4]
	cmp r0, 0x1
	beq _0806C05C
	cmp r0, 0x4
	beq _0806C05C
	cmp r0, 0x5
	bne _0806C07E
_0806C05C:
	ldr r0, _0806C0C4 @ =gSprites
	mov r7, r8
	adds r1, r7, r6
	lsls r1, 2
	adds r1, r0
	movs r2, 0x2E
	ldrsh r0, [r1, r2]
	lsls r0, 1
	ldr r2, _0806C0C8 @ =gUnknown_083769C0
	adds r0, r2
	ldrh r1, [r1, 0x2E]
	lsls r1, 24
	lsrs r1, 24
	movs r2, 0x4
	movs r3, 0x1
	bl sub_806BF24
_0806C07E:
	ldr r7, _0806C0C4 @ =gSprites
	mov r4, r8
	adds r0, r4, r6
	lsls r0, 2
	adds r4, r0, r7
	movs r1, 0x2E
	ldrsh r0, [r4, r1]
	cmp r0, 0x7
	bne _0806C096
	movs r0, 0x2
	bl sub_806BBEC
_0806C096:
	ldr r0, _0806C0CC @ =0x0201b000
	ldr r2, _0806C0D0 @ =0x00000261
	adds r0, r2
	movs r1, 0x2
	strb r1, [r0]
	ldr r1, _0806C0D4 @ =gUnknown_083768B8
	movs r2, 0x2E
	ldrsh r0, [r4, r2]
	lsls r0, 2
	adds r0, r1
	adds r0, 0x40
	ldrb r0, [r0]
	strh r0, [r4, 0x20]
	movs r2, 0x2E
	ldrsh r0, [r4, r2]
	lsls r0, 2
	adds r0, r1
	adds r0, 0x41
	ldrb r0, [r0]
	strh r0, [r4, 0x22]
	adds r0, r7, 0
	b _0806C1A4
	.align 2, 0
_0806C0C4: .4byte gSprites
_0806C0C8: .4byte gUnknown_083769C0
_0806C0CC: .4byte 0x0201b000
_0806C0D0: .4byte 0x00000261
_0806C0D4: .4byte gUnknown_083768B8
_0806C0D8:
	bl battle_type_is_double
	lsls r0, 24
	lsrs r7, r0, 24
	cmp r5, 0x5
	bhi _0806C104
	lsls r0, r7, 1
	adds r0, r7
	lsls r0, 2
	lsls r1, r5, 1
	adds r0, r1
	ldr r1, _0806C100 @ =gUnknown_083769A8
	adds r0, r1
	adds r1, r5, 0
	movs r2, 0x3
	movs r3, 0
	bl sub_806BF24
	b _0806C10A
	.align 2, 0
_0806C100: .4byte gUnknown_083769A8
_0806C104:
	movs r0, 0x1
	bl sub_806BBEC
_0806C10A:
	cmp r7, 0
	bne _0806C11C
	lsls r2, r4, 24
	asrs r2, 24
	adds r0, r6, 0
	adds r1, r5, 0
	bl sub_806C1E4
	b _0806C128
_0806C11C:
	lsls r2, r4, 24
	asrs r2, 24
	adds r0, r6, 0
	adds r1, r5, 0
	bl sub_806C310
_0806C128:
	ldr r1, _0806C160 @ =gSprites
	lsls r2, r6, 4
	adds r0, r2, r6
	lsls r0, 2
	adds r1, r0, r1
	ldrh r3, [r1, 0x2E]
	movs r4, 0x2E
	ldrsh r0, [r1, r4]
	mov r8, r2
	cmp r0, 0x5
	bgt _0806C168
	lsls r0, r7, 1
	adds r0, r7
	lsls r0, 2
	movs r2, 0x2E
	ldrsh r1, [r1, r2]
	lsls r1, 1
	adds r0, r1
	ldr r1, _0806C164 @ =gUnknown_083769A8
	adds r0, r1
	lsls r1, r3, 24
	lsrs r1, 24
	movs r2, 0x3
	movs r3, 0x1
	bl sub_806BF24
	b _0806C16E
	.align 2, 0
_0806C160: .4byte gSprites
_0806C164: .4byte gUnknown_083769A8
_0806C168:
	movs r0, 0x2
	bl sub_806BBEC
_0806C16E:
	ldr r0, _0806C1D4 @ =0x0201b000
	ldr r4, _0806C1D8 @ =0x00000261
	adds r0, r4
	movs r1, 0x2
	strb r1, [r0]
	ldr r4, _0806C1DC @ =gSprites
	mov r0, r8
	adds r1, r0, r6
	lsls r1, 2
	adds r1, r4
	ldr r3, _0806C1E0 @ =gUnknown_083768B8
	movs r2, 0x2E
	ldrsh r0, [r1, r2]
	lsls r0, 2
	lsls r2, r7, 5
	adds r0, r2
	adds r0, r3
	ldrb r0, [r0]
	strh r0, [r1, 0x20]
	movs r7, 0x2E
	ldrsh r0, [r1, r7]
	lsls r0, 2
	adds r0, r2
	adds r0, r3
	ldrb r0, [r0, 0x1]
	strh r0, [r1, 0x22]
	adds r0, r4, 0
_0806C1A4:
	mov r1, r8
	adds r4, r1, r6
	lsls r4, 2
	adds r4, r0
	ldrh r1, [r4, 0x2E]
	lsls r1, 24
	lsrs r1, 24
	mov r0, r9
	movs r2, 0x1
	bl sub_806DA44
	movs r2, 0x2E
	ldrsh r0, [r4, r2]
	cmp r5, r0
	beq _0806C1C8
	movs r0, 0x5
	bl PlaySE
_0806C1C8:
	pop {r3,r4}
	mov r8, r3
	mov r9, r4
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_0806C1D4: .4byte 0x0201b000
_0806C1D8: .4byte 0x00000261
_0806C1DC: .4byte gSprites
_0806C1E0: .4byte gUnknown_083768B8
	thumb_func_end sub_806BF74

	thumb_func_start sub_806C1E4
sub_806C1E4: @ 806C1E4
	push {r4,r5,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	lsls r1, 24
	lsrs r3, r1, 24
	lsls r2, 24
	lsrs r5, r2, 24
	movs r0, 0x80
	lsls r0, 18
	adds r2, r0
	asrs r0, r2, 24
	cmp r0, 0x4
	bls _0806C200
	b _0806C306
_0806C200:
	lsls r0, 2
	ldr r1, _0806C20C @ =_0806C210
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_0806C20C: .4byte _0806C210
	.align 2, 0
_0806C210:
	.4byte _0806C2EC
	.4byte _0806C238
	.4byte _0806C224
	.4byte _0806C25C
	.4byte _0806C2BC
_0806C224:
	ldr r0, _0806C234 @ =gSprites
	lsls r1, r4, 4
	adds r1, r4
	lsls r1, 2
	adds r1, r0
	movs r0, 0
	strh r0, [r1, 0x30]
	b _0806C306
	.align 2, 0
_0806C234: .4byte gSprites
_0806C238:
	cmp r3, 0
	beq _0806C266
	cmp r3, 0x7
	bne _0806C298
	ldr r2, _0806C254 @ =gSprites
	lsls r3, r4, 4
	adds r1, r3, r4
	lsls r1, 2
	adds r1, r2
	ldr r0, _0806C258 @ =gPlayerPartyCount
	ldrb r0, [r0]
	subs r0, 0x1
	b _0806C2AA
	.align 2, 0
_0806C254: .4byte gSprites
_0806C258: .4byte gPlayerPartyCount
_0806C25C:
	ldr r0, _0806C278 @ =gPlayerPartyCount
	ldrb r0, [r0]
	subs r0, 0x1
	cmp r3, r0
	bne _0806C280
_0806C266:
	ldr r2, _0806C27C @ =gSprites
	lsls r3, r4, 4
	adds r0, r3, r4
	lsls r0, 2
	adds r0, r2
	movs r1, 0x7
	strh r1, [r0, 0x2E]
	b _0806C2AC
	.align 2, 0
_0806C278: .4byte gPlayerPartyCount
_0806C27C: .4byte gSprites
_0806C280:
	cmp r3, 0x7
	bne _0806C298
	ldr r2, _0806C294 @ =gSprites
	lsls r3, r4, 4
	adds r0, r3, r4
	lsls r0, 2
	adds r0, r2
	movs r1, 0
	strh r1, [r0, 0x2E]
	b _0806C2AC
	.align 2, 0
_0806C294: .4byte gSprites
_0806C298:
	ldr r2, _0806C2B8 @ =gSprites
	lsls r3, r4, 4
	adds r1, r3, r4
	lsls r1, 2
	adds r1, r2
	lsls r0, r5, 24
	asrs r0, 24
	ldrh r5, [r1, 0x2E]
	adds r0, r5
_0806C2AA:
	strh r0, [r1, 0x2E]
_0806C2AC:
	adds r0, r3, r4
	lsls r0, 2
	adds r0, r2
	movs r1, 0
	strh r1, [r0, 0x30]
	b _0806C306
	.align 2, 0
_0806C2B8: .4byte gSprites
_0806C2BC:
	ldr r0, _0806C2E4 @ =gPlayerPartyCount
	ldrb r0, [r0]
	cmp r0, 0x1
	bls _0806C306
	cmp r3, 0
	bne _0806C306
	ldr r0, _0806C2E8 @ =gSprites
	lsls r1, r4, 4
	adds r1, r4
	lsls r1, 2
	adds r1, r0
	movs r2, 0x30
	ldrsh r0, [r1, r2]
	cmp r0, 0
	bne _0806C2DE
	movs r0, 0x1
	strh r0, [r1, 0x30]
_0806C2DE:
	ldrh r0, [r1, 0x30]
	strh r0, [r1, 0x2E]
	b _0806C306
	.align 2, 0
_0806C2E4: .4byte gPlayerPartyCount
_0806C2E8: .4byte gSprites
_0806C2EC:
	subs r0, r3, 0x1
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x4
	bhi _0806C306
	ldr r0, _0806C30C @ =gSprites
	lsls r1, r4, 4
	adds r1, r4
	lsls r1, 2
	adds r1, r0
	movs r0, 0
	strh r0, [r1, 0x2E]
	strh r3, [r1, 0x30]
_0806C306:
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_0806C30C: .4byte gSprites
	thumb_func_end sub_806C1E4

	thumb_func_start sub_806C310
sub_806C310: @ 806C310
	push {r4,r5,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	lsls r1, 24
	lsrs r3, r1, 24
	lsls r2, 24
	lsrs r5, r2, 24
	movs r0, 0x80
	lsls r0, 18
	adds r2, r0
	asrs r0, r2, 24
	cmp r0, 0x4
	bls _0806C32C
	b _0806C486
_0806C32C:
	lsls r0, 2
	ldr r1, _0806C338 @ =_0806C33C
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_0806C338: .4byte _0806C33C
	.align 2, 0
_0806C33C:
	.4byte _0806C44E
	.4byte _0806C38C
	.4byte _0806C350
	.4byte _0806C364
	.4byte _0806C3E8
_0806C350:
	ldr r0, _0806C360 @ =gSprites
	lsls r1, r4, 4
	adds r1, r4
	lsls r1, 2
	adds r1, r0
	movs r0, 0
	strh r0, [r1, 0x30]
	b _0806C486
	.align 2, 0
_0806C360: .4byte gSprites
_0806C364:
	cmp r3, 0x7
	bne _0806C37C
	ldr r2, _0806C378 @ =gSprites
	lsls r3, r4, 4
	adds r0, r3, r4
	lsls r0, 2
	adds r0, r2
	movs r1, 0
	strh r1, [r0, 0x2E]
	b _0806C3D8
	.align 2, 0
_0806C378: .4byte gSprites
_0806C37C:
	ldr r0, _0806C388 @ =gPlayerPartyCount
	ldrb r0, [r0]
	subs r0, 0x1
	cmp r3, r0
	beq _0806C390
	b _0806C3C4
	.align 2, 0
_0806C388: .4byte gPlayerPartyCount
_0806C38C:
	cmp r3, 0
	bne _0806C3A4
_0806C390:
	ldr r2, _0806C3A0 @ =gSprites
	lsls r3, r4, 4
	adds r0, r3, r4
	lsls r0, 2
	adds r0, r2
	movs r1, 0x7
	strh r1, [r0, 0x2E]
	b _0806C3D8
	.align 2, 0
_0806C3A0: .4byte gSprites
_0806C3A4:
	cmp r3, 0x7
	bne _0806C3C4
	ldr r2, _0806C3BC @ =gSprites
	lsls r3, r4, 4
	adds r1, r3, r4
	lsls r1, 2
	adds r1, r2
	ldr r0, _0806C3C0 @ =gPlayerPartyCount
	ldrb r0, [r0]
	subs r0, 0x1
	b _0806C3D6
	.align 2, 0
_0806C3BC: .4byte gSprites
_0806C3C0: .4byte gPlayerPartyCount
_0806C3C4:
	ldr r2, _0806C3E4 @ =gSprites
	lsls r3, r4, 4
	adds r1, r3, r4
	lsls r1, 2
	adds r1, r2
	lsls r0, r5, 24
	asrs r0, 24
	ldrh r5, [r1, 0x2E]
	adds r0, r5
_0806C3D6:
	strh r0, [r1, 0x2E]
_0806C3D8:
	adds r0, r3, r4
	lsls r0, 2
	adds r0, r2
	movs r1, 0
	strh r1, [r0, 0x30]
	b _0806C486
	.align 2, 0
_0806C3E4: .4byte gSprites
_0806C3E8:
	cmp r3, 0
	bne _0806C418
	ldr r0, _0806C410 @ =gPlayerPartyCount
	ldrb r0, [r0]
	cmp r0, 0x2
	bls _0806C486
	ldr r0, _0806C414 @ =gSprites
	lsls r1, r4, 4
	adds r1, r4
	lsls r1, 2
	adds r1, r0
	ldrh r2, [r1, 0x30]
	subs r0, r2, 0x2
	lsls r0, 16
	lsrs r0, 16
	cmp r0, 0x1
	bls _0806C43A
	movs r0, 0x2
	strh r0, [r1, 0x2E]
	b _0806C486
	.align 2, 0
_0806C410: .4byte gPlayerPartyCount
_0806C414: .4byte gSprites
_0806C418:
	cmp r3, 0x1
	bne _0806C486
	ldr r0, _0806C440 @ =gPlayerPartyCount
	ldrb r0, [r0]
	cmp r0, 0x4
	bls _0806C486
	ldr r0, _0806C444 @ =gSprites
	lsls r1, r4, 4
	adds r1, r4
	lsls r1, 2
	adds r1, r0
	ldrh r2, [r1, 0x30]
	subs r0, r2, 0x4
	lsls r0, 16
	lsrs r0, 16
	cmp r0, 0x1
	bhi _0806C448
_0806C43A:
	strh r2, [r1, 0x2E]
	b _0806C486
	.align 2, 0
_0806C440: .4byte gPlayerPartyCount
_0806C444: .4byte gSprites
_0806C448:
	movs r0, 0x4
	strh r0, [r1, 0x2E]
	b _0806C486
_0806C44E:
	subs r0, r3, 0x2
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bhi _0806C46C
	ldr r0, _0806C468 @ =gSprites
	lsls r1, r4, 4
	adds r1, r4
	lsls r1, 2
	adds r1, r0
	movs r0, 0
	b _0806C482
	.align 2, 0
_0806C468: .4byte gSprites
_0806C46C:
	subs r0, r3, 0x4
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bhi _0806C486
	ldr r0, _0806C48C @ =gSprites
	lsls r1, r4, 4
	adds r1, r4
	lsls r1, 2
	adds r1, r0
	movs r0, 0x1
_0806C482:
	strh r0, [r1, 0x2E]
	strh r3, [r1, 0x30]
_0806C486:
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_0806C48C: .4byte gSprites
	thumb_func_end sub_806C310

	thumb_func_start sub_806C490
sub_806C490: @ 806C490
	push {r4-r6,lr}
	lsls r0, 24
	lsrs r5, r0, 24
	lsls r1, 24
	lsrs r4, r1, 24
	lsls r2, 24
	movs r0, 0x80
	lsls r0, 18
	adds r2, r0
	asrs r0, r2, 24
	cmp r0, 0x4
	bls _0806C4AA
	b _0806C64E
_0806C4AA:
	lsls r0, 2
	ldr r1, _0806C4B4 @ =_0806C4B8
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_0806C4B4: .4byte _0806C4B8
	.align 2, 0
_0806C4B8:
	.4byte _0806C618
	.4byte _0806C524
	.4byte _0806C4CC
	.4byte _0806C4E0
	.4byte _0806C57C
_0806C4CC:
	ldr r0, _0806C4DC @ =gSprites
	lsls r1, r5, 4
	adds r1, r5
	lsls r1, 2
	adds r1, r0
	movs r0, 0
	strh r0, [r1, 0x30]
	b _0806C64E
	.align 2, 0
_0806C4DC: .4byte gSprites
_0806C4E0:
	cmp r4, 0x7
	bne _0806C4FC
	ldr r2, _0806C4F8 @ =gSprites
	lsls r3, r5, 4
	adds r0, r3, r5
	lsls r0, 2
	adds r0, r2
	movs r1, 0
	strh r1, [r0, 0x2E]
	adds r1, r2, 0
	adds r6, r3, 0
	b _0806C566
	.align 2, 0
_0806C4F8: .4byte gSprites
_0806C4FC:
	lsls r6, r5, 4
	b _0806C518
_0806C500:
	adds r0, r4, 0x1
	lsls r0, 24
	lsrs r4, r0, 24
	movs r0, 0x64
	muls r0, r4
	ldr r1, _0806C520 @ =gPlayerParty
	adds r0, r1
	movs r1, 0xB
	bl GetMonData
	cmp r0, 0
	bne _0806C528
_0806C518:
	cmp r4, 0x5
	bne _0806C500
	b _0806C558
	.align 2, 0
_0806C520: .4byte gPlayerParty
_0806C524:
	lsls r6, r5, 4
	b _0806C554
_0806C528:
	ldr r1, _0806C534 @ =gSprites
	adds r0, r6, r5
	lsls r0, 2
	adds r0, r1
	strh r4, [r0, 0x2E]
	b _0806C566
	.align 2, 0
_0806C534: .4byte gSprites
_0806C538:
	subs r0, r4, 0x1
	lsls r0, 24
	lsrs r4, r0, 24
	cmp r4, 0x6
	beq _0806C554
	movs r0, 0x64
	muls r0, r4
	ldr r1, _0806C574 @ =gPlayerParty
	adds r0, r1
	movs r1, 0xB
	bl GetMonData
	cmp r0, 0
	bne _0806C528
_0806C554:
	cmp r4, 0
	bne _0806C538
_0806C558:
	ldr r0, _0806C578 @ =gSprites
	adds r1, r6, r5
	lsls r1, 2
	adds r1, r0
	movs r2, 0x7
	strh r2, [r1, 0x2E]
	adds r1, r0, 0
_0806C566:
	adds r0, r6, r5
	lsls r0, 2
	adds r0, r1
	movs r1, 0
	strh r1, [r0, 0x30]
	b _0806C64E
	.align 2, 0
_0806C574: .4byte gPlayerParty
_0806C578: .4byte gSprites
_0806C57C:
	cmp r4, 0
	bne _0806C5C8
	ldr r0, _0806C5AC @ =gSprites
	lsls r1, r5, 4
	adds r1, r5
	lsls r1, 2
	adds r4, r1, r0
	ldrh r1, [r4, 0x30]
	subs r0, r1, 0x2
	lsls r0, 16
	lsrs r0, 16
	cmp r0, 0x1
	bls _0806C5E2
	ldr r5, _0806C5B0 @ =gUnknown_03004428
	adds r0, r5, 0
	movs r1, 0xB
	bl GetMonData
	cmp r0, 0
	beq _0806C5B4
	movs r0, 0x2
	strh r0, [r4, 0x2E]
	b _0806C64E
	.align 2, 0
_0806C5AC: .4byte gSprites
_0806C5B0: .4byte gUnknown_03004428
_0806C5B4:
	adds r0, r5, 0
	adds r0, 0x64
	movs r1, 0xB
	bl GetMonData
	cmp r0, 0
	beq _0806C64E
	movs r0, 0x3
	strh r0, [r4, 0x2E]
	b _0806C64E
_0806C5C8:
	cmp r4, 0x1
	bne _0806C64E
	ldr r0, _0806C5E8 @ =gSprites
	lsls r1, r5, 4
	adds r1, r5
	lsls r1, 2
	adds r4, r1, r0
	ldrh r1, [r4, 0x30]
	subs r0, r1, 0x4
	lsls r0, 16
	lsrs r0, 16
	cmp r0, 0x1
	bhi _0806C5EC
_0806C5E2:
	strh r1, [r4, 0x2E]
	b _0806C64E
	.align 2, 0
_0806C5E8: .4byte gSprites
_0806C5EC:
	ldr r5, _0806C600 @ =gUnknown_030044F0
	adds r0, r5, 0
	movs r1, 0xB
	bl GetMonData
	cmp r0, 0
	beq _0806C604
	movs r0, 0x4
	strh r0, [r4, 0x2E]
	b _0806C64E
	.align 2, 0
_0806C600: .4byte gUnknown_030044F0
_0806C604:
	adds r0, r5, 0
	adds r0, 0x64
	movs r1, 0xB
	bl GetMonData
	cmp r0, 0
	beq _0806C64E
	movs r0, 0x5
	strh r0, [r4, 0x2E]
	b _0806C64E
_0806C618:
	subs r0, r4, 0x2
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bhi _0806C634
	ldr r0, _0806C630 @ =gSprites
	lsls r1, r5, 4
	adds r1, r5
	lsls r1, 2
	adds r1, r0
	movs r0, 0
	b _0806C64A
	.align 2, 0
_0806C630: .4byte gSprites
_0806C634:
	subs r0, r4, 0x4
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bhi _0806C64E
	ldr r0, _0806C654 @ =gSprites
	lsls r1, r5, 4
	adds r1, r5
	lsls r1, 2
	adds r1, r0
	movs r0, 0x1
_0806C64A:
	strh r0, [r1, 0x2E]
	strh r4, [r1, 0x30]
_0806C64E:
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_0806C654: .4byte gSprites
	thumb_func_end sub_806C490

	thumb_func_start sub_806C658
sub_806C658: @ 806C658
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	lsls r0, 24
	lsrs r0, 24
	mov r8, r0
	lsls r1, 24
	lsrs r4, r1, 24
	bl sub_806CA00
	lsls r0, 24
	lsrs r5, r0, 24
	ldr r1, _0806C6A0 @ =gSprites
	lsls r0, r5, 4
	adds r0, r5
	lsls r0, 2
	adds r0, r1
	ldrh r0, [r0, 0x2E]
	lsls r0, 24
	lsrs r6, r0, 24
	mov r0, r8
	adds r1, r6, 0
	movs r2, 0
	bl sub_806DA44
	cmp r6, 0x5
	bhi _0806C6A8
	lsls r0, r6, 1
	ldr r1, _0806C6A4 @ =gUnknown_083769A8
	adds r0, r1
	adds r1, r6, 0
	movs r2, 0x3
	movs r3, 0
	bl sub_806BF24
	b _0806C6BA
	.align 2, 0
_0806C6A0: .4byte gSprites
_0806C6A4: .4byte gUnknown_083769A8
_0806C6A8:
	cmp r6, 0x6
	bne _0806C6B4
	movs r0, 0x1
	bl sub_806BB9C
	b _0806C6BA
_0806C6B4:
	movs r0, 0x1
	bl sub_806BBEC
_0806C6BA:
	lsls r1, r4, 24
	movs r2, 0x80
	lsls r2, 18
	adds r0, r1, r2
	asrs r0, 24
	lsls r4, r5, 4
	adds r7, r1, 0
	cmp r0, 0x4
	bls _0806C6CE
	b _0806C7EA
_0806C6CE:
	lsls r0, 2
	ldr r1, _0806C6D8 @ =_0806C6DC
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_0806C6D8: .4byte _0806C6DC
	.align 2, 0
_0806C6DC:
	.4byte _0806C7D0
	.4byte _0806C708
	.4byte _0806C6F0
	.4byte _0806C740
	.4byte _0806C7A0
_0806C6F0:
	ldr r1, _0806C704 @ =gSprites
	lsls r2, r5, 4
	adds r0, r2, r5
	lsls r0, 2
	adds r0, r1
	movs r1, 0
	strh r1, [r0, 0x30]
	adds r4, r2, 0
	b _0806C7EA
	.align 2, 0
_0806C704: .4byte gSprites
_0806C708:
	cmp r6, 0
	bne _0806C720
	ldr r2, _0806C71C @ =gSprites
	lsls r3, r5, 4
	adds r0, r3, r5
	lsls r0, 2
	adds r0, r2
	movs r1, 0x7
	strh r1, [r0, 0x2E]
	b _0806C78E
	.align 2, 0
_0806C71C: .4byte gSprites
_0806C720:
	cmp r6, 0x6
	bne _0806C77C
	ldr r2, _0806C738 @ =gSprites
	lsls r3, r5, 4
	adds r1, r3, r5
	lsls r1, 2
	adds r1, r2
	ldr r0, _0806C73C @ =gPlayerPartyCount
	ldrb r0, [r0]
	subs r0, 0x1
	b _0806C78C
	.align 2, 0
_0806C738: .4byte gSprites
_0806C73C: .4byte gPlayerPartyCount
_0806C740:
	ldr r0, _0806C75C @ =gPlayerPartyCount
	ldrb r0, [r0]
	subs r0, 0x1
	cmp r6, r0
	bne _0806C764
	ldr r2, _0806C760 @ =gSprites
	lsls r3, r5, 4
	adds r0, r3, r5
	lsls r0, 2
	adds r0, r2
	movs r1, 0x6
	strh r1, [r0, 0x2E]
	b _0806C78E
	.align 2, 0
_0806C75C: .4byte gPlayerPartyCount
_0806C760: .4byte gSprites
_0806C764:
	cmp r6, 0x7
	bne _0806C77C
	ldr r2, _0806C778 @ =gSprites
	lsls r3, r5, 4
	adds r0, r3, r5
	lsls r0, 2
	adds r0, r2
	movs r1, 0
	strh r1, [r0, 0x2E]
	b _0806C78E
	.align 2, 0
_0806C778: .4byte gSprites
_0806C77C:
	ldr r2, _0806C79C @ =gSprites
	lsls r3, r5, 4
	adds r1, r3, r5
	lsls r1, 2
	adds r1, r2
	asrs r0, r7, 24
	ldrh r4, [r1, 0x2E]
	adds r0, r4
_0806C78C:
	strh r0, [r1, 0x2E]
_0806C78E:
	adds r4, r3, 0
	adds r0, r4, r5
	lsls r0, 2
	adds r0, r2
	movs r1, 0
	strh r1, [r0, 0x30]
	b _0806C7EA
	.align 2, 0
_0806C79C: .4byte gSprites
_0806C7A0:
	ldr r0, _0806C7C8 @ =gPlayerPartyCount
	ldrb r0, [r0]
	lsls r4, r5, 4
	cmp r0, 0x1
	bls _0806C7EA
	cmp r6, 0
	bne _0806C7EA
	ldr r0, _0806C7CC @ =gSprites
	adds r1, r4, r5
	lsls r1, 2
	adds r1, r0
	movs r2, 0x30
	ldrsh r0, [r1, r2]
	cmp r0, 0
	bne _0806C7C2
	movs r0, 0x1
	strh r0, [r1, 0x30]
_0806C7C2:
	ldrh r0, [r1, 0x30]
	strh r0, [r1, 0x2E]
	b _0806C7EA
	.align 2, 0
_0806C7C8: .4byte gPlayerPartyCount
_0806C7CC: .4byte gSprites
_0806C7D0:
	subs r0, r6, 0x1
	lsls r0, 24
	lsrs r0, 24
	lsls r4, r5, 4
	cmp r0, 0x4
	bhi _0806C7EA
	ldr r0, _0806C82C @ =gSprites
	adds r1, r4, r5
	lsls r1, 2
	adds r1, r0
	movs r0, 0
	strh r0, [r1, 0x2E]
	strh r6, [r1, 0x30]
_0806C7EA:
	ldr r1, _0806C82C @ =gSprites
	adds r0, r4, r5
	lsls r0, 2
	adds r2, r0, r1
	ldr r1, _0806C830 @ =gUnknown_083768B8
	movs r3, 0x2E
	ldrsh r0, [r2, r3]
	lsls r0, 2
	adds r0, r1
	ldrb r0, [r0]
	strh r0, [r2, 0x20]
	movs r3, 0x2E
	ldrsh r0, [r2, r3]
	lsls r0, 2
	adds r0, r1
	ldrb r0, [r0, 0x1]
	strh r0, [r2, 0x22]
	ldrh r3, [r2, 0x2E]
	movs r1, 0x2E
	ldrsh r0, [r2, r1]
	cmp r0, 0x5
	bgt _0806C838
	lsls r0, 1
	ldr r1, _0806C834 @ =gUnknown_083769A8
	adds r0, r1
	lsls r1, r3, 24
	lsrs r1, 24
	movs r2, 0x3
	movs r3, 0x1
	bl sub_806BF24
	b _0806C84A
	.align 2, 0
_0806C82C: .4byte gSprites
_0806C830: .4byte gUnknown_083768B8
_0806C834: .4byte gUnknown_083769A8
_0806C838:
	cmp r0, 0x6
	bne _0806C844
	movs r0, 0x2
	bl sub_806BB9C
	b _0806C84A
_0806C844:
	movs r0, 0x2
	bl sub_806BBEC
_0806C84A:
	ldr r0, _0806C884 @ =0x0201b000
	ldr r2, _0806C888 @ =0x00000261
	adds r0, r2
	movs r1, 0x2
	strb r1, [r0]
	ldr r0, _0806C88C @ =gSprites
	adds r4, r5
	lsls r4, 2
	adds r4, r0
	ldrh r1, [r4, 0x2E]
	lsls r1, 24
	lsrs r1, 24
	mov r0, r8
	movs r2, 0x1
	bl sub_806DA44
	movs r3, 0x2E
	ldrsh r0, [r4, r3]
	cmp r6, r0
	beq _0806C878
	movs r0, 0x5
	bl PlaySE
_0806C878:
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_0806C884: .4byte 0x0201b000
_0806C888: .4byte 0x00000261
_0806C88C: .4byte gSprites
	thumb_func_end sub_806C658

	thumb_func_start sub_806C890
sub_806C890: @ 806C890
	push {r4-r6,lr}
	lsls r0, 24
	lsrs r6, r0, 24
	adds r0, r6, 0
	bl sub_806CA00
	lsls r0, 24
	lsrs r5, r0, 24
	ldr r1, _0806C8D4 @ =gSprites
	lsls r0, r5, 4
	adds r0, r5
	lsls r0, 2
	adds r0, r1
	ldrh r0, [r0, 0x2E]
	lsls r0, 24
	lsrs r4, r0, 24
	cmp r4, 0x6
	beq _0806C914
	adds r0, r6, 0
	adds r1, r4, 0
	movs r2, 0
	bl sub_806DA44
	cmp r4, 0x5
	bhi _0806C8DC
	lsls r0, r4, 1
	ldr r1, _0806C8D8 @ =gUnknown_083769A8
	adds r0, r1
	adds r1, r4, 0
	movs r2, 0x3
	movs r3, 0
	bl sub_806BF24
	b _0806C8E2
	.align 2, 0
_0806C8D4: .4byte gSprites
_0806C8D8: .4byte gUnknown_083769A8
_0806C8DC:
	movs r0, 0x1
	bl sub_806BBEC
_0806C8E2:
	ldr r1, _0806C91C @ =gSprites
	lsls r0, r5, 4
	adds r0, r5
	lsls r0, 2
	adds r0, r1
	movs r1, 0
	strh r1, [r0, 0x30]
	movs r1, 0x6
	strh r1, [r0, 0x2E]
	ldr r2, _0806C920 @ =gUnknown_083768B8
	ldrb r1, [r2, 0x18]
	strh r1, [r0, 0x20]
	ldrb r1, [r2, 0x19]
	strh r1, [r0, 0x22]
	movs r0, 0x2
	bl sub_806BB9C
	ldr r0, _0806C924 @ =0x0201b000
	ldr r1, _0806C928 @ =0x00000261
	adds r0, r1
	movs r1, 0x2
	strb r1, [r0]
	movs r0, 0x5
	bl PlaySE
_0806C914:
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_0806C91C: .4byte gSprites
_0806C920: .4byte gUnknown_083768B8
_0806C924: .4byte 0x0201b000
_0806C928: .4byte 0x00000261
	thumb_func_end sub_806C890

	thumb_func_start sub_806C92C
sub_806C92C: @ 806C92C
	push {r4-r6,lr}
	lsls r0, 24
	lsrs r5, r0, 24
	ldr r0, _0806C960 @ =gSprites
	lsls r1, r5, 4
	adds r1, r5
	lsls r1, 2
	adds r1, r0
	ldrh r0, [r1, 0x2E]
	lsls r0, 24
	lsrs r6, r0, 24
	ldrh r0, [r1, 0x30]
	lsls r0, 24
	lsrs r4, r0, 24
	bl battle_type_is_double
	lsls r0, 24
	cmp r0, 0
	bne _0806C96A
	cmp r6, 0
	bne _0806C964
	cmp r4, 0
	bne _0806C97C
	movs r4, 0x1
	b _0806C97C
	.align 2, 0
_0806C960: .4byte gSprites
_0806C964:
	cmp r4, 0
	beq _0806C97C
	b _0806C97A
_0806C96A:
	cmp r6, 0x1
	bhi _0806C976
	cmp r4, 0x1
	bhi _0806C97C
	movs r4, 0x2
	b _0806C97C
_0806C976:
	cmp r4, 0x1
	bls _0806C97C
_0806C97A:
	movs r4, 0
_0806C97C:
	ldr r1, _0806C990 @ =gSprites
	lsls r0, r5, 4
	adds r0, r5
	lsls r0, 2
	adds r0, r1
	strh r4, [r0, 0x30]
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_0806C990: .4byte gSprites
	thumb_func_end sub_806C92C

	thumb_func_start sub_806C994
sub_806C994: @ 806C994
	push {r4,lr}
	adds r4, r1, 0
	lsls r0, 24
	lsrs r0, 24
	lsls r4, 24
	lsrs r4, 24
	bl sub_806CA00
	lsls r0, 24
	lsrs r0, 24
	ldr r2, _0806C9C0 @ =gSprites
	lsls r1, r0, 4
	adds r1, r0
	lsls r1, 2
	adds r1, r2
	strh r4, [r1, 0x2E]
	bl sub_806C92C
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0806C9C0: .4byte gSprites
	thumb_func_end sub_806C994

	thumb_func_start sub_806C9C4
sub_806C9C4: @ 806C9C4
	push {r4,lr}
	adds r4, r1, 0
	lsls r0, 24
	lsrs r0, 24
	lsls r4, 24
	lsrs r4, 24
	bl sub_806CA00
	lsls r0, 24
	lsrs r0, 24
	ldr r3, _0806C9FC @ =gSprites
	lsls r2, r4, 4
	adds r2, r4
	lsls r2, 2
	adds r2, r3
	lsls r1, r0, 4
	adds r1, r0
	lsls r1, 2
	adds r1, r3
	ldrh r0, [r1, 0x20]
	strh r0, [r2, 0x20]
	ldrh r0, [r1, 0x22]
	strh r0, [r2, 0x22]
	ldrh r0, [r1, 0x2E]
	strh r0, [r2, 0x2E]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0806C9FC: .4byte gSprites
	thumb_func_end sub_806C9C4

	thumb_func_start sub_806CA00
sub_806CA00: @ 806CA00
	lsls r0, 24
	lsrs r0, 24
	ldr r2, _0806CA14 @ =gTasks
	lsls r1, r0, 2
	adds r1, r0
	lsls r1, 3
	adds r1, r2
	ldrh r0, [r1, 0xE]
	lsrs r0, 8
	bx lr
	.align 2, 0
_0806CA14: .4byte gTasks
	thumb_func_end sub_806CA00

	thumb_func_start sub_806CA18
sub_806CA18: @ 806CA18
	lsls r0, 24
	lsrs r0, 24
	lsls r1, 24
	ldr r3, _0806CA34 @ =gTasks
	lsls r2, r0, 2
	adds r2, r0
	lsls r2, 3
	adds r2, r3
	ldrb r0, [r2, 0xE]
	lsrs r1, 16
	orrs r0, r1
	strh r0, [r2, 0xE]
	bx lr
	.align 2, 0
_0806CA34: .4byte gTasks
	thumb_func_end sub_806CA18

	thumb_func_start sub_806CA38
sub_806CA38: @ 806CA38
	push {lr}
	lsls r0, 24
	lsrs r0, 24
	bl sub_806CA00
	lsls r0, 24
	lsrs r0, 24
	ldr r2, _0806CA5C @ =gSprites
	lsls r1, r0, 4
	adds r1, r0
	lsls r1, 2
	adds r1, r2
	ldrh r0, [r1, 0x2E]
	lsls r0, 24
	lsrs r0, 24
	pop {r1}
	bx r1
	.align 2, 0
_0806CA5C: .4byte gSprites
	thumb_func_end sub_806CA38

	thumb_func_start sub_806CA60
sub_806CA60: @ 806CA60
	push {r4,r5,lr}
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	ldr r1, _0806CAD8 @ =gTasks
	lsls r0, r4, 2
	adds r0, r4
	lsls r0, 3
	adds r0, r1
	ldr r1, _0806CADC @ =TaskDummy
	str r1, [r0]
	ldr r5, _0806CAE0 @ =0x02001000
	strb r4, [r5]
	ldr r0, _0806CAE4 @ =sub_806CB74
	movs r1, 0
	bl CreateTask
	ldr r0, _0806CAE8 @ =SpriteCallbackDummy
	bl object_new_hidden_with_callback
	strb r0, [r5, 0x1]
	ldrb r1, [r5, 0x1]
	adds r0, r4, 0
	bl sub_806C9C4
	adds r0, r4, 0
	bl sub_806CA00
	strb r0, [r5, 0x2]
	ldr r1, _0806CAEC @ =0x0001a272
	adds r0, r5, r1
	ldrb r0, [r0]
	movs r1, 0
	bl sub_806D538
	ldr r2, _0806CAF0 @ =gSprites
	ldrb r0, [r5, 0x1]
	lsls r1, r0, 4
	adds r1, r0
	lsls r1, 2
	adds r1, r2
	movs r2, 0x2E
	ldrsh r0, [r1, r2]
	lsls r0, 1
	ldr r2, _0806CAF4 @ =gUnknown_083769A8
	adds r0, r2
	ldrh r1, [r1, 0x2E]
	lsls r1, 24
	lsrs r1, 24
	movs r2, 0x6
	movs r3, 0
	bl sub_806BF24
	ldr r0, _0806CAF8 @ =0x0001a261
	adds r5, r0
	movs r0, 0x2
	strb r0, [r5]
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_0806CAD8: .4byte gTasks
_0806CADC: .4byte TaskDummy
_0806CAE0: .4byte 0x02001000
_0806CAE4: .4byte sub_806CB74
_0806CAE8: .4byte SpriteCallbackDummy
_0806CAEC: .4byte 0x0001a272
_0806CAF0: .4byte gSprites
_0806CAF4: .4byte gUnknown_083769A8
_0806CAF8: .4byte 0x0001a261
	thumb_func_end sub_806CA60

	thumb_func_start sub_806CAFC
sub_806CAFC: @ 806CAFC
	push {r4,r5,lr}
	lsls r0, 24
	lsrs r0, 24
	ldr r4, _0806CB48 @ =0x02001000
	ldrb r3, [r4, 0x1]
	lsls r2, r3, 4
	adds r2, r3
	lsls r2, 2
	ldr r3, _0806CB4C @ =gSprites
	adds r5, r2, r3
	ldrb r2, [r4, 0x2]
	lsls r4, r2, 4
	adds r4, r2
	lsls r4, 2
	adds r4, r3
	lsls r1, 24
	asrs r1, 24
	bl sub_806BF74
	ldrh r2, [r5, 0x2E]
	movs r0, 0x2E
	ldrsh r1, [r5, r0]
	movs r3, 0x2E
	ldrsh r0, [r4, r3]
	cmp r1, r0
	beq _0806CB54
	adds r0, r1, 0
	lsls r0, 1
	ldr r1, _0806CB50 @ =gUnknown_083769A8
	adds r0, r1
	lsls r1, r2, 24
	lsrs r1, 24
	movs r2, 0x6
	movs r3, 0x1
	bl sub_806BF24
	b _0806CB6A
	.align 2, 0
_0806CB48: .4byte 0x02001000
_0806CB4C: .4byte gSprites
_0806CB50: .4byte gUnknown_083769A8
_0806CB54:
	movs r3, 0x2E
	ldrsh r0, [r5, r3]
	lsls r0, 1
	ldr r1, _0806CB70 @ =gUnknown_083769A8
	adds r0, r1
	lsls r1, r2, 24
	lsrs r1, 24
	movs r2, 0x6
	movs r3, 0
	bl sub_806BF24
_0806CB6A:
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_0806CB70: .4byte gUnknown_083769A8
	thumb_func_end sub_806CAFC

	thumb_func_start sub_806CB74
sub_806CB74: @ 806CB74
	push {r4,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	ldr r0, _0806CB8C @ =gMain
	ldrh r0, [r0, 0x30]
	cmp r0, 0x20
	beq _0806CBBC
	cmp r0, 0x20
	bgt _0806CB90
	cmp r0, 0x10
	beq _0806CBD0
	b _0806CBDA
	.align 2, 0
_0806CB8C: .4byte gMain
_0806CB90:
	cmp r0, 0x40
	beq _0806CB9A
	cmp r0, 0x80
	beq _0806CBAC
	b _0806CBDA
_0806CB9A:
	ldr r0, _0806CBA8 @ =0x02001000
	ldrb r0, [r0]
	movs r1, 0x1
	negs r1, r1
	bl sub_806CAFC
	b _0806CBDA
	.align 2, 0
_0806CBA8: .4byte 0x02001000
_0806CBAC:
	ldr r0, _0806CBB8 @ =0x02001000
	ldrb r0, [r0]
	movs r1, 0x1
	bl sub_806CAFC
	b _0806CBDA
	.align 2, 0
_0806CBB8: .4byte 0x02001000
_0806CBBC:
	ldr r0, _0806CBCC @ =0x02001000
	ldrb r0, [r0]
	movs r1, 0x2
	negs r1, r1
	bl sub_806CAFC
	b _0806CBDA
	.align 2, 0
_0806CBCC: .4byte 0x02001000
_0806CBD0:
	ldr r0, _0806CC04 @ =0x02001000
	ldrb r0, [r0]
	movs r1, 0x2
	bl sub_806CAFC
_0806CBDA:
	ldr r0, _0806CC08 @ =gMain
	ldrh r1, [r0, 0x2E]
	movs r0, 0x1
	ands r0, r1
	cmp r0, 0
	beq _0806CC10
	movs r0, 0x5
	bl PlaySE
	ldr r1, _0806CC0C @ =gTasks
	lsls r0, r4, 2
	adds r0, r4
	lsls r0, 3
	adds r0, r1
	ldr r1, _0806CC04 @ =0x02001000
	ldr r1, [r1, 0xC]
	str r1, [r0]
	adds r0, r4, 0
	bl _call_via_r1
	b _0806CC24
	.align 2, 0
_0806CC04: .4byte 0x02001000
_0806CC08: .4byte gMain
_0806CC0C: .4byte gTasks
_0806CC10:
	lsls r0, r1, 16
	lsrs r0, 16
	cmp r0, 0x2
	bne _0806CC24
	movs r0, 0x5
	bl PlaySE
	adds r0, r4, 0
	bl sub_806CD44
_0806CC24:
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end sub_806CB74

	thumb_func_start sub_806CC2C
sub_806CC2C: @ 806CC2C
	push {r4,r5,lr}
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	ldr r5, _0806CC68 @ =0x02001000
	ldrb r1, [r5, 0x1]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	ldr r1, _0806CC6C @ =gSprites
	adds r0, r1
	bl DestroySprite
	movs r0, 0
	movs r1, 0
	bl sub_806D538
	ldr r0, _0806CC70 @ =0x0001a261
	adds r1, r5, r0
	movs r0, 0x2
	strb r0, [r1]
	ldrb r0, [r5]
	bl SwitchTaskToFollowupFunc
	adds r0, r4, 0
	bl DestroyTask
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_0806CC68: .4byte 0x02001000
_0806CC6C: .4byte gSprites
_0806CC70: .4byte 0x0001a261
	thumb_func_end sub_806CC2C

	thumb_func_start sub_806CC74
sub_806CC74: @ 806CC74
	push {r4-r6,lr}
	mov r6, r8
	push {r6}
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	ldr r0, _0806CCD8 @ =gSprites
	mov r8, r0
	ldr r6, _0806CCDC @ =0x02001000
	ldrb r0, [r6, 0x2]
	lsls r1, r0, 4
	adds r1, r0
	lsls r1, 2
	add r1, r8
	movs r2, 0x2E
	ldrsh r0, [r1, r2]
	lsls r0, 1
	ldr r5, _0806CCE0 @ =gUnknown_083769A8
	adds r0, r5
	ldrh r1, [r1, 0x2E]
	lsls r1, 24
	lsrs r1, 24
	movs r2, 0x3
	movs r3, 0x1
	bl sub_806BF24
	ldrb r0, [r6, 0x1]
	lsls r1, r0, 4
	adds r1, r0
	lsls r1, 2
	add r1, r8
	movs r2, 0x2E
	ldrsh r0, [r1, r2]
	lsls r0, 1
	adds r0, r5
	ldrh r1, [r1, 0x2E]
	lsls r1, 24
	lsrs r1, 24
	movs r2, 0x3
	movs r3, 0
	bl sub_806BF24
	adds r0, r4, 0
	bl sub_806CC2C
	pop {r3}
	mov r8, r3
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_0806CCD8: .4byte gSprites
_0806CCDC: .4byte 0x02001000
_0806CCE0: .4byte gUnknown_083769A8
	thumb_func_end sub_806CC74

	thumb_func_start sub_806CCE4
sub_806CCE4: @ 806CCE4
	push {r4,r5,lr}
	ldr r3, _0806CD38 @ =gSprites
	ldr r2, _0806CD3C @ =0x02001000
	ldrb r1, [r2, 0x1]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r3
	ldrh r0, [r0, 0x2E]
	lsls r0, 24
	lsrs r4, r0, 24
	ldrb r1, [r2, 0x2]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r3
	ldrh r0, [r0, 0x2E]
	lsls r0, 24
	lsrs r5, r0, 24
	cmp r4, 0x5
	bhi _0806CD1E
	lsls r0, r4, 1
	ldr r1, _0806CD40 @ =gUnknown_083769A8
	adds r0, r1
	adds r1, r4, 0
	movs r2, 0x3
	movs r3, 0
	bl sub_806BF24
_0806CD1E:
	cmp r5, 0x5
	bhi _0806CD32
	lsls r0, r5, 1
	ldr r1, _0806CD40 @ =gUnknown_083769A8
	adds r0, r1
	adds r1, r5, 0
	movs r2, 0x3
	movs r3, 0x1
	bl sub_806BF24
_0806CD32:
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_0806CD38: .4byte gSprites
_0806CD3C: .4byte 0x02001000
_0806CD40: .4byte gUnknown_083769A8
	thumb_func_end sub_806CCE4

	thumb_func_start sub_806CD44
sub_806CD44: @ 806CD44
	push {r4,lr}
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	bl sub_806CCE4
	adds r0, r4, 0
	bl sub_806CC2C
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end sub_806CD44

	thumb_func_start sub_806CD5C
sub_806CD5C: @ 806CD5C
	push {r4-r7,lr}
	mov r7, r9
	mov r6, r8
	push {r6,r7}
	lsls r0, 24
	lsrs r0, 24
	mov r8, r0
	ldr r2, _0806CDA8 @ =gSprites
	ldr r6, _0806CDAC @ =0x02001000
	ldrb r1, [r6, 0x1]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r2
	ldrh r0, [r0, 0x2E]
	lsls r0, 24
	lsrs r5, r0, 24
	mov r9, r5
	ldrb r1, [r6, 0x2]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r2
	ldrh r0, [r0, 0x2E]
	lsls r0, 24
	lsrs r4, r0, 24
	adds r7, r4, 0
	cmp r5, r4
	beq _0806CD9E
	cmp r5, 0x7
	beq _0806CD9E
	cmp r4, 0x7
	bne _0806CDB0
_0806CD9E:
	mov r0, r8
	bl sub_806CD44
	b _0806CED2
	.align 2, 0
_0806CDA8: .4byte gSprites
_0806CDAC: .4byte 0x02001000
_0806CDB0:
	adds r0, r5, 0
	bl sub_806D5B8
	adds r0, r4, 0
	bl sub_806D5B8
	cmp r5, r4
	bls _0806CDC6
	strb r4, [r6, 0x5]
	strb r5, [r6, 0x6]
	b _0806CDCC
_0806CDC6:
	mov r0, r9
	strb r0, [r6, 0x5]
	strb r7, [r6, 0x6]
_0806CDCC:
	ldr r4, _0806CE1C @ =0x02001000
	ldrb r0, [r4]
	ldrb r1, [r4, 0x5]
	bl sub_806DDA0
	strb r0, [r4, 0x3]
	ldrb r0, [r4]
	ldrb r1, [r4, 0x6]
	bl sub_806DDA0
	strb r0, [r4, 0x4]
	ldrb r3, [r4, 0x5]
	cmp r3, 0
	bne _0806CE34
	ldr r2, _0806CE20 @ =gSprites
	ldrb r1, [r4, 0x3]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r2
	ldr r1, _0806CE24 @ =0x0000fff8
	strh r1, [r0, 0x2E]
	ldrb r1, [r4, 0x3]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r2
	ldr r1, _0806CE28 @ =0x0000ff58
	strh r1, [r0, 0x32]
	strh r3, [r4, 0x8]
	movs r0, 0xB
	strh r0, [r4, 0xA]
	ldr r1, _0806CE2C @ =gTasks
	mov r3, r8
	lsls r0, r3, 2
	add r0, r8
	lsls r0, 3
	adds r0, r1
	ldr r1, _0806CE30 @ =sub_806D014
	b _0806CE66
	.align 2, 0
_0806CE1C: .4byte 0x02001000
_0806CE20: .4byte gSprites
_0806CE24: .4byte 0x0000fff8
_0806CE28: .4byte 0x0000ff58
_0806CE2C: .4byte gTasks
_0806CE30: .4byte sub_806D014
_0806CE34:
	ldr r2, _0806CEE0 @ =gSprites
	ldrb r1, [r4, 0x3]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r2
	movs r1, 0x8
	strh r1, [r0, 0x2E]
	ldrb r1, [r4, 0x3]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r2
	movs r1, 0xA8
	strh r1, [r0, 0x32]
	movs r0, 0xB
	strh r0, [r4, 0x8]
	strh r0, [r4, 0xA]
	ldr r1, _0806CEE4 @ =gTasks
	mov r3, r8
	lsls r0, r3, 2
	add r0, r8
	lsls r0, 3
	adds r0, r1
	ldr r1, _0806CEE8 @ =sub_806D118
_0806CE66:
	str r1, [r0]
	ldr r0, _0806CEEC @ =0x0001a261
	adds r1, r4, r0
	movs r0, 0x1
	strb r0, [r1]
	adds r6, r2, 0
	ldr r4, _0806CEF0 @ =0x02001000
	ldrb r1, [r4, 0x3]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r5, r6, 0
	adds r5, 0x1C
	adds r0, r5
	ldr r2, _0806CEF4 @ =sub_806D37C
	str r2, [r0]
	ldrb r1, [r4, 0x4]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r6
	movs r1, 0x8
	strh r1, [r0, 0x2E]
	ldrb r1, [r4, 0x4]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r6
	movs r1, 0xA8
	strh r1, [r0, 0x32]
	ldrb r1, [r4, 0x4]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r5
	str r2, [r0]
	ldrb r1, [r4, 0x3]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r1, r0, r5
	adds r0, r6
	ldr r1, [r1]
	bl _call_via_r1
	ldrb r1, [r4, 0x4]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r5, r0, r5
	adds r0, r6
	ldr r1, [r5]
	bl _call_via_r1
_0806CED2:
	pop {r3,r4}
	mov r8, r3
	mov r9, r4
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_0806CEE0: .4byte gSprites
_0806CEE4: .4byte gTasks
_0806CEE8: .4byte sub_806D118
_0806CEEC: .4byte 0x0001a261
_0806CEF0: .4byte 0x02001000
_0806CEF4: .4byte sub_806D37C
	thumb_func_end sub_806CD5C

	thumb_func_start sub_806CEF8
sub_806CEF8: @ 806CEF8
	ldrh r3, [r0]
	ldrh r2, [r1]
	strh r2, [r0]
	strh r3, [r1]
	bx lr
	thumb_func_end sub_806CEF8

	thumb_func_start sub_806CF04
sub_806CF04: @ 806CF04
	push {r4,r5,lr}
	ldr r4, _0806CF94 @ =0x02001000
	ldrb r1, [r4, 0x3]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	ldr r5, _0806CF98 @ =gSprites + 0x20
	adds r0, r5
	ldrb r2, [r4, 0x4]
	lsls r1, r2, 4
	adds r1, r2
	lsls r1, 2
	adds r1, r5
	bl sub_806CEF8
	ldrb r1, [r4, 0x3]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r3, r5, 0x2
	adds r0, r3
	ldrb r2, [r4, 0x4]
	lsls r1, r2, 4
	adds r1, r2
	lsls r1, 2
	adds r1, r3
	bl sub_806CEF8
	ldrb r1, [r4, 0x3]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r3, r5, 0x4
	adds r0, r3
	ldrb r2, [r4, 0x4]
	lsls r1, r2, 4
	adds r1, r2
	lsls r1, 2
	adds r1, r3
	bl sub_806CEF8
	ldrb r1, [r4, 0x3]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r3, r5, 0
	adds r3, 0xE
	adds r0, r3
	ldrb r2, [r4, 0x4]
	lsls r1, r2, 4
	adds r1, r2
	lsls r1, 2
	adds r1, r3
	bl sub_806CEF8
	ldrb r1, [r4, 0x3]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	subs r5, 0x4
	adds r0, r5
	ldr r2, _0806CF9C @ =sub_806D37C
	str r2, [r0]
	ldrb r1, [r4, 0x4]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r5
	str r2, [r0]
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_0806CF94: .4byte 0x02001000
_0806CF98: .4byte gSprites + 0x20
_0806CF9C: .4byte sub_806D37C
	thumb_func_end sub_806CF04

	thumb_func_start sub_806CFA0
sub_806CFA0: @ 806CFA0
	push {r4-r6,lr}
	lsls r4, r1, 24
	lsrs r4, 24
	ldr r5, _0806CFDC @ =0x02001000
	ldrb r1, [r5, 0x6]
	subs r1, 0x1
	lsls r0, r1, 1
	adds r0, r1
	adds r0, 0x1
	lsls r0, 24
	lsrs r6, r0, 24
	movs r1, 0x8
	ldrsh r0, [r5, r1]
	movs r1, 0x3
	bl sub_806BA34
	movs r1, 0xA
	ldrsh r0, [r5, r1]
	adds r1, r6, 0
	bl sub_806BB3C
	cmp r4, 0
	bne _0806CFE0
	ldrh r0, [r5, 0x8]
	subs r0, 0x1
	strh r0, [r5, 0x8]
	ldrh r0, [r5, 0xA]
	adds r0, 0x1
	b _0806CFEA
	.align 2, 0
_0806CFDC: .4byte 0x02001000
_0806CFE0:
	ldrh r0, [r5, 0x8]
	adds r0, 0x1
	strh r0, [r5, 0x8]
	ldrh r0, [r5, 0xA]
	subs r0, 0x1
_0806CFEA:
	strh r0, [r5, 0xA]
	ldr r4, _0806D010 @ =0x02001000
	movs r1, 0x8
	ldrsh r0, [r4, r1]
	movs r1, 0x3
	movs r2, 0xA
	bl sub_806B9A4
	movs r1, 0xA
	ldrsh r0, [r4, r1]
	adds r1, r6, 0
	movs r2, 0
	movs r3, 0xA
	bl sub_806BA94
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_0806D010: .4byte 0x02001000
	thumb_func_end sub_806CFA0

	thumb_func_start sub_806D014
sub_806D014: @ 806D014
	push {r4,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	adds r0, r4, 0
	movs r1, 0
	bl sub_806CFA0
	ldr r2, _0806D050 @ =0x02001000
	movs r0, 0x8
	ldrsh r1, [r2, r0]
	movs r0, 0xD
	negs r0, r0
	cmp r1, r0
	bge _0806D04A
	movs r1, 0xA
	ldrsh r0, [r2, r1]
	cmp r0, 0x20
	ble _0806D04A
	bl sub_806CF04
	ldr r0, _0806D054 @ =gTasks
	lsls r1, r4, 2
	adds r1, r4
	lsls r1, 3
	adds r1, r0
	ldr r0, _0806D058 @ =sub_806D05C
	str r0, [r1]
_0806D04A:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0806D050: .4byte 0x02001000
_0806D054: .4byte gTasks
_0806D058: .4byte sub_806D05C
	thumb_func_end sub_806D014

	thumb_func_start sub_806D05C
sub_806D05C: @ 806D05C
	push {r4,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	adds r0, r4, 0
	movs r1, 0x1
	bl sub_806CFA0
	ldr r0, _0806D08C @ =0x02001000
	ldr r1, [r0, 0x8]
	movs r0, 0xB0
	lsls r0, 12
	cmp r1, r0
	bne _0806D084
	ldr r0, _0806D090 @ =gTasks
	lsls r1, r4, 2
	adds r1, r4
	lsls r1, 3
	adds r1, r0
	ldr r0, _0806D094 @ =sub_806D198
	str r0, [r1]
_0806D084:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0806D08C: .4byte 0x02001000
_0806D090: .4byte gTasks
_0806D094: .4byte sub_806D198
	thumb_func_end sub_806D05C

	thumb_func_start sub_806D098
sub_806D098: @ 806D098
	push {r4-r7,lr}
	lsls r4, r1, 24
	lsrs r4, 24
	ldr r5, _0806D0E0 @ =0x02001000
	ldrb r1, [r5, 0x5]
	subs r1, 0x1
	lsls r0, r1, 1
	adds r0, r1
	adds r0, 0x1
	lsls r0, 24
	lsrs r7, r0, 24
	ldrb r1, [r5, 0x6]
	subs r1, 0x1
	lsls r0, r1, 1
	adds r0, r1
	adds r0, 0x1
	lsls r0, 24
	lsrs r6, r0, 24
	movs r1, 0x8
	ldrsh r0, [r5, r1]
	adds r1, r7, 0
	bl sub_806BB3C
	movs r1, 0xA
	ldrsh r0, [r5, r1]
	adds r1, r6, 0
	bl sub_806BB3C
	cmp r4, 0
	bne _0806D0E4
	ldrh r0, [r5, 0x8]
	adds r0, 0x1
	strh r0, [r5, 0x8]
	ldrh r0, [r5, 0xA]
	adds r0, 0x1
	b _0806D0EE
	.align 2, 0
_0806D0E0: .4byte 0x02001000
_0806D0E4:
	ldrh r0, [r5, 0x8]
	subs r0, 0x1
	strh r0, [r5, 0x8]
	ldrh r0, [r5, 0xA]
	subs r0, 0x1
_0806D0EE:
	strh r0, [r5, 0xA]
	ldr r4, _0806D114 @ =0x02001000
	movs r1, 0x8
	ldrsh r0, [r4, r1]
	adds r1, r7, 0
	movs r2, 0
	movs r3, 0xA
	bl sub_806BA94
	movs r1, 0xA
	ldrsh r0, [r4, r1]
	adds r1, r6, 0
	movs r2, 0
	movs r3, 0xA
	bl sub_806BA94
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_0806D114: .4byte 0x02001000
	thumb_func_end sub_806D098

	thumb_func_start sub_806D118
sub_806D118: @ 806D118
	push {r4,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	adds r0, r4, 0
	movs r1, 0
	bl sub_806D098
	ldr r1, _0806D150 @ =0x02001000
	movs r2, 0x8
	ldrsh r0, [r1, r2]
	cmp r0, 0x20
	ble _0806D14A
	movs r2, 0xA
	ldrsh r0, [r1, r2]
	cmp r0, 0x20
	ble _0806D14A
	bl sub_806CF04
	ldr r0, _0806D154 @ =gTasks
	lsls r1, r4, 2
	adds r1, r4
	lsls r1, 3
	adds r1, r0
	ldr r0, _0806D158 @ =sub_806D15C
	str r0, [r1]
_0806D14A:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0806D150: .4byte 0x02001000
_0806D154: .4byte gTasks
_0806D158: .4byte sub_806D15C
	thumb_func_end sub_806D118

	thumb_func_start sub_806D15C
sub_806D15C: @ 806D15C
	push {r4,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	adds r0, r4, 0
	movs r1, 0x1
	bl sub_806D098
	ldr r0, _0806D188 @ =0x02001000
	ldr r1, [r0, 0x8]
	ldr r0, _0806D18C @ =0x000b000b
	cmp r1, r0
	bne _0806D182
	ldr r0, _0806D190 @ =gTasks
	lsls r1, r4, 2
	adds r1, r4
	lsls r1, 3
	adds r1, r0
	ldr r0, _0806D194 @ =sub_806D198
	str r0, [r1]
_0806D182:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0806D188: .4byte 0x02001000
_0806D18C: .4byte 0x000b000b
_0806D190: .4byte gTasks
_0806D194: .4byte sub_806D198
	thumb_func_end sub_806D15C

	thumb_func_start sub_806D198
sub_806D198: @ 806D198
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	mov r10, r0
	lsls r0, 24
	lsrs r0, 24
	mov r10, r0
	ldr r4, _0806D364 @ =0x02001000
	ldrb r0, [r4]
	ldrb r1, [r4, 0x5]
	ldrb r2, [r4, 0x4]
	bl sub_806DE50
	ldrb r0, [r4]
	ldrb r1, [r4, 0x6]
	ldrb r2, [r4, 0x3]
	bl sub_806DE50
	bl battle_type_is_double
	ldr r5, _0806D368 @ =gSprites
	ldrb r1, [r4, 0x3]
	lsls r3, r1, 4
	adds r3, r1
	lsls r3, 2
	adds r3, r5
	ldr r6, _0806D36C @ =gUnknown_08376678
	ldrb r2, [r4, 0x6]
	lsls r2, 2
	lsls r0, 24
	lsrs r0, 24
	lsls r1, r0, 1
	adds r1, r0
	lsls r1, 3
	adds r2, r1
	adds r2, r6
	ldrb r0, [r2]
	movs r1, 0
	mov r8, r1
	strh r0, [r3, 0x20]
	bl battle_type_is_double
	ldrb r1, [r4, 0x3]
	lsls r3, r1, 4
	adds r3, r1
	lsls r3, 2
	adds r3, r5
	ldrb r2, [r4, 0x6]
	lsls r2, 2
	lsls r0, 24
	lsrs r0, 24
	lsls r1, r0, 1
	adds r1, r0
	lsls r1, 3
	adds r2, r1
	adds r2, r6
	ldrb r0, [r2, 0x1]
	strh r0, [r3, 0x22]
	ldrb r1, [r4, 0x3]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r5
	mov r1, r8
	strh r1, [r0, 0x24]
	ldrb r1, [r4, 0x3]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r5
	mov r1, r8
	strh r1, [r0, 0x26]
	ldrb r1, [r4, 0x3]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	movs r1, 0x1C
	adds r1, r5
	mov r9, r1
	add r0, r9
	ldr r7, _0806D370 @ =sub_806DA38
	str r7, [r0]
	bl battle_type_is_double
	ldrb r1, [r4, 0x4]
	lsls r3, r1, 4
	adds r3, r1
	lsls r3, 2
	adds r3, r5
	ldrb r2, [r4, 0x5]
	lsls r2, 2
	lsls r0, 24
	lsrs r0, 24
	lsls r1, r0, 1
	adds r1, r0
	lsls r1, 3
	adds r2, r1
	adds r2, r6
	ldrb r0, [r2]
	strh r0, [r3, 0x20]
	bl battle_type_is_double
	ldrb r1, [r4, 0x4]
	lsls r3, r1, 4
	adds r3, r1
	lsls r3, 2
	adds r3, r5
	ldrb r2, [r4, 0x5]
	lsls r2, 2
	lsls r0, 24
	lsrs r0, 24
	lsls r1, r0, 1
	adds r1, r0
	lsls r1, 3
	adds r2, r1
	adds r2, r6
	ldrb r0, [r2, 0x1]
	strh r0, [r3, 0x22]
	ldrb r1, [r4, 0x4]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r5
	mov r1, r8
	strh r1, [r0, 0x24]
	ldrb r1, [r4, 0x4]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r5
	mov r1, r8
	strh r1, [r0, 0x26]
	ldrb r1, [r4, 0x4]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	add r0, r9
	str r7, [r0]
	ldrb r0, [r4]
	ldrb r2, [r4, 0x2]
	lsls r1, r2, 4
	adds r1, r2
	lsls r1, 2
	adds r1, r5
	ldrh r1, [r1, 0x2E]
	lsls r1, 24
	lsrs r1, 24
	bl sub_806DDA0
	lsls r0, 24
	lsrs r0, 24
	lsls r1, r0, 4
	adds r1, r0
	lsls r1, 2
	add r1, r9
	ldr r0, _0806D374 @ =sub_806DA0C
	str r0, [r1]
	ldrb r0, [r4, 0x5]
	movs r6, 0x64
	muls r0, r6
	ldr r5, _0806D378 @ =gPlayerParty
	adds r0, r5
	ldrb r1, [r4, 0x6]
	muls r1, r6
	adds r1, r5
	bl sub_806E6F0
	ldrb r0, [r4, 0x5]
	adds r1, r0, 0
	muls r1, r6
	adds r1, r5
	bl sub_806E2C0
	ldrb r0, [r4, 0x5]
	adds r1, r0, 0
	muls r1, r6
	adds r1, r5
	bl sub_806E07C
	ldrb r0, [r4, 0x5]
	adds r1, r0, 0
	muls r1, r6
	adds r1, r5
	bl sub_806E4E8
	ldrb r0, [r4, 0x5]
	adds r1, r0, 0
	muls r1, r6
	adds r1, r5
	bl nullsub_12
	ldrb r0, [r4, 0x6]
	adds r1, r0, 0
	muls r1, r6
	adds r1, r5
	bl sub_806E2C0
	ldrb r0, [r4, 0x6]
	adds r1, r0, 0
	muls r1, r6
	adds r1, r5
	bl sub_806E07C
	ldrb r0, [r4, 0x6]
	adds r1, r0, 0
	muls r1, r6
	adds r1, r5
	bl sub_806E4E8
	ldrb r0, [r4, 0x6]
	adds r1, r0, 0
	muls r1, r6
	adds r1, r5
	bl nullsub_12
	bl sub_806E6C8
	mov r0, r10
	bl sub_806CC74
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_0806D364: .4byte 0x02001000
_0806D368: .4byte gSprites
_0806D36C: .4byte gUnknown_08376678
_0806D370: .4byte sub_806DA38
_0806D374: .4byte sub_806DA0C
_0806D378: .4byte gPlayerParty
	thumb_func_end sub_806D198

	thumb_func_start sub_806D37C
sub_806D37C: @ 806D37C
	push {r4,lr}
	adds r4, r0, 0
	bl sub_809D638
	ldrh r2, [r4, 0x24]
	movs r0, 0x24
	ldrsh r1, [r4, r0]
	movs r3, 0x32
	ldrsh r0, [r4, r3]
	cmp r1, r0
	bne _0806D3A8
	movs r1, 0x2E
	ldrsh r0, [r4, r1]
	negs r0, r0
	movs r1, 0
	strh r0, [r4, 0x2E]
	strh r1, [r4, 0x32]
	ldr r0, _0806D3A4 @ =sub_806DA38
	str r0, [r4, 0x1C]
	b _0806D3AE
	.align 2, 0
_0806D3A4: .4byte sub_806DA38
_0806D3A8:
	ldrh r0, [r4, 0x2E]
	adds r0, r2, r0
	strh r0, [r4, 0x24]
_0806D3AE:
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end sub_806D37C

	thumb_func_start sub_806D3B4
sub_806D3B4: @ 806D3B4
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	adds r4, r1, 0
	lsls r0, 24
	lsrs r7, r0, 24
	lsls r4, 16
	lsrs r4, 16
	lsls r2, 16
	lsrs r2, 16
	mov r8, r2
	ldr r6, _0806D438 @ =gUnknown_083769C0
	ldr r1, _0806D43C @ =gTasks
	lsls r0, r7, 2
	adds r0, r7
	lsls r0, 3
	adds r5, r0, r1
	ldrh r0, [r5, 0x8]
	ldrb r1, [r6, 0x2]
	adds r0, r1
	lsls r0, 16
	asrs r0, 16
	ldrb r1, [r6, 0x3]
	bl sub_806BA34
	ldrh r0, [r5, 0x8]
	ldrb r1, [r6, 0x8]
	adds r0, r1
	lsls r0, 16
	asrs r0, 16
	ldrb r1, [r6, 0x9]
	bl sub_806BB3C
	ldrh r0, [r5, 0x8]
	ldrb r1, [r6, 0xA]
	adds r0, r1
	lsls r0, 16
	asrs r0, 16
	ldrb r1, [r6, 0xB]
	bl sub_806BB3C
	ldrh r1, [r5, 0x8]
	subs r1, 0x1
	strh r1, [r5, 0x8]
	ldrb r0, [r6, 0x2]
	adds r0, r1
	lsls r0, 16
	asrs r0, 16
	ldrb r1, [r6, 0x3]
	movs r2, 0x4
	bl sub_806B9A4
	cmp r4, 0
	beq _0806D440
	ldrh r0, [r5, 0x8]
	ldrb r1, [r6, 0x8]
	adds r0, r1
	lsls r0, 16
	asrs r0, 16
	ldrb r1, [r6, 0x9]
	movs r2, 0
	movs r3, 0x4
	bl sub_806BA94
	b _0806D454
	.align 2, 0
_0806D438: .4byte gUnknown_083769C0
_0806D43C: .4byte gTasks
_0806D440:
	ldrh r0, [r5, 0x8]
	ldrb r1, [r6, 0x8]
	adds r0, r1
	lsls r0, 16
	asrs r0, 16
	ldrb r1, [r6, 0x9]
	movs r2, 0x1
	movs r3, 0x4
	bl sub_806BA94
_0806D454:
	mov r0, r8
	cmp r0, 0
	beq _0806D480
	ldr r1, _0806D47C @ =gTasks
	lsls r0, r7, 2
	adds r0, r7
	lsls r0, 3
	adds r0, r1
	ldrh r0, [r0, 0x8]
	ldrb r1, [r6, 0xA]
	adds r0, r1
	lsls r0, 16
	asrs r0, 16
	ldrb r1, [r6, 0xB]
	movs r2, 0
	movs r3, 0x4
	bl sub_806BA94
	b _0806D49E
	.align 2, 0
_0806D47C: .4byte gTasks
_0806D480:
	ldr r1, _0806D4A8 @ =gTasks
	lsls r0, r7, 2
	adds r0, r7
	lsls r0, 3
	adds r0, r1
	ldrh r0, [r0, 0x8]
	ldrb r1, [r6, 0xA]
	adds r0, r1
	lsls r0, 16
	asrs r0, 16
	ldrb r1, [r6, 0xB]
	movs r2, 0x1
	movs r3, 0x4
	bl sub_806BA94
_0806D49E:
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_0806D4A8: .4byte gTasks
	thumb_func_end sub_806D3B4

	thumb_func_start sub_806D4AC
sub_806D4AC: @ 806D4AC
	push {r4,r5,lr}
	lsls r0, 24
	lsrs r5, r0, 24
	lsls r1, 16
	lsls r2, 24
	lsrs r2, 24
	cmp r1, 0
	beq _0806D4F6
	adds r1, r2, 0x3
	lsls r1, 24
	lsrs r1, 24
	adds r0, r5, 0
	bl sub_806DDA0
	lsls r0, 24
	lsrs r0, 24
	ldr r2, _0806D4FC @ =gSprites
	lsls r1, r0, 4
	adds r1, r0
	lsls r1, 2
	adds r4, r1, r2
	ldr r0, _0806D500 @ =0x0000fff8
	strh r0, [r4, 0x2E]
	ldr r3, _0806D504 @ =gTasks
	lsls r0, r5, 2
	adds r0, r5
	lsls r0, 3
	adds r0, r3
	movs r3, 0x8
	ldrsh r0, [r0, r3]
	lsls r0, 3
	negs r0, r0
	strh r0, [r4, 0x32]
	adds r2, 0x1C
	adds r1, r2
	ldr r0, _0806D508 @ =sub_806D37C
	str r0, [r1]
_0806D4F6:
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_0806D4FC: .4byte gSprites
_0806D500: .4byte 0x0000fff8
_0806D504: .4byte gTasks
_0806D508: .4byte sub_806D37C
	thumb_func_end sub_806D4AC

	thumb_func_start sub_806D50C
sub_806D50C: @ 806D50C
	push {lr}
	lsls r0, 24
	lsrs r0, 24
	lsls r1, 24
	lsrs r1, 24
	bl sub_806DDA0
	ldr r2, _0806D534 @ =gSprites
	lsls r0, 24
	lsrs r0, 24
	lsls r1, r0, 4
	adds r1, r0
	lsls r1, 2
	adds r1, r2
	ldrh r0, [r1, 0x20]
	adds r0, 0xF0
	strh r0, [r1, 0x20]
	pop {r0}
	bx r0
	.align 2, 0
_0806D534: .4byte gSprites
	thumb_func_end sub_806D50C

	thumb_func_start sub_806D538
sub_806D538: @ 806D538
	push {r4,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	lsls r1, 24
	lsrs r1, 24
	adds r0, r1, 0
	cmp r4, 0xFF
	beq _0806D59A
	cmp r1, 0x1
	beq _0806D568
	cmp r1, 0x1
	bgt _0806D556
	cmp r1, 0
	beq _0806D560
	b _0806D58A
_0806D556:
	cmp r0, 0x2
	beq _0806D570
	cmp r0, 0x3
	beq _0806D57E
	b _0806D58A
_0806D560:
	movs r0, 0
	movs r1, 0x10
	movs r2, 0x17
	b _0806D576
_0806D568:
	movs r0, 0
	movs r1, 0x10
	movs r2, 0x13
	b _0806D576
_0806D570:
	movs r0, 0
	movs r1, 0x10
	movs r2, 0x16
_0806D576:
	movs r3, 0x13
	bl MenuDrawTextWindow
	b _0806D58A
_0806D57E:
	movs r0, 0
	movs r1, 0x10
	movs r2, 0x12
	movs r3, 0x13
	bl MenuDrawTextWindow
_0806D58A:
	ldr r0, _0806D5A0 @ =gUnknown_08376624
	lsls r1, r4, 2
	adds r1, r0
	ldr r0, [r1]
	movs r1, 0x1
	movs r2, 0x11
	bl MenuPrint
_0806D59A:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0806D5A0: .4byte gUnknown_08376624
	thumb_func_end sub_806D538

	thumb_func_start sub_806D5A4
sub_806D5A4: @ 806D5A4
	push {lr}
	movs r0, 0
	movs r1, 0x10
	movs r2, 0x1D
	movs r3, 0x13
	bl MenuZeroFillWindowRect
	pop {r0}
	bx r0
	thumb_func_end sub_806D5A4

	thumb_func_start sub_806D5B8
sub_806D5B8: @ 806D5B8
	push {r4-r6,lr}
	mov r6, r10
	mov r5, r9
	mov r4, r8
	push {r4-r6}
	sub sp, 0x8
	adds r5, r0, 0
	lsls r5, 24
	lsrs r5, 24
	ldr r6, _0806D658 @ =gUnknown_08376948
	bl battle_type_is_double
	lsls r4, r5, 2
	lsls r0, 24
	lsrs r0, 24
	lsls r1, r0, 1
	adds r1, r0
	lsls r1, 3
	adds r1, r4, r1
	adds r1, r6
	ldrb r1, [r1]
	mov r10, r1
	bl battle_type_is_double
	lsls r0, 24
	lsrs r0, 24
	lsls r1, r0, 1
	adds r1, r0
	lsls r1, 3
	adds r1, r4, r1
	adds r1, r6
	ldrb r1, [r1, 0x1]
	mov r9, r1
	bl battle_type_is_double
	lsls r0, 24
	lsrs r0, 24
	lsls r1, r0, 1
	adds r1, r0
	lsls r1, 3
	adds r1, r4, r1
	adds r1, r6
	ldrb r1, [r1, 0x2]
	mov r8, r1
	bl battle_type_is_double
	lsls r0, 24
	lsrs r0, 24
	lsls r1, r0, 1
	adds r1, r0
	lsls r1, 3
	adds r4, r1
	adds r4, r6
	ldrb r1, [r4, 0x3]
	ldr r0, _0806D65C @ =gUnknown_03004210
	str r1, [sp]
	mov r1, r10
	mov r2, r9
	mov r3, r8
	bl ZeroFillWindowRect
	movs r0, 0
	str r0, [sp, 0x4]
	lsls r5, 10
	ldr r0, _0806D660 @ =0x06014000
	adds r5, r0
	ldr r2, _0806D664 @ =0x01000100
	add r0, sp, 0x4
	adds r1, r5, 0
	bl CpuFastSet
	add sp, 0x8
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_0806D658: .4byte gUnknown_08376948
_0806D65C: .4byte gUnknown_03004210
_0806D660: .4byte 0x06014000
_0806D664: .4byte 0x01000100
	thumb_func_end sub_806D5B8

	thumb_func_start sub_806D668
sub_806D668: @ 806D668
	push {r4-r6,lr}
	mov r6, r10
	mov r5, r9
	mov r4, r8
	push {r4-r6}
	sub sp, 0x8
	adds r5, r0, 0
	lsls r5, 24
	lsrs r5, 24
	ldr r6, _0806D708 @ =gUnknown_08376978
	bl battle_type_is_double
	lsls r4, r5, 2
	lsls r0, 24
	lsrs r0, 24
	lsls r1, r0, 1
	adds r1, r0
	lsls r1, 3
	adds r1, r4, r1
	adds r1, r6
	ldrb r1, [r1]
	mov r10, r1
	bl battle_type_is_double
	lsls r0, 24
	lsrs r0, 24
	lsls r1, r0, 1
	adds r1, r0
	lsls r1, 3
	adds r1, r4, r1
	adds r1, r6
	ldrb r1, [r1, 0x1]
	mov r9, r1
	bl battle_type_is_double
	lsls r0, 24
	lsrs r0, 24
	lsls r1, r0, 1
	adds r1, r0
	lsls r1, 3
	adds r1, r4, r1
	adds r1, r6
	ldrb r1, [r1, 0x2]
	mov r8, r1
	bl battle_type_is_double
	lsls r0, 24
	lsrs r0, 24
	lsls r1, r0, 1
	adds r1, r0
	lsls r1, 3
	adds r4, r1
	adds r4, r6
	ldrb r1, [r4, 0x3]
	ldr r0, _0806D70C @ =gUnknown_03004210
	str r1, [sp]
	mov r1, r10
	mov r2, r9
	mov r3, r8
	bl ZeroFillWindowRect
	movs r0, 0
	str r0, [sp, 0x4]
	lsls r5, 10
	ldr r0, _0806D710 @ =0x06014300
	adds r5, r0
	ldr r2, _0806D714 @ =0x01000040
	add r0, sp, 0x4
	adds r1, r5, 0
	bl CpuFastSet
	add sp, 0x8
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_0806D708: .4byte gUnknown_08376978
_0806D70C: .4byte gUnknown_03004210
_0806D710: .4byte 0x06014300
_0806D714: .4byte 0x01000040
	thumb_func_end sub_806D668

	thumb_func_start sub_806D718
sub_806D718: @ 806D718
	push {r4,r5,lr}
	sub sp, 0x4
	lsls r0, 24
	lsrs r4, r0, 24
	ldr r1, _0806D7C4 @ =0x00007fff
	mov r0, sp
	strh r1, [r0]
	movs r5, 0
	cmp r4, 0x1
	bhi _0806D736
	ldr r0, _0806D7C8 @ =gPartyMenuMisc_Gfx
	movs r1, 0xC0
	lsls r1, 19
	bl LZDecompressVram
_0806D736:
	cmp r4, 0x2
	beq _0806D73E
	cmp r4, 0
	bne _0806D746
_0806D73E:
	ldr r0, _0806D7CC @ =gPartyMenuMisc_Tilemap
	ldr r1, _0806D7D0 @ =0x06003800
	bl LZDecompressVram
_0806D746:
	cmp r4, 0x3
	beq _0806D74E
	cmp r4, 0
	bne _0806D75A
_0806D74E:
	ldr r0, _0806D7D4 @ =gPartyMenuMisc_Pal
	movs r2, 0xB0
	lsls r2, 1
	movs r1, 0
	bl LoadCompressedPalette
_0806D75A:
	cmp r4, 0x4
	beq _0806D762
	cmp r4, 0
	bne _0806D776
_0806D762:
	mov r0, sp
	movs r1, 0
	movs r2, 0x2
	bl LoadPalette
	ldr r0, _0806D7D8 @ =gFontDefaultPalette
	movs r1, 0xF0
	movs r2, 0x20
	bl LoadPalette
_0806D776:
	cmp r4, 0x5
	beq _0806D77E
	cmp r4, 0
	bne _0806D786
_0806D77E:
	ldr r0, _0806D7DC @ =gPartyMenuHpBar_Gfx
	ldr r1, _0806D7E0 @ =0x06006000
	bl LZDecompressVram
_0806D786:
	cmp r4, 0x6
	beq _0806D78E
	cmp r4, 0
	bne _0806D796
_0806D78E:
	ldr r0, _0806D7E4 @ =gPartyMenuOrderText_Gfx
	ldr r1, _0806D7E8 @ =0x06006180
	bl LZDecompressVram
_0806D796:
	cmp r4, 0x7
	beq _0806D79E
	cmp r4, 0
	bne _0806D7A6
_0806D79E:
	ldr r0, _0806D7EC @ =gStatusGfx_Icons
	ldr r1, _0806D7F0 @ =0x06007180
	bl LZDecompressVram
_0806D7A6:
	cmp r4, 0x8
	beq _0806D7AE
	cmp r4, 0
	bne _0806D7BA
_0806D7AE:
	ldr r0, _0806D7F4 @ =gStatusPal_Icons
	movs r1, 0xB0
	movs r2, 0x20
	bl LoadCompressedPalette
	movs r5, 0x1
_0806D7BA:
	adds r0, r5, 0
	add sp, 0x4
	pop {r4,r5}
	pop {r1}
	bx r1
	.align 2, 0
_0806D7C4: .4byte 0x00007fff
_0806D7C8: .4byte gPartyMenuMisc_Gfx
_0806D7CC: .4byte gPartyMenuMisc_Tilemap
_0806D7D0: .4byte 0x06003800
_0806D7D4: .4byte gPartyMenuMisc_Pal
_0806D7D8: .4byte gFontDefaultPalette
_0806D7DC: .4byte gPartyMenuHpBar_Gfx
_0806D7E0: .4byte 0x06006000
_0806D7E4: .4byte gPartyMenuOrderText_Gfx
_0806D7E8: .4byte 0x06006180
_0806D7EC: .4byte gStatusGfx_Icons
_0806D7F0: .4byte 0x06007180
_0806D7F4: .4byte gStatusPal_Icons
	thumb_func_end sub_806D718

	.align 2, 0 @ Don't pad with nop.
