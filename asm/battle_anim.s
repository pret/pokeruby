	.include "constants/gba_constants.inc"
	.include "constants/species_constants.inc"
	.include "asm/macros.inc"

	.syntax unified

	.text

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
	ldr r5, _080771A0 @ =gBattleAnimScriptPtr
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
_080771A0: .4byte gBattleAnimScriptPtr
	thumb_func_end ma19_08073BC8

	thumb_func_start ma1A_8073C00
ma1A_8073C00: @ 80771A4
	push {r4,lr}
	ldr r4, _080771CC @ =gBattleAnimScriptPtr
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
_080771CC: .4byte gBattleAnimScriptPtr
	thumb_func_end ma1A_8073C00

	thumb_func_start ma1B_8073C2C
ma1B_8073C2C: @ 80771D0
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	ldr r0, _08077280 @ =gBattleAnimScriptPtr
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
_08077280: .4byte gBattleAnimScriptPtr
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
	ldr r0, _080773A4 @ =gBattleAnimScriptPtr
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
_080773A4: .4byte gBattleAnimScriptPtr
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
	ldr r0, _08077464 @ =gBattleAnimScriptPtr
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
_08077464: .4byte gBattleAnimScriptPtr
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
	ldr r6, _080774EC @ =gBattleAnimScriptPtr
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
_080774EC: .4byte gBattleAnimScriptPtr
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
	ldr r6, _080775BC @ =gBattleAnimScriptPtr
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
_080775BC: .4byte gBattleAnimScriptPtr
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
	ldr r4, _08077678 @ =gBattleAnimScriptPtr
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
_08077678: .4byte gBattleAnimScriptPtr
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
	ldr r1, _08077700 @ =gBattleAnimScriptPtr
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
_08077700: .4byte gBattleAnimScriptPtr
_08077704: .4byte gUnknown_0202F7B0
	thumb_func_end ma20_wait_for_something

	thumb_func_start ma21_08074164
ma21_08074164: @ 8077708
	push {r4-r6,lr}
	ldr r5, _08077748 @ =gBattleAnimScriptPtr
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
_08077748: .4byte gBattleAnimScriptPtr
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
	ldr r4, _0807778C @ =gBattleAnimScriptPtr
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
_0807778C: .4byte gBattleAnimScriptPtr
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
	ldr r0, _080777B0 @ =gBattleAnimScriptPtr
	ldr r1, [r0]
	ldrb r2, [r1, 0x1]
	adds r1, 0x2
	str r1, [r0]
	cmp r2, 0
	beq _080777B8
	ldr r0, _080777B4 @ =gUnknown_0202F7C9
	b _080777BA
	.align 2, 0
_080777B0: .4byte gBattleAnimScriptPtr
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
	ldr r0, _08077840 @ =gBattleAnimScriptPtr
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
_08077840: .4byte gBattleAnimScriptPtr
_08077844: .4byte REG_BG1CNT
_08077848: .4byte REG_BG2CNT
	thumb_func_end sub_8077808

	thumb_func_start sub_807784C
sub_807784C: @ 807784C
	push {r4-r7,lr}
	ldr r1, _0807787C @ =gBattleAnimScriptPtr
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
_0807787C: .4byte gBattleAnimScriptPtr
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
	ldr r4, _08077904 @ =gBattleAnimScriptPtr
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
_08077904: .4byte gBattleAnimScriptPtr
_08077908: .4byte gSprites
	thumb_func_end ma2B_make_side_invisible

	thumb_func_start ma2C_make_side_visible
ma2C_make_side_visible: @ 807790C
	push {r4,lr}
	ldr r4, _08077944 @ =gBattleAnimScriptPtr
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
_08077944: .4byte gBattleAnimScriptPtr
_08077948: .4byte gSprites
	thumb_func_end ma2C_make_side_visible

	thumb_func_start sub_807794C
sub_807794C: @ 807794C
	push {r4-r7,lr}
	ldr r1, _08077998 @ =gBattleAnimScriptPtr
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
_08077998: .4byte gBattleAnimScriptPtr
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
	ldr r1, _08077A48 @ =gBattleAnimScriptPtr
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
_08077A48: .4byte gBattleAnimScriptPtr
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
	ldr r1, _08077AB8 @ =gBattleAnimScriptPtr
	ldr r0, [r1]
	adds r0, 0x1
	str r0, [r1]
	pop {r0}
	bx r0
	.align 2, 0
_08077AB0: .4byte gMPlay_SE1
_08077AB4: .4byte gMPlay_SE2
_08077AB8: .4byte gBattleAnimScriptPtr
	thumb_func_end ma2F_stop_music

	.align 2, 0 @ Don't pad with nop.
