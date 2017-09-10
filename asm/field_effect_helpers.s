	.include "constants/gba_constants.inc"
	.include "constants/species_constants.inc"
	.include "asm/macros.inc"

	.syntax unified

	.text

	thumb_func_start sub_8127A7C
sub_8127A7C: @ 8127A7C
	push {r4,r5,lr}
	sub sp, 0x4
	adds r4, r0, 0
	ldrh r0, [r4, 0x2E]
	lsls r0, 24
	lsrs r0, 24
	ldrh r1, [r4, 0x30]
	lsls r1, 24
	lsrs r1, 24
	ldrh r2, [r4, 0x32]
	lsls r2, 24
	lsrs r2, 24
	mov r3, sp
	bl TryGetFieldObjectIdByLocalIdAndMap
	lsls r0, 24
	cmp r0, 0
	bne _08127AB6
	ldr r5, _08127AC0 @ =gMapObjects
	mov r0, sp
	ldrb r1, [r0]
	lsls r0, r1, 3
	adds r0, r1
	lsls r0, 2
	adds r1, r0, r5
	ldrb r0, [r1, 0x2]
	lsls r0, 26
	cmp r0, 0
	blt _08127AC4
_08127AB6:
	adds r0, r4, 0
	movs r1, 0x2A
	bl FieldEffectStop
	b _08127B08
	.align 2, 0
_08127AC0: .4byte gMapObjects
_08127AC4:
	ldrb r0, [r1, 0x5]
	bl GetFieldObjectGraphicsInfo
	mov r1, sp
	ldrb r2, [r1]
	lsls r1, r2, 3
	adds r1, r2
	lsls r1, 2
	adds r1, r5
	ldrb r2, [r1, 0x4]
	lsls r1, r2, 4
	adds r1, r2
	lsls r1, 2
	ldr r2, _08127B10 @ =gSprites
	adds r1, r2
	ldrh r2, [r1, 0x20]
	strh r2, [r4, 0x20]
	ldrh r0, [r0, 0xA]
	lsls r0, 16
	asrs r0, 17
	ldrh r2, [r1, 0x22]
	adds r0, r2
	subs r0, 0x8
	strh r0, [r4, 0x22]
	adds r1, 0x43
	ldrb r0, [r1]
	subs r0, 0x1
	adds r1, r4, 0
	adds r1, 0x43
	strb r0, [r1]
	adds r0, r4, 0
	movs r1, 0
	bl sub_806487C
_08127B08:
	add sp, 0x4
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_08127B10: .4byte gSprites
	thumb_func_end sub_8127A7C

	thumb_func_start FldEff_Unknown19
FldEff_Unknown19: @ 8127B14
	push {r4,lr}
	ldr r4, _08127B74 @ =gFieldEffectSpawnParams
	adds r1, r4, 0x4
	adds r0, r4, 0
	movs r2, 0x8
	movs r3, 0x8
	bl sub_8060470
	ldr r0, _08127B78 @ =gFieldEffectObjectTemplatePointers
	ldr r0, [r0, 0x44]
	movs r2, 0
	ldrsh r1, [r4, r2]
	movs r3, 0x4
	ldrsh r2, [r4, r3]
	ldrb r3, [r4, 0x8]
	bl CreateSpriteAtEnd
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x40
	beq _08127B6C
	lsls r2, r0, 4
	adds r2, r0
	lsls r2, 2
	ldr r0, _08127B7C @ =gSprites
	adds r2, r0
	adds r3, r2, 0
	adds r3, 0x3E
	ldrb r0, [r3]
	movs r1, 0x2
	orrs r0, r1
	strb r0, [r3]
	movs r0, 0x3
	ldrb r1, [r4, 0xC]
	ands r1, r0
	lsls r1, 2
	ldrb r3, [r2, 0x5]
	movs r0, 0xD
	negs r0, r0
	ands r0, r3
	orrs r0, r1
	strb r0, [r2, 0x5]
	movs r0, 0x13
	strh r0, [r2, 0x2E]
_08127B6C:
	movs r0, 0
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_08127B74: .4byte gFieldEffectSpawnParams
_08127B78: .4byte gFieldEffectObjectTemplatePointers
_08127B7C: .4byte gSprites
	thumb_func_end FldEff_Unknown19

	thumb_func_start FldEff_Unknown20
FldEff_Unknown20: @ 8127B80
	push {r4,lr}
	ldr r4, _08127BE0 @ =gFieldEffectSpawnParams
	adds r1, r4, 0x4
	adds r0, r4, 0
	movs r2, 0x8
	movs r3, 0x8
	bl sub_8060470
	ldr r0, _08127BE4 @ =gFieldEffectObjectTemplatePointers
	ldr r0, [r0, 0x48]
	movs r2, 0
	ldrsh r1, [r4, r2]
	movs r3, 0x4
	ldrsh r2, [r4, r3]
	ldrb r3, [r4, 0x8]
	bl CreateSpriteAtEnd
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x40
	beq _08127BD8
	lsls r2, r0, 4
	adds r2, r0
	lsls r2, 2
	ldr r0, _08127BE8 @ =gSprites
	adds r2, r0
	adds r3, r2, 0
	adds r3, 0x3E
	ldrb r0, [r3]
	movs r1, 0x2
	orrs r0, r1
	strb r0, [r3]
	movs r0, 0x3
	ldrb r1, [r4, 0xC]
	ands r1, r0
	lsls r1, 2
	ldrb r3, [r2, 0x5]
	movs r0, 0xD
	negs r0, r0
	ands r0, r3
	orrs r0, r1
	strb r0, [r2, 0x5]
	movs r0, 0x14
	strh r0, [r2, 0x2E]
_08127BD8:
	movs r0, 0
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_08127BE0: .4byte gFieldEffectSpawnParams
_08127BE4: .4byte gFieldEffectObjectTemplatePointers
_08127BE8: .4byte gSprites
	thumb_func_end FldEff_Unknown20

	thumb_func_start FldEff_Unknown21
FldEff_Unknown21: @ 8127BEC
	push {r4,lr}
	ldr r4, _08127C4C @ =gFieldEffectSpawnParams
	adds r1, r4, 0x4
	adds r0, r4, 0
	movs r2, 0x8
	movs r3, 0x8
	bl sub_8060470
	ldr r0, _08127C50 @ =gFieldEffectObjectTemplatePointers
	ldr r0, [r0, 0x4C]
	movs r2, 0
	ldrsh r1, [r4, r2]
	movs r3, 0x4
	ldrsh r2, [r4, r3]
	ldrb r3, [r4, 0x8]
	bl CreateSpriteAtEnd
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x40
	beq _08127C44
	lsls r2, r0, 4
	adds r2, r0
	lsls r2, 2
	ldr r0, _08127C54 @ =gSprites
	adds r2, r0
	adds r3, r2, 0
	adds r3, 0x3E
	ldrb r0, [r3]
	movs r1, 0x2
	orrs r0, r1
	strb r0, [r3]
	movs r0, 0x3
	ldrb r1, [r4, 0xC]
	ands r1, r0
	lsls r1, 2
	ldrb r3, [r2, 0x5]
	movs r0, 0xD
	negs r0, r0
	ands r0, r3
	orrs r0, r1
	strb r0, [r2, 0x5]
	movs r0, 0x15
	strh r0, [r2, 0x2E]
_08127C44:
	movs r0, 0
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_08127C4C: .4byte gFieldEffectSpawnParams
_08127C50: .4byte gFieldEffectObjectTemplatePointers
_08127C54: .4byte gSprites
	thumb_func_end FldEff_Unknown21

	thumb_func_start FldEff_Unknown22
FldEff_Unknown22: @ 8127C58
	push {r4,lr}
	ldr r4, _08127CB8 @ =gFieldEffectSpawnParams
	adds r1, r4, 0x4
	adds r0, r4, 0
	movs r2, 0x8
	movs r3, 0x8
	bl sub_8060470
	ldr r0, _08127CBC @ =gFieldEffectObjectTemplatePointers
	ldr r0, [r0, 0x50]
	movs r2, 0
	ldrsh r1, [r4, r2]
	movs r3, 0x4
	ldrsh r2, [r4, r3]
	ldrb r3, [r4, 0x8]
	bl CreateSpriteAtEnd
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x40
	beq _08127CB0
	lsls r2, r0, 4
	adds r2, r0
	lsls r2, 2
	ldr r0, _08127CC0 @ =gSprites
	adds r2, r0
	adds r3, r2, 0
	adds r3, 0x3E
	ldrb r0, [r3]
	movs r1, 0x2
	orrs r0, r1
	strb r0, [r3]
	movs r0, 0x3
	ldrb r1, [r4, 0xC]
	ands r1, r0
	lsls r1, 2
	ldrb r3, [r2, 0x5]
	movs r0, 0xD
	negs r0, r0
	ands r0, r3
	orrs r0, r1
	strb r0, [r2, 0x5]
	movs r0, 0x16
	strh r0, [r2, 0x2E]
_08127CB0:
	movs r0, 0
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_08127CB8: .4byte gFieldEffectSpawnParams
_08127CBC: .4byte gFieldEffectObjectTemplatePointers
_08127CC0: .4byte gSprites
	thumb_func_end FldEff_Unknown22

	thumb_func_start ash
ash: @ 8127CC4
	push {r4,lr}
	lsls r2, 16
	lsrs r2, 16
	ldr r4, _08127CF4 @ =gFieldEffectSpawnParams
	lsls r0, 16
	asrs r0, 16
	str r0, [r4]
	lsls r1, 16
	asrs r1, 16
	str r1, [r4, 0x4]
	movs r0, 0x52
	str r0, [r4, 0x8]
	movs r0, 0x1
	str r0, [r4, 0xC]
	str r2, [r4, 0x10]
	lsls r3, 16
	asrs r3, 16
	str r3, [r4, 0x14]
	movs r0, 0x7
	bl FieldEffectStart
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08127CF4: .4byte gFieldEffectSpawnParams
	thumb_func_end ash

	thumb_func_start FldEff_Ash
FldEff_Ash: @ 8127CF8
	push {r4,r5,lr}
	sub sp, 0x4
	ldr r5, _08127D78 @ =gFieldEffectSpawnParams
	ldrh r1, [r5]
	mov r0, sp
	strh r1, [r0]
	ldrh r0, [r5, 0x4]
	mov r4, sp
	adds r4, 0x2
	strh r0, [r4]
	mov r0, sp
	adds r1, r4, 0
	movs r2, 0x8
	movs r3, 0x8
	bl sub_8060470
	ldr r0, _08127D7C @ =gFieldEffectObjectTemplatePointers
	ldr r0, [r0, 0x18]
	mov r1, sp
	movs r2, 0
	ldrsh r1, [r1, r2]
	movs r3, 0
	ldrsh r2, [r4, r3]
	ldrb r3, [r5, 0x8]
	bl CreateSpriteAtEnd
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x40
	beq _08127D6E
	lsls r2, r0, 4
	adds r2, r0
	lsls r2, 2
	ldr r0, _08127D80 @ =gSprites
	adds r2, r0
	adds r3, r2, 0
	adds r3, 0x3E
	ldrb r0, [r3]
	movs r1, 0x2
	orrs r0, r1
	strb r0, [r3]
	movs r0, 0x3
	ldrb r1, [r5, 0xC]
	ands r1, r0
	lsls r1, 2
	ldrb r3, [r2, 0x5]
	movs r0, 0xD
	negs r0, r0
	ands r0, r3
	orrs r0, r1
	strb r0, [r2, 0x5]
	ldr r0, [r5]
	strh r0, [r2, 0x30]
	ldr r0, [r5, 0x4]
	strh r0, [r2, 0x32]
	ldr r0, [r5, 0x10]
	strh r0, [r2, 0x34]
	ldr r0, [r5, 0x14]
	strh r0, [r2, 0x36]
_08127D6E:
	movs r0, 0
	add sp, 0x4
	pop {r4,r5}
	pop {r1}
	bx r1
	.align 2, 0
_08127D78: .4byte gFieldEffectSpawnParams
_08127D7C: .4byte gFieldEffectObjectTemplatePointers
_08127D80: .4byte gSprites
	thumb_func_end FldEff_Ash

	thumb_func_start sub_8127D84
sub_8127D84: @ 8127D84
	push {lr}
	ldr r2, _08127D9C @ =gUnknown_08401E48
	movs r3, 0x2E
	ldrsh r1, [r0, r3]
	lsls r1, 2
	adds r1, r2
	ldr r1, [r1]
	bl _call_via_r1
	pop {r0}
	bx r0
	.align 2, 0
_08127D9C: .4byte gUnknown_08401E48
	thumb_func_end sub_8127D84

	thumb_func_start sub_8127DA0
sub_8127DA0: @ 8127DA0
	push {lr}
	adds r3, r0, 0
	adds r2, r3, 0
	adds r2, 0x3E
	ldrb r0, [r2]
	movs r1, 0x4
	orrs r0, r1
	strb r0, [r2]
	subs r2, 0x12
	ldrb r0, [r2]
	movs r1, 0x40
	orrs r0, r1
	strb r0, [r2]
	ldrh r0, [r3, 0x36]
	subs r0, 0x1
	strh r0, [r3, 0x36]
	lsls r0, 16
	cmp r0, 0
	bne _08127DCA
	movs r0, 0x1
	strh r0, [r3, 0x2E]
_08127DCA:
	pop {r0}
	bx r0
	thumb_func_end sub_8127DA0

	thumb_func_start sub_8127DD0
sub_8127DD0: @ 8127DD0
	push {r4,lr}
	adds r4, r0, 0
	adds r2, r4, 0
	adds r2, 0x3E
	ldrb r1, [r2]
	movs r0, 0x5
	negs r0, r0
	ands r0, r1
	strb r0, [r2]
	subs r2, 0x12
	ldrb r1, [r2]
	movs r0, 0x41
	negs r0, r0
	ands r0, r1
	strb r0, [r2]
	movs r1, 0x30
	ldrsh r0, [r4, r1]
	movs r2, 0x32
	ldrsh r1, [r4, r2]
	ldrh r2, [r4, 0x34]
	bl MapGridSetMetatileIdAt
	movs r1, 0x30
	ldrsh r0, [r4, r1]
	movs r2, 0x32
	ldrsh r1, [r4, r2]
	bl CurrentMapDrawMetatileAt
	ldr r2, _08127E28 @ =gMapObjects
	ldr r0, _08127E2C @ =gPlayerAvatar
	ldrb r1, [r0, 0x5]
	lsls r0, r1, 3
	adds r0, r1
	lsls r0, 2
	adds r0, r2
	ldrb r1, [r0]
	movs r2, 0x4
	orrs r1, r2
	strb r1, [r0]
	movs r0, 0x2
	strh r0, [r4, 0x2E]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08127E28: .4byte gMapObjects
_08127E2C: .4byte gPlayerAvatar
	thumb_func_end sub_8127DD0

	thumb_func_start sub_8127E30
sub_8127E30: @ 8127E30
	push {r4,lr}
	adds r4, r0, 0
	movs r1, 0
	bl sub_806487C
	adds r0, r4, 0
	adds r0, 0x3F
	ldrb r1, [r0]
	movs r0, 0x10
	ands r0, r1
	cmp r0, 0
	beq _08127E50
	adds r0, r4, 0
	movs r1, 0x7
	bl FieldEffectStop
_08127E50:
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end sub_8127E30

	thumb_func_start FldEff_SurfBlob
FldEff_SurfBlob: @ 8127E58
	push {r4,r5,lr}
	ldr r4, _08127EC0 @ =gFieldEffectSpawnParams
	adds r1, r4, 0x4
	adds r0, r4, 0
	movs r2, 0x8
	movs r3, 0x8
	bl sub_8060470
	ldr r0, _08127EC4 @ =gFieldEffectObjectTemplatePointers
	ldr r0, [r0, 0x1C]
	movs r2, 0
	ldrsh r1, [r4, r2]
	movs r3, 0x4
	ldrsh r2, [r4, r3]
	movs r3, 0x96
	bl CreateSpriteAtEnd
	lsls r0, 24
	lsrs r0, 24
	adds r5, r0, 0
	cmp r0, 0x40
	beq _08127EB2
	lsls r1, r0, 4
	adds r1, r0
	lsls r1, 2
	ldr r0, _08127EC8 @ =gSprites
	adds r1, r0
	adds r3, r1, 0
	adds r3, 0x3E
	ldrb r0, [r3]
	movs r2, 0x2
	orrs r0, r2
	strb r0, [r3]
	ldrb r2, [r1, 0x5]
	movs r0, 0xF
	ands r0, r2
	strb r0, [r1, 0x5]
	ldr r0, [r4, 0x8]
	strh r0, [r1, 0x32]
	ldr r0, _08127ECC @ =0x0000ffff
	strh r0, [r1, 0x34]
	movs r0, 0x1
	negs r0, r0
	strh r0, [r1, 0x3A]
	strh r0, [r1, 0x3C]
_08127EB2:
	movs r0, 0x8
	bl FieldEffectActiveListRemove
	adds r0, r5, 0
	pop {r4,r5}
	pop {r1}
	bx r1
	.align 2, 0
_08127EC0: .4byte gFieldEffectSpawnParams
_08127EC4: .4byte gFieldEffectObjectTemplatePointers
_08127EC8: .4byte gSprites
_08127ECC: .4byte 0x0000ffff
	thumb_func_end FldEff_SurfBlob

	thumb_func_start sub_8127ED0
sub_8127ED0: @ 8127ED0
	lsls r0, 24
	lsrs r0, 24
	lsls r1, 24
	ldr r3, _08127EF8 @ =gSprites
	lsls r2, r0, 4
	adds r2, r0
	lsls r2, 2
	adds r2, r3
	ldrh r0, [r2, 0x2E]
	movs r3, 0x10
	negs r3, r3
	ands r3, r0
	movs r0, 0xF0
	lsls r0, 20
	ands r0, r1
	lsrs r0, 24
	orrs r0, r3
	strh r0, [r2, 0x2E]
	bx lr
	.align 2, 0
_08127EF8: .4byte gSprites
	thumb_func_end sub_8127ED0

	thumb_func_start sub_8127EFC
sub_8127EFC: @ 8127EFC
	lsls r0, 24
	lsrs r0, 24
	lsls r1, 24
	ldr r3, _08127F24 @ =gSprites
	lsls r2, r0, 4
	adds r2, r0
	lsls r2, 2
	adds r2, r3
	ldrh r0, [r2, 0x2E]
	movs r3, 0xF1
	negs r3, r3
	ands r3, r0
	movs r0, 0xF0
	lsls r0, 20
	ands r0, r1
	lsrs r0, 20
	orrs r3, r0
	strh r3, [r2, 0x2E]
	bx lr
	.align 2, 0
_08127F24: .4byte gSprites
	thumb_func_end sub_8127EFC

	thumb_func_start sub_8127F28
sub_8127F28: @ 8127F28
	push {r4,lr}
	lsls r0, 24
	lsrs r0, 24
	lsls r1, 24
	ldr r4, _08127F54 @ =gSprites
	lsls r3, r0, 4
	adds r3, r0
	lsls r3, 2
	adds r3, r4
	ldrh r0, [r3, 0x2E]
	ldr r4, _08127F58 @ =0xfffff0ff
	ands r4, r0
	movs r0, 0xF0
	lsls r0, 20
	ands r0, r1
	lsrs r0, 16
	orrs r4, r0
	strh r4, [r3, 0x2E]
	strh r2, [r3, 0x30]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08127F54: .4byte gSprites
_08127F58: .4byte 0xfffff0ff
	thumb_func_end sub_8127F28

	thumb_func_start sub_8127F5C
sub_8127F5C: @ 8127F5C
	ldrh r1, [r0, 0x2E]
	movs r0, 0xF
	ands r0, r1
	bx lr
	thumb_func_end sub_8127F5C

	thumb_func_start sub_8127F64
sub_8127F64: @ 8127F64
	ldrh r1, [r0, 0x2E]
	movs r0, 0xF0
	ands r0, r1
	lsrs r0, 4
	bx lr
	thumb_func_end sub_8127F64

	thumb_func_start sub_8127F70
sub_8127F70: @ 8127F70
	ldrh r1, [r0, 0x2E]
	movs r0, 0xF0
	lsls r0, 4
	ands r0, r1
	lsrs r0, 8
	bx lr
	thumb_func_end sub_8127F70

	thumb_func_start sub_8127F7C
sub_8127F7C: @ 8127F7C
	push {r4-r6,lr}
	adds r6, r0, 0
	movs r1, 0x32
	ldrsh r0, [r6, r1]
	lsls r4, r0, 3
	adds r4, r0
	lsls r4, 2
	ldr r0, _08127FCC @ =gMapObjects
	adds r4, r0
	ldrb r0, [r4, 0x4]
	lsls r5, r0, 4
	adds r5, r0
	lsls r5, 2
	ldr r0, _08127FD0 @ =gSprites
	adds r5, r0
	adds r0, r4, 0
	adds r1, r6, 0
	bl sub_8127FD4
	adds r0, r4, 0
	adds r1, r6, 0
	bl sub_812800C
	adds r0, r4, 0
	adds r1, r5, 0
	adds r2, r6, 0
	bl sub_81280A0
	ldrb r0, [r5, 0x5]
	movs r1, 0xC
	ands r1, r0
	ldrb r2, [r6, 0x5]
	movs r0, 0xD
	negs r0, r0
	ands r0, r2
	orrs r0, r1
	strb r0, [r6, 0x5]
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_08127FCC: .4byte gMapObjects
_08127FD0: .4byte gSprites
	thumb_func_end sub_8127F7C

	thumb_func_start sub_8127FD4
sub_8127FD4: @ 8127FD4
	push {r4,r5,lr}
	sub sp, 0x8
	adds r5, r0, 0
	adds r4, r1, 0
	ldr r1, _08128008 @ =gUnknown_08401E54
	mov r0, sp
	movs r2, 0x5
	bl memcpy
	adds r0, r4, 0
	bl sub_8127F64
	lsls r0, 24
	cmp r0, 0
	bne _08128000
	ldrb r0, [r5, 0x18]
	lsrs r0, 4
	add r0, sp
	ldrb r1, [r0]
	adds r0, r4, 0
	bl StartSpriteAnimIfDifferent
_08128000:
	add sp, 0x8
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_08128008: .4byte gUnknown_08401E54
	thumb_func_end sub_8127FD4

	thumb_func_start sub_812800C
sub_812800C: @ 812800C
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	sub sp, 0x4
	adds r4, r1, 0
	ldrh r2, [r0, 0x10]
	mov r1, sp
	strh r2, [r1]
	ldrh r1, [r0, 0x12]
	mov r0, sp
	adds r0, 0x2
	strh r1, [r0]
	movs r2, 0x26
	ldrsh r3, [r4, r2]
	mov r8, r0
	cmp r3, 0
	bne _08128094
	mov r0, sp
	movs r5, 0
	ldrsh r2, [r0, r5]
	movs r5, 0x3A
	ldrsh r0, [r4, r5]
	cmp r2, r0
	bne _08128048
	lsls r0, r1, 16
	asrs r0, 16
	movs r5, 0x3C
	ldrsh r1, [r4, r5]
	cmp r0, r1
	beq _08128094
_08128048:
	strh r3, [r4, 0x38]
	strh r2, [r4, 0x3A]
	mov r1, r8
	movs r2, 0
	ldrsh r0, [r1, r2]
	strh r0, [r4, 0x3C]
	movs r5, 0x1
	mov r7, r8
	mov r6, sp
_0812805A:
	adds r0, r5, 0
	mov r1, sp
	adds r2, r7, 0
	bl MoveCoords
	movs r1, 0
	ldrsh r0, [r6, r1]
	movs r2, 0
	ldrsh r1, [r7, r2]
	bl MapGridGetZCoordAt
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x3
	bne _08128080
	ldrh r0, [r4, 0x38]
	adds r0, 0x1
	strh r0, [r4, 0x38]
	b _08128094
_08128080:
	adds r0, r5, 0x1
	lsls r0, 24
	lsrs r5, r0, 24
	ldrh r0, [r4, 0x3A]
	strh r0, [r6]
	ldrh r0, [r4, 0x3C]
	mov r1, r8
	strh r0, [r1]
	cmp r5, 0x4
	bls _0812805A
_08128094:
	add sp, 0x4
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r0}
	bx r0
	thumb_func_end sub_812800C

	thumb_func_start sub_81280A0
sub_81280A0: @ 81280A0
	push {r4,r5,lr}
	sub sp, 0x4
	adds r5, r1, 0
	adds r4, r2, 0
	ldr r1, _08128104 @ =gUnknown_08401E5A
	mov r0, sp
	movs r2, 0x4
	bl memcpy
	adds r0, r4, 0
	bl sub_8127F5C
	lsls r0, 24
	lsrs r0, 24
	adds r2, r0, 0
	cmp r2, 0
	beq _0812811A
	ldrh r1, [r4, 0x36]
	adds r1, 0x1
	strh r1, [r4, 0x36]
	movs r3, 0x38
	ldrsh r0, [r4, r3]
	lsls r0, 1
	add r0, sp
	ldrh r0, [r0]
	ands r1, r0
	cmp r1, 0
	bne _081280E0
	ldrh r0, [r4, 0x34]
	ldrh r1, [r4, 0x26]
	adds r0, r1
	strh r0, [r4, 0x26]
_081280E0:
	ldrh r1, [r4, 0x36]
	movs r0, 0xF
	ands r0, r1
	cmp r0, 0
	bne _081280F0
	ldrh r0, [r4, 0x34]
	negs r0, r0
	strh r0, [r4, 0x34]
_081280F0:
	cmp r2, 0x2
	beq _0812811A
	adds r0, r4, 0
	bl sub_8127F70
	lsls r0, 24
	cmp r0, 0
	bne _08128108
	ldrh r0, [r4, 0x26]
	b _0812810E
	.align 2, 0
_08128104: .4byte gUnknown_08401E5A
_08128108:
	ldrh r0, [r4, 0x26]
	ldrh r3, [r4, 0x30]
	adds r0, r3
_0812810E:
	strh r0, [r5, 0x26]
	ldrh r0, [r5, 0x20]
	strh r0, [r4, 0x20]
	ldrh r0, [r5, 0x22]
	adds r0, 0x8
	strh r0, [r4, 0x22]
_0812811A:
	add sp, 0x4
	pop {r4,r5}
	pop {r0}
	bx r0
	thumb_func_end sub_81280A0

	thumb_func_start sub_8128124
sub_8128124: @ 8128124
	push {r4,lr}
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	ldr r0, _08128168 @ =gDummySpriteTemplate
	movs r1, 0
	movs r2, 0
	movs r3, 0xFF
	bl CreateSpriteAtEnd
	lsls r0, 24
	lsrs r0, 24
	lsls r2, r0, 4
	adds r2, r0
	lsls r2, 2
	ldr r1, _0812816C @ =gSprites
	adds r2, r1
	ldr r1, _08128170 @ =sub_8128174
	str r1, [r2, 0x1C]
	movs r1, 0x3E
	adds r1, r2
	mov r12, r1
	ldrb r1, [r1]
	movs r3, 0x4
	orrs r1, r3
	mov r3, r12
	strb r1, [r3]
	strh r4, [r2, 0x2E]
	movs r1, 0x1
	strh r1, [r2, 0x30]
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_08128168: .4byte gDummySpriteTemplate
_0812816C: .4byte gSprites
_08128170: .4byte sub_8128174
	thumb_func_end sub_8128124

	thumb_func_start sub_8128174
sub_8128174: @ 8128174
	push {lr}
	adds r2, r0, 0
	movs r0, 0x2E
	ldrsh r1, [r2, r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	ldr r1, _081281B0 @ =gSprites
	adds r3, r0, r1
	ldrh r1, [r2, 0x32]
	adds r0, r1, 0x1
	strh r0, [r2, 0x32]
	movs r0, 0x3
	ands r0, r1
	cmp r0, 0
	bne _0812819C
	ldrh r0, [r2, 0x30]
	ldrh r1, [r3, 0x26]
	adds r0, r1
	strh r0, [r3, 0x26]
_0812819C:
	ldrh r1, [r2, 0x32]
	movs r0, 0xF
	ands r0, r1
	cmp r0, 0
	bne _081281AC
	ldrh r0, [r2, 0x30]
	negs r0, r0
	strh r0, [r2, 0x30]
_081281AC:
	pop {r0}
	bx r0
	.align 2, 0
_081281B0: .4byte gSprites
	thumb_func_end sub_8128174

	thumb_func_start FldEff_Dust
FldEff_Dust: @ 81281B4
	push {r4,lr}
	ldr r4, _08128218 @ =gFieldEffectSpawnParams
	adds r1, r4, 0x4
	adds r0, r4, 0
	movs r2, 0x8
	movs r3, 0xC
	bl sub_8060470
	ldr r0, _0812821C @ =gFieldEffectObjectTemplatePointers
	ldr r0, [r0, 0x24]
	movs r2, 0
	ldrsh r1, [r4, r2]
	movs r3, 0x4
	ldrsh r2, [r4, r3]
	movs r3, 0
	bl CreateSpriteAtEnd
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x40
	beq _08128210
	lsls r2, r0, 4
	adds r2, r0
	lsls r2, 2
	ldr r0, _08128220 @ =gSprites
	adds r2, r0
	adds r3, r2, 0
	adds r3, 0x3E
	ldrb r0, [r3]
	movs r1, 0x2
	orrs r0, r1
	strb r0, [r3]
	movs r0, 0x3
	ldrb r1, [r4, 0xC]
	ands r1, r0
	lsls r1, 2
	ldrb r3, [r2, 0x5]
	movs r0, 0xD
	negs r0, r0
	ands r0, r3
	orrs r0, r1
	strb r0, [r2, 0x5]
	ldr r0, [r4, 0x8]
	strh r0, [r2, 0x2E]
	movs r0, 0xA
	strh r0, [r2, 0x30]
_08128210:
	movs r0, 0
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_08128218: .4byte gFieldEffectSpawnParams
_0812821C: .4byte gFieldEffectObjectTemplatePointers
_08128220: .4byte gSprites
	thumb_func_end FldEff_Dust

	thumb_func_start FldEff_SandPile
FldEff_SandPile: @ 8128224
	push {r4-r7,lr}
	ldr r7, _081282D0 @ =gFieldEffectSpawnParams
	ldrb r0, [r7]
	ldrb r1, [r7, 0x4]
	ldrb r2, [r7, 0x8]
	bl GetFieldObjectIdByLocalIdAndMap
	lsls r0, 24
	lsrs r0, 24
	lsls r1, r0, 3
	adds r1, r0
	lsls r1, 2
	ldr r0, _081282D4 @ =gMapObjects
	adds r6, r1, r0
	ldr r0, _081282D8 @ =gFieldEffectObjectTemplatePointers
	ldr r0, [r0, 0x74]
	movs r1, 0
	movs r2, 0
	movs r3, 0
	bl CreateSpriteAtEnd
	lsls r0, 24
	lsrs r4, r0, 24
	cmp r4, 0x40
	beq _081282C8
	ldrb r0, [r6, 0x5]
	bl GetFieldObjectGraphicsInfo
	adds r5, r0, 0
	lsls r0, r4, 4
	adds r0, r4
	lsls r0, 2
	ldr r4, _081282DC @ =gSprites
	adds r0, r4
	adds r3, r0, 0
	adds r3, 0x3E
	ldrb r1, [r3]
	movs r2, 0x2
	orrs r1, r2
	strb r1, [r3]
	ldrb r2, [r6, 0x4]
	lsls r1, r2, 4
	adds r1, r2
	lsls r1, 2
	adds r1, r4
	ldrb r1, [r1, 0x5]
	movs r2, 0xC
	ands r2, r1
	ldrb r3, [r0, 0x5]
	movs r1, 0xD
	negs r1, r1
	ands r1, r3
	orrs r1, r2
	strb r1, [r0, 0x5]
	ldr r1, [r7]
	strh r1, [r0, 0x2E]
	ldr r1, [r7, 0x4]
	strh r1, [r0, 0x30]
	ldr r1, [r7, 0x8]
	strh r1, [r0, 0x32]
	ldrb r2, [r6, 0x4]
	lsls r1, r2, 4
	adds r1, r2
	lsls r1, 2
	adds r1, r4
	ldrh r1, [r1, 0x20]
	strh r1, [r0, 0x34]
	ldrb r2, [r6, 0x4]
	lsls r1, r2, 4
	adds r1, r2
	lsls r1, 2
	adds r1, r4
	ldrh r1, [r1, 0x22]
	strh r1, [r0, 0x36]
	ldrh r1, [r5, 0xA]
	lsls r1, 16
	asrs r1, 17
	subs r1, 0x2
	strh r1, [r0, 0x26]
	movs r1, 0x2
	bl SeekSpriteAnim
_081282C8:
	movs r0, 0
	pop {r4-r7}
	pop {r1}
	bx r1
	.align 2, 0
_081282D0: .4byte gFieldEffectSpawnParams
_081282D4: .4byte gMapObjects
_081282D8: .4byte gFieldEffectObjectTemplatePointers
_081282DC: .4byte gSprites
	thumb_func_end FldEff_SandPile

	thumb_func_start sub_81282E0
sub_81282E0: @ 81282E0
	push {r4-r6,lr}
	sub sp, 0x4
	adds r4, r0, 0
	ldrh r0, [r4, 0x2E]
	lsls r0, 24
	lsrs r0, 24
	ldrh r1, [r4, 0x30]
	lsls r1, 24
	lsrs r1, 24
	ldrh r2, [r4, 0x32]
	lsls r2, 24
	lsrs r2, 24
	mov r3, sp
	bl TryGetFieldObjectIdByLocalIdAndMap
	lsls r0, 24
	cmp r0, 0
	bne _0812831A
	ldr r2, _08128324 @ =gMapObjects
	mov r0, sp
	ldrb r1, [r0]
	lsls r0, r1, 3
	adds r0, r1
	lsls r0, 2
	adds r1, r0, r2
	ldrb r0, [r1, 0x2]
	lsls r0, 27
	cmp r0, 0
	blt _08128328
_0812831A:
	adds r0, r4, 0
	movs r1, 0x27
	bl FieldEffectStop
	b _0812839A
	.align 2, 0
_08128324: .4byte gMapObjects
_08128328:
	ldr r2, _081283A4 @ =gSprites
	ldrb r1, [r1, 0x4]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r2
	ldrh r5, [r0, 0x22]
	ldrh r6, [r0, 0x20]
	movs r2, 0x20
	ldrsh r1, [r0, r2]
	movs r2, 0x34
	ldrsh r0, [r4, r2]
	cmp r1, r0
	bne _08128350
	lsls r0, r5, 16
	asrs r0, 16
	movs r2, 0x36
	ldrsh r1, [r4, r2]
	cmp r0, r1
	beq _0812836A
_08128350:
	strh r6, [r4, 0x34]
	strh r5, [r4, 0x36]
	adds r0, r4, 0
	adds r0, 0x3F
	ldrb r1, [r0]
	movs r0, 0x10
	ands r0, r1
	cmp r0, 0
	beq _0812836A
	adds r0, r4, 0
	movs r1, 0
	bl StartSpriteAnim
_0812836A:
	strh r6, [r4, 0x20]
	strh r5, [r4, 0x22]
	ldr r3, _081283A4 @ =gSprites
	ldr r2, _081283A8 @ =gMapObjects
	mov r0, sp
	ldrb r1, [r0]
	lsls r0, r1, 3
	adds r0, r1
	lsls r0, 2
	adds r0, r2
	ldrb r1, [r0, 0x4]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r3
	adds r0, 0x43
	ldrb r0, [r0]
	adds r1, r4, 0
	adds r1, 0x43
	strb r0, [r1]
	adds r0, r4, 0
	movs r1, 0
	bl sub_806487C
_0812839A:
	add sp, 0x4
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_081283A4: .4byte gSprites
_081283A8: .4byte gMapObjects
	thumb_func_end sub_81282E0

	thumb_func_start FldEff_Bubbles
FldEff_Bubbles: @ 81283AC
	push {r4,lr}
	ldr r4, _08128404 @ =gFieldEffectSpawnParams
	adds r1, r4, 0x4
	adds r0, r4, 0
	movs r2, 0x8
	movs r3, 0
	bl sub_8060470
	ldr r0, _08128408 @ =gFieldEffectObjectTemplatePointers
	adds r0, 0x88
	ldr r0, [r0]
	movs r2, 0
	ldrsh r1, [r4, r2]
	movs r3, 0x4
	ldrsh r2, [r4, r3]
	movs r3, 0x52
	bl CreateSpriteAtEnd
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x40
	beq _081283FC
	lsls r1, r0, 4
	adds r1, r0
	lsls r1, 2
	ldr r0, _0812840C @ =gSprites
	adds r1, r0
	adds r3, r1, 0
	adds r3, 0x3E
	ldrb r0, [r3]
	movs r2, 0x2
	orrs r0, r2
	strb r0, [r3]
	ldrb r2, [r1, 0x5]
	movs r0, 0xD
	negs r0, r0
	ands r0, r2
	movs r2, 0x4
	orrs r0, r2
	strb r0, [r1, 0x5]
_081283FC:
	movs r0, 0
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_08128404: .4byte gFieldEffectSpawnParams
_08128408: .4byte gFieldEffectObjectTemplatePointers
_0812840C: .4byte gSprites
	thumb_func_end FldEff_Bubbles

	thumb_func_start sub_8128410
sub_8128410: @ 8128410
	push {r4,lr}
	adds r4, r0, 0
	ldrh r0, [r4, 0x2E]
	adds r0, 0x80
	movs r1, 0x80
	lsls r1, 1
	ands r0, r1
	strh r0, [r4, 0x2E]
	lsls r0, 16
	asrs r0, 24
	ldrh r1, [r4, 0x22]
	subs r1, r0
	strh r1, [r4, 0x22]
	adds r0, r4, 0
	movs r1, 0
	bl sub_806487C
	ldrh r1, [r4, 0x3E]
	ldr r0, _0812844C @ =0x00001004
	ands r0, r1
	cmp r0, 0
	beq _08128444
	adds r0, r4, 0
	movs r1, 0x35
	bl FieldEffectStop
_08128444:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0812844C: .4byte 0x00001004
	thumb_func_end sub_8128410

	thumb_func_start FldEff_BerryTreeGrowthSparkle
FldEff_BerryTreeGrowthSparkle: @ 8128450
	push {r4,lr}
	ldr r4, _081284B8 @ =gFieldEffectSpawnParams
	adds r1, r4, 0x4
	adds r0, r4, 0
	movs r2, 0x8
	movs r3, 0x4
	bl sub_8060470
	ldr r0, _081284BC @ =gFieldEffectObjectTemplatePointers
	ldr r0, [r0, 0x58]
	movs r2, 0
	ldrsh r1, [r4, r2]
	movs r3, 0x4
	ldrsh r2, [r4, r3]
	ldrb r3, [r4, 0x8]
	bl CreateSpriteAtEnd
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x40
	beq _081284B0
	lsls r2, r0, 4
	adds r2, r0
	lsls r2, 2
	ldr r0, _081284C0 @ =gSprites
	adds r2, r0
	adds r3, r2, 0
	adds r3, 0x3E
	ldrb r0, [r3]
	movs r1, 0x2
	orrs r0, r1
	strb r0, [r3]
	movs r0, 0x3
	ldrb r1, [r4, 0xC]
	ands r1, r0
	lsls r1, 2
	ldrb r3, [r2, 0x5]
	movs r0, 0xD
	negs r0, r0
	ands r0, r3
	orrs r0, r1
	movs r1, 0xF
	ands r0, r1
	movs r1, 0x50
	orrs r0, r1
	strb r0, [r2, 0x5]
	movs r0, 0x17
	strh r0, [r2, 0x2E]
_081284B0:
	movs r0, 0
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_081284B8: .4byte gFieldEffectSpawnParams
_081284BC: .4byte gFieldEffectObjectTemplatePointers
_081284C0: .4byte gSprites
	thumb_func_end FldEff_BerryTreeGrowthSparkle

	thumb_func_start FldEff_TreeDisguise
FldEff_TreeDisguise: @ 81284C4
	push {lr}
	movs r0, 0x1C
	movs r1, 0x18
	movs r2, 0x4
	bl ShowDisguiseFieldEffect
	pop {r1}
	bx r1
	thumb_func_end FldEff_TreeDisguise

	thumb_func_start FldEff_MountainDisguise
FldEff_MountainDisguise: @ 81284D4
	push {lr}
	movs r0, 0x1D
	movs r1, 0x19
	movs r2, 0x3
	bl ShowDisguiseFieldEffect
	pop {r1}
	bx r1
	thumb_func_end FldEff_MountainDisguise

	thumb_func_start FldEff_SandDisguise
FldEff_SandDisguise: @ 81284E4
	push {lr}
	movs r0, 0x24
	movs r1, 0x1C
	movs r2, 0x2
	bl ShowDisguiseFieldEffect
	pop {r1}
	bx r1
	thumb_func_end FldEff_SandDisguise

	thumb_func_start ShowDisguiseFieldEffect
ShowDisguiseFieldEffect: @ 81284F4
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	sub sp, 0x4
	lsls r0, 24
	lsrs r4, r0, 24
	mov r8, r4
	lsls r1, 24
	lsrs r6, r1, 24
	lsls r2, 24
	lsrs r7, r2, 24
	ldr r5, _08128528 @ =gFieldEffectSpawnParams
	ldrb r0, [r5]
	ldrb r1, [r5, 0x4]
	ldrb r2, [r5, 0x8]
	mov r3, sp
	bl TryGetFieldObjectIdByLocalIdAndMap
	lsls r0, 24
	cmp r0, 0
	beq _0812852C
	adds r0, r4, 0
	bl FieldEffectActiveListRemove
	movs r0, 0x40
	b _08128598
	.align 2, 0
_08128528: .4byte gFieldEffectSpawnParams
_0812852C:
	ldr r1, _081285A4 @ =gFieldEffectObjectTemplatePointers
	lsls r0, r6, 2
	adds r0, r1
	ldr r0, [r0]
	movs r1, 0
	movs r2, 0
	movs r3, 0
	bl CreateSpriteAtEnd
	mov r1, sp
	strb r0, [r1]
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x40
	beq _08128594
	mov r0, sp
	ldrb r0, [r0]
	lsls r2, r0, 4
	adds r2, r0
	lsls r2, 2
	ldr r0, _081285A8 @ =gSprites
	adds r2, r0
	movs r0, 0x3E
	adds r0, r2
	mov r12, r0
	ldrb r3, [r0]
	lsls r1, r3, 30
	lsrs r1, 31
	adds r1, 0x1
	movs r0, 0x1
	ands r1, r0
	lsls r1, 1
	movs r0, 0x3
	negs r0, r0
	ands r0, r3
	orrs r0, r1
	mov r1, r12
	strb r0, [r1]
	lsls r3, r7, 4
	ldrb r1, [r2, 0x5]
	movs r0, 0xF
	ands r0, r1
	orrs r0, r3
	strb r0, [r2, 0x5]
	mov r0, r8
	strh r0, [r2, 0x30]
	ldr r0, [r5]
	strh r0, [r2, 0x32]
	ldr r0, [r5, 0x4]
	strh r0, [r2, 0x34]
	ldr r0, [r5, 0x8]
	strh r0, [r2, 0x36]
_08128594:
	mov r0, sp
	ldrb r0, [r0]
_08128598:
	add sp, 0x4
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r1}
	bx r1
	.align 2, 0
_081285A4: .4byte gFieldEffectObjectTemplatePointers
_081285A8: .4byte gSprites
	thumb_func_end ShowDisguiseFieldEffect

	thumb_func_start sub_81285AC
sub_81285AC: @ 81285AC
	push {r4,r5,lr}
	sub sp, 0x4
	adds r5, r0, 0
	ldrh r0, [r5, 0x32]
	lsls r0, 24
	lsrs r0, 24
	ldrh r1, [r5, 0x34]
	lsls r1, 24
	lsrs r1, 24
	ldrh r2, [r5, 0x36]
	lsls r2, 24
	lsrs r2, 24
	mov r3, sp
	bl TryGetFieldObjectIdByLocalIdAndMap
	lsls r0, 24
	cmp r0, 0
	beq _081285DC
	ldrh r1, [r5, 0x30]
	lsls r1, 24
	lsrs r1, 24
	adds r0, r5, 0
	bl FieldEffectStop
_081285DC:
	ldr r4, _08128694 @ =gMapObjects
	mov r0, sp
	ldrb r1, [r0]
	lsls r0, r1, 3
	adds r0, r1
	lsls r0, 2
	adds r0, r4
	ldrb r0, [r0, 0x5]
	bl GetFieldObjectGraphicsInfo
	mov r1, sp
	ldrb r2, [r1]
	lsls r1, r2, 3
	adds r1, r2
	lsls r1, 2
	adds r1, r4
	ldrb r1, [r1, 0x4]
	lsls r2, r1, 4
	adds r2, r1
	lsls r2, 2
	ldr r1, _08128698 @ =gSprites
	adds r2, r1
	adds r1, r2, 0
	adds r1, 0x3E
	ldrb r1, [r1]
	movs r3, 0x3E
	adds r3, r5
	mov r12, r3
	movs r3, 0x4
	ands r3, r1
	mov r1, r12
	ldrb r4, [r1]
	movs r1, 0x5
	negs r1, r1
	ands r1, r4
	orrs r1, r3
	mov r3, r12
	strb r1, [r3]
	ldrh r1, [r2, 0x20]
	strh r1, [r5, 0x20]
	ldrh r0, [r0, 0xA]
	lsls r0, 16
	asrs r0, 17
	ldrh r1, [r2, 0x22]
	adds r0, r1
	subs r0, 0x10
	strh r0, [r5, 0x22]
	adds r2, 0x43
	ldrb r0, [r2]
	subs r0, 0x1
	adds r1, r5, 0
	adds r1, 0x43
	strb r0, [r1]
	ldrh r1, [r5, 0x2E]
	movs r2, 0x2E
	ldrsh r0, [r5, r2]
	cmp r0, 0x1
	bne _0812865C
	adds r0, r1, 0x1
	strh r0, [r5, 0x2E]
	adds r0, r5, 0
	movs r1, 0x1
	bl StartSpriteAnim
_0812865C:
	movs r3, 0x2E
	ldrsh r0, [r5, r3]
	ldrh r2, [r5, 0x2E]
	cmp r0, 0x2
	bne _08128678
	adds r0, r5, 0
	adds r0, 0x3F
	ldrb r1, [r0]
	movs r0, 0x10
	ands r0, r1
	cmp r0, 0
	beq _08128678
	movs r0, 0x1
	strh r0, [r5, 0x3C]
_08128678:
	lsls r0, r2, 16
	asrs r0, 16
	cmp r0, 0x3
	bne _0812868C
	ldrh r1, [r5, 0x30]
	lsls r1, 24
	lsrs r1, 24
	adds r0, r5, 0
	bl FieldEffectStop
_0812868C:
	add sp, 0x4
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_08128694: .4byte gMapObjects
_08128698: .4byte gSprites
	thumb_func_end sub_81285AC

	thumb_func_start sub_812869C
sub_812869C: @ 812869C
	push {lr}
	adds r1, r0, 0
	adds r0, 0x21
	ldrb r0, [r0]
	cmp r0, 0x1
	bne _081286BA
	ldr r2, _081286C0 @ =gSprites
	ldrb r1, [r1, 0x1A]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r2
	ldrh r1, [r0, 0x2E]
	adds r1, 0x1
	strh r1, [r0, 0x2E]
_081286BA:
	pop {r0}
	bx r0
	.align 2, 0
_081286C0: .4byte gSprites
	thumb_func_end sub_812869C

	thumb_func_start sub_81286C4
sub_81286C4: @ 81286C4
	push {lr}
	adds r2, r0, 0
	adds r2, 0x21
	ldrb r1, [r2]
	cmp r1, 0x2
	beq _081286FA
	cmp r1, 0
	beq _081286FA
	ldrb r1, [r0, 0x1A]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	ldr r1, _081286EC @ =gSprites
	adds r1, r0, r1
	movs r3, 0x3C
	ldrsh r0, [r1, r3]
	cmp r0, 0
	bne _081286F0
	movs r0, 0
	b _081286FC
	.align 2, 0
_081286EC: .4byte gSprites
_081286F0:
	movs r0, 0x2
	strb r0, [r2]
	ldrh r0, [r1, 0x2E]
	adds r0, 0x1
	strh r0, [r1, 0x2E]
_081286FA:
	movs r0, 0x1
_081286FC:
	pop {r1}
	bx r1
	thumb_func_end sub_81286C4

	thumb_func_start FldEff_Sparkle
FldEff_Sparkle: @ 8128700
	push {r4,lr}
	ldr r4, _08128768 @ =gFieldEffectSpawnParams
	ldr r0, [r4]
	adds r0, 0x7
	str r0, [r4]
	ldr r0, [r4, 0x4]
	adds r0, 0x7
	str r0, [r4, 0x4]
	adds r1, r4, 0x4
	adds r0, r4, 0
	movs r2, 0x8
	movs r3, 0x8
	bl sub_8060470
	ldr r0, _0812876C @ =gFieldEffectObjectTemplatePointers
	adds r0, 0x8C
	ldr r0, [r0]
	movs r2, 0
	ldrsh r1, [r4, r2]
	movs r3, 0x4
	ldrsh r2, [r4, r3]
	movs r3, 0x52
	bl CreateSpriteAtEnd
	lsls r0, 24
	lsrs r2, r0, 24
	cmp r2, 0x40
	beq _08128760
	ldr r0, _08128770 @ =gSprites
	lsls r1, r2, 4
	adds r1, r2
	lsls r1, 2
	adds r1, r0
	movs r0, 0x3
	ldrb r2, [r4, 0x8]
	ands r2, r0
	lsls r2, 2
	ldrb r3, [r1, 0x5]
	movs r0, 0xD
	negs r0, r0
	ands r0, r3
	orrs r0, r2
	strb r0, [r1, 0x5]
	adds r1, 0x3E
	ldrb r0, [r1]
	movs r2, 0x2
	orrs r0, r2
	strb r0, [r1]
_08128760:
	movs r0, 0
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_08128768: .4byte gFieldEffectSpawnParams
_0812876C: .4byte gFieldEffectObjectTemplatePointers
_08128770: .4byte gSprites
	thumb_func_end FldEff_Sparkle

	thumb_func_start sub_8128774
sub_8128774: @ 8128774
	push {lr}
	adds r2, r0, 0
	movs r1, 0x2E
	ldrsh r0, [r2, r1]
	cmp r0, 0
	bne _081287A8
	adds r0, r2, 0
	adds r0, 0x3F
	ldrb r1, [r0]
	movs r0, 0x10
	ands r0, r1
	cmp r0, 0
	beq _081287A0
	adds r3, r2, 0
	adds r3, 0x3E
	ldrb r0, [r3]
	movs r1, 0x4
	orrs r0, r1
	strb r0, [r3]
	ldrh r0, [r2, 0x2E]
	adds r0, 0x1
	strh r0, [r2, 0x2E]
_081287A0:
	movs r1, 0x2E
	ldrsh r0, [r2, r1]
	cmp r0, 0
	beq _081287BE
_081287A8:
	ldrh r0, [r2, 0x30]
	adds r0, 0x1
	strh r0, [r2, 0x30]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x22
	ble _081287BE
	adds r0, r2, 0
	movs r1, 0x36
	bl FieldEffectStop
_081287BE:
	pop {r0}
	bx r0
	thumb_func_end sub_8128774

	thumb_func_start sub_81287C4
sub_81287C4: @ 81287C4
	push {r4,lr}
	adds r4, r0, 0
	adds r0, 0x3F
	ldrb r1, [r0]
	movs r0, 0x10
	ands r0, r1
	cmp r0, 0
	beq _081287E2
	ldrh r1, [r4, 0x30]
	lsls r1, 24
	lsrs r1, 24
	adds r0, r4, 0
	bl FieldEffectStop
	b _081287F8
_081287E2:
	adds r0, r4, 0
	movs r1, 0
	bl sub_806487C
	ldrh r0, [r4, 0x2E]
	lsls r0, 24
	lsrs r0, 24
	adds r1, r4, 0
	movs r2, 0
	bl SetObjectSubpriorityByZCoord
_081287F8:
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end sub_81287C4

	thumb_func_start sub_8128800
sub_8128800: @ 8128800
	push {lr}
	adds r2, r0, 0
	adds r0, 0x3F
	ldrb r1, [r0]
	movs r0, 0x10
	ands r0, r1
	cmp r0, 0
	beq _0812881E
	ldrh r1, [r2, 0x2E]
	lsls r1, 24
	lsrs r1, 24
	adds r0, r2, 0
	bl FieldEffectStop
	b _08128826
_0812881E:
	adds r0, r2, 0
	movs r1, 0
	bl sub_806487C
_08128826:
	pop {r0}
	bx r0
	thumb_func_end sub_8128800

	thumb_func_start sub_812882C
sub_812882C: @ 812882C
	push {r4-r7,lr}
	adds r6, r0, 0
	adds r0, r1, 0
	lsls r0, 24
	lsrs r0, 24
	lsls r2, 24
	lsrs r2, 24
	adds r1, r6, 0
	bl SetObjectSubpriorityByZCoord
	movs r7, 0
_08128842:
	lsls r0, r7, 3
	adds r0, r7
	lsls r0, 2
	ldr r1, _081288DC @ =gMapObjects
	adds r4, r0, r1
	ldrb r0, [r4]
	lsls r0, 31
	cmp r0, 0
	beq _081288E4
	ldrb r0, [r4, 0x5]
	bl GetFieldObjectGraphicsInfo
	ldrb r1, [r4, 0x4]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	ldr r1, _081288E0 @ =gSprites
	adds r5, r0, r1
	adds r0, r6, 0
	adds r0, 0x28
	movs r2, 0
	ldrsb r2, [r0, r2]
	ldrh r0, [r6, 0x20]
	adds r1, r0, r2
	subs r0, r2
	lsls r0, 16
	lsrs r4, r0, 16
	lsls r1, 16
	asrs r1, 16
	movs r0, 0x20
	ldrsh r2, [r5, r0]
	cmp r1, r2
	bge _081288E4
	lsls r0, r4, 16
	asrs r0, 16
	cmp r0, r2
	ble _081288E4
	adds r0, r5, 0
	adds r0, 0x29
	movs r3, 0
	ldrsb r3, [r0, r3]
	ldrh r2, [r5, 0x22]
	adds r2, r3
	ldrh r4, [r5, 0x22]
	adds r0, r6, 0
	adds r0, 0x29
	movs r1, 0
	ldrsb r1, [r0, r1]
	ldrh r0, [r6, 0x22]
	subs r0, r1
	lsls r0, 16
	asrs r0, 16
	adds r3, r0, r3
	lsls r2, 16
	asrs r2, 16
	lsls r3, 16
	asrs r3, 16
	cmp r2, r3
	blt _081288BC
	cmp r2, r0
	bge _081288E4
_081288BC:
	lsls r0, r4, 16
	asrs r0, 16
	cmp r0, r3
	ble _081288E4
	adds r2, r6, 0
	adds r2, 0x43
	adds r0, r5, 0
	adds r0, 0x43
	ldrb r1, [r0]
	ldrb r0, [r2]
	cmp r0, r1
	bhi _081288E4
	adds r0, r1, 0x2
	strb r0, [r2]
	b _081288EE
	.align 2, 0
_081288DC: .4byte gMapObjects
_081288E0: .4byte gSprites
_081288E4:
	adds r0, r7, 0x1
	lsls r0, 24
	lsrs r7, r0, 24
	cmp r7, 0xF
	bls _08128842
_081288EE:
	pop {r4-r7}
	pop {r0}
	bx r0
	thumb_func_end sub_812882C

	.align 2, 0 @ Don't pad with nop.
