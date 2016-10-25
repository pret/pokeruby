	.include "constants/gba_constants.s"
	.include "constants/species_constants.s"
	.include "asm/macros.s"

	.syntax unified

	.text

	thumb_func_start sub_8106630
sub_8106630: @ 8106630
	push {r4-r7,lr}
	ldr r2, _0810665C @ =0x02015de0
	subs r4, r2, 0x2
	subs r5, r2, 0x1
	ldr r3, _08106660 @ =gSaveBlock1
	subs r0, 0x1
	lsls r1, r0, 5
	adds r1, r3
	ldr r3, _08106664 @ =0x00002dfc
	adds r1, r3
	ldm r1!, {r3,r6,r7}
	stm r2!, {r3,r6,r7}
	ldm r1!, {r3,r6,r7}
	stm r2!, {r3,r6,r7}
	ldm r1!, {r6,r7}
	stm r2!, {r6,r7}
	strb r0, [r4]
	movs r0, 0
	strb r0, [r5]
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_0810665C: .4byte 0x02015de0
_08106660: .4byte gSaveBlock1
_08106664: .4byte 0x00002dfc
	thumb_func_end sub_8106630

	thumb_func_start CB2_ContestPainting
CB2_ContestPainting: @ 8106668
	push {lr}
	bl ShowContestPainting
	pop {r0}
	bx r0
	thumb_func_end CB2_ContestPainting

	thumb_func_start ShowContestPainting
ShowContestPainting: @ 8106674
	push {r4-r7,lr}
	sub sp, 0x4
	ldr r1, _08106694 @ =gMain
	ldr r2, _08106698 @ =0x0000043c
	adds r0, r1, r2
	ldrb r0, [r0]
	adds r4, r1, 0
	cmp r0, 0x4
	bls _08106688
	b _081067E0
_08106688:
	lsls r0, 2
	ldr r1, _0810669C @ =_081066A0
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_08106694: .4byte gMain
_08106698: .4byte 0x0000043c
_0810669C: .4byte _081066A0
	.align 2, 0
_081066A0:
	.4byte _081066B4
	.4byte _081066D8
	.4byte _08106734
	.4byte _0810675C
	.4byte _0810678C
_081066B4:
	bl remove_some_task
	movs r0, 0
	bl SetVBlankCallback
	ldr r1, _081066D0 @ =gUnknown_03005E8C
	ldr r0, _081066D4 @ =0x02015de0
	str r0, [r1]
	movs r0, 0x1
	bl ContestPaintingInitVars
	bl ContestPaintingInitBG
	b _0810676E
	.align 2, 0
_081066D0: .4byte gUnknown_03005E8C
_081066D4: .4byte 0x02015de0
_081066D8:
	bl ResetPaletteFade
	movs r2, 0xC0
	lsls r2, 19
	movs r3, 0xC0
	lsls r3, 9
	movs r5, 0
	ldr r1, _08106724 @ =0x040000d4
	movs r4, 0x80
	lsls r4, 5
	ldr r6, _08106728 @ =0x85000400
	movs r7, 0x85
	lsls r7, 24
_081066F2:
	str r5, [sp]
	mov r0, sp
	str r0, [r1]
	str r2, [r1, 0x4]
	str r6, [r1, 0x8]
	ldr r0, [r1, 0x8]
	adds r2, r4
	subs r3, r4
	cmp r3, r4
	bhi _081066F2
	str r5, [sp]
	mov r0, sp
	str r0, [r1]
	str r2, [r1, 0x4]
	lsrs r0, r3, 2
	orrs r0, r7
	str r0, [r1, 0x8]
	ldr r0, [r1, 0x8]
	bl ResetSpriteData
	ldr r1, _0810672C @ =gMain
	ldr r2, _08106730 @ =0x0000043c
	adds r1, r2
	b _08106774
	.align 2, 0
_08106724: .4byte 0x040000d4
_08106728: .4byte 0x85000400
_0810672C: .4byte gMain
_08106730: .4byte 0x0000043c
_08106734:
	ldrh r0, [r4, 0x20]
	bl SeedRng
	bl InitKeys
	ldr r0, _08106750 @ =0x02000000
	ldr r1, _08106754 @ =0x00015ddf
	adds r0, r1
	ldrb r0, [r0]
	bl ContestPaintingInitWindow
	ldr r2, _08106758 @ =0x0000043c
	adds r1, r4, r2
	b _08106774
	.align 2, 0
_08106750: .4byte 0x02000000
_08106754: .4byte 0x00015ddf
_08106758: .4byte 0x0000043c
_0810675C:
	ldr r1, _0810677C @ =0x02000000
	ldr r2, _08106780 @ =0x00015dde
	adds r0, r1, r2
	ldrb r0, [r0]
	adds r2, 0x1
	adds r1, r2
	ldrb r1, [r1]
	bl sub_8107090
_0810676E:
	ldr r1, _08106784 @ =gMain
	ldr r0, _08106788 @ =0x0000043c
	adds r1, r0
_08106774:
	ldrb r0, [r1]
	adds r0, 0x1
	strb r0, [r1]
	b _081067E0
	.align 2, 0
_0810677C: .4byte 0x02000000
_08106780: .4byte 0x00015dde
_08106784: .4byte gMain
_08106788: .4byte 0x0000043c
_0810678C:
	ldr r1, _081067E8 @ =0x02000000
	ldr r2, _081067EC @ =0x00015dde
	adds r0, r1, r2
	ldrb r0, [r0]
	adds r2, 0x1
	adds r1, r2
	ldrb r1, [r1]
	bl ContestPaintingPrintCaption
	ldr r0, _081067F0 @ =gUnknown_083F6140
	movs r1, 0
	movs r2, 0x2
	bl LoadPalette
	movs r1, 0xA0
	lsls r1, 19
	movs r4, 0
	str r4, [sp]
	ldr r0, _081067F4 @ =0x040000d4
	mov r2, sp
	str r2, [r0]
	str r1, [r0, 0x4]
	ldr r1, _081067F8 @ =0x85000100
	str r1, [r0, 0x8]
	ldr r0, [r0, 0x8]
	movs r0, 0x2
	bl BeginFastPaletteFade
	ldr r0, _081067FC @ =sub_8106AAC
	bl SetVBlankCallback
	ldr r0, _08106800 @ =gUnknown_03000750
	strb r4, [r0]
	movs r1, 0x80
	lsls r1, 19
	movs r2, 0x9A
	lsls r2, 5
	adds r0, r2, 0
	strh r0, [r1]
	ldr r0, _08106804 @ =sub_8106808
	bl SetMainCallback2
_081067E0:
	add sp, 0x4
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_081067E8: .4byte 0x02000000
_081067EC: .4byte 0x00015dde
_081067F0: .4byte gUnknown_083F6140
_081067F4: .4byte 0x040000d4
_081067F8: .4byte 0x85000100
_081067FC: .4byte VBlankCB_ContestPainting
_08106800: .4byte gUnknown_03000750
_08106804: .4byte CB2_HoldContestPainting
	thumb_func_end ShowContestPainting

	thumb_func_start CB2_HoldContestPainting
CB2_HoldContestPainting: @ 8106808
	push {lr}
	bl HoldContestPainting
	bl UpdatePaletteFade
	pop {r0}
	bx r0
	thumb_func_end CB2_HoldContestPainting

	thumb_func_start CB2_QuitContestPainting
CB2_QuitContestPainting: @ 8106818
	push {lr}
	ldr r0, _08106828 @ =gMain
	ldr r0, [r0, 0x8]
	bl SetMainCallback2
	pop {r0}
	bx r0
	.align 2, 0
_08106828: .4byte gMain
	thumb_func_end CB2_QuitContestPainting

	thumb_func_start HoldContestPainting
HoldContestPainting: @ 810682C
	push {lr}
	sub sp, 0x4
	ldr r3, _08106844 @ =gUnknown_03000750
	ldrb r1, [r3]
	cmp r1, 0x1
	beq _08106880
	cmp r1, 0x1
	bgt _08106848
	cmp r1, 0
	beq _0810684E
	b _081068E6
	.align 2, 0
_08106844: .4byte gUnknown_03000750
_08106848:
	cmp r1, 0x2
	beq _081068C0
	b _081068E6
_0810684E:
	ldr r0, _08106874 @ =gPaletteFade
	ldrb r1, [r0, 0x7]
	movs r0, 0x80
	ands r0, r1
	cmp r0, 0
	bne _0810685E
	movs r0, 0x1
	strb r0, [r3]
_0810685E:
	ldr r0, _08106878 @ =gUnknown_03000756
	ldrb r0, [r0]
	cmp r0, 0
	beq _081068E6
	ldr r1, _0810687C @ =gUnknown_03000754
	ldrh r0, [r1]
	cmp r0, 0
	beq _081068E6
	subs r0, 0x1
	b _081068E4
	.align 2, 0
_08106874: .4byte gPaletteFade
_08106878: .4byte gUnknown_03000756
_0810687C: .4byte gUnknown_03000754
_08106880:
	ldr r0, _081068B4 @ =gMain
	ldrh r2, [r0, 0x2E]
	ands r1, r2
	cmp r1, 0
	bne _08106892
	movs r0, 0x2
	ands r0, r2
	cmp r0, 0
	beq _081068A4
_08106892:
	movs r0, 0x2
	strb r0, [r3]
	subs r0, 0x3
	movs r1, 0
	str r1, [sp]
	movs r2, 0
	movs r3, 0x10
	bl BeginNormalPaletteFade
_081068A4:
	ldr r0, _081068B8 @ =gUnknown_03000756
	ldrb r0, [r0]
	cmp r0, 0
	beq _081068E6
	ldr r1, _081068BC @ =gUnknown_03000754
	movs r0, 0
	b _081068E4
	.align 2, 0
_081068B4: .4byte gMain
_081068B8: .4byte gUnknown_03000756
_081068BC: .4byte gUnknown_03000754
_081068C0:
	ldr r0, _081068EC @ =gPaletteFade
	ldrb r1, [r0, 0x7]
	movs r0, 0x80
	ands r0, r1
	cmp r0, 0
	bne _081068D2
	ldr r0, _081068F0 @ =sub_8106818
	bl SetMainCallback2
_081068D2:
	ldr r0, _081068F4 @ =gUnknown_03000756
	ldrb r0, [r0]
	cmp r0, 0
	beq _081068E6
	ldr r1, _081068F8 @ =gUnknown_03000754
	ldrh r0, [r1]
	cmp r0, 0x1D
	bhi _081068E6
	adds r0, 0x1
_081068E4:
	strh r0, [r1]
_081068E6:
	add sp, 0x4
	pop {r0}
	bx r0
	.align 2, 0
_081068EC: .4byte gPaletteFade
_081068F0: .4byte CB2_QuitContestPainting
_081068F4: .4byte gUnknown_03000756
_081068F8: .4byte gUnknown_03000754
	thumb_func_end HoldContestPainting

	thumb_func_start ContestPaintingInitWindow
ContestPaintingInitWindow: @ 81068FC
	push {r4,lr}
	ldr r4, _08106914 @ =gWindowConfig_81E7160
	adds r0, r4, 0
	bl InitMenuWindow
	adds r0, r4, 0
	bl SetUpWindowConfig
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08106914: .4byte gWindowConfig_81E7160
	thumb_func_end ContestPaintingInitWindow

	thumb_func_start ContestPaintingPrintCaption
ContestPaintingPrintCaption: @ 8106918
	push {r4-r6,lr}
	lsls r0, 24
	lsrs r3, r0, 24
	lsls r1, 24
	lsrs r1, 24
	cmp r1, 0x1
	beq _081069BE
	ldr r2, _08106974 @ =gUnknown_03005E40
	ldr r6, _08106978 @ =gUnknown_03005E8C
	ldr r0, [r6]
	ldrb r0, [r0, 0xA]
	cmp r3, 0x7
	bhi _08106988
	ldr r1, _0810697C @ =gUnknown_083F60AC
	lsls r0, 2
	adds r0, r1
	ldr r1, [r0]
	adds r0, r2, 0
	bl StringCopy
	adds r2, r0, 0
	ldr r1, _08106980 @ =gContestText_ContestWinner
	bl StringCopy
	adds r2, r0, 0
	ldr r1, [r6]
	adds r1, 0x16
	bl StringCopy
	adds r2, r0, 0
	movs r0, 0xFC
	strb r0, [r2]
	movs r0, 0x16
	strb r0, [r2, 0x1]
	adds r2, 0x2
	ldr r1, _08106984 @ =gOtherText_Unknown1
	adds r0, r2, 0
	bl StringCopy
	adds r2, r0, 0
	ldr r1, [r6]
	adds r1, 0xB
	bl StringCopy10
	movs r1, 0x6
	b _081069AE
	.align 2, 0
_08106974: .4byte gUnknown_03005E40
_08106978: .4byte gUnknown_03005E8C
_0810697C: .4byte gUnknown_083F60AC
_08106980: .4byte gContestText_ContestWinner
_08106984: .4byte gOtherText_Unknown1
_08106988:
	ldr r4, _081069C4 @ =gUnknown_083F60C0
	lsls r5, r0, 3
	adds r0, r5, r4
	ldr r1, [r0]
	adds r0, r2, 0
	bl StringCopy
	adds r2, r0, 0
	ldr r1, [r6]
	adds r1, 0xB
	bl StringCopy10
	adds r2, r0, 0
	adds r4, 0x4
	adds r5, r4
	ldr r1, [r5]
	bl StringCopy
	movs r1, 0x3
_081069AE:
	movs r2, 0xE
	ldr r0, _081069C8 @ =gUnknown_03005E40
	lsls r1, 3
	adds r1, 0x1
	lsls r2, 3
	movs r3, 0x1
	bl MenuPrint_PixelCoords
_081069BE:
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_081069C4: .4byte gUnknown_083F60C0
_081069C8: .4byte gUnknown_03005E40
	thumb_func_end ContestPaintingPrintCaption

	thumb_func_start ContestPaintingInitBG
ContestPaintingInitBG: @ 81069CC
	movs r0, 0x80
	lsls r0, 19
	movs r3, 0
	strh r3, [r0]
	ldr r2, _081069FC @ =0x04000200
	ldrh r0, [r2]
	movs r1, 0x1
	orrs r0, r1
	strh r0, [r2]
	ldr r1, _08106A00 @ =REG_BG0CNT
	ldr r2, _08106A04 @ =0x00000c42
	adds r0, r2, 0
	strh r0, [r1]
	adds r1, 0x2
	ldr r2, _08106A08 @ =0x00000a45
	adds r0, r2, 0
	strh r0, [r1]
	ldr r0, _08106A0C @ =REG_BLDCNT
	strh r3, [r0]
	adds r0, 0x2
	strh r3, [r0]
	adds r0, 0x2
	strh r3, [r0]
	bx lr
	.align 2, 0
_081069FC: .4byte 0x04000200
_08106A00: .4byte REG_BG0CNT
_08106A04: .4byte 0x00000c42
_08106A08: .4byte 0x00000a45
_08106A0C: .4byte REG_BLDCNT
	thumb_func_end ContestPaintingInitBG

	thumb_func_start ContestPaintingInitVars
ContestPaintingInitVars: @ 8106A10
	push {lr}
	lsls r0, 24
	lsrs r1, r0, 24
	cmp r1, 0
	bne _08106A34
	ldr r0, _08106A28 @ =gUnknown_03000756
	strb r1, [r0]
	ldr r0, _08106A2C @ =gUnknown_03000752
	strh r1, [r0]
	ldr r0, _08106A30 @ =gUnknown_03000754
	strh r1, [r0]
	b _08106A46
	.align 2, 0
_08106A28: .4byte gUnknown_03000756
_08106A2C: .4byte gUnknown_03000752
_08106A30: .4byte gUnknown_03000754
_08106A34:
	ldr r1, _08106A4C @ =gUnknown_03000756
	movs r0, 0x1
	strb r0, [r1]
	ldr r1, _08106A50 @ =gUnknown_03000752
	movs r0, 0xF
	strh r0, [r1]
	ldr r1, _08106A54 @ =gUnknown_03000754
	movs r0, 0x1E
	strh r0, [r1]
_08106A46:
	pop {r0}
	bx r0
	.align 2, 0
_08106A4C: .4byte gUnknown_03000756
_08106A50: .4byte gUnknown_03000752
_08106A54: .4byte gUnknown_03000754
	thumb_func_end ContestPaintingInitVars

	thumb_func_start ContestPaintingMosaic
ContestPaintingMosaic: @ 8106A58
	push {lr}
	ldr r0, _08106A68 @ =gUnknown_03000756
	ldrb r1, [r0]
	cmp r1, 0
	bne _08106A70
	ldr r0, _08106A6C @ =REG_MOSAIC
	strh r1, [r0]
	b _08106A92
	.align 2, 0
_08106A68: .4byte gUnknown_03000756
_08106A6C: .4byte REG_MOSAIC
_08106A70:
	ldr r1, _08106A98 @ =REG_BG1CNT
	ldr r2, _08106A9C @ =0x00000a45
	adds r0, r2, 0
	strh r0, [r1]
	ldr r2, _08106AA0 @ =gUnknown_03000752
	ldr r0, _08106AA4 @ =gUnknown_03000754
	ldrh r1, [r0]
	lsrs r1, 1
	strh r1, [r2]
	ldr r3, _08106AA8 @ =REG_MOSAIC
	lsls r0, r1, 12
	lsls r2, r1, 8
	orrs r0, r2
	lsls r2, r1, 4
	orrs r0, r2
	orrs r0, r1
	strh r0, [r3]
_08106A92:
	pop {r0}
	bx r0
	.align 2, 0
_08106A98: .4byte REG_BG1CNT
_08106A9C: .4byte 0x00000a45
_08106AA0: .4byte gUnknown_03000752
_08106AA4: .4byte gUnknown_03000754
_08106AA8: .4byte REG_MOSAIC
	thumb_func_end ContestPaintingMosaic

	thumb_func_start VBlankCB_ContestPainting
VBlankCB_ContestPainting: @ 8106AAC
	push {lr}
	bl ContestPaintingMosaic
	bl LoadOam
	bl ProcessSpriteCopyRequests
	bl TransferPlttBuffer
	pop {r0}
	bx r0
	thumb_func_end VBlankCB_ContestPainting

	thumb_func_start sub_8106AC4
sub_8106AC4: @ 8106AC4
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	sub sp, 0xC
	adds r4, r1, 0
	lsls r0, 16
	lsrs r6, r0, 16
	lsls r4, 24
	lsrs r4, 24
	ldr r7, _08106B28 @ =gUnknown_03005E8C
	ldr r0, [r7]
	ldr r1, [r0, 0x4]
	ldr r2, [r0]
	adds r0, r6, 0
	bl species_and_otid_get_pal
	ldr r1, _08106B2C @ =gUnknown_03005E90
	mov r8, r1
	ldr r1, [r1]
	bl LZDecompressVram
	cmp r4, 0
	bne _08106B40
	lsls r0, r6, 3
	ldr r1, _08106B30 @ =gMonFrontPicTable
	adds r0, r1
	ldr r1, _08106B34 @ =gMonFrontPicCoords
	lsls r2, r6, 2
	adds r2, r1
	ldrb r1, [r2]
	ldrb r2, [r2, 0x1]
	movs r3, 0x80
	lsls r3, 18
	ldr r4, _08106B38 @ =gUnknown_081FAF4C
	ldr r5, [r4, 0x4]
	str r5, [sp]
	str r6, [sp, 0x4]
	ldr r4, [r7]
	ldr r4, [r4]
	str r4, [sp, 0x8]
	bl sub_800D334
	mov r2, r8
	ldr r1, [r2]
	ldr r0, _08106B3C @ =gUnknown_03005E10
	ldr r2, [r0]
	adds r0, r5, 0
	bl sub_8106B90
	b _08106B74
	.align 2, 0
_08106B28: .4byte gUnknown_03005E8C
_08106B2C: .4byte gUnknown_03005E90
_08106B30: .4byte gMonFrontPicTable
_08106B34: .4byte gMonFrontPicCoords
_08106B38: .4byte gUnknown_081FAF4C
_08106B3C: .4byte gUnknown_03005E10
_08106B40:
	lsls r0, r6, 3
	ldr r1, _08106B80 @ =gMonBackPicTable
	adds r0, r1
	ldr r1, _08106B84 @ =gMonBackPicCoords
	lsls r2, r6, 2
	adds r2, r1
	ldrb r1, [r2]
	ldrb r2, [r2, 0x1]
	movs r3, 0x80
	lsls r3, 18
	ldr r4, _08106B88 @ =gUnknown_081FAF4C
	ldr r5, [r4]
	str r5, [sp]
	str r6, [sp, 0x4]
	ldr r4, [r7]
	ldr r4, [r4]
	str r4, [sp, 0x8]
	bl sub_800D334
	mov r0, r8
	ldr r1, [r0]
	ldr r0, _08106B8C @ =gUnknown_03005E10
	ldr r2, [r0]
	adds r0, r5, 0
	bl sub_8106B90
_08106B74:
	add sp, 0xC
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_08106B80: .4byte gMonBackPicTable
_08106B84: .4byte gMonBackPicCoords
_08106B88: .4byte gUnknown_081FAF4C
_08106B8C: .4byte gUnknown_03005E10
	thumb_func_end sub_8106AC4

	thumb_func_start sub_8106B90
sub_8106B90: @ 8106B90
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	sub sp, 0xC
	mov r10, r0
	mov r9, r1
	str r2, [sp]
	movs r0, 0
_08106BA4:
	movs r3, 0
	adds r1, r0, 0x1
	str r1, [sp, 0x4]
	lsls r0, 3
	str r0, [sp, 0x8]
_08106BAE:
	movs r1, 0
	adds r2, r3, 0x1
	mov r8, r2
	ldr r7, [sp, 0x8]
	adds r0, r7, r3
	lsls r0, 5
	mov r12, r0
	lsls r4, r3, 3
_08106BBE:
	movs r3, 0
	lsls r0, r1, 2
	adds r6, r1, 0x1
	mov r2, r12
	adds r5, r2, r0
	ldr r7, [sp, 0x8]
	adds r0, r7, r1
	lsls r0, 7
	ldr r1, [sp]
	adds r2, r0, r1
_08106BD2:
	lsrs r0, r3, 1
	adds r0, r5, r0
	add r0, r10
	ldrb r1, [r0]
	movs r0, 0x1
	ands r0, r3
	cmp r0, 0
	beq _08106BE6
	lsrs r1, 4
	b _08106BEA
_08106BE6:
	movs r0, 0xF
	ands r1, r0
_08106BEA:
	cmp r1, 0
	bne _08106BFC
	adds r0, r4, r3
	lsls r0, 1
	adds r0, r2
	movs r7, 0x80
	lsls r7, 8
	adds r1, r7, 0
	b _08106C08
_08106BFC:
	adds r0, r4, r3
	lsls r0, 1
	adds r0, r2
	lsls r1, 1
	add r1, r9
	ldrh r1, [r1]
_08106C08:
	strh r1, [r0]
	adds r0, r3, 0x1
	lsls r0, 16
	lsrs r3, r0, 16
	cmp r3, 0x7
	bls _08106BD2
	lsls r0, r6, 16
	lsrs r1, r0, 16
	cmp r1, 0x7
	bls _08106BBE
	mov r1, r8
	lsls r0, r1, 16
	lsrs r3, r0, 16
	cmp r3, 0x7
	bls _08106BAE
	ldr r2, [sp, 0x4]
	lsls r0, r2, 16
	lsrs r0, 16
	cmp r0, 0x7
	bls _08106BA4
	add sp, 0xC
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	thumb_func_end sub_8106B90

	thumb_func_start sub_8106C40
sub_8106C40: @ 8106C40
	push {r4-r7,lr}
	adds r4, r1, 0
	lsls r0, 24
	lsrs r5, r0, 24
	lsls r4, 24
	lsrs r4, 24
	ldr r0, _08106C7C @ =gPictureFramePalettes
	movs r2, 0x80
	lsls r2, 1
	movs r1, 0
	bl LoadPalette
	cmp r4, 0x1
	beq _08106C5E
	b _08106DB4
_08106C5E:
	ldr r0, _08106C80 @ =gUnknown_03005E8C
	ldr r0, [r0]
	ldrb r0, [r0, 0xA]
	movs r1, 0x3
	bl __udivsi3
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x4
	bhi _08106D1C
	lsls r0, 2
	ldr r1, _08106C84 @ =_08106C88
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_08106C7C: .4byte gPictureFramePalettes
_08106C80: .4byte gUnknown_03005E8C
_08106C84: .4byte _08106C88
	.align 2, 0
_08106C88:
	.4byte _08106C9C
	.4byte _08106CB4
	.4byte _08106CCC
	.4byte _08106CE4
	.4byte _08106D08
_08106C9C:
	ldr r0, _08106CAC @ =gPictureFrameTiles_0
	movs r1, 0xC0
	lsls r1, 19
	bl RLUnCompVram
	ldr r0, _08106CB0 @ =gPictureFrameTilemap_0
	b _08106CF0
	.align 2, 0
_08106CAC: .4byte gPictureFrameTiles_0
_08106CB0: .4byte gPictureFrameTilemap_0
_08106CB4:
	ldr r0, _08106CC4 @ =gPictureFrameTiles_1
	movs r1, 0xC0
	lsls r1, 19
	bl RLUnCompVram
	ldr r0, _08106CC8 @ =gPictureFrameTilemap_1
	b _08106CF0
	.align 2, 0
_08106CC4: .4byte gPictureFrameTiles_1
_08106CC8: .4byte gPictureFrameTilemap_1
_08106CCC:
	ldr r0, _08106CDC @ =gPictureFrameTiles_2
	movs r1, 0xC0
	lsls r1, 19
	bl RLUnCompVram
	ldr r0, _08106CE0 @ =gPictureFrameTilemap_2
	b _08106CF0
	.align 2, 0
_08106CDC: .4byte gPictureFrameTiles_2
_08106CE0: .4byte gPictureFrameTilemap_2
_08106CE4:
	ldr r0, _08106CFC @ =gPictureFrameTiles_3
	movs r1, 0xC0
	lsls r1, 19
	bl RLUnCompVram
	ldr r0, _08106D00 @ =gPictureFrameTilemap_3
_08106CF0:
	ldr r1, _08106D04 @ =gUnknown_03005E10
	ldr r1, [r1]
	bl RLUnCompWram
	b _08106D1C
	.align 2, 0
_08106CFC: .4byte gPictureFrameTiles_3
_08106D00: .4byte gPictureFrameTilemap_3
_08106D04: .4byte gUnknown_03005E10
_08106D08:
	ldr r0, _08106D98 @ =gPictureFrameTiles_4
	movs r1, 0xC0
	lsls r1, 19
	bl RLUnCompVram
	ldr r0, _08106D9C @ =gPictureFrameTilemap_4
	ldr r1, _08106DA0 @ =gUnknown_03005E10
	ldr r1, [r1]
	bl RLUnCompWram
_08106D1C:
	movs r1, 0
	ldr r5, _08106DA4 @ =0x06006000
	ldr r0, _08106DA8 @ =0x00001015
	adds r4, r0, 0
_08106D24:
	movs r3, 0
	lsls r2, r1, 5
_08106D28:
	adds r0, r2, r3
	lsls r0, 1
	adds r0, r5
	strh r4, [r0]
	adds r0, r3, 0x1
	lsls r0, 24
	lsrs r3, r0, 24
	cmp r3, 0x1F
	bls _08106D28
	adds r0, r1, 0x1
	lsls r0, 24
	lsrs r1, r0, 24
	cmp r1, 0x13
	bls _08106D24
	movs r1, 0
	ldr r0, _08106DAC @ =0x0600608c
	mov r12, r0
	ldr r7, _08106DA0 @ =gUnknown_03005E10
_08106D4C:
	movs r3, 0
	adds r6, r1, 0x1
	lsls r5, r1, 5
	lsls r4, r1, 6
_08106D54:
	adds r2, r5, r3
	lsls r2, 1
	add r2, r12
	ldr r0, [r7]
	adds r0, r4, r0
	lsls r1, r3, 1
	adds r0, r1
	adds r0, 0x8C
	ldrh r0, [r0]
	strh r0, [r2]
	adds r0, r3, 0x1
	lsls r0, 24
	lsrs r3, r0, 24
	cmp r3, 0x11
	bls _08106D54
	lsls r0, r6, 24
	lsrs r1, r0, 24
	cmp r1, 0x9
	bls _08106D4C
	movs r3, 0
	ldr r4, _08106DB0 @ =0x0600608e
	ldr r2, _08106DA0 @ =gUnknown_03005E10
_08106D80:
	lsls r1, r3, 1
	adds r1, r4
	ldr r0, [r2]
	adds r0, 0x8E
	ldrh r0, [r0]
	strh r0, [r1]
	adds r0, r3, 0x1
	lsls r0, 24
	lsrs r3, r0, 24
	cmp r3, 0xF
	bls _08106D80
	b _08106E86
	.align 2, 0
_08106D98: .4byte gPictureFrameTiles_4
_08106D9C: .4byte gPictureFrameTilemap_4
_08106DA0: .4byte gUnknown_03005E10
_08106DA4: .4byte 0x06006000
_08106DA8: .4byte 0x00001015
_08106DAC: .4byte 0x0600608c
_08106DB0: .4byte 0x0600608e
_08106DB4:
	cmp r5, 0x7
	bhi _08106DD0
	ldr r0, _08106DC8 @ =gPictureFrameTiles_5
	movs r1, 0xC0
	lsls r1, 19
	bl RLUnCompVram
	ldr r0, _08106DCC @ =gPictureFrameTilemap_5
	b _08106E60
	.align 2, 0
_08106DC8: .4byte gPictureFrameTiles_5
_08106DCC: .4byte gPictureFrameTilemap_5
_08106DD0:
	ldr r0, _08106DF0 @ =gUnknown_03005E8C
	ldr r0, [r0]
	ldrb r0, [r0, 0xA]
	movs r1, 0x3
	bl __udivsi3
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x4
	bhi _08106E86
	lsls r0, 2
	ldr r1, _08106DF4 @ =_08106DF8
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_08106DF0: .4byte gUnknown_03005E8C
_08106DF4: .4byte _08106DF8
	.align 2, 0
_08106DF8:
	.4byte _08106E0C
	.4byte _08106E24
	.4byte _08106E3C
	.4byte _08106E54
	.4byte _08106E74
_08106E0C:
	ldr r0, _08106E1C @ =gPictureFrameTiles_0
	movs r1, 0xC0
	lsls r1, 19
	bl RLUnCompVram
	ldr r0, _08106E20 @ =gPictureFrameTilemap_0
	b _08106E60
	.align 2, 0
_08106E1C: .4byte gPictureFrameTiles_0
_08106E20: .4byte gPictureFrameTilemap_0
_08106E24:
	ldr r0, _08106E34 @ =gPictureFrameTiles_1
	movs r1, 0xC0
	lsls r1, 19
	bl RLUnCompVram
	ldr r0, _08106E38 @ =gPictureFrameTilemap_1
	b _08106E60
	.align 2, 0
_08106E34: .4byte gPictureFrameTiles_1
_08106E38: .4byte gPictureFrameTilemap_1
_08106E3C:
	ldr r0, _08106E4C @ =gPictureFrameTiles_2
	movs r1, 0xC0
	lsls r1, 19
	bl RLUnCompVram
	ldr r0, _08106E50 @ =gPictureFrameTilemap_2
	b _08106E60
	.align 2, 0
_08106E4C: .4byte gPictureFrameTiles_2
_08106E50: .4byte gPictureFrameTilemap_2
_08106E54:
	ldr r0, _08106E68 @ =gPictureFrameTiles_3
	movs r1, 0xC0
	lsls r1, 19
	bl RLUnCompVram
	ldr r0, _08106E6C @ =gPictureFrameTilemap_3
_08106E60:
	ldr r1, _08106E70 @ =0x06006000
	bl RLUnCompVram
	b _08106E86
	.align 2, 0
_08106E68: .4byte gPictureFrameTiles_3
_08106E6C: .4byte gPictureFrameTilemap_3
_08106E70: .4byte 0x06006000
_08106E74:
	ldr r0, _08106E8C @ =gPictureFrameTiles_4
	movs r1, 0xC0
	lsls r1, 19
	bl RLUnCompVram
	ldr r0, _08106E90 @ =gPictureFrameTilemap_4
	ldr r1, _08106E94 @ =0x06006000
	bl RLUnCompVram
_08106E86:
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_08106E8C: .4byte gPictureFrameTiles_4
_08106E90: .4byte gPictureFrameTilemap_4
_08106E94: .4byte 0x06006000
	thumb_func_end sub_8106C40

	thumb_func_start sub_8106E98
sub_8106E98: @ 8106E98
	push {r4,lr}
	lsls r0, 24
	lsrs r0, 24
	ldr r4, _08106ED0 @ =gMain
	ldr r1, _08106ED4 @ =gOamData_83F6138
	ldr r2, [r1, 0x4]
	ldr r1, [r1]
	str r1, [r4, 0x3C]
	str r2, [r4, 0x40]
	adds r3, r4, 0
	adds r3, 0x40
	ldrh r2, [r3]
	ldr r1, _08106ED8 @ =0xfffffc00
	ands r1, r2
	strh r1, [r3]
	ldrh r1, [r4, 0x3E]
	ldr r0, _08106EDC @ =0xfffffe00
	ands r0, r1
	movs r1, 0x58
	orrs r0, r1
	strh r0, [r4, 0x3E]
	adds r1, r4, 0
	adds r1, 0x3C
	movs r0, 0x18
	strb r0, [r1]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08106ED0: .4byte gMain
_08106ED4: .4byte gOamData_83F6138
_08106ED8: .4byte 0xfffffc00
_08106EDC: .4byte 0xfffffe00
	thumb_func_end sub_8106E98

	thumb_func_start sub_8106EE0
sub_8106EE0: @ 8106EE0
	push {lr}
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x7
	bhi _08106EF8
	ldr r0, _08106EF4 @ =gUnknown_03005E8C
	ldr r0, [r0]
	ldrb r0, [r0, 0xA]
	b _08106F08
	.align 2, 0
_08106EF4: .4byte gUnknown_03005E8C
_08106EF8:
	ldr r0, _08106F18 @ =gUnknown_03005E8C
	ldr r0, [r0]
	ldrb r0, [r0, 0xA]
	movs r1, 0x3
	bl __udivsi3
	lsls r0, 24
	lsrs r0, 24
_08106F08:
	cmp r0, 0x4
	bhi _08106F46
	lsls r0, 2
	ldr r1, _08106F1C @ =_08106F20
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_08106F18: .4byte gUnknown_03005E8C
_08106F1C: .4byte _08106F20
	.align 2, 0
_08106F20:
	.4byte _08106F34
	.4byte _08106F38
	.4byte _08106F3C
	.4byte _08106F40
	.4byte _08106F44
_08106F34:
	movs r0, 0x9
	b _08106F46
_08106F38:
	movs r0, 0xD
	b _08106F46
_08106F3C:
	movs r0, 0x2
	b _08106F46
_08106F40:
	movs r0, 0x24
	b _08106F46
_08106F44:
	movs r0, 0x6
_08106F46:
	pop {r1}
	bx r1
	thumb_func_end sub_8106EE0

	thumb_func_start sub_8106F4C
sub_8106F4C: @ 8106F4C
	ldr r0, _08106F5C @ =gUnknown_03005E90
	ldr r1, _08106F60 @ =0x02017e00
	str r1, [r0]
	ldr r0, _08106F64 @ =gUnknown_03005E10
	ldr r2, _08106F68 @ =0xffffe000
	adds r1, r2
	str r1, [r0]
	bx lr
	.align 2, 0
_08106F5C: .4byte gUnknown_03005E90
_08106F60: .4byte 0x02017e00
_08106F64: .4byte gUnknown_03005E10
_08106F68: .4byte 0xffffe000
	thumb_func_end sub_8106F4C

	thumb_func_start sub_8106F6C
sub_8106F6C: @ 8106F6C
	push {r4,lr}
	lsls r0, 24
	lsrs r3, r0, 24
	ldr r1, _08106FAC @ =gUnknown_03005E20
	ldr r0, _08106FB0 @ =gUnknown_03005E10
	ldr r0, [r0]
	str r0, [r1, 0x4]
	ldr r0, _08106FB4 @ =gUnknown_03005E90
	ldr r0, [r0]
	str r0, [r1, 0x8]
	movs r2, 0
	strb r2, [r1, 0x18]
	ldr r0, _08106FB8 @ =gUnknown_03005E8C
	ldr r0, [r0]
	ldrb r0, [r0]
	strb r0, [r1, 0x1F]
	strb r2, [r1, 0x19]
	strb r2, [r1, 0x1A]
	movs r0, 0x40
	strb r0, [r1, 0x1B]
	strb r0, [r1, 0x1C]
	strb r0, [r1, 0x1D]
	strb r0, [r1, 0x1E]
	subs r0, r3, 0x2
	adds r4, r1, 0
	cmp r0, 0x22
	bhi _08107050
	lsls r0, 2
	ldr r1, _08106FBC @ =_08106FC0
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_08106FAC: .4byte gUnknown_03005E20
_08106FB0: .4byte gUnknown_03005E10
_08106FB4: .4byte gUnknown_03005E90
_08106FB8: .4byte gUnknown_03005E8C
_08106FBC: .4byte _08106FC0
	.align 2, 0
_08106FC0:
	.4byte _08107050
	.4byte _08107050
	.4byte _08107050
	.4byte _08107050
	.4byte _0810704C
	.4byte _08107050
	.4byte _08107050
	.4byte _08107050
	.4byte _08107050
	.4byte _08107050
	.4byte _08107050
	.4byte _08107050
	.4byte _08107050
	.4byte _08107050
	.4byte _08107050
	.4byte _08107050
	.4byte _08107050
	.4byte _08107050
	.4byte _08107050
	.4byte _08107050
	.4byte _08107050
	.4byte _08107050
	.4byte _08107050
	.4byte _08107050
	.4byte _08107050
	.4byte _08107050
	.4byte _08107050
	.4byte _08107050
	.4byte _08107050
	.4byte _08107050
	.4byte _08107050
	.4byte _08107050
	.4byte _08107050
	.4byte _08107050
	.4byte _0810704C
_0810704C:
	movs r0, 0x3
	b _08107052
_08107050:
	movs r0, 0x1
_08107052:
	strh r0, [r4, 0x14]
	movs r0, 0x2
	strh r0, [r4, 0x16]
	strb r3, [r4]
	ldr r0, _08107088 @ =0x06010000
	str r0, [r4, 0x10]
	adds r0, r4, 0
	bl sub_80FC7A0
	adds r0, r4, 0
	bl sub_80FDA18
	adds r0, r4, 0
	bl sub_80FD8CC
	ldr r0, _0810708C @ =gUnknown_03005E90
	ldr r0, [r0]
	movs r1, 0x80
	lsls r1, 1
	movs r2, 0x80
	lsls r2, 2
	bl LoadPalette
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08107088: .4byte 0x06010000
_0810708C: .4byte gUnknown_03005E90
	thumb_func_end sub_8106F6C

	thumb_func_start sub_8107090
sub_8107090: @ 8107090
	push {r4,r5,lr}
	adds r4, r0, 0
	adds r5, r1, 0
	lsls r4, 24
	lsrs r4, 24
	lsls r5, 24
	lsrs r5, 24
	bl sub_8106F4C
	ldr r0, _081070D0 @ =gUnknown_03005E8C
	ldr r0, [r0]
	ldrh r0, [r0, 0x8]
	movs r1, 0
	bl sub_8106AC4
	adds r0, r4, 0
	bl sub_8106EE0
	lsls r0, 24
	lsrs r0, 24
	bl sub_8106F6C
	adds r0, r4, 0
	bl sub_8106E98
	adds r0, r4, 0
	adds r1, r5, 0
	bl sub_8106C40
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_081070D0: .4byte gUnknown_03005E8C
	thumb_func_end sub_8107090

	.align 2, 0 @ Don't pad with nop.
