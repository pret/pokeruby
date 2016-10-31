	.include "constants/gba_constants.inc"
	.include "constants/species_constants.inc"
	.include "asm/macros.inc"

	.syntax unified

	.text

	thumb_func_start sub_80F890C
sub_80F890C: @ 80F890C
	push {r4-r6,lr}
	sub sp, 0x4
	adds r4, r0, 0
	adds r6, r1, 0
	lsls r2, 24
	lsrs r5, r2, 24
	ldr r2, _080F8958 @ =0x02000000
	adds r1, r2, 0
	adds r1, 0xFF
	movs r0, 0x2
	strb r0, [r1]
	adds r0, 0xFE
	adds r1, r2, r0
	movs r0, 0x1
	strb r0, [r1]
	movs r0, 0x82
	lsls r0, 1
	adds r1, r2, r0
	ldr r0, _080F895C @ =sub_80EB3FC
	str r0, [r1]
	movs r0, 0x84
	lsls r0, 1
	adds r1, r2, r0
	ldr r0, _080F8960 @ =ConvertEasyChatWordsToString
	str r0, [r1]
	ldrh r1, [r4, 0x20]
	adds r0, r1, 0
	subs r0, 0x79
	lsls r0, 16
	lsrs r0, 16
	cmp r0, 0xB
	bhi _080F8964
	subs r1, 0x79
	adds r0, r2, 0
	adds r0, 0xFA
	strb r1, [r0]
	b _080F896E
	.align 2, 0
_080F8958: .4byte 0x02000000
_080F895C: .4byte sub_80EB3FC
_080F8960: .4byte ConvertEasyChatWordsToString
_080F8964:
	adds r1, r2, 0
	adds r1, 0xFA
	movs r0, 0
	strb r0, [r1]
	movs r5, 0
_080F896E:
	ldr r1, _080F8994 @ =0x02000000
	movs r2, 0x80
	lsls r2, 1
	adds r0, r1, r2
	ldrb r0, [r0]
	cmp r0, 0
	beq _080F8980
	cmp r0, 0x1
	beq _080F899C
_080F8980:
	movs r0, 0x86
	lsls r0, 1
	adds r2, r1, r0
	adds r0, r1, 0
	adds r0, 0xFA
	ldrb r0, [r0]
	lsls r0, 3
	ldr r1, _080F8998 @ =gUnknown_083E5730
	b _080F89AC
	.align 2, 0
_080F8994: .4byte 0x02000000
_080F8998: .4byte gUnknown_083E5730
_080F899C:
	movs r0, 0x86
	lsls r0, 1
	adds r2, r1, r0
	adds r0, r1, 0
	adds r0, 0xFA
	ldrb r0, [r0]
	lsls r0, 3
	ldr r1, _080F89DC @ =gUnknown_083E57A4
_080F89AC:
	adds r0, r1
	str r0, [r2]
	ldrh r0, [r4, 0x1E]
	mov r1, sp
	bl sub_80A2D64
	lsls r0, 16
	ldr r1, _080F89E0 @ =0xffff0000
	adds r0, r1
	movs r1, 0xCD
	lsls r1, 17
	cmp r0, r1
	bhi _080F89F8
	ldr r0, _080F89E4 @ =0x02000000
	adds r1, r0, 0
	adds r1, 0xFA
	ldrb r2, [r1]
	adds r1, r0, 0
	cmp r2, 0x6
	beq _080F89E8
	cmp r2, 0x9
	beq _080F89F0
	b _080F89FA
	.align 2, 0
_080F89DC: .4byte gUnknown_083E57A4
_080F89E0: .4byte 0xffff0000
_080F89E4: .4byte 0x02000000
_080F89E8:
	adds r2, r1, 0
	adds r2, 0xFB
	movs r0, 0x1
	b _080F8A00
_080F89F0:
	adds r2, r1, 0
	adds r2, 0xFB
	movs r0, 0x2
	b _080F8A00
_080F89F8:
	ldr r1, _080F8A20 @ =0x02000000
_080F89FA:
	adds r2, r1, 0
	adds r2, 0xFB
	movs r0, 0
_080F8A00:
	strb r0, [r2]
	adds r0, r1, 0
	adds r0, 0xF4
	str r4, [r0]
	subs r0, 0x8
	str r6, [r0]
	adds r0, 0xC
	strb r5, [r0]
	ldr r0, _080F8A24 @ =sub_80F8D50
	bl SetMainCallback2
	add sp, 0x4
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_080F8A20: .4byte 0x02000000
_080F8A24: .4byte sub_80F8D50
	thumb_func_end sub_80F890C

	thumb_func_start sub_80F8A28
sub_80F8A28: @ 80F8A28
	push {r4,r5,lr}
	sub sp, 0x8
	ldr r0, _080F8A44 @ =gMain
	ldr r1, _080F8A48 @ =0x0000043c
	adds r0, r1
	ldrb r0, [r0]
	cmp r0, 0x12
	bls _080F8A3A
	b _080F8D3C
_080F8A3A:
	lsls r0, 2
	ldr r1, _080F8A4C @ =_080F8A50
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_080F8A44: .4byte gMain
_080F8A48: .4byte 0x0000043c
_080F8A4C: .4byte _080F8A50
	.align 2, 0
_080F8A50:
	.4byte _080F8A9C
	.4byte _080F8AB0
	.4byte _080F8AC8
	.4byte _080F8ACE
	.4byte _080F8AD4
	.4byte _080F8ADA
	.4byte _080F8B10
	.4byte _080F8B1C
	.4byte _080F8B28
	.4byte _080F8B34
	.4byte _080F8B3A
	.4byte _080F8B54
	.4byte _080F8B78
	.4byte _080F8BA0
	.4byte _080F8C14
	.4byte _080F8C2C
	.4byte _080F8C58
	.4byte _080F8CBC
	.4byte _080F8CC6
_080F8A9C:
	movs r0, 0
	bl SetVBlankCallback
	bl remove_some_task
	movs r1, 0x80
	lsls r1, 19
	movs r0, 0
	strh r0, [r1]
	b _080F8D30
_080F8AB0:
	add r1, sp, 0x4
	movs r0, 0
	strh r0, [r1]
	movs r1, 0xE0
	lsls r1, 19
	ldr r2, _080F8AC4 @ =0x01000200
	add r0, sp, 0x4
	bl CpuSet
	b _080F8D30
	.align 2, 0
_080F8AC4: .4byte 0x01000200
_080F8AC8:
	bl ResetPaletteFade
	b _080F8D30
_080F8ACE:
	bl ResetTasks
	b _080F8D30
_080F8AD4:
	bl ResetSpriteData
	b _080F8D30
_080F8ADA:
	bl FreeAllSpritePalettes
	ldr r0, _080F8B0C @ =REG_BG0HOFS
	movs r1, 0
	strh r1, [r0]
	adds r0, 0x2
	strh r1, [r0]
	adds r0, 0x2
	strh r1, [r0]
	adds r0, 0x2
	strh r1, [r0]
	adds r0, 0x4
	strh r1, [r0]
	subs r0, 0x2
	strh r1, [r0]
	adds r0, 0x4
	strh r1, [r0]
	adds r0, 0x2
	strh r1, [r0]
	adds r0, 0x32
	strh r1, [r0]
	adds r0, 0x2
	strh r1, [r0]
	b _080F8D30
	.align 2, 0
_080F8B0C: .4byte REG_BG0HOFS
_080F8B10:
	ldr r0, _080F8B18 @ =gWindowConfig_81E6DFC
	bl SetUpWindowConfig
	b _080F8D30
	.align 2, 0
_080F8B18: .4byte gWindowConfig_81E6DFC
_080F8B1C:
	ldr r0, _080F8B24 @ =gWindowConfig_81E6DFC
	bl MultistepInitMenuWindowBegin
	b _080F8D30
	.align 2, 0
_080F8B24: .4byte gWindowConfig_81E6DFC
_080F8B28:
	bl MultistepInitMenuWindowContinue
	cmp r0, 0
	beq _080F8B32
	b _080F8D30
_080F8B32:
	b _080F8D3C
_080F8B34:
	bl MenuZeroFillScreen
	b _080F8D30
_080F8B3A:
	mov r0, sp
	adds r0, 0x6
	movs r1, 0x1
	strh r1, [r0]
	ldr r1, _080F8B4C @ =0x06004800
	ldr r2, _080F8B50 @ =0x01000400
	bl CpuSet
	b _080F8D30
	.align 2, 0
_080F8B4C: .4byte 0x06004800
_080F8B50: .4byte 0x01000400
_080F8B54:
	ldr r2, _080F8B70 @ =gMailGraphicsTable
	ldr r0, _080F8B74 @ =0x02000000
	adds r0, 0xFA
	ldrb r1, [r0]
	lsls r0, r1, 2
	adds r0, r1
	lsls r0, 2
	adds r0, r2
	ldr r0, [r0]
	movs r1, 0
	movs r2, 0x20
	bl LoadPalette
	b _080F8D30
	.align 2, 0
_080F8B70: .4byte gMailGraphicsTable
_080F8B74: .4byte 0x02000000
_080F8B78:
	ldr r2, _080F8B94 @ =gMailGraphicsTable
	ldr r0, _080F8B98 @ =0x02000000
	adds r0, 0xFA
	ldrb r1, [r0]
	lsls r0, r1, 2
	adds r0, r1
	lsls r0, 2
	adds r2, 0x8
	adds r0, r2
	ldr r0, [r0]
	ldr r1, _080F8B9C @ =0x06004000
	bl LZ77UnCompVram
	b _080F8D30
	.align 2, 0
_080F8B94: .4byte gMailGraphicsTable
_080F8B98: .4byte 0x02000000
_080F8B9C: .4byte 0x06004000
_080F8BA0:
	ldr r5, _080F8C00 @ =gMailGraphicsTable
	ldr r4, _080F8C04 @ =0x02000000
	adds r4, 0xFA
	ldrb r1, [r4]
	lsls r0, r1, 2
	adds r0, r1
	lsls r0, 2
	adds r1, r5, 0x4
	adds r0, r1
	ldr r0, [r0]
	movs r1, 0xC0
	lsls r1, 19
	bl LZ77UnCompVram
	ldr r3, _080F8C08 @ =gPlttBufferUnfaded
	ldrb r1, [r4]
	lsls r0, r1, 2
	adds r0, r1
	lsls r0, 2
	adds r0, r5
	ldrh r0, [r0, 0x10]
	movs r2, 0xF1
	lsls r2, 1
	adds r1, r3, r2
	strh r0, [r1]
	ldrb r1, [r4]
	lsls r0, r1, 2
	adds r0, r1
	lsls r0, 2
	adds r0, r5
	ldrh r1, [r0, 0x12]
	adds r2, 0xE
	adds r0, r3, r2
	strh r1, [r0]
	ldr r1, _080F8C0C @ =gUnknown_083E562C
	ldr r2, _080F8C10 @ =gSaveBlock2
	ldrb r0, [r2, 0x8]
	lsls r0, 2
	adds r0, r1
	ldrh r0, [r0]
	strh r0, [r3, 0x14]
	ldrb r0, [r2, 0x8]
	lsls r0, 2
	adds r1, 0x2
	adds r0, r1
	ldrh r0, [r0]
	strh r0, [r3, 0x16]
	b _080F8D30
	.align 2, 0
_080F8C00: .4byte gMailGraphicsTable
_080F8C04: .4byte 0x02000000
_080F8C08: .4byte gPlttBufferUnfaded
_080F8C0C: .4byte gUnknown_083E562C
_080F8C10: .4byte gSaveBlock2
_080F8C14:
	ldr r0, _080F8C28 @ =0x02000000
	adds r0, 0xF8
	ldrb r0, [r0]
	cmp r0, 0
	bne _080F8C20
	b _080F8D30
_080F8C20:
	bl sub_80F8DA0
	b _080F8D30
	.align 2, 0
_080F8C28: .4byte 0x02000000
_080F8C2C:
	ldr r0, _080F8C4C @ =0x02000000
	adds r0, 0xF8
	ldrb r0, [r0]
	cmp r0, 0
	beq _080F8C3A
	bl sub_80F8E80
_080F8C3A:
	ldr r0, _080F8C50 @ =sub_80F8F18
	bl SetVBlankCallback
	ldr r2, _080F8C54 @ =gPaletteFade
	ldrb r0, [r2, 0x8]
	movs r1, 0x80
	orrs r0, r1
	strb r0, [r2, 0x8]
	b _080F8D30
	.align 2, 0
_080F8C4C: .4byte 0x02000000
_080F8C50: .4byte sub_80F8F18
_080F8C54: .4byte gPaletteFade
_080F8C58:
	ldr r5, _080F8C7C @ =0x02000000
	adds r0, r5, 0
	adds r0, 0xF4
	ldr r0, [r0]
	ldrh r0, [r0, 0x1E]
	bl sub_809D4A8
	lsls r0, 16
	lsrs r4, r0, 16
	adds r0, r5, 0
	adds r0, 0xFB
	ldrb r0, [r0]
	cmp r0, 0x1
	beq _080F8C80
	cmp r0, 0x2
	beq _080F8C98
	b _080F8D30
	.align 2, 0
_080F8C7C: .4byte 0x02000000
_080F8C80:
	adds r0, r4, 0
	bl sub_809D580
	ldr r1, _080F8C94 @ =SpriteCallbackDummy
	movs r0, 0
	str r0, [sp]
	adds r0, r4, 0
	movs r2, 0x60
	b _080F8CA8
	.align 2, 0
_080F8C94: .4byte SpriteCallbackDummy
_080F8C98:
	adds r0, r4, 0
	bl sub_809D580
	ldr r1, _080F8CB8 @ =SpriteCallbackDummy
	movs r0, 0
	str r0, [sp]
	adds r0, r4, 0
	movs r2, 0x28
_080F8CA8:
	movs r3, 0x80
	bl sub_809D3A4
	adds r1, r5, 0
	adds r1, 0xFC
	strb r0, [r1]
	b _080F8D30
	.align 2, 0
_080F8CB8: .4byte SpriteCallbackDummy
_080F8CBC:
	bl sub_8055870
	cmp r0, 0x1
	bne _080F8D30
	b _080F8D3C
_080F8CC6:
	ldr r1, _080F8D14 @ =REG_BG0CNT
	ldr r2, _080F8D18 @ =0x00009f08
	adds r0, r2, 0
	strh r0, [r1]
	adds r1, 0x2
	ldr r2, _080F8D1C @ =0x00000801
	adds r0, r2, 0
	strh r0, [r1]
	adds r1, 0x2
	ldr r2, _080F8D20 @ =0x00000902
	adds r0, r2, 0
	strh r0, [r1]
	adds r1, 0x44
	movs r0, 0
	strh r0, [r1]
	subs r1, 0x50
	movs r2, 0xBA
	lsls r2, 5
	adds r0, r2, 0
	strh r0, [r1]
	movs r0, 0x1
	negs r0, r0
	movs r1, 0
	str r1, [sp]
	movs r2, 0x10
	movs r3, 0
	bl BeginNormalPaletteFade
	ldr r2, _080F8D24 @ =gPaletteFade
	ldrb r1, [r2, 0x8]
	movs r0, 0x7F
	ands r0, r1
	strb r0, [r2, 0x8]
	ldr r0, _080F8D28 @ =0x02000000
	adds r0, 0xF0
	ldr r1, _080F8D2C @ =sub_80F8F58
	str r1, [r0]
	movs r0, 0x1
	b _080F8D3E
	.align 2, 0
_080F8D14: .4byte REG_BG0CNT
_080F8D18: .4byte 0x00009f08
_080F8D1C: .4byte 0x00000801
_080F8D20: .4byte 0x00000902
_080F8D24: .4byte gPaletteFade
_080F8D28: .4byte 0x02000000
_080F8D2C: .4byte sub_80F8F58
_080F8D30:
	ldr r1, _080F8D48 @ =gMain
	ldr r0, _080F8D4C @ =0x0000043c
	adds r1, r0
	ldrb r0, [r1]
	adds r0, 0x1
	strb r0, [r1]
_080F8D3C:
	movs r0, 0
_080F8D3E:
	add sp, 0x8
	pop {r4,r5}
	pop {r1}
	bx r1
	.align 2, 0
_080F8D48: .4byte gMain
_080F8D4C: .4byte 0x0000043c
	thumb_func_end sub_80F8A28

	thumb_func_start sub_80F8D50
sub_80F8D50: @ 80F8D50
	push {lr}
_080F8D52:
	bl sub_80F8A28
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _080F8D6C
	ldr r0, _080F8D68 @ =sub_80F8F2C
	bl SetMainCallback2
	b _080F8D78
	.align 2, 0
_080F8D68: .4byte sub_80F8F2C
_080F8D6C:
	bl sub_80F9344
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _080F8D52
_080F8D78:
	pop {r0}
	bx r0
	thumb_func_end sub_80F8D50

	thumb_func_start sub_80F8D7C
sub_80F8D7C: @ 80F8D7C
	push {r4,lr}
	adds r4, r0, 0
	bl StringCopy
	adds r0, r4, 0
	bl sub_814A568
	adds r0, r4, 0
	bl StringLength
	lsls r0, 16
	lsrs r0, 16
	adds r4, r0
	adds r0, r4, 0
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end sub_80F8D7C

	thumb_func_start sub_80F8DA0
sub_80F8DA0: @ 80F8DA0
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	movs r6, 0
	movs r5, 0
	ldr r2, _080F8E3C @ =0x02000000
	movs r0, 0x86
	lsls r0, 1
	adds r1, r2, r0
	ldr r0, [r1]
	ldrb r0, [r0]
	cmp r5, r0
	bcs _080F8E04
	mov r8, r2
	adds r7, r1, 0
_080F8DBE:
	lsls r0, r5, 3
	subs r0, r5
	lsls r0, 2
	subs r0, r5
	add r0, r8
	mov r1, r8
	adds r1, 0xF4
	lsls r2, r6, 1
	ldr r1, [r1]
	adds r1, r2
	ldr r2, [r7]
	ldr r2, [r2, 0x4]
	lsls r4, r5, 2
	adds r2, r4, r2
	ldr r2, [r2]
	lsls r2, 28
	lsrs r2, 30
	movs r3, 0x1
	bl ConvertEasyChatWordsToString
	ldr r1, [r7]
	ldr r0, [r1, 0x4]
	adds r4, r0
	ldr r0, [r4]
	lsls r0, 28
	lsrs r0, 30
	adds r0, r6, r0
	lsls r0, 24
	lsrs r6, r0, 24
	adds r0, r5, 0x1
	lsls r0, 16
	lsrs r5, r0, 16
	ldrb r1, [r1]
	cmp r5, r1
	bcc _080F8DBE
_080F8E04:
	ldr r2, _080F8E40 @ =0x020000d8
	adds r4, r2, 0
	subs r4, 0xD8
	adds r0, r2, 0
	adds r0, 0x28
	ldrb r0, [r0]
	cmp r0, 0
	bne _080F8E48
	ldr r1, [r2, 0x1C]
	adds r1, 0x12
	adds r0, r2, 0
	bl sub_80F8D7C
	adds r2, r0, 0
	ldr r1, _080F8E44 @ =gOtherText_From
	bl StringCopy
	ldr r0, _080F8E40 @ =0x020000d8
	bl StringLength
	movs r2, 0x86
	lsls r2, 1
	adds r1, r4, r2
	ldr r1, [r1]
	ldrb r1, [r1, 0x2]
	subs r1, r0
	b _080F8E6A
	.align 2, 0
_080F8E3C: .4byte 0x02000000
_080F8E40: .4byte 0x020000d8
_080F8E44: .4byte gOtherText_From
_080F8E48:
	ldr r1, _080F8E7C @ =gOtherText_From
	adds r0, r2, 0
	bl StringCopy
	adds r2, r0, 0
	adds r0, r4, 0
	adds r0, 0xF4
	ldr r1, [r0]
	adds r1, 0x12
	adds r0, r2, 0
	bl sub_80F8D7C
	movs r1, 0x86
	lsls r1, 1
	adds r0, r4, r1
	ldr r0, [r0]
	ldrb r1, [r0, 0x2]
_080F8E6A:
	adds r0, r4, 0
	adds r0, 0xF9
	strb r1, [r0]
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080F8E7C: .4byte gOtherText_From
	thumb_func_end sub_80F8DA0

	thumb_func_start sub_80F8E80
sub_80F8E80: @ 80F8E80
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	movs r6, 0
	movs r4, 0
	ldr r1, _080F8F10 @ =0x02000000
	movs r0, 0x86
	lsls r0, 1
	adds r2, r1, r0
	ldr r0, [r2]
	ldrb r0, [r0]
	cmp r4, r0
	bcs _080F8EF6
	mov r8, r1
	adds r7, r2, 0
_080F8E9E:
	lsls r0, r4, 3
	subs r0, r4
	lsls r0, 2
	subs r0, r4
	mov r1, r8
	adds r5, r0, r1
	ldrb r0, [r5]
	cmp r0, 0xFF
	beq _080F8EE8
	cmp r0, 0
	beq _080F8EE8
	ldr r2, [r7]
	ldr r1, [r2, 0x4]
	lsls r0, r4, 2
	adds r0, r1
	ldr r0, [r0]
	lsls r3, r0, 24
	lsrs r3, 28
	lsls r0, 30
	lsrs r0, 30
	adds r0, r6, r0
	lsls r0, 24
	lsrs r6, r0, 24
	ldrb r2, [r2, 0x3]
	lsrs r1, r2, 4
	adds r1, r3
	lsls r2, 28
	lsrs r2, 28
	adds r2, r6, r2
	lsls r2, 24
	lsrs r2, 24
	adds r0, r5, 0
	bl MenuPrint
	adds r0, r6, 0x2
	lsls r0, 24
	lsrs r6, r0, 24
_080F8EE8:
	adds r0, r4, 0x1
	lsls r0, 16
	lsrs r4, r0, 16
	ldr r0, [r7]
	ldrb r0, [r0]
	cmp r4, r0
	bcc _080F8E9E
_080F8EF6:
	ldr r0, _080F8F14 @ =0x020000d8
	adds r1, r0, 0
	adds r1, 0x21
	ldrb r1, [r1]
	ldr r2, [r0, 0x34]
	ldrb r2, [r2, 0x1]
	bl MenuPrint
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080F8F10: .4byte 0x02000000
_080F8F14: .4byte 0x020000d8
	thumb_func_end sub_80F8E80

	thumb_func_start sub_80F8F18
sub_80F8F18: @ 80F8F18
	push {lr}
	bl LoadOam
	bl ProcessSpriteCopyRequests
	bl TransferPlttBuffer
	pop {r0}
	bx r0
	thumb_func_end sub_80F8F18

	thumb_func_start sub_80F8F2C
sub_80F8F2C: @ 80F8F2C
	push {r4,lr}
	ldr r4, _080F8F54 @ =0x02000000
	adds r0, r4, 0
	adds r0, 0xFB
	ldrb r0, [r0]
	cmp r0, 0
	beq _080F8F42
	bl AnimateSprites
	bl BuildOamBuffer
_080F8F42:
	adds r0, r4, 0
	adds r0, 0xF0
	ldr r0, [r0]
	bl _call_via_r0
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080F8F54: .4byte 0x02000000
	thumb_func_end sub_80F8F2C

	thumb_func_start sub_80F8F58
sub_80F8F58: @ 80F8F58
	push {lr}
	bl UpdatePaletteFade
	lsls r0, 24
	cmp r0, 0
	bne _080F8F6C
	ldr r0, _080F8F70 @ =0x02000000
	adds r0, 0xF0
	ldr r1, _080F8F74 @ =sub_80F8F78
	str r1, [r0]
_080F8F6C:
	pop {r0}
	bx r0
	.align 2, 0
_080F8F70: .4byte 0x02000000
_080F8F74: .4byte sub_80F8F78
	thumb_func_end sub_80F8F58

	thumb_func_start sub_80F8F78
sub_80F8F78: @ 80F8F78
	push {lr}
	sub sp, 0x4
	ldr r0, _080F8FA8 @ =gMain
	ldrh r1, [r0, 0x2E]
	movs r0, 0x3
	ands r0, r1
	cmp r0, 0
	beq _080F8FA0
	movs r0, 0x1
	negs r0, r0
	movs r1, 0
	str r1, [sp]
	movs r2, 0
	movs r3, 0x10
	bl BeginNormalPaletteFade
	ldr r0, _080F8FAC @ =0x02000000
	adds r0, 0xF0
	ldr r1, _080F8FB0 @ =sub_80F8FB4
	str r1, [r0]
_080F8FA0:
	add sp, 0x4
	pop {r0}
	bx r0
	.align 2, 0
_080F8FA8: .4byte gMain
_080F8FAC: .4byte 0x02000000
_080F8FB0: .4byte sub_80F8FB4
	thumb_func_end sub_80F8F78

	thumb_func_start sub_80F8FB4
sub_80F8FB4: @ 80F8FB4
	push {r4,lr}
	bl UpdatePaletteFade
	lsls r0, 24
	cmp r0, 0
	bne _080F9012
	ldr r4, _080F9018 @ =0x02000000
	adds r0, r4, 0
	adds r0, 0xEC
	ldr r0, [r0]
	bl SetMainCallback2
	adds r0, r4, 0
	adds r0, 0xFB
	ldrb r0, [r0]
	cmp r0, 0x2
	bgt _080F9002
	cmp r0, 0x1
	blt _080F9002
	adds r0, r4, 0
	adds r0, 0xF4
	ldr r0, [r0]
	ldrh r0, [r0, 0x1E]
	bl sub_809D4A8
	lsls r0, 16
	lsrs r0, 16
	bl sub_809D608
	adds r0, r4, 0
	adds r0, 0xFC
	ldrb r1, [r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	ldr r1, _080F901C @ =gSprites
	adds r0, r1
	bl sub_809D510
_080F9002:
	ldr r0, _080F9018 @ =0x02000000
	movs r2, 0x88
	lsls r2, 1
	movs r1, 0
	bl memset
	bl ResetPaletteFade
_080F9012:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080F9018: .4byte 0x02000000
_080F901C: .4byte gSprites
	thumb_func_end sub_80F8FB4

	.align 2, 0 @ Don't pad with nop.
