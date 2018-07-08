	.include "constants/gba_constants.inc"
	.include "include/macros.inc"

	.syntax unified

	.text

	@ water

	thumb_func_start sub_80D3B60
sub_80D3B60: @ 80D3B60
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	sub sp, 0x18
	lsls r0, 24
	lsrs r7, r0, 24
	ldr r0, _080D3D44 @ =gTasks
	lsls r4, r7, 2
	adds r4, r7
	lsls r4, 3
	adds r4, r0
	ldrh r0, [r4, 0x8]
	ldr r1, _080D3D48 @ =gBattle_BG1_X
	ldrh r1, [r1]
	adds r0, r1
	ldr r2, _080D3D48 @ =gBattle_BG1_X
	strh r0, [r2]
	ldrh r0, [r4, 0xA]
	ldr r3, _080D3D4C @ =gBattle_BG1_Y
	ldrh r3, [r3]
	adds r0, r3
	ldr r1, _080D3D4C @ =gBattle_BG1_Y
	strh r0, [r1]
	add r5, sp, 0x4
	adds r0, r5, 0
	bl sub_8078914
	ldrh r0, [r4, 0xA]
	ldrh r2, [r4, 0xC]
	adds r0, r2
	strh r0, [r4, 0xC]
	ldrh r0, [r4, 0x12]
	adds r0, 0x1
	strh r0, [r4, 0x12]
	lsls r0, 16
	asrs r0, 16
	mov r10, r5
	cmp r0, 0x4
	bne _080D3C02
	ldr r1, _080D3D50 @ =gPlttBufferFaded
	ldrb r0, [r5, 0x8]
	lsls r0, 4
	adds r0, 0x7
	lsls r0, 1
	adds r0, r1
	ldrh r6, [r0]
	movs r2, 0x6
	adds r5, r1, 0
	adds r3, r5, 0
	mov r4, r10
_080D3BC8:
	ldrb r0, [r4, 0x8]
	lsls r0, 4
	adds r1, r2, 0x1
	adds r0, r1
	lsls r1, r0, 1
	adds r1, r3
	subs r0, 0x1
	lsls r0, 1
	adds r0, r3
	ldrh r0, [r0]
	strh r0, [r1]
	subs r0, r2, 0x1
	lsls r0, 24
	lsrs r2, r0, 24
	cmp r2, 0
	bne _080D3BC8
	mov r3, r10
	ldrb r0, [r3, 0x8]
	lsls r0, 4
	adds r0, 0x1
	lsls r0, 1
	adds r0, r5
	strh r6, [r0]
	ldr r1, _080D3D44 @ =gTasks
	lsls r0, r7, 2
	adds r0, r7
	lsls r0, 3
	adds r0, r1
	strh r2, [r0, 0x12]
_080D3C02:
	ldr r1, _080D3D44 @ =gTasks
	lsls r2, r7, 2
	adds r0, r2, r7
	lsls r0, 3
	adds r3, r0, r1
	ldrh r0, [r3, 0x14]
	adds r0, 0x1
	strh r0, [r3, 0x14]
	lsls r0, 16
	asrs r0, 16
	adds r4, r1, 0
	str r2, [sp, 0x14]
	cmp r0, 0x1
	ble _080D3C70
	movs r0, 0
	strh r0, [r3, 0x14]
	ldrh r0, [r3, 0xE]
	adds r2, r0, 0x1
	strh r2, [r3, 0xE]
	lsls r0, r2, 16
	asrs r0, 16
	cmp r0, 0xD
	bgt _080D3C4C
	movs r1, 0x26
	ldrsh r0, [r3, r1]
	lsls r1, r0, 2
	adds r1, r0
	lsls r1, 3
	adds r1, r4
	movs r0, 0x10
	subs r0, r2
	lsls r0, 8
	orrs r2, r0
	strh r2, [r1, 0xA]
	ldrh r0, [r3, 0x10]
	adds r0, 0x1
	strh r0, [r3, 0x10]
_080D3C4C:
	movs r2, 0xE
	ldrsh r0, [r3, r2]
	cmp r0, 0x36
	ble _080D3C70
	ldrh r2, [r3, 0x10]
	subs r2, 0x1
	strh r2, [r3, 0x10]
	movs r1, 0x26
	ldrsh r0, [r3, r1]
	lsls r1, r0, 2
	adds r1, r0
	lsls r1, 3
	adds r1, r4
	movs r0, 0x10
	subs r0, r2
	lsls r0, 8
	orrs r2, r0
	strh r2, [r1, 0xA]
_080D3C70:
	ldr r2, [sp, 0x14]
	adds r0, r2, r7
	lsls r0, 3
	adds r0, r4
	movs r3, 0x26
	ldrsh r1, [r0, r3]
	lsls r0, r1, 2
	adds r0, r1
	lsls r0, 3
	adds r0, r4
	ldrh r1, [r0, 0xA]
	movs r0, 0x1F
	ands r0, r1
	cmp r0, 0
	bne _080D3D32
	ldr r2, [sp, 0x4]
	movs r3, 0x80
	lsls r3, 6
	add r6, sp, 0x10
	movs r5, 0
	ldr r1, _080D3D54 @ =0x040000d4
	movs r4, 0x80
	lsls r4, 5
	mov r8, r6
	ldr r0, _080D3D58 @ =0x85000400
	mov r12, r0
	movs r0, 0x85
	lsls r0, 24
	mov r9, r0
_080D3CAA:
	str r5, [sp, 0x10]
	mov r0, r8
	str r0, [r1]
	str r2, [r1, 0x4]
	mov r0, r12
	str r0, [r1, 0x8]
	ldr r0, [r1, 0x8]
	adds r2, r4
	subs r3, r4
	cmp r3, r4
	bhi _080D3CAA
	str r5, [sp, 0x10]
	str r6, [r1]
	str r2, [r1, 0x4]
	lsrs r0, r3, 2
	mov r2, r9
	orrs r0, r2
	str r0, [r1, 0x8]
	ldr r0, [r1, 0x8]
	mov r0, sp
	movs r1, 0
	strb r1, [r0]
	strb r1, [r0]
	mov r3, r10
	ldr r1, [r3, 0x4]
	movs r4, 0
	str r4, [sp, 0x10]
	ldr r0, _080D3D54 @ =0x040000d4
	str r6, [r0]
	str r1, [r0, 0x4]
	ldr r1, _080D3D58 @ =0x85000400
	str r1, [r0, 0x8]
	ldr r0, [r0, 0x8]
	bl IsContest
	lsls r0, 24
	cmp r0, 0
	bne _080D3D02
	ldr r2, _080D3D5C @ =REG_BG1CNT
	ldrb r1, [r2]
	movs r0, 0xD
	negs r0, r0
	ands r0, r1
	strb r0, [r2]
_080D3D02:
	ldr r0, _080D3D48 @ =gBattle_BG1_X
	strh r4, [r0]
	ldr r1, _080D3D4C @ =gBattle_BG1_Y
	strh r4, [r1]
	ldr r0, _080D3D60 @ =REG_BLDCNT
	strh r4, [r0]
	adds r0, 0x2
	strh r4, [r0]
	ldr r2, _080D3D44 @ =gTasks
	ldr r3, [sp, 0x14]
	adds r0, r3, r7
	lsls r0, 3
	adds r0, r2
	movs r3, 0x26
	ldrsh r1, [r0, r3]
	lsls r0, r1, 2
	adds r0, r1
	lsls r0, 3
	adds r0, r2
	ldr r1, _080D3D64 @ =0x0000ffff
	strh r1, [r0, 0x26]
	adds r0, r7, 0
	bl DestroyAnimVisualTask
_080D3D32:
	add sp, 0x18
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080D3D44: .4byte gTasks
_080D3D48: .4byte gBattle_BG1_X
_080D3D4C: .4byte gBattle_BG1_Y
_080D3D50: .4byte gPlttBufferFaded
_080D3D54: .4byte 0x040000d4
_080D3D58: .4byte 0x85000400
_080D3D5C: .4byte REG_BG1CNT
_080D3D60: .4byte REG_BLDCNT
_080D3D64: .4byte 0x0000ffff
	thumb_func_end sub_80D3B60

	thumb_func_start sub_80D3D68
sub_80D3D68: @ 80D3D68
	push {r4-r7,lr}
	sub sp, 0xC
	lsls r0, 24
	lsrs r7, r0, 24
	lsls r0, r7, 2
	adds r0, r7
	lsls r0, 3
	ldr r1, _080D3D90 @ =gTasks
	adds r4, r0, r1
	movs r1, 0x8
	ldrsh r0, [r4, r1]
	cmp r0, 0x1
	bne _080D3D84
	b _080D3EBC
_080D3D84:
	cmp r0, 0x1
	bgt _080D3D94
	cmp r0, 0
	beq _080D3D9C
	b _080D4032
	.align 2, 0
_080D3D90: .4byte gTasks
_080D3D94:
	cmp r0, 0x2
	bne _080D3D9A
	b _080D3F88
_080D3D9A:
	b _080D4032
_080D3D9C:
	movs r3, 0
	movs r2, 0x10
	ldrsh r0, [r4, r2]
	ldr r1, _080D3E6C @ =gScanlineEffectRegBuffers
	mov r12, r1
	cmp r3, r0
	bge _080D3DDA
	mov r7, r12
	movs r5, 0xF0
	lsls r5, 3
	add r5, r12
	ldr r6, _080D3E70 @ =0x0000ffff
_080D3DB4:
	lsls r2, r3, 16
	asrs r2, 16
	lsls r1, r2, 1
	adds r3, r1, r7
	adds r1, r5
	ldrh r0, [r4, 0xC]
	strh r0, [r1]
	ldrh r1, [r4, 0xC]
	adds r0, r6, 0
	ands r0, r1
	strh r0, [r3]
	adds r2, 0x1
	lsls r2, 16
	lsrs r3, r2, 16
	asrs r2, 16
	movs r1, 0x10
	ldrsh r0, [r4, r1]
	cmp r2, r0
	blt _080D3DB4
_080D3DDA:
	ldrh r3, [r4, 0x10]
	lsls r2, r3, 16
	asrs r1, r2, 16
	movs r3, 0x12
	ldrsh r0, [r4, r3]
	cmp r1, r0
	bge _080D3E14
	ldr r5, _080D3E6C @ =gScanlineEffectRegBuffers
	movs r0, 0xF0
	lsls r0, 3
	adds r6, r5, r0
	ldr r7, _080D3E70 @ =0x0000ffff
_080D3DF2:
	asrs r2, 16
	lsls r1, r2, 1
	adds r3, r1, r5
	adds r1, r6
	ldrh r0, [r4, 0xA]
	strh r0, [r1]
	ldrh r1, [r4, 0xA]
	adds r0, r7, 0
	ands r0, r1
	strh r0, [r3]
	adds r2, 0x1
	lsls r2, 16
	asrs r1, r2, 16
	movs r3, 0x12
	ldrsh r0, [r4, r3]
	cmp r1, r0
	blt _080D3DF2
_080D3E14:
	ldrh r3, [r4, 0x12]
	lsls r2, r3, 16
	asrs r0, r2, 16
	cmp r0, 0x9F
	bgt _080D3E4A
	ldr r5, _080D3E6C @ =gScanlineEffectRegBuffers
	movs r0, 0xF0
	lsls r0, 3
	adds r6, r5, r0
	ldr r7, _080D3E70 @ =0x0000ffff
_080D3E28:
	asrs r2, 16
	lsls r1, r2, 1
	adds r3, r1, r5
	adds r1, r6
	ldrh r0, [r4, 0xC]
	strh r0, [r1]
	ldrh r1, [r4, 0xC]
	adds r0, r7, 0
	ands r0, r1
	strh r0, [r3]
	adds r2, 0x1
	lsls r2, 16
	lsrs r3, r2, 16
	lsls r2, r3, 16
	asrs r0, r2, 16
	cmp r0, 0x9F
	ble _080D3E28
_080D3E4A:
	movs r1, 0x10
	ldrsh r0, [r4, r1]
	cmp r0, 0
	bne _080D3E74
	lsls r0, r3, 16
	asrs r0, 15
	mov r3, r12
	adds r2, r0, r3
	movs r1, 0xF0
	lsls r1, 3
	add r1, r12
	adds r0, r1
	ldrh r1, [r4, 0xA]
	strh r1, [r0]
	ldrh r0, [r4, 0xA]
	b _080D3E8A
	.align 2, 0
_080D3E6C: .4byte gScanlineEffectRegBuffers
_080D3E70: .4byte 0x0000ffff
_080D3E74:
	lsls r0, r3, 16
	asrs r0, 15
	mov r1, r12
	adds r2, r0, r1
	movs r1, 0xF0
	lsls r1, 3
	add r1, r12
	adds r0, r1
	ldrh r1, [r4, 0xC]
	strh r1, [r0]
	ldrh r0, [r4, 0xC]
_080D3E8A:
	strh r0, [r2]
	ldr r0, _080D3EB4 @ =REG_BLDALPHA
	str r0, [sp]
	ldr r0, _080D3EB8 @ =0xa2600001
	str r0, [sp, 0x4]
	mov r1, sp
	movs r2, 0
	movs r0, 0x1
	strb r0, [r1, 0x8]
	mov r0, sp
	strb r2, [r0, 0x9]
	ldr r0, [sp]
	ldr r1, [sp, 0x4]
	ldr r2, [sp, 0x8]
	bl ScanlineEffect_SetParams
	ldrh r0, [r4, 0x8]
	adds r0, 0x1
	strh r0, [r4, 0x8]
	b _080D4032
	.align 2, 0
_080D3EB4: .4byte REG_BLDALPHA
_080D3EB8: .4byte 0xa2600001
_080D3EBC:
	movs r2, 0xE
	ldrsh r1, [r4, r2]
	cmp r1, 0
	bne _080D3ED4
	ldrh r0, [r4, 0x10]
	subs r0, 0x1
	strh r0, [r4, 0x10]
	lsls r0, 16
	cmp r0, 0
	bgt _080D3EE8
	strh r1, [r4, 0x10]
	b _080D3EE2
_080D3ED4:
	ldrh r0, [r4, 0x12]
	adds r0, 0x1
	strh r0, [r4, 0x12]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x6F
	ble _080D3EE8
_080D3EE2:
	ldrh r0, [r4, 0x8]
	adds r0, 0x1
	strh r0, [r4, 0x8]
_080D3EE8:
	movs r3, 0
	movs r1, 0x10
	ldrsh r0, [r4, r1]
	cmp r3, r0
	bge _080D3F1C
	ldr r6, _080D3F80 @ =gScanlineEffectRegBuffers
	ldr r5, _080D3F84 @ =gScanlineEffect
_080D3EF6:
	lsls r1, r3, 16
	asrs r1, 16
	lsls r3, r1, 1
	ldrb r2, [r5, 0x14]
	lsls r0, r2, 4
	subs r0, r2
	lsls r0, 7
	adds r3, r0
	adds r3, r6
	ldrh r0, [r4, 0xC]
	strh r0, [r3]
	adds r1, 0x1
	lsls r1, 16
	lsrs r3, r1, 16
	asrs r1, 16
	movs r2, 0x10
	ldrsh r0, [r4, r2]
	cmp r1, r0
	blt _080D3EF6
_080D3F1C:
	ldrh r3, [r4, 0x10]
	lsls r2, r3, 16
	asrs r1, r2, 16
	movs r3, 0x12
	ldrsh r0, [r4, r3]
	cmp r1, r0
	bge _080D3F50
	ldr r6, _080D3F80 @ =gScanlineEffectRegBuffers
	ldr r5, _080D3F84 @ =gScanlineEffect
_080D3F2E:
	asrs r3, r2, 16
	lsls r2, r3, 1
	ldrb r1, [r5, 0x14]
	lsls r0, r1, 4
	subs r0, r1
	lsls r0, 7
	adds r2, r0
	adds r2, r6
	ldrh r0, [r4, 0xA]
	strh r0, [r2]
	adds r3, 0x1
	lsls r2, r3, 16
	asrs r1, r2, 16
	movs r3, 0x12
	ldrsh r0, [r4, r3]
	cmp r1, r0
	blt _080D3F2E
_080D3F50:
	ldrh r3, [r4, 0x12]
	lsls r1, r3, 16
	asrs r0, r1, 16
	cmp r0, 0x9F
	bgt _080D4032
	ldr r6, _080D3F80 @ =gScanlineEffectRegBuffers
	ldr r5, _080D3F84 @ =gScanlineEffect
_080D3F5E:
	asrs r3, r1, 16
	lsls r2, r3, 1
	ldrb r1, [r5, 0x14]
	lsls r0, r1, 4
	subs r0, r1
	lsls r0, 7
	adds r2, r0
	adds r2, r6
	ldrh r0, [r4, 0xC]
	strh r0, [r2]
	adds r3, 0x1
	lsls r1, r3, 16
	asrs r0, r1, 16
	cmp r0, 0x9F
	ble _080D3F5E
	b _080D4032
	.align 2, 0
_080D3F80: .4byte gScanlineEffectRegBuffers
_080D3F84: .4byte gScanlineEffect
_080D3F88:
	movs r3, 0
	movs r1, 0x10
	ldrsh r0, [r4, r1]
	cmp r3, r0
	bge _080D3FBC
	ldr r6, _080D403C @ =gScanlineEffectRegBuffers
	ldr r5, _080D4040 @ =gScanlineEffect
_080D3F96:
	lsls r1, r3, 16
	asrs r1, 16
	lsls r3, r1, 1
	ldrb r2, [r5, 0x14]
	lsls r0, r2, 4
	subs r0, r2
	lsls r0, 7
	adds r3, r0
	adds r3, r6
	ldrh r0, [r4, 0xC]
	strh r0, [r3]
	adds r1, 0x1
	lsls r1, 16
	lsrs r3, r1, 16
	asrs r1, 16
	movs r2, 0x10
	ldrsh r0, [r4, r2]
	cmp r1, r0
	blt _080D3F96
_080D3FBC:
	ldrh r3, [r4, 0x10]
	lsls r2, r3, 16
	asrs r1, r2, 16
	movs r3, 0x12
	ldrsh r0, [r4, r3]
	cmp r1, r0
	bge _080D3FF0
	ldr r6, _080D403C @ =gScanlineEffectRegBuffers
	ldr r5, _080D4040 @ =gScanlineEffect
_080D3FCE:
	asrs r3, r2, 16
	lsls r2, r3, 1
	ldrb r1, [r5, 0x14]
	lsls r0, r1, 4
	subs r0, r1
	lsls r0, 7
	adds r2, r0
	adds r2, r6
	ldrh r0, [r4, 0xA]
	strh r0, [r2]
	adds r3, 0x1
	lsls r2, r3, 16
	asrs r1, r2, 16
	movs r3, 0x12
	ldrsh r0, [r4, r3]
	cmp r1, r0
	blt _080D3FCE
_080D3FF0:
	ldrh r3, [r4, 0x12]
	lsls r1, r3, 16
	asrs r0, r1, 16
	cmp r0, 0x9F
	bgt _080D401C
	ldr r6, _080D403C @ =gScanlineEffectRegBuffers
	ldr r5, _080D4040 @ =gScanlineEffect
_080D3FFE:
	asrs r3, r1, 16
	lsls r2, r3, 1
	ldrb r1, [r5, 0x14]
	lsls r0, r1, 4
	subs r0, r1
	lsls r0, 7
	adds r2, r0
	adds r2, r6
	ldrh r0, [r4, 0xC]
	strh r0, [r2]
	adds r3, 0x1
	lsls r1, r3, 16
	asrs r0, r1, 16
	cmp r0, 0x9F
	ble _080D3FFE
_080D401C:
	movs r0, 0x26
	ldrsh r1, [r4, r0]
	movs r0, 0x1
	negs r0, r0
	cmp r1, r0
	bne _080D4032
	bl ScanlineEffect_Stop
	adds r0, r7, 0
	bl DestroyTask
_080D4032:
	add sp, 0xC
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080D403C: .4byte gScanlineEffectRegBuffers
_080D4040: .4byte gScanlineEffect
	thumb_func_end sub_80D3D68

	thumb_func_start sub_80D4044
sub_80D4044: @ 80D4044
	push {r4-r6,lr}
	adds r4, r0, 0
	ldrh r2, [r4, 0x4]
	lsls r1, r2, 22
	lsrs r1, 22
	adds r1, 0x8
	ldr r3, _080D4098 @ =0x000003ff
	adds r0, r3, 0
	ands r1, r0
	ldr r0, _080D409C @ =0xfffffc00
	ands r0, r2
	orrs r0, r1
	strh r0, [r4, 0x4]
	adds r0, r4, 0
	movs r1, 0x1
	bl sub_8078764
	bl Random
	movs r5, 0xFF
	ands r5, r0
	movs r0, 0x80
	lsls r0, 1
	adds r6, r0, 0
	orrs r5, r6
	bl Random
	ldr r1, _080D40A0 @ =0x000001ff
	ands r1, r0
	adds r0, r1, 0
	cmp r0, 0xFF
	ble _080D408A
	subs r0, r6, r0
	lsls r0, 16
	lsrs r1, r0, 16
_080D408A:
	strh r5, [r4, 0x30]
	strh r1, [r4, 0x32]
	ldr r0, _080D40A4 @ =sub_80D40A8
	str r0, [r4, 0x1C]
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_080D4098: .4byte 0x000003ff
_080D409C: .4byte 0xfffffc00
_080D40A0: .4byte 0x000001ff
_080D40A4: .4byte sub_80D40A8
	thumb_func_end sub_80D4044

	thumb_func_start sub_80D40A8
sub_80D40A8: @ 80D40A8
	push {r4,lr}
	adds r2, r0, 0
	ldrh r0, [r2, 0x30]
	ldrh r1, [r2, 0x34]
	adds r3, r0, r1
	strh r3, [r2, 0x34]
	ldrh r1, [r2, 0x32]
	ldrh r4, [r2, 0x36]
	adds r1, r4
	strh r1, [r2, 0x36]
	movs r1, 0x1
	ands r1, r0
	cmp r1, 0
	beq _080D40CC
	lsls r0, r3, 16
	asrs r0, 24
	negs r0, r0
	b _080D40D0
_080D40CC:
	lsls r0, r3, 16
	asrs r0, 24
_080D40D0:
	strh r0, [r2, 0x24]
	ldrh r0, [r2, 0x36]
	lsls r0, 16
	asrs r0, 24
	strh r0, [r2, 0x26]
	ldrh r0, [r2, 0x2E]
	adds r0, 0x1
	strh r0, [r2, 0x2E]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x15
	bne _080D40EE
	adds r0, r2, 0
	bl DestroyAnimSprite
_080D40EE:
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end sub_80D40A8

	thumb_func_start sub_80D40F4
sub_80D40F4: @ 80D40F4
	push {r4,lr}
	lsls r0, 24
	lsrs r0, 24
	lsls r4, r0, 2
	adds r4, r0
	lsls r4, 3
	ldr r0, _080D4144 @ =gTasks
	adds r4, r0
	movs r0, 0
	bl GetAnimBattlerSpriteId
	lsls r0, 24
	lsrs r0, 24
	strh r0, [r4, 0x26]
	ldr r2, _080D4148 @ =gSprites
	movs r0, 0x26
	ldrsh r1, [r4, r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r2
	ldrh r0, [r0, 0x22]
	strh r0, [r4, 0x12]
	bl sub_80D4394
	lsls r0, 24
	lsrs r0, 24
	strh r0, [r4, 0xA]
	ldrh r0, [r4, 0x26]
	lsls r0, 24
	lsrs r0, 24
	movs r1, 0
	bl sub_8078E70
	ldr r0, _080D414C @ =sub_80D4150
	str r0, [r4]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080D4144: .4byte gTasks
_080D4148: .4byte gSprites
_080D414C: .4byte sub_80D4150
	thumb_func_end sub_80D40F4

	thumb_func_start sub_80D4150
sub_80D4150: @ 80D4150
	push {r4-r6,lr}
	sub sp, 0xC
	lsls r0, 24
	lsrs r2, r0, 24
	lsls r0, r2, 2
	adds r0, r2
	lsls r0, 3
	ldr r1, _080D4178 @ =gTasks
	adds r4, r0, r1
	movs r1, 0x8
	ldrsh r0, [r4, r1]
	cmp r0, 0x7
	bls _080D416C
	b _080D438A
_080D416C:
	lsls r0, 2
	ldr r1, _080D417C @ =_080D4180
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_080D4178: .4byte gTasks
_080D417C: .4byte _080D4180
	.align 2, 0
_080D4180:
	.4byte _080D41A0
	.4byte _080D41C6
	.4byte _080D4258
	.4byte _080D428E
	.4byte _080D42A2
	.4byte _080D42B0
	.4byte _080D4330
	.4byte _080D437C
_080D41A0:
	ldrh r1, [r4, 0x26]
	lsls r1, 24
	lsrs r1, 24
	movs r3, 0x80
	lsls r3, 1
	movs r0, 0xE0
	str r0, [sp]
	movs r0, 0x80
	lsls r0, 2
	str r0, [sp, 0x4]
	movs r0, 0x20
	str r0, [sp, 0x8]
	adds r0, r4, 0
	adds r2, r3, 0
	bl sub_8079C08
	ldrh r0, [r4, 0x8]
	adds r0, 0x1
	strh r0, [r4, 0x8]
_080D41C6:
	ldrh r0, [r4, 0xE]
	adds r0, 0x1
	strh r0, [r4, 0xE]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x1
	ble _080D4222
	movs r0, 0
	strh r0, [r4, 0xE]
	ldrh r0, [r4, 0x10]
	adds r0, 0x1
	strh r0, [r4, 0x10]
	movs r1, 0x1
	ands r0, r1
	cmp r0, 0
	beq _080D4210
	ldr r2, _080D420C @ =gSprites
	movs r0, 0x26
	ldrsh r1, [r4, r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r2
	movs r1, 0x3
	strh r1, [r0, 0x24]
	movs r0, 0x26
	ldrsh r1, [r4, r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r2
	ldrh r1, [r0, 0x22]
	adds r1, 0x1
	strh r1, [r0, 0x22]
	b _080D4222
	.align 2, 0
_080D420C: .4byte gSprites
_080D4210:
	ldr r2, _080D4250 @ =gSprites
	movs r0, 0x26
	ldrsh r1, [r4, r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r2
	ldr r1, _080D4254 @ =0x0000fffd
	strh r1, [r0, 0x24]
_080D4222:
	adds r0, r4, 0
	bl sub_8079C74
	lsls r0, 24
	lsrs r5, r0, 24
	cmp r5, 0
	beq _080D4232
	b _080D438A
_080D4232:
	ldrh r0, [r4, 0x26]
	lsls r0, 24
	lsrs r0, 24
	bl sub_8079A64
	ldr r2, _080D4250 @ =gSprites
	movs r0, 0x26
	ldrsh r1, [r4, r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r2
	strh r5, [r0, 0x24]
	strh r5, [r4, 0xE]
	b _080D436C
	.align 2, 0
_080D4250: .4byte gSprites
_080D4254: .4byte 0x0000fffd
_080D4258:
	ldrh r0, [r4, 0xE]
	adds r0, 0x1
	strh r0, [r4, 0xE]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x4
	bgt _080D4268
	b _080D438A
_080D4268:
	ldrh r1, [r4, 0x26]
	lsls r1, 24
	lsrs r1, 24
	movs r3, 0x80
	lsls r3, 2
	movs r0, 0xC0
	lsls r0, 1
	str r0, [sp]
	movs r0, 0xE0
	str r0, [sp, 0x4]
	movs r0, 0x8
	str r0, [sp, 0x8]
	adds r0, r4, 0
	movs r2, 0xE0
	bl sub_8079C08
	movs r0, 0
	strh r0, [r4, 0xE]
	b _080D436E
_080D428E:
	adds r0, r4, 0
	bl sub_8079C74
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0
	bne _080D438A
	strh r0, [r4, 0xE]
	strh r0, [r4, 0x10]
	b _080D436E
_080D42A2:
	adds r0, r4, 0
	adds r1, r2, 0
	bl sub_80D4418
	ldrh r0, [r4, 0x8]
	adds r0, 0x1
	strh r0, [r4, 0x8]
_080D42B0:
	ldrh r0, [r4, 0xE]
	adds r0, 0x1
	strh r0, [r4, 0xE]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x1
	ble _080D438A
	movs r0, 0
	strh r0, [r4, 0xE]
	ldrh r0, [r4, 0x10]
	adds r0, 0x1
	strh r0, [r4, 0x10]
	movs r1, 0x1
	ands r0, r1
	cmp r0, 0
	beq _080D42E8
	ldr r2, _080D42E4 @ =gSprites
	movs r0, 0x26
	ldrsh r1, [r4, r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r2
	ldrh r1, [r0, 0x26]
	adds r1, 0x2
	b _080D42FA
	.align 2, 0
_080D42E4: .4byte gSprites
_080D42E8:
	ldr r2, _080D432C @ =gSprites
	movs r0, 0x26
	ldrsh r1, [r4, r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r2
	ldrh r1, [r0, 0x26]
	subs r1, 0x2
_080D42FA:
	strh r1, [r0, 0x26]
	movs r1, 0x10
	ldrsh r0, [r4, r1]
	cmp r0, 0xA
	bne _080D438A
	ldrh r1, [r4, 0x26]
	lsls r1, 24
	lsrs r1, 24
	movs r2, 0xC0
	lsls r2, 1
	movs r0, 0x80
	lsls r0, 1
	str r0, [sp]
	str r0, [sp, 0x4]
	movs r0, 0x8
	str r0, [sp, 0x8]
	adds r0, r4, 0
	movs r3, 0xE0
	bl sub_8079C08
	movs r0, 0
	strh r0, [r4, 0xE]
	strh r0, [r4, 0x10]
	b _080D436E
	.align 2, 0
_080D432C: .4byte gSprites
_080D4330:
	ldr r6, _080D4378 @ =gSprites
	movs r0, 0x26
	ldrsh r1, [r4, r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r6
	ldrh r1, [r0, 0x22]
	subs r1, 0x1
	strh r1, [r0, 0x22]
	adds r0, r4, 0
	bl sub_8079C74
	lsls r0, 24
	lsrs r5, r0, 24
	cmp r5, 0
	bne _080D438A
	ldrh r0, [r4, 0x26]
	lsls r0, 24
	lsrs r0, 24
	bl sub_8078F40
	movs r0, 0x26
	ldrsh r1, [r4, r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r6
	ldrh r1, [r4, 0x12]
	strh r1, [r0, 0x22]
_080D436C:
	strh r5, [r4, 0x10]
_080D436E:
	ldrh r0, [r4, 0x8]
	adds r0, 0x1
	strh r0, [r4, 0x8]
	b _080D438A
	.align 2, 0
_080D4378: .4byte gSprites
_080D437C:
	movs r1, 0xC
	ldrsh r0, [r4, r1]
	cmp r0, 0
	bne _080D438A
	adds r0, r2, 0
	bl DestroyAnimVisualTask
_080D438A:
	add sp, 0xC
	pop {r4-r6}
	pop {r0}
	bx r0
	thumb_func_end sub_80D4150

	thumb_func_start sub_80D4394
sub_80D4394: @ 80D4394
	push {r4,r5,lr}
	ldr r4, _080D43B8 @ =gAnimBankAttacker
	ldrb r0, [r4]
	bl GetBattlerSide
	lsls r0, 24
	cmp r0, 0
	bne _080D43C8
	ldr r1, _080D43BC @ =gBattlerPartyIndexes
	ldrb r0, [r4]
	lsls r0, 1
	adds r0, r1
	ldrh r1, [r0]
	movs r0, 0x64
	muls r1, r0
	ldr r0, _080D43C0 @ =gPlayerParty
	b _080D43D8
	.align 2, 0
_080D43B8: .4byte gAnimBankAttacker
_080D43BC: .4byte gBattlerPartyIndexes
_080D43C0: .4byte gPlayerParty
_080D43C4:
	adds r0, r2, 0
	b _080D440A
_080D43C8:
	ldr r1, _080D4410 @ =gBattlerPartyIndexes
	ldrb r0, [r4]
	lsls r0, 1
	adds r0, r1
	ldrh r1, [r0]
	movs r0, 0x64
	muls r1, r0
	ldr r0, _080D4414 @ =gEnemyParty
_080D43D8:
	adds r5, r1, r0
	adds r0, r5, 0
	movs r1, 0x3A
	bl GetMonData
	adds r4, r0, 0
	lsls r4, 16
	adds r0, r5, 0
	movs r1, 0x39
	bl GetMonData
	lsls r0, 16
	lsrs r3, r0, 16
	lsrs r4, 18
	movs r2, 0
_080D43F6:
	adds r1, r2, 0x1
	adds r0, r4, 0
	muls r0, r1
	cmp r3, r0
	blt _080D43C4
	lsls r0, r1, 24
	lsrs r2, r0, 24
	cmp r2, 0x2
	bls _080D43F6
	movs r0, 0x3
_080D440A:
	pop {r4,r5}
	pop {r1}
	bx r1
	.align 2, 0
_080D4410: .4byte gBattlerPartyIndexes
_080D4414: .4byte gEnemyParty
	thumb_func_end sub_80D4394

	thumb_func_start sub_80D4418
sub_80D4418: @ 80D4418
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	sub sp, 0x14
	adds r7, r0, 0
	lsls r1, 24
	lsrs r1, 24
	str r1, [sp]
	ldr r4, _080D4520 @ =gAnimBankAttacker
	ldrb r0, [r4]
	movs r1, 0x2
	bl GetBattlerSpriteCoord
	lsls r0, 24
	lsrs r0, 24
	mov r8, r0
	ldrb r0, [r4]
	movs r1, 0x3
	bl GetBattlerSpriteCoord
	lsls r0, 24
	lsrs r6, r0, 24
	movs r5, 0xAC
	ldrb r0, [r4]
	bl sub_8079E90
	subs r0, 0x1
	lsls r0, 24
	lsrs r0, 24
	str r0, [sp, 0x8]
	ldrh r1, [r7, 0xA]
	movs r0, 0x4
	subs r0, r1
	lsls r0, 16
	lsrs r1, r0, 16
	cmp r0, 0
	bgt _080D4468
	movs r1, 0x1
_080D4468:
	movs r0, 0
	str r0, [sp, 0x4]
	lsls r0, r1, 16
	mov r10, r8
	mov r9, r6
	mov r1, r10
	lsls r1, 4
	str r1, [sp, 0xC]
	mov r1, r9
	lsls r1, 4
	str r1, [sp, 0x10]
	asrs r0, 16
	mov r8, r0
_080D4482:
	ldr r0, _080D4524 @ =gSpriteTemplate_83D9378
	mov r1, r10
	mov r2, r9
	ldr r3, [sp, 0x8]
	bl CreateSprite
	lsls r0, 24
	lsrs r2, r0, 24
	lsls r6, r5, 16
	cmp r2, 0x40
	beq _080D44EA
	ldr r1, _080D4528 @ =gSprites
	lsls r0, r2, 4
	adds r0, r2
	lsls r0, 2
	adds r5, r0, r1
	mov r0, sp
	ldrh r0, [r0, 0x4]
	strh r0, [r5, 0x30]
	mov r1, sp
	ldrh r1, [r1, 0xC]
	strh r1, [r5, 0x32]
	mov r0, sp
	ldrh r0, [r0, 0x10]
	strh r0, [r5, 0x34]
	asrs r4, r6, 16
	adds r0, r4, 0
	movs r1, 0x40
	bl Cos
	strh r0, [r5, 0x36]
	adds r0, r4, 0
	movs r1, 0x40
	bl Sin
	strh r0, [r5, 0x38]
	mov r1, sp
	ldrh r1, [r1]
	strh r1, [r5, 0x3A]
	movs r0, 0x2
	strh r0, [r5, 0x3C]
	ldrh r1, [r7, 0xC]
	movs r0, 0x1
	ands r0, r1
	cmp r0, 0
	beq _080D44E4
	adds r0, r5, 0
	bl sub_80D452C
_080D44E4:
	ldrh r0, [r7, 0xC]
	adds r0, 0x1
	strh r0, [r7, 0xC]
_080D44EA:
	mov r1, r8
	lsls r0, r1, 1
	asrs r1, r6, 16
	adds r1, r0
	lsls r1, 16
	movs r0, 0xFF
	lsls r0, 16
	ands r0, r1
	lsrs r5, r0, 16
	ldr r1, [sp, 0x4]
	lsls r0, r1, 16
	asrs r0, 16
	add r0, r8
	lsls r0, 16
	lsrs r1, r0, 16
	str r1, [sp, 0x4]
	asrs r0, 16
	cmp r0, 0x13
	ble _080D4482
	add sp, 0x14
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080D4520: .4byte gAnimBankAttacker
_080D4524: .4byte gSpriteTemplate_83D9378
_080D4528: .4byte gSprites
	thumb_func_end sub_80D4418

	thumb_func_start sub_80D452C
sub_80D452C: @ 80D452C
	push {r4,lr}
	adds r4, r0, 0
	movs r1, 0x2E
	ldrsh r0, [r4, r1]
	cmp r0, 0
	beq _080D453E
	cmp r0, 0x1
	beq _080D4574
	b _080D45CE
_080D453E:
	movs r2, 0x30
	ldrsh r0, [r4, r2]
	movs r1, 0x6
	bl __modsi3
	lsls r0, 16
	asrs r0, 16
	lsls r1, r0, 1
	adds r1, r0
	ldrh r0, [r4, 0x36]
	adds r1, r0
	strh r1, [r4, 0x36]
	movs r1, 0x30
	ldrsh r0, [r4, r1]
	movs r1, 0x3
	bl __modsi3
	lsls r0, 16
	asrs r0, 16
	lsls r1, r0, 1
	adds r1, r0
	ldrh r2, [r4, 0x38]
	adds r1, r2
	strh r1, [r4, 0x38]
	ldrh r0, [r4, 0x2E]
	adds r0, 0x1
	strh r0, [r4, 0x2E]
_080D4574:
	ldrh r0, [r4, 0x36]
	ldrh r1, [r4, 0x32]
	adds r0, r1
	strh r0, [r4, 0x32]
	ldrh r1, [r4, 0x38]
	ldrh r2, [r4, 0x34]
	adds r1, r2
	strh r1, [r4, 0x34]
	lsls r0, 16
	asrs r0, 20
	strh r0, [r4, 0x20]
	lsls r1, 16
	asrs r2, r1, 20
	strh r2, [r4, 0x22]
	adds r0, 0x8
	lsls r0, 16
	movs r1, 0x80
	lsls r1, 17
	cmp r0, r1
	bhi _080D45AA
	adds r1, r2, 0
	movs r0, 0x8
	negs r0, r0
	cmp r1, r0
	blt _080D45AA
	cmp r1, 0x78
	ble _080D45CE
_080D45AA:
	ldr r3, _080D45D4 @ =gTasks
	movs r0, 0x3C
	ldrsh r1, [r4, r0]
	lsls r1, 1
	movs r0, 0x3A
	ldrsh r2, [r4, r0]
	lsls r0, r2, 2
	adds r0, r2
	lsls r0, 3
	adds r1, r0
	adds r3, 0x8
	adds r1, r3
	ldrh r0, [r1]
	subs r0, 0x1
	strh r0, [r1]
	adds r0, r4, 0
	bl DestroySprite
_080D45CE:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080D45D4: .4byte gTasks
	thumb_func_end sub_80D452C

	thumb_func_start sub_80D45D8
sub_80D45D8: @ 80D45D8
	push {r4,lr}
	lsls r0, 24
	lsrs r0, 24
	lsls r1, r0, 2
	adds r1, r0
	lsls r1, 3
	ldr r0, _080D4608 @ =gTasks
	adds r4, r1, r0
	bl sub_80D4394
	lsls r0, 24
	lsrs r0, 24
	strh r0, [r4, 0xA]
	ldr r0, _080D460C @ =gAnimBankAttacker
	ldrb r0, [r0]
	bl GetBattlerSide
	lsls r0, 24
	cmp r0, 0
	bne _080D4610
	movs r0, 0x88
	strh r0, [r4, 0x10]
	movs r0, 0x28
	b _080D4616
	.align 2, 0
_080D4608: .4byte gTasks
_080D460C: .4byte gAnimBankAttacker
_080D4610:
	movs r0, 0x10
	strh r0, [r4, 0x10]
	movs r0, 0x50
_080D4616:
	strh r0, [r4, 0x14]
	movs r0, 0x62
	strh r0, [r4, 0x12]
	ldrh r0, [r4, 0x10]
	adds r0, 0x31
	strh r0, [r4, 0x16]
	movs r0, 0xA
	ldrsh r1, [r4, r0]
	lsls r0, r1, 2
	adds r0, r1
	adds r0, 0x5
	strh r0, [r4, 0x20]
	ldr r0, _080D4638 @ =sub_80D463C
	str r0, [r4]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080D4638: .4byte sub_80D463C
	thumb_func_end sub_80D45D8

	thumb_func_start sub_80D463C
sub_80D463C: @ 80D463C
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	lsls r0, 24
	lsrs r1, r0, 24
	lsls r0, r1, 2
	adds r0, r1
	lsls r0, 3
	ldr r7, _080D4660 @ =gTasks
	adds r4, r0, r7
	movs r0, 0x8
	ldrsh r2, [r4, r0]
	cmp r2, 0
	beq _080D4664
	cmp r2, 0x1
	beq _080D4714
	b _080D4722
	.align 2, 0
_080D4660: .4byte gTasks
_080D4664:
	ldrh r0, [r4, 0xC]
	adds r0, 0x1
	strh r0, [r4, 0xC]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x2
	ble _080D467A
	strh r2, [r4, 0xC]
	adds r0, r4, 0
	bl sub_80D472C
_080D467A:
	movs r1, 0x1C
	ldrsh r0, [r4, r1]
	cmp r0, 0
	beq _080D46F4
	movs r2, 0x22
	ldrsh r0, [r4, r2]
	cmp r0, 0
	bne _080D46F4
	ldr r5, _080D4708 @ =gBattleAnimArgs
	movs r1, 0x1
	mov r8, r1
	mov r2, r8
	strh r2, [r5]
	strh r0, [r5, 0x2]
	movs r0, 0xC
	strh r0, [r5, 0x4]
	ldr r6, _080D470C @ =sub_80E1864
	adds r0, r6, 0
	movs r1, 0x50
	bl CreateTask
	lsls r0, 24
	lsrs r2, r0, 24
	cmp r2, 0xFF
	beq _080D46C4
	lsls r0, r2, 2
	adds r0, r2
	lsls r0, 3
	adds r0, r7
	ldr r1, [r0]
	adds r0, r2, 0
	bl _call_via_r1
	ldr r1, _080D4710 @ =gAnimVisualTaskCount
	ldrb r0, [r1]
	adds r0, 0x1
	strb r0, [r1]
_080D46C4:
	movs r0, 0x3
	strh r0, [r5]
	adds r0, r6, 0
	movs r1, 0x50
	bl CreateTask
	lsls r0, 24
	lsrs r2, r0, 24
	cmp r2, 0xFF
	beq _080D46F0
	lsls r0, r2, 2
	adds r0, r2
	lsls r0, 3
	adds r0, r7
	ldr r1, [r0]
	adds r0, r2, 0
	bl _call_via_r1
	ldr r1, _080D4710 @ =gAnimVisualTaskCount
	ldrb r0, [r1]
	adds r0, 0x1
	strb r0, [r1]
_080D46F0:
	mov r0, r8
	strh r0, [r4, 0x22]
_080D46F4:
	movs r2, 0x1E
	ldrsh r1, [r4, r2]
	movs r2, 0x20
	ldrsh r0, [r4, r2]
	cmp r1, r0
	blt _080D4722
	ldrh r0, [r4, 0x8]
	adds r0, 0x1
	strh r0, [r4, 0x8]
	b _080D4722
	.align 2, 0
_080D4708: .4byte gBattleAnimArgs
_080D470C: .4byte sub_80E1864
_080D4710: .4byte gAnimVisualTaskCount
_080D4714:
	movs r2, 0x1A
	ldrsh r0, [r4, r2]
	cmp r0, 0
	bne _080D4722
	adds r0, r1, 0
	bl DestroyAnimVisualTask
_080D4722:
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r0}
	bx r0
	thumb_func_end sub_80D463C

	thumb_func_start sub_80D472C
sub_80D472C: @ 80D472C
	push {r4-r6,lr}
	adds r4, r0, 0
	lsls r1, 24
	lsrs r6, r1, 24
	ldr r1, _080D47B8 @ =gSineTable
	movs r2, 0x18
	ldrsh r0, [r4, r2]
	lsls r0, 1
	adds r0, r1
	movs r1, 0
	ldrsh r0, [r0, r1]
	adds r0, 0x3
	asrs r0, 4
	ldrh r2, [r4, 0x14]
	adds r0, r2
	lsls r0, 16
	lsrs r5, r0, 16
	ldr r0, _080D47BC @ =gSpriteTemplate_83D9378
	movs r2, 0x16
	ldrsh r1, [r4, r2]
	movs r2, 0
	movs r3, 0
	bl CreateSprite
	lsls r0, 24
	lsrs r1, r0, 24
	cmp r1, 0x40
	beq _080D4786
	ldr r3, _080D47C0 @ =gSprites
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r1, r3, 0
	adds r1, 0x1C
	adds r1, r0, r1
	ldr r2, _080D47C4 @ =sub_80D47D0
	str r2, [r1]
	adds r0, r3
	strh r5, [r0, 0x38]
	strh r6, [r0, 0x3A]
	movs r1, 0x9
	strh r1, [r0, 0x3C]
	ldrh r0, [r4, 0x1A]
	adds r0, 0x1
	strh r0, [r4, 0x1A]
_080D4786:
	ldrh r0, [r4, 0x1E]
	adds r0, 0x1
	strh r0, [r4, 0x1E]
	ldrh r0, [r4, 0x18]
	adds r0, 0x27
	movs r1, 0xFF
	ands r0, r1
	strh r0, [r4, 0x18]
	movs r0, 0x16
	ldrsh r1, [r4, r0]
	ldr r0, _080D47C8 @ =0x41c64e6d
	muls r0, r1
	ldr r1, _080D47CC @ =0x00003039
	adds r0, r1
	movs r2, 0x12
	ldrsh r1, [r4, r2]
	bl __modsi3
	ldrh r1, [r4, 0x10]
	adds r1, r0
	strh r1, [r4, 0x16]
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_080D47B8: .4byte gSineTable
_080D47BC: .4byte gSpriteTemplate_83D9378
_080D47C0: .4byte gSprites
_080D47C4: .4byte sub_80D47D0
_080D47C8: .4byte 0x41c64e6d
_080D47CC: .4byte 0x00003039
	thumb_func_end sub_80D472C

	thumb_func_start sub_80D47D0
sub_80D47D0: @ 80D47D0
	push {r4,r5,lr}
	adds r5, r0, 0
	movs r1, 0x2E
	ldrsh r0, [r5, r1]
	cmp r0, 0
	bne _080D4866
	ldrh r0, [r5, 0x22]
	adds r0, 0x8
	strh r0, [r5, 0x22]
	lsls r0, 16
	asrs r0, 16
	movs r2, 0x38
	ldrsh r1, [r5, r2]
	cmp r0, r1
	blt _080D4866
	ldr r2, _080D486C @ =gTasks
	movs r3, 0x3A
	ldrsh r1, [r5, r3]
	lsls r0, r1, 2
	adds r0, r1
	lsls r0, 3
	adds r0, r2
	movs r1, 0x1
	strh r1, [r0, 0x1C]
	ldr r0, _080D4870 @ =gBattleAnimSpriteTemplate_83DB4D8
	movs r2, 0x20
	ldrsh r1, [r5, r2]
	movs r3, 0x22
	ldrsh r2, [r5, r3]
	movs r3, 0x1
	bl CreateSprite
	lsls r0, 24
	lsrs r0, 24
	strh r0, [r5, 0x30]
	cmp r0, 0x40
	beq _080D4860
	movs r0, 0x30
	ldrsh r1, [r5, r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	ldr r4, _080D4874 @ =gSprites
	adds r0, r4
	movs r1, 0x3
	bl StartSpriteAffineAnim
	movs r2, 0x30
	ldrsh r1, [r5, r2]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r4
	ldrh r1, [r5, 0x3A]
	strh r1, [r0, 0x3A]
	movs r3, 0x30
	ldrsh r1, [r5, r3]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r4
	ldrh r1, [r5, 0x3C]
	strh r1, [r0, 0x3C]
	movs r0, 0x30
	ldrsh r1, [r5, r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r4, 0x1C
	adds r0, r4
	ldr r1, _080D4878 @ =sub_80D487C
	str r1, [r0]
_080D4860:
	adds r0, r5, 0
	bl DestroySprite
_080D4866:
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080D486C: .4byte gTasks
_080D4870: .4byte gBattleAnimSpriteTemplate_83DB4D8
_080D4874: .4byte gSprites
_080D4878: .4byte sub_80D487C
	thumb_func_end sub_80D47D0

	thumb_func_start sub_80D487C
sub_80D487C: @ 80D487C
	push {r4,lr}
	adds r4, r0, 0
	ldrh r0, [r4, 0x30]
	adds r0, 0x1
	strh r0, [r4, 0x30]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x1
	ble _080D48E8
	movs r0, 0
	strh r0, [r4, 0x30]
	adds r3, r4, 0
	adds r3, 0x3E
	ldrb r2, [r3]
	lsls r0, r2, 29
	lsrs r0, 31
	movs r1, 0x1
	eors r1, r0
	lsls r1, 2
	movs r0, 0x5
	negs r0, r0
	ands r0, r2
	orrs r0, r1
	strb r0, [r3]
	ldrh r0, [r4, 0x32]
	adds r0, 0x1
	strh r0, [r4, 0x32]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0xC
	bne _080D48E8
	ldr r3, _080D48F0 @ =gTasks
	movs r0, 0x3C
	ldrsh r1, [r4, r0]
	lsls r1, 1
	movs r0, 0x3A
	ldrsh r2, [r4, r0]
	lsls r0, r2, 2
	adds r0, r2
	lsls r0, 3
	adds r1, r0
	adds r3, 0x8
	adds r1, r3
	ldrh r0, [r1]
	subs r0, 0x1
	strh r0, [r1]
	ldrb r0, [r4, 0x3]
	lsls r0, 26
	lsrs r0, 27
	bl FreeOamMatrix
	adds r0, r4, 0
	bl DestroySprite
_080D48E8:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080D48F0: .4byte gTasks
	thumb_func_end sub_80D487C

	thumb_func_start sub_80D48F4
sub_80D48F4: @ 80D48F4
	push {r4-r6,lr}
	lsls r0, 24
	lsrs r0, 24
	lsls r1, r0, 2
	adds r1, r0
	lsls r1, 3
	ldr r0, _080D4978 @ =gTasks
	adds r5, r1, r0
	ldr r4, _080D497C @ =gAnimBankAttacker
	ldrb r0, [r4]
	movs r1, 0x2
	bl GetBattlerSpriteCoord
	lsls r0, 24
	lsrs r0, 24
	movs r6, 0
	strh r0, [r5, 0xE]
	ldrb r0, [r4]
	movs r1, 0x3
	bl GetBattlerSpriteCoord
	lsls r0, 24
	lsrs r0, 24
	strh r0, [r5, 0x10]
	ldrb r0, [r4]
	bl GetBattlerSide
	lsls r0, 24
	movs r2, 0x1
	negs r2, r2
	adds r1, r2, 0
	cmp r0, 0
	bne _080D4938
	movs r1, 0x1
_080D4938:
	strh r1, [r5, 0x16]
	bl IsContest
	lsls r0, 24
	cmp r0, 0
	beq _080D494C
	movs r1, 0x16
	ldrsh r0, [r5, r1]
	negs r0, r0
	strh r0, [r5, 0x16]
_080D494C:
	movs r2, 0x16
	ldrsh r0, [r5, r2]
	lsls r0, 3
	ldrh r1, [r5, 0xE]
	adds r0, r1
	strh r0, [r5, 0x12]
	movs r2, 0x16
	ldrsh r1, [r5, r2]
	lsls r1, 3
	ldrh r0, [r5, 0x10]
	subs r0, r1
	strh r0, [r5, 0x14]
	ldr r0, _080D4980 @ =0x0000ffe0
	strh r0, [r5, 0x1A]
	strh r6, [r5, 0xA]
	strh r6, [r5, 0x8]
	ldr r0, _080D4984 @ =sub_80D4988
	str r0, [r5]
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_080D4978: .4byte gTasks
_080D497C: .4byte gAnimBankAttacker
_080D4980: .4byte 0x0000ffe0
_080D4984: .4byte sub_80D4988
	thumb_func_end sub_80D48F4

	thumb_func_start sub_80D4988
sub_80D4988: @ 80D4988
	push {r4,lr}
	lsls r0, 24
	lsrs r2, r0, 24
	lsls r0, r2, 2
	adds r0, r2
	lsls r0, 3
	ldr r1, _080D49AC @ =gTasks
	adds r4, r0, r1
	movs r1, 0x8
	ldrsh r0, [r4, r1]
	cmp r0, 0x6
	bls _080D49A2
	b _080D4AC2
_080D49A2:
	lsls r0, 2
	ldr r1, _080D49B0 @ =_080D49B4
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_080D49AC: .4byte gTasks
_080D49B0: .4byte _080D49B4
	.align 2, 0
_080D49B4:
	.4byte _080D49D0
	.4byte _080D49E0
	.4byte _080D49FA
	.4byte _080D4A3C
	.4byte _080D4A5E
	.4byte _080D4A8C
	.4byte _080D4AB2
_080D49D0:
	adds r0, r4, 0
	bl sub_80D4AD0
	movs r1, 0x1C
	ldrsh r0, [r4, r1]
	cmp r0, 0
	beq _080D4AC8
	b _080D4ABA
_080D49E0:
	adds r0, r4, 0
	bl sub_80D4AD0
	ldrh r0, [r4, 0xA]
	adds r0, 0x1
	strh r0, [r4, 0xA]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x10
	ble _080D4AC8
	movs r0, 0
	strh r0, [r4, 0xA]
	b _080D4ABA
_080D49FA:
	adds r0, r4, 0
	bl sub_80D4AD0
	movs r1, 0x16
	ldrsh r0, [r4, r1]
	lsls r1, r0, 1
	adds r1, r0
	lsls r1, 1
	ldrh r0, [r4, 0x12]
	adds r1, r0
	movs r2, 0
	strh r1, [r4, 0x12]
	adds r1, 0x10
	lsls r1, 16
	movs r0, 0x88
	lsls r0, 17
	cmp r1, r0
	bls _080D4AC8
	ldrh r0, [r4, 0x20]
	adds r0, 0x1
	strh r0, [r4, 0x20]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x2
	ble _080D4A38
	movs r0, 0x1
	strh r0, [r4, 0x22]
	movs r0, 0x6
	strh r0, [r4, 0x8]
	strh r2, [r4, 0xA]
	b _080D4AC8
_080D4A38:
	strh r2, [r4, 0xA]
	b _080D4ABA
_080D4A3C:
	adds r0, r4, 0
	bl sub_80D4AD0
	movs r0, 0x16
	ldrsh r1, [r4, r0]
	lsls r1, 1
	ldrh r0, [r4, 0x14]
	subs r0, r1
	strh r0, [r4, 0x14]
	ldrh r0, [r4, 0xA]
	adds r0, 0x1
	strh r0, [r4, 0xA]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x7
	ble _080D4AC8
	b _080D4ABA
_080D4A5E:
	adds r0, r4, 0
	bl sub_80D4AD0
	movs r1, 0x16
	ldrsh r0, [r4, r1]
	lsls r1, r0, 1
	adds r1, r0
	lsls r1, 1
	ldrh r0, [r4, 0x12]
	subs r0, r1
	strh r0, [r4, 0x12]
	adds r0, 0x10
	lsls r0, 16
	movs r1, 0x88
	lsls r1, 17
	cmp r0, r1
	bls _080D4AC8
	ldrh r0, [r4, 0x20]
	adds r0, 0x1
	strh r0, [r4, 0x20]
	movs r0, 0
	strh r0, [r4, 0xA]
	b _080D4ABA
_080D4A8C:
	adds r0, r4, 0
	bl sub_80D4AD0
	movs r0, 0x16
	ldrsh r1, [r4, r0]
	lsls r1, 1
	ldrh r0, [r4, 0x14]
	subs r0, r1
	strh r0, [r4, 0x14]
	ldrh r0, [r4, 0xA]
	adds r0, 0x1
	strh r0, [r4, 0xA]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x7
	ble _080D4AC8
	movs r0, 0x2
	strh r0, [r4, 0x8]
	b _080D4AC8
_080D4AB2:
	movs r1, 0x18
	ldrsh r0, [r4, r1]
	cmp r0, 0
	bne _080D4AC8
_080D4ABA:
	ldrh r0, [r4, 0x8]
	adds r0, 0x1
	strh r0, [r4, 0x8]
	b _080D4AC8
_080D4AC2:
	adds r0, r2, 0
	bl DestroyAnimVisualTask
_080D4AC8:
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end sub_80D4988

	thumb_func_start sub_80D4AD0
sub_80D4AD0: @ 80D4AD0
	push {r4-r6,lr}
	adds r6, r0, 0
	ldrh r0, [r6, 0xC]
	adds r0, 0x1
	strh r0, [r6, 0xC]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x1
	ble _080D4B2A
	movs r0, 0
	strh r0, [r6, 0xC]
	ldr r0, _080D4B30 @ =gSpriteTemplate_83D9378
	movs r2, 0xE
	ldrsh r1, [r6, r2]
	movs r3, 0x10
	ldrsh r2, [r6, r3]
	movs r3, 0xA
	bl CreateSprite
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x40
	beq _080D4B2A
	ldr r5, _080D4B34 @ =gSprites
	lsls r4, r0, 4
	adds r4, r0
	lsls r4, 2
	adds r0, r4, r5
	movs r1, 0x10
	strh r1, [r0, 0x2E]
	ldrh r1, [r6, 0x12]
	strh r1, [r0, 0x32]
	ldrh r1, [r6, 0x14]
	strh r1, [r0, 0x36]
	ldrh r1, [r6, 0x1A]
	strh r1, [r0, 0x38]
	bl InitAnimArcTranslation
	adds r5, 0x1C
	adds r4, r5
	ldr r0, _080D4B38 @ =sub_80D4B3C
	str r0, [r4]
	ldrh r0, [r6, 0x18]
	adds r0, 0x1
	strh r0, [r6, 0x18]
_080D4B2A:
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_080D4B30: .4byte gSpriteTemplate_83D9378
_080D4B34: .4byte gSprites
_080D4B38: .4byte sub_80D4B3C
	thumb_func_end sub_80D4AD0

	thumb_func_start sub_80D4B3C
sub_80D4B3C: @ 80D4B3C
	push {r4-r6,lr}
	adds r6, r0, 0
	bl TranslateAnimArc
	lsls r0, 24
	cmp r0, 0
	beq _080D4B96
	ldrh r0, [r6, 0x24]
	ldrh r1, [r6, 0x20]
	adds r0, r1
	strh r0, [r6, 0x20]
	ldrh r0, [r6, 0x26]
	ldrh r1, [r6, 0x22]
	adds r0, r1
	strh r0, [r6, 0x22]
	movs r0, 0x6
	strh r0, [r6, 0x2E]
	bl Random
	movs r4, 0x1F
	adds r1, r4, 0
	ands r1, r0
	ldr r5, _080D4B9C @ =0x0000fff0
	adds r1, r5
	ldrh r0, [r6, 0x20]
	adds r1, r0
	strh r1, [r6, 0x32]
	bl Random
	ands r4, r0
	adds r4, r5
	ldrh r1, [r6, 0x22]
	adds r4, r1
	strh r4, [r6, 0x36]
	bl Random
	movs r1, 0x7
	ands r1, r0
	mvns r1, r1
	strh r1, [r6, 0x38]
	adds r0, r6, 0
	bl InitAnimArcTranslation
	ldr r0, _080D4BA0 @ =sub_80D4BA4
	str r0, [r6, 0x1C]
_080D4B96:
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_080D4B9C: .4byte 0x0000fff0
_080D4BA0: .4byte sub_80D4BA4
	thumb_func_end sub_80D4B3C

	thumb_func_start sub_80D4BA4
sub_80D4BA4: @ 80D4BA4
	push {r4-r6,lr}
	adds r5, r0, 0
	bl TranslateAnimArc
	lsls r0, 24
	cmp r0, 0
	beq _080D4BE0
	movs r4, 0
	ldr r6, _080D4BE8 @ =gTasks
_080D4BB6:
	lsls r0, r4, 2
	adds r0, r4
	lsls r0, 3
	adds r2, r0, r6
	ldr r1, [r2]
	ldr r0, _080D4BEC @ =sub_80D4988
	cmp r1, r0
	bne _080D4BD6
	movs r0, 0x1
	strh r0, [r2, 0x1C]
	ldrh r0, [r2, 0x18]
	subs r0, 0x1
	strh r0, [r2, 0x18]
	adds r0, r5, 0
	bl DestroySprite
_080D4BD6:
	adds r0, r4, 0x1
	lsls r0, 16
	lsrs r4, r0, 16
	cmp r4, 0xF
	bls _080D4BB6
_080D4BE0:
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_080D4BE8: .4byte gTasks
_080D4BEC: .4byte sub_80D4988
	thumb_func_end sub_80D4BA4

	thumb_func_start sub_80D4BF0
sub_80D4BF0: @ 80D4BF0
	ldr r2, _080D4C10 @ =gBattleAnimArgs
	ldrh r1, [r2]
	strh r1, [r0, 0x20]
	ldrh r1, [r2, 0x2]
	strh r1, [r0, 0x22]
	ldrh r1, [r2, 0x4]
	strh r1, [r0, 0x2E]
	ldrh r1, [r2, 0x6]
	strh r1, [r0, 0x30]
	ldrh r1, [r2, 0x8]
	strh r1, [r0, 0x32]
	ldrh r1, [r2, 0xA]
	strh r1, [r0, 0x34]
	ldr r1, _080D4C14 @ =sub_80D4C18
	str r1, [r0, 0x1C]
	bx lr
	.align 2, 0
_080D4C10: .4byte gBattleAnimArgs
_080D4C14: .4byte sub_80D4C18
	thumb_func_end sub_80D4BF0

	thumb_func_start sub_80D4C18
sub_80D4C18: @ 80D4C18
	push {r4,lr}
	adds r4, r0, 0
	ldrh r0, [r4, 0x36]
	ldrh r1, [r4, 0x2E]
	subs r0, r1
	strh r0, [r4, 0x36]
	movs r1, 0x36
	ldrsh r0, [r4, r1]
	movs r1, 0xA
	bl __divsi3
	strh r0, [r4, 0x26]
	ldrh r0, [r4, 0x30]
	ldrh r2, [r4, 0x38]
	adds r0, r2
	movs r1, 0xFF
	ands r0, r1
	strh r0, [r4, 0x38]
	movs r1, 0x38
	ldrsh r0, [r4, r1]
	movs r2, 0x32
	ldrsh r1, [r4, r2]
	bl Sin
	strh r0, [r4, 0x24]
	ldrh r0, [r4, 0x34]
	subs r0, 0x1
	strh r0, [r4, 0x34]
	lsls r0, 16
	cmp r0, 0
	bne _080D4C5C
	adds r0, r4, 0
	bl DestroyAnimSprite
_080D4C5C:
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end sub_80D4C18

	thumb_func_start sub_80D4C64
sub_80D4C64: @ 80D4C64
	push {r4,lr}
	adds r4, r0, 0
	ldrh r0, [r4, 0x30]
	ldrh r1, [r4, 0x34]
	adds r0, r1
	strh r0, [r4, 0x34]
	ldrh r1, [r4, 0x32]
	ldrh r2, [r4, 0x36]
	adds r1, r2
	strh r1, [r4, 0x36]
	lsls r0, 16
	asrs r0, 23
	strh r0, [r4, 0x24]
	lsls r1, 16
	asrs r1, 23
	strh r1, [r4, 0x26]
	ldrh r0, [r4, 0x2E]
	subs r0, 0x1
	strh r0, [r4, 0x2E]
	lsls r0, 16
	cmp r0, 0
	bne _080D4C9C
	adds r0, r4, 0
	bl FreeSpriteOamMatrix
	adds r0, r4, 0
	bl DestroySprite
_080D4C9C:
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end sub_80D4C64

	thumb_func_start sub_80D4CA4
sub_80D4CA4: @ 80D4CA4
	push {r4,r5,lr}
	adds r4, r0, 0
	movs r1, 0x1
	bl InitAnimSpritePos
	ldr r5, _080D4CE0 @ =gAnimBankTarget
	ldrb r0, [r5]
	movs r1, 0x2
	bl GetBattlerSpriteCoord
	lsls r0, 24
	lsrs r0, 24
	strh r0, [r4, 0x30]
	ldrb r0, [r5]
	movs r1, 0x3
	bl GetBattlerSpriteCoord
	lsls r0, 24
	lsrs r0, 24
	strh r0, [r4, 0x32]
	ldr r1, _080D4CE4 @ =gBattleAnimArgs
	ldrh r0, [r1, 0x4]
	strh r0, [r4, 0x34]
	ldrh r0, [r1, 0x6]
	strh r0, [r4, 0x36]
	ldr r0, _080D4CE8 @ =sub_80D4CEC
	str r0, [r4, 0x1C]
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080D4CE0: .4byte gAnimBankTarget
_080D4CE4: .4byte gBattleAnimArgs
_080D4CE8: .4byte sub_80D4CEC
	thumb_func_end sub_80D4CA4

	thumb_func_start sub_80D4CEC
sub_80D4CEC: @ 80D4CEC
	push {r4-r6,lr}
	adds r4, r0, 0
	movs r0, 0x30
	ldrsh r1, [r4, r0]
	movs r2, 0x20
	ldrsh r0, [r4, r2]
	subs r6, r1, r0
	movs r0, 0x32
	ldrsh r1, [r4, r0]
	movs r2, 0x22
	ldrsh r0, [r4, r2]
	subs r5, r1, r0
	movs r1, 0x2E
	ldrsh r0, [r4, r1]
	muls r0, r6
	movs r2, 0x34
	ldrsh r1, [r4, r2]
	bl __divsi3
	strh r0, [r4, 0x24]
	movs r1, 0x2E
	ldrsh r0, [r4, r1]
	muls r0, r5
	movs r2, 0x34
	ldrsh r1, [r4, r2]
	bl __divsi3
	strh r0, [r4, 0x26]
	ldrh r0, [r4, 0x38]
	adds r0, 0x1
	strh r0, [r4, 0x38]
	lsls r0, 16
	asrs r0, 16
	movs r2, 0x36
	ldrsh r1, [r4, r2]
	cmp r0, r1
	bne _080D4D44
	movs r0, 0
	strh r0, [r4, 0x38]
	adds r0, r4, 0
	adds r1, r6, 0
	adds r2, r5, 0
	bl sub_80D4D64
_080D4D44:
	movs r0, 0x34
	ldrsh r1, [r4, r0]
	movs r2, 0x2E
	ldrsh r0, [r4, r2]
	cmp r1, r0
	bne _080D4D56
	adds r0, r4, 0
	bl DestroyAnimSprite
_080D4D56:
	ldrh r0, [r4, 0x2E]
	adds r0, 0x1
	strh r0, [r4, 0x2E]
	pop {r4-r6}
	pop {r0}
	bx r0
	thumb_func_end sub_80D4CEC

	thumb_func_start sub_80D4D64
sub_80D4D64: @ 80D4D64
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	sub sp, 0x18
	adds r4, r1, 0
	adds r5, r2, 0
	movs r2, 0x2E
	ldrsh r1, [r0, r2]
	lsrs r2, r1, 31
	adds r1, r2
	lsls r1, 15
	lsrs r1, 16
	str r1, [sp]
	ldrh r1, [r0, 0x24]
	ldrh r3, [r0, 0x20]
	adds r1, r3
	lsls r1, 16
	lsrs r1, 16
	mov r8, r1
	ldrh r1, [r0, 0x26]
	ldrh r0, [r0, 0x22]
	adds r1, r0
	lsls r1, 16
	lsrs r1, 16
	mov r10, r1
	bl Random
	lsls r0, 16
	lsrs r0, 16
	movs r1, 0xA
	bl __umodsi3
	adds r0, r5, r0
	subs r0, 0x5
	lsls r0, 16
	lsrs r0, 16
	mov r9, r0
	bl Random
	negs r4, r4
	lsls r0, 16
	lsrs r0, 16
	movs r1, 0xA
	bl __umodsi3
	adds r4, r0
	subs r4, 0x5
	lsls r4, 16
	lsrs r7, r4, 16
	movs r6, 0
	mov r0, r8
	lsls r0, 16
	mov r8, r0
	mov r1, r10
	lsls r1, 16
	str r1, [sp, 0xC]
	ldr r2, [sp]
	lsls r2, 16
	str r2, [sp, 0x10]
	asrs r1, 16
	lsls r0, r7, 16
	asrs r5, r0, 16
	str r0, [sp, 0x14]
	negs r3, r5
	str r3, [sp, 0x4]
	asrs r0, r2, 16
	adds r1, r0
	lsls r1, 16
	mov r10, r1
_080D4DF2:
	ldr r0, _080D4E34 @ =gSpriteTemplate_83D9420
	mov r2, r8
	asrs r1, r2, 16
	mov r3, r10
	asrs r2, r3, 16
	movs r3, 0x82
	bl CreateSprite
	lsls r0, 24
	lsrs r2, r0, 24
	ldr r1, _080D4E38 @ =gSprites
	lsls r0, r2, 4
	adds r0, r2
	lsls r0, 2
	adds r4, r0, r1
	movs r0, 0x14
	strh r0, [r4, 0x2E]
	mov r0, r9
	strh r0, [r4, 0x30]
	ldr r0, _080D4E3C @ =gAnimBankAttacker
	ldrb r0, [r0]
	bl sub_8079E90
	subs r0, 0x1
	adds r1, r4, 0
	adds r1, 0x43
	strb r0, [r1]
	cmp r5, 0
	bge _080D4E40
	mov r1, sp
	ldrh r1, [r1, 0x4]
	strh r1, [r4, 0x32]
	b _080D4E42
	.align 2, 0
_080D4E34: .4byte gSpriteTemplate_83D9420
_080D4E38: .4byte gSprites
_080D4E3C: .4byte gAnimBankAttacker
_080D4E40:
	strh r7, [r4, 0x32]
_080D4E42:
	lsls r0, r6, 16
	movs r2, 0x80
	lsls r2, 9
	adds r0, r2
	lsrs r6, r0, 16
	cmp r0, 0
	ble _080D4DF2
	movs r6, 0
	ldr r3, [sp, 0xC]
	asrs r1, r3, 16
	ldr r0, [sp, 0x14]
	asrs r5, r0, 16
	negs r2, r5
	str r2, [sp, 0x8]
	ldr r3, [sp, 0x10]
	asrs r0, r3, 16
	subs r1, r0
	lsls r1, 16
	mov r10, r1
_080D4E68:
	ldr r0, _080D4EAC @ =gSpriteTemplate_83D9420
	mov r2, r8
	asrs r1, r2, 16
	mov r3, r10
	asrs r2, r3, 16
	movs r3, 0x82
	bl CreateSprite
	lsls r0, 24
	lsrs r2, r0, 24
	ldr r1, _080D4EB0 @ =gSprites
	lsls r0, r2, 4
	adds r0, r2
	lsls r0, 2
	adds r4, r0, r1
	movs r0, 0x14
	strh r0, [r4, 0x2E]
	mov r0, r9
	strh r0, [r4, 0x30]
	ldr r0, _080D4EB4 @ =gAnimBankAttacker
	ldrb r0, [r0]
	bl sub_8079E90
	subs r0, 0x1
	adds r1, r4, 0
	adds r1, 0x43
	strb r0, [r1]
	cmp r5, 0
	ble _080D4EB8
	mov r1, sp
	ldrh r1, [r1, 0x8]
	strh r1, [r4, 0x32]
	b _080D4EBA
	.align 2, 0
_080D4EAC: .4byte gSpriteTemplate_83D9420
_080D4EB0: .4byte gSprites
_080D4EB4: .4byte gAnimBankAttacker
_080D4EB8:
	strh r7, [r4, 0x32]
_080D4EBA:
	lsls r0, r6, 16
	movs r2, 0x80
	lsls r2, 9
	adds r0, r2
	lsrs r6, r0, 16
	cmp r0, 0
	ble _080D4E68
	add sp, 0x18
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	thumb_func_end sub_80D4D64
	
	.align 2, 0 @ Don't pad with nop.
