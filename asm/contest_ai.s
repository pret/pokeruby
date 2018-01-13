	.include "constants/gba_constants.inc"
	.include "include/macros.inc"

	.syntax unified

	.text

	thumb_func_start ContestAICmd_check_combo_starter
ContestAICmd_check_combo_starter: @ 8129B44
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	movs r5, 0
	ldr r3, _08129BAC @ =gContestMons
	ldr r2, _08129BB0 @ =gSharedMem + 0x192E4
	ldrb r1, [r2, 0x4]
	lsls r1, 1
	adds r2, 0x41
	ldrb r0, [r2]
	lsls r0, 6
	adds r1, r0
	adds r3, 0x1E
	adds r1, r3
	ldrh r6, [r1]
	movs r4, 0
	mov r8, r2
	adds r7, r3, 0
_08129B68:
	lsls r0, r4, 1
	mov r2, r8
	ldrb r1, [r2]
	lsls r1, 6
	adds r0, r1
	adds r1, r0, r7
	ldrh r0, [r1]
	cmp r0, 0
	beq _08129B8A
	adds r1, r0, 0
	adds r0, r6, 0
	bl AreMovesContestCombo
	lsls r0, 24
	lsrs r5, r0, 24
	cmp r5, 0
	bne _08129B94
_08129B8A:
	adds r4, 0x1
	cmp r4, 0x3
	ble _08129B68
	cmp r5, 0
	beq _08129B96
_08129B94:
	movs r5, 0x1
_08129B96:
	ldr r0, _08129BB0 @ =gSharedMem + 0x192E4
	strh r5, [r0, 0x18]
	ldr r1, _08129BB4 @ =gAIScriptPtr
	ldr r0, [r1]
	adds r0, 0x1
	str r0, [r1]
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_08129BAC: .4byte gContestMons
_08129BB0: .4byte gSharedMem + 0x192E4
_08129BB4: .4byte gAIScriptPtr
	thumb_func_end ContestAICmd_check_combo_starter

	thumb_func_start ContestAICmd_unk_41
ContestAICmd_unk_41: @ 8129BB8
	push {lr}
	bl ContestAICmd_check_combo_starter
	ldr r0, _08129BE4 @ =gSharedMem + 0x192E4
	movs r1, 0x18
	ldrsh r0, [r0, r1]
	cmp r0, 0
	beq _08129BEC
	ldr r3, _08129BE8 @ =gAIScriptPtr
	ldr r2, [r3]
	ldrb r1, [r2]
	ldrb r0, [r2, 0x1]
	lsls r0, 8
	orrs r1, r0
	ldrb r0, [r2, 0x2]
	lsls r0, 16
	orrs r1, r0
	ldrb r0, [r2, 0x3]
	lsls r0, 24
	orrs r1, r0
	str r1, [r3]
	b _08129BF4
	.align 2, 0
_08129BE4: .4byte gSharedMem + 0x192E4
_08129BE8: .4byte gAIScriptPtr
_08129BEC:
	ldr r1, _08129BF8 @ =gAIScriptPtr
	ldr r0, [r1]
	adds r0, 0x4
	str r0, [r1]
_08129BF4:
	pop {r0}
	bx r0
	.align 2, 0
_08129BF8: .4byte gAIScriptPtr
	thumb_func_end ContestAICmd_unk_41

	thumb_func_start ContestAICmd_unk_42
ContestAICmd_unk_42: @ 8129BFC
	push {lr}
	bl ContestAICmd_check_combo_starter
	ldr r0, _08129C28 @ =gSharedMem + 0x192E4
	movs r1, 0x18
	ldrsh r0, [r0, r1]
	cmp r0, 0
	bne _08129C30
	ldr r3, _08129C2C @ =gAIScriptPtr
	ldr r2, [r3]
	ldrb r1, [r2]
	ldrb r0, [r2, 0x1]
	lsls r0, 8
	orrs r1, r0
	ldrb r0, [r2, 0x2]
	lsls r0, 16
	orrs r1, r0
	ldrb r0, [r2, 0x3]
	lsls r0, 24
	orrs r1, r0
	str r1, [r3]
	b _08129C38
	.align 2, 0
_08129C28: .4byte gSharedMem + 0x192E4
_08129C2C: .4byte gAIScriptPtr
_08129C30:
	ldr r1, _08129C3C @ =gAIScriptPtr
	ldr r0, [r1]
	adds r0, 0x4
	str r0, [r1]
_08129C38:
	pop {r0}
	bx r0
	.align 2, 0
_08129C3C: .4byte gAIScriptPtr
	thumb_func_end ContestAICmd_unk_42

	thumb_func_start ContestAICmd_check_combo_finisher
ContestAICmd_check_combo_finisher: @ 8129C40
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	movs r5, 0
	ldr r3, _08129CA8 @ =gContestMons
	ldr r2, _08129CAC @ =gSharedMem + 0x192E4
	ldrb r1, [r2, 0x4]
	lsls r1, 1
	adds r2, 0x41
	ldrb r0, [r2]
	lsls r0, 6
	adds r1, r0
	adds r3, 0x1E
	adds r1, r3
	ldrh r6, [r1]
	movs r4, 0
	mov r8, r2
	adds r7, r3, 0
_08129C64:
	lsls r0, r4, 1
	mov r2, r8
	ldrb r1, [r2]
	lsls r1, 6
	adds r0, r1
	adds r1, r0, r7
	ldrh r0, [r1]
	cmp r0, 0
	beq _08129C84
	adds r1, r6, 0
	bl AreMovesContestCombo
	lsls r0, 24
	lsrs r5, r0, 24
	cmp r5, 0
	bne _08129C8E
_08129C84:
	adds r4, 0x1
	cmp r4, 0x3
	ble _08129C64
	cmp r5, 0
	beq _08129C90
_08129C8E:
	movs r5, 0x1
_08129C90:
	ldr r0, _08129CAC @ =gSharedMem + 0x192E4
	strh r5, [r0, 0x18]
	ldr r1, _08129CB0 @ =gAIScriptPtr
	ldr r0, [r1]
	adds r0, 0x1
	str r0, [r1]
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_08129CA8: .4byte gContestMons
_08129CAC: .4byte gSharedMem + 0x192E4
_08129CB0: .4byte gAIScriptPtr
	thumb_func_end ContestAICmd_check_combo_finisher

	thumb_func_start ContestAICmd_unk_44
ContestAICmd_unk_44: @ 8129CB4
	push {lr}
	bl ContestAICmd_check_combo_finisher
	ldr r0, _08129CE0 @ =gSharedMem + 0x192E4
	movs r1, 0x18
	ldrsh r0, [r0, r1]
	cmp r0, 0
	beq _08129CE8
	ldr r3, _08129CE4 @ =gAIScriptPtr
	ldr r2, [r3]
	ldrb r1, [r2]
	ldrb r0, [r2, 0x1]
	lsls r0, 8
	orrs r1, r0
	ldrb r0, [r2, 0x2]
	lsls r0, 16
	orrs r1, r0
	ldrb r0, [r2, 0x3]
	lsls r0, 24
	orrs r1, r0
	str r1, [r3]
	b _08129CF0
	.align 2, 0
_08129CE0: .4byte gSharedMem + 0x192E4
_08129CE4: .4byte gAIScriptPtr
_08129CE8:
	ldr r1, _08129CF4 @ =gAIScriptPtr
	ldr r0, [r1]
	adds r0, 0x4
	str r0, [r1]
_08129CF0:
	pop {r0}
	bx r0
	.align 2, 0
_08129CF4: .4byte gAIScriptPtr
	thumb_func_end ContestAICmd_unk_44

	thumb_func_start ContestAICmd_unk_45
ContestAICmd_unk_45: @ 8129CF8
	push {lr}
	bl ContestAICmd_check_combo_finisher
	ldr r0, _08129D24 @ =gSharedMem + 0x192E4
	movs r1, 0x18
	ldrsh r0, [r0, r1]
	cmp r0, 0
	bne _08129D2C
	ldr r3, _08129D28 @ =gAIScriptPtr
	ldr r2, [r3]
	ldrb r1, [r2]
	ldrb r0, [r2, 0x1]
	lsls r0, 8
	orrs r1, r0
	ldrb r0, [r2, 0x2]
	lsls r0, 16
	orrs r1, r0
	ldrb r0, [r2, 0x3]
	lsls r0, 24
	orrs r1, r0
	str r1, [r3]
	b _08129D34
	.align 2, 0
_08129D24: .4byte gSharedMem + 0x192E4
_08129D28: .4byte gAIScriptPtr
_08129D2C:
	ldr r1, _08129D38 @ =gAIScriptPtr
	ldr r0, [r1]
	adds r0, 0x4
	str r0, [r1]
_08129D34:
	pop {r0}
	bx r0
	.align 2, 0
_08129D38: .4byte gAIScriptPtr
	thumb_func_end ContestAICmd_unk_45

	thumb_func_start ContestAICmd_check_would_finish_combo
ContestAICmd_check_would_finish_combo: @ 8129D3C
	push {r4,r5,lr}
	movs r5, 0
	ldr r3, _08129D8C @ =gContestMons
	ldr r4, _08129D90 @ =gSharedMem + 0x192E4
	ldrb r0, [r4, 0x4]
	lsls r0, 1
	adds r1, r4, 0
	adds r1, 0x41
	ldrb r2, [r1]
	lsls r1, r2, 6
	adds r0, r1
	adds r3, 0x1E
	adds r0, r3
	ldrh r3, [r0]
	lsls r0, r2, 3
	subs r0, r2
	lsls r0, 2
	adds r1, r4, 0
	subs r1, 0x84
	adds r1, r0, r1
	ldrh r0, [r1, 0x8]
	cmp r0, 0
	beq _08129D74
	adds r1, r3, 0
	bl AreMovesContestCombo
	lsls r0, 24
	lsrs r5, r0, 24
_08129D74:
	cmp r5, 0
	beq _08129D7A
	movs r5, 0x1
_08129D7A:
	strh r5, [r4, 0x18]
	ldr r1, _08129D94 @ =gAIScriptPtr
	ldr r0, [r1]
	adds r0, 0x1
	str r0, [r1]
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_08129D8C: .4byte gContestMons
_08129D90: .4byte gSharedMem + 0x192E4
_08129D94: .4byte gAIScriptPtr
	thumb_func_end ContestAICmd_check_would_finish_combo

	thumb_func_start ContestAICmd_unk_47
ContestAICmd_unk_47: @ 8129D98
	push {lr}
	bl ContestAICmd_check_would_finish_combo
	ldr r0, _08129DC4 @ =gSharedMem + 0x192E4
	movs r1, 0x18
	ldrsh r0, [r0, r1]
	cmp r0, 0
	beq _08129DCC
	ldr r3, _08129DC8 @ =gAIScriptPtr
	ldr r2, [r3]
	ldrb r1, [r2]
	ldrb r0, [r2, 0x1]
	lsls r0, 8
	orrs r1, r0
	ldrb r0, [r2, 0x2]
	lsls r0, 16
	orrs r1, r0
	ldrb r0, [r2, 0x3]
	lsls r0, 24
	orrs r1, r0
	str r1, [r3]
	b _08129DD4
	.align 2, 0
_08129DC4: .4byte gSharedMem + 0x192E4
_08129DC8: .4byte gAIScriptPtr
_08129DCC:
	ldr r1, _08129DD8 @ =gAIScriptPtr
	ldr r0, [r1]
	adds r0, 0x4
	str r0, [r1]
_08129DD4:
	pop {r0}
	bx r0
	.align 2, 0
_08129DD8: .4byte gAIScriptPtr
	thumb_func_end ContestAICmd_unk_47

	thumb_func_start ContestAICmd_unk_48
ContestAICmd_unk_48: @ 8129DDC
	push {lr}
	bl ContestAICmd_check_would_finish_combo
	ldr r0, _08129E08 @ =gSharedMem + 0x192E4
	movs r1, 0x18
	ldrsh r0, [r0, r1]
	cmp r0, 0
	bne _08129E10
	ldr r3, _08129E0C @ =gAIScriptPtr
	ldr r2, [r3]
	ldrb r1, [r2]
	ldrb r0, [r2, 0x1]
	lsls r0, 8
	orrs r1, r0
	ldrb r0, [r2, 0x2]
	lsls r0, 16
	orrs r1, r0
	ldrb r0, [r2, 0x3]
	lsls r0, 24
	orrs r1, r0
	str r1, [r3]
	b _08129E18
	.align 2, 0
_08129E08: .4byte gSharedMem + 0x192E4
_08129E0C: .4byte gAIScriptPtr
_08129E10:
	ldr r1, _08129E1C @ =gAIScriptPtr
	ldr r0, [r1]
	adds r0, 0x4
	str r0, [r1]
_08129E18:
	pop {r0}
	bx r0
	.align 2, 0
_08129E1C: .4byte gAIScriptPtr
	thumb_func_end ContestAICmd_unk_48

	thumb_func_start ContestAICmd_get_condition
ContestAICmd_get_condition: @ 8129E20
	push {r4,r5,lr}
	ldr r4, _08129E5C @ =gAIScriptPtr
	ldr r0, [r4]
	ldrb r0, [r0, 0x1]
	bl sub_8128A7C
	lsls r0, 24
	lsrs r0, 24
	ldr r5, _08129E60 @ =gSharedMem + 0x192E4
	lsls r1, r0, 3
	subs r1, r0
	lsls r1, 2
	adds r0, r5, 0
	subs r0, 0x84
	adds r1, r0
	movs r0, 0xD
	ldrsb r0, [r1, r0]
	movs r1, 0xA
	bl __divsi3
	lsls r0, 24
	asrs r0, 24
	strh r0, [r5, 0x18]
	ldr r0, [r4]
	adds r0, 0x2
	str r0, [r4]
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_08129E5C: .4byte gAIScriptPtr
_08129E60: .4byte gSharedMem + 0x192E4
	thumb_func_end ContestAICmd_get_condition

	thumb_func_start ContestAICmd_unk_4A
ContestAICmd_unk_4A: @ 8129E64
	push {lr}
	bl ContestAICmd_get_condition
	ldr r0, _08129E94 @ =gSharedMem + 0x192E4
	movs r1, 0x18
	ldrsh r0, [r0, r1]
	ldr r3, _08129E98 @ =gAIScriptPtr
	ldr r2, [r3]
	ldrb r1, [r2]
	cmp r0, r1
	bge _08129E9C
	ldrb r1, [r2, 0x1]
	ldrb r0, [r2, 0x2]
	lsls r0, 8
	orrs r1, r0
	ldrb r0, [r2, 0x3]
	lsls r0, 16
	orrs r1, r0
	ldrb r0, [r2, 0x4]
	lsls r0, 24
	orrs r1, r0
	str r1, [r3]
	b _08129EA0
	.align 2, 0
_08129E94: .4byte gSharedMem + 0x192E4
_08129E98: .4byte gAIScriptPtr
_08129E9C:
	adds r0, r2, 0x5
	str r0, [r3]
_08129EA0:
	pop {r0}
	bx r0
	thumb_func_end ContestAICmd_unk_4A

	thumb_func_start ContestAICmd_unk_4B
ContestAICmd_unk_4B: @ 8129EA4
	push {lr}
	bl ContestAICmd_get_condition
	ldr r0, _08129ED4 @ =gSharedMem + 0x192E4
	movs r1, 0x18
	ldrsh r0, [r0, r1]
	ldr r3, _08129ED8 @ =gAIScriptPtr
	ldr r2, [r3]
	ldrb r1, [r2]
	cmp r0, r1
	ble _08129EDC
	ldrb r1, [r2, 0x1]
	ldrb r0, [r2, 0x2]
	lsls r0, 8
	orrs r1, r0
	ldrb r0, [r2, 0x3]
	lsls r0, 16
	orrs r1, r0
	ldrb r0, [r2, 0x4]
	lsls r0, 24
	orrs r1, r0
	str r1, [r3]
	b _08129EE0
	.align 2, 0
_08129ED4: .4byte gSharedMem + 0x192E4
_08129ED8: .4byte gAIScriptPtr
_08129EDC:
	adds r0, r2, 0x5
	str r0, [r3]
_08129EE0:
	pop {r0}
	bx r0
	thumb_func_end ContestAICmd_unk_4B

	thumb_func_start ContestAICmd_unk_4C
ContestAICmd_unk_4C: @ 8129EE4
	push {lr}
	bl ContestAICmd_get_condition
	ldr r0, _08129F14 @ =gSharedMem + 0x192E4
	movs r1, 0x18
	ldrsh r0, [r0, r1]
	ldr r3, _08129F18 @ =gAIScriptPtr
	ldr r2, [r3]
	ldrb r1, [r2]
	cmp r0, r1
	bne _08129F1C
	ldrb r1, [r2, 0x1]
	ldrb r0, [r2, 0x2]
	lsls r0, 8
	orrs r1, r0
	ldrb r0, [r2, 0x3]
	lsls r0, 16
	orrs r1, r0
	ldrb r0, [r2, 0x4]
	lsls r0, 24
	orrs r1, r0
	str r1, [r3]
	b _08129F20
	.align 2, 0
_08129F14: .4byte gSharedMem + 0x192E4
_08129F18: .4byte gAIScriptPtr
_08129F1C:
	adds r0, r2, 0x5
	str r0, [r3]
_08129F20:
	pop {r0}
	bx r0
	thumb_func_end ContestAICmd_unk_4C

	thumb_func_start ContestAICmd_unk_4D
ContestAICmd_unk_4D: @ 8129F24
	push {lr}
	bl ContestAICmd_get_condition
	ldr r0, _08129F54 @ =gSharedMem + 0x192E4
	movs r1, 0x18
	ldrsh r0, [r0, r1]
	ldr r3, _08129F58 @ =gAIScriptPtr
	ldr r2, [r3]
	ldrb r1, [r2]
	cmp r0, r1
	beq _08129F5C
	ldrb r1, [r2, 0x1]
	ldrb r0, [r2, 0x2]
	lsls r0, 8
	orrs r1, r0
	ldrb r0, [r2, 0x3]
	lsls r0, 16
	orrs r1, r0
	ldrb r0, [r2, 0x4]
	lsls r0, 24
	orrs r1, r0
	str r1, [r3]
	b _08129F60
	.align 2, 0
_08129F54: .4byte gSharedMem + 0x192E4
_08129F58: .4byte gAIScriptPtr
_08129F5C:
	adds r0, r2, 0x5
	str r0, [r3]
_08129F60:
	pop {r0}
	bx r0
	thumb_func_end ContestAICmd_unk_4D

	thumb_func_start ContestAICmd_get_used_combo_starter
ContestAICmd_get_used_combo_starter: @ 8129F64
	push {r4-r6,lr}
	movs r6, 0
	ldr r5, _08129FAC @ =gAIScriptPtr
	ldr r0, [r5]
	ldrb r0, [r0, 0x1]
	bl sub_8128A7C
	lsls r0, 24
	lsrs r4, r0, 24
	adds r0, r4, 0
	bl sub_80B214C
	lsls r0, 24
	cmp r0, 0
	beq _08129F9C
	ldr r2, _08129FB0 @ =gContestMoves
	lsls r0, r4, 3
	subs r0, r4
	lsls r0, 2
	ldr r1, _08129FB4 @ =gSharedMem + 0x19260
	adds r0, r1
	ldrh r0, [r0, 0x8]
	lsls r0, 3
	adds r0, r2
	ldrb r1, [r0, 0x2]
	negs r0, r1
	orrs r0, r1
	lsrs r6, r0, 31
_08129F9C:
	ldr r0, _08129FB8 @ =gSharedMem + 0x192E4
	strh r6, [r0, 0x18]
	ldr r0, [r5]
	adds r0, 0x2
	str r0, [r5]
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_08129FAC: .4byte gAIScriptPtr
_08129FB0: .4byte gContestMoves
_08129FB4: .4byte gSharedMem + 0x19260
_08129FB8: .4byte gSharedMem + 0x192E4
	thumb_func_end ContestAICmd_get_used_combo_starter

	thumb_func_start ContestAICmd_unk_4F
ContestAICmd_unk_4F: @ 8129FBC
	push {lr}
	bl ContestAICmd_get_used_combo_starter
	ldr r0, _08129FEC @ =gSharedMem + 0x192E4
	movs r1, 0x18
	ldrsh r0, [r0, r1]
	ldr r3, _08129FF0 @ =gAIScriptPtr
	ldr r2, [r3]
	ldrb r1, [r2]
	cmp r0, r1
	bge _08129FF4
	ldrb r1, [r2, 0x1]
	ldrb r0, [r2, 0x2]
	lsls r0, 8
	orrs r1, r0
	ldrb r0, [r2, 0x3]
	lsls r0, 16
	orrs r1, r0
	ldrb r0, [r2, 0x4]
	lsls r0, 24
	orrs r1, r0
	str r1, [r3]
	b _08129FF8
	.align 2, 0
_08129FEC: .4byte gSharedMem + 0x192E4
_08129FF0: .4byte gAIScriptPtr
_08129FF4:
	adds r0, r2, 0x5
	str r0, [r3]
_08129FF8:
	pop {r0}
	bx r0
	thumb_func_end ContestAICmd_unk_4F

	thumb_func_start ContestAICmd_unk_50
ContestAICmd_unk_50: @ 8129FFC
	push {lr}
	bl ContestAICmd_get_used_combo_starter
	ldr r0, _0812A02C @ =gSharedMem + 0x192E4
	movs r1, 0x18
	ldrsh r0, [r0, r1]
	ldr r3, _0812A030 @ =gAIScriptPtr
	ldr r2, [r3]
	ldrb r1, [r2]
	cmp r0, r1
	ble _0812A034
	ldrb r1, [r2, 0x1]
	ldrb r0, [r2, 0x2]
	lsls r0, 8
	orrs r1, r0
	ldrb r0, [r2, 0x3]
	lsls r0, 16
	orrs r1, r0
	ldrb r0, [r2, 0x4]
	lsls r0, 24
	orrs r1, r0
	str r1, [r3]
	b _0812A038
	.align 2, 0
_0812A02C: .4byte gSharedMem + 0x192E4
_0812A030: .4byte gAIScriptPtr
_0812A034:
	adds r0, r2, 0x5
	str r0, [r3]
_0812A038:
	pop {r0}
	bx r0
	thumb_func_end ContestAICmd_unk_50

	thumb_func_start ContestAICmd_unk_51
ContestAICmd_unk_51: @ 812A03C
	push {lr}
	bl ContestAICmd_get_used_combo_starter
	ldr r0, _0812A06C @ =gSharedMem + 0x192E4
	movs r1, 0x18
	ldrsh r0, [r0, r1]
	ldr r3, _0812A070 @ =gAIScriptPtr
	ldr r2, [r3]
	ldrb r1, [r2]
	cmp r0, r1
	bne _0812A074
	ldrb r1, [r2, 0x1]
	ldrb r0, [r2, 0x2]
	lsls r0, 8
	orrs r1, r0
	ldrb r0, [r2, 0x3]
	lsls r0, 16
	orrs r1, r0
	ldrb r0, [r2, 0x4]
	lsls r0, 24
	orrs r1, r0
	str r1, [r3]
	b _0812A078
	.align 2, 0
_0812A06C: .4byte gSharedMem + 0x192E4
_0812A070: .4byte gAIScriptPtr
_0812A074:
	adds r0, r2, 0x5
	str r0, [r3]
_0812A078:
	pop {r0}
	bx r0
	thumb_func_end ContestAICmd_unk_51

	thumb_func_start ContestAICmd_unk_52
ContestAICmd_unk_52: @ 812A07C
	push {lr}
	bl ContestAICmd_get_used_combo_starter
	ldr r0, _0812A0AC @ =gSharedMem + 0x192E4
	movs r1, 0x18
	ldrsh r0, [r0, r1]
	ldr r3, _0812A0B0 @ =gAIScriptPtr
	ldr r2, [r3]
	ldrb r1, [r2]
	cmp r0, r1
	beq _0812A0B4
	ldrb r1, [r2, 0x1]
	ldrb r0, [r2, 0x2]
	lsls r0, 8
	orrs r1, r0
	ldrb r0, [r2, 0x3]
	lsls r0, 16
	orrs r1, r0
	ldrb r0, [r2, 0x4]
	lsls r0, 24
	orrs r1, r0
	str r1, [r3]
	b _0812A0B8
	.align 2, 0
_0812A0AC: .4byte gSharedMem + 0x192E4
_0812A0B0: .4byte gAIScriptPtr
_0812A0B4:
	adds r0, r2, 0x5
	str r0, [r3]
_0812A0B8:
	pop {r0}
	bx r0
	thumb_func_end ContestAICmd_unk_52

	thumb_func_start ContestAICmd_check_can_participate
ContestAICmd_check_can_participate: @ 812A0BC
	push {lr}
	ldr r0, _0812A0DC @ =gAIScriptPtr
	ldr r0, [r0]
	ldrb r0, [r0, 0x1]
	bl sub_8128A7C
	lsls r0, 24
	lsrs r0, 24
	bl Contest_IsMonsTurnDisabled
	lsls r0, 24
	cmp r0, 0
	beq _0812A0E4
	ldr r1, _0812A0E0 @ =gSharedMem + 0x192E4
	movs r0, 0
	b _0812A0E8
	.align 2, 0
_0812A0DC: .4byte gAIScriptPtr
_0812A0E0: .4byte gSharedMem + 0x192E4
_0812A0E4:
	ldr r1, _0812A0F8 @ =gSharedMem + 0x192E4
	movs r0, 0x1
_0812A0E8:
	strh r0, [r1, 0x18]
	ldr r1, _0812A0FC @ =gAIScriptPtr
	ldr r0, [r1]
	adds r0, 0x2
	str r0, [r1]
	pop {r0}
	bx r0
	.align 2, 0
_0812A0F8: .4byte gSharedMem + 0x192E4
_0812A0FC: .4byte gAIScriptPtr
	thumb_func_end ContestAICmd_check_can_participate

	thumb_func_start ContestAICmd_unk_54
ContestAICmd_unk_54: @ 812A100
	push {lr}
	bl ContestAICmd_check_can_participate
	ldr r0, _0812A12C @ =gSharedMem + 0x192E4
	movs r1, 0x18
	ldrsh r0, [r0, r1]
	cmp r0, 0
	beq _0812A134
	ldr r3, _0812A130 @ =gAIScriptPtr
	ldr r2, [r3]
	ldrb r1, [r2]
	ldrb r0, [r2, 0x1]
	lsls r0, 8
	orrs r1, r0
	ldrb r0, [r2, 0x2]
	lsls r0, 16
	orrs r1, r0
	ldrb r0, [r2, 0x3]
	lsls r0, 24
	orrs r1, r0
	str r1, [r3]
	b _0812A13C
	.align 2, 0
_0812A12C: .4byte gSharedMem + 0x192E4
_0812A130: .4byte gAIScriptPtr
_0812A134:
	ldr r1, _0812A140 @ =gAIScriptPtr
	ldr r0, [r1]
	adds r0, 0x4
	str r0, [r1]
_0812A13C:
	pop {r0}
	bx r0
	.align 2, 0
_0812A140: .4byte gAIScriptPtr
	thumb_func_end ContestAICmd_unk_54

	thumb_func_start ContestAICmd_unk_55
ContestAICmd_unk_55: @ 812A144
	push {lr}
	bl ContestAICmd_check_can_participate
	ldr r0, _0812A170 @ =gSharedMem + 0x192E4
	movs r1, 0x18
	ldrsh r0, [r0, r1]
	cmp r0, 0
	bne _0812A178
	ldr r3, _0812A174 @ =gAIScriptPtr
	ldr r2, [r3]
	ldrb r1, [r2]
	ldrb r0, [r2, 0x1]
	lsls r0, 8
	orrs r1, r0
	ldrb r0, [r2, 0x2]
	lsls r0, 16
	orrs r1, r0
	ldrb r0, [r2, 0x3]
	lsls r0, 24
	orrs r1, r0
	str r1, [r3]
	b _0812A180
	.align 2, 0
_0812A170: .4byte gSharedMem + 0x192E4
_0812A174: .4byte gAIScriptPtr
_0812A178:
	ldr r1, _0812A184 @ =gAIScriptPtr
	ldr r0, [r1]
	adds r0, 0x4
	str r0, [r1]
_0812A180:
	pop {r0}
	bx r0
	.align 2, 0
_0812A184: .4byte gAIScriptPtr
	thumb_func_end ContestAICmd_unk_55

	thumb_func_start ContestAICmd_get_val_812A188
ContestAICmd_get_val_812A188: @ 812A188
	push {r4,lr}
	ldr r4, _0812A1BC @ =gAIScriptPtr
	ldr r0, [r4]
	ldrb r0, [r0, 0x1]
	bl sub_8128A7C
	lsls r0, 24
	lsrs r0, 24
	ldr r2, _0812A1C0 @ =gSharedMem + 0x192E4
	lsls r1, r0, 3
	subs r1, r0
	lsls r1, 2
	adds r0, r2, 0
	subs r0, 0x84
	adds r1, r0
	ldrb r0, [r1, 0x15]
	lsls r0, 28
	lsrs r0, 31
	strh r0, [r2, 0x18]
	ldr r0, [r4]
	adds r0, 0x2
	str r0, [r4]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0812A1BC: .4byte gAIScriptPtr
_0812A1C0: .4byte gSharedMem + 0x192E4
	thumb_func_end ContestAICmd_get_val_812A188

	thumb_func_start ContestAICmd_unk_57
ContestAICmd_unk_57: @ 812A1C4
	push {lr}
	bl ContestAICmd_get_val_812A188
	ldr r0, _0812A1F0 @ =gSharedMem + 0x192E4
	movs r1, 0x18
	ldrsh r0, [r0, r1]
	cmp r0, 0
	beq _0812A1F8
	ldr r3, _0812A1F4 @ =gAIScriptPtr
	ldr r2, [r3]
	ldrb r1, [r2]
	ldrb r0, [r2, 0x1]
	lsls r0, 8
	orrs r1, r0
	ldrb r0, [r2, 0x2]
	lsls r0, 16
	orrs r1, r0
	ldrb r0, [r2, 0x3]
	lsls r0, 24
	orrs r1, r0
	str r1, [r3]
	b _0812A200
	.align 2, 0
_0812A1F0: .4byte gSharedMem + 0x192E4
_0812A1F4: .4byte gAIScriptPtr
_0812A1F8:
	ldr r1, _0812A204 @ =gAIScriptPtr
	ldr r0, [r1]
	adds r0, 0x4
	str r0, [r1]
_0812A200:
	pop {r0}
	bx r0
	.align 2, 0
_0812A204: .4byte gAIScriptPtr
	thumb_func_end ContestAICmd_unk_57

	thumb_func_start ContestAICmd_unk_58
ContestAICmd_unk_58: @ 812A208
	push {lr}
	bl ContestAICmd_get_val_812A188
	ldr r0, _0812A234 @ =gSharedMem + 0x192E4
	movs r1, 0x18
	ldrsh r0, [r0, r1]
	cmp r0, 0
	bne _0812A23C
	ldr r3, _0812A238 @ =gAIScriptPtr
	ldr r2, [r3]
	ldrb r1, [r2]
	ldrb r0, [r2, 0x1]
	lsls r0, 8
	orrs r1, r0
	ldrb r0, [r2, 0x2]
	lsls r0, 16
	orrs r1, r0
	ldrb r0, [r2, 0x3]
	lsls r0, 24
	orrs r1, r0
	str r1, [r3]
	b _0812A244
	.align 2, 0
_0812A234: .4byte gSharedMem + 0x192E4
_0812A238: .4byte gAIScriptPtr
_0812A23C:
	ldr r1, _0812A248 @ =gAIScriptPtr
	ldr r0, [r1]
	adds r0, 0x4
	str r0, [r1]
_0812A244:
	pop {r0}
	bx r0
	.align 2, 0
_0812A248: .4byte gAIScriptPtr
	thumb_func_end ContestAICmd_unk_58

	thumb_func_start ContestAICmd_unk_59
ContestAICmd_unk_59: @ 812A24C
	push {r4,r5,lr}
	ldr r5, _0812A28C @ =gAIScriptPtr
	ldr r0, [r5]
	ldrb r0, [r0, 0x1]
	bl sub_8128A7C
	lsls r0, 24
	lsrs r0, 24
	ldr r3, _0812A290 @ =gSharedMem + 0x192E4
	lsls r1, r0, 3
	subs r1, r0
	lsls r1, 2
	adds r4, r3, 0
	subs r4, 0x84
	adds r1, r4
	adds r0, r3, 0
	adds r0, 0x41
	ldrb r2, [r0]
	lsls r0, r2, 3
	subs r0, r2
	lsls r0, 2
	adds r0, r4
	ldrh r1, [r1, 0x4]
	ldrh r0, [r0, 0x4]
	subs r1, r0
	strh r1, [r3, 0x18]
	ldr r0, [r5]
	adds r0, 0x2
	str r0, [r5]
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_0812A28C: .4byte gAIScriptPtr
_0812A290: .4byte gSharedMem + 0x192E4
	thumb_func_end ContestAICmd_unk_59

	thumb_func_start ContestAICmd_unk_5A
ContestAICmd_unk_5A: @ 812A294
	push {lr}
	bl ContestAICmd_unk_59
	ldr r0, _0812A2C0 @ =gSharedMem + 0x192E4
	movs r1, 0x18
	ldrsh r0, [r0, r1]
	cmp r0, 0
	bge _0812A2C8
	ldr r3, _0812A2C4 @ =gAIScriptPtr
	ldr r2, [r3]
	ldrb r1, [r2]
	ldrb r0, [r2, 0x1]
	lsls r0, 8
	orrs r1, r0
	ldrb r0, [r2, 0x2]
	lsls r0, 16
	orrs r1, r0
	ldrb r0, [r2, 0x3]
	lsls r0, 24
	orrs r1, r0
	str r1, [r3]
	b _0812A2D0
	.align 2, 0
_0812A2C0: .4byte gSharedMem + 0x192E4
_0812A2C4: .4byte gAIScriptPtr
_0812A2C8:
	ldr r1, _0812A2D4 @ =gAIScriptPtr
	ldr r0, [r1]
	adds r0, 0x4
	str r0, [r1]
_0812A2D0:
	pop {r0}
	bx r0
	.align 2, 0
_0812A2D4: .4byte gAIScriptPtr
	thumb_func_end ContestAICmd_unk_5A

	thumb_func_start ContestAICmd_unk_5B
ContestAICmd_unk_5B: @ 812A2D8
	push {lr}
	bl ContestAICmd_unk_59
	ldr r0, _0812A304 @ =gSharedMem + 0x192E4
	movs r1, 0x18
	ldrsh r0, [r0, r1]
	cmp r0, 0
	ble _0812A30C
	ldr r3, _0812A308 @ =gAIScriptPtr
	ldr r2, [r3]
	ldrb r1, [r2]
	ldrb r0, [r2, 0x1]
	lsls r0, 8
	orrs r1, r0
	ldrb r0, [r2, 0x2]
	lsls r0, 16
	orrs r1, r0
	ldrb r0, [r2, 0x3]
	lsls r0, 24
	orrs r1, r0
	str r1, [r3]
	b _0812A314
	.align 2, 0
_0812A304: .4byte gSharedMem + 0x192E4
_0812A308: .4byte gAIScriptPtr
_0812A30C:
	ldr r1, _0812A318 @ =gAIScriptPtr
	ldr r0, [r1]
	adds r0, 0x4
	str r0, [r1]
_0812A314:
	pop {r0}
	bx r0
	.align 2, 0
_0812A318: .4byte gAIScriptPtr
	thumb_func_end ContestAICmd_unk_5B

	thumb_func_start ContestAICmd_unk_5C
ContestAICmd_unk_5C: @ 812A31C
	push {lr}
	bl ContestAICmd_unk_59
	ldr r0, _0812A348 @ =gSharedMem + 0x192E4
	movs r1, 0x18
	ldrsh r0, [r0, r1]
	cmp r0, 0
	bne _0812A350
	ldr r3, _0812A34C @ =gAIScriptPtr
	ldr r2, [r3]
	ldrb r1, [r2]
	ldrb r0, [r2, 0x1]
	lsls r0, 8
	orrs r1, r0
	ldrb r0, [r2, 0x2]
	lsls r0, 16
	orrs r1, r0
	ldrb r0, [r2, 0x3]
	lsls r0, 24
	orrs r1, r0
	str r1, [r3]
	b _0812A358
	.align 2, 0
_0812A348: .4byte gSharedMem + 0x192E4
_0812A34C: .4byte gAIScriptPtr
_0812A350:
	ldr r1, _0812A35C @ =gAIScriptPtr
	ldr r0, [r1]
	adds r0, 0x4
	str r0, [r1]
_0812A358:
	pop {r0}
	bx r0
	.align 2, 0
_0812A35C: .4byte gAIScriptPtr
	thumb_func_end ContestAICmd_unk_5C

	thumb_func_start ContestAICmd_unk_5D
ContestAICmd_unk_5D: @ 812A360
	push {lr}
	bl ContestAICmd_unk_59
	ldr r0, _0812A38C @ =gSharedMem + 0x192E4
	movs r1, 0x18
	ldrsh r0, [r0, r1]
	cmp r0, 0
	beq _0812A394
	ldr r3, _0812A390 @ =gAIScriptPtr
	ldr r2, [r3]
	ldrb r1, [r2]
	ldrb r0, [r2, 0x1]
	lsls r0, 8
	orrs r1, r0
	ldrb r0, [r2, 0x2]
	lsls r0, 16
	orrs r1, r0
	ldrb r0, [r2, 0x3]
	lsls r0, 24
	orrs r1, r0
	str r1, [r3]
	b _0812A39C
	.align 2, 0
_0812A38C: .4byte gSharedMem + 0x192E4
_0812A390: .4byte gAIScriptPtr
_0812A394:
	ldr r1, _0812A3A0 @ =gAIScriptPtr
	ldr r0, [r1]
	adds r0, 0x4
	str r0, [r1]
_0812A39C:
	pop {r0}
	bx r0
	.align 2, 0
_0812A3A0: .4byte gAIScriptPtr
	thumb_func_end ContestAICmd_unk_5D

	thumb_func_start ContestAICmd_unk_5E
ContestAICmd_unk_5E: @ 812A3A4
	push {r4,lr}
	ldr r4, _0812A3D8 @ =gAIScriptPtr
	ldr r0, [r4]
	ldrb r0, [r0, 0x1]
	bl sub_8128A7C
	lsls r0, 24
	ldr r3, _0812A3DC @ =gSharedMem + 0x192E4
	ldr r2, _0812A3E0 @ =gUnknown_02038670
	lsrs r0, 23
	adds r0, r2
	adds r1, r3, 0
	adds r1, 0x41
	ldrb r1, [r1]
	lsls r1, 1
	adds r1, r2
	ldrh r0, [r0]
	ldrh r1, [r1]
	subs r0, r1
	strh r0, [r3, 0x18]
	ldr r0, [r4]
	adds r0, 0x2
	str r0, [r4]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0812A3D8: .4byte gAIScriptPtr
_0812A3DC: .4byte gSharedMem + 0x192E4
_0812A3E0: .4byte gUnknown_02038670
	thumb_func_end ContestAICmd_unk_5E

	thumb_func_start ContestAICmd_unk_5F
ContestAICmd_unk_5F: @ 812A3E4
	push {lr}
	bl ContestAICmd_unk_5E
	ldr r0, _0812A410 @ =gSharedMem + 0x192E4
	movs r1, 0x18
	ldrsh r0, [r0, r1]
	cmp r0, 0
	bge _0812A418
	ldr r3, _0812A414 @ =gAIScriptPtr
	ldr r2, [r3]
	ldrb r1, [r2]
	ldrb r0, [r2, 0x1]
	lsls r0, 8
	orrs r1, r0
	ldrb r0, [r2, 0x2]
	lsls r0, 16
	orrs r1, r0
	ldrb r0, [r2, 0x3]
	lsls r0, 24
	orrs r1, r0
	str r1, [r3]
	b _0812A420
	.align 2, 0
_0812A410: .4byte gSharedMem + 0x192E4
_0812A414: .4byte gAIScriptPtr
_0812A418:
	ldr r1, _0812A424 @ =gAIScriptPtr
	ldr r0, [r1]
	adds r0, 0x4
	str r0, [r1]
_0812A420:
	pop {r0}
	bx r0
	.align 2, 0
_0812A424: .4byte gAIScriptPtr
	thumb_func_end ContestAICmd_unk_5F

	thumb_func_start ContestAICmd_unk_60
ContestAICmd_unk_60: @ 812A428
	push {lr}
	bl ContestAICmd_unk_5E
	ldr r0, _0812A454 @ =gSharedMem + 0x192E4
	movs r1, 0x18
	ldrsh r0, [r0, r1]
	cmp r0, 0
	ble _0812A45C
	ldr r3, _0812A458 @ =gAIScriptPtr
	ldr r2, [r3]
	ldrb r1, [r2]
	ldrb r0, [r2, 0x1]
	lsls r0, 8
	orrs r1, r0
	ldrb r0, [r2, 0x2]
	lsls r0, 16
	orrs r1, r0
	ldrb r0, [r2, 0x3]
	lsls r0, 24
	orrs r1, r0
	str r1, [r3]
	b _0812A464
	.align 2, 0
_0812A454: .4byte gSharedMem + 0x192E4
_0812A458: .4byte gAIScriptPtr
_0812A45C:
	ldr r1, _0812A468 @ =gAIScriptPtr
	ldr r0, [r1]
	adds r0, 0x4
	str r0, [r1]
_0812A464:
	pop {r0}
	bx r0
	.align 2, 0
_0812A468: .4byte gAIScriptPtr
	thumb_func_end ContestAICmd_unk_60

	thumb_func_start ContestAICmd_unk_61
ContestAICmd_unk_61: @ 812A46C
	push {lr}
	bl ContestAICmd_unk_5E
	ldr r0, _0812A498 @ =gSharedMem + 0x192E4
	movs r1, 0x18
	ldrsh r0, [r0, r1]
	cmp r0, 0
	bne _0812A4A0
	ldr r3, _0812A49C @ =gAIScriptPtr
	ldr r2, [r3]
	ldrb r1, [r2]
	ldrb r0, [r2, 0x1]
	lsls r0, 8
	orrs r1, r0
	ldrb r0, [r2, 0x2]
	lsls r0, 16
	orrs r1, r0
	ldrb r0, [r2, 0x3]
	lsls r0, 24
	orrs r1, r0
	str r1, [r3]
	b _0812A4A8
	.align 2, 0
_0812A498: .4byte gSharedMem + 0x192E4
_0812A49C: .4byte gAIScriptPtr
_0812A4A0:
	ldr r1, _0812A4AC @ =gAIScriptPtr
	ldr r0, [r1]
	adds r0, 0x4
	str r0, [r1]
_0812A4A8:
	pop {r0}
	bx r0
	.align 2, 0
_0812A4AC: .4byte gAIScriptPtr
	thumb_func_end ContestAICmd_unk_61

	thumb_func_start ContestAICmd_unk_62
ContestAICmd_unk_62: @ 812A4B0
	push {lr}
	bl ContestAICmd_unk_5E
	ldr r0, _0812A4DC @ =gSharedMem + 0x192E4
	movs r1, 0x18
	ldrsh r0, [r0, r1]
	cmp r0, 0
	beq _0812A4E4
	ldr r3, _0812A4E0 @ =gAIScriptPtr
	ldr r2, [r3]
	ldrb r1, [r2]
	ldrb r0, [r2, 0x1]
	lsls r0, 8
	orrs r1, r0
	ldrb r0, [r2, 0x2]
	lsls r0, 16
	orrs r1, r0
	ldrb r0, [r2, 0x3]
	lsls r0, 24
	orrs r1, r0
	str r1, [r3]
	b _0812A4EC
	.align 2, 0
_0812A4DC: .4byte gSharedMem + 0x192E4
_0812A4E0: .4byte gAIScriptPtr
_0812A4E4:
	ldr r1, _0812A4F0 @ =gAIScriptPtr
	ldr r0, [r1]
	adds r0, 0x4
	str r0, [r1]
_0812A4EC:
	pop {r0}
	bx r0
	.align 2, 0
_0812A4F0: .4byte gAIScriptPtr
	thumb_func_end ContestAICmd_unk_62

	thumb_func_start ContestAICmd_unk_63
ContestAICmd_unk_63: @ 812A4F4
	push {r4,lr}
	ldr r4, _0812A52C @ =gAIScriptPtr
	ldr r0, [r4]
	ldrb r0, [r0, 0x1]
	bl sub_8128A7C
	lsls r0, 24
	ldr r3, [r4]
	ldrb r1, [r3, 0x2]
	ldr r2, _0812A530 @ =gSharedMem + 0x19204
	lsrs r0, 23
	lsls r1, 3
	adds r0, r1
	adds r1, r2, 0
	adds r1, 0x1C
	adds r0, r1
	ldrh r0, [r0]
	adds r2, 0xE0
	ldr r1, _0812A534 @ =gContestMoves
	lsls r0, 3
	adds r0, r1
	ldrb r0, [r0]
	strh r0, [r2, 0x18]
	adds r3, 0x3
	str r3, [r4]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0812A52C: .4byte gAIScriptPtr
_0812A530: .4byte gSharedMem + 0x19204
_0812A534: .4byte gContestMoves
	thumb_func_end ContestAICmd_unk_63

	thumb_func_start ContestAICmd_unk_64
ContestAICmd_unk_64: @ 812A538
	push {lr}
	bl ContestAICmd_unk_63
	ldr r0, _0812A568 @ =gSharedMem + 0x192E4
	movs r1, 0x18
	ldrsh r0, [r0, r1]
	ldr r3, _0812A56C @ =gAIScriptPtr
	ldr r2, [r3]
	ldrb r1, [r2]
	cmp r0, r1
	bge _0812A570
	ldrb r1, [r2, 0x1]
	ldrb r0, [r2, 0x2]
	lsls r0, 8
	orrs r1, r0
	ldrb r0, [r2, 0x3]
	lsls r0, 16
	orrs r1, r0
	ldrb r0, [r2, 0x4]
	lsls r0, 24
	orrs r1, r0
	str r1, [r3]
	b _0812A574
	.align 2, 0
_0812A568: .4byte gSharedMem + 0x192E4
_0812A56C: .4byte gAIScriptPtr
_0812A570:
	adds r0, r2, 0x5
	str r0, [r3]
_0812A574:
	pop {r0}
	bx r0
	thumb_func_end ContestAICmd_unk_64

	thumb_func_start ContestAICmd_unk_65
ContestAICmd_unk_65: @ 812A578
	push {lr}
	bl ContestAICmd_unk_63
	ldr r0, _0812A5A8 @ =gSharedMem + 0x192E4
	movs r1, 0x18
	ldrsh r0, [r0, r1]
	ldr r3, _0812A5AC @ =gAIScriptPtr
	ldr r2, [r3]
	ldrb r1, [r2]
	cmp r0, r1
	ble _0812A5B0
	ldrb r1, [r2, 0x1]
	ldrb r0, [r2, 0x2]
	lsls r0, 8
	orrs r1, r0
	ldrb r0, [r2, 0x3]
	lsls r0, 16
	orrs r1, r0
	ldrb r0, [r2, 0x4]
	lsls r0, 24
	orrs r1, r0
	str r1, [r3]
	b _0812A5B4
	.align 2, 0
_0812A5A8: .4byte gSharedMem + 0x192E4
_0812A5AC: .4byte gAIScriptPtr
_0812A5B0:
	adds r0, r2, 0x5
	str r0, [r3]
_0812A5B4:
	pop {r0}
	bx r0
	thumb_func_end ContestAICmd_unk_65

	thumb_func_start ContestAICmd_unk_66
ContestAICmd_unk_66: @ 812A5B8
	push {lr}
	bl ContestAICmd_unk_63
	ldr r0, _0812A5E8 @ =gSharedMem + 0x192E4
	movs r1, 0x18
	ldrsh r0, [r0, r1]
	ldr r3, _0812A5EC @ =gAIScriptPtr
	ldr r2, [r3]
	ldrb r1, [r2]
	cmp r0, r1
	bne _0812A5F0
	ldrb r1, [r2, 0x1]
	ldrb r0, [r2, 0x2]
	lsls r0, 8
	orrs r1, r0
	ldrb r0, [r2, 0x3]
	lsls r0, 16
	orrs r1, r0
	ldrb r0, [r2, 0x4]
	lsls r0, 24
	orrs r1, r0
	str r1, [r3]
	b _0812A5F4
	.align 2, 0
_0812A5E8: .4byte gSharedMem + 0x192E4
_0812A5EC: .4byte gAIScriptPtr
_0812A5F0:
	adds r0, r2, 0x5
	str r0, [r3]
_0812A5F4:
	pop {r0}
	bx r0
	thumb_func_end ContestAICmd_unk_66

	thumb_func_start ContestAICmd_unk_67
ContestAICmd_unk_67: @ 812A5F8
	push {lr}
	bl ContestAICmd_unk_63
	ldr r0, _0812A628 @ =gSharedMem + 0x192E4
	movs r1, 0x18
	ldrsh r0, [r0, r1]
	ldr r3, _0812A62C @ =gAIScriptPtr
	ldr r2, [r3]
	ldrb r1, [r2]
	cmp r0, r1
	beq _0812A630
	ldrb r1, [r2, 0x1]
	ldrb r0, [r2, 0x2]
	lsls r0, 8
	orrs r1, r0
	ldrb r0, [r2, 0x3]
	lsls r0, 16
	orrs r1, r0
	ldrb r0, [r2, 0x4]
	lsls r0, 24
	orrs r1, r0
	str r1, [r3]
	b _0812A634
	.align 2, 0
_0812A628: .4byte gSharedMem + 0x192E4
_0812A62C: .4byte gAIScriptPtr
_0812A630:
	adds r0, r2, 0x5
	str r0, [r3]
_0812A634:
	pop {r0}
	bx r0
	thumb_func_end ContestAICmd_unk_67

	thumb_func_start ContestAICmd_unk_68
ContestAICmd_unk_68: @ 812A638
	push {r4,lr}
	ldr r4, _0812A66C @ =gAIScriptPtr
	ldr r0, [r4]
	ldrb r0, [r0, 0x1]
	bl sub_8128A7C
	lsls r0, 24
	lsrs r0, 24
	ldr r3, [r4]
	ldrb r1, [r3, 0x2]
	ldr r2, _0812A670 @ =gSharedMem + 0x19204
	lsls r1, 2
	adds r0, r1
	adds r1, r2, 0
	adds r1, 0x44
	adds r0, r1
	adds r2, 0xE0
	ldrb r0, [r0]
	lsls r0, 24
	asrs r0, 24
	strh r0, [r2, 0x18]
	adds r3, 0x3
	str r3, [r4]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0812A66C: .4byte gAIScriptPtr
_0812A670: .4byte gSharedMem + 0x19204
	thumb_func_end ContestAICmd_unk_68

	thumb_func_start ContestAICmd_unk_69
ContestAICmd_unk_69: @ 812A674
	push {lr}
	bl ContestAICmd_unk_68
	ldr r0, _0812A6A4 @ =gSharedMem + 0x192E4
	movs r1, 0x18
	ldrsh r0, [r0, r1]
	ldr r3, _0812A6A8 @ =gAIScriptPtr
	ldr r2, [r3]
	ldrb r1, [r2]
	cmp r0, r1
	bge _0812A6AC
	ldrb r1, [r2, 0x1]
	ldrb r0, [r2, 0x2]
	lsls r0, 8
	orrs r1, r0
	ldrb r0, [r2, 0x3]
	lsls r0, 16
	orrs r1, r0
	ldrb r0, [r2, 0x4]
	lsls r0, 24
	orrs r1, r0
	str r1, [r3]
	b _0812A6B0
	.align 2, 0
_0812A6A4: .4byte gSharedMem + 0x192E4
_0812A6A8: .4byte gAIScriptPtr
_0812A6AC:
	adds r0, r2, 0x5
	str r0, [r3]
_0812A6B0:
	pop {r0}
	bx r0
	thumb_func_end ContestAICmd_unk_69

	thumb_func_start ContestAICmd_unk_6A
ContestAICmd_unk_6A: @ 812A6B4
	push {lr}
	bl ContestAICmd_unk_68
	ldr r0, _0812A6E4 @ =gSharedMem + 0x192E4
	movs r1, 0x18
	ldrsh r0, [r0, r1]
	ldr r3, _0812A6E8 @ =gAIScriptPtr
	ldr r2, [r3]
	ldrb r1, [r2]
	cmp r0, r1
	ble _0812A6EC
	ldrb r1, [r2, 0x1]
	ldrb r0, [r2, 0x2]
	lsls r0, 8
	orrs r1, r0
	ldrb r0, [r2, 0x3]
	lsls r0, 16
	orrs r1, r0
	ldrb r0, [r2, 0x4]
	lsls r0, 24
	orrs r1, r0
	str r1, [r3]
	b _0812A6F0
	.align 2, 0
_0812A6E4: .4byte gSharedMem + 0x192E4
_0812A6E8: .4byte gAIScriptPtr
_0812A6EC:
	adds r0, r2, 0x5
	str r0, [r3]
_0812A6F0:
	pop {r0}
	bx r0
	thumb_func_end ContestAICmd_unk_6A

	thumb_func_start ContestAICmd_unk_6B
ContestAICmd_unk_6B: @ 812A6F4
	push {lr}
	bl ContestAICmd_unk_68
	ldr r0, _0812A724 @ =gSharedMem + 0x192E4
	movs r1, 0x18
	ldrsh r0, [r0, r1]
	ldr r3, _0812A728 @ =gAIScriptPtr
	ldr r2, [r3]
	ldrb r1, [r2]
	cmp r0, r1
	bne _0812A72C
	ldrb r1, [r2, 0x1]
	ldrb r0, [r2, 0x2]
	lsls r0, 8
	orrs r1, r0
	ldrb r0, [r2, 0x3]
	lsls r0, 16
	orrs r1, r0
	ldrb r0, [r2, 0x4]
	lsls r0, 24
	orrs r1, r0
	str r1, [r3]
	b _0812A730
	.align 2, 0
_0812A724: .4byte gSharedMem + 0x192E4
_0812A728: .4byte gAIScriptPtr
_0812A72C:
	adds r0, r2, 0x5
	str r0, [r3]
_0812A730:
	pop {r0}
	bx r0
	thumb_func_end ContestAICmd_unk_6B

	thumb_func_start ContestAICmd_unk_6C
ContestAICmd_unk_6C: @ 812A734
	push {lr}
	bl ContestAICmd_unk_68
	ldr r0, _0812A764 @ =gSharedMem + 0x192E4
	movs r1, 0x18
	ldrsh r0, [r0, r1]
	ldr r3, _0812A768 @ =gAIScriptPtr
	ldr r2, [r3]
	ldrb r1, [r2]
	cmp r0, r1
	beq _0812A76C
	ldrb r1, [r2, 0x1]
	ldrb r0, [r2, 0x2]
	lsls r0, 8
	orrs r1, r0
	ldrb r0, [r2, 0x3]
	lsls r0, 16
	orrs r1, r0
	ldrb r0, [r2, 0x4]
	lsls r0, 24
	orrs r1, r0
	str r1, [r3]
	b _0812A770
	.align 2, 0
_0812A764: .4byte gSharedMem + 0x192E4
_0812A768: .4byte gAIScriptPtr
_0812A76C:
	adds r0, r2, 0x5
	str r0, [r3]
_0812A770:
	pop {r0}
	bx r0
	thumb_func_end ContestAICmd_unk_6C

	thumb_func_start ContestAICmd_unk_6D
ContestAICmd_unk_6D: @ 812A774
	push {r4,r5,lr}
	ldr r5, _0812A7B4 @ =gAIScriptPtr
	ldr r0, [r5]
	ldrb r0, [r0, 0x1]
	bl sub_8128A7C
	lsls r0, 24
	ldr r3, [r5]
	ldrb r1, [r3, 0x2]
	ldr r2, _0812A7B8 @ =gSharedMem + 0x19204
	lsrs r0, 23
	lsls r1, 3
	adds r0, r1
	adds r1, r2, 0
	adds r1, 0x1C
	adds r0, r1
	ldrh r0, [r0]
	adds r2, 0xE0
	ldr r4, _0812A7BC @ =gContestEffects
	ldr r1, _0812A7C0 @ =gContestMoves
	lsls r0, 3
	adds r0, r1
	ldrb r0, [r0]
	lsls r0, 2
	adds r0, r4
	ldrb r0, [r0]
	strh r0, [r2, 0x18]
	adds r3, 0x3
	str r3, [r5]
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_0812A7B4: .4byte gAIScriptPtr
_0812A7B8: .4byte gSharedMem + 0x19204
_0812A7BC: .4byte gContestEffects
_0812A7C0: .4byte gContestMoves
	thumb_func_end ContestAICmd_unk_6D

	thumb_func_start ContestAICmd_unk_6E
ContestAICmd_unk_6E: @ 812A7C4
	push {lr}
	bl ContestAICmd_unk_6D
	ldr r0, _0812A7F4 @ =gSharedMem + 0x192E4
	movs r1, 0x18
	ldrsh r0, [r0, r1]
	ldr r3, _0812A7F8 @ =gAIScriptPtr
	ldr r2, [r3]
	ldrb r1, [r2]
	cmp r0, r1
	bne _0812A7FC
	ldrb r1, [r2, 0x1]
	ldrb r0, [r2, 0x2]
	lsls r0, 8
	orrs r1, r0
	ldrb r0, [r2, 0x3]
	lsls r0, 16
	orrs r1, r0
	ldrb r0, [r2, 0x4]
	lsls r0, 24
	orrs r1, r0
	str r1, [r3]
	b _0812A800
	.align 2, 0
_0812A7F4: .4byte gSharedMem + 0x192E4
_0812A7F8: .4byte gAIScriptPtr
_0812A7FC:
	adds r0, r2, 0x5
	str r0, [r3]
_0812A800:
	pop {r0}
	bx r0
	thumb_func_end ContestAICmd_unk_6E

	thumb_func_start ContestAICmd_unk_6F
ContestAICmd_unk_6F: @ 812A804
	push {lr}
	bl ContestAICmd_unk_6D
	ldr r0, _0812A834 @ =gSharedMem + 0x192E4
	movs r1, 0x18
	ldrsh r0, [r0, r1]
	ldr r3, _0812A838 @ =gAIScriptPtr
	ldr r2, [r3]
	ldrb r1, [r2]
	cmp r0, r1
	beq _0812A83C
	ldrb r1, [r2, 0x1]
	ldrb r0, [r2, 0x2]
	lsls r0, 8
	orrs r1, r0
	ldrb r0, [r2, 0x3]
	lsls r0, 16
	orrs r1, r0
	ldrb r0, [r2, 0x4]
	lsls r0, 24
	orrs r1, r0
	str r1, [r3]
	b _0812A840
	.align 2, 0
_0812A834: .4byte gSharedMem + 0x192E4
_0812A838: .4byte gAIScriptPtr
_0812A83C:
	adds r0, r2, 0x5
	str r0, [r3]
_0812A840:
	pop {r0}
	bx r0
	thumb_func_end ContestAICmd_unk_6F

	thumb_func_start ContestAICmd_unk_70
ContestAICmd_unk_70: @ 812A844
	push {r4,lr}
	ldr r3, _0812A864 @ =gSharedMem + 0x192E4
	ldr r4, _0812A868 @ =gAIScriptPtr
	ldr r2, [r4]
	ldrb r0, [r2, 0x1]
	lsls r0, 1
	adds r1, r3, 0
	adds r1, 0x1A
	adds r0, r1
	ldrh r1, [r3, 0x18]
	strh r1, [r0]
	adds r2, 0x2
	str r2, [r4]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0812A864: .4byte gSharedMem + 0x192E4
_0812A868: .4byte gAIScriptPtr
	thumb_func_end ContestAICmd_unk_70

	thumb_func_start ContestAICmd_unk_71
ContestAICmd_unk_71: @ 812A86C
	push {r4,lr}
	ldr r0, _0812A890 @ =gSharedMem + 0x192E4
	ldr r4, _0812A894 @ =gAIScriptPtr
	ldr r3, [r4]
	ldrb r2, [r3, 0x1]
	lsls r2, 1
	adds r0, 0x1A
	adds r2, r0
	ldrb r1, [r3, 0x2]
	ldrb r0, [r3, 0x3]
	lsls r0, 8
	orrs r1, r0
	strh r1, [r2]
	adds r3, 0x4
	str r3, [r4]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0812A890: .4byte gSharedMem + 0x192E4
_0812A894: .4byte gAIScriptPtr
	thumb_func_end ContestAICmd_unk_71

	thumb_func_start ContestAICmd_unk_72
ContestAICmd_unk_72: @ 812A898
	push {r4,lr}
	ldr r0, _0812A8C4 @ =gSharedMem + 0x192E4
	ldr r4, _0812A8C8 @ =gAIScriptPtr
	ldr r3, [r4]
	ldrb r2, [r3, 0x1]
	lsls r2, 1
	adds r0, 0x1A
	adds r2, r0
	movs r1, 0x2
	ldrsb r1, [r3, r1]
	ldrb r0, [r3, 0x3]
	lsls r0, 8
	orrs r1, r0
	ldrh r0, [r2]
	adds r1, r0
	strh r1, [r2]
	adds r3, 0x4
	str r3, [r4]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0812A8C4: .4byte gSharedMem + 0x192E4
_0812A8C8: .4byte gAIScriptPtr
	thumb_func_end ContestAICmd_unk_72

	thumb_func_start ContestAICmd_unk_73
ContestAICmd_unk_73: @ 812A8CC
	push {r4,lr}
	ldr r2, _0812A8F4 @ =gSharedMem + 0x192E4
	ldr r4, _0812A8F8 @ =gAIScriptPtr
	ldr r3, [r4]
	ldrb r1, [r3, 0x1]
	lsls r1, 1
	adds r2, 0x1A
	adds r1, r2
	ldrb r0, [r3, 0x2]
	lsls r0, 1
	adds r0, r2
	ldrh r0, [r0]
	ldrh r2, [r1]
	adds r0, r2
	strh r0, [r1]
	adds r3, 0x3
	str r3, [r4]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0812A8F4: .4byte gSharedMem + 0x192E4
_0812A8F8: .4byte gAIScriptPtr
	thumb_func_end ContestAICmd_unk_73

	thumb_func_start ContestAICmd_unk_74
ContestAICmd_unk_74: @ 812A8FC
	push {r4,lr}
	ldr r2, _0812A924 @ =gSharedMem + 0x192E4
	ldr r4, _0812A928 @ =gAIScriptPtr
	ldr r3, [r4]
	ldrb r1, [r3, 0x1]
	lsls r1, 1
	adds r2, 0x1A
	adds r1, r2
	ldrb r0, [r3, 0x2]
	lsls r0, 1
	adds r0, r2
	ldrh r0, [r0]
	ldrh r2, [r1]
	adds r0, r2
	strh r0, [r1]
	adds r3, 0x3
	str r3, [r4]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0812A924: .4byte gSharedMem + 0x192E4
_0812A928: .4byte gAIScriptPtr
	thumb_func_end ContestAICmd_unk_74

	thumb_func_start ContestAICmd_unk_75
ContestAICmd_unk_75: @ 812A92C
	push {r4,lr}
	ldr r1, _0812A964 @ =gSharedMem + 0x192E4
	ldr r4, _0812A968 @ =gAIScriptPtr
	ldr r3, [r4]
	ldrb r0, [r3, 0x1]
	lsls r0, 1
	adds r1, 0x1A
	adds r0, r1
	movs r1, 0
	ldrsh r2, [r0, r1]
	ldrb r1, [r3, 0x2]
	ldrb r0, [r3, 0x3]
	lsls r0, 8
	orrs r1, r0
	cmp r2, r1
	bge _0812A96C
	ldrb r1, [r3, 0x4]
	ldrb r0, [r3, 0x5]
	lsls r0, 8
	orrs r1, r0
	ldrb r0, [r3, 0x6]
	lsls r0, 16
	orrs r1, r0
	ldrb r0, [r3, 0x7]
	lsls r0, 24
	orrs r1, r0
	str r1, [r4]
	b _0812A972
	.align 2, 0
_0812A964: .4byte gSharedMem + 0x192E4
_0812A968: .4byte gAIScriptPtr
_0812A96C:
	adds r0, r3, 0
	adds r0, 0x8
	str r0, [r4]
_0812A972:
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end ContestAICmd_unk_75

	thumb_func_start ContestAICmd_unk_76
ContestAICmd_unk_76: @ 812A978
	push {r4,lr}
	ldr r1, _0812A9B0 @ =gSharedMem + 0x192E4
	ldr r4, _0812A9B4 @ =gAIScriptPtr
	ldr r3, [r4]
	ldrb r0, [r3, 0x1]
	lsls r0, 1
	adds r1, 0x1A
	adds r0, r1
	movs r1, 0
	ldrsh r2, [r0, r1]
	ldrb r1, [r3, 0x2]
	ldrb r0, [r3, 0x3]
	lsls r0, 8
	orrs r1, r0
	cmp r2, r1
	ble _0812A9B8
	ldrb r1, [r3, 0x4]
	ldrb r0, [r3, 0x5]
	lsls r0, 8
	orrs r1, r0
	ldrb r0, [r3, 0x6]
	lsls r0, 16
	orrs r1, r0
	ldrb r0, [r3, 0x7]
	lsls r0, 24
	orrs r1, r0
	str r1, [r4]
	b _0812A9BE
	.align 2, 0
_0812A9B0: .4byte gSharedMem + 0x192E4
_0812A9B4: .4byte gAIScriptPtr
_0812A9B8:
	adds r0, r3, 0
	adds r0, 0x8
	str r0, [r4]
_0812A9BE:
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end ContestAICmd_unk_76

	thumb_func_start ContestAICmd_unk_77
ContestAICmd_unk_77: @ 812A9C4
	push {r4,lr}
	ldr r1, _0812A9FC @ =gSharedMem + 0x192E4
	ldr r4, _0812AA00 @ =gAIScriptPtr
	ldr r3, [r4]
	ldrb r0, [r3, 0x1]
	lsls r0, 1
	adds r1, 0x1A
	adds r0, r1
	movs r1, 0
	ldrsh r2, [r0, r1]
	ldrb r1, [r3, 0x2]
	ldrb r0, [r3, 0x3]
	lsls r0, 8
	orrs r1, r0
	cmp r2, r1
	bne _0812AA04
	ldrb r1, [r3, 0x4]
	ldrb r0, [r3, 0x5]
	lsls r0, 8
	orrs r1, r0
	ldrb r0, [r3, 0x6]
	lsls r0, 16
	orrs r1, r0
	ldrb r0, [r3, 0x7]
	lsls r0, 24
	orrs r1, r0
	str r1, [r4]
	b _0812AA0A
	.align 2, 0
_0812A9FC: .4byte gSharedMem + 0x192E4
_0812AA00: .4byte gAIScriptPtr
_0812AA04:
	adds r0, r3, 0
	adds r0, 0x8
	str r0, [r4]
_0812AA0A:
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end ContestAICmd_unk_77

	thumb_func_start ContestAICmd_unk_78
ContestAICmd_unk_78: @ 812AA10
	push {r4,lr}
	ldr r1, _0812AA48 @ =gSharedMem + 0x192E4
	ldr r4, _0812AA4C @ =gAIScriptPtr
	ldr r3, [r4]
	ldrb r0, [r3, 0x1]
	lsls r0, 1
	adds r1, 0x1A
	adds r0, r1
	movs r1, 0
	ldrsh r2, [r0, r1]
	ldrb r1, [r3, 0x2]
	ldrb r0, [r3, 0x3]
	lsls r0, 8
	orrs r1, r0
	cmp r2, r1
	beq _0812AA50
	ldrb r1, [r3, 0x4]
	ldrb r0, [r3, 0x5]
	lsls r0, 8
	orrs r1, r0
	ldrb r0, [r3, 0x6]
	lsls r0, 16
	orrs r1, r0
	ldrb r0, [r3, 0x7]
	lsls r0, 24
	orrs r1, r0
	str r1, [r4]
	b _0812AA56
	.align 2, 0
_0812AA48: .4byte gSharedMem + 0x192E4
_0812AA4C: .4byte gAIScriptPtr
_0812AA50:
	adds r0, r3, 0
	adds r0, 0x8
	str r0, [r4]
_0812AA56:
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end ContestAICmd_unk_78

	thumb_func_start ContestAICmd_unk_79
ContestAICmd_unk_79: @ 812AA5C
	push {r4,lr}
	ldr r2, _0812AA98 @ =gSharedMem + 0x192E4
	ldr r4, _0812AA9C @ =gAIScriptPtr
	ldr r3, [r4]
	ldrb r1, [r3, 0x1]
	lsls r1, 1
	adds r2, 0x1A
	adds r1, r2
	ldrb r0, [r3, 0x2]
	lsls r0, 1
	adds r0, r2
	movs r2, 0
	ldrsh r1, [r1, r2]
	movs r2, 0
	ldrsh r0, [r0, r2]
	cmp r1, r0
	bge _0812AAA0
	ldrb r1, [r3, 0x3]
	ldrb r0, [r3, 0x4]
	lsls r0, 8
	orrs r1, r0
	ldrb r0, [r3, 0x5]
	lsls r0, 16
	orrs r1, r0
	ldrb r0, [r3, 0x6]
	lsls r0, 24
	orrs r1, r0
	str r1, [r4]
	b _0812AAA4
	.align 2, 0
_0812AA98: .4byte gSharedMem + 0x192E4
_0812AA9C: .4byte gAIScriptPtr
_0812AAA0:
	adds r0, r3, 0x7
	str r0, [r4]
_0812AAA4:
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end ContestAICmd_unk_79

	thumb_func_start ContestAICmd_unk_7A
ContestAICmd_unk_7A: @ 812AAAC
	push {r4,lr}
	ldr r2, _0812AAE8 @ =gSharedMem + 0x192E4
	ldr r4, _0812AAEC @ =gAIScriptPtr
	ldr r3, [r4]
	ldrb r1, [r3, 0x1]
	lsls r1, 1
	adds r2, 0x1A
	adds r1, r2
	ldrb r0, [r3, 0x2]
	lsls r0, 1
	adds r0, r2
	movs r2, 0
	ldrsh r1, [r1, r2]
	movs r2, 0
	ldrsh r0, [r0, r2]
	cmp r1, r0
	ble _0812AAF0
	ldrb r1, [r3, 0x3]
	ldrb r0, [r3, 0x4]
	lsls r0, 8
	orrs r1, r0
	ldrb r0, [r3, 0x5]
	lsls r0, 16
	orrs r1, r0
	ldrb r0, [r3, 0x6]
	lsls r0, 24
	orrs r1, r0
	str r1, [r4]
	b _0812AAF4
	.align 2, 0
_0812AAE8: .4byte gSharedMem + 0x192E4
_0812AAEC: .4byte gAIScriptPtr
_0812AAF0:
	adds r0, r3, 0x7
	str r0, [r4]
_0812AAF4:
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end ContestAICmd_unk_7A

	thumb_func_start ContestAICmd_unk_7B
ContestAICmd_unk_7B: @ 812AAFC
	push {r4,lr}
	ldr r2, _0812AB38 @ =gSharedMem + 0x192E4
	ldr r4, _0812AB3C @ =gAIScriptPtr
	ldr r3, [r4]
	ldrb r1, [r3, 0x1]
	lsls r1, 1
	adds r2, 0x1A
	adds r1, r2
	ldrb r0, [r3, 0x2]
	lsls r0, 1
	adds r0, r2
	movs r2, 0
	ldrsh r1, [r1, r2]
	movs r2, 0
	ldrsh r0, [r0, r2]
	cmp r1, r0
	bne _0812AB40
	ldrb r1, [r3, 0x3]
	ldrb r0, [r3, 0x4]
	lsls r0, 8
	orrs r1, r0
	ldrb r0, [r3, 0x5]
	lsls r0, 16
	orrs r1, r0
	ldrb r0, [r3, 0x6]
	lsls r0, 24
	orrs r1, r0
	str r1, [r4]
	b _0812AB44
	.align 2, 0
_0812AB38: .4byte gSharedMem + 0x192E4
_0812AB3C: .4byte gAIScriptPtr
_0812AB40:
	adds r0, r3, 0x7
	str r0, [r4]
_0812AB44:
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end ContestAICmd_unk_7B

	thumb_func_start ContestAICmd_unk_7C
ContestAICmd_unk_7C: @ 812AB4C
	push {r4,lr}
	ldr r2, _0812AB88 @ =gSharedMem + 0x192E4
	ldr r4, _0812AB8C @ =gAIScriptPtr
	ldr r3, [r4]
	ldrb r1, [r3, 0x1]
	lsls r1, 1
	adds r2, 0x1A
	adds r1, r2
	ldrb r0, [r3, 0x2]
	lsls r0, 1
	adds r0, r2
	movs r2, 0
	ldrsh r1, [r1, r2]
	movs r2, 0
	ldrsh r0, [r0, r2]
	cmp r1, r0
	beq _0812AB90
	ldrb r1, [r3, 0x3]
	ldrb r0, [r3, 0x4]
	lsls r0, 8
	orrs r1, r0
	ldrb r0, [r3, 0x5]
	lsls r0, 16
	orrs r1, r0
	ldrb r0, [r3, 0x6]
	lsls r0, 24
	orrs r1, r0
	str r1, [r4]
	b _0812AB94
	.align 2, 0
_0812AB88: .4byte gSharedMem + 0x192E4
_0812AB8C: .4byte gAIScriptPtr
_0812AB90:
	adds r0, r3, 0x7
	str r0, [r4]
_0812AB94:
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end ContestAICmd_unk_7C

	thumb_func_start ContestAICmd_unk_7D
ContestAICmd_unk_7D: @ 812AB9C
	push {r4,lr}
	bl Random
	movs r2, 0xFF
	ands r2, r0
	ldr r1, _0812ABD4 @ =gSharedMem + 0x192E4
	ldr r4, _0812ABD8 @ =gAIScriptPtr
	ldr r3, [r4]
	ldrb r0, [r3, 0x1]
	lsls r0, 1
	adds r1, 0x1A
	adds r0, r1
	movs r1, 0
	ldrsh r0, [r0, r1]
	cmp r2, r0
	bge _0812ABDC
	ldrb r1, [r3, 0x2]
	ldrb r0, [r3, 0x3]
	lsls r0, 8
	orrs r1, r0
	ldrb r0, [r3, 0x4]
	lsls r0, 16
	orrs r1, r0
	ldrb r0, [r3, 0x5]
	lsls r0, 24
	orrs r1, r0
	str r1, [r4]
	b _0812ABE0
	.align 2, 0
_0812ABD4: .4byte gSharedMem + 0x192E4
_0812ABD8: .4byte gAIScriptPtr
_0812ABDC:
	adds r0, r3, 0x6
	str r0, [r4]
_0812ABE0:
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end ContestAICmd_unk_7D

	thumb_func_start ContestAICmd_unk_7E
ContestAICmd_unk_7E: @ 812ABE8
	push {r4,lr}
	bl Random
	movs r2, 0xFF
	ands r2, r0
	ldr r1, _0812AC20 @ =gSharedMem + 0x192E4
	ldr r4, _0812AC24 @ =gAIScriptPtr
	ldr r3, [r4]
	ldrb r0, [r3, 0x1]
	lsls r0, 1
	adds r1, 0x1A
	adds r0, r1
	movs r1, 0
	ldrsh r0, [r0, r1]
	cmp r2, r0
	ble _0812AC28
	ldrb r1, [r3, 0x2]
	ldrb r0, [r3, 0x3]
	lsls r0, 8
	orrs r1, r0
	ldrb r0, [r3, 0x4]
	lsls r0, 16
	orrs r1, r0
	ldrb r0, [r3, 0x5]
	lsls r0, 24
	orrs r1, r0
	str r1, [r4]
	b _0812AC2C
	.align 2, 0
_0812AC20: .4byte gSharedMem + 0x192E4
_0812AC24: .4byte gAIScriptPtr
_0812AC28:
	adds r0, r3, 0x6
	str r0, [r4]
_0812AC2C:
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end ContestAICmd_unk_7E

	thumb_func_start ContestAICmd_unk_7F
ContestAICmd_unk_7F: @ 812AC34
	ldr r3, _0812AC50 @ =gAIScriptPtr
	ldr r2, [r3]
	ldrb r1, [r2, 0x1]
	ldrb r0, [r2, 0x2]
	lsls r0, 8
	orrs r1, r0
	ldrb r0, [r2, 0x3]
	lsls r0, 16
	orrs r1, r0
	ldrb r0, [r2, 0x4]
	lsls r0, 24
	orrs r1, r0
	str r1, [r3]
	bx lr
	.align 2, 0
_0812AC50: .4byte gAIScriptPtr
	thumb_func_end ContestAICmd_unk_7F

	thumb_func_start ContestAICmd_unk_80
ContestAICmd_unk_80: @ 812AC54
	push {r4,lr}
	ldr r4, _0812AC80 @ =gAIScriptPtr
	ldr r0, [r4]
	adds r0, 0x5
	bl sub_812ACA4
	ldr r2, [r4]
	ldrb r1, [r2, 0x1]
	ldrb r0, [r2, 0x2]
	lsls r0, 8
	orrs r1, r0
	ldrb r0, [r2, 0x3]
	lsls r0, 16
	orrs r1, r0
	ldrb r0, [r2, 0x4]
	lsls r0, 24
	orrs r1, r0
	str r1, [r4]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0812AC80: .4byte gAIScriptPtr
	thumb_func_end ContestAICmd_unk_80

	thumb_func_start ContestAICmd_unk_81
ContestAICmd_unk_81: @ 812AC84
	push {lr}
	bl sub_812ACC8
	lsls r0, 24
	cmp r0, 0
	bne _0812AC9A
	ldr r2, _0812ACA0 @ =gSharedMem + 0x192E4
	ldrb r1, [r2, 0x9]
	movs r0, 0x1
	orrs r0, r1
	strb r0, [r2, 0x9]
_0812AC9A:
	pop {r0}
	bx r0
	.align 2, 0
_0812ACA0: .4byte gSharedMem + 0x192E4
	thumb_func_end ContestAICmd_unk_81

	thumb_func_start sub_812ACA4
sub_812ACA4: @ 812ACA4
	push {r4,lr}
	ldr r3, _0812ACC4 @ =gSharedMem + 0x192E4
	adds r4, r3, 0
	adds r4, 0x40
	ldrb r1, [r4]
	adds r2, r1, 0x1
	strb r2, [r4]
	lsls r1, 24
	lsrs r1, 22
	adds r3, 0x20
	adds r1, r3
	str r0, [r1]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0812ACC4: .4byte gSharedMem + 0x192E4
	thumb_func_end sub_812ACA4

	thumb_func_start sub_812ACC8
sub_812ACC8: @ 812ACC8
	push {lr}
	ldr r1, _0812ACDC @ =gSharedMem + 0x192E4
	adds r3, r1, 0
	adds r3, 0x40
	ldrb r0, [r3]
	cmp r0, 0
	bne _0812ACE0
	movs r0, 0
	b _0812ACF4
	.align 2, 0
_0812ACDC: .4byte gSharedMem + 0x192E4
_0812ACE0:
	subs r0, 0x1
	strb r0, [r3]
	ldr r2, _0812ACF8 @ =gAIScriptPtr
	ldrb r0, [r3]
	lsls r0, 2
	adds r1, 0x20
	adds r0, r1
	ldr r0, [r0]
	str r0, [r2]
	movs r0, 0x1
_0812ACF4:
	pop {r1}
	bx r1
	.align 2, 0
_0812ACF8: .4byte gAIScriptPtr
	thumb_func_end sub_812ACC8

	thumb_func_start ContestAICmd_check_for_exciting_move
ContestAICmd_check_for_exciting_move: @ 812ACFC
	push {r4-r7,lr}
	movs r5, 0
	movs r4, 0
	ldr r7, _0812AD28 @ =gSharedMem + 0x19325
	ldr r6, _0812AD2C @ =gContestMons + 0x1E
_0812AD06:
	lsls r0, r4, 1
	ldrb r1, [r7]
	lsls r1, 6
	adds r0, r1
	adds r1, r0, r6
	ldrh r0, [r1]
	cmp r0, 0
	beq _0812AD30
	bl Contest_GetMoveExcitement
	lsls r0, 24
	asrs r0, 24
	cmp r0, 0x1
	bne _0812AD30
	movs r5, 0x1
	b _0812AD36
	.align 2, 0
_0812AD28: .4byte gSharedMem + 0x19325
_0812AD2C: .4byte gContestMons + 0x1E
_0812AD30:
	adds r4, 0x1
	cmp r4, 0x3
	ble _0812AD06
_0812AD36:
	ldr r0, _0812AD48 @ =gSharedMem + 0x192E4
	strh r5, [r0, 0x18]
	ldr r1, _0812AD4C @ =gAIScriptPtr
	ldr r0, [r1]
	adds r0, 0x1
	str r0, [r1]
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_0812AD48: .4byte gSharedMem + 0x192E4
_0812AD4C: .4byte gAIScriptPtr
	thumb_func_end ContestAICmd_check_for_exciting_move

	thumb_func_start ContestAICmd_unk_83
ContestAICmd_unk_83: @ 812AD50
	push {lr}
	bl ContestAICmd_check_for_exciting_move
	ldr r0, _0812AD7C @ =gSharedMem + 0x192E4
	movs r1, 0x18
	ldrsh r0, [r0, r1]
	cmp r0, 0
	beq _0812AD84
	ldr r3, _0812AD80 @ =gAIScriptPtr
	ldr r2, [r3]
	ldrb r1, [r2]
	ldrb r0, [r2, 0x1]
	lsls r0, 8
	orrs r1, r0
	ldrb r0, [r2, 0x2]
	lsls r0, 16
	orrs r1, r0
	ldrb r0, [r2, 0x3]
	lsls r0, 24
	orrs r1, r0
	str r1, [r3]
	b _0812AD8C
	.align 2, 0
_0812AD7C: .4byte gSharedMem + 0x192E4
_0812AD80: .4byte gAIScriptPtr
_0812AD84:
	ldr r1, _0812AD90 @ =gAIScriptPtr
	ldr r0, [r1]
	adds r0, 0x4
	str r0, [r1]
_0812AD8C:
	pop {r0}
	bx r0
	.align 2, 0
_0812AD90: .4byte gAIScriptPtr
	thumb_func_end ContestAICmd_unk_83

	thumb_func_start ContestAICmd_unk_84
ContestAICmd_unk_84: @ 812AD94
	push {lr}
	bl ContestAICmd_check_for_exciting_move
	ldr r0, _0812ADC0 @ =gSharedMem + 0x192E4
	movs r1, 0x18
	ldrsh r0, [r0, r1]
	cmp r0, 0
	bne _0812ADC8
	ldr r3, _0812ADC4 @ =gAIScriptPtr
	ldr r2, [r3]
	ldrb r1, [r2]
	ldrb r0, [r2, 0x1]
	lsls r0, 8
	orrs r1, r0
	ldrb r0, [r2, 0x2]
	lsls r0, 16
	orrs r1, r0
	ldrb r0, [r2, 0x3]
	lsls r0, 24
	orrs r1, r0
	str r1, [r3]
	b _0812ADD0
	.align 2, 0
_0812ADC0: .4byte gSharedMem + 0x192E4
_0812ADC4: .4byte gAIScriptPtr
_0812ADC8:
	ldr r1, _0812ADD4 @ =gAIScriptPtr
	ldr r0, [r1]
	adds r0, 0x4
	str r0, [r1]
_0812ADD0:
	pop {r0}
	bx r0
	.align 2, 0
_0812ADD4: .4byte gAIScriptPtr
	thumb_func_end ContestAICmd_unk_84

	thumb_func_start ContestAICmd_unk_85
ContestAICmd_unk_85: @ 812ADD8
	push {r4-r7,lr}
	movs r6, 0
	ldr r2, _0812AE08 @ =gAIScriptPtr
	ldr r0, [r2]
	ldrb r4, [r0, 0x1]
	ldrb r0, [r0, 0x2]
	lsls r0, 8
	orrs r4, r0
	movs r3, 0
	ldr r0, _0812AE0C @ =gContestMons
	mov r12, r0
	ldr r5, _0812AE10 @ =gSharedMem + 0x192E4
	adds r0, r5, 0
	adds r0, 0x41
	ldrb r0, [r0]
	lsls r0, 6
	mov r1, r12
	adds r1, 0x1E
	adds r0, r1
	ldrh r0, [r0]
	adds r7, r2, 0
	mov r2, r12
	mov r12, r5
	b _0812AE2E
	.align 2, 0
_0812AE08: .4byte gAIScriptPtr
_0812AE0C: .4byte gContestMons
_0812AE10: .4byte gSharedMem + 0x192E4
_0812AE14:
	adds r3, 0x1
	cmp r3, 0x3
	bgt _0812AE34
	lsls r1, r3, 1
	mov r0, r12
	adds r0, 0x41
	ldrb r0, [r0]
	lsls r0, 6
	adds r1, r0
	adds r0, r2, 0
	adds r0, 0x1E
	adds r1, r0
	ldrh r0, [r1]
_0812AE2E:
	cmp r0, r4
	bne _0812AE14
	movs r6, 0x1
_0812AE34:
	mov r0, r12
	strh r6, [r0, 0x18]
	ldr r0, [r7]
	adds r0, 0x3
	str r0, [r7]
	pop {r4-r7}
	pop {r0}
	bx r0
	thumb_func_end ContestAICmd_unk_85

	thumb_func_start ContestAICmd_unk_86
ContestAICmd_unk_86: @ 812AE44
	push {lr}
	bl ContestAICmd_unk_85
	ldr r0, _0812AE70 @ =gSharedMem + 0x192E4
	movs r1, 0x18
	ldrsh r0, [r0, r1]
	cmp r0, 0
	beq _0812AE78
	ldr r3, _0812AE74 @ =gAIScriptPtr
	ldr r2, [r3]
	ldrb r1, [r2]
	ldrb r0, [r2, 0x1]
	lsls r0, 8
	orrs r1, r0
	ldrb r0, [r2, 0x2]
	lsls r0, 16
	orrs r1, r0
	ldrb r0, [r2, 0x3]
	lsls r0, 24
	orrs r1, r0
	str r1, [r3]
	b _0812AE80
	.align 2, 0
_0812AE70: .4byte gSharedMem + 0x192E4
_0812AE74: .4byte gAIScriptPtr
_0812AE78:
	ldr r1, _0812AE84 @ =gAIScriptPtr
	ldr r0, [r1]
	adds r0, 0x4
	str r0, [r1]
_0812AE80:
	pop {r0}
	bx r0
	.align 2, 0
_0812AE84: .4byte gAIScriptPtr
	thumb_func_end ContestAICmd_unk_86

	thumb_func_start ContestAICmd_unk_87
ContestAICmd_unk_87: @ 812AE88
	push {lr}
	bl ContestAICmd_unk_85
	ldr r0, _0812AEB4 @ =gSharedMem + 0x192E4
	movs r1, 0x18
	ldrsh r0, [r0, r1]
	cmp r0, 0
	bne _0812AEBC
	ldr r3, _0812AEB8 @ =gAIScriptPtr
	ldr r2, [r3]
	ldrb r1, [r2]
	ldrb r0, [r2, 0x1]
	lsls r0, 8
	orrs r1, r0
	ldrb r0, [r2, 0x2]
	lsls r0, 16
	orrs r1, r0
	ldrb r0, [r2, 0x3]
	lsls r0, 24
	orrs r1, r0
	str r1, [r3]
	b _0812AEC4
	.align 2, 0
_0812AEB4: .4byte gSharedMem + 0x192E4
_0812AEB8: .4byte gAIScriptPtr
_0812AEBC:
	ldr r1, _0812AEC8 @ =gAIScriptPtr
	ldr r0, [r1]
	adds r0, 0x4
	str r0, [r1]
_0812AEC4:
	pop {r0}
	bx r0
	.align 2, 0
_0812AEC8: .4byte gAIScriptPtr
	thumb_func_end ContestAICmd_unk_87

	.align 2, 0 @ Don't pad with nop.
