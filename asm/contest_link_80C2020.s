	.include "constants/gba_constants.inc"
	.include "constants/species_constants.inc"
	.include "asm/macros.inc"

	.syntax unified

	.text

	thumb_func_start sub_80C2020
sub_80C2020: @ 80C2020
	push {r4,r5,lr}
	movs r5, 0x80
	lsls r5, 19
	movs r0, 0x40
	strh r0, [r5]
	ldr r4, _080C20F0 @ =gWindowConfig_81E6FA0
	adds r0, r4, 0
	bl SetUpWindowConfig
	ldr r0, _080C20F4 @ =gMenuWindow
	adds r1, r4, 0
	bl InitWindowFromConfig
	ldr r1, _080C20F8 @ =REG_BG0CNT
	movs r2, 0xF8
	lsls r2, 6
	adds r0, r2, 0
	strh r0, [r1]
	adds r1, 0x2
	ldr r3, _080C20FC @ =0x00001803
	adds r0, r3, 0
	strh r0, [r1]
	adds r1, 0x2
	ldr r2, _080C2100 @ =0x00001c03
	adds r0, r2, 0
	strh r0, [r1]
	adds r1, 0x2
	ldr r3, _080C2104 @ =0x00003a03
	adds r0, r3, 0
	strh r0, [r1]
	ldr r0, _080C2108 @ =REG_MOSAIC
	movs r2, 0
	strh r2, [r0]
	adds r1, 0x3A
	ldr r3, _080C210C @ =0x00003f3f
	adds r0, r3, 0
	strh r0, [r1]
	adds r1, 0x2
	subs r3, 0x11
	adds r0, r3, 0
	strh r0, [r1]
	ldr r0, _080C2110 @ =REG_WIN0H
	strh r2, [r0]
	adds r0, 0x4
	strh r2, [r0]
	subs r0, 0x2
	strh r2, [r0]
	adds r0, 0x4
	strh r2, [r0]
	adds r0, 0xA
	strh r2, [r0]
	adds r0, 0x2
	strh r2, [r0]
	adds r0, 0x2
	strh r2, [r0]
	subs r0, 0x44
	strh r2, [r0]
	adds r0, 0x2
	strh r2, [r0]
	adds r0, 0x2
	strh r2, [r0]
	adds r0, 0x2
	strh r2, [r0]
	adds r0, 0x2
	strh r2, [r0]
	adds r0, 0x2
	strh r2, [r0]
	adds r0, 0x2
	strh r2, [r0]
	adds r0, 0x2
	strh r2, [r0]
	ldrh r0, [r5]
	movs r3, 0xFE
	lsls r3, 7
	adds r1, r3, 0
	orrs r0, r1
	strh r0, [r5]
	ldr r0, _080C2114 @ =gUnknown_030042A4
	strh r2, [r0]
	ldr r0, _080C2118 @ =gUnknown_030042A0
	strh r2, [r0]
	ldr r0, _080C211C @ =gUnknown_030042C0
	strh r2, [r0]
	ldr r0, _080C2120 @ =gUnknown_030041B4
	strh r2, [r0]
	ldr r0, _080C2124 @ =gUnknown_03004288
	strh r2, [r0]
	ldr r0, _080C2128 @ =gUnknown_03004280
	strh r2, [r0]
	ldr r0, _080C212C @ =gUnknown_030041B0
	strh r2, [r0]
	ldr r0, _080C2130 @ =gUnknown_030041B8
	strh r2, [r0]
	ldr r0, _080C2134 @ =gUnknown_030042C4
	strh r2, [r0]
	ldr r0, _080C2138 @ =gUnknown_03004240
	strh r2, [r0]
	ldr r0, _080C213C @ =gUnknown_03004200
	strh r2, [r0]
	ldr r0, _080C2140 @ =gUnknown_03004244
	strh r2, [r0]
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080C20F0: .4byte gWindowConfig_81E6FA0
_080C20F4: .4byte gMenuWindow
_080C20F8: .4byte REG_BG0CNT
_080C20FC: .4byte 0x00001803
_080C2100: .4byte 0x00001c03
_080C2104: .4byte 0x00003a03
_080C2108: .4byte REG_MOSAIC
_080C210C: .4byte 0x00003f3f
_080C2110: .4byte REG_WIN0H
_080C2114: .4byte gUnknown_030042A4
_080C2118: .4byte gUnknown_030042A0
_080C211C: .4byte gUnknown_030042C0
_080C2120: .4byte gUnknown_030041B4
_080C2124: .4byte gUnknown_03004288
_080C2128: .4byte gUnknown_03004280
_080C212C: .4byte gUnknown_030041B0
_080C2130: .4byte gUnknown_030041B8
_080C2134: .4byte gUnknown_030042C4
_080C2138: .4byte gUnknown_03004240
_080C213C: .4byte gUnknown_03004200
_080C2140: .4byte gUnknown_03004244
	thumb_func_end sub_80C2020

	thumb_func_start sub_80C2144
sub_80C2144: @ 80C2144
	push {r4-r7,lr}
	sub sp, 0x4
	movs r2, 0xC0
	lsls r2, 19
	movs r3, 0xC0
	lsls r3, 9
	ldr r0, _080C220C @ =gUnknown_08D1977C
	mov r12, r0
	movs r5, 0
	ldr r1, _080C2210 @ =0x040000d4
	movs r4, 0x80
	lsls r4, 5
	ldr r6, _080C2214 @ =0x85000400
	movs r7, 0x85
	lsls r7, 24
_080C2162:
	str r5, [sp]
	mov r0, sp
	str r0, [r1]
	str r2, [r1, 0x4]
	str r6, [r1, 0x8]
	ldr r0, [r1, 0x8]
	adds r2, r4
	subs r3, r4
	cmp r3, r4
	bhi _080C2162
	str r5, [sp]
	mov r0, sp
	str r0, [r1]
	str r2, [r1, 0x4]
	lsrs r0, r3, 2
	orrs r0, r7
	str r0, [r1, 0x8]
	ldr r0, [r1, 0x8]
	movs r1, 0xC0
	lsls r1, 19
	mov r0, r12
	bl LZDecompressVram
	ldr r0, _080C2218 @ =gUnknown_08D1A490
	ldr r1, _080C221C @ =0x0600d000
	bl LZDecompressVram
	ldr r0, _080C2220 @ =gUnknown_08D1A364
	ldr r1, _080C2224 @ =0x0600e000
	bl LZDecompressVram
	ldr r0, _080C2228 @ =gUnknown_08D1A250
	ldr r1, _080C222C @ =0x0600f000
	bl LZDecompressVram
	bl sub_80C37E4
	ldr r0, _080C2230 @ =gUnknown_08D1A618
	movs r2, 0x80
	lsls r2, 2
	movs r1, 0
	bl LoadCompressedPalette
	ldr r0, _080C2234 @ =gWindowConfig_81E6FA0
	bl LoadFontDefaultPalette
	movs r6, 0
_080C21C0:
	lsls r5, r6, 24
	lsrs r5, 24
	adds r0, r5, 0
	movs r1, 0x1
	bl sub_80C3990
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	adds r0, r5, 0
	movs r1, 0x1
	bl sub_80C39E4
	movs r5, 0
	lsls r1, r6, 1
	adds r2, r6, 0x1
	mov r12, r2
	lsls r4, 24
	asrs r7, r4, 24
	adds r1, r6
	lsls r1, 6
	lsls r4, r0, 24
_080C21EC:
	ldr r6, _080C2238 @ =0x000060b2
	cmp r5, r7
	bge _080C21F4
	adds r6, 0x2
_080C21F4:
	asrs r2, r4, 24
	adds r0, r2, 0
	cmp r2, 0
	bge _080C21FE
	negs r0, r2
_080C21FE:
	cmp r5, r0
	bge _080C2240
	ldr r3, _080C223C @ =0x000060a4
	cmp r2, 0
	bge _080C2242
	adds r3, 0x2
	b _080C2242
	.align 2, 0
_080C220C: .4byte gUnknown_08D1977C
_080C2210: .4byte 0x040000d4
_080C2214: .4byte 0x85000400
_080C2218: .4byte gUnknown_08D1A490
_080C221C: .4byte 0x0600d000
_080C2220: .4byte gUnknown_08D1A364
_080C2224: .4byte 0x0600e000
_080C2228: .4byte gUnknown_08D1A250
_080C222C: .4byte 0x0600f000
_080C2230: .4byte gUnknown_08D1A618
_080C2234: .4byte gWindowConfig_81E6FA0
_080C2238: .4byte 0x000060b2
_080C223C: .4byte 0x000060a4
_080C2240:
	ldr r3, _080C2264 @ =0x000060a2
_080C2242:
	ldr r2, _080C2268 @ =0x0600c166
	adds r0, r1, r2
	strh r6, [r0]
	adds r2, 0x40
	adds r0, r1, r2
	strh r3, [r0]
	adds r1, 0x2
	adds r5, 0x1
	cmp r5, 0x9
	ble _080C21EC
	mov r6, r12
	cmp r6, 0x3
	ble _080C21C0
	add sp, 0x4
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080C2264: .4byte 0x000060a2
_080C2268: .4byte 0x0600c166
	thumb_func_end sub_80C2144

	thumb_func_start sub_80C226C
sub_80C226C: @ 80C226C
	push {r4-r7,lr}
	sub sp, 0x4
	lsls r0, 24
	lsrs r5, r0, 24
	ldr r0, _080C2288 @ =gContestPlayerMonIndex
	ldrb r0, [r0]
	cmp r5, r0
	bne _080C2294
	ldr r0, _080C228C @ =gUnknown_020238CC
	ldr r1, _080C2290 @ =gUnknown_083D17DC
	bl StringCopy
	adds r2, r0, 0
	b _080C2296
	.align 2, 0
_080C2288: .4byte gContestPlayerMonIndex
_080C228C: .4byte gUnknown_020238CC
_080C2290: .4byte gUnknown_083D17DC
_080C2294:
	ldr r2, _080C22E8 @ =gUnknown_020238CC
_080C2296:
	movs r4, 0xFC
	strb r4, [r2]
	movs r0, 0x6
	strb r0, [r2, 0x1]
	movs r0, 0x4
	strb r0, [r2, 0x2]
	adds r2, 0x3
	lsls r6, r5, 6
	ldr r7, _080C22EC @ =gContestMons + 0x2
	adds r1, r6, r7
	adds r0, r2, 0
	bl StringCopy
	adds r2, r0, 0
	strb r4, [r2]
	movs r0, 0x13
	strb r0, [r2, 0x1]
	movs r0, 0x32
	strb r0, [r2, 0x2]
	adds r2, 0x3
	ldr r1, _080C22F0 @ =gUnknown_083D17E0
	adds r0, r2, 0
	bl StringCopy
	adds r2, r0, 0
	ldr r0, _080C22F4 @ =gIsLinkContest
	ldrb r1, [r0]
	movs r0, 0x1
	ands r0, r1
	cmp r0, 0
	beq _080C22FC
	lsls r4, r5, 3
	subs r1, r4, r5
	lsls r1, 2
	ldr r0, _080C22F8 @ =gLinkPlayers + 0x8
	adds r1, r0
	adds r0, r2, 0
	bl StringCopy
	b _080C230A
	.align 2, 0
_080C22E8: .4byte gUnknown_020238CC
_080C22EC: .4byte gContestMons + 0x2
_080C22F0: .4byte gUnknown_083D17E0
_080C22F4: .4byte gIsLinkContest
_080C22F8: .4byte gLinkPlayers + 0x8
_080C22FC:
	adds r1, r7, 0
	adds r1, 0xB
	adds r1, r6, r1
	adds r0, r2, 0
	bl StringCopy
	lsls r4, r5, 3
_080C230A:
	ldr r0, _080C2334 @ =gMenuWindow
	ldr r1, _080C2338 @ =gUnknown_020238CC
	adds r2, r4, r5
	lsls r2, 18
	ldr r3, _080C233C @ =0x03020000
	adds r2, r3
	lsrs r2, 16
	lsls r3, r5, 1
	adds r3, r5
	adds r3, 0x4
	lsls r3, 24
	lsrs r3, 24
	str r3, [sp]
	movs r3, 0x7
	bl sub_8003460
	add sp, 0x4
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080C2334: .4byte gMenuWindow
_080C2338: .4byte gUnknown_020238CC
_080C233C: .4byte 0x03020000
	thumb_func_end sub_80C226C

	thumb_func_start sub_80C2340
sub_80C2340: @ 80C2340
	push {r4,lr}
	movs r4, 0
_080C2344:
	lsls r0, r4, 24
	lsrs r0, 24
	bl sub_80C226C
	adds r4, 0x1
	cmp r4, 0x3
	ble _080C2344
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end sub_80C2340

	thumb_func_start sub_80C2358
sub_80C2358: @ 80C2358
	push {r4,r5,lr}
	sub sp, 0x4
	ldr r5, _080C240C @ =gPaletteFade
	ldrb r0, [r5, 0x8]
	movs r1, 0x80
	orrs r0, r1
	strb r0, [r5, 0x8]
	movs r0, 0
	bl SetVBlankCallback
	bl sub_80C2020
	bl dp12_8087EA4
	bl ResetPaletteFade
	bl ResetSpriteData
	bl ResetTasks
	bl FreeAllSpritePalettes
	bl sub_80C2144
	bl sub_80C310C
	movs r0, 0
	movs r1, 0x1
	bl sub_80C30D4
	bl sub_80C2340
	ldr r4, _080C2410 @ =0x02018000
	adds r0, r4, 0
	movs r1, 0
	movs r2, 0x18
	bl memset
	adds r0, r4, 0
	adds r0, 0x18
	movs r1, 0
	movs r2, 0x50
	bl memset
	bl sub_80C33DC
	movs r0, 0x1
	negs r0, r0
	movs r1, 0
	str r1, [sp]
	movs r2, 0x10
	movs r3, 0
	bl BeginNormalPaletteFade
	ldrb r1, [r5, 0x8]
	movs r0, 0x7F
	ands r0, r1
	strb r0, [r5, 0x8]
	ldr r0, _080C2414 @ =sub_80C24F4
	movs r1, 0x5
	bl CreateTask
	strb r0, [r4, 0x2]
	ldr r0, _080C2418 @ =sub_80C2430
	bl SetMainCallback2
	ldr r1, _080C241C @ =gUnknown_03004200
	movs r0, 0xF0
	strh r0, [r1]
	ldr r1, _080C2420 @ =gUnknown_03004244
	ldr r2, _080C2424 @ =0x000080a0
	adds r0, r2, 0
	strh r0, [r1]
	ldr r0, _080C2428 @ =sub_80C2F28
	movs r1, 0x14
	bl CreateTask
	bl sub_80C3F00
	movs r0, 0xDF
	lsls r0, 1
	bl PlayBGM
	ldr r0, _080C242C @ =sub_80C2448
	bl SetVBlankCallback
	add sp, 0x4
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080C240C: .4byte gPaletteFade
_080C2410: .4byte 0x02018000
_080C2414: .4byte sub_80C24F4
_080C2418: .4byte sub_80C2430
_080C241C: .4byte gUnknown_03004200
_080C2420: .4byte gUnknown_03004244
_080C2424: .4byte 0x000080a0
_080C2428: .4byte sub_80C2F28
_080C242C: .4byte sub_80C2448
	thumb_func_end sub_80C2358

	thumb_func_start sub_80C2430
sub_80C2430: @ 80C2430
	push {lr}
	bl AnimateSprites
	bl BuildOamBuffer
	bl RunTasks
	bl UpdatePaletteFade
	pop {r0}
	bx r0
	thumb_func_end sub_80C2430

	thumb_func_start sub_80C2448
sub_80C2448: @ 80C2448
	push {lr}
	ldr r1, _080C24C0 @ =REG_BG0HOFS
	ldr r0, _080C24C4 @ =gUnknown_030042A4
	ldrh r0, [r0]
	strh r0, [r1]
	adds r1, 0x2
	ldr r0, _080C24C8 @ =gUnknown_030042A0
	ldrh r0, [r0]
	strh r0, [r1]
	adds r1, 0x2
	ldr r0, _080C24CC @ =gUnknown_030042C0
	ldrh r0, [r0]
	strh r0, [r1]
	adds r1, 0x2
	ldr r0, _080C24D0 @ =gUnknown_030041B4
	ldrh r0, [r0]
	strh r0, [r1]
	adds r1, 0x2
	ldr r0, _080C24D4 @ =gUnknown_03004288
	ldrh r0, [r0]
	strh r0, [r1]
	adds r1, 0x2
	ldr r0, _080C24D8 @ =gUnknown_03004280
	ldrh r0, [r0]
	strh r0, [r1]
	adds r1, 0x2
	ldr r0, _080C24DC @ =gUnknown_030041B0
	ldrh r0, [r0]
	strh r0, [r1]
	adds r1, 0x2
	ldr r0, _080C24E0 @ =gUnknown_030041B8
	ldrh r0, [r0]
	strh r0, [r1]
	adds r1, 0x22
	ldr r0, _080C24E4 @ =gUnknown_030042C4
	ldrh r0, [r0]
	strh r0, [r1]
	adds r1, 0x4
	ldr r0, _080C24E8 @ =gUnknown_03004240
	ldrh r0, [r0]
	strh r0, [r1]
	subs r1, 0x2
	ldr r0, _080C24EC @ =gUnknown_03004200
	ldrh r0, [r0]
	strh r0, [r1]
	adds r1, 0x4
	ldr r0, _080C24F0 @ =gUnknown_03004244
	ldrh r0, [r0]
	strh r0, [r1]
	bl LoadOam
	bl ProcessSpriteCopyRequests
	bl TransferPlttBuffer
	bl sub_8089668
	pop {r0}
	bx r0
	.align 2, 0
_080C24C0: .4byte REG_BG0HOFS
_080C24C4: .4byte gUnknown_030042A4
_080C24C8: .4byte gUnknown_030042A0
_080C24CC: .4byte gUnknown_030042C0
_080C24D0: .4byte gUnknown_030041B4
_080C24D4: .4byte gUnknown_03004288
_080C24D8: .4byte gUnknown_03004280
_080C24DC: .4byte gUnknown_030041B0
_080C24E0: .4byte gUnknown_030041B8
_080C24E4: .4byte gUnknown_030042C4
_080C24E8: .4byte gUnknown_03004240
_080C24EC: .4byte gUnknown_03004200
_080C24F0: .4byte gUnknown_03004244
	thumb_func_end sub_80C2448

	thumb_func_start sub_80C24F4
sub_80C24F4: @ 80C24F4
	push {r4,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	adds r2, r4, 0
	ldr r0, _080C252C @ =gPaletteFade
	ldrb r1, [r0, 0x7]
	movs r0, 0x80
	ands r0, r1
	cmp r0, 0
	bne _080C254E
	ldr r0, _080C2530 @ =gIsLinkContest
	ldrb r1, [r0]
	movs r0, 0x1
	ands r0, r1
	cmp r0, 0
	beq _080C2540
	ldr r0, _080C2534 @ =gOtherText_LinkStandby
	bl sub_80C3698
	ldr r1, _080C2538 @ =gTasks
	lsls r0, r4, 2
	adds r0, r4
	lsls r0, 3
	adds r0, r1
	ldr r1, _080C253C @ =sub_80C255C
	str r1, [r0]
	b _080C254E
	.align 2, 0
_080C252C: .4byte gPaletteFade
_080C2530: .4byte gIsLinkContest
_080C2534: .4byte gOtherText_LinkStandby
_080C2538: .4byte gTasks
_080C253C: .4byte sub_80C255C
_080C2540:
	ldr r0, _080C2554 @ =gTasks
	lsls r1, r2, 2
	adds r1, r2
	lsls r1, 3
	adds r1, r0
	ldr r0, _080C2558 @ =sub_80C2600
	str r0, [r1]
_080C254E:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080C2554: .4byte gTasks
_080C2558: .4byte sub_80C2600
	thumb_func_end sub_80C24F4

	thumb_func_start sub_80C255C
sub_80C255C: @ 80C255C
	push {r4,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	ldr r0, _080C2594 @ =gReceivedRemoteLinkPlayers
	ldrb r0, [r0]
	cmp r0, 0
	beq _080C258C
	bl GetLinkPlayerCount
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x4
	bne _080C258C
	ldr r0, _080C2598 @ =sub_80C25A4
	movs r1, 0
	bl CreateTask
	ldr r1, _080C259C @ =gTasks
	lsls r0, r4, 2
	adds r0, r4
	lsls r0, 3
	adds r0, r1
	ldr r1, _080C25A0 @ =TaskDummy
	str r1, [r0]
_080C258C:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080C2594: .4byte gReceivedRemoteLinkPlayers
_080C2598: .4byte sub_80C25A4
_080C259C: .4byte gTasks
_080C25A0: .4byte TaskDummy
	thumb_func_end sub_80C255C

	thumb_func_start sub_80C25A4
sub_80C25A4: @ 80C25A4
	push {lr}
	lsls r0, 24
	lsrs r0, 24
	ldr r1, _080C25B8 @ =sub_80C89DC
	ldr r2, _080C25BC @ =sub_80C25C0
	bl SetTaskFuncWithFollowupFunc
	pop {r0}
	bx r0
	.align 2, 0
_080C25B8: .4byte sub_80C89DC
_080C25BC: .4byte sub_80C25C0
	thumb_func_end sub_80C25A4

	thumb_func_start sub_80C25C0
sub_80C25C0: @ 80C25C0
	push {r4,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	bl sub_8007ECC
	lsls r0, 24
	cmp r0, 0
	beq _080C25EC
	adds r0, r4, 0
	bl DestroyTask
	ldr r2, _080C25F4 @ =gTasks
	ldr r0, _080C25F8 @ =0x02018000
	ldrb r1, [r0, 0x2]
	lsls r0, r1, 2
	adds r0, r1
	lsls r0, 3
	adds r0, r2
	ldr r1, _080C25FC @ =sub_80C2600
	str r1, [r0]
	bl sub_80C3764
_080C25EC:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080C25F4: .4byte gTasks
_080C25F8: .4byte 0x02018000
_080C25FC: .4byte sub_80C2600
	thumb_func_end sub_80C25C0

	thumb_func_start sub_80C2600
sub_80C2600: @ 80C2600
	push {r4,r5,lr}
	lsls r0, 24
	lsrs r0, 24
	ldr r2, _080C2644 @ =gTasks
	lsls r1, r0, 2
	adds r1, r0
	lsls r1, 3
	adds r5, r1, r2
	ldrh r1, [r5, 0x8]
	movs r2, 0x8
	ldrsh r0, [r5, r2]
	cmp r0, 0
	bne _080C2654
	ldr r0, _080C2648 @ =sub_80C2F64
	movs r1, 0x14
	bl CreateTask
	ldr r4, _080C264C @ =gContestText_AnnounceResults
	ldr r0, _080C2650 @ =0x02018000
	ldrb r1, [r0]
	adds r0, r4, 0
	bl sub_80C3158
	adds r0, r4, 0
	bl sub_80C34AC
	lsls r0, 16
	asrs r0, 16
	movs r3, 0x88
	lsls r3, 3
	movs r1, 0x90
	movs r2, 0x78
	b _080C26A6
	.align 2, 0
_080C2644: .4byte gTasks
_080C2648: .4byte sub_80C2F64
_080C264C: .4byte gContestText_AnnounceResults
_080C2650: .4byte 0x02018000
_080C2654:
	cmp r0, 0x1
	bne _080C2668
	ldr r0, _080C2664 @ =0x02018000
	ldrb r0, [r0, 0x4]
	cmp r0, 0
	bne _080C26D4
	b _080C267C
	.align 2, 0
_080C2664: .4byte 0x02018000
_080C2668:
	cmp r0, 0x2
	bne _080C2684
	ldrh r0, [r5, 0xA]
	adds r0, 0x1
	strh r0, [r5, 0xA]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x15
	bne _080C26D4
	movs r0, 0
_080C267C:
	strh r0, [r5, 0xA]
	adds r0, r1, 0x1
	strh r0, [r5, 0x8]
	b _080C26D4
_080C2684:
	cmp r0, 0x3
	bne _080C26C0
	ldr r4, _080C26B4 @ =gContestText_PreliminaryResults
	ldr r0, _080C26B8 @ =0x02018000
	ldrb r1, [r0]
	adds r0, r4, 0
	bl sub_80C3158
	adds r0, r4, 0
	bl sub_80C34AC
	lsls r0, 16
	asrs r0, 16
	ldr r2, _080C26BC @ =0x0000ffff
	movs r3, 0x88
	lsls r3, 3
	movs r1, 0x90
_080C26A6:
	bl sub_80C34CC
	ldrh r0, [r5, 0x8]
	adds r0, 0x1
	strh r0, [r5, 0x8]
	b _080C26D4
	.align 2, 0
_080C26B4: .4byte gContestText_PreliminaryResults
_080C26B8: .4byte 0x02018000
_080C26BC: .4byte 0x0000ffff
_080C26C0:
	cmp r0, 0x4
	bne _080C26D4
	ldr r0, _080C26DC @ =0x02018000
	ldrb r0, [r0, 0x4]
	cmp r0, 0x2
	bne _080C26D4
	movs r0, 0
	strh r0, [r5, 0x8]
	ldr r0, _080C26E0 @ =sub_80C26E4
	str r0, [r5]
_080C26D4:
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080C26DC: .4byte 0x02018000
_080C26E0: .4byte sub_80C26E4
	thumb_func_end sub_80C2600

	thumb_func_start sub_80C26E4
sub_80C26E4: @ 80C26E4
	push {r4,r5,lr}
	lsls r0, 24
	lsrs r0, 24
	ldr r2, _080C2708 @ =gTasks
	lsls r1, r0, 2
	adds r1, r0
	lsls r1, 3
	adds r4, r1, r2
	movs r1, 0x8
	ldrsh r0, [r4, r1]
	cmp r0, 0x1
	beq _080C2744
	cmp r0, 0x1
	bgt _080C270C
	cmp r0, 0
	beq _080C2712
	b _080C2766
	.align 2, 0
_080C2708: .4byte gTasks
_080C270C:
	cmp r0, 0x2
	beq _080C2754
	b _080C2766
_080C2712:
	ldr r5, _080C2738 @ =0x02018000
	ldrb r0, [r5, 0xA]
	cmp r0, 0
	bne _080C2766
	ldrh r1, [r4, 0xC]
	adds r0, r1, 0x1
	strh r0, [r4, 0xC]
	lsls r1, 24
	lsrs r1, 24
	movs r0, 0
	bl sub_80C40D4
	ldrb r0, [r5, 0x14]
	cmp r0, 0
	bne _080C273C
	movs r0, 0x2
	strh r0, [r4, 0x8]
	b _080C2766
	.align 2, 0
_080C2738: .4byte 0x02018000
_080C273C:
	ldrh r0, [r4, 0x8]
	adds r0, 0x1
	strh r0, [r4, 0x8]
	b _080C2766
_080C2744:
	ldr r0, _080C2750 @ =0x02018000
	ldrb r0, [r0, 0x14]
	cmp r0, 0
	bne _080C2766
	strh r0, [r4, 0x8]
	b _080C2766
	.align 2, 0
_080C2750: .4byte 0x02018000
_080C2754:
	movs r0, 0x88
	lsls r0, 3
	bl sub_80C3520
	movs r0, 0
	strh r0, [r4, 0x8]
	strh r0, [r4, 0xC]
	ldr r0, _080C276C @ =sub_80C2770
	str r0, [r4]
_080C2766:
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080C276C: .4byte sub_80C2770
	thumb_func_end sub_80C26E4

	thumb_func_start sub_80C2770
sub_80C2770: @ 80C2770
	push {r4,r5,lr}
	lsls r0, 24
	lsrs r2, r0, 24
	adds r4, r2, 0
	ldr r5, _080C27BC @ =0x02018000
	ldrb r3, [r5, 0x4]
	cmp r3, 0
	bne _080C27CC
	ldr r1, _080C27C0 @ =gTasks
	lsls r0, r2, 2
	adds r0, r2
	lsls r0, 3
	adds r1, r0, r1
	ldrh r0, [r1, 0xA]
	adds r0, 0x1
	strh r0, [r1, 0xA]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x15
	bne _080C27DE
	strh r3, [r1, 0xA]
	ldr r4, _080C27C4 @ =gContestText_Round2Results
	ldrb r1, [r5]
	adds r0, r4, 0
	bl sub_80C3158
	adds r0, r4, 0
	bl sub_80C34AC
	lsls r0, 16
	asrs r0, 16
	ldr r2, _080C27C8 @ =0x0000ffff
	movs r3, 0x88
	lsls r3, 3
	movs r1, 0x90
	bl sub_80C34CC
	b _080C27DE
	.align 2, 0
_080C27BC: .4byte 0x02018000
_080C27C0: .4byte gTasks
_080C27C4: .4byte gContestText_Round2Results
_080C27C8: .4byte 0x0000ffff
_080C27CC:
	cmp r3, 0x2
	bne _080C27DE
	ldr r0, _080C27E4 @ =gTasks
	lsls r1, r4, 2
	adds r1, r4
	lsls r1, 3
	adds r1, r0
	ldr r0, _080C27E8 @ =sub_80C27EC
	str r0, [r1]
_080C27DE:
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080C27E4: .4byte gTasks
_080C27E8: .4byte sub_80C27EC
	thumb_func_end sub_80C2770

	thumb_func_start sub_80C27EC
sub_80C27EC: @ 80C27EC
	push {r4,r5,lr}
	lsls r0, 24
	lsrs r0, 24
	ldr r2, _080C2810 @ =gTasks
	lsls r1, r0, 2
	adds r1, r0
	lsls r1, 3
	adds r4, r1, r2
	movs r1, 0x8
	ldrsh r0, [r4, r1]
	cmp r0, 0x1
	beq _080C284C
	cmp r0, 0x1
	bgt _080C2814
	cmp r0, 0
	beq _080C281A
	b _080C286C
	.align 2, 0
_080C2810: .4byte gTasks
_080C2814:
	cmp r0, 0x2
	beq _080C285C
	b _080C286C
_080C281A:
	ldr r5, _080C2840 @ =0x02018000
	ldrb r0, [r5, 0xA]
	cmp r0, 0
	bne _080C286C
	ldrh r1, [r4, 0xC]
	adds r0, r1, 0x1
	strh r0, [r4, 0xC]
	lsls r1, 24
	lsrs r1, 24
	movs r0, 0x1
	bl sub_80C40D4
	ldrb r0, [r5, 0x14]
	cmp r0, 0
	bne _080C2844
	movs r0, 0x2
	strh r0, [r4, 0x8]
	b _080C286C
	.align 2, 0
_080C2840: .4byte 0x02018000
_080C2844:
	ldrh r0, [r4, 0x8]
	adds r0, 0x1
	strh r0, [r4, 0x8]
	b _080C286C
_080C284C:
	ldr r0, _080C2858 @ =0x02018000
	ldrb r0, [r0, 0x14]
	cmp r0, 0
	bne _080C286C
	strh r0, [r4, 0x8]
	b _080C286C
	.align 2, 0
_080C2858: .4byte 0x02018000
_080C285C:
	movs r0, 0x88
	lsls r0, 3
	bl sub_80C3520
	movs r0, 0
	strh r0, [r4, 0x8]
	ldr r0, _080C2874 @ =sub_80C2878
	str r0, [r4]
_080C286C:
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080C2874: .4byte sub_80C2878
	thumb_func_end sub_80C27EC

	thumb_func_start sub_80C2878
sub_80C2878: @ 80C2878
	push {r4-r7,lr}
	sub sp, 0x64
	lsls r0, 24
	lsrs r5, r0, 24
	ldr r1, _080C28A0 @ =gTasks
	lsls r0, r5, 2
	adds r0, r5
	lsls r0, 3
	adds r0, r1
	movs r2, 0x8
	ldrsh r0, [r0, r2]
	adds r2, r1, 0
	cmp r0, 0x5
	bls _080C2896
	b _080C2A80
_080C2896:
	lsls r0, 2
	ldr r1, _080C28A4 @ =_080C28A8
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_080C28A0: .4byte gTasks
_080C28A4: .4byte _080C28A8
	.align 2, 0
_080C28A8:
	.4byte _080C28C0
	.4byte _080C28E0
	.4byte _080C28FE
	.4byte _080C2938
	.4byte _080C299C
	.4byte _080C2A70
_080C28C0:
	ldr r0, _080C28DC @ =0x02018000
	ldrb r0, [r0, 0x4]
	cmp r0, 0
	beq _080C28CA
	b _080C2A80
_080C28CA:
	lsls r0, r5, 2
	adds r0, r5
	lsls r0, 3
	adds r0, r2
	ldrh r1, [r0, 0x8]
	adds r1, 0x1
	strh r1, [r0, 0x8]
	b _080C2A80
	.align 2, 0
_080C28DC: .4byte 0x02018000
_080C28E0:
	lsls r0, r5, 2
	adds r0, r5
	lsls r0, 3
	adds r1, r0, r2
	ldrh r0, [r1, 0xA]
	adds r0, 0x1
	strh r0, [r1, 0xA]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x1F
	beq _080C28F8
	b _080C2A80
_080C28F8:
	movs r0, 0
	strh r0, [r1, 0xA]
	b _080C2A4A
_080C28FE:
	movs r4, 0
	lsls r6, r5, 2
	ldr r7, _080C292C @ =gTasks
_080C2904:
	ldr r0, _080C2930 @ =sub_80C3A5C
	movs r1, 0xA
	bl CreateTask
	lsls r0, 24
	lsrs r0, 24
	lsls r1, r0, 2
	adds r1, r0
	lsls r1, 3
	adds r1, r7
	ldr r0, _080C2934 @ =gUnknown_02038690
	adds r0, r4, r0
	ldrb r0, [r0]
	strh r0, [r1, 0x8]
	strh r4, [r1, 0xA]
	adds r4, 0x1
	cmp r4, 0x3
	ble _080C2904
	b _080C2A42
	.align 2, 0
_080C292C: .4byte gTasks
_080C2930: .4byte sub_80C3A5C
_080C2934: .4byte gUnknown_02038690
_080C2938:
	ldr r0, _080C2990 @ =0x02018000
	ldrb r0, [r0, 0x5]
	cmp r0, 0x4
	beq _080C2942
	b _080C2A80
_080C2942:
	lsls r0, r5, 2
	adds r0, r5
	lsls r0, 3
	adds r4, r0, r2
	ldrh r0, [r4, 0xA]
	adds r0, 0x1
	strh r0, [r4, 0xA]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x1F
	beq _080C295A
	b _080C2A80
_080C295A:
	movs r0, 0
	strh r0, [r4, 0xA]
	ldr r0, _080C2994 @ =sub_80C3B30
	movs r1, 0xA
	bl CreateTask
	ldrh r0, [r4, 0x8]
	adds r0, 0x1
	strh r0, [r4, 0x8]
	movs r4, 0
	ldr r1, _080C2998 @ =gUnknown_02038690
	ldrb r0, [r1]
	cmp r0, 0
	beq _080C2984
_080C2976:
	adds r4, 0x1
	cmp r4, 0x3
	bgt _080C2984
	adds r0, r4, r1
	ldrb r0, [r0]
	cmp r0, 0
	bne _080C2976
_080C2984:
	lsls r0, r4, 24
	lsrs r0, 24
	movs r1, 0xE
	bl sub_80C3E60
	b _080C2A80
	.align 2, 0
_080C2990: .4byte 0x02018000
_080C2994: .4byte sub_80C3B30
_080C2998: .4byte gUnknown_02038690
_080C299C:
	lsls r1, r5, 2
	adds r0, r1, r5
	lsls r0, 3
	adds r2, r0, r2
	ldrh r0, [r2, 0xA]
	adds r0, 0x1
	strh r0, [r2, 0xA]
	lsls r0, 16
	asrs r0, 16
	adds r6, r1, 0
	cmp r0, 0x15
	bne _080C2A80
	movs r0, 0
	strh r0, [r2, 0xA]
	movs r4, 0
	ldr r2, _080C29F4 @ =gUnknown_02038690
	ldrb r0, [r2]
	ldr r1, _080C29F8 @ =gIsLinkContest
	ldr r3, _080C29FC @ =gStringVar1
	cmp r0, 0
	beq _080C29D4
_080C29C6:
	adds r4, 0x1
	cmp r4, 0x3
	bgt _080C29D4
	adds r0, r4, r2
	ldrb r0, [r0]
	cmp r0, 0
	bne _080C29C6
_080C29D4:
	ldrb r1, [r1]
	movs r0, 0x1
	ands r0, r1
	cmp r0, 0
	beq _080C2A04
	lsls r1, r4, 3
	subs r1, r4
	lsls r1, 2
	ldr r0, _080C2A00 @ =gLinkPlayers + 0x8
	adds r1, r0
	adds r0, r3, 0
	bl StringCopy
	lsls r4, 6
	b _080C2A10
	.align 2, 0
_080C29F4: .4byte gUnknown_02038690
_080C29F8: .4byte gIsLinkContest
_080C29FC: .4byte gStringVar1
_080C2A00: .4byte gLinkPlayers + 0x8
_080C2A04:
	lsls r4, 6
	ldr r1, _080C2A54 @ =gUnknown_0203857D
	adds r1, r4, r1
	adds r0, r3, 0
	bl StringCopy
_080C2A10:
	ldr r0, _080C2A58 @ =gStringVar2
	ldr r1, _080C2A5C @ =gContestMons + 0x2
	adds r1, r4, r1
	bl StringCopy
	ldr r1, _080C2A60 @ =gContestText_PokeWon
	mov r0, sp
	bl StringExpandPlaceholders
	ldr r0, _080C2A64 @ =0x02018000
	ldrb r1, [r0]
	mov r0, sp
	bl sub_80C3158
	mov r0, sp
	bl sub_80C34AC
	lsls r0, 16
	asrs r0, 16
	ldr r2, _080C2A68 @ =0x0000ffff
	movs r3, 0x88
	lsls r3, 3
	movs r1, 0x90
	bl sub_80C34CC
_080C2A42:
	ldr r0, _080C2A6C @ =gTasks
	adds r1, r6, r5
	lsls r1, 3
	adds r1, r0
_080C2A4A:
	ldrh r0, [r1, 0x8]
	adds r0, 0x1
	strh r0, [r1, 0x8]
	b _080C2A80
	.align 2, 0
_080C2A54: .4byte gUnknown_0203857D
_080C2A58: .4byte gStringVar2
_080C2A5C: .4byte gContestMons + 0x2
_080C2A60: .4byte gContestText_PokeWon
_080C2A64: .4byte 0x02018000
_080C2A68: .4byte 0x0000ffff
_080C2A6C: .4byte gTasks
_080C2A70:
	lsls r0, r5, 2
	adds r0, r5
	lsls r0, 3
	adds r0, r2
	movs r1, 0
	strh r1, [r0, 0x8]
	ldr r1, _080C2A88 @ =sub_80C2A8C
	str r1, [r0]
_080C2A80:
	add sp, 0x64
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080C2A88: .4byte sub_80C2A8C
	thumb_func_end sub_80C2878

	thumb_func_start sub_80C2A8C
sub_80C2A8C: @ 80C2A8C
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	sub sp, 0x10
	lsls r0, 24
	lsrs r7, r0, 24
	ldr r1, _080C2ABC @ =gTasks
	lsls r0, r7, 2
	adds r0, r7
	lsls r0, 3
	adds r0, r1
	movs r2, 0x8
	ldrsh r0, [r0, r2]
	adds r4, r1, 0
	cmp r0, 0x5
	bls _080C2AB2
	b _080C2D04
_080C2AB2:
	lsls r0, 2
	ldr r1, _080C2AC0 @ =_080C2AC4
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_080C2ABC: .4byte gTasks
_080C2AC0: .4byte _080C2AC4
	.align 2, 0
_080C2AC4:
	.4byte _080C2ADC
	.4byte _080C2C04
	.4byte _080C2C54
	.4byte _080C2C64
	.4byte _080C2CA8
	.4byte _080C2CE8
_080C2ADC:
	ldr r1, _080C2BC4 @ =gUnknown_030042C4
	movs r0, 0xF0
	strh r0, [r1]
	ldr r1, _080C2BC8 @ =gUnknown_03004240
	ldr r3, _080C2BCC @ =0x00005050
	adds r0, r3, 0
	strh r0, [r1]
	movs r1, 0
	ldr r3, _080C2BD0 @ =gUnknown_02038690
	ldrb r0, [r3]
	lsls r4, r7, 2
	mov r10, r4
	ldr r2, _080C2BD4 @ =gContestMons
	ldr r5, _080C2BD8 @ =gMonFrontPicTable
	mov r12, r5
	ldr r4, _080C2BDC @ =gMonFrontPicCoords
	mov r8, r4
	ldr r5, _080C2BE0 @ =gUnknown_081FAF4C
	mov r9, r5
	cmp r0, 0
	beq _080C2B14
_080C2B06:
	adds r1, 0x1
	cmp r1, 0x3
	bgt _080C2B14
	adds r0, r1, r3
	ldrb r0, [r0]
	cmp r0, 0
	bne _080C2B06
_080C2B14:
	lsls r1, 6
	adds r0, r1, r2
	ldrh r6, [r0]
	adds r0, r2, 0
	adds r0, 0x38
	adds r0, r1, r0
	ldr r4, [r0]
	adds r0, r2, 0
	adds r0, 0x3C
	adds r1, r0
	ldr r1, [r1]
	str r1, [sp, 0xC]
	lsls r0, r6, 3
	add r0, r12
	lsls r2, r6, 2
	add r2, r8
	ldrb r1, [r2]
	ldrb r2, [r2, 0x1]
	mov r5, r9
	ldr r3, [r5, 0x4]
	str r3, [sp]
	str r6, [sp, 0x4]
	str r4, [sp, 0x8]
	ldr r3, _080C2BE4 @ =0x02000000
	bl HandleLoadSpecialPokePic
	adds r0, r6, 0
	ldr r1, [sp, 0xC]
	adds r2, r4, 0
	bl sub_80409C8
	adds r4, r0, 0
	bl LoadCompressedObjectPalette
	adds r0, r6, 0
	movs r1, 0x1
	bl GetMonSpriteTemplate_803C56C
	ldr r0, _080C2BE8 @ =gUnknown_02024E8C
	ldrh r1, [r4, 0x4]
	strh r1, [r0, 0x2]
	movs r1, 0x88
	lsls r1, 1
	movs r2, 0x50
	movs r3, 0xA
	bl CreateSprite
	lsls r0, 24
	lsrs r0, 24
	ldr r5, _080C2BEC @ =gSprites
	lsls r2, r0, 4
	adds r2, r0
	lsls r2, 2
	adds r3, r2, r5
	strh r6, [r3, 0x30]
	ldrb r4, [r3, 0x5]
	movs r1, 0xD
	negs r1, r1
	ands r1, r4
	strb r1, [r3, 0x5]
	adds r5, 0x1C
	adds r2, r5
	ldr r1, _080C2BF0 @ =sub_80C3C44
	str r1, [r2]
	ldr r2, _080C2BE4 @ =0x02000000
	movs r3, 0xC0
	lsls r3, 9
	adds r1, r2, r3
	strb r0, [r1, 0x8]
	ldr r0, _080C2BF4 @ =gUnknown_083D17CC
	bl LoadCompressedObjectPic
	ldr r0, _080C2BF8 @ =gUnknown_083D17D4
	bl LoadCompressedObjectPalette
	ldr r0, _080C2BFC @ =sub_80C3D04
	movs r1, 0xA
	bl CreateTask
	ldr r0, _080C2C00 @ =gTasks
	mov r4, r10
	adds r1, r4, r7
	lsls r1, 3
	adds r1, r0
	ldrh r0, [r1, 0x8]
	adds r0, 0x1
	strh r0, [r1, 0x8]
	b _080C2D04
	.align 2, 0
_080C2BC4: .4byte gUnknown_030042C4
_080C2BC8: .4byte gUnknown_03004240
_080C2BCC: .4byte 0x00005050
_080C2BD0: .4byte gUnknown_02038690
_080C2BD4: .4byte gContestMons
_080C2BD8: .4byte gMonFrontPicTable
_080C2BDC: .4byte gMonFrontPicCoords
_080C2BE0: .4byte gUnknown_081FAF4C
_080C2BE4: .4byte 0x02000000
_080C2BE8: .4byte gUnknown_02024E8C
_080C2BEC: .4byte gSprites
_080C2BF0: .4byte sub_80C3C44
_080C2BF4: .4byte gUnknown_083D17CC
_080C2BF8: .4byte gUnknown_083D17D4
_080C2BFC: .4byte sub_80C3D04
_080C2C00: .4byte gTasks
_080C2C04:
	lsls r0, r7, 2
	adds r0, r7
	lsls r0, 3
	adds r4, r0, r4
	ldrh r0, [r4, 0xE]
	adds r0, 0x1
	strh r0, [r4, 0xE]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x1
	bne _080C2D04
	movs r0, 0
	strh r0, [r4, 0xE]
	ldrh r0, [r4, 0xC]
	adds r0, 0x2
	strh r0, [r4, 0xC]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x20
	ble _080C2C30
	movs r0, 0x20
	strh r0, [r4, 0xC]
_080C2C30:
	ldrb r2, [r4, 0xC]
	ldr r3, _080C2C50 @ =gUnknown_03004240
	movs r0, 0x50
	subs r0, r2
	lsls r0, 8
	adds r1, r2, 0
	adds r1, 0x50
	orrs r0, r1
	strh r0, [r3]
	cmp r2, 0x20
	bne _080C2D04
	ldrh r0, [r4, 0x8]
	adds r0, 0x1
	strh r0, [r4, 0x8]
	b _080C2D04
	.align 2, 0
_080C2C50: .4byte gUnknown_03004240
_080C2C54:
	ldr r0, _080C2C60 @ =0x02018000
	ldrb r0, [r0, 0x6]
	cmp r0, 0x1
	bne _080C2D04
	b _080C2CD0
	.align 2, 0
_080C2C60: .4byte 0x02018000
_080C2C64:
	lsls r0, r7, 2
	adds r0, r7
	lsls r0, 3
	adds r3, r0, r4
	ldrh r0, [r3, 0xA]
	adds r0, 0x1
	strh r0, [r3, 0xA]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x79
	bne _080C2D04
	movs r0, 0
	strh r0, [r3, 0xA]
	ldr r2, _080C2C9C @ =gSprites
	ldr r0, _080C2CA0 @ =0x02018000
	ldrb r1, [r0, 0x8]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r2, 0x1C
	adds r0, r2
	ldr r1, _080C2CA4 @ =sub_80C3CB8
	str r1, [r0]
	ldrh r0, [r3, 0x8]
	adds r0, 0x1
	strh r0, [r3, 0x8]
	b _080C2D04
	.align 2, 0
_080C2C9C: .4byte gSprites
_080C2CA0: .4byte 0x02018000
_080C2CA4: .4byte sub_80C3CB8
_080C2CA8:
	ldr r0, _080C2CE0 @ =0x02018000
	ldrb r0, [r0, 0x6]
	cmp r0, 0x2
	bne _080C2D04
	ldr r3, _080C2CE4 @ =gUnknown_03004240
	ldrh r0, [r3]
	lsrs r2, r0, 8
	adds r0, r2, 0x2
	lsls r0, 24
	lsrs r2, r0, 24
	cmp r2, 0x50
	bls _080C2CC2
	movs r2, 0x50
_080C2CC2:
	lsls r1, r2, 8
	movs r0, 0xA0
	subs r0, r2
	orrs r1, r0
	strh r1, [r3]
	cmp r2, 0x50
	bne _080C2D04
_080C2CD0:
	lsls r0, r7, 2
	adds r0, r7
	lsls r0, 3
	adds r0, r4
	ldrh r1, [r0, 0x8]
	adds r1, 0x1
	strh r1, [r0, 0x8]
	b _080C2D04
	.align 2, 0
_080C2CE0: .4byte 0x02018000
_080C2CE4: .4byte gUnknown_03004240
_080C2CE8:
	ldr r2, _080C2D14 @ =0x02018000
	ldrb r0, [r2, 0x6]
	cmp r0, 0x2
	bne _080C2D04
	movs r1, 0
	movs r0, 0x1
	strb r0, [r2, 0x9]
	lsls r0, r7, 2
	adds r0, r7
	lsls r0, 3
	adds r0, r4
	strh r1, [r0, 0x8]
	ldr r1, _080C2D18 @ =sub_80C2D1C
	str r1, [r0]
_080C2D04:
	add sp, 0x10
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080C2D14: .4byte 0x02018000
_080C2D18: .4byte sub_80C2D1C
	thumb_func_end sub_80C2A8C

	thumb_func_start sub_80C2D1C
sub_80C2D1C: @ 80C2D1C
	push {r4-r7,lr}
	lsls r0, 24
	lsrs r7, r0, 24
	ldr r0, _080C2D6C @ =gMain
	ldrh r1, [r0, 0x2E]
	movs r2, 0x1
	adds r0, r2, 0
	ands r0, r1
	cmp r0, 0
	beq _080C2D66
	ldr r0, _080C2D70 @ =gIsLinkContest
	ldrb r1, [r0]
	adds r0, r2, 0
	ands r0, r1
	lsls r6, r7, 2
	cmp r0, 0
	bne _080C2D5A
	ldr r5, _080C2D74 @ =gContestMons
	movs r4, 0x3
_080C2D42:
	ldrh r0, [r5]
	bl SpeciesToNationalPokedexNum
	lsls r0, 16
	lsrs r0, 16
	movs r1, 0x2
	bl sub_8090D90
	adds r5, 0x40
	subs r4, 0x1
	cmp r4, 0
	bge _080C2D42
_080C2D5A:
	ldr r0, _080C2D78 @ =gTasks
	adds r1, r6, r7
	lsls r1, 3
	adds r1, r0
	ldr r0, _080C2D7C @ =sub_80C2D80
	str r0, [r1]
_080C2D66:
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080C2D6C: .4byte gMain
_080C2D70: .4byte gIsLinkContest
_080C2D74: .4byte gContestMons
_080C2D78: .4byte gTasks
_080C2D7C: .4byte sub_80C2D80
	thumb_func_end sub_80C2D1C

	thumb_func_start sub_80C2D80
sub_80C2D80: @ 80C2D80
	push {r4,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	ldr r0, _080C2DAC @ =gIsLinkContest
	ldrb r1, [r0]
	movs r0, 0x1
	ands r0, r1
	cmp r0, 0
	beq _080C2DBC
	ldr r0, _080C2DB0 @ =gOtherText_LinkStandby
	bl sub_80C3698
	bl sub_800832C
	ldr r1, _080C2DB4 @ =gTasks
	lsls r0, r4, 2
	adds r0, r4
	lsls r0, 3
	adds r0, r1
	ldr r1, _080C2DB8 @ =sub_80C2DD8
	str r1, [r0]
	b _080C2DCA
	.align 2, 0
_080C2DAC: .4byte gIsLinkContest
_080C2DB0: .4byte gOtherText_LinkStandby
_080C2DB4: .4byte gTasks
_080C2DB8: .4byte sub_80C2DD8
_080C2DBC:
	ldr r0, _080C2DD0 @ =gTasks
	lsls r1, r4, 2
	adds r1, r4
	lsls r1, 3
	adds r1, r0
	ldr r0, _080C2DD4 @ =sub_80C2E14
	str r0, [r1]
_080C2DCA:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080C2DD0: .4byte gTasks
_080C2DD4: .4byte sub_80C2E14
	thumb_func_end sub_80C2D80

	thumb_func_start sub_80C2DD8
sub_80C2DD8: @ 80C2DD8
	push {r4,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	ldr r0, _080C2E04 @ =gReceivedRemoteLinkPlayers
	ldrb r1, [r0]
	cmp r1, 0
	bne _080C2DFC
	ldr r0, _080C2E08 @ =gIsLinkContest
	strb r1, [r0]
	bl sub_80C3764
	ldr r1, _080C2E0C @ =gTasks
	lsls r0, r4, 2
	adds r0, r4
	lsls r0, 3
	adds r0, r1
	ldr r1, _080C2E10 @ =sub_80C2E14
	str r1, [r0]
_080C2DFC:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080C2E04: .4byte gReceivedRemoteLinkPlayers
_080C2E08: .4byte gIsLinkContest
_080C2E0C: .4byte gTasks
_080C2E10: .4byte sub_80C2E14
	thumb_func_end sub_80C2DD8

	thumb_func_start sub_80C2E14
sub_80C2E14: @ 80C2E14
	push {r4-r6,lr}
	sub sp, 0x4
	adds r5, r0, 0
	lsls r5, 24
	lsrs r5, 24
	ldr r1, _080C2E80 @ =gUnknown_02038690
	ldr r0, _080C2E84 @ =gContestPlayerMonIndex
	ldrb r0, [r0]
	adds r0, r1
	ldrb r0, [r0]
	bl sub_80BE284
	movs r0, 0x2
	bl sub_810FB10
	ldr r0, _080C2E88 @ =gScriptContestRank
	ldrb r0, [r0]
	bl sub_80B2A7C
	movs r0, 0xFE
	bl sub_80B2A7C
	ldr r4, _080C2E8C @ =0x02000000
	ldr r0, _080C2E90 @ =0x00015ddf
	adds r1, r4, r0
	movs r6, 0
	movs r0, 0x1
	strb r0, [r1]
	movs r0, 0xFE
	movs r1, 0
	bl sub_80B2C4C
	ldr r1, _080C2E94 @ =0x00015dde
	adds r4, r1
	strb r0, [r4]
	str r6, [sp]
	movs r0, 0xFF
	movs r1, 0
	movs r2, 0
	movs r3, 0x10
	bl BeginHardwarePaletteFade
	ldr r1, _080C2E98 @ =gTasks
	lsls r0, r5, 2
	adds r0, r5
	lsls r0, 3
	adds r0, r1
	ldr r1, _080C2E9C @ =sub_80C2EA0
	str r1, [r0]
	add sp, 0x4
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_080C2E80: .4byte gUnknown_02038690
_080C2E84: .4byte gContestPlayerMonIndex
_080C2E88: .4byte gScriptContestRank
_080C2E8C: .4byte 0x02000000
_080C2E90: .4byte 0x00015ddf
_080C2E94: .4byte 0x00015dde
_080C2E98: .4byte gTasks
_080C2E9C: .4byte sub_80C2EA0
	thumb_func_end sub_80C2E14

	thumb_func_start sub_80C2EA0
sub_80C2EA0: @ 80C2EA0
	push {r4,r5,lr}
	lsls r0, 24
	lsrs r2, r0, 24
	adds r5, r2, 0
	ldr r0, _080C2ED8 @ =gPaletteFade
	ldrb r1, [r0, 0x7]
	movs r0, 0x80
	ands r0, r1
	lsls r0, 24
	lsrs r3, r0, 24
	cmp r3, 0
	bne _080C2F18
	ldr r1, _080C2EDC @ =gTasks
	lsls r0, r2, 2
	adds r0, r2
	lsls r0, 3
	adds r4, r0, r1
	movs r1, 0xA
	ldrsh r0, [r4, r1]
	cmp r0, 0
	bne _080C2EE8
	ldr r0, _080C2EE0 @ =0x02018000
	ldrb r0, [r0, 0x3]
	bl DestroyTask
	ldr r0, _080C2EE4 @ =0x0000ffff
	b _080C2EEE
	.align 2, 0
_080C2ED8: .4byte gPaletteFade
_080C2EDC: .4byte gTasks
_080C2EE0: .4byte 0x02018000
_080C2EE4: .4byte 0x0000ffff
_080C2EE8:
	cmp r0, 0x1
	bne _080C2F04
	ldr r0, _080C2F00 @ =0xffff0000
_080C2EEE:
	movs r1, 0x10
	movs r2, 0
	bl BlendPalettes
	ldrh r0, [r4, 0xA]
	adds r0, 0x1
	strh r0, [r4, 0xA]
	b _080C2F18
	.align 2, 0
_080C2F00: .4byte 0xffff0000
_080C2F04:
	ldr r0, _080C2F20 @ =REG_BLDCNT
	strh r3, [r0]
	adds r0, 0x4
	strh r3, [r0]
	adds r0, r5, 0
	bl DestroyTask
	ldr r0, _080C2F24 @ =c2_exit_to_overworld_1_continue_scripts_restart_music
	bl SetMainCallback2
_080C2F18:
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080C2F20: .4byte REG_BLDCNT
_080C2F24: .4byte c2_exit_to_overworld_1_continue_scripts_restart_music
	thumb_func_end sub_80C2EA0

	thumb_func_start sub_80C2F28
sub_80C2F28: @ 80C2F28
	push {r4,r5,lr}
	ldr r2, _080C2F5C @ =gUnknown_030041B0
	ldrh r3, [r2]
	adds r0, r3, 0x2
	strh r0, [r2]
	ldr r4, _080C2F60 @ =gUnknown_030041B8
	ldrh r5, [r4]
	adds r1, r5, 0x1
	strh r1, [r4]
	lsls r0, 16
	lsrs r0, 16
	cmp r0, 0xFF
	bls _080C2F48
	adds r0, r3, 0
	subs r0, 0xFD
	strh r0, [r2]
_080C2F48:
	lsls r0, r1, 16
	lsrs r0, 16
	cmp r0, 0xFF
	bls _080C2F56
	adds r0, r5, 0
	subs r0, 0xFE
	strh r0, [r4]
_080C2F56:
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080C2F5C: .4byte gUnknown_030041B0
_080C2F60: .4byte gUnknown_030041B8
	thumb_func_end sub_80C2F28

	thumb_func_start sub_80C2F64
sub_80C2F64: @ 80C2F64
	push {r4,r5,lr}
	lsls r0, 24
	lsrs r5, r0, 24
	ldr r1, _080C2F94 @ =gTasks
	lsls r0, r5, 2
	adds r0, r5
	lsls r0, 3
	adds r2, r0, r1
	ldrh r0, [r2, 0x8]
	adds r0, 0x1
	strh r0, [r2, 0x8]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x2
	bne _080C2FE6
	movs r0, 0
	strh r0, [r2, 0x8]
	movs r3, 0xC
	ldrsh r0, [r2, r3]
	cmp r0, 0
	bne _080C2F98
	ldrh r0, [r2, 0xA]
	adds r0, 0x1
	b _080C2F9C
	.align 2, 0
_080C2F94: .4byte gTasks
_080C2F98:
	ldrh r0, [r2, 0xA]
	subs r0, 0x1
_080C2F9C:
	strh r0, [r2, 0xA]
	lsls r0, r5, 2
	adds r0, r5
	lsls r0, 3
	adds r1, r0, r1
	movs r2, 0xA
	ldrsh r0, [r1, r2]
	cmp r0, 0x10
	bne _080C2FB2
	movs r0, 0x1
	b _080C2FB6
_080C2FB2:
	cmp r0, 0
	bne _080C2FB8
_080C2FB6:
	strh r0, [r1, 0xC]
_080C2FB8:
	ldr r0, _080C3000 @ =gTasks
	lsls r4, r5, 2
	adds r4, r5
	lsls r4, 3
	adds r4, r0
	ldrb r2, [r4, 0xA]
	ldr r3, _080C3004 @ =0x00002ede
	movs r0, 0x6B
	movs r1, 0x1
	bl BlendPalette
	ldrb r2, [r4, 0xA]
	ldr r3, _080C3008 @ =0x00007fff
	movs r0, 0x68
	movs r1, 0x1
	bl BlendPalette
	ldrb r2, [r4, 0xA]
	ldr r3, _080C300C @ =0x000077be
	movs r0, 0x6E
	movs r1, 0x1
	bl BlendPalette
_080C2FE6:
	ldr r1, _080C3000 @ =gTasks
	lsls r0, r5, 2
	adds r0, r5
	lsls r0, 3
	adds r0, r1
	movs r3, 0xA
	ldrsh r4, [r0, r3]
	cmp r4, 0
	bne _080C3014
	ldr r0, _080C3010 @ =0x02018000
	strb r4, [r0, 0xA]
	b _080C301A
	.align 2, 0
_080C3000: .4byte gTasks
_080C3004: .4byte 0x00002ede
_080C3008: .4byte 0x00007fff
_080C300C: .4byte 0x000077be
_080C3010: .4byte 0x02018000
_080C3014:
	ldr r1, _080C3020 @ =0x02018000
	movs r0, 0x1
	strb r0, [r1, 0xA]
_080C301A:
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080C3020: .4byte 0x02018000
	thumb_func_end sub_80C2F64

	thumb_func_start sub_80C3024
sub_80C3024: @ 80C3024
	push {r4-r6,lr}
	ldr r6, [sp, 0x10]
	lsls r0, 16
	lsrs r0, 16
	lsls r1, 24
	lsrs r4, r1, 24
	lsls r2, 24
	lsrs r5, r2, 24
	lsls r3, 24
	cmp r3, 0
	beq _080C30B0
	adds r1, r6, 0
	bl GetMonIconPtr
	lsls r1, r5, 9
	adds r0, r1
	adds r0, 0x80
	lsls r1, r4, 9
	ldr r2, _080C30A0 @ =0x06004000
	adds r1, r2
	ldr r2, _080C30A4 @ =0x040000d4
	str r0, [r2]
	str r1, [r2, 0x4]
	ldr r0, _080C30A8 @ =0x84000060
	str r0, [r2, 0x8]
	ldr r0, [r2, 0x8]
	adds r1, r4, 0
	adds r1, 0xA
	lsls r1, 28
	lsls r0, r4, 20
	movs r2, 0x80
	lsls r2, 18
	adds r0, r2
	orrs r0, r1
	lsrs r1, r0, 16
	lsls r0, r4, 1
	adds r0, r4
	lsls r0, 21
	movs r2, 0x83
	lsls r2, 16
	adds r0, r2
	lsrs r5, r0, 16
	movs r2, 0
	ldr r6, _080C30AC @ =0x0600c000
_080C307C:
	lsls r0, r2, 5
	adds r4, r2, 0x1
	adds r0, r5
	movs r3, 0x3
	lsls r0, 1
	adds r2, r0, r6
_080C3088:
	strh r1, [r2]
	adds r0, r1, 0x1
	lsls r0, 16
	lsrs r1, r0, 16
	adds r2, 0x2
	subs r3, 0x1
	cmp r3, 0
	bge _080C3088
	adds r2, r4, 0
	cmp r2, 0x2
	ble _080C307C
	b _080C30CA
	.align 2, 0
_080C30A0: .4byte 0x06004000
_080C30A4: .4byte 0x040000d4
_080C30A8: .4byte 0x84000060
_080C30AC: .4byte 0x0600c000
_080C30B0:
	adds r1, r6, 0
	bl GetMonIconPtr
	lsls r1, r5, 9
	adds r0, r1
	adds r0, 0x80
	lsls r1, r4, 9
	ldr r2, _080C30D0 @ =0x06004000
	adds r1, r2
	movs r2, 0xC0
	lsls r2, 1
	bl RequestSpriteCopy
_080C30CA:
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_080C30D0: .4byte 0x06004000
	thumb_func_end sub_80C3024

	thumb_func_start sub_80C30D4
sub_80C30D4: @ 80C30D4
	push {r4-r7,lr}
	sub sp, 0x4
	lsls r0, 24
	lsrs r7, r0, 24
	lsls r1, 24
	lsrs r6, r1, 24
	movs r5, 0
	ldr r4, _080C3108 @ =gContestMons
_080C30E4:
	ldrh r0, [r4]
	lsls r1, r5, 24
	lsrs r1, 24
	ldr r2, [r4, 0x38]
	str r2, [sp]
	adds r2, r7, 0
	adds r3, r6, 0
	bl sub_80C3024
	adds r4, 0x40
	adds r5, 0x1
	cmp r5, 0x3
	ble _080C30E4
	add sp, 0x4
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080C3108: .4byte gContestMons
	thumb_func_end sub_80C30D4

	thumb_func_start sub_80C310C
sub_80C310C: @ 80C310C
	push {r4-r6,lr}
	movs r4, 0
	ldr r6, _080C314C @ =gMonIconPaletteIndices
	movs r5, 0xA0
	lsls r5, 16
_080C3116:
	ldr r1, _080C3150 @ =gContestMons
	lsls r0, r4, 6
	adds r0, r1
	ldrh r0, [r0]
	movs r1, 0
	bl mon_icon_convert_unown_species_id
	lsls r0, 16
	lsrs r0, 16
	adds r0, r6
	ldrb r0, [r0]
	lsls r0, 5
	ldr r1, _080C3154 @ =gMonIconPalettes
	adds r0, r1
	lsrs r1, r5, 16
	movs r2, 0x20
	bl LoadPalette
	movs r0, 0x80
	lsls r0, 13
	adds r5, r0
	adds r4, 0x1
	cmp r4, 0x3
	ble _080C3116
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_080C314C: .4byte gMonIconPaletteIndices
_080C3150: .4byte gContestMons
_080C3154: .4byte gMonIconPalettes
	thumb_func_end sub_80C310C

	thumb_func_start sub_80C3158
sub_80C3158: @ 80C3158
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	sub sp, 0x1C
	mov r9, r0
	lsls r1, 24
	lsrs r1, 24
	lsls r2, r1, 4
	adds r2, r1
	lsls r2, 2
	ldr r3, _080C32C0 @ =gSprites
	adds r2, r3
	mov r1, sp
	ldrh r0, [r2, 0x4]
	lsls r0, 22
	lsrs r0, 22
	strh r0, [r1]
	mov r4, sp
	movs r0, 0x2E
	ldrsh r1, [r2, r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r3
	ldrh r0, [r0, 0x4]
	lsls r0, 22
	lsrs r0, 22
	strh r0, [r4, 0x2]
	movs r0, 0x30
	ldrsh r1, [r2, r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r3
	ldrh r0, [r0, 0x4]
	lsls r0, 22
	lsrs r0, 22
	strh r0, [r4, 0x4]
	movs r0, 0x32
	ldrsh r1, [r2, r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r3
	ldrh r0, [r0, 0x4]
	lsls r0, 22
	lsrs r0, 22
	strh r0, [r4, 0x6]
	ldr r1, _080C32C4 @ =gWindowConfig_81E7278
	mov r8, r1
	ldr r7, _080C32C8 @ =0x06010000
	ldr r2, _080C32CC @ =0x040000d4
	ldr r6, _080C32D0 @ =0x85000100
	mov r1, sp
	movs r5, 0
	add r3, sp, 0x8
	movs r4, 0x3
_080C31CE:
	ldrh r0, [r1]
	lsls r0, 5
	adds r0, r7
	str r5, [sp, 0x8]
	str r3, [r2]
	str r0, [r2, 0x4]
	str r6, [r2, 0x8]
	ldr r0, [r2, 0x8]
	adds r1, 0x2
	subs r4, 0x1
	cmp r4, 0
	bge _080C31CE
	mov r0, r8
	mov r1, r9
	bl GetStringWidthGivenWindowConfig
	lsls r0, 24
	lsrs r5, r0, 24
	ldr r2, _080C32D4 @ =gUnknown_020238CC
	ldr r1, _080C32D8 @ =gUnknown_083D17E2
	adds r0, r2, 0
	bl StringCopy
	adds r2, r0, 0
	mvns r0, r5
	adds r1, r0, 0x1
	movs r0, 0x7
	ands r1, r0
	cmp r1, 0
	beq _080C3218
	movs r0, 0xFC
	strb r0, [r2]
	movs r0, 0x11
	strb r0, [r2, 0x1]
	lsrs r0, r1, 1
	strb r0, [r2, 0x2]
	adds r2, 0x3
_080C3218:
	adds r6, r5, 0x7
	movs r1, 0x8
	negs r1, r1
	adds r0, r1, 0
	ands r6, r0
	lsls r6, 24
	lsrs r5, r6, 24
	adds r0, r2, 0
	mov r1, r9
	bl StringCopy
	adds r2, r0, 0
	movs r0, 0xFC
	strb r0, [r2]
	movs r0, 0x13
	strb r0, [r2, 0x1]
	strb r5, [r2, 0x2]
	movs r0, 0xFF
	strb r0, [r2, 0x3]
	ldr r0, _080C32DC @ =0x02018068
	mov r10, r0
	ldr r1, _080C32D4 @ =gUnknown_020238CC
	bl sub_80034D4
	mov r0, sp
	ldrh r4, [r0]
	lsls r4, 5
	ldr r1, _080C32C8 @ =0x06010000
	adds r7, r4, r1
	ldr r0, _080C32E0 @ =gUnknown_083D1624
	mov r9, r0
	ldr r1, _080C32E4 @ =REG_BG0CNT
	mov r8, r1
	adds r1, r7, 0
	mov r2, r8
	bl CpuSet
	mov r5, r9
	adds r5, 0x80
	ldr r0, _080C32E8 @ =0x06010100
	adds r1, r4, r0
	adds r0, r5, 0
	mov r2, r8
	bl CpuSet
	ldr r0, _080C32EC @ =0x06010200
	adds r1, r4, r0
	adds r0, r5, 0
	mov r2, r8
	bl CpuSet
	mov r0, r9
	adds r0, 0x40
	ldr r1, _080C32F0 @ =0x06010300
	adds r4, r1
	adds r1, r4, 0
	mov r2, r8
	bl CpuSet
	lsrs r5, r6, 27
	movs r4, 0
	cmp r4, r5
	bgt _080C3382
	mov r6, sp
	mov r0, r10
	adds r0, 0x20
	str r0, [sp, 0xC]
	mov r1, r10
	str r1, [sp, 0x10]
	ldr r0, _080C32F4 @ =0x0600fd20
	str r0, [sp, 0x14]
	ldr r1, _080C32F8 @ =0x0600fe20
	str r1, [sp, 0x18]
	ldr r0, _080C32FC @ =0x0600ff20
	mov r10, r0
	ldr r1, _080C3300 @ =0x06010020
	mov r9, r1
_080C32B2:
	cmp r4, 0x6
	bgt _080C3304
	ldrh r0, [r6]
	lsls r0, 5
	mov r1, r9
	b _080C3322
	.align 2, 0
_080C32C0: .4byte gSprites
_080C32C4: .4byte gWindowConfig_81E7278
_080C32C8: .4byte 0x06010000
_080C32CC: .4byte 0x040000d4
_080C32D0: .4byte 0x85000100
_080C32D4: .4byte gUnknown_020238CC
_080C32D8: .4byte gUnknown_083D17E2
_080C32DC: .4byte 0x02018068
_080C32E0: .4byte gUnknown_083D1624
_080C32E4: .4byte REG_BG0CNT
_080C32E8: .4byte 0x06010100
_080C32EC: .4byte 0x06010200
_080C32F0: .4byte 0x06010300
_080C32F4: .4byte 0x0600fd20
_080C32F8: .4byte 0x0600fe20
_080C32FC: .4byte 0x0600ff20
_080C3300: .4byte 0x06010020
_080C3304:
	cmp r4, 0xE
	bgt _080C3310
	ldrh r0, [r6, 0x2]
	lsls r0, 5
	mov r1, r10
	b _080C3322
_080C3310:
	cmp r4, 0x16
	bgt _080C331C
	ldrh r0, [r6, 0x4]
	lsls r0, 5
	ldr r1, [sp, 0x18]
	b _080C3322
_080C331C:
	ldrh r0, [r6, 0x6]
	lsls r0, 5
	ldr r1, [sp, 0x14]
_080C3322:
	adds r7, r0, r1
	cmp r4, r5
	beq _080C3382
	ldr r0, _080C33D0 @ =gUnknown_083D16E4
	adds r1, r7, 0
	mov r2, r8
	bl CpuSet
	movs r0, 0xC0
	lsls r0, 2
	adds r1, r7, r0
	ldr r0, _080C33D0 @ =gUnknown_083D16E4
	adds r0, 0x20
	mov r2, r8
	bl CpuSet
	movs r0, 0x80
	lsls r0, 1
	adds r1, r7, r0
	ldr r0, [sp, 0x10]
	mov r2, r8
	bl CpuSet
	movs r0, 0x80
	lsls r0, 2
	adds r1, r7, r0
	ldr r0, [sp, 0xC]
	mov r2, r8
	bl CpuSet
	ldr r1, [sp, 0xC]
	adds r1, 0x40
	str r1, [sp, 0xC]
	ldr r0, [sp, 0x10]
	adds r0, 0x40
	str r0, [sp, 0x10]
	ldr r1, [sp, 0x14]
	adds r1, 0x20
	str r1, [sp, 0x14]
	ldr r0, [sp, 0x18]
	adds r0, 0x20
	str r0, [sp, 0x18]
	movs r1, 0x20
	add r10, r1
	add r9, r1
	adds r4, 0x1
	cmp r4, r5
	ble _080C32B2
_080C3382:
	ldr r4, _080C33D4 @ =gUnknown_083D1644
	ldr r5, _080C33D8 @ =REG_BG0CNT
	adds r0, r4, 0
	adds r1, r7, 0
	adds r2, r5, 0
	bl CpuSet
	adds r6, r4, 0
	adds r6, 0x80
	movs r0, 0x80
	lsls r0, 1
	adds r1, r7, r0
	adds r0, r6, 0
	adds r2, r5, 0
	bl CpuSet
	movs r0, 0x80
	lsls r0, 2
	adds r1, r7, r0
	adds r0, r6, 0
	adds r2, r5, 0
	bl CpuSet
	adds r4, 0x40
	movs r0, 0xC0
	lsls r0, 2
	adds r1, r7, r0
	adds r0, r4, 0
	adds r2, r5, 0
	bl CpuSet
	add sp, 0x1C
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080C33D0: .4byte gUnknown_083D16E4
_080C33D4: .4byte gUnknown_083D1644
_080C33D8: .4byte REG_BG0CNT
	thumb_func_end sub_80C3158

	thumb_func_start sub_80C33DC
sub_80C33DC: @ 80C33DC
	push {r4-r6,lr}
	sub sp, 0x20
	mov r1, sp
	ldr r0, _080C3498 @ =gSpriteTemplate_83D174C
	ldm r0!, {r2-r4}
	stm r1!, {r2-r4}
	ldm r0!, {r2-r4}
	stm r1!, {r2-r4}
	add r5, sp, 0x18
	ldr r6, _080C349C @ =gUnknown_083D1764
	movs r4, 0x7
_080C33F2:
	adds r0, r6, 0
	bl LoadSpriteSheet
	adds r6, 0x8
	subs r4, 0x1
	cmp r4, 0
	bge _080C33F2
	ldr r0, _080C34A0 @ =gUnknown_083D17A4
	bl LoadSpritePalette
	movs r4, 0
	mov r6, sp
_080C340A:
	mov r0, sp
	movs r1, 0x88
	lsls r1, 1
	movs r2, 0x90
	movs r3, 0xA
	bl CreateSprite
	adds r1, r5, r4
	strb r0, [r1]
	ldrh r0, [r6]
	adds r0, 0x1
	strh r0, [r6]
	adds r4, 0x1
	cmp r4, 0x7
	ble _080C340A
	ldr r2, _080C34A4 @ =gSprites
	ldrb r1, [r5]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r2
	ldrb r1, [r5, 0x1]
	movs r3, 0
	strh r1, [r0, 0x2E]
	ldrb r1, [r5]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r2
	ldrb r1, [r5, 0x2]
	strh r1, [r0, 0x30]
	ldrb r1, [r5]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r2
	ldrb r1, [r5, 0x3]
	strh r1, [r0, 0x32]
	ldrb r1, [r5, 0x4]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r2
	ldrb r1, [r5, 0x5]
	strh r1, [r0, 0x2E]
	ldrb r1, [r5, 0x4]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r2
	ldrb r1, [r5, 0x6]
	strh r1, [r0, 0x30]
	ldrb r1, [r5, 0x4]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r2
	ldrb r1, [r5, 0x7]
	strh r1, [r0, 0x32]
	ldr r1, _080C34A8 @ =0x02018000
	ldrb r0, [r5]
	strb r0, [r1]
	strb r3, [r1, 0x4]
	ldrb r0, [r5, 0x4]
	strb r0, [r1, 0x1]
	bl sub_80C3764
	add sp, 0x20
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_080C3498: .4byte gSpriteTemplate_83D174C
_080C349C: .4byte gUnknown_083D1764
_080C34A0: .4byte gUnknown_083D17A4
_080C34A4: .4byte gSprites
_080C34A8: .4byte 0x02018000
	thumb_func_end sub_80C33DC

	thumb_func_start sub_80C34AC
sub_80C34AC: @ 80C34AC
	push {lr}
	bl StringLength
	lsls r0, 16
	lsrs r0, 16
	lsls r1, r0, 1
	adds r1, r0
	lsls r1, 25
	lsrs r1, 25
	movs r0, 0x70
	subs r0, r1
	lsls r0, 16
	lsrs r0, 16
	pop {r1}
	bx r1
	thumb_func_end sub_80C34AC

	thumb_func_start sub_80C34CC
sub_80C34CC: @ 80C34CC
	push {r4-r6,lr}
	mov r6, r8
	push {r6}
	ldr r4, _080C3514 @ =0x02018000
	mov r8, r4
	ldrb r5, [r4]
	lsls r4, r5, 4
	adds r4, r5
	lsls r4, 2
	ldr r5, _080C3518 @ =gSprites
	adds r4, r5
	movs r6, 0
	movs r5, 0x88
	lsls r5, 1
	strh r5, [r4, 0x20]
	strh r1, [r4, 0x22]
	strh r6, [r4, 0x24]
	strh r6, [r4, 0x26]
	lsls r0, 16
	asrs r0, 16
	adds r0, 0x20
	strh r0, [r4, 0x36]
	strh r2, [r4, 0x38]
	strh r3, [r4, 0x3A]
	strh r6, [r4, 0x3C]
	ldr r0, _080C351C @ =sub_80C3588
	str r0, [r4, 0x1C]
	movs r0, 0x1
	mov r1, r8
	strb r0, [r1, 0x4]
	pop {r3}
	mov r8, r3
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_080C3514: .4byte 0x02018000
_080C3518: .4byte gSprites
_080C351C: .4byte sub_80C3588
	thumb_func_end sub_80C34CC

	thumb_func_start sub_80C3520
sub_80C3520: @ 80C3520
	push {r4,r5,lr}
	ldr r4, _080C3558 @ =0x02018000
	ldrb r2, [r4]
	lsls r1, r2, 4
	adds r1, r2
	lsls r1, 2
	ldr r2, _080C355C @ =gSprites
	adds r1, r2
	ldrh r2, [r1, 0x24]
	ldrh r3, [r1, 0x20]
	adds r2, r3
	movs r3, 0
	strh r2, [r1, 0x20]
	ldrh r2, [r1, 0x26]
	ldrh r5, [r1, 0x22]
	adds r2, r5
	strh r2, [r1, 0x22]
	strh r3, [r1, 0x26]
	strh r3, [r1, 0x24]
	strh r0, [r1, 0x3A]
	strh r3, [r1, 0x3C]
	ldr r0, _080C3560 @ =sub_80C3630
	str r0, [r1, 0x1C]
	movs r0, 0x3
	strb r0, [r4, 0x4]
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080C3558: .4byte 0x02018000
_080C355C: .4byte gSprites
_080C3560: .4byte sub_80C3630
	thumb_func_end sub_80C3520

	thumb_func_start sub_80C3564
sub_80C3564: @ 80C3564
	movs r3, 0
	movs r2, 0
	movs r1, 0x88
	lsls r1, 1
	strh r1, [r0, 0x20]
	movs r1, 0x90
	strh r1, [r0, 0x22]
	strh r2, [r0, 0x26]
	strh r2, [r0, 0x24]
	ldr r1, _080C3580 @ =SpriteCallbackDummy
	str r1, [r0, 0x1C]
	ldr r0, _080C3584 @ =0x02018000
	strb r3, [r0, 0x4]
	bx lr
	.align 2, 0
_080C3580: .4byte SpriteCallbackDummy
_080C3584: .4byte 0x02018000
	thumb_func_end sub_80C3564

	thumb_func_start sub_80C3588
sub_80C3588: @ 80C3588
	push {r4-r7,lr}
	adds r3, r0, 0
	ldrh r2, [r3, 0x3A]
	ldrh r0, [r3, 0x3C]
	adds r2, r0
	lsls r1, r2, 16
	asrs r1, 24
	ldrh r0, [r3, 0x20]
	subs r0, r1
	strh r0, [r3, 0x20]
	movs r1, 0xFF
	ands r2, r1
	strh r2, [r3, 0x3C]
	lsls r0, 16
	asrs r0, 16
	ldrh r2, [r3, 0x36]
	movs r4, 0x36
	ldrsh r1, [r3, r4]
	cmp r0, r1
	bge _080C35B2
	strh r2, [r3, 0x20]
_080C35B2:
	movs r4, 0
	ldr r6, _080C35F4 @ =gSprites
	movs r5, 0x40
	adds r2, r3, 0
	adds r2, 0x2E
_080C35BC:
	movs r7, 0
	ldrsh r0, [r2, r7]
	lsls r1, r0, 4
	adds r1, r0
	lsls r1, 2
	adds r1, r6
	ldrh r0, [r3, 0x24]
	ldrh r7, [r3, 0x20]
	adds r0, r7
	adds r0, r5
	strh r0, [r1, 0x20]
	adds r5, 0x40
	adds r2, 0x2
	adds r4, 0x1
	cmp r4, 0x2
	ble _080C35BC
	movs r0, 0x20
	ldrsh r1, [r3, r0]
	movs r2, 0x36
	ldrsh r0, [r3, r2]
	cmp r1, r0
	bne _080C35EC
	ldr r0, _080C35F8 @ =sub_80C35FC
	str r0, [r3, 0x1C]
_080C35EC:
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080C35F4: .4byte gSprites
_080C35F8: .4byte sub_80C35FC
	thumb_func_end sub_80C3588

	thumb_func_start sub_80C35FC
sub_80C35FC: @ 80C35FC
	push {lr}
	adds r2, r0, 0
	ldr r0, _080C3628 @ =0x02018000
	movs r1, 0x2
	strb r1, [r0, 0x4]
	ldrh r3, [r2, 0x38]
	ldr r1, _080C362C @ =0xffff0000
	lsrs r0, r1, 16
	cmp r3, r0
	beq _080C3624
	subs r0, r3, 0x1
	strh r0, [r2, 0x38]
	lsls r0, 16
	asrs r0, 16
	asrs r1, 16
	cmp r0, r1
	bne _080C3624
	ldrh r0, [r2, 0x3A]
	bl sub_80C3520
_080C3624:
	pop {r0}
	bx r0
	.align 2, 0
_080C3628: .4byte 0x02018000
_080C362C: .4byte 0xffff0000
	thumb_func_end sub_80C35FC

	thumb_func_start sub_80C3630
sub_80C3630: @ 80C3630
	push {r4-r7,lr}
	adds r3, r0, 0
	ldrh r2, [r3, 0x3A]
	ldrh r0, [r3, 0x3C]
	adds r2, r0
	lsls r1, r2, 16
	asrs r1, 24
	ldrh r0, [r3, 0x20]
	subs r0, r1
	strh r0, [r3, 0x20]
	movs r0, 0xFF
	ands r2, r0
	strh r2, [r3, 0x3C]
	movs r4, 0
	ldr r6, _080C3694 @ =gSprites
	movs r5, 0x40
	adds r2, r3, 0
	adds r2, 0x2E
_080C3654:
	movs r1, 0
	ldrsh r0, [r2, r1]
	lsls r1, r0, 4
	adds r1, r0
	lsls r1, 2
	adds r1, r6
	ldrh r0, [r3, 0x24]
	ldrh r7, [r3, 0x20]
	adds r0, r7
	adds r0, r5
	strh r0, [r1, 0x20]
	adds r5, 0x40
	adds r2, 0x2
	adds r4, 0x1
	cmp r4, 0x2
	ble _080C3654
	movs r1, 0x20
	ldrsh r0, [r3, r1]
	movs r2, 0x24
	ldrsh r1, [r3, r2]
	adds r0, r1
	movs r1, 0xE0
	negs r1, r1
	cmp r0, r1
	bge _080C368C
	adds r0, r3, 0
	bl sub_80C3564
_080C368C:
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080C3694: .4byte gSprites
	thumb_func_end sub_80C3630

	thumb_func_start sub_80C3698
sub_80C3698: @ 80C3698
	push {r4-r7,lr}
	adds r4, r0, 0
	ldr r5, _080C374C @ =0x02018000
	ldrb r1, [r5, 0x1]
	bl sub_80C3158
	adds r0, r4, 0
	bl sub_80C34AC
	lsls r0, 16
	lsrs r0, 16
	ldrb r2, [r5, 0x1]
	lsls r1, r2, 4
	adds r1, r2
	lsls r1, 2
	ldr r3, _080C3750 @ =gSprites
	adds r4, r1, r3
	adds r0, 0x20
	strh r0, [r4, 0x20]
	movs r0, 0x50
	strh r0, [r4, 0x22]
	adds r5, r4, 0
	adds r5, 0x3E
	ldrb r1, [r5]
	movs r2, 0x5
	negs r2, r2
	adds r0, r2, 0
	ands r0, r1
	strb r0, [r5]
	movs r5, 0
	adds r6, r3, 0
	mov r12, r2
	movs r3, 0x40
_080C36DA:
	lsls r0, r5, 1
	adds r2, r4, 0
	adds r2, 0x2E
	adds r2, r0
	movs r1, 0
	ldrsh r0, [r2, r1]
	lsls r1, r0, 4
	adds r1, r0
	lsls r1, 2
	adds r1, r6
	ldrh r0, [r4, 0x24]
	ldrh r7, [r4, 0x20]
	adds r0, r7
	adds r0, r3
	strh r0, [r1, 0x20]
	movs r0, 0
	ldrsh r1, [r2, r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r6
	ldrh r1, [r4, 0x22]
	strh r1, [r0, 0x22]
	movs r1, 0
	ldrsh r0, [r2, r1]
	lsls r1, r0, 4
	adds r1, r0
	lsls r1, 2
	adds r1, r6
	adds r1, 0x3E
	ldrb r2, [r1]
	mov r0, r12
	ands r0, r2
	strb r0, [r1]
	adds r3, 0x40
	adds r5, 0x1
	cmp r5, 0x2
	ble _080C36DA
	ldr r1, _080C3754 @ =gUnknown_030042C4
	movs r0, 0xF0
	strh r0, [r1]
	ldr r2, _080C3758 @ =gUnknown_03004240
	ldrh r1, [r4, 0x22]
	adds r0, r1, 0
	subs r0, 0x10
	lsls r0, 8
	adds r1, 0x10
	orrs r0, r1
	strh r0, [r2]
	ldr r1, _080C375C @ =REG_WININ
	ldr r2, _080C3760 @ =0x00003f3e
	adds r0, r2, 0
	strh r0, [r1]
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080C374C: .4byte 0x02018000
_080C3750: .4byte gSprites
_080C3754: .4byte gUnknown_030042C4
_080C3758: .4byte gUnknown_03004240
_080C375C: .4byte REG_WININ
_080C3760: .4byte 0x00003f3e
	thumb_func_end sub_80C3698

	thumb_func_start sub_80C3764
sub_80C3764: @ 80C3764
	push {r4-r7,lr}
	ldr r0, _080C37C8 @ =0x02018000
	ldrb r0, [r0, 0x1]
	lsls r2, r0, 4
	adds r2, r0
	lsls r2, 2
	ldr r3, _080C37CC @ =gSprites
	adds r2, r3
	movs r0, 0x3E
	adds r0, r2
	mov r12, r0
	ldrb r0, [r0]
	movs r1, 0x4
	orrs r0, r1
	mov r1, r12
	strb r0, [r1]
	ldr r7, _080C37D0 @ =gUnknown_030042C4
	ldr r6, _080C37D4 @ =gUnknown_03004240
	adds r5, r3, 0
	movs r4, 0x4
	adds r2, 0x2E
	movs r3, 0x2
_080C3790:
	movs r1, 0
	ldrsh r0, [r2, r1]
	lsls r1, r0, 4
	adds r1, r0
	lsls r1, 2
	adds r1, r5
	adds r1, 0x3E
	ldrb r0, [r1]
	orrs r0, r4
	strb r0, [r1]
	adds r2, 0x2
	subs r3, 0x1
	cmp r3, 0
	bge _080C3790
	movs r1, 0
	strh r1, [r7]
	strh r1, [r6]
	ldr r0, _080C37D8 @ =REG_WIN0H
	strh r1, [r0]
	adds r0, 0x4
	strh r1, [r0]
	ldr r1, _080C37DC @ =REG_WININ
	ldr r2, _080C37E0 @ =0x00003f3f
	adds r0, r2, 0
	strh r0, [r1]
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080C37C8: .4byte 0x02018000
_080C37CC: .4byte gSprites
_080C37D0: .4byte gUnknown_030042C4
_080C37D4: .4byte gUnknown_03004240
_080C37D8: .4byte REG_WIN0H
_080C37DC: .4byte REG_WININ
_080C37E0: .4byte 0x00003f3f
	thumb_func_end sub_80C3764

	thumb_func_start de_sub_80C39A8
de_sub_80C39A8: @ 80C39A8
	push {r4,lr}
	sub sp, 0x10
	adds r1, r0, 0
	ldr r0, _de_080C39DC @ =gIsLinkContest
	ldrb r0, [r0]
	movs r4, 0x1
	ands r4, r0
	cmp r4, 0
	beq _de_080C39E8
	ldr r0, _de_080C39E0 @ =0x0600e000
	lsls r1, 16
	lsrs r1, 16
	ldr r3, _de_080C39E4 @ =gUnknown_08E964B8
	movs r2, 0xB
	str r2, [sp]
	movs r4, 0x3
	str r4, [sp, 0x4]
	movs r2, 0x8
	str r2, [sp, 0x8]
	str r4, [sp, 0xC]
	movs r2, 0
	bl sub_809D104
	movs r0, 0x8
	b _de_080C3A74
	.align 2, 0
_de_080C39DC: .4byte gIsLinkContest
_de_080C39E0: .4byte 0x0600e000
_de_080C39E4: .4byte gUnknown_08E964B8
_de_080C39E8:
	ldr r0, _de_080C3A08 @ =gScriptContestRank
	ldrh r0, [r0]
	cmp r0, 0
	bne _de_080C3A14
	ldr r0, _de_080C3A0C @ =0x0600e000
	lsls r1, 16
	lsrs r1, 16
	ldr r3, _de_080C3A10 @ =gUnknown_08E964B8
	str r4, [sp]
	str r4, [sp, 0x4]
	movs r2, 0xB
	str r2, [sp, 0x8]
	movs r2, 0x3
	str r2, [sp, 0xC]
	b _de_080C3A6C
	.align 2, 0
_de_080C3A08: .4byte gScriptContestRank
_de_080C3A0C: .4byte 0x0600e000
_de_080C3A10: .4byte gUnknown_08E964B8
_de_080C3A14:
	cmp r0, 0x1
	bne _de_080C3A2C
	ldr r0, _de_080C3A24 @ =0x0600e000
	lsls r1, 16
	lsrs r1, 16
	ldr r3, _de_080C3A28 @ =gUnknown_08E964B8
	movs r2, 0xB
	b _de_080C3A3A
	.align 2, 0
_de_080C3A24: .4byte 0x0600e000
_de_080C3A28: .4byte gUnknown_08E964B8
_de_080C3A2C:
	cmp r0, 0x2
	bne _de_080C3A58
	ldr r0, _de_080C3A50 @ =0x0600e000
	lsls r1, 16
	lsrs r1, 16
	ldr r3, _de_080C3A54 @ =gUnknown_08E964B8
	movs r2, 0x15
_de_080C3A3A:
	str r2, [sp]
	str r4, [sp, 0x4]
	movs r2, 0xA
	str r2, [sp, 0x8]
	movs r2, 0x3
	str r2, [sp, 0xC]
	movs r2, 0
	bl sub_809D104
	movs r0, 0xA
	b _de_080C3A74
	.align 2, 0
_de_080C3A50: .4byte 0x0600e000
_de_080C3A54: .4byte gUnknown_08E964B8
_de_080C3A58:
	ldr r0, _de_080C3A7C @ =0x0600e000
	lsls r1, 16
	lsrs r1, 16
	ldr r3, _de_080C3A80 @ =gUnknown_08E964B8
	str r4, [sp]
	movs r4, 0x3
	str r4, [sp, 0x4]
	movs r2, 0xB
	str r2, [sp, 0x8]
	str r4, [sp, 0xC]
_de_080C3A6C:
	movs r2, 0
	bl sub_809D104
	movs r0, 0xB
_de_080C3A74:
	add sp, 0x10
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_de_080C3A7C: .4byte 0x0600e000
_de_080C3A80: .4byte gUnknown_08E964B8
	thumb_func_end de_sub_80C39A8

	thumb_func_start de_sub_80C3A84
de_sub_80C3A84: @ 80C3A84
	push {r4,lr}
	sub sp, 0x10
	adds r2, r0, 0
	ldr r0, _de_080C3AAC @ =gScriptContestCategory
	ldrh r4, [r0]
	cmp r4, 0
	bne _de_080C3AB8
	str r4, [r1]
	ldr r0, _de_080C3AB0 @ =0x0600e000
	lsls r1, r2, 16
	lsrs r1, 16
	ldr r3, _de_080C3AB4 @ =gUnknown_08E964B8
	movs r2, 0x13
	str r2, [sp]
	movs r4, 0x3
	str r4, [sp, 0x4]
	movs r2, 0x7
	str r2, [sp, 0x8]
	str r4, [sp, 0xC]
	b _de_080C3AD6
	.align 2, 0
_de_080C3AAC: .4byte gScriptContestCategory
_de_080C3AB0: .4byte 0x0600e000
_de_080C3AB4: .4byte gUnknown_08E964B8
_de_080C3AB8:
	cmp r4, 0x1
	bne _de_080C3AE8
	str r4, [r1]
	ldr r0, _de_080C3AE0 @ =0x0600e000
	lsls r1, r2, 16
	lsrs r1, 16
	ldr r3, _de_080C3AE4 @ =gUnknown_08E964B8
	movs r2, 0
	str r2, [sp]
	movs r2, 0x6
	str r2, [sp, 0x4]
	movs r2, 0x7
	str r2, [sp, 0x8]
	movs r2, 0x3
	str r2, [sp, 0xC]
_de_080C3AD6:
	movs r2, 0
	bl sub_809D104
	movs r0, 0x7
	b _de_080C3B68
	.align 2, 0
_de_080C3AE0: .4byte 0x0600e000
_de_080C3AE4: .4byte gUnknown_08E964B8
_de_080C3AE8:
	cmp r4, 0x2
	bne _de_080C3B18
	str r4, [r1]
	ldr r0, _de_080C3B10 @ =0x0600e000
	lsls r1, r2, 16
	lsrs r1, 16
	ldr r3, _de_080C3B14 @ =gUnknown_08E964B8
	movs r2, 0x7
	str r2, [sp]
	movs r2, 0x6
	str r2, [sp, 0x4]
	movs r2, 0x4
	str r2, [sp, 0x8]
	movs r2, 0x3
	str r2, [sp, 0xC]
	movs r2, 0
	bl sub_809D104
	movs r0, 0x4
	b _de_080C3B68
	.align 2, 0
_de_080C3B10: .4byte 0x0600e000
_de_080C3B14: .4byte gUnknown_08E964B8
_de_080C3B18:
	cmp r4, 0x3
	bne _de_080C3B44
	str r4, [r1]
	ldr r0, _de_080C3B3C @ =0x0600e000
	lsls r1, r2, 16
	lsrs r1, 16
	ldr r3, _de_080C3B40 @ =gUnknown_08E964B8
	movs r2, 0xB
	str r2, [sp]
	movs r2, 0x6
	str r2, [sp, 0x4]
	str r2, [sp, 0x8]
	str r4, [sp, 0xC]
	movs r2, 0
	bl sub_809D104
	movs r0, 0x6
	b _de_080C3B68
	.align 2, 0
_de_080C3B3C: .4byte 0x0600e000
_de_080C3B40: .4byte gUnknown_08E964B8
_de_080C3B44:
	movs r0, 0x4
	str r0, [r1]
	ldr r0, _de_080C3B70 @ =0x0600e000
	lsls r1, r2, 16
	lsrs r1, 16
	ldr r3, _de_080C3B74 @ =gUnknown_08E964B8
	movs r2, 0x11
	str r2, [sp]
	movs r2, 0x6
	str r2, [sp, 0x4]
	movs r2, 0x5
	str r2, [sp, 0x8]
	movs r2, 0x3
	str r2, [sp, 0xC]
	movs r2, 0
	bl sub_809D104
	movs r0, 0x5
_de_080C3B68:
	add sp, 0x10
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_de_080C3B70: .4byte 0x0600e000
_de_080C3B74: .4byte gUnknown_08E964B8
	thumb_func_end de_sub_80C3A84

	thumb_func_start sub_80C37E4
sub_80C37E4: @ 80C37E4
	push {r4,r5,lr}
	sub sp, 0x4
	movs r0, 0x6
	bl de_sub_80C39A8
	lsls r0, 16
	asrs r0, 16
	adds r0, 0x6
	mov r1, sp
	bl de_sub_80C3A84
	ldr r5, _080C3824 @ =0x00000fff
	ldr r0, [sp]
	lsls r4, r0, 12
	ldr r2, _080C3828 @ =0x0600e000
	movs r3, 0x7F
_080C3804:
	ldrh r1, [r2]
	adds r0, r5, 0
	ands r0, r1
	strh r0, [r2]
	ldrh r1, [r2]
	adds r0, r4, 0
	orrs r0, r1
	strh r0, [r2]
	adds r2, 0x2
	subs r3, 0x1
	cmp r3, 0
	bge _080C3804
	add sp, 0x4
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080C3824: .4byte 0x00000fff
_080C3828: .4byte 0x0600e000
	thumb_func_end sub_80C37E4

	thumb_func_start sub_80C3990
sub_80C3990: @ 80C3990
	push {r4,r5,lr}
	lsls r0, 24
	lsls r1, 24
	lsrs r5, r1, 24
	ldr r1, _080C39DC @ =gUnknown_02038670
	lsrs r0, 23
	adds r0, r1
	movs r1, 0
	ldrsh r0, [r0, r1]
	lsls r4, r0, 16
	adds r0, r4, 0
	movs r1, 0x3F
	bl __udivsi3
	adds r1, r0, 0
	ldr r0, _080C39E0 @ =0x0000ffff
	ands r0, r1
	cmp r0, 0
	beq _080C39BC
	movs r0, 0x80
	lsls r0, 9
	adds r1, r0
_080C39BC:
	lsrs r1, 16
	cmp r1, 0
	bne _080C39C8
	cmp r4, 0
	beq _080C39C8
	movs r1, 0x1
_080C39C8:
	cmp r5, 0
	beq _080C39D2
	cmp r1, 0xA
	bls _080C39D2
	movs r1, 0xA
_080C39D2:
	lsls r0, r1, 24
	lsrs r0, 24
	pop {r4,r5}
	pop {r1}
	bx r1
	.align 2, 0
_080C39DC: .4byte gUnknown_02038670
_080C39E0: .4byte 0x0000ffff
	thumb_func_end sub_80C3990

	thumb_func_start sub_80C39E4
sub_80C39E4: @ 80C39E4
	push {r4-r7,lr}
	lsls r0, 24
	lsrs r5, r0, 24
	lsls r1, 24
	lsrs r6, r1, 24
	ldr r1, _080C3A44 @ =gUnknown_02038688
	lsls r0, r5, 1
	adds r0, r1
	movs r2, 0
	ldrsh r0, [r0, r2]
	adds r7, r1, 0
	cmp r0, 0
	bge _080C3A00
	negs r0, r0
_080C3A00:
	lsls r4, r0, 16
	adds r0, r4, 0
	movs r1, 0x50
	bl __udivsi3
	adds r2, r0, 0
	ldr r0, _080C3A48 @ =0x0000ffff
	ands r0, r2
	cmp r0, 0
	beq _080C3A1A
	movs r0, 0x80
	lsls r0, 9
	adds r2, r0
_080C3A1A:
	lsrs r2, 16
	cmp r2, 0
	bne _080C3A26
	cmp r4, 0
	beq _080C3A26
	movs r2, 0x1
_080C3A26:
	cmp r6, 0
	beq _080C3A30
	cmp r2, 0xA
	bls _080C3A30
	movs r2, 0xA
_080C3A30:
	lsls r0, r5, 1
	adds r0, r7
	movs r1, 0
	ldrsh r0, [r0, r1]
	cmp r0, 0
	bge _080C3A4C
	negs r0, r2
	lsls r0, 24
	b _080C3A4E
	.align 2, 0
_080C3A44: .4byte gUnknown_02038688
_080C3A48: .4byte 0x0000ffff
_080C3A4C:
	lsls r0, r2, 24
_080C3A4E:
	lsrs r0, 24
	lsls r0, 24
	asrs r0, 24
	pop {r4-r7}
	pop {r1}
	bx r1
	thumb_func_end sub_80C39E4

	thumb_func_start sub_80C3A5C
sub_80C3A5C: @ 80C3A5C
	push {r4,lr}
	lsls r0, 24
	lsrs r0, 24
	adds r4, r0, 0
	ldr r1, _080C3A90 @ =gTasks
	lsls r0, r4, 2
	adds r0, r4
	lsls r0, 3
	adds r3, r0, r1
	ldrh r2, [r3, 0x1C]
	movs r1, 0x1C
	ldrsh r0, [r3, r1]
	cmp r0, 0
	bne _080C3A94
	movs r1, 0x8
	ldrsh r0, [r3, r1]
	movs r1, 0x3
	subs r1, r0
	lsls r0, r1, 2
	adds r0, r1
	lsls r0, 3
	strh r0, [r3, 0x1E]
	adds r0, r2, 0x1
	strh r0, [r3, 0x1C]
	b _080C3B12
	.align 2, 0
_080C3A90: .4byte gTasks
_080C3A94:
	cmp r0, 0x1
	bne _080C3B12
	ldrh r0, [r3, 0x1E]
	subs r0, 0x1
	strh r0, [r3, 0x1E]
	lsls r0, 16
	asrs r0, 16
	movs r1, 0x1
	negs r1, r1
	cmp r0, r1
	bne _080C3B12
	movs r0, 0x8
	ldrsh r2, [r3, r0]
	lsls r2, 17
	ldr r1, _080C3B18 @ =0x50430000
	adds r2, r1
	lsrs r2, 16
	movs r0, 0xA
	ldrsh r1, [r3, r0]
	lsls r0, r1, 1
	adds r0, r1
	lsls r0, 6
	ldr r1, _080C3B1C @ =0x0600e142
	adds r0, r1
	strh r2, [r0]
	movs r0, 0xA
	ldrsh r1, [r3, r0]
	lsls r0, r1, 1
	adds r0, r1
	lsls r0, 6
	ldr r1, _080C3B20 @ =0x0600e144
	adds r0, r1
	adds r1, r2, 0x1
	strh r1, [r0]
	movs r0, 0xA
	ldrsh r1, [r3, r0]
	lsls r0, r1, 1
	adds r0, r1
	lsls r0, 6
	ldr r1, _080C3B24 @ =0x0600e182
	adds r0, r1
	adds r1, r2, 0
	adds r1, 0x10
	strh r1, [r0]
	movs r0, 0xA
	ldrsh r1, [r3, r0]
	lsls r0, r1, 1
	adds r0, r1
	lsls r0, 6
	ldr r1, _080C3B28 @ =0x0600e184
	adds r0, r1
	adds r2, 0x11
	strh r2, [r0]
	ldr r1, _080C3B2C @ =0x02018000
	ldrb r0, [r1, 0x5]
	adds r0, 0x1
	strb r0, [r1, 0x5]
	adds r0, r4, 0
	bl DestroyTask
	movs r0, 0x18
	bl PlaySE
_080C3B12:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080C3B18: .4byte 0x50430000
_080C3B1C: .4byte 0x0600e142
_080C3B20: .4byte 0x0600e144
_080C3B24: .4byte 0x0600e182
_080C3B28: .4byte 0x0600e184
_080C3B2C: .4byte 0x02018000
	thumb_func_end sub_80C3A5C

	thumb_func_start sub_80C3B30
sub_80C3B30: @ 80C3B30
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	lsls r0, 24
	lsrs r0, 24
	mov r12, r0
	movs r5, 0
	ldr r1, _080C3BC0 @ =gUnknown_02038690
	ldrb r0, [r1]
	ldr r2, _080C3BC4 @ =gTasks
	mov r10, r2
	cmp r0, 0
	beq _080C3B5C
_080C3B4E:
	adds r5, 0x1
	cmp r5, 0x3
	bgt _080C3B5C
	adds r0, r5, r1
	ldrb r0, [r0]
	cmp r0, 0
	bne _080C3B4E
_080C3B5C:
	movs r1, 0
	lsls r0, r5, 1
	mov r2, r12
	lsls r2, 2
	mov r9, r2
	adds r0, r5
	lsls r0, 5
	mov r8, r0
	ldr r7, _080C3BC8 @ =0x00000fff
	movs r0, 0x90
	lsls r0, 8
	adds r6, r0, 0
_080C3B74:
	lsls r0, r1, 5
	adds r4, r1, 0x1
	add r0, r8
	movs r3, 0x1D
	lsls r0, 1
	ldr r1, _080C3BCC @ =0x0600e100
	adds r2, r0, r1
_080C3B82:
	ldrh r1, [r2]
	adds r0, r7, 0
	ands r0, r1
	orrs r0, r6
	strh r0, [r2]
	adds r2, 0x2
	subs r3, 0x1
	cmp r3, 0
	bge _080C3B82
	adds r1, r4, 0
	cmp r1, 0x2
	ble _080C3B74
	mov r0, r9
	add r0, r12
	lsls r0, 3
	add r0, r10
	strh r5, [r0, 0x1C]
	movs r1, 0x1
	strh r1, [r0, 0x20]
	ldr r2, _080C3BD0 @ =sub_80C3BD8
	str r2, [r0]
	mov r1, r12
	ldr r0, _080C3BD4 @ =0x02018000
	strb r1, [r0, 0x3]
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080C3BC0: .4byte gUnknown_02038690
_080C3BC4: .4byte gTasks
_080C3BC8: .4byte 0x00000fff
_080C3BCC: .4byte 0x0600e100
_080C3BD0: .4byte sub_80C3BD8
_080C3BD4: .4byte 0x02018000
	thumb_func_end sub_80C3B30

	thumb_func_start sub_80C3BD8
sub_80C3BD8: @ 80C3BD8
	push {r4,r5,lr}
	lsls r0, 24
	lsrs r0, 24
	ldr r2, _080C3C24 @ =gTasks
	lsls r1, r0, 2
	adds r1, r0
	lsls r1, 3
	adds r4, r1, r2
	ldrh r0, [r4, 0x1E]
	adds r0, 0x1
	strh r0, [r4, 0x1E]
	lsls r0, 16
	asrs r5, r0, 16
	cmp r5, 0x1
	bne _080C3C3C
	movs r0, 0
	strh r0, [r4, 0x1E]
	ldrh r2, [r4, 0x20]
	lsls r2, 24
	lsrs r2, 24
	ldr r3, _080C3C28 @ =0x00006f8d
	movs r0, 0x91
	movs r1, 0x1
	bl BlendPalette
	movs r1, 0x22
	ldrsh r0, [r4, r1]
	cmp r0, 0
	bne _080C3C2C
	ldrh r0, [r4, 0x20]
	adds r0, 0x1
	strh r0, [r4, 0x20]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x10
	bne _080C3C3C
	strh r5, [r4, 0x22]
	b _080C3C3C
	.align 2, 0
_080C3C24: .4byte gTasks
_080C3C28: .4byte 0x00006f8d
_080C3C2C:
	ldrh r0, [r4, 0x20]
	subs r0, 0x1
	strh r0, [r4, 0x20]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0
	bne _080C3C3C
	strh r0, [r4, 0x22]
_080C3C3C:
	pop {r4,r5}
	pop {r0}
	bx r0
	thumb_func_end sub_80C3BD8

	thumb_func_start sub_80C3C44
sub_80C3C44: @ 80C3C44
	push {r4,lr}
	adds r4, r0, 0
	ldrh r1, [r4, 0x2E]
	movs r2, 0x2E
	ldrsh r0, [r4, r2]
	cmp r0, 0x9
	bgt _080C3C6C
	adds r0, r1, 0x1
	strh r0, [r4, 0x2E]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0xA
	bne _080C3CA8
	ldrh r0, [r4, 0x30]
	movs r1, 0
	bl PlayCry1
	movs r0, 0
	strh r0, [r4, 0x30]
	b _080C3CA8
_080C3C6C:
	movs r0, 0xC0
	lsls r0, 3
	adds r2, r0, 0
	ldrh r1, [r4, 0x30]
	adds r2, r1
	lsls r1, r2, 16
	asrs r1, 24
	ldrh r0, [r4, 0x20]
	subs r0, r1
	strh r0, [r4, 0x20]
	movs r1, 0xFF
	ands r2, r1
	strh r2, [r4, 0x30]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x77
	bgt _080C3C92
	movs r0, 0x78
	strh r0, [r4, 0x20]
_080C3C92:
	movs r2, 0x20
	ldrsh r0, [r4, r2]
	cmp r0, 0x78
	bne _080C3CA8
	ldr r0, _080C3CB0 @ =SpriteCallbackDummy
	str r0, [r4, 0x1C]
	movs r0, 0
	strh r0, [r4, 0x30]
	ldr r1, _080C3CB4 @ =0x02018000
	movs r0, 0x1
	strb r0, [r1, 0x6]
_080C3CA8:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080C3CB0: .4byte SpriteCallbackDummy
_080C3CB4: .4byte 0x02018000
	thumb_func_end sub_80C3C44

	thumb_func_start sub_80C3CB8
sub_80C3CB8: @ 80C3CB8
	push {lr}
	adds r3, r0, 0
	movs r0, 0xC0
	lsls r0, 3
	adds r2, r0, 0
	ldrh r0, [r3, 0x30]
	adds r2, r0
	lsls r1, r2, 16
	asrs r1, 24
	ldrh r0, [r3, 0x20]
	subs r0, r1
	strh r0, [r3, 0x20]
	movs r1, 0xFF
	ands r2, r1
	strh r2, [r3, 0x30]
	lsls r0, 16
	asrs r0, 16
	movs r1, 0x20
	negs r1, r1
	cmp r0, r1
	bge _080C3CF8
	ldr r0, _080C3CFC @ =SpriteCallbackDummy
	str r0, [r3, 0x1C]
	adds r2, r3, 0
	adds r2, 0x3E
	ldrb r0, [r2]
	movs r1, 0x4
	orrs r0, r1
	strb r0, [r2]
	ldr r1, _080C3D00 @ =0x02018000
	movs r0, 0x2
	strb r0, [r1, 0x6]
_080C3CF8:
	pop {r0}
	bx r0
	.align 2, 0
_080C3CFC: .4byte SpriteCallbackDummy
_080C3D00: .4byte 0x02018000
	thumb_func_end sub_80C3CB8

	thumb_func_start sub_80C3D04
sub_80C3D04: @ 80C3D04
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	lsls r0, 24
	lsrs r7, r0, 24
	ldr r1, _080C3DD8 @ =gTasks
	lsls r0, r7, 2
	adds r0, r7
	lsls r0, 3
	adds r1, r0, r1
	ldrh r0, [r1, 0x8]
	adds r0, 0x1
	strh r0, [r1, 0x8]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x5
	bne _080C3DBE
	movs r0, 0
	strh r0, [r1, 0x8]
	ldr r0, _080C3DDC @ =0x02018000
	mov r8, r0
	ldrb r0, [r0, 0x7]
	cmp r0, 0x27
	bhi _080C3DBE
	ldr r4, _080C3DE0 @ =gSpriteTemplate_83D17B4
	bl Random
	lsls r0, 16
	lsrs r0, 16
	movs r1, 0xF0
	bl __umodsi3
	adds r1, r0, 0
	subs r1, 0x14
	lsls r1, 16
	asrs r1, 16
	adds r0, r4, 0
	movs r2, 0x2C
	movs r3, 0x5
	bl CreateSprite
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	bl Random
	ldr r1, _080C3DE4 @ =gSprites
	lsls r5, r4, 4
	adds r5, r4
	lsls r5, 2
	adds r5, r1
	lsls r0, 23
	lsrs r0, 23
	strh r0, [r5, 0x2E]
	bl Random
	lsls r0, 16
	lsrs r0, 16
	movs r1, 0x18
	bl __umodsi3
	adds r0, 0x10
	strh r0, [r5, 0x30]
	bl Random
	lsls r0, 16
	lsrs r0, 16
	movs r1, 0xFF
	ands r0, r1
	adds r0, 0x30
	strh r0, [r5, 0x32]
	bl Random
	ldrh r6, [r5, 0x4]
	lsls r4, r6, 22
	lsrs r4, 22
	lsls r0, 16
	lsrs r0, 16
	movs r1, 0x11
	bl __umodsi3
	adds r4, r0
	ldr r1, _080C3DE8 @ =0x000003ff
	adds r0, r1, 0
	ands r4, r0
	ldr r0, _080C3DEC @ =0xfffffc00
	ands r0, r6
	orrs r0, r4
	strh r0, [r5, 0x4]
	mov r1, r8
	ldrb r0, [r1, 0x7]
	adds r0, 0x1
	strb r0, [r1, 0x7]
_080C3DBE:
	ldr r0, _080C3DDC @ =0x02018000
	ldrb r0, [r0, 0x9]
	cmp r0, 0
	beq _080C3DCC
	adds r0, r7, 0
	bl DestroyTask
_080C3DCC:
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080C3DD8: .4byte gTasks
_080C3DDC: .4byte 0x02018000
_080C3DE0: .4byte gSpriteTemplate_83D17B4
_080C3DE4: .4byte gSprites
_080C3DE8: .4byte 0x000003ff
_080C3DEC: .4byte 0xfffffc00
	thumb_func_end sub_80C3D04

	thumb_func_start sub_80C3DF0
sub_80C3DF0: @ 80C3DF0
	push {r4,r5,lr}
	adds r4, r0, 0
	ldrh r0, [r4, 0x2E]
	ldrh r1, [r4, 0x34]
	adds r0, r1
	strh r0, [r4, 0x34]
	lsls r0, 16
	asrs r0, 24
	movs r2, 0x30
	ldrsh r1, [r4, r2]
	bl Sin
	strh r0, [r4, 0x24]
	ldrh r1, [r4, 0x32]
	ldrh r0, [r4, 0x36]
	adds r1, r0
	lsls r0, r1, 16
	asrs r0, 24
	ldrh r2, [r4, 0x20]
	adds r0, r2
	strh r0, [r4, 0x20]
	movs r0, 0xFF
	ands r1, r0
	strh r1, [r4, 0x36]
	ldrh r0, [r4, 0x22]
	adds r0, 0x1
	strh r0, [r4, 0x22]
	ldr r5, _080C3E5C @ =0x02018000
	ldrb r0, [r5, 0x9]
	cmp r0, 0
	beq _080C3E3A
	adds r2, r4, 0
	adds r2, 0x3E
	ldrb r0, [r2]
	movs r1, 0x4
	orrs r0, r1
	strb r0, [r2]
_080C3E3A:
	movs r1, 0x20
	ldrsh r0, [r4, r1]
	cmp r0, 0xF8
	bgt _080C3E4A
	movs r2, 0x22
	ldrsh r0, [r4, r2]
	cmp r0, 0x74
	ble _080C3E56
_080C3E4A:
	adds r0, r4, 0
	bl DestroySprite
	ldrb r0, [r5, 0x7]
	subs r0, 0x1
	strb r0, [r5, 0x7]
_080C3E56:
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080C3E5C: .4byte 0x02018000
	thumb_func_end sub_80C3DF0

	thumb_func_start sub_80C3E60
sub_80C3E60: @ 80C3E60
	push {r4,r5,lr}
	adds r4, r0, 0
	adds r5, r1, 0
	lsls r4, 24
	lsrs r4, 24
	lsls r5, 24
	lsrs r5, 24
	ldr r0, _080C3E98 @ =sub_80C3EA4
	movs r1, 0x8
	bl CreateTask
	lsls r0, 24
	lsrs r0, 24
	ldr r2, _080C3E9C @ =gTasks
	lsls r1, r0, 2
	adds r1, r0
	lsls r1, 3
	adds r1, r2
	strh r4, [r1, 0x8]
	strh r5, [r1, 0xA]
	ldr r0, _080C3EA0 @ =gContestMons
	lsls r4, 6
	adds r4, r0
	ldrh r0, [r4]
	strh r0, [r1, 0xC]
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080C3E98: .4byte sub_80C3EA4
_080C3E9C: .4byte gTasks
_080C3EA0: .4byte gContestMons
	thumb_func_end sub_80C3E60

	thumb_func_start sub_80C3EA4
sub_80C3EA4: @ 80C3EA4
	push {r4,r5,lr}
	sub sp, 0x4
	lsls r0, 24
	lsrs r0, 24
	ldr r2, _080C3EF8 @ =gTasks
	lsls r1, r0, 2
	adds r1, r0
	lsls r1, 3
	adds r4, r1, r2
	ldrb r5, [r4, 0x8]
	ldrh r0, [r4, 0x1C]
	adds r1, r0, 0x1
	strh r1, [r4, 0x1C]
	lsls r0, 16
	asrs r0, 16
	movs r2, 0xA
	ldrsh r1, [r4, r2]
	cmp r0, r1
	bne _080C3EEE
	movs r0, 0
	strh r0, [r4, 0x1C]
	ldrh r0, [r4, 0xC]
	ldrb r2, [r4, 0x1E]
	ldr r1, _080C3EFC @ =gContestMons
	lsls r3, r5, 6
	adds r1, 0x38
	adds r3, r1
	ldr r1, [r3]
	str r1, [sp]
	adds r1, r5, 0
	movs r3, 0
	bl sub_80C3024
	ldrh r0, [r4, 0x1E]
	movs r1, 0x1
	eors r0, r1
	strh r0, [r4, 0x1E]
_080C3EEE:
	add sp, 0x4
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080C3EF8: .4byte gTasks
_080C3EFC: .4byte gContestMons
	thumb_func_end sub_80C3EA4

	thumb_func_start sub_80C3F00
sub_80C3F00: @ 80C3F00
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	ldr r0, _080C4098 @ =gUnknown_02038678
	ldrh r2, [r0]
	adds r4, r0, 0
	adds r3, r4, 0x2
	movs r0, 0x2
	mov r8, r0
_080C3F16:
	lsls r0, r2, 16
	asrs r0, 16
	movs r5, 0
	ldrsh r1, [r3, r5]
	cmp r0, r1
	bge _080C3F24
	ldrh r2, [r3]
_080C3F24:
	adds r3, 0x2
	movs r0, 0x1
	negs r0, r0
	add r8, r0
	mov r1, r8
	cmp r1, 0
	bge _080C3F16
	lsls r0, r2, 16
	mov r9, r0
	cmp r0, 0
	bge _080C3F62
	ldrh r2, [r4]
	adds r3, r4, 0x2
	movs r4, 0x2
	mov r8, r4
_080C3F42:
	lsls r0, r2, 16
	asrs r0, 16
	movs r5, 0
	ldrsh r1, [r3, r5]
	cmp r0, r1
	ble _080C3F50
	ldrh r2, [r3]
_080C3F50:
	adds r3, 0x2
	movs r0, 0x1
	negs r0, r0
	add r8, r0
	lsls r1, r2, 16
	mov r9, r1
	mov r4, r8
	cmp r4, 0
	bge _080C3F42
_080C3F62:
	movs r5, 0
	mov r8, r5
	mov r10, r5
_080C3F68:
	ldr r0, _080C409C @ =gUnknown_02038670
	mov r1, r8
	lsls r7, r1, 1
	adds r0, r7, r0
	movs r2, 0
	ldrsh r1, [r0, r2]
	lsls r0, r1, 5
	subs r0, r1
	lsls r0, 2
	adds r0, r1
	lsls r0, 3
	mov r4, r9
	asrs r6, r4, 16
	adds r1, r6, 0
	cmp r6, 0
	bge _080C3F8A
	negs r1, r6
_080C3F8A:
	bl __divsi3
	adds r4, r0, 0
	movs r1, 0xA
	bl __modsi3
	cmp r0, 0x4
	ble _080C3F9C
	adds r4, 0xA
_080C3F9C:
	ldr r0, _080C40A0 @ =0x02018018
	mov r1, r10
	adds r5, r1, r0
	adds r0, r4, 0
	movs r1, 0xA
	bl __divsi3
	str r0, [r5]
	ldr r0, _080C40A4 @ =gUnknown_02038688
	adds r7, r0
	movs r2, 0
	ldrsh r1, [r7, r2]
	cmp r1, 0
	bge _080C3FBA
	negs r1, r1
_080C3FBA:
	lsls r0, r1, 5
	subs r0, r1
	lsls r0, 2
	adds r0, r1
	lsls r0, 3
	adds r1, r6, 0
	cmp r1, 0
	bge _080C3FCC
	negs r1, r1
_080C3FCC:
	bl __divsi3
	adds r4, r0, 0
	movs r1, 0xA
	bl __modsi3
	cmp r0, 0x4
	ble _080C3FDE
	adds r4, 0xA
_080C3FDE:
	adds r0, r4, 0
	movs r1, 0xA
	bl __divsi3
	str r0, [r5, 0x4]
	movs r4, 0
	ldrsh r0, [r7, r4]
	cmp r0, 0
	bge _080C3FF4
	movs r0, 0x1
	strb r0, [r5, 0x10]
_080C3FF4:
	ldr r1, [r5]
	lsls r0, r1, 1
	adds r0, r1
	lsls r0, 2
	subs r0, r1
	lsls r0, 11
	movs r1, 0x64
	bl __divsi3
	adds r1, r0, 0
	movs r4, 0xFF
	ands r0, r4
	cmp r0, 0x7F
	bls _080C4016
	movs r0, 0x80
	lsls r0, 1
	adds r1, r0
_080C4016:
	lsrs r0, r1, 8
	str r0, [r5, 0x8]
	ldr r1, [r5, 0x4]
	lsls r0, r1, 1
	adds r0, r1
	lsls r0, 2
	subs r0, r1
	lsls r0, 11
	movs r1, 0x64
	bl __divsi3
	adds r1, r0, 0
	ands r0, r4
	cmp r0, 0x7F
	bls _080C403A
	movs r2, 0x80
	lsls r2, 1
	adds r1, r2
_080C403A:
	lsrs r0, r1, 8
	str r0, [r5, 0xC]
	mov r0, r8
	lsls r4, r0, 24
	lsrs r4, 24
	adds r0, r4, 0
	movs r1, 0x1
	bl sub_80C3990
	strb r0, [r5, 0x11]
	adds r0, r4, 0
	movs r1, 0x1
	bl sub_80C39E4
	lsls r0, 24
	asrs r0, 24
	cmp r0, 0
	bge _080C4060
	negs r0, r0
_080C4060:
	strb r0, [r5, 0x12]
	ldr r0, _080C40A8 @ =gUnknown_02038690
	add r0, r8
	ldrb r0, [r0]
	cmp r0, 0
	beq _080C40B4
	ldr r4, [r5, 0x8]
	ldrh r2, [r5, 0x8]
	ldr r3, [r5, 0xC]
	ldrh r1, [r5, 0xC]
	ldrb r0, [r5, 0x10]
	cmp r0, 0
	beq _080C4080
	lsls r0, r1, 16
	negs r0, r0
	lsrs r1, r0, 16
_080C4080:
	lsls r0, r2, 16
	asrs r2, r0, 16
	lsls r0, r1, 16
	asrs r1, r0, 16
	adds r0, r2, r1
	cmp r0, 0x58
	bne _080C40B4
	cmp r1, 0
	ble _080C40AC
	subs r0, r3, 0x1
	str r0, [r5, 0xC]
	b _080C40B4
	.align 2, 0
_080C4098: .4byte gUnknown_02038678
_080C409C: .4byte gUnknown_02038670
_080C40A0: .4byte 0x02018018
_080C40A4: .4byte gUnknown_02038688
_080C40A8: .4byte gUnknown_02038690
_080C40AC:
	cmp r2, 0
	ble _080C40B4
	subs r0, r4, 0x1
	str r0, [r5, 0x8]
_080C40B4:
	movs r1, 0x14
	add r10, r1
	movs r2, 0x1
	add r8, r2
	mov r4, r8
	cmp r4, 0x3
	bgt _080C40C4
	b _080C3F68
_080C40C4:
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	thumb_func_end sub_80C3F00

	thumb_func_start sub_80C40D4
sub_80C40D4: @ 80C40D4
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	sub sp, 0x8
	lsls r0, 24
	lsls r1, 24
	lsrs r7, r1, 24
	movs r1, 0
	mov r10, r1
	movs r2, 0
	str r2, [sp]
	cmp r0, 0
	bne _080C4198
	mov r8, r2
	ldr r0, _080C417C @ =0x02018018
	subs r1, 0x18
	adds r1, r0
	mov r9, r1
	adds r4, r0, 0
	adds r4, 0x8
	movs r6, 0xA0
_080C4102:
	ldrb r0, [r4, 0x9]
	cmp r7, r0
	bcs _080C416A
	adds r0, 0x13
	adds r0, r6, r0
	subs r0, r7
	lsls r0, 1
	ldr r2, _080C4180 @ =0x0600bffe
	adds r0, r2
	ldr r2, _080C4184 @ =0x000060b3
	adds r1, r2, 0
	strh r1, [r0]
	ldr r0, _080C4188 @ =sub_80C42C0
	movs r1, 0xA
	bl CreateTask
	lsls r0, 24
	lsrs r5, r0, 24
	ldr r0, [r4]
	lsls r0, 16
	ldrb r1, [r4, 0x9]
	bl __udivsi3
	adds r1, r7, 0x1
	adds r3, r0, 0
	muls r3, r1
	ldr r0, _080C418C @ =0x0000ffff
	ands r0, r3
	ldr r1, _080C4190 @ =0x00007fff
	cmp r0, r1
	bls _080C4146
	movs r0, 0x80
	lsls r0, 9
	adds r3, r0
_080C4146:
	ldr r1, _080C4194 @ =gTasks
	lsls r0, r5, 2
	adds r0, r5
	lsls r0, 3
	adds r0, r1
	mov r1, r8
	strh r1, [r0, 0x8]
	lsrs r1, r3, 16
	strh r1, [r0, 0xA]
	mov r2, r9
	ldrb r0, [r2, 0x14]
	adds r0, 0x1
	strb r0, [r2, 0x14]
	mov r0, r10
	adds r0, 0x1
	lsls r0, 24
	lsrs r0, 24
	mov r10, r0
_080C416A:
	adds r4, 0x14
	adds r6, 0x60
	movs r0, 0x1
	add r8, r0
	mov r1, r8
	cmp r1, 0x3
	ble _080C4102
	b _080C4292
	.align 2, 0
_080C417C: .4byte 0x02018018
_080C4180: .4byte 0x0600bffe
_080C4184: .4byte 0x000060b3
_080C4188: .4byte sub_80C42C0
_080C418C: .4byte 0x0000ffff
_080C4190: .4byte 0x00007fff
_080C4194: .4byte gTasks
_080C4198:
	movs r2, 0
	mov r8, r2
	ldr r0, _080C4220 @ =0x02018018
	mov r12, r0
	mov r9, r2
	movs r1, 0xC0
	str r1, [sp, 0x4]
_080C41A6:
	mov r6, r9
	add r6, r12
	ldrb r1, [r6, 0x12]
	ldrb r0, [r6, 0x10]
	ldr r2, _080C4224 @ =0x000060a3
	cmp r0, 0
	beq _080C41B6
	adds r2, 0x2
_080C41B6:
	lsls r0, r1, 24
	asrs r0, 24
	cmp r7, r0
	bge _080C427E
	adds r0, 0x13
	ldr r1, [sp, 0x4]
	adds r0, r1, r0
	subs r0, r7
	lsls r0, 1
	ldr r1, _080C4228 @ =0x0600bffe
	adds r0, r1
	strh r2, [r0]
	ldr r0, _080C422C @ =sub_80C42C0
	movs r1, 0xA
	bl CreateTask
	lsls r0, 24
	lsrs r5, r0, 24
	ldr r0, [r6, 0xC]
	lsls r0, 16
	ldrb r1, [r6, 0x12]
	bl __udivsi3
	adds r1, r7, 0x1
	adds r3, r0, 0
	muls r3, r1
	ldr r0, _080C4230 @ =0x0000ffff
	ands r0, r3
	ldr r1, _080C4234 @ =0x00007fff
	cmp r0, r1
	bls _080C41FA
	movs r2, 0x80
	lsls r2, 9
	adds r3, r2
_080C41FA:
	ldr r1, _080C4238 @ =gTasks
	lsls r2, r5, 2
	adds r0, r2, r5
	lsls r0, 3
	adds r4, r0, r1
	mov r0, r8
	strh r0, [r4, 0x8]
	ldrb r0, [r6, 0x10]
	adds r6, r1, 0
	cmp r0, 0
	beq _080C423C
	movs r0, 0x1
	strh r0, [r4, 0xC]
	ldr r0, [sp]
	adds r0, 0x1
	lsls r0, 24
	lsrs r0, 24
	str r0, [sp]
	b _080C4246
	.align 2, 0
_080C4220: .4byte 0x02018018
_080C4224: .4byte 0x000060a3
_080C4228: .4byte 0x0600bffe
_080C422C: .4byte sub_80C42C0
_080C4230: .4byte 0x0000ffff
_080C4234: .4byte 0x00007fff
_080C4238: .4byte gTasks
_080C423C:
	mov r0, r10
	adds r0, 0x1
	lsls r0, 24
	lsrs r0, 24
	mov r10, r0
_080C4246:
	ldr r0, _080C4264 @ =0x02018018
	mov r1, r9
	adds r4, r1, r0
	ldrb r1, [r4, 0x10]
	mov r12, r0
	cmp r1, 0
	beq _080C4268
	adds r0, r2, r5
	lsls r0, 3
	adds r0, r6
	lsrs r2, r3, 16
	ldr r1, [r4, 0x8]
	subs r1, r2
	b _080C4274
	.align 2, 0
_080C4264: .4byte 0x02018018
_080C4268:
	adds r0, r2, r5
	lsls r0, 3
	adds r0, r6
	lsrs r2, r3, 16
	ldr r1, [r4, 0x8]
	adds r1, r2
_080C4274:
	strh r1, [r0, 0xA]
	ldr r1, _080C42BC @ =0x02018000
	ldrb r0, [r1, 0x14]
	adds r0, 0x1
	strb r0, [r1, 0x14]
_080C427E:
	movs r2, 0x14
	add r9, r2
	ldr r0, [sp, 0x4]
	adds r0, 0x60
	str r0, [sp, 0x4]
	movs r1, 0x1
	add r8, r1
	mov r2, r8
	cmp r2, 0x3
	ble _080C41A6
_080C4292:
	ldr r0, [sp]
	cmp r0, 0
	beq _080C429E
	movs r0, 0x16
	bl PlaySE
_080C429E:
	mov r1, r10
	cmp r1, 0
	beq _080C42AA
	movs r0, 0x15
	bl PlaySE
_080C42AA:
	add sp, 0x8
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080C42BC: .4byte 0x02018000
	thumb_func_end sub_80C40D4

	thumb_func_start sub_80C42C0
sub_80C42C0: @ 80C42C0
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	lsls r0, 24
	lsrs r0, 24
	mov r12, r0
	movs r6, 0
	mov r9, r6
	ldr r1, _080C4308 @ =gTasks
	lsls r0, 2
	add r0, r12
	lsls r0, 3
	adds r0, r1
	ldrb r5, [r0, 0x8]
	ldrh r7, [r0, 0xA]
	ldrh r1, [r0, 0xC]
	mov r8, r1
	movs r2, 0xC
	ldrsh r0, [r0, r2]
	cmp r0, 0
	beq _080C4310
	ldr r1, _080C430C @ =0x02018000
	lsls r2, r5, 1
	adds r0, r1, 0
	adds r0, 0xC
	adds r0, r2, r0
	movs r3, 0
	ldrsh r0, [r0, r3]
	mov r10, r1
	adds r4, r2, 0
	cmp r0, 0
	bgt _080C4328
	b _080C4326
	.align 2, 0
_080C4308: .4byte gTasks
_080C430C: .4byte 0x02018000
_080C4310:
	ldr r1, _080C4350 @ =0x02018000
	lsls r2, r5, 1
	adds r0, r1, 0
	adds r0, 0xC
	adds r0, r2, r0
	movs r3, 0
	ldrsh r0, [r0, r3]
	mov r10, r1
	adds r4, r2, 0
	cmp r0, 0x57
	ble _080C4328
_080C4326:
	movs r6, 0x1
_080C4328:
	mov r0, r10
	adds r0, 0xC
	adds r3, r4, r0
	ldrh r2, [r3]
	movs r0, 0
	ldrsh r1, [r3, r0]
	lsls r0, r7, 16
	asrs r0, 16
	cmp r1, r0
	bne _080C4340
	movs r1, 0x1
	mov r9, r1
_080C4340:
	mov r0, r9
	cmp r0, 0
	bne _080C4362
	cmp r6, 0
	beq _080C4354
	strh r7, [r3]
	b _080C4362
	.align 2, 0
_080C4350: .4byte 0x02018000
_080C4354:
	mov r1, r8
	cmp r1, 0
	beq _080C435E
	subs r0, r2, 0x1
	b _080C4360
_080C435E:
	adds r0, r2, 0x1
_080C4360:
	strh r0, [r3]
_080C4362:
	cmp r6, 0
	bne _080C43C8
	mov r2, r9
	cmp r2, 0
	bne _080C43CE
	movs r2, 0
	ldr r0, _080C4388 @ =0x0201800c
	adds r6, r4, r0
	adds r0, r4, r5
	lsls r5, r0, 5
_080C4376:
	movs r0, 0
	ldrsh r3, [r6, r0]
	adds r0, r2, 0x1
	lsls r1, r0, 3
	adds r4, r0, 0
	cmp r3, r1
	blt _080C438C
	movs r0, 0x8
	b _080C43A8
	.align 2, 0
_080C4388: .4byte 0x0201800c
_080C438C:
	lsls r0, r2, 3
	cmp r3, r0
	blt _080C43A6
	adds r0, r3, 0
	cmp r3, 0
	bge _080C439A
	adds r0, r3, 0x7
_080C439A:
	asrs r0, 3
	lsls r0, 3
	subs r0, r3, r0
	lsls r0, 24
	lsrs r0, 24
	b _080C43A8
_080C43A6:
	movs r0, 0
_080C43A8:
	cmp r0, 0x3
	bhi _080C43B4
	ldr r3, _080C43B0 @ =0x0000504c
	b _080C43B6
	.align 2, 0
_080C43B0: .4byte 0x0000504c
_080C43B4:
	ldr r3, _080C43EC @ =0x00005057
_080C43B6:
	adds r1, r0, r3
	adds r0, r5, r2
	lsls r0, 1
	ldr r2, _080C43F0 @ =0x0600e18e
	adds r0, r2
	strh r1, [r0]
	adds r2, r4, 0
	cmp r2, 0xA
	ble _080C4376
_080C43C8:
	mov r3, r9
	cmp r3, 0
	beq _080C43DC
_080C43CE:
	mov r1, r10
	ldrb r0, [r1, 0x14]
	subs r0, 0x1
	strb r0, [r1, 0x14]
	mov r0, r12
	bl DestroyTask
_080C43DC:
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080C43EC: .4byte 0x00005057
_080C43F0: .4byte 0x0600e18e
	thumb_func_end sub_80C42C0

	thumb_func_start sub_80C43F4
sub_80C43F4: @ 80C43F4
	push {r4,r5,lr}
	ldr r0, _080C442C @ =gUnknown_02038694
	ldrb r1, [r0]
	movs r0, 0x64
	muls r0, r1
	ldr r1, _080C4430 @ =gPlayerParty
	adds r0, r1
	bl sub_80AE47C
	lsls r0, 24
	lsrs r0, 24
	adds r5, r0, 0
	cmp r5, 0
	beq _080C4422
	ldr r4, _080C4434 @ =gScriptContestCategory
	ldrb r0, [r4]
	ldr r1, _080C4438 @ =gScriptContestRank
	ldrb r1, [r1]
	bl sub_80AE398
	ldrb r0, [r4]
	bl sub_80AE82C
_080C4422:
	ldr r0, _080C443C @ =gScriptResult
	strh r5, [r0]
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080C442C: .4byte gUnknown_02038694
_080C4430: .4byte gPlayerParty
_080C4434: .4byte gScriptContestCategory
_080C4438: .4byte gScriptContestRank
_080C443C: .4byte gScriptResult
	thumb_func_end sub_80C43F4

	thumb_func_start sub_80C4440
sub_80C4440: @ 80C4440
	push {r4,lr}
	movs r4, 0
	ldr r0, _080C4464 @ =gUnknown_02038694
	ldrb r1, [r0]
	movs r0, 0x64
	muls r1, r0
	ldr r0, _080C4468 @ =gPlayerParty
	adds r2, r1, r0
	ldr r0, _080C446C @ =gScriptContestCategory
	ldrh r0, [r0]
	cmp r0, 0x4
	bhi _080C44B2
	lsls r0, 2
	ldr r1, _080C4470 @ =_080C4474
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_080C4464: .4byte gUnknown_02038694
_080C4468: .4byte gPlayerParty
_080C446C: .4byte gScriptContestCategory
_080C4470: .4byte _080C4474
	.align 2, 0
_080C4474:
	.4byte _080C4488
	.4byte _080C448E
	.4byte _080C4494
	.4byte _080C449A
	.4byte _080C44A0
_080C4488:
	adds r0, r2, 0
	movs r1, 0x32
	b _080C44A4
_080C448E:
	adds r0, r2, 0
	movs r1, 0x33
	b _080C44A4
_080C4494:
	adds r0, r2, 0
	movs r1, 0x34
	b _080C44A4
_080C449A:
	adds r0, r2, 0
	movs r1, 0x35
	b _080C44A4
_080C44A0:
	adds r0, r2, 0
	movs r1, 0x36
_080C44A4:
	bl GetMonData
	ldr r1, _080C44BC @ =gScriptContestRank
	ldrh r1, [r1]
	cmp r0, r1
	bls _080C44B2
	movs r4, 0x1
_080C44B2:
	adds r0, r4, 0
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_080C44BC: .4byte gScriptContestRank
	thumb_func_end sub_80C4440

	thumb_func_start sub_80C44C0
sub_80C44C0: @ 80C44C0
	push {r4-r7,lr}
	sub sp, 0x4
	ldr r1, _080C44E8 @ =gUnknown_02038690
	ldr r0, _080C44EC @ =gContestPlayerMonIndex
	ldrb r0, [r0]
	adds r0, r1
	ldrb r0, [r0]
	cmp r0, 0
	beq _080C44D4
	b _080C465E
_080C44D4:
	ldr r0, _080C44F0 @ =gScriptContestCategory
	ldrh r0, [r0]
	cmp r0, 0x4
	bls _080C44DE
	b _080C465E
_080C44DE:
	lsls r0, 2
	ldr r1, _080C44F4 @ =_080C44F8
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_080C44E8: .4byte gUnknown_02038690
_080C44EC: .4byte gContestPlayerMonIndex
_080C44F0: .4byte gScriptContestCategory
_080C44F4: .4byte _080C44F8
	.align 2, 0
_080C44F8:
	.4byte _080C450C
	.4byte _080C4554
	.4byte _080C4598
	.4byte _080C45DC
	.4byte _080C4624
_080C450C:
	ldr r6, _080C4548 @ =gUnknown_02038694
	ldrb r0, [r6]
	movs r5, 0x64
	muls r0, r5
	ldr r4, _080C454C @ =gPlayerParty
	adds r0, r4
	movs r1, 0x32
	bl GetMonData
	lsls r0, 24
	lsrs r1, r0, 24
	mov r0, sp
	strb r1, [r0]
	ldr r0, _080C4550 @ =gScriptContestRank
	ldrh r0, [r0]
	cmp r1, r0
	bls _080C4530
	b _080C465E
_080C4530:
	adds r0, r1, 0
	cmp r0, 0x3
	bls _080C4538
	b _080C465E
_080C4538:
	adds r1, r0, 0x1
	mov r0, sp
	strb r1, [r0]
	ldrb r0, [r6]
	muls r0, r5
	adds r0, r4
	movs r1, 0x32
	b _080C4610
	.align 2, 0
_080C4548: .4byte gUnknown_02038694
_080C454C: .4byte gPlayerParty
_080C4550: .4byte gScriptContestRank
_080C4554:
	mov r4, sp
	ldr r7, _080C458C @ =gUnknown_02038694
	ldrb r0, [r7]
	movs r6, 0x64
	muls r0, r6
	ldr r5, _080C4590 @ =gPlayerParty
	adds r0, r5
	movs r1, 0x33
	bl GetMonData
	strb r0, [r4]
	mov r0, sp
	ldrb r2, [r0]
	ldr r0, _080C4594 @ =gScriptContestRank
	ldrh r0, [r0]
	cmp r2, r0
	bhi _080C465E
	cmp r2, 0x3
	bhi _080C465E
	mov r1, sp
	adds r0, r2, 0x1
	strb r0, [r1]
	ldrb r0, [r7]
	muls r0, r6
	adds r0, r5
	movs r1, 0x33
	b _080C4610
	.align 2, 0
_080C458C: .4byte gUnknown_02038694
_080C4590: .4byte gPlayerParty
_080C4594: .4byte gScriptContestRank
_080C4598:
	mov r4, sp
	ldr r7, _080C45D0 @ =gUnknown_02038694
	ldrb r0, [r7]
	movs r6, 0x64
	muls r0, r6
	ldr r5, _080C45D4 @ =gPlayerParty
	adds r0, r5
	movs r1, 0x34
	bl GetMonData
	strb r0, [r4]
	mov r0, sp
	ldrb r2, [r0]
	ldr r0, _080C45D8 @ =gScriptContestRank
	ldrh r0, [r0]
	cmp r2, r0
	bhi _080C465E
	cmp r2, 0x3
	bhi _080C465E
	mov r1, sp
	adds r0, r2, 0x1
	strb r0, [r1]
	ldrb r0, [r7]
	muls r0, r6
	adds r0, r5
	movs r1, 0x34
	b _080C4610
	.align 2, 0
_080C45D0: .4byte gUnknown_02038694
_080C45D4: .4byte gPlayerParty
_080C45D8: .4byte gScriptContestRank
_080C45DC:
	mov r4, sp
	ldr r7, _080C4618 @ =gUnknown_02038694
	ldrb r0, [r7]
	movs r6, 0x64
	muls r0, r6
	ldr r5, _080C461C @ =gPlayerParty
	adds r0, r5
	movs r1, 0x35
	bl GetMonData
	strb r0, [r4]
	mov r0, sp
	ldrb r2, [r0]
	ldr r0, _080C4620 @ =gScriptContestRank
	ldrh r0, [r0]
	cmp r2, r0
	bhi _080C465E
	cmp r2, 0x3
	bhi _080C465E
	mov r1, sp
	adds r0, r2, 0x1
	strb r0, [r1]
	ldrb r0, [r7]
	muls r0, r6
	adds r0, r5
	movs r1, 0x35
_080C4610:
	mov r2, sp
	bl SetMonData
	b _080C465E
	.align 2, 0
_080C4618: .4byte gUnknown_02038694
_080C461C: .4byte gPlayerParty
_080C4620: .4byte gScriptContestRank
_080C4624:
	mov r4, sp
	ldr r7, _080C4668 @ =gUnknown_02038694
	ldrb r0, [r7]
	movs r6, 0x64
	muls r0, r6
	ldr r5, _080C466C @ =gPlayerParty
	adds r0, r5
	movs r1, 0x36
	bl GetMonData
	strb r0, [r4]
	mov r0, sp
	ldrb r2, [r0]
	ldr r0, _080C4670 @ =gScriptContestRank
	ldrh r0, [r0]
	cmp r2, r0
	bhi _080C465E
	cmp r2, 0x3
	bhi _080C465E
	mov r1, sp
	adds r0, r2, 0x1
	strb r0, [r1]
	ldrb r0, [r7]
	muls r0, r6
	adds r0, r5
	movs r1, 0x36
	mov r2, sp
	bl SetMonData
_080C465E:
	add sp, 0x4
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080C4668: .4byte gUnknown_02038694
_080C466C: .4byte gPlayerParty
_080C4670: .4byte gScriptContestRank
	thumb_func_end sub_80C44C0

	thumb_func_start sub_80C4674
sub_80C4674: @ 80C4674
	push {r4,lr}
	adds r4, r0, 0
	bl StringCopy
	ldrb r0, [r4]
	cmp r0, 0xFC
	bne _080C4690
	ldrb r0, [r4, 0x1]
	cmp r0, 0x15
	bne _080C4690
	adds r0, r4, 0
	movs r1, 0x1
	bl ConvertInternationalString
_080C4690:
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end sub_80C4674

	thumb_func_start sub_80C4698
sub_80C4698: @ 80C4698
	push {r4,r5,lr}
	adds r5, r0, 0
	lsls r1, 24
	lsrs r4, r1, 24
	lsls r1, r4, 6
	ldr r0, _080C46E0 @ =gContestMons + 0x2
	adds r1, r0
	adds r0, r5, 0
	bl StringCopy
	ldr r0, _080C46E4 @ =gIsLinkContest
	ldrb r1, [r0]
	movs r0, 0x1
	ands r0, r1
	cmp r0, 0
	beq _080C46DA
	ldr r0, _080C46E8 @ =gLinkPlayers
	lsls r1, r4, 3
	subs r1, r4
	lsls r1, 2
	adds r1, r0
	ldrh r0, [r1, 0x1A]
	cmp r0, 0x1
	bne _080C46DA
	adds r0, r5, 0
	bl sub_80C86A0
	adds r1, r0, 0
	lsls r1, 24
	lsrs r1, 24
	adds r0, r5, 0
	bl ConvertInternationalString
_080C46DA:
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080C46E0: .4byte gContestMons + 0x2
_080C46E4: .4byte gIsLinkContest
_080C46E8: .4byte gLinkPlayers
	thumb_func_end sub_80C4698

	thumb_func_start sub_80C46EC
sub_80C46EC: @ 80C46EC
	push {lr}
	ldr r0, _080C4710 @ =gIsLinkContest
	ldrb r1, [r0]
	movs r0, 0x1
	ands r0, r1
	cmp r0, 0
	beq _080C4720
	ldr r0, _080C4714 @ =gStringVar1
	ldr r1, _080C4718 @ =gSpecialVar_0x8006
	ldrh r2, [r1]
	lsls r1, r2, 3
	subs r1, r2
	lsls r1, 2
	ldr r2, _080C471C @ =gLinkPlayers + 0x8
	adds r1, r2
	bl sub_80C4674
	b _080C4730
	.align 2, 0
_080C4710: .4byte gIsLinkContest
_080C4714: .4byte gStringVar1
_080C4718: .4byte gSpecialVar_0x8006
_080C471C: .4byte gLinkPlayers + 0x8
_080C4720:
	ldr r0, _080C4734 @ =gStringVar1
	ldr r1, _080C4738 @ =gSpecialVar_0x8006
	ldrh r1, [r1]
	lsls r1, 6
	ldr r2, _080C473C @ =gUnknown_0203857D
	adds r1, r2
	bl sub_80C4674
_080C4730:
	pop {r0}
	bx r0
	.align 2, 0
_080C4734: .4byte gStringVar1
_080C4738: .4byte gSpecialVar_0x8006
_080C473C: .4byte gUnknown_0203857D
	thumb_func_end sub_80C46EC

	thumb_func_start sub_80C4740
sub_80C4740: @ 80C4740
	push {lr}
	ldr r0, _080C4750 @ =gStringVar3
	ldr r1, _080C4754 @ =gSpecialVar_0x8006
	ldrb r1, [r1]
	bl sub_80C4698
	pop {r0}
	bx r0
	.align 2, 0
_080C4750: .4byte gStringVar3
_080C4754: .4byte gSpecialVar_0x8006
	thumb_func_end sub_80C4740

	thumb_func_start sub_80C4758
sub_80C4758: @ 80C4758
	push {r4-r6,lr}
	movs r1, 0
	movs r2, 0
	ldr r5, _080C4794 @ =gSpecialVar_0x8004
	ldr r4, _080C4798 @ =gUnknown_02038670
	ldr r0, _080C479C @ =gSpecialVar_0x8006
	ldrh r0, [r0]
	lsls r0, 1
	adds r0, r4
	movs r6, 0
	ldrsh r3, [r0, r6]
_080C476E:
	lsls r0, r1, 1
	adds r0, r4
	movs r6, 0
	ldrsh r0, [r0, r6]
	cmp r3, r0
	bge _080C4780
	adds r0, r2, 0x1
	lsls r0, 24
	lsrs r2, r0, 24
_080C4780:
	adds r0, r1, 0x1
	lsls r0, 24
	lsrs r1, r0, 24
	cmp r1, 0x3
	bls _080C476E
	strh r2, [r5]
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_080C4794: .4byte gSpecialVar_0x8004
_080C4798: .4byte gUnknown_02038670
_080C479C: .4byte gSpecialVar_0x8006
	thumb_func_end sub_80C4758

	thumb_func_start sub_80C47A0
sub_80C47A0: @ 80C47A0
	ldr r2, _080C47B4 @ =gSpecialVar_0x8004
	ldr r1, _080C47B8 @ =gUnknown_02038670
	ldr r0, _080C47BC @ =gSpecialVar_0x8006
	ldrh r0, [r0]
	lsls r0, 1
	adds r0, r1
	ldrh r0, [r0]
	strh r0, [r2]
	bx lr
	.align 2, 0
_080C47B4: .4byte gSpecialVar_0x8004
_080C47B8: .4byte gUnknown_02038670
_080C47BC: .4byte gSpecialVar_0x8006
	thumb_func_end sub_80C47A0

	thumb_func_start sub_80C47C0
sub_80C47C0: @ 80C47C0
	push {lr}
	movs r1, 0
	ldr r2, _080C47E8 @ =gUnknown_02038690
	ldrb r0, [r2]
	ldr r3, _080C47EC @ =gSpecialVar_0x8005
	cmp r0, 0
	beq _080C47E0
_080C47CE:
	adds r0, r1, 0x1
	lsls r0, 24
	lsrs r1, r0, 24
	cmp r1, 0x3
	bhi _080C47E0
	adds r0, r1, r2
	ldrb r0, [r0]
	cmp r0, 0
	bne _080C47CE
_080C47E0:
	strh r1, [r3]
	pop {r0}
	bx r0
	.align 2, 0
_080C47E8: .4byte gUnknown_02038690
_080C47EC: .4byte gSpecialVar_0x8005
	thumb_func_end sub_80C47C0

	thumb_func_start sub_80C47F0
sub_80C47F0: @ 80C47F0
	push {r4,lr}
	movs r2, 0
	ldr r3, _080C4830 @ =gUnknown_02038690
	ldrb r0, [r3]
	ldr r1, _080C4834 @ =gIsLinkContest
	ldr r4, _080C4838 @ =gStringVar3
	cmp r0, 0
	beq _080C4812
_080C4800:
	adds r0, r2, 0x1
	lsls r0, 24
	lsrs r2, r0, 24
	cmp r2, 0x3
	bhi _080C4812
	adds r0, r2, r3
	ldrb r0, [r0]
	cmp r0, 0
	bne _080C4800
_080C4812:
	ldrb r1, [r1]
	movs r0, 0x1
	ands r0, r1
	cmp r0, 0
	beq _080C4840
	lsls r1, r2, 3
	subs r1, r2
	lsls r1, 2
	ldr r0, _080C483C @ =gLinkPlayers + 0x8
	adds r1, r0
	adds r0, r4, 0
	bl sub_80C4674
	b _080C484C
	.align 2, 0
_080C4830: .4byte gUnknown_02038690
_080C4834: .4byte gIsLinkContest
_080C4838: .4byte gStringVar3
_080C483C: .4byte gLinkPlayers + 0x8
_080C4840:
	lsls r1, r2, 6
	ldr r0, _080C4854 @ =gUnknown_0203857D
	adds r1, r0
	adds r0, r4, 0
	bl sub_80C4674
_080C484C:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080C4854: .4byte gUnknown_0203857D
	thumb_func_end sub_80C47F0

	thumb_func_start sub_80C4858
sub_80C4858: @ 80C4858
	push {lr}
	movs r1, 0
	ldr r2, _080C4884 @ =gUnknown_02038690
	ldrb r0, [r2]
	ldr r3, _080C4888 @ =gStringVar1
	cmp r0, 0
	beq _080C4878
_080C4866:
	adds r0, r1, 0x1
	lsls r0, 24
	lsrs r1, r0, 24
	cmp r1, 0x3
	bhi _080C4878
	adds r0, r1, r2
	ldrb r0, [r0]
	cmp r0, 0
	bne _080C4866
_080C4878:
	adds r0, r3, 0
	bl sub_80C4698
	pop {r0}
	bx r0
	.align 2, 0
_080C4884: .4byte gUnknown_02038690
_080C4888: .4byte gStringVar1
	thumb_func_end sub_80C4858

	thumb_func_start sub_80C488C
sub_80C488C: @ 80C488C
	push {lr}
	ldr r0, _080C4898 @ =sub_80AB47C
	bl SetMainCallback2
	pop {r0}
	bx r0
	.align 2, 0
_080C4898: .4byte sub_80AB47C
	thumb_func_end sub_80C488C

	thumb_func_start sub_80C489C
sub_80C489C: @ 80C489C
	push {lr}
	lsls r0, 24
	lsrs r2, r0, 24
	ldr r0, _080C48C0 @ =gPaletteFade
	ldrb r1, [r0, 0x7]
	movs r0, 0x80
	ands r0, r1
	cmp r0, 0
	bne _080C48BA
	adds r0, r2, 0
	bl DestroyTask
	ldr r0, _080C48C4 @ =sub_80C488C
	bl SetMainCallback2
_080C48BA:
	pop {r0}
	bx r0
	.align 2, 0
_080C48C0: .4byte gPaletteFade
_080C48C4: .4byte sub_80C488C
	thumb_func_end sub_80C489C

	thumb_func_start sub_80C48C8
sub_80C48C8: @ 80C48C8
	push {lr}
	sub sp, 0x4
	bl ScriptContext2_Enable
	ldr r0, _080C48F0 @ =sub_80C489C
	movs r1, 0xA
	bl CreateTask
	movs r0, 0x1
	negs r0, r0
	movs r1, 0
	str r1, [sp]
	movs r2, 0
	movs r3, 0x10
	bl BeginNormalPaletteFade
	add sp, 0x4
	pop {r0}
	bx r0
	.align 2, 0
_080C48F0: .4byte sub_80C489C
	thumb_func_end sub_80C48C8

	thumb_func_start sub_80C48F4
sub_80C48F4: @ 80C48F4
	ldr r2, _080C4908 @ =gSpecialVar_0x8004
	ldr r1, _080C490C @ =gContestMons
	ldr r0, _080C4910 @ =gSpecialVar_0x8006
	ldrh r0, [r0]
	lsls r0, 6
	adds r0, r1
	ldrh r0, [r0]
	strh r0, [r2]
	bx lr
	.align 2, 0
_080C4908: .4byte gSpecialVar_0x8004
_080C490C: .4byte gContestMons
_080C4910: .4byte gSpecialVar_0x8006
	thumb_func_end sub_80C48F4

	thumb_func_start sub_80C4914
sub_80C4914: @ 80C4914
	push {lr}
	lsls r0, 24
	lsrs r2, r0, 24
	ldr r0, _080C4938 @ =gPaletteFade
	ldrb r1, [r0, 0x7]
	movs r0, 0x80
	ands r0, r1
	cmp r0, 0
	bne _080C4932
	adds r0, r2, 0
	bl DestroyTask
	ldr r0, _080C493C @ =sub_80C2358
	bl SetMainCallback2
_080C4932:
	pop {r0}
	bx r0
	.align 2, 0
_080C4938: .4byte gPaletteFade
_080C493C: .4byte sub_80C2358
	thumb_func_end sub_80C4914

	thumb_func_start sub_80C4940
sub_80C4940: @ 80C4940
	push {lr}
	sub sp, 0x4
	bl ScriptContext2_Enable
	ldr r0, _080C4968 @ =sub_80C4914
	movs r1, 0xA
	bl CreateTask
	movs r0, 0x1
	negs r0, r0
	movs r1, 0
	str r1, [sp]
	movs r2, 0
	movs r3, 0x10
	bl BeginNormalPaletteFade
	add sp, 0x4
	pop {r0}
	bx r0
	.align 2, 0
_080C4968: .4byte sub_80C4914
	thumb_func_end sub_80C4940

	thumb_func_start sub_80C496C
sub_80C496C: @ 80C496C
	ldr r0, _080C4978 @ =gSpecialVar_0x8004
	ldr r1, _080C497C @ =gContestPlayerMonIndex
	ldrb r1, [r1]
	strh r1, [r0]
	bx lr
	.align 2, 0
_080C4978: .4byte gSpecialVar_0x8004
_080C497C: .4byte gContestPlayerMonIndex
	thumb_func_end sub_80C496C

	thumb_func_start sub_80C4980
sub_80C4980: @ 80C4980
	push {r4-r6,lr}
	adds r5, r0, 0
	lsls r5, 24
	lsrs r5, 24
	bl ScriptContext2_Enable
	ldr r6, _080C49B8 @ =sub_80C8604
	adds r0, r6, 0
	movs r1, 0
	bl CreateTask
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	ldr r2, _080C49BC @ =sub_80C49C4
	adds r0, r4, 0
	adds r1, r6, 0
	bl SetTaskFuncWithFollowupFunc
	ldr r1, _080C49C0 @ =gTasks
	lsls r0, r4, 2
	adds r0, r4
	lsls r0, 3
	adds r0, r1
	strh r5, [r0, 0x1A]
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_080C49B8: .4byte sub_80C8604
_080C49BC: .4byte sub_80C49C4
_080C49C0: .4byte gTasks
	thumb_func_end sub_80C4980

	thumb_func_start sub_80C49C4
sub_80C49C4: @ 80C49C4
	push {r4,lr}
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	ldr r0, _080C49E4 @ =gUnknown_02038694
	ldrb r0, [r0]
	bl sub_80AE098
	ldr r1, _080C49E8 @ =sub_80C8734
	ldr r2, _080C49EC @ =sub_80C49F0
	adds r0, r4, 0
	bl SetTaskFuncWithFollowupFunc
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080C49E4: .4byte gUnknown_02038694
_080C49E8: .4byte sub_80C8734
_080C49EC: .4byte sub_80C49F0
	thumb_func_end sub_80C49C4

	thumb_func_start sub_80C49F0
sub_80C49F0: @ 80C49F0
	push {lr}
	lsls r0, 24
	lsrs r0, 24
	ldr r1, _080C4A04 @ =sub_80C88AC
	ldr r2, _080C4A08 @ =sub_80C4A0C
	bl SetTaskFuncWithFollowupFunc
	pop {r0}
	bx r0
	.align 2, 0
_080C4A04: .4byte sub_80C88AC
_080C4A08: .4byte sub_80C4A0C
	thumb_func_end sub_80C49F0

	thumb_func_start sub_80C4A0C
sub_80C4A0C: @ 80C4A0C
	push {lr}
	lsls r0, 24
	lsrs r0, 24
	ldr r1, _080C4A20 @ =sub_80C8E1C
	ldr r2, _080C4A24 @ =sub_80C4A28
	bl SetTaskFuncWithFollowupFunc
	pop {r0}
	bx r0
	.align 2, 0
_080C4A20: .4byte sub_80C8E1C
_080C4A24: .4byte sub_80C4A28
	thumb_func_end sub_80C4A0C

	thumb_func_start sub_80C4A28
sub_80C4A28: @ 80C4A28
	push {lr}
	lsls r0, 24
	lsrs r0, 24
	ldr r1, _080C4A3C @ =sub_80C8938
	ldr r2, _080C4A40 @ =sub_80C4A44
	bl SetTaskFuncWithFollowupFunc
	pop {r0}
	bx r0
	.align 2, 0
_080C4A3C: .4byte sub_80C8938
_080C4A40: .4byte sub_80C4A44
	thumb_func_end sub_80C4A28

	thumb_func_start sub_80C4A44
sub_80C4A44: @ 80C4A44
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	sub sp, 0x8
	lsls r0, 24
	lsrs r5, r0, 24
	movs r3, 0
	ldr r0, _080C4AA0 @ =gSpecialVar_0x8004
	mov r8, r0
	add r1, sp, 0x4
	mov r12, r1
	lsls r1, r5, 2
	adds r0, r1, r5
	lsls r4, r0, 3
	ldr r6, _080C4AA4 @ =gTasks + 0x8
	adds r7, r1, 0
_080C4A64:
	mov r0, sp
	adds r2, r0, r3
	adds r1, r3, 0x1
	lsls r0, r1, 1
	adds r0, r4
	adds r0, r6
	ldrh r0, [r0]
	strb r0, [r2]
	lsls r1, 24
	lsrs r3, r1, 24
	cmp r3, 0x3
	bls _080C4A64
	movs r3, 0
	mov r2, sp
_080C4A80:
	adds r0, r3, 0x1
	lsls r0, 24
	lsrs r3, r0, 24
	cmp r3, 0x3
	bhi _080C4A96
	mov r0, sp
	adds r1, r0, r3
	ldrb r0, [r2]
	ldrb r1, [r1]
	cmp r0, r1
	beq _080C4A80
_080C4A96:
	cmp r3, 0x4
	bne _080C4AA8
	movs r0, 0
	b _080C4AAA
	.align 2, 0
_080C4AA0: .4byte gSpecialVar_0x8004
_080C4AA4: .4byte gTasks + 0x8
_080C4AA8:
	movs r0, 0x1
_080C4AAA:
	mov r1, r8
	strh r0, [r1]
	movs r3, 0
	mov r4, r12
	adds r0, r7, r5
	lsls r2, r0, 3
	ldr r6, _080C4AF8 @ =gTasks + 0x8
_080C4AB8:
	adds r1, r4, r3
	adds r0, r3, 0x5
	lsls r0, 1
	adds r0, r2
	adds r0, r6
	ldrh r0, [r0]
	strb r0, [r1]
	adds r0, r3, 0x1
	lsls r0, 24
	lsrs r3, r0, 24
	cmp r3, 0x3
	bls _080C4AB8
	mov r0, r12
	bl sub_80C4B34
	ldr r1, _080C4AFC @ =gUnknown_0203869B
	strb r0, [r1]
	ldr r0, _080C4B00 @ =gScriptContestCategory
	ldrb r0, [r0]
	bl sub_80AE82C
	ldr r1, _080C4B04 @ =sub_80C8EBC
	ldr r2, _080C4B08 @ =sub_80C4B0C
	adds r0, r5, 0
	bl SetTaskFuncWithFollowupFunc
	add sp, 0x8
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080C4AF8: .4byte gTasks + 0x8
_080C4AFC: .4byte gUnknown_0203869B
_080C4B00: .4byte gScriptContestCategory
_080C4B04: .4byte sub_80C8EBC
_080C4B08: .4byte sub_80C4B0C
	thumb_func_end sub_80C4A44

	thumb_func_start sub_80C4B0C
sub_80C4B0C: @ 80C4B0C
	push {r4,lr}
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	movs r0, 0
	bl sub_80B0F28
	ldr r1, _080C4B2C @ =sub_80C8F34
	ldr r2, _080C4B30 @ =sub_80C4B5C
	adds r0, r4, 0
	bl SetTaskFuncWithFollowupFunc
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080C4B2C: .4byte sub_80C8F34
_080C4B30: .4byte sub_80C4B5C
	thumb_func_end sub_80C4B0C

	thumb_func_start sub_80C4B34
sub_80C4B34: @ 80C4B34
	push {r4,lr}
	adds r3, r0, 0
	movs r4, 0
	movs r2, 0x1
_080C4B3C:
	adds r0, r3, r4
	adds r1, r3, r2
	ldrb r0, [r0]
	ldrb r1, [r1]
	cmp r0, r1
	bcs _080C4B4C
	lsls r0, r2, 24
	lsrs r4, r0, 24
_080C4B4C:
	adds r2, 0x1
	cmp r2, 0x3
	ble _080C4B3C
	adds r0, r4, 0
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end sub_80C4B34

	thumb_func_start sub_80C4B5C
sub_80C4B5C: @ 80C4B5C
	push {r4,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	ldr r0, _080C4B84 @ =gSpecialVar_0x8004
	ldrh r0, [r0]
	cmp r0, 0x1
	bne _080C4B90
	bl sub_8007ECC
	lsls r0, 24
	cmp r0, 0
	beq _080C4B9E
	ldr r0, _080C4B88 @ =gTasks
	lsls r1, r4, 2
	adds r1, r4
	lsls r1, 3
	adds r1, r0
	ldr r0, _080C4B8C @ =sub_80C4BA4
	str r0, [r1]
	b _080C4B9E
	.align 2, 0
_080C4B84: .4byte gSpecialVar_0x8004
_080C4B88: .4byte gTasks
_080C4B8C: .4byte sub_80C4BA4
_080C4B90:
	adds r0, r4, 0
	bl DestroyTask
	bl ScriptContext2_Disable
	bl EnableBothScriptContexts
_080C4B9E:
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end sub_80C4B5C

	thumb_func_start sub_80C4BA4
sub_80C4BA4: @ 80C4BA4
	push {r4,lr}
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	bl sub_800832C
	ldr r1, _080C4BC4 @ =gTasks
	lsls r0, r4, 2
	adds r0, r4
	lsls r0, 3
	adds r0, r1
	ldr r1, _080C4BC8 @ =sub_80C4BCC
	str r1, [r0]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080C4BC4: .4byte gTasks
_080C4BC8: .4byte sub_80C4BCC
	thumb_func_end sub_80C4BA4

	thumb_func_start sub_80C4BCC
sub_80C4BCC: @ 80C4BCC
	push {lr}
	lsls r0, 24
	lsrs r1, r0, 24
	ldr r0, _080C4BEC @ =gReceivedRemoteLinkPlayers
	ldrb r0, [r0]
	cmp r0, 0
	bne _080C4BE8
	adds r0, r1, 0
	bl DestroyTask
	bl ScriptContext2_Disable
	bl EnableBothScriptContexts
_080C4BE8:
	pop {r0}
	bx r0
	.align 2, 0
_080C4BEC: .4byte gReceivedRemoteLinkPlayers
	thumb_func_end sub_80C4BCC

	.align 2, 0 @ Don't pad with nop.
