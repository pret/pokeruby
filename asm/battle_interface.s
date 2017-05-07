	.include "constants/gba_constants.inc"
	.include "constants/species_constants.inc"
	.include "asm/macros.inc"

	.syntax unified

	.text

	thumb_func_start sub_8044CA0
sub_8044CA0: @ 8044CA0
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	sub sp, 0x18
	lsls r0, 24
	lsrs r0, 24
	mov r8, r0
	ldr r2, _08044DB4 @ =gTasks
	lsls r3, r0, 2
	adds r1, r3, r0
	lsls r1, 3
	adds r0, r1, r2
	ldrb r4, [r0, 0x1C]
	mov r9, r4
	ldrb r4, [r0, 0xA]
	mov r10, r4
	ldrb r0, [r0, 0x8]
	str r0, [sp, 0x8]
	movs r5, 0
	adds r7, r2, 0
	ldr r0, _08044DB8 @ =gSprites
	mov r12, r0
	str r3, [sp, 0xC]
	adds r0, r7, 0
	adds r0, 0xE
	adds r2, r1, r0
_08044CD8:
	mov r4, sp
	adds r1, r4, r5
	ldrh r0, [r2]
	strb r0, [r1]
	adds r2, 0x2
	adds r5, 0x1
	cmp r5, 0x5
	ble _08044CD8
	ldr r1, _08044DBC @ =REG_BLDCNT
	movs r2, 0xFD
	lsls r2, 6
	adds r0, r2, 0
	strh r0, [r1]
	adds r1, 0x2
	movs r0, 0x10
	strh r0, [r1]
	ldr r0, [sp, 0xC]
	add r0, r8
	lsls r0, 3
	adds r0, r7
	movs r1, 0x10
	strh r1, [r0, 0x26]
	movs r5, 0
	mov r4, r10
	lsls r4, 4
	str r4, [sp, 0x10]
	ldr r4, _08044DB8 @ =gSprites
	movs r6, 0xD
	negs r6, r6
	movs r3, 0x4
_08044D14:
	mov r1, sp
	adds r0, r1, r5
	ldrb r0, [r0]
	lsls r1, r0, 4
	adds r1, r0
	lsls r1, 2
	adds r1, r4
	ldrb r2, [r1, 0x1]
	adds r0, r6, 0
	ands r0, r2
	orrs r0, r3
	strb r0, [r1, 0x1]
	adds r5, 0x1
	cmp r5, 0x5
	ble _08044D14
	ldr r2, [sp, 0x10]
	add r2, r10
	lsls r2, 2
	add r2, r12
	ldrb r1, [r2, 0x1]
	movs r0, 0xD
	negs r0, r0
	ands r0, r1
	movs r1, 0x4
	orrs r0, r1
	strb r0, [r2, 0x1]
	mov r2, r9
	cmp r2, 0
	bne _08044D50
	b _08044E54
_08044D50:
	movs r5, 0
	mov r6, r12
	mov r9, r5
	adds r3, r6, 0
	adds r3, 0x1C
	mov r4, sp
	movs r7, 0
_08044D5E:
	ldr r0, [sp, 0x8]
	str r3, [sp, 0x14]
	bl battle_side_get_owner
	lsls r0, 24
	lsrs r2, r0, 24
	ldr r3, [sp, 0x14]
	cmp r2, 0
	beq _08044DC4
	movs r0, 0x5
	subs r0, r5
	mov r1, sp
	adds r2, r1, r0
	ldrb r1, [r2]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r6
	strh r7, [r0, 0x30]
	ldrb r1, [r2]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r6
	mov r1, r9
	strh r1, [r0, 0x34]
	ldrb r1, [r2]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r6
	mov r1, r9
	strh r1, [r0, 0x36]
	ldrb r1, [r2]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r3
	ldr r1, _08044DC0 @ =sub_8045110
	str r1, [r0]
	ldr r2, _08044DB8 @ =gSprites
	mov r12, r2
	b _08044DFA
	.align 2, 0
_08044DB4: .4byte gTasks
_08044DB8: .4byte gSprites
_08044DBC: .4byte REG_BLDCNT
_08044DC0: .4byte sub_8045110
_08044DC4:
	ldrb r1, [r4]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r6
	strh r7, [r0, 0x30]
	ldrb r1, [r4]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r6
	strh r2, [r0, 0x34]
	ldrb r1, [r4]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r6
	strh r2, [r0, 0x36]
	ldrb r1, [r4]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r3
	ldr r1, _08044E3C @ =sub_8045110
	str r1, [r0]
	ldr r0, _08044E40 @ =gSprites
	mov r12, r0
_08044DFA:
	adds r4, 0x1
	adds r7, 0x7
	adds r5, 0x1
	cmp r5, 0x5
	ble _08044D5E
	ldr r3, [sp, 0x10]
	add r3, r10
	lsls r3, 2
	mov r1, r12
	adds r0, r3, r1
	movs r2, 0x2E
	ldrsh r1, [r0, r2]
	lsrs r2, r1, 31
	adds r1, r2
	asrs r1, 1
	movs r2, 0
	strh r1, [r0, 0x2E]
	strh r2, [r0, 0x30]
	mov r1, r12
	adds r1, 0x1C
	adds r3, r1
	ldr r1, _08044E44 @ =sub_8045048
	str r1, [r3]
	ldr r1, _08044E48 @ =gSubspriteTables_820A6EC
	bl SetSubspriteTables
	ldr r1, _08044E4C @ =gTasks
	ldr r0, [sp, 0xC]
	add r0, r8
	lsls r0, 3
	adds r0, r1
	ldr r1, _08044E50 @ =sub_8044E74
	b _08044E5E
	.align 2, 0
_08044E3C: .4byte sub_8045110
_08044E40: .4byte gSprites
_08044E44: .4byte sub_8045048
_08044E48: .4byte gSubspriteTables_820A6EC
_08044E4C: .4byte gTasks
_08044E50: .4byte sub_8044E74
_08044E54:
	ldr r0, [sp, 0xC]
	add r0, r8
	lsls r0, 3
	adds r0, r7
	ldr r1, _08044E70 @ =sub_8044F70
_08044E5E:
	str r1, [r0]
	add sp, 0x18
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_08044E70: .4byte sub_8044F70
	thumb_func_end sub_8044CA0

	thumb_func_start sub_8044E74
sub_8044E74: @ 8044E74
	push {lr}
	lsls r0, 24
	lsrs r0, 24
	ldr r2, _08044EC0 @ =gTasks
	lsls r1, r0, 2
	adds r1, r0
	lsls r1, 3
	adds r3, r1, r2
	ldrh r0, [r3, 0x1E]
	adds r1, r0, 0x1
	strh r1, [r3, 0x1E]
	lsls r0, 16
	lsrs r0, 16
	movs r1, 0x1
	ands r0, r1
	cmp r0, 0
	bne _08044EAE
	ldrh r0, [r3, 0x26]
	subs r2, r0, 0x1
	strh r2, [r3, 0x26]
	lsls r0, r2, 16
	cmp r0, 0
	blt _08044EBA
	ldr r1, _08044EC4 @ =REG_BLDALPHA
	movs r0, 0x10
	subs r0, r2
	lsls r0, 8
	orrs r2, r0
	strh r2, [r1]
_08044EAE:
	movs r1, 0x26
	ldrsh r0, [r3, r1]
	cmp r0, 0
	bne _08044EBA
	ldr r0, _08044EC8 @ =sub_8044ECC
	str r0, [r3]
_08044EBA:
	pop {r0}
	bx r0
	.align 2, 0
_08044EC0: .4byte gTasks
_08044EC4: .4byte REG_BLDALPHA
_08044EC8: .4byte sub_8044ECC
	thumb_func_end sub_8044E74

	thumb_func_start sub_8044ECC
sub_8044ECC: @ 8044ECC
	push {r4-r6,lr}
	sub sp, 0x8
	lsls r0, 24
	lsrs r3, r0, 24
	ldr r6, _08044F44 @ =gTasks
	lsls r0, r3, 2
	adds r0, r3
	lsls r4, r0, 3
	adds r1, r4, r6
	ldrh r0, [r1, 0x26]
	subs r0, 0x1
	movs r5, 0
	strh r0, [r1, 0x26]
	lsls r0, 16
	asrs r2, r0, 16
	movs r0, 0x1
	negs r0, r0
	cmp r2, r0
	bne _08044F4C
	ldrb r3, [r1, 0xA]
	adds r0, r6, 0
	adds r0, 0xE
	adds r2, r4, r0
_08044EFA:
	mov r0, sp
	adds r1, r0, r5
	ldrh r0, [r2]
	strb r0, [r1]
	adds r2, 0x2
	adds r5, 0x1
	cmp r5, 0x5
	ble _08044EFA
	lsls r0, r3, 4
	adds r0, r3
	lsls r0, 2
	ldr r4, _08044F48 @ =gSprites
	adds r0, r4
	bl DestroySpriteAndFreeResources
	mov r0, sp
	ldrb r1, [r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r4
	bl DestroySpriteAndFreeResources
	movs r5, 0x1
_08044F2A:
	mov r1, sp
	adds r0, r1, r5
	ldrb r1, [r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r4
	bl DestroySprite
	adds r5, 0x1
	cmp r5, 0x5
	ble _08044F2A
	b _08044F62
	.align 2, 0
_08044F44: .4byte gTasks
_08044F48: .4byte gSprites
_08044F4C:
	movs r0, 0x3
	negs r0, r0
	cmp r2, r0
	bne _08044F62
	ldr r0, _08044F6C @ =REG_BLDCNT
	strh r5, [r0]
	adds r0, 0x2
	strh r5, [r0]
	adds r0, r3, 0
	bl DestroyTask
_08044F62:
	add sp, 0x8
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_08044F6C: .4byte REG_BLDCNT
	thumb_func_end sub_8044ECC

	thumb_func_start sub_8044F70
sub_8044F70: @ 8044F70
	push {r4-r7,lr}
	sub sp, 0x8
	lsls r0, 24
	lsrs r0, 24
	adds r4, r0, 0
	ldr r7, _08044FA4 @ =gTasks
	lsls r0, r4, 2
	adds r0, r4
	lsls r6, r0, 3
	adds r3, r6, r7
	ldrh r0, [r3, 0x26]
	subs r2, r0, 0x1
	movs r5, 0
	strh r2, [r3, 0x26]
	lsls r0, r2, 16
	asrs r1, r0, 16
	cmp r1, 0
	blt _08044FAC
	ldr r1, _08044FA8 @ =REG_BLDALPHA
	movs r0, 0x10
	subs r0, r2
	lsls r0, 8
	orrs r2, r0
	strh r2, [r1]
	b _08045022
	.align 2, 0
_08044FA4: .4byte gTasks
_08044FA8: .4byte REG_BLDALPHA
_08044FAC:
	movs r0, 0x1
	negs r0, r0
	cmp r1, r0
	bne _0804500C
	ldrb r3, [r3, 0xA]
	movs r5, 0
	adds r0, r7, 0
	adds r0, 0xE
	adds r2, r6, r0
_08044FBE:
	mov r0, sp
	adds r1, r0, r5
	ldrh r0, [r2]
	strb r0, [r1]
	adds r2, 0x2
	adds r5, 0x1
	cmp r5, 0x5
	ble _08044FBE
	lsls r0, r3, 4
	adds r0, r3
	lsls r0, 2
	ldr r4, _08045008 @ =gSprites
	adds r0, r4
	bl DestroySpriteAndFreeResources
	mov r0, sp
	ldrb r1, [r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r4
	bl DestroySpriteAndFreeResources
	movs r5, 0x1
_08044FEE:
	mov r1, sp
	adds r0, r1, r5
	ldrb r1, [r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r4
	bl DestroySprite
	adds r5, 0x1
	cmp r5, 0x5
	ble _08044FEE
	b _08045022
	.align 2, 0
_08045008: .4byte gSprites
_0804500C:
	movs r0, 0x3
	negs r0, r0
	cmp r1, r0
	bne _08045022
	ldr r0, _0804502C @ =REG_BLDCNT
	strh r5, [r0]
	adds r0, 0x2
	strh r5, [r0]
	adds r0, r4, 0
	bl DestroyTask
_08045022:
	add sp, 0x8
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_0804502C: .4byte REG_BLDCNT
	thumb_func_end sub_8044F70

	thumb_func_start sub_8045030
sub_8045030: @ 8045030
	push {lr}
	adds r1, r0, 0
	ldrh r2, [r1, 0x24]
	movs r3, 0x24
	ldrsh r0, [r1, r3]
	cmp r0, 0
	beq _08045044
	ldrh r0, [r1, 0x2E]
	adds r0, r2, r0
	strh r0, [r1, 0x24]
_08045044:
	pop {r0}
	bx r0
	thumb_func_end sub_8045030

	thumb_func_start sub_8045048
sub_8045048: @ 8045048
	push {lr}
	adds r2, r0, 0
	ldrh r0, [r2, 0x30]
	adds r1, r0, 0
	adds r1, 0x20
	strh r1, [r2, 0x30]
	movs r3, 0x2E
	ldrsh r0, [r2, r3]
	cmp r0, 0
	ble _08045066
	lsls r0, r1, 16
	asrs r0, 20
	ldrh r1, [r2, 0x24]
	adds r0, r1
	b _0804506E
_08045066:
	lsls r1, 16
	asrs r1, 20
	ldrh r0, [r2, 0x24]
	subs r0, r1
_0804506E:
	strh r0, [r2, 0x24]
	ldrh r1, [r2, 0x30]
	movs r0, 0xF
	ands r0, r1
	strh r0, [r2, 0x30]
	pop {r0}
	bx r0
	thumb_func_end sub_8045048

	thumb_func_start sub_804507C
sub_804507C: @ 804507C
	push {r4,lr}
	adds r4, r0, 0
	ldrh r1, [r4, 0x30]
	movs r2, 0x30
	ldrsh r0, [r4, r2]
	cmp r0, 0
	ble _08045090
	subs r0, r1, 0x1
	strh r0, [r4, 0x30]
	b _08045106
_08045090:
	ldrh r0, [r4, 0x32]
	lsls r0, 24
	lsrs r3, r0, 24
	ldrh r2, [r4, 0x34]
	adds r0, r2, 0
	adds r0, 0x38
	lsls r1, r0, 16
	lsrs r2, r1, 16
	ldr r0, _080450C0 @ =0x0000fff0
	ands r2, r0
	strh r2, [r4, 0x34]
	cmp r3, 0
	beq _080450C4
	lsrs r0, r1, 20
	ldrh r1, [r4, 0x24]
	adds r0, r1
	strh r0, [r4, 0x24]
	lsls r0, 16
	cmp r0, 0
	ble _080450D4
	movs r0, 0
	strh r0, [r4, 0x24]
	b _080450D4
	.align 2, 0
_080450C0: .4byte 0x0000fff0
_080450C4:
	lsrs r1, 20
	ldrh r0, [r4, 0x24]
	subs r0, r1
	strh r0, [r4, 0x24]
	lsls r0, 16
	cmp r0, 0
	bge _080450D4
	strh r3, [r4, 0x24]
_080450D4:
	movs r2, 0x24
	ldrsh r0, [r4, r2]
	cmp r0, 0
	bne _08045106
	movs r1, 0x3F
	cmp r3, 0
	beq _080450E4
	movs r1, 0xC0
_080450E4:
	movs r2, 0x3C
	ldrsh r0, [r4, r2]
	cmp r0, 0
	beq _080450F8
	lsls r1, 24
	asrs r1, 24
	movs r0, 0x74
	bl PlaySE2WithPanning
	b _08045102
_080450F8:
	lsls r1, 24
	asrs r1, 24
	movs r0, 0x73
	bl PlaySE1WithPanning
_08045102:
	ldr r0, _0804510C @ =SpriteCallbackDummy
	str r0, [r4, 0x1C]
_08045106:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0804510C: .4byte SpriteCallbackDummy
	thumb_func_end sub_804507C

	thumb_func_start sub_8045110
sub_8045110: @ 8045110
	push {r4,lr}
	adds r3, r0, 0
	ldrh r1, [r3, 0x30]
	movs r2, 0x30
	ldrsh r0, [r3, r2]
	cmp r0, 0
	ble _08045124
	subs r0, r1, 0x1
	strh r0, [r3, 0x30]
	b _08045174
_08045124:
	ldrh r0, [r3, 0x32]
	lsls r0, 24
	ldrh r2, [r3, 0x34]
	adds r1, r2, 0
	adds r1, 0x38
	lsls r4, r1, 16
	lsrs r2, r4, 16
	ldr r1, _08045144 @ =0x0000fff0
	ands r2, r1
	strh r2, [r3, 0x34]
	cmp r0, 0
	beq _08045148
	lsrs r0, r4, 20
	ldrh r1, [r3, 0x24]
	adds r0, r1
	b _0804514E
	.align 2, 0
_08045144: .4byte 0x0000fff0
_08045148:
	lsrs r1, r4, 20
	ldrh r0, [r3, 0x24]
	subs r0, r1
_0804514E:
	strh r0, [r3, 0x24]
	movs r2, 0x24
	ldrsh r0, [r3, r2]
	movs r2, 0x20
	ldrsh r1, [r3, r2]
	adds r0, r1
	adds r0, 0x8
	movs r1, 0x80
	lsls r1, 1
	cmp r0, r1
	bls _08045174
	adds r2, r3, 0
	adds r2, 0x3E
	ldrb r0, [r2]
	movs r1, 0x4
	orrs r0, r1
	strb r0, [r2]
	ldr r0, _0804517C @ =SpriteCallbackDummy
	str r0, [r3, 0x1C]
_08045174:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0804517C: .4byte SpriteCallbackDummy
	thumb_func_end sub_8045110

	thumb_func_start sub_8045180
sub_8045180: @ 8045180
	ldrh r2, [r0, 0x2E]
	lsls r2, 24
	lsrs r2, 24
	ldr r3, _0804519C @ =gSprites
	lsls r1, r2, 4
	adds r1, r2
	lsls r1, 2
	adds r1, r3
	ldrh r2, [r1, 0x24]
	strh r2, [r0, 0x24]
	ldrh r1, [r1, 0x26]
	strh r1, [r0, 0x26]
	bx lr
	.align 2, 0
_0804519C: .4byte gSprites
	thumb_func_end sub_8045180

	thumb_func_start sub_80451A0
sub_80451A0: @ 80451A0
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	sub sp, 0x10
	adds r7, r1, 0
	lsls r0, 24
	lsrs r0, 24
	mov r9, r0
	ldr r4, _08045238 @ =gUnknown_020238CC
	ldr r1, _0804523C @ =gUnknown_0820A8B0
	adds r0, r4, 0
	bl StringCopy
	adds r0, r7, 0
	movs r1, 0x2
	mov r2, sp
	bl GetMonData
	mov r0, sp
	bl StringGetEnd10
	adds r4, 0x3
	adds r0, r4, 0
	mov r1, sp
	bl StringCopy
	adds r5, r0, 0
	movs r1, 0xFC
	strb r1, [r5]
	movs r0, 0x3
	strb r0, [r5, 0x1]
	movs r0, 0x2
	strb r0, [r5, 0x2]
	strb r1, [r5, 0x3]
	movs r0, 0x1
	strb r0, [r5, 0x4]
	adds r5, 0x5
	adds r0, r7, 0
	bl GetMonGender
	lsls r0, 24
	lsrs r6, r0, 24
	adds r0, r7, 0
	movs r1, 0xB
	bl GetMonData
	adds r4, r0, 0
	lsls r4, 16
	lsrs r4, 16
	adds r0, r7, 0
	movs r1, 0x3
	bl GetMonData
	adds r2, r0, 0
	lsls r2, 24
	lsrs r2, 24
	adds r0, r4, 0
	mov r1, sp
	bl sub_8040D3C
	cmp r0, 0
	beq _08045222
	movs r6, 0x64
_08045222:
	cmp r6, 0
	beq _08045240
	cmp r6, 0xFE
	beq _08045248
	movs r0, 0xB
	strb r0, [r5]
	movs r0, 0xFF
	strb r0, [r5, 0x1]
	adds r5, 0x1
	b _08045256
	.align 2, 0
_08045238: .4byte gUnknown_020238CC
_0804523C: .4byte gUnknown_0820A8B0
_08045240:
	movs r0, 0xB
	strb r0, [r5]
	movs r0, 0xB5
	b _0804524E
_08045248:
	movs r0, 0xA
	strb r0, [r5]
	movs r0, 0xB6
_0804524E:
	strb r0, [r5, 0x1]
	movs r0, 0xFF
	strb r0, [r5, 0x2]
	adds r5, 0x2
_08045256:
	movs r0, 0xFC
	strb r0, [r5]
	movs r0, 0x13
	strb r0, [r5, 0x1]
	movs r0, 0x37
	strb r0, [r5, 0x2]
	movs r0, 0xFF
	strb r0, [r5, 0x3]
	ldr r1, _080452D8 @ =gSprites
	mov r0, r9
	lsls r4, r0, 4
	adds r0, r4, r0
	lsls r0, 2
	adds r0, r1
	ldrh r0, [r0, 0x3A]
	lsls r0, 24
	lsrs r0, 24
	bl battle_get_per_side_status
	lsls r0, 24
	lsrs r0, 24
	lsls r1, r0, 1
	adds r1, r0
	lsls r1, 7
	ldr r2, _080452DC @ =0x02000520
	adds r5, r1, r2
	ldr r0, _080452E0 @ =gUnknown_020238CC
	mov r8, r0
	adds r0, r5, 0
	mov r1, r8
	bl sub_80034D4
	movs r6, 0
	movs r1, 0x7
	mov r10, r1
	adds r0, r7, 0
	movs r1, 0x3
	bl GetMonData
	str r4, [sp, 0xC]
	cmp r0, 0x1
	bne _08045338
	adds r0, r7, 0
	movs r1, 0x2D
	bl GetMonData
	cmp r0, 0
	bne _08045338
	mov r4, r8
	ldrb r1, [r4]
	adds r0, r1, 0
	cmp r0, 0xFF
	beq _08045338
	adds r7, r5, 0
_080452C2:
	cmp r1, 0xFC
	bne _080452E4
	ldrb r0, [r4, 0x1]
	bl GetExtCtrlCodeLength
	lsls r0, 24
	lsrs r0, 24
	adds r0, 0x1
	adds r4, r0
	b _08045330
	.align 2, 0
_080452D8: .4byte gSprites
_080452DC: .4byte 0x02000520
_080452E0: .4byte gUnknown_020238CC
_080452E4:
	adds r0, r1, 0
	subs r0, 0x37
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x13
	bls _080452FC
	adds r0, r1, 0
	adds r0, 0x79
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x13
	bhi _08045300
_080452FC:
	movs r0, 0x2C
	b _0804531E
_08045300:
	adds r0, r1, 0
	subs r0, 0x4B
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x4
	bls _08045318
	adds r0, r1, 0
	adds r0, 0x65
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x4
	bhi _0804531C
_08045318:
	movs r0, 0x2D
	b _0804531E
_0804531C:
	movs r0, 0x2B
_0804531E:
	bl sub_8043CDC
	adds r1, r7, 0
	ldr r2, _080453C8 @ =REG_BG0CNT
	bl CpuSet
	adds r7, 0x40
	adds r6, 0x1
	adds r4, 0x1
_08045330:
	ldrb r1, [r4]
	adds r0, r1, 0
	cmp r0, 0xFF
	bne _080452C2
_08045338:
	cmp r6, r10
	bge _0804535A
	lsls r0, r6, 6
	adds r4, r0, r5
	mov r2, r10
	subs r6, r2, r6
_08045344:
	movs r0, 0x2B
	bl sub_8043CDC
	adds r1, r4, 0
	ldr r2, _080453C8 @ =REG_BG0CNT
	bl CpuSet
	adds r4, 0x40
	subs r6, 0x1
	cmp r6, 0
	bne _08045344
_0804535A:
	ldr r1, _080453CC @ =gSprites
	ldr r0, [sp, 0xC]
	add r0, r9
	lsls r0, 2
	adds r6, r0, r1
	ldrh r0, [r6, 0x3A]
	lsls r0, 24
	lsrs r0, 24
	bl battle_side_get_owner
	lsls r0, 24
	cmp r0, 0
	bne _080453D4
	bl IsDoubleBattle
	lsls r0, 24
	cmp r0, 0
	bne _080453D4
	ldr r1, _080453D0 @ =gUnknown_0820A8B4
	mov r0, r10
	cmp r0, 0
	beq _08045438
	mov r8, r6
	mov r9, r1
	ldr r7, _080453C8 @ =REG_BG0CNT
	mov r6, r10
_0804538E:
	mov r1, r9
	adds r1, 0x4
	mov r9, r1
	subs r1, 0x4
	ldm r1!, {r4}
	mov r2, r8
	ldrh r0, [r2, 0x4]
	lsls r0, 22
	lsrs r0, 17
	adds r4, r0
	adds r0, r5, 0
	adds r1, r4, 0
	adds r2, r7, 0
	bl CpuSet
	adds r5, 0x20
	movs r0, 0x80
	lsls r0, 1
	adds r4, r0
	adds r0, r5, 0
	adds r1, r4, 0
	adds r2, r7, 0
	bl CpuSet
	adds r5, 0x20
	subs r6, 0x1
	cmp r6, 0
	bne _0804538E
	b _08045438
	.align 2, 0
_080453C8: .4byte REG_BG0CNT
_080453CC: .4byte gSprites
_080453D0: .4byte gUnknown_0820A8B4
_080453D4:
	ldr r1, _08045448 @ =gSprites
	ldr r0, [sp, 0xC]
	add r0, r9
	lsls r0, 2
	adds r4, r0, r1
	ldrh r0, [r4, 0x3A]
	lsls r0, 24
	lsrs r0, 24
	bl battle_side_get_owner
	lsls r0, 24
	ldr r1, _0804544C @ =gUnknown_0820A8DC
	cmp r0, 0
	bne _080453F2
	ldr r1, _08045450 @ =gUnknown_0820A904
_080453F2:
	mov r2, r10
	cmp r2, 0
	beq _08045438
	mov r8, r4
	mov r9, r1
	ldr r7, _08045454 @ =REG_BG0CNT
	mov r6, r10
_08045400:
	mov r0, r9
	adds r0, 0x4
	mov r9, r0
	subs r0, 0x4
	ldm r0!, {r4}
	mov r1, r8
	ldrh r0, [r1, 0x4]
	lsls r0, 22
	lsrs r0, 17
	adds r4, r0
	adds r0, r5, 0
	adds r1, r4, 0
	adds r2, r7, 0
	bl CpuSet
	adds r5, 0x20
	movs r2, 0x80
	lsls r2, 1
	adds r4, r2
	adds r0, r5, 0
	adds r1, r4, 0
	adds r2, r7, 0
	bl CpuSet
	adds r5, 0x20
	subs r6, 0x1
	cmp r6, 0
	bne _08045400
_08045438:
	add sp, 0x10
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_08045448: .4byte gSprites
_0804544C: .4byte gUnknown_0820A8DC
_08045450: .4byte gUnknown_0820A904
_08045454: .4byte REG_BG0CNT
	thumb_func_end sub_80451A0

	thumb_func_start sub_8045458
sub_8045458: @ 8045458
	push {r4-r7,lr}
	sub sp, 0x4
	lsls r0, 24
	lsrs r2, r0, 24
	lsls r1, 24
	lsrs r7, r1, 24
	ldr r0, _080454F4 @ =gBattleTypeFlags
	ldrh r1, [r0]
	movs r0, 0x80
	lsls r0, 2
	ands r0, r1
	cmp r0, 0
	bne _0804552E
	movs r0, 0x8
	ands r0, r1
	cmp r0, 0
	bne _0804552E
	ldr r6, _080454F8 @ =gSprites
	lsls r0, r2, 4
	adds r0, r2
	lsls r0, 2
	adds r5, r0, r6
	ldrh r0, [r5, 0x3A]
	lsls r0, 24
	lsrs r4, r0, 24
	adds r0, r4, 0
	bl battle_side_get_owner
	lsls r0, 24
	cmp r0, 0
	beq _0804552E
	ldr r1, _080454FC @ =gUnknown_02024A6A
	lsls r0, r4, 1
	adds r0, r1
	ldrh r1, [r0]
	movs r0, 0x64
	muls r0, r1
	ldr r1, _08045500 @ =gEnemyParty
	adds r0, r1
	movs r1, 0xB
	bl GetMonData
	lsls r0, 16
	lsrs r0, 16
	bl SpeciesToNationalPokedexNum
	lsls r0, 16
	lsrs r0, 16
	movs r1, 0x1
	bl sub_8090D90
	lsls r0, 24
	cmp r0, 0
	beq _0804552E
	ldrh r0, [r5, 0x38]
	lsls r0, 24
	lsrs r4, r0, 24
	cmp r7, 0
	beq _0804550C
	movs r0, 0x46
	bl sub_8043CDC
	lsls r1, r4, 4
	adds r1, r4
	lsls r1, 2
	adds r1, r6
	ldrh r1, [r1, 0x4]
	lsls r1, 22
	lsrs r1, 17
	movs r2, 0x80
	lsls r2, 1
	adds r1, r2
	ldr r2, _08045504 @ =0x06010000
	adds r1, r2
	ldr r2, _08045508 @ =REG_BG0CNT
	bl CpuSet
	b _0804552E
	.align 2, 0
_080454F4: .4byte gBattleTypeFlags
_080454F8: .4byte gSprites
_080454FC: .4byte gUnknown_02024A6A
_08045500: .4byte gEnemyParty
_08045504: .4byte 0x06010000
_08045508: .4byte REG_BG0CNT
_0804550C:
	str r7, [sp]
	lsls r0, r4, 4
	adds r0, r4
	lsls r0, 2
	adds r0, r6
	ldrh r1, [r0, 0x4]
	lsls r1, 22
	lsrs r1, 17
	movs r0, 0x80
	lsls r0, 1
	adds r1, r0
	ldr r0, _08045538 @ =0x06010000
	adds r1, r0
	ldr r2, _0804553C @ =0x05000008
	mov r0, sp
	bl CpuSet
_0804552E:
	add sp, 0x4
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_08045538: .4byte 0x06010000
_0804553C: .4byte 0x05000008
	thumb_func_end sub_8045458

	thumb_func_start draw_status_ailment_maybe
draw_status_ailment_maybe: @ 8045540
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	lsls r0, 24
	lsrs r0, 24
	mov r9, r0
	ldr r0, _080455A4 @ =gSprites
	mov r2, r9
	lsls r1, r2, 4
	add r1, r9
	lsls r1, 2
	adds r1, r0
	ldrh r0, [r1, 0x3A]
	lsls r0, 24
	lsrs r7, r0, 24
	ldrh r0, [r1, 0x38]
	lsls r0, 24
	lsrs r0, 24
	mov r10, r0
	adds r0, r7, 0
	bl battle_side_get_owner
	lsls r0, 24
	cmp r0, 0
	bne _080455B0
	ldr r1, _080455A8 @ =gUnknown_02024A6A
	lsls r0, r7, 1
	adds r0, r1
	ldrh r1, [r0]
	movs r0, 0x64
	muls r0, r1
	ldr r1, _080455AC @ =gPlayerParty
	adds r0, r1
	movs r1, 0x37
	bl GetMonData
	adds r4, r0, 0
	bl IsDoubleBattle
	lsls r0, 24
	movs r3, 0x12
	mov r8, r3
	cmp r0, 0
	bne _080455CC
	movs r0, 0x1A
	mov r8, r0
	b _080455CC
	.align 2, 0
_080455A4: .4byte gSprites
_080455A8: .4byte gUnknown_02024A6A
_080455AC: .4byte gPlayerParty
_080455B0:
	ldr r1, _080455EC @ =gUnknown_02024A6A
	lsls r0, r7, 1
	adds r0, r1
	ldrh r1, [r0]
	movs r0, 0x64
	muls r0, r1
	ldr r1, _080455F0 @ =gEnemyParty
	adds r0, r1
	movs r1, 0x37
	bl GetMonData
	adds r4, r0, 0
	movs r1, 0x11
	mov r8, r1
_080455CC:
	movs r0, 0x7
	ands r0, r4
	cmp r0, 0
	beq _080455F4
	movs r0, 0x1B
	adds r1, r7, 0
	bl sub_80457E8
	lsls r0, 24
	lsrs r0, 24
	bl sub_8043CDC
	adds r6, r0, 0
	movs r0, 0x2
	b _080456FC
	.align 2, 0
_080455EC: .4byte gUnknown_02024A6A
_080455F0: .4byte gEnemyParty
_080455F4:
	movs r0, 0x88
	ands r0, r4
	cmp r0, 0
	beq _08045612
	movs r0, 0x15
	adds r1, r7, 0
	bl sub_80457E8
	lsls r0, 24
	lsrs r0, 24
	bl sub_8043CDC
	adds r6, r0, 0
	movs r0, 0
	b _080456FC
_08045612:
	movs r0, 0x10
	ands r0, r4
	cmp r0, 0
	beq _08045630
	movs r0, 0x21
	adds r1, r7, 0
	bl sub_80457E8
	lsls r0, 24
	lsrs r0, 24
	bl sub_8043CDC
	adds r6, r0, 0
	movs r0, 0x4
	b _080456FC
_08045630:
	movs r0, 0x20
	ands r0, r4
	cmp r0, 0
	beq _0804564E
	movs r0, 0x1E
	adds r1, r7, 0
	bl sub_80457E8
	lsls r0, 24
	lsrs r0, 24
	bl sub_8043CDC
	adds r6, r0, 0
	movs r0, 0x3
	b _080456FC
_0804564E:
	movs r0, 0x40
	ands r0, r4
	cmp r0, 0
	beq _0804566C
	movs r0, 0x18
	adds r1, r7, 0
	bl sub_80457E8
	lsls r0, 24
	lsrs r0, 24
	bl sub_8043CDC
	adds r6, r0, 0
	movs r0, 0x1
	b _080456FC
_0804566C:
	movs r0, 0x27
	bl sub_8043CDC
	adds r6, r0, 0
	movs r4, 0
	mov r2, r9
	lsls r0, r2, 4
	mov r3, r8
	lsls r3, 16
	mov r8, r3
	lsls r7, 2
	ldr r1, _080456E8 @ =gSprites
	add r0, r9
	lsls r0, 2
	adds r5, r0, r1
_0804568A:
	ldrh r1, [r5, 0x4]
	lsls r1, 22
	lsrs r1, 22
	mov r2, r8
	asrs r0, r2, 16
	adds r1, r0
	adds r1, r4
	lsls r1, 5
	ldr r3, _080456EC @ =0x06010000
	adds r1, r3
	adds r0, r6, 0
	ldr r2, _080456F0 @ =REG_BG0CNT
	bl CpuSet
	adds r4, 0x1
	cmp r4, 0x2
	ble _0804568A
	ldr r0, _080456F4 @ =0x02017800
	adds r0, r7, r0
	ldrb r1, [r0]
	movs r0, 0x10
	ands r0, r1
	cmp r0, 0
	bne _080456DC
	movs r0, 0x1
	bl sub_8043CDC
	ldr r2, _080456E8 @ =gSprites
	mov r3, r10
	lsls r1, r3, 4
	add r1, r10
	lsls r1, 2
	adds r1, r2
	ldrh r1, [r1, 0x4]
	lsls r1, 22
	lsrs r1, 17
	ldr r2, _080456EC @ =0x06010000
	adds r1, r2
	ldr r2, _080456F8 @ =REG_BG0HOFS
	bl CpuSet
_080456DC:
	mov r0, r9
	movs r1, 0x1
	bl sub_8045458
	b _080457BA
	.align 2, 0
_080456E8: .4byte gSprites
_080456EC: .4byte 0x06010000
_080456F0: .4byte REG_BG0CNT
_080456F4: .4byte 0x02017800
_080456F8: .4byte REG_BG0HOFS
_080456FC:
	mov r1, r9
	lsls r5, r1, 4
	add r5, r9
	lsls r5, 2
	ldr r2, _080457C8 @ =gSprites
	adds r5, r2
	ldrb r4, [r5, 0x5]
	lsrs r4, 4
	lsls r4, 4
	adds r4, 0xC
	adds r4, r7
	lsls r0, 1
	ldr r1, _080457CC @ =gBattleInterfaceStatusIcons_DynPal
	adds r0, r1
	ldrh r0, [r0]
	movs r3, 0x80
	lsls r3, 1
	adds r1, r4, r3
	movs r2, 0x2
	bl FillPalette
	lsls r4, 1
	ldr r0, _080457D0 @ =gPlttBufferUnfaded + 0x200
	adds r0, r4, r0
	ldr r1, _080457D4 @ =0x05000200
	adds r4, r1
	adds r1, r4, 0
	movs r2, 0x1
	bl CpuSet
	ldrh r1, [r5, 0x4]
	lsls r1, 22
	lsrs r1, 22
	add r1, r8
	lsls r1, 5
	ldr r2, _080457D8 @ =0x06010000
	mov r8, r2
	add r1, r8
	ldr r2, _080457DC @ =REG_BG2HOFS
	adds r0, r6, 0
	bl CpuSet
	bl IsDoubleBattle
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	beq _0804576A
	adds r0, r7, 0
	bl battle_side_get_owner
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _080457B2
_0804576A:
	lsls r0, r7, 2
	ldr r1, _080457E0 @ =0x02017800
	adds r0, r1
	ldrb r1, [r0]
	movs r0, 0x10
	ands r0, r1
	cmp r0, 0
	bne _080457B2
	movs r0, 0
	bl sub_8043CDC
	mov r3, r10
	lsls r4, r3, 4
	add r4, r10
	lsls r4, 2
	ldr r1, _080457C8 @ =gSprites
	adds r4, r1
	ldrh r1, [r4, 0x4]
	lsls r1, 22
	lsrs r1, 17
	add r1, r8
	ldr r5, _080457E4 @ =REG_BG0CNT
	adds r2, r5, 0
	bl CpuSet
	movs r0, 0x41
	bl sub_8043CDC
	ldrh r1, [r4, 0x4]
	lsls r1, 22
	lsrs r1, 17
	adds r1, 0x20
	add r1, r8
	adds r2, r5, 0
	bl CpuSet
_080457B2:
	mov r0, r9
	movs r1, 0
	bl sub_8045458
_080457BA:
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080457C8: .4byte gSprites
_080457CC: .4byte gBattleInterfaceStatusIcons_DynPal
_080457D0: .4byte gPlttBufferUnfaded + 0x200
_080457D4: .4byte 0x05000200
_080457D8: .4byte 0x06010000
_080457DC: .4byte REG_BG2HOFS
_080457E0: .4byte 0x02017800
_080457E4: .4byte REG_BG0CNT
	thumb_func_end draw_status_ailment_maybe

	thumb_func_start sub_80457E8
sub_80457E8: @ 80457E8
	push {lr}
	lsls r0, 24
	lsls r1, 24
	lsrs r3, r1, 24
	lsrs r2, r0, 24
	adds r0, r2, 0
	subs r0, 0x15
	cmp r0, 0xC
	bhi _080458A8
	lsls r0, 2
	ldr r1, _08045804 @ =_08045808
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_08045804: .4byte _08045808
	.align 2, 0
_08045808:
	.4byte _0804583C
	.4byte _080458A8
	.4byte _080458A8
	.4byte _08045852
	.4byte _080458A8
	.4byte _080458A8
	.4byte _08045868
	.4byte _080458A8
	.4byte _080458A8
	.4byte _0804587E
	.4byte _080458A8
	.4byte _080458A8
	.4byte _08045894
_0804583C:
	movs r2, 0x15
	cmp r3, 0
	beq _080458A8
	movs r2, 0x47
	cmp r3, 0x1
	beq _080458A8
	movs r2, 0x65
	cmp r3, 0x2
	bne _080458A8
	movs r2, 0x56
	b _080458A8
_08045852:
	movs r2, 0x18
	cmp r3, 0
	beq _080458A8
	movs r2, 0x4A
	cmp r3, 0x1
	beq _080458A8
	movs r2, 0x68
	cmp r3, 0x2
	bne _080458A8
	movs r2, 0x59
	b _080458A8
_08045868:
	movs r2, 0x1B
	cmp r3, 0
	beq _080458A8
	movs r2, 0x4D
	cmp r3, 0x1
	beq _080458A8
	movs r2, 0x6B
	cmp r3, 0x2
	bne _080458A8
	movs r2, 0x5C
	b _080458A8
_0804587E:
	movs r2, 0x1E
	cmp r3, 0
	beq _080458A8
	movs r2, 0x50
	cmp r3, 0x1
	beq _080458A8
	movs r2, 0x6E
	cmp r3, 0x2
	bne _080458A8
	movs r2, 0x5F
	b _080458A8
_08045894:
	movs r2, 0x21
	cmp r3, 0
	beq _080458A8
	movs r2, 0x53
	cmp r3, 0x1
	beq _080458A8
	movs r2, 0x71
	cmp r3, 0x2
	bne _080458A8
	movs r2, 0x62
_080458A8:
	adds r0, r2, 0
	pop {r1}
	bx r1
	thumb_func_end sub_80457E8

	thumb_func_start sub_80458B0
sub_80458B0: @ 80458B0
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	lsls r0, 24
	lsrs r5, r0, 24
	ldr r1, _08045984 @ =gSprites
	lsls r0, r5, 4
	adds r0, r5
	lsls r0, 2
	adds r0, r1
	ldrh r0, [r0, 0x3A]
	lsls r0, 24
	lsrs r0, 24
	bl battle_get_per_side_status
	lsls r0, 24
	lsrs r0, 24
	lsls r1, r0, 1
	adds r1, r0
	lsls r1, 7
	ldr r0, _08045988 @ =0x02000520
	adds r6, r1, r0
	movs r1, 0x7
	mov r8, r1
	ldr r1, _0804598C @ =gUnknown_08400DD6
	adds r0, r6, 0
	bl sub_80034D4
	movs r4, 0
_080458EE:
	movs r0, 0x2B
	bl sub_8043CDC
	lsls r1, r4, 6
	adds r1, r6, r1
	ldr r2, _08045990 @ =REG_BG0CNT
	bl CpuSet
	adds r0, r4, 0x1
	lsls r0, 24
	lsrs r4, r0, 24
	cmp r4, r8
	bcc _080458EE
	movs r7, 0x3
	movs r2, 0x3
	add r2, r8
	mov r9, r2
	cmp r7, r9
	bge _08045974
	ldr r1, _08045984 @ =gSprites
	ldr r0, _08045990 @ =REG_BG0CNT
	mov r10, r0
	lsls r0, r5, 4
	adds r0, r5
	lsls r0, 2
	adds r0, r1
	mov r8, r0
_08045924:
	mov r1, r8
	ldrh r0, [r1, 0x4]
	lsls r0, 22
	lsrs r0, 22
	adds r5, r7, 0
	cmp r7, 0
	bge _08045934
	adds r5, r7, 0x7
_08045934:
	asrs r5, 3
	lsls r4, r5, 3
	subs r4, r7, r4
	adds r0, r4
	lsls r5, 6
	adds r0, r5
	lsls r0, 5
	ldr r2, _08045994 @ =0x06010000
	adds r1, r0, r2
	adds r0, r6, 0
	mov r2, r10
	bl CpuSet
	adds r6, 0x20
	mov r1, r8
	ldrh r0, [r1, 0x4]
	lsls r0, 22
	lsrs r0, 22
	adds r4, 0x8
	adds r0, r4
	adds r0, r5
	lsls r0, 5
	ldr r2, _08045994 @ =0x06010000
	adds r1, r0, r2
	adds r0, r6, 0
	mov r2, r10
	bl CpuSet
	adds r6, 0x20
	adds r7, 0x1
	cmp r7, r9
	blt _08045924
_08045974:
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_08045984: .4byte gSprites
_08045988: .4byte 0x02000520
_0804598C: .4byte gUnknown_08400DD6
_08045990: .4byte REG_BG0CNT
_08045994: .4byte 0x06010000
	thumb_func_end sub_80458B0

	thumb_func_start sub_8045998
sub_8045998: @ 8045998
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	ldr r0, _08045A38 @ =gUnknown_020238CC
	mov r8, r0
	ldr r1, _08045A3C @ =gUnknown_08400DE6
	bl StringCopy
	adds r7, r0, 0
	ldr r0, _08045A40 @ =gNumSafariBalls
	ldrb r1, [r0]
	adds r0, r7, 0
	movs r2, 0xA
	movs r3, 0x1
	bl sub_8003504
	adds r7, r0, 0
	ldr r1, _08045A44 @ =gUnknown_08400DF0
	bl StringAppend
	ldr r0, _08045A48 @ =gSprites
	lsls r5, r4, 4
	adds r5, r4
	lsls r5, 2
	adds r5, r0
	ldrh r0, [r5, 0x3A]
	lsls r0, 24
	lsrs r0, 24
	bl battle_get_per_side_status
	lsls r0, 24
	lsrs r0, 24
	lsls r4, r0, 1
	adds r4, r0
	lsls r4, 7
	ldr r0, _08045A4C @ =0x02000520
	adds r7, r4, r0
	movs r6, 0x5
	adds r0, r7, 0
	mov r1, r8
	bl sub_80034D4
	ldr r0, _08045A50 @ =0x02000540
	adds r7, r4, r0
	movs r4, 0x6
_080459F8:
	ldrh r0, [r5, 0x4]
	lsls r0, 22
	lsrs r2, r0, 22
	adds r0, r4, 0
	cmp r4, 0
	bge _08045A06
	adds r0, r4, 0x7
_08045A06:
	asrs r0, 3
	lsls r1, r0, 3
	subs r1, r4, r1
	adds r1, 0x18
	adds r1, r2, r1
	lsls r0, 6
	adds r1, r0
	lsls r1, 5
	ldr r0, _08045A54 @ =0x06010000
	adds r1, r0
	adds r0, r7, 0
	ldr r2, _08045A58 @ =REG_BG0CNT
	bl CpuSet
	adds r7, 0x40
	adds r4, 0x1
	adds r0, r6, 0x6
	cmp r4, r0
	blt _080459F8
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_08045A38: .4byte gUnknown_020238CC
_08045A3C: .4byte gUnknown_08400DE6
_08045A40: .4byte gNumSafariBalls
_08045A44: .4byte gUnknown_08400DF0
_08045A48: .4byte gSprites
_08045A4C: .4byte 0x02000520
_08045A50: .4byte 0x02000540
_08045A54: .4byte 0x06010000
_08045A58: .4byte REG_BG0CNT
	thumb_func_end sub_8045998

	thumb_func_start sub_8045A5C
sub_8045A5C: @ 8045A5C
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	sub sp, 0x8
	mov r9, r1
	lsls r0, 24
	lsrs r0, 24
	mov r8, r0
	lsls r2, 24
	lsrs r7, r2, 24
	ldr r1, _08045BE4 @ =gSprites
	lsls r0, 4
	add r0, r8
	lsls r0, 2
	adds r0, r1
	ldrh r0, [r0, 0x3A]
	lsls r0, 24
	lsrs r0, 24
	mov r10, r0
	bl battle_side_get_owner
	lsls r0, 24
	cmp r0, 0
	beq _08045A92
	b _08045BF0
_08045A92:
	cmp r7, 0x3
	beq _08045A9A
	cmp r7, 0
	bne _08045AAE
_08045A9A:
	mov r0, r9
	movs r1, 0x38
	bl GetMonData
	adds r1, r0, 0
	lsls r1, 24
	lsrs r1, 24
	mov r0, r8
	bl sub_8043FC0
_08045AAE:
	cmp r7, 0x1
	bhi _08045AC8
	mov r0, r9
	movs r1, 0x39
	bl GetMonData
	adds r1, r0, 0
	lsls r1, 16
	asrs r1, 16
	mov r0, r8
	movs r2, 0
	bl sub_80440EC
_08045AC8:
	cmp r7, 0x2
	beq _08045AD0
	cmp r7, 0
	bne _08045AE6
_08045AD0:
	mov r0, r9
	movs r1, 0x3A
	bl GetMonData
	adds r1, r0, 0
	lsls r1, 16
	asrs r1, 16
	mov r0, r8
	movs r2, 0x1
	bl sub_80440EC
_08045AE6:
	cmp r7, 0x5
	beq _08045AEE
	cmp r7, 0
	bne _08045B22
_08045AEE:
	movs r0, 0
	bl load_gfxc_health_bar
	mov r0, r9
	movs r1, 0x3A
	bl GetMonData
	adds r4, r0, 0
	mov r0, r9
	movs r1, 0x39
	bl GetMonData
	adds r3, r0, 0
	movs r0, 0
	str r0, [sp]
	mov r0, r10
	mov r1, r8
	adds r2, r4, 0
	bl sub_8043D84
	mov r0, r10
	mov r1, r8
	movs r2, 0
	movs r3, 0
	bl sub_8045C78
_08045B22:
	bl IsDoubleBattle
	lsls r0, 24
	lsrs r0, 24
	str r0, [sp, 0x4]
	cmp r0, 0
	bne _08045BA6
	cmp r7, 0x6
	beq _08045B38
	cmp r7, 0
	bne _08045BA6
_08045B38:
	movs r0, 0x3
	bl load_gfxc_health_bar
	mov r0, r9
	movs r1, 0xB
	bl GetMonData
	adds r5, r0, 0
	lsls r5, 16
	lsrs r5, 16
	mov r0, r9
	movs r1, 0x38
	bl GetMonData
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	mov r0, r9
	movs r1, 0x19
	bl GetMonData
	adds r3, r0, 0
	ldr r6, _08045BE8 @ =gExperienceTables
	lsls r1, r4, 2
	ldr r2, _08045BEC @ =gBaseStats
	lsls r0, r5, 3
	subs r0, r5
	lsls r0, 2
	adds r0, r2
	ldrb r2, [r0, 0x13]
	movs r0, 0xCA
	lsls r0, 1
	muls r0, r2
	adds r1, r0
	adds r1, r6
	ldr r1, [r1]
	subs r3, r1
	adds r4, 0x1
	lsls r4, 2
	adds r4, r0
	adds r4, r6
	ldr r2, [r4]
	subs r2, r1
	ldr r0, [sp, 0x4]
	str r0, [sp]
	mov r0, r10
	mov r1, r8
	bl sub_8043D84
	mov r0, r10
	mov r1, r8
	movs r2, 0x1
	movs r3, 0
	bl sub_8045C78
_08045BA6:
	cmp r7, 0x4
	beq _08045BAE
	cmp r7, 0
	bne _08045BB6
_08045BAE:
	mov r0, r8
	mov r1, r9
	bl sub_80451A0
_08045BB6:
	cmp r7, 0x9
	beq _08045BBE
	cmp r7, 0
	bne _08045BC4
_08045BBE:
	mov r0, r8
	bl draw_status_ailment_maybe
_08045BC4:
	cmp r7, 0xA
	bne _08045BCE
	mov r0, r8
	bl sub_80458B0
_08045BCE:
	adds r0, r7, 0
	subs r0, 0xA
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bhi _08045C66
	mov r0, r8
	bl sub_8045998
	b _08045C66
	.align 2, 0
_08045BE4: .4byte gSprites
_08045BE8: .4byte gExperienceTables
_08045BEC: .4byte gBaseStats
_08045BF0:
	cmp r7, 0x3
	beq _08045BF8
	cmp r7, 0
	bne _08045C0C
_08045BF8:
	mov r0, r9
	movs r1, 0x38
	bl GetMonData
	adds r1, r0, 0
	lsls r1, 24
	lsrs r1, 24
	mov r0, r8
	bl sub_8043FC0
_08045C0C:
	cmp r7, 0x5
	beq _08045C14
	cmp r7, 0
	bne _08045C48
_08045C14:
	movs r0, 0
	bl load_gfxc_health_bar
	mov r0, r9
	movs r1, 0x3A
	bl GetMonData
	adds r4, r0, 0
	mov r0, r9
	movs r1, 0x39
	bl GetMonData
	adds r3, r0, 0
	movs r0, 0
	str r0, [sp]
	mov r0, r10
	mov r1, r8
	adds r2, r4, 0
	bl sub_8043D84
	mov r0, r10
	mov r1, r8
	movs r2, 0
	movs r3, 0
	bl sub_8045C78
_08045C48:
	cmp r7, 0x4
	beq _08045C50
	cmp r7, 0
	bne _08045C58
_08045C50:
	mov r0, r8
	mov r1, r9
	bl sub_80451A0
_08045C58:
	cmp r7, 0x9
	beq _08045C60
	cmp r7, 0
	bne _08045C66
_08045C60:
	mov r0, r8
	bl draw_status_ailment_maybe
_08045C66:
	add sp, 0x8
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	thumb_func_end sub_8045A5C

	thumb_func_start sub_8045C78
sub_8045C78: @ 8045C78
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	sub sp, 0x8
	lsls r0, 24
	lsrs r7, r0, 24
	lsls r2, 24
	lsrs r2, 24
	mov r9, r2
	cmp r2, 0
	bne _08045CBC
	lsls r5, r7, 2
	adds r3, r5, r7
	lsls r3, 2
	ldr r4, _08045CB8 @ =0x02017850
	adds r2, r3, r4
	ldr r0, [r2, 0x4]
	ldr r1, [r2, 0x8]
	ldr r2, [r2, 0xC]
	adds r4, 0x10
	adds r3, r4
	movs r4, 0x6
	str r4, [sp]
	movs r4, 0x1
	str r4, [sp, 0x4]
	bl sub_8045F58
	adds r6, r0, 0
	adds r4, r5, 0
	b _08045D0A
	.align 2, 0
_08045CB8: .4byte 0x02017850
_08045CBC:
	lsls r4, r7, 2
	adds r0, r4, r7
	lsls r0, 2
	mov r10, r0
	ldr r6, _08045D50 @ =0x02017850
	add r6, r10
	ldr r0, [r6, 0x8]
	ldr r1, [r6, 0xC]
	ldr r2, [r6, 0x4]
	movs r3, 0x8
	bl GetScaledExpFraction
	lsls r0, 24
	lsrs r5, r0, 24
	cmp r5, 0
	bne _08045CDE
	movs r5, 0x1
_08045CDE:
	ldr r0, [r6, 0xC]
	mov r8, r0
	adds r1, r5, 0
	bl __divsi3
	cmp r0, 0
	bge _08045CEE
	negs r0, r0
_08045CEE:
	lsls r0, 16
	lsrs r5, r0, 16
	ldr r0, [r6, 0x4]
	ldr r1, [r6, 0x8]
	ldr r3, _08045D50 @ =0x02017850
	adds r3, 0x10
	add r3, r10
	movs r2, 0x8
	str r2, [sp]
	str r5, [sp, 0x4]
	mov r2, r8
	bl sub_8045F58
	adds r6, r0, 0
_08045D0A:
	mov r0, r9
	cmp r0, 0x1
	beq _08045D22
	cmp r0, 0
	bne _08045D2A
	ldr r0, _08045D54 @ =0x02017800
	adds r0, r4, r0
	ldrb r1, [r0]
	movs r0, 0x10
	ands r0, r1
	cmp r0, 0
	bne _08045D2A
_08045D22:
	adds r0, r7, 0
	mov r1, r9
	bl sub_8045D58
_08045D2A:
	movs r0, 0x1
	negs r0, r0
	cmp r6, r0
	bne _08045D3E
	adds r0, r4, r7
	lsls r0, 2
	ldr r1, _08045D50 @ =0x02017850
	adds r0, r1
	movs r1, 0
	str r1, [r0, 0x10]
_08045D3E:
	adds r0, r6, 0
	add sp, 0x8
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r1}
	bx r1
	.align 2, 0
_08045D50: .4byte 0x02017850
_08045D54: .4byte 0x02017800
	thumb_func_end sub_8045C78

	thumb_func_start sub_8045D58
sub_8045D58: @ 8045D58
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	sub sp, 0x10
	lsls r0, 24
	lsrs r6, r0, 24
	lsls r1, 24
	lsrs r1, 24
	cmp r1, 0
	beq _08045D72
	cmp r1, 0x1
	beq _08045E54
	b _08045F42
_08045D72:
	lsls r5, r6, 2
	adds r3, r5, r6
	lsls r3, 2
	ldr r4, _08045E00 @ =0x02017850
	adds r2, r3, r4
	ldr r0, [r2, 0x4]
	ldr r1, [r2, 0x8]
	ldr r2, [r2, 0xC]
	adds r4, 0x10
	adds r3, r4
	add r4, sp, 0x8
	str r4, [sp]
	movs r4, 0x6
	str r4, [sp, 0x4]
	bl sub_804602C
	lsls r0, 24
	lsrs r0, 24
	movs r1, 0x3
	mov r8, r1
	adds r1, r5, 0
	cmp r0, 0x18
	bhi _08045DAC
	movs r2, 0x38
	mov r8, r2
	cmp r0, 0x9
	bls _08045DAC
	movs r4, 0x2F
	mov r8, r4
_08045DAC:
	movs r5, 0
	ldr r7, _08045E04 @ =gSprites
	adds r0, r1, r6
	lsls r6, r0, 2
_08045DB4:
	ldr r0, _08045E00 @ =0x02017850
	adds r0, r6, r0
	ldrb r1, [r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r7
	ldrh r0, [r0, 0x38]
	lsls r0, 24
	lsrs r4, r0, 24
	cmp r5, 0x1
	bhi _08045E10
	mov r0, r8
	bl sub_8043CDC
	mov r1, sp
	adds r1, r5
	adds r1, 0x8
	ldrb r1, [r1]
	lsls r1, 5
	adds r0, r1
	lsls r1, r4, 4
	adds r1, r4
	lsls r1, 2
	adds r1, r7
	ldrh r1, [r1, 0x4]
	lsls r1, 22
	lsrs r1, 22
	adds r2, r5, 0x2
	adds r1, r2
	lsls r1, 5
	ldr r2, _08045E08 @ =0x06010000
	adds r1, r2
	ldr r2, _08045E0C @ =REG_BG0CNT
	bl CpuSet
	b _08045E3E
	.align 2, 0
_08045E00: .4byte 0x02017850
_08045E04: .4byte gSprites
_08045E08: .4byte 0x06010000
_08045E0C: .4byte REG_BG0CNT
_08045E10:
	mov r0, r8
	bl sub_8043CDC
	mov r1, sp
	adds r1, r5
	adds r1, 0x8
	ldrb r1, [r1]
	lsls r1, 5
	adds r0, r1
	lsls r1, r4, 4
	adds r1, r4
	lsls r1, 2
	adds r1, r7
	ldrh r1, [r1, 0x4]
	lsls r1, 22
	lsrs r1, 22
	adds r1, r5, r1
	lsls r1, 5
	ldr r4, _08045E4C @ =0x06010040
	adds r1, r4
	ldr r2, _08045E50 @ =REG_BG0CNT
	bl CpuSet
_08045E3E:
	adds r0, r5, 0x1
	lsls r0, 24
	lsrs r5, r0, 24
	cmp r5, 0x5
	bls _08045DB4
	b _08045F42
	.align 2, 0
_08045E4C: .4byte 0x06010040
_08045E50: .4byte REG_BG0CNT
_08045E54:
	lsls r5, r6, 2
	adds r3, r5, r6
	lsls r3, 2
	ldr r4, _08045EF0 @ =0x02017850
	adds r2, r3, r4
	ldr r0, [r2, 0x4]
	ldr r1, [r2, 0x8]
	ldr r2, [r2, 0xC]
	adds r4, 0x10
	adds r3, r4
	add r4, sp, 0x8
	str r4, [sp]
	movs r4, 0x8
	str r4, [sp, 0x4]
	bl sub_804602C
	ldr r1, _08045EF4 @ =gUnknown_02024A6A
	lsls r0, r6, 1
	adds r0, r1
	ldrh r1, [r0]
	movs r0, 0x64
	muls r0, r1
	ldr r1, _08045EF8 @ =gPlayerParty
	adds r0, r1
	movs r1, 0x38
	bl GetMonData
	lsls r0, 24
	lsrs r0, 24
	adds r1, r5, 0
	cmp r0, 0x64
	bne _08045EAA
	movs r5, 0
	movs r2, 0
_08045E98:
	mov r0, sp
	adds r0, r5
	adds r0, 0x8
	strb r2, [r0]
	adds r0, r5, 0x1
	lsls r0, 24
	lsrs r5, r0, 24
	cmp r5, 0x7
	bls _08045E98
_08045EAA:
	movs r5, 0
	ldr r7, _08045EFC @ =gSprites
	adds r0, r1, r6
	lsls r0, 2
	ldr r1, _08045EF0 @ =0x02017850
	adds r4, r0, r1
_08045EB6:
	cmp r5, 0x3
	bhi _08045F08
	movs r0, 0xC
	bl sub_8043CDC
	mov r1, sp
	adds r1, r5
	adds r1, 0x8
	ldrb r1, [r1]
	lsls r1, 5
	adds r0, r1
	ldrb r2, [r4]
	lsls r1, r2, 4
	adds r1, r2
	lsls r1, 2
	adds r1, r7
	ldrh r1, [r1, 0x4]
	lsls r1, 22
	lsrs r1, 22
	adds r2, r5, 0
	adds r2, 0x24
	adds r1, r2
	lsls r1, 5
	ldr r2, _08045F00 @ =0x06010000
	adds r1, r2
	ldr r2, _08045F04 @ =REG_BG0CNT
	bl CpuSet
	b _08045F38
	.align 2, 0
_08045EF0: .4byte 0x02017850
_08045EF4: .4byte gUnknown_02024A6A
_08045EF8: .4byte gPlayerParty
_08045EFC: .4byte gSprites
_08045F00: .4byte 0x06010000
_08045F04: .4byte REG_BG0CNT
_08045F08:
	movs r0, 0xC
	bl sub_8043CDC
	mov r1, sp
	adds r1, r5
	adds r1, 0x8
	ldrb r1, [r1]
	lsls r1, 5
	adds r0, r1
	ldrb r2, [r4]
	lsls r1, r2, 4
	adds r1, r2
	lsls r1, 2
	adds r1, r7
	ldrh r1, [r1, 0x4]
	lsls r1, 22
	lsrs r1, 22
	adds r1, r5, r1
	lsls r1, 5
	ldr r2, _08045F50 @ =0x06010b80
	adds r1, r2
	ldr r2, _08045F54 @ =REG_BG0CNT
	bl CpuSet
_08045F38:
	adds r0, r5, 0x1
	lsls r0, 24
	lsrs r5, r0, 24
	cmp r5, 0x7
	bls _08045EB6
_08045F42:
	add sp, 0x10
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_08045F50: .4byte 0x06010b80
_08045F54: .4byte REG_BG0CNT
	thumb_func_end sub_8045D58

	thumb_func_start sub_8045F58
sub_8045F58: @ 8045F58
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	adds r7, r0, 0
	adds r4, r1, 0
	mov r8, r2
	adds r5, r3, 0
	ldr r1, [sp, 0x18]
	ldr r0, [sp, 0x1C]
	lsls r0, 16
	lsrs r3, r0, 16
	lsls r1, 27
	lsrs r2, r1, 24
	ldr r1, [r5]
	ldr r0, _08045F84 @ =0xffff8000
	cmp r1, r0
	bne _08045F8A
	cmp r7, r2
	bge _08045F88
	lsls r0, r4, 8
	str r0, [r5]
	b _08045F8A
	.align 2, 0
_08045F84: .4byte 0xffff8000
_08045F88:
	str r4, [r5]
_08045F8A:
	mov r0, r8
	subs r4, r0
	cmp r4, 0
	bge _08045F96
	movs r4, 0
	b _08045F9C
_08045F96:
	cmp r4, r7
	ble _08045F9C
	adds r4, r7, 0
_08045F9C:
	cmp r7, r2
	bge _08045FB8
	ldr r0, [r5]
	asrs r1, r0, 8
	adds r6, r0, 0
	cmp r4, r1
	bne _08045FC4
	movs r0, 0xFF
	ands r0, r6
	cmp r0, 0
	bne _08045FC4
	movs r0, 0x1
	negs r0, r0
	b _08046020
_08045FB8:
	ldr r6, [r5]
	cmp r4, r6
	bne _08045FC4
	movs r0, 0x1
	negs r0, r0
	b _08046020
_08045FC4:
	cmp r7, r2
	bge _08045FFE
	lsls r0, r7, 8
	adds r1, r2, 0
	bl __divsi3
	mov r1, r8
	cmp r1, 0
	bge _08045FE2
	adds r0, r6, r0
	str r0, [r5]
	asrs r2, r0, 8
	cmp r2, r4
	blt _0804601E
	b _08045FF6
_08045FE2:
	subs r0, r6, r0
	str r0, [r5]
	asrs r2, r0, 8
	movs r1, 0xFF
	ands r0, r1
	cmp r0, 0
	ble _08045FF2
	adds r2, 0x1
_08045FF2:
	cmp r2, r4
	bgt _0804601E
_08045FF6:
	lsls r0, r4, 8
	str r0, [r5]
	adds r2, r4, 0
	b _0804601E
_08045FFE:
	mov r0, r8
	cmp r0, 0
	bge _08046010
	ldr r0, [r5]
	adds r0, r3
	str r0, [r5]
	cmp r0, r4
	ble _0804601C
	b _0804601A
_08046010:
	ldr r0, [r5]
	subs r0, r3
	str r0, [r5]
	cmp r0, r4
	bge _0804601C
_0804601A:
	str r4, [r5]
_0804601C:
	ldr r2, [r5]
_0804601E:
	adds r0, r2, 0
_08046020:
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r1}
	bx r1
	thumb_func_end sub_8045F58

	thumb_func_start sub_804602C
sub_804602C: @ 804602C
	push {r4-r7,lr}
	adds r4, r0, 0
	mov r12, r3
	ldr r7, [sp, 0x14]
	ldr r0, [sp, 0x18]
	lsls r0, 24
	lsrs r6, r0, 24
	subs r5, r1, r2
	cmp r5, 0
	bge _08046044
	movs r5, 0
	b _0804604A
_08046044:
	cmp r5, r4
	ble _0804604A
	adds r5, r4, 0
_0804604A:
	lsls r0, r6, 27
	lsrs r3, r0, 24
	movs r1, 0
	cmp r1, r6
	bcs _08046064
	movs r2, 0
_08046056:
	adds r0, r7, r1
	strb r2, [r0]
	adds r0, r1, 0x1
	lsls r0, 24
	lsrs r1, r0, 24
	cmp r1, r6
	bcc _08046056
_08046064:
	cmp r4, r3
	bge _08046078
	mov r1, r12
	ldr r0, [r1]
	muls r0, r3
	adds r1, r4, 0
	bl __divsi3
	asrs r0, 8
	b _08046084
_08046078:
	mov r1, r12
	ldr r0, [r1]
	muls r0, r3
	adds r1, r4, 0
	bl __divsi3
_08046084:
	lsls r0, 24
	lsrs r2, r0, 24
	adds r3, r2, 0
	cmp r3, 0
	bne _0804609A
	cmp r5, 0
	ble _0804609A
	movs r0, 0x1
	strb r0, [r7]
	movs r3, 0x1
	b _080460BE
_0804609A:
	movs r1, 0
	movs r4, 0x8
_0804609E:
	cmp r1, r6
	bcs _080460BE
	cmp r2, 0x7
	bls _080460BA
	adds r0, r7, r1
	strb r4, [r0]
	adds r0, r2, 0
	subs r0, 0x8
	lsls r0, 24
	lsrs r2, r0, 24
	adds r0, r1, 0x1
	lsls r0, 24
	lsrs r1, r0, 24
	b _0804609E
_080460BA:
	adds r0, r7, r1
	strb r2, [r0]
_080460BE:
	adds r0, r3, 0
	pop {r4-r7}
	pop {r1}
	bx r1
	thumb_func_end sub_804602C

	thumb_func_start sub_80460C8
sub_80460C8: @ 80460C8
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	sub sp, 0x8
	adds r5, r0, 0
	adds r6, r1, 0
	adds r4, r2, 0
	mov r8, r3
	ldr r0, [r5]
	ldr r1, [r5, 0x4]
	ldr r2, [r5, 0x8]
	movs r3, 0x6
	str r3, [sp]
	movs r3, 0x1
	str r3, [sp, 0x4]
	adds r3, r6, 0
	bl sub_8045F58
	lsls r0, 16
	lsrs r7, r0, 16
	adds r0, r5, 0
	adds r1, r6, 0
	adds r2, r4, 0
	bl sub_8046128
	ldr r0, [r5]
	cmp r0, 0x2F
	bgt _08046108
	ldr r0, [r6]
	lsls r0, 8
	lsrs r1, r0, 16
	b _0804610A
_08046108:
	ldrh r1, [r6]
_0804610A:
	movs r2, 0
	ldrsh r0, [r5, r2]
	lsls r1, 16
	asrs r1, 16
	mov r2, r8
	bl sub_804373C
	lsls r0, r7, 16
	asrs r0, 16
	add sp, 0x8
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r1}
	bx r1
	thumb_func_end sub_80460C8

	thumb_func_start sub_8046128
sub_8046128: @ 8046128
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	sub sp, 0x1C
	adds r5, r0, 0
	adds r3, r1, 0
	mov r8, r2
	ldr r0, [r5]
	ldr r1, [r5, 0x4]
	ldr r2, [r5, 0x8]
	add r4, sp, 0x8
	str r4, [sp]
	movs r4, 0x6
	str r4, [sp, 0x4]
	bl sub_804602C
	movs r3, 0
	add r7, sp, 0x10
	mov r12, r7
	ldrb r0, [r5, 0xC]
	lsls r6, r0, 27
	ldr r4, [r5, 0x10]
_08046154:
	lsls r2, r3, 1
	add r2, r12
	lsrs r1, r6, 15
	mov r0, sp
	adds r0, r3
	adds r0, 0x8
	ldrb r0, [r0]
	adds r0, r4, r0
	orrs r1, r0
	strh r1, [r2]
	adds r0, r3, 0x1
	lsls r0, 24
	lsrs r3, r0, 24
	cmp r3, 0x5
	bls _08046154
	adds r0, r7, 0
	mov r1, r8
	movs r2, 0x6
	bl CpuSet
	add sp, 0x1C
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r0}
	bx r0
	thumb_func_end sub_8046128

	thumb_func_start GetScaledExpFraction
GetScaledExpFraction: @ 8046188
	push {r4-r7,lr}
	adds r6, r2, 0
	lsls r3, 27
	lsrs r7, r3, 24
	subs r5, r0, r1
	cmp r5, 0
	bge _0804619A
	movs r5, 0
	b _080461A0
_0804619A:
	cmp r5, r6
	ble _080461A0
	adds r5, r6, 0
_080461A0:
	muls r0, r7
	adds r1, r6, 0
	bl __divsi3
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	adds r0, r5, 0
	muls r0, r7
	adds r1, r6, 0
	bl __divsi3
	lsls r4, 24
	asrs r4, 24
	lsls r0, 24
	asrs r0, 24
	subs r0, r4, r0
	cmp r0, 0
	bge _080461C8
	negs r0, r0
_080461C8:
	lsls r0, 24
	lsrs r0, 24
	pop {r4-r7}
	pop {r1}
	bx r1
	thumb_func_end GetScaledExpFraction

	thumb_func_start GetScaledHPFraction
GetScaledHPFraction: @ 80461D4
	push {r4,lr}
	lsls r2, 24
	lsrs r2, 24
	lsls r0, 16
	asrs r4, r0, 16
	adds r0, r4, 0
	muls r0, r2
	lsls r1, 16
	asrs r1, 16
	bl __divsi3
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0
	bne _080461F8
	cmp r4, 0
	ble _080461F8
	movs r0, 0x1
_080461F8:
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end GetScaledHPFraction

	thumb_func_start GetHPBarLevel
GetHPBarLevel: @ 8046200
	push {lr}
	lsls r0, 16
	asrs r0, 16
	lsls r1, 16
	asrs r1, 16
	cmp r0, r1
	bne _08046212
	movs r0, 0x4
	b _0804622E
_08046212:
	movs r2, 0x30
	bl GetScaledHPFraction
	lsls r0, 24
	lsrs r1, r0, 24
	movs r0, 0x3
	cmp r1, 0x18
	bhi _0804622E
	movs r0, 0x2
	cmp r1, 0x9
	bhi _0804622E
	negs r0, r1
	orrs r0, r1
	lsrs r0, 31
_0804622E:
	pop {r1}
	bx r1
	thumb_func_end GetHPBarLevel

	.align 2, 0 @ Don't pad with nop.
