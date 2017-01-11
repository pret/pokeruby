	.include "constants/gba_constants.inc"
	.include "constants/species_constants.inc"
	.include "asm/macros.inc"

	.syntax unified

	.text

	thumb_func_start BattleAICmd_call
BattleAICmd_call: @ 81096DC
	push {r4,lr}
	ldr r4, _08109708 @ =gAIScriptPtr
	ldr r0, [r4]
	adds r0, 0x5
	bl sub_81098C4
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
_08109708: .4byte gAIScriptPtr
	thumb_func_end BattleAICmd_call

	thumb_func_start BattleAICmd_jump
BattleAICmd_jump: @ 810970C
	ldr r3, _08109728 @ =gAIScriptPtr
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
_08109728: .4byte gAIScriptPtr
	thumb_func_end BattleAICmd_jump

	thumb_func_start BattleAICmd_unk_5A
BattleAICmd_unk_5A: @ 810972C
	push {lr}
	bl sub_8109908
	lsls r0, 24
	cmp r0, 0
	bne _08109742
	ldr r2, _08109748 @ =0x02016800
	ldrb r1, [r2, 0x10]
	movs r0, 0x1
	orrs r0, r1
	strb r0, [r2, 0x10]
_08109742:
	pop {r0}
	bx r0
	.align 2, 0
_08109748: .4byte 0x02016800
	thumb_func_end BattleAICmd_unk_5A

	thumb_func_start BattleAICmd_if_level_cond
BattleAICmd_if_level_cond: @ 810974C
	push {r4,r5,lr}
	ldr r5, _08109764 @ =gAIScriptPtr
	ldr r4, [r5]
	ldrb r0, [r4, 0x1]
	cmp r0, 0x1
	beq _081097A0
	cmp r0, 0x1
	bgt _08109768
	cmp r0, 0
	beq _0810976E
	b _0810981C
	.align 2, 0
_08109764: .4byte gAIScriptPtr
_08109768:
	cmp r0, 0x2
	beq _081097D0
	b _0810981C
_0810976E:
	ldr r3, _08109794 @ =gBattleMons
	ldr r0, _08109798 @ =gUnknown_02024C07
	ldrb r0, [r0]
	movs r2, 0x58
	adds r1, r0, 0
	muls r1, r2
	adds r1, r3
	adds r1, 0x2A
	ldr r0, _0810979C @ =gUnknown_02024C08
	ldrb r0, [r0]
	muls r0, r2
	adds r0, r3
	adds r0, 0x2A
	ldrb r1, [r1]
	ldrb r0, [r0]
	cmp r1, r0
	bhi _081097F2
	b _08109818
	.align 2, 0
_08109794: .4byte gBattleMons
_08109798: .4byte gUnknown_02024C07
_0810979C: .4byte gUnknown_02024C08
_081097A0:
	ldr r3, _081097C4 @ =gBattleMons
	ldr r0, _081097C8 @ =gUnknown_02024C07
	ldrb r0, [r0]
	movs r2, 0x58
	adds r1, r0, 0
	muls r1, r2
	adds r1, r3
	adds r1, 0x2A
	ldr r0, _081097CC @ =gUnknown_02024C08
	ldrb r0, [r0]
	muls r0, r2
	adds r0, r3
	adds r0, 0x2A
	ldrb r1, [r1]
	ldrb r0, [r0]
	cmp r1, r0
	bcc _081097F2
	b _08109818
	.align 2, 0
_081097C4: .4byte gBattleMons
_081097C8: .4byte gUnknown_02024C07
_081097CC: .4byte gUnknown_02024C08
_081097D0:
	ldr r3, _0810980C @ =gBattleMons
	ldr r0, _08109810 @ =gUnknown_02024C07
	ldrb r0, [r0]
	movs r2, 0x58
	adds r1, r0, 0
	muls r1, r2
	adds r1, r3
	adds r1, 0x2A
	ldr r0, _08109814 @ =gUnknown_02024C08
	ldrb r0, [r0]
	muls r0, r2
	adds r0, r3
	adds r0, 0x2A
	ldrb r1, [r1]
	ldrb r0, [r0]
	cmp r1, r0
	bne _08109818
_081097F2:
	ldrb r1, [r4, 0x2]
	ldrb r0, [r4, 0x3]
	lsls r0, 8
	orrs r1, r0
	ldrb r0, [r4, 0x4]
	lsls r0, 16
	orrs r1, r0
	ldrb r0, [r4, 0x5]
	lsls r0, 24
	orrs r1, r0
	str r1, [r5]
	b _0810981C
	.align 2, 0
_0810980C: .4byte gBattleMons
_08109810: .4byte gUnknown_02024C07
_08109814: .4byte gUnknown_02024C08
_08109818:
	adds r0, r4, 0x6
	str r0, [r5]
_0810981C:
	pop {r4,r5}
	pop {r0}
	bx r0
	thumb_func_end BattleAICmd_if_level_cond

	thumb_func_start BattleAICmd_if_taunted
BattleAICmd_if_taunted: @ 8109824
	push {lr}
	ldr r2, _08109858 @ =gUnknown_02024CA8
	ldr r0, _0810985C @ =gUnknown_02024C08
	ldrb r1, [r0]
	lsls r0, r1, 3
	subs r0, r1
	lsls r0, 2
	adds r0, r2
	ldrb r0, [r0, 0x13]
	lsls r0, 28
	cmp r0, 0
	beq _08109864
	ldr r3, _08109860 @ =gAIScriptPtr
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
	b _0810986C
	.align 2, 0
_08109858: .4byte gUnknown_02024CA8
_0810985C: .4byte gUnknown_02024C08
_08109860: .4byte gAIScriptPtr
_08109864:
	ldr r1, _08109870 @ =gAIScriptPtr
	ldr r0, [r1]
	adds r0, 0x5
	str r0, [r1]
_0810986C:
	pop {r0}
	bx r0
	.align 2, 0
_08109870: .4byte gAIScriptPtr
	thumb_func_end BattleAICmd_if_taunted

	thumb_func_start BattleAICmd_if_not_taunted
BattleAICmd_if_not_taunted: @ 8109874
	push {lr}
	ldr r2, _081098A8 @ =gUnknown_02024CA8
	ldr r0, _081098AC @ =gUnknown_02024C08
	ldrb r1, [r0]
	lsls r0, r1, 3
	subs r0, r1
	lsls r0, 2
	adds r0, r2
	ldrb r0, [r0, 0x13]
	lsls r0, 28
	cmp r0, 0
	bne _081098B4
	ldr r3, _081098B0 @ =gAIScriptPtr
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
	b _081098BC
	.align 2, 0
_081098A8: .4byte gUnknown_02024CA8
_081098AC: .4byte gUnknown_02024C08
_081098B0: .4byte gAIScriptPtr
_081098B4:
	ldr r1, _081098C0 @ =gAIScriptPtr
	ldr r0, [r1]
	adds r0, 0x5
	str r0, [r1]
_081098BC:
	pop {r0}
	bx r0
	.align 2, 0
_081098C0: .4byte gAIScriptPtr
	thumb_func_end BattleAICmd_if_not_taunted

	thumb_func_start sub_81098C4
sub_81098C4: @ 81098C4
	push {r4,lr}
	ldr r4, _081098E0 @ =0x02016c00
	adds r3, r4, 0
	adds r3, 0x20
	ldrb r1, [r3]
	adds r2, r1, 0x1
	strb r2, [r3]
	lsls r1, 24
	lsrs r1, 22
	adds r1, r4
	str r0, [r1]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_081098E0: .4byte 0x02016c00
	thumb_func_end sub_81098C4

	thumb_func_start unref_sub_81098E4
unref_sub_81098E4: @ 81098E4
	ldr r3, _08109900 @ =0x02016c00
	adds r2, r3, 0
	adds r2, 0x20
	ldrb r0, [r2]
	adds r1, r0, 0x1
	strb r1, [r2]
	lsls r0, 24
	lsrs r0, 22
	adds r0, r3
	ldr r1, _08109904 @ =gAIScriptPtr
	ldr r1, [r1]
	str r1, [r0]
	bx lr
	.align 2, 0
_08109900: .4byte 0x02016c00
_08109904: .4byte gAIScriptPtr
	thumb_func_end unref_sub_81098E4

	thumb_func_start sub_8109908
sub_8109908: @ 8109908
	push {lr}
	ldr r3, _0810991C @ =0x02016c00
	adds r2, r3, 0
	adds r2, 0x20
	ldrb r0, [r2]
	cmp r0, 0
	bne _08109920
	movs r0, 0
	b _08109932
	.align 2, 0
_0810991C: .4byte 0x02016c00
_08109920:
	subs r0, 0x1
	strb r0, [r2]
	ldr r1, _08109938 @ =gAIScriptPtr
	ldrb r0, [r2]
	lsls r0, 2
	adds r0, r3
	ldr r0, [r0]
	str r0, [r1]
	movs r0, 0x1
_08109932:
	pop {r1}
	bx r1
	.align 2, 0
_08109938: .4byte gAIScriptPtr
	thumb_func_end sub_8109908

	.align 2, 0 @ Don't pad with nop.
