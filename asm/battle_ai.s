	.include "constants/gba_constants.inc"
	.include "constants/species_constants.inc"
	.include "asm/macros.inc"

	.syntax unified

	.text

	thumb_func_start sub_81070D4
sub_81070D4: @ 81070D4
	push {r4-r7,lr}
	ldr r2, _08107144 @ =0x02016a00
	movs r3, 0
	ldr r4, _08107148 @ =gUnknown_020239F8
	movs r1, 0
_081070DE:
	adds r0, r2, r3
	strb r1, [r0]
	adds r3, 0x1
	cmp r3, 0x2F
	bls _081070DE
	ldrh r2, [r4]
	movs r0, 0x8
	ands r0, r2
	cmp r0, 0
	beq _08107138
	ldr r5, _0810714C @ =gTrainerBattleOpponent
	ldrh r1, [r5]
	movs r0, 0x80
	lsls r0, 3
	cmp r1, r0
	beq _08107138
	ldr r0, _08107150 @ =0x00000982
	ands r0, r2
	cmp r0, 0
	bne _08107138
	movs r3, 0
	ldr r7, _08107154 @ =gTrainers + 0x10
	ldr r4, _08107158 @ =0x02016a2c
	adds r6, r4, 0
	subs r6, 0x8
_08107110:
	lsls r2, r3, 1
	ldrh r1, [r5]
	lsls r0, r1, 2
	adds r0, r1
	lsls r0, 3
	adds r2, r0
	adds r2, r7
	ldrh r2, [r2]
	cmp r2, 0
	beq _08107132
	ldrb r0, [r4]
	lsls r0, 1
	adds r0, r6
	strh r2, [r0]
	ldrb r0, [r4]
	adds r0, 0x1
	strb r0, [r4]
_08107132:
	adds r3, 0x1
	cmp r3, 0x3
	ble _08107110
_08107138:
	bl sub_810715C
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_08107144: .4byte 0x02016a00
_08107148: .4byte gUnknown_020239F8
_0810714C: .4byte gTrainerBattleOpponent
_08107150: .4byte 0x00000982
_08107154: .4byte gTrainers + 0x10
_08107158: .4byte 0x02016a2c
	thumb_func_end sub_81070D4

	thumb_func_start sub_810715C
sub_810715C: @ 810715C
	push {r4-r7,lr}
	ldr r2, _08107204 @ =0x02016800
	movs r4, 0
	ldr r3, _08107208 @ =gUnknown_02024A60
	movs r1, 0
_08107166:
	adds r0, r2, r4
	strb r1, [r0]
	adds r4, 0x1
	cmp r4, 0x1B
	bls _08107166
	ldr r0, _08107204 @ =0x02016800
	movs r1, 0x64
	movs r4, 0x3
	adds r0, 0x7
_08107178:
	strb r1, [r0]
	subs r0, 0x1
	subs r4, 0x1
	cmp r4, 0
	bge _08107178
	ldrb r0, [r3]
	movs r1, 0
	movs r2, 0xFF
	bl sub_8015A98
	lsls r0, 24
	lsrs r7, r0, 24
	movs r4, 0
	ldr r0, _08107204 @ =0x02016800
	adds r5, r0, 0x4
	ldr r6, _0810720C @ =gBitTable
_08107198:
	ldr r0, [r6]
	ands r0, r7
	cmp r0, 0
	beq _081071A4
	movs r0, 0
	strb r0, [r5]
_081071A4:
	bl Random
	lsls r0, 16
	lsrs r0, 16
	movs r1, 0xF
	ands r0, r1
	movs r1, 0x64
	subs r1, r0
	strb r1, [r5, 0x14]
	adds r5, 0x1
	adds r6, 0x4
	adds r4, 0x1
	cmp r4, 0x3
	ble _08107198
	ldr r0, _08107210 @ =0x02016c00
	adds r0, 0x20
	movs r1, 0
	strb r1, [r0]
	ldr r1, _08107214 @ =gUnknown_02024C07
	ldr r0, _08107208 @ =gUnknown_02024A60
	ldrb r2, [r0]
	strb r2, [r1]
	ldr r0, _08107218 @ =gUnknown_020239F8
	ldrh r1, [r0]
	movs r0, 0x1
	ands r0, r1
	cmp r0, 0
	beq _08107224
	ldr r4, _0810721C @ =gUnknown_02024C08
	bl Random
	movs r5, 0x2
	ands r0, r5
	strb r0, [r4]
	ldr r0, _08107220 @ =gUnknown_02024C0C
	ldrb r1, [r0]
	ldr r2, _0810720C @ =gBitTable
	ldrb r3, [r4]
	lsls r0, r3, 2
	adds r0, r2
	ldr r0, [r0]
	ands r1, r0
	cmp r1, 0
	beq _0810722C
	eors r3, r5
	strb r3, [r4]
	b _0810722C
	.align 2, 0
_08107204: .4byte 0x02016800
_08107208: .4byte gUnknown_02024A60
_0810720C: .4byte gBitTable
_08107210: .4byte 0x02016c00
_08107214: .4byte gUnknown_02024C07
_08107218: .4byte gUnknown_020239F8
_0810721C: .4byte gUnknown_02024C08
_08107220: .4byte gUnknown_02024C0C
_08107224:
	ldr r0, _08107244 @ =gUnknown_02024C08
	movs r1, 0x1
	eors r1, r2
	strb r1, [r0]
_0810722C:
	ldr r0, _08107248 @ =gUnknown_020239F8
	ldrh r1, [r0]
	movs r0, 0x80
	ands r0, r1
	cmp r0, 0
	beq _08107250
	ldr r1, _0810724C @ =0x02016800
	movs r0, 0x80
	lsls r0, 23
	str r0, [r1, 0xC]
	b _08107296
	.align 2, 0
_08107244: .4byte gUnknown_02024C08
_08107248: .4byte gUnknown_020239F8
_0810724C: .4byte 0x02016800
_08107250:
	movs r0, 0x80
	lsls r0, 3
	ands r0, r1
	cmp r0, 0
	beq _08107268
	ldr r1, _08107264 @ =0x02016800
	movs r0, 0x80
	lsls r0, 22
	str r0, [r1, 0xC]
	b _08107296
	.align 2, 0
_08107264: .4byte 0x02016800
_08107268:
	movs r0, 0x10
	ands r0, r1
	cmp r0, 0
	beq _08107280
	ldr r1, _0810727C @ =0x02016800
	movs r0, 0x80
	lsls r0, 24
	str r0, [r1, 0xC]
	b _08107296
	.align 2, 0
_0810727C: .4byte 0x02016800
_08107280:
	ldr r3, _0810729C @ =0x02016800
	ldr r2, _081072A0 @ =gTrainers
	ldr r0, _081072A4 @ =gTrainerBattleOpponent
	ldrh r1, [r0]
	lsls r0, r1, 2
	adds r0, r1
	lsls r0, 3
	adds r2, 0x1C
	adds r0, r2
	ldr r0, [r0]
	str r0, [r3, 0xC]
_08107296:
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_0810729C: .4byte 0x02016800
_081072A0: .4byte gTrainers
_081072A4: .4byte gTrainerBattleOpponent
	thumb_func_end sub_810715C

	thumb_func_start sub_81072A8
sub_81072A8: @ 81072A8
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	sub sp, 0x8
	bl sub_810745C
	ldr r1, _081072F4 @ =0x02016800
	ldr r0, [r1, 0xC]
	cmp r0, 0
	beq _081072E2
	adds r4, r1, 0
	movs r5, 0
_081072C0:
	ldr r0, [r4, 0xC]
	movs r1, 0x1
	ands r0, r1
	cmp r0, 0
	beq _081072D0
	strb r5, [r4]
	bl sub_8107374
_081072D0:
	ldr r1, [r4, 0xC]
	lsrs r1, 1
	str r1, [r4, 0xC]
	ldrb r0, [r4, 0x11]
	adds r0, 0x1
	strb r0, [r4, 0x11]
	strb r5, [r4, 0x1]
	cmp r1, 0
	bne _081072C0
_081072E2:
	ldr r7, _081072F4 @ =0x02016800
	ldrb r1, [r7, 0x10]
	movs r0, 0x2
	ands r0, r1
	cmp r0, 0
	beq _081072F8
	movs r0, 0x4
	b _08107368
	.align 2, 0
_081072F4: .4byte 0x02016800
_081072F8:
	movs r0, 0x4
	ands r0, r1
	lsls r0, 24
	lsrs r2, r0, 24
	cmp r2, 0
	beq _08107308
	movs r0, 0x5
	b _08107368
_08107308:
	movs r5, 0x1
	mov r0, sp
	ldrb r1, [r7, 0x4]
	strb r1, [r0]
	add r0, sp, 0x4
	strb r2, [r0]
	movs r3, 0x1
	mov r8, r0
	mov r4, sp
	mov r6, r8
	adds r2, r7, 0x5
_0810731E:
	ldrb r1, [r4]
	movs r0, 0
	ldrsb r0, [r2, r0]
	cmp r1, r0
	bge _08107330
	movs r5, 0x1
	ldrb r0, [r2]
	strb r0, [r4]
	strb r3, [r6]
_08107330:
	ldrb r1, [r4]
	movs r0, 0
	ldrsb r0, [r2, r0]
	cmp r1, r0
	bne _0810734E
	mov r0, sp
	adds r1, r0, r5
	ldrb r0, [r2]
	strb r0, [r1]
	adds r1, r5, 0
	adds r0, r1, 0x1
	lsls r0, 24
	lsrs r5, r0, 24
	adds r1, r6, r1
	strb r3, [r1]
_0810734E:
	adds r2, 0x1
	adds r3, 0x1
	cmp r3, 0x3
	ble _0810731E
	bl Random
	lsls r0, 16
	lsrs r0, 16
	adds r1, r5, 0
	bl __modsi3
	add r0, r8
	ldrb r0, [r0]
_08107368:
	add sp, 0x8
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r1}
	bx r1
	thumb_func_end sub_81072A8

	thumb_func_start sub_8107374
sub_8107374: @ 8107374
	push {r4-r7,lr}
	ldr r1, _081073D0 @ =0x02016800
	ldrb r0, [r1]
	adds r6, r1, 0
	cmp r0, 0x2
	beq _08107456
	adds r4, r1, 0
	ldr r7, _081073D4 @ =gUnknown_02039238
_08107384:
	ldrb r0, [r4]
	cmp r0, 0x1
	beq _081073E4
	cmp r0, 0x1
	bgt _0810744E
	cmp r0, 0
	bne _0810744E
	ldr r1, _081073D8 @ =BattleAIs
	ldrb r0, [r4, 0x11]
	lsls r0, 2
	adds r0, r1
	ldr r0, [r0]
	str r0, [r7]
	ldr r5, _081073DC @ =gBattleMons
	ldrb r3, [r4, 0x1]
	ldr r0, _081073E0 @ =gUnknown_02024C07
	ldrb r1, [r0]
	movs r0, 0x58
	adds r2, r1, 0
	muls r2, r0
	adds r0, r3, r2
	adds r1, r5, 0
	adds r1, 0x24
	adds r0, r1
	ldrb r0, [r0]
	cmp r0, 0
	beq _081073C6
	lsls r0, r3, 1
	adds r0, r2
	adds r1, r5, 0
	adds r1, 0xC
	adds r0, r1
	ldrh r0, [r0]
_081073C6:
	strh r0, [r4, 0x2]
	ldrb r0, [r4]
	adds r0, 0x1
	strb r0, [r4]
	b _0810744E
	.align 2, 0
_081073D0: .4byte 0x02016800
_081073D4: .4byte gUnknown_02039238
_081073D8: .4byte BattleAIs
_081073DC: .4byte gBattleMons
_081073E0: .4byte gUnknown_02024C07
_081073E4:
	ldrh r1, [r1, 0x2]
	cmp r1, 0
	beq _08107400
	ldr r1, _081073FC @ =gBattleAICmdTable
	ldr r0, [r7]
	ldrb r0, [r0]
	lsls r0, 2
	adds r0, r1
	ldr r0, [r0]
	bl _call_via_r0
	b _08107410
	.align 2, 0
_081073FC: .4byte gBattleAICmdTable
_08107400:
	adds r0, r4, 0x4
	ldrb r2, [r4, 0x1]
	adds r0, r2
	strb r1, [r0]
	ldrb r1, [r4, 0x10]
	movs r0, 0x1
	orrs r0, r1
	strb r0, [r4, 0x10]
_08107410:
	ldr r1, _0810743C @ =0x02016800
	ldrb r2, [r1, 0x10]
	movs r0, 0x1
	ands r0, r2
	adds r6, r1, 0
	cmp r0, 0
	beq _0810744E
	ldrb r0, [r6, 0x1]
	adds r0, 0x1
	strb r0, [r6, 0x1]
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x3
	bhi _08107440
	movs r0, 0x8
	ands r0, r2
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0
	bne _08107440
	strb r0, [r6]
	b _08107446
	.align 2, 0
_0810743C: .4byte 0x02016800
_08107440:
	ldrb r0, [r4]
	adds r0, 0x1
	strb r0, [r4]
_08107446:
	ldrb r1, [r4, 0x10]
	movs r0, 0xFE
	ands r0, r1
	strb r0, [r4, 0x10]
_0810744E:
	adds r1, r6, 0
	ldrb r0, [r1]
	cmp r0, 0x2
	bne _08107384
_08107456:
	pop {r4-r7}
	pop {r0}
	bx r0
	thumb_func_end sub_8107374

	thumb_func_start sub_810745C
sub_810745C: @ 810745C
	push {r4-r6,lr}
	movs r2, 0
	ldr r3, _08107488 @ =gUnknown_02024C08
	ldr r5, _0810748C @ =0x02016a00
	ldr r6, _08107490 @ =gUnknown_02024C34
	adds r4, r3, 0
_08107468:
	lsls r0, r2, 1
	ldrb r1, [r4]
	lsrs r1, 1
	lsls r1, 4
	adds r0, r1
	adds r1, r0, r5
	ldrh r0, [r1]
	cmp r0, 0
	bne _08107494
	ldrb r0, [r3]
	lsls r0, 1
	adds r0, r6
	ldrh r0, [r0]
	strh r0, [r1]
	b _0810749A
	.align 2, 0
_08107488: .4byte gUnknown_02024C08
_0810748C: .4byte 0x02016a00
_08107490: .4byte gUnknown_02024C34
_08107494:
	adds r2, 0x1
	cmp r2, 0x7
	ble _08107468
_0810749A:
	pop {r4-r6}
	pop {r0}
	bx r0
	thumb_func_end sub_810745C

	thumb_func_start unref_sub_81074A0
unref_sub_81074A0: @ 81074A0
	push {lr}
	lsls r0, 24
	ldr r1, _081074C0 @ =0x02016a00
	lsrs r0, 25
	movs r2, 0x7
	lsls r0, 4
	adds r0, r1
	adds r0, 0xE
	movs r1, 0
_081074B2:
	strh r1, [r0]
	subs r0, 0x2
	subs r2, 0x1
	cmp r2, 0
	bge _081074B2
	pop {r0}
	bx r0
	.align 2, 0
_081074C0: .4byte 0x02016a00
	thumb_func_end unref_sub_81074A0

	thumb_func_start sub_81074C4
sub_81074C4: @ 81074C4
	push {r4,r5,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	lsls r1, 24
	lsrs r5, r1, 24
	adds r0, r4, 0
	bl battle_side_get_owner
	lsls r0, 24
	cmp r0, 0
	bne _081074EC
	adds r0, r4, 0
	bl battle_get_per_side_status
	ldr r2, _081074F4 @ =0x02016a00
	movs r1, 0x1
	ands r1, r0
	adds r2, 0x20
	adds r1, r2
	strb r5, [r1]
_081074EC:
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_081074F4: .4byte 0x02016a00
	thumb_func_end sub_81074C4

	thumb_func_start sub_81074F8
sub_81074F8: @ 81074F8
	push {r4,r5,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	lsls r1, 24
	lsrs r5, r1, 24
	adds r0, r4, 0
	bl battle_side_get_owner
	lsls r0, 24
	cmp r0, 0
	bne _08107520
	adds r0, r4, 0
	bl battle_get_per_side_status
	ldr r2, _08107528 @ =0x02016a00
	movs r1, 0x1
	ands r1, r0
	adds r2, 0x22
	adds r1, r2
	strb r5, [r1]
_08107520:
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_08107528: .4byte 0x02016a00
	thumb_func_end sub_81074F8

	thumb_func_start BattleAICmd_if_random
BattleAICmd_if_random: @ 810752C
	push {lr}
	bl Random
	lsls r0, 16
	movs r1, 0xFF
	lsls r1, 16
	ldr r3, _08107560 @ =gUnknown_02039238
	ldr r2, [r3]
	ands r1, r0
	lsrs r1, 16
	ldrb r0, [r2, 0x1]
	cmp r1, r0
	bcs _08107564
	ldrb r1, [r2, 0x2]
	ldrb r0, [r2, 0x3]
	lsls r0, 8
	orrs r1, r0
	ldrb r0, [r2, 0x4]
	lsls r0, 16
	orrs r1, r0
	ldrb r0, [r2, 0x5]
	lsls r0, 24
	orrs r1, r0
	str r1, [r3]
	b _08107568
	.align 2, 0
_08107560: .4byte gUnknown_02039238
_08107564:
	adds r0, r2, 0x6
	str r0, [r3]
_08107568:
	pop {r0}
	bx r0
	thumb_func_end BattleAICmd_if_random

	thumb_func_start BattleAICmd_if_not_random
BattleAICmd_if_not_random: @ 810756C
	push {lr}
	bl Random
	lsls r0, 16
	movs r1, 0xFF
	lsls r1, 16
	ldr r3, _081075A0 @ =gUnknown_02039238
	ldr r2, [r3]
	ands r1, r0
	lsrs r1, 16
	ldrb r0, [r2, 0x1]
	cmp r1, r0
	bls _081075A4
	ldrb r1, [r2, 0x2]
	ldrb r0, [r2, 0x3]
	lsls r0, 8
	orrs r1, r0
	ldrb r0, [r2, 0x4]
	lsls r0, 16
	orrs r1, r0
	ldrb r0, [r2, 0x5]
	lsls r0, 24
	orrs r1, r0
	str r1, [r3]
	b _081075A8
	.align 2, 0
_081075A0: .4byte gUnknown_02039238
_081075A4:
	adds r0, r2, 0x6
	str r0, [r3]
_081075A8:
	pop {r0}
	bx r0
	thumb_func_end BattleAICmd_if_not_random

	thumb_func_start BattleAICmd_if_random_1
BattleAICmd_if_random_1: @ 81075AC
	push {lr}
	bl Random
	lsls r0, 16
	movs r1, 0xFF
	lsls r1, 16
	ldr r3, _081075E0 @ =gUnknown_02039238
	ldr r2, [r3]
	ands r1, r0
	lsrs r1, 16
	ldrb r0, [r2, 0x1]
	cmp r1, r0
	bne _081075E4
	ldrb r1, [r2, 0x2]
	ldrb r0, [r2, 0x3]
	lsls r0, 8
	orrs r1, r0
	ldrb r0, [r2, 0x4]
	lsls r0, 16
	orrs r1, r0
	ldrb r0, [r2, 0x5]
	lsls r0, 24
	orrs r1, r0
	str r1, [r3]
	b _081075E8
	.align 2, 0
_081075E0: .4byte gUnknown_02039238
_081075E4:
	adds r0, r2, 0x6
	str r0, [r3]
_081075E8:
	pop {r0}
	bx r0
	thumb_func_end BattleAICmd_if_random_1

	thumb_func_start BattleAICmd_if_not_random_1
BattleAICmd_if_not_random_1: @ 81075EC
	push {lr}
	bl Random
	lsls r0, 16
	movs r1, 0xFF
	lsls r1, 16
	ldr r3, _08107620 @ =gUnknown_02039238
	ldr r2, [r3]
	ands r1, r0
	lsrs r1, 16
	ldrb r0, [r2, 0x1]
	cmp r1, r0
	beq _08107624
	ldrb r1, [r2, 0x2]
	ldrb r0, [r2, 0x3]
	lsls r0, 8
	orrs r1, r0
	ldrb r0, [r2, 0x4]
	lsls r0, 16
	orrs r1, r0
	ldrb r0, [r2, 0x5]
	lsls r0, 24
	orrs r1, r0
	str r1, [r3]
	b _08107628
	.align 2, 0
_08107620: .4byte gUnknown_02039238
_08107624:
	adds r0, r2, 0x6
	str r0, [r3]
_08107628:
	pop {r0}
	bx r0
	thumb_func_end BattleAICmd_if_not_random_1

	thumb_func_start BattleAICmd_score
BattleAICmd_score: @ 810762C
	push {r4,r5,lr}
	ldr r2, _08107660 @ =0x02016800
	ldrb r1, [r2, 0x1]
	adds r3, r2, 0x4
	adds r1, r3
	ldr r4, _08107664 @ =gUnknown_02039238
	ldr r0, [r4]
	ldrb r0, [r0, 0x1]
	ldrb r5, [r1]
	adds r0, r5
	strb r0, [r1]
	ldrb r0, [r2, 0x1]
	adds r1, r0, r3
	movs r0, 0
	ldrsb r0, [r1, r0]
	cmp r0, 0
	bge _08107652
	movs r0, 0
	strb r0, [r1]
_08107652:
	ldr r0, [r4]
	adds r0, 0x2
	str r0, [r4]
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_08107660: .4byte 0x02016800
_08107664: .4byte gUnknown_02039238
	thumb_func_end BattleAICmd_score

	thumb_func_start BattleAICmd_if_hp_less_than
BattleAICmd_if_hp_less_than: @ 8107668
	push {r4,lr}
	ldr r0, _0810767C @ =gUnknown_02039238
	ldr r1, [r0]
	ldrb r1, [r1, 0x1]
	adds r4, r0, 0
	cmp r1, 0x1
	bne _08107684
	ldr r0, _08107680 @ =gUnknown_02024C07
	b _08107686
	.align 2, 0
_0810767C: .4byte gUnknown_02039238
_08107680: .4byte gUnknown_02024C07
_08107684:
	ldr r0, _081076BC @ =gUnknown_02024C08
_08107686:
	ldrb r1, [r0]
	ldr r2, _081076C0 @ =gBattleMons
	movs r0, 0x58
	muls r1, r0
	adds r1, r2
	ldrh r2, [r1, 0x28]
	movs r0, 0x64
	muls r0, r2
	ldrh r1, [r1, 0x2C]
	bl __divsi3
	ldr r2, [r4]
	ldrb r1, [r2, 0x2]
	cmp r0, r1
	bcs _081076C4
	ldrb r1, [r2, 0x3]
	ldrb r0, [r2, 0x4]
	lsls r0, 8
	orrs r1, r0
	ldrb r0, [r2, 0x5]
	lsls r0, 16
	orrs r1, r0
	ldrb r0, [r2, 0x6]
	lsls r0, 24
	orrs r1, r0
	str r1, [r4]
	b _081076C8
	.align 2, 0
_081076BC: .4byte gUnknown_02024C08
_081076C0: .4byte gBattleMons
_081076C4:
	adds r0, r2, 0x7
	str r0, [r4]
_081076C8:
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end BattleAICmd_if_hp_less_than

	thumb_func_start BattleAICmd_if_hp_more_than
BattleAICmd_if_hp_more_than: @ 81076D0
	push {r4,lr}
	ldr r0, _081076E4 @ =gUnknown_02039238
	ldr r1, [r0]
	ldrb r1, [r1, 0x1]
	adds r4, r0, 0
	cmp r1, 0x1
	bne _081076EC
	ldr r0, _081076E8 @ =gUnknown_02024C07
	b _081076EE
	.align 2, 0
_081076E4: .4byte gUnknown_02039238
_081076E8: .4byte gUnknown_02024C07
_081076EC:
	ldr r0, _08107724 @ =gUnknown_02024C08
_081076EE:
	ldrb r1, [r0]
	ldr r2, _08107728 @ =gBattleMons
	movs r0, 0x58
	muls r1, r0
	adds r1, r2
	ldrh r2, [r1, 0x28]
	movs r0, 0x64
	muls r0, r2
	ldrh r1, [r1, 0x2C]
	bl __divsi3
	ldr r2, [r4]
	ldrb r1, [r2, 0x2]
	cmp r0, r1
	bls _0810772C
	ldrb r1, [r2, 0x3]
	ldrb r0, [r2, 0x4]
	lsls r0, 8
	orrs r1, r0
	ldrb r0, [r2, 0x5]
	lsls r0, 16
	orrs r1, r0
	ldrb r0, [r2, 0x6]
	lsls r0, 24
	orrs r1, r0
	str r1, [r4]
	b _08107730
	.align 2, 0
_08107724: .4byte gUnknown_02024C08
_08107728: .4byte gBattleMons
_0810772C:
	adds r0, r2, 0x7
	str r0, [r4]
_08107730:
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end BattleAICmd_if_hp_more_than

	thumb_func_start BattleAICmd_if_hp_equal
BattleAICmd_if_hp_equal: @ 8107738
	push {r4,lr}
	ldr r0, _0810774C @ =gUnknown_02039238
	ldr r1, [r0]
	ldrb r1, [r1, 0x1]
	adds r4, r0, 0
	cmp r1, 0x1
	bne _08107754
	ldr r0, _08107750 @ =gUnknown_02024C07
	b _08107756
	.align 2, 0
_0810774C: .4byte gUnknown_02039238
_08107750: .4byte gUnknown_02024C07
_08107754:
	ldr r0, _0810778C @ =gUnknown_02024C08
_08107756:
	ldrb r1, [r0]
	ldr r2, _08107790 @ =gBattleMons
	movs r0, 0x58
	muls r1, r0
	adds r1, r2
	ldrh r2, [r1, 0x28]
	movs r0, 0x64
	muls r0, r2
	ldrh r1, [r1, 0x2C]
	bl __divsi3
	ldr r2, [r4]
	ldrb r1, [r2, 0x2]
	cmp r0, r1
	bne _08107794
	ldrb r1, [r2, 0x3]
	ldrb r0, [r2, 0x4]
	lsls r0, 8
	orrs r1, r0
	ldrb r0, [r2, 0x5]
	lsls r0, 16
	orrs r1, r0
	ldrb r0, [r2, 0x6]
	lsls r0, 24
	orrs r1, r0
	str r1, [r4]
	b _08107798
	.align 2, 0
_0810778C: .4byte gUnknown_02024C08
_08107790: .4byte gBattleMons
_08107794:
	adds r0, r2, 0x7
	str r0, [r4]
_08107798:
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end BattleAICmd_if_hp_equal

	thumb_func_start BattleAICmd_if_hp_not_equal
BattleAICmd_if_hp_not_equal: @ 81077A0
	push {r4,lr}
	ldr r0, _081077B4 @ =gUnknown_02039238
	ldr r1, [r0]
	ldrb r1, [r1, 0x1]
	adds r4, r0, 0
	cmp r1, 0x1
	bne _081077BC
	ldr r0, _081077B8 @ =gUnknown_02024C07
	b _081077BE
	.align 2, 0
_081077B4: .4byte gUnknown_02039238
_081077B8: .4byte gUnknown_02024C07
_081077BC:
	ldr r0, _081077F4 @ =gUnknown_02024C08
_081077BE:
	ldrb r1, [r0]
	ldr r2, _081077F8 @ =gBattleMons
	movs r0, 0x58
	muls r1, r0
	adds r1, r2
	ldrh r2, [r1, 0x28]
	movs r0, 0x64
	muls r0, r2
	ldrh r1, [r1, 0x2C]
	bl __divsi3
	ldr r2, [r4]
	ldrb r1, [r2, 0x2]
	cmp r0, r1
	beq _081077FC
	ldrb r1, [r2, 0x3]
	ldrb r0, [r2, 0x4]
	lsls r0, 8
	orrs r1, r0
	ldrb r0, [r2, 0x5]
	lsls r0, 16
	orrs r1, r0
	ldrb r0, [r2, 0x6]
	lsls r0, 24
	orrs r1, r0
	str r1, [r4]
	b _08107800
	.align 2, 0
_081077F4: .4byte gUnknown_02024C08
_081077F8: .4byte gBattleMons
_081077FC:
	adds r0, r2, 0x7
	str r0, [r4]
_08107800:
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end BattleAICmd_if_hp_not_equal

	thumb_func_start BattleAICmd_if_status
BattleAICmd_if_status: @ 8107808
	push {r4,r5,lr}
	ldr r0, _0810781C @ =gUnknown_02039238
	ldr r1, [r0]
	ldrb r1, [r1, 0x1]
	adds r5, r0, 0
	cmp r1, 0x1
	bne _08107824
	ldr r0, _08107820 @ =gUnknown_02024C07
	b _08107826
	.align 2, 0
_0810781C: .4byte gUnknown_02039238
_08107820: .4byte gUnknown_02024C07
_08107824:
	ldr r0, _08107868 @ =gUnknown_02024C08
_08107826:
	ldrb r4, [r0]
	ldr r3, [r5]
	ldrb r2, [r3, 0x2]
	ldrb r0, [r3, 0x3]
	lsls r0, 8
	orrs r2, r0
	ldrb r0, [r3, 0x4]
	lsls r0, 16
	orrs r2, r0
	ldrb r0, [r3, 0x5]
	lsls r0, 24
	orrs r2, r0
	ldr r1, _0810786C @ =gBattleMons
	movs r0, 0x58
	muls r0, r4
	adds r1, 0x4C
	adds r0, r1
	ldr r0, [r0]
	ands r0, r2
	cmp r0, 0
	beq _08107870
	ldrb r1, [r3, 0x6]
	ldrb r0, [r3, 0x7]
	lsls r0, 8
	orrs r1, r0
	ldrb r0, [r3, 0x8]
	lsls r0, 16
	orrs r1, r0
	ldrb r0, [r3, 0x9]
	lsls r0, 24
	orrs r1, r0
	str r1, [r5]
	b _08107876
	.align 2, 0
_08107868: .4byte gUnknown_02024C08
_0810786C: .4byte gBattleMons
_08107870:
	adds r0, r3, 0
	adds r0, 0xA
	str r0, [r5]
_08107876:
	pop {r4,r5}
	pop {r0}
	bx r0
	thumb_func_end BattleAICmd_if_status

	thumb_func_start BattleAICmd_if_not_status
BattleAICmd_if_not_status: @ 810787C
	push {r4,r5,lr}
	ldr r0, _08107890 @ =gUnknown_02039238
	ldr r1, [r0]
	ldrb r1, [r1, 0x1]
	adds r5, r0, 0
	cmp r1, 0x1
	bne _08107898
	ldr r0, _08107894 @ =gUnknown_02024C07
	b _0810789A
	.align 2, 0
_08107890: .4byte gUnknown_02039238
_08107894: .4byte gUnknown_02024C07
_08107898:
	ldr r0, _081078DC @ =gUnknown_02024C08
_0810789A:
	ldrb r4, [r0]
	ldr r3, [r5]
	ldrb r2, [r3, 0x2]
	ldrb r0, [r3, 0x3]
	lsls r0, 8
	orrs r2, r0
	ldrb r0, [r3, 0x4]
	lsls r0, 16
	orrs r2, r0
	ldrb r0, [r3, 0x5]
	lsls r0, 24
	orrs r2, r0
	ldr r1, _081078E0 @ =gBattleMons
	movs r0, 0x58
	muls r0, r4
	adds r1, 0x4C
	adds r0, r1
	ldr r0, [r0]
	ands r0, r2
	cmp r0, 0
	bne _081078E4
	ldrb r1, [r3, 0x6]
	ldrb r0, [r3, 0x7]
	lsls r0, 8
	orrs r1, r0
	ldrb r0, [r3, 0x8]
	lsls r0, 16
	orrs r1, r0
	ldrb r0, [r3, 0x9]
	lsls r0, 24
	orrs r1, r0
	str r1, [r5]
	b _081078EA
	.align 2, 0
_081078DC: .4byte gUnknown_02024C08
_081078E0: .4byte gBattleMons
_081078E4:
	adds r0, r3, 0
	adds r0, 0xA
	str r0, [r5]
_081078EA:
	pop {r4,r5}
	pop {r0}
	bx r0
	thumb_func_end BattleAICmd_if_not_status

	thumb_func_start BattleAICmd_if_status2
BattleAICmd_if_status2: @ 81078F0
	push {r4,r5,lr}
	ldr r0, _08107904 @ =gUnknown_02039238
	ldr r1, [r0]
	ldrb r1, [r1, 0x1]
	adds r5, r0, 0
	cmp r1, 0x1
	bne _0810790C
	ldr r0, _08107908 @ =gUnknown_02024C07
	b _0810790E
	.align 2, 0
_08107904: .4byte gUnknown_02039238
_08107908: .4byte gUnknown_02024C07
_0810790C:
	ldr r0, _08107950 @ =gUnknown_02024C08
_0810790E:
	ldrb r4, [r0]
	ldr r3, [r5]
	ldrb r2, [r3, 0x2]
	ldrb r0, [r3, 0x3]
	lsls r0, 8
	orrs r2, r0
	ldrb r0, [r3, 0x4]
	lsls r0, 16
	orrs r2, r0
	ldrb r0, [r3, 0x5]
	lsls r0, 24
	orrs r2, r0
	ldr r1, _08107954 @ =gBattleMons
	movs r0, 0x58
	muls r0, r4
	adds r1, 0x50
	adds r0, r1
	ldr r0, [r0]
	ands r0, r2
	cmp r0, 0
	beq _08107958
	ldrb r1, [r3, 0x6]
	ldrb r0, [r3, 0x7]
	lsls r0, 8
	orrs r1, r0
	ldrb r0, [r3, 0x8]
	lsls r0, 16
	orrs r1, r0
	ldrb r0, [r3, 0x9]
	lsls r0, 24
	orrs r1, r0
	str r1, [r5]
	b _0810795E
	.align 2, 0
_08107950: .4byte gUnknown_02024C08
_08107954: .4byte gBattleMons
_08107958:
	adds r0, r3, 0
	adds r0, 0xA
	str r0, [r5]
_0810795E:
	pop {r4,r5}
	pop {r0}
	bx r0
	thumb_func_end BattleAICmd_if_status2

	thumb_func_start BattleAICmd_if_not_status2
BattleAICmd_if_not_status2: @ 8107964
	push {r4,r5,lr}
	ldr r0, _08107978 @ =gUnknown_02039238
	ldr r1, [r0]
	ldrb r1, [r1, 0x1]
	adds r5, r0, 0
	cmp r1, 0x1
	bne _08107980
	ldr r0, _0810797C @ =gUnknown_02024C07
	b _08107982
	.align 2, 0
_08107978: .4byte gUnknown_02039238
_0810797C: .4byte gUnknown_02024C07
_08107980:
	ldr r0, _081079C4 @ =gUnknown_02024C08
_08107982:
	ldrb r4, [r0]
	ldr r3, [r5]
	ldrb r2, [r3, 0x2]
	ldrb r0, [r3, 0x3]
	lsls r0, 8
	orrs r2, r0
	ldrb r0, [r3, 0x4]
	lsls r0, 16
	orrs r2, r0
	ldrb r0, [r3, 0x5]
	lsls r0, 24
	orrs r2, r0
	ldr r1, _081079C8 @ =gBattleMons
	movs r0, 0x58
	muls r0, r4
	adds r1, 0x50
	adds r0, r1
	ldr r0, [r0]
	ands r0, r2
	cmp r0, 0
	bne _081079CC
	ldrb r1, [r3, 0x6]
	ldrb r0, [r3, 0x7]
	lsls r0, 8
	orrs r1, r0
	ldrb r0, [r3, 0x8]
	lsls r0, 16
	orrs r1, r0
	ldrb r0, [r3, 0x9]
	lsls r0, 24
	orrs r1, r0
	str r1, [r5]
	b _081079D2
	.align 2, 0
_081079C4: .4byte gUnknown_02024C08
_081079C8: .4byte gBattleMons
_081079CC:
	adds r0, r3, 0
	adds r0, 0xA
	str r0, [r5]
_081079D2:
	pop {r4,r5}
	pop {r0}
	bx r0
	thumb_func_end BattleAICmd_if_not_status2

	thumb_func_start BattleAICmd_if_status3
BattleAICmd_if_status3: @ 81079D8
	push {r4,r5,lr}
	ldr r0, _081079EC @ =gUnknown_02039238
	ldr r1, [r0]
	ldrb r1, [r1, 0x1]
	adds r5, r0, 0
	cmp r1, 0x1
	bne _081079F4
	ldr r0, _081079F0 @ =gUnknown_02024C07
	b _081079F6
	.align 2, 0
_081079EC: .4byte gUnknown_02039238
_081079F0: .4byte gUnknown_02024C07
_081079F4:
	ldr r0, _08107A34 @ =gUnknown_02024C08
_081079F6:
	ldrb r4, [r0]
	ldr r3, [r5]
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
	ldr r2, _08107A38 @ =gUnknown_02024C98
	lsls r0, r4, 2
	adds r0, r2
	ldr r0, [r0]
	ands r0, r1
	cmp r0, 0
	beq _08107A3C
	ldrb r1, [r3, 0x6]
	ldrb r0, [r3, 0x7]
	lsls r0, 8
	orrs r1, r0
	ldrb r0, [r3, 0x8]
	lsls r0, 16
	orrs r1, r0
	ldrb r0, [r3, 0x9]
	lsls r0, 24
	orrs r1, r0
	str r1, [r5]
	b _08107A42
	.align 2, 0
_08107A34: .4byte gUnknown_02024C08
_08107A38: .4byte gUnknown_02024C98
_08107A3C:
	adds r0, r3, 0
	adds r0, 0xA
	str r0, [r5]
_08107A42:
	pop {r4,r5}
	pop {r0}
	bx r0
	thumb_func_end BattleAICmd_if_status3

	thumb_func_start BattleAICmd_if_not_status3
BattleAICmd_if_not_status3: @ 8107A48
	push {r4,r5,lr}
	ldr r0, _08107A5C @ =gUnknown_02039238
	ldr r1, [r0]
	ldrb r1, [r1, 0x1]
	adds r5, r0, 0
	cmp r1, 0x1
	bne _08107A64
	ldr r0, _08107A60 @ =gUnknown_02024C07
	b _08107A66
	.align 2, 0
_08107A5C: .4byte gUnknown_02039238
_08107A60: .4byte gUnknown_02024C07
_08107A64:
	ldr r0, _08107AA4 @ =gUnknown_02024C08
_08107A66:
	ldrb r4, [r0]
	ldr r3, [r5]
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
	ldr r2, _08107AA8 @ =gUnknown_02024C98
	lsls r0, r4, 2
	adds r0, r2
	ldr r0, [r0]
	ands r0, r1
	cmp r0, 0
	bne _08107AAC
	ldrb r1, [r3, 0x6]
	ldrb r0, [r3, 0x7]
	lsls r0, 8
	orrs r1, r0
	ldrb r0, [r3, 0x8]
	lsls r0, 16
	orrs r1, r0
	ldrb r0, [r3, 0x9]
	lsls r0, 24
	orrs r1, r0
	str r1, [r5]
	b _08107AB2
	.align 2, 0
_08107AA4: .4byte gUnknown_02024C08
_08107AA8: .4byte gUnknown_02024C98
_08107AAC:
	adds r0, r3, 0
	adds r0, 0xA
	str r0, [r5]
_08107AB2:
	pop {r4,r5}
	pop {r0}
	bx r0
	thumb_func_end BattleAICmd_if_not_status3

	thumb_func_start BattleAICmd_if_status4
BattleAICmd_if_status4: @ 8107AB8
	push {r4,lr}
	ldr r0, _08107AC8 @ =gUnknown_02039238
	ldr r0, [r0]
	ldrb r0, [r0, 0x1]
	cmp r0, 0x1
	bne _08107AD0
	ldr r0, _08107ACC @ =gUnknown_02024C07
	b _08107AD2
	.align 2, 0
_08107AC8: .4byte gUnknown_02039238
_08107ACC: .4byte gUnknown_02024C07
_08107AD0:
	ldr r0, _08107B1C @ =gUnknown_02024C08
_08107AD2:
	ldrb r0, [r0]
	bl battle_get_per_side_status
	movs r2, 0x1
	ands r2, r0
	ldr r4, _08107B20 @ =gUnknown_02039238
	ldr r3, [r4]
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
	ldr r0, _08107B24 @ =gUnknown_02024C7A
	lsls r2, 1
	adds r2, r0
	ldrh r0, [r2]
	ands r0, r1
	cmp r0, 0
	beq _08107B28
	ldrb r1, [r3, 0x6]
	ldrb r0, [r3, 0x7]
	lsls r0, 8
	orrs r1, r0
	ldrb r0, [r3, 0x8]
	lsls r0, 16
	orrs r1, r0
	ldrb r0, [r3, 0x9]
	lsls r0, 24
	orrs r1, r0
	str r1, [r4]
	b _08107B2E
	.align 2, 0
_08107B1C: .4byte gUnknown_02024C08
_08107B20: .4byte gUnknown_02039238
_08107B24: .4byte gUnknown_02024C7A
_08107B28:
	adds r0, r3, 0
	adds r0, 0xA
	str r0, [r4]
_08107B2E:
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end BattleAICmd_if_status4

	thumb_func_start BattleAICmd_if_not_status4
BattleAICmd_if_not_status4: @ 8107B34
	push {r4,lr}
	ldr r0, _08107B44 @ =gUnknown_02039238
	ldr r0, [r0]
	ldrb r0, [r0, 0x1]
	cmp r0, 0x1
	bne _08107B4C
	ldr r0, _08107B48 @ =gUnknown_02024C07
	b _08107B4E
	.align 2, 0
_08107B44: .4byte gUnknown_02039238
_08107B48: .4byte gUnknown_02024C07
_08107B4C:
	ldr r0, _08107B98 @ =gUnknown_02024C08
_08107B4E:
	ldrb r0, [r0]
	bl battle_get_per_side_status
	movs r2, 0x1
	ands r2, r0
	ldr r4, _08107B9C @ =gUnknown_02039238
	ldr r3, [r4]
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
	ldr r0, _08107BA0 @ =gUnknown_02024C7A
	lsls r2, 1
	adds r2, r0
	ldrh r0, [r2]
	ands r0, r1
	cmp r0, 0
	bne _08107BA4
	ldrb r1, [r3, 0x6]
	ldrb r0, [r3, 0x7]
	lsls r0, 8
	orrs r1, r0
	ldrb r0, [r3, 0x8]
	lsls r0, 16
	orrs r1, r0
	ldrb r0, [r3, 0x9]
	lsls r0, 24
	orrs r1, r0
	str r1, [r4]
	b _08107BAA
	.align 2, 0
_08107B98: .4byte gUnknown_02024C08
_08107B9C: .4byte gUnknown_02039238
_08107BA0: .4byte gUnknown_02024C7A
_08107BA4:
	adds r0, r3, 0
	adds r0, 0xA
	str r0, [r4]
_08107BAA:
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end BattleAICmd_if_not_status4

	thumb_func_start BattleAICmd_if_less_than
BattleAICmd_if_less_than: @ 8107BB0
	push {lr}
	ldr r0, _08107BD8 @ =0x02016800
	ldr r3, _08107BDC @ =gUnknown_02039238
	ldr r2, [r3]
	ldr r0, [r0, 0x8]
	ldrb r1, [r2, 0x1]
	cmp r0, r1
	bcs _08107BE0
	ldrb r1, [r2, 0x2]
	ldrb r0, [r2, 0x3]
	lsls r0, 8
	orrs r1, r0
	ldrb r0, [r2, 0x4]
	lsls r0, 16
	orrs r1, r0
	ldrb r0, [r2, 0x5]
	lsls r0, 24
	orrs r1, r0
	str r1, [r3]
	b _08107BE4
	.align 2, 0
_08107BD8: .4byte 0x02016800
_08107BDC: .4byte gUnknown_02039238
_08107BE0:
	adds r0, r2, 0x6
	str r0, [r3]
_08107BE4:
	pop {r0}
	bx r0
	thumb_func_end BattleAICmd_if_less_than

	thumb_func_start BattleAICmd_if_more_than
BattleAICmd_if_more_than: @ 8107BE8
	push {lr}
	ldr r0, _08107C10 @ =0x02016800
	ldr r3, _08107C14 @ =gUnknown_02039238
	ldr r2, [r3]
	ldr r0, [r0, 0x8]
	ldrb r1, [r2, 0x1]
	cmp r0, r1
	bls _08107C18
	ldrb r1, [r2, 0x2]
	ldrb r0, [r2, 0x3]
	lsls r0, 8
	orrs r1, r0
	ldrb r0, [r2, 0x4]
	lsls r0, 16
	orrs r1, r0
	ldrb r0, [r2, 0x5]
	lsls r0, 24
	orrs r1, r0
	str r1, [r3]
	b _08107C1C
	.align 2, 0
_08107C10: .4byte 0x02016800
_08107C14: .4byte gUnknown_02039238
_08107C18:
	adds r0, r2, 0x6
	str r0, [r3]
_08107C1C:
	pop {r0}
	bx r0
	thumb_func_end BattleAICmd_if_more_than

	thumb_func_start BattleAICmd_if_equal
BattleAICmd_if_equal: @ 8107C20
	push {lr}
	ldr r0, _08107C48 @ =0x02016800
	ldr r3, _08107C4C @ =gUnknown_02039238
	ldr r2, [r3]
	ldr r0, [r0, 0x8]
	ldrb r1, [r2, 0x1]
	cmp r0, r1
	bne _08107C50
	ldrb r1, [r2, 0x2]
	ldrb r0, [r2, 0x3]
	lsls r0, 8
	orrs r1, r0
	ldrb r0, [r2, 0x4]
	lsls r0, 16
	orrs r1, r0
	ldrb r0, [r2, 0x5]
	lsls r0, 24
	orrs r1, r0
	str r1, [r3]
	b _08107C54
	.align 2, 0
_08107C48: .4byte 0x02016800
_08107C4C: .4byte gUnknown_02039238
_08107C50:
	adds r0, r2, 0x6
	str r0, [r3]
_08107C54:
	pop {r0}
	bx r0
	thumb_func_end BattleAICmd_if_equal

	thumb_func_start BattleAICmd_if_not_equal
BattleAICmd_if_not_equal: @ 8107C58
	push {lr}
	ldr r0, _08107C80 @ =0x02016800
	ldr r3, _08107C84 @ =gUnknown_02039238
	ldr r2, [r3]
	ldr r0, [r0, 0x8]
	ldrb r1, [r2, 0x1]
	cmp r0, r1
	beq _08107C88
	ldrb r1, [r2, 0x2]
	ldrb r0, [r2, 0x3]
	lsls r0, 8
	orrs r1, r0
	ldrb r0, [r2, 0x4]
	lsls r0, 16
	orrs r1, r0
	ldrb r0, [r2, 0x5]
	lsls r0, 24
	orrs r1, r0
	str r1, [r3]
	b _08107C8C
	.align 2, 0
_08107C80: .4byte 0x02016800
_08107C84: .4byte gUnknown_02039238
_08107C88:
	adds r0, r2, 0x6
	str r0, [r3]
_08107C8C:
	pop {r0}
	bx r0
	thumb_func_end BattleAICmd_if_not_equal

	thumb_func_start BattleAICmd_if_less_than_32
BattleAICmd_if_less_than_32: @ 8107C90
	push {lr}
	ldr r3, _08107CCC @ =gUnknown_02039238
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
	ldr r0, _08107CD0 @ =0x02016800
	ldr r0, [r0, 0x8]
	ldrb r1, [r1]
	cmp r0, r1
	bcs _08107CD4
	ldrb r1, [r2, 0x5]
	ldrb r0, [r2, 0x6]
	lsls r0, 8
	orrs r1, r0
	ldrb r0, [r2, 0x7]
	lsls r0, 16
	orrs r1, r0
	ldrb r0, [r2, 0x8]
	lsls r0, 24
	orrs r1, r0
	str r1, [r3]
	b _08107CDA
	.align 2, 0
_08107CCC: .4byte gUnknown_02039238
_08107CD0: .4byte 0x02016800
_08107CD4:
	adds r0, r2, 0
	adds r0, 0x9
	str r0, [r3]
_08107CDA:
	pop {r0}
	bx r0
	thumb_func_end BattleAICmd_if_less_than_32

	thumb_func_start BattleAICmd_if_more_than_32
BattleAICmd_if_more_than_32: @ 8107CE0
	push {lr}
	ldr r3, _08107D1C @ =gUnknown_02039238
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
	ldr r0, _08107D20 @ =0x02016800
	ldr r0, [r0, 0x8]
	ldrb r1, [r1]
	cmp r0, r1
	bls _08107D24
	ldrb r1, [r2, 0x5]
	ldrb r0, [r2, 0x6]
	lsls r0, 8
	orrs r1, r0
	ldrb r0, [r2, 0x7]
	lsls r0, 16
	orrs r1, r0
	ldrb r0, [r2, 0x8]
	lsls r0, 24
	orrs r1, r0
	str r1, [r3]
	b _08107D2A
	.align 2, 0
_08107D1C: .4byte gUnknown_02039238
_08107D20: .4byte 0x02016800
_08107D24:
	adds r0, r2, 0
	adds r0, 0x9
	str r0, [r3]
_08107D2A:
	pop {r0}
	bx r0
	thumb_func_end BattleAICmd_if_more_than_32

	thumb_func_start BattleAICmd_if_equal_32
BattleAICmd_if_equal_32: @ 8107D30
	push {lr}
	ldr r3, _08107D6C @ =gUnknown_02039238
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
	ldr r0, _08107D70 @ =0x02016800
	ldr r0, [r0, 0x8]
	ldrb r1, [r1]
	cmp r0, r1
	bne _08107D74
	ldrb r1, [r2, 0x5]
	ldrb r0, [r2, 0x6]
	lsls r0, 8
	orrs r1, r0
	ldrb r0, [r2, 0x7]
	lsls r0, 16
	orrs r1, r0
	ldrb r0, [r2, 0x8]
	lsls r0, 24
	orrs r1, r0
	str r1, [r3]
	b _08107D7A
	.align 2, 0
_08107D6C: .4byte gUnknown_02039238
_08107D70: .4byte 0x02016800
_08107D74:
	adds r0, r2, 0
	adds r0, 0x9
	str r0, [r3]
_08107D7A:
	pop {r0}
	bx r0
	thumb_func_end BattleAICmd_if_equal_32

	thumb_func_start BattleAICmd_if_not_equal_32
BattleAICmd_if_not_equal_32: @ 8107D80
	push {lr}
	ldr r3, _08107DBC @ =gUnknown_02039238
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
	ldr r0, _08107DC0 @ =0x02016800
	ldr r0, [r0, 0x8]
	ldrb r1, [r1]
	cmp r0, r1
	beq _08107DC4
	ldrb r1, [r2, 0x5]
	ldrb r0, [r2, 0x6]
	lsls r0, 8
	orrs r1, r0
	ldrb r0, [r2, 0x7]
	lsls r0, 16
	orrs r1, r0
	ldrb r0, [r2, 0x8]
	lsls r0, 24
	orrs r1, r0
	str r1, [r3]
	b _08107DCA
	.align 2, 0
_08107DBC: .4byte gUnknown_02039238
_08107DC0: .4byte 0x02016800
_08107DC4:
	adds r0, r2, 0
	adds r0, 0x9
	str r0, [r3]
_08107DCA:
	pop {r0}
	bx r0
	thumb_func_end BattleAICmd_if_not_equal_32

	thumb_func_start BattleAICmd_if_move
BattleAICmd_if_move: @ 8107DD0
	push {lr}
	ldr r3, _08107E00 @ =gUnknown_02039238
	ldr r2, [r3]
	ldrb r1, [r2, 0x1]
	ldrb r0, [r2, 0x2]
	lsls r0, 8
	orrs r1, r0
	ldr r0, _08107E04 @ =0x02016800
	ldrh r0, [r0, 0x2]
	cmp r0, r1
	bne _08107E08
	ldrb r1, [r2, 0x3]
	ldrb r0, [r2, 0x4]
	lsls r0, 8
	orrs r1, r0
	ldrb r0, [r2, 0x5]
	lsls r0, 16
	orrs r1, r0
	ldrb r0, [r2, 0x6]
	lsls r0, 24
	orrs r1, r0
	str r1, [r3]
	b _08107E0C
	.align 2, 0
_08107E00: .4byte gUnknown_02039238
_08107E04: .4byte 0x02016800
_08107E08:
	adds r0, r2, 0x7
	str r0, [r3]
_08107E0C:
	pop {r0}
	bx r0
	thumb_func_end BattleAICmd_if_move

	thumb_func_start BattleAICmd_if_not_move
BattleAICmd_if_not_move: @ 8107E10
	push {lr}
	ldr r3, _08107E40 @ =gUnknown_02039238
	ldr r2, [r3]
	ldrb r1, [r2, 0x1]
	ldrb r0, [r2, 0x2]
	lsls r0, 8
	orrs r1, r0
	ldr r0, _08107E44 @ =0x02016800
	ldrh r0, [r0, 0x2]
	cmp r0, r1
	beq _08107E48
	ldrb r1, [r2, 0x3]
	ldrb r0, [r2, 0x4]
	lsls r0, 8
	orrs r1, r0
	ldrb r0, [r2, 0x5]
	lsls r0, 16
	orrs r1, r0
	ldrb r0, [r2, 0x6]
	lsls r0, 24
	orrs r1, r0
	str r1, [r3]
	b _08107E4C
	.align 2, 0
_08107E40: .4byte gUnknown_02039238
_08107E44: .4byte 0x02016800
_08107E48:
	adds r0, r2, 0x7
	str r0, [r3]
_08107E4C:
	pop {r0}
	bx r0
	thumb_func_end BattleAICmd_if_not_move

	thumb_func_start BattleAICmd_if_in_bytes
BattleAICmd_if_in_bytes: @ 8107E50
	push {r4,lr}
	ldr r2, _08107E98 @ =gUnknown_02039238
	ldr r1, [r2]
	ldrb r3, [r1, 0x1]
	ldrb r0, [r1, 0x2]
	lsls r0, 8
	orrs r3, r0
	ldrb r0, [r1, 0x3]
	lsls r0, 16
	orrs r3, r0
	ldrb r0, [r1, 0x4]
	lsls r0, 24
	orrs r3, r0
	ldrb r0, [r3]
	cmp r0, 0xFF
	beq _08107EA8
	ldr r0, _08107E9C @ =0x02016800
	ldr r1, [r0, 0x8]
	adds r4, r2, 0
_08107E76:
	ldrb r0, [r3]
	cmp r1, r0
	bne _08107EA0
	ldr r2, [r4]
	ldrb r1, [r2, 0x5]
	ldrb r0, [r2, 0x6]
	lsls r0, 8
	orrs r1, r0
	ldrb r0, [r2, 0x7]
	lsls r0, 16
	orrs r1, r0
	ldrb r0, [r2, 0x8]
	lsls r0, 24
	orrs r1, r0
	str r1, [r4]
	b _08107EAE
	.align 2, 0
_08107E98: .4byte gUnknown_02039238
_08107E9C: .4byte 0x02016800
_08107EA0:
	adds r3, 0x1
	ldrb r0, [r3]
	cmp r0, 0xFF
	bne _08107E76
_08107EA8:
	ldr r0, [r2]
	adds r0, 0x9
	str r0, [r2]
_08107EAE:
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end BattleAICmd_if_in_bytes

	thumb_func_start BattleAICmd_if_not_in_bytes
BattleAICmd_if_not_in_bytes: @ 8107EB4
	push {r4,lr}
	ldr r2, _08107EEC @ =gUnknown_02039238
	ldr r1, [r2]
	ldrb r3, [r1, 0x1]
	ldrb r0, [r1, 0x2]
	lsls r0, 8
	orrs r3, r0
	ldrb r0, [r1, 0x3]
	lsls r0, 16
	orrs r3, r0
	ldrb r0, [r1, 0x4]
	lsls r0, 24
	orrs r3, r0
	ldrb r0, [r3]
	adds r4, r2, 0
	cmp r0, 0xFF
	beq _08107EFC
	ldr r0, _08107EF0 @ =0x02016800
	ldr r2, [r0, 0x8]
	adds r1, r4, 0
_08107EDC:
	ldrb r0, [r3]
	cmp r2, r0
	bne _08107EF4
	ldr r0, [r1]
	adds r0, 0x9
	str r0, [r1]
	b _08107F14
	.align 2, 0
_08107EEC: .4byte gUnknown_02039238
_08107EF0: .4byte 0x02016800
_08107EF4:
	adds r3, 0x1
	ldrb r0, [r3]
	cmp r0, 0xFF
	bne _08107EDC
_08107EFC:
	ldr r2, [r4]
	ldrb r1, [r2, 0x5]
	ldrb r0, [r2, 0x6]
	lsls r0, 8
	orrs r1, r0
	ldrb r0, [r2, 0x7]
	lsls r0, 16
	orrs r1, r0
	ldrb r0, [r2, 0x8]
	lsls r0, 24
	orrs r1, r0
	str r1, [r4]
_08107F14:
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end BattleAICmd_if_not_in_bytes

	thumb_func_start BattleAICmd_if_in_words
BattleAICmd_if_in_words: @ 8107F1C
	push {r4,r5,lr}
	ldr r2, _08107F64 @ =gUnknown_02039238
	ldr r1, [r2]
	ldrb r3, [r1, 0x1]
	ldrb r0, [r1, 0x2]
	lsls r0, 8
	orrs r3, r0
	ldrb r0, [r1, 0x3]
	lsls r0, 16
	orrs r3, r0
	ldrb r0, [r1, 0x4]
	lsls r0, 24
	orrs r3, r0
	ldrh r0, [r3]
	ldr r5, _08107F68 @ =0x0000ffff
	cmp r0, r5
	beq _08107F78
	ldr r0, _08107F6C @ =0x02016800
	ldr r1, [r0, 0x8]
	adds r4, r2, 0
_08107F44:
	ldrh r0, [r3]
	cmp r1, r0
	bne _08107F70
	ldr r2, [r4]
	ldrb r1, [r2, 0x5]
	ldrb r0, [r2, 0x6]
	lsls r0, 8
	orrs r1, r0
	ldrb r0, [r2, 0x7]
	lsls r0, 16
	orrs r1, r0
	ldrb r0, [r2, 0x8]
	lsls r0, 24
	orrs r1, r0
	str r1, [r4]
	b _08107F7E
	.align 2, 0
_08107F64: .4byte gUnknown_02039238
_08107F68: .4byte 0x0000ffff
_08107F6C: .4byte 0x02016800
_08107F70:
	adds r3, 0x2
	ldrh r0, [r3]
	cmp r0, r5
	bne _08107F44
_08107F78:
	ldr r0, [r2]
	adds r0, 0x9
	str r0, [r2]
_08107F7E:
	pop {r4,r5}
	pop {r0}
	bx r0
	thumb_func_end BattleAICmd_if_in_words

	thumb_func_start BattleAICmd_if_not_in_words
BattleAICmd_if_not_in_words: @ 8107F84
	push {r4,r5,lr}
	ldr r2, _08107FBC @ =gUnknown_02039238
	ldr r1, [r2]
	ldrb r3, [r1, 0x1]
	ldrb r0, [r1, 0x2]
	lsls r0, 8
	orrs r3, r0
	ldrb r0, [r1, 0x3]
	lsls r0, 16
	orrs r3, r0
	ldrb r0, [r1, 0x4]
	lsls r0, 24
	orrs r3, r0
	ldrh r0, [r3]
	ldr r4, _08107FC0 @ =0x0000ffff
	adds r5, r2, 0
	cmp r0, r4
	beq _08107FD0
	ldr r0, _08107FC4 @ =0x02016800
	ldr r2, [r0, 0x8]
	adds r1, r5, 0
_08107FAE:
	ldrh r0, [r3]
	cmp r2, r0
	bne _08107FC8
	ldr r0, [r1]
	adds r0, 0x9
	str r0, [r1]
	b _08107FE8
	.align 2, 0
_08107FBC: .4byte gUnknown_02039238
_08107FC0: .4byte 0x0000ffff
_08107FC4: .4byte 0x02016800
_08107FC8:
	adds r3, 0x2
	ldrh r0, [r3]
	cmp r0, r4
	bne _08107FAE
_08107FD0:
	ldr r2, [r5]
	ldrb r1, [r2, 0x5]
	ldrb r0, [r2, 0x6]
	lsls r0, 8
	orrs r1, r0
	ldrb r0, [r2, 0x7]
	lsls r0, 16
	orrs r1, r0
	ldrb r0, [r2, 0x8]
	lsls r0, 24
	orrs r1, r0
	str r1, [r5]
_08107FE8:
	pop {r4,r5}
	pop {r0}
	bx r0
	thumb_func_end BattleAICmd_if_not_in_words

	thumb_func_start BattleAICmd_if_user_can_damage
BattleAICmd_if_user_can_damage: @ 8107FF0
	push {r4,r5,lr}
	movs r3, 0
	ldr r4, _08108030 @ =gUnknown_02039238
	ldr r1, _08108034 @ =gBattleMons
	ldr r0, _08108038 @ =gUnknown_02024C07
	ldrb r2, [r0]
	ldr r5, _0810803C @ =gBattleMoves
	movs r0, 0x58
	muls r0, r2
	adds r1, 0xC
	adds r2, r0, r1
_08108006:
	ldrh r0, [r2]
	cmp r0, 0
	beq _0810801A
	lsls r1, r0, 1
	adds r1, r0
	lsls r1, 2
	adds r1, r5
	ldrb r0, [r1, 0x1]
	cmp r0, 0
	bne _08108022
_0810801A:
	adds r2, 0x2
	adds r3, 0x1
	cmp r3, 0x3
	ble _08108006
_08108022:
	cmp r3, 0x4
	bne _08108040
	ldr r0, [r4]
	adds r0, 0x5
	str r0, [r4]
	b _08108058
	.align 2, 0
_08108030: .4byte gUnknown_02039238
_08108034: .4byte gBattleMons
_08108038: .4byte gUnknown_02024C07
_0810803C: .4byte gBattleMoves
_08108040:
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
_08108058:
	pop {r4,r5}
	pop {r0}
	bx r0
	thumb_func_end BattleAICmd_if_user_can_damage

	thumb_func_start BattleAICmd_if_user_cant_damage
BattleAICmd_if_user_cant_damage: @ 8108060
	push {r4,r5,lr}
	movs r3, 0
	ldr r4, _081080A0 @ =gUnknown_02039238
	ldr r1, _081080A4 @ =gBattleMons
	ldr r0, _081080A8 @ =gUnknown_02024C07
	ldrb r2, [r0]
	ldr r5, _081080AC @ =gBattleMoves
	movs r0, 0x58
	muls r0, r2
	adds r1, 0xC
	adds r2, r0, r1
_08108076:
	ldrh r0, [r2]
	cmp r0, 0
	beq _0810808A
	lsls r1, r0, 1
	adds r1, r0
	lsls r1, 2
	adds r1, r5
	ldrb r0, [r1, 0x1]
	cmp r0, 0
	bne _08108092
_0810808A:
	adds r2, 0x2
	adds r3, 0x1
	cmp r3, 0x3
	ble _08108076
_08108092:
	cmp r3, 0x4
	beq _081080B0
	ldr r0, [r4]
	adds r0, 0x5
	str r0, [r4]
	b _081080C8
	.align 2, 0
_081080A0: .4byte gUnknown_02039238
_081080A4: .4byte gBattleMons
_081080A8: .4byte gUnknown_02024C07
_081080AC: .4byte gBattleMoves
_081080B0:
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
_081080C8:
	pop {r4,r5}
	pop {r0}
	bx r0
	thumb_func_end BattleAICmd_if_user_cant_damage

	thumb_func_start BattleAICmd_unk_21
BattleAICmd_unk_21: @ 81080D0
	ldr r1, _081080E4 @ =0x02016800
	ldr r0, _081080E8 @ =gUnknown_030042E0
	ldrb r0, [r0, 0x13]
	str r0, [r1, 0x8]
	ldr r1, _081080EC @ =gUnknown_02039238
	ldr r0, [r1]
	adds r0, 0x1
	str r0, [r1]
	bx lr
	.align 2, 0
_081080E4: .4byte 0x02016800
_081080E8: .4byte gUnknown_030042E0
_081080EC: .4byte gUnknown_02039238
	thumb_func_end BattleAICmd_unk_21

	thumb_func_start BattleAICmd_get_type
BattleAICmd_get_type: @ 81080F0
	push {r4,lr}
	ldr r1, _08108108 @ =gUnknown_02039238
	ldr r0, [r1]
	ldrb r0, [r0, 0x1]
	adds r4, r1, 0
	cmp r0, 0x4
	bhi _081081B6
	lsls r0, 2
	ldr r1, _0810810C @ =_08108110
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_08108108: .4byte gUnknown_02039238
_0810810C: .4byte _08108110
	.align 2, 0
_08108110:
	.4byte _08108144
	.4byte _08108124
	.4byte _08108184
	.4byte _08108164
	.4byte _081081A4
_08108124:
	ldr r3, _08108138 @ =0x02016800
	ldr r2, _0810813C @ =gBattleMons
	ldr r0, _08108140 @ =gUnknown_02024C07
	ldrb r1, [r0]
	movs r0, 0x58
	muls r0, r1
	adds r0, r2
	adds r0, 0x21
	ldrb r0, [r0]
	b _081081B4
	.align 2, 0
_08108138: .4byte 0x02016800
_0810813C: .4byte gBattleMons
_08108140: .4byte gUnknown_02024C07
_08108144:
	ldr r3, _08108158 @ =0x02016800
	ldr r2, _0810815C @ =gBattleMons
	ldr r0, _08108160 @ =gUnknown_02024C08
	ldrb r1, [r0]
	movs r0, 0x58
	muls r0, r1
	adds r0, r2
	adds r0, 0x21
	ldrb r0, [r0]
	b _081081B4
	.align 2, 0
_08108158: .4byte 0x02016800
_0810815C: .4byte gBattleMons
_08108160: .4byte gUnknown_02024C08
_08108164:
	ldr r3, _08108178 @ =0x02016800
	ldr r2, _0810817C @ =gBattleMons
	ldr r0, _08108180 @ =gUnknown_02024C07
	ldrb r1, [r0]
	movs r0, 0x58
	muls r0, r1
	adds r0, r2
	adds r0, 0x22
	ldrb r0, [r0]
	b _081081B4
	.align 2, 0
_08108178: .4byte 0x02016800
_0810817C: .4byte gBattleMons
_08108180: .4byte gUnknown_02024C07
_08108184:
	ldr r3, _08108198 @ =0x02016800
	ldr r2, _0810819C @ =gBattleMons
	ldr r0, _081081A0 @ =gUnknown_02024C08
	ldrb r1, [r0]
	movs r0, 0x58
	muls r0, r1
	adds r0, r2
	adds r0, 0x22
	ldrb r0, [r0]
	b _081081B4
	.align 2, 0
_08108198: .4byte 0x02016800
_0810819C: .4byte gBattleMons
_081081A0: .4byte gUnknown_02024C08
_081081A4:
	ldr r3, _081081C4 @ =0x02016800
	ldr r2, _081081C8 @ =gBattleMoves
	ldrh r1, [r3, 0x2]
	lsls r0, r1, 1
	adds r0, r1
	lsls r0, 2
	adds r0, r2
	ldrb r0, [r0, 0x2]
_081081B4:
	str r0, [r3, 0x8]
_081081B6:
	ldr r0, [r4]
	adds r0, 0x2
	str r0, [r4]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_081081C4: .4byte 0x02016800
_081081C8: .4byte gBattleMoves
	thumb_func_end BattleAICmd_get_type

	thumb_func_start BattleAICmd_unk_23
BattleAICmd_unk_23: @ 81081CC
	ldr r3, _081081E8 @ =0x02016800
	ldr r2, _081081EC @ =gBattleMoves
	ldrh r1, [r3, 0x2]
	lsls r0, r1, 1
	adds r0, r1
	lsls r0, 2
	adds r0, r2
	ldrb r0, [r0, 0x1]
	str r0, [r3, 0x8]
	ldr r1, _081081F0 @ =gUnknown_02039238
	ldr r0, [r1]
	adds r0, 0x1
	str r0, [r1]
	bx lr
	.align 2, 0
_081081E8: .4byte 0x02016800
_081081EC: .4byte gBattleMoves
_081081F0: .4byte gUnknown_02039238
	thumb_func_end BattleAICmd_unk_23

	thumb_func_start BattleAICmd_unk_24
BattleAICmd_unk_24: @ 81081F4
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	sub sp, 0x14
	movs r3, 0
	ldr r0, _08108328 @ =gUnknown_083F62BC
	ldrh r1, [r0]
	ldr r4, _0810832C @ =0x0000ffff
	ldr r6, _08108330 @ =gBattleMoves
	ldr r5, _08108334 @ =0x02016800
	cmp r1, r4
	beq _0810822E
	ldrh r1, [r5, 0x2]
	lsls r0, r1, 1
	adds r0, r1
	lsls r0, 2
	adds r0, r6
	ldrb r2, [r0]
	ldr r1, _08108328 @ =gUnknown_083F62BC
_0810821E:
	ldrh r0, [r1]
	cmp r2, r0
	beq _0810822E
	adds r1, 0x2
	adds r3, 0x1
	ldrh r0, [r1]
	cmp r0, r4
	bne _0810821E
_0810822E:
	ldrh r0, [r5, 0x2]
	lsls r1, r0, 1
	adds r1, r0
	lsls r1, 2
	adds r1, r6
	ldrb r0, [r1, 0x1]
	cmp r0, 0x1
	bhi _08108240
	b _081083B2
_08108240:
	lsls r0, r3, 1
	ldr r1, _08108328 @ =gUnknown_083F62BC
	adds r0, r1
	ldrh r3, [r0]
	ldr r0, _0810832C @ =0x0000ffff
	cmp r3, r0
	beq _08108250
	b _081083B2
_08108250:
	ldr r0, _08108338 @ =gUnknown_02024DEC
	movs r1, 0
	strh r1, [r0]
	ldr r2, _0810833C @ =0xfffff81c
	adds r0, r5, r2
	strb r1, [r0]
	adds r2, 0x3
	adds r0, r5, r2
	movs r2, 0x1
	strb r2, [r0]
	ldr r0, _08108340 @ =gUnknown_02024C68
	strb r1, [r0]
	ldr r0, _08108344 @ =gCritMultiplier
	strb r2, [r0]
	movs r6, 0
	mov r9, r3
	ldr r0, _08108328 @ =gUnknown_083F62BC
	ldrh r0, [r0]
	str r0, [sp, 0x10]
_08108276:
	movs r3, 0
	ldr r5, _08108348 @ =gBattleMons
	lsls r4, r6, 1
	ldr r7, _0810834C @ =gUnknown_02024C07
	lsls r1, r6, 2
	mov r8, r1
	adds r2, r6, 0x1
	mov r10, r2
	ldr r0, [sp, 0x10]
	cmp r0, r9
	beq _081082BA
	ldr r2, _08108330 @ =gBattleMoves
	ldrb r1, [r7]
	movs r0, 0x58
	muls r0, r1
	adds r0, r4, r0
	adds r1, r5, 0
	adds r1, 0xC
	adds r0, r1
	ldrh r1, [r0]
	lsls r0, r1, 1
	adds r0, r1
	lsls r0, 2
	adds r0, r2
	ldrb r2, [r0]
	ldr r1, _08108328 @ =gUnknown_083F62BC
_081082AA:
	ldrh r0, [r1]
	cmp r2, r0
	beq _081082BA
	adds r1, 0x2
	adds r3, 0x1
	ldrh r0, [r1]
	cmp r0, r9
	bne _081082AA
_081082BA:
	ldrb r1, [r7]
	movs r0, 0x58
	muls r0, r1
	adds r0, r4, r0
	adds r1, r5, 0
	adds r1, 0xC
	adds r1, r0, r1
	ldrh r0, [r1]
	cmp r0, 0
	beq _0810835C
	lsls r0, r3, 1
	ldr r2, _08108328 @ =gUnknown_083F62BC
	adds r0, r2
	ldrh r0, [r0]
	cmp r0, r9
	bne _0810835C
	ldr r0, _08108330 @ =gBattleMoves
	ldrh r2, [r1]
	lsls r1, r2, 1
	adds r1, r2
	lsls r1, 2
	adds r1, r0
	ldrb r0, [r1, 0x1]
	cmp r0, 0x1
	bls _0810835C
	ldr r5, _08108350 @ =gUnknown_02024BE6
	strh r2, [r5]
	ldrb r0, [r7]
	ldr r4, _08108354 @ =gUnknown_02024C08
	ldrb r1, [r4]
	bl sub_801CAF8
	ldrh r0, [r5]
	ldrb r1, [r7]
	ldrb r2, [r4]
	bl move_effectiveness_something
	mov r4, sp
	add r4, r8
	ldr r2, _08108358 @ =gUnknown_02024BEC
	ldr r0, _08108334 @ =0x02016800
	adds r0, 0x18
	adds r0, r6, r0
	ldrb r1, [r0]
	ldr r0, [r2]
	muls r0, r1
	movs r1, 0x64
	bl __divsi3
	str r0, [r4]
	cmp r0, 0
	bne _08108364
	movs r0, 0x1
	str r0, [r4]
	b _08108364
	.align 2, 0
_08108328: .4byte gUnknown_083F62BC
_0810832C: .4byte 0x0000ffff
_08108330: .4byte gBattleMoves
_08108334: .4byte 0x02016800
_08108338: .4byte gUnknown_02024DEC
_0810833C: .4byte 0xfffff81c
_08108340: .4byte gUnknown_02024C68
_08108344: .4byte gCritMultiplier
_08108348: .4byte gBattleMons
_0810834C: .4byte gUnknown_02024C07
_08108350: .4byte gUnknown_02024BE6
_08108354: .4byte gUnknown_02024C08
_08108358: .4byte gUnknown_02024BEC
_0810835C:
	mov r1, sp
	add r1, r8
	movs r0, 0
	str r0, [r1]
_08108364:
	mov r6, r10
	cmp r6, 0x3
	ble _08108276
	movs r6, 0
	ldr r1, _081083A4 @ =0x02016800
	ldrb r0, [r1, 0x1]
	lsls r0, 2
	add r0, sp
	ldr r2, [sp]
	ldr r0, [r0]
	adds r5, r1, 0
	ldr r4, _081083A8 @ =gUnknown_02039238
	cmp r2, r0
	bgt _0810839A
	adds r3, r5, 0
	mov r2, sp
_08108384:
	adds r2, 0x4
	adds r6, 0x1
	cmp r6, 0x3
	bgt _0810839A
	ldrb r0, [r3, 0x1]
	lsls r0, 2
	add r0, sp
	ldr r1, [r2]
	ldr r0, [r0]
	cmp r1, r0
	ble _08108384
_0810839A:
	cmp r6, 0x4
	bne _081083AC
	movs r0, 0x2
	str r0, [r5, 0x8]
	b _081083B8
	.align 2, 0
_081083A4: .4byte 0x02016800
_081083A8: .4byte gUnknown_02039238
_081083AC:
	movs r0, 0x1
	str r0, [r5, 0x8]
	b _081083B8
_081083B2:
	movs r0, 0
	str r0, [r5, 0x8]
	ldr r4, _081083D0 @ =gUnknown_02039238
_081083B8:
	ldr r0, [r4]
	adds r0, 0x1
	str r0, [r4]
	add sp, 0x14
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_081083D0: .4byte gUnknown_02039238
	thumb_func_end BattleAICmd_unk_24

	thumb_func_start BattleAICmd_get_move
BattleAICmd_get_move: @ 81083D4
	push {lr}
	ldr r0, _081083EC @ =gUnknown_02039238
	ldr r1, [r0]
	ldrb r1, [r1, 0x1]
	adds r3, r0, 0
	cmp r1, 0x1
	bne _081083FC
	ldr r2, _081083F0 @ =0x02016800
	ldr r1, _081083F4 @ =gUnknown_02024C34
	ldr r0, _081083F8 @ =gUnknown_02024C07
	b _08108402
	.align 2, 0
_081083EC: .4byte gUnknown_02039238
_081083F0: .4byte 0x02016800
_081083F4: .4byte gUnknown_02024C34
_081083F8: .4byte gUnknown_02024C07
_081083FC:
	ldr r2, _08108418 @ =0x02016800
	ldr r1, _0810841C @ =gUnknown_02024C34
	ldr r0, _08108420 @ =gUnknown_02024C08
_08108402:
	ldrb r0, [r0]
	lsls r0, 1
	adds r0, r1
	ldrh r0, [r0]
	str r0, [r2, 0x8]
	ldr r0, [r3]
	adds r0, 0x2
	str r0, [r3]
	pop {r0}
	bx r0
	.align 2, 0
_08108418: .4byte 0x02016800
_0810841C: .4byte gUnknown_02024C34
_08108420: .4byte gUnknown_02024C08
	thumb_func_end BattleAICmd_get_move

	thumb_func_start BattleAICmd_if_type
BattleAICmd_if_type: @ 8108424
	push {lr}
	ldr r3, _0810844C @ =gUnknown_02039238
	ldr r2, [r3]
	ldrb r0, [r2, 0x1]
	ldr r1, _08108450 @ =0x02016800
	ldr r1, [r1, 0x8]
	cmp r0, r1
	bne _08108454
	ldrb r1, [r2, 0x2]
	ldrb r0, [r2, 0x3]
	lsls r0, 8
	orrs r1, r0
	ldrb r0, [r2, 0x4]
	lsls r0, 16
	orrs r1, r0
	ldrb r0, [r2, 0x5]
	lsls r0, 24
	orrs r1, r0
	str r1, [r3]
	b _08108458
	.align 2, 0
_0810844C: .4byte gUnknown_02039238
_08108450: .4byte 0x02016800
_08108454:
	adds r0, r2, 0x6
	str r0, [r3]
_08108458:
	pop {r0}
	bx r0
	thumb_func_end BattleAICmd_if_type

	thumb_func_start BattleAICmd_unk_27
BattleAICmd_unk_27: @ 810845C
	push {lr}
	ldr r3, _08108484 @ =gUnknown_02039238
	ldr r2, [r3]
	ldrb r0, [r2, 0x1]
	ldr r1, _08108488 @ =0x02016800
	ldr r1, [r1, 0x8]
	cmp r0, r1
	beq _0810848C
	ldrb r1, [r2, 0x2]
	ldrb r0, [r2, 0x3]
	lsls r0, 8
	orrs r1, r0
	ldrb r0, [r2, 0x4]
	lsls r0, 16
	orrs r1, r0
	ldrb r0, [r2, 0x5]
	lsls r0, 24
	orrs r1, r0
	str r1, [r3]
	b _08108490
	.align 2, 0
_08108484: .4byte gUnknown_02039238
_08108488: .4byte 0x02016800
_0810848C:
	adds r0, r2, 0x6
	str r0, [r3]
_08108490:
	pop {r0}
	bx r0
	thumb_func_end BattleAICmd_unk_27

	thumb_func_start BattleAICmd_if_would_go_first
BattleAICmd_if_would_go_first: @ 8108494
	push {lr}
	ldr r0, _081084CC @ =gUnknown_02024C07
	ldrb r0, [r0]
	ldr r1, _081084D0 @ =gUnknown_02024C08
	ldrb r1, [r1]
	movs r2, 0x1
	bl b_first_side
	ldr r3, _081084D4 @ =gUnknown_02039238
	ldr r2, [r3]
	lsls r0, 24
	lsrs r0, 24
	ldrb r1, [r2, 0x1]
	cmp r0, r1
	bne _081084D8
	ldrb r1, [r2, 0x2]
	ldrb r0, [r2, 0x3]
	lsls r0, 8
	orrs r1, r0
	ldrb r0, [r2, 0x4]
	lsls r0, 16
	orrs r1, r0
	ldrb r0, [r2, 0x5]
	lsls r0, 24
	orrs r1, r0
	str r1, [r3]
	b _081084DC
	.align 2, 0
_081084CC: .4byte gUnknown_02024C07
_081084D0: .4byte gUnknown_02024C08
_081084D4: .4byte gUnknown_02039238
_081084D8:
	adds r0, r2, 0x6
	str r0, [r3]
_081084DC:
	pop {r0}
	bx r0
	thumb_func_end BattleAICmd_if_would_go_first

	thumb_func_start BattleAICmd_if_would_not_go_first
BattleAICmd_if_would_not_go_first: @ 81084E0
	push {lr}
	ldr r0, _08108518 @ =gUnknown_02024C07
	ldrb r0, [r0]
	ldr r1, _0810851C @ =gUnknown_02024C08
	ldrb r1, [r1]
	movs r2, 0x1
	bl b_first_side
	ldr r3, _08108520 @ =gUnknown_02039238
	ldr r2, [r3]
	lsls r0, 24
	lsrs r0, 24
	ldrb r1, [r2, 0x1]
	cmp r0, r1
	beq _08108524
	ldrb r1, [r2, 0x2]
	ldrb r0, [r2, 0x3]
	lsls r0, 8
	orrs r1, r0
	ldrb r0, [r2, 0x4]
	lsls r0, 16
	orrs r1, r0
	ldrb r0, [r2, 0x5]
	lsls r0, 24
	orrs r1, r0
	str r1, [r3]
	b _08108528
	.align 2, 0
_08108518: .4byte gUnknown_02024C07
_0810851C: .4byte gUnknown_02024C08
_08108520: .4byte gUnknown_02039238
_08108524:
	adds r0, r2, 0x6
	str r0, [r3]
_08108528:
	pop {r0}
	bx r0
	thumb_func_end BattleAICmd_if_would_not_go_first

	thumb_func_start BattleAICmd_unk_2A
BattleAICmd_unk_2A: @ 810852C
	bx lr
	thumb_func_end BattleAICmd_unk_2A

	thumb_func_start BattleAICmd_unk_2B
BattleAICmd_unk_2B: @ 8108530
	bx lr
	thumb_func_end BattleAICmd_unk_2B

	thumb_func_start BattleAICmd_count_alive_pokemon
BattleAICmd_count_alive_pokemon: @ 8108534
	push {r4-r7,lr}
	mov r7, r9
	mov r6, r8
	push {r6,r7}
	ldr r1, _08108550 @ =0x02016800
	movs r0, 0
	str r0, [r1, 0x8]
	ldr r0, _08108554 @ =gUnknown_02039238
	ldr r0, [r0]
	ldrb r0, [r0, 0x1]
	cmp r0, 0x1
	bne _0810855C
	ldr r0, _08108558 @ =gUnknown_02024C07
	b _0810855E
	.align 2, 0
_08108550: .4byte 0x02016800
_08108554: .4byte gUnknown_02039238
_08108558: .4byte gUnknown_02024C07
_0810855C:
	ldr r0, _081085A8 @ =gUnknown_02024C08
_0810855E:
	ldrb r5, [r0]
	adds r0, r5, 0
	bl battle_side_get_owner
	lsls r0, 24
	ldr r1, _081085AC @ =gEnemyParty
	mov r9, r1
	cmp r0, 0
	bne _08108574
	ldr r0, _081085B0 @ =gPlayerParty
	mov r9, r0
_08108574:
	ldr r0, _081085B4 @ =gUnknown_020239F8
	ldrh r1, [r0]
	movs r0, 0x1
	ands r0, r1
	cmp r0, 0
	beq _081085BC
	ldr r4, _081085B8 @ =gUnknown_02024A6A
	lsls r0, r5, 1
	adds r0, r4
	ldrb r0, [r0]
	mov r8, r0
	adds r0, r5, 0
	bl battle_get_per_side_status
	movs r1, 0x2
	eors r0, r1
	lsls r0, 24
	lsrs r0, 24
	bl battle_get_side_with_given_state
	lsls r0, 24
	lsrs r0, 23
	adds r0, r4
	ldrb r6, [r0]
	b _081085C6
	.align 2, 0
_081085A8: .4byte gUnknown_02024C08
_081085AC: .4byte gEnemyParty
_081085B0: .4byte gPlayerParty
_081085B4: .4byte gUnknown_020239F8
_081085B8: .4byte gUnknown_02024A6A
_081085BC:
	ldr r1, _08108624 @ =gUnknown_02024A6A
	lsls r0, r5, 1
	adds r0, r1
	ldrb r6, [r0]
	mov r8, r6
_081085C6:
	movs r5, 0
	ldr r7, _08108628 @ =0x02016800
_081085CA:
	cmp r5, r8
	beq _08108608
	cmp r5, r6
	beq _08108608
	movs r0, 0x64
	muls r0, r5
	mov r1, r9
	adds r4, r1, r0
	adds r0, r4, 0
	movs r1, 0x39
	bl GetMonData
	cmp r0, 0
	beq _08108608
	adds r0, r4, 0
	movs r1, 0x41
	bl GetMonData
	cmp r0, 0
	beq _08108608
	adds r0, r4, 0
	movs r1, 0x41
	bl GetMonData
	movs r1, 0xCE
	lsls r1, 1
	cmp r0, r1
	beq _08108608
	ldr r0, [r7, 0x8]
	adds r0, 0x1
	str r0, [r7, 0x8]
_08108608:
	adds r5, 0x1
	cmp r5, 0x5
	ble _081085CA
	ldr r1, _0810862C @ =gUnknown_02039238
	ldr r0, [r1]
	adds r0, 0x2
	str r0, [r1]
	pop {r3,r4}
	mov r8, r3
	mov r9, r4
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_08108624: .4byte gUnknown_02024A6A
_08108628: .4byte 0x02016800
_0810862C: .4byte gUnknown_02039238
	thumb_func_end BattleAICmd_count_alive_pokemon

	thumb_func_start BattleAICmd_unk_2D
BattleAICmd_unk_2D: @ 8108630
	ldr r1, _08108640 @ =0x02016800
	ldrh r0, [r1, 0x2]
	str r0, [r1, 0x8]
	ldr r1, _08108644 @ =gUnknown_02039238
	ldr r0, [r1]
	adds r0, 0x1
	str r0, [r1]
	bx lr
	.align 2, 0
_08108640: .4byte 0x02016800
_08108644: .4byte gUnknown_02039238
	thumb_func_end BattleAICmd_unk_2D

	thumb_func_start BattleAICmd_unk_2E
BattleAICmd_unk_2E: @ 8108648
	ldr r3, _08108664 @ =0x02016800
	ldr r2, _08108668 @ =gBattleMoves
	ldrh r1, [r3, 0x2]
	lsls r0, r1, 1
	adds r0, r1
	lsls r0, 2
	adds r0, r2
	ldrb r0, [r0]
	str r0, [r3, 0x8]
	ldr r1, _0810866C @ =gUnknown_02039238
	ldr r0, [r1]
	adds r0, 0x1
	str r0, [r1]
	bx lr
	.align 2, 0
_08108664: .4byte 0x02016800
_08108668: .4byte gBattleMoves
_0810866C: .4byte gUnknown_02039238
	thumb_func_end BattleAICmd_unk_2E

	thumb_func_start BattleAICmd_get_ability
BattleAICmd_get_ability: @ 8108670
	push {r4-r7,lr}
	ldr r0, _08108680 @ =gUnknown_02039238
	ldr r0, [r0]
	ldrb r0, [r0, 0x1]
	cmp r0, 0x1
	bne _08108688
	ldr r0, _08108684 @ =gUnknown_02024C07
	b _0810868A
	.align 2, 0
_08108680: .4byte gUnknown_02039238
_08108684: .4byte gUnknown_02024C07
_08108688:
	ldr r0, _081086BC @ =gUnknown_02024C08
_0810868A:
	ldrb r4, [r0]
	adds r0, r4, 0
	bl battle_side_get_owner
	lsls r0, 24
	cmp r0, 0
	bne _08108774
	adds r0, r4, 0
	bl battle_get_per_side_status
	movs r7, 0x1
	adds r1, r7, 0
	ands r1, r0
	ldr r6, _081086C0 @ =0x02016a00
	adds r0, r6, 0
	adds r0, 0x20
	adds r3, r1, r0
	ldrb r0, [r3]
	cmp r0, 0
	beq _081086C8
	ldr r0, _081086C4 @ =0xfffffe00
	adds r1, r6, r0
	ldrb r0, [r3]
	str r0, [r1, 0x8]
	b _08108784
	.align 2, 0
_081086BC: .4byte gUnknown_02024C08
_081086C0: .4byte 0x02016a00
_081086C4: .4byte 0xfffffe00
_081086C8:
	ldr r1, _081086F4 @ =gBattleMons
	movs r0, 0x58
	muls r0, r4
	adds r5, r0, r1
	adds r0, r5, 0
	adds r0, 0x20
	ldrb r0, [r0]
	adds r2, r1, 0
	cmp r0, 0x17
	beq _081086E4
	cmp r0, 0x2A
	beq _081086E4
	cmp r0, 0x47
	bne _081086FC
_081086E4:
	ldr r1, _081086F8 @ =0x02016800
	movs r0, 0x58
	muls r0, r4
	adds r0, r2
	adds r0, 0x20
	ldrb r0, [r0]
	str r0, [r1, 0x8]
	b _08108784
	.align 2, 0
_081086F4: .4byte gBattleMons
_081086F8: .4byte 0x02016800
_081086FC:
	ldr r4, _08108734 @ =gBaseStats
	ldrh r0, [r5]
	lsls r1, r0, 3
	subs r1, r0
	lsls r1, 2
	adds r3, r1, r4
	ldrb r0, [r3, 0x16]
	cmp r0, 0
	beq _08108764
	ldrb r0, [r3, 0x17]
	cmp r0, 0
	beq _08108754
	bl Random
	adds r1, r7, 0
	ands r1, r0
	cmp r1, 0
	beq _0810873C
	ldr r0, _08108738 @ =0xfffffe00
	adds r2, r6, r0
	ldrh r1, [r5]
	lsls r0, r1, 3
	subs r0, r1
	lsls r0, 2
	adds r0, r4
	ldrb r0, [r0, 0x16]
	b _08108782
	.align 2, 0
_08108734: .4byte gBaseStats
_08108738: .4byte 0xfffffe00
_0810873C:
	ldr r0, _08108750 @ =0xfffffe00
	adds r2, r6, r0
	ldrh r1, [r5]
	lsls r0, r1, 3
	subs r0, r1
	lsls r0, 2
	adds r0, r4
	ldrb r0, [r0, 0x17]
	b _08108782
	.align 2, 0
_08108750: .4byte 0xfffffe00
_08108754:
	ldr r0, _08108760 @ =0xfffffe00
	adds r1, r6, r0
	ldrb r0, [r3, 0x16]
	str r0, [r1, 0x8]
	b _08108784
	.align 2, 0
_08108760: .4byte 0xfffffe00
_08108764:
	ldr r0, _08108770 @ =0xfffffe00
	adds r1, r6, r0
	ldrb r0, [r3, 0x17]
	str r0, [r1, 0x8]
	b _08108784
	.align 2, 0
_08108770: .4byte 0xfffffe00
_08108774:
	ldr r2, _08108794 @ =0x02016800
	ldr r1, _08108798 @ =gBattleMons
	movs r0, 0x58
	muls r0, r4
	adds r0, r1
	adds r0, 0x20
	ldrb r0, [r0]
_08108782:
	str r0, [r2, 0x8]
_08108784:
	ldr r1, _0810879C @ =gUnknown_02039238
	ldr r0, [r1]
	adds r0, 0x2
	str r0, [r1]
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_08108794: .4byte 0x02016800
_08108798: .4byte gBattleMons
_0810879C: .4byte gUnknown_02039238
	thumb_func_end BattleAICmd_get_ability

	thumb_func_start BattleAICmd_unk_30
BattleAICmd_unk_30: @ 81087A0
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	ldr r0, _0810885C @ =gUnknown_02024DEC
	movs r2, 0
	strh r2, [r0]
	ldr r1, _08108860 @ =0x02000000
	ldr r3, _08108864 @ =0x0001601c
	adds r0, r1, r3
	movs r4, 0
	strb r2, [r0]
	adds r3, 0x3
	adds r0, r1, r3
	movs r3, 0x1
	strb r3, [r0]
	ldr r0, _08108868 @ =gUnknown_02024C68
	strb r2, [r0]
	ldr r0, _0810886C @ =gCritMultiplier
	strb r3, [r0]
	movs r0, 0xB4
	lsls r0, 9
	adds r1, r0
	str r4, [r1, 0x8]
	movs r5, 0
	ldr r4, _08108870 @ =gUnknown_02024BEC
	ldr r7, _08108874 @ =gUnknown_02024BE6
	ldr r3, _08108878 @ =gUnknown_02024A8C
	mov r8, r3
	ldr r6, _0810887C @ =gUnknown_02024C07
_081087DA:
	movs r0, 0x28
	str r0, [r4]
	lsls r1, r5, 1
	ldrb r2, [r6]
	movs r0, 0x58
	muls r0, r2
	adds r1, r0
	add r1, r8
	ldrh r0, [r1]
	strh r0, [r7]
	lsls r0, 16
	cmp r0, 0
	beq _08108844
	ldrh r0, [r7]
	ldrb r1, [r6]
	ldr r2, _08108880 @ =gUnknown_02024C08
	ldrb r2, [r2]
	bl move_effectiveness_something
	ldr r0, [r4]
	cmp r0, 0x78
	bne _0810880A
	movs r0, 0x50
	str r0, [r4]
_0810880A:
	ldr r0, [r4]
	cmp r0, 0xF0
	bne _08108814
	movs r0, 0xA0
	str r0, [r4]
_08108814:
	ldr r0, [r4]
	cmp r0, 0x1E
	bne _0810881E
	movs r0, 0x14
	str r0, [r4]
_0810881E:
	ldr r0, [r4]
	cmp r0, 0xF
	bne _08108828
	movs r0, 0xA
	str r0, [r4]
_08108828:
	ldr r0, _08108868 @ =gUnknown_02024C68
	ldrb r1, [r0]
	movs r0, 0x8
	ands r0, r1
	cmp r0, 0
	beq _08108838
	movs r0, 0
	str r0, [r4]
_08108838:
	ldr r2, _08108884 @ =0x02016800
	ldr r0, [r2, 0x8]
	ldr r1, [r4]
	cmp r0, r1
	bcs _08108844
	str r1, [r2, 0x8]
_08108844:
	adds r5, 0x1
	cmp r5, 0x3
	ble _081087DA
	ldr r1, _08108888 @ =gUnknown_02039238
	ldr r0, [r1]
	adds r0, 0x1
	str r0, [r1]
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_0810885C: .4byte gUnknown_02024DEC
_08108860: .4byte 0x02000000
_08108864: .4byte 0x0001601c
_08108868: .4byte gUnknown_02024C68
_0810886C: .4byte gCritMultiplier
_08108870: .4byte gUnknown_02024BEC
_08108874: .4byte gUnknown_02024BE6
_08108878: .4byte gUnknown_02024A8C
_0810887C: .4byte gUnknown_02024C07
_08108880: .4byte gUnknown_02024C08
_08108884: .4byte 0x02016800
_08108888: .4byte gUnknown_02039238
	thumb_func_end BattleAICmd_unk_30

	thumb_func_start BattleAICmd_if_damage_bonus
BattleAICmd_if_damage_bonus: @ 810888C
	push {r4,r5,lr}
	ldr r0, _08108928 @ =gUnknown_02024DEC
	movs r1, 0
	strh r1, [r0]
	ldr r2, _0810892C @ =0x02000000
	ldr r3, _08108930 @ =0x0001601c
	adds r0, r2, r3
	strb r1, [r0]
	adds r3, 0x3
	adds r0, r2, r3
	movs r3, 0x1
	strb r3, [r0]
	ldr r5, _08108934 @ =gUnknown_02024C68
	strb r1, [r5]
	ldr r0, _08108938 @ =gCritMultiplier
	strb r3, [r0]
	ldr r4, _0810893C @ =gUnknown_02024BEC
	movs r0, 0x28
	str r0, [r4]
	ldr r1, _08108940 @ =gUnknown_02024BE6
	movs r0, 0xB4
	lsls r0, 9
	adds r2, r0
	ldrh r0, [r2, 0x2]
	strh r0, [r1]
	ldrh r0, [r1]
	ldr r1, _08108944 @ =gUnknown_02024C07
	ldrb r1, [r1]
	ldr r2, _08108948 @ =gUnknown_02024C08
	ldrb r2, [r2]
	bl move_effectiveness_something
	ldr r0, [r4]
	cmp r0, 0x78
	bne _081088D6
	movs r0, 0x50
	str r0, [r4]
_081088D6:
	ldr r0, [r4]
	cmp r0, 0xF0
	bne _081088E0
	movs r0, 0xA0
	str r0, [r4]
_081088E0:
	ldr r0, [r4]
	cmp r0, 0x1E
	bne _081088EA
	movs r0, 0x14
	str r0, [r4]
_081088EA:
	ldr r0, [r4]
	cmp r0, 0xF
	bne _081088F4
	movs r0, 0xA
	str r0, [r4]
_081088F4:
	ldrb r1, [r5]
	movs r0, 0x8
	ands r0, r1
	cmp r0, 0
	beq _08108902
	movs r0, 0
	str r0, [r4]
_08108902:
	ldrb r0, [r4]
	ldr r3, _0810894C @ =gUnknown_02039238
	ldr r2, [r3]
	ldrb r1, [r2, 0x1]
	cmp r0, r1
	bne _08108950
	ldrb r1, [r2, 0x2]
	ldrb r0, [r2, 0x3]
	lsls r0, 8
	orrs r1, r0
	ldrb r0, [r2, 0x4]
	lsls r0, 16
	orrs r1, r0
	ldrb r0, [r2, 0x5]
	lsls r0, 24
	orrs r1, r0
	str r1, [r3]
	b _08108954
	.align 2, 0
_08108928: .4byte gUnknown_02024DEC
_0810892C: .4byte 0x02000000
_08108930: .4byte 0x0001601c
_08108934: .4byte gUnknown_02024C68
_08108938: .4byte gCritMultiplier
_0810893C: .4byte gUnknown_02024BEC
_08108940: .4byte gUnknown_02024BE6
_08108944: .4byte gUnknown_02024C07
_08108948: .4byte gUnknown_02024C08
_0810894C: .4byte gUnknown_02039238
_08108950:
	adds r0, r2, 0x6
	str r0, [r3]
_08108954:
	pop {r4,r5}
	pop {r0}
	bx r0
	thumb_func_end BattleAICmd_if_damage_bonus

	thumb_func_start BattleAICmd_unk_32
BattleAICmd_unk_32: @ 810895C
	bx lr
	thumb_func_end BattleAICmd_unk_32

	thumb_func_start BattleAICmd_unk_33
BattleAICmd_unk_33: @ 8108960
	bx lr
	thumb_func_end BattleAICmd_unk_33

	thumb_func_start BattleAICmd_if_status_in_party
BattleAICmd_if_status_in_party: @ 8108964
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	ldr r0, _0810897C @ =gUnknown_02039238
	ldr r1, [r0]
	ldrb r1, [r1, 0x1]
	cmp r1, 0x1
	bne _081089A4
	ldr r1, _08108980 @ =gEnemyParty
	b _081089A6
	.align 2, 0
_0810897C: .4byte gUnknown_02039238
_08108980: .4byte gEnemyParty
_08108984:
	ldr r3, _081089A0 @ =gUnknown_02039238
	ldr r2, [r3]
	ldrb r1, [r2, 0x6]
	ldrb r0, [r2, 0x7]
	lsls r0, 8
	orrs r1, r0
	ldrb r0, [r2, 0x8]
	lsls r0, 16
	orrs r1, r0
	ldrb r0, [r2, 0x9]
	lsls r0, 24
	orrs r1, r0
	str r1, [r3]
	b _08108A12
	.align 2, 0
_081089A0: .4byte gUnknown_02039238
_081089A4:
	ldr r1, _08108A20 @ =gPlayerParty
_081089A6:
	mov r9, r1
	ldr r1, [r0]
	ldrb r7, [r1, 0x2]
	ldrb r0, [r1, 0x3]
	lsls r0, 8
	orrs r7, r0
	ldrb r0, [r1, 0x4]
	lsls r0, 16
	orrs r7, r0
	ldrb r0, [r1, 0x5]
	lsls r0, 24
	orrs r7, r0
	movs r0, 0
	mov r8, r0
	movs r1, 0xCE
	lsls r1, 1
	mov r10, r1
_081089C8:
	movs r0, 0x64
	mov r4, r8
	muls r4, r0
	add r4, r9
	adds r0, r4, 0
	movs r1, 0xB
	bl GetMonData
	lsls r0, 16
	lsrs r5, r0, 16
	adds r0, r4, 0
	movs r1, 0x39
	bl GetMonData
	lsls r0, 16
	lsrs r6, r0, 16
	adds r0, r4, 0
	movs r1, 0x37
	bl GetMonData
	cmp r5, 0
	beq _08108A00
	cmp r5, r10
	beq _08108A00
	cmp r6, 0
	beq _08108A00
	cmp r0, r7
	beq _08108984
_08108A00:
	movs r0, 0x1
	add r8, r0
	mov r1, r8
	cmp r1, 0x5
	ble _081089C8
	ldr r1, _08108A24 @ =gUnknown_02039238
	ldr r0, [r1]
	adds r0, 0xA
	str r0, [r1]
_08108A12:
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_08108A20: .4byte gPlayerParty
_08108A24: .4byte gUnknown_02039238
	thumb_func_end BattleAICmd_if_status_in_party

	thumb_func_start BattleAICmd_if_status_not_in_party
BattleAICmd_if_status_not_in_party: @ 8108A28
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	ldr r0, _08108A44 @ =gUnknown_02039238
	ldr r1, [r0]
	ldrb r1, [r1, 0x1]
	adds r2, r0, 0
	cmp r1, 0x1
	bne _08108A4C
	ldr r0, _08108A48 @ =gEnemyParty
	mov r10, r0
	b _08108A50
	.align 2, 0
_08108A44: .4byte gUnknown_02039238
_08108A48: .4byte gEnemyParty
_08108A4C:
	ldr r1, _08108AE4 @ =gPlayerParty
	mov r10, r1
_08108A50:
	ldr r1, [r2]
	ldrb r7, [r1, 0x2]
	ldrb r0, [r1, 0x3]
	lsls r0, 8
	orrs r7, r0
	ldrb r0, [r1, 0x4]
	lsls r0, 16
	orrs r7, r0
	ldrb r0, [r1, 0x5]
	lsls r0, 24
	orrs r7, r0
	movs r0, 0
	mov r8, r0
	mov r9, r2
_08108A6C:
	movs r0, 0x64
	mov r4, r8
	muls r4, r0
	add r4, r10
	adds r0, r4, 0
	movs r1, 0xB
	bl GetMonData
	lsls r0, 16
	lsrs r5, r0, 16
	adds r0, r4, 0
	movs r1, 0x39
	bl GetMonData
	lsls r0, 16
	lsrs r6, r0, 16
	adds r0, r4, 0
	movs r1, 0x37
	bl GetMonData
	cmp r5, 0
	beq _08108AB0
	movs r1, 0xCE
	lsls r1, 1
	cmp r5, r1
	beq _08108AB0
	cmp r6, 0
	beq _08108AB0
	cmp r0, r7
	bne _08108AB0
	mov r1, r9
	ldr r0, [r1]
	adds r0, 0xA
	str r0, [r1]
_08108AB0:
	movs r0, 0x1
	add r8, r0
	mov r1, r8
	cmp r1, 0x5
	ble _08108A6C
	ldr r3, _08108AE8 @ =gUnknown_02039238
	ldr r2, [r3]
	ldrb r1, [r2, 0x6]
	ldrb r0, [r2, 0x7]
	lsls r0, 8
	orrs r1, r0
	ldrb r0, [r2, 0x8]
	lsls r0, 16
	orrs r1, r0
	ldrb r0, [r2, 0x9]
	lsls r0, 24
	orrs r1, r0
	str r1, [r3]
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_08108AE4: .4byte gPlayerParty
_08108AE8: .4byte gUnknown_02039238
	thumb_func_end BattleAICmd_if_status_not_in_party

	thumb_func_start BattleAICmd_unk_36
BattleAICmd_unk_36: @ 8108AEC
	push {lr}
	ldr r2, _08108B3C @ =word_2024DB8
	ldrh r1, [r2]
	movs r0, 0x7
	ands r0, r1
	cmp r0, 0
	beq _08108B00
	ldr r1, _08108B40 @ =0x02016800
	movs r0, 0x1
	str r0, [r1, 0x8]
_08108B00:
	ldrh r2, [r2]
	movs r0, 0x18
	ands r0, r2
	adds r3, r2, 0
	cmp r0, 0
	beq _08108B12
	ldr r1, _08108B40 @ =0x02016800
	movs r0, 0x2
	str r0, [r1, 0x8]
_08108B12:
	movs r0, 0x60
	ands r0, r3
	cmp r0, 0
	beq _08108B20
	ldr r1, _08108B40 @ =0x02016800
	movs r0, 0
	str r0, [r1, 0x8]
_08108B20:
	movs r0, 0x80
	ands r0, r2
	cmp r0, 0
	beq _08108B2E
	ldr r1, _08108B40 @ =0x02016800
	movs r0, 0x3
	str r0, [r1, 0x8]
_08108B2E:
	ldr r1, _08108B44 @ =gUnknown_02039238
	ldr r0, [r1]
	adds r0, 0x1
	str r0, [r1]
	pop {r0}
	bx r0
	.align 2, 0
_08108B3C: .4byte word_2024DB8
_08108B40: .4byte 0x02016800
_08108B44: .4byte gUnknown_02039238
	thumb_func_end BattleAICmd_unk_36

	thumb_func_start BattleAICmd_if_effect
BattleAICmd_if_effect: @ 8108B48
	push {lr}
	ldr r2, _08108B7C @ =gBattleMoves
	ldr r0, _08108B80 @ =0x02016800
	ldrh r1, [r0, 0x2]
	lsls r0, r1, 1
	adds r0, r1
	lsls r0, 2
	adds r0, r2
	ldr r3, _08108B84 @ =gUnknown_02039238
	ldr r2, [r3]
	ldrb r0, [r0]
	ldrb r1, [r2, 0x1]
	cmp r0, r1
	bne _08108B88
	ldrb r1, [r2, 0x2]
	ldrb r0, [r2, 0x3]
	lsls r0, 8
	orrs r1, r0
	ldrb r0, [r2, 0x4]
	lsls r0, 16
	orrs r1, r0
	ldrb r0, [r2, 0x5]
	lsls r0, 24
	orrs r1, r0
	str r1, [r3]
	b _08108B8C
	.align 2, 0
_08108B7C: .4byte gBattleMoves
_08108B80: .4byte 0x02016800
_08108B84: .4byte gUnknown_02039238
_08108B88:
	adds r0, r2, 0x6
	str r0, [r3]
_08108B8C:
	pop {r0}
	bx r0
	thumb_func_end BattleAICmd_if_effect

	thumb_func_start BattleAICmd_if_not_effect
BattleAICmd_if_not_effect: @ 8108B90
	push {lr}
	ldr r2, _08108BC4 @ =gBattleMoves
	ldr r0, _08108BC8 @ =0x02016800
	ldrh r1, [r0, 0x2]
	lsls r0, r1, 1
	adds r0, r1
	lsls r0, 2
	adds r0, r2
	ldr r3, _08108BCC @ =gUnknown_02039238
	ldr r2, [r3]
	ldrb r0, [r0]
	ldrb r1, [r2, 0x1]
	cmp r0, r1
	beq _08108BD0
	ldrb r1, [r2, 0x2]
	ldrb r0, [r2, 0x3]
	lsls r0, 8
	orrs r1, r0
	ldrb r0, [r2, 0x4]
	lsls r0, 16
	orrs r1, r0
	ldrb r0, [r2, 0x5]
	lsls r0, 24
	orrs r1, r0
	str r1, [r3]
	b _08108BD4
	.align 2, 0
_08108BC4: .4byte gBattleMoves
_08108BC8: .4byte 0x02016800
_08108BCC: .4byte gUnknown_02039238
_08108BD0:
	adds r0, r2, 0x6
	str r0, [r3]
_08108BD4:
	pop {r0}
	bx r0
	thumb_func_end BattleAICmd_if_not_effect

	thumb_func_start BattleAICmd_if_stat_level_less_than
BattleAICmd_if_stat_level_less_than: @ 8108BD8
	push {r4,lr}
	ldr r0, _08108BEC @ =gUnknown_02039238
	ldr r1, [r0]
	ldrb r1, [r1, 0x1]
	adds r4, r0, 0
	cmp r1, 0x1
	bne _08108BF4
	ldr r0, _08108BF0 @ =gUnknown_02024C07
	b _08108BF6
	.align 2, 0
_08108BEC: .4byte gUnknown_02039238
_08108BF0: .4byte gUnknown_02024C07
_08108BF4:
	ldr r0, _08108C2C @ =gUnknown_02024C08
_08108BF6:
	ldrb r3, [r0]
	ldr r1, _08108C30 @ =gBattleMons
	ldr r2, [r4]
	movs r0, 0x58
	muls r0, r3
	ldrb r3, [r2, 0x2]
	adds r0, r3
	adds r1, 0x18
	adds r0, r1
	ldrb r0, [r0]
	lsls r0, 24
	asrs r0, 24
	ldrb r1, [r2, 0x3]
	cmp r0, r1
	bge _08108C34
	ldrb r1, [r2, 0x4]
	ldrb r0, [r2, 0x5]
	lsls r0, 8
	orrs r1, r0
	ldrb r0, [r2, 0x6]
	lsls r0, 16
	orrs r1, r0
	ldrb r0, [r2, 0x7]
	lsls r0, 24
	orrs r1, r0
	str r1, [r4]
	b _08108C3A
	.align 2, 0
_08108C2C: .4byte gUnknown_02024C08
_08108C30: .4byte gBattleMons
_08108C34:
	adds r0, r2, 0
	adds r0, 0x8
	str r0, [r4]
_08108C3A:
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end BattleAICmd_if_stat_level_less_than

	thumb_func_start BattleAICmd_if_stat_level_more_than
BattleAICmd_if_stat_level_more_than: @ 8108C40
	push {r4,lr}
	ldr r0, _08108C54 @ =gUnknown_02039238
	ldr r1, [r0]
	ldrb r1, [r1, 0x1]
	adds r4, r0, 0
	cmp r1, 0x1
	bne _08108C5C
	ldr r0, _08108C58 @ =gUnknown_02024C07
	b _08108C5E
	.align 2, 0
_08108C54: .4byte gUnknown_02039238
_08108C58: .4byte gUnknown_02024C07
_08108C5C:
	ldr r0, _08108C94 @ =gUnknown_02024C08
_08108C5E:
	ldrb r3, [r0]
	ldr r1, _08108C98 @ =gBattleMons
	ldr r2, [r4]
	movs r0, 0x58
	muls r0, r3
	ldrb r3, [r2, 0x2]
	adds r0, r3
	adds r1, 0x18
	adds r0, r1
	ldrb r0, [r0]
	lsls r0, 24
	asrs r0, 24
	ldrb r1, [r2, 0x3]
	cmp r0, r1
	ble _08108C9C
	ldrb r1, [r2, 0x4]
	ldrb r0, [r2, 0x5]
	lsls r0, 8
	orrs r1, r0
	ldrb r0, [r2, 0x6]
	lsls r0, 16
	orrs r1, r0
	ldrb r0, [r2, 0x7]
	lsls r0, 24
	orrs r1, r0
	str r1, [r4]
	b _08108CA2
	.align 2, 0
_08108C94: .4byte gUnknown_02024C08
_08108C98: .4byte gBattleMons
_08108C9C:
	adds r0, r2, 0
	adds r0, 0x8
	str r0, [r4]
_08108CA2:
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end BattleAICmd_if_stat_level_more_than

	thumb_func_start BattleAICmd_if_stat_level_equal
BattleAICmd_if_stat_level_equal: @ 8108CA8
	push {r4,lr}
	ldr r0, _08108CBC @ =gUnknown_02039238
	ldr r1, [r0]
	ldrb r1, [r1, 0x1]
	adds r4, r0, 0
	cmp r1, 0x1
	bne _08108CC4
	ldr r0, _08108CC0 @ =gUnknown_02024C07
	b _08108CC6
	.align 2, 0
_08108CBC: .4byte gUnknown_02039238
_08108CC0: .4byte gUnknown_02024C07
_08108CC4:
	ldr r0, _08108CFC @ =gUnknown_02024C08
_08108CC6:
	ldrb r3, [r0]
	ldr r1, _08108D00 @ =gBattleMons
	ldr r2, [r4]
	movs r0, 0x58
	muls r0, r3
	ldrb r3, [r2, 0x2]
	adds r0, r3
	adds r1, 0x18
	adds r0, r1
	ldrb r0, [r0]
	lsls r0, 24
	asrs r0, 24
	ldrb r1, [r2, 0x3]
	cmp r0, r1
	bne _08108D04
	ldrb r1, [r2, 0x4]
	ldrb r0, [r2, 0x5]
	lsls r0, 8
	orrs r1, r0
	ldrb r0, [r2, 0x6]
	lsls r0, 16
	orrs r1, r0
	ldrb r0, [r2, 0x7]
	lsls r0, 24
	orrs r1, r0
	str r1, [r4]
	b _08108D0A
	.align 2, 0
_08108CFC: .4byte gUnknown_02024C08
_08108D00: .4byte gBattleMons
_08108D04:
	adds r0, r2, 0
	adds r0, 0x8
	str r0, [r4]
_08108D0A:
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end BattleAICmd_if_stat_level_equal

	thumb_func_start BattleAICmd_if_stat_level_not_equal
BattleAICmd_if_stat_level_not_equal: @ 8108D10
	push {r4,lr}
	ldr r0, _08108D24 @ =gUnknown_02039238
	ldr r1, [r0]
	ldrb r1, [r1, 0x1]
	adds r4, r0, 0
	cmp r1, 0x1
	bne _08108D2C
	ldr r0, _08108D28 @ =gUnknown_02024C07
	b _08108D2E
	.align 2, 0
_08108D24: .4byte gUnknown_02039238
_08108D28: .4byte gUnknown_02024C07
_08108D2C:
	ldr r0, _08108D64 @ =gUnknown_02024C08
_08108D2E:
	ldrb r3, [r0]
	ldr r1, _08108D68 @ =gBattleMons
	ldr r2, [r4]
	movs r0, 0x58
	muls r0, r3
	ldrb r3, [r2, 0x2]
	adds r0, r3
	adds r1, 0x18
	adds r0, r1
	ldrb r0, [r0]
	lsls r0, 24
	asrs r0, 24
	ldrb r1, [r2, 0x3]
	cmp r0, r1
	beq _08108D6C
	ldrb r1, [r2, 0x4]
	ldrb r0, [r2, 0x5]
	lsls r0, 8
	orrs r1, r0
	ldrb r0, [r2, 0x6]
	lsls r0, 16
	orrs r1, r0
	ldrb r0, [r2, 0x7]
	lsls r0, 24
	orrs r1, r0
	str r1, [r4]
	b _08108D72
	.align 2, 0
_08108D64: .4byte gUnknown_02024C08
_08108D68: .4byte gBattleMons
_08108D6C:
	adds r0, r2, 0
	adds r0, 0x8
	str r0, [r4]
_08108D72:
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end BattleAICmd_if_stat_level_not_equal

	thumb_func_start BattleAICmd_if_can_faint
BattleAICmd_if_can_faint: @ 8108D78
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	ldr r2, _08108E1C @ =gBattleMoves
	ldr r6, _08108E20 @ =0x02016800
	ldrh r1, [r6, 0x2]
	lsls r0, r1, 1
	adds r0, r1
	lsls r0, 2
	adds r0, r2
	ldrb r0, [r0, 0x1]
	cmp r0, 0x1
	bls _08108E4C
	ldr r0, _08108E24 @ =gUnknown_02024DEC
	movs r1, 0
	strh r1, [r0]
	ldr r2, _08108E28 @ =0xfffff81c
	adds r0, r6, r2
	strb r1, [r0]
	adds r2, 0x3
	adds r0, r6, r2
	movs r2, 0x1
	mov r8, r2
	mov r2, r8
	strb r2, [r0]
	ldr r0, _08108E2C @ =gUnknown_02024C68
	strb r1, [r0]
	ldr r0, _08108E30 @ =gCritMultiplier
	strb r2, [r0]
	ldr r5, _08108E34 @ =gUnknown_02024BE6
	ldrh r0, [r6, 0x2]
	strh r0, [r5]
	ldr r4, _08108E38 @ =gUnknown_02024C07
	ldrb r0, [r4]
	ldr r7, _08108E3C @ =gUnknown_02024C08
	ldrb r1, [r7]
	bl sub_801CAF8
	ldrh r0, [r5]
	ldrb r1, [r4]
	ldrb r2, [r7]
	bl move_effectiveness_something
	ldr r4, _08108E40 @ =gUnknown_02024BEC
	adds r0, r6, 0
	adds r0, 0x18
	ldrb r6, [r6, 0x1]
	adds r0, r6
	ldrb r1, [r0]
	ldr r0, [r4]
	muls r0, r1
	movs r1, 0x64
	bl __divsi3
	str r0, [r4]
	cmp r0, 0
	bne _08108DEE
	mov r0, r8
	str r0, [r4]
_08108DEE:
	ldr r2, _08108E44 @ =gBattleMons
	ldrb r1, [r7]
	movs r0, 0x58
	muls r0, r1
	adds r0, r2
	ldrh r1, [r0, 0x28]
	ldr r0, [r4]
	cmp r1, r0
	bgt _08108E4C
	ldr r3, _08108E48 @ =gUnknown_02039238
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
	b _08108E54
	.align 2, 0
_08108E1C: .4byte gBattleMoves
_08108E20: .4byte 0x02016800
_08108E24: .4byte gUnknown_02024DEC
_08108E28: .4byte 0xfffff81c
_08108E2C: .4byte gUnknown_02024C68
_08108E30: .4byte gCritMultiplier
_08108E34: .4byte gUnknown_02024BE6
_08108E38: .4byte gUnknown_02024C07
_08108E3C: .4byte gUnknown_02024C08
_08108E40: .4byte gUnknown_02024BEC
_08108E44: .4byte gBattleMons
_08108E48: .4byte gUnknown_02039238
_08108E4C:
	ldr r1, _08108E60 @ =gUnknown_02039238
	ldr r0, [r1]
	adds r0, 0x5
	str r0, [r1]
_08108E54:
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_08108E60: .4byte gUnknown_02039238
	thumb_func_end BattleAICmd_if_can_faint

	thumb_func_start BattleAICmd_if_cant_faint
BattleAICmd_if_cant_faint: @ 8108E64
	push {r4-r7,lr}
	ldr r2, _08108EF8 @ =gBattleMoves
	ldr r7, _08108EFC @ =0x02016800
	ldrh r1, [r7, 0x2]
	lsls r0, r1, 1
	adds r0, r1
	lsls r0, 2
	adds r0, r2
	ldrb r0, [r0, 0x1]
	cmp r0, 0x1
	bls _08108F28
	ldr r0, _08108F00 @ =gUnknown_02024DEC
	movs r1, 0
	strh r1, [r0]
	ldr r2, _08108F04 @ =0xfffff81c
	adds r0, r7, r2
	strb r1, [r0]
	adds r2, 0x3
	adds r0, r7, r2
	movs r2, 0x1
	strb r2, [r0]
	ldr r0, _08108F08 @ =gUnknown_02024C68
	strb r1, [r0]
	ldr r0, _08108F0C @ =gCritMultiplier
	strb r2, [r0]
	ldr r6, _08108F10 @ =gUnknown_02024BE6
	ldrh r0, [r7, 0x2]
	strh r0, [r6]
	ldr r4, _08108F14 @ =gUnknown_02024C07
	ldrb r0, [r4]
	ldr r5, _08108F18 @ =gUnknown_02024C08
	ldrb r1, [r5]
	bl sub_801CAF8
	ldrh r0, [r6]
	ldrb r1, [r4]
	ldrb r2, [r5]
	bl move_effectiveness_something
	ldr r4, _08108F1C @ =gUnknown_02024BEC
	adds r0, r7, 0
	adds r0, 0x18
	ldrb r7, [r7, 0x1]
	adds r0, r7
	ldrb r1, [r0]
	ldr r0, [r4]
	muls r0, r1
	movs r1, 0x64
	bl __divsi3
	str r0, [r4]
	ldr r3, _08108F20 @ =gBattleMons
	ldrb r2, [r5]
	movs r1, 0x58
	muls r1, r2
	adds r1, r3
	ldrh r1, [r1, 0x28]
	cmp r1, r0
	ble _08108F28
	ldr r3, _08108F24 @ =gUnknown_02039238
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
	b _08108F30
	.align 2, 0
_08108EF8: .4byte gBattleMoves
_08108EFC: .4byte 0x02016800
_08108F00: .4byte gUnknown_02024DEC
_08108F04: .4byte 0xfffff81c
_08108F08: .4byte gUnknown_02024C68
_08108F0C: .4byte gCritMultiplier
_08108F10: .4byte gUnknown_02024BE6
_08108F14: .4byte gUnknown_02024C07
_08108F18: .4byte gUnknown_02024C08
_08108F1C: .4byte gUnknown_02024BEC
_08108F20: .4byte gBattleMons
_08108F24: .4byte gUnknown_02039238
_08108F28:
	ldr r1, _08108F38 @ =gUnknown_02039238
	ldr r0, [r1]
	adds r0, 0x5
	str r0, [r1]
_08108F30:
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_08108F38: .4byte gUnknown_02039238
	thumb_func_end BattleAICmd_if_cant_faint

	thumb_func_start BattleAICmd_unk_3F
BattleAICmd_unk_3F: @ 8108F3C
	push {r4-r7,lr}
	ldr r1, _08108F58 @ =gUnknown_02039238
	ldr r0, [r1]
	adds r6, r0, 0x2
	ldrb r0, [r0, 0x1]
	adds r4, r1, 0
	cmp r0, 0x1
	beq _08108F64
	cmp r0, 0x1
	bgt _08108F5C
	cmp r0, 0
	beq _08108FA8
	b _08109008
	.align 2, 0
_08108F58: .4byte gUnknown_02039238
_08108F5C:
	cmp r0, 0x2
	beq _08108FA8
	cmp r0, 0x3
	bne _08109008
_08108F64:
	movs r3, 0
	ldr r2, _08108FA0 @ =gBattleMons
	ldr r5, _08108FA4 @ =gUnknown_02024C07
	ldrb r1, [r5]
	movs r0, 0x58
	muls r0, r1
	adds r2, 0xC
	adds r0, r2
	ldrh r0, [r0]
	ldrh r1, [r6]
	cmp r0, r1
	beq _08108F9A
	adds r7, r5, 0
	movs r6, 0x58
	adds r5, r2, 0
	adds r2, r1, 0
_08108F84:
	adds r3, 0x1
	cmp r3, 0x3
	bgt _08108F9A
	lsls r1, r3, 1
	ldrb r0, [r7]
	muls r0, r6
	adds r1, r0
	adds r1, r5
	ldrh r0, [r1]
	cmp r0, r2
	bne _08108F84
_08108F9A:
	cmp r3, 0x4
	beq _08108FDE
	b _08108FF0
	.align 2, 0
_08108FA0: .4byte gBattleMons
_08108FA4: .4byte gUnknown_02024C07
_08108FA8:
	movs r3, 0
	ldr r5, _08108FE8 @ =0x02016a00
	ldr r1, _08108FEC @ =gUnknown_02024C08
	ldrb r0, [r1]
	lsrs r0, 1
	lsls r0, 4
	adds r0, r5
	ldrh r0, [r0]
	ldrh r2, [r6]
	cmp r0, r2
	beq _08108FDA
	adds r6, r5, 0
	adds r5, r1, 0
_08108FC2:
	adds r3, 0x1
	cmp r3, 0x7
	bgt _08108FDA
	lsls r0, r3, 1
	ldrb r1, [r5]
	lsrs r1, 1
	lsls r1, 4
	adds r0, r1
	adds r0, r6
	ldrh r0, [r0]
	cmp r0, r2
	bne _08108FC2
_08108FDA:
	cmp r3, 0x8
	bne _08108FF0
_08108FDE:
	ldr r0, [r4]
	adds r0, 0x8
	str r0, [r4]
	b _08109008
	.align 2, 0
_08108FE8: .4byte 0x02016a00
_08108FEC: .4byte gUnknown_02024C08
_08108FF0:
	ldr r2, [r4]
	ldrb r1, [r2, 0x4]
	ldrb r0, [r2, 0x5]
	lsls r0, 8
	orrs r1, r0
	ldrb r0, [r2, 0x6]
	lsls r0, 16
	orrs r1, r0
	ldrb r0, [r2, 0x7]
	lsls r0, 24
	orrs r1, r0
	str r1, [r4]
_08109008:
	pop {r4-r7}
	pop {r0}
	bx r0
	thumb_func_end BattleAICmd_unk_3F

	thumb_func_start BattleAICmd_unk_40
BattleAICmd_unk_40: @ 8109010
	push {r4-r7,lr}
	ldr r1, _0810902C @ =gUnknown_02039238
	ldr r0, [r1]
	adds r6, r0, 0x2
	ldrb r0, [r0, 0x1]
	adds r4, r1, 0
	cmp r0, 0x1
	beq _08109038
	cmp r0, 0x1
	bgt _08109030
	cmp r0, 0
	beq _0810907C
	b _081090DC
	.align 2, 0
_0810902C: .4byte gUnknown_02039238
_08109030:
	cmp r0, 0x2
	beq _0810907C
	cmp r0, 0x3
	bne _081090DC
_08109038:
	movs r3, 0
	ldr r2, _08109074 @ =gBattleMons
	ldr r5, _08109078 @ =gUnknown_02024C07
	ldrb r1, [r5]
	movs r0, 0x58
	muls r0, r1
	adds r2, 0xC
	adds r0, r2
	ldrh r0, [r0]
	ldrh r1, [r6]
	cmp r0, r1
	beq _0810906E
	adds r7, r5, 0
	movs r6, 0x58
	adds r5, r2, 0
	adds r2, r1, 0
_08109058:
	adds r3, 0x1
	cmp r3, 0x3
	bgt _0810906E
	lsls r1, r3, 1
	ldrb r0, [r7]
	muls r0, r6
	adds r1, r0
	adds r1, r5
	ldrh r0, [r1]
	cmp r0, r2
	bne _08109058
_0810906E:
	cmp r3, 0x4
	bne _081090B2
	b _081090C4
	.align 2, 0
_08109074: .4byte gBattleMons
_08109078: .4byte gUnknown_02024C07
_0810907C:
	movs r3, 0
	ldr r5, _081090BC @ =0x02016a00
	ldr r1, _081090C0 @ =gUnknown_02024C08
	ldrb r0, [r1]
	lsrs r0, 1
	lsls r0, 4
	adds r0, r5
	ldrh r0, [r0]
	ldrh r2, [r6]
	cmp r0, r2
	beq _081090AE
	adds r6, r5, 0
	adds r5, r1, 0
_08109096:
	adds r3, 0x1
	cmp r3, 0x7
	bgt _081090AE
	lsls r0, r3, 1
	ldrb r1, [r5]
	lsrs r1, 1
	lsls r1, 4
	adds r0, r1
	adds r0, r6
	ldrh r0, [r0]
	cmp r0, r2
	bne _08109096
_081090AE:
	cmp r3, 0x8
	beq _081090C4
_081090B2:
	ldr r0, [r4]
	adds r0, 0x8
	str r0, [r4]
	b _081090DC
	.align 2, 0
_081090BC: .4byte 0x02016a00
_081090C0: .4byte gUnknown_02024C08
_081090C4:
	ldr r2, [r4]
	ldrb r1, [r2, 0x4]
	ldrb r0, [r2, 0x5]
	lsls r0, 8
	orrs r1, r0
	ldrb r0, [r2, 0x6]
	lsls r0, 16
	orrs r1, r0
	ldrb r0, [r2, 0x7]
	lsls r0, 24
	orrs r1, r0
	str r1, [r4]
_081090DC:
	pop {r4-r7}
	pop {r0}
	bx r0
	thumb_func_end BattleAICmd_unk_40

	thumb_func_start BattleAICmd_if_move_effect
BattleAICmd_if_move_effect: @ 81090E4
	push {r4-r7,lr}
	ldr r1, _081090FC @ =gUnknown_02039238
	ldr r0, [r1]
	ldrb r0, [r0, 0x1]
	adds r4, r1, 0
	cmp r0, 0x1
	beq _08109108
	cmp r0, 0x1
	bgt _08109100
	cmp r0, 0
	beq _0810915C
	b _081091B8
	.align 2, 0
_081090FC: .4byte gUnknown_02039238
_08109100:
	cmp r0, 0x2
	beq _0810915C
	cmp r0, 0x3
	bne _081091B8
_08109108:
	movs r3, 0
	ldr r1, _0810914C @ =gBattleMons
	ldr r0, _08109150 @ =gUnknown_02024C07
	ldrb r2, [r0]
	ldr r6, _08109154 @ =gBattleMoves
	movs r0, 0x58
	muls r0, r2
	adds r1, 0xC
	adds r2, r0, r1
	ldr r5, _08109158 @ =gUnknown_02039238
_0810911C:
	ldrh r0, [r2]
	cmp r0, 0
	beq _08109136
	adds r1, r0, 0
	lsls r0, r1, 1
	adds r0, r1
	lsls r0, 2
	adds r0, r6
	ldr r1, [r5]
	ldrb r0, [r0]
	ldrb r1, [r1, 0x2]
	cmp r0, r1
	beq _0810913E
_08109136:
	adds r2, 0x2
	adds r3, 0x1
	cmp r3, 0x3
	ble _0810911C
_0810913E:
	cmp r3, 0x4
	bne _081091A0
	ldr r0, [r4]
	adds r0, 0x7
	str r0, [r4]
	b _081091B8
	.align 2, 0
_0810914C: .4byte gBattleMons
_08109150: .4byte gUnknown_02024C07
_08109154: .4byte gBattleMoves
_08109158: .4byte gUnknown_02039238
_0810915C:
	movs r3, 0
	ldr r1, _081091C0 @ =gBattleMons
	ldr r0, _081091C4 @ =gUnknown_02024C07
	ldrb r2, [r0]
	ldr r7, _081091C8 @ =gBattleMoves
	ldr r6, _081091CC @ =0x02016a00
	ldr r5, _081091D0 @ =gUnknown_02024C08
	movs r0, 0x58
	muls r0, r2
	adds r1, 0xC
	adds r2, r0, r1
_08109172:
	lsls r1, r3, 1
	ldrh r0, [r2]
	cmp r0, 0
	beq _08109198
	ldrb r0, [r5]
	lsrs r0, 1
	lsls r0, 4
	adds r0, r1, r0
	adds r0, r6
	ldrh r1, [r0]
	lsls r0, r1, 1
	adds r0, r1
	lsls r0, 2
	adds r0, r7
	ldr r1, [r4]
	ldrb r0, [r0]
	ldrb r1, [r1, 0x2]
	cmp r0, r1
	beq _081091A0
_08109198:
	adds r2, 0x2
	adds r3, 0x1
	cmp r3, 0x7
	ble _08109172
_081091A0:
	ldr r2, [r4]
	ldrb r1, [r2, 0x3]
	ldrb r0, [r2, 0x4]
	lsls r0, 8
	orrs r1, r0
	ldrb r0, [r2, 0x5]
	lsls r0, 16
	orrs r1, r0
	ldrb r0, [r2, 0x6]
	lsls r0, 24
	orrs r1, r0
	str r1, [r4]
_081091B8:
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_081091C0: .4byte gBattleMons
_081091C4: .4byte gUnknown_02024C07
_081091C8: .4byte gBattleMoves
_081091CC: .4byte 0x02016a00
_081091D0: .4byte gUnknown_02024C08
	thumb_func_end BattleAICmd_if_move_effect

	thumb_func_start BattleAICmd_if_not_move_effect
BattleAICmd_if_not_move_effect: @ 81091D4
	push {r4-r6,lr}
	ldr r1, _081091EC @ =gUnknown_02039238
	ldr r0, [r1]
	ldrb r0, [r0, 0x1]
	adds r4, r1, 0
	cmp r0, 0x1
	beq _081091F8
	cmp r0, 0x1
	bgt _081091F0
	cmp r0, 0
	beq _0810925C
	b _08109294
	.align 2, 0
_081091EC: .4byte gUnknown_02039238
_081091F0:
	cmp r0, 0x2
	beq _0810925C
	cmp r0, 0x3
	bne _08109294
_081091F8:
	movs r3, 0
	ldr r1, _0810924C @ =gBattleMons
	ldr r0, _08109250 @ =gUnknown_02024C07
	ldrb r2, [r0]
	ldr r6, _08109254 @ =gBattleMoves
	movs r0, 0x58
	muls r0, r2
	adds r1, 0xC
	adds r2, r0, r1
	ldr r5, _08109258 @ =gUnknown_02039238
_0810920C:
	ldrh r0, [r2]
	cmp r0, 0
	beq _08109226
	adds r1, r0, 0
	lsls r0, r1, 1
	adds r0, r1
	lsls r0, 2
	adds r0, r6
	ldr r1, [r5]
	ldrb r0, [r0]
	ldrb r1, [r1, 0x2]
	cmp r0, r1
	beq _0810922E
_08109226:
	adds r2, 0x2
	adds r3, 0x1
	cmp r3, 0x3
	ble _0810920C
_0810922E:
	cmp r3, 0x4
	bne _0810928E
	ldr r2, [r4]
	ldrb r1, [r2, 0x3]
	ldrb r0, [r2, 0x4]
	lsls r0, 8
	orrs r1, r0
	ldrb r0, [r2, 0x5]
	lsls r0, 16
	orrs r1, r0
	ldrb r0, [r2, 0x6]
	lsls r0, 24
	orrs r1, r0
	str r1, [r4]
	b _08109294
	.align 2, 0
_0810924C: .4byte gBattleMons
_08109250: .4byte gUnknown_02024C07
_08109254: .4byte gBattleMoves
_08109258: .4byte gUnknown_02039238
_0810925C:
	movs r3, 0
	ldr r1, _0810929C @ =0x02016a00
	ldr r0, _081092A0 @ =gUnknown_02024C08
	ldrb r0, [r0]
	lsrs r0, 1
	lsls r0, 4
	adds r2, r0, r1
	ldr r5, _081092A4 @ =gBattleMoves
_0810926C:
	ldrh r0, [r2]
	cmp r0, 0
	beq _08109286
	adds r1, r0, 0
	lsls r0, r1, 1
	adds r0, r1
	lsls r0, 2
	adds r0, r5
	ldr r1, [r4]
	ldrb r0, [r0]
	ldrb r1, [r1, 0x2]
	cmp r0, r1
	beq _0810928E
_08109286:
	adds r2, 0x2
	adds r3, 0x1
	cmp r3, 0x7
	ble _0810926C
_0810928E:
	ldr r0, [r4]
	adds r0, 0x7
	str r0, [r4]
_08109294:
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_0810929C: .4byte 0x02016a00
_081092A0: .4byte gUnknown_02024C08
_081092A4: .4byte gBattleMoves
	thumb_func_end BattleAICmd_if_not_move_effect

	thumb_func_start BattleAICmd_if_last_move_did_damage
BattleAICmd_if_last_move_did_damage: @ 81092A8
	push {r4,r5,lr}
	ldr r0, _081092BC @ =gUnknown_02039238
	ldr r1, [r0]
	ldrb r1, [r1, 0x1]
	adds r5, r0, 0
	cmp r1, 0x1
	bne _081092C4
	ldr r0, _081092C0 @ =gUnknown_02024C07
	b _081092C6
	.align 2, 0
_081092BC: .4byte gUnknown_02039238
_081092C0: .4byte gUnknown_02024C07
_081092C4:
	ldr r0, _081092E4 @ =gUnknown_02024C08
_081092C6:
	ldrb r3, [r0]
	adds r4, r5, 0
	ldr r2, [r4]
	ldrb r0, [r2, 0x2]
	cmp r0, 0
	bne _081092EC
	ldr r0, _081092E8 @ =gUnknown_02024CA8
	lsls r1, r3, 3
	subs r1, r3
	lsls r1, 2
	adds r1, r0
	ldrh r0, [r1, 0x4]
	cmp r0, 0
	beq _081092F0
	b _08109306
	.align 2, 0
_081092E4: .4byte gUnknown_02024C08
_081092E8: .4byte gUnknown_02024CA8
_081092EC:
	cmp r0, 0x1
	beq _081092F6
_081092F0:
	adds r0, r2, 0x7
	str r0, [r4]
	b _08109328
_081092F6:
	ldr r0, _08109320 @ =gUnknown_02024CA8
	lsls r1, r3, 3
	subs r1, r3
	lsls r1, 2
	adds r1, r0
	ldrh r0, [r1, 0x6]
	cmp r0, 0
	beq _08109324
_08109306:
	ldrb r1, [r2, 0x3]
	ldrb r0, [r2, 0x4]
	lsls r0, 8
	orrs r1, r0
	ldrb r0, [r2, 0x5]
	lsls r0, 16
	orrs r1, r0
	ldrb r0, [r2, 0x6]
	lsls r0, 24
	orrs r1, r0
	str r1, [r4]
	b _08109328
	.align 2, 0
_08109320: .4byte gUnknown_02024CA8
_08109324:
	adds r0, r2, 0x7
	str r0, [r5]
_08109328:
	pop {r4,r5}
	pop {r0}
	bx r0
	thumb_func_end BattleAICmd_if_last_move_did_damage

	thumb_func_start BattleAICmd_if_encored
BattleAICmd_if_encored: @ 8109330
	push {r4,lr}
	ldr r4, _08109344 @ =gUnknown_02039238
	ldr r3, [r4]
	ldrb r0, [r3, 0x1]
	cmp r0, 0
	beq _08109348
	cmp r0, 0x1
	beq _08109370
	b _081093AC
	.align 2, 0
_08109344: .4byte gUnknown_02039238
_08109348:
	ldr r2, _08109364 @ =gUnknown_02024CA8
	ldr r0, _08109368 @ =gUnknown_02024A60
	ldrb r1, [r0]
	lsls r0, r1, 3
	subs r0, r1
	lsls r0, 2
	adds r0, r2
	ldr r1, _0810936C @ =0x02016800
	ldrh r0, [r0, 0x4]
	ldrh r1, [r1, 0x2]
	cmp r0, r1
	beq _08109388
	b _081093AC
	.align 2, 0
_08109364: .4byte gUnknown_02024CA8
_08109368: .4byte gUnknown_02024A60
_0810936C: .4byte 0x02016800
_08109370:
	ldr r2, _081093A0 @ =gUnknown_02024CA8
	ldr r0, _081093A4 @ =gUnknown_02024A60
	ldrb r1, [r0]
	lsls r0, r1, 3
	subs r0, r1
	lsls r0, 2
	adds r0, r2
	ldr r1, _081093A8 @ =0x02016800
	ldrh r0, [r0, 0x6]
	ldrh r1, [r1, 0x2]
	cmp r0, r1
	bne _081093AC
_08109388:
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
	b _081093B0
	.align 2, 0
_081093A0: .4byte gUnknown_02024CA8
_081093A4: .4byte gUnknown_02024A60
_081093A8: .4byte 0x02016800
_081093AC:
	adds r0, r3, 0x6
	str r0, [r4]
_081093B0:
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end BattleAICmd_if_encored

	thumb_func_start BattleAICmd_unk_45
BattleAICmd_unk_45: @ 81093B8
	ldr r2, _081093C4 @ =0x02016800
	ldrb r1, [r2, 0x10]
	movs r0, 0xB
	orrs r0, r1
	strb r0, [r2, 0x10]
	bx lr
	.align 2, 0
_081093C4: .4byte 0x02016800
	thumb_func_end BattleAICmd_unk_45

	thumb_func_start BattleAICmd_if_random_2
BattleAICmd_if_random_2: @ 81093C8
	push {r4,lr}
	ldr r0, _0810940C @ =0x02000000
	ldr r1, _08109410 @ =0x00016088
	adds r0, r1
	ldrb r0, [r0]
	lsls r4, r0, 2
	adds r4, r0
	lsls r4, 24
	lsrs r4, 24
	bl Random
	lsls r0, 16
	lsrs r0, 16
	movs r1, 0x64
	bl __umodsi3
	lsls r0, 24
	lsrs r0, 24
	cmp r0, r4
	bcs _08109418
	ldr r3, _08109414 @ =gUnknown_02039238
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
	b _08109420
	.align 2, 0
_0810940C: .4byte 0x02000000
_08109410: .4byte 0x00016088
_08109414: .4byte gUnknown_02039238
_08109418:
	ldr r1, _08109428 @ =gUnknown_02039238
	ldr r0, [r1]
	adds r0, 0x5
	str r0, [r1]
_08109420:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08109428: .4byte gUnknown_02039238
	thumb_func_end BattleAICmd_if_random_2

	thumb_func_start BattleAICmd_unk_47
BattleAICmd_unk_47: @ 810942C
	ldr r2, _08109438 @ =0x02016800
	ldrb r1, [r2, 0x10]
	movs r0, 0xD
	orrs r0, r1
	strb r0, [r2, 0x10]
	bx lr
	.align 2, 0
_08109438: .4byte 0x02016800
	thumb_func_end BattleAICmd_unk_47

	thumb_func_start BattleAICmd_get_hold_effect
BattleAICmd_get_hold_effect: @ 810943C
	push {r4,lr}
	ldr r0, _0810944C @ =gUnknown_02039238
	ldr r0, [r0]
	ldrb r0, [r0, 0x1]
	cmp r0, 0x1
	bne _08109454
	ldr r0, _08109450 @ =gUnknown_02024C07
	b _08109456
	.align 2, 0
_0810944C: .4byte gUnknown_02039238
_08109450: .4byte gUnknown_02024C07
_08109454:
	ldr r0, _0810947C @ =gUnknown_02024C08
_08109456:
	ldrb r4, [r0]
	adds r0, r4, 0
	bl battle_side_get_owner
	lsls r0, 24
	cmp r0, 0
	bne _08109488
	adds r0, r4, 0
	bl battle_get_per_side_status
	movs r1, 0x1
	ands r1, r0
	ldr r2, _08109480 @ =0x02016800
	ldr r3, _08109484 @ =0x00000222
	adds r0, r2, r3
	adds r1, r0
	ldrb r0, [r1]
	str r0, [r2, 0x8]
	b _0810949E
	.align 2, 0
_0810947C: .4byte gUnknown_02024C08
_08109480: .4byte 0x02016800
_08109484: .4byte 0x00000222
_08109488:
	ldr r1, _081094AC @ =gBattleMons
	movs r0, 0x58
	muls r0, r4
	adds r0, r1
	ldrh r0, [r0, 0x2E]
	bl ItemId_GetHoldEffect
	ldr r1, _081094B0 @ =0x02016800
	lsls r0, 24
	lsrs r0, 24
	str r0, [r1, 0x8]
_0810949E:
	ldr r1, _081094B4 @ =gUnknown_02039238
	ldr r0, [r1]
	adds r0, 0x2
	str r0, [r1]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_081094AC: .4byte gBattleMons
_081094B0: .4byte 0x02016800
_081094B4: .4byte gUnknown_02039238
	thumb_func_end BattleAICmd_get_hold_effect

	thumb_func_start BattleAICmd_get_gender
BattleAICmd_get_gender: @ 81094B8
	push {lr}
	ldr r0, _081094C8 @ =gUnknown_02039238
	ldr r0, [r0]
	ldrb r0, [r0, 0x1]
	cmp r0, 0x1
	bne _081094D0
	ldr r0, _081094CC @ =gUnknown_02024C07
	b _081094D2
	.align 2, 0
_081094C8: .4byte gUnknown_02039238
_081094CC: .4byte gUnknown_02024C07
_081094D0:
	ldr r0, _081094FC @ =gUnknown_02024C08
_081094D2:
	ldrb r1, [r0]
	ldr r2, _08109500 @ =gBattleMons
	movs r0, 0x58
	muls r1, r0
	adds r0, r1, r2
	ldrh r0, [r0]
	adds r2, 0x48
	adds r1, r2
	ldr r1, [r1]
	bl GetGenderFromSpeciesAndPersonality
	ldr r1, _08109504 @ =0x02016800
	lsls r0, 24
	lsrs r0, 24
	str r0, [r1, 0x8]
	ldr r1, _08109508 @ =gUnknown_02039238
	ldr r0, [r1]
	adds r0, 0x2
	str r0, [r1]
	pop {r0}
	bx r0
	.align 2, 0
_081094FC: .4byte gUnknown_02024C08
_08109500: .4byte gBattleMons
_08109504: .4byte 0x02016800
_08109508: .4byte gUnknown_02039238
	thumb_func_end BattleAICmd_get_gender

	thumb_func_start BattleAICmd_is_first_turn
BattleAICmd_is_first_turn: @ 810950C
	push {r4,lr}
	ldr r0, _08109520 @ =gUnknown_02039238
	ldr r1, [r0]
	ldrb r1, [r1, 0x1]
	adds r4, r0, 0
	cmp r1, 0x1
	bne _08109528
	ldr r0, _08109524 @ =gUnknown_02024C07
	b _0810952A
	.align 2, 0
_08109520: .4byte gUnknown_02039238
_08109524: .4byte gUnknown_02024C07
_08109528:
	ldr r0, _08109548 @ =gUnknown_02024C08
_0810952A:
	ldrb r3, [r0]
	ldr r2, _0810954C @ =0x02016800
	ldr r1, _08109550 @ =gUnknown_02024CA8
	lsls r0, r3, 3
	subs r0, r3
	lsls r0, 2
	adds r0, r1
	ldrb r0, [r0, 0x16]
	str r0, [r2, 0x8]
	ldr r0, [r4]
	adds r0, 0x2
	str r0, [r4]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08109548: .4byte gUnknown_02024C08
_0810954C: .4byte 0x02016800
_08109550: .4byte gUnknown_02024CA8
	thumb_func_end BattleAICmd_is_first_turn

	thumb_func_start BattleAICmd_get_stockpile_count
BattleAICmd_get_stockpile_count: @ 8109554
	push {r4,lr}
	ldr r0, _08109568 @ =gUnknown_02039238
	ldr r1, [r0]
	ldrb r1, [r1, 0x1]
	adds r4, r0, 0
	cmp r1, 0x1
	bne _08109570
	ldr r0, _0810956C @ =gUnknown_02024C07
	b _08109572
	.align 2, 0
_08109568: .4byte gUnknown_02039238
_0810956C: .4byte gUnknown_02024C07
_08109570:
	ldr r0, _08109590 @ =gUnknown_02024C08
_08109572:
	ldrb r3, [r0]
	ldr r2, _08109594 @ =0x02016800
	ldr r1, _08109598 @ =gUnknown_02024CA8
	lsls r0, r3, 3
	subs r0, r3
	lsls r0, 2
	adds r0, r1
	ldrb r0, [r0, 0x9]
	str r0, [r2, 0x8]
	ldr r0, [r4]
	adds r0, 0x2
	str r0, [r4]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08109590: .4byte gUnknown_02024C08
_08109594: .4byte 0x02016800
_08109598: .4byte gUnknown_02024CA8
	thumb_func_end BattleAICmd_get_stockpile_count

	thumb_func_start BattleAICmd_unk_4C
BattleAICmd_unk_4C: @ 810959C
	ldr r2, _081095B4 @ =0x02016800
	ldr r0, _081095B8 @ =gUnknown_020239F8
	ldrh r1, [r0]
	movs r0, 0x1
	ands r0, r1
	str r0, [r2, 0x8]
	ldr r1, _081095BC @ =gUnknown_02039238
	ldr r0, [r1]
	adds r0, 0x1
	str r0, [r1]
	bx lr
	.align 2, 0
_081095B4: .4byte 0x02016800
_081095B8: .4byte gUnknown_020239F8
_081095BC: .4byte gUnknown_02039238
	thumb_func_end BattleAICmd_unk_4C

	thumb_func_start BattleAICmd_get_item
BattleAICmd_get_item: @ 81095C0
	push {lr}
	ldr r0, _081095D4 @ =gUnknown_02039238
	ldr r1, [r0]
	ldrb r1, [r1, 0x1]
	adds r2, r0, 0
	cmp r1, 0x1
	bne _081095DC
	ldr r0, _081095D8 @ =gUnknown_02024C07
	b _081095DE
	.align 2, 0
_081095D4: .4byte gUnknown_02039238
_081095D8: .4byte gUnknown_02024C07
_081095DC:
	ldr r0, _081095F8 @ =gUnknown_02024C08
_081095DE:
	ldrb r0, [r0]
	ldr r1, _081095FC @ =0x02016800
	lsls r0, 1
	adds r0, r1
	ldr r3, _08109600 @ =0xfffff8cc
	adds r0, r3
	ldrb r0, [r0]
	str r0, [r1, 0x8]
	ldr r0, [r2]
	adds r0, 0x2
	str r0, [r2]
	pop {r0}
	bx r0
	.align 2, 0
_081095F8: .4byte gUnknown_02024C08
_081095FC: .4byte 0x02016800
_08109600: .4byte 0xfffff8cc
	thumb_func_end BattleAICmd_get_item

	thumb_func_start BattleAICmd_unk_4E
BattleAICmd_unk_4E: @ 8109604
	ldr r3, _08109620 @ =0x02016800
	ldr r2, _08109624 @ =gBattleMoves
	ldr r1, [r3, 0x8]
	lsls r0, r1, 1
	adds r0, r1
	lsls r0, 2
	adds r0, r2
	ldrb r0, [r0, 0x2]
	str r0, [r3, 0x8]
	ldr r1, _08109628 @ =gUnknown_02039238
	ldr r0, [r1]
	adds r0, 0x1
	str r0, [r1]
	bx lr
	.align 2, 0
_08109620: .4byte 0x02016800
_08109624: .4byte gBattleMoves
_08109628: .4byte gUnknown_02039238
	thumb_func_end BattleAICmd_unk_4E

	thumb_func_start BattleAICmd_unk_4F
BattleAICmd_unk_4F: @ 810962C
	ldr r3, _08109648 @ =0x02016800
	ldr r2, _0810964C @ =gBattleMoves
	ldr r1, [r3, 0x8]
	lsls r0, r1, 1
	adds r0, r1
	lsls r0, 2
	adds r0, r2
	ldrb r0, [r0, 0x1]
	str r0, [r3, 0x8]
	ldr r1, _08109650 @ =gUnknown_02039238
	ldr r0, [r1]
	adds r0, 0x1
	str r0, [r1]
	bx lr
	.align 2, 0
_08109648: .4byte 0x02016800
_0810964C: .4byte gBattleMoves
_08109650: .4byte gUnknown_02039238
	thumb_func_end BattleAICmd_unk_4F

	thumb_func_start BattleAICmd_unk_50
BattleAICmd_unk_50: @ 8109654
	ldr r3, _08109670 @ =0x02016800
	ldr r2, _08109674 @ =gBattleMoves
	ldr r1, [r3, 0x8]
	lsls r0, r1, 1
	adds r0, r1
	lsls r0, 2
	adds r0, r2
	ldrb r0, [r0]
	str r0, [r3, 0x8]
	ldr r1, _08109678 @ =gUnknown_02039238
	ldr r0, [r1]
	adds r0, 0x1
	str r0, [r1]
	bx lr
	.align 2, 0
_08109670: .4byte 0x02016800
_08109674: .4byte gBattleMoves
_08109678: .4byte gUnknown_02039238
	thumb_func_end BattleAICmd_unk_50

	thumb_func_start BattleAICmd_get_protect_count
BattleAICmd_get_protect_count: @ 810967C
	push {r4,lr}
	ldr r0, _08109690 @ =gUnknown_02039238
	ldr r1, [r0]
	ldrb r1, [r1, 0x1]
	adds r4, r0, 0
	cmp r1, 0x1
	bne _08109698
	ldr r0, _08109694 @ =gUnknown_02024C07
	b _0810969A
	.align 2, 0
_08109690: .4byte gUnknown_02039238
_08109694: .4byte gUnknown_02024C07
_08109698:
	ldr r0, _081096B8 @ =gUnknown_02024C08
_0810969A:
	ldrb r3, [r0]
	ldr r2, _081096BC @ =0x02016800
	ldr r1, _081096C0 @ =gUnknown_02024CA8
	lsls r0, r3, 3
	subs r0, r3
	lsls r0, 2
	adds r0, r1
	ldrb r0, [r0, 0x8]
	str r0, [r2, 0x8]
	ldr r0, [r4]
	adds r0, 0x2
	str r0, [r4]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_081096B8: .4byte gUnknown_02024C08
_081096BC: .4byte 0x02016800
_081096C0: .4byte gUnknown_02024CA8
	thumb_func_end BattleAICmd_get_protect_count

	thumb_func_start BattleAICmd_unk_52
BattleAICmd_unk_52: @ 81096C4
	bx lr
	thumb_func_end BattleAICmd_unk_52

	thumb_func_start BattleAICmd_unk_53
BattleAICmd_unk_53: @ 81096C8
	bx lr
	thumb_func_end BattleAICmd_unk_53

	thumb_func_start BattleAICmd_unk_54
BattleAICmd_unk_54: @ 81096CC
	bx lr
	thumb_func_end BattleAICmd_unk_54

	thumb_func_start BattleAICmd_unk_55
BattleAICmd_unk_55: @ 81096D0
	bx lr
	thumb_func_end BattleAICmd_unk_55

	thumb_func_start BattleAICmd_unk_56
BattleAICmd_unk_56: @ 81096D4
	bx lr
	thumb_func_end BattleAICmd_unk_56

	thumb_func_start BattleAICmd_unk_57
BattleAICmd_unk_57: @ 81096D8
	bx lr
	thumb_func_end BattleAICmd_unk_57

	thumb_func_start BattleAICmd_call
BattleAICmd_call: @ 81096DC
	push {r4,lr}
	ldr r4, _08109708 @ =gUnknown_02039238
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
_08109708: .4byte gUnknown_02039238
	thumb_func_end BattleAICmd_call

	thumb_func_start BattleAICmd_jump
BattleAICmd_jump: @ 810970C
	ldr r3, _08109728 @ =gUnknown_02039238
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
_08109728: .4byte gUnknown_02039238
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
	ldr r5, _08109764 @ =gUnknown_02039238
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
_08109764: .4byte gUnknown_02039238
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
	ldr r3, _08109860 @ =gUnknown_02039238
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
_08109860: .4byte gUnknown_02039238
_08109864:
	ldr r1, _08109870 @ =gUnknown_02039238
	ldr r0, [r1]
	adds r0, 0x5
	str r0, [r1]
_0810986C:
	pop {r0}
	bx r0
	.align 2, 0
_08109870: .4byte gUnknown_02039238
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
	ldr r3, _081098B0 @ =gUnknown_02039238
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
_081098B0: .4byte gUnknown_02039238
_081098B4:
	ldr r1, _081098C0 @ =gUnknown_02039238
	ldr r0, [r1]
	adds r0, 0x5
	str r0, [r1]
_081098BC:
	pop {r0}
	bx r0
	.align 2, 0
_081098C0: .4byte gUnknown_02039238
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
	ldr r1, _08109904 @ =gUnknown_02039238
	ldr r1, [r1]
	str r1, [r0]
	bx lr
	.align 2, 0
_08109900: .4byte 0x02016c00
_08109904: .4byte gUnknown_02039238
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
	ldr r1, _08109938 @ =gUnknown_02039238
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
_08109938: .4byte gUnknown_02039238
	thumb_func_end sub_8109908

	.align 2, 0 @ Don't pad with nop.
