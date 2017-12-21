	.include "constants/gba_constants.inc"
	.include "asm/macros.inc"

	.syntax unified

	.text

	thumb_func_start sub_81288F4
sub_81288F4: @ 81288F4
	push {r4,r5,lr}
	lsls r0, 24
	lsrs r5, r0, 24
	ldr r4, _0812893C @ =gSharedMem + 0x192E4
	adds r0, r4, 0
	movs r1, 0
	movs r2, 0x44
	bl memset
	movs r3, 0x64
	adds r2, r4, 0
	movs r1, 0x3
	adds r0, r2, 0
	adds r0, 0x8
_08128910:
	strb r3, [r0]
	subs r0, 0x1
	subs r1, 0x1
	cmp r1, 0
	bge _08128910
	adds r3, r2, 0
	adds r3, 0x41
	movs r1, 0
	strb r5, [r3]
	adds r0, r2, 0
	adds r0, 0x40
	strb r1, [r0]
	ldr r1, _08128940 @ =gContestMons
	ldrb r0, [r3]
	lsls r0, 6
	adds r1, 0x18
	adds r0, r1
	ldr r0, [r0]
	str r0, [r2, 0x14]
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_0812893C: .4byte gSharedMem + 0x192E4
_08128940: .4byte gContestMons
	thumb_func_end sub_81288F4

	thumb_func_start sub_8128944
sub_8128944: @ 8128944
	push {r4-r6,lr}
	ldr r1, _081289A8 @ =gSharedMem + 0x192E4
	ldr r0, [r1, 0x14]
	cmp r0, 0
	beq _08128974
	adds r4, r1, 0
	movs r5, 0
_08128952:
	ldr r0, [r4, 0x14]
	movs r1, 0x1
	ands r0, r1
	cmp r0, 0
	beq _08128962
	strb r5, [r4]
	bl sub_81289AC
_08128962:
	ldr r1, [r4, 0x14]
	lsrs r1, 1
	str r1, [r4, 0x14]
	ldrb r0, [r4, 0x10]
	adds r0, 0x1
	strb r0, [r4, 0x10]
	strb r5, [r4, 0x4]
	cmp r1, 0
	bne _08128952
_08128974:
	movs r6, 0x3
	ldr r5, _081289A8 @ =gSharedMem + 0x192E4
_08128978:
	bl Random
	adds r4, r0, 0
	ands r4, r6
	adds r3, r5, 0x5
	adds r0, r4, r3
	ldrb r2, [r0]
	movs r1, 0
	ldrb r0, [r5, 0x5]
	cmp r2, r0
	bcc _0812899C
_0812898E:
	adds r1, 0x1
	cmp r1, 0x3
	bgt _0812899C
	adds r0, r1, r3
	ldrb r0, [r0]
	cmp r2, r0
	bcs _0812898E
_0812899C:
	cmp r1, 0x4
	bne _08128978
	adds r0, r4, 0
	pop {r4-r6}
	pop {r1}
	bx r1
	.align 2, 0
_081289A8: .4byte gSharedMem + 0x192E4
	thumb_func_end sub_8128944

	thumb_func_start sub_81289AC
sub_81289AC: @ 81289AC
	push {r4-r6,lr}
	ldr r1, _081289F4 @ =gSharedMem + 0x192E4
	ldrb r0, [r1]
	adds r2, r1, 0
	cmp r0, 0x2
	beq _08128A76
	adds r4, r1, 0
	ldr r5, _081289F8 @ =gAIScriptPtr
	ldr r6, _081289FC @ =gUnknown_0203858E
_081289BE:
	ldrb r0, [r4]
	cmp r0, 0x1
	beq _08128A0E
	cmp r0, 0x1
	bgt _08128A6E
	cmp r0, 0
	bne _08128A6E
	ldr r1, _08128A00 @ =gContestAIs
	ldrb r0, [r4, 0x10]
	lsls r0, 2
	adds r0, r1
	ldr r0, [r0]
	str r0, [r5]
	ldrb r1, [r4, 0x4]
	lsls r1, 1
	adds r0, r4, 0
	adds r0, 0x41
	ldrb r0, [r0]
	lsls r0, 6
	adds r1, r0
	adds r1, r6
	ldrh r1, [r1]
	adds r0, r1, 0
	cmp r0, 0
	bne _08128A04
	strh r0, [r4, 0x2]
	b _08128A06
	.align 2, 0
_081289F4: .4byte gSharedMem + 0x192E4
_081289F8: .4byte gAIScriptPtr
_081289FC: .4byte gUnknown_0203858E
_08128A00: .4byte gContestAIs
_08128A04:
	strh r1, [r4, 0x2]
_08128A06:
	ldrb r0, [r4]
	adds r0, 0x1
	strb r0, [r4]
	b _08128A6E
_08128A0E:
	ldrh r1, [r1, 0x2]
	cmp r1, 0
	beq _08128A2C
	ldr r1, _08128A28 @ =sContestAICmdTable
	ldr r0, [r5]
	ldrb r0, [r0]
	lsls r0, 2
	adds r0, r1
	ldr r0, [r0]
	bl _call_via_r0
	b _08128A3C
	.align 2, 0
_08128A28: .4byte sContestAICmdTable
_08128A2C:
	adds r0, r4, 0x5
	ldrb r2, [r4, 0x4]
	adds r0, r2
	strb r1, [r0]
	ldrb r1, [r4, 0x9]
	movs r0, 0x1
	orrs r0, r1
	strb r0, [r4, 0x9]
_08128A3C:
	ldr r2, _08128A5C @ =gSharedMem + 0x192E4
	ldrb r1, [r2, 0x9]
	movs r0, 0x1
	ands r0, r1
	cmp r0, 0
	beq _08128A6E
	ldrb r0, [r2, 0x4]
	adds r0, 0x1
	movs r1, 0
	strb r0, [r2, 0x4]
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x3
	bhi _08128A60
	strb r1, [r2]
	b _08128A66
	.align 2, 0
_08128A5C: .4byte gSharedMem + 0x192E4
_08128A60:
	ldrb r0, [r2]
	adds r0, 0x1
	strb r0, [r2]
_08128A66:
	ldrb r1, [r4, 0x9]
	movs r0, 0xFE
	ands r0, r1
	strb r0, [r4, 0x9]
_08128A6E:
	adds r1, r2, 0
	ldrb r0, [r1]
	cmp r0, 0x2
	bne _081289BE
_08128A76:
	pop {r4-r6}
	pop {r0}
	bx r0
	thumb_func_end sub_81289AC

	thumb_func_start sub_8128A7C
sub_8128A7C: @ 8128A7C
	push {lr}
	lsls r0, 24
	lsrs r2, r0, 24
	movs r1, 0
	ldr r3, _08128AA4 @ =gSharedMem + 0x192D0
	ldrb r0, [r3]
	cmp r0, r2
	beq _08128A9A
_08128A8C:
	adds r1, 0x1
	cmp r1, 0x3
	bgt _08128A9A
	adds r0, r1, r3
	ldrb r0, [r0]
	cmp r0, r2
	bne _08128A8C
_08128A9A:
	lsls r0, r1, 24
	lsrs r0, 24
	pop {r1}
	bx r1
	.align 2, 0
_08128AA4: .4byte gSharedMem + 0x192D0
	thumb_func_end sub_8128A7C

	thumb_func_start ContestAICmd_unk_00
ContestAICmd_unk_00: @ 8128AA8
	push {lr}
	ldr r2, _08128AD0 @ =gSharedMem + 0x192E4
	adds r1, r2, 0x5
	ldrb r0, [r2, 0x4]
	adds r1, r0
	ldr r3, _08128AD4 @ =gAIScriptPtr
	ldr r0, [r3]
	ldrb r0, [r0, 0x1]
	lsls r0, 24
	asrs r0, 24
	ldrb r1, [r1]
	adds r0, r1
	lsls r0, 16
	lsrs r1, r0, 16
	asrs r0, 16
	cmp r0, 0xFF
	ble _08128AD8
	movs r1, 0xFF
	b _08128ADE
	.align 2, 0
_08128AD0: .4byte gSharedMem + 0x192E4
_08128AD4: .4byte gAIScriptPtr
_08128AD8:
	cmp r0, 0
	bge _08128ADE
	movs r1, 0
_08128ADE:
	adds r0, r2, 0x5
	ldrb r2, [r2, 0x4]
	adds r0, r2
	strb r1, [r0]
	ldr r0, [r3]
	adds r0, 0x2
	str r0, [r3]
	pop {r0}
	bx r0
	thumb_func_end ContestAICmd_unk_00

	thumb_func_start ContestAICmd_get_turn
ContestAICmd_get_turn: @ 8128AF0
	ldr r1, _08128B04 @ =gSharedMem + 0x192E4
	adds r0, r1, 0
	subs r0, 0xE0
	ldrb r0, [r0, 0x1]
	strh r0, [r1, 0x18]
	ldr r1, _08128B08 @ =gAIScriptPtr
	ldr r0, [r1]
	adds r0, 0x1
	str r0, [r1]
	bx lr
	.align 2, 0
_08128B04: .4byte gSharedMem + 0x192E4
_08128B08: .4byte gAIScriptPtr
	thumb_func_end ContestAICmd_get_turn

	thumb_func_start ContestAICmd_unk_02
ContestAICmd_unk_02: @ 8128B0C
	push {lr}
	bl ContestAICmd_get_turn
	ldr r0, _08128B3C @ =gSharedMem + 0x192E4
	movs r1, 0x18
	ldrsh r0, [r0, r1]
	ldr r3, _08128B40 @ =gAIScriptPtr
	ldr r2, [r3]
	ldrb r1, [r2]
	cmp r0, r1
	bge _08128B44
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
	b _08128B48
	.align 2, 0
_08128B3C: .4byte gSharedMem + 0x192E4
_08128B40: .4byte gAIScriptPtr
_08128B44:
	adds r0, r2, 0x5
	str r0, [r3]
_08128B48:
	pop {r0}
	bx r0
	thumb_func_end ContestAICmd_unk_02

	thumb_func_start ContestAICmd_unk_03
ContestAICmd_unk_03: @ 8128B4C
	push {lr}
	bl ContestAICmd_get_turn
	ldr r0, _08128B7C @ =gSharedMem + 0x192E4
	movs r1, 0x18
	ldrsh r0, [r0, r1]
	ldr r3, _08128B80 @ =gAIScriptPtr
	ldr r2, [r3]
	ldrb r1, [r2]
	cmp r0, r1
	ble _08128B84
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
	b _08128B88
	.align 2, 0
_08128B7C: .4byte gSharedMem + 0x192E4
_08128B80: .4byte gAIScriptPtr
_08128B84:
	adds r0, r2, 0x5
	str r0, [r3]
_08128B88:
	pop {r0}
	bx r0
	thumb_func_end ContestAICmd_unk_03

	thumb_func_start ContestAICmd_unk_04
ContestAICmd_unk_04: @ 8128B8C
	push {lr}
	bl ContestAICmd_get_turn
	ldr r0, _08128BBC @ =gSharedMem + 0x192E4
	movs r1, 0x18
	ldrsh r0, [r0, r1]
	ldr r3, _08128BC0 @ =gAIScriptPtr
	ldr r2, [r3]
	ldrb r1, [r2]
	cmp r0, r1
	bne _08128BC4
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
	b _08128BC8
	.align 2, 0
_08128BBC: .4byte gSharedMem + 0x192E4
_08128BC0: .4byte gAIScriptPtr
_08128BC4:
	adds r0, r2, 0x5
	str r0, [r3]
_08128BC8:
	pop {r0}
	bx r0
	thumb_func_end ContestAICmd_unk_04

	thumb_func_start ContestAICmd_unk_05
ContestAICmd_unk_05: @ 8128BCC
	push {lr}
	bl ContestAICmd_get_turn
	ldr r0, _08128BFC @ =gSharedMem + 0x192E4
	movs r1, 0x18
	ldrsh r0, [r0, r1]
	ldr r3, _08128C00 @ =gAIScriptPtr
	ldr r2, [r3]
	ldrb r1, [r2]
	cmp r0, r1
	beq _08128C04
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
	b _08128C08
	.align 2, 0
_08128BFC: .4byte gSharedMem + 0x192E4
_08128C00: .4byte gAIScriptPtr
_08128C04:
	adds r0, r2, 0x5
	str r0, [r3]
_08128C08:
	pop {r0}
	bx r0
	thumb_func_end ContestAICmd_unk_05

	thumb_func_start ContestAICmd_get_excitement
ContestAICmd_get_excitement: @ 8128C0C
	ldr r1, _08128C24 @ =gSharedMem + 0x192E4
	adds r0, r1, 0
	subs r0, 0xE0
	ldrb r0, [r0, 0x13]
	lsls r0, 24
	asrs r0, 24
	strh r0, [r1, 0x18]
	ldr r1, _08128C28 @ =gAIScriptPtr
	ldr r0, [r1]
	adds r0, 0x1
	str r0, [r1]
	bx lr
	.align 2, 0
_08128C24: .4byte gSharedMem + 0x192E4
_08128C28: .4byte gAIScriptPtr
	thumb_func_end ContestAICmd_get_excitement

	thumb_func_start ContestAICmd_unk_07
ContestAICmd_unk_07: @ 8128C2C
	push {lr}
	bl ContestAICmd_get_excitement
	ldr r0, _08128C5C @ =gSharedMem + 0x192E4
	movs r1, 0x18
	ldrsh r0, [r0, r1]
	ldr r3, _08128C60 @ =gAIScriptPtr
	ldr r2, [r3]
	ldrb r1, [r2]
	cmp r0, r1
	bge _08128C64
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
	b _08128C68
	.align 2, 0
_08128C5C: .4byte gSharedMem + 0x192E4
_08128C60: .4byte gAIScriptPtr
_08128C64:
	adds r0, r2, 0x5
	str r0, [r3]
_08128C68:
	pop {r0}
	bx r0
	thumb_func_end ContestAICmd_unk_07

	thumb_func_start ContestAICmd_unk_08
ContestAICmd_unk_08: @ 8128C6C
	push {lr}
	bl ContestAICmd_get_excitement
	ldr r0, _08128C9C @ =gSharedMem + 0x192E4
	movs r1, 0x18
	ldrsh r0, [r0, r1]
	ldr r3, _08128CA0 @ =gAIScriptPtr
	ldr r2, [r3]
	ldrb r1, [r2]
	cmp r0, r1
	ble _08128CA4
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
	b _08128CA8
	.align 2, 0
_08128C9C: .4byte gSharedMem + 0x192E4
_08128CA0: .4byte gAIScriptPtr
_08128CA4:
	adds r0, r2, 0x5
	str r0, [r3]
_08128CA8:
	pop {r0}
	bx r0
	thumb_func_end ContestAICmd_unk_08

	thumb_func_start ContestAICmd_unk_09
ContestAICmd_unk_09: @ 8128CAC
	push {lr}
	bl ContestAICmd_get_excitement
	ldr r0, _08128CDC @ =gSharedMem + 0x192E4
	movs r1, 0x18
	ldrsh r0, [r0, r1]
	ldr r3, _08128CE0 @ =gAIScriptPtr
	ldr r2, [r3]
	ldrb r1, [r2]
	cmp r0, r1
	bne _08128CE4
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
	b _08128CE8
	.align 2, 0
_08128CDC: .4byte gSharedMem + 0x192E4
_08128CE0: .4byte gAIScriptPtr
_08128CE4:
	adds r0, r2, 0x5
	str r0, [r3]
_08128CE8:
	pop {r0}
	bx r0
	thumb_func_end ContestAICmd_unk_09

	thumb_func_start ContestAICmd_unk_0A
ContestAICmd_unk_0A: @ 8128CEC
	push {lr}
	bl ContestAICmd_get_excitement
	ldr r0, _08128D1C @ =gSharedMem + 0x192E4
	movs r1, 0x18
	ldrsh r0, [r0, r1]
	ldr r3, _08128D20 @ =gAIScriptPtr
	ldr r2, [r3]
	ldrb r1, [r2]
	cmp r0, r1
	beq _08128D24
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
	b _08128D28
	.align 2, 0
_08128D1C: .4byte gSharedMem + 0x192E4
_08128D20: .4byte gAIScriptPtr
_08128D24:
	adds r0, r2, 0x5
	str r0, [r3]
_08128D28:
	pop {r0}
	bx r0
	thumb_func_end ContestAICmd_unk_0A

	thumb_func_start ContestAICmd_get_user_order
ContestAICmd_get_user_order: @ 8128D2C
	ldr r1, _08128D48 @ =gSharedMem + 0x192E4
	adds r2, r1, 0
	adds r2, 0x41
	adds r0, r1, 0
	subs r0, 0x14
	ldrb r2, [r2]
	adds r0, r2
	ldrb r0, [r0]
	strh r0, [r1, 0x18]
	ldr r1, _08128D4C @ =gAIScriptPtr
	ldr r0, [r1]
	adds r0, 0x1
	str r0, [r1]
	bx lr
	.align 2, 0
_08128D48: .4byte gSharedMem + 0x192E4
_08128D4C: .4byte gAIScriptPtr
	thumb_func_end ContestAICmd_get_user_order

	thumb_func_start ContestAICmd_unk_0C
ContestAICmd_unk_0C: @ 8128D50
	push {lr}
	bl ContestAICmd_get_user_order
	ldr r0, _08128D80 @ =gSharedMem + 0x192E4
	movs r1, 0x18
	ldrsh r0, [r0, r1]
	ldr r3, _08128D84 @ =gAIScriptPtr
	ldr r2, [r3]
	ldrb r1, [r2]
	cmp r0, r1
	bge _08128D88
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
	b _08128D8C
	.align 2, 0
_08128D80: .4byte gSharedMem + 0x192E4
_08128D84: .4byte gAIScriptPtr
_08128D88:
	adds r0, r2, 0x5
	str r0, [r3]
_08128D8C:
	pop {r0}
	bx r0
	thumb_func_end ContestAICmd_unk_0C

	thumb_func_start ContestAICmd_unk_0D
ContestAICmd_unk_0D: @ 8128D90
	push {lr}
	bl ContestAICmd_get_user_order
	ldr r0, _08128DC0 @ =gSharedMem + 0x192E4
	movs r1, 0x18
	ldrsh r0, [r0, r1]
	ldr r3, _08128DC4 @ =gAIScriptPtr
	ldr r2, [r3]
	ldrb r1, [r2]
	cmp r0, r1
	ble _08128DC8
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
	b _08128DCC
	.align 2, 0
_08128DC0: .4byte gSharedMem + 0x192E4
_08128DC4: .4byte gAIScriptPtr
_08128DC8:
	adds r0, r2, 0x5
	str r0, [r3]
_08128DCC:
	pop {r0}
	bx r0
	thumb_func_end ContestAICmd_unk_0D

	thumb_func_start ContestAICmd_unk_0E
ContestAICmd_unk_0E: @ 8128DD0
	push {lr}
	bl ContestAICmd_get_user_order
	ldr r0, _08128E00 @ =gSharedMem + 0x192E4
	movs r1, 0x18
	ldrsh r0, [r0, r1]
	ldr r3, _08128E04 @ =gAIScriptPtr
	ldr r2, [r3]
	ldrb r1, [r2]
	cmp r0, r1
	bne _08128E08
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
	b _08128E0C
	.align 2, 0
_08128E00: .4byte gSharedMem + 0x192E4
_08128E04: .4byte gAIScriptPtr
_08128E08:
	adds r0, r2, 0x5
	str r0, [r3]
_08128E0C:
	pop {r0}
	bx r0
	thumb_func_end ContestAICmd_unk_0E

	thumb_func_start ContestAICmd_unk_0F
ContestAICmd_unk_0F: @ 8128E10
	push {lr}
	bl ContestAICmd_get_user_order
	ldr r0, _08128E40 @ =gSharedMem + 0x192E4
	movs r1, 0x18
	ldrsh r0, [r0, r1]
	ldr r3, _08128E44 @ =gAIScriptPtr
	ldr r2, [r3]
	ldrb r1, [r2]
	cmp r0, r1
	beq _08128E48
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
	b _08128E4C
	.align 2, 0
_08128E40: .4byte gSharedMem + 0x192E4
_08128E44: .4byte gAIScriptPtr
_08128E48:
	adds r0, r2, 0x5
	str r0, [r3]
_08128E4C:
	pop {r0}
	bx r0
	thumb_func_end ContestAICmd_unk_0F

	thumb_func_start ContestAICmd_get_user_condition_maybe
ContestAICmd_get_user_condition_maybe: @ 8128E50
	push {r4,lr}
	ldr r4, _08128E88 @ =gSharedMem + 0x192E4
	adds r0, r4, 0
	adds r0, 0x41
	ldrb r1, [r0]
	lsls r0, r1, 3
	subs r0, r1
	lsls r0, 2
	adds r1, r4, 0
	subs r1, 0x84
	adds r0, r1
	ldrb r0, [r0, 0xD]
	lsls r0, 24
	asrs r0, 24
	movs r1, 0xA
	bl __divsi3
	lsls r0, 24
	asrs r0, 24
	strh r0, [r4, 0x18]
	ldr r1, _08128E8C @ =gAIScriptPtr
	ldr r0, [r1]
	adds r0, 0x1
	str r0, [r1]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08128E88: .4byte gSharedMem + 0x192E4
_08128E8C: .4byte gAIScriptPtr
	thumb_func_end ContestAICmd_get_user_condition_maybe

	thumb_func_start ContestAICmd_unk_11
ContestAICmd_unk_11: @ 8128E90
	push {lr}
	bl ContestAICmd_get_user_condition_maybe
	ldr r0, _08128EC0 @ =gSharedMem + 0x192E4
	movs r1, 0x18
	ldrsh r0, [r0, r1]
	ldr r3, _08128EC4 @ =gAIScriptPtr
	ldr r2, [r3]
	ldrb r1, [r2]
	cmp r0, r1
	bge _08128EC8
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
	b _08128ECC
	.align 2, 0
_08128EC0: .4byte gSharedMem + 0x192E4
_08128EC4: .4byte gAIScriptPtr
_08128EC8:
	adds r0, r2, 0x5
	str r0, [r3]
_08128ECC:
	pop {r0}
	bx r0
	thumb_func_end ContestAICmd_unk_11

	thumb_func_start ContestAICmd_unk_12
ContestAICmd_unk_12: @ 8128ED0
	push {lr}
	bl ContestAICmd_get_user_condition_maybe
	ldr r0, _08128F00 @ =gSharedMem + 0x192E4
	movs r1, 0x18
	ldrsh r0, [r0, r1]
	ldr r3, _08128F04 @ =gAIScriptPtr
	ldr r2, [r3]
	ldrb r1, [r2]
	cmp r0, r1
	ble _08128F08
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
	b _08128F0C
	.align 2, 0
_08128F00: .4byte gSharedMem + 0x192E4
_08128F04: .4byte gAIScriptPtr
_08128F08:
	adds r0, r2, 0x5
	str r0, [r3]
_08128F0C:
	pop {r0}
	bx r0
	thumb_func_end ContestAICmd_unk_12

	thumb_func_start ContestAICmd_unk_13
ContestAICmd_unk_13: @ 8128F10
	push {lr}
	bl ContestAICmd_get_user_condition_maybe
	ldr r0, _08128F40 @ =gSharedMem + 0x192E4
	movs r1, 0x18
	ldrsh r0, [r0, r1]
	ldr r3, _08128F44 @ =gAIScriptPtr
	ldr r2, [r3]
	ldrb r1, [r2]
	cmp r0, r1
	bne _08128F48
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
	b _08128F4C
	.align 2, 0
_08128F40: .4byte gSharedMem + 0x192E4
_08128F44: .4byte gAIScriptPtr
_08128F48:
	adds r0, r2, 0x5
	str r0, [r3]
_08128F4C:
	pop {r0}
	bx r0
	thumb_func_end ContestAICmd_unk_13

	thumb_func_start ContestAICmd_unk_14
ContestAICmd_unk_14: @ 8128F50
	push {lr}
	bl ContestAICmd_get_user_condition_maybe
	ldr r0, _08128F80 @ =gSharedMem + 0x192E4
	movs r1, 0x18
	ldrsh r0, [r0, r1]
	ldr r3, _08128F84 @ =gAIScriptPtr
	ldr r2, [r3]
	ldrb r1, [r2]
	cmp r0, r1
	beq _08128F88
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
	b _08128F8C
	.align 2, 0
_08128F80: .4byte gSharedMem + 0x192E4
_08128F84: .4byte gAIScriptPtr
_08128F88:
	adds r0, r2, 0x5
	str r0, [r3]
_08128F8C:
	pop {r0}
	bx r0
	thumb_func_end ContestAICmd_unk_14

	thumb_func_start ContestAICmd_unk_15
ContestAICmd_unk_15: @ 8128F90
	ldr r2, _08128FB4 @ =gSharedMem + 0x192E4
	adds r0, r2, 0
	adds r0, 0x41
	ldrb r1, [r0]
	lsls r0, r1, 3
	subs r0, r1
	lsls r0, 2
	adds r1, r2, 0
	subs r1, 0x84
	adds r0, r1
	ldrh r0, [r0, 0x4]
	strh r0, [r2, 0x18]
	ldr r1, _08128FB8 @ =gAIScriptPtr
	ldr r0, [r1]
	adds r0, 0x1
	str r0, [r1]
	bx lr
	.align 2, 0
_08128FB4: .4byte gSharedMem + 0x192E4
_08128FB8: .4byte gAIScriptPtr
	thumb_func_end ContestAICmd_unk_15

	thumb_func_start ContestAICmd_unk_16
ContestAICmd_unk_16: @ 8128FBC
	push {r4,r5,lr}
	bl ContestAICmd_unk_15
	ldr r2, _08128FF4 @ =gSharedMem + 0x192E4
	ldr r4, _08128FF8 @ =gAIScriptPtr
	ldr r3, [r4]
	ldrb r1, [r3]
	ldrb r0, [r3, 0x1]
	lsls r0, 8
	orrs r1, r0
	movs r5, 0x18
	ldrsh r0, [r2, r5]
	lsls r1, 16
	asrs r1, 16
	cmp r0, r1
	bge _08128FFC
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
	b _08129000
	.align 2, 0
_08128FF4: .4byte gSharedMem + 0x192E4
_08128FF8: .4byte gAIScriptPtr
_08128FFC:
	adds r0, r3, 0x6
	str r0, [r4]
_08129000:
	pop {r4,r5}
	pop {r0}
	bx r0
	thumb_func_end ContestAICmd_unk_16

	thumb_func_start ContestAICmd_unk_17
ContestAICmd_unk_17: @ 8129008
	push {r4,r5,lr}
	bl ContestAICmd_unk_15
	ldr r2, _08129040 @ =gSharedMem + 0x192E4
	ldr r4, _08129044 @ =gAIScriptPtr
	ldr r3, [r4]
	ldrb r1, [r3]
	ldrb r0, [r3, 0x1]
	lsls r0, 8
	orrs r1, r0
	movs r5, 0x18
	ldrsh r0, [r2, r5]
	lsls r1, 16
	asrs r1, 16
	cmp r0, r1
	ble _08129048
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
	b _0812904C
	.align 2, 0
_08129040: .4byte gSharedMem + 0x192E4
_08129044: .4byte gAIScriptPtr
_08129048:
	adds r0, r3, 0x6
	str r0, [r4]
_0812904C:
	pop {r4,r5}
	pop {r0}
	bx r0
	thumb_func_end ContestAICmd_unk_17

	thumb_func_start ContestAICmd_unk_18
ContestAICmd_unk_18: @ 8129054
	push {r4,r5,lr}
	bl ContestAICmd_unk_15
	ldr r2, _0812908C @ =gSharedMem + 0x192E4
	ldr r4, _08129090 @ =gAIScriptPtr
	ldr r3, [r4]
	ldrb r1, [r3]
	ldrb r0, [r3, 0x1]
	lsls r0, 8
	orrs r1, r0
	movs r5, 0x18
	ldrsh r0, [r2, r5]
	lsls r1, 16
	asrs r1, 16
	cmp r0, r1
	bne _08129094
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
	b _08129098
	.align 2, 0
_0812908C: .4byte gSharedMem + 0x192E4
_08129090: .4byte gAIScriptPtr
_08129094:
	adds r0, r3, 0x6
	str r0, [r4]
_08129098:
	pop {r4,r5}
	pop {r0}
	bx r0
	thumb_func_end ContestAICmd_unk_18

	thumb_func_start ContestAICmd_unk_19
ContestAICmd_unk_19: @ 81290A0
	push {r4,r5,lr}
	bl ContestAICmd_unk_15
	ldr r2, _081290D8 @ =gSharedMem + 0x192E4
	ldr r4, _081290DC @ =gAIScriptPtr
	ldr r3, [r4]
	ldrb r1, [r3]
	ldrb r0, [r3, 0x1]
	lsls r0, 8
	orrs r1, r0
	movs r5, 0x18
	ldrsh r0, [r2, r5]
	lsls r1, 16
	asrs r1, 16
	cmp r0, r1
	beq _081290E0
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
	b _081290E4
	.align 2, 0
_081290D8: .4byte gSharedMem + 0x192E4
_081290DC: .4byte gAIScriptPtr
_081290E0:
	adds r0, r3, 0x6
	str r0, [r4]
_081290E4:
	pop {r4,r5}
	pop {r0}
	bx r0
	thumb_func_end ContestAICmd_unk_19

	thumb_func_start ContestAICmd_unk_1A
ContestAICmd_unk_1A: @ 81290EC
	ldr r2, _08129108 @ =gSharedMem + 0x192E4
	ldr r1, _0812910C @ =gUnknown_02038670
	adds r0, r2, 0
	adds r0, 0x41
	ldrb r0, [r0]
	lsls r0, 1
	adds r0, r1
	ldrh r0, [r0]
	strh r0, [r2, 0x18]
	ldr r1, _08129110 @ =gAIScriptPtr
	ldr r0, [r1]
	adds r0, 0x1
	str r0, [r1]
	bx lr
	.align 2, 0
_08129108: .4byte gSharedMem + 0x192E4
_0812910C: .4byte gUnknown_02038670
_08129110: .4byte gAIScriptPtr
	thumb_func_end ContestAICmd_unk_1A

	thumb_func_start ContestAICmd_unk_1B
ContestAICmd_unk_1B: @ 8129114
	push {r4,r5,lr}
	bl ContestAICmd_unk_1A
	ldr r2, _0812914C @ =gSharedMem + 0x192E4
	ldr r4, _08129150 @ =gAIScriptPtr
	ldr r3, [r4]
	ldrb r1, [r3]
	ldrb r0, [r3, 0x1]
	lsls r0, 8
	orrs r1, r0
	movs r5, 0x18
	ldrsh r0, [r2, r5]
	lsls r1, 16
	asrs r1, 16
	cmp r0, r1
	bge _08129154
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
	b _08129158
	.align 2, 0
_0812914C: .4byte gSharedMem + 0x192E4
_08129150: .4byte gAIScriptPtr
_08129154:
	adds r0, r3, 0x6
	str r0, [r4]
_08129158:
	pop {r4,r5}
	pop {r0}
	bx r0
	thumb_func_end ContestAICmd_unk_1B

	thumb_func_start ContestAICmd_unk_1C
ContestAICmd_unk_1C: @ 8129160
	push {r4,r5,lr}
	bl ContestAICmd_unk_1A
	ldr r2, _08129198 @ =gSharedMem + 0x192E4
	ldr r4, _0812919C @ =gAIScriptPtr
	ldr r3, [r4]
	ldrb r1, [r3]
	ldrb r0, [r3, 0x1]
	lsls r0, 8
	orrs r1, r0
	movs r5, 0x18
	ldrsh r0, [r2, r5]
	lsls r1, 16
	asrs r1, 16
	cmp r0, r1
	ble _081291A0
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
	b _081291A4
	.align 2, 0
_08129198: .4byte gSharedMem + 0x192E4
_0812919C: .4byte gAIScriptPtr
_081291A0:
	adds r0, r3, 0x6
	str r0, [r4]
_081291A4:
	pop {r4,r5}
	pop {r0}
	bx r0
	thumb_func_end ContestAICmd_unk_1C

	thumb_func_start ContestAICmd_unk_1D
ContestAICmd_unk_1D: @ 81291AC
	push {r4,r5,lr}
	bl ContestAICmd_unk_1A
	ldr r2, _081291E4 @ =gSharedMem + 0x192E4
	ldr r4, _081291E8 @ =gAIScriptPtr
	ldr r3, [r4]
	ldrb r1, [r3]
	ldrb r0, [r3, 0x1]
	lsls r0, 8
	orrs r1, r0
	movs r5, 0x18
	ldrsh r0, [r2, r5]
	lsls r1, 16
	asrs r1, 16
	cmp r0, r1
	bne _081291EC
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
	b _081291F0
	.align 2, 0
_081291E4: .4byte gSharedMem + 0x192E4
_081291E8: .4byte gAIScriptPtr
_081291EC:
	adds r0, r3, 0x6
	str r0, [r4]
_081291F0:
	pop {r4,r5}
	pop {r0}
	bx r0
	thumb_func_end ContestAICmd_unk_1D

	thumb_func_start ContestAICmd_unk_1E
ContestAICmd_unk_1E: @ 81291F8
	push {r4,r5,lr}
	bl ContestAICmd_unk_1A
	ldr r2, _08129230 @ =gSharedMem + 0x192E4
	ldr r4, _08129234 @ =gAIScriptPtr
	ldr r3, [r4]
	ldrb r1, [r3]
	ldrb r0, [r3, 0x1]
	lsls r0, 8
	orrs r1, r0
	movs r5, 0x18
	ldrsh r0, [r2, r5]
	lsls r1, 16
	asrs r1, 16
	cmp r0, r1
	beq _08129238
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
	b _0812923C
	.align 2, 0
_08129230: .4byte gSharedMem + 0x192E4
_08129234: .4byte gAIScriptPtr
_08129238:
	adds r0, r3, 0x6
	str r0, [r4]
_0812923C:
	pop {r4,r5}
	pop {r0}
	bx r0
	thumb_func_end ContestAICmd_unk_1E

	thumb_func_start ContestAICmd_get_contest_type
ContestAICmd_get_contest_type: @ 8129244
	ldr r1, _08129258 @ =gSharedMem + 0x192E4
	ldr r0, _0812925C @ =gSpecialVar_ContestCategory
	ldrh r0, [r0]
	strh r0, [r1, 0x18]
	ldr r1, _08129260 @ =gAIScriptPtr
	ldr r0, [r1]
	adds r0, 0x1
	str r0, [r1]
	bx lr
	.align 2, 0
_08129258: .4byte gSharedMem + 0x192E4
_0812925C: .4byte gSpecialVar_ContestCategory
_08129260: .4byte gAIScriptPtr
	thumb_func_end ContestAICmd_get_contest_type

	thumb_func_start ContestAICmd_unk_20
ContestAICmd_unk_20: @ 8129264
	push {lr}
	bl ContestAICmd_get_contest_type
	ldr r0, _08129294 @ =gSharedMem + 0x192E4
	movs r1, 0x18
	ldrsh r0, [r0, r1]
	ldr r3, _08129298 @ =gAIScriptPtr
	ldr r2, [r3]
	ldrb r1, [r2]
	cmp r0, r1
	bne _0812929C
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
	b _081292A0
	.align 2, 0
_08129294: .4byte gSharedMem + 0x192E4
_08129298: .4byte gAIScriptPtr
_0812929C:
	adds r0, r2, 0x5
	str r0, [r3]
_081292A0:
	pop {r0}
	bx r0
	thumb_func_end ContestAICmd_unk_20

	thumb_func_start ContestAICmd_unk_21
ContestAICmd_unk_21: @ 81292A4
	push {lr}
	bl ContestAICmd_get_contest_type
	ldr r0, _081292D4 @ =gSharedMem + 0x192E4
	movs r1, 0x18
	ldrsh r0, [r0, r1]
	ldr r3, _081292D8 @ =gAIScriptPtr
	ldr r2, [r3]
	ldrb r1, [r2]
	cmp r0, r1
	beq _081292DC
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
	b _081292E0
	.align 2, 0
_081292D4: .4byte gSharedMem + 0x192E4
_081292D8: .4byte gAIScriptPtr
_081292DC:
	adds r0, r2, 0x5
	str r0, [r3]
_081292E0:
	pop {r0}
	bx r0
	thumb_func_end ContestAICmd_unk_21

	thumb_func_start ContestAICmd_get_move_excitement
ContestAICmd_get_move_excitement: @ 81292E4
	push {r4,lr}
	ldr r2, _08129318 @ =gContestMons
	ldr r4, _0812931C @ =gSharedMem + 0x192E4
	ldrb r1, [r4, 0x4]
	lsls r1, 1
	adds r0, r4, 0
	adds r0, 0x41
	ldrb r0, [r0]
	lsls r0, 6
	adds r1, r0
	adds r2, 0x1E
	adds r1, r2
	ldrh r0, [r1]
	bl contest_get_move_excitement
	lsls r0, 24
	asrs r0, 24
	strh r0, [r4, 0x18]
	ldr r1, _08129320 @ =gAIScriptPtr
	ldr r0, [r1]
	adds r0, 0x1
	str r0, [r1]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08129318: .4byte gContestMons
_0812931C: .4byte gSharedMem + 0x192E4
_08129320: .4byte gAIScriptPtr
	thumb_func_end ContestAICmd_get_move_excitement

	thumb_func_start ContestAICmd_unk_23
ContestAICmd_unk_23: @ 8129324
	push {r4,lr}
	bl ContestAICmd_get_move_excitement
	ldr r0, _08129354 @ =gSharedMem + 0x192E4
	ldr r3, _08129358 @ =gAIScriptPtr
	ldr r2, [r3]
	movs r4, 0x18
	ldrsh r1, [r0, r4]
	movs r0, 0
	ldrsb r0, [r2, r0]
	cmp r1, r0
	bge _0812935C
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
	b _08129360
	.align 2, 0
_08129354: .4byte gSharedMem + 0x192E4
_08129358: .4byte gAIScriptPtr
_0812935C:
	adds r0, r2, 0x5
	str r0, [r3]
_08129360:
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end ContestAICmd_unk_23

	thumb_func_start ContestAICmd_unk_24
ContestAICmd_unk_24: @ 8129368
	push {r4,lr}
	bl ContestAICmd_get_move_excitement
	ldr r0, _08129398 @ =gSharedMem + 0x192E4
	ldr r3, _0812939C @ =gAIScriptPtr
	ldr r2, [r3]
	movs r4, 0x18
	ldrsh r1, [r0, r4]
	movs r0, 0
	ldrsb r0, [r2, r0]
	cmp r1, r0
	ble _081293A0
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
	b _081293A4
	.align 2, 0
_08129398: .4byte gSharedMem + 0x192E4
_0812939C: .4byte gAIScriptPtr
_081293A0:
	adds r0, r2, 0x5
	str r0, [r3]
_081293A4:
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end ContestAICmd_unk_24

	thumb_func_start ContestAICmd_unk_25
ContestAICmd_unk_25: @ 81293AC
	push {r4,lr}
	bl ContestAICmd_get_move_excitement
	ldr r0, _081293DC @ =gSharedMem + 0x192E4
	ldr r3, _081293E0 @ =gAIScriptPtr
	ldr r2, [r3]
	movs r4, 0x18
	ldrsh r1, [r0, r4]
	movs r0, 0
	ldrsb r0, [r2, r0]
	cmp r1, r0
	bne _081293E4
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
	b _081293E8
	.align 2, 0
_081293DC: .4byte gSharedMem + 0x192E4
_081293E0: .4byte gAIScriptPtr
_081293E4:
	adds r0, r2, 0x5
	str r0, [r3]
_081293E8:
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end ContestAICmd_unk_25

	thumb_func_start ContestAICmd_unk_26
ContestAICmd_unk_26: @ 81293F0
	push {r4,lr}
	bl ContestAICmd_get_move_excitement
	ldr r0, _08129420 @ =gSharedMem + 0x192E4
	ldr r3, _08129424 @ =gAIScriptPtr
	ldr r2, [r3]
	movs r4, 0x18
	ldrsh r1, [r0, r4]
	movs r0, 0
	ldrsb r0, [r2, r0]
	cmp r1, r0
	beq _08129428
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
	b _0812942C
	.align 2, 0
_08129420: .4byte gSharedMem + 0x192E4
_08129424: .4byte gAIScriptPtr
_08129428:
	adds r0, r2, 0x5
	str r0, [r3]
_0812942C:
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end ContestAICmd_unk_26

	thumb_func_start ContestAICmd_get_move_effect
ContestAICmd_get_move_effect: @ 8129434
	ldr r2, _08129460 @ =gContestMons
	ldr r3, _08129464 @ =gSharedMem + 0x192E4
	ldrb r1, [r3, 0x4]
	lsls r1, 1
	adds r0, r3, 0
	adds r0, 0x41
	ldrb r0, [r0]
	lsls r0, 6
	adds r1, r0
	adds r2, 0x1E
	adds r1, r2
	ldrh r0, [r1]
	ldr r1, _08129468 @ =gContestMoves
	lsls r0, 3
	adds r0, r1
	ldrb r0, [r0]
	strh r0, [r3, 0x18]
	ldr r1, _0812946C @ =gAIScriptPtr
	ldr r0, [r1]
	adds r0, 0x1
	str r0, [r1]
	bx lr
	.align 2, 0
_08129460: .4byte gContestMons
_08129464: .4byte gSharedMem + 0x192E4
_08129468: .4byte gContestMoves
_0812946C: .4byte gAIScriptPtr
	thumb_func_end ContestAICmd_get_move_effect

	thumb_func_start ContestAICmd_unk_28
ContestAICmd_unk_28: @ 8129470
	push {lr}
	bl ContestAICmd_get_move_effect
	ldr r0, _081294A0 @ =gSharedMem + 0x192E4
	movs r1, 0x18
	ldrsh r0, [r0, r1]
	ldr r3, _081294A4 @ =gAIScriptPtr
	ldr r2, [r3]
	ldrb r1, [r2]
	cmp r0, r1
	bne _081294A8
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
	b _081294AC
	.align 2, 0
_081294A0: .4byte gSharedMem + 0x192E4
_081294A4: .4byte gAIScriptPtr
_081294A8:
	adds r0, r2, 0x5
	str r0, [r3]
_081294AC:
	pop {r0}
	bx r0
	thumb_func_end ContestAICmd_unk_28

	thumb_func_start ContestAICmd_unk_29
ContestAICmd_unk_29: @ 81294B0
	push {lr}
	bl ContestAICmd_get_move_effect
	ldr r0, _081294E0 @ =gSharedMem + 0x192E4
	movs r1, 0x18
	ldrsh r0, [r0, r1]
	ldr r3, _081294E4 @ =gAIScriptPtr
	ldr r2, [r3]
	ldrb r1, [r2]
	cmp r0, r1
	beq _081294E8
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
	b _081294EC
	.align 2, 0
_081294E0: .4byte gSharedMem + 0x192E4
_081294E4: .4byte gAIScriptPtr
_081294E8:
	adds r0, r2, 0x5
	str r0, [r3]
_081294EC:
	pop {r0}
	bx r0
	thumb_func_end ContestAICmd_unk_29

	thumb_func_start ContestAICmd_get_move_effect_type
ContestAICmd_get_move_effect_type: @ 81294F0
	ldr r2, _08129524 @ =gContestMons
	ldr r3, _08129528 @ =gSharedMem + 0x192E4
	ldrb r1, [r3, 0x4]
	lsls r1, 1
	adds r0, r3, 0
	adds r0, 0x41
	ldrb r0, [r0]
	lsls r0, 6
	adds r1, r0
	adds r2, 0x1E
	adds r1, r2
	ldrh r0, [r1]
	ldr r2, _0812952C @ =gContestEffects
	ldr r1, _08129530 @ =gContestMoves
	lsls r0, 3
	adds r0, r1
	ldrb r0, [r0]
	lsls r0, 2
	adds r0, r2
	ldrb r0, [r0]
	strh r0, [r3, 0x18]
	ldr r1, _08129534 @ =gAIScriptPtr
	ldr r0, [r1]
	adds r0, 0x1
	str r0, [r1]
	bx lr
	.align 2, 0
_08129524: .4byte gContestMons
_08129528: .4byte gSharedMem + 0x192E4
_0812952C: .4byte gContestEffects
_08129530: .4byte gContestMoves
_08129534: .4byte gAIScriptPtr
	thumb_func_end ContestAICmd_get_move_effect_type

	thumb_func_start ContestAICmd_unk_2B
ContestAICmd_unk_2B: @ 8129538
	push {lr}
	bl ContestAICmd_get_move_effect_type
	ldr r0, _08129568 @ =gSharedMem + 0x192E4
	movs r1, 0x18
	ldrsh r0, [r0, r1]
	ldr r3, _0812956C @ =gAIScriptPtr
	ldr r2, [r3]
	ldrb r1, [r2]
	cmp r0, r1
	bne _08129570
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
	b _08129574
	.align 2, 0
_08129568: .4byte gSharedMem + 0x192E4
_0812956C: .4byte gAIScriptPtr
_08129570:
	adds r0, r2, 0x5
	str r0, [r3]
_08129574:
	pop {r0}
	bx r0
	thumb_func_end ContestAICmd_unk_2B

	thumb_func_start ContestAICmd_unk_2C
ContestAICmd_unk_2C: @ 8129578
	push {lr}
	bl ContestAICmd_get_move_effect_type
	ldr r0, _081295A8 @ =gSharedMem + 0x192E4
	movs r1, 0x18
	ldrsh r0, [r0, r1]
	ldr r3, _081295AC @ =gAIScriptPtr
	ldr r2, [r3]
	ldrb r1, [r2]
	cmp r0, r1
	beq _081295B0
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
	b _081295B4
	.align 2, 0
_081295A8: .4byte gSharedMem + 0x192E4
_081295AC: .4byte gAIScriptPtr
_081295B0:
	adds r0, r2, 0x5
	str r0, [r3]
_081295B4:
	pop {r0}
	bx r0
	thumb_func_end ContestAICmd_unk_2C

	thumb_func_start ContestAICmd_check_move_has_highest_appeal
ContestAICmd_check_move_has_highest_appeal: @ 81295B8
	push {r4-r7,lr}
	ldr r2, _08129610 @ =gContestMons
	ldr r3, _08129614 @ =gSharedMem + 0x192E4
	ldrb r0, [r3, 0x4]
	lsls r0, 1
	adds r1, r3, 0
	adds r1, 0x41
	ldrb r1, [r1]
	lsls r1, 6
	adds r0, r1
	adds r2, 0x1E
	adds r0, r2
	ldrh r0, [r0]
	ldr r4, _08129618 @ =gContestEffects
	ldr r5, _0812961C @ =gContestMoves
	lsls r0, 3
	adds r0, r5
	ldrb r0, [r0]
	lsls r0, 2
	adds r0, r4
	ldrb r7, [r0, 0x1]
	movs r6, 0
	ldr r0, _08129620 @ =gAIScriptPtr
	mov r12, r0
	adds r1, r2
_081295EA:
	ldrh r0, [r1]
	cmp r0, 0
	beq _08129600
	lsls r0, 3
	adds r0, r5
	ldrb r0, [r0]
	lsls r0, 2
	adds r0, r4
	ldrb r0, [r0, 0x1]
	cmp r7, r0
	bcc _08129608
_08129600:
	adds r1, 0x2
	adds r6, 0x1
	cmp r6, 0x3
	ble _081295EA
_08129608:
	cmp r6, 0x4
	bne _08129624
	movs r0, 0x1
	b _08129626
	.align 2, 0
_08129610: .4byte gContestMons
_08129614: .4byte gSharedMem + 0x192E4
_08129618: .4byte gContestEffects
_0812961C: .4byte gContestMoves
_08129620: .4byte gAIScriptPtr
_08129624:
	movs r0, 0
_08129626:
	strh r0, [r3, 0x18]
	mov r1, r12
	ldr r0, [r1]
	adds r0, 0x1
	str r0, [r1]
	pop {r4-r7}
	pop {r0}
	bx r0
	thumb_func_end ContestAICmd_check_move_has_highest_appeal

	thumb_func_start ContestAICmd_unk_2E
ContestAICmd_unk_2E: @ 8129638
	push {lr}
	bl ContestAICmd_check_move_has_highest_appeal
	ldr r0, _08129664 @ =gSharedMem + 0x192E4
	movs r1, 0x18
	ldrsh r0, [r0, r1]
	cmp r0, 0
	beq _0812966C
	ldr r3, _08129668 @ =gAIScriptPtr
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
	b _08129674
	.align 2, 0
_08129664: .4byte gSharedMem + 0x192E4
_08129668: .4byte gAIScriptPtr
_0812966C:
	ldr r1, _08129678 @ =gAIScriptPtr
	ldr r0, [r1]
	adds r0, 0x4
	str r0, [r1]
_08129674:
	pop {r0}
	bx r0
	.align 2, 0
_08129678: .4byte gAIScriptPtr
	thumb_func_end ContestAICmd_unk_2E

	thumb_func_start ContestAICmd_unk_2F
ContestAICmd_unk_2F: @ 812967C
	push {r4-r7,lr}
	ldr r2, _081296D4 @ =gContestMons
	ldr r3, _081296D8 @ =gSharedMem + 0x192E4
	ldrb r0, [r3, 0x4]
	lsls r0, 1
	adds r1, r3, 0
	adds r1, 0x41
	ldrb r1, [r1]
	lsls r1, 6
	adds r0, r1
	adds r2, 0x1E
	adds r0, r2
	ldrh r0, [r0]
	ldr r4, _081296DC @ =gContestEffects
	ldr r5, _081296E0 @ =gContestMoves
	lsls r0, 3
	adds r0, r5
	ldrb r0, [r0]
	lsls r0, 2
	adds r0, r4
	ldrb r7, [r0, 0x2]
	movs r6, 0
	ldr r0, _081296E4 @ =gAIScriptPtr
	mov r12, r0
	adds r1, r2
_081296AE:
	ldrh r0, [r1]
	cmp r0, 0
	beq _081296C4
	lsls r0, 3
	adds r0, r5
	ldrb r0, [r0]
	lsls r0, 2
	adds r0, r4
	ldrb r0, [r0, 0x2]
	cmp r7, r0
	bcc _081296CC
_081296C4:
	adds r1, 0x2
	adds r6, 0x1
	cmp r6, 0x3
	ble _081296AE
_081296CC:
	cmp r6, 0x4
	bne _081296E8
	movs r0, 0x1
	b _081296EA
	.align 2, 0
_081296D4: .4byte gContestMons
_081296D8: .4byte gSharedMem + 0x192E4
_081296DC: .4byte gContestEffects
_081296E0: .4byte gContestMoves
_081296E4: .4byte gAIScriptPtr
_081296E8:
	movs r0, 0
_081296EA:
	strh r0, [r3, 0x18]
	mov r1, r12
	ldr r0, [r1]
	adds r0, 0x1
	str r0, [r1]
	pop {r4-r7}
	pop {r0}
	bx r0
	thumb_func_end ContestAICmd_unk_2F

	thumb_func_start ContestAICmd_unk_30
ContestAICmd_unk_30: @ 81296FC
	push {lr}
	bl ContestAICmd_unk_2F
	ldr r0, _08129728 @ =gSharedMem + 0x192E4
	movs r1, 0x18
	ldrsh r0, [r0, r1]
	cmp r0, 0
	beq _08129730
	ldr r3, _0812972C @ =gAIScriptPtr
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
	b _08129738
	.align 2, 0
_08129728: .4byte gSharedMem + 0x192E4
_0812972C: .4byte gAIScriptPtr
_08129730:
	ldr r1, _0812973C @ =gAIScriptPtr
	ldr r0, [r1]
	adds r0, 0x5
	str r0, [r1]
_08129738:
	pop {r0}
	bx r0
	.align 2, 0
_0812973C: .4byte gAIScriptPtr
	thumb_func_end ContestAICmd_unk_30

	thumb_func_start ContestAICmd_unk_31
ContestAICmd_unk_31: @ 8129740
	push {r4,lr}
	ldr r2, _08129784 @ =gContestMons
	ldr r4, _08129788 @ =gSharedMem + 0x192E4
	ldrb r1, [r4, 0x4]
	lsls r1, 1
	adds r0, r4, 0
	adds r0, 0x41
	ldrb r0, [r0]
	lsls r0, 6
	adds r1, r0
	adds r2, 0x1E
	adds r1, r2
	ldrh r0, [r1]
	ldr r2, _0812978C @ =gContestEffects
	ldr r1, _08129790 @ =gContestMoves
	lsls r0, 3
	adds r0, r1
	ldrb r0, [r0]
	lsls r0, 2
	adds r0, r2
	ldrb r0, [r0, 0x1]
	movs r1, 0xA
	bl __udivsi3
	lsls r0, 24
	lsrs r0, 24
	strh r0, [r4, 0x18]
	ldr r1, _08129794 @ =gAIScriptPtr
	ldr r0, [r1]
	adds r0, 0x1
	str r0, [r1]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08129784: .4byte gContestMons
_08129788: .4byte gSharedMem + 0x192E4
_0812978C: .4byte gContestEffects
_08129790: .4byte gContestMoves
_08129794: .4byte gAIScriptPtr
	thumb_func_end ContestAICmd_unk_31

	thumb_func_start ContestAICmd_unk_32
ContestAICmd_unk_32: @ 8129798
	push {lr}
	bl ContestAICmd_unk_31
	ldr r0, _081297C8 @ =gSharedMem + 0x192E4
	movs r1, 0x18
	ldrsh r0, [r0, r1]
	ldr r3, _081297CC @ =gAIScriptPtr
	ldr r2, [r3]
	ldrb r1, [r2]
	cmp r0, r1
	bge _081297D0
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
	b _081297D4
	.align 2, 0
_081297C8: .4byte gSharedMem + 0x192E4
_081297CC: .4byte gAIScriptPtr
_081297D0:
	adds r0, r2, 0x5
	str r0, [r3]
_081297D4:
	pop {r0}
	bx r0
	thumb_func_end ContestAICmd_unk_32

	thumb_func_start ContestAICmd_unk_33
ContestAICmd_unk_33: @ 81297D8
	push {lr}
	bl ContestAICmd_unk_31
	ldr r0, _08129808 @ =gSharedMem + 0x192E4
	movs r1, 0x18
	ldrsh r0, [r0, r1]
	ldr r3, _0812980C @ =gAIScriptPtr
	ldr r2, [r3]
	ldrb r1, [r2]
	cmp r0, r1
	ble _08129810
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
	b _08129814
	.align 2, 0
_08129808: .4byte gSharedMem + 0x192E4
_0812980C: .4byte gAIScriptPtr
_08129810:
	adds r0, r2, 0x5
	str r0, [r3]
_08129814:
	pop {r0}
	bx r0
	thumb_func_end ContestAICmd_unk_33

	thumb_func_start ContestAICmd_unk_34
ContestAICmd_unk_34: @ 8129818
	push {lr}
	bl ContestAICmd_unk_31
	ldr r0, _08129848 @ =gSharedMem + 0x192E4
	movs r1, 0x18
	ldrsh r0, [r0, r1]
	ldr r3, _0812984C @ =gAIScriptPtr
	ldr r2, [r3]
	ldrb r1, [r2]
	cmp r0, r1
	bne _08129850
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
	b _08129854
	.align 2, 0
_08129848: .4byte gSharedMem + 0x192E4
_0812984C: .4byte gAIScriptPtr
_08129850:
	adds r0, r2, 0x5
	str r0, [r3]
_08129854:
	pop {r0}
	bx r0
	thumb_func_end ContestAICmd_unk_34

	thumb_func_start ContestAICmd_unk_35
ContestAICmd_unk_35: @ 8129858
	push {lr}
	bl ContestAICmd_unk_31
	ldr r0, _08129888 @ =gSharedMem + 0x192E4
	movs r1, 0x18
	ldrsh r0, [r0, r1]
	ldr r3, _0812988C @ =gAIScriptPtr
	ldr r2, [r3]
	ldrb r1, [r2]
	cmp r0, r1
	beq _08129890
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
	b _08129894
	.align 2, 0
_08129888: .4byte gSharedMem + 0x192E4
_0812988C: .4byte gAIScriptPtr
_08129890:
	adds r0, r2, 0x5
	str r0, [r3]
_08129894:
	pop {r0}
	bx r0
	thumb_func_end ContestAICmd_unk_35

	thumb_func_start ContestAICmd_unk_36
ContestAICmd_unk_36: @ 8129898
	push {r4,lr}
	ldr r2, _081298DC @ =gContestMons
	ldr r4, _081298E0 @ =gSharedMem + 0x192E4
	ldrb r1, [r4, 0x4]
	lsls r1, 1
	adds r0, r4, 0
	adds r0, 0x41
	ldrb r0, [r0]
	lsls r0, 6
	adds r1, r0
	adds r2, 0x1E
	adds r1, r2
	ldrh r0, [r1]
	ldr r2, _081298E4 @ =gContestEffects
	ldr r1, _081298E8 @ =gContestMoves
	lsls r0, 3
	adds r0, r1
	ldrb r0, [r0]
	lsls r0, 2
	adds r0, r2
	ldrb r0, [r0, 0x2]
	movs r1, 0xA
	bl __udivsi3
	lsls r0, 24
	lsrs r0, 24
	strh r0, [r4, 0x18]
	ldr r1, _081298EC @ =gAIScriptPtr
	ldr r0, [r1]
	adds r0, 0x1
	str r0, [r1]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_081298DC: .4byte gContestMons
_081298E0: .4byte gSharedMem + 0x192E4
_081298E4: .4byte gContestEffects
_081298E8: .4byte gContestMoves
_081298EC: .4byte gAIScriptPtr
	thumb_func_end ContestAICmd_unk_36

	thumb_func_start ContestAICmd_unk_37
ContestAICmd_unk_37: @ 81298F0
	push {lr}
	bl ContestAICmd_unk_36
	ldr r0, _08129920 @ =gSharedMem + 0x192E4
	movs r1, 0x18
	ldrsh r0, [r0, r1]
	ldr r3, _08129924 @ =gAIScriptPtr
	ldr r2, [r3]
	ldrb r1, [r2]
	cmp r0, r1
	bge _08129928
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
	b _0812992C
	.align 2, 0
_08129920: .4byte gSharedMem + 0x192E4
_08129924: .4byte gAIScriptPtr
_08129928:
	adds r0, r2, 0x5
	str r0, [r3]
_0812992C:
	pop {r0}
	bx r0
	thumb_func_end ContestAICmd_unk_37

	thumb_func_start ContestAICmd_unk_38
ContestAICmd_unk_38: @ 8129930
	push {lr}
	bl ContestAICmd_unk_36
	ldr r0, _08129960 @ =gSharedMem + 0x192E4
	movs r1, 0x18
	ldrsh r0, [r0, r1]
	ldr r3, _08129964 @ =gAIScriptPtr
	ldr r2, [r3]
	ldrb r1, [r2]
	cmp r0, r1
	ble _08129968
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
	b _0812996C
	.align 2, 0
_08129960: .4byte gSharedMem + 0x192E4
_08129964: .4byte gAIScriptPtr
_08129968:
	adds r0, r2, 0x5
	str r0, [r3]
_0812996C:
	pop {r0}
	bx r0
	thumb_func_end ContestAICmd_unk_38

	thumb_func_start ContestAICmd_unk_39
ContestAICmd_unk_39: @ 8129970
	push {lr}
	bl ContestAICmd_unk_36
	ldr r0, _081299A0 @ =gSharedMem + 0x192E4
	movs r1, 0x18
	ldrsh r0, [r0, r1]
	ldr r3, _081299A4 @ =gAIScriptPtr
	ldr r2, [r3]
	ldrb r1, [r2]
	cmp r0, r1
	bne _081299A8
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
	b _081299AC
	.align 2, 0
_081299A0: .4byte gSharedMem + 0x192E4
_081299A4: .4byte gAIScriptPtr
_081299A8:
	adds r0, r2, 0x5
	str r0, [r3]
_081299AC:
	pop {r0}
	bx r0
	thumb_func_end ContestAICmd_unk_39

	thumb_func_start ContestAICmd_unk_3A
ContestAICmd_unk_3A: @ 81299B0
	push {lr}
	bl ContestAICmd_unk_36
	ldr r0, _081299E0 @ =gSharedMem + 0x192E4
	movs r1, 0x18
	ldrsh r0, [r0, r1]
	ldr r3, _081299E4 @ =gAIScriptPtr
	ldr r2, [r3]
	ldrb r1, [r2]
	cmp r0, r1
	beq _081299E8
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
	b _081299EC
	.align 2, 0
_081299E0: .4byte gSharedMem + 0x192E4
_081299E4: .4byte gAIScriptPtr
_081299E8:
	adds r0, r2, 0x5
	str r0, [r3]
_081299EC:
	pop {r0}
	bx r0
	thumb_func_end ContestAICmd_unk_3A

	thumb_func_start ContestAICmd_get_move_used_count
ContestAICmd_get_move_used_count: @ 81299F0
	push {r4,lr}
	ldr r3, _08129A20 @ =gContestMons
	ldr r4, _08129A24 @ =gSharedMem + 0x192E4
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
	adds r0, r1
	ldrh r1, [r0, 0x8]
	cmp r3, r1
	beq _08129A28
	movs r0, 0
	b _08129A30
	.align 2, 0
_08129A20: .4byte gContestMons
_08129A24: .4byte gSharedMem + 0x192E4
_08129A28:
	ldrb r0, [r0, 0xB]
	lsls r0, 25
	lsrs r0, 29
	adds r0, 0x1
_08129A30:
	strh r0, [r4, 0x18]
	ldr r1, _08129A40 @ =gAIScriptPtr
	ldr r0, [r1]
	adds r0, 0x1
	str r0, [r1]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08129A40: .4byte gAIScriptPtr
	thumb_func_end ContestAICmd_get_move_used_count

	thumb_func_start ContestAICmd_unk_3C
ContestAICmd_unk_3C: @ 8129A44
	push {lr}
	bl ContestAICmd_get_move_used_count
	ldr r0, _08129A74 @ =gSharedMem + 0x192E4
	movs r1, 0x18
	ldrsh r0, [r0, r1]
	ldr r3, _08129A78 @ =gAIScriptPtr
	ldr r2, [r3]
	ldrb r1, [r2]
	cmp r0, r1
	bge _08129A7C
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
	b _08129A80
	.align 2, 0
_08129A74: .4byte gSharedMem + 0x192E4
_08129A78: .4byte gAIScriptPtr
_08129A7C:
	adds r0, r2, 0x5
	str r0, [r3]
_08129A80:
	pop {r0}
	bx r0
	thumb_func_end ContestAICmd_unk_3C

	thumb_func_start ContestAICmd_unk_3D
ContestAICmd_unk_3D: @ 8129A84
	push {lr}
	bl ContestAICmd_get_move_used_count
	ldr r0, _08129AB4 @ =gSharedMem + 0x192E4
	movs r1, 0x18
	ldrsh r0, [r0, r1]
	ldr r3, _08129AB8 @ =gAIScriptPtr
	ldr r2, [r3]
	ldrb r1, [r2]
	cmp r0, r1
	ble _08129ABC
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
	b _08129AC0
	.align 2, 0
_08129AB4: .4byte gSharedMem + 0x192E4
_08129AB8: .4byte gAIScriptPtr
_08129ABC:
	adds r0, r2, 0x5
	str r0, [r3]
_08129AC0:
	pop {r0}
	bx r0
	thumb_func_end ContestAICmd_unk_3D

	thumb_func_start ContestAICmd_unk_3E
ContestAICmd_unk_3E: @ 8129AC4
	push {lr}
	bl ContestAICmd_get_move_used_count
	ldr r0, _08129AF4 @ =gSharedMem + 0x192E4
	movs r1, 0x18
	ldrsh r0, [r0, r1]
	ldr r3, _08129AF8 @ =gAIScriptPtr
	ldr r2, [r3]
	ldrb r1, [r2]
	cmp r0, r1
	bne _08129AFC
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
	b _08129B00
	.align 2, 0
_08129AF4: .4byte gSharedMem + 0x192E4
_08129AF8: .4byte gAIScriptPtr
_08129AFC:
	adds r0, r2, 0x5
	str r0, [r3]
_08129B00:
	pop {r0}
	bx r0
	thumb_func_end ContestAICmd_unk_3E

	thumb_func_start ContestAICmd_unk_3F
ContestAICmd_unk_3F: @ 8129B04
	push {lr}
	bl ContestAICmd_get_move_used_count
	ldr r0, _08129B34 @ =gSharedMem + 0x192E4
	movs r1, 0x18
	ldrsh r0, [r0, r1]
	ldr r3, _08129B38 @ =gAIScriptPtr
	ldr r2, [r3]
	ldrb r1, [r2]
	cmp r0, r1
	beq _08129B3C
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
	b _08129B40
	.align 2, 0
_08129B34: .4byte gSharedMem + 0x192E4
_08129B38: .4byte gAIScriptPtr
_08129B3C:
	adds r0, r2, 0x5
	str r0, [r3]
_08129B40:
	pop {r0}
	bx r0
	thumb_func_end ContestAICmd_unk_3F

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
	bl sub_80AF59C
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
	ldr r6, _0812AD2C @ =gUnknown_0203858E
_0812AD06:
	lsls r0, r4, 1
	ldrb r1, [r7]
	lsls r1, 6
	adds r0, r1
	adds r1, r0, r6
	ldrh r0, [r1]
	cmp r0, 0
	beq _0812AD30
	bl contest_get_move_excitement
	lsls r0, 24
	asrs r0, 24
	cmp r0, 0x1
	bne _0812AD30
	movs r5, 0x1
	b _0812AD36
	.align 2, 0
_0812AD28: .4byte gSharedMem + 0x19325
_0812AD2C: .4byte gUnknown_0203858E
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
