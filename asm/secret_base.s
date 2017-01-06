	.include "constants/gba_constants.inc"
	.include "constants/species_constants.inc"
	.include "asm/macros.inc"

	.syntax unified

	.text

	thumb_func_start sub_80BB4AC
sub_80BB4AC: @ 80BB4AC
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	sub sp, 0x8
	adds r3, r0, 0
	movs r0, 0
	strb r0, [r3]
	movs r2, 0
	adds r4, r3, 0x2
	movs r5, 0xFF
_080BB4C4:
	adds r0, r4, r2
	ldrb r1, [r0]
	orrs r1, r5
	strb r1, [r0]
	adds r0, r2, 0x1
	lsls r0, 16
	lsrs r2, r0, 16
	cmp r2, 0x6
	bls _080BB4C4
	movs r2, 0
	adds r5, r3, 0
	adds r5, 0x12
	adds r6, r3, 0
	adds r6, 0x22
	adds r7, r3, 0
	adds r7, 0x4C
	adds r0, r3, 0
	adds r0, 0x34
	str r0, [sp]
	adds r1, r3, 0
	adds r1, 0x9A
	str r1, [sp, 0x4]
	movs r0, 0x7C
	adds r0, r3
	mov r10, r0
	movs r1, 0x88
	adds r1, r3
	mov r9, r1
	movs r0, 0x94
	adds r0, r3
	mov r8, r0
	adds r1, r3, 0
	adds r1, 0x9
	movs r4, 0
_080BB508:
	adds r0, r1, r2
	strb r4, [r0]
	adds r0, r2, 0x1
	lsls r0, 16
	lsrs r2, r0, 16
	cmp r2, 0x3
	bls _080BB508
	movs r0, 0
	movs r1, 0
	strh r1, [r3, 0xE]
	strb r0, [r3, 0x10]
	strb r0, [r3, 0x11]
	movs r0, 0
	strb r0, [r3, 0x1]
	movs r2, 0
	adds r4, r5, 0
	adds r3, r6, 0
_080BB52A:
	adds r0, r4, r2
	strb r1, [r0]
	adds r0, r3, r2
	strb r1, [r0]
	adds r0, r2, 0x1
	lsls r0, 16
	lsrs r2, r0, 16
	cmp r2, 0xF
	bls _080BB52A
	movs r2, 0
	mov r12, r7
	movs r5, 0
_080BB542:
	movs r1, 0
	adds r7, r2, 0x1
	lsls r4, r2, 2
	lsls r6, r2, 1
	adds r3, r4, 0
_080BB54C:
	adds r0, r3, r1
	lsls r0, 1
	add r0, r12
	strh r5, [r0]
	adds r0, r1, 0x1
	lsls r0, 16
	lsrs r1, r0, 16
	cmp r1, 0x3
	bls _080BB54C
	ldr r1, [sp]
	adds r0, r1, r4
	str r5, [r0]
	ldr r1, [sp, 0x4]
	adds r0, r1, r2
	strb r5, [r0]
	mov r1, r10
	adds r0, r1, r6
	strh r5, [r0]
	mov r1, r9
	adds r0, r1, r6
	strh r5, [r0]
	mov r1, r8
	adds r0, r1, r2
	strb r5, [r0]
	lsls r0, r7, 16
	lsrs r2, r0, 16
	cmp r2, 0x5
	bls _080BB542
	add sp, 0x8
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	thumb_func_end sub_80BB4AC

	thumb_func_start sub_80BB594
sub_80BB594: @ 80BB594
	push {lr}
	adds r1, r0, 0
	lsls r1, 24
	lsrs r1, 24
	lsls r0, r1, 2
	adds r0, r1
	lsls r0, 5
	ldr r1, _080BB5B0 @ =gSaveBlock1 + 0x1A08
	adds r0, r1
	bl sub_80BB4AC
	pop {r0}
	bx r0
	.align 2, 0
_080BB5B0: .4byte gSaveBlock1 + 0x1A08
	thumb_func_end sub_80BB594

	thumb_func_start sub_80BB5B4
sub_80BB5B4: @ 80BB5B4
	push {r4,lr}
	movs r4, 0
_080BB5B8:
	lsls r0, r4, 24
	lsrs r0, 24
	bl sub_80BB594
	adds r0, r4, 0x1
	lsls r0, 16
	lsrs r4, r0, 16
	cmp r4, 0x13
	bls _080BB5B8
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end sub_80BB5B4

	thumb_func_start sub_80BB5D0
sub_80BB5D0: @ 80BB5D0
	ldr r0, _080BB5DC @ =gUnknown_020387DC
	ldr r1, _080BB5E0 @ =gSpecialVar_0x8004
	ldrh r1, [r1]
	strb r1, [r0]
	bx lr
	.align 2, 0
_080BB5DC: .4byte gUnknown_020387DC
_080BB5E0: .4byte gSpecialVar_0x8004
	thumb_func_end sub_80BB5D0

	thumb_func_start sub_80BB5E4
sub_80BB5E4: @ 80BB5E4
	push {r4,lr}
	ldr r0, _080BB5F4 @ =gScriptResult
	movs r1, 0
	strh r1, [r0]
	movs r3, 0
	adds r4, r0, 0
	b _080BB5FE
	.align 2, 0
_080BB5F4: .4byte gScriptResult
_080BB5F8:
	adds r0, r3, 0x1
	lsls r0, 16
	lsrs r3, r0, 16
_080BB5FE:
	cmp r3, 0x13
	bhi _080BB626
	ldr r2, _080BB62C @ =gUnknown_020387DC
	ldr r1, _080BB630 @ =gSaveBlock1
	lsls r0, r3, 2
	adds r0, r3
	lsls r0, 5
	adds r0, r1
	ldr r1, _080BB634 @ =0x00001a08
	adds r0, r1
	ldrb r1, [r2]
	ldrb r0, [r0]
	cmp r1, r0
	bne _080BB5F8
	movs r0, 0x1
	strh r0, [r4]
	ldr r0, _080BB638 @ =0x00004054
	adds r1, r3, 0
	bl VarSet
_080BB626:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080BB62C: .4byte gUnknown_020387DC
_080BB630: .4byte gSaveBlock1
_080BB634: .4byte 0x00001a08
_080BB638: .4byte 0x00004054
	thumb_func_end sub_80BB5E4

	thumb_func_start sub_80BB63C
sub_80BB63C: @ 80BB63C
	push {lr}
	ldr r0, _080BB654 @ =gSaveBlock1
	ldr r1, _080BB658 @ =0x00001a08
	adds r0, r1
	ldrb r1, [r0]
	cmp r1, 0
	beq _080BB660
	ldr r1, _080BB65C @ =gScriptResult
	movs r0, 0x1
	strh r0, [r1]
	b _080BB664
	.align 2, 0
_080BB654: .4byte gSaveBlock1
_080BB658: .4byte 0x00001a08
_080BB65C: .4byte gScriptResult
_080BB660:
	ldr r0, _080BB668 @ =gScriptResult
	strh r1, [r0]
_080BB664:
	pop {r0}
	bx r0
	.align 2, 0
_080BB668: .4byte gScriptResult
	thumb_func_end sub_80BB63C

	thumb_func_start sub_80BB66C
sub_80BB66C: @ 80BB66C
	push {r4,lr}
	sub sp, 0x4
	mov r4, sp
	adds r4, 0x2
	mov r0, sp
	adds r1, r4, 0
	bl GetXYCoordsOneStepInFrontOfPlayer
	mov r0, sp
	movs r1, 0
	ldrsh r0, [r0, r1]
	movs r2, 0
	ldrsh r1, [r4, r2]
	bl MapGridGetMetatileBehaviorAt
	adds r1, r0, 0
	ldr r2, _080BB6A4 @ =0x00000fff
	adds r0, r2, 0
	ands r1, r0
	adds r0, r1, 0
	subs r0, 0x90
	lsls r0, 16
	lsrs r0, 16
	cmp r0, 0x1
	bhi _080BB6A8
	movs r0, 0x1
	b _080BB702
	.align 2, 0
_080BB6A4: .4byte 0x00000fff
_080BB6A8:
	adds r0, r1, 0
	subs r0, 0x92
	lsls r0, 16
	lsrs r0, 16
	cmp r0, 0x1
	bhi _080BB6B8
	movs r0, 0x2
	b _080BB702
_080BB6B8:
	adds r0, r1, 0
	subs r0, 0x9A
	lsls r0, 16
	lsrs r0, 16
	cmp r0, 0x1
	bhi _080BB6C8
	movs r0, 0x3
	b _080BB702
_080BB6C8:
	adds r0, r1, 0
	subs r0, 0x94
	lsls r0, 16
	lsrs r0, 16
	cmp r0, 0x1
	bhi _080BB6D8
	movs r0, 0x4
	b _080BB702
_080BB6D8:
	adds r0, r1, 0
	subs r0, 0x96
	lsls r0, 16
	lsrs r0, 16
	cmp r0, 0x1
	bls _080BB6EC
	cmp r1, 0x9C
	beq _080BB6EC
	cmp r1, 0x9D
	bne _080BB6F0
_080BB6EC:
	movs r0, 0x5
	b _080BB702
_080BB6F0:
	adds r0, r1, 0
	subs r0, 0x98
	lsls r0, 16
	lsrs r0, 16
	cmp r0, 0x1
	bls _080BB700
	movs r0, 0
	b _080BB702
_080BB700:
	movs r0, 0x6
_080BB702:
	add sp, 0x4
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end sub_80BB66C

	thumb_func_start sub_80BB70C
sub_80BB70C: @ 80BB70C
	push {r4,lr}
	ldr r4, _080BB720 @ =gSpecialVar_0x8007
	bl sub_80BB66C
	lsls r0, 24
	lsrs r0, 24
	strh r0, [r4]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080BB720: .4byte gSpecialVar_0x8007
	thumb_func_end sub_80BB70C

	thumb_func_start unref_sub_80BB724
unref_sub_80BB724: @ 80BB724
	push {r4-r6,lr}
	adds r4, r0, 0
	lsls r1, 24
	movs r2, 0
	ldr r6, _080BB748 @ =0x00000fff
	lsrs r3, r1, 24
	ldr r5, _080BB74C @ =0x000001ff
_080BB732:
	lsls r0, r2, 1
	adds r0, r4
	ldrh r1, [r0]
	adds r0, r6, 0
	ands r0, r1
	cmp r0, r3
	bne _080BB750
	lsls r0, r2, 16
	asrs r0, 16
	b _080BB75E
	.align 2, 0
_080BB748: .4byte 0x00000fff
_080BB74C: .4byte 0x000001ff
_080BB750:
	adds r0, r2, 0x1
	lsls r0, 16
	lsrs r2, r0, 16
	cmp r2, r5
	bls _080BB732
	movs r0, 0x1
	negs r0, r0
_080BB75E:
	pop {r4-r6}
	pop {r1}
	bx r1
	thumb_func_end unref_sub_80BB724

	thumb_func_start sub_80BB764
sub_80BB764: @ 80BB764
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	sub sp, 0x8
	mov r9, r0
	mov r10, r1
	lsls r2, 16
	lsrs r2, 16
	mov r8, r2
	movs r0, 0
	mov r12, r0
	ldr r1, _080BB7C8 @ =gMapHeader
	ldr r0, [r1]
	ldr r3, [r0, 0x4]
	cmp r12, r3
	bge _080BB7EE
	ldr r0, [r0]
	str r0, [sp, 0x4]
	str r3, [sp]
_080BB78E:
	movs r2, 0
	mov r1, r12
	lsls r7, r1, 16
	ldr r0, [sp, 0x4]
	cmp r2, r0
	bge _080BB7DC
	ldr r0, _080BB7C8 @ =gMapHeader
	ldr r1, [r0]
	asrs r0, r7, 16
	ldr r4, [r1]
	adds r6, r0, 0
	muls r6, r4
	ldr r5, [r1, 0xC]
_080BB7A8:
	lsls r0, r2, 16
	asrs r3, r0, 16
	adds r0, r6, r3
	lsls r0, 1
	adds r0, r5
	ldrh r1, [r0]
	ldr r0, _080BB7CC @ =0x000003ff
	ands r0, r1
	cmp r0, r8
	bne _080BB7D0
	mov r1, r9
	strh r2, [r1]
	mov r1, r12
	mov r0, r10
	strh r1, [r0]
	b _080BB7EE
	.align 2, 0
_080BB7C8: .4byte gMapHeader
_080BB7CC: .4byte 0x000003ff
_080BB7D0:
	adds r0, r3, 0x1
	lsls r0, 16
	lsrs r2, r0, 16
	asrs r0, 16
	cmp r0, r4
	blt _080BB7A8
_080BB7DC:
	movs r1, 0x80
	lsls r1, 9
	adds r0, r7, r1
	lsrs r1, r0, 16
	mov r12, r1
	asrs r0, 16
	ldr r1, [sp]
	cmp r0, r1
	blt _080BB78E
_080BB7EE:
	add sp, 0x8
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	thumb_func_end sub_80BB764

	thumb_func_start sub_80BB800
sub_80BB800: @ 80BB800
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	sub sp, 0x4
	mov r4, sp
	adds r4, 0x2
	mov r0, sp
	adds r1, r4, 0
	bl GetXYCoordsOneStepInFrontOfPlayer
	mov r0, sp
	movs r1, 0
	ldrsh r0, [r0, r1]
	movs r2, 0
	ldrsh r1, [r4, r2]
	bl MapGridGetMetatileIdAt
	movs r5, 0
	mov r12, r4
	lsls r0, 16
	asrs r3, r0, 16
	ldr r1, _080BB84C @ =gUnknown_083D1358
	mov r8, r1
	adds r7, r0, 0
	mov r4, sp
	mov r6, r12
_080BB834:
	ldr r0, _080BB84C @ =gUnknown_083D1358
	lsls r1, r5, 2
	adds r2, r1, r0
	ldrh r0, [r2]
	cmp r0, r3
	bne _080BB850
	movs r3, 0
	ldrsh r0, [r4, r3]
	movs r5, 0
	ldrsh r1, [r6, r5]
	ldrh r3, [r2, 0x2]
	b _080BB878
	.align 2, 0
_080BB84C: .4byte gUnknown_083D1358
_080BB850:
	adds r0, r5, 0x1
	lsls r0, 16
	lsrs r5, r0, 16
	cmp r5, 0x6
	bls _080BB834
	movs r5, 0
	mov r4, sp
	mov r6, r12
_080BB860:
	lsls r0, r5, 2
	mov r1, r8
	adds r3, r0, r1
	ldrh r1, [r3, 0x2]
	asrs r0, r7, 16
	cmp r1, r0
	bne _080BB892
	movs r2, 0
	ldrsh r0, [r4, r2]
	movs r5, 0
	ldrsh r1, [r6, r5]
	ldrh r3, [r3]
_080BB878:
	movs r5, 0xC0
	lsls r5, 4
	adds r2, r5, 0
	orrs r2, r3
	bl MapGridSetMetatileIdAt
	movs r1, 0
	ldrsh r0, [r4, r1]
	movs r2, 0
	ldrsh r1, [r6, r2]
	bl CurrentMapDrawMetatileAt
	b _080BB89C
_080BB892:
	adds r0, r5, 0x1
	lsls r0, 16
	lsrs r5, r0, 16
	cmp r5, 0x6
	bls _080BB860
_080BB89C:
	add sp, 0x4
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r0}
	bx r0
	thumb_func_end sub_80BB800

	thumb_func_start sub_80BB8A8
sub_80BB8A8: @ 80BB8A8
	push {lr}
	adds r2, r0, 0
	movs r1, 0
_080BB8AE:
	adds r0, r2, r1
	ldrb r0, [r0]
	cmp r0, 0xFF
	bne _080BB8BA
	adds r0, r1, 0
	b _080BB8C6
_080BB8BA:
	adds r0, r1, 0x1
	lsls r0, 24
	lsrs r1, r0, 24
	cmp r1, 0x6
	bls _080BB8AE
	movs r0, 0x7
_080BB8C6:
	pop {r1}
	bx r1
	thumb_func_end sub_80BB8A8

	thumb_func_start sub_80BB8CC
sub_80BB8CC: @ 80BB8CC
	push {r4-r6,lr}
	ldr r2, _080BB948 @ =gSaveBlock1
	ldr r0, _080BB94C @ =gUnknown_020387DC
	ldrb r1, [r0]
	ldr r3, _080BB950 @ =0x00001a08
	adds r0, r2, r3
	strb r1, [r0]
	movs r3, 0
	ldr r0, _080BB954 @ =0x00001a11
	adds r2, r0
	ldr r4, _080BB958 @ =gSaveBlock2 + 0xA
_080BB8E2:
	adds r1, r3, r2
	adds r0, r3, r4
	ldrb r0, [r0]
	strb r0, [r1]
	adds r0, r3, 0x1
	lsls r0, 16
	lsrs r3, r0, 16
	cmp r3, 0x3
	bls _080BB8E2
	ldr r0, _080BB95C @ =0x00004054
	movs r1, 0
	bl VarSet
	ldr r6, _080BB960 @ =gSaveBlock2
	adds r0, r6, 0
	bl sub_80BB8A8
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	ldr r5, _080BB964 @ =gSaveBlock1 + 0x1A0A
	adds r0, r5, 0
	movs r1, 0xFF
	movs r2, 0x7
	bl memset
	adds r0, r5, 0
	adds r1, r6, 0
	adds r2, r4, 0
	bl StringCopyN
	ldrb r0, [r6, 0x8]
	subs r5, 0x1
	movs r1, 0x1
	ands r1, r0
	lsls r1, 4
	ldrb r2, [r5]
	movs r0, 0x11
	negs r0, r0
	ands r0, r2
	orrs r0, r1
	strb r0, [r5]
	ldr r0, _080BB968 @ =0x00004026
	ldr r1, _080BB96C @ =gMapHeader
	ldrb r1, [r1, 0x14]
	bl VarSet
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_080BB948: .4byte gSaveBlock1
_080BB94C: .4byte gUnknown_020387DC
_080BB950: .4byte 0x00001a08
_080BB954: .4byte 0x00001a11
_080BB958: .4byte gSaveBlock2 + 0xA
_080BB95C: .4byte 0x00004054
_080BB960: .4byte gSaveBlock2
_080BB964: .4byte gSaveBlock1 + 0x1A0A
_080BB968: .4byte 0x00004026
_080BB96C: .4byte gMapHeader
	thumb_func_end sub_80BB8CC

	thumb_func_start sub_80BB970
sub_80BB970: @ 80BB970
	push {r4-r7,lr}
	adds r5, r0, 0
	movs r2, 0
	b _080BBA06
_080BB978:
	ldr r0, [r5, 0x10]
	lsls r1, r2, 1
	adds r1, r2
	lsls r1, 2
	adds r3, r1, r0
	ldrb r0, [r3, 0x5]
	adds r7, r2, 0x1
	cmp r0, 0x8
	bne _080BBA02
	movs r2, 0
	ldr r4, _080BB9E0 @ =gSaveBlock1
	adds r6, r1, 0
_080BB990:
	lsls r0, r2, 2
	adds r0, r2
	lsls r0, 5
	adds r0, r4
	ldr r1, _080BB9E4 @ =0x00001a08
	adds r0, r1
	ldrb r1, [r0]
	ldr r0, [r3, 0x8]
	cmp r1, r0
	bne _080BB9F8
	ldrh r0, [r3]
	adds r0, 0x7
	ldrh r1, [r3, 0x2]
	adds r1, 0x7
	bl MapGridGetMetatileIdAt
	movs r3, 0
	lsls r0, 16
	asrs r4, r0, 16
_080BB9B6:
	ldr r0, _080BB9E8 @ =gUnknown_083D1358
	lsls r1, r3, 2
	adds r2, r1, r0
	ldrh r0, [r2]
	cmp r0, r4
	bne _080BB9EC
	ldr r1, [r5, 0x10]
	adds r1, r6, r1
	ldrh r0, [r1]
	adds r0, 0x7
	ldrh r1, [r1, 0x2]
	adds r1, 0x7
	ldrh r3, [r2, 0x2]
	movs r4, 0xC0
	lsls r4, 4
	adds r2, r4, 0
	orrs r2, r3
	bl MapGridSetMetatileIdAt
	b _080BBA02
	.align 2, 0
_080BB9E0: .4byte gSaveBlock1
_080BB9E4: .4byte 0x00001a08
_080BB9E8: .4byte gUnknown_083D1358
_080BB9EC:
	adds r0, r3, 0x1
	lsls r0, 16
	lsrs r3, r0, 16
	cmp r3, 0x6
	bls _080BB9B6
	b _080BBA02
_080BB9F8:
	adds r0, r2, 0x1
	lsls r0, 16
	lsrs r2, r0, 16
	cmp r2, 0x13
	bls _080BB990
_080BBA02:
	lsls r0, r7, 16
	lsrs r2, r0, 16
_080BBA06:
	ldrb r0, [r5, 0x3]
	cmp r2, r0
	bcc _080BB978
	pop {r4-r7}
	pop {r0}
	bx r0
	thumb_func_end sub_80BB970

	thumb_func_start sub_80BBA14
sub_80BBA14: @ 80BBA14
	push {lr}
	ldr r0, _080BBA40 @ =gUnknown_020387DC
	ldrb r0, [r0]
	movs r1, 0xA
	bl __udivsi3
	ldr r2, _080BBA44 @ =gUnknown_083D1374
	lsls r0, 26
	asrs r0, 24
	adds r1, r0, r2
	ldrb r1, [r1]
	lsls r1, 24
	asrs r1, 24
	adds r0, 0x1
	adds r0, r2
	movs r2, 0
	ldrsb r2, [r0, r2]
	movs r0, 0x19
	bl warp1_set_2
	pop {r0}
	bx r0
	.align 2, 0
_080BBA40: .4byte gUnknown_020387DC
_080BBA44: .4byte gUnknown_083D1374
	thumb_func_end sub_80BBA14

	thumb_func_start sub_80BBA48
sub_80BBA48: @ 80BBA48
	push {r4,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	ldr r1, _080BBA6C @ =gTasks
	lsls r0, r4, 2
	adds r0, r4
	lsls r0, 3
	adds r2, r0, r1
	movs r1, 0x8
	ldrsh r0, [r2, r1]
	cmp r0, 0x1
	beq _080BBA7C
	cmp r0, 0x1
	bgt _080BBA70
	cmp r0, 0
	beq _080BBA76
	b _080BBAD0
	.align 2, 0
_080BBA6C: .4byte gTasks
_080BBA70:
	cmp r0, 0x2
	beq _080BBA94
	b _080BBAD0
_080BBA76:
	movs r0, 0x1
	strh r0, [r2, 0x8]
	b _080BBAD0
_080BBA7C:
	ldr r0, _080BBA90 @ =gPaletteFade
	ldrb r1, [r0, 0x7]
	movs r0, 0x80
	ands r0, r1
	cmp r0, 0
	bne _080BBAD0
	movs r0, 0x2
	strh r0, [r2, 0x8]
	b _080BBAD0
	.align 2, 0
_080BBA90: .4byte gPaletteFade
_080BBA94:
	ldr r0, _080BBAD8 @ =0x00004054
	bl VarGet
	lsls r0, 16
	lsrs r0, 16
	ldr r2, _080BBADC @ =gSaveBlock1
	lsls r1, r0, 2
	adds r1, r0
	lsls r1, 5
	adds r1, r2
	ldr r0, _080BBAE0 @ =0x00001a18
	adds r1, r0
	ldrb r0, [r1]
	cmp r0, 0xFE
	bhi _080BBAB6
	adds r0, 0x1
	strb r0, [r1]
_080BBAB6:
	bl sub_80BBA14
	bl warp_in
	ldr r0, _080BBAE4 @ =gUnknown_0300485C
	ldr r1, _080BBAE8 @ =sub_8080990
	str r1, [r0]
	ldr r0, _080BBAEC @ =CB2_LoadMap
	bl SetMainCallback2
	adds r0, r4, 0
	bl DestroyTask
_080BBAD0:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080BBAD8: .4byte 0x00004054
_080BBADC: .4byte gSaveBlock1
_080BBAE0: .4byte 0x00001a18
_080BBAE4: .4byte gUnknown_0300485C
_080BBAE8: .4byte sub_8080990
_080BBAEC: .4byte CB2_LoadMap
	thumb_func_end sub_80BBA48

	thumb_func_start sub_80BBAF0
sub_80BBAF0: @ 80BBAF0
	push {lr}
	ldr r0, _080BBB1C @ =sub_80BBA48
	movs r1, 0
	bl CreateTask
	movs r0, 0x1
	movs r1, 0
	bl fade_screen
	ldr r0, _080BBB20 @ =gSaveBlock1
	movs r1, 0x4
	ldrsb r1, [r0, r1]
	movs r2, 0x5
	ldrsb r2, [r0, r2]
	movs r3, 0x1
	negs r3, r3
	movs r0, 0
	bl saved_warp2_set
	pop {r0}
	bx r0
	.align 2, 0
_080BBB1C: .4byte sub_80BBA48
_080BBB20: .4byte gSaveBlock1
	thumb_func_end sub_80BBAF0

	thumb_func_start sub_80BBB24
sub_80BBB24: @ 80BBB24
	push {lr}
	ldr r0, _080BBB40 @ =gMapHeader
	ldrb r0, [r0, 0x17]
	cmp r0, 0x9
	bne _080BBB48
	ldr r0, _080BBB44 @ =0x00004097
	bl VarGet
	lsls r0, 16
	cmp r0, 0
	bne _080BBB48
	movs r0, 0
	b _080BBB4A
	.align 2, 0
_080BBB40: .4byte gMapHeader
_080BBB44: .4byte 0x00004097
_080BBB48:
	movs r0, 0x1
_080BBB4A:
	pop {r1}
	bx r1
	thumb_func_end sub_80BBB24

	thumb_func_start sub_80BBB50
sub_80BBB50: @ 80BBB50
	push {r4,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	ldr r0, _080BBB88 @ =gPlayerAvatar
	ldrb r1, [r0, 0x5]
	lsls r0, r1, 3
	adds r0, r1
	lsls r0, 2
	ldr r1, _080BBB8C @ =gMapObjects
	adds r0, r1
	movs r1, 0x2
	bl FieldObjectTurn
	bl sub_807D770
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _080BBB80
	bl EnableBothScriptContexts
	adds r0, r4, 0
	bl DestroyTask
_080BBB80:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080BBB88: .4byte gPlayerAvatar
_080BBB8C: .4byte gMapObjects
	thumb_func_end sub_80BBB50

	thumb_func_start sub_80BBB90
sub_80BBB90: @ 80BBB90
	push {r4,lr}
	sub sp, 0x4
	bl ScriptContext2_Enable
	bl HideMapNamePopUpWindow
	mov r4, sp
	adds r4, 0x2
	movs r2, 0x88
	lsls r2, 2
	mov r0, sp
	adds r1, r4, 0
	bl sub_80BB764
	mov r0, sp
	movs r1, 0
	ldrsh r0, [r0, r1]
	adds r0, 0x7
	movs r2, 0
	ldrsh r1, [r4, r2]
	adds r1, 0x7
	movs r2, 0xE2
	lsls r2, 4
	bl MapGridSetMetatileIdAt
	mov r0, sp
	movs r1, 0
	ldrsh r0, [r0, r1]
	adds r0, 0x7
	movs r2, 0
	ldrsh r1, [r4, r2]
	adds r1, 0x7
	bl CurrentMapDrawMetatileAt
	bl pal_fill_black
	ldr r0, _080BBBE8 @ =sub_80BBB50
	movs r1, 0
	bl CreateTask
	add sp, 0x4
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080BBBE8: .4byte sub_80BBB50
	thumb_func_end sub_80BBB90

	thumb_func_start sub_80BBBEC
sub_80BBBEC: @ 80BBBEC
	push {r4-r6,lr}
	sub sp, 0x4
	lsls r0, 24
	lsrs r6, r0, 24
	ldr r0, _080BBC5C @ =gPaletteFade
	ldrb r1, [r0, 0x7]
	movs r0, 0x80
	ands r0, r1
	cmp r0, 0
	bne _080BBC52
	ldr r0, _080BBC60 @ =gUnknown_020387DC
	ldrb r0, [r0]
	movs r1, 0xA
	bl __udivsi3
	ldr r1, _080BBC64 @ =gSaveBlock1
	movs r5, 0x4
	ldrsb r5, [r1, r5]
	ldrb r1, [r1, 0x5]
	lsls r1, 24
	asrs r1, 24
	movs r2, 0x1
	negs r2, r2
	ldr r4, _080BBC68 @ =gUnknown_083D1374
	lsls r0, 26
	asrs r0, 24
	adds r3, r0, 0x2
	adds r3, r4
	ldrb r3, [r3]
	lsls r3, 24
	asrs r3, 24
	adds r0, 0x3
	adds r0, r4
	ldrb r0, [r0]
	lsls r0, 24
	asrs r0, 24
	str r0, [sp]
	adds r0, r5, 0
	bl warp1_set
	bl warp_in
	ldr r1, _080BBC6C @ =gUnknown_0300485C
	ldr r0, _080BBC70 @ =sub_80BBB90
	str r0, [r1]
	ldr r0, _080BBC74 @ =CB2_LoadMap
	bl SetMainCallback2
	adds r0, r6, 0
	bl DestroyTask
_080BBC52:
	add sp, 0x4
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_080BBC5C: .4byte gPaletteFade
_080BBC60: .4byte gUnknown_020387DC
_080BBC64: .4byte gSaveBlock1
_080BBC68: .4byte gUnknown_083D1374
_080BBC6C: .4byte gUnknown_0300485C
_080BBC70: .4byte sub_80BBB90
_080BBC74: .4byte CB2_LoadMap
	thumb_func_end sub_80BBBEC

	thumb_func_start sub_80BBC78
sub_80BBC78: @ 80BBC78
	push {lr}
	ldr r0, _080BBCA0 @ =sub_80BBBEC
	movs r1, 0
	bl CreateTask
	lsls r0, 24
	lsrs r0, 24
	ldr r2, _080BBCA4 @ =gTasks
	lsls r1, r0, 2
	adds r1, r0
	lsls r1, 3
	adds r1, r2
	movs r0, 0
	strh r0, [r1, 0x8]
	movs r0, 0x1
	movs r1, 0
	bl fade_screen
	pop {r0}
	bx r0
	.align 2, 0
_080BBCA0: .4byte sub_80BBBEC
_080BBCA4: .4byte gTasks
	thumb_func_end sub_80BBC78

	thumb_func_start CurrentMapIsSecretBase
CurrentMapIsSecretBase: @ 80BBCA8
	push {lr}
	ldr r1, _080BBCC0 @ =gSaveBlock1
	movs r0, 0x4
	ldrsb r0, [r1, r0]
	cmp r0, 0x19
	bne _080BBCC4
	ldrb r0, [r1, 0x5]
	cmp r0, 0x17
	bhi _080BBCC4
	movs r0, 0x1
	b _080BBCC6
	.align 2, 0
_080BBCC0: .4byte gSaveBlock1
_080BBCC4:
	movs r0, 0
_080BBCC6:
	pop {r1}
	bx r1
	thumb_func_end CurrentMapIsSecretBase

	thumb_func_start sub_80BBCCC
sub_80BBCCC: @ 80BBCCC
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	sub sp, 0x4
	lsls r0, 24
	lsrs r0, 24
	mov r8, r0
	bl CurrentMapIsSecretBase
	lsls r0, 24
	cmp r0, 0
	beq _080BBDBC
	ldr r0, _080BBD70 @ =0x00004054
	bl VarGet
	lsls r0, 16
	lsrs r5, r0, 16
	movs r1, 0
	mov r0, sp
	strh r1, [r0]
	ldr r6, _080BBD74 @ =gSaveBlock1
	mov r4, sp
	ldr r0, _080BBD78 @ =0x00001a2a
	adds r7, r6, r0
_080BBCFC:
	lsls r0, r5, 2
	adds r0, r5
	lsls r0, 5
	ldrh r1, [r4]
	adds r2, r0, r1
	ldr r1, _080BBD7C @ =0x00001a1a
	adds r0, r6, r1
	adds r1, r2, r0
	ldrb r0, [r1]
	subs r0, 0x1
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x77
	bhi _080BBD3A
	ldr r0, _080BBD80 @ =gDecorations
	ldrb r3, [r1]
	lsls r1, r3, 5
	adds r1, r0
	ldrb r0, [r1, 0x11]
	cmp r0, 0x4
	beq _080BBD3A
	adds r0, r2, r7
	ldrb r2, [r0]
	lsrs r0, r2, 4
	adds r0, 0x7
	movs r1, 0xF
	ands r1, r2
	adds r1, 0x7
	adds r2, r3, 0
	bl sub_80FF394
_080BBD3A:
	ldrh r0, [r4]
	adds r0, 0x1
	lsls r0, 16
	lsrs r0, 16
	strh r0, [r4]
	cmp r0, 0xF
	bls _080BBCFC
	cmp r5, 0
	beq _080BBD88
	mov r4, sp
	adds r4, 0x2
	movs r2, 0x88
	lsls r2, 2
	mov r0, sp
	adds r1, r4, 0
	bl sub_80BB764
	mov r0, sp
	ldrh r0, [r0]
	adds r0, 0x7
	ldrh r1, [r4]
	adds r1, 0x7
	ldr r2, _080BBD84 @ =0x00000e21
	bl MapGridSetMetatileIdAt
	b _080BBDBC
	.align 2, 0
_080BBD70: .4byte 0x00004054
_080BBD74: .4byte gSaveBlock1
_080BBD78: .4byte 0x00001a2a
_080BBD7C: .4byte 0x00001a1a
_080BBD80: .4byte gDecorations
_080BBD84: .4byte 0x00000e21
_080BBD88:
	mov r0, r8
	cmp r0, 0x1
	bne _080BBDBC
	ldr r0, _080BBDC8 @ =0x00004089
	bl VarGet
	lsls r0, 16
	lsrs r0, 16
	cmp r0, 0x1
	bne _080BBDBC
	mov r4, sp
	adds r4, 0x2
	movs r2, 0x88
	lsls r2, 2
	mov r0, sp
	adds r1, r4, 0
	bl sub_80BB764
	mov r0, sp
	ldrh r0, [r0]
	adds r0, 0x7
	ldrh r1, [r4]
	adds r1, 0x7
	ldr r2, _080BBDCC @ =0x00000e0a
	bl MapGridSetMetatileIdAt
_080BBDBC:
	add sp, 0x4
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080BBDC8: .4byte 0x00004089
_080BBDCC: .4byte 0x00000e0a
	thumb_func_end sub_80BBCCC

	thumb_func_start sub_80BBDD0
sub_80BBDD0: @ 80BBDD0
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	sub sp, 0x14
	ldr r0, _080BBE00 @ =0x00004054
	bl VarGet
	lsls r0, 16
	lsrs r4, r0, 16
	bl CurrentMapIsSecretBase
	lsls r0, 24
	cmp r0, 0
	bne _080BBE08
	ldr r0, _080BBE04 @ =gSaveBlock1 + 0x2688
	str r0, [sp, 0x4]
	adds r0, 0xC
	str r0, [sp, 0x8]
	movs r1, 0xC
	str r1, [sp, 0xC]
	b _080BBE1E
	.align 2, 0
_080BBE00: .4byte 0x00004054
_080BBE04: .4byte gSaveBlock1 + 0x2688
_080BBE08:
	lsls r1, r4, 2
	adds r1, r4
	lsls r1, 5
	ldr r0, _080BBF7C @ =gSaveBlock1 + 0x1A1A
	adds r2, r1, r0
	str r2, [sp, 0x4]
	adds r0, 0x10
	adds r1, r0
	str r1, [sp, 0x8]
	movs r3, 0x10
	str r3, [sp, 0xC]
_080BBE1E:
	movs r6, 0
	ldr r4, [sp, 0xC]
	cmp r6, r4
	bcc _080BBE28
	b _080BBF6C
_080BBE28:
	ldr r5, _080BBF80 @ =gSaveBlock1
	mov r10, r5
_080BBE2C:
	ldr r1, [sp, 0x4]
	adds r0, r1, r6
	ldrb r1, [r0]
	mov r9, r0
	adds r2, r6, 0x1
	str r2, [sp, 0x10]
	cmp r1, 0
	bne _080BBE3E
	b _080BBF5E
_080BBE3E:
	ldrb r0, [r0]
	lsls r0, 5
	ldr r3, _080BBF84 @ =gDecorations
	adds r0, r3
	ldrb r0, [r0, 0x11]
	cmp r0, 0x4
	beq _080BBE4E
	b _080BBF5E
_080BBE4E:
	movs r5, 0
	ldr r0, _080BBF88 @ =gMapHeader
	ldr r2, [r0, 0x4]
	ldrb r3, [r2]
	mov r8, r0
	cmp r5, r3
	bcs _080BBE8E
	ldr r0, [r2, 0x4]
	ldrh r1, [r0, 0x14]
	ldr r4, _080BBF8C @ =gSpecialVar_0x8004
	ldrh r0, [r4]
	adds r0, 0xAE
	adds r7, r4, 0
	cmp r1, r0
	beq _080BBE8E
	adds r4, r2, 0
	adds r2, r3, 0
_080BBE70:
	adds r0, r5, 0x1
	lsls r0, 24
	lsrs r5, r0, 24
	cmp r5, r2
	bcs _080BBE8E
	ldr r1, [r4, 0x4]
	lsls r0, r5, 1
	adds r0, r5
	lsls r0, 3
	adds r0, r1
	ldrh r1, [r0, 0x14]
	ldrh r0, [r7]
	adds r0, 0xAE
	cmp r1, r0
	bne _080BBE70
_080BBE8E:
	mov r1, r8
	ldr r0, [r1, 0x4]
	ldrb r0, [r0]
	cmp r5, r0
	beq _080BBF5E
	ldr r7, _080BBF90 @ =gSpecialVar_0x8006
	ldr r2, [sp, 0x8]
	adds r1, r2, r6
	ldrb r0, [r1]
	lsrs r0, 4
	strh r0, [r7]
	ldr r6, _080BBF94 @ =gSpecialVar_0x8007
	ldrb r1, [r1]
	movs r0, 0xF
	ands r0, r1
	strh r0, [r6]
	ldrh r0, [r7]
	adds r0, 0x7
	ldrh r1, [r6]
	adds r1, 0x7
	bl MapGridGetMetatileBehaviorAt
	lsls r0, 24
	lsrs r4, r0, 24
	adds r0, r4, 0
	bl sub_80572D8
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	beq _080BBEDA
	adds r0, r4, 0
	bl sub_80572EC
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _080BBF5E
_080BBEDA:
	mov r3, r8
	ldr r0, [r3, 0x4]
	ldr r1, [r0, 0x4]
	lsls r4, r5, 1
	adds r4, r5
	lsls r4, 3
	adds r1, r4, r1
	ldr r5, _080BBF98 @ =0x00003f20
	adds r0, r5, 0
	ldrb r1, [r1, 0x1]
	adds r0, r1
	ldr r1, _080BBF9C @ =gScriptResult
	strh r0, [r1]
	ldrh r0, [r1]
	mov r2, r9
	ldrb r1, [r2]
	lsls r1, 5
	ldr r3, _080BBFA0 @ =gDecorations + 0x1C
	adds r1, r3
	ldr r1, [r1]
	ldrh r1, [r1]
	bl VarSet
	mov r5, r8
	ldr r0, [r5, 0x4]
	ldr r0, [r0, 0x4]
	adds r4, r0
	ldrb r0, [r4]
	ldr r1, _080BBF9C @ =gScriptResult
	strh r0, [r1]
	ldr r2, _080BBF8C @ =gSpecialVar_0x8004
	ldrh r0, [r2]
	adds r0, 0xAE
	lsls r0, 16
	lsrs r0, 16
	bl FlagReset
	ldr r3, _080BBF9C @ =gScriptResult
	ldrb r0, [r3]
	mov r4, r10
	ldrb r1, [r4, 0x5]
	ldrb r2, [r4, 0x4]
	bl show_sprite
	ldr r5, _080BBF9C @ =gScriptResult
	ldrb r0, [r5]
	ldrb r1, [r4, 0x5]
	ldrb r2, [r4, 0x4]
	movs r4, 0
	ldrsh r3, [r7, r4]
	movs r5, 0
	ldrsh r4, [r6, r5]
	str r4, [sp]
	bl sub_805C0F8
	ldr r1, _080BBF9C @ =gScriptResult
	ldrb r0, [r1]
	mov r2, r10
	ldrb r1, [r2, 0x5]
	ldrb r2, [r2, 0x4]
	bl sub_805C78C
	ldr r3, _080BBF8C @ =gSpecialVar_0x8004
	ldrh r0, [r3]
	adds r0, 0x1
	strh r0, [r3]
_080BBF5E:
	ldr r4, [sp, 0x10]
	lsls r0, r4, 24
	lsrs r6, r0, 24
	ldr r5, [sp, 0xC]
	cmp r6, r5
	bcs _080BBF6C
	b _080BBE2C
_080BBF6C:
	add sp, 0x14
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080BBF7C: .4byte gSaveBlock1 + 0x1A1A
_080BBF80: .4byte gSaveBlock1
_080BBF84: .4byte gDecorations
_080BBF88: .4byte gMapHeader
_080BBF8C: .4byte gSpecialVar_0x8004
_080BBF90: .4byte gSpecialVar_0x8006
_080BBF94: .4byte gSpecialVar_0x8007
_080BBF98: .4byte 0x00003f20
_080BBF9C: .4byte gScriptResult
_080BBFA0: .4byte gDecorations + 0x1C
	thumb_func_end sub_80BBDD0

	thumb_func_start sub_80BBFA4
sub_80BBFA4: @ 80BBFA4
	push {r4,r5,lr}
	ldr r0, _080BBFCC @ =0x00004054
	bl VarGet
	ldr r5, _080BBFD0 @ =0x0000401f
	ldr r4, _080BBFD4 @ =gUnknown_083D13EC
	lsls r0, 24
	lsrs r0, 24
	bl sub_80BCCA4
	lsls r0, 24
	lsrs r0, 24
	adds r0, r4
	ldrb r1, [r0]
	adds r0, r5, 0
	bl VarSet
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080BBFCC: .4byte 0x00004054
_080BBFD0: .4byte 0x0000401f
_080BBFD4: .4byte gUnknown_083D13EC
	thumb_func_end sub_80BBFA4

	thumb_func_start sub_80BBFD8
sub_80BBFD8: @ 80BBFD8
	push {r4-r6,lr}
	adds r5, r0, 0
	adds r4, r1, 0
	movs r3, 0
	ldrb r0, [r4, 0x3]
	cmp r3, r0
	bge _080BC030
	ldr r6, _080BC01C @ =gUnknown_020387DC
_080BBFE8:
	lsls r3, 16
	asrs r1, r3, 16
	ldr r2, [r4, 0x10]
	lsls r0, r1, 1
	adds r0, r1
	lsls r0, 2
	adds r2, r0, r2
	ldrb r0, [r2, 0x5]
	cmp r0, 0x8
	bne _080BC020
	movs r0, 0
	ldrsh r1, [r5, r0]
	ldrh r0, [r2]
	adds r0, 0x7
	cmp r1, r0
	bne _080BC020
	movs r0, 0x2
	ldrsh r1, [r5, r0]
	ldrh r0, [r2, 0x2]
	adds r0, 0x7
	cmp r1, r0
	bne _080BC020
	ldr r0, [r2, 0x8]
	strb r0, [r6]
	b _080BC030
	.align 2, 0
_080BC01C: .4byte gUnknown_020387DC
_080BC020:
	movs r1, 0x80
	lsls r1, 9
	adds r0, r3, r1
	lsrs r3, r0, 16
	asrs r0, 16
	ldrb r1, [r4, 0x3]
	cmp r0, r1
	blt _080BBFE8
_080BC030:
	pop {r4-r6}
	pop {r0}
	bx r0
	thumb_func_end sub_80BBFD8

	thumb_func_start sub_80BC038
sub_80BC038: @ 80BC038
	push {lr}
	bl sub_80BBFD8
	bl sub_80BB5E4
	ldr r0, _080BC04C @ =gUnknown_081A2E14
	bl ScriptContext1_SetupScript
	pop {r0}
	bx r0
	.align 2, 0
_080BC04C: .4byte gUnknown_081A2E14
	thumb_func_end sub_80BC038

	thumb_func_start sub_80BC050
sub_80BC050: @ 80BC050
	push {lr}
	bl sub_80BB5D0
	bl sub_80BB5E4
	ldr r0, _080BC068 @ =gScriptResult
	ldrh r0, [r0]
	cmp r0, 0x1
	beq _080BC06C
	movs r0, 0x1
	b _080BC06E
	.align 2, 0
_080BC068: .4byte gScriptResult
_080BC06C:
	movs r0, 0
_080BC06E:
	pop {r1}
	bx r1
	thumb_func_end sub_80BC050

	thumb_func_start sub_80BC074
sub_80BC074: @ 80BC074
	push {r4,r5,lr}
	lsls r0, 24
	lsrs r5, r0, 24
	ldr r1, _080BC098 @ =gTasks
	lsls r0, r5, 2
	adds r0, r5
	lsls r0, 3
	adds r4, r0, r1
	movs r1, 0x8
	ldrsh r0, [r4, r1]
	cmp r0, 0x1
	beq _080BC0AC
	cmp r0, 0x1
	bgt _080BC09C
	cmp r0, 0
	beq _080BC0A2
	b _080BC0E4
	.align 2, 0
_080BC098: .4byte gTasks
_080BC09C:
	cmp r0, 0x2
	beq _080BC0C4
	b _080BC0E4
_080BC0A2:
	bl ScriptContext2_Enable
	movs r0, 0x1
	strh r0, [r4, 0x8]
	b _080BC0E4
_080BC0AC:
	ldr r0, _080BC0C0 @ =gPaletteFade
	ldrb r1, [r0, 0x7]
	movs r0, 0x80
	ands r0, r1
	cmp r0, 0
	bne _080BC0E4
	movs r0, 0x2
	strh r0, [r4, 0x8]
	b _080BC0E4
	.align 2, 0
_080BC0C0: .4byte gPaletteFade
_080BC0C4:
	movs r0, 0x7E
	bl copy_saved_warp2_bank_and_enter_x_to_warp1
	bl warp_in
	ldr r0, _080BC0EC @ =gUnknown_0300485C
	ldr r1, _080BC0F0 @ =mapldr_default
	str r1, [r0]
	ldr r0, _080BC0F4 @ =CB2_LoadMap
	bl SetMainCallback2
	bl ScriptContext2_Disable
	adds r0, r5, 0
	bl DestroyTask
_080BC0E4:
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080BC0EC: .4byte gUnknown_0300485C
_080BC0F0: .4byte mapldr_default
_080BC0F4: .4byte CB2_LoadMap
	thumb_func_end sub_80BC074

	thumb_func_start sub_80BC0F8
sub_80BC0F8: @ 80BC0F8
	push {lr}
	ldr r0, _080BC110 @ =sub_80BC074
	movs r1, 0
	bl CreateTask
	movs r0, 0x1
	movs r1, 0
	bl fade_screen
	pop {r0}
	bx r0
	.align 2, 0
_080BC110: .4byte sub_80BC074
	thumb_func_end sub_80BC0F8

	thumb_func_start sub_80BC114
sub_80BC114: @ 80BC114
	push {lr}
	ldr r0, _080BC12C @ =gSaveBlock1
	ldr r1, _080BC130 @ =0x00001a08
	adds r0, r1
	ldr r1, _080BC134 @ =gUnknown_020387DC
	ldrb r0, [r0]
	ldrb r1, [r1]
	cmp r0, r1
	beq _080BC13C
	ldr r1, _080BC138 @ =gScriptResult
	movs r0, 0x1
	b _080BC140
	.align 2, 0
_080BC12C: .4byte gSaveBlock1
_080BC130: .4byte 0x00001a08
_080BC134: .4byte gUnknown_020387DC
_080BC138: .4byte gScriptResult
_080BC13C:
	ldr r1, _080BC148 @ =gScriptResult
	movs r0, 0
_080BC140:
	strh r0, [r1]
	pop {r0}
	bx r0
	.align 2, 0
_080BC148: .4byte gScriptResult
	thumb_func_end sub_80BC114

	thumb_func_start sub_80BC14C
sub_80BC14C: @ 80BC14C
	push {r4,r5,lr}
	lsls r0, 24
	lsrs r3, r0, 24
	movs r2, 0
	ldr r5, _080BC174 @ =gSaveBlock1
	ldr r4, _080BC178 @ =0x00001a08
_080BC158:
	lsls r0, r2, 16
	asrs r1, r0, 16
	lsls r0, r1, 2
	adds r0, r1
	lsls r0, 5
	adds r0, r5
	adds r0, r4
	ldrb r0, [r0]
	cmp r0, r3
	bne _080BC17C
	lsls r0, r2, 24
	lsrs r0, 24
	b _080BC18A
	.align 2, 0
_080BC174: .4byte gSaveBlock1
_080BC178: .4byte 0x00001a08
_080BC17C:
	adds r0, r1, 0x1
	lsls r0, 16
	lsrs r2, r0, 16
	asrs r0, 16
	cmp r0, 0x13
	ble _080BC158
	movs r0, 0
_080BC18A:
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end sub_80BC14C

	thumb_func_start sub_80BC190
sub_80BC190: @ 80BC190
	push {r4,r5,lr}
	adds r5, r0, 0
	lsls r1, 24
	lsrs r1, 24
	lsls r4, r1, 2
	adds r4, r1
	lsls r4, 5
	ldr r0, _080BC1C8 @ =gSaveBlock1 + 0x1A0A
	adds r4, r0
	adds r0, r4, 0
	bl sub_80BB8A8
	adds r2, r0, 0
	lsls r2, 24
	lsrs r2, 24
	adds r0, r5, 0
	adds r1, r4, 0
	bl StringCopyN
	movs r1, 0xFF
	strb r1, [r0]
	ldr r1, _080BC1CC @ =gOtherText_PlayersBase
	adds r0, r5, 0
	bl StringAppend
	pop {r4,r5}
	pop {r1}
	bx r1
	.align 2, 0
_080BC1C8: .4byte gSaveBlock1 + 0x1A0A
_080BC1CC: .4byte gOtherText_PlayersBase
	thumb_func_end sub_80BC190

	thumb_func_start GetSecretBaseMapName
GetSecretBaseMapName: @ 80BC1D0
	push {r4-r6,lr}
	mov r6, r8
	push {r6}
	mov r8, r0
	ldr r6, _080BC214 @ =gUnknown_020387DC
	ldr r5, _080BC218 @ =gSaveBlock1
	ldr r4, _080BC21C @ =0x00004054
	adds r0, r4, 0
	bl VarGet
	lsls r0, 16
	lsrs r0, 16
	lsls r1, r0, 2
	adds r1, r0
	lsls r1, 5
	adds r1, r5
	ldr r0, _080BC220 @ =0x00001a08
	adds r1, r0
	ldrb r0, [r1]
	strb r0, [r6]
	adds r0, r4, 0
	bl VarGet
	adds r1, r0, 0
	lsls r1, 24
	lsrs r1, 24
	mov r0, r8
	bl sub_80BC190
	pop {r3}
	mov r8, r3
	pop {r4-r6}
	pop {r1}
	bx r1
	.align 2, 0
_080BC214: .4byte gUnknown_020387DC
_080BC218: .4byte gSaveBlock1
_080BC21C: .4byte 0x00004054
_080BC220: .4byte 0x00001a08
	thumb_func_end GetSecretBaseMapName

	thumb_func_start sub_80BC224
sub_80BC224: @ 80BC224
	push {r4,r5,lr}
	ldr r0, _080BC25C @ =0x00004054
	bl VarGet
	lsls r0, 24
	lsrs r0, 24
	lsls r4, r0, 2
	adds r4, r0
	lsls r4, 5
	ldr r0, _080BC260 @ =gSaveBlock1 + 0x1A0A
	adds r4, r0
	ldr r5, _080BC264 @ =gStringVar1
	adds r0, r4, 0
	bl sub_80BB8A8
	adds r2, r0, 0
	lsls r2, 24
	lsrs r2, 24
	adds r0, r5, 0
	adds r1, r4, 0
	bl StringCopyN
	movs r1, 0xFF
	strb r1, [r0]
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080BC25C: .4byte 0x00004054
_080BC260: .4byte gSaveBlock1 + 0x1A0A
_080BC264: .4byte gStringVar1
	thumb_func_end sub_80BC224

	thumb_func_start sub_80BC268
sub_80BC268: @ 80BC268
	push {lr}
	lsls r0, 24
	lsrs r0, 24
	ldr r2, _080BC288 @ =gSaveBlock1
	lsls r1, r0, 2
	adds r1, r0
	lsls r1, 5
	adds r1, r2
	ldr r0, _080BC28C @ =0x00001a09
	adds r1, r0
	ldrb r0, [r1]
	lsrs r0, 6
	cmp r0, 0
	bne _080BC290
	movs r0, 0
	b _080BC292
	.align 2, 0
_080BC288: .4byte gSaveBlock1
_080BC28C: .4byte 0x00001a09
_080BC290:
	movs r0, 0x1
_080BC292:
	pop {r1}
	bx r1
	thumb_func_end sub_80BC268

	thumb_func_start sub_80BC298
sub_80BC298: @ 80BC298
	push {r4,r5,lr}
	adds r5, r0, 0
	movs r1, 0x1A
	bl GetMonData
	adds r4, r0, 0
	lsls r4, 16
	lsrs r4, 16
	adds r0, r5, 0
	movs r1, 0x1B
	bl GetMonData
	adds r4, r0
	lsls r4, 16
	lsrs r4, 16
	adds r0, r5, 0
	movs r1, 0x1C
	bl GetMonData
	adds r4, r0
	lsls r4, 16
	lsrs r4, 16
	adds r0, r5, 0
	movs r1, 0x1D
	bl GetMonData
	adds r4, r0
	lsls r4, 16
	lsrs r4, 16
	adds r0, r5, 0
	movs r1, 0x1E
	bl GetMonData
	adds r4, r0
	lsls r4, 16
	lsrs r4, 16
	adds r0, r5, 0
	movs r1, 0x1F
	bl GetMonData
	adds r4, r0
	lsls r4, 16
	lsrs r4, 16
	adds r0, r4, 0
	movs r1, 0x6
	bl __udivsi3
	lsls r0, 24
	lsrs r0, 24
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end sub_80BC298

	thumb_func_start sub_80BC300
sub_80BC300: @ 80BC300
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	sub sp, 0xC
	movs r0, 0
	mov r10, r0
	movs r6, 0
	mov r9, r6
_080BC314:
	movs r4, 0
	lsls r3, r6, 2
	lsls r2, r6, 1
	ldr r7, _080BC424 @ =gPlayerParty
	adds r1, r6, 0x1
	str r1, [sp]
	adds r1, r3, 0
_080BC322:
	adds r0, r1, r4
	lsls r0, 1
	ldr r5, _080BC428 @ =gSaveBlock1 + 0x1A54
	adds r0, r5, r0
	mov r5, r9
	strh r5, [r0]
	adds r0, r4, 0x1
	lsls r0, 16
	lsrs r4, r0, 16
	cmp r4, 0x3
	bls _080BC322
	ldr r1, _080BC42C @ =gSaveBlock1 + 0x1A84
	adds r0, r1, r2
	strh r5, [r0]
	ldr r5, _080BC430 @ =gSaveBlock1 + 0x1A90
	adds r0, r5, r2
	mov r1, r9
	strh r1, [r0]
	ldr r2, _080BC434 @ =gSaveBlock1 + 0x1A9C
	adds r0, r2, r6
	mov r5, r9
	strb r5, [r0]
	ldr r1, _080BC438 @ =gSaveBlock1 + 0x1A3C
	adds r0, r1, r3
	mov r2, r9
	str r2, [r0]
	ldr r3, _080BC43C @ =gSaveBlock1 + 0x1AA2
	adds r0, r3, r6
	strb r2, [r0]
	movs r0, 0x64
	adds r5, r6, 0
	muls r5, r0
	adds r4, r5, r7
	adds r0, r4, 0
	movs r1, 0xB
	bl GetMonData
	cmp r0, 0
	beq _080BC408
	adds r0, r4, 0
	movs r1, 0x2D
	bl GetMonData
	cmp r0, 0
	bne _080BC408
	movs r4, 0
	mov r0, r10
	lsls r0, 2
	mov r8, r0
	mov r1, r10
	lsls r7, r1, 1
	adds r1, 0x1
	str r1, [sp, 0x4]
	ldr r2, _080BC424 @ =gPlayerParty
_080BC38E:
	adds r1, r4, 0
	adds r1, 0xD
	adds r0, r5, r2
	str r2, [sp, 0x8]
	bl GetMonData
	mov r3, r8
	adds r1, r3, r4
	lsls r1, 1
	ldr r3, _080BC428 @ =gSaveBlock1 + 0x1A54
	adds r1, r3, r1
	strh r0, [r1]
	adds r0, r4, 0x1
	lsls r0, 16
	lsrs r4, r0, 16
	ldr r2, [sp, 0x8]
	cmp r4, 0x3
	bls _080BC38E
	movs r0, 0x64
	adds r4, r6, 0
	muls r4, r0
	ldr r0, _080BC424 @ =gPlayerParty
	adds r4, r0
	adds r0, r4, 0
	movs r1, 0xB
	bl GetMonData
	ldr r5, _080BC42C @ =gSaveBlock1 + 0x1A84
	adds r1, r5, r7
	strh r0, [r1]
	adds r0, r4, 0
	movs r1, 0xC
	bl GetMonData
	ldr r2, _080BC430 @ =gSaveBlock1 + 0x1A90
	adds r1, r2, r7
	strh r0, [r1]
	adds r0, r4, 0
	movs r1, 0x38
	bl GetMonData
	ldr r1, _080BC434 @ =gSaveBlock1 + 0x1A9C
	add r1, r10
	strb r0, [r1]
	adds r0, r4, 0
	movs r1, 0
	bl GetMonData
	ldr r1, _080BC438 @ =gSaveBlock1 + 0x1A3C
	add r1, r8
	str r0, [r1]
	adds r0, r4, 0
	bl sub_80BC298
	ldr r1, _080BC43C @ =gSaveBlock1 + 0x1AA2
	add r1, r10
	strb r0, [r1]
	ldr r3, [sp, 0x4]
	lsls r0, r3, 16
	lsrs r0, 16
	mov r10, r0
_080BC408:
	ldr r5, [sp]
	lsls r0, r5, 16
	lsrs r6, r0, 16
	cmp r6, 0x5
	bls _080BC314
	add sp, 0xC
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080BC424: .4byte gPlayerParty
_080BC428: .4byte gSaveBlock1 + 0x1A54
_080BC42C: .4byte gSaveBlock1 + 0x1A84
_080BC430: .4byte gSaveBlock1 + 0x1A90
_080BC434: .4byte gSaveBlock1 + 0x1A9C
_080BC438: .4byte gSaveBlock1 + 0x1A3C
_080BC43C: .4byte gSaveBlock1 + 0x1AA2
	thumb_func_end sub_80BC300

	thumb_func_start sub_80BC440
sub_80BC440: @ 80BC440
	push {r4,r5,lr}
	ldr r4, _080BC45C @ =gSaveBlock1
	ldr r0, _080BC460 @ =0x00001a16
	adds r4, r0
	ldrh r5, [r4]
	movs r0, 0
	bl sub_80BB594
	strh r5, [r4]
	bl sub_80BC0F8
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080BC45C: .4byte gSaveBlock1
_080BC460: .4byte 0x00001a16
	thumb_func_end sub_80BC440

	thumb_func_start SecretBasePC_PackUp
SecretBasePC_PackUp: @ 80BC464
	push {lr}
	movs r0, 0x14
	bl IncrementGameStat
	bl sub_80BC440
	pop {r0}
	bx r0
	thumb_func_end SecretBasePC_PackUp

	thumb_func_start sub_80BC474
sub_80BC474: @ 80BC474
	push {r4-r7,lr}
	ldr r0, _080BC4CC @ =gMapHeader
	ldr r4, [r0, 0x4]
	movs r6, 0
	ldrb r0, [r4, 0x3]
	cmp r6, r0
	bcs _080BC504
	ldr r3, _080BC4D0 @ =gSaveBlock1 + 0x1A08
_080BC484:
	ldr r2, [r4, 0x10]
	lsls r1, r6, 1
	adds r0, r1, r6
	lsls r0, 2
	adds r2, r0, r2
	ldrb r0, [r2, 0x5]
	adds r7, r1, 0
	cmp r0, 0x8
	bne _080BC4F8
	ldrb r1, [r3]
	ldr r0, [r2, 0x8]
	cmp r1, r0
	bne _080BC4F8
	ldrh r0, [r2]
	adds r0, 0x7
	ldrh r1, [r2, 0x2]
	adds r1, 0x7
	bl MapGridGetMetatileIdAt
	movs r1, 0
	ldr r5, _080BC4D4 @ =gUnknown_083D1358
	lsls r0, 16
	asrs r2, r0, 16
_080BC4B2:
	lsls r0, r1, 2
	adds r3, r0, r5
	ldrh r0, [r3, 0x2]
	cmp r0, r2
	beq _080BC4D8
	adds r0, r1, 0x1
	lsls r0, 16
	lsrs r1, r0, 16
	cmp r1, 0x6
	bls _080BC4B2
_080BC4C6:
	bl DrawWholeMapView
	b _080BC504
	.align 2, 0
_080BC4CC: .4byte gMapHeader
_080BC4D0: .4byte gSaveBlock1 + 0x1A08
_080BC4D4: .4byte gUnknown_083D1358
_080BC4D8:
	ldr r0, [r4, 0x10]
	adds r1, r7, r6
	lsls r1, 2
	adds r1, r0
	ldrh r0, [r1]
	adds r0, 0x7
	ldrh r1, [r1, 0x2]
	adds r1, 0x7
	ldrh r3, [r3]
	movs r4, 0xC0
	lsls r4, 4
	adds r2, r4, 0
	orrs r2, r3
	bl MapGridSetMetatileIdAt
	b _080BC4C6
_080BC4F8:
	adds r0, r6, 0x1
	lsls r0, 16
	lsrs r6, r0, 16
	ldrb r0, [r4, 0x3]
	cmp r6, r0
	bcc _080BC484
_080BC504:
	pop {r4-r7}
	pop {r0}
	bx r0
	thumb_func_end sub_80BC474

	thumb_func_start sub_80BC50C
sub_80BC50C: @ 80BC50C
	push {r4,r5,lr}
	bl sub_80BC474
	movs r0, 0x14
	bl IncrementGameStat
	ldr r4, _080BC530 @ =gSaveBlock1
	ldr r0, _080BC534 @ =0x00001a16
	adds r4, r0
	ldrh r5, [r4]
	movs r0, 0
	bl sub_80BB594
	strh r5, [r4]
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080BC530: .4byte gSaveBlock1
_080BC534: .4byte 0x00001a16
	thumb_func_end sub_80BC50C

	thumb_func_start sub_80BC538
sub_80BC538: @ 80BC538
	push {r4,r5,lr}
	movs r5, 0
	movs r4, 0x1
_080BC53E:
	lsls r0, r4, 24
	lsrs r0, 24
	bl sub_80BC268
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _080BC554
	adds r0, r5, 0x1
	lsls r0, 24
	lsrs r5, r0, 24
_080BC554:
	lsls r0, r4, 16
	movs r1, 0x80
	lsls r1, 9
	adds r0, r1
	lsrs r4, r0, 16
	asrs r0, 16
	cmp r0, 0x13
	ble _080BC53E
	adds r0, r5, 0
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end sub_80BC538

	thumb_func_start sub_80BC56C
sub_80BC56C: @ 80BC56C
	push {lr}
	ldr r0, _080BC58C @ =gUnknown_020387DC
	ldrb r0, [r0]
	bl sub_80BC14C
	lsls r0, 24
	lsrs r0, 24
	bl sub_80BC268
	lsls r0, 24
	lsrs r1, r0, 24
	cmp r1, 0x1
	bne _080BC594
	ldr r0, _080BC590 @ =gScriptResult
	strh r1, [r0]
	b _080BC5B2
	.align 2, 0
_080BC58C: .4byte gUnknown_020387DC
_080BC590: .4byte gScriptResult
_080BC594:
	bl sub_80BC538
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x9
	bls _080BC5AC
	ldr r1, _080BC5A8 @ =gScriptResult
	movs r0, 0x2
	b _080BC5B0
	.align 2, 0
_080BC5A8: .4byte gScriptResult
_080BC5AC:
	ldr r1, _080BC5B8 @ =gScriptResult
	movs r0, 0
_080BC5B0:
	strh r0, [r1]
_080BC5B2:
	pop {r0}
	bx r0
	.align 2, 0
_080BC5B8: .4byte gScriptResult
	thumb_func_end sub_80BC56C

	thumb_func_start sub_80BC5BC
sub_80BC5BC: @ 80BC5BC
	push {lr}
	ldr r0, _080BC5F8 @ =gUnknown_020387DC
	ldrb r0, [r0]
	bl sub_80BC14C
	ldr r2, _080BC5FC @ =gSaveBlock1
	lsls r0, 24
	lsrs r0, 24
	lsls r1, r0, 2
	adds r1, r0
	lsls r1, 5
	adds r1, r2
	ldr r0, _080BC600 @ =0x00001a09
	adds r1, r0
	ldrb r3, [r1]
	lsrs r2, r3, 6
	movs r0, 0x1
	eors r2, r0
	lsls r2, 6
	movs r0, 0x3F
	ands r0, r3
	orrs r0, r2
	strb r0, [r1]
	movs r0, 0x86
	lsls r0, 1
	bl FlagSet
	pop {r0}
	bx r0
	.align 2, 0
_080BC5F8: .4byte gUnknown_020387DC
_080BC5FC: .4byte gSaveBlock1
_080BC600: .4byte 0x00001a09
	thumb_func_end sub_80BC5BC

	thumb_func_start SecretBasePC_Decoration
SecretBasePC_Decoration: @ 80BC604
	push {lr}
	ldr r0, _080BC614 @ =Task_SecretBasePC_Decoration
	movs r1, 0
	bl CreateTask
	pop {r0}
	bx r0
	.align 2, 0
_080BC614: .4byte Task_SecretBasePC_Decoration
	thumb_func_end SecretBasePC_Decoration

	thumb_func_start SecretBasePC_Registry
SecretBasePC_Registry: @ 80BC618
	push {lr}
	ldr r0, _080BC628 @ =Task_SecretBasePC_Registry
	movs r1, 0
	bl CreateTask
	pop {r0}
	bx r0
	.align 2, 0
_080BC628: .4byte Task_SecretBasePC_Registry
	thumb_func_end SecretBasePC_Registry

	thumb_func_start Task_SecretBasePC_Registry
Task_SecretBasePC_Registry: @ 80BC62C
	push {r4,r5,lr}
	lsls r0, 24
	lsrs r5, r0, 24
	bl ScriptContext2_Enable
	bl sub_80F944C
	bl LoadScrollIndicatorPalette
	lsls r0, r5, 2
	adds r0, r5
	lsls r0, 3
	ldr r1, _080BC688 @ =gTasks + 0x8
	adds r4, r0, r1
	bl sub_80BC538
	lsls r0, 24
	lsrs r0, 24
	strh r0, [r4]
	adds r1, r0, 0
	cmp r1, 0
	beq _080BC694
	cmp r1, 0x7
	ble _080BC65E
	movs r0, 0x7
_080BC65E:
	strh r0, [r4, 0x6]
	movs r0, 0
	strh r0, [r4, 0x2]
	strh r0, [r4, 0x4]
	movs r0, 0
	movs r1, 0
	movs r2, 0x1D
	movs r3, 0x13
	bl MenuZeroFillWindowRect
	adds r0, r5, 0
	bl sub_80BC7D8
	ldr r1, _080BC68C @ =gTasks
	lsls r0, r5, 2
	adds r0, r5
	lsls r0, 3
	adds r0, r1
	ldr r1, _080BC690 @ =sub_80BC824
	str r1, [r0]
	b _080BC6A0
	.align 2, 0
_080BC688: .4byte gTasks + 0x8
_080BC68C: .4byte gTasks
_080BC690: .4byte sub_80BC824
_080BC694:
	ldr r1, _080BC6A8 @ =gSecretBaseText_NoRegistry
	ldr r2, _080BC6AC @ =sub_80BCC54
	adds r0, r5, 0
	movs r3, 0
	bl DisplayItemMessageOnField
_080BC6A0:
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080BC6A8: .4byte gSecretBaseText_NoRegistry
_080BC6AC: .4byte sub_80BCC54
	thumb_func_end Task_SecretBasePC_Registry

	thumb_func_start sub_80BC6B0
sub_80BC6B0: @ 80BC6B0
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	lsls r0, 24
	lsrs r0, 24
	lsls r1, r0, 2
	adds r1, r0
	lsls r1, 3
	ldr r0, _080BC6D8 @ =gTasks + 0x8
	adds r1, r0
	mov r8, r1
	movs r4, 0
	movs r6, 0
	movs r5, 0x1
	movs r2, 0x4
	ldrsh r0, [r1, r2]
	cmp r6, r0
	bne _080BC6DC
	movs r4, 0x1
	b _080BC706
	.align 2, 0
_080BC6D8: .4byte gTasks + 0x8
_080BC6DC:
	adds r0, r5, 0
	bl sub_80BC268
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _080BC6F0
	adds r0, r4, 0x1
	lsls r0, 24
	lsrs r4, r0, 24
_080BC6F0:
	adds r0, r5, 0x1
	lsls r0, 24
	lsrs r5, r0, 24
	cmp r5, 0x13
	bhi _080BC706
	mov r1, r8
	movs r2, 0x4
	ldrsh r0, [r1, r2]
	cmp r4, r0
	bne _080BC6DC
	adds r4, r5, 0
_080BC706:
	adds r5, r4, 0
	cmp r5, 0x13
	bhi _080BC75A
	ldr r7, _080BC7A0 @ =gStringVar1
_080BC70E:
	adds r0, r5, 0
	bl sub_80BC268
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _080BC750
	adds r0, r7, 0
	adds r1, r5, 0
	bl sub_80BC190
	lsls r3, r6, 1
	adds r4, r3, 0x2
	lsls r4, 24
	lsrs r4, 24
	adds r3, 0x3
	lsls r3, 24
	lsrs r3, 24
	movs r0, 0x12
	adds r1, r4, 0
	movs r2, 0x1C
	bl MenuFillWindowRectWithBlankTile
	adds r0, r7, 0
	movs r1, 0x12
	adds r2, r4, 0
	bl MenuPrint
	adds r0, r6, 0x1
	lsls r0, 24
	lsrs r6, r0, 24
	cmp r6, 0x8
	beq _080BC75A
_080BC750:
	adds r0, r5, 0x1
	lsls r0, 24
	lsrs r5, r0, 24
	cmp r5, 0x13
	bls _080BC70E
_080BC75A:
	cmp r6, 0x7
	bhi _080BC7A8
	lsls r3, r6, 1
	adds r4, r3, 0x2
	lsls r4, 24
	lsrs r4, 24
	adds r3, 0x3
	lsls r3, 24
	lsrs r3, 24
	movs r0, 0x12
	adds r1, r4, 0
	movs r2, 0x1C
	bl MenuFillWindowRectWithBlankTile
	ldr r0, _080BC7A4 @ =gUnknownText_Exit
	movs r1, 0x12
	adds r2, r4, 0
	bl MenuPrint
	movs r0, 0x1
	bl DestroyVerticalScrollIndicator
	cmp r6, 0x7
	beq _080BC7B2
	lsls r1, r6, 25
	movs r0, 0x80
	lsls r0, 19
	adds r1, r0
	lsrs r1, 24
	movs r0, 0x12
	movs r2, 0x1C
	movs r3, 0x12
	bl MenuFillWindowRectWithBlankTile
	b _080BC7B2
	.align 2, 0
_080BC7A0: .4byte gStringVar1
_080BC7A4: .4byte gUnknownText_Exit
_080BC7A8:
	movs r0, 0x1
	movs r1, 0xBC
	movs r2, 0x98
	bl CreateVerticalScrollIndicators
_080BC7B2:
	mov r1, r8
	movs r2, 0x4
	ldrsh r0, [r1, r2]
	cmp r0, 0
	bne _080BC7C4
	movs r0, 0
	bl DestroyVerticalScrollIndicator
	b _080BC7CE
_080BC7C4:
	movs r0, 0
	movs r1, 0xBC
	movs r2, 0x8
	bl CreateVerticalScrollIndicators
_080BC7CE:
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r0}
	bx r0
	thumb_func_end sub_80BC6B0

	thumb_func_start sub_80BC7D8
sub_80BC7D8: @ 80BC7D8
	push {r4,r5,lr}
	sub sp, 0x8
	adds r5, r0, 0
	lsls r5, 24
	lsrs r5, 24
	lsls r4, r5, 2
	adds r4, r5
	lsls r4, 3
	ldr r0, _080BC820 @ =gTasks + 0x8
	adds r4, r0
	movs r0, 0x11
	movs r1, 0
	movs r2, 0x1D
	movs r3, 0x13
	bl MenuDrawTextWindow
	ldrb r3, [r4, 0x6]
	adds r3, 0x1
	lsls r3, 24
	lsrs r3, 24
	ldrb r0, [r4, 0x2]
	str r0, [sp]
	movs r0, 0xB
	str r0, [sp, 0x4]
	movs r0, 0
	movs r1, 0x12
	movs r2, 0x2
	bl InitMenu
	adds r0, r5, 0
	bl sub_80BC6B0
	add sp, 0x8
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080BC820: .4byte gTasks + 0x8
	thumb_func_end sub_80BC7D8

	thumb_func_start sub_80BC824
sub_80BC824: @ 80BC824
	push {r4-r6,lr}
	lsls r0, 24
	lsrs r5, r0, 24
	adds r6, r5, 0
	lsls r0, r5, 2
	adds r0, r5
	lsls r0, 3
	ldr r1, _080BC858 @ =gTasks + 0x8
	adds r4, r0, r1
	ldr r2, _080BC85C @ =gMain
	ldrh r1, [r2, 0x30]
	movs r0, 0x40
	ands r0, r1
	cmp r0, 0
	beq _080BC874
	movs r1, 0x2
	ldrsh r0, [r4, r1]
	cmp r0, 0
	beq _080BC860
	movs r0, 0x5
	bl PlaySE
	movs r0, 0x1
	negs r0, r0
	b _080BC8B6
	.align 2, 0
_080BC858: .4byte gTasks + 0x8
_080BC85C: .4byte gMain
_080BC860:
	movs r2, 0x4
	ldrsh r0, [r4, r2]
	cmp r0, 0
	beq _080BC940
	movs r0, 0x5
	bl PlaySE
	ldrh r0, [r4, 0x4]
	subs r0, 0x1
	b _080BC8A4
_080BC874:
	movs r0, 0x80
	ands r0, r1
	cmp r0, 0
	beq _080BC8C2
	movs r0, 0x2
	ldrsh r1, [r4, r0]
	movs r2, 0x6
	ldrsh r0, [r4, r2]
	cmp r1, r0
	bne _080BC8AE
	movs r1, 0x4
	ldrsh r0, [r4, r1]
	movs r2, 0x2
	ldrsh r1, [r4, r2]
	adds r0, r1
	movs r2, 0
	ldrsh r1, [r4, r2]
	cmp r0, r1
	beq _080BC940
	movs r0, 0x5
	bl PlaySE
	ldrh r0, [r4, 0x4]
	adds r0, 0x1
_080BC8A4:
	strh r0, [r4, 0x4]
	adds r0, r5, 0
	bl sub_80BC6B0
	b _080BC940
_080BC8AE:
	movs r0, 0x5
	bl PlaySE
	movs r0, 0x1
_080BC8B6:
	bl MoveMenuCursor
	lsls r0, 24
	lsrs r0, 24
	strh r0, [r4, 0x2]
	b _080BC940
_080BC8C2:
	ldrh r1, [r2, 0x2E]
	movs r0, 0x1
	ands r0, r1
	cmp r0, 0
	beq _080BC91C
	movs r0, 0x5
	bl PlaySE
	movs r1, 0x2
	ldrsh r0, [r4, r1]
	movs r2, 0x4
	ldrsh r1, [r4, r2]
	adds r0, r1
	movs r2, 0
	ldrsh r1, [r4, r2]
	cmp r0, r1
	bne _080BC8FC
	bl sub_8072DEC
	movs r0, 0
	movs r1, 0
	movs r2, 0x1D
	movs r3, 0x13
	bl MenuZeroFillWindowRect
	adds r0, r5, 0
	bl sub_80BCC54
	b _080BC940
_080BC8FC:
	bl sub_8072DEC
	ldrb r0, [r4, 0x4]
	ldrb r1, [r4, 0x2]
	adds r0, r1
	lsls r0, 24
	lsrs r0, 24
	bl sub_80BC948
	lsls r0, 24
	lsrs r0, 24
	strh r0, [r4, 0x8]
	adds r0, r5, 0
	bl sub_80BC980
	b _080BC940
_080BC91C:
	movs r0, 0x2
	ands r0, r1
	cmp r0, 0
	beq _080BC940
	movs r0, 0x5
	bl PlaySE
	bl sub_8072DEC
	movs r0, 0
	movs r1, 0
	movs r2, 0x1D
	movs r3, 0x13
	bl MenuZeroFillWindowRect
	adds r0, r6, 0
	bl sub_80BCC54
_080BC940:
	pop {r4-r6}
	pop {r0}
	bx r0
	thumb_func_end sub_80BC824

	thumb_func_start sub_80BC948
sub_80BC948: @ 80BC948
	push {r4-r6,lr}
	lsls r0, 24
	lsrs r6, r0, 24
	movs r5, 0
	movs r4, 0x1
_080BC952:
	adds r0, r4, 0
	bl sub_80BC268
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _080BC96E
	cmp r6, r5
	bne _080BC968
	adds r0, r4, 0
	b _080BC97A
_080BC968:
	adds r0, r5, 0x1
	lsls r0, 24
	lsrs r5, r0, 24
_080BC96E:
	adds r0, r4, 0x1
	lsls r0, 24
	lsrs r4, r0, 24
	cmp r4, 0x13
	bls _080BC952
	movs r0, 0
_080BC97A:
	pop {r4-r6}
	pop {r1}
	bx r1
	thumb_func_end sub_80BC948

	thumb_func_start sub_80BC980
sub_80BC980: @ 80BC980
	push {r4,lr}
	sub sp, 0x8
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	movs r0, 0
	bl sub_80F996C
	movs r0, 0x1
	bl sub_80F996C
	movs r0, 0x1
	movs r1, 0
	movs r2, 0xC
	movs r3, 0x5
	bl MenuDrawTextWindow
	ldr r3, _080BC9D8 @ =gUnknown_083D13D4
	movs r0, 0x2
	movs r1, 0x1
	movs r2, 0x2
	bl PrintMenuItems
	movs r0, 0
	str r0, [sp]
	movs r0, 0xA
	str r0, [sp, 0x4]
	movs r0, 0
	movs r1, 0x2
	movs r2, 0x1
	movs r3, 0x2
	bl InitMenu
	ldr r1, _080BC9DC @ =gTasks
	lsls r0, r4, 2
	adds r0, r4
	lsls r0, 3
	adds r0, r1
	ldr r1, _080BC9E0 @ =sub_80BC9E4
	str r1, [r0]
	add sp, 0x8
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080BC9D8: .4byte gUnknown_083D13D4
_080BC9DC: .4byte gTasks
_080BC9E0: .4byte sub_80BC9E4
	thumb_func_end sub_80BC980

	thumb_func_start sub_80BC9E4
sub_80BC9E4: @ 80BC9E4
	push {r4,r5,lr}
	lsls r0, 24
	lsrs r5, r0, 24
	adds r4, r5, 0
	ldr r2, _080BCA14 @ =gMain
	ldrh r1, [r2, 0x30]
	movs r0, 0x40
	ands r0, r1
	cmp r0, 0
	beq _080BCA18
	bl GetMenuCursorPos
	lsls r0, 24
	cmp r0, 0
	beq _080BCA7C
	movs r0, 0x5
	bl PlaySE
	movs r0, 0x1
	negs r0, r0
	bl MoveMenuCursor
	b _080BCA7C
	.align 2, 0
_080BCA14: .4byte gMain
_080BCA18:
	movs r0, 0x80
	ands r0, r1
	cmp r0, 0
	beq _080BCA3A
	bl GetMenuCursorPos
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	beq _080BCA7C
	movs r0, 0x5
	bl PlaySE
	movs r0, 0x1
	bl MoveMenuCursor
	b _080BCA7C
_080BCA3A:
	ldrh r1, [r2, 0x2E]
	movs r0, 0x1
	ands r0, r1
	cmp r0, 0
	beq _080BCA68
	movs r0, 0x5
	bl PlaySE
	ldr r4, _080BCA64 @ =gUnknown_083D13D4
	bl GetMenuCursorPos
	lsls r0, 24
	lsrs r0, 21
	adds r4, 0x4
	adds r0, r4
	ldr r1, [r0]
	adds r0, r5, 0
	bl _call_via_r1
	b _080BCA7C
	.align 2, 0
_080BCA64: .4byte gUnknown_083D13D4
_080BCA68:
	movs r0, 0x2
	ands r0, r1
	cmp r0, 0
	beq _080BCA7C
	movs r0, 0x5
	bl PlaySE
	adds r0, r4, 0
	bl sub_80BCBF8
_080BCA7C:
	pop {r4,r5}
	pop {r0}
	bx r0
	thumb_func_end sub_80BC9E4

	thumb_func_start sub_80BCA84
sub_80BCA84: @ 80BCA84
	push {r4,r5,lr}
	adds r5, r0, 0
	lsls r5, 24
	lsrs r5, 24
	lsls r4, r5, 2
	adds r4, r5
	lsls r4, 3
	ldr r0, _080BCAD8 @ =gTasks + 0x8
	adds r4, r0
	movs r0, 0
	bl DestroyVerticalScrollIndicator
	movs r0, 0x1
	bl DestroyVerticalScrollIndicator
	bl sub_8072DEC
	movs r0, 0
	movs r1, 0
	movs r2, 0x1D
	movs r3, 0x13
	bl MenuZeroFillWindowRect
	ldr r0, _080BCADC @ =gStringVar1
	ldrb r1, [r4, 0x8]
	bl sub_80BC190
	ldr r4, _080BCAE0 @ =gStringVar4
	ldr r1, _080BCAE4 @ =gOtherText_OkayToDeleteFromRegistry
	adds r0, r4, 0
	bl StringExpandPlaceholders
	ldr r2, _080BCAE8 @ =sub_80BCAEC
	adds r0, r5, 0
	adds r1, r4, 0
	movs r3, 0
	bl DisplayItemMessageOnField
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080BCAD8: .4byte gTasks + 0x8
_080BCADC: .4byte gStringVar1
_080BCAE0: .4byte gStringVar4
_080BCAE4: .4byte gOtherText_OkayToDeleteFromRegistry
_080BCAE8: .4byte sub_80BCAEC
	thumb_func_end sub_80BCA84

	thumb_func_start sub_80BCAEC
sub_80BCAEC: @ 80BCAEC
	push {r4,lr}
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	movs r0, 0x14
	movs r1, 0x8
	movs r2, 0x1
	bl DisplayYesNoMenu
	ldr r1, _080BCB0C @ =gUnknown_083D13E4
	adds r0, r4, 0
	bl sub_80F914C
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080BCB0C: .4byte gUnknown_083D13E4
	thumb_func_end sub_80BCAEC

	thumb_func_start sub_80BCB10
sub_80BCB10: @ 80BCB10
	push {r4-r7,lr}
	lsls r0, 24
	lsrs r0, 24
	adds r5, r0, 0
	lsls r0, r5, 2
	adds r0, r5
	lsls r6, r0, 3
	ldr r7, _080BCB80 @ =gTasks + 0x8
	adds r4, r6, r7
	movs r0, 0
	movs r1, 0
	movs r2, 0x1D
	movs r3, 0x13
	bl MenuZeroFillWindowRect
	ldr r2, _080BCB84 @ =gSaveBlock1
	movs r0, 0x8
	ldrsh r1, [r4, r0]
	lsls r0, r1, 2
	adds r0, r1
	lsls r0, 5
	adds r0, r2
	ldr r1, _080BCB88 @ =0x00001a09
	adds r0, r1
	ldrb r2, [r0]
	movs r1, 0x3F
	ands r1, r2
	strb r1, [r0]
	ldrh r0, [r4]
	subs r0, 0x1
	strh r0, [r4]
	ldrh r1, [r4, 0x4]
	movs r2, 0x4
	ldrsh r0, [r4, r2]
	cmp r0, 0
	ble _080BCB5C
	subs r0, r1, 0x1
	strh r0, [r4, 0x4]
_080BCB5C:
	movs r1, 0
	ldrsh r0, [r4, r1]
	cmp r0, 0x7
	bgt _080BCB6A
	ldrh r0, [r4, 0x6]
	subs r0, 0x1
	strh r0, [r4, 0x6]
_080BCB6A:
	adds r0, r5, 0
	bl sub_80BC7D8
	adds r0, r7, 0
	subs r0, 0x8
	adds r0, r6, r0
	ldr r1, _080BCB8C @ =sub_80BC824
	str r1, [r0]
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080BCB80: .4byte gTasks + 0x8
_080BCB84: .4byte gSaveBlock1
_080BCB88: .4byte 0x00001a09
_080BCB8C: .4byte sub_80BC824
	thumb_func_end sub_80BCB10

	thumb_func_start sub_80BCB90
sub_80BCB90: @ 80BCB90
	push {r4,lr}
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	movs r0, 0x14
	movs r1, 0x8
	movs r2, 0x1A
	movs r3, 0xD
	bl MenuZeroFillWindowRect
	ldr r1, _080BCBB8 @ =gOtherText_RegisteredDataDeleted
	ldr r2, _080BCBBC @ =sub_80BCB10
	adds r0, r4, 0
	movs r3, 0
	bl DisplayItemMessageOnField
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080BCBB8: .4byte gOtherText_RegisteredDataDeleted
_080BCBBC: .4byte sub_80BCB10
	thumb_func_end sub_80BCB90

	thumb_func_start sub_80BCBC0
sub_80BCBC0: @ 80BCBC0
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
	bl sub_80BC7D8
	ldr r1, _080BCBF0 @ =gTasks
	lsls r0, r4, 2
	adds r0, r4
	lsls r0, 3
	adds r0, r1
	ldr r1, _080BCBF4 @ =sub_80BC824
	str r1, [r0]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080BCBF0: .4byte gTasks
_080BCBF4: .4byte sub_80BC824
	thumb_func_end sub_80BCBC0

	thumb_func_start sub_80BCBF8
sub_80BCBF8: @ 80BCBF8
	push {r4,r5,lr}
	sub sp, 0x8
	lsls r0, 24
	lsrs r0, 24
	lsls r4, r0, 2
	adds r4, r0
	lsls r4, 3
	ldr r5, _080BCC4C @ =gTasks + 0x8
	adds r0, r4, r5
	ldrb r3, [r0, 0x6]
	adds r3, 0x1
	lsls r3, 24
	lsrs r3, 24
	ldrb r0, [r0, 0x2]
	str r0, [sp]
	movs r0, 0xB
	str r0, [sp, 0x4]
	movs r0, 0
	movs r1, 0x12
	movs r2, 0x2
	bl InitMenu
	movs r0, 0x1
	movs r1, 0
	movs r2, 0xC
	movs r3, 0x5
	bl MenuZeroFillWindowRect
	movs r0, 0
	bl sub_80F98DC
	movs r0, 0x1
	bl sub_80F98DC
	subs r5, 0x8
	adds r4, r5
	ldr r0, _080BCC50 @ =sub_80BC824
	str r0, [r4]
	add sp, 0x8
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080BCC4C: .4byte gTasks + 0x8
_080BCC50: .4byte sub_80BC824
	thumb_func_end sub_80BCBF8

	thumb_func_start sub_80BCC54
sub_80BCC54: @ 80BCC54
	push {r4,r5,lr}
	lsls r0, 24
	lsrs r5, r0, 24
	ldr r0, _080BCC84 @ =0x00004054
	bl VarGet
	adds r4, r0, 0
	lsls r4, 16
	lsrs r4, 16
	bl BuyMenuFreeMemory
	movs r0, 0
	bl DestroyVerticalScrollIndicator
	movs r0, 0x1
	bl DestroyVerticalScrollIndicator
	cmp r4, 0
	bne _080BCC8C
	ldr r0, _080BCC88 @ =gUnknown_0815F399
	bl ScriptContext1_SetupScript
	b _080BCC92
	.align 2, 0
_080BCC84: .4byte 0x00004054
_080BCC88: .4byte gUnknown_0815F399
_080BCC8C:
	ldr r0, _080BCCA0 @ =gUnknown_0815F49A
	bl ScriptContext1_SetupScript
_080BCC92:
	adds r0, r5, 0
	bl DestroyTask
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080BCCA0: .4byte gUnknown_0815F49A
	thumb_func_end sub_80BCC54

	thumb_func_start sub_80BCCA4
sub_80BCCA4: @ 80BCCA4
	push {r4,lr}
	lsls r0, 24
	lsrs r0, 24
	ldr r1, _080BCCDC @ =gSaveBlock1
	lsls r4, r0, 2
	adds r4, r0
	lsls r4, 5
	adds r4, r1
	ldr r1, _080BCCE0 @ =0x00001a11
	adds r0, r4, r1
	ldrb r0, [r0]
	movs r1, 0x5
	bl __umodsi3
	ldr r1, _080BCCE4 @ =0x00001a09
	adds r4, r1
	ldrb r2, [r4]
	lsls r2, 27
	lsrs r2, 31
	lsls r1, r2, 2
	adds r1, r2
	adds r0, r1
	lsls r0, 24
	lsrs r0, 24
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_080BCCDC: .4byte gSaveBlock1
_080BCCE0: .4byte 0x00001a11
_080BCCE4: .4byte 0x00001a09
	thumb_func_end sub_80BCCA4

	thumb_func_start sub_80BCCE8
sub_80BCCE8: @ 80BCCE8
	push {lr}
	ldr r0, _080BCD08 @ =0x00004054
	bl VarGet
	lsls r0, 24
	lsrs r0, 24
	bl sub_80BCCA4
	lsls r0, 24
	lsrs r0, 24
	adds r1, r0, 0
	cmp r0, 0
	bne _080BCD10
	ldr r0, _080BCD0C @ =UnknownString_81A1BB2
	b _080BCD72
	.align 2, 0
_080BCD08: .4byte 0x00004054
_080BCD0C: .4byte UnknownString_81A1BB2
_080BCD10:
	cmp r0, 0x1
	bne _080BCD1C
	ldr r0, _080BCD18 @ =UnknownString_81A1F67
	b _080BCD72
	.align 2, 0
_080BCD18: .4byte UnknownString_81A1F67
_080BCD1C:
	cmp r0, 0x2
	bne _080BCD28
	ldr r0, _080BCD24 @ =UnknownString_81A2254
	b _080BCD72
	.align 2, 0
_080BCD24: .4byte UnknownString_81A2254
_080BCD28:
	cmp r0, 0x3
	bne _080BCD34
	ldr r0, _080BCD30 @ =UnknownString_81A25C3
	b _080BCD72
	.align 2, 0
_080BCD30: .4byte UnknownString_81A25C3
_080BCD34:
	cmp r0, 0x4
	bne _080BCD40
	ldr r0, _080BCD3C @ =UnknownString_81A2925
	b _080BCD72
	.align 2, 0
_080BCD3C: .4byte UnknownString_81A2925
_080BCD40:
	cmp r0, 0x5
	bne _080BCD4C
	ldr r0, _080BCD48 @ =UnknownString_81A1D74
	b _080BCD72
	.align 2, 0
_080BCD48: .4byte UnknownString_81A1D74
_080BCD4C:
	cmp r0, 0x6
	bne _080BCD58
	ldr r0, _080BCD54 @ =UnknownString_81A20C9
	b _080BCD72
	.align 2, 0
_080BCD54: .4byte UnknownString_81A20C9
_080BCD58:
	cmp r0, 0x7
	bne _080BCD64
	ldr r0, _080BCD60 @ =UnknownString_81A2439
	b _080BCD72
	.align 2, 0
_080BCD60: .4byte UnknownString_81A2439
_080BCD64:
	cmp r1, 0x8
	beq _080BCD70
	ldr r0, _080BCD6C @ =UnknownString_81A2B2A
	b _080BCD72
	.align 2, 0
_080BCD6C: .4byte UnknownString_81A2B2A
_080BCD70:
	ldr r0, _080BCD78 @ =UnknownString_81A2754
_080BCD72:
	pop {r1}
	bx r1
	.align 2, 0
_080BCD78: .4byte UnknownString_81A2754
	thumb_func_end sub_80BCCE8

	thumb_func_start unref_sub_80BCD7C
unref_sub_80BCD7C: @ 80BCD7C
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	lsls r0, 24
	lsrs r0, 24
	movs r5, 0
	ldr r7, _080BCDFC @ =gSaveBlock1
	lsls r1, r0, 2
	adds r1, r0
	lsls r6, r1, 5
	ldr r0, _080BCE00 @ =0x00001a3c
	adds r0, r7
	mov r10, r0
	ldr r1, _080BCE04 @ =0x00001a54
	adds r1, r7
	mov r9, r1
	ldr r2, _080BCE08 @ =0x00001a84
	adds r2, r7
	mov r8, r2
	ldr r0, _080BCE0C @ =0x00000115
	mov r12, r0
_080BCDAA:
	lsls r4, r5, 2
	adds r0, r4, r6
	add r0, r10
	adds r3, r5, 0x1
	str r3, [r0]
	lsls r0, r5, 3
	adds r0, r6
	add r0, r9
	strh r3, [r0]
	lsls r1, r5, 1
	adds r1, r6
	mov r2, r8
	adds r0, r1, r2
	mov r2, r12
	strh r2, [r0]
	ldr r2, _080BCE10 @ =0x00001a90
	adds r0, r7, r2
	adds r1, r0
	strh r3, [r1]
	adds r2, r5, r6
	ldr r1, _080BCE14 @ =0x00001a9c
	adds r0, r7, r1
	adds r0, r2, r0
	adds r1, r5, 0x5
	strb r1, [r0]
	ldr r1, _080BCE18 @ =0x00001aa2
	adds r0, r7, r1
	adds r2, r0
	adds r4, r5
	strb r4, [r2]
	lsls r3, 16
	lsrs r5, r3, 16
	cmp r5, 0
	beq _080BCDAA
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080BCDFC: .4byte gSaveBlock1
_080BCE00: .4byte 0x00001a3c
_080BCE04: .4byte 0x00001a54
_080BCE08: .4byte 0x00001a84
_080BCE0C: .4byte 0x00000115
_080BCE10: .4byte 0x00001a90
_080BCE14: .4byte 0x00001a9c
_080BCE18: .4byte 0x00001aa2
	thumb_func_end unref_sub_80BCD7C

	thumb_func_start sub_80BCE1C
sub_80BCE1C: @ 80BCE1C
	push {r4,lr}
	ldr r0, _080BCE44 @ =0x00004054
	bl VarGet
	adds r4, r0, 0
	lsls r4, 16
	lsrs r4, 16
	movs r0, 0x1
	bl sub_810FB10
	lsls r0, r4, 2
	adds r0, r4
	lsls r0, 5
	ldr r1, _080BCE48 @ =gSaveBlock1 + 0x1A08
	adds r0, r1
	bl CreateSecretBaseEnemyParty
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080BCE44: .4byte 0x00004054
_080BCE48: .4byte gSaveBlock1 + 0x1A08
	thumb_func_end sub_80BCE1C

	thumb_func_start sub_80BCE4C
sub_80BCE4C: @ 80BCE4C
	push {lr}
	ldr r0, _080BCE80 @ =0x00004054
	bl VarGet
	ldr r2, _080BCE84 @ =gSaveBlock1
	lsls r0, 16
	lsrs r0, 16
	lsls r1, r0, 2
	adds r1, r0
	lsls r1, 5
	adds r1, r2
	ldr r0, _080BCE88 @ =gScriptResult
	ldrb r0, [r0]
	ldr r2, _080BCE8C @ =0x00001a09
	adds r1, r2
	movs r2, 0x1
	ands r2, r0
	lsls r2, 5
	ldrb r3, [r1]
	movs r0, 0x21
	negs r0, r0
	ands r0, r3
	orrs r0, r2
	strb r0, [r1]
	pop {r0}
	bx r0
	.align 2, 0
_080BCE80: .4byte 0x00004054
_080BCE84: .4byte gSaveBlock1
_080BCE88: .4byte gScriptResult
_080BCE8C: .4byte 0x00001a09
	thumb_func_end sub_80BCE4C

	thumb_func_start sub_80BCE90
sub_80BCE90: @ 80BCE90
	push {r4-r7,lr}
	ldr r0, _080BCF04 @ =0x00004054
	bl VarGet
	lsls r0, 16
	lsrs r5, r0, 16
	ldr r0, _080BCF08 @ =0x000008c2
	bl FlagGet
	lsls r0, 24
	cmp r0, 0
	bne _080BCED4
	movs r3, 0
	ldr r7, _080BCF0C @ =gSaveBlock1
	ldr r4, _080BCF10 @ =0x00001a09
	movs r6, 0x21
	negs r6, r6
_080BCEB2:
	lsls r1, r3, 2
	adds r1, r3
	lsls r1, 5
	adds r1, r7
	adds r1, r4
	ldrb r2, [r1]
	adds r0, r6, 0
	ands r0, r2
	strb r0, [r1]
	adds r0, r3, 0x1
	lsls r0, 24
	lsrs r3, r0, 24
	cmp r3, 0x13
	bls _080BCEB2
	ldr r0, _080BCF08 @ =0x000008c2
	bl FlagSet
_080BCED4:
	ldr r4, _080BCF14 @ =gSpecialVar_0x8004
	lsls r0, r5, 24
	lsrs r0, 24
	bl sub_80BCCA4
	lsls r0, 24
	lsrs r0, 24
	strh r0, [r4]
	ldr r2, _080BCF18 @ =gScriptResult
	ldr r1, _080BCF0C @ =gSaveBlock1
	lsls r0, r5, 2
	adds r0, r5
	lsls r0, 5
	adds r0, r1
	ldr r1, _080BCF10 @ =0x00001a09
	adds r0, r1
	ldrb r0, [r0]
	lsls r0, 26
	lsrs r0, 31
	strh r0, [r2]
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080BCF04: .4byte 0x00004054
_080BCF08: .4byte 0x000008c2
_080BCF0C: .4byte gSaveBlock1
_080BCF10: .4byte 0x00001a09
_080BCF14: .4byte gSpecialVar_0x8004
_080BCF18: .4byte gScriptResult
	thumb_func_end sub_80BCE90

	thumb_func_start sub_80BCF1C
sub_80BCF1C: @ 80BCF1C
	push {r4,r5,lr}
	sub sp, 0x4
	lsls r0, 24
	lsrs r0, 24
	lsls r1, r0, 2
	adds r1, r0
	lsls r1, 3
	ldr r0, _080BCF40 @ =gTasks + 0x8
	adds r4, r1, r0
	movs r1, 0x2
	ldrsh r0, [r4, r1]
	cmp r0, 0x1
	beq _080BCF54
	cmp r0, 0x1
	bgt _080BCF44
	cmp r0, 0
	beq _080BCF4A
	b _080BD02C
	.align 2, 0
_080BCF40: .4byte gTasks + 0x8
_080BCF44:
	cmp r0, 0x2
	beq _080BD01C
	b _080BD02C
_080BCF4A:
	adds r0, r4, 0x4
	adds r1, r4, 0x6
	bl PlayerGetDestCoords
	b _080BD028
_080BCF54:
	mov r5, sp
	adds r5, 0x2
	mov r0, sp
	adds r1, r5, 0
	bl PlayerGetDestCoords
	mov r0, sp
	ldrh r2, [r0]
	movs r3, 0
	ldrsh r1, [r0, r3]
	movs r3, 0x4
	ldrsh r0, [r4, r3]
	cmp r1, r0
	bne _080BCF7C
	movs r0, 0
	ldrsh r1, [r5, r0]
	movs r3, 0x6
	ldrsh r0, [r4, r3]
	cmp r1, r0
	beq _080BD02C
_080BCF7C:
	strh r2, [r4, 0x4]
	ldrh r0, [r5]
	strh r0, [r4, 0x6]
	mov r0, sp
	movs r1, 0
	ldrsh r0, [r0, r1]
	movs r2, 0
	ldrsh r1, [r5, r2]
	bl MapGridGetMetatileBehaviorAt
	lsls r0, 24
	lsrs r4, r0, 24
	adds r0, r4, 0
	bl sub_8057350
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _080BCFA8
	bl DoYellowCave4Sparkle
	b _080BD02C
_080BCFA8:
	adds r0, r4, 0
	bl sub_8057314
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _080BCFD8
	mov r0, sp
	movs r3, 0
	ldrsh r0, [r0, r3]
	movs r2, 0
	ldrsh r1, [r5, r2]
	bl MapGridGetMetatileIdAt
	lsls r0, 16
	asrs r0, 16
	mov r1, sp
	movs r3, 0
	ldrsh r1, [r1, r3]
	movs r3, 0
	ldrsh r2, [r5, r3]
	bl sub_80C68A4
	b _080BD02C
_080BCFD8:
	adds r0, r4, 0
	bl sub_8057328
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _080BCFF6
	mov r0, sp
	movs r1, 0
	ldrsh r0, [r0, r1]
	movs r2, 0
	ldrsh r1, [r5, r2]
	bl sub_80C6A54
	b _080BD02C
_080BCFF6:
	adds r0, r4, 0
	bl sub_805733C
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _080BD02C
	mov r0, sp
	movs r3, 0
	ldrsh r0, [r0, r3]
	movs r2, 0
	ldrsh r1, [r5, r2]
	bl MapGridGetMetatileIdAt
	lsls r0, 16
	asrs r0, 16
	bl DoDecorationSoundEffect
	b _080BD02C
_080BD01C:
	ldrb r0, [r4, 0x8]
	bl FieldEffectActiveListContains
	lsls r0, 24
	cmp r0, 0
	bne _080BD02C
_080BD028:
	movs r0, 0x1
	strh r0, [r4, 0x2]
_080BD02C:
	add sp, 0x4
	pop {r4,r5}
	pop {r0}
	bx r0
	thumb_func_end sub_80BCF1C

	thumb_func_start sub_80BD034
sub_80BD034: @ 80BD034
	push {r4,lr}
	lsls r0, 24
	lsrs r0, 24
	ldr r2, _080BD064 @ =gSaveBlock1
	lsls r4, r0, 2
	adds r4, r0
	lsls r4, 5
	adds r4, r2
	ldr r2, _080BD068 @ =0x00001a08
	adds r0, r4, r2
	movs r2, 0xA0
	bl memcpy
	ldr r0, _080BD06C @ =0x00001a09
	adds r4, r0
	ldrb r1, [r4]
	movs r0, 0x3F
	ands r0, r1
	movs r1, 0x80
	orrs r0, r1
	strb r0, [r4]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080BD064: .4byte gSaveBlock1
_080BD068: .4byte 0x00001a08
_080BD06C: .4byte 0x00001a09
	thumb_func_end sub_80BD034

	thumb_func_start sub_80BD070
sub_80BD070: @ 80BD070
	push {r4,lr}
	movs r2, 0
	adds r4, r0, 0
	adds r4, 0x9
	adds r3, r1, 0
	adds r3, 0x9
_080BD07C:
	adds r0, r4, r2
	adds r1, r3, r2
	ldrb r0, [r0]
	ldrb r1, [r1]
	cmp r0, r1
	beq _080BD08C
	movs r0, 0
	b _080BD098
_080BD08C:
	adds r0, r2, 0x1
	lsls r0, 24
	lsrs r2, r0, 24
	cmp r2, 0x3
	bls _080BD07C
	movs r0, 0x1
_080BD098:
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end sub_80BD070

	thumb_func_start sub_80BD0A0
sub_80BD0A0: @ 80BD0A0
	push {r4-r6,lr}
	adds r6, r0, 0
	adds r5, r1, 0
	movs r3, 0
	ldrb r0, [r6, 0x2]
	cmp r0, 0xFF
	bne _080BD0B4
	ldrb r0, [r5, 0x2]
	cmp r0, 0xFF
	beq _080BD0E2
_080BD0B4:
	adds r2, r6, 0x2
	adds r0, r2, r3
	adds r4, r5, 0x2
	adds r1, r4, r3
	ldrb r0, [r0]
	ldrb r1, [r1]
	cmp r0, r1
	beq _080BD0C8
	movs r0, 0
	b _080BD0E4
_080BD0C8:
	adds r0, r3, 0x1
	lsls r0, 24
	lsrs r3, r0, 24
	cmp r3, 0x6
	bhi _080BD0E2
	adds r0, r2, r3
	ldrb r0, [r0]
	cmp r0, 0xFF
	bne _080BD0B4
	adds r0, r4, r3
	ldrb r0, [r0]
	cmp r0, 0xFF
	bne _080BD0B4
_080BD0E2:
	movs r0, 0x1
_080BD0E4:
	pop {r4-r6}
	pop {r1}
	bx r1
	thumb_func_end sub_80BD0A0

	thumb_func_start sub_80BD0EC
sub_80BD0EC: @ 80BD0EC
	push {r4,r5,lr}
	adds r4, r0, 0
	adds r5, r1, 0
	ldrb r2, [r4, 0x1]
	movs r0, 0x10
	adds r1, r0, 0
	ands r1, r2
	ldrb r2, [r5, 0x1]
	ands r0, r2
	cmp r1, r0
	bne _080BD122
	adds r0, r4, 0
	adds r1, r5, 0
	bl sub_80BD070
	lsls r0, 24
	cmp r0, 0
	beq _080BD122
	adds r0, r4, 0
	adds r1, r5, 0
	bl sub_80BD0A0
	lsls r0, 24
	cmp r0, 0
	beq _080BD122
	movs r0, 0x1
	b _080BD124
_080BD122:
	movs r0, 0
_080BD124:
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end sub_80BD0EC

	thumb_func_start sub_80BD12C
sub_80BD12C: @ 80BD12C
	push {r4,lr}
	lsls r0, 24
	lsrs r2, r0, 24
	movs r1, 0
	ldr r4, _080BD150 @ =gSaveBlock1
	ldr r3, _080BD154 @ =0x00001a08
_080BD138:
	lsls r0, r1, 16
	asrs r1, r0, 16
	lsls r0, r1, 2
	adds r0, r1
	lsls r0, 5
	adds r0, r4
	adds r0, r3
	ldrb r0, [r0]
	cmp r0, r2
	bne _080BD158
	adds r0, r1, 0
	b _080BD168
	.align 2, 0
_080BD150: .4byte gSaveBlock1
_080BD154: .4byte 0x00001a08
_080BD158:
	adds r0, r1, 0x1
	lsls r0, 16
	lsrs r1, r0, 16
	asrs r0, 16
	cmp r0, 0x13
	ble _080BD138
	movs r0, 0x1
	negs r0, r0
_080BD168:
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end sub_80BD12C

	thumb_func_start sub_80BD170
sub_80BD170: @ 80BD170
	push {r4,lr}
	movs r2, 0x1
	ldr r4, _080BD194 @ =gSaveBlock1
	ldr r3, _080BD198 @ =0x00001a08
_080BD178:
	lsls r0, r2, 16
	asrs r1, r0, 16
	lsls r0, r1, 2
	adds r0, r1
	lsls r0, 5
	adds r0, r4
	adds r0, r3
	ldrb r0, [r0]
	cmp r0, 0
	bne _080BD19C
	lsls r0, r2, 24
	lsrs r0, 24
	b _080BD1AA
	.align 2, 0
_080BD194: .4byte gSaveBlock1
_080BD198: .4byte 0x00001a08
_080BD19C:
	adds r0, r1, 0x1
	lsls r0, 16
	lsrs r2, r0, 16
	asrs r0, 16
	cmp r0, 0x13
	ble _080BD178
	movs r0, 0
_080BD1AA:
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end sub_80BD170

	thumb_func_start sub_80BD1B0
sub_80BD1B0: @ 80BD1B0
	push {r4,lr}
	movs r3, 0x1
	ldr r4, _080BD1DC @ =gSaveBlock1
_080BD1B6:
	lsls r2, r3, 16
	asrs r1, r2, 16
	lsls r0, r1, 2
	adds r0, r1
	lsls r0, 5
	adds r0, r4
	ldr r1, _080BD1E0 @ =0x00001a09
	adds r0, r1
	ldrb r1, [r0]
	lsrs r0, r1, 6
	cmp r0, 0
	bne _080BD1E4
	lsls r0, r1, 28
	cmp r0, 0
	bne _080BD1E4
	lsls r0, r3, 24
	lsrs r0, 24
	b _080BD1F4
	.align 2, 0
_080BD1DC: .4byte gSaveBlock1
_080BD1E0: .4byte 0x00001a09
_080BD1E4:
	movs r1, 0x80
	lsls r1, 9
	adds r0, r2, r1
	lsrs r3, r0, 16
	asrs r0, 16
	cmp r0, 0x13
	ble _080BD1B6
	movs r0, 0
_080BD1F4:
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end sub_80BD1B0

	thumb_func_start sub_80BD1FC
sub_80BD1FC: @ 80BD1FC
	push {r4,r5,lr}
	adds r5, r0, 0
	ldrb r0, [r5]
	cmp r0, 0
	beq _080BD278
	ldrb r0, [r5]
	bl sub_80BD12C
	lsls r0, 16
	lsrs r4, r0, 16
	asrs r2, r0, 16
	cmp r2, 0
	beq _080BD278
	movs r0, 0x1
	negs r0, r0
	cmp r2, r0
	beq _080BD254
	ldr r0, _080BD24C @ =gSaveBlock1
	lsls r1, r2, 2
	adds r1, r2
	lsls r1, 5
	adds r1, r0
	ldr r0, _080BD250 @ =0x00001a09
	adds r1, r0
	ldrb r1, [r1]
	lsls r0, r1, 28
	lsrs r0, 28
	cmp r0, 0x1
	beq _080BD278
	lsrs r0, r1, 6
	cmp r0, 0x2
	bne _080BD246
	ldrb r1, [r5, 0x1]
	movs r0, 0xF
	ands r0, r1
	cmp r0, 0x1
	bne _080BD278
_080BD246:
	lsls r4, 24
	lsrs r4, 24
	b _080BD26C
	.align 2, 0
_080BD24C: .4byte gSaveBlock1
_080BD250: .4byte 0x00001a09
_080BD254:
	bl sub_80BD170
	lsls r0, 24
	lsrs r4, r0, 24
	cmp r4, 0
	bne _080BD26C
	bl sub_80BD1B0
	lsls r0, 24
	lsrs r4, r0, 24
	cmp r4, 0
	beq _080BD278
_080BD26C:
	adds r0, r4, 0
	adds r1, r5, 0
	bl sub_80BD034
	adds r0, r4, 0
	b _080BD27A
_080BD278:
	movs r0, 0
_080BD27A:
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end sub_80BD1FC

	thumb_func_start sub_80BD280
sub_80BD280: @ 80BD280
	push {r4-r7,lr}
	mov r7, r9
	mov r6, r8
	push {r6,r7}
	sub sp, 0xA0
	ldr r0, _080BD324 @ =gSaveBlock1 + 0x1A08
	mov r8, r0
	movs r2, 0x1
_080BD290:
	adds r1, r2, 0x1
	lsls r0, r1, 24
	lsrs r5, r0, 24
	mov r9, r1
	cmp r5, 0x13
	bhi _080BD30C
	lsls r0, r2, 2
	adds r0, r2
	lsls r0, 5
	mov r1, r8
	adds r6, r0, r1
	movs r7, 0xC0
_080BD2A8:
	ldrb r0, [r6, 0x1]
	adds r3, r7, 0
	ands r3, r0
	cmp r3, 0
	bne _080BD2C6
	lsls r2, r5, 2
	adds r0, r2, r5
	lsls r0, 5
	add r0, r8
	ldrb r1, [r0, 0x1]
	adds r0, r7, 0
	ands r0, r1
	adds r4, r2, 0
	cmp r0, 0x40
	beq _080BD2DE
_080BD2C6:
	cmp r3, 0x80
	bne _080BD302
	lsls r2, r5, 2
	adds r0, r2, r5
	lsls r0, 5
	add r0, r8
	ldrb r1, [r0, 0x1]
	adds r0, r7, 0
	ands r0, r1
	adds r4, r2, 0
	cmp r0, 0x80
	beq _080BD302
_080BD2DE:
	mov r0, sp
	adds r1, r6, 0
	movs r2, 0xA0
	bl memcpy
	adds r4, r5
	lsls r4, 5
	add r4, r8
	adds r0, r6, 0
	adds r1, r4, 0
	movs r2, 0xA0
	bl memcpy
	adds r0, r4, 0
	mov r1, sp
	movs r2, 0xA0
	bl memcpy
_080BD302:
	adds r0, r5, 0x1
	lsls r0, 24
	lsrs r5, r0, 24
	cmp r5, 0x13
	bls _080BD2A8
_080BD30C:
	mov r1, r9
	lsls r0, r1, 24
	lsrs r2, r0, 24
	cmp r2, 0x12
	bls _080BD290
	add sp, 0xA0
	pop {r3,r4}
	mov r8, r3
	mov r9, r4
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080BD324: .4byte gSaveBlock1 + 0x1A08
	thumb_func_end sub_80BD280

	thumb_func_start sub_80BD328
sub_80BD328: @ 80BD328
	push {r4-r6,lr}
	adds r6, r0, 0
	lsls r1, 24
	lsrs r5, r1, 24
	movs r4, 0x1
_080BD332:
	lsls r0, r4, 2
	adds r0, r4
	lsls r0, 5
	adds r1, r0, r6
	ldrb r0, [r1, 0x1]
	lsrs r0, 6
	cmp r0, r5
	bne _080BD348
	adds r0, r1, 0
	bl sub_80BD1FC
_080BD348:
	adds r0, r4, 0x1
	lsls r0, 16
	lsrs r4, r0, 16
	cmp r4, 0x13
	bls _080BD332
	pop {r4-r6}
	pop {r0}
	bx r0
	thumb_func_end sub_80BD328

	thumb_func_start sub_80BD358
sub_80BD358: @ 80BD358
	push {r4-r6,lr}
	adds r5, r0, 0
	ldrb r0, [r5]
	cmp r0, 0
	beq _080BD372
	ldrb r0, [r5, 0x1]
	lsls r0, 27
	ldr r1, _080BD378 @ =gSaveBlock2
	lsrs r0, 31
	adds r4, r1, 0
	ldrb r1, [r4, 0x8]
	cmp r0, r1
	beq _080BD37C
_080BD372:
	movs r0, 0
	b _080BD3D4
	.align 2, 0
_080BD378: .4byte gSaveBlock2
_080BD37C:
	movs r2, 0
	adds r3, r5, 0
	adds r3, 0x9
	adds r6, r4, 0
	adds r6, 0xA
_080BD386:
	adds r0, r3, r2
	adds r1, r2, r6
	ldrb r0, [r0]
	ldrb r1, [r1]
	cmp r0, r1
	bne _080BD372
	adds r0, r2, 0x1
	lsls r0, 24
	lsrs r2, r0, 24
	cmp r2, 0x3
	bls _080BD386
	movs r2, 0
	ldrb r0, [r5, 0x2]
	cmp r0, 0xFF
	bne _080BD3AA
	ldrb r0, [r4]
	cmp r0, 0xFF
	beq _080BD3D2
_080BD3AA:
	adds r3, r5, 0x2
	adds r0, r3, r2
	adds r1, r2, r4
	ldrb r0, [r0]
	ldrb r1, [r1]
	cmp r0, r1
	bne _080BD372
	adds r0, r2, 0x1
	lsls r0, 24
	lsrs r2, r0, 24
	cmp r2, 0x6
	bhi _080BD3D2
	adds r0, r3, r2
	ldrb r0, [r0]
	cmp r0, 0xFF
	bne _080BD3AA
	adds r0, r2, r4
	ldrb r0, [r0]
	cmp r0, 0xFF
	bne _080BD3AA
_080BD3D2:
	movs r0, 0x1
_080BD3D4:
	pop {r4-r6}
	pop {r1}
	bx r1
	thumb_func_end sub_80BD358

	thumb_func_start sub_80BD3DC
sub_80BD3DC: @ 80BD3DC
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	mov r10, r0
	mov r9, r1
	mov r8, r2
	movs r5, 0
	movs r6, 0
_080BD3F0:
	movs r0, 0x1
	ands r0, r5
	cmp r0, 0
	bne _080BD41A
	lsls r0, r6, 2
	adds r0, r6
	lsls r0, 5
	mov r1, r10
	adds r4, r1, r0
	adds r0, r4, 0
	bl sub_80BD358
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _080BD41A
	adds r0, r4, 0
	bl sub_80BB4AC
	movs r0, 0x1
	orrs r5, r0
_080BD41A:
	movs r7, 0x2
	movs r0, 0x2
	ands r0, r5
	cmp r0, 0
	bne _080BD448
	lsls r0, r6, 2
	adds r0, r6
	lsls r0, 5
	mov r1, r9
	adds r4, r1, r0
	adds r0, r4, 0
	bl sub_80BD358
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _080BD448
	adds r0, r4, 0
	bl sub_80BB4AC
	orrs r5, r7
	lsls r0, r5, 24
	lsrs r5, r0, 24
_080BD448:
	movs r7, 0x4
	movs r0, 0x4
	ands r0, r5
	cmp r0, 0
	bne _080BD476
	lsls r0, r6, 2
	adds r0, r6
	lsls r0, 5
	mov r1, r8
	adds r4, r1, r0
	adds r0, r4, 0
	bl sub_80BD358
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _080BD476
	adds r0, r4, 0
	bl sub_80BB4AC
	orrs r5, r7
	lsls r0, r5, 24
	lsrs r5, r0, 24
_080BD476:
	cmp r5, 0x7
	beq _080BD484
	adds r0, r6, 0x1
	lsls r0, 24
	lsrs r6, r0, 24
	cmp r6, 0x13
	bls _080BD3F0
_080BD484:
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	thumb_func_end sub_80BD3DC

	thumb_func_start sub_80BD494
sub_80BD494: @ 80BD494
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	adds r6, r0, 0
	mov r8, r1
	lsls r2, 24
	lsrs r7, r2, 24
	movs r5, 0
_080BD4A4:
	lsls r0, r5, 2
	adds r0, r5
	lsls r0, 5
	mov r1, r8
	adds r4, r0, r1
	ldrb r0, [r4]
	cmp r0, 0
	beq _080BD4FE
	adds r0, r6, 0
	adds r1, r4, 0
	bl sub_80BD0EC
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _080BD4FE
	cmp r7, 0
	bne _080BD4D0
	adds r0, r4, 0
	bl sub_80BB4AC
	b _080BD508
_080BD4D0:
	ldrh r0, [r6, 0xE]
	ldrh r3, [r4, 0xE]
	cmp r0, r3
	bls _080BD4E0
	adds r0, r4, 0
	bl sub_80BB4AC
	b _080BD508
_080BD4E0:
	ldrb r0, [r6, 0x1]
	lsls r0, 28
	lsrs r0, 28
	ldrb r1, [r4, 0x1]
	movs r3, 0x10
	negs r3, r3
	adds r2, r3, 0
	ands r1, r2
	orrs r1, r0
	strb r1, [r4, 0x1]
	adds r0, r6, 0
	bl sub_80BB4AC
	movs r0, 0x1
	b _080BD50A
_080BD4FE:
	adds r0, r5, 0x1
	lsls r0, 24
	lsrs r5, r0, 24
	cmp r5, 0x13
	bls _080BD4A4
_080BD508:
	movs r0, 0
_080BD50A:
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r1}
	bx r1
	thumb_func_end sub_80BD494

	thumb_func_start sub_80BD514
sub_80BD514: @ 80BD514
	push {r4-r7,lr}
	mov r7, r9
	mov r6, r8
	push {r6,r7}
	mov r9, r0
	adds r7, r1, 0
	mov r8, r2
	adds r6, r3, 0
	movs r5, 0x1
_080BD526:
	lsls r0, r5, 2
	adds r0, r5
	lsls r0, 5
	mov r1, r9
	adds r4, r0, r1
	ldrb r0, [r4]
	cmp r0, 0
	beq _080BD578
	ldrb r1, [r4, 0x1]
	movs r0, 0xC0
	ands r0, r1
	cmp r0, 0x40
	bne _080BD54E
	movs r2, 0x10
	negs r2, r2
	adds r0, r2, 0
	ands r0, r1
	movs r1, 0x1
	orrs r0, r1
	strb r0, [r4, 0x1]
_080BD54E:
	adds r0, r4, 0
	adds r1, r7, 0
	adds r2, r5, 0
	bl sub_80BD494
	lsls r0, 24
	cmp r0, 0
	bne _080BD578
	adds r0, r4, 0
	mov r1, r8
	adds r2, r5, 0
	bl sub_80BD494
	lsls r0, 24
	cmp r0, 0
	bne _080BD578
	adds r0, r4, 0
	adds r1, r6, 0
	adds r2, r5, 0
	bl sub_80BD494
_080BD578:
	adds r0, r5, 0x1
	lsls r0, 24
	lsrs r5, r0, 24
	cmp r5, 0x13
	bls _080BD526
	movs r5, 0
_080BD584:
	lsls r0, r5, 2
	adds r0, r5
	lsls r0, 5
	adds r4, r0, r7
	ldrb r0, [r4]
	cmp r0, 0
	beq _080BD5B8
	ldrb r0, [r4, 0x1]
	movs r2, 0x21
	negs r2, r2
	adds r1, r2, 0
	ands r0, r1
	strb r0, [r4, 0x1]
	adds r0, r4, 0
	mov r1, r8
	adds r2, r5, 0
	bl sub_80BD494
	lsls r0, 24
	cmp r0, 0
	bne _080BD5B8
	adds r0, r4, 0
	adds r1, r6, 0
	adds r2, r5, 0
	bl sub_80BD494
_080BD5B8:
	adds r0, r5, 0x1
	lsls r0, 24
	lsrs r5, r0, 24
	cmp r5, 0x13
	bls _080BD584
	movs r5, 0
	movs r0, 0x21
	negs r0, r0
	adds r7, r0, 0
_080BD5CA:
	lsls r0, r5, 2
	adds r0, r5
	lsls r4, r0, 5
	mov r2, r8
	adds r1, r4, r2
	ldrb r0, [r1]
	cmp r0, 0
	beq _080BD5EA
	ldrb r0, [r1, 0x1]
	ands r0, r7
	strb r0, [r1, 0x1]
	adds r0, r1, 0
	adds r1, r6, 0
	adds r2, r5, 0
	bl sub_80BD494
_080BD5EA:
	adds r1, r4, r6
	ldrb r0, [r1]
	cmp r0, 0
	beq _080BD5F8
	ldrb r0, [r1, 0x1]
	ands r0, r7
	strb r0, [r1, 0x1]
_080BD5F8:
	adds r0, r5, 0x1
	lsls r0, 24
	lsrs r5, r0, 24
	cmp r5, 0x13
	bls _080BD5CA
	pop {r3,r4}
	mov r8, r3
	mov r9, r4
	pop {r4-r7}
	pop {r0}
	bx r0
	thumb_func_end sub_80BD514

	thumb_func_start sub_80BD610
sub_80BD610: @ 80BD610
	push {r4-r6,lr}
	adds r4, r0, 0
	adds r5, r1, 0
	adds r6, r2, 0
	bl sub_80BD3DC
	ldr r0, _080BD670 @ =gSaveBlock1 + 0x1A08
	adds r1, r4, 0
	adds r2, r5, 0
	adds r3, r6, 0
	bl sub_80BD514
	adds r0, r4, 0
	bl sub_80BD1FC
	adds r0, r5, 0
	bl sub_80BD1FC
	adds r0, r6, 0
	bl sub_80BD1FC
	adds r0, r4, 0
	movs r1, 0x1
	bl sub_80BD328
	adds r0, r5, 0
	movs r1, 0x1
	bl sub_80BD328
	adds r0, r6, 0
	movs r1, 0x1
	bl sub_80BD328
	adds r0, r4, 0
	movs r1, 0
	bl sub_80BD328
	adds r0, r5, 0
	movs r1, 0
	bl sub_80BD328
	adds r0, r6, 0
	movs r1, 0
	bl sub_80BD328
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_080BD670: .4byte gSaveBlock1 + 0x1A08
	thumb_func_end sub_80BD610

	thumb_func_start sub_80BD674
sub_80BD674: @ 80BD674
	push {r4-r7,lr}
	adds r6, r0, 0
	adds r5, r1, 0
	lsls r2, 24
	lsrs r7, r2, 24
	movs r0, 0x60
	bl FlagGet
	lsls r0, 24
	cmp r0, 0
	bne _080BD68C
	b _080BD790
_080BD68C:
	bl GetLinkPlayerCount
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x2
	beq _080BD69E
	cmp r0, 0x3
	beq _080BD6BA
	b _080BD6C8
_080BD69E:
	lsls r4, r5, 1
	adds r0, r6, r4
	movs r1, 0
	adds r2, r5, 0
	bl memset
	adds r4, r5
	adds r4, r6, r4
	adds r0, r4, 0
	movs r1, 0
	adds r2, r5, 0
	bl memset
	b _080BD6C8
_080BD6BA:
	lsls r0, r5, 1
	adds r0, r5
	adds r0, r6, r0
	movs r1, 0
	adds r2, r5, 0
	bl memset
_080BD6C8:
	cmp r7, 0x1
	beq _080BD6F0
	cmp r7, 0x1
	bgt _080BD6D6
	cmp r7, 0
	beq _080BD6E0
	b _080BD71C
_080BD6D6:
	cmp r7, 0x2
	beq _080BD700
	cmp r7, 0x3
	beq _080BD710
	b _080BD71C
_080BD6E0:
	adds r0, r6, r5
	lsls r2, r5, 1
	adds r1, r6, r2
	adds r2, r5
	adds r2, r6, r2
	bl sub_80BD610
	b _080BD71C
_080BD6F0:
	lsls r1, r5, 1
	adds r0, r6, r1
	adds r1, r5
	adds r1, r6, r1
	adds r2, r6, 0
	bl sub_80BD610
	b _080BD71C
_080BD700:
	lsls r0, r5, 1
	adds r0, r5
	adds r0, r6, r0
	adds r2, r6, r5
	adds r1, r6, 0
	bl sub_80BD610
	b _080BD71C
_080BD710:
	adds r1, r6, r5
	lsls r2, r5, 1
	adds r2, r6, r2
	adds r0, r6, 0
	bl sub_80BD610
_080BD71C:
	movs r3, 0x1
	ldr r6, _080BD798 @ =gSaveBlock1
	movs r5, 0x10
	negs r5, r5
	ldr r4, _080BD79C @ =0x00001a09
_080BD726:
	lsls r0, r3, 2
	adds r0, r3
	lsls r0, 5
	adds r0, r6
	adds r2, r0, r4
	ldrb r1, [r2]
	lsls r0, r1, 28
	lsrs r0, 28
	cmp r0, 0x1
	bne _080BD746
	movs r0, 0x3F
	ands r0, r1
	movs r1, 0x40
	orrs r0, r1
	ands r0, r5
	strb r0, [r2]
_080BD746:
	adds r0, r3, 0x1
	lsls r0, 16
	lsrs r3, r0, 16
	cmp r3, 0x13
	bls _080BD726
	bl sub_80BD280
	movs r3, 0x1
	ldr r4, _080BD798 @ =gSaveBlock1
	ldr r6, _080BD79C @ =0x00001a09
	adds r7, r4, 0
	movs r5, 0x3F
_080BD75E:
	lsls r0, r3, 2
	adds r0, r3
	lsls r0, 5
	adds r0, r4
	adds r2, r0, r6
	ldrb r1, [r2]
	lsrs r0, r1, 6
	cmp r0, 0x2
	bne _080BD776
	adds r0, r5, 0
	ands r0, r1
	strb r0, [r2]
_080BD776:
	adds r0, r3, 0x1
	lsls r0, 16
	lsrs r3, r0, 16
	cmp r3, 0x13
	bls _080BD75E
	ldr r0, _080BD7A0 @ =0x00001a16
	adds r2, r7, r0
	ldrh r1, [r2]
	ldr r0, _080BD7A4 @ =0x0000ffff
	cmp r1, r0
	beq _080BD790
	adds r0, r1, 0x1
	strh r0, [r2]
_080BD790:
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080BD798: .4byte gSaveBlock1
_080BD79C: .4byte 0x00001a09
_080BD7A0: .4byte 0x00001a16
_080BD7A4: .4byte 0x0000ffff
	thumb_func_end sub_80BD674

	.align 2, 0 @ Don't pad with nop.
