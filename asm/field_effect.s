	.include "constants/gba_constants.inc"
	.include "constants/species_constants.inc"
	.include "asm/macros.inc"

	.syntax unified

	.text

	thumb_func_start sub_8087BA8
sub_8087BA8: @ 8087BA8
	push {lr}
	ldr r0, _08087BB8 @ =sub_8087BBC
	movs r1, 0
	bl CreateTask
	pop {r0}
	bx r0
	.align 2, 0
_08087BB8: .4byte sub_8087BBC
	thumb_func_end sub_8087BA8

	thumb_func_start sub_8087BBC
sub_8087BBC: @ 8087BBC
	push {lr}
	adds r1, r0, 0
	lsls r1, 24
	lsrs r1, 24
	ldr r3, _08087BE4 @ =gUnknown_0839F390
	ldr r2, _08087BE8 @ =gTasks
	lsls r0, r1, 2
	adds r0, r1
	lsls r0, 3
	adds r0, r2
	movs r2, 0x8
	ldrsh r1, [r0, r2]
	lsls r1, 2
	adds r1, r3
	ldr r1, [r1]
	bl _call_via_r1
	pop {r0}
	bx r0
	.align 2, 0
_08087BE4: .4byte gUnknown_0839F390
_08087BE8: .4byte gTasks
	thumb_func_end sub_8087BBC

	thumb_func_start sub_8087BEC
sub_8087BEC: @ 8087BEC
	push {r4,lr}
	adds r4, r0, 0
	bl ScriptContext2_Enable
	bl FreezeMapObjects
	bl CameraObjectReset2
	bl player_get_direction_lower_nybble
	lsls r0, 24
	lsrs r0, 24
	strh r0, [r4, 0x26]
	ldrh r0, [r4, 0x8]
	adds r0, 0x1
	strh r0, [r4, 0x8]
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end sub_8087BEC

	thumb_func_start sub_8087C14
sub_8087C14: @ 8087C14
	push {r4,r5,lr}
	sub sp, 0x8
	adds r4, r0, 0
	ldr r1, _08087C98 @ =gUnknown_0839F380
	mov r0, sp
	movs r2, 0x5
	bl memcpy
	ldr r0, _08087C9C @ =gPlayerAvatar
	ldrb r1, [r0, 0x5]
	lsls r0, r1, 3
	adds r0, r1
	lsls r0, 2
	ldr r1, _08087CA0 @ =gMapObjects
	adds r5, r0, r1
	ldrh r1, [r4, 0xA]
	movs r2, 0xA
	ldrsh r0, [r4, r2]
	cmp r0, 0
	beq _08087C46
	subs r0, r1, 0x1
	strh r0, [r4, 0xA]
	lsls r0, 16
	cmp r0, 0
	bne _08087C60
_08087C46:
	ldrb r0, [r5, 0x18]
	lsls r0, 28
	lsrs r0, 28
	add r0, sp
	ldrb r1, [r0]
	adds r0, r5, 0
	bl FieldObjectTurn
	movs r0, 0x8
	strh r0, [r4, 0xA]
	ldrh r0, [r4, 0xC]
	adds r0, 0x1
	strh r0, [r4, 0xC]
_08087C60:
	movs r1, 0xC
	ldrsh r0, [r4, r1]
	cmp r0, 0x7
	ble _08087C8E
	movs r2, 0x26
	ldrsh r1, [r4, r2]
	ldrb r0, [r5, 0x18]
	lsls r0, 28
	lsrs r0, 28
	cmp r1, r0
	bne _08087C8E
	ldrh r0, [r4, 0x8]
	adds r0, 0x1
	strh r0, [r4, 0x8]
	movs r0, 0x4
	strh r0, [r4, 0xA]
	movs r0, 0x8
	strh r0, [r4, 0xC]
	movs r0, 0x1
	strh r0, [r4, 0xE]
	movs r0, 0x2D
	bl PlaySE
_08087C8E:
	add sp, 0x8
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_08087C98: .4byte gUnknown_0839F380
_08087C9C: .4byte gPlayerAvatar
_08087CA0: .4byte gMapObjects
	thumb_func_end sub_8087C14

	thumb_func_start sub_8087CA4
sub_8087CA4: @ 8087CA4
	push {r4,r5,lr}
	sub sp, 0x8
	adds r4, r0, 0
	ldr r1, _08087D68 @ =gUnknown_0839F380
	mov r0, sp
	movs r2, 0x5
	bl memcpy
	ldr r2, _08087D6C @ =gPlayerAvatar
	ldrb r1, [r2, 0x5]
	lsls r0, r1, 3
	adds r0, r1
	lsls r0, 2
	ldr r1, _08087D70 @ =gMapObjects
	adds r3, r0, r1
	ldrb r1, [r2, 0x4]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	ldr r1, _08087D74 @ =gSprites
	adds r5, r0, r1
	ldrh r0, [r4, 0xA]
	subs r0, 0x1
	strh r0, [r4, 0xA]
	lsls r0, 16
	cmp r0, 0
	bgt _08087CEE
	movs r0, 0x4
	strh r0, [r4, 0xA]
	ldrb r0, [r3, 0x18]
	lsls r0, 28
	lsrs r0, 28
	add r0, sp
	ldrb r1, [r0]
	adds r0, r3, 0
	bl FieldObjectTurn
_08087CEE:
	ldrh r0, [r5, 0x22]
	ldrh r1, [r4, 0xE]
	subs r0, r1
	strh r0, [r5, 0x22]
	ldrh r1, [r4, 0xE]
	ldrh r2, [r4, 0x10]
	adds r0, r1, r2
	strh r0, [r4, 0x10]
	ldrh r0, [r4, 0xC]
	subs r0, 0x1
	strh r0, [r4, 0xC]
	lsls r0, 16
	cmp r0, 0
	bgt _08087D1A
	movs r0, 0x4
	strh r0, [r4, 0xC]
	lsls r0, r1, 16
	asrs r0, 16
	cmp r0, 0x7
	bgt _08087D1A
	lsls r0, r1, 1
	strh r0, [r4, 0xE]
_08087D1A:
	movs r1, 0x10
	ldrsh r0, [r4, r1]
	cmp r0, 0x8
	ble _08087D48
	ldrb r1, [r5, 0x5]
	movs r0, 0xD
	negs r0, r0
	ands r0, r1
	movs r1, 0x4
	orrs r0, r1
	strb r0, [r5, 0x5]
	adds r2, r5, 0
	adds r2, 0x42
	ldrb r1, [r2]
	movs r0, 0xC0
	ands r0, r1
	cmp r0, 0
	beq _08087D48
	movs r0, 0x3F
	ands r0, r1
	movs r1, 0x80
	orrs r0, r1
	strb r0, [r2]
_08087D48:
	movs r2, 0x10
	ldrsh r0, [r4, r2]
	cmp r0, 0xA7
	ble _08087D5E
	ldrh r0, [r4, 0x8]
	adds r0, 0x1
	strh r0, [r4, 0x8]
	bl sub_8053FF8
	bl fade_8080918
_08087D5E:
	add sp, 0x8
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_08087D68: .4byte gUnknown_0839F380
_08087D6C: .4byte gPlayerAvatar
_08087D70: .4byte gMapObjects
_08087D74: .4byte gSprites
	thumb_func_end sub_8087CA4

	thumb_func_start sub_8087D78
sub_8087D78: @ 8087D78
	push {lr}
	ldr r0, _08087DB8 @ =gPaletteFade
	ldrb r1, [r0, 0x7]
	movs r0, 0x80
	ands r0, r1
	cmp r0, 0
	bne _08087DB4
	bl sub_8054034
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _08087DB4
	bl sub_8053570
	bl warp_in
	ldr r0, _08087DBC @ =CB2_LoadMap
	bl SetMainCallback2
	ldr r1, _08087DC0 @ =gUnknown_0300485C
	ldr r0, _08087DC4 @ =mapldr_08085D88
	str r0, [r1]
	ldr r0, _08087DC8 @ =sub_8087BBC
	bl FindTaskIdByFunc
	lsls r0, 24
	lsrs r0, 24
	bl DestroyTask
_08087DB4:
	pop {r0}
	bx r0
	.align 2, 0
_08087DB8: .4byte gPaletteFade
_08087DBC: .4byte CB2_LoadMap
_08087DC0: .4byte gUnknown_0300485C
_08087DC4: .4byte mapldr_08085D88
_08087DC8: .4byte sub_8087BBC
	thumb_func_end sub_8087D78

	thumb_func_start mapldr_08085D88
mapldr_08085D88: @ 8087DCC
	push {lr}
	bl sub_8053E90
	bl pal_fill_for_map_transition
	bl ScriptContext2_Enable
	bl FreezeMapObjects
	ldr r1, _08087E0C @ =gUnknown_0300485C
	movs r0, 0
	str r0, [r1]
	ldr r2, _08087E10 @ =gMapObjects
	ldr r0, _08087E14 @ =gPlayerAvatar
	ldrb r1, [r0, 0x5]
	lsls r0, r1, 3
	adds r0, r1
	lsls r0, 2
	adds r0, r2
	ldrb r1, [r0, 0x1]
	movs r2, 0x20
	orrs r1, r2
	strb r1, [r0, 0x1]
	bl CameraObjectReset2
	ldr r0, _08087E18 @ =sub_8087E1C
	movs r1, 0
	bl CreateTask
	pop {r0}
	bx r0
	.align 2, 0
_08087E0C: .4byte gUnknown_0300485C
_08087E10: .4byte gMapObjects
_08087E14: .4byte gPlayerAvatar
_08087E18: .4byte sub_8087E1C
	thumb_func_end mapldr_08085D88

	thumb_func_start sub_8087E1C
sub_8087E1C: @ 8087E1C
	push {lr}
	adds r1, r0, 0
	lsls r1, 24
	lsrs r1, 24
	ldr r3, _08087E44 @ =gUnknown_0839F3A0
	ldr r2, _08087E48 @ =gTasks
	lsls r0, r1, 2
	adds r0, r1
	lsls r0, 3
	adds r0, r2
	movs r2, 0x8
	ldrsh r1, [r0, r2]
	lsls r1, 2
	adds r1, r3
	ldr r1, [r1]
	bl _call_via_r1
	pop {r0}
	bx r0
	.align 2, 0
_08087E44: .4byte gUnknown_0839F3A0
_08087E48: .4byte gTasks
	thumb_func_end sub_8087E1C

	thumb_func_start sub_8087E4C
sub_8087E4C: @ 8087E4C
	push {r4-r6,lr}
	adds r6, r0, 0
	bl sub_807D770
	lsls r0, 24
	cmp r0, 0
	beq _08087EC2
	ldr r5, _08087EC8 @ =gPlayerAvatar
	ldrb r0, [r5, 0x4]
	lsls r2, r0, 4
	adds r2, r0
	lsls r2, 2
	ldr r0, _08087ECC @ =gSprites
	adds r2, r0
	adds r0, r2, 0
	adds r0, 0x29
	movs r4, 0
	ldrsb r4, [r0, r4]
	lsls r0, r4, 17
	negs r0, r0
	ldrh r1, [r2, 0x22]
	ldr r3, _08087ED0 @ =gSpriteCoordOffsetY
	adds r1, r4
	ldrh r3, [r3]
	adds r1, r3
	asrs r0, 16
	adds r0, r1
	negs r0, r0
	strh r0, [r2, 0x26]
	ldr r3, _08087ED4 @ =gMapObjects
	ldrb r0, [r5, 0x5]
	lsls r1, r0, 3
	adds r1, r0
	lsls r1, 2
	adds r1, r3
	ldrb r3, [r1, 0x1]
	movs r0, 0x21
	negs r0, r0
	ands r0, r3
	strb r0, [r1, 0x1]
	ldrh r0, [r6, 0x8]
	adds r0, 0x1
	strh r0, [r6, 0x8]
	movs r0, 0x8
	strh r0, [r6, 0xA]
	movs r0, 0x1
	strh r0, [r6, 0xC]
	adds r2, 0x42
	ldrb r0, [r2]
	lsrs r0, 6
	strh r0, [r6, 0x24]
	bl player_get_direction_lower_nybble
	lsls r0, 24
	lsrs r0, 24
	strh r0, [r6, 0x26]
	movs r0, 0x2D
	bl PlaySE
_08087EC2:
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_08087EC8: .4byte gPlayerAvatar
_08087ECC: .4byte gSprites
_08087ED0: .4byte gSpriteCoordOffsetY
_08087ED4: .4byte gMapObjects
	thumb_func_end sub_8087E4C

	thumb_func_start sub_8087ED8
sub_8087ED8: @ 8087ED8
	push {r4-r7,lr}
	sub sp, 0x8
	adds r4, r0, 0
	ldr r1, _08087F40 @ =gUnknown_0839F380
	mov r0, sp
	movs r2, 0x5
	bl memcpy
	ldr r2, _08087F44 @ =gPlayerAvatar
	ldrb r1, [r2, 0x5]
	lsls r0, r1, 3
	adds r0, r1
	lsls r0, 2
	ldr r1, _08087F48 @ =gMapObjects
	adds r6, r0, r1
	ldrb r1, [r2, 0x4]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	ldr r1, _08087F4C @ =gSprites
	adds r5, r0, r1
	ldrh r0, [r4, 0xA]
	ldrh r1, [r5, 0x26]
	adds r0, r1
	strh r0, [r5, 0x26]
	lsls r0, 16
	asrs r0, 16
	movs r1, 0x8
	negs r1, r1
	cmp r0, r1
	blt _08087F50
	ldrh r1, [r4, 0x22]
	movs r2, 0x22
	ldrsh r0, [r4, r2]
	cmp r0, 0
	bne _08087F76
	adds r0, r1, 0x1
	strh r0, [r4, 0x22]
	ldrb r0, [r6]
	movs r1, 0x4
	orrs r0, r1
	strb r0, [r6]
	ldrh r1, [r4, 0x24]
	adds r3, r5, 0
	adds r3, 0x42
	lsls r1, 6
	ldrb r2, [r3]
	movs r0, 0x3F
	ands r0, r2
	orrs r0, r1
	strb r0, [r3]
	b _08087F76
	.align 2, 0
_08087F40: .4byte gUnknown_0839F380
_08087F44: .4byte gPlayerAvatar
_08087F48: .4byte gMapObjects
_08087F4C: .4byte gSprites
_08087F50:
	ldrb r1, [r5, 0x5]
	movs r0, 0xD
	negs r0, r0
	ands r0, r1
	movs r1, 0x4
	orrs r0, r1
	strb r0, [r5, 0x5]
	adds r2, r5, 0
	adds r2, 0x42
	ldrb r1, [r2]
	movs r0, 0xC0
	ands r0, r1
	cmp r0, 0
	beq _08087F76
	movs r0, 0x3F
	ands r0, r1
	movs r1, 0x80
	orrs r0, r1
	strb r0, [r2]
_08087F76:
	ldrh r2, [r5, 0x26]
	movs r3, 0x26
	ldrsh r1, [r5, r3]
	movs r0, 0x30
	negs r0, r0
	cmp r1, r0
	blt _08087F9A
	ldrh r1, [r4, 0xA]
	movs r3, 0xA
	ldrsh r0, [r4, r3]
	cmp r0, 0x1
	ble _08087F9A
	movs r0, 0x1
	ands r0, r2
	cmp r0, 0
	bne _08087F9A
	subs r0, r1, 0x1
	strh r0, [r4, 0xA]
_08087F9A:
	ldrh r0, [r4, 0xC]
	subs r0, 0x1
	movs r7, 0
	strh r0, [r4, 0xC]
	lsls r0, 16
	cmp r0, 0
	bne _08087FBC
	movs r0, 0x4
	strh r0, [r4, 0xC]
	ldrb r0, [r6, 0x18]
	lsls r0, 28
	lsrs r0, 28
	add r0, sp
	ldrb r1, [r0]
	adds r0, r6, 0
	bl FieldObjectTurn
_08087FBC:
	movs r1, 0x26
	ldrsh r0, [r5, r1]
	cmp r0, 0
	blt _08087FD2
	strh r7, [r5, 0x26]
	ldrh r0, [r4, 0x8]
	adds r0, 0x1
	strh r0, [r4, 0x8]
	movs r0, 0x1
	strh r0, [r4, 0xA]
	strh r7, [r4, 0xC]
_08087FD2:
	add sp, 0x8
	pop {r4-r7}
	pop {r0}
	bx r0
	thumb_func_end sub_8087ED8

	thumb_func_start sub_8087FDC
sub_8087FDC: @ 8087FDC
	push {r4,r5,lr}
	sub sp, 0x8
	adds r4, r0, 0
	ldr r1, _08088058 @ =gUnknown_0839F380
	mov r0, sp
	movs r2, 0x5
	bl memcpy
	ldr r0, _0808805C @ =gPlayerAvatar
	ldrb r1, [r0, 0x5]
	lsls r0, r1, 3
	adds r0, r1
	lsls r0, 2
	ldr r1, _08088060 @ =gMapObjects
	adds r5, r0, r1
	ldrh r0, [r4, 0xA]
	subs r0, 0x1
	strh r0, [r4, 0xA]
	lsls r0, 16
	cmp r0, 0
	bne _08088050
	ldrb r0, [r5, 0x18]
	lsls r0, 28
	lsrs r0, 28
	add r0, sp
	ldrb r1, [r0]
	adds r0, r5, 0
	bl FieldObjectTurn
	movs r0, 0x8
	strh r0, [r4, 0xA]
	ldrh r0, [r4, 0xC]
	adds r0, 0x1
	strh r0, [r4, 0xC]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x4
	ble _08088050
	movs r0, 0x24
	ldrsh r1, [r4, r0]
	ldrb r0, [r5, 0x18]
	lsls r0, 28
	lsrs r0, 28
	cmp r1, r0
	bne _08088050
	bl ScriptContext2_Disable
	bl CameraObjectReset1
	bl UnfreezeMapObjects
	ldr r0, _08088064 @ =sub_8087E1C
	bl FindTaskIdByFunc
	lsls r0, 24
	lsrs r0, 24
	bl DestroyTask
_08088050:
	add sp, 0x8
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_08088058: .4byte gUnknown_0839F380
_0808805C: .4byte gPlayerAvatar
_08088060: .4byte gMapObjects
_08088064: .4byte sub_8087E1C
	thumb_func_end sub_8087FDC

	thumb_func_start FldEff_FieldMoveShowMon
FldEff_FieldMoveShowMon: @ 8088068
	push {r4,lr}
	bl sav1_map_get_light_level
	lsls r0, 24
	lsrs r0, 24
	bl is_light_level_1_2_3_5_or_6
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _08088088
	ldr r0, _08088084 @ =sub_8088120
	b _0808808A
	.align 2, 0
_08088084: .4byte sub_8088120
_08088088:
	ldr r0, _080880B8 @ =sub_808847C
_0808808A:
	movs r1, 0xFF
	bl CreateTask
	lsls r0, 24
	lsrs r4, r0, 24
	ldr r2, _080880BC @ =gUnknown_0202FF84
	ldr r0, [r2]
	ldr r1, [r2, 0x4]
	ldr r2, [r2, 0x8]
	bl sub_8088830
	ldr r2, _080880C0 @ =gTasks
	lsls r1, r4, 2
	adds r1, r4
	lsls r1, 3
	adds r1, r2
	lsls r0, 24
	lsrs r0, 24
	strh r0, [r1, 0x26]
	movs r0, 0
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_080880B8: .4byte sub_808847C
_080880BC: .4byte gUnknown_0202FF84
_080880C0: .4byte gTasks
	thumb_func_end FldEff_FieldMoveShowMon

	thumb_func_start FldEff_FieldMoveShowMonInit
FldEff_FieldMoveShowMonInit: @ 80880C4
	push {r4-r6,lr}
	ldr r5, _08088118 @ =gUnknown_0202FF84
	ldr r0, [r5]
	movs r6, 0x80
	lsls r6, 24
	ands r6, r0
	lsls r0, 24
	lsrs r0, 24
	movs r1, 0x64
	adds r4, r0, 0
	muls r4, r1
	ldr r0, _0808811C @ =gPlayerParty
	adds r4, r0
	adds r0, r4, 0
	movs r1, 0xB
	bl GetMonData
	str r0, [r5]
	adds r0, r4, 0
	movs r1, 0x1
	bl GetMonData
	str r0, [r5, 0x4]
	adds r0, r4, 0
	movs r1, 0
	bl GetMonData
	str r0, [r5, 0x8]
	ldr r0, [r5]
	orrs r0, r6
	str r0, [r5]
	movs r0, 0x6
	bl FieldEffectStart
	movs r0, 0x3B
	bl FieldEffectActiveListRemove
	movs r0, 0
	pop {r4-r6}
	pop {r1}
	bx r1
	.align 2, 0
_08088118: .4byte gUnknown_0202FF84
_0808811C: .4byte gPlayerParty
	thumb_func_end FldEff_FieldMoveShowMonInit

	thumb_func_start sub_8088120
sub_8088120: @ 8088120
	push {lr}
	adds r1, r0, 0
	lsls r1, 24
	lsrs r1, 24
	ldr r3, _08088148 @ =gUnknown_0839F3AC
	ldr r2, _0808814C @ =gTasks
	lsls r0, r1, 2
	adds r0, r1
	lsls r0, 3
	adds r0, r2
	movs r2, 0x8
	ldrsh r1, [r0, r2]
	lsls r1, 2
	adds r1, r3
	ldr r1, [r1]
	bl _call_via_r1
	pop {r0}
	bx r0
	.align 2, 0
_08088148: .4byte gUnknown_0839F3AC
_0808814C: .4byte gTasks
	thumb_func_end sub_8088120

	thumb_func_start sub_8088150
sub_8088150: @ 8088150
	push {r4-r6,lr}
	adds r4, r0, 0
	ldr r6, _080881A0 @ =REG_WININ
	ldrh r0, [r6]
	strh r0, [r4, 0x1E]
	ldr r5, _080881A4 @ =REG_WINOUT
	ldrh r0, [r5]
	strh r0, [r4, 0x20]
	adds r0, r4, 0
	adds r0, 0x22
	ldr r1, _080881A8 @ =gMain
	ldr r1, [r1, 0xC]
	bl StoreWordInTwoHalfwords
	ldr r1, _080881AC @ =0x0000f0f1
	strh r1, [r4, 0xA]
	ldr r0, _080881B0 @ =0x00005051
	strh r0, [r4, 0xC]
	movs r0, 0x3F
	strh r0, [r4, 0xE]
	movs r0, 0x3E
	strh r0, [r4, 0x10]
	ldr r0, _080881B4 @ =REG_WIN0H
	strh r1, [r0]
	ldr r1, _080881B8 @ =REG_WIN0V
	ldrh r0, [r4, 0xC]
	strh r0, [r1]
	ldrh r0, [r4, 0xE]
	strh r0, [r6]
	ldrh r0, [r4, 0x10]
	strh r0, [r5]
	ldr r0, _080881BC @ =sub_80883DC
	bl SetVBlankCallback
	ldrh r0, [r4, 0x8]
	adds r0, 0x1
	strh r0, [r4, 0x8]
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_080881A0: .4byte REG_WININ
_080881A4: .4byte REG_WINOUT
_080881A8: .4byte gMain
_080881AC: .4byte 0x0000f0f1
_080881B0: .4byte 0x00005051
_080881B4: .4byte REG_WIN0H
_080881B8: .4byte REG_WIN0V
_080881BC: .4byte sub_80883DC
	thumb_func_end sub_8088150

	thumb_func_start sub_80881C0
sub_80881C0: @ 80881C0
	push {r4-r6,lr}
	sub sp, 0x4
	adds r6, r0, 0
	ldr r0, _08088218 @ =REG_BG0CNT
	ldrh r1, [r0]
	lsrs r1, 2
	lsls r1, 30
	lsrs r1, 16
	ldrh r4, [r0]
	lsrs r4, 8
	lsls r4, 27
	lsrs r4, 16
	ldr r0, _0808821C @ =gFieldMoveStreaksTiles
	movs r5, 0xC0
	lsls r5, 19
	adds r1, r5
	movs r2, 0x80
	lsls r2, 1
	bl CpuSet
	movs r0, 0
	str r0, [sp]
	adds r5, r4, r5
	ldr r2, _08088220 @ =0x05000200
	mov r0, sp
	adds r1, r5, 0
	bl CpuSet
	ldr r0, _08088224 @ =gFieldMoveStreaksPalette
	movs r1, 0xF0
	movs r2, 0x20
	bl LoadPalette
	adds r0, r4, 0
	bl sub_808843C
	ldrh r0, [r6, 0x8]
	adds r0, 0x1
	strh r0, [r6, 0x8]
	add sp, 0x4
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_08088218: .4byte REG_BG0CNT
_0808821C: .4byte gFieldMoveStreaksTiles
_08088220: .4byte 0x05000200
_08088224: .4byte gFieldMoveStreaksPalette
	thumb_func_end sub_80881C0

	thumb_func_start sub_8088228
sub_8088228: @ 8088228
	push {r4-r7,lr}
	adds r3, r0, 0
	ldrh r0, [r3, 0x12]
	subs r0, 0x10
	strh r0, [r3, 0x12]
	ldrh r6, [r3, 0xA]
	ldrh r2, [r3, 0xC]
	movs r7, 0xFF
	lsrs r1, r6, 8
	subs r1, 0x10
	lsls r1, 16
	lsrs r0, r2, 8
	subs r0, 0x2
	lsls r0, 16
	lsrs r4, r0, 16
	adds r0, r7, 0
	ands r0, r2
	adds r5, r0, 0x2
	lsrs r2, r1, 16
	cmp r1, 0
	bge _08088254
	movs r2, 0
_08088254:
	lsls r0, r4, 16
	asrs r0, 16
	cmp r0, 0x27
	bgt _0808825E
	movs r4, 0x28
_0808825E:
	cmp r5, 0x78
	ble _08088264
	movs r5, 0x78
_08088264:
	lsls r2, 16
	asrs r2, 16
	lsls r1, r2, 8
	adds r0, r7, 0
	ands r0, r6
	orrs r1, r0
	strh r1, [r3, 0xA]
	lsls r0, r4, 16
	asrs r4, r0, 16
	lsls r0, r4, 8
	adds r1, r5, 0
	orrs r0, r1
	strh r0, [r3, 0xC]
	cmp r2, 0
	bne _080882A4
	cmp r4, 0x28
	bne _080882A4
	cmp r1, 0x78
	bne _080882A4
	ldr r2, _080882AC @ =gSprites
	movs r0, 0x26
	ldrsh r1, [r3, r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r2, 0x1C
	adds r0, r2
	ldr r1, _080882B0 @ =sub_8088890
	str r1, [r0]
	ldrh r0, [r3, 0x8]
	adds r0, 0x1
	strh r0, [r3, 0x8]
_080882A4:
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080882AC: .4byte gSprites
_080882B0: .4byte sub_8088890
	thumb_func_end sub_8088228

	thumb_func_start sub_80882B4
sub_80882B4: @ 80882B4
	push {lr}
	adds r3, r0, 0
	ldrh r0, [r3, 0x12]
	subs r0, 0x10
	strh r0, [r3, 0x12]
	ldr r2, _080882E0 @ =gSprites
	movs r0, 0x26
	ldrsh r1, [r3, r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r2
	movs r1, 0x3C
	ldrsh r0, [r0, r1]
	cmp r0, 0
	beq _080882DA
	ldrh r0, [r3, 0x8]
	adds r0, 0x1
	strh r0, [r3, 0x8]
_080882DA:
	pop {r0}
	bx r0
	.align 2, 0
_080882E0: .4byte gSprites
	thumb_func_end sub_80882B4

	thumb_func_start sub_80882E4
sub_80882E4: @ 80882E4
	push {r4,lr}
	adds r3, r0, 0
	ldrh r0, [r3, 0x12]
	subs r0, 0x10
	strh r0, [r3, 0x12]
	ldrh r2, [r3, 0xC]
	lsls r1, r2, 16
	movs r0, 0xFF
	asrs r1, 24
	adds r1, 0x6
	lsls r1, 16
	ands r0, r2
	subs r0, 0x6
	lsls r0, 16
	lsrs r2, r0, 16
	lsrs r4, r1, 16
	asrs r1, 16
	cmp r1, 0x50
	ble _0808830C
	movs r4, 0x50
_0808830C:
	lsls r0, r2, 16
	asrs r0, 16
	cmp r0, 0x50
	bgt _08088316
	movs r2, 0x51
_08088316:
	lsls r0, r4, 16
	asrs r0, 16
	lsls r1, r0, 8
	lsls r2, 16
	asrs r2, 16
	orrs r1, r2
	strh r1, [r3, 0xC]
	cmp r0, 0x50
	bne _08088332
	cmp r2, 0x51
	bne _08088332
	ldrh r0, [r3, 0x8]
	adds r0, 0x1
	strh r0, [r3, 0x8]
_08088332:
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end sub_80882E4

	thumb_func_start sub_8088338
sub_8088338: @ 8088338
	push {r4,lr}
	sub sp, 0x4
	adds r4, r0, 0
	ldr r0, _08088378 @ =REG_BG0CNT
	ldrh r1, [r0]
	lsrs r1, 8
	lsls r1, 27
	lsrs r1, 16
	movs r0, 0
	str r0, [sp]
	movs r0, 0xC0
	lsls r0, 19
	adds r1, r0
	ldr r2, _0808837C @ =0x05000200
	mov r0, sp
	bl CpuSet
	movs r0, 0xF1
	strh r0, [r4, 0xA]
	movs r0, 0xA1
	strh r0, [r4, 0xC]
	ldrh r0, [r4, 0x1E]
	strh r0, [r4, 0xE]
	ldrh r0, [r4, 0x20]
	strh r0, [r4, 0x10]
	ldrh r0, [r4, 0x8]
	adds r0, 0x1
	strh r0, [r4, 0x8]
	add sp, 0x4
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08088378: .4byte REG_BG0CNT
_0808837C: .4byte 0x05000200
	thumb_func_end sub_8088338

	thumb_func_start sub_8088380
sub_8088380: @ 8088380
	push {r4,r5,lr}
	sub sp, 0x4
	adds r5, r0, 0
	adds r0, 0x22
	mov r1, sp
	bl LoadWordFromTwoHalfwords
	ldr r0, [sp]
	bl SetVBlankCallback
	ldr r4, _080883D0 @ =gWindowConfig_81E6CE4
	adds r0, r4, 0
	bl SetUpWindowConfig
	adds r0, r4, 0
	bl InitMenuWindow
	movs r0, 0x26
	ldrsh r1, [r5, r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	ldr r1, _080883D4 @ =gSprites
	adds r0, r1
	bl FreeResourcesAndDestroySprite
	movs r0, 0x6
	bl FieldEffectActiveListRemove
	ldr r0, _080883D8 @ =sub_8088120
	bl FindTaskIdByFunc
	lsls r0, 24
	lsrs r0, 24
	bl DestroyTask
	add sp, 0x4
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080883D0: .4byte gWindowConfig_81E6CE4
_080883D4: .4byte gSprites
_080883D8: .4byte sub_8088120
	thumb_func_end sub_8088380

	thumb_func_start sub_80883DC
sub_80883DC: @ 80883DC
	push {r4,lr}
	sub sp, 0x4
	ldr r0, _08088430 @ =sub_8088120
	bl FindTaskIdByFunc
	lsls r0, 24
	lsrs r0, 24
	lsls r4, r0, 2
	adds r4, r0
	lsls r4, 3
	ldr r0, _08088434 @ =gTasks
	adds r4, r0
	adds r0, r4, 0
	adds r0, 0x22
	mov r1, sp
	bl LoadWordFromTwoHalfwords
	ldr r0, [sp]
	bl _call_via_r0
	ldr r1, _08088438 @ =REG_WIN0H
	ldrh r0, [r4, 0xA]
	strh r0, [r1]
	adds r1, 0x4
	ldrh r0, [r4, 0xC]
	strh r0, [r1]
	adds r1, 0x4
	ldrh r0, [r4, 0xE]
	strh r0, [r1]
	adds r1, 0x2
	ldrh r0, [r4, 0x10]
	strh r0, [r1]
	subs r1, 0x3A
	ldrh r0, [r4, 0x12]
	strh r0, [r1]
	adds r1, 0x2
	ldrh r0, [r4, 0x14]
	strh r0, [r1]
	add sp, 0x4
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08088430: .4byte sub_8088120
_08088434: .4byte gTasks
_08088438: .4byte REG_WIN0H
	thumb_func_end sub_80883DC

	thumb_func_start sub_808843C
sub_808843C: @ 808843C
	push {r4,r5,lr}
	lsls r0, 16
	lsrs r0, 16
	ldr r1, _08088470 @ =0x06000140
	adds r2, r0, r1
	movs r1, 0
	ldr r5, _08088474 @ =gFieldMoveStreaksTilemap
	movs r0, 0xF0
	lsls r0, 8
	adds r4, r0, 0
	ldr r3, _08088478 @ =0x0000013f
_08088452:
	lsls r0, r1, 1
	adds r0, r5
	ldrh r0, [r0]
	orrs r0, r4
	strh r0, [r2]
	adds r0, r1, 0x1
	lsls r0, 16
	lsrs r1, r0, 16
	adds r2, 0x2
	cmp r1, r3
	bls _08088452
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_08088470: .4byte 0x06000140
_08088474: .4byte gFieldMoveStreaksTilemap
_08088478: .4byte 0x0000013f
	thumb_func_end sub_808843C

	thumb_func_start sub_808847C
sub_808847C: @ 808847C
	push {lr}
	adds r1, r0, 0
	lsls r1, 24
	lsrs r1, 24
	ldr r3, _080884A4 @ =gUnknown_0839F3C8
	ldr r2, _080884A8 @ =gTasks
	lsls r0, r1, 2
	adds r0, r1
	lsls r0, 3
	adds r0, r2
	movs r2, 0x8
	ldrsh r1, [r0, r2]
	lsls r1, 2
	adds r1, r3
	ldr r1, [r1]
	bl _call_via_r1
	pop {r0}
	bx r0
	.align 2, 0
_080884A4: .4byte gUnknown_0839F3C8
_080884A8: .4byte gTasks
	thumb_func_end sub_808847C

	thumb_func_start sub_80884AC
sub_80884AC: @ 80884AC
	push {r4,lr}
	adds r4, r0, 0
	ldr r1, _080884DC @ =REG_BG0HOFS
	ldrh r0, [r4, 0xA]
	strh r0, [r1]
	adds r1, 0x2
	ldrh r0, [r4, 0xC]
	strh r0, [r1]
	adds r0, r4, 0
	adds r0, 0x22
	ldr r1, _080884E0 @ =gMain
	ldr r1, [r1, 0xC]
	bl StoreWordInTwoHalfwords
	ldr r0, _080884E4 @ =sub_80886B0
	bl SetVBlankCallback
	ldrh r0, [r4, 0x8]
	adds r0, 0x1
	strh r0, [r4, 0x8]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080884DC: .4byte REG_BG0HOFS
_080884E0: .4byte gMain
_080884E4: .4byte sub_80886B0
	thumb_func_end sub_80884AC

	thumb_func_start sub_80884E8
sub_80884E8: @ 80884E8
	push {r4-r6,lr}
	mov r6, r8
	push {r6}
	sub sp, 0x4
	adds r6, r0, 0
	ldr r0, _08088544 @ =REG_BG0CNT
	ldrh r1, [r0]
	lsrs r1, 2
	lsls r1, 30
	lsrs r1, 16
	ldrh r4, [r0]
	lsrs r4, 8
	lsls r4, 27
	lsrs r4, 16
	movs r0, 0
	mov r8, r0
	strh r4, [r6, 0x20]
	ldr r0, _08088548 @ =gDarknessFieldMoveStreaksTiles
	movs r5, 0xC0
	lsls r5, 19
	adds r1, r5
	movs r2, 0x40
	bl CpuSet
	mov r0, r8
	str r0, [sp]
	adds r4, r5
	ldr r2, _0808854C @ =0x05000200
	mov r0, sp
	adds r1, r4, 0
	bl CpuSet
	ldr r0, _08088550 @ =gDarknessFieldMoveStreaksPalette
	movs r1, 0xF0
	movs r2, 0x20
	bl LoadPalette
	ldrh r0, [r6, 0x8]
	adds r0, 0x1
	strh r0, [r6, 0x8]
	add sp, 0x4
	pop {r3}
	mov r8, r3
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_08088544: .4byte REG_BG0CNT
_08088548: .4byte gDarknessFieldMoveStreaksTiles
_0808854C: .4byte 0x05000200
_08088550: .4byte gDarknessFieldMoveStreaksPalette
	thumb_func_end sub_80884E8

	thumb_func_start sub_8088554
sub_8088554: @ 8088554
	push {r4,lr}
	adds r4, r0, 0
	bl sub_8088708
	lsls r0, 24
	cmp r0, 0
	beq _0808858A
	ldr r1, _08088598 @ =REG_WIN1H
	movs r0, 0xF0
	strh r0, [r1]
	adds r1, 0x4
	ldr r2, _0808859C @ =0x00002878
	adds r0, r2, 0
	strh r0, [r1]
	ldr r2, _080885A0 @ =gSprites
	movs r0, 0x26
	ldrsh r1, [r4, r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r2, 0x1C
	adds r0, r2
	ldr r1, _080885A4 @ =sub_8088890
	str r1, [r0]
	ldrh r0, [r4, 0x8]
	adds r0, 0x1
	strh r0, [r4, 0x8]
_0808858A:
	adds r0, r4, 0
	bl sub_80886F8
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08088598: .4byte REG_WIN1H
_0808859C: .4byte 0x00002878
_080885A0: .4byte gSprites
_080885A4: .4byte sub_8088890
	thumb_func_end sub_8088554

	thumb_func_start sub_80885A8
sub_80885A8: @ 80885A8
	push {r4,lr}
	adds r4, r0, 0
	bl sub_80886F8
	ldr r2, _080885D4 @ =gSprites
	movs r0, 0x26
	ldrsh r1, [r4, r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r2
	movs r1, 0x3C
	ldrsh r0, [r0, r1]
	cmp r0, 0
	beq _080885CC
	ldrh r0, [r4, 0x8]
	adds r0, 0x1
	strh r0, [r4, 0x8]
_080885CC:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080885D4: .4byte gSprites
	thumb_func_end sub_80885A8

	thumb_func_start sub_80885D8
sub_80885D8: @ 80885D8
	push {r4,lr}
	adds r4, r0, 0
	bl sub_80886F8
	ldrh r1, [r4, 0xA]
	movs r0, 0x7
	ands r0, r1
	movs r1, 0
	strh r0, [r4, 0xE]
	strh r1, [r4, 0x10]
	ldr r0, _08088604 @ =REG_WIN1H
	ldr r2, _08088608 @ =0x0000ffff
	adds r1, r2, 0
	strh r1, [r0]
	adds r0, 0x4
	strh r1, [r0]
	ldrh r0, [r4, 0x8]
	adds r0, 0x1
	strh r0, [r4, 0x8]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08088604: .4byte REG_WIN1H
_08088608: .4byte 0x0000ffff
	thumb_func_end sub_80885D8

	thumb_func_start sub_808860C
sub_808860C: @ 808860C
	push {r4,lr}
	adds r4, r0, 0
	bl sub_80886F8
	adds r0, r4, 0
	bl sub_80887C0
	lsls r0, 24
	cmp r0, 0
	beq _08088626
	ldrh r0, [r4, 0x8]
	adds r0, 0x1
	strh r0, [r4, 0x8]
_08088626:
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end sub_808860C

	thumb_func_start sub_808862C
sub_808862C: @ 808862C
	push {r4,r5,lr}
	sub sp, 0x8
	adds r5, r0, 0
	ldr r0, _0808869C @ =REG_BG0CNT
	ldrh r1, [r0]
	lsrs r1, 8
	lsls r1, 27
	lsrs r1, 16
	movs r0, 0
	str r0, [sp]
	movs r0, 0xC0
	lsls r0, 19
	adds r1, r0
	ldr r2, _080886A0 @ =0x05000200
	mov r0, sp
	bl CpuSet
	adds r0, r5, 0
	adds r0, 0x22
	add r1, sp, 0x4
	bl LoadWordFromTwoHalfwords
	ldr r0, [sp, 0x4]
	bl SetVBlankCallback
	ldr r4, _080886A4 @ =gWindowConfig_81E6CE4
	adds r0, r4, 0
	bl SetUpWindowConfig
	adds r0, r4, 0
	bl InitMenuWindow
	movs r0, 0x26
	ldrsh r1, [r5, r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	ldr r1, _080886A8 @ =gSprites
	adds r0, r1
	bl FreeResourcesAndDestroySprite
	movs r0, 0x6
	bl FieldEffectActiveListRemove
	ldr r0, _080886AC @ =sub_808847C
	bl FindTaskIdByFunc
	lsls r0, 24
	lsrs r0, 24
	bl DestroyTask
	add sp, 0x8
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_0808869C: .4byte REG_BG0CNT
_080886A0: .4byte 0x05000200
_080886A4: .4byte gWindowConfig_81E6CE4
_080886A8: .4byte gSprites
_080886AC: .4byte sub_808847C
	thumb_func_end sub_808862C

	thumb_func_start sub_80886B0
sub_80886B0: @ 80886B0
	push {r4,lr}
	sub sp, 0x4
	ldr r0, _080886EC @ =sub_808847C
	bl FindTaskIdByFunc
	lsls r0, 24
	lsrs r0, 24
	lsls r4, r0, 2
	adds r4, r0
	lsls r4, 3
	ldr r0, _080886F0 @ =gTasks
	adds r4, r0
	adds r0, r4, 0
	adds r0, 0x22
	mov r1, sp
	bl LoadWordFromTwoHalfwords
	ldr r0, [sp]
	bl _call_via_r0
	ldr r1, _080886F4 @ =REG_BG0HOFS
	ldrh r0, [r4, 0xA]
	strh r0, [r1]
	adds r1, 0x2
	ldrh r0, [r4, 0xC]
	strh r0, [r1]
	add sp, 0x4
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080886EC: .4byte sub_808847C
_080886F0: .4byte gTasks
_080886F4: .4byte REG_BG0HOFS
	thumb_func_end sub_80886B0

	thumb_func_start sub_80886F8
sub_80886F8: @ 80886F8
	ldrh r1, [r0, 0xA]
	subs r1, 0x10
	strh r1, [r0, 0xA]
	ldrh r1, [r0, 0xE]
	adds r1, 0x10
	strh r1, [r0, 0xE]
	bx lr
	thumb_func_end sub_80886F8

	thumb_func_start sub_8088708
sub_8088708: @ 8088708
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	sub sp, 0x4
	adds r5, r0, 0
	ldrh r2, [r5, 0x10]
	movs r1, 0x10
	ldrsh r0, [r5, r1]
	cmp r0, 0x1F
	ble _08088724
	movs r0, 0x1
	b _080887A8
_08088724:
	ldrh r0, [r5, 0xE]
	lsls r0, 16
	asrs r3, r0, 19
	movs r1, 0x1F
	ands r3, r1
	movs r4, 0x10
	ldrsh r0, [r5, r4]
	cmp r3, r0
	blt _080887A6
	movs r0, 0x20
	subs r3, r0, r3
	ands r3, r1
	subs r0, r2
	mov r12, r0
	mov r7, r12
	ands r7, r1
	mov r12, r7
	ldrh r0, [r5, 0x20]
	ldr r1, _080887B8 @ =0x06000140
	adds r1, r0
	mov r8, r1
	movs r4, 0
	ldr r7, _080887BC @ =gDarknessFieldMoveStreaksTilemap
	mov r10, r7
	movs r0, 0xF0
	lsls r0, 8
	mov r9, r0
	adds r1, r3, 0x1
	movs r0, 0x1F
	ands r1, r0
	str r1, [sp]
	mov r6, r12
	adds r6, 0x1
	ands r6, r0
_08088768:
	lsls r1, r4, 5
	adds r2, r1, r3
	lsls r2, 1
	add r2, r8
	mov r7, r12
	adds r0, r7, r1
	lsls r0, 1
	add r0, r10
	ldrh r0, [r0]
	mov r7, r9
	orrs r0, r7
	strh r0, [r2]
	ldr r0, [sp]
	adds r2, r1, r0
	lsls r2, 1
	add r2, r8
	adds r1, r6, r1
	lsls r1, 1
	add r1, r10
	ldrh r0, [r1]
	mov r1, r9
	orrs r0, r1
	strh r0, [r2]
	adds r0, r4, 0x1
	lsls r0, 16
	lsrs r4, r0, 16
	cmp r4, 0x9
	bls _08088768
	ldrh r0, [r5, 0x10]
	adds r0, 0x2
	strh r0, [r5, 0x10]
_080887A6:
	movs r0, 0
_080887A8:
	add sp, 0x4
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r1}
	bx r1
	.align 2, 0
_080887B8: .4byte 0x06000140
_080887BC: .4byte gDarknessFieldMoveStreaksTilemap
	thumb_func_end sub_8088708

	thumb_func_start sub_80887C0
sub_80887C0: @ 80887C0
	push {r4-r7,lr}
	adds r5, r0, 0
	movs r1, 0x10
	ldrsh r0, [r5, r1]
	cmp r0, 0x1F
	ble _080887D0
	movs r0, 0x1
	b _08088824
_080887D0:
	ldrh r0, [r5, 0xE]
	lsls r0, 16
	asrs r0, 19
	lsls r0, 16
	lsrs r2, r0, 16
	movs r1, 0x10
	ldrsh r0, [r5, r1]
	cmp r2, r0
	blt _08088822
	ldrh r0, [r5, 0xA]
	lsls r0, 16
	asrs r2, r0, 19
	movs r0, 0x1F
	ands r2, r0
	ldrh r0, [r5, 0x20]
	ldr r1, _0808882C @ =0x06000140
	adds r6, r0, r1
	movs r3, 0
	movs r0, 0xF0
	lsls r0, 8
	adds r7, r0, 0
	adds r4, r2, 0x1
	movs r0, 0x1F
	ands r4, r0
_08088800:
	lsls r0, r3, 5
	adds r1, r0, r2
	lsls r1, 1
	adds r1, r6
	strh r7, [r1]
	adds r0, r4
	lsls r0, 1
	adds r0, r6
	strh r7, [r0]
	adds r0, r3, 0x1
	lsls r0, 16
	lsrs r3, r0, 16
	cmp r3, 0x9
	bls _08088800
	ldrh r0, [r5, 0x10]
	adds r0, 0x2
	strh r0, [r5, 0x10]
_08088822:
	movs r0, 0
_08088824:
	pop {r4-r7}
	pop {r1}
	bx r1
	.align 2, 0
_0808882C: .4byte 0x06000140
	thumb_func_end sub_80887C0

	thumb_func_start sub_8088830
sub_8088830: @ 8088830
	push {r4-r6,lr}
	sub sp, 0x8
	adds r6, r0, 0
	movs r5, 0x80
	lsls r5, 24
	ands r5, r6
	lsrs r5, 16
	lsls r5, 16
	lsrs r5, 16
	ldr r0, _08088884 @ =0x7fffffff
	ands r6, r0
	lsls r0, r6, 16
	lsrs r0, 16
	movs r3, 0xA0
	lsls r3, 1
	movs r4, 0x50
	str r4, [sp]
	movs r4, 0
	str r4, [sp, 0x4]
	bl CreateMonSprite_FieldMove
	lsls r0, 24
	lsrs r0, 24
	lsls r2, r0, 4
	adds r2, r0
	lsls r2, 2
	ldr r1, _08088888 @ =gSprites
	adds r2, r1
	ldr r1, _0808888C @ =SpriteCallbackDummy
	str r1, [r2, 0x1C]
	ldrb r3, [r2, 0x5]
	movs r1, 0xD
	negs r1, r1
	ands r1, r3
	strb r1, [r2, 0x5]
	strh r6, [r2, 0x2E]
	strh r5, [r2, 0x3A]
	add sp, 0x8
	pop {r4-r6}
	pop {r1}
	bx r1
	.align 2, 0
_08088884: .4byte 0x7fffffff
_08088888: .4byte gSprites
_0808888C: .4byte SpriteCallbackDummy
	thumb_func_end sub_8088830

	thumb_func_start sub_8088890
sub_8088890: @ 8088890
	push {lr}
	adds r1, r0, 0
	ldrh r0, [r1, 0x20]
	subs r0, 0x14
	strh r0, [r1, 0x20]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x78
	bgt _080888D0
	movs r0, 0x78
	strh r0, [r1, 0x20]
	movs r0, 0x1E
	strh r0, [r1, 0x30]
	ldr r0, _080888C4 @ =sub_80888D4
	str r0, [r1, 0x1C]
	movs r2, 0x3A
	ldrsh r0, [r1, r2]
	cmp r0, 0
	beq _080888C8
	ldrh r0, [r1, 0x2E]
	movs r1, 0
	movs r2, 0x7D
	movs r3, 0xA
	bl PlayCry2
	b _080888D0
	.align 2, 0
_080888C4: .4byte sub_80888D4
_080888C8:
	ldrh r0, [r1, 0x2E]
	movs r1, 0
	bl PlayCry1
_080888D0:
	pop {r0}
	bx r0
	thumb_func_end sub_8088890

	thumb_func_start sub_80888D4
sub_80888D4: @ 80888D4
	push {lr}
	adds r1, r0, 0
	ldrh r0, [r1, 0x30]
	subs r0, 0x1
	strh r0, [r1, 0x30]
	lsls r0, 16
	cmp r0, 0
	bne _080888E8
	ldr r0, _080888EC @ =sub_80888F0
	str r0, [r1, 0x1C]
_080888E8:
	pop {r0}
	bx r0
	.align 2, 0
_080888EC: .4byte sub_80888F0
	thumb_func_end sub_80888D4

	thumb_func_start sub_80888F0
sub_80888F0: @ 80888F0
	push {lr}
	adds r2, r0, 0
	ldrh r3, [r2, 0x20]
	movs r0, 0x20
	ldrsh r1, [r2, r0]
	movs r0, 0x40
	negs r0, r0
	cmp r1, r0
	bge _08088908
	movs r0, 0x1
	strh r0, [r2, 0x3C]
	b _0808890E
_08088908:
	adds r0, r3, 0
	subs r0, 0x14
	strh r0, [r2, 0x20]
_0808890E:
	pop {r0}
	bx r0
	thumb_func_end sub_80888F0

	thumb_func_start FldEff_UseSurf
FldEff_UseSurf: @ 8088914
	push {lr}
	ldr r0, _08088944 @ =sub_8088954
	movs r1, 0xFF
	bl CreateTask
	lsls r0, 24
	lsrs r0, 24
	ldr r2, _08088948 @ =gTasks
	lsls r1, r0, 2
	adds r1, r0
	lsls r1, 3
	adds r1, r2
	ldr r0, _0808894C @ =gUnknown_0202FF84
	ldr r0, [r0]
	strh r0, [r1, 0x26]
	bl sav1_reset_battle_music_maybe
	ldr r0, _08088950 @ =0x0000016d
	bl sub_8053FB0
	movs r0, 0
	pop {r1}
	bx r1
	.align 2, 0
_08088944: .4byte sub_8088954
_08088948: .4byte gTasks
_0808894C: .4byte gUnknown_0202FF84
_08088950: .4byte 0x0000016d
	thumb_func_end FldEff_UseSurf

	thumb_func_start sub_8088954
sub_8088954: @ 8088954
	push {lr}
	adds r1, r0, 0
	lsls r1, 24
	lsrs r1, 24
	ldr r3, _0808897C @ =gUnknown_0839F3E4
	ldr r2, _08088980 @ =gTasks
	lsls r0, r1, 2
	adds r0, r1
	lsls r0, 3
	adds r0, r2
	movs r2, 0x8
	ldrsh r1, [r0, r2]
	lsls r1, 2
	adds r1, r3
	ldr r1, [r1]
	bl _call_via_r1
	pop {r0}
	bx r0
	.align 2, 0
_0808897C: .4byte gUnknown_0839F3E4
_08088980: .4byte gTasks
	thumb_func_end sub_8088954

	thumb_func_start sub_8088984
sub_8088984: @ 8088984
	push {r4-r6,lr}
	mov r6, r8
	push {r6}
	adds r4, r0, 0
	bl ScriptContext2_Enable
	bl FreezeMapObjects
	ldr r5, _080889DC @ =gPlayerAvatar
	movs r0, 0x1
	strb r0, [r5, 0x6]
	movs r0, 0x8
	bl SetPlayerAvatarStateMask
	adds r6, r4, 0
	adds r6, 0xA
	movs r0, 0xC
	adds r0, r4
	mov r8, r0
	adds r0, r6, 0
	mov r1, r8
	bl PlayerGetDestCoords
	ldr r2, _080889E0 @ =gMapObjects
	ldrb r1, [r5, 0x5]
	lsls r0, r1, 3
	adds r0, r1
	lsls r0, 2
	adds r0, r2
	ldrb r0, [r0, 0x18]
	lsrs r0, 4
	adds r1, r6, 0
	mov r2, r8
	bl MoveCoords
	ldrh r0, [r4, 0x8]
	adds r0, 0x1
	strh r0, [r4, 0x8]
	pop {r3}
	mov r8, r3
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_080889DC: .4byte gPlayerAvatar
_080889E0: .4byte gMapObjects
	thumb_func_end sub_8088984

	thumb_func_start sub_80889E4
sub_80889E4: @ 80889E4
	push {r4,r5,lr}
	adds r5, r0, 0
	ldr r0, _08088A28 @ =gPlayerAvatar
	ldrb r1, [r0, 0x5]
	lsls r0, r1, 3
	adds r0, r1
	lsls r0, 2
	ldr r1, _08088A2C @ =gMapObjects
	adds r4, r0, r1
	adds r0, r4, 0
	bl FieldObjectIsSpecialAnimOrDirectionSequenceAnimActive
	lsls r0, 24
	cmp r0, 0
	beq _08088A0E
	adds r0, r4, 0
	bl FieldObjectClearAnimIfSpecialAnimFinished
	lsls r0, 24
	cmp r0, 0
	beq _08088A20
_08088A0E:
	bl sub_8059BF4
	adds r0, r4, 0
	movs r1, 0x39
	bl FieldObjectSetSpecialAnim
	ldrh r0, [r5, 0x8]
	adds r0, 0x1
	strh r0, [r5, 0x8]
_08088A20:
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_08088A28: .4byte gPlayerAvatar
_08088A2C: .4byte gMapObjects
	thumb_func_end sub_80889E4

	thumb_func_start sub_8088A30
sub_8088A30: @ 8088A30
	push {r4,lr}
	adds r4, r0, 0
	ldr r0, _08088A6C @ =gPlayerAvatar
	ldrb r1, [r0, 0x5]
	lsls r0, r1, 3
	adds r0, r1
	lsls r0, 2
	ldr r1, _08088A70 @ =gMapObjects
	adds r0, r1
	bl FieldObjectCheckIfSpecialAnimFinishedOrInactive
	lsls r0, 24
	cmp r0, 0
	beq _08088A66
	ldr r2, _08088A74 @ =gUnknown_0202FF84
	movs r1, 0x26
	ldrsh r0, [r4, r1]
	movs r1, 0x80
	lsls r1, 24
	orrs r0, r1
	str r0, [r2]
	movs r0, 0x3B
	bl FieldEffectStart
	ldrh r0, [r4, 0x8]
	adds r0, 0x1
	strh r0, [r4, 0x8]
_08088A66:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08088A6C: .4byte gPlayerAvatar
_08088A70: .4byte gMapObjects
_08088A74: .4byte gUnknown_0202FF84
	thumb_func_end sub_8088A30

	thumb_func_start sub_8088A78
sub_8088A78: @ 8088A78
	push {r4-r6,lr}
	adds r6, r0, 0
	movs r0, 0x6
	bl FieldEffectActiveListContains
	lsls r0, 24
	cmp r0, 0
	bne _08088AE2
	ldr r5, _08088AE8 @ =gPlayerAvatar
	ldrb r0, [r5, 0x5]
	lsls r4, r0, 3
	adds r4, r0
	lsls r4, 2
	ldr r0, _08088AEC @ =gMapObjects
	adds r4, r0
	movs r0, 0x3
	bl GetPlayerAvatarGraphicsIdByStateId
	adds r1, r0, 0
	lsls r1, 24
	lsrs r1, 24
	adds r0, r4, 0
	bl sub_805B980
	adds r0, r4, 0
	bl FieldObjectClearAnimIfSpecialAnimFinished
	ldrb r0, [r4, 0x18]
	lsrs r0, 4
	bl sub_80608D0
	adds r1, r0, 0
	lsls r1, 24
	lsrs r1, 24
	adds r0, r4, 0
	bl FieldObjectSetSpecialAnim
	ldr r1, _08088AF0 @ =gUnknown_0202FF84
	movs r2, 0xA
	ldrsh r0, [r6, r2]
	str r0, [r1]
	movs r2, 0xC
	ldrsh r0, [r6, r2]
	str r0, [r1, 0x4]
	ldrb r0, [r5, 0x5]
	str r0, [r1, 0x8]
	movs r0, 0x8
	bl FieldEffectStart
	strb r0, [r4, 0x1A]
	ldrh r0, [r6, 0x8]
	adds r0, 0x1
	strh r0, [r6, 0x8]
_08088AE2:
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_08088AE8: .4byte gPlayerAvatar
_08088AEC: .4byte gMapObjects
_08088AF0: .4byte gUnknown_0202FF84
	thumb_func_end sub_8088A78

	thumb_func_start sub_8088AF4
sub_8088AF4: @ 8088AF4
	push {r4,r5,lr}
	ldr r5, _08088B5C @ =gPlayerAvatar
	ldrb r1, [r5, 0x5]
	lsls r0, r1, 3
	adds r0, r1
	lsls r0, 2
	ldr r1, _08088B60 @ =gMapObjects
	adds r4, r0, r1
	adds r0, r4, 0
	bl FieldObjectClearAnimIfSpecialAnimFinished
	lsls r0, 24
	cmp r0, 0
	beq _08088B54
	movs r0, 0
	strb r0, [r5, 0x6]
	ldrb r1, [r5]
	movs r0, 0xDF
	ands r0, r1
	strb r0, [r5]
	ldrb r0, [r4, 0x18]
	lsrs r0, 4
	bl GetFaceDirectionAnimId
	adds r1, r0, 0
	lsls r1, 24
	lsrs r1, 24
	adds r0, r4, 0
	bl FieldObjectSetSpecialAnim
	ldrb r0, [r4, 0x1A]
	movs r1, 0x1
	bl sub_8127ED0
	bl UnfreezeMapObjects
	bl ScriptContext2_Disable
	movs r0, 0x9
	bl FieldEffectActiveListRemove
	ldr r0, _08088B64 @ =sub_8088954
	bl FindTaskIdByFunc
	lsls r0, 24
	lsrs r0, 24
	bl DestroyTask
_08088B54:
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_08088B5C: .4byte gPlayerAvatar
_08088B60: .4byte gMapObjects
_08088B64: .4byte sub_8088954
	thumb_func_end sub_8088AF4

	thumb_func_start FldEff_NPCFlyOut
FldEff_NPCFlyOut: @ 8088B68
	push {r4,lr}
	ldr r0, _08088BB4 @ =gFieldEffectObjectTemplatePointers
	ldr r0, [r0, 0x68]
	movs r1, 0x78
	movs r2, 0
	movs r3, 0x1
	bl CreateSprite
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	lsls r2, r4, 4
	adds r2, r4
	lsls r2, 2
	ldr r0, _08088BB8 @ =gSprites
	adds r2, r0
	ldrb r1, [r2, 0x5]
	movs r0, 0xF
	ands r0, r1
	movs r1, 0xD
	negs r1, r1
	ands r0, r1
	movs r1, 0x4
	orrs r0, r1
	strb r0, [r2, 0x5]
	ldr r0, _08088BBC @ =sub_8088BC4
	str r0, [r2, 0x1C]
	ldr r0, _08088BC0 @ =gUnknown_0202FF84
	ldr r0, [r0]
	strh r0, [r2, 0x30]
	movs r0, 0x9E
	bl PlaySE
	adds r0, r4, 0
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_08088BB4: .4byte gFieldEffectObjectTemplatePointers
_08088BB8: .4byte gSprites
_08088BBC: .4byte sub_8088BC4
_08088BC0: .4byte gUnknown_0202FF84
	thumb_func_end FldEff_NPCFlyOut

	thumb_func_start sub_8088BC4
sub_8088BC4: @ 8088BC4
	push {r4,r5,lr}
	adds r4, r0, 0
	movs r1, 0x32
	ldrsh r0, [r4, r1]
	movs r1, 0x8C
	bl Cos
	movs r5, 0
	strh r0, [r4, 0x24]
	movs r2, 0x32
	ldrsh r0, [r4, r2]
	movs r1, 0x48
	bl Sin
	strh r0, [r4, 0x26]
	ldrh r0, [r4, 0x32]
	adds r0, 0x4
	movs r1, 0xFF
	ands r0, r1
	strh r0, [r4, 0x32]
	movs r1, 0x2E
	ldrsh r0, [r4, r1]
	cmp r0, 0
	beq _08088C26
	movs r2, 0x30
	ldrsh r0, [r4, r2]
	lsls r1, r0, 4
	adds r1, r0
	lsls r1, 2
	ldr r0, _08088C3C @ =gSprites
	adds r1, r0
	adds r3, r1, 0
	adds r3, 0x3E
	ldrb r2, [r3]
	movs r0, 0x3
	negs r0, r0
	ands r0, r2
	strb r0, [r3]
	ldrh r0, [r4, 0x24]
	ldrh r2, [r4, 0x20]
	adds r0, r2
	strh r0, [r1, 0x20]
	ldrh r0, [r4, 0x26]
	ldrh r2, [r4, 0x22]
	adds r0, r2
	subs r0, 0x8
	strh r0, [r1, 0x22]
	strh r5, [r1, 0x24]
	strh r5, [r1, 0x26]
_08088C26:
	movs r1, 0x32
	ldrsh r0, [r4, r1]
	cmp r0, 0x7F
	ble _08088C36
	adds r0, r4, 0
	movs r1, 0x1E
	bl FieldEffectStop
_08088C36:
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_08088C3C: .4byte gSprites
	thumb_func_end sub_8088BC4

	thumb_func_start FldEff_UseFly
FldEff_UseFly: @ 8088C40
	push {lr}
	ldr r0, _08088C64 @ =sub_8088C70
	movs r1, 0xFE
	bl CreateTask
	lsls r0, 24
	lsrs r0, 24
	ldr r2, _08088C68 @ =gTasks
	lsls r1, r0, 2
	adds r1, r0
	lsls r1, 3
	adds r1, r2
	ldr r0, _08088C6C @ =gUnknown_0202FF84
	ldr r0, [r0]
	strh r0, [r1, 0xA]
	movs r0, 0
	pop {r1}
	bx r1
	.align 2, 0
_08088C64: .4byte sub_8088C70
_08088C68: .4byte gTasks
_08088C6C: .4byte gUnknown_0202FF84
	thumb_func_end FldEff_UseFly

	thumb_func_start sub_8088C70
sub_8088C70: @ 8088C70
	push {lr}
	adds r1, r0, 0
	lsls r1, 24
	lsrs r1, 24
	ldr r3, _08088C98 @ =gUnknown_0839F3F8
	ldr r2, _08088C9C @ =gTasks
	lsls r0, r1, 2
	adds r0, r1
	lsls r0, 3
	adds r0, r2
	movs r2, 0x8
	ldrsh r1, [r0, r2]
	lsls r1, 2
	adds r1, r3
	ldr r1, [r1]
	bl _call_via_r1
	pop {r0}
	bx r0
	.align 2, 0
_08088C98: .4byte gUnknown_0839F3F8
_08088C9C: .4byte gTasks
	thumb_func_end sub_8088C70

	thumb_func_start sub_8088CA0
sub_8088CA0: @ 8088CA0
	push {r4-r6,lr}
	adds r5, r0, 0
	ldr r6, _08088CF0 @ =gPlayerAvatar
	ldrb r1, [r6, 0x5]
	lsls r0, r1, 3
	adds r0, r1
	lsls r0, 2
	ldr r1, _08088CF4 @ =gMapObjects
	adds r4, r0, r1
	adds r0, r4, 0
	bl FieldObjectIsSpecialAnimOrDirectionSequenceAnimActive
	lsls r0, 24
	cmp r0, 0
	beq _08088CCA
	adds r0, r4, 0
	bl FieldObjectClearAnimIfSpecialAnimFinished
	lsls r0, 24
	cmp r0, 0
	beq _08088CE8
_08088CCA:
	ldrb r0, [r6]
	strh r0, [r5, 0x26]
	movs r0, 0x1
	strb r0, [r6, 0x6]
	bl SetPlayerAvatarStateMask
	bl sub_8059BF4
	adds r0, r4, 0
	movs r1, 0x39
	bl FieldObjectSetSpecialAnim
	ldrh r0, [r5, 0x8]
	adds r0, 0x1
	strh r0, [r5, 0x8]
_08088CE8:
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_08088CF0: .4byte gPlayerAvatar
_08088CF4: .4byte gMapObjects
	thumb_func_end sub_8088CA0

	thumb_func_start sub_8088CF8
sub_8088CF8: @ 8088CF8
	push {r4,lr}
	adds r4, r0, 0
	ldr r0, _08088D30 @ =gPlayerAvatar
	ldrb r1, [r0, 0x5]
	lsls r0, r1, 3
	adds r0, r1
	lsls r0, 2
	ldr r1, _08088D34 @ =gMapObjects
	adds r0, r1
	bl FieldObjectClearAnimIfSpecialAnimFinished
	lsls r0, 24
	cmp r0, 0
	beq _08088D28
	ldrh r0, [r4, 0x8]
	adds r0, 0x1
	strh r0, [r4, 0x8]
	ldr r1, _08088D38 @ =gUnknown_0202FF84
	movs r2, 0xA
	ldrsh r0, [r4, r2]
	str r0, [r1]
	movs r0, 0x3B
	bl FieldEffectStart
_08088D28:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08088D30: .4byte gPlayerAvatar
_08088D34: .4byte gMapObjects
_08088D38: .4byte gUnknown_0202FF84
	thumb_func_end sub_8088CF8

	thumb_func_start sub_8088D3C
sub_8088D3C: @ 8088D3C
	push {r4,r5,lr}
	adds r4, r0, 0
	movs r0, 0x6
	bl FieldEffectActiveListContains
	lsls r0, 24
	cmp r0, 0
	bne _08088D84
	ldr r0, _08088D8C @ =gPlayerAvatar
	ldrb r1, [r0, 0x5]
	lsls r0, r1, 3
	adds r0, r1
	lsls r0, 2
	ldr r1, _08088D90 @ =gMapObjects
	adds r5, r0, r1
	ldrh r1, [r4, 0x26]
	movs r0, 0x8
	ands r0, r1
	cmp r0, 0
	beq _08088D74
	ldrb r0, [r5, 0x1A]
	movs r1, 0x2
	bl sub_8127ED0
	ldrb r0, [r5, 0x1A]
	movs r1, 0
	bl sub_8127EFC
_08088D74:
	bl sub_8088F60
	lsls r0, 24
	lsrs r0, 24
	strh r0, [r4, 0xA]
	ldrh r0, [r4, 0x8]
	adds r0, 0x1
	strh r0, [r4, 0x8]
_08088D84:
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_08088D8C: .4byte gPlayerAvatar
_08088D90: .4byte gMapObjects
	thumb_func_end sub_8088D3C

	thumb_func_start sub_8088D94
sub_8088D94: @ 8088D94
	push {r4,lr}
	adds r4, r0, 0
	ldrb r0, [r4, 0xA]
	bl sub_8088FA4
	lsls r0, 24
	cmp r0, 0
	beq _08088DC8
	ldrh r0, [r4, 0x8]
	adds r0, 0x1
	strh r0, [r4, 0x8]
	movs r0, 0x10
	strh r0, [r4, 0xC]
	movs r0, 0x1
	bl SetPlayerAvatarTransitionFlags
	ldr r0, _08088DD0 @ =gPlayerAvatar
	ldrb r1, [r0, 0x5]
	lsls r0, r1, 3
	adds r0, r1
	lsls r0, 2
	ldr r1, _08088DD4 @ =gMapObjects
	adds r0, r1
	movs r1, 0x2
	bl FieldObjectSetSpecialAnim
_08088DC8:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08088DD0: .4byte gPlayerAvatar
_08088DD4: .4byte gMapObjects
	thumb_func_end sub_8088D94

	thumb_func_start sub_8088DD8
sub_8088DD8: @ 8088DD8
	push {r4,lr}
	adds r4, r0, 0
	ldr r0, _08088E24 @ =gPlayerAvatar
	ldrb r1, [r0, 0x5]
	lsls r0, r1, 3
	adds r0, r1
	lsls r0, 2
	ldr r1, _08088E28 @ =gMapObjects
	adds r2, r0, r1
	ldrh r1, [r4, 0xC]
	movs r3, 0xC
	ldrsh r0, [r4, r3]
	cmp r0, 0
	beq _08088DFE
	subs r0, r1, 0x1
	strh r0, [r4, 0xC]
	lsls r0, 16
	cmp r0, 0
	bne _08088E1C
_08088DFE:
	adds r0, r2, 0
	bl FieldObjectClearAnimIfSpecialAnimFinished
	lsls r0, 24
	cmp r0, 0
	beq _08088E1C
	ldrh r0, [r4, 0x8]
	adds r0, 0x1
	strh r0, [r4, 0x8]
	movs r0, 0x9E
	bl PlaySE
	ldrb r0, [r4, 0xA]
	bl sub_8088FC0
_08088E1C:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08088E24: .4byte gPlayerAvatar
_08088E28: .4byte gMapObjects
	thumb_func_end sub_8088DD8

	thumb_func_start sub_8088E2C
sub_8088E2C: @ 8088E2C
	push {r4-r6,lr}
	adds r5, r0, 0
	ldrh r0, [r5, 0xC]
	adds r0, 0x1
	strh r0, [r5, 0xC]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x7
	ble _08088EA2
	ldr r0, _08088EA8 @ =gPlayerAvatar
	ldrb r1, [r0, 0x5]
	lsls r0, r1, 3
	adds r0, r1
	lsls r0, 2
	ldr r1, _08088EAC @ =gMapObjects
	adds r4, r0, r1
	movs r0, 0x3
	bl GetPlayerAvatarGraphicsIdByStateId
	adds r1, r0, 0
	lsls r1, 24
	lsrs r1, 24
	adds r0, r4, 0
	bl sub_805B980
	ldrb r1, [r4, 0x4]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	ldr r6, _08088EB0 @ =gSprites
	adds r0, r6
	movs r1, 0x16
	bl StartSpriteAnim
	ldrb r0, [r4, 0x1]
	movs r1, 0x10
	orrs r0, r1
	strb r0, [r4, 0x1]
	adds r0, r4, 0
	movs r1, 0x48
	bl FieldObjectSetSpecialAnim
	ldrh r1, [r5, 0x26]
	movs r0, 0x8
	ands r0, r1
	cmp r0, 0
	beq _08088E98
	ldrb r1, [r4, 0x1A]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r6
	bl DestroySprite
_08088E98:
	ldrh r0, [r5, 0x8]
	adds r0, 0x1
	strh r0, [r5, 0x8]
	movs r0, 0
	strh r0, [r5, 0xC]
_08088EA2:
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_08088EA8: .4byte gPlayerAvatar
_08088EAC: .4byte gMapObjects
_08088EB0: .4byte gSprites
	thumb_func_end sub_8088E2C

	thumb_func_start sub_8088EB4
sub_8088EB4: @ 8088EB4
	push {r4,r5,lr}
	adds r5, r0, 0
	ldrh r0, [r5, 0xC]
	adds r0, 0x1
	strh r0, [r5, 0xC]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x9
	ble _08088F00
	ldr r0, _08088F08 @ =gPlayerAvatar
	ldrb r0, [r0, 0x5]
	lsls r4, r0, 3
	adds r4, r0
	lsls r4, 2
	ldr r0, _08088F0C @ =gMapObjects
	adds r4, r0
	adds r0, r4, 0
	bl FieldObjectClearAnimIfSpecialAnimActive
	ldrb r1, [r4, 0x1]
	movs r0, 0x11
	negs r0, r0
	ands r0, r1
	strb r0, [r4, 0x1]
	ldrb r1, [r4, 0x2]
	movs r0, 0x41
	negs r0, r0
	ands r0, r1
	strb r0, [r4, 0x2]
	ldrb r0, [r5, 0xA]
	ldrb r1, [r4, 0x4]
	bl sub_8088FFC
	bl CameraObjectReset2
	ldrh r0, [r5, 0x8]
	adds r0, 0x1
	strh r0, [r5, 0x8]
_08088F00:
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_08088F08: .4byte gPlayerAvatar
_08088F0C: .4byte gMapObjects
	thumb_func_end sub_8088EB4

	thumb_func_start sub_8088F10
sub_8088F10: @ 8088F10
	push {r4,lr}
	adds r4, r0, 0
	ldrb r0, [r4, 0xA]
	bl sub_8088FA4
	lsls r0, 24
	cmp r0, 0
	beq _08088F2A
	bl fade_8080918
	ldrh r0, [r4, 0x8]
	adds r0, 0x1
	strh r0, [r4, 0x8]
_08088F2A:
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end sub_8088F10

	thumb_func_start sub_8088F30
sub_8088F30: @ 8088F30
	push {lr}
	ldr r0, _08088F58 @ =gPaletteFade
	ldrb r1, [r0, 0x7]
	movs r0, 0x80
	ands r0, r1
	cmp r0, 0
	bne _08088F52
	movs r0, 0x1F
	bl FieldEffectActiveListRemove
	ldr r0, _08088F5C @ =sub_8088C70
	bl FindTaskIdByFunc
	lsls r0, 24
	lsrs r0, 24
	bl DestroyTask
_08088F52:
	pop {r0}
	bx r0
	.align 2, 0
_08088F58: .4byte gPaletteFade
_08088F5C: .4byte sub_8088C70
	thumb_func_end sub_8088F30

	thumb_func_start sub_8088F60
sub_8088F60: @ 8088F60
	push {lr}
	ldr r0, _08088F98 @ =gFieldEffectObjectTemplatePointers
	ldr r0, [r0, 0x68]
	movs r1, 0xFF
	movs r2, 0xB4
	movs r3, 0x1
	bl CreateSprite
	lsls r0, 24
	lsrs r0, 24
	lsls r2, r0, 4
	adds r2, r0
	lsls r2, 2
	ldr r1, _08088F9C @ =gSprites
	adds r2, r1
	ldrb r3, [r2, 0x5]
	movs r1, 0xF
	ands r1, r3
	movs r3, 0xD
	negs r3, r3
	ands r1, r3
	movs r3, 0x4
	orrs r1, r3
	strb r1, [r2, 0x5]
	ldr r1, _08088FA0 @ =sub_8089018
	str r1, [r2, 0x1C]
	pop {r1}
	bx r1
	.align 2, 0
_08088F98: .4byte gFieldEffectObjectTemplatePointers
_08088F9C: .4byte gSprites
_08088FA0: .4byte sub_8089018
	thumb_func_end sub_8088F60

	thumb_func_start sub_8088FA4
sub_8088FA4: @ 8088FA4
	lsls r0, 24
	lsrs r0, 24
	ldr r2, _08088FBC @ =gSprites
	lsls r1, r0, 4
	adds r1, r0
	lsls r1, 2
	adds r1, r2
	ldrh r0, [r1, 0x3C]
	lsls r0, 24
	lsrs r0, 24
	bx lr
	.align 2, 0
_08088FBC: .4byte gSprites
	thumb_func_end sub_8088FA4

	thumb_func_start sub_8088FC0
sub_8088FC0: @ 8088FC0
	push {r4,lr}
	lsls r0, 24
	lsrs r0, 24
	lsls r4, r0, 4
	adds r4, r0
	lsls r4, 2
	ldr r0, _08088FF4 @ =gSprites
	adds r4, r0
	ldr r0, _08088FF8 @ =sub_80890D8
	str r0, [r4, 0x1C]
	movs r1, 0
	movs r0, 0x78
	strh r0, [r4, 0x20]
	strh r1, [r4, 0x22]
	strh r1, [r4, 0x24]
	strh r1, [r4, 0x26]
	adds r0, r4, 0
	adds r0, 0x2E
	movs r2, 0x10
	bl memset
	movs r0, 0x40
	strh r0, [r4, 0x3A]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08088FF4: .4byte gSprites
_08088FF8: .4byte sub_80890D8
	thumb_func_end sub_8088FC0

	thumb_func_start sub_8088FFC
sub_8088FFC: @ 8088FFC
	lsls r0, 24
	lsrs r0, 24
	lsls r1, 24
	lsrs r1, 24
	ldr r3, _08089014 @ =gSprites
	lsls r2, r0, 4
	adds r2, r0
	lsls r2, 2
	adds r2, r3
	strh r1, [r2, 0x3A]
	bx lr
	.align 2, 0
_08089014: .4byte gSprites
	thumb_func_end sub_8088FFC

	thumb_func_start sub_8089018
sub_8089018: @ 8089018
	push {r4,lr}
	adds r4, r0, 0
	movs r1, 0x3C
	ldrsh r0, [r4, r1]
	cmp r0, 0
	bne _080890C4
	movs r1, 0x2E
	ldrsh r0, [r4, r1]
	cmp r0, 0
	bne _0808905C
	ldrb r0, [r4, 0x1]
	movs r1, 0x3
	orrs r0, r1
	strb r0, [r4, 0x1]
	ldr r0, _080890CC @ =gSpriteAffineAnimTable_0839F44C
	str r0, [r4, 0x10]
	adds r0, r4, 0
	bl InitSpriteAffineAnim
	adds r0, r4, 0
	movs r1, 0
	bl StartSpriteAffineAnim
	movs r0, 0x76
	strh r0, [r4, 0x20]
	ldr r0, _080890D0 @ =0x0000ffd0
	strh r0, [r4, 0x22]
	ldrh r0, [r4, 0x2E]
	adds r0, 0x1
	strh r0, [r4, 0x2E]
	movs r0, 0x40
	strh r0, [r4, 0x30]
	adds r0, 0xC0
	strh r0, [r4, 0x32]
_0808905C:
	ldrh r0, [r4, 0x32]
	lsls r0, 16
	asrs r0, 24
	ldrh r1, [r4, 0x30]
	adds r0, r1
	strh r0, [r4, 0x30]
	movs r1, 0x30
	ldrsh r0, [r4, r1]
	movs r1, 0x78
	bl Cos
	strh r0, [r4, 0x24]
	movs r1, 0x30
	ldrsh r0, [r4, r1]
	movs r1, 0x78
	bl Sin
	strh r0, [r4, 0x26]
	ldrh r2, [r4, 0x32]
	movs r0, 0x32
	ldrsh r1, [r4, r0]
	ldr r0, _080890D4 @ =0x000007ff
	cmp r1, r0
	bgt _08089092
	adds r0, r2, 0
	adds r0, 0x60
	strh r0, [r4, 0x32]
_08089092:
	movs r1, 0x30
	ldrsh r0, [r4, r1]
	cmp r0, 0x81
	ble _080890C4
	ldrh r0, [r4, 0x3C]
	adds r0, 0x1
	strh r0, [r4, 0x3C]
	ldrb r1, [r4, 0x1]
	movs r0, 0x4
	negs r0, r0
	ands r0, r1
	strb r0, [r4, 0x1]
	ldrb r0, [r4, 0x3]
	lsls r0, 26
	lsrs r0, 27
	bl FreeOamMatrix
	ldrb r1, [r4, 0x1]
	lsrs r1, 6
	ldrb r2, [r4, 0x3]
	lsrs r2, 6
	adds r0, r4, 0
	movs r3, 0
	bl CalcCenterToCornerVec
_080890C4:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080890CC: .4byte gSpriteAffineAnimTable_0839F44C
_080890D0: .4byte 0x0000ffd0
_080890D4: .4byte 0x000007ff
	thumb_func_end sub_8089018

	thumb_func_start sub_80890D8
sub_80890D8: @ 80890D8
	push {r4,r5,lr}
	adds r4, r0, 0
	movs r1, 0x32
	ldrsh r0, [r4, r1]
	movs r1, 0x8C
	bl Cos
	movs r5, 0
	strh r0, [r4, 0x24]
	movs r2, 0x32
	ldrsh r0, [r4, r2]
	movs r1, 0x48
	bl Sin
	strh r0, [r4, 0x26]
	ldrh r0, [r4, 0x32]
	adds r0, 0x4
	movs r1, 0xFF
	ands r0, r1
	strh r0, [r4, 0x32]
	movs r1, 0x3A
	ldrsh r0, [r4, r1]
	cmp r0, 0x40
	beq _08089136
	lsls r1, r0, 4
	adds r1, r0
	lsls r1, 2
	ldr r0, _08089148 @ =gSprites
	adds r1, r0
	adds r3, r1, 0
	adds r3, 0x3E
	ldrb r2, [r3]
	movs r0, 0x3
	negs r0, r0
	ands r0, r2
	strb r0, [r3]
	ldrh r0, [r4, 0x24]
	ldrh r2, [r4, 0x20]
	adds r0, r2
	strh r0, [r1, 0x20]
	ldrh r0, [r4, 0x26]
	ldrh r2, [r4, 0x22]
	adds r0, r2
	subs r0, 0x8
	strh r0, [r1, 0x22]
	strh r5, [r1, 0x24]
	strh r5, [r1, 0x26]
_08089136:
	movs r1, 0x32
	ldrsh r0, [r4, r1]
	cmp r0, 0x7F
	ble _08089142
	movs r0, 0x1
	strh r0, [r4, 0x3C]
_08089142:
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_08089148: .4byte gSprites
	thumb_func_end sub_80890D8

	thumb_func_start sub_808914C
sub_808914C: @ 808914C
	push {r4,lr}
	adds r4, r0, 0
	movs r1, 0x3C
	ldrsh r0, [r4, r1]
	cmp r0, 0
	bne _08089220
	movs r2, 0x2E
	ldrsh r0, [r4, r2]
	cmp r0, 0
	bne _08089196
	ldrb r0, [r4, 0x1]
	movs r1, 0x3
	orrs r0, r1
	strb r0, [r4, 0x1]
	ldr r0, _08089228 @ =gSpriteAffineAnimTable_0839F44C
	str r0, [r4, 0x10]
	adds r0, r4, 0
	bl InitSpriteAffineAnim
	adds r0, r4, 0
	movs r1, 0x1
	bl StartSpriteAffineAnim
	movs r0, 0x5E
	strh r0, [r4, 0x20]
	ldr r0, _0808922C @ =0x0000ffe0
	strh r0, [r4, 0x22]
	ldrh r0, [r4, 0x2E]
	adds r0, 0x1
	strh r0, [r4, 0x2E]
	movs r0, 0xF0
	strh r0, [r4, 0x30]
	movs r0, 0x80
	lsls r0, 4
	strh r0, [r4, 0x32]
	movs r0, 0x80
	strh r0, [r4, 0x36]
_08089196:
	ldrh r1, [r4, 0x32]
	lsls r1, 16
	asrs r1, 24
	ldrh r2, [r4, 0x30]
	adds r2, r1
	ldrh r0, [r4, 0x34]
	adds r0, r1
	strh r0, [r4, 0x34]
	movs r0, 0xFF
	ands r2, r0
	strh r2, [r4, 0x30]
	movs r3, 0x30
	ldrsh r0, [r4, r3]
	movs r1, 0x20
	bl Cos
	strh r0, [r4, 0x24]
	movs r1, 0x30
	ldrsh r0, [r4, r1]
	movs r1, 0x78
	bl Sin
	strh r0, [r4, 0x26]
	ldrh r1, [r4, 0x32]
	movs r2, 0x32
	ldrsh r0, [r4, r2]
	movs r2, 0x80
	lsls r2, 1
	cmp r0, r2
	ble _080891D8
	ldrh r0, [r4, 0x36]
	subs r0, r1, r0
	strh r0, [r4, 0x32]
_080891D8:
	ldrh r1, [r4, 0x36]
	movs r3, 0x36
	ldrsh r0, [r4, r3]
	cmp r0, 0xFF
	bgt _080891E8
	adds r0, r1, 0
	adds r0, 0x18
	strh r0, [r4, 0x36]
_080891E8:
	movs r1, 0x32
	ldrsh r0, [r4, r1]
	cmp r0, 0xFF
	bgt _080891F2
	strh r2, [r4, 0x32]
_080891F2:
	movs r2, 0x34
	ldrsh r0, [r4, r2]
	cmp r0, 0x3B
	ble _08089220
	ldrh r0, [r4, 0x3C]
	adds r0, 0x1
	strh r0, [r4, 0x3C]
	ldrb r1, [r4, 0x1]
	movs r0, 0x4
	negs r0, r0
	ands r0, r1
	strb r0, [r4, 0x1]
	ldrb r0, [r4, 0x3]
	lsls r0, 26
	lsrs r0, 27
	bl FreeOamMatrix
	adds r2, r4, 0
	adds r2, 0x3E
	ldrb r0, [r2]
	movs r1, 0x4
	orrs r0, r1
	strb r0, [r2]
_08089220:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08089228: .4byte gSpriteAffineAnimTable_0839F44C
_0808922C: .4byte 0x0000ffe0
	thumb_func_end sub_808914C

	thumb_func_start sub_8089230
sub_8089230: @ 8089230
	push {r4,lr}
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	adds r0, r4, 0
	bl sub_8088FC0
	ldr r1, _08089254 @ =gSprites
	lsls r0, r4, 4
	adds r0, r4
	lsls r0, 2
	adds r1, 0x1C
	adds r0, r1
	ldr r1, _08089258 @ =sub_808914C
	str r1, [r0]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08089254: .4byte gSprites
_08089258: .4byte sub_808914C
	thumb_func_end sub_8089230

	thumb_func_start FldEff_FlyIn
FldEff_FlyIn: @ 808925C
	push {lr}
	ldr r0, _0808926C @ =sub_8089270
	movs r1, 0xFE
	bl CreateTask
	movs r0, 0
	pop {r1}
	bx r1
	.align 2, 0
_0808926C: .4byte sub_8089270
	thumb_func_end FldEff_FlyIn

	thumb_func_start sub_8089270
sub_8089270: @ 8089270
	push {lr}
	adds r1, r0, 0
	lsls r1, 24
	lsrs r1, 24
	ldr r3, _08089298 @ =gUnknown_0839F454
	ldr r2, _0808929C @ =gTasks
	lsls r0, r1, 2
	adds r0, r1
	lsls r0, 3
	adds r0, r2
	movs r2, 0x8
	ldrsh r1, [r0, r2]
	lsls r1, 2
	adds r1, r3
	ldr r1, [r1]
	bl _call_via_r1
	pop {r0}
	bx r0
	.align 2, 0
_08089298: .4byte gUnknown_0839F454
_0808929C: .4byte gTasks
	thumb_func_end sub_8089270

	thumb_func_start sub_80892A0
sub_80892A0: @ 80892A0
	push {r4-r6,lr}
	adds r5, r0, 0
	ldr r6, _08089348 @ =gPlayerAvatar
	ldrb r1, [r6, 0x5]
	lsls r0, r1, 3
	adds r0, r1
	lsls r0, 2
	ldr r1, _0808934C @ =gMapObjects
	adds r4, r0, r1
	adds r0, r4, 0
	bl FieldObjectIsSpecialAnimOrDirectionSequenceAnimActive
	lsls r0, 24
	cmp r0, 0
	beq _080892CA
	adds r0, r4, 0
	bl FieldObjectClearAnimIfSpecialAnimFinished
	lsls r0, 24
	cmp r0, 0
	beq _08089342
_080892CA:
	ldrh r0, [r5, 0x8]
	adds r0, 0x1
	strh r0, [r5, 0x8]
	movs r0, 0x11
	strh r0, [r5, 0xC]
	ldrb r0, [r6]
	strh r0, [r5, 0x26]
	movs r0, 0x1
	strb r0, [r6, 0x6]
	bl SetPlayerAvatarStateMask
	ldrh r1, [r5, 0x26]
	movs r0, 0x8
	ands r0, r1
	cmp r0, 0
	beq _080892F2
	ldrb r0, [r4, 0x1A]
	movs r1, 0
	bl sub_8127ED0
_080892F2:
	movs r0, 0x3
	bl GetPlayerAvatarGraphicsIdByStateId
	adds r1, r0, 0
	lsls r1, 24
	lsrs r1, 24
	adds r0, r4, 0
	bl sub_805B980
	bl CameraObjectReset2
	adds r0, r4, 0
	movs r1, 0x3
	bl FieldObjectTurn
	ldrb r1, [r4, 0x4]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	ldr r1, _08089350 @ =gSprites
	adds r0, r1
	movs r1, 0x16
	bl StartSpriteAnim
	ldrb r1, [r4, 0x1]
	movs r0, 0x21
	negs r0, r0
	ands r0, r1
	strb r0, [r4, 0x1]
	bl sub_8088F60
	lsls r0, 24
	lsrs r0, 24
	strh r0, [r5, 0xA]
	bl sub_8088FC0
	ldrb r0, [r5, 0xA]
	ldrb r1, [r4, 0x4]
	bl sub_8088FFC
_08089342:
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_08089348: .4byte gPlayerAvatar
_0808934C: .4byte gMapObjects
_08089350: .4byte gSprites
	thumb_func_end sub_80892A0

	thumb_func_start sub_8089354
sub_8089354: @ 8089354
	push {r4,r5,lr}
	adds r5, r0, 0
	ldrh r1, [r5, 0xC]
	movs r2, 0xC
	ldrsh r0, [r5, r2]
	cmp r0, 0
	beq _0808936C
	subs r0, r1, 0x1
	strh r0, [r5, 0xC]
	lsls r0, 16
	cmp r0, 0
	bne _080893AC
_0808936C:
	ldr r0, _080893B4 @ =gPlayerAvatar
	ldrb r1, [r0, 0x5]
	lsls r0, r1, 3
	adds r0, r1
	lsls r0, 2
	ldr r1, _080893B8 @ =gMapObjects
	adds r0, r1
	ldrb r0, [r0, 0x4]
	lsls r4, r0, 4
	adds r4, r0
	lsls r4, 2
	ldr r0, _080893BC @ =gSprites
	adds r4, r0
	ldrb r0, [r5, 0xA]
	movs r1, 0x40
	bl sub_8088FFC
	ldrh r0, [r4, 0x24]
	ldrh r1, [r4, 0x20]
	adds r0, r1
	movs r1, 0
	strh r0, [r4, 0x20]
	ldrh r0, [r4, 0x26]
	ldrh r2, [r4, 0x22]
	adds r0, r2
	strh r0, [r4, 0x22]
	strh r1, [r4, 0x24]
	strh r1, [r4, 0x26]
	ldrh r0, [r5, 0x8]
	adds r0, 0x1
	strh r0, [r5, 0x8]
	strh r1, [r5, 0xC]
_080893AC:
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080893B4: .4byte gPlayerAvatar
_080893B8: .4byte gMapObjects
_080893BC: .4byte gSprites
	thumb_func_end sub_8089354

	thumb_func_start sub_80893C0
sub_80893C0: @ 80893C0
	push {r4,lr}
	sub sp, 0x24
	adds r4, r0, 0
	ldr r1, _08089408 @ =gUnknown_0839F470
	mov r0, sp
	movs r2, 0x24
	bl memcpy
	ldr r0, _0808940C @ =gPlayerAvatar
	ldrb r0, [r0, 0x4]
	lsls r1, r0, 4
	adds r1, r0
	lsls r1, 2
	ldr r0, _08089410 @ =gSprites
	adds r1, r0
	movs r2, 0xC
	ldrsh r0, [r4, r2]
	lsls r0, 1
	add r0, sp
	ldrh r0, [r0]
	strh r0, [r1, 0x26]
	ldrh r0, [r4, 0xC]
	adds r0, 0x1
	strh r0, [r4, 0xC]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x11
	ble _080893FE
	ldrh r0, [r4, 0x8]
	adds r0, 0x1
	strh r0, [r4, 0x8]
_080893FE:
	add sp, 0x24
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08089408: .4byte gUnknown_0839F470
_0808940C: .4byte gPlayerAvatar
_08089410: .4byte gSprites
	thumb_func_end sub_80893C0

	thumb_func_start sub_8089414
sub_8089414: @ 8089414
	push {r4-r6,lr}
	adds r6, r0, 0
	ldrb r0, [r6, 0xA]
	bl sub_8088FA4
	lsls r0, 24
	cmp r0, 0
	beq _08089478
	ldr r0, _08089480 @ =gPlayerAvatar
	ldrb r0, [r0, 0x5]
	lsls r5, r0, 3
	adds r5, r0
	lsls r5, 2
	ldr r0, _08089484 @ =gMapObjects
	adds r5, r0
	ldrb r0, [r5, 0x4]
	lsls r4, r0, 4
	adds r4, r0
	lsls r4, 2
	ldr r0, _08089488 @ =gSprites
	adds r4, r0
	ldrb r1, [r5, 0x1]
	movs r0, 0x11
	negs r0, r0
	ands r0, r1
	strb r0, [r5, 0x1]
	movs r0, 0x10
	ldrsh r1, [r5, r0]
	movs r0, 0x12
	ldrsh r2, [r5, r0]
	adds r0, r5, 0
	bl sub_805C058
	movs r0, 0
	strh r0, [r4, 0x24]
	strh r0, [r4, 0x26]
	adds r4, 0x3E
	ldrb r0, [r4]
	movs r1, 0x2
	orrs r0, r1
	strb r0, [r4]
	bl sub_8059BF4
	adds r0, r5, 0
	movs r1, 0x39
	bl FieldObjectSetSpecialAnim
	ldrh r0, [r6, 0x8]
	adds r0, 0x1
	strh r0, [r6, 0x8]
_08089478:
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_08089480: .4byte gPlayerAvatar
_08089484: .4byte gMapObjects
_08089488: .4byte gSprites
	thumb_func_end sub_8089414

	thumb_func_start sub_808948C
sub_808948C: @ 808948C
	push {r4,lr}
	adds r4, r0, 0
	ldr r0, _080894BC @ =gPlayerAvatar
	ldrb r1, [r0, 0x5]
	lsls r0, r1, 3
	adds r0, r1
	lsls r0, 2
	ldr r1, _080894C0 @ =gMapObjects
	adds r0, r1
	bl FieldObjectClearAnimIfSpecialAnimFinished
	lsls r0, 24
	cmp r0, 0
	beq _080894B4
	ldrh r0, [r4, 0x8]
	adds r0, 0x1
	strh r0, [r4, 0x8]
	ldrb r0, [r4, 0xA]
	bl sub_8089230
_080894B4:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080894BC: .4byte gPlayerAvatar
_080894C0: .4byte gMapObjects
	thumb_func_end sub_808948C

	thumb_func_start sub_80894C4
sub_80894C4: @ 80894C4
	push {r4,lr}
	adds r4, r0, 0
	ldrb r0, [r4, 0xA]
	bl sub_8088FA4
	lsls r0, 24
	cmp r0, 0
	beq _080894F0
	movs r0, 0xA
	ldrsh r1, [r4, r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	ldr r1, _080894F8 @ =gSprites
	adds r0, r1
	bl DestroySprite
	ldrh r0, [r4, 0x8]
	adds r0, 0x1
	strh r0, [r4, 0x8]
	movs r0, 0x10
	strh r0, [r4, 0xA]
_080894F0:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080894F8: .4byte gSprites
	thumb_func_end sub_80894C4

	thumb_func_start fishE
fishE: @ 80894FC
	push {r4-r7,lr}
	adds r5, r0, 0
	ldrh r0, [r5, 0xA]
	subs r0, 0x1
	strh r0, [r5, 0xA]
	lsls r0, 16
	cmp r0, 0
	bne _08089566
	ldr r6, _0808956C @ =gPlayerAvatar
	ldrb r1, [r6, 0x5]
	lsls r0, r1, 3
	adds r0, r1
	lsls r0, 2
	ldr r1, _08089570 @ =gMapObjects
	adds r4, r0, r1
	movs r7, 0
	ldrh r1, [r5, 0x26]
	movs r0, 0x8
	ands r0, r1
	cmp r0, 0
	beq _08089530
	movs r7, 0x3
	ldrb r0, [r4, 0x1A]
	movs r1, 0x1
	bl sub_8127ED0
_08089530:
	adds r0, r7, 0
	bl GetPlayerAvatarGraphicsIdByStateId
	adds r1, r0, 0
	lsls r1, 24
	lsrs r1, 24
	adds r0, r4, 0
	bl sub_805B980
	adds r0, r4, 0
	movs r1, 0x1
	bl FieldObjectTurn
	ldrh r0, [r5, 0x26]
	strb r0, [r6]
	movs r0, 0
	strb r0, [r6, 0x6]
	movs r0, 0x20
	bl FieldEffectActiveListRemove
	ldr r0, _08089574 @ =sub_8089270
	bl FindTaskIdByFunc
	lsls r0, 24
	lsrs r0, 24
	bl DestroyTask
_08089566:
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_0808956C: .4byte gPlayerAvatar
_08089570: .4byte gMapObjects
_08089574: .4byte sub_8089270
	thumb_func_end fishE

	.align 2, 0 @ Don't pad with nop.
