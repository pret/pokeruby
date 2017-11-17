	.include "constants/gba_constants.inc"
	.include "constants/species_constants.inc"
	.include "asm/macros.inc"

	.syntax unified

	.text

	thumb_func_start sub_80C68A4
sub_80C68A4: @ 80C68A4
	push {r4-r6,lr}
	adds r4, r0, 0
	adds r5, r1, 0
	adds r6, r2, 0
	lsls r4, 16
	lsrs r4, 16
	lsls r5, 16
	lsrs r5, 16
	lsls r6, 16
	lsrs r6, 16
	ldr r0, _080C68E4 @ =sub_80C68EC
	movs r1, 0
	bl CreateTask
	lsls r0, 24
	lsrs r0, 24
	ldr r2, _080C68E8 @ =gTasks
	lsls r1, r0, 2
	adds r1, r0
	lsls r1, 3
	adds r1, r2
	movs r0, 0
	strh r4, [r1, 0x8]
	strh r5, [r1, 0xA]
	strh r6, [r1, 0xC]
	strh r0, [r1, 0xE]
	movs r0, 0x1
	strh r0, [r1, 0x10]
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_080C68E4: .4byte sub_80C68EC
_080C68E8: .4byte gTasks
	thumb_func_end sub_80C68A4

	thumb_func_start sub_80C68EC
sub_80C68EC: @ 80C68EC
	push {r4,r5,lr}
	lsls r0, 24
	lsrs r5, r0, 24
	lsls r0, r5, 2
	adds r0, r5
	lsls r0, 3
	ldr r1, _080C690C @ =gTasks + 0x8
	adds r4, r0, r1
	ldrh r1, [r4, 0x6]
	movs r2, 0x6
	ldrsh r0, [r4, r2]
	cmp r0, 0x6
	bne _080C6910
	movs r0, 0
	b _080C6912
	.align 2, 0
_080C690C: .4byte gTasks + 0x8
_080C6910:
	adds r0, r1, 0x1
_080C6912:
	strh r0, [r4, 0x6]
	movs r3, 0x6
	ldrsh r0, [r4, r3]
	cmp r0, 0
	bne _080C6964
	movs r1, 0x8
	ldrsh r0, [r4, r1]
	cmp r0, 0x2
	bne _080C692C
	movs r2, 0
	ldrsh r0, [r4, r2]
	bl DoBalloonSoundEffect
_080C692C:
	movs r3, 0x2
	ldrsh r0, [r4, r3]
	movs r2, 0x4
	ldrsh r1, [r4, r2]
	ldrh r2, [r4, 0x8]
	ldrh r3, [r4]
	adds r2, r3
	lsls r2, 16
	lsrs r2, 16
	bl MapGridSetMetatileIdAt
	movs r1, 0x2
	ldrsh r0, [r4, r1]
	movs r2, 0x4
	ldrsh r1, [r4, r2]
	bl CurrentMapDrawMetatileAt
	ldrh r1, [r4, 0x8]
	movs r3, 0x8
	ldrsh r0, [r4, r3]
	cmp r0, 0x3
	bne _080C6960
	adds r0, r5, 0
	bl DestroyTask
	b _080C6964
_080C6960:
	adds r0, r1, 0x1
	strh r0, [r4, 0x8]
_080C6964:
	pop {r4,r5}
	pop {r0}
	bx r0
	thumb_func_end sub_80C68EC

	thumb_func_start DoBalloonSoundEffect
DoBalloonSoundEffect: @ 80C696C
	push {lr}
	lsls r0, 16
	asrs r1, r0, 16
	movs r0, 0xCE
	lsls r0, 2
	cmp r1, r0
	beq _080C6998
	cmp r1, r0
	bgt _080C6988
	movs r0, 0x8A
	lsls r0, 2
	cmp r1, r0
	beq _080C69B0
	b _080C69B6
_080C6988:
	movs r0, 0xCF
	lsls r0, 2
	cmp r1, r0
	beq _080C69A0
	adds r0, 0x4
	cmp r1, r0
	beq _080C69A8
	b _080C69B6
_080C6998:
	movs r0, 0x4A
	bl PlaySE
	b _080C69B6
_080C69A0:
	movs r0, 0x4B
	bl PlaySE
	b _080C69B6
_080C69A8:
	movs r0, 0x4C
	bl PlaySE
	b _080C69B6
_080C69B0:
	movs r0, 0x4E
	bl PlaySE
_080C69B6:
	pop {r0}
	bx r0
	thumb_func_end DoBalloonSoundEffect

	thumb_func_start FldEff_Nop47
FldEff_Nop47: @ 80C69BC
	movs r0, 0
	bx lr
	thumb_func_end FldEff_Nop47

	thumb_func_start FldEff_Nop48
FldEff_Nop48: @ 80C69C0
	movs r0, 0
	bx lr
	thumb_func_end FldEff_Nop48

	thumb_func_start sub_80C69C4
sub_80C69C4: @ 80C69C4
	push {r4-r6,lr}
	adds r5, r0, 0
	adds r4, r1, 0
	lsls r5, 16
	lsrs r5, 16
	lsls r4, 16
	lsrs r4, 16
	movs r0, 0x4D
	bl PlaySE
	lsls r5, 16
	asrs r5, 16
	lsls r4, 16
	asrs r4, 16
	ldr r2, _080C6A0C @ =0x00000276
	adds r0, r5, 0
	adds r1, r4, 0
	bl MapGridSetMetatileIdAt
	subs r6, r4, 0x1
	ldr r2, _080C6A10 @ =0x0000026e
	adds r0, r5, 0
	adds r1, r6, 0
	bl MapGridSetMetatileIdAt
	adds r0, r5, 0
	adds r1, r4, 0
	bl CurrentMapDrawMetatileAt
	adds r0, r5, 0
	adds r1, r6, 0
	bl CurrentMapDrawMetatileAt
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_080C6A0C: .4byte 0x00000276
_080C6A10: .4byte 0x0000026e
	thumb_func_end sub_80C69C4

	thumb_func_start sub_80C6A14
sub_80C6A14: @ 80C6A14
	push {r4,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	ldr r1, _080C6A44 @ =gTasks
	lsls r0, r4, 2
	adds r0, r4
	lsls r0, 3
	adds r1, r0, r1
	ldrh r2, [r1, 0x8]
	movs r3, 0x8
	ldrsh r0, [r1, r3]
	cmp r0, 0x7
	bne _080C6A48
	movs r2, 0xA
	ldrsh r0, [r1, r2]
	movs r3, 0xC
	ldrsh r1, [r1, r3]
	bl sub_80C69C4
	adds r0, r4, 0
	bl DestroyTask
	b _080C6A4C
	.align 2, 0
_080C6A44: .4byte gTasks
_080C6A48:
	adds r0, r2, 0x1
	strh r0, [r1, 0x8]
_080C6A4C:
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end sub_80C6A14

	thumb_func_start sub_80C6A54
sub_80C6A54: @ 80C6A54
	push {r4-r7,lr}
	lsls r0, 16
	lsrs r5, r0, 16
	adds r7, r5, 0
	lsls r1, 16
	lsrs r4, r1, 16
	adds r6, r4, 0
	bl player_get_direction_lower_nybble
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _080C6A7C
	lsls r0, r5, 16
	asrs r0, 16
	lsls r1, r4, 16
	asrs r1, 16
	bl sub_80C69C4
	b _080C6A9E
_080C6A7C:
	cmp r0, 0x2
	bne _080C6A9E
	ldr r0, _080C6AA4 @ =sub_80C6A14
	movs r1, 0x5
	bl CreateTask
	lsls r0, 24
	lsrs r0, 24
	ldr r2, _080C6AA8 @ =gTasks
	lsls r1, r0, 2
	adds r1, r0
	lsls r1, 3
	adds r1, r2
	movs r0, 0
	strh r0, [r1, 0x8]
	strh r7, [r1, 0xA]
	strh r6, [r1, 0xC]
_080C6A9E:
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080C6AA4: .4byte sub_80C6A14
_080C6AA8: .4byte gTasks
	thumb_func_end sub_80C6A54

	thumb_func_start Task_DecorationSoundEffect
Task_DecorationSoundEffect: @ 80C6AAC
	push {r4,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	ldr r1, _080C6AE4 @ =gTasks
	lsls r0, r4, 2
	adds r0, r4
	lsls r0, 3
	adds r1, r0, r1
	ldrh r2, [r1, 0xA]
	movs r3, 0xA
	ldrsh r0, [r1, r3]
	cmp r0, 0x7
	beq _080C6AC8
	b _080C6C26
_080C6AC8:
	ldr r2, _080C6AE8 @ =0xfffffd88
	adds r0, r2, 0
	ldrh r1, [r1, 0x8]
	adds r0, r1
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x3B
	bls _080C6ADA
	b _080C6C1E
_080C6ADA:
	lsls r0, 2
	ldr r1, _080C6AEC @ =_080C6AF0
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_080C6AE4: .4byte gTasks
_080C6AE8: .4byte 0xfffffd88
_080C6AEC: .4byte _080C6AF0
	.align 2, 0
_080C6AF0:
	.4byte _080C6BE0
	.4byte _080C6BE8
	.4byte _080C6BF0
	.4byte _080C6BF8
	.4byte _080C6C00
	.4byte _080C6C08
	.4byte _080C6C10
	.4byte _080C6C1E
	.4byte _080C6C1E
	.4byte _080C6C1E
	.4byte _080C6C1E
	.4byte _080C6C1E
	.4byte _080C6C1E
	.4byte _080C6C1E
	.4byte _080C6C1E
	.4byte _080C6C1E
	.4byte _080C6C1E
	.4byte _080C6C1E
	.4byte _080C6C1E
	.4byte _080C6C1E
	.4byte _080C6C1E
	.4byte _080C6C1E
	.4byte _080C6C1E
	.4byte _080C6C1E
	.4byte _080C6C1E
	.4byte _080C6C1E
	.4byte _080C6C1E
	.4byte _080C6C1E
	.4byte _080C6C1E
	.4byte _080C6C1E
	.4byte _080C6C1E
	.4byte _080C6C1E
	.4byte _080C6C1E
	.4byte _080C6C1E
	.4byte _080C6C1E
	.4byte _080C6C1E
	.4byte _080C6C1E
	.4byte _080C6C1E
	.4byte _080C6C1E
	.4byte _080C6C1E
	.4byte _080C6C1E
	.4byte _080C6C1E
	.4byte _080C6C1E
	.4byte _080C6C1E
	.4byte _080C6C1E
	.4byte _080C6C1E
	.4byte _080C6C1E
	.4byte _080C6C1E
	.4byte _080C6C1E
	.4byte _080C6C1E
	.4byte _080C6C1E
	.4byte _080C6C1E
	.4byte _080C6C1E
	.4byte _080C6C1E
	.4byte _080C6C1E
	.4byte _080C6C1E
	.4byte _080C6C1E
	.4byte _080C6C1E
	.4byte _080C6C1E
	.4byte _080C6C18
_080C6BE0:
	movs r0, 0x3E
	bl PlaySE
	b _080C6C1E
_080C6BE8:
	movs r0, 0x3F
	bl PlaySE
	b _080C6C1E
_080C6BF0:
	movs r0, 0x40
	bl PlaySE
	b _080C6C1E
_080C6BF8:
	movs r0, 0x41
	bl PlaySE
	b _080C6C1E
_080C6C00:
	movs r0, 0x42
	bl PlaySE
	b _080C6C1E
_080C6C08:
	movs r0, 0x43
	bl PlaySE
	b _080C6C1E
_080C6C10:
	movs r0, 0x44
	bl PlaySE
	b _080C6C1E
_080C6C18:
	movs r0, 0x45
	bl PlaySE
_080C6C1E:
	adds r0, r4, 0
	bl DestroyTask
	b _080C6C2A
_080C6C26:
	adds r0, r2, 0x1
	strh r0, [r1, 0xA]
_080C6C2A:
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end Task_DecorationSoundEffect

	thumb_func_start DoDecorationSoundEffect
DoDecorationSoundEffect: @ 80C6C30
	push {r4,lr}
	adds r4, r0, 0
	lsls r4, 16
	lsrs r4, 16
	ldr r0, _080C6C5C @ =Task_DecorationSoundEffect
	movs r1, 0x5
	bl CreateTask
	lsls r0, 24
	lsrs r0, 24
	ldr r2, _080C6C60 @ =gTasks
	lsls r1, r0, 2
	adds r1, r0
	lsls r1, 3
	adds r1, r2
	movs r0, 0
	strh r4, [r1, 0x8]
	strh r0, [r1, 0xA]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080C6C5C: .4byte Task_DecorationSoundEffect
_080C6C60: .4byte gTasks
	thumb_func_end DoDecorationSoundEffect

	thumb_func_start SpriteCB_YellowCave4Sparkle
SpriteCB_YellowCave4Sparkle: @ 80C6C64
	push {r4,lr}
	adds r4, r0, 0
	ldrh r0, [r4, 0x2E]
	adds r0, 0x1
	strh r0, [r4, 0x2E]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x8
	bne _080C6C7C
	movs r0, 0xC3
	bl PlaySE
_080C6C7C:
	movs r1, 0x2E
	ldrsh r0, [r4, r1]
	cmp r0, 0x1F
	ble _080C6C8A
	adds r0, r4, 0
	bl DestroySprite
_080C6C8A:
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end SpriteCB_YellowCave4Sparkle

	thumb_func_start DoYellowCave4Sparkle
DoYellowCave4Sparkle: @ 80C6C90
	push {r4,lr}
	sub sp, 0x4
	ldr r3, _080C6D28 @ =gMapObjects
	ldr r2, _080C6D2C @ =gPlayerAvatar
	ldrb r1, [r2, 0x5]
	lsls r0, r1, 3
	adds r0, r1
	lsls r0, 2
	adds r0, r3
	ldrh r1, [r0, 0x10]
	mov r0, sp
	strh r1, [r0]
	ldrb r1, [r2, 0x5]
	lsls r0, r1, 3
	adds r0, r1
	lsls r0, 2
	adds r0, r3
	ldrh r0, [r0, 0x12]
	mov r4, sp
	adds r4, 0x2
	strh r0, [r4]
	mov r0, sp
	adds r1, r4, 0
	movs r2, 0x8
	movs r3, 0x4
	bl sub_8060470
	ldr r0, _080C6D30 @ =gFieldEffectObjectTemplatePointers
	ldr r0, [r0, 0x58]
	mov r1, sp
	movs r2, 0
	ldrsh r1, [r1, r2]
	movs r3, 0
	ldrsh r2, [r4, r3]
	movs r3, 0
	bl CreateSpriteAtEnd
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x40
	beq _080C6D1E
	ldr r3, _080C6D34 @ =gSprites
	lsls r2, r0, 4
	adds r2, r0
	lsls r2, 2
	adds r4, r2, r3
	movs r0, 0x3E
	adds r0, r4
	mov r12, r0
	ldrb r0, [r0]
	movs r1, 0x2
	orrs r0, r1
	mov r1, r12
	strb r0, [r1]
	ldrb r1, [r4, 0x5]
	movs r0, 0xD
	negs r0, r0
	ands r0, r1
	movs r1, 0x4
	orrs r0, r1
	movs r1, 0xF
	ands r0, r1
	movs r1, 0x50
	orrs r0, r1
	strb r0, [r4, 0x5]
	adds r3, 0x1C
	adds r2, r3
	ldr r0, _080C6D38 @ =SpriteCB_YellowCave4Sparkle
	str r0, [r2]
	movs r0, 0
	strh r0, [r4, 0x2E]
_080C6D1E:
	add sp, 0x4
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080C6D28: .4byte gMapObjects
_080C6D2C: .4byte gPlayerAvatar
_080C6D30: .4byte gFieldEffectObjectTemplatePointers
_080C6D34: .4byte gSprites
_080C6D38: .4byte SpriteCB_YellowCave4Sparkle
	thumb_func_end DoYellowCave4Sparkle

	thumb_func_start FldEff_SandPillar
FldEff_SandPillar: @ 80C6D3C
	push {r4,lr}
	sub sp, 0x4
	bl ScriptContext2_Enable
	mov r4, sp
	adds r4, 0x2
	mov r0, sp
	adds r1, r4, 0
	bl GetXYCoordsOneStepInFrontOfPlayer
	ldr r1, _080C6D78 @ =gFieldEffectArguments
	mov r0, sp
	movs r2, 0
	ldrsh r0, [r0, r2]
	str r0, [r1, 0x14]
	movs r3, 0
	ldrsh r0, [r4, r3]
	str r0, [r1, 0x18]
	bl player_get_direction_lower_nybble
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x2
	beq _080C6DBC
	cmp r0, 0x2
	bgt _080C6D7C
	cmp r0, 0x1
	beq _080C6D86
	b _080C6E4C
	.align 2, 0
_080C6D78: .4byte gFieldEffectArguments
_080C6D7C:
	cmp r0, 0x3
	beq _080C6DEC
	cmp r0, 0x4
	beq _080C6E24
	b _080C6E4C
_080C6D86:
	ldr r0, _080C6DB0 @ =gSpriteTemplate_83D26A0
	ldr r3, _080C6DB4 @ =gSprites
	ldr r1, _080C6DB8 @ =gPlayerAvatar
	ldrb r1, [r1, 0x4]
	lsls r2, r1, 4
	adds r2, r1
	lsls r2, 2
	adds r2, r3
	ldrh r1, [r2, 0x2]
	lsls r1, 23
	lsrs r1, 7
	movs r3, 0x80
	lsls r3, 12
	adds r1, r3
	asrs r1, 16
	ldrb r2, [r2]
	adds r2, 0x20
	movs r3, 0
	bl CreateSprite
	b _080C6E4C
	.align 2, 0
_080C6DB0: .4byte gSpriteTemplate_83D26A0
_080C6DB4: .4byte gSprites
_080C6DB8: .4byte gPlayerAvatar
_080C6DBC:
	ldr r0, _080C6DE0 @ =gSpriteTemplate_83D26A0
	ldr r3, _080C6DE4 @ =gSprites
	ldr r1, _080C6DE8 @ =gPlayerAvatar
	ldrb r1, [r1, 0x4]
	lsls r2, r1, 4
	adds r2, r1
	lsls r2, 2
	adds r2, r3
	ldrh r1, [r2, 0x2]
	lsls r1, 23
	lsrs r1, 7
	movs r3, 0x80
	lsls r3, 12
	adds r1, r3
	asrs r1, 16
	ldrb r2, [r2]
	b _080C6E0C
	.align 2, 0
_080C6DE0: .4byte gSpriteTemplate_83D26A0
_080C6DE4: .4byte gSprites
_080C6DE8: .4byte gPlayerAvatar
_080C6DEC:
	ldr r0, _080C6E14 @ =gSpriteTemplate_83D26A0
	ldr r3, _080C6E18 @ =gSprites
	ldr r1, _080C6E1C @ =gPlayerAvatar
	ldrb r1, [r1, 0x4]
	lsls r2, r1, 4
	adds r2, r1
	lsls r2, 2
	adds r2, r3
	ldrh r1, [r2, 0x2]
	lsls r1, 23
	lsrs r1, 7
	ldr r3, _080C6E20 @ =0xfff80000
	adds r1, r3
	asrs r1, 16
	ldrb r2, [r2]
	adds r2, 0x10
_080C6E0C:
	movs r3, 0x94
	bl CreateSprite
	b _080C6E4C
	.align 2, 0
_080C6E14: .4byte gSpriteTemplate_83D26A0
_080C6E18: .4byte gSprites
_080C6E1C: .4byte gPlayerAvatar
_080C6E20: .4byte 0xfff80000
_080C6E24:
	ldr r0, _080C6E58 @ =gSpriteTemplate_83D26A0
	ldr r3, _080C6E5C @ =gSprites
	ldr r1, _080C6E60 @ =gPlayerAvatar
	ldrb r1, [r1, 0x4]
	lsls r2, r1, 4
	adds r2, r1
	lsls r2, 2
	adds r2, r3
	ldrh r1, [r2, 0x2]
	lsls r1, 23
	lsrs r1, 7
	movs r3, 0xC0
	lsls r3, 13
	adds r1, r3
	asrs r1, 16
	ldrb r2, [r2]
	adds r2, 0x10
	movs r3, 0x94
	bl CreateSprite
_080C6E4C:
	movs r0, 0
	add sp, 0x4
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_080C6E58: .4byte gSpriteTemplate_83D26A0
_080C6E5C: .4byte gSprites
_080C6E60: .4byte gPlayerAvatar
	thumb_func_end FldEff_SandPillar

	thumb_func_start SpriteCB_SandPillar_0
SpriteCB_SandPillar_0: @ 80C6E64
	push {r4,r5,lr}
	adds r5, r0, 0
	movs r0, 0x83
	bl PlaySE
	ldr r4, _080C6E90 @ =gFieldEffectArguments
	ldr r0, [r4, 0x14]
	ldr r1, [r4, 0x18]
	subs r1, 0x1
	bl MapGridGetMetatileIdAt
	ldr r1, _080C6E94 @ =0x00000286
	cmp r0, r1
	bne _080C6E9C
	ldr r0, [r4, 0x14]
	ldr r1, [r4, 0x18]
	subs r1, 0x1
	ldr r2, _080C6E98 @ =0x00000e02
	bl MapGridSetMetatileIdAt
	b _080C6EAA
	.align 2, 0
_080C6E90: .4byte gFieldEffectArguments
_080C6E94: .4byte 0x00000286
_080C6E98: .4byte 0x00000e02
_080C6E9C:
	ldr r0, [r4, 0x14]
	ldr r1, [r4, 0x18]
	subs r1, 0x1
	movs r2, 0xA1
	lsls r2, 2
	bl MapGridSetMetatileIdAt
_080C6EAA:
	ldr r4, _080C6ED8 @ =gFieldEffectArguments
	ldr r0, [r4, 0x14]
	ldr r1, [r4, 0x18]
	ldr r2, _080C6EDC @ =0x0000020a
	bl MapGridSetMetatileIdAt
	ldr r0, [r4, 0x14]
	ldr r1, [r4, 0x18]
	subs r1, 0x1
	bl CurrentMapDrawMetatileAt
	ldr r0, [r4, 0x14]
	ldr r1, [r4, 0x18]
	bl CurrentMapDrawMetatileAt
	movs r0, 0
	strh r0, [r5, 0x2E]
	ldr r0, _080C6EE0 @ =SpriteCB_SandPillar_1
	str r0, [r5, 0x1C]
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080C6ED8: .4byte gFieldEffectArguments
_080C6EDC: .4byte 0x0000020a
_080C6EE0: .4byte SpriteCB_SandPillar_1
	thumb_func_end SpriteCB_SandPillar_0

	thumb_func_start SpriteCB_SandPillar_1
SpriteCB_SandPillar_1: @ 80C6EE4
	push {r4,r5,lr}
	adds r5, r0, 0
	ldrh r1, [r5, 0x2E]
	movs r2, 0x2E
	ldrsh r0, [r5, r2]
	cmp r0, 0x11
	bgt _080C6EF8
	adds r0, r1, 0x1
	strh r0, [r5, 0x2E]
	b _080C6F14
_080C6EF8:
	ldr r4, _080C6F1C @ =gFieldEffectArguments
	ldr r0, [r4, 0x14]
	ldr r1, [r4, 0x18]
	ldr r2, _080C6F20 @ =0x00000e8c
	bl MapGridSetMetatileIdAt
	ldr r0, [r4, 0x14]
	ldr r1, [r4, 0x18]
	bl CurrentMapDrawMetatileAt
	movs r0, 0
	strh r0, [r5, 0x2E]
	ldr r0, _080C6F24 @ =SpriteCB_SandPillar_2
	str r0, [r5, 0x1C]
_080C6F14:
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080C6F1C: .4byte gFieldEffectArguments
_080C6F20: .4byte 0x00000e8c
_080C6F24: .4byte SpriteCB_SandPillar_2
	thumb_func_end SpriteCB_SandPillar_1

	thumb_func_start SpriteCB_SandPillar_2
SpriteCB_SandPillar_2: @ 80C6F28
	push {lr}
	movs r1, 0x34
	bl FieldEffectStop
	bl EnableBothScriptContexts
	pop {r0}
	bx r0
	thumb_func_end SpriteCB_SandPillar_2

	thumb_func_start GetShieldToyTVDecorationInfo
GetShieldToyTVDecorationInfo: @ 80C6F38
	push {r4,lr}
	sub sp, 0x4
	mov r4, sp
	adds r4, 0x2
	mov r0, sp
	adds r1, r4, 0
	bl GetXYCoordsOneStepInFrontOfPlayer
	mov r0, sp
	movs r1, 0
	ldrsh r0, [r0, r1]
	movs r2, 0
	ldrsh r1, [r4, r2]
	bl MapGridGetMetatileIdAt
	adds r1, r0, 0
	ldr r0, _080C6F70 @ =0x000002f5
	cmp r1, r0
	beq _080C6FE8
	cmp r1, r0
	bgt _080C6F74
	subs r0, 0x17
	cmp r1, r0
	beq _080C6FB0
	adds r0, 0x16
	cmp r1, r0
	beq _080C6FDC
	b _080C6FFA
	.align 2, 0
_080C6F70: .4byte 0x000002f5
_080C6F74:
	ldr r0, _080C6F9C @ =0x000002f6
	cmp r1, r0
	beq _080C6FF4
	adds r0, 0x40
	cmp r1, r0
	bne _080C6FFA
	ldr r0, _080C6FA0 @ =gStringVar1
	movs r1, 0x64
	movs r2, 0
	movs r3, 0x3
	bl ConvertIntToDecimalStringN
	ldr r0, _080C6FA4 @ =gStringVar2
	ldr r1, _080C6FA8 @ =gSecretBaseText_GoldRank
	bl StringCopy
	ldr r1, _080C6FAC @ =gScriptResult
	movs r0, 0
	b _080C6FF8
	.align 2, 0
_080C6F9C: .4byte 0x000002f6
_080C6FA0: .4byte gStringVar1
_080C6FA4: .4byte gStringVar2
_080C6FA8: .4byte gSecretBaseText_GoldRank
_080C6FAC: .4byte gScriptResult
_080C6FB0:
	ldr r0, _080C6FCC @ =gStringVar1
	movs r1, 0x32
	movs r2, 0
	movs r3, 0x2
	bl ConvertIntToDecimalStringN
	ldr r0, _080C6FD0 @ =gStringVar2
	ldr r1, _080C6FD4 @ =gSecretBaseText_SilverRank
	bl StringCopy
	ldr r1, _080C6FD8 @ =gScriptResult
	movs r0, 0
	b _080C6FF8
	.align 2, 0
_080C6FCC: .4byte gStringVar1
_080C6FD0: .4byte gStringVar2
_080C6FD4: .4byte gSecretBaseText_SilverRank
_080C6FD8: .4byte gScriptResult
_080C6FDC:
	ldr r1, _080C6FE4 @ =gScriptResult
	movs r0, 0x1
	b _080C6FF8
	.align 2, 0
_080C6FE4: .4byte gScriptResult
_080C6FE8:
	ldr r1, _080C6FF0 @ =gScriptResult
	movs r0, 0x2
	b _080C6FF8
	.align 2, 0
_080C6FF0: .4byte gScriptResult
_080C6FF4:
	ldr r1, _080C7004 @ =gScriptResult
	movs r0, 0x3
_080C6FF8:
	strh r0, [r1]
_080C6FFA:
	add sp, 0x4
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080C7004: .4byte gScriptResult
	thumb_func_end GetShieldToyTVDecorationInfo

	.align 2, 0 @ Don't pad with nop.
