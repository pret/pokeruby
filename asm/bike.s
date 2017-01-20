	.include "constants/gba_constants.inc"
	.include "constants/species_constants.inc"
	.include "asm/macros.inc"

	.syntax unified

	.text
	
	thumb_func_start CheckMovementInputAcroBikeNormal
CheckMovementInputAcroBikeNormal: @ 80E5340
	push {r4-r6,lr}
	adds r4, r0, 0
	lsls r1, 16
	lsrs r6, r1, 16
	lsls r2, 16
	lsrs r5, r2, 16
	bl player_get_direction_upper_nybble
	lsls r0, 24
	lsrs r3, r0, 24
	ldr r2, _080E5374 @ =gPlayerAvatar
	movs r0, 0
	strb r0, [r2, 0xA]
	ldrb r1, [r4]
	cmp r1, 0
	bne _080E5380
	movs r0, 0x2
	ands r0, r6
	cmp r0, 0
	beq _080E5378
	strb r3, [r4]
	strb r1, [r2, 0x2]
	movs r0, 0x2
	strb r0, [r2, 0x8]
	movs r0, 0x3
	b _080E53D4
	.align 2, 0
_080E5374: .4byte gPlayerAvatar
_080E5378:
	strb r3, [r4]
	strb r1, [r2, 0x2]
	movs r0, 0
	b _080E53D4
_080E5380:
	cmp r1, r3
	bne _080E53A6
	movs r0, 0x2
	ands r0, r5
	cmp r0, 0
	beq _080E539E
	ldrb r0, [r2, 0xB]
	cmp r0, 0
	bne _080E539E
	adds r0, 0x1
	strb r0, [r2, 0xB]
	movs r0, 0x4
	strb r0, [r2, 0x8]
	movs r0, 0xB
	b _080E53D4
_080E539E:
	ldrb r0, [r4]
	ldr r2, _080E53CC @ =gPlayerAvatar
	cmp r0, r3
	beq _080E53D0
_080E53A6:
	ldr r0, _080E53CC @ =gPlayerAvatar
	ldrb r1, [r0, 0x2]
	adds r2, r0, 0
	cmp r1, 0x2
	beq _080E53D0
	movs r1, 0
	movs r0, 0x1
	strb r0, [r2, 0x8]
	ldrb r0, [r4]
	strb r0, [r2, 0x9]
	strb r1, [r2, 0x2]
	adds r0, r4, 0
	adds r1, r6, 0
	adds r2, r5, 0
	bl CheckMovementInputAcroBike
	lsls r0, 24
	lsrs r0, 24
	b _080E53D4
	.align 2, 0
_080E53CC: .4byte gPlayerAvatar
_080E53D0:
	movs r0, 0x2
	strb r0, [r2, 0x2]
_080E53D4:
	pop {r4-r6}
	pop {r1}
	bx r1
	thumb_func_end CheckMovementInputAcroBikeNormal

	thumb_func_start CheckMovementInputAcroBikeChangingDirection
CheckMovementInputAcroBikeChangingDirection: @ 80E53DC
	push {r4-r6,lr}
	adds r5, r0, 0
	ldr r4, _080E5404 @ =gPlayerAvatar
	ldrb r0, [r4, 0x9]
	strb r0, [r5]
	ldrb r0, [r4, 0xA]
	adds r0, 0x1
	strb r0, [r4, 0xA]
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x6
	bls _080E5408
	movs r0, 0x1
	strb r0, [r4, 0x2]
	movs r0, 0
	strb r0, [r4, 0x8]
	bl sub_80E6024
	movs r0, 0x1
	b _080E544E
	.align 2, 0
_080E5404: .4byte gPlayerAvatar
_080E5408:
	bl player_get_direction_upper_nybble
	lsls r0, 24
	lsrs r6, r0, 24
	bl sub_80E5C2C
	ldrb r1, [r5]
	lsls r0, 24
	lsrs r0, 24
	cmp r1, r0
	bne _080E544A
	bl sub_80E6024
	movs r0, 0x1
	strb r0, [r4, 0xB]
	adds r0, r6, 0
	bl GetOppositeDirection
	ldrb r1, [r5]
	lsls r0, 24
	lsrs r0, 24
	cmp r1, r0
	bne _080E543E
	movs r0, 0x6
	strb r0, [r4, 0x8]
	movs r0, 0x9
	b _080E544E
_080E543E:
	movs r0, 0x2
	strb r0, [r4, 0x2]
	movs r0, 0x5
	strb r0, [r4, 0x8]
	movs r0, 0x8
	b _080E544E
_080E544A:
	strb r6, [r5]
	movs r0, 0
_080E544E:
	pop {r4-r6}
	pop {r1}
	bx r1
	thumb_func_end CheckMovementInputAcroBikeChangingDirection

	thumb_func_start CheckMovementInputAcroBikeStandingWheelie
CheckMovementInputAcroBikeStandingWheelie: @ 80E5454
	push {r4-r7,lr}
	adds r7, r0, 0
	lsls r4, r2, 16
	lsrs r4, 16
	bl player_get_direction_upper_nybble
	lsls r0, 24
	lsrs r6, r0, 24
	ldr r5, _080E54A0 @ =gPlayerAvatar
	ldrb r1, [r5, 0x5]
	lsls r0, r1, 3
	adds r0, r1
	lsls r0, 2
	ldr r1, _080E54A4 @ =gMapObjects
	adds r1, r0, r1
	movs r0, 0
	strb r0, [r5, 0x2]
	movs r0, 0x2
	ands r4, r0
	lsls r4, 16
	lsrs r4, 16
	cmp r4, 0
	bne _080E54A8
	strb r4, [r5, 0xA]
	ldrb r0, [r1, 0x1E]
	bl MetatileBehavior_IsBumpySlope
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0
	bne _080E54AE
	strb r6, [r7]
	strb r0, [r5, 0x8]
	bl sub_80E6024
	movs r0, 0x4
	b _080E54EC
	.align 2, 0
_080E54A0: .4byte gPlayerAvatar
_080E54A4: .4byte gMapObjects
_080E54A8:
	ldrb r0, [r5, 0xA]
	adds r0, 0x1
	strb r0, [r5, 0xA]
_080E54AE:
	ldr r1, _080E54C4 @ =gPlayerAvatar
	ldrb r0, [r1, 0xA]
	cmp r0, 0x27
	bls _080E54C8
	strb r6, [r7]
	movs r0, 0x3
	strb r0, [r1, 0x8]
	bl sub_80E6024
	movs r0, 0x6
	b _080E54EC
	.align 2, 0
_080E54C4: .4byte gPlayerAvatar
_080E54C8:
	ldrb r0, [r7]
	cmp r0, r6
	bne _080E54DE
	movs r0, 0x2
	strb r0, [r1, 0x2]
	movs r0, 0x4
	strb r0, [r1, 0x8]
	bl sub_80E6024
	movs r0, 0xA
	b _080E54EC
_080E54DE:
	cmp r0, 0
	beq _080E54E8
	movs r0, 0x1
	strb r0, [r1, 0x2]
	b _080E54EA
_080E54E8:
	strb r6, [r7]
_080E54EA:
	movs r0, 0x5
_080E54EC:
	pop {r4-r7}
	pop {r1}
	bx r1
	thumb_func_end CheckMovementInputAcroBikeStandingWheelie

	thumb_func_start CheckMovementInputAcroBikeBunnyHop
CheckMovementInputAcroBikeBunnyHop: @ 80E54F4
	push {r4-r7,lr}
	mov r7, r9
	mov r6, r8
	push {r6,r7}
	adds r6, r0, 0
	lsls r1, 16
	lsrs r1, 16
	mov r9, r1
	lsls r2, 16
	lsrs r2, 16
	mov r8, r2
	bl player_get_direction_upper_nybble
	lsls r0, 24
	lsrs r5, r0, 24
	adds r2, r5, 0
	ldr r4, _080E5554 @ =gPlayerAvatar
	ldrb r1, [r4, 0x5]
	lsls r0, r1, 3
	adds r0, r1
	lsls r0, 2
	ldr r1, _080E5558 @ =gMapObjects
	adds r7, r0, r1
	movs r0, 0x2
	mov r1, r8
	ands r0, r1
	cmp r0, 0
	bne _080E5566
	bl sub_80E6024
	ldrb r0, [r7, 0x1E]
	bl MetatileBehavior_IsBumpySlope
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0
	beq _080E555C
	movs r0, 0x2
	strb r0, [r4, 0x8]
	adds r0, r6, 0
	mov r1, r9
	mov r2, r8
	bl CheckMovementInputAcroBike
	lsls r0, 24
	lsrs r0, 24
	b _080E558A
	.align 2, 0
_080E5554: .4byte gPlayerAvatar
_080E5558: .4byte gMapObjects
_080E555C:
	strb r5, [r6]
	strb r0, [r4, 0x2]
	strb r0, [r4, 0x8]
	movs r0, 0x4
	b _080E558A
_080E5566:
	ldrb r0, [r6]
	cmp r0, 0
	bne _080E5570
	strb r5, [r6]
	b _080E557C
_080E5570:
	cmp r0, r2
	beq _080E5582
	ldrb r0, [r4, 0x2]
	cmp r0, 0x2
	beq _080E5582
	movs r0, 0x1
_080E557C:
	strb r0, [r4, 0x2]
	movs r0, 0x6
	b _080E558A
_080E5582:
	ldr r1, _080E5598 @ =gPlayerAvatar
	movs r0, 0x2
	strb r0, [r1, 0x2]
	movs r0, 0x7
_080E558A:
	pop {r3,r4}
	mov r8, r3
	mov r9, r4
	pop {r4-r7}
	pop {r1}
	bx r1
	.align 2, 0
_080E5598: .4byte gPlayerAvatar
	thumb_func_end CheckMovementInputAcroBikeBunnyHop

	thumb_func_start CheckMovementInputAcroBikeMovingWheelie
CheckMovementInputAcroBikeMovingWheelie: @ 80E559C
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	adds r6, r0, 0
	lsls r1, 16
	lsrs r1, 16
	mov r10, r1
	lsls r2, 16
	lsrs r2, 16
	mov r8, r2
	bl player_get_direction_lower_nybble
	lsls r0, 24
	lsrs r5, r0, 24
	adds r2, r5, 0
	ldr r4, _080E55F8 @ =gPlayerAvatar
	ldrb r1, [r4, 0x5]
	lsls r0, r1, 3
	adds r0, r1
	lsls r0, 2
	ldr r1, _080E55FC @ =gMapObjects
	adds r7, r0, r1
	movs r0, 0x2
	mov r9, r0
	movs r0, 0x2
	mov r1, r8
	ands r0, r1
	cmp r0, 0
	bne _080E5634
	bl sub_80E6024
	ldrb r0, [r7, 0x1E]
	bl MetatileBehavior_IsBumpySlope
	lsls r0, 24
	lsrs r1, r0, 24
	cmp r1, 0
	bne _080E5620
	strb r1, [r4, 0x8]
	ldrb r0, [r6]
	cmp r0, 0
	bne _080E5600
	strb r5, [r6]
	b _080E560A
	.align 2, 0
_080E55F8: .4byte gPlayerAvatar
_080E55FC: .4byte gMapObjects
_080E5600:
	cmp r0, r5
	beq _080E5610
	ldrb r0, [r4, 0x2]
	cmp r0, 0x2
	beq _080E5610
_080E560A:
	strb r1, [r4, 0x2]
	movs r0, 0x4
	b _080E5664
_080E5610:
	ldr r1, _080E561C @ =gPlayerAvatar
	movs r0, 0x2
	strb r0, [r1, 0x2]
	movs r0, 0xC
	b _080E5664
	.align 2, 0
_080E561C: .4byte gPlayerAvatar
_080E5620:
	mov r0, r9
	strb r0, [r4, 0x8]
	adds r0, r6, 0
	mov r1, r10
	mov r2, r8
	bl CheckMovementInputAcroBike
	lsls r0, 24
	lsrs r0, 24
	b _080E5664
_080E5634:
	ldrb r0, [r6]
	cmp r0, 0
	bne _080E564A
	strb r5, [r6]
	mov r1, r9
	strb r1, [r4, 0x8]
	strb r0, [r4, 0x2]
	bl sub_80E6024
	movs r0, 0x5
	b _080E5664
_080E564A:
	cmp r2, r0
	beq _080E565C
	ldrb r0, [r4, 0x2]
	cmp r0, 0x2
	beq _080E565C
	movs r0, 0
	strb r0, [r4, 0x2]
	movs r0, 0x5
	b _080E5664
_080E565C:
	ldr r1, _080E5674 @ =gPlayerAvatar
	movs r0, 0x2
	strb r0, [r1, 0x2]
	movs r0, 0xA
_080E5664:
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r1}
	bx r1
	.align 2, 0
_080E5674: .4byte gPlayerAvatar
	thumb_func_end CheckMovementInputAcroBikeMovingWheelie

	thumb_func_start CheckMovementInputAcroBikeUnknownMode5
CheckMovementInputAcroBikeUnknownMode5: @ 80E5678
	push {r4-r6,lr}
	mov r6, r8
	push {r6}
	mov r8, r0
	adds r4, r1, 0
	adds r5, r2, 0
	lsls r4, 16
	lsrs r4, 16
	lsls r5, 16
	lsrs r5, 16
	ldr r6, _080E56CC @ =gPlayerAvatar
	ldrb r1, [r6, 0x5]
	lsls r0, r1, 3
	adds r0, r1
	lsls r0, 2
	ldr r1, _080E56D0 @ =gMapObjects
	adds r0, r1
	ldrb r2, [r0, 0x1]
	movs r1, 0x3
	negs r1, r1
	ands r1, r2
	strb r1, [r0, 0x1]
	ldrb r1, [r0, 0x18]
	lsls r1, 28
	lsrs r1, 28
	bl FieldObjectSetDirection
	movs r0, 0
	strb r0, [r6, 0x8]
	mov r0, r8
	adds r1, r4, 0
	adds r2, r5, 0
	bl CheckMovementInputAcroBike
	lsls r0, 24
	lsrs r0, 24
	pop {r3}
	mov r8, r3
	pop {r4-r6}
	pop {r1}
	bx r1
	.align 2, 0
_080E56CC: .4byte gPlayerAvatar
_080E56D0: .4byte gMapObjects
	thumb_func_end CheckMovementInputAcroBikeUnknownMode5

	thumb_func_start CheckMovementInputAcroBikeUnknownMode6
CheckMovementInputAcroBikeUnknownMode6: @ 80E56D4
	push {r4,lr}
	lsls r1, 16
	lsrs r1, 16
	lsls r2, 16
	lsrs r2, 16
	ldr r4, _080E56F4 @ =gPlayerAvatar
	movs r3, 0
	strb r3, [r4, 0x8]
	bl CheckMovementInputAcroBike
	lsls r0, 24
	lsrs r0, 24
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_080E56F4: .4byte gPlayerAvatar
	thumb_func_end CheckMovementInputAcroBikeUnknownMode6

	thumb_func_start sub_80E56F8
sub_80E56F8: @ 80E56F8
	push {lr}
	lsls r0, 24
	lsrs r0, 24
	bl PlayerFaceDirection
	pop {r0}
	bx r0
	thumb_func_end sub_80E56F8

	thumb_func_start sub_80E5708
sub_80E5708: @ 80E5708
	push {r4,r5,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	ldr r0, _080E573C @ =gPlayerAvatar
	ldrb r1, [r0, 0x5]
	lsls r0, r1, 3
	adds r0, r1
	lsls r0, 2
	ldr r1, _080E5740 @ =gMapObjects
	adds r5, r0, r1
	ldrb r1, [r5, 0x1E]
	adds r0, r4, 0
	bl sub_80E5E70
	lsls r0, 24
	cmp r0, 0
	bne _080E572E
	ldrb r0, [r5, 0x18]
	lsrs r4, r0, 4
_080E572E:
	adds r0, r4, 0
	bl PlayerFaceDirection
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080E573C: .4byte gPlayerAvatar
_080E5740: .4byte gMapObjects
	thumb_func_end sub_80E5708

	thumb_func_start sub_80E5744
sub_80E5744: @ 80E5744
	push {r4-r6,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	adds r6, r4, 0
	ldr r0, _080E5774 @ =gPlayerAvatar
	ldrb r1, [r0, 0x5]
	lsls r0, r1, 3
	adds r0, r1
	lsls r0, 2
	ldr r1, _080E5778 @ =gMapObjects
	adds r5, r0, r1
	ldrb r1, [r5, 0x1E]
	adds r0, r4, 0
	bl sub_80E5E70
	lsls r0, 24
	cmp r0, 0
	bne _080E577C
	ldrb r0, [r5, 0x18]
	lsrs r0, 4
	bl sub_80E56F8
	b _080E57B6
	.align 2, 0
_080E5774: .4byte gPlayerAvatar
_080E5778: .4byte gMapObjects
_080E577C:
	adds r0, r4, 0
	bl sub_80E5D34
	lsls r0, 24
	lsrs r1, r0, 24
	movs r2, 0xFF
	lsls r2, 24
	adds r0, r2
	lsrs r0, 24
	cmp r0, 0xA
	bhi _080E57B0
	cmp r1, 0x6
	bne _080E579E
	adds r0, r4, 0
	bl PlayerJumpLedge
	b _080E57B6
_080E579E:
	subs r0, r1, 0x5
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x3
	bls _080E57B6
	adds r0, r4, 0
	bl PlayerOnBikeCollide
	b _080E57B6
_080E57B0:
	adds r0, r6, 0
	bl npc_use_some_d2s
_080E57B6:
	pop {r4-r6}
	pop {r0}
	bx r0
	thumb_func_end sub_80E5744

	thumb_func_start sub_80E57BC
sub_80E57BC: @ 80E57BC
	push {r4,r5,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	ldr r0, _080E57F0 @ =gPlayerAvatar
	ldrb r1, [r0, 0x5]
	lsls r0, r1, 3
	adds r0, r1
	lsls r0, 2
	ldr r1, _080E57F4 @ =gMapObjects
	adds r5, r0, r1
	ldrb r1, [r5, 0x1E]
	adds r0, r4, 0
	bl sub_80E5E70
	lsls r0, 24
	cmp r0, 0
	bne _080E57E2
	ldrb r0, [r5, 0x18]
	lsrs r4, r0, 4
_080E57E2:
	adds r0, r4, 0
	bl sub_805951C
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080E57F0: .4byte gPlayerAvatar
_080E57F4: .4byte gMapObjects
	thumb_func_end sub_80E57BC

	thumb_func_start sub_80E57F8
sub_80E57F8: @ 80E57F8
	push {r4,r5,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	ldr r0, _080E582C @ =gPlayerAvatar
	ldrb r1, [r0, 0x5]
	lsls r0, r1, 3
	adds r0, r1
	lsls r0, 2
	ldr r1, _080E5830 @ =gMapObjects
	adds r5, r0, r1
	ldrb r1, [r5, 0x1E]
	adds r0, r4, 0
	bl sub_80E5E70
	lsls r0, 24
	cmp r0, 0
	bne _080E581E
	ldrb r0, [r5, 0x18]
	lsrs r4, r0, 4
_080E581E:
	adds r0, r4, 0
	bl sub_8059534
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080E582C: .4byte gPlayerAvatar
_080E5830: .4byte gMapObjects
	thumb_func_end sub_80E57F8

	thumb_func_start sub_80E5834
sub_80E5834: @ 80E5834
	push {r4,r5,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	ldr r0, _080E5868 @ =gPlayerAvatar
	ldrb r1, [r0, 0x5]
	lsls r0, r1, 3
	adds r0, r1
	lsls r0, 2
	ldr r1, _080E586C @ =gMapObjects
	adds r5, r0, r1
	ldrb r1, [r5, 0x1E]
	adds r0, r4, 0
	bl sub_80E5E70
	lsls r0, 24
	cmp r0, 0
	bne _080E585A
	ldrb r0, [r5, 0x18]
	lsrs r4, r0, 4
_080E585A:
	adds r0, r4, 0
	bl sub_8059504
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080E5868: .4byte gPlayerAvatar
_080E586C: .4byte gMapObjects
	thumb_func_end sub_80E5834

	thumb_func_start sub_80E5870
sub_80E5870: @ 80E5870
	push {r4,r5,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	ldr r0, _080E58A4 @ =gPlayerAvatar
	ldrb r1, [r0, 0x5]
	lsls r0, r1, 3
	adds r0, r1
	lsls r0, 2
	ldr r1, _080E58A8 @ =gMapObjects
	adds r5, r0, r1
	ldrb r1, [r5, 0x1E]
	adds r0, r4, 0
	bl sub_80E5E70
	lsls r0, 24
	cmp r0, 0
	bne _080E5896
	ldrb r0, [r5, 0x18]
	lsrs r4, r0, 4
_080E5896:
	adds r0, r4, 0
	bl sub_805954C
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080E58A4: .4byte gPlayerAvatar
_080E58A8: .4byte gMapObjects
	thumb_func_end sub_80E5870

	thumb_func_start sub_80E58AC
sub_80E58AC: @ 80E58AC
	push {r4,r5,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	ldr r0, _080E58D8 @ =gPlayerAvatar
	ldrb r1, [r0, 0x5]
	lsls r0, r1, 3
	adds r0, r1
	lsls r0, 2
	ldr r1, _080E58DC @ =gMapObjects
	adds r5, r0, r1
	ldrb r1, [r5, 0x1E]
	adds r0, r4, 0
	bl sub_80E5E70
	lsls r0, 24
	cmp r0, 0
	bne _080E58E0
	ldrb r0, [r5, 0x18]
	lsrs r0, 4
	bl sub_80E5870
	b _080E591A
	.align 2, 0
_080E58D8: .4byte gPlayerAvatar
_080E58DC: .4byte gMapObjects
_080E58E0:
	adds r0, r4, 0
	bl sub_80E5D34
	lsls r0, 24
	lsrs r1, r0, 24
	cmp r1, 0
	beq _080E5914
	cmp r1, 0x9
	beq _080E5914
	cmp r1, 0x6
	bne _080E58FE
	adds r0, r4, 0
	bl sub_8059594
	b _080E591A
_080E58FE:
	subs r0, r1, 0x5
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x3
	bls _080E591A
	cmp r1, 0xB
	bhi _080E5914
	adds r0, r4, 0
	bl sub_80E5870
	b _080E591A
_080E5914:
	adds r0, r4, 0
	bl sub_8059570
_080E591A:
	pop {r4,r5}
	pop {r0}
	bx r0
	thumb_func_end sub_80E58AC

	thumb_func_start sub_80E5920
sub_80E5920: @ 80E5920
	push {r4,r5,lr}
	lsls r0, 24
	lsrs r5, r0, 24
	adds r0, r5, 0
	bl sub_80E5D34
	lsls r0, 24
	lsrs r0, 24
	adds r1, r0, 0
	cmp r0, 0
	beq _080E5954
	cmp r0, 0x7
	beq _080E5980
	cmp r0, 0x9
	bls _080E594C
	adds r0, r1, 0
	adds r1, r5, 0
	bl sub_80E5EC0
	lsls r0, 24
	cmp r0, 0
	bne _080E5954
_080E594C:
	adds r0, r5, 0
	bl sub_80E5708
	b _080E5980
_080E5954:
	ldr r0, _080E5988 @ =gPlayerAvatar
	ldrb r0, [r0, 0x5]
	lsls r4, r0, 3
	adds r4, r0
	lsls r4, 2
	ldr r0, _080E598C @ =gMapObjects
	adds r4, r0
	movs r0, 0x22
	bl PlaySE
	ldrb r0, [r4, 0x1]
	movs r1, 0x2
	orrs r0, r1
	strb r0, [r4, 0x1]
	adds r0, r5, 0
	bl sub_80608A4
	lsls r0, 24
	lsrs r0, 24
	movs r1, 0x2
	bl player_npc_set_state_and_x22_etc
_080E5980:
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080E5988: .4byte gPlayerAvatar
_080E598C: .4byte gMapObjects
	thumb_func_end sub_80E5920

	thumb_func_start sub_80E5990
sub_80E5990: @ 80E5990
	push {lr}
	lsls r0, 24
	lsrs r0, 24
	bl sub_80595B8
	pop {r0}
	bx r0
	thumb_func_end sub_80E5990

	thumb_func_start sub_80E59A0
sub_80E59A0: @ 80E59A0
	push {r4-r7,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	adds r6, r4, 0
	ldr r7, _080E59D0 @ =gPlayerAvatar
	ldrb r1, [r7, 0x5]
	lsls r0, r1, 3
	adds r0, r1
	lsls r0, 2
	ldr r1, _080E59D4 @ =gMapObjects
	adds r5, r0, r1
	ldrb r1, [r5, 0x1E]
	adds r0, r4, 0
	bl sub_80E5E70
	lsls r0, 24
	cmp r0, 0
	bne _080E59D8
	ldrb r0, [r5, 0x18]
	lsrs r0, 4
	bl sub_8059504
	b _080E5A28
	.align 2, 0
_080E59D0: .4byte gPlayerAvatar
_080E59D4: .4byte gMapObjects
_080E59D8:
	adds r0, r4, 0
	bl sub_80E5D34
	lsls r0, 24
	lsrs r1, r0, 24
	movs r2, 0xFF
	lsls r2, 24
	adds r0, r2
	lsrs r0, 24
	cmp r0, 0xA
	bhi _080E5A1E
	cmp r1, 0x6
	bne _080E59FA
	adds r0, r4, 0
	bl sub_8059594
	b _080E5A28
_080E59FA:
	cmp r1, 0x9
	beq _080E5A0E
	cmp r1, 0x4
	bhi _080E5A28
	ldrb r0, [r5, 0x1E]
	bl MetatileBehavior_IsBumpySlope
	lsls r0, 24
	cmp r0, 0
	beq _080E5A16
_080E5A0E:
	adds r0, r4, 0
	bl sub_8059504
	b _080E5A28
_080E5A16:
	adds r0, r4, 0
	bl sub_80595DC
	b _080E5A28
_080E5A1E:
	adds r0, r6, 0
	bl sub_8059618
	movs r0, 0x2
	strb r0, [r7, 0x2]
_080E5A28:
	pop {r4-r7}
	pop {r0}
	bx r0
	thumb_func_end sub_80E59A0

	thumb_func_start sub_80E5A30
sub_80E5A30: @ 80E5A30
	push {r4-r7,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	adds r6, r4, 0
	ldr r7, _080E5A60 @ =gPlayerAvatar
	ldrb r1, [r7, 0x5]
	lsls r0, r1, 3
	adds r0, r1
	lsls r0, 2
	ldr r1, _080E5A64 @ =gMapObjects
	adds r5, r0, r1
	ldrb r1, [r5, 0x1E]
	adds r0, r4, 0
	bl sub_80E5E70
	lsls r0, 24
	cmp r0, 0
	bne _080E5A68
	ldrb r0, [r5, 0x18]
	lsrs r0, 4
	bl sub_805951C
	b _080E5AB8
	.align 2, 0
_080E5A60: .4byte gPlayerAvatar
_080E5A64: .4byte gMapObjects
_080E5A68:
	adds r0, r4, 0
	bl sub_80E5D34
	lsls r0, 24
	lsrs r1, r0, 24
	movs r2, 0xFF
	lsls r2, 24
	adds r0, r2
	lsrs r0, 24
	cmp r0, 0xA
	bhi _080E5AAE
	cmp r1, 0x6
	bne _080E5A8A
	adds r0, r4, 0
	bl sub_8059594
	b _080E5AB8
_080E5A8A:
	cmp r1, 0x9
	beq _080E5A9E
	cmp r1, 0x4
	bhi _080E5AB8
	ldrb r0, [r5, 0x1E]
	bl MetatileBehavior_IsBumpySlope
	lsls r0, 24
	cmp r0, 0
	beq _080E5AA6
_080E5A9E:
	adds r0, r4, 0
	bl sub_8059504
	b _080E5AB8
_080E5AA6:
	adds r0, r4, 0
	bl sub_80595DC
	b _080E5AB8
_080E5AAE:
	adds r0, r6, 0
	bl sub_8059600
	movs r0, 0x2
	strb r0, [r7, 0x2]
_080E5AB8:
	pop {r4-r7}
	pop {r0}
	bx r0
	thumb_func_end sub_80E5A30

	thumb_func_start sub_80E5AC0
sub_80E5AC0: @ 80E5AC0
	push {r4-r6,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	adds r6, r4, 0
	ldr r0, _080E5AF0 @ =gPlayerAvatar
	ldrb r1, [r0, 0x5]
	lsls r0, r1, 3
	adds r0, r1
	lsls r0, 2
	ldr r1, _080E5AF4 @ =gMapObjects
	adds r5, r0, r1
	ldrb r1, [r5, 0x1E]
	adds r0, r4, 0
	bl sub_80E5E70
	lsls r0, 24
	cmp r0, 0
	bne _080E5AF8
	ldrb r0, [r5, 0x18]
	lsrs r0, 4
	bl sub_8059534
	b _080E5B32
	.align 2, 0
_080E5AF0: .4byte gPlayerAvatar
_080E5AF4: .4byte gMapObjects
_080E5AF8:
	adds r0, r4, 0
	bl sub_80E5D34
	lsls r0, 24
	lsrs r1, r0, 24
	movs r2, 0xFF
	lsls r2, 24
	adds r0, r2
	lsrs r0, 24
	cmp r0, 0xA
	bhi _080E5B2C
	cmp r1, 0x6
	bne _080E5B1A
	adds r0, r4, 0
	bl PlayerJumpLedge
	b _080E5B32
_080E5B1A:
	subs r0, r1, 0x5
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x3
	bls _080E5B32
	adds r0, r4, 0
	bl sub_8059534
	b _080E5B32
_080E5B2C:
	adds r0, r6, 0
	bl sub_8059630
_080E5B32:
	pop {r4-r6}
	pop {r0}
	bx r0
	thumb_func_end sub_80E5AC0

	thumb_func_start sub_80E5B38
sub_80E5B38: @ 80E5B38
	push {lr}
	lsls r0, 16
	lsrs r3, r0, 16
	lsls r1, 16
	lsrs r2, r1, 16
	ldr r0, _080E5B5C @ =gPlayerAvatar
	ldrb r1, [r0]
	movs r0, 0x4
	ands r0, r1
	cmp r0, 0
	beq _080E5B56
	adds r0, r3, 0
	adds r1, r2, 0
	bl sub_80E5B60
_080E5B56:
	pop {r0}
	bx r0
	.align 2, 0
_080E5B5C: .4byte gPlayerAvatar
	thumb_func_end sub_80E5B38

	thumb_func_start sub_80E5B60
sub_80E5B60: @ 80E5B60
	push {r4,r5,lr}
	lsls r1, 16
	lsrs r5, r1, 16
	adds r0, r5, 0
	bl sub_80E5CF4
	lsls r0, 24
	lsrs r2, r0, 24
	ldr r4, _080E5B88 @ =gPlayerAvatar
	ldr r0, [r4, 0xC]
	movs r1, 0xF
	ands r0, r1
	cmp r2, r0
	bne _080E5B8C
	ldrb r0, [r4, 0x14]
	cmp r0, 0xFE
	bhi _080E5B96
	adds r0, 0x1
	strb r0, [r4, 0x14]
	b _080E5B96
	.align 2, 0
_080E5B88: .4byte gPlayerAvatar
_080E5B8C:
	adds r0, r2, 0
	bl sub_80E5C7C
	movs r0, 0
	strb r0, [r4, 0xB]
_080E5B96:
	movs r0, 0xF
	adds r2, r5, 0
	ands r2, r0
	ldr r4, _080E5BB4 @ =gPlayerAvatar
	ldr r0, [r4, 0x10]
	movs r1, 0xF
	ands r0, r1
	cmp r2, r0
	bne _080E5BB8
	ldrb r0, [r4, 0x1C]
	cmp r0, 0xFE
	bhi _080E5BC2
	adds r0, 0x1
	strb r0, [r4, 0x1C]
	b _080E5BC2
	.align 2, 0
_080E5BB4: .4byte gPlayerAvatar
_080E5BB8:
	adds r0, r2, 0
	bl sub_80E5CB8
	movs r0, 0
	strb r0, [r4, 0xB]
_080E5BC2:
	pop {r4,r5}
	pop {r0}
	bx r0
	thumb_func_end sub_80E5B60

	thumb_func_start sub_80E5BC8
sub_80E5BC8: @ 80E5BC8
	push {r4,r5,lr}
	adds r3, r0, 0
	adds r4, r1, 0
	movs r2, 0
	ldrb r0, [r3]
	cmp r0, 0
	beq _080E5BF2
	ldr r5, _080E5C0C @ =gUnknown_0202E86C
_080E5BD8:
	adds r0, r2, r5
	adds r1, r3, r2
	ldrb r0, [r0]
	ldrb r1, [r1]
	cmp r0, r1
	bhi _080E5C08
	adds r0, r2, 0x1
	lsls r0, 24
	lsrs r2, r0, 24
	adds r0, r3, r2
	ldrb r0, [r0]
	cmp r0, 0
	bne _080E5BD8
_080E5BF2:
	movs r2, 0
	ldrb r0, [r4]
	cmp r0, 0
	beq _080E5C22
	ldr r3, _080E5C10 @ =gUnknown_0202E874
_080E5BFC:
	adds r0, r2, r3
	adds r1, r4, r2
	ldrb r0, [r0]
	ldrb r1, [r1]
	cmp r0, r1
	bls _080E5C14
_080E5C08:
	movs r0, 0
	b _080E5C24
	.align 2, 0
_080E5C0C: .4byte gUnknown_0202E86C
_080E5C10: .4byte gUnknown_0202E874
_080E5C14:
	adds r0, r2, 0x1
	lsls r0, 24
	lsrs r2, r0, 24
	adds r0, r4, r2
	ldrb r0, [r0]
	cmp r0, 0
	bne _080E5BFC
_080E5C22:
	movs r0, 0x1
_080E5C24:
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end sub_80E5BC8

	thumb_func_start sub_80E5C2C
sub_80E5C2C: @ 80E5C2C
	push {r4-r6,lr}
	movs r6, 0
	movs r5, 0
_080E5C32:
	ldr r0, _080E5C64 @ =gUnknown_083DB608
	adds r4, r5, r0
	ldr r0, _080E5C68 @ =gPlayerAvatar
	ldr r1, [r0, 0xC]
	ldr r2, [r0, 0x10]
	ldr r0, [r4, 0x8]
	ands r1, r0
	ldr r0, [r4, 0xC]
	ands r2, r0
	ldr r0, [r4]
	cmp r1, r0
	bne _080E5C6C
	ldr r0, [r4, 0x4]
	cmp r2, r0
	bne _080E5C6C
	ldr r0, [r4, 0x10]
	ldr r1, [r4, 0x14]
	bl sub_80E5BC8
	lsls r0, 24
	cmp r0, 0
	beq _080E5C6C
	ldrb r0, [r4, 0x18]
	b _080E5C76
	.align 2, 0
_080E5C64: .4byte gUnknown_083DB608
_080E5C68: .4byte gPlayerAvatar
_080E5C6C:
	adds r5, 0x1C
	adds r6, 0x1
	cmp r6, 0x3
	bls _080E5C32
	movs r0, 0
_080E5C76:
	pop {r4-r6}
	pop {r1}
	bx r1
	thumb_func_end sub_80E5C2C

	thumb_func_start sub_80E5C7C
sub_80E5C7C: @ 80E5C7C
	push {r4,lr}
	lsls r0, 24
	ldr r3, _080E5CB4 @ =gPlayerAvatar
	ldr r2, [r3, 0xC]
	lsls r2, 4
	movs r1, 0xF0
	lsls r1, 20
	ands r1, r0
	lsrs r1, 24
	orrs r2, r1
	str r2, [r3, 0xC]
	movs r1, 0x7
	adds r4, r3, 0
	adds r3, 0x14
_080E5C98:
	adds r2, r1, r3
	subs r1, 0x1
	adds r0, r1, r3
	ldrb r0, [r0]
	strb r0, [r2]
	lsls r1, 24
	lsrs r1, 24
	cmp r1, 0
	bne _080E5C98
	movs r0, 0x1
	strb r0, [r4, 0x14]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080E5CB4: .4byte gPlayerAvatar
	thumb_func_end sub_80E5C7C

	thumb_func_start sub_80E5CB8
sub_80E5CB8: @ 80E5CB8
	push {r4,lr}
	lsls r0, 24
	ldr r3, _080E5CF0 @ =gPlayerAvatar
	ldr r2, [r3, 0x10]
	lsls r2, 4
	movs r1, 0xF0
	lsls r1, 20
	ands r1, r0
	lsrs r1, 24
	orrs r2, r1
	str r2, [r3, 0x10]
	movs r1, 0x7
	adds r4, r3, 0
	adds r3, 0x1C
_080E5CD4:
	adds r2, r1, r3
	subs r1, 0x1
	adds r0, r1, r3
	ldrb r0, [r0]
	strb r0, [r2]
	lsls r1, 24
	lsrs r1, 24
	cmp r1, 0
	bne _080E5CD4
	movs r0, 0x1
	strb r0, [r4, 0x1C]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080E5CF0: .4byte gPlayerAvatar
	thumb_func_end sub_80E5CB8

	thumb_func_start sub_80E5CF4
sub_80E5CF4: @ 80E5CF4
	push {lr}
	lsls r0, 16
	lsrs r1, r0, 16
	adds r2, r1, 0
	movs r0, 0x40
	ands r0, r1
	cmp r0, 0
	beq _080E5D08
	movs r0, 0x2
	b _080E5D2E
_080E5D08:
	movs r0, 0x80
	ands r0, r1
	cmp r0, 0
	beq _080E5D14
	movs r0, 0x1
	b _080E5D2E
_080E5D14:
	movs r0, 0x20
	ands r0, r1
	cmp r0, 0
	beq _080E5D20
	movs r0, 0x3
	b _080E5D2E
_080E5D20:
	movs r0, 0x10
	ands r2, r0
	cmp r2, 0
	bne _080E5D2C
	movs r0, 0
	b _080E5D2E
_080E5D2C:
	movs r0, 0x4
_080E5D2E:
	pop {r1}
	bx r1
	thumb_func_end sub_80E5CF4

	thumb_func_start sub_80E5D34
sub_80E5D34: @ 80E5D34
	push {r4-r6,lr}
	sub sp, 0x8
	adds r6, r0, 0
	lsls r6, 24
	lsrs r6, 24
	ldr r0, _080E5D98 @ =gPlayerAvatar
	ldrb r0, [r0, 0x5]
	lsls r4, r0, 3
	adds r4, r0
	lsls r4, 2
	ldr r0, _080E5D9C @ =gMapObjects
	adds r4, r0
	ldrh r1, [r4, 0x10]
	add r0, sp, 0x4
	strh r1, [r0]
	ldrh r0, [r4, 0x12]
	mov r5, sp
	adds r5, 0x6
	strh r0, [r5]
	adds r0, r6, 0
	add r1, sp, 0x4
	adds r2, r5, 0
	bl MoveCoords
	add r0, sp, 0x4
	movs r1, 0
	ldrsh r0, [r0, r1]
	movs r2, 0
	ldrsh r1, [r5, r2]
	bl MapGridGetMetatileBehaviorAt
	lsls r0, 24
	lsrs r0, 24
	add r1, sp, 0x4
	movs r3, 0
	ldrsh r1, [r1, r3]
	movs r3, 0
	ldrsh r2, [r5, r3]
	str r0, [sp]
	adds r0, r4, 0
	adds r3, r6, 0
	bl sub_80E5DA0
	lsls r0, 24
	lsrs r0, 24
	add sp, 0x8
	pop {r4-r6}
	pop {r1}
	bx r1
	.align 2, 0
_080E5D98: .4byte gPlayerAvatar
_080E5D9C: .4byte gMapObjects
	thumb_func_end sub_80E5D34

	thumb_func_start sub_80E5DA0
sub_80E5DA0: @ 80E5DA0
	push {r4,r5,lr}
	sub sp, 0x4
	ldr r4, [sp, 0x10]
	lsls r3, 24
	lsrs r3, 24
	lsls r4, 24
	lsrs r4, 24
	adds r5, r4, 0
	lsls r1, 16
	asrs r1, 16
	lsls r2, 16
	asrs r2, 16
	str r5, [sp]
	bl CheckForFieldObjectCollision
	lsls r0, 24
	lsrs r4, r0, 24
	cmp r4, 0x4
	bhi _080E5DE0
	cmp r4, 0
	bne _080E5DDC
	adds r0, r5, 0
	bl IsRunningDisallowedByMetatile
	lsls r0, 24
	cmp r0, 0
	beq _080E5DD8
	movs r4, 0x2
_080E5DD8:
	cmp r4, 0
	beq _080E5DE0
_080E5DDC:
	bl sub_80E5E4C
_080E5DE0:
	adds r0, r4, 0
	add sp, 0x4
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end sub_80E5DA0

	thumb_func_start sub_80E5DEC
sub_80E5DEC: @ 80E5DEC
	push {lr}
	lsls r0, 24
	lsrs r0, 24
	bl IsRunningDisallowedByMetatile
	lsls r0, 24
	cmp r0, 0
	bne _080E5E04
	ldr r0, _080E5E08 @ =gMapHeader
	ldrb r0, [r0, 0x17]
	cmp r0, 0x8
	bne _080E5E0C
_080E5E04:
	movs r0, 0x1
	b _080E5E0E
	.align 2, 0
_080E5E08: .4byte gMapHeader
_080E5E0C:
	movs r0, 0
_080E5E0E:
	pop {r1}
	bx r1
	thumb_func_end sub_80E5DEC

	thumb_func_start IsRunningDisallowedByMetatile
IsRunningDisallowedByMetatile: @ 80E5E14
	push {r4,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	adds r0, r4, 0
	bl MetatileBehavior_IsRunningDisallowed
	lsls r0, 24
	cmp r0, 0
	bne _080E5E3E
	adds r0, r4, 0
	bl MetatileBehavior_IsFortreeBridge
	lsls r0, 24
	cmp r0, 0
	beq _080E5E42
	bl PlayerGetZCoord
	movs r1, 0x1
	ands r1, r0
	cmp r1, 0
	bne _080E5E42
_080E5E3E:
	movs r0, 0x1
	b _080E5E44
_080E5E42:
	movs r0, 0
_080E5E44:
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end IsRunningDisallowedByMetatile

	thumb_func_start sub_80E5E4C
sub_80E5E4C: @ 80E5E4C
	push {lr}
	ldr r0, _080E5E68 @ =gUnknown_02039250
	ldrb r0, [r0]
	cmp r0, 0
	beq _080E5E62
	ldr r1, _080E5E6C @ =gUnknown_02039251
	ldrb r0, [r1]
	cmp r0, 0x63
	bhi _080E5E62
	adds r0, 0x1
	strb r0, [r1]
_080E5E62:
	pop {r0}
	bx r0
	.align 2, 0
_080E5E68: .4byte gUnknown_02039250
_080E5E6C: .4byte gUnknown_02039251
	thumb_func_end sub_80E5E4C

	thumb_func_start sub_80E5E70
sub_80E5E70: @ 80E5E70
	push {r4,r5,lr}
	lsls r0, 24
	lsls r1, 24
	lsrs r4, r1, 24
	adds r5, r4, 0
	movs r1, 0xFD
	lsls r1, 24
	adds r0, r1
	lsrs r0, 24
	cmp r0, 0x1
	bhi _080E5E9A
	adds r0, r4, 0
	bl MetatileBehavior_IsIsolatedVerticalRail
	lsls r0, 24
	cmp r0, 0
	bne _080E5EB2
	adds r0, r4, 0
	bl MetatileBehavior_IsVerticalRail
	b _080E5EAC
_080E5E9A:
	adds r0, r5, 0
	bl MetatileBehavior_IsIsolatedHorizontalRail
	lsls r0, 24
	cmp r0, 0
	bne _080E5EB2
	adds r0, r5, 0
	bl MetatileBehavior_IsHorizontalRail
_080E5EAC:
	lsls r0, 24
	cmp r0, 0
	beq _080E5EB6
_080E5EB2:
	movs r0, 0
	b _080E5EB8
_080E5EB6:
	movs r0, 0x1
_080E5EB8:
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end sub_80E5E70

	thumb_func_start sub_80E5EC0
sub_80E5EC0: @ 80E5EC0
	push {lr}
	lsls r0, 24
	lsrs r0, 24
	adds r2, r0, 0
	lsls r1, 24
	movs r3, 0xFF
	lsls r3, 24
	adds r1, r3
	lsrs r1, 24
	cmp r1, 0x1
	bhi _080E5EE0
	cmp r0, 0xA
	beq _080E5EE8
	cmp r0, 0xC
	bne _080E5EEC
	b _080E5EE8
_080E5EE0:
	cmp r2, 0xB
	beq _080E5EE8
	cmp r2, 0xD
	bne _080E5EEC
_080E5EE8:
	movs r0, 0
	b _080E5EEE
_080E5EEC:
	movs r0, 0x1
_080E5EEE:
	pop {r1}
	bx r1
	thumb_func_end sub_80E5EC0

	thumb_func_start IsBikingDisallowedByPlayer
IsBikingDisallowedByPlayer: @ 80E5EF4
	push {r4,lr}
	sub sp, 0x4
	ldr r0, _080E5F30 @ =gPlayerAvatar
	ldrb r1, [r0]
	movs r0, 0x18
	ands r0, r1
	cmp r0, 0
	bne _080E5F34
	mov r4, sp
	adds r4, 0x2
	mov r0, sp
	adds r1, r4, 0
	bl PlayerGetDestCoords
	mov r0, sp
	movs r1, 0
	ldrsh r0, [r0, r1]
	movs r2, 0
	ldrsh r1, [r4, r2]
	bl MapGridGetMetatileBehaviorAt
	lsls r0, 24
	lsrs r0, 24
	bl IsRunningDisallowedByMetatile
	lsls r0, 24
	cmp r0, 0
	bne _080E5F34
	movs r0, 0
	b _080E5F36
	.align 2, 0
_080E5F30: .4byte gPlayerAvatar
_080E5F34:
	movs r0, 0x1
_080E5F36:
	add sp, 0x4
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end IsBikingDisallowedByPlayer

	thumb_func_start player_should_look_direction_be_enforced_upon_movement
player_should_look_direction_be_enforced_upon_movement: @ 80E5F40
	push {lr}
	movs r0, 0x4
	bl TestPlayerAvatarFlags
	lsls r0, 24
	cmp r0, 0
	beq _080E5F74
	ldr r2, _080E5F6C @ =gMapObjects
	ldr r0, _080E5F70 @ =gPlayerAvatar
	ldrb r1, [r0, 0x5]
	lsls r0, r1, 3
	adds r0, r1
	lsls r0, 2
	adds r0, r2
	ldrb r0, [r0, 0x1E]
	bl MetatileBehavior_IsBumpySlope
	lsls r0, 24
	cmp r0, 0
	beq _080E5F74
	movs r0, 0
	b _080E5F76
	.align 2, 0
_080E5F6C: .4byte gMapObjects
_080E5F70: .4byte gPlayerAvatar
_080E5F74:
	movs r0, 0x1
_080E5F76:
	pop {r1}
	bx r1
	thumb_func_end player_should_look_direction_be_enforced_upon_movement

	thumb_func_start GetOnOffBike
GetOnOffBike: @ 80E5F7C
	push {r4,lr}
	lsls r0, 24
	lsrs r2, r0, 24
	ldr r1, _080E5FA4 @ =gUnknown_0202E854
	movs r0, 0
	strb r0, [r1]
	ldr r0, _080E5FA8 @ =gPlayerAvatar
	ldrb r1, [r0]
	movs r0, 0x6
	ands r0, r1
	cmp r0, 0
	beq _080E5FAC
	movs r0, 0x1
	bl SetPlayerAvatarTransitionFlags
	bl sav1_reset_battle_music_maybe
	bl sub_8053E90
	b _080E5FC0
	.align 2, 0
_080E5FA4: .4byte gUnknown_0202E854
_080E5FA8: .4byte gPlayerAvatar
_080E5FAC:
	adds r0, r2, 0
	bl SetPlayerAvatarTransitionFlags
	ldr r4, _080E5FC8 @ =0x00000193
	adds r0, r4, 0
	bl sav1_set_battle_music_maybe
	adds r0, r4, 0
	bl sub_8053FB0
_080E5FC0:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080E5FC8: .4byte 0x00000193
	thumb_func_end GetOnOffBike

	thumb_func_start sub_80E5FCC
sub_80E5FCC: @ 80E5FCC
	push {lr}
	ldr r2, _080E6008 @ =gPlayerAvatar
	movs r3, 0
	strb r3, [r2, 0x8]
	strb r3, [r2, 0x9]
	strb r3, [r2, 0xA]
	strb r3, [r2, 0xB]
	str r0, [r2, 0xC]
	str r1, [r2, 0x10]
	movs r1, 0
	adds r2, 0x14
_080E5FE2:
	adds r0, r1, r2
	strb r3, [r0]
	adds r0, r1, 0x1
	lsls r0, 24
	lsrs r1, r0, 24
	cmp r1, 0x7
	bls _080E5FE2
	movs r1, 0
	ldr r3, _080E600C @ =gUnknown_0202E874
	movs r2, 0
_080E5FF6:
	adds r0, r1, r3
	strb r2, [r0]
	adds r0, r1, 0x1
	lsls r0, 24
	lsrs r1, r0, 24
	cmp r1, 0x7
	bls _080E5FF6
	pop {r0}
	bx r0
	.align 2, 0
_080E6008: .4byte gPlayerAvatar
_080E600C: .4byte gUnknown_0202E874
	thumb_func_end sub_80E5FCC

	thumb_func_start sub_80E6010
sub_80E6010: @ 80E6010
	lsls r0, 24
	lsrs r0, 24
	ldr r2, _080E6020 @ =gPlayerAvatar
	strb r0, [r2, 0xA]
	lsrs r1, r0, 1
	adds r0, r1
	strb r0, [r2, 0xB]
	bx lr
	.align 2, 0
_080E6020: .4byte gPlayerAvatar
	thumb_func_end sub_80E6010

	thumb_func_start sub_80E6024
sub_80E6024: @ 80E6024
	ldr r1, _080E6030 @ =gPlayerAvatar
	movs r0, 0
	strb r0, [r1, 0xA]
	strb r0, [r1, 0xB]
	bx lr
	.align 2, 0
_080E6030: .4byte gPlayerAvatar
	thumb_func_end sub_80E6024

	thumb_func_start sub_80E6034
sub_80E6034: @ 80E6034
	push {lr}
	sub sp, 0x8
	ldr r1, _080E605C @ =gUnknown_083DB600
	mov r0, sp
	movs r2, 0x6
	bl memcpy
	ldr r2, _080E6060 @ =gPlayerAvatar
	ldrb r1, [r2]
	movs r0, 0x2
	ands r0, r1
	cmp r0, 0
	beq _080E6064
	ldrb r0, [r2, 0xA]
	lsls r0, 1
	add r0, sp
	movs r1, 0
	ldrsh r0, [r0, r1]
	b _080E607E
	.align 2, 0
_080E605C: .4byte gUnknown_083DB600
_080E6060: .4byte gPlayerAvatar
_080E6064:
	movs r0, 0x4
	ands r0, r1
	cmp r0, 0
	beq _080E6070
	movs r0, 0x3
	b _080E607E
_080E6070:
	movs r0, 0x88
	ands r0, r1
	cmp r0, 0
	bne _080E607C
	movs r0, 0x1
	b _080E607E
_080E607C:
	movs r0, 0x2
_080E607E:
	add sp, 0x8
	pop {r1}
	bx r1
	thumb_func_end sub_80E6034

	thumb_func_start sub_80E6084
sub_80E6084: @ 80E6084
	push {r4,r5,lr}
	sub sp, 0x4
	ldr r5, _080E60D4 @ =gPlayerAvatar
	ldrb r1, [r5]
	movs r0, 0x4
	ands r0, r1
	cmp r0, 0
	beq _080E60CC
	mov r4, sp
	adds r4, 0x2
	mov r0, sp
	adds r1, r4, 0
	bl PlayerGetDestCoords
	mov r0, sp
	movs r1, 0
	ldrsh r0, [r0, r1]
	movs r2, 0
	ldrsh r1, [r4, r2]
	bl MapGridGetMetatileBehaviorAt
	lsls r0, 24
	lsrs r0, 24
	bl MetatileBehavior_IsBumpySlope
	lsls r0, 24
	cmp r0, 0
	beq _080E60CC
	movs r0, 0x2
	strb r0, [r5, 0x8]
	bl player_get_direction_upper_nybble
	lsls r0, 24
	lsrs r0, 24
	bl sub_8059C94
_080E60CC:
	add sp, 0x4
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080E60D4: .4byte gPlayerAvatar
	thumb_func_end sub_80E6084

	.align 2, 0 @ Don't pad with nop.
