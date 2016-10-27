	.include "constants/gba_constants.s"
	.include "constants/species_constants.s"
	.include "asm/macros.s"

	.syntax unified

	.text

	thumb_func_start sub_80A7E7C
sub_80A7E7C: @ 80A7E7C
	push {r4,r5,lr}
	lsls r0, 24
	lsrs r5, r0, 24
	ldr r4, _080A7E9C @ =gUnknown_03004B00
	ldrb r0, [r4]
	bl obj_id_for_side_relative_to_move
	lsls r0, 24
	lsrs r2, r0, 24
	cmp r2, 0xFF
	bne _080A7EA0
	adds r0, r5, 0
	bl move_anim_task_del
	b _080A7EDC
	.align 2, 0
_080A7E9C: .4byte gUnknown_03004B00
_080A7EA0:
	ldr r1, _080A7EE4 @ =gSprites
	lsls r0, r2, 4
	adds r0, r2
	lsls r0, 2
	adds r0, r1
	ldrh r1, [r4, 0x2]
	strh r1, [r0, 0x24]
	ldrh r1, [r4, 0x4]
	strh r1, [r0, 0x26]
	ldr r1, _080A7EE8 @ =gTasks
	lsls r0, r5, 2
	adds r0, r5
	lsls r0, 3
	adds r0, r1
	strh r2, [r0, 0x8]
	ldrh r1, [r4, 0x6]
	strh r1, [r0, 0xA]
	ldrh r1, [r4, 0x8]
	strh r1, [r0, 0xC]
	ldrh r1, [r4, 0x8]
	strh r1, [r0, 0xE]
	ldrh r1, [r4, 0x2]
	strh r1, [r0, 0x10]
	ldrh r1, [r4, 0x4]
	strh r1, [r0, 0x12]
	ldr r1, _080A7EEC @ =sub_80A7EF0
	str r1, [r0]
	adds r0, r5, 0
	bl _call_via_r1
_080A7EDC:
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080A7EE4: .4byte gSprites
_080A7EE8: .4byte gTasks
_080A7EEC: .4byte sub_80A7EF0
	thumb_func_end sub_80A7E7C

	thumb_func_start sub_80A7EF0
sub_80A7EF0: @ 80A7EF0
	push {r4-r7,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	ldr r1, _080A7F2C @ =gTasks
	lsls r0, r4, 2
	adds r0, r4
	lsls r0, 3
	adds r3, r0, r1
	ldrh r0, [r3, 0xE]
	movs r2, 0xE
	ldrsh r5, [r3, r2]
	adds r7, r1, 0
	cmp r5, 0
	bne _080A7F96
	ldr r2, _080A7F30 @ =gSprites
	movs r6, 0x8
	ldrsh r1, [r3, r6]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r1, r0, r2
	movs r6, 0x24
	ldrsh r0, [r1, r6]
	adds r6, r2, 0
	cmp r0, 0
	bne _080A7F34
	ldrh r0, [r3, 0x10]
	strh r0, [r1, 0x24]
	b _080A7F36
	.align 2, 0
_080A7F2C: .4byte gTasks
_080A7F30: .4byte gSprites
_080A7F34:
	strh r5, [r1, 0x24]
_080A7F36:
	lsls r2, r4, 2
	adds r0, r2, r4
	lsls r0, 3
	adds r3, r0, r7
	movs r0, 0x8
	ldrsh r1, [r3, r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r1, r0, r6
	movs r5, 0x26
	ldrsh r0, [r1, r5]
	cmp r0, 0
	bne _080A7F56
	ldrh r0, [r3, 0x12]
	b _080A7F58
_080A7F56:
	movs r0, 0
_080A7F58:
	strh r0, [r1, 0x26]
	adds r0, r2, r4
	lsls r0, 3
	adds r2, r0, r7
	ldrh r0, [r2, 0xC]
	strh r0, [r2, 0xE]
	ldrh r0, [r2, 0xA]
	subs r0, 0x1
	strh r0, [r2, 0xA]
	lsls r0, 16
	asrs r3, r0, 16
	cmp r3, 0
	bne _080A7F9A
	movs r0, 0x8
	ldrsh r1, [r2, r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r6
	strh r3, [r0, 0x24]
	movs r5, 0x8
	ldrsh r1, [r2, r5]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r6
	strh r3, [r0, 0x26]
	adds r0, r4, 0
	bl move_anim_task_del
	b _080A7F9A
_080A7F96:
	subs r0, 0x1
	strh r0, [r3, 0xE]
_080A7F9A:
	pop {r4-r7}
	pop {r0}
	bx r0
	thumb_func_end sub_80A7EF0

	thumb_func_start sub_80A7FA0
sub_80A7FA0: @ 80A7FA0
	push {r4-r6,lr}
	lsls r0, 24
	lsrs r5, r0, 24
	movs r6, 0
	ldr r2, _080A7FC8 @ =gUnknown_03004B00
	ldrh r0, [r2]
	movs r3, 0
	ldrsh r1, [r2, r3]
	cmp r1, 0x3
	bgt _080A7FCC
	lsls r0, 24
	lsrs r0, 24
	bl obj_id_for_side_relative_to_move
	lsls r0, 24
	lsrs r3, r0, 24
	cmp r3, 0xFF
	bne _080A8022
	b _080A8026
	.align 2, 0
_080A7FC8: .4byte gUnknown_03004B00
_080A7FCC:
	cmp r1, 0x8
	beq _080A8018
	movs r1, 0
	ldrsh r0, [r2, r1]
	cmp r0, 0x5
	beq _080A7FEC
	cmp r0, 0x5
	bgt _080A7FE2
	cmp r0, 0x4
	beq _080A7FE8
	b _080A7FF4
_080A7FE2:
	cmp r0, 0x6
	beq _080A7FF0
	b _080A7FF4
_080A7FE8:
	movs r0, 0
	b _080A7FF6
_080A7FEC:
	movs r0, 0x2
	b _080A7FF6
_080A7FF0:
	movs r0, 0x1
	b _080A7FF6
_080A7FF4:
	movs r0, 0x3
_080A7FF6:
	bl battle_get_side_with_given_state
	lsls r0, 24
	lsrs r4, r0, 24
	adds r0, r4, 0
	bl b_side_obj__get_some_boolean
	lsls r0, 24
	cmp r0, 0
	bne _080A800C
	movs r6, 0x1
_080A800C:
	ldr r0, _080A8014 @ =gUnknown_02024BE0
	adds r0, r4, r0
	b _080A8020
	.align 2, 0
_080A8014: .4byte gUnknown_02024BE0
_080A8018:
	ldr r1, _080A8030 @ =gUnknown_02024BE0
	ldr r0, _080A8034 @ =gUnknown_0202F7C8
	ldrb r0, [r0]
	adds r0, r1
_080A8020:
	ldrb r3, [r0]
_080A8022:
	cmp r6, 0
	beq _080A8038
_080A8026:
	adds r0, r5, 0
	bl move_anim_task_del
	b _080A8076
	.align 2, 0
_080A8030: .4byte gUnknown_02024BE0
_080A8034: .4byte gUnknown_0202F7C8
_080A8038:
	ldr r1, _080A807C @ =gSprites
	lsls r0, r3, 4
	adds r0, r3
	lsls r0, 2
	adds r0, r1
	ldr r2, _080A8080 @ =gUnknown_03004B00
	ldrh r1, [r2, 0x2]
	strh r1, [r0, 0x24]
	ldrh r1, [r2, 0x4]
	strh r1, [r0, 0x26]
	ldr r1, _080A8084 @ =gTasks
	lsls r0, r5, 2
	adds r0, r5
	lsls r0, 3
	adds r0, r1
	strh r3, [r0, 0x8]
	ldrh r1, [r2, 0x6]
	strh r1, [r0, 0xA]
	ldrh r1, [r2, 0x8]
	strh r1, [r0, 0xC]
	ldrh r1, [r2, 0x8]
	strh r1, [r0, 0xE]
	ldrh r1, [r2, 0x2]
	strh r1, [r0, 0x10]
	ldrh r1, [r2, 0x4]
	strh r1, [r0, 0x12]
	ldr r1, _080A8088 @ =sub_80A808C
	str r1, [r0]
	adds r0, r5, 0
	bl _call_via_r1
_080A8076:
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_080A807C: .4byte gSprites
_080A8080: .4byte gUnknown_03004B00
_080A8084: .4byte gTasks
_080A8088: .4byte sub_80A808C
	thumb_func_end sub_80A7FA0

	thumb_func_start sub_80A808C
sub_80A808C: @ 80A808C
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	lsls r0, 24
	lsrs r6, r0, 24
	ldr r1, _080A80D0 @ =gTasks
	lsls r0, r6, 2
	adds r0, r6
	lsls r0, 3
	adds r3, r0, r1
	ldrh r2, [r3, 0xE]
	movs r4, 0xE
	ldrsh r0, [r3, r4]
	mov r12, r1
	cmp r0, 0
	bne _080A8144
	ldr r2, _080A80D4 @ =gSprites
	movs r7, 0x8
	ldrsh r1, [r3, r7]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r4, r0, r2
	movs r0, 0x24
	ldrsh r1, [r4, r0]
	ldrh r5, [r3, 0x10]
	movs r7, 0x10
	ldrsh r0, [r3, r7]
	adds r7, r2, 0
	cmp r1, r0
	bne _080A80D8
	negs r0, r5
	strh r0, [r4, 0x24]
	b _080A80DA
	.align 2, 0
_080A80D0: .4byte gTasks
_080A80D4: .4byte gSprites
_080A80D8:
	strh r5, [r4, 0x24]
_080A80DA:
	lsls r3, r6, 2
	adds r1, r3, r6
	lsls r1, 3
	add r1, r12
	movs r0, 0x8
	ldrsh r2, [r1, r0]
	lsls r0, r2, 4
	adds r0, r2
	lsls r0, 2
	adds r4, r0, r7
	movs r0, 0x26
	ldrsh r2, [r4, r0]
	mov r8, r2
	ldrh r5, [r1, 0x12]
	movs r2, 0x12
	ldrsh r0, [r1, r2]
	cmp r8, r0
	bne _080A8104
	negs r0, r5
	strh r0, [r4, 0x26]
	b _080A8106
_080A8104:
	strh r5, [r4, 0x26]
_080A8106:
	adds r0, r3, r6
	lsls r0, 3
	mov r4, r12
	adds r3, r0, r4
	ldrh r0, [r3, 0xC]
	strh r0, [r3, 0xE]
	ldrh r0, [r3, 0xA]
	subs r0, 0x1
	strh r0, [r3, 0xA]
	lsls r0, 16
	asrs r2, r0, 16
	cmp r2, 0
	bne _080A8148
	movs r0, 0x8
	ldrsh r1, [r3, r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r7
	strh r2, [r0, 0x24]
	movs r4, 0x8
	ldrsh r1, [r3, r4]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r7
	strh r2, [r0, 0x26]
	adds r0, r6, 0
	bl move_anim_task_del
	b _080A8148
_080A8144:
	subs r0, r2, 0x1
	strh r0, [r3, 0xE]
_080A8148:
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r0}
	bx r0
	thumb_func_end sub_80A808C

	thumb_func_start sub_80A8154
sub_80A8154: @ 80A8154
	push {r4-r6,lr}
	lsls r0, 24
	lsrs r5, r0, 24
	ldr r4, _080A8174 @ =gUnknown_03004B00
	ldrb r0, [r4]
	bl obj_id_for_side_relative_to_move
	lsls r0, 24
	lsrs r3, r0, 24
	cmp r3, 0xFF
	bne _080A8178
	adds r0, r5, 0
	bl move_anim_task_del
	b _080A81C6
	.align 2, 0
_080A8174: .4byte gUnknown_03004B00
_080A8178:
	ldr r0, _080A81CC @ =gSprites
	lsls r1, r3, 4
	adds r1, r3
	lsls r1, 2
	adds r1, r0
	ldrh r0, [r4, 0x2]
	ldrh r2, [r1, 0x24]
	adds r0, r2
	movs r2, 0
	strh r0, [r1, 0x24]
	ldrh r0, [r4, 0x4]
	ldrh r6, [r1, 0x26]
	adds r0, r6
	strh r0, [r1, 0x26]
	ldr r0, _080A81D0 @ =gTasks
	lsls r1, r5, 2
	adds r1, r5
	lsls r1, 3
	adds r1, r0
	strh r3, [r1, 0x8]
	strh r2, [r1, 0xA]
	ldrh r0, [r4, 0x6]
	strh r0, [r1, 0xC]
	strh r2, [r1, 0xE]
	ldrh r0, [r4, 0x8]
	strh r0, [r1, 0x10]
	movs r2, 0x2
	ldrsh r0, [r4, r2]
	lsls r0, 1
	strh r0, [r1, 0x12]
	movs r6, 0x4
	ldrsh r0, [r4, r6]
	lsls r0, 1
	strh r0, [r1, 0x14]
	ldr r2, _080A81D4 @ =sub_80A81D8
	str r2, [r1]
	adds r0, r5, 0
	bl _call_via_r2
_080A81C6:
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_080A81CC: .4byte gSprites
_080A81D0: .4byte gTasks
_080A81D4: .4byte sub_80A81D8
	thumb_func_end sub_80A8154

	thumb_func_start sub_80A81D8
sub_80A81D8: @ 80A81D8
	push {r4-r6,lr}
	lsls r0, 24
	lsrs r5, r0, 24
	ldr r1, _080A8230 @ =gTasks
	lsls r0, r5, 2
	adds r0, r5
	lsls r0, 3
	adds r4, r0, r1
	ldrh r2, [r4, 0xE]
	movs r3, 0xE
	ldrsh r0, [r4, r3]
	adds r6, r1, 0
	cmp r0, 0
	beq _080A81F6
	b _080A8308
_080A81F6:
	ldrh r1, [r4, 0xA]
	movs r0, 0x1
	ands r0, r1
	cmp r0, 0
	beq _080A8238
	ldr r2, _080A8234 @ =gSprites
	movs r0, 0x8
	ldrsh r1, [r4, r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r2
	ldrh r1, [r4, 0x12]
	ldrh r3, [r0, 0x24]
	adds r1, r3
	strh r1, [r0, 0x24]
	movs r0, 0x8
	ldrsh r1, [r4, r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r2
	ldrh r1, [r4, 0x14]
	ldrh r3, [r0, 0x26]
	adds r1, r3
	strh r1, [r0, 0x26]
	adds r3, r2, 0
	b _080A8262
	.align 2, 0
_080A8230: .4byte gTasks
_080A8234: .4byte gSprites
_080A8238:
	ldr r3, _080A82C4 @ =gSprites
	movs r0, 0x8
	ldrsh r1, [r4, r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r3
	ldrh r1, [r0, 0x24]
	ldrh r2, [r4, 0x12]
	subs r1, r2
	strh r1, [r0, 0x24]
	movs r2, 0x8
	ldrsh r1, [r4, r2]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r3
	ldrh r1, [r0, 0x26]
	ldrh r2, [r4, 0x14]
	subs r1, r2
	strh r1, [r0, 0x26]
_080A8262:
	lsls r0, r5, 2
	adds r0, r5
	lsls r0, 3
	adds r4, r0, r6
	ldrh r0, [r4, 0x10]
	strh r0, [r4, 0xE]
	ldrh r0, [r4, 0xA]
	adds r2, r0, 0x1
	strh r2, [r4, 0xA]
	lsls r0, r2, 16
	asrs r0, 16
	movs r6, 0xC
	ldrsh r1, [r4, r6]
	cmp r0, r1
	blt _080A830C
	movs r0, 0x1
	ands r2, r0
	cmp r2, 0
	beq _080A82C8
	movs r1, 0x8
	ldrsh r0, [r4, r1]
	lsls r1, r0, 4
	adds r1, r0
	lsls r1, 2
	adds r1, r3
	movs r2, 0x12
	ldrsh r0, [r4, r2]
	lsrs r2, r0, 31
	adds r0, r2
	asrs r0, 1
	ldrh r6, [r1, 0x24]
	adds r0, r6
	strh r0, [r1, 0x24]
	movs r1, 0x8
	ldrsh r0, [r4, r1]
	lsls r1, r0, 4
	adds r1, r0
	lsls r1, 2
	adds r1, r3
	movs r2, 0x14
	ldrsh r0, [r4, r2]
	lsrs r2, r0, 31
	adds r0, r2
	asrs r0, 1
	ldrh r3, [r1, 0x26]
	adds r0, r3
	strh r0, [r1, 0x26]
	b _080A8300
	.align 2, 0
_080A82C4: .4byte gSprites
_080A82C8:
	movs r6, 0x8
	ldrsh r0, [r4, r6]
	lsls r2, r0, 4
	adds r2, r0
	lsls r2, 2
	adds r2, r3
	movs r0, 0x12
	ldrsh r1, [r4, r0]
	lsrs r0, r1, 31
	adds r1, r0
	asrs r1, 1
	ldrh r0, [r2, 0x24]
	subs r0, r1
	strh r0, [r2, 0x24]
	movs r1, 0x8
	ldrsh r0, [r4, r1]
	lsls r2, r0, 4
	adds r2, r0
	lsls r2, 2
	adds r2, r3
	movs r3, 0x14
	ldrsh r1, [r4, r3]
	lsrs r0, r1, 31
	adds r1, r0
	asrs r1, 1
	ldrh r0, [r2, 0x26]
	subs r0, r1
	strh r0, [r2, 0x26]
_080A8300:
	adds r0, r5, 0
	bl move_anim_task_del
	b _080A830C
_080A8308:
	subs r0, r2, 0x1
	strh r0, [r4, 0xE]
_080A830C:
	pop {r4-r6}
	pop {r0}
	bx r0
	thumb_func_end sub_80A81D8

	thumb_func_start sub_80A8314
sub_80A8314: @ 80A8314
	push {r4,r5,lr}
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	ldr r5, _080A8364 @ =gUnknown_03004B00
	ldrb r0, [r5]
	bl obj_id_for_side_relative_to_move
	lsls r0, 24
	lsrs r0, 24
	ldr r2, _080A8368 @ =gSprites
	lsls r1, r0, 4
	adds r1, r0
	lsls r1, 2
	adds r1, r2
	ldrh r2, [r5, 0x2]
	strh r2, [r1, 0x24]
	ldr r2, _080A836C @ =gTasks
	lsls r1, r4, 2
	adds r1, r4
	lsls r1, 3
	adds r1, r2
	strh r0, [r1, 0x8]
	ldrh r0, [r5, 0x2]
	strh r0, [r1, 0xA]
	ldrh r0, [r5, 0x4]
	strh r0, [r1, 0xC]
	ldrh r0, [r5, 0x6]
	strh r0, [r1, 0xE]
	ldrh r0, [r5, 0x8]
	strh r0, [r1, 0x10]
	ldr r2, _080A8370 @ =sub_80A8374
	str r2, [r1]
	adds r0, r4, 0
	bl _call_via_r2
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080A8364: .4byte gUnknown_03004B00
_080A8368: .4byte gSprites
_080A836C: .4byte gTasks
_080A8370: .4byte sub_80A8374
	thumb_func_end sub_80A8314

	thumb_func_start sub_80A8374
sub_80A8374: @ 80A8374
	push {r4-r7,lr}
	lsls r0, 24
	lsrs r6, r0, 24
	ldr r2, _080A8400 @ =gTasks
	lsls r0, r6, 2
	adds r0, r6
	lsls r0, 3
	adds r3, r0, r2
	ldrb r5, [r3, 0x8]
	ldrh r4, [r3, 0xA]
	ldrh r1, [r3, 0x18]
	adds r0, r1, 0x1
	strh r0, [r3, 0x18]
	movs r7, 0xC
	ldrsh r0, [r3, r7]
	lsls r1, 16
	asrs r1, 16
	mov r12, r2
	ldr r7, _080A8404 @ =gSprites
	cmp r0, r1
	bne _080A83C6
	movs r0, 0
	strh r0, [r3, 0x18]
	lsls r0, r5, 4
	adds r0, r5
	lsls r0, 2
	adds r1, r0, r7
	ldrh r3, [r1, 0x24]
	movs r0, 0x24
	ldrsh r2, [r1, r0]
	lsls r0, r4, 16
	asrs r0, 16
	cmp r2, r0
	bne _080A83BE
	negs r0, r2
	lsls r0, 16
	lsrs r4, r0, 16
_080A83BE:
	lsls r0, r4, 16
	asrs r0, 16
	adds r0, r3
	strh r0, [r1, 0x24]
_080A83C6:
	lsls r2, r6, 2
	adds r2, r6
	lsls r2, 3
	add r2, r12
	strh r4, [r2, 0xA]
	ldrh r1, [r2, 0xE]
	ldrh r0, [r2, 0x1A]
	adds r1, r0
	strh r1, [r2, 0x1A]
	lsls r0, r5, 4
	adds r0, r5
	lsls r0, 2
	adds r0, r7
	lsls r1, 16
	asrs r1, 24
	strh r1, [r0, 0x26]
	ldrh r0, [r2, 0x10]
	subs r0, 0x1
	strh r0, [r2, 0x10]
	lsls r0, 16
	cmp r0, 0
	bne _080A83F8
	adds r0, r6, 0
	bl move_anim_task_del
_080A83F8:
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080A8400: .4byte gTasks
_080A8404: .4byte gSprites
	thumb_func_end sub_80A8374

	thumb_func_start sub_80A8408
sub_80A8408: @ 80A8408
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	lsls r0, 24
	lsrs r5, r0, 24
	movs r6, 0x1
	ldr r4, _080A847C @ =gUnknown_03004B00
	ldrb r0, [r4]
	bl obj_id_for_side_relative_to_move
	lsls r0, 24
	lsrs r7, r0, 24
	movs r1, 0x8
	ldrsh r0, [r4, r1]
	cmp r0, 0x5
	ble _080A842C
	movs r0, 0x5
	strh r0, [r4, 0x8]
_080A842C:
	movs r1, 0
	movs r2, 0x8
	ldrsh r0, [r4, r2]
	adds r3, r4, 0
	ldr r2, _080A8480 @ =gTasks
	mov r12, r2
	lsls r4, r5, 2
	ldr r2, _080A8484 @ =sub_80A8488
	mov r8, r2
	cmp r1, r0
	bge _080A8452
	adds r2, r0, 0
_080A8444:
	lsls r0, r6, 25
	lsrs r6, r0, 24
	adds r0, r1, 0x1
	lsls r0, 24
	lsrs r1, r0, 24
	cmp r1, r2
	blt _080A8444
_080A8452:
	adds r0, r4, r5
	lsls r0, 3
	add r0, r12
	strh r7, [r0, 0x8]
	ldrh r1, [r3, 0x2]
	strh r1, [r0, 0xA]
	ldrh r1, [r3, 0x4]
	strh r1, [r0, 0xC]
	ldrh r1, [r3, 0x6]
	strh r1, [r0, 0xE]
	strh r6, [r0, 0x10]
	mov r1, r8
	str r1, [r0]
	adds r0, r5, 0
	bl _call_via_r8
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080A847C: .4byte gUnknown_03004B00
_080A8480: .4byte gTasks
_080A8484: .4byte sub_80A8488
	thumb_func_end sub_80A8408

	thumb_func_start sub_80A8488
sub_80A8488: @ 80A8488
	push {r4-r6,lr}
	lsls r0, 24
	lsrs r0, 24
	adds r6, r0, 0
	ldr r1, _080A84F8 @ =gTasks
	lsls r0, r6, 2
	adds r0, r6
	lsls r0, 3
	adds r5, r0, r1
	ldrb r4, [r5, 0x8]
	movs r1, 0x12
	ldrsh r0, [r5, r1]
	movs r2, 0xA
	ldrsh r1, [r5, r2]
	bl Sin
	ldr r2, _080A84FC @ =gSprites
	lsls r1, r4, 4
	adds r1, r4
	lsls r1, 2
	adds r4, r1, r2
	strh r0, [r4, 0x24]
	movs r1, 0x12
	ldrsh r0, [r5, r1]
	movs r2, 0xC
	ldrsh r1, [r5, r2]
	bl Cos
	negs r0, r0
	strh r0, [r4, 0x26]
	ldrh r1, [r5, 0xC]
	adds r0, r1
	strh r0, [r4, 0x26]
	ldrh r0, [r5, 0x10]
	ldrh r1, [r5, 0x12]
	adds r0, r1
	movs r1, 0xFF
	ands r0, r1
	strh r0, [r5, 0x12]
	cmp r0, 0
	bne _080A84E0
	ldrh r0, [r5, 0xE]
	subs r0, 0x1
	strh r0, [r5, 0xE]
_080A84E0:
	movs r2, 0xE
	ldrsh r0, [r5, r2]
	cmp r0, 0
	bne _080A84F2
	strh r0, [r4, 0x24]
	strh r0, [r4, 0x26]
	adds r0, r6, 0
	bl move_anim_task_del
_080A84F2:
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_080A84F8: .4byte gTasks
_080A84FC: .4byte gSprites
	thumb_func_end sub_80A8488

	thumb_func_start sub_80A8500
sub_80A8500: @ 80A8500
	push {r4,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	ldr r0, _080A8528 @ =gUnknown_0202F7C8
	ldrb r0, [r0]
	bl battle_side_get_owner
	lsls r0, 24
	cmp r0, 0
	beq _080A851C
	ldr r1, _080A852C @ =gUnknown_03004B00
	ldrh r0, [r1, 0x2]
	negs r0, r0
	strh r0, [r1, 0x2]
_080A851C:
	adds r0, r4, 0
	bl sub_80A8408
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080A8528: .4byte gUnknown_0202F7C8
_080A852C: .4byte gUnknown_03004B00
	thumb_func_end sub_80A8500

	thumb_func_start sub_80A8530
sub_80A8530: @ 80A8530
	push {r4,lr}
	adds r4, r0, 0
	adds r2, r4, 0
	adds r2, 0x3E
	ldrb r0, [r2]
	movs r1, 0x4
	orrs r0, r1
	strb r0, [r2]
	ldr r0, _080A8558 @ =gUnknown_0202F7C8
	ldrb r0, [r0]
	bl battle_side_get_owner
	lsls r0, 24
	cmp r0, 0
	beq _080A8560
	ldr r1, _080A855C @ =gUnknown_03004B00
	ldrh r0, [r1, 0x2]
	negs r0, r0
	b _080A8564
	.align 2, 0
_080A8558: .4byte gUnknown_0202F7C8
_080A855C: .4byte gUnknown_03004B00
_080A8560:
	ldr r1, _080A8590 @ =gUnknown_03004B00
	ldrh r0, [r1, 0x2]
_080A8564:
	strh r0, [r4, 0x30]
	ldrh r2, [r1]
	movs r0, 0
	strh r2, [r4, 0x2E]
	strh r0, [r4, 0x32]
	ldr r1, _080A8594 @ =gUnknown_02024BE0
	ldr r0, _080A8598 @ =gUnknown_0202F7C8
	ldrb r0, [r0]
	adds r0, r1
	ldrb r0, [r0]
	strh r0, [r4, 0x34]
	strh r2, [r4, 0x36]
	ldr r1, _080A859C @ =sub_80A85A4
	adds r0, r4, 0
	bl oamt_set_x3A_32
	ldr r0, _080A85A0 @ =sub_8078458
	str r0, [r4, 0x1C]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080A8590: .4byte gUnknown_03004B00
_080A8594: .4byte gUnknown_02024BE0
_080A8598: .4byte gUnknown_0202F7C8
_080A859C: .4byte sub_80A85A4
_080A85A0: .4byte sub_8078458
	thumb_func_end sub_80A8530

	thumb_func_start sub_80A85A4
sub_80A85A4: @ 80A85A4
	push {lr}
	ldrh r1, [r0, 0x36]
	strh r1, [r0, 0x2E]
	ldrh r1, [r0, 0x30]
	negs r1, r1
	strh r1, [r0, 0x30]
	ldr r1, _080A85C0 @ =sub_8078458
	str r1, [r0, 0x1C]
	ldr r1, _080A85C4 @ =move_anim_8072740
	bl oamt_set_x3A_32
	pop {r0}
	bx r0
	.align 2, 0
_080A85C0: .4byte sub_8078458
_080A85C4: .4byte move_anim_8072740
	thumb_func_end sub_80A85A4

	thumb_func_start sub_80A85C8
sub_80A85C8: @ 80A85C8
	push {r4,r5,lr}
	adds r4, r0, 0
	adds r2, r4, 0
	adds r2, 0x3E
	ldrb r0, [r2]
	movs r1, 0x4
	orrs r0, r1
	strb r0, [r2]
	ldr r5, _080A8608 @ =gUnknown_03004B00
	ldrb r0, [r5, 0x4]
	bl obj_id_for_side_relative_to_move
	lsls r0, 24
	lsrs r0, 24
	ldrh r2, [r5]
	movs r1, 0
	strh r2, [r4, 0x2E]
	strh r1, [r4, 0x30]
	ldrh r1, [r5, 0x2]
	strh r1, [r4, 0x32]
	strh r0, [r4, 0x34]
	strh r2, [r4, 0x36]
	ldr r1, _080A860C @ =sub_80A8614
	adds r0, r4, 0
	bl oamt_set_x3A_32
	ldr r0, _080A8610 @ =sub_8078458
	str r0, [r4, 0x1C]
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080A8608: .4byte gUnknown_03004B00
_080A860C: .4byte sub_80A8614
_080A8610: .4byte sub_8078458
	thumb_func_end sub_80A85C8

	thumb_func_start sub_80A8614
sub_80A8614: @ 80A8614
	push {lr}
	ldrh r1, [r0, 0x36]
	strh r1, [r0, 0x2E]
	ldrh r1, [r0, 0x32]
	negs r1, r1
	strh r1, [r0, 0x32]
	ldr r1, _080A8630 @ =sub_8078458
	str r1, [r0, 0x1C]
	ldr r1, _080A8634 @ =move_anim_8072740
	bl oamt_set_x3A_32
	pop {r0}
	bx r0
	.align 2, 0
_080A8630: .4byte sub_8078458
_080A8634: .4byte move_anim_8072740
	thumb_func_end sub_80A8614

	thumb_func_start sub_80A8638
sub_80A8638: @ 80A8638
	push {r4-r7,lr}
	sub sp, 0x4
	adds r6, r0, 0
	ldr r0, _080A8650 @ =gUnknown_03004B00
	movs r1, 0
	ldrsh r0, [r0, r1]
	cmp r0, 0
	bne _080A865C
	ldr r1, _080A8654 @ =gUnknown_02024BE0
	ldr r0, _080A8658 @ =gUnknown_0202F7C8
	b _080A8660
	.align 2, 0
_080A8650: .4byte gUnknown_03004B00
_080A8654: .4byte gUnknown_02024BE0
_080A8658: .4byte gUnknown_0202F7C8
_080A865C:
	ldr r1, _080A86C0 @ =gUnknown_02024BE0
	ldr r0, _080A86C4 @ =gUnknown_0202F7C9
_080A8660:
	ldrb r0, [r0]
	adds r0, r1
	ldrb r7, [r0]
	ldr r5, _080A86C8 @ =gUnknown_03004B00
	ldrh r0, [r5, 0x4]
	movs r3, 0
	strh r0, [r6, 0x2E]
	ldr r0, _080A86CC @ =gSprites
	lsls r4, r7, 4
	adds r4, r7
	lsls r4, 2
	adds r4, r0
	ldrh r0, [r4, 0x24]
	ldrh r1, [r4, 0x20]
	adds r0, r1
	strh r0, [r6, 0x30]
	ldrh r0, [r4, 0x20]
	strh r0, [r6, 0x32]
	ldrh r0, [r4, 0x26]
	ldrh r1, [r4, 0x22]
	adds r0, r1
	strh r0, [r6, 0x34]
	ldrh r0, [r4, 0x22]
	strh r0, [r6, 0x36]
	adds r0, r6, 0
	str r3, [sp]
	bl sub_8078A5C
	ldr r3, [sp]
	strh r3, [r6, 0x34]
	strh r3, [r6, 0x36]
	ldrh r0, [r4, 0x24]
	strh r0, [r6, 0x38]
	ldrh r0, [r4, 0x26]
	strh r0, [r6, 0x3A]
	adds r2, r6, 0
	adds r2, 0x3E
	ldrb r0, [r2]
	movs r1, 0x4
	orrs r0, r1
	strb r0, [r2]
	movs r1, 0x2
	ldrsh r0, [r5, r1]
	cmp r0, 0x1
	bne _080A86D0
	strh r3, [r6, 0x32]
	b _080A86D6
	.align 2, 0
_080A86C0: .4byte gUnknown_02024BE0
_080A86C4: .4byte gUnknown_0202F7C9
_080A86C8: .4byte gUnknown_03004B00
_080A86CC: .4byte gSprites
_080A86D0:
	cmp r0, 0x2
	bne _080A86D6
	strh r3, [r6, 0x30]
_080A86D6:
	ldr r0, _080A86EC @ =gUnknown_03004B00
	ldrh r1, [r0, 0x2]
	lsls r0, r7, 8
	orrs r0, r1
	strh r0, [r6, 0x3C]
	ldr r0, _080A86F0 @ =sub_80A86F4
	str r0, [r6, 0x1C]
	add sp, 0x4
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080A86EC: .4byte gUnknown_03004B00
_080A86F0: .4byte sub_80A86F4
	thumb_func_end sub_80A8638

	thumb_func_start sub_80A86F4
sub_80A86F4: @ 80A86F4
	push {r4-r6,lr}
	adds r2, r0, 0
	ldrh r0, [r2, 0x3C]
	lsls r1, r0, 24
	lsrs r4, r1, 24
	adds r5, r4, 0
	lsls r0, 16
	asrs r0, 24
	lsls r1, r0, 4
	adds r1, r0
	lsls r1, 2
	ldr r0, _080A8730 @ =gSprites
	adds r3, r1, r0
	ldrh r0, [r2, 0x2E]
	movs r6, 0x2E
	ldrsh r1, [r2, r6]
	cmp r1, 0
	bne _080A8734
	cmp r4, 0x1
	bhi _080A871E
	strh r1, [r3, 0x24]
_080A871E:
	cmp r5, 0x2
	beq _080A8726
	cmp r5, 0
	bne _080A8728
_080A8726:
	strh r1, [r3, 0x26]
_080A8728:
	adds r0, r2, 0
	bl move_anim_8072740
	b _080A875E
	.align 2, 0
_080A8730: .4byte gSprites
_080A8734:
	subs r0, 0x1
	strh r0, [r2, 0x2E]
	ldrh r1, [r2, 0x30]
	ldrh r0, [r2, 0x34]
	adds r1, r0
	strh r1, [r2, 0x34]
	ldrh r0, [r2, 0x32]
	ldrh r4, [r2, 0x36]
	adds r0, r4
	strh r0, [r2, 0x36]
	lsls r1, 16
	asrs r1, 24
	ldrh r6, [r2, 0x38]
	adds r1, r6
	strh r1, [r3, 0x24]
	ldrh r0, [r2, 0x36]
	lsls r0, 16
	asrs r0, 24
	ldrh r2, [r2, 0x3A]
	adds r0, r2
	strh r0, [r3, 0x26]
_080A875E:
	pop {r4-r6}
	pop {r0}
	bx r0
	thumb_func_end sub_80A86F4

	thumb_func_start sub_80A8764
sub_80A8764: @ 80A8764
	push {r4-r6,lr}
	adds r5, r0, 0
	ldr r0, _080A8778 @ =gUnknown_03004B00
	movs r1, 0
	ldrsh r0, [r0, r1]
	cmp r0, 0
	bne _080A8780
	ldr r0, _080A877C @ =gUnknown_0202F7C8
	b _080A8782
	.align 2, 0
_080A8778: .4byte gUnknown_03004B00
_080A877C: .4byte gUnknown_0202F7C8
_080A8780:
	ldr r0, _080A8800 @ =gUnknown_0202F7C9
_080A8782:
	ldrb r2, [r0]
	ldr r0, _080A8804 @ =gUnknown_02024BE0
	adds r0, r2, r0
	ldrb r6, [r0]
	adds r0, r2, 0
	bl battle_side_get_owner
	lsls r0, 24
	cmp r0, 0
	beq _080A87AC
	ldr r1, _080A8808 @ =gUnknown_03004B00
	ldrh r0, [r1, 0x2]
	negs r0, r0
	strh r0, [r1, 0x2]
	movs r2, 0x6
	ldrsh r0, [r1, r2]
	cmp r0, 0x1
	bne _080A87AC
	ldrh r0, [r1, 0x4]
	negs r0, r0
	strh r0, [r1, 0x4]
_080A87AC:
	ldr r2, _080A8808 @ =gUnknown_03004B00
	ldrh r0, [r2, 0x8]
	movs r4, 0
	strh r0, [r5, 0x2E]
	ldr r0, _080A880C @ =gSprites
	lsls r1, r6, 4
	adds r1, r6
	lsls r1, 2
	adds r1, r0
	ldrh r0, [r1, 0x20]
	strh r0, [r5, 0x30]
	ldrh r0, [r2, 0x2]
	ldrh r3, [r1, 0x20]
	adds r0, r3
	strh r0, [r5, 0x32]
	ldrh r0, [r1, 0x22]
	strh r0, [r5, 0x34]
	ldrh r0, [r2, 0x4]
	ldrh r1, [r1, 0x22]
	adds r0, r1
	strh r0, [r5, 0x36]
	adds r0, r5, 0
	bl sub_8078A5C
	strh r4, [r5, 0x34]
	strh r4, [r5, 0x36]
	strh r6, [r5, 0x38]
	adds r2, r5, 0
	adds r2, 0x3E
	ldrb r0, [r2]
	movs r1, 0x4
	orrs r0, r1
	strb r0, [r2]
	ldr r1, _080A8810 @ =move_anim_8072740
	adds r0, r5, 0
	bl oamt_set_x3A_32
	ldr r0, _080A8814 @ =sub_80784A8
	str r0, [r5, 0x1C]
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_080A8800: .4byte gUnknown_0202F7C9
_080A8804: .4byte gUnknown_02024BE0
_080A8808: .4byte gUnknown_03004B00
_080A880C: .4byte gSprites
_080A8810: .4byte move_anim_8072740
_080A8814: .4byte sub_80784A8
	thumb_func_end sub_80A8764

	thumb_func_start sub_80A8818
sub_80A8818: @ 80A8818
	push {r4-r7,lr}
	adds r6, r0, 0
	adds r2, r6, 0
	adds r2, 0x3E
	ldrb r0, [r2]
	movs r1, 0x4
	orrs r0, r1
	strb r0, [r2]
	ldr r0, _080A8838 @ =gUnknown_03004B00
	movs r1, 0
	ldrsh r0, [r0, r1]
	cmp r0, 0
	bne _080A8840
	ldr r0, _080A883C @ =gUnknown_0202F7C8
	b _080A8842
	.align 2, 0
_080A8838: .4byte gUnknown_03004B00
_080A883C: .4byte gUnknown_0202F7C8
_080A8840:
	ldr r0, _080A88C0 @ =gUnknown_0202F7C9
_080A8842:
	ldrb r1, [r0]
	ldr r0, _080A88C4 @ =gUnknown_02024BE0
	adds r0, r1, r0
	ldrb r7, [r0]
	adds r0, r1, 0
	bl battle_side_get_owner
	lsls r0, 24
	cmp r0, 0
	beq _080A886C
	ldr r1, _080A88C8 @ =gUnknown_03004B00
	ldrh r0, [r1, 0x2]
	negs r0, r0
	strh r0, [r1, 0x2]
	movs r2, 0x6
	ldrsh r0, [r1, r2]
	cmp r0, 0x1
	bne _080A886C
	ldrh r0, [r1, 0x4]
	negs r0, r0
	strh r0, [r1, 0x4]
_080A886C:
	ldr r5, _080A88C8 @ =gUnknown_03004B00
	ldrh r0, [r5, 0x8]
	strh r0, [r6, 0x2E]
	ldr r0, _080A88CC @ =gSprites
	lsls r4, r7, 4
	adds r4, r7
	lsls r4, 2
	adds r4, r0
	ldrh r0, [r4, 0x24]
	ldrh r1, [r4, 0x20]
	adds r0, r1
	strh r0, [r6, 0x30]
	ldrh r1, [r5, 0x2]
	adds r0, r1
	strh r0, [r6, 0x32]
	ldrh r0, [r4, 0x26]
	ldrh r2, [r4, 0x22]
	adds r0, r2
	strh r0, [r6, 0x34]
	ldrh r1, [r5, 0x4]
	adds r0, r1
	strh r0, [r6, 0x36]
	adds r0, r6, 0
	bl sub_8078A5C
	ldrh r0, [r4, 0x24]
	lsls r0, 8
	strh r0, [r6, 0x34]
	ldrh r0, [r4, 0x26]
	lsls r0, 8
	strh r0, [r6, 0x36]
	strh r7, [r6, 0x38]
	ldrh r0, [r5, 0xA]
	strh r0, [r6, 0x3A]
	lsls r0, 16
	cmp r0, 0
	bne _080A88D4
	ldr r1, _080A88D0 @ =move_anim_8072740
	adds r0, r6, 0
	bl oamt_set_x3A_32
	b _080A88DC
	.align 2, 0
_080A88C0: .4byte gUnknown_0202F7C9
_080A88C4: .4byte gUnknown_02024BE0
_080A88C8: .4byte gUnknown_03004B00
_080A88CC: .4byte gSprites
_080A88D0: .4byte move_anim_8072740
_080A88D4:
	ldr r1, _080A88E8 @ =sub_80A88F0
	adds r0, r6, 0
	bl oamt_set_x3A_32
_080A88DC:
	ldr r0, _080A88EC @ =sub_80784A8
	str r0, [r6, 0x1C]
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080A88E8: .4byte sub_80A88F0
_080A88EC: .4byte sub_80784A8
	thumb_func_end sub_80A8818

	thumb_func_start sub_80A88F0
sub_80A88F0: @ 80A88F0
	push {r4,lr}
	ldr r4, _080A891C @ =gSprites
	movs r1, 0x38
	ldrsh r2, [r0, r1]
	lsls r1, r2, 4
	adds r1, r2
	lsls r1, 2
	adds r1, r4
	movs r3, 0
	strh r3, [r1, 0x24]
	movs r1, 0x38
	ldrsh r2, [r0, r1]
	lsls r1, r2, 4
	adds r1, r2
	lsls r1, 2
	adds r1, r4
	strh r3, [r1, 0x26]
	bl move_anim_8072740
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080A891C: .4byte gSprites
	thumb_func_end sub_80A88F0

	thumb_func_start sub_80A8920
sub_80A8920: @ 80A8920
	push {r4-r7,lr}
	lsls r0, 24
	lsrs r6, r0, 24
	ldr r5, _080A89A4 @ =gUnknown_03004B00
	movs r0, 0x6
	ldrsh r1, [r5, r0]
	movs r0, 0x80
	lsls r0, 8
	bl __divsi3
	lsls r0, 16
	lsrs r7, r0, 16
	ldr r0, _080A89A8 @ =gUnknown_0202F7C8
	ldrb r0, [r0]
	bl battle_side_get_owner
	lsls r0, 24
	cmp r0, 0
	beq _080A8952
	ldrh r0, [r5, 0x2]
	negs r0, r0
	strh r0, [r5, 0x2]
	ldrh r0, [r5, 0xA]
	negs r0, r0
	strh r0, [r5, 0xA]
_080A8952:
	ldrb r0, [r5]
	bl obj_id_for_side_relative_to_move
	ldr r1, _080A89AC @ =gTasks
	lsls r4, r6, 2
	adds r4, r6
	lsls r4, 3
	adds r4, r1
	lsls r0, 24
	lsrs r0, 24
	strh r0, [r4, 0x8]
	movs r1, 0x2
	ldrsh r0, [r5, r1]
	lsls r0, 8
	movs r2, 0x6
	ldrsh r1, [r5, r2]
	bl __divsi3
	strh r0, [r4, 0xA]
	ldrh r0, [r5, 0x4]
	strh r0, [r4, 0xC]
	ldrh r0, [r5, 0x6]
	strh r0, [r4, 0xE]
	ldrh r0, [r5, 0x8]
	strh r0, [r4, 0x10]
	movs r1, 0xA
	ldrsh r0, [r5, r1]
	lsls r0, 8
	movs r2, 0xC
	ldrsh r1, [r5, r2]
	bl __divsi3
	strh r0, [r4, 0x12]
	ldrh r0, [r5, 0xC]
	strh r0, [r4, 0x14]
	strh r7, [r4, 0x16]
	ldr r0, _080A89B0 @ =sub_80A89B4
	str r0, [r4]
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080A89A4: .4byte gUnknown_03004B00
_080A89A8: .4byte gUnknown_0202F7C8
_080A89AC: .4byte gTasks
_080A89B0: .4byte sub_80A89B4
	thumb_func_end sub_80A8920

	thumb_func_start sub_80A89B4
sub_80A89B4: @ 80A89B4
	push {r4,r5,lr}
	lsls r0, 24
	lsrs r0, 24
	ldr r2, _080A8A0C @ =gTasks
	lsls r1, r0, 2
	adds r1, r0
	lsls r1, 3
	adds r5, r1, r2
	ldrb r1, [r5, 0x8]
	ldrh r0, [r5, 0xA]
	ldrh r2, [r5, 0x1E]
	adds r0, r2
	strh r0, [r5, 0x1E]
	ldr r2, _080A8A10 @ =gSprites
	lsls r4, r1, 4
	adds r4, r1
	lsls r4, 2
	adds r4, r2
	lsls r0, 16
	asrs r0, 24
	strh r0, [r4, 0x24]
	ldrh r0, [r5, 0x1C]
	lsrs r0, 8
	movs r2, 0xC
	ldrsh r1, [r5, r2]
	bl Sin
	strh r0, [r4, 0x26]
	ldrh r0, [r5, 0x16]
	ldrh r1, [r5, 0x1C]
	adds r0, r1
	strh r0, [r5, 0x1C]
	ldrh r0, [r5, 0xE]
	subs r0, 0x1
	strh r0, [r5, 0xE]
	lsls r0, 16
	cmp r0, 0
	bne _080A8A04
	ldr r0, _080A8A14 @ =sub_80A8A18
	str r0, [r5]
_080A8A04:
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080A8A0C: .4byte gTasks
_080A8A10: .4byte gSprites
_080A8A14: .4byte sub_80A8A18
	thumb_func_end sub_80A89B4

	thumb_func_start sub_80A8A18
sub_80A8A18: @ 80A8A18
	push {r4,r5,lr}
	lsls r0, 24
	lsrs r0, 24
	adds r5, r0, 0
	ldr r1, _080A8A3C @ =gTasks
	lsls r0, r5, 2
	adds r0, r5
	lsls r0, 3
	adds r4, r0, r1
	ldrh r1, [r4, 0x10]
	movs r2, 0x10
	ldrsh r0, [r4, r2]
	cmp r0, 0
	ble _080A8A40
	subs r0, r1, 0x1
	strh r0, [r4, 0x10]
	b _080A8A74
	.align 2, 0
_080A8A3C: .4byte gTasks
_080A8A40:
	ldrb r0, [r4, 0x8]
	ldrh r2, [r4, 0x12]
	ldrh r1, [r4, 0x20]
	adds r2, r1
	strh r2, [r4, 0x20]
	ldr r3, _080A8A7C @ =gSprites
	lsls r1, r0, 4
	adds r1, r0
	lsls r1, 2
	adds r1, r3
	lsls r2, 16
	asrs r2, 24
	ldrh r0, [r4, 0x1E]
	lsls r0, 16
	asrs r0, 24
	adds r2, r0
	strh r2, [r1, 0x24]
	ldrh r0, [r4, 0x14]
	subs r0, 0x1
	strh r0, [r4, 0x14]
	lsls r0, 16
	cmp r0, 0
	bne _080A8A74
	adds r0, r5, 0
	bl move_anim_task_del
_080A8A74:
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080A8A7C: .4byte gSprites
	thumb_func_end sub_80A8A18

	thumb_func_start sub_80A8A80
sub_80A8A80: @ 80A8A80
	push {r4-r6,lr}
	lsls r0, 24
	lsrs r6, r0, 24
	ldr r1, _080A8AA4 @ =gUnknown_03004B00
	movs r2, 0
	ldrsh r0, [r1, r2]
	cmp r0, 0x2
	beq _080A8AAE
	cmp r0, 0x2
	bgt _080A8AA8
	cmp r0, 0
	blt _080A8AE0
	ldrb r0, [r1]
	bl obj_id_for_side_relative_to_move
	lsls r0, 24
	lsrs r2, r0, 24
	b _080A8AE8
	.align 2, 0
_080A8AA4: .4byte gUnknown_03004B00
_080A8AA8:
	cmp r0, 0x3
	beq _080A8AB8
	b _080A8AE0
_080A8AAE:
	ldr r5, _080A8AB4 @ =gUnknown_0202F7C8
	b _080A8ABA
	.align 2, 0
_080A8AB4: .4byte gUnknown_0202F7C8
_080A8AB8:
	ldr r5, _080A8AD8 @ =gUnknown_0202F7C9
_080A8ABA:
	ldrb r0, [r5]
	movs r4, 0x2
	eors r0, r4
	bl b_side_obj__get_some_boolean
	lsls r0, 24
	cmp r0, 0
	beq _080A8AE0
	ldr r1, _080A8ADC @ =gUnknown_02024BE0
	ldrb r0, [r5]
	eors r0, r4
	adds r0, r1
	ldrb r2, [r0]
	b _080A8AE8
	.align 2, 0
_080A8AD8: .4byte gUnknown_0202F7C9
_080A8ADC: .4byte gUnknown_02024BE0
_080A8AE0:
	adds r0, r6, 0
	bl move_anim_task_del
	b _080A8B28
_080A8AE8:
	ldr r1, _080A8B08 @ =gTasks
	lsls r4, r6, 2
	adds r0, r4, r6
	lsls r0, 3
	adds r5, r0, r1
	strh r2, [r5, 0x8]
	ldr r0, _080A8B0C @ =gUnknown_0202F7C9
	ldrb r0, [r0]
	bl battle_side_get_owner
	lsls r0, 24
	cmp r0, 0
	beq _080A8B14
	ldr r0, _080A8B10 @ =gUnknown_03004B00
	ldrh r0, [r0, 0x2]
	b _080A8B1A
	.align 2, 0
_080A8B08: .4byte gTasks
_080A8B0C: .4byte gUnknown_0202F7C9
_080A8B10: .4byte gUnknown_03004B00
_080A8B14:
	ldr r0, _080A8B30 @ =gUnknown_03004B00
	ldrh r0, [r0, 0x2]
	negs r0, r0
_080A8B1A:
	strh r0, [r5, 0xA]
	ldr r0, _080A8B34 @ =gTasks
	adds r1, r4, r6
	lsls r1, 3
	adds r1, r0
	ldr r0, _080A8B38 @ =sub_80A8B3C
	str r0, [r1]
_080A8B28:
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_080A8B30: .4byte gUnknown_03004B00
_080A8B34: .4byte gTasks
_080A8B38: .4byte sub_80A8B3C
	thumb_func_end sub_80A8A80

	thumb_func_start sub_80A8B3C
sub_80A8B3C: @ 80A8B3C
	push {r4,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	ldr r0, _080A8B80 @ =gTasks
	lsls r1, r4, 2
	adds r1, r4
	lsls r1, 3
	adds r1, r0
	ldrb r2, [r1, 0x8]
	ldr r3, _080A8B84 @ =gSprites
	lsls r0, r2, 4
	adds r0, r2
	lsls r0, 2
	adds r0, r3
	ldrh r1, [r1, 0xA]
	ldrh r2, [r0, 0x24]
	adds r1, r2
	strh r1, [r0, 0x24]
	movs r2, 0x24
	ldrsh r1, [r0, r2]
	movs r2, 0x20
	ldrsh r0, [r0, r2]
	adds r1, r0
	adds r1, 0x20
	movs r0, 0x98
	lsls r0, 1
	cmp r1, r0
	bls _080A8B7A
	adds r0, r4, 0
	bl move_anim_task_del
_080A8B7A:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080A8B80: .4byte gTasks
_080A8B84: .4byte gSprites
	thumb_func_end sub_80A8B3C

	thumb_func_start sub_80A8B88
sub_80A8B88: @ 80A8B88
	push {r4-r6,lr}
	lsls r0, 24
	lsrs r5, r0, 24
	ldr r6, _080A8BD8 @ =gUnknown_0202F7C8
	ldrb r0, [r6]
	bl battle_side_get_owner
	lsls r0, 24
	cmp r0, 0
	beq _080A8BA4
	ldr r1, _080A8BDC @ =gUnknown_03004B00
	ldrh r0, [r1, 0x2]
	negs r0, r0
	strh r0, [r1, 0x2]
_080A8BA4:
	ldr r4, _080A8BDC @ =gUnknown_03004B00
	ldrb r0, [r4, 0x8]
	bl obj_id_for_side_relative_to_move
	lsls r0, 24
	lsrs r0, 24
	ldr r2, _080A8BE0 @ =gTasks
	lsls r3, r5, 2
	adds r1, r3, r5
	lsls r1, 3
	adds r2, r1, r2
	ldrh r1, [r4]
	strh r1, [r2, 0x8]
	ldrh r1, [r4, 0x2]
	strh r1, [r2, 0xA]
	ldrh r1, [r4, 0x4]
	strh r1, [r2, 0xC]
	ldrh r1, [r4, 0x6]
	strh r1, [r2, 0xE]
	strh r0, [r2, 0x10]
	movs r1, 0x8
	ldrsh r0, [r4, r1]
	cmp r0, 0
	bne _080A8BE4
	ldrb r0, [r6]
	b _080A8BE8
	.align 2, 0
_080A8BD8: .4byte gUnknown_0202F7C8
_080A8BDC: .4byte gUnknown_03004B00
_080A8BE0: .4byte gTasks
_080A8BE4:
	ldr r0, _080A8C00 @ =gUnknown_0202F7C9
	ldrb r0, [r0]
_080A8BE8:
	strh r0, [r2, 0x12]
	ldr r1, _080A8C04 @ =gTasks
	adds r0, r3, r5
	lsls r0, 3
	adds r0, r1
	movs r1, 0x1
	strh r1, [r0, 0x20]
	ldr r1, _080A8C08 @ =sub_80A8C0C
	str r1, [r0]
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_080A8C00: .4byte gUnknown_0202F7C9
_080A8C04: .4byte gTasks
_080A8C08: .4byte sub_80A8C0C
	thumb_func_end sub_80A8B88

	thumb_func_start sub_80A8C0C
sub_80A8C0C: @ 80A8C0C
	push {r4-r7,lr}
	mov r7, r9
	mov r6, r8
	push {r6,r7}
	lsls r0, 24
	lsrs r6, r0, 24
	ldr r1, _080A8C5C @ =gTasks
	lsls r0, r6, 2
	adds r0, r6
	lsls r0, 3
	adds r4, r0, r1
	ldrb r7, [r4, 0x10]
	ldrh r0, [r4, 0xC]
	ldrh r1, [r4, 0x1C]
	adds r0, r1
	lsls r1, r0, 16
	strh r0, [r4, 0x1C]
	lsrs r1, 24
	mov r8, r1
	mov r0, r8
	movs r2, 0xA
	ldrsh r1, [r4, r2]
	bl Sin
	lsls r0, 16
	lsrs r5, r0, 16
	mov r9, r5
	movs r1, 0x8
	ldrsh r0, [r4, r1]
	cmp r0, 0
	bne _080A8C64
	ldr r0, _080A8C60 @ =gSprites
	lsls r2, r7, 4
	adds r1, r2, r7
	lsls r1, 2
	adds r1, r0
	strh r5, [r1, 0x24]
	mov r9, r0
	adds r4, r2, 0
	b _080A8CAA
	.align 2, 0
_080A8C5C: .4byte gTasks
_080A8C60: .4byte gSprites
_080A8C64:
	ldrb r0, [r4, 0x12]
	bl battle_side_get_owner
	lsls r0, 24
	cmp r0, 0
	bne _080A8C8C
	ldr r1, _080A8C88 @ =gSprites
	lsls r2, r7, 4
	adds r0, r2, r7
	lsls r0, 2
	adds r3, r0, r1
	lsls r0, r5, 16
	asrs r0, 16
	mov r9, r1
	adds r4, r2, 0
	cmp r0, 0
	bge _080A8CA8
	b _080A8CA6
	.align 2, 0
_080A8C88: .4byte gSprites
_080A8C8C:
	ldr r1, _080A8D2C @ =gSprites
	lsls r2, r7, 4
	adds r0, r2, r7
	lsls r0, 2
	adds r3, r0, r1
	mov r4, r9
	lsls r0, r4, 16
	asrs r0, 16
	mov r9, r1
	adds r4, r2, 0
	cmp r0, 0
	bge _080A8CA6
	negs r0, r0
_080A8CA6:
	negs r0, r0
_080A8CA8:
	strh r0, [r3, 0x26]
_080A8CAA:
	mov r5, r8
	cmp r5, 0x7F
	bls _080A8CCC
	ldr r1, _080A8D30 @ =gTasks
	lsls r2, r6, 2
	adds r0, r2, r6
	lsls r0, 3
	adds r3, r0, r1
	movs r5, 0x1E
	ldrsh r0, [r3, r5]
	adds r5, r1, 0
	cmp r0, 0
	bne _080A8CCC
	movs r1, 0x20
	ldrsh r0, [r3, r1]
	cmp r0, 0x1
	beq _080A8CEE
_080A8CCC:
	mov r2, r8
	cmp r2, 0x7E
	bhi _080A8D20
	ldr r1, _080A8D30 @ =gTasks
	lsls r2, r6, 2
	adds r0, r2, r6
	lsls r0, 3
	adds r3, r0, r1
	movs r5, 0x1E
	ldrsh r0, [r3, r5]
	adds r5, r1, 0
	cmp r0, 0x1
	bne _080A8D20
	movs r1, 0x20
	ldrsh r0, [r3, r1]
	cmp r0, 0
	bne _080A8D20
_080A8CEE:
	adds r1, r2, r6
	lsls r1, 3
	adds r1, r5
	ldrh r0, [r1, 0x1E]
	movs r2, 0x1
	eors r0, r2
	strh r0, [r1, 0x1E]
	ldrh r0, [r1, 0x20]
	eors r0, r2
	strh r0, [r1, 0x20]
	ldrh r0, [r1, 0xE]
	subs r0, 0x1
	strh r0, [r1, 0xE]
	lsls r0, 16
	asrs r3, r0, 16
	cmp r3, 0
	bne _080A8D20
	adds r0, r4, r7
	lsls r0, 2
	add r0, r9
	strh r3, [r0, 0x24]
	strh r3, [r0, 0x26]
	adds r0, r6, 0
	bl move_anim_task_del
_080A8D20:
	pop {r3,r4}
	mov r8, r3
	mov r9, r4
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080A8D2C: .4byte gSprites
_080A8D30: .4byte gTasks
	thumb_func_end sub_80A8C0C

	thumb_func_start sub_80A8D34
sub_80A8D34: @ 80A8D34
	push {r4-r6,lr}
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	ldr r6, _080A8D80 @ =gUnknown_03004B00
	ldrb r0, [r6, 0x6]
	bl obj_id_for_side_relative_to_move
	adds r5, r0, 0
	lsls r5, 24
	lsrs r5, 24
	ldrb r1, [r6, 0x8]
	adds r0, r5, 0
	bl sub_8078E70
	ldr r1, _080A8D84 @ =gTasks
	lsls r0, r4, 2
	adds r0, r4
	lsls r0, 3
	adds r0, r1
	ldrh r1, [r6]
	strh r1, [r0, 0x8]
	ldrh r1, [r6, 0x2]
	strh r1, [r0, 0xA]
	ldrh r1, [r6, 0x4]
	strh r1, [r0, 0xC]
	ldrh r1, [r6, 0x4]
	strh r1, [r0, 0xE]
	strh r5, [r0, 0x10]
	movs r1, 0x80
	lsls r1, 1
	strh r1, [r0, 0x1C]
	strh r1, [r0, 0x1E]
	ldr r1, _080A8D88 @ =sub_80A8D8C
	str r1, [r0]
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_080A8D80: .4byte gUnknown_03004B00
_080A8D84: .4byte gTasks
_080A8D88: .4byte sub_80A8D8C
	thumb_func_end sub_80A8D34

	thumb_func_start sub_80A8D8C
sub_80A8D8C: @ 80A8D8C
	push {r4-r6,lr}
	lsls r0, 24
	lsrs r0, 24
	adds r5, r0, 0
	ldr r1, _080A8DEC @ =gTasks
	lsls r0, r5, 2
	adds r0, r5
	lsls r0, 3
	adds r4, r0, r1
	ldrh r0, [r4, 0x8]
	ldrh r1, [r4, 0x1C]
	adds r0, r1
	strh r0, [r4, 0x1C]
	ldrh r0, [r4, 0xA]
	ldrh r3, [r4, 0x1E]
	adds r0, r3
	strh r0, [r4, 0x1E]
	ldrb r0, [r4, 0x10]
	adds r6, r0, 0
	movs r0, 0x1C
	ldrsh r1, [r4, r0]
	movs r3, 0x1E
	ldrsh r2, [r4, r3]
	adds r0, r6, 0
	movs r3, 0
	bl obj_id_set_rotscale
	ldrh r0, [r4, 0xC]
	subs r0, 0x1
	strh r0, [r4, 0xC]
	lsls r0, 16
	asrs r1, r0, 16
	cmp r1, 0
	bne _080A8DFC
	ldrh r2, [r4, 0xE]
	movs r3, 0xE
	ldrsh r0, [r4, r3]
	cmp r0, 0
	ble _080A8DF0
	ldrh r0, [r4, 0x8]
	negs r0, r0
	strh r0, [r4, 0x8]
	ldrh r0, [r4, 0xA]
	negs r0, r0
	strh r0, [r4, 0xA]
	strh r2, [r4, 0xC]
	strh r1, [r4, 0xE]
	b _080A8DFC
	.align 2, 0
_080A8DEC: .4byte gTasks
_080A8DF0:
	adds r0, r6, 0
	bl sub_8078F40
	adds r0, r5, 0
	bl move_anim_task_del
_080A8DFC:
	pop {r4-r6}
	pop {r0}
	bx r0
	thumb_func_end sub_80A8D8C

	thumb_func_start sub_80A8E04
sub_80A8E04: @ 80A8E04
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	lsls r0, 24
	lsrs r7, r0, 24
	ldr r4, _080A8E40 @ =gUnknown_03004B00
	ldrb r0, [r4, 0x4]
	bl obj_id_for_side_relative_to_move
	lsls r0, 24
	lsrs r0, 24
	mov r8, r0
	movs r1, 0
	bl sub_8078E70
	ldr r1, _080A8E44 @ =gTasks
	lsls r0, r7, 2
	adds r0, r7
	lsls r0, 3
	adds r2, r0, r1
	movs r1, 0
	strh r1, [r2, 0xA]
	ldrh r0, [r4]
	strh r0, [r2, 0xC]
	movs r3, 0x6
	ldrsh r0, [r4, r3]
	cmp r0, 0x1
	beq _080A8E48
	strh r1, [r2, 0xE]
	b _080A8E54
	.align 2, 0
_080A8E40: .4byte gUnknown_03004B00
_080A8E44: .4byte gTasks
_080A8E48:
	ldrh r0, [r4]
	ldrh r1, [r4, 0x2]
	adds r3, r0, 0
	muls r3, r1
	adds r0, r3, 0
	strh r0, [r2, 0xE]
_080A8E54:
	ldr r1, _080A8E80 @ =gTasks
	lsls r4, r7, 2
	adds r0, r4, r7
	lsls r0, 3
	adds r5, r0, r1
	ldr r6, _080A8E84 @ =gUnknown_03004B00
	ldrh r0, [r6, 0x2]
	strh r0, [r5, 0x10]
	mov r0, r8
	strh r0, [r5, 0x12]
	ldrh r0, [r6, 0x6]
	strh r0, [r5, 0x14]
	bl sub_8076BE0
	lsls r0, 24
	mov r8, r4
	cmp r0, 0
	beq _080A8E88
	movs r0, 0x1
	strh r0, [r5, 0x16]
	b _080A8EAC
	.align 2, 0
_080A8E80: .4byte gTasks
_080A8E84: .4byte gUnknown_03004B00
_080A8E88:
	movs r1, 0x4
	ldrsh r0, [r6, r1]
	cmp r0, 0
	bne _080A8E98
	ldr r0, _080A8E94 @ =gUnknown_0202F7C8
	b _080A8E9A
	.align 2, 0
_080A8E94: .4byte gUnknown_0202F7C8
_080A8E98:
	ldr r0, _080A8EF0 @ =gUnknown_0202F7C9
_080A8E9A:
	ldrb r0, [r0]
	bl battle_side_get_owner
	movs r1, 0
	lsls r0, 24
	cmp r0, 0
	bne _080A8EAA
	movs r1, 0x1
_080A8EAA:
	strh r1, [r5, 0x16]
_080A8EAC:
	ldr r0, _080A8EF4 @ =gTasks
	mov r2, r8
	adds r1, r2, r7
	lsls r1, 3
	adds r4, r1, r0
	movs r3, 0x16
	ldrsh r0, [r4, r3]
	cmp r0, 0
	beq _080A8ED8
	bl sub_8076BE0
	lsls r0, 24
	cmp r0, 0
	bne _080A8ED8
	movs r1, 0xE
	ldrsh r0, [r4, r1]
	negs r0, r0
	strh r0, [r4, 0xE]
	movs r2, 0x10
	ldrsh r0, [r4, r2]
	negs r0, r0
	strh r0, [r4, 0x10]
_080A8ED8:
	ldr r0, _080A8EF4 @ =gTasks
	mov r3, r8
	adds r1, r3, r7
	lsls r1, 3
	adds r1, r0
	ldr r0, _080A8EF8 @ =sub_80A8FD8
	str r0, [r1]
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080A8EF0: .4byte gUnknown_0202F7C9
_080A8EF4: .4byte gTasks
_080A8EF8: .4byte sub_80A8FD8
	thumb_func_end sub_80A8E04

	thumb_func_start sub_80A8EFC
sub_80A8EFC: @ 80A8EFC
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	lsls r0, 24
	lsrs r5, r0, 24
	ldr r4, _080A8F38 @ =gUnknown_03004B00
	ldrb r0, [r4, 0x4]
	bl obj_id_for_side_relative_to_move
	lsls r0, 24
	lsrs r0, 24
	mov r8, r0
	movs r1, 0
	bl sub_8078E70
	ldr r1, _080A8F3C @ =gTasks
	lsls r0, r5, 2
	adds r0, r5
	lsls r0, 3
	adds r0, r1
	movs r1, 0
	strh r1, [r0, 0xA]
	ldrh r1, [r4]
	strh r1, [r0, 0xC]
	movs r1, 0x4
	ldrsh r0, [r4, r1]
	cmp r0, 0
	bne _080A8F44
	ldr r0, _080A8F40 @ =gUnknown_0202F7C8
	b _080A8F46
	.align 2, 0
_080A8F38: .4byte gUnknown_03004B00
_080A8F3C: .4byte gTasks
_080A8F40: .4byte gUnknown_0202F7C8
_080A8F44:
	ldr r0, _080A8F74 @ =gUnknown_0202F7C9
_080A8F46:
	ldrb r0, [r0]
	bl battle_side_get_owner
	lsls r0, 24
	cmp r0, 0
	beq _080A8F58
	ldrh r0, [r4, 0x2]
	negs r0, r0
	strh r0, [r4, 0x2]
_080A8F58:
	ldr r0, _080A8F78 @ =gUnknown_03004B00
	movs r2, 0x6
	ldrsh r1, [r0, r2]
	adds r6, r0, 0
	cmp r1, 0x1
	beq _080A8F80
	ldr r2, _080A8F7C @ =gTasks
	lsls r3, r5, 2
	adds r0, r3, r5
	lsls r0, 3
	adds r0, r2
	movs r1, 0
	strh r1, [r0, 0xE]
	b _080A8F9A
	.align 2, 0
_080A8F74: .4byte gUnknown_0202F7C9
_080A8F78: .4byte gUnknown_03004B00
_080A8F7C: .4byte gTasks
_080A8F80:
	ldr r3, _080A8FD0 @ =gTasks
	lsls r4, r5, 2
	adds r0, r4, r5
	lsls r0, 3
	adds r0, r3
	ldrh r2, [r6]
	ldrh r1, [r6, 0x2]
	adds r7, r2, 0
	muls r7, r1
	adds r1, r7, 0
	strh r1, [r0, 0xE]
	adds r2, r3, 0
	adds r3, r4, 0
_080A8F9A:
	adds r1, r3, r5
	lsls r1, 3
	adds r1, r2
	ldrh r0, [r6, 0x2]
	strh r0, [r1, 0x10]
	mov r0, r8
	strh r0, [r1, 0x12]
	ldrh r0, [r6, 0x6]
	strh r0, [r1, 0x14]
	movs r0, 0x1
	strh r0, [r1, 0x16]
	movs r2, 0xE
	ldrsh r0, [r1, r2]
	negs r0, r0
	strh r0, [r1, 0xE]
	movs r7, 0x10
	ldrsh r0, [r1, r7]
	negs r0, r0
	strh r0, [r1, 0x10]
	ldr r0, _080A8FD4 @ =sub_80A8FD8
	str r0, [r1]
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080A8FD0: .4byte gTasks
_080A8FD4: .4byte sub_80A8FD8
	thumb_func_end sub_80A8EFC

	thumb_func_start sub_80A8FD8
sub_80A8FD8: @ 80A8FD8
	push {r4,r5,lr}
	lsls r0, 24
	lsrs r5, r0, 24
	ldr r1, _080A9030 @ =gTasks
	lsls r0, r5, 2
	adds r0, r5
	lsls r0, 3
	adds r4, r0, r1
	ldrh r0, [r4, 0x10]
	ldrh r1, [r4, 0xE]
	adds r0, r1
	strh r0, [r4, 0xE]
	ldrb r0, [r4, 0x12]
	movs r2, 0x80
	lsls r2, 1
	ldrh r3, [r4, 0xE]
	adds r1, r2, 0
	bl obj_id_set_rotscale
	movs r2, 0x16
	ldrsh r0, [r4, r2]
	cmp r0, 0
	beq _080A900C
	ldrb r0, [r4, 0x12]
	bl sub_8078F9C
_080A900C:
	ldrh r0, [r4, 0xA]
	adds r0, 0x1
	strh r0, [r4, 0xA]
	lsls r0, 16
	asrs r0, 16
	movs r2, 0xC
	ldrsh r1, [r4, r2]
	cmp r0, r1
	blt _080A9052
	movs r1, 0x14
	ldrsh r0, [r4, r1]
	cmp r0, 0x1
	beq _080A9034
	cmp r0, 0x1
	ble _080A903A
	cmp r0, 0x2
	beq _080A9042
	b _080A903A
	.align 2, 0
_080A9030: .4byte gTasks
_080A9034:
	ldrb r0, [r4, 0x12]
	bl sub_8078F40
_080A903A:
	adds r0, r5, 0
	bl move_anim_task_del
	b _080A9052
_080A9042:
	movs r0, 0
	strh r0, [r4, 0xA]
	movs r2, 0x10
	ldrsh r0, [r4, r2]
	negs r0, r0
	strh r0, [r4, 0x10]
	movs r0, 0x1
	strh r0, [r4, 0x14]
_080A9052:
	pop {r4,r5}
	pop {r0}
	bx r0
	thumb_func_end sub_80A8FD8

	thumb_func_start sub_80A9058
sub_80A9058: @ 80A9058
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	lsls r0, 24
	lsrs r7, r0, 24
	ldr r0, _080A9084 @ =gUnknown_03004B00
	movs r2, 0
	ldrsh r1, [r0, r2]
	mov r8, r0
	cmp r1, 0
	bne _080A9090
	ldr r4, _080A9088 @ =gTasks
	lsls r5, r7, 2
	adds r0, r5, r7
	lsls r0, 3
	adds r6, r0, r4
	ldr r0, _080A908C @ =gUnknown_0202F7BC
	ldrh r0, [r0]
	movs r1, 0xC
	bl __udivsi3
	b _080A90A4
	.align 2, 0
_080A9084: .4byte gUnknown_03004B00
_080A9088: .4byte gTasks
_080A908C: .4byte gUnknown_0202F7BC
_080A9090:
	ldr r4, _080A912C @ =gTasks
	lsls r5, r7, 2
	adds r0, r5, r7
	lsls r0, 3
	adds r6, r0, r4
	ldr r0, _080A9130 @ =gUnknown_0202F7B8
	ldr r0, [r0]
	movs r1, 0xC
	bl __divsi3
_080A90A4:
	strh r0, [r6, 0x26]
	lsls r0, 16
	adds r1, r4, 0
	cmp r0, 0
	bgt _080A90B2
	movs r0, 0x1
	strh r0, [r6, 0x26]
_080A90B2:
	movs r2, 0x26
	ldrsh r0, [r6, r2]
	cmp r0, 0x10
	ble _080A90BE
	movs r0, 0x10
	strh r0, [r6, 0x26]
_080A90BE:
	adds r4, r5, r7
	lsls r4, 3
	adds r4, r1
	movs r0, 0x26
	ldrsh r1, [r4, r0]
	lsrs r0, r1, 31
	adds r1, r0
	asrs r1, 1
	movs r5, 0
	strh r1, [r4, 0x24]
	ldrh r2, [r4, 0x26]
	movs r0, 0x1
	ands r0, r2
	adds r1, r0
	strh r1, [r4, 0x22]
	strh r5, [r4, 0x20]
	mov r1, r8
	ldrh r0, [r1, 0x6]
	strh r0, [r4, 0x1C]
	ldrh r0, [r1, 0x8]
	strh r0, [r4, 0x1E]
	movs r0, 0x1
	bl obj_id_for_side_relative_to_move
	lsls r0, 24
	lsrs r0, 24
	strh r0, [r4, 0x16]
	ldr r2, _080A9134 @ =gSprites
	movs r0, 0x16
	ldrsh r1, [r4, r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r2
	ldrh r0, [r0, 0x24]
	strh r0, [r4, 0x18]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r2
	ldrh r0, [r0, 0x26]
	strh r0, [r4, 0x1A]
	strh r5, [r4, 0x8]
	mov r1, r8
	ldrh r0, [r1, 0x2]
	strh r0, [r4, 0xA]
	ldrh r0, [r1, 0x4]
	strh r0, [r4, 0xC]
	ldr r0, _080A9138 @ =sub_80A913C
	str r0, [r4]
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080A912C: .4byte gTasks
_080A9130: .4byte gUnknown_0202F7B8
_080A9134: .4byte gSprites
_080A9138: .4byte sub_80A913C
	thumb_func_end sub_80A9058

	thumb_func_start sub_80A913C
sub_80A913C: @ 80A913C
	push {r4,r5,lr}
	lsls r0, 24
	lsrs r5, r0, 24
	lsls r0, r5, 2
	adds r0, r5
	lsls r0, 3
	ldr r1, _080A9190 @ =gTasks
	adds r3, r0, r1
	ldrh r0, [r3, 0x8]
	adds r0, 0x1
	strh r0, [r3, 0x8]
	lsls r0, 16
	asrs r0, 16
	movs r2, 0xA
	ldrsh r1, [r3, r2]
	cmp r0, r1
	ble _080A921A
	movs r0, 0
	strh r0, [r3, 0x8]
	ldrh r0, [r3, 0x20]
	adds r1, r0, 0x1
	movs r0, 0x1
	ands r1, r0
	strh r1, [r3, 0x20]
	movs r2, 0x1C
	ldrsh r0, [r3, r2]
	cmp r0, 0
	beq _080A91AE
	cmp r1, 0
	beq _080A9198
	ldr r2, _080A9194 @ =gSprites
	movs r0, 0x16
	ldrsh r1, [r3, r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r2
	ldrh r1, [r3, 0x22]
	ldrh r2, [r3, 0x18]
	adds r1, r2
	b _080A91AC
	.align 2, 0
_080A9190: .4byte gTasks
_080A9194: .4byte gSprites
_080A9198:
	ldr r2, _080A91D4 @ =gSprites
	movs r0, 0x16
	ldrsh r1, [r3, r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r2
	ldrh r1, [r3, 0x18]
	ldrh r2, [r3, 0x24]
	subs r1, r2
_080A91AC:
	strh r1, [r0, 0x24]
_080A91AE:
	movs r1, 0x1E
	ldrsh r0, [r3, r1]
	cmp r0, 0
	beq _080A91E8
	movs r2, 0x20
	ldrsh r4, [r3, r2]
	cmp r4, 0
	beq _080A91D8
	ldr r2, _080A91D4 @ =gSprites
	movs r0, 0x16
	ldrsh r1, [r3, r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r2
	ldrh r1, [r3, 0x26]
	strh r1, [r0, 0x26]
	b _080A91E8
	.align 2, 0
_080A91D4: .4byte gSprites
_080A91D8:
	ldr r2, _080A9220 @ =gSprites
	movs r0, 0x16
	ldrsh r1, [r3, r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r2
	strh r4, [r0, 0x26]
_080A91E8:
	ldrh r0, [r3, 0xC]
	subs r0, 0x1
	strh r0, [r3, 0xC]
	lsls r0, 16
	asrs r4, r0, 16
	cmp r4, 0
	bne _080A921A
	ldr r2, _080A9220 @ =gSprites
	movs r0, 0x16
	ldrsh r1, [r3, r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r2
	strh r4, [r0, 0x24]
	movs r0, 0x16
	ldrsh r1, [r3, r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r2
	strh r4, [r0, 0x26]
	adds r0, r5, 0
	bl move_anim_task_del
_080A921A:
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080A9220: .4byte gSprites
	thumb_func_end sub_80A913C

	.align 2, 0 @ Don't pad with nop.
