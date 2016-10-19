	.include "constants/gba_constants.s"
	.include "constants/species_constants.s"
	.include "asm/macros.s"

	.syntax unified

	.text

	thumb_func_start sub_8145D74
sub_8145D74: @ 8145D74
	push {lr}
	bl LoadOam
	bl ProcessSpriteCopyRequests
	bl TransferPlttBuffer
	pop {r0}
	bx r0
	thumb_func_end sub_8145D74

	thumb_func_start sub_8145D88
sub_8145D88: @ 8145D88
	push {r4-r6,lr}
	mov r6, r8
	push {r6}
	sub sp, 0xC
	movs r0, 0
	bl SetVBlankCallback
	movs r0, 0x80
	lsls r0, 19
	mov r8, r0
	movs r1, 0
	strh r1, [r0]
	ldr r6, _08145EB0
	strh r1, [r6]
	adds r0, 0xC
	strh r1, [r0]
	subs r0, 0x2
	strh r1, [r0]
	subs r0, 0x2
	strh r1, [r0]
	adds r0, 0x14
	strh r1, [r0]
	adds r0, 0x2
	strh r1, [r0]
	subs r0, 0x6
	strh r1, [r0]
	adds r0, 0x2
	strh r1, [r0]
	subs r0, 0x6
	strh r1, [r0]
	adds r0, 0x2
	strh r1, [r0]
	subs r0, 0x6
	strh r1, [r0]
	adds r0, 0x2
	strh r1, [r0]
	add r0, sp, 0x4
	strh r1, [r0]
	ldr r2, _08145EB4
	str r0, [r2]
	movs r1, 0xC0
	lsls r1, 19
	str r1, [r2, 0x4]
	ldr r0, _08145EB8
	str r0, [r2, 0x8]
	ldr r0, [r2, 0x8]
	movs r5, 0
	str r5, [sp, 0x8]
	add r0, sp, 0x8
	str r0, [r2]
	movs r0, 0xE0
	lsls r0, 19
	str r0, [r2, 0x4]
	ldr r0, _08145EBC
	str r0, [r2, 0x8]
	ldr r0, [r2, 0x8]
	add r0, sp, 0x4
	strh r5, [r0]
	str r0, [r2]
	movs r0, 0xA0
	lsls r0, 19
	str r0, [r2, 0x4]
	ldr r0, _08145EC0
	str r0, [r2, 0x8]
	ldr r0, [r2, 0x8]
	ldr r0, _08145EC4
	bl LZ77UnCompVram
	ldr r0, _08145EC8
	ldr r1, _08145ECC
	bl LZ77UnCompVram
	bl remove_some_task
	bl ResetTasks
	bl ResetSpriteData
	bl ResetPaletteFade
	bl FreeAllSpritePalettes
	ldr r0, _08145ED0
	movs r1, 0
	movs r2, 0x40
	bl LoadPalette
	ldr r0, _08145ED4
	bl SetUpWindowConfig
	ldr r0, _08145ED8
	bl InitMenuWindow
	bl pokedex_diploma_something
	movs r0, 0x1
	negs r0, r0
	str r5, [sp]
	movs r1, 0
	movs r2, 0x10
	movs r3, 0
	bl BeginNormalPaletteFade
	ldr r3, _08145EDC
	ldrh r2, [r3]
	strh r5, [r3]
	ldr r4, _08145EE0
	ldrh r0, [r4]
	movs r1, 0x1
	orrs r0, r1
	strh r0, [r4]
	strh r2, [r3]
	ldr r2, _08145EE4
	ldrh r0, [r2]
	movs r1, 0x8
	orrs r0, r1
	strh r0, [r2]
	ldr r0, _08145EE8
	bl SetVBlankCallback
	ldr r0, _08145EEC
	bl SetMainCallback2
	ldr r0, _08145EF0
	strh r5, [r0]
	adds r0, 0x2
	strh r5, [r0]
	adds r0, 0x2
	strh r5, [r0]
	ldr r1, _08145EF4
	adds r0, r1, 0
	strh r0, [r6]
	movs r1, 0xCA
	lsls r1, 5
	adds r0, r1, 0
	mov r1, r8
	strh r0, [r1]
	ldr r0, _08145EF8
	movs r1, 0
	bl CreateTask
	add sp, 0xC
	pop {r3}
	mov r8, r3
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_08145EB0: .4byte REG_BG3CNT
_08145EB4: .4byte 0x040000d4
_08145EB8: .4byte 0x8100c000
_08145EBC: .4byte 0x85000100
_08145EC0: .4byte 0x81000200
_08145EC4: .4byte gUnknown_0840D288
_08145EC8: .4byte gUnknown_0840CB4C
_08145ECC: .4byte 0x06003000
_08145ED0: .4byte gUnknown_0840CB0C
_08145ED4: .4byte gWindowConfig_81E6C3C
_08145ED8: .4byte gWindowConfig_81E6CE4
_08145EDC: .4byte 0x04000208
_08145EE0: .4byte 0x04000200
_08145EE4: .4byte REG_DISPSTAT
_08145EE8: .4byte sub_8145D74
_08145EEC: .4byte sub_8145EFC
_08145EF0: .4byte REG_BLDCNT
_08145EF4: .4byte 0x00004603
_08145EF8: .4byte sub_8145F14
	thumb_func_end sub_8145D88

	thumb_func_start sub_8145EFC
sub_8145EFC: @ 8145EFC
	push {lr}
	bl RunTasks
	bl AnimateSprites
	bl BuildOamBuffer
	bl UpdatePaletteFade
	pop {r0}
	bx r0
	thumb_func_end sub_8145EFC

	thumb_func_start sub_8145F14
sub_8145F14: @ 8145F14
	push {lr}
	lsls r0, 24
	lsrs r2, r0, 24
	ldr r0, _08145F38
	ldrb r1, [r0, 0x7]
	movs r0, 0x80
	ands r0, r1
	cmp r0, 0
	bne _08145F34
	ldr r0, _08145F3C
	lsls r1, r2, 2
	adds r1, r2
	lsls r1, 3
	adds r1, r0
	ldr r0, _08145F40
	str r0, [r1]
_08145F34:
	pop {r0}
	bx r0
	.align 2, 0
_08145F38: .4byte gPaletteFade
_08145F3C: .4byte gTasks
_08145F40: .4byte sub_8145F44
	thumb_func_end sub_8145F14

	thumb_func_start sub_8145F44
sub_8145F44: @ 8145F44
	push {r4,lr}
	sub sp, 0x4
	lsls r0, 24
	lsrs r4, r0, 24
	ldr r0, _08145F80
	ldrh r1, [r0, 0x2E]
	movs r0, 0x3
	ands r0, r1
	cmp r0, 0
	beq _08145F76
	movs r0, 0x1
	negs r0, r0
	movs r1, 0
	str r1, [sp]
	movs r2, 0
	movs r3, 0x10
	bl BeginNormalPaletteFade
	ldr r1, _08145F84
	lsls r0, r4, 2
	adds r0, r4
	lsls r0, 3
	adds r0, r1
	ldr r1, _08145F88
	str r1, [r0]
_08145F76:
	add sp, 0x4
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08145F80: .4byte gMain
_08145F84: .4byte gTasks
_08145F88: .4byte sub_8145F8C
	thumb_func_end sub_8145F44

	thumb_func_start sub_8145F8C
sub_8145F8C: @ 8145F8C
	push {lr}
	lsls r0, 24
	lsrs r2, r0, 24
	ldr r0, _08145FB0
	ldrb r1, [r0, 0x7]
	movs r0, 0x80
	ands r0, r1
	cmp r0, 0
	bne _08145FAA
	adds r0, r2, 0
	bl DestroyTask
	ldr r0, _08145FB4
	bl SetMainCallback2
_08145FAA:
	pop {r0}
	bx r0
	.align 2, 0
_08145FB0: .4byte gPaletteFade
_08145FB4: .4byte sub_80546F0
	thumb_func_end sub_8145F8C

	thumb_func_start pokedex_diploma_something
pokedex_diploma_something: @ 8145FB8
	push {lr}
	bl sub_8090FF4
	lsls r0, 16
	lsrs r1, r0, 16
	cmp r1, 0
	beq _08145FE8
	ldr r1, _08145FDC
	movs r2, 0x80
	lsls r2, 1
	adds r0, r2, 0
	strh r0, [r1]
	ldr r0, _08145FE0
	ldr r1, _08145FE4
	bl StringCopy
	b _08145FF4
	.align 2, 0
_08145FDC: .4byte REG_BG3HOFS
_08145FE0: .4byte gStringVar1
_08145FE4: .4byte gOtherText_NationalDex
_08145FE8:
	ldr r0, _08146004
	strh r1, [r0]
	ldr r0, _08146008
	ldr r1, _0814600C
	bl StringCopy
_08145FF4:
	ldr r0, _08146010
	movs r1, 0x6
	movs r2, 0x2
	bl MenuPrint
	pop {r0}
	bx r0
	.align 2, 0
_08146004: .4byte REG_BG3HOFS
_08146008: .4byte gStringVar1
_0814600C: .4byte gOtherText_HoennDex
_08146010: .4byte gOtherText_DiplomaCertificationGameFreak
	thumb_func_end pokedex_diploma_something

	.align 2, 0 @ Don't pad with nop.
