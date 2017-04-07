	.include "constants/gba_constants.inc"
	.include "constants/species_constants.inc"
	.include "asm/macros.inc"

	.syntax unified

	.text
	
		thumb_func_start SetUpFieldMove_SoftBoiled
SetUpFieldMove_SoftBoiled: @ 8133CCC
	push {r4-r6,lr}
	mov r6, r8
	push {r6}
	ldr r0, _08133D14 @ =gLastFieldPokeMenuOpened
	mov r8, r0
	ldrb r0, [r0]
	movs r6, 0x64
	muls r0, r6
	ldr r4, _08133D18 @ =gPlayerParty
	adds r0, r4
	movs r1, 0x3A
	bl GetMonData
	adds r5, r0, 0
	lsls r5, 16
	lsrs r5, 16
	mov r1, r8
	ldrb r0, [r1]
	muls r0, r6
	adds r0, r4
	movs r1, 0x39
	bl GetMonData
	adds r4, r0, 0
	lsls r4, 16
	lsrs r4, 16
	adds r0, r5, 0
	movs r1, 0x5
	bl __udivsi3
	lsls r0, 16
	lsrs r0, 16
	cmp r4, r0
	bcs _08133D1C
	movs r0, 0
	b _08133D1E
	.align 2, 0
_08133D14: .4byte gLastFieldPokeMenuOpened
_08133D18: .4byte gPlayerParty
_08133D1C:
	movs r0, 0x1
_08133D1E:
	pop {r3}
	mov r8, r3
	pop {r4-r6}
	pop {r1}
	bx r1
	thumb_func_end SetUpFieldMove_SoftBoiled

	thumb_func_start sub_8133D28
sub_8133D28: @ 8133D28
	push {lr}
	lsls r0, 24
	lsrs r0, 24
	ldr r1, _08133D44 @ =0x02001000
	ldr r2, _08133D48 @ =sub_8133D50
	str r2, [r1, 0xC]
	ldr r2, _08133D4C @ =0x0001a272
	adds r1, r2
	movs r2, 0x3
	strh r2, [r1]
	bl sub_808A004
	pop {r0}
	bx r0
	.align 2, 0
_08133D44: .4byte 0x02001000
_08133D48: .4byte sub_8133D50
_08133D4C: .4byte 0x0001a272
	thumb_func_end sub_8133D28

	thumb_func_start sub_8133D50
sub_8133D50: @ 8133D50
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	lsls r0, 24
	lsrs r7, r0, 24
	ldr r0, _08133DA0 @ =gSprites
	mov r9, r0
	ldr r1, _08133DA4 @ =0x02001000
	mov r10, r1
	ldrb r1, [r1, 0x1]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	add r0, r9
	ldrh r0, [r0, 0x2E]
	lsls r0, 24
	lsrs r0, 24
	mov r8, r0
	mov r2, r10
	ldrb r1, [r2, 0x2]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	mov r2, r9
	adds r1, r0, r2
	ldrh r0, [r1, 0x2E]
	lsls r0, 24
	lsrs r6, r0, 24
	mov r0, r8
	cmp r0, 0x5
	bhi _08133D96
	cmp r6, 0x5
	bls _08133DA8
_08133D96:
	adds r0, r7, 0
	bl sub_806CD44
	b _08133E4E
	.align 2, 0
_08133DA0: .4byte gSprites
_08133DA4: .4byte 0x02001000
_08133DA8:
	movs r5, 0xD8
	lsls r5, 9
	add r5, r10
	movs r2, 0x2E
	ldrsh r0, [r1, r2]
	movs r1, 0x64
	muls r0, r1
	ldr r2, _08133DE4 @ =gPlayerParty
	adds r0, r2
	str r0, [r5]
	movs r1, 0x39
	bl GetMonData
	lsls r0, 16
	lsrs r4, r0, 16
	cmp r4, 0
	beq _08133DDA
	cmp r8, r6
	beq _08133DDA
	ldr r0, [r5]
	movs r1, 0x3A
	bl GetMonData
	cmp r0, r4
	bne _08133DE8
_08133DDA:
	adds r0, r7, 0
	bl sub_8133EB8
	b _08133E4E
	.align 2, 0
_08133DE4: .4byte gPlayerParty
_08133DE8:
	movs r0, 0x1
	bl PlaySE
	mov r0, r10
	ldrb r1, [r0, 0x1]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	add r0, r9
	ldrh r0, [r0, 0x2E]
	movs r1, 0
	strb r0, [r5, 0x5]
	ldrb r0, [r5, 0x5]
	movs r2, 0x64
	muls r0, r2
	ldr r2, _08133E5C @ =gPlayerParty
	adds r0, r2
	str r0, [r5]
	strh r1, [r5, 0x6]
	ldr r1, _08133E60 @ =0xffff8000
	str r1, [r5, 0xC]
	ldr r1, _08133E64 @ =sub_8133EF8
	str r1, [r5, 0x10]
	movs r1, 0x3A
	bl GetMonData
	ldr r1, _08133E68 @ =gTasks
	lsls r4, r7, 2
	adds r4, r7
	lsls r4, 3
	adds r4, r1
	strh r0, [r4, 0x1C]
	ldr r0, [r5]
	movs r1, 0x39
	bl GetMonData
	strh r0, [r4, 0x1E]
	movs r1, 0x1C
	ldrsh r0, [r4, r1]
	movs r1, 0x5
	bl __divsi3
	strh r0, [r4, 0x20]
	bl sub_806D5A4
	ldr r0, _08133E6C @ =sub_806FA18
	str r0, [r4]
	ldrh r1, [r4, 0x1E]
	ldr r0, _08133E70 @ =0x0001a282
	add r0, r10
	strh r1, [r0]
_08133E4E:
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_08133E5C: .4byte gPlayerParty
_08133E60: .4byte 0xffff8000
_08133E64: .4byte sub_8133EF8
_08133E68: .4byte gTasks
_08133E6C: .4byte sub_806FA18
_08133E70: .4byte 0x0001a282
	thumb_func_end sub_8133D50

	thumb_func_start sub_8133E74
sub_8133E74: @ 8133E74
	push {r4,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	ldr r0, _08133EAC @ =gUnknown_0202E8F6
	ldrb r0, [r0]
	cmp r0, 0
	bne _08133EA4
	movs r0, 0x3
	movs r1, 0xE
	movs r2, 0x1A
	movs r3, 0x13
	bl MenuZeroFillWindowRect
	movs r0, 0x3
	movs r1, 0
	bl sub_806D538
	ldr r0, _08133EB0 @ =gTasks
	lsls r1, r4, 2
	adds r1, r4
	lsls r1, 3
	adds r1, r0
	ldr r0, _08133EB4 @ =sub_806CB74
	str r0, [r1]
_08133EA4:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08133EAC: .4byte gUnknown_0202E8F6
_08133EB0: .4byte gTasks
_08133EB4: .4byte sub_806CB74
	thumb_func_end sub_8133E74

	thumb_func_start sub_8133EB8
sub_8133EB8: @ 8133EB8
	push {r4,lr}
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	ldr r1, _08133EE8 @ =gUnknown_0202E8F4
	movs r0, 0
	strb r0, [r1]
	bl sub_806D5A4
	ldr r0, _08133EEC @ =gOtherText_CantUseOnPoke
	movs r1, 0x1
	bl sub_806E834
	ldr r1, _08133EF0 @ =gTasks
	lsls r0, r4, 2
	adds r0, r4
	lsls r0, 3
	adds r0, r1
	ldr r1, _08133EF4 @ =sub_8133E74
	str r1, [r0]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08133EE8: .4byte gUnknown_0202E8F4
_08133EEC: .4byte gOtherText_CantUseOnPoke
_08133EF0: .4byte gTasks
_08133EF4: .4byte sub_8133E74
	thumb_func_end sub_8133EB8

	thumb_func_start sub_8133EF8
sub_8133EF8: @ 8133EF8
	push {r4,lr}
	bl sub_806CCE4
	ldr r4, _08133F3C @ =0x0201b000
	ldr r0, _08133F40 @ =0x00000261
	adds r1, r4, r0
	movs r0, 0x2
	strb r0, [r1]
	ldr r0, _08133F44 @ =0xfffe6000
	adds r4, r0
	ldrb r1, [r4, 0x1]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	ldr r1, _08133F48 @ =gSprites
	adds r0, r1
	bl DestroySprite
	movs r0, 0x3
	movs r1, 0xE
	movs r2, 0x1A
	movs r3, 0x13
	bl MenuZeroFillWindowRect
	movs r0, 0
	movs r1, 0
	bl sub_806D538
	ldrb r0, [r4]
	bl SwitchTaskToFollowupFunc
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08133F3C: .4byte 0x0201b000
_08133F40: .4byte 0x00000261
_08133F44: .4byte 0xfffe6000
_08133F48: .4byte gSprites
	thumb_func_end sub_8133EF8

	.align 2, 0 @ Don't pad with nop.
