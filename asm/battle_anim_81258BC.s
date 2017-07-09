	.include "constants/gba_constants.inc"
	.include "constants/species_constants.inc"
	.include "asm/macros.inc"

	.syntax unified

	.text
	
	thumb_func_start unref_sub_812AECC
unref_sub_812AECC: @ 812AECC
	push {lr}
	bl sub_812613C
	lsls r0, 24
	lsrs r0, 24
	adds r1, r0, 0
	cmp r0, 0x1
	beq _0812AEEA
	cmp r0, 0x1
	ble _0812AF08
	cmp r1, 0x2
	beq _0812AEF4
	cmp r1, 0x3
	beq _0812AEFA
	b _0812AF08
_0812AEEA:
	movs r0, 0x16
	bl PlaySE
	movs r0, 0x1
	b _0812AF0A
_0812AEF4:
	bl sub_812AF10
	b _0812AF08
_0812AEFA:
	movs r0, 0x16
	bl PlaySE
	bl sub_812AF10
	movs r0, 0x1
	b _0812AF0A
_0812AF08:
	movs r0, 0
_0812AF0A:
	pop {r1}
	bx r1
	thumb_func_end unref_sub_812AECC

	thumb_func_start sub_812AF10
sub_812AF10: @ 812AF10
	push {lr}
	movs r0, 0x2
	movs r1, 0xE
	movs r2, 0x1B
	movs r3, 0x13
	bl MenuDrawTextWindow
	ldr r0, _0812AF2C @ =gStringVar4
	movs r1, 0x3
	movs r2, 0xF
	bl MenuPrint
	pop {r0}
	bx r0
	.align 2, 0
_0812AF2C: .4byte gStringVar4
	thumb_func_end sub_812AF10

	thumb_func_start sub_812AF30
sub_812AF30: @ 812AF30
	push {r4-r6,lr}
	lsls r0, 24
	lsrs r0, 24
	ldr r1, _0812AF8C @ =gTasks
	lsls r6, r0, 2
	adds r6, r0
	lsls r6, 3
	adds r6, r1
	ldr r1, _0812AF90 @ =gBattleAnimArgs
	ldrh r0, [r1]
	strh r0, [r6, 0x8]
	ldrh r0, [r1, 0x2]
	strh r0, [r6, 0xA]
	movs r0, 0x40
	negs r0, r0
	bl sub_8076F98
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	movs r0, 0x3F
	bl sub_8076F98
	adds r5, r0, 0
	lsls r4, 24
	asrs r4, 24
	lsls r5, 24
	asrs r5, 24
	adds r0, r4, 0
	adds r1, r5, 0
	movs r2, 0x2
	bl sub_807712C
	strh r4, [r6, 0xC]
	strh r5, [r6, 0xE]
	lsls r0, 24
	asrs r0, 24
	strh r0, [r6, 0x10]
	movs r0, 0xA
	strh r0, [r6, 0x1C]
	ldr r0, _0812AF94 @ =sub_812AF98
	str r0, [r6]
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_0812AF8C: .4byte gTasks
_0812AF90: .4byte gBattleAnimArgs
_0812AF94: .4byte sub_812AF98
	thumb_func_end sub_812AF30

	thumb_func_start sub_812AF98
sub_812AF98: @ 812AF98
	push {r4-r6,lr}
	lsls r0, 24
	lsrs r0, 24
	ldr r2, _0812AFC8 @ =gTasks
	lsls r1, r0, 2
	adds r1, r0
	lsls r1, 3
	adds r4, r1, r2
	ldrh r5, [r4, 0xC]
	ldrb r6, [r4, 0x10]
	ldrh r0, [r4, 0x1E]
	adds r0, 0x1
	movs r1, 0
	strh r0, [r4, 0x1E]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x6F
	bne _0812AFD0
	movs r0, 0x5
	strh r0, [r4, 0x1C]
	strh r1, [r4, 0x1E]
	ldr r0, _0812AFCC @ =sub_812B004
	str r0, [r4]
	b _0812AFFE
	.align 2, 0
_0812AFC8: .4byte gTasks
_0812AFCC: .4byte sub_812B004
_0812AFD0:
	ldrh r0, [r4, 0x1C]
	adds r0, 0x1
	strh r0, [r4, 0x1C]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0xB
	bne _0812AFEA
	strh r1, [r4, 0x1C]
	ldrh r0, [r4, 0x8]
	lsls r1, r5, 24
	asrs r1, 24
	bl PlaySE12WithPanning
_0812AFEA:
	lsls r1, r6, 24
	asrs r1, 24
	lsls r0, r5, 16
	asrs r0, 16
	adds r0, r1
	lsls r0, 16
	asrs r0, 16
	bl sub_8077104
	strh r0, [r4, 0xC]
_0812AFFE:
	pop {r4-r6}
	pop {r0}
	bx r0
	thumb_func_end sub_812AF98

	thumb_func_start sub_812B004
sub_812B004: @ 812B004
	push {r4,r5,lr}
	lsls r0, 24
	lsrs r5, r0, 24
	ldr r1, _0812B054 @ =gTasks
	lsls r0, r5, 2
	adds r0, r5
	lsls r0, 3
	adds r4, r0, r1
	ldrh r0, [r4, 0x1C]
	adds r0, 0x1
	strh r0, [r4, 0x1C]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x6
	bne _0812B04C
	movs r0, 0
	strh r0, [r4, 0x1C]
	movs r0, 0x3F
	bl sub_8076F98
	adds r1, r0, 0
	ldrh r0, [r4, 0xA]
	lsls r1, 24
	asrs r1, 24
	bl PlaySE12WithPanning
	ldrh r0, [r4, 0x1E]
	adds r0, 0x1
	strh r0, [r4, 0x1E]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x2
	bne _0812B04C
	adds r0, r5, 0
	bl DestroyAnimSoundTask
_0812B04C:
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_0812B054: .4byte gTasks
	thumb_func_end sub_812B004

	thumb_func_start sub_812B058
sub_812B058: @ 812B058
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	sub sp, 0x4
	mov r8, r0
	lsls r0, 24
	lsrs r0, 24
	mov r8, r0
	ldr r0, _0812B0FC @ =gBattleAnimArgs
	ldrh r1, [r0]
	str r1, [sp]
	ldrb r5, [r0, 0x4]
	ldrb r6, [r0, 0x6]
	ldrb r3, [r0, 0x8]
	mov r10, r3
	ldrb r7, [r0, 0xA]
	ldrb r1, [r0, 0xC]
	mov r9, r1
	ldrb r0, [r0, 0x2]
	lsls r0, 24
	asrs r0, 24
	bl sub_8076F98
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	lsls r5, 24
	asrs r5, 24
	adds r0, r5, 0
	bl sub_8076F98
	adds r5, r0, 0
	lsls r4, 24
	asrs r4, 24
	lsls r5, 24
	asrs r5, 24
	lsls r6, 24
	asrs r6, 24
	adds r0, r4, 0
	adds r1, r5, 0
	adds r2, r6, 0
	bl sub_807712C
	ldr r2, _0812B100 @ =gTasks
	mov r3, r8
	lsls r1, r3, 2
	add r1, r8
	lsls r1, 3
	adds r1, r2
	movs r2, 0
	mov r6, sp
	ldrh r6, [r6]
	strh r6, [r1, 0x8]
	strh r4, [r1, 0xA]
	strh r5, [r1, 0xC]
	lsls r0, 24
	asrs r0, 24
	strh r0, [r1, 0xE]
	mov r0, r10
	strh r0, [r1, 0x10]
	strh r7, [r1, 0x12]
	mov r3, r9
	strh r3, [r1, 0x14]
	strh r2, [r1, 0x1C]
	strh r4, [r1, 0x1E]
	strh r3, [r1, 0x20]
	ldr r2, _0812B104 @ =sub_812B108
	str r2, [r1]
	mov r0, r8
	bl _call_via_r2
	add sp, 0x4
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_0812B0FC: .4byte gBattleAnimArgs
_0812B100: .4byte gTasks
_0812B104: .4byte sub_812B108
	thumb_func_end sub_812B058

	thumb_func_start sub_812B108
sub_812B108: @ 812B108
	push {r4,r5,lr}
	lsls r0, 24
	lsrs r5, r0, 24
	ldr r1, _0812B14C @ =gTasks
	lsls r0, r5, 2
	adds r0, r5
	lsls r0, 3
	adds r4, r0, r1
	ldrh r0, [r4, 0x20]
	adds r1, r0, 0x1
	strh r1, [r4, 0x20]
	lsls r0, 16
	asrs r0, 16
	movs r2, 0x14
	ldrsh r1, [r4, r2]
	cmp r0, r1
	bne _0812B150
	movs r0, 0
	strh r0, [r4, 0x20]
	ldrh r0, [r4, 0x8]
	movs r1, 0x1E
	ldrsb r1, [r4, r1]
	bl PlaySE12WithPanning
	ldrh r0, [r4, 0x10]
	subs r0, 0x1
	strh r0, [r4, 0x10]
	lsls r0, 16
	cmp r0, 0
	bne _0812B150
	adds r0, r5, 0
	bl DestroyAnimSoundTask
	b _0812B182
	.align 2, 0
_0812B14C: .4byte gTasks
_0812B150:
	ldr r1, _0812B188 @ =gTasks
	lsls r0, r5, 2
	adds r0, r5
	lsls r0, 3
	adds r4, r0, r1
	ldrh r0, [r4, 0x1C]
	adds r1, r0, 0x1
	strh r1, [r4, 0x1C]
	lsls r0, 16
	asrs r0, 16
	movs r2, 0x12
	ldrsh r1, [r4, r2]
	cmp r0, r1
	bne _0812B182
	movs r0, 0
	strh r0, [r4, 0x1C]
	ldrh r0, [r4, 0xE]
	ldrh r1, [r4, 0x1E]
	adds r0, r1
	strh r0, [r4, 0x1E]
	movs r2, 0x1E
	ldrsh r0, [r4, r2]
	bl sub_8077104
	strh r0, [r4, 0x1E]
_0812B182:
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_0812B188: .4byte gTasks
	thumb_func_end sub_812B108

	thumb_func_start sub_812B18C
sub_812B18C: @ 812B18C
	push {r4-r6,lr}
	lsls r0, 24
	lsrs r5, r0, 24
	movs r4, 0
	movs r0, 0x40
	negs r0, r0
	bl sub_8076F98
	lsls r0, 24
	lsrs r6, r0, 24
	bl IsContest
	lsls r0, 24
	cmp r0, 0
	beq _0812B1CC
	ldr r0, _0812B1BC @ =gBattleAnimArgs
	movs r1, 0
	ldrsh r0, [r0, r1]
	cmp r0, 0
	bne _0812B1C4
	ldr r0, _0812B1C0 @ =0x02019348
	ldrh r4, [r0]
	b _0812B272
	.align 2, 0
_0812B1BC: .4byte gBattleAnimArgs
_0812B1C0: .4byte 0x02019348
_0812B1C4:
	adds r0, r5, 0
	bl DestroyAnimVisualTask
	b _0812B272
_0812B1CC:
	ldr r0, _0812B1E0 @ =gBattleAnimArgs
	movs r2, 0
	ldrsh r1, [r0, r2]
	adds r2, r0, 0
	cmp r1, 0
	bne _0812B1E8
	ldr r0, _0812B1E4 @ =gBattleAnimPlayerMonIndex
	ldrb r4, [r0]
	b _0812B20E
	.align 2, 0
_0812B1E0: .4byte gBattleAnimArgs
_0812B1E4: .4byte gBattleAnimPlayerMonIndex
_0812B1E8:
	cmp r1, 0x1
	bne _0812B1F8
	ldr r0, _0812B1F4 @ =gBattleAnimEnemyMonIndex
	ldrb r4, [r0]
	b _0812B20E
	.align 2, 0
_0812B1F4: .4byte gBattleAnimEnemyMonIndex
_0812B1F8:
	cmp r1, 0x2
	bne _0812B204
	ldr r0, _0812B200 @ =gBattleAnimPlayerMonIndex
	b _0812B206
	.align 2, 0
_0812B200: .4byte gBattleAnimPlayerMonIndex
_0812B204:
	ldr r0, _0812B230 @ =gBattleAnimEnemyMonIndex
_0812B206:
	ldrb r1, [r0]
	movs r0, 0x2
	adds r4, r0, 0
	eors r4, r1
_0812B20E:
	movs r1, 0
	ldrsh r0, [r2, r1]
	cmp r0, 0x1
	beq _0812B21A
	cmp r0, 0x3
	bne _0812B234
_0812B21A:
	adds r0, r4, 0
	bl b_side_obj__get_some_boolean
	lsls r0, 24
	cmp r0, 0
	bne _0812B234
	adds r0, r5, 0
	bl DestroyAnimVisualTask
	b _0812B2B0
	.align 2, 0
_0812B230: .4byte gBattleAnimEnemyMonIndex
_0812B234:
	adds r0, r4, 0
	bl GetBankSide
	lsls r0, 24
	cmp r0, 0
	beq _0812B258
	ldr r1, _0812B250 @ =gBattlePartyID
	lsls r0, r4, 1
	adds r0, r1
	ldrh r1, [r0]
	movs r0, 0x64
	muls r0, r1
	ldr r1, _0812B254 @ =gEnemyParty
	b _0812B266
	.align 2, 0
_0812B250: .4byte gBattlePartyID
_0812B254: .4byte gEnemyParty
_0812B258:
	ldr r1, _0812B290 @ =gBattlePartyID
	lsls r0, r4, 1
	adds r0, r1
	ldrh r1, [r0]
	movs r0, 0x64
	muls r0, r1
	ldr r1, _0812B294 @ =gPlayerParty
_0812B266:
	adds r0, r1
	movs r1, 0xB
	bl GetMonData
	lsls r0, 16
	lsrs r4, r0, 16
_0812B272:
	cmp r4, 0
	beq _0812B2AA
	ldr r0, _0812B298 @ =gBattleAnimArgs
	ldrh r2, [r0, 0x2]
	movs r1, 0x2
	ldrsh r0, [r0, r1]
	cmp r0, 0xFF
	bne _0812B29C
	lsls r1, r6, 24
	asrs r1, 24
	adds r0, r4, 0
	bl PlayCry1
	b _0812B2AA
	.align 2, 0
_0812B290: .4byte gBattlePartyID
_0812B294: .4byte gPlayerParty
_0812B298: .4byte gBattleAnimArgs
_0812B29C:
	lsls r1, r6, 24
	asrs r1, 24
	lsls r2, 24
	lsrs r2, 24
	adds r0, r4, 0
	bl PlayCry3
_0812B2AA:
	adds r0, r5, 0
	bl DestroyAnimVisualTask
_0812B2B0:
	pop {r4-r6}
	pop {r0}
	bx r0
	thumb_func_end sub_812B18C

	thumb_func_start sub_812B2B8
sub_812B2B8: @ 812B2B8
	push {r4,r5,lr}
	lsls r0, 24
	lsrs r5, r0, 24
	movs r0, 0x40
	negs r0, r0
	bl sub_8076F98
	lsls r0, 24
	lsrs r4, r0, 24
	bl IsContest
	lsls r0, 24
	cmp r0, 0
	beq _0812B2DC
	ldr r0, _0812B2D8 @ =0x02019348
	b _0812B2E6
	.align 2, 0
_0812B2D8: .4byte 0x02019348
_0812B2DC:
	ldr r1, _0812B304 @ =gUnknown_0202F7CA
	ldr r0, _0812B308 @ =gBattleAnimPlayerMonIndex
	ldrb r0, [r0]
	lsls r0, 1
	adds r0, r1
_0812B2E6:
	ldrh r0, [r0]
	cmp r0, 0
	beq _0812B2F6
	lsls r1, r4, 24
	asrs r1, 24
	movs r2, 0x4
	bl PlayCry3
_0812B2F6:
	adds r0, r5, 0
	bl DestroyAnimVisualTask
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_0812B304: .4byte gUnknown_0202F7CA
_0812B308: .4byte gBattleAnimPlayerMonIndex
	thumb_func_end sub_812B2B8

	thumb_func_start sub_812B30C
sub_812B30C: @ 812B30C
	push {r4,r5,lr}
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	ldr r0, _0812B33C @ =gBattleAnimArgs
	ldrh r5, [r0]
	ldrb r0, [r0, 0x2]
	lsls r0, 24
	asrs r0, 24
	bl sub_8076F98
	adds r1, r0, 0
	lsls r1, 24
	asrs r1, 24
	adds r0, r5, 0
	bl PlaySE1WithPanning
	adds r0, r4, 0
	bl DestroyAnimVisualTask
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_0812B33C: .4byte gBattleAnimArgs
	thumb_func_end sub_812B30C

	thumb_func_start sub_812B340
sub_812B340: @ 812B340
	push {r4,r5,lr}
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	ldr r0, _0812B370 @ =gBattleAnimArgs
	ldrh r5, [r0]
	ldrb r0, [r0, 0x2]
	lsls r0, 24
	asrs r0, 24
	bl sub_8076F98
	adds r1, r0, 0
	lsls r1, 24
	asrs r1, 24
	adds r0, r5, 0
	bl PlaySE2WithPanning
	adds r0, r4, 0
	bl DestroyAnimVisualTask
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_0812B370: .4byte gBattleAnimArgs
	thumb_func_end sub_812B340

	thumb_func_start sub_812B374
sub_812B374: @ 812B374
	push {r4-r6,lr}
	mov r6, r9
	mov r5, r8
	push {r5,r6}
	mov r8, r0
	lsls r0, 24
	lsrs r0, 24
	mov r8, r0
	ldr r0, _0812B3F8 @ =gBattleAnimArgs
	ldrb r5, [r0, 0x2]
	ldrb r6, [r0, 0x4]
	ldrh r1, [r0, 0x6]
	mov r9, r1
	ldrb r0, [r0]
	lsls r0, 24
	asrs r0, 24
	bl sub_8076F98
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	lsls r5, 24
	asrs r5, 24
	adds r0, r5, 0
	bl sub_8076F98
	adds r5, r0, 0
	lsls r4, 24
	asrs r4, 24
	lsls r5, 24
	asrs r5, 24
	lsls r6, 24
	asrs r6, 24
	adds r0, r4, 0
	adds r1, r5, 0
	adds r2, r6, 0
	bl sub_807712C
	ldr r2, _0812B3FC @ =gTasks
	mov r3, r8
	lsls r1, r3, 2
	add r1, r8
	lsls r1, 3
	adds r1, r2
	movs r2, 0
	strh r4, [r1, 0xA]
	strh r5, [r1, 0xC]
	lsls r0, 24
	asrs r0, 24
	strh r0, [r1, 0xE]
	mov r0, r9
	strh r0, [r1, 0x12]
	strh r2, [r1, 0x1C]
	strh r4, [r1, 0x1E]
	ldr r2, _0812B400 @ =sub_812B404
	str r2, [r1]
	mov r0, r8
	bl _call_via_r2
	pop {r3,r4}
	mov r8, r3
	mov r9, r4
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_0812B3F8: .4byte gBattleAnimArgs
_0812B3FC: .4byte gTasks
_0812B400: .4byte sub_812B404
	thumb_func_end sub_812B374

	thumb_func_start sub_812B404
sub_812B404: @ 812B404
	push {r4,r5,lr}
	lsls r0, 24
	lsrs r0, 24
	adds r5, r0, 0
	ldr r1, _0812B45C @ =gTasks
	lsls r0, r5, 2
	adds r0, r5
	lsls r0, 3
	adds r4, r0, r1
	ldrh r2, [r4, 0xE]
	ldrh r0, [r4, 0x1C]
	adds r1, r0, 0x1
	strh r1, [r4, 0x1C]
	lsls r0, 16
	asrs r0, 16
	movs r3, 0x12
	ldrsh r1, [r4, r3]
	cmp r0, r1
	bne _0812B43E
	movs r0, 0
	strh r0, [r4, 0x1C]
	ldrh r1, [r4, 0x1E]
	adds r0, r2, r1
	strh r0, [r4, 0x1E]
	movs r2, 0x1E
	ldrsh r0, [r4, r2]
	bl sub_8077104
	strh r0, [r4, 0x1E]
_0812B43E:
	ldr r1, _0812B460 @ =gUnknown_0202F7D2
	ldrh r0, [r4, 0x1E]
	strb r0, [r1]
	movs r3, 0x1E
	ldrsh r1, [r4, r3]
	movs r2, 0xC
	ldrsh r0, [r4, r2]
	cmp r1, r0
	bne _0812B456
	adds r0, r5, 0
	bl DestroyAnimVisualTask
_0812B456:
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_0812B45C: .4byte gTasks
_0812B460: .4byte gUnknown_0202F7D2
	thumb_func_end sub_812B404

	thumb_func_start unref_sub_812B464
unref_sub_812B464: @ 812B464
	bx lr
	thumb_func_end unref_sub_812B464

	thumb_func_start SetBankFuncToSafariBufferRunCommand
SetBankFuncToSafariBufferRunCommand: @ 812B468
	ldr r1, _0812B478 @ =gBattleBankFunc
	ldr r0, _0812B47C @ =gActiveBank
	ldrb r0, [r0]
	lsls r0, 2
	adds r0, r1
	ldr r1, _0812B480 @ =SafariBufferRunCommand
	str r1, [r0]
	bx lr
	.align 2, 0
_0812B478: .4byte gBattleBankFunc
_0812B47C: .4byte gActiveBank
_0812B480: .4byte SafariBufferRunCommand
	thumb_func_end SetBankFuncToSafariBufferRunCommand

	thumb_func_start SafariBufferRunCommand
SafariBufferRunCommand: @ 812B484
	push {lr}
	ldr r2, _0812B4B8 @ =gBattleExecBuffer
	ldr r1, _0812B4BC @ =gBitTable
	ldr r0, _0812B4C0 @ =gActiveBank
	ldrb r3, [r0]
	lsls r0, r3, 2
	adds r0, r1
	ldr r1, [r2]
	ldr r0, [r0]
	ands r1, r0
	cmp r1, 0
	beq _0812B4D0
	ldr r0, _0812B4C4 @ =gBattleBufferA
	lsls r1, r3, 9
	adds r1, r0
	ldrb r0, [r1]
	cmp r0, 0x38
	bhi _0812B4CC
	ldr r0, _0812B4C8 @ =gSafariBufferCommands
	ldrb r1, [r1]
	lsls r1, 2
	adds r1, r0
	ldr r0, [r1]
	bl _call_via_r0
	b _0812B4D0
	.align 2, 0
_0812B4B8: .4byte gBattleExecBuffer
_0812B4BC: .4byte gBitTable
_0812B4C0: .4byte gActiveBank
_0812B4C4: .4byte gBattleBufferA
_0812B4C8: .4byte gSafariBufferCommands
_0812B4CC:
	bl SafariBufferExecCompleted
_0812B4D0:
	pop {r0}
	bx r0
	thumb_func_end SafariBufferRunCommand

	thumb_func_start bx_battle_menu_t6_2
bx_battle_menu_t6_2:
.syntax divided
	push	{r4, r5, lr}
	add	sp, sp, #0xfffffffc
	ldr	r0, ._94
	ldrh	r1, [r0, #0x2e]
	mov	r2, #0x1
	add	r0, r2, #0
	and	r0, r0, r1
	cmp	r0, #0
	beq	._89	@cond_branch
	mov	r0, #0x5
	bl	PlaySE
	bl	DestroyMenuCursor
	ldr	r1, ._94 + 4
	ldr	r0, ._94 + 8
	ldrb	r0, [r0]
	add	r0, r0, r1
	ldrb	r0, [r0]
	cmp	r0, #0x1
	beq	._90	@cond_branch
	cmp	r0, #0x1
	bgt	._91	@cond_branch
	cmp	r0, #0
	beq	._92	@cond_branch
	b	._101
._95:
	.align	2, 0
._94:
	.word	gMain
	.word	gActionSelectionCursor
	.word	gActiveBank
._91:
	cmp	r0, #0x2
	beq	._96	@cond_branch
	cmp	r0, #0x3
	beq	._97	@cond_branch
	b	._101
._92:
	mov	r0, #0x1
	mov	r1, #0x5
	b	._100
._90:
	mov	r0, #0x1
	mov	r1, #0x6
	b	._100
._96:
	mov	r0, #0x1
	mov	r1, #0x7
._100:
	mov	r2, #0x0
	bl	dp01_build_cmdbuf_x21_a_bb
	b	._101
._97:
	mov	r0, #0x1
	mov	r1, #0x8
	mov	r2, #0x0
	bl	dp01_build_cmdbuf_x21_a_bb
._101:
	bl	SafariBufferExecCompleted
	b	._129
._89:
	mov	r3, #0x20
	add	r0, r3, #0
	and	r0, r0, r1
	cmp	r0, #0
	beq	._103	@cond_branch
	ldr	r5, ._107
	ldr	r4, ._107 + 4
	ldrb	r0, [r4]
	add	r0, r0, r5
	ldrb	r1, [r0]
	add	r0, r2, #0
	and	r0, r0, r1
	cmp	r0, #0
	bne	._104	@cond_branch
	b	._129
._104:
	mov	r0, #0x5
	bl	PlaySE
	ldrb	r0, [r4]
	add	r0, r0, r5
	ldrb	r0, [r0]
	bl	nullsub_8
	ldrb	r1, [r4]
	add	r1, r1, r5
	ldrb	r0, [r1]
	mov	r2, #0x1
	b	._111
._108:
	.align	2, 0
._107:
	.word	gActionSelectionCursor
	.word	gActiveBank
._103:
	mov	r0, #0x10
	and	r0, r0, r1
	cmp	r0, #0
	beq	._109	@cond_branch
	ldr	r5, ._112
	ldr	r4, ._112 + 4
	ldrb	r0, [r4]
	add	r0, r0, r5
	ldrb	r1, [r0]
	add	r0, r2, #0
	and	r0, r0, r1
	cmp	r0, #0
	bne	._129	@cond_branch
	mov	r0, #0x5
	bl	PlaySE
	ldrb	r0, [r4]
	add	r0, r0, r5
	ldrb	r0, [r0]
	bl	nullsub_8
	ldrb	r1, [r4]
	add	r1, r1, r5
	ldrb	r0, [r1]
	mov	r2, #0x1
	b	._111
._113:
	.align	2, 0
._112:
	.word	gActionSelectionCursor
	.word	gActiveBank
._109:
	mov	r0, #0x40
	and	r0, r0, r1
	cmp	r0, #0
	beq	._114	@cond_branch
	ldr	r5, ._117
	ldr	r4, ._117 + 4
	ldrb	r0, [r4]
	add	r0, r0, r5
	ldrb	r1, [r0]
	mov	r0, #0x2
	and	r0, r0, r1
	cmp	r0, #0
	beq	._129	@cond_branch
	b	._116
._118:
	.align	2, 0
._117:
	.word	gActionSelectionCursor
	.word	gActiveBank
._114:
	mov	r0, #0x80
	and	r0, r0, r1
	cmp	r0, #0
	beq	._119	@cond_branch
	ldr	r5, ._122
	ldr	r4, ._122 + 4
	ldrb	r0, [r4]
	add	r0, r0, r5
	ldrb	r1, [r0]
	mov	r0, #0x2
	and	r0, r0, r1
	cmp	r0, #0
	bne	._129	@cond_branch
._116:
	mov	r0, #0x5
	bl	PlaySE
	ldrb	r0, [r4]
	add	r0, r0, r5
	ldrb	r0, [r0]
	bl	nullsub_8
	ldrb	r1, [r4]
	add	r1, r1, r5
	ldrb	r0, [r1]
	mov	r2, #0x2
._111:
	eor	r0, r0, r2
	strb	r0, [r1]
	ldrb	r0, [r4]
	add	r0, r0, r5
	ldrb	r0, [r0]
	mov	r1, #0x0
	bl	sub_802E3E4
	b	._129
._123:
	.align	2, 0
._122:
	.word	gActionSelectionCursor
	.word	gActiveBank
._119:
	mov	r0, #0x80
	lsl	r0, r0, #0x1
	and	r0, r0, r1
	cmp	r0, #0
	beq	._124	@cond_branch
	ldr	r0, ._127
	ldrb	r2, [r0]
	lsl	r0, r2, #0x1
	add	r0, r0, r2
	lsl	r0, r0, #0x2
	ldr	r1, ._127 + 4
	add	r0, r0, r1
	ldrb	r1, [r0]
	add	r0, r3, #0
	and	r0, r0, r1
	lsl	r0, r0, #0x18
	lsr	r0, r0, #0x18
	cmp	r0, #0
	bne	._129	@cond_branch
	str	r0, [sp]
	add	r0, r2, #0
	add	r1, r2, #0
	mov	r3, #0x4
	bl	move_anim_start_t3
	b	._129
._128:
	.align	2, 0
._127:
	.word	gActiveBank
	.word	+0x2017810
._124:
	mov	r0, #0x8
	and	r0, r0, r1
	cmp	r0, #0
	beq	._129	@cond_branch
	bl	sub_804454C
._129:
	add	sp, sp, #0x4
	pop	{r4, r5}
	pop	{r0}
	bx	r0
.syntax unified
	thumb_func_end bx_battle_menu_t6_2

	thumb_func_start sub_812B65C
sub_812B65C: @ 812B65C
	push {lr}
	ldr r2, _0812B684 @ =gSprites
	ldr r1, _0812B688 @ =gObjectBankIDs
	ldr r0, _0812B68C @ =gActiveBank
	ldrb r0, [r0]
	adds r0, r1
	ldrb r1, [r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r2, 0x1C
	adds r0, r2
	ldr r1, [r0]
	ldr r0, _0812B690 @ =SpriteCallbackDummy
	cmp r1, r0
	bne _0812B680
	bl SafariBufferExecCompleted
_0812B680:
	pop {r0}
	bx r0
	.align 2, 0
_0812B684: .4byte gSprites
_0812B688: .4byte gObjectBankIDs
_0812B68C: .4byte gActiveBank
_0812B690: .4byte SpriteCallbackDummy
	thumb_func_end sub_812B65C

	thumb_func_start sub_812B694
sub_812B694: @ 812B694
	push {lr}
	ldr r0, _0812B6A8 @ =gUnknown_03004210
	ldrh r0, [r0, 0x16]
	cmp r0, 0
	bne _0812B6A2
	bl SafariBufferExecCompleted
_0812B6A2:
	pop {r0}
	bx r0
	.align 2, 0
_0812B6A8: .4byte gUnknown_03004210
	thumb_func_end sub_812B694

	thumb_func_start sub_812B6AC
sub_812B6AC: @ 812B6AC
	push {lr}
	ldr r0, _0812B6DC @ =gPaletteFade
	ldrb r1, [r0, 0x7]
	movs r0, 0x80
	ands r0, r1
	cmp r0, 0
	bne _0812B6D6
	ldr r2, _0812B6E0 @ =gMain
	ldr r0, _0812B6E4 @ =0x0000043d
	adds r3, r2, r0
	ldrb r1, [r3]
	movs r0, 0x3
	negs r0, r0
	ands r0, r1
	strb r0, [r3]
	ldr r0, _0812B6E8 @ =gPreBattleCallback1
	ldr r0, [r0]
	str r0, [r2]
	ldr r0, [r2, 0x8]
	bl SetMainCallback2
_0812B6D6:
	pop {r0}
	bx r0
	.align 2, 0
_0812B6DC: .4byte gPaletteFade
_0812B6E0: .4byte gMain
_0812B6E4: .4byte 0x0000043d
_0812B6E8: .4byte gPreBattleCallback1
	thumb_func_end sub_812B6AC

	thumb_func_start bx_wait_t6
bx_wait_t6: @ 812B6EC
	push {lr}
	ldr r0, _0812B718 @ =gDoingBattleAnim
	ldrb r0, [r0]
	cmp r0, 0
	beq _0812B70E
	ldr r0, _0812B71C @ =gActiveBank
	ldrb r1, [r0]
	lsls r0, r1, 1
	adds r0, r1
	lsls r0, 2
	ldr r1, _0812B720 @ =0x02017810
	adds r0, r1
	ldrb r1, [r0]
	movs r0, 0x40
	ands r0, r1
	cmp r0, 0
	bne _0812B712
_0812B70E:
	bl SafariBufferExecCompleted
_0812B712:
	pop {r0}
	bx r0
	.align 2, 0
_0812B718: .4byte gDoingBattleAnim
_0812B71C: .4byte gActiveBank
_0812B720: .4byte 0x02017810
	thumb_func_end bx_wait_t6

	thumb_func_start sub_812B724
sub_812B724: @ 812B724
	push {lr}
	ldr r0, _0812B748 @ =gPaletteFade
	ldrb r1, [r0, 0x7]
	movs r0, 0x80
	ands r0, r1
	cmp r0, 0
	bne _0812B744
	ldr r1, _0812B74C @ =gBattleBankFunc
	ldr r0, _0812B750 @ =gActiveBank
	ldrb r0, [r0]
	lsls r0, 2
	adds r0, r1
	ldr r1, _0812B754 @ =sub_812B758
	str r1, [r0]
	bl sub_810BADC
_0812B744:
	pop {r0}
	bx r0
	.align 2, 0
_0812B748: .4byte gPaletteFade
_0812B74C: .4byte gBattleBankFunc
_0812B750: .4byte gActiveBank
_0812B754: .4byte sub_812B758
	thumb_func_end sub_812B724

	thumb_func_start sub_812B758
sub_812B758: @ 812B758
	push {lr}
	ldr r0, _0812B784 @ =gMain
	ldr r1, [r0, 0x4]
	ldr r0, _0812B788 @ =sub_800F808
	cmp r1, r0
	bne _0812B77E
	ldr r0, _0812B78C @ =gPaletteFade
	ldrb r1, [r0, 0x7]
	movs r0, 0x80
	ands r0, r1
	cmp r0, 0
	bne _0812B77E
	ldr r0, _0812B790 @ =gScriptItemId
	ldrh r1, [r0]
	movs r0, 0x1
	bl dp01_build_cmdbuf_x23_aa_0
	bl SafariBufferExecCompleted
_0812B77E:
	pop {r0}
	bx r0
	.align 2, 0
_0812B784: .4byte gMain
_0812B788: .4byte sub_800F808
_0812B78C: .4byte gPaletteFade
_0812B790: .4byte gScriptItemId
	thumb_func_end sub_812B758

	thumb_func_start sub_812B794
sub_812B794: @ 812B794
	push {lr}
	ldr r0, _0812B7B8 @ =gActiveBank
	ldrb r1, [r0]
	lsls r0, r1, 1
	adds r0, r1
	lsls r0, 2
	ldr r1, _0812B7BC @ =0x02017810
	adds r0, r1
	ldrb r1, [r0]
	movs r0, 0x20
	ands r0, r1
	cmp r0, 0
	bne _0812B7B2
	bl SafariBufferExecCompleted
_0812B7B2:
	pop {r0}
	bx r0
	.align 2, 0
_0812B7B8: .4byte gActiveBank
_0812B7BC: .4byte 0x02017810
	thumb_func_end sub_812B794

	thumb_func_start SafariBufferExecCompleted
SafariBufferExecCompleted: @ 812B7C0
	push {r4,lr}
	sub sp, 0x4
	ldr r1, _0812B800 @ =gBattleBankFunc
	ldr r4, _0812B804 @ =gActiveBank
	ldrb r0, [r4]
	lsls r0, 2
	adds r0, r1
	ldr r1, _0812B808 @ =SafariBufferRunCommand
	str r1, [r0]
	ldr r0, _0812B80C @ =gBattleTypeFlags
	ldrh r1, [r0]
	movs r0, 0x2
	ands r0, r1
	cmp r0, 0
	beq _0812B814
	bl GetMultiplayerId
	mov r1, sp
	strb r0, [r1]
	movs r0, 0x2
	movs r1, 0x4
	mov r2, sp
	bl dp01_prepare_buffer_wireless_probably
	ldr r1, _0812B810 @ =gBattleBufferA
	ldrb r0, [r4]
	lsls r0, 9
	adds r0, r1
	movs r1, 0x38
	strb r1, [r0]
	b _0812B826
	.align 2, 0
_0812B800: .4byte gBattleBankFunc
_0812B804: .4byte gActiveBank
_0812B808: .4byte SafariBufferRunCommand
_0812B80C: .4byte gBattleTypeFlags
_0812B810: .4byte gBattleBufferA
_0812B814:
	ldr r2, _0812B830 @ =gBattleExecBuffer
	ldr r1, _0812B834 @ =gBitTable
	ldrb r0, [r4]
	lsls r0, 2
	adds r0, r1
	ldr r1, [r0]
	ldr r0, [r2]
	bics r0, r1
	str r0, [r2]
_0812B826:
	add sp, 0x4
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0812B830: .4byte gBattleExecBuffer
_0812B834: .4byte gBitTable
	thumb_func_end SafariBufferExecCompleted

	thumb_func_start unref_sub_812B838
unref_sub_812B838: @ 812B838
	push {lr}
	ldr r0, _0812B85C @ =gActiveBank
	ldrb r1, [r0]
	lsls r0, r1, 1
	adds r0, r1
	lsls r0, 2
	ldr r1, _0812B860 @ =0x02017810
	adds r0, r1
	ldrb r1, [r0]
	movs r0, 0x10
	ands r0, r1
	cmp r0, 0
	bne _0812B856
	bl SafariBufferExecCompleted
_0812B856:
	pop {r0}
	bx r0
	.align 2, 0
_0812B85C: .4byte gActiveBank
_0812B860: .4byte 0x02017810
	thumb_func_end unref_sub_812B838

	thumb_func_start SafariHandleGetAttributes
SafariHandleGetAttributes: @ 812B864
	push {lr}
	bl SafariBufferExecCompleted
	pop {r0}
	bx r0
	thumb_func_end SafariHandleGetAttributes

	thumb_func_start sub_812B870
sub_812B870: @ 812B870
	push {lr}
	bl SafariBufferExecCompleted
	pop {r0}
	bx r0
	thumb_func_end sub_812B870

	thumb_func_start sub_812B87C
sub_812B87C: @ 812B87C
	push {lr}
	bl SafariBufferExecCompleted
	pop {r0}
	bx r0
	thumb_func_end sub_812B87C

	thumb_func_start sub_812B888
sub_812B888: @ 812B888
	push {lr}
	bl SafariBufferExecCompleted
	pop {r0}
	bx r0
	thumb_func_end sub_812B888

	thumb_func_start sub_812B894
sub_812B894: @ 812B894
	push {lr}
	bl SafariBufferExecCompleted
	pop {r0}
	bx r0
	thumb_func_end sub_812B894

	thumb_func_start sub_812B8A0
sub_812B8A0: @ 812B8A0
	push {lr}
	bl SafariBufferExecCompleted
	pop {r0}
	bx r0
	thumb_func_end sub_812B8A0

	thumb_func_start sub_812B8AC
sub_812B8AC: @ 812B8AC
	push {lr}
	bl SafariBufferExecCompleted
	pop {r0}
	bx r0
	thumb_func_end sub_812B8AC

	thumb_func_start sub_812B8B8
sub_812B8B8: @ 812B8B8
	push {r4-r6,lr}
	ldr r4, _0812B96C @ =gSaveBlock2
	ldrb r0, [r4, 0x8]
	ldr r5, _0812B970 @ =gActiveBank
	ldrb r1, [r5]
	bl sub_8031AF4
	ldrb r6, [r4, 0x8]
	ldrb r0, [r5]
	bl GetBankIdentity
	adds r1, r0, 0
	lsls r1, 24
	lsrs r1, 24
	adds r0, r6, 0
	bl GetMonSpriteTemplate_803C5A0
	ldr r0, _0812B974 @ =gUnknown_02024E8C
	ldr r2, _0812B978 @ =gTrainerBackPicCoords
	ldrb r1, [r4, 0x8]
	lsls r1, 2
	adds r1, r2
	ldrb r1, [r1]
	movs r2, 0x8
	subs r2, r1
	lsls r2, 18
	movs r1, 0xA0
	lsls r1, 15
	adds r2, r1
	asrs r2, 16
	movs r1, 0x50
	movs r3, 0x1E
	bl CreateSprite
	ldr r6, _0812B97C @ =gObjectBankIDs
	ldrb r1, [r5]
	adds r1, r6
	strb r0, [r1]
	ldr r4, _0812B980 @ =gSprites
	ldrb r3, [r5]
	adds r0, r3, r6
	ldrb r0, [r0]
	lsls r1, r0, 4
	adds r1, r0
	lsls r1, 2
	adds r1, r4
	lsls r3, 4
	ldrb r2, [r1, 0x5]
	movs r0, 0xF
	ands r0, r2
	orrs r0, r3
	strb r0, [r1, 0x5]
	ldrb r0, [r5]
	adds r0, r6
	ldrb r1, [r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r4
	movs r1, 0xF0
	strh r1, [r0, 0x24]
	ldrb r0, [r5]
	adds r0, r6
	ldrb r1, [r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r4
	ldr r1, _0812B984 @ =0x0000fffe
	strh r1, [r0, 0x2E]
	ldrb r0, [r5]
	adds r0, r6
	ldrb r1, [r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r4, 0x1C
	adds r0, r4
	ldr r1, _0812B988 @ =sub_80313A0
	str r1, [r0]
	ldr r1, _0812B98C @ =gBattleBankFunc
	ldrb r0, [r5]
	lsls r0, 2
	adds r0, r1
	ldr r1, _0812B990 @ =sub_812B65C
	str r1, [r0]
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_0812B96C: .4byte gSaveBlock2
_0812B970: .4byte gActiveBank
_0812B974: .4byte gUnknown_02024E8C
_0812B978: .4byte gTrainerBackPicCoords
_0812B97C: .4byte gObjectBankIDs
_0812B980: .4byte gSprites
_0812B984: .4byte 0x0000fffe
_0812B988: .4byte sub_80313A0
_0812B98C: .4byte gBattleBankFunc
_0812B990: .4byte sub_812B65C
	thumb_func_end sub_812B8B8

	thumb_func_start sub_812B994
sub_812B994: @ 812B994
	push {lr}
	bl SafariBufferExecCompleted
	pop {r0}
	bx r0
	thumb_func_end sub_812B994

	thumb_func_start sub_812B9A0
sub_812B9A0: @ 812B9A0
	push {lr}
	bl SafariBufferExecCompleted
	pop {r0}
	bx r0
	thumb_func_end sub_812B9A0

	thumb_func_start sub_812B9AC
sub_812B9AC: @ 812B9AC
	push {lr}
	bl SafariBufferExecCompleted
	pop {r0}
	bx r0
	thumb_func_end sub_812B9AC

	thumb_func_start sub_812B9B8
sub_812B9B8: @ 812B9B8
	push {lr}
	bl SafariBufferExecCompleted
	pop {r0}
	bx r0
	thumb_func_end sub_812B9B8

	thumb_func_start sub_812B9C4
sub_812B9C4: @ 812B9C4
	push {r4,r5,lr}
	ldr r1, _0812BA00 @ =0x02017840
	movs r0, 0x4
	strb r0, [r1, 0x8]
	ldr r1, _0812BA04 @ =gDoingBattleAnim
	movs r0, 0x1
	strb r0, [r1]
	ldr r5, _0812BA08 @ =gActiveBank
	ldrb r4, [r5]
	movs r0, 0x1
	bl GetBankByPlayerAI
	adds r2, r0, 0
	lsls r2, 24
	lsrs r2, 24
	adds r0, r4, 0
	adds r1, r4, 0
	movs r3, 0x4
	bl move_anim_start_t4
	ldr r1, _0812BA0C @ =gBattleBankFunc
	ldrb r0, [r5]
	lsls r0, 2
	adds r0, r1
	ldr r1, _0812BA10 @ =bx_wait_t6
	str r1, [r0]
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_0812BA00: .4byte 0x02017840
_0812BA04: .4byte gDoingBattleAnim
_0812BA08: .4byte gActiveBank
_0812BA0C: .4byte gBattleBankFunc
_0812BA10: .4byte bx_wait_t6
	thumb_func_end sub_812B9C4

	thumb_func_start sub_812BA14
sub_812BA14: @ 812BA14
	push {r4,r5,lr}
	ldr r1, _0812BA58 @ =gBattleBufferA
	ldr r5, _0812BA5C @ =gActiveBank
	ldrb r0, [r5]
	lsls r0, 9
	adds r1, 0x1
	adds r0, r1
	ldrb r1, [r0]
	ldr r0, _0812BA60 @ =0x02017840
	strb r1, [r0, 0x8]
	ldr r1, _0812BA64 @ =gDoingBattleAnim
	movs r0, 0x1
	strb r0, [r1]
	ldrb r4, [r5]
	movs r0, 0x1
	bl GetBankByPlayerAI
	adds r2, r0, 0
	lsls r2, 24
	lsrs r2, 24
	adds r0, r4, 0
	adds r1, r4, 0
	movs r3, 0x4
	bl move_anim_start_t4
	ldr r1, _0812BA68 @ =gBattleBankFunc
	ldrb r0, [r5]
	lsls r0, 2
	adds r0, r1
	ldr r1, _0812BA6C @ =bx_wait_t6
	str r1, [r0]
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_0812BA58: .4byte gBattleBufferA
_0812BA5C: .4byte gActiveBank
_0812BA60: .4byte 0x02017840
_0812BA64: .4byte gDoingBattleAnim
_0812BA68: .4byte gBattleBankFunc
_0812BA6C: .4byte bx_wait_t6
	thumb_func_end sub_812BA14

	thumb_func_start sub_812BA70
sub_812BA70: @ 812BA70
	push {lr}
	bl SafariBufferExecCompleted
	pop {r0}
	bx r0
	thumb_func_end sub_812BA70

	thumb_func_start sub_812BA7C
sub_812BA7C: @ 812BA7C
	push {lr}
	bl SafariBufferExecCompleted
	pop {r0}
	bx r0
	thumb_func_end sub_812BA7C

	thumb_func_start SafariHandlePrintString
SafariHandlePrintString: @ 812BA88
	push {r4,lr}
	sub sp, 0x4
	ldr r0, _0812BACC @ =gUnknown_030042A4
	movs r1, 0
	strh r1, [r0]
	ldr r0, _0812BAD0 @ =gUnknown_030042A0
	strh r1, [r0]
	ldr r4, _0812BAD4 @ =gActiveBank
	ldrb r0, [r4]
	lsls r0, 9
	ldr r1, _0812BAD8 @ =gUnknown_02023A62
	adds r0, r1
	ldrh r0, [r0]
	bl BufferStringBattle
	ldr r0, _0812BADC @ =gUnknown_03004210
	ldr r1, _0812BAE0 @ =gDisplayedStringBattle
	movs r2, 0xF
	str r2, [sp]
	movs r2, 0x90
	movs r3, 0x2
	bl sub_8002EB0
	ldr r1, _0812BAE4 @ =gBattleBankFunc
	ldrb r0, [r4]
	lsls r0, 2
	adds r0, r1
	ldr r1, _0812BAE8 @ =sub_812B694
	str r1, [r0]
	add sp, 0x4
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0812BACC: .4byte gUnknown_030042A4
_0812BAD0: .4byte gUnknown_030042A0
_0812BAD4: .4byte gActiveBank
_0812BAD8: .4byte gUnknown_02023A62
_0812BADC: .4byte gUnknown_03004210
_0812BAE0: .4byte gDisplayedStringBattle
_0812BAE4: .4byte gBattleBankFunc
_0812BAE8: .4byte sub_812B694
	thumb_func_end SafariHandlePrintString

	thumb_func_start SafariHandlePrintStringPlayerOnly
SafariHandlePrintStringPlayerOnly: @ 812BAEC
	push {lr}
	ldr r0, _0812BB04 @ =gActiveBank
	ldrb r0, [r0]
	bl GetBankSide
	lsls r0, 24
	cmp r0, 0
	bne _0812BB08
	bl SafariHandlePrintString
	b _0812BB0C
	.align 2, 0
_0812BB04: .4byte gActiveBank
_0812BB08:
	bl SafariBufferExecCompleted
_0812BB0C:
	pop {r0}
	bx r0
	thumb_func_end SafariHandlePrintStringPlayerOnly

.section .text_812BBFC

	thumb_func_start sub_812BBFC
sub_812BBFC: @ 812BBFC
	push {lr}
	bl SafariBufferExecCompleted
	pop {r0}
	bx r0
	thumb_func_end sub_812BBFC

	thumb_func_start sub_812BC08
sub_812BC08: @ 812BC08
	push {lr}
	bl SafariBufferExecCompleted
	pop {r0}
	bx r0
	thumb_func_end sub_812BC08

	thumb_func_start sub_812BC14
sub_812BC14: @ 812BC14
	push {lr}
	sub sp, 0x4
	movs r0, 0x1
	negs r0, r0
	movs r1, 0
	str r1, [sp]
	movs r2, 0
	movs r3, 0x10
	bl BeginNormalPaletteFade
	ldr r1, _0812BC44 @ =gBattleBankFunc
	ldr r2, _0812BC48 @ =gActiveBank
	ldrb r0, [r2]
	lsls r0, 2
	adds r0, r1
	ldr r1, _0812BC4C @ =sub_812B724
	str r1, [r0]
	ldr r1, _0812BC50 @ =gBankInMenu
	ldrb r0, [r2]
	strb r0, [r1]
	add sp, 0x4
	pop {r0}
	bx r0
	.align 2, 0
_0812BC44: .4byte gBattleBankFunc
_0812BC48: .4byte gActiveBank
_0812BC4C: .4byte sub_812B724
_0812BC50: .4byte gBankInMenu
	thumb_func_end sub_812BC14

	thumb_func_start sub_812BC54
sub_812BC54: @ 812BC54
	push {lr}
	bl SafariBufferExecCompleted
	pop {r0}
	bx r0
	thumb_func_end sub_812BC54

	thumb_func_start sub_812BC60
sub_812BC60: @ 812BC60
	push {lr}
	bl SafariBufferExecCompleted
	pop {r0}
	bx r0
	thumb_func_end sub_812BC60

	thumb_func_start sub_812BC6C
sub_812BC6C: @ 812BC6C
	push {lr}
	bl SafariBufferExecCompleted
	pop {r0}
	bx r0
	thumb_func_end sub_812BC6C

	thumb_func_start sub_812BC78
sub_812BC78: @ 812BC78
	push {lr}
	bl SafariBufferExecCompleted
	pop {r0}
	bx r0
	thumb_func_end sub_812BC78

	thumb_func_start sub_812BC84
sub_812BC84: @ 812BC84
	push {lr}
	ldr r0, _0812BCB0 @ =gHealthboxIDs
	ldr r1, _0812BCB4 @ =gActiveBank
	ldrb r1, [r1]
	adds r0, r1, r0
	ldrb r0, [r0]
	ldr r2, _0812BCB8 @ =gBattlePartyID
	lsls r1, 1
	adds r1, r2
	ldrh r2, [r1]
	movs r1, 0x64
	muls r1, r2
	ldr r2, _0812BCBC @ =gPlayerParty
	adds r1, r2
	movs r2, 0xB
	bl sub_8045A5C
	bl SafariBufferExecCompleted
	pop {r0}
	bx r0
	.align 2, 0
_0812BCB0: .4byte gHealthboxIDs
_0812BCB4: .4byte gActiveBank
_0812BCB8: .4byte gBattlePartyID
_0812BCBC: .4byte gPlayerParty
	thumb_func_end sub_812BC84

	thumb_func_start sub_812BCC0
sub_812BCC0: @ 812BCC0
	push {lr}
	bl SafariBufferExecCompleted
	pop {r0}
	bx r0
	thumb_func_end sub_812BCC0

	thumb_func_start sub_812BCCC
sub_812BCCC: @ 812BCCC
	push {lr}
	bl SafariBufferExecCompleted
	pop {r0}
	bx r0
	thumb_func_end sub_812BCCC

	thumb_func_start sub_812BCD8
sub_812BCD8: @ 812BCD8
	push {lr}
	bl SafariBufferExecCompleted
	pop {r0}
	bx r0
	thumb_func_end sub_812BCD8

	thumb_func_start sub_812BCE4
sub_812BCE4: @ 812BCE4
	push {lr}
	bl SafariBufferExecCompleted
	pop {r0}
	bx r0
	thumb_func_end sub_812BCE4

	thumb_func_start sub_812BCF0
sub_812BCF0: @ 812BCF0
	push {lr}
	bl SafariBufferExecCompleted
	pop {r0}
	bx r0
	thumb_func_end sub_812BCF0

	thumb_func_start sub_812BCFC
sub_812BCFC: @ 812BCFC
	push {lr}
	bl SafariBufferExecCompleted
	pop {r0}
	bx r0
	thumb_func_end sub_812BCFC

	thumb_func_start sub_812BD08
sub_812BD08: @ 812BD08
	push {lr}
	bl SafariBufferExecCompleted
	pop {r0}
	bx r0
	thumb_func_end sub_812BD08

	thumb_func_start sub_812BD14
sub_812BD14: @ 812BD14
	push {lr}
	bl SafariBufferExecCompleted
	pop {r0}
	bx r0
	thumb_func_end sub_812BD14

	thumb_func_start sub_812BD20
sub_812BD20: @ 812BD20
	push {lr}
	bl SafariBufferExecCompleted
	pop {r0}
	bx r0
	thumb_func_end sub_812BD20

	thumb_func_start sub_812BD2C
sub_812BD2C: @ 812BD2C
	push {lr}
	bl SafariBufferExecCompleted
	pop {r0}
	bx r0
	thumb_func_end sub_812BD2C

	thumb_func_start sub_812BD38
sub_812BD38: @ 812BD38
	push {lr}
	bl SafariBufferExecCompleted
	pop {r0}
	bx r0
	thumb_func_end sub_812BD38

	thumb_func_start sub_812BD44
sub_812BD44: @ 812BD44
	push {lr}
	bl SafariBufferExecCompleted
	pop {r0}
	bx r0
	thumb_func_end sub_812BD44

	thumb_func_start sub_812BD50
sub_812BD50: @ 812BD50
	push {lr}
	bl SafariBufferExecCompleted
	pop {r0}
	bx r0
	thumb_func_end sub_812BD50

	thumb_func_start sub_812BD5C
sub_812BD5C: @ 812BD5C
	push {lr}
	bl SafariBufferExecCompleted
	pop {r0}
	bx r0
	thumb_func_end sub_812BD5C

	thumb_func_start sub_812BD68
sub_812BD68: @ 812BD68
	push {lr}
	bl SafariBufferExecCompleted
	pop {r0}
	bx r0
	thumb_func_end sub_812BD68

	thumb_func_start sub_812BD74
sub_812BD74: @ 812BD74
	push {lr}
	bl SafariBufferExecCompleted
	pop {r0}
	bx r0
	thumb_func_end sub_812BD74

	thumb_func_start sub_812BD80
sub_812BD80: @ 812BD80
	push {r4,lr}
	ldr r4, _0812BDBC @ =gActiveBank
	ldrb r0, [r4]
	bl GetBankSide
	lsls r0, 24
	movs r3, 0x3F
	cmp r0, 0
	bne _0812BD94
	movs r3, 0xC0
_0812BD94:
	ldr r2, _0812BDC0 @ =gBattleBufferA
	ldrb r1, [r4]
	lsls r1, 9
	adds r0, r2, 0x1
	adds r0, r1, r0
	ldrb r0, [r0]
	adds r2, 0x2
	adds r1, r2
	ldrb r1, [r1]
	lsls r1, 8
	orrs r0, r1
	lsls r1, r3, 24
	asrs r1, 24
	bl PlaySE12WithPanning
	bl SafariBufferExecCompleted
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0812BDBC: .4byte gActiveBank
_0812BDC0: .4byte gBattleBufferA
	thumb_func_end sub_812BD80

	thumb_func_start sub_812BDC4
sub_812BDC4: @ 812BDC4
	push {lr}
	ldr r2, _0812BDEC @ =gBattleBufferA
	ldr r0, _0812BDF0 @ =gActiveBank
	ldrb r1, [r0]
	lsls r1, 9
	adds r0, r2, 0x1
	adds r0, r1, r0
	ldrb r0, [r0]
	adds r2, 0x2
	adds r1, r2
	ldrb r1, [r1]
	lsls r1, 8
	orrs r0, r1
	bl PlayFanfare
	bl SafariBufferExecCompleted
	pop {r0}
	bx r0
	.align 2, 0
_0812BDEC: .4byte gBattleBufferA
_0812BDF0: .4byte gActiveBank
	thumb_func_end sub_812BDC4

	thumb_func_start sub_812BDF4
sub_812BDF4: @ 812BDF4
	push {lr}
	ldr r1, _0812BE24 @ =gBattlePartyID
	ldr r0, _0812BE28 @ =gActiveBank
	ldrb r0, [r0]
	lsls r0, 1
	adds r0, r1
	ldrh r1, [r0]
	movs r0, 0x64
	muls r0, r1
	ldr r1, _0812BE2C @ =gPlayerParty
	adds r0, r1
	movs r1, 0xB
	bl GetMonData
	lsls r0, 16
	lsrs r0, 16
	movs r1, 0x19
	bl PlayCry1
	bl SafariBufferExecCompleted
	pop {r0}
	bx r0
	.align 2, 0
_0812BE24: .4byte gBattlePartyID
_0812BE28: .4byte gActiveBank
_0812BE2C: .4byte gPlayerParty
	thumb_func_end sub_812BDF4

	thumb_func_start dp01t_2E_6_battle_intro
dp01t_2E_6_battle_intro: @ 812BE30
	push {lr}
	ldr r1, _0812BE58 @ =gBattleBufferA
	ldr r0, _0812BE5C @ =gActiveBank
	ldrb r0, [r0]
	lsls r0, 9
	adds r1, 0x1
	adds r0, r1
	ldrb r0, [r0]
	bl sub_80E43C0
	ldr r2, _0812BE60 @ =gUnknown_02024DE8
	ldrh r0, [r2]
	movs r1, 0x1
	orrs r0, r1
	strh r0, [r2]
	bl SafariBufferExecCompleted
	pop {r0}
	bx r0
	.align 2, 0
_0812BE58: .4byte gBattleBufferA
_0812BE5C: .4byte gActiveBank
_0812BE60: .4byte gUnknown_02024DE8
	thumb_func_end dp01t_2E_6_battle_intro

	thumb_func_start sub_812BE64
sub_812BE64: @ 812BE64
	push {r4,r5,lr}
	ldr r5, _0812BEA0 @ =gHealthboxIDs
	ldr r4, _0812BEA4 @ =gActiveBank
	ldrb r1, [r4]
	adds r0, r1, r5
	ldrb r0, [r0]
	ldr r2, _0812BEA8 @ =gBattlePartyID
	lsls r1, 1
	adds r1, r2
	ldrh r2, [r1]
	movs r1, 0x64
	muls r1, r2
	ldr r2, _0812BEAC @ =gPlayerParty
	adds r1, r2
	movs r2, 0xA
	bl sub_8045A5C
	ldrb r0, [r4]
	bl sub_804777C
	ldrb r0, [r4]
	adds r0, r5
	ldrb r0, [r0]
	bl sub_8043DFC
	bl SafariBufferExecCompleted
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_0812BEA0: .4byte gHealthboxIDs
_0812BEA4: .4byte gActiveBank
_0812BEA8: .4byte gBattlePartyID
_0812BEAC: .4byte gPlayerParty
	thumb_func_end sub_812BE64

	thumb_func_start sub_812BEB0
sub_812BEB0: @ 812BEB0
	push {lr}
	bl SafariBufferExecCompleted
	pop {r0}
	bx r0
	thumb_func_end sub_812BEB0

	thumb_func_start sub_812BEBC
sub_812BEBC: @ 812BEBC
	push {lr}
	bl SafariBufferExecCompleted
	pop {r0}
	bx r0
	thumb_func_end sub_812BEBC

	thumb_func_start sub_812BEC8
sub_812BEC8: @ 812BEC8
	push {lr}
	bl SafariBufferExecCompleted
	pop {r0}
	bx r0
	thumb_func_end sub_812BEC8

	thumb_func_start sub_812BED4
sub_812BED4: @ 812BED4
	push {lr}
	bl SafariBufferExecCompleted
	pop {r0}
	bx r0
	thumb_func_end sub_812BED4

	thumb_func_start sub_812BEE0
sub_812BEE0: @ 812BEE0
	push {r4-r6,lr}
	sub sp, 0x4
	ldr r5, _0812BF18 @ =gBattleBufferA
	ldr r6, _0812BF1C @ =gActiveBank
	ldrb r2, [r6]
	lsls r1, r2, 9
	adds r0, r5, 0x1
	adds r0, r1, r0
	ldrb r3, [r0]
	adds r0, r5, 0x2
	adds r0, r1, r0
	ldrb r4, [r0]
	adds r5, 0x3
	adds r1, r5
	ldrb r0, [r1]
	lsls r0, 8
	orrs r4, r0
	str r4, [sp]
	adds r0, r2, 0
	adds r1, r2, 0
	bl move_anim_start_t3
	lsls r0, 24
	cmp r0, 0
	beq _0812BF20
	bl SafariBufferExecCompleted
	b _0812BF2C
	.align 2, 0
_0812BF18: .4byte gBattleBufferA
_0812BF1C: .4byte gActiveBank
_0812BF20:
	ldr r0, _0812BF34 @ =gBattleBankFunc
	ldrb r1, [r6]
	lsls r1, 2
	adds r1, r0
	ldr r0, _0812BF38 @ =sub_812B794
	str r0, [r1]
_0812BF2C:
	add sp, 0x4
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_0812BF34: .4byte gBattleBankFunc
_0812BF38: .4byte sub_812B794
	thumb_func_end sub_812BEE0

	thumb_func_start sub_812BF3C
sub_812BF3C: @ 812BF3C
	push {lr}
	bl SafariBufferExecCompleted
	pop {r0}
	bx r0
	thumb_func_end sub_812BF3C

	thumb_func_start sub_812BF48
sub_812BF48: @ 812BF48
	push {lr}
	bl SafariBufferExecCompleted
	pop {r0}
	bx r0
	thumb_func_end sub_812BF48

	thumb_func_start sub_812BF54
sub_812BF54: @ 812BF54
	push {r4,lr}
	ldr r2, _0812BF98 @ =gBattleOutcome
	ldr r1, _0812BF9C @ =gBattleBufferA
	ldr r4, _0812BFA0 @ =gActiveBank
	ldrb r0, [r4]
	lsls r0, 9
	adds r1, 0x1
	adds r0, r1
	ldrb r0, [r0]
	strb r0, [r2]
	movs r0, 0x5
	bl FadeOutMapMusic
	movs r0, 0x3
	bl BeginFastPaletteFade
	bl SafariBufferExecCompleted
	ldr r0, _0812BFA4 @ =gBattleTypeFlags
	ldrh r1, [r0]
	movs r0, 0x6
	ands r0, r1
	cmp r0, 0x2
	bne _0812BF90
	ldr r0, _0812BFA8 @ =gBattleBankFunc
	ldrb r1, [r4]
	lsls r1, 2
	adds r1, r0
	ldr r0, _0812BFAC @ =sub_812B6AC
	str r0, [r1]
_0812BF90:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0812BF98: .4byte gBattleOutcome
_0812BF9C: .4byte gBattleBufferA
_0812BFA0: .4byte gActiveBank
_0812BFA4: .4byte gBattleTypeFlags
_0812BFA8: .4byte gBattleBankFunc
_0812BFAC: .4byte sub_812B6AC
	thumb_func_end sub_812BF54

	thumb_func_start nullsub_78
nullsub_78: @ 812BFB0
	bx lr
	thumb_func_end nullsub_78

	.align 2, 0 @ Don't pad with nop.
