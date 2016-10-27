	.include "constants/gba_constants.s"
	.include "constants/species_constants.s"
	.include "asm/macros.s"

	.syntax unified

	.text

@	thumb_func_start c2_clear_save_data_screen_2
@c2_clear_save_data_screen_2: @ 8148800
@	push {lr}
@	bl sub_8148970
@	lsls r0, 24
@	cmp r0, 0
@	beq _08148814
@	ldr r0, _08148818
@	movs r1, 0
@	bl CreateTask
@_08148814:
@	pop {r0}
@	bx r0
@	.align 2, 0
@_08148818: .4byte sub_8148830
@	thumb_func_end c2_clear_save_data_screen_2



@	thumb_func_start sub_814881C
@sub_814881C: @ 814881C
@	push {lr}
@	bl LoadOam
@	bl ProcessSpriteCopyRequests
@	bl TransferPlttBuffer
@	pop {r0}
@	bx r0
@	thumb_func_end sub_814881C



@	thumb_func_start sub_8148830
@sub_8148830: @ 8148830
@	push {r4,lr}
@
@	sub sp, 0x8
@
@	adds r4, r0, 0
@	lsls r4, 24
@	lsrs r4, 24
@
@	bl ResetSpriteData
@
@	movs r1, 0x80
@	lsls r1, 19
@	movs r2, 0xCA
@	lsls r2, 5
@	adds r0, r2, 0
@	strh r0, [r1]
@
@	ldr r0, _081488A8
@	bl SetVBlankCallback
@
@	movs r0, 0x2
@	movs r1, 0xE
@	movs r2, 0x1B
@	movs r3, 0x13
@	bl MenuDrawTextWindow
@
@	ldr r0, _081488AC
@	movs r1, 0x3
@	movs r2, 0xF
@	bl MenuPrint
@
@	movs r0, 0x2
@	movs r1, 0x1
@	movs r2, 0x8
@	movs r3, 0x6
@	bl MenuDrawTextWindow
@
@	ldr r3, _081488B0
@	movs r0, 0x3
@	movs r1, 0x2
@	movs r2, 0x2
@	bl PrintMenuItems
@
@	movs r0, 0x1
@	str r0, [sp]
@	movs r0, 0x5
@	str r0, [sp, 0x4]
@	movs r0, 0
@	movs r1, 0x3
@	movs r2, 0x2
@	movs r3, 0x2
@	bl InitMenu
@
@	ldr r1, _081488B4
@	lsls r0, r4, 2
@	adds r0, r4
@	lsls r0, 3
@	adds r0, r1
@	ldr r1, _081488B8
@	str r1, [r0]
@
@	add sp, 0x8
@	pop {r4}
@	pop {r0}
@	bx r0
@	.align 2, 0
@_081488A8: .4byte sub_814881C
@_081488AC: .4byte gSystemText_ClearAllSaveDataPrompt
@_081488B0: .4byte gUnknown_08376D74
@_081488B4: .4byte gTasks
@_081488B8: .4byte sub_81488BC
@	thumb_func_end sub_8148830



@	thumb_func_start sub_81488BC
@sub_81488BC: @ 81488BC
@	push {r4,lr}
@	lsls r0, 24
@	lsrs r4, r0, 24
@
@	bl ProcessMenuInputNoWrap_
@
@	// Convert ProcessMenuInputNoWrap_ to s8
@	lsls r0, 24
@	asrs r1, r0, 24
@
@
@	// Switch statement
@	cmp r1, 0
@	beq _081488E2
@	cmp r1, 0
@	bgt _081488DC
@
@
@	// ProcessMenuInputNoWrap_() returned < 0
@	movs r0, 0x1
@	negs r0, r0
@	// r0 == -1
@	
@	cmp r1, r0
@	beq _0814890C
@
@	// ProcessMenuInputNoWrap_() returned -2
@	b _0814891E
@
@
@	// ProcessMenuInputNoWrap_() returned > 0
@_081488DC:
@	cmp r1, 0x1
@	beq _0814890C
@	b _0814891E
@
@	// ProcessMenuInputNoWrap_() returned 0
@_081488E2:
@	movs r0, 0x5
@	bl PlaySE
@	
@	ldr r0, _08148900
@	@ r0 == &gSystemText_ClearingData
@	bl sub_8071F40
@	
@	ldr r1, _08148904
@	lsls r0, r4, 2
@	adds r0, r4
@	lsls r0, 3
@	adds r0, r1
@	ldr r1, _08148908
@	str r1, [r0]
@	
@	b _0814891E
@	.align 2, 0
@
@_08148900: .4byte gSystemText_ClearingData
@_08148904: .4byte gTasks
@_08148908: .4byte sub_8148930
@
// ProcessMenuInputNoWrap_() returned 1 or -1
@_0814890C:
@	movs r0, 0x5
@	bl PlaySE
@	adds r0, r4, 0
@	bl DestroyTask
@	ldr r0, _0814892C
@	bl SetMainCallback2
@
@_0814891E:
@	bl AnimateSprites
@	bl BuildOamBuffer
@	pop {r4}
@	pop {r0}
@	bx r0
@	.align 2, 0
@_0814892C: .4byte sub_8148B34
@	thumb_func_end sub_81488BC





@	thumb_func_start sub_8148930
@sub_8148930: @ 8148930
@	push {r4,lr}
@	adds r4, r0, 0
@	lsls r4, 24
@	lsrs r4, 24
@	bl calls_flash_erase_block
@	adds r0, r4, 0
@	bl DestroyTask
@	ldr r0, _08148950
@	bl SetMainCallback2
@	pop {r4}
@	pop {r0}
@	bx r0
@	.align 2, 0
@_08148950: .4byte sub_8148B34
@	thumb_func_end sub_8148930



@	thumb_func_start sub_8148954
@sub_8148954: @ 8148954
@	push {lr}
@	bl RunTasks
@	bl UpdatePaletteFade
@	pop {r0}
@	bx r0
@	thumb_func_end sub_8148954


@	thumb_func_start sub_8148964
@sub_8148964: @ 8148964
@	push {lr}
@	bl TransferPlttBuffer
@	pop {r0}
@	bx r0
@	thumb_func_end sub_8148964



@	thumb_func_start sub_8148970
@sub_8148970: @ 8148970
@	push {r4,lr}
@	sub sp, 0xC
@
@	// switch (gMain.state)
@	ldr r0, _08148AA4
@	ldr r1, _08148AA8
@	adds r0, r1
@	ldrb r0, [r0]
@
@	cmp r0, 0
@	beq _08148986
@	cmp r0, 0x1
@	bne _08148986
@	
@	b _08148B04
@
@	// gMain.state != 1
@_08148986:
@	movs r0, 0
@	bl SetVBlankCallback
@	
@	movs r0, 0x80
@	lsls r0, 19
@	
@	movs r4, 0
@	
@	// r0 == 0x0400_0000 == REG_DISPCNT
@	strh r4, [r0]
@	
@	// r0 == 0x0400_0010 == REG_BG0HOFS
@	adds r0, 0x10
@	strh r4, [r0]
@	
@	// r0 == 0x0400_0012 == REG_BG0VOFS
@	adds r0, 0x2
@	strh r4, [r0]
@	
@	// r0 == 0x0400_001c = REG_BG3HOFS
@	adds r0, 0xA
@	strh r4, [r0]
@	
@	// r0 == 0x0400_001e = REG_BG3VOFS
@	adds r0, 0x2
@	strh r4, [r0]
@	
@	// r0 == 0x0400_0040 = REG_WIN0H
@	adds r0, 0x22
@	strh r4, [r0]
@	
@	// r0 == 0x0400_0044 = REG_WIN0V
@	adds r0, 0x4
@	strh r4, [r0]
@	
@	// r0 == 0x0400_0048 = REG_WININ
@	adds r0, 0x4
@	strh r4, [r0]
@	
@	// r0 == 0x0400_004a = REG_WINOUT
@	adds r0, 0x2
@	strh r4, [r0]
@	
@	// r0 == 0x0400_0050 = REG_BLDCNT
@	adds r0, 0x6
@	strh r4, [r0]
@	
@	// r0 == 0x0400_0052 = REG_BLDALPHA
@	adds r0, 0x2
@	strh r4, [r0]
@	
@	// r0 == 0x0400_0054 = REG_BLDY
@	adds r0, 0x2
@	strh r4, [r0]
@	
@	add r0, sp, 0x4
@	strh r4, [r0]
@	
@	// r1 == REG_DMA3SAD
@	ldr r1, _08148AAC
@	str r0, [r1]
@	
@	// r0 == 0x0600_0000 (BG VRAM)
@	movs r0, 0xC0
@	lsls r0, 19
@	// store 0x0600_0000 to REG_DMA3DAD
@	str r0, [r1, 0x4]
@	
@	// r0 == 0x8100_c000
@	ldr r0, _08148AB0
@	// store 0x8100_c000 to REG_DMA3CNT
@	str r0, [r1, 0x8]
@	ldr r0, [r1, 0x8]
@	
@	movs r2, 0
@	str r2, [sp, 0x8]
@
@
@	add r0, sp, 0x8
@	str r0, [r1]
@	
@	// r0 == 0x0700_0000
@	movs r0, 0xE0
@	lsls r0, 19
@	str r0, [r1, 0x4]
@
@	// r0 == 0x8500_0100
@	ldr r0, _08148AB4
@	str r0, [r1, 0x8]
@	ldr r0, [r1, 0x8]
@
@	add r0, sp, 0x4
@	strh r2, [r0]
@
@	str r0, [r1]
@
@	// r0 == 0x0500_0002
@	ldr r0, _08148AB8
@	str r0, [r1, 0x4]
@
@	// r0 == 0x8100_01ff
@	ldr r0, _08148ABC
@	str r0, [r1, 0x8]
@	ldr r0, [r1, 0x8]
@
@	bl ResetPaletteFade
@
@	// r2 == gPlttBufferUnfaded
@	ldr r2, _08148AC0
@
@	// r0 == 0x0000_7fff
@	ldr r0, _08148AC4
@	strh r0, [r2]
@
@	// r1 == gPlttBufferFaded
@	ldr r1, _08148AC8
@	strh r0, [r1]
@
@	// r0 == 0x0000_3945
@	ldr r0, _08148ACC
@	strh r0, [r2, 0x2]
@	strh r0, [r1, 0x2]
@
@	// Unsure if correct
@	movs r1, 0
@	
@	// r3 == 0x0600_0020
@	ldr r3, _08148AD0
@	
@	// r0 == 0x0000_1111
@	ldr r0, _08148AD4
@	
@	// r2 == 0x0000_1111
@	adds r2, r0, 0
@	
@_08148A14:
@	// First loop iteration:  r0 == 0
@	// Later loop iterations:  r0 == r1 << 1 == r1 * 2
@	lsls r0, r1, 1
@	
@	// r0 += 0x0600_0020 
@	adds r0, r3
@	
@	strh r2, [r0]
@	
@	adds r0, r1, 0x1
@	lsls r0, 16
@	lsrs r1, r0, 16
@	
@	// if ( r1 <= 0xf ) goto _08148A14
@	cmp r1, 0xF
@	bls _08148A14
@
@
@	// Unsure if correct
@	movs r1, 0
@	
@	// r4 == 0x0600_3800
@	ldr r4, _08148AD8
@	
@	movs r3, 0x1
@	
@	// 0x000004ff
@	ldr r2, _08148ADC
@	
@_08148A2C:
@	lsls r0, r1, 1
@	
@	// r0 += 0x0600_3800
@	adds r0, r4
@	
@	strh r3, [r0]
@	
@	adds r0, r1, 0x1
@	lsls r0, 16
@	lsrs r1, r0, 16
@	
@	// if ( r1 <= 0x4ff ) goto _08148A2C
@	cmp r1, r2
@	bls _08148A2C
@
@
@	bl ResetTasks
@	bl ResetSpriteData
@	
@	// r0 == gWindowConfig_81E6C3C
@	ldr r0, _08148AE0
@	bl SetUpWindowConfig
@	
@	// r0 == gWindowConfig_81E6CE4
@	ldr r0, _08148AE4
@	bl InitMenuWindow
@	
@	
@	// r0 == -1
@	movs r0, 0x1
@	negs r0, r0
@	
@	// r1 == 0x0000_ffff
@	ldr r1, _08148AE8
@	str r1, [sp]
@	
@	movs r1, 0
@	movs r2, 0x10
@	movs r3, 0
@	
@	bl BeginNormalPaletteFade
@	
@	
@	// r2 == REG_IME
@	ldr r2, _08148AEC
@	
@	ldrh r1, [r2]
@	movs r0, 0
@	strh r0, [r2]
@	
@	// r3 == REG_IE
@	ldr r3, _08148AF0
@	ldrh r0, [r3]
@	
@	// REG_IE |= 1
@	movs r4, 0x1
@	orrs r0, r4
@	strh r0, [r3]
@	
@	// restore REG_IME to its old value
@	strh r1, [r2]
@	
@	
@	// r2 == REG_DISPSTAT
@	ldr r2, _08148AF4
@	
@	// REG_DISPSTAT |= 0x8
@	ldrh r0, [r2]
@	movs r1, 0x8
@	orrs r0, r1
@	strh r0, [r2]
@	
@	// r0 == TransferPlttBuffer_
@	ldr r0, _08148AF8
@	bl SetVBlankCallback
@	
@	// r1 == REG_BG3CNT
@	ldr r1, _08148AFC
@	
@	// r2 == 0x0000_0703
@	ldr r2, _08148B00
@	
@	// REG_BG3CNT = 0x0703;
@	adds r0, r2, 0
@	strh r0, [r1]
@	
@	// r1 == REG_DISPCNT
@	subs r1, 0xE
@	
@	// r2 == 0x0900;
@	movs r2, 0x90
@	lsls r2, 4
@	
@	// REG_DISPCNT = 0x0900;
@	adds r0, r2, 0
@	strh r0, [r1]
@	
@	// r0 == gMain
@	ldr r0, _08148AA4
@	// r1 == 0x0000_043c
@	ldr r1, _08148AA8
@	adds r0, r1
@	
@	// Note that r4 == 0x1, so store 0x1 to gMain.state
@	strb r4, [r0]
@	b _08148B28
@	.align 2, 0
@_08148AA4: .4byte gMain
@_08148AA8: .4byte 0x0000043c
@_08148AAC: .4byte REG_DMA3SAD
@_08148AB0: .4byte 0x8100c000
@_08148AB4: .4byte 0x85000100
@_08148AB8: .4byte 0x05000002
@_08148ABC: .4byte 0x810001ff
@_08148AC0: .4byte gPlttBufferUnfaded
@_08148AC4: .4byte 0x00007fff
@_08148AC8: .4byte gPlttBufferFaded
@_08148ACC: .4byte 0x00003945
@_08148AD0: .4byte 0x06000020
@_08148AD4: .4byte 0x00001111
@_08148AD8: .4byte 0x06003800
@_08148ADC: .4byte 0x000004ff
@_08148AE0: .4byte gWindowConfig_81E6C3C
@_08148AE4: .4byte gWindowConfig_81E6CE4
@_08148AE8: .4byte 0x0000ffff
@_08148AEC: .4byte REG_IME
@_08148AF0: .4byte REG_IE
@_08148AF4: .4byte REG_DISPSTAT
@_08148AF8: .4byte TransferPlttBuffer_
@_08148AFC: .4byte REG_BG3CNT
@_08148B00: .4byte 0x00000703
@
@	// gMain.state == 1
@_08148B04:
@
@	bl UpdatePaletteFade
@
@	// r0 == gPaletteFade
@	ldr r0, _08148B20
@	
@	// r1 == ((vu8 *)gPaletteFade)[0x7]
@	ldrb r1, [r0, 0x7]
@	
@	movs r0, 0x80
@	
@	// r0 == 0x80 & (((vu8 *)gPaletteFade)[0x7])
@	ands r0, r1
@	
@	// if ( 0x80 & (((vu8 *)gPaletteFade)[0x7]) == 0 ) return 0;
@	cmp r0, 0
@	bne _08148B28
@	
@	// r0 == sub_8148954
@	ldr r0, _08148B24
@	bl SetMainCallback2
@	
@	// return 1
@	movs r0, 0x1
@	b _08148B2A
@	.align 2, 0
@_08148B20: .4byte gPaletteFade
@_08148B24: .4byte sub_8148954
@_08148B28:
@	movs r0, 0
@_08148B2A:
@	add sp, 0xC
@	pop {r4}
@	pop {r1}
@	bx r1
@	thumb_func_end sub_8148970




@	thumb_func_start sub_8148B34
@sub_8148B34: @ 8148B34
@	push {r4,lr}
@	sub sp, 0x4
@	
@	// r0 == gMain
@	ldr r0, _08148B60
@	
@	// r1 == 0x0000043c
@	ldr r1, _08148B64
@	adds r4, r0, r1
@	
@	// Load gMain.state into r0
@	ldrb r0, [r4]
@	cmp r0, 0
@	beq _08148B48
@	cmp r0, 0x1
@	beq _08148B6C
@	
@	// gMain.state == 0
@_08148B48:
@	// r0 == -1
@	movs r0, 0x1
@	negs r0, r0
@	
@	// r1 == 0x0000ffff
@	ldr r1, _08148B68
@	str r1, [sp]
@	movs r1, 0
@	movs r2, 0
@	movs r3, 0x10
@	bl BeginNormalPaletteFade
@	
@	// gMain.state = 1;
@	movs r0, 0x1
@	strb r0, [r4]
@	b _08148B80
@	.align 2, 0
@_08148B60: .4byte gMain
@_08148B64: .4byte 0x0000043c
@_08148B68: .4byte 0x0000ffff
@
@	// gMain.state == 1
@_08148B6C:
@	bl UpdatePaletteFade
@	
@	// r0 == gPaletteFade
@	ldr r0, _08148B88
@	
@	// load gPaletteFade.active into r1
@	ldrb r1, [r0, 0x7]
@	movs r0, 0x80
@	ands r0, r1
@	cmp r0, 0
@	bne _08148B80
@	
@	bl DoSoftReset
@_08148B80:
@	add sp, 0x4
@	pop {r4}
@	pop {r0}
@	bx r0
@	.align 2, 0
@_08148B88: .4byte gPaletteFade
@	thumb_func_end sub_8148B34

	.align 2, 0 @ Don't pad with nop.
