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
	bl move_anim_related_task_del
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
	bl move_anim_related_task_del
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
	bl sub_8076BE0
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
	bl move_anim_task_del
	b _0812B272
_0812B1CC:
	ldr r0, _0812B1E0 @ =gBattleAnimArgs
	movs r2, 0
	ldrsh r1, [r0, r2]
	adds r2, r0, 0
	cmp r1, 0
	bne _0812B1E8
	ldr r0, _0812B1E4 @ =gUnknown_0202F7C8
	ldrb r4, [r0]
	b _0812B20E
	.align 2, 0
_0812B1E0: .4byte gBattleAnimArgs
_0812B1E4: .4byte gUnknown_0202F7C8
_0812B1E8:
	cmp r1, 0x1
	bne _0812B1F8
	ldr r0, _0812B1F4 @ =gUnknown_0202F7C9
	ldrb r4, [r0]
	b _0812B20E
	.align 2, 0
_0812B1F4: .4byte gUnknown_0202F7C9
_0812B1F8:
	cmp r1, 0x2
	bne _0812B204
	ldr r0, _0812B200 @ =gUnknown_0202F7C8
	b _0812B206
	.align 2, 0
_0812B200: .4byte gUnknown_0202F7C8
_0812B204:
	ldr r0, _0812B230 @ =gUnknown_0202F7C9
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
	bl move_anim_task_del
	b _0812B2B0
	.align 2, 0
_0812B230: .4byte gUnknown_0202F7C9
_0812B234:
	adds r0, r4, 0
	bl battle_side_get_owner
	lsls r0, 24
	cmp r0, 0
	beq _0812B258
	ldr r1, _0812B250 @ =gUnknown_02024A6A
	lsls r0, r4, 1
	adds r0, r1
	ldrh r1, [r0]
	movs r0, 0x64
	muls r0, r1
	ldr r1, _0812B254 @ =gEnemyParty
	b _0812B266
	.align 2, 0
_0812B250: .4byte gUnknown_02024A6A
_0812B254: .4byte gEnemyParty
_0812B258:
	ldr r1, _0812B290 @ =gUnknown_02024A6A
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
_0812B290: .4byte gUnknown_02024A6A
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
	bl move_anim_task_del
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
	bl sub_8076BE0
	lsls r0, 24
	cmp r0, 0
	beq _0812B2DC
	ldr r0, _0812B2D8 @ =0x02019348
	b _0812B2E6
	.align 2, 0
_0812B2D8: .4byte 0x02019348
_0812B2DC:
	ldr r1, _0812B304 @ =gUnknown_0202F7CA
	ldr r0, _0812B308 @ =gUnknown_0202F7C8
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
	bl move_anim_task_del
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_0812B304: .4byte gUnknown_0202F7CA
_0812B308: .4byte gUnknown_0202F7C8
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
	bl move_anim_task_del
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
	bl move_anim_task_del
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
	bl move_anim_task_del
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

	thumb_func_start sub_812B468
sub_812B468: @ 812B468
	ldr r1, _0812B478 @ =gUnknown_03004330
	ldr r0, _0812B47C @ =gUnknown_02024A60
	ldrb r0, [r0]
	lsls r0, 2
	adds r0, r1
	ldr r1, _0812B480 @ =sub_812B484
	str r1, [r0]
	bx lr
	.align 2, 0
_0812B478: .4byte gUnknown_03004330
_0812B47C: .4byte gUnknown_02024A60
_0812B480: .4byte sub_812B484
	thumb_func_end sub_812B468

	thumb_func_start sub_812B484
sub_812B484: @ 812B484
	push {lr}
	ldr r2, _0812B4B8 @ =gUnknown_02024A64
	ldr r1, _0812B4BC @ =gBitTable
	ldr r0, _0812B4C0 @ =gUnknown_02024A60
	ldrb r3, [r0]
	lsls r0, r3, 2
	adds r0, r1
	ldr r1, [r2]
	ldr r0, [r0]
	ands r1, r0
	cmp r1, 0
	beq _0812B4D0
	ldr r0, _0812B4C4 @ =gUnknown_02023A60
	lsls r1, r3, 9
	adds r1, r0
	ldrb r0, [r1]
	cmp r0, 0x38
	bhi _0812B4CC
	ldr r0, _0812B4C8 @ =gUnknown_08402080
	ldrb r1, [r1]
	lsls r1, 2
	adds r1, r0
	ldr r0, [r1]
	bl _call_via_r0
	b _0812B4D0
	.align 2, 0
_0812B4B8: .4byte gUnknown_02024A64
_0812B4BC: .4byte gBitTable
_0812B4C0: .4byte gUnknown_02024A60
_0812B4C4: .4byte gUnknown_02023A60
_0812B4C8: .4byte gUnknown_08402080
_0812B4CC:
	bl dp01_tbl6_exec_completed
_0812B4D0:
	pop {r0}
	bx r0
	thumb_func_end sub_812B484

	thumb_func_start bx_battle_menu_t6_2
bx_battle_menu_t6_2: @ 812B4D4
	push {r4,r5,lr}
	ldr r0, _0812B508 @ =gMain
	ldrh r1, [r0, 0x2E]
	movs r2, 0x1
	adds r0, r2, 0
	ands r0, r1
	cmp r0, 0
	beq _0812B546
	movs r0, 0x5
	bl PlaySE
	bl sub_814A7FC
	ldr r1, _0812B50C @ =gUnknown_02024E60
	ldr r0, _0812B510 @ =gUnknown_02024A60
	ldrb r0, [r0]
	adds r0, r1
	ldrb r0, [r0]
	cmp r0, 0x1
	beq _0812B524
	cmp r0, 0x1
	bgt _0812B514
	cmp r0, 0
	beq _0812B51E
	b _0812B540
	.align 2, 0
_0812B508: .4byte gMain
_0812B50C: .4byte gUnknown_02024E60
_0812B510: .4byte gUnknown_02024A60
_0812B514:
	cmp r0, 0x2
	beq _0812B52A
	cmp r0, 0x3
	beq _0812B536
	b _0812B540
_0812B51E:
	movs r0, 0x1
	movs r1, 0x5
	b _0812B52E
_0812B524:
	movs r0, 0x1
	movs r1, 0x6
	b _0812B52E
_0812B52A:
	movs r0, 0x1
	movs r1, 0x7
_0812B52E:
	movs r2, 0
	bl dp01_build_cmdbuf_x21_a_bb
	b _0812B540
_0812B536:
	movs r0, 0x1
	movs r1, 0x8
	movs r2, 0
	bl dp01_build_cmdbuf_x21_a_bb
_0812B540:
	bl dp01_tbl6_exec_completed
	b _0812B64E
_0812B546:
	movs r0, 0x20
	ands r0, r1
	cmp r0, 0
	beq _0812B584
	ldr r5, _0812B57C @ =gUnknown_02024E60
	ldr r4, _0812B580 @ =gUnknown_02024A60
	ldrb r0, [r4]
	adds r0, r5
	ldrb r1, [r0]
	adds r0, r2, 0
	ands r0, r1
	cmp r0, 0
	beq _0812B64E
	movs r0, 0x5
	bl PlaySE
	ldrb r0, [r4]
	adds r0, r5
	ldrb r0, [r0]
	bl nullsub_8
	ldrb r1, [r4]
	adds r1, r5
	ldrb r0, [r1]
	movs r2, 0x1
	b _0812B5F2
	.align 2, 0
_0812B57C: .4byte gUnknown_02024E60
_0812B580: .4byte gUnknown_02024A60
_0812B584:
	movs r0, 0x10
	ands r0, r1
	cmp r0, 0
	beq _0812B5C0
	ldr r5, _0812B5B8 @ =gUnknown_02024E60
	ldr r4, _0812B5BC @ =gUnknown_02024A60
	ldrb r0, [r4]
	adds r0, r5
	ldrb r1, [r0]
	adds r0, r2, 0
	ands r0, r1
	cmp r0, 0
	bne _0812B64E
	movs r0, 0x5
	bl PlaySE
	ldrb r0, [r4]
	adds r0, r5
	ldrb r0, [r0]
	bl nullsub_8
	ldrb r1, [r4]
	adds r1, r5
	ldrb r0, [r1]
	movs r2, 0x1
	b _0812B5F2
	.align 2, 0
_0812B5B8: .4byte gUnknown_02024E60
_0812B5BC: .4byte gUnknown_02024A60
_0812B5C0:
	movs r0, 0x40
	ands r0, r1
	cmp r0, 0
	beq _0812B60C
	ldr r5, _0812B604 @ =gUnknown_02024E60
	ldr r4, _0812B608 @ =gUnknown_02024A60
	ldrb r0, [r4]
	adds r0, r5
	ldrb r1, [r0]
	movs r0, 0x2
	ands r0, r1
	cmp r0, 0
	beq _0812B64E
	movs r0, 0x5
	bl PlaySE
	ldrb r0, [r4]
	adds r0, r5
	ldrb r0, [r0]
	bl nullsub_8
	ldrb r1, [r4]
	adds r1, r5
	ldrb r0, [r1]
	movs r2, 0x2
_0812B5F2:
	eors r0, r2
	strb r0, [r1]
	ldrb r0, [r4]
	adds r0, r5
	ldrb r0, [r0]
	movs r1, 0
	bl sub_802E3E4
	b _0812B64E
	.align 2, 0
_0812B604: .4byte gUnknown_02024E60
_0812B608: .4byte gUnknown_02024A60
_0812B60C:
	movs r0, 0x80
	ands r0, r1
	cmp r0, 0
	beq _0812B64E
	ldr r5, _0812B654 @ =gUnknown_02024E60
	ldr r4, _0812B658 @ =gUnknown_02024A60
	ldrb r0, [r4]
	adds r0, r5
	ldrb r1, [r0]
	movs r0, 0x2
	ands r0, r1
	cmp r0, 0
	bne _0812B64E
	movs r0, 0x5
	bl PlaySE
	ldrb r0, [r4]
	adds r0, r5
	ldrb r0, [r0]
	bl nullsub_8
	ldrb r1, [r4]
	adds r1, r5
	ldrb r0, [r1]
	movs r2, 0x2
	eors r0, r2
	strb r0, [r1]
	ldrb r0, [r4]
	adds r0, r5
	ldrb r0, [r0]
	movs r1, 0
	bl sub_802E3E4
_0812B64E:
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_0812B654: .4byte gUnknown_02024E60
_0812B658: .4byte gUnknown_02024A60
	thumb_func_end bx_battle_menu_t6_2

	thumb_func_start sub_812B65C
sub_812B65C: @ 812B65C
	push {lr}
	ldr r2, _0812B684 @ =gSprites
	ldr r1, _0812B688 @ =gUnknown_02024BE0
	ldr r0, _0812B68C @ =gUnknown_02024A60
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
	bl dp01_tbl6_exec_completed
_0812B680:
	pop {r0}
	bx r0
	.align 2, 0
_0812B684: .4byte gSprites
_0812B688: .4byte gUnknown_02024BE0
_0812B68C: .4byte gUnknown_02024A60
_0812B690: .4byte SpriteCallbackDummy
	thumb_func_end sub_812B65C

	thumb_func_start sub_812B694
sub_812B694: @ 812B694
	push {lr}
	ldr r0, _0812B6A8 @ =gUnknown_03004210
	ldrh r0, [r0, 0x16]
	cmp r0, 0
	bne _0812B6A2
	bl dp01_tbl6_exec_completed
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
	ldr r0, _0812B6E8 @ =gUnknown_030042D0
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
_0812B6E8: .4byte gUnknown_030042D0
	thumb_func_end sub_812B6AC

	thumb_func_start bx_wait_t6
bx_wait_t6: @ 812B6EC
	push {lr}
	ldr r0, _0812B718 @ =gUnknown_02024E6D
	ldrb r0, [r0]
	cmp r0, 0
	beq _0812B70E
	ldr r0, _0812B71C @ =gUnknown_02024A60
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
	bl dp01_tbl6_exec_completed
_0812B712:
	pop {r0}
	bx r0
	.align 2, 0
_0812B718: .4byte gUnknown_02024E6D
_0812B71C: .4byte gUnknown_02024A60
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
	ldr r1, _0812B74C @ =gUnknown_03004330
	ldr r0, _0812B750 @ =gUnknown_02024A60
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
_0812B74C: .4byte gUnknown_03004330
_0812B750: .4byte gUnknown_02024A60
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
	bl dp01_tbl6_exec_completed
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
	ldr r0, _0812B7B8 @ =gUnknown_02024A60
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
	bl dp01_tbl6_exec_completed
_0812B7B2:
	pop {r0}
	bx r0
	.align 2, 0
_0812B7B8: .4byte gUnknown_02024A60
_0812B7BC: .4byte 0x02017810
	thumb_func_end sub_812B794

	thumb_func_start dp01_tbl6_exec_completed
dp01_tbl6_exec_completed: @ 812B7C0
	push {r4,lr}
	sub sp, 0x4
	ldr r1, _0812B800 @ =gUnknown_03004330
	ldr r4, _0812B804 @ =gUnknown_02024A60
	ldrb r0, [r4]
	lsls r0, 2
	adds r0, r1
	ldr r1, _0812B808 @ =sub_812B484
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
	ldr r1, _0812B810 @ =gUnknown_02023A60
	ldrb r0, [r4]
	lsls r0, 9
	adds r0, r1
	movs r1, 0x38
	strb r1, [r0]
	b _0812B826
	.align 2, 0
_0812B800: .4byte gUnknown_03004330
_0812B804: .4byte gUnknown_02024A60
_0812B808: .4byte sub_812B484
_0812B80C: .4byte gBattleTypeFlags
_0812B810: .4byte gUnknown_02023A60
_0812B814:
	ldr r2, _0812B830 @ =gUnknown_02024A64
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
_0812B830: .4byte gUnknown_02024A64
_0812B834: .4byte gBitTable
	thumb_func_end dp01_tbl6_exec_completed

	thumb_func_start unref_sub_812B838
unref_sub_812B838: @ 812B838
	push {lr}
	ldr r0, _0812B85C @ =gUnknown_02024A60
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
	bl dp01_tbl6_exec_completed
_0812B856:
	pop {r0}
	bx r0
	.align 2, 0
_0812B85C: .4byte gUnknown_02024A60
_0812B860: .4byte 0x02017810
	thumb_func_end unref_sub_812B838

	thumb_func_start sub_812B864
sub_812B864: @ 812B864
	push {lr}
	bl dp01_tbl6_exec_completed
	pop {r0}
	bx r0
	thumb_func_end sub_812B864

	thumb_func_start sub_812B870
sub_812B870: @ 812B870
	push {lr}
	bl dp01_tbl6_exec_completed
	pop {r0}
	bx r0
	thumb_func_end sub_812B870

	thumb_func_start sub_812B87C
sub_812B87C: @ 812B87C
	push {lr}
	bl dp01_tbl6_exec_completed
	pop {r0}
	bx r0
	thumb_func_end sub_812B87C

	thumb_func_start sub_812B888
sub_812B888: @ 812B888
	push {lr}
	bl dp01_tbl6_exec_completed
	pop {r0}
	bx r0
	thumb_func_end sub_812B888

	thumb_func_start sub_812B894
sub_812B894: @ 812B894
	push {lr}
	bl dp01_tbl6_exec_completed
	pop {r0}
	bx r0
	thumb_func_end sub_812B894

	thumb_func_start sub_812B8A0
sub_812B8A0: @ 812B8A0
	push {lr}
	bl dp01_tbl6_exec_completed
	pop {r0}
	bx r0
	thumb_func_end sub_812B8A0

	thumb_func_start sub_812B8AC
sub_812B8AC: @ 812B8AC
	push {lr}
	bl dp01_tbl6_exec_completed
	pop {r0}
	bx r0
	thumb_func_end sub_812B8AC

	thumb_func_start sub_812B8B8
sub_812B8B8: @ 812B8B8
	push {r4-r6,lr}
	ldr r4, _0812B96C @ =gSaveBlock2
	ldrb r0, [r4, 0x8]
	ldr r5, _0812B970 @ =gUnknown_02024A60
	ldrb r1, [r5]
	bl sub_8031AF4
	ldrb r6, [r4, 0x8]
	ldrb r0, [r5]
	bl battle_get_per_side_status
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
	ldr r6, _0812B97C @ =gUnknown_02024BE0
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
	ldr r1, _0812B98C @ =gUnknown_03004330
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
_0812B970: .4byte gUnknown_02024A60
_0812B974: .4byte gUnknown_02024E8C
_0812B978: .4byte gTrainerBackPicCoords
_0812B97C: .4byte gUnknown_02024BE0
_0812B980: .4byte gSprites
_0812B984: .4byte 0x0000fffe
_0812B988: .4byte sub_80313A0
_0812B98C: .4byte gUnknown_03004330
_0812B990: .4byte sub_812B65C
	thumb_func_end sub_812B8B8

	thumb_func_start sub_812B994
sub_812B994: @ 812B994
	push {lr}
	bl dp01_tbl6_exec_completed
	pop {r0}
	bx r0
	thumb_func_end sub_812B994

	thumb_func_start sub_812B9A0
sub_812B9A0: @ 812B9A0
	push {lr}
	bl dp01_tbl6_exec_completed
	pop {r0}
	bx r0
	thumb_func_end sub_812B9A0

	thumb_func_start sub_812B9AC
sub_812B9AC: @ 812B9AC
	push {lr}
	bl dp01_tbl6_exec_completed
	pop {r0}
	bx r0
	thumb_func_end sub_812B9AC

	thumb_func_start sub_812B9B8
sub_812B9B8: @ 812B9B8
	push {lr}
	bl dp01_tbl6_exec_completed
	pop {r0}
	bx r0
	thumb_func_end sub_812B9B8

	thumb_func_start sub_812B9C4
sub_812B9C4: @ 812B9C4
	push {r4,r5,lr}
	ldr r1, _0812BA00 @ =0x02017840
	movs r0, 0x4
	strb r0, [r1, 0x8]
	ldr r1, _0812BA04 @ =gUnknown_02024E6D
	movs r0, 0x1
	strb r0, [r1]
	ldr r5, _0812BA08 @ =gUnknown_02024A60
	ldrb r4, [r5]
	movs r0, 0x1
	bl battle_get_side_with_given_state
	adds r2, r0, 0
	lsls r2, 24
	lsrs r2, 24
	adds r0, r4, 0
	adds r1, r4, 0
	movs r3, 0x4
	bl move_anim_start_t4
	ldr r1, _0812BA0C @ =gUnknown_03004330
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
_0812BA04: .4byte gUnknown_02024E6D
_0812BA08: .4byte gUnknown_02024A60
_0812BA0C: .4byte gUnknown_03004330
_0812BA10: .4byte bx_wait_t6
	thumb_func_end sub_812B9C4

	thumb_func_start sub_812BA14
sub_812BA14: @ 812BA14
	push {r4,r5,lr}
	ldr r1, _0812BA58 @ =gUnknown_02023A60
	ldr r5, _0812BA5C @ =gUnknown_02024A60
	ldrb r0, [r5]
	lsls r0, 9
	adds r1, 0x1
	adds r0, r1
	ldrb r1, [r0]
	ldr r0, _0812BA60 @ =0x02017840
	strb r1, [r0, 0x8]
	ldr r1, _0812BA64 @ =gUnknown_02024E6D
	movs r0, 0x1
	strb r0, [r1]
	ldrb r4, [r5]
	movs r0, 0x1
	bl battle_get_side_with_given_state
	adds r2, r0, 0
	lsls r2, 24
	lsrs r2, 24
	adds r0, r4, 0
	adds r1, r4, 0
	movs r3, 0x4
	bl move_anim_start_t4
	ldr r1, _0812BA68 @ =gUnknown_03004330
	ldrb r0, [r5]
	lsls r0, 2
	adds r0, r1
	ldr r1, _0812BA6C @ =bx_wait_t6
	str r1, [r0]
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_0812BA58: .4byte gUnknown_02023A60
_0812BA5C: .4byte gUnknown_02024A60
_0812BA60: .4byte 0x02017840
_0812BA64: .4byte gUnknown_02024E6D
_0812BA68: .4byte gUnknown_03004330
_0812BA6C: .4byte bx_wait_t6
	thumb_func_end sub_812BA14

	thumb_func_start sub_812BA70
sub_812BA70: @ 812BA70
	push {lr}
	bl dp01_tbl6_exec_completed
	pop {r0}
	bx r0
	thumb_func_end sub_812BA70

	thumb_func_start sub_812BA7C
sub_812BA7C: @ 812BA7C
	push {lr}
	bl dp01_tbl6_exec_completed
	pop {r0}
	bx r0
	thumb_func_end sub_812BA7C

	thumb_func_start dp01t_10_6_message
dp01t_10_6_message: @ 812BA88
	push {r4,lr}
	sub sp, 0x4
	ldr r0, _0812BACC @ =gUnknown_030042A4
	movs r1, 0
	strh r1, [r0]
	ldr r0, _0812BAD0 @ =gUnknown_030042A0
	strh r1, [r0]
	ldr r4, _0812BAD4 @ =gUnknown_02024A60
	ldrb r0, [r4]
	lsls r0, 9
	ldr r1, _0812BAD8 @ =gUnknown_02023A62
	adds r0, r1
	ldrh r0, [r0]
	bl sub_8120AA8
	ldr r0, _0812BADC @ =gUnknown_03004210
	ldr r1, _0812BAE0 @ =gUnknown_020238CC
	movs r2, 0xF
	str r2, [sp]
	movs r2, 0x90
	movs r3, 0x2
	bl sub_8002EB0
	ldr r1, _0812BAE4 @ =gUnknown_03004330
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
_0812BAD4: .4byte gUnknown_02024A60
_0812BAD8: .4byte gUnknown_02023A62
_0812BADC: .4byte gUnknown_03004210
_0812BAE0: .4byte gUnknown_020238CC
_0812BAE4: .4byte gUnknown_03004330
_0812BAE8: .4byte sub_812B694
	thumb_func_end dp01t_10_6_message

	thumb_func_start dp01t_11_6_message_for_player_only
dp01t_11_6_message_for_player_only: @ 812BAEC
	push {lr}
	ldr r0, _0812BB04 @ =gUnknown_02024A60
	ldrb r0, [r0]
	bl battle_side_get_owner
	lsls r0, 24
	cmp r0, 0
	bne _0812BB08
	bl dp01t_10_6_message
	b _0812BB0C
	.align 2, 0
_0812BB04: .4byte gUnknown_02024A60
_0812BB08:
	bl dp01_tbl6_exec_completed
_0812BB0C:
	pop {r0}
	bx r0
	thumb_func_end dp01t_11_6_message_for_player_only

	thumb_func_start sub_812BB10
sub_812BB10: @ 812BB10
	push {r4,r5,lr}
	sub sp, 0x8
	ldr r0, _0812BBCC @ =gUnknown_030042A4
	movs r2, 0
	strh r2, [r0]
	ldr r1, _0812BBD0 @ =gUnknown_030042A0
	movs r0, 0xA0
	strh r0, [r1]
	ldr r4, _0812BBD4 @ =gUnknown_03004210
	movs r5, 0
	strb r2, [r4, 0x6]
	movs r0, 0x1B
	str r0, [sp]
	movs r0, 0x12
	str r0, [sp, 0x4]
	adds r0, r4, 0
	movs r1, 0xA
	movs r2, 0x2
	movs r3, 0xF
	bl FillWindowRect_DefaultPalette
	movs r0, 0x10
	str r0, [sp]
	movs r0, 0x24
	str r0, [sp, 0x4]
	adds r0, r4, 0
	movs r1, 0xA
	movs r2, 0x2
	movs r3, 0x23
	bl FillWindowRect_DefaultPalette
	ldr r1, _0812BBD8 @ =gUnknown_03004330
	ldr r0, _0812BBDC @ =gUnknown_02024A60
	ldrb r0, [r0]
	lsls r0, 2
	adds r0, r1
	ldr r1, _0812BBE0 @ =bx_battle_menu_t6_2
	str r1, [r0]
	ldr r1, _0812BBE4 @ =gUnknown_08400D15
	movs r2, 0xC8
	lsls r2, 1
	movs r0, 0x23
	str r0, [sp]
	adds r0, r4, 0
	movs r3, 0x12
	bl InitWindow
	adds r0, r4, 0
	bl sub_8002F44
	ldr r1, _0812BBE8 @ =0x0000ffff
	ldr r3, _0812BBEC @ =0x00002d9f
	str r5, [sp]
	movs r0, 0
	movs r2, 0xC
	bl sub_814A5C0
	movs r4, 0
_0812BB84:
	lsls r0, r4, 24
	lsrs r0, 24
	bl nullsub_8
	adds r4, 0x1
	cmp r4, 0x3
	ble _0812BB84
	ldr r1, _0812BBF0 @ =gUnknown_02024E60
	ldr r0, _0812BBDC @ =gUnknown_02024A60
	ldrb r0, [r0]
	adds r0, r1
	ldrb r0, [r0]
	movs r1, 0
	bl sub_802E3E4
	ldr r0, _0812BBF4 @ =gUnknown_08400CBB
	bl get_battle_strings_
	ldr r4, _0812BBD4 @ =gUnknown_03004210
	ldr r1, _0812BBF8 @ =gUnknown_020238CC
	movs r2, 0xDC
	lsls r2, 1
	movs r0, 0x23
	str r0, [sp]
	adds r0, r4, 0
	movs r3, 0x2
	bl InitWindow
	adds r0, r4, 0
	bl sub_8002F44
	add sp, 0x8
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_0812BBCC: .4byte gUnknown_030042A4
_0812BBD0: .4byte gUnknown_030042A0
_0812BBD4: .4byte gUnknown_03004210
_0812BBD8: .4byte gUnknown_03004330
_0812BBDC: .4byte gUnknown_02024A60
_0812BBE0: .4byte bx_battle_menu_t6_2
_0812BBE4: .4byte gUnknown_08400D15
_0812BBE8: .4byte 0x0000ffff
_0812BBEC: .4byte 0x00002d9f
_0812BBF0: .4byte gUnknown_02024E60
_0812BBF4: .4byte gUnknown_08400CBB
_0812BBF8: .4byte gUnknown_020238CC
	thumb_func_end sub_812BB10

	thumb_func_start sub_812BBFC
sub_812BBFC: @ 812BBFC
	push {lr}
	bl dp01_tbl6_exec_completed
	pop {r0}
	bx r0
	thumb_func_end sub_812BBFC

	thumb_func_start sub_812BC08
sub_812BC08: @ 812BC08
	push {lr}
	bl dp01_tbl6_exec_completed
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
	ldr r1, _0812BC44 @ =gUnknown_03004330
	ldr r2, _0812BC48 @ =gUnknown_02024A60
	ldrb r0, [r2]
	lsls r0, 2
	adds r0, r1
	ldr r1, _0812BC4C @ =sub_812B724
	str r1, [r0]
	ldr r1, _0812BC50 @ =gUnknown_02024E6C
	ldrb r0, [r2]
	strb r0, [r1]
	add sp, 0x4
	pop {r0}
	bx r0
	.align 2, 0
_0812BC44: .4byte gUnknown_03004330
_0812BC48: .4byte gUnknown_02024A60
_0812BC4C: .4byte sub_812B724
_0812BC50: .4byte gUnknown_02024E6C
	thumb_func_end sub_812BC14

	thumb_func_start sub_812BC54
sub_812BC54: @ 812BC54
	push {lr}
	bl dp01_tbl6_exec_completed
	pop {r0}
	bx r0
	thumb_func_end sub_812BC54

	thumb_func_start sub_812BC60
sub_812BC60: @ 812BC60
	push {lr}
	bl dp01_tbl6_exec_completed
	pop {r0}
	bx r0
	thumb_func_end sub_812BC60

	thumb_func_start sub_812BC6C
sub_812BC6C: @ 812BC6C
	push {lr}
	bl dp01_tbl6_exec_completed
	pop {r0}
	bx r0
	thumb_func_end sub_812BC6C

	thumb_func_start sub_812BC78
sub_812BC78: @ 812BC78
	push {lr}
	bl dp01_tbl6_exec_completed
	pop {r0}
	bx r0
	thumb_func_end sub_812BC78

	thumb_func_start sub_812BC84
sub_812BC84: @ 812BC84
	push {lr}
	ldr r0, _0812BCB0 @ =gUnknown_03004340
	ldr r1, _0812BCB4 @ =gUnknown_02024A60
	ldrb r1, [r1]
	adds r0, r1, r0
	ldrb r0, [r0]
	ldr r2, _0812BCB8 @ =gUnknown_02024A6A
	lsls r1, 1
	adds r1, r2
	ldrh r2, [r1]
	movs r1, 0x64
	muls r1, r2
	ldr r2, _0812BCBC @ =gPlayerParty
	adds r1, r2
	movs r2, 0xB
	bl sub_8045A5C
	bl dp01_tbl6_exec_completed
	pop {r0}
	bx r0
	.align 2, 0
_0812BCB0: .4byte gUnknown_03004340
_0812BCB4: .4byte gUnknown_02024A60
_0812BCB8: .4byte gUnknown_02024A6A
_0812BCBC: .4byte gPlayerParty
	thumb_func_end sub_812BC84

	thumb_func_start sub_812BCC0
sub_812BCC0: @ 812BCC0
	push {lr}
	bl dp01_tbl6_exec_completed
	pop {r0}
	bx r0
	thumb_func_end sub_812BCC0

	thumb_func_start sub_812BCCC
sub_812BCCC: @ 812BCCC
	push {lr}
	bl dp01_tbl6_exec_completed
	pop {r0}
	bx r0
	thumb_func_end sub_812BCCC

	thumb_func_start sub_812BCD8
sub_812BCD8: @ 812BCD8
	push {lr}
	bl dp01_tbl6_exec_completed
	pop {r0}
	bx r0
	thumb_func_end sub_812BCD8

	thumb_func_start sub_812BCE4
sub_812BCE4: @ 812BCE4
	push {lr}
	bl dp01_tbl6_exec_completed
	pop {r0}
	bx r0
	thumb_func_end sub_812BCE4

	thumb_func_start sub_812BCF0
sub_812BCF0: @ 812BCF0
	push {lr}
	bl dp01_tbl6_exec_completed
	pop {r0}
	bx r0
	thumb_func_end sub_812BCF0

	thumb_func_start sub_812BCFC
sub_812BCFC: @ 812BCFC
	push {lr}
	bl dp01_tbl6_exec_completed
	pop {r0}
	bx r0
	thumb_func_end sub_812BCFC

	thumb_func_start sub_812BD08
sub_812BD08: @ 812BD08
	push {lr}
	bl dp01_tbl6_exec_completed
	pop {r0}
	bx r0
	thumb_func_end sub_812BD08

	thumb_func_start sub_812BD14
sub_812BD14: @ 812BD14
	push {lr}
	bl dp01_tbl6_exec_completed
	pop {r0}
	bx r0
	thumb_func_end sub_812BD14

	thumb_func_start sub_812BD20
sub_812BD20: @ 812BD20
	push {lr}
	bl dp01_tbl6_exec_completed
	pop {r0}
	bx r0
	thumb_func_end sub_812BD20

	thumb_func_start sub_812BD2C
sub_812BD2C: @ 812BD2C
	push {lr}
	bl dp01_tbl6_exec_completed
	pop {r0}
	bx r0
	thumb_func_end sub_812BD2C

	thumb_func_start sub_812BD38
sub_812BD38: @ 812BD38
	push {lr}
	bl dp01_tbl6_exec_completed
	pop {r0}
	bx r0
	thumb_func_end sub_812BD38

	thumb_func_start sub_812BD44
sub_812BD44: @ 812BD44
	push {lr}
	bl dp01_tbl6_exec_completed
	pop {r0}
	bx r0
	thumb_func_end sub_812BD44

	thumb_func_start sub_812BD50
sub_812BD50: @ 812BD50
	push {lr}
	bl dp01_tbl6_exec_completed
	pop {r0}
	bx r0
	thumb_func_end sub_812BD50

	thumb_func_start sub_812BD5C
sub_812BD5C: @ 812BD5C
	push {lr}
	bl dp01_tbl6_exec_completed
	pop {r0}
	bx r0
	thumb_func_end sub_812BD5C

	thumb_func_start sub_812BD68
sub_812BD68: @ 812BD68
	push {lr}
	bl dp01_tbl6_exec_completed
	pop {r0}
	bx r0
	thumb_func_end sub_812BD68

	thumb_func_start sub_812BD74
sub_812BD74: @ 812BD74
	push {lr}
	bl dp01_tbl6_exec_completed
	pop {r0}
	bx r0
	thumb_func_end sub_812BD74

	thumb_func_start sub_812BD80
sub_812BD80: @ 812BD80
	push {r4,lr}
	ldr r4, _0812BDBC @ =gUnknown_02024A60
	ldrb r0, [r4]
	bl battle_side_get_owner
	lsls r0, 24
	movs r3, 0x3F
	cmp r0, 0
	bne _0812BD94
	movs r3, 0xC0
_0812BD94:
	ldr r2, _0812BDC0 @ =gUnknown_02023A60
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
	bl dp01_tbl6_exec_completed
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0812BDBC: .4byte gUnknown_02024A60
_0812BDC0: .4byte gUnknown_02023A60
	thumb_func_end sub_812BD80

	thumb_func_start sub_812BDC4
sub_812BDC4: @ 812BDC4
	push {lr}
	ldr r2, _0812BDEC @ =gUnknown_02023A60
	ldr r0, _0812BDF0 @ =gUnknown_02024A60
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
	bl dp01_tbl6_exec_completed
	pop {r0}
	bx r0
	.align 2, 0
_0812BDEC: .4byte gUnknown_02023A60
_0812BDF0: .4byte gUnknown_02024A60
	thumb_func_end sub_812BDC4

	thumb_func_start sub_812BDF4
sub_812BDF4: @ 812BDF4
	push {lr}
	ldr r1, _0812BE24 @ =gUnknown_02024A6A
	ldr r0, _0812BE28 @ =gUnknown_02024A60
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
	bl dp01_tbl6_exec_completed
	pop {r0}
	bx r0
	.align 2, 0
_0812BE24: .4byte gUnknown_02024A6A
_0812BE28: .4byte gUnknown_02024A60
_0812BE2C: .4byte gPlayerParty
	thumb_func_end sub_812BDF4

	thumb_func_start dp01t_2E_6_battle_intro
dp01t_2E_6_battle_intro: @ 812BE30
	push {lr}
	ldr r1, _0812BE58 @ =gUnknown_02023A60
	ldr r0, _0812BE5C @ =gUnknown_02024A60
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
	bl dp01_tbl6_exec_completed
	pop {r0}
	bx r0
	.align 2, 0
_0812BE58: .4byte gUnknown_02023A60
_0812BE5C: .4byte gUnknown_02024A60
_0812BE60: .4byte gUnknown_02024DE8
	thumb_func_end dp01t_2E_6_battle_intro

	thumb_func_start sub_812BE64
sub_812BE64: @ 812BE64
	push {r4,r5,lr}
	ldr r5, _0812BEA0 @ =gUnknown_03004340
	ldr r4, _0812BEA4 @ =gUnknown_02024A60
	ldrb r1, [r4]
	adds r0, r1, r5
	ldrb r0, [r0]
	ldr r2, _0812BEA8 @ =gUnknown_02024A6A
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
	bl dp01_tbl6_exec_completed
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_0812BEA0: .4byte gUnknown_03004340
_0812BEA4: .4byte gUnknown_02024A60
_0812BEA8: .4byte gUnknown_02024A6A
_0812BEAC: .4byte gPlayerParty
	thumb_func_end sub_812BE64

	thumb_func_start sub_812BEB0
sub_812BEB0: @ 812BEB0
	push {lr}
	bl dp01_tbl6_exec_completed
	pop {r0}
	bx r0
	thumb_func_end sub_812BEB0

	thumb_func_start sub_812BEBC
sub_812BEBC: @ 812BEBC
	push {lr}
	bl dp01_tbl6_exec_completed
	pop {r0}
	bx r0
	thumb_func_end sub_812BEBC

	thumb_func_start sub_812BEC8
sub_812BEC8: @ 812BEC8
	push {lr}
	bl dp01_tbl6_exec_completed
	pop {r0}
	bx r0
	thumb_func_end sub_812BEC8

	thumb_func_start sub_812BED4
sub_812BED4: @ 812BED4
	push {lr}
	bl dp01_tbl6_exec_completed
	pop {r0}
	bx r0
	thumb_func_end sub_812BED4

	thumb_func_start sub_812BEE0
sub_812BEE0: @ 812BEE0
	push {r4-r6,lr}
	sub sp, 0x4
	ldr r5, _0812BF18 @ =gUnknown_02023A60
	ldr r6, _0812BF1C @ =gUnknown_02024A60
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
	bl dp01_tbl6_exec_completed
	b _0812BF2C
	.align 2, 0
_0812BF18: .4byte gUnknown_02023A60
_0812BF1C: .4byte gUnknown_02024A60
_0812BF20:
	ldr r0, _0812BF34 @ =gUnknown_03004330
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
_0812BF34: .4byte gUnknown_03004330
_0812BF38: .4byte sub_812B794
	thumb_func_end sub_812BEE0

	thumb_func_start sub_812BF3C
sub_812BF3C: @ 812BF3C
	push {lr}
	bl dp01_tbl6_exec_completed
	pop {r0}
	bx r0
	thumb_func_end sub_812BF3C

	thumb_func_start sub_812BF48
sub_812BF48: @ 812BF48
	push {lr}
	bl dp01_tbl6_exec_completed
	pop {r0}
	bx r0
	thumb_func_end sub_812BF48

	thumb_func_start sub_812BF54
sub_812BF54: @ 812BF54
	push {r4,lr}
	ldr r2, _0812BF98 @ =gUnknown_02024D26
	ldr r1, _0812BF9C @ =gUnknown_02023A60
	ldr r4, _0812BFA0 @ =gUnknown_02024A60
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
	bl dp01_tbl6_exec_completed
	ldr r0, _0812BFA4 @ =gBattleTypeFlags
	ldrh r1, [r0]
	movs r0, 0x6
	ands r0, r1
	cmp r0, 0x2
	bne _0812BF90
	ldr r0, _0812BFA8 @ =gUnknown_03004330
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
_0812BF98: .4byte gUnknown_02024D26
_0812BF9C: .4byte gUnknown_02023A60
_0812BFA0: .4byte gUnknown_02024A60
_0812BFA4: .4byte gBattleTypeFlags
_0812BFA8: .4byte gUnknown_03004330
_0812BFAC: .4byte sub_812B6AC
	thumb_func_end sub_812BF54

	thumb_func_start nullsub_78
nullsub_78: @ 812BFB0
	bx lr
	thumb_func_end nullsub_78

	thumb_func_start SetUpFieldMove_SweetScent
SetUpFieldMove_SweetScent: @ 812BFB4
	ldr r1, _0812BFC4 @ =gUnknown_0300485C
	ldr r0, _0812BFC8 @ =sub_808AB90
	str r0, [r1]
	ldr r1, _0812BFCC @ =gUnknown_03005CE4
	ldr r0, _0812BFD0 @ =sub_812BFD4
	str r0, [r1]
	movs r0, 0x1
	bx lr
	.align 2, 0
_0812BFC4: .4byte gUnknown_0300485C
_0812BFC8: .4byte sub_808AB90
_0812BFCC: .4byte gUnknown_03005CE4
_0812BFD0: .4byte sub_812BFD4
	thumb_func_end SetUpFieldMove_SweetScent

	thumb_func_start sub_812BFD4
sub_812BFD4: @ 812BFD4
	push {lr}
	movs r0, 0x33
	bl FieldEffectStart
	ldr r0, _0812BFE8 @ =gUnknown_0202FF84
	ldr r1, _0812BFEC @ =gLastFieldPokeMenuOpened
	ldrb r1, [r1]
	str r1, [r0]
	pop {r0}
	bx r0
	.align 2, 0
_0812BFE8: .4byte gUnknown_0202FF84
_0812BFEC: .4byte gLastFieldPokeMenuOpened
	thumb_func_end sub_812BFD4

	thumb_func_start FldEff_SweetScent
FldEff_SweetScent: @ 812BFF0
	push {lr}
	bl oei_task_add
	lsls r0, 24
	lsrs r0, 24
	ldr r2, _0812C014 @ =gTasks
	lsls r1, r0, 2
	adds r1, r0
	lsls r1, 3
	adds r1, r2
	ldr r2, _0812C018 @ =sub_812C01C
	lsrs r0, r2, 16
	strh r0, [r1, 0x18]
	strh r2, [r1, 0x1A]
	movs r0, 0
	pop {r1}
	bx r1
	.align 2, 0
_0812C014: .4byte gTasks
_0812C018: .4byte sub_812C01C
	thumb_func_end FldEff_SweetScent

	thumb_func_start sub_812C01C
sub_812C01C: @ 812C01C
	push {lr}
	sub sp, 0x4
	movs r0, 0xEC
	bl PlaySE
	bl GetPlayerAvatarObjectId
	ldr r2, _0812C078 @ =gSprites
	lsls r0, 24
	lsrs r0, 24
	lsls r1, r0, 4
	adds r1, r0
	lsls r1, 2
	adds r1, r2
	ldrb r1, [r1, 0x5]
	lsrs r1, 4
	adds r1, 0x10
	movs r0, 0x1
	lsls r0, r1
	mvns r0, r0
	movs r1, 0x1F
	str r1, [sp]
	movs r1, 0x4
	movs r2, 0
	movs r3, 0x8
	bl BeginNormalPaletteFade
	ldr r0, _0812C07C @ =sub_812C084
	movs r1, 0
	bl CreateTask
	lsls r0, 24
	lsrs r0, 24
	ldr r2, _0812C080 @ =gTasks
	lsls r1, r0, 2
	adds r1, r0
	lsls r1, 3
	adds r1, r2
	movs r0, 0
	strh r0, [r1, 0x8]
	movs r0, 0x33
	bl FieldEffectActiveListRemove
	add sp, 0x4
	pop {r0}
	bx r0
	.align 2, 0
_0812C078: .4byte gSprites
_0812C07C: .4byte sub_812C084
_0812C080: .4byte gTasks
	thumb_func_end sub_812C01C

	thumb_func_start sub_812C084
sub_812C084: @ 812C084
	push {r4,r5,lr}
	sub sp, 0x4
	lsls r0, 24
	lsrs r5, r0, 24
	ldr r0, _0812C0C8 @ =gPaletteFade
	ldrb r1, [r0, 0x7]
	movs r0, 0x80
	ands r0, r1
	lsls r0, 24
	lsrs r2, r0, 24
	cmp r2, 0
	bne _0812C110
	ldr r0, _0812C0CC @ =gTasks
	lsls r1, r5, 2
	adds r1, r5
	lsls r1, 3
	adds r4, r1, r0
	ldrh r1, [r4, 0x8]
	movs r3, 0x8
	ldrsh r0, [r4, r3]
	cmp r0, 0x40
	bne _0812C10C
	strh r2, [r4, 0x8]
	bl SweetScentWildEncounter
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _0812C0D0
	adds r0, r5, 0
	bl DestroyTask
	b _0812C110
	.align 2, 0
_0812C0C8: .4byte gPaletteFade
_0812C0CC: .4byte gTasks
_0812C0D0:
	ldr r0, _0812C104 @ =sub_812C118
	str r0, [r4]
	bl GetPlayerAvatarObjectId
	ldr r2, _0812C108 @ =gSprites
	lsls r0, 24
	lsrs r0, 24
	lsls r1, r0, 4
	adds r1, r0
	lsls r1, 2
	adds r1, r2
	ldrb r1, [r1, 0x5]
	lsrs r1, 4
	adds r1, 0x10
	movs r0, 0x1
	lsls r0, r1
	mvns r0, r0
	movs r1, 0x1F
	str r1, [sp]
	movs r1, 0x4
	movs r2, 0x8
	movs r3, 0
	bl BeginNormalPaletteFade
	b _0812C110
	.align 2, 0
_0812C104: .4byte sub_812C118
_0812C108: .4byte gSprites
_0812C10C:
	adds r0, r1, 0x1
	strh r0, [r4, 0x8]
_0812C110:
	add sp, 0x4
	pop {r4,r5}
	pop {r0}
	bx r0
	thumb_func_end sub_812C084

	thumb_func_start sub_812C118
sub_812C118: @ 812C118
	push {r4,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	ldr r0, _0812C13C @ =gPaletteFade
	ldrb r1, [r0, 0x7]
	movs r0, 0x80
	ands r0, r1
	cmp r0, 0
	bne _0812C136
	ldr r0, _0812C140 @ =SweetScentNothingHereScript
	bl ScriptContext1_SetupScript
	adds r0, r4, 0
	bl DestroyTask
_0812C136:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0812C13C: .4byte gPaletteFade
_0812C140: .4byte SweetScentNothingHereScript
	thumb_func_end sub_812C118

	thumb_func_start sub_812C144
sub_812C144: @ 812C144
	push {lr}
	adds r2, r0, 0
	ldr r1, _0812C168 @ =gBattleAnimArgs
	ldrh r0, [r1]
	ldrh r3, [r2, 0x20]
	adds r0, r3
	strh r0, [r2, 0x20]
	ldrh r0, [r1, 0x2]
	ldrh r3, [r2, 0x22]
	adds r0, r3
	strh r0, [r2, 0x22]
	movs r3, 0x6
	ldrsh r0, [r1, r3]
	cmp r0, 0
	bne _0812C16C
	ldrh r0, [r1, 0x4]
	b _0812C170
	.align 2, 0
_0812C168: .4byte gBattleAnimArgs
_0812C16C:
	ldrh r0, [r1, 0x4]
	negs r0, r0
_0812C170:
	strh r0, [r2, 0x2E]
	ldrh r0, [r1, 0x8]
	strh r0, [r2, 0x30]
	ldr r0, _0812C180 @ =sub_812C184
	str r0, [r2, 0x1C]
	pop {r0}
	bx r0
	.align 2, 0
_0812C180: .4byte sub_812C184
	thumb_func_end sub_812C144

	thumb_func_start sub_812C184
sub_812C184: @ 812C184
	push {lr}
	adds r3, r0, 0
	movs r1, 0x30
	ldrsh r0, [r3, r1]
	cmp r0, 0
	ble _0812C1C4
	ldrh r1, [r3, 0x32]
	lsls r0, r1, 16
	asrs r0, 24
	strh r0, [r3, 0x24]
	ldrh r0, [r3, 0x2E]
	adds r1, r0
	strh r1, [r3, 0x32]
	movs r0, 0x3E
	adds r0, r3
	mov r12, r0
	ldrb r2, [r0]
	lsls r0, r2, 29
	lsrs r0, 31
	movs r1, 0x1
	eors r1, r0
	lsls r1, 2
	movs r0, 0x5
	negs r0, r0
	ands r0, r2
	orrs r0, r1
	mov r1, r12
	strb r0, [r1]
	ldrh r0, [r3, 0x30]
	subs r0, 0x1
	strh r0, [r3, 0x30]
	b _0812C1CA
_0812C1C4:
	adds r0, r3, 0
	bl move_anim_8072740
_0812C1CA:
	pop {r0}
	bx r0
	thumb_func_end sub_812C184

	thumb_func_start sub_812C1D0
sub_812C1D0: @ 812C1D0
	push {r4-r6,lr}
	adds r5, r0, 0
	lsls r5, 24
	lsrs r5, 24
	ldr r6, _0812C21C @ =gUnknown_0202F7C9
	ldrb r0, [r6]
	movs r1, 0x2
	bl sub_8077ABC
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 8
	movs r0, 0x80
	lsls r0, 12
	adds r4, r0
	asrs r4, 16
	ldrb r0, [r6]
	movs r1, 0x3
	bl sub_8077ABC
	adds r1, r0, 0
	lsls r1, 24
	lsrs r1, 8
	movs r0, 0x80
	lsls r0, 12
	adds r1, r0
	asrs r1, 16
	adds r0, r4, 0
	movs r2, 0
	bl sub_8046234
	adds r0, r5, 0
	bl move_anim_task_del
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_0812C21C: .4byte gUnknown_0202F7C9
	thumb_func_end sub_812C1D0

	thumb_func_start sub_812C220
sub_812C220: @ 812C220
	push {r4,lr}
	adds r4, r0, 0
	movs r0, 0x5A
	strh r0, [r4, 0x2E]
	ldr r0, _0812C258 @ =sub_80782D8
	str r0, [r4, 0x1C]
	movs r0, 0x7
	strh r0, [r4, 0x30]
	ldr r1, _0812C25C @ =sub_812C268
	adds r0, r4, 0
	bl oamt_set_x3A_32
	ldr r1, _0812C260 @ =REG_BLDCNT
	movs r2, 0xFD
	lsls r2, 6
	adds r0, r2, 0
	strh r0, [r1]
	ldr r2, _0812C264 @ =REG_BLDALPHA
	ldrh r1, [r4, 0x30]
	movs r0, 0x10
	subs r0, r1
	lsls r0, 8
	orrs r0, r1
	strh r0, [r2]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0812C258: .4byte sub_80782D8
_0812C25C: .4byte sub_812C268
_0812C260: .4byte REG_BLDCNT
_0812C264: .4byte REG_BLDALPHA
	thumb_func_end sub_812C220

	thumb_func_start sub_812C268
sub_812C268: @ 812C268
	push {lr}
	adds r3, r0, 0
	ldr r2, _0812C29C @ =REG_BLDALPHA
	ldrh r1, [r3, 0x30]
	movs r0, 0x10
	subs r0, r1
	lsls r0, 8
	orrs r0, r1
	strh r0, [r2]
	ldrh r0, [r3, 0x30]
	subs r0, 0x1
	strh r0, [r3, 0x30]
	lsls r0, 16
	cmp r0, 0
	bge _0812C296
	adds r2, r3, 0
	adds r2, 0x3E
	ldrb r0, [r2]
	movs r1, 0x4
	orrs r0, r1
	strb r0, [r2]
	ldr r0, _0812C2A0 @ =sub_812C2A4
	str r0, [r3, 0x1C]
_0812C296:
	pop {r0}
	bx r0
	.align 2, 0
_0812C29C: .4byte REG_BLDALPHA
_0812C2A0: .4byte sub_812C2A4
	thumb_func_end sub_812C268

	thumb_func_start sub_812C2A4
sub_812C2A4: @ 812C2A4
	push {lr}
	ldr r1, _0812C2B8 @ =REG_BLDCNT
	movs r2, 0
	strh r2, [r1]
	adds r1, 0x2
	strh r2, [r1]
	bl move_anim_8072740
	pop {r0}
	bx r0
	.align 2, 0
_0812C2B8: .4byte REG_BLDCNT
	thumb_func_end sub_812C2A4

	thumb_func_start sub_812C2BC
sub_812C2BC: @ 812C2BC
	push {r4-r7,lr}
	sub sp, 0x4
	adds r5, r0, 0
	ldr r4, _0812C348 @ =gUnknown_0202F7C9
	ldrb r0, [r4]
	movs r1, 0x2
	bl sub_8077ABC
	lsls r0, 24
	lsrs r0, 24
	adds r7, r0, 0
	ldrb r0, [r4]
	movs r1, 0x3
	bl sub_8077ABC
	lsls r0, 24
	lsrs r0, 24
	adds r6, r0, 0
	adds r0, r5, 0
	movs r1, 0x1
	bl sub_8078764
	ldrh r0, [r5, 0x20]
	subs r0, r7
	lsls r0, 16
	asrs r0, 16
	ldrh r1, [r5, 0x22]
	subs r1, r6
	lsls r1, 16
	asrs r1, 16
	bl sub_80790F0
	lsls r0, 16
	movs r1, 0xC0
	lsls r1, 23
	adds r0, r1
	lsrs r4, r0, 16
	bl sub_8076BE0
	lsls r0, 24
	cmp r0, 0
	beq _0812C31A
	movs r1, 0x80
	lsls r1, 7
	adds r0, r4, r1
	lsls r0, 16
	lsrs r4, r0, 16
_0812C31A:
	movs r3, 0x80
	lsls r3, 1
	str r4, [sp]
	adds r0, r5, 0
	movs r1, 0
	adds r2, r3, 0
	bl sub_8078FDC
	ldr r0, _0812C34C @ =gBattleAnimArgs
	ldrh r0, [r0, 0x4]
	strh r0, [r5, 0x2E]
	strh r7, [r5, 0x32]
	strh r6, [r5, 0x36]
	ldr r0, _0812C350 @ =sub_8078B34
	str r0, [r5, 0x1C]
	ldr r1, _0812C354 @ =move_anim_8072740
	adds r0, r5, 0
	bl oamt_set_x3A_32
	add sp, 0x4
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_0812C348: .4byte gUnknown_0202F7C9
_0812C34C: .4byte gBattleAnimArgs
_0812C350: .4byte sub_8078B34
_0812C354: .4byte move_anim_8072740
	thumb_func_end sub_812C2BC

	thumb_func_start sub_812C358
sub_812C358: @ 812C358
	ldr r2, _0812C378 @ =REG_BLDCNT
	movs r3, 0xFD
	lsls r3, 6
	adds r1, r3, 0
	strh r1, [r2]
	adds r2, 0x2
	movs r3, 0x80
	lsls r3, 5
	adds r1, r3, 0
	strh r1, [r2]
	movs r1, 0x4
	strh r1, [r0, 0x2E]
	ldr r1, _0812C37C @ =sub_812C380
	str r1, [r0, 0x1C]
	bx lr
	.align 2, 0
_0812C378: .4byte REG_BLDCNT
_0812C37C: .4byte sub_812C380
	thumb_func_end sub_812C358

	thumb_func_start sub_812C380
sub_812C380: @ 812C380
	push {r4,lr}
	adds r4, r0, 0
	ldr r2, _0812C3A0 @ =REG_BLDALPHA
	ldrh r1, [r4, 0x2E]
	movs r0, 0x10
	subs r0, r1
	lsls r0, 8
	orrs r0, r1
	strh r0, [r2]
	movs r1, 0x30
	ldrsh r0, [r4, r1]
	cmp r0, 0
	beq _0812C3A4
	ldrh r0, [r4, 0x2E]
	subs r0, 0x1
	b _0812C3A8
	.align 2, 0
_0812C3A0: .4byte REG_BLDALPHA
_0812C3A4:
	ldrh r0, [r4, 0x2E]
	adds r0, 0x1
_0812C3A8:
	strh r0, [r4, 0x2E]
	movs r1, 0x2E
	ldrsh r0, [r4, r1]
	cmp r0, 0xF
	beq _0812C3B6
	cmp r0, 0x4
	bne _0812C3BE
_0812C3B6:
	ldrh r0, [r4, 0x30]
	movs r1, 0x1
	eors r0, r1
	strh r0, [r4, 0x30]
_0812C3BE:
	ldrh r0, [r4, 0x32]
	adds r1, r0, 0x1
	strh r1, [r4, 0x32]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x46
	ble _0812C3FC
	ldr r0, _0812C404 @ =REG_BLDCNT
	movs r1, 0
	strh r1, [r0]
	adds r0, 0x2
	strh r1, [r0]
	adds r0, r4, 0
	movs r1, 0x1
	bl StartSpriteAffineAnim
	movs r0, 0
	strh r0, [r4, 0x32]
	adds r2, r4, 0
	adds r2, 0x3E
	ldrb r0, [r2]
	movs r1, 0x4
	orrs r0, r1
	strb r0, [r2]
	subs r2, 0x12
	ldrb r0, [r2]
	movs r1, 0x80
	orrs r0, r1
	strb r0, [r2]
	ldr r0, _0812C408 @ =sub_812C40C
	str r0, [r4, 0x1C]
_0812C3FC:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0812C404: .4byte REG_BLDCNT
_0812C408: .4byte sub_812C40C
	thumb_func_end sub_812C380

	thumb_func_start sub_812C40C
sub_812C40C: @ 812C40C
	push {lr}
	adds r3, r0, 0
	ldrh r0, [r3, 0x32]
	adds r1, r0, 0x1
	strh r1, [r3, 0x32]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x9
	ble _0812C448
	adds r2, r3, 0
	adds r2, 0x3E
	ldrb r1, [r2]
	movs r0, 0x5
	negs r0, r0
	ands r0, r1
	strb r0, [r2]
	subs r2, 0x12
	ldrb r1, [r2]
	movs r0, 0x7F
	ands r0, r1
	strb r0, [r2]
	adds r0, r3, 0
	adds r0, 0x3F
	ldrb r1, [r0]
	movs r0, 0x20
	ands r0, r1
	cmp r0, 0
	beq _0812C448
	ldr r0, _0812C44C @ =sub_812C450
	str r0, [r3, 0x1C]
_0812C448:
	pop {r0}
	bx r0
	.align 2, 0
_0812C44C: .4byte sub_812C450
	thumb_func_end sub_812C40C

	thumb_func_start sub_812C450
sub_812C450: @ 812C450
	push {lr}
	adds r2, r0, 0
	movs r1, 0x34
	ldrsh r0, [r2, r1]
	cmp r0, 0x6
	bhi _0812C4A8
	lsls r0, 2
	ldr r1, _0812C468 @ =_0812C46C
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_0812C468: .4byte _0812C46C
	.align 2, 0
_0812C46C:
	.4byte _0812C488
	.4byte _0812C488
	.4byte _0812C492
	.4byte _0812C492
	.4byte _0812C4A0
	.4byte _0812C4A0
	.4byte _0812C4A8
_0812C488:
	movs r1, 0
	movs r0, 0x1
	strh r0, [r2, 0x24]
	strh r1, [r2, 0x26]
	b _0812C4B0
_0812C492:
	ldr r0, _0812C49C @ =0x0000ffff
	strh r0, [r2, 0x24]
	movs r0, 0
	b _0812C4AE
	.align 2, 0
_0812C49C: .4byte 0x0000ffff
_0812C4A0:
	movs r0, 0
	strh r0, [r2, 0x24]
	movs r0, 0x1
	b _0812C4AE
_0812C4A8:
	movs r0, 0
	strh r0, [r2, 0x24]
	ldr r0, _0812C4F0 @ =0x0000ffff
_0812C4AE:
	strh r0, [r2, 0x26]
_0812C4B0:
	ldrh r0, [r2, 0x34]
	adds r0, 0x1
	movs r3, 0
	strh r0, [r2, 0x34]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x7
	ble _0812C4C2
	strh r3, [r2, 0x34]
_0812C4C2:
	ldrh r0, [r2, 0x36]
	adds r1, r0, 0x1
	strh r1, [r2, 0x36]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0xF
	ble _0812C4EA
	movs r0, 0x10
	strh r0, [r2, 0x2E]
	strh r3, [r2, 0x30]
	ldr r1, _0812C4F4 @ =REG_BLDCNT
	movs r3, 0xFD
	lsls r3, 6
	adds r0, r3, 0
	strh r0, [r1]
	adds r1, 0x2
	ldrh r0, [r2, 0x2E]
	strh r0, [r1]
	ldr r0, _0812C4F8 @ =sub_812C4FC
	str r0, [r2, 0x1C]
_0812C4EA:
	pop {r0}
	bx r0
	.align 2, 0
_0812C4F0: .4byte 0x0000ffff
_0812C4F4: .4byte REG_BLDCNT
_0812C4F8: .4byte sub_812C4FC
	thumb_func_end sub_812C450

	thumb_func_start sub_812C4FC
sub_812C4FC: @ 812C4FC
	push {r4,lr}
	adds r2, r0, 0
	ldr r4, _0812C558 @ =REG_BLDALPHA
	ldrh r1, [r2, 0x2E]
	movs r0, 0x10
	subs r0, r1
	lsls r0, 8
	orrs r0, r1
	strh r0, [r4]
	ldrh r0, [r2, 0x30]
	adds r1, r0, 0x1
	strh r1, [r2, 0x30]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x1
	ble _0812C526
	ldrh r0, [r2, 0x2E]
	subs r0, 0x1
	movs r1, 0
	strh r0, [r2, 0x2E]
	strh r1, [r2, 0x30]
_0812C526:
	movs r1, 0x2E
	ldrsh r0, [r2, r1]
	cmp r0, 0
	bne _0812C53A
	adds r3, r2, 0
	adds r3, 0x3E
	ldrb r0, [r3]
	movs r1, 0x4
	orrs r0, r1
	strb r0, [r3]
_0812C53A:
	movs r1, 0x2E
	ldrsh r0, [r2, r1]
	cmp r0, 0
	bge _0812C550
	ldr r1, _0812C55C @ =REG_BLDCNT
	movs r0, 0
	strh r0, [r1]
	strh r0, [r4]
	adds r0, r2, 0
	bl move_anim_8072740
_0812C550:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0812C558: .4byte REG_BLDALPHA
_0812C55C: .4byte REG_BLDCNT
	thumb_func_end sub_812C4FC

	thumb_func_start sub_812C560
sub_812C560: @ 812C560
	lsls r0, 24
	lsrs r0, 24
	ldr r2, _0812C57C @ =gTasks
	lsls r1, r0, 2
	adds r1, r0
	lsls r1, 3
	adds r1, r2
	ldr r0, _0812C580 @ =sub_812C588
	str r0, [r1]
	ldr r1, _0812C584 @ =gUnknown_0202F7B2
	ldrb r0, [r1]
	subs r0, 0x1
	strb r0, [r1]
	bx lr
	.align 2, 0
_0812C57C: .4byte gTasks
_0812C580: .4byte sub_812C588
_0812C584: .4byte gUnknown_0202F7B2
	thumb_func_end sub_812C560

	thumb_func_start sub_812C588
sub_812C588: @ 812C588
	push {r4-r7,lr}
	mov r7, r9
	mov r6, r8
	push {r6,r7}
	lsls r0, 24
	lsrs r4, r0, 24
	bl sub_80789BC
	lsls r0, 24
	lsrs r6, r0, 24
	ldr r7, _0812C614 @ =gTasks
	lsls r5, r4, 2
	adds r1, r5, r4
	lsls r1, 3
	adds r1, r7
	ldrh r0, [r1, 0x12]
	adds r0, 0x1
	strh r0, [r1, 0x12]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x4
	bne _0812C5F8
	ldr r0, _0812C618 @ =gPlttBufferFaded
	lsls r2, r6, 4
	adds r1, r2, 0
	adds r1, 0xB
	lsls r1, 1
	adds r1, r0
	ldrh r3, [r1]
	mov r8, r3
	movs r3, 0xA
	mov r9, r7
	adds r7, r5, 0
	mov r12, r0
	adds r5, r2, 0
	lsls r0, r6, 5
	add r0, r12
	adds r2, r0, 0
	adds r2, 0x14
_0812C5D6:
	ldrh r0, [r2]
	strh r0, [r1]
	subs r2, 0x2
	subs r1, 0x2
	subs r3, 0x1
	cmp r3, 0
	bgt _0812C5D6
	adds r0, r5, 0x1
	lsls r0, 1
	add r0, r12
	movs r1, 0
	mov r2, r8
	strh r2, [r0]
	adds r0, r7, r4
	lsls r0, 3
	add r0, r9
	strh r1, [r0, 0x12]
_0812C5F8:
	ldr r0, _0812C61C @ =gBattleAnimArgs
	ldrh r1, [r0, 0xE]
	ldr r0, _0812C620 @ =0x0000ffff
	cmp r1, r0
	bne _0812C608
	adds r0, r4, 0
	bl DestroyTask
_0812C608:
	pop {r3,r4}
	mov r8, r3
	mov r9, r4
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_0812C614: .4byte gTasks
_0812C618: .4byte gPlttBufferFaded
_0812C61C: .4byte gBattleAnimArgs
_0812C620: .4byte 0x0000ffff
	thumb_func_end sub_812C588

	thumb_func_start sub_812C624
sub_812C624: @ 812C624
	lsls r0, 24
	lsrs r0, 24
	ldr r2, _0812C640 @ =gTasks
	lsls r1, r0, 2
	adds r1, r0
	lsls r1, 3
	adds r1, r2
	ldr r0, _0812C644 @ =sub_812C64C
	str r0, [r1]
	ldr r1, _0812C648 @ =gUnknown_0202F7B2
	ldrb r0, [r1]
	subs r0, 0x1
	strb r0, [r1]
	bx lr
	.align 2, 0
_0812C640: .4byte gTasks
_0812C644: .4byte sub_812C64C
_0812C648: .4byte gUnknown_0202F7B2
	thumb_func_end sub_812C624

	thumb_func_start sub_812C64C
sub_812C64C: @ 812C64C
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	lsls r0, 24
	lsrs r0, 24
	mov r8, r0
	bl sub_80789BC
	lsls r0, 24
	lsrs r7, r0, 24
	ldr r5, _0812C70C @ =gTasks
	mov r0, r8
	lsls r3, r0, 2
	adds r1, r3, r0
	lsls r1, 3
	adds r1, r5
	ldrh r0, [r1, 0x12]
	adds r0, 0x1
	strh r0, [r1, 0x12]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x4
	bne _0812C6EE
	ldr r0, _0812C710 @ =gPlttBufferFaded
	lsls r2, r7, 4
	adds r1, r2, 0
	adds r1, 0xB
	lsls r1, 1
	adds r1, r0
	ldrh r6, [r1]
	movs r4, 0xA
	mov r10, r3
	mov r9, r0
	adds r5, r2, 0
	ldr r2, _0812C714 @ =gPlttBufferUnfaded
	mov r12, r2
	lsls r0, r7, 5
	add r0, r9
	adds r3, r0, 0
	adds r3, 0x14
_0812C6A0:
	ldrh r0, [r3]
	strh r0, [r1]
	subs r3, 0x2
	subs r1, 0x2
	subs r4, 0x1
	cmp r4, 0
	bgt _0812C6A0
	adds r0, r5, 0x1
	lsls r0, 1
	add r0, r9
	strh r6, [r0]
	adds r1, r5, 0
	adds r1, 0xB
	lsls r1, 1
	add r1, r12
	ldrh r6, [r1]
	movs r4, 0xA
	lsls r0, r7, 5
	add r0, r12
	adds r2, r0, 0
	adds r2, 0x14
_0812C6CA:
	ldrh r0, [r2]
	strh r0, [r1]
	subs r2, 0x2
	subs r1, 0x2
	subs r4, 0x1
	cmp r4, 0
	bgt _0812C6CA
	adds r0, r5, 0x1
	lsls r0, 1
	add r0, r12
	movs r1, 0
	strh r6, [r0]
	mov r0, r10
	add r0, r8
	lsls r0, 3
	ldr r2, _0812C70C @ =gTasks
	adds r0, r2
	strh r1, [r0, 0x12]
_0812C6EE:
	ldr r0, _0812C718 @ =gBattleAnimArgs
	ldrh r1, [r0, 0xE]
	ldr r0, _0812C71C @ =0x0000ffff
	cmp r1, r0
	bne _0812C6FE
	mov r0, r8
	bl DestroyTask
_0812C6FE:
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_0812C70C: .4byte gTasks
_0812C710: .4byte gPlttBufferFaded
_0812C714: .4byte gPlttBufferUnfaded
_0812C718: .4byte gBattleAnimArgs
_0812C71C: .4byte 0x0000ffff
	thumb_func_end sub_812C64C

	thumb_func_start sub_812C720
sub_812C720: @ 812C720
	push {r4,r5,lr}
	sub sp, 0x4
	adds r4, r0, 0
	movs r1, 0x1
	bl sub_80787B0
	ldr r0, _0812C784 @ =gUnknown_0202F7C9
	ldrb r0, [r0]
	mov r5, sp
	adds r5, 0x2
	movs r1, 0
	mov r2, sp
	adds r3, r5, 0
	bl sub_807A3FC
	ldr r0, _0812C788 @ =gUnknown_0202F7C8
	ldrb r0, [r0]
	bl battle_side_get_owner
	lsls r0, 24
	cmp r0, 0
	beq _0812C754
	ldr r1, _0812C78C @ =gBattleAnimArgs
	ldrh r0, [r1, 0x4]
	negs r0, r0
	strh r0, [r1, 0x4]
_0812C754:
	ldr r1, _0812C78C @ =gBattleAnimArgs
	ldrh r0, [r1, 0x8]
	strh r0, [r4, 0x2E]
	mov r2, sp
	ldrh r0, [r1, 0x4]
	ldrh r2, [r2]
	adds r0, r2
	strh r0, [r4, 0x32]
	ldrh r0, [r1, 0x6]
	ldrh r5, [r5]
	adds r0, r5
	strh r0, [r4, 0x36]
	ldr r0, _0812C790 @ =0x0000ffce
	strh r0, [r4, 0x38]
	adds r0, r4, 0
	bl sub_80786EC
	ldr r0, _0812C794 @ =sub_812C798
	str r0, [r4, 0x1C]
	add sp, 0x4
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_0812C784: .4byte gUnknown_0202F7C9
_0812C788: .4byte gUnknown_0202F7C8
_0812C78C: .4byte gBattleAnimArgs
_0812C790: .4byte 0x0000ffce
_0812C794: .4byte sub_812C798
	thumb_func_end sub_812C720

	thumb_func_start sub_812C798
sub_812C798: @ 812C798
	push {r4,lr}
	adds r4, r0, 0
	bl sub_8078718
	lsls r0, 24
	cmp r0, 0
	beq _0812C7BA
	movs r1, 0
	movs r0, 0x1E
	strh r0, [r4, 0x2E]
	strh r1, [r4, 0x30]
	ldr r0, _0812C7C0 @ =sub_80782D8
	str r0, [r4, 0x1C]
	ldr r1, _0812C7C4 @ =sub_812C7C8
	adds r0, r4, 0
	bl oamt_set_x3A_32
_0812C7BA:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0812C7C0: .4byte sub_80782D8
_0812C7C4: .4byte sub_812C7C8
	thumb_func_end sub_812C798

	thumb_func_start sub_812C7C8
sub_812C7C8: @ 812C7C8
	push {lr}
	adds r3, r0, 0
	ldrh r1, [r3, 0x30]
	movs r0, 0x1
	ands r0, r1
	cmp r0, 0
	beq _0812C7F4
	movs r0, 0x3E
	adds r0, r3
	mov r12, r0
	ldrb r2, [r0]
	lsls r0, r2, 29
	lsrs r0, 31
	movs r1, 0x1
	eors r1, r0
	lsls r1, 2
	movs r0, 0x5
	negs r0, r0
	ands r0, r2
	orrs r0, r1
	mov r1, r12
	strb r0, [r1]
_0812C7F4:
	ldrh r0, [r3, 0x30]
	adds r0, 0x1
	strh r0, [r3, 0x30]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x10
	bne _0812C808
	adds r0, r3, 0
	bl move_anim_8072740
_0812C808:
	pop {r0}
	bx r0
	thumb_func_end sub_812C7C8

	thumb_func_start sub_812C80C
sub_812C80C: @ 812C80C
	push {r4,r5,lr}
	adds r4, r0, 0
	bl sub_8078650
	ldr r5, _0812C83C @ =gBattleAnimArgs
	movs r0, 0
	ldrsh r1, [r5, r0]
	adds r0, r4, 0
	bl sub_807867C
	ldrh r0, [r5, 0x2]
	ldrh r1, [r4, 0x22]
	adds r0, r1
	strh r0, [r4, 0x22]
	ldr r0, _0812C840 @ =sub_8078600
	str r0, [r4, 0x1C]
	ldr r1, _0812C844 @ =move_anim_8072740
	adds r0, r4, 0
	bl oamt_set_x3A_32
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_0812C83C: .4byte gBattleAnimArgs
_0812C840: .4byte sub_8078600
_0812C844: .4byte move_anim_8072740
	thumb_func_end sub_812C80C

	thumb_func_start sub_812C848
sub_812C848: @ 812C848
	push {r4,r5,lr}
	adds r4, r0, 0
	movs r1, 0x2E
	ldrsh r0, [r4, r1]
	cmp r0, 0
	bne _0812C8A8
	adds r0, r4, 0
	bl sub_8078650
	ldr r5, _0812C884 @ =gBattleAnimArgs
	movs r2, 0
	ldrsh r1, [r5, r2]
	adds r0, r4, 0
	bl sub_807867C
	bl sub_8076BE0
	lsls r0, 24
	cmp r0, 0
	bne _0812C89C
	ldr r0, _0812C888 @ =gUnknown_0202F7C8
	ldrb r0, [r0]
	bl battle_side_get_owner
	lsls r0, 24
	cmp r0, 0
	bne _0812C88C
	ldrh r0, [r5, 0x4]
	b _0812C8A2
	.align 2, 0
_0812C884: .4byte gBattleAnimArgs
_0812C888: .4byte gUnknown_0202F7C8
_0812C88C:
	movs r1, 0x4
	ldrsh r0, [r5, r1]
	negs r0, r0
	strh r0, [r4, 0x30]
	movs r2, 0x6
	ldrsh r0, [r5, r2]
	negs r0, r0
	b _0812C8A6
_0812C89C:
	movs r1, 0x4
	ldrsh r0, [r5, r1]
	negs r0, r0
_0812C8A2:
	strh r0, [r4, 0x30]
	ldrh r0, [r5, 0x6]
_0812C8A6:
	strh r0, [r4, 0x32]
_0812C8A8:
	ldrh r0, [r4, 0x2E]
	adds r0, 0x1
	strh r0, [r4, 0x2E]
	movs r2, 0x2E
	ldrsh r1, [r4, r2]
	lsls r0, r1, 2
	adds r0, r1
	lsls r0, 2
	movs r3, 0xFF
	ldrh r1, [r4, 0x30]
	ldrh r2, [r4, 0x34]
	adds r1, r2
	strh r1, [r4, 0x34]
	ldrh r1, [r4, 0x32]
	ldrh r2, [r4, 0x36]
	adds r1, r2
	strh r1, [r4, 0x36]
	movs r2, 0x34
	ldrsh r1, [r4, r2]
	lsrs r2, r1, 31
	adds r1, r2
	asrs r1, 1
	strh r1, [r4, 0x24]
	ands r0, r3
	movs r1, 0x5
	bl Sin
	movs r2, 0x36
	ldrsh r1, [r4, r2]
	lsrs r2, r1, 31
	adds r1, r2
	asrs r1, 1
	adds r0, r1
	strh r0, [r4, 0x26]
	ldrh r0, [r4, 0x24]
	ldrh r1, [r4, 0x20]
	adds r0, r1
	lsls r0, 16
	lsrs r0, 16
	cmp r0, 0xF0
	bls _0812C900
	adds r0, r4, 0
	bl move_anim_8072740
_0812C900:
	pop {r4,r5}
	pop {r0}
	bx r0
	thumb_func_end sub_812C848

	thumb_func_start sub_812C908
sub_812C908: @ 812C908
	push {lr}
	adds r2, r0, 0
	adds r0, 0x3F
	ldrb r1, [r0]
	movs r0, 0x10
	ands r0, r1
	cmp r0, 0
	beq _0812C91E
	adds r0, r2, 0
	bl move_anim_8072740
_0812C91E:
	pop {r0}
	bx r0
	thumb_func_end sub_812C908

	thumb_func_start sub_812C924
sub_812C924: @ 812C924
	push {r4,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	ldr r0, _0812C940 @ =gUnknown_0202F7C9
	ldrb r0, [r0]
	bl battle_side_get_owner
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _0812C948
	ldr r1, _0812C944 @ =gBattleAnimArgs
	movs r0, 0
	b _0812C94C
	.align 2, 0
_0812C940: .4byte gUnknown_0202F7C9
_0812C944: .4byte gBattleAnimArgs
_0812C948:
	ldr r1, _0812C95C @ =gBattleAnimArgs
	movs r0, 0x1
_0812C94C:
	strh r0, [r1, 0xE]
	adds r0, r4, 0
	bl move_anim_task_del
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0812C95C: .4byte gBattleAnimArgs
	thumb_func_end sub_812C924

	thumb_func_start sub_812C960
sub_812C960: @ 812C960
	push {lr}
	lsls r0, 24
	lsrs r2, r0, 24
	ldr r0, _0812C974 @ =gUnknown_0202F7B8
	ldr r0, [r0]
	cmp r0, 0
	ble _0812C97C
	ldr r1, _0812C978 @ =gBattleAnimArgs
	movs r0, 0
	b _0812C980
	.align 2, 0
_0812C974: .4byte gUnknown_0202F7B8
_0812C978: .4byte gBattleAnimArgs
_0812C97C:
	ldr r1, _0812C98C @ =gBattleAnimArgs
	movs r0, 0x1
_0812C980:
	strh r0, [r1, 0xE]
	adds r0, r2, 0
	bl move_anim_task_del
	pop {r0}
	bx r0
	.align 2, 0
_0812C98C: .4byte gBattleAnimArgs
	thumb_func_end sub_812C960

	thumb_func_start sub_812C990
sub_812C990: @ 812C990
	push {r4,lr}
	adds r4, r0, 0
	ldr r1, _0812C9EC @ =REG_WINOUT
	ldr r2, _0812C9F0 @ =0x00001f3f
	adds r0, r2, 0
	strh r0, [r1]
	movs r2, 0x80
	lsls r2, 19
	ldrh r0, [r2]
	movs r3, 0x80
	lsls r3, 8
	adds r1, r3, 0
	orrs r0, r1
	strh r0, [r2]
	ldr r0, _0812C9F4 @ =gUnknown_030042C4
	movs r1, 0
	strh r1, [r0]
	ldr r0, _0812C9F8 @ =gUnknown_03004240
	strh r1, [r0]
	ldr r0, _0812C9FC @ =REG_WIN0H
	strh r1, [r0]
	adds r0, 0x4
	strh r1, [r0]
	adds r0, r4, 0
	movs r1, 0
	bl sub_8078764
	ldrb r1, [r4, 0x1]
	movs r0, 0xD
	negs r0, r0
	ands r0, r1
	movs r1, 0x8
	orrs r0, r1
	strb r0, [r4, 0x1]
	adds r2, r4, 0
	adds r2, 0x3E
	ldrb r0, [r2]
	movs r1, 0x4
	orrs r0, r1
	strb r0, [r2]
	ldr r0, _0812CA00 @ =sub_812CA04
	str r0, [r4, 0x1C]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0812C9EC: .4byte REG_WINOUT
_0812C9F0: .4byte 0x00001f3f
_0812C9F4: .4byte gUnknown_030042C4
_0812C9F8: .4byte gUnknown_03004240
_0812C9FC: .4byte REG_WIN0H
_0812CA00: .4byte sub_812CA04
	thumb_func_end sub_812C990

	thumb_func_start sub_812CA04
sub_812CA04: @ 812CA04
	push {r4,lr}
	adds r4, r0, 0
	movs r1, 0x2E
	ldrsh r0, [r4, r1]
	cmp r0, 0x5
	bhi _0812CAC4
	lsls r0, 2
	ldr r1, _0812CA1C @ =_0812CA20
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_0812CA1C: .4byte _0812CA20
	.align 2, 0
_0812CA20:
	.4byte _0812CA38
	.4byte _0812CA56
	.4byte _0812CA76
	.4byte _0812CA56
	.4byte _0812CA96
	.4byte _0812CAA6
_0812CA38:
	adds r2, r4, 0
	adds r2, 0x3E
	ldrb r1, [r2]
	movs r0, 0x5
	negs r0, r0
	ands r0, r1
	strb r0, [r2]
	adds r0, r4, 0
	adds r0, 0x3F
	ldrb r1, [r0]
	movs r0, 0x20
	ands r0, r1
	cmp r0, 0
	beq _0812CAC4
	b _0812CA9E
_0812CA56:
	ldrh r0, [r4, 0x30]
	adds r0, 0x75
	strh r0, [r4, 0x30]
	lsls r0, 16
	asrs r0, 24
	strh r0, [r4, 0x24]
	ldrh r0, [r4, 0x32]
	adds r0, 0x1
	strh r0, [r4, 0x32]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x15
	bne _0812CAC4
	movs r0, 0
	strh r0, [r4, 0x32]
	b _0812CA9E
_0812CA76:
	ldrh r0, [r4, 0x30]
	subs r0, 0x75
	strh r0, [r4, 0x30]
	lsls r0, 16
	asrs r0, 24
	strh r0, [r4, 0x24]
	ldrh r0, [r4, 0x32]
	adds r0, 0x1
	strh r0, [r4, 0x32]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x29
	bne _0812CAC4
	movs r0, 0
	strh r0, [r4, 0x32]
	b _0812CA9E
_0812CA96:
	adds r0, r4, 0
	movs r1, 0x1
	bl ChangeSpriteAffineAnim
_0812CA9E:
	ldrh r0, [r4, 0x2E]
	adds r0, 0x1
	strh r0, [r4, 0x2E]
	b _0812CAC4
_0812CAA6:
	adds r0, r4, 0
	adds r0, 0x3F
	ldrb r1, [r0]
	movs r0, 0x20
	ands r0, r1
	cmp r0, 0
	beq _0812CAC4
	adds r2, r4, 0
	adds r2, 0x3E
	ldrb r0, [r2]
	movs r1, 0x4
	orrs r0, r1
	strb r0, [r2]
	ldr r0, _0812CACC @ =sub_812CAD0
	str r0, [r4, 0x1C]
_0812CAC4:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0812CACC: .4byte sub_812CAD0
	thumb_func_end sub_812CA04

	thumb_func_start sub_812CAD0
sub_812CAD0: @ 812CAD0
	push {r4,lr}
	ldr r2, _0812CAF4 @ =REG_WINOUT
	ldr r3, _0812CAF8 @ =0x00003f3f
	adds r1, r3, 0
	strh r1, [r2]
	movs r3, 0x80
	lsls r3, 19
	ldrh r1, [r3]
	movs r4, 0x80
	lsls r4, 8
	adds r2, r4, 0
	eors r1, r2
	strh r1, [r3]
	bl move_anim_8072740
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0812CAF4: .4byte REG_WINOUT
_0812CAF8: .4byte 0x00003f3f
	thumb_func_end sub_812CAD0

	thumb_func_start sub_812CAFC
sub_812CAFC: @ 812CAFC
	push {r4-r6,lr}
	adds r5, r0, 0
	ldr r6, _0812CB70 @ =gBattleAnimArgs
	movs r1, 0x6
	ldrsh r0, [r6, r1]
	cmp r0, 0
	bne _0812CB28
	ldr r4, _0812CB74 @ =gUnknown_0202F7C8
	ldrb r0, [r4]
	movs r1, 0
	bl sub_8077ABC
	lsls r0, 24
	lsrs r0, 24
	strh r0, [r5, 0x20]
	ldrb r0, [r4]
	movs r1, 0x1
	bl sub_8077ABC
	lsls r0, 24
	lsrs r0, 24
	strh r0, [r5, 0x22]
_0812CB28:
	ldrh r0, [r6]
	ldrh r2, [r5, 0x20]
	adds r0, r2
	movs r3, 0
	strh r0, [r5, 0x20]
	ldrh r0, [r6, 0x2]
	ldrh r4, [r5, 0x22]
	adds r0, r4
	strh r0, [r5, 0x22]
	ldrh r2, [r5, 0x4]
	lsls r1, r2, 22
	lsrs r1, 22
	adds r1, 0x10
	ldr r4, _0812CB78 @ =0x000003ff
	adds r0, r4, 0
	ands r1, r0
	ldr r0, _0812CB7C @ =0xfffffc00
	ands r0, r2
	orrs r0, r1
	strh r0, [r5, 0x4]
	movs r1, 0x4
	ldrsh r0, [r6, r1]
	cmp r0, 0
	bne _0812CB84
	ldrb r1, [r5, 0x3]
	movs r0, 0x3F
	negs r0, r0
	ands r0, r1
	movs r1, 0x10
	orrs r0, r1
	strb r0, [r5, 0x3]
	ldr r0, _0812CB80 @ =0x0000fff4
	strh r0, [r5, 0x24]
	movs r0, 0x2
	b _0812CB8A
	.align 2, 0
_0812CB70: .4byte gBattleAnimArgs
_0812CB74: .4byte gUnknown_0202F7C8
_0812CB78: .4byte 0x000003ff
_0812CB7C: .4byte 0xfffffc00
_0812CB80: .4byte 0x0000fff4
_0812CB84:
	movs r0, 0xC
	strh r0, [r5, 0x24]
	ldr r0, _0812CBA8 @ =0x0000fffe
_0812CB8A:
	strh r0, [r5, 0x30]
	ldr r1, _0812CBAC @ =gBattleAnimArgs
	ldrh r0, [r1, 0x8]
	strh r0, [r5, 0x2E]
	movs r2, 0x34
	ldrsh r0, [r5, r2]
	cmp r0, 0xFF
	beq _0812CB9E
	ldrh r0, [r1, 0x4]
	strh r0, [r5, 0x34]
_0812CB9E:
	ldr r0, _0812CBB0 @ =sub_812CBB4
	str r0, [r5, 0x1C]
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_0812CBA8: .4byte 0x0000fffe
_0812CBAC: .4byte gBattleAnimArgs
_0812CBB0: .4byte sub_812CBB4
	thumb_func_end sub_812CAFC

	thumb_func_start sub_812CBB4
sub_812CBB4: @ 812CBB4
	push {r4,lr}
	adds r4, r0, 0
	ldrh r2, [r4, 0x32]
	movs r1, 0x32
	ldrsh r0, [r4, r1]
	cmp r0, 0
	bne _0812CBF2
	ldrh r0, [r4, 0x30]
	ldrh r1, [r4, 0x24]
	adds r0, r1
	strh r0, [r4, 0x24]
	lsls r0, 16
	cmp r0, 0
	bne _0812CC12
	adds r0, r2, 0x1
	strh r0, [r4, 0x32]
	movs r1, 0x34
	ldrsh r0, [r4, r1]
	cmp r0, 0
	bne _0812CC12
	movs r0, 0x40
	negs r0, r0
	bl sub_8076F98
	adds r1, r0, 0
	lsls r1, 24
	asrs r1, 24
	movs r0, 0xDE
	bl PlaySE1WithPanning
	b _0812CC12
_0812CBF2:
	ldrh r0, [r4, 0x24]
	ldrh r1, [r4, 0x30]
	subs r0, r1
	strh r0, [r4, 0x24]
	movs r1, 0x24
	ldrsh r0, [r4, r1]
	cmp r0, 0
	bge _0812CC04
	negs r0, r0
_0812CC04:
	cmp r0, 0xC
	bne _0812CC12
	ldrh r0, [r4, 0x2E]
	subs r0, 0x1
	strh r0, [r4, 0x2E]
	subs r0, r2, 0x1
	strh r0, [r4, 0x32]
_0812CC12:
	movs r1, 0x2E
	ldrsh r0, [r4, r1]
	cmp r0, 0
	bne _0812CC20
	adds r0, r4, 0
	bl move_anim_8072740
_0812CC20:
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end sub_812CBB4

	thumb_func_start sub_812CC28
sub_812CC28: @ 812CC28
	push {lr}
	ldrb r2, [r0, 0x1]
	movs r1, 0xD
	negs r1, r1
	ands r1, r2
	movs r2, 0x8
	orrs r1, r2
	strb r1, [r0, 0x1]
	movs r1, 0xFF
	strh r1, [r0, 0x34]
	bl sub_812CAFC
	pop {r0}
	bx r0
	thumb_func_end sub_812CC28

	thumb_func_start sub_812CC44
sub_812CC44: @ 812CC44
	push {r4,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	bl sub_8076BE0
	lsls r0, 24
	cmp r0, 0
	beq _0812CC7A
	ldr r1, _0812CC88 @ =REG_WININ
	ldr r2, _0812CC8C @ =0x00001f3f
	adds r0, r2, 0
	strh r0, [r1]
	ldr r1, _0812CC90 @ =gUnknown_03004200
	ldr r2, _0812CC94 @ =0x000098f0
	adds r0, r2, 0
	strh r0, [r1]
	ldr r1, _0812CC98 @ =gUnknown_03004244
	movs r0, 0xA0
	strh r0, [r1]
	ldr r1, _0812CC9C @ =REG_WIN1H
	ldr r0, _0812CCA0 @ =gUnknown_030042C4
	ldrh r0, [r0]
	strh r0, [r1]
	adds r1, 0x4
	ldr r0, _0812CCA4 @ =gUnknown_03004240
	ldrh r0, [r0]
	strh r0, [r1]
_0812CC7A:
	adds r0, r4, 0
	bl move_anim_task_del
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0812CC88: .4byte REG_WININ
_0812CC8C: .4byte 0x00001f3f
_0812CC90: .4byte gUnknown_03004200
_0812CC94: .4byte 0x000098f0
_0812CC98: .4byte gUnknown_03004244
_0812CC9C: .4byte REG_WIN1H
_0812CCA0: .4byte gUnknown_030042C4
_0812CCA4: .4byte gUnknown_03004240
	thumb_func_end sub_812CC44

	thumb_func_start sub_812CCA8
sub_812CCA8: @ 812CCA8
	push {r4,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	bl sub_8076BE0
	lsls r0, 24
	cmp r0, 0
	beq _0812CCCA
	ldr r1, _0812CCD8 @ =REG_WININ
	ldr r2, _0812CCDC @ =0x00003f3f
	adds r0, r2, 0
	strh r0, [r1]
	ldr r0, _0812CCE0 @ =gUnknown_03004200
	movs r1, 0
	strh r1, [r0]
	ldr r0, _0812CCE4 @ =gUnknown_03004244
	strh r1, [r0]
_0812CCCA:
	adds r0, r4, 0
	bl move_anim_task_del
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0812CCD8: .4byte REG_WININ
_0812CCDC: .4byte 0x00003f3f
_0812CCE0: .4byte gUnknown_03004200
_0812CCE4: .4byte gUnknown_03004244
	thumb_func_end sub_812CCA8

	thumb_func_start sub_812CCE8
sub_812CCE8: @ 812CCE8
	push {r4-r6,lr}
	adds r5, r0, 0
	ldr r6, _0812CCFC @ =gBattleAnimArgs
	movs r1, 0
	ldrsh r0, [r6, r1]
	cmp r0, 0
	bne _0812CD04
	ldr r4, _0812CD00 @ =gUnknown_0202F7C8
	b _0812CD06
	.align 2, 0
_0812CCFC: .4byte gBattleAnimArgs
_0812CD00: .4byte gUnknown_0202F7C8
_0812CD04:
	ldr r4, _0812CD58 @ =gUnknown_0202F7C9
_0812CD06:
	ldrb r0, [r4]
	movs r1, 0
	bl sub_8077ABC
	lsls r0, 24
	lsrs r0, 24
	ldrh r6, [r6, 0x2]
	adds r0, r6
	strh r0, [r5, 0x20]
	ldrb r0, [r4]
	movs r1, 0x1
	bl sub_8077ABC
	lsls r0, 24
	lsrs r0, 24
	strh r0, [r5, 0x22]
	ldr r2, _0812CD5C @ =gBattleAnimArgs
	ldrh r0, [r2, 0x4]
	strh r0, [r5, 0x26]
	movs r3, 0
	lsls r0, 16
	asrs r0, 16
	ldrh r4, [r2, 0x6]
	movs r6, 0x6
	ldrsh r1, [r2, r6]
	cmp r0, r1
	ble _0812CD3E
	movs r3, 0x1
_0812CD3E:
	strh r3, [r5, 0x2E]
	movs r0, 0
	strh r0, [r5, 0x30]
	ldrh r0, [r2, 0x8]
	strh r0, [r5, 0x32]
	ldrh r0, [r2, 0xA]
	strh r0, [r5, 0x34]
	strh r4, [r5, 0x36]
	ldr r0, _0812CD60 @ =sub_812CD64
	str r0, [r5, 0x1C]
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_0812CD58: .4byte gUnknown_0202F7C9
_0812CD5C: .4byte gBattleAnimArgs
_0812CD60: .4byte sub_812CD64
	thumb_func_end sub_812CCE8

	thumb_func_start sub_812CD64
sub_812CD64: @ 812CD64
	push {lr}
	adds r2, r0, 0
	ldrh r0, [r2, 0x32]
	ldrh r1, [r2, 0x30]
	adds r0, r1
	movs r1, 0xFF
	ands r0, r1
	strh r0, [r2, 0x30]
	ldr r1, _0812CDAC @ =gSineTable
	movs r3, 0x30
	ldrsh r0, [r2, r3]
	lsls r0, 1
	adds r0, r1
	ldrh r0, [r0]
	lsls r0, 16
	asrs r0, 20
	strh r0, [r2, 0x24]
	ldrh r0, [r2, 0x34]
	ldrh r3, [r2, 0x26]
	adds r1, r0, r3
	strh r1, [r2, 0x26]
	movs r3, 0x2E
	ldrsh r0, [r2, r3]
	cmp r0, 0
	beq _0812CDB0
	lsls r0, r1, 16
	asrs r0, 16
	movs r3, 0x36
	ldrsh r1, [r2, r3]
	cmp r0, r1
	bge _0812CDC2
	adds r0, r2, 0
	bl move_anim_8072740
	b _0812CDC2
	.align 2, 0
_0812CDAC: .4byte gSineTable
_0812CDB0:
	lsls r0, r1, 16
	asrs r0, 16
	movs r3, 0x36
	ldrsh r1, [r2, r3]
	cmp r0, r1
	ble _0812CDC2
	adds r0, r2, 0
	bl move_anim_8072740
_0812CDC2:
	pop {r0}
	bx r0
	thumb_func_end sub_812CD64

	thumb_func_start sub_812CDC8
sub_812CDC8: @ 812CDC8
	push {r4-r7,lr}
	sub sp, 0xC
	lsls r0, 24
	lsrs r0, 24
	lsls r1, r0, 2
	adds r1, r0
	lsls r1, 3
	ldr r0, _0812CDE8 @ =gTasks
	adds r5, r1, r0
	ldr r0, _0812CDEC @ =gBattleAnimArgs
	movs r1, 0
	ldrsh r0, [r0, r1]
	cmp r0, 0
	bne _0812CDF4
	ldr r4, _0812CDF0 @ =gUnknown_0202F7C8
	b _0812CDF6
	.align 2, 0
_0812CDE8: .4byte gTasks
_0812CDEC: .4byte gBattleAnimArgs
_0812CDF0: .4byte gUnknown_0202F7C8
_0812CDF4:
	ldr r4, _0812CE3C @ =gUnknown_0202F7C9
_0812CDF6:
	ldrb r0, [r4]
	bl sub_8077FC0
	lsls r0, 24
	lsrs r6, r0, 24
	ldrb r0, [r4]
	bl battle_get_per_side_status_permutated
	lsls r0, 24
	lsrs r7, r0, 24
	adds r0, r6, 0
	adds r1, r0, 0
	adds r1, 0x24
	movs r2, 0
	strh r1, [r5, 0x8]
	strh r1, [r5, 0xA]
	subs r0, 0x21
	strh r0, [r5, 0xC]
	cmp r0, 0
	bge _0812CE20
	strh r2, [r5, 0xC]
_0812CE20:
	ldrh r0, [r5, 0x8]
	strh r0, [r5, 0xE]
	movs r0, 0x8
	strh r0, [r5, 0x10]
	ldr r1, _0812CE40 @ =gBattleAnimArgs
	ldrh r0, [r1, 0x2]
	strh r0, [r5, 0x12]
	strh r2, [r5, 0x14]
	strh r2, [r5, 0x16]
	cmp r7, 0x1
	bne _0812CE48
	ldr r0, _0812CE44 @ =gUnknown_030042C0
	b _0812CE4A
	.align 2, 0
_0812CE3C: .4byte gUnknown_0202F7C9
_0812CE40: .4byte gBattleAnimArgs
_0812CE44: .4byte gUnknown_030042C0
_0812CE48:
	ldr r0, _0812CE68 @ =gUnknown_03004288
_0812CE4A:
	ldrh r2, [r0]
	strh r2, [r5, 0x18]
	adds r3, r2, 0
	adds r3, 0xF0
	strh r3, [r5, 0x1A]
	ldrh r0, [r1, 0x4]
	strh r0, [r5, 0x1C]
	movs r4, 0x4
	ldrsh r0, [r1, r4]
	cmp r0, 0
	bne _0812CE6C
	strh r3, [r5, 0x1E]
	ldrh r3, [r5, 0x18]
	b _0812CE70
	.align 2, 0
_0812CE68: .4byte gUnknown_03004288
_0812CE6C:
	strh r2, [r5, 0x1E]
	ldrh r3, [r5, 0x1A]
_0812CE70:
	movs r0, 0
	strh r0, [r5, 0x26]
	ldrh r1, [r5, 0xC]
	lsls r2, r1, 16
	asrs r1, r2, 16
	movs r6, 0xE
	ldrsh r0, [r5, r6]
	cmp r1, r0
	bgt _0812CEA6
	ldr r4, _0812CEB0 @ =gUnknown_03004DE0
	movs r0, 0xF0
	lsls r0, 3
	adds r0, r4
	mov r12, r0
_0812CE8C:
	asrs r2, 16
	lsls r1, r2, 1
	adds r0, r1, r4
	strh r3, [r0]
	add r1, r12
	strh r3, [r1]
	adds r2, 0x1
	lsls r2, 16
	asrs r1, r2, 16
	movs r6, 0xE
	ldrsh r0, [r5, r6]
	cmp r1, r0
	ble _0812CE8C
_0812CEA6:
	cmp r7, 0x1
	bne _0812CEB8
	ldr r0, _0812CEB4 @ =REG_BG1HOFS
	b _0812CEBA
	.align 2, 0
_0812CEB0: .4byte gUnknown_03004DE0
_0812CEB4: .4byte REG_BG1HOFS
_0812CEB8:
	ldr r0, _0812CEE4 @ =REG_BG2HOFS
_0812CEBA:
	str r0, [sp]
	ldr r0, _0812CEE8 @ =0xa2600001
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
	bl sub_80895F8
	ldr r0, _0812CEEC @ =sub_812CEF0
	str r0, [r5]
	add sp, 0xC
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_0812CEE4: .4byte REG_BG2HOFS
_0812CEE8: .4byte 0xa2600001
_0812CEEC: .4byte sub_812CEF0
	thumb_func_end sub_812CDC8

	thumb_func_start sub_812CEF0
sub_812CEF0: @ 812CEF0
	push {r4-r7,lr}
	lsls r0, 24
	lsrs r7, r0, 24
	lsls r0, r7, 2
	adds r0, r7
	lsls r0, 3
	ldr r1, _0812CF40 @ =gTasks
	adds r4, r0, r1
	ldrh r0, [r4, 0x8]
	ldrh r1, [r4, 0x12]
	subs r0, r1
	strh r0, [r4, 0x8]
	lsls r0, 16
	asrs r0, 16
	ldrh r2, [r4, 0xC]
	movs r3, 0xC
	ldrsh r1, [r4, r3]
	cmp r0, r1
	bge _0812CF18
	strh r2, [r4, 0x8]
_0812CF18:
	ldrh r1, [r4, 0x10]
	movs r2, 0x10
	ldrsh r0, [r4, r2]
	cmp r0, 0
	bne _0812CF44
	ldrh r0, [r4, 0xA]
	ldrh r1, [r4, 0x12]
	subs r0, r1
	strh r0, [r4, 0xA]
	lsls r0, 16
	asrs r0, 16
	ldrh r2, [r4, 0xC]
	movs r3, 0xC
	ldrsh r1, [r4, r3]
	cmp r0, r1
	bge _0812CF48
	strh r2, [r4, 0xA]
	movs r0, 0x1
	strh r0, [r4, 0x26]
	b _0812CF48
	.align 2, 0
_0812CF40: .4byte gTasks
_0812CF44:
	subs r0, r1, 0x1
	strh r0, [r4, 0x10]
_0812CF48:
	ldrh r0, [r4, 0x14]
	adds r0, 0x1
	strh r0, [r4, 0x14]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x1
	ble _0812CF74
	movs r0, 0
	strh r0, [r4, 0x14]
	movs r1, 0
	movs r2, 0x16
	ldrsh r0, [r4, r2]
	cmp r0, 0
	bne _0812CF66
	movs r1, 0x1
_0812CF66:
	strh r1, [r4, 0x16]
	cmp r1, 0
	beq _0812CF70
	ldrh r0, [r4, 0x18]
	b _0812CF72
_0812CF70:
	ldrh r0, [r4, 0x1A]
_0812CF72:
	strh r0, [r4, 0x20]
_0812CF74:
	ldrh r1, [r4, 0x8]
	lsls r3, r1, 16
	asrs r1, r3, 16
	movs r2, 0xA
	ldrsh r0, [r4, r2]
	cmp r1, r0
	bge _0812CFA8
	ldr r5, _0812D000 @ =gUnknown_03004DE0
	movs r0, 0xF0
	lsls r0, 3
	adds r6, r5, r0
_0812CF8A:
	asrs r3, 16
	lsls r1, r3, 1
	adds r2, r1, r5
	ldrh r0, [r4, 0x20]
	strh r0, [r2]
	adds r1, r6
	ldrh r0, [r4, 0x20]
	strh r0, [r1]
	adds r3, 0x1
	lsls r3, 16
	asrs r1, r3, 16
	movs r2, 0xA
	ldrsh r0, [r4, r2]
	cmp r1, r0
	blt _0812CF8A
_0812CFA8:
	ldrh r1, [r4, 0xA]
	lsls r3, r1, 16
	asrs r1, r3, 16
	movs r2, 0xE
	ldrsh r0, [r4, r2]
	cmp r1, r0
	bgt _0812CFDC
	ldr r5, _0812D000 @ =gUnknown_03004DE0
	movs r0, 0xF0
	lsls r0, 3
	adds r6, r5, r0
_0812CFBE:
	asrs r3, 16
	lsls r1, r3, 1
	adds r2, r1, r5
	ldrh r0, [r4, 0x1E]
	strh r0, [r2]
	adds r1, r6
	ldrh r0, [r4, 0x1E]
	strh r0, [r1]
	adds r3, 0x1
	lsls r3, 16
	asrs r1, r3, 16
	movs r2, 0xE
	ldrsh r0, [r4, r2]
	cmp r1, r0
	ble _0812CFBE
_0812CFDC:
	movs r3, 0x26
	ldrsh r0, [r4, r3]
	cmp r0, 0
	beq _0812CFF8
	movs r1, 0x1C
	ldrsh r0, [r4, r1]
	cmp r0, 0
	beq _0812CFF2
	ldr r1, _0812D004 @ =gUnknown_03004DC0
	movs r0, 0x3
	strb r0, [r1, 0x15]
_0812CFF2:
	adds r0, r7, 0
	bl move_anim_task_del
_0812CFF8:
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_0812D000: .4byte gUnknown_03004DE0
_0812D004: .4byte gUnknown_03004DC0
	thumb_func_end sub_812CEF0

	thumb_func_start sub_812D008
sub_812D008: @ 812D008
	push {r4-r6,lr}
	lsls r0, 24
	lsrs r0, 24
	lsls r4, r0, 2
	adds r4, r0
	lsls r4, 3
	ldr r0, _0812D05C @ =gTasks
	adds r4, r0
	movs r5, 0
	strh r5, [r4, 0x8]
	strh r5, [r4, 0xA]
	ldr r6, _0812D060 @ =gUnknown_0202F7C8
	ldrb r0, [r6]
	movs r1, 0x2
	bl sub_8077ABC
	lsls r0, 24
	lsrs r0, 24
	strh r0, [r4, 0xC]
	ldrb r0, [r6]
	movs r1, 0x3
	bl sub_8077ABC
	lsls r0, 24
	lsrs r0, 24
	strh r0, [r4, 0xE]
	movs r0, 0x20
	strh r0, [r4, 0x10]
	ldr r0, _0812D064 @ =0x0000ffec
	strh r0, [r4, 0x12]
	strh r5, [r4, 0x14]
	movs r0, 0
	bl obj_id_for_side_relative_to_move
	lsls r0, 24
	lsrs r0, 24
	strh r0, [r4, 0x26]
	ldr r0, _0812D068 @ =sub_812D06C
	str r0, [r4]
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_0812D05C: .4byte gTasks
_0812D060: .4byte gUnknown_0202F7C8
_0812D064: .4byte 0x0000ffec
_0812D068: .4byte sub_812D06C
	thumb_func_end sub_812D008

	thumb_func_start sub_812D06C
sub_812D06C: @ 812D06C
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	sub sp, 0x8
	lsls r0, 24
	lsrs r2, r0, 24
	lsls r0, r2, 2
	adds r0, r2
	lsls r0, 3
	ldr r1, _0812D098 @ =gTasks
	adds r6, r0, r1
	movs r1, 0x8
	ldrsh r0, [r6, r1]
	cmp r0, 0x5
	bls _0812D08C
	b _0812D246
_0812D08C:
	lsls r0, 2
	ldr r1, _0812D09C @ =_0812D0A0
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_0812D098: .4byte gTasks
_0812D09C: .4byte _0812D0A0
	.align 2, 0
_0812D0A0:
	.4byte _0812D0B8
	.4byte _0812D178
	.4byte _0812D1A6
	.4byte _0812D1BA
	.4byte _0812D1D0
	.4byte _0812D238
_0812D0B8:
	movs r0, 0xC
	ldrsh r2, [r6, r0]
	ldrh r1, [r6, 0xA]
	movs r0, 0x1
	ands r0, r1
	cmp r0, 0
	beq _0812D0CE
	movs r1, 0x10
	ldrsh r0, [r6, r1]
	subs r0, r2, r0
	b _0812D0D4
_0812D0CE:
	movs r1, 0x10
	ldrsh r0, [r6, r1]
	adds r0, r2, r0
_0812D0D4:
	lsls r0, 16
	lsrs r1, r0, 16
	ldrh r2, [r6, 0x12]
	ldrh r0, [r6, 0xE]
	adds r2, r0
	ldr r0, _0812D168 @ =gBattleAnimSpriteTemplate_83D7220
	lsls r1, 16
	asrs r1, 16
	lsls r2, 16
	asrs r2, 16
	ldrb r4, [r6, 0xA]
	movs r3, 0x6
	subs r3, r4
	lsls r3, 24
	lsrs r3, 24
	bl CreateSprite
	lsls r0, 24
	lsrs r4, r0, 24
	movs r0, 0x40
	negs r0, r0
	bl sub_8076F98
	adds r1, r0, 0
	lsls r1, 24
	asrs r1, 24
	movs r0, 0xBA
	bl PlaySE12WithPanning
	cmp r4, 0x40
	beq _0812D138
	ldr r5, _0812D16C @ =gSprites
	lsls r1, r4, 4
	adds r1, r4
	lsls r1, 2
	adds r3, r1, r5
	ldrh r0, [r6, 0xA]
	movs r2, 0x1
	ands r2, r0
	adds r3, 0x3F
	ldrb r4, [r3]
	movs r0, 0x2
	negs r0, r0
	ands r0, r4
	orrs r0, r2
	strb r0, [r3]
	adds r5, 0x1C
	adds r1, r5
	ldr r0, _0812D170 @ =SpriteCallbackDummy
	str r0, [r1]
_0812D138:
	ldrh r1, [r6, 0xA]
	movs r4, 0x1
	adds r0, r4, 0
	ands r0, r1
	cmp r0, 0
	beq _0812D150
	ldrh r0, [r6, 0x10]
	subs r0, 0x6
	strh r0, [r6, 0x10]
	ldrh r0, [r6, 0x12]
	subs r0, 0x6
	strh r0, [r6, 0x12]
_0812D150:
	ldrh r1, [r6, 0x26]
	lsls r1, 24
	lsrs r1, 24
	ldr r2, _0812D174 @ =gUnknown_08402400
	adds r0, r6, 0
	bl sub_80798F4
	ldrh r0, [r6, 0xA]
	adds r0, 0x1
	strh r0, [r6, 0xA]
	strh r4, [r6, 0x8]
	b _0812D246
	.align 2, 0
_0812D168: .4byte gBattleAnimSpriteTemplate_83D7220
_0812D16C: .4byte gSprites
_0812D170: .4byte SpriteCallbackDummy
_0812D174: .4byte gUnknown_08402400
_0812D178:
	adds r0, r6, 0
	bl sub_807992C
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0
	bne _0812D246
	movs r2, 0xA
	ldrsh r1, [r6, r2]
	cmp r1, 0x6
	bne _0812D198
	movs r0, 0x8
	strh r0, [r6, 0x14]
	movs r0, 0x3
	strh r0, [r6, 0x8]
	b _0812D246
_0812D198:
	cmp r1, 0x2
	bgt _0812D19E
	movs r0, 0xA
_0812D19E:
	strh r0, [r6, 0x14]
	movs r0, 0x2
	strh r0, [r6, 0x8]
	b _0812D246
_0812D1A6:
	ldrh r0, [r6, 0x14]
	movs r2, 0x14
	ldrsh r1, [r6, r2]
	cmp r1, 0
	beq _0812D1B6
	subs r0, 0x1
	strh r0, [r6, 0x14]
	b _0812D246
_0812D1B6:
	strh r1, [r6, 0x8]
	b _0812D246
_0812D1BA:
	ldrh r1, [r6, 0x14]
	movs r2, 0x14
	ldrsh r0, [r6, r2]
	cmp r0, 0
	beq _0812D1CA
	subs r0, r1, 0x1
	strh r0, [r6, 0x14]
	b _0812D246
_0812D1CA:
	movs r0, 0x4
	strh r0, [r6, 0x8]
	b _0812D246
_0812D1D0:
	movs r5, 0
	movs r7, 0
	ldr r3, _0812D22C @ =gSprites
	movs r0, 0x1C
	adds r0, r3
	mov r8, r0
_0812D1DC:
	lsls r0, r5, 4
	adds r0, r5
	lsls r4, r0, 2
	adds r0, r3, 0
	adds r0, 0x14
	adds r0, r4, r0
	ldr r1, [r0]
	ldr r0, _0812D230 @ =gBattleAnimSpriteTemplate_83D7220
	cmp r1, r0
	bne _0812D218
	adds r0, r4, r3
	strh r2, [r0, 0x2E]
	movs r1, 0x6
	strh r1, [r0, 0x30]
	movs r1, 0x2
	str r2, [sp]
	str r3, [sp, 0x4]
	bl StartSpriteAnim
	mov r0, r8
	adds r1, r4, r0
	ldr r0, _0812D234 @ =sub_812D254
	str r0, [r1]
	adds r0, r7, 0x1
	lsls r0, 16
	lsrs r7, r0, 16
	ldr r2, [sp]
	ldr r3, [sp, 0x4]
	cmp r7, 0x6
	beq _0812D222
_0812D218:
	adds r0, r5, 0x1
	lsls r0, 16
	lsrs r5, r0, 16
	cmp r5, 0x3F
	bls _0812D1DC
_0812D222:
	strh r7, [r6, 0x14]
	movs r0, 0x5
	strh r0, [r6, 0x8]
	b _0812D246
	.align 2, 0
_0812D22C: .4byte gSprites
_0812D230: .4byte gBattleAnimSpriteTemplate_83D7220
_0812D234: .4byte sub_812D254
_0812D238:
	movs r1, 0x14
	ldrsh r0, [r6, r1]
	cmp r0, 0
	bne _0812D246
	adds r0, r2, 0
	bl move_anim_task_del
_0812D246:
	add sp, 0x8
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r0}
	bx r0
	thumb_func_end sub_812D06C

	thumb_func_start sub_812D254
sub_812D254: @ 812D254
	push {r4,lr}
	adds r4, r0, 0
	adds r0, 0x3F
	ldrb r1, [r0]
	movs r0, 0x10
	ands r0, r1
	cmp r0, 0
	beq _0812D288
	ldr r3, _0812D290 @ =gTasks
	movs r0, 0x30
	ldrsh r1, [r4, r0]
	lsls r1, 1
	movs r0, 0x2E
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
_0812D288:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0812D290: .4byte gTasks
	thumb_func_end sub_812D254

	thumb_func_start sub_812D294
sub_812D294: @ 812D294
	push {r4,r5,lr}
	adds r5, r0, 0
	movs r1, 0x2E
	ldrsh r0, [r5, r1]
	cmp r0, 0
	bne _0812D2A8
	adds r0, r5, 0
	movs r1, 0
	bl sub_80787B0
_0812D2A8:
	ldrh r0, [r5, 0x2E]
	adds r0, 0x1
	strh r0, [r5, 0x2E]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x27
	bgt _0812D2DA
	ldrh r0, [r5, 0x2E]
	movs r1, 0x1
	ands r0, r1
	cmp r0, 0
	bne _0812D2CC
	adds r2, r5, 0
	adds r2, 0x3E
	ldrb r0, [r2]
	movs r1, 0x4
	orrs r0, r1
	b _0812D2D8
_0812D2CC:
	adds r2, r5, 0
	adds r2, 0x3E
	ldrb r1, [r2]
	movs r0, 0x5
	negs r0, r0
	ands r0, r1
_0812D2D8:
	strb r0, [r2]
_0812D2DA:
	movs r2, 0x2E
	ldrsh r0, [r5, r2]
	cmp r0, 0x1E
	ble _0812D2F0
	adds r2, r5, 0
	adds r2, 0x3E
	ldrb r1, [r2]
	movs r0, 0x5
	negs r0, r0
	ands r0, r1
	strb r0, [r2]
_0812D2F0:
	movs r1, 0x2E
	ldrsh r0, [r5, r1]
	cmp r0, 0x3D
	bne _0812D33C
	ldr r1, _0812D344 @ =move_anim_8072740
	adds r0, r5, 0
	bl oamt_set_x3A_32
	ldrh r0, [r5, 0x24]
	ldrh r2, [r5, 0x20]
	adds r0, r2
	movs r1, 0
	strh r0, [r5, 0x20]
	ldrh r0, [r5, 0x26]
	ldrh r2, [r5, 0x22]
	adds r0, r2
	strh r0, [r5, 0x22]
	strh r1, [r5, 0x24]
	strh r1, [r5, 0x26]
	movs r0, 0x14
	strh r0, [r5, 0x2E]
	ldr r4, _0812D348 @ =gUnknown_0202F7C9
	ldrb r0, [r4]
	movs r1, 0x2
	bl sub_8077ABC
	lsls r0, 24
	lsrs r0, 24
	strh r0, [r5, 0x32]
	ldrb r0, [r4]
	movs r1, 0x3
	bl sub_8077ABC
	lsls r0, 24
	lsrs r0, 24
	strh r0, [r5, 0x36]
	ldr r0, _0812D34C @ =sub_8078B34
	str r0, [r5, 0x1C]
_0812D33C:
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_0812D344: .4byte move_anim_8072740
_0812D348: .4byte gUnknown_0202F7C9
_0812D34C: .4byte sub_8078B34
	thumb_func_end sub_812D294

	thumb_func_start sub_812D350
sub_812D350: @ 812D350
	push {r4,r5,lr}
	lsls r0, 24
	lsrs r5, r0, 24
	ldr r1, _0812D370 @ =gTasks
	lsls r0, r5, 2
	adds r0, r5
	lsls r0, 3
	adds r4, r0, r1
	movs r1, 0x8
	ldrsh r0, [r4, r1]
	cmp r0, 0
	beq _0812D374
	cmp r0, 0x1
	beq _0812D394
	b _0812D3A6
	.align 2, 0
_0812D370: .4byte gTasks
_0812D374:
	movs r0, 0
	bl obj_id_for_side_relative_to_move
	adds r1, r0, 0
	lsls r1, 24
	lsrs r1, 24
	ldr r2, _0812D390 @ =gUnknown_084024B0
	adds r0, r4, 0
	bl sub_80798F4
	ldrh r0, [r4, 0x8]
	adds r0, 0x1
	strh r0, [r4, 0x8]
	b _0812D3A6
	.align 2, 0
_0812D390: .4byte gUnknown_084024B0
_0812D394:
	adds r0, r4, 0
	bl sub_807992C
	lsls r0, 24
	cmp r0, 0
	bne _0812D3A6
	adds r0, r5, 0
	bl move_anim_task_del
_0812D3A6:
	pop {r4,r5}
	pop {r0}
	bx r0
	thumb_func_end sub_812D350

	thumb_func_start sub_812D3AC
sub_812D3AC: @ 812D3AC
	push {r4-r6,lr}
	adds r5, r0, 0
	movs r0, 0
	bl obj_id_for_side_relative_to_move
	lsls r0, 24
	lsrs r6, r0, 24
	movs r1, 0x2E
	ldrsh r0, [r5, r1]
	cmp r0, 0x1
	beq _0812D40C
	cmp r0, 0x1
	bgt _0812D3CC
	cmp r0, 0
	beq _0812D3D6
	b _0812D4AE
_0812D3CC:
	cmp r0, 0x2
	beq _0812D43C
	cmp r0, 0x3
	beq _0812D490
	b _0812D4AE
_0812D3D6:
	ldr r4, _0812D408 @ =gUnknown_0202F7C8
	ldrb r0, [r4]
	movs r1, 0x2
	bl sub_8077ABC
	lsls r0, 24
	lsrs r0, 24
	strh r0, [r5, 0x20]
	ldrb r0, [r4]
	movs r1, 0x3
	bl sub_8077ABC
	lsls r0, 24
	lsrs r0, 24
	strh r0, [r5, 0x22]
	adds r0, r6, 0
	movs r1, 0
	bl sub_8078E70
	movs r0, 0x80
	lsls r0, 1
	strh r0, [r5, 0x30]
	strh r0, [r5, 0x32]
	b _0812D484
	.align 2, 0
_0812D408: .4byte gUnknown_0202F7C8
_0812D40C:
	ldrh r0, [r5, 0x30]
	adds r0, 0x60
	strh r0, [r5, 0x30]
	ldrh r0, [r5, 0x32]
	subs r0, 0x1A
	strh r0, [r5, 0x32]
	movs r2, 0x30
	ldrsh r1, [r5, r2]
	movs r0, 0x32
	ldrsh r2, [r5, r0]
	adds r0, r6, 0
	movs r3, 0
	bl obj_id_set_rotscale
	ldrh r0, [r5, 0x34]
	adds r0, 0x1
	strh r0, [r5, 0x34]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x5
	bne _0812D43C
	ldrh r0, [r5, 0x2E]
	adds r0, 0x1
	strh r0, [r5, 0x2E]
_0812D43C:
	ldrh r0, [r5, 0x30]
	adds r0, 0x60
	strh r0, [r5, 0x30]
	ldrh r0, [r5, 0x32]
	adds r0, 0x30
	strh r0, [r5, 0x32]
	movs r2, 0x30
	ldrsh r1, [r5, r2]
	movs r0, 0x32
	ldrsh r2, [r5, r0]
	adds r0, r6, 0
	movs r3, 0
	bl obj_id_set_rotscale
	ldrh r0, [r5, 0x34]
	adds r0, 0x1
	strh r0, [r5, 0x34]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x9
	bne _0812D4AE
	movs r0, 0
	strh r0, [r5, 0x34]
	ldr r1, _0812D48C @ =gSprites
	lsls r0, r6, 4
	adds r0, r6
	lsls r0, 2
	adds r0, r1
	adds r0, 0x3E
	ldrb r1, [r0]
	movs r2, 0x4
	orrs r1, r2
	strb r1, [r0]
	adds r0, r6, 0
	bl sub_8078F40
_0812D484:
	ldrh r0, [r5, 0x2E]
	adds r0, 0x1
	strh r0, [r5, 0x2E]
	b _0812D4AE
	.align 2, 0
_0812D48C: .4byte gSprites
_0812D490:
	ldrh r0, [r5, 0x26]
	subs r0, 0x6
	strh r0, [r5, 0x26]
	movs r1, 0x22
	ldrsh r0, [r5, r1]
	movs r2, 0x26
	ldrsh r1, [r5, r2]
	adds r0, r1
	movs r1, 0x20
	negs r1, r1
	cmp r0, r1
	bge _0812D4AE
	adds r0, r5, 0
	bl move_anim_8072740
_0812D4AE:
	pop {r4-r6}
	pop {r0}
	bx r0
	thumb_func_end sub_812D3AC

	thumb_func_start sub_812D4B4
sub_812D4B4: @ 812D4B4
	push {r4,lr}
	adds r4, r0, 0
	ldr r0, _0812D4CC @ =gUnknown_0202F7C8
	ldrb r0, [r0]
	bl battle_side_get_owner
	lsls r0, 24
	cmp r0, 0
	beq _0812D4D4
	ldr r0, _0812D4D0 @ =0x0000fff0
	b _0812D4D8
	.align 2, 0
_0812D4CC: .4byte gUnknown_0202F7C8
_0812D4D0: .4byte 0x0000fff0
_0812D4D4:
	movs r0, 0x80
	lsls r0, 1
_0812D4D8:
	strh r0, [r4, 0x20]
	movs r0, 0
	strh r0, [r4, 0x22]
	ldr r0, _0812D4E8 @ =sub_812D4EC
	str r0, [r4, 0x1C]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0812D4E8: .4byte sub_812D4EC
	thumb_func_end sub_812D4B4

	thumb_func_start sub_812D4EC
sub_812D4EC: @ 812D4EC
	push {r4,r5,lr}
	adds r4, r0, 0
	ldrh r0, [r4, 0x2E]
	adds r0, 0x48
	strh r0, [r4, 0x2E]
	ldr r0, _0812D50C @ =gUnknown_0202F7C8
	ldrb r0, [r0]
	bl battle_side_get_owner
	lsls r0, 24
	cmp r0, 0
	beq _0812D510
	ldrh r0, [r4, 0x2E]
	lsls r0, 16
	asrs r0, 20
	b _0812D518
	.align 2, 0
_0812D50C: .4byte gUnknown_0202F7C8
_0812D510:
	ldrh r0, [r4, 0x2E]
	lsls r0, 16
	asrs r0, 20
	negs r0, r0
_0812D518:
	strh r0, [r4, 0x24]
	ldrh r0, [r4, 0x30]
	adds r0, 0x10
	strh r0, [r4, 0x30]
	lsls r0, 16
	asrs r0, 24
	ldrh r1, [r4, 0x26]
	adds r5, r0, r1
	strh r5, [r4, 0x26]
	ldrh r0, [r4, 0x32]
	adds r0, 0x1
	strh r0, [r4, 0x32]
	lsls r0, 16
	asrs r0, 16
	movs r1, 0x3
	bl __modsi3
	lsls r0, 16
	cmp r0, 0
	bne _0812D564
	ldr r0, _0812D584 @ =gSpriteTemplate_8402500
	ldrh r1, [r4, 0x24]
	ldrh r2, [r4, 0x20]
	adds r1, r2
	lsls r1, 16
	asrs r1, 16
	ldrh r2, [r4, 0x22]
	adds r2, r5
	lsls r2, 16
	asrs r2, 16
	adds r3, r4, 0
	adds r3, 0x43
	ldrb r3, [r3]
	adds r3, 0x1
	lsls r3, 24
	lsrs r3, 24
	bl CreateSpriteAndAnimate
_0812D564:
	movs r1, 0x20
	ldrsh r0, [r4, r1]
	movs r2, 0x24
	ldrsh r1, [r4, r2]
	adds r0, r1
	adds r0, 0x20
	movs r1, 0x98
	lsls r1, 1
	cmp r0, r1
	bls _0812D57E
	adds r0, r4, 0
	bl move_anim_8072740
_0812D57E:
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_0812D584: .4byte gSpriteTemplate_8402500
	thumb_func_end sub_812D4EC

	thumb_func_start sub_812D588
sub_812D588: @ 812D588
	push {r4,lr}
	adds r4, r0, 0
	bl Random
	movs r1, 0x3
	ands r0, r1
	cmp r0, 0
	bne _0812D5A2
	ldrh r2, [r4, 0x4]
	lsls r1, r2, 22
	lsrs r1, 22
	adds r1, 0x4
	b _0812D5AA
_0812D5A2:
	ldrh r2, [r4, 0x4]
	lsls r1, r2, 22
	lsrs r1, 22
	adds r1, 0x5
_0812D5AA:
	ldr r3, _0812D5DC @ =0x000003ff
	adds r0, r3, 0
	ands r1, r0
	ldr r0, _0812D5E0 @ =0xfffffc00
	ands r0, r2
	orrs r0, r1
	strh r0, [r4, 0x4]
	bl Random
	movs r1, 0x7
	ands r0, r1
	adds r1, r0, 0
	cmp r1, 0x3
	ble _0812D5CC
	negs r0, r1
	lsls r0, 24
	lsrs r0, 24
_0812D5CC:
	lsls r0, 24
	asrs r0, 24
	strh r0, [r4, 0x26]
	ldr r0, _0812D5E4 @ =sub_812D5E8
	str r0, [r4, 0x1C]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0812D5DC: .4byte 0x000003ff
_0812D5E0: .4byte 0xfffffc00
_0812D5E4: .4byte sub_812D5E8
	thumb_func_end sub_812D588

	thumb_func_start sub_812D5E8
sub_812D5E8: @ 812D5E8
	push {lr}
	adds r3, r0, 0
	ldrh r0, [r3, 0x2E]
	adds r0, 0x1
	strh r0, [r3, 0x2E]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x1D
	bgt _0812D62A
	ldrh r0, [r3, 0x30]
	adds r0, 0x1
	strh r0, [r3, 0x30]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x2
	bne _0812D65E
	movs r0, 0x3E
	adds r0, r3
	mov r12, r0
	ldrb r2, [r0]
	lsls r0, r2, 29
	lsrs r0, 31
	movs r1, 0x1
	eors r1, r0
	lsls r1, 2
	movs r0, 0x5
	negs r0, r0
	ands r0, r2
	orrs r0, r1
	mov r1, r12
	strb r0, [r1]
	movs r0, 0
	b _0812D65C
_0812D62A:
	movs r1, 0x30
	ldrsh r0, [r3, r1]
	cmp r0, 0x2
	bne _0812D640
	adds r2, r3, 0
	adds r2, 0x3E
	ldrb r1, [r2]
	movs r0, 0x5
	negs r0, r0
	ands r0, r1
	strb r0, [r2]
_0812D640:
	movs r1, 0x30
	ldrsh r0, [r3, r1]
	cmp r0, 0x3
	bne _0812D658
	adds r2, r3, 0
	adds r2, 0x3E
	ldrb r0, [r2]
	movs r1, 0x4
	orrs r0, r1
	strb r0, [r2]
	ldr r0, _0812D670 @ =0x0000ffff
	strh r0, [r3, 0x30]
_0812D658:
	ldrh r0, [r3, 0x30]
	adds r0, 0x1
_0812D65C:
	strh r0, [r3, 0x30]
_0812D65E:
	movs r1, 0x2E
	ldrsh r0, [r3, r1]
	cmp r0, 0x3C
	ble _0812D66C
	adds r0, r3, 0
	bl DestroySprite
_0812D66C:
	pop {r0}
	bx r0
	.align 2, 0
_0812D670: .4byte 0x0000ffff
	thumb_func_end sub_812D5E8

	thumb_func_start sub_812D674
sub_812D674: @ 812D674
	push {r4,r5,lr}
	lsls r0, 24
	lsrs r0, 24
	adds r5, r0, 0
	ldr r1, _0812D6AC @ =gTasks
	lsls r0, r5, 2
	adds r0, r5
	lsls r0, 3
	adds r4, r0, r1
	movs r1, 0x8
	ldrsh r0, [r4, r1]
	cmp r0, 0
	bne _0812D6B4
	movs r0, 0
	bl obj_id_for_side_relative_to_move
	adds r1, r0, 0
	lsls r1, 24
	lsrs r1, 24
	ldr r2, _0812D6B0 @ =gUnknown_08402518
	adds r0, r4, 0
	bl sub_80798F4
	ldrh r0, [r4, 0x8]
	adds r0, 0x1
	strh r0, [r4, 0x8]
	b _0812D6C6
	.align 2, 0
_0812D6AC: .4byte gTasks
_0812D6B0: .4byte gUnknown_08402518
_0812D6B4:
	adds r0, r4, 0
	bl sub_807992C
	lsls r0, 24
	cmp r0, 0
	bne _0812D6C6
	adds r0, r5, 0
	bl move_anim_task_del
_0812D6C6:
	pop {r4,r5}
	pop {r0}
	bx r0
	thumb_func_end sub_812D674

	thumb_func_start sub_812D6CC
sub_812D6CC: @ 812D6CC
	push {r4,r5,lr}
	lsls r0, 24
	lsrs r0, 24
	adds r5, r0, 0
	ldr r1, _0812D704 @ =gTasks
	lsls r0, r5, 2
	adds r0, r5
	lsls r0, 3
	adds r4, r0, r1
	movs r1, 0x8
	ldrsh r0, [r4, r1]
	cmp r0, 0
	bne _0812D70C
	movs r0, 0
	bl obj_id_for_side_relative_to_move
	adds r1, r0, 0
	lsls r1, 24
	lsrs r1, 24
	ldr r2, _0812D708 @ =gUnknown_08402540
	adds r0, r4, 0
	bl sub_80798F4
	ldrh r0, [r4, 0x8]
	adds r0, 0x1
	strh r0, [r4, 0x8]
	b _0812D71E
	.align 2, 0
_0812D704: .4byte gTasks
_0812D708: .4byte gUnknown_08402540
_0812D70C:
	adds r0, r4, 0
	bl sub_807992C
	lsls r0, 24
	cmp r0, 0
	bne _0812D71E
	adds r0, r5, 0
	bl move_anim_task_del
_0812D71E:
	pop {r4,r5}
	pop {r0}
	bx r0
	thumb_func_end sub_812D6CC

	thumb_func_start sub_812D724
sub_812D724: @ 812D724
	push {r4,lr}
	adds r4, r0, 0
	movs r1, 0x2E
	ldrsh r0, [r4, r1]
	cmp r0, 0
	beq _0812D736
	cmp r0, 0x1
	beq _0812D760
	b _0812D788
_0812D736:
	adds r0, r4, 0
	movs r1, 0
	bl sub_80787B0
	movs r0, 0x90
	lsls r0, 4
	strh r0, [r4, 0x30]
	ldr r0, _0812D75C @ =gUnknown_0202F7C8
	ldrb r0, [r0]
	movs r1, 0x3
	bl sub_8077ABC
	lsls r0, 24
	lsrs r0, 24
	strh r0, [r4, 0x32]
	ldrh r0, [r4, 0x2E]
	adds r0, 0x1
	strh r0, [r4, 0x2E]
	b _0812D788
	.align 2, 0
_0812D75C: .4byte gUnknown_0202F7C8
_0812D760:
	ldrh r2, [r4, 0x30]
	lsls r1, r2, 16
	asrs r1, 24
	ldrh r0, [r4, 0x26]
	subs r0, r1
	strh r0, [r4, 0x26]
	subs r2, 0x60
	strh r2, [r4, 0x30]
	movs r2, 0x22
	ldrsh r0, [r4, r2]
	movs r2, 0x26
	ldrsh r1, [r4, r2]
	adds r0, r1
	movs r2, 0x32
	ldrsh r1, [r4, r2]
	cmp r0, r1
	ble _0812D788
	adds r0, r4, 0
	bl move_anim_8072740
_0812D788:
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end sub_812D724

	thumb_func_start sub_812D790
sub_812D790: @ 812D790
	push {r4,r5,lr}
	lsls r0, 24
	lsrs r0, 24
	adds r5, r0, 0
	ldr r1, _0812D7C8 @ =gTasks
	lsls r0, r5, 2
	adds r0, r5
	lsls r0, 3
	adds r4, r0, r1
	movs r1, 0x8
	ldrsh r0, [r4, r1]
	cmp r0, 0
	bne _0812D7D0
	movs r0, 0
	bl obj_id_for_side_relative_to_move
	adds r1, r0, 0
	lsls r1, 24
	lsrs r1, 24
	ldr r2, _0812D7CC @ =gUnknown_08402590
	adds r0, r4, 0
	bl sub_80798F4
	ldrh r0, [r4, 0x8]
	adds r0, 0x1
	strh r0, [r4, 0x8]
	b _0812D7E2
	.align 2, 0
_0812D7C8: .4byte gTasks
_0812D7CC: .4byte gUnknown_08402590
_0812D7D0:
	adds r0, r4, 0
	bl sub_807992C
	lsls r0, 24
	cmp r0, 0
	bne _0812D7E2
	adds r0, r5, 0
	bl move_anim_task_del
_0812D7E2:
	pop {r4,r5}
	pop {r0}
	bx r0
	thumb_func_end sub_812D790

	thumb_func_start sub_812D7E8
sub_812D7E8: @ 812D7E8
	push {r4-r7,lr}
	mov r7, r9
	mov r6, r8
	push {r6,r7}
	sub sp, 0xC
	lsls r0, 24
	lsrs r0, 24
	mov r8, r0
	ldr r1, _0812D818 @ =gTasks
	lsls r0, 2
	add r0, r8
	lsls r0, 3
	adds r0, r1
	movs r2, 0x8
	ldrsh r0, [r0, r2]
	adds r3, r1, 0
	cmp r0, 0x4
	bls _0812D80E
	b _0812DAFA
_0812D80E:
	lsls r0, 2
	ldr r1, _0812D81C @ =_0812D820
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_0812D818: .4byte gTasks
_0812D81C: .4byte _0812D820
	.align 2, 0
_0812D820:
	.4byte _0812D834
	.4byte _0812D888
	.4byte _0812D8C4
	.4byte _0812DA48
	.4byte _0812DA84
_0812D834:
	ldr r1, _0812D850 @ =REG_MOSAIC
	movs r0, 0
	strh r0, [r1]
	ldr r0, _0812D854 @ =gUnknown_0202F7C8
	ldrb r0, [r0]
	bl battle_get_per_side_status_permutated
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _0812D85C
	ldr r0, _0812D858 @ =REG_BG1CNT
	b _0812D85E
	.align 2, 0
_0812D850: .4byte REG_MOSAIC
_0812D854: .4byte gUnknown_0202F7C8
_0812D858: .4byte REG_BG1CNT
_0812D85C:
	ldr r0, _0812D87C @ =REG_BG2CNT
_0812D85E:
	ldrb r1, [r0]
	movs r2, 0x40
	orrs r1, r2
	strb r1, [r0]
	ldr r0, _0812D880 @ =gTasks
	mov r6, r8
	lsls r1, r6, 2
	add r1, r8
	lsls r1, 3
	adds r1, r0
	ldr r0, _0812D884 @ =gBattleAnimArgs
	ldrh r0, [r0]
	strh r0, [r1, 0x1C]
	b _0812DA2A
	.align 2, 0
_0812D87C: .4byte REG_BG2CNT
_0812D880: .4byte gTasks
_0812D884: .4byte gBattleAnimArgs
_0812D888:
	mov r1, r8
	lsls r0, r1, 2
	add r0, r8
	lsls r0, 3
	adds r4, r0, r3
	ldrh r0, [r4, 0xC]
	adds r1, r0, 0x1
	strh r1, [r4, 0xC]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x1
	bgt _0812D8A2
	b _0812DAFA
_0812D8A2:
	movs r0, 0
	strh r0, [r4, 0xC]
	ldrh r0, [r4, 0xA]
	adds r0, 0x1
	strh r0, [r4, 0xA]
	ldrh r2, [r4, 0xA]
	ldr r1, _0812D8C0 @ =REG_MOSAIC
	lsls r0, r2, 4
	orrs r0, r2
	strh r0, [r1]
	cmp r2, 0xF
	beq _0812D8BC
	b _0812DAFA
_0812D8BC:
	b _0812DA78
	.align 2, 0
_0812D8C0: .4byte REG_MOSAIC
_0812D8C4:
	ldr r5, _0812D8F4 @ =gUnknown_0202F7C8
	ldrb r0, [r5]
	ldr r1, _0812D8F8 @ =gUnknown_0202F7C9
	ldrb r1, [r1]
	mov r2, r8
	lsls r4, r2, 2
	adds r2, r4, r2
	lsls r2, 3
	adds r2, r3
	ldrb r2, [r2, 0x1C]
	bl sub_8031FC4
	ldrb r1, [r5]
	mov r0, sp
	bl sub_8078954
	bl sub_8076BE0
	lsls r0, 24
	mov r9, r4
	cmp r0, 0
	beq _0812D8FC
	movs r1, 0
	b _0812D906
	.align 2, 0
_0812D8F4: .4byte gUnknown_0202F7C8
_0812D8F8: .4byte gUnknown_0202F7C9
_0812D8FC:
	ldrb r0, [r5]
	bl battle_get_per_side_status
	lsls r0, 24
	lsrs r1, r0, 24
_0812D906:
	ldr r0, _0812D9CC @ =gUnknown_081FAF4C
	lsls r1, 2
	adds r1, r0
	ldr r2, _0812D9D0 @ =gUnknown_02024E84
	ldr r0, _0812D9D4 @ =gUnknown_0202F7C8
	ldrb r0, [r0]
	adds r0, r2
	ldrb r0, [r0]
	lsls r0, 11
	ldr r1, [r1]
	adds r1, r0
	ldr r2, [sp]
	ldr r0, _0812D9D8 @ =0x040000d4
	str r1, [r0]
	str r2, [r0, 0x4]
	ldr r1, _0812D9DC @ =0x84000200
	str r1, [r0, 0x8]
	ldr r0, [r0, 0x8]
	bl sub_8076BE0
	lsls r0, 24
	cmp r0, 0
	beq _0812DA20
	ldr r5, _0812D9E0 @ =0x02019348
	ldrh r0, [r5]
	bl sub_80AEB1C
	adds r4, r0, 0
	ldrh r0, [r5, 0x2]
	bl sub_80AEB1C
	lsls r4, 24
	lsls r0, 24
	cmp r4, r0
	beq _0812D9A2
	ldr r6, [sp, 0x4]
	movs r5, 0
	movs r0, 0x7
	mov r12, r0
	movs r7, 0
_0812D956:
	movs r4, 0
	adds r3, r7, r6
	mov r1, r12
	lsls r0, r1, 1
	adds r2, r0, r6
_0812D960:
	ldrh r1, [r3]
	ldrh r0, [r2]
	strh r0, [r3]
	strh r1, [r2]
	adds r3, 0x2
	subs r2, 0x2
	adds r4, 0x1
	cmp r4, 0x3
	ble _0812D960
	movs r2, 0x20
	add r12, r2
	adds r7, 0x40
	adds r5, 0x1
	cmp r5, 0x7
	ble _0812D956
	movs r5, 0
	movs r0, 0x80
	lsls r0, 3
	adds r3, r0, 0
_0812D986:
	adds r2, r5, 0x1
	lsls r0, r5, 6
	adds r1, r0, r6
	movs r4, 0x7
_0812D98E:
	ldrh r0, [r1]
	eors r0, r3
	strh r0, [r1]
	adds r1, 0x2
	subs r4, 0x1
	cmp r4, 0
	bge _0812D98E
	adds r5, r2, 0
	cmp r5, 0x7
	ble _0812D986
_0812D9A2:
	ldr r0, _0812D9E0 @ =0x02019348
	ldrh r0, [r0, 0x2]
	bl sub_80AEB1C
	lsls r0, 24
	cmp r0, 0
	beq _0812D9F0
	ldr r3, _0812D9E4 @ =gSprites
	ldr r4, _0812D9E8 @ =gUnknown_02024BE0
	ldr r2, _0812D9D4 @ =gUnknown_0202F7C8
	ldrb r0, [r2]
	adds r0, r4
	ldrb r1, [r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r1, r3, 0
	adds r1, 0x10
	adds r0, r1
	ldr r1, _0812D9EC @ =gSpriteAffineAnimTable_81E7C18
	b _0812DA0A
	.align 2, 0
_0812D9CC: .4byte gUnknown_081FAF4C
_0812D9D0: .4byte gUnknown_02024E84
_0812D9D4: .4byte gUnknown_0202F7C8
_0812D9D8: .4byte 0x040000d4
_0812D9DC: .4byte 0x84000200
_0812D9E0: .4byte 0x02019348
_0812D9E4: .4byte gSprites
_0812D9E8: .4byte gUnknown_02024BE0
_0812D9EC: .4byte gSpriteAffineAnimTable_81E7C18
_0812D9F0:
	ldr r3, _0812DA34 @ =gSprites
	ldr r4, _0812DA38 @ =gUnknown_02024BE0
	ldr r2, _0812DA3C @ =gUnknown_0202F7C8
	ldrb r0, [r2]
	adds r0, r4
	ldrb r1, [r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r1, r3, 0
	adds r1, 0x10
	adds r0, r1
	ldr r1, _0812DA40 @ =gSpriteAffineAnimTable_81E7BEC
_0812DA0A:
	str r1, [r0]
	ldrb r0, [r2]
	adds r0, r4
	ldrb r1, [r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r3
	movs r1, 0
	bl StartSpriteAffineAnim
_0812DA20:
	ldr r0, _0812DA44 @ =gTasks
	mov r1, r9
	add r1, r8
	lsls r1, 3
	adds r1, r0
_0812DA2A:
	ldrh r0, [r1, 0x8]
	adds r0, 0x1
	strh r0, [r1, 0x8]
	b _0812DAFA
	.align 2, 0
_0812DA34: .4byte gSprites
_0812DA38: .4byte gUnknown_02024BE0
_0812DA3C: .4byte gUnknown_0202F7C8
_0812DA40: .4byte gSpriteAffineAnimTable_81E7BEC
_0812DA44: .4byte gTasks
_0812DA48:
	mov r1, r8
	lsls r0, r1, 2
	add r0, r8
	lsls r0, 3
	adds r4, r0, r3
	ldrh r0, [r4, 0xC]
	adds r1, r0, 0x1
	strh r1, [r4, 0xC]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x1
	ble _0812DAFA
	movs r0, 0
	strh r0, [r4, 0xC]
	ldrh r0, [r4, 0xA]
	subs r0, 0x1
	strh r0, [r4, 0xA]
	ldrh r2, [r4, 0xA]
	ldr r1, _0812DA80 @ =REG_MOSAIC
	lsls r0, r2, 4
	orrs r0, r2
	strh r0, [r1]
	cmp r2, 0
	bne _0812DAFA
_0812DA78:
	ldrh r0, [r4, 0x8]
	adds r0, 0x1
	strh r0, [r4, 0x8]
	b _0812DAFA
	.align 2, 0
_0812DA80: .4byte REG_MOSAIC
_0812DA84:
	ldr r1, _0812DAA0 @ =REG_MOSAIC
	movs r0, 0
	strh r0, [r1]
	ldr r0, _0812DAA4 @ =gUnknown_0202F7C8
	ldrb r0, [r0]
	bl battle_get_per_side_status_permutated
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _0812DAAC
	ldr r2, _0812DAA8 @ =REG_BG1CNT
	b _0812DAAE
	.align 2, 0
_0812DAA0: .4byte REG_MOSAIC
_0812DAA4: .4byte gUnknown_0202F7C8
_0812DAA8: .4byte REG_BG1CNT
_0812DAAC:
	ldr r2, _0812DB08 @ =REG_BG2CNT
_0812DAAE:
	ldrb r1, [r2]
	movs r0, 0x41
	negs r0, r0
	ands r0, r1
	strb r0, [r2]
	bl sub_8076BE0
	lsls r0, 24
	cmp r0, 0
	bne _0812DAF4
	ldr r4, _0812DB0C @ =gUnknown_0202F7C8
	ldrb r0, [r4]
	bl battle_side_get_owner
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _0812DAF4
	ldr r0, _0812DB10 @ =gTasks
	mov r2, r8
	lsls r1, r2, 2
	add r1, r8
	lsls r1, 3
	adds r1, r0
	movs r6, 0x1C
	ldrsh r0, [r1, r6]
	cmp r0, 0
	bne _0812DAF4
	ldrb r0, [r4]
	lsls r1, r0, 2
	ldr r2, _0812DB14 @ =0x02017800
	adds r1, r2
	ldrh r1, [r1, 0x2]
	bl sub_8032984
_0812DAF4:
	mov r0, r8
	bl move_anim_task_del
_0812DAFA:
	add sp, 0xC
	pop {r3,r4}
	mov r8, r3
	mov r9, r4
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_0812DB08: .4byte REG_BG2CNT
_0812DB0C: .4byte gUnknown_0202F7C8
_0812DB10: .4byte gTasks
_0812DB14: .4byte 0x02017800
	thumb_func_end sub_812D7E8

	thumb_func_start c3_80DFBE4
c3_80DFBE4: @ 812DB18
	push {r4,lr}
	lsls r0, 24
	lsrs r0, 24
	ldr r4, _0812DB48 @ =gBattleAnimArgs
	ldr r3, _0812DB4C @ =gSprites
	ldr r2, _0812DB50 @ =gUnknown_02024BE0
	ldr r1, _0812DB54 @ =gUnknown_0202F7C8
	ldrb r1, [r1]
	adds r1, r2
	ldrb r2, [r1]
	lsls r1, r2, 4
	adds r1, r2
	lsls r1, 2
	adds r1, r3
	adds r1, 0x3E
	ldrb r1, [r1]
	lsls r1, 29
	lsrs r1, 31
	strh r1, [r4, 0xE]
	bl move_anim_task_del
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0812DB48: .4byte gBattleAnimArgs
_0812DB4C: .4byte gSprites
_0812DB50: .4byte gUnknown_02024BE0
_0812DB54: .4byte gUnknown_0202F7C8
	thumb_func_end c3_80DFBE4

	thumb_func_start sub_812DB58
sub_812DB58: @ 812DB58
	push {r4,lr}
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	ldr r0, _0812DB7C @ =gUnknown_0202F7C8
	ldrb r0, [r0]
	ldr r1, _0812DB80 @ =gUnknown_0202F7C9
	ldrb r1, [r1]
	movs r2, 0x1
	bl sub_8031FC4
	adds r0, r4, 0
	bl move_anim_task_del
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0812DB7C: .4byte gUnknown_0202F7C8
_0812DB80: .4byte gUnknown_0202F7C9
	thumb_func_end sub_812DB58

	thumb_func_start sub_812DB84
sub_812DB84: @ 812DB84
	push {r4-r7,lr}
	mov r7, r9
	mov r6, r8
	push {r6,r7}
	sub sp, 0x10
	lsls r0, 24
	lsrs r7, r0, 24
	ldr r1, _0812DBB4 @ =gTasks
	lsls r0, r7, 2
	adds r0, r7
	lsls r0, 3
	adds r0, r1
	movs r2, 0x8
	ldrsh r0, [r0, r2]
	adds r2, r1, 0
	cmp r0, 0x4
	bls _0812DBA8
	b _0812DE80
_0812DBA8:
	lsls r0, 2
	ldr r1, _0812DBB8 @ =_0812DBBC
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_0812DBB4: .4byte gTasks
_0812DBB8: .4byte _0812DBBC
	.align 2, 0
_0812DBBC:
	.4byte _0812DBD0
	.4byte _0812DCFC
	.4byte _0812DD4C
	.4byte _0812DDB6
	.4byte _0812DDEA
_0812DBD0:
	ldr r1, _0812DC70 @ =REG_BLDCNT
	ldr r4, _0812DC74 @ =0x00003f42
	adds r0, r4, 0
	strh r0, [r1]
	adds r1, 0x2
	movs r2, 0x80
	lsls r2, 5
	adds r0, r2, 0
	strh r0, [r1]
	ldr r4, _0812DC78 @ =REG_BG1CNT
	ldrb r1, [r4, 0x1]
	movs r0, 0x3F
	ands r0, r1
	strb r0, [r4, 0x1]
	ldrb r1, [r4]
	movs r0, 0x4
	negs r0, r0
	ands r0, r1
	movs r1, 0x1
	orrs r0, r1
	strb r0, [r4]
	bl sub_8076BE0
	lsls r0, 24
	cmp r0, 0
	bne _0812DC12
	ldrb r0, [r4]
	movs r1, 0xD
	negs r1, r1
	ands r1, r0
	movs r0, 0x4
	orrs r1, r0
	strb r1, [r4]
_0812DC12:
	mov r0, sp
	bl sub_8078914
	ldr r1, [sp, 0x4]
	movs r4, 0
	str r4, [sp, 0xC]
	ldr r2, _0812DC7C @ =0x040000d4
	add r0, sp, 0xC
	str r0, [r2]
	str r1, [r2, 0x4]
	ldr r0, _0812DC80 @ =0x85000400
	str r0, [r2, 0x8]
	ldr r0, [r2, 0x8]
	ldr r0, _0812DC84 @ =gUnknown_08D2AA98
	bl LZDecompressVram
	ldr r0, _0812DC88 @ =gUnknown_08D2A9E0
	ldr r1, [sp]
	bl LZDecompressVram
	ldr r0, _0812DC8C @ =gUnknown_08D2AA80
	mov r1, sp
	ldrb r1, [r1, 0x8]
	lsls r1, 4
	movs r2, 0x20
	bl LoadCompressedPalette
	bl sub_8076BE0
	lsls r0, 24
	cmp r0, 0
	beq _0812DC9C
	mov r0, sp
	ldrb r0, [r0, 0x8]
	ldr r1, [sp, 0x4]
	movs r2, 0
	movs r3, 0
	bl sub_80763FC
	ldr r1, _0812DC90 @ =gUnknown_030042C0
	ldr r2, _0812DC94 @ =0x0000ffc8
	adds r0, r2, 0
	strh r0, [r1]
	ldr r0, _0812DC98 @ =gUnknown_030041B4
	strh r4, [r0]
	b _0812DCCE
	.align 2, 0
_0812DC70: .4byte REG_BLDCNT
_0812DC74: .4byte 0x00003f42
_0812DC78: .4byte REG_BG1CNT
_0812DC7C: .4byte 0x040000d4
_0812DC80: .4byte 0x85000400
_0812DC84: .4byte gUnknown_08D2AA98
_0812DC88: .4byte gUnknown_08D2A9E0
_0812DC8C: .4byte gUnknown_08D2AA80
_0812DC90: .4byte gUnknown_030042C0
_0812DC94: .4byte 0x0000ffc8
_0812DC98: .4byte gUnknown_030041B4
_0812DC9C:
	ldr r0, _0812DCB4 @ =gUnknown_0202F7C8
	ldrb r0, [r0]
	bl battle_side_get_owner
	lsls r0, 24
	cmp r0, 0
	beq _0812DCC0
	ldr r1, _0812DCB8 @ =gUnknown_030042C0
	ldr r4, _0812DCBC @ =0x0000ff79
	adds r0, r4, 0
	b _0812DCC6
	.align 2, 0
_0812DCB4: .4byte gUnknown_0202F7C8
_0812DCB8: .4byte gUnknown_030042C0
_0812DCBC: .4byte 0x0000ff79
_0812DCC0:
	ldr r1, _0812DCEC @ =gUnknown_030042C0
	ldr r2, _0812DCF0 @ =0x0000fff6
	adds r0, r2, 0
_0812DCC6:
	strh r0, [r1]
	ldr r1, _0812DCF4 @ =gUnknown_030041B4
	movs r0, 0
	strh r0, [r1]
_0812DCCE:
	ldr r0, _0812DCF8 @ =gTasks
	lsls r1, r7, 2
	adds r1, r7
	lsls r1, 3
	adds r1, r0
	ldr r0, _0812DCEC @ =gUnknown_030042C0
	ldrh r0, [r0]
	strh r0, [r1, 0x1C]
	ldr r0, _0812DCF4 @ =gUnknown_030041B4
	ldrh r0, [r0]
	strh r0, [r1, 0x1E]
	ldrh r0, [r1, 0x8]
	adds r0, 0x1
	b _0812DDD2
	.align 2, 0
_0812DCEC: .4byte gUnknown_030042C0
_0812DCF0: .4byte 0x0000fff6
_0812DCF4: .4byte gUnknown_030041B4
_0812DCF8: .4byte gTasks
_0812DCFC:
	lsls r0, r7, 2
	adds r0, r7
	lsls r0, 3
	adds r3, r0, r2
	ldrh r0, [r3, 0x10]
	adds r1, r0, 0x1
	strh r1, [r3, 0x10]
	lsls r0, 16
	cmp r0, 0
	bgt _0812DD12
	b _0812DE80
_0812DD12:
	movs r0, 0
	strh r0, [r3, 0x10]
	ldrh r0, [r3, 0xA]
	adds r0, 0x1
	strh r0, [r3, 0xA]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0xC
	ble _0812DD28
	movs r0, 0xC
	strh r0, [r3, 0xA]
_0812DD28:
	ldr r2, _0812DD48 @ =REG_BLDALPHA
	ldrh r1, [r3, 0xA]
	movs r0, 0x10
	subs r0, r1
	lsls r0, 8
	orrs r0, r1
	strh r0, [r2]
	movs r4, 0xA
	ldrsh r0, [r3, r4]
	cmp r0, 0xC
	beq _0812DD40
	b _0812DE80
_0812DD40:
	ldrh r0, [r3, 0x8]
	adds r0, 0x1
	strh r0, [r3, 0x8]
	b _0812DE80
	.align 2, 0
_0812DD48: .4byte REG_BLDALPHA
_0812DD4C:
	lsls r0, r7, 2
	adds r0, r7
	lsls r0, 3
	adds r3, r0, r2
	ldrh r0, [r3, 0xA]
	subs r0, 0x1
	strh r0, [r3, 0xA]
	lsls r0, 16
	cmp r0, 0
	bge _0812DD64
	movs r0, 0
	strh r0, [r3, 0xA]
_0812DD64:
	ldr r2, _0812DDA4 @ =REG_BLDALPHA
	ldrh r1, [r3, 0xA]
	movs r0, 0x10
	subs r0, r1
	lsls r0, 8
	orrs r0, r1
	strh r0, [r2]
	movs r1, 0xA
	ldrsh r0, [r3, r1]
	cmp r0, 0
	beq _0812DD7C
	b _0812DE80
_0812DD7C:
	ldr r2, _0812DDA8 @ =gUnknown_030042C0
	ldr r1, _0812DDAC @ =gUnknown_084025C0
	movs r4, 0xC
	ldrsh r0, [r3, r4]
	adds r0, r1
	ldrb r0, [r0]
	lsls r0, 24
	asrs r0, 24
	ldrh r1, [r3, 0x1C]
	adds r0, r1
	strh r0, [r2]
	ldrh r0, [r3, 0xC]
	adds r0, 0x1
	strh r0, [r3, 0xC]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x4
	bne _0812DDB0
	strh r0, [r3, 0x8]
	b _0812DE80
	.align 2, 0
_0812DDA4: .4byte REG_BLDALPHA
_0812DDA8: .4byte gUnknown_030042C0
_0812DDAC: .4byte gUnknown_084025C0
_0812DDB0:
	movs r0, 0x3
	strh r0, [r3, 0x8]
	b _0812DE80
_0812DDB6:
	lsls r0, r7, 2
	adds r0, r7
	lsls r0, 3
	adds r1, r0, r2
	ldrh r0, [r1, 0xE]
	adds r0, 0x1
	strh r0, [r1, 0xE]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x4
	bne _0812DE80
	movs r0, 0
	strh r0, [r1, 0xE]
	movs r0, 0x1
_0812DDD2:
	strh r0, [r1, 0x8]
	movs r0, 0x40
	negs r0, r0
	bl sub_8076F98
	adds r1, r0, 0
	lsls r1, 24
	asrs r1, 24
	movs r0, 0xE4
	bl PlaySE12WithPanning
	b _0812DE80
_0812DDEA:
	mov r0, sp
	bl sub_8078914
	ldr r2, [sp]
	movs r3, 0x80
	lsls r3, 6
	add r5, sp, 0xC
	movs r6, 0
	ldr r1, _0812DE90 @ =0x040000d4
	movs r4, 0x80
	lsls r4, 5
	mov r8, r5
	ldr r0, _0812DE94 @ =0x85000400
	mov r12, r0
	movs r0, 0x85
	lsls r0, 24
	mov r9, r0
_0812DE0C:
	str r6, [sp, 0xC]
	mov r0, r8
	str r0, [r1]
	str r2, [r1, 0x4]
	mov r0, r12
	str r0, [r1, 0x8]
	ldr r0, [r1, 0x8]
	adds r2, r4
	subs r3, r4
	cmp r3, r4
	bhi _0812DE0C
	str r6, [sp, 0xC]
	str r5, [r1]
	str r2, [r1, 0x4]
	lsrs r0, r3, 2
	mov r2, r9
	orrs r0, r2
	str r0, [r1, 0x8]
	ldr r0, [r1, 0x8]
	ldr r1, [sp, 0x4]
	movs r4, 0
	str r4, [sp, 0xC]
	ldr r0, _0812DE90 @ =0x040000d4
	str r5, [r0]
	str r1, [r0, 0x4]
	ldr r1, _0812DE98 @ =0x85000200
	str r1, [r0, 0x8]
	ldr r0, [r0, 0x8]
	bl sub_8076BE0
	lsls r0, 24
	cmp r0, 0
	bne _0812DE5A
	ldr r2, _0812DE9C @ =REG_BG1CNT
	ldrb r1, [r2]
	movs r0, 0xD
	negs r0, r0
	ands r0, r1
	strb r0, [r2]
_0812DE5A:
	ldr r2, _0812DE9C @ =REG_BG1CNT
	ldrb r1, [r2]
	movs r0, 0x4
	negs r0, r0
	ands r0, r1
	movs r1, 0x1
	orrs r0, r1
	strb r0, [r2]
	ldr r0, _0812DEA0 @ =gUnknown_030042C0
	strh r4, [r0]
	ldr r0, _0812DEA4 @ =gUnknown_030041B4
	strh r4, [r0]
	ldr r0, _0812DEA8 @ =REG_BLDCNT
	strh r4, [r0]
	adds r0, 0x2
	strh r4, [r0]
	adds r0, r7, 0
	bl move_anim_task_del
_0812DE80:
	add sp, 0x10
	pop {r3,r4}
	mov r8, r3
	mov r9, r4
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_0812DE90: .4byte 0x040000d4
_0812DE94: .4byte 0x85000400
_0812DE98: .4byte 0x85000200
_0812DE9C: .4byte REG_BG1CNT
_0812DEA0: .4byte gUnknown_030042C0
_0812DEA4: .4byte gUnknown_030041B4
_0812DEA8: .4byte REG_BLDCNT
	thumb_func_end sub_812DB84

	thumb_func_start sub_812DEAC
sub_812DEAC: @ 812DEAC
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	sub sp, 0x4
	adds r7, r0, 0
	bl Random
	lsls r0, 16
	movs r1, 0xFC
	lsls r1, 14
	ands r1, r0
	lsrs r5, r1, 16
	adds r1, r5, 0
	cmp r1, 0x1F
	ble _0812DED6
	movs r0, 0x20
	subs r0, r1
	lsls r0, 16
	lsrs r5, r0, 16
_0812DED6:
	ldr r4, _0812DFD0 @ =gUnknown_0202F7C8
	ldrb r0, [r4]
	movs r1, 0
	bl sub_8077ABC
	lsls r0, 24
	lsrs r0, 24
	adds r0, r5
	strh r0, [r7, 0x20]
	ldrb r0, [r4]
	movs r1, 0x1
	bl sub_8077ABC
	lsls r0, 24
	lsrs r0, 24
	adds r0, 0x20
	strh r0, [r7, 0x22]
	ldr r1, _0812DFD4 @ =gBattleAnimArgs
	ldrh r0, [r1]
	strh r0, [r7, 0x30]
	ldrh r0, [r1, 0x2]
	strh r0, [r7, 0x32]
	ldr r4, _0812DFD8 @ =gBattleAnimSpriteTemplate_84025EC
	movs r0, 0x20
	ldrsh r1, [r7, r0]
	movs r0, 0x22
	ldrsh r2, [r7, r0]
	adds r5, r7, 0
	adds r5, 0x43
	ldrb r3, [r5]
	adds r3, 0x1
	lsls r3, 24
	lsrs r3, 24
	adds r0, r4, 0
	bl CreateSprite
	mov r9, r0
	mov r1, r9
	lsls r1, 24
	lsrs r1, 24
	mov r9, r1
	movs r0, 0x20
	ldrsh r1, [r7, r0]
	movs r0, 0x22
	ldrsh r2, [r7, r0]
	ldrb r3, [r5]
	adds r3, 0x1
	lsls r3, 24
	lsrs r3, 24
	adds r0, r4, 0
	bl CreateSprite
	mov r8, r0
	mov r1, r8
	lsls r1, 24
	lsrs r1, 24
	mov r8, r1
	mov r0, r9
	lsls r2, r0, 4
	add r2, r9
	lsls r2, 2
	ldr r1, _0812DFDC @ =gSprites
	mov r10, r1
	adds r5, r2, r1
	adds r0, r5, 0
	movs r1, 0x1
	str r2, [sp]
	bl StartSpriteAnim
	mov r0, r8
	lsls r6, r0, 4
	add r6, r8
	lsls r6, 2
	mov r1, r10
	adds r4, r6, r1
	adds r0, r4, 0
	movs r1, 0x2
	bl StartSpriteAnim
	ldr r1, _0812DFD4 @ =gBattleAnimArgs
	ldrh r0, [r1]
	strh r0, [r5, 0x30]
	ldrh r0, [r1, 0x2]
	strh r0, [r5, 0x32]
	ldrh r0, [r1]
	strh r0, [r4, 0x30]
	ldrh r0, [r1, 0x2]
	strh r0, [r4, 0x32]
	ldr r0, _0812DFE0 @ =0x0000ffff
	strh r0, [r5, 0x3C]
	movs r0, 0x1
	negs r0, r0
	strh r0, [r4, 0x3C]
	adds r5, 0x3E
	ldrb r0, [r5]
	movs r1, 0x4
	orrs r0, r1
	strb r0, [r5]
	adds r4, 0x3E
	ldrb r0, [r4]
	orrs r0, r1
	strb r0, [r4]
	movs r0, 0x1C
	add r10, r0
	ldr r2, [sp]
	add r2, r10
	ldr r0, _0812DFE4 @ =sub_812E0F8
	str r0, [r2]
	add r6, r10
	str r0, [r6]
	mov r1, r9
	strh r1, [r7, 0x3A]
	mov r0, r8
	strh r0, [r7, 0x3C]
	ldr r0, _0812DFE8 @ =sub_812DFEC
	str r0, [r7, 0x1C]
	add sp, 0x4
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_0812DFD0: .4byte gUnknown_0202F7C8
_0812DFD4: .4byte gBattleAnimArgs
_0812DFD8: .4byte gBattleAnimSpriteTemplate_84025EC
_0812DFDC: .4byte gSprites
_0812DFE0: .4byte 0x0000ffff
_0812DFE4: .4byte sub_812E0F8
_0812DFE8: .4byte sub_812DFEC
	thumb_func_end sub_812DEAC

	thumb_func_start sub_812DFEC
sub_812DFEC: @ 812DFEC
	push {lr}
	adds r3, r0, 0
	ldrh r2, [r3, 0x32]
	ldrh r0, [r3, 0x34]
	adds r2, r0
	lsls r0, r2, 16
	asrs r0, 24
	ldrh r1, [r3, 0x26]
	subs r1, r0
	strh r1, [r3, 0x26]
	movs r0, 0xFF
	ands r2, r0
	strh r2, [r3, 0x34]
	movs r2, 0x36
	ldrsh r0, [r3, r2]
	cmp r0, 0
	bne _0812E03A
	lsls r0, r1, 16
	asrs r0, 16
	movs r1, 0x8
	negs r1, r1
	cmp r0, r1
	bge _0812E03A
	ldr r2, _0812E094 @ =gSprites
	movs r0, 0x3A
	ldrsh r1, [r3, r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r2
	adds r0, 0x3E
	ldrb r2, [r0]
	movs r1, 0x5
	negs r1, r1
	ands r1, r2
	strb r1, [r0]
	ldrh r0, [r3, 0x36]
	adds r0, 0x1
	strh r0, [r3, 0x36]
_0812E03A:
	movs r1, 0x36
	ldrsh r0, [r3, r1]
	cmp r0, 0x1
	bne _0812E06E
	movs r2, 0x26
	ldrsh r1, [r3, r2]
	movs r0, 0x10
	negs r0, r0
	cmp r1, r0
	bge _0812E06E
	ldr r2, _0812E094 @ =gSprites
	movs r0, 0x3C
	ldrsh r1, [r3, r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r2
	adds r0, 0x3E
	ldrb r2, [r0]
	movs r1, 0x5
	negs r1, r1
	ands r1, r2
	strb r1, [r0]
	ldrh r0, [r3, 0x36]
	adds r0, 0x1
	strh r0, [r3, 0x36]
_0812E06E:
	ldrh r0, [r3, 0x30]
	subs r0, 0x1
	strh r0, [r3, 0x30]
	lsls r0, 16
	asrs r0, 16
	movs r1, 0x1
	negs r1, r1
	cmp r0, r1
	bne _0812E090
	adds r2, r3, 0
	adds r2, 0x3E
	ldrb r0, [r2]
	movs r1, 0x4
	orrs r0, r1
	strb r0, [r2]
	ldr r0, _0812E098 @ =sub_812E09C
	str r0, [r3, 0x1C]
_0812E090:
	pop {r0}
	bx r0
	.align 2, 0
_0812E094: .4byte gSprites
_0812E098: .4byte sub_812E09C
	thumb_func_end sub_812DFEC

	thumb_func_start sub_812E09C
sub_812E09C: @ 812E09C
	push {r4-r6,lr}
	adds r4, r0, 0
	ldr r5, _0812E0F0 @ =gSprites
	movs r0, 0x3A
	ldrsh r1, [r4, r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r3, r0, 2
	adds r6, r5, 0
	adds r6, 0x1C
	adds r0, r3, r6
	ldr r2, [r0]
	ldr r0, _0812E0F4 @ =SpriteCallbackDummy
	cmp r2, r0
	bne _0812E0E8
	movs r1, 0x3C
	ldrsh r0, [r4, r1]
	lsls r1, r0, 4
	adds r1, r0
	lsls r1, 2
	adds r1, r6
	ldr r0, [r1]
	cmp r0, r2
	bne _0812E0E8
	adds r0, r3, r5
	bl DestroySprite
	movs r0, 0x3C
	ldrsh r1, [r4, r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r5
	bl DestroySprite
	adds r0, r4, 0
	bl move_anim_8072740
_0812E0E8:
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_0812E0F0: .4byte gSprites
_0812E0F4: .4byte SpriteCallbackDummy
	thumb_func_end sub_812E09C

	thumb_func_start sub_812E0F8
sub_812E0F8: @ 812E0F8
	push {lr}
	adds r3, r0, 0
	movs r0, 0x3E
	adds r0, r3
	mov r12, r0
	ldrb r1, [r0]
	movs r0, 0x4
	ands r0, r1
	cmp r0, 0
	bne _0812E144
	ldrh r2, [r3, 0x32]
	ldrh r1, [r3, 0x34]
	adds r2, r1
	lsls r1, r2, 16
	asrs r1, 24
	ldrh r0, [r3, 0x26]
	subs r0, r1
	strh r0, [r3, 0x26]
	movs r0, 0xFF
	ands r2, r0
	strh r2, [r3, 0x34]
	ldrh r0, [r3, 0x30]
	subs r0, 0x1
	strh r0, [r3, 0x30]
	lsls r0, 16
	asrs r0, 16
	movs r1, 0x1
	negs r1, r1
	cmp r0, r1
	bne _0812E144
	mov r1, r12
	ldrb r0, [r1]
	movs r1, 0x4
	orrs r0, r1
	mov r1, r12
	strb r0, [r1]
	ldr r0, _0812E148 @ =SpriteCallbackDummy
	str r0, [r3, 0x1C]
_0812E144:
	pop {r0}
	bx r0
	.align 2, 0
_0812E148: .4byte SpriteCallbackDummy
	thumb_func_end sub_812E0F8

	thumb_func_start sub_812E14C
sub_812E14C: @ 812E14C
	push {r4-r6,lr}
	sub sp, 0x10
	lsls r0, 24
	lsrs r6, r0, 24
	ldr r1, _0812E174 @ =gTasks
	lsls r0, r6, 2
	adds r0, r6
	lsls r0, 3
	adds r0, r1
	movs r2, 0x8
	ldrsh r0, [r0, r2]
	adds r4, r1, 0
	cmp r0, 0x5
	bls _0812E16A
	b _0812E476
_0812E16A:
	lsls r0, 2
	ldr r1, _0812E178 @ =_0812E17C
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_0812E174: .4byte gTasks
_0812E178: .4byte _0812E17C
	.align 2, 0
_0812E17C:
	.4byte _0812E194
	.4byte _0812E300
	.4byte _0812E388
	.4byte _0812E3BC
	.4byte _0812E3E8
	.4byte _0812E420
_0812E194:
	ldr r1, _0812E230 @ =REG_BLDCNT
	ldr r3, _0812E234 @ =0x00003f42
	adds r0, r3, 0
	strh r0, [r1]
	adds r1, 0x2
	ldr r2, _0812E238 @ =0x00000d03
	adds r0, r2, 0
	strh r0, [r1]
	ldr r4, _0812E23C @ =REG_BG1CNT
	ldrb r1, [r4, 0x1]
	movs r0, 0x3F
	ands r0, r1
	strb r0, [r4, 0x1]
	ldrb r1, [r4]
	movs r0, 0x4
	negs r0, r0
	ands r0, r1
	movs r1, 0x1
	orrs r0, r1
	strb r0, [r4]
	bl sub_8076BE0
	lsls r0, 24
	cmp r0, 0
	bne _0812E1D4
	ldrb r0, [r4]
	movs r1, 0xD
	negs r1, r1
	ands r1, r0
	movs r0, 0x4
	orrs r1, r0
	strb r1, [r4]
_0812E1D4:
	mov r0, sp
	bl sub_8078914
	ldr r1, [sp, 0x4]
	movs r4, 0
	str r4, [sp, 0xC]
	ldr r2, _0812E240 @ =0x040000d4
	add r0, sp, 0xC
	str r0, [r2]
	str r1, [r2, 0x4]
	ldr r0, _0812E244 @ =0x85000400
	str r0, [r2, 0x8]
	ldr r0, [r2, 0x8]
	ldr r0, _0812E248 @ =gUnknown_08D2AA98
	bl LZDecompressVram
	ldr r0, _0812E24C @ =gUnknown_08D2A9E0
	ldr r1, [sp]
	bl LZDecompressVram
	ldr r0, _0812E250 @ =gUnknown_08D2AA80
	mov r1, sp
	ldrb r1, [r1, 0x8]
	lsls r1, 4
	movs r2, 0x20
	bl LoadCompressedPalette
	bl sub_8076BE0
	lsls r0, 24
	cmp r0, 0
	beq _0812E260
	mov r0, sp
	ldrb r0, [r0, 0x8]
	ldr r1, [sp, 0x4]
	movs r2, 0
	movs r3, 0
	bl sub_80763FC
	ldr r1, _0812E254 @ =gUnknown_030042C0
	ldr r3, _0812E258 @ =0x0000ffc8
	adds r0, r3, 0
	strh r0, [r1]
	ldr r0, _0812E25C @ =gUnknown_030041B4
	strh r4, [r0]
	b _0812E2D2
	.align 2, 0
_0812E230: .4byte REG_BLDCNT
_0812E234: .4byte 0x00003f42
_0812E238: .4byte 0x00000d03
_0812E23C: .4byte REG_BG1CNT
_0812E240: .4byte 0x040000d4
_0812E244: .4byte 0x85000400
_0812E248: .4byte gUnknown_08D2AA98
_0812E24C: .4byte gUnknown_08D2A9E0
_0812E250: .4byte gUnknown_08D2AA80
_0812E254: .4byte gUnknown_030042C0
_0812E258: .4byte 0x0000ffc8
_0812E25C: .4byte gUnknown_030041B4
_0812E260:
	ldr r0, _0812E2A0 @ =gUnknown_0202F7C9
	ldrb r0, [r0]
	bl battle_get_per_side_status
	lsls r0, 24
	lsrs r4, r0, 24
	bl IsDoubleBattle
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _0812E2B4
	ldr r1, _0812E2A4 @ =gUnknown_030042C0
	cmp r4, 0x1
	bne _0812E284
	ldr r2, _0812E2A8 @ =0x0000ff65
	adds r0, r2, 0
	strh r0, [r1]
_0812E284:
	cmp r4, 0x3
	bne _0812E28E
	ldr r3, _0812E2AC @ =0x0000ff8d
	adds r0, r3, 0
	strh r0, [r1]
_0812E28E:
	cmp r4, 0
	bne _0812E296
	movs r0, 0xE
	strh r0, [r1]
_0812E296:
	cmp r4, 0x2
	bne _0812E2CC
	ldr r1, _0812E2A4 @ =gUnknown_030042C0
	ldr r2, _0812E2B0 @ =0x0000ffec
	b _0812E2C8
	.align 2, 0
_0812E2A0: .4byte gUnknown_0202F7C9
_0812E2A4: .4byte gUnknown_030042C0
_0812E2A8: .4byte 0x0000ff65
_0812E2AC: .4byte 0x0000ff8d
_0812E2B0: .4byte 0x0000ffec
_0812E2B4:
	cmp r4, 0x1
	bne _0812E2C0
	ldr r1, _0812E2EC @ =gUnknown_030042C0
	ldr r3, _0812E2F0 @ =0x0000ff79
	adds r0, r3, 0
	strh r0, [r1]
_0812E2C0:
	cmp r4, 0
	bne _0812E2CC
	ldr r1, _0812E2EC @ =gUnknown_030042C0
	ldr r2, _0812E2F4 @ =0x0000fff6
_0812E2C8:
	adds r0, r2, 0
	strh r0, [r1]
_0812E2CC:
	ldr r1, _0812E2F8 @ =gUnknown_030041B4
	movs r0, 0
	strh r0, [r1]
_0812E2D2:
	ldr r0, _0812E2FC @ =gTasks
	lsls r1, r6, 2
	adds r1, r6
	lsls r1, 3
	adds r1, r0
	ldr r0, _0812E2EC @ =gUnknown_030042C0
	ldrh r0, [r0]
	strh r0, [r1, 0x1C]
	ldr r0, _0812E2F8 @ =gUnknown_030041B4
	ldrh r0, [r0]
	strh r0, [r1, 0x1E]
	b _0812E380
	.align 2, 0
_0812E2EC: .4byte gUnknown_030042C0
_0812E2F0: .4byte 0x0000ff79
_0812E2F4: .4byte 0x0000fff6
_0812E2F8: .4byte gUnknown_030041B4
_0812E2FC: .4byte gTasks
_0812E300:
	ldr r1, _0812E334 @ =gTasks
	lsls r4, r6, 2
	adds r0, r4, r6
	lsls r0, 3
	adds r5, r0, r1
	movs r0, 0
	strh r0, [r5, 0xE]
	ldr r0, _0812E338 @ =gUnknown_0202F7C9
	ldrb r0, [r0]
	bl battle_side_get_owner
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _0812E344
	ldr r2, _0812E33C @ =gUnknown_030042C0
	ldr r1, _0812E340 @ =gUnknown_08402604
	movs r3, 0xC
	ldrsh r0, [r5, r3]
	adds r0, r1
	ldrb r0, [r0]
	lsls r0, 24
	asrs r0, 24
	ldrh r5, [r5, 0x1C]
	adds r0, r5
	b _0812E356
	.align 2, 0
_0812E334: .4byte gTasks
_0812E338: .4byte gUnknown_0202F7C9
_0812E33C: .4byte gUnknown_030042C0
_0812E340: .4byte gUnknown_08402604
_0812E344:
	ldr r2, _0812E374 @ =gUnknown_030042C0
	ldr r1, _0812E378 @ =gUnknown_08402604
	movs r3, 0xC
	ldrsh r0, [r5, r3]
	adds r0, r1
	movs r1, 0
	ldrsb r1, [r0, r1]
	ldrh r0, [r5, 0x1C]
	subs r0, r1
_0812E356:
	strh r0, [r2]
	ldr r0, _0812E37C @ =gTasks
	adds r1, r4, r6
	lsls r1, 3
	adds r1, r0
	ldrh r0, [r1, 0xC]
	adds r0, 0x1
	strh r0, [r1, 0xC]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x5
	bne _0812E380
	strh r0, [r1, 0x8]
	b _0812E476
	.align 2, 0
_0812E374: .4byte gUnknown_030042C0
_0812E378: .4byte gUnknown_08402604
_0812E37C: .4byte gTasks
_0812E380:
	ldrh r0, [r1, 0x8]
	adds r0, 0x1
	strh r0, [r1, 0x8]
	b _0812E476
_0812E388:
	lsls r0, r6, 2
	adds r0, r6
	lsls r0, 3
	adds r4, r0, r4
	ldrh r0, [r4, 0xA]
	subs r0, 0x1
	strh r0, [r4, 0xA]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x4
	bgt _0812E3A2
	movs r0, 0x5
	strh r0, [r4, 0xA]
_0812E3A2:
	ldr r2, _0812E3B8 @ =REG_BLDALPHA
	ldrh r0, [r4, 0xA]
	lsls r0, 8
	movs r1, 0x3
	orrs r0, r1
	strh r0, [r2]
	movs r1, 0xA
	ldrsh r0, [r4, r1]
	cmp r0, 0x5
	bne _0812E476
	b _0812E3DC
	.align 2, 0
_0812E3B8: .4byte REG_BLDALPHA
_0812E3BC:
	lsls r0, r6, 2
	adds r0, r6
	lsls r0, 3
	adds r4, r0, r4
	ldrh r1, [r4, 0xE]
	adds r1, 0x1
	strh r1, [r4, 0xE]
	lsls r1, 16
	asrs r1, 16
	ldr r2, _0812E3E4 @ =gUnknown_08402608
	movs r3, 0xC
	ldrsh r0, [r4, r3]
	adds r0, r2
	ldrb r0, [r0]
	cmp r1, r0
	ble _0812E476
_0812E3DC:
	ldrh r0, [r4, 0x8]
	adds r0, 0x1
	strh r0, [r4, 0x8]
	b _0812E476
	.align 2, 0
_0812E3E4: .4byte gUnknown_08402608
_0812E3E8:
	lsls r0, r6, 2
	adds r0, r6
	lsls r0, 3
	adds r4, r0, r4
	ldrh r0, [r4, 0xA]
	adds r0, 0x1
	strh r0, [r4, 0xA]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0xD
	ble _0812E402
	movs r0, 0xD
	strh r0, [r4, 0xA]
_0812E402:
	ldr r2, _0812E41C @ =REG_BLDALPHA
	ldrh r0, [r4, 0xA]
	lsls r0, 8
	movs r1, 0x3
	orrs r0, r1
	strh r0, [r2]
	movs r1, 0xA
	ldrsh r0, [r4, r1]
	cmp r0, 0xD
	bne _0812E476
	movs r0, 0x1
	strh r0, [r4, 0x8]
	b _0812E476
	.align 2, 0
_0812E41C: .4byte REG_BLDALPHA
_0812E420:
	mov r0, sp
	bl sub_8078914
	ldr r2, [sp, 0x4]
	movs r4, 0
	str r4, [sp, 0xC]
	ldr r1, _0812E480 @ =0x040000d4
	add r0, sp, 0xC
	str r0, [r1]
	str r2, [r1, 0x4]
	ldr r0, _0812E484 @ =0x85000200
	str r0, [r1, 0x8]
	ldr r0, [r1, 0x8]
	bl sub_8076BE0
	lsls r0, 24
	cmp r0, 0
	bne _0812E450
	ldr r2, _0812E488 @ =REG_BG1CNT
	ldrb r1, [r2]
	movs r0, 0xD
	negs r0, r0
	ands r0, r1
	strb r0, [r2]
_0812E450:
	ldr r2, _0812E488 @ =REG_BG1CNT
	ldrb r1, [r2]
	movs r0, 0x4
	negs r0, r0
	ands r0, r1
	movs r1, 0x1
	orrs r0, r1
	strb r0, [r2]
	ldr r0, _0812E48C @ =gUnknown_030042C0
	strh r4, [r0]
	ldr r0, _0812E490 @ =gUnknown_030041B4
	strh r4, [r0]
	ldr r0, _0812E494 @ =REG_BLDCNT
	strh r4, [r0]
	adds r0, 0x2
	strh r4, [r0]
	adds r0, r6, 0
	bl move_anim_task_del
_0812E476:
	add sp, 0x10
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_0812E480: .4byte 0x040000d4
_0812E484: .4byte 0x85000200
_0812E488: .4byte REG_BG1CNT
_0812E48C: .4byte gUnknown_030042C0
_0812E490: .4byte gUnknown_030041B4
_0812E494: .4byte REG_BLDCNT
	thumb_func_end sub_812E14C

	thumb_func_start sub_812E498
sub_812E498: @ 812E498
	push {r4,r5,lr}
	lsls r0, 24
	lsrs r0, 24
	adds r5, r0, 0
	ldr r1, _0812E4D0 @ =gTasks
	lsls r0, r5, 2
	adds r0, r5
	lsls r0, 3
	adds r4, r0, r1
	movs r1, 0x8
	ldrsh r0, [r4, r1]
	cmp r0, 0
	bne _0812E4D8
	movs r0, 0
	bl obj_id_for_side_relative_to_move
	adds r1, r0, 0
	lsls r1, 24
	lsrs r1, 24
	ldr r2, _0812E4D4 @ =gUnknown_08402610
	adds r0, r4, 0
	bl sub_80798F4
	ldrh r0, [r4, 0x8]
	adds r0, 0x1
	strh r0, [r4, 0x8]
	b _0812E4EA
	.align 2, 0
_0812E4D0: .4byte gTasks
_0812E4D4: .4byte gUnknown_08402610
_0812E4D8:
	adds r0, r4, 0
	bl sub_807992C
	lsls r0, 24
	cmp r0, 0
	bne _0812E4EA
	adds r0, r5, 0
	bl move_anim_task_del
_0812E4EA:
	pop {r4,r5}
	pop {r0}
	bx r0
	thumb_func_end sub_812E498

	thumb_func_start sub_812E4F0
sub_812E4F0: @ 812E4F0
	push {r4,lr}
	adds r4, r0, 0
	ldrh r0, [r4, 0x2E]
	movs r2, 0x2E
	ldrsh r1, [r4, r2]
	cmp r1, 0
	bne _0812E50E
	adds r0, r4, 0
	movs r1, 0
	bl sub_80787B0
	ldrh r0, [r4, 0x2E]
	adds r0, 0x1
	strh r0, [r4, 0x2E]
	b _0812E562
_0812E50E:
	adds r0, 0x1
	strh r0, [r4, 0x2E]
	cmp r1, 0x14
	ble _0812E562
	ldrh r0, [r4, 0x30]
	adds r0, 0xA0
	strh r0, [r4, 0x30]
	ldrh r0, [r4, 0x32]
	adds r0, 0x80
	strh r0, [r4, 0x32]
	ldr r0, _0812E53C @ =gUnknown_0202F7C8
	ldrb r0, [r0]
	bl battle_side_get_owner
	lsls r0, 24
	cmp r0, 0
	beq _0812E540
	ldrh r0, [r4, 0x30]
	lsls r0, 16
	asrs r0, 24
	negs r0, r0
	b _0812E546
	.align 2, 0
_0812E53C: .4byte gUnknown_0202F7C8
_0812E540:
	ldrh r0, [r4, 0x30]
	lsls r0, 16
	asrs r0, 24
_0812E546:
	strh r0, [r4, 0x24]
	ldrh r0, [r4, 0x32]
	lsls r0, 16
	asrs r0, 24
	ldrh r1, [r4, 0x26]
	adds r0, r1
	strh r0, [r4, 0x26]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x40
	ble _0812E562
	adds r0, r4, 0
	bl move_anim_8072740
_0812E562:
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end sub_812E4F0

	thumb_func_start sub_812E568
sub_812E568: @ 812E568
	push {r4,r5,lr}
	lsls r0, 24
	lsrs r2, r0, 24
	lsls r0, r2, 2
	adds r0, r2
	lsls r0, 3
	ldr r1, _0812E58C @ =gTasks
	adds r4, r0, r1
	ldr r5, _0812E590 @ =gBattleAnimArgs
	movs r1, 0x2
	ldrsh r0, [r5, r1]
	cmp r0, 0
	bne _0812E594
	adds r0, r2, 0
	bl move_anim_task_del
	b _0812E628
	.align 2, 0
_0812E58C: .4byte gTasks
_0812E590: .4byte gBattleAnimArgs
_0812E594:
	movs r1, 0x4
	ldrsh r0, [r5, r1]
	cmp r0, 0
	bge _0812E5A0
	movs r0, 0
	strh r0, [r5, 0x4]
_0812E5A0:
	movs r1, 0x4
	ldrsh r0, [r5, r1]
	cmp r0, 0x2
	ble _0812E5AC
	movs r0, 0x2
	strh r0, [r5, 0x4]
_0812E5AC:
	movs r0, 0
	strh r0, [r4, 0x8]
	strh r0, [r4, 0xA]
	strh r0, [r4, 0xC]
	movs r0, 0x4
	ldrsh r1, [r5, r0]
	lsls r1, 1
	movs r0, 0x8
	subs r0, r1
	strh r0, [r4, 0xE]
	movs r1, 0x4
	ldrsh r0, [r5, r1]
	lsls r0, 7
	movs r1, 0x80
	lsls r1, 1
	adds r0, r1
	strh r0, [r4, 0x10]
	ldrh r0, [r5, 0x4]
	adds r0, 0x2
	strh r0, [r4, 0x12]
	ldrh r0, [r5, 0x2]
	subs r0, 0x1
	strh r0, [r4, 0x14]
	ldrb r0, [r5]
	bl obj_id_for_side_relative_to_move
	lsls r0, 24
	lsrs r0, 24
	strh r0, [r4, 0x26]
	movs r1, 0
	ldrsh r0, [r5, r1]
	cmp r0, 0
	bne _0812E5F8
	ldr r0, _0812E5F4 @ =gUnknown_0202F7C8
	b _0812E5FA
	.align 2, 0
_0812E5F4: .4byte gUnknown_0202F7C8
_0812E5F8:
	ldr r0, _0812E630 @ =gUnknown_0202F7C9
_0812E5FA:
	ldrb r0, [r0]
	bl battle_side_get_owner
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _0812E618
	movs r1, 0x10
	ldrsh r0, [r4, r1]
	negs r0, r0
	strh r0, [r4, 0x10]
	movs r1, 0x12
	ldrsh r0, [r4, r1]
	negs r0, r0
	strh r0, [r4, 0x12]
_0812E618:
	ldrh r0, [r4, 0x26]
	lsls r0, 24
	lsrs r0, 24
	movs r1, 0
	bl sub_8078E70
	ldr r0, _0812E634 @ =sub_812E638
	str r0, [r4]
_0812E628:
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_0812E630: .4byte gUnknown_0202F7C9
_0812E634: .4byte sub_812E638
	thumb_func_end sub_812E568

	thumb_func_start sub_812E638
sub_812E638: @ 812E638
	push {r4-r6,lr}
	lsls r0, 24
	lsrs r5, r0, 24
	lsls r0, r5, 2
	adds r0, r5
	lsls r0, 3
	ldr r1, _0812E65C @ =gTasks
	adds r4, r0, r1
	movs r0, 0x8
	ldrsh r6, [r4, r0]
	cmp r6, 0x1
	beq _0812E6C0
	cmp r6, 0x1
	bgt _0812E660
	cmp r6, 0
	beq _0812E66C
	b _0812E798
	.align 2, 0
_0812E65C: .4byte gTasks
_0812E660:
	cmp r6, 0x2
	beq _0812E718
	cmp r6, 0x3
	bne _0812E66A
	b _0812E788
_0812E66A:
	b _0812E798
_0812E66C:
	ldr r2, _0812E6BC @ =gSprites
	movs r0, 0x26
	ldrsh r1, [r4, r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r2
	ldrh r1, [r4, 0x12]
	ldrh r2, [r0, 0x24]
	adds r1, r2
	strh r1, [r0, 0x24]
	ldrh r0, [r4, 0xC]
	ldrh r1, [r4, 0x10]
	subs r0, r1
	strh r0, [r4, 0xC]
	ldrh r0, [r4, 0x26]
	lsls r0, 24
	lsrs r0, 24
	movs r2, 0x80
	lsls r2, 1
	ldrh r3, [r4, 0xC]
	adds r1, r2, 0
	bl obj_id_set_rotscale
	ldrh r0, [r4, 0x26]
	lsls r0, 24
	lsrs r0, 24
	bl sub_8078F9C
	ldrh r0, [r4, 0xA]
	adds r0, 0x1
	strh r0, [r4, 0xA]
	lsls r0, 16
	asrs r0, 16
	movs r2, 0xE
	ldrsh r1, [r4, r2]
	cmp r0, r1
	blt _0812E798
	strh r6, [r4, 0xA]
	b _0812E780
	.align 2, 0
_0812E6BC: .4byte gSprites
_0812E6C0:
	ldr r2, _0812E714 @ =gSprites
	movs r0, 0x26
	ldrsh r1, [r4, r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r2
	ldrh r1, [r0, 0x24]
	ldrh r2, [r4, 0x12]
	subs r1, r2
	strh r1, [r0, 0x24]
	ldrh r0, [r4, 0x10]
	ldrh r1, [r4, 0xC]
	adds r0, r1
	strh r0, [r4, 0xC]
	ldrh r0, [r4, 0x26]
	lsls r0, 24
	lsrs r0, 24
	movs r2, 0x80
	lsls r2, 1
	ldrh r3, [r4, 0xC]
	adds r1, r2, 0
	bl obj_id_set_rotscale
	ldrh r0, [r4, 0x26]
	lsls r0, 24
	lsrs r0, 24
	bl sub_8078F9C
	ldrh r1, [r4, 0xA]
	adds r1, 0x1
	strh r1, [r4, 0xA]
	lsls r1, 16
	asrs r1, 16
	movs r2, 0xE
	ldrsh r0, [r4, r2]
	lsls r0, 1
	cmp r1, r0
	blt _0812E798
	movs r0, 0
	strh r0, [r4, 0xA]
	b _0812E780
	.align 2, 0
_0812E714: .4byte gSprites
_0812E718:
	ldr r2, _0812E77C @ =gSprites
	movs r0, 0x26
	ldrsh r1, [r4, r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r2
	ldrh r1, [r4, 0x12]
	ldrh r2, [r0, 0x24]
	adds r1, r2
	movs r5, 0
	strh r1, [r0, 0x24]
	ldrh r0, [r4, 0xC]
	ldrh r1, [r4, 0x10]
	subs r0, r1
	strh r0, [r4, 0xC]
	ldrh r0, [r4, 0x26]
	lsls r0, 24
	lsrs r0, 24
	movs r2, 0x80
	lsls r2, 1
	ldrh r3, [r4, 0xC]
	adds r1, r2, 0
	bl obj_id_set_rotscale
	ldrh r0, [r4, 0x26]
	lsls r0, 24
	lsrs r0, 24
	bl sub_8078F9C
	ldrh r0, [r4, 0xA]
	adds r0, 0x1
	strh r0, [r4, 0xA]
	lsls r0, 16
	asrs r0, 16
	movs r2, 0xE
	ldrsh r1, [r4, r2]
	cmp r0, r1
	blt _0812E798
	ldrh r1, [r4, 0x14]
	movs r2, 0x14
	ldrsh r0, [r4, r2]
	cmp r0, 0
	beq _0812E780
	subs r0, r1, 0x1
	strh r0, [r4, 0x14]
	strh r5, [r4, 0xA]
	strh r5, [r4, 0x8]
	b _0812E798
	.align 2, 0
_0812E77C: .4byte gSprites
_0812E780:
	ldrh r0, [r4, 0x8]
	adds r0, 0x1
	strh r0, [r4, 0x8]
	b _0812E798
_0812E788:
	ldrh r0, [r4, 0x26]
	lsls r0, 24
	lsrs r0, 24
	bl sub_8078F40
	adds r0, r5, 0
	bl move_anim_task_del
_0812E798:
	pop {r4-r6}
	pop {r0}
	bx r0
	thumb_func_end sub_812E638

	thumb_func_start sub_812E7A0
sub_812E7A0: @ 812E7A0
	push {r4,lr}
	adds r4, r0, 0
	ldr r0, _0812E7BC @ =gUnknown_0202F7C8
	ldrb r0, [r0]
	bl battle_side_get_owner
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0
	bne _0812E7C4
	strh r0, [r4, 0x20]
	ldr r1, _0812E7C0 @ =gBattleAnimArgs
	ldrh r0, [r1]
	b _0812E7CE
	.align 2, 0
_0812E7BC: .4byte gUnknown_0202F7C8
_0812E7C0: .4byte gBattleAnimArgs
_0812E7C4:
	movs r0, 0xF0
	strh r0, [r4, 0x20]
	ldr r1, _0812E7E8 @ =gBattleAnimArgs
	ldrh r0, [r1]
	subs r0, 0x1E
_0812E7CE:
	strh r0, [r4, 0x22]
	ldrh r0, [r1, 0x4]
	strh r0, [r4, 0x32]
	ldrb r1, [r1, 0x2]
	adds r0, r4, 0
	bl StartSpriteAnim
	ldr r0, _0812E7EC @ =sub_812E7F0
	str r0, [r4, 0x1C]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0812E7E8: .4byte gBattleAnimArgs
_0812E7EC: .4byte sub_812E7F0
	thumb_func_end sub_812E7A0

	thumb_func_start sub_812E7F0
sub_812E7F0: @ 812E7F0
	push {r4,lr}
	adds r4, r0, 0
	ldrh r0, [r4, 0x2E]
	adds r0, 0x3
	strh r0, [r4, 0x2E]
	ldr r0, _0812E830 @ =gUnknown_0202F7C8
	ldrb r0, [r0]
	bl battle_side_get_owner
	lsls r0, 24
	cmp r0, 0
	bne _0812E834
	ldrh r1, [r4, 0x20]
	adds r1, 0x5
	strh r1, [r4, 0x20]
	ldrh r0, [r4, 0x22]
	subs r0, 0x1
	strh r0, [r4, 0x22]
	lsls r1, 16
	asrs r1, 16
	cmp r1, 0xF0
	ble _0812E822
	adds r0, r4, 0
	bl move_anim_8072740
_0812E822:
	ldrh r1, [r4, 0x2E]
	movs r0, 0xFF
	ands r0, r1
	movs r1, 0x10
	bl Sin
	b _0812E858
	.align 2, 0
_0812E830: .4byte gUnknown_0202F7C8
_0812E834:
	ldrh r1, [r4, 0x20]
	subs r1, 0x5
	strh r1, [r4, 0x20]
	ldrh r0, [r4, 0x22]
	adds r0, 0x1
	strh r0, [r4, 0x22]
	lsls r1, 16
	cmp r1, 0
	bge _0812E84C
	adds r0, r4, 0
	bl move_anim_8072740
_0812E84C:
	ldrh r1, [r4, 0x2E]
	movs r0, 0xFF
	ands r0, r1
	movs r1, 0x10
	bl Cos
_0812E858:
	strh r0, [r4, 0x26]
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end sub_812E7F0

	thumb_func_start sub_812E860
sub_812E860: @ 812E860
	push {r4,lr}
	lsls r0, 24
	lsrs r0, 24
	lsls r4, r0, 2
	adds r4, r0
	lsls r4, 3
	ldr r0, _0812E8A8 @ =gTasks
	adds r4, r0
	movs r0, 0
	strh r0, [r4, 0x8]
	strh r0, [r4, 0xA]
	strh r0, [r4, 0xC]
	strh r0, [r4, 0xE]
	movs r0, 0x20
	strh r0, [r4, 0x20]
	movs r0, 0x40
	strh r0, [r4, 0x22]
	movs r0, 0x80
	lsls r0, 4
	strh r0, [r4, 0x24]
	ldr r0, _0812E8AC @ =gBattleAnimArgs
	ldrb r0, [r0]
	bl obj_id_for_side_relative_to_move
	lsls r0, 24
	lsrs r0, 24
	strh r0, [r4, 0x26]
	movs r1, 0
	bl sub_8078E70
	ldr r0, _0812E8B0 @ =sub_812E8B4
	str r0, [r4]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0812E8A8: .4byte gTasks
_0812E8AC: .4byte gBattleAnimArgs
_0812E8B0: .4byte sub_812E8B4
	thumb_func_end sub_812E860

	thumb_func_start sub_812E8B4
sub_812E8B4: @ 812E8B4
	push {r4-r7,lr}
	mov r7, r9
	mov r6, r8
	push {r6,r7}
	lsls r0, 24
	lsrs r4, r0, 24
	lsls r0, r4, 2
	adds r0, r4
	lsls r0, 3
	ldr r1, _0812E8E0 @ =gTasks
	adds r7, r0, r1
	movs r1, 0x8
	ldrsh r0, [r7, r1]
	mov r8, r0
	cmp r0, 0x1
	beq _0812E950
	cmp r0, 0x1
	bgt _0812E8E4
	cmp r0, 0
	beq _0812E8EC
	b _0812E9CA
	.align 2, 0
_0812E8E0: .4byte gTasks
_0812E8E4:
	mov r2, r8
	cmp r2, 0x2
	beq _0812E9B8
	b _0812E9CA
_0812E8EC:
	movs r3, 0x80
	lsls r3, 2
	adds r0, r3, 0
	ldrh r1, [r7, 0xC]
	adds r2, r0, r1
	strh r2, [r7, 0xC]
	lsls r0, r2, 16
	asrs r0, 16
	ldrh r3, [r7, 0x24]
	mov r8, r3
	movs r3, 0x24
	ldrsh r1, [r7, r3]
	cmp r0, r1
	blt _0812E9CA
	mov r0, r8
	subs r5, r0, r2
	lsls r5, 16
	asrs r5, 16
	adds r6, r1, 0
	lsls r6, 1
	adds r0, r5, 0
	adds r1, r6, 0
	bl __divsi3
	adds r4, r0, 0
	lsls r4, 16
	lsrs r4, 16
	adds r0, r5, 0
	adds r1, r6, 0
	bl __modsi3
	lsls r0, 16
	lsrs r0, 16
	lsls r4, 16
	asrs r4, 16
	movs r1, 0x1
	ands r4, r1
	cmp r4, 0
	bne _0812E944
	lsls r0, 16
	asrs r0, 16
	mov r2, r8
	subs r0, r2, r0
	b _0812E9A2
_0812E944:
	lsls r0, 16
	asrs r0, 16
	mov r3, r8
	subs r0, r3
	strh r0, [r7, 0xC]
	b _0812E9CA
_0812E950:
	ldr r1, _0812E9A8 @ =0xfffffe00
	adds r0, r1, 0
	ldrh r2, [r7, 0xC]
	adds r1, r0, r2
	strh r1, [r7, 0xC]
	movs r3, 0xC
	ldrsh r0, [r7, r3]
	movs r2, 0x24
	ldrsh r6, [r7, r2]
	cmn r0, r6
	bgt _0812E9CA
	ldrh r3, [r7, 0x24]
	mov r9, r3
	mov r0, r9
	subs r4, r0, r1
	lsls r4, 16
	asrs r4, 16
	lsls r6, 1
	adds r0, r4, 0
	adds r1, r6, 0
	bl __divsi3
	adds r5, r0, 0
	lsls r5, 16
	lsrs r5, 16
	adds r0, r4, 0
	adds r1, r6, 0
	bl __modsi3
	lsls r0, 16
	lsrs r2, r0, 16
	mov r1, r8
	ands r1, r5
	lsls r0, r1, 16
	asrs r1, r0, 16
	cmp r1, 0
	bne _0812E9AC
	lsls r0, r2, 16
	asrs r0, 16
	mov r2, r9
	subs r0, r2
_0812E9A2:
	strh r0, [r7, 0xC]
	strh r1, [r7, 0x8]
	b _0812E9CA
	.align 2, 0
_0812E9A8: .4byte 0xfffffe00
_0812E9AC:
	lsls r0, r2, 16
	asrs r0, 16
	mov r3, r9
	subs r0, r3, r0
	strh r0, [r7, 0xC]
	b _0812E9CA
_0812E9B8:
	ldrh r0, [r7, 0x26]
	lsls r0, 24
	lsrs r0, 24
	bl sub_8078F40
	adds r0, r4, 0
	bl move_anim_task_del
	b _0812EA40
_0812E9CA:
	ldrh r0, [r7, 0x26]
	lsls r0, 24
	lsrs r0, 24
	movs r2, 0x80
	lsls r2, 1
	ldrh r3, [r7, 0xC]
	adds r1, r2, 0
	bl obj_id_set_rotscale
	ldrh r0, [r7, 0x26]
	lsls r0, 24
	lsrs r0, 24
	bl sub_8078F9C
	ldr r2, _0812EA38 @ =gSprites
	movs r0, 0x26
	ldrsh r1, [r7, r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r1, r0, r2
	movs r2, 0xC
	ldrsh r0, [r7, r2]
	cmp r0, 0
	bge _0812E9FE
	adds r0, 0x3F
_0812E9FE:
	asrs r0, 6
	negs r0, r0
	strh r0, [r1, 0x24]
	ldrh r0, [r7, 0xA]
	adds r0, 0x1
	strh r0, [r7, 0xA]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x8
	ble _0812EA40
	ldrh r1, [r7, 0x20]
	movs r3, 0x20
	ldrsh r0, [r7, r3]
	cmp r0, 0
	beq _0812EA3C
	subs r0, r1, 0x1
	strh r0, [r7, 0x20]
	ldrh r0, [r7, 0x24]
	ldrh r1, [r7, 0x22]
	subs r0, r1
	strh r0, [r7, 0x24]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0xF
	bgt _0812EA40
	movs r0, 0x10
	strh r0, [r7, 0x24]
	b _0812EA40
	.align 2, 0
_0812EA38: .4byte gSprites
_0812EA3C:
	movs r0, 0x2
	strh r0, [r7, 0x8]
_0812EA40:
	pop {r3,r4}
	mov r8, r3
	mov r9, r4
	pop {r4-r7}
	pop {r0}
	bx r0
	thumb_func_end sub_812E8B4

	thumb_func_start sub_812EA4C
sub_812EA4C: @ 812EA4C
	push {r4-r6,lr}
	adds r5, r0, 0
	movs r1, 0x2E
	ldrsh r0, [r5, r1]
	cmp r0, 0
	bne _0812EAAC
	ldr r6, _0812EAA4 @ =gBattleAnimArgs
	movs r2, 0x4
	ldrsh r0, [r6, r2]
	cmp r0, 0
	bne _0812EA80
	ldr r4, _0812EAA8 @ =gUnknown_0202F7C8
	ldrb r0, [r4]
	movs r1, 0x2
	bl sub_8077ABC
	lsls r0, 24
	lsrs r0, 24
	strh r0, [r5, 0x20]
	ldrb r0, [r4]
	movs r1, 0x3
	bl sub_8077ABC
	lsls r0, 24
	lsrs r0, 24
	strh r0, [r5, 0x22]
_0812EA80:
	ldrh r0, [r6]
	ldrh r1, [r5, 0x20]
	adds r0, r1
	strh r0, [r5, 0x20]
	ldrh r1, [r6, 0x2]
	ldrh r2, [r5, 0x22]
	adds r0, r1, r2
	strh r0, [r5, 0x22]
	movs r0, 0x80
	strh r0, [r5, 0x30]
	movs r0, 0xC0
	lsls r0, 2
	strh r0, [r5, 0x32]
	strh r1, [r5, 0x34]
	ldrh r0, [r5, 0x2E]
	adds r0, 0x1
	strh r0, [r5, 0x2E]
	b _0812EB0A
	.align 2, 0
_0812EAA4: .4byte gBattleAnimArgs
_0812EAA8: .4byte gUnknown_0202F7C8
_0812EAAC:
	ldrh r1, [r5, 0x30]
	lsls r0, r1, 16
	asrs r0, 24
	strh r0, [r5, 0x24]
	ldrh r0, [r5, 0x32]
	lsls r0, 16
	asrs r0, 24
	ldrh r2, [r5, 0x26]
	adds r0, r2
	strh r0, [r5, 0x26]
	movs r2, 0x36
	ldrsh r0, [r5, r2]
	adds r4, r1, 0
	cmp r0, 0
	bne _0812EAEA
	movs r0, 0x26
	ldrsh r1, [r5, r0]
	movs r2, 0x34
	ldrsh r0, [r5, r2]
	cmn r1, r0
	ble _0812EAEA
	movs r0, 0x1
	strh r0, [r5, 0x36]
	movs r1, 0x32
	ldrsh r0, [r5, r1]
	negs r0, r0
	movs r1, 0x3
	bl __divsi3
	lsls r0, 1
	strh r0, [r5, 0x32]
_0812EAEA:
	adds r0, r4, 0
	adds r0, 0xC0
	strh r0, [r5, 0x30]
	ldrh r0, [r5, 0x32]
	adds r0, 0x80
	strh r0, [r5, 0x32]
	adds r0, r5, 0
	adds r0, 0x3F
	ldrb r1, [r0]
	movs r0, 0x10
	ands r0, r1
	cmp r0, 0
	beq _0812EB0A
	adds r0, r5, 0
	bl move_anim_8072740
_0812EB0A:
	pop {r4-r6}
	pop {r0}
	bx r0
	thumb_func_end sub_812EA4C

	thumb_func_start sub_812EB10
sub_812EB10: @ 812EB10
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	lsls r0, 24
	lsrs r0, 24
	adds r7, r0, 0
	ldr r1, _0812EB40 @ =gTasks
	lsls r0, r7, 2
	adds r0, r7
	lsls r0, 3
	adds r2, r0, r1
	movs r1, 0x8
	ldrsh r0, [r2, r1]
	cmp r0, 0
	bne _0812EC1C
	ldr r0, _0812EB44 @ =gBattleAnimArgs
	movs r3, 0
	ldrsh r1, [r0, r3]
	mov r8, r0
	cmp r1, 0
	bne _0812EB4C
	ldr r0, _0812EB48 @ =gUnknown_0202F7C8
	b _0812EB4E
	.align 2, 0
_0812EB40: .4byte gTasks
_0812EB44: .4byte gBattleAnimArgs
_0812EB48: .4byte gUnknown_0202F7C8
_0812EB4C:
	ldr r0, _0812EB88 @ =gUnknown_0202F7C9
_0812EB4E:
	ldrb r0, [r0]
	strh r0, [r2, 0x1E]
	mov r1, r8
	ldrb r0, [r1]
	bl obj_id_for_side_relative_to_move
	lsls r0, 24
	lsrs r5, r0, 24
	ldr r1, _0812EB8C @ =gTasks
	lsls r4, r7, 2
	adds r0, r4, r7
	lsls r0, 3
	adds r6, r0, r1
	strh r5, [r6, 0x1C]
	adds r0, r5, 0
	movs r1, 0
	bl sub_8078E70
	mov r2, r8
	movs r3, 0x2
	ldrsh r0, [r2, r3]
	cmp r0, 0x1
	beq _0812EBB0
	cmp r0, 0x1
	bgt _0812EB90
	cmp r0, 0
	beq _0812EB98
	lsls r2, r5, 4
	b _0812EBF8
	.align 2, 0
_0812EB88: .4byte gUnknown_0202F7C9
_0812EB8C: .4byte gTasks
_0812EB90:
	cmp r0, 0x2
	beq _0812EBBA
	lsls r2, r5, 4
	b _0812EBF8
_0812EB98:
	movs r2, 0xA0
	lsls r2, 1
	adds r0, r5, 0
	movs r1, 0xE0
	movs r3, 0
	bl obj_id_set_rotscale
	adds r0, r5, 0
	bl sub_8079A64
	lsls r2, r5, 4
	b _0812EBF8
_0812EBB0:
	movs r2, 0x98
	lsls r2, 1
	movs r3, 0xF0
	lsls r3, 4
	b _0812EBC2
_0812EBBA:
	movs r2, 0x98
	lsls r2, 1
	movs r3, 0xF1
	lsls r3, 8
_0812EBC2:
	adds r0, r5, 0
	movs r1, 0xD0
	bl obj_id_set_rotscale
	adds r0, r5, 0
	bl sub_8079A64
	bl sub_8076BE0
	lsls r0, 24
	cmp r0, 0
	bne _0812EBE8
	ldrb r0, [r6, 0x1E]
	bl battle_side_get_owner
	lsls r0, 24
	lsls r2, r5, 4
	cmp r0, 0
	bne _0812EBF8
_0812EBE8:
	ldr r0, _0812EC14 @ =gSprites
	lsls r2, r5, 4
	adds r1, r2, r5
	lsls r1, 2
	adds r1, r0
	ldrh r0, [r1, 0x26]
	adds r0, 0x10
	strh r0, [r1, 0x26]
_0812EBF8:
	ldr r1, _0812EC14 @ =gSprites
	adds r0, r2, r5
	lsls r0, 2
	adds r0, r1
	movs r1, 0x2
	strh r1, [r0, 0x24]
	ldr r0, _0812EC18 @ =gTasks
	adds r1, r4, r7
	lsls r1, 3
	adds r1, r0
	ldrh r0, [r1, 0x8]
	adds r0, 0x1
	strh r0, [r1, 0x8]
	b _0812EC68
	.align 2, 0
_0812EC14: .4byte gSprites
_0812EC18: .4byte gTasks
_0812EC1C:
	ldrb r5, [r2, 0x1C]
	ldrh r0, [r2, 0xC]
	adds r0, 0x1
	movs r4, 0
	strh r0, [r2, 0xC]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x3
	bne _0812EC40
	strh r4, [r2, 0xC]
	ldr r0, _0812EC74 @ =gSprites
	lsls r1, r5, 4
	adds r1, r5
	lsls r1, 2
	adds r1, r0
	ldrh r0, [r1, 0x24]
	negs r0, r0
	strh r0, [r1, 0x24]
_0812EC40:
	ldrh r0, [r2, 0xA]
	adds r0, 0x1
	strh r0, [r2, 0xA]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0xD
	bne _0812EC68
	adds r0, r5, 0
	bl sub_8078F40
	ldr r1, _0812EC74 @ =gSprites
	lsls r0, r5, 4
	adds r0, r5
	lsls r0, 2
	adds r0, r1
	strh r4, [r0, 0x24]
	strh r4, [r0, 0x26]
	adds r0, r7, 0
	bl move_anim_task_del
_0812EC68:
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_0812EC74: .4byte gSprites
	thumb_func_end sub_812EB10

	thumb_func_start sub_812EC78
sub_812EC78: @ 812EC78
	push {r4,r5,lr}
	adds r4, r0, 0
	bl Random
	lsls r0, 16
	lsrs r0, 16
	movs r1, 0xC
	bl __umodsi3
	lsls r0, 24
	lsrs r0, 24
	ldrh r2, [r4, 0x4]
	lsls r1, r2, 22
	lsrs r1, 22
	adds r1, r0
	ldr r3, _0812ECC4 @ =0x000003ff
	adds r0, r3, 0
	ands r1, r0
	ldr r0, _0812ECC8 @ =0xfffffc00
	ands r0, r2
	orrs r0, r1
	strh r0, [r4, 0x4]
	bl Random
	ldr r5, _0812ECCC @ =0x000001ff
	ands r5, r0
	bl Random
	movs r1, 0xFF
	ands r1, r0
	movs r0, 0x1
	ands r0, r5
	cmp r0, 0
	beq _0812ECD0
	movs r2, 0xBC
	lsls r2, 3
	adds r0, r5, r2
	b _0812ECD8
	.align 2, 0
_0812ECC4: .4byte 0x000003ff
_0812ECC8: .4byte 0xfffffc00
_0812ECCC: .4byte 0x000001ff
_0812ECD0:
	movs r3, 0xBC
	lsls r3, 3
	adds r0, r3, 0
	subs r0, r5
_0812ECD8:
	strh r0, [r4, 0x2E]
	movs r0, 0x1
	ands r0, r1
	cmp r0, 0
	beq _0812ECEA
	movs r2, 0x90
	lsls r2, 3
	adds r0, r1, r2
	b _0812ECF2
_0812ECEA:
	movs r3, 0x90
	lsls r3, 3
	adds r0, r3, 0
	subs r0, r1
_0812ECF2:
	strh r0, [r4, 0x30]
	ldr r0, _0812ED04 @ =gBattleAnimArgs
	ldrh r0, [r0]
	strh r0, [r4, 0x32]
	lsls r0, 16
	cmp r0, 0
	bne _0812ED0C
	ldr r0, _0812ED08 @ =0x0000fff8
	b _0812ED0E
	.align 2, 0
_0812ED04: .4byte gBattleAnimArgs
_0812ED08: .4byte 0x0000fff8
_0812ED0C:
	movs r0, 0xF8
_0812ED0E:
	strh r0, [r4, 0x20]
	movs r0, 0x68
	strh r0, [r4, 0x22]
	ldr r0, _0812ED20 @ =sub_812ED24
	str r0, [r4, 0x1C]
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_0812ED20: .4byte sub_812ED24
	thumb_func_end sub_812EC78

	thumb_func_start sub_812ED24
sub_812ED24: @ 812ED24
	push {r4,lr}
	adds r4, r0, 0
	movs r1, 0x32
	ldrsh r0, [r4, r1]
	cmp r0, 0
	bne _0812ED3C
	ldrh r3, [r4, 0x2E]
	lsls r0, r3, 16
	asrs r0, 24
	ldrh r1, [r4, 0x24]
	adds r0, r1
	b _0812ED46
_0812ED3C:
	ldrh r3, [r4, 0x2E]
	lsls r1, r3, 16
	asrs r1, 24
	ldrh r0, [r4, 0x24]
	subs r0, r1
_0812ED46:
	strh r0, [r4, 0x24]
	ldrh r2, [r4, 0x30]
	lsls r1, r2, 16
	asrs r1, 24
	ldrh r0, [r4, 0x26]
	subs r0, r1
	strh r0, [r4, 0x26]
	adds r0, r3, 0
	subs r0, 0x16
	strh r0, [r4, 0x2E]
	adds r1, r2, 0
	subs r1, 0x30
	strh r1, [r4, 0x30]
	lsls r0, 16
	cmp r0, 0
	bge _0812ED6A
	movs r0, 0
	strh r0, [r4, 0x2E]
_0812ED6A:
	ldrh r0, [r4, 0x34]
	adds r0, 0x1
	strh r0, [r4, 0x34]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x1F
	bne _0812ED7E
	adds r0, r4, 0
	bl move_anim_8072740
_0812ED7E:
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end sub_812ED24

	thumb_func_start sub_812ED84
sub_812ED84: @ 812ED84
	push {r4,lr}
	adds r4, r0, 0
	ldr r1, _0812EDE4 @ =REG_WINOUT
	ldr r2, _0812EDE8 @ =0x00001f3f
	adds r0, r2, 0
	strh r0, [r1]
	movs r2, 0x80
	lsls r2, 19
	ldrh r0, [r2]
	movs r3, 0x80
	lsls r3, 8
	adds r1, r3, 0
	orrs r0, r1
	strh r0, [r2]
	ldr r0, _0812EDEC @ =gUnknown_030042C4
	movs r1, 0
	strh r1, [r0]
	ldr r0, _0812EDF0 @ =gUnknown_03004240
	strh r1, [r0]
	ldr r0, _0812EDF4 @ =REG_WIN0H
	strh r1, [r0]
	adds r0, 0x4
	strh r1, [r0]
	ldr r0, _0812EDF8 @ =gBattleAnimArgs
	ldrh r0, [r0, 0x4]
	strh r0, [r4, 0x2E]
	adds r0, r4, 0
	movs r1, 0
	bl sub_8078764
	ldrb r1, [r4, 0x1]
	movs r0, 0xD
	negs r0, r0
	ands r0, r1
	movs r1, 0x8
	orrs r0, r1
	strb r0, [r4, 0x1]
	adds r2, r4, 0
	adds r2, 0x3E
	ldrb r0, [r2]
	movs r1, 0x4
	orrs r0, r1
	strb r0, [r2]
	ldr r0, _0812EDFC @ =sub_812EE00
	str r0, [r4, 0x1C]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0812EDE4: .4byte REG_WINOUT
_0812EDE8: .4byte 0x00001f3f
_0812EDEC: .4byte gUnknown_030042C4
_0812EDF0: .4byte gUnknown_03004240
_0812EDF4: .4byte REG_WIN0H
_0812EDF8: .4byte gBattleAnimArgs
_0812EDFC: .4byte sub_812EE00
	thumb_func_end sub_812ED84

	thumb_func_start sub_812EE00
sub_812EE00: @ 812EE00
	push {r4,lr}
	adds r4, r0, 0
	movs r1, 0x30
	ldrsh r0, [r4, r1]
	cmp r0, 0x1
	beq _0812EE3E
	cmp r0, 0x1
	bgt _0812EE16
	cmp r0, 0
	beq _0812EE20
	b _0812EE94
_0812EE16:
	cmp r0, 0x2
	beq _0812EE54
	cmp r0, 0x3
	beq _0812EE76
	b _0812EE94
_0812EE20:
	adds r2, r4, 0
	adds r2, 0x3E
	ldrb r1, [r2]
	movs r0, 0x5
	negs r0, r0
	ands r0, r1
	strb r0, [r2]
	adds r0, r4, 0
	adds r0, 0x3F
	ldrb r1, [r0]
	movs r0, 0x20
	ands r0, r1
	cmp r0, 0
	beq _0812EE94
	b _0812EE6E
_0812EE3E:
	ldrh r0, [r4, 0x2E]
	subs r0, 0x1
	strh r0, [r4, 0x2E]
	lsls r0, 16
	cmp r0, 0
	bne _0812EE94
	adds r0, r4, 0
	movs r1, 0x1
	bl ChangeSpriteAffineAnim
	b _0812EE6E
_0812EE54:
	adds r0, r4, 0
	adds r0, 0x3F
	ldrb r1, [r0]
	movs r0, 0x20
	ands r0, r1
	cmp r0, 0
	beq _0812EE94
	adds r2, r4, 0
	adds r2, 0x3E
	ldrb r0, [r2]
	movs r1, 0x4
	orrs r0, r1
	strb r0, [r2]
_0812EE6E:
	ldrh r0, [r4, 0x30]
	adds r0, 0x1
	strh r0, [r4, 0x30]
	b _0812EE94
_0812EE76:
	ldr r1, _0812EE9C @ =REG_WINOUT
	ldr r2, _0812EEA0 @ =0x00003f3f
	adds r0, r2, 0
	strh r0, [r1]
	movs r2, 0x80
	lsls r2, 19
	ldrh r0, [r2]
	movs r3, 0x80
	lsls r3, 8
	adds r1, r3, 0
	eors r0, r1
	strh r0, [r2]
	adds r0, r4, 0
	bl move_anim_8072740
_0812EE94:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0812EE9C: .4byte REG_WINOUT
_0812EEA0: .4byte 0x00003f3f
	thumb_func_end sub_812EE00

	thumb_func_start sub_812EEA4
sub_812EEA4: @ 812EEA4
	push {r4,r5,lr}
	adds r4, r0, 0
	ldr r5, _0812EEE0 @ =gUnknown_0202F7C8
	ldrb r0, [r5]
	movs r1, 0x2
	bl sub_8077ABC
	lsls r0, 24
	lsrs r0, 24
	strh r0, [r4, 0x20]
	ldrb r0, [r5]
	movs r1, 0x3
	bl sub_8077ABC
	lsls r0, 24
	lsrs r0, 24
	strh r0, [r4, 0x22]
	ldr r1, _0812EEE4 @ =gBattleAnimArgs
	ldrh r0, [r1]
	strh r0, [r4, 0x2E]
	ldrh r0, [r1, 0x2]
	strh r0, [r4, 0x30]
	ldr r1, _0812EEE8 @ =sub_812EEEC
	str r1, [r4, 0x1C]
	adds r0, r4, 0
	bl _call_via_r1
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_0812EEE0: .4byte gUnknown_0202F7C8
_0812EEE4: .4byte gBattleAnimArgs
_0812EEE8: .4byte sub_812EEEC
	thumb_func_end sub_812EEA4

	thumb_func_start sub_812EEEC
sub_812EEEC: @ 812EEEC
	push {r4,lr}
	adds r4, r0, 0
	movs r1, 0x30
	ldrsh r0, [r4, r1]
	ldrh r1, [r4, 0x32]
	lsls r1, 16
	asrs r1, 24
	bl Sin
	strh r0, [r4, 0x24]
	movs r2, 0x30
	ldrsh r0, [r4, r2]
	ldrh r1, [r4, 0x34]
	lsls r1, 16
	asrs r1, 24
	bl Cos
	strh r0, [r4, 0x26]
	ldrh r0, [r4, 0x30]
	adds r0, 0x9
	movs r1, 0xFF
	ands r0, r1
	strh r0, [r4, 0x30]
	lsls r1, r0, 16
	cmp r0, 0x3F
	bls _0812EF26
	asrs r0, r1, 16
	cmp r0, 0xC3
	ble _0812EF38
_0812EF26:
	ldr r0, _0812EF34 @ =gUnknown_0202F7C8
	ldrb r0, [r0]
	bl sub_8079E90
	subs r0, 0x1
	b _0812EF42
	.align 2, 0
_0812EF34: .4byte gUnknown_0202F7C8
_0812EF38:
	ldr r0, _0812EF84 @ =gUnknown_0202F7C8
	ldrb r0, [r0]
	bl sub_8079E90
	adds r0, 0x1
_0812EF42:
	adds r1, r4, 0
	adds r1, 0x43
	strb r0, [r1]
	movs r3, 0x38
	ldrsh r2, [r4, r3]
	cmp r2, 0
	bne _0812EF88
	movs r1, 0x80
	lsls r1, 3
	adds r0, r1, 0
	ldrh r3, [r4, 0x32]
	adds r0, r3
	strh r0, [r4, 0x32]
	movs r1, 0x80
	lsls r1, 1
	adds r0, r1, 0
	ldrh r3, [r4, 0x34]
	adds r0, r3
	strh r0, [r4, 0x34]
	ldrh r0, [r4, 0x36]
	adds r0, 0x1
	strh r0, [r4, 0x36]
	lsls r0, 16
	asrs r0, 16
	movs r3, 0x2E
	ldrsh r1, [r4, r3]
	cmp r0, r1
	bne _0812EFB8
	strh r2, [r4, 0x36]
	movs r0, 0x1
	strh r0, [r4, 0x38]
	b _0812EFB8
	.align 2, 0
_0812EF84: .4byte gUnknown_0202F7C8
_0812EF88:
	cmp r2, 0x1
	bne _0812EFB8
	ldr r1, _0812EFC0 @ =0xfffffc00
	adds r0, r1, 0
	ldrh r2, [r4, 0x32]
	adds r0, r2
	strh r0, [r4, 0x32]
	ldr r3, _0812EFC4 @ =0xffffff00
	adds r0, r3, 0
	ldrh r1, [r4, 0x34]
	adds r0, r1
	strh r0, [r4, 0x34]
	ldrh r0, [r4, 0x36]
	adds r0, 0x1
	strh r0, [r4, 0x36]
	lsls r0, 16
	asrs r0, 16
	movs r2, 0x2E
	ldrsh r1, [r4, r2]
	cmp r0, r1
	bne _0812EFB8
	adds r0, r4, 0
	bl move_anim_8072740
_0812EFB8:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0812EFC0: .4byte 0xfffffc00
_0812EFC4: .4byte 0xffffff00
	thumb_func_end sub_812EEEC

	thumb_func_start sub_812EFC8
sub_812EFC8: @ 812EFC8
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	sub sp, 0x18
	lsls r0, 24
	lsrs r0, 24
	str r0, [sp, 0x10]
	movs r0, 0
	bl obj_id_for_side_relative_to_move
	bl sub_8076BE0
	lsls r0, 24
	cmp r0, 0
	beq _0812F004
	movs r0, 0x1
	str r0, [sp, 0x14]
	ldr r0, _0812F000 @ =0x02019348
	ldr r1, [r0, 0x10]
	mov r9, r1
	ldr r2, [r0, 0xC]
	mov r8, r2
	ldrh r6, [r0, 0x2]
	movs r3, 0x14
	b _0812F13C
	.align 2, 0
_0812F000: .4byte 0x02019348
_0812F004:
	ldr r0, _0812F070 @ =gUnknown_0202F7C8
	ldrb r0, [r0]
	bl battle_side_get_owner
	lsls r0, 24
	cmp r0, 0
	beq _0812F0AC
	movs r0, 0
	str r0, [sp, 0x14]
	ldr r6, _0812F074 @ =gUnknown_02024A6A
	ldr r4, _0812F078 @ =gUnknown_0202F7C9
	ldrb r0, [r4]
	lsls r0, 1
	adds r0, r6
	ldrh r0, [r0]
	movs r5, 0x64
	muls r0, r5
	ldr r7, _0812F07C @ =gPlayerParty
	adds r0, r7
	movs r1, 0
	bl GetMonData
	mov r9, r0
	ldrb r0, [r4]
	lsls r0, 1
	adds r0, r6
	ldrh r0, [r0]
	muls r0, r5
	adds r0, r7
	movs r1, 0x1
	bl GetMonData
	mov r8, r0
	ldrb r2, [r4]
	lsls r1, r2, 2
	ldr r0, _0812F080 @ =0x02017800
	adds r1, r0
	ldrh r0, [r1, 0x2]
	cmp r0, 0
	bne _0812F0A4
	adds r0, r2, 0
	bl battle_side_get_owner
	lsls r0, 24
	cmp r0, 0
	bne _0812F084
	ldrb r0, [r4]
	lsls r0, 1
	adds r0, r6
	ldrh r0, [r0]
	muls r0, r5
	adds r0, r7
	b _0812F092
	.align 2, 0
_0812F070: .4byte gUnknown_0202F7C8
_0812F074: .4byte gUnknown_02024A6A
_0812F078: .4byte gUnknown_0202F7C9
_0812F07C: .4byte gPlayerParty
_0812F080: .4byte 0x02017800
_0812F084:
	ldrb r0, [r4]
	lsls r0, 1
	adds r0, r6
	ldrh r0, [r0]
	muls r0, r5
	ldr r1, _0812F0A0 @ =gEnemyParty
	adds r0, r1
_0812F092:
	movs r1, 0xB
	bl GetMonData
	lsls r0, 16
	lsrs r6, r0, 16
	b _0812F0A6
	.align 2, 0
_0812F0A0: .4byte gEnemyParty
_0812F0A4:
	ldrh r6, [r1, 0x2]
_0812F0A6:
	movs r1, 0x14
	mov r10, r1
	b _0812F13E
_0812F0AC:
	movs r2, 0x1
	str r2, [sp, 0x14]
	ldr r6, _0812F10C @ =gUnknown_02024A6A
	ldr r4, _0812F110 @ =gUnknown_0202F7C9
	ldrb r0, [r4]
	lsls r0, 1
	adds r0, r6
	ldrh r0, [r0]
	movs r5, 0x64
	muls r0, r5
	ldr r7, _0812F114 @ =gEnemyParty
	adds r0, r7
	movs r1, 0
	bl GetMonData
	mov r9, r0
	ldrb r0, [r4]
	lsls r0, 1
	adds r0, r6
	ldrh r0, [r0]
	muls r0, r5
	adds r0, r7
	movs r1, 0x1
	bl GetMonData
	mov r8, r0
	ldrb r2, [r4]
	lsls r1, r2, 2
	ldr r0, _0812F118 @ =0x02017800
	adds r1, r0
	ldrh r0, [r1, 0x2]
	cmp r0, 0
	bne _0812F138
	adds r0, r2, 0
	bl battle_side_get_owner
	lsls r0, 24
	cmp r0, 0
	bne _0812F120
	ldrb r0, [r4]
	lsls r0, 1
	adds r0, r6
	ldrh r0, [r0]
	muls r0, r5
	ldr r1, _0812F11C @ =gPlayerParty
	adds r0, r1
	b _0812F12C
	.align 2, 0
_0812F10C: .4byte gUnknown_02024A6A
_0812F110: .4byte gUnknown_0202F7C9
_0812F114: .4byte gEnemyParty
_0812F118: .4byte 0x02017800
_0812F11C: .4byte gPlayerParty
_0812F120:
	ldrb r0, [r4]
	lsls r0, 1
	adds r0, r6
	ldrh r0, [r0]
	muls r0, r5
	adds r0, r7
_0812F12C:
	movs r1, 0xB
	bl GetMonData
	lsls r0, 16
	lsrs r6, r0, 16
	b _0812F13A
_0812F138:
	ldrh r6, [r1, 0x2]
_0812F13A:
	ldr r3, _0812F218 @ =0x0000ffec
_0812F13C:
	mov r10, r3
_0812F13E:
	ldr r0, _0812F21C @ =gUnknown_0202F7C8
	ldrb r0, [r0]
	bl sub_8079ED4
	lsls r0, 24
	lsrs r7, r0, 24
	ldr r5, _0812F21C @ =gUnknown_0202F7C8
	ldrb r0, [r5]
	movs r1, 0
	bl sub_8077ABC
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	ldrb r0, [r5]
	movs r1, 0x1
	bl sub_8077ABC
	lsls r0, 24
	mov r2, r10
	lsls r1, r2, 16
	asrs r1, 16
	adds r4, r1
	lsls r4, 16
	asrs r4, 16
	lsrs r0, 24
	str r0, [sp]
	movs r0, 0x5
	str r0, [sp, 0x4]
	mov r3, r9
	str r3, [sp, 0x8]
	mov r0, r8
	str r0, [sp, 0xC]
	adds r0, r6, 0
	ldr r1, [sp, 0x14]
	movs r2, 0
	adds r3, r4, 0
	bl sub_8079F44
	adds r6, r0, 0
	lsls r6, 24
	lsrs r6, 24
	ldr r0, _0812F220 @ =gSprites
	lsls r5, r6, 4
	adds r5, r6
	lsls r5, 2
	adds r5, r0
	movs r0, 0x3
	ands r7, r0
	lsls r7, 2
	mov r8, r7
	ldrb r0, [r5, 0x5]
	movs r4, 0xD
	negs r4, r4
	adds r1, r4, 0
	ands r1, r0
	mov r2, r8
	orrs r1, r2
	strb r1, [r5, 0x5]
	ldrb r2, [r5, 0x1]
	adds r0, r4, 0
	ands r0, r2
	movs r2, 0x4
	orrs r0, r2
	strb r0, [r5, 0x1]
	ldr r0, _0812F224 @ =0x00007fff
	lsrs r1, 4
	lsls r1, 4
	movs r3, 0x80
	lsls r3, 1
	adds r2, r3, 0
	orrs r1, r2
	movs r2, 0x20
	bl FillPalette
	ldrb r0, [r5, 0x5]
	ands r4, r0
	mov r0, r8
	orrs r4, r0
	strb r4, [r5, 0x5]
	ldr r1, _0812F228 @ =REG_BLDCNT
	movs r2, 0xFD
	lsls r2, 6
	adds r0, r2, 0
	strh r0, [r1]
	ldr r3, _0812F22C @ =REG_BLDALPHA
	ldr r0, _0812F230 @ =gTasks
	ldr r2, [sp, 0x10]
	lsls r1, r2, 2
	adds r1, r2
	lsls r1, 3
	adds r1, r0
	ldrh r2, [r1, 0xA]
	movs r0, 0x10
	subs r0, r2
	lsls r0, 8
	orrs r0, r2
	strh r0, [r3]
	strh r6, [r1, 0x8]
	ldr r0, _0812F234 @ =sub_812F238
	str r0, [r1]
	add sp, 0x18
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_0812F218: .4byte 0x0000ffec
_0812F21C: .4byte gUnknown_0202F7C8
_0812F220: .4byte gSprites
_0812F224: .4byte 0x00007fff
_0812F228: .4byte REG_BLDCNT
_0812F22C: .4byte REG_BLDALPHA
_0812F230: .4byte gTasks
_0812F234: .4byte sub_812F238
	thumb_func_end sub_812EFC8

	thumb_func_start sub_812F238
sub_812F238: @ 812F238
	push {lr}
	lsls r0, 24
	lsrs r0, 24
	ldr r2, _0812F284 @ =gTasks
	lsls r1, r0, 2
	adds r1, r0
	lsls r1, 3
	adds r3, r1, r2
	ldrh r0, [r3, 0x1C]
	adds r1, r0, 0x1
	strh r1, [r3, 0x1C]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x1
	ble _0812F280
	movs r0, 0
	strh r0, [r3, 0x1C]
	ldrh r1, [r3, 0xA]
	adds r1, 0x1
	strh r1, [r3, 0xA]
	ldr r2, _0812F288 @ =REG_BLDALPHA
	movs r0, 0x10
	subs r0, r1
	lsls r0, 8
	orrs r1, r0
	strh r1, [r2]
	movs r1, 0xA
	ldrsh r0, [r3, r1]
	cmp r0, 0xA
	bne _0812F280
	movs r0, 0x80
	lsls r0, 1
	strh r0, [r3, 0x1C]
	strh r0, [r3, 0x1E]
	ldr r0, _0812F28C @ =sub_812F290
	str r0, [r3]
_0812F280:
	pop {r0}
	bx r0
	.align 2, 0
_0812F284: .4byte gTasks
_0812F288: .4byte REG_BLDALPHA
_0812F28C: .4byte sub_812F290
	thumb_func_end sub_812F238

	thumb_func_start sub_812F290
sub_812F290: @ 812F290
	push {r4-r6,lr}
	sub sp, 0x4
	lsls r0, 24
	lsrs r0, 24
	ldr r2, _0812F308 @ =gTasks
	lsls r1, r0, 2
	adds r1, r0
	lsls r1, 3
	adds r5, r1, r2
	ldrb r2, [r5, 0x8]
	ldrh r0, [r5, 0x1C]
	subs r0, 0x10
	movs r4, 0
	strh r0, [r5, 0x1C]
	ldrh r0, [r5, 0x1E]
	adds r0, 0x80
	strh r0, [r5, 0x1E]
	ldr r1, _0812F30C @ =gSprites
	lsls r0, r2, 4
	adds r0, r2
	lsls r0, 2
	adds r6, r0, r1
	ldrb r2, [r6, 0x1]
	lsls r1, r2, 30
	lsrs r1, 30
	movs r0, 0x2
	orrs r1, r0
	subs r0, 0x6
	ands r0, r2
	orrs r0, r1
	strb r0, [r6, 0x1]
	movs r0, 0x1C
	ldrsh r2, [r5, r0]
	movs r0, 0x1E
	ldrsh r3, [r5, r0]
	str r4, [sp]
	adds r0, r6, 0
	movs r1, 0x1
	bl sub_8078FDC
	ldrh r0, [r5, 0x20]
	adds r0, 0x1
	strh r0, [r5, 0x20]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x9
	bne _0812F2FE
	adds r0, r6, 0
	bl sub_8079098
	adds r0, r6, 0
	bl sub_807A0F4
	ldr r0, _0812F310 @ =sub_8078634
	str r0, [r5]
_0812F2FE:
	add sp, 0x4
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_0812F308: .4byte gTasks
_0812F30C: .4byte gSprites
_0812F310: .4byte sub_8078634
	thumb_func_end sub_812F290

	thumb_func_start sub_812F314
sub_812F314: @ 812F314
	push {r4-r7,lr}
	sub sp, 0xC
	lsls r0, 24
	lsrs r0, 24
	lsls r1, r0, 2
	adds r1, r0
	lsls r1, 3
	ldr r0, _0812F334 @ =gTasks
	adds r4, r1, r0
	ldr r0, _0812F338 @ =gBattleAnimArgs
	movs r1, 0
	ldrsh r0, [r0, r1]
	cmp r0, 0
	bne _0812F340
	ldr r0, _0812F33C @ =gUnknown_0202F7C8
	b _0812F342
	.align 2, 0
_0812F334: .4byte gTasks
_0812F338: .4byte gBattleAnimArgs
_0812F33C: .4byte gUnknown_0202F7C8
_0812F340:
	ldr r0, _0812F3C0 @ =gUnknown_0202F7C9
_0812F342:
	ldrb r5, [r0]
	movs r6, 0
	strh r6, [r4, 0x8]
	strh r6, [r4, 0xA]
	strh r6, [r4, 0xC]
	movs r0, 0x10
	strh r0, [r4, 0xE]
	strh r6, [r4, 0x10]
	strh r5, [r4, 0x12]
	movs r0, 0x20
	strh r0, [r4, 0x14]
	strh r6, [r4, 0x16]
	movs r0, 0x18
	strh r0, [r4, 0x18]
	adds r0, r5, 0
	bl battle_side_get_owner
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _0812F374
	movs r2, 0x18
	ldrsh r0, [r4, r2]
	negs r0, r0
	strh r0, [r4, 0x18]
_0812F374:
	adds r0, r5, 0
	bl sub_8077FC0
	lsls r0, 24
	lsrs r0, 24
	subs r0, 0x22
	strh r0, [r4, 0x22]
	cmp r0, 0
	bge _0812F388
	strh r6, [r4, 0x22]
_0812F388:
	ldrh r0, [r4, 0x22]
	adds r0, 0x42
	strh r0, [r4, 0x24]
	ldr r0, _0812F3C4 @ =gBattleAnimArgs
	ldrb r0, [r0]
	bl obj_id_for_side_relative_to_move
	lsls r0, 24
	lsrs r0, 24
	strh r0, [r4, 0x26]
	adds r0, r5, 0
	bl battle_get_per_side_status_permutated
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _0812F3DC
	ldr r0, _0812F3C8 @ =REG_BG1HOFS
	str r0, [sp]
	ldr r1, _0812F3CC @ =REG_BLDCNT
	ldr r2, _0812F3D0 @ =0x00003f42
	adds r0, r2, 0
	strh r0, [r1]
	ldr r0, _0812F3D4 @ =gUnknown_030042C0
	ldrh r5, [r0]
	ldr r0, _0812F3D8 @ =gUnknown_030041B4
	b _0812F3EE
	.align 2, 0
_0812F3C0: .4byte gUnknown_0202F7C9
_0812F3C4: .4byte gBattleAnimArgs
_0812F3C8: .4byte REG_BG1HOFS
_0812F3CC: .4byte REG_BLDCNT
_0812F3D0: .4byte 0x00003f42
_0812F3D4: .4byte gUnknown_030042C0
_0812F3D8: .4byte gUnknown_030041B4
_0812F3DC:
	ldr r0, _0812F454 @ =REG_BG2HOFS
	str r0, [sp]
	ldr r1, _0812F458 @ =REG_BLDCNT
	ldr r2, _0812F45C @ =0x00003f44
	adds r0, r2, 0
	strh r0, [r1]
	ldr r0, _0812F460 @ =gUnknown_03004288
	ldrh r5, [r0]
	ldr r0, _0812F464 @ =gUnknown_03004280
_0812F3EE:
	ldrh r3, [r0]
	movs r7, 0
	movs r2, 0
	ldr r6, _0812F468 @ =gUnknown_03004DE0
	movs r0, 0xF0
	lsls r0, 3
	adds r0, r6
	mov r12, r0
_0812F3FE:
	lsls r2, 16
	asrs r2, 16
	lsls r1, r2, 1
	adds r0, r1, r6
	strh r5, [r0]
	add r1, r12
	strh r5, [r1]
	adds r0, r2, 0x1
	lsls r0, 1
	adds r1, r0, r6
	strh r3, [r1]
	add r0, r12
	strh r3, [r0]
	lsls r0, r7, 16
	movs r1, 0x80
	lsls r1, 9
	adds r0, r1
	adds r2, 0x2
	lsls r2, 16
	lsrs r2, 16
	lsrs r7, r0, 16
	asrs r0, 16
	cmp r0, 0x9F
	ble _0812F3FE
	ldr r0, _0812F46C @ =0xa6600001
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
	bl sub_80895F8
	ldr r0, _0812F470 @ =sub_812F474
	str r0, [r4]
	add sp, 0xC
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_0812F454: .4byte REG_BG2HOFS
_0812F458: .4byte REG_BLDCNT
_0812F45C: .4byte 0x00003f44
_0812F460: .4byte gUnknown_03004288
_0812F464: .4byte gUnknown_03004280
_0812F468: .4byte gUnknown_03004DE0
_0812F46C: .4byte 0xa6600001
_0812F470: .4byte sub_812F474
	thumb_func_end sub_812F314

	thumb_func_start sub_812F474
sub_812F474: @ 812F474
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	sub sp, 0x14
	lsls r0, 24
	lsrs r4, r0, 24
	lsls r0, r4, 2
	adds r0, r4
	lsls r0, 3
	ldr r1, _0812F4A8 @ =gTasks
	adds r6, r0, r1
	ldrb r0, [r6, 0x12]
	bl battle_get_per_side_status_permutated
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _0812F4B4
	ldr r0, _0812F4AC @ =gUnknown_030042C0
	ldrh r0, [r0]
	str r0, [sp, 0x4]
	ldr r0, _0812F4B0 @ =gUnknown_030041B4
	b _0812F4BC
	.align 2, 0
_0812F4A8: .4byte gTasks
_0812F4AC: .4byte gUnknown_030042C0
_0812F4B0: .4byte gUnknown_030041B4
_0812F4B4:
	ldr r0, _0812F4D4 @ =gUnknown_03004288
	ldrh r0, [r0]
	str r0, [sp, 0x4]
	ldr r0, _0812F4D8 @ =gUnknown_03004280
_0812F4BC:
	ldrh r0, [r0]
	str r0, [sp, 0x8]
	movs r1, 0x8
	ldrsh r0, [r6, r1]
	cmp r0, 0x1
	bne _0812F4CA
	b _0812F6A6
_0812F4CA:
	cmp r0, 0x1
	bgt _0812F4DC
	cmp r0, 0
	beq _0812F4EA
	b _0812F712
	.align 2, 0
_0812F4D4: .4byte gUnknown_03004288
_0812F4D8: .4byte gUnknown_03004280
_0812F4DC:
	cmp r0, 0x2
	bne _0812F4E2
	b _0812F6C4
_0812F4E2:
	cmp r0, 0x3
	bne _0812F4E8
	b _0812F70C
_0812F4E8:
	b _0812F712
_0812F4EA:
	movs r2, 0x24
	ldrsh r0, [r6, r2]
	lsls r0, 17
	lsrs r5, r0, 16
	movs r3, 0
	str r3, [sp]
	mov r9, r3
	movs r4, 0
	ldrh r0, [r6, 0xA]
	adds r0, 0x2
	movs r1, 0xFF
	ands r0, r1
	strh r0, [r6, 0xA]
	ldrh r7, [r6, 0xA]
	mov r8, r7
	movs r0, 0x14
	ldrsh r1, [r6, r0]
	movs r0, 0xFC
	lsls r0, 3
	bl __divsi3
	strh r0, [r6, 0x1A]
	movs r1, 0x16
	ldrsh r0, [r6, r1]
	lsls r0, 1
	movs r2, 0x1A
	ldrsh r1, [r6, r2]
	bl __divsi3
	negs r0, r0
	strh r0, [r6, 0x1C]
	ldrh r0, [r6, 0x16]
	strh r0, [r6, 0x1E]
	lsls r0, 16
	asrs r0, 21
	lsls r0, 16
	lsrs r7, r0, 16
	strh r7, [r6, 0x20]
	ldrh r2, [r6, 0x24]
	lsls r3, r2, 16
	mov r12, r3
	asrs r1, r3, 16
	movs r3, 0x22
	ldrsh r0, [r6, r3]
	cmp r1, r0
	ble _0812F60A
	ldr r0, _0812F660 @ =gUnknown_03004DC0
	mov r10, r0
	ldr r1, [sp, 0x4]
	lsls r0, r1, 16
	asrs r0, 16
	str r0, [sp, 0x10]
	ldr r2, [sp, 0x8]
	lsls r0, r2, 16
	asrs r0, 16
	str r0, [sp, 0xC]
_0812F55A:
	lsls r5, 16
	asrs r5, 16
	adds r2, r5, 0x1
	lsls r2, 1
	mov r3, r10
	ldrb r1, [r3, 0x14]
	lsls r0, r1, 4
	subs r0, r1
	lsls r0, 7
	adds r2, r0
	ldr r0, _0812F664 @ =gUnknown_03004DE0
	adds r2, r0
	lsls r4, 16
	asrs r4, 16
	mov r1, r9
	lsls r0, r1, 16
	asrs r0, 16
	subs r0, r4, r0
	ldr r3, [sp, 0xC]
	adds r0, r3, r0
	strh r0, [r2]
	lsls r3, r5, 1
	mov r0, r10
	ldrb r1, [r0, 0x14]
	lsls r0, r1, 4
	subs r0, r1
	lsls r0, 7
	adds r3, r0
	ldr r1, _0812F664 @ =gUnknown_03004DE0
	adds r3, r1
	lsls r1, r7, 16
	asrs r1, 16
	ldr r2, [sp, 0x10]
	adds r1, r2, r1
	mov r7, r8
	lsls r2, r7, 16
	asrs r2, 16
	lsls r0, r2, 1
	ldr r7, _0812F668 @ =gSineTable
	adds r0, r7
	ldrh r0, [r0]
	lsls r0, 16
	asrs r0, 21
	adds r1, r0
	strh r1, [r3]
	adds r2, 0xA
	mov r8, r2
	movs r0, 0xFF
	mov r1, r8
	ands r1, r0
	mov r8, r1
	ldrh r0, [r6, 0x1C]
	ldrh r2, [r6, 0x1E]
	adds r0, r2
	strh r0, [r6, 0x1E]
	lsls r0, 16
	asrs r0, 21
	lsls r0, 16
	lsrs r7, r0, 16
	strh r7, [r6, 0x20]
	adds r4, 0x1
	lsls r4, 16
	lsrs r4, 16
	subs r5, 0x2
	lsls r5, 16
	lsrs r5, 16
	ldr r3, [sp]
	lsls r0, r3, 16
	asrs r0, 16
	ldrh r1, [r6, 0x14]
	adds r0, r1
	lsls r0, 16
	lsrs r2, r0, 16
	str r2, [sp]
	asrs r0, 21
	lsls r0, 16
	lsrs r0, 16
	mov r9, r0
	ldr r0, _0812F66C @ =0xffff0000
	add r0, r12
	lsrs r2, r0, 16
	lsls r3, r2, 16
	mov r12, r3
	asrs r1, r3, 16
	movs r3, 0x22
	ldrsh r0, [r6, r3]
	cmp r1, r0
	bgt _0812F55A
_0812F60A:
	lsls r1, r2, 17
	cmp r1, 0
	blt _0812F636
	ldr r4, _0812F664 @ =gUnknown_03004DE0
	ldr r7, [sp, 0x4]
	lsls r0, r7, 16
	asrs r0, 16
	adds r3, r0, 0
	adds r3, 0xF0
	movs r0, 0xF0
	lsls r0, 3
	adds r5, r4, r0
_0812F622:
	asrs r2, r1, 16
	lsls r1, r2, 1
	adds r0, r1, r4
	strh r3, [r0]
	adds r1, r5
	strh r3, [r1]
	subs r2, 0x2
	lsls r1, r2, 16
	cmp r1, 0
	bge _0812F622
_0812F636:
	ldrh r0, [r6, 0x14]
	adds r0, 0x1
	strh r0, [r6, 0x14]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x3F
	ble _0812F69C
	movs r0, 0x40
	strh r0, [r6, 0x14]
	ldrh r0, [r6, 0xC]
	adds r0, 0x1
	strh r0, [r6, 0xC]
	movs r1, 0x1
	ands r0, r1
	cmp r0, 0
	beq _0812F670
	ldrh r0, [r6, 0xE]
	subs r0, 0x1
	strh r0, [r6, 0xE]
	b _0812F676
	.align 2, 0
_0812F660: .4byte gUnknown_03004DC0
_0812F664: .4byte gUnknown_03004DE0
_0812F668: .4byte gSineTable
_0812F66C: .4byte 0xffff0000
_0812F670:
	ldrh r0, [r6, 0x10]
	adds r0, 0x1
	strh r0, [r6, 0x10]
_0812F676:
	ldr r0, _0812F698 @ =REG_BLDALPHA
	ldrh r1, [r6, 0x10]
	lsls r1, 8
	ldrh r2, [r6, 0xE]
	orrs r1, r2
	strh r1, [r0]
	movs r2, 0xE
	ldrsh r1, [r6, r2]
	cmp r1, 0
	bne _0812F712
	movs r3, 0x10
	ldrsh r0, [r6, r3]
	cmp r0, 0x10
	bne _0812F712
	strh r1, [r6, 0xC]
	strh r1, [r6, 0xE]
	b _0812F700
	.align 2, 0
_0812F698: .4byte REG_BLDALPHA
_0812F69C:
	ldrh r0, [r6, 0x18]
	ldrh r7, [r6, 0x16]
	adds r0, r7
	strh r0, [r6, 0x16]
	b _0812F712
_0812F6A6:
	ldrh r0, [r6, 0xC]
	adds r0, 0x1
	strh r0, [r6, 0xC]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0xC
	ble _0812F712
	ldr r1, _0812F6C0 @ =gUnknown_03004DC0
	movs r0, 0x3
	strb r0, [r1, 0x15]
	movs r0, 0
	strh r0, [r6, 0xC]
	b _0812F700
	.align 2, 0
_0812F6C0: .4byte gUnknown_03004DC0
_0812F6C4:
	ldrh r0, [r6, 0xC]
	adds r0, 0x1
	strh r0, [r6, 0xC]
	movs r1, 0x1
	ands r0, r1
	cmp r0, 0
	beq _0812F6DA
	ldrh r0, [r6, 0xE]
	adds r0, 0x1
	strh r0, [r6, 0xE]
	b _0812F6E0
_0812F6DA:
	ldrh r0, [r6, 0x10]
	subs r0, 0x1
	strh r0, [r6, 0x10]
_0812F6E0:
	ldr r2, _0812F708 @ =REG_BLDALPHA
	ldrh r0, [r6, 0x10]
	lsls r0, 8
	ldrh r1, [r6, 0xE]
	orrs r0, r1
	strh r0, [r2]
	movs r1, 0xE
	ldrsh r0, [r6, r1]
	cmp r0, 0x10
	bne _0812F712
	movs r2, 0x10
	ldrsh r0, [r6, r2]
	cmp r0, 0
	bne _0812F712
	strh r0, [r6, 0xC]
	strh r0, [r6, 0xE]
_0812F700:
	ldrh r0, [r6, 0x8]
	adds r0, 0x1
	strh r0, [r6, 0x8]
	b _0812F712
	.align 2, 0
_0812F708: .4byte REG_BLDALPHA
_0812F70C:
	adds r0, r4, 0
	bl move_anim_task_del
_0812F712:
	add sp, 0x14
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	thumb_func_end sub_812F474

	thumb_func_start sub_812F724
sub_812F724: @ 812F724
	push {r4,lr}
	lsls r0, 24
	lsrs r0, 24
	lsls r4, r0, 2
	adds r4, r0
	lsls r4, 3
	ldr r0, _0812F75C @ =gTasks
	adds r4, r0
	movs r0, 0
	strh r0, [r4, 0x8]
	ldr r0, _0812F760 @ =gBattleAnimArgs
	ldrb r0, [r0]
	bl obj_id_for_side_relative_to_move
	adds r1, r0, 0
	lsls r1, 24
	lsrs r1, 24
	strh r1, [r4, 0x26]
	ldr r2, _0812F764 @ =gUnknown_08402750
	adds r0, r4, 0
	bl sub_80798F4
	ldr r0, _0812F768 @ =sub_812F76C
	str r0, [r4]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0812F75C: .4byte gTasks
_0812F760: .4byte gBattleAnimArgs
_0812F764: .4byte gUnknown_08402750
_0812F768: .4byte sub_812F76C
	thumb_func_end sub_812F724

	thumb_func_start sub_812F76C
sub_812F76C: @ 812F76C
	push {r4-r6,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	lsls r0, r4, 2
	adds r0, r4
	lsls r0, 3
	ldr r2, _0812F7C4 @ =gTasks
	adds r3, r0, r2
	ldrh r0, [r3, 0x8]
	adds r1, r0, 0x1
	movs r5, 0
	strh r1, [r3, 0x8]
	subs r0, 0x14
	lsls r0, 16
	lsrs r0, 16
	adds r6, r2, 0
	cmp r0, 0x16
	bhi _0812F7D0
	ldrh r0, [r3, 0xA]
	adds r0, 0x1
	strh r0, [r3, 0xA]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x1
	ble _0812F7E0
	strh r5, [r3, 0xA]
	ldrh r0, [r3, 0xC]
	adds r0, 0x1
	strh r0, [r3, 0xC]
	movs r5, 0x1
	ands r0, r5
	cmp r0, 0
	bne _0812F7D0
	ldr r2, _0812F7C8 @ =gSprites
	movs r0, 0x26
	ldrsh r1, [r3, r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r2
	ldr r1, _0812F7CC @ =0x0000ffff
	strh r1, [r0, 0x24]
	b _0812F7E0
	.align 2, 0
_0812F7C4: .4byte gTasks
_0812F7C8: .4byte gSprites
_0812F7CC: .4byte 0x0000ffff
_0812F7D0:
	ldr r2, _0812F800 @ =gSprites
	movs r0, 0x26
	ldrsh r1, [r3, r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r2
	strh r5, [r0, 0x24]
_0812F7E0:
	lsls r0, r4, 2
	adds r0, r4
	lsls r0, 3
	adds r0, r6
	bl sub_807992C
	lsls r0, 24
	cmp r0, 0
	bne _0812F7F8
	adds r0, r4, 0
	bl move_anim_task_del
_0812F7F8:
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_0812F800: .4byte gSprites
	thumb_func_end sub_812F76C

	thumb_func_start sub_812F804
sub_812F804: @ 812F804
	push {r4-r6,lr}
	mov r6, r8
	push {r6}
	mov r8, r0
	adds r5, r2, 0
	adds r0, r3, 0
	ldr r4, [sp, 0x14]
	ldr r6, [sp, 0x18]
	lsls r1, 16
	lsrs r1, 16
	lsls r5, 16
	lsrs r5, 16
	lsls r4, 16
	lsrs r4, 16
	lsls r6, 16
	lsrs r6, 16
	mov r2, r8
	strh r1, [r2, 0x20]
	strh r5, [r2, 0x22]
	lsls r1, 16
	asrs r1, 16
	lsls r2, r1, 4
	mov r3, r8
	strh r2, [r3, 0x36]
	lsls r5, 16
	asrs r5, 16
	lsls r2, r5, 4
	strh r2, [r3, 0x38]
	lsls r0, 16
	asrs r0, 16
	subs r0, r1
	lsls r0, 4
	adds r1, r6, 0
	bl __divsi3
	mov r1, r8
	strh r0, [r1, 0x3A]
	lsls r4, 16
	asrs r4, 16
	subs r4, r5
	lsls r4, 4
	adds r0, r4, 0
	adds r1, r6, 0
	bl __divsi3
	mov r2, r8
	strh r0, [r2, 0x3C]
	pop {r3}
	mov r8, r3
	pop {r4-r6}
	pop {r0}
	bx r0
	thumb_func_end sub_812F804

	thumb_func_start sub_812F86C
sub_812F86C: @ 812F86C
	ldrh r1, [r0, 0x3A]
	ldrh r2, [r0, 0x36]
	adds r1, r2
	strh r1, [r0, 0x36]
	ldrh r2, [r0, 0x3C]
	ldrh r3, [r0, 0x38]
	adds r2, r3
	strh r2, [r0, 0x38]
	lsls r1, 16
	asrs r1, 20
	strh r1, [r0, 0x20]
	lsls r2, 16
	asrs r2, 20
	strh r2, [r0, 0x22]
	bx lr
	thumb_func_end sub_812F86C

	thumb_func_start sub_812F88C
sub_812F88C: @ 812F88C
	push {r4-r6,lr}
	sub sp, 0x8
	adds r4, r0, 0
	ldrh r6, [r4, 0x20]
	ldrh r5, [r4, 0x22]
	bl sub_8078650
	ldr r0, _0812F8D4 @ =gBattleAnimArgs
	ldrb r1, [r0]
	adds r0, r4, 0
	bl StartSpriteAffineAnim
	movs r0, 0x20
	ldrsh r1, [r4, r0]
	movs r0, 0x22
	ldrsh r2, [r4, r0]
	lsls r6, 16
	asrs r6, 16
	lsls r5, 16
	asrs r5, 16
	str r5, [sp]
	movs r0, 0x40
	str r0, [sp, 0x4]
	adds r0, r4, 0
	adds r3, r6, 0
	bl sub_812F804
	movs r0, 0
	strh r0, [r4, 0x2E]
	ldr r0, _0812F8D8 @ =sub_812F8DC
	str r0, [r4, 0x1C]
	add sp, 0x8
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_0812F8D4: .4byte gBattleAnimArgs
_0812F8D8: .4byte sub_812F8DC
	thumb_func_end sub_812F88C

	thumb_func_start sub_812F8DC
sub_812F8DC: @ 812F8DC
	push {r4,r5,lr}
	adds r5, r0, 0
	ldrh r0, [r5, 0x2E]
	adds r0, 0x1
	strh r0, [r5, 0x2E]
	movs r0, 0x2E
	ldrsh r4, [r5, r0]
	lsls r4, 3
	movs r0, 0xFF
	ands r4, r0
	adds r0, r5, 0
	bl sub_812F86C
	adds r0, r4, 0
	movs r1, 0x8
	bl Sin
	strh r0, [r5, 0x26]
	movs r1, 0x2E
	ldrsh r0, [r5, r1]
	cmp r0, 0x3A
	ble _0812F942
	ldrh r0, [r5, 0x30]
	adds r0, 0x1
	strh r0, [r5, 0x30]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x1
	ble _0812F942
	movs r0, 0
	strh r0, [r5, 0x30]
	ldrh r1, [r5, 0x32]
	adds r1, 0x1
	strh r1, [r5, 0x32]
	movs r0, 0x1
	ands r1, r0
	adds r3, r5, 0
	adds r3, 0x3E
	lsls r1, 2
	ldrb r2, [r3]
	subs r0, 0x6
	ands r0, r2
	orrs r0, r1
	strb r0, [r3]
	movs r1, 0x32
	ldrsh r0, [r5, r1]
	cmp r0, 0x3
	ble _0812F942
	adds r0, r5, 0
	bl move_anim_8074EE0
_0812F942:
	pop {r4,r5}
	pop {r0}
	bx r0
	thumb_func_end sub_812F8DC

	thumb_func_start sub_812F948
sub_812F948: @ 812F948
	push {r4-r6,lr}
	adds r5, r0, 0
	ldr r6, _0812F9A0 @ =gBattleAnimArgs
	ldrh r0, [r6, 0x6]
	strh r0, [r5, 0x2E]
	ldrb r1, [r6]
	adds r0, r5, 0
	bl StartSpriteAffineAnim
	ldr r0, _0812F9A4 @ =gUnknown_0202F7C9
	ldrb r0, [r0]
	bl battle_side_get_owner
	lsls r0, 24
	cmp r0, 0
	beq _0812F96E
	ldrh r0, [r6, 0x2]
	negs r0, r0
	strh r0, [r6, 0x2]
_0812F96E:
	ldr r4, _0812F9A8 @ =gUnknown_0202F7C8
	ldrb r0, [r4]
	movs r1, 0x2
	bl sub_8077ABC
	lsls r0, 24
	lsrs r0, 24
	ldrh r1, [r6, 0x2]
	adds r0, r1
	strh r0, [r5, 0x20]
	ldrb r0, [r4]
	movs r1, 0x3
	bl sub_8077ABC
	lsls r0, 24
	lsrs r0, 24
	ldrh r6, [r6, 0x4]
	adds r0, r6
	strh r0, [r5, 0x22]
	ldr r0, _0812F9AC @ =sub_80DA48C
	str r0, [r5, 0x1C]
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_0812F9A0: .4byte gBattleAnimArgs
_0812F9A4: .4byte gUnknown_0202F7C9
_0812F9A8: .4byte gUnknown_0202F7C8
_0812F9AC: .4byte sub_80DA48C
	thumb_func_end sub_812F948

	thumb_func_start sub_812F9B0
sub_812F9B0: @ 812F9B0
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	lsls r0, 24
	lsrs r5, r0, 24
	movs r7, 0
	ldr r2, _0812FA00 @ =gTasks
	lsls r0, r5, 2
	adds r0, r5
	lsls r0, 3
	adds r3, r0, r2
	ldrh r0, [r3, 0x8]
	subs r0, 0x1
	strh r0, [r3, 0x8]
	movs r1, 0x14
	ldrsh r0, [r3, r1]
	movs r1, 0x80
	lsls r1, 8
	ands r0, r1
	mov r8, r2
	cmp r0, 0
	beq _0812FA32
	ldrh r0, [r3, 0xA]
	subs r0, 0x1
	strh r0, [r3, 0xA]
	lsls r0, 16
	asrs r0, 16
	movs r1, 0x1
	negs r1, r1
	cmp r0, r1
	bne _0812FA32
	movs r2, 0x1A
	ldrsh r0, [r3, r2]
	cmp r0, 0
	bne _0812FA04
	ldrh r0, [r3, 0x10]
	strh r0, [r3, 0x1A]
	negs r0, r0
	strh r0, [r3, 0x10]
	b _0812FA06
	.align 2, 0
_0812FA00: .4byte gTasks
_0812FA04:
	strh r7, [r3, 0x1A]
_0812FA06:
	lsls r0, r5, 2
	adds r0, r5
	lsls r0, 3
	mov r2, r8
	adds r1, r0, r2
	movs r2, 0x1C
	ldrsh r0, [r1, r2]
	cmp r0, 0
	bne _0812FA22
	ldrh r0, [r1, 0x12]
	strh r0, [r1, 0x1C]
	negs r0, r0
	strh r0, [r1, 0x12]
	b _0812FA26
_0812FA22:
	movs r0, 0
	strh r0, [r1, 0x1C]
_0812FA26:
	lsls r0, r5, 2
	adds r0, r5
	lsls r0, 3
	add r0, r8
	ldrh r1, [r0, 0x22]
	strh r1, [r0, 0xA]
_0812FA32:
	lsls r2, r5, 2
	adds r0, r2, r5
	lsls r0, 3
	mov r1, r8
	adds r4, r0, r1
	ldrh r6, [r4, 0x16]
	ldrh r7, [r4, 0x18]
	movs r1, 0xC
	ldrsh r0, [r4, r1]
	movs r1, 0x80
	lsls r1, 8
	ands r0, r1
	mov r12, r2
	cmp r0, 0
	beq _0812FA70
	ldr r3, _0812FA6C @ =gSprites
	movs r2, 0x26
	ldrsh r0, [r4, r2]
	lsls r1, r0, 4
	adds r1, r0
	lsls r1, 2
	adds r1, r3
	lsrs r2, r6, 8
	ldrh r0, [r4, 0x1A]
	subs r0, r2
	strh r0, [r1, 0x24]
	adds r2, r3, 0
	b _0812FA86
	.align 2, 0
_0812FA6C: .4byte gSprites
_0812FA70:
	ldr r2, _0812FAB4 @ =gSprites
	movs r0, 0x26
	ldrsh r1, [r4, r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r2
	lsrs r1, r6, 8
	ldrh r4, [r4, 0x1A]
	adds r1, r4
	strh r1, [r0, 0x24]
_0812FA86:
	mov r1, r12
	adds r0, r1, r5
	lsls r0, 3
	mov r1, r8
	adds r4, r0, r1
	movs r1, 0xE
	ldrsh r0, [r4, r1]
	movs r1, 0x80
	lsls r1, 8
	ands r0, r1
	cmp r0, 0
	beq _0812FAB8
	movs r1, 0x26
	ldrsh r0, [r4, r1]
	lsls r1, r0, 4
	adds r1, r0
	lsls r1, 2
	adds r1, r2
	lsrs r2, r7, 8
	ldrh r0, [r4, 0x1C]
	subs r0, r2
	b _0812FACA
	.align 2, 0
_0812FAB4: .4byte gSprites
_0812FAB8:
	movs r1, 0x26
	ldrsh r0, [r4, r1]
	lsls r1, r0, 4
	adds r1, r0
	lsls r1, 2
	adds r1, r2
	lsrs r0, r7, 8
	ldrh r4, [r4, 0x1C]
	adds r0, r4
_0812FACA:
	strh r0, [r1, 0x26]
	mov r2, r12
	adds r0, r2, r5
	lsls r0, 3
	add r0, r8
	movs r1, 0x8
	ldrsh r0, [r0, r1]
	cmp r0, 0
	bgt _0812FAEA
	adds r0, r5, 0
	bl DestroyTask
	ldr r1, _0812FAF4 @ =gUnknown_0202F7B2
	ldrb r0, [r1]
	subs r0, 0x1
	strb r0, [r1]
_0812FAEA:
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_0812FAF4: .4byte gUnknown_0202F7B2
	thumb_func_end sub_812F9B0

	thumb_func_start sub_812FAF8
sub_812FAF8: @ 812FAF8
	push {r4-r7,lr}
	mov r7, r9
	mov r6, r8
	push {r6,r7}
	lsls r0, 24
	lsrs r6, r0, 24
	movs r7, 0
	ldr r2, _0812FB4C @ =gTasks
	lsls r0, r6, 2
	adds r0, r6
	lsls r0, 3
	adds r3, r0, r2
	ldrh r0, [r3, 0x8]
	subs r0, 0x1
	strh r0, [r3, 0x8]
	movs r1, 0x14
	ldrsh r0, [r3, r1]
	movs r1, 0x80
	lsls r1, 8
	ands r0, r1
	mov r8, r2
	cmp r0, 0
	beq _0812FB7E
	ldrh r0, [r3, 0xA]
	subs r0, 0x1
	strh r0, [r3, 0xA]
	lsls r0, 16
	asrs r0, 16
	movs r1, 0x1
	negs r1, r1
	cmp r0, r1
	bne _0812FB7E
	movs r2, 0x1A
	ldrsh r0, [r3, r2]
	cmp r0, 0
	bne _0812FB50
	ldrh r0, [r3, 0x10]
	strh r0, [r3, 0x1A]
	negs r0, r0
	strh r0, [r3, 0x10]
	b _0812FB52
	.align 2, 0
_0812FB4C: .4byte gTasks
_0812FB50:
	strh r7, [r3, 0x1A]
_0812FB52:
	lsls r0, r6, 2
	adds r0, r6
	lsls r0, 3
	mov r2, r8
	adds r1, r0, r2
	movs r2, 0x1C
	ldrsh r0, [r1, r2]
	cmp r0, 0
	bne _0812FB6E
	ldrh r0, [r1, 0x12]
	strh r0, [r1, 0x1C]
	negs r0, r0
	strh r0, [r1, 0x12]
	b _0812FB72
_0812FB6E:
	movs r0, 0
	strh r0, [r1, 0x1C]
_0812FB72:
	lsls r0, r6, 2
	adds r0, r6
	lsls r0, 3
	add r0, r8
	ldrh r1, [r0, 0x22]
	strh r1, [r0, 0xA]
_0812FB7E:
	lsls r3, r6, 2
	adds r0, r3, r6
	lsls r0, 3
	mov r1, r8
	adds r4, r0, r1
	ldrh r2, [r4, 0xC]
	ldr r1, _0812FBD0 @ =0x00007fff
	adds r0, r1, 0
	ands r0, r2
	ldrh r2, [r4, 0x16]
	adds r0, r2
	lsls r5, r0, 16
	lsrs r0, r5, 16
	mov r9, r0
	ldrh r0, [r4, 0xE]
	ands r1, r0
	ldrh r2, [r4, 0x18]
	adds r1, r2
	lsls r1, 16
	lsrs r7, r1, 16
	movs r1, 0xC
	ldrsh r0, [r4, r1]
	movs r1, 0x80
	lsls r1, 8
	ands r0, r1
	mov r12, r3
	cmp r0, 0
	beq _0812FBD8
	ldr r3, _0812FBD4 @ =gSprites
	movs r2, 0x26
	ldrsh r0, [r4, r2]
	lsls r1, r0, 4
	adds r1, r0
	lsls r1, 2
	adds r1, r3
	lsrs r2, r5, 24
	ldrh r0, [r4, 0x1A]
	subs r0, r2
	strh r0, [r1, 0x24]
	adds r2, r3, 0
	b _0812FBEE
	.align 2, 0
_0812FBD0: .4byte 0x00007fff
_0812FBD4: .4byte gSprites
_0812FBD8:
	ldr r2, _0812FC1C @ =gSprites
	movs r0, 0x26
	ldrsh r1, [r4, r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r2
	lsrs r1, r5, 24
	ldrh r4, [r4, 0x1A]
	adds r1, r4
	strh r1, [r0, 0x24]
_0812FBEE:
	mov r1, r12
	adds r0, r1, r6
	lsls r0, 3
	mov r1, r8
	adds r4, r0, r1
	movs r1, 0xE
	ldrsh r0, [r4, r1]
	movs r1, 0x80
	lsls r1, 8
	ands r0, r1
	cmp r0, 0
	beq _0812FC20
	movs r1, 0x26
	ldrsh r0, [r4, r1]
	lsls r1, r0, 4
	adds r1, r0
	lsls r1, 2
	adds r1, r2
	lsrs r2, r7, 8
	ldrh r0, [r4, 0x1C]
	subs r0, r2
	b _0812FC32
	.align 2, 0
_0812FC1C: .4byte gSprites
_0812FC20:
	movs r1, 0x26
	ldrsh r0, [r4, r1]
	lsls r1, r0, 4
	adds r1, r0
	lsls r1, 2
	adds r1, r2
	lsrs r0, r7, 8
	ldrh r4, [r4, 0x1C]
	adds r0, r4
_0812FC32:
	strh r0, [r1, 0x26]
	mov r2, r12
	adds r0, r2, r6
	lsls r0, 3
	mov r1, r8
	adds r2, r0, r1
	mov r0, r9
	strh r0, [r2, 0x16]
	strh r7, [r2, 0x18]
	movs r1, 0x8
	ldrsh r0, [r2, r1]
	cmp r0, 0
	bgt _0812FC58
	movs r0, 0x1E
	strh r0, [r2, 0x8]
	movs r0, 0
	strh r0, [r2, 0x22]
	ldr r0, _0812FC64 @ =sub_812F9B0
	str r0, [r2]
_0812FC58:
	pop {r3,r4}
	mov r8, r3
	mov r9, r4
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_0812FC64: .4byte sub_812F9B0
	thumb_func_end sub_812FAF8

	thumb_func_start sub_812FC68
sub_812FC68: @ 812FC68
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	lsls r0, 24
	lsrs r6, r0, 24
	ldr r0, _0812FCC8 @ =gTasks
	mov r8, r0
	lsls r7, r6, 2
	adds r0, r7, r6
	lsls r0, 3
	mov r1, r8
	adds r4, r0, r1
	ldr r1, _0812FCCC @ =gUnknown_02024BE0
	ldr r2, _0812FCD0 @ =gUnknown_0202F7C8
	ldrb r0, [r2]
	adds r0, r1
	ldrb r0, [r0]
	strh r0, [r4, 0x26]
	ldr r5, _0812FCD4 @ =gBattleAnimArgs
	ldrh r0, [r5]
	strh r0, [r4, 0x24]
	ldrh r0, [r5]
	strh r0, [r4, 0x8]
	ldrh r0, [r5, 0xC]
	strh r0, [r4, 0x22]
	movs r3, 0x6
	ldrsh r0, [r5, r3]
	cmp r0, 0
	beq _0812FCAC
	ldrh r0, [r4, 0x14]
	ldr r3, _0812FCD8 @ =0xffff8000
	adds r1, r3, 0
	orrs r0, r1
	strh r0, [r4, 0x14]
_0812FCAC:
	ldrb r0, [r2]
	bl battle_side_get_owner
	lsls r0, 24
	cmp r0, 0
	beq _0812FCDC
	ldrh r0, [r5, 0x2]
	strh r0, [r4, 0xC]
	ldrh r0, [r5, 0x4]
	strh r0, [r4, 0xE]
	mov r3, r8
	adds r4, r7, 0
	b _0812FD4C
	.align 2, 0
_0812FCC8: .4byte gTasks
_0812FCCC: .4byte gUnknown_02024BE0
_0812FCD0: .4byte gUnknown_0202F7C8
_0812FCD4: .4byte gBattleAnimArgs
_0812FCD8: .4byte 0xffff8000
_0812FCDC:
	movs r7, 0x2
	ldrsh r0, [r5, r7]
	movs r1, 0x80
	lsls r1, 8
	ands r0, r1
	cmp r0, 0
	beq _0812FCF8
	ldrh r1, [r5, 0x2]
	ldr r0, _0812FCF4 @ =0x00007fff
	ands r0, r1
	b _0812FD00
	.align 2, 0
_0812FCF4: .4byte 0x00007fff
_0812FCF8:
	ldrh r0, [r5, 0x2]
	ldr r2, _0812FD28 @ =0xffff8000
	adds r1, r2, 0
	orrs r0, r1
_0812FD00:
	strh r0, [r4, 0xC]
	ldr r0, _0812FD2C @ =gBattleAnimArgs
	movs r3, 0x4
	ldrsh r1, [r0, r3]
	movs r2, 0x80
	lsls r2, 8
	ands r1, r2
	adds r5, r0, 0
	cmp r1, 0
	beq _0812FD38
	ldr r3, _0812FD30 @ =gTasks
	lsls r4, r6, 2
	adds r1, r4, r6
	lsls r1, 3
	adds r1, r3
	ldrh r2, [r5, 0x4]
	ldr r0, _0812FD34 @ =0x00007fff
	ands r0, r2
	b _0812FD4A
	.align 2, 0
_0812FD28: .4byte 0xffff8000
_0812FD2C: .4byte gBattleAnimArgs
_0812FD30: .4byte gTasks
_0812FD34: .4byte 0x00007fff
_0812FD38:
	ldr r3, _0812FD70 @ =gTasks
	lsls r4, r6, 2
	adds r1, r4, r6
	lsls r1, 3
	adds r1, r3
	ldrh r2, [r5, 0x4]
	ldr r7, _0812FD74 @ =0xffff8000
	adds r0, r7, 0
	orrs r0, r2
_0812FD4A:
	strh r0, [r1, 0xE]
_0812FD4C:
	adds r0, r4, r6
	lsls r0, 3
	adds r0, r3
	movs r1, 0
	strh r1, [r0, 0x18]
	strh r1, [r0, 0x16]
	ldrh r1, [r5, 0x8]
	strh r1, [r0, 0x10]
	ldrh r1, [r5, 0xA]
	strh r1, [r0, 0x12]
	ldr r1, _0812FD78 @ =sub_812FAF8
	str r1, [r0]
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_0812FD70: .4byte gTasks
_0812FD74: .4byte 0xffff8000
_0812FD78: .4byte sub_812FAF8
	thumb_func_end sub_812FC68

	thumb_func_start sub_812FD7C
sub_812FD7C: @ 812FD7C
	push {r4,r5,lr}
	lsls r0, 24
	lsrs r2, r0, 24
	lsls r0, r2, 2
	adds r0, r2
	lsls r0, 3
	ldr r1, _0812FDB4 @ =gTasks
	adds r5, r0, r1
	ldr r4, _0812FDB8 @ =gBattleAnimArgs
	movs r1, 0x2
	ldrsh r0, [r4, r1]
	cmp r0, 0
	bne _0812FD9C
	adds r0, r2, 0
	bl move_anim_task_del
_0812FD9C:
	movs r0, 0
	strh r0, [r5, 0x8]
	strh r0, [r5, 0xA]
	strh r0, [r5, 0xC]
	ldrh r0, [r4, 0x2]
	strh r0, [r5, 0xE]
	movs r1, 0
	ldrsh r0, [r4, r1]
	cmp r0, 0
	bne _0812FDC0
	ldr r0, _0812FDBC @ =gUnknown_0202F7C8
	b _0812FDC2
	.align 2, 0
_0812FDB4: .4byte gTasks
_0812FDB8: .4byte gBattleAnimArgs
_0812FDBC: .4byte gUnknown_0202F7C8
_0812FDC0:
	ldr r0, _0812FE10 @ =gUnknown_0202F7C9
_0812FDC2:
	ldrb r4, [r0]
	adds r0, r4, 0
	movs r1, 0
	bl sub_8077ABC
	lsls r0, 24
	lsrs r0, 24
	strh r0, [r5, 0x10]
	adds r0, r4, 0
	movs r1, 0x1
	bl sub_8077ABC
	lsls r0, 24
	lsrs r0, 24
	strh r0, [r5, 0x12]
	adds r0, r4, 0
	bl sub_8079E90
	lsls r0, 24
	lsrs r0, 24
	strh r0, [r5, 0x14]
	ldr r0, _0812FE14 @ =gBattleAnimArgs
	ldrb r0, [r0]
	bl obj_id_for_side_relative_to_move
	adds r1, r0, 0
	lsls r1, 24
	lsrs r1, 24
	strh r1, [r5, 0x26]
	ldr r2, _0812FE18 @ =gUnknown_084028AC
	adds r0, r5, 0
	bl sub_80798F4
	ldr r0, _0812FE1C @ =sub_812FE20
	str r0, [r5]
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_0812FE10: .4byte gUnknown_0202F7C9
_0812FE14: .4byte gBattleAnimArgs
_0812FE18: .4byte gUnknown_084028AC
_0812FE1C: .4byte sub_812FE20
	thumb_func_end sub_812FD7C

	thumb_func_start sub_812FE20
sub_812FE20: @ 812FE20
	push {r4,r5,lr}
	lsls r0, 24
	lsrs r5, r0, 24
	lsls r0, r5, 2
	adds r0, r5
	lsls r0, 3
	ldr r1, _0812FE40 @ =gTasks
	adds r4, r0, r1
	movs r1, 0x8
	ldrsh r0, [r4, r1]
	cmp r0, 0
	beq _0812FE44
	cmp r0, 0x1
	beq _0812FEA4
	b _0812FEB2
	.align 2, 0
_0812FE40: .4byte gTasks
_0812FE44:
	ldrh r0, [r4, 0xA]
	adds r0, 0x1
	strh r0, [r4, 0xA]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x6
	bne _0812FE5A
	adds r0, r5, 0
	movs r1, 0x1
	bl sub_812FEB8
_0812FE5A:
	movs r1, 0xA
	ldrsh r0, [r4, r1]
	cmp r0, 0x12
	bne _0812FE6A
	adds r0, r5, 0
	movs r1, 0
	bl sub_812FEB8
_0812FE6A:
	adds r0, r4, 0
	bl sub_807992C
	lsls r0, 24
	lsrs r1, r0, 24
	cmp r1, 0
	bne _0812FEB2
	ldrh r0, [r4, 0xE]
	subs r0, 0x1
	strh r0, [r4, 0xE]
	lsls r0, 16
	cmp r0, 0
	bne _0812FE8C
	ldrh r0, [r4, 0x8]
	adds r0, 0x1
	strh r0, [r4, 0x8]
	b _0812FEB2
_0812FE8C:
	strh r1, [r4, 0xA]
	ldrh r1, [r4, 0x26]
	lsls r1, 24
	lsrs r1, 24
	ldr r2, _0812FEA0 @ =gUnknown_084028AC
	adds r0, r4, 0
	bl sub_80798F4
	b _0812FEB2
	.align 2, 0
_0812FEA0: .4byte gUnknown_084028AC
_0812FEA4:
	movs r1, 0xC
	ldrsh r0, [r4, r1]
	cmp r0, 0
	bne _0812FEB2
	adds r0, r5, 0
	bl move_anim_task_del
_0812FEB2:
	pop {r4,r5}
	pop {r0}
	bx r0
	thumb_func_end sub_812FE20

	thumb_func_start sub_812FEB8
sub_812FEB8: @ 812FEB8
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	sub sp, 0xC
	lsls r0, 24
	lsrs r6, r0, 24
	lsls r1, 24
	lsls r0, r6, 2
	adds r0, r6
	lsls r0, 3
	ldr r2, _0812FEDC @ =gTasks
	adds r4, r0, r2
	cmp r1, 0
	bne _0812FEE0
	movs r1, 0x12
	movs r3, 0xEC
	b _0812FEE4
	.align 2, 0
_0812FEDC: .4byte gTasks
_0812FEE0:
	movs r1, 0x1E
	movs r3, 0x14
_0812FEE4:
	mov r2, sp
	ldrh r0, [r4, 0x10]
	subs r0, r1
	strh r0, [r2]
	ldrh r0, [r4, 0x10]
	subs r0, r1
	subs r0, 0x4
	strh r0, [r2, 0x2]
	ldrh r0, [r4, 0x10]
	adds r0, r1
	strh r0, [r2, 0x4]
	ldrh r0, [r4, 0x10]
	adds r0, r1
	adds r0, 0x4
	strh r0, [r2, 0x6]
	add r2, sp, 0x8
	lsls r1, r3, 24
	asrs r1, 24
	ldrh r0, [r4, 0x12]
	adds r0, r1
	strh r0, [r2]
	ldrh r0, [r4, 0x12]
	adds r0, r1
	adds r0, 0x6
	strh r0, [r2, 0x2]
	movs r5, 0
	mov r8, r2
	ldr r7, _0812FF88 @ =gSprites
_0812FF1C:
	lsls r0, r5, 1
	add r0, sp
	movs r2, 0
	ldrsh r1, [r0, r2]
	movs r0, 0x1
	ands r0, r5
	lsls r0, 1
	add r0, r8
	movs r3, 0
	ldrsh r2, [r0, r3]
	ldrb r3, [r4, 0x14]
	subs r3, 0x5
	lsls r3, 24
	lsrs r3, 24
	ldr r0, _0812FF8C @ =gSpriteTemplate_84028CC
	bl CreateSprite
	lsls r0, 24
	lsrs r1, r0, 24
	cmp r1, 0x40
	beq _0812FF70
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r1, r0, r7
	movs r0, 0
	strh r0, [r1, 0x2E]
	movs r0, 0x2
	cmp r5, 0x1
	bhi _0812FF5E
	movs r2, 0x2
	negs r2, r2
	adds r0, r2, 0
_0812FF5E:
	strh r0, [r1, 0x30]
	ldr r0, _0812FF90 @ =0x0000ffff
	strh r0, [r1, 0x32]
	strh r6, [r1, 0x34]
	movs r0, 0x2
	strh r0, [r1, 0x36]
	ldrh r0, [r4, 0xC]
	adds r0, 0x1
	strh r0, [r4, 0xC]
_0812FF70:
	adds r0, r5, 0x1
	lsls r0, 24
	lsrs r5, r0, 24
	cmp r5, 0x3
	bls _0812FF1C
	add sp, 0xC
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_0812FF88: .4byte gSprites
_0812FF8C: .4byte gSpriteTemplate_84028CC
_0812FF90: .4byte 0x0000ffff
	thumb_func_end sub_812FEB8

	thumb_func_start sub_812FF94
sub_812FF94: @ 812FF94
	push {r4,lr}
	adds r4, r0, 0
	ldrh r0, [r4, 0x30]
	ldrh r1, [r4, 0x20]
	adds r0, r1
	strh r0, [r4, 0x20]
	ldrh r0, [r4, 0x32]
	ldrh r1, [r4, 0x22]
	adds r0, r1
	strh r0, [r4, 0x22]
	ldrh r0, [r4, 0x2E]
	adds r0, 0x1
	strh r0, [r4, 0x2E]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x6
	ble _0812FFDA
	ldr r3, _0812FFE0 @ =gTasks
	movs r0, 0x36
	ldrsh r1, [r4, r0]
	lsls r1, 1
	movs r0, 0x34
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
_0812FFDA:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0812FFE0: .4byte gTasks
	thumb_func_end sub_812FF94

	thumb_func_start sub_812FFE4
sub_812FFE4: @ 812FFE4
	push {r4,lr}
	lsls r0, 24
	lsrs r0, 24
	ldr r1, _0813002C @ =gTasks
	lsls r4, r0, 2
	adds r4, r0
	lsls r4, 3
	adds r4, r1
	movs r0, 0
	strh r0, [r4, 0x8]
	ldr r1, _08130030 @ =gBattleAnimArgs
	ldrh r0, [r1, 0x2]
	strh r0, [r4, 0xA]
	ldrb r0, [r1]
	bl obj_id_for_side_relative_to_move
	lsls r0, 24
	lsrs r0, 24
	ldr r2, _08130034 @ =gSprites
	lsls r1, r0, 4
	adds r1, r0
	lsls r1, 2
	adds r1, r2
	ldrb r0, [r1, 0x5]
	lsrs r0, 4
	lsls r0, 4
	movs r2, 0x80
	lsls r2, 1
	adds r1, r2, 0
	adds r0, r1
	strh r0, [r4, 0xC]
	ldr r0, _08130038 @ =sub_813003C
	str r0, [r4]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0813002C: .4byte gTasks
_08130030: .4byte gBattleAnimArgs
_08130034: .4byte gSprites
_08130038: .4byte sub_813003C
	thumb_func_end sub_812FFE4

	thumb_func_start sub_813003C
sub_813003C: @ 813003C
	push {r4,r5,lr}
	lsls r0, 24
	lsrs r5, r0, 24
	ldr r1, _08130084 @ =gTasks
	lsls r0, r5, 2
	adds r0, r5
	lsls r0, 3
	adds r4, r0, r1
	movs r1, 0xA
	ldrsh r0, [r4, r1]
	cmp r0, 0
	beq _0813008C
	ldrh r0, [r4, 0xC]
	ldr r2, _08130088 @ =gUnknown_084028E4
	movs r3, 0x8
	ldrsh r1, [r4, r3]
	lsls r1, 1
	adds r1, r2
	ldrh r3, [r1]
	movs r1, 0x10
	movs r2, 0x8
	bl BlendPalette
	ldrh r0, [r4, 0x8]
	adds r0, 0x1
	strh r0, [r4, 0x8]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x17
	ble _0813007C
	movs r0, 0
	strh r0, [r4, 0x8]
_0813007C:
	ldrh r0, [r4, 0xA]
	subs r0, 0x1
	strh r0, [r4, 0xA]
	b _0813009E
	.align 2, 0
_08130084: .4byte gTasks
_08130088: .4byte gUnknown_084028E4
_0813008C:
	ldrh r0, [r4, 0xC]
	movs r1, 0x10
	movs r2, 0
	movs r3, 0
	bl BlendPalette
	adds r0, r5, 0
	bl move_anim_task_del
_0813009E:
	pop {r4,r5}
	pop {r0}
	bx r0
	thumb_func_end sub_813003C

	thumb_func_start sub_81300A4
sub_81300A4: @ 81300A4
	push {lr}
	sub sp, 0x1C
	lsls r0, 24
	lsrs r0, 24
	movs r2, 0xD0
	lsls r2, 1
	ldr r1, _081300E0 @ =gUnknown_0202F7C8
	ldrb r3, [r1]
	ldr r1, _081300E4 @ =gBattleAnimArgs
	ldrb r1, [r1]
	str r1, [sp]
	movs r1, 0xA
	str r1, [sp, 0x4]
	movs r1, 0x2
	str r1, [sp, 0x8]
	movs r1, 0x1E
	str r1, [sp, 0xC]
	ldr r1, _081300E8 @ =gUnknown_08D2E014
	str r1, [sp, 0x10]
	ldr r1, _081300EC @ =gUnknown_08D2E170
	str r1, [sp, 0x14]
	ldr r1, _081300F0 @ =gUnknown_08D2E150
	str r1, [sp, 0x18]
	movs r1, 0
	bl sub_80E3C4C
	add sp, 0x1C
	pop {r0}
	bx r0
	.align 2, 0
_081300E0: .4byte gUnknown_0202F7C8
_081300E4: .4byte gBattleAnimArgs
_081300E8: .4byte gUnknown_08D2E014
_081300EC: .4byte gUnknown_08D2E170
_081300F0: .4byte gUnknown_08D2E150
	thumb_func_end sub_81300A4

	thumb_func_start sub_81300F4
sub_81300F4: @ 81300F4
	push {r4-r6,lr}
	adds r5, r0, 0
	ldr r6, _0813014C @ =gUnknown_0202F7C8
	ldrb r0, [r6]
	bl battle_side_get_owner
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _08130110
	ldr r1, _08130150 @ =gBattleAnimArgs
	ldrh r0, [r1]
	negs r0, r0
	strh r0, [r1]
_08130110:
	ldrb r0, [r6]
	movs r1, 0
	bl sub_8077ABC
	lsls r0, 24
	ldr r4, _08130150 @ =gBattleAnimArgs
	lsrs r0, 24
	ldrh r1, [r4]
	adds r0, r1
	strh r0, [r5, 0x20]
	ldrb r0, [r6]
	movs r1, 0x1
	bl sub_8077ABC
	lsls r0, 24
	lsrs r0, 24
	ldrh r1, [r4, 0x2]
	adds r0, r1
	strh r0, [r5, 0x22]
	movs r1, 0x4
	ldrsh r0, [r4, r1]
	cmp r0, 0
	bne _08130158
	movs r0, 0xA0
	lsls r0, 2
	strh r0, [r5, 0x2E]
	ldr r0, _08130154 @ =0x0000fd80
	strh r0, [r5, 0x30]
	b _08130180
	.align 2, 0
_0813014C: .4byte gUnknown_0202F7C8
_08130150: .4byte gBattleAnimArgs
_08130154: .4byte 0x0000fd80
_08130158:
	cmp r0, 0x1
	bne _08130172
	adds r2, r5, 0
	adds r2, 0x3F
	ldrb r0, [r2]
	movs r1, 0x2
	orrs r0, r1
	strb r0, [r2]
	movs r0, 0xA0
	lsls r0, 2
	strh r0, [r5, 0x2E]
	strh r0, [r5, 0x30]
	b _08130180
_08130172:
	adds r0, r5, 0
	movs r1, 0x1
	bl StartSpriteAnim
	movs r0, 0xA0
	lsls r0, 2
	strh r0, [r5, 0x2E]
_08130180:
	ldr r0, _081301AC @ =gUnknown_0202F7C8
	ldrb r0, [r0]
	bl battle_side_get_owner
	lsls r0, 24
	cmp r0, 0
	beq _081301A0
	ldrh r0, [r5, 0x2E]
	negs r0, r0
	strh r0, [r5, 0x2E]
	adds r2, r5, 0
	adds r2, 0x3F
	ldrb r0, [r2]
	movs r1, 0x1
	orrs r0, r1
	strb r0, [r2]
_081301A0:
	ldr r0, _081301B0 @ =sub_81301B4
	str r0, [r5, 0x1C]
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_081301AC: .4byte gUnknown_0202F7C8
_081301B0: .4byte sub_81301B4
	thumb_func_end sub_81300F4

	thumb_func_start sub_81301B4
sub_81301B4: @ 81301B4
	push {lr}
	adds r2, r0, 0
	ldrh r0, [r2, 0x2E]
	ldrh r1, [r2, 0x3A]
	adds r0, r1
	strh r0, [r2, 0x3A]
	ldrh r1, [r2, 0x30]
	ldrh r3, [r2, 0x3C]
	adds r1, r3
	strh r1, [r2, 0x3C]
	lsls r0, 16
	asrs r0, 24
	strh r0, [r2, 0x24]
	lsls r1, 16
	asrs r1, 24
	strh r1, [r2, 0x26]
	ldrh r0, [r2, 0x38]
	adds r0, 0x1
	strh r0, [r2, 0x38]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0xE
	bne _081301E8
	adds r0, r2, 0
	bl move_anim_8072740
_081301E8:
	pop {r0}
	bx r0
	thumb_func_end sub_81301B4

	thumb_func_start sub_81301EC
sub_81301EC: @ 81301EC
	push {r4-r6,lr}
	lsls r0, 24
	lsrs r0, 24
	lsls r1, r0, 2
	adds r1, r0
	lsls r1, 3
	ldr r0, _08130218 @ =gTasks
	adds r6, r1, r0
	bl sub_8076BE0
	lsls r0, 24
	lsrs r1, r0, 24
	cmp r1, 0
	beq _0813021C
	movs r0, 0x8
	strh r0, [r6, 0x12]
	movs r0, 0x3
	strh r0, [r6, 0x14]
	movs r0, 0x1
	strh r0, [r6, 0x16]
	b _08130226
	.align 2, 0
_08130218: .4byte gTasks
_0813021C:
	movs r0, 0xC
	strh r0, [r6, 0x12]
	movs r0, 0x3
	strh r0, [r6, 0x14]
	strh r1, [r6, 0x16]
_08130226:
	ldr r5, _0813025C @ =gUnknown_0202F7C8
	ldrb r0, [r5]
	bl battle_side_get_owner
	lsls r0, 24
	cmp r0, 0
	bne _08130260
	ldrb r0, [r5]
	movs r1, 0x2
	bl sub_8077ABC
	adds r4, r0, 0
	ldrb r0, [r5]
	movs r1, 0
	bl sub_807A100
	lsls r4, 24
	lsrs r4, 24
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0
	bge _08130254
	adds r0, 0x3
_08130254:
	asrs r0, 2
	adds r0, r4, r0
	b _08130284
	.align 2, 0
_0813025C: .4byte gUnknown_0202F7C8
_08130260:
	ldrb r0, [r5]
	movs r1, 0x2
	bl sub_8077ABC
	adds r4, r0, 0
	ldrb r0, [r5]
	movs r1, 0
	bl sub_807A100
	lsls r4, 24
	lsrs r4, 24
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0
	bge _08130280
	adds r0, 0x3
_08130280:
	asrs r0, 2
	subs r0, r4, r0
_08130284:
	strh r0, [r6, 0x1E]
	ldr r5, _081302D8 @ =gUnknown_0202F7C8
	ldrb r0, [r5]
	movs r1, 0x3
	bl sub_8077ABC
	adds r4, r0, 0
	ldrb r0, [r5]
	movs r1, 0
	bl sub_807A100
	lsls r4, 24
	lsrs r4, 24
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0
	bge _081302A8
	adds r0, 0x3
_081302A8:
	asrs r0, 2
	subs r0, r4, r0
	strh r0, [r6, 0x20]
	ldr r4, _081302DC @ =gUnknown_0202F7C9
	ldrb r0, [r4]
	movs r1, 0x2
	bl sub_8077ABC
	lsls r0, 24
	lsrs r0, 24
	strh r0, [r6, 0x22]
	ldrb r0, [r4]
	movs r1, 0x3
	bl sub_8077ABC
	lsls r0, 24
	lsrs r0, 24
	strh r0, [r6, 0x24]
	ldr r0, _081302E0 @ =sub_81302E4
	str r0, [r6]
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_081302D8: .4byte gUnknown_0202F7C8
_081302DC: .4byte gUnknown_0202F7C9
_081302E0: .4byte sub_81302E4
	thumb_func_end sub_81301EC

	thumb_func_start sub_81302E4
sub_81302E4: @ 81302E4
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	sub sp, 0x14
	lsls r0, 24
	lsrs r7, r0, 24
	lsls r0, r7, 2
	adds r0, r7
	lsls r0, 3
	ldr r1, _0813030C @ =gTasks
	adds r5, r0, r1
	movs r0, 0x8
	ldrsh r1, [r5, r0]
	cmp r1, 0
	beq _08130310
	cmp r1, 0x1
	bne _08130308
	b _08130408
_08130308:
	b _08130416
	.align 2, 0
_0813030C: .4byte gTasks
_08130310:
	ldrh r0, [r5, 0xA]
	adds r0, 0x1
	strh r0, [r5, 0xA]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x3
	ble _08130416
	strh r1, [r5, 0xA]
	movs r1, 0x1E
	ldrsh r0, [r5, r1]
	movs r2, 0x20
	ldrsh r1, [r5, r2]
	movs r3, 0x22
	ldrsh r2, [r5, r3]
	movs r4, 0x24
	ldrsh r3, [r5, r4]
	ldrb r4, [r5, 0x12]
	str r4, [sp]
	ldrb r4, [r5, 0xC]
	str r4, [sp, 0x4]
	add r4, sp, 0x10
	str r4, [sp, 0x8]
	adds r4, 0x2
	str r4, [sp, 0xC]
	bl sub_8130424
	movs r6, 0
	mov r8, r4
	ldr r4, _08130384 @ =gSprites
_0813034A:
	add r0, sp, 0x10
	movs r2, 0
	ldrsh r1, [r0, r2]
	mov r3, r8
	movs r0, 0
	ldrsh r2, [r3, r0]
	ldr r0, _08130388 @ =gSpriteTemplate_840294C
	movs r3, 0x23
	bl CreateSprite
	lsls r0, 24
	lsrs r3, r0, 24
	cmp r3, 0x40
	beq _081303DE
	movs r1, 0x16
	ldrsh r0, [r5, r1]
	cmp r0, 0
	bne _0813039E
	cmp r6, 0
	bne _0813038C
	lsls r2, r3, 4
	adds r1, r2, r3
	lsls r1, 2
	adds r1, r4
	ldrh r0, [r5, 0x14]
	negs r0, r0
	strh r0, [r1, 0x26]
	strh r0, [r1, 0x24]
	b _081303C6
	.align 2, 0
_08130384: .4byte gSprites
_08130388: .4byte gSpriteTemplate_840294C
_0813038C:
	lsls r2, r3, 4
	adds r1, r2, r3
	lsls r1, 2
	adds r1, r4
	ldrh r0, [r5, 0x14]
	strh r0, [r1, 0x26]
	ldrh r0, [r5, 0x14]
	strh r0, [r1, 0x24]
	b _081303C6
_0813039E:
	cmp r6, 0
	bne _081303B4
	lsls r2, r3, 4
	adds r1, r2, r3
	lsls r1, 2
	adds r1, r4
	ldrh r0, [r5, 0x14]
	negs r0, r0
	strh r0, [r1, 0x24]
	ldrh r0, [r5, 0x14]
	b _081303C4
_081303B4:
	lsls r2, r3, 4
	adds r1, r2, r3
	lsls r1, 2
	adds r1, r4
	ldrh r0, [r5, 0x14]
	strh r0, [r1, 0x24]
	ldrh r0, [r5, 0x14]
	negs r0, r0
_081303C4:
	strh r0, [r1, 0x26]
_081303C6:
	ldr r1, _08130404 @ =gSprites
	adds r0, r2, r3
	lsls r0, 2
	adds r0, r1
	movs r1, 0
	strh r1, [r0, 0x2E]
	strh r7, [r0, 0x30]
	movs r1, 0xA
	strh r1, [r0, 0x32]
	ldrh r0, [r5, 0x1C]
	adds r0, 0x1
	strh r0, [r5, 0x1C]
_081303DE:
	adds r0, r6, 0x1
	lsls r0, 24
	lsrs r6, r0, 24
	cmp r6, 0x1
	bls _0813034A
	ldrh r2, [r5, 0xC]
	movs r3, 0xC
	ldrsh r1, [r5, r3]
	movs r4, 0x12
	ldrsh r0, [r5, r4]
	cmp r1, r0
	bne _081303FC
	ldrh r0, [r5, 0x8]
	adds r0, 0x1
	strh r0, [r5, 0x8]
_081303FC:
	adds r0, r2, 0x1
	strh r0, [r5, 0xC]
	b _08130416
	.align 2, 0
_08130404: .4byte gSprites
_08130408:
	movs r1, 0x1C
	ldrsh r0, [r5, r1]
	cmp r0, 0
	bne _08130416
	adds r0, r7, 0
	bl move_anim_task_del
_08130416:
	add sp, 0x14
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r0}
	bx r0
	thumb_func_end sub_81302E4

	thumb_func_start sub_8130424
sub_8130424: @ 8130424
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	sub sp, 0x8
	ldr r4, [sp, 0x28]
	ldr r5, [sp, 0x2C]
	ldr r6, [sp, 0x30]
	mov r9, r6
	ldr r6, [sp, 0x34]
	mov r10, r6
	lsls r0, 16
	lsrs r0, 16
	mov r12, r0
	lsls r1, 16
	lsrs r1, 16
	str r1, [sp]
	lsls r2, 16
	lsrs r2, 16
	adds r7, r2, 0
	lsls r3, 16
	lsrs r3, 16
	str r3, [sp, 0x4]
	lsls r4, 24
	lsrs r6, r4, 24
	lsls r5, 24
	lsrs r5, 24
	mov r8, r5
	cmp r5, 0
	bne _0813046C
	mov r2, r9
	strh r0, [r2]
	mov r6, r10
	strh r1, [r6]
	b _081304CA
_0813046C:
	cmp r5, r6
	bcc _0813047A
	mov r0, r9
	strh r2, [r0]
	mov r1, r10
	strh r3, [r1]
	b _081304CA
_0813047A:
	subs r0, r6, 0x1
	lsls r0, 24
	lsrs r6, r0, 24
	mov r2, r12
	lsls r1, r2, 16
	asrs r1, 16
	lsls r5, r1, 8
	lsls r0, r7, 16
	asrs r0, 16
	subs r0, r1
	lsls r0, 8
	adds r1, r6, 0
	bl __divsi3
	mov r1, r8
	muls r1, r0
	adds r0, r1, 0
	adds r5, r0
	ldr r2, [sp]
	lsls r1, r2, 16
	asrs r1, 16
	lsls r4, r1, 8
	ldr r2, [sp, 0x4]
	lsls r0, r2, 16
	asrs r0, 16
	subs r0, r1
	lsls r0, 8
	adds r1, r6, 0
	bl __divsi3
	mov r6, r8
	muls r6, r0
	adds r0, r6, 0
	adds r4, r0
	asrs r5, 8
	mov r0, r9
	strh r5, [r0]
	asrs r4, 8
	mov r1, r10
	strh r4, [r1]
_081304CA:
	add sp, 0x8
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	thumb_func_end sub_8130424

	thumb_func_start sub_81304DC
sub_81304DC: @ 81304DC
	push {r4,lr}
	adds r4, r0, 0
	ldrh r0, [r4, 0x2E]
	adds r0, 0x1
	strh r0, [r4, 0x2E]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x24
	ble _08130512
	ldr r3, _08130518 @ =gTasks
	movs r0, 0x32
	ldrsh r1, [r4, r0]
	lsls r1, 1
	movs r0, 0x30
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
_08130512:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08130518: .4byte gTasks
	thumb_func_end sub_81304DC

	thumb_func_start sub_813051C
sub_813051C: @ 813051C
	push {r4,lr}
	adds r4, r0, 0
	ldr r1, _08130548 @ =gBattleAnimArgs
	ldrh r0, [r1]
	strh r0, [r4, 0x20]
	ldrh r0, [r1, 0x2]
	strh r0, [r4, 0x22]
	ldrh r0, [r1, 0x4]
	strh r0, [r4, 0x32]
	ldrh r0, [r1, 0x6]
	strh r0, [r4, 0x36]
	ldrh r0, [r1, 0x8]
	strh r0, [r4, 0x2E]
	ldr r1, _0813054C @ =move_anim_8072740
	adds r0, r4, 0
	bl oamt_set_x3A_32
	ldr r0, _08130550 @ =sub_8078CC0
	str r0, [r4, 0x1C]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08130548: .4byte gBattleAnimArgs
_0813054C: .4byte move_anim_8072740
_08130550: .4byte sub_8078CC0
	thumb_func_end sub_813051C

	thumb_func_start sub_8130554
sub_8130554: @ 8130554
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	lsls r0, 24
	lsrs r0, 24
	mov r9, r0
	lsls r0, 2
	add r0, r9
	lsls r0, 3
	ldr r1, _08130674 @ =gTasks
	adds r7, r0, r1
	ldr r0, _08130678 @ =gUnknown_0202F7C8
	mov r10, r0
	ldrb r0, [r0]
	movs r1, 0x2
	bl sub_8077ABC
	lsls r0, 24
	lsrs r0, 24
	strh r0, [r7, 0x1E]
	mov r1, r10
	ldrb r0, [r1]
	movs r1, 0x3
	bl sub_8077ABC
	lsls r0, 24
	lsrs r0, 24
	strh r0, [r7, 0x20]
	ldr r0, _0813067C @ =gUnknown_0202F7C9
	mov r8, r0
	ldrb r0, [r0]
	movs r1, 0x2
	bl sub_8077ABC
	lsls r0, 24
	lsrs r0, 24
	strh r0, [r7, 0x22]
	mov r1, r8
	ldrb r0, [r1]
	movs r1, 0x3
	bl sub_8077ABC
	adds r4, r0, 0
	mov r1, r8
	ldrb r0, [r1]
	movs r1, 0
	bl sub_807A100
	lsls r4, 24
	lsrs r4, 24
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0
	bge _081305C6
	adds r0, 0x3
_081305C6:
	asrs r0, 2
	adds r0, r4, r0
	strh r0, [r7, 0x24]
	ldr r4, _08130680 @ =gSpriteTemplate_84029AC
	movs r0, 0x1E
	ldrsh r5, [r7, r0]
	movs r1, 0x20
	ldrsh r6, [r7, r1]
	mov r1, r8
	ldrb r0, [r1]
	bl sub_8079E90
	adds r3, r0, 0
	subs r3, 0x5
	lsls r3, 24
	lsrs r3, 24
	adds r0, r4, 0
	adds r1, r5, 0
	adds r2, r6, 0
	bl CreateSprite
	lsls r0, 24
	lsrs r0, 24
	strh r0, [r7, 0x26]
	cmp r0, 0x40
	beq _08130690
	ldr r4, _08130684 @ =gSprites
	movs r0, 0x26
	ldrsh r1, [r7, r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r4
	movs r1, 0x10
	strh r1, [r0, 0x2E]
	movs r0, 0x26
	ldrsh r1, [r7, r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r4
	ldrh r1, [r7, 0x22]
	strh r1, [r0, 0x32]
	movs r0, 0x26
	ldrsh r1, [r7, r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r4
	ldrh r1, [r7, 0x24]
	strh r1, [r0, 0x36]
	movs r0, 0x26
	ldrsh r1, [r7, r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r4
	ldr r1, _08130688 @ =0x0000ffe0
	strh r1, [r0, 0x38]
	movs r0, 0x26
	ldrsh r1, [r7, r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r4
	bl sub_80786EC
	mov r1, r10
	ldrb r0, [r1]
	bl battle_side_get_owner
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _0813066E
	movs r0, 0x26
	ldrsh r1, [r7, r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r4
	movs r1, 0x1
	bl StartSpriteAffineAnim
_0813066E:
	ldr r0, _0813068C @ =sub_81306A4
	str r0, [r7]
	b _08130696
	.align 2, 0
_08130674: .4byte gTasks
_08130678: .4byte gUnknown_0202F7C8
_0813067C: .4byte gUnknown_0202F7C9
_08130680: .4byte gSpriteTemplate_84029AC
_08130684: .4byte gSprites
_08130688: .4byte 0x0000ffe0
_0813068C: .4byte sub_81306A4
_08130690:
	mov r0, r9
	bl move_anim_task_del
_08130696:
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	thumb_func_end sub_8130554

	thumb_func_start sub_81306A4
sub_81306A4: @ 81306A4
	push {r4,r5,lr}
	lsls r0, 24
	lsrs r2, r0, 24
	lsls r0, r2, 2
	adds r0, r2
	lsls r0, 3
	ldr r1, _081306C8 @ =gTasks
	adds r4, r0, r1
	movs r0, 0x8
	ldrsh r1, [r4, r0]
	cmp r1, 0x1
	beq _0813070C
	cmp r1, 0x1
	bgt _081306CC
	cmp r1, 0
	beq _081306D6
	b _081307AA
	.align 2, 0
_081306C8: .4byte gTasks
_081306CC:
	cmp r1, 0x2
	beq _08130730
	cmp r1, 0x3
	beq _081307A4
	b _081307AA
_081306D6:
	ldrh r0, [r4, 0xA]
	adds r0, 0x1
	strh r0, [r4, 0xA]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x1
	ble _081307AA
	strh r1, [r4, 0xA]
	movs r0, 0x26
	ldrsh r1, [r4, r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	ldr r1, _08130708 @ =gSprites
	adds r0, r1
	bl sub_8078718
	ldrh r0, [r4, 0xC]
	adds r0, 0x1
	strh r0, [r4, 0xC]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x7
	ble _081307AA
	b _08130796
	.align 2, 0
_08130708: .4byte gSprites
_0813070C:
	movs r0, 0x26
	ldrsh r1, [r4, r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	ldr r1, _0813072C @ =gSprites
	adds r0, r1
	bl sub_8078718
	lsls r0, 24
	cmp r0, 0
	beq _081307AA
	movs r0, 0
	strh r0, [r4, 0xA]
	strh r0, [r4, 0xC]
	b _08130796
	.align 2, 0
_0813072C: .4byte gSprites
_08130730:
	ldrh r0, [r4, 0xA]
	adds r0, 0x1
	strh r0, [r4, 0xA]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x1
	ble _081307AA
	movs r0, 0
	strh r0, [r4, 0xA]
	ldrh r2, [r4, 0xC]
	adds r2, 0x1
	strh r2, [r4, 0xC]
	ldr r5, _081307A0 @ =gSprites
	movs r1, 0x26
	ldrsh r0, [r4, r1]
	lsls r1, r0, 4
	adds r1, r0
	lsls r1, 2
	adds r1, r5
	movs r0, 0x1
	ands r2, r0
	adds r1, 0x3E
	lsls r2, 2
	ldrb r3, [r1]
	subs r0, 0x6
	ands r0, r3
	orrs r0, r2
	strb r0, [r1]
	movs r1, 0xC
	ldrsh r0, [r4, r1]
	cmp r0, 0x10
	bne _081307AA
	movs r0, 0x26
	ldrsh r1, [r4, r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r5
	ldrb r0, [r0, 0x3]
	lsls r0, 26
	lsrs r0, 27
	bl FreeOamMatrix
	movs r0, 0x26
	ldrsh r1, [r4, r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r5
	bl DestroySprite
_08130796:
	ldrh r0, [r4, 0x8]
	adds r0, 0x1
	strh r0, [r4, 0x8]
	b _081307AA
	.align 2, 0
_081307A0: .4byte gSprites
_081307A4:
	adds r0, r2, 0
	bl move_anim_task_del
_081307AA:
	pop {r4,r5}
	pop {r0}
	bx r0
	thumb_func_end sub_81306A4

	thumb_func_start sub_81307B0
sub_81307B0: @ 81307B0
	push {r4-r6,lr}
	adds r4, r0, 0
	ldr r0, _081307C4 @ =gBattleAnimArgs
	movs r2, 0
	ldrsh r1, [r0, r2]
	adds r6, r0, 0
	cmp r1, 0
	bne _081307CC
	ldr r0, _081307C8 @ =gUnknown_0202F7C8
	b _081307CE
	.align 2, 0
_081307C4: .4byte gBattleAnimArgs
_081307C8: .4byte gUnknown_0202F7C8
_081307CC:
	ldr r0, _08130834 @ =gUnknown_0202F7C9
_081307CE:
	ldrb r5, [r0]
	ldrh r2, [r4, 0x4]
	lsls r1, r2, 22
	lsrs r1, 22
	adds r1, 0x10
	ldr r3, _08130838 @ =0x000003ff
	adds r0, r3, 0
	ands r1, r0
	ldr r0, _0813083C @ =0xfffffc00
	ands r0, r2
	orrs r0, r1
	strh r0, [r4, 0x4]
	adds r1, r6, 0
	ldrh r0, [r1, 0x4]
	strh r0, [r4, 0x3A]
	movs r2, 0x2
	ldrsh r0, [r1, r2]
	movs r1, 0x1
	cmp r0, 0
	bne _081307FC
	movs r3, 0x1
	negs r3, r3
	adds r1, r3, 0
_081307FC:
	strh r1, [r4, 0x3C]
	adds r0, r5, 0
	movs r1, 0x3
	bl sub_8077ABC
	lsls r0, 24
	lsrs r0, 24
	strh r0, [r4, 0x22]
	movs r1, 0x2
	ldrsh r0, [r6, r1]
	cmp r0, 0
	bne _08130840
	ldrb r2, [r4, 0x3]
	lsls r1, r2, 26
	lsrs r1, 27
	movs r0, 0x8
	orrs r1, r0
	lsls r1, 1
	subs r0, 0x47
	ands r0, r2
	orrs r0, r1
	strb r0, [r4, 0x3]
	adds r0, r5, 0
	movs r1, 0x4
	bl sub_807A100
	subs r0, 0x8
	b _0813084A
	.align 2, 0
_08130834: .4byte gUnknown_0202F7C9
_08130838: .4byte 0x000003ff
_0813083C: .4byte 0xfffffc00
_08130840:
	adds r0, r5, 0
	movs r1, 0x5
	bl sub_807A100
	adds r0, 0x8
_0813084A:
	strh r0, [r4, 0x20]
	ldr r0, _08130858 @ =sub_813085C
	str r0, [r4, 0x1C]
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_08130858: .4byte sub_813085C
	thumb_func_end sub_81307B0

	thumb_func_start sub_813085C
sub_813085C: @ 813085C
	push {lr}
	adds r2, r0, 0
	movs r0, 0x2E
	ldrsh r1, [r2, r0]
	cmp r1, 0x1
	beq _081308A4
	cmp r1, 0x1
	bgt _08130872
	cmp r1, 0
	beq _0813087C
	b _08130914
_08130872:
	cmp r1, 0x2
	beq _081308B4
	cmp r1, 0x3
	beq _081308DA
	b _08130914
_0813087C:
	ldrh r0, [r2, 0x30]
	adds r0, 0x1
	strh r0, [r2, 0x30]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x1
	ble _08130914
	strh r1, [r2, 0x30]
	ldrh r0, [r2, 0x3C]
	ldrh r1, [r2, 0x24]
	adds r0, r1
	strh r0, [r2, 0x24]
	ldrh r0, [r2, 0x32]
	adds r0, 0x1
	strh r0, [r2, 0x32]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0xC
	bne _08130914
	b _081308D2
_081308A4:
	ldrh r0, [r2, 0x30]
	adds r0, 0x1
	strh r0, [r2, 0x30]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x8
	bne _08130914
	b _081308CE
_081308B4:
	movs r0, 0x3C
	ldrsh r1, [r2, r0]
	lsls r1, 2
	ldrh r0, [r2, 0x24]
	subs r0, r1
	strh r0, [r2, 0x24]
	ldrh r0, [r2, 0x30]
	adds r0, 0x1
	strh r0, [r2, 0x30]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x6
	bne _08130914
_081308CE:
	movs r0, 0
	strh r0, [r2, 0x30]
_081308D2:
	ldrh r0, [r2, 0x2E]
	adds r0, 0x1
	strh r0, [r2, 0x2E]
	b _08130914
_081308DA:
	movs r0, 0x3C
	ldrsh r1, [r2, r0]
	lsls r0, r1, 1
	adds r0, r1
	ldrh r1, [r2, 0x24]
	adds r0, r1
	strh r0, [r2, 0x24]
	ldrh r0, [r2, 0x30]
	adds r0, 0x1
	strh r0, [r2, 0x30]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x8
	bne _08130914
	ldrh r0, [r2, 0x3A]
	subs r0, 0x1
	strh r0, [r2, 0x3A]
	lsls r0, 16
	cmp r0, 0
	beq _0813090E
	movs r0, 0
	strh r0, [r2, 0x30]
	ldrh r0, [r2, 0x2E]
	subs r0, 0x1
	strh r0, [r2, 0x2E]
	b _08130914
_0813090E:
	adds r0, r2, 0
	bl move_anim_8072740
_08130914:
	pop {r0}
	bx r0
	thumb_func_end sub_813085C

	thumb_func_start sub_8130918
sub_8130918: @ 8130918
	push {r4,lr}
	lsls r0, 24
	lsrs r1, r0, 24
	ldr r2, _08130930 @ =gBattleAnimArgs
	movs r3, 0
	ldrsh r0, [r2, r3]
	cmp r0, 0
	bne _08130934
	adds r0, r1, 0
	bl move_anim_task_del
	b _0813095C
	.align 2, 0
_08130930: .4byte gBattleAnimArgs
_08130934:
	ldr r0, _08130964 @ =gTasks
	lsls r4, r1, 2
	adds r4, r1
	lsls r4, 3
	adds r4, r0
	ldrh r0, [r2, 0x2]
	strh r0, [r4, 0x8]
	ldrb r0, [r2]
	bl obj_id_for_side_relative_to_move
	adds r1, r0, 0
	lsls r1, 24
	lsrs r1, 24
	strh r1, [r4, 0x26]
	ldr r2, _08130968 @ =gUnknown_084029DC
	adds r0, r4, 0
	bl sub_80798F4
	ldr r0, _0813096C @ =sub_8130970
	str r0, [r4]
_0813095C:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08130964: .4byte gTasks
_08130968: .4byte gUnknown_084029DC
_0813096C: .4byte sub_8130970
	thumb_func_end sub_8130918

	thumb_func_start sub_8130970
sub_8130970: @ 8130970
	push {r4-r6,lr}
	lsls r0, 24
	lsrs r6, r0, 24
	lsls r0, r6, 2
	adds r0, r6
	lsls r0, 3
	ldr r1, _081309B0 @ =gTasks
	adds r4, r0, r1
	ldrh r0, [r4, 0xA]
	adds r0, 0x1
	strh r0, [r4, 0xA]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x1
	ble _081309CA
	movs r0, 0
	strh r0, [r4, 0xA]
	ldrh r1, [r4, 0xC]
	movs r0, 0x1
	ands r0, r1
	cmp r0, 0
	bne _081309B8
	ldr r2, _081309B4 @ =gSprites
	movs r0, 0x26
	ldrsh r1, [r4, r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r2
	movs r1, 0x2
	b _081309C8
	.align 2, 0
_081309B0: .4byte gTasks
_081309B4: .4byte gSprites
_081309B8:
	ldr r2, _08130A10 @ =gSprites
	movs r0, 0x26
	ldrsh r1, [r4, r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r2
	ldr r1, _08130A14 @ =0x0000fffe
_081309C8:
	strh r1, [r0, 0x24]
_081309CA:
	adds r0, r4, 0
	bl sub_807992C
	lsls r0, 24
	lsrs r5, r0, 24
	cmp r5, 0
	bne _08130A26
	ldr r2, _08130A10 @ =gSprites
	movs r0, 0x26
	ldrsh r1, [r4, r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r2
	strh r5, [r0, 0x24]
	ldrh r0, [r4, 0x8]
	subs r0, 0x1
	strh r0, [r4, 0x8]
	lsls r0, 16
	cmp r0, 0
	beq _08130A20
	lsls r0, r6, 2
	adds r0, r6
	lsls r0, 3
	ldr r1, _08130A18 @ =gTasks
	adds r0, r1
	ldrh r1, [r0, 0x26]
	lsls r1, 24
	lsrs r1, 24
	ldr r2, _08130A1C @ =gUnknown_084029DC
	bl sub_80798F4
	strh r5, [r4, 0xA]
	strh r5, [r4, 0xC]
	b _08130A26
	.align 2, 0
_08130A10: .4byte gSprites
_08130A14: .4byte 0x0000fffe
_08130A18: .4byte gTasks
_08130A1C: .4byte gUnknown_084029DC
_08130A20:
	adds r0, r6, 0
	bl move_anim_task_del
_08130A26:
	pop {r4-r6}
	pop {r0}
	bx r0
	thumb_func_end sub_8130970

	thumb_func_start sub_8130A2C
sub_8130A2C: @ 8130A2C
	push {r4,r5,lr}
	adds r5, r0, 0
	ldr r0, _08130A40 @ =gBattleAnimArgs
	movs r1, 0
	ldrsh r0, [r0, r1]
	cmp r0, 0
	bne _08130A48
	ldr r4, _08130A44 @ =gUnknown_0202F7C8
	b _08130A4A
	.align 2, 0
_08130A40: .4byte gBattleAnimArgs
_08130A44: .4byte gUnknown_0202F7C8
_08130A48:
	ldr r4, _08130A88 @ =gUnknown_0202F7C9
_08130A4A:
	ldrb r0, [r4]
	movs r1, 0x2
	bl sub_8077ABC
	lsls r0, 24
	lsrs r0, 24
	strh r0, [r5, 0x20]
	ldrb r0, [r4]
	movs r1, 0x2
	bl sub_807A100
	strh r0, [r5, 0x22]
	movs r1, 0x22
	ldrsh r0, [r5, r1]
	cmp r0, 0x7
	bgt _08130A6E
	movs r0, 0x8
	strh r0, [r5, 0x22]
_08130A6E:
	movs r2, 0
	strh r2, [r5, 0x2E]
	ldr r1, _08130A8C @ =gBattleAnimArgs
	ldrh r0, [r1, 0x2]
	strh r0, [r5, 0x30]
	strh r2, [r5, 0x32]
	ldrh r0, [r1, 0x4]
	strh r0, [r5, 0x34]
	ldr r0, _08130A90 @ =sub_8130A94
	str r0, [r5, 0x1C]
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_08130A88: .4byte gUnknown_0202F7C9
_08130A8C: .4byte gBattleAnimArgs
_08130A90: .4byte sub_8130A94
	thumb_func_end sub_8130A2C

	thumb_func_start sub_8130A94
sub_8130A94: @ 8130A94
	push {lr}
	adds r3, r0, 0
	ldrh r0, [r3, 0x2E]
	adds r0, 0x1
	strh r0, [r3, 0x2E]
	lsls r0, 16
	asrs r0, 16
	movs r2, 0x30
	ldrsh r1, [r3, r2]
	cmp r0, r1
	blt _08130AE8
	movs r0, 0
	strh r0, [r3, 0x2E]
	ldrh r1, [r3, 0x32]
	adds r1, 0x1
	movs r0, 0x1
	ands r1, r0
	strh r1, [r3, 0x32]
	movs r0, 0x3E
	adds r0, r3
	mov r12, r0
	lsls r1, 2
	ldrb r2, [r0]
	movs r0, 0x5
	negs r0, r0
	ands r0, r2
	orrs r0, r1
	mov r1, r12
	strb r0, [r1]
	movs r2, 0x32
	ldrsh r0, [r3, r2]
	cmp r0, 0
	beq _08130AE8
	ldrh r0, [r3, 0x34]
	subs r0, 0x1
	strh r0, [r3, 0x34]
	lsls r0, 16
	cmp r0, 0
	bne _08130AE8
	adds r0, r3, 0
	bl move_anim_8072740
_08130AE8:
	pop {r0}
	bx r0
	thumb_func_end sub_8130A94

	thumb_func_start sub_8130AEC
sub_8130AEC: @ 8130AEC
	push {lr}
	adds r3, r0, 0
	ldr r0, _08130B18 @ =gBattleAnimArgs
	movs r1, 0
	ldrsh r0, [r0, r1]
	cmp r0, 0
	bne _08130B1C
	ldrb r2, [r3, 0x3]
	lsls r1, r2, 26
	lsrs r1, 27
	movs r0, 0x8
	orrs r1, r0
	lsls r1, 1
	subs r0, 0x47
	ands r0, r2
	orrs r0, r1
	strb r0, [r3, 0x3]
	movs r0, 0x64
	strh r0, [r3, 0x20]
	movs r0, 0x1
	b _08130B22
	.align 2, 0
_08130B18: .4byte gBattleAnimArgs
_08130B1C:
	movs r0, 0x8C
	strh r0, [r3, 0x20]
	ldr r0, _08130B30 @ =0x0000ffff
_08130B22:
	strh r0, [r3, 0x3C]
	movs r0, 0x38
	strh r0, [r3, 0x22]
	ldr r0, _08130B34 @ =sub_8130B38
	str r0, [r3, 0x1C]
	pop {r0}
	bx r0
	.align 2, 0
_08130B30: .4byte 0x0000ffff
_08130B34: .4byte sub_8130B38
	thumb_func_end sub_8130AEC

	thumb_func_start sub_8130B38
sub_8130B38: @ 8130B38
	push {r4,lr}
	adds r4, r0, 0
	movs r1, 0x2E
	ldrsh r0, [r4, r1]
	cmp r0, 0x8
	bls _08130B46
	b _08130D18
_08130B46:
	lsls r0, 2
	ldr r1, _08130B50 @ =_08130B54
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_08130B50: .4byte _08130B54
	.align 2, 0
_08130B54:
	.4byte _08130B78
	.4byte _08130BAA
	.4byte _08130BBC
	.4byte _08130BFC
	.4byte _08130C0E
	.4byte _08130C4C
	.4byte _08130CB0
	.4byte _08130CD0
	.4byte _08130CF6
_08130B78:
	movs r3, 0x3C
	ldrsh r0, [r4, r3]
	lsls r0, 1
	ldrh r1, [r4, 0x22]
	subs r1, r0
	strh r1, [r4, 0x22]
	ldrh r2, [r4, 0x30]
	movs r0, 0x1
	ands r0, r2
	cmp r0, 0
	beq _08130B9A
	movs r0, 0x3C
	ldrsh r1, [r4, r0]
	lsls r1, 1
	ldrh r0, [r4, 0x20]
	subs r0, r1
	strh r0, [r4, 0x20]
_08130B9A:
	adds r0, r2, 0x1
	strh r0, [r4, 0x30]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x9
	beq _08130BA8
	b _08130D18
_08130BA8:
	b _08130CEA
_08130BAA:
	ldrh r0, [r4, 0x30]
	adds r0, 0x1
	strh r0, [r4, 0x30]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x4
	beq _08130BBA
	b _08130D18
_08130BBA:
	b _08130CEA
_08130BBC:
	ldrh r2, [r4, 0x30]
	adds r2, 0x1
	strh r2, [r4, 0x30]
	movs r3, 0x3C
	ldrsh r1, [r4, r3]
	lsls r0, r1, 1
	adds r0, r1
	ldrh r1, [r4, 0x22]
	adds r0, r1
	strh r0, [r4, 0x22]
	ldr r3, _08130BF8 @ =gSineTable
	movs r0, 0x30
	ldrsh r1, [r4, r0]
	lsls r0, r1, 2
	adds r0, r1
	lsls r0, 2
	adds r0, r3
	ldrh r0, [r0]
	lsls r0, 16
	asrs r0, 19
	ldrh r1, [r4, 0x3C]
	muls r0, r1
	strh r0, [r4, 0x24]
	lsls r2, 16
	asrs r2, 16
	cmp r2, 0xC
	beq _08130BF4
	b _08130D18
_08130BF4:
	b _08130CEA
	.align 2, 0
_08130BF8: .4byte gSineTable
_08130BFC:
	ldrh r0, [r4, 0x30]
	adds r0, 0x1
	strh r0, [r4, 0x30]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x2
	beq _08130C0C
	b _08130D18
_08130C0C:
	b _08130CEA
_08130C0E:
	ldrh r2, [r4, 0x30]
	adds r2, 0x1
	strh r2, [r4, 0x30]
	movs r1, 0x3C
	ldrsh r0, [r4, r1]
	lsls r1, r0, 1
	adds r1, r0
	ldrh r0, [r4, 0x22]
	subs r0, r1
	strh r0, [r4, 0x22]
	ldr r3, _08130C48 @ =gSineTable
	movs r0, 0x30
	ldrsh r1, [r4, r0]
	lsls r0, r1, 2
	adds r0, r1
	lsls r0, 2
	adds r0, r3
	ldrh r0, [r0]
	lsls r0, 16
	asrs r0, 19
	ldrh r1, [r4, 0x3C]
	muls r0, r1
	strh r0, [r4, 0x24]
	lsls r2, 16
	asrs r2, 16
	cmp r2, 0xC
	bne _08130D18
	b _08130CEE
	.align 2, 0
_08130C48: .4byte gSineTable
_08130C4C:
	ldrh r2, [r4, 0x30]
	adds r2, 0x1
	strh r2, [r4, 0x30]
	movs r3, 0x3C
	ldrsh r1, [r4, r3]
	lsls r0, r1, 1
	adds r0, r1
	ldrh r1, [r4, 0x22]
	adds r0, r1
	strh r0, [r4, 0x22]
	ldr r3, _08130CA4 @ =gSineTable
	movs r0, 0x30
	ldrsh r1, [r4, r0]
	lsls r0, r1, 2
	adds r0, r1
	lsls r0, 2
	adds r0, r3
	ldrh r0, [r0]
	lsls r0, 16
	asrs r0, 19
	ldrh r1, [r4, 0x3C]
	muls r0, r1
	strh r0, [r4, 0x24]
	lsls r2, 16
	asrs r2, 16
	cmp r2, 0xF
	bne _08130C98
	ldrh r2, [r4, 0x4]
	lsls r1, r2, 22
	lsrs r1, 22
	adds r1, 0x10
	ldr r3, _08130CA8 @ =0x000003ff
	adds r0, r3, 0
	ands r1, r0
	ldr r0, _08130CAC @ =0xfffffc00
	ands r0, r2
	orrs r0, r1
	strh r0, [r4, 0x4]
_08130C98:
	movs r1, 0x30
	ldrsh r0, [r4, r1]
	cmp r0, 0x12
	bne _08130D18
	b _08130CEA
	.align 2, 0
_08130CA4: .4byte gSineTable
_08130CA8: .4byte 0x000003ff
_08130CAC: .4byte 0xfffffc00
_08130CB0:
	movs r3, 0x3C
	ldrsh r0, [r4, r3]
	lsls r1, r0, 1
	adds r1, r0
	lsls r1, 1
	ldrh r0, [r4, 0x20]
	adds r1, r0
	strh r1, [r4, 0x20]
	ldrh r0, [r4, 0x30]
	adds r0, 0x1
	strh r0, [r4, 0x30]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x9
	bne _08130D18
	b _08130CEA
_08130CD0:
	movs r1, 0x3C
	ldrsh r0, [r4, r1]
	lsls r0, 1
	ldrh r3, [r4, 0x20]
	adds r0, r3
	strh r0, [r4, 0x20]
	ldrh r0, [r4, 0x30]
	adds r0, 0x1
	strh r0, [r4, 0x30]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x1
	bne _08130D18
_08130CEA:
	movs r0, 0
	strh r0, [r4, 0x30]
_08130CEE:
	ldrh r0, [r4, 0x2E]
	adds r0, 0x1
	strh r0, [r4, 0x2E]
	b _08130D18
_08130CF6:
	movs r1, 0x3C
	ldrsh r0, [r4, r1]
	lsls r1, r0, 1
	adds r1, r0
	ldrh r0, [r4, 0x20]
	subs r0, r1
	strh r0, [r4, 0x20]
	ldrh r0, [r4, 0x30]
	adds r0, 0x1
	strh r0, [r4, 0x30]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x5
	bne _08130D18
	adds r0, r4, 0
	bl move_anim_8072740
_08130D18:
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end sub_8130B38

	thumb_func_start sub_8130D20
sub_8130D20: @ 8130D20
	push {r4-r7,lr}
	lsls r0, 24
	lsrs r0, 24
	lsls r1, r0, 2
	adds r1, r0
	lsls r1, 3
	ldr r0, _08130D7C @ =gTasks
	adds r6, r1, r0
	movs r0, 0
	bl obj_id_for_side_relative_to_move
	lsls r0, 24
	lsrs r0, 24
	strh r0, [r6, 0x26]
	bl sub_8076BE0
	lsls r0, 24
	cmp r0, 0
	bne _08130DA8
	bl IsDoubleBattle
	lsls r0, 24
	lsrs r7, r0, 24
	cmp r7, 0x1
	bne _08130D8C
	ldr r5, _08130D80 @ =gUnknown_0202F7C8
	ldrb r0, [r5]
	movs r1, 0
	bl sub_8077ABC
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	ldrb r1, [r5]
	movs r0, 0x2
	eors r0, r1
	movs r1, 0
	bl sub_8077ABC
	lsls r0, 24
	lsrs r0, 24
	cmp r4, r0
	ble _08130D84
	strh r7, [r6, 0x24]
	b _08130DAC
	.align 2, 0
_08130D7C: .4byte gTasks
_08130D80: .4byte gUnknown_0202F7C8
_08130D84:
	ldr r0, _08130D88 @ =0x0000ffff
	b _08130DAA
	.align 2, 0
_08130D88: .4byte 0x0000ffff
_08130D8C:
	ldr r0, _08130DA0 @ =gUnknown_0202F7C8
	ldrb r0, [r0]
	bl battle_side_get_owner
	lsls r0, 24
	cmp r0, 0
	bne _08130DA8
	ldr r0, _08130DA4 @ =0x0000ffff
	b _08130DAA
	.align 2, 0
_08130DA0: .4byte gUnknown_0202F7C8
_08130DA4: .4byte 0x0000ffff
_08130DA8:
	movs r0, 0x1
_08130DAA:
	strh r0, [r6, 0x24]
_08130DAC:
	ldr r0, _08130DB8 @ =sub_8130DBC
	str r0, [r6]
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_08130DB8: .4byte sub_8130DBC
	thumb_func_end sub_8130D20

	thumb_func_start sub_8130DBC
sub_8130DBC: @ 8130DBC
	push {r4,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	lsls r0, r4, 2
	adds r0, r4
	lsls r0, 3
	ldr r1, _08130DE0 @ =gTasks
	adds r3, r0, r1
	movs r1, 0x8
	ldrsh r0, [r3, r1]
	cmp r0, 0x8
	bls _08130DD6
	b _08130F50
_08130DD6:
	lsls r0, 2
	ldr r1, _08130DE4 @ =_08130DE8
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_08130DE0: .4byte gTasks
_08130DE4: .4byte _08130DE8
	.align 2, 0
_08130DE8:
	.4byte _08130E0C
	.4byte _08130E1E
	.4byte _08130E50
	.4byte _08130E80
	.4byte _08130EA6
	.4byte _08130ED0
	.4byte _08130EE0
	.4byte _08130F00
	.4byte _08130F38
_08130E0C:
	ldrh r0, [r3, 0xA]
	adds r0, 0x1
	strh r0, [r3, 0xA]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0xD
	beq _08130E1C
	b _08130F50
_08130E1C:
	b _08130F28
_08130E1E:
	ldr r2, _08130E4C @ =gSprites
	movs r1, 0x26
	ldrsh r0, [r3, r1]
	lsls r1, r0, 4
	adds r1, r0
	lsls r1, 2
	adds r1, r2
	movs r2, 0x24
	ldrsh r0, [r3, r2]
	lsls r2, r0, 1
	adds r2, r0
	ldrh r0, [r1, 0x24]
	subs r0, r2
	strh r0, [r1, 0x24]
	ldrh r0, [r3, 0xA]
	adds r0, 0x1
	strh r0, [r3, 0xA]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x6
	beq _08130E4A
	b _08130F50
_08130E4A:
	b _08130F28
	.align 2, 0
_08130E4C: .4byte gSprites
_08130E50:
	ldr r2, _08130E7C @ =gSprites
	movs r1, 0x26
	ldrsh r0, [r3, r1]
	lsls r1, r0, 4
	adds r1, r0
	lsls r1, 2
	adds r1, r2
	movs r0, 0x24
	ldrsh r2, [r3, r0]
	lsls r0, r2, 1
	adds r0, r2
	ldrh r2, [r1, 0x24]
	adds r0, r2
	strh r0, [r1, 0x24]
	ldrh r0, [r3, 0xA]
	adds r0, 0x1
	strh r0, [r3, 0xA]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x6
	bne _08130F50
	b _08130F28
	.align 2, 0
_08130E7C: .4byte gSprites
_08130E80:
	ldrh r0, [r3, 0xA]
	adds r0, 0x1
	strh r0, [r3, 0xA]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x2
	bne _08130F50
	movs r0, 0
	strh r0, [r3, 0xA]
	ldrh r1, [r3, 0xC]
	movs r2, 0xC
	ldrsh r0, [r3, r2]
	cmp r0, 0
	bne _08130F2C
	adds r0, r1, 0x1
	strh r0, [r3, 0xC]
	movs r0, 0x1
	strh r0, [r3, 0x8]
	b _08130F50
_08130EA6:
	ldr r2, _08130ECC @ =gSprites
	movs r0, 0x26
	ldrsh r1, [r3, r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r2
	ldrh r1, [r3, 0x24]
	ldrh r2, [r0, 0x24]
	adds r1, r2
	strh r1, [r0, 0x24]
	ldrh r0, [r3, 0xA]
	adds r0, 0x1
	strh r0, [r3, 0xA]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x3
	bne _08130F50
	b _08130F28
	.align 2, 0
_08130ECC: .4byte gSprites
_08130ED0:
	ldrh r0, [r3, 0xA]
	adds r0, 0x1
	strh r0, [r3, 0xA]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x6
	bne _08130F50
	b _08130F28
_08130EE0:
	ldr r2, _08130EFC @ =gSprites
	movs r1, 0x26
	ldrsh r0, [r3, r1]
	lsls r1, r0, 4
	adds r1, r0
	lsls r1, 2
	adds r1, r2
	movs r0, 0x24
	ldrsh r2, [r3, r0]
	lsls r2, 2
	ldrh r0, [r1, 0x24]
	subs r0, r2
	b _08130F18
	.align 2, 0
_08130EFC: .4byte gSprites
_08130F00:
	ldr r2, _08130F34 @ =gSprites
	movs r1, 0x26
	ldrsh r0, [r3, r1]
	lsls r1, r0, 4
	adds r1, r0
	lsls r1, 2
	adds r1, r2
	movs r2, 0x24
	ldrsh r0, [r3, r2]
	lsls r0, 2
	ldrh r2, [r1, 0x24]
	adds r0, r2
_08130F18:
	strh r0, [r1, 0x24]
	ldrh r0, [r3, 0xA]
	adds r0, 0x1
	strh r0, [r3, 0xA]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x5
	bne _08130F50
_08130F28:
	movs r0, 0
	strh r0, [r3, 0xA]
_08130F2C:
	ldrh r0, [r3, 0x8]
	adds r0, 0x1
	strh r0, [r3, 0x8]
	b _08130F50
	.align 2, 0
_08130F34: .4byte gSprites
_08130F38:
	ldr r2, _08130F58 @ =gSprites
	movs r0, 0x26
	ldrsh r1, [r3, r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r2
	movs r1, 0
	strh r1, [r0, 0x24]
	adds r0, r4, 0
	bl move_anim_task_del
_08130F50:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08130F58: .4byte gSprites
	thumb_func_end sub_8130DBC

	thumb_func_start sub_8130F5C
sub_8130F5C: @ 8130F5C
	push {r4,lr}
	adds r4, r0, 0
	ldr r0, _08130F78 @ =gBattleAnimArgs
	movs r1, 0
	ldrsh r0, [r0, r1]
	cmp r0, 0
	bne _08130F80
	adds r0, r4, 0
	movs r1, 0x1
	bl sub_80787B0
	ldr r0, _08130F7C @ =gUnknown_0202F7C8
	b _08130F82
	.align 2, 0
_08130F78: .4byte gBattleAnimArgs
_08130F7C: .4byte gUnknown_0202F7C8
_08130F80:
	ldr r0, _08130FD8 @ =gUnknown_0202F7C9
_08130F82:
	ldrb r0, [r0]
	strh r0, [r4, 0x3C]
	ldrh r0, [r4, 0x3C]
	lsls r0, 24
	lsrs r0, 24
	bl battle_side_get_owner
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _08130FA6
	ldrb r0, [r4, 0x3]
	movs r1, 0x3F
	negs r1, r1
	ands r1, r0
	movs r0, 0x10
	orrs r1, r0
	strb r1, [r4, 0x3]
_08130FA6:
	ldrh r0, [r4, 0x3C]
	lsls r0, 24
	lsrs r0, 24
	bl sub_8079ED4
	movs r2, 0x3
	ands r2, r0
	lsls r2, 2
	ldrb r3, [r4, 0x5]
	movs r1, 0xD
	negs r1, r1
	adds r0, r1, 0
	ands r0, r3
	orrs r0, r2
	strb r0, [r4, 0x5]
	ldrb r0, [r4, 0x1]
	ands r1, r0
	movs r0, 0x4
	orrs r1, r0
	strb r1, [r4, 0x1]
	ldr r0, _08130FDC @ =sub_8130FE0
	str r0, [r4, 0x1C]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08130FD8: .4byte gUnknown_0202F7C9
_08130FDC: .4byte sub_8130FE0
	thumb_func_end sub_8130F5C

	thumb_func_start sub_8130FE0
sub_8130FE0: @ 8130FE0
	push {r4,r5,lr}
	adds r4, r0, 0
	movs r1, 0x38
	ldrsh r0, [r4, r1]
	cmp r0, 0x4
	bls _08130FEE
	b _081311DE
_08130FEE:
	lsls r0, 2
	ldr r1, _08130FF8 @ =_08130FFC
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_08130FF8: .4byte _08130FFC
	.align 2, 0
_08130FFC:
	.4byte _08131010
	.4byte _08131110
	.4byte _08131178
	.4byte _0813118C
	.4byte _081311D8
_08131010:
	movs r2, 0x3A
	ldrsh r0, [r4, r2]
	cmp r0, 0x5
	bhi _08131040
	lsls r0, 2
	ldr r1, _08131024 @ =_08131028
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_08131024: .4byte _08131028
	.align 2, 0
_08131028:
	.4byte _08131044
	.4byte _08131060
	.4byte _08131082
	.4byte _0813109E
	.4byte _08131044
	.4byte _081310C4
_08131040:
	movs r0, 0
	strh r0, [r4, 0x3A]
_08131044:
	ldrh r0, [r4, 0x3C]
	lsls r0, 24
	lsrs r0, 24
	movs r1, 0x5
	bl sub_807A100
	subs r0, 0x4
	lsls r0, 16
	lsrs r5, r0, 16
	ldrh r0, [r4, 0x3C]
	lsls r0, 24
	lsrs r0, 24
	movs r1, 0x3
	b _081310B8
_08131060:
	ldrh r0, [r4, 0x3C]
	lsls r0, 24
	lsrs r0, 24
	movs r1, 0x5
	bl sub_807A100
	subs r0, 0x4
	lsls r0, 16
	lsrs r5, r0, 16
	ldrh r0, [r4, 0x3C]
	lsls r0, 24
	lsrs r0, 24
	movs r1, 0x2
	bl sub_807A100
	adds r0, 0x4
	b _081310BE
_08131082:
	ldrh r0, [r4, 0x3C]
	lsls r0, 24
	lsrs r0, 24
	movs r1, 0x4
	bl sub_807A100
	adds r0, 0x4
	lsls r0, 16
	lsrs r5, r0, 16
	ldrh r0, [r4, 0x3C]
	lsls r0, 24
	lsrs r0, 24
	movs r1, 0x3
	b _081310B8
_0813109E:
	ldrh r0, [r4, 0x3C]
	lsls r0, 24
	lsrs r0, 24
	movs r1, 0x4
	bl sub_807A100
	adds r0, 0x4
	lsls r0, 16
	lsrs r5, r0, 16
	ldrh r0, [r4, 0x3C]
	lsls r0, 24
	lsrs r0, 24
	movs r1, 0x2
_081310B8:
	bl sub_807A100
	subs r0, 0x4
_081310BE:
	lsls r0, 16
	lsrs r1, r0, 16
	b _081310E4
_081310C4:
	ldrh r0, [r4, 0x3C]
	lsls r0, 24
	lsrs r0, 24
	movs r1, 0x2
	bl sub_8077ABC
	lsls r0, 24
	lsrs r5, r0, 24
	ldrh r0, [r4, 0x3C]
	lsls r0, 24
	lsrs r0, 24
	movs r1, 0x3
	bl sub_8077ABC
	lsls r0, 24
	lsrs r1, r0, 24
_081310E4:
	movs r2, 0x3A
	ldrsh r0, [r4, r2]
	cmp r0, 0x4
	bne _081310F0
	movs r0, 0x18
	b _081310FA
_081310F0:
	cmp r0, 0x5
	bne _081310F8
	movs r0, 0x6
	b _081310FA
_081310F8:
	movs r0, 0xC
_081310FA:
	strh r0, [r4, 0x2E]
	ldrh r0, [r4, 0x20]
	strh r0, [r4, 0x30]
	strh r5, [r4, 0x32]
	ldrh r0, [r4, 0x22]
	strh r0, [r4, 0x34]
	strh r1, [r4, 0x36]
	adds r0, r4, 0
	bl obj_translate_based_on_private_1_2_3_4
	b _081311CA
_08131110:
	adds r0, r4, 0
	bl sub_8078B5C
	lsls r0, 24
	cmp r0, 0
	beq _081311DE
	movs r1, 0x3A
	ldrsh r0, [r4, r1]
	cmp r0, 0x4
	beq _08131148
	cmp r0, 0x5
	beq _08131168
	ldrh r0, [r4, 0x24]
	ldrh r2, [r4, 0x20]
	adds r0, r2
	movs r1, 0
	strh r0, [r4, 0x20]
	ldrh r0, [r4, 0x26]
	ldrh r2, [r4, 0x22]
	adds r0, r2
	strh r0, [r4, 0x22]
	strh r1, [r4, 0x26]
	strh r1, [r4, 0x24]
	strh r1, [r4, 0x2E]
	ldrh r0, [r4, 0x38]
	adds r0, 0x1
	strh r0, [r4, 0x38]
	b _08131160
_08131148:
	ldrh r0, [r4, 0x24]
	ldrh r1, [r4, 0x20]
	adds r0, r1
	movs r1, 0
	strh r0, [r4, 0x20]
	ldrh r0, [r4, 0x26]
	ldrh r2, [r4, 0x22]
	adds r0, r2
	strh r0, [r4, 0x22]
	strh r1, [r4, 0x26]
	strh r1, [r4, 0x24]
	strh r1, [r4, 0x38]
_08131160:
	ldrh r0, [r4, 0x3A]
	adds r0, 0x1
	strh r0, [r4, 0x3A]
	b _081311DE
_08131168:
	movs r0, 0
	strh r0, [r4, 0x2E]
	movs r1, 0x10
	strh r1, [r4, 0x30]
	strh r0, [r4, 0x32]
	movs r0, 0x3
	strh r0, [r4, 0x38]
	b _081311DE
_08131178:
	ldrh r0, [r4, 0x2E]
	adds r0, 0x1
	strh r0, [r4, 0x2E]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x4
	bne _081311DE
	movs r0, 0
	strh r0, [r4, 0x38]
	b _081311DE
_0813118C:
	ldrh r1, [r4, 0x2E]
	movs r0, 0x1
	ands r0, r1
	cmp r0, 0
	bne _0813119E
	ldrh r0, [r4, 0x30]
	subs r0, 0x1
	strh r0, [r4, 0x30]
	b _081311A4
_0813119E:
	ldrh r0, [r4, 0x32]
	adds r0, 0x1
	strh r0, [r4, 0x32]
_081311A4:
	ldr r2, _081311D4 @ =REG_BLDALPHA
	ldrh r0, [r4, 0x32]
	lsls r0, 8
	ldrh r1, [r4, 0x30]
	orrs r0, r1
	strh r0, [r2]
	ldrh r0, [r4, 0x2E]
	adds r0, 0x1
	strh r0, [r4, 0x2E]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x20
	bne _081311DE
	adds r2, r4, 0
	adds r2, 0x3E
	ldrb r0, [r2]
	movs r1, 0x4
	orrs r0, r1
	strb r0, [r2]
_081311CA:
	ldrh r0, [r4, 0x38]
	adds r0, 0x1
	strh r0, [r4, 0x38]
	b _081311DE
	.align 2, 0
_081311D4: .4byte REG_BLDALPHA
_081311D8:
	adds r0, r4, 0
	bl move_anim_8072740
_081311DE:
	pop {r4,r5}
	pop {r0}
	bx r0
	thumb_func_end sub_8130FE0

	thumb_func_start sub_81311E4
sub_81311E4: @ 81311E4
	push {r4,r5,lr}
	adds r4, r0, 0
	movs r1, 0x32
	ldrsh r0, [r4, r1]
	movs r2, 0x2E
	ldrsh r1, [r4, r2]
	subs r0, r1
	movs r2, 0x38
	ldrsh r1, [r4, r2]
	muls r0, r1
	movs r2, 0x36
	ldrsh r1, [r4, r2]
	bl __divsi3
	adds r5, r0, 0
	strh r5, [r4, 0x24]
	movs r1, 0x34
	ldrsh r0, [r4, r1]
	movs r2, 0x30
	ldrsh r1, [r4, r2]
	subs r0, r1
	movs r2, 0x38
	ldrsh r1, [r4, r2]
	muls r0, r1
	movs r2, 0x36
	ldrsh r1, [r4, r2]
	bl __divsi3
	adds r3, r0, 0
	strh r3, [r4, 0x26]
	ldrh r1, [r4, 0x38]
	movs r0, 0x1
	ands r0, r1
	cmp r0, 0
	bne _08131242
	ldr r0, _08131260 @ =gSpriteTemplate_8402500
	ldrh r1, [r4, 0x20]
	adds r1, r5
	lsls r1, 16
	asrs r1, 16
	ldrh r2, [r4, 0x22]
	adds r2, r3
	lsls r2, 16
	asrs r2, 16
	movs r3, 0x5
	bl CreateSprite
_08131242:
	movs r0, 0x38
	ldrsh r1, [r4, r0]
	movs r2, 0x36
	ldrsh r0, [r4, r2]
	cmp r1, r0
	bne _08131254
	adds r0, r4, 0
	bl move_anim_8072740
_08131254:
	ldrh r0, [r4, 0x38]
	adds r0, 0x1
	strh r0, [r4, 0x38]
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_08131260: .4byte gSpriteTemplate_8402500
	thumb_func_end sub_81311E4

	thumb_func_start sub_8131264
sub_8131264: @ 8131264
	push {r4,r5,lr}
	adds r5, r0, 0
	ldr r4, _081312A0 @ =gUnknown_0202F7C9
	ldrb r0, [r4]
	movs r1, 0x2
	bl sub_8077ABC
	ldrb r0, [r4]
	movs r1, 0x3
	bl sub_8077ABC
	ldrb r0, [r4]
	bl battle_side_get_owner
	lsls r0, 24
	cmp r0, 0
	beq _08131290
	bl sub_8076BE0
	lsls r0, 24
	cmp r0, 0
	beq _081312A8
_08131290:
	ldr r2, _081312A4 @ =gBattleAnimArgs
	ldrh r1, [r5, 0x20]
	ldrh r0, [r2]
	subs r0, r1, r0
	strh r0, [r5, 0x2E]
	ldrh r0, [r2, 0x4]
	subs r1, r0
	b _081312B6
	.align 2, 0
_081312A0: .4byte gUnknown_0202F7C9
_081312A4: .4byte gBattleAnimArgs
_081312A8:
	ldr r2, _081312DC @ =gBattleAnimArgs
	ldrh r1, [r5, 0x20]
	ldrh r0, [r2]
	adds r0, r1, r0
	strh r0, [r5, 0x2E]
	ldrh r0, [r2, 0x4]
	adds r1, r0
_081312B6:
	strh r1, [r5, 0x32]
	adds r3, r2, 0
	ldrh r1, [r5, 0x22]
	ldrh r2, [r3, 0x2]
	adds r2, r1, r2
	strh r2, [r5, 0x30]
	ldrh r0, [r3, 0x6]
	adds r1, r0
	strh r1, [r5, 0x34]
	ldrh r0, [r3, 0x8]
	strh r0, [r5, 0x36]
	ldrh r0, [r5, 0x2E]
	strh r0, [r5, 0x20]
	strh r2, [r5, 0x22]
	ldr r0, _081312E0 @ =sub_81311E4
	str r0, [r5, 0x1C]
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_081312DC: .4byte gBattleAnimArgs
_081312E0: .4byte sub_81311E4
	thumb_func_end sub_8131264

	thumb_func_start sub_81312E4
sub_81312E4: @ 81312E4
	push {r4-r7,lr}
	mov r7, r9
	mov r6, r8
	push {r6,r7}
	lsls r0, 24
	lsrs r6, r0, 24
	movs r0, 0
	bl obj_id_for_side_relative_to_move
	lsls r0, 24
	lsrs r5, r0, 24
	adds r2, r5, 0
	ldr r0, _08131328 @ =gTasks
	mov r9, r0
	lsls r7, r6, 2
	adds r0, r7, r6
	lsls r0, 3
	mov r8, r0
	mov r4, r8
	add r4, r9
	movs r1, 0x8
	ldrsh r0, [r4, r1]
	cmp r0, 0
	bne _0813132C
	adds r0, r5, 0
	movs r1, 0
	bl sub_8078E70
	movs r0, 0x80
	lsls r0, 1
	strh r0, [r4, 0xA]
	strh r0, [r4, 0xC]
	b _08131378
	.align 2, 0
_08131328: .4byte gTasks
_0813132C:
	cmp r0, 0x1
	bne _08131384
	ldrh r0, [r4, 0xA]
	adds r0, 0x60
	strh r0, [r4, 0xA]
	ldrh r0, [r4, 0xC]
	subs r0, 0xD
	strh r0, [r4, 0xC]
	movs r2, 0xA
	ldrsh r1, [r4, r2]
	movs r0, 0xC
	ldrsh r2, [r4, r0]
	adds r0, r5, 0
	movs r3, 0
	bl obj_id_set_rotscale
	ldrh r0, [r4, 0xE]
	adds r0, 0x1
	strh r0, [r4, 0xE]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x9
	bne _081313E8
	movs r0, 0
	strh r0, [r4, 0xE]
	adds r0, r5, 0
	bl sub_8078F40
	ldr r1, _08131380 @ =gSprites
	lsls r0, r5, 4
	adds r0, r5
	lsls r0, 2
	adds r0, r1
	adds r0, 0x3E
	ldrb r1, [r0]
	movs r2, 0x4
	orrs r1, r2
	strb r1, [r0]
_08131378:
	ldrh r0, [r4, 0x8]
	adds r0, 0x1
	strh r0, [r4, 0x8]
	b _081313E8
	.align 2, 0
_08131380: .4byte gSprites
_08131384:
	ldr r4, _081313F4 @ =gUnknown_0202F7C8
	ldrb r0, [r4]
	movs r1, 0
	bl refresh_graphics_maybe
	bl sub_8076BE0
	lsls r0, 24
	cmp r0, 0
	beq _081313C6
	ldr r3, _081313F8 @ =gSprites
	ldr r2, _081313FC @ =gUnknown_02024BE0
	ldrb r0, [r4]
	adds r0, r2
	ldrb r1, [r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r1, r3, 0
	adds r1, 0x10
	adds r0, r1
	ldr r1, _08131400 @ =gSpriteAffineAnimTable_81E7C18
	str r1, [r0]
	ldrb r0, [r4]
	adds r0, r2
	ldrb r1, [r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r3
	movs r1, 0
	bl StartSpriteAffineAnim
_081313C6:
	mov r4, r9
	adds r3, r7, 0
	ldr r5, _08131404 @ =sub_8131408
	movs r1, 0xF
	mov r2, r8
	adds r0, r4, r2
	adds r0, 0x26
	movs r2, 0
_081313D6:
	strh r2, [r0]
	subs r0, 0x2
	subs r1, 0x1
	cmp r1, 0
	bge _081313D6
	adds r0, r3, r6
	lsls r0, 3
	adds r0, r4
	str r5, [r0]
_081313E8:
	pop {r3,r4}
	mov r8, r3
	mov r9, r4
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_081313F4: .4byte gUnknown_0202F7C8
_081313F8: .4byte gSprites
_081313FC: .4byte gUnknown_02024BE0
_08131400: .4byte gSpriteAffineAnimTable_81E7C18
_08131404: .4byte sub_8131408
	thumb_func_end sub_81312E4

	thumb_func_start sub_8131408
sub_8131408: @ 8131408
	push {r4-r6,lr}
	lsls r0, 24
	lsrs r6, r0, 24
	movs r0, 0
	bl obj_id_for_side_relative_to_move
	lsls r0, 24
	lsrs r3, r0, 24
	ldr r1, _08131434 @ =gTasks
	lsls r0, r6, 2
	adds r0, r6
	lsls r0, 3
	adds r4, r0, r1
	movs r0, 0x8
	ldrsh r5, [r4, r0]
	cmp r5, 0x1
	beq _0813146C
	cmp r5, 0x1
	bgt _08131438
	cmp r5, 0
	beq _08131442
	b _0813155A
	.align 2, 0
_08131434: .4byte gTasks
_08131438:
	cmp r5, 0x2
	beq _081314D8
	cmp r5, 0x3
	beq _08131514
	b _0813155A
_08131442:
	ldr r0, _08131464 @ =gSprites
	lsls r1, r3, 4
	adds r1, r3
	lsls r1, 2
	adds r1, r0
	ldr r0, _08131468 @ =0x0000ff38
	strh r0, [r1, 0x26]
	movs r0, 0xC8
	strh r0, [r1, 0x24]
	adds r1, 0x3E
	ldrb r2, [r1]
	subs r0, 0xCD
	ands r0, r2
	strb r0, [r1]
	strh r5, [r4, 0x1C]
	b _08131506
	.align 2, 0
_08131464: .4byte gSprites
_08131468: .4byte 0x0000ff38
_0813146C:
	ldrh r1, [r4, 0x1C]
	adds r1, 0x70
	movs r5, 0
	strh r1, [r4, 0x1C]
	ldr r2, _081314D0 @ =gSprites
	lsls r0, r3, 4
	adds r0, r3
	lsls r0, 2
	adds r2, r0, r2
	lsls r1, 16
	asrs r1, 24
	ldrh r3, [r2, 0x26]
	adds r1, r3
	strh r1, [r2, 0x26]
	movs r1, 0x22
	ldrsh r0, [r2, r1]
	movs r3, 0x26
	ldrsh r1, [r2, r3]
	adds r0, r1
	movs r1, 0x20
	negs r1, r1
	cmp r0, r1
	blt _0813149C
	strh r5, [r2, 0x24]
_0813149C:
	movs r1, 0x26
	ldrsh r0, [r2, r1]
	cmp r0, 0
	ble _081314A6
	strh r5, [r2, 0x26]
_081314A6:
	movs r3, 0x26
	ldrsh r0, [r2, r3]
	cmp r0, 0
	bne _0813155A
	movs r0, 0x40
	negs r0, r0
	bl sub_8076F98
	adds r1, r0, 0
	lsls r1, 24
	asrs r1, 24
	movs r0, 0x7D
	bl PlaySE12WithPanning
	ldr r1, _081314D4 @ =0xfffff800
	adds r0, r1, 0
	ldrh r2, [r4, 0x1C]
	adds r0, r2
	strh r0, [r4, 0x1C]
	b _08131506
	.align 2, 0
_081314D0: .4byte gSprites
_081314D4: .4byte 0xfffff800
_081314D8:
	ldrh r0, [r4, 0x1C]
	subs r0, 0x70
	strh r0, [r4, 0x1C]
	lsls r0, 16
	cmp r0, 0
	bge _081314E8
	movs r0, 0
	strh r0, [r4, 0x1C]
_081314E8:
	ldr r0, _08131510 @ =gSprites
	lsls r1, r3, 4
	adds r1, r3
	lsls r1, 2
	adds r1, r0
	ldrh r2, [r4, 0x1C]
	lsls r2, 16
	asrs r2, 24
	ldrh r0, [r1, 0x26]
	subs r0, r2
	strh r0, [r1, 0x26]
	movs r3, 0x1C
	ldrsh r0, [r4, r3]
	cmp r0, 0
	bne _0813155A
_08131506:
	ldrh r0, [r4, 0x8]
	adds r0, 0x1
	strh r0, [r4, 0x8]
	b _0813155A
	.align 2, 0
_08131510: .4byte gSprites
_08131514:
	ldrh r0, [r4, 0x1C]
	adds r0, 0x70
	strh r0, [r4, 0x1C]
	ldr r2, _08131560 @ =gSprites
	lsls r1, r3, 4
	adds r1, r3
	lsls r1, 2
	adds r1, r2
	lsls r0, 16
	asrs r0, 24
	ldrh r2, [r1, 0x26]
	adds r0, r2
	strh r0, [r1, 0x26]
	lsls r0, 16
	cmp r0, 0
	ble _08131538
	movs r0, 0
	strh r0, [r1, 0x26]
_08131538:
	movs r3, 0x26
	ldrsh r0, [r1, r3]
	cmp r0, 0
	bne _0813155A
	movs r0, 0x40
	negs r0, r0
	bl sub_8076F98
	adds r1, r0, 0
	lsls r1, 24
	asrs r1, 24
	movs r0, 0x7D
	bl PlaySE12WithPanning
	adds r0, r6, 0
	bl move_anim_task_del
_0813155A:
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_08131560: .4byte gSprites
	thumb_func_end sub_8131408

	thumb_func_start sub_8131564
sub_8131564: @ 8131564
	push {r4,r5,lr}
	adds r5, r0, 0
	ldr r4, _08131588 @ =gUnknown_0202F7C9
	ldrb r0, [r4]
	bl battle_side_get_owner
	lsls r0, 24
	cmp r0, 0
	bne _08131590
	ldrb r0, [r4]
	bl sub_8079E90
	subs r0, 0x2
	adds r1, r5, 0
	adds r1, 0x43
	strb r0, [r1]
	ldr r4, _0813158C @ =0x0000ff70
	b _081315A0
	.align 2, 0
_08131588: .4byte gUnknown_0202F7C9
_0813158C: .4byte 0x0000ff70
_08131590:
	ldrb r0, [r4]
	bl sub_8079E90
	adds r0, 0x2
	adds r1, r5, 0
	adds r1, 0x43
	strb r0, [r1]
	ldr r4, _081315BC @ =0x0000ffa0
_081315A0:
	ldr r0, _081315C0 @ =gUnknown_0202F7C9
	ldrb r0, [r0]
	movs r1, 0x3
	bl sub_8077ABC
	lsls r0, 24
	lsrs r0, 24
	strh r0, [r5, 0x22]
	strh r4, [r5, 0x26]
	ldr r0, _081315C4 @ =sub_81315C8
	str r0, [r5, 0x1C]
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_081315BC: .4byte 0x0000ffa0
_081315C0: .4byte gUnknown_0202F7C9
_081315C4: .4byte sub_81315C8
	thumb_func_end sub_8131564

	thumb_func_start sub_81315C8
sub_81315C8: @ 81315C8
	push {r4,r5,lr}
	adds r4, r0, 0
	movs r1, 0x2E
	ldrsh r0, [r4, r1]
	cmp r0, 0x4
	bls _081315D6
	b _081316F2
_081315D6:
	lsls r0, 2
	ldr r1, _081315E0 @ =_081315E4
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_081315E0: .4byte _081315E4
	.align 2, 0
_081315E4:
	.4byte _081315F8
	.4byte _0813161C
	.4byte _0813165C
	.4byte _0813168C
	.4byte _081316B8
_081315F8:
	ldrh r0, [r4, 0x26]
	adds r0, 0xA
	strh r0, [r4, 0x26]
	lsls r0, 16
	cmp r0, 0
	blt _081316F2
	movs r0, 0x3F
	bl sub_8076F98
	adds r1, r0, 0
	lsls r1, 24
	asrs r1, 24
	movs r0, 0xCD
	bl PlaySE12WithPanning
	movs r0, 0
	strh r0, [r4, 0x26]
	b _081316B0
_0813161C:
	ldrh r1, [r4, 0x30]
	adds r1, 0x4
	movs r5, 0
	strh r1, [r4, 0x30]
	ldr r2, _08131658 @ =gSineTable
	movs r3, 0x30
	ldrsh r0, [r4, r3]
	lsls r0, 1
	adds r0, r2
	ldrh r0, [r0]
	lsls r0, 16
	asrs r0, 19
	negs r0, r0
	strh r0, [r4, 0x26]
	lsls r1, 16
	asrs r1, 16
	cmp r1, 0x7F
	ble _081316F2
	movs r0, 0x3F
	bl sub_8076F98
	adds r1, r0, 0
	lsls r1, 24
	asrs r1, 24
	movs r0, 0xCD
	bl PlaySE12WithPanning
	strh r5, [r4, 0x30]
	strh r5, [r4, 0x26]
	b _081316B0
	.align 2, 0
_08131658: .4byte gSineTable
_0813165C:
	ldrh r1, [r4, 0x30]
	adds r1, 0x6
	movs r3, 0
	strh r1, [r4, 0x30]
	ldr r2, _08131688 @ =gSineTable
	movs r5, 0x30
	ldrsh r0, [r4, r5]
	lsls r0, 1
	adds r0, r2
	ldrh r0, [r0]
	lsls r0, 16
	asrs r0, 20
	negs r0, r0
	strh r0, [r4, 0x26]
	lsls r1, 16
	asrs r1, 16
	cmp r1, 0x7F
	ble _081316F2
	strh r3, [r4, 0x30]
	strh r3, [r4, 0x26]
	b _081316B0
	.align 2, 0
_08131688: .4byte gSineTable
_0813168C:
	ldrh r0, [r4, 0x30]
	adds r0, 0x1
	strh r0, [r4, 0x30]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x8
	ble _081316F2
	movs r0, 0x3F
	bl sub_8076F98
	adds r1, r0, 0
	lsls r1, 24
	asrs r1, 24
	movs r0, 0xC0
	bl PlaySE12WithPanning
	movs r0, 0
	strh r0, [r4, 0x30]
_081316B0:
	ldrh r0, [r4, 0x2E]
	adds r0, 0x1
	strh r0, [r4, 0x2E]
	b _081316F2
_081316B8:
	ldrh r0, [r4, 0x30]
	adds r0, 0x1
	strh r0, [r4, 0x30]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x8
	ble _081316F2
	movs r0, 0
	strh r0, [r4, 0x30]
	ldrh r1, [r4, 0x32]
	adds r1, 0x1
	strh r1, [r4, 0x32]
	movs r0, 0x1
	ands r1, r0
	adds r3, r4, 0
	adds r3, 0x3E
	lsls r1, 2
	ldrb r2, [r3]
	subs r0, 0x6
	ands r0, r2
	orrs r0, r1
	strb r0, [r3]
	movs r1, 0x32
	ldrsh r0, [r4, r1]
	cmp r0, 0x7
	bne _081316F2
	adds r0, r4, 0
	bl move_anim_8072740
_081316F2:
	pop {r4,r5}
	pop {r0}
	bx r0
	thumb_func_end sub_81315C8

	thumb_func_start sub_81316F8
sub_81316F8: @ 81316F8
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	lsls r0, 24
	lsrs r4, r0, 24
	mov r10, r4
	bl sub_8076BE0
	lsls r0, 24
	lsrs r5, r0, 24
	cmp r5, 0
	bne _0813173E
	movs r0, 0x1
	bl duplicate_obj_of_side_rel2move_in_transparent_mode
	lsls r0, 16
	asrs r7, r0, 16
	cmp r7, 0
	blt _0813173E
	movs r0, 0x1
	bl duplicate_obj_of_side_rel2move_in_transparent_mode
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0
	bge _0813174C
	lsls r0, r7, 4
	adds r0, r7
	lsls r0, 2
	ldr r1, _08131748 @ =gSprites
	adds r0, r1
	bl obj_delete_but_dont_free_vram
_0813173E:
	adds r0, r4, 0
	bl move_anim_task_del
	b _081317EE
	.align 2, 0
_08131748: .4byte gSprites
_0813174C:
	ldr r1, _081317FC @ =gSprites
	mov r9, r1
	lsls r1, r0, 4
	mov r8, r1
	add r8, r0
	mov r0, r8
	lsls r0, 2
	mov r8, r0
	mov r4, r8
	add r4, r9
	ldrh r0, [r4, 0x24]
	adds r0, 0x18
	strh r0, [r4, 0x24]
	lsls r6, r7, 4
	adds r6, r7
	lsls r6, 2
	mov r1, r9
	adds r2, r6, r1
	ldrh r0, [r2, 0x24]
	subs r0, 0x18
	strh r0, [r2, 0x24]
	strh r5, [r4, 0x2E]
	strh r5, [r2, 0x2E]
	strh r5, [r4, 0x30]
	strh r5, [r2, 0x30]
	strh r5, [r4, 0x32]
	strh r5, [r2, 0x32]
	movs r0, 0x10
	strh r0, [r4, 0x34]
	ldr r0, _08131800 @ =0x0000fff0
	strh r0, [r2, 0x34]
	strh r5, [r4, 0x36]
	movs r0, 0x80
	strh r0, [r2, 0x36]
	movs r0, 0x18
	strh r0, [r4, 0x38]
	strh r0, [r2, 0x38]
	mov r0, r10
	strh r0, [r4, 0x3A]
	strh r0, [r2, 0x3A]
	strh r5, [r4, 0x3C]
	strh r5, [r2, 0x3C]
	ldr r0, _08131804 @ =gTasks
	mov r1, r10
	lsls r3, r1, 2
	add r3, r10
	lsls r3, 3
	adds r3, r0
	movs r0, 0x2
	strh r0, [r3, 0x8]
	adds r5, r4, 0
	adds r5, 0x3E
	ldrb r1, [r5]
	subs r0, 0x7
	ands r0, r1
	strb r0, [r5]
	adds r5, r2, 0
	adds r5, 0x3E
	ldrb r0, [r5]
	movs r1, 0x4
	orrs r0, r1
	strb r0, [r5]
	ldrb r5, [r4, 0x1]
	movs r1, 0xD
	negs r1, r1
	adds r0, r1, 0
	ands r0, r5
	strb r0, [r4, 0x1]
	ldrb r0, [r2, 0x1]
	ands r1, r0
	strb r1, [r2, 0x1]
	movs r0, 0x1C
	add r9, r0
	add r8, r9
	ldr r0, _08131808 @ =sub_8131838
	mov r1, r8
	str r0, [r1]
	add r6, r9
	str r0, [r6]
	ldr r0, _0813180C @ =sub_8131810
	str r0, [r3]
_081317EE:
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_081317FC: .4byte gSprites
_08131800: .4byte 0x0000fff0
_08131804: .4byte gTasks
_08131808: .4byte sub_8131838
_0813180C: .4byte sub_8131810
	thumb_func_end sub_81316F8

	thumb_func_start sub_8131810
sub_8131810: @ 8131810
	push {lr}
	lsls r0, 24
	lsrs r2, r0, 24
	ldr r1, _08131834 @ =gTasks
	lsls r0, r2, 2
	adds r0, r2
	lsls r0, 3
	adds r0, r1
	movs r1, 0x8
	ldrsh r0, [r0, r1]
	cmp r0, 0
	bne _0813182E
	adds r0, r2, 0
	bl move_anim_task_del
_0813182E:
	pop {r0}
	bx r0
	.align 2, 0
_08131834: .4byte gTasks
	thumb_func_end sub_8131810

	thumb_func_start sub_8131838
sub_8131838: @ 8131838
	push {r4,r5,lr}
	adds r4, r0, 0
	ldrh r0, [r4, 0x30]
	adds r0, 0x1
	movs r5, 0
	strh r0, [r4, 0x30]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x1
	ble _08131868
	strh r5, [r4, 0x30]
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
_08131868:
	ldrh r0, [r4, 0x34]
	ldrh r1, [r4, 0x36]
	adds r0, r1
	movs r1, 0xFF
	ands r0, r1
	strh r0, [r4, 0x36]
	movs r2, 0x36
	ldrsh r0, [r4, r2]
	movs r2, 0x38
	ldrsh r1, [r4, r2]
	bl Cos
	strh r0, [r4, 0x24]
	movs r1, 0x2E
	ldrsh r0, [r4, r1]
	cmp r0, 0
	beq _08131890
	cmp r0, 0x1
	beq _081318A8
	b _081318E6
_08131890:
	ldrh r0, [r4, 0x32]
	adds r0, 0x1
	strh r0, [r4, 0x32]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x3C
	bne _081318E6
	strh r5, [r4, 0x32]
	ldrh r0, [r4, 0x2E]
	adds r0, 0x1
	strh r0, [r4, 0x2E]
	b _081318E6
_081318A8:
	ldrh r0, [r4, 0x32]
	adds r0, 0x1
	strh r0, [r4, 0x32]
	lsls r0, 16
	cmp r0, 0
	ble _081318E6
	strh r5, [r4, 0x32]
	ldrh r0, [r4, 0x38]
	subs r0, 0x2
	strh r0, [r4, 0x38]
	lsls r0, 16
	cmp r0, 0
	bge _081318E6
	ldr r3, _081318EC @ =gTasks
	movs r2, 0x3C
	ldrsh r1, [r4, r2]
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
	bl obj_delete_but_dont_free_vram
_081318E6:
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_081318EC: .4byte gTasks
	thumb_func_end sub_8131838

	thumb_func_start sub_81318F0
sub_81318F0: @ 81318F0
	push {r4,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	ldr r3, _0813193C @ =gBattleAnimArgs
	movs r2, 0
	strh r2, [r3, 0xE]
	ldr r1, _08131940 @ =gUnknown_0202F7BE
	ldrb r0, [r1]
	ldrb r1, [r1]
	adds r0, r1, 0
	subs r0, 0x3D
	lsls r0, 24
	lsrs r0, 24
	adds r2, r1, 0
	cmp r0, 0x1E
	bhi _08131914
	movs r0, 0x1
	strh r0, [r3, 0xE]
_08131914:
	adds r0, r2, 0
	subs r0, 0x5C
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x6C
	bhi _08131924
	movs r0, 0x2
	strh r0, [r3, 0xE]
_08131924:
	lsls r0, r1, 24
	lsrs r0, 24
	cmp r0, 0xC8
	bls _08131930
	movs r0, 0x3
	strh r0, [r3, 0xE]
_08131930:
	adds r0, r4, 0
	bl move_anim_task_del
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0813193C: .4byte gBattleAnimArgs
_08131940: .4byte gUnknown_0202F7BE
	thumb_func_end sub_81318F0

	thumb_func_start sub_8131944
sub_8131944: @ 8131944
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	sub sp, 0x14
	lsls r0, 24
	lsrs r0, 24
	mov r8, r0
	ldr r1, _08131974 @ =gTasks
	lsls r0, 2
	add r0, r8
	lsls r0, 3
	adds r0, r1
	movs r1, 0x8
	ldrsh r0, [r0, r1]
	cmp r0, 0x4
	bls _0813196A
	b _08131EA0
_0813196A:
	lsls r0, 2
	ldr r1, _08131978 @ =_0813197C
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_08131974: .4byte gTasks
_08131978: .4byte _0813197C
	.align 2, 0
_0813197C:
	.4byte _08131990
	.4byte _08131A44
	.4byte _08131C20
	.4byte _08131D40
	.4byte _08131DC4
_08131990:
	movs r0, 0
	bl obj_id_for_side_relative_to_move
	lsls r0, 24
	lsrs r7, r0, 24
	ldr r1, _081319DC @ =gTasks
	mov r2, r8
	lsls r4, r2, 2
	adds r0, r4, r2
	lsls r0, 3
	adds r6, r0, r1
	movs r3, 0x80
	lsls r3, 4
	adds r0, r3, 0
	ldrh r1, [r6, 0xA]
	adds r0, r1
	strh r0, [r6, 0xA]
	ldr r0, _081319E0 @ =gUnknown_0202F7C8
	ldrb r0, [r0]
	bl battle_side_get_owner
	lsls r0, 24
	mov r9, r4
	cmp r0, 0
	bne _081319E8
	ldr r2, _081319E4 @ =gSprites
	lsls r3, r7, 4
	adds r1, r3, r7
	lsls r1, 2
	adds r1, r2
	ldrh r0, [r6, 0xA]
	lsls r0, 16
	asrs r0, 24
	ldrh r4, [r1, 0x24]
	adds r0, r4
	strh r0, [r1, 0x24]
	b _08131A02
	.align 2, 0
_081319DC: .4byte gTasks
_081319E0: .4byte gUnknown_0202F7C8
_081319E4: .4byte gSprites
_081319E8:
	ldr r3, _08131A3C @ =gSprites
	lsls r4, r7, 4
	adds r2, r4, r7
	lsls r2, 2
	adds r2, r3
	ldrh r1, [r6, 0xA]
	lsls r1, 16
	asrs r1, 24
	ldrh r0, [r2, 0x24]
	subs r0, r1
	strh r0, [r2, 0x24]
	adds r2, r3, 0
	adds r3, r4, 0
_08131A02:
	ldr r1, _08131A40 @ =gTasks
	mov r0, r9
	add r0, r8
	lsls r0, 3
	adds r4, r0, r1
	ldrb r0, [r4, 0xA]
	strh r0, [r4, 0xA]
	adds r1, r3, r7
	lsls r1, 2
	adds r1, r2
	ldrh r0, [r1, 0x24]
	ldrh r1, [r1, 0x20]
	adds r0, r1
	lsls r0, 16
	movs r1, 0x80
	lsls r1, 14
	adds r0, r1
	movs r1, 0x98
	lsls r1, 17
	cmp r0, r1
	bhi _08131A2E
	b _08131EA0
_08131A2E:
	movs r0, 0
	strh r0, [r4, 0xA]
	ldrh r0, [r4, 0x8]
	adds r0, 0x1
	strh r0, [r4, 0x8]
	b _08131EA0
	.align 2, 0
_08131A3C: .4byte gSprites
_08131A40: .4byte gTasks
_08131A44:
	bl sub_8076BE0
	lsls r0, 24
	cmp r0, 0
	beq _08131A74
	ldr r0, _08131A6C @ =0x02019348
	ldr r2, [r0, 0x8]
	mov r10, r2
	ldr r3, [r0, 0xC]
	mov r9, r3
	ldrh r5, [r0]
	ldr r0, _08131A70 @ =gUnknown_0202F7C8
	ldrb r0, [r0]
	bl sub_8079E90
	lsls r0, 24
	lsrs r4, r0, 24
	movs r7, 0
	b _08131B92
	.align 2, 0
_08131A6C: .4byte 0x02019348
_08131A70: .4byte gUnknown_0202F7C8
_08131A74:
	ldr r4, _08131AD4 @ =gUnknown_0202F7C8
	ldrb r0, [r4]
	bl battle_side_get_owner
	lsls r0, 24
	cmp r0, 0
	bne _08131B10
	ldr r7, _08131AD8 @ =gUnknown_02024A6A
	ldrb r0, [r4]
	lsls r0, 1
	adds r0, r7
	ldrh r0, [r0]
	movs r6, 0x64
	muls r0, r6
	ldr r5, _08131ADC @ =gPlayerParty
	adds r0, r5
	movs r1, 0
	bl GetMonData
	mov r10, r0
	ldrb r0, [r4]
	lsls r0, 1
	adds r0, r7
	ldrh r0, [r0]
	muls r0, r6
	adds r0, r5
	movs r1, 0x1
	bl GetMonData
	mov r9, r0
	ldrb r2, [r4]
	lsls r1, r2, 2
	ldr r0, _08131AE0 @ =0x02017800
	adds r1, r0
	ldrh r0, [r1, 0x2]
	cmp r0, 0
	bne _08131AE4
	lsls r0, r2, 1
	adds r0, r7
	ldrh r0, [r0]
	muls r0, r6
	adds r0, r5
	movs r1, 0xB
	bl GetMonData
	lsls r0, 16
	lsrs r5, r0, 16
	b _08131AE6
	.align 2, 0
_08131AD4: .4byte gUnknown_0202F7C8
_08131AD8: .4byte gUnknown_02024A6A
_08131ADC: .4byte gPlayerParty
_08131AE0: .4byte 0x02017800
_08131AE4:
	ldrh r5, [r1, 0x2]
_08131AE6:
	movs r0, 0x1
	bl obj_id_for_side_relative_to_move
	ldr r2, _08131B0C @ =gSprites
	lsls r0, 24
	lsrs r0, 24
	lsls r1, r0, 4
	adds r1, r0
	lsls r1, 2
	adds r1, r2
	adds r1, 0x43
	ldrb r0, [r1]
	adds r0, 0x1
	lsls r0, 24
	lsrs r4, r0, 24
	movs r7, 0
	movs r6, 0x88
	lsls r6, 1
	b _08131B94
	.align 2, 0
_08131B0C: .4byte gSprites
_08131B10:
	ldr r7, _08131B64 @ =gUnknown_02024A6A
	ldrb r0, [r4]
	lsls r0, 1
	adds r0, r7
	ldrh r0, [r0]
	movs r6, 0x64
	muls r0, r6
	ldr r5, _08131B68 @ =gEnemyParty
	adds r0, r5
	movs r1, 0
	bl GetMonData
	mov r10, r0
	ldrb r0, [r4]
	lsls r0, 1
	adds r0, r7
	ldrh r0, [r0]
	muls r0, r6
	adds r0, r5
	movs r1, 0x1
	bl GetMonData
	mov r9, r0
	ldrb r2, [r4]
	lsls r1, r2, 2
	ldr r0, _08131B6C @ =0x02017800
	adds r1, r0
	ldrh r0, [r1, 0x2]
	cmp r0, 0
	bne _08131B70
	lsls r0, r2, 1
	adds r0, r7
	ldrh r0, [r0]
	muls r0, r6
	adds r0, r5
	movs r1, 0xB
	bl GetMonData
	lsls r0, 16
	lsrs r5, r0, 16
	b _08131B72
	.align 2, 0
_08131B64: .4byte gUnknown_02024A6A
_08131B68: .4byte gEnemyParty
_08131B6C: .4byte 0x02017800
_08131B70:
	ldrh r5, [r1, 0x2]
_08131B72:
	movs r0, 0x1
	bl obj_id_for_side_relative_to_move
	ldr r2, _08131C04 @ =gSprites
	lsls r0, 24
	lsrs r0, 24
	lsls r1, r0, 4
	adds r1, r0
	lsls r1, 2
	adds r1, r2
	adds r1, 0x43
	ldrb r0, [r1]
	subs r0, 0x1
	lsls r0, 24
	lsrs r4, r0, 24
	movs r7, 0x1
_08131B92:
	ldr r6, _08131C08 @ =0x0000ffe0
_08131B94:
	ldr r0, _08131C0C @ =gUnknown_0202F7C9
	ldrb r0, [r0]
	movs r1, 0x1
	bl sub_8077ABC
	lsls r0, 24
	lsrs r0, 24
	lsls r3, r6, 16
	asrs r3, 16
	str r0, [sp]
	str r4, [sp, 0x4]
	mov r4, r10
	str r4, [sp, 0x8]
	mov r0, r9
	str r0, [sp, 0xC]
	adds r0, r5, 0
	adds r1, r7, 0
	movs r2, 0
	bl sub_8079F44
	lsls r0, 24
	lsrs r5, r0, 24
	ldr r0, _08131C10 @ =gUnknown_0202F7C8
	ldrb r0, [r0]
	lsls r0, 2
	ldr r1, _08131C14 @ =0x02017800
	adds r0, r1
	ldrh r0, [r0, 0x2]
	cmp r0, 0
	beq _08131BF2
	ldr r1, _08131C04 @ =gSprites
	lsls r0, r5, 4
	adds r0, r5
	lsls r0, 2
	adds r0, r1
	ldrb r0, [r0, 0x5]
	lsrs r0, 4
	lsls r0, 4
	movs r2, 0x80
	lsls r2, 1
	adds r1, r2, 0
	orrs r0, r1
	ldr r3, _08131C18 @ =0x00007fff
	movs r1, 0x10
	movs r2, 0x6
	bl BlendPalette
_08131BF2:
	ldr r0, _08131C1C @ =gTasks
	mov r3, r8
	lsls r1, r3, 2
	add r1, r8
	lsls r1, 3
	adds r1, r0
	strh r5, [r1, 0x26]
	b _08131DB6
	.align 2, 0
_08131C04: .4byte gSprites
_08131C08: .4byte 0x0000ffe0
_08131C0C: .4byte gUnknown_0202F7C9
_08131C10: .4byte gUnknown_0202F7C8
_08131C14: .4byte 0x02017800
_08131C18: .4byte 0x00007fff
_08131C1C: .4byte gTasks
_08131C20:
	ldr r1, _08131C6C @ =gTasks
	mov r0, r8
	lsls r4, r0, 2
	adds r0, r4, r0
	lsls r0, 3
	adds r6, r0, r1
	ldrh r0, [r6, 0x26]
	lsls r0, 24
	lsrs r5, r0, 24
	movs r1, 0x80
	lsls r1, 4
	adds r0, r1, 0
	ldrh r2, [r6, 0xA]
	adds r0, r2
	strh r0, [r6, 0xA]
	ldr r0, _08131C70 @ =gUnknown_0202F7C8
	ldrb r0, [r0]
	bl battle_side_get_owner
	lsls r0, 24
	mov r9, r4
	cmp r0, 0
	bne _08131C78
	ldr r3, _08131C74 @ =gSprites
	lsls r4, r5, 4
	adds r2, r4, r5
	lsls r2, 2
	adds r2, r3
	ldrh r1, [r6, 0xA]
	lsls r1, 16
	asrs r1, 24
	ldrh r0, [r2, 0x24]
	subs r0, r1
	strh r0, [r2, 0x24]
	adds r2, r3, 0
	adds r3, r4, 0
	b _08131C8E
	.align 2, 0
_08131C6C: .4byte gTasks
_08131C70: .4byte gUnknown_0202F7C8
_08131C74: .4byte gSprites
_08131C78:
	ldr r2, _08131CDC @ =gSprites
	lsls r3, r5, 4
	adds r1, r3, r5
	lsls r1, 2
	adds r1, r2
	ldrh r0, [r6, 0xA]
	lsls r0, 16
	asrs r0, 24
	ldrh r4, [r1, 0x24]
	adds r0, r4
	strh r0, [r1, 0x24]
_08131C8E:
	ldr r1, _08131CE0 @ =gTasks
	mov r0, r9
	add r0, r8
	lsls r0, 3
	adds r6, r0, r1
	ldrb r0, [r6, 0xA]
	strh r0, [r6, 0xA]
	adds r1, r3, r5
	lsls r1, 2
	adds r1, r2
	ldrh r0, [r1, 0x24]
	ldrh r1, [r1, 0x20]
	adds r0, r1
	lsls r0, 16
	lsrs r5, r0, 16
	movs r1, 0x24
	ldrsh r0, [r6, r1]
	cmp r0, 0
	bne _08131D0E
	ldr r0, _08131CE4 @ =gUnknown_0202F7C8
	ldrb r0, [r0]
	bl battle_side_get_owner
	lsls r0, 24
	cmp r0, 0
	bne _08131CEC
	lsls r4, r5, 16
	asrs r4, 16
	ldr r0, _08131CE8 @ =gUnknown_0202F7C9
	ldrb r0, [r0]
	movs r1, 0
	bl sub_8077ABC
	lsls r0, 24
	lsrs r0, 24
	cmp r4, r0
	bge _08131D0E
	b _08131D02
	.align 2, 0
_08131CDC: .4byte gSprites
_08131CE0: .4byte gTasks
_08131CE4: .4byte gUnknown_0202F7C8
_08131CE8: .4byte gUnknown_0202F7C9
_08131CEC:
	lsls r4, r5, 16
	asrs r4, 16
	ldr r0, _08131D30 @ =gUnknown_0202F7C9
	ldrb r0, [r0]
	movs r1, 0
	bl sub_8077ABC
	lsls r0, 24
	lsrs r0, 24
	cmp r4, r0
	ble _08131D0E
_08131D02:
	ldrh r0, [r6, 0x24]
	adds r0, 0x1
	strh r0, [r6, 0x24]
	ldr r1, _08131D34 @ =gBattleAnimArgs
	ldr r0, _08131D38 @ =0x0000ffff
	strh r0, [r1, 0xE]
_08131D0E:
	lsls r0, r5, 16
	movs r2, 0x80
	lsls r2, 14
	adds r0, r2
	movs r1, 0x98
	lsls r1, 17
	cmp r0, r1
	bhi _08131D20
	b _08131EA0
_08131D20:
	ldr r0, _08131D3C @ =gTasks
	mov r1, r9
	add r1, r8
	lsls r1, 3
	adds r1, r0
	movs r0, 0
	strh r0, [r1, 0xA]
	b _08131DB6
	.align 2, 0
_08131D30: .4byte gUnknown_0202F7C9
_08131D34: .4byte gBattleAnimArgs
_08131D38: .4byte 0x0000ffff
_08131D3C: .4byte gTasks
_08131D40:
	movs r0, 0
	bl obj_id_for_side_relative_to_move
	lsls r0, 24
	lsrs r7, r0, 24
	ldr r1, _08131D8C @ =gTasks
	mov r3, r8
	lsls r4, r3, 2
	adds r0, r4, r3
	lsls r0, 3
	adds r0, r1
	ldrh r0, [r0, 0x26]
	lsls r0, 24
	lsrs r5, r0, 24
	lsls r0, r5, 4
	adds r0, r5
	lsls r0, 2
	ldr r5, _08131D90 @ =gSprites
	adds r0, r5
	bl sub_807A0F4
	ldr r0, _08131D94 @ =gUnknown_0202F7C8
	ldrb r0, [r0]
	bl battle_side_get_owner
	lsls r0, 24
	mov r9, r4
	cmp r0, 0
	bne _08131D98
	lsls r1, r7, 4
	adds r1, r7
	lsls r1, 2
	adds r1, r5
	ldrh r0, [r1, 0x20]
	negs r0, r0
	subs r0, 0x20
	strh r0, [r1, 0x24]
	b _08131DAC
	.align 2, 0
_08131D8C: .4byte gTasks
_08131D90: .4byte gSprites
_08131D94: .4byte gUnknown_0202F7C8
_08131D98:
	lsls r0, r7, 4
	adds r0, r7
	lsls r0, 2
	adds r0, r5
	ldrh r2, [r0, 0x20]
	movs r4, 0x88
	lsls r4, 1
	adds r1, r4, 0
	subs r1, r2
	strh r1, [r0, 0x24]
_08131DAC:
	ldr r0, _08131DC0 @ =gTasks
	mov r1, r9
	add r1, r8
	lsls r1, 3
	adds r1, r0
_08131DB6:
	ldrh r0, [r1, 0x8]
	adds r0, 0x1
	strh r0, [r1, 0x8]
	b _08131EA0
	.align 2, 0
_08131DC0: .4byte gTasks
_08131DC4:
	movs r0, 0
	bl obj_id_for_side_relative_to_move
	lsls r0, 24
	lsrs r7, r0, 24
	ldr r1, _08131E38 @ =gTasks
	mov r0, r8
	lsls r4, r0, 2
	adds r0, r4, r0
	lsls r0, 3
	adds r2, r0, r1
	movs r1, 0x80
	lsls r1, 4
	adds r0, r1, 0
	ldrh r3, [r2, 0xA]
	adds r0, r3
	strh r0, [r2, 0xA]
	ldr r0, _08131E3C @ =gUnknown_0202F7C8
	mov r10, r0
	ldrb r0, [r0]
	str r2, [sp, 0x10]
	bl battle_side_get_owner
	lsls r0, 24
	mov r9, r4
	ldr r2, [sp, 0x10]
	cmp r0, 0
	bne _08131E44
	ldr r1, _08131E40 @ =gSprites
	lsls r5, r7, 4
	adds r0, r5, r7
	lsls r0, 2
	adds r6, r0, r1
	ldrh r0, [r2, 0xA]
	lsls r0, 16
	asrs r0, 24
	ldrh r1, [r6, 0x24]
	adds r0, r1
	strh r0, [r6, 0x24]
	movs r2, 0x24
	ldrsh r4, [r6, r2]
	movs r3, 0x20
	ldrsh r0, [r6, r3]
	adds r4, r0
	mov r1, r10
	ldrb r0, [r1]
	movs r1, 0
	bl sub_8077ABC
	lsls r0, 24
	lsrs r0, 24
	adds r3, r5, 0
	cmp r4, r0
	blt _08131E7C
	movs r2, 0
	strh r2, [r6, 0x24]
	b _08131E7C
	.align 2, 0
_08131E38: .4byte gTasks
_08131E3C: .4byte gUnknown_0202F7C8
_08131E40: .4byte gSprites
_08131E44:
	ldr r1, _08131EB0 @ =gSprites
	lsls r5, r7, 4
	adds r0, r5, r7
	lsls r0, 2
	adds r6, r0, r1
	ldrh r1, [r2, 0xA]
	lsls r1, 16
	asrs r1, 24
	ldrh r0, [r6, 0x24]
	subs r0, r1
	strh r0, [r6, 0x24]
	movs r3, 0x24
	ldrsh r4, [r6, r3]
	movs r1, 0x20
	ldrsh r0, [r6, r1]
	adds r4, r0
	mov r2, r10
	ldrb r0, [r2]
	movs r1, 0
	bl sub_8077ABC
	lsls r0, 24
	lsrs r0, 24
	adds r3, r5, 0
	cmp r4, r0
	bgt _08131E7C
	movs r4, 0
	strh r4, [r6, 0x24]
_08131E7C:
	ldr r1, _08131EB4 @ =gTasks
	mov r0, r9
	add r0, r8
	lsls r0, 3
	adds r0, r1
	ldrb r1, [r0, 0xA]
	strh r1, [r0, 0xA]
	ldr r1, _08131EB0 @ =gSprites
	adds r0, r3, r7
	lsls r0, 2
	adds r0, r1
	movs r1, 0x24
	ldrsh r0, [r0, r1]
	cmp r0, 0
	bne _08131EA0
	mov r0, r8
	bl move_anim_task_del
_08131EA0:
	add sp, 0x14
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_08131EB0: .4byte gSprites
_08131EB4: .4byte gTasks
	thumb_func_end sub_8131944

	thumb_func_start sub_8131EB8
sub_8131EB8: @ 8131EB8
	push {r4,lr}
	adds r4, r0, 0
	movs r1, 0x3C
	ldrsh r0, [r4, r1]
	cmp r0, 0
	beq _08131ECA
	cmp r0, 0x1
	beq _08131F72
	b _08131FF4
_08131ECA:
	ldr r0, _08131F50 @ =gBattleAnimArgs
	movs r2, 0xE
	ldrsh r1, [r0, r2]
	movs r0, 0x1
	negs r0, r0
	cmp r1, r0
	bne _08131F64
	movs r0, 0x3F
	bl sub_8076F98
	adds r1, r0, 0
	lsls r1, 24
	asrs r1, 24
	movs r0, 0x7A
	bl PlaySE12WithPanning
	ldr r0, _08131F54 @ =gUnknown_0202F7C9
	ldrb r0, [r0]
	movs r1, 0x1
	bl sub_8077ABC
	lsls r0, 24
	lsrs r0, 24
	adds r0, 0x10
	strh r0, [r4, 0x22]
	ldr r0, _08131F58 @ =0x0000ffe0
	strh r0, [r4, 0x2E]
	ldrh r0, [r4, 0x3C]
	adds r0, 0x1
	strh r0, [r4, 0x3C]
	adds r2, r4, 0
	adds r2, 0x3E
	ldrb r1, [r2]
	movs r0, 0x5
	negs r0, r0
	ands r0, r1
	strb r0, [r2]
	ldr r0, _08131F5C @ =gUnknown_0202F7C8
	ldrb r0, [r0]
	bl battle_side_get_owner
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _08131FF4
	bl sub_8076BE0
	lsls r0, 24
	cmp r0, 0
	bne _08131FF4
	movs r0, 0x1
	bl obj_id_for_side_relative_to_move
	ldr r2, _08131F60 @ =gSprites
	lsls r0, 24
	lsrs r0, 24
	lsls r1, r0, 4
	adds r1, r0
	lsls r1, 2
	adds r1, r2
	adds r1, 0x43
	ldrb r0, [r1]
	subs r0, 0x1
	adds r1, r4, 0
	adds r1, 0x43
	strb r0, [r1]
	b _08131FF4
	.align 2, 0
_08131F50: .4byte gBattleAnimArgs
_08131F54: .4byte gUnknown_0202F7C9
_08131F58: .4byte 0x0000ffe0
_08131F5C: .4byte gUnknown_0202F7C8
_08131F60: .4byte gSprites
_08131F64:
	adds r0, r4, 0
	adds r0, 0x3E
	ldrb r1, [r0]
	movs r2, 0x4
	orrs r1, r2
	strb r1, [r0]
	b _08131FF4
_08131F72:
	movs r1, 0x30
	ldrsh r0, [r4, r1]
	movs r2, 0x2E
	ldrsh r1, [r4, r2]
	bl Sin
	strh r0, [r4, 0x26]
	ldrh r2, [r4, 0x30]
	adds r0, r2, 0x5
	strh r0, [r4, 0x30]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x7F
	ble _08131FA6
	movs r1, 0x2E
	ldrsh r0, [r4, r1]
	lsrs r1, r0, 31
	adds r0, r1
	asrs r0, 1
	strh r0, [r4, 0x2E]
	ldrh r0, [r4, 0x34]
	adds r0, 0x1
	strh r0, [r4, 0x34]
	adds r0, r2, 0
	subs r0, 0x7A
	strh r0, [r4, 0x30]
_08131FA6:
	movs r2, 0x80
	lsls r2, 1
	adds r0, r2, 0
	ldrh r1, [r4, 0x32]
	adds r0, r1
	strh r0, [r4, 0x32]
	ldr r0, _08131FD0 @ =gUnknown_0202F7C8
	ldrb r0, [r0]
	bl battle_side_get_owner
	lsls r0, 24
	cmp r0, 0
	bne _08131FD4
	ldrh r2, [r4, 0x32]
	lsls r1, r2, 16
	asrs r1, 24
	ldrh r0, [r4, 0x24]
	subs r0, r1
	strh r0, [r4, 0x24]
	adds r1, r2, 0
	b _08131FE0
	.align 2, 0
_08131FD0: .4byte gUnknown_0202F7C8
_08131FD4:
	ldrh r1, [r4, 0x32]
	lsls r0, r1, 16
	asrs r0, 24
	ldrh r2, [r4, 0x24]
	adds r0, r2
	strh r0, [r4, 0x24]
_08131FE0:
	movs r0, 0xFF
	ands r0, r1
	strh r0, [r4, 0x32]
	movs r1, 0x34
	ldrsh r0, [r4, r1]
	cmp r0, 0x2
	bne _08131FF4
	adds r0, r4, 0
	bl move_anim_8072740
_08131FF4:
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end sub_8131EB8

	thumb_func_start sub_8131FFC
sub_8131FFC: @ 8131FFC
	push {r4,r5,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	ldr r1, _08132024 @ =gTasks
	lsls r0, r4, 2
	adds r0, r4
	lsls r0, 3
	adds r0, r1
	movs r2, 0x26
	ldrsh r0, [r0, r2]
	adds r3, r1, 0
	cmp r0, 0x4
	bls _08132018
	b _0813216A
_08132018:
	lsls r0, 2
	ldr r1, _08132028 @ =_0813202C
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_08132024: .4byte gTasks
_08132028: .4byte _0813202C
	.align 2, 0
_0813202C:
	.4byte _08132040
	.4byte _08132090
	.4byte _081320EC
	.4byte _08132104
	.4byte _0813216A
_08132040:
	ldr r0, _08132084 @ =gUnknown_0202F7C8
	ldrb r0, [r0]
	movs r1, 0
	bl sub_8077ABC
	lsls r0, 24
	lsrs r0, 24
	adds r5, r0, 0
	ldr r0, _08132088 @ =gUnknown_0202F7C9
	ldrb r0, [r0]
	movs r1, 0
	bl sub_8077ABC
	lsls r0, 24
	lsrs r0, 24
	adds r2, r0, 0
	ldr r1, _0813208C @ =gTasks
	lsls r0, r4, 2
	adds r0, r4
	lsls r0, 3
	adds r1, r0, r1
	movs r0, 0x6
	strh r0, [r1, 0x8]
	cmp r5, r2
	ble _08132076
	negs r0, r0
	strh r0, [r1, 0x8]
_08132076:
	strh r5, [r1, 0xA]
	strh r2, [r1, 0xC]
	ldrh r0, [r1, 0x26]
	adds r0, 0x1
	strh r0, [r1, 0x26]
	b _08132188
	.align 2, 0
_08132084: .4byte gUnknown_0202F7C8
_08132088: .4byte gUnknown_0202F7C9
_0813208C: .4byte gTasks
_08132090:
	ldr r1, _081320CC @ =gUnknown_02024BE0
	ldr r0, _081320D0 @ =gUnknown_0202F7C8
	ldrb r0, [r0]
	adds r0, r1
	ldrb r2, [r0]
	ldr r1, _081320D4 @ =gSprites
	lsls r0, r2, 4
	adds r0, r2
	lsls r0, 2
	adds r1, r0, r1
	lsls r0, r4, 2
	adds r0, r4
	lsls r0, 3
	adds r2, r0, r3
	ldrh r0, [r2, 0x8]
	ldrh r3, [r1, 0x24]
	adds r0, r3
	strh r0, [r1, 0x24]
	movs r3, 0x8
	ldrsh r0, [r2, r3]
	cmp r0, 0
	ble _081320D8
	movs r3, 0x20
	ldrsh r0, [r1, r3]
	movs r3, 0x24
	ldrsh r1, [r1, r3]
	adds r0, r1
	movs r3, 0xC
	ldrsh r1, [r2, r3]
	b _0813215E
	.align 2, 0
_081320CC: .4byte gUnknown_02024BE0
_081320D0: .4byte gUnknown_0202F7C8
_081320D4: .4byte gSprites
_081320D8:
	movs r3, 0x20
	ldrsh r0, [r1, r3]
	movs r3, 0x24
	ldrsh r1, [r1, r3]
	adds r0, r1
	movs r3, 0xC
	ldrsh r1, [r2, r3]
	cmp r0, r1
	bgt _08132188
	b _08132162
_081320EC:
	lsls r0, r4, 2
	adds r0, r4
	lsls r0, 3
	adds r0, r3
	movs r2, 0x8
	ldrsh r1, [r0, r2]
	negs r1, r1
	strh r1, [r0, 0x8]
	ldrh r1, [r0, 0x26]
	adds r1, 0x1
	strh r1, [r0, 0x26]
	b _08132188
_08132104:
	ldr r1, _08132144 @ =gUnknown_02024BE0
	ldr r0, _08132148 @ =gUnknown_0202F7C8
	ldrb r0, [r0]
	adds r0, r1
	ldrb r2, [r0]
	ldr r1, _0813214C @ =gSprites
	lsls r0, r2, 4
	adds r0, r2
	lsls r0, 2
	adds r1, r0, r1
	lsls r0, r4, 2
	adds r0, r4
	lsls r0, 3
	adds r2, r0, r3
	ldrh r0, [r2, 0x8]
	ldrh r3, [r1, 0x24]
	adds r0, r3
	strh r0, [r1, 0x24]
	movs r3, 0x8
	ldrsh r0, [r2, r3]
	cmp r0, 0
	bge _08132150
	movs r3, 0x20
	ldrsh r0, [r1, r3]
	movs r3, 0x24
	ldrsh r1, [r1, r3]
	adds r0, r1
	movs r3, 0xA
	ldrsh r1, [r2, r3]
	cmp r0, r1
	bgt _08132188
	b _08132162
	.align 2, 0
_08132144: .4byte gUnknown_02024BE0
_08132148: .4byte gUnknown_0202F7C8
_0813214C: .4byte gSprites
_08132150:
	movs r3, 0x20
	ldrsh r0, [r1, r3]
	movs r3, 0x24
	ldrsh r1, [r1, r3]
	adds r0, r1
	movs r3, 0xA
	ldrsh r1, [r2, r3]
_0813215E:
	cmp r0, r1
	blt _08132188
_08132162:
	ldrh r0, [r2, 0x26]
	adds r0, 0x1
	strh r0, [r2, 0x26]
	b _08132188
_0813216A:
	ldr r1, _08132190 @ =gUnknown_02024BE0
	ldr r0, _08132194 @ =gUnknown_0202F7C8
	ldrb r0, [r0]
	adds r0, r1
	ldrb r2, [r0]
	ldr r1, _08132198 @ =gSprites
	lsls r0, r2, 4
	adds r0, r2
	lsls r0, 2
	adds r0, r1
	movs r1, 0
	strh r1, [r0, 0x24]
	adds r0, r4, 0
	bl move_anim_task_del
_08132188:
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_08132190: .4byte gUnknown_02024BE0
_08132194: .4byte gUnknown_0202F7C8
_08132198: .4byte gSprites
	thumb_func_end sub_8131FFC

	thumb_func_start sub_813219C
sub_813219C: @ 813219C
	push {r4,r5,lr}
	lsls r0, 24
	lsrs r0, 24
	lsls r1, r0, 2
	adds r1, r0
	lsls r1, 3
	ldr r0, _08132204 @ =gTasks
	adds r4, r1, r0
	movs r0, 0
	bl obj_id_for_side_relative_to_move
	lsls r0, 24
	lsrs r0, 24
	movs r5, 0
	strh r0, [r4, 0xE]
	ldr r0, _08132208 @ =gUnknown_0202F7C8
	ldrb r0, [r0]
	bl battle_side_get_owner
	lsls r0, 24
	movs r2, 0x1
	negs r2, r2
	adds r1, r2, 0
	cmp r0, 0
	bne _081321D0
	movs r1, 0x1
_081321D0:
	strh r1, [r4, 0x10]
	ldr r2, _0813220C @ =gSprites
	movs r0, 0xE
	ldrsh r1, [r4, r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r2
	ldrh r0, [r0, 0x22]
	strh r0, [r4, 0x14]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r2
	ldrh r0, [r0, 0x20]
	strh r0, [r4, 0x12]
	strh r5, [r4, 0x1A]
	strh r5, [r4, 0x1E]
	movs r0, 0x1
	strh r0, [r4, 0x1C]
	strh r5, [r4, 0x20]
	ldr r0, _08132210 @ =sub_8132214
	str r0, [r4]
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_08132204: .4byte gTasks
_08132208: .4byte gUnknown_0202F7C8
_0813220C: .4byte gSprites
_08132210: .4byte sub_8132214
	thumb_func_end sub_813219C

	thumb_func_start sub_8132214
sub_8132214: @ 8132214
	push {r4-r6,lr}
	lsls r0, 24
	lsrs r2, r0, 24
	lsls r0, r2, 2
	adds r0, r2
	lsls r0, 3
	ldr r1, _08132238 @ =gTasks
	adds r4, r0, r1
	movs r1, 0x8
	ldrsh r0, [r4, r1]
	cmp r0, 0x1
	beq _081322BC
	cmp r0, 0x1
	bgt _0813223C
	cmp r0, 0
	beq _08132242
	b _08132312
	.align 2, 0
_08132238: .4byte gTasks
_0813223C:
	cmp r0, 0x2
	beq _0813230C
	b _08132312
_08132242:
	ldrh r0, [r4, 0x1E]
	adds r0, 0x8
	movs r2, 0xFF
	ands r0, r2
	strh r0, [r4, 0x1E]
	ldr r5, _081322B4 @ =gSprites
	movs r6, 0xE
	ldrsh r0, [r4, r6]
	lsls r1, r0, 4
	adds r1, r0
	lsls r1, 2
	adds r1, r5
	ldr r3, _081322B8 @ =gSineTable
	movs r6, 0x1E
	ldrsh r0, [r4, r6]
	lsls r0, 1
	adds r0, r3
	ldrh r0, [r0]
	lsls r0, 16
	asrs r0, 21
	strh r0, [r1, 0x24]
	ldrh r0, [r4, 0x1A]
	adds r0, 0x2
	ands r0, r2
	strh r0, [r4, 0x1A]
	movs r1, 0xE
	ldrsh r0, [r4, r1]
	lsls r2, r0, 4
	adds r2, r0
	lsls r2, 2
	adds r2, r5
	movs r6, 0x1A
	ldrsh r0, [r4, r6]
	lsls r0, 1
	adds r0, r3
	ldrh r0, [r0]
	lsls r0, 16
	asrs r0, 19
	ldrh r1, [r4, 0x10]
	muls r0, r1
	ldrh r1, [r4, 0x12]
	adds r0, r1
	strh r0, [r2, 0x20]
	movs r6, 0x1A
	ldrsh r0, [r4, r6]
	cmp r0, 0
	bne _08132312
	movs r0, 0xE
	ldrsh r1, [r4, r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r5
	ldrh r1, [r4, 0x12]
	strh r1, [r0, 0x20]
	b _081322FC
	.align 2, 0
_081322B4: .4byte gSprites
_081322B8: .4byte gSineTable
_081322BC:
	ldrh r0, [r4, 0x1E]
	adds r0, 0x8
	movs r1, 0xFF
	ands r0, r1
	strh r0, [r4, 0x1E]
	ldr r3, _08132304 @ =gSprites
	movs r1, 0xE
	ldrsh r0, [r4, r1]
	lsls r1, r0, 4
	adds r1, r0
	lsls r1, 2
	adds r1, r3
	ldr r2, _08132308 @ =gSineTable
	movs r5, 0x1E
	ldrsh r0, [r4, r5]
	lsls r0, 1
	adds r0, r2
	ldrh r0, [r0]
	lsls r0, 16
	asrs r0, 21
	strh r0, [r1, 0x24]
	movs r6, 0x1E
	ldrsh r2, [r4, r6]
	cmp r2, 0
	bne _08132312
	movs r1, 0xE
	ldrsh r0, [r4, r1]
	lsls r1, r0, 4
	adds r1, r0
	lsls r1, 2
	adds r1, r3
	strh r2, [r1, 0x24]
_081322FC:
	ldrh r0, [r4, 0x8]
	adds r0, 0x1
	strh r0, [r4, 0x8]
	b _08132312
	.align 2, 0
_08132304: .4byte gSprites
_08132308: .4byte gSineTable
_0813230C:
	adds r0, r2, 0
	bl move_anim_task_del
_08132312:
	pop {r4-r6}
	pop {r0}
	bx r0
	thumb_func_end sub_8132214

	thumb_func_start sub_8132318
sub_8132318: @ 8132318
	push {r4,lr}
	adds r4, r0, 0
	ldr r0, _0813236C @ =gUnknown_0202F7C9
	ldrb r0, [r0]
	bl battle_side_get_owner
	lsls r0, 24
	ldrh r0, [r4, 0x2E]
	ldrh r1, [r4, 0x30]
	adds r0, r1
	movs r1, 0xFF
	ands r0, r1
	strh r0, [r4, 0x30]
	movs r1, 0x30
	ldrsh r0, [r4, r1]
	movs r1, 0x14
	bl Cos
	strh r0, [r4, 0x24]
	movs r1, 0x30
	ldrsh r0, [r4, r1]
	movs r1, 0x14
	bl Sin
	strh r0, [r4, 0x26]
	adds r0, r4, 0
	adds r0, 0x3F
	ldrb r1, [r0]
	movs r0, 0x10
	ands r0, r1
	cmp r0, 0
	beq _0813235E
	adds r0, r4, 0
	bl move_anim_8072740
_0813235E:
	ldrh r0, [r4, 0x32]
	adds r0, 0x1
	strh r0, [r4, 0x32]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0813236C: .4byte gUnknown_0202F7C9
	thumb_func_end sub_8132318

	thumb_func_start sub_8132370
sub_8132370: @ 8132370
	push {r4,lr}
	adds r4, r0, 0
	ldr r0, _081323A8 @ =gUnknown_0202F7C9
	ldrb r0, [r0]
	bl battle_side_get_owner
	lsls r0, 24
	cmp r0, 0
	bne _081323B4
	ldr r2, _081323AC @ =gBattleAnimArgs
	ldrh r0, [r4, 0x20]
	ldrh r1, [r2]
	subs r0, r1
	strh r0, [r4, 0x20]
	ldrh r0, [r2, 0x2]
	ldrh r1, [r4, 0x22]
	adds r0, r1
	strh r0, [r4, 0x22]
	ldr r0, _081323B0 @ =0x0000fff5
	strh r0, [r4, 0x2E]
	movs r0, 0xC0
	strh r0, [r4, 0x30]
	adds r0, r4, 0
	movs r1, 0x1
	bl StartSpriteAffineAnim
	b _081323CE
	.align 2, 0
_081323A8: .4byte gUnknown_0202F7C9
_081323AC: .4byte gBattleAnimArgs
_081323B0: .4byte 0x0000fff5
_081323B4:
	movs r0, 0xB
	strh r0, [r4, 0x2E]
	movs r0, 0xC0
	strh r0, [r4, 0x30]
	ldr r1, _081323D8 @ =gBattleAnimArgs
	ldrh r0, [r1]
	ldrh r2, [r4, 0x20]
	adds r0, r2
	strh r0, [r4, 0x20]
	ldrh r0, [r1, 0x2]
	ldrh r1, [r4, 0x22]
	adds r0, r1
	strh r0, [r4, 0x22]
_081323CE:
	ldr r0, _081323DC @ =sub_8132318
	str r0, [r4, 0x1C]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_081323D8: .4byte gBattleAnimArgs
_081323DC: .4byte sub_8132318
	thumb_func_end sub_8132370

	thumb_func_start sub_81323E0
sub_81323E0: @ 81323E0
	push {r4,r5,lr}
	adds r5, r0, 0
	ldr r4, _08132424 @ =gUnknown_0202F7C8
	ldrb r0, [r4]
	movs r1, 0x2
	bl sub_8077ABC
	lsls r0, 24
	lsrs r0, 24
	strh r0, [r5, 0x20]
	ldrb r0, [r4]
	movs r1, 0x2
	bl sub_807A100
	strh r0, [r5, 0x22]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0xF
	bgt _0813240A
	movs r0, 0x10
	strh r0, [r5, 0x22]
_0813240A:
	movs r0, 0
	strh r0, [r5, 0x3A]
	movs r1, 0x10
	strh r1, [r5, 0x3C]
	ldr r0, _08132428 @ =sub_8132430
	str r0, [r5, 0x1C]
	ldr r0, _0813242C @ =REG_BLDALPHA
	lsls r1, 8
	strh r1, [r0]
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_08132424: .4byte gUnknown_0202F7C8
_08132428: .4byte sub_8132430
_0813242C: .4byte REG_BLDALPHA
	thumb_func_end sub_81323E0

	thumb_func_start sub_8132430
sub_8132430: @ 8132430
	push {r4,lr}
	adds r3, r0, 0
	movs r0, 0x32
	ldrsh r1, [r3, r0]
	cmp r1, 0x1
	beq _081324A8
	cmp r1, 0x1
	bgt _08132446
	cmp r1, 0
	beq _08132450
	b _08132522
_08132446:
	cmp r1, 0x2
	beq _081324BE
	cmp r1, 0x3
	beq _0813251C
	b _08132522
_08132450:
	ldrh r0, [r3, 0x2E]
	adds r0, 0x1
	strh r0, [r3, 0x2E]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x1
	ble _08132522
	strh r1, [r3, 0x2E]
	ldrh r1, [r3, 0x30]
	movs r0, 0x1
	ands r0, r1
	cmp r0, 0
	bne _0813247A
	ldrh r2, [r3, 0x3A]
	movs r4, 0x3A
	ldrsh r0, [r3, r4]
	cmp r0, 0xF
	bgt _08132488
	adds r0, r2, 0x1
	strh r0, [r3, 0x3A]
	b _08132488
_0813247A:
	ldrh r2, [r3, 0x3C]
	movs r4, 0x3C
	ldrsh r0, [r3, r4]
	cmp r0, 0
	beq _08132488
	subs r0, r2, 0x1
	strh r0, [r3, 0x3C]
_08132488:
	adds r0, r1, 0x1
	strh r0, [r3, 0x30]
	ldr r2, _081324A4 @ =REG_BLDALPHA
	ldrh r0, [r3, 0x3C]
	lsls r0, 8
	ldrh r1, [r3, 0x3A]
	orrs r0, r1
	strh r0, [r2]
	movs r1, 0x3C
	ldrsh r0, [r3, r1]
	cmp r0, 0
	bne _08132522
	b _08132510
	.align 2, 0
_081324A4: .4byte REG_BLDALPHA
_081324A8:
	ldrh r0, [r3, 0x2E]
	adds r0, 0x1
	movs r1, 0
	strh r0, [r3, 0x2E]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0xA
	bne _08132522
	strh r1, [r3, 0x2E]
	strh r1, [r3, 0x30]
	b _08132510
_081324BE:
	ldrh r0, [r3, 0x2E]
	adds r0, 0x1
	strh r0, [r3, 0x2E]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x1
	ble _08132522
	movs r0, 0
	strh r0, [r3, 0x2E]
	ldrh r1, [r3, 0x30]
	movs r0, 0x1
	ands r0, r1
	cmp r0, 0
	bne _081324EA
	ldrh r2, [r3, 0x3A]
	movs r4, 0x3A
	ldrsh r0, [r3, r4]
	cmp r0, 0
	beq _081324F8
	subs r0, r2, 0x1
	strh r0, [r3, 0x3A]
	b _081324F8
_081324EA:
	ldrh r2, [r3, 0x3C]
	movs r4, 0x3C
	ldrsh r0, [r3, r4]
	cmp r0, 0xF
	bgt _081324F8
	adds r0, r2, 0x1
	strh r0, [r3, 0x3C]
_081324F8:
	adds r0, r1, 0x1
	strh r0, [r3, 0x30]
	ldr r2, _08132518 @ =REG_BLDALPHA
	ldrh r0, [r3, 0x3C]
	lsls r0, 8
	ldrh r1, [r3, 0x3A]
	orrs r0, r1
	strh r0, [r2]
	movs r1, 0x3C
	ldrsh r0, [r3, r1]
	cmp r0, 0x10
	bne _08132522
_08132510:
	ldrh r0, [r3, 0x32]
	adds r0, 0x1
	strh r0, [r3, 0x32]
	b _08132522
	.align 2, 0
_08132518: .4byte REG_BLDALPHA
_0813251C:
	adds r0, r3, 0
	bl move_anim_8074EE0
_08132522:
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end sub_8132430

	thumb_func_start sub_8132528
sub_8132528: @ 8132528
	push {lr}
	lsls r0, 24
	lsrs r3, r0, 24
	ldr r2, _08132544 @ =gBattleAnimArgs
	movs r0, 0
	strh r0, [r2, 0xE]
	ldr r0, _08132548 @ =gUnknown_0202F7C0
	ldrh r1, [r0]
	movs r0, 0x60
	ands r0, r1
	cmp r0, 0
	beq _0813254C
	movs r0, 0x1
	b _0813256E
	.align 2, 0
_08132544: .4byte gBattleAnimArgs
_08132548: .4byte gUnknown_0202F7C0
_0813254C:
	movs r0, 0x7
	ands r0, r1
	cmp r0, 0
	beq _08132558
	movs r0, 0x2
	b _0813256E
_08132558:
	movs r0, 0x18
	ands r0, r1
	cmp r0, 0
	beq _08132564
	movs r0, 0x3
	b _0813256E
_08132564:
	movs r0, 0x80
	ands r0, r1
	cmp r0, 0
	beq _08132570
	movs r0, 0x4
_0813256E:
	strh r0, [r2, 0xE]
_08132570:
	adds r0, r3, 0
	bl move_anim_task_del
	pop {r0}
	bx r0
	thumb_func_end sub_8132528

	thumb_func_start sub_813257C
sub_813257C: @ 813257C
	push {r4,lr}
	lsls r0, 24
	lsrs r0, 24
	lsls r4, r0, 2
	adds r4, r0
	lsls r4, 3
	ldr r0, _081325B4 @ =gTasks
	adds r4, r0
	movs r0, 0
	strh r0, [r4, 0x8]
	ldr r0, _081325B8 @ =gBattleAnimArgs
	ldrb r0, [r0]
	bl obj_id_for_side_relative_to_move
	adds r1, r0, 0
	lsls r1, 24
	lsrs r1, 24
	strh r1, [r4, 0x26]
	ldr r2, _081325BC @ =gUnknown_08402B28
	adds r0, r4, 0
	bl sub_80798F4
	ldr r0, _081325C0 @ =sub_81325C4
	str r0, [r4]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_081325B4: .4byte gTasks
_081325B8: .4byte gBattleAnimArgs
_081325BC: .4byte gUnknown_08402B28
_081325C0: .4byte sub_81325C4
	thumb_func_end sub_813257C

	thumb_func_start sub_81325C4
sub_81325C4: @ 81325C4
	push {r4-r6,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	lsls r0, r4, 2
	adds r0, r4
	lsls r0, 3
	ldr r2, _0813261C @ =gTasks
	adds r3, r0, r2
	ldrh r0, [r3, 0x8]
	adds r1, r0, 0x1
	movs r5, 0
	strh r1, [r3, 0x8]
	subs r0, 0x10
	lsls r0, 16
	lsrs r0, 16
	adds r6, r2, 0
	cmp r0, 0x16
	bhi _08132628
	ldrh r0, [r3, 0xA]
	adds r0, 0x1
	strh r0, [r3, 0xA]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x2
	ble _08132638
	strh r5, [r3, 0xA]
	ldrh r0, [r3, 0xC]
	adds r0, 0x1
	strh r0, [r3, 0xC]
	movs r5, 0x1
	ands r0, r5
	cmp r0, 0
	bne _08132628
	ldr r2, _08132620 @ =gSprites
	movs r0, 0x26
	ldrsh r1, [r3, r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r2
	ldr r1, _08132624 @ =0x0000ffff
	strh r1, [r0, 0x24]
	b _08132638
	.align 2, 0
_0813261C: .4byte gTasks
_08132620: .4byte gSprites
_08132624: .4byte 0x0000ffff
_08132628:
	ldr r2, _08132658 @ =gSprites
	movs r0, 0x26
	ldrsh r1, [r3, r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r2
	strh r5, [r0, 0x24]
_08132638:
	lsls r0, r4, 2
	adds r0, r4
	lsls r0, 3
	adds r0, r6
	bl sub_807992C
	lsls r0, 24
	cmp r0, 0
	bne _08132650
	adds r0, r4, 0
	bl move_anim_task_del
_08132650:
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_08132658: .4byte gSprites
	thumb_func_end sub_81325C4

	thumb_func_start sub_813265C
sub_813265C: @ 813265C
	push {lr}
	bl LoadOam
	bl ProcessSpriteCopyRequests
	bl TransferPlttBuffer
	pop {r0}
	bx r0
	thumb_func_end sub_813265C

	thumb_func_start sub_8132670
sub_8132670: @ 8132670
	push {lr}
	sub sp, 0x4
	bl ScriptContext2_Enable
	ldr r0, _08132698 @ =sub_813269C
	movs r1, 0xA
	bl CreateTask
	movs r0, 0x1
	negs r0, r0
	movs r1, 0
	str r1, [sp]
	movs r2, 0
	movs r3, 0x10
	bl BeginNormalPaletteFade
	add sp, 0x4
	pop {r0}
	bx r0
	.align 2, 0
_08132698: .4byte sub_813269C
	thumb_func_end sub_8132670

	thumb_func_start sub_813269C
sub_813269C: @ 813269C
	push {r4,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	ldr r0, _081326C8 @ =gPaletteFade
	ldrb r1, [r0, 0x7]
	movs r0, 0x80
	ands r0, r1
	cmp r0, 0
	bne _081326C0
	ldr r0, _081326CC @ =sub_81326D8
	bl SetMainCallback2
	ldr r1, _081326D0 @ =gUnknown_0300485C
	ldr r0, _081326D4 @ =sub_8080990
	str r0, [r1]
	adds r0, r4, 0
	bl DestroyTask
_081326C0:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_081326C8: .4byte gPaletteFade
_081326CC: .4byte sub_81326D8
_081326D0: .4byte gUnknown_0300485C
_081326D4: .4byte sub_8080990
	thumb_func_end sub_813269C

	thumb_func_start sub_81326D8
sub_81326D8: @ 81326D8
	push {r4,r5,lr}
	movs r1, 0x80
	lsls r1, 19
	movs r0, 0
	strh r0, [r1]
	bl ResetSpriteData
	bl FreeAllSpritePalettes
	bl ResetTasks
	ldr r4, _08132778 @ =gUnknown_030007B0
	ldr r0, _0813277C @ =0x02017000
	str r0, [r4]
	bl sub_81332A0
	ldr r1, [r4]
	ldr r0, _08132780 @ =gSpecialVar_0x8004
	ldrh r0, [r0]
	ldr r2, _08132784 @ =0x000002c5
	adds r1, r2
	movs r5, 0
	strb r0, [r1]
	bl sub_8133558
	ldr r0, _08132788 @ =sub_813265C
	bl SetVBlankCallback
	ldr r4, _0813278C @ =gWindowConfig_81E7240
	adds r0, r4, 0
	bl SetUpWindowConfig
	adds r0, r4, 0
	bl InitMenuWindow
	bl MenuZeroFillScreen
	ldr r4, _08132790 @ =gWindowConfig_81E6CE4
	adds r0, r4, 0
	bl SetUpWindowConfig
	adds r0, r4, 0
	bl InitMenuWindow
	bl MenuZeroFillScreen
	ldr r0, _08132794 @ =REG_BG0VOFS
	strh r5, [r0]
	strh r5, [r0]
	adds r0, 0x2
	strh r5, [r0]
	strh r5, [r0]
	ldr r0, _08132798 @ =gUnknown_08402D80
	bl LoadSpriteSheet
	ldr r0, _0813279C @ =gUnknown_08402D88
	bl LoadSpritePalette
	bl sub_8133358
	movs r0, 0
	movs r1, 0
	movs r2, 0x2
	bl FillPalette
	bl RunTasks
	bl AnimateSprites
	bl BuildOamBuffer
	bl UpdatePaletteFade
	ldr r0, _081327A0 @ =sub_8132870
	bl SetMainCallback2
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_08132778: .4byte gUnknown_030007B0
_0813277C: .4byte 0x02017000
_08132780: .4byte gSpecialVar_0x8004
_08132784: .4byte 0x000002c5
_08132788: .4byte sub_813265C
_0813278C: .4byte gWindowConfig_81E7240
_08132790: .4byte gWindowConfig_81E6CE4
_08132794: .4byte REG_BG0VOFS
_08132798: .4byte gUnknown_08402D80
_0813279C: .4byte gUnknown_08402D88
_081327A0: .4byte sub_8132870
	thumb_func_end sub_81326D8

	thumb_func_start sub_81327A4
sub_81327A4: @ 81327A4
	push {r4,r5,lr}
	bl ResetSpriteData
	bl FreeAllSpritePalettes
	bl ResetTasks
	ldr r4, _08132844 @ =gUnknown_030007B0
	ldr r0, _08132848 @ =0x02017000
	str r0, [r4]
	bl sub_8133558
	ldr r1, [r4]
	ldr r0, _0813284C @ =gSpecialVar_0x8005
	ldrh r0, [r0]
	ldr r2, _08132850 @ =0x000002c6
	adds r1, r2
	movs r5, 0
	strb r0, [r1]
	ldr r0, _08132854 @ =sub_813265C
	bl SetVBlankCallback
	ldr r4, _08132858 @ =gWindowConfig_81E7240
	adds r0, r4, 0
	bl SetUpWindowConfig
	adds r0, r4, 0
	bl InitMenuWindow
	bl MenuZeroFillScreen
	ldr r4, _0813285C @ =gWindowConfig_81E6CE4
	adds r0, r4, 0
	bl SetUpWindowConfig
	adds r0, r4, 0
	bl InitMenuWindow
	bl MenuZeroFillScreen
	movs r1, 0x80
	lsls r1, 19
	movs r2, 0x9A
	lsls r2, 5
	adds r0, r2, 0
	strh r0, [r1]
	ldr r0, _08132860 @ =REG_BG0VOFS
	strh r5, [r0]
	subs r0, 0x2
	strh r5, [r0]
	adds r0, 0x4
	strh r5, [r0]
	strh r5, [r0]
	ldr r0, _08132864 @ =gUnknown_08402D80
	bl LoadSpriteSheet
	ldr r0, _08132868 @ =gUnknown_08402D88
	bl LoadSpritePalette
	bl sub_8133358
	movs r0, 0
	movs r1, 0
	movs r2, 0x2
	bl FillPalette
	bl RunTasks
	bl AnimateSprites
	bl BuildOamBuffer
	bl UpdatePaletteFade
	ldr r0, _0813286C @ =sub_8132870
	bl SetMainCallback2
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_08132844: .4byte gUnknown_030007B0
_08132848: .4byte 0x02017000
_0813284C: .4byte gSpecialVar_0x8005
_08132850: .4byte 0x000002c6
_08132854: .4byte sub_813265C
_08132858: .4byte gWindowConfig_81E7240
_0813285C: .4byte gWindowConfig_81E6CE4
_08132860: .4byte REG_BG0VOFS
_08132864: .4byte gUnknown_08402D80
_08132868: .4byte gUnknown_08402D88
_0813286C: .4byte sub_8132870
	thumb_func_end sub_81327A4

	thumb_func_start sub_8132870
sub_8132870: @ 8132870
	push {r4,lr}
	bl sub_8132908
	ldr r4, _081328E0 @ =gUnknown_030007B0
	ldr r1, [r4]
	ldrb r0, [r1, 0x1D]
	cmp r0, 0
	beq _08132896
	movs r0, 0
	strb r0, [r1, 0x1D]
	ldr r0, [r4]
	ldrb r1, [r0, 0x18]
	lsls r1, 1
	adds r1, 0x1
	lsls r1, 27
	lsrs r1, 24
	movs r0, 0x58
	bl sub_814AD7C
_08132896:
	ldr r1, [r4]
	ldrb r0, [r1, 0x1E]
	cmp r0, 0
	beq _081328A6
	movs r0, 0
	strb r0, [r1, 0x1E]
	bl sub_8133800
_081328A6:
	ldr r1, [r4]
	ldr r2, _081328E4 @ =0x000002c3
	adds r0, r1, r2
	ldrb r0, [r0]
	cmp r0, 0
	beq _081328C8
	adds r2, 0x1
	adds r0, r1, r2
	ldrb r0, [r0]
	movs r1, 0x1
	bl sub_8133AEC
	ldr r0, [r4]
	ldr r1, _081328E4 @ =0x000002c3
	adds r0, r1
	movs r1, 0
	strb r1, [r0]
_081328C8:
	bl RunTasks
	bl AnimateSprites
	bl BuildOamBuffer
	bl UpdatePaletteFade
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_081328E0: .4byte gUnknown_030007B0
_081328E4: .4byte 0x000002c3
	thumb_func_end sub_8132870

	thumb_func_start sub_81328E8
sub_81328E8: @ 81328E8
	push {r4,lr}
	adds r1, r0, 0
	ldr r4, _08132904 @ =gStringVar4
	adds r0, r4, 0
	bl StringExpandPlaceholders
	adds r0, r4, 0
	movs r1, 0x3
	movs r2, 0xF
	bl MenuPrintMessage
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08132904: .4byte gStringVar4
	thumb_func_end sub_81328E8

	thumb_func_start sub_8132908
sub_8132908: @ 8132908
	push {r4-r7,lr}
	mov r7, r9
	mov r6, r8
	push {r6,r7}
	sub sp, 0x4
	ldr r1, _0813292C @ =gUnknown_030007B0
	ldr r0, [r1]
	ldrb r0, [r0]
	adds r7, r1, 0
	cmp r0, 0x21
	bls _08132920
	b _08132FD6
_08132920:
	lsls r0, 2
	ldr r1, _08132930 @ =_08132934
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_0813292C: .4byte gUnknown_030007B0
_08132930: .4byte _08132934
	.align 2, 0
_08132934:
	.4byte _081329BC
	.4byte _08132A0C
	.4byte _08132A24
	.4byte _08132A2C
	.4byte _08132A60
	.4byte _08132A66
	.4byte _08132A98
	.4byte _08132FD6
	.4byte _08132AAA
	.4byte _08132AD0
	.4byte _08132FD6
	.4byte _08132FD6
	.4byte _08132B74
	.4byte _08132B98
	.4byte _08132DD8
	.4byte _08132DF8
	.4byte _08132BF0
	.4byte _08132C08
	.4byte _08132C2C
	.4byte _08132D40
	.4byte _08132D68
	.4byte _08132DB8
	.4byte _08132DC6
	.4byte _08132FD6
	.4byte _08132C74
	.4byte _08132C8C
	.4byte _08132CB0
	.4byte _08132D0C
	.4byte _08132E18
	.4byte _08132E7C
	.4byte _08132F58
	.4byte _08132F84
	.4byte _08132FA4
	.4byte _08132FBC
_081329BC:
	ldr r1, [r7]
	ldrb r0, [r1]
	adds r0, 0x1
	movs r4, 0
	strb r0, [r1]
	bl sub_8132FEC
	movs r0, 0
	bl sub_8133030
	bl sub_8133800
	ldr r0, _08132A04 @ =gSprites
	adds r0, 0x64
	movs r1, 0x48
	strh r1, [r0]
	ldr r0, [r7]
	ldr r1, _08132A08 @ =0x000002c3
	adds r0, r1
	movs r1, 0x1
	strb r1, [r0]
	movs r0, 0x1
	negs r0, r0
	str r4, [sp]
	movs r1, 0
	movs r2, 0x10
	movs r3, 0
	bl BeginNormalPaletteFade
	movs r1, 0x80
	lsls r1, 19
	movs r2, 0x9A
	lsls r2, 5
	adds r0, r2, 0
	strh r0, [r1]
	b _08132FD6
	.align 2, 0
_08132A04: .4byte gSprites
_08132A08: .4byte 0x000002c3
_08132A0C:
	ldr r0, _08132A20 @ =gPaletteFade
	ldrb r1, [r0, 0x7]
	movs r0, 0x80
	ands r0, r1
	cmp r0, 0
	beq _08132A1A
	b _08132FD6
_08132A1A:
	ldr r1, [r7]
	movs r0, 0x4
	b _08132FD4
	.align 2, 0
_08132A20: .4byte gPaletteFade
_08132A24:
	ldr r1, [r7]
	ldrb r0, [r1]
	adds r0, 0x1
	b _08132FD4
_08132A2C:
	movs r0, 0
	bl sub_8133030
	bl sub_8133800
	ldr r2, _08132A54 @ =gUnknown_030007B0
	ldr r0, [r2]
	ldr r1, _08132A58 @ =0x000002c3
	adds r0, r1
	movs r1, 0x1
	strb r1, [r0]
	ldr r1, [r2]
	ldrb r0, [r1]
	adds r0, 0x1
	strb r0, [r1]
	ldr r0, _08132A5C @ =gSprites
	adds r0, 0x64
	movs r1, 0x48
	strh r1, [r0]
	b _08132FD6
	.align 2, 0
_08132A54: .4byte gUnknown_030007B0
_08132A58: .4byte 0x000002c3
_08132A5C: .4byte gSprites
_08132A60:
	bl sub_81330E8
	b _08132A9C
_08132A66:
	movs r0, 0
	bl sub_8133140
	bl sub_8133800
	ldr r2, _08132A8C @ =gUnknown_030007B0
	ldr r0, [r2]
	ldr r1, _08132A90 @ =0x000002c3
	adds r0, r1
	movs r1, 0x1
	strb r1, [r0]
	ldr r0, _08132A94 @ =gSprites
	adds r0, 0x64
	movs r1, 0x48
	strh r1, [r0]
	ldr r1, [r2]
	ldrb r0, [r1]
	adds r0, 0x1
	b _08132FD4
	.align 2, 0
_08132A8C: .4byte gUnknown_030007B0
_08132A90: .4byte 0x000002c3
_08132A94: .4byte gSprites
_08132A98:
	bl sub_8133248
_08132A9C:
	lsls r0, 24
	cmp r0, 0
	beq _08132AA4
	b _08132FD6
_08132AA4:
	bl sub_813362C
	b _08132FD6
_08132AAA:
	bl MenuUpdateWindowText
	lsls r0, 24
	cmp r0, 0
	bne _08132AB6
	b _08132FD6
_08132AB6:
	movs r0, 0x15
	movs r1, 0x7
	movs r2, 0x1
	bl DisplayYesNoMenu
	ldr r0, _08132ACC @ =gUnknown_030007B0
	ldr r1, [r0]
	ldrb r0, [r1]
	adds r0, 0x1
	b _08132FD4
	.align 2, 0
_08132ACC: .4byte gUnknown_030007B0
_08132AD0:
	bl ProcessMenuInputNoWrap_
	lsls r0, 24
	asrs r1, r0, 24
	cmp r1, 0
	bne _08132B3A
	bl sub_8133CA4
	ldr r4, _08132B1C @ =gUnknown_030007B0
	ldr r2, [r4]
	ldr r1, _08132B20 @ =0x000002c5
	adds r0, r2, r1
	ldrb r1, [r0]
	movs r0, 0x64
	muls r0, r1
	ldr r1, _08132B24 @ =gPlayerParty
	adds r0, r1
	ldrb r1, [r2, 0x1B]
	lsls r1, 1
	adds r2, 0x20
	adds r2, r1
	ldrh r1, [r2]
	bl GiveMoveToMon
	lsls r0, 16
	ldr r1, _08132B28 @ =0xffff0000
	cmp r0, r1
	beq _08132B34
	ldr r0, _08132B2C @ =gOtherText_PokeLearnedMove
	bl sub_81328E8
	ldr r1, _08132B30 @ =gSpecialVar_0x8004
	movs r0, 0x1
	strh r0, [r1]
	ldr r1, [r4]
	movs r0, 0x1F
	b _08132FD4
	.align 2, 0
_08132B1C: .4byte gUnknown_030007B0
_08132B20: .4byte 0x000002c5
_08132B24: .4byte gPlayerParty
_08132B28: .4byte 0xffff0000
_08132B2C: .4byte gOtherText_PokeLearnedMove
_08132B30: .4byte gSpecialVar_0x8004
_08132B34:
	ldr r1, [r4]
	movs r0, 0x10
	b _08132FD4
_08132B3A:
	movs r0, 0x1
	negs r0, r0
	cmp r1, r0
	beq _08132B48
	cmp r1, 0x1
	beq _08132B48
	b _08132FD6
_08132B48:
	bl sub_8133CA4
	ldr r3, _08132B70 @ =gUnknown_030007B0
	ldr r1, [r3]
	movs r2, 0xB1
	lsls r2, 2
	adds r0, r1, r2
	ldrb r0, [r0]
	cmp r0, 0
	bne _08132B60
	movs r0, 0x3
	strb r0, [r1]
_08132B60:
	ldr r1, [r3]
	adds r0, r1, r2
	ldrb r0, [r0]
	cmp r0, 0x1
	beq _08132B6C
	b _08132FD6
_08132B6C:
	movs r0, 0x5
	b _08132FD4
	.align 2, 0
_08132B70: .4byte gUnknown_030007B0
_08132B74:
	bl MenuUpdateWindowText
	lsls r0, 24
	cmp r0, 0
	bne _08132B80
	b _08132FD6
_08132B80:
	movs r0, 0x15
	movs r1, 0x7
	movs r2, 0x1
	bl DisplayYesNoMenu
	ldr r0, _08132B94 @ =gUnknown_030007B0
	ldr r1, [r0]
	ldrb r0, [r1]
	adds r0, 0x1
	b _08132FD4
	.align 2, 0
_08132B94: .4byte gUnknown_030007B0
_08132B98:
	bl ProcessMenuInputNoWrap_
	lsls r0, 24
	asrs r4, r0, 24
	cmp r4, 0
	bne _08132BB4
	bl sub_8133CA4
	ldr r0, _08132BB0 @ =gSpecialVar_0x8004
	strh r4, [r0]
	b _08132FCE
	.align 2, 0
_08132BB0: .4byte gSpecialVar_0x8004
_08132BB4:
	movs r0, 0x1
	negs r0, r0
	cmp r4, r0
	beq _08132BC2
	cmp r4, 0x1
	beq _08132BC2
	b _08132FD6
_08132BC2:
	bl sub_8133CA4
	ldr r3, _08132BEC @ =gUnknown_030007B0
	ldr r1, [r3]
	movs r2, 0xB1
	lsls r2, 2
	adds r0, r1, r2
	ldrb r0, [r0]
	cmp r0, 0
	bne _08132BDA
	movs r0, 0x3
	strb r0, [r1]
_08132BDA:
	ldr r1, [r3]
	adds r0, r1, r2
	ldrb r0, [r0]
	cmp r0, 0x1
	beq _08132BE6
	b _08132FD6
_08132BE6:
	movs r0, 0x5
	b _08132FD4
	.align 2, 0
_08132BEC: .4byte gUnknown_030007B0
_08132BF0:
	ldr r0, _08132C00 @ =gOtherText_DeleteOlderMove
	bl sub_81328E8
	ldr r0, _08132C04 @ =gUnknown_030007B0
	ldr r1, [r0]
	ldrb r0, [r1]
	adds r0, 0x1
	b _08132FD4
	.align 2, 0
_08132C00: .4byte gOtherText_DeleteOlderMove
_08132C04: .4byte gUnknown_030007B0
_08132C08:
	bl MenuUpdateWindowText
	lsls r0, 24
	cmp r0, 0
	bne _08132C14
	b _08132FD6
_08132C14:
	movs r0, 0x15
	movs r1, 0x7
	movs r2, 0x1
	bl DisplayYesNoMenu
	ldr r0, _08132C28 @ =gUnknown_030007B0
	ldr r1, [r0]
	movs r0, 0x12
	b _08132FD4
	.align 2, 0
_08132C28: .4byte gUnknown_030007B0
_08132C2C:
	bl ProcessMenuInputNoWrap_
	lsls r0, 24
	asrs r1, r0, 24
	cmp r1, 0
	bne _08132C54
	bl sub_8133CA4
	ldr r0, _08132C4C @ =gOtherText_WhichMoveToForget
	bl sub_81328E8
	ldr r0, _08132C50 @ =gUnknown_030007B0
	ldr r1, [r0]
	movs r0, 0x13
	b _08132FD4
	.align 2, 0
_08132C4C: .4byte gOtherText_WhichMoveToForget
_08132C50: .4byte gUnknown_030007B0
_08132C54:
	movs r0, 0x1
	negs r0, r0
	cmp r1, r0
	beq _08132C62
	cmp r1, 0x1
	beq _08132C62
	b _08132FD6
_08132C62:
	bl sub_8133CA4
	ldr r0, _08132C70 @ =gUnknown_030007B0
	ldr r1, [r0]
	movs r0, 0x18
	b _08132FD4
	.align 2, 0
_08132C70: .4byte gUnknown_030007B0
_08132C74:
	ldr r0, _08132C84 @ =gOtherText_StopLearningMove
	bl sub_81328E8
	ldr r0, _08132C88 @ =gUnknown_030007B0
	ldr r1, [r0]
	ldrb r0, [r1]
	adds r0, 0x1
	b _08132FD4
	.align 2, 0
_08132C84: .4byte gOtherText_StopLearningMove
_08132C88: .4byte gUnknown_030007B0
_08132C8C:
	bl MenuUpdateWindowText
	lsls r0, 24
	cmp r0, 0
	bne _08132C98
	b _08132FD6
_08132C98:
	ldr r0, _08132CAC @ =gUnknown_030007B0
	ldr r1, [r0]
	movs r0, 0x1A
	strb r0, [r1]
	movs r0, 0x15
	movs r1, 0x7
	movs r2, 0x1
	bl DisplayYesNoMenu
	b _08132FD6
	.align 2, 0
_08132CAC: .4byte gUnknown_030007B0
_08132CB0:
	bl ProcessMenuInputNoWrap_
	lsls r0, 24
	asrs r1, r0, 24
	cmp r1, 0
	bne _08132CCC
	bl sub_8133CA4
	ldr r0, _08132CC8 @ =gUnknown_030007B0
	ldr r1, [r0]
	movs r0, 0x1B
	b _08132FD4
	.align 2, 0
_08132CC8: .4byte gUnknown_030007B0
_08132CCC:
	movs r0, 0x1
	negs r0, r0
	cmp r1, r0
	beq _08132CDA
	cmp r1, 0x1
	beq _08132CDA
	b _08132FD6
_08132CDA:
	bl sub_8133CA4
	ldr r1, _08132D08 @ =gUnknown_030007B0
	ldr r2, [r1]
	movs r3, 0xB1
	lsls r3, 2
	adds r0, r2, r3
	ldrb r0, [r0]
	cmp r0, 0
	bne _08132CF2
	movs r0, 0x3
	strb r0, [r2]
_08132CF2:
	ldr r2, [r1]
	adds r0, r2, r3
	ldrb r0, [r0]
	cmp r0, 0x1
	bne _08132D00
	movs r0, 0x5
	strb r0, [r2]
_08132D00:
	ldr r1, [r1]
	movs r0, 0x10
	b _08132FD4
	.align 2, 0
_08132D08: .4byte gUnknown_030007B0
_08132D0C:
	bl MenuUpdateWindowText
	lsls r0, 24
	cmp r0, 0
	bne _08132D18
	b _08132FD6
_08132D18:
	ldr r3, _08132D3C @ =gUnknown_030007B0
	ldr r1, [r3]
	movs r2, 0xB1
	lsls r2, 2
	adds r0, r1, r2
	ldrb r0, [r0]
	cmp r0, 0
	bne _08132D2C
	movs r0, 0x3
	strb r0, [r1]
_08132D2C:
	ldr r1, [r3]
	adds r0, r1, r2
	ldrb r0, [r0]
	cmp r0, 0x1
	beq _08132D38
	b _08132FD6
_08132D38:
	movs r0, 0x5
	b _08132FD4
	.align 2, 0
_08132D3C: .4byte gUnknown_030007B0
_08132D40:
	bl MenuUpdateWindowText
	lsls r0, 24
	cmp r0, 0
	bne _08132D4C
	b _08132FD6
_08132D4C:
	ldr r0, _08132D64 @ =gUnknown_030007B0
	ldr r1, [r0]
	movs r2, 0
	movs r0, 0x14
	strb r0, [r1]
	subs r0, 0x15
	str r2, [sp]
	movs r1, 0
	movs r3, 0x10
	bl BeginNormalPaletteFade
	b _08132FD6
	.align 2, 0
_08132D64: .4byte gUnknown_030007B0
_08132D68:
	ldr r0, _08132DA4 @ =gPaletteFade
	ldrb r1, [r0, 0x7]
	movs r0, 0x80
	ands r0, r1
	cmp r0, 0
	beq _08132D76
	b _08132FD6
_08132D76:
	ldr r0, _08132DA8 @ =gPlayerParty
	ldr r5, [r7]
	ldr r2, _08132DAC @ =0x000002c5
	adds r1, r5, r2
	ldrb r1, [r1]
	ldr r2, _08132DB0 @ =gPlayerPartyCount
	ldrb r2, [r2]
	subs r2, 0x1
	lsls r2, 24
	lsrs r2, 24
	ldr r3, _08132DB4 @ =sub_81327A4
	ldrb r4, [r5, 0x1B]
	lsls r4, 1
	adds r5, 0x20
	adds r5, r4
	ldrh r4, [r5]
	str r4, [sp]
	bl sub_809D9F0
	ldr r1, [r7]
	movs r0, 0x1C
	b _08132FD4
	.align 2, 0
_08132DA4: .4byte gPaletteFade
_08132DA8: .4byte gPlayerParty
_08132DAC: .4byte 0x000002c5
_08132DB0: .4byte gPlayerPartyCount
_08132DB4: .4byte sub_81327A4
_08132DB8:
	bl MenuUpdateWindowText
	lsls r0, 24
	cmp r0, 0
	bne _08132DC4
	b _08132FD6
_08132DC4:
	b _08132FCE
_08132DC6:
	movs r0, 0x1
	negs r0, r0
	movs r1, 0
	str r1, [sp]
	movs r2, 0x10
	movs r3, 0
	bl BeginNormalPaletteFade
	b _08132FD6
_08132DD8:
	movs r0, 0x1
	negs r0, r0
	movs r1, 0
	str r1, [sp]
	movs r2, 0
	movs r3, 0x10
	bl BeginNormalPaletteFade
	ldr r0, _08132DF4 @ =gUnknown_030007B0
	ldr r1, [r0]
	ldrb r0, [r1]
	adds r0, 0x1
	b _08132FD4
	.align 2, 0
_08132DF4: .4byte gUnknown_030007B0
_08132DF8:
	ldr r0, _08132E10 @ =gPaletteFade
	ldrb r1, [r0, 0x7]
	movs r0, 0x80
	ands r0, r1
	cmp r0, 0
	beq _08132E06
	b _08132FD6
_08132E06:
	ldr r0, _08132E14 @ =c2_exit_to_overworld_2_switch
	bl SetMainCallback2
	b _08132FD6
	.align 2, 0
_08132E10: .4byte gPaletteFade
_08132E14: .4byte c2_exit_to_overworld_2_switch
_08132E18:
	movs r0, 0x1
	negs r0, r0
	movs r1, 0
	str r1, [sp]
	movs r2, 0x10
	movs r3, 0
	bl BeginNormalPaletteFade
	ldr r5, _08132E74 @ =gUnknown_030007B0
	ldr r1, [r5]
	ldrb r0, [r1]
	adds r0, 0x1
	strb r0, [r1]
	bl sub_8132FEC
	bl sub_8133800
	ldr r0, [r5]
	movs r4, 0xB1
	lsls r4, 2
	adds r0, r4
	ldrb r0, [r0]
	cmp r0, 0
	bne _08132E4E
	movs r0, 0x1
	bl sub_8133030
_08132E4E:
	ldr r0, [r5]
	adds r0, r4
	ldrb r0, [r0]
	cmp r0, 0x1
	bne _08132E66
	ldr r0, _08132E78 @ =gSprites
	adds r0, 0x64
	movs r1, 0x48
	strh r1, [r0]
	movs r0, 0x1
	bl sub_8133140
_08132E66:
	ldr r0, [r5]
	adds r0, r4
	ldrb r0, [r0]
	movs r1, 0x1
	bl sub_8133AEC
	b _08132FD6
	.align 2, 0
_08132E74: .4byte gUnknown_030007B0
_08132E78: .4byte gSprites
_08132E7C:
	ldr r0, _08132E9C @ =gPaletteFade
	ldrb r1, [r0, 0x7]
	movs r0, 0x80
	ands r0, r1
	cmp r0, 0
	beq _08132E8A
	b _08132FD6
_08132E8A:
	ldr r1, [r7]
	ldr r0, _08132EA0 @ =0x000002c6
	adds r2, r1, r0
	ldrb r0, [r2]
	cmp r0, 0x4
	bne _08132EA4
	movs r0, 0x18
	b _08132FD4
	.align 2, 0
_08132E9C: .4byte gPaletteFade
_08132EA0: .4byte 0x000002c6
_08132EA4:
	ldr r4, _08132F38 @ =0x000002c5
	adds r0, r1, r4
	ldrb r0, [r0]
	movs r6, 0x64
	muls r0, r6
	ldr r5, _08132F3C @ =gPlayerParty
	adds r0, r5
	ldrb r1, [r2]
	adds r1, 0xD
	bl GetMonData
	lsls r0, 16
	lsrs r0, 16
	ldr r2, _08132F40 @ =gStringVar3
	movs r1, 0xD
	mov r9, r1
	mov r1, r9
	muls r1, r0
	ldr r0, _08132F44 @ =gMoveNames
	mov r8, r0
	add r1, r8
	adds r0, r2, 0
	bl StringCopy
	ldr r1, [r7]
	adds r0, r1, r4
	ldrb r0, [r0]
	muls r0, r6
	adds r0, r5
	ldr r2, _08132F48 @ =0x000002c6
	adds r1, r2
	ldrb r1, [r1]
	bl RemoveMonPPBonus
	ldr r3, [r7]
	adds r4, r3, r4
	ldrb r0, [r4]
	muls r0, r6
	adds r0, r5
	ldrb r2, [r3, 0x1B]
	lsls r2, 1
	adds r1, r3, 0
	adds r1, 0x20
	adds r1, r2
	ldrh r1, [r1]
	ldr r2, _08132F48 @ =0x000002c6
	adds r3, r2
	ldrb r2, [r3]
	bl SetMonMoveSlot
	ldr r0, _08132F4C @ =gStringVar2
	ldr r1, [r7]
	ldrb r2, [r1, 0x1B]
	lsls r2, 1
	adds r1, 0x20
	adds r1, r2
	ldrh r1, [r1]
	mov r2, r9
	muls r2, r1
	adds r1, r2, 0
	add r1, r8
	bl StringCopy
	ldr r0, _08132F50 @ =gOtherText_ForgotMove123
	bl sub_81328E8
	ldr r1, [r7]
	movs r0, 0x1E
	strb r0, [r1]
	ldr r1, _08132F54 @ =gSpecialVar_0x8004
	movs r0, 0x1
	strh r0, [r1]
	b _08132FD6
	.align 2, 0
_08132F38: .4byte 0x000002c5
_08132F3C: .4byte gPlayerParty
_08132F40: .4byte gStringVar3
_08132F44: .4byte gMoveNames
_08132F48: .4byte 0x000002c6
_08132F4C: .4byte gStringVar2
_08132F50: .4byte gOtherText_ForgotMove123
_08132F54: .4byte gSpecialVar_0x8004
_08132F58:
	bl MenuUpdateWindowText
	lsls r0, 24
	cmp r0, 0
	beq _08132FD6
	ldr r0, _08132F78 @ =gOtherText_ForgotOrDidNotLearnMove
	bl sub_81328E8
	ldr r0, _08132F7C @ =gUnknown_030007B0
	ldr r1, [r0]
	movs r0, 0x1F
	strb r0, [r1]
	ldr r0, _08132F80 @ =0x0000016f
	bl PlayFanfare
	b _08132FD6
	.align 2, 0
_08132F78: .4byte gOtherText_ForgotOrDidNotLearnMove
_08132F7C: .4byte gUnknown_030007B0
_08132F80: .4byte 0x0000016f
_08132F84:
	bl MenuUpdateWindowText
	lsls r0, 24
	cmp r0, 0
	beq _08132FD6
	ldr r0, _08132F9C @ =0x0000016f
	bl PlayFanfare
	ldr r0, _08132FA0 @ =gUnknown_030007B0
	ldr r1, [r0]
	movs r0, 0x20
	b _08132FD4
	.align 2, 0
_08132F9C: .4byte 0x0000016f
_08132FA0: .4byte gUnknown_030007B0
_08132FA4:
	bl IsFanfareTaskInactive
	lsls r0, 24
	cmp r0, 0
	beq _08132FD6
	ldr r0, _08132FB8 @ =gUnknown_030007B0
	ldr r1, [r0]
	movs r0, 0x21
	b _08132FD4
	.align 2, 0
_08132FB8: .4byte gUnknown_030007B0
_08132FBC:
	ldr r0, _08132FE4 @ =gMain
	ldrh r1, [r0, 0x2E]
	movs r0, 0x1
	ands r0, r1
	cmp r0, 0
	beq _08132FD6
	movs r0, 0x5
	bl PlaySE
_08132FCE:
	ldr r0, _08132FE8 @ =gUnknown_030007B0
	ldr r1, [r0]
	movs r0, 0xE
_08132FD4:
	strb r0, [r1]
_08132FD6:
	add sp, 0x4
	pop {r3,r4}
	mov r8, r3
	mov r9, r4
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_08132FE4: .4byte gMain
_08132FE8: .4byte gUnknown_030007B0
	thumb_func_end sub_8132908

	thumb_func_start sub_8132FEC
sub_8132FEC: @ 8132FEC
	push {r4-r6,lr}
	ldr r0, _08133024 @ =gWindowConfig_81E7240
	bl BasicInitMenuWindow
	movs r5, 0
	ldr r4, _08133028 @ =gUnknown_08402CF8
	adds r6, r4, 0
_08132FFA:
	lsls r3, r5, 2
	ldrb r0, [r4]
	adds r1, r6, 0x1
	adds r1, r3, r1
	ldrb r1, [r1]
	adds r2, r6, 0x2
	adds r3, r2
	ldrb r2, [r3]
	ldrb r3, [r4, 0x3]
	bl MenuDrawTextWindow
	adds r4, 0x4
	adds r5, 0x1
	cmp r5, 0x3
	bls _08132FFA
	ldr r0, _0813302C @ =gWindowConfig_81E6CE4
	bl BasicInitMenuWindow
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_08133024: .4byte gWindowConfig_81E7240
_08133028: .4byte gUnknown_08402CF8
_0813302C: .4byte gWindowConfig_81E6CE4
	thumb_func_end sub_8132FEC

	thumb_func_start sub_8133030
sub_8133030: @ 8133030
	push {r4-r7,lr}
	sub sp, 0x8
	lsls r0, 24
	lsrs r7, r0, 24
	ldr r4, _081330D4 @ =gSprites
	ldr r5, _081330D8 @ =gUnknown_030007B0
	ldr r0, [r5]
	ldrb r0, [r0, 0x3]
	lsls r1, r0, 4
	adds r1, r0
	lsls r1, 2
	adds r1, r4
	adds r1, 0x3E
	ldrb r3, [r1]
	movs r2, 0x5
	negs r2, r2
	adds r0, r2, 0
	ands r0, r3
	strb r0, [r1]
	ldr r0, [r5]
	ldrb r1, [r0, 0x4]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r4
	adds r0, 0x3E
	ldrb r1, [r0]
	ands r2, r1
	strb r2, [r0]
	movs r2, 0
	ldr r6, _081330DC @ =gUnknown_08402D08
	movs r3, 0x4
_08133070:
	ldr r0, [r5]
	adds r0, r2
	ldrb r1, [r0, 0x7]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r4
	adds r0, 0x3E
	ldrb r1, [r0]
	orrs r1, r3
	strb r1, [r0]
	adds r2, 0x1
	cmp r2, 0xF
	ble _08133070
	ldr r0, [r6]
	cmp r0, 0
	beq _081330B4
	ldr r5, _081330E0 @ =gTileBuffer
	adds r4, r6, 0
_08133096:
	ldr r1, [r4]
	adds r0, r5, 0
	movs r2, 0x40
	movs r3, 0x2
	bl sub_8072C74
	ldrb r1, [r4, 0x4]
	ldrb r2, [r4, 0x5]
	adds r0, r5, 0
	bl MenuPrint
	adds r4, 0x8
	ldr r0, [r4]
	cmp r0, 0
	bne _08133096
_081330B4:
	cmp r7, 0
	bne _081330CC
	ldr r0, _081330E4 @ =gOtherText_TeachWhichMove
	movs r1, 0x20
	str r1, [sp]
	movs r1, 0x1
	str r1, [sp, 0x4]
	movs r1, 0x18
	movs r2, 0x78
	movs r3, 0xC0
	bl sub_8072AB0
_081330CC:
	add sp, 0x8
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_081330D4: .4byte gSprites
_081330D8: .4byte gUnknown_030007B0
_081330DC: .4byte gUnknown_08402D08
_081330E0: .4byte gTileBuffer
_081330E4: .4byte gOtherText_TeachWhichMove
	thumb_func_end sub_8133030

	thumb_func_start sub_81330E8
sub_81330E8: @ 81330E8
	push {r4,lr}
	ldr r0, _08133134 @ =gMain
	ldrh r2, [r0, 0x2E]
	movs r1, 0x30
	ands r1, r2
	negs r0, r1
	orrs r0, r1
	lsrs r4, r0, 31
	ldr r0, _08133138 @ =gSaveBlock2
	ldrb r0, [r0, 0x13]
	cmp r0, 0x1
	bne _0813310C
	movs r0, 0xC0
	lsls r0, 2
	ands r0, r2
	cmp r0, 0
	beq _0813310C
	adds r4, 0x1
_0813310C:
	cmp r4, 0
	beq _0813312A
	movs r0, 0x5
	bl PlaySE
	ldr r2, _0813313C @ =gUnknown_030007B0
	ldr r1, [r2]
	movs r0, 0x5
	strb r0, [r1]
	ldr r0, [r2]
	movs r1, 0xB1
	lsls r1, 2
	adds r0, r1
	movs r1, 0x1
	strb r1, [r0]
_0813312A:
	adds r0, r4, 0
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_08133134: .4byte gMain
_08133138: .4byte gSaveBlock2
_0813313C: .4byte gUnknown_030007B0
	thumb_func_end sub_81330E8

	thumb_func_start sub_8133140
sub_8133140: @ 8133140
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	sub sp, 0xC
	lsls r0, 24
	lsrs r0, 24
	str r0, [sp, 0x8]
	ldr r4, _08133234 @ =gSprites
	ldr r5, _08133238 @ =gUnknown_030007B0
	ldr r0, [r5]
	ldrb r0, [r0, 0x3]
	lsls r1, r0, 4
	adds r1, r0
	lsls r1, 2
	adds r1, r4
	adds r1, 0x3E
	ldrb r2, [r1]
	movs r3, 0x5
	negs r3, r3
	adds r0, r3, 0
	ands r0, r2
	strb r0, [r1]
	ldr r0, [r5]
	ldrb r1, [r0, 0x4]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r4
	adds r0, 0x3E
	ldrb r2, [r0]
	adds r1, r3, 0
	ands r1, r2
	strb r1, [r0]
	movs r6, 0
	ldr r7, _0813323C @ =gUnknown_08402D08
_0813318A:
	ldr r0, [r5]
	adds r0, r6
	ldrb r0, [r0, 0x7]
	lsls r1, r0, 4
	adds r1, r0
	lsls r1, 2
	adds r1, r4
	adds r1, 0x3E
	ldrb r2, [r1]
	adds r0, r3, 0
	ands r0, r2
	strb r0, [r1]
	adds r6, 0x1
	cmp r6, 0xF
	ble _0813318A
	movs r6, 0
	ldr r0, [r7]
	cmp r0, 0
	beq _08133208
	mov r9, r7
	mov r10, r6
	movs r0, 0x24
	add r0, r9
	mov r8, r0
_081331BA:
	mov r0, r9
	adds r0, 0x20
	add r0, r10
	ldr r1, [r0]
	ldr r0, _08133240 @ =gTileBuffer
	movs r2, 0x40
	movs r3, 0x2
	bl sub_8072C74
	mov r0, r8
	ldrb r5, [r0]
	ldrb r4, [r0, 0x1]
	ldr r0, _08133240 @ =gTileBuffer
	adds r1, r5, 0
	adds r2, r4, 0
	bl MenuPrint
	cmp r6, 0
	beq _081331F8
	adds r1, r4, 0x2
	lsls r1, 24
	lsrs r1, 24
	adds r2, r5, 0x7
	lsls r2, 24
	lsrs r2, 24
	adds r3, r4, 0x3
	lsls r3, 24
	lsrs r3, 24
	adds r0, r5, 0
	bl MenuZeroFillWindowRect
_081331F8:
	movs r0, 0x8
	add r10, r0
	add r8, r0
	adds r7, 0x8
	adds r6, 0x1
	ldr r0, [r7]
	cmp r0, 0
	bne _081331BA
_08133208:
	ldr r0, [sp, 0x8]
	cmp r0, 0
	bne _08133222
	ldr r0, _08133244 @ =gOtherText_TeachWhichMove
	movs r1, 0x20
	str r1, [sp]
	movs r1, 0x1
	str r1, [sp, 0x4]
	movs r1, 0x18
	movs r2, 0x78
	movs r3, 0xC0
	bl sub_8072AB0
_08133222:
	add sp, 0xC
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_08133234: .4byte gSprites
_08133238: .4byte gUnknown_030007B0
_0813323C: .4byte gUnknown_08402D08
_08133240: .4byte gTileBuffer
_08133244: .4byte gOtherText_TeachWhichMove
	thumb_func_end sub_8133140

	thumb_func_start sub_8133248
sub_8133248: @ 8133248
	push {r4,lr}
	ldr r0, _08133294 @ =gMain
	ldrh r2, [r0, 0x2E]
	movs r1, 0x30
	ands r1, r2
	negs r0, r1
	orrs r0, r1
	lsrs r4, r0, 31
	ldr r0, _08133298 @ =gSaveBlock2
	ldrb r0, [r0, 0x13]
	cmp r0, 0x1
	bne _0813326C
	movs r0, 0xC0
	lsls r0, 2
	ands r0, r2
	cmp r0, 0
	beq _0813326C
	adds r4, 0x1
_0813326C:
	cmp r4, 0
	beq _0813328A
	movs r0, 0x5
	bl PlaySE
	ldr r2, _0813329C @ =gUnknown_030007B0
	ldr r1, [r2]
	movs r3, 0
	movs r0, 0x3
	strb r0, [r1]
	ldr r0, [r2]
	movs r1, 0xB1
	lsls r1, 2
	adds r0, r1
	strb r3, [r0]
_0813328A:
	adds r0, r4, 0
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_08133294: .4byte gMain
_08133298: .4byte gSaveBlock2
_0813329C: .4byte gUnknown_030007B0
	thumb_func_end sub_8133248

	thumb_func_start sub_81332A0
sub_81332A0: @ 81332A0
	push {r4,lr}
	ldr r2, _081332F8 @ =gUnknown_030007B0
	ldr r0, [r2]
	movs r1, 0
	strb r1, [r0]
	ldr r0, [r2]
	strb r1, [r0, 0x2]
	ldr r0, [r2]
	strb r1, [r0, 0x19]
	ldr r0, [r2]
	strb r1, [r0, 0x18]
	ldr r0, [r2]
	strb r1, [r0, 0x1C]
	ldr r0, [r2]
	strb r1, [r0, 0x1A]
	ldr r0, [r2]
	strb r1, [r0, 0x1B]
	ldr r0, [r2]
	strb r1, [r0, 0x1D]
	ldr r0, [r2]
	strb r1, [r0, 0x1E]
	ldr r0, [r2]
	ldr r3, _081332FC @ =0x000002c3
	adds r0, r3
	strb r1, [r0]
	ldr r0, [r2]
	adds r3, 0x1
	adds r0, r3
	strb r1, [r0]
	movs r3, 0
	adds r4, r2, 0
	movs r2, 0
_081332E0:
	ldr r0, [r4]
	lsls r1, r3, 1
	adds r0, 0x20
	adds r0, r1
	strh r2, [r0]
	adds r3, 0x1
	cmp r3, 0x13
	ble _081332E0
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_081332F8: .4byte gUnknown_030007B0
_081332FC: .4byte 0x000002c3
	thumb_func_end sub_81332A0

	thumb_func_start sub_8133300
sub_8133300: @ 8133300
	push {r4,lr}
	adds r4, r0, 0
	movs r1, 0x30
	ldrsh r0, [r4, r1]
	lsls r1, r0, 2
	adds r1, r0
	lsls r1, 1
	movs r0, 0xFF
	ands r1, r0
	movs r2, 0x2E
	ldrsh r0, [r4, r2]
	cmp r0, 0x1
	beq _08133324
	cmp r0, 0x1
	ble _0813334A
	cmp r0, 0x2
	beq _08133338
	b _0813334A
_08133324:
	adds r0, r1, 0
	movs r1, 0x3
	bl Sin
	ldrh r1, [r4, 0x32]
	adds r2, r0, 0
	muls r2, r1
	adds r0, r2, 0
	strh r0, [r4, 0x24]
	b _0813334A
_08133338:
	adds r0, r1, 0
	movs r1, 0x1
	bl Sin
	ldrh r1, [r4, 0x32]
	adds r2, r0, 0
	muls r2, r1
	adds r0, r2, 0
	strh r0, [r4, 0x26]
_0813334A:
	ldrh r0, [r4, 0x30]
	adds r0, 0x1
	strh r0, [r4, 0x30]
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end sub_8133300

	thumb_func_start sub_8133358
sub_8133358: @ 8133358
	push {r4-r7,lr}
	mov r7, r9
	mov r6, r8
	push {r6,r7}
	sub sp, 0x4
	ldr r6, _0813353C @ =gSpriteTemplate_8402D90
	adds r0, r6, 0
	movs r1, 0x8
	movs r2, 0x10
	movs r3, 0
	bl CreateSprite
	ldr r4, _08133540 @ =gUnknown_030007B0
	ldr r1, [r4]
	strb r0, [r1, 0x3]
	ldr r5, _08133544 @ =gSprites
	ldr r2, [r4]
	ldrb r1, [r2, 0x3]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r5
	movs r1, 0x1
	mov r8, r1
	mov r1, r8
	strh r1, [r0, 0x2E]
	ldrb r1, [r2, 0x3]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r5
	ldr r1, _08133548 @ =0x0000ffff
	strh r1, [r0, 0x32]
	adds r0, r6, 0
	movs r1, 0x48
	movs r2, 0x10
	movs r3, 0
	bl CreateSprite
	ldr r1, [r4]
	strb r0, [r1, 0x4]
	ldr r0, [r4]
	ldrb r1, [r0, 0x4]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r5
	movs r1, 0x1
	bl StartSpriteAnim
	ldr r2, [r4]
	ldrb r1, [r2, 0x4]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r5
	mov r1, r8
	strh r1, [r0, 0x2E]
	ldrb r1, [r2, 0x4]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r5
	mov r1, r8
	strh r1, [r0, 0x32]
	ldr r0, _0813354C @ =gSpriteTemplate_8402DC0
	mov r9, r0
	movs r1, 0xA0
	movs r2, 0x4
	movs r3, 0
	bl CreateSprite
	ldr r1, [r4]
	strb r0, [r1, 0x5]
	ldr r0, [r4]
	ldrb r1, [r0, 0x5]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r5
	movs r1, 0x1
	bl StartSpriteAnim
	ldr r2, [r4]
	ldrb r1, [r2, 0x5]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r5
	movs r6, 0x2
	strh r6, [r0, 0x2E]
	ldrb r1, [r2, 0x5]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r5
	movs r1, 0x1
	negs r1, r1
	strh r1, [r0, 0x32]
	mov r0, r9
	movs r1, 0xA0
	movs r2, 0x3C
	movs r3, 0
	bl CreateSprite
	ldr r1, [r4]
	strb r0, [r1, 0x6]
	ldr r2, [r4]
	ldrb r1, [r2, 0x6]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r5
	strh r6, [r0, 0x2E]
	ldrb r1, [r2, 0x6]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r5
	mov r1, r8
	strh r1, [r0, 0x32]
	movs r5, 0
	ldr r6, _08133550 @ =gSpriteTemplate_8402E08
_0813344E:
	adds r2, r5, 0
	cmp r5, 0
	bge _08133456
	adds r2, r5, 0x3
_08133456:
	asrs r2, 2
	lsls r1, r2, 2
	subs r1, r5, r1
	lsls r1, 19
	movs r0, 0xE0
	lsls r0, 13
	adds r1, r0
	asrs r1, 16
	lsls r2, 19
	movs r0, 0xD0
	lsls r0, 14
	adds r2, r0
	asrs r2, 16
	adds r0, r6, 0
	movs r3, 0
	bl CreateSprite
	ldr r1, [r4]
	adds r2, r5, 0x4
	adds r1, 0x3
	adds r1, r2
	strb r0, [r1]
	ldr r0, [r4]
	adds r0, 0x3
	adds r0, r2
	ldrb r1, [r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	ldr r1, _08133544 @ =gSprites
	adds r0, r1
	movs r1, 0x2
	bl StartSpriteAnim
	adds r5, 0x1
	cmp r5, 0x7
	ble _0813344E
	movs r5, 0
	ldr r7, _08133550 @ =gSpriteTemplate_8402E08
	ldr r6, _08133540 @ =gUnknown_030007B0
_081334A6:
	adds r2, r5, 0
	cmp r5, 0
	bge _081334AE
	adds r2, r5, 0x3
_081334AE:
	asrs r2, 2
	lsls r1, r2, 2
	subs r1, r5, r1
	lsls r1, 19
	movs r0, 0xE0
	lsls r0, 13
	adds r1, r0
	asrs r1, 16
	lsls r2, 19
	movs r0, 0xB8
	lsls r0, 15
	adds r2, r0
	asrs r2, 16
	adds r0, r7, 0
	movs r3, 0
	bl CreateSprite
	ldr r1, [r6]
	adds r2, r5, 0
	adds r2, 0xC
	adds r1, 0x3
	adds r1, r2
	strb r0, [r1]
	ldr r0, [r6]
	adds r0, 0x3
	adds r0, r2
	ldrb r1, [r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	ldr r4, _08133544 @ =gSprites
	adds r0, r4
	movs r1, 0x2
	bl StartSpriteAnim
	adds r5, 0x1
	cmp r5, 0x7
	ble _081334A6
	movs r5, 0
	ldr r3, _08133540 @ =gUnknown_030007B0
	movs r2, 0x4
_08133500:
	ldr r0, [r3]
	adds r0, 0x3
	adds r0, r5
	ldrb r1, [r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r4
	adds r0, 0x3E
	ldrb r1, [r0]
	orrs r1, r2
	strb r1, [r0]
	adds r5, 0x1
	cmp r5, 0x13
	ble _08133500
	ldr r1, _08133548 @ =0x0000ffff
	ldr r3, _08133554 @ =0x00002d9f
	movs r0, 0x12
	str r0, [sp]
	movs r0, 0x10
	movs r2, 0xC
	bl CreateBlendedOutlineCursor
	add sp, 0x4
	pop {r3,r4}
	mov r8, r3
	mov r9, r4
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_0813353C: .4byte gSpriteTemplate_8402D90
_08133540: .4byte gUnknown_030007B0
_08133544: .4byte gSprites
_08133548: .4byte 0x0000ffff
_0813354C: .4byte gSpriteTemplate_8402DC0
_08133550: .4byte gSpriteTemplate_8402E08
_08133554: .4byte 0x00002d9f
	thumb_func_end sub_8133358

	thumb_func_start sub_8133558
sub_8133558: @ 8133558
	push {r4-r6,lr}
	sub sp, 0xC
	ldr r5, _081335F4 @ =gUnknown_030007B0
	ldr r1, [r5]
	ldr r2, _081335F8 @ =0x000002c5
	adds r0, r1, r2
	ldrb r2, [r0]
	movs r0, 0x64
	muls r0, r2
	ldr r2, _081335FC @ =gPlayerParty
	adds r0, r2
	adds r1, 0x20
	bl sub_80403CC
	ldr r1, [r5]
	strb r0, [r1, 0x1A]
	movs r4, 0
	ldr r0, [r5]
	ldrb r0, [r0, 0x1A]
	cmp r4, r0
	bge _081335AA
	adds r6, r5, 0
	movs r5, 0x52
_08133586:
	lsls r2, r4, 1
	ldr r1, [r6]
	adds r0, r1, r5
	adds r1, 0x20
	adds r1, r2
	ldrh r2, [r1]
	movs r1, 0xD
	muls r1, r2
	ldr r2, _08133600 @ =gMoveNames
	adds r1, r2
	bl StringCopy
	adds r5, 0x19
	adds r4, 0x1
	ldr r0, [r6]
	ldrb r0, [r0, 0x1A]
	cmp r4, r0
	blt _08133586
_081335AA:
	ldr r4, _081335F4 @ =gUnknown_030007B0
	ldr r0, [r4]
	ldr r1, _081335F8 @ =0x000002c5
	adds r0, r1
	ldrb r1, [r0]
	movs r0, 0x64
	muls r0, r1
	ldr r1, _081335FC @ =gPlayerParty
	adds r0, r1
	movs r1, 0x2
	mov r2, sp
	bl GetMonData
	ldr r0, _08133604 @ =gStringVar1
	mov r1, sp
	bl StringCopy10
	ldr r0, [r4]
	ldrb r2, [r0, 0x1A]
	lsls r1, r2, 1
	adds r1, r2
	lsls r1, 3
	adds r1, r2
	adds r1, 0x52
	adds r0, r1
	ldr r1, _08133608 @ =gUnknownText_Exit
	bl StringCopy
	ldr r1, [r4]
	ldrb r0, [r1, 0x1A]
	adds r0, 0x1
	strb r0, [r1, 0x1A]
	add sp, 0xC
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_081335F4: .4byte gUnknown_030007B0
_081335F8: .4byte 0x000002c5
_081335FC: .4byte gPlayerParty
_08133600: .4byte gMoveNames
_08133604: .4byte gStringVar1
_08133608: .4byte gUnknownText_Exit
	thumb_func_end sub_8133558

	thumb_func_start sub_813360C
sub_813360C: @ 813360C
	lsls r0, 24
	ldr r3, _08133628 @ =gUnknown_030007B0
	ldr r2, [r3]
	ldrb r1, [r2, 0x18]
	strb r1, [r2, 0x1C]
	ldr r1, [r3]
	lsrs r0, 24
	ldrb r2, [r1, 0x18]
	adds r0, r2
	strb r0, [r1, 0x18]
	ldr r1, [r3]
	movs r0, 0x1
	strb r0, [r1, 0x1D]
	bx lr
	.align 2, 0
_08133628: .4byte gUnknown_030007B0
	thumb_func_end sub_813360C

	thumb_func_start sub_813362C
sub_813362C: @ 813362C
	push {r4,r5,lr}
	ldr r2, _08133670 @ =gMain
	ldrh r1, [r2, 0x30]
	movs r0, 0x40
	ands r0, r1
	cmp r0, 0
	beq _08133688
	ldr r4, _08133674 @ =gUnknown_030007B0
	ldr r0, [r4]
	ldrb r0, [r0, 0x1B]
	cmp r0, 0
	bne _08133646
	b _08133796
_08133646:
	movs r0, 0x5
	bl PlaySE
	ldr r1, [r4]
	ldrb r0, [r1, 0x1B]
	subs r0, 0x1
	strb r0, [r1, 0x1B]
	ldr r0, [r4]
	ldr r1, _08133678 @ =0x000002c3
	adds r0, r1
	movs r1, 0x1
	strb r1, [r0]
	ldr r1, [r4]
	ldrb r0, [r1, 0x18]
	cmp r0, 0
	beq _0813367C
	movs r0, 0x1
	negs r0, r0
	bl sub_813360C
	b _08133796
	.align 2, 0
_08133670: .4byte gMain
_08133674: .4byte gUnknown_030007B0
_08133678: .4byte 0x000002c3
_0813367C:
	ldrb r0, [r1, 0x19]
	cmp r0, 0
	bne _08133684
	b _08133796
_08133684:
	subs r0, 0x1
	b _081336DC
_08133688:
	movs r0, 0x80
	ands r0, r1
	cmp r0, 0
	beq _081336E8
	ldr r4, _081336C8 @ =gUnknown_030007B0
	ldr r0, [r4]
	ldrb r1, [r0, 0x1B]
	ldrb r0, [r0, 0x1A]
	subs r0, 0x1
	cmp r1, r0
	blt _081336A0
	b _08133796
_081336A0:
	movs r0, 0x5
	bl PlaySE
	ldr r1, [r4]
	ldrb r0, [r1, 0x1B]
	adds r0, 0x1
	strb r0, [r1, 0x1B]
	ldr r0, [r4]
	ldr r3, _081336CC @ =0x000002c3
	adds r0, r3
	movs r1, 0x1
	strb r1, [r0]
	ldr r1, [r4]
	ldrb r0, [r1, 0x18]
	cmp r0, 0x2
	beq _081336D0
	movs r0, 0x1
	bl sub_813360C
	b _08133796
	.align 2, 0
_081336C8: .4byte gUnknown_030007B0
_081336CC: .4byte 0x000002c3
_081336D0:
	ldrb r2, [r1, 0x19]
	ldrb r0, [r1, 0x1A]
	subs r0, 0x3
	cmp r2, r0
	beq _08133796
	adds r0, r2, 0x1
_081336DC:
	strb r0, [r1, 0x19]
	ldr r1, [r4]
	ldrb r0, [r1, 0x1E]
	adds r0, 0x1
	strb r0, [r1, 0x1E]
	b _08133796
_081336E8:
	ldrh r1, [r2, 0x2E]
	movs r0, 0x1
	ands r0, r1
	cmp r0, 0
	beq _0813376C
	movs r0, 0x5
	bl PlaySE
	ldr r5, _08133738 @ =gUnknown_030007B0
	ldr r2, [r5]
	ldrb r1, [r2, 0x1B]
	ldrb r0, [r2, 0x1A]
	subs r0, 0x1
	cmp r1, r0
	beq _08133748
	movs r0, 0x8
	strb r0, [r2]
	ldr r0, _0813373C @ =gStringVar2
	ldr r1, [r5]
	ldrb r3, [r1, 0x1B]
	lsls r2, r3, 1
	adds r2, r3
	lsls r2, 3
	adds r2, r3
	adds r2, 0x52
	adds r1, r2
	bl StringCopy
	ldr r4, _08133740 @ =gStringVar4
	ldr r1, _08133744 @ =gOtherText_TeachSpecificMove
	adds r0, r4, 0
	bl StringExpandPlaceholders
	adds r0, r4, 0
	movs r1, 0x3
	movs r2, 0xF
	bl MenuPrintMessage
	b _08133796
	.align 2, 0
_08133738: .4byte gUnknown_030007B0
_0813373C: .4byte gStringVar2
_08133740: .4byte gStringVar4
_08133744: .4byte gOtherText_TeachSpecificMove
_08133748:
	ldr r4, _08133764 @ =gStringVar4
	ldr r1, _08133768 @ =gOtherText_GiveUpTeachingMove
	adds r0, r4, 0
	bl StringExpandPlaceholders
	adds r0, r4, 0
	movs r1, 0x3
	movs r2, 0xF
	bl MenuPrintMessage
	ldr r1, [r5]
	movs r0, 0xC
	strb r0, [r1]
	b _08133796
	.align 2, 0
_08133764: .4byte gStringVar4
_08133768: .4byte gOtherText_GiveUpTeachingMove
_0813376C:
	movs r0, 0x2
	ands r0, r1
	cmp r0, 0
	beq _08133796
	movs r0, 0x5
	bl PlaySE
	ldr r0, _081337D4 @ =gUnknown_030007B0
	ldr r1, [r0]
	movs r0, 0xC
	strb r0, [r1]
	ldr r4, _081337D8 @ =gStringVar4
	ldr r1, _081337DC @ =gOtherText_GiveUpTeachingMove
	adds r0, r4, 0
	bl StringExpandPlaceholders
	adds r0, r4, 0
	movs r1, 0x3
	movs r2, 0xF
	bl MenuPrintMessage
_08133796:
	ldr r0, _081337D4 @ =gUnknown_030007B0
	ldr r4, [r0]
	ldrb r0, [r4, 0x1A]
	cmp r0, 0x3
	bls _081337F8
	ldr r3, _081337E0 @ =gSprites
	adds r5, r3, 0
	adds r5, 0xC6
	ldrb r0, [r5]
	movs r1, 0x5
	negs r1, r1
	adds r2, r1, 0
	ands r2, r0
	strb r2, [r5]
	movs r0, 0x85
	lsls r0, 1
	adds r0, r3
	mov r12, r0
	ldrb r0, [r0]
	adds r3, r1, 0
	ands r3, r0
	mov r1, r12
	strb r3, [r1]
	ldrb r0, [r4, 0x19]
	cmp r0, 0
	bne _081337E4
	movs r1, 0x4
	adds r0, r2, 0
	orrs r0, r1
	strb r0, [r5]
	b _081337F8
	.align 2, 0
_081337D4: .4byte gUnknown_030007B0
_081337D8: .4byte gStringVar4
_081337DC: .4byte gOtherText_GiveUpTeachingMove
_081337E0: .4byte gSprites
_081337E4:
	ldrb r1, [r4, 0x19]
	ldrb r0, [r4, 0x1A]
	subs r0, 0x3
	cmp r1, r0
	bne _081337F8
	movs r1, 0x4
	adds r0, r3, 0
	orrs r0, r1
	mov r3, r12
	strb r0, [r3]
_081337F8:
	pop {r4,r5}
	pop {r0}
	bx r0
	thumb_func_end sub_813362C

	thumb_func_start sub_8133800
sub_8133800: @ 8133800
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	ldr r1, _08133834 @ =gUnknown_030007B0
	ldr r0, [r1]
	ldrb r6, [r0, 0x19]
	ldr r3, _08133838 @ =gTileBuffer
	mov r10, r1
	ldr r0, _0813383C @ =gBattleMoves
	mov r9, r0
	movs r1, 0x2
	mov r8, r1
_0813381C:
	mov r4, r10
	ldr r2, [r4]
	ldrb r0, [r2, 0x1A]
	cmp r6, r0
	bcc _08133844
	adds r0, r3, 0
	ldr r1, _08133840 @ =gEmptyString_81E72B0
	movs r2, 0x90
	movs r3, 0
	bl sub_8072C74
	b _081338FA
	.align 2, 0
_08133834: .4byte gUnknown_030007B0
_08133838: .4byte gTileBuffer
_0813383C: .4byte gBattleMoves
_08133840: .4byte gEmptyString_81E72B0
_08133844:
	ldrb r0, [r2, 0x1A]
	subs r0, 0x1
	cmp r6, r0
	bne _08133860
	adds r0, r3, 0
	ldr r1, _0813385C @ =gUnknownText_Exit
	movs r2, 0x90
	movs r3, 0
	bl sub_8072C74
	b _081338FA
	.align 2, 0
_0813385C: .4byte gUnknownText_Exit
_08133860:
	lsls r1, r6, 1
	adds r0, r2, 0
	adds r0, 0x20
	adds r0, r1
	ldrh r5, [r0]
	movs r4, 0xB1
	lsls r4, 2
	adds r0, r2, r4
	ldrb r0, [r0]
	adds r7, r1, 0
	cmp r0, 0
	beq _081338A4
	ldr r1, _0813389C @ =gContestMoves
	lsls r0, r5, 3
	adds r0, r1
	ldrb r0, [r0, 0x1]
	lsls r0, 29
	lsrs r0, 27
	ldr r1, _081338A0 @ =gUnknown_083CAF70
	adds r0, r1
	ldr r1, [r0]
	adds r0, r3, 0
	movs r2, 0x27
	movs r3, 0
	bl sub_8072C74
	adds r3, r0, 0
	lsls r4, r5, 1
	b _081338C2
	.align 2, 0
_0813389C: .4byte gContestMoves
_081338A0: .4byte gUnknown_083CAF70
_081338A4:
	lsls r4, r5, 1
	adds r0, r4, r5
	lsls r0, 2
	add r0, r9
	ldrb r0, [r0, 0x2]
	lsls r1, r0, 3
	subs r1, r0
	ldr r0, _08133938 @ =gTypeNames
	adds r1, r0
	adds r0, r3, 0
	movs r2, 0x27
	movs r3, 0
	bl sub_8072C74
	adds r3, r0, 0
_081338C2:
	adds r0, r7, r6
	lsls r0, 3
	adds r0, r6
	adds r0, 0x52
	mov r2, r10
	ldr r1, [r2]
	adds r1, r0
	adds r0, r3, 0
	movs r2, 0x72
	movs r3, 0
	bl sub_8072C74
	adds r3, r0, 0
	movs r0, 0xCA
	strb r0, [r3]
	strb r0, [r3, 0x1]
	movs r0, 0xBA
	strb r0, [r3, 0x2]
	adds r3, 0x3
	adds r0, r4, r5
	lsls r0, 2
	add r0, r9
	ldrb r1, [r0, 0x4]
	adds r0, r3, 0
	movs r2, 0x90
	movs r3, 0
	bl sub_8072C14
_081338FA:
	adds r3, r0, 0
	movs r0, 0xFE
	strb r0, [r3]
	adds r3, 0x1
	adds r0, r6, 0x1
	lsls r0, 24
	lsrs r6, r0, 24
	movs r4, 0x1
	negs r4, r4
	add r8, r4
	mov r0, r8
	cmp r0, 0
	blt _08133916
	b _0813381C
_08133916:
	movs r0, 0xFF
	strb r0, [r3]
	ldr r0, _0813393C @ =gTileBuffer
	movs r1, 0xB
	movs r2, 0x1
	bl MenuPrint
	movs r0, 0
	bl sub_813360C
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_08133938: .4byte gTypeNames
_0813393C: .4byte gTileBuffer
	thumb_func_end sub_8133800

	thumb_func_start sub_8133940
sub_8133940: @ 8133940
	push {r4-r7,lr}
	sub sp, 0x34
	adds r4, r1, 0
	lsls r0, 16
	lsrs r5, r0, 16
	ldr r1, _08133968 @ =gExpandedPlaceholder_Empty
	mov r0, sp
	bl StringCopy
	ldrb r0, [r4, 0x2]
	subs r0, 0x1
	cmp r0, 0x6
	bls _0813395C
	b _08133AE2
_0813395C:
	lsls r0, 2
	ldr r1, _0813396C @ =_08133970
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_08133968: .4byte gExpandedPlaceholder_Empty
_0813396C: .4byte _08133970
	.align 2, 0
_08133970:
	.4byte _08133AE2
	.4byte _0813398C
	.4byte _08133AE2
	.4byte _081339A4
	.4byte _08133AE2
	.4byte _081339E4
	.4byte _08133A64
_0813398C:
	ldr r0, _081339A0 @ =gBattleMoves
	lsls r1, r5, 1
	adds r1, r5
	lsls r1, 2
	adds r1, r0
	ldrb r0, [r1, 0x1]
	cmp r0, 0x1
	bls _081339B4
	ldrb r1, [r1, 0x1]
	b _081339CE
	.align 2, 0
_081339A0: .4byte gBattleMoves
_081339A4:
	ldr r0, _081339C4 @ =gBattleMoves
	lsls r1, r5, 1
	adds r1, r5
	lsls r1, 2
	adds r1, r0
	ldrb r0, [r1, 0x3]
	cmp r0, 0
	bne _081339CC
_081339B4:
	ldr r1, _081339C8 @ =gOtherText_ThreeDashes2
	mov r0, sp
	movs r2, 0x20
	movs r3, 0x2
	bl sub_8072C74
	b _081339D8
	.align 2, 0
_081339C4: .4byte gBattleMoves
_081339C8: .4byte gOtherText_ThreeDashes2
_081339CC:
	ldrb r1, [r1, 0x3]
_081339CE:
	mov r0, sp
	movs r2, 0x20
	movs r3, 0x2
	bl sub_8072C14
_081339D8:
	ldrb r1, [r4]
	ldrb r2, [r4, 0x1]
	mov r0, sp
	bl MenuPrint
	b _08133AE2
_081339E4:
	ldrb r2, [r4]
	ldrb r1, [r4, 0x1]
	adds r3, r1, 0x1
	lsls r3, 24
	lsrs r3, 24
	adds r0, r2, 0
	bl MenuZeroFillWindowRect
	ldr r2, _08133A34 @ =gContestEffects
	ldr r1, _08133A38 @ =gContestMoves
	lsls r0, r5, 3
	adds r0, r1
	ldrb r0, [r0]
	lsls r0, 2
	adds r0, r2
	ldrb r0, [r0, 0x1]
	movs r1, 0xA
	bl __udivsi3
	lsls r0, 24
	lsrs r5, r0, 24
	cmp r5, 0xFF
	bne _08133A14
	movs r5, 0
_08133A14:
	movs r4, 0
	ldr r7, _08133A3C @ =gUnknown_030007B0
	ldr r6, _08133A40 @ =gSprites
_08133A1A:
	cmp r4, r5
	bcs _08133A44
	ldr r0, [r7]
	adds r0, r4
	ldrb r1, [r0, 0x7]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r6
	movs r1, 0x1
	bl StartSpriteAnim
	b _08133A58
	.align 2, 0
_08133A34: .4byte gContestEffects
_08133A38: .4byte gContestMoves
_08133A3C: .4byte gUnknown_030007B0
_08133A40: .4byte gSprites
_08133A44:
	ldr r0, [r7]
	adds r0, r4
	ldrb r1, [r0, 0x7]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r6
	movs r1, 0
	bl StartSpriteAnim
_08133A58:
	adds r0, r4, 0x1
	lsls r0, 24
	lsrs r4, r0, 24
	cmp r4, 0x7
	bls _08133A1A
	b _08133AE2
_08133A64:
	ldrb r2, [r4]
	ldrb r1, [r4, 0x1]
	adds r3, r1, 0x1
	lsls r3, 24
	lsrs r3, 24
	adds r0, r2, 0
	bl MenuZeroFillWindowRect
	ldr r2, _08133AB4 @ =gContestEffects
	ldr r1, _08133AB8 @ =gContestMoves
	lsls r0, r5, 3
	adds r0, r1
	ldrb r0, [r0]
	lsls r0, 2
	adds r0, r2
	ldrb r0, [r0, 0x2]
	movs r1, 0xA
	bl __udivsi3
	lsls r0, 24
	lsrs r5, r0, 24
	cmp r5, 0xFF
	bne _08133A94
	movs r5, 0
_08133A94:
	movs r4, 0
	ldr r7, _08133ABC @ =gUnknown_030007B0
	ldr r6, _08133AC0 @ =gSprites
_08133A9A:
	cmp r4, r5
	bcs _08133AC4
	ldr r0, [r7]
	adds r0, r4
	ldrb r1, [r0, 0xF]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r6
	movs r1, 0x3
	bl StartSpriteAnim
	b _08133AD8
	.align 2, 0
_08133AB4: .4byte gContestEffects
_08133AB8: .4byte gContestMoves
_08133ABC: .4byte gUnknown_030007B0
_08133AC0: .4byte gSprites
_08133AC4:
	ldr r0, [r7]
	adds r0, r4
	ldrb r1, [r0, 0xF]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r6
	movs r1, 0x2
	bl StartSpriteAnim
_08133AD8:
	adds r0, r4, 0x1
	lsls r0, 24
	lsrs r4, r0, 24
	cmp r4, 0x7
	bls _08133A9A
_08133AE2:
	add sp, 0x34
	pop {r4-r7}
	pop {r0}
	bx r0
	thumb_func_end sub_8133940

	thumb_func_start sub_8133AEC
sub_8133AEC: @ 8133AEC
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	sub sp, 0x8
	lsls r0, 24
	lsrs r3, r0, 24
	ldr r6, _08133B88 @ =gUnknown_030007B0
	ldr r2, [r6]
	ldrb r1, [r2, 0x1B]
	ldrb r0, [r2, 0x1A]
	subs r0, 0x1
	cmp r1, r0
	bne _08133B08
	b _08133C04
_08133B08:
	lsls r1, 1
	adds r0, r2, 0
	adds r0, 0x20
	adds r0, r1
	ldrh r5, [r0]
	cmp r3, 0
	beq _08133BA0
	movs r4, 0
	lsls r0, r5, 3
	mov r8, r0
	ldr r7, _08133B8C @ =gSprites
	adds r3, r6, 0
	movs r6, 0x5
	negs r6, r6
_08133B24:
	ldr r0, [r3]
	adds r0, r4
	ldrb r0, [r0, 0x7]
	lsls r1, r0, 4
	adds r1, r0
	lsls r1, 2
	adds r1, r7
	adds r1, 0x3E
	ldrb r2, [r1]
	adds r0, r6, 0
	ands r0, r2
	strb r0, [r1]
	adds r0, r4, 0x1
	lsls r0, 16
	lsrs r4, r0, 16
	cmp r4, 0xF
	bls _08133B24
	movs r4, 0
_08133B48:
	ldr r0, _08133B90 @ =gUnknown_08402E3D
	adds r0, r4, r0
	ldrb r0, [r0]
	lsls r1, r0, 1
	adds r1, r0
	ldr r0, _08133B94 @ =gUnknown_08402E24
	adds r1, r0
	adds r0, r5, 0
	bl sub_8133940
	adds r0, r4, 0x1
	lsls r0, 16
	lsrs r4, r0, 16
	cmp r4, 0x2
	bls _08133B48
	ldr r1, _08133B98 @ =gUnknown_083CADD4
	ldr r0, _08133B9C @ =gContestMoves
	add r0, r8
	ldrb r0, [r0]
	lsls r0, 2
	adds r0, r1
	ldr r0, [r0]
	movs r1, 0x20
	str r1, [sp]
	movs r1, 0x1
	str r1, [sp, 0x4]
	movs r1, 0x58
	movs r2, 0x48
	movs r3, 0x90
	bl sub_8072AB0
	b _08133C92
	.align 2, 0
_08133B88: .4byte gUnknown_030007B0
_08133B8C: .4byte gSprites
_08133B90: .4byte gUnknown_08402E3D
_08133B94: .4byte gUnknown_08402E24
_08133B98: .4byte gUnknown_083CADD4
_08133B9C: .4byte gContestMoves
_08133BA0:
	movs r4, 0
	subs r6, r5, 0x1
_08133BA4:
	ldr r0, _08133BF8 @ =gUnknown_08402E39
	adds r0, r4, r0
	ldrb r0, [r0]
	lsls r1, r0, 1
	adds r1, r0
	ldr r0, _08133BFC @ =gUnknown_08402E24
	adds r1, r0
	adds r0, r5, 0
	bl sub_8133940
	adds r0, r4, 0x1
	lsls r0, 16
	lsrs r4, r0, 16
	cmp r4, 0x3
	bls _08133BA4
	ldr r1, _08133C00 @ =gMoveDescriptions
	lsls r0, r6, 2
	adds r0, r1
	ldr r0, [r0]
	movs r1, 0x1
	str r1, [sp]
	movs r1, 0x58
	movs r2, 0x48
	movs r3, 0x90
	bl sub_8072A18
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bhi _08133C92
	lsls r1, r0, 25
	movs r0, 0x90
	lsls r0, 20
	adds r1, r0
	lsrs r1, 24
	movs r0, 0xB
	movs r2, 0x1C
	movs r3, 0xC
	bl MenuFillWindowRectWithBlankTile
	b _08133C92
	.align 2, 0
_08133BF8: .4byte gUnknown_08402E39
_08133BFC: .4byte gUnknown_08402E24
_08133C00: .4byte gMoveDescriptions
_08133C04:
	cmp r3, 0
	beq _08133C5C
	ldr r4, _08133C54 @ =gUnknown_08402E24
	ldrb r2, [r4, 0xF]
	ldrb r1, [r4, 0x10]
	adds r3, r1, 0x1
	lsls r3, 24
	lsrs r3, 24
	adds r0, r2, 0
	bl MenuZeroFillWindowRect
	ldrb r2, [r4, 0x12]
	ldrb r1, [r4, 0x13]
	adds r3, r1, 0x1
	lsls r3, 24
	lsrs r3, 24
	adds r0, r2, 0
	bl MenuZeroFillWindowRect
	movs r4, 0
	ldr r5, _08133C58 @ =gSprites
	adds r3, r6, 0
	movs r2, 0x4
_08133C32:
	ldr r0, [r3]
	adds r0, r4
	ldrb r1, [r0, 0x7]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r5
	adds r0, 0x3E
	ldrb r1, [r0]
	orrs r1, r2
	strb r1, [r0]
	adds r0, r4, 0x1
	lsls r0, 16
	lsrs r4, r0, 16
	cmp r4, 0xF
	bls _08133C32
	b _08133C86
	.align 2, 0
_08133C54: .4byte gUnknown_08402E24
_08133C58: .4byte gSprites
_08133C5C:
	ldr r4, _08133CA0 @ =gUnknown_08402E24
	ldrb r0, [r4, 0x3]
	ldrb r1, [r4, 0x4]
	adds r2, r0, 0x3
	lsls r2, 24
	lsrs r2, 24
	adds r3, r1, 0x1
	lsls r3, 24
	lsrs r3, 24
	bl MenuZeroFillWindowRect
	ldrb r0, [r4, 0x9]
	ldrb r1, [r4, 0xA]
	adds r2, r0, 0x3
	lsls r2, 24
	lsrs r2, 24
	adds r3, r1, 0x1
	lsls r3, 24
	lsrs r3, 24
	bl MenuZeroFillWindowRect
_08133C86:
	movs r0, 0xB
	movs r1, 0x9
	movs r2, 0x1C
	movs r3, 0xC
	bl MenuZeroFillWindowRect
_08133C92:
	add sp, 0x8
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_08133CA0: .4byte gUnknown_08402E24
	thumb_func_end sub_8133AEC

	thumb_func_start sub_8133CA4
sub_8133CA4: @ 8133CA4
	push {lr}
	movs r0, 0x15
	movs r1, 0x7
	movs r2, 0x1B
	movs r3, 0xC
	bl MenuZeroFillWindowRect
	ldr r0, _08133CC8 @ =gUnknown_030007B0
	ldr r0, [r0]
	movs r1, 0xB1
	lsls r1, 2
	adds r0, r1
	ldrb r0, [r0]
	movs r1, 0
	bl sub_8133AEC
	pop {r0}
	bx r0
	.align 2, 0
_08133CC8: .4byte gUnknown_030007B0
	thumb_func_end sub_8133CA4

	thumb_func_start SetUpFieldMove_SoftBoiled
SetUpFieldMove_SoftBoiled: @ 8133CCC
	push {r4-r6,lr}
	mov r6, r8
	push {r6}
	ldr r0, _08133D14 @ =gLastFieldPokeMenuOpened
	mov r8, r0
	ldrb r0, [r0]
	movs r6, 0x64
	muls r0, r6
	ldr r4, _08133D18 @ =gPlayerParty
	adds r0, r4
	movs r1, 0x3A
	bl GetMonData
	adds r5, r0, 0
	lsls r5, 16
	lsrs r5, 16
	mov r1, r8
	ldrb r0, [r1]
	muls r0, r6
	adds r0, r4
	movs r1, 0x39
	bl GetMonData
	adds r4, r0, 0
	lsls r4, 16
	lsrs r4, 16
	adds r0, r5, 0
	movs r1, 0x5
	bl __udivsi3
	lsls r0, 16
	lsrs r0, 16
	cmp r4, r0
	bcs _08133D1C
	movs r0, 0
	b _08133D1E
	.align 2, 0
_08133D14: .4byte gLastFieldPokeMenuOpened
_08133D18: .4byte gPlayerParty
_08133D1C:
	movs r0, 0x1
_08133D1E:
	pop {r3}
	mov r8, r3
	pop {r4-r6}
	pop {r1}
	bx r1
	thumb_func_end SetUpFieldMove_SoftBoiled

	thumb_func_start sub_8133D28
sub_8133D28: @ 8133D28
	push {lr}
	lsls r0, 24
	lsrs r0, 24
	ldr r1, _08133D44 @ =0x02001000
	ldr r2, _08133D48 @ =sub_8133D50
	str r2, [r1, 0xC]
	ldr r2, _08133D4C @ =0x0001a272
	adds r1, r2
	movs r2, 0x3
	strh r2, [r1]
	bl sub_808A004
	pop {r0}
	bx r0
	.align 2, 0
_08133D44: .4byte 0x02001000
_08133D48: .4byte sub_8133D50
_08133D4C: .4byte 0x0001a272
	thumb_func_end sub_8133D28

	thumb_func_start sub_8133D50
sub_8133D50: @ 8133D50
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	lsls r0, 24
	lsrs r7, r0, 24
	ldr r0, _08133DA0 @ =gSprites
	mov r9, r0
	ldr r1, _08133DA4 @ =0x02001000
	mov r10, r1
	ldrb r1, [r1, 0x1]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	add r0, r9
	ldrh r0, [r0, 0x2E]
	lsls r0, 24
	lsrs r0, 24
	mov r8, r0
	mov r2, r10
	ldrb r1, [r2, 0x2]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	mov r2, r9
	adds r1, r0, r2
	ldrh r0, [r1, 0x2E]
	lsls r0, 24
	lsrs r6, r0, 24
	mov r0, r8
	cmp r0, 0x5
	bhi _08133D96
	cmp r6, 0x5
	bls _08133DA8
_08133D96:
	adds r0, r7, 0
	bl sub_806CD44
	b _08133E4E
	.align 2, 0
_08133DA0: .4byte gSprites
_08133DA4: .4byte 0x02001000
_08133DA8:
	movs r5, 0xD8
	lsls r5, 9
	add r5, r10
	movs r2, 0x2E
	ldrsh r0, [r1, r2]
	movs r1, 0x64
	muls r0, r1
	ldr r2, _08133DE4 @ =gPlayerParty
	adds r0, r2
	str r0, [r5]
	movs r1, 0x39
	bl GetMonData
	lsls r0, 16
	lsrs r4, r0, 16
	cmp r4, 0
	beq _08133DDA
	cmp r8, r6
	beq _08133DDA
	ldr r0, [r5]
	movs r1, 0x3A
	bl GetMonData
	cmp r0, r4
	bne _08133DE8
_08133DDA:
	adds r0, r7, 0
	bl sub_8133EB8
	b _08133E4E
	.align 2, 0
_08133DE4: .4byte gPlayerParty
_08133DE8:
	movs r0, 0x1
	bl PlaySE
	mov r0, r10
	ldrb r1, [r0, 0x1]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	add r0, r9
	ldrh r0, [r0, 0x2E]
	movs r1, 0
	strb r0, [r5, 0x5]
	ldrb r0, [r5, 0x5]
	movs r2, 0x64
	muls r0, r2
	ldr r2, _08133E5C @ =gPlayerParty
	adds r0, r2
	str r0, [r5]
	strh r1, [r5, 0x6]
	ldr r1, _08133E60 @ =0xffff8000
	str r1, [r5, 0xC]
	ldr r1, _08133E64 @ =sub_8133EF8
	str r1, [r5, 0x10]
	movs r1, 0x3A
	bl GetMonData
	ldr r1, _08133E68 @ =gTasks
	lsls r4, r7, 2
	adds r4, r7
	lsls r4, 3
	adds r4, r1
	strh r0, [r4, 0x1C]
	ldr r0, [r5]
	movs r1, 0x39
	bl GetMonData
	strh r0, [r4, 0x1E]
	movs r1, 0x1C
	ldrsh r0, [r4, r1]
	movs r1, 0x5
	bl __divsi3
	strh r0, [r4, 0x20]
	bl sub_806D5A4
	ldr r0, _08133E6C @ =sub_806FA18
	str r0, [r4]
	ldrh r1, [r4, 0x1E]
	ldr r0, _08133E70 @ =0x0001a282
	add r0, r10
	strh r1, [r0]
_08133E4E:
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_08133E5C: .4byte gPlayerParty
_08133E60: .4byte 0xffff8000
_08133E64: .4byte sub_8133EF8
_08133E68: .4byte gTasks
_08133E6C: .4byte sub_806FA18
_08133E70: .4byte 0x0001a282
	thumb_func_end sub_8133D50

	thumb_func_start sub_8133E74
sub_8133E74: @ 8133E74
	push {r4,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	ldr r0, _08133EAC @ =gUnknown_0202E8F6
	ldrb r0, [r0]
	cmp r0, 0
	bne _08133EA4
	movs r0, 0x3
	movs r1, 0xE
	movs r2, 0x1A
	movs r3, 0x13
	bl MenuZeroFillWindowRect
	movs r0, 0x3
	movs r1, 0
	bl sub_806D538
	ldr r0, _08133EB0 @ =gTasks
	lsls r1, r4, 2
	adds r1, r4
	lsls r1, 3
	adds r1, r0
	ldr r0, _08133EB4 @ =sub_806CB74
	str r0, [r1]
_08133EA4:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08133EAC: .4byte gUnknown_0202E8F6
_08133EB0: .4byte gTasks
_08133EB4: .4byte sub_806CB74
	thumb_func_end sub_8133E74

	thumb_func_start sub_8133EB8
sub_8133EB8: @ 8133EB8
	push {r4,lr}
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	ldr r1, _08133EE8 @ =gUnknown_0202E8F4
	movs r0, 0
	strb r0, [r1]
	bl sub_806D5A4
	ldr r0, _08133EEC @ =gOtherText_CantUseOnPoke
	movs r1, 0x1
	bl sub_806E834
	ldr r1, _08133EF0 @ =gTasks
	lsls r0, r4, 2
	adds r0, r4
	lsls r0, 3
	adds r0, r1
	ldr r1, _08133EF4 @ =sub_8133E74
	str r1, [r0]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08133EE8: .4byte gUnknown_0202E8F4
_08133EEC: .4byte gOtherText_CantUseOnPoke
_08133EF0: .4byte gTasks
_08133EF4: .4byte sub_8133E74
	thumb_func_end sub_8133EB8

	thumb_func_start sub_8133EF8
sub_8133EF8: @ 8133EF8
	push {r4,lr}
	bl sub_806CCE4
	ldr r4, _08133F3C @ =0x0201b000
	ldr r0, _08133F40 @ =0x00000261
	adds r1, r4, r0
	movs r0, 0x2
	strb r0, [r1]
	ldr r0, _08133F44 @ =0xfffe6000
	adds r4, r0
	ldrb r1, [r4, 0x1]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	ldr r1, _08133F48 @ =gSprites
	adds r0, r1
	bl DestroySprite
	movs r0, 0x3
	movs r1, 0xE
	movs r2, 0x1A
	movs r3, 0x13
	bl MenuZeroFillWindowRect
	movs r0, 0
	movs r1, 0
	bl sub_806D538
	ldrb r0, [r4]
	bl SwitchTaskToFollowupFunc
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08133F3C: .4byte 0x0201b000
_08133F40: .4byte 0x00000261
_08133F44: .4byte 0xfffe6000
_08133F48: .4byte gSprites
	thumb_func_end sub_8133EF8

	thumb_func_start sub_8133F4C
sub_8133F4C: @ 8133F4C
	push {r4,r5,lr}
	lsls r0, 24
	movs r3, 0
	ldr r1, _08133F7C @ =gDecorationInventories
	lsrs r2, r0, 21
	adds r0, r2, r1
	ldrb r0, [r0, 0x4]
	cmp r3, r0
	bcs _08133F76
	adds r5, r1, 0
	movs r4, 0
_08133F62:
	adds r0, r2, r5
	ldr r1, [r0]
	adds r1, r3
	strb r4, [r1]
	adds r1, r3, 0x1
	lsls r1, 24
	lsrs r3, r1, 24
	ldrb r0, [r0, 0x4]
	cmp r3, r0
	bcc _08133F62
_08133F76:
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_08133F7C: .4byte gDecorationInventories
	thumb_func_end sub_8133F4C

	thumb_func_start sub_8133F80
sub_8133F80: @ 8133F80
	push {r4,lr}
	movs r4, 0
_08133F84:
	adds r0, r4, 0
	bl sub_8133F4C
	adds r0, r4, 0x1
	lsls r0, 24
	lsrs r4, r0, 24
	cmp r4, 0x7
	bls _08133F84
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end sub_8133F80

	thumb_func_start sub_8133F9C
sub_8133F9C: @ 8133F9C
	push {r4,lr}
	lsls r0, 24
	movs r2, 0
	ldr r1, _08133FC8 @ =gDecorationInventories
	lsrs r0, 21
	adds r0, r1
	movs r1, 0x4
	ldrsb r1, [r0, r1]
	cmp r2, r1
	bge _08133FD8
	adds r4, r0, 0
	adds r3, r1, 0
_08133FB4:
	lsls r0, r2, 24
	asrs r1, r0, 24
	ldr r0, [r4]
	adds r0, r1
	ldrb r0, [r0]
	cmp r0, 0
	bne _08133FCC
	adds r0, r1, 0
	b _08133FDC
	.align 2, 0
_08133FC8: .4byte gDecorationInventories
_08133FCC:
	adds r0, r1, 0x1
	lsls r0, 24
	lsrs r2, r0, 24
	asrs r0, 24
	cmp r0, r3
	blt _08133FB4
_08133FD8:
	movs r0, 0x1
	negs r0, r0
_08133FDC:
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end sub_8133F9C

	thumb_func_start sub_8133FE4
sub_8133FE4: @ 8133FE4
	push {r4,lr}
	lsls r0, 24
	lsrs r3, r0, 24
	ldr r1, _08134010 @ =gDecorations
	lsls r0, r3, 5
	adds r0, r1
	ldrb r0, [r0, 0x13]
	movs r2, 0
	ldr r1, _08134014 @ =gDecorationInventories
	lsls r0, 3
	adds r0, r1
	ldrb r1, [r0, 0x4]
	cmp r2, r1
	bcs _08134022
	ldr r4, [r0]
_08134002:
	adds r0, r4, r2
	ldrb r0, [r0]
	cmp r0, r3
	bne _08134018
	movs r0, 0x1
	b _08134024
	.align 2, 0
_08134010: .4byte gDecorations
_08134014: .4byte gDecorationInventories
_08134018:
	adds r0, r2, 0x1
	lsls r0, 24
	lsrs r2, r0, 24
	cmp r2, r1
	bcc _08134002
_08134022:
	movs r0, 0
_08134024:
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end sub_8133FE4

	thumb_func_start IsThereStorageSpaceForDecoration
IsThereStorageSpaceForDecoration: @ 813402C
	push {r4,r5,lr}
	lsls r0, 24
	lsrs r0, 24
	adds r4, r0, 0
	cmp r4, 0
	beq _0813406C
	ldr r1, _08134064 @ =gDecorations
	lsls r0, r4, 5
	adds r0, r1
	ldrb r5, [r0, 0x13]
	adds r0, r5, 0
	bl sub_8133F9C
	lsls r0, 24
	asrs r2, r0, 24
	movs r0, 0x1
	negs r0, r0
	cmp r2, r0
	beq _0813406C
	ldr r0, _08134068 @ =gDecorationInventories
	lsls r1, r5, 3
	adds r1, r0
	ldr r0, [r1]
	adds r0, r2
	strb r4, [r0]
	movs r0, 0x1
	b _0813406E
	.align 2, 0
_08134064: .4byte gDecorations
_08134068: .4byte gDecorationInventories
_0813406C:
	movs r0, 0
_0813406E:
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end IsThereStorageSpaceForDecoration

	thumb_func_start sub_8134074
sub_8134074: @ 8134074
	push {lr}
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0
	beq _081340A0
	ldr r1, _0813409C @ =gDecorations
	lsls r0, 5
	adds r0, r1
	ldrb r0, [r0, 0x13]
	bl sub_8133F9C
	lsls r0, 24
	asrs r0, 24
	movs r1, 0x1
	negs r1, r1
	cmp r0, r1
	beq _081340A0
	movs r0, 0x1
	b _081340A2
	.align 2, 0
_0813409C: .4byte gDecorations
_081340A0:
	movs r0, 0
_081340A2:
	pop {r1}
	bx r1
	thumb_func_end sub_8134074

	thumb_func_start sub_81340A8
sub_81340A8: @ 81340A8
	push {r4-r6,lr}
	lsls r0, 24
	lsrs r5, r0, 24
	movs r3, 0
	cmp r5, 0
	bne _081340C4
	b _081340F2
_081340B6:
	movs r0, 0
	strb r0, [r1]
	adds r0, r6, 0
	bl sub_8134104
	movs r0, 0x1
	b _081340F4
_081340C4:
	ldr r2, _081340FC @ =gDecorationInventories
	ldr r1, _08134100 @ =gDecorations
	lsls r0, r5, 5
	adds r0, r1
	ldrb r4, [r0, 0x13]
	lsls r0, r4, 3
	adds r0, r2
	ldrb r1, [r0, 0x4]
	cmp r3, r1
	bcs _081340F2
	adds r6, r4, 0
	adds r4, r0, 0
	adds r2, r1, 0
_081340DE:
	ldr r0, [r4]
	adds r1, r0, r3
	ldrb r0, [r1]
	cmp r0, r5
	beq _081340B6
	adds r0, r3, 0x1
	lsls r0, 24
	lsrs r3, r0, 24
	cmp r3, r2
	bcc _081340DE
_081340F2:
	movs r0, 0
_081340F4:
	pop {r4-r6}
	pop {r1}
	bx r1
	.align 2, 0
_081340FC: .4byte gDecorationInventories
_08134100: .4byte gDecorations
	thumb_func_end sub_81340A8

	thumb_func_start sub_8134104
sub_8134104: @ 8134104
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	sub sp, 0x4
	lsls r0, 24
	movs r6, 0
	ldr r2, _08134190 @ =gDecorationInventories
	lsrs r1, r0, 21
	adds r0, r1, r2
	ldrb r0, [r0, 0x4]
	cmp r6, r0
	bcs _08134180
	adds r7, r1, 0
	mov r8, r0
	str r0, [sp]
_08134126:
	adds r1, r6, 0x1
	lsls r0, r1, 24
	lsrs r3, r0, 24
	adds r2, r7, 0
	mov r12, r1
	cmp r3, r8
	bcs _08134174
	ldr r1, _08134190 @ =gDecorationInventories
	mov r10, r1
	adds r0, r1, 0
	mov r9, r0
_0813413C:
	mov r1, r10
	adds r5, r2, r1
	ldr r1, [r5]
	adds r0, r1, r3
	ldrb r4, [r0]
	adds r2, r4, 0
	cmp r2, 0
	beq _08134162
	adds r0, r1, r6
	ldrb r1, [r0]
	cmp r1, 0
	beq _08134158
	cmp r1, r2
	bls _08134162
_08134158:
	ldrb r1, [r0]
	strb r4, [r0]
	ldr r0, [r5]
	adds r0, r3
	strb r1, [r0]
_08134162:
	adds r0, r3, 0x1
	lsls r0, 24
	lsrs r3, r0, 24
	adds r2, r7, 0
	mov r1, r9
	adds r0, r2, r1
	ldrb r0, [r0, 0x4]
	cmp r3, r0
	bcc _0813413C
_08134174:
	mov r1, r12
	lsls r0, r1, 24
	lsrs r6, r0, 24
	ldr r0, [sp]
	cmp r6, r0
	bcc _08134126
_08134180:
	add sp, 0x4
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_08134190: .4byte gDecorationInventories
	thumb_func_end sub_8134104

	thumb_func_start sub_8134194
sub_8134194: @ 8134194
	push {r4,r5,lr}
	lsls r0, 24
	movs r4, 0
	movs r3, 0
	ldr r2, _081341D0 @ =gDecorationInventories
	lsrs r1, r0, 21
	adds r0, r1, r2
	ldrb r0, [r0, 0x4]
	cmp r4, r0
	bcs _081341C8
	adds r5, r2, 0
_081341AA:
	adds r2, r1, r5
	ldr r0, [r2]
	adds r0, r3
	ldrb r0, [r0]
	cmp r0, 0
	beq _081341BC
	adds r0, r4, 0x1
	lsls r0, 24
	lsrs r4, r0, 24
_081341BC:
	adds r0, r3, 0x1
	lsls r0, 24
	lsrs r3, r0, 24
	ldrb r2, [r2, 0x4]
	cmp r3, r2
	bcc _081341AA
_081341C8:
	adds r0, r4, 0
	pop {r4,r5}
	pop {r1}
	bx r1
	.align 2, 0
_081341D0: .4byte gDecorationInventories
	thumb_func_end sub_8134194

	thumb_func_start sub_81341D4
sub_81341D4: @ 81341D4
	push {r4,r5,lr}
	movs r5, 0
	movs r4, 0
_081341DA:
	adds r0, r4, 0
	bl sub_8134194
	adds r0, r5, r0
	lsls r0, 24
	lsrs r5, r0, 24
	adds r0, r4, 0x1
	lsls r0, 24
	lsrs r4, r0, 24
	cmp r4, 0x7
	bls _081341DA
	adds r0, r5, 0
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end sub_81341D4

	.align 2, 0 @ Don't pad with nop.
