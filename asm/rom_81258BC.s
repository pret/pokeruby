	.include "constants/gba_constants.s"
	.include "constants/species_constants.s"
	.include "asm/macros.s"

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
	ldr r0, _0812AF2C
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
	ldr r1, _0812AF8C
	lsls r6, r0, 2
	adds r6, r0
	lsls r6, 3
	adds r6, r1
	ldr r1, _0812AF90
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
	ldr r0, _0812AF94
	str r0, [r6]
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_0812AF8C: .4byte gTasks
_0812AF90: .4byte gUnknown_03004B00
_0812AF94: .4byte sub_812AF98
	thumb_func_end sub_812AF30

	thumb_func_start sub_812AF98
sub_812AF98: @ 812AF98
	push {r4-r6,lr}
	lsls r0, 24
	lsrs r0, 24
	ldr r2, _0812AFC8
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
	ldr r0, _0812AFCC
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
	ldr r1, _0812B054
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
	ldr r0, _0812B0FC
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
	ldr r2, _0812B100
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
	ldr r2, _0812B104
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
_0812B0FC: .4byte gUnknown_03004B00
_0812B100: .4byte gTasks
_0812B104: .4byte sub_812B108
	thumb_func_end sub_812B058

	thumb_func_start sub_812B108
sub_812B108: @ 812B108
	push {r4,r5,lr}
	lsls r0, 24
	lsrs r5, r0, 24
	ldr r1, _0812B14C
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
	ldr r1, _0812B188
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
	ldr r0, _0812B1BC
	movs r1, 0
	ldrsh r0, [r0, r1]
	cmp r0, 0
	bne _0812B1C4
	ldr r0, _0812B1C0
	ldrh r4, [r0]
	b _0812B272
	.align 2, 0
_0812B1BC: .4byte gUnknown_03004B00
_0812B1C0: .4byte 0x02019348
_0812B1C4:
	adds r0, r5, 0
	bl move_anim_task_del
	b _0812B272
_0812B1CC:
	ldr r0, _0812B1E0
	movs r2, 0
	ldrsh r1, [r0, r2]
	adds r2, r0, 0
	cmp r1, 0
	bne _0812B1E8
	ldr r0, _0812B1E4
	ldrb r4, [r0]
	b _0812B20E
	.align 2, 0
_0812B1E0: .4byte gUnknown_03004B00
_0812B1E4: .4byte gUnknown_0202F7C8
_0812B1E8:
	cmp r1, 0x1
	bne _0812B1F8
	ldr r0, _0812B1F4
	ldrb r4, [r0]
	b _0812B20E
	.align 2, 0
_0812B1F4: .4byte gUnknown_0202F7C9
_0812B1F8:
	cmp r1, 0x2
	bne _0812B204
	ldr r0, _0812B200
	b _0812B206
	.align 2, 0
_0812B200: .4byte gUnknown_0202F7C8
_0812B204:
	ldr r0, _0812B230
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
	ldr r1, _0812B250
	lsls r0, r4, 1
	adds r0, r1
	ldrh r1, [r0]
	movs r0, 0x64
	muls r0, r1
	ldr r1, _0812B254
	b _0812B266
	.align 2, 0
_0812B250: .4byte gUnknown_02024A6A
_0812B254: .4byte gEnemyParty
_0812B258:
	ldr r1, _0812B290
	lsls r0, r4, 1
	adds r0, r1
	ldrh r1, [r0]
	movs r0, 0x64
	muls r0, r1
	ldr r1, _0812B294
_0812B266:
	adds r0, r1
	movs r1, 0xB
	bl GetMonData
	lsls r0, 16
	lsrs r4, r0, 16
_0812B272:
	cmp r4, 0
	beq _0812B2AA
	ldr r0, _0812B298
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
_0812B298: .4byte gUnknown_03004B00
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
	ldr r0, _0812B2D8
	b _0812B2E6
	.align 2, 0
_0812B2D8: .4byte 0x02019348
_0812B2DC:
	ldr r1, _0812B304
	ldr r0, _0812B308
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
	ldr r0, _0812B33C
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
_0812B33C: .4byte gUnknown_03004B00
	thumb_func_end sub_812B30C

	thumb_func_start sub_812B340
sub_812B340: @ 812B340
	push {r4,r5,lr}
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	ldr r0, _0812B370
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
_0812B370: .4byte gUnknown_03004B00
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
	ldr r0, _0812B3F8
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
	ldr r2, _0812B3FC
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
	ldr r2, _0812B400
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
_0812B3F8: .4byte gUnknown_03004B00
_0812B3FC: .4byte gTasks
_0812B400: .4byte sub_812B404
	thumb_func_end sub_812B374

	thumb_func_start sub_812B404
sub_812B404: @ 812B404
	push {r4,r5,lr}
	lsls r0, 24
	lsrs r0, 24
	adds r5, r0, 0
	ldr r1, _0812B45C
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
	ldr r1, _0812B460
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
	ldr r1, _0812B478
	ldr r0, _0812B47C
	ldrb r0, [r0]
	lsls r0, 2
	adds r0, r1
	ldr r1, _0812B480
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
	ldr r2, _0812B4B8
	ldr r1, _0812B4BC
	ldr r0, _0812B4C0
	ldrb r3, [r0]
	lsls r0, r3, 2
	adds r0, r1
	ldr r1, [r2]
	ldr r0, [r0]
	ands r1, r0
	cmp r1, 0
	beq _0812B4D0
	ldr r0, _0812B4C4
	lsls r1, r3, 9
	adds r1, r0
	ldrb r0, [r1]
	cmp r0, 0x38
	bhi _0812B4CC
	ldr r0, _0812B4C8
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
	ldr r0, _0812B508
	ldrh r1, [r0, 0x2E]
	movs r2, 0x1
	adds r0, r2, 0
	ands r0, r1
	cmp r0, 0
	beq _0812B546
	movs r0, 0x5
	bl PlaySE
	bl sub_814A7FC
	ldr r1, _0812B50C
	ldr r0, _0812B510
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
	ldr r5, _0812B57C
	ldr r4, _0812B580
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
	ldr r5, _0812B5B8
	ldr r4, _0812B5BC
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
	ldr r5, _0812B604
	ldr r4, _0812B608
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
	ldr r5, _0812B654
	ldr r4, _0812B658
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
	ldr r2, _0812B684
	ldr r1, _0812B688
	ldr r0, _0812B68C
	ldrb r0, [r0]
	adds r0, r1
	ldrb r1, [r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r2, 0x1C
	adds r0, r2
	ldr r1, [r0]
	ldr r0, _0812B690
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
	ldr r0, _0812B6A8
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
	ldr r0, _0812B6DC
	ldrb r1, [r0, 0x7]
	movs r0, 0x80
	ands r0, r1
	cmp r0, 0
	bne _0812B6D6
	ldr r2, _0812B6E0
	ldr r0, _0812B6E4
	adds r3, r2, r0
	ldrb r1, [r3]
	movs r0, 0x3
	negs r0, r0
	ands r0, r1
	strb r0, [r3]
	ldr r0, _0812B6E8
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
	ldr r0, _0812B718
	ldrb r0, [r0]
	cmp r0, 0
	beq _0812B70E
	ldr r0, _0812B71C
	ldrb r1, [r0]
	lsls r0, r1, 1
	adds r0, r1
	lsls r0, 2
	ldr r1, _0812B720
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
	ldr r0, _0812B748
	ldrb r1, [r0, 0x7]
	movs r0, 0x80
	ands r0, r1
	cmp r0, 0
	bne _0812B744
	ldr r1, _0812B74C
	ldr r0, _0812B750
	ldrb r0, [r0]
	lsls r0, 2
	adds r0, r1
	ldr r1, _0812B754
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
	ldr r0, _0812B784
	ldr r1, [r0, 0x4]
	ldr r0, _0812B788
	cmp r1, r0
	bne _0812B77E
	ldr r0, _0812B78C
	ldrb r1, [r0, 0x7]
	movs r0, 0x80
	ands r0, r1
	cmp r0, 0
	bne _0812B77E
	ldr r0, _0812B790
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
_0812B790: .4byte word_203855E
	thumb_func_end sub_812B758

	thumb_func_start sub_812B794
sub_812B794: @ 812B794
	push {lr}
	ldr r0, _0812B7B8
	ldrb r1, [r0]
	lsls r0, r1, 1
	adds r0, r1
	lsls r0, 2
	ldr r1, _0812B7BC
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
	ldr r1, _0812B800
	ldr r4, _0812B804
	ldrb r0, [r4]
	lsls r0, 2
	adds r0, r1
	ldr r1, _0812B808
	str r1, [r0]
	ldr r0, _0812B80C
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
	ldr r1, _0812B810
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
_0812B80C: .4byte gUnknown_020239F8
_0812B810: .4byte gUnknown_02023A60
_0812B814:
	ldr r2, _0812B830
	ldr r1, _0812B834
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
	ldr r0, _0812B85C
	ldrb r1, [r0]
	lsls r0, r1, 1
	adds r0, r1
	lsls r0, 2
	ldr r1, _0812B860
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
	ldr r4, _0812B96C
	ldrb r0, [r4, 0x8]
	ldr r5, _0812B970
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
	ldr r0, _0812B974
	ldr r2, _0812B978
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
	ldr r6, _0812B97C
	ldrb r1, [r5]
	adds r1, r6
	strb r0, [r1]
	ldr r4, _0812B980
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
	ldr r1, _0812B984
	strh r1, [r0, 0x2E]
	ldrb r0, [r5]
	adds r0, r6
	ldrb r1, [r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r4, 0x1C
	adds r0, r4
	ldr r1, _0812B988
	str r1, [r0]
	ldr r1, _0812B98C
	ldrb r0, [r5]
	lsls r0, 2
	adds r0, r1
	ldr r1, _0812B990
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
	ldr r1, _0812BA00
	movs r0, 0x4
	strb r0, [r1, 0x8]
	ldr r1, _0812BA04
	movs r0, 0x1
	strb r0, [r1]
	ldr r5, _0812BA08
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
	ldr r1, _0812BA0C
	ldrb r0, [r5]
	lsls r0, 2
	adds r0, r1
	ldr r1, _0812BA10
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
	ldr r1, _0812BA58
	ldr r5, _0812BA5C
	ldrb r0, [r5]
	lsls r0, 9
	adds r1, 0x1
	adds r0, r1
	ldrb r1, [r0]
	ldr r0, _0812BA60
	strb r1, [r0, 0x8]
	ldr r1, _0812BA64
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
	ldr r1, _0812BA68
	ldrb r0, [r5]
	lsls r0, 2
	adds r0, r1
	ldr r1, _0812BA6C
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
	ldr r0, _0812BACC
	movs r1, 0
	strh r1, [r0]
	ldr r0, _0812BAD0
	strh r1, [r0]
	ldr r4, _0812BAD4
	ldrb r0, [r4]
	lsls r0, 9
	ldr r1, _0812BAD8
	adds r0, r1
	ldrh r0, [r0]
	bl sub_8120AA8
	ldr r0, _0812BADC
	ldr r1, _0812BAE0
	movs r2, 0xF
	str r2, [sp]
	movs r2, 0x90
	movs r3, 0x2
	bl sub_8002EB0
	ldr r1, _0812BAE4
	ldrb r0, [r4]
	lsls r0, 2
	adds r0, r1
	ldr r1, _0812BAE8
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
	ldr r0, _0812BB04
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
	ldr r0, _0812BBCC
	movs r2, 0
	strh r2, [r0]
	ldr r1, _0812BBD0
	movs r0, 0xA0
	strh r0, [r1]
	ldr r4, _0812BBD4
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
	ldr r1, _0812BBD8
	ldr r0, _0812BBDC
	ldrb r0, [r0]
	lsls r0, 2
	adds r0, r1
	ldr r1, _0812BBE0
	str r1, [r0]
	ldr r1, _0812BBE4
	movs r2, 0xC8
	lsls r2, 1
	movs r0, 0x23
	str r0, [sp]
	adds r0, r4, 0
	movs r3, 0x12
	bl InitWindow
	adds r0, r4, 0
	bl sub_8002F44
	ldr r1, _0812BBE8
	ldr r3, _0812BBEC
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
	ldr r1, _0812BBF0
	ldr r0, _0812BBDC
	ldrb r0, [r0]
	adds r0, r1
	ldrb r0, [r0]
	movs r1, 0
	bl sub_802E3E4
	ldr r0, _0812BBF4
	bl get_battle_strings_
	ldr r4, _0812BBD4
	ldr r1, _0812BBF8
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
	ldr r1, _0812BC44
	ldr r2, _0812BC48
	ldrb r0, [r2]
	lsls r0, 2
	adds r0, r1
	ldr r1, _0812BC4C
	str r1, [r0]
	ldr r1, _0812BC50
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
	ldr r0, _0812BCB0
	ldr r1, _0812BCB4
	ldrb r1, [r1]
	adds r0, r1, r0
	ldrb r0, [r0]
	ldr r2, _0812BCB8
	lsls r1, 1
	adds r1, r2
	ldrh r2, [r1]
	movs r1, 0x64
	muls r1, r2
	ldr r2, _0812BCBC
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
	ldr r4, _0812BDBC
	ldrb r0, [r4]
	bl battle_side_get_owner
	lsls r0, 24
	movs r3, 0x3F
	cmp r0, 0
	bne _0812BD94
	movs r3, 0xC0
_0812BD94:
	ldr r2, _0812BDC0
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
	ldr r2, _0812BDEC
	ldr r0, _0812BDF0
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
	ldr r1, _0812BE24
	ldr r0, _0812BE28
	ldrb r0, [r0]
	lsls r0, 1
	adds r0, r1
	ldrh r1, [r0]
	movs r0, 0x64
	muls r0, r1
	ldr r1, _0812BE2C
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
	ldr r1, _0812BE58
	ldr r0, _0812BE5C
	ldrb r0, [r0]
	lsls r0, 9
	adds r1, 0x1
	adds r0, r1
	ldrb r0, [r0]
	bl sub_80E43C0
	ldr r2, _0812BE60
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
	ldr r5, _0812BEA0
	ldr r4, _0812BEA4
	ldrb r1, [r4]
	adds r0, r1, r5
	ldrb r0, [r0]
	ldr r2, _0812BEA8
	lsls r1, 1
	adds r1, r2
	ldrh r2, [r1]
	movs r1, 0x64
	muls r1, r2
	ldr r2, _0812BEAC
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
	ldr r5, _0812BF18
	ldr r6, _0812BF1C
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
	ldr r0, _0812BF34
	ldrb r1, [r6]
	lsls r1, 2
	adds r1, r0
	ldr r0, _0812BF38
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
	ldr r2, _0812BF98
	ldr r1, _0812BF9C
	ldr r4, _0812BFA0
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
	ldr r0, _0812BFA4
	ldrh r1, [r0]
	movs r0, 0x6
	ands r0, r1
	cmp r0, 0x2
	bne _0812BF90
	ldr r0, _0812BFA8
	ldrb r1, [r4]
	lsls r1, 2
	adds r1, r0
	ldr r0, _0812BFAC
	str r0, [r1]
_0812BF90:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0812BF98: .4byte gUnknown_02024D26
_0812BF9C: .4byte gUnknown_02023A60
_0812BFA0: .4byte gUnknown_02024A60
_0812BFA4: .4byte gUnknown_020239F8
_0812BFA8: .4byte gUnknown_03004330
_0812BFAC: .4byte sub_812B6AC
	thumb_func_end sub_812BF54

	thumb_func_start nullsub_78
nullsub_78: @ 812BFB0
	bx lr
	thumb_func_end nullsub_78

	thumb_func_start sub_812BFB4
sub_812BFB4: @ 812BFB4
	ldr r1, _0812BFC4
	ldr r0, _0812BFC8
	str r0, [r1]
	ldr r1, _0812BFCC
	ldr r0, _0812BFD0
	str r0, [r1]
	movs r0, 0x1
	bx lr
	.align 2, 0
_0812BFC4: .4byte gUnknown_0300485C
_0812BFC8: .4byte sub_808AB90
_0812BFCC: .4byte gUnknown_03005CE4
_0812BFD0: .4byte sub_812BFD4
	thumb_func_end sub_812BFB4

	thumb_func_start sub_812BFD4
sub_812BFD4: @ 812BFD4
	push {lr}
	movs r0, 0x33
	bl FieldEffectStart
	ldr r0, _0812BFE8
	ldr r1, _0812BFEC
	ldrb r1, [r1]
	str r1, [r0]
	pop {r0}
	bx r0
	.align 2, 0
_0812BFE8: .4byte gUnknown_0202FF84
_0812BFEC: .4byte gUnknown_03005CE0
	thumb_func_end sub_812BFD4

	thumb_func_start sub_812BFF0
sub_812BFF0: @ 812BFF0
	push {lr}
	bl oei_task_add
	lsls r0, 24
	lsrs r0, 24
	ldr r2, _0812C014
	lsls r1, r0, 2
	adds r1, r0
	lsls r1, 3
	adds r1, r2
	ldr r2, _0812C018
	lsrs r0, r2, 16
	strh r0, [r1, 0x18]
	strh r2, [r1, 0x1A]
	movs r0, 0
	pop {r1}
	bx r1
	.align 2, 0
_0812C014: .4byte gTasks
_0812C018: .4byte sub_812C01C
	thumb_func_end sub_812BFF0

	thumb_func_start sub_812C01C
sub_812C01C: @ 812C01C
	push {lr}
	sub sp, 0x4
	movs r0, 0xEC
	bl PlaySE
	bl GetPlayerAvatarObjectId
	ldr r2, _0812C078
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
	ldr r0, _0812C07C
	movs r1, 0
	bl CreateTask
	lsls r0, 24
	lsrs r0, 24
	ldr r2, _0812C080
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
	ldr r0, _0812C0C8
	ldrb r1, [r0, 0x7]
	movs r0, 0x80
	ands r0, r1
	lsls r0, 24
	lsrs r2, r0, 24
	cmp r2, 0
	bne _0812C110
	ldr r0, _0812C0CC
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
	ldr r0, _0812C104
	str r0, [r4]
	bl GetPlayerAvatarObjectId
	ldr r2, _0812C108
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
	ldr r0, _0812C13C
	ldrb r1, [r0, 0x7]
	movs r0, 0x80
	ands r0, r1
	cmp r0, 0
	bne _0812C136
	ldr r0, _0812C140
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
	ldr r1, _0812C168
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
_0812C168: .4byte gUnknown_03004B00
_0812C16C:
	ldrh r0, [r1, 0x4]
	negs r0, r0
_0812C170:
	strh r0, [r2, 0x2E]
	ldrh r0, [r1, 0x8]
	strh r0, [r2, 0x30]
	ldr r0, _0812C180
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
	ldr r6, _0812C21C
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
	ldr r0, _0812C258
	str r0, [r4, 0x1C]
	movs r0, 0x7
	strh r0, [r4, 0x30]
	ldr r1, _0812C25C
	adds r0, r4, 0
	bl oamt_set_x3A_32
	ldr r1, _0812C260
	movs r2, 0xFD
	lsls r2, 6
	adds r0, r2, 0
	strh r0, [r1]
	ldr r2, _0812C264
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
	ldr r2, _0812C29C
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
	ldr r0, _0812C2A0
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
	ldr r1, _0812C2B8
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
	ldr r4, _0812C348
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
	ldr r0, _0812C34C
	ldrh r0, [r0, 0x4]
	strh r0, [r5, 0x2E]
	strh r7, [r5, 0x32]
	strh r6, [r5, 0x36]
	ldr r0, _0812C350
	str r0, [r5, 0x1C]
	ldr r1, _0812C354
	adds r0, r5, 0
	bl oamt_set_x3A_32
	add sp, 0x4
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_0812C348: .4byte gUnknown_0202F7C9
_0812C34C: .4byte gUnknown_03004B00
_0812C350: .4byte sub_8078B34
_0812C354: .4byte move_anim_8072740
	thumb_func_end sub_812C2BC

	thumb_func_start sub_812C358
sub_812C358: @ 812C358
	ldr r2, _0812C378
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
	ldr r1, _0812C37C
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
	ldr r2, _0812C3A0
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
	ldr r0, _0812C404
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
	ldr r0, _0812C408
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
	ldr r0, _0812C44C
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
	ldr r1, _0812C468
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
	ldr r0, _0812C49C
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
	ldr r0, _0812C4F0
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
	ldr r1, _0812C4F4
	movs r3, 0xFD
	lsls r3, 6
	adds r0, r3, 0
	strh r0, [r1]
	adds r1, 0x2
	ldrh r0, [r2, 0x2E]
	strh r0, [r1]
	ldr r0, _0812C4F8
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
	ldr r4, _0812C558
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
	ldr r1, _0812C55C
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
	ldr r2, _0812C57C
	lsls r1, r0, 2
	adds r1, r0
	lsls r1, 3
	adds r1, r2
	ldr r0, _0812C580
	str r0, [r1]
	ldr r1, _0812C584
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
	ldr r7, _0812C614
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
	ldr r0, _0812C618
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
	ldr r0, _0812C61C
	ldrh r1, [r0, 0xE]
	ldr r0, _0812C620
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
_0812C61C: .4byte gUnknown_03004B00
_0812C620: .4byte 0x0000ffff
	thumb_func_end sub_812C588

	thumb_func_start sub_812C624
sub_812C624: @ 812C624
	lsls r0, 24
	lsrs r0, 24
	ldr r2, _0812C640
	lsls r1, r0, 2
	adds r1, r0
	lsls r1, 3
	adds r1, r2
	ldr r0, _0812C644
	str r0, [r1]
	ldr r1, _0812C648
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
	ldr r5, _0812C70C
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
	ldr r0, _0812C710
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
	ldr r2, _0812C714
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
	ldr r2, _0812C70C
	adds r0, r2
	strh r1, [r0, 0x12]
_0812C6EE:
	ldr r0, _0812C718
	ldrh r1, [r0, 0xE]
	ldr r0, _0812C71C
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
_0812C718: .4byte gUnknown_03004B00
_0812C71C: .4byte 0x0000ffff
	thumb_func_end sub_812C64C

	thumb_func_start sub_812C720
sub_812C720: @ 812C720
	push {r4,r5,lr}
	sub sp, 0x4
	adds r4, r0, 0
	movs r1, 0x1
	bl sub_80787B0
	ldr r0, _0812C784
	ldrb r0, [r0]
	mov r5, sp
	adds r5, 0x2
	movs r1, 0
	mov r2, sp
	adds r3, r5, 0
	bl sub_807A3FC
	ldr r0, _0812C788
	ldrb r0, [r0]
	bl battle_side_get_owner
	lsls r0, 24
	cmp r0, 0
	beq _0812C754
	ldr r1, _0812C78C
	ldrh r0, [r1, 0x4]
	negs r0, r0
	strh r0, [r1, 0x4]
_0812C754:
	ldr r1, _0812C78C
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
	ldr r0, _0812C790
	strh r0, [r4, 0x38]
	adds r0, r4, 0
	bl sub_80786EC
	ldr r0, _0812C794
	str r0, [r4, 0x1C]
	add sp, 0x4
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_0812C784: .4byte gUnknown_0202F7C9
_0812C788: .4byte gUnknown_0202F7C8
_0812C78C: .4byte gUnknown_03004B00
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
	ldr r0, _0812C7C0
	str r0, [r4, 0x1C]
	ldr r1, _0812C7C4
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
	ldr r5, _0812C83C
	movs r0, 0
	ldrsh r1, [r5, r0]
	adds r0, r4, 0
	bl sub_807867C
	ldrh r0, [r5, 0x2]
	ldrh r1, [r4, 0x22]
	adds r0, r1
	strh r0, [r4, 0x22]
	ldr r0, _0812C840
	str r0, [r4, 0x1C]
	ldr r1, _0812C844
	adds r0, r4, 0
	bl oamt_set_x3A_32
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_0812C83C: .4byte gUnknown_03004B00
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
	ldr r5, _0812C884
	movs r2, 0
	ldrsh r1, [r5, r2]
	adds r0, r4, 0
	bl sub_807867C
	bl sub_8076BE0
	lsls r0, 24
	cmp r0, 0
	bne _0812C89C
	ldr r0, _0812C888
	ldrb r0, [r0]
	bl battle_side_get_owner
	lsls r0, 24
	cmp r0, 0
	bne _0812C88C
	ldrh r0, [r5, 0x4]
	b _0812C8A2
	.align 2, 0
_0812C884: .4byte gUnknown_03004B00
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
	ldr r0, _0812C940
	ldrb r0, [r0]
	bl battle_side_get_owner
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _0812C948
	ldr r1, _0812C944
	movs r0, 0
	b _0812C94C
	.align 2, 0
_0812C940: .4byte gUnknown_0202F7C9
_0812C944: .4byte gUnknown_03004B00
_0812C948:
	ldr r1, _0812C95C
	movs r0, 0x1
_0812C94C:
	strh r0, [r1, 0xE]
	adds r0, r4, 0
	bl move_anim_task_del
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0812C95C: .4byte gUnknown_03004B00
	thumb_func_end sub_812C924

	thumb_func_start sub_812C960
sub_812C960: @ 812C960
	push {lr}
	lsls r0, 24
	lsrs r2, r0, 24
	ldr r0, _0812C974
	ldr r0, [r0]
	cmp r0, 0
	ble _0812C97C
	ldr r1, _0812C978
	movs r0, 0
	b _0812C980
	.align 2, 0
_0812C974: .4byte gUnknown_0202F7B8
_0812C978: .4byte gUnknown_03004B00
_0812C97C:
	ldr r1, _0812C98C
	movs r0, 0x1
_0812C980:
	strh r0, [r1, 0xE]
	adds r0, r2, 0
	bl move_anim_task_del
	pop {r0}
	bx r0
	.align 2, 0
_0812C98C: .4byte gUnknown_03004B00
	thumb_func_end sub_812C960

	thumb_func_start sub_812C990
sub_812C990: @ 812C990
	push {r4,lr}
	adds r4, r0, 0
	ldr r1, _0812C9EC
	ldr r2, _0812C9F0
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
	ldr r0, _0812C9F4
	movs r1, 0
	strh r1, [r0]
	ldr r0, _0812C9F8
	strh r1, [r0]
	ldr r0, _0812C9FC
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
	ldr r0, _0812CA00
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
	ldr r1, _0812CA1C
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
	ldr r0, _0812CACC
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
	ldr r2, _0812CAF4
	ldr r3, _0812CAF8
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
	ldr r6, _0812CB70
	movs r1, 0x6
	ldrsh r0, [r6, r1]
	cmp r0, 0
	bne _0812CB28
	ldr r4, _0812CB74
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
	ldr r4, _0812CB78
	adds r0, r4, 0
	ands r1, r0
	ldr r0, _0812CB7C
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
	ldr r0, _0812CB80
	strh r0, [r5, 0x24]
	movs r0, 0x2
	b _0812CB8A
	.align 2, 0
_0812CB70: .4byte gUnknown_03004B00
_0812CB74: .4byte gUnknown_0202F7C8
_0812CB78: .4byte 0x000003ff
_0812CB7C: .4byte 0xfffffc00
_0812CB80: .4byte 0x0000fff4
_0812CB84:
	movs r0, 0xC
	strh r0, [r5, 0x24]
	ldr r0, _0812CBA8
_0812CB8A:
	strh r0, [r5, 0x30]
	ldr r1, _0812CBAC
	ldrh r0, [r1, 0x8]
	strh r0, [r5, 0x2E]
	movs r2, 0x34
	ldrsh r0, [r5, r2]
	cmp r0, 0xFF
	beq _0812CB9E
	ldrh r0, [r1, 0x4]
	strh r0, [r5, 0x34]
_0812CB9E:
	ldr r0, _0812CBB0
	str r0, [r5, 0x1C]
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_0812CBA8: .4byte 0x0000fffe
_0812CBAC: .4byte gUnknown_03004B00
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
	ldr r1, _0812CC88
	ldr r2, _0812CC8C
	adds r0, r2, 0
	strh r0, [r1]
	ldr r1, _0812CC90
	ldr r2, _0812CC94
	adds r0, r2, 0
	strh r0, [r1]
	ldr r1, _0812CC98
	movs r0, 0xA0
	strh r0, [r1]
	ldr r1, _0812CC9C
	ldr r0, _0812CCA0
	ldrh r0, [r0]
	strh r0, [r1]
	adds r1, 0x4
	ldr r0, _0812CCA4
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
	ldr r1, _0812CCD8
	ldr r2, _0812CCDC
	adds r0, r2, 0
	strh r0, [r1]
	ldr r0, _0812CCE0
	movs r1, 0
	strh r1, [r0]
	ldr r0, _0812CCE4
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
	ldr r6, _0812CCFC
	movs r1, 0
	ldrsh r0, [r6, r1]
	cmp r0, 0
	bne _0812CD04
	ldr r4, _0812CD00
	b _0812CD06
	.align 2, 0
_0812CCFC: .4byte gUnknown_03004B00
_0812CD00: .4byte gUnknown_0202F7C8
_0812CD04:
	ldr r4, _0812CD58
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
	ldr r2, _0812CD5C
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
	ldr r0, _0812CD60
	str r0, [r5, 0x1C]
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_0812CD58: .4byte gUnknown_0202F7C9
_0812CD5C: .4byte gUnknown_03004B00
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
	ldr r1, _0812CDAC
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
	ldr r0, _0812CDE8
	adds r5, r1, r0
	ldr r0, _0812CDEC
	movs r1, 0
	ldrsh r0, [r0, r1]
	cmp r0, 0
	bne _0812CDF4
	ldr r4, _0812CDF0
	b _0812CDF6
	.align 2, 0
_0812CDE8: .4byte gTasks
_0812CDEC: .4byte gUnknown_03004B00
_0812CDF0: .4byte gUnknown_0202F7C8
_0812CDF4:
	ldr r4, _0812CE3C
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
	ldr r1, _0812CE40
	ldrh r0, [r1, 0x2]
	strh r0, [r5, 0x12]
	strh r2, [r5, 0x14]
	strh r2, [r5, 0x16]
	cmp r7, 0x1
	bne _0812CE48
	ldr r0, _0812CE44
	b _0812CE4A
	.align 2, 0
_0812CE3C: .4byte gUnknown_0202F7C9
_0812CE40: .4byte gUnknown_03004B00
_0812CE44: .4byte gUnknown_030042C0
_0812CE48:
	ldr r0, _0812CE68
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
	ldr r4, _0812CEB0
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
	ldr r0, _0812CEB4
	b _0812CEBA
	.align 2, 0
_0812CEB0: .4byte gUnknown_03004DE0
_0812CEB4: .4byte REG_BG1HOFS
_0812CEB8:
	ldr r0, _0812CEE4
_0812CEBA:
	str r0, [sp]
	ldr r0, _0812CEE8
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
	ldr r0, _0812CEEC
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
	ldr r1, _0812CF40
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
	ldr r5, _0812D000
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
	ldr r5, _0812D000
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
	ldr r1, _0812D004
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
	ldr r0, _0812D05C
	adds r4, r0
	movs r5, 0
	strh r5, [r4, 0x8]
	strh r5, [r4, 0xA]
	ldr r6, _0812D060
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
	ldr r0, _0812D064
	strh r0, [r4, 0x12]
	strh r5, [r4, 0x14]
	movs r0, 0
	bl obj_id_for_side_relative_to_move
	lsls r0, 24
	lsrs r0, 24
	strh r0, [r4, 0x26]
	ldr r0, _0812D068
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
	ldr r1, _0812D098
	adds r6, r0, r1
	movs r1, 0x8
	ldrsh r0, [r6, r1]
	cmp r0, 0x5
	bls _0812D08C
	b _0812D246
_0812D08C:
	lsls r0, 2
	ldr r1, _0812D09C
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
	ldr r0, _0812D168
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
	ldr r5, _0812D16C
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
	ldr r0, _0812D170
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
	ldr r2, _0812D174
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
	ldr r3, _0812D22C
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
	ldr r0, _0812D230
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
	ldr r0, _0812D234
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
	ldr r3, _0812D290
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
	ldr r1, _0812D344
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
	ldr r4, _0812D348
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
	ldr r0, _0812D34C
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
	ldr r1, _0812D370
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
	ldr r2, _0812D390
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
	ldr r4, _0812D408
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
	ldr r1, _0812D48C
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
	ldr r0, _0812D4CC
	ldrb r0, [r0]
	bl battle_side_get_owner
	lsls r0, 24
	cmp r0, 0
	beq _0812D4D4
	ldr r0, _0812D4D0
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
	ldr r0, _0812D4E8
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
	ldr r0, _0812D50C
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
	ldr r0, _0812D584
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
	ldr r3, _0812D5DC
	adds r0, r3, 0
	ands r1, r0
	ldr r0, _0812D5E0
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
	ldr r0, _0812D5E4
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
	ldr r0, _0812D670
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
	ldr r1, _0812D6AC
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
	ldr r2, _0812D6B0
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
	ldr r1, _0812D704
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
	ldr r2, _0812D708
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
	ldr r0, _0812D75C
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
	ldr r1, _0812D7C8
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
	ldr r2, _0812D7CC
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
	ldr r1, _0812D818
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
	ldr r1, _0812D81C
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
	ldr r1, _0812D850
	movs r0, 0
	strh r0, [r1]
	ldr r0, _0812D854
	ldrb r0, [r0]
	bl battle_get_per_side_status_permutated
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _0812D85C
	ldr r0, _0812D858
	b _0812D85E
	.align 2, 0
_0812D850: .4byte REG_MOSAIC
_0812D854: .4byte gUnknown_0202F7C8
_0812D858: .4byte REG_BG1CNT
_0812D85C:
	ldr r0, _0812D87C
_0812D85E:
	ldrb r1, [r0]
	movs r2, 0x40
	orrs r1, r2
	strb r1, [r0]
	ldr r0, _0812D880
	mov r6, r8
	lsls r1, r6, 2
	add r1, r8
	lsls r1, 3
	adds r1, r0
	ldr r0, _0812D884
	ldrh r0, [r0]
	strh r0, [r1, 0x1C]
	b _0812DA2A
	.align 2, 0
_0812D87C: .4byte REG_BG2CNT
_0812D880: .4byte gTasks
_0812D884: .4byte gUnknown_03004B00
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
	ldr r1, _0812D8C0
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
	ldr r5, _0812D8F4
	ldrb r0, [r5]
	ldr r1, _0812D8F8
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
	ldr r0, _0812D9CC
	lsls r1, 2
	adds r1, r0
	ldr r2, _0812D9D0
	ldr r0, _0812D9D4
	ldrb r0, [r0]
	adds r0, r2
	ldrb r0, [r0]
	lsls r0, 11
	ldr r1, [r1]
	adds r1, r0
	ldr r2, [sp]
	ldr r0, _0812D9D8
	str r1, [r0]
	str r2, [r0, 0x4]
	ldr r1, _0812D9DC
	str r1, [r0, 0x8]
	ldr r0, [r0, 0x8]
	bl sub_8076BE0
	lsls r0, 24
	cmp r0, 0
	beq _0812DA20
	ldr r5, _0812D9E0
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
	ldr r0, _0812D9E0
	ldrh r0, [r0, 0x2]
	bl sub_80AEB1C
	lsls r0, 24
	cmp r0, 0
	beq _0812D9F0
	ldr r3, _0812D9E4
	ldr r4, _0812D9E8
	ldr r2, _0812D9D4
	ldrb r0, [r2]
	adds r0, r4
	ldrb r1, [r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r1, r3, 0
	adds r1, 0x10
	adds r0, r1
	ldr r1, _0812D9EC
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
	ldr r3, _0812DA34
	ldr r4, _0812DA38
	ldr r2, _0812DA3C
	ldrb r0, [r2]
	adds r0, r4
	ldrb r1, [r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r1, r3, 0
	adds r1, 0x10
	adds r0, r1
	ldr r1, _0812DA40
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
	ldr r0, _0812DA44
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
	ldr r1, _0812DA80
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
	ldr r1, _0812DAA0
	movs r0, 0
	strh r0, [r1]
	ldr r0, _0812DAA4
	ldrb r0, [r0]
	bl battle_get_per_side_status_permutated
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _0812DAAC
	ldr r2, _0812DAA8
	b _0812DAAE
	.align 2, 0
_0812DAA0: .4byte REG_MOSAIC
_0812DAA4: .4byte gUnknown_0202F7C8
_0812DAA8: .4byte REG_BG1CNT
_0812DAAC:
	ldr r2, _0812DB08
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
	ldr r4, _0812DB0C
	ldrb r0, [r4]
	bl battle_side_get_owner
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _0812DAF4
	ldr r0, _0812DB10
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
	ldr r2, _0812DB14
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
	ldr r4, _0812DB48
	ldr r3, _0812DB4C
	ldr r2, _0812DB50
	ldr r1, _0812DB54
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
_0812DB48: .4byte gUnknown_03004B00
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
	ldr r0, _0812DB7C
	ldrb r0, [r0]
	ldr r1, _0812DB80
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
	ldr r1, _0812DBB4
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
	ldr r1, _0812DBB8
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
	ldr r1, _0812DC70
	ldr r4, _0812DC74
	adds r0, r4, 0
	strh r0, [r1]
	adds r1, 0x2
	movs r2, 0x80
	lsls r2, 5
	adds r0, r2, 0
	strh r0, [r1]
	ldr r4, _0812DC78
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
	ldr r2, _0812DC7C
	add r0, sp, 0xC
	str r0, [r2]
	str r1, [r2, 0x4]
	ldr r0, _0812DC80
	str r0, [r2, 0x8]
	ldr r0, [r2, 0x8]
	ldr r0, _0812DC84
	bl LZDecompressVram
	ldr r0, _0812DC88
	ldr r1, [sp]
	bl LZDecompressVram
	ldr r0, _0812DC8C
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
	ldr r1, _0812DC90
	ldr r2, _0812DC94
	adds r0, r2, 0
	strh r0, [r1]
	ldr r0, _0812DC98
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
	ldr r0, _0812DCB4
	ldrb r0, [r0]
	bl battle_side_get_owner
	lsls r0, 24
	cmp r0, 0
	beq _0812DCC0
	ldr r1, _0812DCB8
	ldr r4, _0812DCBC
	adds r0, r4, 0
	b _0812DCC6
	.align 2, 0
_0812DCB4: .4byte gUnknown_0202F7C8
_0812DCB8: .4byte gUnknown_030042C0
_0812DCBC: .4byte 0x0000ff79
_0812DCC0:
	ldr r1, _0812DCEC
	ldr r2, _0812DCF0
	adds r0, r2, 0
_0812DCC6:
	strh r0, [r1]
	ldr r1, _0812DCF4
	movs r0, 0
	strh r0, [r1]
_0812DCCE:
	ldr r0, _0812DCF8
	lsls r1, r7, 2
	adds r1, r7
	lsls r1, 3
	adds r1, r0
	ldr r0, _0812DCEC
	ldrh r0, [r0]
	strh r0, [r1, 0x1C]
	ldr r0, _0812DCF4
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
	ldr r2, _0812DD48
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
	ldr r2, _0812DDA4
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
	ldr r2, _0812DDA8
	ldr r1, _0812DDAC
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
	ldr r1, _0812DE90
	movs r4, 0x80
	lsls r4, 5
	mov r8, r5
	ldr r0, _0812DE94
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
	ldr r0, _0812DE90
	str r5, [r0]
	str r1, [r0, 0x4]
	ldr r1, _0812DE98
	str r1, [r0, 0x8]
	ldr r0, [r0, 0x8]
	bl sub_8076BE0
	lsls r0, 24
	cmp r0, 0
	bne _0812DE5A
	ldr r2, _0812DE9C
	ldrb r1, [r2]
	movs r0, 0xD
	negs r0, r0
	ands r0, r1
	strb r0, [r2]
_0812DE5A:
	ldr r2, _0812DE9C
	ldrb r1, [r2]
	movs r0, 0x4
	negs r0, r0
	ands r0, r1
	movs r1, 0x1
	orrs r0, r1
	strb r0, [r2]
	ldr r0, _0812DEA0
	strh r4, [r0]
	ldr r0, _0812DEA4
	strh r4, [r0]
	ldr r0, _0812DEA8
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
	ldr r4, _0812DFD0
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
	ldr r1, _0812DFD4
	ldrh r0, [r1]
	strh r0, [r7, 0x30]
	ldrh r0, [r1, 0x2]
	strh r0, [r7, 0x32]
	ldr r4, _0812DFD8
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
	ldr r1, _0812DFDC
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
	ldr r1, _0812DFD4
	ldrh r0, [r1]
	strh r0, [r5, 0x30]
	ldrh r0, [r1, 0x2]
	strh r0, [r5, 0x32]
	ldrh r0, [r1]
	strh r0, [r4, 0x30]
	ldrh r0, [r1, 0x2]
	strh r0, [r4, 0x32]
	ldr r0, _0812DFE0
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
	ldr r0, _0812DFE4
	str r0, [r2]
	add r6, r10
	str r0, [r6]
	mov r1, r9
	strh r1, [r7, 0x3A]
	mov r0, r8
	strh r0, [r7, 0x3C]
	ldr r0, _0812DFE8
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
_0812DFD4: .4byte gUnknown_03004B00
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
	ldr r2, _0812E094
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
	ldr r2, _0812E094
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
	ldr r0, _0812E098
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
	ldr r5, _0812E0F0
	movs r0, 0x3A
	ldrsh r1, [r4, r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r3, r0, 2
	adds r6, r5, 0
	adds r6, 0x1C
	adds r0, r3, r6
	ldr r2, [r0]
	ldr r0, _0812E0F4
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
	ldr r0, _0812E148
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
	ldr r1, _0812E174
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
	ldr r1, _0812E178
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
	ldr r1, _0812E230
	ldr r3, _0812E234
	adds r0, r3, 0
	strh r0, [r1]
	adds r1, 0x2
	ldr r2, _0812E238
	adds r0, r2, 0
	strh r0, [r1]
	ldr r4, _0812E23C
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
	ldr r2, _0812E240
	add r0, sp, 0xC
	str r0, [r2]
	str r1, [r2, 0x4]
	ldr r0, _0812E244
	str r0, [r2, 0x8]
	ldr r0, [r2, 0x8]
	ldr r0, _0812E248
	bl LZDecompressVram
	ldr r0, _0812E24C
	ldr r1, [sp]
	bl LZDecompressVram
	ldr r0, _0812E250
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
	ldr r1, _0812E254
	ldr r3, _0812E258
	adds r0, r3, 0
	strh r0, [r1]
	ldr r0, _0812E25C
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
	ldr r0, _0812E2A0
	ldrb r0, [r0]
	bl battle_get_per_side_status
	lsls r0, 24
	lsrs r4, r0, 24
	bl battle_type_is_double
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _0812E2B4
	ldr r1, _0812E2A4
	cmp r4, 0x1
	bne _0812E284
	ldr r2, _0812E2A8
	adds r0, r2, 0
	strh r0, [r1]
_0812E284:
	cmp r4, 0x3
	bne _0812E28E
	ldr r3, _0812E2AC
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
	ldr r1, _0812E2A4
	ldr r2, _0812E2B0
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
	ldr r1, _0812E2EC
	ldr r3, _0812E2F0
	adds r0, r3, 0
	strh r0, [r1]
_0812E2C0:
	cmp r4, 0
	bne _0812E2CC
	ldr r1, _0812E2EC
	ldr r2, _0812E2F4
_0812E2C8:
	adds r0, r2, 0
	strh r0, [r1]
_0812E2CC:
	ldr r1, _0812E2F8
	movs r0, 0
	strh r0, [r1]
_0812E2D2:
	ldr r0, _0812E2FC
	lsls r1, r6, 2
	adds r1, r6
	lsls r1, 3
	adds r1, r0
	ldr r0, _0812E2EC
	ldrh r0, [r0]
	strh r0, [r1, 0x1C]
	ldr r0, _0812E2F8
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
	ldr r1, _0812E334
	lsls r4, r6, 2
	adds r0, r4, r6
	lsls r0, 3
	adds r5, r0, r1
	movs r0, 0
	strh r0, [r5, 0xE]
	ldr r0, _0812E338
	ldrb r0, [r0]
	bl battle_side_get_owner
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _0812E344
	ldr r2, _0812E33C
	ldr r1, _0812E340
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
	ldr r2, _0812E374
	ldr r1, _0812E378
	movs r3, 0xC
	ldrsh r0, [r5, r3]
	adds r0, r1
	movs r1, 0
	ldrsb r1, [r0, r1]
	ldrh r0, [r5, 0x1C]
	subs r0, r1
_0812E356:
	strh r0, [r2]
	ldr r0, _0812E37C
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
	ldr r2, _0812E3B8
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
	ldr r2, _0812E3E4
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
	ldr r2, _0812E41C
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
	ldr r1, _0812E480
	add r0, sp, 0xC
	str r0, [r1]
	str r2, [r1, 0x4]
	ldr r0, _0812E484
	str r0, [r1, 0x8]
	ldr r0, [r1, 0x8]
	bl sub_8076BE0
	lsls r0, 24
	cmp r0, 0
	bne _0812E450
	ldr r2, _0812E488
	ldrb r1, [r2]
	movs r0, 0xD
	negs r0, r0
	ands r0, r1
	strb r0, [r2]
_0812E450:
	ldr r2, _0812E488
	ldrb r1, [r2]
	movs r0, 0x4
	negs r0, r0
	ands r0, r1
	movs r1, 0x1
	orrs r0, r1
	strb r0, [r2]
	ldr r0, _0812E48C
	strh r4, [r0]
	ldr r0, _0812E490
	strh r4, [r0]
	ldr r0, _0812E494
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
	ldr r1, _0812E4D0
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
	ldr r2, _0812E4D4
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
	ldr r0, _0812E53C
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
	ldr r1, _0812E58C
	adds r4, r0, r1
	ldr r5, _0812E590
	movs r1, 0x2
	ldrsh r0, [r5, r1]
	cmp r0, 0
	bne _0812E594
	adds r0, r2, 0
	bl move_anim_task_del
	b _0812E628
	.align 2, 0
_0812E58C: .4byte gTasks
_0812E590: .4byte gUnknown_03004B00
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
	ldr r0, _0812E5F4
	b _0812E5FA
	.align 2, 0
_0812E5F4: .4byte gUnknown_0202F7C8
_0812E5F8:
	ldr r0, _0812E630
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
	ldr r0, _0812E634
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
	ldr r1, _0812E65C
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
	ldr r2, _0812E6BC
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
	ldr r2, _0812E714
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
	ldr r2, _0812E77C
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
	ldr r0, _0812E7BC
	ldrb r0, [r0]
	bl battle_side_get_owner
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0
	bne _0812E7C4
	strh r0, [r4, 0x20]
	ldr r1, _0812E7C0
	ldrh r0, [r1]
	b _0812E7CE
	.align 2, 0
_0812E7BC: .4byte gUnknown_0202F7C8
_0812E7C0: .4byte gUnknown_03004B00
_0812E7C4:
	movs r0, 0xF0
	strh r0, [r4, 0x20]
	ldr r1, _0812E7E8
	ldrh r0, [r1]
	subs r0, 0x1E
_0812E7CE:
	strh r0, [r4, 0x22]
	ldrh r0, [r1, 0x4]
	strh r0, [r4, 0x32]
	ldrb r1, [r1, 0x2]
	adds r0, r4, 0
	bl StartSpriteAnim
	ldr r0, _0812E7EC
	str r0, [r4, 0x1C]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0812E7E8: .4byte gUnknown_03004B00
_0812E7EC: .4byte sub_812E7F0
	thumb_func_end sub_812E7A0

	thumb_func_start sub_812E7F0
sub_812E7F0: @ 812E7F0
	push {r4,lr}
	adds r4, r0, 0
	ldrh r0, [r4, 0x2E]
	adds r0, 0x3
	strh r0, [r4, 0x2E]
	ldr r0, _0812E830
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
	ldr r0, _0812E8A8
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
	ldr r0, _0812E8AC
	ldrb r0, [r0]
	bl obj_id_for_side_relative_to_move
	lsls r0, 24
	lsrs r0, 24
	strh r0, [r4, 0x26]
	movs r1, 0
	bl sub_8078E70
	ldr r0, _0812E8B0
	str r0, [r4]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0812E8A8: .4byte gTasks
_0812E8AC: .4byte gUnknown_03004B00
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
	ldr r1, _0812E8E0
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
	ldr r1, _0812E9A8
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
	ldr r2, _0812EA38
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
	ldr r6, _0812EAA4
	movs r2, 0x4
	ldrsh r0, [r6, r2]
	cmp r0, 0
	bne _0812EA80
	ldr r4, _0812EAA8
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
_0812EAA4: .4byte gUnknown_03004B00
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
	ldr r1, _0812EB40
	lsls r0, r7, 2
	adds r0, r7
	lsls r0, 3
	adds r2, r0, r1
	movs r1, 0x8
	ldrsh r0, [r2, r1]
	cmp r0, 0
	bne _0812EC1C
	ldr r0, _0812EB44
	movs r3, 0
	ldrsh r1, [r0, r3]
	mov r8, r0
	cmp r1, 0
	bne _0812EB4C
	ldr r0, _0812EB48
	b _0812EB4E
	.align 2, 0
_0812EB40: .4byte gTasks
_0812EB44: .4byte gUnknown_03004B00
_0812EB48: .4byte gUnknown_0202F7C8
_0812EB4C:
	ldr r0, _0812EB88
_0812EB4E:
	ldrb r0, [r0]
	strh r0, [r2, 0x1E]
	mov r1, r8
	ldrb r0, [r1]
	bl obj_id_for_side_relative_to_move
	lsls r0, 24
	lsrs r5, r0, 24
	ldr r1, _0812EB8C
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
	ldr r0, _0812EC14
	lsls r2, r5, 4
	adds r1, r2, r5
	lsls r1, 2
	adds r1, r0
	ldrh r0, [r1, 0x26]
	adds r0, 0x10
	strh r0, [r1, 0x26]
_0812EBF8:
	ldr r1, _0812EC14
	adds r0, r2, r5
	lsls r0, 2
	adds r0, r1
	movs r1, 0x2
	strh r1, [r0, 0x24]
	ldr r0, _0812EC18
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
	ldr r0, _0812EC74
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
	ldr r1, _0812EC74
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
	ldr r3, _0812ECC4
	adds r0, r3, 0
	ands r1, r0
	ldr r0, _0812ECC8
	ands r0, r2
	orrs r0, r1
	strh r0, [r4, 0x4]
	bl Random
	ldr r5, _0812ECCC
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
	ldr r0, _0812ED04
	ldrh r0, [r0]
	strh r0, [r4, 0x32]
	lsls r0, 16
	cmp r0, 0
	bne _0812ED0C
	ldr r0, _0812ED08
	b _0812ED0E
	.align 2, 0
_0812ED04: .4byte gUnknown_03004B00
_0812ED08: .4byte 0x0000fff8
_0812ED0C:
	movs r0, 0xF8
_0812ED0E:
	strh r0, [r4, 0x20]
	movs r0, 0x68
	strh r0, [r4, 0x22]
	ldr r0, _0812ED20
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
	ldr r1, _0812EDE4
	ldr r2, _0812EDE8
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
	ldr r0, _0812EDEC
	movs r1, 0
	strh r1, [r0]
	ldr r0, _0812EDF0
	strh r1, [r0]
	ldr r0, _0812EDF4
	strh r1, [r0]
	adds r0, 0x4
	strh r1, [r0]
	ldr r0, _0812EDF8
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
	ldr r0, _0812EDFC
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
_0812EDF8: .4byte gUnknown_03004B00
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
	ldr r1, _0812EE9C
	ldr r2, _0812EEA0
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
	ldr r5, _0812EEE0
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
	ldr r1, _0812EEE4
	ldrh r0, [r1]
	strh r0, [r4, 0x2E]
	ldrh r0, [r1, 0x2]
	strh r0, [r4, 0x30]
	ldr r1, _0812EEE8
	str r1, [r4, 0x1C]
	adds r0, r4, 0
	bl _call_via_r1
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_0812EEE0: .4byte gUnknown_0202F7C8
_0812EEE4: .4byte gUnknown_03004B00
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
	ldr r0, _0812EF34
	ldrb r0, [r0]
	bl sub_8079E90
	subs r0, 0x1
	b _0812EF42
	.align 2, 0
_0812EF34: .4byte gUnknown_0202F7C8
_0812EF38:
	ldr r0, _0812EF84
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
	ldr r1, _0812EFC0
	adds r0, r1, 0
	ldrh r2, [r4, 0x32]
	adds r0, r2
	strh r0, [r4, 0x32]
	ldr r3, _0812EFC4
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
	ldr r0, _0812F000
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
	ldr r0, _0812F070
	ldrb r0, [r0]
	bl battle_side_get_owner
	lsls r0, 24
	cmp r0, 0
	beq _0812F0AC
	movs r0, 0
	str r0, [sp, 0x14]
	ldr r6, _0812F074
	ldr r4, _0812F078
	ldrb r0, [r4]
	lsls r0, 1
	adds r0, r6
	ldrh r0, [r0]
	movs r5, 0x64
	muls r0, r5
	ldr r7, _0812F07C
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
	ldr r0, _0812F080
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
	ldr r1, _0812F0A0
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
	ldr r6, _0812F10C
	ldr r4, _0812F110
	ldrb r0, [r4]
	lsls r0, 1
	adds r0, r6
	ldrh r0, [r0]
	movs r5, 0x64
	muls r0, r5
	ldr r7, _0812F114
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
	ldr r0, _0812F118
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
	ldr r1, _0812F11C
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
	ldr r3, _0812F218
_0812F13C:
	mov r10, r3
_0812F13E:
	ldr r0, _0812F21C
	ldrb r0, [r0]
	bl sub_8079ED4
	lsls r0, 24
	lsrs r7, r0, 24
	ldr r5, _0812F21C
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
	ldr r0, _0812F220
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
	ldr r0, _0812F224
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
	ldr r1, _0812F228
	movs r2, 0xFD
	lsls r2, 6
	adds r0, r2, 0
	strh r0, [r1]
	ldr r3, _0812F22C
	ldr r0, _0812F230
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
	ldr r0, _0812F234
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
	ldr r2, _0812F284
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
	ldr r2, _0812F288
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
	ldr r0, _0812F28C
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
	ldr r2, _0812F308
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
	ldr r1, _0812F30C
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
	ldr r0, _0812F310
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
	ldr r0, _0812F334
	adds r4, r1, r0
	ldr r0, _0812F338
	movs r1, 0
	ldrsh r0, [r0, r1]
	cmp r0, 0
	bne _0812F340
	ldr r0, _0812F33C
	b _0812F342
	.align 2, 0
_0812F334: .4byte gTasks
_0812F338: .4byte gUnknown_03004B00
_0812F33C: .4byte gUnknown_0202F7C8
_0812F340:
	ldr r0, _0812F3C0
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
	ldr r0, _0812F3C4
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
	ldr r0, _0812F3C8
	str r0, [sp]
	ldr r1, _0812F3CC
	ldr r2, _0812F3D0
	adds r0, r2, 0
	strh r0, [r1]
	ldr r0, _0812F3D4
	ldrh r5, [r0]
	ldr r0, _0812F3D8
	b _0812F3EE
	.align 2, 0
_0812F3C0: .4byte gUnknown_0202F7C9
_0812F3C4: .4byte gUnknown_03004B00
_0812F3C8: .4byte REG_BG1HOFS
_0812F3CC: .4byte REG_BLDCNT
_0812F3D0: .4byte 0x00003f42
_0812F3D4: .4byte gUnknown_030042C0
_0812F3D8: .4byte gUnknown_030041B4
_0812F3DC:
	ldr r0, _0812F454
	str r0, [sp]
	ldr r1, _0812F458
	ldr r2, _0812F45C
	adds r0, r2, 0
	strh r0, [r1]
	ldr r0, _0812F460
	ldrh r5, [r0]
	ldr r0, _0812F464
_0812F3EE:
	ldrh r3, [r0]
	movs r7, 0
	movs r2, 0
	ldr r6, _0812F468
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
	ldr r0, _0812F46C
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
	ldr r0, _0812F470
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
	ldr r1, _0812F4A8
	adds r6, r0, r1
	ldrb r0, [r6, 0x12]
	bl battle_get_per_side_status_permutated
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _0812F4B4
	ldr r0, _0812F4AC
	ldrh r0, [r0]
	str r0, [sp, 0x4]
	ldr r0, _0812F4B0
	b _0812F4BC
	.align 2, 0
_0812F4A8: .4byte gTasks
_0812F4AC: .4byte gUnknown_030042C0
_0812F4B0: .4byte gUnknown_030041B4
_0812F4B4:
	ldr r0, _0812F4D4
	ldrh r0, [r0]
	str r0, [sp, 0x4]
	ldr r0, _0812F4D8
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
	ldr r0, _0812F660
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
	ldr r0, _0812F664
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
	ldr r1, _0812F664
	adds r3, r1
	lsls r1, r7, 16
	asrs r1, 16
	ldr r2, [sp, 0x10]
	adds r1, r2, r1
	mov r7, r8
	lsls r2, r7, 16
	asrs r2, 16
	lsls r0, r2, 1
	ldr r7, _0812F668
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
	ldr r0, _0812F66C
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
	ldr r4, _0812F664
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
	ldr r0, _0812F698
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
	ldr r1, _0812F6C0
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
	ldr r2, _0812F708
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
	ldr r0, _0812F75C
	adds r4, r0
	movs r0, 0
	strh r0, [r4, 0x8]
	ldr r0, _0812F760
	ldrb r0, [r0]
	bl obj_id_for_side_relative_to_move
	adds r1, r0, 0
	lsls r1, 24
	lsrs r1, 24
	strh r1, [r4, 0x26]
	ldr r2, _0812F764
	adds r0, r4, 0
	bl sub_80798F4
	ldr r0, _0812F768
	str r0, [r4]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0812F75C: .4byte gTasks
_0812F760: .4byte gUnknown_03004B00
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
	ldr r2, _0812F7C4
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
	ldr r2, _0812F7C8
	movs r0, 0x26
	ldrsh r1, [r3, r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r2
	ldr r1, _0812F7CC
	strh r1, [r0, 0x24]
	b _0812F7E0
	.align 2, 0
_0812F7C4: .4byte gTasks
_0812F7C8: .4byte gSprites
_0812F7CC: .4byte 0x0000ffff
_0812F7D0:
	ldr r2, _0812F800
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
	ldr r0, _0812F8D4
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
	ldr r0, _0812F8D8
	str r0, [r4, 0x1C]
	add sp, 0x8
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_0812F8D4: .4byte gUnknown_03004B00
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
	ldr r6, _0812F9A0
	ldrh r0, [r6, 0x6]
	strh r0, [r5, 0x2E]
	ldrb r1, [r6]
	adds r0, r5, 0
	bl StartSpriteAffineAnim
	ldr r0, _0812F9A4
	ldrb r0, [r0]
	bl battle_side_get_owner
	lsls r0, 24
	cmp r0, 0
	beq _0812F96E
	ldrh r0, [r6, 0x2]
	negs r0, r0
	strh r0, [r6, 0x2]
_0812F96E:
	ldr r4, _0812F9A8
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
	ldr r0, _0812F9AC
	str r0, [r5, 0x1C]
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_0812F9A0: .4byte gUnknown_03004B00
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
	ldr r2, _0812FA00
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
	ldr r3, _0812FA6C
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
	ldr r2, _0812FAB4
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
	ldr r1, _0812FAF4
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
	ldr r2, _0812FB4C
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
	ldr r1, _0812FBD0
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
	ldr r3, _0812FBD4
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
	ldr r2, _0812FC1C
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
	ldr r0, _0812FC64
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
	ldr r0, _0812FCC8
	mov r8, r0
	lsls r7, r6, 2
	adds r0, r7, r6
	lsls r0, 3
	mov r1, r8
	adds r4, r0, r1
	ldr r1, _0812FCCC
	ldr r2, _0812FCD0
	ldrb r0, [r2]
	adds r0, r1
	ldrb r0, [r0]
	strh r0, [r4, 0x26]
	ldr r5, _0812FCD4
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
	ldr r3, _0812FCD8
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
_0812FCD4: .4byte gUnknown_03004B00
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
	ldr r0, _0812FCF4
	ands r0, r1
	b _0812FD00
	.align 2, 0
_0812FCF4: .4byte 0x00007fff
_0812FCF8:
	ldrh r0, [r5, 0x2]
	ldr r2, _0812FD28
	adds r1, r2, 0
	orrs r0, r1
_0812FD00:
	strh r0, [r4, 0xC]
	ldr r0, _0812FD2C
	movs r3, 0x4
	ldrsh r1, [r0, r3]
	movs r2, 0x80
	lsls r2, 8
	ands r1, r2
	adds r5, r0, 0
	cmp r1, 0
	beq _0812FD38
	ldr r3, _0812FD30
	lsls r4, r6, 2
	adds r1, r4, r6
	lsls r1, 3
	adds r1, r3
	ldrh r2, [r5, 0x4]
	ldr r0, _0812FD34
	ands r0, r2
	b _0812FD4A
	.align 2, 0
_0812FD28: .4byte 0xffff8000
_0812FD2C: .4byte gUnknown_03004B00
_0812FD30: .4byte gTasks
_0812FD34: .4byte 0x00007fff
_0812FD38:
	ldr r3, _0812FD70
	lsls r4, r6, 2
	adds r1, r4, r6
	lsls r1, 3
	adds r1, r3
	ldrh r2, [r5, 0x4]
	ldr r7, _0812FD74
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
	ldr r1, _0812FD78
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
	ldr r1, _0812FDB4
	adds r5, r0, r1
	ldr r4, _0812FDB8
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
	ldr r0, _0812FDBC
	b _0812FDC2
	.align 2, 0
_0812FDB4: .4byte gTasks
_0812FDB8: .4byte gUnknown_03004B00
_0812FDBC: .4byte gUnknown_0202F7C8
_0812FDC0:
	ldr r0, _0812FE10
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
	ldr r0, _0812FE14
	ldrb r0, [r0]
	bl obj_id_for_side_relative_to_move
	adds r1, r0, 0
	lsls r1, 24
	lsrs r1, 24
	strh r1, [r5, 0x26]
	ldr r2, _0812FE18
	adds r0, r5, 0
	bl sub_80798F4
	ldr r0, _0812FE1C
	str r0, [r5]
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_0812FE10: .4byte gUnknown_0202F7C9
_0812FE14: .4byte gUnknown_03004B00
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
	ldr r1, _0812FE40
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
	ldr r2, _0812FEA0
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
	ldr r2, _0812FEDC
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
	ldr r7, _0812FF88
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
	ldr r0, _0812FF8C
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
	ldr r0, _0812FF90
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
	ldr r3, _0812FFE0
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
	ldr r1, _0813002C
	lsls r4, r0, 2
	adds r4, r0
	lsls r4, 3
	adds r4, r1
	movs r0, 0
	strh r0, [r4, 0x8]
	ldr r1, _08130030
	ldrh r0, [r1, 0x2]
	strh r0, [r4, 0xA]
	ldrb r0, [r1]
	bl obj_id_for_side_relative_to_move
	lsls r0, 24
	lsrs r0, 24
	ldr r2, _08130034
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
	ldr r0, _08130038
	str r0, [r4]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0813002C: .4byte gTasks
_08130030: .4byte gUnknown_03004B00
_08130034: .4byte gSprites
_08130038: .4byte sub_813003C
	thumb_func_end sub_812FFE4

	thumb_func_start sub_813003C
sub_813003C: @ 813003C
	push {r4,r5,lr}
	lsls r0, 24
	lsrs r5, r0, 24
	ldr r1, _08130084
	lsls r0, r5, 2
	adds r0, r5
	lsls r0, 3
	adds r4, r0, r1
	movs r1, 0xA
	ldrsh r0, [r4, r1]
	cmp r0, 0
	beq _0813008C
	ldrh r0, [r4, 0xC]
	ldr r2, _08130088
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
	ldr r1, _081300E0
	ldrb r3, [r1]
	ldr r1, _081300E4
	ldrb r1, [r1]
	str r1, [sp]
	movs r1, 0xA
	str r1, [sp, 0x4]
	movs r1, 0x2
	str r1, [sp, 0x8]
	movs r1, 0x1E
	str r1, [sp, 0xC]
	ldr r1, _081300E8
	str r1, [sp, 0x10]
	ldr r1, _081300EC
	str r1, [sp, 0x14]
	ldr r1, _081300F0
	str r1, [sp, 0x18]
	movs r1, 0
	bl sub_80E3C4C
	add sp, 0x1C
	pop {r0}
	bx r0
	.align 2, 0
_081300E0: .4byte gUnknown_0202F7C8
_081300E4: .4byte gUnknown_03004B00
_081300E8: .4byte gUnknown_08D2E014
_081300EC: .4byte gUnknown_08D2E170
_081300F0: .4byte gUnknown_08D2E150
	thumb_func_end sub_81300A4

	thumb_func_start sub_81300F4
sub_81300F4: @ 81300F4
	push {r4-r6,lr}
	adds r5, r0, 0
	ldr r6, _0813014C
	ldrb r0, [r6]
	bl battle_side_get_owner
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _08130110
	ldr r1, _08130150
	ldrh r0, [r1]
	negs r0, r0
	strh r0, [r1]
_08130110:
	ldrb r0, [r6]
	movs r1, 0
	bl sub_8077ABC
	lsls r0, 24
	ldr r4, _08130150
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
	ldr r0, _08130154
	strh r0, [r5, 0x30]
	b _08130180
	.align 2, 0
_0813014C: .4byte gUnknown_0202F7C8
_08130150: .4byte gUnknown_03004B00
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
	ldr r0, _081301AC
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
	ldr r0, _081301B0
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
	ldr r0, _08130218
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
	ldr r5, _0813025C
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
	ldr r5, _081302D8
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
	ldr r4, _081302DC
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
	ldr r0, _081302E0
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
	ldr r1, _0813030C
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
	ldr r4, _08130384
_0813034A:
	add r0, sp, 0x10
	movs r2, 0
	ldrsh r1, [r0, r2]
	mov r3, r8
	movs r0, 0
	ldrsh r2, [r3, r0]
	ldr r0, _08130388
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
	ldr r1, _08130404
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
	ldr r3, _08130518
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
	ldr r1, _08130548
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
	ldr r1, _0813054C
	adds r0, r4, 0
	bl oamt_set_x3A_32
	ldr r0, _08130550
	str r0, [r4, 0x1C]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08130548: .4byte gUnknown_03004B00
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
	ldr r1, _08130674
	adds r7, r0, r1
	ldr r0, _08130678
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
	ldr r0, _0813067C
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
	ldr r4, _08130680
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
	ldr r4, _08130684
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
	ldr r1, _08130688
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
	ldr r0, _0813068C
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
	ldr r1, _081306C8
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
	ldr r1, _08130708
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
	ldr r1, _0813072C
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
	ldr r5, _081307A0
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
	ldr r0, _081307C4
	movs r2, 0
	ldrsh r1, [r0, r2]
	adds r6, r0, 0
	cmp r1, 0
	bne _081307CC
	ldr r0, _081307C8
	b _081307CE
	.align 2, 0
_081307C4: .4byte gUnknown_03004B00
_081307C8: .4byte gUnknown_0202F7C8
_081307CC:
	ldr r0, _08130834
_081307CE:
	ldrb r5, [r0]
	ldrh r2, [r4, 0x4]
	lsls r1, r2, 22
	lsrs r1, 22
	adds r1, 0x10
	ldr r3, _08130838
	adds r0, r3, 0
	ands r1, r0
	ldr r0, _0813083C
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
	ldr r0, _08130858
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
	ldr r2, _08130930
	movs r3, 0
	ldrsh r0, [r2, r3]
	cmp r0, 0
	bne _08130934
	adds r0, r1, 0
	bl move_anim_task_del
	b _0813095C
	.align 2, 0
_08130930: .4byte gUnknown_03004B00
_08130934:
	ldr r0, _08130964
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
	ldr r2, _08130968
	adds r0, r4, 0
	bl sub_80798F4
	ldr r0, _0813096C
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
	ldr r1, _081309B0
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
	ldr r2, _081309B4
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
	ldr r2, _08130A10
	movs r0, 0x26
	ldrsh r1, [r4, r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r2
	ldr r1, _08130A14
_081309C8:
	strh r1, [r0, 0x24]
_081309CA:
	adds r0, r4, 0
	bl sub_807992C
	lsls r0, 24
	lsrs r5, r0, 24
	cmp r5, 0
	bne _08130A26
	ldr r2, _08130A10
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
	ldr r1, _08130A18
	adds r0, r1
	ldrh r1, [r0, 0x26]
	lsls r1, 24
	lsrs r1, 24
	ldr r2, _08130A1C
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
	ldr r0, _08130A40
	movs r1, 0
	ldrsh r0, [r0, r1]
	cmp r0, 0
	bne _08130A48
	ldr r4, _08130A44
	b _08130A4A
	.align 2, 0
_08130A40: .4byte gUnknown_03004B00
_08130A44: .4byte gUnknown_0202F7C8
_08130A48:
	ldr r4, _08130A88
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
	ldr r1, _08130A8C
	ldrh r0, [r1, 0x2]
	strh r0, [r5, 0x30]
	strh r2, [r5, 0x32]
	ldrh r0, [r1, 0x4]
	strh r0, [r5, 0x34]
	ldr r0, _08130A90
	str r0, [r5, 0x1C]
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_08130A88: .4byte gUnknown_0202F7C9
_08130A8C: .4byte gUnknown_03004B00
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
	ldr r0, _08130B18
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
_08130B18: .4byte gUnknown_03004B00
_08130B1C:
	movs r0, 0x8C
	strh r0, [r3, 0x20]
	ldr r0, _08130B30
_08130B22:
	strh r0, [r3, 0x3C]
	movs r0, 0x38
	strh r0, [r3, 0x22]
	ldr r0, _08130B34
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
	ldr r1, _08130B50
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
	ldr r3, _08130BF8
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
	ldr r3, _08130C48
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
	ldr r3, _08130CA4
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
	ldr r3, _08130CA8
	adds r0, r3, 0
	ands r1, r0
	ldr r0, _08130CAC
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
	ldr r0, _08130D7C
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
	bl battle_type_is_double
	lsls r0, 24
	lsrs r7, r0, 24
	cmp r7, 0x1
	bne _08130D8C
	ldr r5, _08130D80
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
	ldr r0, _08130D88
	b _08130DAA
	.align 2, 0
_08130D88: .4byte 0x0000ffff
_08130D8C:
	ldr r0, _08130DA0
	ldrb r0, [r0]
	bl battle_side_get_owner
	lsls r0, 24
	cmp r0, 0
	bne _08130DA8
	ldr r0, _08130DA4
	b _08130DAA
	.align 2, 0
_08130DA0: .4byte gUnknown_0202F7C8
_08130DA4: .4byte 0x0000ffff
_08130DA8:
	movs r0, 0x1
_08130DAA:
	strh r0, [r6, 0x24]
_08130DAC:
	ldr r0, _08130DB8
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
	ldr r1, _08130DE0
	adds r3, r0, r1
	movs r1, 0x8
	ldrsh r0, [r3, r1]
	cmp r0, 0x8
	bls _08130DD6
	b _08130F50
_08130DD6:
	lsls r0, 2
	ldr r1, _08130DE4
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
	ldr r2, _08130E4C
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
	ldr r2, _08130E7C
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
	ldr r2, _08130ECC
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
	ldr r2, _08130EFC
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
	ldr r2, _08130F34
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
	ldr r2, _08130F58
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
	ldr r0, _08130F78
	movs r1, 0
	ldrsh r0, [r0, r1]
	cmp r0, 0
	bne _08130F80
	adds r0, r4, 0
	movs r1, 0x1
	bl sub_80787B0
	ldr r0, _08130F7C
	b _08130F82
	.align 2, 0
_08130F78: .4byte gUnknown_03004B00
_08130F7C: .4byte gUnknown_0202F7C8
_08130F80:
	ldr r0, _08130FD8
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
	ldr r0, _08130FDC
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
	ldr r1, _08130FF8
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
	ldr r1, _08131024
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
	ldr r2, _081311D4
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
	ldr r0, _08131260
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
	ldr r4, _081312A0
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
	ldr r2, _081312A4
	ldrh r1, [r5, 0x20]
	ldrh r0, [r2]
	subs r0, r1, r0
	strh r0, [r5, 0x2E]
	ldrh r0, [r2, 0x4]
	subs r1, r0
	b _081312B6
	.align 2, 0
_081312A0: .4byte gUnknown_0202F7C9
_081312A4: .4byte gUnknown_03004B00
_081312A8:
	ldr r2, _081312DC
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
	ldr r0, _081312E0
	str r0, [r5, 0x1C]
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_081312DC: .4byte gUnknown_03004B00
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
	ldr r0, _08131328
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
	ldr r1, _08131380
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
	ldr r4, _081313F4
	ldrb r0, [r4]
	movs r1, 0
	bl refresh_graphics_maybe
	bl sub_8076BE0
	lsls r0, 24
	cmp r0, 0
	beq _081313C6
	ldr r3, _081313F8
	ldr r2, _081313FC
	ldrb r0, [r4]
	adds r0, r2
	ldrb r1, [r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r1, r3, 0
	adds r1, 0x10
	adds r0, r1
	ldr r1, _08131400
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
	ldr r5, _08131404
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
	ldr r1, _08131434
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
	ldr r0, _08131464
	lsls r1, r3, 4
	adds r1, r3
	lsls r1, 2
	adds r1, r0
	ldr r0, _08131468
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
	ldr r2, _081314D0
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
	ldr r1, _081314D4
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
	ldr r0, _08131510
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
	ldr r2, _08131560
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
	ldr r4, _08131588
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
	ldr r4, _0813158C
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
	ldr r4, _081315BC
_081315A0:
	ldr r0, _081315C0
	ldrb r0, [r0]
	movs r1, 0x3
	bl sub_8077ABC
	lsls r0, 24
	lsrs r0, 24
	strh r0, [r5, 0x22]
	strh r4, [r5, 0x26]
	ldr r0, _081315C4
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
	ldr r1, _081315E0
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
	ldr r2, _08131658
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
	ldr r2, _08131688
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
	ldr r1, _08131748
	adds r0, r1
	bl obj_delete_but_dont_free_vram
_0813173E:
	adds r0, r4, 0
	bl move_anim_task_del
	b _081317EE
	.align 2, 0
_08131748: .4byte gSprites
_0813174C:
	ldr r1, _081317FC
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
	ldr r0, _08131800
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
	ldr r0, _08131804
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
	ldr r0, _08131808
	mov r1, r8
	str r0, [r1]
	add r6, r9
	str r0, [r6]
	ldr r0, _0813180C
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
	ldr r1, _08131834
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
	ldr r3, _081318EC
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
	ldr r3, _0813193C
	movs r2, 0
	strh r2, [r3, 0xE]
	ldr r1, _08131940
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
_0813193C: .4byte gUnknown_03004B00
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
	ldr r1, _08131974
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
	ldr r1, _08131978
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
	ldr r1, _081319DC
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
	ldr r0, _081319E0
	ldrb r0, [r0]
	bl battle_side_get_owner
	lsls r0, 24
	mov r9, r4
	cmp r0, 0
	bne _081319E8
	ldr r2, _081319E4
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
	ldr r3, _08131A3C
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
	ldr r1, _08131A40
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
	ldr r0, _08131A6C
	ldr r2, [r0, 0x8]
	mov r10, r2
	ldr r3, [r0, 0xC]
	mov r9, r3
	ldrh r5, [r0]
	ldr r0, _08131A70
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
	ldr r4, _08131AD4
	ldrb r0, [r4]
	bl battle_side_get_owner
	lsls r0, 24
	cmp r0, 0
	bne _08131B10
	ldr r7, _08131AD8
	ldrb r0, [r4]
	lsls r0, 1
	adds r0, r7
	ldrh r0, [r0]
	movs r6, 0x64
	muls r0, r6
	ldr r5, _08131ADC
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
	ldr r0, _08131AE0
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
	ldr r2, _08131B0C
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
	ldr r7, _08131B64
	ldrb r0, [r4]
	lsls r0, 1
	adds r0, r7
	ldrh r0, [r0]
	movs r6, 0x64
	muls r0, r6
	ldr r5, _08131B68
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
	ldr r0, _08131B6C
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
	ldr r2, _08131C04
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
	ldr r6, _08131C08
_08131B94:
	ldr r0, _08131C0C
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
	ldr r0, _08131C10
	ldrb r0, [r0]
	lsls r0, 2
	ldr r1, _08131C14
	adds r0, r1
	ldrh r0, [r0, 0x2]
	cmp r0, 0
	beq _08131BF2
	ldr r1, _08131C04
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
	ldr r3, _08131C18
	movs r1, 0x10
	movs r2, 0x6
	bl BlendPalette
_08131BF2:
	ldr r0, _08131C1C
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
	ldr r1, _08131C6C
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
	ldr r0, _08131C70
	ldrb r0, [r0]
	bl battle_side_get_owner
	lsls r0, 24
	mov r9, r4
	cmp r0, 0
	bne _08131C78
	ldr r3, _08131C74
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
	ldr r2, _08131CDC
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
	ldr r1, _08131CE0
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
	ldr r0, _08131CE4
	ldrb r0, [r0]
	bl battle_side_get_owner
	lsls r0, 24
	cmp r0, 0
	bne _08131CEC
	lsls r4, r5, 16
	asrs r4, 16
	ldr r0, _08131CE8
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
	ldr r0, _08131D30
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
	ldr r1, _08131D34
	ldr r0, _08131D38
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
	ldr r0, _08131D3C
	mov r1, r9
	add r1, r8
	lsls r1, 3
	adds r1, r0
	movs r0, 0
	strh r0, [r1, 0xA]
	b _08131DB6
	.align 2, 0
_08131D30: .4byte gUnknown_0202F7C9
_08131D34: .4byte gUnknown_03004B00
_08131D38: .4byte 0x0000ffff
_08131D3C: .4byte gTasks
_08131D40:
	movs r0, 0
	bl obj_id_for_side_relative_to_move
	lsls r0, 24
	lsrs r7, r0, 24
	ldr r1, _08131D8C
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
	ldr r5, _08131D90
	adds r0, r5
	bl sub_807A0F4
	ldr r0, _08131D94
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
	ldr r0, _08131DC0
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
	ldr r1, _08131E38
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
	ldr r0, _08131E3C
	mov r10, r0
	ldrb r0, [r0]
	str r2, [sp, 0x10]
	bl battle_side_get_owner
	lsls r0, 24
	mov r9, r4
	ldr r2, [sp, 0x10]
	cmp r0, 0
	bne _08131E44
	ldr r1, _08131E40
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
	ldr r1, _08131EB0
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
	ldr r1, _08131EB4
	mov r0, r9
	add r0, r8
	lsls r0, 3
	adds r0, r1
	ldrb r1, [r0, 0xA]
	strh r1, [r0, 0xA]
	ldr r1, _08131EB0
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
	ldr r0, _08131F50
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
	ldr r0, _08131F54
	ldrb r0, [r0]
	movs r1, 0x1
	bl sub_8077ABC
	lsls r0, 24
	lsrs r0, 24
	adds r0, 0x10
	strh r0, [r4, 0x22]
	ldr r0, _08131F58
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
	ldr r0, _08131F5C
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
	ldr r2, _08131F60
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
_08131F50: .4byte gUnknown_03004B00
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
	ldr r0, _08131FD0
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
	ldr r1, _08132024
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
	ldr r1, _08132028
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
	ldr r0, _08132084
	ldrb r0, [r0]
	movs r1, 0
	bl sub_8077ABC
	lsls r0, 24
	lsrs r0, 24
	adds r5, r0, 0
	ldr r0, _08132088
	ldrb r0, [r0]
	movs r1, 0
	bl sub_8077ABC
	lsls r0, 24
	lsrs r0, 24
	adds r2, r0, 0
	ldr r1, _0813208C
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
	ldr r1, _081320CC
	ldr r0, _081320D0
	ldrb r0, [r0]
	adds r0, r1
	ldrb r2, [r0]
	ldr r1, _081320D4
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
	ldr r1, _08132144
	ldr r0, _08132148
	ldrb r0, [r0]
	adds r0, r1
	ldrb r2, [r0]
	ldr r1, _0813214C
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
	ldr r1, _08132190
	ldr r0, _08132194
	ldrb r0, [r0]
	adds r0, r1
	ldrb r2, [r0]
	ldr r1, _08132198
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
	ldr r0, _08132204
	adds r4, r1, r0
	movs r0, 0
	bl obj_id_for_side_relative_to_move
	lsls r0, 24
	lsrs r0, 24
	movs r5, 0
	strh r0, [r4, 0xE]
	ldr r0, _08132208
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
	ldr r2, _0813220C
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
	ldr r0, _08132210
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
	ldr r1, _08132238
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
	ldr r5, _081322B4
	movs r6, 0xE
	ldrsh r0, [r4, r6]
	lsls r1, r0, 4
	adds r1, r0
	lsls r1, 2
	adds r1, r5
	ldr r3, _081322B8
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
	ldr r3, _08132304
	movs r1, 0xE
	ldrsh r0, [r4, r1]
	lsls r1, r0, 4
	adds r1, r0
	lsls r1, 2
	adds r1, r3
	ldr r2, _08132308
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
	ldr r0, _0813236C
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
	ldr r0, _081323A8
	ldrb r0, [r0]
	bl battle_side_get_owner
	lsls r0, 24
	cmp r0, 0
	bne _081323B4
	ldr r2, _081323AC
	ldrh r0, [r4, 0x20]
	ldrh r1, [r2]
	subs r0, r1
	strh r0, [r4, 0x20]
	ldrh r0, [r2, 0x2]
	ldrh r1, [r4, 0x22]
	adds r0, r1
	strh r0, [r4, 0x22]
	ldr r0, _081323B0
	strh r0, [r4, 0x2E]
	movs r0, 0xC0
	strh r0, [r4, 0x30]
	adds r0, r4, 0
	movs r1, 0x1
	bl StartSpriteAffineAnim
	b _081323CE
	.align 2, 0
_081323A8: .4byte gUnknown_0202F7C9
_081323AC: .4byte gUnknown_03004B00
_081323B0: .4byte 0x0000fff5
_081323B4:
	movs r0, 0xB
	strh r0, [r4, 0x2E]
	movs r0, 0xC0
	strh r0, [r4, 0x30]
	ldr r1, _081323D8
	ldrh r0, [r1]
	ldrh r2, [r4, 0x20]
	adds r0, r2
	strh r0, [r4, 0x20]
	ldrh r0, [r1, 0x2]
	ldrh r1, [r4, 0x22]
	adds r0, r1
	strh r0, [r4, 0x22]
_081323CE:
	ldr r0, _081323DC
	str r0, [r4, 0x1C]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_081323D8: .4byte gUnknown_03004B00
_081323DC: .4byte sub_8132318
	thumb_func_end sub_8132370

	thumb_func_start sub_81323E0
sub_81323E0: @ 81323E0
	push {r4,r5,lr}
	adds r5, r0, 0
	ldr r4, _08132424
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
	ldr r0, _08132428
	str r0, [r5, 0x1C]
	ldr r0, _0813242C
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
	ldr r2, _081324A4
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
	ldr r2, _08132518
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
	ldr r2, _08132544
	movs r0, 0
	strh r0, [r2, 0xE]
	ldr r0, _08132548
	ldrh r1, [r0]
	movs r0, 0x60
	ands r0, r1
	cmp r0, 0
	beq _0813254C
	movs r0, 0x1
	b _0813256E
	.align 2, 0
_08132544: .4byte gUnknown_03004B00
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
	ldr r0, _081325B4
	adds r4, r0
	movs r0, 0
	strh r0, [r4, 0x8]
	ldr r0, _081325B8
	ldrb r0, [r0]
	bl obj_id_for_side_relative_to_move
	adds r1, r0, 0
	lsls r1, 24
	lsrs r1, 24
	strh r1, [r4, 0x26]
	ldr r2, _081325BC
	adds r0, r4, 0
	bl sub_80798F4
	ldr r0, _081325C0
	str r0, [r4]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_081325B4: .4byte gTasks
_081325B8: .4byte gUnknown_03004B00
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
	ldr r2, _0813261C
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
	ldr r2, _08132620
	movs r0, 0x26
	ldrsh r1, [r3, r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r2
	ldr r1, _08132624
	strh r1, [r0, 0x24]
	b _08132638
	.align 2, 0
_0813261C: .4byte gTasks
_08132620: .4byte gSprites
_08132624: .4byte 0x0000ffff
_08132628:
	ldr r2, _08132658
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
	ldr r0, _08132698
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
	ldr r0, _081326C8
	ldrb r1, [r0, 0x7]
	movs r0, 0x80
	ands r0, r1
	cmp r0, 0
	bne _081326C0
	ldr r0, _081326CC
	bl SetMainCallback2
	ldr r1, _081326D0
	ldr r0, _081326D4
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
	ldr r4, _08132778
	ldr r0, _0813277C
	str r0, [r4]
	bl sub_81332A0
	ldr r1, [r4]
	ldr r0, _08132780
	ldrh r0, [r0]
	ldr r2, _08132784
	adds r1, r2
	movs r5, 0
	strb r0, [r1]
	bl sub_8133558
	ldr r0, _08132788
	bl SetVBlankCallback
	ldr r4, _0813278C
	adds r0, r4, 0
	bl SetUpWindowConfig
	adds r0, r4, 0
	bl InitMenuWindow
	bl MenuZeroFillScreen
	ldr r4, _08132790
	adds r0, r4, 0
	bl SetUpWindowConfig
	adds r0, r4, 0
	bl InitMenuWindow
	bl MenuZeroFillScreen
	ldr r0, _08132794
	strh r5, [r0]
	strh r5, [r0]
	adds r0, 0x2
	strh r5, [r0]
	strh r5, [r0]
	ldr r0, _08132798
	bl LoadSpriteSheet
	ldr r0, _0813279C
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
	ldr r0, _081327A0
	bl SetMainCallback2
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_08132778: .4byte gUnknown_030007B0
_0813277C: .4byte 0x02017000
_08132780: .4byte gUnknown_0202E8CC
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
	ldr r4, _08132844
	ldr r0, _08132848
	str r0, [r4]
	bl sub_8133558
	ldr r1, [r4]
	ldr r0, _0813284C
	ldrh r0, [r0]
	ldr r2, _08132850
	adds r1, r2
	movs r5, 0
	strb r0, [r1]
	ldr r0, _08132854
	bl SetVBlankCallback
	ldr r4, _08132858
	adds r0, r4, 0
	bl SetUpWindowConfig
	adds r0, r4, 0
	bl InitMenuWindow
	bl MenuZeroFillScreen
	ldr r4, _0813285C
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
	ldr r0, _08132860
	strh r5, [r0]
	subs r0, 0x2
	strh r5, [r0]
	adds r0, 0x4
	strh r5, [r0]
	strh r5, [r0]
	ldr r0, _08132864
	bl LoadSpriteSheet
	ldr r0, _08132868
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
	ldr r0, _0813286C
	bl SetMainCallback2
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_08132844: .4byte gUnknown_030007B0
_08132848: .4byte 0x02017000
_0813284C: .4byte gUnknown_0202E8CE
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
	ldr r4, _081328E0
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
	ldr r2, _081328E4
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
	ldr r1, _081328E4
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
	ldr r4, _08132904
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
	ldr r1, _0813292C
	ldr r0, [r1]
	ldrb r0, [r0]
	adds r7, r1, 0
	cmp r0, 0x21
	bls _08132920
	b _08132FD6
_08132920:
	lsls r0, 2
	ldr r1, _08132930
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
	ldr r0, _08132A04
	adds r0, 0x64
	movs r1, 0x48
	strh r1, [r0]
	ldr r0, [r7]
	ldr r1, _08132A08
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
	ldr r0, _08132A20
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
	ldr r2, _08132A54
	ldr r0, [r2]
	ldr r1, _08132A58
	adds r0, r1
	movs r1, 0x1
	strb r1, [r0]
	ldr r1, [r2]
	ldrb r0, [r1]
	adds r0, 0x1
	strb r0, [r1]
	ldr r0, _08132A5C
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
	ldr r2, _08132A8C
	ldr r0, [r2]
	ldr r1, _08132A90
	adds r0, r1
	movs r1, 0x1
	strb r1, [r0]
	ldr r0, _08132A94
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
	ldr r0, _08132ACC
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
	ldr r4, _08132B1C
	ldr r2, [r4]
	ldr r1, _08132B20
	adds r0, r2, r1
	ldrb r1, [r0]
	movs r0, 0x64
	muls r0, r1
	ldr r1, _08132B24
	adds r0, r1
	ldrb r1, [r2, 0x1B]
	lsls r1, 1
	adds r2, 0x20
	adds r2, r1
	ldrh r1, [r2]
	bl GiveMoveToMon
	lsls r0, 16
	ldr r1, _08132B28
	cmp r0, r1
	beq _08132B34
	ldr r0, _08132B2C
	bl sub_81328E8
	ldr r1, _08132B30
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
_08132B30: .4byte gUnknown_0202E8CC
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
	ldr r3, _08132B70
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
	ldr r0, _08132B94
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
	ldr r0, _08132BB0
	strh r4, [r0]
	b _08132FCE
	.align 2, 0
_08132BB0: .4byte gUnknown_0202E8CC
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
	ldr r3, _08132BEC
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
	ldr r0, _08132C00
	bl sub_81328E8
	ldr r0, _08132C04
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
	ldr r0, _08132C28
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
	ldr r0, _08132C4C
	bl sub_81328E8
	ldr r0, _08132C50
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
	ldr r0, _08132C70
	ldr r1, [r0]
	movs r0, 0x18
	b _08132FD4
	.align 2, 0
_08132C70: .4byte gUnknown_030007B0
_08132C74:
	ldr r0, _08132C84
	bl sub_81328E8
	ldr r0, _08132C88
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
	ldr r0, _08132CAC
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
	ldr r0, _08132CC8
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
	ldr r1, _08132D08
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
	ldr r3, _08132D3C
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
	ldr r0, _08132D64
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
	ldr r0, _08132DA4
	ldrb r1, [r0, 0x7]
	movs r0, 0x80
	ands r0, r1
	cmp r0, 0
	beq _08132D76
	b _08132FD6
_08132D76:
	ldr r0, _08132DA8
	ldr r5, [r7]
	ldr r2, _08132DAC
	adds r1, r5, r2
	ldrb r1, [r1]
	ldr r2, _08132DB0
	ldrb r2, [r2]
	subs r2, 0x1
	lsls r2, 24
	lsrs r2, 24
	ldr r3, _08132DB4
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
	ldr r0, _08132DF4
	ldr r1, [r0]
	ldrb r0, [r1]
	adds r0, 0x1
	b _08132FD4
	.align 2, 0
_08132DF4: .4byte gUnknown_030007B0
_08132DF8:
	ldr r0, _08132E10
	ldrb r1, [r0, 0x7]
	movs r0, 0x80
	ands r0, r1
	cmp r0, 0
	beq _08132E06
	b _08132FD6
_08132E06:
	ldr r0, _08132E14
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
	ldr r5, _08132E74
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
	ldr r0, _08132E78
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
	ldr r0, _08132E9C
	ldrb r1, [r0, 0x7]
	movs r0, 0x80
	ands r0, r1
	cmp r0, 0
	beq _08132E8A
	b _08132FD6
_08132E8A:
	ldr r1, [r7]
	ldr r0, _08132EA0
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
	ldr r4, _08132F38
	adds r0, r1, r4
	ldrb r0, [r0]
	movs r6, 0x64
	muls r0, r6
	ldr r5, _08132F3C
	adds r0, r5
	ldrb r1, [r2]
	adds r1, 0xD
	bl GetMonData
	lsls r0, 16
	lsrs r0, 16
	ldr r2, _08132F40
	movs r1, 0xD
	mov r9, r1
	mov r1, r9
	muls r1, r0
	ldr r0, _08132F44
	mov r8, r0
	add r1, r8
	adds r0, r2, 0
	bl StringCopy
	ldr r1, [r7]
	adds r0, r1, r4
	ldrb r0, [r0]
	muls r0, r6
	adds r0, r5
	ldr r2, _08132F48
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
	ldr r2, _08132F48
	adds r3, r2
	ldrb r2, [r3]
	bl SetMonMoveSlot
	ldr r0, _08132F4C
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
	ldr r0, _08132F50
	bl sub_81328E8
	ldr r1, [r7]
	movs r0, 0x1E
	strb r0, [r1]
	ldr r1, _08132F54
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
_08132F54: .4byte gUnknown_0202E8CC
_08132F58:
	bl MenuUpdateWindowText
	lsls r0, 24
	cmp r0, 0
	beq _08132FD6
	ldr r0, _08132F78
	bl sub_81328E8
	ldr r0, _08132F7C
	ldr r1, [r0]
	movs r0, 0x1F
	strb r0, [r1]
	ldr r0, _08132F80
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
	ldr r0, _08132F9C
	bl PlayFanfare
	ldr r0, _08132FA0
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
	ldr r0, _08132FB8
	ldr r1, [r0]
	movs r0, 0x21
	b _08132FD4
	.align 2, 0
_08132FB8: .4byte gUnknown_030007B0
_08132FBC:
	ldr r0, _08132FE4
	ldrh r1, [r0, 0x2E]
	movs r0, 0x1
	ands r0, r1
	cmp r0, 0
	beq _08132FD6
	movs r0, 0x5
	bl PlaySE
_08132FCE:
	ldr r0, _08132FE8
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
	ldr r0, _08133024
	bl BasicInitMenuWindow
	movs r5, 0
	ldr r4, _08133028
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
	ldr r0, _0813302C
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
	ldr r4, _081330D4
	ldr r5, _081330D8
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
	ldr r6, _081330DC
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
	ldr r5, _081330E0
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
	ldr r0, _081330E4
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
	ldr r0, _08133134
	ldrh r2, [r0, 0x2E]
	movs r1, 0x30
	ands r1, r2
	negs r0, r1
	orrs r0, r1
	lsrs r4, r0, 31
	ldr r0, _08133138
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
	ldr r2, _0813313C
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
	ldr r4, _08133234
	ldr r5, _08133238
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
	ldr r7, _0813323C
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
	ldr r0, _08133240
	movs r2, 0x40
	movs r3, 0x2
	bl sub_8072C74
	mov r0, r8
	ldrb r5, [r0]
	ldrb r4, [r0, 0x1]
	ldr r0, _08133240
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
	ldr r0, _08133244
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
	ldr r0, _08133294
	ldrh r2, [r0, 0x2E]
	movs r1, 0x30
	ands r1, r2
	negs r0, r1
	orrs r0, r1
	lsrs r4, r0, 31
	ldr r0, _08133298
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
	ldr r2, _0813329C
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
	ldr r2, _081332F8
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
	ldr r3, _081332FC
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
	ldr r6, _0813353C
	adds r0, r6, 0
	movs r1, 0x8
	movs r2, 0x10
	movs r3, 0
	bl CreateSprite
	ldr r4, _08133540
	ldr r1, [r4]
	strb r0, [r1, 0x3]
	ldr r5, _08133544
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
	ldr r1, _08133548
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
	ldr r0, _0813354C
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
	ldr r6, _08133550
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
	ldr r1, _08133544
	adds r0, r1
	movs r1, 0x2
	bl StartSpriteAnim
	adds r5, 0x1
	cmp r5, 0x7
	ble _0813344E
	movs r5, 0
	ldr r7, _08133550
	ldr r6, _08133540
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
	ldr r4, _08133544
	adds r0, r4
	movs r1, 0x2
	bl StartSpriteAnim
	adds r5, 0x1
	cmp r5, 0x7
	ble _081334A6
	movs r5, 0
	ldr r3, _08133540
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
	ldr r1, _08133548
	ldr r3, _08133554
	movs r0, 0x12
	str r0, [sp]
	movs r0, 0x10
	movs r2, 0xC
	bl sub_814AC58
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
	ldr r5, _081335F4
	ldr r1, [r5]
	ldr r2, _081335F8
	adds r0, r1, r2
	ldrb r2, [r0]
	movs r0, 0x64
	muls r0, r2
	ldr r2, _081335FC
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
	ldr r2, _08133600
	adds r1, r2
	bl StringCopy
	adds r5, 0x19
	adds r4, 0x1
	ldr r0, [r6]
	ldrb r0, [r0, 0x1A]
	cmp r4, r0
	blt _08133586
_081335AA:
	ldr r4, _081335F4
	ldr r0, [r4]
	ldr r1, _081335F8
	adds r0, r1
	ldrb r1, [r0]
	movs r0, 0x64
	muls r0, r1
	ldr r1, _081335FC
	adds r0, r1
	movs r1, 0x2
	mov r2, sp
	bl GetMonData
	ldr r0, _08133604
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
	ldr r1, _08133608
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
	ldr r3, _08133628
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
	ldr r2, _08133670
	ldrh r1, [r2, 0x30]
	movs r0, 0x40
	ands r0, r1
	cmp r0, 0
	beq _08133688
	ldr r4, _08133674
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
	ldr r1, _08133678
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
	ldr r4, _081336C8
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
	ldr r3, _081336CC
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
	ldr r5, _08133738
	ldr r2, [r5]
	ldrb r1, [r2, 0x1B]
	ldrb r0, [r2, 0x1A]
	subs r0, 0x1
	cmp r1, r0
	beq _08133748
	movs r0, 0x8
	strb r0, [r2]
	ldr r0, _0813373C
	ldr r1, [r5]
	ldrb r3, [r1, 0x1B]
	lsls r2, r3, 1
	adds r2, r3
	lsls r2, 3
	adds r2, r3
	adds r2, 0x52
	adds r1, r2
	bl StringCopy
	ldr r4, _08133740
	ldr r1, _08133744
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
	ldr r4, _08133764
	ldr r1, _08133768
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
	ldr r0, _081337D4
	ldr r1, [r0]
	movs r0, 0xC
	strb r0, [r1]
	ldr r4, _081337D8
	ldr r1, _081337DC
	adds r0, r4, 0
	bl StringExpandPlaceholders
	adds r0, r4, 0
	movs r1, 0x3
	movs r2, 0xF
	bl MenuPrintMessage
_08133796:
	ldr r0, _081337D4
	ldr r4, [r0]
	ldrb r0, [r4, 0x1A]
	cmp r0, 0x3
	bls _081337F8
	ldr r3, _081337E0
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
	ldr r1, _08133834
	ldr r0, [r1]
	ldrb r6, [r0, 0x19]
	ldr r3, _08133838
	mov r10, r1
	ldr r0, _0813383C
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
	ldr r1, _08133840
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
	ldr r1, _0813385C
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
	ldr r1, _0813389C
	lsls r0, r5, 3
	adds r0, r1
	ldrb r0, [r0, 0x1]
	lsls r0, 29
	lsrs r0, 27
	ldr r1, _081338A0
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
	ldr r0, _08133938
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
	ldr r0, _0813393C
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
	ldr r1, _08133968
	mov r0, sp
	bl StringCopy
	ldrb r0, [r4, 0x2]
	subs r0, 0x1
	cmp r0, 0x6
	bls _0813395C
	b _08133AE2
_0813395C:
	lsls r0, 2
	ldr r1, _0813396C
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
	ldr r0, _081339A0
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
	ldr r0, _081339C4
	lsls r1, r5, 1
	adds r1, r5
	lsls r1, 2
	adds r1, r0
	ldrb r0, [r1, 0x3]
	cmp r0, 0
	bne _081339CC
_081339B4:
	ldr r1, _081339C8
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
	ldr r2, _08133A34
	ldr r1, _08133A38
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
	ldr r7, _08133A3C
	ldr r6, _08133A40
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
	ldr r2, _08133AB4
	ldr r1, _08133AB8
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
	ldr r7, _08133ABC
	ldr r6, _08133AC0
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
	ldr r6, _08133B88
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
	ldr r7, _08133B8C
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
	ldr r0, _08133B90
	adds r0, r4, r0
	ldrb r0, [r0]
	lsls r1, r0, 1
	adds r1, r0
	ldr r0, _08133B94
	adds r1, r0
	adds r0, r5, 0
	bl sub_8133940
	adds r0, r4, 0x1
	lsls r0, 16
	lsrs r4, r0, 16
	cmp r4, 0x2
	bls _08133B48
	ldr r1, _08133B98
	ldr r0, _08133B9C
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
	ldr r0, _08133BF8
	adds r0, r4, r0
	ldrb r0, [r0]
	lsls r1, r0, 1
	adds r1, r0
	ldr r0, _08133BFC
	adds r1, r0
	adds r0, r5, 0
	bl sub_8133940
	adds r0, r4, 0x1
	lsls r0, 16
	lsrs r4, r0, 16
	cmp r4, 0x3
	bls _08133BA4
	ldr r1, _08133C00
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
	ldr r4, _08133C54
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
	ldr r5, _08133C58
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
	ldr r4, _08133CA0
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
	ldr r0, _08133CC8
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

	thumb_func_start sub_8133CCC
sub_8133CCC: @ 8133CCC
	push {r4-r6,lr}
	mov r6, r8
	push {r6}
	ldr r0, _08133D14
	mov r8, r0
	ldrb r0, [r0]
	movs r6, 0x64
	muls r0, r6
	ldr r4, _08133D18
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
_08133D14: .4byte gUnknown_03005CE0
_08133D18: .4byte gPlayerParty
_08133D1C:
	movs r0, 0x1
_08133D1E:
	pop {r3}
	mov r8, r3
	pop {r4-r6}
	pop {r1}
	bx r1
	thumb_func_end sub_8133CCC

	thumb_func_start unref_sub_8133D28
unref_sub_8133D28: @ 8133D28
	push {lr}
	lsls r0, 24
	lsrs r0, 24
	ldr r1, _08133D44
	ldr r2, _08133D48
	str r2, [r1, 0xC]
	ldr r2, _08133D4C
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
	thumb_func_end unref_sub_8133D28

	thumb_func_start sub_8133D50
sub_8133D50: @ 8133D50
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	lsls r0, 24
	lsrs r7, r0, 24
	ldr r0, _08133DA0
	mov r9, r0
	ldr r1, _08133DA4
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
	ldr r2, _08133DE4
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
	ldr r2, _08133E5C
	adds r0, r2
	str r0, [r5]
	strh r1, [r5, 0x6]
	ldr r1, _08133E60
	str r1, [r5, 0xC]
	ldr r1, _08133E64
	str r1, [r5, 0x10]
	movs r1, 0x3A
	bl GetMonData
	ldr r1, _08133E68
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
	ldr r0, _08133E6C
	str r0, [r4]
	ldrh r1, [r4, 0x1E]
	ldr r0, _08133E70
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
	ldr r0, _08133EAC
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
	ldr r0, _08133EB0
	lsls r1, r4, 2
	adds r1, r4
	lsls r1, 3
	adds r1, r0
	ldr r0, _08133EB4
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
	ldr r1, _08133EE8
	movs r0, 0
	strb r0, [r1]
	bl sub_806D5A4
	ldr r0, _08133EEC
	movs r1, 0x1
	bl sub_806E834
	ldr r1, _08133EF0
	lsls r0, r4, 2
	adds r0, r4
	lsls r0, 3
	adds r0, r1
	ldr r1, _08133EF4
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
	ldr r4, _08133F3C
	ldr r0, _08133F40
	adds r1, r4, r0
	movs r0, 0x2
	strb r0, [r1]
	ldr r0, _08133F44
	adds r4, r0
	ldrb r1, [r4, 0x1]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	ldr r1, _08133F48
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
	ldr r1, _08133F7C
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
_08133F7C: .4byte gUnknown_08402E40
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
	ldr r1, _08133FC8
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
_08133FC8: .4byte gUnknown_08402E40
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
	ldr r1, _08134010
	lsls r0, r3, 5
	adds r0, r1
	ldrb r0, [r0, 0x13]
	movs r2, 0
	ldr r1, _08134014
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
_08134014: .4byte gUnknown_08402E40
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
	ldr r1, _08134064
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
	ldr r0, _08134068
	lsls r1, r5, 3
	adds r1, r0
	ldr r0, [r1]
	adds r0, r2
	strb r4, [r0]
	movs r0, 0x1
	b _0813406E
	.align 2, 0
_08134064: .4byte gDecorations
_08134068: .4byte gUnknown_08402E40
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
	ldr r1, _0813409C
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
	ldr r2, _081340FC
	ldr r1, _08134100
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
_081340FC: .4byte gUnknown_08402E40
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
	ldr r2, _08134190
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
	ldr r1, _08134190
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
_08134190: .4byte gUnknown_08402E40
	thumb_func_end sub_8134104

	thumb_func_start sub_8134194
sub_8134194: @ 8134194
	push {r4,r5,lr}
	lsls r0, 24
	movs r4, 0
	movs r3, 0
	ldr r2, _081341D0
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
_081341D0: .4byte gUnknown_08402E40
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

	thumb_func_start sub_81341F8
sub_81341F8: @ 81341F8
	push {lr}
	ldr r0, _08134208
	movs r1, 0
	movs r2, 0x1C
	bl memset
	pop {r0}
	bx r0
	.align 2, 0
_08134208: .4byte gSaveBlock1 + 0x3144
	thumb_func_end sub_81341F8

	thumb_func_start sub_813420C
sub_813420C: @ 813420C
	push {r4-r6,lr}
	movs r2, 0
	ldr r6, _08134238
	ldr r4, _0813423C
	movs r3, 0
	adds r5, r4, 0x1
_08134218:
	lsls r1, r2, 1
	adds r0, r1, r4
	strb r3, [r0]
	adds r1, r5
	strb r3, [r1]
	adds r0, r2, 0x1
	lsls r0, 24
	lsrs r2, r0, 24
	cmp r2, 0x2
	bls _08134218
	movs r0, 0
	strb r0, [r6]
	strb r0, [r6, 0x1]
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_08134238: .4byte gUnknown_02039302
_0813423C: .4byte gUnknown_020392FC
	thumb_func_end sub_813420C

	thumb_func_start sub_8134240
sub_8134240: @ 8134240
	push {r4-r6,lr}
	mov r6, r8
	push {r6}
	sub sp, 0x10
	ldr r5, _081342FC
	.ifdef SAPPHIRE
	ldr r6, _sub_8134240_Latias
	.else
	movs r6, 0xCC
	lsls r6, 1
	.endif
	movs r0, 0
	str r0, [sp]
	str r0, [sp, 0x4]
	str r0, [sp, 0x8]
	str r0, [sp, 0xC]
	adds r0, r5, 0
	adds r1, r6, 0
	movs r2, 0x28
	movs r3, 0x20
	bl CreateMon
	ldr r4, _08134300
	movs r0, 0
	mov r8, r0
	strh r6, [r4, 0x8]
	movs r0, 0x28
	strb r0, [r4, 0xC]
	mov r0, r8
	strb r0, [r4, 0xD]
	movs r0, 0x1
	strb r0, [r4, 0x13]
	adds r0, r5, 0
	movs r1, 0x42
	bl GetMonData
	str r0, [r4]
	adds r0, r5, 0
	movs r1, 0
	bl GetMonData
	str r0, [r4, 0x4]
	adds r0, r5, 0
	movs r1, 0x3A
	bl GetMonData
	strh r0, [r4, 0xA]
	adds r0, r5, 0
	movs r1, 0x16
	bl GetMonData
	strb r0, [r4, 0xE]
	adds r0, r5, 0
	movs r1, 0x17
	bl GetMonData
	strb r0, [r4, 0xF]
	adds r0, r5, 0
	movs r1, 0x18
	bl GetMonData
	strb r0, [r4, 0x10]
	adds r0, r5, 0
	movs r1, 0x21
	bl GetMonData
	strb r0, [r4, 0x11]
	adds r0, r5, 0
	movs r1, 0x2F
	bl GetMonData
	strb r0, [r4, 0x12]
	ldr r4, _08134304
	mov r0, r8
	strb r0, [r4]
	bl Random
	ldr r5, _08134308
	lsls r0, 16
	lsrs r0, 16
	movs r1, 0x14
	bl __umodsi3
	lsls r0, 16
	lsrs r0, 16
	lsls r1, r0, 1
	adds r1, r0
	lsls r1, 1
	adds r1, r5
	ldrb r0, [r1]
	strb r0, [r4, 0x1]
	add sp, 0x10
	pop {r3}
	mov r8, r3
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_081342FC: .4byte gEnemyParty
	.ifdef SAPPHIRE
_sub_8134240_Latias: .4byte 407
	.endif
_08134300: .4byte gSaveBlock1 + 0x3144
_08134304: .4byte gUnknown_02039302
_08134308: .4byte gUnknown_08402E80
	thumb_func_end sub_8134240

	thumb_func_start sub_813430C
sub_813430C: @ 813430C
	push {lr}
	bl sub_81341F8
	bl sub_813420C
	bl sub_8134240
	pop {r0}
	bx r0
	thumb_func_end sub_813430C

	thumb_func_start mapnumbers_history_shift_sav1_0_2_4_out
mapnumbers_history_shift_sav1_0_2_4_out: @ 8134320
	ldr r0, _08134340
	ldrb r1, [r0, 0x2]
	strb r1, [r0, 0x4]
	ldrb r1, [r0, 0x3]
	strb r1, [r0, 0x5]
	ldrb r1, [r0]
	strb r1, [r0, 0x2]
	ldrb r1, [r0, 0x1]
	strb r1, [r0, 0x3]
	ldr r2, _08134344
	ldrb r1, [r2, 0x4]
	strb r1, [r0]
	ldrb r1, [r2, 0x5]
	strb r1, [r0, 0x1]
	bx lr
	.align 2, 0
_08134340: .4byte gUnknown_020392FC
_08134344: .4byte gSaveBlock1
	thumb_func_end mapnumbers_history_shift_sav1_0_2_4_out

	thumb_func_start sub_8134348
sub_8134348: @ 8134348
	push {r4,r5,lr}
	movs r1, 0
	ldr r0, _08134388
	ldrb r0, [r0, 0x13]
	cmp r0, 0
	beq _08134380
	ldr r0, _0813438C
	strb r1, [r0]
	ldr r5, _08134390
	adds r4, r0, 0
_0813435C:
	bl Random
	lsls r0, 16
	lsrs r0, 16
	movs r1, 0x14
	bl __umodsi3
	lsls r0, 16
	lsrs r0, 16
	lsls r1, r0, 1
	adds r1, r0
	lsls r1, 1
	adds r1, r5
	ldrb r1, [r1]
	ldrb r0, [r4, 0x1]
	cmp r0, r1
	beq _0813435C
	strb r1, [r4, 0x1]
_08134380:
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_08134388: .4byte gSaveBlock1 + 0x3144
_0813438C: .4byte gUnknown_02039302
_08134390: .4byte gUnknown_08402E80
	thumb_func_end sub_8134348

	thumb_func_start sub_8134394
sub_8134394: @ 8134394
	push {r4-r7,lr}
	movs r4, 0
	bl Random
	lsls r0, 16
	movs r1, 0xF0
	lsls r1, 12
	ands r1, r0
	cmp r1, 0
	bne _081343AE
	bl sub_8134348
	b _08134416
_081343AE:
	ldr r0, _081343FC
	ldrb r0, [r0, 0x13]
	cmp r0, 0
	beq _08134416
	ldr r7, _08134400
	ldr r3, _08134404
_081343BA:
	lsls r0, r4, 1
	adds r0, r4
	lsls r2, r0, 1
	adds r1, r2, r3
	ldrb r0, [r7, 0x1]
	ldrb r1, [r1]
	cmp r0, r1
	bne _0813440C
	ldr r6, _08134404
	adds r5, r2, 0x1
	ldr r4, _08134408
_081343D0:
	bl Random
	lsls r0, 16
	lsrs r0, 16
	movs r1, 0x5
	bl __umodsi3
	lsls r0, 16
	lsrs r0, 16
	adds r0, r5
	adds r0, r6
	ldrb r1, [r0]
	ldrb r0, [r4, 0x4]
	cmp r0, 0
	bne _081343F4
	ldrb r0, [r4, 0x5]
	cmp r0, r1
	beq _081343D0
_081343F4:
	cmp r1, 0xFF
	beq _081343D0
	strb r1, [r7, 0x1]
	b _08134416
	.align 2, 0
_081343FC: .4byte gSaveBlock1 + 0x3144
_08134400: .4byte gUnknown_02039302
_08134404: .4byte gUnknown_08402E80
_08134408: .4byte gUnknown_020392FC
_0813440C:
	adds r0, r4, 0x1
	lsls r0, 24
	lsrs r4, r0, 24
	cmp r4, 0x13
	bls _081343BA
_08134416:
	pop {r4-r7}
	pop {r0}
	bx r0
	thumb_func_end sub_8134394

	thumb_func_start sub_813441C
sub_813441C: @ 813441C
	push {lr}
	lsls r0, 24
	lsrs r2, r0, 24
	lsls r1, 24
	lsrs r1, 24
	ldr r0, _08134440
	ldrb r0, [r0, 0x13]
	cmp r0, 0
	beq _08134448
	ldr r0, _08134444
	ldrb r3, [r0]
	cmp r2, r3
	bne _08134448
	ldrb r0, [r0, 0x1]
	cmp r1, r0
	bne _08134448
	movs r0, 0x1
	b _0813444A
	.align 2, 0
_08134440: .4byte gSaveBlock1 + 0x3144
_08134444: .4byte gUnknown_02039302
_08134448:
	movs r0, 0
_0813444A:
	pop {r1}
	bx r1
	thumb_func_end sub_813441C

	thumb_func_start sub_8134450
sub_8134450: @ 8134450
	push {r4,r5,lr}
	sub sp, 0x4
	ldr r4, _081344C4
	ldr r5, _081344C8
	ldrh r1, [r5, 0x8]
	ldrb r2, [r5, 0xC]
	ldr r3, [r5]
	ldr r0, [r5, 0x4]
	str r0, [sp]
	adds r0, r4, 0
	bl CreateMonWithIVsPersonality
	adds r2, r5, 0
	adds r2, 0xD
	adds r0, r4, 0
	movs r1, 0x37
	bl SetMonData
	adds r2, r5, 0
	adds r2, 0xA
	adds r0, r4, 0
	movs r1, 0x39
	bl SetMonData
	adds r2, r5, 0
	adds r2, 0xE
	adds r0, r4, 0
	movs r1, 0x16
	bl SetMonData
	adds r2, r5, 0
	adds r2, 0xF
	adds r0, r4, 0
	movs r1, 0x17
	bl SetMonData
	adds r2, r5, 0
	adds r2, 0x10
	adds r0, r4, 0
	movs r1, 0x18
	bl SetMonData
	adds r2, r5, 0
	adds r2, 0x11
	adds r0, r4, 0
	movs r1, 0x21
	bl SetMonData
	adds r2, r5, 0
	adds r2, 0x12
	adds r0, r4, 0
	movs r1, 0x2F
	bl SetMonData
	add sp, 0x4
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_081344C4: .4byte gEnemyParty
_081344C8: .4byte gSaveBlock1 + 0x3144
	thumb_func_end sub_8134450

	thumb_func_start sub_81344CC
sub_81344CC: @ 81344CC
	push {lr}
	ldr r1, _081344F8
	ldrb r0, [r1, 0x4]
	ldrb r1, [r1, 0x5]
	bl sub_813441C
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _081344FC
	bl Random
	lsls r0, 16
	movs r1, 0xC0
	lsls r1, 10
	ands r1, r0
	cmp r1, 0
	bne _081344FC
	bl sub_8134450
	movs r0, 0x1
	b _081344FE
	.align 2, 0
_081344F8: .4byte gSaveBlock1
_081344FC:
	movs r0, 0
_081344FE:
	pop {r1}
	bx r1
	thumb_func_end sub_81344CC

	thumb_func_start sub_8134504
sub_8134504: @ 8134504
	push {r4,r5,lr}
	adds r5, r0, 0
	movs r1, 0x39
	bl GetMonData
	ldr r4, _08134528
	strh r0, [r4, 0xA]
	adds r0, r5, 0
	movs r1, 0x37
	bl GetMonData
	strb r0, [r4, 0xD]
	bl sub_8134348
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_08134528: .4byte gSaveBlock1 + 0x3144
	thumb_func_end sub_8134504

	thumb_func_start sub_813452C
sub_813452C: @ 813452C
	ldr r1, _08134534
	movs r0, 0
	strb r0, [r1, 0x13]
	bx lr
	.align 2, 0
_08134534: .4byte gSaveBlock1 + 0x3144
	thumb_func_end sub_813452C

	thumb_func_start sub_8134538
sub_8134538: @ 8134538
	ldr r3, _08134544
	ldrb r2, [r3]
	strb r2, [r0]
	ldrb r0, [r3, 0x1]
	strb r0, [r1]
	bx lr
	.align 2, 0
_08134544: .4byte gUnknown_02039302
	thumb_func_end sub_8134538

	thumb_func_start sub_8134548
sub_8134548: @ 8134548
	push {r4,r5,lr}
	movs r4, 0
	movs r5, 0
_0813454E:
	ldr r0, _08134568
	ldr r1, _0813456C
	adds r0, r1
	adds r0, r5, r0
	ldrb r0, [r0]
	cmp r0, 0x6
	bhi _08134590
	lsls r0, 2
	ldr r1, _08134570
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_08134568: .4byte gSaveBlock2
_0813456C: .4byte 0x00000556
_08134570: .4byte _08134574
	.align 2, 0
_08134574:
	.4byte _08134590
	.4byte _081345A8
	.4byte _081345C8
	.4byte _081345D8
	.4byte _081345B8
	.4byte _081345C0
	.4byte _081345D8
_08134590:
	lsls r0, r5, 24
	lsrs r0, 24
	bl sub_813461C
	cmp r4, 0
	bne _081345D8
	movs r0, 0x80
	lsls r0, 7
	movs r1, 0x5
	bl VarSet
	b _081345D8
_081345A8:
	lsls r0, r5, 24
	lsrs r0, 24
	bl sub_813461C
	movs r0, 0x80
	lsls r0, 7
	movs r1, 0x1
	b _081345CE
_081345B8:
	movs r0, 0x80
	lsls r0, 7
	movs r1, 0x2
	b _081345CE
_081345C0:
	movs r0, 0x80
	lsls r0, 7
	movs r1, 0x3
	b _081345CE
_081345C8:
	movs r0, 0x80
	lsls r0, 7
	movs r1, 0x4
_081345CE:
	bl VarSet
	adds r0, r4, 0x1
	lsls r0, 24
	lsrs r4, r0, 24
_081345D8:
	adds r5, 0x1
	cmp r5, 0x1
	ble _0813454E
	ldr r1, _08134610
	ldr r2, _08134614
	adds r0, r1, r2
	ldrb r0, [r0]
	cmp r0, 0x3
	beq _081345EE
	cmp r0, 0x6
	bne _08134606
_081345EE:
	ldr r2, _08134618
	adds r0, r1, r2
	ldrb r0, [r0]
	cmp r0, 0x3
	beq _081345FC
	cmp r0, 0x6
	bne _08134606
_081345FC:
	movs r0, 0x80
	lsls r0, 7
	movs r1, 0x5
	bl VarSet
_08134606:
	bl sub_8135C44
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_08134610: .4byte gSaveBlock2
_08134614: .4byte 0x00000556
_08134618: .4byte 0x00000557
	thumb_func_end sub_8134548

	thumb_func_start sub_813461C
sub_813461C: @ 813461C
	lsls r0, 24
	lsrs r0, 24
	ldr r3, _08134644
	ldr r2, _08134648
	adds r1, r3, r2
	adds r1, r0, r1
	movs r2, 0
	strb r2, [r1]
	lsls r0, 1
	movs r2, 0xAB
	lsls r2, 3
	adds r1, r3, r2
	adds r1, r0, r1
	movs r2, 0x1
	strh r2, [r1]
	ldr r1, _0813464C
	adds r3, r1
	adds r0, r3
	strh r2, [r0]
	bx lr
	.align 2, 0
_08134644: .4byte gSaveBlock2
_08134648: .4byte 0x00000556
_0813464C: .4byte 0x0000055c
	thumb_func_end sub_813461C

	thumb_func_start sub_8134650
sub_8134650: @ 8134650
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	sub sp, 0x2C
	lsls r0, 24
	lsrs r5, r0, 24
	lsls r1, 16
	lsrs r6, r1, 16
	add r4, sp, 0x28
	movs r0, 0
	strb r0, [r4]
	bl sub_813601C
	ldr r0, _08134684
	ldrh r0, [r0]
	adds r7, r4, 0
	cmp r0, 0
	bne _08134680
	ldr r1, _08134688
	ldr r2, _0813468C
	adds r0, r1, r2
	ldrh r0, [r0]
	cmp r0, r6
	beq _08134690
_08134680:
	movs r0, 0
	b _081346E2
	.align 2, 0
_08134684: .4byte gScriptResult
_08134688: .4byte gSaveBlock2
_0813468C: .4byte 0x0000049a
_08134690:
	movs r6, 0x32
	cmp r5, 0
	beq _08134698
	movs r6, 0x64
_08134698:
	movs r4, 0
	mov r8, r1
_0813469C:
	movs r0, 0x2C
	muls r0, r4
	mov r3, r8
	adds r1, r0, r3
	movs r2, 0x9B
	lsls r2, 3
	adds r0, r1, r2
	ldrb r2, [r0]
	cmp r2, r6
	bne _08134680
	ldr r3, _081346F0
	adds r0, r1, r3
	ldrh r0, [r0]
	adds r3, 0x2
	adds r1, r3
	ldrh r1, [r1]
	str r2, [sp]
	add r2, sp, 0x10
	str r2, [sp, 0x4]
	add r2, sp, 0x1C
	str r2, [sp, 0x8]
	str r7, [sp, 0xC]
	movs r2, 0x1
	adds r3, r5, 0
	bl sub_8135200
	adds r4, 0x1
	cmp r4, 0x2
	ble _0813469C
	movs r1, 0
	ldrb r0, [r7]
	cmp r0, 0x3
	bne _081346E0
	movs r1, 0x1
_081346E0:
	adds r0, r1, 0
_081346E2:
	add sp, 0x2C
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r1}
	bx r1
	.align 2, 0
_081346F0: .4byte 0x000004cc
	thumb_func_end sub_8134650

	thumb_func_start sub_81346F4
sub_81346F4: @ 81346F4
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	sub sp, 0x18
	movs r0, 0
	mov r9, r0
	ldr r4, _08134738
	ldr r1, _0813473C
	adds r0, r4, r1
	ldrb r0, [r0]
	lsls r0, 31
	lsrs r7, r0, 31
	adds r0, r7, 0
	bl sub_8135D3C
	lsls r0, 16
	lsrs r0, 16
	mov r8, r0
	adds r0, r7, 0
	mov r1, r8
	bl sub_8134650
	lsls r0, 24
	adds r1, r4, 0
	cmp r0, 0
	beq _08134744
	ldr r2, _08134740
	adds r1, r2
	movs r0, 0xC8
	strb r0, [r1]
	b _081347DE
	.align 2, 0
_08134738: .4byte gSaveBlock2
_0813473C: .4byte 0x00000554
_08134740: .4byte 0x00000564
_08134744:
	movs r5, 0
	movs r3, 0xA4
	mov r12, r3
	mov r10, sp
_0813474C:
	mov r0, r12
	muls r0, r5
	movs r4, 0
	movs r1, 0
	movs r2, 0
	adds r6, r5, 0x1
	str r6, [sp, 0x14]
	ldr r6, _081347B4
	adds r3, r0, r6
_0813475E:
	ldm r3!, {r0}
	orrs r4, r0
	adds r1, r0
	adds r2, 0x1
	cmp r2, 0x27
	bls _0813475E
	mov r3, r12
	muls r3, r5
	ldr r0, _081347B8
	adds r2, r3, r0
	movs r6, 0xA7
	lsls r6, 1
	adds r0, r2, r6
	ldrh r0, [r0]
	cmp r0, r8
	bne _081347A4
	subs r6, 0x2
	adds r0, r2, r6
	ldrb r0, [r0]
	cmp r0, r7
	bne _081347A4
	cmp r4, 0
	beq _081347A4
	ldr r2, _081347BC
	adds r0, r3, r2
	ldr r0, [r0]
	cmp r0, r1
	bne _081347A4
	mov r3, r10
	adds r3, 0x4
	mov r10, r3
	subs r3, 0x4
	stm r3!, {r5}
	movs r6, 0x1
	add r9, r6
_081347A4:
	ldr r5, [sp, 0x14]
	cmp r5, 0x4
	ble _0813474C
	mov r0, r9
	cmp r0, 0
	bne _081347C0
	movs r0, 0
	b _081347E0
	.align 2, 0
_081347B4: .4byte gSaveBlock2 + 0x14C
_081347B8: .4byte gSaveBlock2
_081347BC: .4byte gSaveBlock2 + 0x1EC
_081347C0:
	bl Random
	ldr r4, _081347F0
	lsls r0, 16
	lsrs r0, 16
	mov r1, r9
	bl __modsi3
	lsls r0, 2
	add r0, sp
	ldr r0, [r0]
	adds r0, 0x64
	ldr r1, _081347F4
	adds r4, r1
	strb r0, [r4]
_081347DE:
	movs r0, 0x1
_081347E0:
	add sp, 0x18
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r1}
	bx r1
	.align 2, 0
_081347F0: .4byte gSaveBlock2
_081347F4: .4byte 0x00000564
	thumb_func_end sub_81346F4

	thumb_func_start sub_81347F8
sub_81347F8: @ 81347F8
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	ldr r5, _08134838
	ldr r1, _0813483C
	adds r0, r5, r1
	ldrb r0, [r0]
	lsls r0, 31
	lsrs r6, r0, 31
	bl sub_81346F4
	lsls r0, 24
	cmp r0, 0
	beq _08134848
	ldr r2, _08134840
	adds r4, r5, r2
	ldrb r0, [r4]
	bl sub_81349FC
	lsls r0, r6, 1
	movs r3, 0xAB
	lsls r3, 3
	adds r1, r5, r3
	adds r0, r1
	ldrh r0, [r0]
	adds r0, r5, r0
	ldr r1, _08134844
	adds r0, r1
	ldrb r1, [r4]
	b _081349DC
	.align 2, 0
_08134838: .4byte gSaveBlock2
_0813483C: .4byte 0x00000554
_08134840: .4byte 0x00000564
_08134844: .4byte 0x00000569
_08134848:
	lsls r0, r6, 1
	ldr r2, _081348D8
	adds r1, r5, r2
	adds r1, r0, r1
	ldrh r1, [r1]
	adds r7, r0, 0
	cmp r1, 0x7
	bls _0813485A
	b _0813495C
_0813485A:
	movs r3, 0xAB
	lsls r3, 3
	adds r0, r5, r3
	adds r1, r7, r0
	ldrh r0, [r1]
	cmp r0, 0x7
	bne _081348E4
	adds r6, r5, 0
	mov r9, r7
	adds r5, r1, 0
	ldr r0, _081348DC
	adds r0, r6
	mov r10, r0
	mov r8, r5
_08134876:
	bl Random
	movs r1, 0xFF
	ands r1, r0
	lsls r2, r1, 2
	adds r2, r1
	ldr r1, _081348D8
	adds r4, r6, r1
	mov r3, r9
	adds r0, r3, r4
	ldrh r1, [r0]
	subs r1, 0x1
	lsls r0, r1, 2
	adds r0, r1
	lsls r0, 1
	adds r0, 0x14
	lsrs r2, 7
	adds r2, r0
	lsls r2, 16
	lsrs r2, 16
	movs r1, 0
	ldrh r0, [r5]
	subs r0, 0x1
	cmp r1, r0
	bge _081348C8
	mov r3, r10
	ldrb r0, [r3]
	cmp r0, r2
	beq _081348C8
	subs r0, r4, 0x4
	adds r0, r7, r0
	ldrh r0, [r0]
	subs r3, r0, 0x1
	adds r4, 0xE
_081348BA:
	adds r1, 0x1
	cmp r1, r3
	bge _081348C8
	adds r0, r1, r4
	ldrb r0, [r0]
	cmp r0, r2
	bne _081348BA
_081348C8:
	mov r3, r8
	ldrh r0, [r3]
	subs r0, 0x1
	ldr r4, _081348E0
	cmp r1, r0
	bne _08134876
	b _081349B6
	.align 2, 0
_081348D8: .4byte 0x0000055c
_081348DC: .4byte 0x0000056a
_081348E0: .4byte gSaveBlock2
_081348E4:
	adds r6, r5, 0
	mov r9, r7
	adds r5, r1, 0
	ldr r2, _08134950
	adds r2, r6
	mov r10, r2
	mov r8, r5
_081348F2:
	bl Random
	movs r1, 0xFF
	ands r1, r0
	lsls r0, r1, 2
	adds r0, r1
	lsrs r2, r0, 6
	ldr r3, _08134954
	adds r4, r6, r3
	mov r1, r9
	adds r0, r1, r4
	ldrh r1, [r0]
	subs r1, 0x1
	lsls r0, r1, 2
	adds r0, r1
	lsls r0, 1
	adds r0, r2, r0
	lsls r0, 16
	lsrs r2, r0, 16
	movs r1, 0
	ldrh r0, [r5]
	subs r0, 0x1
	cmp r1, r0
	bge _08134942
	mov r3, r10
	ldrb r0, [r3]
	cmp r0, r2
	beq _08134942
	subs r0, r4, 0x4
	adds r0, r7, r0
	ldrh r0, [r0]
	subs r3, r0, 0x1
	adds r4, 0xE
_08134934:
	adds r1, 0x1
	cmp r1, r3
	bge _08134942
	adds r0, r1, r4
	ldrb r0, [r0]
	cmp r0, r2
	bne _08134934
_08134942:
	mov r3, r8
	ldrh r0, [r3]
	subs r0, 0x1
	ldr r4, _08134958
	cmp r1, r0
	bne _081348F2
	b _081349B6
	.align 2, 0
_08134950: .4byte 0x0000056a
_08134954: .4byte 0x0000055c
_08134958: .4byte gSaveBlock2
_0813495C:
	movs r2, 0xAB
	lsls r2, 3
	adds r0, r5, r2
	adds r6, r7, r0
	ldr r3, _081349EC
	adds r3, r5
	mov r8, r3
	adds r5, r6, 0
_0813496C:
	bl Random
	movs r1, 0xFF
	ands r1, r0
	lsls r0, r1, 4
	subs r0, r1
	lsls r0, 1
	asrs r0, 8
	adds r0, 0x46
	lsls r0, 16
	lsrs r2, r0, 16
	movs r1, 0
	ldrh r0, [r6]
	subs r0, 0x1
	cmp r1, r0
	bge _081349AC
	mov r3, r8
	ldrb r0, [r3]
	ldr r4, _081349F0
	cmp r0, r2
	beq _081349AC
	ldrh r0, [r5]
	subs r3, r0, 0x1
	ldr r0, _081349EC
	adds r4, r0
_0813499E:
	adds r1, 0x1
	cmp r1, r3
	bge _081349AC
	adds r0, r1, r4
	ldrb r0, [r0]
	cmp r0, r2
	bne _0813499E
_081349AC:
	ldrh r0, [r6]
	subs r0, 0x1
	ldr r4, _081349F0
	cmp r1, r0
	bne _0813496C
_081349B6:
	ldr r1, _081349F4
	adds r0, r4, r1
	strb r2, [r0]
	ldr r2, _081349F4
	adds r5, r4, r2
	ldrb r0, [r5]
	bl sub_81349FC
	movs r3, 0xAB
	lsls r3, 3
	adds r0, r4, r3
	adds r1, r7, r0
	ldrh r0, [r1]
	cmp r0, 0x6
	bhi _081349DE
	adds r0, r4, r0
	ldr r1, _081349F8
	adds r0, r1
	ldrb r1, [r5]
_081349DC:
	strb r1, [r0]
_081349DE:
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_081349EC: .4byte 0x0000056a
_081349F0: .4byte gSaveBlock2
_081349F4: .4byte 0x00000564
_081349F8: .4byte 0x00000569
	thumb_func_end sub_81347F8

	thumb_func_start sub_81349FC
sub_81349FC: @ 81349FC
	push {lr}
	lsls r0, 24
	lsrs r2, r0, 24
	adds r1, r2, 0
	cmp r2, 0x63
	bhi _08134A18
	ldr r1, _08134A14
	lsls r0, r2, 1
	adds r0, r2
	lsls r0, 3
	b _08134A38
	.align 2, 0
_08134A14: .4byte gBattleTowerTrainers
_08134A18:
	cmp r1, 0xC7
	bhi _08134A34
	ldr r2, _08134A2C
	subs r1, 0x64
	movs r0, 0xA4
	muls r0, r1
	adds r0, r2
	ldr r1, _08134A30
	b _08134A38
	.align 2, 0
_08134A2C: .4byte gSaveBlock2
_08134A30: .4byte 0x0000014d
_08134A34:
	ldr r0, _08134A5C
	ldr r1, _08134A60
_08134A38:
	adds r0, r1
	ldrb r1, [r0]
	movs r2, 0
	ldr r3, _08134A64
	ldrb r0, [r3]
	cmp r0, r1
	beq _08134A54
_08134A46:
	adds r2, 0x1
	cmp r2, 0x1D
	bhi _08134A54
	adds r0, r2, r3
	ldrb r0, [r0]
	cmp r0, r1
	bne _08134A46
_08134A54:
	cmp r2, 0x1E
	beq _08134A6C
	ldr r0, _08134A68
	b _08134A8A
	.align 2, 0
_08134A5C: .4byte gSaveBlock2
_08134A60: .4byte 0x00000499
_08134A64: .4byte gUnknown_08405E60
_08134A68: .4byte gUnknown_08405E92
_08134A6C:
	movs r2, 0
	ldr r3, _08134A98
	ldrb r0, [r3]
	cmp r0, r1
	beq _08134A84
_08134A76:
	adds r2, 0x1
	cmp r2, 0x13
	bhi _08134A84
	adds r0, r2, r3
	ldrb r0, [r0]
	cmp r0, r1
	bne _08134A76
_08134A84:
	cmp r2, 0x14
	beq _08134AA4
	ldr r0, _08134A9C
_08134A8A:
	adds r0, r2, r0
	ldrb r1, [r0]
	ldr r0, _08134AA0
	bl VarSet
	b _08134AAC
	.align 2, 0
_08134A98: .4byte gUnknown_08405E7E
_08134A9C: .4byte gUnknown_08405EB0
_08134AA0: .4byte 0x00004010
_08134AA4:
	ldr r0, _08134AB0
	movs r1, 0x7
	bl VarSet
_08134AAC:
	pop {r0}
	bx r0
	.align 2, 0
_08134AB0: .4byte 0x00004010
	thumb_func_end sub_81349FC

	thumb_func_start sub_8134AB4
sub_8134AB4: @ 8134AB4
	push {lr}
	movs r0, 0xC8
	bl sub_81349FC
	pop {r0}
	bx r0
	thumb_func_end sub_8134AB4

	thumb_func_start sub_8134AC0
sub_8134AC0: @ 8134AC0
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	sub sp, 0x1C
	movs r7, 0
	mov r8, r0
	movs r5, 0
	ldr r0, _08134B3C
	mov r12, r0
	mov r1, r8
	ldrb r1, [r1, 0xC]
	str r1, [sp, 0x18]
	movs r2, 0xAA
	lsls r2, 1
	add r2, r12
	mov r10, r2
	mov r9, r5
_08134AE6:
	movs r6, 0
	movs r3, 0
	ldr r0, _08134B40
	add r0, r9
	ldrb r0, [r0]
	ldr r1, [sp, 0x18]
	cmp r0, r1
	bne _08134B14
	movs r0, 0xA4
	muls r0, r5
	ldr r1, _08134B40
	adds r2, r0, r1
	mov r4, r8
	adds r4, 0xC
_08134B02:
	adds r2, 0x1
	adds r3, 0x1
	cmp r3, 0x3
	bgt _08134B14
	adds r1, r4, r3
	ldrb r0, [r2]
	ldrb r1, [r1]
	cmp r0, r1
	beq _08134B02
_08134B14:
	cmp r3, 0x4
	bne _08134B54
	movs r6, 0
	mov r2, r10
	ldrb r0, [r2]
	mov r3, r8
	ldrb r3, [r3, 0x8]
	cmp r0, r3
	bne _08134B54
	adds r1, r0, 0
	movs r0, 0xA4
	muls r0, r5
	adds r0, 0x4
	ldr r3, _08134B44
	adds r2, r0, r3
_08134B32:
	cmp r1, 0xFF
	bne _08134B48
	movs r6, 0x7
	b _08134B54
	.align 2, 0
_08134B3C: .4byte gSaveBlock2
_08134B40: .4byte gSaveBlock2 + 0x158
_08134B44: .4byte gSaveBlock2 + 0x150
_08134B48:
	adds r6, 0x1
	cmp r6, 0x6
	bgt _08134B54
	ldrb r0, [r2]
	cmp r0, r1
	beq _08134B32
_08134B54:
	cmp r6, 0x7
	beq _08134B64
	movs r0, 0xA4
	add r10, r0
	add r9, r0
	adds r5, 0x1
	cmp r5, 0x4
	ble _08134AE6
_08134B64:
	cmp r5, 0x4
	bgt _08134B76
	movs r0, 0xA4
	muls r0, r5
	add r0, r12
	movs r1, 0xA6
	lsls r1, 1
	adds r0, r1
	b _08134B9E
_08134B76:
	movs r5, 0
	movs r1, 0xA7
	lsls r1, 1
	add r1, r12
	b _08134B88
_08134B80:
	adds r1, 0xA4
	adds r5, 0x1
	cmp r5, 0x4
	bgt _08134BA8
_08134B88:
	ldrh r0, [r1]
	cmp r0, 0
	bne _08134B80
	cmp r5, 0x4
	bgt _08134BA8
	movs r0, 0xA4
	muls r0, r5
	add r0, r12
	movs r2, 0xA6
	lsls r2, 1
	adds r0, r2
_08134B9E:
	mov r1, r8
	movs r2, 0xA4
	bl memcpy
	b _08134C5E
_08134BA8:
	mov r2, sp
	movs r3, 0xA7
	lsls r3, 1
	mov r1, r12
	adds r0, r1, r3
	ldrh r0, [r0]
	movs r1, 0
	strh r0, [r2]
	add r0, sp, 0xC
	strh r1, [r0]
	adds r7, 0x1
	movs r5, 0x1
	add r2, sp, 0xC
	mov r9, r2
	mov r10, r3
_08134BC6:
	movs r3, 0
	adds r0, r5, 0x1
	mov r12, r0
	cmp r3, r7
	bge _08134C0A
	movs r1, 0xA4
	adds r0, r5, 0
	muls r0, r1
	ldr r2, _08134BFC
	adds r0, r2
	mov r1, r10
	adds r4, r0, r1
	mov r6, sp
_08134BE0:
	lsls r0, r3, 1
	add r0, sp
	ldrh r2, [r4]
	adds r1, r2, 0
	ldrh r0, [r0]
	cmp r1, r0
	bcs _08134C00
	movs r3, 0
	movs r7, 0x1
	strh r2, [r6]
	mov r2, r9
	strh r5, [r2]
	b _08134C0A
	.align 2, 0
_08134BFC: .4byte gSaveBlock2
_08134C00:
	cmp r1, r0
	bhi _08134C0A
	adds r3, 0x1
	cmp r3, r7
	blt _08134BE0
_08134C0A:
	cmp r3, r7
	bne _08134C2A
	lsls r1, r7, 1
	mov r3, sp
	adds r2, r3, r1
	movs r3, 0xA4
	adds r0, r5, 0
	muls r0, r3
	ldr r3, _08134C70
	adds r0, r3
	add r0, r10
	ldrh r0, [r0]
	strh r0, [r2]
	add r1, r9
	strh r5, [r1]
	adds r7, 0x1
_08134C2A:
	mov r5, r12
	cmp r5, 0x4
	ble _08134BC6
	bl Random
	lsls r0, 16
	lsrs r0, 16
	adds r1, r7, 0
	bl __modsi3
	adds r5, r0, 0
	ldr r2, _08134C70
	lsls r0, r5, 1
	add r0, sp
	adds r0, 0xC
	ldrh r1, [r0]
	movs r0, 0xA4
	muls r0, r1
	adds r0, r2
	movs r1, 0xA6
	lsls r1, 1
	adds r0, r1
	mov r1, r8
	movs r2, 0xA4
	bl memcpy
_08134C5E:
	add sp, 0x1C
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_08134C70: .4byte gSaveBlock2
	thumb_func_end sub_8134AC0

	thumb_func_start get_trainer_class_pic_index
get_trainer_class_pic_index: @ 8134C74
	push {lr}
	ldr r3, _08134C90
	ldr r0, _08134C94
	adds r1, r3, r0
	ldrb r0, [r1]
	cmp r0, 0xC8
	bne _08134CA0
	ldr r1, _08134C98
	ldr r2, _08134C9C
	adds r0, r3, r2
	ldrb r0, [r0]
	adds r0, r1
	b _08134CD2
	.align 2, 0
_08134C90: .4byte gSaveBlock2
_08134C94: .4byte 0x00000564
_08134C98: .4byte gTrainerClassToPicIndex
_08134C9C: .4byte 0x00000499
_08134CA0:
	cmp r0, 0x63
	bls _08134CC0
	ldr r2, _08134CBC
	ldrb r0, [r1]
	subs r0, 0x64
	movs r1, 0xA4
	muls r0, r1
	adds r0, r3
	adds r1, 0xA9
	adds r0, r1
	ldrb r0, [r0]
	adds r0, r2
	b _08134CD2
	.align 2, 0
_08134CBC: .4byte gTrainerClassToPicIndex
_08134CC0:
	ldr r3, _08134CD8
	ldr r2, _08134CDC
	ldrb r1, [r1]
	lsls r0, r1, 1
	adds r0, r1
	lsls r0, 3
	adds r0, r2
	ldrb r0, [r0]
	adds r0, r3
_08134CD2:
	ldrb r0, [r0]
	pop {r1}
	bx r1
	.align 2, 0
_08134CD8: .4byte gTrainerClassToPicIndex
_08134CDC: .4byte gBattleTowerTrainers
	thumb_func_end get_trainer_class_pic_index

	thumb_func_start get_trainer_class_name_index
get_trainer_class_name_index: @ 8134CE0
	push {lr}
	ldr r3, _08134CFC
	ldr r0, _08134D00
	adds r1, r3, r0
	ldrb r0, [r1]
	cmp r0, 0xC8
	bne _08134D0C
	ldr r1, _08134D04
	ldr r2, _08134D08
	adds r0, r3, r2
	ldrb r0, [r0]
	adds r0, r1
	b _08134D40
	.align 2, 0
_08134CFC: .4byte gSaveBlock2
_08134D00: .4byte 0x00000564
_08134D04: .4byte gTrainerClassToNameIndex
_08134D08: .4byte 0x00000499
_08134D0C:
	cmp r0, 0x63
	bhi _08134D2C
	ldr r3, _08134D24
	ldr r2, _08134D28
	ldrb r1, [r1]
	lsls r0, r1, 1
	adds r0, r1
	lsls r0, 3
	adds r0, r2
	ldrb r0, [r0]
	adds r0, r3
	b _08134D40
	.align 2, 0
_08134D24: .4byte gTrainerClassToNameIndex
_08134D28: .4byte gBattleTowerTrainers
_08134D2C:
	ldr r2, _08134D48
	ldrb r0, [r1]
	subs r0, 0x64
	movs r1, 0xA4
	muls r0, r1
	adds r0, r3
	adds r1, 0xA9
	adds r0, r1
	ldrb r0, [r0]
	adds r0, r2
_08134D40:
	ldrb r0, [r0]
	pop {r1}
	bx r1
	.align 2, 0
_08134D48: .4byte gTrainerClassToNameIndex
	thumb_func_end get_trainer_class_name_index

	thumb_func_start get_trainer_name
get_trainer_name: @ 8134D4C
	push {r4,r5,lr}
	adds r4, r0, 0
	ldr r2, _08134D74
	ldr r0, _08134D78
	adds r1, r2, r0
	ldrb r0, [r1]
	cmp r0, 0xC8
	bne _08134D80
	movs r3, 0
	ldr r5, _08134D7C
	adds r2, r5
_08134D62:
	adds r0, r4, r3
	adds r1, r3, r2
	ldrb r1, [r1]
	strb r1, [r0]
	adds r3, 0x1
	cmp r3, 0x6
	ble _08134D62
	b _08134DC8
	.align 2, 0
_08134D74: .4byte gSaveBlock2
_08134D78: .4byte 0x00000564
_08134D7C: .4byte 0x0000049c
_08134D80:
	cmp r0, 0x63
	bhi _08134DA8
	movs r3, 0
	ldr r2, _08134DA4
	ldrb r1, [r1]
	lsls r0, r1, 1
	adds r0, r1
	lsls r0, 3
	adds r2, 0x1
	adds r2, r0, r2
_08134D94:
	adds r1, r4, r3
	ldrb r0, [r2]
	strb r0, [r1]
	adds r2, 0x1
	adds r3, 0x1
	cmp r3, 0x6
	ble _08134D94
	b _08134DC8
	.align 2, 0
_08134DA4: .4byte gBattleTowerTrainers
_08134DA8:
	movs r3, 0
	ldrb r0, [r1]
	subs r0, 0x64
	movs r1, 0xA4
	muls r1, r0
	movs r5, 0xA8
	lsls r5, 1
	adds r0, r2, r5
	adds r2, r1, r0
_08134DBA:
	adds r1, r4, r3
	ldrb r0, [r2]
	strb r0, [r1]
	adds r2, 0x1
	adds r3, 0x1
	cmp r3, 0x6
	ble _08134DBA
_08134DC8:
	adds r1, r4, r3
	movs r0, 0xFF
	strb r0, [r1]
	pop {r4,r5}
	pop {r0}
	bx r0
	thumb_func_end get_trainer_name

	thumb_func_start sub_8134DD4
sub_8134DD4: @ 8134DD4
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	sub sp, 0x28
	movs r0, 0
	str r0, [sp, 0x18]
	movs r1, 0x3C
	str r1, [sp, 0x1C]
	add r4, sp, 0xC
	movs r0, 0xFF
	strb r0, [r4]
	bl ZeroEnemyPartyMons
	ldr r1, _08134E04
	ldr r2, _08134E08
	adds r0, r1, r2
	ldrb r0, [r0]
	cmp r0, 0x13
	bhi _08134E0C
	movs r3, 0x6
	str r3, [sp, 0x14]
	b _08134ED8
	.align 2, 0
_08134E04: .4byte gSaveBlock2
_08134E08: .4byte 0x00000564
_08134E0C:
	cmp r0, 0x1D
	bhi _08134E1A
	movs r0, 0x9
	str r0, [sp, 0x14]
	movs r1, 0x1E
	str r1, [sp, 0x18]
	b _08134ED8
_08134E1A:
	cmp r0, 0x27
	bhi _08134E28
	movs r2, 0xC
	str r2, [sp, 0x14]
	movs r3, 0x3C
	str r3, [sp, 0x18]
	b _08134ED8
_08134E28:
	cmp r0, 0x31
	bhi _08134E36
	movs r0, 0xF
	str r0, [sp, 0x14]
	movs r1, 0x5A
	str r1, [sp, 0x18]
	b _08134ED8
_08134E36:
	cmp r0, 0x3B
	bhi _08134E44
	movs r2, 0x12
	str r2, [sp, 0x14]
	movs r3, 0x78
	str r3, [sp, 0x18]
	b _08134ED8
_08134E44:
	cmp r0, 0x45
	bhi _08134E52
	movs r0, 0x15
	str r0, [sp, 0x14]
	movs r1, 0x96
	str r1, [sp, 0x18]
	b _08134ED8
_08134E52:
	cmp r0, 0x4F
	bhi _08134E60
	movs r2, 0x1F
	str r2, [sp, 0x14]
	movs r3, 0xB4
	str r3, [sp, 0x18]
	b _08134ED8
_08134E60:
	cmp r0, 0x63
	bhi _08134E72
	movs r0, 0x1F
	str r0, [sp, 0x14]
	movs r1, 0xC8
	str r1, [sp, 0x18]
	movs r2, 0x64
	str r2, [sp, 0x1C]
	b _08134ED8
_08134E72:
	cmp r0, 0xC8
	bne _08134E9C
	movs r6, 0
_08134E78:
	movs r0, 0x64
	muls r0, r6
	ldr r1, _08134E94
	adds r0, r1
	movs r1, 0x2C
	muls r1, r6
	ldr r2, _08134E98
	adds r1, r2
	bl sub_803ADE8
	adds r6, 0x1
	cmp r6, 0x2
	ble _08134E78
	b _08135082
	.align 2, 0
_08134E94: .4byte gEnemyParty
_08134E98: .4byte gSaveBlock2 + 0x4CC
_08134E9C:
	movs r6, 0
	adds r4, r1, 0
	ldr r3, _08134ECC
	adds r5, r4, r3
_08134EA4:
	movs r0, 0x64
	muls r0, r6
	ldr r1, _08134ED0
	adds r0, r1
	ldr r2, _08134ED4
	adds r1, r4, r2
	ldrb r2, [r1]
	movs r1, 0xA4
	muls r1, r2
	adds r1, r5
	movs r2, 0x2C
	muls r2, r6
	adds r1, r2
	bl sub_803ADE8
	adds r6, 0x1
	cmp r6, 0x2
	ble _08134EA4
	b _08135082
	.align 2, 0
_08134ECC: .4byte 0xffffc158
_08134ED0: .4byte gEnemyParty
_08134ED4: .4byte 0x00000564
_08134ED8:
	ldr r2, _08134EF4
	ldr r3, _08134EF8
	adds r0, r2, r3
	ldrb r1, [r0]
	movs r0, 0x1
	ands r0, r1
	adds r1, r2, 0
	cmp r0, 0
	beq _08134F00
	ldr r0, _08134EFC
	mov r10, r0
	movs r2, 0x64
	str r2, [sp, 0x10]
	b _08134F08
	.align 2, 0
_08134EF4: .4byte gSaveBlock2
_08134EF8: .4byte 0x00000554
_08134EFC: .4byte gBattleTowerLevel100Mons
_08134F00:
	ldr r3, _08134F54
	mov r10, r3
	movs r0, 0x32
	str r0, [sp, 0x10]
_08134F08:
	ldr r2, _08134F58
	ldr r3, _08134F5C
	adds r0, r1, r3
	ldrb r1, [r0]
	lsls r0, r1, 1
	adds r0, r1
	lsls r0, 3
	adds r0, r2
	ldrb r0, [r0, 0x9]
	str r0, [sp, 0x20]
	movs r6, 0
_08134F1E:
	bl Random
	movs r1, 0xFF
	ands r1, r0
	ldr r2, [sp, 0x1C]
	adds r0, r1, 0
	muls r0, r2
	asrs r0, 8
	ldr r3, [sp, 0x18]
	adds r7, r0, r3
	ldr r0, [sp, 0x20]
	cmp r0, 0
	beq _08134F48
	lsls r0, r7, 4
	add r0, r10
	ldrb r0, [r0, 0x3]
	ldr r1, [sp, 0x20]
	ands r0, r1
	cmp r0, r1
	beq _08134F48
	b _0813507C
_08134F48:
	movs r5, 0
	lsls r0, r7, 4
	mov r2, r10
	adds r3, r0, r2
	movs r4, 0
	b _08134F64
	.align 2, 0
_08134F54: .4byte gBattleTowerLevel50Mons
_08134F58: .4byte gBattleTowerTrainers
_08134F5C: .4byte 0x00000564
_08134F60:
	adds r4, 0x64
	adds r5, 0x1
_08134F64:
	cmp r5, r6
	bge _08134F7E
	ldr r1, _08135094
	adds r0, r4, r1
	movs r1, 0xB
	movs r2, 0
	str r3, [sp, 0x24]
	bl GetMonData
	ldr r3, [sp, 0x24]
	ldrh r2, [r3]
	cmp r0, r2
	bne _08134F60
_08134F7E:
	cmp r5, r6
	bne _0813507C
	movs r5, 0
	cmp r5, r6
	bge _08134FCC
	ldr r3, _08135098
	mov r9, r3
	lsls r0, r7, 4
	add r0, r10
	mov r8, r0
	movs r3, 0
_08134F94:
	ldr r0, _08135094
	adds r4, r3, r0
	adds r0, r4, 0
	movs r1, 0xC
	movs r2, 0
	str r3, [sp, 0x24]
	bl GetMonData
	ldr r3, [sp, 0x24]
	cmp r0, 0
	beq _08134FC4
	adds r0, r4, 0
	movs r1, 0xC
	movs r2, 0
	bl GetMonData
	mov r2, r8
	ldrb r1, [r2, 0x2]
	lsls r1, 1
	add r1, r9
	ldr r3, [sp, 0x24]
	ldrh r1, [r1]
	cmp r0, r1
	beq _08134FCC
_08134FC4:
	adds r3, 0x64
	adds r5, 0x1
	cmp r5, r6
	blt _08134F94
_08134FCC:
	cmp r5, r6
	bne _0813507C
	movs r5, 0
	cmp r5, r6
	bge _08134FEE
	add r0, sp, 0x4
	ldrh r0, [r0]
	cmp r0, r7
	beq _08134FEE
	add r1, sp, 0x4
_08134FE0:
	adds r1, 0x2
	adds r5, 0x1
	cmp r5, r6
	bge _08134FEE
	ldrh r0, [r1]
	cmp r0, r7
	bne _08134FE0
_08134FEE:
	cmp r5, r6
	bne _0813507C
	lsls r0, r6, 1
	add r0, sp
	adds r0, 0x4
	strh r7, [r0]
	movs r3, 0x64
	adds r0, r6, 0
	muls r0, r3
	ldr r1, _08135094
	adds r0, r1
	lsls r4, r7, 4
	mov r3, r10
	adds r2, r4, r3
	ldrh r1, [r2]
	ldrb r2, [r2, 0xC]
	str r2, [sp]
	ldr r2, [sp, 0x10]
	ldr r3, [sp, 0x14]
	bl CreateMonWithEVSpread
	movs r5, 0
	adds r0, r6, 0x1
	mov r9, r0
	mov r8, r4
	movs r0, 0x64
	adds r7, r6, 0
	muls r7, r0
	mov r0, r10
	adds r0, 0x4
	adds r4, r0
	ldr r3, _08135094
_0813502E:
	ldrh r1, [r4]
	lsls r2, r5, 24
	lsrs r2, 24
	adds r0, r7, r3
	str r3, [sp, 0x24]
	bl SetMonMoveSlot
	ldrh r0, [r4]
	ldr r3, [sp, 0x24]
	cmp r0, 0xDA
	bne _0813504A
	movs r0, 0
	mov r1, sp
	strb r0, [r1, 0xC]
_0813504A:
	adds r4, 0x2
	adds r5, 0x1
	cmp r5, 0x3
	ble _0813502E
	movs r2, 0x64
	adds r4, r6, 0
	muls r4, r2
	ldr r3, _08135094
	adds r4, r3
	adds r0, r4, 0
	movs r1, 0x20
	add r2, sp, 0xC
	bl SetMonData
	mov r0, r8
	add r0, r10
	ldrb r2, [r0, 0x2]
	lsls r2, 1
	ldr r0, _08135098
	adds r2, r0
	adds r0, r4, 0
	movs r1, 0xC
	bl SetMonData
	mov r6, r9
_0813507C:
	cmp r6, 0x3
	beq _08135082
	b _08134F1E
_08135082:
	add sp, 0x28
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_08135094: .4byte gEnemyParty
_08135098: .4byte gBattleTowerHeldItems
	thumb_func_end sub_8134DD4

	thumb_func_start sub_813509C
sub_813509C: @ 813509C
	push {r4-r6,lr}
	movs r5, 0
	ldr r2, _081350D8
	ldrh r0, [r2]
	ldr r1, _081350DC
	cmp r0, r1
	beq _081350CE
	adds r6, r1, 0
	adds r4, r2, 0
_081350AE:
	ldrh r0, [r4]
	bl SpeciesToNationalPokedexNum
	lsls r0, 16
	lsrs r0, 16
	movs r1, 0x1
	bl sub_8090D90
	lsls r0, 24
	cmp r0, 0
	beq _081350C6
	adds r5, 0x1
_081350C6:
	adds r4, 0x2
	ldrh r0, [r4]
	cmp r0, r6
	bne _081350AE
_081350CE:
	adds r0, r5, 0
	pop {r4-r6}
	pop {r1}
	bx r1
	.align 2, 0
_081350D8: .4byte gBattleTowerBanlist
_081350DC: .4byte 0x0000ffff
	thumb_func_end sub_813509C

	thumb_func_start sub_81350E0
sub_81350E0: @ 81350E0
	push {r4-r6,lr}
	adds r5, r2, 0
	lsls r0, 16
	lsrs r6, r0, 16
	lsls r1, 24
	lsrs r4, r1, 24
	adds r0, r6, 0
	bl SpeciesToNationalPokedexNum
	lsls r0, 16
	lsrs r0, 16
	movs r1, 0x1
	bl sub_8090D90
	lsls r0, 24
	cmp r0, 0
	beq _081351E6
	adds r0, r4, 0x1
	lsls r0, 24
	lsrs r4, r0, 24
	subs r0, r4, 0x1
	cmp r0, 0xA
	bhi _081351B0
	lsls r0, 2
	ldr r1, _08135118
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_08135118: .4byte _0813511C
	.align 2, 0
_0813511C:
	.4byte _08135148
	.4byte _08135178
	.4byte _08135148
	.4byte _081351B0
	.4byte _08135148
	.4byte _081351B0
	.4byte _08135148
	.4byte _081351B0
	.4byte _08135148
	.4byte _081351B0
	.4byte _08135148
_08135148:
	cmp r5, r4
	bne _08135160
	ldr r0, _08135158
	ldr r1, _0813515C
	bl StringAppend
	b _081351D8
	.align 2, 0
_08135158: .4byte gStringVar1
_0813515C: .4byte gUnknown_08400E23
_08135160:
	cmp r5, r4
	ble _081351D8
	ldr r0, _08135170
	ldr r1, _08135174
	bl StringAppend
	b _081351D8
	.align 2, 0
_08135170: .4byte gStringVar1
_08135174: .4byte gUnknown_08400E29
_08135178:
	cmp r4, r5
	bne _08135190
	ldr r0, _08135188
	ldr r1, _0813518C
	bl StringAppend
	b _08135198
	.align 2, 0
_08135188: .4byte gStringVar1
_0813518C: .4byte gUnknown_08400E23
_08135190:
	ldr r0, _081351A4
	ldr r1, _081351A8
	bl StringAppend
_08135198:
	ldr r0, _081351A4
	ldr r1, _081351AC
	bl StringAppend
	b _081351D8
	.align 2, 0
_081351A4: .4byte gStringVar1
_081351A8: .4byte gUnknown_08400E29
_081351AC: .4byte gUnknown_08400E30
_081351B0:
	cmp r4, r5
	bne _081351C8
	ldr r0, _081351C0
	ldr r1, _081351C4
	bl StringAppend
	b _081351D0
	.align 2, 0
_081351C0: .4byte gStringVar1
_081351C4: .4byte gUnknown_08400E23
_081351C8:
	ldr r0, _081351F0
	ldr r1, _081351F4
	bl StringAppend
_081351D0:
	ldr r0, _081351F0
	ldr r1, _081351F8
	bl StringAppend
_081351D8:
	ldr r0, _081351F0
	movs r1, 0xB
	muls r1, r6
	ldr r2, _081351FC
	adds r1, r2
	bl StringAppend
_081351E6:
	adds r0, r4, 0
	pop {r4-r6}
	pop {r1}
	bx r1
	.align 2, 0
_081351F0: .4byte gStringVar1
_081351F4: .4byte gUnknown_08400E29
_081351F8: .4byte gUnknown_08400E2E
_081351FC: .4byte gSpeciesNames
	thumb_func_end sub_81350E0

	thumb_func_start sub_8135200
sub_8135200: @ 8135200
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	ldr r2, [sp, 0x20]
	ldr r4, [sp, 0x24]
	mov r9, r4
	ldr r4, [sp, 0x28]
	mov r10, r4
	ldr r7, [sp, 0x2C]
	lsls r0, 16
	lsrs r4, r0, 16
	lsls r1, 16
	lsrs r6, r1, 16
	lsls r3, 24
	lsrs r3, 24
	mov r12, r3
	lsls r2, 24
	lsrs r2, 24
	mov r8, r2
	movs r2, 0
	movs r0, 0xCE
	lsls r0, 1
	cmp r4, r0
	beq _081352CE
	cmp r4, 0
	beq _081352CE
	ldr r0, _081352DC
	ldrh r1, [r0]
	ldr r5, _081352E0
	adds r3, r0, 0
	cmp r1, r5
	beq _08135264
	cmp r1, r4
	beq _08135258
	adds r1, r3, 0
_0813524A:
	adds r1, 0x2
	adds r2, 0x1
	ldrh r0, [r1]
	cmp r0, r5
	beq _08135264
	cmp r0, r4
	bne _0813524A
_08135258:
	lsls r0, r2, 1
	adds r0, r3
	ldrh r1, [r0]
	ldr r0, _081352E0
	cmp r1, r0
	bne _081352CE
_08135264:
	mov r0, r12
	cmp r0, 0
	bne _08135270
	mov r1, r8
	cmp r1, 0x32
	bhi _081352CE
_08135270:
	movs r2, 0
	ldrb r3, [r7]
	cmp r2, r3
	bge _08135290
	mov r1, r9
	ldrh r0, [r1]
	cmp r0, r4
	beq _08135290
	adds r5, r3, 0
_08135282:
	adds r1, 0x2
	adds r2, 0x1
	cmp r2, r5
	bge _08135290
	ldrh r0, [r1]
	cmp r0, r4
	bne _08135282
_08135290:
	cmp r2, r3
	bne _081352CE
	cmp r6, 0
	beq _081352BA
	movs r2, 0
	cmp r2, r3
	bge _081352B6
	mov r1, r10
	ldrh r0, [r1]
	cmp r0, r6
	beq _081352B6
	adds r5, r3, 0
_081352A8:
	adds r1, 0x2
	adds r2, 0x1
	cmp r2, r5
	bge _081352B6
	ldrh r0, [r1]
	cmp r0, r6
	bne _081352A8
_081352B6:
	cmp r2, r3
	bne _081352CE
_081352BA:
	lsls r0, r3, 1
	add r0, r9
	strh r4, [r0]
	ldrb r0, [r7]
	lsls r0, 1
	add r0, r10
	strh r6, [r0]
	ldrb r0, [r7]
	adds r0, 0x1
	strb r0, [r7]
_081352CE:
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_081352DC: .4byte gBattleTowerBanlist
_081352E0: .4byte 0x0000ffff
	thumb_func_end sub_8135200

	thumb_func_start sub_81352E4
sub_81352E4: @ 81352E4
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	sub sp, 0x2C
	add r1, sp, 0x28
	movs r0, 0
	strb r0, [r1]
	movs r7, 0
	mov r9, r1
	add r0, sp, 0x1C
	mov r10, r0
_081352FE:
	movs r0, 0x64
	adds r5, r7, 0
	muls r5, r0
	ldr r0, _081353C4
	adds r5, r0
	adds r0, r5, 0
	movs r1, 0x41
	bl GetMonData
	mov r8, r0
	mov r1, r8
	lsls r1, 16
	lsrs r1, 16
	mov r8, r1
	adds r0, r5, 0
	movs r1, 0xC
	bl GetMonData
	adds r6, r0, 0
	lsls r6, 16
	lsrs r6, 16
	adds r0, r5, 0
	movs r1, 0x38
	bl GetMonData
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	adds r0, r5, 0
	movs r1, 0x39
	bl GetMonData
	adds r2, r0, 0
	lsls r2, 16
	lsrs r2, 16
	ldr r5, _081353C8
	ldrb r3, [r5]
	str r4, [sp]
	add r0, sp, 0x10
	str r0, [sp, 0x4]
	mov r1, r10
	str r1, [sp, 0x8]
	mov r0, r9
	str r0, [sp, 0xC]
	mov r0, r8
	adds r1, r6, 0
	bl sub_8135200
	adds r7, 0x1
	cmp r7, 0x5
	ble _081352FE
	mov r1, r9
	ldrb r0, [r1]
	cmp r0, 0x2
	bhi _08135420
	ldr r1, _081353CC
	movs r0, 0xFF
	strb r0, [r1]
	ldr r1, _081353D0
	movs r0, 0x1
	strh r0, [r1]
	movs r0, 0
	mov r1, r9
	strb r0, [r1]
	bl sub_813509C
	adds r6, r0, 0
	ldr r2, _081353D4
	ldrh r0, [r2]
	ldr r1, _081353D8
	cmp r0, r1
	beq _081353A8
	mov r5, r9
	adds r7, r1, 0
	adds r4, r2, 0
_08135394:
	ldrh r0, [r4]
	ldrb r1, [r5]
	adds r2, r6, 0
	bl sub_81350E0
	strb r0, [r5]
	adds r4, 0x2
	ldrh r0, [r4]
	cmp r0, r7
	bne _08135394
_081353A8:
	mov r0, r9
	ldrb r1, [r0]
	cmp r1, 0
	bne _081353E4
	ldr r4, _081353CC
	ldr r1, _081353DC
	adds r0, r4, 0
	bl StringAppend
	ldr r1, _081353E0
	adds r0, r4, 0
	bl StringAppend
	b _0813543E
	.align 2, 0
_081353C4: .4byte gPlayerParty
_081353C8: .4byte gScriptResult
_081353CC: .4byte gStringVar1
_081353D0: .4byte gUnknown_0202E8CC
_081353D4: .4byte gBattleTowerBanlist
_081353D8: .4byte 0x0000ffff
_081353DC: .4byte gUnknown_08400E2C
_081353E0: .4byte gUnknown_08400E32
_081353E4:
	movs r0, 0x1
	ands r0, r1
	cmp r0, 0
	beq _08135400
	ldr r0, _081353F8
	ldr r1, _081353FC
	bl StringAppend
	b _08135408
	.align 2, 0
_081353F8: .4byte gStringVar1
_081353FC: .4byte gUnknown_08400E2E
_08135400:
	ldr r0, _08135414
	ldr r1, _08135418
	bl StringAppend
_08135408:
	ldr r0, _08135414
	ldr r1, _0813541C
	bl StringAppend
	b _0813543E
	.align 2, 0
_08135414: .4byte gStringVar1
_08135418: .4byte gUnknown_08400E2C
_0813541C: .4byte gUnknown_08400E36
_08135420:
	ldr r1, _08135450
	movs r0, 0
	strh r0, [r1]
	ldr r2, _08135454
	ldrb r0, [r5]
	ldr r1, _08135458
	adds r2, r1
	movs r1, 0x1
	ands r1, r0
	ldrb r3, [r2]
	movs r0, 0x2
	negs r0, r0
	ands r0, r3
	orrs r0, r1
	strb r0, [r2]
_0813543E:
	add sp, 0x2C
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_08135450: .4byte gUnknown_0202E8CC
_08135454: .4byte gSaveBlock2
_08135458: .4byte 0x00000554
	thumb_func_end sub_81352E4

	thumb_func_start sub_813545C
sub_813545C: @ 813545C
	push {lr}
	adds r1, r0, 0
	ldr r0, _08135470
	movs r2, 0x2
	movs r3, 0x3
	bl sub_80EB544
	pop {r0}
	bx r0
	.align 2, 0
_08135470: .4byte gStringVar4
	thumb_func_end sub_813545C

	thumb_func_start sub_8135474
sub_8135474: @ 8135474
	push {lr}
	ldr r2, _08135490
	ldr r0, _08135494
	adds r1, r2, r0
	ldrb r0, [r1]
	cmp r0, 0xC8
	bne _08135498
	movs r1, 0x95
	lsls r1, 3
	adds r0, r2, r1
	bl sub_813545C
	b _081354C4
	.align 2, 0
_08135490: .4byte gSaveBlock2
_08135494: .4byte 0x00000564
_08135498:
	cmp r0, 0x63
	bhi _081354B4
	ldrb r1, [r1]
	lsls r0, r1, 1
	adds r0, r1
	lsls r0, 3
	ldr r1, _081354B0
	adds r0, r1
	bl sub_813545C
	b _081354C4
	.align 2, 0
_081354B0: .4byte gBattleTowerTrainers + 0xC
_081354B4:
	ldrb r1, [r1]
	movs r0, 0xA4
	muls r0, r1
	ldr r3, _081354C8
	adds r1, r2, r3
	adds r0, r1
	bl sub_813545C
_081354C4:
	pop {r0}
	bx r0
	.align 2, 0
_081354C8: .4byte 0xffffc14c
	thumb_func_end sub_8135474

	thumb_func_start sub_81354CC
sub_81354CC: @ 81354CC
	push {r4,r5,lr}
	sub sp, 0x4
	ldr r0, _081354E4
	ldrh r0, [r0]
	cmp r0, 0x1
	beq _081354E8
	cmp r0, 0x1
	ble _08135520
	cmp r0, 0x2
	beq _0813551C
	b _08135520
	.align 2, 0
_081354E4: .4byte gUnknown_0202E8CC
_081354E8:
	movs r5, 0
_081354EA:
	movs r0, 0x64
	adds r4, r5, 0
	muls r4, r0
	ldr r0, _08135514
	adds r0, r4, r0
	movs r1, 0xC
	bl GetMonData
	mov r1, sp
	strh r0, [r1]
	ldr r0, _08135518
	adds r4, r0
	adds r0, r4, 0
	movs r1, 0xC
	mov r2, sp
	bl SetMonData
	adds r5, 0x1
	cmp r5, 0x5
	ble _081354EA
	b _08135520
	.align 2, 0
_08135514: .4byte gSaveBlock1 + 0x238
_08135518: .4byte gPlayerParty
_0813551C:
	bl sub_81360D0
_08135520:
	ldr r0, _08135530
	bl SetMainCallback2
	add sp, 0x4
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_08135530: .4byte c2_exit_to_overworld_1_continue_scripts_restart_music
	thumb_func_end sub_81354CC

	thumb_func_start sub_8135534
sub_8135534: @ 8135534
	push {r4,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	bl sub_811AAE8
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _08135558
	ldr r0, _08135560
	ldr r1, _08135564
	str r1, [r0, 0x8]
	ldr r0, _08135568
	bl SetMainCallback2
	adds r0, r4, 0
	bl DestroyTask
_08135558:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08135560: .4byte gMain
_08135564: .4byte sub_81354CC
_08135568: .4byte sub_800E7C4
	thumb_func_end sub_8135534

	thumb_func_start sub_813556C
sub_813556C: @ 813556C
	push {r4,r5,lr}
	sub sp, 0x4
	ldr r0, _08135584
	ldrh r2, [r0]
	cmp r2, 0x1
	beq _081355AC
	cmp r2, 0x1
	bgt _08135588
	cmp r2, 0
	beq _0813558E
	b _08135648
	.align 2, 0
_08135584: .4byte gUnknown_0202E8CC
_08135588:
	cmp r2, 0x2
	beq _08135600
	b _08135648
_0813558E:
	ldr r1, _081355A4
	movs r3, 0x84
	lsls r3, 1
	adds r0, r3, 0
	strh r0, [r1]
	ldr r0, _081355A8
	strh r2, [r0]
	bl sub_8134DD4
	b _081355D6
	.align 2, 0
_081355A4: .4byte gUnknown_020239F8
_081355A8: .4byte word_202FF5E
_081355AC:
	movs r5, 0
_081355AE:
	movs r0, 0x64
	adds r4, r5, 0
	muls r4, r0
	ldr r0, _081355F4
	adds r0, r4, r0
	movs r1, 0xC
	bl GetMonData
	mov r1, sp
	strh r0, [r1]
	ldr r0, _081355F8
	adds r4, r0
	adds r0, r4, 0
	movs r1, 0xC
	mov r2, sp
	bl SetMonData
	adds r5, 0x1
	cmp r5, 0x5
	ble _081355AE
_081355D6:
	ldr r0, _081355FC
	movs r1, 0x1
	bl CreateTask
	movs r0, 0
	bl current_map_music_set__default_for_battle
	bl sub_8082138
	lsls r0, 24
	lsrs r0, 24
	bl sub_811AABC
	b _08135648
	.align 2, 0
_081355F4: .4byte gPlayerParty
_081355F8: .4byte gSaveBlock1 + 0x238
_081355FC: .4byte sub_8135534
_08135600:
	bl ZeroEnemyPartyMons
	movs r5, 0
_08135606:
	movs r0, 0x64
	muls r0, r5
	ldr r1, _08135650
	adds r0, r1
	movs r1, 0x2C
	muls r1, r5
	ldr r2, _08135654
	adds r1, r2
	bl sub_803ADE8
	adds r5, 0x1
	cmp r5, 0x2
	ble _08135606
	ldr r1, _08135658
	ldr r2, _0813565C
	adds r0, r2, 0
	strh r0, [r1]
	ldr r1, _08135660
	movs r0, 0
	strh r0, [r1]
	ldr r0, _08135664
	movs r1, 0x1
	bl CreateTask
	movs r0, 0
	bl current_map_music_set__default_for_battle
	bl sub_8082138
	lsls r0, 24
	lsrs r0, 24
	bl sub_811AABC
_08135648:
	add sp, 0x4
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_08135650: .4byte gEnemyParty
_08135654: .4byte gSaveBlock2 + 0x4CC
_08135658: .4byte gUnknown_020239F8
_0813565C: .4byte 0x00000808
_08135660: .4byte word_202FF5E
_08135664: .4byte sub_8135534
	thumb_func_end sub_813556C

	thumb_func_start sub_8135668
sub_8135668: @ 8135668
	push {r4,r5,lr}
	ldr r1, _0813568C
	ldr r2, _08135690
	adds r0, r1, r2
	ldrb r0, [r0]
	lsls r0, 31
	lsrs r4, r0, 31
	ldr r0, _08135694
	ldrh r0, [r0]
	adds r5, r1, 0
	cmp r0, 0xE
	bls _08135682
	b _0813589A
_08135682:
	lsls r0, 2
	ldr r1, _08135698
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_0813568C: .4byte gSaveBlock2
_08135690: .4byte 0x00000554
_08135694: .4byte gUnknown_0202E8CC
_08135698: .4byte _0813569C
	.align 2, 0
_0813569C:
	.4byte _081356D8
	.4byte _08135700
	.4byte _0813571C
	.4byte _08135726
	.4byte _08135740
	.4byte _08135754
	.4byte _08135774
	.4byte _081357D0
	.4byte _081357FC
	.4byte _0813589A
	.4byte _08135820
	.4byte _08135834
	.4byte _0813584C
	.4byte _0813586C
	.4byte _08135888
_081356D8:
	ldr r0, _081356F0
	ldr r3, _081356F4
	adds r1, r5, r3
	adds r1, r4, r1
	ldrb r2, [r1]
	ldr r3, _081356F8
	adds r0, r3
	strb r2, [r0]
	ldr r0, _081356FC
	ldrh r0, [r0]
	b _08135898
	.align 2, 0
_081356F0: .4byte 0x02000000
_081356F4: .4byte 0x00000556
_081356F8: .4byte 0x000160fb
_081356FC: .4byte gUnknown_0202E8CE
_08135700:
	ldr r0, _08135714
	ldrb r0, [r0]
	ldr r1, _08135718
	adds r3, r5, r1
	movs r1, 0x1
	ands r1, r0
	ldrb r2, [r3]
	movs r0, 0x2
	negs r0, r0
	b _08135810
	.align 2, 0
_08135714: .4byte gUnknown_0202E8CE
_08135718: .4byte 0x00000554
_0813571C:
	lsls r1, r4, 1
	movs r2, 0xAB
	lsls r2, 3
	adds r0, r5, r2
	b _0813572C
_08135726:
	lsls r1, r4, 1
	ldr r3, _08135738
	adds r0, r5, r3
_0813572C:
	adds r1, r0
	ldr r0, _0813573C
	ldrh r0, [r0]
	strh r0, [r1]
	b _0813589A
	.align 2, 0
_08135738: .4byte 0x0000055c
_0813573C: .4byte gUnknown_0202E8CE
_08135740:
	ldr r0, _0813574C
	ldrh r1, [r0]
	ldr r2, _08135750
	adds r0, r5, r2
	strb r1, [r0]
	b _0813589A
	.align 2, 0
_0813574C: .4byte gUnknown_0202E8CE
_08135750: .4byte 0x00000564
_08135754:
	movs r2, 0
	ldr r4, _0813576C
	ldr r3, _08135770
_0813575A:
	adds r0, r2, r4
	adds r1, r2, r3
	ldrb r1, [r1]
	strb r1, [r0]
	adds r2, 0x1
	cmp r2, 0x2
	ble _0813575A
	b _0813589A
	.align 2, 0
_0813576C: .4byte gSaveBlock2 + 0x565
_08135770: .4byte gUnknown_02039270
_08135774:
	ldr r3, _081357C0
	adds r0, r5, r3
	ldrb r0, [r0]
	cmp r0, 0xC8
	bne _08135788
	movs r1, 0x93
	lsls r1, 3
	adds r0, r5, r1
	bl sub_81360AC
_08135788:
	movs r3, 0xAE
	lsls r3, 3
	adds r2, r5, r3
	ldrh r1, [r2]
	ldr r0, _081357C4
	cmp r1, r0
	bhi _0813579A
	adds r0, r1, 0x1
	strh r0, [r2]
_0813579A:
	lsls r4, 1
	movs r1, 0xAB
	lsls r1, 3
	adds r0, r5, r1
	adds r4, r0
	ldrh r0, [r4]
	adds r0, 0x1
	strh r0, [r4]
	bl sub_8135A3C
	ldr r1, _081357C8
	ldrh r0, [r4]
	strh r0, [r1]
	ldr r1, _081357CC
	adds r0, 0xA1
	strb r0, [r1]
	movs r0, 0xFF
	strb r0, [r1, 0x1]
	b _0813589A
	.align 2, 0
_081357C0: .4byte 0x00000564
_081357C4: .4byte 0x0000270e
_081357C8: .4byte gScriptResult
_081357CC: .4byte gStringVar1
_081357D0:
	lsls r0, r4, 1
	ldr r2, _081357F0
	adds r1, r5, r2
	adds r4, r0, r1
	ldrh r1, [r4]
	ldr r0, _081357F4
	cmp r1, r0
	bhi _081357E4
	adds r0, r1, 0x1
	strh r0, [r4]
_081357E4:
	bl sub_8135A3C
	ldr r1, _081357F8
	ldrh r0, [r4]
	strh r0, [r1]
	b _0813589A
	.align 2, 0
_081357F0: .4byte 0x0000055c
_081357F4: .4byte 0x00000595
_081357F8: .4byte gScriptResult
_081357FC:
	ldr r0, _08135818
	ldrb r0, [r0]
	ldr r1, _0813581C
	adds r3, r5, r1
	movs r1, 0x1
	ands r1, r0
	lsls r1, 1
	ldrb r2, [r3]
	movs r0, 0x3
	negs r0, r0
_08135810:
	ands r0, r2
	orrs r0, r1
	strb r0, [r3]
	b _0813589A
	.align 2, 0
_08135818: .4byte gUnknown_0202E8CE
_0813581C: .4byte 0x00000554
_08135820:
	ldr r2, _08135830
	adds r0, r5, r2
	ldrh r1, [r0]
	movs r0, 0x20
	bl sav12_xor_set
	b _0813589A
	.align 2, 0
_08135830: .4byte 0x00000572
_08135834:
	ldr r3, _08135848
	adds r0, r5, r3
	adds r0, r4, r0
	ldrb r0, [r0]
	cmp r0, 0x3
	beq _0813589A
	adds r0, r4, 0
	bl sub_813461C
	b _0813589A
	.align 2, 0
_08135848: .4byte 0x00000556
_0813584C:
	ldr r1, _08135860
	adds r0, r5, r1
	adds r0, r4, r0
	ldr r1, _08135864
	ldr r2, _08135868
	adds r1, r2
	ldrb r1, [r1]
	strb r1, [r0]
	b _0813589A
	.align 2, 0
_08135860: .4byte 0x00000556
_08135864: .4byte 0x02000000
_08135868: .4byte 0x000160fb
_0813586C:
	adds r0, r4, 0
	bl sub_8135D3C
	ldr r1, _08135880
	lsls r2, r4, 1
	ldr r3, _08135884
	adds r1, r3
	adds r2, r1
	strh r0, [r2]
	b _0813589A
	.align 2, 0
_08135880: .4byte gSaveBlock2
_08135884: .4byte 0x00000574
_08135888:
	ldr r1, _081358A0
	adds r0, r5, r1
	ldrb r0, [r0]
	lsls r0, 31
	lsrs r0, 31
	movs r2, 0xAF
	lsls r2, 3
	adds r1, r5, r2
_08135898:
	strb r0, [r1]
_0813589A:
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_081358A0: .4byte 0x00000554
	thumb_func_end sub_8135668

	thumb_func_start sub_81358A4
sub_81358A4: @ 81358A4
	push {r4,lr}
	ldr r1, _081358C8
	ldr r2, _081358CC
	adds r0, r1, r2
	ldrb r0, [r0]
	lsls r0, 31
	lsrs r4, r0, 31
	ldr r0, _081358D0
	ldrh r0, [r0]
	adds r3, r1, 0
	cmp r0, 0xE
	bls _081358BE
	b _08135A0A
_081358BE:
	lsls r0, 2
	ldr r1, _081358D4
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_081358C8: .4byte gSaveBlock2
_081358CC: .4byte 0x00000554
_081358D0: .4byte gUnknown_0202E8CC
_081358D4: .4byte _081358D8
	.align 2, 0
_081358D8:
	.4byte _08135914
	.4byte _08135928
	.4byte _0813593C
	.4byte _0813594C
	.4byte _08135964
	.4byte _08135A0A
	.4byte _08135A0A
	.4byte _08135A0A
	.4byte _08135978
	.4byte _08135990
	.4byte _081359A0
	.4byte _081359B4
	.4byte _081359BC
	.4byte _081359DC
	.4byte _081359F8
_08135914:
	ldr r0, _08135920
	ldr r2, _08135924
	adds r1, r3, r2
	adds r1, r4, r1
	b _0813596A
	.align 2, 0
_08135920: .4byte gScriptResult
_08135924: .4byte 0x00000556
_08135928:
	ldr r1, _08135934
	ldr r4, _08135938
	adds r0, r3, r4
	ldrb r0, [r0]
	lsls r0, 31
	b _08135982
	.align 2, 0
_08135934: .4byte gScriptResult
_08135938: .4byte 0x00000554
_0813593C:
	ldr r2, _08135948
	lsls r0, r4, 1
	movs r4, 0xAB
	lsls r4, 3
	b _08135952
	.align 2, 0
_08135948: .4byte gScriptResult
_0813594C:
	ldr r2, _0813595C
	lsls r0, r4, 1
	ldr r4, _08135960
_08135952:
	adds r1, r3, r4
	adds r0, r1
	ldrh r0, [r0]
	strh r0, [r2]
	b _08135A0A
	.align 2, 0
_0813595C: .4byte gScriptResult
_08135960: .4byte 0x0000055c
_08135964:
	ldr r0, _08135970
	ldr r2, _08135974
	adds r1, r3, r2
_0813596A:
	ldrb r1, [r1]
	strh r1, [r0]
	b _08135A0A
	.align 2, 0
_08135970: .4byte gScriptResult
_08135974: .4byte 0x00000564
_08135978:
	ldr r1, _08135988
	ldr r4, _0813598C
	adds r0, r3, r4
	ldrb r0, [r0]
	lsls r0, 30
_08135982:
	lsrs r0, 31
	strh r0, [r1]
	b _08135A0A
	.align 2, 0
_08135988: .4byte gScriptResult
_0813598C: .4byte 0x00000554
_08135990:
	adds r0, r4, 0
	bl sub_8135D3C
	ldr r1, _0813599C
	strh r0, [r1]
	b _08135A0A
	.align 2, 0
_0813599C: .4byte gScriptResult
_081359A0:
	ldr r1, _081359B0
	adds r0, r3, r1
	ldrh r1, [r0]
	movs r0, 0x20
	bl sav12_xor_set
	b _08135A0A
	.align 2, 0
_081359B0: .4byte 0x00000572
_081359B4:
	adds r0, r4, 0
	bl sub_813461C
	b _08135A0A
_081359BC:
	ldr r2, _081359D0
	adds r0, r3, r2
	adds r0, r4, r0
	ldr r1, _081359D4
	ldr r3, _081359D8
	adds r1, r3
	ldrb r1, [r1]
	strb r1, [r0]
	b _08135A0A
	.align 2, 0
_081359D0: .4byte 0x00000556
_081359D4: .4byte 0x02000000
_081359D8: .4byte 0x000160fb
_081359DC:
	adds r0, r4, 0
	bl sub_8135D3C
	ldr r1, _081359F0
	lsls r2, r4, 1
	ldr r4, _081359F4
	adds r1, r4
	adds r2, r1
	strh r0, [r2]
	b _08135A0A
	.align 2, 0
_081359F0: .4byte gSaveBlock2
_081359F4: .4byte 0x00000574
_081359F8:
	ldr r1, _08135A10
	adds r0, r3, r1
	ldrb r0, [r0]
	lsls r0, 31
	lsrs r0, 31
	movs r2, 0xAF
	lsls r2, 3
	adds r1, r3, r2
	strb r0, [r1]
_08135A0A:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08135A10: .4byte 0x00000554
	thumb_func_end sub_81358A4

	thumb_func_start sub_8135A14
sub_8135A14: @ 8135A14
	push {r4,lr}
	movs r2, 0
	ldr r4, _08135A34
	ldr r3, _08135A38
_08135A1C:
	adds r0, r2, r4
	adds r1, r2, r3
	ldrb r1, [r1]
	strb r1, [r0]
	adds r2, 0x1
	cmp r2, 0x2
	ble _08135A1C
	bl sub_80C5604
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08135A34: .4byte gUnknown_02039270
_08135A38: .4byte gSaveBlock2 + 0x565
	thumb_func_end sub_8135A14

	thumb_func_start sub_8135A3C
sub_8135A3C: @ 8135A3C
	push {r4-r6,lr}
	ldr r6, _08135A84
	ldr r1, _08135A88
	adds r0, r6, r1
	ldrb r4, [r0]
	lsls r4, 31
	lsrs r4, 31
	adds r0, r4, 0
	bl sub_8135D3C
	lsls r0, 16
	lsrs r5, r0, 16
	lsls r4, 1
	movs r3, 0xAC
	lsls r3, 3
	adds r2, r6, r3
	adds r4, r2
	ldrh r0, [r4]
	cmp r0, r5
	bcs _08135A66
	strh r5, [r4]
_08135A66:
	ldr r0, _08135A8C
	adds r1, r6, r0
	ldrh r0, [r2]
	ldrh r3, [r1]
	cmp r0, r3
	bls _08135A94
	adds r5, r0, 0
	movs r0, 0x20
	adds r1, r5, 0
	bl sav12_xor_set
	ldr r1, _08135A90
	cmp r5, r1
	bhi _08135AA4
	b _08135AB4
	.align 2, 0
_08135A84: .4byte gSaveBlock2
_08135A88: .4byte 0x00000554
_08135A8C: .4byte 0x00000562
_08135A90: .4byte 0x0000270f
_08135A94:
	ldrh r5, [r1]
	movs r0, 0x20
	adds r1, r5, 0
	bl sav12_xor_set
	ldr r1, _08135AAC
	cmp r5, r1
	bls _08135AB4
_08135AA4:
	ldr r2, _08135AB0
	adds r0, r6, r2
	strh r1, [r0]
	b _08135ABA
	.align 2, 0
_08135AAC: .4byte 0x0000270f
_08135AB0: .4byte 0x00000572
_08135AB4:
	ldr r3, _08135AC0
	adds r0, r6, r3
	strh r5, [r0]
_08135ABA:
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_08135AC0: .4byte 0x00000572
	thumb_func_end sub_8135A3C

	thumb_func_start sub_8135AC4
sub_8135AC4: @ 8135AC4
	push {r4-r6,lr}
	ldr r5, _08135AF0
	adds r2, r5, 0
	subs r2, 0xA8
	ldr r1, _08135AF4
	adds r0, r5, r1
	ldrb r0, [r0]
	lsls r0, 31
	lsrs r6, r0, 31
	ldrb r0, [r2, 0x8]
	cmp r0, 0
	beq _08135AFC
	ldr r4, _08135AF8
	ldrb r0, [r2, 0xA]
	ldrb r1, [r2, 0xB]
	adds r0, r1
	ldrb r1, [r2, 0xC]
	adds r0, r1
	ldrb r1, [r2, 0xD]
	adds r0, r1
	movs r1, 0x14
	b _08135B0E
	.align 2, 0
_08135AF0: .4byte gSaveBlock2 + 0xA8
_08135AF4: .4byte 0x000004ac
_08135AF8: .4byte gUnknown_08405E7E
_08135AFC:
	ldr r4, _08135B84
	ldrb r0, [r2, 0xA]
	ldrb r1, [r2, 0xB]
	adds r0, r1
	ldrb r1, [r2, 0xC]
	adds r0, r1
	ldrb r1, [r2, 0xD]
	adds r0, r1
	movs r1, 0x1E
_08135B0E:
	bl __umodsi3
	adds r0, r4
	ldrb r0, [r0]
	strb r6, [r5]
	strb r0, [r5, 0x1]
	adds r0, r5, 0
	adds r0, 0xC
	ldr r4, _08135B88
	adds r1, r4, 0
	bl sub_8052D10
	adds r0, r5, 0x4
	subs r4, 0xA
	adds r1, r4, 0
	bl StringCopy8
	adds r0, r6, 0
	bl sub_8135D3C
	strh r0, [r5, 0x2]
	ldr r0, _08135B8C
	ldr r1, _08135B90
	adds r2, r0, r1
	adds r1, r5, 0
	adds r1, 0x10
	movs r4, 0x5
_08135B44:
	ldrh r0, [r2]
	strh r0, [r1]
	adds r2, 0x2
	adds r1, 0x2
	subs r4, 0x1
	cmp r4, 0
	bge _08135B44
	movs r4, 0
	ldr r6, _08135B94
_08135B56:
	adds r0, r4, r6
	ldrb r1, [r0]
	movs r0, 0x64
	muls r0, r1
	ldr r1, _08135B98
	adds r0, r1
	movs r1, 0x2C
	muls r1, r4
	adds r1, 0x1C
	adds r1, r5, r1
	bl sub_803AF78
	adds r4, 0x1
	cmp r4, 0x2
	ble _08135B56
	ldr r0, _08135B9C
	bl sub_8135CC4
	bl sub_8135A3C
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_08135B84: .4byte gUnknown_08405E60
_08135B88: .4byte gSaveBlock2 + 0xA
_08135B8C: .4byte gSaveBlock1
_08135B90: .4byte 0x00002b28
_08135B94: .4byte gSaveBlock2 + 0x565
_08135B98: .4byte gUnknown_030042FC
_08135B9C: .4byte gSaveBlock2 + 0xA8
	thumb_func_end sub_8135AC4

	thumb_func_start sub_8135BA0
sub_8135BA0: @ 8135BA0
	push {r4,r5,lr}
	ldr r2, _08135C1C
	ldr r1, _08135C20
	adds r0, r2, r1
	ldrb r0, [r0]
	lsls r0, 31
	lsrs r5, r0, 31
	ldr r0, _08135C24
	ldrh r0, [r0]
	cmp r0, 0x3
	beq _08135BBA
	cmp r0, 0
	bne _08135BD8
_08135BBA:
	lsls r1, r5, 1
	ldr r3, _08135C28
	adds r0, r2, r3
	adds r0, r1, r0
	ldrh r0, [r0]
	cmp r0, 0x1
	bhi _08135BD4
	subs r3, 0x4
	adds r0, r2, r3
	adds r0, r1, r0
	ldrh r0, [r0]
	cmp r0, 0x1
	bls _08135BD8
_08135BD4:
	bl sub_8135AC4
_08135BD8:
	bl sub_8135CFC
	ldr r4, _08135C1C
	ldr r0, _08135C2C
	ldrb r1, [r0]
	ldr r2, _08135C30
	adds r0, r4, r2
	strb r1, [r0]
	ldr r0, _08135C24
	ldrh r1, [r0]
	cmp r1, 0x3
	beq _08135BF8
	ldr r3, _08135C34
	adds r0, r4, r3
	adds r0, r5, r0
	strb r1, [r0]
_08135BF8:
	movs r0, 0x80
	lsls r0, 7
	movs r1, 0
	bl VarSet
	ldr r0, _08135C20
	adds r2, r4, r0
	ldrb r0, [r2]
	movs r1, 0x2
	orrs r0, r1
	strb r0, [r2]
	movs r0, 0x2
	bl sub_8125D44
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_08135C1C: .4byte gSaveBlock2
_08135C20: .4byte 0x00000554
_08135C24: .4byte gUnknown_0202E8CC
_08135C28: .4byte 0x0000055c
_08135C2C: .4byte gUnknown_02024D26
_08135C30: .4byte 0x00000555
_08135C34: .4byte 0x00000556
	thumb_func_end sub_8135BA0

	thumb_func_start sub_8135C38
sub_8135C38: @ 8135C38
	push {lr}
	bl DoSoftReset
	pop {r0}
	bx r0
	thumb_func_end sub_8135C38

	thumb_func_start sub_8135C44
sub_8135C44: @ 8135C44
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	movs r3, 0
	movs r1, 0
	ldr r2, _08135CBC
_08135C50:
	ldm r2!, {r0}
	adds r3, r0
	adds r1, 0x1
	cmp r1, 0x27
	bls _08135C50
	ldr r5, _08135CC0
	movs r1, 0xA4
	lsls r1, 1
	adds r0, r5, r1
	ldr r0, [r0]
	cmp r0, r3
	beq _08135C70
	adds r0, r5, 0
	adds r0, 0xA8
	bl sub_8135CE8
_08135C70:
	movs r4, 0
	movs r7, 0xA4
	movs r0, 0xA6
	lsls r0, 1
	adds r6, r5, r0
	mov r8, r5
_08135C7C:
	adds r0, r4, 0
	muls r0, r7
	movs r3, 0
	movs r1, 0
	adds r5, r4, 0x1
	adds r2, r0, r6
_08135C88:
	ldm r2!, {r0}
	adds r3, r0
	adds r1, 0x1
	cmp r1, 0x27
	bls _08135C88
	adds r1, r4, 0
	muls r1, r7
	movs r0, 0xF6
	lsls r0, 1
	add r0, r8
	adds r0, r1, r0
	ldr r0, [r0]
	cmp r0, r3
	beq _08135CAA
	adds r0, r1, r6
	bl sub_8135CE8
_08135CAA:
	adds r4, r5, 0
	cmp r4, 0x4
	ble _08135C7C
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_08135CBC: .4byte gSaveBlock2 + 0xA8
_08135CC0: .4byte gSaveBlock2
	thumb_func_end sub_8135C44

	thumb_func_start sub_8135CC4
sub_8135CC4: @ 8135CC4
	push {r4,lr}
	adds r2, r0, 0
	adds r2, 0xA0
	movs r1, 0
	str r1, [r2]
	movs r3, 0
	adds r4, r0, 0
_08135CD2:
	ldr r0, [r2]
	ldm r4!, {r1}
	adds r0, r1
	str r0, [r2]
	adds r3, 0x1
	cmp r3, 0x27
	bls _08135CD2
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end sub_8135CC4

	thumb_func_start sub_8135CE8
sub_8135CE8: @ 8135CE8
	push {lr}
	movs r1, 0
	movs r2, 0
_08135CEE:
	stm r0!, {r2}
	adds r1, 0x1
	cmp r1, 0x28
	bls _08135CEE
	pop {r0}
	bx r0
	thumb_func_end sub_8135CE8

	thumb_func_start sub_8135CFC
sub_8135CFC: @ 8135CFC
	push {r4,lr}
	ldr r4, _08135D34
	adds r0, r4, 0
	bl get_trainer_name
	ldr r2, _08135D38
	adds r0, r2, 0
	adds r0, 0x58
	ldrh r1, [r0]
	subs r0, r4, 0x2
	strh r1, [r0]
	ldrh r1, [r2]
	subs r0, r4, 0x4
	strh r1, [r0]
	movs r3, 0
	adds r4, 0x8
	adds r2, 0x30
_08135D1E:
	adds r0, r3, r4
	adds r1, r3, r2
	ldrb r1, [r1]
	strb r1, [r0]
	adds r3, 0x1
	cmp r3, 0x9
	ble _08135D1E
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08135D34: .4byte gSaveBlock2 + 0x484
_08135D38: .4byte gBattleMons
	thumb_func_end sub_8135CFC

	thumb_func_start sub_8135D3C
sub_8135D3C: @ 8135D3C
	push {lr}
	lsls r0, 24
	ldr r3, _08135D74
	lsrs r0, 23
	ldr r2, _08135D78
	adds r1, r3, r2
	adds r1, r0, r1
	ldrh r2, [r1]
	subs r2, 0x1
	lsls r1, r2, 3
	subs r1, r2
	movs r2, 0xAB
	lsls r2, 3
	adds r3, r2
	adds r0, r3
	ldr r2, _08135D7C
	adds r1, r2
	ldrh r0, [r0]
	adds r1, r0
	lsls r1, 16
	lsrs r0, r1, 16
	ldr r1, _08135D80
	cmp r0, r1
	bls _08135D6E
	adds r0, r1, 0
_08135D6E:
	pop {r1}
	bx r1
	.align 2, 0
_08135D74: .4byte gSaveBlock2
_08135D78: .4byte 0x0000055c
_08135D7C: .4byte 0x0000ffff
_08135D80: .4byte 0x0000270f
	thumb_func_end sub_8135D3C

	thumb_func_start sub_8135D84
sub_8135D84: @ 8135D84
	push {r4,r5,lr}
	ldr r5, _08135DB0
	ldr r1, _08135DB4
	adds r0, r5, r1
	ldrb r0, [r0]
	lsls r0, 31
	lsrs r0, 31
	lsls r0, 1
	ldr r2, _08135DB8
	adds r1, r5, r2
	adds r0, r1
	ldrh r0, [r0]
	subs r0, 0x1
	cmp r0, 0x5
	ble _08135DC0
	bl Random
	ldr r4, _08135DBC
	lsls r0, 16
	lsrs r0, 16
	movs r1, 0x9
	b _08135DCC
	.align 2, 0
_08135DB0: .4byte gSaveBlock2
_08135DB4: .4byte 0x00000554
_08135DB8: .4byte 0x0000055c
_08135DBC: .4byte gUnknown_08405EE6
_08135DC0:
	bl Random
	ldr r4, _08135DE8
	lsls r0, 16
	lsrs r0, 16
	movs r1, 0x6
_08135DCC:
	bl __umodsi3
	lsls r0, 16
	lsrs r0, 15
	adds r0, r4
	ldrh r1, [r0]
	movs r2, 0xAD
	lsls r2, 3
	adds r0, r5, r2
	strh r1, [r0]
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_08135DE8: .4byte gUnknown_08405EDA
	thumb_func_end sub_8135D84

	thumb_func_start sub_8135DEC
sub_8135DEC: @ 8135DEC
	push {r4-r7,lr}
	ldr r5, _08135E20
	ldr r1, _08135E24
	adds r0, r5, r1
	ldrb r0, [r0]
	lsls r0, 31
	lsrs r7, r0, 31
	movs r0, 0xAD
	lsls r0, 3
	adds r6, r5, r0
	ldrh r0, [r6]
	movs r1, 0x1
	bl sub_80A9424
	lsls r0, 24
	lsrs r4, r0, 24
	cmp r4, 0x1
	bne _08135E30
	ldrh r0, [r6]
	ldr r1, _08135E28
	bl itemid_copy_name
	ldr r0, _08135E2C
	strh r4, [r0]
	b _08135E40
	.align 2, 0
_08135E20: .4byte gSaveBlock2
_08135E24: .4byte 0x00000554
_08135E28: .4byte gStringVar1
_08135E2C: .4byte gScriptResult
_08135E30:
	ldr r1, _08135E48
	movs r0, 0
	strh r0, [r1]
	ldr r1, _08135E4C
	adds r0, r5, r1
	adds r0, r7, r0
	movs r1, 0x6
	strb r1, [r0]
_08135E40:
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_08135E48: .4byte gScriptResult
_08135E4C: .4byte 0x00000556
	thumb_func_end sub_8135DEC

	thumb_func_start sub_8135E50
sub_8135E50: @ 8135E50
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	ldr r6, _08135ED4
	ldr r1, _08135ED8
	adds r0, r6, r1
	ldrb r0, [r0]
	lsls r0, 31
	lsrs r0, 31
	adds r1, r0, 0
	movs r7, 0x44
	cmp r1, 0
	beq _08135E6C
	movs r7, 0x45
_08135E6C:
	ldr r4, _08135EDC
	movs r0, 0
	strh r0, [r4]
	adds r0, r1, 0
	bl sub_8135D3C
	lsls r0, 16
	lsrs r0, 16
	cmp r0, 0x37
	bls _08135EBA
	movs r5, 0
	ldr r0, _08135EE0
	adds r0, r6
	mov r8, r0
	adds r6, r4, 0
_08135E8A:
	mov r1, r8
	adds r0, r5, r1
	ldrb r0, [r0]
	subs r0, 0x1
	movs r1, 0x64
	muls r1, r0
	ldr r0, _08135EE4
	adds r4, r1, r0
	adds r0, r4, 0
	adds r1, r7, 0
	bl GetMonData
	cmp r0, 0
	bne _08135EB4
	movs r0, 0x1
	strh r0, [r6]
	adds r0, r4, 0
	adds r1, r7, 0
	adds r2, r6, 0
	bl SetMonData
_08135EB4:
	adds r5, 0x1
	cmp r5, 0x2
	ble _08135E8A
_08135EBA:
	ldr r0, _08135EDC
	ldrh r0, [r0]
	cmp r0, 0
	beq _08135EC8
	movs r0, 0x2A
	bl sav12_xor_increment
_08135EC8:
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_08135ED4: .4byte gSaveBlock2
_08135ED8: .4byte 0x00000554
_08135EDC: .4byte gScriptResult
_08135EE0: .4byte 0x00000565
_08135EE4: .4byte gPlayerParty
	thumb_func_end sub_8135E50

	thumb_func_start unref_sub_8135EE8
unref_sub_8135EE8: @ 8135EE8
	push {r4-r7,lr}
	ldr r7, _08135F0C
	ldr r0, _08135F10
	adds r2, r7, r0
	ldrb r0, [r2, 0x8]
	cmp r0, 0
	beq _08135F18
	ldr r4, _08135F14
	ldrb r0, [r2, 0xA]
	ldrb r1, [r2, 0xB]
	adds r0, r1
	ldrb r1, [r2, 0xC]
	adds r0, r1
	ldrb r1, [r2, 0xD]
	adds r0, r1
	movs r1, 0x14
	b _08135F2A
	.align 2, 0
_08135F0C: .4byte gSaveBlock2 + 0x498
_08135F10: .4byte 0xfffffb68
_08135F14: .4byte gUnknown_08405E7E
_08135F18:
	ldr r4, _08135FA8
	ldrb r0, [r2, 0xA]
	ldrb r1, [r2, 0xB]
	adds r0, r1
	ldrb r1, [r2, 0xC]
	adds r0, r1
	ldrb r1, [r2, 0xD]
	adds r0, r1
	movs r1, 0x1E
_08135F2A:
	bl __umodsi3
	adds r0, r4
	ldrb r0, [r0]
	strb r0, [r7, 0x1]
	adds r0, r7, 0
	adds r0, 0xC
	ldr r4, _08135FAC
	adds r1, r4, 0
	bl sub_8052D10
	adds r0, r7, 0x4
	subs r4, 0xA
	adds r1, r4, 0
	bl StringCopy8
	movs r0, 0x1
	strh r0, [r7, 0x2]
	movs r5, 0x7
	movs r4, 0
	ldr r0, _08135FB0
	ldr r1, _08135FB4
	adds r6, r0, r1
	adds r3, r7, 0
	adds r3, 0x10
	adds r2, r7, 0
	adds r2, 0x28
	adds r1, r7, 0
	adds r1, 0x1C
_08135F64:
	ldrh r0, [r6]
	strh r0, [r3]
	strh r5, [r1]
	adds r0, r5, 0x6
	strh r0, [r2]
	adds r5, 0x1
	adds r6, 0x2
	adds r3, 0x2
	adds r2, 0x2
	adds r1, 0x2
	adds r4, 0x1
	cmp r4, 0x5
	ble _08135F64
	movs r4, 0
_08135F80:
	movs r0, 0x64
	muls r0, r4
	ldr r1, _08135FB8
	adds r0, r1
	movs r1, 0x2C
	muls r1, r4
	adds r1, 0x34
	adds r1, r7, r1
	bl sub_803AF78
	adds r4, 0x1
	cmp r4, 0x2
	ble _08135F80
	adds r0, r7, 0
	bl sub_8136088
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_08135FA8: .4byte gUnknown_08405E60
_08135FAC: .4byte gSaveBlock2 + 0xA
_08135FB0: .4byte gSaveBlock1
_08135FB4: .4byte 0x00002b28
_08135FB8: .4byte gPlayerParty
	thumb_func_end unref_sub_8135EE8

	thumb_func_start sub_8135FBC
sub_8135FBC: @ 8135FBC
	ldr r1, _08135FCC
	ldr r0, _08135FD0
	ldr r2, _08135FD4
	adds r0, r2
	ldrb r0, [r0]
	adds r0, r1
	ldrb r0, [r0]
	bx lr
	.align 2, 0
_08135FCC: .4byte gTrainerClassToPicIndex
_08135FD0: .4byte gSaveBlock2
_08135FD4: .4byte 0x00000499
	thumb_func_end sub_8135FBC

	thumb_func_start sub_8135FD8
sub_8135FD8: @ 8135FD8
	ldr r1, _08135FE8
	ldr r0, _08135FEC
	ldr r2, _08135FF0
	adds r0, r2
	ldrb r0, [r0]
	adds r0, r1
	ldrb r0, [r0]
	bx lr
	.align 2, 0
_08135FE8: .4byte gTrainerClassToNameIndex
_08135FEC: .4byte gSaveBlock2
_08135FF0: .4byte 0x00000499
	thumb_func_end sub_8135FD8

	thumb_func_start sub_8135FF4
sub_8135FF4: @ 8135FF4
	push {r4,lr}
	adds r3, r0, 0
	movs r2, 0
	ldr r4, _08136018
_08135FFC:
	adds r0, r3, r2
	adds r1, r2, r4
	ldrb r1, [r1]
	strb r1, [r0]
	adds r2, 0x1
	cmp r2, 0x6
	ble _08135FFC
	adds r1, r3, r2
	movs r0, 0xFF
	strb r0, [r1]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08136018: .4byte gSaveBlock2 + 0x49C
	thumb_func_end sub_8135FF4

	thumb_func_start sub_813601C
sub_813601C: @ 813601C
	push {r4,r5,lr}
	ldr r1, _08136044
	movs r0, 0
	strh r0, [r1]
	ldr r5, _08136048
	movs r3, 0
	movs r2, 0
	adds r4, r1, 0
	adds r1, r5, 0
_0813602E:
	ldm r1!, {r0}
	orrs r3, r0
	adds r2, 0x1
	cmp r2, 0x2D
	bls _0813602E
	cmp r3, 0
	bne _0813604C
	movs r0, 0x1
	strh r0, [r4]
	b _08136078
	.align 2, 0
_08136044: .4byte gScriptResult
_08136048: .4byte gSaveBlock2 + 0x498
_0813604C:
	movs r3, 0
	movs r2, 0
	ldr r4, _08136080
	adds r1, r5, 0
_08136054:
	ldm r1!, {r0}
	adds r3, r0
	adds r2, 0x1
	cmp r2, 0x2D
	bls _08136054
	movs r1, 0xAA
	lsls r1, 3
	adds r0, r4, r1
	ldr r0, [r0]
	cmp r0, r3
	beq _08136078
	subs r1, 0xB8
	adds r0, r4, r1
	bl sub_81360AC
	ldr r1, _08136084
	movs r0, 0x1
	strh r0, [r1]
_08136078:
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_08136080: .4byte gSaveBlock2
_08136084: .4byte gScriptResult
	thumb_func_end sub_813601C

	thumb_func_start sub_8136088
sub_8136088: @ 8136088
	push {r4,lr}
	adds r2, r0, 0
	adds r2, 0xB8
	movs r1, 0
	str r1, [r2]
	movs r3, 0
	adds r4, r0, 0
_08136096:
	ldr r0, [r2]
	ldm r4!, {r1}
	adds r0, r1
	str r0, [r2]
	adds r3, 0x1
	cmp r3, 0x2D
	bls _08136096
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end sub_8136088

	thumb_func_start sub_81360AC
sub_81360AC: @ 81360AC
	push {lr}
	movs r1, 0
	movs r2, 0
_081360B2:
	stm r0!, {r2}
	adds r1, 0x1
	cmp r1, 0x2E
	bls _081360B2
	pop {r0}
	bx r0
	thumb_func_end sub_81360AC

	thumb_func_start sub_81360C0
sub_81360C0: @ 81360C0
	push {lr}
	ldr r0, _081360CC
	bl sub_813545C
	pop {r0}
	bx r0
	.align 2, 0
_081360CC: .4byte gSaveBlock2 + 0x4A8
	thumb_func_end sub_81360C0

	thumb_func_start sub_81360D0
sub_81360D0: @ 81360D0
	push {lr}
	ldr r0, _081360E4
	ldrb r0, [r0]
	cmp r0, 0x3
	bne _081360EC
	ldr r1, _081360E8
	movs r0, 0xFF
	strb r0, [r1]
	b _08136102
	.align 2, 0
_081360E4: .4byte gUnknown_02024D26
_081360E8: .4byte gStringVar4
_081360EC:
	cmp r0, 0x1
	bne _081360FC
	ldr r0, _081360F8
	bl sub_813545C
	b _08136102
	.align 2, 0
_081360F8: .4byte gSaveBlock2 + 0x4C0
_081360FC:
	ldr r0, _08136108
	bl sub_813545C
_08136102:
	pop {r0}
	bx r0
	.align 2, 0
_08136108: .4byte gSaveBlock2 + 0x4B4
	thumb_func_end sub_81360D0

	thumb_func_start sub_813610C
sub_813610C: @ 813610C
	push {r4,r5,lr}
	movs r4, 0
	ldr r5, _0813612C
_08136112:
	adds r0, r4, r5
	ldrb r0, [r0]
	cmp r0, 0x1
	bne _0813611E
	bl sub_80BFD20
_0813611E:
	adds r4, 0x1
	cmp r4, 0x1
	ble _08136112
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_0813612C: .4byte gSaveBlock2 + 0x556
	thumb_func_end sub_813610C

	thumb_func_start sub_8136130
sub_8136130: @ 8136130
	push {r4,r5,lr}
	ldr r4, _0813615C
	ldr r2, _08136160
	ldr r3, [r2]
	ldr r5, _08136164
	adds r2, r3, r5
	str r2, [r4]
	str r0, [r2, 0x8]
	str r1, [r2, 0x4]
	ldr r0, _08136168
	adds r3, r0
	movs r0, 0x2
	strb r0, [r3]
	ldr r0, _0813616C
	bl launch_c3_walk_stairs_and_run_once
	ldr r0, _08136170
	bl SetMainCallback2
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_0813615C: .4byte gUnknown_02039304
_08136160: .4byte gUnknown_083DFEC4
_08136164: .4byte 0x0000d164
_08136168: .4byte 0x0000d162
_0813616C: .4byte sub_8136294
_08136170: .4byte sub_8136244
	thumb_func_end sub_8136130

	thumb_func_start sub_8136174
sub_8136174: @ 8136174
	push {r4,r5,lr}
	ldr r5, _081361C4
	ldr r1, [r5]
	ldr r0, _081361C8
	ldr r0, [r0]
	str r0, [r1, 0x8]
	ldr r0, _081361CC
	ldr r0, [r0]
	str r0, [r1, 0x4]
	ldr r4, _081361D0
	ldrb r0, [r4]
	bl sub_81370E4
	strb r0, [r4]
	ldr r5, [r5]
	movs r1, 0
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x3
	bls _0813619E
	movs r1, 0x1
_0813619E:
	adds r0, r5, 0
	adds r0, 0x56
	strb r1, [r0]
	ldr r0, _081361D4
	ldr r0, [r0]
	ldr r1, _081361D8
	adds r0, r1
	movs r1, 0x2
	strb r1, [r0]
	ldr r0, _081361DC
	bl launch_c3_walk_stairs_and_run_once
	ldr r0, _081361E0
	bl SetMainCallback2
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_081361C4: .4byte gUnknown_02039304
_081361C8: .4byte gUnknown_0203930C
_081361CC: .4byte gUnknown_02039308
_081361D0: .4byte gUnknown_02039310
_081361D4: .4byte gUnknown_083DFEC4
_081361D8: .4byte 0x0000d162
_081361DC: .4byte sub_8136294
_081361E0: .4byte sub_81361E4
	thumb_func_end sub_8136174

	thumb_func_start sub_81361E4
sub_81361E4: @ 81361E4
	push {r4,lr}
	ldr r4, _08136220
	ldr r0, [r4]
	ldr r0, [r0]
	bl _call_via_r0
	bl AnimateSprites
	bl BuildOamBuffer
	bl UpdatePaletteFade
	ldr r4, [r4]
	ldr r1, [r4]
	ldr r0, _08136224
	cmp r1, r0
	bne _0813621A
	movs r0, 0x80
	lsls r0, 19
	movs r1, 0
	strh r1, [r0]
	adds r0, r4, 0
	adds r0, 0x50
	strb r1, [r0]
	ldr r0, _08136228
	bl SetMainCallback2
_0813621A:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08136220: .4byte gUnknown_02039304
_08136224: .4byte sub_81365C8
_08136228: .4byte sub_813622C
	thumb_func_end sub_81361E4

	thumb_func_start sub_813622C
sub_813622C: @ 813622C
	push {lr}
	bl sub_81368A4
	bl AnimateSprites
	bl BuildOamBuffer
	bl UpdatePaletteFade
	pop {r0}
	bx r0
	thumb_func_end sub_813622C

	thumb_func_start sub_8136244
sub_8136244: @ 8136244
	push {lr}
	ldr r0, _08136260
	ldr r0, [r0]
	ldr r0, [r0]
	bl _call_via_r0
	bl AnimateSprites
	bl BuildOamBuffer
	bl UpdatePaletteFade
	pop {r0}
	bx r0
	.align 2, 0
_08136260: .4byte gUnknown_02039304
	thumb_func_end sub_8136244

	thumb_func_start sub_8136264
sub_8136264: @ 8136264
	push {lr}
	bl LoadOam
	bl ProcessSpriteCopyRequests
	bl TransferPlttBuffer
	movs r0, 0x6
	bl sub_80F5CDC
	bl sub_8089668
	pop {r0}
	bx r0
	thumb_func_end sub_8136264

	thumb_func_start launch_c3_walk_stairs_and_run_once
launch_c3_walk_stairs_and_run_once: @ 8136280
	ldr r1, _08136290
	ldr r1, [r1]
	str r0, [r1]
	adds r1, 0x50
	movs r0, 0
	strb r0, [r1]
	bx lr
	.align 2, 0
_08136290: .4byte gUnknown_02039304
	thumb_func_end launch_c3_walk_stairs_and_run_once

	thumb_func_start sub_8136294
sub_8136294: @ 8136294
	push {r4,r5,lr}
	sub sp, 0x4
	ldr r1, _081362B4
	ldr r0, [r1]
	adds r0, 0x50
	ldrb r0, [r0]
	adds r3, r1, 0
	cmp r0, 0x16
	bls _081362A8
	b _0813657A
_081362A8:
	lsls r0, 2
	ldr r1, _081362B8
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_081362B4: .4byte gUnknown_02039304
_081362B8: .4byte _081362BC
	.align 2, 0
_081362BC:
	.4byte _08136318
	.4byte _08136354
	.4byte _0813635E
	.4byte _08136366
	.4byte _08136374
	.4byte _08136380
	.4byte _0813638C
	.4byte _081363B8
	.4byte _081363C8
	.4byte _081363DC
	.4byte _081363EE
	.4byte _08136404
	.4byte _08136448
	.4byte _08136464
	.4byte _08136488
	.4byte _08136494
	.4byte _0813649A
	.4byte _081364D8
	.4byte _081364FC
	.4byte _08136508
	.4byte _08136520
	.4byte _08136538
	.4byte _0813656C
_08136318:
	bl is_c1_link_related_active
	ldr r1, _08136344
	ldr r1, [r1]
	ldr r2, _08136348
	adds r1, r2
	strb r0, [r1]
	lsls r0, 24
	lsrs r1, r0, 24
	cmp r1, 0
	beq _08136330
	b _0813657A
_08136330:
	ldr r4, _0813634C
	ldr r0, [r4]
	adds r0, 0x55
	strb r1, [r0]
	ldr r0, _08136350
	bl launch_c3_walk_stairs_and_run_once
	ldr r1, [r4]
	b _08136528
	.align 2, 0
_08136344: .4byte gUnknown_083DFEC4
_08136348: .4byte 0x00006dac
_0813634C: .4byte gUnknown_02039304
_08136350: .4byte sub_81365A0
_08136354:
	bl ResetSpriteData
	bl FreeAllSpritePalettes
	b _08136524
_0813635E:
	movs r0, 0
	bl SetVBlankCallback
	b _08136524
_08136366:
	ldr r0, _08136370
	bl SetUpWindowConfig
	b _08136524
	.align 2, 0
_08136370: .4byte gWindowConfig_81E7080
_08136374:
	ldr r0, _0813637C
	bl MultistepInitMenuWindowBegin
	b _08136524
	.align 2, 0
_0813637C: .4byte gWindowConfig_81E7080
_08136380:
	bl MultistepInitMenuWindowContinue
	cmp r0, 0
	bne _0813638A
	b _0813657A
_0813638A:
	b _08136524
_0813638C:
	ldr r0, _081363AC
	ldr r1, [r0]
	ldr r4, _081363B0
	adds r0, r1, r4
	movs r2, 0
	strb r2, [r0]
	ldr r4, _081363B4
	adds r0, r1, r4
	str r2, [r0]
	movs r0, 0xC3
	lsls r0, 2
	adds r1, r0
	movs r0, 0x20
	strh r0, [r1]
	ldr r1, [r3]
	b _08136528
	.align 2, 0
_081363AC: .4byte gUnknown_083DFEC4
_081363B0: .4byte 0x000076aa
_081363B4: .4byte 0x000087e0
_081363B8:
	bl sub_80F2688
	ldr r0, _081363D8
	ldr r1, [r0]
	adds r1, 0x50
	ldrb r0, [r1]
	adds r0, 0x1
	strb r0, [r1]
_081363C8:
	bl sub_80F26BC
	lsls r0, 24
	cmp r0, 0
	beq _081363D4
	b _0813657A
_081363D4:
	b _08136524
	.align 2, 0
_081363D8: .4byte gUnknown_02039304
_081363DC:
	movs r0, 0x1
	bl sub_80F2C80
	ldr r0, _08136400
	ldr r1, [r0]
	adds r1, 0x50
	ldrb r0, [r1]
	adds r0, 0x1
	strb r0, [r1]
_081363EE:
	movs r0, 0x1
	bl sub_80F2CBC
	lsls r0, 24
	cmp r0, 0
	beq _081363FC
	b _0813657A
_081363FC:
	b _08136524
	.align 2, 0
_08136400: .4byte gUnknown_02039304
_08136404:
	ldr r1, _08136434
	movs r0, 0x14
	strh r0, [r1]
	bl CalculatePlayerPartyCount
	ldr r1, _08136438
	ldr r4, [r1]
	ldr r2, _0813643C
	adds r1, r4, r2
	movs r5, 0
	strb r0, [r1]
	ldr r1, _08136440
	adds r0, r4, r1
	strb r5, [r0]
	subs r2, 0xC0
	adds r0, r4, r2
	str r5, [r0]
	bl sub_80F4BD0
	ldr r0, _08136444
	adds r4, r0
	strh r5, [r4]
	b _08136524
	.align 2, 0
_08136434: .4byte gKeyRepeatStartDelay
_08136438: .4byte gUnknown_083DFEC4
_0813643C: .4byte 0x00008828
_08136440: .4byte 0x00009344
_08136444: .4byte 0x0000d160
_08136448:
	bl sub_80F1778
	lsls r0, 24
	cmp r0, 0
	beq _08136454
	b _0813657A
_08136454:
	ldr r0, _08136460
	movs r1, 0x6
	strh r1, [r0]
	adds r0, 0x4
	strh r1, [r0]
	b _08136524
	.align 2, 0
_08136460: .4byte REG_BG2VOFS
_08136464:
	movs r0, 0
	bl sub_80F2E18
	ldr r0, _0813647C
	ldr r0, [r0]
	ldr r1, _08136480
	adds r0, r1
	ldr r1, [r0]
	ldr r0, _08136484
	strh r0, [r1, 0x26]
	b _08136524
	.align 2, 0
_0813647C: .4byte gUnknown_083DFEC4
_08136480: .4byte 0x00008768
_08136484: .4byte 0x0000ffd8
_08136488:
	bl sub_80F170C
	lsls r0, 24
	cmp r0, 0
	bne _0813657A
	b _08136524
_08136494:
	bl sub_80F33A8
	b _08136524
_0813649A:
	ldr r1, _081364C4
	movs r2, 0
	str r2, [sp]
	ldr r0, _081364C8
	mov r4, sp
	str r4, [r0]
	str r1, [r0, 0x4]
	ldr r1, _081364CC
	str r1, [r0, 0x8]
	ldr r0, [r0, 0x8]
	ldr r0, _081364D0
	strh r2, [r0]
	subs r0, 0x2
	strh r2, [r0]
	ldr r1, _081364D4
	movs r2, 0xF8
	lsls r2, 5
	adds r0, r2, 0
	strh r0, [r1]
	ldr r1, [r3]
	b _08136528
	.align 2, 0
_081364C4: .4byte 0x0600f800
_081364C8: .4byte 0x040000d4
_081364CC: .4byte 0x85000200
_081364D0: .4byte REG_BG1VOFS
_081364D4: .4byte REG_BG1CNT
_081364D8:
	ldr r0, _081364F0
	ldr r1, [r0]
	ldr r4, _081364F4
	adds r0, r1, r4
	ldr r2, _081364F8
	adds r1, r2
	bl sub_80F567C
	bl sub_80F5B38
	b _08136524
	.align 2, 0
_081364F0: .4byte gUnknown_083DFEC4
_081364F4: .4byte 0x00008ff0
_081364F8: .4byte 0x00009004
_081364FC:
	bl sub_80F5B50
	lsls r0, 24
	cmp r0, 0
	bne _0813657A
	b _08136524
_08136508:
	ldr r0, _08136518
	ldr r0, [r0]
	ldr r4, _0813651C
	adds r0, r4
	bl sub_80F556C
	b _08136524
	.align 2, 0
_08136518: .4byte gUnknown_083DFEC4
_0813651C: .4byte 0x00009004
_08136520:
	bl sub_80F1934
_08136524:
	ldr r0, _08136534
	ldr r1, [r0]
_08136528:
	adds r1, 0x50
	ldrb r0, [r1]
	adds r0, 0x1
	strb r0, [r1]
	b _0813657A
	.align 2, 0
_08136534: .4byte gUnknown_02039304
_08136538:
	ldr r1, _08136584
	movs r0, 0xF0
	strh r0, [r1]
	adds r1, 0x2
	movs r0, 0x9B
	strh r0, [r1]
	ldr r0, _08136588
	ldr r2, _0813658C
	adds r1, r2, 0
	strh r1, [r0]
	adds r0, 0x2
	strh r1, [r0]
	ldr r1, _08136590
	ldr r4, _08136594
	adds r0, r4, 0
	strh r0, [r1]
	adds r1, 0x2
	movs r0, 0x1B
	strh r0, [r1]
	subs r1, 0x38
	movs r0, 0x28
	strh r0, [r1]
	subs r1, 0x12
	ldr r2, _08136598
	adds r0, r2, 0
	strh r0, [r1]
_0813656C:
	ldr r0, [r3]
	adds r0, 0x55
	movs r1, 0x1
	strb r1, [r0]
	ldr r0, _0813659C
	bl launch_c3_walk_stairs_and_run_once
_0813657A:
	add sp, 0x4
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_08136584: .4byte REG_WIN0H
_08136588: .4byte REG_WIN0V
_0813658C: .4byte 0x00003273
_08136590: .4byte REG_WININ
_08136594: .4byte 0x00003f3f
_08136598: .4byte 0x00007f40
_0813659C: .4byte sub_81365C8
	thumb_func_end sub_8136294

	thumb_func_start sub_81365A0
sub_81365A0: @ 81365A0
	push {r4,lr}
	ldr r1, _081365C4
	ldr r0, [r1]
	adds r0, 0x55
	ldrb r0, [r0]
	cmp r0, 0
	bne _081365BE
	adds r4, r1, 0
_081365B0:
	bl sub_8136294
	ldr r0, [r4]
	adds r0, 0x55
	ldrb r0, [r0]
	cmp r0, 0
	beq _081365B0
_081365BE:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_081365C4: .4byte gUnknown_02039304
	thumb_func_end sub_81365A0

	thumb_func_start sub_81365C8
sub_81365C8: @ 81365C8
	push {r4,lr}
	sub sp, 0x4
	ldr r4, _081365E0
	ldr r0, [r4]
	adds r0, 0x50
	ldrb r1, [r0]
	cmp r1, 0
	beq _081365E4
	cmp r1, 0x1
	beq _0813660C
	b _08136626
	.align 2, 0
_081365E0: .4byte gUnknown_02039304
_081365E4:
	movs r0, 0x1
	negs r0, r0
	str r1, [sp]
	movs r1, 0
	movs r2, 0x10
	movs r3, 0
	bl BeginNormalPaletteFade
	ldr r0, _08136608
	bl SetVBlankCallback
	ldr r1, [r4]
	adds r1, 0x50
	ldrb r0, [r1]
	adds r0, 0x1
	strb r0, [r1]
	b _08136626
	.align 2, 0
_08136608: .4byte sub_8136264
_0813660C:
	ldr r0, _08136630
	ldrb r1, [r0, 0x7]
	movs r0, 0x80
	ands r0, r1
	cmp r0, 0
	bne _08136626
	bl sub_80F3C94
	bl sub_80F3D00
	ldr r0, _08136634
	bl launch_c3_walk_stairs_and_run_once
_08136626:
	add sp, 0x4
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08136630: .4byte gPaletteFade
_08136634: .4byte sub_8136638
	thumb_func_end sub_81365C8

	thumb_func_start sub_8136638
sub_8136638: @ 8136638
	push {r4,lr}
	ldr r0, _08136654
	ldr r0, [r0]
	adds r0, 0x50
	ldrb r0, [r0]
	cmp r0, 0x7
	bls _08136648
	b _081367FA
_08136648:
	lsls r0, 2
	ldr r1, _08136658
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_08136654: .4byte gUnknown_02039304
_08136658: .4byte _0813665C
	.align 2, 0
_0813665C:
	.4byte _0813667C
	.4byte _08136748
	.4byte _08136754
	.4byte _08136774
	.4byte _081367FA
	.4byte _08136780
	.4byte _08136798
	.4byte _081367E0
_0813667C:
	ldr r2, _081366A4
	ldrh r1, [r2, 0x2C]
	movs r0, 0x40
	ands r0, r1
	cmp r0, 0
	beq _081366AC
	movs r0, 0x5
	bl PlaySE
	movs r0, 0x1
	bl sub_80F5060
	bl move_anim_execute
	ldr r0, _081366A8
	ldr r0, [r0]
	adds r0, 0x50
	movs r1, 0x1
	b _081367F8
	.align 2, 0
_081366A4: .4byte gMain
_081366A8: .4byte gUnknown_02039304
_081366AC:
	movs r0, 0x80
	ands r0, r1
	cmp r0, 0
	beq _081366D4
	movs r0, 0x5
	bl PlaySE
	movs r0, 0
	bl sub_80F5060
	bl move_anim_execute
	ldr r0, _081366D0
	ldr r0, [r0]
	adds r0, 0x50
	movs r1, 0x1
	b _081367F8
	.align 2, 0
_081366D0: .4byte gUnknown_02039304
_081366D4:
	ldrh r1, [r2, 0x2E]
	movs r0, 0x2
	ands r0, r1
	cmp r0, 0
	beq _081366F4
	movs r0, 0x5
	bl PlaySE
	ldr r0, _081366F0
	ldr r0, [r0]
	adds r0, 0x50
	movs r1, 0x3
	b _081367F8
	.align 2, 0
_081366F0: .4byte gUnknown_02039304
_081366F4:
	movs r0, 0x1
	ands r0, r1
	cmp r0, 0
	bne _081366FE
	b _081367FA
_081366FE:
	movs r0, 0x5
	bl PlaySE
	ldr r0, _08136728
	ldr r0, [r0]
	ldr r2, _0813672C
	adds r1, r0, r2
	movs r2, 0
	ldrsh r1, [r1, r2]
	ldr r2, _08136730
	adds r0, r2
	movs r2, 0
	ldrsh r0, [r0, r2]
	subs r0, 0x1
	cmp r1, r0
	bne _08136738
	ldr r0, _08136734
	ldr r0, [r0]
	adds r0, 0x50
	movs r1, 0x3
	b _081367F8
	.align 2, 0
_08136728: .4byte gUnknown_083DFEC4
_0813672C: .4byte 0x000087dc
_08136730: .4byte 0x000087da
_08136734: .4byte gUnknown_02039304
_08136738:
	ldr r0, _08136744
	ldr r0, [r0]
	adds r0, 0x50
	movs r1, 0x5
	b _081367F8
	.align 2, 0
_08136744: .4byte gUnknown_02039304
_08136748:
	bl gpu_sync_bg_show
	lsls r0, 24
	cmp r0, 0
	bne _081367FA
	b _08136784
_08136754:
	bl sub_8055870
	adds r4, r0, 0
	cmp r4, 0
	bne _081367FA
	bl sub_80F1934
	bl sub_80F3D00
	ldr r0, _08136770
	ldr r0, [r0]
	adds r0, 0x50
	strb r4, [r0]
	b _081367FA
	.align 2, 0
_08136770: .4byte gUnknown_02039304
_08136774:
	ldr r0, _0813677C
	bl launch_c3_walk_stairs_and_run_once
	b _081367FA
	.align 2, 0
_0813677C: .4byte sub_8136B44
_08136780:
	bl sub_8136BB8
_08136784:
	ldr r0, _08136794
	ldr r1, [r0]
	adds r1, 0x50
	ldrb r0, [r1]
	adds r0, 0x1
	strb r0, [r1]
	b _081367FA
	.align 2, 0
_08136794: .4byte gUnknown_02039304
_08136798:
	bl sub_8136C40
	lsls r0, 24
	asrs r1, r0, 24
	cmp r1, 0
	beq _081367B8
	cmp r1, 0
	bgt _081367B2
	movs r0, 0x1
	negs r0, r0
	cmp r1, r0
	beq _081367F0
	b _081367FA
_081367B2:
	cmp r1, 0x1
	bne _081367FA
	b _081367F0
_081367B8:
	bl sub_8137058
	lsls r0, 24
	cmp r0, 0
	beq _081367D4
	bl sub_8136D60
	ldr r0, _081367D0
	ldr r0, [r0]
	adds r0, 0x50
	movs r1, 0x7
	b _081367F8
	.align 2, 0
_081367D0: .4byte gUnknown_02039304
_081367D4:
	ldr r0, _081367DC
	bl launch_c3_walk_stairs_and_run_once
	b _081367FA
	.align 2, 0
_081367DC: .4byte sub_8136808
_081367E0:
	ldr r0, _08136800
	ldrh r1, [r0, 0x2E]
	movs r0, 0x3
	ands r0, r1
	cmp r0, 0
	beq _081367FA
	bl sub_8136D8C
_081367F0:
	ldr r0, _08136804
	ldr r0, [r0]
	adds r0, 0x50
	movs r1, 0
_081367F8:
	strb r1, [r0]
_081367FA:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08136800: .4byte gMain
_08136804: .4byte gUnknown_02039304
	thumb_func_end sub_8136638

	thumb_func_start sub_8136808
sub_8136808: @ 8136808
	push {r4,r5,lr}
	sub sp, 0x4
	ldr r5, _08136820
	ldr r0, [r5]
	adds r0, 0x50
	ldrb r4, [r0]
	cmp r4, 0
	beq _08136824
	cmp r4, 0x1
	beq _08136874
	b _0813688C
	.align 2, 0
_08136820: .4byte gUnknown_02039304
_08136824:
	ldr r0, _08136860
	ldr r0, [r0]
	ldr r1, _08136864
	adds r0, r1
	ldrb r0, [r0]
	bl sub_81370A4
	ldr r1, _08136868
	strb r0, [r1]
	ldr r1, _0813686C
	ldr r2, [r5]
	ldr r0, [r2, 0x4]
	str r0, [r1]
	ldr r1, _08136870
	ldr r0, [r2, 0x8]
	str r0, [r1]
	movs r0, 0x1
	negs r0, r0
	str r4, [sp]
	movs r1, 0
	movs r2, 0
	movs r3, 0x10
	bl BeginNormalPaletteFade
	ldr r1, [r5]
	adds r1, 0x50
	ldrb r0, [r1]
	adds r0, 0x1
	strb r0, [r1]
	b _0813688C
	.align 2, 0
_08136860: .4byte gUnknown_083DFEC4
_08136864: .4byte 0x000087dc
_08136868: .4byte gUnknown_02039310
_0813686C: .4byte gUnknown_02039308
_08136870: .4byte gUnknown_0203930C
_08136874:
	ldr r0, _08136894
	ldrb r1, [r0, 0x7]
	movs r0, 0x80
	ands r0, r1
	cmp r0, 0
	bne _0813688C
	ldr r0, _08136898
	ldr r1, _0813689C
	str r1, [r0, 0x8]
	ldr r0, _081368A0
	bl SetMainCallback2
_0813688C:
	add sp, 0x4
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_08136894: .4byte gPaletteFade
_08136898: .4byte gMain
_0813689C: .4byte sub_8136174
_081368A0: .4byte sub_8147ADC
	thumb_func_end sub_8136808

	thumb_func_start sub_81368A4
sub_81368A4: @ 81368A4
	push {r4,lr}
	sub sp, 0x4
	ldr r1, _081368C4
	ldr r0, [r1]
	adds r0, 0x50
	ldrb r0, [r0]
	adds r4, r1, 0
	cmp r0, 0x6
	bls _081368B8
	b _081369B8
_081368B8:
	lsls r0, 2
	ldr r1, _081368C8
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_081368C4: .4byte gUnknown_02039304
_081368C8: .4byte _081368CC
	.align 2, 0
_081368CC:
	.4byte _081368E8
	.4byte _08136922
	.4byte _0813692E
	.4byte _0813694C
	.4byte _0813695A
	.4byte _0813696C
	.4byte _08136998
_081368E8:
	ldr r0, _0813690C
	ldr r0, [r0]
	ldr r1, _08136910
	adds r0, r1
	movs r2, 0
	ldrsh r1, [r0, r2]
	ldr r0, _08136914
	ldrb r0, [r0]
	cmp r1, r0
	beq _08136918
	ldr r0, [r4]
	adds r0, 0x56
	ldrb r0, [r0]
	bl sub_80F5060
	ldr r1, [r4]
	b _08136986
	.align 2, 0
_0813690C: .4byte gUnknown_083DFEC4
_08136910: .4byte 0x000087dc
_08136914: .4byte gUnknown_02039310
_08136918:
	ldr r0, [r4]
	adds r0, 0x50
	movs r1, 0x3
	strb r1, [r0]
	b _081369B8
_08136922:
	bl gpu_sync_bg_show
	lsls r0, 24
	cmp r0, 0
	bne _081369B8
	b _08136982
_0813692E:
	bl sub_8055870
	adds r4, r0, 0
	cmp r4, 0
	bne _081369B8
	bl sub_80F1934
	ldr r0, _08136948
	ldr r0, [r0]
	adds r0, 0x50
	strb r4, [r0]
	b _081369B8
	.align 2, 0
_08136948: .4byte gUnknown_02039304
_0813694C:
	movs r0, 0x1
	negs r0, r0
	movs r1, 0x10
	movs r2, 0
	bl BlendPalettes
	b _08136982
_0813695A:
	movs r1, 0x80
	lsls r1, 19
	ldr r2, _08136968
	adds r0, r2, 0
	strh r0, [r1]
	ldr r1, [r4]
	b _08136986
	.align 2, 0
_08136968: .4byte 0x00007f40
_0813696C:
	ldr r0, _08136990
	bl SetVBlankCallback
	movs r0, 0x1
	negs r0, r0
	movs r1, 0
	str r1, [sp]
	movs r2, 0x10
	movs r3, 0
	bl BeginNormalPaletteFade
_08136982:
	ldr r0, _08136994
	ldr r1, [r0]
_08136986:
	adds r1, 0x50
	ldrb r0, [r1]
	adds r0, 0x1
	strb r0, [r1]
	b _081369B8
	.align 2, 0
_08136990: .4byte sub_8136264
_08136994: .4byte gUnknown_02039304
_08136998:
	ldr r0, _081369C0
	ldrb r1, [r0, 0x7]
	movs r0, 0x80
	ands r0, r1
	cmp r0, 0
	bne _081369B8
	bl sub_80F3C94
	bl sub_80F3D00
	ldr r0, _081369C4
	bl launch_c3_walk_stairs_and_run_once
	ldr r0, _081369C8
	bl SetMainCallback2
_081369B8:
	add sp, 0x4
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_081369C0: .4byte gPaletteFade
_081369C4: .4byte sub_81369CC
_081369C8: .4byte sub_8136244
	thumb_func_end sub_81368A4

	thumb_func_start sub_81369CC
sub_81369CC: @ 81369CC
	push {r4-r6,lr}
	ldr r1, _081369E8
	ldr r0, [r1]
	adds r0, 0x50
	ldrb r0, [r0]
	adds r4, r1, 0
	cmp r0, 0x5
	bls _081369DE
	b _08136B32
_081369DE:
	lsls r0, 2
	ldr r1, _081369EC
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_081369E8: .4byte gUnknown_02039304
_081369EC: .4byte _081369F0
	.align 2, 0
_081369F0:
	.4byte _08136A08
	.4byte _08136A48
	.4byte _08136A5C
	.4byte _08136AAC
	.4byte _08136AEC
	.4byte _08136B0E
_08136A08:
	ldr r3, [r4]
	ldr r2, _08136A38
	str r2, [r3, 0xC]
	ldr r0, _08136A3C
	ldr r1, [r0]
	ldr r5, _08136A40
	adds r0, r1, r5
	movs r5, 0
	ldrsh r0, [r0, r5]
	lsls r0, 2
	adds r1, r0
	ldr r0, _08136A44
	adds r1, r0
	ldrb r0, [r1]
	lsls r0, 27
	lsrs r0, 27
	movs r1, 0x64
	muls r0, r1
	adds r0, r2
	str r0, [r3, 0xC]
	bl move_anim_execute
	b _08136B02
	.align 2, 0
_08136A38: .4byte gPlayerParty
_08136A3C: .4byte gUnknown_083DFEC4
_08136A40: .4byte 0x000087dc
_08136A44: .4byte 0x0000893e
_08136A48:
	ldr r0, _08136A58
	ldrh r1, [r0, 0x2E]
	movs r0, 0x3
	ands r0, r1
	cmp r0, 0
	beq _08136B32
	b _08136B02
	.align 2, 0
_08136A58: .4byte gMain
_08136A5C:
	bl sub_8136EF0
	ldr r6, _08136A98
	ldr r0, [r6]
	adds r0, 0x5C
	ldr r1, _08136A9C
	ldr r4, [r1]
	ldr r1, _08136AA0
	adds r5, r4, r1
	adds r1, r5, 0
	bl sub_80F567C
	ldr r1, _08136AA4
	adds r0, r4, r1
	movs r1, 0
	ldrsb r1, [r0, r1]
	lsls r0, r1, 2
	adds r0, r1
	lsls r0, 2
	ldr r1, _08136AA8
	adds r0, r1
	adds r4, r0
	adds r0, r4, 0
	adds r1, r5, 0
	bl sub_80F5550
	bl sub_8137138
	ldr r1, [r6]
	b _08136B04
	.align 2, 0
_08136A98: .4byte gUnknown_02039304
_08136A9C: .4byte gUnknown_083DFEC4
_08136AA0: .4byte 0x00009040
_08136AA4: .4byte 0x00008fe9
_08136AA8: .4byte 0x00009004
_08136AAC:
	bl sub_80F555C
	lsls r0, 24
	lsrs r4, r0, 24
	cmp r4, 0
	bne _08136B32
	ldr r0, _08136AE0
	ldr r0, [r0]
	ldr r5, _08136AE4
	adds r0, r5
	ldrb r0, [r0]
	bl sub_81370A4
	lsls r0, 24
	lsrs r0, 24
	bl sub_80F7224
	bl sub_80F3D00
	ldr r1, _08136AE8
	ldr r0, [r1]
	adds r0, 0x52
	strb r4, [r0]
	ldr r1, [r1]
	b _08136B04
	.align 2, 0
_08136AE0: .4byte gUnknown_083DFEC4
_08136AE4: .4byte 0x000087dc
_08136AE8: .4byte gUnknown_02039304
_08136AEC:
	ldr r1, [r4]
	adds r1, 0x52
	ldrb r0, [r1]
	adds r0, 0x1
	strb r0, [r1]
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x10
	bls _08136B32
	bl sub_8136C6C
_08136B02:
	ldr r1, [r4]
_08136B04:
	adds r1, 0x50
	ldrb r0, [r1]
	adds r0, 0x1
	strb r0, [r1]
	b _08136B32
_08136B0E:
	ldr r0, _08136B38
	ldrh r1, [r0, 0x2E]
	movs r0, 0x3
	ands r0, r1
	cmp r0, 0
	beq _08136B32
	bl sub_8136D00
	lsls r0, 24
	cmp r0, 0
	bne _08136B32
	ldr r0, _08136B3C
	ldrb r0, [r0]
	bl sub_810CA6C
	ldr r0, _08136B40
	bl launch_c3_walk_stairs_and_run_once
_08136B32:
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_08136B38: .4byte gMain
_08136B3C: .4byte word_203855E
_08136B40: .4byte sub_8136B44
	thumb_func_end sub_81369CC

	thumb_func_start sub_8136B44
sub_8136B44: @ 8136B44
	push {r4,lr}
	sub sp, 0x4
	ldr r4, _08136B60
	ldr r0, [r4]
	adds r2, r0, 0
	adds r2, 0x50
	ldrb r1, [r2]
	cmp r1, 0x1
	beq _08136B80
	cmp r1, 0x1
	bgt _08136B64
	cmp r1, 0
	beq _08136B6E
	b _08136BAE
	.align 2, 0
_08136B60: .4byte gUnknown_02039304
_08136B64:
	cmp r1, 0x2
	beq _08136B98
	cmp r1, 0x3
	beq _08136BA8
	b _08136BAE
_08136B6E:
	movs r0, 0x1
	negs r0, r0
	str r1, [sp]
	movs r1, 0
	movs r2, 0
	movs r3, 0x10
	bl BeginNormalPaletteFade
	b _08136B9C
_08136B80:
	ldr r0, _08136B94
	ldrb r1, [r0, 0x7]
	movs r0, 0x80
	ands r0, r1
	cmp r0, 0
	bne _08136BAE
	movs r0, 0x2
	strb r0, [r2]
	b _08136BAE
	.align 2, 0
_08136B94: .4byte gPaletteFade
_08136B98:
	bl sub_80F5BDC
_08136B9C:
	ldr r1, [r4]
	adds r1, 0x50
	ldrb r0, [r1]
	adds r0, 0x1
	strb r0, [r1]
	b _08136BAE
_08136BA8:
	ldr r0, [r0, 0x4]
	bl SetMainCallback2
_08136BAE:
	add sp, 0x4
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end sub_8136B44

	thumb_func_start sub_8136BB8
sub_8136BB8: @ 8136BB8
	push {r4,lr}
	ldr r0, _08136C28
	ldr r0, [r0]
	ldr r1, _08136C2C
	adds r0, r1
	ldrb r0, [r0]
	bl sub_81370A4
	lsls r0, 24
	lsrs r0, 24
	movs r1, 0x64
	muls r0, r1
	ldr r1, _08136C30
	adds r0, r1
	ldr r4, _08136C34
	ldr r2, [r4]
	adds r2, 0x10
	movs r1, 0x2
	bl GetMonData
	ldr r0, [r4]
	adds r0, 0x10
	bl StringGetEnd10
	ldr r0, [r4]
	adds r0, 0x10
	ldr r1, _08136C38
	bl StringAppend
	ldr r0, _08136C3C
	bl BasicInitMenuWindow
	movs r0, 0
	movs r1, 0x10
	movs r2, 0x1D
	movs r3, 0x13
	bl MenuDrawTextWindow
	ldr r0, [r4]
	adds r0, 0x10
	movs r1, 0x1
	movs r2, 0x11
	bl MenuPrint
	movs r0, 0x17
	movs r1, 0xA
	movs r2, 0x1
	bl DisplayYesNoMenu
	movs r0, 0
	bl MoveMenuCursor
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08136C28: .4byte gUnknown_083DFEC4
_08136C2C: .4byte 0x000087dc
_08136C30: .4byte gPlayerParty
_08136C34: .4byte gUnknown_02039304
_08136C38: .4byte gOtherText_GetsAPokeBlock
_08136C3C: .4byte gWindowConfig_81E709C
	thumb_func_end sub_8136BB8

	thumb_func_start sub_8136C40
sub_8136C40: @ 8136C40
	push {r4,lr}
	bl ProcessMenuInputNoWrap
	lsls r0, 24
	asrs r4, r0, 24
	movs r1, 0x80
	lsls r1, 17
	adds r0, r1
	lsrs r0, 24
	cmp r0, 0x2
	bhi _08136C60
	bl MenuZeroFillScreen
	ldr r0, _08136C68
	bl BasicInitMenuWindow
_08136C60:
	adds r0, r4, 0
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_08136C68: .4byte gWindowConfig_81E7080
	thumb_func_end sub_8136C40

	thumb_func_start sub_8136C6C
sub_8136C6C: @ 8136C6C
	push {lr}
	ldr r0, _08136C8C
	bl BasicInitMenuWindow
	movs r0, 0
	movs r1, 0x10
	movs r2, 0x1D
	movs r3, 0x13
	bl MenuDrawTextWindow
	ldr r3, _08136C90
	ldr r0, [r3]
	adds r0, 0x53
	movs r1, 0
	b _08136C9C
	.align 2, 0
_08136C8C: .4byte gWindowConfig_81E709C
_08136C90: .4byte gUnknown_02039304
_08136C94:
	ldr r0, [r3]
	adds r0, 0x53
	ldrb r1, [r0]
	adds r1, 0x1
_08136C9C:
	strb r1, [r0]
	ldr r2, [r3]
	adds r1, r2, 0
	adds r1, 0x53
	ldrb r0, [r1]
	cmp r0, 0x4
	bhi _08136CDC
	adds r0, r2, 0
	adds r0, 0x61
	ldrb r1, [r1]
	adds r0, r1
	ldrb r0, [r0]
	cmp r0, 0
	beq _08136C94
	ldr r0, _08136CD8
	ldr r2, [r0]
	adds r1, r2, 0
	adds r1, 0x53
	ldrb r0, [r1]
	cmp r0, 0x4
	bhi _08136CDC
	adds r0, r2, 0
	adds r0, 0x10
	ldrb r1, [r1]
	adds r2, 0x61
	adds r2, r1
	ldrb r2, [r2]
	bl sub_8136DC0
	b _08136CEE
	.align 2, 0
_08136CD8: .4byte gUnknown_02039304
_08136CDC:
	ldr r0, _08136CFC
	ldr r1, [r0]
	adds r0, r1, 0
	adds r0, 0x10
	adds r1, 0x53
	ldrb r1, [r1]
	movs r2, 0
	bl sub_8136DC0
_08136CEE:
	ldr r0, _08136CFC
	ldr r0, [r0]
	adds r0, 0x10
	bl sub_8136DA0
	pop {r0}
	bx r0
	.align 2, 0
_08136CFC: .4byte gUnknown_02039304
	thumb_func_end sub_8136C6C

	thumb_func_start sub_8136D00
sub_8136D00: @ 8136D00
	push {r4,r5,lr}
	ldr r4, _08136D30
	adds r3, r4, 0
	movs r5, 0x5
_08136D08:
	ldr r0, [r3]
	adds r0, 0x53
	ldrb r1, [r0]
	adds r1, 0x1
	strb r1, [r0]
	ldr r2, [r3]
	adds r1, r2, 0
	adds r1, 0x53
	ldrb r0, [r1]
	cmp r0, 0x4
	bhi _08136D34
	adds r0, r2, 0
	adds r0, 0x61
	ldrb r1, [r1]
	adds r0, r1
	ldrb r0, [r0]
	cmp r0, 0
	bne _08136D3A
	b _08136D08
	.align 2, 0
_08136D30: .4byte gUnknown_02039304
_08136D34:
	strb r5, [r1]
	movs r0, 0
	b _08136D5A
_08136D3A:
	ldr r2, [r4]
	adds r0, r2, 0
	adds r0, 0x10
	adds r1, r2, 0
	adds r1, 0x53
	ldrb r1, [r1]
	adds r2, 0x61
	adds r2, r1
	ldrb r2, [r2]
	bl sub_8136DC0
	ldr r0, [r4]
	adds r0, 0x10
	bl sub_8136DA0
	movs r0, 0x1
_08136D5A:
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end sub_8136D00

	thumb_func_start sub_8136D60
sub_8136D60: @ 8136D60
	push {lr}
	ldr r0, _08136D84
	bl BasicInitMenuWindow
	movs r0, 0
	movs r1, 0x10
	movs r2, 0x1D
	movs r3, 0x13
	bl MenuDrawTextWindow
	ldr r0, _08136D88
	movs r1, 0x1
	movs r2, 0x11
	bl MenuPrint
	pop {r0}
	bx r0
	.align 2, 0
_08136D84: .4byte gWindowConfig_81E709C
_08136D88: .4byte gOtherText_WontEat
	thumb_func_end sub_8136D60

	thumb_func_start sub_8136D8C
sub_8136D8C: @ 8136D8C
	push {lr}
	bl MenuZeroFillScreen
	ldr r0, _08136D9C
	bl BasicInitMenuWindow
	pop {r0}
	bx r0
	.align 2, 0
_08136D9C: .4byte gWindowConfig_81E7080
	thumb_func_end sub_8136D8C

	thumb_func_start sub_8136DA0
sub_8136DA0: @ 8136DA0
	push {r4,lr}
	adds r4, r0, 0
	movs r0, 0
	movs r1, 0x10
	movs r2, 0x1D
	movs r3, 0x13
	bl MenuDrawTextWindow
	adds r0, r4, 0
	movs r1, 0x1
	movs r2, 0x11
	bl MenuPrint
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end sub_8136DA0

	thumb_func_start sub_8136DC0
sub_8136DC0: @ 8136DC0
	push {r4,lr}
	adds r4, r0, 0
	lsls r1, 24
	lsrs r3, r1, 24
	lsls r2, 16
	lsrs r0, r2, 16
	asrs r2, 16
	cmp r2, 0
	beq _08136DFC
	cmp r2, 0
	ble _08136DD8
	movs r0, 0
_08136DD8:
	lsls r0, 16
	ldr r1, _08136DF4
	lsls r0, r3, 2
	adds r0, r1
	ldr r1, [r0]
	adds r0, r4, 0
	bl StringCopy
	ldr r1, _08136DF8
	adds r0, r4, 0
	bl StringAppend
	b _08136E04
	.align 2, 0
_08136DF4: .4byte gUnknown_08406134
_08136DF8: .4byte gOtherText_WasEnhanced
_08136DFC:
	ldr r1, _08136E0C
	adds r0, r4, 0
	bl StringCopy
_08136E04:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08136E0C: .4byte gOtherText_NothingChanged
	thumb_func_end sub_8136DC0

	thumb_func_start sub_8136E10
sub_8136E10: @ 8136E10
	push {r4-r7,lr}
	adds r6, r0, 0
	adds r5, r1, 0
	movs r4, 0
	ldr r7, _08136E3C
_08136E1A:
	lsls r0, r4, 2
	adds r0, r7
	ldr r1, [r0]
	adds r0, r6, 0
	bl GetMonData
	adds r1, r5, r4
	strb r0, [r1]
	adds r0, r4, 0x1
	lsls r0, 16
	lsrs r4, r0, 16
	cmp r4, 0x4
	bls _08136E1A
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_08136E3C: .4byte gUnknown_08406118
	thumb_func_end sub_8136E10

	thumb_func_start sub_8136E40
sub_8136E40: @ 8136E40
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	sub sp, 0x4
	mov r8, r0
	adds r5, r1, 0
	adds r0, r5, 0
	movs r1, 0x30
	bl GetMonData
	cmp r0, 0xFF
	beq _08136EDC
	mov r0, r8
	adds r1, r5, 0
	bl sub_8136F74
	movs r4, 0
	mov r7, sp
_08136E64:
	ldr r1, _08136EE8
	lsls r0, r4, 2
	adds r0, r1
	ldr r6, [r0]
	adds r0, r5, 0
	adds r1, r6, 0
	bl GetMonData
	lsls r0, 24
	lsrs r0, 24
	strb r0, [r7]
	ldr r1, _08136EEC
	ldr r1, [r1]
	lsls r2, r4, 1
	adds r1, 0x66
	adds r1, r2
	ldrh r1, [r1]
	adds r0, r1
	lsls r0, 16
	lsrs r1, r0, 16
	cmp r0, 0
	bge _08136E92
	movs r1, 0
_08136E92:
	lsls r0, r1, 16
	asrs r0, 16
	cmp r0, 0xFF
	ble _08136E9C
	movs r1, 0xFF
_08136E9C:
	strb r1, [r7]
	adds r0, r5, 0
	adds r1, r6, 0
	mov r2, sp
	bl SetMonData
	adds r0, r4, 0x1
	lsls r0, 16
	lsrs r4, r0, 16
	cmp r4, 0x4
	bls _08136E64
	adds r0, r5, 0
	movs r1, 0x30
	bl GetMonData
	lsls r0, 24
	lsrs r0, 24
	mov r2, r8
	ldrb r2, [r2, 0x6]
	adds r1, r0, r2
	lsls r0, r1, 16
	asrs r0, 16
	cmp r0, 0xFF
	ble _08136ECE
	movs r1, 0xFF
_08136ECE:
	mov r0, sp
	strb r1, [r0]
	adds r0, r5, 0
	movs r1, 0x30
	mov r2, sp
	bl SetMonData
_08136EDC:
	add sp, 0x4
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_08136EE8: .4byte gUnknown_08406118
_08136EEC: .4byte gUnknown_02039304
	thumb_func_end sub_8136E40

	thumb_func_start sub_8136EF0
sub_8136EF0: @ 8136EF0
	push {r4,r5,lr}
	ldr r5, _08136F60
	ldr r0, _08136F64
	ldr r1, [r0]
	ldr r2, _08136F68
	adds r0, r1, r2
	movs r2, 0
	ldrsh r0, [r0, r2]
	lsls r0, 2
	adds r1, r0
	ldr r0, _08136F6C
	adds r1, r0
	ldrb r0, [r1]
	lsls r0, 27
	lsrs r0, 27
	movs r1, 0x64
	muls r0, r1
	adds r5, r0, r5
	ldr r4, _08136F70
	ldr r1, [r4]
	adds r1, 0x57
	adds r0, r5, 0
	bl sub_8136E10
	ldr r0, [r4]
	ldr r0, [r0, 0x8]
	adds r1, r5, 0
	bl sub_8136E40
	ldr r1, [r4]
	adds r1, 0x5C
	adds r0, r5, 0
	bl sub_8136E10
	movs r3, 0
_08136F36:
	ldr r0, [r4]
	adds r2, r0, 0
	adds r2, 0x61
	adds r2, r3
	adds r1, r0, 0
	adds r1, 0x5C
	adds r1, r3
	adds r0, 0x57
	adds r0, r3
	ldrb r1, [r1]
	ldrb r0, [r0]
	subs r1, r0
	strb r1, [r2]
	adds r0, r3, 0x1
	lsls r0, 16
	lsrs r3, r0, 16
	cmp r3, 0x4
	bls _08136F36
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_08136F60: .4byte gPlayerParty
_08136F64: .4byte gUnknown_083DFEC4
_08136F68: .4byte 0x000087dc
_08136F6C: .4byte 0x0000893e
_08136F70: .4byte gUnknown_02039304
	thumb_func_end sub_8136EF0

	thumb_func_start sub_8136F74
sub_8136F74: @ 8136F74
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	mov r10, r1
	ldr r1, _08136FBC
	ldr r3, [r1]
	ldrb r1, [r0, 0x1]
	adds r2, r3, 0
	adds r2, 0x66
	strh r1, [r2]
	ldrb r2, [r0, 0x5]
	adds r1, r3, 0
	adds r1, 0x68
	strh r2, [r1]
	ldrb r1, [r0, 0x4]
	adds r2, r3, 0
	adds r2, 0x6A
	strh r1, [r2]
	ldrb r2, [r0, 0x3]
	adds r1, r3, 0
	adds r1, 0x6C
	strh r2, [r1]
	ldrb r1, [r0, 0x2]
	adds r0, r3, 0
	adds r0, 0x6E
	strh r1, [r0]
	ldr r0, _08136FC0
	movs r1, 0
	ldrsh r0, [r0, r1]
	cmp r0, 0
	ble _08136FC4
	movs r0, 0x1
	b _08136FCA
	.align 2, 0
_08136FBC: .4byte gUnknown_02039304
_08136FC0: .4byte gUnknown_02039312
_08136FC4:
	cmp r0, 0
	bge _08137040
	movs r0, 0xFF
_08136FCA:
	movs r2, 0
	lsls r0, 24
	mov r9, r0
	ldr r0, _08137050
	mov r8, r0
_08136FD4:
	mov r0, r8
	ldr r1, [r0]
	lsls r0, r2, 24
	asrs r6, r0, 24
	lsls r7, r6, 1
	adds r1, 0x66
	adds r1, r7
	movs r2, 0
	ldrsh r4, [r1, r2]
	adds r0, r4, 0
	movs r1, 0xA
	bl __divsi3
	lsls r0, 24
	lsrs r5, r0, 24
	adds r0, r4, 0
	movs r1, 0xA
	bl __modsi3
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x4
	ble _0813700C
	lsls r0, r5, 24
	movs r1, 0x80
	lsls r1, 17
	adds r0, r1
	lsrs r5, r0, 24
_0813700C:
	ldr r0, _08137054
	adds r0, r6, r0
	ldrb r1, [r0]
	mov r0, r10
	bl sub_8040A54
	lsls r0, 24
	asrs r2, r0, 24
	cmp r0, r9
	bne _08137034
	mov r1, r8
	ldr r0, [r1]
	adds r0, 0x66
	adds r0, r7
	lsls r1, r5, 24
	asrs r1, 24
	muls r1, r2
	ldrh r2, [r0]
	adds r1, r2
	strh r1, [r0]
_08137034:
	adds r0, r6, 0x1
	lsls r0, 24
	lsrs r2, r0, 24
	asrs r0, 24
	cmp r0, 0x4
	ble _08136FD4
_08137040:
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_08137050: .4byte gUnknown_02039304
_08137054: .4byte gUnknown_0840612C
	thumb_func_end sub_8136F74

	thumb_func_start sub_8137058
sub_8137058: @ 8137058
	push {lr}
	ldr r0, _0813708C
	ldr r1, _08137090
	ldr r2, [r1]
	ldr r3, _08137094
	adds r1, r2, r3
	movs r3, 0
	ldrsh r1, [r1, r3]
	lsls r1, 2
	adds r2, r1
	ldr r1, _08137098
	adds r2, r1
	ldrb r1, [r2]
	lsls r1, 27
	lsrs r1, 27
	movs r2, 0x64
	muls r1, r2
	adds r0, r1, r0
	movs r1, 0x30
	bl GetMonData
	cmp r0, 0xFF
	beq _0813709C
	movs r0, 0
	b _0813709E
	.align 2, 0
_0813708C: .4byte gPlayerParty
_08137090: .4byte gUnknown_083DFEC4
_08137094: .4byte 0x000087dc
_08137098: .4byte 0x0000893e
_0813709C:
	movs r0, 0x1
_0813709E:
	pop {r1}
	bx r1
	thumb_func_end sub_8137058

	thumb_func_start sub_81370A4
sub_81370A4: @ 81370A4
	push {r4,r5,lr}
	lsls r0, 24
	lsrs r5, r0, 24
	movs r4, 0
_081370AC:
	movs r0, 0x64
	muls r0, r4
	ldr r1, _081370C8
	adds r0, r1
	movs r1, 0x2D
	bl GetMonData
	cmp r0, 0
	bne _081370D2
	cmp r5, 0
	bne _081370CC
	adds r0, r4, 0
	b _081370DE
	.align 2, 0
_081370C8: .4byte gPlayerParty
_081370CC:
	subs r0, r5, 0x1
	lsls r0, 24
	lsrs r5, r0, 24
_081370D2:
	adds r0, r4, 0x1
	lsls r0, 24
	lsrs r4, r0, 24
	cmp r4, 0x5
	bls _081370AC
	movs r0, 0
_081370DE:
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end sub_81370A4

	thumb_func_start sub_81370E4
sub_81370E4: @ 81370E4
	push {r4-r6,lr}
	lsls r0, 24
	lsrs r5, r0, 24
	movs r4, 0
	movs r6, 0
	cmp r6, r5
	bcs _08137114
_081370F2:
	movs r0, 0x64
	muls r0, r4
	ldr r1, _08137120
	adds r0, r1
	movs r1, 0x2D
	bl GetMonData
	cmp r0, 0
	beq _0813710A
	adds r0, r6, 0x1
	lsls r0, 24
	lsrs r6, r0, 24
_0813710A:
	adds r0, r4, 0x1
	lsls r0, 24
	lsrs r4, r0, 24
	cmp r4, r5
	bcc _081370F2
_08137114:
	subs r0, r5, r6
	lsls r0, 24
	lsrs r0, 24
	pop {r4-r6}
	pop {r1}
	bx r1
	.align 2, 0
_08137120: .4byte gPlayerParty
	thumb_func_end sub_81370E4

	thumb_func_start sub_8137124
sub_8137124: @ 8137124
	push {lr}
	lsls r0, 24
	lsrs r0, 24
	bl sub_81370A4
	lsls r0, 24
	lsrs r0, 24
	pop {r1}
	bx r1
	thumb_func_end sub_8137124

	thumb_func_start sub_8137138
sub_8137138: @ 8137138
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	ldr r0, _081371C0
	bl LoadSpriteSheet
	ldr r0, _081371C4
	bl LoadSpritePalette
	ldr r2, _081371C8
	ldr r0, [r2]
	adds r0, 0x54
	movs r1, 0
	strb r1, [r0]
	movs r4, 0
	adds r5, r2, 0
	ldr r6, _081371CC
	adds r0, r6, 0x2
	mov r8, r0
	ldr r7, _081371D0
_08137160:
	ldr r0, [r5]
	adds r0, 0x61
	adds r0, r4
	ldrb r0, [r0]
	cmp r0, 0
	beq _081371AC
	lsls r2, r4, 2
	adds r0, r2, r6
	movs r3, 0
	ldrsh r1, [r0, r3]
	add r2, r8
	movs r0, 0
	ldrsh r2, [r2, r0]
	ldr r0, _081371D4
	movs r3, 0
	bl CreateSprite
	lsls r0, 24
	lsrs r1, r0, 24
	cmp r1, 0x40
	beq _081371AC
	ldr r0, [r5]
	adds r0, 0x61
	adds r0, r4
	ldrb r0, [r0]
	cmp r0, 0
	beq _081371A2
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r7
	ldr r1, _081371D8
	str r1, [r0]
_081371A2:
	ldr r1, [r5]
	adds r1, 0x54
	ldrb r0, [r1]
	adds r0, 0x1
	strb r0, [r1]
_081371AC:
	adds r0, r4, 0x1
	lsls r0, 16
	lsrs r4, r0, 16
	cmp r4, 0x4
	bls _08137160
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_081371C0: .4byte gSpriteSheet_ConditionUpDown
_081371C4: .4byte gSpritePalette_ConditionUpDown
_081371C8: .4byte gUnknown_02039304
_081371CC: .4byte gUnknown_08406158
_081371D0: .4byte gSprites + 0x1C
_081371D4: .4byte gSpriteTemplate_840618C
_081371D8: .4byte sub_81371DC
	thumb_func_end sub_8137138

	thumb_func_start sub_81371DC
sub_81371DC: @ 81371DC
	push {lr}
	adds r1, r0, 0
	movs r2, 0x2E
	ldrsh r0, [r1, r2]
	cmp r0, 0x5
	bgt _081371EE
	ldrh r0, [r1, 0x26]
	subs r0, 0x2
	b _081371F6
_081371EE:
	cmp r0, 0xB
	bgt _081371F8
	ldrh r0, [r1, 0x26]
	adds r0, 0x2
_081371F6:
	strh r0, [r1, 0x26]
_081371F8:
	ldrh r0, [r1, 0x2E]
	adds r0, 0x1
	strh r0, [r1, 0x2E]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x3C
	ble _08137218
	adds r0, r1, 0
	bl DestroySprite
	ldr r0, _0813721C
	ldr r1, [r0]
	adds r1, 0x54
	ldrb r0, [r1]
	subs r0, 0x1
	strb r0, [r1]
_08137218:
	pop {r0}
	bx r0
	.align 2, 0
_0813721C: .4byte gUnknown_02039304
	thumb_func_end sub_81371DC

	thumb_func_start unref_sub_8137220
unref_sub_8137220: @ 8137220
	bx lr
	thumb_func_end unref_sub_8137220

	thumb_func_start sub_8137224
sub_8137224: @ 8137224
	ldr r1, _08137250
	ldr r0, _08137254
	ldrb r0, [r0]
	lsls r0, 2
	adds r0, r1
	ldr r1, _08137258
	str r1, [r0]
	ldr r1, _0813725C
	ldr r2, _08137260
	adds r0, r1, r2
	movs r2, 0
	strb r2, [r0]
	ldr r3, _08137264
	adds r0, r1, r3
	strb r2, [r0]
	adds r3, 0x1
	adds r0, r1, r3
	strb r2, [r0]
	ldr r0, _08137268
	adds r1, r0
	strb r2, [r1]
	bx lr
	.align 2, 0
_08137250: .4byte gUnknown_03004330
_08137254: .4byte gUnknown_02024A60
_08137258: .4byte sub_813726C
_0813725C: .4byte 0x02000000
_08137260: .4byte 0x000160a8
_08137264: .4byte 0x000160a9
_08137268: .4byte 0x000160ab
	thumb_func_end sub_8137224

	thumb_func_start sub_813726C
sub_813726C: @ 813726C
	push {lr}
	ldr r2, _081372A0
	ldr r1, _081372A4
	ldr r0, _081372A8
	ldrb r3, [r0]
	lsls r0, r3, 2
	adds r0, r1
	ldr r1, [r2]
	ldr r0, [r0]
	ands r1, r0
	cmp r1, 0
	beq _081372B8
	ldr r0, _081372AC
	lsls r1, r3, 9
	adds r1, r0
	ldrb r0, [r1]
	cmp r0, 0x38
	bhi _081372B4
	ldr r0, _081372B0
	ldrb r1, [r1]
	lsls r1, 2
	adds r1, r0
	ldr r0, [r1]
	bl _call_via_r0
	b _081372B8
	.align 2, 0
_081372A0: .4byte gUnknown_02024A64
_081372A4: .4byte gBitTable
_081372A8: .4byte gUnknown_02024A60
_081372AC: .4byte gUnknown_02023A60
_081372B0: .4byte gUnknown_084061A4
_081372B4:
	bl dp01_tbl5_exec_completed
_081372B8:
	pop {r0}
	bx r0
	thumb_func_end sub_813726C

	thumb_func_start sub_81372BC
sub_81372BC: @ 81372BC
	push {r4-r6,lr}
	ldr r1, _081372D8
	ldr r2, _081372DC
	adds r0, r1, r2
	ldrb r0, [r0]
	adds r5, r1, 0
	cmp r0, 0x5
	bls _081372CE
	b _08137410
_081372CE:
	lsls r0, 2
	ldr r1, _081372E0
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_081372D8: .4byte 0x02000000
_081372DC: .4byte 0x000160a8
_081372E0: .4byte _081372E4
	.align 2, 0
_081372E4:
	.4byte _081372FC
	.4byte _0813730E
	.4byte _08137344
	.4byte _08137368
	.4byte _081373AC
	.4byte _081373E8
_081372FC:
	ldr r0, _0813733C
	adds r1, r5, r0
	movs r0, 0x40
	strb r0, [r1]
	ldr r2, _08137340
	adds r1, r5, r2
	ldrb r0, [r1]
	adds r0, 0x1
	strb r0, [r1]
_0813730E:
	ldr r0, _0813733C
	adds r6, r5, r0
	ldrb r0, [r6]
	subs r0, 0x1
	strb r0, [r6]
	lsls r0, 24
	lsrs r4, r0, 24
	cmp r4, 0
	bne _08137410
	movs r0, 0x5
	bl PlaySE
	movs r0, 0x1
	movs r1, 0
	movs r2, 0
	bl dp01_build_cmdbuf_x21_a_bb
	bl dp01_tbl5_exec_completed
	ldr r2, _08137340
	adds r1, r5, r2
	b _0813738C
	.align 2, 0
_0813733C: .4byte 0x000160aa
_08137340: .4byte 0x000160a8
_08137344:
	ldr r2, _08137364
	adds r6, r5, r2
	ldrb r0, [r6]
	subs r0, 0x1
	strb r0, [r6]
	lsls r0, 24
	lsrs r4, r0, 24
	cmp r4, 0
	bne _08137410
	movs r0, 0x5
	bl PlaySE
	movs r0, 0x1
	movs r1, 0
	b _0813737E
	.align 2, 0
_08137364: .4byte 0x000160aa
_08137368:
	ldr r2, _081373A0
	adds r6, r5, r2
	ldrb r0, [r6]
	subs r0, 0x1
	strb r0, [r6]
	lsls r0, 24
	lsrs r4, r0, 24
	cmp r4, 0
	bne _08137410
	movs r0, 0x1
	movs r1, 0x9
_0813737E:
	movs r2, 0
	bl dp01_build_cmdbuf_x21_a_bb
	bl dp01_tbl5_exec_completed
	ldr r0, _081373A4
	adds r1, r5, r0
_0813738C:
	ldrb r0, [r1]
	adds r0, 0x1
	strb r0, [r1]
	ldr r1, _081373A8
	adds r0, r5, r1
	strb r4, [r0]
	movs r0, 0x40
	strb r0, [r6]
	b _08137410
	.align 2, 0
_081373A0: .4byte 0x000160aa
_081373A4: .4byte 0x000160a8
_081373A8: .4byte 0x000160a9
_081373AC:
	ldr r2, _081373E0
	adds r4, r5, r2
	ldrb r0, [r4]
	subs r0, 0x1
	strb r0, [r4]
	lsls r0, 24
	cmp r0, 0
	bne _08137410
	movs r0, 0x5
	bl PlaySE
	movs r0, 0
	bl nullsub_8
	movs r0, 0x1
	movs r1, 0
	bl sub_802E3E4
	movs r0, 0x40
	strb r0, [r4]
	ldr r0, _081373E4
	adds r1, r5, r0
	ldrb r0, [r1]
	adds r0, 0x1
	strb r0, [r1]
	b _08137410
	.align 2, 0
_081373E0: .4byte 0x000160aa
_081373E4: .4byte 0x000160a8
_081373E8:
	ldr r2, _08137418
	adds r1, r5, r2
	ldrb r0, [r1]
	subs r0, 0x1
	strb r0, [r1]
	lsls r0, 24
	cmp r0, 0
	bne _08137410
	movs r0, 0x5
	bl PlaySE
	bl sub_814A7FC
	movs r0, 0x1
	movs r1, 0x1
	movs r2, 0
	bl dp01_build_cmdbuf_x21_a_bb
	bl dp01_tbl5_exec_completed
_08137410:
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_08137418: .4byte 0x000160aa
	thumb_func_end sub_81372BC

	thumb_func_start sub_813741C
sub_813741C: @ 813741C
	push {lr}
	ldr r2, _08137444
	ldr r1, _08137448
	ldr r0, _0813744C
	ldrb r0, [r0]
	adds r0, r1
	ldrb r1, [r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r2, 0x1C
	adds r0, r2
	ldr r1, [r0]
	ldr r0, _08137450
	cmp r1, r0
	bne _08137440
	bl dp01_tbl5_exec_completed
_08137440:
	pop {r0}
	bx r0
	.align 2, 0
_08137444: .4byte gSprites
_08137448: .4byte gUnknown_02024BE0
_0813744C: .4byte gUnknown_02024A60
_08137450: .4byte SpriteCallbackDummy
	thumb_func_end sub_813741C

	thumb_func_start sub_8137454
sub_8137454: @ 8137454
	push {lr}
	ldr r0, _08137468
	ldrh r0, [r0, 0x16]
	cmp r0, 0
	bne _08137462
	bl dp01_tbl5_exec_completed
_08137462:
	pop {r0}
	bx r0
	.align 2, 0
_08137468: .4byte gUnknown_03004210
	thumb_func_end sub_8137454

	thumb_func_start sub_813746C
sub_813746C: @ 813746C
	push {lr}
	ldr r0, _0813749C
	ldrb r1, [r0, 0x7]
	movs r0, 0x80
	ands r0, r1
	cmp r0, 0
	bne _08137496
	ldr r2, _081374A0
	ldr r0, _081374A4
	adds r3, r2, r0
	ldrb r1, [r3]
	movs r0, 0x3
	negs r0, r0
	ands r0, r1
	strb r0, [r3]
	ldr r0, _081374A8
	ldr r0, [r0]
	str r0, [r2]
	ldr r0, [r2, 0x8]
	bl SetMainCallback2
_08137496:
	pop {r0}
	bx r0
	.align 2, 0
_0813749C: .4byte gPaletteFade
_081374A0: .4byte gMain
_081374A4: .4byte 0x0000043d
_081374A8: .4byte gUnknown_030042D0
	thumb_func_end sub_813746C

	thumb_func_start bx_wait_t5
bx_wait_t5: @ 81374AC
	push {lr}
	ldr r0, _081374C0
	ldrb r0, [r0]
	cmp r0, 0
	bne _081374BA
	bl dp01_tbl5_exec_completed
_081374BA:
	pop {r0}
	bx r0
	.align 2, 0
_081374C0: .4byte gUnknown_02024E6D
	thumb_func_end bx_wait_t5

	thumb_func_start sub_81374C4
sub_81374C4: @ 81374C4
	push {lr}
	ldr r0, _081374EC
	ldrb r1, [r0, 0x7]
	movs r0, 0x80
	ands r0, r1
	cmp r0, 0
	bne _081374E8
	ldr r1, _081374F0
	ldr r0, _081374F4
	ldrb r0, [r0]
	lsls r0, 2
	adds r0, r1
	ldr r1, _081374F8
	str r1, [r0]
	bl nullsub_14
	bl PrepareBagForWallyTutorial
_081374E8:
	pop {r0}
	bx r0
	.align 2, 0
_081374EC: .4byte gPaletteFade
_081374F0: .4byte gUnknown_03004330
_081374F4: .4byte gUnknown_02024A60
_081374F8: .4byte sub_81374FC
	thumb_func_end sub_81374C4

	thumb_func_start sub_81374FC
sub_81374FC: @ 81374FC
	push {lr}
	ldr r0, _08137528
	ldr r1, [r0, 0x4]
	ldr r0, _0813752C
	cmp r1, r0
	bne _08137522
	ldr r0, _08137530
	ldrb r1, [r0, 0x7]
	movs r0, 0x80
	ands r0, r1
	cmp r0, 0
	bne _08137522
	ldr r0, _08137534
	ldrh r1, [r0]
	movs r0, 0x1
	bl dp01_build_cmdbuf_x23_aa_0
	bl dp01_tbl5_exec_completed
_08137522:
	pop {r0}
	bx r0
	.align 2, 0
_08137528: .4byte gMain
_0813752C: .4byte sub_800F808
_08137530: .4byte gPaletteFade
_08137534: .4byte word_203855E
	thumb_func_end sub_81374FC

	thumb_func_start sub_8137538
sub_8137538: @ 8137538
	push {r4-r7,lr}
	ldr r5, _0813768C
	ldrb r2, [r5]
	lsls r3, r2, 1
	adds r0, r3, r2
	lsls r0, 2
	ldr r4, _08137690
	adds r0, r4
	ldrb r1, [r0]
	movs r7, 0x88
	adds r0, r7, 0
	ands r0, r1
	cmp r0, 0
	bne _08137568
	ldr r0, _08137694
	adds r0, r3, r0
	ldrh r1, [r0]
	movs r0, 0x64
	muls r1, r0
	ldr r0, _08137698
	adds r1, r0
	adds r0, r2, 0
	bl sub_8141828
_08137568:
	ldrb r0, [r5]
	movs r6, 0x2
	adds r2, r6, 0
	eors r2, r0
	lsls r3, r2, 1
	adds r0, r3, r2
	lsls r0, 2
	adds r0, r4
	ldrb r1, [r0]
	adds r0, r7, 0
	ands r0, r1
	cmp r0, 0
	bne _08137596
	ldr r0, _08137694
	adds r0, r3, r0
	ldrh r1, [r0]
	movs r0, 0x64
	muls r1, r0
	ldr r0, _08137698
	adds r1, r0
	adds r0, r2, 0
	bl sub_8141828
_08137596:
	ldrb r2, [r5]
	lsls r0, r2, 1
	adds r0, r2
	lsls r0, 2
	adds r0, r4
	ldrb r1, [r0]
	movs r3, 0x8
	adds r0, r3, 0
	ands r0, r1
	cmp r0, 0
	bne _08137684
	adds r1, r6, 0
	eors r1, r2
	lsls r0, r1, 1
	adds r0, r1
	lsls r0, 2
	adds r0, r4
	ldrb r1, [r0]
	adds r0, r3, 0
	ands r0, r1
	cmp r0, 0
	bne _08137684
	bl battle_type_is_double
	lsls r0, 24
	cmp r0, 0
	beq _08137626
	ldr r0, _0813769C
	ldrh r1, [r0]
	movs r0, 0x40
	ands r0, r1
	cmp r0, 0
	bne _08137626
	ldr r1, _081376A0
	ldrb r0, [r5]
	eors r0, r6
	adds r0, r1
	ldrb r1, [r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	ldr r1, _081376A4
	adds r0, r1
	bl DestroySprite
	ldr r4, _081376A8
	ldrb r0, [r5]
	adds r1, r6, 0
	eors r1, r0
	adds r0, r1, r4
	ldrb r0, [r0]
	ldr r2, _08137694
	lsls r1, 1
	adds r1, r2
	ldrh r2, [r1]
	movs r1, 0x64
	muls r1, r2
	ldr r2, _08137698
	adds r1, r2
	movs r2, 0
	bl sub_8045A5C
	ldrb r0, [r5]
	eors r0, r6
	bl sub_804777C
	ldrb r0, [r5]
	eors r0, r6
	adds r0, r4
	ldrb r0, [r0]
	bl sub_8043DFC
_08137626:
	ldr r1, _081376A0
	ldr r4, _0813768C
	ldrb r0, [r4]
	adds r0, r1
	ldrb r1, [r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	ldr r1, _081376A4
	adds r0, r1
	bl DestroySprite
	ldr r5, _081376A8
	ldrb r1, [r4]
	adds r0, r1, r5
	ldrb r0, [r0]
	ldr r2, _08137694
	lsls r1, 1
	adds r1, r2
	ldrh r2, [r1]
	movs r1, 0x64
	muls r1, r2
	ldr r2, _08137698
	adds r1, r2
	movs r2, 0
	bl sub_8045A5C
	ldrb r0, [r4]
	bl sub_804777C
	ldrb r0, [r4]
	adds r0, r5
	ldrb r0, [r0]
	bl sub_8043DFC
	ldr r2, _081376AC
	ldrb r1, [r2, 0x9]
	movs r0, 0x2
	negs r0, r0
	ands r0, r1
	strb r0, [r2, 0x9]
	ldr r1, _081376B0
	ldrb r0, [r4]
	lsls r0, 2
	adds r0, r1
	ldr r1, _081376B4
	str r1, [r0]
_08137684:
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_0813768C: .4byte gUnknown_02024A60
_08137690: .4byte 0x02017810
_08137694: .4byte gUnknown_02024A6A
_08137698: .4byte gPlayerParty
_0813769C: .4byte gUnknown_020239F8
_081376A0: .4byte gUnknown_0300434C
_081376A4: .4byte gSprites
_081376A8: .4byte gUnknown_03004340
_081376AC: .4byte 0x02017840
_081376B0: .4byte gUnknown_03004330
_081376B4: .4byte sub_81376B8
	thumb_func_end sub_8137538

	thumb_func_start sub_81376B8
sub_81376B8: @ 81376B8
	push {r4-r7,lr}
	movs r4, 0
	ldr r2, _0813778C
	ldr r0, _08137790
	ldr r7, _08137794
	ldrb r3, [r7]
	adds r0, r3, r0
	ldrb r1, [r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r2, 0x1C
	adds r0, r2
	ldr r1, [r0]
	ldr r0, _08137798
	cmp r1, r0
	bne _081376DC
	movs r4, 0x1
_081376DC:
	cmp r4, 0
	beq _08137784
	lsls r0, r3, 1
	adds r0, r3
	lsls r0, 2
	ldr r5, _0813779C
	adds r2, r0, r5
	ldrb r1, [r2, 0x1]
	movs r4, 0x1
	adds r0, r4, 0
	ands r0, r1
	cmp r0, 0
	beq _08137784
	movs r6, 0x2
	adds r1, r6, 0
	eors r1, r3
	lsls r0, r1, 1
	adds r0, r1
	lsls r0, 2
	adds r0, r5
	ldrb r1, [r0, 0x1]
	adds r0, r4, 0
	ands r0, r1
	cmp r0, 0
	beq _08137784
	ldrb r1, [r2]
	movs r3, 0x7F
	adds r0, r3, 0
	ands r0, r1
	strb r0, [r2]
	ldrb r0, [r7]
	lsls r1, r0, 1
	adds r1, r0
	lsls r1, 2
	adds r1, r5
	ldrb r2, [r1, 0x1]
	subs r4, 0x3
	adds r0, r4, 0
	ands r0, r2
	strb r0, [r1, 0x1]
	ldrb r0, [r7]
	adds r1, r6, 0
	eors r1, r0
	lsls r0, r1, 1
	adds r0, r1
	lsls r0, 2
	adds r0, r5
	ldrb r1, [r0]
	ands r3, r1
	strb r3, [r0]
	ldrb r0, [r7]
	adds r1, r6, 0
	eors r1, r0
	lsls r0, r1, 1
	adds r0, r1
	lsls r0, 2
	adds r0, r5
	ldrb r1, [r0, 0x1]
	ands r4, r1
	strb r4, [r0, 0x1]
	ldr r4, _081377A0
	adds r0, r4, 0
	bl FreeSpriteTilesByTag
	adds r0, r4, 0
	bl FreeSpritePaletteByTag
	ldr r0, _081377A4
	movs r1, 0xA
	bl CreateTask
	ldr r2, _081377A8
	ldrb r1, [r7]
	lsls r0, r1, 1
	adds r0, r2
	ldrh r2, [r0]
	movs r0, 0x64
	muls r0, r2
	ldr r2, _081377AC
	adds r0, r2
	bl sub_80324F8
	bl dp01_tbl5_exec_completed
_08137784:
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_0813778C: .4byte gSprites
_08137790: .4byte gUnknown_03004340
_08137794: .4byte gUnknown_02024A60
_08137798: .4byte SpriteCallbackDummy
_0813779C: .4byte 0x02017810
_081377A0: .4byte 0x000027f9
_081377A4: .4byte c3_0802FDF4
_081377A8: .4byte gUnknown_02024A6A
_081377AC: .4byte gPlayerParty
	thumb_func_end sub_81376B8

	thumb_func_start sub_81377B0
sub_81377B0: @ 81377B0
	push {r4-r6,lr}
	ldr r5, _081377F0
	ldrb r0, [r5]
	ldr r6, _081377F4
	adds r1, r0, r6
	ldrb r1, [r1]
	movs r2, 0
	movs r3, 0
	bl sub_8045C78
	adds r4, r0, 0
	lsls r4, 16
	lsrs r4, 16
	ldrb r0, [r5]
	adds r0, r6
	ldrb r0, [r0]
	bl sub_8043DFC
	lsls r4, 16
	asrs r1, r4, 16
	movs r0, 0x1
	negs r0, r0
	cmp r1, r0
	beq _081377F8
	ldrb r0, [r5]
	adds r0, r6
	ldrb r0, [r0]
	movs r2, 0
	bl sub_80440EC
	b _08137812
	.align 2, 0
_081377F0: .4byte gUnknown_02024A60
_081377F4: .4byte gUnknown_03004340
_081377F8:
	ldr r2, _08137818
	ldrb r1, [r5]
	lsls r0, r1, 1
	adds r0, r2
	ldrh r2, [r0]
	movs r0, 0x64
	muls r0, r2
	ldr r2, _0813781C
	adds r0, r2
	bl sub_80324F8
	bl dp01_tbl5_exec_completed
_08137812:
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_08137818: .4byte gUnknown_02024A6A
_0813781C: .4byte gPlayerParty
	thumb_func_end sub_81377B0

	thumb_func_start bx_blink_t5
bx_blink_t5: @ 8137820
	push {r4,lr}
	ldr r1, _0813785C
	ldr r0, _08137860
	ldrb r0, [r0]
	adds r0, r1
	ldrb r1, [r0]
	ldr r2, _08137864
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r4, r0, r2
	movs r1, 0x30
	ldrsh r0, [r4, r1]
	cmp r0, 0x20
	bne _0813786C
	movs r3, 0
	movs r0, 0
	strh r0, [r4, 0x30]
	adds r2, r4, 0
	adds r2, 0x3E
	ldrb r1, [r2]
	subs r0, 0x5
	ands r0, r1
	strb r0, [r2]
	ldr r0, _08137868
	strb r3, [r0]
	bl dp01_tbl5_exec_completed
	b _08137896
	.align 2, 0
_0813785C: .4byte gUnknown_02024BE0
_08137860: .4byte gUnknown_02024A60
_08137864: .4byte gSprites
_08137868: .4byte gUnknown_02024E6D
_0813786C:
	ldrh r0, [r4, 0x30]
	movs r1, 0x3
	ands r0, r1
	cmp r0, 0
	bne _08137890
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
_08137890:
	ldrh r0, [r4, 0x30]
	adds r0, 0x1
	strh r0, [r4, 0x30]
_08137896:
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end bx_blink_t5

	thumb_func_start sub_813789C
sub_813789C: @ 813789C
	push {r4-r6,lr}
	ldr r6, _081378F4
	ldrb r2, [r6]
	lsls r0, r2, 1
	adds r0, r2
	lsls r0, 2
	ldr r1, _081378F8
	adds r0, r1
	ldrb r1, [r0]
	movs r0, 0x40
	ands r0, r1
	cmp r0, 0
	bne _081378EC
	ldr r5, _081378FC
	adds r0, r2, r5
	ldrb r1, [r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	ldr r4, _08137900
	adds r0, r4
	bl FreeSpriteOamMatrix
	ldrb r0, [r6]
	adds r0, r5
	ldrb r1, [r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r4
	bl DestroySprite
	ldr r1, _08137904
	ldrb r0, [r6]
	adds r0, r1
	ldrb r0, [r0]
	bl sub_8043DB0
	bl dp01_tbl5_exec_completed
_081378EC:
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_081378F4: .4byte gUnknown_02024A60
_081378F8: .4byte 0x02017810
_081378FC: .4byte gUnknown_02024BE0
_08137900: .4byte gSprites
_08137904: .4byte gUnknown_03004340
	thumb_func_end sub_813789C

	thumb_func_start sub_8137908
sub_8137908: @ 8137908
	push {lr}
	ldr r2, _08137930
	ldr r1, _08137934
	ldr r0, _08137938
	ldrb r0, [r0]
	adds r0, r1
	ldrb r1, [r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r2, 0x1C
	adds r0, r2
	ldr r1, [r0]
	ldr r0, _0813793C
	cmp r1, r0
	bne _0813792C
	bl dp01_tbl5_exec_completed
_0813792C:
	pop {r0}
	bx r0
	.align 2, 0
_08137930: .4byte gSprites
_08137934: .4byte gUnknown_02024BE0
_08137938: .4byte gUnknown_02024A60
_0813793C: .4byte SpriteCallbackDummy
	thumb_func_end sub_8137908

	thumb_func_start sub_8137940
sub_8137940: @ 8137940
	push {lr}
	ldr r0, _08137964
	ldrb r1, [r0]
	lsls r0, r1, 1
	adds r0, r1
	lsls r0, 2
	ldr r1, _08137968
	adds r0, r1
	ldrb r1, [r0]
	movs r0, 0x20
	ands r0, r1
	cmp r0, 0
	bne _0813795E
	bl dp01_tbl5_exec_completed
_0813795E:
	pop {r0}
	bx r0
	.align 2, 0
_08137964: .4byte gUnknown_02024A60
_08137968: .4byte 0x02017810
	thumb_func_end sub_8137940

	thumb_func_start dp01_tbl5_exec_completed
dp01_tbl5_exec_completed: @ 813796C
	push {r4,lr}
	sub sp, 0x4
	ldr r1, _081379AC
	ldr r4, _081379B0
	ldrb r0, [r4]
	lsls r0, 2
	adds r0, r1
	ldr r1, _081379B4
	str r1, [r0]
	ldr r0, _081379B8
	ldrh r1, [r0]
	movs r0, 0x2
	ands r0, r1
	cmp r0, 0
	beq _081379C0
	bl GetMultiplayerId
	mov r1, sp
	strb r0, [r1]
	movs r0, 0x2
	movs r1, 0x4
	mov r2, sp
	bl dp01_prepare_buffer_wireless_probably
	ldr r1, _081379BC
	ldrb r0, [r4]
	lsls r0, 9
	adds r0, r1
	movs r1, 0x38
	strb r1, [r0]
	b _081379D2
	.align 2, 0
_081379AC: .4byte gUnknown_03004330
_081379B0: .4byte gUnknown_02024A60
_081379B4: .4byte sub_813726C
_081379B8: .4byte gUnknown_020239F8
_081379BC: .4byte gUnknown_02023A60
_081379C0:
	ldr r2, _081379DC
	ldr r1, _081379E0
	ldrb r0, [r4]
	lsls r0, 2
	adds r0, r1
	ldr r1, [r0]
	ldr r0, [r2]
	bics r0, r1
	str r0, [r2]
_081379D2:
	add sp, 0x4
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_081379DC: .4byte gUnknown_02024A64
_081379E0: .4byte gBitTable
	thumb_func_end dp01_tbl5_exec_completed

	thumb_func_start unref_sub_81379E4
unref_sub_81379E4: @ 81379E4
	push {lr}
	ldr r0, _08137A08
	ldrb r1, [r0]
	lsls r0, r1, 1
	adds r0, r1
	lsls r0, 2
	ldr r1, _08137A0C
	adds r0, r1
	ldrb r1, [r0]
	movs r0, 0x10
	ands r0, r1
	cmp r0, 0
	bne _08137A02
	bl dp01_tbl5_exec_completed
_08137A02:
	pop {r0}
	bx r0
	.align 2, 0
_08137A08: .4byte gUnknown_02024A60
_08137A0C: .4byte 0x02017810
	thumb_func_end unref_sub_81379E4

	thumb_func_start dp01t_00_5_getattr
dp01t_00_5_getattr: @ 8137A10
	push {r4-r6,lr}
	sub sp, 0x100
	movs r6, 0
	ldr r1, _08137A3C
	ldr r0, _08137A40
	ldrb r2, [r0]
	lsls r0, r2, 9
	adds r1, 0x2
	adds r1, r0, r1
	ldrb r0, [r1]
	cmp r0, 0
	bne _08137A48
	ldr r0, _08137A44
	lsls r1, r2, 1
	adds r1, r0
	ldrb r0, [r1]
	mov r1, sp
	bl sub_8137A84
	adds r6, r0, 0
	b _08137A6A
	.align 2, 0
_08137A3C: .4byte gUnknown_02023A60
_08137A40: .4byte gUnknown_02024A60
_08137A44: .4byte gUnknown_02024A6A
_08137A48:
	ldrb r4, [r1]
	movs r5, 0
_08137A4C:
	movs r0, 0x1
	ands r0, r4
	cmp r0, 0
	beq _08137A62
	lsls r0, r5, 24
	lsrs r0, 24
	mov r2, sp
	adds r1, r2, r6
	bl sub_8137A84
	adds r6, r0
_08137A62:
	lsrs r4, 1
	adds r5, 0x1
	cmp r5, 0x5
	ble _08137A4C
_08137A6A:
	lsls r1, r6, 16
	lsrs r1, 16
	movs r0, 0x1
	mov r2, sp
	bl dp01_build_cmdbuf_x1D_1D_numargs_varargs
	bl dp01_tbl5_exec_completed
	add sp, 0x100
	pop {r4-r6}
	pop {r0}
	bx r0
	thumb_func_end dp01t_00_5_getattr

	thumb_func_start sub_8137A84
sub_8137A84: @ 8137A84
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	sub sp, 0x90
	adds r7, r1, 0
	lsls r0, 24
	lsrs r5, r0, 24
	movs r6, 0
	ldr r2, _08137AB8
	ldr r3, _08137ABC
	ldrb r0, [r3]
	lsls r0, 9
	adds r1, r2, 0x1
	adds r0, r1
	ldrb r0, [r0]
	cmp r0, 0x3B
	bls _08137AAE
	bl _0813821A
_08137AAE:
	lsls r0, 2
	ldr r1, _08137AC0
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_08137AB8: .4byte gUnknown_02023A60
_08137ABC: .4byte gUnknown_02024A60
_08137AC0: .4byte _08137AC4
	.align 2, 0
_08137AC4:
	.4byte _08137BB4
	.4byte _08137DD8
	.4byte _08137DE8
	.4byte _08137DF8
	.4byte _08137E60
	.4byte _08137E60
	.4byte _08137E60
	.4byte _08137E60
	.4byte _08137E7C
	.4byte _08137EB8
	.4byte _08137EB8
	.4byte _08137EB8
	.4byte _08137EB8
	.4byte _0813821A
	.4byte _0813821A
	.4byte _0813821A
	.4byte _0813821A
	.4byte _08137ED4
	.4byte _08137EE4
	.4byte _08137F14
	.4byte _08137F24
	.4byte _08137F34
	.4byte _08137F44
	.4byte _08137F54
	.4byte _08137F64
	.4byte _08137F74
	.4byte _08137F84
	.4byte _08137F94
	.4byte _08137FA4
	.4byte _08137FB4
	.4byte _08137FC4
	.4byte _08137FD4
	.4byte _08138024
	.4byte _08138034
	.4byte _08138044
	.4byte _08138054
	.4byte _08138064
	.4byte _08138074
	.4byte _08138084
	.4byte _08138094
	.4byte _081380A4
	.4byte _081380D8
	.4byte _081380E8
	.4byte _081380F8
	.4byte _08138108
	.4byte _08138118
	.4byte _08138128
	.4byte _08138138
	.4byte _08138148
	.4byte _08138168
	.4byte _08138178
	.4byte _08138188
	.4byte _08138198
	.4byte _081381A8
	.4byte _081381B8
	.4byte _081381C8
	.4byte _081381D8
	.4byte _081381E8
	.4byte _081381F8
	.4byte _08138208
_08137BB4:
	movs r0, 0x64
	adds r4, r5, 0
	muls r4, r0
	ldr r0, _08137DC8
	adds r4, r0
	adds r0, r4, 0
	movs r1, 0xB
	bl GetMonData
	mov r1, sp
	strh r0, [r1]
	adds r0, r4, 0
	movs r1, 0xC
	bl GetMonData
	mov r1, sp
	strh r0, [r1, 0x2E]
	movs r6, 0
	add r0, sp, 0x24
	mov r9, r0
	movs r1, 0x3B
	add r1, sp
	mov r10, r1
	mov r2, sp
	adds r2, 0x2B
	str r2, [sp, 0x80]
	mov r0, sp
	adds r0, 0x2A
	str r0, [sp, 0x7C]
	mov r1, sp
	adds r1, 0x68
	str r1, [sp, 0x8C]
	adds r2, 0x5
	str r2, [sp, 0x84]
	adds r0, 0x12
	str r0, [sp, 0x88]
	mov r8, r4
	add r4, sp, 0xC
_08137C00:
	adds r1, r6, 0
	adds r1, 0xD
	mov r0, r8
	bl GetMonData
	strh r0, [r4]
	adds r1, r6, 0
	adds r1, 0x11
	mov r0, r8
	bl GetMonData
	mov r2, r9
	adds r1, r2, r6
	strb r0, [r1]
	adds r4, 0x2
	adds r6, 0x1
	cmp r6, 0x3
	ble _08137C00
	movs r0, 0x64
	adds r4, r5, 0
	muls r4, r0
	ldr r0, _08137DC8
	adds r4, r0
	adds r0, r4, 0
	movs r1, 0x15
	bl GetMonData
	mov r1, r10
	strb r0, [r1]
	adds r0, r4, 0
	movs r1, 0x20
	bl GetMonData
	ldr r2, [sp, 0x80]
	strb r0, [r2]
	adds r0, r4, 0
	movs r1, 0x19
	bl GetMonData
	str r0, [sp, 0x44]
	adds r0, r4, 0
	movs r1, 0x27
	bl GetMonData
	mov r3, sp
	movs r5, 0x1F
	ands r0, r5
	ldrb r2, [r3, 0x14]
	movs r1, 0x20
	negs r1, r1
	ands r1, r2
	orrs r1, r0
	strb r1, [r3, 0x14]
	adds r0, r4, 0
	movs r1, 0x28
	bl GetMonData
	mov r3, sp
	movs r6, 0x1F
	ands r0, r6
	lsls r0, 5
	ldrh r2, [r3, 0x14]
	ldr r1, _08137DCC
	ands r1, r2
	orrs r1, r0
	strh r1, [r3, 0x14]
	adds r0, r4, 0
	movs r1, 0x29
	bl GetMonData
	mov r3, sp
	ands r0, r5
	lsls r0, 2
	ldrb r2, [r3, 0x15]
	movs r1, 0x7D
	negs r1, r1
	ands r1, r2
	orrs r1, r0
	strb r1, [r3, 0x15]
	adds r0, r4, 0
	movs r1, 0x2A
	bl GetMonData
	movs r1, 0x1F
	ands r1, r0
	lsls r1, 15
	ldr r0, [sp, 0x14]
	ldr r2, _08137DD0
	ands r0, r2
	orrs r0, r1
	str r0, [sp, 0x14]
	adds r0, r4, 0
	movs r1, 0x2B
	bl GetMonData
	mov r3, sp
	ands r0, r6
	lsls r0, 4
	ldrh r2, [r3, 0x16]
	ldr r1, _08137DD4
	ands r1, r2
	orrs r1, r0
	strh r1, [r3, 0x16]
	adds r0, r4, 0
	movs r1, 0x2C
	bl GetMonData
	mov r3, sp
	ands r0, r5
	lsls r0, 1
	ldrb r2, [r3, 0x17]
	movs r1, 0x3F
	negs r1, r1
	ands r1, r2
	orrs r1, r0
	strb r1, [r3, 0x17]
	adds r0, r4, 0
	movs r1, 0
	bl GetMonData
	str r0, [sp, 0x48]
	adds r0, r4, 0
	movs r1, 0x37
	bl GetMonData
	str r0, [sp, 0x4C]
	adds r0, r4, 0
	movs r1, 0x38
	bl GetMonData
	ldr r1, [sp, 0x7C]
	strb r0, [r1]
	adds r0, r4, 0
	movs r1, 0x39
	bl GetMonData
	mov r1, sp
	strh r0, [r1, 0x28]
	adds r0, r4, 0
	movs r1, 0x3A
	bl GetMonData
	mov r1, sp
	strh r0, [r1, 0x2C]
	adds r0, r4, 0
	movs r1, 0x3B
	bl GetMonData
	mov r1, sp
	strh r0, [r1, 0x2]
	adds r0, r4, 0
	movs r1, 0x3C
	bl GetMonData
	mov r1, sp
	strh r0, [r1, 0x4]
	adds r0, r4, 0
	movs r1, 0x3D
	bl GetMonData
	mov r1, sp
	strh r0, [r1, 0x6]
	adds r0, r4, 0
	movs r1, 0x3E
	bl GetMonData
	mov r1, sp
	strh r0, [r1, 0x8]
	adds r0, r4, 0
	movs r1, 0x3F
	bl GetMonData
	mov r1, sp
	strh r0, [r1, 0xA]
	adds r0, r4, 0
	movs r1, 0x2D
	bl GetMonData
	mov r3, sp
	movs r1, 0x1
	ands r0, r1
	lsls r0, 6
	ldrb r2, [r3, 0x17]
	movs r1, 0x41
	negs r1, r1
	ands r1, r2
	orrs r1, r0
	strb r1, [r3, 0x17]
	adds r0, r4, 0
	movs r1, 0x2E
	bl GetMonData
	mov r3, sp
	lsls r0, 7
	ldrb r2, [r3, 0x17]
	movs r1, 0x7F
	ands r1, r2
	orrs r1, r0
	strb r1, [r3, 0x17]
	adds r0, r4, 0
	movs r1, 0x1
	bl GetMonData
	str r0, [sp, 0x54]
	adds r0, r4, 0
	movs r1, 0x2
	ldr r2, [sp, 0x8C]
	bl GetMonData
	ldr r0, [sp, 0x84]
	ldr r1, [sp, 0x8C]
	bl StringCopy10
	adds r0, r4, 0
	movs r1, 0x7
	ldr r2, [sp, 0x88]
	bl GetMonData
	mov r2, sp
	movs r6, 0
_08137DB8:
	adds r0, r7, r6
	adds r1, r2, r6
	ldrb r1, [r1]
	strb r1, [r0]
	adds r6, 0x1
	cmp r6, 0x57
	bls _08137DB8
	b _0813821A
	.align 2, 0
_08137DC8: .4byte gPlayerParty
_08137DCC: .4byte 0xfffffc1f
_08137DD0: .4byte 0xfff07fff
_08137DD4: .4byte 0xfffffe0f
_08137DD8:
	movs r0, 0x64
	muls r0, r5
	ldr r1, _08137DE4
	adds r0, r1
	movs r1, 0xB
	b _08138152
	.align 2, 0
_08137DE4: .4byte gPlayerParty
_08137DE8:
	movs r0, 0x64
	muls r0, r5
	ldr r1, _08137DF4
	adds r0, r1
	movs r1, 0xC
	b _08138152
	.align 2, 0
_08137DF4: .4byte gPlayerParty
_08137DF8:
	movs r6, 0
	add r2, sp, 0x58
	mov r9, r2
	add r0, sp, 0x60
	mov r10, r0
	movs r0, 0x64
	adds r1, r5, 0
	muls r1, r0
	ldr r0, _08137E5C
	adds r4, r1, r0
	mov r8, r9
_08137E0E:
	adds r1, r6, 0
	adds r1, 0xD
	adds r0, r4, 0
	bl GetMonData
	mov r1, r8
	strh r0, [r1]
	adds r1, r6, 0
	adds r1, 0x11
	adds r0, r4, 0
	bl GetMonData
	mov r2, r10
	adds r1, r2, r6
	strb r0, [r1]
	movs r0, 0x2
	add r8, r0
	adds r6, 0x1
	cmp r6, 0x3
	ble _08137E0E
	movs r0, 0x64
	muls r0, r5
	ldr r1, _08137E5C
	adds r0, r1
	movs r1, 0x15
	bl GetMonData
	mov r1, r9
	strb r0, [r1, 0xC]
	mov r2, r9
	movs r6, 0
_08137E4C:
	adds r0, r7, r6
	adds r1, r2, r6
	ldrb r1, [r1]
	strb r1, [r0]
	adds r6, 0x1
	cmp r6, 0xF
	bls _08137E4C
	b _0813821A
	.align 2, 0
_08137E5C: .4byte gPlayerParty
_08137E60:
	movs r0, 0x64
	muls r0, r5
	ldr r1, _08137E78
	adds r0, r1
	ldrb r1, [r3]
	lsls r1, 9
	adds r2, 0x1
	adds r1, r2
	ldrb r1, [r1]
	adds r1, 0x9
	b _08138152
	.align 2, 0
_08137E78: .4byte gPlayerParty
_08137E7C:
	movs r6, 0
	movs r0, 0x64
	adds r4, r5, 0
	muls r4, r0
	ldr r2, _08137EB4
	mov r8, r2
_08137E88:
	adds r1, r6, 0
	adds r1, 0x11
	mov r2, r8
	adds r0, r4, r2
	bl GetMonData
	adds r1, r7, r6
	strb r0, [r1]
	adds r6, 0x1
	cmp r6, 0x3
	ble _08137E88
	movs r0, 0x64
	muls r0, r5
	ldr r1, _08137EB4
	adds r0, r1
	movs r1, 0x15
	bl GetMonData
	adds r1, r7, r6
	strb r0, [r1]
	adds r6, 0x1
	b _0813821A
	.align 2, 0
_08137EB4: .4byte gPlayerParty
_08137EB8:
	movs r0, 0x64
	muls r0, r5
	ldr r1, _08137ED0
	adds r0, r1
	ldrb r1, [r3]
	lsls r1, 9
	adds r2, 0x1
	adds r1, r2
	ldrb r1, [r1]
	adds r1, 0x8
	b _08138212
	.align 2, 0
_08137ED0: .4byte gPlayerParty
_08137ED4:
	movs r0, 0x64
	muls r0, r5
	ldr r1, _08137EE0
	adds r0, r1
	movs r1, 0x1
	b _08137EEE
	.align 2, 0
_08137EE0: .4byte gPlayerParty
_08137EE4:
	movs r0, 0x64
	muls r0, r5
	ldr r1, _08137F10
	adds r0, r1
	movs r1, 0x19
_08137EEE:
	bl GetMonData
	adds r1, r0, 0
	strb r1, [r7]
	movs r0, 0xFF
	lsls r0, 8
	ands r0, r1
	lsrs r0, 8
	strb r0, [r7, 0x1]
	movs r0, 0xFF
	lsls r0, 16
	ands r0, r1
	lsrs r0, 16
	strb r0, [r7, 0x2]
	movs r6, 0x3
	b _0813821A
	.align 2, 0
_08137F10: .4byte gPlayerParty
_08137F14:
	movs r0, 0x64
	muls r0, r5
	ldr r1, _08137F20
	adds r0, r1
	movs r1, 0x1A
	b _08138212
	.align 2, 0
_08137F20: .4byte gPlayerParty
_08137F24:
	movs r0, 0x64
	muls r0, r5
	ldr r1, _08137F30
	adds r0, r1
	movs r1, 0x1B
	b _08138212
	.align 2, 0
_08137F30: .4byte gPlayerParty
_08137F34:
	movs r0, 0x64
	muls r0, r5
	ldr r1, _08137F40
	adds r0, r1
	movs r1, 0x1C
	b _08138212
	.align 2, 0
_08137F40: .4byte gPlayerParty
_08137F44:
	movs r0, 0x64
	muls r0, r5
	ldr r1, _08137F50
	adds r0, r1
	movs r1, 0x1D
	b _08138212
	.align 2, 0
_08137F50: .4byte gPlayerParty
_08137F54:
	movs r0, 0x64
	muls r0, r5
	ldr r1, _08137F60
	adds r0, r1
	movs r1, 0x1E
	b _08138212
	.align 2, 0
_08137F60: .4byte gPlayerParty
_08137F64:
	movs r0, 0x64
	muls r0, r5
	ldr r1, _08137F70
	adds r0, r1
	movs r1, 0x1F
	b _08138212
	.align 2, 0
_08137F70: .4byte gPlayerParty
_08137F74:
	movs r0, 0x64
	muls r0, r5
	ldr r1, _08137F80
	adds r0, r1
	movs r1, 0x20
	b _08138212
	.align 2, 0
_08137F80: .4byte gPlayerParty
_08137F84:
	movs r0, 0x64
	muls r0, r5
	ldr r1, _08137F90
	adds r0, r1
	movs r1, 0x22
	b _08138212
	.align 2, 0
_08137F90: .4byte gPlayerParty
_08137F94:
	movs r0, 0x64
	muls r0, r5
	ldr r1, _08137FA0
	adds r0, r1
	movs r1, 0x23
	b _08138212
	.align 2, 0
_08137FA0: .4byte gPlayerParty
_08137FA4:
	movs r0, 0x64
	muls r0, r5
	ldr r1, _08137FB0
	adds r0, r1
	movs r1, 0x24
	b _08138212
	.align 2, 0
_08137FB0: .4byte gPlayerParty
_08137FB4:
	movs r0, 0x64
	muls r0, r5
	ldr r1, _08137FC0
	adds r0, r1
	movs r1, 0x25
	b _08138212
	.align 2, 0
_08137FC0: .4byte gPlayerParty
_08137FC4:
	movs r0, 0x64
	muls r0, r5
	ldr r1, _08137FD0
	adds r0, r1
	movs r1, 0x26
	b _08138212
	.align 2, 0
_08137FD0: .4byte gPlayerParty
_08137FD4:
	movs r0, 0x64
	adds r4, r5, 0
	muls r4, r0
	ldr r0, _08138020
	adds r4, r0
	adds r0, r4, 0
	movs r1, 0x27
	bl GetMonData
	strb r0, [r7]
	adds r0, r4, 0
	movs r1, 0x28
	bl GetMonData
	strb r0, [r7, 0x1]
	adds r0, r4, 0
	movs r1, 0x29
	bl GetMonData
	strb r0, [r7, 0x2]
	adds r0, r4, 0
	movs r1, 0x2A
	bl GetMonData
	strb r0, [r7, 0x3]
	adds r0, r4, 0
	movs r1, 0x2B
	bl GetMonData
	strb r0, [r7, 0x4]
	adds r0, r4, 0
	movs r1, 0x2C
	bl GetMonData
	strb r0, [r7, 0x5]
	movs r6, 0x6
	b _0813821A
	.align 2, 0
_08138020: .4byte gPlayerParty
_08138024:
	movs r0, 0x64
	muls r0, r5
	ldr r1, _08138030
	adds r0, r1
	movs r1, 0x27
	b _08138212
	.align 2, 0
_08138030: .4byte gPlayerParty
_08138034:
	movs r0, 0x64
	muls r0, r5
	ldr r1, _08138040
	adds r0, r1
	movs r1, 0x28
	b _08138212
	.align 2, 0
_08138040: .4byte gPlayerParty
_08138044:
	movs r0, 0x64
	muls r0, r5
	ldr r1, _08138050
	adds r0, r1
	movs r1, 0x29
	b _08138212
	.align 2, 0
_08138050: .4byte gPlayerParty
_08138054:
	movs r0, 0x64
	muls r0, r5
	ldr r1, _08138060
	adds r0, r1
	movs r1, 0x2A
	b _08138212
	.align 2, 0
_08138060: .4byte gPlayerParty
_08138064:
	movs r0, 0x64
	muls r0, r5
	ldr r1, _08138070
	adds r0, r1
	movs r1, 0x2B
	b _08138212
	.align 2, 0
_08138070: .4byte gPlayerParty
_08138074:
	movs r0, 0x64
	muls r0, r5
	ldr r1, _08138080
	adds r0, r1
	movs r1, 0x2C
	b _08138212
	.align 2, 0
_08138080: .4byte gPlayerParty
_08138084:
	movs r0, 0x64
	muls r0, r5
	ldr r1, _08138090
	adds r0, r1
	movs r1, 0
	b _081380AE
	.align 2, 0
_08138090: .4byte gPlayerParty
_08138094:
	movs r0, 0x64
	muls r0, r5
	ldr r1, _081380A0
	adds r0, r1
	movs r1, 0x9
	b _08138152
	.align 2, 0
_081380A0: .4byte gPlayerParty
_081380A4:
	movs r0, 0x64
	muls r0, r5
	ldr r1, _081380D4
	adds r0, r1
	movs r1, 0x37
_081380AE:
	bl GetMonData
	adds r1, r0, 0
	strb r1, [r7]
	movs r0, 0xFF
	lsls r0, 8
	ands r0, r1
	lsrs r0, 8
	strb r0, [r7, 0x1]
	movs r0, 0xFF
	lsls r0, 16
	ands r0, r1
	lsrs r0, 16
	strb r0, [r7, 0x2]
	lsrs r0, r1, 24
	strb r0, [r7, 0x3]
	movs r6, 0x4
	b _0813821A
	.align 2, 0
_081380D4: .4byte gPlayerParty
_081380D8:
	movs r0, 0x64
	muls r0, r5
	ldr r1, _081380E4
	adds r0, r1
	movs r1, 0x38
	b _08138212
	.align 2, 0
_081380E4: .4byte gPlayerParty
_081380E8:
	movs r0, 0x64
	muls r0, r5
	ldr r1, _081380F4
	adds r0, r1
	movs r1, 0x39
	b _08138152
	.align 2, 0
_081380F4: .4byte gPlayerParty
_081380F8:
	movs r0, 0x64
	muls r0, r5
	ldr r1, _08138104
	adds r0, r1
	movs r1, 0x3A
	b _08138152
	.align 2, 0
_08138104: .4byte gPlayerParty
_08138108:
	movs r0, 0x64
	muls r0, r5
	ldr r1, _08138114
	adds r0, r1
	movs r1, 0x3B
	b _08138152
	.align 2, 0
_08138114: .4byte gPlayerParty
_08138118:
	movs r0, 0x64
	muls r0, r5
	ldr r1, _08138124
	adds r0, r1
	movs r1, 0x3C
	b _08138152
	.align 2, 0
_08138124: .4byte gPlayerParty
_08138128:
	movs r0, 0x64
	muls r0, r5
	ldr r1, _08138134
	adds r0, r1
	movs r1, 0x3D
	b _08138152
	.align 2, 0
_08138134: .4byte gPlayerParty
_08138138:
	movs r0, 0x64
	muls r0, r5
	ldr r1, _08138144
	adds r0, r1
	movs r1, 0x3E
	b _08138152
	.align 2, 0
_08138144: .4byte gPlayerParty
_08138148:
	movs r0, 0x64
	muls r0, r5
	ldr r1, _08138164
	adds r0, r1
	movs r1, 0x3F
_08138152:
	bl GetMonData
	lsls r0, 16
	lsrs r0, 16
	strb r0, [r7]
	lsrs r0, 8
	strb r0, [r7, 0x1]
	movs r6, 0x2
	b _0813821A
	.align 2, 0
_08138164: .4byte gPlayerParty
_08138168:
	movs r0, 0x64
	muls r0, r5
	ldr r1, _08138174
	adds r0, r1
	movs r1, 0x16
	b _08138212
	.align 2, 0
_08138174: .4byte gPlayerParty
_08138178:
	movs r0, 0x64
	muls r0, r5
	ldr r1, _08138184
	adds r0, r1
	movs r1, 0x17
	b _08138212
	.align 2, 0
_08138184: .4byte gPlayerParty
_08138188:
	movs r0, 0x64
	muls r0, r5
	ldr r1, _08138194
	adds r0, r1
	movs r1, 0x18
	b _08138212
	.align 2, 0
_08138194: .4byte gPlayerParty
_08138198:
	movs r0, 0x64
	muls r0, r5
	ldr r1, _081381A4
	adds r0, r1
	movs r1, 0x21
	b _08138212
	.align 2, 0
_081381A4: .4byte gPlayerParty
_081381A8:
	movs r0, 0x64
	muls r0, r5
	ldr r1, _081381B4
	adds r0, r1
	movs r1, 0x2F
	b _08138212
	.align 2, 0
_081381B4: .4byte gPlayerParty
_081381B8:
	movs r0, 0x64
	muls r0, r5
	ldr r1, _081381C4
	adds r0, r1
	movs r1, 0x30
	b _08138212
	.align 2, 0
_081381C4: .4byte gPlayerParty
_081381C8:
	movs r0, 0x64
	muls r0, r5
	ldr r1, _081381D4
	adds r0, r1
	movs r1, 0x32
	b _08138212
	.align 2, 0
_081381D4: .4byte gPlayerParty
_081381D8:
	movs r0, 0x64
	muls r0, r5
	ldr r1, _081381E4
	adds r0, r1
	movs r1, 0x33
	b _08138212
	.align 2, 0
_081381E4: .4byte gPlayerParty
_081381E8:
	movs r0, 0x64
	muls r0, r5
	ldr r1, _081381F4
	adds r0, r1
	movs r1, 0x34
	b _08138212
	.align 2, 0
_081381F4: .4byte gPlayerParty
_081381F8:
	movs r0, 0x64
	muls r0, r5
	ldr r1, _08138204
	adds r0, r1
	movs r1, 0x35
	b _08138212
	.align 2, 0
_08138204: .4byte gPlayerParty
_08138208:
	movs r0, 0x64
	muls r0, r5
	ldr r1, _0813822C
	adds r0, r1
	movs r1, 0x36
_08138212:
	bl GetMonData
	strb r0, [r7]
	movs r6, 0x1
_0813821A:
	adds r0, r6, 0
	add sp, 0x90
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r1}
	bx r1
	.align 2, 0
_0813822C: .4byte gPlayerParty
	thumb_func_end sub_8137A84

	thumb_func_start sub_8138230
sub_8138230: @ 8138230
	push {lr}
	bl sub_802ECF0
	pop {r0}
	bx r0
	thumb_func_end sub_8138230

	thumb_func_start sub_813823C
sub_813823C: @ 813823C
	push {r4,r5,lr}
	ldr r1, _08138260
	ldr r0, _08138264
	ldrb r2, [r0]
	lsls r0, r2, 9
	adds r1, 0x2
	adds r1, r0, r1
	ldrb r0, [r1]
	cmp r0, 0
	bne _0813826C
	ldr r0, _08138268
	lsls r1, r2, 1
	adds r1, r0
	ldrb r0, [r1]
	bl sub_8138294
	b _0813828A
	.align 2, 0
_08138260: .4byte gUnknown_02023A60
_08138264: .4byte gUnknown_02024A60
_08138268: .4byte gUnknown_02024A6A
_0813826C:
	ldrb r4, [r1]
	movs r5, 0
_08138270:
	movs r0, 0x1
	ands r0, r4
	cmp r0, 0
	beq _0813827E
	adds r0, r5, 0
	bl sub_8138294
_0813827E:
	lsrs r4, 1
	adds r0, r5, 0x1
	lsls r0, 24
	lsrs r5, r0, 24
	cmp r5, 0x5
	bls _08138270
_0813828A:
	bl dp01_tbl5_exec_completed
	pop {r4,r5}
	pop {r0}
	bx r0
	thumb_func_end sub_813823C

	thumb_func_start sub_8138294
sub_8138294: @ 8138294
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	sub sp, 0x34
	lsls r0, 24
	lsrs r5, r0, 24
	ldr r0, _081382CC
	ldrb r0, [r0]
	lsls r0, 9
	ldr r2, _081382D0
	adds r3, r0, r2
	adds r6, r3, 0
	subs r1, r2, 0x2
	adds r0, r1
	ldrb r0, [r0]
	adds r7, r2, 0
	cmp r0, 0x3B
	bls _081382C0
	bl _08138C5A
_081382C0:
	lsls r0, 2
	ldr r1, _081382D4
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_081382CC: .4byte gUnknown_02024A60
_081382D0: .4byte gUnknown_02023A63
_081382D4: .4byte _081382D8
	.align 2, 0
_081382D8:
	.4byte _081383C8
	.4byte _08138560
	.4byte _08138580
	.4byte _081385A0
	.4byte _081385F8
	.4byte _081385F8
	.4byte _081385F8
	.4byte _081385F8
	.4byte _08138620
	.4byte _08138684
	.4byte _08138684
	.4byte _08138684
	.4byte _08138684
	.4byte _08138C5A
	.4byte _08138C5A
	.4byte _08138C5A
	.4byte _08138C5A
	.4byte _081386B4
	.4byte _081386D4
	.4byte _081386F4
	.4byte _08138714
	.4byte _08138734
	.4byte _08138754
	.4byte _08138774
	.4byte _08138794
	.4byte _081387B4
	.4byte _081387D4
	.4byte _081387F4
	.4byte _08138814
	.4byte _08138834
	.4byte _08138854
	.4byte _08138874
	.4byte _081388E4
	.4byte _08138904
	.4byte _08138924
	.4byte _08138944
	.4byte _08138964
	.4byte _08138984
	.4byte _081389A4
	.4byte _081389C4
	.4byte _081389E4
	.4byte _08138A04
	.4byte _08138A24
	.4byte _08138A44
	.4byte _08138A64
	.4byte _08138A84
	.4byte _08138AA4
	.4byte _08138AC4
	.4byte _08138AE4
	.4byte _08138B04
	.4byte _08138B24
	.4byte _08138B44
	.4byte _08138B64
	.4byte _08138B84
	.4byte _08138BA4
	.4byte _08138BC4
	.4byte _08138BE4
	.4byte _08138C04
	.4byte _08138C24
	.4byte _08138C44
_081383C8:
	movs r0, 0x64
	adds r4, r5, 0
	muls r4, r0
	ldr r0, _0813855C
	adds r4, r0
	adds r0, r4, 0
	movs r1, 0xB
	adds r2, r6, 0
	bl SetMonData
	adds r2, r6, 0
	adds r2, 0x2E
	adds r0, r4, 0
	movs r1, 0xC
	bl SetMonData
	movs r0, 0
	mov r8, r0
	movs r0, 0x3B
	adds r0, r6
	mov r10, r0
	adds r0, r6, 0
	adds r0, 0x2B
	str r0, [sp, 0x20]
	adds r0, 0x19
	str r0, [sp, 0x28]
	adds r0, 0x4
	str r0, [sp, 0x2C]
	adds r0, 0x4
	str r0, [sp, 0x30]
	subs r0, 0x22
	str r0, [sp, 0x1C]
	subs r0, 0x2
	str r0, [sp, 0x18]
	adds r0, 0x4
	str r0, [sp, 0x24]
	adds r0, r6, 0x2
	str r0, [sp, 0x4]
	adds r0, r6, 0x4
	str r0, [sp, 0x8]
	adds r0, r6, 0x6
	str r0, [sp, 0xC]
	adds r0, 0x2
	str r0, [sp, 0x10]
	adds r0, 0x2
	str r0, [sp, 0x14]
	mov r9, r4
	adds r7, r6, 0
	adds r7, 0x24
	adds r4, r6, 0
	adds r4, 0xC
_0813842E:
	mov r1, r8
	adds r1, 0xD
	mov r0, r9
	adds r2, r4, 0
	bl SetMonData
	mov r1, r8
	adds r1, 0x11
	mov r0, r9
	adds r2, r7, 0
	bl SetMonData
	adds r7, 0x1
	adds r4, 0x2
	movs r0, 0x1
	add r8, r0
	mov r0, r8
	cmp r0, 0x3
	ble _0813842E
	movs r0, 0x64
	adds r4, r5, 0
	muls r4, r0
	ldr r0, _0813855C
	adds r4, r0
	adds r0, r4, 0
	movs r1, 0x15
	mov r2, r10
	bl SetMonData
	adds r0, r4, 0
	movs r1, 0x20
	ldr r2, [sp, 0x20]
	bl SetMonData
	adds r0, r4, 0
	movs r1, 0x19
	ldr r2, [sp, 0x28]
	bl SetMonData
	ldrb r0, [r6, 0x14]
	lsls r0, 27
	lsrs r0, 27
	mov r1, sp
	strb r0, [r1]
	adds r0, r4, 0
	movs r1, 0x27
	mov r2, sp
	bl SetMonData
	mov r1, sp
	ldrh r0, [r6, 0x14]
	lsls r0, 22
	lsrs r0, 27
	strb r0, [r1]
	adds r0, r4, 0
	movs r1, 0x28
	mov r2, sp
	bl SetMonData
	mov r1, sp
	ldrb r0, [r6, 0x15]
	lsls r0, 25
	lsrs r0, 27
	strb r0, [r1]
	adds r0, r4, 0
	movs r1, 0x29
	mov r2, sp
	bl SetMonData
	mov r1, sp
	ldr r0, [r6, 0x14]
	lsls r0, 12
	lsrs r0, 27
	strb r0, [r1]
	adds r0, r4, 0
	movs r1, 0x2A
	mov r2, sp
	bl SetMonData
	mov r1, sp
	ldrh r0, [r6, 0x16]
	lsls r0, 23
	lsrs r0, 27
	strb r0, [r1]
	adds r0, r4, 0
	movs r1, 0x2B
	mov r2, sp
	bl SetMonData
	mov r1, sp
	ldrb r0, [r6, 0x17]
	lsls r0, 26
	lsrs r0, 27
	strb r0, [r1]
	adds r0, r4, 0
	movs r1, 0x2C
	mov r2, sp
	bl SetMonData
	adds r0, r4, 0
	movs r1, 0
	ldr r2, [sp, 0x2C]
	bl SetMonData
	adds r0, r4, 0
	movs r1, 0x37
	ldr r2, [sp, 0x30]
	bl SetMonData
	adds r0, r4, 0
	movs r1, 0x38
	ldr r2, [sp, 0x1C]
	bl SetMonData
	adds r0, r4, 0
	movs r1, 0x39
	ldr r2, [sp, 0x18]
	bl SetMonData
	adds r0, r4, 0
	movs r1, 0x3A
	ldr r2, [sp, 0x24]
	bl SetMonData
	adds r0, r4, 0
	movs r1, 0x3B
	ldr r2, [sp, 0x4]
	bl SetMonData
	adds r0, r4, 0
	movs r1, 0x3C
	ldr r2, [sp, 0x8]
	bl SetMonData
	adds r0, r4, 0
	movs r1, 0x3D
	ldr r2, [sp, 0xC]
	bl SetMonData
	adds r0, r4, 0
	movs r1, 0x3E
	ldr r2, [sp, 0x10]
	bl SetMonData
	adds r0, r4, 0
	movs r1, 0x3F
	ldr r2, [sp, 0x14]
	bl SetMonData
	b _08138C5A
	.align 2, 0
_0813855C: .4byte gPlayerParty
_08138560:
	movs r0, 0x64
	muls r0, r5
	ldr r1, _08138578
	adds r0, r1
	ldr r1, _0813857C
	ldrb r2, [r1]
	lsls r2, 9
	adds r2, r7
	movs r1, 0xB
	bl SetMonData
	b _08138C5A
	.align 2, 0
_08138578: .4byte gPlayerParty
_0813857C: .4byte gUnknown_02024A60
_08138580:
	movs r0, 0x64
	muls r0, r5
	ldr r1, _08138598
	adds r0, r1
	ldr r1, _0813859C
	ldrb r2, [r1]
	lsls r2, 9
	adds r2, r7
	movs r1, 0xC
	bl SetMonData
	b _08138C5A
	.align 2, 0
_08138598: .4byte gPlayerParty
_0813859C: .4byte gUnknown_02024A60
_081385A0:
	movs r0, 0
	mov r8, r0
	movs r0, 0xC
	adds r0, r3
	mov r9, r0
	movs r0, 0x64
	adds r1, r5, 0
	muls r1, r0
	ldr r0, _081385F4
	adds r7, r1, r0
	adds r6, r3, 0
	adds r6, 0x8
	adds r4, r3, 0
_081385BA:
	mov r1, r8
	adds r1, 0xD
	adds r0, r7, 0
	adds r2, r4, 0
	bl SetMonData
	mov r1, r8
	adds r1, 0x11
	adds r0, r7, 0
	adds r2, r6, 0
	bl SetMonData
	adds r6, 0x1
	adds r4, 0x2
	movs r0, 0x1
	add r8, r0
	mov r0, r8
	cmp r0, 0x3
	ble _081385BA
	movs r0, 0x64
	muls r0, r5
	ldr r1, _081385F4
	adds r0, r1
	movs r1, 0x15
	mov r2, r9
	bl SetMonData
	b _08138C5A
	.align 2, 0
_081385F4: .4byte gPlayerParty
_081385F8:
	movs r0, 0x64
	muls r0, r5
	ldr r1, _08138614
	adds r0, r1
	ldr r3, _08138618
	ldr r1, _0813861C
	ldrb r2, [r1]
	lsls r2, 9
	adds r1, r3, 0x1
	adds r1, r2, r1
	ldrb r1, [r1]
	adds r1, 0x9
	b _0813869C
	.align 2, 0
_08138614: .4byte gPlayerParty
_08138618: .4byte gUnknown_02023A60
_0813861C: .4byte gUnknown_02024A60
_08138620:
	movs r0, 0x64
	adds r4, r5, 0
	muls r4, r0
	ldr r0, _0813867C
	adds r4, r0
	ldr r5, _08138680
	ldrb r2, [r5]
	lsls r2, 9
	adds r2, r7
	adds r0, r4, 0
	movs r1, 0x11
	bl SetMonData
	ldrb r2, [r5]
	lsls r2, 9
	adds r0, r7, 0x1
	adds r2, r0
	adds r0, r4, 0
	movs r1, 0x12
	bl SetMonData
	ldrb r2, [r5]
	lsls r2, 9
	adds r0, r7, 0x2
	adds r2, r0
	adds r0, r4, 0
	movs r1, 0x13
	bl SetMonData
	ldrb r2, [r5]
	lsls r2, 9
	adds r0, r7, 0x3
	adds r2, r0
	adds r0, r4, 0
	movs r1, 0x14
	bl SetMonData
	ldrb r2, [r5]
	lsls r2, 9
	adds r0, r7, 0x4
	adds r2, r0
	adds r0, r4, 0
	movs r1, 0x15
	bl SetMonData
	b _08138C5A
	.align 2, 0
_0813867C: .4byte gPlayerParty
_08138680: .4byte gUnknown_02024A60
_08138684:
	movs r0, 0x64
	muls r0, r5
	ldr r1, _081386A8
	adds r0, r1
	ldr r3, _081386AC
	ldr r1, _081386B0
	ldrb r2, [r1]
	lsls r2, 9
	adds r1, r3, 0x1
	adds r1, r2, r1
	ldrb r1, [r1]
	adds r1, 0x8
_0813869C:
	adds r3, 0x3
	adds r2, r3
	bl SetMonData
	b _08138C5A
	.align 2, 0
_081386A8: .4byte gPlayerParty
_081386AC: .4byte gUnknown_02023A60
_081386B0: .4byte gUnknown_02024A60
_081386B4:
	movs r0, 0x64
	muls r0, r5
	ldr r1, _081386CC
	adds r0, r1
	ldr r1, _081386D0
	ldrb r2, [r1]
	lsls r2, 9
	adds r2, r7
	movs r1, 0x1
	bl SetMonData
	b _08138C5A
	.align 2, 0
_081386CC: .4byte gPlayerParty
_081386D0: .4byte gUnknown_02024A60
_081386D4:
	movs r0, 0x64
	muls r0, r5
	ldr r1, _081386EC
	adds r0, r1
	ldr r1, _081386F0
	ldrb r2, [r1]
	lsls r2, 9
	adds r2, r7
	movs r1, 0x19
	bl SetMonData
	b _08138C5A
	.align 2, 0
_081386EC: .4byte gPlayerParty
_081386F0: .4byte gUnknown_02024A60
_081386F4:
	movs r0, 0x64
	muls r0, r5
	ldr r1, _0813870C
	adds r0, r1
	ldr r1, _08138710
	ldrb r2, [r1]
	lsls r2, 9
	adds r2, r7
	movs r1, 0x1A
	bl SetMonData
	b _08138C5A
	.align 2, 0
_0813870C: .4byte gPlayerParty
_08138710: .4byte gUnknown_02024A60
_08138714:
	movs r0, 0x64
	muls r0, r5
	ldr r1, _0813872C
	adds r0, r1
	ldr r1, _08138730
	ldrb r2, [r1]
	lsls r2, 9
	adds r2, r7
	movs r1, 0x1B
	bl SetMonData
	b _08138C5A
	.align 2, 0
_0813872C: .4byte gPlayerParty
_08138730: .4byte gUnknown_02024A60
_08138734:
	movs r0, 0x64
	muls r0, r5
	ldr r1, _0813874C
	adds r0, r1
	ldr r1, _08138750
	ldrb r2, [r1]
	lsls r2, 9
	adds r2, r7
	movs r1, 0x1C
	bl SetMonData
	b _08138C5A
	.align 2, 0
_0813874C: .4byte gPlayerParty
_08138750: .4byte gUnknown_02024A60
_08138754:
	movs r0, 0x64
	muls r0, r5
	ldr r1, _0813876C
	adds r0, r1
	ldr r1, _08138770
	ldrb r2, [r1]
	lsls r2, 9
	adds r2, r7
	movs r1, 0x1D
	bl SetMonData
	b _08138C5A
	.align 2, 0
_0813876C: .4byte gPlayerParty
_08138770: .4byte gUnknown_02024A60
_08138774:
	movs r0, 0x64
	muls r0, r5
	ldr r1, _0813878C
	adds r0, r1
	ldr r1, _08138790
	ldrb r2, [r1]
	lsls r2, 9
	adds r2, r7
	movs r1, 0x1E
	bl SetMonData
	b _08138C5A
	.align 2, 0
_0813878C: .4byte gPlayerParty
_08138790: .4byte gUnknown_02024A60
_08138794:
	movs r0, 0x64
	muls r0, r5
	ldr r1, _081387AC
	adds r0, r1
	ldr r1, _081387B0
	ldrb r2, [r1]
	lsls r2, 9
	adds r2, r7
	movs r1, 0x1F
	bl SetMonData
	b _08138C5A
	.align 2, 0
_081387AC: .4byte gPlayerParty
_081387B0: .4byte gUnknown_02024A60
_081387B4:
	movs r0, 0x64
	muls r0, r5
	ldr r1, _081387CC
	adds r0, r1
	ldr r1, _081387D0
	ldrb r2, [r1]
	lsls r2, 9
	adds r2, r7
	movs r1, 0x20
	bl SetMonData
	b _08138C5A
	.align 2, 0
_081387CC: .4byte gPlayerParty
_081387D0: .4byte gUnknown_02024A60
_081387D4:
	movs r0, 0x64
	muls r0, r5
	ldr r1, _081387EC
	adds r0, r1
	ldr r1, _081387F0
	ldrb r2, [r1]
	lsls r2, 9
	adds r2, r7
	movs r1, 0x22
	bl SetMonData
	b _08138C5A
	.align 2, 0
_081387EC: .4byte gPlayerParty
_081387F0: .4byte gUnknown_02024A60
_081387F4:
	movs r0, 0x64
	muls r0, r5
	ldr r1, _0813880C
	adds r0, r1
	ldr r1, _08138810
	ldrb r2, [r1]
	lsls r2, 9
	adds r2, r7
	movs r1, 0x23
	bl SetMonData
	b _08138C5A
	.align 2, 0
_0813880C: .4byte gPlayerParty
_08138810: .4byte gUnknown_02024A60
_08138814:
	movs r0, 0x64
	muls r0, r5
	ldr r1, _0813882C
	adds r0, r1
	ldr r1, _08138830
	ldrb r2, [r1]
	lsls r2, 9
	adds r2, r7
	movs r1, 0x24
	bl SetMonData
	b _08138C5A
	.align 2, 0
_0813882C: .4byte gPlayerParty
_08138830: .4byte gUnknown_02024A60
_08138834:
	movs r0, 0x64
	muls r0, r5
	ldr r1, _0813884C
	adds r0, r1
	ldr r1, _08138850
	ldrb r2, [r1]
	lsls r2, 9
	adds r2, r7
	movs r1, 0x25
	bl SetMonData
	b _08138C5A
	.align 2, 0
_0813884C: .4byte gPlayerParty
_08138850: .4byte gUnknown_02024A60
_08138854:
	movs r0, 0x64
	muls r0, r5
	ldr r1, _0813886C
	adds r0, r1
	ldr r1, _08138870
	ldrb r2, [r1]
	lsls r2, 9
	adds r2, r7
	movs r1, 0x26
	bl SetMonData
	b _08138C5A
	.align 2, 0
_0813886C: .4byte gPlayerParty
_08138870: .4byte gUnknown_02024A60
_08138874:
	movs r0, 0x64
	adds r4, r5, 0
	muls r4, r0
	ldr r0, _081388DC
	adds r4, r0
	ldr r5, _081388E0
	ldrb r2, [r5]
	lsls r2, 9
	adds r2, r7
	adds r0, r4, 0
	movs r1, 0x27
	bl SetMonData
	ldrb r2, [r5]
	lsls r2, 9
	adds r0, r7, 0x1
	adds r2, r0
	adds r0, r4, 0
	movs r1, 0x28
	bl SetMonData
	ldrb r2, [r5]
	lsls r2, 9
	adds r0, r7, 0x2
	adds r2, r0
	adds r0, r4, 0
	movs r1, 0x29
	bl SetMonData
	ldrb r2, [r5]
	lsls r2, 9
	adds r0, r7, 0x3
	adds r2, r0
	adds r0, r4, 0
	movs r1, 0x2A
	bl SetMonData
	ldrb r2, [r5]
	lsls r2, 9
	adds r0, r7, 0x4
	adds r2, r0
	adds r0, r4, 0
	movs r1, 0x2B
	bl SetMonData
	ldrb r2, [r5]
	lsls r2, 9
	adds r0, r7, 0x5
	adds r2, r0
	adds r0, r4, 0
	b _08138994
	.align 2, 0
_081388DC: .4byte gPlayerParty
_081388E0: .4byte gUnknown_02024A60
_081388E4:
	movs r0, 0x64
	muls r0, r5
	ldr r1, _081388FC
	adds r0, r1
	ldr r1, _08138900
	ldrb r2, [r1]
	lsls r2, 9
	adds r2, r7
	movs r1, 0x27
	bl SetMonData
	b _08138C5A
	.align 2, 0
_081388FC: .4byte gPlayerParty
_08138900: .4byte gUnknown_02024A60
_08138904:
	movs r0, 0x64
	muls r0, r5
	ldr r1, _0813891C
	adds r0, r1
	ldr r1, _08138920
	ldrb r2, [r1]
	lsls r2, 9
	adds r2, r7
	movs r1, 0x28
	bl SetMonData
	b _08138C5A
	.align 2, 0
_0813891C: .4byte gPlayerParty
_08138920: .4byte gUnknown_02024A60
_08138924:
	movs r0, 0x64
	muls r0, r5
	ldr r1, _0813893C
	adds r0, r1
	ldr r1, _08138940
	ldrb r2, [r1]
	lsls r2, 9
	adds r2, r7
	movs r1, 0x29
	bl SetMonData
	b _08138C5A
	.align 2, 0
_0813893C: .4byte gPlayerParty
_08138940: .4byte gUnknown_02024A60
_08138944:
	movs r0, 0x64
	muls r0, r5
	ldr r1, _0813895C
	adds r0, r1
	ldr r1, _08138960
	ldrb r2, [r1]
	lsls r2, 9
	adds r2, r7
	movs r1, 0x2A
	bl SetMonData
	b _08138C5A
	.align 2, 0
_0813895C: .4byte gPlayerParty
_08138960: .4byte gUnknown_02024A60
_08138964:
	movs r0, 0x64
	muls r0, r5
	ldr r1, _0813897C
	adds r0, r1
	ldr r1, _08138980
	ldrb r2, [r1]
	lsls r2, 9
	adds r2, r7
	movs r1, 0x2B
	bl SetMonData
	b _08138C5A
	.align 2, 0
_0813897C: .4byte gPlayerParty
_08138980: .4byte gUnknown_02024A60
_08138984:
	movs r0, 0x64
	muls r0, r5
	ldr r1, _0813899C
	adds r0, r1
	ldr r1, _081389A0
	ldrb r2, [r1]
	lsls r2, 9
	adds r2, r7
_08138994:
	movs r1, 0x2C
	bl SetMonData
	b _08138C5A
	.align 2, 0
_0813899C: .4byte gPlayerParty
_081389A0: .4byte gUnknown_02024A60
_081389A4:
	movs r0, 0x64
	muls r0, r5
	ldr r1, _081389BC
	adds r0, r1
	ldr r1, _081389C0
	ldrb r2, [r1]
	lsls r2, 9
	adds r2, r7
	movs r1, 0
	bl SetMonData
	b _08138C5A
	.align 2, 0
_081389BC: .4byte gPlayerParty
_081389C0: .4byte gUnknown_02024A60
_081389C4:
	movs r0, 0x64
	muls r0, r5
	ldr r1, _081389DC
	adds r0, r1
	ldr r1, _081389E0
	ldrb r2, [r1]
	lsls r2, 9
	adds r2, r7
	movs r1, 0x9
	bl SetMonData
	b _08138C5A
	.align 2, 0
_081389DC: .4byte gPlayerParty
_081389E0: .4byte gUnknown_02024A60
_081389E4:
	movs r0, 0x64
	muls r0, r5
	ldr r1, _081389FC
	adds r0, r1
	ldr r1, _08138A00
	ldrb r2, [r1]
	lsls r2, 9
	adds r2, r7
	movs r1, 0x37
	bl SetMonData
	b _08138C5A
	.align 2, 0
_081389FC: .4byte gPlayerParty
_08138A00: .4byte gUnknown_02024A60
_08138A04:
	movs r0, 0x64
	muls r0, r5
	ldr r1, _08138A1C
	adds r0, r1
	ldr r1, _08138A20
	ldrb r2, [r1]
	lsls r2, 9
	adds r2, r7
	movs r1, 0x38
	bl SetMonData
	b _08138C5A
	.align 2, 0
_08138A1C: .4byte gPlayerParty
_08138A20: .4byte gUnknown_02024A60
_08138A24:
	movs r0, 0x64
	muls r0, r5
	ldr r1, _08138A3C
	adds r0, r1
	ldr r1, _08138A40
	ldrb r2, [r1]
	lsls r2, 9
	adds r2, r7
	movs r1, 0x39
	bl SetMonData
	b _08138C5A
	.align 2, 0
_08138A3C: .4byte gPlayerParty
_08138A40: .4byte gUnknown_02024A60
_08138A44:
	movs r0, 0x64
	muls r0, r5
	ldr r1, _08138A5C
	adds r0, r1
	ldr r1, _08138A60
	ldrb r2, [r1]
	lsls r2, 9
	adds r2, r7
	movs r1, 0x3A
	bl SetMonData
	b _08138C5A
	.align 2, 0
_08138A5C: .4byte gPlayerParty
_08138A60: .4byte gUnknown_02024A60
_08138A64:
	movs r0, 0x64
	muls r0, r5
	ldr r1, _08138A7C
	adds r0, r1
	ldr r1, _08138A80
	ldrb r2, [r1]
	lsls r2, 9
	adds r2, r7
	movs r1, 0x3B
	bl SetMonData
	b _08138C5A
	.align 2, 0
_08138A7C: .4byte gPlayerParty
_08138A80: .4byte gUnknown_02024A60
_08138A84:
	movs r0, 0x64
	muls r0, r5
	ldr r1, _08138A9C
	adds r0, r1
	ldr r1, _08138AA0
	ldrb r2, [r1]
	lsls r2, 9
	adds r2, r7
	movs r1, 0x3C
	bl SetMonData
	b _08138C5A
	.align 2, 0
_08138A9C: .4byte gPlayerParty
_08138AA0: .4byte gUnknown_02024A60
_08138AA4:
	movs r0, 0x64
	muls r0, r5
	ldr r1, _08138ABC
	adds r0, r1
	ldr r1, _08138AC0
	ldrb r2, [r1]
	lsls r2, 9
	adds r2, r7
	movs r1, 0x3D
	bl SetMonData
	b _08138C5A
	.align 2, 0
_08138ABC: .4byte gPlayerParty
_08138AC0: .4byte gUnknown_02024A60
_08138AC4:
	movs r0, 0x64
	muls r0, r5
	ldr r1, _08138ADC
	adds r0, r1
	ldr r1, _08138AE0
	ldrb r2, [r1]
	lsls r2, 9
	adds r2, r7
	movs r1, 0x3E
	bl SetMonData
	b _08138C5A
	.align 2, 0
_08138ADC: .4byte gPlayerParty
_08138AE0: .4byte gUnknown_02024A60
_08138AE4:
	movs r0, 0x64
	muls r0, r5
	ldr r1, _08138AFC
	adds r0, r1
	ldr r1, _08138B00
	ldrb r2, [r1]
	lsls r2, 9
	adds r2, r7
	movs r1, 0x3F
	bl SetMonData
	b _08138C5A
	.align 2, 0
_08138AFC: .4byte gPlayerParty
_08138B00: .4byte gUnknown_02024A60
_08138B04:
	movs r0, 0x64
	muls r0, r5
	ldr r1, _08138B1C
	adds r0, r1
	ldr r1, _08138B20
	ldrb r2, [r1]
	lsls r2, 9
	adds r2, r7
	movs r1, 0x16
	bl SetMonData
	b _08138C5A
	.align 2, 0
_08138B1C: .4byte gPlayerParty
_08138B20: .4byte gUnknown_02024A60
_08138B24:
	movs r0, 0x64
	muls r0, r5
	ldr r1, _08138B3C
	adds r0, r1
	ldr r1, _08138B40
	ldrb r2, [r1]
	lsls r2, 9
	adds r2, r7
	movs r1, 0x17
	bl SetMonData
	b _08138C5A
	.align 2, 0
_08138B3C: .4byte gPlayerParty
_08138B40: .4byte gUnknown_02024A60
_08138B44:
	movs r0, 0x64
	muls r0, r5
	ldr r1, _08138B5C
	adds r0, r1
	ldr r1, _08138B60
	ldrb r2, [r1]
	lsls r2, 9
	adds r2, r7
	movs r1, 0x18
	bl SetMonData
	b _08138C5A
	.align 2, 0
_08138B5C: .4byte gPlayerParty
_08138B60: .4byte gUnknown_02024A60
_08138B64:
	movs r0, 0x64
	muls r0, r5
	ldr r1, _08138B7C
	adds r0, r1
	ldr r1, _08138B80
	ldrb r2, [r1]
	lsls r2, 9
	adds r2, r7
	movs r1, 0x21
	bl SetMonData
	b _08138C5A
	.align 2, 0
_08138B7C: .4byte gPlayerParty
_08138B80: .4byte gUnknown_02024A60
_08138B84:
	movs r0, 0x64
	muls r0, r5
	ldr r1, _08138B9C
	adds r0, r1
	ldr r1, _08138BA0
	ldrb r2, [r1]
	lsls r2, 9
	adds r2, r7
	movs r1, 0x2F
	bl SetMonData
	b _08138C5A
	.align 2, 0
_08138B9C: .4byte gPlayerParty
_08138BA0: .4byte gUnknown_02024A60
_08138BA4:
	movs r0, 0x64
	muls r0, r5
	ldr r1, _08138BBC
	adds r0, r1
	ldr r1, _08138BC0
	ldrb r2, [r1]
	lsls r2, 9
	adds r2, r7
	movs r1, 0x30
	bl SetMonData
	b _08138C5A
	.align 2, 0
_08138BBC: .4byte gPlayerParty
_08138BC0: .4byte gUnknown_02024A60
_08138BC4:
	movs r0, 0x64
	muls r0, r5
	ldr r1, _08138BDC
	adds r0, r1
	ldr r1, _08138BE0
	ldrb r2, [r1]
	lsls r2, 9
	adds r2, r7
	movs r1, 0x32
	bl SetMonData
	b _08138C5A
	.align 2, 0
_08138BDC: .4byte gPlayerParty
_08138BE0: .4byte gUnknown_02024A60
_08138BE4:
	movs r0, 0x64
	muls r0, r5
	ldr r1, _08138BFC
	adds r0, r1
	ldr r1, _08138C00
	ldrb r2, [r1]
	lsls r2, 9
	adds r2, r7
	movs r1, 0x33
	bl SetMonData
	b _08138C5A
	.align 2, 0
_08138BFC: .4byte gPlayerParty
_08138C00: .4byte gUnknown_02024A60
_08138C04:
	movs r0, 0x64
	muls r0, r5
	ldr r1, _08138C1C
	adds r0, r1
	ldr r1, _08138C20
	ldrb r2, [r1]
	lsls r2, 9
	adds r2, r7
	movs r1, 0x34
	bl SetMonData
	b _08138C5A
	.align 2, 0
_08138C1C: .4byte gPlayerParty
_08138C20: .4byte gUnknown_02024A60
_08138C24:
	movs r0, 0x64
	muls r0, r5
	ldr r1, _08138C3C
	adds r0, r1
	ldr r1, _08138C40
	ldrb r2, [r1]
	lsls r2, 9
	adds r2, r7
	movs r1, 0x35
	bl SetMonData
	b _08138C5A
	.align 2, 0
_08138C3C: .4byte gPlayerParty
_08138C40: .4byte gUnknown_02024A60
_08138C44:
	movs r0, 0x64
	muls r0, r5
	ldr r1, _08138C84
	adds r0, r1
	ldr r1, _08138C88
	ldrb r2, [r1]
	lsls r2, 9
	adds r2, r7
	movs r1, 0x36
	bl SetMonData
_08138C5A:
	ldr r2, _08138C8C
	ldr r0, _08138C88
	ldrb r1, [r0]
	lsls r0, r1, 1
	adds r0, r2
	ldrh r2, [r0]
	movs r0, 0x64
	muls r0, r2
	ldr r2, _08138C84
	adds r0, r2
	bl sub_80324F8
	add sp, 0x34
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_08138C84: .4byte gPlayerParty
_08138C88: .4byte gUnknown_02024A60
_08138C8C: .4byte gUnknown_02024A6A
	thumb_func_end sub_8138294

	thumb_func_start sub_8138C90
sub_8138C90: @ 8138C90
	push {lr}
	bl dp01_tbl5_exec_completed
	pop {r0}
	bx r0
	thumb_func_end sub_8138C90

	thumb_func_start sub_8138C9C
sub_8138C9C: @ 8138C9C
	push {lr}
	bl dp01_tbl5_exec_completed
	pop {r0}
	bx r0
	thumb_func_end sub_8138C9C

	thumb_func_start sub_8138CA8
sub_8138CA8: @ 8138CA8
	push {lr}
	bl dp01_tbl5_exec_completed
	pop {r0}
	bx r0
	thumb_func_end sub_8138CA8

	thumb_func_start sub_8138CB4
sub_8138CB4: @ 8138CB4
	push {r4-r6,lr}
	ldr r0, _08138CE0
	ldr r6, _08138CE4
	ldrb r2, [r6]
	lsls r1, r2, 9
	adds r0, 0x1
	adds r1, r0
	ldrb r0, [r1]
	cmp r0, 0
	bne _08138CF0
	adds r0, r2, 0
	adds r1, r2, 0
	movs r3, 0x1
	bl move_anim_start_t4
	ldr r0, _08138CE8
	ldrb r1, [r6]
	lsls r1, 2
	adds r1, r0
	ldr r0, _08138CEC
	str r0, [r1]
	b _08138D26
	.align 2, 0
_08138CE0: .4byte gUnknown_02023A60
_08138CE4: .4byte gUnknown_02024A60
_08138CE8: .4byte gUnknown_03004330
_08138CEC: .4byte sub_813789C
_08138CF0:
	ldr r5, _08138D2C
	adds r0, r2, r5
	ldrb r1, [r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	ldr r4, _08138D30
	adds r0, r4
	bl FreeSpriteOamMatrix
	ldrb r0, [r6]
	adds r0, r5
	ldrb r1, [r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r4
	bl DestroySprite
	ldr r1, _08138D34
	ldrb r0, [r6]
	adds r0, r1
	ldrb r0, [r0]
	bl sub_8043DB0
	bl dp01_tbl5_exec_completed
_08138D26:
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_08138D2C: .4byte gUnknown_02024BE0
_08138D30: .4byte gSprites
_08138D34: .4byte gUnknown_03004340
	thumb_func_end sub_8138CB4

	thumb_func_start sub_8138D38
sub_8138D38: @ 8138D38
	push {r4-r6,lr}
	ldr r4, _08138DE0
	ldrb r1, [r4]
	movs r0, 0x2
	bl sub_8031AF4
	ldrb r0, [r4]
	bl battle_get_per_side_status
	adds r1, r0, 0
	lsls r1, 24
	lsrs r1, 24
	movs r0, 0x2
	bl GetMonSpriteTemplate_803C5A0
	ldr r0, _08138DE4
	ldr r1, _08138DE8
	ldrb r1, [r1, 0x8]
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
	ldr r6, _08138DEC
	ldrb r1, [r4]
	adds r1, r6
	strb r0, [r1]
	ldr r5, _08138DF0
	ldrb r3, [r4]
	adds r0, r3, r6
	ldrb r0, [r0]
	lsls r1, r0, 4
	adds r1, r0
	lsls r1, 2
	adds r1, r5
	lsls r3, 4
	ldrb r2, [r1, 0x5]
	movs r0, 0xF
	ands r0, r2
	orrs r0, r3
	strb r0, [r1, 0x5]
	ldrb r0, [r4]
	adds r0, r6
	ldrb r1, [r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r5
	movs r1, 0xF0
	strh r1, [r0, 0x24]
	ldrb r0, [r4]
	adds r0, r6
	ldrb r1, [r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r5
	ldr r1, _08138DF4
	strh r1, [r0, 0x2E]
	ldrb r0, [r4]
	adds r0, r6
	ldrb r1, [r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r5, 0x1C
	adds r0, r5
	ldr r1, _08138DF8
	str r1, [r0]
	ldr r1, _08138DFC
	ldrb r0, [r4]
	lsls r0, 2
	adds r0, r1
	ldr r1, _08138E00
	str r1, [r0]
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_08138DE0: .4byte gUnknown_02024A60
_08138DE4: .4byte gUnknown_02024E8C
_08138DE8: .4byte gTrainerBackPicCoords
_08138DEC: .4byte gUnknown_02024BE0
_08138DF0: .4byte gSprites
_08138DF4: .4byte 0x0000fffe
_08138DF8: .4byte sub_80313A0
_08138DFC: .4byte gUnknown_03004330
_08138E00: .4byte sub_813741C
	thumb_func_end sub_8138D38

	thumb_func_start sub_8138E04
sub_8138E04: @ 8138E04
	push {r4-r6,lr}
	ldr r4, _08138EAC
	ldrb r1, [r4]
	movs r0, 0x2
	bl sub_8031AF4
	ldrb r0, [r4]
	bl battle_get_per_side_status
	adds r1, r0, 0
	lsls r1, 24
	lsrs r1, 24
	movs r0, 0x2
	bl GetMonSpriteTemplate_803C5A0
	ldr r0, _08138EB0
	ldr r1, _08138EB4
	ldrb r1, [r1, 0x8]
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
	ldr r6, _08138EB8
	ldrb r1, [r4]
	adds r1, r6
	strb r0, [r1]
	ldr r5, _08138EBC
	ldrb r3, [r4]
	adds r0, r3, r6
	ldrb r0, [r0]
	lsls r1, r0, 4
	adds r1, r0
	lsls r1, 2
	adds r1, r5
	lsls r3, 4
	ldrb r2, [r1, 0x5]
	movs r0, 0xF
	ands r0, r2
	orrs r0, r3
	strb r0, [r1, 0x5]
	ldrb r0, [r4]
	adds r0, r6
	ldrb r1, [r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r5
	ldr r1, _08138EC0
	strh r1, [r0, 0x24]
	ldrb r0, [r4]
	adds r0, r6
	ldrb r1, [r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r5
	movs r1, 0x2
	strh r1, [r0, 0x2E]
	ldrb r0, [r4]
	adds r0, r6
	ldrb r1, [r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r5, 0x1C
	adds r0, r5
	ldr r1, _08138EC4
	str r1, [r0]
	ldr r1, _08138EC8
	ldrb r0, [r4]
	lsls r0, 2
	adds r0, r1
	ldr r1, _08138ECC
	str r1, [r0]
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_08138EAC: .4byte gUnknown_02024A60
_08138EB0: .4byte gUnknown_02024E8C
_08138EB4: .4byte gTrainerBackPicCoords
_08138EB8: .4byte gUnknown_02024BE0
_08138EBC: .4byte gSprites
_08138EC0: .4byte 0x0000ffa0
_08138EC4: .4byte sub_80313A0
_08138EC8: .4byte gUnknown_03004330
_08138ECC: .4byte sub_8137908
	thumb_func_end sub_8138E04

	thumb_func_start sub_8138ED0
sub_8138ED0: @ 8138ED0
	push {lr}
	bl dp01_tbl5_exec_completed
	pop {r0}
	bx r0
	thumb_func_end sub_8138ED0

	thumb_func_start sub_8138EDC
sub_8138EDC: @ 8138EDC
	push {lr}
	bl dp01_tbl5_exec_completed
	pop {r0}
	bx r0
	thumb_func_end sub_8138EDC

	thumb_func_start sub_8138EE8
sub_8138EE8: @ 8138EE8
	push {lr}
	bl dp01_tbl5_exec_completed
	pop {r0}
	bx r0
	thumb_func_end sub_8138EE8

	thumb_func_start sub_8138EF4
sub_8138EF4: @ 8138EF4
	push {r4,r5,lr}
	ldr r1, _08138F30
	movs r0, 0x4
	strb r0, [r1, 0x8]
	ldr r1, _08138F34
	movs r0, 0x1
	strb r0, [r1]
	ldr r5, _08138F38
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
	ldr r1, _08138F3C
	ldrb r0, [r5]
	lsls r0, 2
	adds r0, r1
	ldr r1, _08138F40
	str r1, [r0]
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_08138F30: .4byte 0x02017840
_08138F34: .4byte gUnknown_02024E6D
_08138F38: .4byte gUnknown_02024A60
_08138F3C: .4byte gUnknown_03004330
_08138F40: .4byte bx_wait_t5
	thumb_func_end sub_8138EF4

	thumb_func_start sub_8138F44
sub_8138F44: @ 8138F44
	push {r4,r5,lr}
	ldr r1, _08138F88
	ldr r5, _08138F8C
	ldrb r0, [r5]
	lsls r0, 9
	adds r1, 0x1
	adds r0, r1
	ldrb r1, [r0]
	ldr r0, _08138F90
	strb r1, [r0, 0x8]
	ldr r1, _08138F94
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
	ldr r1, _08138F98
	ldrb r0, [r5]
	lsls r0, 2
	adds r0, r1
	ldr r1, _08138F9C
	str r1, [r0]
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_08138F88: .4byte gUnknown_02023A60
_08138F8C: .4byte gUnknown_02024A60
_08138F90: .4byte 0x02017840
_08138F94: .4byte gUnknown_02024E6D
_08138F98: .4byte gUnknown_03004330
_08138F9C: .4byte bx_wait_t5
	thumb_func_end sub_8138F44

	thumb_func_start sub_8138FA0
sub_8138FA0: @ 8138FA0
	push {lr}
	bl dp01_tbl5_exec_completed
	pop {r0}
	bx r0
	thumb_func_end sub_8138FA0

	thumb_func_start sub_8138FAC
sub_8138FAC: @ 8138FAC
	push {r4-r6,lr}
	ldr r0, _08139080
	mov r12, r0
	ldr r6, _08139084
	ldrb r2, [r6]
	lsls r2, 9
	adds r0, 0x1
	adds r0, r2, r0
	ldrb r0, [r0]
	mov r1, r12
	adds r1, 0x2
	adds r1, r2, r1
	ldrb r1, [r1]
	lsls r1, 8
	orrs r0, r1
	ldr r5, _08139088
	mov r1, r12
	adds r1, 0x3
	adds r2, r1
	ldrb r1, [r2]
	strb r1, [r5]
	ldr r4, _0813908C
	ldrb r2, [r6]
	lsls r2, 9
	mov r1, r12
	adds r1, 0x4
	adds r1, r2, r1
	ldrb r3, [r1]
	mov r1, r12
	adds r1, 0x5
	adds r2, r1
	ldrb r1, [r2]
	lsls r1, 8
	orrs r3, r1
	strh r3, [r4]
	ldr r4, _08139090
	ldrb r2, [r6]
	lsls r2, 9
	mov r1, r12
	adds r1, 0x6
	adds r1, r2, r1
	ldrb r3, [r1]
	mov r1, r12
	adds r1, 0x7
	adds r1, r2, r1
	ldrb r1, [r1]
	lsls r1, 8
	orrs r3, r1
	mov r1, r12
	adds r1, 0x8
	adds r1, r2, r1
	ldrb r1, [r1]
	lsls r1, 16
	orrs r3, r1
	mov r1, r12
	adds r1, 0x9
	adds r2, r1
	ldrb r1, [r2]
	lsls r1, 24
	orrs r3, r1
	str r3, [r4]
	ldr r3, _08139094
	ldrb r1, [r6]
	lsls r1, 9
	mov r2, r12
	adds r2, 0xA
	adds r1, r2
	ldrb r1, [r1]
	strb r1, [r3]
	ldr r4, _08139098
	ldrb r2, [r6]
	lsls r2, 9
	mov r1, r12
	adds r1, 0xC
	adds r1, r2, r1
	ldrb r3, [r1]
	mov r1, r12
	adds r1, 0xD
	adds r2, r1
	ldrb r1, [r2]
	lsls r1, 8
	orrs r3, r1
	strh r3, [r4]
	ldr r3, _0813909C
	ldrb r2, [r6]
	lsls r2, 9
	mov r1, r12
	adds r1, 0x10
	adds r2, r1
	str r2, [r3]
	ldr r3, _081390A0
	ldrb r1, [r6]
	lsls r1, 2
	adds r1, r3
	ldr r2, [r2]
	str r2, [r1]
	ldrb r1, [r5]
	bl sub_8031720
	lsls r0, 24
	lsrs r2, r0, 24
	cmp r2, 0
	beq _081390A4
	bl dp01_tbl5_exec_completed
	b _081390BE
	.align 2, 0
_08139080: .4byte gUnknown_02023A60
_08139084: .4byte gUnknown_02024A60
_08139088: .4byte gUnknown_0202F7C4
_0813908C: .4byte gUnknown_0202F7BC
_08139090: .4byte gUnknown_0202F7B8
_08139094: .4byte gUnknown_0202F7BE
_08139098: .4byte gUnknown_0202F7C0
_0813909C: .4byte gUnknown_0202F7B4
_081390A0: .4byte gUnknown_02024E70
_081390A4:
	ldrb r1, [r6]
	lsls r0, r1, 1
	adds r0, r1
	lsls r0, 2
	ldr r1, _081390C4
	adds r0, r1
	strb r2, [r0, 0x4]
	ldr r1, _081390C8
	ldrb r0, [r6]
	lsls r0, 2
	adds r0, r1
	ldr r1, _081390CC
	str r1, [r0]
_081390BE:
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_081390C4: .4byte 0x02017810
_081390C8: .4byte gUnknown_03004330
_081390CC: .4byte sub_81390D0
	thumb_func_end sub_8138FAC

	thumb_func_start sub_81390D0
sub_81390D0: @ 81390D0
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	ldr r2, _0813910C
	ldr r5, _08139110
	ldrb r3, [r5]
	lsls r1, r3, 9
	adds r0, r2, 0x1
	mov r8, r0
	adds r0, r1, r0
	ldrb r4, [r0]
	adds r7, r2, 0x2
	adds r1, r7
	ldrb r0, [r1]
	lsls r0, 8
	orrs r4, r0
	lsls r0, r3, 1
	adds r0, r3
	lsls r0, 2
	ldr r6, _08139114
	adds r0, r6
	ldrb r2, [r0, 0x4]
	cmp r2, 0x1
	beq _08139150
	cmp r2, 0x1
	bgt _08139118
	cmp r2, 0
	beq _08139122
	b _081391FC
	.align 2, 0
_0813910C: .4byte gUnknown_02023A60
_08139110: .4byte gUnknown_02024A60
_08139114: .4byte 0x02017810
_08139118:
	cmp r2, 0x2
	beq _08139176
	cmp r2, 0x3
	beq _081391C4
	b _081391FC
_08139122:
	lsls r0, r3, 2
	adds r1, r6, 0
	subs r1, 0x10
	adds r0, r1
	ldrb r1, [r0]
	movs r0, 0x4
	ands r0, r1
	cmp r0, 0
	beq _08139140
	adds r0, r3, 0
	adds r1, r3, 0
	adds r2, r3, 0
	movs r3, 0x5
	bl move_anim_start_t4
_08139140:
	ldrb r0, [r5]
	lsls r1, r0, 1
	adds r1, r0
	lsls r1, 2
	adds r1, r6
	movs r0, 0x1
	strb r0, [r1, 0x4]
	b _081391FC
_08139150:
	ldrb r1, [r0]
	movs r0, 0x40
	ands r0, r1
	cmp r0, 0
	bne _081391FC
	movs r0, 0
	bl sub_80326EC
	adds r0, r4, 0
	bl move_anim_start_t1
	ldrb r0, [r5]
	lsls r1, r0, 1
	adds r1, r0
	lsls r1, 2
	adds r1, r6
	movs r0, 0x2
	strb r0, [r1, 0x4]
	b _081391FC
_08139176:
	ldr r0, _081391BC
	ldr r0, [r0]
	bl _call_via_r0
	ldr r0, _081391C0
	ldrb r0, [r0]
	cmp r0, 0
	bne _081391FC
	movs r0, 0x1
	bl sub_80326EC
	ldrb r2, [r5]
	lsls r0, r2, 2
	adds r1, r6, 0
	subs r1, 0x10
	adds r0, r1
	ldrb r1, [r0]
	movs r0, 0x4
	ands r0, r1
	cmp r0, 0
	beq _081391AA
	adds r0, r2, 0
	adds r1, r2, 0
	movs r3, 0x6
	bl move_anim_start_t4
_081391AA:
	ldrb r0, [r5]
	lsls r1, r0, 1
	adds r1, r0
	lsls r1, 2
	adds r1, r6
	movs r0, 0x3
	strb r0, [r1, 0x4]
	b _081391FC
	.align 2, 0
_081391BC: .4byte gUnknown_0202F7AC
_081391C0: .4byte gUnknown_0202F7B1
_081391C4:
	ldrb r1, [r0]
	movs r0, 0x40
	ands r0, r1
	lsls r0, 24
	lsrs r4, r0, 24
	cmp r4, 0
	bne _081391FC
	bl sub_8031F24
	ldrb r0, [r5]
	lsls r2, r0, 9
	mov r3, r8
	adds r1, r2, r3
	ldrb r1, [r1]
	adds r2, r7
	ldrb r2, [r2]
	lsls r2, 8
	orrs r1, r2
	bl sub_80324BC
	ldrb r1, [r5]
	lsls r0, r1, 1
	adds r0, r1
	lsls r0, 2
	adds r0, r6
	strb r4, [r0, 0x4]
	bl dp01_tbl5_exec_completed
_081391FC:
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r0}
	bx r0
	thumb_func_end sub_81390D0

	thumb_func_start sub_8139208
sub_8139208: @ 8139208
	push {r4,r5,lr}
	sub sp, 0x4
	ldr r0, _08139254
	movs r1, 0
	strh r1, [r0]
	ldr r0, _08139258
	strh r1, [r0]
	ldr r5, _0813925C
	ldrb r0, [r5]
	lsls r0, 9
	ldr r1, _08139260
	adds r4, r0, r1
	ldrh r0, [r4]
	cmp r0, 0x2
	bne _0813922A
	bl sub_814A7FC
_0813922A:
	ldrh r0, [r4]
	bl sub_8120AA8
	ldr r0, _08139264
	ldr r1, _08139268
	movs r2, 0xF
	str r2, [sp]
	movs r2, 0x90
	movs r3, 0x2
	bl sub_8002EB0
	ldr r1, _0813926C
	ldrb r0, [r5]
	lsls r0, 2
	adds r0, r1
	ldr r1, _08139270
	str r1, [r0]
	add sp, 0x4
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_08139254: .4byte gUnknown_030042A4
_08139258: .4byte gUnknown_030042A0
_0813925C: .4byte gUnknown_02024A60
_08139260: .4byte gUnknown_02023A62
_08139264: .4byte gUnknown_03004210
_08139268: .4byte gUnknown_020238CC
_0813926C: .4byte gUnknown_03004330
_08139270: .4byte sub_8137454
	thumb_func_end sub_8139208

	thumb_func_start dp01t_11_5_message_for_player_only
dp01t_11_5_message_for_player_only: @ 8139274
	push {lr}
	ldr r0, _0813928C
	ldrb r0, [r0]
	bl battle_side_get_owner
	lsls r0, 24
	cmp r0, 0
	bne _08139290
	bl sub_8139208
	b _08139294
	.align 2, 0
_0813928C: .4byte gUnknown_02024A60
_08139290:
	bl dp01_tbl5_exec_completed
_08139294:
	pop {r0}
	bx r0
	thumb_func_end dp01t_11_5_message_for_player_only

	thumb_func_start sub_8139298
sub_8139298: @ 8139298
	push {r4,r5,lr}
	sub sp, 0x8
	ldr r0, _0813934C
	movs r2, 0
	strh r2, [r0]
	ldr r1, _08139350
	movs r0, 0xA0
	strh r0, [r1]
	ldr r4, _08139354
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
	ldr r1, _08139358
	ldr r0, _0813935C
	ldrb r0, [r0]
	lsls r0, 2
	adds r0, r1
	ldr r1, _08139360
	str r1, [r0]
	ldr r1, _08139364
	movs r2, 0xC8
	lsls r2, 1
	movs r0, 0x23
	str r0, [sp]
	adds r0, r4, 0
	movs r3, 0x12
	bl InitWindow
	adds r0, r4, 0
	bl sub_8002F44
	ldr r1, _08139368
	ldr r3, _0813936C
	str r5, [sp]
	movs r0, 0
	movs r2, 0xC
	bl sub_814A5C0
	movs r4, 0
_0813930C:
	lsls r0, r4, 24
	lsrs r0, 24
	bl nullsub_8
	adds r4, 0x1
	cmp r4, 0x3
	ble _0813930C
	movs r0, 0
	movs r1, 0
	bl sub_802E3E4
	ldr r0, _08139370
	bl get_battle_strings_
	ldr r4, _08139354
	ldr r1, _08139374
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
_0813934C: .4byte gUnknown_030042A4
_08139350: .4byte gUnknown_030042A0
_08139354: .4byte gUnknown_03004210
_08139358: .4byte gUnknown_03004330
_0813935C: .4byte gUnknown_02024A60
_08139360: .4byte sub_81372BC
_08139364: .4byte gUnknown_08400CF3
_08139368: .4byte 0x0000ffff
_0813936C: .4byte 0x00002d9f
_08139370: .4byte gUnknown_08400CCC
_08139374: .4byte gUnknown_020238CC
	thumb_func_end sub_8139298

	thumb_func_start sub_8139378
sub_8139378: @ 8139378
	push {lr}
	bl dp01_tbl5_exec_completed
	pop {r0}
	bx r0
	thumb_func_end sub_8139378

	thumb_func_start sub_8139384
sub_8139384: @ 8139384
	push {r4,r5,lr}
	ldr r5, _08139398
	ldr r0, _0813939C
	adds r4, r5, r0
	ldrb r0, [r4]
	cmp r0, 0
	beq _081393A0
	cmp r0, 0x1
	beq _081393B2
	b _081393DE
	.align 2, 0
_08139398: .4byte 0x02000000
_0813939C: .4byte 0x000160a9
_081393A0:
	bl sub_80304A8
	ldrb r0, [r4]
	adds r0, 0x1
	strb r0, [r4]
	ldr r0, _081393E4
	adds r1, r5, r0
	movs r0, 0x50
	strb r0, [r1]
_081393B2:
	ldr r1, _081393E8
	ldr r0, _081393E4
	adds r1, r0
	ldrb r0, [r1]
	subs r0, 0x1
	strb r0, [r1]
	lsls r0, 24
	cmp r0, 0
	bne _081393DE
	bl sub_814A7FC
	movs r0, 0x5
	bl PlaySE
	movs r2, 0x80
	lsls r2, 1
	movs r0, 0x1
	movs r1, 0xA
	bl dp01_build_cmdbuf_x21_a_bb
	bl dp01_tbl5_exec_completed
_081393DE:
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_081393E4: .4byte 0x000160ab
_081393E8: .4byte 0x02000000
	thumb_func_end sub_8139384

	thumb_func_start sub_81393EC
sub_81393EC: @ 81393EC
	push {lr}
	sub sp, 0x4
	movs r0, 0x1
	negs r0, r0
	movs r1, 0
	str r1, [sp]
	movs r2, 0
	movs r3, 0x10
	bl BeginNormalPaletteFade
	ldr r1, _0813941C
	ldr r2, _08139420
	ldrb r0, [r2]
	lsls r0, 2
	adds r0, r1
	ldr r1, _08139424
	str r1, [r0]
	ldr r1, _08139428
	ldrb r0, [r2]
	strb r0, [r1]
	add sp, 0x4
	pop {r0}
	bx r0
	.align 2, 0
_0813941C: .4byte gUnknown_03004330
_08139420: .4byte gUnknown_02024A60
_08139424: .4byte sub_81374C4
_08139428: .4byte gUnknown_02024E6C
	thumb_func_end sub_81393EC

	thumb_func_start sub_813942C
sub_813942C: @ 813942C
	push {lr}
	bl dp01_tbl5_exec_completed
	pop {r0}
	bx r0
	thumb_func_end sub_813942C

	thumb_func_start sub_8139438
sub_8139438: @ 8139438
	push {lr}
	bl dp01_tbl5_exec_completed
	pop {r0}
	bx r0
	thumb_func_end sub_8139438

	thumb_func_start sub_8139444
sub_8139444: @ 8139444
	push {r4-r7,lr}
	mov r7, r9
	mov r6, r8
	push {r6,r7}
	sub sp, 0x4
	movs r0, 0
	bl load_gfxc_health_bar
	ldr r3, _081394BC
	ldr r0, _081394C0
	mov r9, r0
	ldrb r4, [r0]
	lsls r2, r4, 9
	adds r0, r3, 0x2
	adds r0, r2, r0
	ldrb r1, [r0]
	adds r3, 0x3
	adds r2, r3
	ldrb r0, [r2]
	lsls r0, 8
	orrs r1, r0
	lsls r1, 16
	asrs r7, r1, 16
	ldr r0, _081394C4
	cmp r7, r0
	beq _081394D4
	ldr r6, _081394C8
	lsls r0, r4, 1
	adds r0, r6
	ldrh r0, [r0]
	movs r5, 0x64
	muls r0, r5
	ldr r4, _081394CC
	adds r0, r4
	movs r1, 0x3A
	bl GetMonData
	mov r8, r0
	mov r1, r9
	ldrb r0, [r1]
	lsls r0, 1
	adds r0, r6
	ldrh r0, [r0]
	muls r0, r5
	adds r0, r4
	movs r1, 0x39
	bl GetMonData
	adds r3, r0, 0
	mov r1, r9
	ldrb r0, [r1]
	ldr r1, _081394D0
	adds r1, r0, r1
	ldrb r1, [r1]
	str r7, [sp]
	mov r2, r8
	bl sub_8043D84
	b _0813950E
	.align 2, 0
_081394BC: .4byte gUnknown_02023A60
_081394C0: .4byte gUnknown_02024A60
_081394C4: .4byte 0x00007fff
_081394C8: .4byte gUnknown_02024A6A
_081394CC: .4byte gPlayerParty
_081394D0: .4byte gUnknown_03004340
_081394D4:
	ldr r1, _0813952C
	lsls r0, r4, 1
	adds r0, r1
	ldrh r1, [r0]
	movs r0, 0x64
	muls r0, r1
	ldr r1, _08139530
	adds r0, r1
	movs r1, 0x3A
	bl GetMonData
	adds r2, r0, 0
	mov r1, r9
	ldrb r0, [r1]
	ldr r4, _08139534
	adds r1, r0, r4
	ldrb r1, [r1]
	str r7, [sp]
	movs r3, 0
	bl sub_8043D84
	mov r1, r9
	ldrb r0, [r1]
	adds r0, r4
	ldrb r0, [r0]
	movs r1, 0
	movs r2, 0
	bl sub_80440EC
_0813950E:
	ldr r1, _08139538
	ldr r0, _0813953C
	ldrb r0, [r0]
	lsls r0, 2
	adds r0, r1
	ldr r1, _08139540
	str r1, [r0]
	add sp, 0x4
	pop {r3,r4}
	mov r8, r3
	mov r9, r4
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_0813952C: .4byte gUnknown_02024A6A
_08139530: .4byte gPlayerParty
_08139534: .4byte gUnknown_03004340
_08139538: .4byte gUnknown_03004330
_0813953C: .4byte gUnknown_02024A60
_08139540: .4byte sub_81377B0
	thumb_func_end sub_8139444

	thumb_func_start sub_8139544
sub_8139544: @ 8139544
	push {lr}
	bl dp01_tbl5_exec_completed
	pop {r0}
	bx r0
	thumb_func_end sub_8139544

	thumb_func_start sub_8139550
sub_8139550: @ 8139550
	push {lr}
	bl dp01_tbl5_exec_completed
	pop {r0}
	bx r0
	thumb_func_end sub_8139550

	thumb_func_start sub_813955C
sub_813955C: @ 813955C
	push {lr}
	bl dp01_tbl5_exec_completed
	pop {r0}
	bx r0
	thumb_func_end sub_813955C

	thumb_func_start sub_8139568
sub_8139568: @ 8139568
	push {lr}
	bl dp01_tbl5_exec_completed
	pop {r0}
	bx r0
	thumb_func_end sub_8139568

	thumb_func_start sub_8139574
sub_8139574: @ 8139574
	push {lr}
	bl dp01_tbl5_exec_completed
	pop {r0}
	bx r0
	thumb_func_end sub_8139574

	thumb_func_start sub_8139580
sub_8139580: @ 8139580
	push {lr}
	bl dp01_tbl5_exec_completed
	pop {r0}
	bx r0
	thumb_func_end sub_8139580

	thumb_func_start sub_813958C
sub_813958C: @ 813958C
	push {lr}
	bl dp01_tbl5_exec_completed
	pop {r0}
	bx r0
	thumb_func_end sub_813958C

	thumb_func_start sub_8139598
sub_8139598: @ 8139598
	push {lr}
	bl dp01_tbl5_exec_completed
	pop {r0}
	bx r0
	thumb_func_end sub_8139598

	thumb_func_start sub_81395A4
sub_81395A4: @ 81395A4
	push {lr}
	bl dp01_tbl5_exec_completed
	pop {r0}
	bx r0
	thumb_func_end sub_81395A4

	thumb_func_start sub_81395B0
sub_81395B0: @ 81395B0
	push {lr}
	bl dp01_tbl5_exec_completed
	pop {r0}
	bx r0
	thumb_func_end sub_81395B0

	thumb_func_start sub_81395BC
sub_81395BC: @ 81395BC
	push {lr}
	bl dp01_tbl5_exec_completed
	pop {r0}
	bx r0
	thumb_func_end sub_81395BC

	thumb_func_start sub_81395C8
sub_81395C8: @ 81395C8
	push {lr}
	bl dp01_tbl5_exec_completed
	pop {r0}
	bx r0
	thumb_func_end sub_81395C8

	thumb_func_start sub_81395D4
sub_81395D4: @ 81395D4
	push {lr}
	bl dp01_tbl5_exec_completed
	pop {r0}
	bx r0
	thumb_func_end sub_81395D4

	thumb_func_start sub_81395E0
sub_81395E0: @ 81395E0
	push {lr}
	bl dp01_tbl5_exec_completed
	pop {r0}
	bx r0
	thumb_func_end sub_81395E0

	thumb_func_start sub_81395EC
sub_81395EC: @ 81395EC
	push {lr}
	bl dp01_tbl5_exec_completed
	pop {r0}
	bx r0
	thumb_func_end sub_81395EC

	thumb_func_start sub_81395F8
sub_81395F8: @ 81395F8
	push {lr}
	bl dp01_tbl5_exec_completed
	pop {r0}
	bx r0
	thumb_func_end sub_81395F8

	thumb_func_start sub_8139604
sub_8139604: @ 8139604
	push {r4,lr}
	ldr r3, _0813962C
	ldr r2, _08139630
	ldr r4, _08139634
	ldrb r0, [r4]
	adds r0, r2
	ldrb r1, [r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r3
	adds r0, 0x3E
	ldrb r0, [r0]
	lsls r0, 29
	cmp r0, 0
	bge _08139638
	bl dp01_tbl5_exec_completed
	b _08139662
	.align 2, 0
_0813962C: .4byte gSprites
_08139630: .4byte gUnknown_02024BE0
_08139634: .4byte gUnknown_02024A60
_08139638:
	ldr r1, _08139668
	movs r0, 0x1
	strb r0, [r1]
	ldrb r0, [r4]
	adds r0, r2
	ldrb r1, [r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r3
	movs r1, 0
	strh r1, [r0, 0x30]
	ldrb r0, [r4]
	bl sub_8047858
	ldr r1, _0813966C
	ldrb r0, [r4]
	lsls r0, 2
	adds r0, r1
	ldr r1, _08139670
	str r1, [r0]
_08139662:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08139668: .4byte gUnknown_02024E6D
_0813966C: .4byte gUnknown_03004330
_08139670: .4byte bx_blink_t5
	thumb_func_end sub_8139604

	thumb_func_start sub_8139674
sub_8139674: @ 8139674
	push {lr}
	bl dp01_tbl5_exec_completed
	pop {r0}
	bx r0
	thumb_func_end sub_8139674

	thumb_func_start sub_8139680
sub_8139680: @ 8139680
	push {lr}
	ldr r2, _081396A8
	ldr r0, _081396AC
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
	bl PlaySE
	bl dp01_tbl5_exec_completed
	pop {r0}
	bx r0
	.align 2, 0
_081396A8: .4byte gUnknown_02023A60
_081396AC: .4byte gUnknown_02024A60
	thumb_func_end sub_8139680

	thumb_func_start sub_81396B0
sub_81396B0: @ 81396B0
	push {lr}
	ldr r2, _081396D8
	ldr r0, _081396DC
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
	bl dp01_tbl5_exec_completed
	pop {r0}
	bx r0
	.align 2, 0
_081396D8: .4byte gUnknown_02023A60
_081396DC: .4byte gUnknown_02024A60
	thumb_func_end sub_81396B0

	thumb_func_start sub_81396E0
sub_81396E0: @ 81396E0
	push {lr}
	ldr r1, _08139710
	ldr r0, _08139714
	ldrb r0, [r0]
	lsls r0, 1
	adds r0, r1
	ldrh r1, [r0]
	movs r0, 0x64
	muls r0, r1
	ldr r1, _08139718
	adds r0, r1
	movs r1, 0xB
	bl GetMonData
	lsls r0, 16
	lsrs r0, 16
	movs r1, 0x19
	bl PlayCry1
	bl dp01_tbl5_exec_completed
	pop {r0}
	bx r0
	.align 2, 0
_08139710: .4byte gUnknown_02024A6A
_08139714: .4byte gUnknown_02024A60
_08139718: .4byte gPlayerParty
	thumb_func_end sub_81396E0

	thumb_func_start dp01t_2E_5_battle_intro
dp01t_2E_5_battle_intro: @ 813971C
	push {lr}
	ldr r1, _08139744
	ldr r0, _08139748
	ldrb r0, [r0]
	lsls r0, 9
	adds r1, 0x1
	adds r0, r1
	ldrb r0, [r0]
	bl sub_80E43C0
	ldr r2, _0813974C
	ldrh r0, [r2]
	movs r1, 0x1
	orrs r0, r1
	strh r0, [r2]
	bl dp01_tbl5_exec_completed
	pop {r0}
	bx r0
	.align 2, 0
_08139744: .4byte gUnknown_02023A60
_08139748: .4byte gUnknown_02024A60
_0813974C: .4byte gUnknown_02024DE8
	thumb_func_end dp01t_2E_5_battle_intro

	thumb_func_start sub_8139750
sub_8139750: @ 8139750
	push {r4-r7,lr}
	ldr r6, _08139880
	ldr r7, _08139884
	ldrb r0, [r7]
	adds r0, r6
	ldrb r1, [r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	ldr r5, _08139888
	adds r0, r5
	bl oamt_add_pos2_onto_pos1
	ldrb r0, [r7]
	adds r0, r6
	ldrb r1, [r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r5
	movs r1, 0x32
	strh r1, [r0, 0x2E]
	ldrb r0, [r7]
	adds r0, r6
	ldrb r1, [r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r5
	ldr r1, _0813988C
	strh r1, [r0, 0x32]
	ldrb r0, [r7]
	adds r0, r6
	ldrb r1, [r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r5
	ldrh r1, [r0, 0x22]
	strh r1, [r0, 0x36]
	ldrb r0, [r7]
	adds r0, r6
	ldrb r1, [r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r1, r5, 0
	adds r1, 0x1C
	adds r0, r1
	ldr r1, _08139890
	str r1, [r0]
	ldrb r2, [r7]
	adds r0, r2, r6
	ldrb r1, [r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r5
	strh r2, [r0, 0x38]
	ldrb r0, [r7]
	adds r0, r6
	ldrb r1, [r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r5
	ldr r1, _08139894
	bl oamt_set_x3A_32
	ldrb r0, [r7]
	adds r0, r6
	ldrb r1, [r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r5
	movs r1, 0x1
	bl StartSpriteAnim
	ldr r0, _08139898
	bl AllocSpritePalette
	adds r4, r0, 0
	lsls r4, 24
	ldr r0, _0813989C
	ldr r0, [r0, 0x10]
	lsrs r4, 20
	movs r2, 0x80
	lsls r2, 1
	adds r1, r4, r2
	movs r2, 0x20
	bl LoadCompressedPalette
	ldrb r0, [r7]
	adds r0, r6
	ldrb r0, [r0]
	lsls r1, r0, 4
	adds r1, r0
	lsls r1, 2
	adds r1, r5
	ldrb r2, [r1, 0x5]
	movs r0, 0xF
	ands r0, r2
	orrs r0, r4
	strb r0, [r1, 0x5]
	ldr r0, _081398A0
	movs r1, 0x5
	bl CreateTask
	lsls r0, 24
	lsrs r0, 24
	ldr r4, _081398A4
	lsls r1, r0, 2
	adds r1, r0
	lsls r1, 3
	adds r1, r4
	ldrb r0, [r7]
	strh r0, [r1, 0x8]
	ldrb r3, [r7]
	lsls r0, r3, 1
	adds r0, r3
	lsls r0, 2
	ldr r2, _081398A8
	adds r0, r2
	ldrb r1, [r0]
	movs r0, 0x1
	ands r0, r1
	cmp r0, 0
	beq _08139864
	ldr r0, _081398AC
	adds r0, r3, r0
	ldrb r1, [r0]
	lsls r0, r1, 2
	adds r0, r1
	lsls r0, 3
	adds r0, r4
	ldr r1, _081398B0
	str r1, [r0]
_08139864:
	adds r2, 0x30
	ldrb r0, [r2, 0x9]
	movs r1, 0x1
	orrs r0, r1
	strb r0, [r2, 0x9]
	ldr r1, _081398B4
	ldrb r0, [r7]
	lsls r0, 2
	adds r0, r1
	ldr r1, _081398B8
	str r1, [r0]
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_08139880: .4byte gUnknown_02024BE0
_08139884: .4byte gUnknown_02024A60
_08139888: .4byte gSprites
_0813988C: .4byte 0x0000ffd8
_08139890: .4byte sub_8078B34
_08139894: .4byte sub_8030E38
_08139898: .4byte 0x0000d6f8
_0813989C: .4byte gTrainerBackPicPaletteTable
_081398A0: .4byte sub_8139A2C
_081398A4: .4byte gTasks
_081398A8: .4byte 0x02017810
_081398AC: .4byte gUnknown_02024E68
_081398B0: .4byte sub_8044CA0
_081398B4: .4byte gUnknown_03004330
_081398B8: .4byte nullsub_91
	thumb_func_end sub_8139750

	thumb_func_start sub_81398BC
sub_81398BC: @ 81398BC
	push {r4-r6,lr}
	mov r6, r10
	mov r5, r9
	mov r4, r8
	push {r4-r6}
	adds r6, r0, 0
	lsls r6, 24
	lsrs r6, 24
	lsls r0, r6, 2
	ldr r1, _08139A00
	adds r0, r1
	movs r1, 0
	strh r1, [r0, 0x2]
	ldr r0, _08139A04
	lsls r2, r6, 1
	adds r2, r0
	ldr r0, _08139A08
	lsls r1, r6, 9
	adds r0, 0x1
	adds r1, r0
	ldrb r0, [r1]
	strh r0, [r2]
	ldrh r1, [r2]
	movs r0, 0x64
	muls r0, r1
	ldr r1, _08139A0C
	adds r0, r1
	movs r1, 0xB
	bl GetMonData
	mov r8, r0
	lsls r0, 16
	lsrs r0, 16
	mov r8, r0
	ldr r0, _08139A10
	bl object_new_hidden_with_callback
	ldr r1, _08139A14
	mov r9, r1
	add r9, r6
	mov r1, r9
	strb r0, [r1]
	adds r0, r6, 0
	bl battle_get_per_side_status
	adds r1, r0, 0
	lsls r1, 24
	lsrs r1, 24
	mov r0, r8
	bl GetMonSpriteTemplate_803C56C
	ldr r0, _08139A18
	mov r10, r0
	adds r0, r6, 0
	movs r1, 0x2
	bl sub_8077ABC
	adds r5, r0, 0
	lsls r5, 24
	lsrs r5, 24
	adds r0, r6, 0
	bl sub_8077F68
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	adds r0, r6, 0
	bl sub_8079E90
	adds r3, r0, 0
	lsls r3, 24
	lsrs r3, 24
	mov r0, r10
	adds r1, r5, 0
	adds r2, r4, 0
	bl CreateSprite
	ldr r4, _08139A1C
	adds r4, r6, r4
	strb r0, [r4]
	ldr r5, _08139A20
	mov r0, r9
	ldrb r1, [r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r5
	ldrb r1, [r4]
	strh r1, [r0, 0x30]
	ldrb r1, [r4]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r5
	strh r6, [r0, 0x2E]
	ldrb r1, [r4]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r5
	mov r1, r8
	strh r1, [r0, 0x32]
	ldrb r0, [r4]
	lsls r1, r0, 4
	adds r1, r0
	lsls r1, 2
	adds r1, r5
	lsls r3, r6, 4
	ldrb r2, [r1, 0x5]
	movs r0, 0xF
	ands r0, r2
	orrs r0, r3
	strb r0, [r1, 0x5]
	ldrb r1, [r4]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r5
	ldr r1, _08139A24
	adds r6, r1
	ldrb r1, [r6]
	bl StartSpriteAnim
	ldrb r1, [r4]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r5
	adds r0, 0x3E
	ldrb r1, [r0]
	movs r2, 0x4
	orrs r1, r2
	strb r1, [r0]
	ldrb r1, [r4]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r1, r5, 0
	adds r1, 0x1C
	adds r0, r1
	ldr r1, _08139A28
	str r1, [r0]
	movs r0, 0
	movs r1, 0xFF
	bl sub_8046400
	mov r1, r9
	ldrb r2, [r1]
	lsls r1, r2, 4
	adds r1, r2
	lsls r1, 2
	adds r1, r5
	lsls r0, 24
	lsrs r0, 24
	strh r0, [r1, 0x2E]
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_08139A00: .4byte 0x02017800
_08139A04: .4byte gUnknown_02024A6A
_08139A08: .4byte gUnknown_02023A60
_08139A0C: .4byte gPlayerParty
_08139A10: .4byte sub_80312F0
_08139A14: .4byte gUnknown_0300434C
_08139A18: .4byte gUnknown_02024E8C
_08139A1C: .4byte gUnknown_02024BE0
_08139A20: .4byte gSprites
_08139A24: .4byte gUnknown_02024E84
_08139A28: .4byte SpriteCallbackDummy
	thumb_func_end sub_81398BC

	thumb_func_start sub_8139A2C
sub_8139A2C: @ 8139A2C
	push {r4-r6,lr}
	lsls r0, 24
	lsrs r6, r0, 24
	ldr r1, _08139A4C
	lsls r0, r6, 2
	adds r0, r6
	lsls r0, 3
	adds r1, r0, r1
	ldrh r2, [r1, 0xA]
	movs r3, 0xA
	ldrsh r0, [r1, r3]
	cmp r0, 0x1E
	bgt _08139A50
	adds r0, r2, 0x1
	strh r0, [r1, 0xA]
	b _08139A86
	.align 2, 0
_08139A4C: .4byte gTasks
_08139A50:
	ldr r4, _08139A8C
	ldrb r5, [r4]
	ldrh r0, [r1, 0x8]
	strb r0, [r4]
	ldr r0, _08139A90
	ldrb r1, [r4]
	lsls r2, r1, 9
	adds r0, 0x1
	adds r2, r0
	ldr r0, _08139A94
	lsls r1, 1
	adds r1, r0
	ldrh r0, [r1]
	strb r0, [r2]
	ldrb r0, [r4]
	bl sub_81398BC
	ldr r1, _08139A98
	ldrb r0, [r4]
	lsls r0, 2
	adds r0, r1
	ldr r1, _08139A9C
	str r1, [r0]
	strb r5, [r4]
	adds r0, r6, 0
	bl DestroyTask
_08139A86:
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_08139A8C: .4byte gUnknown_02024A60
_08139A90: .4byte gUnknown_02023A60
_08139A94: .4byte gUnknown_02024A6A
_08139A98: .4byte gUnknown_03004330
_08139A9C: .4byte sub_8137538
	thumb_func_end sub_8139A2C

	thumb_func_start sub_8139AA0
sub_8139AA0: @ 8139AA0
	push {r4,r5,lr}
	ldr r1, _08139AC8
	ldr r0, _08139ACC
	ldrb r2, [r0]
	lsls r0, r2, 9
	adds r1, 0x1
	adds r0, r1
	ldrb r0, [r0]
	cmp r0, 0
	beq _08139AD0
	adds r0, r2, 0
	bl battle_side_get_owner
	lsls r0, 24
	cmp r0, 0
	bne _08139AD0
	bl dp01_tbl5_exec_completed
	b _08139B0A
	.align 2, 0
_08139AC8: .4byte gUnknown_02023A60
_08139ACC: .4byte gUnknown_02024A60
_08139AD0:
	ldr r5, _08139B10
	ldrb r1, [r5]
	lsls r0, r1, 1
	adds r0, r1
	lsls r0, 2
	ldr r1, _08139B14
	adds r0, r1
	ldrb r1, [r0]
	movs r2, 0x1
	orrs r1, r2
	strb r1, [r0]
	ldrb r0, [r5]
	lsls r4, r0, 9
	ldr r3, _08139B18
	adds r1, r4, r3
	subs r2, r3, 0x3
	adds r2, r4, r2
	ldrb r2, [r2]
	subs r3, 0x2
	adds r4, r3
	ldrb r3, [r4]
	bl sub_8044804
	ldr r2, _08139B1C
	ldrb r1, [r5]
	adds r1, r2
	strb r0, [r1]
	bl dp01_tbl5_exec_completed
_08139B0A:
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_08139B10: .4byte gUnknown_02024A60
_08139B14: .4byte 0x02017810
_08139B18: .4byte gUnknown_02023A64
_08139B1C: .4byte gUnknown_02024E68
	thumb_func_end sub_8139AA0

	thumb_func_start sub_8139B20
sub_8139B20: @ 8139B20
	push {lr}
	bl dp01_tbl5_exec_completed
	pop {r0}
	bx r0
	thumb_func_end sub_8139B20

	thumb_func_start sub_8139B2C
sub_8139B2C: @ 8139B2C
	push {lr}
	bl dp01_tbl5_exec_completed
	pop {r0}
	bx r0
	thumb_func_end sub_8139B2C

	thumb_func_start sub_8139B38
sub_8139B38: @ 8139B38
	push {lr}
	bl dp01_tbl5_exec_completed
	pop {r0}
	bx r0
	thumb_func_end sub_8139B38

	thumb_func_start sub_8139B44
sub_8139B44: @ 8139B44
	push {r4-r6,lr}
	sub sp, 0x4
	ldr r5, _08139B7C
	ldr r6, _08139B80
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
	beq _08139B84
	bl dp01_tbl5_exec_completed
	b _08139B90
	.align 2, 0
_08139B7C: .4byte gUnknown_02023A60
_08139B80: .4byte gUnknown_02024A60
_08139B84:
	ldr r0, _08139B98
	ldrb r1, [r6]
	lsls r1, 2
	adds r1, r0
	ldr r0, _08139B9C
	str r0, [r1]
_08139B90:
	add sp, 0x4
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_08139B98: .4byte gUnknown_03004330
_08139B9C: .4byte sub_8137940
	thumb_func_end sub_8139B44

	thumb_func_start sub_8139BA0
sub_8139BA0: @ 8139BA0
	push {lr}
	bl dp01_tbl5_exec_completed
	pop {r0}
	bx r0
	thumb_func_end sub_8139BA0

	thumb_func_start sub_8139BAC
sub_8139BAC: @ 8139BAC
	push {lr}
	bl dp01_tbl5_exec_completed
	pop {r0}
	bx r0
	thumb_func_end sub_8139BAC

	thumb_func_start sub_8139BB8
sub_8139BB8: @ 8139BB8
	push {r4,lr}
	ldr r2, _08139BFC
	ldr r1, _08139C00
	ldr r4, _08139C04
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
	bl dp01_tbl5_exec_completed
	ldr r0, _08139C08
	ldrh r1, [r0]
	movs r0, 0x6
	ands r0, r1
	cmp r0, 0x2
	bne _08139BF4
	ldr r0, _08139C0C
	ldrb r1, [r4]
	lsls r1, 2
	adds r1, r0
	ldr r0, _08139C10
	str r0, [r1]
_08139BF4:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08139BFC: .4byte gUnknown_02024D26
_08139C00: .4byte gUnknown_02023A60
_08139C04: .4byte gUnknown_02024A60
_08139C08: .4byte gUnknown_020239F8
_08139C0C: .4byte gUnknown_03004330
_08139C10: .4byte sub_813746C
	thumb_func_end sub_8139BB8

	thumb_func_start nullsub_80
nullsub_80: @ 8139C14
	bx lr
	thumb_func_end nullsub_80

	thumb_func_start sub_8139C18
sub_8139C18: @ 8139C18
	push {r4-r6,lr}
	movs r4, 0
	ldr r0, _08139C6C
	movs r1, 0x32
	bl sub_80A9684
	ldr r1, _08139C70
	ldrh r0, [r1]
	cmp r0, 0
	beq _08139C64
	ldrh r0, [r1, 0x2]
	cmp r0, 0
	beq _08139C64
	adds r5, r1, 0
	adds r6, r5, 0x2
_08139C36:
	lsls r1, r4, 2
	adds r0, r1, r5
	ldrh r0, [r0]
	adds r1, r6
	ldrh r1, [r1]
	bl sub_80A9760
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _08139C64
	adds r0, r4, 0x1
	lsls r0, 24
	lsrs r4, r0, 24
	lsls r1, r4, 2
	adds r0, r1, r5
	ldrh r0, [r0]
	cmp r0, 0
	beq _08139C64
	adds r0, r1, r6
	ldrh r0, [r0]
	cmp r0, 0
	bne _08139C36
_08139C64:
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_08139C6C: .4byte gSaveBlock1 + 0x498
_08139C70: .4byte gUnknown_084062F0
	thumb_func_end sub_8139C18

	thumb_func_start sub_8139C74
sub_8139C74: @ 8139C74
	push {lr}
	ldr r1, _08139C9C
	ldr r0, _08139CA0
	str r0, [r1]
	ldr r1, _08139CA4
	movs r0, 0x4
	strb r0, [r1]
	ldr r0, _08139CA8
	movs r1, 0
	bl CreateTask
	lsls r0, 24
	lsrs r0, 24
	ldr r1, _08139CAC
	ldr r2, _08139CB0
	movs r3, 0
	bl DisplayItemMessageOnField
	pop {r0}
	bx r0
	.align 2, 0
_08139C9C: .4byte gUnknown_02039314
_08139CA0: .4byte gUnknown_084062B8
_08139CA4: .4byte gUnknown_030007B4
_08139CA8: .4byte TaskDummy
_08139CAC: .4byte gOtherText_WhatWillYouDo
_08139CB0: .4byte sub_8139CF4
	thumb_func_end sub_8139C74

	thumb_func_start sub_8139CB4
sub_8139CB4: @ 8139CB4
	push {lr}
	ldr r1, _08139CDC
	ldr r0, _08139CE0
	str r0, [r1]
	ldr r1, _08139CE4
	movs r0, 0x3
	strb r0, [r1]
	ldr r0, _08139CE8
	movs r1, 0
	bl CreateTask
	lsls r0, 24
	lsrs r0, 24
	ldr r1, _08139CEC
	ldr r2, _08139CF0
	movs r3, 0
	bl DisplayItemMessageOnField
	pop {r0}
	bx r0
	.align 2, 0
_08139CDC: .4byte gUnknown_02039314
_08139CE0: .4byte gUnknown_084062BC
_08139CE4: .4byte gUnknown_030007B4
_08139CE8: .4byte TaskDummy
_08139CEC: .4byte gOtherText_WhatWillYouDo
_08139CF0: .4byte sub_8139CF4
	thumb_func_end sub_8139CB4

	thumb_func_start sub_8139CF4
sub_8139CF4: @ 8139CF4
	push {r4,r5,lr}
	sub sp, 0x8
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	ldr r5, _08139D50
	ldrb r3, [r5]
	lsls r3, 1
	adds r3, 0x1
	lsls r3, 24
	lsrs r3, 24
	movs r0, 0
	movs r1, 0
	movs r2, 0xA
	bl MenuDrawTextWindow
	ldrb r2, [r5]
	ldr r3, _08139D54
	ldr r0, _08139D58
	ldr r0, [r0]
	str r0, [sp]
	movs r0, 0x1
	movs r1, 0x1
	bl PrintMenuItemsReordered
	ldrb r3, [r5]
	movs r0, 0
	str r0, [sp]
	movs r0, 0x9
	str r0, [sp, 0x4]
	movs r0, 0
	movs r1, 0x1
	movs r2, 0x1
	bl InitMenu
	ldr r1, _08139D5C
	lsls r0, r4, 2
	adds r0, r4
	lsls r0, 3
	adds r0, r1
	ldr r1, _08139D60
	str r1, [r0]
	add sp, 0x8
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_08139D50: .4byte gUnknown_030007B4
_08139D54: .4byte gUnknown_08406298
_08139D58: .4byte gUnknown_02039314
_08139D5C: .4byte gTasks
_08139D60: .4byte sub_8139D64
	thumb_func_end sub_8139CF4

	thumb_func_start sub_8139D64
sub_8139D64: @ 8139D64
	push {r4,r5,lr}
	lsls r0, 24
	lsrs r5, r0, 24
	adds r4, r5, 0
	ldr r2, _08139D88
	ldrh r1, [r2, 0x30]
	movs r0, 0x40
	ands r0, r1
	cmp r0, 0
	beq _08139D8C
	movs r0, 0x5
	bl PlaySE
	movs r0, 0x1
	negs r0, r0
	bl MoveMenuCursor
	b _08139E10
	.align 2, 0
_08139D88: .4byte gMain
_08139D8C:
	movs r0, 0x80
	ands r0, r1
	cmp r0, 0
	beq _08139DA2
	movs r0, 0x5
	bl PlaySE
	movs r0, 0x1
	bl MoveMenuCursor
	b _08139E10
_08139DA2:
	ldrh r1, [r2, 0x2E]
	movs r0, 0x1
	ands r0, r1
	cmp r0, 0
	beq _08139DE0
	bl sub_8072DEC
	movs r0, 0x5
	bl PlaySE
	ldr r4, _08139DD8
	bl GetMenuCursorPos
	lsls r0, 24
	lsrs r0, 24
	ldr r1, _08139DDC
	ldr r1, [r1]
	adds r1, r0
	ldrb r0, [r1]
	lsls r0, 3
	adds r4, 0x4
	adds r0, r4
	ldr r1, [r0]
	adds r0, r5, 0
	bl _call_via_r1
	b _08139E10
	.align 2, 0
_08139DD8: .4byte gUnknown_08406298
_08139DDC: .4byte gUnknown_02039314
_08139DE0:
	movs r0, 0x2
	ands r0, r1
	cmp r0, 0
	beq _08139E10
	bl sub_8072DEC
	movs r0, 0x5
	bl PlaySE
	ldr r2, _08139E18
	ldr r0, _08139E1C
	ldrb r0, [r0]
	ldr r1, _08139E20
	ldr r1, [r1]
	adds r0, r1
	subs r0, 0x1
	ldrb r0, [r0]
	lsls r0, 3
	adds r2, 0x4
	adds r0, r2
	ldr r1, [r0]
	adds r0, r4, 0
	bl _call_via_r1
_08139E10:
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_08139E18: .4byte gUnknown_08406298
_08139E1C: .4byte gUnknown_030007B4
_08139E20: .4byte gUnknown_02039314
	thumb_func_end sub_8139D64

	thumb_func_start sub_8139E24
sub_8139E24: @ 8139E24
	push {lr}
	lsls r0, 24
	lsrs r0, 24
	ldr r1, _08139E38
	ldr r2, _08139E3C
	movs r3, 0
	bl DisplayItemMessageOnField
	pop {r0}
	bx r0
	.align 2, 0
_08139E38: .4byte gOtherText_WhatWillYouDo
_08139E3C: .4byte sub_8139CF4
	thumb_func_end sub_8139E24

	thumb_func_start sub_8139E40
sub_8139E40: @ 8139E40
	push {r4,lr}
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	movs r0, 0
	bl sub_8139F58
	ldr r1, _08139E64
	lsls r0, r4, 2
	adds r0, r4
	lsls r0, 3
	adds r0, r1
	ldr r1, _08139E68
	str r1, [r0]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08139E64: .4byte gTasks
_08139E68: .4byte sub_8139FD4
	thumb_func_end sub_8139E40

	thumb_func_start sub_8139E6C
sub_8139E6C: @ 8139E6C
	push {r4,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	movs r0, 0
	movs r1, 0
	movs r2, 0xA
	movs r3, 0x9
	bl MenuZeroFillWindowRect
	bl sub_813AF3C
	ldr r1, _08139E9C
	movs r2, 0
	strb r0, [r1, 0x3]
	lsls r0, 24
	cmp r0, 0
	bne _08139EA8
	ldr r1, _08139EA0
	ldr r2, _08139EA4
	adds r0, r4, 0
	movs r3, 0
	bl DisplayItemMessageOnField
	b _08139ECA
	.align 2, 0
_08139E9C: .4byte 0x0201fe00
_08139EA0: .4byte gOtherText_NoMailHere
_08139EA4: .4byte sub_8139E24
_08139EA8:
	strb r2, [r1]
	strb r2, [r1, 0x2]
	bl sub_813AF78
	adds r0, r4, 0
	bl sub_813A240
	adds r0, r4, 0
	bl sub_813B108
	ldr r0, _08139ED0
	lsls r1, r4, 2
	adds r1, r4
	lsls r1, 3
	adds r1, r0
	ldr r0, _08139ED4
	str r0, [r1]
_08139ECA:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08139ED0: .4byte gTasks
_08139ED4: .4byte sub_813B174
	thumb_func_end sub_8139E6C

	thumb_func_start sub_8139ED8
sub_8139ED8: @ 8139ED8
	push {r4,lr}
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	movs r0, 0
	movs r1, 0
	movs r2, 0xA
	movs r3, 0x9
	bl MenuZeroFillWindowRect
	adds r0, r4, 0
	bl sub_80FE28C
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end sub_8139ED8

	thumb_func_start sub_8139EF8
sub_8139EF8: @ 8139EF8
	push {r4,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	ldr r0, _08139F24
	ldrb r0, [r0]
	cmp r0, 0x4
	bne _08139F3C
	movs r0, 0
	movs r1, 0
	movs r2, 0x1D
	movs r3, 0x13
	bl MenuZeroFillWindowRect
	ldr r0, _08139F28
	ldrb r0, [r0, 0x8]
	cmp r0, 0
	bne _08139F30
	ldr r0, _08139F2C
	bl ScriptContext1_SetupScript
	b _08139F4C
	.align 2, 0
_08139F24: .4byte gUnknown_030007B4
_08139F28: .4byte gSaveBlock2
_08139F2C: .4byte gUnknown_08152850
_08139F30:
	ldr r0, _08139F38
	bl ScriptContext1_SetupScript
	b _08139F4C
	.align 2, 0
_08139F38: .4byte gUnknown_08152C75
_08139F3C:
	movs r0, 0
	movs r1, 0
	movs r2, 0xA
	movs r3, 0x9
	bl MenuZeroFillWindowRect
	bl EnableBothScriptContexts
_08139F4C:
	adds r0, r4, 0
	bl DestroyTask
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end sub_8139EF8

	thumb_func_start sub_8139F58
sub_8139F58: @ 8139F58
	push {r4,lr}
	sub sp, 0x8
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	movs r0, 0
	movs r1, 0
	movs r2, 0xA
	movs r3, 0x9
	bl MenuZeroFillWindowRect
	movs r0, 0
	movs r1, 0
	movs r2, 0xB
	movs r3, 0x9
	bl MenuDrawTextWindow
	ldr r3, _08139FAC
	movs r0, 0x1
	movs r1, 0x1
	movs r2, 0x4
	bl PrintMenuItems
	str r4, [sp]
	movs r0, 0xA
	str r0, [sp, 0x4]
	movs r0, 0
	movs r1, 0x1
	movs r2, 0x1
	movs r3, 0x4
	bl InitMenu
	ldr r0, _08139FB0
	lsls r4, 2
	adds r4, r0
	ldr r0, [r4]
	bl sub_8139FB4
	add sp, 0x8
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08139FAC: .4byte gUnknown_084062C0
_08139FB0: .4byte gUnknown_08406288
	thumb_func_end sub_8139F58

	thumb_func_start sub_8139FB4
sub_8139FB4: @ 8139FB4
	push {r4,lr}
	adds r4, r0, 0
	movs r0, 0x2
	movs r1, 0xF
	movs r2, 0x1B
	movs r3, 0x12
	bl MenuFillWindowRectWithBlankTile
	adds r0, r4, 0
	movs r1, 0x2
	movs r2, 0xF
	bl MenuPrint
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end sub_8139FB4

	thumb_func_start sub_8139FD4
sub_8139FD4: @ 8139FD4
	push {r4,r5,lr}
	lsls r0, 24
	lsrs r5, r0, 24
	adds r4, r5, 0
	ldr r2, _08139FF4
	ldrh r1, [r2, 0x30]
	movs r0, 0x40
	ands r0, r1
	cmp r0, 0
	beq _08139FF8
	movs r0, 0x5
	bl PlaySE
	movs r0, 0x1
	negs r0, r0
	b _0813A008
	.align 2, 0
_08139FF4: .4byte gMain
_08139FF8:
	movs r0, 0x80
	ands r0, r1
	cmp r0, 0
	beq _0813A024
	movs r0, 0x5
	bl PlaySE
	movs r0, 0x1
_0813A008:
	bl MoveMenuCursor
	ldr r4, _0813A020
	bl GetMenuCursorPos
	lsls r0, 24
	lsrs r0, 22
	adds r0, r4
	ldr r0, [r0]
	bl sub_8139FB4
	b _0813A06C
	.align 2, 0
_0813A020: .4byte gUnknown_08406288
_0813A024:
	ldrh r1, [r2, 0x2E]
	movs r0, 0x1
	ands r0, r1
	cmp r0, 0
	beq _0813A050
	movs r0, 0x5
	bl PlaySE
	ldr r4, _0813A04C
	bl GetMenuCursorPos
	lsls r0, 24
	lsrs r0, 21
	adds r4, 0x4
	adds r0, r4
	ldr r1, [r0]
	adds r0, r5, 0
	bl _call_via_r1
	b _0813A06C
	.align 2, 0
_0813A04C: .4byte gUnknown_084062C0
_0813A050:
	movs r0, 0x2
	ands r0, r1
	cmp r0, 0
	beq _0813A06C
	bl sub_8072DEC
	movs r0, 0x5
	bl PlaySE
	ldr r0, _0813A074
	ldr r1, [r0, 0x1C]
	adds r0, r4, 0
	bl _call_via_r1
_0813A06C:
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_0813A074: .4byte gUnknown_084062C0
	thumb_func_end sub_8139FD4

	thumb_func_start sub_813A078
sub_813A078: @ 813A078
	push {r4,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	ldr r0, _0813A09C
	ldrb r1, [r0, 0x7]
	movs r0, 0x80
	ands r0, r1
	cmp r0, 0
	bne _0813A094
	bl sub_80A6A30
	adds r0, r4, 0
	bl DestroyTask
_0813A094:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0813A09C: .4byte gPaletteFade
	thumb_func_end sub_813A078

	thumb_func_start sub_813A0A0
sub_813A0A0: @ 813A0A0
	push {lr}
	lsls r0, 24
	lsrs r0, 24
	ldr r2, _0813A0C0
	lsls r1, r0, 2
	adds r1, r0
	lsls r1, 3
	adds r1, r2
	ldr r0, _0813A0C4
	str r0, [r1]
	movs r0, 0x1
	movs r1, 0
	bl fade_screen
	pop {r0}
	bx r0
	.align 2, 0
_0813A0C0: .4byte gTasks
_0813A0C4: .4byte sub_813A078
	thumb_func_end sub_813A0A0

	thumb_func_start sub_813A0C8
sub_813A0C8: @ 813A0C8
	push {r4,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	bl sub_807D770
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _0813A0E8
	ldr r0, _0813A0F0
	lsls r1, r4, 2
	adds r1, r4
	lsls r1, 3
	adds r1, r0
	ldr r0, _0813A0F4
	str r0, [r1]
_0813A0E8:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0813A0F0: .4byte gTasks
_0813A0F4: .4byte sub_8139FD4
	thumb_func_end sub_813A0C8

	thumb_func_start sub_813A0F8
sub_813A0F8: @ 813A0F8
	push {lr}
	bl MenuDisplayMessageBox
	movs r0, 0x1
	bl sub_8139F58
	ldr r0, _0813A114
	movs r1, 0
	bl CreateTask
	bl pal_fill_black
	pop {r0}
	bx r0
	.align 2, 0
_0813A114: .4byte sub_813A0C8
	thumb_func_end sub_813A0F8

	thumb_func_start sub_813A118
sub_813A118: @ 813A118
	push {r4-r7,lr}
	lsls r0, 24
	lsrs r5, r0, 24
	lsls r0, r5, 2
	adds r0, r5
	lsls r6, r0, 3
	ldr r7, _0813A174
	adds r4, r6, r7
	bl sub_8072DEC
	movs r0, 0
	movs r1, 0
	movs r2, 0xB
	movs r3, 0x9
	bl MenuZeroFillWindowRect
	bl sub_80A96E4
	lsls r0, 24
	lsrs r0, 24
	strh r0, [r4, 0x4]
	cmp r0, 0
	beq _0813A17C
	movs r0, 0
	movs r1, 0xE
	movs r2, 0x1D
	movs r3, 0x13
	bl MenuZeroFillWindowRect
	movs r0, 0
	strh r0, [r4, 0xC]
	strh r0, [r4]
	strh r0, [r4, 0x2]
	adds r0, r5, 0
	bl sub_813A240
	adds r0, r5, 0
	movs r1, 0
	bl sub_813AE6C
	adds r0, r7, 0
	subs r0, 0x8
	adds r0, r6, r0
	ldr r1, _0813A178
	str r1, [r0]
	b _0813A188
	.align 2, 0
_0813A174: .4byte gUnknown_03004B28
_0813A178: .4byte sub_813A280
_0813A17C:
	ldr r1, _0813A190
	ldr r2, _0813A194
	adds r0, r5, 0
	movs r3, 0
	bl DisplayItemMessageOnField
_0813A188:
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_0813A190: .4byte gOtherText_NoItems
_0813A194: .4byte sub_8139E40
	thumb_func_end sub_813A118

	thumb_func_start sub_813A198
sub_813A198: @ 813A198
	push {r4-r7,lr}
	lsls r0, 24
	lsrs r5, r0, 24
	lsls r0, r5, 2
	adds r0, r5
	lsls r6, r0, 3
	ldr r7, _0813A1F8
	adds r4, r6, r7
	bl sub_8072DEC
	movs r0, 0
	movs r1, 0
	movs r2, 0xB
	movs r3, 0x9
	bl MenuZeroFillWindowRect
	bl sub_80A96E4
	lsls r0, 24
	lsrs r0, 24
	strh r0, [r4, 0x4]
	cmp r0, 0
	beq _0813A200
	movs r0, 0
	movs r1, 0xE
	movs r2, 0x1D
	movs r3, 0x13
	bl MenuZeroFillWindowRect
	movs r0, 0x2
	strh r0, [r4, 0xC]
	movs r0, 0
	strh r0, [r4]
	strh r0, [r4, 0x2]
	adds r0, r5, 0
	bl sub_813A240
	adds r0, r5, 0
	movs r1, 0x2
	bl sub_813AE6C
	adds r0, r7, 0
	subs r0, 0x8
	adds r0, r6, r0
	ldr r1, _0813A1FC
	str r1, [r0]
	b _0813A20C
	.align 2, 0
_0813A1F8: .4byte gUnknown_03004B28
_0813A1FC: .4byte sub_813A280
_0813A200:
	ldr r1, _0813A214
	ldr r2, _0813A218
	adds r0, r5, 0
	movs r3, 0
	bl DisplayItemMessageOnField
_0813A20C:
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_0813A214: .4byte gOtherText_NoItems
_0813A218: .4byte sub_8139E40
	thumb_func_end sub_813A198

	thumb_func_start sub_813A21C
sub_813A21C: @ 813A21C
	push {r4,lr}
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	bl sub_8072DEC
	movs r0, 0
	movs r1, 0
	movs r2, 0xB
	movs r3, 0x9
	bl MenuZeroFillWindowRect
	adds r0, r4, 0
	bl sub_8139E24
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end sub_813A21C

	thumb_func_start sub_813A240
sub_813A240: @ 813A240
	push {lr}
	lsls r0, 24
	lsrs r0, 24
	lsls r1, r0, 2
	adds r1, r0
	lsls r1, 3
	ldr r0, _0813A260
	adds r1, r0
	ldrh r2, [r1, 0x4]
	movs r3, 0x4
	ldrsh r0, [r1, r3]
	cmp r0, 0x7
	ble _0813A264
	movs r0, 0x8
	b _0813A266
	.align 2, 0
_0813A260: .4byte gUnknown_03004B28
_0813A264:
	adds r0, r2, 0x1
_0813A266:
	strh r0, [r1, 0x8]
	ldr r1, _0813A274
	ldrb r0, [r1, 0x3]
	cmp r0, 0x7
	bls _0813A278
	movs r0, 0x8
	b _0813A27A
	.align 2, 0
_0813A274: .4byte 0x0201fe00
_0813A278:
	adds r0, 0x1
_0813A27A:
	strb r0, [r1, 0x1]
	pop {r0}
	bx r0
	thumb_func_end sub_813A240

	thumb_func_start sub_813A280
sub_813A280: @ 813A280
	push {r4-r6,lr}
	lsls r0, 24
	lsrs r5, r0, 24
	adds r6, r5, 0
	lsls r0, r5, 2
	adds r0, r5
	lsls r0, 3
	ldr r1, _0813A2DC
	adds r4, r0, r1
	ldr r2, _0813A2E0
	ldrh r1, [r2, 0x30]
	movs r0, 0x40
	ands r0, r1
	cmp r0, 0
	beq _0813A306
	movs r1, 0
	ldrsh r0, [r4, r1]
	cmp r0, 0
	beq _0813A2E4
	movs r0, 0x5
	bl PlaySE
	movs r0, 0x1
	negs r0, r0
	bl MoveMenuCursor
	lsls r0, 24
	lsrs r0, 24
	strh r0, [r4]
	ldrh r1, [r4, 0x2]
	adds r1, r0
	lsls r1, 16
	lsrs r1, 16
	movs r2, 0x12
	ldrsh r0, [r4, r2]
	cmp r0, 0
	beq _0813A2CC
	b _0813A460
_0813A2CC:
	lsls r0, r1, 16
	asrs r1, r0, 16
	movs r2, 0x4
	ldrsh r0, [r4, r2]
	cmp r1, r0
	beq _0813A34C
	b _0813A358
	.align 2, 0
_0813A2DC: .4byte gUnknown_03004B28
_0813A2E0: .4byte gMain
_0813A2E4:
	movs r1, 0x2
	ldrsh r0, [r4, r1]
	cmp r0, 0
	bne _0813A2EE
	b _0813A460
_0813A2EE:
	movs r0, 0x5
	bl PlaySE
	ldrh r0, [r4, 0x2]
	subs r0, 0x1
	strh r0, [r4, 0x2]
	adds r0, r5, 0
	bl sub_813AE0C
	movs r2, 0x12
	ldrsh r0, [r4, r2]
	b _0813A394
_0813A306:
	movs r0, 0x80
	ands r0, r1
	cmp r0, 0
	beq _0813A3A0
	movs r0, 0
	ldrsh r1, [r4, r0]
	movs r2, 0x8
	ldrsh r0, [r4, r2]
	subs r0, 0x1
	cmp r1, r0
	beq _0813A370
	movs r0, 0x5
	bl PlaySE
	movs r0, 0x1
	bl MoveMenuCursor
	lsls r0, 24
	lsrs r0, 24
	strh r0, [r4]
	ldrh r1, [r4, 0x2]
	adds r1, r0
	lsls r1, 16
	lsrs r1, 16
	movs r2, 0x12
	ldrsh r0, [r4, r2]
	cmp r0, 0
	beq _0813A340
	b _0813A460
_0813A340:
	lsls r0, r1, 16
	asrs r1, r0, 16
	movs r2, 0x4
	ldrsh r0, [r4, r2]
	cmp r1, r0
	bne _0813A358
_0813A34C:
	ldr r0, _0813A354
	bl sub_813AD58
	b _0813A460
	.align 2, 0
_0813A354: .4byte 0x0000ffff
_0813A358:
	ldr r0, _0813A36C
	lsls r1, 2
	adds r1, r0
	movs r0, 0x93
	lsls r0, 3
	adds r1, r0
	ldrh r0, [r1]
	bl sub_813AD58
	b _0813A460
	.align 2, 0
_0813A36C: .4byte gSaveBlock1
_0813A370:
	movs r2, 0x2
	ldrsh r0, [r4, r2]
	adds r0, r1
	movs r2, 0x4
	ldrsh r1, [r4, r2]
	cmp r0, r1
	beq _0813A460
	movs r0, 0x5
	bl PlaySE
	ldrh r0, [r4, 0x2]
	adds r0, 0x1
	strh r0, [r4, 0x2]
	adds r0, r5, 0
	bl sub_813AE0C
	movs r1, 0x12
	ldrsh r0, [r4, r1]
_0813A394:
	cmp r0, 0
	beq _0813A460
	movs r0, 0
	bl MoveMenuCursor
	b _0813A460
_0813A3A0:
	ldrh r1, [r2, 0x2E]
	movs r0, 0x4
	ands r0, r1
	cmp r0, 0
	beq _0813A3F0
	movs r2, 0x12
	ldrsh r0, [r4, r2]
	cmp r0, 0
	bne _0813A3E8
	movs r1, 0
	ldrsh r0, [r4, r1]
	movs r2, 0x2
	ldrsh r1, [r4, r2]
	adds r0, r1
	movs r2, 0x4
	ldrsh r1, [r4, r2]
	cmp r0, r1
	beq _0813A3DC
	movs r0, 0x5
	bl PlaySE
	movs r0, 0x1
	strh r0, [r4, 0x12]
	ldrh r0, [r4]
	ldrh r1, [r4, 0x2]
	adds r0, r1
	strh r0, [r4, 0x10]
	ldr r0, _0813A3E4
	bl sub_813AD58
_0813A3DC:
	adds r0, r5, 0
	bl sub_813ABE8
	b _0813A460
	.align 2, 0
_0813A3E4: .4byte 0x0000fff7
_0813A3E8:
	movs r0, 0x5
	bl PlaySE
	b _0813A420
_0813A3F0:
	movs r0, 0x1
	ands r0, r1
	cmp r0, 0
	beq _0813A430
	movs r0, 0x5
	bl PlaySE
	movs r2, 0x12
	ldrsh r0, [r4, r2]
	cmp r0, 0
	bne _0813A420
	movs r1, 0x2
	ldrsh r0, [r4, r1]
	movs r2, 0
	ldrsh r1, [r4, r2]
	adds r0, r1
	movs r2, 0x4
	ldrsh r1, [r4, r2]
	cmp r0, r1
	beq _0813A44A
	adds r0, r5, 0
	bl sub_813A4B4
	b _0813A460
_0813A420:
	adds r0, r5, 0
	movs r1, 0
	bl sub_813AA30
	adds r0, r5, 0
	bl sub_813AE0C
	b _0813A460
_0813A430:
	movs r0, 0x2
	ands r0, r1
	cmp r0, 0
	beq _0813A460
	movs r0, 0x5
	bl PlaySE
	movs r1, 0x12
	ldrsh r0, [r4, r1]
	cmp r0, 0
	bne _0813A452
	bl sub_8072DEC
_0813A44A:
	adds r0, r5, 0
	bl sub_813A468
	b _0813A460
_0813A452:
	adds r0, r6, 0
	movs r1, 0x1
	bl sub_813AA30
	adds r0, r6, 0
	bl sub_813AE0C
_0813A460:
	pop {r4-r6}
	pop {r0}
	bx r0
	thumb_func_end sub_813A280

	thumb_func_start sub_813A468
sub_813A468: @ 813A468
	push {r4,r5,lr}
	adds r5, r0, 0
	lsls r5, 24
	lsrs r5, 24
	bl BuyMenuFreeMemory
	movs r0, 0
	bl SetBgTilemapBuffer
	movs r0, 0x1
	bl SetBgTilemapBuffer
	movs r0, 0
	movs r1, 0
	movs r2, 0x1D
	movs r3, 0x13
	bl MenuZeroFillWindowRect
	bl MenuDisplayMessageBox
	ldr r0, _0813A4AC
	lsls r4, r5, 2
	adds r4, r5
	lsls r4, 3
	adds r4, r0
	ldrb r0, [r4, 0x14]
	bl sub_8139F58
	ldr r0, _0813A4B0
	str r0, [r4]
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_0813A4AC: .4byte gTasks
_0813A4B0: .4byte sub_8139FD4
	thumb_func_end sub_813A468

	thumb_func_start sub_813A4B4
sub_813A4B4: @ 813A4B4
	push {r4-r6,lr}
	sub sp, 0x4
	lsls r0, 24
	lsrs r6, r0, 24
	lsls r0, r6, 2
	adds r0, r6
	lsls r0, 3
	ldr r1, _0813A500
	adds r4, r0, r1
	ldrb r0, [r4, 0x2]
	ldrb r1, [r4]
	adds r0, r1
	lsls r0, 24
	lsrs r5, r0, 24
	movs r0, 0
	bl sub_80F996C
	movs r0, 0x1
	bl sub_80F996C
	movs r1, 0xC
	ldrsh r0, [r4, r1]
	cmp r0, 0
	bne _0813A518
	ldr r1, _0813A504
	lsls r0, r5, 2
	adds r0, r1
	ldr r1, _0813A508
	adds r0, r1
	ldrh r0, [r0]
	cmp r0, 0x1
	bne _0813A50C
	strh r0, [r4, 0x6]
	adds r0, r6, 0
	bl sub_813A6FC
	b _0813A570
	.align 2, 0
_0813A500: .4byte gUnknown_03004B28
_0813A504: .4byte gSaveBlock1
_0813A508: .4byte 0x0000049a
_0813A50C:
	ldr r0, _0813A514
	bl sub_813AD58
	b _0813A542
	.align 2, 0
_0813A514: .4byte 0x0000fffe
_0813A518:
	ldr r1, _0813A534
	lsls r0, r5, 2
	adds r0, r1
	ldr r1, _0813A538
	adds r0, r1
	ldrh r0, [r0]
	cmp r0, 0x1
	bne _0813A53C
	strh r0, [r4, 0x6]
	adds r0, r6, 0
	bl sub_813A794
	b _0813A570
	.align 2, 0
_0813A534: .4byte gSaveBlock1
_0813A538: .4byte 0x0000049a
_0813A53C:
	ldr r0, _0813A578
	bl sub_813AD58
_0813A542:
	movs r0, 0x1
	strh r0, [r4, 0x6]
	movs r0, 0x6
	movs r1, 0x8
	movs r2, 0xD
	movs r3, 0xB
	bl MenuDrawTextWindow
	ldrh r0, [r4, 0x6]
	movs r1, 0x3
	str r1, [sp]
	movs r1, 0x1
	movs r2, 0x8
	movs r3, 0x9
	bl sub_80A418C
	ldr r1, _0813A57C
	lsls r0, r6, 2
	adds r0, r6
	lsls r0, 3
	adds r0, r1
	ldr r1, _0813A580
	str r1, [r0]
_0813A570:
	add sp, 0x4
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_0813A578: .4byte 0x0000fffc
_0813A57C: .4byte gTasks
_0813A580: .4byte sub_813A584
	thumb_func_end sub_813A4B4

	thumb_func_start sub_813A584
sub_813A584: @ 813A584
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	sub sp, 0x4
	lsls r0, 24
	lsrs r5, r0, 24
	lsls r0, r5, 2
	adds r0, r5
	lsls r7, r0, 3
	ldr r0, _0813A5D0
	mov r8, r0
	adds r4, r7, r0
	ldrb r0, [r4, 0x2]
	ldrb r1, [r4]
	adds r0, r1
	lsls r0, 24
	lsrs r3, r0, 24
	adds r6, r3, 0
	ldr r2, _0813A5D4
	ldrh r1, [r2, 0x30]
	movs r0, 0x40
	ands r0, r1
	cmp r0, 0
	beq _0813A5E4
	movs r0, 0x6
	ldrsh r2, [r4, r0]
	ldr r1, _0813A5D8
	lsls r0, r3, 2
	adds r0, r1
	ldr r1, _0813A5DC
	adds r0, r1
	ldrh r0, [r0]
	cmp r2, r0
	beq _0813A5E0
	ldrh r0, [r4, 0x6]
	adds r0, 0x1
	b _0813A64A
	.align 2, 0
_0813A5D0: .4byte gUnknown_03004B28
_0813A5D4: .4byte gMain
_0813A5D8: .4byte gSaveBlock1
_0813A5DC: .4byte 0x0000049a
_0813A5E0:
	movs r0, 0x1
	b _0813A64A
_0813A5E4:
	movs r0, 0x80
	ands r0, r1
	cmp r0, 0
	beq _0813A610
	ldrh r1, [r4, 0x6]
	movs r2, 0x6
	ldrsh r0, [r4, r2]
	cmp r0, 0x1
	beq _0813A5FA
	subs r0, r1, 0x1
	b _0813A64A
_0813A5FA:
	ldr r0, _0813A608
	lsls r1, r3, 2
	adds r1, r0
	ldr r3, _0813A60C
	adds r1, r3
	ldrh r0, [r1]
	b _0813A64A
	.align 2, 0
_0813A608: .4byte gSaveBlock1
_0813A60C: .4byte 0x0000049a
_0813A610:
	movs r0, 0x20
	ands r0, r1
	cmp r0, 0
	beq _0813A628
	ldrh r0, [r4, 0x6]
	subs r0, 0xA
	strh r0, [r4, 0x6]
	lsls r0, 16
	cmp r0, 0
	bgt _0813A64C
	movs r0, 0x1
	b _0813A64A
_0813A628:
	movs r0, 0x10
	ands r0, r1
	cmp r0, 0
	beq _0813A668
	ldrh r0, [r4, 0x6]
	adds r0, 0xA
	strh r0, [r4, 0x6]
	movs r0, 0x6
	ldrsh r2, [r4, r0]
	ldr r1, _0813A660
	lsls r0, r6, 2
	adds r0, r1
	ldr r1, _0813A664
	adds r0, r1
	ldrh r0, [r0]
	cmp r2, r0
	ble _0813A64C
_0813A64A:
	strh r0, [r4, 0x6]
_0813A64C:
	ldrh r0, [r4, 0x6]
	movs r1, 0x3
	str r1, [sp]
	movs r1, 0x1
	movs r2, 0x8
	movs r3, 0x9
	bl sub_80A418C
	b _0813A6E8
	.align 2, 0
_0813A660: .4byte gSaveBlock1
_0813A664: .4byte 0x0000049a
_0813A668:
	ldrh r1, [r2, 0x2E]
	movs r0, 0x1
	ands r0, r1
	cmp r0, 0
	beq _0813A69C
	movs r0, 0x5
	bl PlaySE
	movs r0, 0x6
	movs r1, 0x6
	movs r2, 0xD
	movs r3, 0xB
	bl MenuZeroFillWindowRect
	movs r2, 0xC
	ldrsh r0, [r4, r2]
	cmp r0, 0
	bne _0813A694
	adds r0, r5, 0
	bl sub_813A6FC
	b _0813A6E8
_0813A694:
	adds r0, r5, 0
	bl sub_813A794
	b _0813A6E8
_0813A69C:
	movs r0, 0x2
	ands r0, r1
	cmp r0, 0
	beq _0813A6E8
	movs r0, 0x5
	bl PlaySE
	movs r0, 0x6
	movs r1, 0x6
	movs r2, 0xD
	movs r3, 0xB
	bl MenuZeroFillWindowRect
	movs r0, 0
	bl sub_80F98DC
	movs r0, 0x1
	bl sub_80F98DC
	ldr r2, _0813A6F4
	movs r3, 0x2
	ldrsh r0, [r4, r3]
	movs r3, 0
	ldrsh r1, [r4, r3]
	adds r0, r1
	lsls r0, 2
	adds r0, r2
	movs r1, 0x93
	lsls r1, 3
	adds r0, r1
	ldrh r0, [r0]
	bl sub_813AD58
	mov r0, r8
	subs r0, 0x8
	adds r0, r7, r0
	ldr r1, _0813A6F8
	str r1, [r0]
_0813A6E8:
	add sp, 0x4
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_0813A6F4: .4byte gSaveBlock1
_0813A6F8: .4byte sub_813A280
	thumb_func_end sub_813A584

	thumb_func_start sub_813A6FC
sub_813A6FC: @ 813A6FC
	push {r4-r7,lr}
	lsls r0, 24
	lsrs r0, 24
	lsls r1, r0, 2
	adds r1, r0
	lsls r6, r1, 3
	ldr r7, _0813A758
	adds r4, r6, r7
	ldrb r0, [r4, 0x2]
	ldrb r1, [r4]
	adds r0, r1
	lsls r0, 24
	ldr r1, _0813A75C
	lsrs r0, 22
	adds r0, r1
	movs r2, 0x93
	lsls r2, 3
	adds r5, r0, r2
	ldrh r0, [r5]
	ldrh r1, [r4, 0x6]
	bl sub_80A9424
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _0813A770
	ldrh r0, [r5]
	ldr r1, _0813A760
	bl itemid_copy_name
	ldr r0, _0813A764
	movs r2, 0x6
	ldrsh r1, [r4, r2]
	movs r2, 0
	movs r3, 0x3
	bl ConvertIntToDecimalStringN
	ldr r0, _0813A768
	bl sub_813AD58
	adds r0, r7, 0
	subs r0, 0x8
	adds r0, r6, r0
	ldr r1, _0813A76C
	b _0813A782
	.align 2, 0
_0813A758: .4byte gUnknown_03004B28
_0813A75C: .4byte gSaveBlock1
_0813A760: .4byte gStringVar1
_0813A764: .4byte gStringVar2
_0813A768: .4byte 0x0000fffd
_0813A76C: .4byte sub_813A8F0
_0813A770:
	movs r0, 0
	strh r0, [r4, 0x6]
	ldr r0, _0813A78C
	bl sub_813AD58
	adds r0, r7, 0
	subs r0, 0x8
	adds r0, r6, r0
	ldr r1, _0813A790
_0813A782:
	str r1, [r0]
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_0813A78C: .4byte 0x0000fffa
_0813A790: .4byte sub_813A984
	thumb_func_end sub_813A6FC

	thumb_func_start sub_813A794
sub_813A794: @ 813A794
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	lsls r0, 24
	lsrs r6, r0, 24
	lsls r0, r6, 2
	adds r0, r6
	lsls r7, r0, 3
	ldr r0, _0813A7FC
	mov r8, r0
	adds r4, r7, r0
	ldrb r0, [r4, 0x2]
	ldrb r1, [r4]
	adds r0, r1
	lsls r0, 24
	ldr r1, _0813A800
	lsrs r0, 22
	adds r0, r1
	movs r2, 0x93
	lsls r2, 3
	adds r5, r0, r2
	ldrh r0, [r5]
	bl itemid_is_unique
	lsls r0, 24
	cmp r0, 0
	bne _0813A814
	ldrh r0, [r5]
	ldr r1, _0813A804
	bl itemid_copy_name
	ldr r0, _0813A808
	movs r2, 0x6
	ldrsh r1, [r4, r2]
	movs r2, 0
	movs r3, 0x3
	bl ConvertIntToDecimalStringN
	ldr r0, _0813A80C
	bl sub_813AD58
	movs r0, 0x7
	movs r1, 0x6
	movs r2, 0x1
	bl DisplayYesNoMenu
	ldr r1, _0813A810
	adds r0, r6, 0
	bl sub_80F914C
	b _0813A828
	.align 2, 0
_0813A7FC: .4byte gUnknown_03004B28
_0813A800: .4byte gSaveBlock1
_0813A804: .4byte gStringVar1
_0813A808: .4byte gStringVar2
_0813A80C: .4byte 0x0000fff8
_0813A810: .4byte gUnknown_084062E0
_0813A814:
	movs r0, 0
	strh r0, [r4, 0x6]
	ldr r0, _0813A834
	bl sub_813AD58
	mov r0, r8
	subs r0, 0x8
	adds r0, r7, r0
	ldr r1, _0813A838
	str r1, [r0]
_0813A828:
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_0813A834: .4byte 0x0000fff9
_0813A838: .4byte sub_813A8F0
	thumb_func_end sub_813A794

	thumb_func_start sub_813A83C
sub_813A83C: @ 813A83C
	push {r4,lr}
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	movs r0, 0x6
	movs r1, 0x6
	movs r2, 0xD
	movs r3, 0xB
	bl MenuZeroFillWindowRect
	ldr r0, _0813A86C
	bl sub_813AD58
	ldr r1, _0813A870
	lsls r0, r4, 2
	adds r0, r4
	lsls r0, 3
	adds r0, r1
	ldr r1, _0813A874
	str r1, [r0]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0813A86C: .4byte 0x0000fffb
_0813A870: .4byte gTasks
_0813A874: .4byte sub_813A8F0
	thumb_func_end sub_813A83C

	thumb_func_start sub_813A878
sub_813A878: @ 813A878
	push {r4-r6,lr}
	sub sp, 0x8
	lsls r0, 24
	lsrs r0, 24
	lsls r4, r0, 2
	adds r4, r0
	lsls r4, 3
	ldr r6, _0813A8E4
	adds r5, r4, r6
	movs r0, 0x6
	movs r1, 0x6
	movs r2, 0xD
	movs r3, 0xB
	bl MenuZeroFillWindowRect
	ldrb r3, [r5, 0x8]
	ldrb r0, [r5]
	str r0, [sp]
	movs r0, 0xD
	str r0, [sp, 0x4]
	movs r0, 0
	movs r1, 0x10
	movs r2, 0x2
	bl InitMenu
	movs r0, 0
	bl sub_80F98DC
	movs r0, 0x1
	bl sub_80F98DC
	ldr r2, _0813A8E8
	movs r1, 0x2
	ldrsh r0, [r5, r1]
	movs r3, 0
	ldrsh r1, [r5, r3]
	adds r0, r1
	lsls r0, 2
	adds r0, r2
	movs r1, 0x93
	lsls r1, 3
	adds r0, r1
	ldrh r0, [r0]
	bl sub_813AD58
	subs r6, 0x8
	adds r4, r6
	ldr r0, _0813A8EC
	str r0, [r4]
	add sp, 0x8
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_0813A8E4: .4byte gUnknown_03004B28
_0813A8E8: .4byte gSaveBlock1
_0813A8EC: .4byte sub_813A280
	thumb_func_end sub_813A878

	thumb_func_start sub_813A8F0
sub_813A8F0: @ 813A8F0
	push {r4-r6,lr}
	sub sp, 0x8
	lsls r0, 24
	lsrs r6, r0, 24
	lsls r0, r6, 2
	adds r0, r6
	lsls r0, 3
	ldr r1, _0813A97C
	adds r5, r0, r1
	ldr r0, _0813A980
	ldrh r1, [r0, 0x2E]
	movs r0, 0x1
	ands r0, r1
	cmp r0, 0
	bne _0813A912
	cmp r1, 0x2
	bne _0813A972
_0813A912:
	ldrb r0, [r5, 0x2]
	ldrb r1, [r5]
	adds r0, r1
	lsls r0, 24
	lsrs r0, 24
	ldrh r1, [r5, 0x6]
	bl sub_80A97F4
	ldrh r4, [r5, 0x4]
	bl sub_80A96E4
	lsls r0, 24
	lsrs r0, 24
	strh r0, [r5, 0x4]
	lsls r4, 16
	asrs r4, 16
	cmp r4, r0
	beq _0813A952
	movs r2, 0x8
	ldrsh r0, [r5, r2]
	movs r2, 0x2
	ldrsh r1, [r5, r2]
	adds r0, r1
	cmp r4, r0
	bge _0813A952
	ldrh r1, [r5, 0x2]
	movs r2, 0x2
	ldrsh r0, [r5, r2]
	cmp r0, 0
	beq _0813A952
	subs r0, r1, 0x1
	strh r0, [r5, 0x2]
_0813A952:
	adds r0, r6, 0
	bl sub_813A240
	adds r0, r6, 0
	bl sub_813A9EC
	ldrb r3, [r5, 0x8]
	ldrb r0, [r5]
	str r0, [sp]
	movs r0, 0xD
	str r0, [sp, 0x4]
	movs r0, 0
	movs r1, 0x10
	movs r2, 0x2
	bl InitMenu
_0813A972:
	add sp, 0x8
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_0813A97C: .4byte gUnknown_03004B28
_0813A980: .4byte gMain
	thumb_func_end sub_813A8F0

	thumb_func_start sub_813A984
sub_813A984: @ 813A984
	push {r4-r6,lr}
	lsls r0, 24
	lsrs r0, 24
	lsls r1, r0, 2
	adds r1, r0
	lsls r4, r1, 3
	ldr r5, _0813A9DC
	adds r3, r4, r5
	ldr r0, _0813A9E0
	ldrh r1, [r0, 0x2E]
	movs r0, 0x1
	ands r0, r1
	cmp r0, 0
	bne _0813A9A4
	cmp r1, 0x2
	bne _0813A9D6
_0813A9A4:
	ldr r2, _0813A9E4
	movs r1, 0x2
	ldrsh r0, [r3, r1]
	movs r6, 0
	ldrsh r1, [r3, r6]
	adds r0, r1
	lsls r0, 2
	adds r0, r2
	movs r1, 0x93
	lsls r1, 3
	adds r0, r1
	ldrh r0, [r0]
	bl sub_813AD58
	movs r0, 0
	bl sub_80F98DC
	movs r0, 0x1
	bl sub_80F98DC
	adds r0, r5, 0
	subs r0, 0x8
	adds r0, r4, r0
	ldr r1, _0813A9E8
	str r1, [r0]
_0813A9D6:
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_0813A9DC: .4byte gUnknown_03004B28
_0813A9E0: .4byte gMain
_0813A9E4: .4byte gSaveBlock1
_0813A9E8: .4byte sub_813A280
	thumb_func_end sub_813A984

	thumb_func_start sub_813A9EC
sub_813A9EC: @ 813A9EC
	push {r4,lr}
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	movs r0, 0x6
	movs r1, 0x6
	movs r2, 0xD
	movs r3, 0xB
	bl MenuZeroFillWindowRect
	movs r0, 0
	bl sub_80F98DC
	movs r0, 0x1
	bl sub_80F98DC
	adds r0, r4, 0
	bl sub_813AE0C
	ldr r1, _0813AA28
	lsls r0, r4, 2
	adds r0, r4
	lsls r0, 3
	adds r0, r1
	ldr r1, _0813AA2C
	str r1, [r0]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0813AA28: .4byte gTasks
_0813AA2C: .4byte sub_813A280
	thumb_func_end sub_813A9EC

	thumb_func_start sub_813AA30
sub_813AA30: @ 813AA30
	push {r4,r5,lr}
	lsls r0, 24
	lsrs r0, 24
	lsls r1, 24
	lsrs r2, r1, 24
	lsls r1, r0, 2
	adds r1, r0
	lsls r1, 3
	ldr r0, _0813AA80
	adds r4, r1, r0
	ldrb r0, [r4]
	ldrb r1, [r4, 0x2]
	adds r0, r1
	lsls r0, 24
	lsrs r5, r0, 24
	movs r0, 0
	strh r0, [r4, 0x12]
	ldrb r0, [r4, 0x4]
	cmp r0, r5
	bls _0813AA88
	ldrb r0, [r4, 0x10]
	cmp r0, r5
	beq _0813AA88
	cmp r2, 0
	bne _0813AA88
	ldr r1, _0813AA84
	movs r0, 0x10
	ldrsh r2, [r4, r0]
	lsls r2, 2
	movs r0, 0x93
	lsls r0, 3
	adds r1, r0
	adds r2, r1
	ldr r3, [r2]
	lsls r0, r5, 2
	adds r0, r1
	ldr r1, [r0]
	str r1, [r2]
	str r3, [r0]
	b _0813AAB8
	.align 2, 0
_0813AA80: .4byte gUnknown_03004B28
_0813AA84: .4byte gSaveBlock1
_0813AA88:
	movs r1, 0x4
	ldrsh r0, [r4, r1]
	cmp r5, r0
	bne _0813AA9C
	ldr r0, _0813AA98
	bl sub_813AD58
	b _0813AAAE
	.align 2, 0
_0813AA98: .4byte 0x0000ffff
_0813AA9C:
	ldr r0, _0813AAC0
	lsls r1, r5, 2
	adds r1, r0
	movs r2, 0x93
	lsls r2, 3
	adds r1, r2
	ldrh r0, [r1]
	bl sub_813AD58
_0813AAAE:
	movs r0, 0x10
	ldrsh r1, [r4, r0]
	movs r2, 0x2
	ldrsh r0, [r4, r2]
	subs r0, r1, r0
_0813AAB8:
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_0813AAC0: .4byte gSaveBlock1
	thumb_func_end sub_813AA30

	thumb_func_start sub_813AAC4
sub_813AAC4: @ 813AAC4
	push {r4-r7,lr}
	adds r4, r0, 0
	adds r5, r1, 0
	ldr r6, [sp, 0x14]
	lsls r4, 16
	lsrs r4, 16
	lsls r2, 24
	lsrs r7, r2, 24
	lsls r3, 24
	lsrs r3, 24
	ldr r0, _0813AAF4
	adds r1, r4, 0
	adds r2, r5, 0
	bl sub_80A4164
	cmp r6, 0
	beq _0813AAFC
	ldr r0, _0813AAF8
	movs r1, 0x1A
	adds r2, r7, 0
	bl MenuPrint
	b _0813AB06
	.align 2, 0
_0813AAF4: .4byte gStringVar1
_0813AAF8: .4byte gUnknown_0840632A
_0813AAFC:
	ldr r0, _0813AB0C
	movs r1, 0x1A
	adds r2, r7, 0
	bl MenuPrint
_0813AB06:
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_0813AB0C: .4byte gUnknown_08406327
	thumb_func_end sub_813AAC4

	thumb_func_start sub_813AB10
sub_813AB10: @ 813AB10
	push {lr}
	adds r2, r0, 0
	lsls r2, 24
	lsrs r2, 24
	ldr r0, _0813AB24
	movs r1, 0x19
	bl MenuPrint
	pop {r0}
	bx r0
	.align 2, 0
_0813AB24: .4byte gUnknown_08406330
	thumb_func_end sub_813AB10

	thumb_func_start sub_813AB28
sub_813AB28: @ 813AB28
	push {r4,r5,lr}
	adds r4, r2, 0
	lsls r1, 24
	lsrs r5, r1, 24
	ldrh r0, [r0]
	ldr r1, _0813AB48
	bl itemid_copy_name
	cmp r4, 0
	beq _0813AB50
	ldr r0, _0813AB4C
	movs r1, 0x10
	adds r2, r5, 0
	bl MenuPrint
	b _0813AB5A
	.align 2, 0
_0813AB48: .4byte gStringVar1
_0813AB4C: .4byte gUnknown_0840631E
_0813AB50:
	ldr r0, _0813AB60
	movs r1, 0x10
	adds r2, r5, 0
	bl MenuPrint
_0813AB5A:
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_0813AB60: .4byte gUnknown_08406318
	thumb_func_end sub_813AB28

	thumb_func_start sub_813AB64
sub_813AB64: @ 813AB64
	push {r4-r6,lr}
	sub sp, 0x4
	adds r6, r0, 0
	adds r4, r1, 0
	adds r5, r2, 0
	lsls r4, 24
	lsrs r4, 24
	adds r1, r4, 0
	bl sub_813AB28
	ldrh r0, [r6, 0x2]
	str r5, [sp]
	movs r1, 0x1
	adds r2, r4, 0
	movs r3, 0x3
	bl sub_813AAC4
	add sp, 0x4
	pop {r4-r6}
	pop {r0}
	bx r0
	thumb_func_end sub_813AB64

	thumb_func_start sub_813AB90
sub_813AB90: @ 813AB90
	push {r4,lr}
	adds r4, r1, 0
	lsls r4, 24
	lsrs r4, 24
	adds r1, r4, 0
	bl sub_813AB28
	adds r0, r4, 0
	bl sub_813AB10
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end sub_813AB90

	thumb_func_start sub_813ABAC
sub_813ABAC: @ 813ABAC
	push {r4-r6,lr}
	sub sp, 0x4
	adds r4, r0, 0
	adds r6, r2, 0
	lsls r1, 24
	lsrs r5, r1, 24
	adds r1, r5, 0
	bl sub_813AB28
	ldrh r1, [r4]
	movs r0, 0xA9
	lsls r0, 1
	cmp r1, r0
	bhi _0813ABD8
	ldrh r0, [r4, 0x2]
	str r6, [sp]
	movs r1, 0x1
	adds r2, r5, 0
	movs r3, 0x3
	bl sub_813AAC4
	b _0813ABDE
_0813ABD8:
	adds r0, r5, 0
	bl sub_813AB10
_0813ABDE:
	add sp, 0x4
	pop {r4-r6}
	pop {r0}
	bx r0
	thumb_func_end sub_813ABAC

	thumb_func_start sub_813ABE8
sub_813ABE8: @ 813ABE8
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	sub sp, 0x4
	lsls r0, 24
	lsrs r0, 24
	lsls r1, r0, 2
	adds r1, r0
	lsls r1, 3
	ldr r0, _0813AC0C
	adds r6, r1, r0
	movs r0, 0
	mov r8, r0
	ldrh r5, [r6, 0x2]
	movs r2, 0x2
	ldrsh r1, [r6, r2]
	b _0813ACC4
	.align 2, 0
_0813AC0C: .4byte gUnknown_03004B28
_0813AC10:
	subs r0, r5, r1
	lsls r0, 17
	lsrs r0, 16
	mov r8, r0
	movs r1, 0x4
	ldrsh r0, [r6, r1]
	cmp r5, r0
	beq _0813AD04
	movs r7, 0
	movs r2, 0x12
	ldrsh r0, [r6, r2]
	cmp r0, 0
	beq _0813AC34
	movs r1, 0x10
	ldrsh r0, [r6, r1]
	cmp r5, r0
	bne _0813AC34
	movs r7, 0x1
_0813AC34:
	ldr r0, _0813AC5C
	lsls r4, r5, 2
	adds r0, r4, r0
	movs r2, 0x93
	lsls r2, 3
	adds r0, r2
	ldrh r0, [r0]
	bl sub_80A9670
	lsls r0, 24
	lsrs r0, 24
	subs r0, 0x1
	cmp r0, 0x4
	bhi _0813ACBA
	lsls r0, 2
	ldr r1, _0813AC60
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_0813AC5C: .4byte gSaveBlock1
_0813AC60: .4byte _0813AC64
	.align 2, 0
_0813AC64:
	.4byte _0813AC78
	.4byte _0813AC78
	.4byte _0813ACA8
	.4byte _0813AC78
	.4byte _0813AC90
_0813AC78:
	ldr r0, _0813AC8C
	adds r0, r4, r0
	mov r1, r8
	adds r1, 0x2
	lsls r1, 24
	lsrs r1, 24
	adds r2, r7, 0
	bl sub_813AB64
	b _0813ACBA
	.align 2, 0
_0813AC8C: .4byte gSaveBlock1 + 0x498
_0813AC90:
	ldr r0, _0813ACA4
	adds r0, r4, r0
	mov r1, r8
	adds r1, 0x2
	lsls r1, 24
	lsrs r1, 24
	adds r2, r7, 0
	bl sub_813AB90
	b _0813ACBA
	.align 2, 0
_0813ACA4: .4byte gSaveBlock1 + 0x498
_0813ACA8:
	ldr r0, _0813AD00
	adds r0, r4, r0
	mov r1, r8
	adds r1, 0x2
	lsls r1, 24
	lsrs r1, 24
	adds r2, r7, 0
	bl sub_813ABAC
_0813ACBA:
	adds r0, r5, 0x1
	lsls r0, 16
	lsrs r5, r0, 16
	movs r0, 0x2
	ldrsh r1, [r6, r0]
_0813ACC4:
	movs r2, 0x8
	ldrsh r0, [r6, r2]
	adds r0, r1, r0
	cmp r5, r0
	blt _0813AC10
_0813ACCE:
	movs r1, 0x2
	ldrsh r0, [r6, r1]
	subs r0, r5, r0
	cmp r0, 0x7
	bgt _0813ACEA
	mov r1, r8
	adds r1, 0x4
	lsls r1, 24
	lsrs r1, 24
	movs r0, 0x10
	movs r2, 0x1C
	movs r3, 0x12
	bl MenuFillWindowRectWithBlankTile
_0813ACEA:
	movs r2, 0x2
	ldrsh r0, [r6, r2]
	cmp r0, 0
	beq _0813AD20
	movs r0, 0
	movs r1, 0xB8
	movs r2, 0x8
	bl sub_80F953C
	b _0813AD26
	.align 2, 0
_0813AD00: .4byte gSaveBlock1 + 0x498
_0813AD04:
	ldr r0, _0813AD1C
	mov r2, r8
	adds r2, 0x2
	lsls r2, 19
	lsrs r2, 16
	movs r1, 0x1
	str r1, [sp]
	movs r1, 0x80
	movs r3, 0x68
	bl sub_8072A18
	b _0813ACCE
	.align 2, 0
_0813AD1C: .4byte gOtherText_CancelNoTerminator
_0813AD20:
	movs r0, 0
	bl SetBgTilemapBuffer
_0813AD26:
	movs r1, 0x2
	ldrsh r0, [r6, r1]
	movs r2, 0x8
	ldrsh r1, [r6, r2]
	adds r0, r1
	movs r2, 0x4
	ldrsh r1, [r6, r2]
	cmp r0, r1
	bgt _0813AD44
	movs r0, 0x1
	movs r1, 0xB8
	movs r2, 0x98
	bl sub_80F953C
	b _0813AD4A
_0813AD44:
	movs r0, 0x1
	bl SetBgTilemapBuffer
_0813AD4A:
	add sp, 0x4
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r0}
	bx r0
	thumb_func_end sub_813ABE8

	thumb_func_start sub_813AD58
sub_813AD58: @ 813AD58
	push {lr}
	sub sp, 0x8
	lsls r0, 16
	lsrs r1, r0, 16
	ldr r2, _0813AD74
	adds r0, r1, r2
	cmp r0, 0x8
	bhi _0813ADE8
	lsls r0, 2
	ldr r1, _0813AD78
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_0813AD74: .4byte 0xffff0009
_0813AD78: .4byte _0813AD7C
	.align 2, 0
_0813AD7C:
	.4byte _0813ADE0
	.4byte _0813ADD8
	.4byte _0813ADD0
	.4byte _0813ADC8
	.4byte _0813ADC0
	.4byte _0813ADB8
	.4byte _0813ADB0
	.4byte _0813ADA8
	.4byte _0813ADA0
_0813ADA0:
	ldr r1, _0813ADA4
	b _0813ADF0
	.align 2, 0
_0813ADA4: .4byte gMenuText_GoBackToPrev
_0813ADA8:
	ldr r1, _0813ADAC
	b _0813ADF0
	.align 2, 0
_0813ADAC: .4byte gOtherText_HowManyToWithdraw
_0813ADB0:
	ldr r1, _0813ADB4
	b _0813ADF0
	.align 2, 0
_0813ADB4: .4byte gOtherText_WithdrewThing
_0813ADB8:
	ldr r1, _0813ADBC
	b _0813ADF0
	.align 2, 0
_0813ADBC: .4byte gOtherText_HowManyToToss
_0813ADC0:
	ldr r1, _0813ADC4
	b _0813ADF0
	.align 2, 0
_0813ADC4: .4byte gOtherText_ThrewAwayItem
_0813ADC8:
	ldr r1, _0813ADCC
	b _0813ADF0
	.align 2, 0
_0813ADCC: .4byte gOtherText_NoMoreRoom
_0813ADD0:
	ldr r1, _0813ADD4
	b _0813ADF0
	.align 2, 0
_0813ADD4: .4byte gOtherText_TooImportant
_0813ADD8:
	ldr r1, _0813ADDC
	b _0813ADF0
	.align 2, 0
_0813ADDC: .4byte gOtherText_OkayToThrowAwayPrompt
_0813ADE0:
	ldr r1, _0813ADE4
	b _0813ADF0
	.align 2, 0
_0813ADE4: .4byte gOtherText_SwitchWhichItem
_0813ADE8:
	adds r0, r1, 0
	bl itemid_get_description
	adds r1, r0, 0
_0813ADF0:
	movs r0, 0x30
	str r0, [sp]
	movs r0, 0x1
	str r0, [sp, 0x4]
	adds r0, r1, 0
	movs r1, 0x8
	movs r2, 0x68
	movs r3, 0x68
	bl sub_8072AB0
	add sp, 0x8
	pop {r0}
	bx r0
	thumb_func_end sub_813AD58

	thumb_func_start sub_813AE0C
sub_813AE0C: @ 813AE0C
	push {r4,r5,lr}
	lsls r0, 24
	lsrs r0, 24
	lsls r1, r0, 2
	adds r1, r0
	lsls r1, 3
	ldr r2, _0813AE48
	adds r4, r1, r2
	ldrh r1, [r4]
	ldrh r2, [r4, 0x2]
	adds r1, r2
	lsls r1, 16
	lsrs r5, r1, 16
	bl sub_813ABE8
	movs r1, 0x12
	ldrsh r0, [r4, r1]
	cmp r0, 0
	bne _0813AE62
	lsls r0, r5, 16
	asrs r1, r0, 16
	movs r2, 0x4
	ldrsh r0, [r4, r2]
	cmp r1, r0
	bne _0813AE50
	ldr r0, _0813AE4C
	bl sub_813AD58
	b _0813AE62
	.align 2, 0
_0813AE48: .4byte gUnknown_03004B28
_0813AE4C: .4byte 0x0000ffff
_0813AE50:
	ldr r0, _0813AE68
	lsls r1, 2
	adds r1, r0
	movs r0, 0x93
	lsls r0, 3
	adds r1, r0
	ldrh r0, [r1]
	bl sub_813AD58
_0813AE62:
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_0813AE68: .4byte gSaveBlock1
	thumb_func_end sub_813AE0C

	thumb_func_start sub_813AE6C
sub_813AE6C: @ 813AE6C
	push {r4-r6,lr}
	sub sp, 0x8
	adds r6, r0, 0
	adds r4, r1, 0
	lsls r6, 24
	lsrs r6, 24
	lsls r4, 24
	lsrs r4, 24
	lsls r5, r6, 2
	adds r5, r6
	lsls r5, 3
	ldr r0, _0813AEF8
	adds r5, r0
	bl sub_80F944C
	bl InitMenuInUpperLeftCornerPlaySoundWhenAPressed
	bl sub_813AF04
	movs r0, 0xF
	movs r1, 0
	movs r2, 0x1D
	movs r3, 0x13
	bl MenuDrawTextWindow
	movs r0, 0
	movs r1, 0xC
	movs r2, 0xE
	movs r3, 0x13
	bl MenuDrawTextWindow
	movs r0, 0
	movs r1, 0
	movs r2, 0xB
	movs r3, 0x3
	bl MenuDrawTextWindow
	ldr r0, _0813AEFC
	movs r1, 0x93
	lsls r1, 3
	adds r0, r1
	ldrh r0, [r0]
	bl sub_813AD58
	ldr r0, _0813AF00
	lsls r4, 3
	adds r4, r0
	ldr r0, [r4]
	movs r1, 0x1
	movs r2, 0x1
	bl MenuPrint
	adds r0, r6, 0
	bl sub_813ABE8
	ldrb r3, [r5, 0x8]
	ldrb r0, [r5]
	str r0, [sp]
	movs r0, 0xD
	str r0, [sp, 0x4]
	movs r0, 0
	movs r1, 0x10
	movs r2, 0x2
	bl InitMenu
	add sp, 0x8
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_0813AEF8: .4byte gUnknown_03004B28
_0813AEFC: .4byte gSaveBlock1
_0813AF00: .4byte gUnknown_084062C0
	thumb_func_end sub_813AE6C

	thumb_func_start sub_813AF04
sub_813AF04: @ 813AF04
	push {lr}
	sub sp, 0x8
	ldr r1, _0813AF38
	mov r0, sp
	movs r2, 0x6
	bl memcpy
	add r0, sp, 0x4
	movs r1, 0xDF
	movs r2, 0x2
	bl LoadPalette
	mov r0, sp
	adds r0, 0x2
	movs r1, 0xD1
	movs r2, 0x2
	bl LoadPalette
	mov r0, sp
	movs r1, 0xD8
	movs r2, 0x2
	bl LoadPalette
	add sp, 0x8
	pop {r0}
	bx r0
	.align 2, 0
_0813AF38: .4byte gUnknown_08406334
	thumb_func_end sub_813AF04

	thumb_func_start sub_813AF3C
sub_813AF3C: @ 813AF3C
	push {r4,lr}
	movs r2, 0
	movs r1, 0x6
	ldr r4, _0813AF70
	ldr r3, _0813AF74
_0813AF46:
	lsls r0, r1, 3
	adds r0, r1
	lsls r0, 2
	adds r0, r4
	adds r0, r3
	ldrh r0, [r0]
	cmp r0, 0
	beq _0813AF5C
	adds r0, r2, 0x1
	lsls r0, 24
	lsrs r2, r0, 24
_0813AF5C:
	adds r0, r1, 0x1
	lsls r0, 24
	lsrs r1, r0, 24
	cmp r1, 0xF
	bls _0813AF46
	adds r0, r2, 0
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_0813AF70: .4byte gSaveBlock1
_0813AF74: .4byte 0x00002b6c
	thumb_func_end sub_813AF3C

	thumb_func_start sub_813AF78
sub_813AF78: @ 813AF78
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	sub sp, 0x24
	movs r2, 0x6
_0813AF86:
	adds r1, r2, 0x1
	lsls r0, r1, 24
	lsrs r3, r0, 24
	mov r10, r1
	cmp r3, 0xF
	bhi _0813AFF4
	ldr r0, _0813B010
	mov r12, r0
	lsls r0, r2, 3
	adds r0, r2
	lsls r0, 2
	add r0, r12
	ldr r1, _0813B014
	adds r1, r0
	mov r8, r1
	ldr r2, _0813B018
	mov r9, r2
	adds r4, r0, r2
_0813AFAA:
	mov r5, r8
	ldrh r0, [r5]
	cmp r0, 0
	bne _0813AFEA
	mov r1, sp
	adds r0, r4, 0
	ldm r0!, {r2,r6,r7}
	stm r1!, {r2,r6,r7}
	ldm r0!, {r5-r7}
	stm r1!, {r5-r7}
	ldm r0!, {r2,r5,r6}
	stm r1!, {r2,r5,r6}
	lsls r2, r3, 3
	adds r2, r3
	lsls r2, 2
	add r2, r12
	add r2, r9
	adds r1, r4, 0
	adds r0, r2, 0
	ldm r0!, {r5-r7}
	stm r1!, {r5-r7}
	ldm r0!, {r5-r7}
	stm r1!, {r5-r7}
	ldm r0!, {r5-r7}
	stm r1!, {r5-r7}
	mov r0, sp
	ldm r0!, {r1,r5,r7}
	stm r2!, {r1,r5,r7}
	ldm r0!, {r1,r6,r7}
	stm r2!, {r1,r6,r7}
	ldm r0!, {r5-r7}
	stm r2!, {r5-r7}
_0813AFEA:
	adds r0, r3, 0x1
	lsls r0, 24
	lsrs r3, r0, 24
	cmp r3, 0xF
	bls _0813AFAA
_0813AFF4:
	mov r1, r10
	lsls r0, r1, 24
	lsrs r2, r0, 24
	cmp r2, 0xE
	bls _0813AF86
	add sp, 0x24
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_0813B010: .4byte gSaveBlock1
_0813B014: .4byte 0x00002b6c
_0813B018: .4byte 0x00002b4c
	thumb_func_end sub_813AF78

	thumb_func_start sub_813B01C
sub_813B01C: @ 813B01C
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	movs r7, 0
	ldr r1, _0813B0B8
	ldrb r4, [r1, 0x2]
	ldrb r0, [r1, 0x1]
	adds r0, r4, r0
	cmp r4, r0
	bge _0813B08A
	adds r6, r1, 0
	ldr r0, _0813B0BC
	mov r8, r0
_0813B036:
	ldrb r0, [r6, 0x2]
	subs r0, r4, r0
	lsls r0, 17
	lsrs r7, r0, 16
	adds r0, r7, 0x2
	lsls r0, 24
	lsrs r5, r0, 24
	adds r3, r7, 0x3
	lsls r3, 24
	lsrs r3, 24
	movs r0, 0x15
	adds r1, r5, 0
	movs r2, 0x1C
	bl MenuFillWindowRectWithBlankTile
	ldrb r0, [r6, 0x3]
	cmp r4, r0
	beq _0813B0C4
	lsls r1, r4, 3
	adds r1, r4
	lsls r1, 2
	ldr r0, _0813B0C0
	adds r1, r0
	mov r0, r8
	bl StringCopy
	mov r0, r8
	bl sub_814A568
	mov r0, r8
	movs r1, 0x15
	adds r2, r5, 0
	bl MenuPrint
	adds r0, r4, 0x1
	lsls r0, 16
	lsrs r4, r0, 16
	ldrb r0, [r6, 0x2]
	ldrb r1, [r6, 0x1]
	adds r0, r1
	cmp r4, r0
	blt _0813B036
_0813B08A:
	ldr r5, _0813B0B8
	ldrb r0, [r5, 0x2]
	subs r0, r4, r0
	cmp r0, 0x8
	beq _0813B0A4
	adds r1, r7, 0x4
	lsls r1, 24
	lsrs r1, 24
	movs r0, 0x15
	movs r2, 0x1C
	movs r3, 0x12
	bl MenuFillWindowRectWithBlankTile
_0813B0A4:
	ldrb r0, [r5, 0x2]
	cmp r0, 0
	beq _0813B0D4
	movs r0, 0
	movs r1, 0xC8
	movs r2, 0x8
	bl sub_80F953C
	b _0813B0DA
	.align 2, 0
_0813B0B8: .4byte 0x0201fe00
_0813B0BC: .4byte gStringVar1
_0813B0C0: .4byte gSaveBlock1 + 0x2C36
_0813B0C4:
	ldr r0, _0813B0D0
	movs r1, 0x15
	adds r2, r5, 0
	bl MenuPrint
	b _0813B08A
	.align 2, 0
_0813B0D0: .4byte gOtherText_CancelNoTerminator
_0813B0D4:
	movs r0, 0
	bl SetBgTilemapBuffer
_0813B0DA:
	ldr r0, _0813B0F4
	ldrb r1, [r0, 0x2]
	ldrb r2, [r0, 0x1]
	adds r1, r2
	ldrb r0, [r0, 0x3]
	cmp r1, r0
	bgt _0813B0F8
	movs r0, 0x1
	movs r1, 0xC8
	movs r2, 0x98
	bl sub_80F953C
	b _0813B0FE
	.align 2, 0
_0813B0F4: .4byte 0x0201fe00
_0813B0F8:
	movs r0, 0x1
	bl SetBgTilemapBuffer
_0813B0FE:
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r0}
	bx r0
	thumb_func_end sub_813B01C

	thumb_func_start sub_813B108
sub_813B108: @ 813B108
	push {r4,lr}
	sub sp, 0x8
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	bl sub_80F944C
	bl InitMenuInUpperLeftCornerPlaySoundWhenAPressed
	movs r0, 0
	movs r1, 0
	movs r2, 0x1D
	movs r3, 0x13
	bl MenuZeroFillWindowRect
	movs r0, 0
	movs r1, 0
	movs r2, 0x8
	movs r3, 0x3
	bl MenuDrawTextWindow
	ldr r0, _0813B16C
	movs r1, 0x1
	movs r2, 0x1
	bl MenuPrint
	movs r0, 0x14
	movs r1, 0
	movs r2, 0x1D
	movs r3, 0x13
	bl MenuDrawTextWindow
	adds r0, r4, 0
	bl sub_813B01C
	ldr r0, _0813B170
	ldrb r3, [r0, 0x1]
	ldrb r0, [r0]
	str r0, [sp]
	movs r0, 0x8
	str r0, [sp, 0x4]
	movs r0, 0
	movs r1, 0x15
	movs r2, 0x2
	bl InitMenu
	add sp, 0x8
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0813B16C: .4byte gPCText_Mailbox
_0813B170: .4byte 0x0201fe00
	thumb_func_end sub_813B108

	thumb_func_start sub_813B174
sub_813B174: @ 813B174
	push {r4,r5,lr}
	lsls r0, 24
	lsrs r5, r0, 24
	adds r4, r5, 0
	ldr r0, _0813B1AC
	ldrb r1, [r0, 0x7]
	movs r3, 0x80
	adds r0, r3, 0
	ands r0, r1
	cmp r0, 0
	bne _0813B274
	ldr r2, _0813B1B0
	ldrh r1, [r2, 0x30]
	movs r0, 0x40
	ands r0, r1
	cmp r0, 0
	beq _0813B1CA
	ldr r4, _0813B1B4
	ldrb r0, [r4]
	cmp r0, 0
	beq _0813B1B8
	movs r0, 0x5
	bl PlaySE
	movs r0, 0x1
	negs r0, r0
	b _0813B1E6
	.align 2, 0
_0813B1AC: .4byte gPaletteFade
_0813B1B0: .4byte gMain
_0813B1B4: .4byte 0x0201fe00
_0813B1B8:
	ldrb r0, [r4, 0x2]
	cmp r0, 0
	beq _0813B274
	movs r0, 0x5
	bl PlaySE
	ldrb r0, [r4, 0x2]
	subs r0, 0x1
	b _0813B208
_0813B1CA:
	adds r0, r3, 0
	ands r0, r1
	cmp r0, 0
	beq _0813B212
	ldr r4, _0813B1F0
	ldrb r1, [r4]
	ldrb r0, [r4, 0x1]
	subs r0, 0x1
	cmp r1, r0
	beq _0813B1F4
	movs r0, 0x5
	bl PlaySE
	movs r0, 0x1
_0813B1E6:
	bl MoveMenuCursor
	strb r0, [r4]
	b _0813B274
	.align 2, 0
_0813B1F0: .4byte 0x0201fe00
_0813B1F4:
	ldrb r0, [r4, 0x2]
	adds r0, r1
	ldrb r1, [r4, 0x3]
	cmp r0, r1
	beq _0813B274
	movs r0, 0x5
	bl PlaySE
	ldrb r0, [r4, 0x2]
	adds r0, 0x1
_0813B208:
	strb r0, [r4, 0x2]
	adds r0, r5, 0
	bl sub_813B01C
	b _0813B274
_0813B212:
	ldrh r1, [r2, 0x2E]
	movs r0, 0x1
	ands r0, r1
	cmp r0, 0
	beq _0813B25C
	bl sub_8072DEC
	movs r0, 0x5
	bl PlaySE
	ldr r0, _0813B23C
	ldrb r1, [r0, 0x2]
	ldrb r2, [r0]
	adds r1, r2
	ldrb r0, [r0, 0x3]
	cmp r1, r0
	bne _0813B240
	adds r0, r5, 0
	bl sub_813B320
	b _0813B274
	.align 2, 0
_0813B23C: .4byte 0x0201fe00
_0813B240:
	bl sub_813B27C
	ldr r0, _0813B254
	lsls r1, r5, 2
	adds r1, r5
	lsls r1, 3
	adds r1, r0
	ldr r0, _0813B258
	str r0, [r1]
	b _0813B274
	.align 2, 0
_0813B254: .4byte gTasks
_0813B258: .4byte sub_813B294
_0813B25C:
	movs r0, 0x2
	ands r0, r1
	cmp r0, 0
	beq _0813B274
	bl sub_8072DEC
	movs r0, 0x5
	bl PlaySE
	adds r0, r4, 0
	bl sub_813B320
_0813B274:
	pop {r4,r5}
	pop {r0}
	bx r0
	thumb_func_end sub_813B174

	thumb_func_start sub_813B27C
sub_813B27C: @ 813B27C
	push {lr}
	bl BuyMenuFreeMemory
	movs r0, 0
	bl SetBgTilemapBuffer
	movs r0, 0x1
	bl SetBgTilemapBuffer
	pop {r0}
	bx r0
	thumb_func_end sub_813B27C

	thumb_func_start sub_813B294
sub_813B294: @ 813B294
	push {r4,r5,lr}
	adds r5, r0, 0
	lsls r5, 24
	lsrs r5, 24
	movs r0, 0
	movs r1, 0
	movs r2, 0x1D
	movs r3, 0x13
	bl MenuZeroFillWindowRect
	ldr r4, _0813B2E8
	ldr r1, _0813B2EC
	ldrb r0, [r1]
	adds r0, 0x6
	ldrb r1, [r1, 0x2]
	adds r0, r1
	lsls r1, r0, 3
	adds r1, r0
	lsls r1, 2
	ldr r0, _0813B2F0
	adds r1, r0
	adds r0, r4, 0
	bl StringCopy
	adds r0, r4, 0
	bl sub_814A568
	ldr r4, _0813B2F4
	ldr r1, _0813B2F8
	adds r0, r4, 0
	bl StringExpandPlaceholders
	ldr r2, _0813B2FC
	adds r0, r5, 0
	adds r1, r4, 0
	movs r3, 0
	bl DisplayItemMessageOnField
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_0813B2E8: .4byte gStringVar1
_0813B2EC: .4byte 0x0201fe00
_0813B2F0: .4byte gSaveBlock1 + 0x2B5E
_0813B2F4: .4byte gStringVar4
_0813B2F8: .4byte gOtherText_WhatWillYouDoMail
_0813B2FC: .4byte sub_813B348
	thumb_func_end sub_813B294

	thumb_func_start sub_813B300
sub_813B300: @ 813B300
	push {r4,lr}
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	movs r0, 0
	movs r1, 0
	movs r2, 0x1D
	movs r3, 0x13
	bl MenuZeroFillWindowRect
	adds r0, r4, 0
	bl sub_8139E24
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end sub_813B300

	thumb_func_start sub_813B320
sub_813B320: @ 813B320
	push {r4,lr}
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	bl sub_813B27C
	ldr r1, _0813B340
	lsls r0, r4, 2
	adds r0, r4
	lsls r0, 3
	adds r0, r1
	ldr r1, _0813B344
	str r1, [r0]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0813B340: .4byte gTasks
_0813B344: .4byte sub_813B300
	thumb_func_end sub_813B320

	thumb_func_start sub_813B348
sub_813B348: @ 813B348
	push {r4,lr}
	sub sp, 0x8
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	movs r0, 0
	movs r1, 0
	movs r2, 0xC
	movs r3, 0x9
	bl MenuDrawTextWindow
	ldr r3, _0813B394
	movs r0, 0x1
	movs r1, 0x1
	movs r2, 0x4
	bl PrintMenuItems
	movs r0, 0
	str r0, [sp]
	movs r0, 0xB
	str r0, [sp, 0x4]
	movs r0, 0
	movs r1, 0x1
	movs r2, 0x1
	movs r3, 0x4
	bl InitMenu
	ldr r1, _0813B398
	lsls r0, r4, 2
	adds r0, r4
	lsls r0, 3
	adds r0, r1
	ldr r1, _0813B39C
	str r1, [r0]
	add sp, 0x8
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0813B394: .4byte gUnknown_084062F8
_0813B398: .4byte gTasks
_0813B39C: .4byte sub_813B3A0
	thumb_func_end sub_813B348

	thumb_func_start sub_813B3A0
sub_813B3A0: @ 813B3A0
	push {r4,r5,lr}
	lsls r0, 24
	lsrs r5, r0, 24
	adds r4, r5, 0
	ldr r2, _0813B3C4
	ldrh r1, [r2, 0x30]
	movs r0, 0x40
	ands r0, r1
	cmp r0, 0
	beq _0813B3C8
	movs r0, 0x5
	bl PlaySE
	movs r0, 0x1
	negs r0, r0
	bl MoveMenuCursor
	b _0813B420
	.align 2, 0
_0813B3C4: .4byte gMain
_0813B3C8:
	movs r0, 0x80
	ands r0, r1
	cmp r0, 0
	beq _0813B3DE
	movs r0, 0x5
	bl PlaySE
	movs r0, 0x1
	bl MoveMenuCursor
	b _0813B420
_0813B3DE:
	ldrh r1, [r2, 0x2E]
	movs r0, 0x1
	ands r0, r1
	cmp r0, 0
	beq _0813B40C
	movs r0, 0x5
	bl PlaySE
	ldr r4, _0813B408
	bl GetMenuCursorPos
	lsls r0, 24
	lsrs r0, 21
	adds r4, 0x4
	adds r0, r4
	ldr r1, [r0]
	adds r0, r5, 0
	bl _call_via_r1
	b _0813B420
	.align 2, 0
_0813B408: .4byte gUnknown_084062F8
_0813B40C:
	movs r0, 0x2
	ands r0, r1
	cmp r0, 0
	beq _0813B420
	movs r0, 0x5
	bl PlaySE
	adds r0, r4, 0
	bl sub_813B734
_0813B420:
	pop {r4,r5}
	pop {r0}
	bx r0
	thumb_func_end sub_813B3A0

	thumb_func_start sub_813B428
sub_813B428: @ 813B428
	push {r4,lr}
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	movs r0, 0x1
	movs r1, 0
	bl fade_screen
	ldr r1, _0813B44C
	lsls r0, r4, 2
	adds r0, r4
	lsls r0, 3
	adds r0, r1
	ldr r1, _0813B450
	str r1, [r0]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0813B44C: .4byte gTasks
_0813B450: .4byte sub_813B454
	thumb_func_end sub_813B428

	thumb_func_start sub_813B454
sub_813B454: @ 813B454
	push {r4,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	ldr r0, _0813B490
	ldrb r1, [r0, 0x7]
	movs r0, 0x80
	ands r0, r1
	cmp r0, 0
	bne _0813B488
	ldr r0, _0813B494
	ldrb r1, [r0]
	adds r1, 0x6
	ldrb r0, [r0, 0x2]
	adds r1, r0
	lsls r0, r1, 3
	adds r0, r1
	lsls r0, 2
	ldr r1, _0813B498
	adds r0, r1
	ldr r1, _0813B49C
	movs r2, 0x1
	bl sub_80F890C
	adds r0, r4, 0
	bl DestroyTask
_0813B488:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0813B490: .4byte gPaletteFade
_0813B494: .4byte 0x0201fe00
_0813B498: .4byte gSaveBlock1 + 0x2B4C
_0813B49C: .4byte sub_813B4F0
	thumb_func_end sub_813B454

	thumb_func_start sub_813B4A0
sub_813B4A0: @ 813B4A0
	push {r4,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	bl sub_807D770
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _0813B4C0
	ldr r0, _0813B4C8
	lsls r1, r4, 2
	adds r1, r4
	lsls r1, 3
	adds r1, r0
	ldr r0, _0813B4CC
	str r0, [r1]
_0813B4C0:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0813B4C8: .4byte gTasks
_0813B4CC: .4byte sub_813B174
	thumb_func_end sub_813B4A0

	thumb_func_start sub_813B4D0
sub_813B4D0: @ 813B4D0
	push {lr}
	ldr r0, _0813B4EC
	movs r1, 0
	bl CreateTask
	lsls r0, 24
	lsrs r0, 24
	bl sub_813B108
	bl pal_fill_black
	pop {r0}
	bx r0
	.align 2, 0
_0813B4EC: .4byte sub_813B4A0
	thumb_func_end sub_813B4D0

	thumb_func_start sub_813B4F0
sub_813B4F0: @ 813B4F0
	push {lr}
	ldr r0, _0813B504
	ldr r1, _0813B508
	str r1, [r0]
	ldr r0, _0813B50C
	bl SetMainCallback2
	pop {r0}
	bx r0
	.align 2, 0
_0813B504: .4byte gUnknown_0300485C
_0813B508: .4byte sub_813B4D0
_0813B50C: .4byte c2_exit_to_overworld_2_switch
	thumb_func_end sub_813B4F0

	thumb_func_start sub_813B510
sub_813B510: @ 813B510
	push {r4,lr}
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	bl sub_8072DEC
	ldr r0, _0813B540
	ldr r1, _0813B544
	bl StringCopy
	ldr r0, _0813B548
	movs r1, 0x1
	movs r2, 0x3
	bl MenuPrint
	ldr r1, _0813B54C
	ldr r2, _0813B550
	adds r0, r4, 0
	movs r3, 0
	bl DisplayItemMessageOnField
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0813B540: .4byte gStringVar1
_0813B544: .4byte gOtherText_MoveToBag
_0813B548: .4byte gUnknown_0840633A
_0813B54C: .4byte gOtherText_MessageWillBeLost
_0813B550: .4byte sub_813B554
	thumb_func_end sub_813B510

	thumb_func_start sub_813B554
sub_813B554: @ 813B554
	push {r4,lr}
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	movs r0, 0x14
	movs r1, 0x8
	movs r2, 0x1
	bl DisplayYesNoMenu
	ldr r1, _0813B574
	adds r0, r4, 0
	bl sub_80F914C
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0813B574: .4byte gUnknown_084062E8
	thumb_func_end sub_813B554

	thumb_func_start sub_813B578
sub_813B578: @ 813B578
	push {r4-r6,lr}
	lsls r0, 24
	lsrs r5, r0, 24
	ldr r4, _0813B5BC
	ldrb r0, [r4]
	adds r0, 0x6
	ldrb r1, [r4, 0x2]
	adds r0, r1
	lsls r1, r0, 3
	adds r1, r0
	lsls r1, 2
	ldr r0, _0813B5C0
	adds r6, r1, r0
	movs r0, 0x14
	movs r1, 0x8
	movs r2, 0x1A
	movs r3, 0xD
	bl MenuZeroFillWindowRect
	ldrh r0, [r6, 0x20]
	movs r1, 0x1
	bl sub_80A9424
	lsls r0, 24
	cmp r0, 0
	bne _0813B5CC
	ldr r1, _0813B5C4
	ldr r2, _0813B5C8
	adds r0, r5, 0
	movs r3, 0
	bl DisplayItemMessageOnField
	b _0813B602
	.align 2, 0
_0813B5BC: .4byte 0x0201fe00
_0813B5C0: .4byte gSaveBlock1 + 0x2B4C
_0813B5C4: .4byte gOtherText_BagIsFull
_0813B5C8: .4byte sub_813B758
_0813B5CC:
	ldr r1, _0813B608
	ldr r2, _0813B60C
	adds r0, r5, 0
	movs r3, 0
	bl DisplayItemMessageOnField
	adds r0, r6, 0
	bl sub_80A2B40
	bl sub_813AF78
	ldrb r0, [r4, 0x3]
	subs r0, 0x1
	strb r0, [r4, 0x3]
	ldrb r1, [r4, 0x3]
	ldrb r0, [r4, 0x1]
	ldrb r2, [r4, 0x2]
	adds r0, r2
	cmp r1, r0
	bge _0813B5FC
	cmp r2, 0
	beq _0813B5FC
	subs r0, r2, 0x1
	strb r0, [r4, 0x2]
_0813B5FC:
	adds r0, r5, 0
	bl sub_813A240
_0813B602:
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_0813B608: .4byte gOtherText_MailWasReturned
_0813B60C: .4byte sub_813B758
	thumb_func_end sub_813B578

	thumb_func_start sub_813B610
sub_813B610: @ 813B610
	push {r4,lr}
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	movs r0, 0x14
	movs r1, 0x8
	movs r2, 0x1A
	movs r3, 0xD
	bl MenuZeroFillWindowRect
	adds r0, r4, 0
	bl sub_813B758
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end sub_813B610

	thumb_func_start sub_813B630
sub_813B630: @ 813B630
	push {r4,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	bl CalculatePlayerPartyCount
	lsls r0, 24
	cmp r0, 0
	bne _0813B648
	adds r0, r4, 0
	bl sub_813B718
	b _0813B65E
_0813B648:
	movs r0, 0x1
	movs r1, 0
	bl fade_screen
	ldr r0, _0813B664
	lsls r1, r4, 2
	adds r1, r4
	lsls r1, 3
	adds r1, r0
	ldr r0, _0813B668
	str r0, [r1]
_0813B65E:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0813B664: .4byte gTasks
_0813B668: .4byte sub_813B66C
	thumb_func_end sub_813B630

	thumb_func_start sub_813B66C
sub_813B66C: @ 813B66C
	push {r4,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	ldr r0, _0813B698
	ldrb r1, [r0, 0x7]
	movs r0, 0x80
	ands r0, r1
	cmp r0, 0
	bne _0813B690
	ldr r0, _0813B69C
	bl SetMainCallback2
	ldr r1, _0813B6A0
	movs r0, 0x3
	strb r0, [r1]
	adds r0, r4, 0
	bl DestroyTask
_0813B690:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0813B698: .4byte gPaletteFade
_0813B69C: .4byte sub_808B020
_0813B6A0: .4byte gUnknown_02038561
	thumb_func_end sub_813B66C

	thumb_func_start sub_813B6A4
sub_813B6A4: @ 813B6A4
	push {r4-r6,lr}
	ldr r0, _0813B6F0
	movs r1, 0
	bl CreateTask
	lsls r0, 24
	lsrs r6, r0, 24
	ldr r5, _0813B6F4
	ldrb r4, [r5, 0x3]
	bl sub_813AF3C
	strb r0, [r5, 0x3]
	bl sub_813AF78
	ldrb r0, [r5, 0x3]
	cmp r4, r0
	beq _0813B6DA
	ldrb r1, [r5, 0x3]
	ldrb r0, [r5, 0x1]
	ldrb r2, [r5, 0x2]
	adds r0, r2
	cmp r1, r0
	bge _0813B6DA
	cmp r2, 0
	beq _0813B6DA
	subs r0, r2, 0x1
	strb r0, [r5, 0x2]
_0813B6DA:
	adds r0, r6, 0
	bl sub_813A240
	adds r0, r6, 0
	bl sub_813B108
	bl pal_fill_black
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_0813B6F0: .4byte sub_813B4A0
_0813B6F4: .4byte 0x0201fe00
	thumb_func_end sub_813B6A4

	thumb_func_start sub_813B6F8
sub_813B6F8: @ 813B6F8
	push {lr}
	ldr r0, _0813B70C
	ldr r1, _0813B710
	str r1, [r0]
	ldr r0, _0813B714
	bl SetMainCallback2
	pop {r0}
	bx r0
	.align 2, 0
_0813B70C: .4byte gUnknown_0300485C
_0813B710: .4byte sub_813B6A4
_0813B714: .4byte c2_exit_to_overworld_2_switch
	thumb_func_end sub_813B6F8

	thumb_func_start sub_813B718
sub_813B718: @ 813B718
	push {lr}
	lsls r0, 24
	lsrs r0, 24
	ldr r1, _0813B72C
	ldr r2, _0813B730
	movs r3, 0
	bl DisplayItemMessageOnField
	pop {r0}
	bx r0
	.align 2, 0
_0813B72C: .4byte gOtherText_NoPokemon
_0813B730: .4byte sub_813B758
	thumb_func_end sub_813B718

	thumb_func_start sub_813B734
sub_813B734: @ 813B734
	push {r4,lr}
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	bl sub_8072DEC
	movs r0, 0
	movs r1, 0
	movs r2, 0xC
	movs r3, 0x9
	bl MenuZeroFillWindowRect
	adds r0, r4, 0
	bl sub_813B758
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end sub_813B734

	thumb_func_start sub_813B758
sub_813B758: @ 813B758
	push {r4,lr}
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	adds r0, r4, 0
	bl sub_813B108
	ldr r1, _0813B77C
	lsls r0, r4, 2
	adds r0, r4
	lsls r0, 3
	adds r0, r1
	ldr r1, _0813B780
	str r1, [r0]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0813B77C: .4byte gTasks
_0813B780: .4byte sub_813B174
	thumb_func_end sub_813B758

	.align 2, 0 @ Don't pad with nop.
