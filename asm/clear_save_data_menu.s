	.include "constants/gba_constants.s"
	.include "constants/species_constants.s"
	.include "asm/macros.s"

	.syntax unified

	.text

	thumb_func_start sub_8148930
sub_8148930: @ 8148930
	push {r4,lr}
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	bl calls_flash_erase_block
	adds r0, r4, 0
	bl DestroyTask
	ldr r0, _08148950 @ =sub_8148B34
	bl SetMainCallback2
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08148950: .4byte sub_8148B34
	thumb_func_end sub_8148930

	thumb_func_start sub_8148954
sub_8148954: @ 8148954
	push {lr}
	bl RunTasks
	bl UpdatePaletteFade
	pop {r0}
	bx r0
	thumb_func_end sub_8148954

	thumb_func_start sub_8148964
sub_8148964: @ 8148964
	push {lr}
	bl TransferPlttBuffer
	pop {r0}
	bx r0
	thumb_func_end sub_8148964

	thumb_func_start sub_8148970
sub_8148970: @ 8148970
	push {r4,lr}
	sub sp, 0xC
	ldr r0, _08148AA4 @ =gMain
	ldr r1, _08148AA8 @ =0x0000043c
	adds r0, r1
	ldrb r0, [r0]
	cmp r0, 0
	beq _08148986
	cmp r0, 0x1
	bne _08148986
	b _08148B04
_08148986:
	movs r0, 0
	bl SetVBlankCallback
	movs r0, 0x80
	lsls r0, 19
	movs r4, 0
	strh r4, [r0]
	adds r0, 0x10
	strh r4, [r0]
	adds r0, 0x2
	strh r4, [r0]
	adds r0, 0xA
	strh r4, [r0]
	adds r0, 0x2
	strh r4, [r0]
	adds r0, 0x22
	strh r4, [r0]
	adds r0, 0x4
	strh r4, [r0]
	adds r0, 0x4
	strh r4, [r0]
	adds r0, 0x2
	strh r4, [r0]
	adds r0, 0x6
	strh r4, [r0]
	adds r0, 0x2
	strh r4, [r0]
	adds r0, 0x2
	strh r4, [r0]
	add r0, sp, 0x4
	strh r4, [r0]
	ldr r1, _08148AAC @ =0x040000d4
	str r0, [r1]
	movs r0, 0xC0
	lsls r0, 19
	str r0, [r1, 0x4]
	ldr r0, _08148AB0 @ =0x8100c000
	str r0, [r1, 0x8]
	ldr r0, [r1, 0x8]
	movs r2, 0
	str r2, [sp, 0x8]
	add r0, sp, 0x8
	str r0, [r1]
	movs r0, 0xE0
	lsls r0, 19
	str r0, [r1, 0x4]
	ldr r0, _08148AB4 @ =0x85000100
	str r0, [r1, 0x8]
	ldr r0, [r1, 0x8]
	add r0, sp, 0x4
	strh r2, [r0]
	str r0, [r1]
	ldr r0, _08148AB8 @ =0x05000002
	str r0, [r1, 0x4]
	ldr r0, _08148ABC @ =0x810001ff
	str r0, [r1, 0x8]
	ldr r0, [r1, 0x8]
	bl ResetPaletteFade
	ldr r2, _08148AC0 @ =gPlttBufferUnfaded
	ldr r0, _08148AC4 @ =0x00007fff
	strh r0, [r2]
	ldr r1, _08148AC8 @ =gPlttBufferFaded
	strh r0, [r1]
	ldr r0, _08148ACC @ =0x00003945
	strh r0, [r2, 0x2]
	strh r0, [r1, 0x2]
	movs r1, 0
	ldr r3, _08148AD0 @ =0x06000020
	ldr r0, _08148AD4 @ =0x00001111
	adds r2, r0, 0
_08148A14:
	lsls r0, r1, 1
	adds r0, r3
	strh r2, [r0]
	adds r0, r1, 0x1
	lsls r0, 16
	lsrs r1, r0, 16
	cmp r1, 0xF
	bls _08148A14
	movs r1, 0
	ldr r4, _08148AD8 @ =0x06003800
	movs r3, 0x1
	ldr r2, _08148ADC @ =0x000004ff
_08148A2C:
	lsls r0, r1, 1
	adds r0, r4
	strh r3, [r0]
	adds r0, r1, 0x1
	lsls r0, 16
	lsrs r1, r0, 16
	cmp r1, r2
	bls _08148A2C
	bl ResetTasks
	bl ResetSpriteData
	ldr r0, _08148AE0 @ =gWindowConfig_81E6C3C
	bl SetUpWindowConfig
	ldr r0, _08148AE4 @ =gWindowConfig_81E6CE4
	bl InitMenuWindow
	movs r0, 0x1
	negs r0, r0
	ldr r1, _08148AE8 @ =0x0000ffff
	str r1, [sp]
	movs r1, 0
	movs r2, 0x10
	movs r3, 0
	bl BeginNormalPaletteFade
	ldr r2, _08148AEC @ =0x04000208
	ldrh r1, [r2]
	movs r0, 0
	strh r0, [r2]
	ldr r3, _08148AF0 @ =0x04000200
	ldrh r0, [r3]
	movs r4, 0x1
	orrs r0, r4
	strh r0, [r3]
	strh r1, [r2]
	ldr r2, _08148AF4 @ =REG_DISPSTAT
	ldrh r0, [r2]
	movs r1, 0x8
	orrs r0, r1
	strh r0, [r2]
	ldr r0, _08148AF8 @ =sub_8148964
	bl SetVBlankCallback
	ldr r1, _08148AFC @ =REG_BG3CNT
	ldr r2, _08148B00 @ =0x00000703
	adds r0, r2, 0
	strh r0, [r1]
	subs r1, 0xE
	movs r2, 0x90
	lsls r2, 4
	adds r0, r2, 0
	strh r0, [r1]
	ldr r0, _08148AA4 @ =gMain
	ldr r1, _08148AA8 @ =0x0000043c
	adds r0, r1
	strb r4, [r0]
	b _08148B28
	.align 2, 0
_08148AA4: .4byte gMain
_08148AA8: .4byte 0x0000043c
_08148AAC: .4byte 0x040000d4
_08148AB0: .4byte 0x8100c000
_08148AB4: .4byte 0x85000100
_08148AB8: .4byte 0x05000002
_08148ABC: .4byte 0x810001ff
_08148AC0: .4byte gPlttBufferUnfaded
_08148AC4: .4byte 0x00007fff
_08148AC8: .4byte gPlttBufferFaded
_08148ACC: .4byte 0x00003945
_08148AD0: .4byte 0x06000020
_08148AD4: .4byte 0x00001111
_08148AD8: .4byte 0x06003800
_08148ADC: .4byte 0x000004ff
_08148AE0: .4byte gWindowConfig_81E6C3C
_08148AE4: .4byte gWindowConfig_81E6CE4
_08148AE8: .4byte 0x0000ffff
_08148AEC: .4byte 0x04000208
_08148AF0: .4byte 0x04000200
_08148AF4: .4byte REG_DISPSTAT
_08148AF8: .4byte sub_8148964
_08148AFC: .4byte REG_BG3CNT
_08148B00: .4byte 0x00000703
_08148B04:
	bl UpdatePaletteFade
	ldr r0, _08148B20 @ =gPaletteFade
	ldrb r1, [r0, 0x7]
	movs r0, 0x80
	ands r0, r1
	cmp r0, 0
	bne _08148B28
	ldr r0, _08148B24 @ =sub_8148954
	bl SetMainCallback2
	movs r0, 0x1
	b _08148B2A
	.align 2, 0
_08148B20: .4byte gPaletteFade
_08148B24: .4byte sub_8148954
_08148B28:
	movs r0, 0
_08148B2A:
	add sp, 0xC
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end sub_8148970

	thumb_func_start sub_8148B34
sub_8148B34: @ 8148B34
	push {r4,lr}
	sub sp, 0x4
	ldr r0, _08148B60 @ =gMain
	ldr r1, _08148B64 @ =0x0000043c
	adds r4, r0, r1
	ldrb r0, [r4]
	cmp r0, 0
	beq _08148B48
	cmp r0, 0x1
	beq _08148B6C
_08148B48:
	movs r0, 0x1
	negs r0, r0
	ldr r1, _08148B68 @ =0x0000ffff
	str r1, [sp]
	movs r1, 0
	movs r2, 0
	movs r3, 0x10
	bl BeginNormalPaletteFade
	movs r0, 0x1
	strb r0, [r4]
	b _08148B80
	.align 2, 0
_08148B60: .4byte gMain
_08148B64: .4byte 0x0000043c
_08148B68: .4byte 0x0000ffff
_08148B6C:
	bl UpdatePaletteFade
	ldr r0, _08148B88 @ =gPaletteFade
	ldrb r1, [r0, 0x7]
	movs r0, 0x80
	ands r0, r1
	cmp r0, 0
	bne _08148B80
	bl DoSoftReset
_08148B80:
	add sp, 0x4
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08148B88: .4byte gPaletteFade
	thumb_func_end sub_8148B34

	.align 2, 0 @ Don't pad with nop.
