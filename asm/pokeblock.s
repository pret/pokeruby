	.include "constants/gba_constants.inc"
	.include "constants/species_constants.inc"
	.include "asm/macros.inc"

	.syntax unified

	.text

	thumb_func_start sub_810B674
sub_810B674: @ 810B674
	push {lr}
	bl AnimateSprites
	bl BuildOamBuffer
	bl RunTasks
	bl UpdatePaletteFade
	pop {r0}
	bx r0
	thumb_func_end sub_810B674

	thumb_func_start sub_810B68C
sub_810B68C: @ 810B68C
	push {lr}
	bl LoadOam
	bl ProcessSpriteCopyRequests
	bl TransferPlttBuffer
	ldr r1, _0810B6B0 @ =gBGTilemapBuffers + 0x1000
	ldr r2, _0810B6B4 @ =0x06007800
	ldr r0, _0810B6B8 @ =0x040000d4
	str r1, [r0]
	str r2, [r0, 0x4]
	ldr r1, _0810B6BC @ =0x80000400
	str r1, [r0, 0x8]
	ldr r0, [r0, 0x8]
	pop {r0}
	bx r0
	.align 2, 0
_0810B6B0: .4byte gBGTilemapBuffers + 0x1000
_0810B6B4: .4byte 0x06007800
_0810B6B8: .4byte 0x040000d4
_0810B6BC: .4byte 0x80000400
	thumb_func_end sub_810B68C

	thumb_func_start sub_810B6C0
sub_810B6C0: @ 810B6C0
	push {r4,lr}
	sub sp, 0x4
	ldr r0, _0810B6DC @ =gMain
	ldr r1, _0810B6E0 @ =0x0000043c
	adds r0, r1
	ldrb r0, [r0]
	cmp r0, 0x12
	bls _0810B6D2
	b _0810B960
_0810B6D2:
	lsls r0, 2
	ldr r1, _0810B6E4 @ =_0810B6E8
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_0810B6DC: .4byte gMain
_0810B6E0: .4byte 0x0000043c
_0810B6E4: .4byte _0810B6E8
	.align 2, 0
_0810B6E8:
	.4byte _0810B734
	.4byte _0810B764
	.4byte _0810B76A
	.4byte _0810B78C
	.4byte _0810B792
	.4byte _0810B7B4
	.4byte _0810B7C0
	.4byte _0810B7DC
	.4byte _0810B7E8
	.4byte _0810B804
	.4byte _0810B810
	.4byte _0810B830
	.4byte _0810B84C
	.4byte _0810B86A
	.4byte _0810B894
	.4byte _0810B89E
	.4byte _0810B8C4
	.4byte _0810B914
	.4byte _0810B934
_0810B734:
	bl sub_80F9438
	bl sub_80F9368
	ldr r1, _0810B754 @ =REG_BG2CNT
	ldr r2, _0810B758 @ =0x00000f0a
	adds r0, r2, 0
	strh r0, [r1]
	adds r1, 0x44
	movs r0, 0
	strh r0, [r1]
	ldr r1, _0810B75C @ =gMain
	ldr r0, _0810B760 @ =0x0000043c
	adds r1, r0
	b _0810B922
	.align 2, 0
_0810B754: .4byte REG_BG2CNT
_0810B758: .4byte 0x00000f0a
_0810B75C: .4byte gMain
_0810B760: .4byte 0x0000043c
_0810B764:
	bl remove_some_task
	b _0810B91C
_0810B76A:
	bl ResetPaletteFade
	ldr r2, _0810B780 @ =gPaletteFade
	ldrb r0, [r2, 0x8]
	movs r1, 0x80
	orrs r0, r1
	strb r0, [r2, 0x8]
	ldr r1, _0810B784 @ =gMain
	ldr r0, _0810B788 @ =0x0000043c
	adds r1, r0
	b _0810B922
	.align 2, 0
_0810B780: .4byte gPaletteFade
_0810B784: .4byte gMain
_0810B788: .4byte 0x0000043c
_0810B78C:
	bl ResetSpriteData
	b _0810B91C
_0810B792:
	ldr r0, _0810B7A8 @ =gUnknown_02039244
	ldrb r0, [r0]
	cmp r0, 0x2
	beq _0810B79E
	bl ResetTasks
_0810B79E:
	ldr r1, _0810B7AC @ =gMain
	ldr r0, _0810B7B0 @ =0x0000043c
	adds r1, r0
	b _0810B922
	.align 2, 0
_0810B7A8: .4byte gUnknown_02039244
_0810B7AC: .4byte gMain
_0810B7B0: .4byte 0x0000043c
_0810B7B4:
	ldr r0, _0810B7BC @ =gWindowConfig_81E6E34
	bl SetUpWindowConfig
	b _0810B91C
	.align 2, 0
_0810B7BC: .4byte gWindowConfig_81E6E34
_0810B7C0:
	ldr r0, _0810B7D0 @ =gWindowConfig_81E6E50
	bl SetUpWindowConfig
	ldr r1, _0810B7D4 @ =gMain
	ldr r0, _0810B7D8 @ =0x0000043c
	adds r1, r0
	b _0810B922
	.align 2, 0
_0810B7D0: .4byte gWindowConfig_81E6E50
_0810B7D4: .4byte gMain
_0810B7D8: .4byte 0x0000043c
_0810B7DC:
	ldr r0, _0810B7E4 @ =gWindowConfig_81E6E34
	bl MultistepInitMenuWindowBegin
	b _0810B91C
	.align 2, 0
_0810B7E4: .4byte gWindowConfig_81E6E34
_0810B7E8:
	bl MultistepInitMenuWindowContinue
	cmp r0, 0
	bne _0810B7F2
	b _0810B960
_0810B7F2:
	ldr r1, _0810B7FC @ =gMain
	ldr r0, _0810B800 @ =0x0000043c
	adds r1, r0
	b _0810B922
	.align 2, 0
_0810B7FC: .4byte gMain
_0810B800: .4byte 0x0000043c
_0810B804:
	ldr r0, _0810B80C @ =gWindowConfig_81E6E50
	bl MultistepInitMenuWindowBegin
	b _0810B91C
	.align 2, 0
_0810B80C: .4byte gWindowConfig_81E6E50
_0810B810:
	bl MultistepInitMenuWindowContinue
	cmp r0, 0
	bne _0810B81A
	b _0810B960
_0810B81A:
	ldr r0, _0810B828 @ =0x02000000
	ldr r1, _0810B82C @ =0x0001ffff
	adds r0, r1
	movs r1, 0
	strb r1, [r0]
	b _0810B91C
	.align 2, 0
_0810B828: .4byte 0x02000000
_0810B82C: .4byte 0x0001ffff
_0810B830:
	bl sub_810B998
	lsls r0, 24
	cmp r0, 0
	bne _0810B83C
	b _0810B960
_0810B83C:
	ldr r1, _0810B844 @ =gMain
	ldr r0, _0810B848 @ =0x0000043c
	adds r1, r0
	b _0810B922
	.align 2, 0
_0810B844: .4byte gMain
_0810B848: .4byte 0x0000043c
_0810B84C:
	bl sub_80F944C
	bl LoadScrollIndicatorPalette
	movs r0, 0
	movs r1, 0xB0
	movs r2, 0x8
	bl CreateVerticalScrollIndicators
	movs r0, 0x1
	movs r1, 0xB0
	movs r2, 0x98
	bl CreateVerticalScrollIndicators
	b _0810B91C
_0810B86A:
	movs r0, 0x38
	movs r1, 0x40
	movs r2, 0
	bl sub_810BA50
	ldr r1, _0810B884 @ =0x02000000
	ldr r2, _0810B888 @ =0x0001fffe
	adds r1, r2
	strb r0, [r1]
	ldr r1, _0810B88C @ =gMain
	ldr r0, _0810B890 @ =0x0000043c
	adds r1, r0
	b _0810B922
	.align 2, 0
_0810B884: .4byte 0x02000000
_0810B888: .4byte 0x0001fffe
_0810B88C: .4byte gMain
_0810B890: .4byte 0x0000043c
_0810B894:
	bl sub_810BC98
	bl sub_810BD08
	b _0810B91C
_0810B89E:
	bl sub_810BB0C
	bl sub_810BB30
	ldr r0, _0810B8B8 @ =gUnknown_02039248
	ldrb r0, [r0, 0x1]
	bl sub_810BC84
	ldr r1, _0810B8BC @ =gMain
	ldr r0, _0810B8C0 @ =0x0000043c
	adds r1, r0
	b _0810B922
	.align 2, 0
_0810B8B8: .4byte gUnknown_02039248
_0810B8BC: .4byte gMain
_0810B8C0: .4byte 0x0000043c
_0810B8C4:
	ldr r3, _0810B8FC @ =0x04000208
	ldrh r2, [r3]
	movs r0, 0
	strh r0, [r3]
	ldr r4, _0810B900 @ =0x04000200
	ldrh r0, [r4]
	movs r1, 0x1
	orrs r0, r1
	strh r0, [r4]
	strh r2, [r3]
	ldr r2, _0810B904 @ =REG_DISPSTAT
	ldrh r0, [r2]
	movs r1, 0x8
	orrs r0, r1
	strh r0, [r2]
	ldr r0, _0810B908 @ =sub_810B68C
	bl SetVBlankCallback
	movs r1, 0x80
	lsls r1, 19
	movs r2, 0xBA
	lsls r2, 5
	adds r0, r2, 0
	strh r0, [r1]
	ldr r1, _0810B90C @ =gMain
	ldr r0, _0810B910 @ =0x0000043c
	adds r1, r0
	b _0810B922
	.align 2, 0
_0810B8FC: .4byte 0x04000208
_0810B900: .4byte 0x04000200
_0810B904: .4byte REG_DISPSTAT
_0810B908: .4byte sub_810B68C
_0810B90C: .4byte gMain
_0810B910: .4byte 0x0000043c
_0810B914:
	bl sub_8055870
	cmp r0, 0x1
	beq _0810B960
_0810B91C:
	ldr r1, _0810B92C @ =gMain
	ldr r2, _0810B930 @ =0x0000043c
	adds r1, r2
_0810B922:
	ldrb r0, [r1]
	adds r0, 0x1
	strb r0, [r1]
	b _0810B960
	.align 2, 0
_0810B92C: .4byte gMain
_0810B930: .4byte 0x0000043c
_0810B934:
	movs r0, 0x1
	negs r0, r0
	movs r1, 0
	str r1, [sp]
	movs r2, 0x10
	movs r3, 0
	bl BeginNormalPaletteFade
	ldr r2, _0810B958 @ =gPaletteFade
	ldrb r1, [r2, 0x8]
	movs r0, 0x7F
	ands r0, r1
	strb r0, [r2, 0x8]
	ldr r0, _0810B95C @ =sub_810B674
	bl SetMainCallback2
	movs r0, 0x1
	b _0810B962
	.align 2, 0
_0810B958: .4byte gPaletteFade
_0810B95C: .4byte sub_810B674
_0810B960:
	movs r0, 0
_0810B962:
	add sp, 0x4
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end sub_810B6C0

	thumb_func_start sub_810B96C
sub_810B96C: @ 810B96C
	push {lr}
_0810B96E:
	bl sub_810B6C0
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _0810B988
	ldr r0, _0810B984 @ =sub_810BF7C
	movs r1, 0
	bl CreateTask
	b _0810B994
	.align 2, 0
_0810B984: .4byte sub_810BF7C
_0810B988:
	bl sub_80F9344
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _0810B96E
_0810B994:
	pop {r0}
	bx r0
	thumb_func_end sub_810B96C

	thumb_func_start sub_810B998
sub_810B998: @ 810B998
	push {lr}
	ldr r0, _0810B9B0 @ =0x02000000
	ldr r1, _0810B9B4 @ =0x0001ffff
	adds r0, r1
	ldrb r0, [r0]
	cmp r0, 0x4
	bhi _0810BA48
	lsls r0, 2
	ldr r1, _0810B9B8 @ =_0810B9BC
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_0810B9B0: .4byte 0x02000000
_0810B9B4: .4byte 0x0001ffff
_0810B9B8: .4byte _0810B9BC
	.align 2, 0
_0810B9BC:
	.4byte _0810B9D0
	.4byte _0810B9E4
	.4byte _0810B9F8
	.4byte _0810BA08
	.4byte _0810BA28
_0810B9D0:
	ldr r0, _0810B9DC @ =gMenuPokeblock_Gfx
	ldr r1, _0810B9E0 @ =0x06008000
	bl LZDecompressVram
	b _0810BA0E
	.align 2, 0
_0810B9DC: .4byte gMenuPokeblock_Gfx
_0810B9E0: .4byte 0x06008000
_0810B9E4:
	ldr r0, _0810B9F0 @ =gMenuPokeblock_Tilemap
	ldr r1, _0810B9F4 @ =gBGTilemapBuffers + 0x1000
	bl sub_800D238
	b _0810BA0E
	.align 2, 0
_0810B9F0: .4byte gMenuPokeblock_Tilemap
_0810B9F4: .4byte gBGTilemapBuffers + 0x1000
_0810B9F8:
	ldr r0, _0810BA04 @ =gMenuPokeblock_Pal
	movs r1, 0
	movs r2, 0xC0
	bl LoadCompressedPalette
	b _0810BA0E
	.align 2, 0
_0810BA04: .4byte gMenuPokeblock_Pal
_0810BA08:
	ldr r0, _0810BA1C @ =gUnknown_083F7F74
	bl LoadCompressedObjectPic
_0810BA0E:
	ldr r1, _0810BA20 @ =0x02000000
	ldr r0, _0810BA24 @ =0x0001ffff
	adds r1, r0
	ldrb r0, [r1]
	adds r0, 0x1
	strb r0, [r1]
	b _0810BA48
	.align 2, 0
_0810BA1C: .4byte gUnknown_083F7F74
_0810BA20: .4byte 0x02000000
_0810BA24: .4byte 0x0001ffff
_0810BA28:
	ldr r0, _0810BA3C @ =gUnknown_083F7F7C
	bl LoadCompressedObjectPalette
	ldr r0, _0810BA40 @ =0x02000000
	ldr r1, _0810BA44 @ =0x0001ffff
	adds r0, r1
	movs r1, 0
	strb r1, [r0]
	movs r0, 0x1
	b _0810BA4A
	.align 2, 0
_0810BA3C: .4byte gUnknown_083F7F7C
_0810BA40: .4byte 0x02000000
_0810BA44: .4byte 0x0001ffff
_0810BA48:
	movs r0, 0
_0810BA4A:
	pop {r1}
	bx r1
	thumb_func_end sub_810B998

	thumb_func_start sub_810BA50
sub_810BA50: @ 810BA50
	push {r4,r5,lr}
	adds r4, r0, 0
	adds r5, r1, 0
	adds r3, r2, 0
	lsls r3, 24
	lsrs r3, 24
	ldr r0, _0810BA78 @ =gSpriteTemplate_83F7F84
	lsls r4, 16
	asrs r4, 16
	lsls r5, 16
	asrs r5, 16
	adds r1, r4, 0
	adds r2, r5, 0
	bl CreateSprite
	lsls r0, 24
	lsrs r0, 24
	pop {r4,r5}
	pop {r1}
	bx r1
	.align 2, 0
_0810BA78: .4byte gSpriteTemplate_83F7F84
	thumb_func_end sub_810BA50

	thumb_func_start sub_810BA7C
sub_810BA7C: @ 810BA7C
	push {lr}
	ldr r1, _0810BA98 @ =gUnknown_02039244
	strb r0, [r1]
	ldrb r2, [r1]
	cmp r2, 0x2
	beq _0810BAA8
	cmp r2, 0x3
	beq _0810BAC0
	ldr r1, _0810BA9C @ =gUnknown_03000758
	ldr r0, _0810BAA0 @ =gUnknown_083F7F1C
	str r0, [r1]
	ldr r1, _0810BAA4 @ =gUnknown_0203924C
	movs r0, 0x3
	b _0810BACA
	.align 2, 0
_0810BA98: .4byte gUnknown_02039244
_0810BA9C: .4byte gUnknown_03000758
_0810BAA0: .4byte gUnknown_083F7F1C
_0810BAA4: .4byte gUnknown_0203924C
_0810BAA8:
	ldr r0, _0810BAB4 @ =gUnknown_03000758
	ldr r1, _0810BAB8 @ =gUnknown_083F7F1F
	str r1, [r0]
	ldr r0, _0810BABC @ =gUnknown_0203924C
	strb r2, [r0]
	b _0810BACC
	.align 2, 0
_0810BAB4: .4byte gUnknown_03000758
_0810BAB8: .4byte gUnknown_083F7F1F
_0810BABC: .4byte gUnknown_0203924C
_0810BAC0:
	ldr r1, _0810BAD0 @ =gUnknown_03000758
	ldr r0, _0810BAD4 @ =gUnknown_083F7F21
	str r0, [r1]
	ldr r1, _0810BAD8 @ =gUnknown_0203924C
	movs r0, 0x2
_0810BACA:
	strb r0, [r1]
_0810BACC:
	pop {r0}
	bx r0
	.align 2, 0
_0810BAD0: .4byte gUnknown_03000758
_0810BAD4: .4byte gUnknown_083F7F21
_0810BAD8: .4byte gUnknown_0203924C
	thumb_func_end sub_810BA7C

	thumb_func_start sub_810BADC
sub_810BADC: @ 810BADC
	push {lr}
	movs r0, 0x2
	bl sub_810BA7C
	ldr r0, _0810BAF0 @ =sub_810B96C
	bl SetMainCallback2
	pop {r0}
	bx r0
	.align 2, 0
_0810BAF0: .4byte sub_810B96C
	thumb_func_end sub_810BADC

	thumb_func_start sub_810BAF4
sub_810BAF4: @ 810BAF4
	push {lr}
	movs r0, 0x3
	bl sub_810BA7C
	ldr r0, _0810BB08 @ =sub_810B96C
	bl SetMainCallback2
	pop {r0}
	bx r0
	.align 2, 0
_0810BB08: .4byte sub_810B96C
	thumb_func_end sub_810BAF4

	thumb_func_start sub_810BB0C
sub_810BB0C: @ 810BB0C
	push {lr}
	ldr r0, _0810BB28 @ =gWindowConfig_81E6E34
	bl BasicInitMenuWindow
	ldr r0, _0810BB2C @ =0x00000111
	bl ItemId_GetItem
	movs r1, 0x2
	movs r2, 0x1
	movs r3, 0x48
	bl sub_8072BD8
	pop {r0}
	bx r0
	.align 2, 0
_0810BB28: .4byte gWindowConfig_81E6E34
_0810BB2C: .4byte 0x00000111
	thumb_func_end sub_810BB0C

	thumb_func_start sub_810BB30
sub_810BB30: @ 810BB30
	push {lr}
	ldr r0, _0810BB70 @ =gWindowConfig_81E6E34
	bl BasicInitMenuWindow
	ldr r0, _0810BB74 @ =gContestStatsText_Spicy
	movs r1, 0x2
	movs r2, 0xD
	bl MenuPrint
	ldr r0, _0810BB78 @ =gContestStatsText_Dry
	movs r1, 0x2
	movs r2, 0xF
	bl MenuPrint
	ldr r0, _0810BB7C @ =gContestStatsText_Sweet
	movs r1, 0x2
	movs r2, 0x11
	bl MenuPrint
	ldr r0, _0810BB80 @ =gContestStatsText_Bitter
	movs r1, 0x8
	movs r2, 0xD
	bl MenuPrint
	ldr r0, _0810BB84 @ =gContestStatsText_Sour
	movs r1, 0x8
	movs r2, 0xF
	bl MenuPrint
	pop {r0}
	bx r0
	.align 2, 0
_0810BB70: .4byte gWindowConfig_81E6E34
_0810BB74: .4byte gContestStatsText_Spicy
_0810BB78: .4byte gContestStatsText_Dry
_0810BB7C: .4byte gContestStatsText_Sweet
_0810BB80: .4byte gContestStatsText_Bitter
_0810BB84: .4byte gContestStatsText_Sour
	thumb_func_end sub_810BB30

	thumb_func_start sub_810BB88
sub_810BB88: @ 810BB88
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	lsls r0, 24
	lsrs r0, 24
	mov r8, r0
	ldr r0, _0810BBF4 @ =gWindowConfig_81E6E34
	bl BasicInitMenuWindow
	mov r6, r8
	adds r0, r6, 0
	adds r0, 0x8
	cmp r6, r0
	bgt _0810BC6C
	ldr r0, _0810BBF8 @ =gStringVar1
	mov r9, r0
	ldr r1, _0810BBFC @ =gSaveBlock1
	mov r10, r1
_0810BBB0:
	mov r1, r8
	subs r0, r6, r1
	lsls r0, 25
	lsrs r7, r0, 24
	ldr r0, _0810BC00 @ =gUnknown_02039248
	ldrb r0, [r0, 0x2]
	cmp r6, r0
	bne _0810BC08
	mov r0, r9
	ldr r1, _0810BC04 @ =gContestStatsText_StowCase
	movs r2, 0x78
	movs r3, 0
	bl sub_8072C74
	movs r2, 0x1
	orrs r2, r7
	mov r0, r9
	movs r1, 0xF
	bl MenuPrint
	mov r0, r8
	adds r0, 0x8
	cmp r6, r0
	beq _0810BC6C
	adds r1, r7, 0x3
	lsls r1, 24
	lsrs r1, 24
	movs r0, 0xF
	movs r2, 0x1D
	movs r3, 0x12
	bl MenuZeroFillWindowRect
	b _0810BC6C
	.align 2, 0
_0810BBF4: .4byte gWindowConfig_81E6E34
_0810BBF8: .4byte gStringVar1
_0810BBFC: .4byte gSaveBlock1
_0810BC00: .4byte gUnknown_02039248
_0810BC04: .4byte gContestStatsText_StowCase
_0810BC08:
	lsls r5, r6, 3
	mov r1, r10
	adds r0, r5, r1
	movs r1, 0xFF
	lsls r1, 3
	adds r0, r1
	ldrb r0, [r0]
	lsls r0, 2
	ldr r1, _0810BC7C @ =gPokeblockNames
	adds r0, r1
	ldr r1, [r0]
	mov r0, r9
	movs r2, 0x5E
	movs r3, 0
	bl sub_8072C74
	adds r4, r0, 0
	movs r0, 0xFC
	strb r0, [r4]
	movs r0, 0x14
	strb r0, [r4, 0x1]
	movs r0, 0x6
	strb r0, [r4, 0x2]
	adds r4, 0x3
	ldr r0, _0810BC80 @ =gSaveBlock1 + 0x7F8
	adds r5, r0
	adds r0, r5, 0
	bl sub_810C9B0
	adds r1, r0, 0
	lsls r1, 24
	lsrs r1, 24
	adds r0, r4, 0
	movs r2, 0x1
	movs r3, 0x3
	bl ConvertIntToDecimalStringN
	movs r2, 0x1
	orrs r2, r7
	mov r0, r9
	movs r1, 0xF
	bl MenuPrint
	adds r0, r6, 0x1
	lsls r0, 24
	lsrs r6, r0, 24
	mov r0, r8
	adds r0, 0x8
	cmp r6, r0
	ble _0810BBB0
_0810BC6C:
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_0810BC7C: .4byte gPokeblockNames
_0810BC80: .4byte gSaveBlock1 + 0x7F8
	thumb_func_end sub_810BB88

	thumb_func_start sub_810BC84
sub_810BC84: @ 810BC84
	push {lr}
	lsls r0, 24
	lsrs r0, 24
	bl sub_810BB88
	movs r0, 0
	bl sub_810BDAC
	pop {r0}
	bx r0
	thumb_func_end sub_810BC84

	thumb_func_start sub_810BC98
sub_810BC98: @ 810BC98
	push {r4-r7,lr}
	mov r7, r9
	mov r6, r8
	push {r6,r7}
	movs r2, 0
	ldr r0, _0810BD00 @ =gSaveBlock1
	mov r9, r0
_0810BCA6:
	adds r1, r2, 0x1
	lsls r0, r1, 16
	lsrs r5, r0, 16
	mov r8, r1
	cmp r5, 0x27
	bhi _0810BCE8
	lsls r1, r2, 3
	mov r2, r9
	adds r0, r1, r2
	movs r2, 0xFF
	lsls r2, 3
	adds r7, r0, r2
	ldr r0, _0810BD04 @ =gSaveBlock1 + 0x7F8
	mov r12, r0
	adds r6, r1, r0
_0810BCC4:
	ldrb r0, [r7]
	cmp r0, 0
	bne _0810BCDE
	ldr r3, [r6]
	ldr r4, [r6, 0x4]
	lsls r2, r5, 3
	add r2, r12
	ldr r0, [r2]
	ldr r1, [r2, 0x4]
	str r0, [r6]
	str r1, [r6, 0x4]
	str r3, [r2]
	str r4, [r2, 0x4]
_0810BCDE:
	adds r0, r5, 0x1
	lsls r0, 16
	lsrs r5, r0, 16
	cmp r5, 0x27
	bls _0810BCC4
_0810BCE8:
	mov r1, r8
	lsls r0, r1, 16
	lsrs r2, r0, 16
	cmp r2, 0x26
	bls _0810BCA6
	pop {r3,r4}
	mov r8, r3
	mov r9, r4
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_0810BD00: .4byte gSaveBlock1
_0810BD04: .4byte gSaveBlock1 + 0x7F8
	thumb_func_end sub_810BC98

	thumb_func_start sub_810BD08
sub_810BD08: @ 810BD08
	push {r4,r5,lr}
	ldr r1, _0810BD5C @ =gUnknown_02039248
	movs r0, 0
	strb r0, [r1, 0x2]
	movs r2, 0
	ldr r5, _0810BD60 @ =gSaveBlock1
	movs r4, 0xFF
	lsls r4, 3
	adds r3, r1, 0
_0810BD1A:
	lsls r0, r2, 3
	adds r0, r5
	adds r0, r4
	ldrb r0, [r0]
	cmp r0, 0
	beq _0810BD2C
	ldrb r0, [r3, 0x2]
	adds r0, 0x1
	strb r0, [r3, 0x2]
_0810BD2C:
	adds r0, r2, 0x1
	lsls r0, 24
	lsrs r2, r0, 24
	cmp r2, 0x27
	bls _0810BD1A
	ldrb r0, [r1, 0x2]
	cmp r0, 0x7
	bls _0810BD3E
	movs r0, 0x8
_0810BD3E:
	strb r0, [r1, 0x3]
	ldrb r2, [r1, 0x1]
	adds r0, r2, 0
	adds r0, 0x8
	ldrb r3, [r1, 0x2]
	cmp r0, r3
	ble _0810BD54
	cmp r2, 0
	beq _0810BD54
	subs r0, r2, 0x1
	strb r0, [r1, 0x1]
_0810BD54:
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_0810BD5C: .4byte gUnknown_02039248
_0810BD60: .4byte gSaveBlock1
	thumb_func_end sub_810BD08

	thumb_func_start sub_810BD64
sub_810BD64: @ 810BD64
	push {r4,r5,lr}
	lsls r0, 16
	lsrs r3, r0, 16
	movs r2, 0
	ldr r5, _0810BDA4 @ =gUnknown_02039248
	ldr r4, _0810BDA8 @ =gBGTilemapBuffers + 0x1000
_0810BD70:
	ldrb r0, [r5]
	lsls r0, 1
	adds r0, 0x1
	lsls r0, 5
	adds r1, r2, 0
	adds r1, 0xF
	adds r0, r1
	lsls r0, 1
	adds r0, r4
	strh r3, [r0]
	ldrb r0, [r5]
	lsls r0, 6
	adds r0, 0x40
	adds r0, r1
	lsls r0, 1
	adds r0, r4
	strh r3, [r0]
	adds r0, r2, 0x1
	lsls r0, 24
	lsrs r2, r0, 24
	cmp r2, 0xD
	bls _0810BD70
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_0810BDA4: .4byte gUnknown_02039248
_0810BDA8: .4byte gBGTilemapBuffers + 0x1000
	thumb_func_end sub_810BD64

	thumb_func_start sub_810BDAC
sub_810BDAC: @ 810BDAC
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	lsls r0, 24
	cmp r0, 0
	bne _0810BDCC
	ldr r0, _0810BDC4 @ =0x00001005
	ldr r1, _0810BDC8 @ =0x00001014
	bl sub_810BD64
	b _0810BDD4
	.align 2, 0
_0810BDC4: .4byte 0x00001005
_0810BDC8: .4byte 0x00001014
_0810BDCC:
	ldr r0, _0810BDE8 @ =0x00002005
	ldr r1, _0810BDEC @ =0x00002014
	bl sub_810BD64
_0810BDD4:
	ldr r0, _0810BDF0 @ =gUnknown_02039248
	ldrb r0, [r0, 0x1]
	cmp r0, 0
	beq _0810BDF4
	movs r0, 0
	movs r1, 0
	bl sub_80F979C
	b _0810BDFC
	.align 2, 0
_0810BDE8: .4byte 0x00002005
_0810BDEC: .4byte 0x00002014
_0810BDF0: .4byte gUnknown_02039248
_0810BDF4:
	movs r0, 0
	movs r1, 0x1
	bl sub_80F979C
_0810BDFC:
	ldr r2, _0810BE1C @ =gUnknown_02039248
	ldrb r0, [r2, 0x2]
	ldrb r1, [r2, 0x3]
	cmp r0, r1
	bls _0810BE20
	ldrb r0, [r2, 0x1]
	ldrb r1, [r2, 0x3]
	adds r0, r1
	ldrb r2, [r2, 0x2]
	cmp r0, r2
	beq _0810BE20
	movs r0, 0x1
	movs r1, 0
	bl sub_80F979C
	b _0810BE28
	.align 2, 0
_0810BE1C: .4byte gUnknown_02039248
_0810BE20:
	movs r0, 0x1
	movs r1, 0x1
	bl sub_80F979C
_0810BE28:
	movs r6, 0
	ldr r7, _0810BE94 @ =gBGTilemapBuffers + 0x1000
	movs r0, 0xF
	mov r8, r0
_0810BE30:
	adds r0, r6, 0
	movs r1, 0x3
	bl __umodsi3
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 18
	ldr r1, _0810BE98 @ =0x000001a1
	adds r4, r1
	adds r0, r6, 0
	movs r1, 0x3
	bl __udivsi3
	lsls r0, 24
	lsrs r0, 24
	lsls r1, r0, 1
	adds r1, r0
	lsls r1, 1
	adds r5, r4, r1
	ldr r1, _0810BE9C @ =gUnknown_02039248
	ldrb r2, [r1]
	ldrb r0, [r1, 0x1]
	adds r0, r2, r0
	ldrb r1, [r1, 0x2]
	cmp r0, r1
	beq _0810BEB8
	lsls r0, 3
	ldr r1, _0810BEA0 @ =gSaveBlock1 + 0x7F8
	adds r0, r1
	adds r4, r6, 0x1
	lsls r1, r4, 24
	lsrs r1, 24
	bl sub_810CA9C
	lsls r0, 16
	cmp r0, 0
	ble _0810BEA4
	lsls r1, r5, 1
	adds r1, r7
	lsls r2, r6, 12
	adds r0, r2, 0
	adds r0, 0x17
	strh r0, [r1]
	adds r0, r5, 0
	adds r0, 0x20
	lsls r0, 1
	adds r0, r7
	adds r2, 0x18
	strh r2, [r0]
	b _0810BECC
	.align 2, 0
_0810BE94: .4byte gBGTilemapBuffers + 0x1000
_0810BE98: .4byte 0x000001a1
_0810BE9C: .4byte gUnknown_02039248
_0810BEA0: .4byte gSaveBlock1 + 0x7F8
_0810BEA4:
	lsls r0, r5, 1
	adds r0, r7
	mov r1, r8
	strh r1, [r0]
	adds r0, r5, 0
	adds r0, 0x20
	lsls r0, 1
	adds r0, r7
	strh r1, [r0]
	b _0810BECC
_0810BEB8:
	lsls r0, r5, 1
	adds r0, r7
	mov r1, r8
	strh r1, [r0]
	adds r0, r5, 0
	adds r0, 0x20
	lsls r0, 1
	adds r0, r7
	strh r1, [r0]
	adds r4, r6, 0x1
_0810BECC:
	lsls r0, r4, 24
	lsrs r6, r0, 24
	cmp r6, 0x4
	bls _0810BE30
	ldr r0, _0810BF10 @ =gWindowConfig_81E6E34
	bl BasicInitMenuWindow
	ldr r0, _0810BF14 @ =gUnknown_02039248
	ldrb r2, [r0]
	ldrb r1, [r0, 0x1]
	adds r2, r1
	ldrb r0, [r0, 0x2]
	cmp r2, r0
	beq _0810BF20
	ldr r4, _0810BF18 @ =gStringVar1
	lsls r0, r2, 3
	ldr r1, _0810BF1C @ =gSaveBlock1 + 0x7F8
	adds r0, r1
	bl sub_810C9E8
	adds r1, r0, 0
	lsls r1, 24
	lsrs r1, 24
	adds r0, r4, 0
	movs r2, 0x10
	movs r3, 0x1
	bl sub_8072C14
	adds r0, r4, 0
	movs r1, 0xB
	movs r2, 0x11
	bl MenuPrint
	b _0810BF2C
	.align 2, 0
_0810BF10: .4byte gWindowConfig_81E6E34
_0810BF14: .4byte gUnknown_02039248
_0810BF18: .4byte gStringVar1
_0810BF1C: .4byte gSaveBlock1 + 0x7F8
_0810BF20:
	movs r0, 0xB
	movs r1, 0x11
	movs r2, 0xC
	movs r3, 0x12
	bl MenuZeroFillWindowRect
_0810BF2C:
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r0}
	bx r0
	thumb_func_end sub_810BDAC

	thumb_func_start sub_810BF38
sub_810BF38: @ 810BF38
	push {r4,lr}
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	movs r0, 0x5
	bl PlaySoundEffect
	ldr r2, _0810BF6C @ =gSprites
	ldr r0, _0810BF70 @ =0x02000000
	ldr r1, _0810BF74 @ =0x0001fffe
	adds r0, r1
	ldrb r1, [r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r2, 0x1C
	adds r0, r2
	ldr r1, _0810BF78 @ =sub_810C8D4
	str r1, [r0]
	adds r0, r4, 0
	bl sub_810BDAC
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0810BF6C: .4byte gSprites
_0810BF70: .4byte 0x02000000
_0810BF74: .4byte 0x0001fffe
_0810BF78: .4byte sub_810C8D4
	thumb_func_end sub_810BF38

	thumb_func_start sub_810BF7C
sub_810BF7C: @ 810BF7C
	push {r4,r5,lr}
	lsls r0, 24
	lsrs r5, r0, 24
	adds r4, r5, 0
	ldr r0, _0810BFB8 @ =gPaletteFade
	ldrb r1, [r0, 0x7]
	movs r3, 0x80
	adds r0, r3, 0
	ands r0, r1
	cmp r0, 0
	beq _0810BF94
	b _0810C0B8
_0810BF94:
	ldr r2, _0810BFBC @ =gMain
	ldrh r1, [r2, 0x30]
	movs r0, 0x40
	ands r0, r1
	cmp r0, 0
	beq _0810BFCE
	ldr r4, _0810BFC0 @ =gUnknown_02039248
	ldrb r0, [r4]
	cmp r0, 0
	beq _0810BFC4
	movs r0, 0x5
	movs r1, 0x14
	bl sub_810BD64
	ldrb r0, [r4]
	subs r0, 0x1
	strb r0, [r4]
	b _0810C00A
	.align 2, 0
_0810BFB8: .4byte gPaletteFade
_0810BFBC: .4byte gMain
_0810BFC0: .4byte gUnknown_02039248
_0810BFC4:
	ldrb r0, [r4, 0x1]
	cmp r0, 0
	beq _0810C0B8
	subs r0, 0x1
	b _0810C002
_0810BFCE:
	adds r0, r3, 0
	ands r0, r1
	cmp r0, 0
	beq _0810C012
	ldr r4, _0810BFF0 @ =gUnknown_02039248
	ldrb r0, [r4]
	ldrb r1, [r4, 0x3]
	cmp r0, r1
	beq _0810BFF4
	movs r0, 0x5
	movs r1, 0x14
	bl sub_810BD64
	ldrb r0, [r4]
	adds r0, 0x1
	strb r0, [r4]
	b _0810C00A
	.align 2, 0
_0810BFF0: .4byte gUnknown_02039248
_0810BFF4:
	ldrb r1, [r4, 0x1]
	ldrb r0, [r4]
	adds r0, r1, r0
	ldrb r2, [r4, 0x2]
	cmp r0, r2
	beq _0810C0B8
	adds r0, r1, 0x1
_0810C002:
	strb r0, [r4, 0x1]
	ldrb r0, [r4, 0x1]
	bl sub_810BB88
_0810C00A:
	movs r0, 0
	bl sub_810BF38
	b _0810C0B8
_0810C012:
	ldrh r1, [r2, 0x2E]
	movs r0, 0x4
	ands r0, r1
	cmp r0, 0
	beq _0810C05C
	ldr r4, _0810C050 @ =gUnknown_02039248
	ldrb r0, [r4, 0x1]
	ldrb r1, [r4]
	adds r0, r1
	ldrb r1, [r4, 0x2]
	cmp r0, r1
	beq _0810C0B8
	movs r0, 0x5
	bl PlaySoundEffect
	movs r0, 0x1
	bl sub_810BDAC
	ldr r1, _0810C054 @ =gTasks
	lsls r0, r5, 2
	adds r0, r5
	lsls r0, 3
	adds r0, r1
	ldrb r1, [r4, 0x1]
	ldrb r2, [r4]
	adds r1, r2
	strh r1, [r0, 0x8]
	ldr r1, _0810C058 @ =sub_810C0C8
	str r1, [r0]
	b _0810C0B8
	.align 2, 0
_0810C050: .4byte gUnknown_02039248
_0810C054: .4byte gTasks
_0810C058: .4byte sub_810C0C8
_0810C05C:
	movs r0, 0x1
	ands r0, r1
	cmp r0, 0
	beq _0810C09C
	movs r0, 0x5
	bl PlaySoundEffect
	ldr r0, _0810C088 @ =gUnknown_02039248
	ldrb r1, [r0, 0x1]
	ldrb r2, [r0]
	adds r1, r2
	ldrb r0, [r0, 0x2]
	cmp r1, r0
	bne _0810C094
	ldr r1, _0810C08C @ =gScriptResult
	ldr r2, _0810C090 @ =0x0000ffff
	adds r0, r2, 0
	strh r0, [r1]
	adds r0, r5, 0
	bl sub_810C31C
	b _0810C0B8
	.align 2, 0
_0810C088: .4byte gUnknown_02039248
_0810C08C: .4byte gScriptResult
_0810C090: .4byte 0x0000ffff
_0810C094:
	adds r0, r5, 0
	bl sub_810C368
	b _0810C0B8
_0810C09C:
	movs r0, 0x2
	ands r0, r1
	cmp r0, 0
	beq _0810C0B8
	movs r0, 0x5
	bl PlaySoundEffect
	ldr r1, _0810C0C0 @ =gScriptResult
	ldr r2, _0810C0C4 @ =0x0000ffff
	adds r0, r2, 0
	strh r0, [r1]
	adds r0, r4, 0
	bl sub_810C31C
_0810C0B8:
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_0810C0C0: .4byte gScriptResult
_0810C0C4: .4byte 0x0000ffff
	thumb_func_end sub_810BF7C

	thumb_func_start sub_810C0C8
sub_810C0C8: @ 810C0C8
	push {r4,r5,lr}
	lsls r0, 24
	lsrs r5, r0, 24
	ldr r2, _0810C0F4 @ =gMain
	ldrh r1, [r2, 0x30]
	movs r0, 0x40
	ands r0, r1
	cmp r0, 0
	beq _0810C110
	ldr r4, _0810C0F8 @ =gUnknown_02039248
	ldrb r0, [r4]
	cmp r0, 0
	beq _0810C0FC
	movs r0, 0x5
	movs r1, 0x14
	bl sub_810BD64
	ldrb r0, [r4]
	subs r0, 0x1
	strb r0, [r4]
	b _0810C158
	.align 2, 0
_0810C0F4: .4byte gMain
_0810C0F8: .4byte gUnknown_02039248
_0810C0FC:
	ldrb r0, [r4, 0x1]
	cmp r0, 0
	beq _0810C1BA
	adds r0, r5, 0
	movs r1, 0
	bl sub_810C1C8
	ldrb r0, [r4, 0x1]
	subs r0, 0x1
	b _0810C150
_0810C110:
	movs r0, 0x80
	ands r0, r1
	cmp r0, 0
	beq _0810C168
	ldr r4, _0810C134 @ =gUnknown_02039248
	ldrb r0, [r4]
	ldrb r1, [r4, 0x3]
	cmp r0, r1
	beq _0810C138
	movs r0, 0x5
	movs r1, 0x14
	bl sub_810BD64
	ldrb r0, [r4]
	adds r0, 0x1
	strb r0, [r4]
	b _0810C158
	.align 2, 0
_0810C134: .4byte gUnknown_02039248
_0810C138:
	ldrb r0, [r4, 0x1]
	ldrb r1, [r4]
	adds r0, r1
	ldrb r1, [r4, 0x2]
	cmp r0, r1
	beq _0810C1BA
	adds r0, r5, 0
	movs r1, 0
	bl sub_810C1C8
	ldrb r0, [r4, 0x1]
	adds r0, 0x1
_0810C150:
	strb r0, [r4, 0x1]
	ldrb r0, [r4, 0x1]
	bl sub_810BB88
_0810C158:
	movs r0, 0x1
	bl sub_810BF38
	adds r0, r5, 0
	movs r1, 0x1
	bl sub_810C1C8
	b _0810C1BA
_0810C168:
	ldrh r1, [r2, 0x2E]
	movs r0, 0x1
	ands r0, r1
	cmp r0, 0
	bne _0810C17A
	movs r0, 0x4
	ands r0, r1
	cmp r0, 0
	beq _0810C190
_0810C17A:
	movs r0, 0x5
	bl PlaySoundEffect
	adds r0, r5, 0
	movs r1, 0
	bl sub_810C1C8
	adds r0, r5, 0
	bl sub_810C23C
	b _0810C1AC
_0810C190:
	movs r0, 0x2
	ands r0, r1
	cmp r0, 0
	beq _0810C1BA
	movs r0, 0x5
	bl PlaySoundEffect
	adds r0, r5, 0
	movs r1, 0
	bl sub_810C1C8
	movs r0, 0
	bl sub_810BDAC
_0810C1AC:
	ldr r0, _0810C1C0 @ =gTasks
	lsls r1, r5, 2
	adds r1, r5
	lsls r1, 3
	adds r1, r0
	ldr r0, _0810C1C4 @ =sub_810BF7C
	str r0, [r1]
_0810C1BA:
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_0810C1C0: .4byte gTasks
_0810C1C4: .4byte sub_810BF7C
	thumb_func_end sub_810C0C8

	thumb_func_start sub_810C1C8
sub_810C1C8: @ 810C1C8
	push {r4-r6,lr}
	lsls r0, 24
	lsrs r2, r0, 24
	lsls r1, 24
	ldr r6, _0810C22C @ =0x00001005
	cmp r1, 0
	bne _0810C1D8
	movs r6, 0x5
_0810C1D8:
	ldr r1, _0810C230 @ =gTasks
	lsls r0, r2, 2
	adds r0, r2
	lsls r0, 3
	adds r0, r1
	ldr r2, _0810C234 @ =gUnknown_02039248
	ldrb r1, [r2, 0x1]
	ldrh r0, [r0, 0x8]
	subs r0, r1
	lsls r1, r0, 16
	lsrs r0, r1, 16
	cmp r0, 0x8
	bhi _0810C226
	asrs r0, r1, 16
	ldrb r2, [r2]
	cmp r0, r2
	beq _0810C226
	movs r2, 0
	lsls r0, 1
	adds r1, r0, 0x1
	lsls r5, r1, 5
	ldr r3, _0810C238 @ =gBGTilemapBuffers + 0x1000
	adds r0, 0x2
	lsls r4, r0, 5
_0810C208:
	adds r0, r2, 0
	adds r0, 0xF
	adds r1, r5, r0
	lsls r1, 1
	adds r1, r3
	strh r6, [r1]
	adds r0, r4, r0
	lsls r0, 1
	adds r0, r3
	strh r6, [r0]
	adds r0, r2, 0x1
	lsls r0, 24
	lsrs r2, r0, 24
	cmp r2, 0xD
	bls _0810C208
_0810C226:
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_0810C22C: .4byte 0x00001005
_0810C230: .4byte gTasks
_0810C234: .4byte gUnknown_02039248
_0810C238: .4byte gBGTilemapBuffers + 0x1000
	thumb_func_end sub_810C1C8

	thumb_func_start sub_810C23C
sub_810C23C: @ 810C23C
	push {r4-r7,lr}
	lsls r0, 24
	lsrs r1, r0, 24
	ldr r7, _0810C25C @ =gUnknown_02039248
	ldrb r0, [r7]
	ldrb r2, [r7, 0x1]
	adds r0, r2
	lsls r0, 24
	lsrs r0, 24
	ldrb r2, [r7, 0x2]
	cmp r0, r2
	bne _0810C260
	movs r0, 0
	bl sub_810BDAC
	b _0810C2A2
	.align 2, 0
_0810C25C: .4byte gUnknown_02039248
_0810C260:
	ldr r4, _0810C2A8 @ =gSaveBlock1
	lsls r3, r0, 3
	movs r0, 0xFF
	lsls r0, 3
	adds r4, r0
	adds r3, r4
	ldr r5, [r3]
	ldr r6, [r3, 0x4]
	ldr r0, _0810C2AC @ =gTasks
	lsls r2, r1, 2
	adds r2, r1
	lsls r2, 3
	adds r2, r0
	movs r1, 0x8
	ldrsh r0, [r2, r1]
	lsls r0, 3
	adds r0, r4
	ldr r1, [r0, 0x4]
	ldr r0, [r0]
	str r0, [r3]
	str r1, [r3, 0x4]
	movs r1, 0x8
	ldrsh r0, [r2, r1]
	lsls r0, 3
	adds r0, r4
	str r5, [r0]
	str r6, [r0, 0x4]
	ldrb r0, [r7, 0x1]
	bl sub_810BB88
	movs r0, 0
	bl sub_810BDAC
_0810C2A2:
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_0810C2A8: .4byte gSaveBlock1
_0810C2AC: .4byte gTasks
	thumb_func_end sub_810C23C

	thumb_func_start sub_810C2B0
sub_810C2B0: @ 810C2B0
	push {lr}
	movs r0, 0
	bl DestroyVerticalScrollIndicator
	movs r0, 0x1
	bl DestroyVerticalScrollIndicator
	bl BuyMenuFreeMemory
	pop {r0}
	bx r0
	thumb_func_end sub_810C2B0

	thumb_func_start sub_810C2C8
sub_810C2C8: @ 810C2C8
	push {r4,r5,lr}
	lsls r0, 24
	lsrs r5, r0, 24
	ldr r0, _0810C308 @ =gPaletteFade
	ldrb r1, [r0, 0x7]
	movs r0, 0x80
	ands r0, r1
	cmp r0, 0
	bne _0810C300
	ldr r4, _0810C30C @ =gUnknown_02039244
	ldrb r0, [r4]
	cmp r0, 0x3
	bne _0810C2E8
	ldr r1, _0810C310 @ =gUnknown_0300485C
	ldr r0, _0810C314 @ =sub_8080990
	str r0, [r1]
_0810C2E8:
	bl sub_810C2B0
	ldr r0, _0810C318 @ =gUnknown_083F7EA8
	ldrb r1, [r4]
	lsls r1, 2
	adds r1, r0
	ldr r0, [r1]
	bl SetMainCallback2
	adds r0, r5, 0
	bl DestroyTask
_0810C300:
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_0810C308: .4byte gPaletteFade
_0810C30C: .4byte gUnknown_02039244
_0810C310: .4byte gUnknown_0300485C
_0810C314: .4byte sub_8080990
_0810C318: .4byte gUnknown_083F7EA8
	thumb_func_end sub_810C2C8

	thumb_func_start sub_810C31C
sub_810C31C: @ 810C31C
	push {r4,r5,lr}
	sub sp, 0x4
	lsls r0, 24
	lsrs r4, r0, 24
	movs r0, 0x1
	negs r0, r0
	movs r5, 0
	str r5, [sp]
	movs r1, 0
	movs r2, 0
	movs r3, 0x10
	bl BeginNormalPaletteFade
	ldr r0, _0810C358 @ =gUnknown_02039244
	ldrb r0, [r0]
	cmp r0, 0x1
	bls _0810C342
	ldr r0, _0810C35C @ =gScriptItemId
	strh r5, [r0]
_0810C342:
	ldr r0, _0810C360 @ =gTasks
	lsls r1, r4, 2
	adds r1, r4
	lsls r1, 3
	adds r1, r0
	ldr r0, _0810C364 @ =sub_810C2C8
	str r0, [r1]
	add sp, 0x4
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_0810C358: .4byte gUnknown_02039244
_0810C35C: .4byte gScriptItemId
_0810C360: .4byte gTasks
_0810C364: .4byte sub_810C2C8
	thumb_func_end sub_810C31C

	thumb_func_start sub_810C368
sub_810C368: @ 810C368
	push {r4-r6,lr}
	sub sp, 0x8
	lsls r0, 24
	lsrs r6, r0, 24
	movs r4, 0
	ldr r0, _0810C3E8 @ =gUnknown_02039244
	ldrb r0, [r0]
	cmp r0, 0x1
	bls _0810C37C
	movs r4, 0x2
_0810C37C:
	movs r0, 0
	bl sub_80F98A4
	movs r0, 0x1
	bl sub_80F98A4
	ldr r0, _0810C3EC @ =gWindowConfig_81E6E50
	bl BasicInitMenuWindow
	adds r1, r4, 0x4
	movs r0, 0x7
	movs r2, 0xD
	movs r3, 0xB
	bl MenuDrawTextWindow
	adds r4, 0x5
	ldr r5, _0810C3F0 @ =gUnknown_0203924C
	ldrb r2, [r5]
	ldr r3, _0810C3F4 @ =gUnknown_083F7EF4
	ldr r0, _0810C3F8 @ =gUnknown_03000758
	ldr r0, [r0]
	str r0, [sp]
	movs r0, 0x8
	adds r1, r4, 0
	bl PrintMenuItemsReordered
	ldrb r3, [r5]
	movs r0, 0
	str r0, [sp]
	movs r0, 0x5
	str r0, [sp, 0x4]
	movs r0, 0
	movs r1, 0x8
	adds r2, r4, 0
	bl InitMenu
	ldr r2, _0810C3FC @ =gScriptItemId
	ldr r1, _0810C400 @ =gUnknown_02039248
	ldrb r0, [r1]
	ldrb r1, [r1, 0x1]
	adds r0, r1
	strh r0, [r2]
	ldr r1, _0810C404 @ =gTasks
	lsls r0, r6, 2
	adds r0, r6
	lsls r0, 3
	adds r0, r1
	ldr r1, _0810C408 @ =sub_810C40C
	str r1, [r0]
	add sp, 0x8
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_0810C3E8: .4byte gUnknown_02039244
_0810C3EC: .4byte gWindowConfig_81E6E50
_0810C3F0: .4byte gUnknown_0203924C
_0810C3F4: .4byte gUnknown_083F7EF4
_0810C3F8: .4byte gUnknown_03000758
_0810C3FC: .4byte gScriptItemId
_0810C400: .4byte gUnknown_02039248
_0810C404: .4byte gTasks
_0810C408: .4byte sub_810C40C
	thumb_func_end sub_810C368

	thumb_func_start sub_810C40C
sub_810C40C: @ 810C40C
	push {r4,r5,lr}
	lsls r0, 24
	lsrs r5, r0, 24
	adds r4, r5, 0
	ldr r2, _0810C43C @ =gMain
	ldrh r1, [r2, 0x30]
	movs r0, 0x40
	ands r0, r1
	cmp r0, 0
	beq _0810C440
	bl GetMenuCursorPos
	lsls r0, 24
	cmp r0, 0
	beq _0810C4BC
	movs r0, 0x5
	bl PlaySoundEffect
	movs r0, 0x1
	negs r0, r0
	bl MoveMenuCursor
	b _0810C4BC
	.align 2, 0
_0810C43C: .4byte gMain
_0810C440:
	movs r0, 0x80
	ands r0, r1
	cmp r0, 0
	beq _0810C46C
	bl GetMenuCursorPos
	lsls r0, 24
	lsrs r0, 24
	ldr r1, _0810C468 @ =gUnknown_0203924C
	ldrb r1, [r1]
	subs r1, 0x1
	cmp r0, r1
	beq _0810C4BC
	movs r0, 0x5
	bl PlaySoundEffect
	movs r0, 0x1
	bl MoveMenuCursor
	b _0810C4BC
	.align 2, 0
_0810C468: .4byte gUnknown_0203924C
_0810C46C:
	ldrh r1, [r2, 0x2E]
	movs r0, 0x1
	ands r0, r1
	cmp r0, 0
	beq _0810C4A8
	movs r0, 0x5
	bl PlaySoundEffect
	ldr r4, _0810C4A0 @ =gUnknown_083F7EF4
	bl GetMenuCursorPos
	lsls r0, 24
	lsrs r0, 24
	ldr r1, _0810C4A4 @ =gUnknown_03000758
	ldr r1, [r1]
	adds r1, r0
	ldrb r0, [r1]
	lsls r0, 3
	adds r4, 0x4
	adds r0, r4
	ldr r1, [r0]
	adds r0, r5, 0
	bl _call_via_r1
	b _0810C4BC
	.align 2, 0
_0810C4A0: .4byte gUnknown_083F7EF4
_0810C4A4: .4byte gUnknown_03000758
_0810C4A8:
	movs r0, 0x2
	ands r0, r1
	cmp r0, 0
	beq _0810C4BC
	movs r0, 0x5
	bl PlaySoundEffect
	adds r0, r4, 0
	bl sub_810C748
_0810C4BC:
	pop {r4,r5}
	pop {r0}
	bx r0
	thumb_func_end sub_810C40C

	thumb_func_start sub_810C4C4
sub_810C4C4: @ 810C4C4
	push {r4,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	ldr r0, _0810C4F8 @ =gPaletteFade
	ldrb r1, [r0, 0x7]
	movs r0, 0x80
	ands r0, r1
	cmp r0, 0
	bne _0810C4F0
	bl sub_810C2B0
	ldr r0, _0810C4FC @ =gScriptItemId
	ldrh r0, [r0]
	lsls r0, 3
	ldr r1, _0810C500 @ =gSaveBlock1 + 0x7F8
	adds r0, r1
	ldr r1, _0810C504 @ =sub_810B96C
	bl sub_8136130
	adds r0, r4, 0
	bl DestroyTask
_0810C4F0:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0810C4F8: .4byte gPaletteFade
_0810C4FC: .4byte gScriptItemId
_0810C500: .4byte gSaveBlock1 + 0x7F8
_0810C504: .4byte sub_810B96C
	thumb_func_end sub_810C4C4

	thumb_func_start sub_810C508
sub_810C508: @ 810C508
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
	ldr r1, _0810C538 @ =gTasks
	lsls r0, r4, 2
	adds r0, r4
	lsls r0, 3
	adds r0, r1
	ldr r1, _0810C53C @ =sub_810C4C4
	str r1, [r0]
	add sp, 0x4
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0810C538: .4byte gTasks
_0810C53C: .4byte sub_810C4C4
	thumb_func_end sub_810C508

	thumb_func_start sub_810C540
sub_810C540: @ 810C540
	push {r4,r5,lr}
	adds r5, r0, 0
	lsls r5, 24
	lsrs r5, 24
	ldr r0, _0810C5A0 @ =gWindowConfig_81E6E50
	bl BasicInitMenuWindow
	bl sub_8072DEC
	movs r0, 0x7
	movs r1, 0x4
	movs r2, 0xD
	movs r3, 0xB
	bl MenuZeroFillWindowRect
	ldr r0, _0810C5A4 @ =gStringVar1
	ldr r4, _0810C5A8 @ =gPokeblockNames
	ldr r3, _0810C5AC @ =gSaveBlock1
	ldr r2, _0810C5B0 @ =gUnknown_02039248
	ldrb r1, [r2]
	ldrb r2, [r2, 0x1]
	adds r1, r2
	lsls r1, 3
	adds r1, r3
	movs r2, 0xFF
	lsls r2, 3
	adds r1, r2
	ldrb r1, [r1]
	lsls r1, 2
	adds r1, r4
	ldr r1, [r1]
	bl StringCopy
	ldr r4, _0810C5B4 @ =gStringVar4
	ldr r1, _0810C5B8 @ =gContestStatsText_ThrowAwayPrompt
	adds r0, r4, 0
	bl StringExpandPlaceholders
	ldr r2, _0810C5BC @ =sub_810C5EC
	adds r0, r5, 0
	adds r1, r4, 0
	movs r3, 0
	bl DisplayItemMessageOnField
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_0810C5A0: .4byte gWindowConfig_81E6E50
_0810C5A4: .4byte gStringVar1
_0810C5A8: .4byte gPokeblockNames
_0810C5AC: .4byte gSaveBlock1
_0810C5B0: .4byte gUnknown_02039248
_0810C5B4: .4byte gStringVar4
_0810C5B8: .4byte gContestStatsText_ThrowAwayPrompt
_0810C5BC: .4byte sub_810C5EC
	thumb_func_end sub_810C540

	thumb_func_start sub_810C5C0
sub_810C5C0: @ 810C5C0
	push {r4,lr}
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	movs r0, 0x1
	movs r1, 0x1
	bl sub_80F979C
	ldr r1, _0810C5E4 @ =gTasks
	lsls r0, r4, 2
	adds r0, r4
	lsls r0, 3
	adds r0, r1
	ldr r1, _0810C5E8 @ =sub_810C540
	str r1, [r0]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0810C5E4: .4byte gTasks
_0810C5E8: .4byte sub_810C540
	thumb_func_end sub_810C5C0

	thumb_func_start sub_810C5EC
sub_810C5EC: @ 810C5EC
	push {r4,lr}
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	movs r0, 0x7
	movs r1, 0x6
	movs r2, 0x1
	bl DisplayYesNoMenu
	ldr r1, _0810C60C @ =gUnknown_083F7F24
	adds r0, r4, 0
	bl sub_80F914C
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0810C60C: .4byte gUnknown_083F7F24
	thumb_func_end sub_810C5EC

	thumb_func_start sub_810C610
sub_810C610: @ 810C610
	push {r4,r5,lr}
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	movs r0, 0x7
	movs r1, 0x6
	movs r2, 0xD
	movs r3, 0xB
	bl MenuZeroFillWindowRect
	ldr r1, _0810C658 @ =gUnknown_02039248
	ldrb r0, [r1, 0x1]
	ldrb r1, [r1]
	adds r0, r1
	lsls r0, 24
	lsrs r0, 24
	bl sub_810CA6C
	ldr r5, _0810C65C @ =gStringVar4
	ldr r1, _0810C660 @ =gContestStatsText_WasThrownAway
	adds r0, r5, 0
	bl StringExpandPlaceholders
	ldr r2, _0810C664 @ =sub_810C704
	adds r0, r4, 0
	adds r1, r5, 0
	movs r3, 0
	bl DisplayItemMessageOnField
	bl sub_810BC98
	bl sub_810BD08
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_0810C658: .4byte gUnknown_02039248
_0810C65C: .4byte gStringVar4
_0810C660: .4byte gContestStatsText_WasThrownAway
_0810C664: .4byte sub_810C704
	thumb_func_end sub_810C610

	thumb_func_start sub_810C668
sub_810C668: @ 810C668
	push {r4,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	movs r0, 0
	bl sub_80F98DC
	movs r0, 0x1
	bl sub_80F98DC
	ldr r2, _0810C6CC @ =gUnknown_02039248
	ldrb r0, [r2, 0x2]
	ldrb r1, [r2, 0x3]
	cmp r0, r1
	bls _0810C698
	ldrb r0, [r2, 0x1]
	ldrb r1, [r2, 0x3]
	adds r0, r1
	ldrb r2, [r2, 0x2]
	cmp r0, r2
	beq _0810C698
	movs r0, 0x1
	movs r1, 0
	bl sub_80F979C
_0810C698:
	ldr r0, _0810C6D0 @ =gWindowConfig_81E6E50
	bl BasicInitMenuWindow
	movs r0, 0x7
	movs r1, 0x6
	movs r2, 0xD
	movs r3, 0xB
	bl MenuZeroFillWindowRect
	movs r0, 0
	movs r1, 0xE
	movs r2, 0x1D
	movs r3, 0x13
	bl MenuZeroFillWindowRect
	ldr r1, _0810C6D4 @ =gTasks
	lsls r0, r4, 2
	adds r0, r4
	lsls r0, 3
	adds r0, r1
	ldr r1, _0810C6D8 @ =sub_810BF7C
	str r1, [r0]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0810C6CC: .4byte gUnknown_02039248
_0810C6D0: .4byte gWindowConfig_81E6E50
_0810C6D4: .4byte gTasks
_0810C6D8: .4byte sub_810BF7C
	thumb_func_end sub_810C668

	thumb_func_start sub_810C6DC
sub_810C6DC: @ 810C6DC
	push {lr}
	lsls r0, 24
	lsrs r2, r0, 24
	ldr r0, _0810C700 @ =gMain
	ldrh r1, [r0, 0x2E]
	movs r0, 0x1
	ands r0, r1
	cmp r0, 0
	bne _0810C6F6
	movs r0, 0x2
	ands r0, r1
	cmp r0, 0
	beq _0810C6FC
_0810C6F6:
	adds r0, r2, 0
	bl sub_810C668
_0810C6FC:
	pop {r0}
	bx r0
	.align 2, 0
_0810C700: .4byte gMain
	thumb_func_end sub_810C6DC

	thumb_func_start sub_810C704
sub_810C704: @ 810C704
	push {r4,lr}
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	ldr r0, _0810C738 @ =gWindowConfig_81E6E34
	bl BasicInitMenuWindow
	ldr r0, _0810C73C @ =gUnknown_02039248
	ldrb r0, [r0, 0x1]
	bl sub_810BC84
	movs r0, 0x1
	movs r1, 0x1
	bl sub_80F979C
	ldr r1, _0810C740 @ =gTasks
	lsls r0, r4, 2
	adds r0, r4
	lsls r0, 3
	adds r0, r1
	ldr r1, _0810C744 @ =sub_810C6DC
	str r1, [r0]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0810C738: .4byte gWindowConfig_81E6E34
_0810C73C: .4byte gUnknown_02039248
_0810C740: .4byte gTasks
_0810C744: .4byte sub_810C6DC
	thumb_func_end sub_810C704

	thumb_func_start sub_810C748
sub_810C748: @ 810C748
	push {r4,lr}
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	movs r0, 0
	bl sub_80F98DC
	movs r0, 0x1
	bl sub_80F98DC
	bl sub_8072DEC
	movs r0, 0x7
	movs r1, 0x4
	movs r2, 0xD
	movs r3, 0xB
	bl MenuZeroFillWindowRect
	ldr r1, _0810C780 @ =gTasks
	lsls r0, r4, 2
	adds r0, r4
	lsls r0, 3
	adds r0, r1
	ldr r1, _0810C784 @ =sub_810BF7C
	str r1, [r0]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0810C780: .4byte gTasks
_0810C784: .4byte sub_810BF7C
	thumb_func_end sub_810C748

	thumb_func_start sub_810C788
sub_810C788: @ 810C788
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	sub sp, 0x4
	lsls r0, 24
	lsrs r0, 24
	mov r8, r0
	ldr r0, _0810C834 @ =gEnemyParty
	bl GetNature
	lsls r0, 24
	lsrs r0, 24
	ldr r7, _0810C838 @ =gScriptItemId
	ldrh r1, [r7]
	lsls r1, 3
	ldr r5, _0810C83C @ =gSaveBlock1 + 0x7F8
	adds r1, r5
	bl sub_810CAE4
	adds r4, r0, 0
	lsls r4, 16
	lsrs r4, 16
	ldr r0, _0810C840 @ =gUnknown_030041C0
	ldr r2, _0810C844 @ =gPokeblockNames
	ldr r1, _0810C848 @ =0xfffff808
	adds r5, r1
	ldrh r1, [r7]
	lsls r1, 3
	adds r1, r5
	movs r6, 0xFF
	lsls r6, 3
	adds r1, r6
	ldrb r1, [r1]
	lsls r1, 2
	adds r1, r2
	ldr r1, [r1]
	bl StringCopy
	ldrb r0, [r7]
	bl sub_810CA6C
	ldrh r0, [r7]
	lsls r0, 3
	adds r0, r5
	adds r0, r6
	ldrb r0, [r0]
	lsls r0, 8
	strh r0, [r7]
	lsls r4, 16
	asrs r4, 16
	cmp r4, 0
	bne _0810C7F4
	adds r0, 0x1
	strh r0, [r7]
_0810C7F4:
	cmp r4, 0
	ble _0810C7FE
	ldrh r0, [r7]
	adds r0, 0x2
	strh r0, [r7]
_0810C7FE:
	cmp r4, 0
	bge _0810C808
	ldrh r0, [r7]
	adds r0, 0x3
	strh r0, [r7]
_0810C808:
	movs r0, 0x1
	negs r0, r0
	movs r1, 0
	str r1, [sp]
	movs r2, 0
	movs r3, 0x10
	bl BeginNormalPaletteFade
	ldr r1, _0810C84C @ =gTasks
	mov r2, r8
	lsls r0, r2, 2
	add r0, r8
	lsls r0, 3
	adds r0, r1
	ldr r1, _0810C850 @ =sub_810C2C8
	str r1, [r0]
	add sp, 0x4
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_0810C834: .4byte gEnemyParty
_0810C838: .4byte gScriptItemId
_0810C83C: .4byte gSaveBlock1 + 0x7F8
_0810C840: .4byte gUnknown_030041C0
_0810C844: .4byte gPokeblockNames
_0810C848: .4byte 0xfffff808
_0810C84C: .4byte gTasks
_0810C850: .4byte sub_810C2C8
	thumb_func_end sub_810C788

	thumb_func_start sub_810C854
sub_810C854: @ 810C854
	push {r4,r5,lr}
	sub sp, 0x4
	adds r5, r0, 0
	lsls r5, 24
	lsrs r5, 24
	ldr r4, _0810C8B8 @ =gScriptItemId
	ldrb r0, [r4]
	bl SafariZoneActivatePokeblockFeeder
	ldr r0, _0810C8BC @ =gStringVar1
	ldr r3, _0810C8C0 @ =gPokeblockNames
	ldr r2, _0810C8C4 @ =gSaveBlock1
	ldrh r1, [r4]
	lsls r1, 3
	adds r1, r2
	movs r2, 0xFF
	lsls r2, 3
	adds r1, r2
	ldrb r1, [r1]
	lsls r1, 2
	adds r1, r3
	ldr r1, [r1]
	bl StringCopy
	ldr r1, _0810C8C8 @ =gScriptResult
	ldrh r0, [r4]
	strh r0, [r1]
	lsls r0, 24
	lsrs r0, 24
	bl sub_810CA6C
	movs r0, 0x1
	negs r0, r0
	movs r1, 0
	str r1, [sp]
	movs r2, 0
	movs r3, 0x10
	bl BeginNormalPaletteFade
	ldr r1, _0810C8CC @ =gTasks
	lsls r0, r5, 2
	adds r0, r5
	lsls r0, 3
	adds r0, r1
	ldr r1, _0810C8D0 @ =sub_810C2C8
	str r1, [r0]
	add sp, 0x4
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_0810C8B8: .4byte gScriptItemId
_0810C8BC: .4byte gStringVar1
_0810C8C0: .4byte gPokeblockNames
_0810C8C4: .4byte gSaveBlock1
_0810C8C8: .4byte gScriptResult
_0810C8CC: .4byte gTasks
_0810C8D0: .4byte sub_810C2C8
	thumb_func_end sub_810C854

	thumb_func_start sub_810C8D4
sub_810C8D4: @ 810C8D4
	push {r4,r5,lr}
	adds r4, r0, 0
	movs r1, 0x2E
	ldrsh r0, [r4, r1]
	cmp r0, 0x1
	ble _0810C8E4
	movs r0, 0
	strh r0, [r4, 0x2E]
_0810C8E4:
	movs r0, 0x2E
	ldrsh r5, [r4, r0]
	cmp r5, 0
	beq _0810C8F2
	cmp r5, 0x1
	beq _0810C918
	b _0810C944
_0810C8F2:
	ldrb r1, [r4, 0x1]
	movs r0, 0x4
	negs r0, r0
	ands r0, r1
	movs r1, 0x1
	orrs r0, r1
	strb r0, [r4, 0x1]
	ldr r0, _0810C914 @ =gSpriteAffineAnimTable_83F7F70
	str r0, [r4, 0x10]
	adds r0, r4, 0
	bl InitSpriteAffineAnim
	movs r0, 0x1
	strh r0, [r4, 0x2E]
	strh r5, [r4, 0x30]
	b _0810C944
	.align 2, 0
_0810C914: .4byte gSpriteAffineAnimTable_83F7F70
_0810C918:
	ldrh r0, [r4, 0x30]
	adds r0, 0x1
	movs r2, 0
	strh r0, [r4, 0x30]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0xB
	ble _0810C944
	ldrb r1, [r4, 0x1]
	movs r0, 0x4
	negs r0, r0
	ands r0, r1
	strb r0, [r4, 0x1]
	strh r2, [r4, 0x2E]
	strh r2, [r4, 0x30]
	ldrb r0, [r4, 0x3]
	lsls r0, 26
	lsrs r0, 27
	bl FreeOamMatrix
	ldr r0, _0810C94C @ =SpriteCallbackDummy
	str r0, [r4, 0x1C]
_0810C944:
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_0810C94C: .4byte SpriteCallbackDummy
	thumb_func_end sub_810C8D4

	thumb_func_start ClearPokeblock
ClearPokeblock: @ 810C950
	lsls r0, 24
	ldr r1, _0810C988 @ =gSaveBlock1
	lsrs r0, 21
	adds r0, r1
	movs r2, 0xFF
	lsls r2, 3
	adds r1, r0, r2
	movs r2, 0
	strb r2, [r1]
	ldr r3, _0810C98C @ =0x000007f9
	adds r1, r0, r3
	strb r2, [r1]
	adds r3, 0x1
	adds r1, r0, r3
	strb r2, [r1]
	adds r3, 0x1
	adds r1, r0, r3
	strb r2, [r1]
	adds r3, 0x1
	adds r1, r0, r3
	strb r2, [r1]
	adds r3, 0x1
	adds r1, r0, r3
	strb r2, [r1]
	ldr r1, _0810C990 @ =0x000007fe
	adds r0, r1
	strb r2, [r0]
	bx lr
	.align 2, 0
_0810C988: .4byte gSaveBlock1
_0810C98C: .4byte 0x000007f9
_0810C990: .4byte 0x000007fe
	thumb_func_end ClearPokeblock

	thumb_func_start ClearPokeblocks
ClearPokeblocks: @ 810C994
	push {r4,lr}
	movs r4, 0
_0810C998:
	adds r0, r4, 0
	bl ClearPokeblock
	adds r0, r4, 0x1
	lsls r0, 24
	lsrs r4, r0, 24
	cmp r4, 0x27
	bls _0810C998
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end ClearPokeblocks

	thumb_func_start sub_810C9B0
sub_810C9B0: @ 810C9B0
	push {r4-r6,lr}
	adds r6, r0, 0
	movs r1, 0x1
	bl sub_810CA9C
	lsls r0, 24
	lsrs r5, r0, 24
	movs r1, 0x1
_0810C9C0:
	adds r0, r1, 0x1
	lsls r0, 24
	lsrs r4, r0, 24
	adds r0, r6, 0
	adds r1, r4, 0
	bl sub_810CA9C
	lsls r0, 24
	lsrs r0, 24
	cmp r5, r0
	bcs _0810C9D8
	adds r5, r0, 0
_0810C9D8:
	adds r1, r4, 0
	cmp r1, 0x4
	bls _0810C9C0
	adds r0, r5, 0
	pop {r4-r6}
	pop {r1}
	bx r1
	thumb_func_end sub_810C9B0

	thumb_func_start sub_810C9E8
sub_810C9E8: @ 810C9E8
	push {lr}
	movs r1, 0x6
	bl sub_810CA9C
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x63
	bls _0810C9FA
	movs r0, 0x63
_0810C9FA:
	pop {r1}
	bx r1
	thumb_func_end sub_810C9E8

	thumb_func_start sub_810CA00
sub_810CA00: @ 810CA00
	push {lr}
	movs r1, 0
	ldr r3, _0810CA1C @ =gSaveBlock1
	movs r2, 0xFF
	lsls r2, 3
_0810CA0A:
	lsls r0, r1, 3
	adds r0, r3
	adds r0, r2
	ldrb r0, [r0]
	cmp r0, 0
	bne _0810CA20
	lsls r0, r1, 24
	asrs r0, 24
	b _0810CA2E
	.align 2, 0
_0810CA1C: .4byte gSaveBlock1
_0810CA20:
	adds r0, r1, 0x1
	lsls r0, 24
	lsrs r1, r0, 24
	cmp r1, 0x27
	bls _0810CA0A
	movs r0, 0x1
	negs r0, r0
_0810CA2E:
	pop {r1}
	bx r1
	thumb_func_end sub_810CA00

	thumb_func_start sub_810CA34
sub_810CA34: @ 810CA34
	push {r4,lr}
	adds r4, r0, 0
	bl sub_810CA00
	lsls r0, 24
	asrs r2, r0, 24
	movs r0, 0x1
	negs r0, r0
	cmp r2, r0
	beq _0810CA64
	ldr r0, _0810CA60 @ =gSaveBlock1
	lsls r2, 3
	movs r1, 0xFF
	lsls r1, 3
	adds r0, r1
	adds r2, r0
	ldr r0, [r4]
	ldr r1, [r4, 0x4]
	str r0, [r2]
	str r1, [r2, 0x4]
	movs r0, 0x1
	b _0810CA66
	.align 2, 0
_0810CA60: .4byte gSaveBlock1
_0810CA64:
	movs r0, 0
_0810CA66:
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end sub_810CA34

	thumb_func_start sub_810CA6C
sub_810CA6C: @ 810CA6C
	push {lr}
	lsls r0, 24
	lsrs r2, r0, 24
	ldr r1, _0810CA90 @ =gSaveBlock1
	lsls r0, r2, 3
	adds r0, r1
	movs r1, 0xFF
	lsls r1, 3
	adds r0, r1
	ldrb r0, [r0]
	cmp r0, 0
	beq _0810CA94
	adds r0, r2, 0
	bl ClearPokeblock
	movs r0, 0x1
	b _0810CA96
	.align 2, 0
_0810CA90: .4byte gSaveBlock1
_0810CA94:
	movs r0, 0
_0810CA96:
	pop {r1}
	bx r1
	thumb_func_end sub_810CA6C

	thumb_func_start sub_810CA9C
sub_810CA9C: @ 810CA9C
	push {lr}
	lsls r1, 24
	lsrs r1, 24
	adds r2, r1, 0
	cmp r1, 0
	bne _0810CAAC
	ldrb r0, [r0]
	b _0810CADE
_0810CAAC:
	cmp r1, 0x1
	bne _0810CAB4
	ldrb r0, [r0, 0x1]
	b _0810CADE
_0810CAB4:
	cmp r1, 0x2
	bne _0810CABC
	ldrb r0, [r0, 0x2]
	b _0810CADE
_0810CABC:
	cmp r1, 0x3
	bne _0810CAC4
	ldrb r0, [r0, 0x3]
	b _0810CADE
_0810CAC4:
	cmp r1, 0x4
	bne _0810CACC
	ldrb r0, [r0, 0x4]
	b _0810CADE
_0810CACC:
	cmp r1, 0x5
	bne _0810CAD4
	ldrb r0, [r0, 0x5]
	b _0810CADE
_0810CAD4:
	cmp r2, 0x6
	beq _0810CADC
	movs r0, 0
	b _0810CADE
_0810CADC:
	ldrb r0, [r0, 0x6]
_0810CADE:
	pop {r1}
	bx r1
	thumb_func_end sub_810CA9C

	thumb_func_start sub_810CAE4
sub_810CAE4: @ 810CAE4
	push {r4-r7,lr}
	mov r7, r9
	mov r6, r8
	push {r6,r7}
	mov r8, r1
	lsls r0, 24
	lsrs r0, 24
	movs r6, 0
	movs r4, 0
	ldr r1, _0810CB40 @ =gUnknown_083F7E28
	mov r9, r1
	lsls r1, r0, 2
	adds r7, r1, r0
_0810CAFE:
	adds r0, r4, 0x1
	lsls r0, 24
	lsrs r5, r0, 24
	mov r0, r8
	adds r1, r5, 0
	bl sub_810CA9C
	lsls r0, 16
	asrs r1, r0, 16
	cmp r1, 0
	ble _0810CB2A
	adds r0, r7, r4
	add r0, r9
	ldrb r0, [r0]
	lsls r0, 24
	asrs r0, 24
	muls r1, r0
	lsls r0, r6, 16
	asrs r0, 16
	adds r0, r1
	lsls r0, 16
	lsrs r6, r0, 16
_0810CB2A:
	adds r4, r5, 0
	cmp r4, 0x4
	bls _0810CAFE
	lsls r0, r6, 16
	asrs r0, 16
	pop {r3,r4}
	mov r8, r3
	mov r9, r4
	pop {r4-r7}
	pop {r1}
	bx r1
	.align 2, 0
_0810CB40: .4byte gUnknown_083F7E28
	thumb_func_end sub_810CAE4

	thumb_func_start sub_810CB44
sub_810CB44: @ 810CB44
	push {r4,lr}
	adds r4, r1, 0
	movs r1, 0
	bl sub_810CA9C
	lsls r0, 24
	ldr r1, _0810CB64 @ =gPokeblockNames
	lsrs r0, 22
	adds r0, r1
	ldr r1, [r0]
	adds r0, r4, 0
	bl StringCopy
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0810CB64: .4byte gPokeblockNames
	thumb_func_end sub_810CB44

	thumb_func_start sub_810CB68
sub_810CB68: @ 810CB68
	push {r4-r7,lr}
	adds r6, r1, 0
	lsls r0, 24
	lsrs r5, r0, 24
	movs r4, 0
	ldr r7, _0810CB98 @ =gPokeblockNames
_0810CB74:
	lsls r1, r4, 3
	ldr r0, _0810CB9C @ =gUnknown_083F7F9C
	adds r1, r0
	adds r0, r5, 0
	bl sub_810CAE4
	lsls r0, 16
	cmp r0, 0
	ble _0810CBA0
	adds r0, r4, 0x1
	lsls r0, 2
	adds r0, r7
	ldr r1, [r0]
	adds r0, r6, 0
	bl StringCopy
	movs r0, 0x1
	b _0810CBAC
	.align 2, 0
_0810CB98: .4byte gPokeblockNames
_0810CB9C: .4byte gUnknown_083F7F9C
_0810CBA0:
	adds r0, r4, 0x1
	lsls r0, 24
	lsrs r4, r0, 24
	cmp r4, 0x4
	bls _0810CB74
	movs r0, 0
_0810CBAC:
	pop {r4-r7}
	pop {r1}
	bx r1
	thumb_func_end sub_810CB68

	.align 2, 0 @ Don't pad with nop.
