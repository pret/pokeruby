	.include "constants/gba_constants.s"
	.include "constants/species_constants.s"
	.include "asm/macros.s"

	.syntax unified

	.text

	thumb_func_start unref_sub_80B4884
unref_sub_80B4884: @ 80B4884
	push {lr}
	sub sp, 0x4
	mov r1, sp
	movs r0, 0
	strh r0, [r1]
	ldr r1, _080B48A0 @ =gSaveBlock1 + 0x3160
	ldr r2, _080B48A4 @ =0x01000298
	mov r0, sp
	bl CpuSet
	add sp, 0x4
	pop {r0}
	bx r0
	.align 2, 0
_080B48A0: .4byte gSaveBlock1 + 0x3160
_080B48A4: .4byte 0x01000298
	thumb_func_end unref_sub_80B4884

	thumb_func_start sub_80B48A8
sub_80B48A8: @ 80B48A8
	push {r4-r6,lr}
	adds r5, r0, 0
	ldr r3, _080B48E0 @ =gSaveBlock1 + 0x3160
	movs r2, 0
	ldr r6, _080B48E4 @ =0x0000052f
	ldr r0, _080B48E8 @ =0xffffcea0
	adds r4, r3, r0
_080B48B6:
	adds r0, r3, r2
	adds r1, r5, r2
	ldrb r1, [r1]
	strb r1, [r0]
	adds r2, 0x1
	cmp r2, r6
	bls _080B48B6
	ldr r2, _080B48EC @ =0x0000316c
	adds r1, r4, r2
	ldr r2, _080B48F0 @ =0x0000361c
	adds r0, r4, r2
	str r0, [r1]
	ldr r0, _080B48F4 @ =0x00003170
	adds r1, r4, r0
	adds r2, 0x2D
	adds r0, r4, r2
	str r0, [r1]
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_080B48E0: .4byte gSaveBlock1 + 0x3160
_080B48E4: .4byte 0x0000052f
_080B48E8: .4byte 0xffffcea0
_080B48EC: .4byte 0x0000316c
_080B48F0: .4byte 0x0000361c
_080B48F4: .4byte 0x00003170
	thumb_func_end sub_80B48A8

	thumb_func_start sub_80B48F8
sub_80B48F8: @ 80B48F8
	push {r4-r7,lr}
	ldr r3, _080B4934 @ =gSaveBlock1
	ldr r1, _080B4938 @ =0x0000316c
	adds r4, r3, r1
	ldr r6, [r4]
	adds r1, 0x4
	adds r2, r3, r1
	ldr r7, [r2]
	movs r1, 0
	str r1, [r4]
	str r1, [r2]
	adds r4, r0, 0
	movs r2, 0
	ldr r5, _080B493C @ =0x0000052b
_080B4914:
	adds r0, r4, r1
	ldrb r0, [r0]
	adds r2, r0
	adds r1, 0x1
	cmp r1, r5
	bls _080B4914
	ldr r1, _080B4938 @ =0x0000316c
	adds r0, r3, r1
	str r6, [r0]
	adds r1, 0x4
	adds r0, r3, r1
	str r7, [r0]
	adds r0, r2, 0
	pop {r4-r7}
	pop {r1}
	bx r1
	.align 2, 0
_080B4934: .4byte gSaveBlock1
_080B4938: .4byte 0x0000316c
_080B493C: .4byte 0x0000052b
	thumb_func_end sub_80B48F8

	thumb_func_start sub_80B4940
sub_80B4940: @ 80B4940
	push {r4,lr}
	ldr r4, _080B4970 @ =gSaveBlock1
	ldr r1, _080B4974 @ =0x00003174
	adds r0, r4, r1
	ldrb r0, [r0]
	cmp r0, 0
	beq _080B4984
	ldr r2, _080B4978 @ =0x0000316a
	adds r0, r4, r2
	ldrb r0, [r0]
	cmp r0, 0
	beq _080B4984
	ldr r1, _080B497C @ =0x00003160
	adds r0, r4, r1
	bl sub_80B48F8
	ldr r2, _080B4980 @ =0x0000368c
	adds r1, r4, r2
	ldr r1, [r1]
	cmp r0, r1
	bne _080B4984
	movs r0, 0x1
	b _080B4986
	.align 2, 0
_080B4970: .4byte gSaveBlock1
_080B4974: .4byte 0x00003174
_080B4978: .4byte 0x0000316a
_080B497C: .4byte 0x00003160
_080B4980: .4byte 0x0000368c
_080B4984:
	movs r0, 0
_080B4986:
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end sub_80B4940

	thumb_func_start GetBerryInfo
GetBerryInfo: @ 80B498C
	push {r4,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	cmp r4, 0x2B
	bne _080B49A8
	bl sub_80B4940
	cmp r0, 0
	beq _080B49A8
	ldr r0, _080B49A4 @ =gSaveBlock1 + 0x3160
	b _080B49BE
	.align 2, 0
_080B49A4: .4byte gSaveBlock1 + 0x3160
_080B49A8:
	subs r0, r4, 0x1
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x2A
	bls _080B49B4
	movs r4, 0x1
_080B49B4:
	lsls r0, r4, 3
	subs r0, r4
	lsls r0, 2
	ldr r1, _080B49C4 @ =gBerries - 0x1C
	adds r0, r1
_080B49BE:
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_080B49C4: .4byte gBerries - 0x1C
	thumb_func_end GetBerryInfo

	thumb_func_start GetBerryTreeInfo
GetBerryTreeInfo: @ 80B49C8
	lsls r0, 24
	lsrs r0, 21
	ldr r1, _080B49D4 @ =gSaveBlock1 + 0x1608
	adds r0, r1
	bx lr
	.align 2, 0
_080B49D4: .4byte gSaveBlock1 + 0x1608
	thumb_func_end GetBerryTreeInfo

	thumb_func_start FieldObjectInteractionWaterBerryTree
FieldObjectInteractionWaterBerryTree: @ 80B49D8
	push {lr}
	ldr r0, _080B4A00 @ =gSelectedMapObject
	ldrb r0, [r0]
	bl FieldObjectGetBerryTreeId
	lsls r0, 24
	lsrs r0, 24
	bl GetBerryTreeInfo
	adds r2, r0, 0
	ldrb r0, [r2, 0x1]
	lsls r0, 25
	lsrs r0, 25
	cmp r0, 0x2
	beq _080B4A14
	cmp r0, 0x2
	bgt _080B4A04
	cmp r0, 0x1
	beq _080B4A0E
	b _080B4A2A
	.align 2, 0
_080B4A00: .4byte gSelectedMapObject
_080B4A04:
	cmp r0, 0x3
	beq _080B4A1A
	cmp r0, 0x4
	beq _080B4A20
	b _080B4A2A
_080B4A0E:
	ldrb r0, [r2, 0x5]
	movs r1, 0x10
	b _080B4A24
_080B4A14:
	ldrb r0, [r2, 0x5]
	movs r1, 0x20
	b _080B4A24
_080B4A1A:
	ldrb r0, [r2, 0x5]
	movs r1, 0x40
	b _080B4A24
_080B4A20:
	ldrb r0, [r2, 0x5]
	movs r1, 0x80
_080B4A24:
	orrs r0, r1
	strb r0, [r2, 0x5]
	b _080B4A2E
_080B4A2A:
	movs r0, 0
	b _080B4A30
_080B4A2E:
	movs r0, 0x1
_080B4A30:
	pop {r1}
	bx r1
	thumb_func_end FieldObjectInteractionWaterBerryTree

	thumb_func_start IsPlayerFacingPlantedBerryTree
IsPlayerFacingPlantedBerryTree: @ 80B4A34
	push {lr}
	bl GetFieldObjectScriptPointerForComparison
	ldr r1, _080B4A5C @ =BerryTreeScript
	cmp r0, r1
	bne _080B4A64
	ldr r0, _080B4A60 @ =gSelectedMapObject
	ldrb r0, [r0]
	bl FieldObjectGetBerryTreeId
	lsls r0, 24
	lsrs r0, 24
	bl GetStageByBerryTreeId
	lsls r0, 24
	cmp r0, 0
	bne _080B4A64
	movs r0, 0x1
	b _080B4A66
	.align 2, 0
_080B4A5C: .4byte BerryTreeScript
_080B4A60: .4byte gSelectedMapObject
_080B4A64:
	movs r0, 0
_080B4A66:
	pop {r1}
	bx r1
	thumb_func_end IsPlayerFacingPlantedBerryTree

	thumb_func_start WaterBerryTree
WaterBerryTree: @ 80B4A6C
	push {lr}
	bl GetFieldObjectScriptPointerForComparison
	ldr r1, _080B4A84 @ =BerryTreeScript
	cmp r0, r1
	bne _080B4A88
	bl FieldObjectInteractionWaterBerryTree
	lsls r0, 24
	lsrs r0, 24
	b _080B4A8A
	.align 2, 0
_080B4A84: .4byte BerryTreeScript
_080B4A88:
	movs r0, 0
_080B4A8A:
	pop {r1}
	bx r1
	thumb_func_end WaterBerryTree

	thumb_func_start sub_80B4A90
sub_80B4A90: @ 80B4A90
	push {r4,lr}
	ldr r1, _080B4AB4 @ =gSaveBlock1
	ldr r0, _080B4AB8 @ =gUnknown_083CD780
	ldr r3, [r0]
	ldr r4, [r0, 0x4]
	movs r2, 0x7F
	movs r0, 0xD0
	lsls r0, 5
	adds r1, r0
_080B4AA2:
	str r3, [r1]
	str r4, [r1, 0x4]
	subs r1, 0x8
	subs r2, 0x1
	cmp r2, 0
	bge _080B4AA2
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080B4AB4: .4byte gSaveBlock1
_080B4AB8: .4byte gUnknown_083CD780
	thumb_func_end sub_80B4A90

	thumb_func_start BerryTreeGrow
BerryTreeGrow: @ 80B4ABC
	push {r4,lr}
	adds r4, r0, 0
	ldrb r1, [r4, 0x1]
	movs r0, 0x80
	ands r0, r1
	cmp r0, 0
	beq _080B4ACE
_080B4ACA:
	movs r0, 0
	b _080B4B5A
_080B4ACE:
	lsls r0, r1, 25
	lsrs r0, 25
	cmp r0, 0x5
	bhi _080B4B58
	lsls r0, 2
	ldr r1, _080B4AE0 @ =_080B4AE4
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_080B4AE0: .4byte _080B4AE4
	.align 2, 0
_080B4AE4:
	.4byte _080B4ACA
	.4byte _080B4B04
	.4byte _080B4B04
	.4byte _080B4B04
	.4byte _080B4AFC
	.4byte _080B4B1C
_080B4AFC:
	adds r0, r4, 0
	bl CalcBerryYield
	strb r0, [r4, 0x4]
_080B4B04:
	ldrb r2, [r4, 0x1]
	lsls r1, r2, 25
	lsrs r1, 25
	adds r1, 0x1
	movs r0, 0x7F
	ands r1, r0
	movs r0, 0x80
	negs r0, r0
	ands r0, r2
	orrs r0, r1
	strb r0, [r4, 0x1]
	b _080B4B58
_080B4B1C:
	ldrb r0, [r4, 0x5]
	movs r1, 0x11
	negs r1, r1
	ands r1, r0
	movs r0, 0x21
	negs r0, r0
	ands r1, r0
	subs r0, 0x20
	ands r1, r0
	movs r0, 0x7F
	ands r1, r0
	movs r0, 0
	strb r0, [r4, 0x4]
	ldrb r2, [r4, 0x1]
	subs r0, 0x80
	ands r0, r2
	movs r2, 0x2
	orrs r0, r2
	strb r0, [r4, 0x1]
	adds r1, 0x1
	movs r0, 0xF
	ands r1, r0
	strb r1, [r4, 0x5]
	cmp r1, 0xA
	bne _080B4B58
	ldr r0, _080B4B60 @ =gUnknown_083CD780
	ldr r1, [r0, 0x4]
	ldr r0, [r0]
	str r0, [r4]
	str r1, [r4, 0x4]
_080B4B58:
	movs r0, 0x1
_080B4B5A:
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_080B4B60: .4byte gUnknown_083CD780
	thumb_func_end BerryTreeGrow

	thumb_func_start BerryTreeTimeUpdate
BerryTreeTimeUpdate: @ 80B4B64
	push {r4-r7,lr}
	adds r6, r0, 0
	movs r2, 0
_080B4B6A:
	lsls r0, r2, 3
	ldr r1, _080B4BAC @ =gSaveBlock1 + 0x1608
	adds r4, r0, r1
	ldrb r0, [r4]
	adds r7, r2, 0x1
	cmp r0, 0
	beq _080B4BF8
	ldrb r1, [r4, 0x1]
	movs r0, 0x7F
	ands r0, r1
	cmp r0, 0
	beq _080B4BF8
	movs r0, 0x80
	ands r0, r1
	cmp r0, 0
	bne _080B4BF8
	ldrb r0, [r4]
	bl GetStageDurationByBerryType
	lsls r0, 16
	lsrs r0, 16
	lsls r1, r0, 3
	adds r1, r0
	lsls r1, 3
	subs r1, r0
	cmp r6, r1
	blt _080B4BB4
	ldr r0, _080B4BB0 @ =gUnknown_083CD780
	ldr r1, [r0, 0x4]
	ldr r0, [r0]
	str r0, [r4]
	str r1, [r4, 0x4]
	b _080B4BF8
	.align 2, 0
_080B4BAC: .4byte gSaveBlock1 + 0x1608
_080B4BB0: .4byte gUnknown_083CD780
_080B4BB4:
	adds r5, r6, 0
	cmp r5, 0
	beq _080B4BF8
	ldrh r1, [r4, 0x2]
	cmp r1, r5
	ble _080B4BC4
	subs r0, r1, r5
	b _080B4BF6
_080B4BC4:
	subs r5, r1
	ldrb r0, [r4]
	bl GetStageDurationByBerryType
	strh r0, [r4, 0x2]
	adds r0, r4, 0
	bl BerryTreeGrow
	cmp r0, 0
	beq _080B4BF8
	ldrb r1, [r4, 0x1]
	movs r0, 0x7F
	ands r0, r1
	cmp r0, 0x5
	bne _080B4BE8
	ldrh r0, [r4, 0x2]
	lsls r0, 2
	strh r0, [r4, 0x2]
_080B4BE8:
	cmp r5, 0
	beq _080B4BF8
	ldrh r0, [r4, 0x2]
	adds r1, r0, 0
	cmp r0, r5
	ble _080B4BC4
	subs r0, r5
_080B4BF6:
	strh r0, [r4, 0x2]
_080B4BF8:
	adds r2, r7, 0
	cmp r2, 0x7F
	ble _080B4B6A
	pop {r4-r7}
	pop {r0}
	bx r0
	thumb_func_end BerryTreeTimeUpdate

	thumb_func_start PlantBerryTree
PlantBerryTree: @ 80B4C04
	push {r4-r7,lr}
	adds r4, r1, 0
	adds r5, r2, 0
	lsls r0, 24
	lsrs r0, 24
	lsls r4, 24
	lsrs r4, 24
	lsls r5, 24
	lsrs r5, 24
	lsls r3, 24
	lsrs r7, r3, 24
	bl GetBerryTreeInfo
	adds r6, r0, 0
	ldr r0, _080B4C68 @ =gUnknown_083CD780
	ldr r1, [r0, 0x4]
	ldr r0, [r0]
	str r0, [r6]
	str r1, [r6, 0x4]
	strb r4, [r6]
	adds r0, r4, 0
	bl GetStageDurationByBerryType
	strh r0, [r6, 0x2]
	movs r1, 0x7F
	ands r1, r5
	ldrb r2, [r6, 0x1]
	movs r0, 0x80
	negs r0, r0
	ands r0, r2
	orrs r0, r1
	strb r0, [r6, 0x1]
	cmp r5, 0x5
	bne _080B4C56
	adds r0, r6, 0
	bl CalcBerryYield
	strb r0, [r6, 0x4]
	ldrh r0, [r6, 0x2]
	lsls r0, 2
	strh r0, [r6, 0x2]
_080B4C56:
	cmp r7, 0
	bne _080B4C62
	ldrb r0, [r6, 0x1]
	movs r1, 0x80
	orrs r0, r1
	strb r0, [r6, 0x1]
_080B4C62:
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080B4C68: .4byte gUnknown_083CD780
	thumb_func_end PlantBerryTree

	thumb_func_start RemoveBerryTree
RemoveBerryTree: @ 80B4C6C
	lsls r0, 24
	ldr r1, _080B4C84 @ =gSaveBlock1
	lsrs r0, 21
	ldr r2, _080B4C88 @ =0x00001608
	adds r1, r2
	adds r0, r1
	ldr r1, _080B4C8C @ =gUnknown_083CD780
	ldr r2, [r1, 0x4]
	ldr r1, [r1]
	str r1, [r0]
	str r2, [r0, 0x4]
	bx lr
	.align 2, 0
_080B4C84: .4byte gSaveBlock1
_080B4C88: .4byte 0x00001608
_080B4C8C: .4byte gUnknown_083CD780
	thumb_func_end RemoveBerryTree

	thumb_func_start GetBerryTypeByBerryTreeId
GetBerryTypeByBerryTreeId: @ 80B4C90
	lsls r0, 24
	ldr r1, _080B4CA0 @ =gSaveBlock1
	lsrs r0, 21
	adds r0, r1
	ldr r1, _080B4CA4 @ =0x00001608
	adds r0, r1
	ldrb r0, [r0]
	bx lr
	.align 2, 0
_080B4CA0: .4byte gSaveBlock1
_080B4CA4: .4byte 0x00001608
	thumb_func_end GetBerryTypeByBerryTreeId

	thumb_func_start GetStageByBerryTreeId
GetStageByBerryTreeId: @ 80B4CA8
	lsls r0, 24
	ldr r1, _080B4CBC @ =gSaveBlock1
	lsrs r0, 21
	adds r0, r1
	ldr r1, _080B4CC0 @ =0x00001609
	adds r0, r1
	ldrb r0, [r0]
	lsls r0, 25
	lsrs r0, 25
	bx lr
	.align 2, 0
_080B4CBC: .4byte gSaveBlock1
_080B4CC0: .4byte 0x00001609
	thumb_func_end GetStageByBerryTreeId

	thumb_func_start ItemIdToBerryType
ItemIdToBerryType: @ 80B4CC4
	push {lr}
	lsls r0, 16
	lsrs r1, r0, 16
	ldr r2, _080B4CE0 @ =0xff7b0000
	adds r0, r2
	lsrs r0, 16
	cmp r0, 0x2A
	bhi _080B4CE4
	adds r0, r1, 0
	adds r0, 0x7C
	lsls r0, 24
	lsrs r0, 24
	b _080B4CE6
	.align 2, 0
_080B4CE0: .4byte 0xff7b0000
_080B4CE4:
	movs r0, 0x1
_080B4CE6:
	pop {r1}
	bx r1
	thumb_func_end ItemIdToBerryType

	thumb_func_start BerryTypeToItemId
BerryTypeToItemId: @ 80B4CEC
	push {lr}
	lsls r0, 16
	lsrs r1, r0, 16
	ldr r2, _080B4D08 @ =0xffff0000
	adds r0, r2
	lsrs r0, 16
	cmp r0, 0x2A
	bhi _080B4D0C
	adds r0, r1, 0
	adds r0, 0x84
	lsls r0, 16
	lsrs r0, 16
	b _080B4D0E
	.align 2, 0
_080B4D08: .4byte 0xffff0000
_080B4D0C:
	movs r0, 0x85
_080B4D0E:
	pop {r1}
	bx r1
	thumb_func_end BerryTypeToItemId

	thumb_func_start GetBerryNameByBerryType
GetBerryNameByBerryType: @ 80B4D14
	push {r4,lr}
	adds r4, r1, 0
	lsls r0, 24
	lsrs r0, 24
	bl GetBerryInfo
	adds r1, r0, 0
	adds r0, r4, 0
	movs r2, 0x6
	bl memcpy
	movs r0, 0xFF
	strb r0, [r4, 0x6]
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end GetBerryNameByBerryType

	thumb_func_start ResetBerryTreeSparkleFlag
ResetBerryTreeSparkleFlag: @ 80B4D34
	push {lr}
	lsls r0, 24
	lsrs r0, 24
	bl GetBerryTreeInfo
	ldrb r2, [r0, 0x1]
	movs r1, 0x7F
	ands r1, r2
	strb r1, [r0, 0x1]
	pop {r0}
	bx r0
	thumb_func_end ResetBerryTreeSparkleFlag

	thumb_func_start BerryTreeGetNumStagesWatered
BerryTreeGetNumStagesWatered: @ 80B4D4C
	push {lr}
	ldrb r2, [r0, 0x5]
	movs r0, 0x10
	ands r0, r2
	lsls r0, 24
	lsrs r0, 24
	negs r0, r0
	lsrs r1, r0, 31
	movs r0, 0x20
	ands r0, r2
	cmp r0, 0
	beq _080B4D66
	adds r1, 0x1
_080B4D66:
	movs r0, 0x40
	ands r0, r2
	cmp r0, 0
	beq _080B4D74
	adds r0, r1, 0x1
	lsls r0, 24
	lsrs r1, r0, 24
_080B4D74:
	movs r0, 0x80
	ands r0, r2
	cmp r0, 0
	beq _080B4D82
	adds r0, r1, 0x1
	lsls r0, 24
	lsrs r1, r0, 24
_080B4D82:
	adds r0, r1, 0
	pop {r1}
	bx r1
	thumb_func_end BerryTreeGetNumStagesWatered

	thumb_func_start GetNumStagesWateredByBerryTreeId
GetNumStagesWateredByBerryTreeId: @ 80B4D88
	push {lr}
	lsls r0, 24
	lsrs r0, 24
	bl GetBerryTreeInfo
	bl BerryTreeGetNumStagesWatered
	lsls r0, 24
	lsrs r0, 24
	pop {r1}
	bx r1
	thumb_func_end GetNumStagesWateredByBerryTreeId

	thumb_func_start CalcBerryYieldInternal
CalcBerryYieldInternal: @ 80B4DA0
	push {r4-r6,lr}
	lsls r0, 16
	lsrs r0, 16
	lsls r1, 16
	lsrs r6, r1, 16
	lsls r2, 24
	lsrs r2, 24
	cmp r2, 0
	bne _080B4DB6
	lsls r0, r6, 24
	b _080B4DEA
_080B4DB6:
	subs r1, r0, r6
	subs r0, r2, 0x1
	adds r5, r1, 0
	muls r5, r0
	adds r4, r1, 0
	muls r4, r2
	bl Random
	lsls r0, 16
	lsrs r0, 16
	subs r4, r5
	adds r4, 0x1
	adds r1, r4, 0
	bl __umodsi3
	adds r5, r0
	movs r0, 0x3
	ands r0, r5
	cmp r0, 0x1
	bls _080B4DE4
	lsrs r0, r5, 2
	adds r0, 0x1
	b _080B4DE6
_080B4DE4:
	lsrs r0, r5, 2
_080B4DE6:
	adds r0, r6
	lsls r0, 24
_080B4DEA:
	lsrs r0, 24
	pop {r4-r6}
	pop {r1}
	bx r1
	thumb_func_end CalcBerryYieldInternal

	thumb_func_start CalcBerryYield
CalcBerryYield: @ 80B4DF4
	push {r4-r6,lr}
	adds r4, r0, 0
	ldrb r0, [r4]
	bl GetBerryInfo
	ldrb r6, [r0, 0xB]
	ldrb r5, [r0, 0xA]
	adds r0, r4, 0
	bl BerryTreeGetNumStagesWatered
	adds r2, r0, 0
	lsls r2, 24
	lsrs r2, 24
	adds r0, r5, 0
	adds r1, r6, 0
	bl CalcBerryYieldInternal
	lsls r0, 24
	lsrs r0, 24
	pop {r4-r6}
	pop {r1}
	bx r1
	thumb_func_end CalcBerryYield

	thumb_func_start GetBerryCountByBerryTreeId
GetBerryCountByBerryTreeId: @ 80B4E20
	lsls r0, 24
	ldr r1, _080B4E30 @ =gSaveBlock1
	lsrs r0, 21
	adds r0, r1
	ldr r1, _080B4E34 @ =0x0000160c
	adds r0, r1
	ldrb r0, [r0]
	bx lr
	.align 2, 0
_080B4E30: .4byte gSaveBlock1
_080B4E34: .4byte 0x0000160c
	thumb_func_end GetBerryCountByBerryTreeId

	thumb_func_start GetStageDurationByBerryType
GetStageDurationByBerryType: @ 80B4E38
	push {lr}
	lsls r0, 24
	lsrs r0, 24
	bl GetBerryInfo
	ldrb r1, [r0, 0x14]
	lsls r0, r1, 4
	subs r0, r1
	lsls r0, 18
	lsrs r0, 16
	pop {r1}
	bx r1
	thumb_func_end GetStageDurationByBerryType

	thumb_func_start FieldObjectInteractionGetBerryTreeData
FieldObjectInteractionGetBerryTreeData: @ 80B4E50
	push {r4-r6,lr}
	ldr r0, _080B4E8C @ =gSelectedMapObject
	ldrb r0, [r0]
	bl FieldObjectGetBerryTreeId
	lsls r0, 24
	lsrs r5, r0, 24
	adds r0, r5, 0
	bl GetBerryTypeByBerryTreeId
	lsls r0, 24
	lsrs r6, r0, 24
	adds r0, r5, 0
	bl ResetBerryTreeSparkleFlag
	ldr r0, _080B4E90 @ =gUnknown_0202E8DE
	ldrb r0, [r0]
	ldr r2, _080B4E94 @ =gSaveBlock1
	ldrb r1, [r2, 0x5]
	ldrb r2, [r2, 0x4]
	bl sub_8060234
	lsls r0, 24
	cmp r0, 0
	beq _080B4E9C
	ldr r1, _080B4E98 @ =gUnknown_0202E8CC
	movs r0, 0xFF
	strh r0, [r1]
	b _080B4EAA
	.align 2, 0
_080B4E8C: .4byte gSelectedMapObject
_080B4E90: .4byte gUnknown_0202E8DE
_080B4E94: .4byte gSaveBlock1
_080B4E98: .4byte gUnknown_0202E8CC
_080B4E9C:
	ldr r4, _080B4ED4 @ =gUnknown_0202E8CC
	adds r0, r5, 0
	bl GetStageByBerryTreeId
	lsls r0, 24
	lsrs r0, 24
	strh r0, [r4]
_080B4EAA:
	ldr r4, _080B4ED8 @ =gUnknown_0202E8CE
	adds r0, r5, 0
	bl GetNumStagesWateredByBerryTreeId
	lsls r0, 24
	lsrs r0, 24
	strh r0, [r4]
	ldr r4, _080B4EDC @ =gUnknown_0202E8D0
	adds r0, r5, 0
	bl GetBerryCountByBerryTreeId
	lsls r0, 24
	lsrs r0, 24
	strh r0, [r4]
	ldr r1, _080B4EE0 @ =gStringVar1
	adds r0, r6, 0
	bl GetBerryNameByBerryType
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_080B4ED4: .4byte gUnknown_0202E8CC
_080B4ED8: .4byte gUnknown_0202E8CE
_080B4EDC: .4byte gUnknown_0202E8D0
_080B4EE0: .4byte gStringVar1
	thumb_func_end FieldObjectInteractionGetBerryTreeData

	thumb_func_start sub_80B4EE4
sub_80B4EE4: @ 80B4EE4
	push {lr}
	ldr r0, _080B4EF0 @ =sub_80A68CC
	bl SetMainCallback2
	pop {r0}
	bx r0
	.align 2, 0
_080B4EF0: .4byte sub_80A68CC
	thumb_func_end sub_80B4EE4

	thumb_func_start FieldObjectInteractionPlantBerryTree
FieldObjectInteractionPlantBerryTree: @ 80B4EF4
	push {r4,lr}
	ldr r0, _080B4F24 @ =word_203855E
	ldrh r0, [r0]
	bl ItemIdToBerryType
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	ldr r0, _080B4F28 @ =gSelectedMapObject
	ldrb r0, [r0]
	bl FieldObjectGetBerryTreeId
	lsls r0, 24
	lsrs r0, 24
	adds r1, r4, 0
	movs r2, 0x1
	movs r3, 0x1
	bl PlantBerryTree
	bl FieldObjectInteractionGetBerryTreeData
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080B4F24: .4byte word_203855E
_080B4F28: .4byte gSelectedMapObject
	thumb_func_end FieldObjectInteractionPlantBerryTree

	thumb_func_start FieldObjectInteractionPickBerryTree
FieldObjectInteractionPickBerryTree: @ 80B4F2C
	push {r4-r6,lr}
	ldr r0, _080B4F70 @ =gSelectedMapObject
	ldrb r0, [r0]
	bl FieldObjectGetBerryTreeId
	adds r5, r0, 0
	lsls r5, 24
	lsrs r5, 24
	adds r0, r5, 0
	bl GetBerryTypeByBerryTreeId
	lsls r0, 24
	lsrs r0, 24
	ldr r6, _080B4F74 @ =gUnknown_0202E8CC
	bl BerryTypeToItemId
	adds r4, r0, 0
	lsls r4, 16
	lsrs r4, 16
	adds r0, r5, 0
	bl GetBerryCountByBerryTreeId
	adds r1, r0, 0
	lsls r1, 24
	lsrs r1, 24
	adds r0, r4, 0
	bl sub_80A9424
	lsls r0, 24
	lsrs r0, 24
	strh r0, [r6]
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_080B4F70: .4byte gSelectedMapObject
_080B4F74: .4byte gUnknown_0202E8CC
	thumb_func_end FieldObjectInteractionPickBerryTree

	thumb_func_start FieldObjectInteractionRemoveBerryTree
FieldObjectInteractionRemoveBerryTree: @ 80B4F78
	push {lr}
	ldr r0, _080B4F9C @ =gSelectedMapObject
	ldrb r0, [r0]
	bl FieldObjectGetBerryTreeId
	lsls r0, 24
	lsrs r0, 24
	bl RemoveBerryTree
	ldr r0, _080B4FA0 @ =gUnknown_0202E8DE
	ldrb r0, [r0]
	ldr r2, _080B4FA4 @ =gSaveBlock1
	ldrb r1, [r2, 0x5]
	ldrb r2, [r2, 0x4]
	bl sub_8060288
	pop {r0}
	bx r0
	.align 2, 0
_080B4F9C: .4byte gSelectedMapObject
_080B4FA0: .4byte gUnknown_0202E8DE
_080B4FA4: .4byte gSaveBlock1
	thumb_func_end FieldObjectInteractionRemoveBerryTree

	thumb_func_start PlayerHasBerries
PlayerHasBerries: @ 80B4FA8
	push {lr}
	movs r0, 0x4
	bl IsBagPocketNonEmpty
	lsls r0, 24
	lsrs r0, 24
	pop {r1}
	bx r1
	thumb_func_end PlayerHasBerries

	thumb_func_start ResetBerryTreeSparkleFlags
ResetBerryTreeSparkleFlags: @ 80B4FB8
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	sub sp, 0x4
	mov r4, sp
	adds r4, 0x2
	mov r0, sp
	adds r1, r4, 0
	bl GetCameraCoords
	mov r0, sp
	ldrh r2, [r0]
	ldrh r1, [r4]
	adds r1, 0x3
	adds r3, r2, 0
	adds r3, 0xE
	lsls r1, 16
	movs r5, 0x80
	lsls r5, 12
	adds r0, r1, r5
	lsrs r0, 16
	mov r10, r0
	mov r5, sp
	lsls r2, 16
	asrs r2, 16
	mov r9, r2
	ldr r4, _080B5050 @ =gMapObjects
	lsls r3, 16
	asrs r3, 16
	mov r8, r3
	asrs r7, r1, 16
	movs r6, 0xF
_080B4FFC:
	ldrb r0, [r4]
	lsls r0, 31
	cmp r0, 0
	beq _080B5038
	ldrb r0, [r4, 0x6]
	cmp r0, 0xC
	bne _080B5038
	ldrh r0, [r4, 0x10]
	strh r0, [r5]
	ldrh r0, [r4, 0x12]
	mov r1, sp
	strh r0, [r1, 0x2]
	movs r2, 0
	ldrsh r1, [r5, r2]
	cmp r9, r1
	bgt _080B5038
	cmp r1, r8
	bgt _080B5038
	lsls r0, 16
	asrs r1, r0, 16
	cmp r7, r1
	bgt _080B5038
	mov r2, r10
	lsls r0, r2, 16
	asrs r0, 16
	cmp r1, r0
	bgt _080B5038
	ldrb r0, [r4, 0x1D]
	bl ResetBerryTreeSparkleFlag
_080B5038:
	adds r4, 0x24
	subs r6, 0x1
	cmp r6, 0
	bge _080B4FFC
	add sp, 0x4
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080B5050: .4byte gMapObjects
	thumb_func_end ResetBerryTreeSparkleFlags

	.align 2, 0 @ Don't pad with nop.
