	.include "constants/gba_constants.inc"
	.include "include/macros.inc"

	.syntax unified

	.text

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
