	.include "constants/gba_constants.inc"
	.include "constants/species_constants.inc"
	.include "asm/macros.inc"

	.syntax unified

	.text

	thumb_func_start ma00_load_graphics
ma00_load_graphics: @ 8075A10
	push {r4-r6,lr}
	ldr r6, _08075A5C @ =gUnknown_0202F7A4
	ldr r0, [r6]
	adds r1, r0, 0x1
	str r1, [r6]
	ldrb r4, [r0, 0x1]
	ldrb r0, [r1, 0x1]
	lsls r0, 8
	orrs r4, r0
	lsls r5, r4, 3
	ldr r0, _08075A60 @ =gBattleAnimPicTable - (10000 * 8)
	adds r0, r5, r0
	bl LoadCompressedObjectPic
	ldr r0, _08075A64 @ =gBattleAnimPaletteTable - (10000 * 8)
	adds r5, r0
	adds r0, r5, 0
	bl LoadCompressedObjectPalette
	ldr r0, [r6]
	adds r0, 0x2
	str r0, [r6]
	ldr r0, _08075A68 @ =0xffffd8f0
	adds r4, r0
	lsls r4, 16
	lsrs r4, 16
	adds r0, r4, 0
	bl sub_8075940
	ldr r1, _08075A6C @ =gUnknown_0202F7B0
	movs r0, 0x1
	strb r0, [r1]
	ldr r1, _08075A70 @ =gUnknown_0202F7AC
	ldr r0, _08075A74 @ =move_anim_waiter
	str r0, [r1]
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_08075A5C: .4byte gUnknown_0202F7A4
_08075A60: .4byte gBattleAnimPicTable - (10000 * 8)
_08075A64: .4byte gBattleAnimPaletteTable - (10000 * 8)
_08075A68: .4byte 0xffffd8f0
_08075A6C: .4byte gUnknown_0202F7B0
_08075A70: .4byte gUnknown_0202F7AC
_08075A74: .4byte move_anim_waiter
	thumb_func_end ma00_load_graphics

	thumb_func_start ma01_080728D0
ma01_080728D0: @ 8075A78
	push {r4-r6,lr}
	ldr r6, _08075AB8 @ =gUnknown_0202F7A4
	ldr r0, [r6]
	adds r1, r0, 0x1
	str r1, [r6]
	ldrb r4, [r0, 0x1]
	ldrb r0, [r1, 0x1]
	lsls r0, 8
	orrs r4, r0
	ldr r1, _08075ABC @ =gBattleAnimPicTable
	ldr r0, _08075AC0 @ =0xffffd8f0
	adds r4, r0
	lsls r0, r4, 3
	adds r0, r1
	ldrh r5, [r0, 0x6]
	adds r0, r5, 0
	bl FreeSpriteTilesByTag
	adds r0, r5, 0
	bl FreeSpritePaletteByTag
	ldr r0, [r6]
	adds r0, 0x2
	str r0, [r6]
	lsls r4, 16
	lsrs r4, 16
	adds r0, r4, 0
	bl sub_8075970
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_08075AB8: .4byte gUnknown_0202F7A4
_08075ABC: .4byte gBattleAnimPicTable
_08075AC0: .4byte 0xffffd8f0
	thumb_func_end ma01_080728D0

	thumb_func_start ma02_instanciate_template
ma02_instanciate_template: @ 8075AC4
	push {r4-r7,lr}
	ldr r5, _08075B2C @ =gUnknown_0202F7A4
	ldr r1, [r5]
	adds r3, r1, 0x1
	str r3, [r5]
	ldrb r2, [r1, 0x1]
	ldrb r0, [r3, 0x1]
	lsls r0, 8
	adds r2, r0
	ldrb r0, [r3, 0x2]
	lsls r0, 16
	adds r2, r0
	ldrb r0, [r3, 0x3]
	lsls r0, 24
	adds r7, r2, r0
	adds r0, r1, 0x5
	str r0, [r5]
	ldrb r4, [r1, 0x5]
	adds r0, r1, 0x6
	str r0, [r5]
	ldrb r0, [r1, 0x6]
	adds r1, 0x7
	str r1, [r5]
	cmp r0, 0
	beq _08075B14
	adds r6, r5, 0
	ldr r5, _08075B30 @ =gBattleAnimArgs
	adds r3, r0, 0
_08075AFC:
	ldr r2, [r6]
	ldrb r1, [r2]
	ldrb r0, [r2, 0x1]
	lsls r0, 8
	orrs r1, r0
	strh r1, [r5]
	adds r2, 0x2
	str r2, [r6]
	adds r5, 0x2
	subs r3, 0x1
	cmp r3, 0
	bne _08075AFC
_08075B14:
	movs r0, 0x80
	ands r0, r4
	cmp r0, 0
	beq _08075B44
	movs r0, 0x80
	eors r4, r0
	cmp r4, 0x3F
	bls _08075B34
	adds r0, r4, 0
	subs r0, 0x40
	b _08075B36
	.align 2, 0
_08075B2C: .4byte gUnknown_0202F7A4
_08075B30: .4byte gBattleAnimArgs
_08075B34:
	negs r0, r4
_08075B36:
	lsls r0, 24
	lsrs r4, r0, 24
	ldr r0, _08075B40 @ =gUnknown_0202F7C9
	b _08075B56
	.align 2, 0
_08075B40: .4byte gUnknown_0202F7C9
_08075B44:
	cmp r4, 0x3F
	bls _08075B4E
	adds r0, r4, 0
	subs r0, 0x40
	b _08075B50
_08075B4E:
	negs r0, r4
_08075B50:
	lsls r0, 24
	lsrs r4, r0, 24
	ldr r0, _08075BAC @ =gUnknown_0202F7C8
_08075B56:
	ldrb r0, [r0]
	bl sub_8079E90
	lsls r0, 24
	lsrs r0, 24
	lsls r1, r4, 24
	asrs r1, 24
	adds r0, r1
	lsls r0, 16
	lsrs r6, r0, 16
	lsls r0, r6, 16
	asrs r0, 16
	cmp r0, 0x2
	bgt _08075B74
	movs r6, 0x3
_08075B74:
	ldr r5, _08075BB0 @ =gUnknown_0202F7C9
	ldrb r0, [r5]
	movs r1, 0x2
	bl sub_8077ABC
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	ldrb r0, [r5]
	movs r1, 0x3
	bl sub_8077ABC
	adds r2, r0, 0
	lsls r2, 24
	lsrs r2, 24
	lsls r3, r6, 24
	lsrs r3, 24
	adds r0, r7, 0
	adds r1, r4, 0
	bl CreateSpriteAndAnimate
	ldr r1, _08075BB4 @ =gUnknown_0202F7B2
	ldrb r0, [r1]
	adds r0, 0x1
	strb r0, [r1]
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_08075BAC: .4byte gUnknown_0202F7C8
_08075BB0: .4byte gUnknown_0202F7C9
_08075BB4: .4byte gUnknown_0202F7B2
	thumb_func_end ma02_instanciate_template

	thumb_func_start sub_8075BB8
sub_8075BB8: @ 8075BB8
	push {r4-r7,lr}
	ldr r4, _08075C28 @ =gUnknown_0202F7A4
	ldr r1, [r4]
	adds r3, r1, 0x1
	str r3, [r4]
	ldrb r2, [r1, 0x1]
	ldrb r0, [r3, 0x1]
	lsls r0, 8
	adds r2, r0
	ldrb r0, [r3, 0x2]
	lsls r0, 16
	adds r2, r0
	ldrb r0, [r3, 0x3]
	lsls r0, 24
	adds r6, r2, r0
	adds r0, r1, 0x5
	str r0, [r4]
	ldrb r7, [r1, 0x5]
	adds r0, r1, 0x6
	str r0, [r4]
	ldrb r0, [r1, 0x6]
	adds r1, 0x7
	str r1, [r4]
	cmp r0, 0
	beq _08075C08
	adds r5, r4, 0
	ldr r4, _08075C2C @ =gBattleAnimArgs
	adds r3, r0, 0
_08075BF0:
	ldr r2, [r5]
	ldrb r1, [r2]
	ldrb r0, [r2, 0x1]
	lsls r0, 8
	orrs r1, r0
	strh r1, [r4]
	adds r2, 0x2
	str r2, [r5]
	adds r4, 0x2
	subs r3, 0x1
	cmp r3, 0
	bne _08075BF0
_08075C08:
	adds r0, r6, 0
	adds r1, r7, 0
	bl CreateTask
	lsls r0, 24
	lsrs r0, 24
	bl _call_via_r6
	ldr r1, _08075C30 @ =gUnknown_0202F7B2
	ldrb r0, [r1]
	adds r0, 0x1
	strb r0, [r1]
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_08075C28: .4byte gUnknown_0202F7A4
_08075C2C: .4byte gBattleAnimArgs
_08075C30: .4byte gUnknown_0202F7B2
	thumb_func_end sub_8075BB8

	thumb_func_start ma04_wait_countdown
ma04_wait_countdown: @ 8075C34
	push {r4,lr}
	ldr r1, _08075C64 @ =gUnknown_0202F7A4
	ldr r0, [r1]
	adds r2, r0, 0x1
	str r2, [r1]
	ldr r3, _08075C68 @ =gUnknown_0202F7B0
	ldrb r0, [r0, 0x1]
	strb r0, [r3]
	lsls r0, 24
	cmp r0, 0
	bne _08075C52
	movs r4, 0x1
	negs r4, r4
	adds r0, r4, 0
	strb r0, [r3]
_08075C52:
	adds r0, r2, 0x1
	str r0, [r1]
	ldr r1, _08075C6C @ =gUnknown_0202F7AC
	ldr r0, _08075C70 @ =move_anim_waiter
	str r0, [r1]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08075C64: .4byte gUnknown_0202F7A4
_08075C68: .4byte gUnknown_0202F7B0
_08075C6C: .4byte gUnknown_0202F7AC
_08075C70: .4byte move_anim_waiter
	thumb_func_end ma04_wait_countdown

	thumb_func_start sub_8075C74
sub_8075C74: @ 8075C74
	push {lr}
	ldr r0, _08075C8C @ =gUnknown_0202F7B2
	ldrb r2, [r0]
	cmp r2, 0
	bne _08075C98
	ldr r0, _08075C90 @ =gUnknown_0202F7A4
	ldr r1, [r0]
	adds r1, 0x1
	str r1, [r0]
	ldr r0, _08075C94 @ =gUnknown_0202F7B0
	strb r2, [r0]
	b _08075C9E
	.align 2, 0
_08075C8C: .4byte gUnknown_0202F7B2
_08075C90: .4byte gUnknown_0202F7A4
_08075C94: .4byte gUnknown_0202F7B0
_08075C98:
	ldr r1, _08075CA4 @ =gUnknown_0202F7B0
	movs r0, 0x1
	strb r0, [r1]
_08075C9E:
	pop {r0}
	bx r0
	.align 2, 0
_08075CA4: .4byte gUnknown_0202F7B0
	thumb_func_end sub_8075C74

	thumb_func_start nullsub_53
nullsub_53: @ 8075CA8
	bx lr
	thumb_func_end nullsub_53

	thumb_func_start nullsub_88
nullsub_88: @ 8075CAC
	bx lr
	thumb_func_end nullsub_88

	thumb_func_start sub_8075CB0
sub_8075CB0: @ 8075CB0
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	movs r0, 0
	mov r8, r0
	ldr r0, _08075CE0 @ =gUnknown_0202F7B2
	ldrb r0, [r0]
	cmp r0, 0
	bne _08075CD8
	ldr r0, _08075CE4 @ =gUnknown_0202F7B3
	ldrb r0, [r0]
	cmp r0, 0
	bne _08075CD8
	ldr r1, _08075CE8 @ =gUnknown_0202F7C2
	ldrb r0, [r1]
	cmp r0, 0xFF
	bne _08075CD8
	ldrb r0, [r1, 0x1]
	cmp r0, 0xFF
	beq _08075CF0
_08075CD8:
	ldr r1, _08075CEC @ =gUnknown_03004AF0
	movs r0, 0
	strh r0, [r1]
	b _08075D0A
	.align 2, 0
_08075CE0: .4byte gUnknown_0202F7B2
_08075CE4: .4byte gUnknown_0202F7B3
_08075CE8: .4byte gUnknown_0202F7C2
_08075CEC: .4byte gUnknown_03004AF0
_08075CF0:
	bl IsSEPlaying
	lsls r0, 24
	cmp r0, 0
	beq _08075D28
	ldr r1, _08075D14 @ =gUnknown_03004AF0
	ldrh r0, [r1]
	adds r0, 0x1
	strh r0, [r1]
	lsls r0, 16
	lsrs r0, 16
	cmp r0, 0x5A
	bhi _08075D1C
_08075D0A:
	ldr r1, _08075D18 @ =gUnknown_0202F7B0
	movs r0, 0x1
	strb r0, [r1]
	b _08075D8E
	.align 2, 0
_08075D14: .4byte gUnknown_03004AF0
_08075D18: .4byte gUnknown_0202F7B0
_08075D1C:
	ldr r0, _08075D98 @ =gMPlay_SE1
	bl m4aMPlayStop
	ldr r0, _08075D9C @ =gMPlay_SE2
	bl m4aMPlayStop
_08075D28:
	ldr r1, _08075DA0 @ =gUnknown_03004AF0
	movs r0, 0
	strh r0, [r1]
	movs r5, 0
	ldr r7, _08075DA4 @ =0x0000ffff
	ldr r6, _08075DA8 @ =gBattleAnimPicTable
	ldr r4, _08075DAC @ =gUnknown_03004B10
_08075D36:
	ldrh r0, [r4]
	cmp r0, r7
	beq _08075D5A
	lsls r0, 3
	adds r0, r6
	ldrh r0, [r0, 0x6]
	bl FreeSpriteTilesByTag
	ldrh r0, [r4]
	lsls r0, 3
	adds r0, r6
	ldrh r0, [r0, 0x6]
	bl FreeSpritePaletteByTag
	ldrh r1, [r4]
	adds r0, r7, 0
	orrs r0, r1
	strh r0, [r4]
_08075D5A:
	adds r4, 0x2
	adds r5, 0x1
	cmp r5, 0x7
	ble _08075D36
	mov r1, r8
	cmp r1, 0
	bne _08075D8E
	ldr r0, _08075DB0 @ =gMPlay_BGM
	ldr r1, _08075DA4 @ =0x0000ffff
	movs r2, 0x80
	lsls r2, 1
	bl m4aMPlayVolumeControl
	bl sub_8076BE0
	lsls r0, 24
	cmp r0, 0
	bne _08075D88
	bl sub_8079E24
	movs r0, 0x1
	bl sub_8043EB4
_08075D88:
	ldr r0, _08075DB4 @ =gUnknown_0202F7B1
	mov r1, r8
	strb r1, [r0]
_08075D8E:
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_08075D98: .4byte gMPlay_SE1
_08075D9C: .4byte gMPlay_SE2
_08075DA0: .4byte gUnknown_03004AF0
_08075DA4: .4byte 0x0000ffff
_08075DA8: .4byte gBattleAnimPicTable
_08075DAC: .4byte gUnknown_03004B10
_08075DB0: .4byte gMPlay_BGM
_08075DB4: .4byte gUnknown_0202F7B1
	thumb_func_end sub_8075CB0

	thumb_func_start ma09_play_sound
ma09_play_sound: @ 8075DB8
	push {r4,lr}
	ldr r4, _08075DDC @ =gUnknown_0202F7A4
	ldr r0, [r4]
	adds r1, r0, 0x1
	str r1, [r4]
	ldrb r0, [r0, 0x1]
	ldrb r1, [r1, 0x1]
	lsls r1, 8
	orrs r0, r1
	bl PlaySE
	ldr r0, [r4]
	adds r0, 0x2
	str r0, [r4]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08075DDC: .4byte gUnknown_0202F7A4
	thumb_func_end ma09_play_sound

	thumb_func_start sub_8075DE0
sub_8075DE0: @ 8075DE0
	push {r4-r7,lr}
	ldr r0, _08075DF4 @ =gUnknown_0202F7A4
	ldr r2, [r0]
	adds r1, r2, 0x1
	str r1, [r0]
	ldrb r6, [r2, 0x1]
	cmp r6, 0
	bne _08075DF8
	movs r6, 0x2
	b _08075E02
	.align 2, 0
_08075DF4: .4byte gUnknown_0202F7A4
_08075DF8:
	cmp r6, 0x1
	bne _08075DFE
	movs r6, 0x3
_08075DFE:
	cmp r6, 0
	beq _08075E06
_08075E02:
	cmp r6, 0x2
	bne _08075E10
_08075E06:
	ldr r0, _08075E0C @ =gUnknown_0202F7C8
	b _08075E12
	.align 2, 0
_08075E0C: .4byte gUnknown_0202F7C8
_08075E10:
	ldr r0, _08075E44 @ =gUnknown_0202F7C9
_08075E12:
	ldrb r5, [r0]
	adds r0, r5, 0
	bl b_side_obj__get_some_boolean
	lsls r0, 24
	cmp r0, 0
	beq _08075ECE
	adds r0, r5, 0
	bl battle_get_per_side_status
	lsls r0, 24
	movs r1, 0xFF
	lsls r1, 24
	adds r0, r1
	lsrs r0, 24
	cmp r0, 0x1
	bls _08075E3E
	bl sub_8076BE0
	lsls r0, 24
	cmp r0, 0
	beq _08075E48
_08075E3E:
	movs r7, 0
	b _08075E4A
	.align 2, 0
_08075E44: .4byte gUnknown_0202F7C9
_08075E48:
	movs r7, 0x1
_08075E4A:
	adds r0, r5, 0
	adds r1, r7, 0
	bl sub_8076034
	ldr r0, _08075E98 @ =gUnknown_02024BE0
	adds r0, r5, r0
	ldrb r4, [r0]
	ldr r0, _08075E9C @ =task_pA_ma0A_obj_to_bg_pal
	movs r1, 0xA
	bl CreateTask
	lsls r0, 24
	lsrs r3, r0, 24
	ldr r1, _08075EA0 @ =gTasks
	lsls r0, r3, 2
	adds r0, r3
	lsls r0, 3
	adds r2, r0, r1
	strh r4, [r2, 0x8]
	ldr r1, _08075EA4 @ =gSprites
	lsls r0, r4, 4
	adds r0, r4
	lsls r0, 2
	adds r0, r1
	ldrh r1, [r0, 0x24]
	ldrh r4, [r0, 0x20]
	adds r1, r4
	strh r1, [r2, 0xA]
	ldrh r1, [r0, 0x26]
	ldrh r0, [r0, 0x22]
	adds r1, r0
	strh r1, [r2, 0xC]
	cmp r7, 0
	bne _08075EB0
	ldr r0, _08075EA8 @ =gUnknown_030042C0
	ldrh r0, [r0]
	strh r0, [r2, 0xE]
	ldr r0, _08075EAC @ =gUnknown_030041B4
	b _08075EB8
	.align 2, 0
_08075E98: .4byte gUnknown_02024BE0
_08075E9C: .4byte task_pA_ma0A_obj_to_bg_pal
_08075EA0: .4byte gTasks
_08075EA4: .4byte gSprites
_08075EA8: .4byte gUnknown_030042C0
_08075EAC: .4byte gUnknown_030041B4
_08075EB0:
	ldr r0, _08075F04 @ =gUnknown_03004288
	ldrh r0, [r0]
	strh r0, [r2, 0xE]
	ldr r0, _08075F08 @ =gUnknown_03004280
_08075EB8:
	ldrh r0, [r0]
	strh r0, [r2, 0x10]
	ldr r0, _08075F0C @ =gTasks
	lsls r1, r3, 2
	adds r1, r3
	lsls r1, 3
	adds r1, r0
	strh r7, [r1, 0x12]
	strh r5, [r1, 0x14]
	ldr r0, _08075F10 @ =gUnknown_0202F7C2
	strb r3, [r0]
_08075ECE:
	movs r0, 0x2
	eors r5, r0
	cmp r6, 0x1
	bls _08075F9A
	adds r0, r5, 0
	bl b_side_obj__get_some_boolean
	lsls r0, 24
	cmp r0, 0
	beq _08075F9A
	adds r0, r5, 0
	bl battle_get_per_side_status
	lsls r0, 24
	movs r1, 0xFF
	lsls r1, 24
	adds r0, r1
	lsrs r0, 24
	cmp r0, 0x1
	bls _08075F00
	bl sub_8076BE0
	lsls r0, 24
	cmp r0, 0
	beq _08075F14
_08075F00:
	movs r7, 0
	b _08075F16
	.align 2, 0
_08075F04: .4byte gUnknown_03004288
_08075F08: .4byte gUnknown_03004280
_08075F0C: .4byte gTasks
_08075F10: .4byte gUnknown_0202F7C2
_08075F14:
	movs r7, 0x1
_08075F16:
	adds r0, r5, 0
	adds r1, r7, 0
	bl sub_8076034
	ldr r0, _08075F64 @ =gUnknown_02024BE0
	adds r0, r5, r0
	ldrb r4, [r0]
	ldr r0, _08075F68 @ =task_pA_ma0A_obj_to_bg_pal
	movs r1, 0xA
	bl CreateTask
	lsls r0, 24
	lsrs r3, r0, 24
	ldr r1, _08075F6C @ =gTasks
	lsls r0, r3, 2
	adds r0, r3
	lsls r0, 3
	adds r2, r0, r1
	strh r4, [r2, 0x8]
	ldr r1, _08075F70 @ =gSprites
	lsls r0, r4, 4
	adds r0, r4
	lsls r0, 2
	adds r0, r1
	ldrh r1, [r0, 0x24]
	ldrh r4, [r0, 0x20]
	adds r1, r4
	strh r1, [r2, 0xA]
	ldrh r1, [r0, 0x26]
	ldrh r0, [r0, 0x22]
	adds r1, r0
	strh r1, [r2, 0xC]
	cmp r7, 0
	bne _08075F7C
	ldr r0, _08075F74 @ =gUnknown_030042C0
	ldrh r0, [r0]
	strh r0, [r2, 0xE]
	ldr r0, _08075F78 @ =gUnknown_030041B4
	b _08075F84
	.align 2, 0
_08075F64: .4byte gUnknown_02024BE0
_08075F68: .4byte task_pA_ma0A_obj_to_bg_pal
_08075F6C: .4byte gTasks
_08075F70: .4byte gSprites
_08075F74: .4byte gUnknown_030042C0
_08075F78: .4byte gUnknown_030041B4
_08075F7C:
	ldr r0, _08075FA8 @ =gUnknown_03004288
	ldrh r0, [r0]
	strh r0, [r2, 0xE]
	ldr r0, _08075FAC @ =gUnknown_03004280
_08075F84:
	ldrh r0, [r0]
	strh r0, [r2, 0x10]
	ldr r0, _08075FB0 @ =gTasks
	lsls r1, r3, 2
	adds r1, r3
	lsls r1, 3
	adds r1, r0
	strh r7, [r1, 0x12]
	strh r5, [r1, 0x14]
	ldr r0, _08075FB4 @ =gUnknown_0202F7C2
	strb r3, [r0, 0x1]
_08075F9A:
	ldr r1, _08075FB8 @ =gUnknown_0202F7A4
	ldr r0, [r1]
	adds r0, 0x1
	str r0, [r1]
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_08075FA8: .4byte gUnknown_03004288
_08075FAC: .4byte gUnknown_03004280
_08075FB0: .4byte gTasks
_08075FB4: .4byte gUnknown_0202F7C2
_08075FB8: .4byte gUnknown_0202F7A4
	thumb_func_end sub_8075DE0

	thumb_func_start b_side_obj__get_some_boolean
b_side_obj__get_some_boolean: @ 8075FBC
	push {r4,r5,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	adds r5, r4, 0
	bl sub_8076BE0
	lsls r0, 24
	cmp r0, 0
	beq _08075FDC
	ldr r0, _08075FD8 @ =gUnknown_0202F7C8
	ldrb r0, [r0]
	cmp r4, r0
	beq _0807601C
	b _0807602C
	.align 2, 0
_08075FD8: .4byte gUnknown_0202F7C8
_08075FDC:
	adds r0, r4, 0
	bl sub_8078874
	lsls r0, 24
	cmp r0, 0
	beq _0807602C
	bl sub_8076BE0
	lsls r0, 24
	cmp r0, 0
	bne _0807601C
	lsls r0, r5, 2
	ldr r1, _08076020 @ =0x02017800
	adds r0, r1
	ldrb r1, [r0]
	movs r0, 0x1
	ands r0, r1
	cmp r0, 0
	beq _0807601C
	ldr r2, _08076024 @ =gSprites
	ldr r0, _08076028 @ =gUnknown_02024BE0
	adds r0, r5, r0
	ldrb r1, [r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r2
	adds r0, 0x3E
	ldrb r0, [r0]
	lsls r0, 29
	cmp r0, 0
	blt _0807602C
_0807601C:
	movs r0, 0x1
	b _0807602E
	.align 2, 0
_08076020: .4byte 0x02017800
_08076024: .4byte gSprites
_08076028: .4byte gUnknown_02024BE0
_0807602C:
	movs r0, 0
_0807602E:
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end b_side_obj__get_some_boolean

	thumb_func_start sub_8076034
sub_8076034: @ 8076034
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	sub sp, 0x28
	lsls r0, 24
	lsrs r0, 24
	mov r9, r0
	lsls r1, 24
	cmp r1, 0
	beq _0807604E
	b _08076220
_0807604E:
	add r4, sp, 0x10
	adds r0, r4, 0
	bl sub_8078914
	ldr r2, [sp, 0x10]
	movs r3, 0x80
	lsls r3, 6
	add r6, sp, 0x1C
	add r0, sp, 0x20
	mov r10, r0
	mov r1, r9
	lsls r1, 5
	str r1, [sp, 0x24]
	movs r5, 0
	ldr r1, _08076194 @ =0x040000d4
	movs r4, 0x80
	lsls r4, 5
	mov r12, r6
	ldr r7, _08076198 @ =0x85000400
	movs r0, 0x85
	lsls r0, 24
	mov r8, r0
_0807607A:
	str r5, [sp, 0x1C]
	mov r0, r12
	str r0, [r1]
	str r2, [r1, 0x4]
	str r7, [r1, 0x8]
	ldr r0, [r1, 0x8]
	adds r2, r4
	subs r3, r4
	cmp r3, r4
	bhi _0807607A
	str r5, [sp, 0x1C]
	str r6, [r1]
	str r2, [r1, 0x4]
	lsrs r0, r3, 2
	mov r2, r8
	orrs r0, r2
	str r0, [r1, 0x8]
	ldr r0, [r1, 0x8]
	add r0, sp, 0xC
	movs r1, 0
	strb r1, [r0]
	strb r1, [r0]
	ldr r1, [sp, 0x14]
	movs r0, 0xFF
	mov r3, r10
	strh r0, [r3]
	ldr r0, _08076194 @ =0x040000d4
	str r3, [r0]
	str r1, [r0, 0x4]
	ldr r1, _0807619C @ =0x81000800
	str r1, [r0, 0x8]
	ldr r0, [r0, 0x8]
	ldr r2, _080761A0 @ =REG_BG1CNT
	ldrb r1, [r2]
	movs r0, 0x4
	negs r0, r0
	ands r0, r1
	movs r1, 0x2
	orrs r0, r1
	strb r0, [r2]
	ldrb r1, [r2, 0x1]
	movs r0, 0x3F
	ands r0, r1
	movs r1, 0x40
	orrs r0, r1
	strb r0, [r2, 0x1]
	ldrb r1, [r2, 0x1]
	movs r0, 0x21
	negs r0, r0
	ands r0, r1
	strb r0, [r2, 0x1]
	ldr r0, _080761A4 @ =gUnknown_02024BE0
	add r0, r9
	ldrb r4, [r0]
	ldr r5, _080761A8 @ =gUnknown_030042C0
	ldr r0, _080761AC @ =gSprites
	lsls r1, r4, 4
	adds r1, r4
	lsls r1, 2
	adds r1, r0
	ldrh r0, [r1, 0x24]
	ldrh r1, [r1, 0x20]
	adds r0, r1
	negs r0, r0
	adds r0, 0x20
	strh r0, [r5]
	bl sub_8076BE0
	lsls r0, 24
	cmp r0, 0
	beq _0807611C
	ldr r0, _080761B0 @ =0x02019348
	ldrh r0, [r0]
	bl sub_80AEB1C
	lsls r0, 24
	cmp r0, 0
	beq _0807611C
	ldrh r0, [r5]
	subs r0, 0x1
	strh r0, [r5]
_0807611C:
	ldr r3, _080761B4 @ =gUnknown_030041B4
	ldr r2, _080761AC @ =gSprites
	lsls r1, r4, 4
	adds r1, r4
	lsls r1, 2
	adds r1, r2
	ldrh r0, [r1, 0x26]
	ldrh r1, [r1, 0x22]
	adds r0, r1
	negs r0, r0
	adds r0, 0x20
	strh r0, [r3]
	ldr r0, _080761A4 @ =gUnknown_02024BE0
	add r0, r9
	ldrb r1, [r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r2
	adds r0, 0x3E
	ldrb r1, [r0]
	movs r2, 0x4
	orrs r1, r2
	strb r1, [r0]
	ldr r1, _080761B8 @ =REG_BG1HOFS
	ldr r0, _080761A8 @ =gUnknown_030042C0
	ldrh r0, [r0]
	strh r0, [r1]
	adds r1, 0x2
	ldrh r0, [r3]
	strh r0, [r1]
	ldr r4, _080761BC @ =gPlttBufferUnfaded + 0x200
	ldr r0, [sp, 0x24]
	adds r4, r0, r4
	mov r2, sp
	ldrb r1, [r2, 0x18]
	lsls r1, 4
	adds r0, r4, 0
	movs r2, 0x20
	bl LoadPalette
	mov r3, sp
	ldrb r0, [r3, 0x18]
	lsls r0, 5
	movs r1, 0xA0
	lsls r1, 19
	adds r0, r1
	ldr r1, _08076194 @ =0x040000d4
	str r4, [r1]
	str r0, [r1, 0x4]
	ldr r0, _080761C0 @ =0x84000008
	str r0, [r1, 0x8]
	ldr r0, [r1, 0x8]
	bl sub_8076BE0
	lsls r0, 24
	cmp r0, 0
	beq _080761C4
	movs r2, 0
	b _080761CE
	.align 2, 0
_08076194: .4byte 0x040000d4
_08076198: .4byte 0x85000400
_0807619C: .4byte 0x81000800
_080761A0: .4byte REG_BG1CNT
_080761A4: .4byte gUnknown_02024BE0
_080761A8: .4byte gUnknown_030042C0
_080761AC: .4byte gSprites
_080761B0: .4byte 0x02019348
_080761B4: .4byte gUnknown_030041B4
_080761B8: .4byte REG_BG1HOFS
_080761BC: .4byte gPlttBufferUnfaded + 0x200
_080761C0: .4byte 0x84000008
_080761C4:
	mov r0, r9
	bl battle_get_per_side_status
	lsls r0, 24
	lsrs r2, r0, 24
_080761CE:
	mov r0, sp
	ldrb r3, [r0, 0x18]
	ldr r0, [sp, 0x10]
	lsls r0, 16
	lsrs r0, 16
	str r0, [sp]
	ldr r4, [sp, 0x14]
	movs r1, 0xFA
	lsls r1, 24
	adds r0, r4, r1
	cmp r0, 0
	bge _080761EA
	ldr r1, _08076218 @ =0xfa0007ff
	adds r0, r4, r1
_080761EA:
	asrs r0, 11
	lsls r0, 24
	lsrs r0, 24
	str r0, [sp, 0x4]
	ldr r0, _0807621C @ =REG_BG1CNT
	ldr r0, [r0]
	lsls r0, 28
	lsrs r0, 30
	str r0, [sp, 0x8]
	movs r0, 0
	movs r1, 0
	bl sub_80E4EF8
	bl sub_8076BE0
	lsls r0, 24
	cmp r0, 0
	bne _08076210
	b _08076338
_08076210:
	bl sub_8076380
	b _08076338
	.align 2, 0
_08076218: .4byte 0xfa0007ff
_0807621C: .4byte REG_BG1CNT
_08076220:
	ldr r3, _08076348 @ =0x06006000
	movs r5, 0x80
	lsls r5, 6
	add r6, sp, 0x1C
	ldr r2, _0807634C @ =gSprites
	mov r10, r2
	mov r0, r9
	lsls r0, 5
	str r0, [sp, 0x24]
	movs r4, 0
	ldr r1, _08076350 @ =0x040000d4
	movs r2, 0x80
	lsls r2, 5
	mov r12, r6
	ldr r7, _08076354 @ =0x85000400
	movs r0, 0x85
	lsls r0, 24
	mov r8, r0
_08076244:
	str r4, [sp, 0x1C]
	mov r0, r12
	str r0, [r1]
	str r3, [r1, 0x4]
	str r7, [r1, 0x8]
	ldr r0, [r1, 0x8]
	adds r3, r2
	subs r5, r2
	cmp r5, r2
	bhi _08076244
	str r4, [sp, 0x1C]
	str r6, [r1]
	str r3, [r1, 0x4]
	lsrs r0, r5, 2
	mov r2, r8
	orrs r0, r2
	str r0, [r1, 0x8]
	ldr r0, [r1, 0x8]
	add r0, sp, 0xC
	movs r1, 0
	strb r1, [r0]
	strb r1, [r0]
	ldr r1, _08076358 @ =0x0600f000
	movs r0, 0
	str r0, [sp, 0x1C]
	ldr r5, _08076350 @ =0x040000d4
	str r6, [r5]
	str r1, [r5, 0x4]
	ldr r0, _0807635C @ =0x85000200
	str r0, [r5, 0x8]
	ldr r0, [r5, 0x8]
	ldr r6, _08076360 @ =REG_BG2CNT
	ldrb r1, [r6]
	movs r0, 0x4
	negs r0, r0
	ands r0, r1
	movs r1, 0x2
	orrs r0, r1
	strb r0, [r6]
	ldrb r1, [r6, 0x1]
	movs r0, 0x3F
	ands r0, r1
	movs r1, 0x40
	orrs r0, r1
	strb r0, [r6, 0x1]
	ldrb r1, [r6, 0x1]
	movs r0, 0x21
	negs r0, r0
	ands r0, r1
	strb r0, [r6, 0x1]
	ldr r2, _08076364 @ =gUnknown_02024BE0
	add r2, r9
	ldrb r4, [r2]
	lsls r1, r4, 4
	adds r1, r4
	lsls r1, 2
	add r1, r10
	ldrh r0, [r1, 0x24]
	ldrh r3, [r1, 0x20]
	adds r0, r3
	negs r0, r0
	adds r0, 0x20
	ldr r3, _08076368 @ =gUnknown_03004288
	strh r0, [r3]
	ldrh r0, [r1, 0x26]
	ldrh r1, [r1, 0x22]
	adds r0, r1
	negs r0, r0
	adds r0, 0x20
	ldr r1, _0807636C @ =gUnknown_03004280
	strh r0, [r1]
	ldrb r1, [r2]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	add r0, r10
	adds r0, 0x3E
	ldrb r1, [r0]
	movs r2, 0x4
	orrs r1, r2
	strb r1, [r0]
	ldr r1, _08076370 @ =REG_BG2HOFS
	ldrh r0, [r3]
	strh r0, [r1]
	adds r1, 0x2
	ldr r2, _0807636C @ =gUnknown_03004280
	ldrh r0, [r2]
	strh r0, [r1]
	ldr r3, [sp, 0x24]
	ldr r0, _08076374 @ =gPlttBufferUnfaded + 0x200
	adds r4, r3, r0
	adds r0, r4, 0
	movs r1, 0x90
	movs r2, 0x20
	bl LoadPalette
	ldr r0, _08076378 @ =0x05000120
	str r4, [r5]
	str r0, [r5, 0x4]
	ldr r0, _0807637C @ =0x84000008
	str r0, [r5, 0x8]
	ldr r0, [r5, 0x8]
	mov r0, r9
	bl battle_get_per_side_status
	adds r2, r0, 0
	lsls r2, 24
	lsrs r2, 24
	movs r0, 0xC0
	lsls r0, 7
	str r0, [sp]
	movs r0, 0x1E
	str r0, [sp, 0x4]
	ldr r0, [r6]
	lsls r0, 28
	lsrs r0, 30
	str r0, [sp, 0x8]
	movs r0, 0
	movs r1, 0
	movs r3, 0x9
	bl sub_80E4EF8
_08076338:
	add sp, 0x28
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_08076348: .4byte 0x06006000
_0807634C: .4byte gSprites
_08076350: .4byte 0x040000d4
_08076354: .4byte 0x85000400
_08076358: .4byte 0x0600f000
_0807635C: .4byte 0x85000200
_08076360: .4byte REG_BG2CNT
_08076364: .4byte gUnknown_02024BE0
_08076368: .4byte gUnknown_03004288
_0807636C: .4byte gUnknown_03004280
_08076370: .4byte REG_BG2HOFS
_08076374: .4byte gPlttBufferUnfaded + 0x200
_08076378: .4byte 0x05000120
_0807637C: .4byte 0x84000008
	thumb_func_end sub_8076034

	thumb_func_start sub_8076380
sub_8076380: @ 8076380
	push {r4-r7,lr}
	sub sp, 0xC
	ldr r0, _080763F8 @ =0x02019348
	ldrh r0, [r0]
	bl sub_80AEB1C
	lsls r0, 24
	cmp r0, 0
	beq _080763EE
	mov r0, sp
	bl sub_8078914
	ldr r6, [sp, 0x4]
	movs r5, 0
	movs r0, 0x7
	mov r12, r0
	movs r7, 0
_080763A2:
	movs r4, 0
	adds r3, r7, r6
	mov r1, r12
	lsls r0, r1, 1
	adds r2, r0, r6
_080763AC:
	ldrh r1, [r3]
	ldrh r0, [r2]
	strh r0, [r3]
	strh r1, [r2]
	adds r3, 0x2
	subs r2, 0x2
	adds r4, 0x1
	cmp r4, 0x3
	ble _080763AC
	movs r0, 0x20
	add r12, r0
	adds r7, 0x40
	adds r5, 0x1
	cmp r5, 0x7
	ble _080763A2
	movs r5, 0
	movs r1, 0x80
	lsls r1, 3
	adds r3, r1, 0
_080763D2:
	adds r2, r5, 0x1
	lsls r0, r5, 6
	adds r1, r0, r6
	movs r4, 0x7
_080763DA:
	ldrh r0, [r1]
	eors r0, r3
	strh r0, [r1]
	adds r1, 0x2
	subs r4, 0x1
	cmp r4, 0
	bge _080763DA
	adds r5, r2, 0
	cmp r5, 0x7
	ble _080763D2
_080763EE:
	add sp, 0xC
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080763F8: .4byte 0x02019348
	thumb_func_end sub_8076380

	thumb_func_start sub_80763FC
sub_80763FC: @ 80763FC
	push {r4-r7,lr}
	mov r7, r9
	mov r6, r8
	push {r6,r7}
	mov r12, r1
	adds r7, r2, 0
	lsls r0, 16
	lsrs r6, r0, 16
	lsls r3, 24
	movs r0, 0x40
	mov r9, r0
	cmp r3, 0
	bne _0807641A
	movs r1, 0x20
	mov r9, r1
_0807641A:
	lsls r0, r6, 28
	lsrs r6, r0, 16
	movs r0, 0
	cmp r0, r9
	bcs _08076452
	ldr r1, _08076460 @ =0x00000fff
	mov r8, r1
_08076428:
	movs r3, 0
	adds r5, r0, 0x1
	lsls r4, r0, 5
_0807642E:
	adds r1, r4, r3
	lsls r1, 1
	add r1, r12
	ldrh r2, [r1]
	mov r0, r8
	ands r0, r2
	orrs r0, r6
	adds r0, r7
	strh r0, [r1]
	adds r0, r3, 0x1
	lsls r0, 24
	lsrs r3, r0, 24
	cmp r3, 0x1F
	bls _0807642E
	lsls r0, r5, 24
	lsrs r0, 24
	cmp r0, r9
	bcc _08076428
_08076452:
	pop {r3,r4}
	mov r8, r3
	mov r9, r4
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_08076460: .4byte 0x00000fff
	thumb_func_end sub_80763FC

	thumb_func_start sub_8076464
sub_8076464: @ 8076464
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	sub sp, 0x14
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	add r5, sp, 0x4
	adds r0, r5, 0
	bl sub_8078914
	cmp r4, 0
	beq _0807648C
	bl sub_8076BE0
	lsls r0, 24
	cmp r0, 0
	beq _080764F0
_0807648C:
	ldr r2, [sp, 0x4]
	movs r3, 0x80
	lsls r3, 6
	add r5, sp, 0x10
	ldr r0, _080764E0 @ =gUnknown_030042C0
	mov r9, r0
	ldr r0, _080764E4 @ =gUnknown_030041B4
	mov r10, r0
	movs r6, 0
	ldr r1, _080764E8 @ =0x040000d4
	movs r4, 0x80
	lsls r4, 5
	mov r12, r5
	ldr r7, _080764EC @ =0x85000400
	movs r0, 0x85
	lsls r0, 24
	mov r8, r0
_080764AE:
	str r6, [sp, 0x10]
	mov r0, r12
	str r0, [r1]
	str r2, [r1, 0x4]
	str r7, [r1, 0x8]
	ldr r0, [r1, 0x8]
	adds r2, r4
	subs r3, r4
	cmp r3, r4
	bhi _080764AE
	str r6, [sp, 0x10]
	str r5, [r1]
	str r2, [r1, 0x4]
	lsrs r0, r3, 2
	mov r2, r8
	orrs r0, r2
	str r0, [r1, 0x8]
	ldr r0, [r1, 0x8]
	mov r0, sp
	movs r1, 0
	strb r1, [r0]
	strb r1, [r0]
	ldr r1, [sp, 0x8]
	b _08076540
	.align 2, 0
_080764E0: .4byte gUnknown_030042C0
_080764E4: .4byte gUnknown_030041B4
_080764E8: .4byte 0x040000d4
_080764EC: .4byte 0x85000400
_080764F0:
	ldr r2, _08076568 @ =0x06006000
	movs r3, 0x80
	lsls r3, 6
	add r5, sp, 0x10
	ldr r0, _0807656C @ =gUnknown_03004288
	mov r9, r0
	ldr r0, _08076570 @ =gUnknown_03004280
	mov r10, r0
	movs r6, 0
	ldr r1, _08076574 @ =0x040000d4
	movs r4, 0x80
	lsls r4, 5
	mov r12, r5
	ldr r7, _08076578 @ =0x85000400
	movs r0, 0x85
	lsls r0, 24
	mov r8, r0
_08076512:
	str r6, [sp, 0x10]
	mov r0, r12
	str r0, [r1]
	str r2, [r1, 0x4]
	str r7, [r1, 0x8]
	ldr r0, [r1, 0x8]
	adds r2, r4
	subs r3, r4
	cmp r3, r4
	bhi _08076512
	str r6, [sp, 0x10]
	str r5, [r1]
	str r2, [r1, 0x4]
	lsrs r0, r3, 2
	mov r2, r8
	orrs r0, r2
	str r0, [r1, 0x8]
	ldr r0, [r1, 0x8]
	mov r0, sp
	movs r1, 0
	strb r1, [r0]
	strb r1, [r0]
	ldr r1, _0807657C @ =0x0600f000
_08076540:
	movs r2, 0
	str r2, [sp, 0x10]
	ldr r0, _08076574 @ =0x040000d4
	str r5, [r0]
	str r1, [r0, 0x4]
	ldr r1, _08076580 @ =0x85000200
	str r1, [r0, 0x8]
	ldr r0, [r0, 0x8]
	mov r0, r9
	strh r2, [r0]
	mov r0, r10
	strh r2, [r0]
	add sp, 0x14
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_08076568: .4byte 0x06006000
_0807656C: .4byte gUnknown_03004288
_08076570: .4byte gUnknown_03004280
_08076574: .4byte 0x040000d4
_08076578: .4byte 0x85000400
_0807657C: .4byte 0x0600f000
_08076580: .4byte 0x85000200
	thumb_func_end sub_8076464

	thumb_func_start task_pA_ma0A_obj_to_bg_pal
task_pA_ma0A_obj_to_bg_pal: @ 8076584
	push {r4-r6,lr}
	sub sp, 0xC
	lsls r0, 24
	lsrs r0, 24
	ldr r2, _080765FC @ =gTasks
	lsls r1, r0, 2
	adds r1, r0
	lsls r1, 3
	adds r5, r1, r2
	ldrb r4, [r5, 0x8]
	ldrb r6, [r5, 0x14]
	mov r0, sp
	bl sub_8078914
	ldr r0, _08076600 @ =gSprites
	lsls r1, r4, 4
	adds r1, r4
	lsls r1, 2
	adds r1, r0
	ldrh r2, [r1, 0x24]
	ldrh r0, [r1, 0x20]
	adds r2, r0
	ldrh r0, [r5, 0xA]
	subs r0, r2
	lsls r0, 16
	lsrs r3, r0, 16
	ldrh r2, [r1, 0x26]
	ldrh r1, [r1, 0x22]
	adds r2, r1
	ldrh r0, [r5, 0xC]
	subs r0, r2
	lsls r0, 16
	lsrs r2, r0, 16
	movs r1, 0x12
	ldrsh r0, [r5, r1]
	cmp r0, 0
	bne _08076614
	ldr r1, _08076604 @ =gUnknown_030042C0
	lsls r0, r3, 16
	asrs r0, 16
	ldrh r3, [r5, 0xE]
	adds r0, r3
	strh r0, [r1]
	ldr r1, _08076608 @ =gUnknown_030041B4
	lsls r0, r2, 16
	asrs r0, 16
	ldrh r5, [r5, 0x10]
	adds r0, r5
	strh r0, [r1]
	lsls r2, r6, 5
	ldr r1, _0807660C @ =gPlttBufferFaded + 0x200
	adds r2, r1
	mov r0, sp
	ldrb r0, [r0, 0x8]
	lsls r0, 5
	ldr r3, _08076610 @ =0xfffffe00
	adds r1, r3
	adds r0, r1
	b _08076634
	.align 2, 0
_080765FC: .4byte gTasks
_08076600: .4byte gSprites
_08076604: .4byte gUnknown_030042C0
_08076608: .4byte gUnknown_030041B4
_0807660C: .4byte gPlttBufferFaded + 0x200
_08076610: .4byte 0xfffffe00
_08076614:
	ldr r1, _08076648 @ =gUnknown_03004288
	lsls r0, r3, 16
	asrs r0, 16
	ldrh r3, [r5, 0xE]
	adds r0, r3
	strh r0, [r1]
	ldr r1, _0807664C @ =gUnknown_03004280
	lsls r0, r2, 16
	asrs r0, 16
	ldrh r5, [r5, 0x10]
	adds r0, r5
	strh r0, [r1]
	lsls r2, r6, 5
	ldr r0, _08076650 @ =gPlttBufferFaded + 0x200
	adds r2, r0
	subs r0, 0xE0
_08076634:
	ldr r1, _08076654 @ =0x040000d4
	str r2, [r1]
	str r0, [r1, 0x4]
	ldr r0, _08076658 @ =0x84000008
	str r0, [r1, 0x8]
	ldr r0, [r1, 0x8]
	add sp, 0xC
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_08076648: .4byte gUnknown_03004288
_0807664C: .4byte gUnknown_03004280
_08076650: .4byte gPlttBufferFaded + 0x200
_08076654: .4byte 0x040000d4
_08076658: .4byte 0x84000008
	thumb_func_end task_pA_ma0A_obj_to_bg_pal

	thumb_func_start ma0B_0807324C
ma0B_0807324C: @ 807665C
	push {r4,r5,lr}
	ldr r0, _08076670 @ =gUnknown_0202F7A4
	ldr r2, [r0]
	adds r1, r2, 0x1
	str r1, [r0]
	ldrb r4, [r2, 0x1]
	cmp r4, 0
	bne _08076674
	movs r4, 0x2
	b _0807667E
	.align 2, 0
_08076670: .4byte gUnknown_0202F7A4
_08076674:
	cmp r4, 0x1
	bne _0807667A
	movs r4, 0x3
_0807667A:
	cmp r4, 0
	beq _08076682
_0807667E:
	cmp r4, 0x2
	bne _0807668C
_08076682:
	ldr r0, _08076688 @ =gUnknown_0202F7C8
	b _0807668E
	.align 2, 0
_08076688: .4byte gUnknown_0202F7C8
_0807668C:
	ldr r0, _080766E4 @ =gUnknown_0202F7C9
_0807668E:
	ldrb r5, [r0]
	ldr r3, _080766E8 @ =gUnknown_0202F7C2
	ldrb r0, [r3]
	cmp r0, 0xFF
	beq _080766B4
	ldr r2, _080766EC @ =gSprites
	ldr r0, _080766F0 @ =gUnknown_02024BE0
	adds r0, r5, r0
	ldrb r1, [r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r2
	adds r0, 0x3E
	ldrb r2, [r0]
	movs r1, 0x5
	negs r1, r1
	ands r1, r2
	strb r1, [r0]
_080766B4:
	cmp r4, 0x1
	bls _080766F4
	ldrb r0, [r3, 0x1]
	cmp r0, 0xFF
	beq _080766F4
	ldr r3, _080766EC @ =gSprites
	ldr r2, _080766F0 @ =gUnknown_02024BE0
	movs r1, 0x2
	adds r0, r5, 0
	eors r0, r1
	adds r0, r2
	ldrb r1, [r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r3
	adds r0, 0x3E
	ldrb r2, [r0]
	movs r1, 0x5
	negs r1, r1
	ands r1, r2
	strb r1, [r0]
	b _080766F6
	.align 2, 0
_080766E4: .4byte gUnknown_0202F7C9
_080766E8: .4byte gUnknown_0202F7C2
_080766EC: .4byte gSprites
_080766F0: .4byte gUnknown_02024BE0
_080766F4:
	movs r4, 0
_080766F6:
	ldr r0, _08076720 @ =sub_807672C
	movs r1, 0x5
	bl CreateTask
	lsls r0, 24
	lsrs r0, 24
	ldr r2, _08076724 @ =gTasks
	lsls r1, r0, 2
	adds r1, r0
	lsls r1, 3
	adds r1, r2
	strh r4, [r1, 0x8]
	strh r5, [r1, 0xC]
	ldr r1, _08076728 @ =gUnknown_0202F7A4
	ldr r0, [r1]
	adds r0, 0x1
	str r0, [r1]
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_08076720: .4byte sub_807672C
_08076724: .4byte gTasks
_08076728: .4byte gUnknown_0202F7A4
	thumb_func_end ma0B_0807324C

	thumb_func_start sub_807672C
sub_807672C: @ 807672C
	push {r4-r6,lr}
	lsls r0, 24
	lsrs r5, r0, 24
	ldr r1, _0807676C @ =gTasks
	lsls r0, r5, 2
	adds r0, r5
	lsls r0, 3
	adds r1, r0, r1
	ldrh r0, [r1, 0xA]
	adds r0, 0x1
	strh r0, [r1, 0xA]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x1
	beq _080767B6
	ldrb r0, [r1, 0xC]
	bl battle_get_per_side_status
	lsls r0, 24
	movs r1, 0xFF
	lsls r1, 24
	adds r0, r1
	lsrs r0, 24
	cmp r0, 0x1
	bls _08076768
	bl sub_8076BE0
	lsls r0, 24
	cmp r0, 0
	beq _08076770
_08076768:
	movs r4, 0
	b _08076772
	.align 2, 0
_0807676C: .4byte gTasks
_08076770:
	movs r4, 0x1
_08076772:
	ldr r6, _080767BC @ =gUnknown_0202F7C2
	ldrb r0, [r6]
	cmp r0, 0xFF
	beq _0807678A
	adds r0, r4, 0
	bl sub_8076464
	ldrb r0, [r6]
	bl DestroyTask
	movs r0, 0xFF
	strb r0, [r6]
_0807678A:
	ldr r0, _080767C0 @ =gTasks
	lsls r1, r5, 2
	adds r1, r5
	lsls r1, 3
	adds r1, r0
	movs r2, 0x8
	ldrsh r0, [r1, r2]
	cmp r0, 0x1
	ble _080767B0
	movs r0, 0x1
	eors r4, r0
	adds r0, r4, 0
	bl sub_8076464
	ldrb r0, [r6, 0x1]
	bl DestroyTask
	movs r0, 0xFF
	strb r0, [r6, 0x1]
_080767B0:
	adds r0, r5, 0
	bl DestroyTask
_080767B6:
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_080767BC: .4byte gUnknown_0202F7C2
_080767C0: .4byte gTasks
	thumb_func_end sub_807672C

	thumb_func_start sub_80767C4
sub_80767C4: @ 80767C4
	push {r4,r5,lr}
	ldr r0, _080767D8 @ =gUnknown_0202F7A4
	ldr r2, [r0]
	adds r1, r2, 0x1
	str r1, [r0]
	ldrb r5, [r2, 0x1]
	cmp r5, 0
	bne _080767DC
	movs r5, 0x2
	b _080767E6
	.align 2, 0
_080767D8: .4byte gUnknown_0202F7A4
_080767DC:
	cmp r5, 0x1
	bne _080767E2
	movs r5, 0x3
_080767E2:
	cmp r5, 0
	beq _080767EA
_080767E6:
	cmp r5, 0x2
	bne _080767F4
_080767EA:
	ldr r0, _080767F0 @ =gUnknown_0202F7C8
	b _080767F6
	.align 2, 0
_080767F0: .4byte gUnknown_0202F7C8
_080767F4:
	ldr r0, _08076828 @ =gUnknown_0202F7C9
_080767F6:
	ldrb r4, [r0]
	adds r0, r4, 0
	bl b_side_obj__get_some_boolean
	lsls r0, 24
	cmp r0, 0
	beq _08076850
	adds r0, r4, 0
	bl battle_get_per_side_status
	lsls r0, 24
	movs r1, 0xFF
	lsls r1, 24
	adds r0, r1
	lsrs r0, 24
	cmp r0, 0x1
	bls _08076822
	bl sub_8076BE0
	lsls r0, 24
	cmp r0, 0
	beq _0807682C
_08076822:
	movs r1, 0
	b _0807682E
	.align 2, 0
_08076828: .4byte gUnknown_0202F7C9
_0807682C:
	movs r1, 0x1
_0807682E:
	adds r0, r4, 0
	bl sub_8076034
	ldr r2, _08076888 @ =gSprites
	ldr r0, _0807688C @ =gUnknown_02024BE0
	adds r0, r4, r0
	ldrb r1, [r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r2
	adds r0, 0x3E
	ldrb r2, [r0]
	movs r1, 0x5
	negs r1, r1
	ands r1, r2
	strb r1, [r0]
_08076850:
	movs r0, 0x2
	eors r4, r0
	cmp r5, 0x1
	bls _080768B4
	adds r0, r4, 0
	bl b_side_obj__get_some_boolean
	lsls r0, 24
	cmp r0, 0
	beq _080768B4
	adds r0, r4, 0
	bl battle_get_per_side_status
	lsls r0, 24
	movs r1, 0xFF
	lsls r1, 24
	adds r0, r1
	lsrs r0, 24
	cmp r0, 0x1
	bls _08076882
	bl sub_8076BE0
	lsls r0, 24
	cmp r0, 0
	beq _08076890
_08076882:
	movs r1, 0
	b _08076892
	.align 2, 0
_08076888: .4byte gSprites
_0807688C: .4byte gUnknown_02024BE0
_08076890:
	movs r1, 0x1
_08076892:
	adds r0, r4, 0
	bl sub_8076034
	ldr r2, _080768C4 @ =gSprites
	ldr r0, _080768C8 @ =gUnknown_02024BE0
	adds r0, r4, r0
	ldrb r1, [r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r2
	adds r0, 0x3E
	ldrb r2, [r0]
	movs r1, 0x5
	negs r1, r1
	ands r1, r2
	strb r1, [r0]
_080768B4:
	ldr r1, _080768CC @ =gUnknown_0202F7A4
	ldr r0, [r1]
	adds r0, 0x1
	str r0, [r1]
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080768C4: .4byte gSprites
_080768C8: .4byte gUnknown_02024BE0
_080768CC: .4byte gUnknown_0202F7A4
	thumb_func_end sub_80767C4

	thumb_func_start ma23_8073484
ma23_8073484: @ 80768D0
	push {r4-r6,lr}
	ldr r0, _080768E4 @ =gUnknown_0202F7A4
	ldr r2, [r0]
	adds r1, r2, 0x1
	str r1, [r0]
	ldrb r5, [r2, 0x1]
	cmp r5, 0
	bne _080768E8
	movs r5, 0x2
	b _080768F2
	.align 2, 0
_080768E4: .4byte gUnknown_0202F7A4
_080768E8:
	cmp r5, 0x1
	bne _080768EE
	movs r5, 0x3
_080768EE:
	cmp r5, 0
	beq _080768F6
_080768F2:
	cmp r5, 0x2
	bne _08076900
_080768F6:
	ldr r0, _080768FC @ =gUnknown_0202F7C8
	b _08076902
	.align 2, 0
_080768FC: .4byte gUnknown_0202F7C8
_08076900:
	ldr r0, _08076960 @ =gUnknown_0202F7C9
_08076902:
	ldrb r6, [r0]
	adds r0, r6, 0
	bl b_side_obj__get_some_boolean
	lsls r0, 24
	cmp r0, 0
	beq _0807692C
	ldr r2, _08076964 @ =gSprites
	ldr r0, _08076968 @ =gUnknown_02024BE0
	adds r0, r6, r0
	ldrb r1, [r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r2
	adds r0, 0x3E
	ldrb r2, [r0]
	movs r1, 0x5
	negs r1, r1
	ands r1, r2
	strb r1, [r0]
_0807692C:
	cmp r5, 0x1
	bls _0807696C
	movs r0, 0x2
	adds r4, r6, 0
	eors r4, r0
	adds r0, r4, 0
	bl b_side_obj__get_some_boolean
	lsls r0, 24
	cmp r0, 0
	beq _0807696C
	ldr r2, _08076964 @ =gSprites
	ldr r0, _08076968 @ =gUnknown_02024BE0
	adds r0, r4, r0
	ldrb r1, [r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r2
	adds r0, 0x3E
	ldrb r2, [r0]
	movs r1, 0x5
	negs r1, r1
	ands r1, r2
	strb r1, [r0]
	b _0807696E
	.align 2, 0
_08076960: .4byte gUnknown_0202F7C9
_08076964: .4byte gSprites
_08076968: .4byte gUnknown_02024BE0
_0807696C:
	movs r5, 0
_0807696E:
	ldr r0, _08076998 @ =sub_80769A4
	movs r1, 0x5
	bl CreateTask
	lsls r0, 24
	lsrs r0, 24
	ldr r2, _0807699C @ =gTasks
	lsls r1, r0, 2
	adds r1, r0
	lsls r1, 3
	adds r1, r2
	strh r5, [r1, 0x8]
	strh r6, [r1, 0xC]
	ldr r1, _080769A0 @ =gUnknown_0202F7A4
	ldr r0, [r1]
	adds r0, 0x1
	str r0, [r1]
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_08076998: .4byte sub_80769A4
_0807699C: .4byte gTasks
_080769A0: .4byte gUnknown_0202F7A4
	thumb_func_end ma23_8073484

	thumb_func_start sub_80769A4
sub_80769A4: @ 80769A4
	push {r4-r6,lr}
	lsls r0, 24
	lsrs r6, r0, 24
	ldr r1, _080769E8 @ =gTasks
	lsls r0, r6, 2
	adds r0, r6
	lsls r0, 3
	adds r1, r0, r1
	ldrh r0, [r1, 0xA]
	adds r0, 0x1
	strh r0, [r1, 0xA]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x1
	beq _08076A32
	ldrb r4, [r1, 0xC]
	adds r0, r4, 0
	bl battle_get_per_side_status
	lsls r0, 24
	movs r1, 0xFF
	lsls r1, 24
	adds r0, r1
	lsrs r0, 24
	cmp r0, 0x1
	bls _080769E2
	bl sub_8076BE0
	lsls r0, 24
	cmp r0, 0
	beq _080769EC
_080769E2:
	movs r5, 0
	b _080769EE
	.align 2, 0
_080769E8: .4byte gTasks
_080769EC:
	movs r5, 0x1
_080769EE:
	adds r0, r4, 0
	bl b_side_obj__get_some_boolean
	lsls r0, 24
	cmp r0, 0
	beq _08076A00
	adds r0, r5, 0
	bl sub_8076464
_08076A00:
	ldr r0, _08076A38 @ =gTasks
	lsls r1, r6, 2
	adds r1, r6
	lsls r1, 3
	adds r1, r0
	movs r2, 0x8
	ldrsh r0, [r1, r2]
	cmp r0, 0x1
	ble _08076A2C
	movs r0, 0x2
	eors r4, r0
	adds r0, r4, 0
	bl b_side_obj__get_some_boolean
	lsls r0, 24
	cmp r0, 0
	beq _08076A2C
	movs r0, 0x1
	eors r5, r0
	adds r0, r5, 0
	bl sub_8076464
_08076A2C:
	adds r0, r6, 0
	bl DestroyTask
_08076A32:
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_08076A38: .4byte gTasks
	thumb_func_end sub_80769A4

	thumb_func_start sub_8076A3C
sub_8076A3C: @ 8076A3C
	push {r4,lr}
	ldr r2, _08076A6C @ =gUnknown_0202F7A4
	ldr r0, [r2]
	adds r1, r0, 0x1
	str r1, [r2]
	ldrb r3, [r0, 0x1]
	adds r0, r1, 0x1
	str r0, [r2]
	ldrb r1, [r1, 0x1]
	lsls r1, 8
	adds r0, 0x1
	str r0, [r2]
	ldr r2, _08076A70 @ =REG_BLDCNT
	movs r4, 0xFD
	lsls r4, 6
	adds r0, r4, 0
	strh r0, [r2]
	ldr r0, _08076A74 @ =REG_BLDALPHA
	orrs r3, r1
	strh r3, [r0]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08076A6C: .4byte gUnknown_0202F7A4
_08076A70: .4byte REG_BLDCNT
_08076A74: .4byte REG_BLDALPHA
	thumb_func_end sub_8076A3C

	thumb_func_start sub_8076A78
sub_8076A78: @ 8076A78
	ldr r2, _08076A98 @ =gUnknown_0202F7A4
	ldr r0, [r2]
	adds r1, r0, 0x1
	str r1, [r2]
	ldrb r3, [r0, 0x1]
	adds r0, r1, 0x1
	str r0, [r2]
	ldrb r1, [r1, 0x1]
	lsls r1, 8
	adds r0, 0x1
	str r0, [r2]
	ldr r0, _08076A9C @ =REG_BLDCNT
	orrs r3, r1
	strh r3, [r0]
	bx lr
	.align 2, 0
_08076A98: .4byte gUnknown_0202F7A4
_08076A9C: .4byte REG_BLDCNT
	thumb_func_end sub_8076A78

	thumb_func_start sub_8076AA0
sub_8076AA0: @ 8076AA0
	ldr r1, _08076AB4 @ =gUnknown_0202F7A4
	ldr r0, [r1]
	adds r0, 0x1
	str r0, [r1]
	ldr r0, _08076AB8 @ =REG_BLDCNT
	movs r1, 0
	strh r1, [r0]
	adds r0, 0x2
	strh r1, [r0]
	bx lr
	.align 2, 0
_08076AB4: .4byte gUnknown_0202F7A4
_08076AB8: .4byte REG_BLDCNT
	thumb_func_end sub_8076AA0

	thumb_func_start ma0E_call
ma0E_call: @ 8076ABC
	push {r4,lr}
	ldr r4, _08076AE8 @ =gUnknown_0202F7A4
	ldr r1, [r4]
	adds r3, r1, 0x1
	str r3, [r4]
	ldr r2, _08076AEC @ =gUnknown_0202F7A8
	adds r0, r1, 0x5
	str r0, [r2]
	ldrb r1, [r1, 0x1]
	ldrb r0, [r3, 0x1]
	lsls r0, 8
	adds r1, r0
	ldrb r0, [r3, 0x2]
	lsls r0, 16
	adds r1, r0
	ldrb r0, [r3, 0x3]
	lsls r0, 24
	adds r1, r0
	str r1, [r4]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08076AE8: .4byte gUnknown_0202F7A4
_08076AEC: .4byte gUnknown_0202F7A8
	thumb_func_end ma0E_call

	thumb_func_start sub_8076AF0
sub_8076AF0: @ 8076AF0
	ldr r0, _08076AFC @ =gUnknown_0202F7A4
	ldr r1, _08076B00 @ =gUnknown_0202F7A8
	ldr r1, [r1]
	str r1, [r0]
	bx lr
	.align 2, 0
_08076AFC: .4byte gUnknown_0202F7A4
_08076B00: .4byte gUnknown_0202F7A8
	thumb_func_end sub_8076AF0

	thumb_func_start ma10_080736AC
ma10_080736AC: @ 8076B04
	push {r4,r5,lr}
	ldr r5, _08076B30 @ =gUnknown_0202F7A4
	ldr r1, [r5]
	adds r0, r1, 0x1
	str r0, [r5]
	ldrb r2, [r1, 0x1]
	adds r3, r0, 0x1
	str r3, [r5]
	ldrb r4, [r0, 0x1]
	ldrb r0, [r3, 0x1]
	lsls r0, 8
	orrs r4, r0
	adds r1, 0x4
	str r1, [r5]
	ldr r0, _08076B34 @ =gBattleAnimArgs
	lsls r2, 1
	adds r2, r0
	strh r4, [r2]
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_08076B30: .4byte gUnknown_0202F7A4
_08076B34: .4byte gBattleAnimArgs
	thumb_func_end ma10_080736AC

	thumb_func_start ma11_if_else
ma11_if_else: @ 8076B38
	push {lr}
	ldr r3, _08076B70 @ =gUnknown_0202F7A4
	ldr r2, [r3]
	adds r0, r2, 0x1
	str r0, [r3]
	ldr r0, _08076B74 @ =gUnknown_0202F7C4
	ldrb r1, [r0]
	movs r0, 0x1
	ands r0, r1
	cmp r0, 0
	beq _08076B52
	adds r0, r2, 0x5
	str r0, [r3]
_08076B52:
	ldr r2, [r3]
	ldrb r1, [r2]
	ldrb r0, [r2, 0x1]
	lsls r0, 8
	adds r1, r0
	ldrb r0, [r2, 0x2]
	lsls r0, 16
	adds r1, r0
	ldrb r0, [r2, 0x3]
	lsls r0, 24
	adds r1, r0
	str r1, [r3]
	pop {r0}
	bx r0
	.align 2, 0
_08076B70: .4byte gUnknown_0202F7A4
_08076B74: .4byte gUnknown_0202F7C4
	thumb_func_end ma11_if_else

	thumb_func_start ma12_cond_if
ma12_cond_if: @ 8076B78
	push {r4,r5,lr}
	ldr r5, _08076BA8 @ =gUnknown_0202F7A4
	ldr r4, [r5]
	adds r2, r4, 0x1
	str r2, [r5]
	ldrb r1, [r4, 0x1]
	adds r3, r2, 0x1
	str r3, [r5]
	ldr r0, _08076BAC @ =gUnknown_0202F7C4
	ldrb r0, [r0]
	cmp r1, r0
	bne _08076BB0
	ldrb r1, [r2, 0x1]
	ldrb r0, [r3, 0x1]
	lsls r0, 8
	adds r1, r0
	ldrb r0, [r3, 0x2]
	lsls r0, 16
	adds r1, r0
	ldrb r0, [r3, 0x3]
	lsls r0, 24
	adds r1, r0
	str r1, [r5]
	b _08076BB4
	.align 2, 0
_08076BA8: .4byte gUnknown_0202F7A4
_08076BAC: .4byte gUnknown_0202F7C4
_08076BB0:
	adds r0, r4, 0x6
	str r0, [r5]
_08076BB4:
	pop {r4,r5}
	pop {r0}
	bx r0
	thumb_func_end ma12_cond_if

	thumb_func_start sub_8076BBC
sub_8076BBC: @ 8076BBC
	ldr r3, _08076BDC @ =gUnknown_0202F7A4
	ldr r0, [r3]
	adds r2, r0, 0x1
	str r2, [r3]
	ldrb r1, [r0, 0x1]
	ldrb r0, [r2, 0x1]
	lsls r0, 8
	adds r1, r0
	ldrb r0, [r2, 0x2]
	lsls r0, 16
	adds r1, r0
	ldrb r0, [r2, 0x3]
	lsls r0, 24
	adds r1, r0
	str r1, [r3]
	bx lr
	.align 2, 0
_08076BDC: .4byte gUnknown_0202F7A4
	thumb_func_end sub_8076BBC

	thumb_func_start sub_8076BE0
sub_8076BE0: @ 8076BE0
	push {lr}
	ldr r0, _08076BF8 @ =gMain
	ldr r1, _08076BFC @ =0x0000043d
	adds r0, r1
	ldrb r1, [r0]
	movs r0, 0x2
	ands r0, r1
	cmp r0, 0
	beq _08076C00
	movs r0, 0
	b _08076C02
	.align 2, 0
_08076BF8: .4byte gMain
_08076BFC: .4byte 0x0000043d
_08076C00:
	movs r0, 0x1
_08076C02:
	pop {r1}
	bx r1
	thumb_func_end sub_8076BE0

	thumb_func_start ma14_load_background
ma14_load_background: @ 8076C08
	push {r4,lr}
	ldr r1, _08076C3C @ =gUnknown_0202F7A4
	ldr r2, [r1]
	adds r0, r2, 0x1
	str r0, [r1]
	ldrb r4, [r2, 0x1]
	adds r0, 0x1
	str r0, [r1]
	ldr r0, _08076C40 @ =task_p5_load_battle_screen_elements
	movs r1, 0x5
	bl CreateTask
	lsls r0, 24
	lsrs r0, 24
	ldr r2, _08076C44 @ =gTasks
	lsls r1, r0, 2
	adds r1, r0
	lsls r1, 3
	adds r1, r2
	strh r4, [r1, 0x8]
	ldr r1, _08076C48 @ =gUnknown_0202F7C5
	movs r0, 0x1
	strb r0, [r1]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08076C3C: .4byte gUnknown_0202F7A4
_08076C40: .4byte task_p5_load_battle_screen_elements
_08076C44: .4byte gTasks
_08076C48: .4byte gUnknown_0202F7C5
	thumb_func_end ma14_load_background

	thumb_func_start sub_8076C4C
sub_8076C4C: @ 8076C4C
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	ldr r2, _08076C8C @ =gUnknown_0202F7A4
	ldr r1, [r2]
	adds r0, r1, 0x1
	str r0, [r2]
	ldrb r3, [r1, 0x1]
	mov r8, r3
	ldrb r7, [r0, 0x1]
	ldrb r6, [r0, 0x2]
	adds r1, 0x4
	str r1, [r2]
	ldr r0, _08076C90 @ =task_p5_load_battle_screen_elements
	movs r1, 0x5
	bl CreateTask
	lsls r0, 24
	lsrs r4, r0, 24
	adds r5, r4, 0
	bl sub_8076BE0
	lsls r0, 24
	cmp r0, 0
	beq _08076C98
	ldr r1, _08076C94 @ =gTasks
	lsls r0, r4, 2
	adds r0, r4
	lsls r0, 3
	adds r0, r1
	strh r6, [r0, 0x8]
	b _08076CCA
	.align 2, 0
_08076C8C: .4byte gUnknown_0202F7A4
_08076C90: .4byte task_p5_load_battle_screen_elements
_08076C94: .4byte gTasks
_08076C98:
	ldr r0, _08076CB4 @ =gUnknown_0202F7C9
	ldrb r0, [r0]
	bl battle_side_get_owner
	lsls r0, 24
	cmp r0, 0
	bne _08076CBC
	ldr r1, _08076CB8 @ =gTasks
	lsls r0, r4, 2
	adds r0, r4
	lsls r0, 3
	adds r0, r1
	strh r7, [r0, 0x8]
	b _08076CCA
	.align 2, 0
_08076CB4: .4byte gUnknown_0202F7C9
_08076CB8: .4byte gTasks
_08076CBC:
	ldr r1, _08076CDC @ =gTasks
	lsls r0, r5, 2
	adds r0, r5
	lsls r0, 3
	adds r0, r1
	mov r1, r8
	strh r1, [r0, 0x8]
_08076CCA:
	ldr r1, _08076CE0 @ =gUnknown_0202F7C5
	movs r0, 0x1
	strb r0, [r1]
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_08076CDC: .4byte gTasks
_08076CE0: .4byte gUnknown_0202F7C5
	thumb_func_end sub_8076C4C

	thumb_func_start task_p5_load_battle_screen_elements
task_p5_load_battle_screen_elements: @ 8076CE4
	push {r4-r7,lr}
	sub sp, 0x4
	lsls r0, 24
	lsrs r5, r0, 24
	ldr r1, _08076D18 @ =gTasks
	lsls r0, r5, 2
	adds r0, r5
	lsls r0, 3
	adds r4, r0, r1
	ldrh r6, [r4, 0x1C]
	movs r0, 0x1C
	ldrsh r3, [r4, r0]
	adds r7, r1, 0
	cmp r3, 0
	bne _08076D1C
	str r3, [sp]
	movs r0, 0xE8
	movs r1, 0
	movs r2, 0
	movs r3, 0x10
	bl BeginHardwarePaletteFade
	ldrh r0, [r4, 0x1C]
	adds r0, 0x1
	strh r0, [r4, 0x1C]
	b _08076DAC
	.align 2, 0
_08076D18: .4byte gTasks
_08076D1C:
	ldr r2, _08076D38 @ =gPaletteFade
	ldrb r1, [r2, 0x7]
	movs r0, 0x80
	ands r0, r1
	cmp r0, 0
	bne _08076DAC
	cmp r3, 0x1
	bne _08076D40
	adds r0, r6, 0x1
	strh r0, [r4, 0x1C]
	ldr r1, _08076D3C @ =gUnknown_0202F7C5
	movs r0, 0x2
	strb r0, [r1]
	b _08076D84
	.align 2, 0
_08076D38: .4byte gPaletteFade
_08076D3C: .4byte gUnknown_0202F7C5
_08076D40:
	cmp r3, 0x2
	bne _08076D84
	ldrh r0, [r4, 0x8]
	lsls r2, r0, 16
	asrs r1, r2, 16
	movs r0, 0x1
	negs r0, r0
	cmp r1, r0
	bne _08076D58
	bl dp01t_11_3_message_for_player_only
	b _08076D5E
_08076D58:
	lsrs r0, r2, 16
	bl sub_8076DB8
_08076D5E:
	movs r0, 0x1
	str r0, [sp]
	movs r0, 0xE8
	movs r1, 0
	movs r2, 0x10
	movs r3, 0
	bl BeginHardwarePaletteFade
	ldr r1, _08076D80 @ =gTasks
	lsls r0, r5, 2
	adds r0, r5
	lsls r0, 3
	adds r0, r1
	ldrh r1, [r0, 0x1C]
	adds r1, 0x1
	strh r1, [r0, 0x1C]
	b _08076DAC
	.align 2, 0
_08076D80: .4byte gTasks
_08076D84:
	ldrb r1, [r2, 0x7]
	movs r0, 0x80
	ands r0, r1
	lsls r0, 24
	lsrs r4, r0, 24
	cmp r4, 0
	bne _08076DAC
	lsls r0, r5, 2
	adds r0, r5
	lsls r0, 3
	adds r0, r7
	movs r1, 0x1C
	ldrsh r0, [r0, r1]
	cmp r0, 0x3
	bne _08076DAC
	adds r0, r5, 0
	bl DestroyTask
	ldr r0, _08076DB4 @ =gUnknown_0202F7C5
	strb r4, [r0]
_08076DAC:
	add sp, 0x4
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_08076DB4: .4byte gUnknown_0202F7C5
	thumb_func_end task_p5_load_battle_screen_elements

	thumb_func_start sub_8076DB8
sub_8076DB8: @ 8076DB8
	push {r4-r7,lr}
	lsls r0, 16
	lsrs r6, r0, 16
	bl sub_8076BE0
	lsls r0, 24
	cmp r0, 0
	beq _08076E70
	ldr r7, _08076E54 @ =gBattleAnimBackgroundTable
	lsls r0, r6, 1
	adds r0, r6
	lsls r4, r0, 2
	adds r0, r7, 0
	adds r0, 0x8
	adds r0, r4, r0
	ldr r5, [r0]
	bl sub_8076BE0
	lsls r0, 24
	ldr r1, _08076E58 @ =0x02018000
	cmp r0, 0
	beq _08076DE8
	ldr r0, _08076E5C @ =0xffffc800
	adds r1, r0
_08076DE8:
	adds r0, r5, 0
	bl sub_800D238
	bl sub_80789BC
	lsls r0, 24
	lsrs r5, r0, 24
	bl sub_8076BE0
	lsls r0, 24
	ldr r1, _08076E58 @ =0x02018000
	cmp r0, 0
	beq _08076E06
	ldr r0, _08076E5C @ =0xffffc800
	adds r1, r0
_08076E06:
	movs r2, 0x80
	lsls r2, 1
	adds r0, r5, 0
	movs r3, 0
	bl sub_80763FC
	bl sub_8076BE0
	lsls r0, 24
	ldr r2, _08076E58 @ =0x02018000
	cmp r0, 0
	beq _08076E22
	ldr r0, _08076E5C @ =0xffffc800
	adds r2, r0
_08076E22:
	ldr r1, _08076E60 @ =0x0600d000
	ldr r0, _08076E64 @ =0x040000d4
	str r2, [r0]
	str r1, [r0, 0x4]
	ldr r1, _08076E68 @ =0x84000200
	str r1, [r0, 0x8]
	ldr r0, [r0, 0x8]
	adds r0, r4, r7
	ldr r0, [r0]
	ldr r1, _08076E6C @ =0x06002000
	bl LZDecompressVram
	adds r0, r7, 0x4
	adds r0, r4, r0
	ldr r4, [r0]
	bl sub_80789BC
	adds r1, r0, 0
	lsls r1, 24
	lsrs r1, 20
	adds r0, r4, 0
	movs r2, 0x20
	bl LoadCompressedPalette
	b _08076E9E
	.align 2, 0
_08076E54: .4byte gBattleAnimBackgroundTable
_08076E58: .4byte 0x02018000
_08076E5C: .4byte 0xffffc800
_08076E60: .4byte 0x0600d000
_08076E64: .4byte 0x040000d4
_08076E68: .4byte 0x84000200
_08076E6C: .4byte 0x06002000
_08076E70:
	ldr r5, _08076EA4 @ =gBattleAnimBackgroundTable
	lsls r4, r6, 1
	adds r4, r6
	lsls r4, 2
	adds r0, r5, 0
	adds r0, 0x8
	adds r0, r4, r0
	ldr r0, [r0]
	ldr r1, _08076EA8 @ =0x0600d000
	bl LZDecompressVram
	adds r0, r4, r5
	ldr r0, [r0]
	ldr r1, _08076EAC @ =0x06008000
	bl LZDecompressVram
	adds r5, 0x4
	adds r4, r5
	ldr r0, [r4]
	movs r1, 0x20
	movs r2, 0x20
	bl LoadCompressedPalette
_08076E9E:
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_08076EA4: .4byte gBattleAnimBackgroundTable
_08076EA8: .4byte 0x0600d000
_08076EAC: .4byte 0x06008000
	thumb_func_end sub_8076DB8

	thumb_func_start dp01t_11_3_message_for_player_only
dp01t_11_3_message_for_player_only: @ 8076EB0
	push {lr}
	bl sub_8076BE0
	lsls r0, 24
	cmp r0, 0
	beq _08076EC2
	bl sub_80AB2AC
	b _08076EC6
_08076EC2:
	bl sub_800D7B8
_08076EC6:
	pop {r0}
	bx r0
	thumb_func_end dp01t_11_3_message_for_player_only

	thumb_func_start ma15_load_battle_screen_elements
ma15_load_battle_screen_elements: @ 8076ECC
	push {lr}
	ldr r1, _08076EFC @ =gUnknown_0202F7A4
	ldr r0, [r1]
	adds r0, 0x1
	str r0, [r1]
	ldr r0, _08076F00 @ =task_p5_load_battle_screen_elements
	movs r1, 0x5
	bl CreateTask
	lsls r0, 24
	lsrs r0, 24
	ldr r2, _08076F04 @ =gTasks
	lsls r1, r0, 2
	adds r1, r0
	lsls r1, 3
	adds r1, r2
	ldr r0, _08076F08 @ =0x0000ffff
	strh r0, [r1, 0x8]
	ldr r1, _08076F0C @ =gUnknown_0202F7C5
	movs r0, 0x1
	strb r0, [r1]
	pop {r0}
	bx r0
	.align 2, 0
_08076EFC: .4byte gUnknown_0202F7A4
_08076F00: .4byte task_p5_load_battle_screen_elements
_08076F04: .4byte gTasks
_08076F08: .4byte 0x0000ffff
_08076F0C: .4byte gUnknown_0202F7C5
	thumb_func_end ma15_load_battle_screen_elements

	thumb_func_start ma16_wait_for_battle_screen_elements_s2
ma16_wait_for_battle_screen_elements_s2: @ 8076F10
	push {lr}
	ldr r0, _08076F28 @ =gUnknown_0202F7C5
	ldrb r0, [r0]
	cmp r0, 0x2
	bne _08076F34
	ldr r1, _08076F2C @ =gUnknown_0202F7A4
	ldr r0, [r1]
	adds r0, 0x1
	str r0, [r1]
	ldr r1, _08076F30 @ =gUnknown_0202F7B0
	movs r0, 0
	b _08076F38
	.align 2, 0
_08076F28: .4byte gUnknown_0202F7C5
_08076F2C: .4byte gUnknown_0202F7A4
_08076F30: .4byte gUnknown_0202F7B0
_08076F34:
	ldr r1, _08076F40 @ =gUnknown_0202F7B0
	movs r0, 0x1
_08076F38:
	strb r0, [r1]
	pop {r0}
	bx r0
	.align 2, 0
_08076F40: .4byte gUnknown_0202F7B0
	thumb_func_end ma16_wait_for_battle_screen_elements_s2

	thumb_func_start sub_8076F44
sub_8076F44: @ 8076F44
	push {lr}
	ldr r0, _08076F5C @ =gUnknown_0202F7C5
	ldrb r2, [r0]
	cmp r2, 0
	bne _08076F68
	ldr r0, _08076F60 @ =gUnknown_0202F7A4
	ldr r1, [r0]
	adds r1, 0x1
	str r1, [r0]
	ldr r0, _08076F64 @ =gUnknown_0202F7B0
	strb r2, [r0]
	b _08076F6E
	.align 2, 0
_08076F5C: .4byte gUnknown_0202F7C5
_08076F60: .4byte gUnknown_0202F7A4
_08076F64: .4byte gUnknown_0202F7B0
_08076F68:
	ldr r1, _08076F74 @ =gUnknown_0202F7B0
	movs r0, 0x1
	strb r0, [r1]
_08076F6E:
	pop {r0}
	bx r0
	.align 2, 0
_08076F74: .4byte gUnknown_0202F7B0
	thumb_func_end sub_8076F44

	thumb_func_start ma18_load_background_probably
ma18_load_background_probably: @ 8076F78
	push {r4,lr}
	ldr r4, _08076F94 @ =gUnknown_0202F7A4
	ldr r1, [r4]
	adds r0, r1, 0x1
	str r0, [r4]
	ldrb r0, [r1, 0x1]
	bl sub_8076DB8
	ldr r0, [r4]
	adds r0, 0x1
	str r0, [r4]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08076F94: .4byte gUnknown_0202F7A4
	thumb_func_end ma18_load_background_probably

	thumb_func_start sub_8076F98
sub_8076F98: @ 8076F98
	push {r4,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	bl sub_8076BE0
	lsls r0, 24
	cmp r0, 0
	bne _08076FDC
	ldr r0, _08076FD4 @ =gUnknown_0202F7C8
	ldrb r2, [r0]
	lsls r0, r2, 1
	adds r0, r2
	lsls r0, 2
	ldr r1, _08076FD8 @ =0x02017810
	adds r0, r1
	ldrb r1, [r0]
	movs r0, 0x10
	ands r0, r1
	cmp r0, 0
	beq _08076FDC
	adds r0, r2, 0
	bl battle_side_get_owner
	lsls r0, 24
	movs r4, 0xC0
	cmp r0, 0
	beq _0807706E
	movs r4, 0x3F
	b _0807706E
	.align 2, 0
_08076FD4: .4byte gUnknown_0202F7C8
_08076FD8: .4byte 0x02017810
_08076FDC:
	bl sub_8076BE0
	lsls r0, 24
	cmp r0, 0
	beq _08077004
	ldr r0, _08076FFC @ =gUnknown_0202F7C8
	ldr r1, _08077000 @ =gUnknown_0202F7C9
	ldrb r0, [r0]
	ldrb r1, [r1]
	cmp r0, r1
	bne _08077068
	cmp r0, 0x2
	bne _08077068
	cmp r4, 0x3F
	beq _0807707A
	b _08077068
	.align 2, 0
_08076FFC: .4byte gUnknown_0202F7C8
_08077000: .4byte gUnknown_0202F7C9
_08077004:
	ldr r0, _0807702C @ =gUnknown_0202F7C8
	ldrb r0, [r0]
	bl battle_side_get_owner
	lsls r0, 24
	cmp r0, 0
	bne _08077042
	ldr r0, _08077030 @ =gUnknown_0202F7C9
	ldrb r0, [r0]
	bl battle_side_get_owner
	lsls r0, 24
	cmp r0, 0
	bne _0807706E
	lsls r0, r4, 24
	asrs r1, r0, 24
	cmp r1, 0x3F
	bne _08077034
	movs r4, 0xC0
	b _0807706E
	.align 2, 0
_0807702C: .4byte gUnknown_0202F7C8
_08077030: .4byte gUnknown_0202F7C9
_08077034:
	movs r0, 0x40
	negs r0, r0
	cmp r1, r0
	beq _0807706E
	negs r0, r1
	lsls r0, 24
	b _0807706C
_08077042:
	ldr r0, _08077064 @ =gUnknown_0202F7C9
	ldrb r0, [r0]
	bl battle_side_get_owner
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _08077068
	lsls r0, r4, 24
	asrs r0, 24
	movs r1, 0x40
	negs r1, r1
	cmp r0, r1
	bne _0807706E
	movs r4, 0x3F
	b _0807706E
	.align 2, 0
_08077064: .4byte gUnknown_0202F7C9
_08077068:
	lsls r0, r4, 24
	negs r0, r0
_0807706C:
	lsrs r4, r0, 24
_0807706E:
	lsls r0, r4, 24
	asrs r0, 24
	cmp r0, 0x3F
	ble _0807707A
	movs r4, 0x3F
	b _08077088
_0807707A:
	lsls r0, r4, 24
	asrs r0, 24
	movs r1, 0x40
	negs r1, r1
	cmp r0, r1
	bge _08077088
	movs r4, 0xC0
_08077088:
	lsls r0, r4, 24
	asrs r0, 24
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end sub_8076F98

	thumb_func_start sub_8077094
sub_8077094: @ 8077094
	push {r4,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	bl sub_8076BE0
	lsls r0, 24
	cmp r0, 0
	bne _080770D8
	ldr r0, _080770D0 @ =gUnknown_0202F7C8
	ldrb r2, [r0]
	lsls r0, r2, 1
	adds r0, r2
	lsls r0, 2
	ldr r1, _080770D4 @ =0x02017810
	adds r0, r1
	ldrb r1, [r0]
	movs r0, 0x10
	ands r0, r1
	cmp r0, 0
	beq _080770D8
	adds r0, r2, 0
	bl battle_side_get_owner
	lsls r0, 24
	movs r4, 0xC0
	cmp r0, 0
	beq _080770F6
	movs r4, 0x3F
	b _080770F6
	.align 2, 0
_080770D0: .4byte gUnknown_0202F7C8
_080770D4: .4byte 0x02017810
_080770D8:
	ldr r0, _08077100 @ =gUnknown_0202F7C8
	ldrb r0, [r0]
	bl battle_side_get_owner
	lsls r0, 24
	cmp r0, 0
	bne _080770F0
	bl sub_8076BE0
	lsls r0, 24
	cmp r0, 0
	beq _080770F6
_080770F0:
	lsls r0, r4, 24
	negs r0, r0
	lsrs r4, r0, 24
_080770F6:
	lsls r0, r4, 24
	asrs r0, 24
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_08077100: .4byte gUnknown_0202F7C8
	thumb_func_end sub_8077094

	thumb_func_start sub_8077104
sub_8077104: @ 8077104
	push {lr}
	lsls r0, 16
	lsrs r1, r0, 16
	asrs r2, r0, 16
	cmp r2, 0x3F
	ble _08077114
	movs r1, 0x3F
	b _0807711E
_08077114:
	movs r0, 0x40
	negs r0, r0
	cmp r2, r0
	bge _0807711E
	ldr r1, _08077128 @ =0x0000ffc0
_0807711E:
	lsls r0, r1, 16
	asrs r0, 16
	pop {r1}
	bx r1
	.align 2, 0
_08077128: .4byte 0x0000ffc0
	thumb_func_end sub_8077104

	thumb_func_start sub_807712C
sub_807712C: @ 807712C
	push {lr}
	lsls r2, 16
	lsrs r2, 16
	adds r3, r2, 0
	lsls r0, 16
	asrs r0, 16
	lsls r1, 16
	asrs r1, 16
	cmp r0, r1
	bge _0807714A
	lsls r0, r2, 16
	asrs r0, 16
	cmp r0, 0
	bge _0807715A
	b _08077158
_0807714A:
	cmp r0, r1
	ble _08077160
	lsls r0, r3, 16
	asrs r0, 16
	cmp r0, 0
	bge _08077158
	negs r0, r0
_08077158:
	negs r0, r0
_0807715A:
	lsls r0, 16
	lsrs r0, 16
	b _08077162
_08077160:
	movs r0, 0
_08077162:
	lsls r0, 16
	asrs r0, 16
	pop {r1}
	bx r1
	thumb_func_end sub_807712C

	thumb_func_start ma19_08073BC8
ma19_08073BC8: @ 807716C
	push {r4,r5,lr}
	ldr r5, _080771A0 @ =gUnknown_0202F7A4
	ldr r0, [r5]
	adds r1, r0, 0x1
	str r1, [r5]
	ldrb r4, [r0, 0x1]
	ldrb r0, [r1, 0x1]
	lsls r0, 8
	orrs r4, r0
	movs r0, 0x2
	ldrsb r0, [r1, r0]
	bl sub_8076F98
	adds r1, r0, 0
	lsls r1, 24
	asrs r1, 24
	adds r0, r4, 0
	bl PlaySE12WithPanning
	ldr r0, [r5]
	adds r0, 0x3
	str r0, [r5]
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080771A0: .4byte gUnknown_0202F7A4
	thumb_func_end ma19_08073BC8

	thumb_func_start ma1A_8073C00
ma1A_8073C00: @ 80771A4
	push {r4,lr}
	ldr r4, _080771CC @ =gUnknown_0202F7A4
	ldr r1, [r4]
	adds r0, r1, 0x1
	str r0, [r4]
	movs r0, 0x1
	ldrsb r0, [r1, r0]
	bl sub_8076F98
	lsls r0, 24
	asrs r0, 24
	bl SE12PanpotControl
	ldr r0, [r4]
	adds r0, 0x1
	str r0, [r4]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080771CC: .4byte gUnknown_0202F7A4
	thumb_func_end ma1A_8073C00

	thumb_func_start ma1B_8073C2C
ma1B_8073C2C: @ 80771D0
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	ldr r0, _08077280 @ =gUnknown_0202F7A4
	mov r10, r0
	ldr r0, [r0]
	adds r1, r0, 0x1
	mov r2, r10
	str r1, [r2]
	ldrb r0, [r0, 0x1]
	mov r9, r0
	ldrb r0, [r1, 0x1]
	lsls r0, 8
	mov r2, r9
	orrs r2, r0
	mov r9, r2
	ldrb r4, [r1, 0x3]
	ldrb r6, [r1, 0x4]
	ldrb r7, [r1, 0x5]
	movs r0, 0x2
	ldrsb r0, [r1, r0]
	bl sub_8076F98
	adds r5, r0, 0
	lsls r5, 24
	lsrs r5, 24
	lsls r4, 24
	asrs r4, 24
	adds r0, r4, 0
	bl sub_8076F98
	mov r8, r0
	lsls r5, 24
	asrs r5, 24
	mov r0, r8
	lsls r0, 24
	asrs r0, 24
	mov r8, r0
	lsls r6, 24
	asrs r6, 24
	adds r0, r5, 0
	mov r1, r8
	adds r2, r6, 0
	bl sub_807712C
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	ldr r0, _08077284 @ =c3_08073CEC
	movs r1, 0x1
	bl CreateTask
	lsls r0, 24
	lsrs r0, 24
	ldr r2, _08077288 @ =gTasks
	lsls r1, r0, 2
	adds r1, r0
	lsls r1, 3
	adds r1, r2
	strh r5, [r1, 0x8]
	mov r2, r8
	strh r2, [r1, 0xA]
	lsls r4, 24
	asrs r4, 24
	strh r4, [r1, 0xC]
	strh r7, [r1, 0xE]
	strh r5, [r1, 0x10]
	mov r0, r9
	adds r1, r5, 0
	bl PlaySE12WithPanning
	ldr r1, _0807728C @ =gUnknown_0202F7B3
	ldrb r0, [r1]
	adds r0, 0x1
	strb r0, [r1]
	mov r1, r10
	ldr r0, [r1]
	adds r0, 0x6
	str r0, [r1]
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_08077280: .4byte gUnknown_0202F7A4
_08077284: .4byte c3_08073CEC
_08077288: .4byte gTasks
_0807728C: .4byte gUnknown_0202F7B3
	thumb_func_end ma1B_8073C2C

	thumb_func_start c3_08073CEC
c3_08073CEC: @ 8077290
	push {r4-r7,lr}
	lsls r0, 24
	lsrs r5, r0, 24
	movs r7, 0
	ldr r1, _080772D4 @ =gTasks
	lsls r0, r5, 2
	adds r0, r5
	lsls r0, 3
	adds r2, r0, r1
	ldrh r0, [r2, 0x18]
	adds r1, r0, 0x1
	strh r1, [r2, 0x18]
	lsls r0, 16
	asrs r0, 16
	movs r3, 0xE
	ldrsh r1, [r2, r3]
	cmp r0, r1
	blt _08077314
	strh r7, [r2, 0x18]
	ldrh r6, [r2, 0x8]
	ldrh r3, [r2, 0xA]
	movs r4, 0x10
	ldrsh r0, [r2, r4]
	movs r4, 0xC
	ldrsh r1, [r2, r4]
	adds r0, r1
	lsls r0, 16
	lsrs r4, r0, 16
	strh r4, [r2, 0x10]
	cmp r1, 0
	bne _080772D8
	lsls r2, r3, 16
	b _080772FC
	.align 2, 0
_080772D4: .4byte gTasks
_080772D8:
	lsls r1, r6, 16
	lsls r0, r3, 16
	asrs r3, r0, 16
	adds r2, r0, 0
	cmp r1, r2
	bge _080772EE
	lsls r0, r4, 16
	asrs r0, 16
	cmp r0, r3
	blt _080772F8
	b _080772FC
_080772EE:
	lsls r0, r4, 16
	asrs r0, 16
	cmp r0, r3
	bgt _080772F8
	movs r7, 0x1
_080772F8:
	cmp r7, 0
	beq _0807730C
_080772FC:
	lsrs r4, r2, 16
	adds r0, r5, 0
	bl DestroyTask
	ldr r1, _0807731C @ =gUnknown_0202F7B3
	ldrb r0, [r1]
	subs r0, 0x1
	strb r0, [r1]
_0807730C:
	lsls r0, r4, 24
	asrs r0, 24
	bl SE12PanpotControl
_08077314:
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_0807731C: .4byte gUnknown_0202F7B3
	thumb_func_end c3_08073CEC

	thumb_func_start sub_8077320
sub_8077320: @ 8077320
	push {r4-r6,lr}
	mov r6, r10
	mov r5, r9
	mov r4, r8
	push {r4-r6}
	ldr r0, _080773A4 @ =gUnknown_0202F7A4
	mov r9, r0
	ldr r0, [r0]
	adds r1, r0, 0x1
	mov r2, r9
	str r1, [r2]
	ldrb r0, [r0, 0x1]
	mov r8, r0
	ldrb r0, [r1, 0x1]
	lsls r0, 8
	mov r2, r8
	orrs r2, r0
	mov r8, r2
	ldrb r4, [r1, 0x2]
	ldrb r5, [r1, 0x3]
	ldrb r6, [r1, 0x4]
	ldrb r1, [r1, 0x5]
	mov r10, r1
	ldr r0, _080773A8 @ =c3_08073CEC
	movs r1, 0x1
	bl CreateTask
	lsls r0, 24
	lsrs r0, 24
	ldr r2, _080773AC @ =gTasks
	lsls r1, r0, 2
	adds r1, r0
	lsls r1, 3
	adds r1, r2
	lsls r4, 24
	asrs r4, 24
	strh r4, [r1, 0x8]
	lsls r5, 24
	asrs r5, 24
	strh r5, [r1, 0xA]
	lsls r6, 24
	asrs r6, 24
	strh r6, [r1, 0xC]
	mov r0, r10
	strh r0, [r1, 0xE]
	strh r4, [r1, 0x10]
	mov r0, r8
	adds r1, r4, 0
	bl PlaySE12WithPanning
	ldr r1, _080773B0 @ =gUnknown_0202F7B3
	ldrb r0, [r1]
	adds r0, 0x1
	strb r0, [r1]
	mov r1, r9
	ldr r0, [r1]
	adds r0, 0x6
	str r0, [r1]
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_080773A4: .4byte gUnknown_0202F7A4
_080773A8: .4byte c3_08073CEC
_080773AC: .4byte gTasks
_080773B0: .4byte gUnknown_0202F7B3
	thumb_func_end sub_8077320

	thumb_func_start sub_80773B4
sub_80773B4: @ 80773B4
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	ldr r0, _08077464 @ =gUnknown_0202F7A4
	mov r10, r0
	ldr r0, [r0]
	adds r1, r0, 0x1
	mov r2, r10
	str r1, [r2]
	ldrb r0, [r0, 0x1]
	mov r9, r0
	ldrb r0, [r1, 0x1]
	lsls r0, 8
	mov r2, r9
	orrs r2, r0
	mov r9, r2
	ldrb r4, [r1, 0x3]
	ldrb r0, [r1, 0x4]
	mov r8, r0
	ldrb r7, [r1, 0x5]
	movs r0, 0x2
	ldrsb r0, [r1, r0]
	bl sub_8077094
	adds r6, r0, 0
	lsls r6, 24
	lsrs r6, 24
	lsls r4, 24
	asrs r4, 24
	adds r0, r4, 0
	bl sub_8077094
	adds r5, r0, 0
	lsls r5, 24
	lsrs r5, 24
	mov r1, r8
	lsls r1, 24
	asrs r1, 24
	mov r8, r1
	mov r0, r8
	bl sub_8077094
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	ldr r0, _08077468 @ =c3_08073CEC
	movs r1, 0x1
	bl CreateTask
	lsls r0, 24
	lsrs r0, 24
	ldr r2, _0807746C @ =gTasks
	lsls r1, r0, 2
	adds r1, r0
	lsls r1, 3
	adds r1, r2
	lsls r6, 24
	asrs r6, 24
	strh r6, [r1, 0x8]
	lsls r5, 24
	asrs r5, 24
	strh r5, [r1, 0xA]
	lsls r4, 24
	asrs r4, 24
	strh r4, [r1, 0xC]
	strh r7, [r1, 0xE]
	strh r6, [r1, 0x10]
	mov r0, r9
	adds r1, r6, 0
	bl PlaySE12WithPanning
	ldr r1, _08077470 @ =gUnknown_0202F7B3
	ldrb r0, [r1]
	adds r0, 0x1
	strb r0, [r1]
	mov r2, r10
	ldr r0, [r2]
	adds r0, 0x6
	str r0, [r2]
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_08077464: .4byte gUnknown_0202F7A4
_08077468: .4byte c3_08073CEC
_0807746C: .4byte gTasks
_08077470: .4byte gUnknown_0202F7B3
	thumb_func_end sub_80773B4

	thumb_func_start ma1C_8073ED0
ma1C_8073ED0: @ 8077474
	push {r4-r6,lr}
	mov r6, r9
	mov r5, r8
	push {r5,r6}
	ldr r6, _080774EC @ =gUnknown_0202F7A4
	ldr r0, [r6]
	adds r1, r0, 0x1
	str r1, [r6]
	ldrb r5, [r0, 0x1]
	ldrb r0, [r1, 0x1]
	lsls r0, 8
	orrs r5, r0
	ldrb r0, [r1, 0x3]
	mov r8, r0
	ldrb r2, [r1, 0x4]
	mov r9, r2
	movs r0, 0x2
	ldrsb r0, [r1, r0]
	bl sub_8076F98
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	ldr r0, _080774F0 @ =sub_80774FC
	movs r1, 0x1
	bl CreateTask
	lsls r0, 24
	lsrs r0, 24
	ldr r2, _080774F4 @ =gTasks
	lsls r1, r0, 2
	adds r1, r0
	lsls r1, 3
	adds r1, r2
	strh r5, [r1, 0x8]
	lsls r4, 24
	asrs r4, 24
	strh r4, [r1, 0xA]
	mov r2, r8
	strh r2, [r1, 0xC]
	mov r2, r9
	strh r2, [r1, 0xE]
	mov r2, r8
	strh r2, [r1, 0x18]
	ldr r1, [r1]
	bl _call_via_r1
	ldr r1, _080774F8 @ =gUnknown_0202F7B3
	ldrb r0, [r1]
	adds r0, 0x1
	strb r0, [r1]
	ldr r0, [r6]
	adds r0, 0x5
	str r0, [r6]
	pop {r3,r4}
	mov r8, r3
	mov r9, r4
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_080774EC: .4byte gUnknown_0202F7A4
_080774F0: .4byte sub_80774FC
_080774F4: .4byte gTasks
_080774F8: .4byte gUnknown_0202F7B3
	thumb_func_end ma1C_8073ED0

	thumb_func_start sub_80774FC
sub_80774FC: @ 80774FC
	push {r4,r5,lr}
	lsls r0, 24
	lsrs r5, r0, 24
	ldr r1, _08077550 @ =gTasks
	lsls r0, r5, 2
	adds r0, r5
	lsls r0, 3
	adds r2, r0, r1
	ldrh r0, [r2, 0x18]
	adds r1, r0, 0x1
	strh r1, [r2, 0x18]
	lsls r0, 16
	asrs r0, 16
	movs r3, 0xC
	ldrsh r1, [r2, r3]
	cmp r0, r1
	blt _0807754A
	movs r0, 0
	strh r0, [r2, 0x18]
	ldrh r0, [r2, 0x8]
	ldrb r1, [r2, 0xA]
	ldrh r4, [r2, 0xE]
	subs r4, 0x1
	strh r4, [r2, 0xE]
	lsls r4, 24
	lsrs r4, 24
	lsls r1, 24
	asrs r1, 24
	bl PlaySE12WithPanning
	cmp r4, 0
	bne _0807754A
	adds r0, r5, 0
	bl DestroyTask
	ldr r1, _08077554 @ =gUnknown_0202F7B3
	ldrb r0, [r1]
	subs r0, 0x1
	strb r0, [r1]
_0807754A:
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_08077550: .4byte gTasks
_08077554: .4byte gUnknown_0202F7B3
	thumb_func_end sub_80774FC

	thumb_func_start ma1D_08073FB4
ma1D_08073FB4: @ 8077558
	push {r4-r6,lr}
	mov r6, r8
	push {r6}
	ldr r6, _080775BC @ =gUnknown_0202F7A4
	ldr r0, [r6]
	adds r1, r0, 0x1
	str r1, [r6]
	ldrb r5, [r0, 0x1]
	ldrb r0, [r1, 0x1]
	lsls r0, 8
	orrs r5, r0
	ldrb r0, [r1, 0x3]
	mov r8, r0
	movs r0, 0x2
	ldrsb r0, [r1, r0]
	bl sub_8076F98
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	ldr r0, _080775C0 @ =sub_80775CC
	movs r1, 0x1
	bl CreateTask
	lsls r0, 24
	lsrs r0, 24
	ldr r2, _080775C4 @ =gTasks
	lsls r1, r0, 2
	adds r1, r0
	lsls r1, 3
	adds r1, r2
	strh r5, [r1, 0x8]
	lsls r4, 24
	asrs r4, 24
	strh r4, [r1, 0xA]
	mov r0, r8
	strh r0, [r1, 0xC]
	ldr r1, _080775C8 @ =gUnknown_0202F7B3
	ldrb r0, [r1]
	adds r0, 0x1
	strb r0, [r1]
	ldr r0, [r6]
	adds r0, 0x4
	str r0, [r6]
	pop {r3}
	mov r8, r3
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_080775BC: .4byte gUnknown_0202F7A4
_080775C0: .4byte sub_80775CC
_080775C4: .4byte gTasks
_080775C8: .4byte gUnknown_0202F7B3
	thumb_func_end ma1D_08073FB4

	thumb_func_start sub_80775CC
sub_80775CC: @ 80775CC
	push {r4,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	ldr r1, _08077608 @ =gTasks
	lsls r0, r4, 2
	adds r0, r4
	lsls r0, 3
	adds r2, r0, r1
	ldrh r0, [r2, 0xC]
	subs r1, r0, 0x1
	strh r1, [r2, 0xC]
	lsls r0, 16
	cmp r0, 0
	bgt _08077600
	ldrh r0, [r2, 0x8]
	movs r1, 0xA
	ldrsb r1, [r2, r1]
	bl PlaySE12WithPanning
	adds r0, r4, 0
	bl DestroyTask
	ldr r1, _0807760C @ =gUnknown_0202F7B3
	ldrb r0, [r1]
	subs r0, 0x1
	strb r0, [r1]
_08077600:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08077608: .4byte gTasks
_0807760C: .4byte gUnknown_0202F7B3
	thumb_func_end sub_80775CC

	thumb_func_start sub_8077610
sub_8077610: @ 8077610
	push {r4-r6,lr}
	ldr r4, _08077678 @ =gUnknown_0202F7A4
	ldr r1, [r4]
	adds r3, r1, 0x1
	str r3, [r4]
	ldrb r2, [r1, 0x1]
	ldrb r0, [r3, 0x1]
	lsls r0, 8
	adds r2, r0
	ldrb r0, [r3, 0x2]
	lsls r0, 16
	adds r2, r0
	ldrb r0, [r3, 0x3]
	lsls r0, 24
	adds r6, r2, r0
	adds r0, r1, 0x5
	str r0, [r4]
	ldrb r0, [r1, 0x5]
	adds r1, 0x6
	str r1, [r4]
	cmp r0, 0
	beq _0807765A
	adds r5, r4, 0
	ldr r4, _0807767C @ =gBattleAnimArgs
	adds r3, r0, 0
_08077642:
	ldr r2, [r5]
	ldrb r1, [r2]
	ldrb r0, [r2, 0x1]
	lsls r0, 8
	orrs r1, r0
	strh r1, [r4]
	adds r2, 0x2
	str r2, [r5]
	adds r4, 0x2
	subs r3, 0x1
	cmp r3, 0
	bne _08077642
_0807765A:
	adds r0, r6, 0
	movs r1, 0x1
	bl CreateTask
	lsls r0, 24
	lsrs r0, 24
	bl _call_via_r6
	ldr r1, _08077680 @ =gUnknown_0202F7B3
	ldrb r0, [r1]
	adds r0, 0x1
	strb r0, [r1]
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_08077678: .4byte gUnknown_0202F7A4
_0807767C: .4byte gBattleAnimArgs
_08077680: .4byte gUnknown_0202F7B3
	thumb_func_end sub_8077610

	thumb_func_start ma20_wait_for_something
ma20_wait_for_something: @ 8077684
	push {r4,r5,lr}
	ldr r0, _080776BC @ =gUnknown_0202F7B3
	ldrb r5, [r0]
	cmp r5, 0
	bne _080776CC
	bl IsSEPlaying
	lsls r0, 24
	lsrs r1, r0, 24
	cmp r1, 0
	beq _080776E4
	ldr r4, _080776C0 @ =gUnknown_03004AF0
	ldrh r0, [r4]
	adds r0, 0x1
	strh r0, [r4]
	lsls r0, 16
	lsrs r0, 16
	cmp r0, 0x5A
	bls _080776D2
	ldr r0, _080776C4 @ =gMPlay_SE1
	bl m4aMPlayStop
	ldr r0, _080776C8 @ =gMPlay_SE2
	bl m4aMPlayStop
	strh r5, [r4]
	b _080776F6
	.align 2, 0
_080776BC: .4byte gUnknown_0202F7B3
_080776C0: .4byte gUnknown_03004AF0
_080776C4: .4byte gMPlay_SE1
_080776C8: .4byte gMPlay_SE2
_080776CC:
	ldr r1, _080776DC @ =gUnknown_03004AF0
	movs r0, 0
	strh r0, [r1]
_080776D2:
	ldr r1, _080776E0 @ =gUnknown_0202F7B0
	movs r0, 0x1
	strb r0, [r1]
	b _080776F6
	.align 2, 0
_080776DC: .4byte gUnknown_03004AF0
_080776E0: .4byte gUnknown_0202F7B0
_080776E4:
	ldr r0, _080776FC @ =gUnknown_03004AF0
	movs r2, 0
	strh r1, [r0]
	ldr r1, _08077700 @ =gUnknown_0202F7A4
	ldr r0, [r1]
	adds r0, 0x1
	str r0, [r1]
	ldr r0, _08077704 @ =gUnknown_0202F7B0
	strb r2, [r0]
_080776F6:
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080776FC: .4byte gUnknown_03004AF0
_08077700: .4byte gUnknown_0202F7A4
_08077704: .4byte gUnknown_0202F7B0
	thumb_func_end ma20_wait_for_something

	thumb_func_start ma21_08074164
ma21_08074164: @ 8077708
	push {r4-r6,lr}
	ldr r5, _08077748 @ =gUnknown_0202F7A4
	ldr r4, [r5]
	adds r3, r4, 0x1
	str r3, [r5]
	ldrb r2, [r4, 0x1]
	ldrb r1, [r3, 0x1]
	ldrb r0, [r3, 0x2]
	lsls r0, 8
	orrs r1, r0
	ldr r0, _0807774C @ =gBattleAnimArgs
	lsls r2, 1
	adds r2, r0
	lsls r1, 16
	asrs r1, 16
	movs r6, 0
	ldrsh r0, [r2, r6]
	cmp r1, r0
	bne _08077750
	ldrb r1, [r3, 0x3]
	ldrb r0, [r3, 0x4]
	lsls r0, 8
	adds r1, r0
	ldrb r0, [r3, 0x5]
	lsls r0, 16
	adds r1, r0
	ldrb r0, [r3, 0x6]
	lsls r0, 24
	adds r1, r0
	str r1, [r5]
	b _08077756
	.align 2, 0
_08077748: .4byte gUnknown_0202F7A4
_0807774C: .4byte gBattleAnimArgs
_08077750:
	adds r0, r4, 0
	adds r0, 0x8
	str r0, [r5]
_08077756:
	pop {r4-r6}
	pop {r0}
	bx r0
	thumb_func_end ma21_08074164

	thumb_func_start sub_807775C
sub_807775C: @ 807775C
	push {r4,lr}
	ldr r4, _0807778C @ =gUnknown_0202F7A4
	ldr r0, [r4]
	adds r0, 0x1
	str r0, [r4]
	bl sub_8076BE0
	lsls r0, 24
	cmp r0, 0
	beq _08077790
	ldr r2, [r4]
	ldrb r1, [r2]
	ldrb r0, [r2, 0x1]
	lsls r0, 8
	adds r1, r0
	ldrb r0, [r2, 0x2]
	lsls r0, 16
	adds r1, r0
	ldrb r0, [r2, 0x3]
	lsls r0, 24
	adds r1, r0
	str r1, [r4]
	b _08077796
	.align 2, 0
_0807778C: .4byte gUnknown_0202F7A4
_08077790:
	ldr r0, [r4]
	adds r0, 0x4
	str r0, [r4]
_08077796:
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end sub_807775C

	thumb_func_start sub_807779C
sub_807779C: @ 807779C
	push {r4,lr}
	ldr r0, _080777B0 @ =gUnknown_0202F7A4
	ldr r1, [r0]
	ldrb r2, [r1, 0x1]
	adds r1, 0x2
	str r1, [r0]
	cmp r2, 0
	beq _080777B8
	ldr r0, _080777B4 @ =gUnknown_0202F7C9
	b _080777BA
	.align 2, 0
_080777B0: .4byte gUnknown_0202F7A4
_080777B4: .4byte gUnknown_0202F7C9
_080777B8:
	ldr r0, _080777FC @ =gUnknown_0202F7C8
_080777BA:
	ldrb r0, [r0]
	bl battle_get_per_side_status
	lsls r0, 24
	lsrs r4, r0, 24
	bl sub_8076BE0
	lsls r0, 24
	cmp r0, 0
	bne _080777F4
	cmp r4, 0
	beq _080777D6
	cmp r4, 0x3
	bne _080777F4
_080777D6:
	ldr r3, _08077800 @ =REG_BG1CNT
	ldrb r2, [r3]
	movs r1, 0x4
	negs r1, r1
	adds r0, r1, 0
	ands r0, r2
	movs r2, 0x1
	orrs r0, r2
	strb r0, [r3]
	ldr r2, _08077804 @ =REG_BG2CNT
	ldrb r0, [r2]
	ands r1, r0
	movs r0, 0x2
	orrs r1, r0
	strb r1, [r2]
_080777F4:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080777FC: .4byte gUnknown_0202F7C8
_08077800: .4byte REG_BG1CNT
_08077804: .4byte REG_BG2CNT
	thumb_func_end sub_807779C

	thumb_func_start sub_8077808
sub_8077808: @ 8077808
	push {lr}
	ldr r0, _08077840 @ =gUnknown_0202F7A4
	ldr r1, [r0]
	adds r1, 0x1
	str r1, [r0]
	bl sub_8076BE0
	lsls r0, 24
	cmp r0, 0
	bne _0807783A
	ldr r3, _08077844 @ =REG_BG1CNT
	ldrb r2, [r3]
	movs r1, 0x4
	negs r1, r1
	adds r0, r1, 0
	ands r0, r2
	movs r2, 0x1
	orrs r0, r2
	strb r0, [r3]
	ldr r2, _08077848 @ =REG_BG2CNT
	ldrb r0, [r2]
	ands r1, r0
	movs r0, 0x2
	orrs r1, r0
	strb r1, [r2]
_0807783A:
	pop {r0}
	bx r0
	.align 2, 0
_08077840: .4byte gUnknown_0202F7A4
_08077844: .4byte REG_BG1CNT
_08077848: .4byte REG_BG2CNT
	thumb_func_end sub_8077808

	thumb_func_start sub_807784C
sub_807784C: @ 807784C
	push {r4-r7,lr}
	ldr r1, _0807787C @ =gUnknown_0202F7A4
	ldr r0, [r1]
	ldrb r6, [r0, 0x1]
	adds r0, 0x2
	str r0, [r1]
	ldr r7, _08077880 @ =gUnknown_0202F7C8
	ldrb r0, [r7]
	bl battle_side_get_owner
	adds r4, r0, 0
	ldr r5, _08077884 @ =gUnknown_0202F7C9
	ldrb r0, [r5]
	bl battle_side_get_owner
	lsls r4, 24
	lsls r0, 24
	cmp r4, r0
	beq _080778C2
	cmp r6, 0
	beq _08077888
	ldrb r0, [r5]
	b _0807788A
	.align 2, 0
_0807787C: .4byte gUnknown_0202F7A4
_08077880: .4byte gUnknown_0202F7C8
_08077884: .4byte gUnknown_0202F7C9
_08077888:
	ldrb r0, [r7]
_0807788A:
	bl battle_get_per_side_status
	lsls r0, 24
	lsrs r4, r0, 24
	bl sub_8076BE0
	lsls r0, 24
	cmp r0, 0
	bne _080778C2
	cmp r4, 0
	beq _080778A4
	cmp r4, 0x3
	bne _080778C2
_080778A4:
	ldr r3, _080778C8 @ =REG_BG1CNT
	ldrb r2, [r3]
	movs r1, 0x4
	negs r1, r1
	adds r0, r1, 0
	ands r0, r2
	movs r2, 0x1
	orrs r0, r2
	strb r0, [r3]
	ldr r2, _080778CC @ =REG_BG2CNT
	ldrb r0, [r2]
	ands r1, r0
	movs r0, 0x2
	orrs r1, r0
	strb r1, [r2]
_080778C2:
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080778C8: .4byte REG_BG1CNT
_080778CC: .4byte REG_BG2CNT
	thumb_func_end sub_807784C

	thumb_func_start ma2B_make_side_invisible
ma2B_make_side_invisible: @ 80778D0
	push {r4,lr}
	ldr r4, _08077904 @ =gUnknown_0202F7A4
	ldr r0, [r4]
	ldrb r0, [r0, 0x1]
	bl obj_id_for_side_relative_to_move
	lsls r0, 24
	lsrs r2, r0, 24
	cmp r2, 0xFF
	beq _080778F8
	ldr r1, _08077908 @ =gSprites
	lsls r0, r2, 4
	adds r0, r2
	lsls r0, 2
	adds r0, r1
	adds r0, 0x3E
	ldrb r1, [r0]
	movs r2, 0x4
	orrs r1, r2
	strb r1, [r0]
_080778F8:
	ldr r0, [r4]
	adds r0, 0x2
	str r0, [r4]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08077904: .4byte gUnknown_0202F7A4
_08077908: .4byte gSprites
	thumb_func_end ma2B_make_side_invisible

	thumb_func_start ma2C_make_side_visible
ma2C_make_side_visible: @ 807790C
	push {r4,lr}
	ldr r4, _08077944 @ =gUnknown_0202F7A4
	ldr r0, [r4]
	ldrb r0, [r0, 0x1]
	bl obj_id_for_side_relative_to_move
	lsls r0, 24
	lsrs r2, r0, 24
	cmp r2, 0xFF
	beq _08077936
	ldr r1, _08077948 @ =gSprites
	lsls r0, r2, 4
	adds r0, r2
	lsls r0, 2
	adds r0, r1
	adds r0, 0x3E
	ldrb r2, [r0]
	movs r1, 0x5
	negs r1, r1
	ands r1, r2
	strb r1, [r0]
_08077936:
	ldr r0, [r4]
	adds r0, 0x2
	str r0, [r4]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08077944: .4byte gUnknown_0202F7A4
_08077948: .4byte gSprites
	thumb_func_end ma2C_make_side_visible

	thumb_func_start sub_807794C
sub_807794C: @ 807794C
	push {r4-r7,lr}
	ldr r1, _08077998 @ =gUnknown_0202F7A4
	ldr r0, [r1]
	ldrb r7, [r0, 0x1]
	adds r0, 0x2
	str r0, [r1]
	bl sub_8076BE0
	lsls r0, 24
	cmp r0, 0
	bne _080779F6
	bl IsDoubleBattle
	lsls r0, 24
	cmp r0, 0
	beq _080779F6
	ldr r6, _0807799C @ =gUnknown_0202F7C8
	ldrb r0, [r6]
	bl battle_side_get_owner
	adds r4, r0, 0
	ldr r5, _080779A0 @ =gUnknown_0202F7C9
	ldrb r0, [r5]
	bl battle_side_get_owner
	lsls r4, 24
	lsls r0, 24
	cmp r4, r0
	bne _080779F6
	cmp r7, 0
	bne _080779A4
	ldrb r0, [r6]
	bl battle_get_per_side_status_permutated
	lsls r0, 24
	lsrs r4, r0, 24
	movs r0, 0
	b _080779B0
	.align 2, 0
_08077998: .4byte gUnknown_0202F7A4
_0807799C: .4byte gUnknown_0202F7C8
_080779A0: .4byte gUnknown_0202F7C9
_080779A4:
	ldrb r0, [r5]
	bl battle_get_per_side_status_permutated
	lsls r0, 24
	lsrs r4, r0, 24
	movs r0, 0x1
_080779B0:
	bl obj_id_for_side_relative_to_move
	lsls r0, 24
	lsrs r2, r0, 24
	cmp r2, 0xFF
	beq _080779F6
	ldr r1, _080779EC @ =gSprites
	lsls r0, r2, 4
	adds r0, r2
	lsls r0, 2
	adds r2, r0, r1
	adds r3, r2, 0
	adds r3, 0x3E
	ldrb r1, [r3]
	movs r0, 0x5
	negs r0, r0
	ands r0, r1
	strb r0, [r3]
	cmp r4, 0x2
	bne _080779E0
	ldrb r0, [r2, 0x5]
	movs r1, 0xC
	orrs r0, r1
	strb r0, [r2, 0x5]
_080779E0:
	cmp r4, 0x1
	bne _080779F0
	movs r0, 0
	bl sub_8076464
	b _080779F6
	.align 2, 0
_080779EC: .4byte gSprites
_080779F0:
	movs r0, 0x1
	bl sub_8076464
_080779F6:
	pop {r4-r7}
	pop {r0}
	bx r0
	thumb_func_end sub_807794C

	thumb_func_start sub_80779FC
sub_80779FC: @ 80779FC
	push {r4-r7,lr}
	ldr r1, _08077A48 @ =gUnknown_0202F7A4
	ldr r0, [r1]
	ldrb r7, [r0, 0x1]
	adds r0, 0x2
	str r0, [r1]
	bl sub_8076BE0
	lsls r0, 24
	cmp r0, 0
	bne _08077A88
	bl IsDoubleBattle
	lsls r0, 24
	cmp r0, 0
	beq _08077A88
	ldr r6, _08077A4C @ =gUnknown_0202F7C8
	ldrb r0, [r6]
	bl battle_side_get_owner
	adds r4, r0, 0
	ldr r5, _08077A50 @ =gUnknown_0202F7C9
	ldrb r0, [r5]
	bl battle_side_get_owner
	lsls r4, 24
	lsls r0, 24
	cmp r4, r0
	bne _08077A88
	cmp r7, 0
	bne _08077A54
	ldrb r0, [r6]
	bl battle_get_per_side_status_permutated
	lsls r0, 24
	lsrs r4, r0, 24
	movs r0, 0
	b _08077A60
	.align 2, 0
_08077A48: .4byte gUnknown_0202F7A4
_08077A4C: .4byte gUnknown_0202F7C8
_08077A50: .4byte gUnknown_0202F7C9
_08077A54:
	ldrb r0, [r5]
	bl battle_get_per_side_status_permutated
	lsls r0, 24
	lsrs r4, r0, 24
	movs r0, 0x1
_08077A60:
	bl obj_id_for_side_relative_to_move
	lsls r0, 24
	lsrs r2, r0, 24
	cmp r2, 0xFF
	beq _08077A88
	cmp r4, 0x2
	bne _08077A88
	ldr r1, _08077A90 @ =gSprites
	lsls r0, r2, 4
	adds r0, r2
	lsls r0, 2
	adds r0, r1
	ldrb r2, [r0, 0x5]
	movs r1, 0xD
	negs r1, r1
	ands r1, r2
	movs r2, 0x8
	orrs r1, r2
	strb r1, [r0, 0x5]
_08077A88:
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_08077A90: .4byte gSprites
	thumb_func_end sub_80779FC

	thumb_func_start ma2F_stop_music
ma2F_stop_music: @ 8077A94
	push {lr}
	ldr r0, _08077AB0 @ =gMPlay_SE1
	bl m4aMPlayStop
	ldr r0, _08077AB4 @ =gMPlay_SE2
	bl m4aMPlayStop
	ldr r1, _08077AB8 @ =gUnknown_0202F7A4
	ldr r0, [r1]
	adds r0, 0x1
	str r0, [r1]
	pop {r0}
	bx r0
	.align 2, 0
_08077AB0: .4byte gMPlay_SE1
_08077AB4: .4byte gMPlay_SE2
_08077AB8: .4byte gUnknown_0202F7A4
	thumb_func_end ma2F_stop_music

	.align 2, 0 @ Don't pad with nop.
