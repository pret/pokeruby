	.include "constants/gba_constants.inc"
	.include "constants/species_constants.inc"
	.include "asm/macros.inc"

	.syntax unified

	.text

.ifndef NONMATCHING
	thumb_func_start sub_805F3EC
sub_805F3EC: @ 805F3EC
	movs r0, 0
	bx lr
	thumb_func_end sub_805F3EC

	thumb_func_start sub_805F3F0
sub_805F3F0: @ 805F3F0
	push {r4,r5,lr}
	adds r4, r0, 0
	adds r5, r1, 0
	lsls r2, 24
	lsrs r2, 24
	ldr r1, _0805F434 @ =gUnknown_0836DC09
	ldrb r0, [r4, 0x6]
	adds r0, r1
	ldrb r0, [r0]
	adds r1, r4, 0
	adds r1, 0x21
	ldrb r1, [r1]
	bl state_to_direction
	bl GetFaceDirectionAnimId
	adds r2, r0, 0
	lsls r2, 24
	lsrs r2, 24
	adds r0, r4, 0
	adds r1, r5, 0
	bl FieldObjectSetRegularAnim
	ldrb r0, [r4]
	movs r1, 0x2
	orrs r0, r1
	strb r0, [r4]
	movs r0, 0x2
	strh r0, [r5, 0x30]
	movs r0, 0x1
	pop {r4,r5}
	pop {r1}
	bx r1
	.align 2, 0
_0805F434: .4byte gUnknown_0836DC09
	thumb_func_end sub_805F3F0

	thumb_func_start sub_805F438
sub_805F438: @ 805F438
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	sub sp, 0x4
	adds r4, r0, 0
	adds r7, r1, 0
	mov r8, r3
	lsls r2, 24
	lsrs r6, r2, 24
	ldr r1, _0805F4EC @ =gUnknown_0836DC09
	ldrb r0, [r4, 0x6]
	adds r0, r1
	ldrb r0, [r0]
	adds r1, r4, 0
	adds r1, 0x21
	ldrb r1, [r1]
	adds r2, r6, 0
	bl state_to_direction
	adds r6, r0, 0
	mov r5, sp
	adds r5, 0x2
	adds r0, r4, 0
	adds r1, r6, 0
	mov r2, sp
	adds r3, r5, 0
	bl FieldObjectMoveDestCoords
	adds r0, r6, 0
	bl GetGoSpeed0AnimId
	adds r2, r0, 0
	lsls r2, 24
	lsrs r2, 24
	adds r0, r4, 0
	adds r1, r7, 0
	bl FieldObjectSetRegularAnim
	mov r0, sp
	movs r2, 0
	ldrsh r1, [r0, r2]
	movs r0, 0
	ldrsh r2, [r5, r0]
	adds r0, r4, 0
	adds r3, r6, 0
	bl npc_block_way
	lsls r0, 24
	cmp r0, 0
	bne _0805F4BE
	mov r1, r8
	cmp r1, 0
	beq _0805F4D2
	mov r0, sp
	movs r2, 0
	ldrsh r0, [r0, r2]
	movs r2, 0
	ldrsh r1, [r5, r2]
	bl MapGridGetMetatileBehaviorAt
	lsls r0, 24
	lsrs r0, 24
	bl _call_via_r8
	lsls r0, 24
	cmp r0, 0
	bne _0805F4D2
_0805F4BE:
	adds r0, r6, 0
	bl GetFaceDirectionAnimId
	adds r2, r0, 0
	lsls r2, 24
	lsrs r2, 24
	adds r0, r4, 0
	adds r1, r7, 0
	bl FieldObjectSetRegularAnim
_0805F4D2:
	ldrb r0, [r4]
	movs r1, 0x2
	orrs r0, r1
	strb r0, [r4]
	movs r0, 0x2
	strh r0, [r7, 0x30]
	movs r0, 0x1
	add sp, 0x4
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r1}
	bx r1
	.align 2, 0
_0805F4EC: .4byte gUnknown_0836DC09
	thumb_func_end sub_805F438
.endif

	thumb_func_start sub_805F4F0
sub_805F4F0: @ 805F4F0
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	sub sp, 0x4
	adds r4, r0, 0
	adds r7, r1, 0
	mov r8, r3
	lsls r2, 24
	lsrs r6, r2, 24
	ldr r1, _0805F5A4 @ =gUnknown_0836DC09
	ldrb r0, [r4, 0x6]
	adds r0, r1
	ldrb r0, [r0]
	adds r1, r4, 0
	adds r1, 0x21
	ldrb r1, [r1]
	adds r2, r6, 0
	bl state_to_direction
	adds r6, r0, 0
	mov r5, sp
	adds r5, 0x2
	adds r0, r4, 0
	adds r1, r6, 0
	mov r2, sp
	adds r3, r5, 0
	bl FieldObjectMoveDestCoords
	adds r0, r6, 0
	bl sub_8060744
	adds r2, r0, 0
	lsls r2, 24
	lsrs r2, 24
	adds r0, r4, 0
	adds r1, r7, 0
	bl FieldObjectSetRegularAnim
	mov r0, sp
	movs r2, 0
	ldrsh r1, [r0, r2]
	movs r0, 0
	ldrsh r2, [r5, r0]
	adds r0, r4, 0
	adds r3, r6, 0
	bl npc_block_way
	lsls r0, 24
	cmp r0, 0
	bne _0805F576
	mov r1, r8
	cmp r1, 0
	beq _0805F58A
	mov r0, sp
	movs r2, 0
	ldrsh r0, [r0, r2]
	movs r2, 0
	ldrsh r1, [r5, r2]
	bl MapGridGetMetatileBehaviorAt
	lsls r0, 24
	lsrs r0, 24
	bl _call_via_r8
	lsls r0, 24
	cmp r0, 0
	bne _0805F58A
_0805F576:
	adds r0, r6, 0
	bl GetFaceDirectionAnimId
	adds r2, r0, 0
	lsls r2, 24
	lsrs r2, 24
	adds r0, r4, 0
	adds r1, r7, 0
	bl FieldObjectSetRegularAnim
_0805F58A:
	ldrb r0, [r4]
	movs r1, 0x2
	orrs r0, r1
	strb r0, [r4]
	movs r0, 0x2
	strh r0, [r7, 0x30]
	movs r0, 0x1
	add sp, 0x4
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r1}
	bx r1
	.align 2, 0
_0805F5A4: .4byte gUnknown_0836DC09
	thumb_func_end sub_805F4F0

	thumb_func_start sub_805F5A8
sub_805F5A8: @ 805F5A8
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	sub sp, 0x4
	adds r4, r0, 0
	adds r7, r1, 0
	mov r8, r3
	lsls r2, 24
	lsrs r6, r2, 24
	ldr r1, _0805F65C @ =gUnknown_0836DC09
	ldrb r0, [r4, 0x6]
	adds r0, r1
	ldrb r0, [r0]
	adds r1, r4, 0
	adds r1, 0x21
	ldrb r1, [r1]
	adds r2, r6, 0
	bl state_to_direction
	adds r6, r0, 0
	mov r5, sp
	adds r5, 0x2
	adds r0, r4, 0
	adds r1, r6, 0
	mov r2, sp
	adds r3, r5, 0
	bl FieldObjectMoveDestCoords
	adds r0, r6, 0
	bl sub_806079C
	adds r2, r0, 0
	lsls r2, 24
	lsrs r2, 24
	adds r0, r4, 0
	adds r1, r7, 0
	bl FieldObjectSetRegularAnim
	mov r0, sp
	movs r2, 0
	ldrsh r1, [r0, r2]
	movs r0, 0
	ldrsh r2, [r5, r0]
	adds r0, r4, 0
	adds r3, r6, 0
	bl npc_block_way
	lsls r0, 24
	cmp r0, 0
	bne _0805F62E
	mov r1, r8
	cmp r1, 0
	beq _0805F642
	mov r0, sp
	movs r2, 0
	ldrsh r0, [r0, r2]
	movs r2, 0
	ldrsh r1, [r5, r2]
	bl MapGridGetMetatileBehaviorAt
	lsls r0, 24
	lsrs r0, 24
	bl _call_via_r8
	lsls r0, 24
	cmp r0, 0
	bne _0805F642
_0805F62E:
	adds r0, r6, 0
	bl GetFaceDirectionAnimId
	adds r2, r0, 0
	lsls r2, 24
	lsrs r2, 24
	adds r0, r4, 0
	adds r1, r7, 0
	bl FieldObjectSetRegularAnim
_0805F642:
	ldrb r0, [r4]
	movs r1, 0x2
	orrs r0, r1
	strb r0, [r4]
	movs r0, 0x2
	strh r0, [r7, 0x30]
	movs r0, 0x1
	add sp, 0x4
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r1}
	bx r1
	.align 2, 0
_0805F65C: .4byte gUnknown_0836DC09
	thumb_func_end sub_805F5A8

	thumb_func_start sub_805F660
sub_805F660: @ 805F660
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	sub sp, 0x4
	adds r4, r0, 0
	adds r7, r1, 0
	mov r8, r3
	lsls r2, 24
	lsrs r6, r2, 24
	ldr r1, _0805F714 @ =gUnknown_0836DC09
	ldrb r0, [r4, 0x6]
	adds r0, r1
	ldrb r0, [r0]
	adds r1, r4, 0
	adds r1, 0x21
	ldrb r1, [r1]
	adds r2, r6, 0
	bl state_to_direction
	adds r6, r0, 0
	mov r5, sp
	adds r5, 0x2
	adds r0, r4, 0
	adds r1, r6, 0
	mov r2, sp
	adds r3, r5, 0
	bl FieldObjectMoveDestCoords
	adds r0, r6, 0
	bl sub_80607C8
	adds r2, r0, 0
	lsls r2, 24
	lsrs r2, 24
	adds r0, r4, 0
	adds r1, r7, 0
	bl FieldObjectSetRegularAnim
	mov r0, sp
	movs r2, 0
	ldrsh r1, [r0, r2]
	movs r0, 0
	ldrsh r2, [r5, r0]
	adds r0, r4, 0
	adds r3, r6, 0
	bl npc_block_way
	lsls r0, 24
	cmp r0, 0
	bne _0805F6E6
	mov r1, r8
	cmp r1, 0
	beq _0805F6FA
	mov r0, sp
	movs r2, 0
	ldrsh r0, [r0, r2]
	movs r2, 0
	ldrsh r1, [r5, r2]
	bl MapGridGetMetatileBehaviorAt
	lsls r0, 24
	lsrs r0, 24
	bl _call_via_r8
	lsls r0, 24
	cmp r0, 0
	bne _0805F6FA
_0805F6E6:
	adds r0, r6, 0
	bl GetFaceDirectionAnimId
	adds r2, r0, 0
	lsls r2, 24
	lsrs r2, 24
	adds r0, r4, 0
	adds r1, r7, 0
	bl FieldObjectSetRegularAnim
_0805F6FA:
	ldrb r0, [r4]
	movs r1, 0x2
	orrs r0, r1
	strb r0, [r4]
	movs r0, 0x2
	strh r0, [r7, 0x30]
	movs r0, 0x1
	add sp, 0x4
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r1}
	bx r1
	.align 2, 0
_0805F714: .4byte gUnknown_0836DC09
	thumb_func_end sub_805F660

	thumb_func_start cph_IM_DIFFERENT
cph_IM_DIFFERENT: @ 805F718
	push {r4,r5,lr}
	adds r4, r0, 0
	adds r5, r1, 0
	lsls r2, 24
	lsrs r2, 24
	ldr r1, _0805F75C @ =gUnknown_0836DC09
	ldrb r0, [r4, 0x6]
	adds r0, r1
	ldrb r0, [r0]
	adds r1, r4, 0
	adds r1, 0x21
	ldrb r1, [r1]
	bl state_to_direction
	bl sub_806084C
	adds r2, r0, 0
	lsls r2, 24
	lsrs r2, 24
	adds r0, r4, 0
	adds r1, r5, 0
	bl FieldObjectSetRegularAnim
	ldrb r0, [r4]
	movs r1, 0x2
	orrs r0, r1
	strb r0, [r4]
	movs r0, 0x2
	strh r0, [r5, 0x30]
	movs r0, 0x1
	pop {r4,r5}
	pop {r1}
	bx r1
	.align 2, 0
_0805F75C: .4byte gUnknown_0836DC09
	thumb_func_end cph_IM_DIFFERENT

	thumb_func_start sub_805F760
sub_805F760: @ 805F760
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	sub sp, 0x4
	adds r4, r0, 0
	adds r7, r1, 0
	mov r8, r3
	lsls r2, 24
	lsrs r6, r2, 24
	ldr r1, _0805F814 @ =gUnknown_0836DC09
	ldrb r0, [r4, 0x6]
	adds r0, r1
	ldrb r0, [r0]
	adds r1, r4, 0
	adds r1, 0x21
	ldrb r1, [r1]
	adds r2, r6, 0
	bl state_to_direction
	adds r6, r0, 0
	mov r5, sp
	adds r5, 0x2
	adds r0, r4, 0
	adds r1, r6, 0
	mov r2, sp
	adds r3, r5, 0
	bl FieldObjectMoveDestCoords
	adds r0, r6, 0
	bl sub_80608A4
	adds r2, r0, 0
	lsls r2, 24
	lsrs r2, 24
	adds r0, r4, 0
	adds r1, r7, 0
	bl FieldObjectSetRegularAnim
	mov r0, sp
	movs r2, 0
	ldrsh r1, [r0, r2]
	movs r0, 0
	ldrsh r2, [r5, r0]
	adds r0, r4, 0
	adds r3, r6, 0
	bl npc_block_way
	lsls r0, 24
	cmp r0, 0
	bne _0805F7E6
	mov r1, r8
	cmp r1, 0
	beq _0805F7FA
	mov r0, sp
	movs r2, 0
	ldrsh r0, [r0, r2]
	movs r2, 0
	ldrsh r1, [r5, r2]
	bl MapGridGetMetatileBehaviorAt
	lsls r0, 24
	lsrs r0, 24
	bl _call_via_r8
	lsls r0, 24
	cmp r0, 0
	bne _0805F7FA
_0805F7E6:
	adds r0, r6, 0
	bl GetFaceDirectionAnimId
	adds r2, r0, 0
	lsls r2, 24
	lsrs r2, 24
	adds r0, r4, 0
	adds r1, r7, 0
	bl FieldObjectSetRegularAnim
_0805F7FA:
	ldrb r0, [r4]
	movs r1, 0x2
	orrs r0, r1
	strb r0, [r4]
	movs r0, 0x2
	strh r0, [r7, 0x30]
	movs r0, 0x1
	add sp, 0x4
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r1}
	bx r1
	.align 2, 0
_0805F814: .4byte gUnknown_0836DC09
	thumb_func_end sub_805F760

	thumb_func_start oac_hopping
oac_hopping: @ 805F818
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	sub sp, 0x8
	adds r4, r0, 0
	adds r7, r1, 0
	mov r8, r3
	lsls r2, 24
	lsrs r6, r2, 24
	ldr r1, _0805F8DC @ =gUnknown_0836DC09
	ldrb r0, [r4, 0x6]
	adds r0, r1
	ldrb r0, [r0]
	adds r1, r4, 0
	adds r1, 0x21
	ldrb r1, [r1]
	adds r2, r6, 0
	bl state_to_direction
	adds r6, r0, 0
	ldrh r1, [r4, 0x10]
	add r0, sp, 0x4
	strh r1, [r0]
	ldrh r0, [r4, 0x12]
	mov r5, sp
	adds r5, 0x6
	strh r0, [r5]
	movs r0, 0x2
	str r0, [sp]
	adds r0, r6, 0
	add r1, sp, 0x4
	adds r2, r5, 0
	movs r3, 0x2
	bl sub_8060320
	adds r0, r6, 0
	bl GetJumpLedgeAnimId
	adds r2, r0, 0
	lsls r2, 24
	lsrs r2, 24
	adds r0, r4, 0
	adds r1, r7, 0
	bl FieldObjectSetRegularAnim
	add r0, sp, 0x4
	movs r2, 0
	ldrsh r1, [r0, r2]
	movs r0, 0
	ldrsh r2, [r5, r0]
	adds r0, r4, 0
	adds r3, r6, 0
	bl npc_block_way
	lsls r0, 24
	cmp r0, 0
	bne _0805F8AC
	mov r1, r8
	cmp r1, 0
	beq _0805F8C0
	add r0, sp, 0x4
	movs r2, 0
	ldrsh r0, [r0, r2]
	movs r2, 0
	ldrsh r1, [r5, r2]
	bl MapGridGetMetatileBehaviorAt
	lsls r0, 24
	lsrs r0, 24
	bl _call_via_r8
	lsls r0, 24
	cmp r0, 0
	bne _0805F8C0
_0805F8AC:
	adds r0, r6, 0
	bl GetFaceDirectionAnimId
	adds r2, r0, 0
	lsls r2, 24
	lsrs r2, 24
	adds r0, r4, 0
	adds r1, r7, 0
	bl FieldObjectSetRegularAnim
_0805F8C0:
	ldrb r0, [r4]
	movs r1, 0x2
	orrs r0, r1
	strb r0, [r4]
	movs r0, 0x2
	strh r0, [r7, 0x30]
	movs r0, 0x1
	add sp, 0x8
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r1}
	bx r1
	.align 2, 0
_0805F8DC: .4byte gUnknown_0836DC09
	thumb_func_end oac_hopping

	.section .text_805fd18

	thumb_func_start sub_80625B0
sub_80625B0: @ 80625B0
	push {lr}
	ldr r3, _080625C4 @ =gUnknown_0836DC09
	ldrb r2, [r0, 0x6]
	adds r2, r3
	ldrb r2, [r2]
	bl an_look_any
	movs r0, 0x1
	pop {r1}
	bx r1
	.align 2, 0
_080625C4: .4byte gUnknown_0836DC09
	thumb_func_end sub_80625B0

	thumb_func_start sub_80625C8
sub_80625C8: @ 80625C8
	push {lr}
	movs r2, 0x1
	movs r3, 0x14
	bl npc_set_direction_and_anim__an_proceed
	movs r0, 0
	pop {r1}
	bx r1
	thumb_func_end sub_80625C8

	thumb_func_start sub_80625D8
sub_80625D8: @ 80625D8
	ldrb r3, [r0, 0x3]
	movs r2, 0x3
	negs r2, r2
	ands r2, r3
	strb r2, [r0, 0x3]
	movs r0, 0x1
	strh r0, [r1, 0x32]
	bx lr
	thumb_func_end sub_80625D8

	thumb_func_start sub_80625E8
sub_80625E8: @ 80625E8
	ldrb r2, [r0, 0x3]
	movs r3, 0x2
	orrs r2, r3
	strb r2, [r0, 0x3]
	movs r0, 0x1
	strh r0, [r1, 0x32]
	bx lr
	thumb_func_end sub_80625E8

	thumb_func_start sub_80625F8
sub_80625F8: @ 80625F8
	ldrb r2, [r0, 0x1]
	movs r3, 0x10
	orrs r2, r3
	strb r2, [r0, 0x1]
	movs r0, 0x1
	strh r0, [r1, 0x32]
	bx lr
	thumb_func_end sub_80625F8

	thumb_func_start sub_8062608
sub_8062608: @ 8062608
	push {r4,r5,lr}
	adds r4, r0, 0
	adds r5, r1, 0
	ldrb r0, [r4, 0x5]
	bl GetFieldObjectGraphicsInfo
	ldrb r1, [r0, 0xC]
	lsls r1, 25
	lsrs r1, 31
	lsls r1, 4
	ldrb r2, [r4, 0x1]
	movs r0, 0x11
	negs r0, r0
	ands r0, r2
	orrs r0, r1
	strb r0, [r4, 0x1]
	movs r0, 0x1
	strh r0, [r5, 0x32]
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end sub_8062608

	thumb_func_start sub_8062634
sub_8062634: @ 8062634
	ldrb r2, [r0, 0x1]
	movs r3, 0x20
	orrs r2, r3
	strb r2, [r0, 0x1]
	movs r0, 0x1
	strh r0, [r1, 0x32]
	bx lr
	thumb_func_end sub_8062634

	thumb_func_start sub_8062644
sub_8062644: @ 8062644
	ldrb r3, [r0, 0x1]
	movs r2, 0x21
	negs r2, r2
	ands r2, r3
	strb r2, [r0, 0x1]
	movs r0, 0x1
	strh r0, [r1, 0x32]
	bx lr
	thumb_func_end sub_8062644

	thumb_func_start do_exclamation_mark_bubble_1
do_exclamation_mark_bubble_1: @ 8062654
	push {r4,lr}
	adds r4, r1, 0
	ldr r1, _08062674 @ =gUnknown_0202FF84
	adds r2, r1, 0x4
	adds r3, r1, 0
	adds r3, 0x8
	bl FieldObjectGetLocalIdAndMap
	movs r0, 0
	bl FieldEffectStart
	movs r0, 0x1
	strh r0, [r4, 0x32]
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_08062674: .4byte gUnknown_0202FF84
	thumb_func_end do_exclamation_mark_bubble_1

	thumb_func_start do_exclamation_mark_bubble_2
do_exclamation_mark_bubble_2: @ 8062678
	push {r4,lr}
	adds r4, r1, 0
	ldr r1, _08062698 @ =gUnknown_0202FF84
	adds r2, r1, 0x4
	adds r3, r1, 0
	adds r3, 0x8
	bl FieldObjectGetLocalIdAndMap
	movs r0, 0x21
	bl FieldEffectStart
	movs r0, 0x1
	strh r0, [r4, 0x32]
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_08062698: .4byte gUnknown_0202FF84
	thumb_func_end do_exclamation_mark_bubble_2

	thumb_func_start do_heart_bubble
do_heart_bubble: @ 806269C
	push {r4,lr}
	adds r4, r1, 0
	ldr r1, _080626BC @ =gUnknown_0202FF84
	adds r2, r1, 0x4
	adds r3, r1, 0
	adds r3, 0x8
	bl FieldObjectGetLocalIdAndMap
	movs r0, 0x2E
	bl FieldEffectStart
	movs r0, 0x1
	strh r0, [r4, 0x32]
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_080626BC: .4byte gUnknown_0202FF84
	thumb_func_end do_heart_bubble

	thumb_func_start sub_80626C0
sub_80626C0: @ 80626C0
	push {r4,r5,lr}
	adds r4, r0, 0
	adds r5, r1, 0
	ldrb r0, [r4, 0x6]
	cmp r0, 0x3F
	bne _080626D6
	adds r0, r4, 0
	bl sub_8084794
	movs r0, 0
	b _080626FE
_080626D6:
	subs r0, 0x39
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bhi _080626F8
	adds r0, r4, 0
	bl sub_812869C
	movs r0, 0x1
	strh r0, [r5, 0x32]
	adds r0, r4, 0
	adds r1, r5, 0
	bl sub_8062704
	lsls r0, 24
	lsrs r0, 24
	b _080626FE
_080626F8:
	movs r0, 0x2
	strh r0, [r5, 0x32]
	movs r0, 0x1
_080626FE:
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end sub_80626C0

	thumb_func_start sub_8062704
sub_8062704: @ 8062704
	push {r4,lr}
	adds r4, r1, 0
	bl sub_81286C4
	lsls r0, 24
	cmp r0, 0
	bne _08062716
	movs r0, 0
	b _0806271C
_08062716:
	movs r0, 0x2
	strh r0, [r4, 0x32]
	movs r0, 0x1
_0806271C:
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end sub_8062704

	thumb_func_start sub_8062724
sub_8062724: @ 8062724
	push {r4,lr}
	adds r4, r1, 0
	adds r0, r4, 0
	movs r1, 0x1
	movs r2, 0
	bl obj_anim_image_set_and_seek
	movs r0, 0x1
	strh r0, [r4, 0x32]
	movs r0, 0
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end sub_8062724

	thumb_func_start sub_8062740
sub_8062740: @ 8062740
	push {r4,lr}
	adds r4, r1, 0
	adds r0, r4, 0
	bl sub_8064864
	lsls r0, 24
	cmp r0, 0
	beq _0806275C
	adds r0, r4, 0
	movs r1, 0x20
	bl sub_8064820
	movs r0, 0x2
	strh r0, [r4, 0x32]
_0806275C:
	movs r0, 0
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end sub_8062740

	thumb_func_start sub_8062764
sub_8062764: @ 8062764
	push {r4,r5,lr}
	adds r4, r0, 0
	adds r5, r1, 0
	ldrb r2, [r4, 0x1]
	lsls r1, r2, 26
	lsrs r1, 31
	movs r0, 0x1
	eors r1, r0
	lsls r1, 5
	subs r0, 0x22
	ands r0, r2
	orrs r0, r1
	strb r0, [r4, 0x1]
	adds r0, r5, 0
	bl sub_8064824
	lsls r0, 24
	cmp r0, 0
	beq _08062796
	ldrb r0, [r4, 0x1]
	movs r1, 0x20
	orrs r0, r1
	strb r0, [r4, 0x1]
	movs r0, 0x3
	strh r0, [r5, 0x32]
_08062796:
	movs r0, 0
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end sub_8062764

	thumb_func_start sub_80627A0
sub_80627A0: @ 80627A0
	push {r4,lr}
	adds r4, r1, 0
	adds r0, r4, 0
	movs r1, 0x1
	movs r2, 0
	bl obj_anim_image_set_and_seek
	movs r0, 0x1
	strh r0, [r4, 0x32]
	movs r0, 0
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end sub_80627A0

	thumb_func_start sub_80627BC
sub_80627BC: @ 80627BC
	push {r4,lr}
	adds r4, r1, 0
	adds r0, r4, 0
	bl sub_8064864
	lsls r0, 24
	cmp r0, 0
	beq _080627D8
	adds r0, r4, 0
	movs r1, 0x20
	bl sub_8064820
	movs r0, 0x2
	strh r0, [r4, 0x32]
_080627D8:
	movs r0, 0
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end sub_80627BC

	thumb_func_start sub_80627E0
sub_80627E0: @ 80627E0
	push {r4,r5,lr}
	adds r4, r0, 0
	adds r5, r1, 0
	ldrb r2, [r4, 0x1]
	lsls r1, r2, 26
	lsrs r1, 31
	movs r0, 0x1
	eors r1, r0
	lsls r1, 5
	subs r0, 0x22
	ands r0, r2
	orrs r0, r1
	strb r0, [r4, 0x1]
	adds r0, r5, 0
	bl sub_8064824
	lsls r0, 24
	cmp r0, 0
	beq _08062812
	ldrb r0, [r4, 0x1]
	movs r1, 0x20
	orrs r0, r1
	strb r0, [r4, 0x1]
	movs r0, 0x3
	strh r0, [r5, 0x32]
_08062812:
	movs r0, 0
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end sub_80627E0

	thumb_func_start sub_806281C
sub_806281C: @ 806281C
	ldrb r2, [r0, 0x3]
	movs r3, 0x4
	orrs r2, r3
	strb r2, [r0, 0x3]
	movs r0, 0x1
	strh r0, [r1, 0x32]
	bx lr
	thumb_func_end sub_806281C

	thumb_func_start sub_806282C
sub_806282C: @ 806282C
	ldrb r3, [r0, 0x3]
	movs r2, 0x5
	negs r2, r2
	ands r2, r3
	strb r2, [r0, 0x3]
	movs r0, 0x1
	strh r0, [r1, 0x32]
	bx lr
	thumb_func_end sub_806282C

	thumb_func_start sub_806283C
sub_806283C: @ 806283C
	push {r4,lr}
	adds r4, r1, 0
	ldrb r0, [r4, 0x1]
	movs r1, 0x3
	orrs r0, r1
	strb r0, [r4, 0x1]
	adds r0, r4, 0
	bl InitSpriteAffineAnim
	adds r2, r4, 0
	adds r2, 0x2C
	ldrb r0, [r2]
	movs r1, 0x80
	orrs r0, r1
	strb r0, [r2]
	adds r4, 0x42
	ldrb r1, [r4]
	movs r0, 0x3F
	ands r0, r1
	strb r0, [r4]
	movs r0, 0x1
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end sub_806283C

	thumb_func_start sub_806286C
sub_806286C: @ 806286C
	push {r4,lr}
	adds r4, r1, 0
	ldrb r0, [r4, 0x3]
	lsls r0, 26
	lsrs r0, 27
	bl FreeOamMatrix
	ldrb r0, [r4, 0x1]
	movs r1, 0x4
	negs r1, r1
	ands r1, r0
	strb r1, [r4, 0x1]
	lsrs r1, 6
	ldrb r2, [r4, 0x3]
	lsrs r2, 6
	movs r3, 0
	adds r0, r4, 0
	bl CalcCenterToCornerVec
	movs r0, 0x1
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end sub_806286C

	thumb_func_start sub_806289C
sub_806289C: @ 806289C
	push {r4,r5,lr}
	adds r5, r0, 0
	adds r4, r1, 0
	movs r2, 0x1
	bl sub_8060ED8
	adds r2, r4, 0
	adds r2, 0x2C
	ldrb r1, [r2]
	movs r0, 0x7F
	ands r0, r1
	strb r0, [r2]
	adds r0, r4, 0
	movs r1, 0
	bl StartSpriteAffineAnimIfDifferent
	adds r0, r5, 0
	adds r1, r4, 0
	bl sub_80628D0
	lsls r0, 24
	lsrs r0, 24
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end sub_806289C

	thumb_func_start sub_80628D0
sub_80628D0: @ 80628D0
	push {r4,lr}
	adds r4, r1, 0
	bl an_walk_any_2
	lsls r0, 24
	cmp r0, 0
	bne _080628E2
	movs r0, 0
	b _080628F4
_080628E2:
	adds r2, r4, 0
	adds r2, 0x2C
	ldrb r0, [r2]
	movs r1, 0x80
	orrs r0, r1
	strb r0, [r2]
	movs r0, 0x2
	strh r0, [r4, 0x32]
	movs r0, 0x1
_080628F4:
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end sub_80628D0

	thumb_func_start sub_80628FC
sub_80628FC: @ 80628FC
	push {r4,r5,lr}
	adds r5, r0, 0
	adds r4, r1, 0
	movs r2, 0x1
	bl sub_8060ED8
	adds r2, r4, 0
	adds r2, 0x2C
	ldrb r1, [r2]
	movs r0, 0x7F
	ands r0, r1
	strb r0, [r2]
	adds r0, r4, 0
	movs r1, 0x1
	bl ChangeSpriteAffineAnimIfDifferent
	adds r0, r5, 0
	adds r1, r4, 0
	bl sub_8062930
	lsls r0, 24
	lsrs r0, 24
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end sub_80628FC

	thumb_func_start sub_8062930
sub_8062930: @ 8062930
	push {r4,lr}
	adds r4, r1, 0
	bl an_walk_any_2
	lsls r0, 24
	cmp r0, 0
	bne _08062942
	movs r0, 0
	b _08062954
_08062942:
	adds r2, r4, 0
	adds r2, 0x2C
	ldrb r0, [r2]
	movs r1, 0x80
	orrs r0, r1
	strb r0, [r2]
	movs r0, 0x2
	strh r0, [r4, 0x32]
	movs r0, 0x1
_08062954:
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end sub_8062930

	thumb_func_start sub_806295C
sub_806295C: @ 806295C
	push {r4-r6,lr}
	adds r5, r0, 0
	adds r6, r1, 0
	lsls r4, r2, 24
	lsrs r4, 24
	adds r1, r4, 0
	bl FieldObjectSetDirection
	adds r0, r5, 0
	bl npc_coords_shift_still
	adds r0, r4, 0
	bl sub_805FDD8
	adds r2, r0, 0
	lsls r2, 24
	lsrs r2, 24
	adds r0, r5, 0
	adds r1, r6, 0
	bl sub_805FE64
	adds r2, r6, 0
	adds r2, 0x2C
	ldrb r0, [r2]
	movs r1, 0x40
	orrs r0, r1
	strb r0, [r2]
	movs r0, 0x1
	strh r0, [r6, 0x32]
	pop {r4-r6}
	pop {r0}
	bx r0
	thumb_func_end sub_806295C

	thumb_func_start sub_806299C
sub_806299C: @ 806299C
	push {lr}
	movs r2, 0x1
	bl sub_806295C
	movs r0, 0x1
	pop {r1}
	bx r1
	thumb_func_end sub_806299C

	thumb_func_start sub_80629AC
sub_80629AC: @ 80629AC
	push {lr}
	movs r2, 0x2
	bl sub_806295C
	movs r0, 0x1
	pop {r1}
	bx r1
	thumb_func_end sub_80629AC

	thumb_func_start sub_80629BC
sub_80629BC: @ 80629BC
	push {lr}
	movs r2, 0x3
	bl sub_806295C
	movs r0, 0x1
	pop {r1}
	bx r1
	thumb_func_end sub_80629BC

	thumb_func_start sub_80629CC
sub_80629CC: @ 80629CC
	push {lr}
	movs r2, 0x4
	bl sub_806295C
	movs r0, 0x1
	pop {r1}
	bx r1
	thumb_func_end sub_80629CC

	thumb_func_start sub_80629DC
sub_80629DC: @ 80629DC
	push {r4,r5,lr}
	adds r4, r0, 0
	adds r5, r1, 0
	movs r0, 0x1
	bl sub_805FD98
	adds r3, r0, 0
	lsls r3, 24
	lsrs r3, 24
	adds r0, r4, 0
	adds r1, r5, 0
	movs r2, 0x1
	bl npc_set_direction_and_anim__an_proceed
	movs r0, 0
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end sub_80629DC

	thumb_func_start sub_8062A00
sub_8062A00: @ 8062A00
	push {r4,r5,lr}
	adds r4, r0, 0
	adds r5, r1, 0
	movs r0, 0x2
	bl sub_805FD98
	adds r3, r0, 0
	lsls r3, 24
	lsrs r3, 24
	adds r0, r4, 0
	adds r1, r5, 0
	movs r2, 0x2
	bl npc_set_direction_and_anim__an_proceed
	movs r0, 0
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end sub_8062A00

	thumb_func_start sub_8062A24
sub_8062A24: @ 8062A24
	push {r4,r5,lr}
	adds r4, r0, 0
	adds r5, r1, 0
	movs r0, 0x3
	bl sub_805FD98
	adds r3, r0, 0
	lsls r3, 24
	lsrs r3, 24
	adds r0, r4, 0
	adds r1, r5, 0
	movs r2, 0x3
	bl npc_set_direction_and_anim__an_proceed
	movs r0, 0
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end sub_8062A24

	thumb_func_start sub_8062A48
sub_8062A48: @ 8062A48
	push {r4,r5,lr}
	adds r4, r0, 0
	adds r5, r1, 0
	movs r0, 0x4
	bl sub_805FD98
	adds r3, r0, 0
	lsls r3, 24
	lsrs r3, 24
	adds r0, r4, 0
	adds r1, r5, 0
	movs r2, 0x4
	bl npc_set_direction_and_anim__an_proceed
	movs r0, 0
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end sub_8062A48

	thumb_func_start sub_8062A6C
sub_8062A6C: @ 8062A6C
	push {r4,r5,lr}
	adds r4, r0, 0
	adds r5, r1, 0
	movs r0, 0x1
	bl sub_805FDB8
	adds r3, r0, 0
	lsls r3, 24
	lsrs r3, 24
	adds r0, r4, 0
	adds r1, r5, 0
	movs r2, 0x1
	bl npc_set_direction_and_anim__an_proceed
	movs r0, 0
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end sub_8062A6C

	thumb_func_start sub_8062A90
sub_8062A90: @ 8062A90
	push {r4,r5,lr}
	adds r4, r0, 0
	adds r5, r1, 0
	movs r0, 0x2
	bl sub_805FDB8
	adds r3, r0, 0
	lsls r3, 24
	lsrs r3, 24
	adds r0, r4, 0
	adds r1, r5, 0
	movs r2, 0x2
	bl npc_set_direction_and_anim__an_proceed
	movs r0, 0
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end sub_8062A90

	thumb_func_start sub_8062AB4
sub_8062AB4: @ 8062AB4
	push {r4,r5,lr}
	adds r4, r0, 0
	adds r5, r1, 0
	movs r0, 0x3
	bl sub_805FDB8
	adds r3, r0, 0
	lsls r3, 24
	lsrs r3, 24
	adds r0, r4, 0
	adds r1, r5, 0
	movs r2, 0x3
	bl npc_set_direction_and_anim__an_proceed
	movs r0, 0
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end sub_8062AB4

	thumb_func_start sub_8062AD8
sub_8062AD8: @ 8062AD8
	push {r4,r5,lr}
	adds r4, r0, 0
	adds r5, r1, 0
	movs r0, 0x4
	bl sub_805FDB8
	adds r3, r0, 0
	lsls r3, 24
	lsrs r3, 24
	adds r0, r4, 0
	adds r1, r5, 0
	movs r2, 0x4
	bl npc_set_direction_and_anim__an_proceed
	movs r0, 0
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end sub_8062AD8

	thumb_func_start sub_8062AFC
sub_8062AFC: @ 8062AFC
	push {r4,r5,lr}
	adds r4, r0, 0
	adds r5, r1, 0
	movs r0, 0x1
	bl sub_805FDC8
	adds r3, r0, 0
	lsls r3, 24
	lsrs r3, 24
	adds r0, r4, 0
	adds r1, r5, 0
	movs r2, 0x1
	bl npc_set_direction_and_anim__an_proceed
	movs r0, 0
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end sub_8062AFC

	thumb_func_start sub_8062B20
sub_8062B20: @ 8062B20
	push {r4,r5,lr}
	adds r4, r0, 0
	adds r5, r1, 0
	movs r0, 0x2
	bl sub_805FDC8
	adds r3, r0, 0
	lsls r3, 24
	lsrs r3, 24
	adds r0, r4, 0
	adds r1, r5, 0
	movs r2, 0x2
	bl npc_set_direction_and_anim__an_proceed
	movs r0, 0
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end sub_8062B20

	thumb_func_start sub_8062B44
sub_8062B44: @ 8062B44
	push {r4,r5,lr}
	adds r4, r0, 0
	adds r5, r1, 0
	movs r0, 0x3
	bl sub_805FDC8
	adds r3, r0, 0
	lsls r3, 24
	lsrs r3, 24
	adds r0, r4, 0
	adds r1, r5, 0
	movs r2, 0x3
	bl npc_set_direction_and_anim__an_proceed
	movs r0, 0
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end sub_8062B44

	thumb_func_start sub_8062B68
sub_8062B68: @ 8062B68
	push {r4,r5,lr}
	adds r4, r0, 0
	adds r5, r1, 0
	movs r0, 0x4
	bl sub_805FDC8
	adds r3, r0, 0
	lsls r3, 24
	lsrs r3, 24
	adds r0, r4, 0
	adds r1, r5, 0
	movs r2, 0x4
	bl npc_set_direction_and_anim__an_proceed
	movs r0, 0
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end sub_8062B68

	thumb_func_start sub_8062B8C
sub_8062B8C: @ 8062B8C
	push {r4-r6,lr}
	sub sp, 0x4
	adds r6, r0, 0
	adds r5, r1, 0
	adds r4, r2, 0
	ldr r0, [sp, 0x14]
	lsls r4, 24
	lsrs r4, 24
	lsls r3, 24
	lsrs r3, 24
	lsls r0, 24
	lsrs r0, 24
	str r0, [sp]
	adds r0, r6, 0
	adds r2, r4, 0
	bl sub_806113C
	adds r0, r4, 0
	bl sub_805FD98
	adds r1, r0, 0
	lsls r1, 24
	lsrs r1, 24
	adds r0, r5, 0
	bl StartSpriteAnimIfDifferent
	adds r0, r6, 0
	bl DoShadowFieldEffect
	add sp, 0x4
	pop {r4-r6}
	pop {r0}
	bx r0
	thumb_func_end sub_8062B8C

	thumb_func_start sub_8062BD0
sub_8062BD0: @ 8062BD0
	push {r4,r5,lr}
	sub sp, 0x4
	adds r4, r0, 0
	adds r5, r1, 0
	movs r0, 0x1
	str r0, [sp]
	adds r0, r4, 0
	movs r2, 0x1
	movs r3, 0
	bl sub_8062B8C
	adds r0, r4, 0
	adds r1, r5, 0
	bl sub_8062BFC
	lsls r0, 24
	lsrs r0, 24
	add sp, 0x4
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end sub_8062BD0

	thumb_func_start sub_8062BFC
sub_8062BFC: @ 8062BFC
	push {r4,r5,lr}
	adds r4, r0, 0
	adds r5, r1, 0
	bl sub_8061328
	lsls r0, 24
	cmp r0, 0
	bne _08062C10
	movs r0, 0
	b _08062C20
_08062C10:
	ldrb r0, [r4, 0x2]
	movs r1, 0x41
	negs r1, r1
	ands r1, r0
	strb r1, [r4, 0x2]
	movs r0, 0x2
	strh r0, [r5, 0x32]
	movs r0, 0x1
_08062C20:
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end sub_8062BFC

	thumb_func_start sub_8062C28
sub_8062C28: @ 8062C28
	push {r4,r5,lr}
	sub sp, 0x4
	adds r4, r0, 0
	adds r5, r1, 0
	movs r0, 0x1
	str r0, [sp]
	adds r0, r4, 0
	movs r2, 0x2
	movs r3, 0
	bl sub_8062B8C
	adds r0, r4, 0
	adds r1, r5, 0
	bl sub_8062C54
	lsls r0, 24
	lsrs r0, 24
	add sp, 0x4
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end sub_8062C28

	thumb_func_start sub_8062C54
sub_8062C54: @ 8062C54
	push {r4,r5,lr}
	adds r4, r0, 0
	adds r5, r1, 0
	bl sub_8061328
	lsls r0, 24
	cmp r0, 0
	bne _08062C68
	movs r0, 0
	b _08062C78
_08062C68:
	ldrb r0, [r4, 0x2]
	movs r1, 0x41
	negs r1, r1
	ands r1, r0
	strb r1, [r4, 0x2]
	movs r0, 0x2
	strh r0, [r5, 0x32]
	movs r0, 0x1
_08062C78:
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end sub_8062C54

	thumb_func_start sub_8062C80
sub_8062C80: @ 8062C80
	push {r4,r5,lr}
	sub sp, 0x4
	adds r4, r0, 0
	adds r5, r1, 0
	movs r0, 0x1
	str r0, [sp]
	adds r0, r4, 0
	movs r2, 0x3
	movs r3, 0
	bl sub_8062B8C
	adds r0, r4, 0
	adds r1, r5, 0
	bl sub_8062CAC
	lsls r0, 24
	lsrs r0, 24
	add sp, 0x4
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end sub_8062C80

	thumb_func_start sub_8062CAC
sub_8062CAC: @ 8062CAC
	push {r4,r5,lr}
	adds r4, r0, 0
	adds r5, r1, 0
	bl sub_8061328
	lsls r0, 24
	cmp r0, 0
	bne _08062CC0
	movs r0, 0
	b _08062CD0
_08062CC0:
	ldrb r0, [r4, 0x2]
	movs r1, 0x41
	negs r1, r1
	ands r1, r0
	strb r1, [r4, 0x2]
	movs r0, 0x2
	strh r0, [r5, 0x32]
	movs r0, 0x1
_08062CD0:
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end sub_8062CAC

	thumb_func_start sub_8062CD8
sub_8062CD8: @ 8062CD8
	push {r4,r5,lr}
	sub sp, 0x4
	adds r4, r0, 0
	adds r5, r1, 0
	movs r0, 0x1
	str r0, [sp]
	adds r0, r4, 0
	movs r2, 0x4
	movs r3, 0
	bl sub_8062B8C
	adds r0, r4, 0
	adds r1, r5, 0
	bl sub_8062D04
	lsls r0, 24
	lsrs r0, 24
	add sp, 0x4
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end sub_8062CD8

	thumb_func_start sub_8062D04
sub_8062D04: @ 8062D04
	push {r4,r5,lr}
	adds r4, r0, 0
	adds r5, r1, 0
	bl sub_8061328
	lsls r0, 24
	cmp r0, 0
	bne _08062D18
	movs r0, 0
	b _08062D28
_08062D18:
	ldrb r0, [r4, 0x2]
	movs r1, 0x41
	negs r1, r1
	ands r1, r0
	strb r1, [r4, 0x2]
	movs r0, 0x2
	strh r0, [r5, 0x32]
	movs r0, 0x1
_08062D28:
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end sub_8062D04

	thumb_func_start sub_8062D30
sub_8062D30: @ 8062D30
	push {r4,r5,lr}
	sub sp, 0x4
	adds r4, r0, 0
	adds r5, r1, 0
	movs r0, 0x1
	str r0, [sp]
	adds r0, r4, 0
	movs r2, 0x1
	movs r3, 0x1
	bl sub_8062B8C
	adds r0, r4, 0
	adds r1, r5, 0
	bl sub_8062D5C
	lsls r0, 24
	lsrs r0, 24
	add sp, 0x4
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end sub_8062D30

	thumb_func_start sub_8062D5C
sub_8062D5C: @ 8062D5C
	push {r4,r5,lr}
	adds r4, r0, 0
	adds r5, r1, 0
	bl sub_8061328
	lsls r0, 24
	cmp r0, 0
	bne _08062D70
	movs r0, 0
	b _08062D80
_08062D70:
	ldrb r0, [r4, 0x2]
	movs r1, 0x41
	negs r1, r1
	ands r1, r0
	strb r1, [r4, 0x2]
	movs r0, 0x2
	strh r0, [r5, 0x32]
	movs r0, 0x1
_08062D80:
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end sub_8062D5C

	thumb_func_start sub_8062D88
sub_8062D88: @ 8062D88
	push {r4,r5,lr}
	sub sp, 0x4
	adds r4, r0, 0
	adds r5, r1, 0
	movs r0, 0x1
	str r0, [sp]
	adds r0, r4, 0
	movs r2, 0x2
	movs r3, 0x1
	bl sub_8062B8C
	adds r0, r4, 0
	adds r1, r5, 0
	bl sub_8062DB4
	lsls r0, 24
	lsrs r0, 24
	add sp, 0x4
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end sub_8062D88

	thumb_func_start sub_8062DB4
sub_8062DB4: @ 8062DB4
	push {r4,r5,lr}
	adds r4, r0, 0
	adds r5, r1, 0
	bl sub_8061328
	lsls r0, 24
	cmp r0, 0
	bne _08062DC8
	movs r0, 0
	b _08062DD8
_08062DC8:
	ldrb r0, [r4, 0x2]
	movs r1, 0x41
	negs r1, r1
	ands r1, r0
	strb r1, [r4, 0x2]
	movs r0, 0x2
	strh r0, [r5, 0x32]
	movs r0, 0x1
_08062DD8:
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end sub_8062DB4

	thumb_func_start sub_8062DE0
sub_8062DE0: @ 8062DE0
	push {r4,r5,lr}
	sub sp, 0x4
	adds r4, r0, 0
	adds r5, r1, 0
	movs r0, 0x1
	str r0, [sp]
	adds r0, r4, 0
	movs r2, 0x3
	movs r3, 0x1
	bl sub_8062B8C
	adds r0, r4, 0
	adds r1, r5, 0
	bl sub_8062E0C
	lsls r0, 24
	lsrs r0, 24
	add sp, 0x4
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end sub_8062DE0

	thumb_func_start sub_8062E0C
sub_8062E0C: @ 8062E0C
	push {r4,r5,lr}
	adds r4, r0, 0
	adds r5, r1, 0
	bl sub_8061328
	lsls r0, 24
	cmp r0, 0
	bne _08062E20
	movs r0, 0
	b _08062E30
_08062E20:
	ldrb r0, [r4, 0x2]
	movs r1, 0x41
	negs r1, r1
	ands r1, r0
	strb r1, [r4, 0x2]
	movs r0, 0x2
	strh r0, [r5, 0x32]
	movs r0, 0x1
_08062E30:
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end sub_8062E0C

	thumb_func_start sub_8062E38
sub_8062E38: @ 8062E38
	push {r4,r5,lr}
	sub sp, 0x4
	adds r4, r0, 0
	adds r5, r1, 0
	movs r0, 0x1
	str r0, [sp]
	adds r0, r4, 0
	movs r2, 0x4
	movs r3, 0x1
	bl sub_8062B8C
	adds r0, r4, 0
	adds r1, r5, 0
	bl sub_8062E64
	lsls r0, 24
	lsrs r0, 24
	add sp, 0x4
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end sub_8062E38

	thumb_func_start sub_8062E64
sub_8062E64: @ 8062E64
	push {r4,r5,lr}
	adds r4, r0, 0
	adds r5, r1, 0
	bl sub_8061328
	lsls r0, 24
	cmp r0, 0
	bne _08062E78
	movs r0, 0
	b _08062E88
_08062E78:
	ldrb r0, [r4, 0x2]
	movs r1, 0x41
	negs r1, r1
	ands r1, r0
	strb r1, [r4, 0x2]
	movs r0, 0x2
	strh r0, [r5, 0x32]
	movs r0, 0x1
_08062E88:
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end sub_8062E64

	thumb_func_start sub_8062E90
sub_8062E90: @ 8062E90
	push {r4,r5,lr}
	sub sp, 0x4
	adds r4, r0, 0
	adds r5, r1, 0
	movs r0, 0
	str r0, [sp]
	adds r0, r4, 0
	movs r2, 0x1
	movs r3, 0x2
	bl sub_8062B8C
	adds r0, r4, 0
	adds r1, r5, 0
	bl sub_8062EBC
	lsls r0, 24
	lsrs r0, 24
	add sp, 0x4
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end sub_8062E90

	thumb_func_start sub_8062EBC
sub_8062EBC: @ 8062EBC
	push {r4,r5,lr}
	adds r4, r0, 0
	adds r5, r1, 0
	bl sub_8061328
	lsls r0, 24
	cmp r0, 0
	bne _08062ED0
	movs r0, 0
	b _08062EE0
_08062ED0:
	ldrb r0, [r4, 0x2]
	movs r1, 0x41
	negs r1, r1
	ands r1, r0
	strb r1, [r4, 0x2]
	movs r0, 0x2
	strh r0, [r5, 0x32]
	movs r0, 0x1
_08062EE0:
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end sub_8062EBC

	thumb_func_start sub_8062EE8
sub_8062EE8: @ 8062EE8
	push {r4,r5,lr}
	sub sp, 0x4
	adds r4, r0, 0
	adds r5, r1, 0
	movs r0, 0
	str r0, [sp]
	adds r0, r4, 0
	movs r2, 0x2
	movs r3, 0x2
	bl sub_8062B8C
	adds r0, r4, 0
	adds r1, r5, 0
	bl sub_8062F14
	lsls r0, 24
	lsrs r0, 24
	add sp, 0x4
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end sub_8062EE8

	thumb_func_start sub_8062F14
sub_8062F14: @ 8062F14
	push {r4,r5,lr}
	adds r4, r0, 0
	adds r5, r1, 0
	bl sub_8061328
	lsls r0, 24
	cmp r0, 0
	bne _08062F28
	movs r0, 0
	b _08062F38
_08062F28:
	ldrb r0, [r4, 0x2]
	movs r1, 0x41
	negs r1, r1
	ands r1, r0
	strb r1, [r4, 0x2]
	movs r0, 0x2
	strh r0, [r5, 0x32]
	movs r0, 0x1
_08062F38:
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end sub_8062F14

	thumb_func_start sub_8062F40
sub_8062F40: @ 8062F40
	push {r4,r5,lr}
	sub sp, 0x4
	adds r4, r0, 0
	adds r5, r1, 0
	movs r0, 0
	str r0, [sp]
	adds r0, r4, 0
	movs r2, 0x3
	movs r3, 0x2
	bl sub_8062B8C
	adds r0, r4, 0
	adds r1, r5, 0
	bl sub_8062F6C
	lsls r0, 24
	lsrs r0, 24
	add sp, 0x4
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end sub_8062F40

	thumb_func_start sub_8062F6C
sub_8062F6C: @ 8062F6C
	push {r4,r5,lr}
	adds r4, r0, 0
	adds r5, r1, 0
	bl sub_8061328
	lsls r0, 24
	cmp r0, 0
	bne _08062F80
	movs r0, 0
	b _08062F90
_08062F80:
	ldrb r0, [r4, 0x2]
	movs r1, 0x41
	negs r1, r1
	ands r1, r0
	strb r1, [r4, 0x2]
	movs r0, 0x2
	strh r0, [r5, 0x32]
	movs r0, 0x1
_08062F90:
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end sub_8062F6C

	thumb_func_start sub_8062F98
sub_8062F98: @ 8062F98
	push {r4,r5,lr}
	sub sp, 0x4
	adds r4, r0, 0
	adds r5, r1, 0
	movs r0, 0
	str r0, [sp]
	adds r0, r4, 0
	movs r2, 0x4
	movs r3, 0x2
	bl sub_8062B8C
	adds r0, r4, 0
	adds r1, r5, 0
	bl sub_8062FC4
	lsls r0, 24
	lsrs r0, 24
	add sp, 0x4
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end sub_8062F98

	thumb_func_start sub_8062FC4
sub_8062FC4: @ 8062FC4
	push {r4,r5,lr}
	adds r4, r0, 0
	adds r5, r1, 0
	bl sub_8061328
	lsls r0, 24
	cmp r0, 0
	bne _08062FD8
	movs r0, 0
	b _08062FE8
_08062FD8:
	ldrb r0, [r4, 0x2]
	movs r1, 0x41
	negs r1, r1
	ands r1, r0
	strb r1, [r4, 0x2]
	movs r0, 0x2
	strh r0, [r5, 0x32]
	movs r0, 0x1
_08062FE8:
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end sub_8062FC4

	thumb_func_start sub_8062FF0
sub_8062FF0: @ 8062FF0
	push {r4,r5,lr}
	sub sp, 0x4
	adds r4, r0, 0
	adds r5, r1, 0
	movs r0, 0x1
	bl sub_805FDD8
	adds r3, r0, 0
	lsls r3, 24
	lsrs r3, 24
	movs r0, 0x8
	str r0, [sp]
	adds r0, r4, 0
	adds r1, r5, 0
	movs r2, 0x1
	bl sub_80616CC
	adds r0, r4, 0
	adds r1, r5, 0
	bl sub_8061714
	lsls r0, 24
	lsrs r0, 24
	add sp, 0x4
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end sub_8062FF0

	thumb_func_start sub_8063028
sub_8063028: @ 8063028
	push {r4,r5,lr}
	sub sp, 0x4
	adds r4, r0, 0
	adds r5, r1, 0
	movs r0, 0x2
	bl sub_805FDD8
	adds r3, r0, 0
	lsls r3, 24
	lsrs r3, 24
	movs r0, 0x8
	str r0, [sp]
	adds r0, r4, 0
	adds r1, r5, 0
	movs r2, 0x2
	bl sub_80616CC
	adds r0, r4, 0
	adds r1, r5, 0
	bl sub_8061714
	lsls r0, 24
	lsrs r0, 24
	add sp, 0x4
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end sub_8063028

	thumb_func_start sub_8063060
sub_8063060: @ 8063060
	push {r4,r5,lr}
	sub sp, 0x4
	adds r4, r0, 0
	adds r5, r1, 0
	movs r0, 0x3
	bl sub_805FDD8
	adds r3, r0, 0
	lsls r3, 24
	lsrs r3, 24
	movs r0, 0x8
	str r0, [sp]
	adds r0, r4, 0
	adds r1, r5, 0
	movs r2, 0x3
	bl sub_80616CC
	adds r0, r4, 0
	adds r1, r5, 0
	bl sub_8061714
	lsls r0, 24
	lsrs r0, 24
	add sp, 0x4
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end sub_8063060

	thumb_func_start sub_8063098
sub_8063098: @ 8063098
	push {r4,r5,lr}
	sub sp, 0x4
	adds r4, r0, 0
	adds r5, r1, 0
	movs r0, 0x4
	bl sub_805FDD8
	adds r3, r0, 0
	lsls r3, 24
	lsrs r3, 24
	movs r0, 0x8
	str r0, [sp]
	adds r0, r4, 0
	adds r1, r5, 0
	movs r2, 0x4
	bl sub_80616CC
	adds r0, r4, 0
	adds r1, r5, 0
	bl sub_8061714
	lsls r0, 24
	lsrs r0, 24
	add sp, 0x4
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end sub_8063098

	thumb_func_start sub_80630D0
sub_80630D0: @ 80630D0
	push {r4,r5,lr}
	adds r5, r0, 0
	adds r4, r1, 0
	lsls r2, 24
	lsrs r2, 24
	lsls r3, 24
	lsrs r3, 24
	bl sub_8060D20
	ldrb r0, [r5, 0x18]
	lsls r0, 28
	lsrs r0, 28
	bl sub_805FD98
	adds r1, r0, 0
	lsls r1, 24
	lsrs r1, 24
	adds r0, r4, 0
	bl StartSpriteAnim
	adds r0, r4, 0
	movs r1, 0
	bl SeekSpriteAnim
	pop {r4,r5}
	pop {r0}
	bx r0
	thumb_func_end sub_80630D0

	thumb_func_start sub_8063108
sub_8063108: @ 8063108
	push {r4,r5,lr}
	adds r4, r0, 0
	adds r5, r1, 0
	movs r2, 0x1
	movs r3, 0x1
	bl sub_80630D0
	adds r0, r4, 0
	adds r1, r5, 0
	bl sub_8063128
	lsls r0, 24
	lsrs r0, 24
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end sub_8063108

	thumb_func_start sub_8063128
sub_8063128: @ 8063128
	push {r4,lr}
	adds r4, r1, 0
	bl npc_obj_ministep_stop_on_arrival
	lsls r0, 24
	cmp r0, 0
	bne _0806313A
	movs r0, 0
	b _08063140
_0806313A:
	movs r0, 0x2
	strh r0, [r4, 0x32]
	movs r0, 0x1
_08063140:
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end sub_8063128

	thumb_func_start sub_8063148
sub_8063148: @ 8063148
	push {r4,r5,lr}
	adds r4, r0, 0
	adds r5, r1, 0
	movs r2, 0x2
	movs r3, 0x1
	bl sub_80630D0
	adds r0, r4, 0
	adds r1, r5, 0
	bl sub_8063168
	lsls r0, 24
	lsrs r0, 24
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end sub_8063148

	thumb_func_start sub_8063168
sub_8063168: @ 8063168
	push {r4,lr}
	adds r4, r1, 0
	bl npc_obj_ministep_stop_on_arrival
	lsls r0, 24
	cmp r0, 0
	bne _0806317A
	movs r0, 0
	b _08063180
_0806317A:
	movs r0, 0x2
	strh r0, [r4, 0x32]
	movs r0, 0x1
_08063180:
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end sub_8063168

	thumb_func_start sub_8063188
sub_8063188: @ 8063188
	push {r4,r5,lr}
	adds r4, r0, 0
	adds r5, r1, 0
	movs r2, 0x3
	movs r3, 0x1
	bl sub_80630D0
	adds r0, r4, 0
	adds r1, r5, 0
	bl sub_80631A8
	lsls r0, 24
	lsrs r0, 24
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end sub_8063188

	thumb_func_start sub_80631A8
sub_80631A8: @ 80631A8
	push {r4,lr}
	adds r4, r1, 0
	bl npc_obj_ministep_stop_on_arrival
	lsls r0, 24
	cmp r0, 0
	bne _080631BA
	movs r0, 0
	b _080631C0
_080631BA:
	movs r0, 0x2
	strh r0, [r4, 0x32]
	movs r0, 0x1
_080631C0:
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end sub_80631A8

	thumb_func_start sub_80631C8
sub_80631C8: @ 80631C8
	push {r4,r5,lr}
	adds r4, r0, 0
	adds r5, r1, 0
	movs r2, 0x4
	movs r3, 0x1
	bl sub_80630D0
	adds r0, r4, 0
	adds r1, r5, 0
	bl sub_80631E8
	lsls r0, 24
	lsrs r0, 24
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end sub_80631C8

	thumb_func_start sub_80631E8
sub_80631E8: @ 80631E8
	push {r4,lr}
	adds r4, r1, 0
	bl npc_obj_ministep_stop_on_arrival
	lsls r0, 24
	cmp r0, 0
	bne _080631FA
	movs r0, 0
	b _08063200
_080631FA:
	movs r0, 0x2
	strh r0, [r4, 0x32]
	movs r0, 0x1
_08063200:
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end sub_80631E8

	thumb_func_start sub_8063208
sub_8063208: @ 8063208
	push {r4,r5,lr}
	adds r4, r0, 0
	adds r5, r1, 0
	lsls r2, 24
	lsrs r2, 24
	lsls r3, 24
	lsrs r3, 24
	bl sub_8060D20
	ldrb r0, [r4, 0x18]
	lsls r0, 28
	lsrs r0, 28
	bl sub_805FDD8
	adds r2, r0, 0
	lsls r2, 24
	lsrs r2, 24
	adds r0, r4, 0
	adds r1, r5, 0
	bl sub_805FE28
	pop {r4,r5}
	pop {r0}
	bx r0
	thumb_func_end sub_8063208

	thumb_func_start sub_8063238
sub_8063238: @ 8063238
	push {r4,r5,lr}
	adds r4, r0, 0
	adds r5, r1, 0
	movs r2, 0x1
	movs r3, 0x1
	bl sub_8063208
	adds r0, r4, 0
	adds r1, r5, 0
	bl sub_8063258
	lsls r0, 24
	lsrs r0, 24
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end sub_8063238

	thumb_func_start sub_8063258
sub_8063258: @ 8063258
	push {r4,lr}
	adds r4, r1, 0
	bl npc_obj_ministep_stop_on_arrival
	lsls r0, 24
	cmp r0, 0
	bne _0806326A
	movs r0, 0
	b _08063270
_0806326A:
	movs r0, 0x2
	strh r0, [r4, 0x32]
	movs r0, 0x1
_08063270:
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end sub_8063258

	thumb_func_start sub_8063278
sub_8063278: @ 8063278
	push {r4,r5,lr}
	adds r4, r0, 0
	adds r5, r1, 0
	movs r2, 0x2
	movs r3, 0x1
	bl sub_8063208
	adds r0, r4, 0
	adds r1, r5, 0
	bl sub_8063298
	lsls r0, 24
	lsrs r0, 24
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end sub_8063278

	thumb_func_start sub_8063298
sub_8063298: @ 8063298
	push {r4,lr}
	adds r4, r1, 0
	bl npc_obj_ministep_stop_on_arrival
	lsls r0, 24
	cmp r0, 0
	bne _080632AA
	movs r0, 0
	b _080632B0
_080632AA:
	movs r0, 0x2
	strh r0, [r4, 0x32]
	movs r0, 0x1
_080632B0:
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end sub_8063298

	thumb_func_start sub_80632B8
sub_80632B8: @ 80632B8
	push {r4,r5,lr}
	adds r4, r0, 0
	adds r5, r1, 0
	movs r2, 0x3
	movs r3, 0x1
	bl sub_8063208
	adds r0, r4, 0
	adds r1, r5, 0
	bl sub_80632D8
	lsls r0, 24
	lsrs r0, 24
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end sub_80632B8

	thumb_func_start sub_80632D8
sub_80632D8: @ 80632D8
	push {r4,lr}
	adds r4, r1, 0
	bl npc_obj_ministep_stop_on_arrival
	lsls r0, 24
	cmp r0, 0
	bne _080632EA
	movs r0, 0
	b _080632F0
_080632EA:
	movs r0, 0x2
	strh r0, [r4, 0x32]
	movs r0, 0x1
_080632F0:
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end sub_80632D8

	thumb_func_start sub_80632F8
sub_80632F8: @ 80632F8
	push {r4,r5,lr}
	adds r4, r0, 0
	adds r5, r1, 0
	movs r2, 0x4
	movs r3, 0x1
	bl sub_8063208
	adds r0, r4, 0
	adds r1, r5, 0
	bl sub_8063318
	lsls r0, 24
	lsrs r0, 24
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end sub_80632F8

	thumb_func_start sub_8063318
sub_8063318: @ 8063318
	push {r4,lr}
	adds r4, r1, 0
	bl npc_obj_ministep_stop_on_arrival
	lsls r0, 24
	cmp r0, 0
	bne _0806332A
	movs r0, 0
	b _08063330
_0806332A:
	movs r0, 0x2
	strh r0, [r4, 0x32]
	movs r0, 0x1
_08063330:
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end sub_8063318

	thumb_func_start sub_8063338
sub_8063338: @ 8063338
	push {r4,r5,lr}
	adds r5, r0, 0
	adds r4, r1, 0
	lsls r2, 24
	lsrs r2, 24
	lsls r3, 24
	lsrs r3, 24
	bl sub_8060D20
	ldrb r0, [r5, 0x18]
	lsls r0, 28
	lsrs r0, 28
	bl sub_805FDB8
	adds r1, r0, 0
	lsls r1, 24
	lsrs r1, 24
	adds r0, r4, 0
	bl StartSpriteAnim
	adds r0, r4, 0
	movs r1, 0
	bl SeekSpriteAnim
	pop {r4,r5}
	pop {r0}
	bx r0
	thumb_func_end sub_8063338

	thumb_func_start sub_8063370
sub_8063370: @ 8063370
	push {r4,r5,lr}
	adds r4, r0, 0
	adds r5, r1, 0
	movs r2, 0x1
	movs r3, 0x1
	bl sub_8063338
	adds r0, r4, 0
	adds r1, r5, 0
	bl sub_8063390
	lsls r0, 24
	lsrs r0, 24
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end sub_8063370

	thumb_func_start sub_8063390
sub_8063390: @ 8063390
	push {r4,lr}
	adds r4, r1, 0
	bl npc_obj_ministep_stop_on_arrival
	lsls r0, 24
	cmp r0, 0
	bne _080633A2
	movs r0, 0
	b _080633A8
_080633A2:
	movs r0, 0x2
	strh r0, [r4, 0x32]
	movs r0, 0x1
_080633A8:
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end sub_8063390

	thumb_func_start sub_80633B0
sub_80633B0: @ 80633B0
	push {r4,r5,lr}
	adds r4, r0, 0
	adds r5, r1, 0
	movs r2, 0x2
	movs r3, 0x1
	bl sub_8063338
	adds r0, r4, 0
	adds r1, r5, 0
	bl sub_80633D0
	lsls r0, 24
	lsrs r0, 24
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end sub_80633B0

	thumb_func_start sub_80633D0
sub_80633D0: @ 80633D0
	push {r4,lr}
	adds r4, r1, 0
	bl npc_obj_ministep_stop_on_arrival
	lsls r0, 24
	cmp r0, 0
	bne _080633E2
	movs r0, 0
	b _080633E8
_080633E2:
	movs r0, 0x2
	strh r0, [r4, 0x32]
	movs r0, 0x1
_080633E8:
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end sub_80633D0

	thumb_func_start sub_80633F0
sub_80633F0: @ 80633F0
	push {r4,r5,lr}
	adds r4, r0, 0
	adds r5, r1, 0
	movs r2, 0x3
	movs r3, 0x1
	bl sub_8063338
	adds r0, r4, 0
	adds r1, r5, 0
	bl sub_8063410
	lsls r0, 24
	lsrs r0, 24
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end sub_80633F0

	thumb_func_start sub_8063410
sub_8063410: @ 8063410
	push {r4,lr}
	adds r4, r1, 0
	bl npc_obj_ministep_stop_on_arrival
	lsls r0, 24
	cmp r0, 0
	bne _08063422
	movs r0, 0
	b _08063428
_08063422:
	movs r0, 0x2
	strh r0, [r4, 0x32]
	movs r0, 0x1
_08063428:
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end sub_8063410

	thumb_func_start sub_8063430
sub_8063430: @ 8063430
	push {r4,r5,lr}
	adds r4, r0, 0
	adds r5, r1, 0
	movs r2, 0x4
	movs r3, 0x1
	bl sub_8063338
	adds r0, r4, 0
	adds r1, r5, 0
	bl sub_8063450
	lsls r0, 24
	lsrs r0, 24
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end sub_8063430

	thumb_func_start sub_8063450
sub_8063450: @ 8063450
	push {r4,lr}
	adds r4, r1, 0
	bl npc_obj_ministep_stop_on_arrival
	lsls r0, 24
	cmp r0, 0
	bne _08063462
	movs r0, 0
	b _08063468
_08063462:
	movs r0, 0x2
	strh r0, [r4, 0x32]
	movs r0, 0x1
_08063468:
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end sub_8063450

	thumb_func_start sub_8063470
sub_8063470: @ 8063470
	movs r0, 0x1
	bx lr
	thumb_func_end sub_8063470

	thumb_func_start sub_8063474
sub_8063474: @ 8063474
	adds r1, 0x2C
	ldrb r0, [r1]
	movs r2, 0x40
	orrs r0, r2
	strb r0, [r1]
	movs r0, 0x1
	bx lr
	thumb_func_end sub_8063474

	thumb_func_start npc_obj_transfer_image_anim_pause_flag
npc_obj_transfer_image_anim_pause_flag: @ 8063484
	push {lr}
	ldrb r0, [r0, 0x1]
	lsls r0, 29
	cmp r0, 0
	bge _0806349A
	adds r0, r1, 0
	adds r0, 0x2C
	ldrb r1, [r0]
	movs r2, 0x40
	orrs r1, r2
	strb r1, [r0]
_0806349A:
	pop {r0}
	bx r0
	thumb_func_end npc_obj_transfer_image_anim_pause_flag

	thumb_func_start sub_80634A0
sub_80634A0: @ 80634A0
	push {r4,lr}
	adds r4, r0, 0
	ldrb r3, [r4, 0x1]
	lsls r0, r3, 28
	cmp r0, 0
	bge _080634C8
	adds r2, r1, 0
	adds r2, 0x2C
	ldrb r1, [r2]
	movs r0, 0x41
	negs r0, r0
	ands r0, r1
	strb r0, [r2]
	movs r0, 0x5
	negs r0, r0
	ands r0, r3
	movs r1, 0x9
	negs r1, r1
	ands r0, r1
	strb r0, [r4, 0x1]
_080634C8:
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end sub_80634A0

	thumb_func_start sub_80634D0
sub_80634D0: @ 80634D0
	push {r4,r5,lr}
	adds r4, r0, 0
	adds r5, r1, 0
	bl sub_80634E8
	adds r0, r4, 0
	adds r1, r5, 0
	bl npc_update_obj_anim_flag
	pop {r4,r5}
	pop {r0}
	bx r0
	thumb_func_end sub_80634D0

	thumb_func_start sub_80634E8
sub_80634E8: @ 80634E8
	push {r4-r6,lr}
	adds r5, r0, 0
	adds r4, r1, 0
	ldrb r1, [r5, 0x1]
	movs r0, 0x41
	negs r0, r0
	ands r0, r1
	strb r0, [r5, 0x1]
	ldrb r0, [r5, 0x5]
	bl GetFieldObjectGraphicsInfo
	adds r6, r0, 0
	adds r0, r4, 0
	adds r0, 0x3E
	ldrb r1, [r0]
	movs r0, 0x2
	ands r0, r1
	cmp r0, 0
	beq _0806354C
	ldrh r1, [r4, 0x24]
	ldrh r0, [r4, 0x20]
	adds r1, r0
	adds r0, r4, 0
	adds r0, 0x28
	ldrb r0, [r0]
	lsls r0, 24
	asrs r0, 24
	ldr r2, _08063544 @ =gSpriteCoordOffsetX
	adds r0, r1
	ldrh r2, [r2]
	adds r0, r2
	lsls r0, 16
	lsrs r3, r0, 16
	ldrh r1, [r4, 0x26]
	ldrh r0, [r4, 0x22]
	adds r1, r0
	adds r0, r4, 0
	adds r0, 0x29
	ldrb r0, [r0]
	lsls r0, 24
	asrs r0, 24
	ldr r2, _08063548 @ =gSpriteCoordOffsetY
	adds r0, r1
	ldrh r2, [r2]
	adds r0, r2
	b _08063574
	.align 2, 0
_08063544: .4byte gSpriteCoordOffsetX
_08063548: .4byte gSpriteCoordOffsetY
_0806354C:
	ldrh r1, [r4, 0x24]
	ldrh r0, [r4, 0x20]
	adds r1, r0
	adds r0, r4, 0
	adds r0, 0x28
	ldrb r0, [r0]
	lsls r0, 24
	asrs r0, 24
	adds r0, r1
	lsls r0, 16
	lsrs r3, r0, 16
	ldrh r1, [r4, 0x26]
	ldrh r0, [r4, 0x22]
	adds r1, r0
	adds r0, r4, 0
	adds r0, 0x29
	ldrb r0, [r0]
	lsls r0, 24
	asrs r0, 24
	adds r0, r1
_08063574:
	lsls r0, 16
	lsrs r2, r0, 16
	ldrh r0, [r6, 0x8]
	adds r0, r3
	lsls r0, 16
	lsrs r1, r0, 16
	ldrh r0, [r6, 0xA]
	adds r0, r2
	lsls r0, 16
	lsrs r4, r0, 16
	lsls r0, r3, 16
	asrs r0, 16
	cmp r0, 0xFF
	bgt _0806359C
	lsls r0, r1, 16
	asrs r0, 16
	movs r1, 0x10
	negs r1, r1
	cmp r0, r1
	bge _080635A4
_0806359C:
	ldrb r0, [r5, 0x1]
	movs r1, 0x40
	orrs r0, r1
	strb r0, [r5, 0x1]
_080635A4:
	lsls r0, r2, 16
	asrs r0, 16
	cmp r0, 0xAF
	bgt _080635B8
	lsls r0, r4, 16
	asrs r0, 16
	movs r1, 0x10
	negs r1, r1
	cmp r0, r1
	bge _080635C0
_080635B8:
	ldrb r0, [r5, 0x1]
	movs r1, 0x40
	orrs r0, r1
	strb r0, [r5, 0x1]
_080635C0:
	pop {r4-r6}
	pop {r0}
	bx r0
	thumb_func_end sub_80634E8

	thumb_func_start npc_update_obj_anim_flag
npc_update_obj_anim_flag: @ 80635C8
	push {lr}
	adds r2, r1, 0
	adds r2, 0x3E
	ldrb r1, [r2]
	movs r3, 0x5
	negs r3, r3
	ands r3, r1
	strb r3, [r2]
	ldrb r1, [r0, 0x1]
	movs r0, 0x60
	ands r0, r1
	cmp r0, 0
	beq _080635EA
	movs r1, 0x4
	adds r0, r3, 0
	orrs r0, r1
	strb r0, [r2]
_080635EA:
	pop {r0}
	bx r0
	thumb_func_end npc_update_obj_anim_flag

	.align 2, 0 @ Don't pad with nop.
