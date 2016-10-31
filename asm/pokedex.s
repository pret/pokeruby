	.include "constants/gba_constants.inc"
	.include "constants/species_constants.inc"
	.include "asm/macros.inc"

	.syntax unified

	.text

	thumb_func_start sub_808F6CC
sub_808F6CC: @ 808F6CC
	push {r4-r6,lr}
	sub sp, 0x4
	lsls r0, 24
	lsrs r0, 24
	ldr r2, _0808F704 @ =gTasks
	lsls r1, r0, 2
	adds r1, r0
	lsls r1, 3
	adds r5, r1, r2
	movs r0, 0x8
	ldrsh r4, [r5, r0]
	cmp r4, 0
	beq _0808F70C
	movs r0, 0x1
	negs r0, r0
	movs r1, 0
	str r1, [sp]
	movs r2, 0
	movs r3, 0x10
	bl BeginNormalPaletteFade
	ldr r0, _0808F708 @ =sub_808F888
	str r0, [r5]
	movs r0, 0x6C
	bl PlaySE
	b _0808F874
	.align 2, 0
_0808F704: .4byte gTasks
_0808F708: .4byte sub_808F888
_0808F70C:
	ldr r1, _0808F73C @ =gMain
	ldrh r2, [r1, 0x2E]
	movs r6, 0x2
	adds r0, r6, 0
	ands r0, r2
	lsls r0, 16
	lsrs r3, r0, 16
	cmp r3, 0
	beq _0808F744
	movs r0, 0x1
	negs r0, r0
	str r4, [sp]
	movs r1, 0
	movs r2, 0
	movs r3, 0x10
	bl BeginNormalPaletteFade
	ldr r0, _0808F740 @ =sub_808F8B8
	str r0, [r5]
	movs r0, 0x3
	bl PlaySE
	b _0808F874
	.align 2, 0
_0808F73C: .4byte gMain
_0808F740: .4byte sub_808F8B8
_0808F744:
	movs r0, 0x1
	ands r0, r2
	cmp r0, 0
	beq _0808F7E8
	ldr r0, _0808F764 @ =gUnknown_0202FFB4
	ldr r0, [r0]
	ldr r1, _0808F768 @ =0x0000064d
	adds r0, r1
	ldrb r0, [r0]
	cmp r0, 0x1
	beq _0808F77C
	cmp r0, 0x1
	bgt _0808F76C
	cmp r0, 0
	beq _0808F776
	b _0808F874
	.align 2, 0
_0808F764: .4byte gUnknown_0202FFB4
_0808F768: .4byte 0x0000064d
_0808F76C:
	cmp r0, 0x2
	beq _0808F794
	cmp r0, 0x3
	beq _0808F7AC
	b _0808F874
_0808F776:
	bl sub_8090C68
	b _0808F874
_0808F77C:
	movs r0, 0x15
	negs r0, r0
	str r3, [sp]
	movs r1, 0
	movs r2, 0
	movs r3, 0x10
	bl BeginNormalPaletteFade
	ldr r0, _0808F790 @ =sub_808F8D8
	b _0808F7DA
	.align 2, 0
_0808F790: .4byte sub_808F8D8
_0808F794:
	movs r0, 0x15
	negs r0, r0
	str r3, [sp]
	movs r1, 0
	movs r2, 0
	movs r3, 0x10
	bl BeginNormalPaletteFade
	ldr r0, _0808F7A8 @ =sub_808FA64
	b _0808F7DA
	.align 2, 0
_0808F7A8: .4byte sub_808FA64
_0808F7AC:
	ldr r0, _0808F7C4 @ =gUnknown_0202FFBC
	ldr r0, [r0]
	ldrb r1, [r0, 0x2]
	adds r0, r6, 0
	ands r0, r1
	cmp r0, 0
	bne _0808F7C8
	movs r0, 0x20
	bl PlaySE
	b _0808F874
	.align 2, 0
_0808F7C4: .4byte gUnknown_0202FFBC
_0808F7C8:
	movs r0, 0x15
	negs r0, r0
	str r3, [sp]
	movs r1, 0
	movs r2, 0
	movs r3, 0x10
	bl BeginNormalPaletteFade
	ldr r0, _0808F7E4 @ =sub_8090070
_0808F7DA:
	str r0, [r5]
	movs r0, 0x15
	bl PlaySE
	b _0808F874
	.align 2, 0
_0808F7E4: .4byte sub_8090070
_0808F7E8:
	movs r0, 0x20
	ands r0, r2
	cmp r0, 0
	bne _0808F802
	movs r0, 0x80
	lsls r0, 2
	ands r0, r2
	cmp r0, 0
	beq _0808F834
	ldr r0, _0808F828 @ =gSaveBlock2
	ldrb r0, [r0, 0x13]
	cmp r0, 0x1
	bne _0808F834
_0808F802:
	ldr r3, _0808F82C @ =gUnknown_0202FFB4
	ldr r0, [r3]
	ldr r4, _0808F830 @ =0x0000064d
	adds r2, r0, r4
	ldrb r0, [r2]
	cmp r0, 0
	beq _0808F834
	subs r0, 0x1
	strb r0, [r2]
	ldr r0, [r3]
	adds r0, r4
	ldrb r0, [r0]
	movs r1, 0xD
	bl sub_8090584
	movs r0, 0x6D
	bl PlaySE
	b _0808F874
	.align 2, 0
_0808F828: .4byte gSaveBlock2
_0808F82C: .4byte gUnknown_0202FFB4
_0808F830: .4byte 0x0000064d
_0808F834:
	ldrh r1, [r1, 0x2E]
	movs r0, 0x10
	ands r0, r1
	cmp r0, 0
	bne _0808F850
	movs r0, 0x80
	lsls r0, 1
	ands r0, r1
	cmp r0, 0
	beq _0808F874
	ldr r0, _0808F87C @ =gSaveBlock2
	ldrb r0, [r0, 0x13]
	cmp r0, 0x1
	bne _0808F874
_0808F850:
	ldr r2, _0808F880 @ =gUnknown_0202FFB4
	ldr r0, [r2]
	ldr r3, _0808F884 @ =0x0000064d
	adds r1, r0, r3
	ldrb r0, [r1]
	cmp r0, 0x2
	bhi _0808F874
	adds r0, 0x1
	strb r0, [r1]
	ldr r0, [r2]
	adds r0, r3
	ldrb r0, [r0]
	movs r1, 0xD
	bl sub_8090584
	movs r0, 0x6D
	bl PlaySE
_0808F874:
	add sp, 0x4
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_0808F87C: .4byte gSaveBlock2
_0808F880: .4byte gUnknown_0202FFB4
_0808F884: .4byte 0x0000064d
	thumb_func_end sub_808F6CC

	thumb_func_start sub_808F888
sub_808F888: @ 808F888
	push {lr}
	lsls r0, 24
	lsrs r2, r0, 24
	ldr r0, _0808F8AC @ =gPaletteFade
	ldrb r1, [r0, 0x7]
	movs r0, 0x80
	ands r0, r1
	cmp r0, 0
	bne _0808F8A8
	ldr r0, _0808F8B0 @ =gTasks
	lsls r1, r2, 2
	adds r1, r2
	lsls r1, 3
	adds r1, r0
	ldr r0, _0808F8B4 @ =sub_808F2B0
	str r0, [r1]
_0808F8A8:
	pop {r0}
	bx r0
	.align 2, 0
_0808F8AC: .4byte gPaletteFade
_0808F8B0: .4byte gTasks
_0808F8B4: .4byte sub_808F2B0
	thumb_func_end sub_808F888

	thumb_func_start sub_808F8B8
sub_808F8B8: @ 808F8B8
	push {lr}
	lsls r0, 24
	lsrs r2, r0, 24
	ldr r0, _0808F8D4 @ =gPaletteFade
	ldrb r1, [r0, 0x7]
	movs r0, 0x80
	ands r0, r1
	cmp r0, 0
	bne _0808F8D0
	adds r0, r2, 0
	bl DestroyTask
_0808F8D0:
	pop {r0}
	bx r0
	.align 2, 0
_0808F8D4: .4byte gPaletteFade
	thumb_func_end sub_808F8B8

	thumb_func_start sub_808F8D8
sub_808F8D8: @ 808F8D8
	push {r4-r7,lr}
	lsls r0, 24
	lsrs r7, r0, 24
	ldr r2, _0808F92C @ =gMain
	ldr r0, _0808F930 @ =0x0000043c
	adds r6, r2, r0
	ldrb r0, [r6]
	cmp r0, 0x1
	beq _0808F948
	cmp r0, 0x1
	ble _0808F8F2
	cmp r0, 0x2
	beq _0808F970
_0808F8F2:
	ldr r0, _0808F934 @ =gPaletteFade
	ldrb r1, [r0, 0x7]
	movs r0, 0x80
	ands r0, r1
	cmp r0, 0
	bne _0808F9AA
	ldr r4, _0808F938 @ =gUnknown_0202FFB4
	ldr r0, [r4]
	ldr r1, _0808F93C @ =0x0000064a
	adds r0, r1
	movs r1, 0x5
	strb r1, [r0]
	ldr r1, _0808F940 @ =gUnknown_03005CEC
	ldr r0, [r2, 0xC]
	str r0, [r1]
	movs r0, 0
	bl SetVBlankCallback
	movs r0, 0x80
	lsls r0, 2
	bl sub_8091060
	ldr r0, [r4]
	ldr r2, _0808F944 @ =0x0000064d
	adds r0, r2
	movs r1, 0x1
	strb r1, [r0]
	strb r1, [r6]
	b _0808F9AA
	.align 2, 0
_0808F92C: .4byte gMain
_0808F930: .4byte 0x0000043c
_0808F934: .4byte gPaletteFade
_0808F938: .4byte gUnknown_0202FFB4
_0808F93C: .4byte 0x0000064a
_0808F940: .4byte gUnknown_03005CEC
_0808F944: .4byte 0x0000064d
_0808F948:
	movs r0, 0xD
	bl sub_8090540
	movs r0, 0x1
	movs r1, 0xD
	bl sub_8090644
	bl sub_808D640
	ldr r1, _0808F96C @ =REG_BG1CNT
	movs r2, 0xD0
	lsls r2, 4
	adds r0, r2, 0
	strh r0, [r1]
	ldrb r0, [r6]
	adds r0, 0x1
	strb r0, [r6]
	b _0808F9AA
	.align 2, 0
_0808F96C: .4byte REG_BG1CNT
_0808F970:
	ldr r0, _0808F9B0 @ =gUnknown_0202FFBC
	ldr r0, [r0]
	ldrh r0, [r0]
	bl NationalPokedexNumToSpecies
	lsls r0, 16
	lsrs r0, 16
	ldr r5, _0808F9B4 @ =gUnknown_0202FFB4
	ldr r1, [r5]
	ldr r4, _0808F9B8 @ =0x0000064f
	adds r1, r4
	bl ShowPokedexAreaScreen
	ldr r0, _0808F9BC @ =gUnknown_03005CEC
	ldr r0, [r0]
	bl SetVBlankCallback
	ldr r0, [r5]
	adds r0, r4
	movs r1, 0
	strb r1, [r0]
	strb r1, [r6]
	ldr r1, _0808F9C0 @ =gTasks
	lsls r0, r7, 2
	adds r0, r7
	lsls r0, 3
	adds r0, r1
	ldr r1, _0808F9C4 @ =sub_808F9C8
	str r1, [r0]
_0808F9AA:
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_0808F9B0: .4byte gUnknown_0202FFBC
_0808F9B4: .4byte gUnknown_0202FFB4
_0808F9B8: .4byte 0x0000064f
_0808F9BC: .4byte gUnknown_03005CEC
_0808F9C0: .4byte gTasks
_0808F9C4: .4byte sub_808F9C8
	thumb_func_end sub_808F8D8

	thumb_func_start sub_808F9C8
sub_808F9C8: @ 808F9C8
	push {lr}
	lsls r0, 24
	lsrs r2, r0, 24
	ldr r0, _0808F9F0 @ =gUnknown_0202FFB4
	ldr r0, [r0]
	ldr r1, _0808F9F4 @ =0x0000064f
	adds r0, r1
	ldrb r0, [r0]
	cmp r0, 0
	beq _0808F9EA
	ldr r0, _0808F9F8 @ =gTasks
	lsls r1, r2, 2
	adds r1, r2
	lsls r1, 3
	adds r1, r0
	ldr r0, _0808F9FC @ =sub_808FA00
	str r0, [r1]
_0808F9EA:
	pop {r0}
	bx r0
	.align 2, 0
_0808F9F0: .4byte gUnknown_0202FFB4
_0808F9F4: .4byte 0x0000064f
_0808F9F8: .4byte gTasks
_0808F9FC: .4byte sub_808FA00
	thumb_func_end sub_808F9C8

	thumb_func_start sub_808FA00
sub_808FA00: @ 808FA00
	push {lr}
	lsls r0, 24
	lsrs r2, r0, 24
	ldr r0, _0808FA34 @ =gPaletteFade
	ldrb r1, [r0, 0x7]
	movs r0, 0x80
	ands r0, r1
	cmp r0, 0
	bne _0808FA56
	ldr r0, _0808FA38 @ =gUnknown_0202FFB4
	ldr r0, [r0]
	ldr r1, _0808FA3C @ =0x0000064f
	adds r0, r1
	ldrb r0, [r0]
	cmp r0, 0x1
	beq _0808FA24
	cmp r0, 0x2
	beq _0808FA48
_0808FA24:
	ldr r0, _0808FA40 @ =gTasks
	lsls r1, r2, 2
	adds r1, r2
	lsls r1, 3
	adds r1, r0
	ldr r0, _0808FA44 @ =sub_808F2B0
	b _0808FA54
	.align 2, 0
_0808FA34: .4byte gPaletteFade
_0808FA38: .4byte gUnknown_0202FFB4
_0808FA3C: .4byte 0x0000064f
_0808FA40: .4byte gTasks
_0808FA44: .4byte sub_808F2B0
_0808FA48:
	ldr r0, _0808FA5C @ =gTasks
	lsls r1, r2, 2
	adds r1, r2
	lsls r1, 3
	adds r1, r0
	ldr r0, _0808FA60 @ =sub_808FA64
_0808FA54:
	str r0, [r1]
_0808FA56:
	pop {r0}
	bx r0
	.align 2, 0
_0808FA5C: .4byte gTasks
_0808FA60: .4byte sub_808FA64
	thumb_func_end sub_808FA00

	thumb_func_start sub_808FA64
sub_808FA64: @ 808FA64
	push {r4,r5,lr}
	sub sp, 0x18
	lsls r0, 24
	lsrs r4, r0, 24
	ldr r1, _0808FA84 @ =gMain
	ldr r2, _0808FA88 @ =0x0000043c
	adds r0, r1, r2
	ldrb r0, [r0]
	adds r2, r1, 0
	cmp r0, 0xA
	bhi _0808FABC
	lsls r0, 2
	ldr r1, _0808FA8C @ =_0808FA90
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_0808FA84: .4byte gMain
_0808FA88: .4byte 0x0000043c
_0808FA8C: .4byte _0808FA90
	.align 2, 0
_0808FA90:
	.4byte _0808FABC
	.4byte _0808FB28
	.4byte _0808FB58
	.4byte _0808FB9C
	.4byte _0808FBC4
	.4byte _0808FBF8
	.4byte _0808FC54
	.4byte _0808FCD4
	.4byte _0808FD40
	.4byte _0808FD6C
	.4byte _0808FDBC
_0808FABC:
	ldr r0, _0808FB08 @ =gPaletteFade
	ldrb r1, [r0, 0x7]
	movs r0, 0x80
	ands r0, r1
	cmp r0, 0
	beq _0808FACA
	b _0808FDDC
_0808FACA:
	ldr r0, _0808FB0C @ =gMPlay_BGM
	bl m4aMPlayStop
	ldr r5, _0808FB10 @ =gUnknown_0202FFB4
	ldr r0, [r5]
	ldr r3, _0808FB14 @ =0x0000064a
	adds r0, r3
	movs r1, 0x6
	strb r1, [r0]
	ldr r1, _0808FB18 @ =gUnknown_03005CEC
	ldr r4, _0808FB1C @ =gMain
	ldr r0, [r4, 0xC]
	str r0, [r1]
	movs r0, 0
	bl SetVBlankCallback
	movs r0, 0x80
	lsls r0, 2
	bl sub_8091060
	ldr r0, [r5]
	ldr r1, _0808FB20 @ =0x0000064d
	adds r0, r1
	movs r1, 0x2
	strb r1, [r0]
	ldr r2, _0808FB24 @ =0x0000043c
	adds r4, r2
	movs r0, 0x1
	strb r0, [r4]
	b _0808FDDC
	.align 2, 0
_0808FB08: .4byte gPaletteFade
_0808FB0C: .4byte gMPlay_BGM
_0808FB10: .4byte gUnknown_0202FFB4
_0808FB14: .4byte 0x0000064a
_0808FB18: .4byte gUnknown_03005CEC
_0808FB1C: .4byte gMain
_0808FB20: .4byte 0x0000064d
_0808FB24: .4byte 0x0000043c
_0808FB28:
	ldr r0, _0808FB44 @ =gPokedexMenu_Gfx
	movs r1, 0xC0
	lsls r1, 19
	bl LZ77UnCompVram
	ldr r0, _0808FB48 @ =gUnknown_0839F8A0
	ldr r1, _0808FB4C @ =0x06007000
	bl LZ77UnCompVram
	ldr r1, _0808FB50 @ =gMain
	ldr r3, _0808FB54 @ =0x0000043c
	adds r1, r3
	b _0808FDA0
	.align 2, 0
_0808FB44: .4byte gPokedexMenu_Gfx
_0808FB48: .4byte gUnknown_0839F8A0
_0808FB4C: .4byte 0x06007000
_0808FB50: .4byte gMain
_0808FB54: .4byte 0x0000043c
_0808FB58:
	movs r0, 0xD
	bl sub_8090540
	movs r0, 0x2
	movs r1, 0xD
	bl sub_8090644
	bl sub_808D640
	ldr r2, _0808FB88 @ =0x0600f800
	add r1, sp, 0x4
	movs r0, 0
	strh r0, [r1]
	ldr r0, _0808FB8C @ =0x040000d4
	str r1, [r0]
	str r2, [r0, 0x4]
	ldr r1, _0808FB90 @ =0x81000280
	str r1, [r0, 0x8]
	ldr r0, [r0, 0x8]
	ldr r1, _0808FB94 @ =gMain
	ldr r4, _0808FB98 @ =0x0000043c
	adds r1, r4
	b _0808FDA0
	.align 2, 0
_0808FB88: .4byte 0x0600f800
_0808FB8C: .4byte 0x040000d4
_0808FB90: .4byte 0x81000280
_0808FB94: .4byte gMain
_0808FB98: .4byte 0x0000043c
_0808FB9C:
	ldr r4, _0808FBB8 @ =gWindowConfig_81E702C
	adds r0, r4, 0
	bl SetUpWindowConfig
	adds r0, r4, 0
	bl InitMenuWindow
	bl ResetPaletteFade
	ldr r1, _0808FBBC @ =gMain
	ldr r0, _0808FBC0 @ =0x0000043c
	adds r1, r0
	b _0808FDA0
	.align 2, 0
_0808FBB8: .4byte gWindowConfig_81E702C
_0808FBBC: .4byte gMain
_0808FBC0: .4byte 0x0000043c
_0808FBC4:
	ldr r0, _0808FBE8 @ =gDexText_CryOf
	movs r1, 0xA
	movs r2, 0x4
	bl MenuPrint
	ldr r0, _0808FBEC @ =gUnknown_0202FFBC
	ldr r0, [r0]
	ldrh r0, [r0]
	movs r1, 0xA
	movs r2, 0x6
	movs r3, 0x2
	bl sub_8091260
	ldr r1, _0808FBF0 @ =gMain
	ldr r2, _0808FBF4 @ =0x0000043c
	adds r1, r2
	b _0808FDA0
	.align 2, 0
_0808FBE8: .4byte gDexText_CryOf
_0808FBEC: .4byte gUnknown_0202FFBC
_0808FBF0: .4byte gMain
_0808FBF4: .4byte 0x0000043c
_0808FBF8:
	ldr r0, _0808FC3C @ =gUnknown_0202FFBC
	ldr r0, [r0]
	ldrh r0, [r0]
	movs r1, 0x30
	movs r2, 0x38
	movs r3, 0
	bl sub_80918EC
	ldr r2, _0808FC40 @ =gTasks
	lsls r1, r4, 2
	adds r1, r4
	lsls r1, 3
	adds r1, r2
	movs r3, 0
	strh r0, [r1, 0x10]
	ldr r2, _0808FC44 @ =gSprites
	movs r4, 0x10
	ldrsh r0, [r1, r4]
	lsls r1, r0, 4
	adds r1, r0
	lsls r1, 2
	adds r1, r2
	ldrb r2, [r1, 0x5]
	movs r0, 0xD
	negs r0, r0
	ands r0, r2
	strb r0, [r1, 0x5]
	ldr r0, _0808FC48 @ =gUnknown_03005E98
	strb r3, [r0]
	ldr r1, _0808FC4C @ =gMain
	ldr r0, _0808FC50 @ =0x0000043c
	adds r1, r0
	b _0808FDA0
	.align 2, 0
_0808FC3C: .4byte gUnknown_0202FFBC
_0808FC40: .4byte gTasks
_0808FC44: .4byte gSprites
_0808FC48: .4byte gUnknown_03005E98
_0808FC4C: .4byte gMain
_0808FC50: .4byte 0x0000043c
_0808FC54:
	ldr r1, _0808FCB0 @ =0xffff0000
	ldr r0, [sp, 0x8]
	ands r0, r1
	ldr r1, _0808FCB4 @ =0x00004020
	orrs r0, r1
	ldr r1, _0808FCB8 @ =0xff00ffff
	ands r0, r1
	movs r1, 0xF8
	lsls r1, 13
	orrs r0, r1
	ldr r1, _0808FCBC @ =0x00ffffff
	ands r0, r1
	movs r1, 0x80
	lsls r1, 20
	orrs r0, r1
	str r0, [sp, 0x8]
	ldr r2, _0808FCC0 @ =0xffff00ff
	add r0, sp, 0x8
	ldr r1, [r0, 0x4]
	ands r1, r2
	movs r2, 0xF0
	lsls r2, 5
	orrs r1, r2
	ldr r2, _0808FCC4 @ =0xffffff00
	ands r1, r2
	movs r2, 0xC
	orrs r1, r2
	str r1, [r0, 0x4]
	movs r1, 0
	bl sub_8119E3C
	lsls r0, 24
	cmp r0, 0
	bne _0808FC9A
	b _0808FDDC
_0808FC9A:
	ldr r1, _0808FCC8 @ =gMain
	ldr r2, _0808FCCC @ =0x0000043c
	adds r1, r2
	ldrb r0, [r1]
	adds r0, 0x1
	movs r2, 0
	strb r0, [r1]
	ldr r0, _0808FCD0 @ =gUnknown_03005E98
	strb r2, [r0]
	b _0808FDDC
	.align 2, 0
_0808FCB0: .4byte 0xffff0000
_0808FCB4: .4byte 0x00004020
_0808FCB8: .4byte 0xff00ffff
_0808FCBC: .4byte 0x00ffffff
_0808FCC0: .4byte 0xffff00ff
_0808FCC4: .4byte 0xffffff00
_0808FCC8: .4byte gMain
_0808FCCC: .4byte 0x0000043c
_0808FCD0: .4byte gUnknown_03005E98
_0808FCD4:
	ldr r1, _0808FD24 @ =0xffff0000
	ldr r0, [sp, 0x10]
	ands r0, r1
	movs r1, 0xC0
	lsls r1, 6
	orrs r0, r1
	ldr r1, _0808FD28 @ =0xff00ffff
	ands r0, r1
	movs r1, 0xE0
	lsls r1, 12
	orrs r0, r1
	ldr r1, _0808FD2C @ =0x00ffffff
	ands r0, r1
	movs r1, 0x90
	lsls r1, 20
	orrs r0, r1
	str r0, [sp, 0x10]
	ldr r2, _0808FD30 @ =0xffffff00
	add r0, sp, 0x10
	ldr r1, [r0, 0x4]
	ands r1, r2
	movs r2, 0x12
	orrs r1, r2
	ldr r2, _0808FD34 @ =0xffff00ff
	ands r1, r2
	movs r2, 0xC0
	lsls r2, 2
	orrs r1, r2
	str r1, [r0, 0x4]
	movs r1, 0x1
	bl ShowPokedexCryScreen
	lsls r0, 24
	cmp r0, 0
	beq _0808FDDC
	ldr r1, _0808FD38 @ =gMain
	ldr r3, _0808FD3C @ =0x0000043c
	adds r1, r3
	b _0808FDA0
	.align 2, 0
_0808FD24: .4byte 0xffff0000
_0808FD28: .4byte 0xff00ffff
_0808FD2C: .4byte 0x00ffffff
_0808FD30: .4byte 0xffffff00
_0808FD34: .4byte 0xffff00ff
_0808FD38: .4byte gMain
_0808FD3C: .4byte 0x0000043c
_0808FD40:
	movs r0, 0x15
	negs r0, r0
	movs r1, 0
	str r1, [sp]
	movs r2, 0x10
	movs r3, 0
	bl BeginNormalPaletteFade
	ldr r0, _0808FD60 @ =gUnknown_03005CEC
	ldr r0, [r0]
	bl SetVBlankCallback
	ldr r1, _0808FD64 @ =gMain
	ldr r4, _0808FD68 @ =0x0000043c
	adds r1, r4
	b _0808FDA0
	.align 2, 0
_0808FD60: .4byte gUnknown_03005CEC
_0808FD64: .4byte gMain
_0808FD68: .4byte 0x0000043c
_0808FD6C:
	ldr r0, _0808FDA8 @ =REG_BLDCNT
	movs r1, 0
	strh r1, [r0]
	adds r0, 0x2
	strh r1, [r0]
	adds r0, 0x2
	strh r1, [r0]
	ldr r1, _0808FDAC @ =REG_BG2CNT
	ldr r3, _0808FDB0 @ =0x00000e02
	adds r0, r3, 0
	strh r0, [r1]
	subs r1, 0x4
	ldr r4, _0808FDB4 @ =0x00001f07
	adds r0, r4, 0
	strh r0, [r1]
	adds r1, 0x2
	movs r3, 0xD0
	lsls r3, 4
	adds r0, r3, 0
	strh r0, [r1]
	subs r1, 0xA
	adds r4, 0x39
	adds r0, r4, 0
	strh r0, [r1]
	ldr r0, _0808FDB8 @ =0x0000043c
	adds r1, r2, r0
_0808FDA0:
	ldrb r0, [r1]
	adds r0, 0x1
	strb r0, [r1]
	b _0808FDDC
	.align 2, 0
_0808FDA8: .4byte REG_BLDCNT
_0808FDAC: .4byte REG_BG2CNT
_0808FDB0: .4byte 0x00000e02
_0808FDB4: .4byte 0x00001f07
_0808FDB8: .4byte 0x0000043c
_0808FDBC:
	ldr r0, _0808FDE4 @ =gUnknown_0202FFB4
	ldr r0, [r0]
	ldr r1, _0808FDE8 @ =0x0000064f
	adds r0, r1
	movs r1, 0
	strb r1, [r0]
	ldr r3, _0808FDEC @ =0x0000043c
	adds r0, r2, r3
	strb r1, [r0]
	ldr r1, _0808FDF0 @ =gTasks
	lsls r0, r4, 2
	adds r0, r4
	lsls r0, 3
	adds r0, r1
	ldr r1, _0808FDF4 @ =sub_808FDF8
	str r1, [r0]
_0808FDDC:
	add sp, 0x18
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_0808FDE4: .4byte gUnknown_0202FFB4
_0808FDE8: .4byte 0x0000064f
_0808FDEC: .4byte 0x0000043c
_0808FDF0: .4byte gTasks
_0808FDF4: .4byte sub_808FDF8
	thumb_func_end sub_808FA64

	thumb_func_start sub_808FDF8
sub_808FDF8: @ 808FDF8
	push {r4,r5,lr}
	sub sp, 0x4
	lsls r0, 24
	lsrs r4, r0, 24
	movs r0, 0
	bl sub_8119F88
	bl IsCryPlaying
	lsls r0, 24
	cmp r0, 0
	beq _0808FE18
	movs r0, 0x1
	bl sub_8090040
	b _0808FE1E
_0808FE18:
	movs r0, 0
	bl sub_8090040
_0808FE1E:
	ldr r1, _0808FE48 @ =gMain
	ldrh r2, [r1, 0x2E]
	movs r0, 0x1
	ands r0, r2
	adds r5, r1, 0
	cmp r0, 0
	beq _0808FE50
	movs r0, 0x1
	bl sub_8090040
	ldr r0, _0808FE4C @ =gUnknown_0202FFBC
	ldr r0, [r0]
	ldrh r0, [r0]
	bl NationalPokedexNumToSpecies
	lsls r0, 16
	lsrs r0, 16
	bl sub_811A050
	b _0808FF9E
	.align 2, 0
_0808FE48: .4byte gMain
_0808FE4C: .4byte gUnknown_0202FFBC
_0808FE50:
	ldr r0, _0808FEA8 @ =gPaletteFade
	ldrb r1, [r0, 0x7]
	movs r0, 0x80
	ands r0, r1
	lsls r0, 24
	lsrs r1, r0, 24
	cmp r1, 0
	beq _0808FE62
	b _0808FF9E
_0808FE62:
	movs r0, 0x2
	ands r0, r2
	lsls r0, 16
	lsrs r3, r0, 16
	cmp r3, 0
	beq _0808FEC0
	movs r0, 0x15
	negs r0, r0
	str r1, [sp]
	movs r1, 0
	movs r2, 0
	movs r3, 0x10
	bl BeginNormalPaletteFade
	ldr r0, _0808FEAC @ =gMPlay_BGM
	bl m4aMPlayContinue
	ldr r0, _0808FEB0 @ =gUnknown_0202FFB4
	ldr r0, [r0]
	ldr r1, _0808FEB4 @ =0x0000064f
	adds r0, r1
	movs r1, 0x1
	strb r1, [r0]
	ldr r1, _0808FEB8 @ =gTasks
	lsls r0, r4, 2
	adds r0, r4
	lsls r0, 3
	adds r0, r1
	ldr r1, _0808FEBC @ =sub_808FFBC
	str r1, [r0]
	movs r0, 0x3
	bl PlaySE
	b _0808FF9E
	.align 2, 0
_0808FEA8: .4byte gPaletteFade
_0808FEAC: .4byte gMPlay_BGM
_0808FEB0: .4byte gUnknown_0202FFB4
_0808FEB4: .4byte 0x0000064f
_0808FEB8: .4byte gTasks
_0808FEBC: .4byte sub_808FFBC
_0808FEC0:
	movs r0, 0x20
	ands r0, r2
	cmp r0, 0
	bne _0808FEDA
	movs r0, 0x80
	lsls r0, 2
	ands r0, r2
	cmp r0, 0
	beq _0808FF2C
	ldr r0, _0808FF14 @ =gSaveBlock2
	ldrb r0, [r0, 0x13]
	cmp r0, 0x1
	bne _0808FF2C
_0808FEDA:
	movs r0, 0x15
	negs r0, r0
	str r3, [sp]
	movs r1, 0
	movs r2, 0
	movs r3, 0x10
	bl BeginNormalPaletteFade
	ldr r0, _0808FF18 @ =gMPlay_BGM
	bl m4aMPlayContinue
	ldr r0, _0808FF1C @ =gUnknown_0202FFB4
	ldr r0, [r0]
	ldr r1, _0808FF20 @ =0x0000064f
	adds r0, r1
	movs r1, 0x2
	strb r1, [r0]
	ldr r1, _0808FF24 @ =gTasks
	lsls r0, r4, 2
	adds r0, r4
	lsls r0, 3
	adds r0, r1
	ldr r1, _0808FF28 @ =sub_808FFBC
	str r1, [r0]
	movs r0, 0x6D
	bl PlaySE
	b _0808FF9E
	.align 2, 0
_0808FF14: .4byte gSaveBlock2
_0808FF18: .4byte gMPlay_BGM
_0808FF1C: .4byte gUnknown_0202FFB4
_0808FF20: .4byte 0x0000064f
_0808FF24: .4byte gTasks
_0808FF28: .4byte sub_808FFBC
_0808FF2C:
	ldrh r1, [r5, 0x2E]
	movs r0, 0x10
	ands r0, r1
	cmp r0, 0
	bne _0808FF48
	movs r0, 0x80
	lsls r0, 1
	ands r0, r1
	cmp r0, 0
	beq _0808FF9E
	ldr r0, _0808FF60 @ =gSaveBlock2
	ldrb r0, [r0, 0x13]
	cmp r0, 0x1
	bne _0808FF9E
_0808FF48:
	ldr r0, _0808FF64 @ =gUnknown_0202FFBC
	ldr r0, [r0]
	ldrb r1, [r0, 0x2]
	movs r0, 0x2
	ands r0, r1
	cmp r0, 0
	bne _0808FF68
	movs r0, 0x20
	bl PlaySE
	b _0808FF9E
	.align 2, 0
_0808FF60: .4byte gSaveBlock2
_0808FF64: .4byte gUnknown_0202FFBC
_0808FF68:
	movs r0, 0x15
	negs r0, r0
	movs r1, 0
	str r1, [sp]
	movs r2, 0
	movs r3, 0x10
	bl BeginNormalPaletteFade
	ldr r0, _0808FFA8 @ =gMPlay_BGM
	bl m4aMPlayContinue
	ldr r0, _0808FFAC @ =gUnknown_0202FFB4
	ldr r0, [r0]
	ldr r1, _0808FFB0 @ =0x0000064f
	adds r0, r1
	movs r1, 0x3
	strb r1, [r0]
	ldr r1, _0808FFB4 @ =gTasks
	lsls r0, r4, 2
	adds r0, r4
	lsls r0, 3
	adds r0, r1
	ldr r1, _0808FFB8 @ =sub_808FFBC
	str r1, [r0]
	movs r0, 0x6D
	bl PlaySE
_0808FF9E:
	add sp, 0x4
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_0808FFA8: .4byte gMPlay_BGM
_0808FFAC: .4byte gUnknown_0202FFB4
_0808FFB0: .4byte 0x0000064f
_0808FFB4: .4byte gTasks
_0808FFB8: .4byte sub_808FFBC
	thumb_func_end sub_808FDF8

	thumb_func_start sub_808FFBC
sub_808FFBC: @ 808FFBC
	push {r4,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	ldr r0, _0808FFF8 @ =gPaletteFade
	ldrb r1, [r0, 0x7]
	movs r0, 0x80
	ands r0, r1
	cmp r0, 0
	bne _08090032
	bl DestroyCryMeterNeedleSprite
	ldr r0, _0808FFFC @ =gUnknown_0202FFB4
	ldr r0, [r0]
	ldr r1, _08090000 @ =0x0000064f
	adds r0, r1
	ldrb r0, [r0]
	cmp r0, 0x2
	beq _0809000C
	cmp r0, 0x2
	ble _0808FFE8
	cmp r0, 0x3
	beq _08090024
_0808FFE8:
	ldr r0, _08090004 @ =gTasks
	lsls r1, r4, 2
	adds r1, r4
	lsls r1, 3
	adds r1, r0
	ldr r0, _08090008 @ =sub_808F2B0
	b _08090030
	.align 2, 0
_0808FFF8: .4byte gPaletteFade
_0808FFFC: .4byte gUnknown_0202FFB4
_08090000: .4byte 0x0000064f
_08090004: .4byte gTasks
_08090008: .4byte sub_808F2B0
_0809000C:
	ldr r0, _0809001C @ =gTasks
	lsls r1, r4, 2
	adds r1, r4
	lsls r1, 3
	adds r1, r0
	ldr r0, _08090020 @ =sub_808F8D8
	b _08090030
	.align 2, 0
_0809001C: .4byte gTasks
_08090020: .4byte sub_808F8D8
_08090024:
	ldr r0, _08090038 @ =gTasks
	lsls r1, r4, 2
	adds r1, r4
	lsls r1, 3
	adds r1, r0
	ldr r0, _0809003C @ =sub_8090070
_08090030:
	str r0, [r1]
_08090032:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08090038: .4byte gTasks
_0809003C: .4byte sub_8090070
	thumb_func_end sub_808FFBC

	thumb_func_start sub_8090040
sub_8090040: @ 8090040
	push {lr}
	sub sp, 0x4
	lsls r0, 24
	cmp r0, 0
	beq _08090054
	ldr r1, _08090050 @ =0x00000392
	b _08090056
	.align 2, 0
_08090050: .4byte 0x00000392
_08090054:
	ldr r1, _0809006C @ =0x000002af
_08090056:
	mov r0, sp
	strh r1, [r0]
	mov r0, sp
	movs r1, 0x5D
	movs r2, 0x2
	bl LoadPalette
	add sp, 0x4
	pop {r0}
	bx r0
	.align 2, 0
_0809006C: .4byte 0x000002af
	thumb_func_end sub_8090040

	thumb_func_start sub_8090070
sub_8090070: @ 8090070
	push {r4,r5,lr}
	sub sp, 0x2C
	lsls r0, 24
	lsrs r3, r0, 24
	ldr r1, _08090090 @ =gMain
	ldr r2, _08090094 @ =0x0000043c
	adds r0, r1, r2
	ldrb r0, [r0]
	adds r5, r1, 0
	cmp r0, 0x9
	bhi _080900C4
	lsls r0, 2
	ldr r1, _08090098 @ =_0809009C
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_08090090: .4byte gMain
_08090094: .4byte 0x0000043c
_08090098: .4byte _0809009C
	.align 2, 0
_0809009C:
	.4byte _080900C4
	.4byte _08090120
	.4byte _08090150
	.4byte _08090174
	.4byte _080901C0
	.4byte _080901D4
	.4byte _08090278
	.4byte _08090318
	.4byte _08090344
	.4byte _08090380
_080900C4:
	ldr r0, _08090108 @ =gPaletteFade
	ldrb r1, [r0, 0x7]
	movs r0, 0x80
	ands r0, r1
	cmp r0, 0
	beq _080900D2
	b _080903AE
_080900D2:
	ldr r4, _0809010C @ =gUnknown_0202FFB4
	ldr r0, [r4]
	ldr r1, _08090110 @ =0x0000064a
	adds r0, r1
	movs r1, 0x7
	strb r1, [r0]
	ldr r1, _08090114 @ =gUnknown_03005CEC
	ldr r0, [r5, 0xC]
	str r0, [r1]
	movs r0, 0
	bl SetVBlankCallback
	movs r0, 0x80
	lsls r0, 2
	bl sub_8091060
	ldr r0, [r4]
	ldr r2, _08090118 @ =0x0000064d
	adds r0, r2
	movs r1, 0x3
	strb r1, [r0]
	ldr r0, _0809011C @ =0x0000043c
	adds r1, r5, r0
	movs r0, 0x1
	strb r0, [r1]
	b _080903AE
	.align 2, 0
_08090108: .4byte gPaletteFade
_0809010C: .4byte gUnknown_0202FFB4
_08090110: .4byte 0x0000064a
_08090114: .4byte gUnknown_03005CEC
_08090118: .4byte 0x0000064d
_0809011C: .4byte 0x0000043c
_08090120:
	ldr r0, _0809013C @ =gPokedexMenu_Gfx
	movs r1, 0xC0
	lsls r1, 19
	bl LZ77UnCompVram
	ldr r0, _08090140 @ =gUnknown_0839F988
	ldr r1, _08090144 @ =0x06007000
	bl LZ77UnCompVram
	ldr r1, _08090148 @ =gMain
	ldr r2, _0809014C @ =0x0000043c
	adds r1, r2
	b _08090368
	.align 2, 0
_0809013C: .4byte gPokedexMenu_Gfx
_08090140: .4byte gUnknown_0839F988
_08090144: .4byte 0x06007000
_08090148: .4byte gMain
_0809014C: .4byte 0x0000043c
_08090150:
	movs r0, 0xD
	bl sub_8090540
	movs r0, 0x3
	movs r1, 0xD
	bl sub_8090644
	bl sub_808D640
	ldr r1, _0809016C @ =gMain
	ldr r0, _08090170 @ =0x0000043c
	adds r1, r0
	b _08090368
	.align 2, 0
_0809016C: .4byte gMain
_08090170: .4byte 0x0000043c
_08090174:
	ldr r4, _080901AC @ =gWindowConfig_81E702C
	adds r0, r4, 0
	bl SetUpWindowConfig
	adds r0, r4, 0
	bl InitMenuWindow
	add r1, sp, 0x4
	movs r0, 0xFF
	strb r0, [r1]
	ldr r1, _080901B0 @ =gDexText_SizeComparedTo
	add r0, sp, 0x4
	bl StringAppend
	ldr r1, _080901B4 @ =gSaveBlock2
	add r0, sp, 0x4
	bl StringAppend
	add r0, sp, 0x4
	movs r1, 0x3
	movs r2, 0xF
	movs r3, 0xC0
	bl sub_8072BD8
	ldr r1, _080901B8 @ =gMain
	ldr r2, _080901BC @ =0x0000043c
	adds r1, r2
	b _08090368
	.align 2, 0
_080901AC: .4byte gWindowConfig_81E702C
_080901B0: .4byte gDexText_SizeComparedTo
_080901B4: .4byte gSaveBlock2
_080901B8: .4byte gMain
_080901BC: .4byte 0x0000043c
_080901C0:
	bl ResetPaletteFade
	ldr r1, _080901CC @ =gMain
	ldr r0, _080901D0 @ =0x0000043c
	adds r1, r0
	b _08090368
	.align 2, 0
_080901CC: .4byte gMain
_080901D0: .4byte 0x0000043c
_080901D4:
	ldr r0, _0809025C @ =gSaveBlock2
	ldrb r0, [r0, 0x8]
	movs r1, 0x98
	movs r2, 0x38
	movs r3, 0
	bl sub_8091A4C
	lsls r0, 24
	lsrs r1, r0, 24
	ldr r0, _08090260 @ =gSprites
	lsls r4, r1, 4
	adds r4, r1
	lsls r4, 2
	adds r4, r0
	ldrb r1, [r4, 0x1]
	movs r0, 0x4
	negs r0, r0
	ands r0, r1
	movs r1, 0x1
	orrs r0, r1
	strb r0, [r4, 0x1]
	ldrb r1, [r4, 0x3]
	movs r0, 0x3F
	negs r0, r0
	ands r0, r1
	movs r1, 0x2
	orrs r0, r1
	strb r0, [r4, 0x3]
	ldrb r1, [r4, 0x5]
	movs r0, 0xD
	negs r0, r0
	ands r0, r1
	strb r0, [r4, 0x5]
	ldr r3, _08090264 @ =gPokedexEntries
	ldr r0, _08090268 @ =gUnknown_0202FFBC
	ldr r2, [r0]
	ldrh r1, [r2]
	lsls r0, r1, 3
	adds r0, r1
	lsls r0, 2
	adds r0, r3
	ldrh r0, [r0, 0x20]
	strh r0, [r4, 0x26]
	ldrh r1, [r2]
	lsls r0, r1, 3
	adds r0, r1
	lsls r0, 2
	adds r0, r3
	ldrh r1, [r0, 0x1E]
	str r1, [sp]
	movs r0, 0x1
	movs r2, 0
	movs r3, 0
	bl SetOamMatrix
	ldr r0, _0809026C @ =gUnknown_083B4EC4
	ldrb r1, [r4, 0x5]
	lsrs r1, 4
	adds r1, 0x10
	lsls r1, 4
	movs r2, 0x20
	bl LoadPalette
	ldr r1, _08090270 @ =gMain
	ldr r2, _08090274 @ =0x0000043c
	adds r1, r2
	b _08090368
	.align 2, 0
_0809025C: .4byte gSaveBlock2
_08090260: .4byte gSprites
_08090264: .4byte gPokedexEntries
_08090268: .4byte gUnknown_0202FFBC
_0809026C: .4byte gUnknown_083B4EC4
_08090270: .4byte gMain
_08090274: .4byte 0x0000043c
_08090278:
	ldr r5, _08090300 @ =gUnknown_0202FFBC
	ldr r0, [r5]
	ldrh r0, [r0]
	movs r1, 0x58
	movs r2, 0x38
	movs r3, 0x1
	bl sub_80918EC
	lsls r0, 24
	lsrs r1, r0, 24
	ldr r0, _08090304 @ =gSprites
	lsls r4, r1, 4
	adds r4, r1
	lsls r4, 2
	adds r4, r0
	ldrb r1, [r4, 0x1]
	movs r0, 0x4
	negs r0, r0
	ands r0, r1
	movs r1, 0x1
	orrs r0, r1
	strb r0, [r4, 0x1]
	ldrb r1, [r4, 0x3]
	movs r0, 0x3F
	negs r0, r0
	ands r0, r1
	movs r1, 0x4
	orrs r0, r1
	strb r0, [r4, 0x3]
	ldrb r1, [r4, 0x5]
	movs r0, 0xD
	negs r0, r0
	ands r0, r1
	strb r0, [r4, 0x5]
	ldr r3, _08090308 @ =gPokedexEntries
	ldr r2, [r5]
	ldrh r1, [r2]
	lsls r0, r1, 3
	adds r0, r1
	lsls r0, 2
	adds r0, r3
	ldrh r0, [r0, 0x1C]
	strh r0, [r4, 0x26]
	ldrh r1, [r2]
	lsls r0, r1, 3
	adds r0, r1
	lsls r0, 2
	adds r0, r3
	ldrh r1, [r0, 0x1A]
	str r1, [sp]
	movs r0, 0x2
	movs r2, 0
	movs r3, 0
	bl SetOamMatrix
	ldr r0, _0809030C @ =gUnknown_083B4EC4
	ldrb r1, [r4, 0x5]
	lsrs r1, 4
	adds r1, 0x10
	lsls r1, 4
	movs r2, 0x20
	bl LoadPalette
	ldr r1, _08090310 @ =gMain
	ldr r0, _08090314 @ =0x0000043c
	adds r1, r0
	b _08090368
	.align 2, 0
_08090300: .4byte gUnknown_0202FFBC
_08090304: .4byte gSprites
_08090308: .4byte gPokedexEntries
_0809030C: .4byte gUnknown_083B4EC4
_08090310: .4byte gMain
_08090314: .4byte 0x0000043c
_08090318:
	movs r0, 0x15
	negs r0, r0
	movs r1, 0
	str r1, [sp]
	movs r2, 0x10
	movs r3, 0
	bl BeginNormalPaletteFade
	ldr r0, _08090338 @ =gUnknown_03005CEC
	ldr r0, [r0]
	bl SetVBlankCallback
	ldr r1, _0809033C @ =gMain
	ldr r2, _08090340 @ =0x0000043c
	adds r1, r2
	b _08090368
	.align 2, 0
_08090338: .4byte gUnknown_03005CEC
_0809033C: .4byte gMain
_08090340: .4byte 0x0000043c
_08090344:
	ldr r0, _08090370 @ =REG_BLDCNT
	movs r1, 0
	strh r1, [r0]
	adds r0, 0x2
	strh r1, [r0]
	adds r0, 0x2
	strh r1, [r0]
	ldr r1, _08090374 @ =REG_BG2CNT
	ldr r2, _08090378 @ =0x00000e03
	adds r0, r2, 0
	strh r0, [r1]
	subs r1, 0xC
	movs r2, 0xF2
	lsls r2, 5
	adds r0, r2, 0
	strh r0, [r1]
	ldr r0, _0809037C @ =0x0000043c
	adds r1, r5, r0
_08090368:
	ldrb r0, [r1]
	adds r0, 0x1
	strb r0, [r1]
	b _080903AE
	.align 2, 0
_08090370: .4byte REG_BLDCNT
_08090374: .4byte REG_BG2CNT
_08090378: .4byte 0x00000e03
_0809037C: .4byte 0x0000043c
_08090380:
	ldr r0, _080903B8 @ =gPaletteFade
	ldrb r1, [r0, 0x7]
	movs r0, 0x80
	ands r0, r1
	lsls r0, 24
	lsrs r2, r0, 24
	cmp r2, 0
	bne _080903AE
	ldr r0, _080903BC @ =gUnknown_0202FFB4
	ldr r0, [r0]
	ldr r1, _080903C0 @ =0x0000064f
	adds r0, r1
	strb r2, [r0]
	ldr r1, _080903C4 @ =0x0000043c
	adds r0, r5, r1
	strb r2, [r0]
	ldr r1, _080903C8 @ =gTasks
	lsls r0, r3, 2
	adds r0, r3
	lsls r0, 3
	adds r0, r1
	ldr r1, _080903CC @ =sub_80903D0
	str r1, [r0]
_080903AE:
	add sp, 0x2C
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080903B8: .4byte gPaletteFade
_080903BC: .4byte gUnknown_0202FFB4
_080903C0: .4byte 0x0000064f
_080903C4: .4byte 0x0000043c
_080903C8: .4byte gTasks
_080903CC: .4byte sub_80903D0
	thumb_func_end sub_8090070

	thumb_func_start sub_80903D0
sub_80903D0: @ 80903D0
	push {r4,r5,lr}
	sub sp, 0x4
	lsls r0, 24
	lsrs r4, r0, 24
	adds r5, r4, 0
	ldr r0, _0809041C @ =gMain
	ldrh r1, [r0, 0x2E]
	movs r0, 0x2
	ands r0, r1
	lsls r0, 16
	lsrs r2, r0, 16
	cmp r2, 0
	beq _08090430
	movs r0, 0x15
	negs r0, r0
	movs r1, 0
	str r1, [sp]
	movs r2, 0
	movs r3, 0x10
	bl BeginNormalPaletteFade
	ldr r0, _08090420 @ =gUnknown_0202FFB4
	ldr r0, [r0]
	ldr r1, _08090424 @ =0x0000064f
	adds r0, r1
	movs r1, 0x1
	strb r1, [r0]
	ldr r1, _08090428 @ =gTasks
	lsls r0, r4, 2
	adds r0, r4
	lsls r0, 3
	adds r0, r1
	ldr r1, _0809042C @ =sub_8090498
	str r1, [r0]
	movs r0, 0x3
	bl PlaySE
	b _0809047A
	.align 2, 0
_0809041C: .4byte gMain
_08090420: .4byte gUnknown_0202FFB4
_08090424: .4byte 0x0000064f
_08090428: .4byte gTasks
_0809042C: .4byte sub_8090498
_08090430:
	movs r0, 0x20
	ands r0, r1
	cmp r0, 0
	bne _0809044A
	movs r0, 0x80
	lsls r0, 2
	ands r0, r1
	cmp r0, 0
	beq _0809047A
	ldr r0, _08090484 @ =gSaveBlock2
	ldrb r0, [r0, 0x13]
	cmp r0, 0x1
	bne _0809047A
_0809044A:
	movs r0, 0x15
	negs r0, r0
	str r2, [sp]
	movs r1, 0
	movs r2, 0
	movs r3, 0x10
	bl BeginNormalPaletteFade
	ldr r0, _08090488 @ =gUnknown_0202FFB4
	ldr r0, [r0]
	ldr r1, _0809048C @ =0x0000064f
	adds r0, r1
	movs r1, 0x2
	strb r1, [r0]
	ldr r1, _08090490 @ =gTasks
	lsls r0, r5, 2
	adds r0, r5
	lsls r0, 3
	adds r0, r1
	ldr r1, _08090494 @ =sub_8090498
	str r1, [r0]
	movs r0, 0x6D
	bl PlaySE
_0809047A:
	add sp, 0x4
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_08090484: .4byte gSaveBlock2
_08090488: .4byte gUnknown_0202FFB4
_0809048C: .4byte 0x0000064f
_08090490: .4byte gTasks
_08090494: .4byte sub_8090498
	thumb_func_end sub_80903D0

	thumb_func_start sub_8090498
sub_8090498: @ 8090498
	push {lr}
	lsls r0, 24
	lsrs r2, r0, 24
	ldr r0, _080904CC @ =gPaletteFade
	ldrb r1, [r0, 0x7]
	movs r0, 0x80
	ands r0, r1
	cmp r0, 0
	bne _080904EE
	ldr r0, _080904D0 @ =gUnknown_0202FFB4
	ldr r0, [r0]
	ldr r1, _080904D4 @ =0x0000064f
	adds r0, r1
	ldrb r0, [r0]
	cmp r0, 0x1
	beq _080904BC
	cmp r0, 0x2
	beq _080904E0
_080904BC:
	ldr r0, _080904D8 @ =gTasks
	lsls r1, r2, 2
	adds r1, r2
	lsls r1, 3
	adds r1, r0
	ldr r0, _080904DC @ =sub_808F2B0
	b _080904EC
	.align 2, 0
_080904CC: .4byte gPaletteFade
_080904D0: .4byte gUnknown_0202FFB4
_080904D4: .4byte 0x0000064f
_080904D8: .4byte gTasks
_080904DC: .4byte sub_808F2B0
_080904E0:
	ldr r0, _080904F4 @ =gTasks
	lsls r1, r2, 2
	adds r1, r2
	lsls r1, 3
	adds r1, r0
	ldr r0, _080904F8 @ =sub_808FA64
_080904EC:
	str r0, [r1]
_080904EE:
	pop {r0}
	bx r0
	.align 2, 0
_080904F4: .4byte gTasks
_080904F8: .4byte sub_808FA64
	thumb_func_end sub_8090498

	thumb_func_start sub_80904FC
sub_80904FC: @ 80904FC
	push {r4,lr}
	sub sp, 0x4
	adds r4, r0, 0
	lsls r4, 16
	ldr r0, _08090530 @ =gUnknown_08E96ACC
	lsrs r4, 5
	movs r2, 0xC0
	lsls r2, 19
	adds r1, r4, r2
	bl LZ77UnCompVram
	ldr r0, _08090534 @ =0x060000c0
	adds r4, r0
	mov r1, sp
	movs r0, 0
	strh r0, [r1]
	ldr r0, _08090538 @ =0x040000d4
	str r1, [r0]
	str r4, [r0, 0x4]
	ldr r1, _0809053C @ =0x81000220
	str r1, [r0, 0x8]
	ldr r0, [r0, 0x8]
	add sp, 0x4
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08090530: .4byte gUnknown_08E96ACC
_08090534: .4byte 0x060000c0
_08090538: .4byte 0x040000d4
_0809053C: .4byte 0x81000220
	thumb_func_end sub_80904FC

	thumb_func_start sub_8090540
sub_8090540: @ 8090540
	push {r4,lr}
	sub sp, 0x4
	adds r4, r0, 0
	lsls r4, 16
	ldr r0, _08090574 @ =gUnknown_08E96B58
	lsrs r4, 5
	movs r2, 0xC0
	lsls r2, 19
	adds r1, r4, r2
	bl LZ77UnCompVram
	ldr r0, _08090578 @ =0x060000c0
	adds r4, r0
	mov r1, sp
	movs r0, 0
	strh r0, [r1]
	ldr r0, _0809057C @ =0x040000d4
	str r1, [r0]
	str r4, [r0, 0x4]
	ldr r1, _08090580 @ =0x81000220
	str r1, [r0, 0x8]
	ldr r0, [r0, 0x8]
	add sp, 0x4
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08090574: .4byte gUnknown_08E96B58
_08090578: .4byte 0x060000c0
_0809057C: .4byte 0x040000d4
_08090580: .4byte 0x81000220
	thumb_func_end sub_8090540

	thumb_func_start sub_8090584
sub_8090584: @ 8090584
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	lsls r0, 24
	lsrs r0, 24
	mov r10, r0
	lsls r1, 16
	lsrs r1, 16
	mov r9, r1
	movs r1, 0
_0809059C:
	lsls r0, r1, 2
	adds r0, r1
	adds r0, 0x1
	lsls r0, 24
	lsrs r7, r0, 24
	movs r6, 0x80
	lsls r6, 7
	cmp r1, r10
	bne _080905B2
	movs r6, 0x80
	lsls r6, 6
_080905B2:
	movs r3, 0
	mov r0, r9
	lsls r0, 11
	mov r12, r0
	adds r1, 0x1
	mov r8, r1
	mov r5, r12
	ldr r4, _08090634 @ =0x00000fff
_080905C2:
	adds r0, r7, r3
	lsls r0, 1
	adds r0, r5, r0
	movs r2, 0xC0
	lsls r2, 19
	adds r1, r0, r2
	ldrh r2, [r1]
	ands r2, r4
	orrs r2, r6
	strh r2, [r1]
	ldr r1, _08090638 @ =0x06000040
	adds r0, r1
	ldrh r2, [r0]
	ands r2, r4
	orrs r2, r6
	strh r2, [r0]
	adds r0, r3, 0x1
	lsls r0, 24
	lsrs r3, r0, 24
	cmp r3, 0x4
	bls _080905C2
	mov r2, r8
	lsls r0, r2, 24
	lsrs r1, r0, 24
	cmp r1, 0x3
	bls _0809059C
	movs r6, 0x80
	lsls r6, 7
	movs r3, 0
	mov r5, r12
	ldr r4, _08090634 @ =0x00000fff
_08090600:
	lsls r0, r3, 1
	adds r0, r5, r0
	ldr r2, _0809063C @ =0x06000032
	adds r1, r0, r2
	ldrh r2, [r1]
	ands r2, r4
	orrs r2, r6
	strh r2, [r1]
	ldr r1, _08090640 @ =0x06000072
	adds r0, r1
	ldrh r2, [r0]
	ands r2, r4
	orrs r2, r6
	strh r2, [r0]
	adds r0, r3, 0x1
	lsls r0, 24
	lsrs r3, r0, 24
	cmp r3, 0x4
	bls _08090600
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_08090634: .4byte 0x00000fff
_08090638: .4byte 0x06000040
_0809063C: .4byte 0x06000032
_08090640: .4byte 0x06000072
	thumb_func_end sub_8090584

	thumb_func_start sub_8090644
sub_8090644: @ 8090644
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	lsls r0, 24
	lsrs r0, 24
	mov r10, r0
	lsls r1, 16
	lsrs r1, 16
	mov r9, r1
	movs r1, 0
_0809065C:
	lsls r0, r1, 2
	adds r0, r1
	adds r0, 0x1
	lsls r0, 24
	lsrs r0, 24
	mov r8, r0
	cmp r1, r10
	beq _08090670
	cmp r1, 0
	bne _08090676
_08090670:
	movs r5, 0x80
	lsls r5, 6
	b _0809067A
_08090676:
	movs r5, 0x80
	lsls r5, 7
_0809067A:
	movs r3, 0
	mov r0, r9
	lsls r7, r0, 11
	adds r1, 0x1
	mov r12, r1
	adds r6, r7, 0
	ldr r4, _080906FC @ =0x00000fff
_08090688:
	mov r1, r8
	adds r0, r1, r3
	lsls r0, 1
	adds r0, r6, r0
	movs r2, 0xC0
	lsls r2, 19
	adds r1, r0, r2
	ldrh r2, [r1]
	ands r2, r4
	orrs r2, r5
	strh r2, [r1]
	ldr r1, _08090700 @ =0x06000040
	adds r0, r1
	ldrh r2, [r0]
	ands r2, r4
	orrs r2, r5
	strh r2, [r0]
	adds r0, r3, 0x1
	lsls r0, 24
	lsrs r3, r0, 24
	cmp r3, 0x4
	bls _08090688
	mov r2, r12
	lsls r0, r2, 24
	lsrs r1, r0, 24
	cmp r1, 0x3
	bls _0809065C
	movs r5, 0x80
	lsls r5, 7
	movs r3, 0
	adds r6, r7, 0
	ldr r4, _080906FC @ =0x00000fff
_080906C8:
	lsls r0, r3, 1
	adds r0, r6, r0
	ldr r2, _08090704 @ =0x06000032
	adds r1, r0, r2
	ldrh r2, [r1]
	ands r2, r4
	orrs r2, r5
	strh r2, [r1]
	ldr r1, _08090708 @ =0x06000072
	adds r0, r1
	ldrh r2, [r0]
	ands r2, r4
	orrs r2, r5
	strh r2, [r0]
	adds r0, r3, 0x1
	lsls r0, 24
	lsrs r3, r0, 24
	cmp r3, 0x4
	bls _080906C8
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080906FC: .4byte 0x00000fff
_08090700: .4byte 0x06000040
_08090704: .4byte 0x06000032
_08090708: .4byte 0x06000072
	thumb_func_end sub_8090644

	thumb_func_start sub_809070C
sub_809070C: @ 809070C
	push {r4-r6,lr}
	adds r4, r0, 0
	adds r5, r1, 0
	adds r6, r2, 0
	lsls r4, 16
	lsrs r4, 16
	ldr r0, _08090748 @ =sub_8090750
	movs r1, 0
	bl CreateTask
	lsls r0, 24
	lsrs r0, 24
	ldr r2, _0809074C @ =gTasks
	lsls r1, r0, 2
	adds r1, r0
	lsls r1, 3
	adds r1, r2
	movs r2, 0
	strh r2, [r1, 0x8]
	strh r4, [r1, 0xA]
	strh r5, [r1, 0x20]
	lsrs r5, 16
	strh r5, [r1, 0x22]
	strh r6, [r1, 0x24]
	lsrs r6, 16
	strh r6, [r1, 0x26]
	pop {r4-r6}
	pop {r1}
	bx r1
	.align 2, 0
_08090748: .4byte sub_8090750
_0809074C: .4byte gTasks
	thumb_func_end sub_809070C

	thumb_func_start sub_8090750
sub_8090750: @ 8090750
	push {r4-r7,lr}
	sub sp, 0x8
	lsls r0, 24
	lsrs r7, r0, 24
	ldr r1, _08090778 @ =gTasks
	lsls r0, r7, 2
	adds r0, r7
	lsls r0, 3
	adds r0, r1
	ldrh r6, [r0, 0xA]
	movs r2, 0x8
	ldrsh r0, [r0, r2]
	adds r4, r1, 0
	cmp r0, 0x6
	bhi _0809079C
	lsls r0, 2
	ldr r1, _0809077C @ =_08090780
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_08090778: .4byte gTasks
_0809077C: .4byte _08090780
	.align 2, 0
_08090780:
	.4byte _0809079C
	.4byte _080907E0
	.4byte _0809085C
	.4byte _080908A0
	.4byte _08090960
	.4byte _080909B8
	.4byte _080909F4
_0809079C:
	ldr r0, _080907D0 @ =gPaletteFade
	ldrb r1, [r0, 0x7]
	movs r0, 0x80
	ands r0, r1
	cmp r0, 0
	beq _080907AA
	b _08090A26
_080907AA:
	ldr r1, _080907D4 @ =gUnknown_03005CEC
	ldr r0, _080907D8 @ =gMain
	ldr r0, [r0, 0xC]
	str r0, [r1]
	movs r0, 0
	bl SetVBlankCallback
	movs r0, 0x80
	lsls r0, 1
	bl sub_8091060
	ldr r1, _080907DC @ =gTasks
	lsls r0, r7, 2
	adds r0, r7
	lsls r0, 3
	adds r0, r1
	movs r1, 0x1
	strh r1, [r0, 0x8]
	b _08090A26
	.align 2, 0
_080907D0: .4byte gPaletteFade
_080907D4: .4byte gUnknown_03005CEC
_080907D8: .4byte gMain
_080907DC: .4byte gTasks
_080907E0:
	ldr r0, _08090840 @ =gPokedexMenu_Gfx
	ldr r1, _08090844 @ =0x06004000
	bl LZ77UnCompVram
	ldr r0, _08090848 @ =gUnknown_08E96BD4
	ldr r4, _0809084C @ =0x06007800
	adds r1, r4, 0
	bl LZ77UnCompVram
	movs r2, 0
	lsls r5, r7, 2
	mov r12, r5
	movs r0, 0x80
	lsls r0, 6
	adds r6, r0, 0
	ldr r3, _08090850 @ =0x0000027f
_08090800:
	lsls r0, r2, 1
	adds r0, r4
	ldrh r5, [r0]
	adds r1, r6, r5
	strh r1, [r0]
	adds r0, r2, 0x1
	lsls r0, 16
	lsrs r2, r0, 16
	cmp r2, r3
	bls _08090800
	ldr r0, _08090854 @ =gTasks
	mov r1, r12
	adds r4, r1, r7
	lsls r4, 3
	adds r4, r0
	ldrh r0, [r4, 0xA]
	movs r2, 0xFF
	lsls r2, 2
	movs r1, 0x2
	bl sub_8091738
	bl ResetPaletteFade
	ldr r0, _08090858 @ =gPokedexMenu_Pal + 0x2
	movs r1, 0x21
	movs r2, 0x9E
	bl LoadPalette
	ldrh r0, [r4, 0x8]
	adds r0, 0x1
	strh r0, [r4, 0x8]
	b _08090A26
	.align 2, 0
_08090840: .4byte gPokedexMenu_Gfx
_08090844: .4byte 0x06004000
_08090848: .4byte gUnknown_08E96BD4
_0809084C: .4byte 0x06007800
_08090850: .4byte 0x0000027f
_08090854: .4byte gTasks
_08090858: .4byte gPokedexMenu_Pal + 0x2
_0809085C:
	ldr r4, _0809088C @ =gWindowConfig_81E7064
	adds r0, r4, 0
	bl SetUpWindowConfig
	adds r0, r4, 0
	bl InitMenuWindow
	ldr r2, _08090890 @ =0x0600c000
	add r1, sp, 0x4
	movs r0, 0
	strh r0, [r1]
	ldr r0, _08090894 @ =0x040000d4
	str r1, [r0]
	str r2, [r0, 0x4]
	ldr r1, _08090898 @ =0x81000100
	str r1, [r0, 0x8]
	ldr r0, [r0, 0x8]
	ldr r1, _0809089C @ =gTasks
	lsls r0, r7, 2
	adds r0, r7
	lsls r0, 3
	adds r0, r1
	b _080909E0
	.align 2, 0
_0809088C: .4byte gWindowConfig_81E7064
_08090890: .4byte 0x0600c000
_08090894: .4byte 0x040000d4
_08090898: .4byte 0x81000100
_0809089C: .4byte gTasks
_080908A0:
	ldr r0, _080908C8 @ =gDexText_RegisterComplete
	movs r1, 0x2
	movs r2, 0
	movs r3, 0xD0
	bl sub_8072BD8
	bl IsNationalPokedex
	cmp r0, 0
	bne _080908CC
	adds r0, r6, 0
	bl NationalToHoennOrder
	lsls r0, 16
	lsrs r0, 16
	movs r1, 0xD
	movs r2, 0x3
	bl sub_8091154
	b _080908D6
	.align 2, 0
_080908C8: .4byte gDexText_RegisterComplete
_080908CC:
	adds r0, r6, 0
	movs r1, 0xD
	movs r2, 0x3
	bl sub_8091154
_080908D6:
	adds r0, r6, 0
	movs r1, 0x10
	movs r2, 0x3
	bl sub_80911C8
	ldr r0, _0809094C @ =gDexText_UnknownPoke
	movs r1, 0xB
	movs r2, 0x5
	bl MenuPrint
	ldr r0, _08090950 @ =gDexText_UnknownHeight
	movs r1, 0x10
	movs r2, 0x7
	bl MenuPrint
	ldr r0, _08090954 @ =gDexText_UnknownWeight
	movs r1, 0x10
	movs r2, 0x9
	bl MenuPrint
	lsls r4, r6, 3
	adds r4, r6
	lsls r4, 2
	ldr r6, _08090958 @ =gPokedexEntries
	adds r5, r4, r6
	adds r0, r5, 0
	movs r1, 0xB
	movs r2, 0x5
	bl sub_8091304
	ldrh r0, [r5, 0xC]
	movs r1, 0x10
	movs r2, 0x7
	bl sub_8091458
	ldrh r0, [r5, 0xE]
	movs r1, 0x10
	movs r2, 0x9
	bl sub_8091564
	adds r6, 0x10
	adds r4, r6
	ldr r0, [r4]
	movs r1, 0x2
	movs r2, 0xD
	bl MenuPrint
	movs r1, 0xFF
	lsls r1, 2
	movs r0, 0xE
	bl sub_80917CC
	ldr r1, _0809095C @ =gTasks
	lsls r0, r7, 2
	adds r0, r7
	lsls r0, 3
	adds r0, r1
	b _080909E0
	.align 2, 0
_0809094C: .4byte gDexText_UnknownPoke
_08090950: .4byte gDexText_UnknownHeight
_08090954: .4byte gDexText_UnknownWeight
_08090958: .4byte gPokedexEntries
_0809095C: .4byte gTasks
_08090960:
	adds r0, r6, 0
	movs r1, 0x30
	movs r2, 0x38
	movs r3, 0
	bl sub_80918EC
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	ldr r0, _080909AC @ =gSprites
	lsls r1, r4, 4
	adds r1, r4
	lsls r1, 2
	adds r1, r0
	ldrb r2, [r1, 0x5]
	movs r0, 0xD
	negs r0, r0
	ands r0, r2
	strb r0, [r1, 0x5]
	movs r0, 0x1
	negs r0, r0
	movs r1, 0
	str r1, [sp]
	movs r2, 0x10
	movs r3, 0
	bl BeginNormalPaletteFade
	ldr r0, _080909B0 @ =gUnknown_03005CEC
	ldr r0, [r0]
	bl SetVBlankCallback
	ldr r1, _080909B4 @ =gTasks
	lsls r0, r7, 2
	adds r0, r7
	lsls r0, 3
	adds r0, r1
	strh r4, [r0, 0xE]
	b _080909E0
	.align 2, 0
_080909AC: .4byte gSprites
_080909B0: .4byte gUnknown_03005CEC
_080909B4: .4byte gTasks
_080909B8:
	ldr r0, _080909E8 @ =REG_BLDCNT
	movs r1, 0
	strh r1, [r0]
	adds r0, 0x2
	strh r1, [r0]
	adds r0, 0x2
	strh r1, [r0]
	ldr r1, _080909EC @ =REG_BG3CNT
	ldr r2, _080909F0 @ =0x00000f07
	adds r0, r2, 0
	strh r0, [r1]
	subs r1, 0xE
	movs r5, 0xE2
	lsls r5, 5
	adds r0, r5, 0
	strh r0, [r1]
	lsls r0, r7, 2
	adds r0, r7
	lsls r0, 3
	adds r0, r4
_080909E0:
	ldrh r1, [r0, 0x8]
	adds r1, 0x1
	strh r1, [r0, 0x8]
	b _08090A26
	.align 2, 0
_080909E8: .4byte REG_BLDCNT
_080909EC: .4byte REG_BG3CNT
_080909F0: .4byte 0x00000f07
_080909F4:
	ldr r0, _08090A30 @ =gPaletteFade
	ldrb r1, [r0, 0x7]
	movs r0, 0x80
	ands r0, r1
	lsls r0, 24
	lsrs r5, r0, 24
	cmp r5, 0
	bne _08090A26
	adds r0, r6, 0
	bl NationalPokedexNumToSpecies
	lsls r0, 16
	lsrs r0, 16
	movs r1, 0
	bl PlayCry1
	ldr r1, _08090A34 @ =gTasks
	lsls r0, r7, 2
	adds r0, r7
	lsls r0, 3
	adds r0, r1
	strh r5, [r0, 0xC]
	strh r5, [r0, 0x10]
	ldr r1, _08090A38 @ =sub_8090A3C
	str r1, [r0]
_08090A26:
	add sp, 0x8
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_08090A30: .4byte gPaletteFade
_08090A34: .4byte gTasks
_08090A38: .4byte sub_8090A3C
	thumb_func_end sub_8090750

	thumb_func_start sub_8090A3C
sub_8090A3C: @ 8090A3C
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	sub sp, 0x4
	lsls r0, 24
	lsrs r6, r0, 24
	ldr r0, _08090A8C @ =gMain
	ldrh r1, [r0, 0x2E]
	movs r0, 0x2
	ands r0, r1
	lsls r0, 16
	lsrs r2, r0, 16
	cmp r2, 0
	beq _08090AA4
	ldr r0, _08090A90 @ =0x0000fffc
	movs r1, 0
	str r1, [sp]
	movs r2, 0
	movs r3, 0x10
	bl BeginNormalPaletteFade
	ldr r3, _08090A94 @ =gSprites
	ldr r0, _08090A98 @ =gTasks
	lsls r1, r6, 2
	adds r1, r6
	lsls r1, 3
	adds r1, r0
	movs r0, 0xE
	ldrsh r2, [r1, r0]
	lsls r0, r2, 4
	adds r0, r2
	lsls r0, 2
	adds r3, 0x1C
	adds r0, r3
	ldr r2, _08090A9C @ =sub_8090C28
	str r2, [r0]
	ldr r0, _08090AA0 @ =sub_8090B8C
	str r0, [r1]
	b _08090B7A
	.align 2, 0
_08090A8C: .4byte gMain
_08090A90: .4byte 0x0000fffc
_08090A94: .4byte gSprites
_08090A98: .4byte gTasks
_08090A9C: .4byte sub_8090C28
_08090AA0: .4byte sub_8090B8C
_08090AA4:
	movs r0, 0x1
	mov r8, r0
	ands r0, r1
	lsls r7, r6, 2
	cmp r0, 0
	beq _08090B44
	ldr r0, _08090B00 @ =gTasks
	adds r1, r7, r6
	lsls r1, 3
	adds r5, r1, r0
	movs r1, 0x10
	ldrsh r0, [r5, r1]
	cmp r0, 0
	bne _08090B0C
	ldrh r4, [r5, 0xA]
	movs r0, 0x2
	movs r1, 0xD
	movs r2, 0x1B
	movs r3, 0x13
	bl MenuZeroFillWindowRect
	ldr r1, _08090B04 @ =gPokedexEntries
	lsls r0, r4, 3
	adds r0, r4
	lsls r0, 2
	adds r1, 0x14
	adds r0, r1
	ldr r0, [r0]
	movs r1, 0x2
	movs r2, 0xD
	bl MenuPrint
	ldr r1, _08090B08 @ =0x06007aca
	ldrh r0, [r1]
	adds r0, 0x1
	strh r0, [r1]
	adds r1, 0x40
	ldrh r0, [r1]
	adds r0, 0x1
	strh r0, [r1]
	mov r0, r8
	strh r0, [r5, 0x10]
	movs r0, 0x15
	bl PlaySE
	b _08090B44
	.align 2, 0
_08090B00: .4byte gTasks
_08090B04: .4byte gPokedexEntries
_08090B08: .4byte 0x06007aca
_08090B0C:
	ldr r0, _08090B34 @ =0x0000fffc
	str r2, [sp]
	movs r1, 0
	movs r2, 0
	movs r3, 0x10
	bl BeginNormalPaletteFade
	ldr r2, _08090B38 @ =gSprites
	movs r0, 0xE
	ldrsh r1, [r5, r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r2, 0x1C
	adds r0, r2
	ldr r1, _08090B3C @ =sub_8090C28
	str r1, [r0]
	ldr r0, _08090B40 @ =sub_8090B8C
	str r0, [r5]
	b _08090B7A
	.align 2, 0
_08090B34: .4byte 0x0000fffc
_08090B38: .4byte gSprites
_08090B3C: .4byte sub_8090C28
_08090B40: .4byte sub_8090B8C
_08090B44:
	ldr r1, _08090B68 @ =gTasks
	adds r0, r7, r6
	lsls r0, 3
	adds r0, r1
	ldrh r1, [r0, 0xC]
	adds r1, 0x1
	strh r1, [r0, 0xC]
	movs r0, 0x10
	ands r1, r0
	cmp r1, 0
	beq _08090B70
	ldr r0, _08090B6C @ =gPokedexMenu_Pal + 0x2
	movs r1, 0x51
	movs r2, 0xE
	bl LoadPalette
	b _08090B7A
	.align 2, 0
_08090B68: .4byte gTasks
_08090B6C: .4byte gPokedexMenu_Pal + 0x2
_08090B70:
	ldr r0, _08090B88 @ =gPokedexMenu2_Pal + 0x2
	movs r1, 0x51
	movs r2, 0xE
	bl LoadPalette
_08090B7A:
	add sp, 0x4
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_08090B88: .4byte gPokedexMenu2_Pal + 0x2
	thumb_func_end sub_8090A3C

	thumb_func_start sub_8090B8C
sub_8090B8C: @ 8090B8C
	push {r4-r6,lr}
	lsls r0, 24
	lsrs r6, r0, 24
	ldr r0, _08090C14 @ =gPaletteFade
	ldrb r1, [r0, 0x7]
	movs r0, 0x80
	ands r0, r1
	cmp r0, 0
	bne _08090C0C
	movs r1, 0x80
	lsls r1, 19
	movs r2, 0xCA
	lsls r2, 5
	adds r0, r2, 0
	strh r0, [r1]
	ldr r0, _08090C18 @ =gUnknown_08D00524
	ldr r1, _08090C1C @ =0x0600c000
	movs r2, 0x80
	lsls r2, 4
	bl CpuSet
	bl sub_800D74C
	ldr r0, _08090C20 @ =gTasks
	lsls r4, r6, 2
	adds r4, r6
	lsls r4, 3
	adds r4, r0
	ldrh r0, [r4, 0xA]
	bl NationalPokedexNumToSpecies
	lsls r0, 16
	lsrs r0, 16
	ldrh r1, [r4, 0x22]
	lsls r1, 16
	ldrh r2, [r4, 0x20]
	orrs r1, r2
	ldrh r2, [r4, 0x26]
	lsls r2, 16
	ldrh r3, [r4, 0x24]
	orrs r2, r3
	ldr r5, _08090C24 @ =gSprites
	movs r3, 0xE
	ldrsh r4, [r4, r3]
	lsls r3, r4, 4
	adds r3, r4
	lsls r3, 2
	adds r3, r5
	ldrb r4, [r3, 0x5]
	lsrs r4, 4
	bl species_and_otid_get_pal
	lsls r4, 4
	movs r2, 0x80
	lsls r2, 1
	adds r1, r2, 0
	orrs r4, r1
	adds r1, r4, 0
	movs r2, 0x20
	bl LoadCompressedPalette
	adds r0, r6, 0
	bl DestroyTask
_08090C0C:
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_08090C14: .4byte gPaletteFade
_08090C18: .4byte gUnknown_08D00524
_08090C1C: .4byte 0x0600c000
_08090C20: .4byte gTasks
_08090C24: .4byte gSprites
	thumb_func_end sub_8090B8C

	thumb_func_start sub_8090C28
sub_8090C28: @ 8090C28
	push {lr}
	adds r1, r0, 0
	ldrh r2, [r1, 0x20]
	movs r3, 0x20
	ldrsh r0, [r1, r3]
	cmp r0, 0x77
	bgt _08090C3A
	adds r0, r2, 0x2
	strh r0, [r1, 0x20]
_08090C3A:
	ldrh r2, [r1, 0x20]
	movs r3, 0x20
	ldrsh r0, [r1, r3]
	cmp r0, 0x78
	ble _08090C48
	subs r0, r2, 0x2
	strh r0, [r1, 0x20]
_08090C48:
	ldrh r2, [r1, 0x22]
	movs r3, 0x22
	ldrsh r0, [r1, r3]
	cmp r0, 0x4F
	bgt _08090C56
	adds r0, r2, 0x1
	strh r0, [r1, 0x22]
_08090C56:
	ldrh r2, [r1, 0x22]
	movs r3, 0x22
	ldrsh r0, [r1, r3]
	cmp r0, 0x50
	ble _08090C64
	subs r0, r2, 0x1
	strh r0, [r1, 0x22]
_08090C64:
	pop {r0}
	bx r0
	thumb_func_end sub_8090C28

	thumb_func_start sub_8090C68
sub_8090C68: @ 8090C68
	push {r4,r5,lr}
	ldr r4, _08090CD0 @ =gUnknown_0202FFBC
	ldr r0, [r4]
	ldrb r1, [r0, 0x2]
	movs r0, 0x2
	ands r0, r1
	cmp r0, 0
	beq _08090D2A
	ldr r5, _08090CD4 @ =gUnknown_0202FFB4
	ldr r0, [r5]
	ldr r1, _08090CD8 @ =0x0000064e
	adds r0, r1
	ldrb r0, [r0]
	cmp r0, 0
	bne _08090CE4
	movs r0, 0x2
	movs r1, 0xD
	movs r2, 0x1B
	movs r3, 0x13
	bl MenuZeroFillWindowRect
	ldr r2, _08090CDC @ =gPokedexEntries
	ldr r0, [r4]
	ldrh r1, [r0]
	lsls r0, r1, 3
	adds r0, r1
	lsls r0, 2
	adds r2, 0x14
	adds r0, r2
	ldr r0, [r0]
	movs r1, 0x2
	movs r2, 0xD
	bl MenuPrint
	ldr r0, [r5]
	ldr r1, _08090CD8 @ =0x0000064e
	adds r0, r1
	movs r1, 0x1
	strb r1, [r0]
	ldr r1, _08090CE0 @ =0x06007aca
	ldrh r0, [r1]
	adds r0, 0x1
	strh r0, [r1]
	adds r1, 0x40
	ldrh r0, [r1]
	adds r0, 0x1
	strh r0, [r1]
	movs r0, 0x15
	bl PlaySE
	b _08090D2A
	.align 2, 0
_08090CD0: .4byte gUnknown_0202FFBC
_08090CD4: .4byte gUnknown_0202FFB4
_08090CD8: .4byte 0x0000064e
_08090CDC: .4byte gPokedexEntries
_08090CE0: .4byte 0x06007aca
_08090CE4:
	movs r0, 0x2
	movs r1, 0xD
	movs r2, 0x1B
	movs r3, 0x13
	bl MenuZeroFillWindowRect
	ldr r2, _08090D30 @ =gPokedexEntries
	ldr r0, [r4]
	ldrh r1, [r0]
	lsls r0, r1, 3
	adds r0, r1
	lsls r0, 2
	adds r2, 0x10
	adds r0, r2
	ldr r0, [r0]
	movs r1, 0x2
	movs r2, 0xD
	bl MenuPrint
	ldr r0, [r5]
	ldr r1, _08090D34 @ =0x0000064e
	adds r0, r1
	movs r1, 0
	strb r1, [r0]
	ldr r1, _08090D38 @ =0x06007aca
	ldrh r0, [r1]
	subs r0, 0x1
	strh r0, [r1]
	adds r1, 0x40
	ldrh r0, [r1]
	subs r0, 0x1
	strh r0, [r1]
	movs r0, 0x15
	bl PlaySE
_08090D2A:
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_08090D30: .4byte gPokedexEntries
_08090D34: .4byte 0x0000064e
_08090D38: .4byte 0x06007aca
	thumb_func_end sub_8090C68

	thumb_func_start GetPokemonCategory
GetPokemonCategory: @ 8090D3C
	adds r1, r0, 0
	lsls r1, 16
	lsrs r1, 16
	lsls r0, r1, 3
	adds r0, r1
	lsls r0, 2
	ldr r1, _08090D50 @ =gPokedexEntries
	adds r0, r1
	bx lr
	.align 2, 0
_08090D50: .4byte gPokedexEntries
	thumb_func_end GetPokemonCategory

	thumb_func_start sub_8090D54
sub_8090D54: @ 8090D54
	push {lr}
	lsls r0, 16
	lsrs r2, r0, 16
	lsls r1, 24
	lsrs r1, 24
	cmp r1, 0
	beq _08090D6A
	cmp r1, 0x1
	beq _08090D7C
	movs r0, 0x1
	b _08090D88
_08090D6A:
	ldr r0, _08090D78 @ =gPokedexEntries
	lsls r1, r2, 3
	adds r1, r2
	lsls r1, 2
	adds r1, r0
	ldrh r0, [r1, 0xC]
	b _08090D88
	.align 2, 0
_08090D78: .4byte gPokedexEntries
_08090D7C:
	ldr r0, _08090D8C @ =gPokedexEntries
	lsls r1, r2, 3
	adds r1, r2
	lsls r1, 2
	adds r1, r0
	ldrh r0, [r1, 0xE]
_08090D88:
	pop {r1}
	bx r1
	.align 2, 0
_08090D8C: .4byte gPokedexEntries
	thumb_func_end sub_8090D54

	thumb_func_start sub_8090D90
sub_8090D90: @ 8090D90
	push {r4-r7,lr}
	lsls r0, 16
	lsls r1, 24
	lsrs r2, r1, 24
	adds r3, r2, 0
	ldr r1, _08090DC4 @ =0xffff0000
	adds r0, r1
	lsrs r1, r0, 16
	lsrs r0, 19
	lsls r0, 24
	lsrs r4, r0, 24
	movs r0, 0x7
	ands r1, r0
	movs r0, 0x80
	lsls r0, 17
	lsls r0, r1
	lsrs r5, r0, 24
	movs r6, 0
	cmp r2, 0x1
	beq _08090E24
	cmp r2, 0x1
	bgt _08090DC8
	cmp r2, 0
	beq _08090DD4
	b _08090F0A
	.align 2, 0
_08090DC4: .4byte 0xffff0000
_08090DC8:
	cmp r3, 0x2
	beq _08090EBC
	cmp r3, 0x3
	bne _08090DD2
	b _08090EFC
_08090DD2:
	b _08090F0A
_08090DD4:
	ldr r1, _08090E14 @ =gSaveBlock2
	adds r0, r1, 0
	adds r0, 0x5C
	adds r0, r4, r0
	ldrb r2, [r0]
	ands r2, r5
	adds r7, r1, 0
	cmp r2, 0
	bne _08090DE8
	b _08090F0A
_08090DE8:
	ldr r0, _08090E18 @ =gSaveBlock1
	ldr r3, _08090E1C @ =0x00000938
	adds r1, r0, r3
	adds r1, r4, r1
	ldrb r1, [r1]
	ands r1, r5
	adds r6, r0, 0
	cmp r2, r1
	bne _08090E08
	ldr r1, _08090E20 @ =0x00003a8c
	adds r0, r6, r1
	adds r0, r4, r0
	ldrb r0, [r0]
	ands r0, r5
	cmp r2, r0
	beq _08090E62
_08090E08:
	adds r1, r7, 0
	adds r1, 0x5C
	adds r1, r4, r1
	mvns r3, r5
	b _08090E8E
	.align 2, 0
_08090E14: .4byte gSaveBlock2
_08090E18: .4byte gSaveBlock1
_08090E1C: .4byte 0x00000938
_08090E20: .4byte 0x00003a8c
_08090E24:
	ldr r1, _08090E68 @ =gSaveBlock2
	adds r0, r1, 0
	adds r0, 0x28
	adds r0, r4, r0
	ldrb r2, [r0]
	ands r2, r5
	adds r7, r1, 0
	cmp r2, 0
	beq _08090F0A
	adds r0, r7, 0
	adds r0, 0x5C
	adds r0, r4, r0
	ldrb r0, [r0]
	ands r0, r5
	ldr r6, _08090E6C @ =gSaveBlock1
	cmp r2, r0
	bne _08090E78
	ldr r3, _08090E70 @ =0x00000938
	adds r0, r6, r3
	adds r0, r4, r0
	ldrb r0, [r0]
	ands r0, r5
	cmp r2, r0
	bne _08090E78
	ldr r1, _08090E74 @ =0x00003a8c
	adds r0, r6, r1
	adds r0, r4, r0
	ldrb r0, [r0]
	ands r0, r5
	cmp r2, r0
	bne _08090E78
_08090E62:
	movs r6, 0x1
	b _08090F0A
	.align 2, 0
_08090E68: .4byte gSaveBlock2
_08090E6C: .4byte gSaveBlock1
_08090E70: .4byte 0x00000938
_08090E74: .4byte 0x00003a8c
_08090E78:
	adds r1, r7, 0
	adds r1, 0x28
	adds r1, r4, r1
	mvns r3, r5
	ldrb r2, [r1]
	adds r0, r3, 0
	ands r0, r2
	strb r0, [r1]
	adds r1, r7, 0
	adds r1, 0x5C
	adds r1, r4, r1
_08090E8E:
	ldrb r2, [r1]
	adds r0, r3, 0
	ands r0, r2
	strb r0, [r1]
	ldr r0, _08090EB4 @ =0x00000938
	adds r1, r6, r0
	adds r1, r4, r1
	ldrb r2, [r1]
	adds r0, r3, 0
	ands r0, r2
	strb r0, [r1]
	ldr r1, _08090EB8 @ =0x00003a8c
	adds r0, r6, r1
	adds r0, r4, r0
	ldrb r1, [r0]
	ands r3, r1
	strb r3, [r0]
	movs r6, 0
	b _08090F0A
	.align 2, 0
_08090EB4: .4byte 0x00000938
_08090EB8: .4byte 0x00003a8c
_08090EBC:
	ldr r1, _08090EEC @ =gSaveBlock2
	adds r1, 0x5C
	adds r1, r4, r1
	ldrb r2, [r1]
	adds r0, r5, 0
	orrs r0, r2
	strb r0, [r1]
	ldr r1, _08090EF0 @ =gSaveBlock1
	ldr r3, _08090EF4 @ =0x00000938
	adds r2, r1, r3
	adds r2, r4, r2
	ldrb r3, [r2]
	adds r0, r5, 0
	orrs r0, r3
	strb r0, [r2]
	ldr r0, _08090EF8 @ =0x00003a8c
	adds r1, r0
	adds r1, r4, r1
	ldrb r2, [r1]
	adds r0, r5, 0
	orrs r0, r2
	strb r0, [r1]
	b _08090F0A
	.align 2, 0
_08090EEC: .4byte gSaveBlock2
_08090EF0: .4byte gSaveBlock1
_08090EF4: .4byte 0x00000938
_08090EF8: .4byte 0x00003a8c
_08090EFC:
	ldr r0, _08090F14 @ =gSaveBlock2
	adds r0, 0x28
	adds r0, r4, r0
	ldrb r2, [r0]
	adds r1, r5, 0
	orrs r1, r2
	strb r1, [r0]
_08090F0A:
	adds r0, r6, 0
	pop {r4-r7}
	pop {r1}
	bx r1
	.align 2, 0
_08090F14: .4byte gSaveBlock2
	thumb_func_end sub_8090D90

	thumb_func_start GetNationalPokedexCount
GetNationalPokedexCount: @ 8090F18
	push {r4-r7,lr}
	lsls r0, 24
	lsrs r6, r0, 24
	movs r5, 0
	movs r0, 0
	ldr r7, _08090F30 @ =0x00000181
_08090F24:
	cmp r6, 0
	beq _08090F34
	cmp r6, 0x1
	beq _08090F3E
	adds r4, r0, 0x1
	b _08090F56
	.align 2, 0
_08090F30: .4byte 0x00000181
_08090F34:
	adds r4, r0, 0x1
	lsls r0, r4, 16
	lsrs r0, 16
	movs r1, 0
	b _08090F46
_08090F3E:
	adds r4, r0, 0x1
	lsls r0, r4, 16
	lsrs r0, 16
	movs r1, 0x1
_08090F46:
	bl sub_8090D90
	lsls r0, 24
	cmp r0, 0
	beq _08090F56
	adds r0, r5, 0x1
	lsls r0, 16
	lsrs r5, r0, 16
_08090F56:
	lsls r0, r4, 16
	lsrs r0, 16
	cmp r0, r7
	bls _08090F24
	adds r0, r5, 0
	pop {r4-r7}
	pop {r1}
	bx r1
	thumb_func_end GetNationalPokedexCount

	thumb_func_start GetHoennPokedexCount
GetHoennPokedexCount: @ 8090F68
	push {r4-r6,lr}
	lsls r0, 24
	lsrs r6, r0, 24
	movs r5, 0
	movs r0, 0
_08090F72:
	cmp r6, 0
	beq _08090F7E
	cmp r6, 0x1
	beq _08090F90
	adds r4, r0, 0x1
	b _08090FB0
_08090F7E:
	adds r4, r0, 0x1
	lsls r0, r4, 16
	lsrs r0, 16
	bl HoennToNationalOrder
	lsls r0, 16
	lsrs r0, 16
	movs r1, 0
	b _08090FA0
_08090F90:
	adds r4, r0, 0x1
	lsls r0, r4, 16
	lsrs r0, 16
	bl HoennToNationalOrder
	lsls r0, 16
	lsrs r0, 16
	movs r1, 0x1
_08090FA0:
	bl sub_8090D90
	lsls r0, 24
	cmp r0, 0
	beq _08090FB0
	adds r0, r5, 0x1
	lsls r0, 16
	lsrs r5, r0, 16
_08090FB0:
	lsls r0, r4, 16
	lsrs r0, 16
	cmp r0, 0xC9
	bls _08090F72
	adds r0, r5, 0
	pop {r4-r6}
	pop {r1}
	bx r1
	thumb_func_end GetHoennPokedexCount

	thumb_func_start sub_8090FC0
sub_8090FC0: @ 8090FC0
	push {r4,lr}
	movs r0, 0
_08090FC4:
	adds r0, 0x1
	lsls r0, 16
	lsrs r4, r0, 16
	adds r0, r4, 0
	bl HoennToNationalOrder
	lsls r0, 16
	lsrs r0, 16
	movs r1, 0x1
	bl sub_8090D90
	lsls r0, 24
	cmp r0, 0
	bne _08090FE4
	movs r0, 0
	b _08090FEC
_08090FE4:
	adds r0, r4, 0
	cmp r0, 0xC7
	bls _08090FC4
	movs r0, 0x1
_08090FEC:
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end sub_8090FC0

	thumb_func_start sub_8090FF4
sub_8090FF4: @ 8090FF4
	push {r4,r5,lr}
	movs r0, 0
_08090FF8:
	adds r0, 0x1
	lsls r0, 16
	lsrs r4, r0, 16
	adds r0, r4, 0
	movs r1, 0x1
	bl sub_8090D90
	lsls r0, 24
	cmp r0, 0
	beq _08091046
	adds r0, r4, 0
	cmp r0, 0x95
	bls _08090FF8
	movs r0, 0x98
_08091014:
	adds r0, 0x1
	lsls r0, 16
	lsrs r4, r0, 16
	adds r0, r4, 0
	movs r1, 0x1
	bl sub_8090D90
	lsls r0, 24
	cmp r0, 0
	beq _08091046
	adds r0, r4, 0
	cmp r0, 0xF9
	bls _08091014
	movs r0, 0xFC
	ldr r5, _0809104C @ =0x0000017f
_08091032:
	adds r0, 0x1
	lsls r0, 16
	lsrs r4, r0, 16
	adds r0, r4, 0
	movs r1, 0x1
	bl sub_8090D90
	lsls r0, 24
	cmp r0, 0
	bne _08091050
_08091046:
	movs r0, 0
	b _08091058
	.align 2, 0
_0809104C: .4byte 0x0000017f
_08091050:
	adds r0, r4, 0
	cmp r0, r5
	bls _08091032
	movs r0, 0x1
_08091058:
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end sub_8090FF4

	thumb_func_start sub_8091060
sub_8091060: @ 8091060
	push {r4,r5,lr}
	lsls r0, 16
	lsrs r4, r0, 16
	adds r5, r4, 0
	movs r0, 0x80
	lsls r0, 1
	ands r0, r4
	lsls r0, 16
	lsrs r3, r0, 16
	cmp r3, 0
	bne _0809108E
	movs r2, 0x80
	lsls r2, 19
	ldrh r1, [r2]
	ldr r0, _0809112C @ =0x0000feff
	ands r0, r1
	strh r0, [r2]
	ldr r0, _08091130 @ =REG_BG0CNT
	strh r3, [r0]
	adds r0, 0x8
	strh r3, [r0]
	adds r0, 0x2
	strh r3, [r0]
_0809108E:
	movs r0, 0x80
	lsls r0, 2
	ands r0, r4
	lsls r0, 16
	lsrs r3, r0, 16
	cmp r3, 0
	bne _080910B4
	movs r2, 0x80
	lsls r2, 19
	ldrh r1, [r2]
	ldr r0, _08091134 @ =0x0000fdff
	ands r0, r1
	strh r0, [r2]
	ldr r0, _08091138 @ =REG_BG1CNT
	strh r3, [r0]
	adds r0, 0xA
	strh r3, [r0]
	adds r0, 0x2
	strh r3, [r0]
_080910B4:
	movs r0, 0x80
	lsls r0, 3
	ands r0, r4
	lsls r0, 16
	lsrs r3, r0, 16
	cmp r3, 0
	bne _080910DA
	movs r2, 0x80
	lsls r2, 19
	ldrh r1, [r2]
	ldr r0, _0809113C @ =0x0000fbff
	ands r0, r1
	strh r0, [r2]
	ldr r0, _08091140 @ =REG_BG2CNT
	strh r3, [r0]
	adds r0, 0xC
	strh r3, [r0]
	adds r0, 0x2
	strh r3, [r0]
_080910DA:
	movs r0, 0x80
	lsls r0, 4
	ands r0, r4
	lsls r0, 16
	lsrs r3, r0, 16
	cmp r3, 0
	bne _08091100
	movs r2, 0x80
	lsls r2, 19
	ldrh r1, [r2]
	ldr r0, _08091144 @ =0x0000f7ff
	ands r0, r1
	strh r0, [r2]
	ldr r0, _08091148 @ =REG_BG3CNT
	strh r3, [r0]
	adds r0, 0xE
	strh r3, [r0]
	adds r0, 0x2
	strh r3, [r0]
_08091100:
	movs r0, 0x80
	lsls r0, 5
	ands r5, r0
	cmp r5, 0
	bne _08091124
	movs r2, 0x80
	lsls r2, 19
	ldrh r1, [r2]
	ldr r0, _0809114C @ =0x0000efff
	ands r0, r1
	strh r0, [r2]
	bl ResetSpriteData
	bl FreeAllSpritePalettes
	ldr r1, _08091150 @ =gReservedSpritePaletteCount
	movs r0, 0x8
	strb r0, [r1]
_08091124:
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_0809112C: .4byte 0x0000feff
_08091130: .4byte REG_BG0CNT
_08091134: .4byte 0x0000fdff
_08091138: .4byte REG_BG1CNT
_0809113C: .4byte 0x0000fbff
_08091140: .4byte REG_BG2CNT
_08091144: .4byte 0x0000f7ff
_08091148: .4byte REG_BG3CNT
_0809114C: .4byte 0x0000efff
_08091150: .4byte gReservedSpritePaletteCount
	thumb_func_end sub_8091060

	thumb_func_start sub_8091154
sub_8091154: @ 8091154
	push {r4-r6,lr}
	mov r6, r8
	push {r6}
	sub sp, 0x4
	adds r4, r0, 0
	adds r6, r1, 0
	mov r8, r2
	lsls r4, 16
	lsrs r4, 16
	lsls r6, 24
	lsrs r6, 24
	mov r0, r8
	lsls r0, 24
	lsrs r0, 24
	mov r8, r0
	mov r5, sp
	adds r0, r4, 0
	movs r1, 0x64
	bl __udivsi3
	adds r0, 0xA1
	strb r0, [r5]
	mov r5, sp
	adds r0, r4, 0
	movs r1, 0x64
	bl __umodsi3
	adds r4, r0, 0
	lsls r4, 16
	lsrs r4, 16
	adds r0, r4, 0
	movs r1, 0xA
	bl __udivsi3
	adds r0, 0xA1
	strb r0, [r5, 0x1]
	mov r5, sp
	adds r0, r4, 0
	movs r1, 0xA
	bl __umodsi3
	adds r0, 0xA1
	strb r0, [r5, 0x2]
	mov r1, sp
	movs r0, 0xFF
	strb r0, [r1, 0x3]
	mov r0, sp
	adds r1, r6, 0
	mov r2, r8
	bl MenuPrint
	add sp, 0x4
	pop {r3}
	mov r8, r3
	pop {r4-r6}
	pop {r0}
	bx r0
	thumb_func_end sub_8091154

	thumb_func_start sub_80911C8
sub_80911C8: @ 80911C8
	push {r4-r6,lr}
	sub sp, 0xC
	lsls r0, 16
	lsrs r3, r0, 16
	lsls r1, 24
	lsrs r6, r1, 24
	lsls r2, 24
	lsrs r5, r2, 24
	movs r4, 0
	movs r2, 0xFF
_080911DC:
	mov r1, sp
	adds r0, r1, r4
	ldrb r1, [r0]
	orrs r1, r2
	strb r1, [r0]
	adds r0, r4, 0x1
	lsls r0, 24
	lsrs r4, r0, 24
	cmp r4, 0xA
	bls _080911DC
	adds r0, r3, 0
	bl NationalPokedexNumToSpecies
	adds r3, r0, 0
	cmp r3, 0
	beq _08091238
	movs r4, 0
	ldr r2, _08091234 @ =gSpeciesNames
	movs r0, 0xB
	adds r1, r3, 0
	muls r1, r0
	adds r0, r1, r2
	ldrb r0, [r0]
	cmp r0, 0xFF
	beq _0809124C
	adds r3, r2, 0
	adds r2, r1, 0
_08091212:
	mov r0, sp
	adds r1, r0, r4
	adds r0, r4, r2
	adds r0, r3
	ldrb r0, [r0]
	strb r0, [r1]
	adds r0, r4, 0x1
	lsls r0, 24
	lsrs r4, r0, 24
	adds r0, r4, r2
	adds r0, r3
	ldrb r0, [r0]
	cmp r0, 0xFF
	beq _0809124C
	cmp r4, 0x9
	bls _08091212
	b _0809124C
	.align 2, 0
_08091234: .4byte gSpeciesNames
_08091238:
	movs r4, 0
	movs r1, 0xAE
_0809123C:
	mov r2, sp
	adds r0, r2, r4
	strb r1, [r0]
	adds r0, r4, 0x1
	lsls r0, 24
	lsrs r4, r0, 24
	cmp r4, 0x9
	bls _0809123C
_0809124C:
	mov r0, sp
	adds r1, r6, 0
	adds r2, r5, 0
	bl MenuPrint
	adds r0, r4, 0
	add sp, 0xC
	pop {r4-r6}
	pop {r1}
	bx r1
	thumb_func_end sub_80911C8

	thumb_func_start sub_8091260
sub_8091260: @ 8091260
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	sub sp, 0x28
	adds r4, r3, 0
	lsls r0, 16
	lsrs r5, r0, 16
	lsls r1, 24
	lsrs r1, 24
	mov r8, r1
	lsls r2, 24
	lsrs r7, r2, 24
	lsls r4, 24
	lsrs r4, 24
	ldr r1, _080912CC @ =gUnknown_083B5558
	mov r0, sp
	bl StringCopy
	adds r6, r0, 0
	mov r0, sp
	strb r4, [r0, 0x2]
	adds r0, r5, 0
	bl NationalPokedexNumToSpecies
	adds r5, r0, 0
	cmp r5, 0
	beq _080912D4
	movs r4, 0
	ldr r2, _080912D0 @ =gSpeciesNames
	movs r0, 0xB
	adds r1, r5, 0
	muls r1, r0
	adds r0, r1, r2
	ldrb r0, [r0]
	cmp r0, 0xFF
	beq _080912E6
	adds r3, r2, 0
	adds r2, r1, 0
_080912AC:
	adds r1, r6, r4
	adds r0, r4, r2
	adds r0, r3
	ldrb r0, [r0]
	strb r0, [r1]
	adds r0, r4, 0x1
	lsls r0, 24
	lsrs r4, r0, 24
	adds r0, r4, r2
	adds r0, r3
	ldrb r0, [r0]
	cmp r0, 0xFF
	beq _080912E6
	cmp r4, 0x9
	bls _080912AC
	b _080912E6
	.align 2, 0
_080912CC: .4byte gUnknown_083B5558
_080912D0: .4byte gSpeciesNames
_080912D4:
	movs r4, 0
	movs r1, 0xAE
_080912D8:
	adds r0, r6, r4
	strb r1, [r0]
	adds r0, r4, 0x1
	lsls r0, 24
	lsrs r4, r0, 24
	cmp r4, 0x9
	bls _080912D8
_080912E6:
	adds r1, r6, r4
	movs r0, 0xFF
	strb r0, [r1]
	mov r0, sp
	mov r1, r8
	adds r2, r7, 0
	bl MenuPrint
	adds r0, r4, 0
	add sp, 0x28
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r1}
	bx r1
	thumb_func_end sub_8091260

	thumb_func_start sub_8091304
sub_8091304: @ 8091304
	push {r4-r7,lr}
	sub sp, 0x20
	adds r3, r0, 0
	lsls r1, 24
	lsrs r1, 24
	mov r12, r1
	lsls r2, 24
	lsrs r7, r2, 24
	movs r4, 0
	ldrb r0, [r3]
	ldr r6, _08091340 @ =gDexText_UnknownPoke
	cmp r0, 0xFF
	beq _0809133A
_0809131E:
	mov r0, sp
	adds r1, r0, r4
	adds r0, r3, r4
	ldrb r0, [r0]
	strb r0, [r1]
	adds r0, r4, 0x1
	lsls r0, 24
	lsrs r4, r0, 24
	adds r0, r3, r4
	ldrb r0, [r0]
	cmp r0, 0xFF
	beq _0809133A
	cmp r4, 0xA
	bls _0809131E
_0809133A:
	movs r3, 0
	ldrb r0, [r6]
	b _0809134E
	.align 2, 0
_08091340: .4byte gDexText_UnknownPoke
_08091344:
	adds r0, r3, 0x1
	lsls r0, 24
	lsrs r3, r0, 24
	adds r0, r3, r6
	ldrb r0, [r0]
_0809134E:
	cmp r0, 0xAC
	beq _08091344
	cmp r0, 0
	beq _08091344
	subs r0, r3, 0x1
	lsls r0, 24
	lsrs r3, r0, 24
	adds r0, r3, r6
	ldrb r0, [r0]
	cmp r0, 0xFF
	beq _08091388
	adds r5, r6, 0
_08091366:
	adds r1, r4, 0
	adds r0, r1, 0x1
	lsls r0, 24
	lsrs r4, r0, 24
	mov r0, sp
	adds r2, r0, r1
	adds r1, r3, 0
	adds r0, r1, 0x1
	lsls r0, 24
	lsrs r3, r0, 24
	adds r1, r5
	ldrb r0, [r1]
	strb r0, [r2]
	adds r0, r3, r5
	ldrb r0, [r0]
	cmp r0, 0xFF
	bne _08091366
_08091388:
	mov r0, sp
	adds r1, r0, r4
	movs r0, 0xFF
	strb r0, [r1]
	mov r0, sp
	mov r1, r12
	adds r2, r7, 0
	adds r3, r6, 0
	bl sub_8072B80
	add sp, 0x20
	pop {r4-r7}
	pop {r0}
	bx r0
	thumb_func_end sub_8091304

	thumb_func_start unref_sub_80913A4
unref_sub_80913A4: @ 80913A4
	push {r4-r7,lr}
	sub sp, 0x8
	lsls r0, 16
	lsrs r4, r0, 16
	lsls r1, 24
	lsrs r7, r1, 24
	lsls r2, 24
	lsrs r6, r2, 24
	movs r5, 0
	movs r1, 0xFA
	lsls r1, 2
	adds r0, r4, 0
	bl __udivsi3
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0
	bne _080913CE
	mov r0, sp
	strb r5, [r0]
	b _080913D6
_080913CE:
	mov r1, sp
	adds r0, 0xA1
	strb r0, [r1]
	movs r5, 0x1
_080913D6:
	movs r1, 0xFA
	lsls r1, 2
	adds r0, r4, 0
	bl __umodsi3
	lsls r0, 16
	lsrs r0, 16
	movs r1, 0x64
	bl __udivsi3
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0
	bne _080913FC
	cmp r5, 0
	bne _080913FC
	mov r0, sp
	strb r5, [r0, 0x1]
	b _08091402
_080913FC:
	mov r1, sp
	adds r0, 0xA1
	strb r0, [r1, 0x1]
_08091402:
	mov r5, sp
	movs r1, 0xFA
	lsls r1, 2
	adds r0, r4, 0
	bl __umodsi3
	lsls r0, 16
	lsrs r0, 16
	movs r1, 0x64
	bl __umodsi3
	adds r4, r0, 0
	lsls r4, 16
	lsrs r4, 16
	adds r0, r4, 0
	movs r1, 0xA
	bl __udivsi3
	adds r0, 0xA1
	strb r0, [r5, 0x2]
	mov r1, sp
	movs r0, 0xAD
	strb r0, [r1, 0x3]
	mov r5, sp
	adds r0, r4, 0
	movs r1, 0xA
	bl __umodsi3
	adds r0, 0xA1
	strb r0, [r5, 0x4]
	mov r1, sp
	movs r0, 0xFF
	strb r0, [r1, 0x5]
	mov r0, sp
	adds r1, r7, 0
	adds r2, r6, 0
	bl MenuPrint
	add sp, 0x8
	pop {r4-r7}
	pop {r0}
	bx r0
	thumb_func_end unref_sub_80913A4

	thumb_func_start sub_8091458
sub_8091458: @ 8091458
	push {r4-r7,lr}
	mov r7, r9
	mov r6, r8
	push {r6,r7}
	sub sp, 0x10
	lsls r0, 16
	lsrs r0, 16
	lsls r1, 24
	lsrs r1, 24
	mov r9, r1
	lsls r2, 24
	lsrs r2, 24
	mov r8, r2
	ldr r1, _080914D4 @ =0x00002710
	muls r0, r1
	movs r1, 0xFE
	bl __divsi3
	adds r7, r0, 0
	movs r1, 0xA
	bl __umodsi3
	cmp r0, 0x4
	bls _0809148A
	adds r7, 0xA
_0809148A:
	adds r0, r7, 0
	movs r1, 0x78
	bl __udivsi3
	adds r6, r0, 0
	lsls r0, r6, 4
	subs r0, r6
	lsls r0, 3
	subs r0, r7, r0
	movs r1, 0xA
	bl __udivsi3
	adds r7, r0, 0
	mov r1, sp
	movs r0, 0xFC
	strb r0, [r1]
	adds r1, 0x1
	movs r0, 0x13
	strb r0, [r1]
	adds r0, r6, 0
	movs r1, 0xA
	bl __udivsi3
	adds r2, r0, 0
	cmp r2, 0
	bne _080914D8
	mov r1, sp
	adds r1, 0x2
	movs r0, 0x12
	strb r0, [r1]
	movs r5, 0x4
	adds r1, 0x1
	adds r0, r6, 0
	adds r0, 0xA1
	strb r0, [r1]
	b _080914F8
	.align 2, 0
_080914D4: .4byte 0x00002710
_080914D8:
	mov r1, sp
	adds r1, 0x2
	movs r0, 0xC
	strb r0, [r1]
	adds r1, 0x1
	adds r0, r2, 0
	adds r0, 0xA1
	strb r0, [r1]
	movs r5, 0x5
	add r4, sp, 0x4
	adds r0, r6, 0
	movs r1, 0xA
	bl __umodsi3
	adds r0, 0xA1
	strb r0, [r4]
_080914F8:
	adds r1, r5, 0
	adds r0, r1, 0x1
	lsls r0, 24
	lsrs r5, r0, 24
	adds r2, r5, 0
	add r1, sp
	movs r0, 0xB4
	strb r0, [r1]
	adds r0, r2, 0x1
	lsls r0, 24
	lsrs r5, r0, 24
	adds r6, r5, 0
	mov r0, sp
	adds r4, r0, r2
	adds r0, r7, 0
	movs r1, 0xA
	bl __udivsi3
	adds r0, 0xA1
	strb r0, [r4]
	adds r0, r6, 0x1
	lsls r0, 24
	lsrs r5, r0, 24
	mov r1, sp
	adds r4, r1, r6
	adds r0, r7, 0
	movs r1, 0xA
	bl __umodsi3
	adds r0, 0xA1
	strb r0, [r4]
	adds r0, r5, 0x1
	lsls r0, 24
	lsrs r0, 24
	mov r1, sp
	adds r2, r1, r5
	movs r1, 0xB2
	strb r1, [r2]
	mov r2, sp
	adds r1, r2, r0
	movs r0, 0xFF
	strb r0, [r1]
	mov r0, sp
	mov r1, r9
	mov r2, r8
	bl MenuPrint
	add sp, 0x10
	pop {r3,r4}
	mov r8, r3
	mov r9, r4
	pop {r4-r7}
	pop {r0}
	bx r0
	thumb_func_end sub_8091458

	thumb_func_start sub_8091564
sub_8091564: @ 8091564
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	sub sp, 0x14
	lsls r0, 16
	lsrs r0, 16
	lsls r1, 24
	lsrs r1, 24
	mov r10, r1
	lsls r2, 24
	lsrs r2, 24
	str r2, [sp, 0x10]
	ldr r7, _080915BC @ =0x000186a0
	muls r0, r7
	ldr r1, _080915C0 @ =0x000011b8
	bl __divsi3
	adds r6, r0, 0
	movs r1, 0xA
	bl __umodsi3
	cmp r0, 0x4
	bls _08091598
	adds r6, 0xA
_08091598:
	movs r5, 0
	mov r4, sp
	adds r0, r6, 0
	adds r1, r7, 0
	bl __udivsi3
	adds r0, 0xA1
	strb r0, [r4]
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0xA1
	bne _080915C4
	mov r0, sp
	strb r5, [r0]
	movs r7, 0x2
	adds r0, 0x1
	strb r5, [r0]
	b _080915C8
	.align 2, 0
_080915BC: .4byte 0x000186a0
_080915C0: .4byte 0x000011b8
_080915C4:
	movs r5, 0x1
	movs r7, 0x1
_080915C8:
	ldr r1, _0809160C @ =0x000186a0
	adds r0, r6, 0
	bl __umodsi3
	adds r6, r0, 0
	mov r0, sp
	adds r4, r0, r7
	ldr r1, _08091610 @ =0x00002710
	adds r0, r6, 0
	bl __udivsi3
	adds r0, 0xA1
	strb r0, [r4]
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0xA1
	bne _08091614
	cmp r5, 0
	bne _08091614
	adds r1, r7, 0
	adds r0, r1, 0x1
	lsls r0, 24
	lsrs r7, r0, 24
	adds r2, r7, 0
	mov r3, sp
	adds r0, r3, r1
	strb r5, [r0]
	adds r0, r2, 0x1
	lsls r0, 24
	lsrs r7, r0, 24
	adds r0, r3, r2
	strb r5, [r0]
	b _0809161C
	.align 2, 0
_0809160C: .4byte 0x000186a0
_08091610: .4byte 0x00002710
_08091614:
	movs r5, 0x1
	adds r0, r7, 0x1
	lsls r0, 24
	lsrs r7, r0, 24
_0809161C:
	ldr r1, _08091660 @ =0x00002710
	adds r0, r6, 0
	bl __umodsi3
	adds r6, r0, 0
	mov r0, sp
	adds r4, r0, r7
	movs r1, 0xFA
	lsls r1, 2
	adds r0, r6, 0
	bl __udivsi3
	adds r0, 0xA1
	strb r0, [r4]
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0xA1
	bne _08091664
	cmp r5, 0
	bne _08091664
	adds r1, r7, 0
	adds r0, r1, 0x1
	lsls r0, 24
	lsrs r7, r0, 24
	adds r2, r7, 0
	mov r3, sp
	adds r0, r3, r1
	strb r5, [r0]
	adds r0, r2, 0x1
	lsls r0, 24
	lsrs r7, r0, 24
	adds r0, r3, r2
	strb r5, [r0]
	b _0809166A
	.align 2, 0
_08091660: .4byte 0x00002710
_08091664:
	adds r0, r7, 0x1
	lsls r0, 24
	lsrs r7, r0, 24
_0809166A:
	movs r1, 0xFA
	lsls r1, 2
	adds r0, r6, 0
	bl __umodsi3
	adds r6, r0, 0
	adds r1, r7, 0
	adds r0, r1, 0x1
	lsls r0, 24
	lsrs r7, r0, 24
	adds r5, r7, 0
	mov r0, sp
	adds r4, r0, r1
	adds r0, r6, 0
	movs r1, 0x64
	bl __udivsi3
	adds r0, 0xA1
	movs r1, 0
	mov r9, r1
	strb r0, [r4]
	adds r0, r6, 0
	movs r1, 0x64
	bl __umodsi3
	adds r6, r0, 0
	adds r0, r5, 0x1
	lsls r0, 24
	lsrs r7, r0, 24
	adds r1, r7, 0
	mov r2, sp
	adds r0, r2, r5
	movs r3, 0xAD
	mov r8, r3
	mov r2, r8
	strb r2, [r0]
	adds r0, r1, 0x1
	lsls r0, 24
	lsrs r7, r0, 24
	adds r5, r7, 0
	mov r3, sp
	adds r4, r3, r1
	adds r0, r6, 0
	movs r1, 0xA
	bl __udivsi3
	adds r0, 0xA1
	strb r0, [r4]
	adds r0, r5, 0x1
	lsls r0, 24
	lsrs r7, r0, 24
	adds r1, r7, 0
	mov r2, sp
	adds r0, r2, r5
	mov r3, r9
	strb r3, [r0]
	adds r0, r1, 0x1
	lsls r0, 24
	lsrs r7, r0, 24
	adds r2, r7, 0
	add r1, sp
	movs r0, 0xE0
	strb r0, [r1]
	adds r0, r2, 0x1
	lsls r0, 24
	lsrs r7, r0, 24
	adds r3, r7, 0
	mov r0, sp
	adds r1, r0, r2
	movs r0, 0xD6
	strb r0, [r1]
	adds r0, r3, 0x1
	lsls r0, 24
	lsrs r7, r0, 24
	adds r2, r7, 0
	mov r0, sp
	adds r1, r0, r3
	movs r0, 0xE7
	strb r0, [r1]
	adds r0, r2, 0x1
	lsls r0, 24
	lsrs r0, 24
	mov r3, sp
	adds r1, r3, r2
	mov r2, r8
	strb r2, [r1]
	adds r1, r3, r0
	movs r0, 0xFF
	strb r0, [r1]
	mov r0, sp
	mov r1, r10
	ldr r2, [sp, 0x10]
	bl MenuPrint
	add sp, 0x14
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	thumb_func_end sub_8091564

	thumb_func_start sub_8091738
sub_8091738: @ 8091738
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	sub sp, 0x80
	adds r4, r1, 0
	adds r5, r2, 0
	lsls r0, 16
	lsrs r0, 16
	lsls r4, 16
	lsrs r4, 16
	lsls r5, 16
	lsrs r5, 16
	ldr r6, _080917C8 @ =gMonFootprintTable
	bl NationalPokedexNumToSpecies
	lsls r0, 16
	lsrs r0, 14
	adds r0, r6
	ldr r0, [r0]
	mov r12, r0
	movs r7, 0
	movs r1, 0
	lsls r4, 14
	mov r8, r4
	lsls r5, 5
_0809176A:
	mov r2, r12
	adds r0, r2, r1
	ldrb r3, [r0]
	movs r6, 0
	adds r4, r1, 0x1
_08091774:
	lsls r1, r6, 1
	adds r2, r3, 0
	asrs r2, r1
	movs r0, 0x1
	ands r2, r0
	movs r0, 0x2
	lsls r0, r1
	ands r0, r3
	cmp r0, 0
	beq _0809178C
	movs r0, 0x10
	orrs r2, r0
_0809178C:
	mov r1, sp
	adds r0, r1, r7
	strb r2, [r0]
	adds r0, r7, 0x1
	lsls r0, 16
	lsrs r7, r0, 16
	adds r0, r6, 0x1
	lsls r0, 16
	lsrs r6, r0, 16
	cmp r6, 0x3
	bls _08091774
	lsls r0, r4, 16
	lsrs r1, r0, 16
	cmp r1, 0x1F
	bls _0809176A
	movs r1, 0xC0
	lsls r1, 19
	adds r1, r5, r1
	add r1, r8
	mov r0, sp
	movs r2, 0x40
	bl CpuSet
	add sp, 0x80
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080917C8: .4byte gMonFootprintTable
	thumb_func_end sub_8091738

	thumb_func_start sub_80917CC
sub_80917CC: @ 80917CC
	push {r4,lr}
	lsls r0, 16
	lsls r1, 16
	lsrs r1, 16
	lsrs r0, 5
	ldr r2, _08091808 @ =0x06000232
	adds r3, r0, r2
	movs r4, 0xF0
	lsls r4, 8
	adds r2, r1, r4
	strh r2, [r3]
	ldr r2, _0809180C @ =0x06000234
	adds r3, r0, r2
	adds r4, 0x1
	adds r2, r1, r4
	strh r2, [r3]
	ldr r2, _08091810 @ =0x06000272
	adds r3, r0, r2
	adds r4, 0x1
	adds r2, r1, r4
	strh r2, [r3]
	ldr r2, _08091814 @ =0x06000274
	adds r0, r2
	adds r4, 0x1
	adds r1, r4
	strh r1, [r0]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08091808: .4byte 0x06000232
_0809180C: .4byte 0x06000234
_08091810: .4byte 0x06000272
_08091814: .4byte 0x06000274
	thumb_func_end sub_80917CC

	thumb_func_start sub_8091818
sub_8091818: @ 8091818
	push {r4,r5,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	adds r5, r4, 0
	lsls r1, 16
	lsrs r0, r1, 16
	lsls r2, 16
	lsrs r2, 16
	lsls r3, 16
	lsrs r3, 16
	cmp r4, 0x1
	beq _08091844
	cmp r4, 0x1
	bgt _0809183A
	cmp r4, 0
	beq _0809184C
	b _0809186C
_0809183A:
	cmp r5, 0x2
	beq _0809185E
	cmp r5, 0x3
	beq _08091852
	b _0809186C
_08091844:
	cmp r0, r2
	bls _0809186C
	subs r0, 0x1
	b _08091864
_0809184C:
	cmp r0, r3
	bcs _0809186C
	b _08091862
_08091852:
	cmp r0, r2
	bls _0809185A
	subs r0, 0x1
	b _08091864
_0809185A:
	adds r0, r3, 0
	b _0809186C
_0809185E:
	cmp r0, r3
	bcs _0809186A
_08091862:
	adds r0, 0x1
_08091864:
	lsls r0, 16
	lsrs r0, 16
	b _0809186C
_0809186A:
	adds r0, r2, 0
_0809186C:
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end sub_8091818

	thumb_func_start nullsub_59
nullsub_59: @ 8091874
	bx lr
	thumb_func_end nullsub_59

	thumb_func_start sub_8091878
sub_8091878: @ 8091878
	push {r4-r7,lr}
	lsls r1, 24
	ldr r4, _080918A0 @ =gUnknown_02024E8C
	adds r3, r4, 0
	ldr r2, _080918A4 @ =gUnknown_083B57A4
	ldm r2!, {r5-r7}
	stm r3!, {r5-r7}
	ldm r2!, {r5-r7}
	stm r3!, {r5-r7}
	strh r0, [r4, 0x2]
	ldr r0, _080918A8 @ =gUnknown_083B5794
	lsrs r1, 22
	adds r1, r0
	ldr r0, [r1]
	str r0, [r4, 0xC]
	ldr r0, _080918AC @ =gSpriteAnimTable_81E7C64
	str r0, [r4, 0x8]
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080918A0: .4byte gUnknown_02024E8C
_080918A4: .4byte gUnknown_083B57A4
_080918A8: .4byte gUnknown_083B5794
_080918AC: .4byte gSpriteAnimTable_81E7C64
	thumb_func_end sub_8091878

	thumb_func_start sub_80918B0
sub_80918B0: @ 80918B0
	push {r4-r7,lr}
	lsls r1, 24
	ldr r4, _080918DC @ =gUnknown_02024E8C
	adds r3, r4, 0
	ldr r2, _080918E0 @ =gUnknown_083B57A4
	ldm r2!, {r5-r7}
	stm r3!, {r5-r7}
	ldm r2!, {r5-r7}
	stm r3!, {r5-r7}
	strh r0, [r4, 0x2]
	ldr r0, _080918E4 @ =gUnknown_083B5794
	lsrs r1, 22
	adds r1, r0
	ldr r0, [r1]
	str r0, [r4, 0xC]
	ldr r0, _080918E8 @ =gUnknown_081EC2A4
	ldr r0, [r0]
	str r0, [r4, 0x8]
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080918DC: .4byte gUnknown_02024E8C
_080918E0: .4byte gUnknown_083B57A4
_080918E4: .4byte gUnknown_083B5794
_080918E8: .4byte gUnknown_081EC2A4
	thumb_func_end sub_80918B0

	thumb_func_start sub_80918EC
sub_80918EC: @ 80918EC
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	sub sp, 0x10
	lsls r0, 16
	lsrs r7, r0, 16
	lsls r1, 16
	lsrs r1, 16
	mov r9, r1
	lsls r2, 16
	lsrs r2, 16
	mov r10, r2
	lsls r3, 16
	lsrs r3, 16
	mov r8, r3
	adds r0, r7, 0
	bl NationalPokedexNumToSpecies
	adds r7, r0, 0
	cmp r7, SPECIES_UNOWN
	beq _0809199C
	movs r0, 0x9A
	lsls r0, 1
	cmp r7, r0
	beq _08091958
	lsls r6, r7, 3
	ldr r0, _0809194C @ =gMonFrontPicTable
	adds r0, r6, r0
	ldr r1, _08091950 @ =gMonFrontPicCoords
	lsls r2, r7, 2
	adds r2, r1
	ldrb r1, [r2]
	ldrb r2, [r2, 0x1]
	movs r3, 0x80
	lsls r3, 18
	ldr r4, _08091954 @ =gUnknown_083B5584
	mov r12, r4
	mov r5, r8
	lsls r4, r5, 2
	add r4, r12
	ldr r4, [r4]
	str r4, [sp]
	str r7, [sp, 0x4]
	bl DecompressPicFromTable_2
	b _080919CE
	.align 2, 0
_0809194C: .4byte gMonFrontPicTable
_08091950: .4byte gMonFrontPicCoords
_08091954: .4byte gUnknown_083B5584
_08091958:
	lsls r6, r7, 3
	ldr r0, _0809198C @ =gMonFrontPicTable
	adds r0, r6
	ldr r2, _08091990 @ =gMonFrontPicCoords
	lsls r1, r7, 2
	adds r2, r1
	ldrb r1, [r2]
	ldrb r2, [r2, 0x1]
	movs r3, 0x80
	lsls r3, 18
	ldr r4, _08091994 @ =gUnknown_083B5584
	mov r12, r4
	mov r5, r8
	lsls r4, r5, 2
	add r4, r12
	ldr r4, [r4]
	str r4, [sp]
	str r7, [sp, 0x4]
	ldr r4, _08091998 @ =gSaveBlock2
	ldr r4, [r4, 0x20]
	str r4, [sp, 0x8]
	movs r4, 0x1
	str r4, [sp, 0xC]
	bl sub_800D378
	b _080919CE
	.align 2, 0
_0809198C: .4byte gMonFrontPicTable
_08091990: .4byte gMonFrontPicCoords
_08091994: .4byte gUnknown_083B5584
_08091998: .4byte gSaveBlock2
_0809199C:
	lsls r6, r7, 3
	ldr r0, _08091A30 @ =gMonFrontPicTable
	adds r0, r6
	ldr r2, _08091A34 @ =gMonFrontPicCoords
	lsls r1, r7, 2
	adds r2, r1
	ldrb r1, [r2]
	ldrb r2, [r2, 0x1]
	movs r3, 0x80
	lsls r3, 18
	ldr r4, _08091A38 @ =gUnknown_083B5584
	mov r12, r4
	mov r5, r8
	lsls r4, r5, 2
	add r4, r12
	ldr r4, [r4]
	str r4, [sp]
	str r7, [sp, 0x4]
	ldr r4, _08091A3C @ =gSaveBlock2
	ldr r4, [r4, 0x1C]
	str r4, [sp, 0x8]
	movs r4, 0x1
	str r4, [sp, 0xC]
	bl sub_800D378
_080919CE:
	ldr r0, _08091A40 @ =gMonPaletteTable
	adds r0, r6, r0
	ldr r0, [r0]
	mov r1, r8
	lsls r4, r1, 4
	movs r2, 0x80
	lsls r2, 1
	adds r1, r4, r2
	lsls r1, 16
	lsrs r1, 16
	movs r2, 0x20
	bl LoadCompressedPalette
	mov r3, r8
	lsls r1, r3, 24
	lsrs r1, 24
	mov r0, r8
	bl sub_8091878
	ldr r0, _08091A44 @ =gUnknown_02024E8C
	mov r5, r9
	lsls r1, r5, 16
	asrs r1, 16
	mov r3, r10
	lsls r2, r3, 16
	asrs r2, 16
	movs r3, 0
	bl CreateSprite
	lsls r0, 24
	lsrs r0, 24
	ldr r1, _08091A48 @ =gSprites
	lsls r2, r0, 4
	adds r2, r0
	lsls r2, 2
	adds r2, r1
	ldrb r3, [r2, 0x5]
	movs r1, 0xF
	ands r1, r3
	orrs r1, r4
	strb r1, [r2, 0x5]
	add sp, 0x10
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r1}
	bx r1
	.align 2, 0
_08091A30: .4byte gMonFrontPicTable
_08091A34: .4byte gMonFrontPicCoords
_08091A38: .4byte gUnknown_083B5584
_08091A3C: .4byte gSaveBlock2
_08091A40: .4byte gMonPaletteTable
_08091A44: .4byte gUnknown_02024E8C
_08091A48: .4byte gSprites
	thumb_func_end sub_80918EC

	thumb_func_start sub_8091A4C
sub_8091A4C: @ 8091A4C
	push {r4-r6,lr}
	mov r6, r9
	mov r5, r8
	push {r5,r6}
	sub sp, 0x8
	adds r5, r0, 0
	adds r6, r1, 0
	mov r8, r2
	mov r9, r3
	lsls r5, 16
	lsrs r5, 16
	lsls r6, 16
	lsrs r6, 16
	mov r0, r8
	lsls r0, 16
	lsrs r0, 16
	mov r8, r0
	mov r1, r9
	lsls r1, 16
	lsrs r1, 16
	mov r9, r1
	lsls r0, r5, 3
	ldr r1, _08091AE4 @ =gTrainerFrontPicTable
	adds r0, r1
	ldr r1, _08091AE8 @ =gTrainerFrontPicCoords
	lsls r2, r5, 2
	adds r2, r1
	ldrb r1, [r2]
	ldrb r2, [r2, 0x1]
	movs r3, 0x80
	lsls r3, 18
	ldr r4, _08091AEC @ =gUnknown_083B5584
	ldr r4, [r4]
	str r4, [sp]
	str r5, [sp, 0x4]
	bl DecompressPicFromTable_2
	adds r0, r5, 0
	movs r1, 0
	bl sub_80918B0
	ldr r0, _08091AF0 @ =gUnknown_02024E8C
	lsls r6, 16
	asrs r6, 16
	mov r3, r8
	lsls r3, 16
	asrs r3, 16
	mov r8, r3
	adds r1, r6, 0
	mov r2, r8
	movs r3, 0
	bl CreateSprite
	lsls r0, 24
	lsrs r0, 24
	ldr r1, _08091AF4 @ =gSprites
	lsls r2, r0, 4
	adds r2, r0
	lsls r2, 2
	adds r2, r1
	mov r1, r9
	lsls r1, 4
	mov r9, r1
	ldrb r3, [r2, 0x5]
	movs r1, 0xF
	ands r1, r3
	mov r3, r9
	orrs r1, r3
	strb r1, [r2, 0x5]
	add sp, 0x8
	pop {r3,r4}
	mov r8, r3
	mov r9, r4
	pop {r4-r6}
	pop {r1}
	bx r1
	.align 2, 0
_08091AE4: .4byte gTrainerFrontPicTable
_08091AE8: .4byte gTrainerFrontPicCoords
_08091AEC: .4byte gUnknown_083B5584
_08091AF0: .4byte gUnknown_02024E8C
_08091AF4: .4byte gSprites
	thumb_func_end sub_8091A4C

	thumb_func_start sub_8091AF8
sub_8091AF8: @ 8091AF8
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	sub sp, 0x14
	ldr r4, [sp, 0x34]
	ldr r5, [sp, 0x38]
	lsls r0, 24
	lsrs r0, 24
	lsls r1, 24
	lsrs r1, 24
	lsls r2, 24
	lsrs r7, r2, 24
	lsls r3, 24
	lsrs r3, 24
	str r3, [sp, 0x4]
	lsls r4, 24
	lsrs r4, 24
	str r4, [sp, 0x8]
	lsls r5, 24
	lsrs r5, 24
	mov r10, r5
	bl sub_808D690
	movs r5, 0
	movs r6, 0
	ldr r4, _08091D08 @ =0x00000181
	ldr r3, _08091D0C @ =gUnknown_0202FFB4
_08091B32:
	ldr r2, [r3]
	lsls r0, r5, 2
	adds r1, r2, r0
	ldrb r0, [r1, 0x2]
	lsls r0, 31
	cmp r0, 0
	beq _08091B4E
	lsls r0, r6, 2
	adds r0, r2, r0
	ldr r1, [r1]
	str r1, [r0]
	adds r0, r6, 0x1
	lsls r0, 16
	lsrs r6, r0, 16
_08091B4E:
	adds r0, r5, 0x1
	lsls r0, 16
	lsrs r5, r0, 16
	cmp r5, r4
	bls _08091B32
	ldr r1, _08091D0C @ =gUnknown_0202FFB4
	ldr r0, [r1]
	ldr r2, _08091D10 @ =0x0000060c
	adds r0, r2
	adds r1, r6, 0
	strh r6, [r0]
	cmp r7, 0xFF
	beq _08091C04
	movs r5, 0
	lsls r0, r1, 16
	movs r6, 0
	cmp r0, 0
	beq _08091BFA
	lsls r7, 2
	ldr r0, _08091D14 @ =gUnknown_083B57BC
	adds r0, 0x3
	adds r0, r7, r0
	str r0, [sp, 0xC]
	ldr r0, _08091D14 @ =gUnknown_083B57BC
	adds r0, r7
	mov r9, r0
_08091B82:
	ldr r1, _08091D0C @ =gUnknown_0202FFB4
	ldr r0, [r1]
	lsls r4, r5, 2
	adds r0, r4
	ldrh r0, [r0]
	bl NationalPokedexNumToSpecies
	lsls r0, 16
	lsrs r2, r0, 16
	ldr r1, _08091D18 @ =gSpeciesNames
	movs r0, 0xB
	muls r0, r2
	adds r0, r1
	ldrb r2, [r0]
	adds r3, r2, 0
	mov r0, r9
	ldrb r0, [r0]
	cmp r2, r0
	bcc _08091BBA
	mov r1, r9
	ldrb r0, [r1]
	ldr r1, _08091D14 @ =gUnknown_083B57BC
	adds r1, 0x1
	adds r1, r7, r1
	ldrb r1, [r1]
	adds r0, r1
	cmp r2, r0
	blt _08091BD2
_08091BBA:
	ldr r0, _08091D14 @ =gUnknown_083B57BC
	adds r0, 0x2
	adds r0, r7, r0
	ldrb r2, [r0]
	cmp r3, r2
	bcc _08091BE6
	ldrb r1, [r0]
	ldr r2, [sp, 0xC]
	ldrb r0, [r2]
	adds r1, r0
	cmp r3, r1
	bge _08091BE6
_08091BD2:
	ldr r2, _08091D0C @ =gUnknown_0202FFB4
	ldr r0, [r2]
	lsls r1, r6, 2
	adds r1, r0, r1
	adds r0, r4
	ldr r0, [r0]
	str r0, [r1]
	adds r0, r6, 0x1
	lsls r0, 16
	lsrs r6, r0, 16
_08091BE6:
	adds r0, r5, 0x1
	lsls r0, 16
	lsrs r5, r0, 16
	ldr r1, _08091D0C @ =gUnknown_0202FFB4
	ldr r0, [r1]
	ldr r2, _08091D10 @ =0x0000060c
	adds r0, r2
	ldrh r0, [r0]
	cmp r5, r0
	bcc _08091B82
_08091BFA:
	ldr r1, _08091D0C @ =gUnknown_0202FFB4
	ldr r0, [r1]
	ldr r2, _08091D10 @ =0x0000060c
	adds r0, r2
	strh r6, [r0]
_08091C04:
	ldr r0, [sp, 0x4]
	cmp r0, 0xFF
	beq _08091C74
	movs r5, 0
	movs r6, 0
	ldr r1, _08091D0C @ =gUnknown_0202FFB4
	ldr r0, [r1]
	ldr r2, _08091D10 @ =0x0000060c
	adds r0, r2
	ldrh r0, [r0]
	cmp r6, r0
	bcs _08091C6A
	adds r7, r1, 0
	ldr r0, _08091D1C @ =gBaseStats
	mov r8, r0
_08091C22:
	ldr r0, [r7]
	lsls r4, r5, 2
	adds r0, r4
	ldrh r0, [r0]
	bl NationalPokedexNumToSpecies
	lsls r0, 16
	lsrs r2, r0, 16
	lsls r0, r2, 3
	subs r0, r2
	lsls r0, 2
	add r0, r8
	ldrb r0, [r0, 0x19]
	lsls r0, 25
	lsrs r0, 25
	ldr r1, [sp, 0x4]
	cmp r1, r0
	bne _08091C58
	ldr r0, [r7]
	lsls r1, r6, 2
	adds r1, r0, r1
	adds r0, r4
	ldr r0, [r0]
	str r0, [r1]
	adds r0, r6, 0x1
	lsls r0, 16
	lsrs r6, r0, 16
_08091C58:
	adds r0, r5, 0x1
	lsls r0, 16
	lsrs r5, r0, 16
	ldr r0, [r7]
	ldr r2, _08091D10 @ =0x0000060c
	adds r0, r2
	ldrh r0, [r0]
	cmp r5, r0
	bcc _08091C22
_08091C6A:
	ldr r1, _08091D0C @ =gUnknown_0202FFB4
	ldr r0, [r1]
	ldr r2, _08091D10 @ =0x0000060c
	adds r0, r2
	strh r6, [r0]
_08091C74:
	ldr r0, [sp, 0x8]
	cmp r0, 0xFF
	bne _08091C8A
	mov r1, r10
	cmp r1, 0xFF
	bne _08091C82
	b _08091DA6
_08091C82:
	mov r2, r10
	str r2, [sp, 0x8]
	movs r0, 0xFF
	mov r10, r0
_08091C8A:
	mov r1, r10
	cmp r1, 0xFF
	bne _08091D20
	movs r5, 0
	movs r6, 0
	ldr r2, _08091D0C @ =gUnknown_0202FFB4
	ldr r0, [r2]
	ldr r1, _08091D10 @ =0x0000060c
	adds r0, r1
	ldrh r0, [r0]
	cmp r6, r0
	bcs _08091D9C
	adds r3, r2, 0
	mov r7, sp
	mov r8, r2
_08091CA8:
	ldr r0, [r3]
	lsls r4, r5, 2
	adds r1, r0, r4
	ldrb r0, [r1, 0x2]
	lsls r0, 30
	cmp r0, 0
	bge _08091CF2
	ldrh r0, [r1]
	str r3, [sp, 0x10]
	bl NationalPokedexNumToSpecies
	lsls r0, 16
	lsrs r2, r0, 16
	ldr r1, _08091D1C @ =gBaseStats
	lsls r0, r2, 3
	subs r0, r2
	lsls r0, 2
	adds r0, r1
	ldrb r1, [r0, 0x6]
	strb r1, [r7]
	ldrb r0, [r0, 0x7]
	strb r0, [r7, 0x1]
	ldr r3, [sp, 0x10]
	ldr r2, [sp, 0x8]
	cmp r1, r2
	beq _08091CE0
	cmp r0, r2
	bne _08091CF2
_08091CE0:
	ldr r0, [r3]
	lsls r1, r6, 2
	adds r1, r0, r1
	adds r0, r4
	ldr r0, [r0]
	str r0, [r1]
	adds r0, r6, 0x1
	lsls r0, 16
	lsrs r6, r0, 16
_08091CF2:
	adds r0, r5, 0x1
	lsls r0, 16
	lsrs r5, r0, 16
	mov r1, r8
	ldr r0, [r1]
	ldr r2, _08091D10 @ =0x0000060c
	adds r0, r2
	ldrh r0, [r0]
	cmp r5, r0
	bcc _08091CA8
	b _08091D9C
	.align 2, 0
_08091D08: .4byte 0x00000181
_08091D0C: .4byte gUnknown_0202FFB4
_08091D10: .4byte 0x0000060c
_08091D14: .4byte gUnknown_083B57BC
_08091D18: .4byte gSpeciesNames
_08091D1C: .4byte gBaseStats
_08091D20:
	movs r5, 0
	movs r6, 0
	ldr r1, _08091E0C @ =gUnknown_0202FFB4
	ldr r0, [r1]
	ldr r2, _08091E10 @ =0x0000060c
	adds r0, r2
	ldrh r0, [r0]
	cmp r6, r0
	bcs _08091D9C
	mov r7, sp
_08091D34:
	ldr r0, [r1]
	lsls r1, r5, 2
	adds r2, r0, r1
	ldrb r0, [r2, 0x2]
	lsls r0, 30
	adds r4, r1, 0
	cmp r0, 0
	bge _08091D88
	ldrh r0, [r2]
	bl NationalPokedexNumToSpecies
	lsls r0, 16
	lsrs r2, r0, 16
	ldr r1, _08091E14 @ =gBaseStats
	lsls r0, r2, 3
	subs r0, r2
	lsls r0, 2
	adds r0, r1
	ldrb r1, [r0, 0x6]
	strb r1, [r7]
	ldrb r0, [r0, 0x7]
	strb r0, [r7, 0x1]
	ldr r2, [sp, 0x8]
	cmp r1, r2
	bne _08091D6A
	cmp r0, r10
	beq _08091D74
_08091D6A:
	cmp r1, r10
	bne _08091D88
	ldr r1, [sp, 0x8]
	cmp r0, r1
	bne _08091D88
_08091D74:
	ldr r2, _08091E0C @ =gUnknown_0202FFB4
	ldr r0, [r2]
	lsls r1, r6, 2
	adds r1, r0, r1
	adds r0, r4
	ldr r0, [r0]
	str r0, [r1]
	adds r0, r6, 0x1
	lsls r0, 16
	lsrs r6, r0, 16
_08091D88:
	adds r0, r5, 0x1
	lsls r0, 16
	lsrs r5, r0, 16
	ldr r1, _08091E0C @ =gUnknown_0202FFB4
	ldr r0, [r1]
	ldr r2, _08091E10 @ =0x0000060c
	adds r0, r2
	ldrh r0, [r0]
	cmp r5, r0
	bcc _08091D34
_08091D9C:
	ldr r1, _08091E0C @ =gUnknown_0202FFB4
	ldr r0, [r1]
	ldr r2, _08091E10 @ =0x0000060c
	adds r0, r2
	strh r6, [r0]
_08091DA6:
	ldr r1, _08091E0C @ =gUnknown_0202FFB4
	ldr r0, [r1]
	ldr r2, _08091E10 @ =0x0000060c
	adds r1, r0, r2
	ldrh r0, [r1]
	cmp r0, 0
	beq _08091DFA
	adds r5, r0, 0
	ldr r0, _08091E18 @ =0x00000181
	cmp r5, r0
	bhi _08091DFA
	ldr r4, _08091E0C @ =gUnknown_0202FFB4
	movs r1, 0x2
	negs r1, r1
	mov r10, r1
	movs r2, 0x3
	negs r2, r2
	mov r9, r2
	mov r8, r0
	ldr r0, _08091E1C @ =0x0000ffff
	adds r7, r0, 0
_08091DD0:
	ldr r1, [r4]
	lsls r3, r5, 2
	adds r1, r3
	ldrh r0, [r1]
	orrs r0, r7
	strh r0, [r1]
	ldrb r2, [r1, 0x2]
	mov r0, r10
	ands r0, r2
	strb r0, [r1, 0x2]
	ldr r1, [r4]
	adds r1, r3
	ldrb r2, [r1, 0x2]
	mov r0, r9
	ands r0, r2
	strb r0, [r1, 0x2]
	adds r0, r5, 0x1
	lsls r0, 16
	lsrs r5, r0, 16
	cmp r5, r8
	bls _08091DD0
_08091DFA:
	adds r0, r6, 0
	add sp, 0x14
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r1}
	bx r1
	.align 2, 0
_08091E0C: .4byte gUnknown_0202FFB4
_08091E10: .4byte 0x0000060c
_08091E14: .4byte gBaseStats
_08091E18: .4byte 0x00000181
_08091E1C: .4byte 0x0000ffff
	thumb_func_end sub_8091AF8

	thumb_func_start sub_8091E20
sub_8091E20: @ 8091E20
	push {lr}
	sub sp, 0x8
	movs r1, 0x20
	str r1, [sp]
	movs r1, 0x1
	str r1, [sp, 0x4]
	movs r1, 0x9
	movs r2, 0x78
	movs r3, 0xD0
	bl sub_8072AB0
	add sp, 0x8
	pop {r0}
	bx r0
	thumb_func_end sub_8091E20

	thumb_func_start sub_8091E3C
sub_8091E3C: @ 8091E3C
	push {lr}
	ldr r0, _08091E50 @ =sub_8091E54
	movs r1, 0
	bl CreateTask
	lsls r0, 24
	lsrs r0, 24
	pop {r1}
	bx r1
	.align 2, 0
_08091E50: .4byte sub_8091E54
	thumb_func_end sub_8091E3C

	thumb_func_start sub_8091E54
sub_8091E54: @ 8091E54
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	sub sp, 0x4
	lsls r0, 24
	lsrs r5, r0, 24
	ldr r1, _08091E78 @ =gMain
	ldr r2, _08091E7C @ =0x0000043c
	adds r0, r1, r2
	ldrb r0, [r0]
	adds r3, r1, 0
	cmp r0, 0x4
	bhi _08091E98
	lsls r0, 2
	ldr r1, _08091E80 @ =_08091E84
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_08091E78: .4byte gMain
_08091E7C: .4byte 0x0000043c
_08091E80: .4byte _08091E84
	.align 2, 0
_08091E84:
	.4byte _08091E98
	.4byte _08091F50
	.4byte _08091FC0
	.4byte _08091FE0
	.4byte _0809200C
_08091E98:
	ldr r0, _08091F1C @ =gPaletteFade
	ldrb r1, [r0, 0x7]
	movs r0, 0x80
	ands r0, r1
	cmp r0, 0
	beq _08091EA6
	b _08092030
_08091EA6:
	ldr r0, _08091F20 @ =gUnknown_0202FFB4
	ldr r0, [r0]
	ldr r1, _08091F24 @ =0x0000064a
	adds r0, r1
	movs r1, 0x2
	strb r1, [r0]
	movs r0, 0
	bl sub_8091060
	ldr r0, _08091F28 @ =gPokedexMenuSearch_Gfx
	movs r1, 0xC0
	lsls r1, 19
	bl LZ77UnCompVram
	ldr r0, _08091F2C @ =gUnknown_08E96D2C
	ldr r1, _08091F30 @ =0x06007800
	bl LZ77UnCompVram
	ldr r0, _08091F34 @ =gPokedexMenuSearch_Pal + 0x2
	movs r1, 0x1
	movs r2, 0x7E
	bl LoadPalette
	bl IsNationalPokedex
	cmp r0, 0
	bne _08091F10
	movs r4, 0
	ldr r2, _08091F38 @ =0x06007a80
	mov r8, r2
	ldr r0, _08091F3C @ =0x06007b00
	mov r12, r0
	movs r5, 0x1
	ldr r7, _08091F40 @ =0x06007ac0
	ldr r6, _08091F44 @ =0x06007b40
_08091EEC:
	lsls r1, r4, 1
	mov r0, r8
	adds r2, r1, r0
	mov r0, r12
	adds r3, r1, r0
	ldrh r0, [r3]
	strh r0, [r2]
	adds r2, r1, r7
	adds r1, r6
	ldrh r0, [r1]
	strh r0, [r2]
	strh r5, [r3]
	strh r5, [r1]
	adds r0, r4, 0x1
	lsls r0, 16
	lsrs r4, r0, 16
	cmp r4, 0x10
	bls _08091EEC
_08091F10:
	ldr r0, _08091F48 @ =gMain
	ldr r1, _08091F4C @ =0x0000043c
	adds r0, r1
	movs r1, 0x1
	strb r1, [r0]
	b _08092030
	.align 2, 0
_08091F1C: .4byte gPaletteFade
_08091F20: .4byte gUnknown_0202FFB4
_08091F24: .4byte 0x0000064a
_08091F28: .4byte gPokedexMenuSearch_Gfx
_08091F2C: .4byte gUnknown_08E96D2C
_08091F30: .4byte 0x06007800
_08091F34: .4byte gPokedexMenuSearch_Pal + 0x2
_08091F38: .4byte 0x06007a80
_08091F3C: .4byte 0x06007b00
_08091F40: .4byte 0x06007ac0
_08091F44: .4byte 0x06007b40
_08091F48: .4byte gMain
_08091F4C: .4byte 0x0000043c
_08091F50:
	ldr r4, _08091FA8 @ =gWindowConfig_81E7064
	adds r0, r4, 0
	bl SetUpWindowConfig
	adds r0, r4, 0
	bl InitMenuWindow
	ldr r0, _08091FAC @ =gUnknown_083A05CC
	bl LoadCompressedObjectPic
	ldr r0, _08091FB0 @ =gUnknown_083A05DC
	bl LoadSpritePalettes
	adds r0, r5, 0
	bl sub_809308C
	movs r4, 0
	lsls r0, r5, 2
	adds r0, r5
	lsls r1, r0, 3
	ldr r3, _08091FB4 @ =gTasks + 0x8
	movs r2, 0
_08091F7C:
	lsls r0, r4, 1
	adds r0, r1
	adds r0, r3
	strh r2, [r0]
	adds r0, r4, 0x1
	lsls r0, 16
	lsrs r4, r0, 16
	cmp r4, 0xF
	bls _08091F7C
	adds r0, r5, 0
	bl sub_8092EB0
	movs r0, 0
	bl sub_8092AB0
	adds r0, r5, 0
	bl sub_8092B68
	ldr r1, _08091FB8 @ =gMain
	ldr r2, _08091FBC @ =0x0000043c
	adds r1, r2
	b _08091FF6
	.align 2, 0
_08091FA8: .4byte gWindowConfig_81E7064
_08091FAC: .4byte gUnknown_083A05CC
_08091FB0: .4byte gUnknown_083A05DC
_08091FB4: .4byte gTasks + 0x8
_08091FB8: .4byte gMain
_08091FBC: .4byte 0x0000043c
_08091FC0:
	movs r0, 0x1
	negs r0, r0
	movs r1, 0
	str r1, [sp]
	movs r2, 0x10
	movs r3, 0
	bl BeginNormalPaletteFade
	ldr r1, _08091FD8 @ =gMain
	ldr r0, _08091FDC @ =0x0000043c
	adds r1, r0
	b _08091FF6
	.align 2, 0
_08091FD8: .4byte gMain
_08091FDC: .4byte 0x0000043c
_08091FE0:
	ldr r1, _08092000 @ =REG_BG3CNT
	ldr r2, _08092004 @ =0x00000f03
	adds r0, r2, 0
	strh r0, [r1]
	subs r1, 0xE
	movs r2, 0xE2
	lsls r2, 5
	adds r0, r2, 0
	strh r0, [r1]
	ldr r0, _08092008 @ =0x0000043c
	adds r1, r3, r0
_08091FF6:
	ldrb r0, [r1]
	adds r0, 0x1
	strb r0, [r1]
	b _08092030
	.align 2, 0
_08092000: .4byte REG_BG3CNT
_08092004: .4byte 0x00000f03
_08092008: .4byte 0x0000043c
_0809200C:
	ldr r0, _0809203C @ =gPaletteFade
	ldrb r1, [r0, 0x7]
	movs r0, 0x80
	ands r0, r1
	lsls r0, 24
	lsrs r2, r0, 24
	cmp r2, 0
	bne _08092030
	ldr r1, _08092040 @ =gTasks
	lsls r0, r5, 2
	adds r0, r5
	lsls r0, 3
	adds r0, r1
	ldr r1, _08092044 @ =sub_809204C
	str r1, [r0]
	ldr r1, _08092048 @ =0x0000043c
	adds r0, r3, r1
	strb r2, [r0]
_08092030:
	add sp, 0x4
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_0809203C: .4byte gPaletteFade
_08092040: .4byte gTasks
_08092044: .4byte sub_809204C
_08092048: .4byte 0x0000043c
	thumb_func_end sub_8091E54

	thumb_func_start sub_809204C
sub_809204C: @ 809204C
	push {r4,r5,lr}
	adds r5, r0, 0
	lsls r5, 24
	lsrs r5, 24
	ldr r0, _08092074 @ =gTasks
	lsls r4, r5, 2
	adds r4, r5
	lsls r4, 3
	adds r4, r0
	ldrb r0, [r4, 0x8]
	bl sub_8092AB0
	adds r0, r5, 0
	bl sub_8092B68
	ldr r0, _08092078 @ =sub_809207C
	str r0, [r4]
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_08092074: .4byte gTasks
_08092078: .4byte sub_809207C
	thumb_func_end sub_809204C

	thumb_func_start sub_809207C
sub_809207C: @ 809207C
	push {r4,r5,lr}
	lsls r0, 24
	lsrs r5, r0, 24
	ldr r0, _080920A4 @ =gMain
	ldrh r1, [r0, 0x2E]
	movs r0, 0x2
	ands r0, r1
	cmp r0, 0
	beq _080920B0
	movs r0, 0x3
	bl PlaySE
	ldr r0, _080920A8 @ =gTasks
	lsls r1, r5, 2
	adds r1, r5
	lsls r1, 3
	adds r1, r0
	ldr r0, _080920AC @ =sub_80927B8
	str r0, [r1]
	b _0809216C
	.align 2, 0
_080920A4: .4byte gMain
_080920A8: .4byte gTasks
_080920AC: .4byte sub_80927B8
_080920B0:
	movs r0, 0x1
	ands r0, r1
	cmp r0, 0
	beq _0809210C
	ldr r1, _080920D4 @ =gTasks
	lsls r0, r5, 2
	adds r0, r5
	lsls r0, 3
	adds r5, r0, r1
	movs r0, 0x8
	ldrsh r4, [r5, r0]
	cmp r4, 0x1
	beq _080920E8
	cmp r4, 0x1
	bgt _080920D8
	cmp r4, 0
	beq _080920DE
	b _0809216C
	.align 2, 0
_080920D4: .4byte gTasks
_080920D8:
	cmp r4, 0x2
	beq _080920FC
	b _0809216C
_080920DE:
	movs r0, 0x15
	bl PlaySE
	strh r4, [r5, 0xA]
	b _080920F2
_080920E8:
	movs r0, 0x15
	bl PlaySE
	movs r0, 0x4
	strh r0, [r5, 0xA]
_080920F2:
	ldr r0, _080920F8 @ =sub_809217C
	str r0, [r5]
	b _0809216C
	.align 2, 0
_080920F8: .4byte sub_809217C
_080920FC:
	movs r0, 0x3
	bl PlaySE
	ldr r0, _08092108 @ =sub_80927B8
	str r0, [r5]
	b _0809216C
	.align 2, 0
_08092108: .4byte sub_80927B8
_0809210C:
	movs r0, 0x20
	ands r0, r1
	cmp r0, 0
	beq _0809213A
	ldr r0, _08092174 @ =gTasks
	lsls r1, r5, 2
	adds r1, r5
	lsls r1, 3
	adds r4, r1, r0
	movs r1, 0x8
	ldrsh r0, [r4, r1]
	cmp r0, 0
	ble _0809213A
	movs r0, 0x6D
	bl PlaySE
	ldrh r0, [r4, 0x8]
	subs r0, 0x1
	strh r0, [r4, 0x8]
	lsls r0, 24
	lsrs r0, 24
	bl sub_8092AB0
_0809213A:
	ldr r0, _08092178 @ =gMain
	ldrh r1, [r0, 0x2E]
	movs r0, 0x10
	ands r0, r1
	cmp r0, 0
	beq _0809216C
	ldr r0, _08092174 @ =gTasks
	lsls r1, r5, 2
	adds r1, r5
	lsls r1, 3
	adds r4, r1, r0
	movs r1, 0x8
	ldrsh r0, [r4, r1]
	cmp r0, 0x1
	bgt _0809216C
	movs r0, 0x6D
	bl PlaySE
	ldrh r0, [r4, 0x8]
	adds r0, 0x1
	strh r0, [r4, 0x8]
	lsls r0, 24
	lsrs r0, 24
	bl sub_8092AB0
_0809216C:
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_08092174: .4byte gTasks
_08092178: .4byte gMain
	thumb_func_end sub_809207C

	thumb_func_start sub_809217C
sub_809217C: @ 809217C
	push {r4,r5,lr}
	adds r5, r0, 0
	lsls r5, 24
	lsrs r5, 24
	ldr r0, _080921A8 @ =gTasks
	lsls r4, r5, 2
	adds r4, r5
	lsls r4, 3
	adds r4, r0
	ldrb r0, [r4, 0x8]
	ldrb r1, [r4, 0xA]
	bl sub_8092AD4
	adds r0, r5, 0
	bl sub_8092B68
	ldr r0, _080921AC @ =sub_80921B0
	str r0, [r4]
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080921A8: .4byte gTasks
_080921AC: .4byte sub_80921B0
	thumb_func_end sub_809217C

	thumb_func_start sub_80921B0
sub_80921B0: @ 80921B0
	push {r4-r7,lr}
	lsls r0, 24
	lsrs r5, r0, 24
	ldr r1, _080921D8 @ =gTasks
	lsls r0, r5, 2
	adds r0, r5
	lsls r0, 3
	adds r0, r1
	movs r1, 0x8
	ldrsh r0, [r0, r1]
	cmp r0, 0
	beq _080921E4
	bl IsNationalPokedex
	ldr r6, _080921DC @ =gUnknown_083B586C
	cmp r0, 0
	bne _080921F0
	ldr r6, _080921E0 @ =gUnknown_083B58A4
	b _080921F0
	.align 2, 0
_080921D8: .4byte gTasks
_080921DC: .4byte gUnknown_083B586C
_080921E0: .4byte gUnknown_083B58A4
_080921E4:
	bl IsNationalPokedex
	ldr r6, _0809221C @ =gUnknown_083B5850
	cmp r0, 0
	bne _080921F0
	ldr r6, _08092220 @ =gUnknown_083B5888
_080921F0:
	ldr r0, _08092224 @ =gMain
	ldrh r1, [r0, 0x2E]
	movs r0, 0x2
	ands r0, r1
	lsls r0, 16
	lsrs r3, r0, 16
	cmp r3, 0
	beq _08092230
	movs r0, 0x17
	bl PlaySE
	adds r0, r5, 0
	bl sub_8092EB0
	ldr r0, _08092228 @ =gTasks
	lsls r1, r5, 2
	adds r1, r5
	lsls r1, 3
	adds r1, r0
	ldr r0, _0809222C @ =sub_809204C
	str r0, [r1]
	b _080923EC
	.align 2, 0
_0809221C: .4byte gUnknown_083B5850
_08092220: .4byte gUnknown_083B5888
_08092224: .4byte gMain
_08092228: .4byte gTasks
_0809222C: .4byte sub_809204C
_08092230:
	movs r0, 0x1
	ands r0, r1
	cmp r0, 0
	beq _08092300
	ldr r0, _080922B4 @ =gTasks
	lsls r1, r5, 2
	adds r1, r5
	lsls r1, 3
	adds r6, r1, r0
	movs r2, 0xA
	ldrsh r0, [r6, r2]
	cmp r0, 0x6
	bne _080922F0
	movs r1, 0x8
	ldrsh r0, [r6, r1]
	cmp r0, 0
	beq _080922D4
	ldr r1, _080922B8 @ =gUnknown_0202FFBA
	movs r0, 0x40
	strb r0, [r1]
	ldr r7, _080922BC @ =gUnknown_0202FFB4
	ldr r1, [r7]
	ldr r0, _080922C0 @ =0x0000062a
	adds r2, r1, r0
	movs r0, 0x40
	strh r0, [r2]
	ldr r0, _080922C4 @ =gUnknown_0202FFB8
	strh r3, [r0]
	movs r2, 0xC2
	lsls r2, 3
	adds r1, r2
	strh r3, [r1]
	adds r0, r5, 0
	movs r1, 0x5
	bl sub_8092E10
	ldr r4, _080922C8 @ =gSaveBlock2
	strb r0, [r4, 0x19]
	bl IsNationalPokedex
	cmp r0, 0
	bne _08092288
	movs r0, 0
	strb r0, [r4, 0x19]
_08092288:
	ldr r0, [r7]
	ldrb r1, [r4, 0x19]
	ldr r2, _080922CC @ =0x00000614
	adds r0, r2
	strh r1, [r0]
	adds r0, r5, 0
	movs r1, 0x4
	bl sub_8092E10
	strb r0, [r4, 0x18]
	ldr r0, [r7]
	ldrb r1, [r4, 0x18]
	movs r2, 0xC3
	lsls r2, 3
	adds r0, r2
	strh r1, [r0]
	movs r0, 0x3
	bl PlaySE
	ldr r0, _080922D0 @ =sub_80927B8
	str r0, [r6]
	b _080923EC
	.align 2, 0
_080922B4: .4byte gTasks
_080922B8: .4byte gUnknown_0202FFBA
_080922BC: .4byte gUnknown_0202FFB4
_080922C0: .4byte 0x0000062a
_080922C4: .4byte gUnknown_0202FFB8
_080922C8: .4byte gSaveBlock2
_080922CC: .4byte 0x00000614
_080922D0: .4byte sub_80927B8
_080922D4:
	ldr r0, _080922E8 @ =gDexText_Searching
	bl sub_8091E20
	ldr r0, _080922EC @ =sub_80923FC
	str r0, [r6]
	movs r0, 0x70
	bl PlaySE
	b _080923EC
	.align 2, 0
_080922E8: .4byte gDexText_Searching
_080922EC: .4byte sub_80923FC
_080922F0:
	movs r0, 0x15
	bl PlaySE
	ldr r0, _080922FC @ =sub_80925CC
	str r0, [r6]
	b _080923EC
	.align 2, 0
_080922FC: .4byte sub_80925CC
_08092300:
	movs r0, 0x20
	ands r0, r1
	cmp r0, 0
	beq _08092338
	ldr r1, _080923F4 @ =gTasks
	lsls r0, r5, 2
	adds r0, r5
	lsls r0, 3
	adds r4, r0, r1
	movs r1, 0xA
	ldrsh r0, [r4, r1]
	lsls r0, 2
	adds r0, r6
	ldrb r0, [r0]
	cmp r0, 0xFF
	beq _08092338
	movs r0, 0x5
	bl PlaySE
	movs r2, 0xA
	ldrsh r0, [r4, r2]
	lsls r0, 2
	adds r0, r6
	ldrb r1, [r0]
	strh r1, [r4, 0xA]
	ldrb r0, [r4, 0x8]
	bl sub_8092AD4
_08092338:
	ldr r0, _080923F8 @ =gMain
	ldrh r1, [r0, 0x2E]
	movs r0, 0x10
	ands r0, r1
	cmp r0, 0
	beq _08092374
	ldr r1, _080923F4 @ =gTasks
	lsls r0, r5, 2
	adds r0, r5
	lsls r0, 3
	adds r4, r0, r1
	movs r1, 0xA
	ldrsh r0, [r4, r1]
	lsls r0, 2
	adds r0, r6
	ldrb r0, [r0, 0x1]
	cmp r0, 0xFF
	beq _08092374
	movs r0, 0x5
	bl PlaySE
	movs r2, 0xA
	ldrsh r0, [r4, r2]
	lsls r0, 2
	adds r0, r6
	ldrb r1, [r0, 0x1]
	strh r1, [r4, 0xA]
	ldrb r0, [r4, 0x8]
	bl sub_8092AD4
_08092374:
	ldr r0, _080923F8 @ =gMain
	ldrh r1, [r0, 0x2E]
	movs r0, 0x40
	ands r0, r1
	cmp r0, 0
	beq _080923B0
	ldr r1, _080923F4 @ =gTasks
	lsls r0, r5, 2
	adds r0, r5
	lsls r0, 3
	adds r4, r0, r1
	movs r1, 0xA
	ldrsh r0, [r4, r1]
	lsls r0, 2
	adds r0, r6
	ldrb r0, [r0, 0x2]
	cmp r0, 0xFF
	beq _080923B0
	movs r0, 0x5
	bl PlaySE
	movs r2, 0xA
	ldrsh r0, [r4, r2]
	lsls r0, 2
	adds r0, r6
	ldrb r1, [r0, 0x2]
	strh r1, [r4, 0xA]
	ldrb r0, [r4, 0x8]
	bl sub_8092AD4
_080923B0:
	ldr r0, _080923F8 @ =gMain
	ldrh r1, [r0, 0x2E]
	movs r0, 0x80
	ands r0, r1
	cmp r0, 0
	beq _080923EC
	ldr r1, _080923F4 @ =gTasks
	lsls r0, r5, 2
	adds r0, r5
	lsls r0, 3
	adds r4, r0, r1
	movs r1, 0xA
	ldrsh r0, [r4, r1]
	lsls r0, 2
	adds r0, r6
	ldrb r0, [r0, 0x3]
	cmp r0, 0xFF
	beq _080923EC
	movs r0, 0x5
	bl PlaySE
	movs r2, 0xA
	ldrsh r0, [r4, r2]
	lsls r0, 2
	adds r0, r6
	ldrb r1, [r0, 0x3]
	strh r1, [r4, 0xA]
	ldrb r0, [r4, 0x8]
	bl sub_8092AD4
_080923EC:
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080923F4: .4byte gTasks
_080923F8: .4byte gMain
	thumb_func_end sub_80921B0

	thumb_func_start sub_80923FC
sub_80923FC: @ 80923FC
	push {r4-r6,lr}
	mov r6, r10
	mov r5, r9
	mov r4, r8
	push {r4-r6}
	sub sp, 0x8
	adds r5, r0, 0
	lsls r5, 24
	lsrs r5, 24
	adds r0, r5, 0
	movs r1, 0x5
	bl sub_8092E10
	mov r10, r0
	mov r0, r10
	lsls r0, 24
	lsrs r0, 24
	mov r10, r0
	adds r0, r5, 0
	movs r1, 0x4
	bl sub_8092E10
	mov r9, r0
	mov r0, r9
	lsls r0, 24
	lsrs r0, 24
	mov r9, r0
	adds r0, r5, 0
	movs r1, 0
	bl sub_8092E10
	mov r8, r0
	mov r0, r8
	lsls r0, 24
	lsrs r0, 24
	mov r8, r0
	adds r0, r5, 0
	movs r1, 0x1
	bl sub_8092E10
	adds r6, r0, 0
	lsls r6, 24
	lsrs r6, 24
	adds r0, r5, 0
	movs r1, 0x2
	bl sub_8092E10
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	adds r0, r5, 0
	movs r1, 0x3
	bl sub_8092E10
	lsls r0, 24
	lsrs r0, 24
	str r4, [sp]
	str r0, [sp, 0x4]
	mov r0, r10
	mov r1, r9
	mov r2, r8
	adds r3, r6, 0
	bl sub_8091AF8
	ldr r1, _0809249C @ =gTasks
	lsls r0, r5, 2
	adds r0, r5
	lsls r0, 3
	adds r0, r1
	ldr r1, _080924A0 @ =sub_80924A4
	str r1, [r0]
	add sp, 0x8
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_0809249C: .4byte gTasks
_080924A0: .4byte sub_80924A4
	thumb_func_end sub_80923FC

	thumb_func_start sub_80924A4
sub_80924A4: @ 80924A4
	push {r4,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	bl IsSEPlaying
	lsls r0, 24
	cmp r0, 0
	bne _080924F6
	ldr r0, _080924D0 @ =gUnknown_0202FFB4
	ldr r0, [r0]
	ldr r1, _080924D4 @ =0x0000060c
	adds r0, r1
	ldrh r0, [r0]
	cmp r0, 0
	beq _080924DC
	movs r0, 0x1F
	bl PlaySE
	ldr r0, _080924D8 @ =gDexText_SearchComplete
	bl sub_8091E20
	b _080924E8
	.align 2, 0
_080924D0: .4byte gUnknown_0202FFB4
_080924D4: .4byte 0x0000060c
_080924D8: .4byte gDexText_SearchComplete
_080924DC:
	movs r0, 0x20
	bl PlaySE
	ldr r0, _080924FC @ =gDexText_NoMatching
	bl sub_8091E20
_080924E8:
	ldr r0, _08092500 @ =gTasks
	lsls r1, r4, 2
	adds r1, r4
	lsls r1, 3
	adds r1, r0
	ldr r0, _08092504 @ =sub_8092508
	str r0, [r1]
_080924F6:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080924FC: .4byte gDexText_NoMatching
_08092500: .4byte gTasks
_08092504: .4byte sub_8092508
	thumb_func_end sub_80924A4

	thumb_func_start sub_8092508
sub_8092508: @ 8092508
	push {r4,r5,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	adds r2, r4, 0
	ldr r0, _08092570 @ =gMain
	ldrh r1, [r0, 0x2E]
	movs r0, 0x1
	ands r0, r1
	cmp r0, 0
	beq _080925A4
	ldr r5, _08092574 @ =gUnknown_0202FFB4
	ldr r1, [r5]
	ldr r3, _08092578 @ =0x0000060c
	adds r0, r1, r3
	ldrh r0, [r0]
	cmp r0, 0
	beq _08092590
	ldr r0, _0809257C @ =0x0000064f
	adds r1, r0
	movs r0, 0x1
	strb r0, [r1]
	adds r0, r4, 0
	movs r1, 0x5
	bl sub_8092E10
	ldr r1, [r5]
	lsls r0, 24
	lsrs r0, 24
	ldr r2, _08092580 @ =0x00000612
	adds r1, r2
	strh r0, [r1]
	adds r0, r4, 0
	movs r1, 0x4
	bl sub_8092E10
	ldr r1, [r5]
	lsls r0, 24
	lsrs r0, 24
	ldr r3, _08092584 @ =0x00000616
	adds r1, r3
	strh r0, [r1]
	ldr r1, _08092588 @ =gTasks
	lsls r0, r4, 2
	adds r0, r4
	lsls r0, 3
	adds r0, r1
	ldr r1, _0809258C @ =sub_80927B8
	str r1, [r0]
	movs r0, 0x3
	bl PlaySE
	b _080925A4
	.align 2, 0
_08092570: .4byte gMain
_08092574: .4byte gUnknown_0202FFB4
_08092578: .4byte 0x0000060c
_0809257C: .4byte 0x0000064f
_08092580: .4byte 0x00000612
_08092584: .4byte 0x00000616
_08092588: .4byte gTasks
_0809258C: .4byte sub_80927B8
_08092590:
	ldr r0, _080925AC @ =gTasks
	lsls r1, r2, 2
	adds r1, r2
	lsls r1, 3
	adds r1, r0
	ldr r0, _080925B0 @ =sub_809217C
	str r0, [r1]
	movs r0, 0x17
	bl PlaySE
_080925A4:
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080925AC: .4byte gTasks
_080925B0: .4byte sub_809217C
	thumb_func_end sub_8092508

	thumb_func_start sub_80925B4
sub_80925B4: @ 80925B4
	push {lr}
	adds r1, r0, 0
	lsls r1, 16
	lsrs r1, 15
	adds r1, 0x1
	lsls r1, 27
	lsrs r1, 24
	movs r0, 0x90
	bl sub_814AD7C
	pop {r0}
	bx r0
	thumb_func_end sub_80925B4

	thumb_func_start sub_80925CC
sub_80925CC: @ 80925CC
	push {r4-r6,lr}
	sub sp, 0x4
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	movs r0, 0
	bl sub_8092C8C
	ldr r2, _08092630 @ =gTasks
	lsls r1, r4, 2
	adds r1, r4
	lsls r1, 3
	adds r6, r1, r2
	ldrb r0, [r6, 0xA]
	adds r2, 0x8
	adds r1, r2
	ldr r2, _08092634 @ =gUnknown_083B5A7C
	lsls r0, 3
	adds r0, r2
	ldrb r5, [r0, 0x4]
	lsls r5, 1
	adds r5, r1, r5
	ldrb r0, [r0, 0x5]
	lsls r0, 1
	adds r1, r0
	ldrh r0, [r5]
	strh r0, [r6, 0x24]
	ldrh r0, [r1]
	strh r0, [r6, 0x26]
	adds r0, r4, 0
	bl sub_8092D78
	ldr r1, _08092638 @ =0x0000ffff
	ldr r3, _0809263C @ =0x00002d9f
	movs r0, 0xB
	str r0, [sp]
	movs r0, 0x10
	movs r2, 0xC
	bl CreateBlendedOutlineCursor
	ldrh r0, [r5]
	movs r1, 0x1
	bl sub_80925B4
	ldr r0, _08092640 @ =sub_8092644
	str r0, [r6]
	add sp, 0x4
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_08092630: .4byte gTasks
_08092634: .4byte gUnknown_083B5A7C
_08092638: .4byte 0x0000ffff
_0809263C: .4byte 0x00002d9f
_08092640: .4byte sub_8092644
	thumb_func_end sub_80925CC

	thumb_func_start sub_8092644
sub_8092644: @ 8092644
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	lsls r0, 24
	lsrs r7, r0, 24
	ldr r3, _080926A8 @ =gTasks
	lsls r2, r7, 2
	adds r2, r7
	lsls r2, 3
	adds r6, r2, r3
	ldrb r1, [r6, 0xA]
	ldr r0, _080926AC @ =gUnknown_083B5A7C
	lsls r1, 3
	adds r1, r0
	ldr r0, [r1]
	mov r8, r0
	adds r3, 0x8
	adds r2, r3
	ldrb r0, [r1, 0x4]
	lsls r0, 1
	adds r4, r2, r0
	ldrb r0, [r1, 0x5]
	lsls r0, 1
	adds r5, r2, r0
	ldrh r0, [r1, 0x6]
	subs r0, 0x1
	lsls r0, 16
	lsrs r2, r0, 16
	ldr r0, _080926B0 @ =gMain
	mov r12, r0
	ldrh r1, [r0, 0x2E]
	movs r0, 0x1
	ands r0, r1
	cmp r0, 0
	beq _080926B4
	bl sub_814ADC8
	movs r0, 0x15
	bl PlaySE
	movs r0, 0x12
	movs r1, 0x1
	movs r2, 0x1C
	movs r3, 0xC
	bl MenuZeroFillWindowRect
	movs r0, 0x1
	bl sub_8092C8C
	b _080926E0
	.align 2, 0
_080926A8: .4byte gTasks
_080926AC: .4byte gUnknown_083B5A7C
_080926B0: .4byte gMain
_080926B4:
	movs r0, 0x2
	ands r0, r1
	cmp r0, 0
	beq _080926EC
	bl sub_814ADC8
	movs r0, 0x17
	bl PlaySE
	movs r0, 0x12
	movs r1, 0x1
	movs r2, 0x1C
	movs r3, 0xC
	bl MenuZeroFillWindowRect
	movs r0, 0x1
	bl sub_8092C8C
	ldrh r0, [r6, 0x24]
	strh r0, [r4]
	ldrh r0, [r6, 0x26]
	strh r0, [r5]
_080926E0:
	ldr r0, _080926E8 @ =sub_809217C
	str r0, [r6]
	b _080927AE
	.align 2, 0
_080926E8: .4byte sub_809217C
_080926EC:
	movs r3, 0
	mov r0, r12
	ldrh r1, [r0, 0x30]
	movs r0, 0x40
	ands r0, r1
	cmp r0, 0
	beq _0809274C
	ldrh r0, [r4]
	cmp r0, 0
	beq _08092716
	movs r1, 0
	bl sub_80925B4
	ldrh r0, [r4]
	subs r0, 0x1
	strh r0, [r4]
	ldrh r0, [r4]
	movs r1, 0x1
	bl sub_80925B4
	b _08092734
_08092716:
	ldrh r0, [r5]
	cmp r0, 0
	beq _08092730
	subs r0, 0x1
	strh r0, [r5]
	adds r0, r7, 0
	bl sub_8092D78
	ldrh r0, [r4]
	movs r1, 0x1
	bl sub_80925B4
	movs r3, 0x1
_08092730:
	cmp r3, 0
	beq _080927AE
_08092734:
	movs r0, 0x5
	bl PlaySE
	ldrh r0, [r4]
	ldrh r1, [r5]
	adds r0, r1
	lsls r0, 3
	add r0, r8
	ldr r0, [r0]
	bl sub_8091E20
	b _080927AE
_0809274C:
	movs r0, 0x80
	ands r0, r1
	cmp r0, 0
	beq _080927AE
	ldrh r0, [r4]
	cmp r0, 0x4
	bhi _08092774
	cmp r0, r2
	bcs _08092774
	movs r1, 0
	bl sub_80925B4
	ldrh r0, [r4]
	adds r0, 0x1
	strh r0, [r4]
	ldrh r0, [r4]
	movs r1, 0x1
	bl sub_80925B4
	b _08092798
_08092774:
	cmp r2, 0x5
	bls _08092794
	ldrh r1, [r5]
	subs r0, r2, 0x5
	cmp r1, r0
	bge _08092794
	adds r0, r1, 0x1
	strh r0, [r5]
	adds r0, r7, 0
	bl sub_8092D78
	movs r0, 0x5
	movs r1, 0x1
	bl sub_80925B4
	movs r3, 0x1
_08092794:
	cmp r3, 0
	beq _080927AE
_08092798:
	movs r0, 0x5
	bl PlaySE
	ldrh r0, [r4]
	ldrh r1, [r5]
	adds r0, r1
	lsls r0, 3
	add r0, r8
	ldr r0, [r0]
	bl sub_8091E20
_080927AE:
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r0}
	bx r0
	thumb_func_end sub_8092644

	thumb_func_start sub_80927B8
sub_80927B8: @ 80927B8
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
	ldr r1, _080927E8 @ =gTasks
	lsls r0, r4, 2
	adds r0, r4
	lsls r0, 3
	adds r0, r1
	ldr r1, _080927EC @ =sub_80927F0
	str r1, [r0]
	add sp, 0x4
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080927E8: .4byte gTasks
_080927EC: .4byte sub_80927F0
	thumb_func_end sub_80927B8

	thumb_func_start sub_80927F0
sub_80927F0: @ 80927F0
	push {lr}
	lsls r0, 24
	lsrs r2, r0, 24
	ldr r0, _0809280C @ =gPaletteFade
	ldrb r1, [r0, 0x7]
	movs r0, 0x80
	ands r0, r1
	cmp r0, 0
	bne _08092808
	adds r0, r2, 0
	bl DestroyTask
_08092808:
	pop {r0}
	bx r0
	.align 2, 0
_0809280C: .4byte gPaletteFade
	thumb_func_end sub_80927F0

	thumb_func_start sub_8092810
sub_8092810: @ 8092810
	push {r4-r7,lr}
	lsls r0, 24
	lsrs r0, 24
	lsls r1, 24
	lsrs r1, 24
	mov r12, r1
	lsls r2, 24
	lsrs r1, r2, 24
	lsls r3, 24
	lsrs r5, r3, 8
	movs r3, 0
	cmp r5, 0
	beq _0809285A
	lsls r7, r1, 6
	ldr r6, _08092860 @ =0x00000fff
	lsls r4, r0, 12
_08092830:
	mov r0, r12
	adds r1, r0, r3
	lsls r1, 1
	adds r1, r7, r1
	ldr r0, _08092864 @ =0x06007800
	adds r2, r1, r0
	ldrh r0, [r2]
	ands r0, r6
	orrs r0, r4
	strh r0, [r2]
	ldr r0, _08092868 @ =0x06007840
	adds r1, r0
	ldrh r0, [r1]
	ands r0, r6
	orrs r0, r4
	strh r0, [r1]
	adds r0, r3, 0x1
	lsls r0, 16
	lsrs r3, r0, 16
	cmp r0, r5
	bcc _08092830
_0809285A:
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_08092860: .4byte 0x00000fff
_08092864: .4byte 0x06007800
_08092868: .4byte 0x06007840
	thumb_func_end sub_8092810

	thumb_func_start sub_809286C
sub_809286C: @ 809286C
	push {r4,r5,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	lsls r1, 24
	lsrs r5, r1, 24
	lsls r2, 24
	lsrs r2, 24
	movs r0, 0x1
	ands r5, r0
	ands r2, r0
	lsls r2, 1
	orrs r5, r2
	cmp r4, 0xA
	bhi _08092958
	lsls r0, r4, 2
	ldr r1, _08092894 @ =_08092898
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_08092894: .4byte _08092898
	.align 2, 0
_08092898:
	.4byte _080928C4
	.4byte _080928C4
	.4byte _080928C4
	.4byte _080928D4
	.4byte _080928D4
	.4byte _080928EC
	.4byte _080928EC
	.4byte _080928D4
	.4byte _080928D4
	.4byte _08092914
	.4byte _08092904
_080928C4:
	ldr r1, _080928D0 @ =gUnknown_083B57E4
	lsls r0, r4, 3
	adds r0, r1
	ldrb r1, [r0, 0x4]
	ldrb r2, [r0, 0x5]
	b _08092932
	.align 2, 0
_080928D0: .4byte gUnknown_083B57E4
_080928D4:
	ldr r2, _08092900 @ =gUnknown_083B57FC
	subs r1, r4, 0x3
	lsls r0, r1, 1
	adds r0, r1
	lsls r0, 2
	adds r0, r2
	ldrb r1, [r0, 0x4]
	ldrb r2, [r0, 0x5]
	ldrb r3, [r0, 0x6]
	adds r0, r5, 0
	bl sub_8092810
_080928EC:
	ldr r2, _08092900 @ =gUnknown_083B57FC
	subs r1, r4, 0x3
	lsls r0, r1, 1
	adds r0, r1
	lsls r0, 2
	adds r0, r2
	ldrb r1, [r0, 0x7]
	ldrb r2, [r0, 0x8]
	ldrb r3, [r0, 0x9]
	b _08092934
	.align 2, 0
_08092900: .4byte gUnknown_083B57FC
_08092904:
	ldr r0, _08092910 @ =gUnknown_083B57FC
	ldrb r1, [r0, 0x1C]
	ldrb r2, [r0, 0x1D]
	ldrb r3, [r0, 0x1E]
	b _08092934
	.align 2, 0
_08092910: .4byte gUnknown_083B57FC
_08092914:
	bl IsNationalPokedex
	cmp r0, 0
	bne _08092940
	ldr r2, _0809293C @ =gUnknown_083B57FC
	subs r1, r4, 0x3
	lsls r0, r1, 1
	adds r0, r1
	lsls r0, 2
	adds r0, r2
	ldrb r1, [r0, 0x4]
	ldrb r2, [r0, 0x5]
	subs r2, 0x2
	lsls r2, 24
	lsrs r2, 24
_08092932:
	ldrb r3, [r0, 0x6]
_08092934:
	adds r0, r5, 0
	bl sub_8092810
	b _08092958
	.align 2, 0
_0809293C: .4byte gUnknown_083B57FC
_08092940:
	ldr r2, _08092960 @ =gUnknown_083B57FC
	subs r1, r4, 0x3
	lsls r0, r1, 1
	adds r0, r1
	lsls r0, 2
	adds r0, r2
	ldrb r1, [r0, 0x4]
	ldrb r2, [r0, 0x5]
	ldrb r3, [r0, 0x6]
	adds r0, r5, 0
	bl sub_8092810
_08092958:
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_08092960: .4byte gUnknown_083B57FC
	thumb_func_end sub_809286C

	thumb_func_start sub_8092964
sub_8092964: @ 8092964
	push {lr}
	lsls r0, 24
	lsrs r0, 24
	adds r1, r0, 0
	cmp r0, 0x1
	beq _080929CE
	cmp r0, 0x1
	bgt _0809297A
	cmp r0, 0
	beq _08092980
	b _08092AAC
_0809297A:
	cmp r1, 0x2
	beq _08092A3E
	b _08092AAC
_08092980:
	movs r0, 0
	movs r1, 0
	movs r2, 0
	bl sub_809286C
	movs r0, 0x1
	movs r1, 0x1
	movs r2, 0
	bl sub_809286C
	movs r0, 0x2
	movs r1, 0x1
	movs r2, 0
	bl sub_809286C
	movs r0, 0x3
	movs r1, 0x1
	movs r2, 0
	bl sub_809286C
	movs r0, 0x4
	movs r1, 0x1
	movs r2, 0
	bl sub_809286C
	movs r0, 0xA
	movs r1, 0x1
	movs r2, 0
	bl sub_809286C
	movs r0, 0x5
	movs r1, 0x1
	movs r2, 0
	bl sub_809286C
	movs r0, 0x6
	movs r1, 0x1
	movs r2, 0
	b _08092A1A
_080929CE:
	movs r0, 0
	movs r1, 0x1
	movs r2, 0
	bl sub_809286C
	movs r0, 0x1
	movs r1, 0
	movs r2, 0
	bl sub_809286C
	movs r0, 0x2
	movs r1, 0x1
	movs r2, 0
	bl sub_809286C
	movs r0, 0x3
	movs r1, 0x1
	movs r2, 0x1
	bl sub_809286C
	movs r0, 0x4
	movs r1, 0x1
	movs r2, 0x1
	bl sub_809286C
	movs r0, 0xA
	movs r1, 0x1
	movs r2, 0x1
	bl sub_809286C
	movs r0, 0x5
	movs r1, 0x1
	movs r2, 0x1
	bl sub_809286C
	movs r0, 0x6
	movs r1, 0x1
	movs r2, 0x1
_08092A1A:
	bl sub_809286C
	movs r0, 0x7
	movs r1, 0x1
	movs r2, 0
	bl sub_809286C
	movs r0, 0x8
	movs r1, 0x1
	movs r2, 0
	bl sub_809286C
	movs r0, 0x9
	movs r1, 0x1
	movs r2, 0
	bl sub_809286C
	b _08092AAC
_08092A3E:
	movs r0, 0
	movs r1, 0x1
	movs r2, 0
	bl sub_809286C
	movs r0, 0x1
	movs r1, 0x1
	movs r2, 0
	bl sub_809286C
	movs r0, 0x2
	movs r1, 0
	movs r2, 0
	bl sub_809286C
	movs r0, 0x3
	movs r1, 0x1
	movs r2, 0x1
	bl sub_809286C
	movs r0, 0x4
	movs r1, 0x1
	movs r2, 0x1
	bl sub_809286C
	movs r0, 0xA
	movs r1, 0x1
	movs r2, 0x1
	bl sub_809286C
	movs r0, 0x5
	movs r1, 0x1
	movs r2, 0x1
	bl sub_809286C
	movs r0, 0x6
	movs r1, 0x1
	movs r2, 0x1
	bl sub_809286C
	movs r0, 0x7
	movs r1, 0x1
	movs r2, 0x1
	bl sub_809286C
	movs r0, 0x8
	movs r1, 0x1
	movs r2, 0x1
	bl sub_809286C
	movs r0, 0x9
	movs r1, 0x1
	movs r2, 0x1
	bl sub_809286C
_08092AAC:
	pop {r0}
	bx r0
	thumb_func_end sub_8092964

	thumb_func_start sub_8092AB0
sub_8092AB0: @ 8092AB0
	push {r4,lr}
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	adds r0, r4, 0
	bl sub_8092964
	ldr r0, _08092AD0 @ =gUnknown_083B57E4
	lsls r4, 3
	adds r4, r0
	ldr r0, [r4]
	bl sub_8091E20
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08092AD0: .4byte gUnknown_083B57E4
	thumb_func_end sub_8092AB0

	thumb_func_start sub_8092AD4
sub_8092AD4: @ 8092AD4
	push {r4,lr}
	lsls r0, 24
	lsrs r0, 24
	lsls r1, 24
	lsrs r4, r1, 24
	bl sub_8092964
	cmp r4, 0x6
	bhi _08092B4E
	lsls r0, r4, 2
	ldr r1, _08092AF0 @ =_08092AF4
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_08092AF0: .4byte _08092AF4
	.align 2, 0
_08092AF4:
	.4byte _08092B10
	.4byte _08092B14
	.4byte _08092B18
	.4byte _08092B26
	.4byte _08092B34
	.4byte _08092B38
	.4byte _08092B44
_08092B10:
	movs r0, 0x3
	b _08092B3A
_08092B14:
	movs r0, 0x4
	b _08092B3A
_08092B18:
	movs r0, 0xA
	movs r1, 0
	movs r2, 0
	bl sub_809286C
	movs r0, 0x5
	b _08092B3A
_08092B26:
	movs r0, 0xA
	movs r1, 0
	movs r2, 0
	bl sub_809286C
	movs r0, 0x6
	b _08092B3A
_08092B34:
	movs r0, 0x7
	b _08092B3A
_08092B38:
	movs r0, 0x8
_08092B3A:
	movs r1, 0
	movs r2, 0
	bl sub_809286C
	b _08092B4E
_08092B44:
	movs r0, 0x9
	movs r1, 0
	movs r2, 0
	bl sub_809286C
_08092B4E:
	ldr r0, _08092B64 @ =gUnknown_083B57FC
	lsls r1, r4, 1
	adds r1, r4
	lsls r1, 2
	adds r1, r0
	ldr r0, [r1]
	bl sub_8091E20
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08092B64: .4byte gUnknown_083B57FC
	thumb_func_end sub_8092AD4

	thumb_func_start sub_8092B68
sub_8092B68: @ 8092B68
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	lsls r0, 24
	lsrs r0, 24
	ldr r2, _08092C68 @ =gTasks
	lsls r1, r0, 2
	adds r1, r0
	lsls r1, 3
	adds r6, r1, r2
	ldrh r0, [r6, 0x16]
	ldrh r1, [r6, 0x14]
	adds r0, r1
	lsls r0, 16
	ldr r7, _08092C6C @ =gStringVar1
	ldr r1, _08092C70 @ =gUnknown_083B5910
	lsrs r0, 13
	adds r1, 0x4
	adds r0, r1
	ldr r1, [r0]
	adds r0, r7, 0
	bl StringCopy
	ldr r0, _08092C74 @ =gUnknown_083B5AB2
	mov r8, r0
	movs r1, 0x2D
	movs r2, 0x10
	movs r3, 0x1
	bl MenuPrint_PixelCoords
	ldrh r0, [r6, 0x1A]
	ldrh r1, [r6, 0x18]
	adds r0, r1
	lsls r0, 16
	ldr r1, _08092C78 @ =gUnknown_083B5968
	lsrs r0, 13
	adds r1, 0x4
	adds r0, r1
	ldr r1, [r0]
	adds r0, r7, 0
	bl StringCopy
	mov r0, r8
	movs r1, 0x2D
	movs r2, 0x20
	movs r3, 0x1
	bl MenuPrint_PixelCoords
	ldrh r0, [r6, 0x1E]
	ldrh r1, [r6, 0x1C]
	adds r0, r1
	lsls r0, 16
	ldr r4, _08092C7C @ =gUnknown_083B59C8
	lsrs r0, 13
	adds r4, 0x4
	adds r0, r4
	ldr r1, [r0]
	adds r0, r7, 0
	bl StringCopy
	ldr r5, _08092C80 @ =gUnknown_083B5AAC
	adds r0, r5, 0
	movs r1, 0x2D
	movs r2, 0x30
	movs r3, 0x1
	bl MenuPrint_PixelCoords
	ldrh r0, [r6, 0x22]
	ldrh r1, [r6, 0x20]
	adds r0, r1
	lsls r0, 16
	lsrs r0, 13
	adds r0, r4
	ldr r1, [r0]
	adds r0, r7, 0
	bl StringCopy
	adds r0, r5, 0
	movs r1, 0x5D
	movs r2, 0x30
	movs r3, 0x1
	bl MenuPrint_PixelCoords
	ldrh r0, [r6, 0x12]
	ldrh r1, [r6, 0x10]
	adds r0, r1
	lsls r0, 16
	ldr r1, _08092C84 @ =gUnknown_083B58D8
	lsrs r0, 13
	adds r1, 0x4
	adds r0, r1
	ldr r1, [r0]
	adds r0, r7, 0
	bl StringCopy
	mov r0, r8
	movs r1, 0x2D
	movs r2, 0x40
	movs r3, 0x1
	bl MenuPrint_PixelCoords
	bl IsNationalPokedex
	cmp r0, 0
	beq _08092C5E
	ldrh r0, [r6, 0xE]
	ldrh r6, [r6, 0xC]
	adds r0, r6
	lsls r0, 16
	ldr r1, _08092C88 @ =gUnknown_083B58C0
	lsrs r0, 13
	adds r1, 0x4
	adds r0, r1
	ldr r1, [r0]
	adds r0, r7, 0
	bl StringCopy
	mov r0, r8
	movs r1, 0x2D
	movs r2, 0x50
	movs r3, 0x1
	bl MenuPrint_PixelCoords
_08092C5E:
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_08092C68: .4byte gTasks
_08092C6C: .4byte gStringVar1
_08092C70: .4byte gUnknown_083B5910
_08092C74: .4byte gUnknown_083B5AB2
_08092C78: .4byte gUnknown_083B5968
_08092C7C: .4byte gUnknown_083B59C8
_08092C80: .4byte gUnknown_083B5AAC
_08092C84: .4byte gUnknown_083B58D8
_08092C88: .4byte gUnknown_083B58C0
	thumb_func_end sub_8092B68

	thumb_func_start sub_8092C8C
sub_8092C8C: @ 8092C8C
	push {r4-r6,lr}
	lsls r0, 24
	cmp r0, 0
	bne _08092D48
	ldr r1, _08092D1C @ =0x06007822
	ldr r2, _08092D20 @ =0x00000c0b
	adds r0, r2, 0
	strh r0, [r1]
	movs r1, 0x12
	ldr r3, _08092D24 @ =0x06007800
	ldr r4, _08092D28 @ =0x0000080d
	adds r2, r4, 0
_08092CA4:
	lsls r0, r1, 1
	adds r0, r3
	strh r2, [r0]
	adds r0, r1, 0x1
	lsls r0, 16
	lsrs r1, r0, 16
	cmp r1, 0x1C
	bls _08092CA4
	ldr r1, _08092D2C @ =0x0600783a
	ldr r2, _08092D30 @ =0x0000080b
	adds r0, r2, 0
	strh r0, [r1]
	movs r3, 0x1
	ldr r6, _08092D24 @ =0x06007800
	movs r5, 0x2
_08092CC2:
	lsls r2, r3, 6
	ldr r4, _08092D1C @ =0x06007822
	adds r1, r2, r4
	ldr r4, _08092D34 @ =0x0000040a
	adds r0, r4, 0
	strh r0, [r1]
	movs r1, 0x12
	adds r4, r3, 0x1
	adds r3, r2, 0
_08092CD4:
	lsls r0, r1, 1
	adds r0, r3, r0
	adds r0, r6
	strh r5, [r0]
	adds r0, r1, 0x1
	lsls r0, 16
	lsrs r1, r0, 16
	cmp r1, 0x1C
	bls _08092CD4
	ldr r1, _08092D2C @ =0x0600783a
	adds r0, r2, r1
	movs r1, 0xA
	strh r1, [r0]
	lsls r0, r4, 16
	lsrs r3, r0, 16
	cmp r3, 0xC
	bls _08092CC2
	ldr r1, _08092D38 @ =0x06007b62
	ldr r2, _08092D3C @ =0x0000040b
	adds r0, r2, 0
	strh r0, [r1]
	movs r1, 0x12
	ldr r3, _08092D40 @ =0x06007b40
	movs r2, 0xD
_08092D04:
	lsls r0, r1, 1
	adds r0, r3
	strh r2, [r0]
	adds r0, r1, 0x1
	lsls r0, 16
	lsrs r1, r0, 16
	cmp r1, 0x1C
	bls _08092D04
	ldr r1, _08092D44 @ =0x06007b7a
	movs r0, 0xB
	strh r0, [r1]
	b _08092D6E
	.align 2, 0
_08092D1C: .4byte 0x06007822
_08092D20: .4byte 0x00000c0b
_08092D24: .4byte 0x06007800
_08092D28: .4byte 0x0000080d
_08092D2C: .4byte 0x0600783a
_08092D30: .4byte 0x0000080b
_08092D34: .4byte 0x0000040a
_08092D38: .4byte 0x06007b62
_08092D3C: .4byte 0x0000040b
_08092D40: .4byte 0x06007b40
_08092D44: .4byte 0x06007b7a
_08092D48:
	movs r3, 0
	ldr r6, _08092D74 @ =0x06007800
	movs r5, 0x4F
_08092D4E:
	movs r1, 0x11
	adds r4, r3, 0x1
	lsls r2, r3, 6
_08092D54:
	lsls r0, r1, 1
	adds r0, r2, r0
	adds r0, r6
	strh r5, [r0]
	adds r0, r1, 0x1
	lsls r0, 16
	lsrs r1, r0, 16
	cmp r1, 0x1D
	bls _08092D54
	lsls r0, r4, 16
	lsrs r3, r0, 16
	cmp r3, 0xD
	bls _08092D4E
_08092D6E:
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_08092D74: .4byte 0x06007800
	thumb_func_end sub_8092C8C

	thumb_func_start sub_8092D78
sub_8092D78: @ 8092D78
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	lsls r0, 24
	lsrs r0, 24
	ldr r4, _08092DBC @ =gUnknown_083B5A7C
	ldr r3, _08092DC0 @ =gTasks
	lsls r2, r0, 2
	adds r2, r0
	lsls r2, 3
	adds r0, r2, r3
	movs r5, 0xA
	ldrsh r1, [r0, r5]
	lsls r1, 3
	adds r1, r4
	ldr r6, [r1]
	adds r3, 0x8
	adds r2, r3
	ldrb r0, [r1, 0x4]
	lsls r0, 1
	adds r0, r2
	mov r8, r0
	ldrb r0, [r1, 0x5]
	lsls r0, 1
	adds r7, r2, r0
	movs r0, 0x12
	movs r1, 0x1
	movs r2, 0x1C
	movs r3, 0xC
	bl MenuZeroFillWindowRect
	movs r5, 0
	ldrh r4, [r7]
	b _08092DE8
	.align 2, 0
_08092DBC: .4byte gUnknown_083B5A7C
_08092DC0: .4byte gTasks
_08092DC4:
	lsls r0, r4, 3
	adds r0, r6
	ldr r0, [r0, 0x4]
	lsls r2, r5, 1
	adds r2, 0x1
	lsls r2, 24
	lsrs r2, 24
	movs r1, 0x12
	bl MenuPrint
	adds r0, r5, 0x1
	lsls r0, 16
	lsrs r5, r0, 16
	adds r0, r4, 0x1
	lsls r0, 16
	lsrs r4, r0, 16
	cmp r5, 0x5
	bhi _08092DF2
_08092DE8:
	lsls r0, r4, 3
	adds r0, r6
	ldr r0, [r0, 0x4]
	cmp r0, 0
	bne _08092DC4
_08092DF2:
	mov r1, r8
	ldrh r0, [r1]
	ldrh r1, [r7]
	adds r0, r1
	lsls r0, 3
	adds r0, r6
	ldr r0, [r0]
	bl sub_8091E20
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r0}
	bx r0
	thumb_func_end sub_8092D78

	thumb_func_start sub_8092E10
sub_8092E10: @ 8092E10
	push {lr}
	lsls r0, 24
	lsrs r0, 24
	lsls r1, 24
	lsrs r3, r1, 24
	lsls r1, r0, 2
	adds r1, r0
	lsls r1, 3
	ldr r0, _08092E50 @ =gTasks + 0x8
	adds r1, r0
	ldr r2, _08092E54 @ =gUnknown_083B5A7C
	lsls r0, r3, 3
	adds r0, r2
	ldrb r2, [r0, 0x4]
	lsls r2, 1
	adds r2, r1, r2
	ldrb r0, [r0, 0x5]
	lsls r0, 1
	adds r1, r0
	ldrh r0, [r1]
	ldrh r2, [r2]
	adds r0, r2
	lsls r0, 16
	lsrs r2, r0, 16
	cmp r3, 0x5
	bhi _08092E74
	lsls r0, r3, 2
	ldr r1, _08092E58 @ =_08092E5C
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_08092E50: .4byte gTasks + 0x8
_08092E54: .4byte gUnknown_083B5A7C
_08092E58: .4byte _08092E5C
	.align 2, 0
_08092E5C:
	.4byte _08092E88
	.4byte _08092E92
	.4byte _08092EA2
	.4byte _08092EA2
	.4byte _08092E80
	.4byte _08092E78
_08092E74:
	movs r0, 0
	b _08092EA8
_08092E78:
	ldr r0, _08092E7C @ =gUnknown_083B5A60
	b _08092EA4
	.align 2, 0
_08092E7C: .4byte gUnknown_083B5A60
_08092E80:
	ldr r0, _08092E84 @ =gUnknown_083B5A62
	b _08092EA4
	.align 2, 0
_08092E84: .4byte gUnknown_083B5A62
_08092E88:
	cmp r2, 0
	beq _08092E96
	lsls r0, r2, 24
	lsrs r0, 24
	b _08092EA8
_08092E92:
	cmp r2, 0
	bne _08092E9A
_08092E96:
	movs r0, 0xFF
	b _08092EA8
_08092E9A:
	subs r0, r2, 0x1
	lsls r0, 24
	lsrs r0, 24
	b _08092EA8
_08092EA2:
	ldr r0, _08092EAC @ =gUnknown_083B5A68
_08092EA4:
	adds r0, r2, r0
	ldrb r0, [r0]
_08092EA8:
	pop {r1}
	bx r1
	.align 2, 0
_08092EAC: .4byte gUnknown_083B5A68
	thumb_func_end sub_8092E10

	thumb_func_start sub_8092EB0
sub_8092EB0: @ 8092EB0
	push {r4,r5,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	ldr r1, _08092ED0 @ =gUnknown_0202FFB4
	ldr r0, [r1]
	ldr r2, _08092ED4 @ =0x00000614
	adds r0, r2
	ldrh r0, [r0]
	adds r5, r1, 0
	cmp r0, 0
	beq _08092ECA
	cmp r0, 0x1
	beq _08092ED8
_08092ECA:
	movs r3, 0
	b _08092EDA
	.align 2, 0
_08092ED0: .4byte gUnknown_0202FFB4
_08092ED4: .4byte 0x00000614
_08092ED8:
	movs r3, 0x1
_08092EDA:
	ldr r1, _08092F00 @ =gTasks
	lsls r2, r4, 2
	adds r0, r2, r4
	lsls r0, 3
	adds r0, r1
	strh r3, [r0, 0xC]
	ldr r0, [r5]
	movs r3, 0xC3
	lsls r3, 3
	adds r0, r3
	ldrh r0, [r0]
	adds r5, r1, 0
	cmp r0, 0x5
	bhi _08092F20
	lsls r0, 2
	ldr r1, _08092F04 @ =_08092F08
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_08092F00: .4byte gTasks
_08092F04: .4byte _08092F08
	.align 2, 0
_08092F08:
	.4byte _08092F20
	.4byte _08092F24
	.4byte _08092F28
	.4byte _08092F2C
	.4byte _08092F30
	.4byte _08092F34
_08092F20:
	movs r3, 0
	b _08092F36
_08092F24:
	movs r3, 0x1
	b _08092F36
_08092F28:
	movs r3, 0x2
	b _08092F36
_08092F2C:
	movs r3, 0x3
	b _08092F36
_08092F30:
	movs r3, 0x4
	b _08092F36
_08092F34:
	movs r3, 0x5
_08092F36:
	adds r0, r2, r4
	lsls r0, 3
	adds r0, r5
	strh r3, [r0, 0x10]
	pop {r4,r5}
	pop {r0}
	bx r0
	thumb_func_end sub_8092EB0

	thumb_func_start sub_8092F44
sub_8092F44: @ 8092F44
	push {lr}
	lsls r0, 24
	lsrs r0, 24
	ldr r3, _08092F7C @ =gTasks
	lsls r1, r0, 2
	adds r1, r0
	lsls r1, 3
	adds r0, r1, r3
	ldrb r2, [r0, 0xA]
	adds r3, 0x8
	adds r1, r3
	ldr r0, _08092F80 @ =gUnknown_083B5A7C
	lsls r2, 3
	adds r2, r0
	ldrb r0, [r2, 0x5]
	lsls r0, 1
	adds r1, r0
	ldrh r0, [r2, 0x6]
	subs r0, 0x1
	lsls r0, 16
	lsrs r0, 16
	cmp r0, 0x5
	bls _08092F84
	ldrh r0, [r1]
	cmp r0, 0
	beq _08092F84
	movs r0, 0
	b _08092F86
	.align 2, 0
_08092F7C: .4byte gTasks
_08092F80: .4byte gUnknown_083B5A7C
_08092F84:
	movs r0, 0x1
_08092F86:
	pop {r1}
	bx r1
	thumb_func_end sub_8092F44

	thumb_func_start sub_8092F8C
sub_8092F8C: @ 8092F8C
	push {lr}
	lsls r0, 24
	lsrs r0, 24
	ldr r3, _08092FC8 @ =gTasks
	lsls r1, r0, 2
	adds r1, r0
	lsls r1, 3
	adds r0, r1, r3
	ldrb r2, [r0, 0xA]
	adds r3, 0x8
	adds r1, r3
	ldr r0, _08092FCC @ =gUnknown_083B5A7C
	lsls r2, 3
	adds r2, r0
	ldrb r0, [r2, 0x5]
	lsls r0, 1
	adds r1, r0
	ldrh r0, [r2, 0x6]
	subs r0, 0x1
	lsls r0, 16
	lsrs r0, 16
	cmp r0, 0x5
	bls _08092FD0
	ldrh r1, [r1]
	subs r0, 0x5
	cmp r1, r0
	bge _08092FD0
	movs r0, 0
	b _08092FD2
	.align 2, 0
_08092FC8: .4byte gTasks
_08092FCC: .4byte gUnknown_083B5A7C
_08092FD0:
	movs r0, 0x1
_08092FD2:
	pop {r1}
	bx r1
	thumb_func_end sub_8092F8C

	thumb_func_start sub_8092FD8
sub_8092FD8: @ 8092FD8
	push {r4,lr}
	adds r4, r0, 0
	ldr r2, _08093018 @ =gTasks
	movs r0, 0x2E
	ldrsh r1, [r4, r0]
	lsls r0, r1, 2
	adds r0, r1
	lsls r0, 3
	adds r0, r2
	ldr r1, [r0]
	ldr r0, _0809301C @ =sub_8092644
	cmp r1, r0
	bne _08093078
	movs r1, 0x30
	ldrsh r0, [r4, r1]
	cmp r0, 0
	beq _08093020
	ldrh r0, [r4, 0x2E]
	lsls r0, 24
	lsrs r0, 24
	bl sub_8092F8C
	lsls r0, 24
	cmp r0, 0
	beq _0809303C
	adds r2, r4, 0
	adds r2, 0x3E
	ldrb r0, [r2]
	movs r1, 0x4
	orrs r0, r1
	b _08093048
	.align 2, 0
_08093018: .4byte gTasks
_0809301C: .4byte sub_8092644
_08093020:
	ldrh r0, [r4, 0x2E]
	lsls r0, 24
	lsrs r0, 24
	bl sub_8092F44
	lsls r0, 24
	cmp r0, 0
	beq _0809303C
	adds r2, r4, 0
	adds r2, 0x3E
	ldrb r0, [r2]
	movs r1, 0x4
	orrs r0, r1
	b _08093048
_0809303C:
	adds r2, r4, 0
	adds r2, 0x3E
	ldrb r1, [r2]
	movs r0, 0x5
	negs r0, r0
	ands r0, r1
_08093048:
	strb r0, [r2]
	ldrh r2, [r4, 0x32]
	movs r1, 0x30
	ldrsh r0, [r4, r1]
	lsls r0, 7
	adds r0, r2, r0
	lsls r0, 24
	ldr r1, _08093074 @ =gSineTable
	lsrs r0, 23
	adds r0, r1
	movs r1, 0
	ldrsh r0, [r0, r1]
	cmp r0, 0
	bge _08093066
	adds r0, 0x7F
_08093066:
	asrs r0, 7
	strh r0, [r4, 0x26]
	adds r0, r2, 0
	adds r0, 0x8
	strh r0, [r4, 0x32]
	b _08093084
	.align 2, 0
_08093074: .4byte gSineTable
_08093078:
	adds r0, r4, 0
	adds r0, 0x3E
	ldrb r1, [r0]
	movs r2, 0x4
	orrs r1, r2
	strb r1, [r0]
_08093084:
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end sub_8092FD8

	thumb_func_start sub_809308C
sub_809308C: @ 809308C
	push {r4-r6,lr}
	mov r6, r9
	mov r5, r8
	push {r5,r6}
	adds r5, r0, 0
	lsls r5, 24
	lsrs r5, 24
	ldr r6, _08093104 @ =gSpriteTemplate_83A053C
	adds r0, r6, 0
	movs r1, 0xB8
	movs r2, 0x4
	movs r3, 0
	bl CreateSprite
	lsls r0, 24
	lsrs r0, 24
	ldr r4, _08093108 @ =gSprites
	lsls r1, r0, 4
	adds r1, r0
	lsls r1, 2
	adds r0, r1, r4
	movs r2, 0
	strh r5, [r0, 0x2E]
	strh r2, [r0, 0x30]
	movs r0, 0x1C
	adds r0, r4
	mov r9, r0
	add r1, r9
	ldr r0, _0809310C @ =sub_8092FD8
	mov r8, r0
	str r0, [r1]
	adds r0, r6, 0
	movs r1, 0xB8
	movs r2, 0x6C
	movs r3, 0
	bl CreateSprite
	lsls r0, 24
	lsrs r0, 24
	lsls r1, r0, 4
	adds r1, r0
	lsls r1, 2
	adds r4, r1, r4
	strh r5, [r4, 0x2E]
	movs r0, 0x1
	strh r0, [r4, 0x30]
	adds r4, 0x3F
	ldrb r0, [r4]
	movs r2, 0x2
	orrs r0, r2
	strb r0, [r4]
	add r1, r9
	mov r0, r8
	str r0, [r1]
	pop {r3,r4}
	mov r8, r3
	mov r9, r4
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_08093104: .4byte gSpriteTemplate_83A053C
_08093108: .4byte gSprites
_0809310C: .4byte sub_8092FD8
	thumb_func_end sub_809308C

	.align 2, 0 @ Don't pad with nop.
