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
	ldr r0, _0806AF84 @ =gBattleTypeFlags
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
_0806AF84: .4byte gBattleTypeFlags
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
	bl TryCreatePartyMenuMonIcon
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
	bl LoadHeldItemIconGraphics
	b _0806B0D8
_0806B066:
	movs r1, 0x98
	lsls r1, 2
	adds r0, r4, r1
	ldrb r0, [r0]
	bl CreateHeldItemIcons_806DC34
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
	bl PartyMenuPrintMonsLevelOrStatus
	b _0806B0D8
_0806B0AA:
	bl PrintPartyMenuMonNicknames
	ldr r1, _0806B0B8 @ =0x0201b000
	movs r0, 0x99
	lsls r0, 2
	adds r1, r0
	b _0806B0E0
	.align 2, 0
_0806B0B8: .4byte 0x0201b000
_0806B0BC:
	bl PartyMenuTryPrintMonsHP
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
	bl PartyMenuDrawHPBars
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

	thumb_func_start IsLinkDoubleBattle
IsLinkDoubleBattle: @ 806B528
	push {lr}
	ldr r0, _0806B53C @ =gBattleTypeFlags
	ldrh r1, [r0]
	movs r0, 0x4B
	ands r0, r1
	cmp r0, 0x4B
	beq _0806B540
	movs r0, 0
	b _0806B542
	.align 2, 0
_0806B53C: .4byte gBattleTypeFlags
_0806B540:
	movs r0, 0x1
_0806B542:
	pop {r1}
	bx r1
	thumb_func_end IsLinkDoubleBattle

	thumb_func_start sub_806B548
sub_806B548: @ 806B548
	push {r4,lr}
	ldr r0, _0806B574 @ =0x0201b000
	ldr r1, _0806B578 @ =0x00000261
	adds r4, r0, r1
	ldrb r3, [r4]
	cmp r3, 0
	beq _0806B56E
	ldr r1, _0806B57C @ =gBGTilemapBuffers + 0x1000
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
_0806B57C: .4byte gBGTilemapBuffers + 0x1000
_0806B580: .4byte 0x06003000
_0806B584: .4byte 0x040000d4
_0806B588: .4byte 0x80000400
	thumb_func_end sub_806B548

	thumb_func_start sub_806B58C
sub_806B58C: @ 806B58C
	push {r4,r5,lr}
	lsls r0, 24
	lsrs r5, r0, 24
	bl IsDoubleBattle
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
	bl IsLinkDoubleBattle
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
	ldr r0, _0806B624 @ =gBGTilemapBuffers + 0x1000
	movs r2, 0x80
	lsls r2, 4
	movs r1, 0
	bl memset
	b _0806B900
	.align 2, 0
_0806B624: .4byte gBGTilemapBuffers + 0x1000
_0806B628:
	ldrb r0, [r4]
	ldrb r1, [r4, 0x1]
	movs r2, 0x3
	bl sub_806B9A4
	adds r0, r4, 0
	movs r1, 0
	b _0806B8A8
_0806B638:
	bl IsDoubleBattle
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
	bl IsLinkDoubleBattle
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
	bl IsDoubleBattle
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
	bl IsLinkDoubleBattle
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _0806B6F6
	ldr r0, _0806B6EC @ =gPlayerParty + 2 * 0x64
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
_0806B6EC: .4byte gPlayerParty + 2 * 0x64
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
	bl IsDoubleBattle
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
	bl IsLinkDoubleBattle
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _0806B77E
	ldr r0, _0806B774 @ =gPlayerParty + 3 * 0x64
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
_0806B774: .4byte gPlayerParty + 3 * 0x64
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
	bl IsDoubleBattle
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
	bl IsLinkDoubleBattle
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _0806B80A
	ldr r0, _0806B800 @ =gPlayerParty + 4 * 0x64
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
_0806B800: .4byte gPlayerParty + 4 * 0x64
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
	bl IsDoubleBattle
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
	bl IsLinkDoubleBattle
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _0806B88E
	ldr r0, _0806B87C @ =gPlayerParty + 5 * 0x64
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
_0806B87C: .4byte gPlayerParty + 5 * 0x64
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
	ldr r0, _0806B948 @ =gBGTilemapBuffers + 0x1000
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
	ldr r5, _0806B954 @ =gPlayerParty + 1 * 0x64
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
_0806B948: .4byte gBGTilemapBuffers + 0x1000
_0806B94C: .4byte gUnknown_0202E8FA
_0806B950: .4byte gUnknown_083769A8
_0806B954: .4byte gPlayerParty + 1 * 0x64
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
	ldr r0, _0806BA30 @ =gBGTilemapBuffers + 0x1000
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
_0806BA30: .4byte gBGTilemapBuffers + 0x1000
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
	ldr r6, _0806BA90 @ =gBGTilemapBuffers + 0x1000
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
_0806BA90: .4byte gBGTilemapBuffers + 0x1000
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
	ldr r0, _0806BB38 @ =gBGTilemapBuffers + 0x1000
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
_0806BB38: .4byte gBGTilemapBuffers + 0x1000
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
	ldr r6, _0806BB98 @ =gBGTilemapBuffers + 0x1000
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
_0806BB98: .4byte gBGTilemapBuffers + 0x1000
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
	bl IsDoubleBattle
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
	bl CreateInvisibleSpriteWithCallback
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
	bl UpdateMonIconFrame_806DA44
	bl IsLinkDoubleBattle
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
	bl IsDoubleBattle
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
	bl UpdateMonIconFrame_806DA44
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
	ldr r5, _0806C5B0 @ =gPlayerParty + 2 * 0x64
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
_0806C5B0: .4byte gPlayerParty + 2 * 0x64
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
	ldr r5, _0806C600 @ =gPlayerParty + 4 * 0x64
	adds r0, r5, 0
	movs r1, 0xB
	bl GetMonData
	cmp r0, 0
	beq _0806C604
	movs r0, 0x4
	strh r0, [r4, 0x2E]
	b _0806C64E
	.align 2, 0
_0806C600: .4byte gPlayerParty + 4 * 0x64
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
	bl UpdateMonIconFrame_806DA44
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
	bl UpdateMonIconFrame_806DA44
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
	bl UpdateMonIconFrame_806DA44
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
	bl IsDoubleBattle
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
	bl CreateInvisibleSpriteWithCallback
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
	bl GetMonIconSpriteId_maybe
	strb r0, [r4, 0x3]
	ldrb r0, [r4]
	ldrb r1, [r4, 0x6]
	bl GetMonIconSpriteId_maybe
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
	bl SetMonIconSpriteId_maybe
	ldrb r0, [r4]
	ldrb r1, [r4, 0x6]
	ldrb r2, [r4, 0x3]
	bl SetMonIconSpriteId_maybe
	bl IsDoubleBattle
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
	bl IsDoubleBattle
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
	ldr r7, _0806D370 @ =UpdateMonIconFrame_806DA38
	str r7, [r0]
	bl IsDoubleBattle
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
	bl IsDoubleBattle
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
	bl GetMonIconSpriteId_maybe
	lsls r0, 24
	lsrs r0, 24
	lsls r1, r0, 4
	adds r1, r0
	lsls r1, 2
	add r1, r9
	ldr r0, _0806D374 @ =UpdateMonIconFrame_806DA0C
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
	bl PartyMenuPrintMonLevelOrStatus
	ldrb r0, [r4, 0x5]
	adds r1, r0, 0
	muls r1, r6
	adds r1, r5
	bl TryPrintPartyMenuMonNickname
	ldrb r0, [r4, 0x5]
	adds r1, r0, 0
	muls r1, r6
	adds r1, r5
	bl PartyMenuTryPrintHP
	ldrb r0, [r4, 0x5]
	adds r1, r0, 0
	muls r1, r6
	adds r1, r5
	bl nullsub_12
	ldrb r0, [r4, 0x6]
	adds r1, r0, 0
	muls r1, r6
	adds r1, r5
	bl PartyMenuPrintMonLevelOrStatus
	ldrb r0, [r4, 0x6]
	adds r1, r0, 0
	muls r1, r6
	adds r1, r5
	bl TryPrintPartyMenuMonNickname
	ldrb r0, [r4, 0x6]
	adds r1, r0, 0
	muls r1, r6
	adds r1, r5
	bl PartyMenuTryPrintHP
	ldrb r0, [r4, 0x6]
	adds r1, r0, 0
	muls r1, r6
	adds r1, r5
	bl nullsub_12
	bl PartyMenuDrawHPBars
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
_0806D370: .4byte UpdateMonIconFrame_806DA38
_0806D374: .4byte UpdateMonIconFrame_806DA0C
_0806D378: .4byte gPlayerParty
	thumb_func_end sub_806D198

	thumb_func_start sub_806D37C
sub_806D37C: @ 806D37C
	push {r4,lr}
	adds r4, r0, 0
	bl UpdateMonIconFrame
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
	ldr r0, _0806D3A4 @ =UpdateMonIconFrame_806DA38
	str r0, [r4, 0x1C]
	b _0806D3AE
	.align 2, 0
_0806D3A4: .4byte UpdateMonIconFrame_806DA38
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
	bl GetMonIconSpriteId_maybe
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
	bl GetMonIconSpriteId_maybe
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
	bl IsDoubleBattle
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
	bl IsDoubleBattle
	lsls r0, 24
	lsrs r0, 24
	lsls r1, r0, 1
	adds r1, r0
	lsls r1, 3
	adds r1, r4, r1
	adds r1, r6
	ldrb r1, [r1, 0x1]
	mov r9, r1
	bl IsDoubleBattle
	lsls r0, 24
	lsrs r0, 24
	lsls r1, r0, 1
	adds r1, r0
	lsls r1, 3
	adds r1, r4, r1
	adds r1, r6
	ldrb r1, [r1, 0x2]
	mov r8, r1
	bl IsDoubleBattle
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
	bl IsDoubleBattle
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
	bl IsDoubleBattle
	lsls r0, 24
	lsrs r0, 24
	lsls r1, r0, 1
	adds r1, r0
	lsls r1, 3
	adds r1, r4, r1
	adds r1, r6
	ldrb r1, [r1, 0x1]
	mov r9, r1
	bl IsDoubleBattle
	lsls r0, 24
	lsrs r0, 24
	lsls r1, r0, 1
	adds r1, r0
	lsls r1, 3
	adds r1, r4, r1
	adds r1, r6
	ldrb r1, [r1, 0x2]
	mov r8, r1
	bl IsDoubleBattle
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

	thumb_func_start SetMonIconAnimByHP
SetMonIconAnimByHP: @ 806D7F8
	push {r4-r6,lr}
	lsls r0, 24
	lsrs r6, r0, 24
	lsls r1, 16
	lsls r2, 16
	lsrs r5, r1, 16
	asrs r1, 16
	lsrs r4, r2, 16
	asrs r2, 16
	adds r0, r1, 0
	adds r1, r2, 0
	bl GetHPBarLevel
	lsls r0, 24
	lsrs r0, 24
	movs r2, 0
	cmp r5, r4
	beq _0806D830
	movs r2, 0x1
	cmp r0, 0x3
	beq _0806D830
	movs r2, 0x2
	cmp r0, 0x2
	beq _0806D830
	movs r2, 0x4
	cmp r0, 0x1
	bne _0806D830
	movs r2, 0x3
_0806D830:
	lsls r0, r6, 4
	adds r0, r6
	lsls r0, 2
	ldr r1, _0806D848 @ =gSprites
	adds r0, r1
	adds r1, r2, 0
	bl sub_809D824
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_0806D848: .4byte gSprites
	thumb_func_end SetMonIconAnimByHP

	thumb_func_start SetMonIconAnim
SetMonIconAnim: @ 806D84C
	push {r4-r6,lr}
	adds r5, r0, 0
	adds r6, r1, 0
	lsls r5, 24
	lsrs r5, 24
	adds r0, r6, 0
	movs r1, 0x39
	bl GetMonData
	adds r4, r0, 0
	lsls r4, 16
	lsrs r4, 16
	adds r0, r6, 0
	movs r1, 0x3A
	bl GetMonData
	adds r2, r0, 0
	lsls r2, 16
	lsrs r2, 16
	adds r0, r5, 0
	adds r1, r4, 0
	bl SetMonIconAnimByHP
	pop {r4-r6}
	pop {r0}
	bx r0
	thumb_func_end SetMonIconAnim

	thumb_func_start CreatePartyMenuMonIcon
CreatePartyMenuMonIcon: @ 806D880
	push {r4-r6,lr}
	mov r6, r10
	mov r5, r9
	mov r4, r8
	push {r4-r6}
	sub sp, 0x8
	adds r6, r0, 0
	adds r5, r1, 0
	mov r8, r3
	lsls r6, 24
	lsrs r6, 24
	lsls r5, 24
	lsrs r5, 24
	lsls r2, 24
	lsrs r2, 24
	ldr r3, _0806D904 @ =gUnknown_08376678
	lsls r1, r5, 2
	lsls r0, r2, 1
	adds r0, r2
	lsls r0, 3
	adds r1, r0
	adds r1, r3
	ldrb r0, [r1]
	mov r9, r0
	ldrb r1, [r1, 0x1]
	mov r10, r1
	mov r0, r8
	movs r1, 0x41
	bl GetMonData
	adds r4, r0, 0
	lsls r4, 16
	lsrs r4, 16
	mov r0, r8
	movs r1, 0
	bl GetMonData
	ldr r1, _0806D908 @ =sub_809D62C
	movs r2, 0x5
	str r2, [sp]
	str r0, [sp, 0x4]
	adds r0, r4, 0
	mov r2, r9
	mov r3, r10
	bl CreateMonIcon
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	adds r0, r6, 0
	adds r1, r5, 0
	adds r2, r4, 0
	bl SetMonIconSpriteId_maybe
	adds r0, r4, 0
	mov r1, r8
	bl SetMonIconAnim
	add sp, 0x8
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_0806D904: .4byte gUnknown_08376678
_0806D908: .4byte sub_809D62C
	thumb_func_end CreatePartyMenuMonIcon

	thumb_func_start TryCreatePartyMenuMonIcon
TryCreatePartyMenuMonIcon: @ 806D90C
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	adds r4, r2, 0
	lsls r0, 24
	lsrs r6, r0, 24
	mov r8, r6
	lsls r1, 24
	lsrs r5, r1, 24
	adds r7, r5, 0
	adds r0, r4, 0
	movs r1, 0xB
	bl GetMonData
	cmp r0, 0
	beq _0806D95A
	bl IsLinkDoubleBattle
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _0806D946
	adds r0, r6, 0
	adds r1, r5, 0
	movs r2, 0x2
	adds r3, r4, 0
	bl CreatePartyMenuMonIcon
	b _0806D95A
_0806D946:
	bl IsDoubleBattle
	adds r2, r0, 0
	lsls r2, 24
	lsrs r2, 24
	mov r0, r8
	adds r1, r7, 0
	adds r3, r4, 0
	bl CreatePartyMenuMonIcon
_0806D95A:
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r0}
	bx r0
	thumb_func_end TryCreatePartyMenuMonIcon

	thumb_func_start unref_sub_806D964
unref_sub_806D964: @ 806D964
	push {r4,r5,lr}
	lsls r0, 24
	lsrs r5, r0, 24
	movs r4, 0
	b _0806D986
_0806D96E:
	movs r0, 0x64
	adds r2, r4, 0
	muls r2, r0
	ldr r0, _0806D994 @ =gPlayerParty
	adds r2, r0
	adds r0, r5, 0
	adds r1, r4, 0
	bl TryCreatePartyMenuMonIcon
	adds r0, r4, 0x1
	lsls r0, 24
	lsrs r4, r0, 24
_0806D986:
	ldr r0, _0806D998 @ =gPlayerPartyCount
	ldrb r0, [r0]
	cmp r4, r0
	bcc _0806D96E
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_0806D994: .4byte gPlayerParty
_0806D998: .4byte gPlayerPartyCount
	thumb_func_end unref_sub_806D964

	thumb_func_start CreateMonIcon_806D99C
CreateMonIcon_806D99C: @ 806D99C
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	sub sp, 0x8
	adds r6, r0, 0
	adds r5, r1, 0
	mov r8, r3
	lsls r6, 24
	lsrs r6, 24
	lsls r5, 24
	lsrs r5, 24
	lsls r2, 24
	lsrs r2, 24
	ldr r3, _0806DA04 @ =gUnknown_08376678
	lsls r1, r5, 2
	lsls r0, r2, 1
	adds r0, r2
	lsls r0, 3
	adds r1, r0
	adds r1, r3
	ldrb r2, [r1]
	ldrb r3, [r1, 0x1]
	mov r1, r8
	ldrh r0, [r1]
	ldr r1, _0806DA08 @ =sub_809D62C
	movs r4, 0x5
	str r4, [sp]
	mov r7, r8
	ldr r4, [r7, 0x18]
	str r4, [sp, 0x4]
	bl CreateMonIcon
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	adds r0, r6, 0
	adds r1, r5, 0
	adds r2, r4, 0
	bl SetMonIconSpriteId_maybe
	ldrh r1, [r7, 0x10]
	ldrh r2, [r7, 0x12]
	adds r0, r4, 0
	bl SetMonIconAnimByHP
	add sp, 0x8
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_0806DA04: .4byte gUnknown_08376678
_0806DA08: .4byte sub_809D62C
	thumb_func_end CreateMonIcon_806D99C

	thumb_func_start UpdateMonIconFrame_806DA0C
UpdateMonIconFrame_806DA0C: @ 806DA0C
	push {r4,lr}
	adds r4, r0, 0
	bl UpdateMonIconFrame
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0
	beq _0806DA32
	movs r1, 0x1
	ands r0, r1
	cmp r0, 0
	beq _0806DA30
	ldr r0, _0806DA2C @ =0x0000fffd
	strh r0, [r4, 0x26]
	b _0806DA32
	.align 2, 0
_0806DA2C: .4byte 0x0000fffd
_0806DA30:
	strh r1, [r4, 0x26]
_0806DA32:
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end UpdateMonIconFrame_806DA0C

	thumb_func_start UpdateMonIconFrame_806DA38
UpdateMonIconFrame_806DA38: @ 806DA38
	push {lr}
	bl UpdateMonIconFrame
	pop {r0}
	bx r0
	thumb_func_end UpdateMonIconFrame_806DA38

	thumb_func_start UpdateMonIconFrame_806DA44
UpdateMonIconFrame_806DA44: @ 806DA44
	push {r4,lr}
	lsls r0, 24
	lsrs r0, 24
	lsls r1, 24
	lsrs r1, 24
	lsls r2, 24
	lsrs r4, r2, 24
	cmp r1, 0x5
	bhi _0806DA8E
	bl GetMonIconSpriteId_maybe
	lsls r0, 24
	lsrs r0, 24
	ldr r3, _0806DA7C @ =gSprites
	lsls r1, r0, 4
	adds r1, r0
	lsls r2, r1, 2
	adds r1, r2, r3
	movs r0, 0
	strh r0, [r1, 0x26]
	strh r0, [r1, 0x2E]
	cmp r4, 0
	bne _0806DA84
	adds r0, r3, 0
	adds r0, 0x1C
	adds r0, r2, r0
	ldr r1, _0806DA80 @ =UpdateMonIconFrame_806DA38
	b _0806DA8C
	.align 2, 0
_0806DA7C: .4byte gSprites
_0806DA80: .4byte UpdateMonIconFrame_806DA38
_0806DA84:
	adds r0, r3, 0
	adds r0, 0x1C
	adds r0, r2, r0
	ldr r1, _0806DA94 @ =UpdateMonIconFrame_806DA0C
_0806DA8C:
	str r1, [r0]
_0806DA8E:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0806DA94: .4byte UpdateMonIconFrame_806DA0C
	thumb_func_end UpdateMonIconFrame_806DA44

	thumb_func_start LoadHeldItemIconGraphics
LoadHeldItemIconGraphics: @ 806DA98
	push {lr}
	ldr r0, _0806DAAC @ =gUnknown_083765DC
	bl LoadSpriteSheet
	ldr r0, _0806DAB0 @ =gUnknown_083765E4
	bl LoadSpritePalette
	pop {r0}
	bx r0
	.align 2, 0
_0806DAAC: .4byte gUnknown_083765DC
_0806DAB0: .4byte gUnknown_083765E4
	thumb_func_end LoadHeldItemIconGraphics

	thumb_func_start SpriteCB_HeldItemIcon
SpriteCB_HeldItemIcon: @ 806DAB4
	push {r4,lr}
	adds r4, r0, 0
	ldrh r1, [r4, 0x3C]
	lsls r1, 24
	lsrs r1, 24
	ldr r2, _0806DAE4 @ =gSprites
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r2, r0, r2
	adds r0, r2, 0
	adds r0, 0x3E
	ldrb r0, [r0]
	lsls r0, 29
	cmp r0, 0
	bge _0806DAE8
	adds r0, r4, 0
	adds r0, 0x3E
	ldrb r1, [r0]
	movs r2, 0x4
	orrs r1, r2
	strb r1, [r0]
	b _0806DB06
	.align 2, 0
_0806DAE4: .4byte gSprites
_0806DAE8:
	adds r3, r4, 0
	adds r3, 0x3E
	ldrb r1, [r3]
	movs r0, 0x5
	negs r0, r0
	ands r0, r1
	strb r0, [r3]
	ldrh r0, [r2, 0x24]
	ldrh r1, [r2, 0x20]
	adds r0, r1
	strh r0, [r4, 0x20]
	ldrh r0, [r2, 0x26]
	ldrh r2, [r2, 0x22]
	adds r0, r2
	strh r0, [r4, 0x22]
_0806DB06:
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end SpriteCB_HeldItemIcon

	thumb_func_start CreateHeldItemIcon
CreateHeldItemIcon: @ 806DB0C
	push {r4-r6,lr}
	mov r6, r9
	mov r5, r8
	push {r5,r6}
	adds r6, r0, 0
	mov r9, r1
	lsls r6, 24
	lsrs r6, 24
	mov r0, r9
	lsls r0, 24
	lsrs r0, 24
	mov r9, r0
	ldr r0, _0806DB84 @ =gSprites
	mov r8, r0
	lsls r0, r6, 4
	adds r0, r6
	lsls r0, 2
	add r0, r8
	adds r0, 0x43
	ldrb r3, [r0]
	ldr r0, _0806DB88 @ =gSpriteTemplate_837660C
	subs r3, 0x1
	lsls r3, 24
	lsrs r3, 24
	movs r1, 0xFA
	movs r2, 0xAA
	bl CreateSprite
	lsls r0, 24
	lsrs r0, 24
	lsls r4, r0, 4
	adds r4, r0
	lsls r4, 2
	mov r0, r8
	adds r5, r4, r0
	movs r0, 0x4
	strh r0, [r5, 0x24]
	movs r0, 0xA
	strh r0, [r5, 0x26]
	movs r0, 0x1C
	add r8, r0
	add r4, r8
	ldr r0, _0806DB8C @ =SpriteCB_HeldItemIcon
	str r0, [r4]
	strh r6, [r5, 0x3C]
	adds r0, r5, 0
	mov r1, r9
	bl StartSpriteAnim
	ldr r1, [r4]
	adds r0, r5, 0
	bl _call_via_r1
	pop {r3,r4}
	mov r8, r3
	mov r9, r4
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_0806DB84: .4byte gSprites
_0806DB88: .4byte gSpriteTemplate_837660C
_0806DB8C: .4byte SpriteCB_HeldItemIcon
	thumb_func_end CreateHeldItemIcon

	thumb_func_start CreateHeldItemIcons
CreateHeldItemIcons: @ 806DB90
	push {r4-r7,lr}
	adds r6, r0, 0
	adds r7, r1, 0
	lsls r2, 24
	lsrs r2, 24
	cmp r2, 0
	beq _0806DBA4
	cmp r2, 0x1
	beq _0806DBEC
	b _0806DC28
_0806DBA4:
	movs r5, 0
	ldrb r0, [r6]
	cmp r5, r0
	bcs _0806DC28
_0806DBAC:
	movs r0, 0x64
	muls r0, r5
	ldr r1, _0806DBE8 @ =gPlayerParty
	adds r0, r1
	movs r1, 0xC
	bl GetMonData
	lsls r0, 16
	lsrs r1, r0, 16
	cmp r1, 0
	beq _0806DBD8
	adds r0, r7, r5
	ldrb r4, [r0]
	adds r0, r1, 0
	bl itemid_is_mail
	adds r1, r0, 0
	lsls r1, 24
	lsrs r1, 24
	adds r0, r4, 0
	bl CreateHeldItemIcon
_0806DBD8:
	adds r0, r5, 0x1
	lsls r0, 16
	lsrs r5, r0, 16
	ldrb r0, [r6]
	cmp r5, r0
	bcc _0806DBAC
	b _0806DC28
	.align 2, 0
_0806DBE8: .4byte gPlayerParty
_0806DBEC:
	movs r5, 0
	b _0806DC22
_0806DBF0:
	movs r0, 0x64
	muls r0, r5
	ldr r1, _0806DC30 @ =gEnemyParty
	adds r0, r1
	movs r1, 0xC
	bl GetMonData
	lsls r0, 16
	lsrs r1, r0, 16
	cmp r1, 0
	beq _0806DC1C
	adds r0, r5, r7
	ldrb r4, [r0, 0x6]
	adds r0, r1, 0
	bl itemid_is_mail
	adds r1, r0, 0
	lsls r1, 24
	lsrs r1, 24
	adds r0, r4, 0
	bl CreateHeldItemIcon
_0806DC1C:
	adds r0, r5, 0x1
	lsls r0, 16
	lsrs r5, r0, 16
_0806DC22:
	ldrb r0, [r6, 0x1]
	cmp r5, r0
	bcc _0806DBF0
_0806DC28:
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_0806DC30: .4byte gEnemyParty
	thumb_func_end CreateHeldItemIcons

	thumb_func_start CreateHeldItemIcons_806DC34
CreateHeldItemIcons_806DC34: @ 806DC34
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	lsls r0, 24
	lsrs r0, 24
	mov r8, r0
	movs r7, 0
	ldr r0, _0806DCC8 @ =gSprites
	mov r9, r0
	movs r1, 0x1C
	add r1, r9
	mov r10, r1
_0806DC50:
	movs r0, 0x64
	muls r0, r7
	ldr r1, _0806DCCC @ =gPlayerParty
	adds r0, r1
	movs r1, 0xB
	bl GetMonData
	cmp r0, 0
	beq _0806DCB0
	mov r0, r8
	adds r1, r7, 0
	bl GetMonIconSpriteId_maybe
	adds r5, r0, 0
	lsls r5, 24
	lsrs r5, 24
	ldr r0, _0806DCD0 @ =gSpriteTemplate_837660C
	movs r1, 0xFA
	movs r2, 0xAA
	movs r3, 0x4
	bl CreateSprite
	lsls r0, 24
	lsrs r0, 24
	lsls r4, r0, 4
	adds r4, r0
	lsls r4, 2
	mov r1, r9
	adds r6, r4, r1
	movs r1, 0x4
	strh r1, [r6, 0x24]
	movs r1, 0xA
	strh r1, [r6, 0x26]
	strh r5, [r6, 0x3C]
	lsls r1, r5, 4
	adds r1, r5
	lsls r1, 2
	add r1, r9
	strh r0, [r1, 0x3C]
	mov r0, r8
	adds r1, r7, 0
	bl SetHeldItemIconVisibility
	add r4, r10
	ldr r1, [r4]
	adds r0, r6, 0
	bl _call_via_r1
_0806DCB0:
	adds r0, r7, 0x1
	lsls r0, 24
	lsrs r7, r0, 24
	cmp r7, 0x5
	bls _0806DC50
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_0806DCC8: .4byte gSprites
_0806DCCC: .4byte gPlayerParty
_0806DCD0: .4byte gSpriteTemplate_837660C
	thumb_func_end CreateHeldItemIcons_806DC34

	thumb_func_start CreateHeldItemIcon_806DCD4
CreateHeldItemIcon_806DCD4: @ 806DCD4
	push {r4-r7,lr}
	lsls r0, 24
	lsrs r0, 24
	lsls r1, 24
	lsrs r1, 24
	lsls r2, 16
	lsrs r7, r2, 16
	bl GetMonIconSpriteId_maybe
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	ldr r0, _0806DD2C @ =gSpriteTemplate_837660C
	movs r1, 0xFA
	movs r2, 0xAA
	movs r3, 0x4
	bl CreateSprite
	lsls r0, 24
	lsrs r6, r0, 24
	ldr r1, _0806DD30 @ =gSprites
	lsls r0, r6, 4
	adds r0, r6
	lsls r0, 2
	adds r5, r0, r1
	movs r0, 0x4
	strh r0, [r5, 0x24]
	movs r0, 0xA
	strh r0, [r5, 0x26]
	strh r4, [r5, 0x3C]
	lsls r0, r4, 4
	adds r0, r4
	lsls r0, 2
	adds r0, r1
	strh r6, [r0, 0x3C]
	cmp r7, 0
	bne _0806DD34
	adds r0, r5, 0
	adds r0, 0x3E
	ldrb r1, [r0]
	movs r2, 0x4
	orrs r1, r2
	strb r1, [r0]
	b _0806DD5C
	.align 2, 0
_0806DD2C: .4byte gSpriteTemplate_837660C
_0806DD30: .4byte gSprites
_0806DD34:
	adds r0, r7, 0
	bl itemid_is_mail
	lsls r0, 24
	cmp r0, 0
	beq _0806DD46
	adds r0, r5, 0
	movs r1, 0x1
	b _0806DD4A
_0806DD46:
	adds r0, r5, 0
	movs r1, 0
_0806DD4A:
	bl StartSpriteAnim
	adds r2, r5, 0
	adds r2, 0x3E
	ldrb r1, [r2]
	movs r0, 0x5
	negs r0, r0
	ands r0, r1
	strb r0, [r2]
_0806DD5C:
	ldr r2, _0806DD78 @ =gSprites
	lsls r0, r6, 4
	adds r0, r6
	lsls r0, 2
	adds r1, r2, 0
	adds r1, 0x1C
	adds r1, r0, r1
	adds r0, r2
	ldr r1, [r1]
	bl _call_via_r1
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_0806DD78: .4byte gSprites
	thumb_func_end CreateHeldItemIcon_806DCD4

	thumb_func_start SpriteCB_HeldItemIcon_806DD7C
SpriteCB_HeldItemIcon_806DD7C: @ 806DD7C
	ldrh r2, [r0, 0x3C]
	lsls r2, 24
	lsrs r2, 24
	ldr r3, _0806DD9C @ =gSprites
	lsls r1, r2, 4
	adds r1, r2
	lsls r1, 2
	adds r1, r3
	ldrh r2, [r1, 0x24]
	ldrh r3, [r1, 0x20]
	adds r2, r3
	strh r2, [r0, 0x20]
	ldrh r1, [r1, 0x22]
	strh r1, [r0, 0x22]
	bx lr
	.align 2, 0
_0806DD9C: .4byte gSprites
	thumb_func_end SpriteCB_HeldItemIcon_806DD7C

	thumb_func_start GetMonIconSpriteId_maybe
GetMonIconSpriteId_maybe: @ 806DDA0
	push {lr}
	lsls r0, 24
	lsrs r2, r0, 24
	lsls r1, 24
	lsrs r0, r1, 24
	cmp r0, 0x5
	bhi _0806DE38
	lsls r0, 2
	ldr r1, _0806DDB8 @ =_0806DDBC
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_0806DDB8: .4byte _0806DDBC
	.align 2, 0
_0806DDBC:
	.4byte _0806DE38
	.4byte _0806DDD4
	.4byte _0806DDE8
	.4byte _0806DDFC
	.4byte _0806DE10
	.4byte _0806DE24
_0806DDD4:
	ldr r0, _0806DDE4 @ =gTasks
	lsls r1, r2, 2
	adds r1, r2
	lsls r1, 3
	adds r1, r0
	ldrb r0, [r1, 0x8]
	b _0806DE46
	.align 2, 0
_0806DDE4: .4byte gTasks
_0806DDE8:
	ldr r0, _0806DDF8 @ =gTasks
	lsls r1, r2, 2
	adds r1, r2
	lsls r1, 3
	adds r1, r0
	ldrh r0, [r1, 0xA]
	b _0806DE44
	.align 2, 0
_0806DDF8: .4byte gTasks
_0806DDFC:
	ldr r0, _0806DE0C @ =gTasks
	lsls r1, r2, 2
	adds r1, r2
	lsls r1, 3
	adds r1, r0
	ldrb r0, [r1, 0xA]
	b _0806DE46
	.align 2, 0
_0806DE0C: .4byte gTasks
_0806DE10:
	ldr r0, _0806DE20 @ =gTasks
	lsls r1, r2, 2
	adds r1, r2
	lsls r1, 3
	adds r1, r0
	ldrh r0, [r1, 0xC]
	b _0806DE44
	.align 2, 0
_0806DE20: .4byte gTasks
_0806DE24:
	ldr r0, _0806DE34 @ =gTasks
	lsls r1, r2, 2
	adds r1, r2
	lsls r1, 3
	adds r1, r0
	ldrb r0, [r1, 0xC]
	b _0806DE46
	.align 2, 0
_0806DE34: .4byte gTasks
_0806DE38:
	ldr r0, _0806DE4C @ =gTasks
	lsls r1, r2, 2
	adds r1, r2
	lsls r1, 3
	adds r1, r0
	ldrh r0, [r1, 0x8]
_0806DE44:
	lsrs r0, 8
_0806DE46:
	pop {r1}
	bx r1
	.align 2, 0
_0806DE4C: .4byte gTasks
	thumb_func_end GetMonIconSpriteId_maybe

	thumb_func_start SetMonIconSpriteId_maybe
SetMonIconSpriteId_maybe: @ 806DE50
	push {r4,lr}
	lsls r0, 24
	lsrs r3, r0, 24
	lsls r1, 24
	lsrs r0, r1, 24
	lsls r2, 24
	lsrs r4, r2, 24
	cmp r0, 0x5
	bhi _0806DF24
	lsls r0, 2
	ldr r1, _0806DE6C @ =_0806DE70
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_0806DE6C: .4byte _0806DE70
	.align 2, 0
_0806DE70:
	.4byte _0806DE88
	.4byte _0806DEA0
	.4byte _0806DEC0
	.4byte _0806DED8
	.4byte _0806DEF8
	.4byte _0806DF10
_0806DE88:
	ldr r1, _0806DE9C @ =gTasks
	lsls r0, r3, 2
	adds r0, r3
	lsls r0, 3
	adds r0, r1
	ldrb r1, [r0, 0x8]
	lsls r2, r4, 8
	orrs r1, r2
	strh r1, [r0, 0x8]
	b _0806DF24
	.align 2, 0
_0806DE9C: .4byte gTasks
_0806DEA0:
	ldr r0, _0806DEB8 @ =gTasks
	lsls r1, r3, 2
	adds r1, r3
	lsls r1, 3
	adds r1, r0
	ldrh r2, [r1, 0x8]
	ldr r0, _0806DEBC @ =0xffffff00
	ands r0, r2
	orrs r0, r4
	strh r0, [r1, 0x8]
	b _0806DF24
	.align 2, 0
_0806DEB8: .4byte gTasks
_0806DEBC: .4byte 0xffffff00
_0806DEC0:
	ldr r1, _0806DED4 @ =gTasks
	lsls r0, r3, 2
	adds r0, r3
	lsls r0, 3
	adds r0, r1
	ldrb r1, [r0, 0xA]
	lsls r2, r4, 8
	orrs r1, r2
	strh r1, [r0, 0xA]
	b _0806DF24
	.align 2, 0
_0806DED4: .4byte gTasks
_0806DED8:
	ldr r0, _0806DEF0 @ =gTasks
	lsls r1, r3, 2
	adds r1, r3
	lsls r1, 3
	adds r1, r0
	ldrh r2, [r1, 0xA]
	ldr r0, _0806DEF4 @ =0xffffff00
	ands r0, r2
	orrs r0, r4
	strh r0, [r1, 0xA]
	b _0806DF24
	.align 2, 0
_0806DEF0: .4byte gTasks
_0806DEF4: .4byte 0xffffff00
_0806DEF8:
	ldr r1, _0806DF0C @ =gTasks
	lsls r0, r3, 2
	adds r0, r3
	lsls r0, 3
	adds r0, r1
	ldrb r1, [r0, 0xC]
	lsls r2, r4, 8
	orrs r1, r2
	strh r1, [r0, 0xC]
	b _0806DF24
	.align 2, 0
_0806DF0C: .4byte gTasks
_0806DF10:
	ldr r0, _0806DF2C @ =gTasks
	lsls r1, r3, 2
	adds r1, r3
	lsls r1, 3
	adds r1, r0
	ldrh r2, [r1, 0xC]
	ldr r0, _0806DF30 @ =0xffffff00
	ands r0, r2
	orrs r0, r4
	strh r0, [r1, 0xC]
_0806DF24:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0806DF2C: .4byte gTasks
_0806DF30: .4byte 0xffffff00
	thumb_func_end SetMonIconSpriteId_maybe

	thumb_func_start GetHeldItemIconSpriteIdByMon_maybe
GetHeldItemIconSpriteIdByMon_maybe: @ 806DF34
	push {lr}
	lsls r0, 24
	lsrs r0, 24
	lsls r1, 24
	lsrs r1, 24
	bl GetMonIconSpriteId_maybe
	lsls r0, 24
	lsrs r0, 24
	ldr r2, _0806DF5C @ =gSprites
	lsls r1, r0, 4
	adds r1, r0
	lsls r1, 2
	adds r1, r2
	ldrh r0, [r1, 0x3C]
	lsls r0, 24
	lsrs r0, 24
	pop {r1}
	bx r1
	.align 2, 0
_0806DF5C: .4byte gSprites
	thumb_func_end GetHeldItemIconSpriteIdByMon_maybe

	thumb_func_start SetHeldItemIconVisibility
SetHeldItemIconVisibility: @ 806DF60
	push {r4-r6,lr}
	adds r4, r1, 0
	lsls r0, 24
	lsrs r0, 24
	lsls r4, 24
	lsrs r4, 24
	adds r1, r4, 0
	bl GetHeldItemIconSpriteIdByMon_maybe
	lsls r0, 24
	lsrs r5, r0, 24
	adds r6, r5, 0
	movs r0, 0x64
	adds r1, r4, 0
	muls r1, r0
	ldr r0, _0806DFA4 @ =gPlayerParty
	adds r4, r1, r0
	adds r0, r4, 0
	movs r1, 0xC
	bl GetMonData
	cmp r0, 0
	bne _0806DFAC
	ldr r1, _0806DFA8 @ =gSprites
	lsls r0, r5, 4
	adds r0, r5
	lsls r0, 2
	adds r0, r1
	adds r0, 0x3E
	ldrb r1, [r0]
	movs r2, 0x4
	orrs r1, r2
	strb r1, [r0]
	b _0806DFF6
	.align 2, 0
_0806DFA4: .4byte gPlayerParty
_0806DFA8: .4byte gSprites
_0806DFAC:
	adds r0, r4, 0
	movs r1, 0xC
	bl GetMonData
	lsls r0, 16
	lsrs r0, 16
	bl itemid_is_mail
	lsls r0, 24
	cmp r0, 0
	beq _0806DFD8
	lsls r4, r5, 4
	adds r4, r5
	lsls r4, 2
	ldr r0, _0806DFD4 @ =gSprites
	adds r4, r0
	adds r0, r4, 0
	movs r1, 0x1
	b _0806DFE6
	.align 2, 0
_0806DFD4: .4byte gSprites
_0806DFD8:
	lsls r4, r6, 4
	adds r4, r6
	lsls r4, 2
	ldr r0, _0806DFFC @ =gSprites
	adds r4, r0
	adds r0, r4, 0
	movs r1, 0
_0806DFE6:
	bl StartSpriteAnim
	adds r4, 0x3E
	ldrb r1, [r4]
	movs r0, 0x5
	negs r0, r0
	ands r0, r1
	strb r0, [r4]
_0806DFF6:
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_0806DFFC: .4byte gSprites
	thumb_func_end SetHeldItemIconVisibility

	thumb_func_start box_print
box_print: @ 806E000
	push {r4-r6,lr}
	sub sp, 0x4
	adds r4, r0, 0
	adds r6, r2, 0
	lsls r4, 24
	lsrs r4, 24
	movs r0, 0
	str r0, [sp]
	ldr r5, _0806E040 @ =gTileBuffer
	ldr r2, _0806E044 @ =0x01000100
	mov r0, sp
	adds r1, r5, 0
	bl CpuFastSet
	ldr r0, _0806E048 @ =gWindowConfig_81E6CAC
	adds r1, r5, 0
	adds r2, r6, 0
	bl sub_8004E3C
	lsls r4, 10
	ldr r0, _0806E04C @ =0x06014000
	adds r4, r0
	adds r0, r5, 0
	adds r1, r4, 0
	movs r2, 0x80
	bl CpuFastSet
	add sp, 0x4
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_0806E040: .4byte gTileBuffer
_0806E044: .4byte 0x01000100
_0806E048: .4byte gWindowConfig_81E6CAC
_0806E04C: .4byte 0x06014000
	thumb_func_end box_print

	thumb_func_start PrintPartyMenuMonNickname
PrintPartyMenuMonNickname: @ 806E050
	push {r4,r5,lr}
	sub sp, 0xC
	adds r4, r0, 0
	adds r5, r1, 0
	adds r0, r2, 0
	lsls r4, 24
	lsrs r4, 24
	lsls r5, 24
	lsrs r5, 24
	mov r1, sp
	bl GetMonNickname
	adds r0, r4, 0
	adds r1, r5, 0
	mov r2, sp
	bl box_print
	add sp, 0xC
	pop {r4,r5}
	pop {r0}
	bx r0
	thumb_func_end PrintPartyMenuMonNickname

	thumb_func_start TryPrintPartyMenuMonNickname
TryPrintPartyMenuMonNickname: @ 806E07C
	push {r4-r6,lr}
	adds r4, r1, 0
	lsls r0, 24
	lsrs r5, r0, 24
	adds r6, r5, 0
	adds r0, r4, 0
	movs r1, 0xB
	bl GetMonData
	cmp r0, 0
	beq _0806E0BC
	bl IsLinkDoubleBattle
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _0806E0AA
	adds r0, r5, 0
	movs r1, 0x2
	adds r2, r4, 0
	bl PrintPartyMenuMonNickname
	b _0806E0BC
_0806E0AA:
	bl IsDoubleBattle
	adds r1, r0, 0
	lsls r1, 24
	lsrs r1, 24
	adds r0, r6, 0
	adds r2, r4, 0
	bl PrintPartyMenuMonNickname
_0806E0BC:
	pop {r4-r6}
	pop {r0}
	bx r0
	thumb_func_end TryPrintPartyMenuMonNickname

	thumb_func_start PrintPartyMenuMonNicknames
PrintPartyMenuMonNicknames: @ 806E0C4
	push {r4-r6,lr}
	movs r4, 0
	movs r6, 0x64
	ldr r5, _0806E0E8 @ =gPlayerParty
_0806E0CC:
	adds r1, r4, 0
	muls r1, r6
	adds r1, r5
	adds r0, r4, 0
	bl TryPrintPartyMenuMonNickname
	adds r0, r4, 0x1
	lsls r0, 24
	lsrs r4, r0, 24
	cmp r4, 0x5
	bls _0806E0CC
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_0806E0E8: .4byte gPlayerParty
	thumb_func_end PrintPartyMenuMonNicknames

	thumb_func_start GetMonNickname
GetMonNickname: @ 806E0EC
	push {r4,lr}
	adds r4, r1, 0
	movs r1, 0x2
	adds r2, r4, 0
	bl GetMonData
	adds r0, r4, 0
	bl StringGetEnd10
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end GetMonNickname

	thumb_func_start PartyMenuPutStatusTilemap
PartyMenuPutStatusTilemap: @ 806E104
	push {r4,r5,lr}
	lsls r0, 24
	lsls r1, 24
	lsrs r1, 24
	ldr r4, _0806E15C @ =gUnknown_08376738
	lsrs r0, 22
	lsls r3, r1, 1
	adds r3, r1
	lsls r3, 3
	adds r0, r3
	adds r0, r4
	ldrb r1, [r0]
	subs r1, 0x1
	lsls r1, 24
	lsrs r1, 24
	ldrb r0, [r0, 0x1]
	adds r0, 0x1
	lsls r0, 24
	lsrs r0, 19
	adds r1, r0
	lsls r1, 1
	ldr r0, _0806E160 @ =0x0600f000
	adds r4, r1, r0
	lsls r2, 26
	lsrs r2, 24
	movs r3, 0
	movs r0, 0xC6
	lsls r0, 1
	adds r2, r0
	ldr r0, _0806E164 @ =0xffffb000
	adds r5, r0, 0
_0806E142:
	lsls r0, r3, 1
	adds r0, r4
	adds r1, r2, r3
	orrs r1, r5
	strh r1, [r0]
	adds r0, r3, 0x1
	lsls r0, 24
	lsrs r3, r0, 24
	cmp r3, 0x3
	bls _0806E142
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_0806E15C: .4byte gUnknown_08376738
_0806E160: .4byte 0x0600f000
_0806E164: .4byte 0xffffb000
	thumb_func_end PartyMenuPutStatusTilemap

	thumb_func_start PartyMenuClearLevelStatusTilemap
PartyMenuClearLevelStatusTilemap: @ 806E168
	push {r4,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	bl IsLinkDoubleBattle
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _0806E17E
	movs r3, 0x2
	b _0806E186
_0806E17E:
	bl IsDoubleBattle
	lsls r0, 24
	lsrs r3, r0, 24
_0806E186:
	ldr r1, _0806E1C8 @ =gUnknown_08376738
	lsls r2, r4, 2
	lsls r0, r3, 1
	adds r0, r3
	lsls r0, 3
	adds r2, r0
	adds r2, r1
	ldrb r1, [r2]
	subs r1, 0x1
	lsls r1, 24
	lsrs r1, 24
	ldrb r0, [r2, 0x1]
	adds r0, 0x1
	lsls r0, 24
	lsrs r0, 19
	adds r1, r0
	lsls r1, 1
	ldr r0, _0806E1CC @ =0x0600f000
	adds r1, r0
	movs r3, 0
	movs r2, 0
_0806E1B0:
	lsls r0, r3, 1
	adds r0, r1
	strh r2, [r0]
	adds r0, r3, 0x1
	lsls r0, 24
	lsrs r3, r0, 24
	cmp r3, 0x3
	bls _0806E1B0
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0806E1C8: .4byte gUnknown_08376738
_0806E1CC: .4byte 0x0600f000
	thumb_func_end PartyMenuClearLevelStatusTilemap

	thumb_func_start PartyMenuWriteTilemap
PartyMenuWriteTilemap: @ 806E1D0
	lsls r0, 24
	lsrs r0, 24
	lsls r1, 24
	lsrs r1, 24
	lsls r2, 24
	lsrs r2, 19
	adds r1, r2
	lsls r1, 1
	ldr r2, _0806E1F0 @ =0x0600f000
	adds r1, r2
	movs r2, 0x86
	lsls r2, 1
	adds r0, r2
	strh r0, [r1]
	bx lr
	.align 2, 0
_0806E1F0: .4byte 0x0600f000
	thumb_func_end PartyMenuWriteTilemap

	thumb_func_start PartyMenuDoPrintLevel
PartyMenuDoPrintLevel: @ 806E1F4
	push {r4-r6,lr}
	sub sp, 0x4
	adds r4, r0, 0
	adds r5, r2, 0
	lsls r4, 24
	lsrs r4, 24
	lsls r1, 24
	lsrs r1, 24
	lsls r5, 24
	lsrs r5, 24
	ldr r3, _0806E278 @ =gUnknown_08376738
	lsls r2, r4, 2
	lsls r0, r1, 1
	adds r0, r1
	lsls r0, 3
	adds r2, r0
	adds r2, r3
	ldrb r1, [r2]
	ldrb r2, [r2, 0x1]
	subs r1, 0x1
	lsls r1, 24
	lsrs r1, 24
	adds r2, 0x1
	lsls r2, 24
	lsrs r2, 24
	movs r0, 0x40
	bl PartyMenuWriteTilemap
	ldr r6, _0806E27C @ =gStringVar1
	movs r0, 0xFC
	strb r0, [r6]
	movs r0, 0x12
	strb r0, [r6, 0x1]
	movs r0, 0x8
	strb r0, [r6, 0x2]
	adds r0, r6, 0x3
	adds r1, r5, 0
	bl ConvertIntToDecimalString
	movs r0, 0
	str r0, [sp]
	ldr r5, _0806E280 @ =gUnknown_02039460
	ldr r2, _0806E284 @ =0x01000020
	mov r0, sp
	adds r1, r5, 0
	bl CpuFastSet
	ldr r0, _0806E288 @ =gWindowConfig_81E6CAC
	ldr r2, _0806E28C @ =0xffffff00
	adds r1, r5, r2
	adds r2, r6, 0
	bl sub_8004E3C
	lsls r4, 10
	ldr r0, _0806E290 @ =0x06014200
	adds r4, r0
	adds r0, r5, 0
	adds r1, r4, 0
	movs r2, 0x20
	bl CpuFastSet
	add sp, 0x4
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_0806E278: .4byte gUnknown_08376738
_0806E27C: .4byte gStringVar1
_0806E280: .4byte gUnknown_02039460
_0806E284: .4byte 0x01000020
_0806E288: .4byte gWindowConfig_81E6CAC
_0806E28C: .4byte 0xffffff00
_0806E290: .4byte 0x06014200
	thumb_func_end PartyMenuDoPrintLevel

	thumb_func_start PartyMenuPrintLevel
PartyMenuPrintLevel: @ 806E294
	push {r4,r5,lr}
	adds r4, r0, 0
	adds r5, r1, 0
	adds r0, r2, 0
	lsls r4, 24
	lsrs r4, 24
	lsls r5, 24
	lsrs r5, 24
	movs r1, 0x38
	bl GetMonData
	adds r2, r0, 0
	lsls r2, 24
	lsrs r2, 24
	adds r0, r4, 0
	adds r1, r5, 0
	bl PartyMenuDoPrintLevel
	pop {r4,r5}
	pop {r0}
	bx r0
	thumb_func_end PartyMenuPrintLevel

	thumb_func_start PartyMenuPrintMonLevelOrStatus
PartyMenuPrintMonLevelOrStatus: @ 806E2C0
	push {r4-r7,lr}
	adds r5, r1, 0
	lsls r0, 24
	lsrs r7, r0, 24
	adds r0, r5, 0
	movs r1, 0xB
	bl GetMonData
	cmp r0, 0
	beq _0806E32E
	adds r0, r5, 0
	movs r1, 0x2D
	bl GetMonData
	cmp r0, 0
	bne _0806E32E
	adds r0, r5, 0
	bl GetMonStatusAndPokerus
	lsls r0, 24
	lsrs r4, r0, 24
	bl IsLinkDoubleBattle
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _0806E2FA
	movs r6, 0x2
	b _0806E302
_0806E2FA:
	bl IsDoubleBattle
	lsls r0, 24
	lsrs r6, r0, 24
_0806E302:
	cmp r4, 0
	beq _0806E31A
	cmp r4, 0x6
	beq _0806E31A
	subs r2, r4, 0x1
	lsls r2, 24
	lsrs r2, 24
	adds r0, r7, 0
	adds r1, r6, 0
	bl PartyMenuPutStatusTilemap
	b _0806E324
_0806E31A:
	adds r0, r7, 0
	adds r1, r6, 0
	adds r2, r5, 0
	bl PartyMenuPrintLevel
_0806E324:
	adds r0, r7, 0
	adds r1, r6, 0
	adds r2, r5, 0
	bl PartyMenuPutNicknameTilemap
_0806E32E:
	pop {r4-r7}
	pop {r0}
	bx r0
	thumb_func_end PartyMenuPrintMonLevelOrStatus

	thumb_func_start PartyMenuPrintMonsLevelOrStatus
PartyMenuPrintMonsLevelOrStatus: @ 806E334
	push {r4-r6,lr}
	movs r4, 0
	movs r6, 0x64
	ldr r5, _0806E358 @ =gPlayerParty
_0806E33C:
	adds r1, r4, 0
	muls r1, r6
	adds r1, r5
	adds r0, r4, 0
	bl PartyMenuPrintMonLevelOrStatus
	adds r0, r4, 0x1
	lsls r0, 24
	lsrs r4, r0, 24
	cmp r4, 0x5
	bls _0806E33C
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_0806E358: .4byte gPlayerParty
	thumb_func_end PartyMenuPrintMonsLevelOrStatus

	thumb_func_start PartyMenuDoPutNicknameTilemap
PartyMenuDoPutNicknameTilemap: @ 806E35C
	push {r4-r7,lr}
	ldr r4, [sp, 0x14]
	lsls r0, 16
	lsrs r0, 16
	lsls r1, 24
	lsrs r7, r1, 24
	lsls r2, 24
	lsrs r5, r2, 24
	lsls r3, 24
	lsrs r6, r3, 24
	adds r1, r4, 0
	bl sub_8040D8C
	cmp r0, 0
	bne _0806E3BA
	ldr r2, _0806E3A4 @ =gUnknown_08376738
	lsls r1, r6, 2
	lsls r0, r5, 1
	adds r0, r5
	lsls r0, 3
	adds r1, r0
	adds r1, r2
	ldrb r0, [r1]
	adds r0, 0x3
	lsls r0, 24
	lsrs r3, r0, 24
	ldrb r0, [r1, 0x1]
	adds r0, 0x1
	lsls r0, 24
	lsrs r2, r0, 24
	cmp r7, 0
	beq _0806E3A8
	cmp r7, 0xFE
	beq _0806E3B2
	b _0806E3BA
	.align 2, 0
_0806E3A4: .4byte gUnknown_08376738
_0806E3A8:
	movs r0, 0x42
	adds r1, r3, 0
	bl PartyMenuWriteTilemap
	b _0806E3BA
_0806E3B2:
	movs r0, 0x44
	adds r1, r3, 0
	bl PartyMenuWriteTilemap
_0806E3BA:
	pop {r4-r7}
	pop {r0}
	bx r0
	thumb_func_end PartyMenuDoPutNicknameTilemap

	thumb_func_start PartyMenuPutNicknameTilemap
PartyMenuPutNicknameTilemap: @ 806E3C0
	push {r4-r6,lr}
	mov r6, r9
	mov r5, r8
	push {r5,r6}
	sub sp, 0x4
	mov r8, r0
	adds r6, r1, 0
	adds r5, r2, 0
	lsls r0, 24
	lsrs r0, 24
	mov r8, r0
	lsls r6, 24
	lsrs r6, 24
	ldr r0, _0806E41C @ =gStringVar1
	mov r9, r0
	adds r0, r5, 0
	mov r1, r9
	bl GetMonNickname
	adds r0, r5, 0
	movs r1, 0x41
	bl GetMonData
	adds r4, r0, 0
	lsls r4, 16
	lsrs r4, 16
	adds r0, r5, 0
	bl GetMonGender
	adds r1, r0, 0
	lsls r1, 24
	lsrs r1, 24
	mov r0, r9
	str r0, [sp]
	adds r0, r4, 0
	adds r2, r6, 0
	mov r3, r8
	bl PartyMenuDoPutNicknameTilemap
	add sp, 0x4
	pop {r3,r4}
	mov r8, r3
	mov r9, r4
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_0806E41C: .4byte gStringVar1
	thumb_func_end PartyMenuPutNicknameTilemap

	thumb_func_start PartyMenuDoPrintHP
PartyMenuDoPrintHP: @ 806E420
	push {r4,r5,lr}
	sub sp, 0x4
	adds r4, r0, 0
	adds r1, r2, 0
	adds r5, r3, 0
	lsls r4, 24
	lsrs r4, 24
	lsls r1, 16
	lsrs r1, 16
	lsls r5, 16
	lsrs r5, 16
	ldr r2, _0806E48C @ =gStringVar1
	adds r0, r2, 0
	movs r2, 0xF
	movs r3, 0x1
	bl sub_8072C14
	adds r2, r0, 0
	movs r0, 0xBA
	strb r0, [r2]
	adds r2, 0x1
	adds r0, r2, 0
	adds r1, r5, 0
	movs r2, 0x23
	movs r3, 0x1
	bl sub_8072C14
	movs r0, 0
	str r0, [sp]
	ldr r5, _0806E490 @ =gUnknown_02039460
	ldr r2, _0806E494 @ =0x01000040
	mov r0, sp
	adds r1, r5, 0
	bl CpuFastSet
	ldr r0, _0806E498 @ =gWindowConfig_81E6CAC
	ldr r2, _0806E49C @ =0xffffff00
	adds r1, r5, r2
	ldr r2, _0806E48C @ =gStringVar1
	bl sub_8004E3C
	lsls r4, 10
	ldr r0, _0806E4A0 @ =0x06014300
	adds r4, r0
	adds r0, r5, 0
	adds r1, r4, 0
	movs r2, 0x40
	bl CpuFastSet
	add sp, 0x4
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_0806E48C: .4byte gStringVar1
_0806E490: .4byte gUnknown_02039460
_0806E494: .4byte 0x01000040
_0806E498: .4byte gWindowConfig_81E6CAC
_0806E49C: .4byte 0xffffff00
_0806E4A0: .4byte 0x06014300
	thumb_func_end PartyMenuDoPrintHP

	thumb_func_start PartyMenuPrintHP
PartyMenuPrintHP: @ 806E4A4
	push {r4-r6,lr}
	mov r6, r8
	push {r6}
	adds r5, r0, 0
	adds r6, r1, 0
	mov r8, r2
	lsls r5, 24
	lsrs r5, 24
	lsls r6, 24
	lsrs r6, 24
	mov r0, r8
	movs r1, 0x39
	bl GetMonData
	adds r4, r0, 0
	lsls r4, 16
	lsrs r4, 16
	mov r0, r8
	movs r1, 0x3A
	bl GetMonData
	adds r3, r0, 0
	lsls r3, 16
	lsrs r3, 16
	adds r0, r5, 0
	adds r1, r6, 0
	adds r2, r4, 0
	bl PartyMenuDoPrintHP
	pop {r3}
	mov r8, r3
	pop {r4-r6}
	pop {r0}
	bx r0
	thumb_func_end PartyMenuPrintHP

	thumb_func_start PartyMenuTryPrintHP
PartyMenuTryPrintHP: @ 806E4E8
	push {r4-r6,lr}
	adds r4, r1, 0
	lsls r0, 24
	lsrs r5, r0, 24
	adds r6, r5, 0
	adds r0, r4, 0
	movs r1, 0xB
	bl GetMonData
	cmp r0, 0
	beq _0806E534
	adds r0, r4, 0
	movs r1, 0x2D
	bl GetMonData
	cmp r0, 0
	bne _0806E534
	bl IsLinkDoubleBattle
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _0806E522
	adds r0, r5, 0
	movs r1, 0x2
	adds r2, r4, 0
	bl PartyMenuPrintHP
	b _0806E534
_0806E522:
	bl IsDoubleBattle
	adds r1, r0, 0
	lsls r1, 24
	lsrs r1, 24
	adds r0, r6, 0
	adds r2, r4, 0
	bl PartyMenuPrintHP
_0806E534:
	pop {r4-r6}
	pop {r0}
	bx r0
	thumb_func_end PartyMenuTryPrintHP

	thumb_func_start PartyMenuTryPrintMonsHP
PartyMenuTryPrintMonsHP: @ 806E53C
	push {r4-r6,lr}
	movs r4, 0
	movs r6, 0x64
	ldr r5, _0806E560 @ =gPlayerParty
_0806E544:
	adds r1, r4, 0
	muls r1, r6
	adds r1, r5
	adds r0, r4, 0
	bl PartyMenuTryPrintHP
	adds r0, r4, 0x1
	lsls r0, 24
	lsrs r4, r0, 24
	cmp r4, 0x5
	bls _0806E544
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_0806E560: .4byte gPlayerParty
	thumb_func_end PartyMenuTryPrintMonsHP

	thumb_func_start unref_sub_806E564
unref_sub_806E564: @ 806E564
	bx lr
	thumb_func_end unref_sub_806E564

	thumb_func_start unref_sub_806E568
unref_sub_806E568: @ 806E568
	bx lr
	thumb_func_end unref_sub_806E568

	thumb_func_start nullsub_12
nullsub_12: @ 806E56C
	bx lr
	thumb_func_end nullsub_12

	thumb_func_start nullsub_13
nullsub_13: @ 806E570
	bx lr
	thumb_func_end nullsub_13

	thumb_func_start PartyMenuDoDrawHPBar
PartyMenuDoDrawHPBar: @ 806E574
	push {r4-r6,lr}
	sub sp, 0x18
	lsls r0, 24
	lsrs r6, r0, 24
	lsls r1, 24
	lsrs r5, r1, 24
	lsls r2, 16
	lsrs r2, 16
	lsls r3, 16
	lsrs r3, 16
	ldr r0, _0806E624 @ =0xffff8000
	str r0, [sp, 0x14]
	str r3, [sp]
	str r2, [sp, 0x4]
	movs r0, 0
	str r0, [sp, 0x8]
	lsls r2, 16
	asrs r2, 16
	lsls r3, 16
	asrs r3, 16
	adds r0, r2, 0
	adds r1, r3, 0
	bl GetHPBarLevel
	lsls r0, 24
	lsrs r3, r0, 24
	adds r4, r3, 0
	cmp r3, 0x2
	bls _0806E5BE
	mov r2, sp
	ldrb r1, [r2, 0xC]
	movs r0, 0x20
	negs r0, r0
	ands r0, r1
	movs r1, 0x4
	orrs r0, r1
	strb r0, [r2, 0xC]
_0806E5BE:
	cmp r3, 0x2
	bne _0806E5D2
	mov r2, sp
	ldrb r1, [r2, 0xC]
	movs r0, 0x20
	negs r0, r0
	ands r0, r1
	movs r1, 0x5
	orrs r0, r1
	strb r0, [r2, 0xC]
_0806E5D2:
	cmp r4, 0x1
	bhi _0806E5E6
	mov r2, sp
	ldrb r1, [r2, 0xC]
	movs r0, 0x20
	negs r0, r0
	ands r0, r1
	movs r1, 0x6
	orrs r0, r1
	strb r0, [r2, 0xC]
_0806E5E6:
	movs r0, 0x80
	lsls r0, 1
	str r0, [sp, 0x10]
	ldr r2, _0806E628 @ =gUnknown_08376858
	lsls r1, r6, 2
	lsls r0, r5, 1
	adds r0, r5
	lsls r0, 3
	adds r1, r0
	adds r1, r2
	ldr r4, [r1]
	add r1, sp, 0x14
	mov r0, sp
	adds r2, r4, 0
	movs r3, 0
	bl sub_80460C8
	subs r4, 0x4
	ldr r1, _0806E62C @ =0x00003109
	adds r0, r1, 0
	strh r0, [r4]
	adds r1, 0x1
	adds r0, r1, 0
	strh r0, [r4, 0x2]
	adds r1, 0x1
	adds r0, r1, 0
	strh r0, [r4, 0x10]
	add sp, 0x18
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_0806E624: .4byte 0xffff8000
_0806E628: .4byte gUnknown_08376858
_0806E62C: .4byte 0x00003109
	thumb_func_end PartyMenuDoDrawHPBar

	thumb_func_start PartyMenuDrawHPBar
PartyMenuDrawHPBar: @ 806E630
	push {r4-r6,lr}
	mov r6, r8
	push {r6}
	adds r5, r0, 0
	adds r6, r1, 0
	mov r8, r2
	lsls r5, 24
	lsrs r5, 24
	lsls r6, 24
	lsrs r6, 24
	mov r0, r8
	movs r1, 0x39
	bl GetMonData
	adds r4, r0, 0
	lsls r4, 16
	lsrs r4, 16
	mov r0, r8
	movs r1, 0x3A
	bl GetMonData
	adds r3, r0, 0
	lsls r3, 16
	lsrs r3, 16
	adds r0, r5, 0
	adds r1, r6, 0
	adds r2, r4, 0
	bl PartyMenuDoDrawHPBar
	pop {r3}
	mov r8, r3
	pop {r4-r6}
	pop {r0}
	bx r0
	thumb_func_end PartyMenuDrawHPBar

	thumb_func_start PartyMenuTryDrawHPBar
PartyMenuTryDrawHPBar: @ 806E674
	push {r4-r6,lr}
	adds r4, r1, 0
	lsls r0, 24
	lsrs r5, r0, 24
	adds r6, r5, 0
	adds r0, r4, 0
	movs r1, 0xB
	bl GetMonData
	cmp r0, 0
	beq _0806E6C0
	adds r0, r4, 0
	movs r1, 0x2D
	bl GetMonData
	cmp r0, 0
	bne _0806E6C0
	bl IsLinkDoubleBattle
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _0806E6AE
	adds r0, r5, 0
	movs r1, 0x2
	adds r2, r4, 0
	bl PartyMenuDrawHPBar
	b _0806E6C0
_0806E6AE:
	bl IsDoubleBattle
	adds r1, r0, 0
	lsls r1, 24
	lsrs r1, 24
	adds r0, r6, 0
	adds r2, r4, 0
	bl PartyMenuDrawHPBar
_0806E6C0:
	pop {r4-r6}
	pop {r0}
	bx r0
	thumb_func_end PartyMenuTryDrawHPBar

	thumb_func_start PartyMenuDrawHPBars
PartyMenuDrawHPBars: @ 806E6C8
	push {r4-r6,lr}
	movs r4, 0
	movs r6, 0x64
	ldr r5, _0806E6EC @ =gPlayerParty
_0806E6D0:
	adds r1, r4, 0
	muls r1, r6
	adds r1, r5
	adds r0, r4, 0
	bl PartyMenuTryDrawHPBar
	adds r0, r4, 0x1
	lsls r0, 24
	lsrs r4, r0, 24
	cmp r4, 0x5
	bls _0806E6D0
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_0806E6EC: .4byte gPlayerParty
	thumb_func_end PartyMenuDrawHPBars

	thumb_func_start sub_806E6F0
sub_806E6F0: @ 806E6F0
	push {r4,r5,lr}
	sub sp, 0x64
	adds r4, r0, 0
	adds r5, r1, 0
	mov r0, sp
	adds r1, r4, 0
	movs r2, 0x64
	bl memcpy
	adds r0, r4, 0
	adds r1, r5, 0
	movs r2, 0x64
	bl memcpy
	adds r0, r5, 0
	mov r1, sp
	movs r2, 0x64
	bl memcpy
	add sp, 0x64
	pop {r4,r5}
	pop {r0}
	bx r0
	thumb_func_end sub_806E6F0

	thumb_func_start sub_806E720
sub_806E720: @ 806E720
	push {r4,lr}
	lsls r0, 24
	lsrs r0, 21
	adds r0, r3
	ldrb r4, [r0]
	lsls r4, 25
	movs r3, 0x80
	lsls r3, 18
	adds r4, r3
	lsrs r4, 24
	ldrb r0, [r0, 0x1]
	adds r0, 0x1
	lsls r0, 24
	lsrs r0, 24
	movs r3, 0x1E
	subs r3, r0
	strb r3, [r1]
	movs r0, 0x14
	subs r0, r4
	strb r0, [r2]
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end sub_806E720

	thumb_func_start sub_806E750
sub_806E750: @ 806E750
	push {r4-r6,lr}
	mov r6, r9
	mov r5, r8
	push {r5,r6}
	sub sp, 0xC
	adds r5, r0, 0
	adds r4, r1, 0
	mov r9, r2
	adds r6, r3, 0
	lsls r5, 24
	lsrs r5, 24
	lsls r6, 24
	lsrs r6, 24
	movs r0, 0x9
	add r0, sp
	mov r8, r0
	adds r0, r5, 0
	add r1, sp, 0x8
	mov r2, r8
	adds r3, r4, 0
	bl sub_806E720
	add r0, sp, 0x8
	ldrb r0, [r0]
	mov r2, r8
	ldrb r1, [r2]
	lsls r5, 3
	adds r5, r4
	ldrb r2, [r5, 0x1]
	ldrb r3, [r5]
	mov r4, r9
	str r4, [sp]
	ldr r4, [r5, 0x4]
	str r4, [sp, 0x4]
	bl sub_8089C50
	add r0, sp, 0x8
	ldrb r1, [r0]
	adds r1, 0x1
	lsls r1, 24
	lsrs r1, 24
	mov r0, r8
	ldrb r2, [r0]
	adds r2, 0x1
	lsls r2, 24
	lsrs r2, 24
	ldrb r3, [r5]
	str r6, [sp]
	ldrb r0, [r5, 0x1]
	subs r0, 0x1
	lsls r0, 24
	lsrs r0, 24
	str r0, [sp, 0x4]
	movs r0, 0
	bl InitMenu
	add sp, 0xC
	pop {r3,r4}
	mov r8, r3
	mov r9, r4
	pop {r4-r6}
	pop {r0}
	bx r0
	thumb_func_end sub_806E750

	thumb_func_start sub_806E7D0
sub_806E7D0: @ 806E7D0
	push {r4-r6,lr}
	sub sp, 0x4
	adds r4, r0, 0
	adds r6, r1, 0
	lsls r4, 24
	lsrs r4, 24
	mov r5, sp
	adds r5, 0x1
	adds r0, r4, 0
	mov r1, sp
	adds r2, r5, 0
	adds r3, r6, 0
	bl sub_806E720
	mov r0, sp
	ldrb r0, [r0]
	ldrb r1, [r5]
	lsls r4, 3
	adds r4, r6
	ldrb r2, [r4, 0x1]
	adds r2, r0, r2
	lsls r2, 24
	lsrs r2, 24
	ldrb r3, [r4]
	lsls r3, 1
	adds r3, r1, r3
	adds r3, 0x1
	lsls r3, 24
	lsrs r3, 24
	bl MenuZeroFillWindowRect
	bl sub_8072DEC
	add sp, 0x4
	pop {r4-r6}
	pop {r0}
	bx r0
	thumb_func_end sub_806E7D0

	thumb_func_start sub_806E81C
sub_806E81C: @ 806E81C
	lsls r0, 24
	lsls r3, 24
	lsrs r3, 24
	lsrs r0, 21
	adds r0, r1
	ldr r0, [r0, 0x4]
	adds r0, r3
	ldrb r0, [r0]
	lsls r0, 3
	adds r0, r2
	ldr r0, [r0, 0x4]
	bx lr
	thumb_func_end sub_806E81C

    .section .text_806E884



	thumb_func_start sub_806E8D0
sub_806E8D0: @ 806E8D0
	push {r4,r5,lr}
	adds r5, r1, 0
	lsls r0, 24
	lsrs r0, 24
	lsls r5, 16
	lsrs r5, 16
	ldr r4, _0806E8FC @ =0x0201c000
	str r2, [r4, 0x10]
	strb r0, [r4, 0x4]
	bl sub_806CA38
	strb r0, [r4, 0x5]
	strh r5, [r4, 0x6]
	ldrb r1, [r4, 0x5]
	movs r0, 0x64
	muls r0, r1
	ldr r1, _0806E900 @ =gPlayerParty
	adds r0, r1
	str r0, [r4]
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_0806E8FC: .4byte 0x0201c000
_0806E900: .4byte gPlayerParty
	thumb_func_end sub_806E8D0

	thumb_func_start PartyMenuUpdateMonHeldItem
PartyMenuUpdateMonHeldItem: @ 806E904
	push {r4,r5,lr}
	sub sp, 0x4
	adds r5, r0, 0
	lsls r1, 16
	lsrs r4, r1, 16
	adds r0, r4, 0
	bl itemid_is_mail
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _0806E93C
	adds r0, r5, 0
	adds r1, r4, 0
	bl sub_80A2BC4
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0xFF
	bne _0806E930
	movs r0, 0x1
	b _0806E958
_0806E930:
	ldr r1, _0806E938 @ =gUnknown_0202E8F4
	movs r0, 0x2
	b _0806E940
	.align 2, 0
_0806E938: .4byte gUnknown_0202E8F4
_0806E93C:
	ldr r1, _0806E960 @ =gUnknown_0202E8F4
	movs r0, 0x1
_0806E940:
	strb r0, [r1]
	mov r0, sp
	strb r4, [r0]
	mov r1, sp
	lsrs r0, r4, 8
	strb r0, [r1, 0x1]
	adds r0, r5, 0
	movs r1, 0xC
	mov r2, sp
	bl SetMonData
	movs r0, 0
_0806E958:
	add sp, 0x4
	pop {r4,r5}
	pop {r1}
	bx r1
	.align 2, 0
_0806E960: .4byte gUnknown_0202E8F4
	thumb_func_end PartyMenuUpdateMonHeldItem

	thumb_func_start PartyMenuTryGiveMonHeldItem
PartyMenuTryGiveMonHeldItem: @ 806E964
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	mov r8, r2
	lsls r0, 24
	lsrs r0, 24
	lsls r1, 16
	lsrs r5, r1, 16
	mov r9, r5
	ldr r2, _0806E9D4 @ =gTasks
	lsls r1, r0, 2
	adds r1, r0
	lsls r1, 3
	adds r6, r1, r2
	ldr r1, _0806E9D8 @ =TaskDummy
	str r1, [r6]
	adds r1, r5, 0
	mov r2, r8
	bl sub_806E8D0
	ldr r4, _0806E9DC @ =0x0201c000
	ldr r0, [r4]
	movs r1, 0xC
	bl GetMonData
	lsls r0, 16
	lsrs r2, r0, 16
	adds r7, r2, 0
	ldr r1, _0806E9E0 @ =gUnknown_0202E8F4
	movs r0, 0
	strb r0, [r1]
	ldr r0, _0806E9E4 @ =gUnknown_0202E8F8
	mov r10, r0
	movs r0, 0
	mov r1, r10
	strh r0, [r1]
	cmp r2, 0
	beq _0806EA44
	adds r0, r2, 0
	bl itemid_is_mail
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _0806E9F0
	ldr r0, _0806E9E8 @ =gOtherText_MailMustBeRemoved
	movs r1, 0x1
	bl sub_806E834
	ldr r0, _0806E9EC @ =party_menu_link_mon_held_item_object
	movs r1, 0x5
	bl CreateTask
	b _0806EA78
	.align 2, 0
_0806E9D4: .4byte gTasks
_0806E9D8: .4byte TaskDummy
_0806E9DC: .4byte 0x0201c000
_0806E9E0: .4byte gUnknown_0202E8F4
_0806E9E4: .4byte gUnknown_0202E8F8
_0806E9E8: .4byte gOtherText_MailMustBeRemoved
_0806E9EC: .4byte party_menu_link_mon_held_item_object
_0806E9F0:
	ldr r0, [r4]
	ldr r1, _0806EA30 @ =gStringVar1
	bl GetMonNickname
	ldr r1, _0806EA34 @ =gStringVar2
	adds r0, r7, 0
	bl CopyItemName
	ldr r4, _0806EA38 @ =gStringVar4
	ldr r1, _0806EA3C @ =gOtherText_AlreadyHolding
	adds r0, r4, 0
	bl StringExpandPlaceholders
	adds r0, r4, 0
	movs r1, 0x1
	bl sub_806E834
	ldr r0, _0806EA40 @ =Task_ConfirmGiveHeldItem
	movs r1, 0x5
	bl CreateTask
	adds r0, r5, 0
	bl itemid_is_mail
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _0806EA78
	mov r0, r10
	strh r7, [r0]
	b _0806EA78
	.align 2, 0
_0806EA30: .4byte gStringVar1
_0806EA34: .4byte gStringVar2
_0806EA38: .4byte gStringVar4
_0806EA3C: .4byte gOtherText_AlreadyHolding
_0806EA40: .4byte Task_ConfirmGiveHeldItem
_0806EA44:
	ldr r0, [r4]
	adds r1, r5, 0
	bl PartyMenuUpdateMonHeldItem
	adds r0, r5, 0
	movs r1, 0x1
	bl RemoveBagItem
	adds r0, r5, 0
	bl itemid_is_mail
	lsls r0, 24
	cmp r0, 0
	beq _0806EA66
	mov r1, r8
	str r1, [r6]
	b _0806EA78
_0806EA66:
	ldrb r0, [r4, 0x5]
	mov r1, r9
	movs r2, 0x1
	bl DisplayGiveHeldItemMessage
	ldr r0, _0806EA88 @ =party_menu_link_mon_held_item_object
	movs r1, 0x5
	bl CreateTask
_0806EA78:
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_0806EA88: .4byte party_menu_link_mon_held_item_object
	thumb_func_end PartyMenuTryGiveMonHeldItem

	thumb_func_start party_menu_link_mon_held_item_object
party_menu_link_mon_held_item_object: @ 806EA8C
	push {r4,r5,lr}
	lsls r0, 24
	lsrs r5, r0, 24
	ldr r0, _0806EAC0 @ =gUnknown_0202E8F6
	ldrb r0, [r0]
	cmp r0, 0
	bne _0806EABA
	ldr r4, _0806EAC4 @ =0x0201c000
	ldrb r0, [r4, 0x4]
	ldrb r1, [r4, 0x5]
	bl SetHeldItemIconVisibility
	ldr r2, _0806EAC8 @ =gTasks
	ldrb r1, [r4, 0x4]
	lsls r0, r1, 2
	adds r0, r1
	lsls r0, 3
	adds r0, r2
	ldr r1, [r4, 0x10]
	str r1, [r0]
	adds r0, r5, 0
	bl DestroyTask
_0806EABA:
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_0806EAC0: .4byte gUnknown_0202E8F6
_0806EAC4: .4byte 0x0201c000
_0806EAC8: .4byte gTasks
	thumb_func_end party_menu_link_mon_held_item_object

	thumb_func_start PartyMenuTryGiveMonHeldItem_806EACC
PartyMenuTryGiveMonHeldItem_806EACC: @ 806EACC
	push {r4-r6,lr}
	lsls r0, 24
	lsrs r6, r0, 24
	bl ProcessMenuInputNoWrap_
	lsls r0, 24
	asrs r1, r0, 24
	cmp r1, 0
	bne _0806EB74
	movs r0, 0x17
	movs r1, 0x8
	movs r2, 0x1D
	movs r3, 0xD
	bl MenuZeroFillWindowRect
	ldr r4, _0806EB30 @ =0x0201c000
	ldr r0, [r4]
	movs r1, 0xC
	bl GetMonData
	lsls r0, 16
	lsrs r5, r0, 16
	ldrh r0, [r4, 0x6]
	movs r1, 0x1
	bl RemoveBagItem
	adds r0, r5, 0
	movs r1, 0x1
	bl AddBagItem
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _0806EB5C
	ldr r0, [r4]
	ldrh r1, [r4, 0x6]
	bl PartyMenuUpdateMonHeldItem
	ldrh r0, [r4, 0x6]
	bl itemid_is_mail
	lsls r0, 24
	cmp r0, 0
	beq _0806EB34
	ldrb r0, [r4, 0x5]
	adds r1, r5, 0
	movs r2, 0x1
	bl DisplayTakeHeldItemMessage
	b _0806EB9A
	.align 2, 0
_0806EB30: .4byte 0x0201c000
_0806EB34:
	ldrh r0, [r4, 0x6]
	ldr r1, _0806EB50 @ =gStringVar1
	bl CopyItemName
	ldr r4, _0806EB54 @ =gStringVar4
	ldr r1, _0806EB58 @ =gOtherText_TakenAndReplaced
	adds r0, r4, 0
	bl StringExpandPlaceholders
	adds r0, r4, 0
	movs r1, 0x1
	bl sub_806E834
	b _0806EB9A
	.align 2, 0
_0806EB50: .4byte gStringVar1
_0806EB54: .4byte gStringVar4
_0806EB58: .4byte gOtherText_TakenAndReplaced
_0806EB5C:
	ldr r0, _0806EB70 @ =gOtherText_BagFullCannotRemoveItem
	movs r1, 0
	bl sub_806E834
	ldrh r0, [r4, 0x6]
	movs r1, 0x1
	bl AddBagItem
	b _0806EB9A
	.align 2, 0
_0806EB70: .4byte gOtherText_BagFullCannotRemoveItem
_0806EB74:
	cmp r1, 0x1
	beq _0806EB80
	movs r0, 0x1
	negs r0, r0
	cmp r1, r0
	bne _0806EBA8
_0806EB80:
	movs r0, 0x1
	negs r0, r0
	cmp r1, r0
	bne _0806EB8E
	movs r0, 0x5
	bl PlaySE
_0806EB8E:
	movs r0, 0x17
	movs r1, 0x8
	movs r2, 0x1D
	movs r3, 0xD
	bl MenuZeroFillWindowRect
_0806EB9A:
	ldr r0, _0806EBB0 @ =gTasks
	lsls r1, r6, 2
	adds r1, r6
	lsls r1, 3
	adds r1, r0
	ldr r0, _0806EBB4 @ =party_menu_link_mon_held_item_object
	str r0, [r1]
_0806EBA8:
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_0806EBB0: .4byte gTasks
_0806EBB4: .4byte party_menu_link_mon_held_item_object
	thumb_func_end PartyMenuTryGiveMonHeldItem_806EACC

	thumb_func_start Task_ConfirmGiveHeldItem
Task_ConfirmGiveHeldItem: @ 806EBB8
	push {r4,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	ldr r0, _0806EBE4 @ =gUnknown_0202E8F6
	ldrb r0, [r0]
	cmp r0, 0
	bne _0806EBDE
	movs r0, 0x17
	movs r1, 0x8
	movs r2, 0x1
	bl DisplayYesNoMenu
	ldr r0, _0806EBE8 @ =gTasks
	lsls r1, r4, 2
	adds r1, r4
	lsls r1, 3
	adds r1, r0
	ldr r0, _0806EBEC @ =PartyMenuTryGiveMonHeldItem_806EACC
	str r0, [r1]
_0806EBDE:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0806EBE4: .4byte gUnknown_0202E8F6
_0806EBE8: .4byte gTasks
_0806EBEC: .4byte PartyMenuTryGiveMonHeldItem_806EACC
	thumb_func_end Task_ConfirmGiveHeldItem

	thumb_func_start DisplayGiveHeldItemMessage
DisplayGiveHeldItemMessage: @ 806EBF0
	push {r4,r5,lr}
	adds r4, r1, 0
	adds r5, r2, 0
	lsls r0, 24
	lsrs r0, 24
	lsls r4, 16
	lsrs r4, 16
	lsls r5, 24
	lsrs r5, 24
	movs r1, 0x64
	muls r0, r1
	ldr r1, _0806EC30 @ =gPlayerParty
	adds r0, r1
	ldr r1, _0806EC34 @ =gStringVar1
	bl GetMonNickname
	ldr r1, _0806EC38 @ =gStringVar2
	adds r0, r4, 0
	bl CopyItemName
	ldr r4, _0806EC3C @ =gStringVar4
	ldr r1, _0806EC40 @ =gOtherText_WasGivenToHold
	adds r0, r4, 0
	bl StringExpandPlaceholders
	adds r0, r4, 0
	adds r1, r5, 0
	bl sub_806E834
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_0806EC30: .4byte gPlayerParty
_0806EC34: .4byte gStringVar1
_0806EC38: .4byte gStringVar2
_0806EC3C: .4byte gStringVar4
_0806EC40: .4byte gOtherText_WasGivenToHold
	thumb_func_end DisplayGiveHeldItemMessage

	thumb_func_start PartyMenuTryGiveMonMail
PartyMenuTryGiveMonMail: @ 806EC44
	push {r4,r5,lr}
	adds r2, r1, 0
	lsls r0, 24
	lsrs r0, 24
	ldr r3, _0806ECA0 @ =gTasks
	lsls r1, r0, 2
	adds r1, r0
	lsls r1, 3
	adds r1, r3
	ldr r3, _0806ECA4 @ =TaskDummy
	str r3, [r1]
	movs r1, 0
	bl sub_806E8D0
	ldr r5, _0806ECA8 @ =0x0201c000
	ldr r0, [r5]
	movs r1, 0xC
	bl GetMonData
	lsls r0, 16
	ldr r2, _0806ECAC @ =gUnknown_0202E8F4
	movs r1, 0
	strb r1, [r2]
	movs r1, 0xF8
	lsls r1, 6
	adds r2, r5, r1
	ldrb r1, [r2]
	adds r1, 0x6
	ldrb r2, [r2, 0x2]
	adds r1, r2
	lsls r2, r1, 3
	adds r2, r1
	lsls r2, 2
	ldr r1, _0806ECB0 @ =gSaveBlock1 + 0x2B4C
	adds r4, r2, r1
	cmp r0, 0
	beq _0806ECBC
	ldr r0, _0806ECB4 @ =gOtherText_PokeHoldingItemCantMail
	movs r1, 0x1
	bl sub_806E834
	ldr r0, _0806ECB8 @ =party_menu_link_mon_held_item_object
	movs r1, 0x5
	bl CreateTask
	b _0806ECDA
	.align 2, 0
_0806ECA0: .4byte gTasks
_0806ECA4: .4byte TaskDummy
_0806ECA8: .4byte 0x0201c000
_0806ECAC: .4byte gUnknown_0202E8F4
_0806ECB0: .4byte gSaveBlock1 + 0x2B4C
_0806ECB4: .4byte gOtherText_PokeHoldingItemCantMail
_0806ECB8: .4byte party_menu_link_mon_held_item_object
_0806ECBC:
	ldr r0, [r5]
	adds r1, r4, 0
	bl sub_80A2D88
	adds r0, r4, 0
	bl sub_80A2B40
	ldr r0, _0806ECE0 @ =gOtherText_MailTransferredMailbox
	movs r1, 0x1
	bl sub_806E834
	ldr r0, _0806ECE4 @ =party_menu_link_mon_held_item_object
	movs r1, 0x5
	bl CreateTask
_0806ECDA:
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_0806ECE0: .4byte gOtherText_MailTransferredMailbox
_0806ECE4: .4byte party_menu_link_mon_held_item_object
	thumb_func_end PartyMenuTryGiveMonMail

	thumb_func_start PartyMenuTryGiveMonHeldItem_806ECE8
PartyMenuTryGiveMonHeldItem_806ECE8: @ 806ECE8
	push {r4-r6,lr}
	sub sp, 0x4
	adds r2, r1, 0
	lsls r0, 24
	lsrs r0, 24
	ldr r3, _0806ED38 @ =gTasks
	lsls r1, r0, 2
	adds r1, r0
	lsls r1, 3
	adds r1, r3
	ldr r3, _0806ED3C @ =TaskDummy
	str r3, [r1]
	movs r1, 0
	bl sub_806E8D0
	ldr r5, _0806ED40 @ =0x0201c000
	ldr r0, [r5]
	movs r1, 0xC
	bl GetMonData
	lsls r0, 16
	lsrs r4, r0, 16
	adds r6, r4, 0
	cmp r4, 0
	bne _0806ED50
	ldr r4, _0806ED44 @ =gStringVar4
	ldr r1, _0806ED48 @ =gOtherText_NotHoldingAnything
	adds r0, r4, 0
	bl StringExpandPlaceholders
	adds r0, r4, 0
	movs r1, 0
	bl sub_806E834
	ldr r0, _0806ED4C @ =party_menu_link_mon_held_item_object
	movs r1, 0x5
	bl CreateTask
	b _0806EDA2
	.align 2, 0
_0806ED38: .4byte gTasks
_0806ED3C: .4byte TaskDummy
_0806ED40: .4byte 0x0201c000
_0806ED44: .4byte gStringVar4
_0806ED48: .4byte gOtherText_NotHoldingAnything
_0806ED4C: .4byte party_menu_link_mon_held_item_object
_0806ED50:
	mov r0, sp
	movs r1, 0
	strb r1, [r0]
	strb r1, [r0, 0x1]
	adds r0, r4, 0
	movs r1, 0x1
	bl AddBagItem
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _0806ED92
	adds r0, r4, 0
	bl itemid_is_mail
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _0806ED7C
	ldr r0, [r5]
	bl sub_80A2DF8
_0806ED7C:
	ldrb r0, [r5, 0x5]
	adds r1, r6, 0
	movs r2, 0
	bl DisplayTakeHeldItemMessage
	ldr r0, [r5]
	movs r1, 0xC
	mov r2, sp
	bl SetMonData
	b _0806ED9A
_0806ED92:
	ldr r0, _0806EDAC @ =gOtherText_BagFullCannotRemoveItem
	movs r1, 0
	bl sub_806E834
_0806ED9A:
	ldr r0, _0806EDB0 @ =party_menu_link_mon_held_item_object
	movs r1, 0x5
	bl CreateTask
_0806EDA2:
	add sp, 0x4
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_0806EDAC: .4byte gOtherText_BagFullCannotRemoveItem
_0806EDB0: .4byte party_menu_link_mon_held_item_object
	thumb_func_end PartyMenuTryGiveMonHeldItem_806ECE8

	thumb_func_start DisplayTakeHeldItemMessage
DisplayTakeHeldItemMessage: @ 806EDB4
	push {r4,r5,lr}
	adds r4, r1, 0
	adds r5, r2, 0
	lsls r0, 24
	lsrs r0, 24
	lsls r4, 16
	lsrs r4, 16
	lsls r5, 24
	lsrs r5, 24
	movs r1, 0x64
	muls r0, r1
	ldr r1, _0806EDF4 @ =gPlayerParty
	adds r0, r1
	ldr r1, _0806EDF8 @ =gStringVar1
	bl GetMonNickname
	ldr r1, _0806EDFC @ =gStringVar2
	adds r0, r4, 0
	bl CopyItemName
	ldr r4, _0806EE00 @ =gStringVar4
	ldr r1, _0806EE04 @ =gOtherText_ReceivedTheThingFrom
	adds r0, r4, 0
	bl StringExpandPlaceholders
	adds r0, r4, 0
	adds r1, r5, 0
	bl sub_806E834
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_0806EDF4: .4byte gPlayerParty
_0806EDF8: .4byte gStringVar1
_0806EDFC: .4byte gStringVar2
_0806EE00: .4byte gStringVar4
_0806EE04: .4byte gOtherText_ReceivedTheThingFrom
	thumb_func_end DisplayTakeHeldItemMessage

	thumb_func_start DoTakeMail
DoTakeMail: @ 806EE08
	push {r4,lr}
	adds r2, r1, 0
	lsls r0, 24
	lsrs r0, 24
	ldr r3, _0806EE48 @ =gTasks
	lsls r1, r0, 2
	adds r1, r0
	lsls r1, 3
	adds r1, r3
	ldr r3, _0806EE4C @ =TaskDummy
	str r3, [r1]
	movs r1, 0
	bl sub_806E8D0
	ldr r4, _0806EE50 @ =0x0201c000
	ldr r0, [r4]
	movs r1, 0xC
	bl GetMonData
	strh r0, [r4, 0x6]
	ldr r0, _0806EE54 @ =gOtherText_SendRemovedMailPrompt
	movs r1, 0x1
	bl sub_806E834
	ldr r0, _0806EE58 @ =Task_ConfirmTakeHeldMail
	movs r1, 0x5
	bl CreateTask
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0806EE48: .4byte gTasks
_0806EE4C: .4byte TaskDummy
_0806EE50: .4byte 0x0201c000
_0806EE54: .4byte gOtherText_SendRemovedMailPrompt
_0806EE58: .4byte Task_ConfirmTakeHeldMail
	thumb_func_end DoTakeMail

	thumb_func_start Task_LoseMailMessage
Task_LoseMailMessage: @ 806EE5C
	push {r4,r5,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	bl ProcessMenuInputNoWrap_
	lsls r0, 24
	asrs r1, r0, 24
	cmp r1, 0
	bne _0806EEB0
	ldr r5, _0806EE90 @ =0x0201c000
	ldrh r0, [r5, 0x6]
	movs r1, 0x1
	bl AddBagItem
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _0806EE98
	ldr r0, [r5]
	bl sub_80A2DF8
	ldr r0, _0806EE94 @ =gOtherText_MailTaken
	movs r1, 0
	bl sub_806E834
	b _0806EEA0
	.align 2, 0
_0806EE90: .4byte 0x0201c000
_0806EE94: .4byte gOtherText_MailTaken
_0806EE98:
	ldr r0, _0806EEAC @ =gOtherText_BagFullCannotRemoveItem
	movs r1, 0
	bl sub_806E834
_0806EEA0:
	movs r0, 0x17
	movs r1, 0x8
	movs r2, 0x1D
	movs r3, 0xD
	b _0806EEDE
	.align 2, 0
_0806EEAC: .4byte gOtherText_BagFullCannotRemoveItem
_0806EEB0:
	cmp r1, 0x1
	beq _0806EEBC
	movs r0, 0x1
	negs r0, r0
	cmp r1, r0
	bne _0806EEF0
_0806EEBC:
	movs r0, 0x1
	negs r0, r0
	cmp r1, r0
	bne _0806EECA
	movs r0, 0x5
	bl PlaySE
_0806EECA:
	movs r0, 0x17
	movs r1, 0x8
	movs r2, 0x1D
	movs r3, 0xD
	bl MenuZeroFillWindowRect
	movs r0, 0
	movs r1, 0xE
	movs r2, 0x1D
	movs r3, 0x13
_0806EEDE:
	bl MenuZeroFillWindowRect
	ldr r0, _0806EEF8 @ =gTasks
	lsls r1, r4, 2
	adds r1, r4
	lsls r1, 3
	adds r1, r0
	ldr r0, _0806EEFC @ =party_menu_link_mon_held_item_object
	str r0, [r1]
_0806EEF0:
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_0806EEF8: .4byte gTasks
_0806EEFC: .4byte party_menu_link_mon_held_item_object
	thumb_func_end Task_LoseMailMessage

	thumb_func_start Task_ConfirmLoseMailMessage
Task_ConfirmLoseMailMessage: @ 806EF00
	push {r4,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	ldr r0, _0806EF2C @ =gUnknown_0202E8F6
	ldrb r0, [r0]
	cmp r0, 0
	bne _0806EF26
	movs r0, 0x17
	movs r1, 0x8
	movs r2, 0x1
	bl DisplayYesNoMenu
	ldr r0, _0806EF30 @ =gTasks
	lsls r1, r4, 2
	adds r1, r4
	lsls r1, 3
	adds r1, r0
	ldr r0, _0806EF34 @ =Task_LoseMailMessage
	str r0, [r1]
_0806EF26:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0806EF2C: .4byte gUnknown_0202E8F6
_0806EF30: .4byte gTasks
_0806EF34: .4byte Task_LoseMailMessage
	thumb_func_end Task_ConfirmLoseMailMessage

	thumb_func_start Task_TakeHeldMail
Task_TakeHeldMail: @ 806EF38
	push {r4,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	bl ProcessMenuInputNoWrap_
	lsls r0, 24
	asrs r1, r0, 24
	cmp r1, 0
	bne _0806EF9C
	movs r0, 0x17
	movs r1, 0x8
	movs r2, 0x1D
	movs r3, 0xD
	bl MenuZeroFillWindowRect
	ldr r0, _0806EF70 @ =0x0201c000
	ldr r0, [r0]
	bl sub_80A2E78
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0xFF
	beq _0806EF78
	ldr r0, _0806EF74 @ =gOtherText_MailWasSent
	movs r1, 0
	bl sub_806E834
	b _0806EF80
	.align 2, 0
_0806EF70: .4byte 0x0201c000
_0806EF74: .4byte gOtherText_MailWasSent
_0806EF78:
	ldr r0, _0806EF90 @ =gOtherText_MailboxIsFull
	movs r1, 0
	bl sub_806E834
_0806EF80:
	ldr r0, _0806EF94 @ =gTasks
	lsls r1, r4, 2
	adds r1, r4
	lsls r1, 3
	adds r1, r0
	ldr r0, _0806EF98 @ =party_menu_link_mon_held_item_object
	str r0, [r1]
	b _0806EFD8
	.align 2, 0
_0806EF90: .4byte gOtherText_MailboxIsFull
_0806EF94: .4byte gTasks
_0806EF98: .4byte party_menu_link_mon_held_item_object
_0806EF9C:
	cmp r1, 0x1
	beq _0806EFA8
	movs r0, 0x1
	negs r0, r0
	cmp r1, r0
	bne _0806EFD8
_0806EFA8:
	movs r0, 0x1
	negs r0, r0
	cmp r1, r0
	bne _0806EFB6
	movs r0, 0x5
	bl PlaySE
_0806EFB6:
	movs r0, 0x17
	movs r1, 0x8
	movs r2, 0x1D
	movs r3, 0xD
	bl MenuZeroFillWindowRect
	ldr r0, _0806EFE0 @ =gOtherText_MailRemovedMessageLost
	movs r1, 0x1
	bl sub_806E834
	ldr r1, _0806EFE4 @ =gTasks
	lsls r0, r4, 2
	adds r0, r4
	lsls r0, 3
	adds r0, r1
	ldr r1, _0806EFE8 @ =Task_ConfirmLoseMailMessage
	str r1, [r0]
_0806EFD8:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0806EFE0: .4byte gOtherText_MailRemovedMessageLost
_0806EFE4: .4byte gTasks
_0806EFE8: .4byte Task_ConfirmLoseMailMessage
	thumb_func_end Task_TakeHeldMail

	thumb_func_start Task_ConfirmTakeHeldMail
Task_ConfirmTakeHeldMail: @ 806EFEC
	push {r4,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	ldr r0, _0806F018 @ =gUnknown_0202E8F6
	ldrb r0, [r0]
	cmp r0, 0
	bne _0806F012
	movs r0, 0x17
	movs r1, 0x8
	movs r2, 0x1
	bl DisplayYesNoMenu
	ldr r0, _0806F01C @ =gTasks
	lsls r1, r4, 2
	adds r1, r4
	lsls r1, 3
	adds r1, r0
	ldr r0, _0806F020 @ =Task_TakeHeldMail
	str r0, [r1]
_0806F012:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0806F018: .4byte gUnknown_0202E8F6
_0806F01C: .4byte gTasks
_0806F020: .4byte Task_TakeHeldMail
	thumb_func_end Task_ConfirmTakeHeldMail

	thumb_func_start ItemIdToBattleMoveId
ItemIdToBattleMoveId: @ 806F024
	lsls r0, 16
	ldr r1, _0806F034 @ =0xfedf0000
	adds r0, r1
	ldr r1, _0806F038 @ =gUnknown_08376504
	lsrs r0, 15
	adds r0, r1
	ldrh r0, [r0]
	bx lr
	.align 2, 0
_0806F034: .4byte 0xfedf0000
_0806F038: .4byte gUnknown_08376504
	thumb_func_end ItemIdToBattleMoveId

	thumb_func_start pokemon_has_move
pokemon_has_move: @ 806F03C
	push {r4-r6,lr}
	adds r6, r0, 0
	lsls r1, 16
	lsrs r5, r1, 16
	movs r4, 0
_0806F046:
	adds r1, r4, 0
	adds r1, 0xD
	adds r0, r6, 0
	bl GetMonData
	cmp r0, r5
	bne _0806F058
	movs r0, 0x1
	b _0806F064
_0806F058:
	adds r0, r4, 0x1
	lsls r0, 24
	lsrs r4, r0, 24
	cmp r4, 0x3
	bls _0806F046
	movs r0, 0
_0806F064:
	pop {r4-r6}
	pop {r1}
	bx r1
	thumb_func_end pokemon_has_move

	thumb_func_start TeachMonTMMove
TeachMonTMMove: @ 806F06C
	push {r4-r6,lr}
	adds r4, r0, 0
	adds r5, r1, 0
	adds r6, r2, 0
	lsls r4, 24
	lsrs r4, 24
	lsls r5, 16
	lsrs r5, 16
	movs r0, 0x5
	bl PlaySE
	ldr r1, _0806F0A8 @ =gTasks
	lsls r0, r4, 2
	adds r0, r4
	lsls r0, 3
	adds r0, r1
	ldr r1, _0806F0AC @ =TaskDummy
	str r1, [r0]
	adds r0, r4, 0
	adds r1, r5, 0
	adds r2, r6, 0
	bl sub_806E8D0
	ldr r0, _0806F0B0 @ =Task_TeamMonTMMove
	movs r1, 0x5
	bl CreateTask
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_0806F0A8: .4byte gTasks
_0806F0AC: .4byte TaskDummy
_0806F0B0: .4byte Task_TeamMonTMMove
	thumb_func_end TeachMonTMMove

	thumb_func_start Task_TeamMonTMMove
Task_TeamMonTMMove: @ 806F0B4
	push {r4-r7,lr}
	lsls r0, 24
	lsrs r6, r0, 24
	adds r7, r6, 0
	ldr r5, _0806F114 @ =0x0201c000
	ldr r0, [r5]
	ldr r1, _0806F118 @ =gStringVar1
	bl GetMonNickname
	ldrh r0, [r5, 0x6]
	bl ItemIdToBattleMoveId
	movs r4, 0
	strh r0, [r5, 0x8]
	ldr r0, _0806F11C @ =gStringVar2
	ldrh r2, [r5, 0x8]
	movs r1, 0xD
	muls r1, r2
	ldr r2, _0806F120 @ =gMoveNames
	adds r1, r2
	bl StringCopy
	ldr r1, _0806F124 @ =0xfffff282
	adds r0, r5, r1
	strh r4, [r0]
	ldr r0, [r5]
	ldrh r1, [r5, 0x8]
	bl pokemon_has_move
	lsls r0, 24
	cmp r0, 0
	beq _0806F138
	ldr r4, _0806F128 @ =gStringVar4
	ldr r1, _0806F12C @ =gOtherText_AlreadyKnows
	adds r0, r4, 0
	bl StringExpandPlaceholders
	adds r0, r4, 0
	movs r1, 0x1
	bl sub_806E834
	ldr r1, _0806F130 @ =gTasks
	lsls r0, r6, 2
	adds r0, r6
	lsls r0, 3
	adds r0, r1
	ldr r1, _0806F134 @ =party_menu_link_mon_held_item_object
	b _0806F1B6
	.align 2, 0
_0806F114: .4byte 0x0201c000
_0806F118: .4byte gStringVar1
_0806F11C: .4byte gStringVar2
_0806F120: .4byte gMoveNames
_0806F124: .4byte 0xfffff282
_0806F128: .4byte gStringVar4
_0806F12C: .4byte gOtherText_AlreadyKnows
_0806F130: .4byte gTasks
_0806F134: .4byte party_menu_link_mon_held_item_object
_0806F138:
	ldr r0, [r5]
	ldrb r1, [r5, 0x6]
	subs r1, 0x21
	lsls r1, 24
	lsrs r1, 24
	bl CanMonLearnTMHM
	cmp r0, 0
	bne _0806F17C
	ldr r4, _0806F16C @ =gStringVar4
	ldr r1, _0806F170 @ =gOtherText_NotCompatible
	adds r0, r4, 0
	bl StringExpandPlaceholders
	adds r0, r4, 0
	movs r1, 0x1
	bl sub_806E834
	ldr r1, _0806F174 @ =gTasks
	lsls r0, r6, 2
	adds r0, r6
	lsls r0, 3
	adds r0, r1
	ldr r1, _0806F178 @ =party_menu_link_mon_held_item_object
	b _0806F1B6
	.align 2, 0
_0806F16C: .4byte gStringVar4
_0806F170: .4byte gOtherText_NotCompatible
_0806F174: .4byte gTasks
_0806F178: .4byte party_menu_link_mon_held_item_object
_0806F17C:
	ldr r0, [r5]
	ldrh r1, [r5, 0x8]
	bl GiveMoveToMon
	lsls r0, 16
	ldr r1, _0806F194 @ =0xffff0000
	cmp r0, r1
	beq _0806F198
	adds r0, r6, 0
	bl Task_TeamMonTMMove2
	b _0806F1B8
	.align 2, 0
_0806F194: .4byte 0xffff0000
_0806F198:
	ldr r4, _0806F1C0 @ =gStringVar4
	ldr r1, _0806F1C4 @ =gOtherText_WantsToLearn
	adds r0, r4, 0
	bl StringExpandPlaceholders
	adds r0, r4, 0
	movs r1, 0x1
	bl sub_806E834
	ldr r1, _0806F1C8 @ =gTasks
	lsls r0, r7, 2
	adds r0, r7
	lsls r0, 3
	adds r0, r1
	ldr r1, _0806F1CC @ =sub_806F358
_0806F1B6:
	str r1, [r0]
_0806F1B8:
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_0806F1C0: .4byte gStringVar4
_0806F1C4: .4byte gOtherText_WantsToLearn
_0806F1C8: .4byte gTasks
_0806F1CC: .4byte sub_806F358
	thumb_func_end Task_TeamMonTMMove

	thumb_func_start Task_TeamMonTMMove2
Task_TeamMonTMMove2: @ 806F1D0
	push {r4-r6,lr}
	lsls r0, 24
	lsrs r6, r0, 24
	ldr r0, _0806F234 @ =gStringVar2
	ldr r5, _0806F238 @ =0x0201c000
	ldrh r2, [r5, 0x8]
	movs r1, 0xD
	muls r1, r2
	ldr r2, _0806F23C @ =gMoveNames
	adds r1, r2
	bl StringCopy
	ldr r4, _0806F240 @ =gStringVar4
	ldr r1, _0806F244 @ =gOtherText_LearnedMove
	adds r0, r4, 0
	bl StringExpandPlaceholders
	adds r0, r4, 0
	movs r1, 0x1
	bl sub_806E834
	ldr r0, [r5]
	movs r1, 0x4
	bl AdjustFriendship
	ldr r1, _0806F248 @ =0xfffff282
	adds r0, r5, r1
	movs r1, 0
	ldrsh r0, [r0, r1]
	cmp r0, 0
	bne _0806F220
	ldrh r1, [r5, 0x6]
	movs r0, 0xA9
	lsls r0, 1
	cmp r1, r0
	bhi _0806F220
	adds r0, r1, 0
	movs r1, 0x1
	bl RemoveBagItem
_0806F220:
	ldr r0, _0806F24C @ =gTasks
	lsls r1, r6, 2
	adds r1, r6
	lsls r1, 3
	adds r1, r0
	ldr r0, _0806F250 @ =Task_TeamMonTMMove3
	str r0, [r1]
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_0806F234: .4byte gStringVar2
_0806F238: .4byte 0x0201c000
_0806F23C: .4byte gMoveNames
_0806F240: .4byte gStringVar4
_0806F244: .4byte gOtherText_LearnedMove
_0806F248: .4byte 0xfffff282
_0806F24C: .4byte gTasks
_0806F250: .4byte Task_TeamMonTMMove3
	thumb_func_end Task_TeamMonTMMove2

	thumb_func_start Task_TeamMonTMMove3
Task_TeamMonTMMove3: @ 806F254
	push {r4,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	ldr r0, _0806F27C @ =gUnknown_0202E8F6
	ldrb r0, [r0]
	cmp r0, 0
	bne _0806F276
	ldr r0, _0806F280 @ =0x0000016f
	bl PlayFanfare
	ldr r1, _0806F284 @ =gTasks
	lsls r0, r4, 2
	adds r0, r4
	lsls r0, 3
	adds r0, r1
	ldr r1, _0806F288 @ =Task_TeamMonTMMove4
	str r1, [r0]
_0806F276:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0806F27C: .4byte gUnknown_0202E8F6
_0806F280: .4byte 0x0000016f
_0806F284: .4byte gTasks
_0806F288: .4byte Task_TeamMonTMMove4
	thumb_func_end Task_TeamMonTMMove3

	thumb_func_start Task_TeamMonTMMove4
Task_TeamMonTMMove4: @ 806F28C
	push {r4-r6,lr}
	lsls r0, 24
	lsrs r5, r0, 24
	adds r6, r5, 0
	bl IsFanfareTaskInactive
	lsls r0, 24
	cmp r0, 0
	beq _0806F2F2
	ldr r0, _0806F2D0 @ =gMain
	ldrh r1, [r0, 0x2E]
	movs r0, 0x1
	ands r0, r1
	cmp r0, 0
	bne _0806F2B2
	movs r0, 0x2
	ands r0, r1
	cmp r0, 0
	beq _0806F2F2
_0806F2B2:
	ldr r4, _0806F2D4 @ =0x0201c000
	ldrb r0, [r4, 0x4]
	ldrb r1, [r4, 0x5]
	bl SetHeldItemIconVisibility
	ldr r1, _0806F2D8 @ =0xfffff282
	adds r0, r4, r1
	movs r1, 0
	ldrsh r0, [r0, r1]
	cmp r0, 0x1
	bne _0806F2DC
	adds r0, r5, 0
	bl sub_8070C54
	b _0806F2F2
	.align 2, 0
_0806F2D0: .4byte gMain
_0806F2D4: .4byte 0x0201c000
_0806F2D8: .4byte 0xfffff282
_0806F2DC:
	ldr r2, _0806F2F8 @ =gTasks
	ldrb r1, [r4, 0x4]
	lsls r0, r1, 2
	adds r0, r1
	lsls r0, 3
	adds r0, r2
	ldr r1, [r4, 0x10]
	str r1, [r0]
	adds r0, r6, 0
	bl DestroyTask
_0806F2F2:
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_0806F2F8: .4byte gTasks
	thumb_func_end Task_TeamMonTMMove4

	thumb_func_start sub_806F2FC
sub_806F2FC: @ 806F2FC
	push {r4-r6,lr}
	lsls r0, 24
	lsrs r5, r0, 24
	adds r6, r5, 0
	ldr r0, _0806F32C @ =gUnknown_0202E8F6
	ldrb r0, [r0]
	cmp r0, 0
	bne _0806F34E
	ldr r4, _0806F330 @ =0x0201c000
	ldrb r0, [r4, 0x4]
	ldrb r1, [r4, 0x5]
	bl SetHeldItemIconVisibility
	ldr r1, _0806F334 @ =0xfffff282
	adds r0, r4, r1
	movs r1, 0
	ldrsh r0, [r0, r1]
	cmp r0, 0x1
	bne _0806F338
	adds r0, r5, 0
	bl sub_8070C54
	b _0806F34E
	.align 2, 0
_0806F32C: .4byte gUnknown_0202E8F6
_0806F330: .4byte 0x0201c000
_0806F334: .4byte 0xfffff282
_0806F338:
	ldr r2, _0806F354 @ =gTasks
	ldrb r1, [r4, 0x4]
	lsls r0, r1, 2
	adds r0, r1
	lsls r0, 3
	adds r0, r2
	ldr r1, [r4, 0x10]
	str r1, [r0]
	adds r0, r6, 0
	bl DestroyTask
_0806F34E:
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_0806F354: .4byte gTasks
	thumb_func_end sub_806F2FC

	thumb_func_start sub_806F358
sub_806F358: @ 806F358
	push {r4,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	ldr r0, _0806F384 @ =gUnknown_0202E8F6
	ldrb r0, [r0]
	cmp r0, 0
	bne _0806F37E
	movs r0, 0x17
	movs r1, 0x8
	movs r2, 0x1
	bl DisplayYesNoMenu
	ldr r0, _0806F388 @ =gTasks
	lsls r1, r4, 2
	adds r1, r4
	lsls r1, 3
	adds r1, r0
	ldr r0, _0806F38C @ =sub_806F390
	str r0, [r1]
_0806F37E:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0806F384: .4byte gUnknown_0202E8F6
_0806F388: .4byte gTasks
_0806F38C: .4byte sub_806F390
	thumb_func_end sub_806F358

	thumb_func_start sub_806F390
sub_806F390: @ 806F390
	push {r4,r5,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	adds r5, r4, 0
	bl ProcessMenuInputNoWrap_
	lsls r0, 24
	asrs r1, r0, 24
	cmp r1, 0
	bne _0806F3D4
	movs r0, 0x17
	movs r1, 0x8
	movs r2, 0x1D
	movs r3, 0xD
	bl MenuZeroFillWindowRect
	ldr r0, _0806F3C8 @ =gOtherText_WhichMoveToForget2
	movs r1, 0x1
	bl sub_806E834
	ldr r1, _0806F3CC @ =gTasks
	lsls r0, r4, 2
	adds r0, r4
	lsls r0, 3
	adds r0, r1
	ldr r1, _0806F3D0 @ =sub_806F44C
	str r1, [r0]
	b _0806F3F4
	.align 2, 0
_0806F3C8: .4byte gOtherText_WhichMoveToForget2
_0806F3CC: .4byte gTasks
_0806F3D0: .4byte sub_806F44C
_0806F3D4:
	cmp r1, 0x1
	beq _0806F3E0
	movs r0, 0x1
	negs r0, r0
	cmp r1, r0
	bne _0806F3F4
_0806F3E0:
	movs r0, 0x1
	negs r0, r0
	cmp r1, r0
	bne _0806F3EE
	movs r0, 0x5
	bl PlaySE
_0806F3EE:
	adds r0, r5, 0
	bl StopTryingToTeachMove_806F614
_0806F3F4:
	pop {r4,r5}
	pop {r0}
	bx r0
	thumb_func_end sub_806F390

	thumb_func_start sub_806F3FC
sub_806F3FC: @ 806F3FC
	push {r4,r5,lr}
	sub sp, 0x4
	lsls r0, 24
	lsrs r5, r0, 24
	ldr r0, _0806F438 @ =gPaletteFade
	ldrb r1, [r0, 0x7]
	movs r0, 0x80
	ands r0, r1
	cmp r0, 0
	bne _0806F430
	ldr r0, _0806F43C @ =gPlayerParty
	ldr r4, _0806F440 @ =0x0201c000
	ldrb r1, [r4, 0x5]
	ldr r2, _0806F444 @ =gPlayerPartyCount
	ldrb r2, [r2]
	subs r2, 0x1
	lsls r2, 24
	lsrs r2, 24
	ldr r3, _0806F448 @ =sub_808B564
	ldrh r4, [r4, 0x8]
	str r4, [sp]
	bl sub_809D9F0
	adds r0, r5, 0
	bl DestroyTask
_0806F430:
	add sp, 0x4
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_0806F438: .4byte gPaletteFade
_0806F43C: .4byte gPlayerParty
_0806F440: .4byte 0x0201c000
_0806F444: .4byte gPlayerPartyCount
_0806F448: .4byte sub_808B564
	thumb_func_end sub_806F3FC

	thumb_func_start sub_806F44C
sub_806F44C: @ 806F44C
	push {r4,lr}
	sub sp, 0x4
	lsls r0, 24
	lsrs r4, r0, 24
	ldr r0, _0806F484 @ =gUnknown_0202E8F6
	ldrb r1, [r0]
	cmp r1, 0
	bne _0806F47A
	movs r0, 0x1
	negs r0, r0
	str r1, [sp]
	movs r1, 0
	movs r2, 0
	movs r3, 0x10
	bl BeginNormalPaletteFade
	ldr r1, _0806F488 @ =gTasks
	lsls r0, r4, 2
	adds r0, r4
	lsls r0, 3
	adds r0, r1
	ldr r1, _0806F48C @ =sub_806F3FC
	str r1, [r0]
_0806F47A:
	add sp, 0x4
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0806F484: .4byte gUnknown_0202E8F6
_0806F488: .4byte gTasks
_0806F48C: .4byte sub_806F3FC
	thumb_func_end sub_806F44C

	thumb_func_start TaughtMove
TaughtMove: @ 806F490
	push {r4,r5,lr}
	lsls r0, 24
	lsrs r3, r0, 24
	ldr r0, _0806F50C @ =gPaletteFade
	ldrb r1, [r0, 0x7]
	movs r0, 0x80
	ands r0, r1
	cmp r0, 0
	bne _0806F506
	ldr r1, _0806F510 @ =gTasks
	lsls r0, r3, 2
	adds r0, r3
	lsls r0, 3
	adds r0, r1
	ldr r1, _0806F514 @ =TaskDummy
	str r1, [r0]
	ldr r0, _0806F518 @ =gScriptItemId
	ldrh r1, [r0]
	ldr r2, _0806F51C @ =sub_808B508
	adds r0, r3, 0
	bl sub_806E8D0
	bl sub_809FA30
	adds r1, r0, 0
	lsls r1, 24
	lsrs r1, 24
	ldr r5, _0806F520 @ =0x0201c000
	ldr r0, [r5]
	adds r1, 0xD
	bl GetMonData
	adds r4, r0, 0
	lsls r4, 16
	lsrs r4, 16
	ldr r0, [r5]
	ldr r1, _0806F524 @ =gStringVar1
	bl GetMonNickname
	ldr r0, _0806F528 @ =gStringVar2
	movs r1, 0xD
	muls r1, r4
	ldr r2, _0806F52C @ =gMoveNames
	adds r1, r2
	bl StringCopy
	ldr r4, _0806F530 @ =gStringVar4
	ldr r1, _0806F534 @ =gOtherText_ForgetMove123_2
	adds r0, r4, 0
	bl StringExpandPlaceholders
	adds r0, r4, 0
	movs r1, 0x1
	bl sub_806E834
	ldr r0, _0806F538 @ =TMMoveUpdateMoveSlot
	movs r1, 0x5
	bl CreateTask
_0806F506:
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_0806F50C: .4byte gPaletteFade
_0806F510: .4byte gTasks
_0806F514: .4byte TaskDummy
_0806F518: .4byte gScriptItemId
_0806F51C: .4byte sub_808B508
_0806F520: .4byte 0x0201c000
_0806F524: .4byte gStringVar1
_0806F528: .4byte gStringVar2
_0806F52C: .4byte gMoveNames
_0806F530: .4byte gStringVar4
_0806F534: .4byte gOtherText_ForgetMove123_2
_0806F538: .4byte TMMoveUpdateMoveSlot
	thumb_func_end TaughtMove

	thumb_func_start TMMoveUpdateMoveSlot
TMMoveUpdateMoveSlot: @ 806F53C
	push {r4-r6,lr}
	lsls r0, 24
	lsrs r6, r0, 24
	ldr r0, _0806F580 @ =gUnknown_0202E8F6
	ldrb r0, [r0]
	cmp r0, 0
	bne _0806F57A
	ldr r4, _0806F584 @ =0x0201c000
	ldr r5, [r4]
	bl sub_809FA30
	adds r1, r0, 0
	lsls r1, 24
	lsrs r1, 24
	adds r0, r5, 0
	bl RemoveMonPPBonus
	ldr r5, [r4]
	ldrh r4, [r4, 0x8]
	bl sub_809FA30
	adds r2, r0, 0
	lsls r2, 24
	lsrs r2, 24
	adds r0, r5, 0
	adds r1, r4, 0
	bl SetMonMoveSlot
	adds r0, r6, 0
	bl Task_TeamMonTMMove2
_0806F57A:
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_0806F580: .4byte gUnknown_0202E8F6
_0806F584: .4byte 0x0201c000
	thumb_func_end TMMoveUpdateMoveSlot

	thumb_func_start StopTryingToTeachMove_806F588
StopTryingToTeachMove_806F588: @ 806F588
	push {r4,lr}
	lsls r0, 24
	lsrs r3, r0, 24
	ldr r0, _0806F5E8 @ =gPaletteFade
	ldrb r1, [r0, 0x7]
	movs r0, 0x80
	ands r0, r1
	cmp r0, 0
	bne _0806F5E0
	ldr r1, _0806F5EC @ =gTasks
	lsls r0, r3, 2
	adds r0, r3
	lsls r0, 3
	adds r0, r1
	ldr r1, _0806F5F0 @ =TaskDummy
	str r1, [r0]
	ldr r0, _0806F5F4 @ =gScriptItemId
	ldrh r1, [r0]
	ldr r2, _0806F5F8 @ =sub_808B508
	adds r0, r3, 0
	bl sub_806E8D0
	ldr r0, _0806F5FC @ =gStringVar2
	ldr r1, _0806F600 @ =0x0201c000
	ldrh r2, [r1, 0x8]
	movs r1, 0xD
	muls r1, r2
	ldr r2, _0806F604 @ =gMoveNames
	adds r1, r2
	bl StringCopy
	ldr r4, _0806F608 @ =gStringVar4
	ldr r1, _0806F60C @ =gOtherText_StopTryingTo
	adds r0, r4, 0
	bl StringExpandPlaceholders
	adds r0, r4, 0
	movs r1, 0x1
	bl sub_806E834
	ldr r0, _0806F610 @ =StopTryingToTeachMove_806F67C
	movs r1, 0x5
	bl CreateTask
_0806F5E0:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0806F5E8: .4byte gPaletteFade
_0806F5EC: .4byte gTasks
_0806F5F0: .4byte TaskDummy
_0806F5F4: .4byte gScriptItemId
_0806F5F8: .4byte sub_808B508
_0806F5FC: .4byte gStringVar2
_0806F600: .4byte 0x0201c000
_0806F604: .4byte gMoveNames
_0806F608: .4byte gStringVar4
_0806F60C: .4byte gOtherText_StopTryingTo
_0806F610: .4byte StopTryingToTeachMove_806F67C
	thumb_func_end StopTryingToTeachMove_806F588

	thumb_func_start StopTryingToTeachMove_806F614
StopTryingToTeachMove_806F614: @ 806F614
	push {r4,r5,lr}
	adds r5, r0, 0
	lsls r5, 24
	lsrs r5, 24
	movs r0, 0x17
	movs r1, 0x8
	movs r2, 0x1D
	movs r3, 0xD
	bl MenuZeroFillWindowRect
	ldr r0, _0806F660 @ =gStringVar2
	ldr r1, _0806F664 @ =0x0201c000
	ldrh r2, [r1, 0x8]
	movs r1, 0xD
	muls r1, r2
	ldr r2, _0806F668 @ =gMoveNames
	adds r1, r2
	bl StringCopy
	ldr r4, _0806F66C @ =gStringVar4
	ldr r1, _0806F670 @ =gOtherText_StopTryingTo
	adds r0, r4, 0
	bl StringExpandPlaceholders
	adds r0, r4, 0
	movs r1, 0x1
	bl sub_806E834
	ldr r1, _0806F674 @ =gTasks
	lsls r0, r5, 2
	adds r0, r5
	lsls r0, 3
	adds r0, r1
	ldr r1, _0806F678 @ =StopTryingToTeachMove_806F67C
	str r1, [r0]
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_0806F660: .4byte gStringVar2
_0806F664: .4byte 0x0201c000
_0806F668: .4byte gMoveNames
_0806F66C: .4byte gStringVar4
_0806F670: .4byte gOtherText_StopTryingTo
_0806F674: .4byte gTasks
_0806F678: .4byte StopTryingToTeachMove_806F67C
	thumb_func_end StopTryingToTeachMove_806F614

	thumb_func_start StopTryingToTeachMove_806F67C
StopTryingToTeachMove_806F67C: @ 806F67C
	push {r4,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	ldr r0, _0806F6A8 @ =gUnknown_0202E8F6
	ldrb r0, [r0]
	cmp r0, 0
	bne _0806F6A2
	movs r0, 0x17
	movs r1, 0x8
	movs r2, 0x1
	bl DisplayYesNoMenu
	ldr r0, _0806F6AC @ =gTasks
	lsls r1, r4, 2
	adds r1, r4
	lsls r1, 3
	adds r1, r0
	ldr r0, _0806F6B0 @ =StopTryingToTeachMove_806F6B4
	str r0, [r1]
_0806F6A2:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0806F6A8: .4byte gUnknown_0202E8F6
_0806F6AC: .4byte gTasks
_0806F6B0: .4byte StopTryingToTeachMove_806F6B4
	thumb_func_end StopTryingToTeachMove_806F67C

	thumb_func_start StopTryingToTeachMove_806F6B4
StopTryingToTeachMove_806F6B4: @ 806F6B4
	push {r4-r6,lr}
	lsls r0, 24
	lsrs r5, r0, 24
	adds r6, r5, 0
	bl ProcessMenuInputNoWrap_
	lsls r0, 24
	asrs r1, r0, 24
	cmp r1, 0
	bne _0806F730
	movs r0, 0x17
	movs r1, 0x8
	movs r2, 0x1D
	movs r3, 0xD
	bl MenuZeroFillWindowRect
	ldr r4, _0806F710 @ =0x0201c000
	ldr r0, [r4]
	ldr r1, _0806F714 @ =gStringVar1
	bl GetMonNickname
	ldr r0, _0806F718 @ =gStringVar2
	ldrh r2, [r4, 0x8]
	movs r1, 0xD
	muls r1, r2
	ldr r2, _0806F71C @ =gMoveNames
	adds r1, r2
	bl StringCopy
	ldr r4, _0806F720 @ =gStringVar4
	ldr r1, _0806F724 @ =gOtherText_DidNotLearnMove2
	adds r0, r4, 0
	bl StringExpandPlaceholders
	adds r0, r4, 0
	movs r1, 0x1
	bl sub_806E834
	ldr r1, _0806F728 @ =gTasks
	lsls r0, r5, 2
	adds r0, r5
	lsls r0, 3
	adds r0, r1
	ldr r1, _0806F72C @ =sub_806F2FC
	b _0806F78E
	.align 2, 0
_0806F710: .4byte 0x0201c000
_0806F714: .4byte gStringVar1
_0806F718: .4byte gStringVar2
_0806F71C: .4byte gMoveNames
_0806F720: .4byte gStringVar4
_0806F724: .4byte gOtherText_DidNotLearnMove2
_0806F728: .4byte gTasks
_0806F72C: .4byte sub_806F2FC
_0806F730:
	cmp r1, 0x1
	beq _0806F73C
	movs r0, 0x1
	negs r0, r0
	cmp r1, r0
	bne _0806F790
_0806F73C:
	movs r0, 0x1
	negs r0, r0
	cmp r1, r0
	bne _0806F74A
	movs r0, 0x5
	bl PlaySE
_0806F74A:
	movs r0, 0x17
	movs r1, 0x8
	movs r2, 0x1D
	movs r3, 0xD
	bl MenuZeroFillWindowRect
	ldr r4, _0806F798 @ =0x0201c000
	ldr r0, [r4]
	ldr r1, _0806F79C @ =gStringVar1
	bl GetMonNickname
	ldr r0, _0806F7A0 @ =gStringVar2
	ldrh r2, [r4, 0x8]
	movs r1, 0xD
	muls r1, r2
	ldr r2, _0806F7A4 @ =gMoveNames
	adds r1, r2
	bl StringCopy
	ldr r4, _0806F7A8 @ =gStringVar4
	ldr r1, _0806F7AC @ =gOtherText_WantsToLearn
	adds r0, r4, 0
	bl StringExpandPlaceholders
	adds r0, r4, 0
	movs r1, 0x1
	bl sub_806E834
	ldr r1, _0806F7B0 @ =gTasks
	lsls r0, r6, 2
	adds r0, r6
	lsls r0, 3
	adds r0, r1
	ldr r1, _0806F7B4 @ =sub_806F358
_0806F78E:
	str r1, [r0]
_0806F790:
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_0806F798: .4byte 0x0201c000
_0806F79C: .4byte gStringVar1
_0806F7A0: .4byte gStringVar2
_0806F7A4: .4byte gMoveNames
_0806F7A8: .4byte gStringVar4
_0806F7AC: .4byte gOtherText_WantsToLearn
_0806F7B0: .4byte gTasks
_0806F7B4: .4byte sub_806F358
	thumb_func_end StopTryingToTeachMove_806F6B4

	thumb_func_start IsHMMove
IsHMMove: @ 806F7B8
	push {lr}
	lsls r0, 16
	lsrs r2, r0, 16
	movs r1, 0
	ldr r3, _0806F7D4 @ =gUnknown_08376504
_0806F7C2:
	adds r0, r1, 0
	adds r0, 0x32
	lsls r0, 1
	adds r0, r3
	ldrh r0, [r0]
	cmp r0, r2
	bne _0806F7D8
	movs r0, 0x1
	b _0806F7E4
	.align 2, 0
_0806F7D4: .4byte gUnknown_08376504
_0806F7D8:
	adds r0, r1, 0x1
	lsls r0, 24
	lsrs r1, r0, 24
	cmp r1, 0x7
	bls _0806F7C2
	movs r0, 0
_0806F7E4:
	pop {r1}
	bx r1
	thumb_func_end IsHMMove

	thumb_func_start sub_806F7E8
sub_806F7E8: @ 806F7E8
	push {r4-r6,lr}
	adds r5, r1, 0
	lsls r0, 24
	lsrs r0, 24
	lsls r3, r0, 2
	adds r3, r0
	lsls r3, 3
	ldr r0, _0806F898 @ =gTasks + 0x8
	adds r3, r0
	movs r0, 0x14
	ldrsh r1, [r3, r0]
	str r1, [r5]
	movs r4, 0x16
	ldrsh r0, [r3, r4]
	str r0, [r5, 0x4]
	movs r4, 0x18
	ldrsh r0, [r3, r4]
	lsls r2, 24
	asrs r2, 24
	muls r0, r2
	str r0, [r5, 0x8]
	movs r0, 0x80
	lsls r0, 1
	str r0, [r5, 0x10]
	ldr r6, _0806F89C @ =0x0201b000
	ldr r2, _0806F8A0 @ =0x00000282
	adds r0, r6, r2
	movs r4, 0
	ldrsh r0, [r0, r4]
	bl GetHPBarLevel
	lsls r0, 24
	lsrs r2, r0, 24
	adds r3, r2, 0
	cmp r2, 0x2
	bls _0806F83E
	ldrb r0, [r5, 0xC]
	movs r1, 0x20
	negs r1, r1
	ands r1, r0
	movs r0, 0x4
	orrs r1, r0
	strb r1, [r5, 0xC]
_0806F83E:
	cmp r2, 0x2
	bne _0806F850
	ldrb r0, [r5, 0xC]
	movs r1, 0x20
	negs r1, r1
	ands r1, r0
	movs r0, 0x5
	orrs r1, r0
	strb r1, [r5, 0xC]
_0806F850:
	cmp r3, 0x1
	bhi _0806F862
	ldrb r0, [r5, 0xC]
	movs r1, 0x20
	negs r1, r1
	ands r1, r0
	movs r0, 0x6
	orrs r1, r0
	strb r1, [r5, 0xC]
_0806F862:
	ldr r4, _0806F8A4 @ =gUnknown_08376858
	bl IsDoubleBattle
	movs r2, 0x80
	lsls r2, 5
	adds r1, r6, r2
	ldrb r2, [r1, 0x5]
	lsls r2, 2
	lsls r0, 24
	lsrs r0, 24
	lsls r1, r0, 1
	adds r1, r0
	lsls r1, 3
	adds r2, r1
	adds r2, r4
	ldr r2, [r2]
	ldr r4, _0806F8A8 @ =0x0000100c
	adds r1, r6, r4
	adds r0, r5, 0
	movs r3, 0
	bl sub_80460C8
	lsls r0, 16
	asrs r0, 16
	pop {r4-r6}
	pop {r1}
	bx r1
	.align 2, 0
_0806F898: .4byte gTasks + 0x8
_0806F89C: .4byte 0x0201b000
_0806F8A0: .4byte 0x00000282
_0806F8A4: .4byte gUnknown_08376858
_0806F8A8: .4byte 0x0000100c
	thumb_func_end sub_806F7E8

	thumb_func_start sub_806F8AC
sub_806F8AC: @ 806F8AC
	push {r4-r7,lr}
	sub sp, 0x18
	lsls r0, 24
	lsrs r6, r0, 24
	movs r4, 0x1
	negs r4, r4
	adds r0, r6, 0
	mov r1, sp
	adds r2, r4, 0
	bl sub_806F7E8
	ldr r1, _0806F8F4 @ =0x0201b000
	ldr r2, _0806F8F8 @ =0x00000282
	adds r5, r1, r2
	strh r0, [r5]
	lsls r0, 16
	asrs r0, 16
	cmp r0, r4
	beq _0806F8D4
	b _0806F9F0
_0806F8D4:
	movs r0, 0x80
	lsls r0, 5
	adds r1, r0
	movs r0, 0
	str r0, [r1, 0xC]
	ldr r0, [sp, 0x8]
	negs r3, r0
	ldr r2, [sp, 0x4]
	adds r0, r3, r2
	ldr r1, [sp]
	cmp r0, r1
	ble _0806F8FC
	subs r1, r2
	add r0, sp, 0x14
	strh r1, [r0]
	b _0806F900
	.align 2, 0
_0806F8F4: .4byte 0x0201b000
_0806F8F8: .4byte 0x00000282
_0806F8FC:
	add r0, sp, 0x14
	strh r3, [r0]
_0806F900:
	adds r5, r0, 0
	ldr r1, _0806F940 @ =gBattleMoveDamage
	ldrh r0, [r5]
	negs r0, r0
	str r0, [r1]
	ldr r0, _0806F944 @ =0x0201c000
	ldr r0, [r0]
	ldr r1, _0806F948 @ =gStringVar1
	bl GetMonNickname
	ldr r0, _0806F94C @ =gStringVar2
	ldrh r1, [r5]
	movs r2, 0
	movs r3, 0x3
	bl ConvertIntToDecimalStringN
	ldr r2, _0806F950 @ =gTasks
	lsls r1, r6, 2
	adds r0, r1, r6
	lsls r0, 3
	adds r0, r2
	movs r2, 0x24
	ldrsh r0, [r0, r2]
	adds r7, r1, 0
	cmp r0, 0
	bne _0806F95C
	ldr r0, _0806F954 @ =gStringVar4
	ldr r1, _0806F958 @ =gOtherText_HPRestoredBy
	bl StringExpandPlaceholders
	b _0806F964
	.align 2, 0
_0806F940: .4byte gBattleMoveDamage
_0806F944: .4byte 0x0201c000
_0806F948: .4byte gStringVar1
_0806F94C: .4byte gStringVar2
_0806F950: .4byte gTasks
_0806F954: .4byte gStringVar4
_0806F958: .4byte gOtherText_HPRestoredBy
_0806F95C:
	ldr r0, _0806F9D4 @ =gStringVar4
	ldr r1, _0806F9D8 @ =gOtherText_RegainedHealth
	bl StringExpandPlaceholders
_0806F964:
	ldr r4, _0806F9DC @ =0x0201c000
	ldrb r0, [r4, 0x4]
	ldrb r1, [r4, 0x5]
	bl GetMonIconSpriteId_maybe
	lsls r0, 24
	lsrs r0, 24
	ldr r1, [r4]
	bl SetMonIconAnim
	bl IsDoubleBattle
	adds r1, r0, 0
	lsls r1, 24
	lsrs r1, 24
	lsls r0, r1, 1
	adds r0, r1
	lsls r0, 2
	ldrb r1, [r4, 0x5]
	lsls r1, 1
	adds r0, r1
	ldr r1, _0806F9E0 @ =gUnknown_083769A8
	adds r0, r1
	movs r1, 0x7
	bl task_pc_turn_off
	ldr r0, _0806F9E4 @ =0xfffff261
	adds r1, r4, r0
	movs r0, 0x2
	strb r0, [r1]
	ldr r0, _0806F9D4 @ =gStringVar4
	movs r1, 0x1
	bl sub_806E834
	ldr r1, [sp, 0x4]
	ldrh r0, [r5]
	adds r0, r1
	strh r0, [r5]
	ldr r0, [r4]
	movs r1, 0x39
	adds r2, r5, 0
	bl SetMonData
	ldrh r0, [r4, 0x6]
	movs r1, 0x1
	bl RemoveBagItem
	bl sub_8032638
	ldr r1, _0806F9E8 @ =gTasks
	adds r0, r7, r6
	lsls r0, 3
	adds r0, r1
	ldr r1, _0806F9EC @ =sub_806FB44
	str r1, [r0]
	b _0806FA10
	.align 2, 0
_0806F9D4: .4byte gStringVar4
_0806F9D8: .4byte gOtherText_RegainedHealth
_0806F9DC: .4byte 0x0201c000
_0806F9E0: .4byte gUnknown_083769A8
_0806F9E4: .4byte 0xfffff261
_0806F9E8: .4byte gTasks
_0806F9EC: .4byte sub_806FB44
_0806F9F0:
	movs r2, 0x80
	lsls r2, 5
	adds r0, r1, r2
	ldrb r4, [r0, 0x5]
	bl IsDoubleBattle
	adds r1, r0, 0
	lsls r1, 24
	lsrs r1, 24
	ldrh r2, [r5]
	ldr r3, [sp]
	lsls r3, 16
	lsrs r3, 16
	adds r0, r4, 0
	bl PartyMenuDoPrintHP
_0806FA10:
	add sp, 0x18
	pop {r4-r7}
	pop {r0}
	bx r0
	thumb_func_end sub_806F8AC

	thumb_func_start sub_806FA18
sub_806FA18: @ 806FA18
	push {r4-r7,lr}
	sub sp, 0x14
	lsls r0, 24
	lsrs r5, r0, 24
	adds r0, r5, 0
	mov r1, sp
	movs r2, 0x1
	bl sub_806F7E8
	ldr r6, _0806FAC4 @ =0x0201b000
	ldr r1, _0806FAC8 @ =0x00000282
	adds r7, r6, r1
	strh r0, [r7]
	lsls r0, 16
	asrs r0, 16
	movs r1, 0x1
	negs r1, r1
	cmp r0, r1
	bne _0806FAE4
	movs r0, 0x1
	bl PlaySE
	movs r0, 0x80
	lsls r0, 5
	adds r4, r6, r0
	movs r0, 0
	str r0, [r4, 0xC]
	ldr r2, _0806FACC @ =gTasks
	lsls r3, r5, 2
	adds r3, r5
	lsls r3, 3
	adds r5, r3, r2
	ldrh r0, [r5, 0x1E]
	ldrh r1, [r5, 0x20]
	subs r0, r1
	strh r0, [r5, 0x1E]
	ldr r0, [r4]
	adds r2, r3
	adds r2, 0x1E
	movs r1, 0x39
	bl SetMonData
	ldrb r0, [r4, 0x4]
	ldr r1, _0806FAD0 @ =0xfffe6000
	adds r6, r1
	ldrb r1, [r6, 0x1]
	bl GetMonIconSpriteId_maybe
	lsls r0, 24
	lsrs r0, 24
	ldr r1, [r4]
	bl SetMonIconAnim
	ldr r2, _0806FAD4 @ =gSprites
	ldrb r1, [r6, 0x2]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r2
	ldrh r0, [r0, 0x2E]
	strb r0, [r4, 0x5]
	ldrb r1, [r4, 0x5]
	movs r0, 0x64
	muls r0, r1
	ldr r1, _0806FAD8 @ =gPlayerParty
	adds r0, r1
	str r0, [r4]
	movs r1, 0x3A
	bl GetMonData
	strh r0, [r5, 0x1C]
	ldr r0, [r4]
	movs r1, 0x39
	bl GetMonData
	strh r0, [r5, 0x1E]
	ldr r0, _0806FADC @ =0xffff8000
	str r0, [r4, 0xC]
	ldr r0, [r4, 0x10]
	str r0, [r4, 0x14]
	ldr r0, _0806FAE0 @ =sub_806F8AC
	str r0, [r5]
	ldrh r0, [r5, 0x1E]
	strh r0, [r7]
	b _0806FB04
	.align 2, 0
_0806FAC4: .4byte 0x0201b000
_0806FAC8: .4byte 0x00000282
_0806FACC: .4byte gTasks
_0806FAD0: .4byte 0xfffe6000
_0806FAD4: .4byte gSprites
_0806FAD8: .4byte gPlayerParty
_0806FADC: .4byte 0xffff8000
_0806FAE0: .4byte sub_806F8AC
_0806FAE4:
	movs r1, 0x80
	lsls r1, 5
	adds r0, r6, r1
	ldrb r4, [r0, 0x5]
	bl IsDoubleBattle
	adds r1, r0, 0
	lsls r1, 24
	lsrs r1, 24
	ldrh r2, [r7]
	ldr r3, [sp]
	lsls r3, 16
	lsrs r3, 16
	adds r0, r4, 0
	bl PartyMenuDoPrintHP
_0806FB04:
	add sp, 0x14
	pop {r4-r7}
	pop {r0}
	bx r0
	thumb_func_end sub_806FA18

	thumb_func_start sub_806FB0C
sub_806FB0C: @ 806FB0C
	push {r4,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	ldr r0, _0806FB38 @ =gUnknown_0202E8F6
	ldrb r0, [r0]
	cmp r0, 0
	bne _0806FB32
	ldr r3, _0806FB3C @ =gTasks
	ldr r2, _0806FB40 @ =0x0201c000
	ldrb r1, [r2, 0x4]
	lsls r0, r1, 2
	adds r0, r1
	lsls r0, 3
	adds r0, r3
	ldr r1, [r2, 0x10]
	str r1, [r0]
	adds r0, r4, 0
	bl DestroyTask
_0806FB32:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0806FB38: .4byte gUnknown_0202E8F6
_0806FB3C: .4byte gTasks
_0806FB40: .4byte 0x0201c000
	thumb_func_end sub_806FB0C

	thumb_func_start sub_806FB44
sub_806FB44: @ 806FB44
	push {r4,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	ldr r0, _0806FB70 @ =gUnknown_0202E8F6
	ldrb r0, [r0]
	cmp r0, 0
	bne _0806FB6A
	ldr r3, _0806FB74 @ =gTasks
	ldr r2, _0806FB78 @ =0x0201c000
	ldrb r1, [r2, 0x4]
	lsls r0, r1, 2
	adds r0, r1
	lsls r0, 3
	adds r0, r3
	ldr r1, [r2, 0x14]
	str r1, [r0]
	adds r0, r4, 0
	bl DestroyTask
_0806FB6A:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0806FB70: .4byte gUnknown_0202E8F6
_0806FB74: .4byte gTasks
_0806FB78: .4byte 0x0201c000
	thumb_func_end sub_806FB44

	thumb_func_start IsHPRecoveryItem
IsHPRecoveryItem: @ 806FB7C
	push {lr}
	lsls r0, 16
	lsrs r0, 16
	cmp r0, 0xAF
	bne _0806FB90
	ldr r0, _0806FB8C @ =gSaveBlock1 + 0x3676
	b _0806FB9A
	.align 2, 0
_0806FB8C: .4byte gSaveBlock1 + 0x3676
_0806FB90:
	ldr r1, _0806FBA8 @ =gItemEffectTable
	subs r0, 0xD
	lsls r0, 2
	adds r0, r1
	ldr r0, [r0]
_0806FB9A:
	ldrb r1, [r0, 0x4]
	movs r0, 0x4
	ands r0, r1
	cmp r0, 0
	bne _0806FBAC
	movs r0, 0
	b _0806FBAE
	.align 2, 0
_0806FBA8: .4byte gItemEffectTable
_0806FBAC:
	movs r0, 0x1
_0806FBAE:
	pop {r1}
	bx r1
	thumb_func_end IsHPRecoveryItem

	thumb_func_start PartyMenuUpdateLevelOrStatus
PartyMenuUpdateLevelOrStatus: @ 806FBB4
	push {r4,r5,lr}
	adds r5, r0, 0
	lsls r4, r1, 24
	lsrs r4, 24
	adds r0, r4, 0
	bl PartyMenuClearLevelStatusTilemap
	adds r0, r4, 0
	adds r1, r5, 0
	bl PartyMenuPrintMonLevelOrStatus
	pop {r4,r5}
	pop {r0}
	bx r0
	thumb_func_end PartyMenuUpdateLevelOrStatus

	thumb_func_start GetMedicineItemEffectMessage
GetMedicineItemEffectMessage: @ 806FBD0
	push {lr}
	lsls r0, 16
	lsrs r0, 16
	bl GetItemEffectType
	lsls r0, 24
	lsrs r0, 24
	subs r0, 0x3
	cmp r0, 0x12
	bls _0806FBE6
	b _0806FD7C
_0806FBE6:
	lsls r0, 2
	ldr r1, _0806FBF0 @ =_0806FBF4
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_0806FBF0: .4byte _0806FBF4
	.align 2, 0
_0806FBF4:
	.4byte _0806FC40
	.4byte _0806FC54
	.4byte _0806FC68
	.4byte _0806FC7C
	.4byte _0806FC90
	.4byte _0806FCA4
	.4byte _0806FCB8
	.4byte _0806FD7C
	.4byte _0806FCCC
	.4byte _0806FCF0
	.4byte _0806FCE0
	.4byte _0806FD20
	.4byte _0806FD30
	.4byte _0806FD10
	.4byte _0806FD00
	.4byte _0806FD7C
	.4byte _0806FD54
	.4byte _0806FD54
	.4byte _0806FD68
_0806FC40:
	ldr r0, _0806FC4C @ =gStringVar4
	ldr r1, _0806FC50 @ =gOtherText_CuredPoisoning
	bl StringExpandPlaceholders
	b _0806FD84
	.align 2, 0
_0806FC4C: .4byte gStringVar4
_0806FC50: .4byte gOtherText_CuredPoisoning
_0806FC54:
	ldr r0, _0806FC60 @ =gStringVar4
	ldr r1, _0806FC64 @ =gOtherText_WokeUp
	bl StringExpandPlaceholders
	b _0806FD84
	.align 2, 0
_0806FC60: .4byte gStringVar4
_0806FC64: .4byte gOtherText_WokeUp
_0806FC68:
	ldr r0, _0806FC74 @ =gStringVar4
	ldr r1, _0806FC78 @ =gOtherText_BurnHealed
	bl StringExpandPlaceholders
	b _0806FD84
	.align 2, 0
_0806FC74: .4byte gStringVar4
_0806FC78: .4byte gOtherText_BurnHealed
_0806FC7C:
	ldr r0, _0806FC88 @ =gStringVar4
	ldr r1, _0806FC8C @ =gOtherText_ThawedOut
	bl StringExpandPlaceholders
	b _0806FD84
	.align 2, 0
_0806FC88: .4byte gStringVar4
_0806FC8C: .4byte gOtherText_ThawedOut
_0806FC90:
	ldr r0, _0806FC9C @ =gStringVar4
	ldr r1, _0806FCA0 @ =gOtherText_CuredParalysis
	bl StringExpandPlaceholders
	b _0806FD84
	.align 2, 0
_0806FC9C: .4byte gStringVar4
_0806FCA0: .4byte gOtherText_CuredParalysis
_0806FCA4:
	ldr r0, _0806FCB0 @ =gStringVar4
	ldr r1, _0806FCB4 @ =gOtherText_SnapConfusion
	bl StringExpandPlaceholders
	b _0806FD84
	.align 2, 0
_0806FCB0: .4byte gStringVar4
_0806FCB4: .4byte gOtherText_SnapConfusion
_0806FCB8:
	ldr r0, _0806FCC4 @ =gStringVar4
	ldr r1, _0806FCC8 @ =gOtherText_GotOverLove
	bl StringExpandPlaceholders
	b _0806FD84
	.align 2, 0
_0806FCC4: .4byte gStringVar4
_0806FCC8: .4byte gOtherText_GotOverLove
_0806FCCC:
	ldr r0, _0806FCD8 @ =gStringVar4
	ldr r1, _0806FCDC @ =gOtherText_BecameHealthy
	bl StringExpandPlaceholders
	b _0806FD84
	.align 2, 0
_0806FCD8: .4byte gStringVar4
_0806FCDC: .4byte gOtherText_BecameHealthy
_0806FCE0:
	ldr r0, _0806FCE8 @ =gStringVar2
	ldr r1, _0806FCEC @ =gOtherText_Hp2
	b _0806FD34
	.align 2, 0
_0806FCE8: .4byte gStringVar2
_0806FCEC: .4byte gOtherText_Hp2
_0806FCF0:
	ldr r0, _0806FCF8 @ =gStringVar2
	ldr r1, _0806FCFC @ =gOtherText_Attack
	b _0806FD34
	.align 2, 0
_0806FCF8: .4byte gStringVar2
_0806FCFC: .4byte gOtherText_Attack
_0806FD00:
	ldr r0, _0806FD08 @ =gStringVar2
	ldr r1, _0806FD0C @ =gOtherText_Defense
	b _0806FD34
	.align 2, 0
_0806FD08: .4byte gStringVar2
_0806FD0C: .4byte gOtherText_Defense
_0806FD10:
	ldr r0, _0806FD18 @ =gStringVar2
	ldr r1, _0806FD1C @ =gOtherText_Speed
	b _0806FD34
	.align 2, 0
_0806FD18: .4byte gStringVar2
_0806FD1C: .4byte gOtherText_Speed
_0806FD20:
	ldr r0, _0806FD28 @ =gStringVar2
	ldr r1, _0806FD2C @ =gOtherText_SpAtk2
	b _0806FD34
	.align 2, 0
_0806FD28: .4byte gStringVar2
_0806FD2C: .4byte gOtherText_SpAtk2
_0806FD30:
	ldr r0, _0806FD44 @ =gStringVar2
	ldr r1, _0806FD48 @ =gOtherText_SpDef2
_0806FD34:
	bl StringCopy
	ldr r0, _0806FD4C @ =gStringVar4
	ldr r1, _0806FD50 @ =gOtherText_WasRaised
	bl StringExpandPlaceholders
	b _0806FD84
	.align 2, 0
_0806FD44: .4byte gStringVar2
_0806FD48: .4byte gOtherText_SpDef2
_0806FD4C: .4byte gStringVar4
_0806FD50: .4byte gOtherText_WasRaised
_0806FD54:
	ldr r0, _0806FD60 @ =gStringVar4
	ldr r1, _0806FD64 @ =gOtherText_PPIncreased
	bl StringExpandPlaceholders
	b _0806FD84
	.align 2, 0
_0806FD60: .4byte gStringVar4
_0806FD64: .4byte gOtherText_PPIncreased
_0806FD68:
	ldr r0, _0806FD74 @ =gStringVar4
	ldr r1, _0806FD78 @ =gOtherText_PPRestored
	bl StringExpandPlaceholders
	b _0806FD84
	.align 2, 0
_0806FD74: .4byte gStringVar4
_0806FD78: .4byte gOtherText_PPRestored
_0806FD7C:
	ldr r0, _0806FD88 @ =gStringVar4
	ldr r1, _0806FD8C @ =gOtherText_WontHaveAnyEffect
	bl StringExpandPlaceholders
_0806FD84:
	pop {r0}
	bx r0
	.align 2, 0
_0806FD88: .4byte gStringVar4
_0806FD8C: .4byte gOtherText_WontHaveAnyEffect
	thumb_func_end GetMedicineItemEffectMessage

	thumb_func_start IsMedicineIneffective
IsMedicineIneffective: @ 806FD90
	push {r4,lr}
	adds r4, r0, 0
	lsls r0, r1, 16
	lsrs r0, 16
	bl GetItemEffectType
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0xD
	bne _0806FDBC
	adds r0, r4, 0
	movs r1, 0xB
	bl GetMonData
	ldr r1, _0806FDB8 @ =0x0000012f
	cmp r0, r1
	bne _0806FDBC
	movs r0, 0x1
	b _0806FDBE
	.align 2, 0
_0806FDB8: .4byte 0x0000012f
_0806FDBC:
	movs r0, 0
_0806FDBE:
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end IsMedicineIneffective

	thumb_func_start ExecuteTableBasedItemEffect__
ExecuteTableBasedItemEffect__: @ 806FDC4
	push {r4-r6,lr}
	lsls r0, 24
	lsrs r3, r0, 24
	lsls r1, 16
	lsrs r5, r1, 16
	lsls r2, 24
	lsrs r6, r2, 24
	ldr r0, _0806FDF0 @ =gMain
	ldr r1, _0806FDF4 @ =0x0000043d
	adds r0, r1
	ldrb r1, [r0]
	movs r0, 0x2
	ands r0, r1
	cmp r0, 0
	bne _0806FDFC
	movs r0, 0x64
	muls r0, r3
	ldr r1, _0806FDF8 @ =gPlayerParty
	adds r0, r1
	adds r1, r5, 0
	adds r2, r3, 0
	b _0806FE16
	.align 2, 0
_0806FDF0: .4byte gMain
_0806FDF4: .4byte 0x0000043d
_0806FDF8: .4byte gPlayerParty
_0806FDFC:
	movs r0, 0x64
	adds r4, r3, 0
	muls r4, r0
	ldr r0, _0806FE28 @ =gPlayerParty
	adds r4, r0
	adds r0, r3, 0
	bl sub_8094C20
	adds r2, r0, 0
	lsls r2, 24
	lsrs r2, 24
	adds r0, r4, 0
	adds r1, r5, 0
_0806FE16:
	adds r3, r6, 0
	bl ExecuteTableBasedItemEffect_
	lsls r0, 24
	lsrs r0, 24
	pop {r4-r6}
	pop {r1}
	bx r1
	.align 2, 0
_0806FE28: .4byte gPlayerParty
	thumb_func_end ExecuteTableBasedItemEffect__

	thumb_func_start UseMedicine
UseMedicine: @ 806FE2C
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	adds r4, r0, 0
	adds r5, r2, 0
	lsls r4, 24
	lsrs r4, 24
	lsls r1, 16
	lsrs r6, r1, 16
	movs r0, 0
	mov r9, r0
	ldr r1, _0806FED4 @ =gTasks
	mov r10, r1
	lsls r1, r4, 2
	adds r1, r4
	lsls r1, 3
	add r1, r10
	ldr r0, _0806FED8 @ =TaskDummy
	str r0, [r1]
	movs r1, 0x5
	bl CreateTask
	lsls r0, 24
	lsrs r7, r0, 24
	adds r0, r4, 0
	adds r1, r6, 0
	adds r2, r5, 0
	bl sub_806E8D0
	ldr r5, _0806FEDC @ =0x0201c000
	ldr r0, [r5]
	adds r1, r6, 0
	bl IsMedicineIneffective
	lsls r0, 24
	cmp r0, 0
	bne _0806FEE0
	adds r0, r6, 0
	bl IsHPRecoveryItem
	lsls r0, 24
	lsrs r0, 24
	mov r9, r0
	lsls r2, r7, 2
	mov r8, r2
	cmp r0, 0x1
	bne _0806FEC2
	ldr r0, [r5]
	movs r1, 0x3A
	bl GetMonData
	mov r3, r8
	adds r1, r3, r7
	lsls r1, 3
	mov r2, r10
	adds r4, r1, r2
	strh r0, [r4, 0x1C]
	ldr r0, [r5]
	movs r1, 0x39
	bl GetMonData
	strh r0, [r4, 0x1E]
	movs r3, 0x1C
	ldrsh r1, [r4, r3]
	lsls r0, 16
	asrs r0, 16
	cmp r1, r0
	bne _0806FEC2
	movs r0, 0
	mov r9, r0
	mov r1, r9
	strh r1, [r4, 0x1C]
	strh r1, [r4, 0x1E]
_0806FEC2:
	ldr r0, _0806FEDC @ =0x0201c000
	ldrb r0, [r0, 0x5]
	adds r1, r6, 0
	movs r2, 0
	bl ExecuteTableBasedItemEffect__
	lsls r0, 24
	lsrs r0, 24
	b _0806FEE6
	.align 2, 0
_0806FED4: .4byte gTasks
_0806FED8: .4byte TaskDummy
_0806FEDC: .4byte 0x0201c000
_0806FEE0:
	movs r0, 0x1
	lsls r2, r7, 2
	mov r8, r2
_0806FEE6:
	cmp r0, 0
	beq _0806FF14
	ldr r1, _0806FF08 @ =gUnknown_0202E8F4
	movs r0, 0
	strb r0, [r1]
	movs r0, 0x5
	bl PlaySE
	ldr r0, _0806FF0C @ =gOtherText_WontHaveAnyEffect
	movs r1, 0x1
	bl sub_806E834
	ldr r1, _0806FF10 @ =gTasks
	mov r3, r8
	adds r0, r3, r7
	b _08070002
	.align 2, 0
_0806FF08: .4byte gUnknown_0202E8F4
_0806FF0C: .4byte gOtherText_WontHaveAnyEffect
_0806FF10: .4byte gTasks
_0806FF14:
	ldr r1, _0806FF30 @ =gUnknown_0202E8F4
	movs r0, 0x1
	strb r0, [r1]
	adds r0, r6, 0
	bl IsBlueYellowRedFlute
	lsls r0, 24
	cmp r0, 0
	bne _0806FF34
	movs r0, 0x1
	bl PlaySE
	b _0806FF3A
	.align 2, 0
_0806FF30: .4byte gUnknown_0202E8F4
_0806FF34:
	movs r0, 0x75
	bl PlaySE
_0806FF3A:
	ldr r4, _0806FF88 @ =0x0201c000
	ldr r0, [r4]
	bl GetMonStatusAndPokerus
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x6
	beq _0806FF4E
	cmp r0, 0
	bne _0806FF56
_0806FF4E:
	ldr r0, [r4]
	ldrb r1, [r4, 0x5]
	bl PartyMenuUpdateLevelOrStatus
_0806FF56:
	mov r0, r9
	cmp r0, 0x1
	bne _0806FFC8
	ldr r4, _0806FF88 @ =0x0201c000
	ldr r0, [r4]
	movs r1, 0x39
	bl GetMonData
	ldr r2, _0806FF8C @ =gTasks
	mov r3, r8
	adds r1, r3, r7
	lsls r1, 3
	adds r2, r1, r2
	ldrh r1, [r2, 0x1E]
	subs r0, r1
	strh r0, [r2, 0x20]
	ldr r0, _0806FF90 @ =0xffff8000
	str r0, [r4, 0xC]
	movs r1, 0x1E
	ldrsh r0, [r2, r1]
	cmp r0, 0
	bne _0806FF94
	mov r3, r9
	strh r3, [r2, 0x24]
	b _0806FF98
	.align 2, 0
_0806FF88: .4byte 0x0201c000
_0806FF8C: .4byte gTasks
_0806FF90: .4byte 0xffff8000
_0806FF94:
	movs r0, 0
	strh r0, [r2, 0x24]
_0806FF98:
	ldr r2, _0806FFB8 @ =0x0201c000
	ldr r0, [r2, 0x10]
	str r0, [r2, 0x14]
	ldr r1, _0806FFBC @ =gTasks
	mov r3, r8
	adds r0, r3, r7
	lsls r0, 3
	adds r0, r1
	ldr r1, _0806FFC0 @ =sub_806F8AC
	str r1, [r0]
	ldrh r0, [r0, 0x1E]
	ldr r1, _0806FFC4 @ =0xfffff282
	adds r2, r1
	strh r0, [r2]
	b _0807000A
	.align 2, 0
_0806FFB8: .4byte 0x0201c000
_0806FFBC: .4byte gTasks
_0806FFC0: .4byte sub_806F8AC
_0806FFC4: .4byte 0xfffff282
_0806FFC8:
	ldr r4, _08070018 @ =0x0201c000
	ldr r0, [r4]
	ldr r1, _0807001C @ =gStringVar1
	bl GetMonNickname
	adds r0, r6, 0
	bl IsBlueYellowRedFlute
	lsls r0, 24
	cmp r0, 0
	bne _0806FFE6
	adds r0, r6, 0
	movs r1, 0x1
	bl RemoveBagItem
_0806FFE6:
	adds r0, r6, 0
	bl GetMedicineItemEffectMessage
	ldrb r0, [r4, 0x5]
	ldr r1, [r4]
	bl TryPrintPartyMenuMonNickname
	ldr r0, _08070020 @ =gStringVar4
	movs r1, 0x1
	bl sub_806E834
	ldr r1, _08070024 @ =gTasks
	mov r2, r8
	adds r0, r2, r7
_08070002:
	lsls r0, 3
	adds r0, r1
	ldr r1, _08070028 @ =sub_806FB0C
	str r1, [r0]
_0807000A:
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_08070018: .4byte 0x0201c000
_0807001C: .4byte gStringVar1
_08070020: .4byte gStringVar4
_08070024: .4byte gTasks
_08070028: .4byte sub_806FB0C
	thumb_func_end UseMedicine

	thumb_func_start IsBlueYellowRedFlute
IsBlueYellowRedFlute: @ 807002C
	push {lr}
	lsls r0, 16
	lsrs r0, 16
	cmp r0, 0x27
	beq _0807003E
	cmp r0, 0x29
	beq _0807003E
	cmp r0, 0x28
	bne _08070042
_0807003E:
	movs r0, 0x1
	b _08070044
_08070042:
	movs r0, 0
_08070044:
	pop {r1}
	bx r1
	thumb_func_end IsBlueYellowRedFlute

	thumb_func_start sub_8070048
sub_8070048: @ 8070048
	push {r4,lr}
	lsls r0, 24
	lsrs r0, 24
	ldr r3, _08070078 @ =0x0201c000
	str r2, [r3, 0x10]
	movs r4, 0
	strb r0, [r3, 0x4]
	movs r2, 0
	strh r1, [r3, 0x6]
	strb r2, [r3, 0x5]
	ldr r1, _0807007C @ =sub_80701DC
	str r1, [r3, 0x14]
	ldr r2, _08070080 @ =0xfffff27e
	adds r1, r3, r2
	strh r4, [r1]
	ldr r1, _08070084 @ =0xfffff280
	adds r3, r1
	strh r4, [r3]
	bl sub_8070088
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08070078: .4byte 0x0201c000
_0807007C: .4byte sub_80701DC
_08070080: .4byte 0xfffff27e
_08070084: .4byte 0xfffff280
	thumb_func_end sub_8070048

    .section .text_80701DC

	thumb_func_start sub_80701DC
sub_80701DC: @ 80701DC
	push {r4-r7,lr}
	lsls r0, 24
	lsrs r5, r0, 24
	ldr r6, _08070280 @ =0x0201b000
	ldr r0, _08070284 @ =0x0000027e
	adds r7, r6, r0
	movs r1, 0
	ldrsh r0, [r7, r1]
	cmp r0, 0x1
	bne _0807023E
	movs r0, 0x80
	lsls r0, 5
	adds r4, r6, r0
	ldrh r0, [r4, 0x6]
	movs r1, 0x1
	bl AddBagItem
	ldrb r1, [r4, 0x5]
	movs r0, 0x64
	muls r0, r1
	ldr r1, _08070288 @ =gPlayerParty
	adds r0, r1
	movs r1, 0xB
	bl GetMonData
	cmp r0, 0
	beq _0807023A
	bl IsDoubleBattle
	adds r1, r0, 0
	lsls r1, 24
	lsrs r1, 24
	lsls r0, r1, 1
	adds r0, r1
	lsls r0, 2
	ldrb r1, [r4, 0x5]
	lsls r1, 1
	adds r0, r1
	ldr r1, _0807028C @ =gUnknown_083769A8
	adds r0, r1
	movs r1, 0x3
	bl task_pc_turn_off
	ldr r0, _08070290 @ =0x00000261
	adds r1, r6, r0
	movs r0, 0x2
	strb r0, [r1]
_0807023A:
	movs r0, 0
	strh r0, [r7]
_0807023E:
	ldr r4, _08070294 @ =0x0201c000
	ldrb r0, [r4, 0x5]
	adds r0, 0x1
	strb r0, [r4, 0x5]
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x6
	bne _080702D8
	ldr r1, _08070298 @ =gUnknown_0202E8F4
	movs r0, 0
	strb r0, [r1]
	ldr r1, _0807029C @ =0xfffff280
	adds r0, r4, r1
	movs r1, 0
	ldrsh r0, [r0, r1]
	cmp r0, 0
	bne _080702B0
	ldr r1, _080702A0 @ =gTasks
	lsls r0, r5, 2
	adds r0, r5
	lsls r0, 3
	adds r0, r1
	ldr r1, _080702A4 @ =TaskDummy
	str r1, [r0]
	ldr r0, _080702A8 @ =gOtherText_WontHaveAnyEffect
	movs r1, 0x1
	bl sub_806E834
	ldr r0, _080702AC @ =sub_806FB0C
	movs r1, 0x8
	bl CreateTask
	b _080702C6
	.align 2, 0
_08070280: .4byte 0x0201b000
_08070284: .4byte 0x0000027e
_08070288: .4byte gPlayerParty
_0807028C: .4byte gUnknown_083769A8
_08070290: .4byte 0x00000261
_08070294: .4byte 0x0201c000
_08070298: .4byte gUnknown_0202E8F4
_0807029C: .4byte 0xfffff280
_080702A0: .4byte gTasks
_080702A4: .4byte TaskDummy
_080702A8: .4byte gOtherText_WontHaveAnyEffect
_080702AC: .4byte sub_806FB0C
_080702B0:
	ldrh r0, [r4, 0x6]
	movs r1, 0x1
	bl RemoveBagItem
	ldr r1, _080702D0 @ =gTasks
	lsls r0, r5, 2
	adds r0, r5
	lsls r0, 3
	adds r0, r1
	ldr r1, [r4, 0x10]
	str r1, [r0]
_080702C6:
	ldr r1, _080702D4 @ =gUnknown_03005CE0
	movs r0, 0
	strb r0, [r1]
	b _080702DE
	.align 2, 0
_080702D0: .4byte gTasks
_080702D4: .4byte gUnknown_03005CE0
_080702D8:
	adds r0, r5, 0
	bl sub_8070088
_080702DE:
	pop {r4-r7}
	pop {r0}
	bx r0
	thumb_func_end sub_80701DC

	thumb_func_start CreateItemUseMoveMenu
CreateItemUseMoveMenu: @ 80702E4
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	sub sp, 0x8
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	movs r6, 0
	movs r0, 0x13
	movs r1, 0xA
	movs r2, 0x1D
	movs r3, 0x13
	bl MenuDrawTextWindow
	movs r5, 0
	movs r0, 0x64
	adds r7, r4, 0
	muls r7, r0
	ldr r0, _0807036C @ =gPlayerParty
	mov r8, r0
_0807030C:
	adds r1, r5, 0
	adds r1, 0xD
	mov r2, r8
	adds r0, r7, r2
	bl GetMonData
	adds r4, r0, 0
	lsls r4, 16
	lsrs r4, 16
	movs r0, 0xD
	muls r0, r4
	ldr r1, _08070370 @ =gMoveNames
	adds r0, r1
	lsls r2, r5, 25
	movs r1, 0xB0
	lsls r1, 20
	adds r2, r1
	lsrs r2, 24
	movs r1, 0x14
	bl MenuPrint
	cmp r4, 0
	beq _08070340
	adds r0, r6, 0x1
	lsls r0, 24
	lsrs r6, r0, 24
_08070340:
	adds r0, r5, 0x1
	lsls r0, 24
	lsrs r5, r0, 24
	cmp r5, 0x3
	bls _0807030C
	movs r0, 0
	str r0, [sp]
	movs r0, 0x9
	str r0, [sp, 0x4]
	movs r0, 0
	movs r1, 0x14
	movs r2, 0xB
	adds r3, r6, 0
	bl InitMenu
	add sp, 0x8
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_0807036C: .4byte gPlayerParty
_08070370: .4byte gMoveNames
	thumb_func_end CreateItemUseMoveMenu

	thumb_func_start Task_HandleItemUseMoveMenuInput
Task_HandleItemUseMoveMenuInput: @ 8070374
	push {r4,lr}
	lsls r0, 24
	lsrs r2, r0, 24
	adds r4, r2, 0
	ldr r0, _08070398 @ =gMain
	ldrh r1, [r0, 0x2E]
	movs r0, 0x40
	ands r0, r1
	cmp r0, 0
	beq _0807039C
	movs r0, 0x5
	bl PlaySE
	movs r0, 0x1
	negs r0, r0
	bl MoveMenuCursor
	b _080703E4
	.align 2, 0
_08070398: .4byte gMain
_0807039C:
	movs r0, 0x80
	ands r0, r1
	cmp r0, 0
	beq _080703B2
	movs r0, 0x5
	bl PlaySE
	movs r0, 0x1
	bl MoveMenuCursor
	b _080703E4
_080703B2:
	movs r0, 0x1
	ands r0, r1
	cmp r0, 0
	beq _080703CC
	ldr r0, _080703C8 @ =gUnknown_08376B54
	ldr r1, [r0]
	adds r0, r2, 0
	bl _call_via_r1
	b _080703E4
	.align 2, 0
_080703C8: .4byte gUnknown_08376B54
_080703CC:
	movs r0, 0x2
	ands r0, r1
	cmp r0, 0
	beq _080703E4
	movs r0, 0x5
	bl PlaySE
	ldr r0, _080703EC @ =gUnknown_08376B54
	ldr r1, [r0, 0x4]
	adds r0, r4, 0
	bl _call_via_r1
_080703E4:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080703EC: .4byte gUnknown_08376B54
	thumb_func_end Task_HandleItemUseMoveMenuInput

	thumb_func_start DoPPRecoveryItemEffect
DoPPRecoveryItemEffect: @ 80703F0
	push {r4-r7,lr}
	mov r7, r9
	mov r6, r8
	push {r6,r7}
	mov r9, r2
	lsls r0, 24
	lsrs r6, r0, 24
	lsls r1, 16
	lsrs r5, r1, 16
	cmp r5, 0xAF
	bne _08070410
	ldr r0, _0807040C @ =gSaveBlock1 + 0x3676
	b _0807041C
	.align 2, 0
_0807040C: .4byte gSaveBlock1 + 0x3676
_08070410:
	ldr r1, _08070464 @ =gItemEffectTable
	adds r0, r5, 0
	subs r0, 0xD
	lsls r0, 2
	adds r0, r1
	ldr r0, [r0]
_0807041C:
	mov r8, r0
	ldr r7, _08070468 @ =gTasks
	lsls r1, r6, 2
	adds r1, r6
	lsls r1, 3
	adds r1, r7
	ldr r0, _0807046C @ =TaskDummy
	str r0, [r1]
	movs r1, 0x5
	bl CreateTask
	lsls r0, 24
	lsrs r4, r0, 24
	adds r0, r6, 0
	adds r1, r5, 0
	mov r2, r9
	bl sub_806E8D0
	mov r0, r8
	ldrb r1, [r0, 0x4]
	movs r0, 0x10
	ands r0, r1
	lsls r0, 24
	lsrs r1, r0, 24
	cmp r1, 0
	bne _08070470
	lsls r0, r4, 2
	adds r0, r4
	lsls r0, 3
	adds r0, r7
	strh r1, [r0, 0x1E]
	adds r0, r4, 0
	bl DoRecoverPP
	b _08070498
	.align 2, 0
_08070464: .4byte gItemEffectTable
_08070468: .4byte gTasks
_0807046C: .4byte TaskDummy
_08070470:
	movs r0, 0x5
	bl PlaySE
	movs r0, 0xA
	movs r1, 0x3
	bl sub_806D538
	ldr r0, _080704A4 @ =0x0201c000
	ldrb r0, [r0, 0x5]
	bl CreateItemUseMoveMenu
	lsls r0, r4, 2
	adds r0, r4
	lsls r0, 3
	adds r0, r7
	ldr r1, _080704A8 @ =Task_HandleItemUseMoveMenuInput
	str r1, [r0]
	ldr r1, _080704AC @ =gMain
	movs r0, 0
	strh r0, [r1, 0x2E]
_08070498:
	pop {r3,r4}
	mov r8, r3
	mov r9, r4
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080704A4: .4byte 0x0201c000
_080704A8: .4byte Task_HandleItemUseMoveMenuInput
_080704AC: .4byte gMain
	thumb_func_end DoPPRecoveryItemEffect

	thumb_func_start ItemUseMoveMenu_HandleMoveSelection
ItemUseMoveMenu_HandleMoveSelection: @ 80704B0
	push {r4,lr}
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	bl sub_8072DEC
	movs r0, 0x13
	movs r1, 0xA
	movs r2, 0x1D
	movs r3, 0x13
	bl MenuZeroFillWindowRect
	bl sub_806D5A4
	bl GetMenuCursorPos
	ldr r2, _080704EC @ =gTasks
	lsls r1, r4, 2
	adds r1, r4
	lsls r1, 3
	adds r1, r2
	lsls r0, 24
	lsrs r0, 24
	strh r0, [r1, 0x1E]
	adds r0, r4, 0
	bl DoRecoverPP
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080704EC: .4byte gTasks
	thumb_func_end ItemUseMoveMenu_HandleMoveSelection

	thumb_func_start ItemUseMoveMenu_HandleCancel
ItemUseMoveMenu_HandleCancel: @ 80704F0
	push {r4,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	bl sub_8072DEC
	movs r0, 0x13
	movs r1, 0xA
	movs r2, 0x1D
	movs r3, 0x13
	bl MenuZeroFillWindowRect
	ldr r0, _08070528 @ =gMain
	ldr r1, _0807052C @ =0x0000043d
	adds r0, r1
	ldrb r1, [r0]
	movs r0, 0x2
	ands r0, r1
	cmp r0, 0
	beq _0807053C
	ldr r2, _08070530 @ =gTasks
	ldr r0, _08070534 @ =0x0201c000
	ldrb r1, [r0, 0x4]
	lsls r0, r1, 2
	adds r0, r1
	lsls r0, 3
	adds r0, r2
	ldr r1, _08070538 @ =SetUpBattlePokemonMenu
	b _0807054C
	.align 2, 0
_08070528: .4byte gMain
_0807052C: .4byte 0x0000043d
_08070530: .4byte gTasks
_08070534: .4byte 0x0201c000
_08070538: .4byte SetUpBattlePokemonMenu
_0807053C:
	ldr r2, _08070564 @ =gTasks
	ldr r0, _08070568 @ =0x0201c000
	ldrb r1, [r0, 0x4]
	lsls r0, r1, 2
	adds r0, r1
	lsls r0, 3
	adds r0, r2
	ldr r1, _0807056C @ =sub_808B0C0
_0807054C:
	str r1, [r0]
	movs r0, 0x3
	movs r1, 0
	bl sub_806D538
	adds r0, r4, 0
	bl DestroyTask
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08070564: .4byte gTasks
_08070568: .4byte 0x0201c000
_0807056C: .4byte sub_808B0C0
	thumb_func_end ItemUseMoveMenu_HandleCancel

	thumb_func_start DoRecoverPP
DoRecoverPP: @ 8070570
	push {r4-r7,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	movs r5, 0
	ldr r6, _080705A8 @ =0x0201c000
	ldrb r0, [r6, 0x5]
	ldrh r1, [r6, 0x6]
	ldr r3, _080705AC @ =gTasks
	lsls r2, r4, 2
	adds r2, r4
	lsls r2, 3
	adds r7, r2, r3
	ldrb r2, [r7, 0x1E]
	bl ExecuteTableBasedItemEffect__
	lsls r0, 24
	cmp r0, 0
	beq _080705B8
	ldr r0, _080705B0 @ =gUnknown_0202E8F4
	strb r5, [r0]
	movs r0, 0x5
	bl PlaySE
	ldr r0, _080705B4 @ =gOtherText_WontHaveAnyEffect
	movs r1, 0x1
	bl sub_806E834
	b _080705F8
	.align 2, 0
_080705A8: .4byte 0x0201c000
_080705AC: .4byte gTasks
_080705B0: .4byte gUnknown_0202E8F4
_080705B4: .4byte gOtherText_WontHaveAnyEffect
_080705B8:
	ldr r1, _0807060C @ =gUnknown_0202E8F4
	movs r0, 0x1
	strb r0, [r1]
	movs r0, 0x1
	bl PlaySE
	ldrh r0, [r6, 0x6]
	movs r1, 0x1
	bl RemoveBagItem
	ldr r0, [r6]
	movs r2, 0x1E
	ldrsh r1, [r7, r2]
	adds r1, 0xD
	bl GetMonData
	lsls r0, 16
	lsrs r5, r0, 16
	ldr r0, _08070610 @ =gStringVar1
	movs r1, 0xD
	muls r1, r5
	ldr r2, _08070614 @ =gMoveNames
	adds r1, r2
	bl StringCopy
	ldrh r0, [r6, 0x6]
	bl GetMedicineItemEffectMessage
	ldr r0, _08070618 @ =gStringVar4
	movs r1, 0x1
	bl sub_806E834
_080705F8:
	ldr r0, _0807061C @ =gTasks
	lsls r1, r4, 2
	adds r1, r4
	lsls r1, 3
	adds r1, r0
	ldr r0, _08070620 @ =sub_806FB0C
	str r0, [r1]
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_0807060C: .4byte gUnknown_0202E8F4
_08070610: .4byte gStringVar1
_08070614: .4byte gMoveNames
_08070618: .4byte gStringVar4
_0807061C: .4byte gTasks
_08070620: .4byte sub_806FB0C
	thumb_func_end DoRecoverPP

	thumb_func_start DoPPUpItemEffect
DoPPUpItemEffect: @ 8070624
	push {r4,lr}
	lsls r0, 24
	lsrs r0, 24
	lsls r1, 16
	lsrs r1, 16
	ldr r4, _0807066C @ =gTasks
	lsls r3, r0, 2
	adds r3, r0
	lsls r3, 3
	adds r3, r4
	ldr r4, _08070670 @ =TaskDummy
	str r4, [r3]
	bl sub_806E8D0
	movs r0, 0x5
	bl PlaySE
	movs r0, 0xB
	movs r1, 0x3
	bl sub_806D538
	ldr r0, _08070674 @ =0x0201c000
	ldrb r0, [r0, 0x5]
	bl CreateItemUseMoveMenu
	ldr r0, _08070678 @ =Task_HandleItemUseMoveMenuInput
	movs r1, 0x5
	bl CreateTask
	ldr r1, _0807067C @ =gMain
	movs r0, 0
	strh r0, [r1, 0x2E]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0807066C: .4byte gTasks
_08070670: .4byte TaskDummy
_08070674: .4byte 0x0201c000
_08070678: .4byte Task_HandleItemUseMoveMenuInput
_0807067C: .4byte gMain
	thumb_func_end DoPPUpItemEffect

	thumb_func_start DoRareCandyItemEffect
DoRareCandyItemEffect: @ 8070680
	push {r4-r7,lr}
	lsls r0, 24
	lsrs r0, 24
	lsls r1, 16
	lsrs r6, r1, 16
	ldr r3, _080706E0 @ =gTasks
	lsls r1, r0, 2
	adds r1, r0
	lsls r1, 3
	adds r1, r3
	ldr r3, _080706E4 @ =TaskDummy
	str r3, [r1]
	adds r1, r6, 0
	bl sub_806E8D0
	ldr r5, _080706E8 @ =0x0201c000
	ldr r0, [r5]
	movs r1, 0x38
	bl GetMonData
	cmp r0, 0x64
	beq _080706F4
	movs r4, 0
	ldr r0, _080706EC @ =0xfffff264
	adds r7, r5, r0
_080706B2:
	ldr r0, [r5]
	ldr r1, _080706F0 @ =gUnknown_08376D1C
	adds r1, r4, r1
	ldrb r1, [r1]
	bl GetMonData
	lsls r1, r4, 1
	adds r1, r7, r1
	strh r0, [r1]
	adds r0, r4, 0x1
	lsls r0, 24
	lsrs r4, r0, 24
	cmp r4, 0x5
	bls _080706B2
	ldr r0, _080706E8 @ =0x0201c000
	ldrb r0, [r0, 0x5]
	adds r1, r6, 0
	movs r2, 0
	bl ExecuteTableBasedItemEffect__
	lsls r0, 24
	lsrs r0, 24
	b _080706F6
	.align 2, 0
_080706E0: .4byte gTasks
_080706E4: .4byte TaskDummy
_080706E8: .4byte 0x0201c000
_080706EC: .4byte 0xfffff264
_080706F0: .4byte gUnknown_08376D1C
_080706F4:
	movs r0, 0x1
_080706F6:
	cmp r0, 0
	beq _08070724
	ldr r1, _08070718 @ =gUnknown_0202E8F4
	movs r0, 0
	strb r0, [r1]
	movs r0, 0x5
	bl PlaySE
	ldr r0, _0807071C @ =gOtherText_WontHaveAnyEffect
	movs r1, 0x1
	bl sub_806E834
	ldr r0, _08070720 @ =sub_806FB0C
	movs r1, 0x5
	bl CreateTask
	b _0807077C
	.align 2, 0
_08070718: .4byte gUnknown_0202E8F4
_0807071C: .4byte gOtherText_WontHaveAnyEffect
_08070720: .4byte sub_806FB0C
_08070724:
	ldr r1, _08070784 @ =gUnknown_0202E8F4
	movs r0, 0x1
	strb r0, [r1]
	movs r0, 0
	bl PlayFanfareByFanfareNum
	ldr r4, _08070788 @ =0x0201c000
	ldrb r0, [r4, 0x5]
	ldr r1, [r4]
	bl sub_8070A20
	adds r0, r6, 0
	movs r1, 0x1
	bl RemoveBagItem
	ldr r0, [r4]
	ldr r1, _0807078C @ =gStringVar1
	bl GetMonNickname
	ldr r0, [r4]
	movs r1, 0x38
	bl GetMonData
	adds r1, r0, 0
	lsls r1, 24
	lsrs r1, 24
	ldr r0, _08070790 @ =gStringVar2
	movs r2, 0
	movs r3, 0x3
	bl ConvertIntToDecimalStringN
	ldr r4, _08070794 @ =gStringVar4
	ldr r1, _08070798 @ =gOtherText_ElevatedTo
	adds r0, r4, 0
	bl StringExpandPlaceholders
	adds r0, r4, 0
	movs r1, 0x1
	bl sub_806E834
	ldr r0, _0807079C @ =Task_RareCandy1
	movs r1, 0x5
	bl CreateTask
_0807077C:
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_08070784: .4byte gUnknown_0202E8F4
_08070788: .4byte 0x0201c000
_0807078C: .4byte gStringVar1
_08070790: .4byte gStringVar2
_08070794: .4byte gStringVar4
_08070798: .4byte gOtherText_ElevatedTo
_0807079C: .4byte Task_RareCandy1
	thumb_func_end DoRareCandyItemEffect

	thumb_func_start Task_RareCandy1
Task_RareCandy1: @ 80707A0
	push {r4,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	movs r0, 0
	bl WaitFanfare
	lsls r0, 24
	cmp r0, 0
	beq _080707E8
	ldr r0, _080707F0 @ =gUnknown_0202E8F6
	ldrb r0, [r0]
	cmp r0, 0
	bne _080707E8
	ldr r0, _080707F4 @ =gMain
	ldrh r1, [r0, 0x2E]
	movs r0, 0x1
	ands r0, r1
	cmp r0, 0
	bne _080707CE
	movs r0, 0x2
	ands r0, r1
	cmp r0, 0
	beq _080707E8
_080707CE:
	movs r0, 0x5
	bl PlaySE
	adds r0, r4, 0
	bl sub_8070848
	ldr r0, _080707F8 @ =gTasks
	lsls r1, r4, 2
	adds r1, r4
	lsls r1, 3
	adds r1, r0
	ldr r0, _080707FC @ =Task_RareCandy2
	str r0, [r1]
_080707E8:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080707F0: .4byte gUnknown_0202E8F6
_080707F4: .4byte gMain
_080707F8: .4byte gTasks
_080707FC: .4byte Task_RareCandy2
	thumb_func_end Task_RareCandy1

	thumb_func_start Task_RareCandy2
Task_RareCandy2: @ 8070800
	push {r4,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	ldr r0, _0807083C @ =gMain
	ldrh r1, [r0, 0x2E]
	movs r0, 0x1
	ands r0, r1
	cmp r0, 0
	bne _0807081A
	movs r0, 0x2
	ands r0, r1
	cmp r0, 0
	beq _08070834
_0807081A:
	movs r0, 0x5
	bl PlaySE
	adds r0, r4, 0
	bl sub_8070968
	ldr r0, _08070840 @ =gTasks
	lsls r1, r4, 2
	adds r1, r4
	lsls r1, 3
	adds r1, r0
	ldr r0, _08070844 @ =Task_RareCandy3
	str r0, [r1]
_08070834:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0807083C: .4byte gMain
_08070840: .4byte gTasks
_08070844: .4byte Task_RareCandy3
	thumb_func_end Task_RareCandy2

    .section .text_8070968

	thumb_func_start sub_8070968
sub_8070968: @ 8070968
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	movs r7, 0
	ldr r0, _08070A10 @ =0x0201c000
	mov r9, r0
	ldr r1, _08070A14 @ =0xfffff264
	add r1, r9
	mov r10, r1
	ldr r0, _08070A18 @ =gStringVar1
	mov r8, r0
_08070982:
	mov r1, r9
	ldr r0, [r1]
	ldr r1, _08070A1C @ =gUnknown_08376D1C
	adds r1, r7, r1
	ldrb r1, [r1]
	bl GetMonData
	adds r6, r7, 0x6
	lsls r6, 1
	add r6, r10
	strh r0, [r6]
	adds r0, r7, 0
	movs r1, 0x3
	bl __udivsi3
	lsls r0, 24
	lsrs r0, 24
	lsls r4, r0, 3
	adds r4, r0
	adds r4, 0xB
	lsls r4, 24
	lsrs r4, 24
	adds r0, r7, 0
	movs r1, 0x3
	bl __umodsi3
	adds r5, r0, 0
	lsls r5, 1
	adds r5, 0x1
	lsls r5, 24
	lsrs r5, 24
	movs r0, 0xFC
	mov r1, r8
	strb r0, [r1]
	movs r0, 0x14
	strb r0, [r1, 0x1]
	movs r0, 0x6
	strb r0, [r1, 0x2]
	movs r0, 0
	ldrsh r1, [r6, r0]
	mov r0, r8
	adds r0, 0x3
	movs r2, 0x1
	movs r3, 0x3
	bl ConvertIntToDecimalStringN
	adds r4, 0x6
	lsls r4, 3
	adds r4, 0x6
	lsls r4, 24
	lsrs r4, 24
	lsls r5, 3
	mov r0, r8
	adds r1, r4, 0
	adds r2, r5, 0
	movs r3, 0
	bl MenuPrint_PixelCoords
	adds r0, r7, 0x1
	lsls r0, 24
	lsrs r7, r0, 24
	cmp r7, 0x5
	bls _08070982
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_08070A10: .4byte 0x0201c000
_08070A14: .4byte 0xfffff264
_08070A18: .4byte gStringVar1
_08070A1C: .4byte gUnknown_08376D1C
	thumb_func_end sub_8070968

	thumb_func_start sub_8070A20
sub_8070A20: @ 8070A20
	push {r4-r7,lr}
	adds r6, r1, 0
	lsls r0, 24
	lsrs r7, r0, 24
	adds r0, r6, 0
	bl GetMonStatusAndPokerus
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0
	beq _08070A3A
	cmp r0, 0x6
	bne _08070A42
_08070A3A:
	adds r0, r6, 0
	adds r1, r7, 0
	bl PartyMenuUpdateLevelOrStatus
_08070A42:
	bl IsDoubleBattle
	adds r5, r0, 0
	lsls r5, 24
	lsrs r5, 24
	adds r0, r6, 0
	movs r1, 0x39
	bl GetMonData
	adds r4, r0, 0
	lsls r4, 16
	lsrs r4, 16
	adds r0, r6, 0
	movs r1, 0x3A
	bl GetMonData
	adds r3, r0, 0
	lsls r3, 16
	lsrs r3, 16
	adds r0, r7, 0
	adds r1, r5, 0
	adds r2, r4, 0
	bl PartyMenuDoPrintHP
	adds r0, r7, 0
	adds r1, r6, 0
	bl PartyMenuTryDrawHPBar
	ldr r4, _08070ABC @ =0x0201c000
	ldrb r0, [r4, 0x4]
	adds r1, r7, 0
	bl GetMonIconSpriteId_maybe
	lsls r0, 24
	lsrs r0, 24
	adds r1, r6, 0
	bl SetMonIconAnim
	bl IsDoubleBattle
	adds r1, r0, 0
	lsls r1, 24
	lsrs r1, 24
	lsls r0, r1, 1
	adds r0, r1
	lsls r0, 2
	lsls r1, r7, 1
	adds r0, r1
	ldr r1, _08070AC0 @ =gUnknown_083769A8
	adds r0, r1
	movs r1, 0x7
	bl task_pc_turn_off
	ldr r0, _08070AC4 @ =0xfffff261
	adds r4, r0
	movs r0, 0x2
	strb r0, [r4]
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_08070ABC: .4byte 0x0201c000
_08070AC0: .4byte gUnknown_083769A8
_08070AC4: .4byte 0xfffff261
	thumb_func_end sub_8070A20

	thumb_func_start Task_RareCandy3
Task_RareCandy3: @ 8070AC8
	push {r4-r7,lr}
	lsls r0, 24
	lsrs r6, r0, 24
	movs r0, 0
	bl WaitFanfare
	lsls r0, 24
	cmp r0, 0
	bne _08070ADC
	b _08070C2C
_08070ADC:
	ldr r0, _08070B24 @ =gMain
	ldrh r1, [r0, 0x2E]
	movs r5, 0x1
	adds r0, r5, 0
	ands r0, r1
	cmp r0, 0
	bne _08070AF4
	movs r0, 0x2
	ands r0, r1
	cmp r0, 0
	bne _08070AF4
	b _08070C2C
_08070AF4:
	movs r0, 0xB
	movs r1, 0
	movs r2, 0x1D
	movs r3, 0x7
	bl MenuZeroFillWindowRect
	ldr r7, _08070B28 @ =0x0201c000
	ldr r0, [r7]
	movs r1, 0x1
	bl sub_803B7C8
	lsls r0, 16
	lsrs r4, r0, 16
	ldr r1, _08070B2C @ =0xfffff282
	adds r0, r7, r1
	strh r5, [r0]
	ldr r0, _08070B30 @ =0x0000fffe
	cmp r4, r0
	beq _08070BDC
	cmp r4, r0
	bgt _08070B34
	cmp r4, 0
	beq _08070B40
	b _08070BF4
	.align 2, 0
_08070B24: .4byte gMain
_08070B28: .4byte 0x0201c000
_08070B2C: .4byte 0xfffff282
_08070B30: .4byte 0x0000fffe
_08070B34:
	ldr r0, _08070B3C @ =0x0000ffff
	cmp r4, r0
	beq _08070B7C
	b _08070BF4
	.align 2, 0
_08070B3C: .4byte 0x0000ffff
_08070B40:
	ldr r0, [r7]
	movs r1, 0
	movs r2, 0
	bl GetEvolutionTargetSpecies
	lsls r0, 16
	lsrs r2, r0, 16
	cmp r2, 0
	beq _08070B74
	ldr r1, _08070B6C @ =gUnknown_03005E94
	ldr r0, _08070B70 @ =sub_80A53F8
	str r0, [r1]
	ldr r0, [r7]
	ldrb r3, [r7, 0x5]
	adds r1, r2, 0
	movs r2, 0x1
	bl BeginEvolutionScene
	adds r0, r6, 0
	bl DestroyTask
	b _08070C2C
	.align 2, 0
_08070B6C: .4byte gUnknown_03005E94
_08070B70: .4byte sub_80A53F8
_08070B74:
	adds r0, r6, 0
	bl sub_8070D90
	b _08070C2C
_08070B7C:
	ldr r0, [r7]
	ldr r1, _08070BBC @ =gStringVar1
	bl GetMonNickname
	ldr r0, _08070BC0 @ =gStringVar2
	ldr r5, _08070BC4 @ =word_2024E82
	ldrh r2, [r5]
	movs r1, 0xD
	muls r1, r2
	ldr r2, _08070BC8 @ =gMoveNames
	adds r1, r2
	bl StringCopy
	ldr r4, _08070BCC @ =gStringVar4
	ldr r1, _08070BD0 @ =gOtherText_WantsToLearn
	adds r0, r4, 0
	bl StringExpandPlaceholders
	adds r0, r4, 0
	movs r1, 0x1
	bl sub_806E834
	ldrh r0, [r5]
	strh r0, [r7, 0x8]
	ldr r1, _08070BD4 @ =gTasks
	lsls r0, r6, 2
	adds r0, r6
	lsls r0, 3
	adds r0, r1
	ldr r1, _08070BD8 @ =sub_806F358
	b _08070C2A
	.align 2, 0
_08070BBC: .4byte gStringVar1
_08070BC0: .4byte gStringVar2
_08070BC4: .4byte word_2024E82
_08070BC8: .4byte gMoveNames
_08070BCC: .4byte gStringVar4
_08070BD0: .4byte gOtherText_WantsToLearn
_08070BD4: .4byte gTasks
_08070BD8: .4byte sub_806F358
_08070BDC:
	ldr r0, _08070BEC @ =gTasks
	lsls r1, r6, 2
	adds r1, r6
	lsls r1, 3
	adds r1, r0
	ldr r0, _08070BF0 @ =sub_8070C54
	str r0, [r1]
	b _08070C2C
	.align 2, 0
_08070BEC: .4byte gTasks
_08070BF0: .4byte sub_8070C54
_08070BF4:
	ldr r0, _08070C34 @ =0x0201c000
	ldr r0, [r0]
	ldr r1, _08070C38 @ =gStringVar1
	bl GetMonNickname
	ldr r0, _08070C3C @ =gStringVar2
	movs r1, 0xD
	muls r1, r4
	ldr r2, _08070C40 @ =gMoveNames
	adds r1, r2
	bl StringCopy
	ldr r4, _08070C44 @ =gStringVar4
	ldr r1, _08070C48 @ =gOtherText_LearnedMove
	adds r0, r4, 0
	bl StringExpandPlaceholders
	adds r0, r4, 0
	movs r1, 0x1
	bl sub_806E834
	ldr r1, _08070C4C @ =gTasks
	lsls r0, r6, 2
	adds r0, r6
	lsls r0, 3
	adds r0, r1
	ldr r1, _08070C50 @ =Task_TeamMonTMMove3
_08070C2A:
	str r1, [r0]
_08070C2C:
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_08070C34: .4byte 0x0201c000
_08070C38: .4byte gStringVar1
_08070C3C: .4byte gStringVar2
_08070C40: .4byte gMoveNames
_08070C44: .4byte gStringVar4
_08070C48: .4byte gOtherText_LearnedMove
_08070C4C: .4byte gTasks
_08070C50: .4byte Task_TeamMonTMMove3
	thumb_func_end Task_RareCandy3

	thumb_func_start sub_8070C54
sub_8070C54: @ 8070C54
	push {r4-r7,lr}
	lsls r0, 24
	lsrs r6, r0, 24
	ldr r7, _08070C78 @ =0x0201c000
	ldr r0, [r7]
	movs r1, 0
	bl sub_803B7C8
	lsls r0, 16
	lsrs r4, r0, 16
	ldr r0, _08070C7C @ =0x0000fffe
	cmp r4, r0
	beq _08070D28
	cmp r4, r0
	bgt _08070C80
	cmp r4, 0
	beq _08070C8C
	b _08070D30
	.align 2, 0
_08070C78: .4byte 0x0201c000
_08070C7C: .4byte 0x0000fffe
_08070C80:
	ldr r0, _08070C88 @ =0x0000ffff
	cmp r4, r0
	beq _08070CC8
	b _08070D30
	.align 2, 0
_08070C88: .4byte 0x0000ffff
_08070C8C:
	ldr r0, [r7]
	movs r1, 0
	movs r2, 0
	bl GetEvolutionTargetSpecies
	lsls r0, 16
	lsrs r2, r0, 16
	cmp r2, 0
	beq _08070CC0
	ldr r1, _08070CB8 @ =gUnknown_03005E94
	ldr r0, _08070CBC @ =sub_80A53F8
	str r0, [r1]
	ldr r0, [r7]
	ldrb r3, [r7, 0x5]
	adds r1, r2, 0
	movs r2, 0x1
	bl BeginEvolutionScene
	adds r0, r6, 0
	bl DestroyTask
	b _08070D68
	.align 2, 0
_08070CB8: .4byte gUnknown_03005E94
_08070CBC: .4byte sub_80A53F8
_08070CC0:
	adds r0, r6, 0
	bl sub_8070D90
	b _08070D68
_08070CC8:
	ldr r0, [r7]
	ldr r1, _08070D08 @ =gStringVar1
	bl GetMonNickname
	ldr r0, _08070D0C @ =gStringVar2
	ldr r5, _08070D10 @ =word_2024E82
	ldrh r2, [r5]
	movs r1, 0xD
	muls r1, r2
	ldr r2, _08070D14 @ =gMoveNames
	adds r1, r2
	bl StringCopy
	ldr r4, _08070D18 @ =gStringVar4
	ldr r1, _08070D1C @ =gOtherText_WantsToLearn
	adds r0, r4, 0
	bl StringExpandPlaceholders
	adds r0, r4, 0
	movs r1, 0x1
	bl sub_806E834
	ldrh r0, [r5]
	strh r0, [r7, 0x8]
	ldr r1, _08070D20 @ =gTasks
	lsls r0, r6, 2
	adds r0, r6
	lsls r0, 3
	adds r0, r1
	ldr r1, _08070D24 @ =sub_806F358
	b _08070D66
	.align 2, 0
_08070D08: .4byte gStringVar1
_08070D0C: .4byte gStringVar2
_08070D10: .4byte word_2024E82
_08070D14: .4byte gMoveNames
_08070D18: .4byte gStringVar4
_08070D1C: .4byte gOtherText_WantsToLearn
_08070D20: .4byte gTasks
_08070D24: .4byte sub_806F358
_08070D28:
	adds r0, r6, 0
	bl sub_8070C54
	b _08070D68
_08070D30:
	ldr r0, _08070D70 @ =0x0201c000
	ldr r0, [r0]
	ldr r1, _08070D74 @ =gStringVar1
	bl GetMonNickname
	ldr r0, _08070D78 @ =gStringVar2
	movs r1, 0xD
	muls r1, r4
	ldr r2, _08070D7C @ =gMoveNames
	adds r1, r2
	bl StringCopy
	ldr r4, _08070D80 @ =gStringVar4
	ldr r1, _08070D84 @ =gOtherText_LearnedMove
	adds r0, r4, 0
	bl StringExpandPlaceholders
	adds r0, r4, 0
	movs r1, 0x1
	bl sub_806E834
	ldr r1, _08070D88 @ =gTasks
	lsls r0, r6, 2
	adds r0, r6
	lsls r0, 3
	adds r0, r1
	ldr r1, _08070D8C @ =Task_TeamMonTMMove3
_08070D66:
	str r1, [r0]
_08070D68:
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_08070D70: .4byte 0x0201c000
_08070D74: .4byte gStringVar1
_08070D78: .4byte gStringVar2
_08070D7C: .4byte gMoveNames
_08070D80: .4byte gStringVar4
_08070D84: .4byte gOtherText_LearnedMove
_08070D88: .4byte gTasks
_08070D8C: .4byte Task_TeamMonTMMove3
	thumb_func_end sub_8070C54

	thumb_func_start sub_8070D90
sub_8070D90: @ 8070D90
	push {r4,lr}
	lsls r0, 24
	lsrs r0, 24
	ldr r4, _08070DB4 @ =gTasks
	ldr r3, _08070DB8 @ =0x0201c000
	ldrb r2, [r3, 0x4]
	lsls r1, r2, 2
	adds r1, r2
	lsls r1, 3
	adds r1, r4
	ldr r2, [r3, 0x10]
	str r2, [r1]
	bl DestroyTask
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08070DB4: .4byte gTasks
_08070DB8: .4byte 0x0201c000
	thumb_func_end sub_8070D90

	thumb_func_start DoEvolutionStoneItemEffect
DoEvolutionStoneItemEffect: @ 8070DBC
	push {r4-r6,lr}
	adds r4, r0, 0
	adds r5, r2, 0
	lsls r4, 24
	lsrs r4, 24
	lsls r1, 16
	lsrs r6, r1, 16
	movs r0, 0x5
	bl PlaySE
	ldr r1, _08070E18 @ =gTasks
	lsls r0, r4, 2
	adds r0, r4
	lsls r0, 3
	adds r0, r1
	ldr r1, _08070E1C @ =TaskDummy
	str r1, [r0]
	adds r0, r4, 0
	adds r1, r6, 0
	adds r2, r5, 0
	bl sub_806E8D0
	ldr r1, _08070E20 @ =gUnknown_03005E94
	ldr r0, _08070E24 @ =sub_80A53F8
	str r0, [r1]
	ldr r0, _08070E28 @ =0x0201c000
	ldrb r0, [r0, 0x5]
	adds r1, r6, 0
	movs r2, 0
	bl ExecuteTableBasedItemEffect__
	lsls r0, 24
	cmp r0, 0
	beq _08070E38
	ldr r1, _08070E2C @ =gUnknown_0202E8F4
	movs r0, 0
	strb r0, [r1]
	ldr r0, _08070E30 @ =gOtherText_WontHaveAnyEffect
	movs r1, 0x1
	bl sub_806E834
	ldr r0, _08070E34 @ =sub_806FB0C
	movs r1, 0x5
	bl CreateTask
	b _08070E40
	.align 2, 0
_08070E18: .4byte gTasks
_08070E1C: .4byte TaskDummy
_08070E20: .4byte gUnknown_03005E94
_08070E24: .4byte sub_80A53F8
_08070E28: .4byte 0x0201c000
_08070E2C: .4byte gUnknown_0202E8F4
_08070E30: .4byte gOtherText_WontHaveAnyEffect
_08070E34: .4byte sub_806FB0C
_08070E38:
	adds r0, r6, 0
	movs r1, 0x1
	bl RemoveBagItem
_08070E40:
	pop {r4-r6}
	pop {r0}
	bx r0
	thumb_func_end DoEvolutionStoneItemEffect

	thumb_func_start GetItemEffectType
GetItemEffectType: @ 8070E48
	push {r4,r5,lr}
	lsls r0, 16
	lsrs r0, 16
	cmp r0, 0xAF
	bne _08070E5C
	ldr r4, _08070E58 @ =gSaveBlock1 + 0x3676
	b _08070E66
	.align 2, 0
_08070E58: .4byte gSaveBlock1 + 0x3676
_08070E5C:
	ldr r1, _08070E8C @ =gItemEffectTable
	subs r0, 0xD
	lsls r0, 2
	adds r0, r1
	ldr r4, [r0]
_08070E66:
	ldrb r1, [r4]
	movs r5, 0x3F
	adds r0, r5, 0
	ands r0, r1
	cmp r0, 0
	bne _08070E88
	ldrb r0, [r4, 0x1]
	cmp r0, 0
	bne _08070E88
	ldrb r0, [r4, 0x2]
	cmp r0, 0
	bne _08070E88
	ldrb r3, [r4, 0x3]
	movs r0, 0x80
	ands r0, r3
	cmp r0, 0
	beq _08070E90
_08070E88:
	movs r0, 0
	b _08070F8A
	.align 2, 0
_08070E8C: .4byte gItemEffectTable
_08070E90:
	movs r2, 0x40
	adds r0, r2, 0
	ands r0, r1
	cmp r0, 0
	beq _08070E9E
	movs r0, 0xA
	b _08070F8A
_08070E9E:
	adds r0, r2, 0
	ands r0, r3
	cmp r0, 0
	beq _08070EAA
	movs r0, 0x1
	b _08070F8A
_08070EAA:
	adds r2, r5, 0
	ands r2, r3
	cmp r2, 0
	bne _08070EB8
	lsrs r0, r1, 7
	cmp r0, 0
	beq _08070EFA
_08070EB8:
	cmp r2, 0x20
	bne _08070EC0
	movs r0, 0x4
	b _08070F8A
_08070EC0:
	cmp r2, 0x10
	bne _08070EC8
	movs r0, 0x3
	b _08070F8A
_08070EC8:
	cmp r2, 0x8
	bne _08070ED0
	movs r0, 0x5
	b _08070F8A
_08070ED0:
	cmp r2, 0x4
	bne _08070ED8
	movs r0, 0x6
	b _08070F8A
_08070ED8:
	cmp r2, 0x2
	bne _08070EE0
	movs r0, 0x7
	b _08070F8A
_08070EE0:
	cmp r2, 0x1
	bne _08070EE8
	movs r0, 0x8
	b _08070F8A
_08070EE8:
	lsrs r0, r1, 7
	cmp r0, 0
	beq _08070EF6
	cmp r2, 0
	bne _08070EF6
	movs r0, 0x9
	b _08070F8A
_08070EF6:
	movs r0, 0xB
	b _08070F8A
_08070EFA:
	ldrb r1, [r4, 0x4]
	movs r0, 0x44
	ands r0, r1
	adds r2, r1, 0
	cmp r0, 0
	beq _08070F0A
	movs r0, 0x2
	b _08070F8A
_08070F0A:
	movs r5, 0x2
	adds r0, r5, 0
	ands r0, r2
	cmp r0, 0
	beq _08070F18
	movs r0, 0xC
	b _08070F8A
_08070F18:
	movs r3, 0x1
	adds r0, r3, 0
	ands r0, r2
	cmp r0, 0
	beq _08070F26
	movs r0, 0xD
	b _08070F8A
_08070F26:
	ldrb r1, [r4, 0x5]
	movs r0, 0x8
	ands r0, r1
	cmp r0, 0
	beq _08070F34
	movs r0, 0xE
	b _08070F8A
_08070F34:
	movs r0, 0x4
	ands r0, r1
	cmp r0, 0
	beq _08070F40
	movs r0, 0xF
	b _08070F8A
_08070F40:
	adds r0, r5, 0
	ands r0, r1
	cmp r0, 0
	beq _08070F4C
	movs r0, 0x10
	b _08070F8A
_08070F4C:
	adds r0, r3, 0
	ands r0, r1
	cmp r0, 0
	beq _08070F58
	movs r0, 0x11
	b _08070F8A
_08070F58:
	movs r0, 0x80
	ands r0, r2
	cmp r0, 0
	beq _08070F64
	movs r0, 0x12
	b _08070F8A
_08070F64:
	movs r0, 0x20
	ands r0, r2
	cmp r0, 0
	beq _08070F70
	movs r0, 0x13
	b _08070F8A
_08070F70:
	movs r0, 0x10
	ands r0, r1
	cmp r0, 0
	beq _08070F7C
	movs r0, 0x14
	b _08070F8A
_08070F7C:
	movs r0, 0x18
	ands r0, r2
	cmp r0, 0
	bne _08070F88
	movs r0, 0x16
	b _08070F8A
_08070F88:
	movs r0, 0x15
_08070F8A:
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end GetItemEffectType

	thumb_func_start unref_sub_8070F90
unref_sub_8070F90: @ 8070F90
	push {lr}
	ldr r0, _08070FAC @ =0x00000801
	bl FlagSet
	movs r0, 0x80
	lsls r0, 4
	bl FlagSet
	ldr r0, _08070FB0 @ =0x00000802
	bl FlagSet
	pop {r0}
	bx r0
	.align 2, 0
_08070FAC: .4byte 0x00000801
_08070FB0: .4byte 0x00000802
	thumb_func_end unref_sub_8070F90

	.align 2, 0 @ Don't pad with nop.
