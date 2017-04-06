	.include "constants/gba_constants.inc"
	.include "constants/species_constants.inc"
	.include "asm/macros.inc"

	.syntax unified

	.text

	thumb_func_start sub_8134548
sub_8134548: @ 8134548
	push {r4,r5,lr}
	movs r4, 0
	movs r5, 0
_0813454E:
	ldr r0, _08134568 @ =gSaveBlock2
	ldr r1, _0813456C @ =0x00000556
	adds r0, r1
	adds r0, r5, r0
	ldrb r0, [r0]
	cmp r0, 0x6
	bhi _08134590
	lsls r0, 2
	ldr r1, _08134570 @ =_08134574
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
	ldr r1, _08134610 @ =gSaveBlock2
	ldr r2, _08134614 @ =0x00000556
	adds r0, r1, r2
	ldrb r0, [r0]
	cmp r0, 0x3
	beq _081345EE
	cmp r0, 0x6
	bne _08134606
_081345EE:
	ldr r2, _08134618 @ =0x00000557
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
	ldr r3, _08134644 @ =gSaveBlock2
	ldr r2, _08134648 @ =0x00000556
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
	ldr r1, _0813464C @ =0x0000055c
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
	ldr r0, _08134684 @ =gScriptResult
	ldrh r0, [r0]
	adds r7, r4, 0
	cmp r0, 0
	bne _08134680
	ldr r1, _08134688 @ =gSaveBlock2
	ldr r2, _0813468C @ =0x0000049a
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
	ldr r3, _081346F0 @ =0x000004cc
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
	bl CheckMonBattleTowerBanlist
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
	ldr r4, _08134738 @ =gSaveBlock2
	ldr r1, _0813473C @ =0x00000554
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
	ldr r2, _08134740 @ =0x00000564
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
	ldr r6, _081347B4 @ =gSaveBlock2 + 0x14C
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
	ldr r0, _081347B8 @ =gSaveBlock2
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
	ldr r2, _081347BC @ =gSaveBlock2 + 0x1EC
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
	ldr r4, _081347F0 @ =gSaveBlock2
	lsls r0, 16
	lsrs r0, 16
	mov r1, r9
	bl __modsi3
	lsls r0, 2
	add r0, sp
	ldr r0, [r0]
	adds r0, 0x64
	ldr r1, _081347F4 @ =0x00000564
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
	ldr r5, _08134838 @ =gSaveBlock2
	ldr r1, _0813483C @ =0x00000554
	adds r0, r5, r1
	ldrb r0, [r0]
	lsls r0, 31
	lsrs r6, r0, 31
	bl sub_81346F4
	lsls r0, 24
	cmp r0, 0
	beq _08134848
	ldr r2, _08134840 @ =0x00000564
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
	ldr r1, _08134844 @ =0x00000569
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
	ldr r2, _081348D8 @ =0x0000055c
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
	ldr r0, _081348DC @ =0x0000056a
	adds r0, r6
	mov r10, r0
	mov r8, r5
_08134876:
	bl Random
	movs r1, 0xFF
	ands r1, r0
	lsls r2, r1, 2
	adds r2, r1
	ldr r1, _081348D8 @ =0x0000055c
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
	ldr r4, _081348E0 @ =gSaveBlock2
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
	ldr r2, _08134950 @ =0x0000056a
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
	ldr r3, _08134954 @ =0x0000055c
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
	ldr r4, _08134958 @ =gSaveBlock2
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
	ldr r3, _081349EC @ =0x0000056a
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
	ldr r4, _081349F0 @ =gSaveBlock2
	cmp r0, r2
	beq _081349AC
	ldrh r0, [r5]
	subs r3, r0, 0x1
	ldr r0, _081349EC @ =0x0000056a
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
	ldr r4, _081349F0 @ =gSaveBlock2
	cmp r1, r0
	bne _0813496C
_081349B6:
	ldr r1, _081349F4 @ =0x00000564
	adds r0, r4, r1
	strb r2, [r0]
	ldr r2, _081349F4 @ =0x00000564
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
	ldr r1, _081349F8 @ =0x00000569
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
	ldr r1, _08134A14 @ =gBattleTowerTrainers
	lsls r0, r2, 1
	adds r0, r2
	lsls r0, 3
	b _08134A38
	.align 2, 0
_08134A14: .4byte gBattleTowerTrainers
_08134A18:
	cmp r1, 0xC7
	bhi _08134A34
	ldr r2, _08134A2C @ =gSaveBlock2
	subs r1, 0x64
	movs r0, 0xA4
	muls r0, r1
	adds r0, r2
	ldr r1, _08134A30 @ =0x0000014d
	b _08134A38
	.align 2, 0
_08134A2C: .4byte gSaveBlock2
_08134A30: .4byte 0x0000014d
_08134A34:
	ldr r0, _08134A5C @ =gSaveBlock2
	ldr r1, _08134A60 @ =0x00000499
_08134A38:
	adds r0, r1
	ldrb r1, [r0]
	movs r2, 0
	ldr r3, _08134A64 @ =gUnknown_08405E60
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
	ldr r0, _08134A68 @ =gUnknown_08405E92
	b _08134A8A
	.align 2, 0
_08134A5C: .4byte gSaveBlock2
_08134A60: .4byte 0x00000499
_08134A64: .4byte gUnknown_08405E60
_08134A68: .4byte gUnknown_08405E92
_08134A6C:
	movs r2, 0
	ldr r3, _08134A98 @ =gUnknown_08405E7E
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
	ldr r0, _08134A9C @ =gUnknown_08405EB0
_08134A8A:
	adds r0, r2, r0
	ldrb r1, [r0]
	ldr r0, _08134AA0 @ =0x00004010
	bl VarSet
	b _08134AAC
	.align 2, 0
_08134A98: .4byte gUnknown_08405E7E
_08134A9C: .4byte gUnknown_08405EB0
_08134AA0: .4byte 0x00004010
_08134AA4:
	ldr r0, _08134AB0 @ =0x00004010
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
	ldr r0, _08134B3C @ =gSaveBlock2
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
	ldr r0, _08134B40 @ =gSaveBlock2 + 0x158
	add r0, r9
	ldrb r0, [r0]
	ldr r1, [sp, 0x18]
	cmp r0, r1
	bne _08134B14
	movs r0, 0xA4
	muls r0, r5
	ldr r1, _08134B40 @ =gSaveBlock2 + 0x158
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
	ldr r3, _08134B44 @ =gSaveBlock2 + 0x150
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
	ldr r2, _08134BFC @ =gSaveBlock2
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
	ldr r3, _08134C70 @ =gSaveBlock2
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
	ldr r2, _08134C70 @ =gSaveBlock2
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
	ldr r3, _08134C90 @ =gSaveBlock2
	ldr r0, _08134C94 @ =0x00000564
	adds r1, r3, r0
	ldrb r0, [r1]
	cmp r0, 0xC8
	bne _08134CA0
	ldr r1, _08134C98 @ =gTrainerClassToPicIndex
	ldr r2, _08134C9C @ =0x00000499
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
	ldr r2, _08134CBC @ =gTrainerClassToPicIndex
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
	ldr r3, _08134CD8 @ =gTrainerClassToPicIndex
	ldr r2, _08134CDC @ =gBattleTowerTrainers
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
	ldr r3, _08134CFC @ =gSaveBlock2
	ldr r0, _08134D00 @ =0x00000564
	adds r1, r3, r0
	ldrb r0, [r1]
	cmp r0, 0xC8
	bne _08134D0C
	ldr r1, _08134D04 @ =gTrainerClassToNameIndex
	ldr r2, _08134D08 @ =0x00000499
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
	ldr r3, _08134D24 @ =gTrainerClassToNameIndex
	ldr r2, _08134D28 @ =gBattleTowerTrainers
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
	ldr r2, _08134D48 @ =gTrainerClassToNameIndex
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
	ldr r2, _08134D74 @ =gSaveBlock2
	ldr r0, _08134D78 @ =0x00000564
	adds r1, r2, r0
	ldrb r0, [r1]
	cmp r0, 0xC8
	bne _08134D80
	movs r3, 0
	ldr r5, _08134D7C @ =0x0000049c
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
	ldr r2, _08134DA4 @ =gBattleTowerTrainers
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
	ldr r1, _08134E04 @ =gSaveBlock2
	ldr r2, _08134E08 @ =0x00000564
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
	ldr r1, _08134E94 @ =gEnemyParty
	adds r0, r1
	movs r1, 0x2C
	muls r1, r6
	ldr r2, _08134E98 @ =gSaveBlock2 + 0x4CC
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
	ldr r3, _08134ECC @ =0xffffc158
	adds r5, r4, r3
_08134EA4:
	movs r0, 0x64
	muls r0, r6
	ldr r1, _08134ED0 @ =gEnemyParty
	adds r0, r1
	ldr r2, _08134ED4 @ =0x00000564
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
	ldr r2, _08134EF4 @ =gSaveBlock2
	ldr r3, _08134EF8 @ =0x00000554
	adds r0, r2, r3
	ldrb r1, [r0]
	movs r0, 0x1
	ands r0, r1
	adds r1, r2, 0
	cmp r0, 0
	beq _08134F00
	ldr r0, _08134EFC @ =gBattleTowerLevel100Mons
	mov r10, r0
	movs r2, 0x64
	str r2, [sp, 0x10]
	b _08134F08
	.align 2, 0
_08134EF4: .4byte gSaveBlock2
_08134EF8: .4byte 0x00000554
_08134EFC: .4byte gBattleTowerLevel100Mons
_08134F00:
	ldr r3, _08134F54 @ =gBattleTowerLevel50Mons
	mov r10, r3
	movs r0, 0x32
	str r0, [sp, 0x10]
_08134F08:
	ldr r2, _08134F58 @ =gBattleTowerTrainers
	ldr r3, _08134F5C @ =0x00000564
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
	ldr r1, _08135094 @ =gEnemyParty
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
	ldr r3, _08135098 @ =gBattleTowerHeldItems
	mov r9, r3
	lsls r0, r7, 4
	add r0, r10
	mov r8, r0
	movs r3, 0
_08134F94:
	ldr r0, _08135094 @ =gEnemyParty
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
	ldr r1, _08135094 @ =gEnemyParty
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
	ldr r3, _08135094 @ =gEnemyParty
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
	ldr r3, _08135094 @ =gEnemyParty
	adds r4, r3
	adds r0, r4, 0
	movs r1, 0x20
	add r2, sp, 0xC
	bl SetMonData
	mov r0, r8
	add r0, r10
	ldrb r2, [r0, 0x2]
	lsls r2, 1
	ldr r0, _08135098 @ =gBattleTowerHeldItems
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

	thumb_func_start CalcBattleTowerBanlistSeenCount
CalcBattleTowerBanlistSeenCount: @ 813509C
	push {r4-r6,lr}
	movs r5, 0
	ldr r2, _081350D8 @ =gBattleTowerBanlist
	ldrh r0, [r2]
	ldr r1, _081350DC @ =0x0000ffff
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
	thumb_func_end CalcBattleTowerBanlistSeenCount

	thumb_func_start AppendBattleTowerBannedSpeciesName
AppendBattleTowerBannedSpeciesName: @ 81350E0
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
	ldr r1, _08135118 @ =_0813511C
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
	ldr r0, _08135158 @ =gStringVar1
	ldr r1, _0813515C @ =gUnknown_08400E23
	bl StringAppend
	b _081351D8
	.align 2, 0
_08135158: .4byte gStringVar1
_0813515C: .4byte gUnknown_08400E23
_08135160:
	cmp r5, r4
	ble _081351D8
	ldr r0, _08135170 @ =gStringVar1
	ldr r1, _08135174 @ =gUnknown_08400E29
	bl StringAppend
	b _081351D8
	.align 2, 0
_08135170: .4byte gStringVar1
_08135174: .4byte gUnknown_08400E29
_08135178:
	cmp r4, r5
	bne _08135190
	ldr r0, _08135188 @ =gStringVar1
	ldr r1, _0813518C @ =gUnknown_08400E23
	bl StringAppend
	b _08135198
	.align 2, 0
_08135188: .4byte gStringVar1
_0813518C: .4byte gUnknown_08400E23
_08135190:
	ldr r0, _081351A4 @ =gStringVar1
	ldr r1, _081351A8 @ =gUnknown_08400E29
	bl StringAppend
_08135198:
	ldr r0, _081351A4 @ =gStringVar1
	ldr r1, _081351AC @ =gUnknown_08400E30
	bl StringAppend
	b _081351D8
	.align 2, 0
_081351A4: .4byte gStringVar1
_081351A8: .4byte gUnknown_08400E29
_081351AC: .4byte gUnknown_08400E30
_081351B0:
	cmp r4, r5
	bne _081351C8
	ldr r0, _081351C0 @ =gStringVar1
	ldr r1, _081351C4 @ =gUnknown_08400E23
	bl StringAppend
	b _081351D0
	.align 2, 0
_081351C0: .4byte gStringVar1
_081351C4: .4byte gUnknown_08400E23
_081351C8:
	ldr r0, _081351F0 @ =gStringVar1
	ldr r1, _081351F4 @ =gUnknown_08400E29
	bl StringAppend
_081351D0:
	ldr r0, _081351F0 @ =gStringVar1
	ldr r1, _081351F8 @ =gUnknown_08400E2E
	bl StringAppend
_081351D8:
	ldr r0, _081351F0 @ =gStringVar1
	movs r1, 0xB
	muls r1, r6
	ldr r2, _081351FC @ =gSpeciesNames
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
	thumb_func_end AppendBattleTowerBannedSpeciesName

	thumb_func_start CheckMonBattleTowerBanlist
CheckMonBattleTowerBanlist: @ 8135200
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
	ldr r0, _081352DC @ =gBattleTowerBanlist
	ldrh r1, [r0]
	ldr r5, _081352E0 @ =0x0000ffff
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
	ldr r0, _081352E0 @ =0x0000ffff
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
	thumb_func_end CheckMonBattleTowerBanlist

	thumb_func_start CheckPartyBattleTowerBanlist
CheckPartyBattleTowerBanlist: @ 81352E4
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
	ldr r0, _081353C4 @ =gPlayerParty
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
	ldr r5, _081353C8 @ =gScriptResult
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
	bl CheckMonBattleTowerBanlist
	adds r7, 0x1
	cmp r7, 0x5
	ble _081352FE
	mov r1, r9
	ldrb r0, [r1]
	cmp r0, 0x2
	bhi _08135420
	ldr r1, _081353CC @ =gStringVar1
	movs r0, 0xFF
	strb r0, [r1]
	ldr r1, _081353D0 @ =gSpecialVar_0x8004
	movs r0, 0x1
	strh r0, [r1]
	movs r0, 0
	mov r1, r9
	strb r0, [r1]
	bl CalcBattleTowerBanlistSeenCount
	adds r6, r0, 0
	ldr r2, _081353D4 @ =gBattleTowerBanlist
	ldrh r0, [r2]
	ldr r1, _081353D8 @ =0x0000ffff
	cmp r0, r1
	beq _081353A8
	mov r5, r9
	adds r7, r1, 0
	adds r4, r2, 0
_08135394:
	ldrh r0, [r4]
	ldrb r1, [r5]
	adds r2, r6, 0
	bl AppendBattleTowerBannedSpeciesName
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
	ldr r4, _081353CC @ =gStringVar1
	ldr r1, _081353DC @ =gUnknown_08400E2C
	adds r0, r4, 0
	bl StringAppend
	ldr r1, _081353E0 @ =gUnknown_08400E32
	adds r0, r4, 0
	bl StringAppend
	b _0813543E
	.align 2, 0
_081353C4: .4byte gPlayerParty
_081353C8: .4byte gScriptResult
_081353CC: .4byte gStringVar1
_081353D0: .4byte gSpecialVar_0x8004
_081353D4: .4byte gBattleTowerBanlist
_081353D8: .4byte 0x0000ffff
_081353DC: .4byte gUnknown_08400E2C
_081353E0: .4byte gUnknown_08400E32
_081353E4:
	movs r0, 0x1
	ands r0, r1
	cmp r0, 0
	beq _08135400
	ldr r0, _081353F8 @ =gStringVar1
	ldr r1, _081353FC @ =gUnknown_08400E2E
	bl StringAppend
	b _08135408
	.align 2, 0
_081353F8: .4byte gStringVar1
_081353FC: .4byte gUnknown_08400E2E
_08135400:
	ldr r0, _08135414 @ =gStringVar1
	ldr r1, _08135418 @ =gUnknown_08400E2C
	bl StringAppend
_08135408:
	ldr r0, _08135414 @ =gStringVar1
	ldr r1, _0813541C @ =gUnknown_08400E36
	bl StringAppend
	b _0813543E
	.align 2, 0
_08135414: .4byte gStringVar1
_08135418: .4byte gUnknown_08400E2C
_0813541C: .4byte gUnknown_08400E36
_08135420:
	ldr r1, _08135450 @ =gSpecialVar_0x8004
	movs r0, 0
	strh r0, [r1]
	ldr r2, _08135454 @ =gSaveBlock2
	ldrb r0, [r5]
	ldr r1, _08135458 @ =0x00000554
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
_08135450: .4byte gSpecialVar_0x8004
_08135454: .4byte gSaveBlock2
_08135458: .4byte 0x00000554
	thumb_func_end CheckPartyBattleTowerBanlist

	thumb_func_start sub_813545C
sub_813545C: @ 813545C
	push {lr}
	adds r1, r0, 0
	ldr r0, _08135470 @ =gStringVar4
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
	ldr r2, _08135490 @ =gSaveBlock2
	ldr r0, _08135494 @ =0x00000564
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
	ldr r1, _081354B0 @ =gBattleTowerTrainers + 0xC
	adds r0, r1
	bl sub_813545C
	b _081354C4
	.align 2, 0
_081354B0: .4byte gBattleTowerTrainers + 0xC
_081354B4:
	ldrb r1, [r1]
	movs r0, 0xA4
	muls r0, r1
	ldr r3, _081354C8 @ =0xffffc14c
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
	ldr r0, _081354E4 @ =gSpecialVar_0x8004
	ldrh r0, [r0]
	cmp r0, 0x1
	beq _081354E8
	cmp r0, 0x1
	ble _08135520
	cmp r0, 0x2
	beq _0813551C
	b _08135520
	.align 2, 0
_081354E4: .4byte gSpecialVar_0x8004
_081354E8:
	movs r5, 0
_081354EA:
	movs r0, 0x64
	adds r4, r5, 0
	muls r4, r0
	ldr r0, _08135514 @ =gSaveBlock1 + 0x238
	adds r0, r4, r0
	movs r1, 0xC
	bl GetMonData
	mov r1, sp
	strh r0, [r1]
	ldr r0, _08135518 @ =gPlayerParty
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
	ldr r0, _08135530 @ =c2_exit_to_overworld_1_continue_scripts_restart_music
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
	ldr r0, _08135560 @ =gMain
	ldr r1, _08135564 @ =sub_81354CC
	str r1, [r0, 0x8]
	ldr r0, _08135568 @ =sub_800E7C4
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
	ldr r0, _08135584 @ =gSpecialVar_0x8004
	ldrh r2, [r0]
	cmp r2, 0x1
	beq _081355AC
	cmp r2, 0x1
	bgt _08135588
	cmp r2, 0
	beq _0813558E
	b _08135648
	.align 2, 0
_08135584: .4byte gSpecialVar_0x8004
_08135588:
	cmp r2, 0x2
	beq _08135600
	b _08135648
_0813558E:
	ldr r1, _081355A4 @ =gBattleTypeFlags
	movs r3, 0x84
	lsls r3, 1
	adds r0, r3, 0
	strh r0, [r1]
	ldr r0, _081355A8 @ =gTrainerBattleOpponent
	strh r2, [r0]
	bl sub_8134DD4
	b _081355D6
	.align 2, 0
_081355A4: .4byte gBattleTypeFlags
_081355A8: .4byte gTrainerBattleOpponent
_081355AC:
	movs r5, 0
_081355AE:
	movs r0, 0x64
	adds r4, r5, 0
	muls r4, r0
	ldr r0, _081355F4 @ =gPlayerParty
	adds r0, r4, r0
	movs r1, 0xC
	bl GetMonData
	mov r1, sp
	strh r0, [r1]
	ldr r0, _081355F8 @ =gSaveBlock1 + 0x238
	adds r4, r0
	adds r0, r4, 0
	movs r1, 0xC
	mov r2, sp
	bl SetMonData
	adds r5, 0x1
	cmp r5, 0x5
	ble _081355AE
_081355D6:
	ldr r0, _081355FC @ =sub_8135534
	movs r1, 0x1
	bl CreateTask
	movs r0, 0
	bl current_map_music_set__default_for_battle
	bl GetBattleTowerBattleTransition
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
	ldr r1, _08135650 @ =gEnemyParty
	adds r0, r1
	movs r1, 0x2C
	muls r1, r5
	ldr r2, _08135654 @ =gSaveBlock2 + 0x4CC
	adds r1, r2
	bl sub_803ADE8
	adds r5, 0x1
	cmp r5, 0x2
	ble _08135606
	ldr r1, _08135658 @ =gBattleTypeFlags
	ldr r2, _0813565C @ =0x00000808
	adds r0, r2, 0
	strh r0, [r1]
	ldr r1, _08135660 @ =gTrainerBattleOpponent
	movs r0, 0
	strh r0, [r1]
	ldr r0, _08135664 @ =sub_8135534
	movs r1, 0x1
	bl CreateTask
	movs r0, 0
	bl current_map_music_set__default_for_battle
	bl GetBattleTowerBattleTransition
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
_08135658: .4byte gBattleTypeFlags
_0813565C: .4byte 0x00000808
_08135660: .4byte gTrainerBattleOpponent
_08135664: .4byte sub_8135534
	thumb_func_end sub_813556C

	thumb_func_start sub_8135668
sub_8135668: @ 8135668
	push {r4,r5,lr}
	ldr r1, _0813568C @ =gSaveBlock2
	ldr r2, _08135690 @ =0x00000554
	adds r0, r1, r2
	ldrb r0, [r0]
	lsls r0, 31
	lsrs r4, r0, 31
	ldr r0, _08135694 @ =gSpecialVar_0x8004
	ldrh r0, [r0]
	adds r5, r1, 0
	cmp r0, 0xE
	bls _08135682
	b _0813589A
_08135682:
	lsls r0, 2
	ldr r1, _08135698 @ =_0813569C
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_0813568C: .4byte gSaveBlock2
_08135690: .4byte 0x00000554
_08135694: .4byte gSpecialVar_0x8004
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
	ldr r0, _081356F0 @ =0x02000000
	ldr r3, _081356F4 @ =0x00000556
	adds r1, r5, r3
	adds r1, r4, r1
	ldrb r2, [r1]
	ldr r3, _081356F8 @ =0x000160fb
	adds r0, r3
	strb r2, [r0]
	ldr r0, _081356FC @ =gSpecialVar_0x8005
	ldrh r0, [r0]
	b _08135898
	.align 2, 0
_081356F0: .4byte 0x02000000
_081356F4: .4byte 0x00000556
_081356F8: .4byte 0x000160fb
_081356FC: .4byte gSpecialVar_0x8005
_08135700:
	ldr r0, _08135714 @ =gSpecialVar_0x8005
	ldrb r0, [r0]
	ldr r1, _08135718 @ =0x00000554
	adds r3, r5, r1
	movs r1, 0x1
	ands r1, r0
	ldrb r2, [r3]
	movs r0, 0x2
	negs r0, r0
	b _08135810
	.align 2, 0
_08135714: .4byte gSpecialVar_0x8005
_08135718: .4byte 0x00000554
_0813571C:
	lsls r1, r4, 1
	movs r2, 0xAB
	lsls r2, 3
	adds r0, r5, r2
	b _0813572C
_08135726:
	lsls r1, r4, 1
	ldr r3, _08135738 @ =0x0000055c
	adds r0, r5, r3
_0813572C:
	adds r1, r0
	ldr r0, _0813573C @ =gSpecialVar_0x8005
	ldrh r0, [r0]
	strh r0, [r1]
	b _0813589A
	.align 2, 0
_08135738: .4byte 0x0000055c
_0813573C: .4byte gSpecialVar_0x8005
_08135740:
	ldr r0, _0813574C @ =gSpecialVar_0x8005
	ldrh r1, [r0]
	ldr r2, _08135750 @ =0x00000564
	adds r0, r5, r2
	strb r1, [r0]
	b _0813589A
	.align 2, 0
_0813574C: .4byte gSpecialVar_0x8005
_08135750: .4byte 0x00000564
_08135754:
	movs r2, 0
	ldr r4, _0813576C @ =gSaveBlock2 + 0x565
	ldr r3, _08135770 @ =gSelectedOrderFromParty
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
_08135770: .4byte gSelectedOrderFromParty
_08135774:
	ldr r3, _081357C0 @ =0x00000564
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
	ldr r0, _081357C4 @ =0x0000270e
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
	ldr r1, _081357C8 @ =gScriptResult
	ldrh r0, [r4]
	strh r0, [r1]
	ldr r1, _081357CC @ =gStringVar1
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
	ldr r2, _081357F0 @ =0x0000055c
	adds r1, r5, r2
	adds r4, r0, r1
	ldrh r1, [r4]
	ldr r0, _081357F4 @ =0x00000595
	cmp r1, r0
	bhi _081357E4
	adds r0, r1, 0x1
	strh r0, [r4]
_081357E4:
	bl sub_8135A3C
	ldr r1, _081357F8 @ =gScriptResult
	ldrh r0, [r4]
	strh r0, [r1]
	b _0813589A
	.align 2, 0
_081357F0: .4byte 0x0000055c
_081357F4: .4byte 0x00000595
_081357F8: .4byte gScriptResult
_081357FC:
	ldr r0, _08135818 @ =gSpecialVar_0x8005
	ldrb r0, [r0]
	ldr r1, _0813581C @ =0x00000554
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
_08135818: .4byte gSpecialVar_0x8005
_0813581C: .4byte 0x00000554
_08135820:
	ldr r2, _08135830 @ =0x00000572
	adds r0, r5, r2
	ldrh r1, [r0]
	movs r0, 0x20
	bl SetGameStat
	b _0813589A
	.align 2, 0
_08135830: .4byte 0x00000572
_08135834:
	ldr r3, _08135848 @ =0x00000556
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
	ldr r1, _08135860 @ =0x00000556
	adds r0, r5, r1
	adds r0, r4, r0
	ldr r1, _08135864 @ =0x02000000
	ldr r2, _08135868 @ =0x000160fb
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
	ldr r1, _08135880 @ =gSaveBlock2
	lsls r2, r4, 1
	ldr r3, _08135884 @ =0x00000574
	adds r1, r3
	adds r2, r1
	strh r0, [r2]
	b _0813589A
	.align 2, 0
_08135880: .4byte gSaveBlock2
_08135884: .4byte 0x00000574
_08135888:
	ldr r1, _081358A0 @ =0x00000554
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
	ldr r1, _081358C8 @ =gSaveBlock2
	ldr r2, _081358CC @ =0x00000554
	adds r0, r1, r2
	ldrb r0, [r0]
	lsls r0, 31
	lsrs r4, r0, 31
	ldr r0, _081358D0 @ =gSpecialVar_0x8004
	ldrh r0, [r0]
	adds r3, r1, 0
	cmp r0, 0xE
	bls _081358BE
	b _08135A0A
_081358BE:
	lsls r0, 2
	ldr r1, _081358D4 @ =_081358D8
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_081358C8: .4byte gSaveBlock2
_081358CC: .4byte 0x00000554
_081358D0: .4byte gSpecialVar_0x8004
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
	ldr r0, _08135920 @ =gScriptResult
	ldr r2, _08135924 @ =0x00000556
	adds r1, r3, r2
	adds r1, r4, r1
	b _0813596A
	.align 2, 0
_08135920: .4byte gScriptResult
_08135924: .4byte 0x00000556
_08135928:
	ldr r1, _08135934 @ =gScriptResult
	ldr r4, _08135938 @ =0x00000554
	adds r0, r3, r4
	ldrb r0, [r0]
	lsls r0, 31
	b _08135982
	.align 2, 0
_08135934: .4byte gScriptResult
_08135938: .4byte 0x00000554
_0813593C:
	ldr r2, _08135948 @ =gScriptResult
	lsls r0, r4, 1
	movs r4, 0xAB
	lsls r4, 3
	b _08135952
	.align 2, 0
_08135948: .4byte gScriptResult
_0813594C:
	ldr r2, _0813595C @ =gScriptResult
	lsls r0, r4, 1
	ldr r4, _08135960 @ =0x0000055c
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
	ldr r0, _08135970 @ =gScriptResult
	ldr r2, _08135974 @ =0x00000564
	adds r1, r3, r2
_0813596A:
	ldrb r1, [r1]
	strh r1, [r0]
	b _08135A0A
	.align 2, 0
_08135970: .4byte gScriptResult
_08135974: .4byte 0x00000564
_08135978:
	ldr r1, _08135988 @ =gScriptResult
	ldr r4, _0813598C @ =0x00000554
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
	ldr r1, _0813599C @ =gScriptResult
	strh r0, [r1]
	b _08135A0A
	.align 2, 0
_0813599C: .4byte gScriptResult
_081359A0:
	ldr r1, _081359B0 @ =0x00000572
	adds r0, r3, r1
	ldrh r1, [r0]
	movs r0, 0x20
	bl SetGameStat
	b _08135A0A
	.align 2, 0
_081359B0: .4byte 0x00000572
_081359B4:
	adds r0, r4, 0
	bl sub_813461C
	b _08135A0A
_081359BC:
	ldr r2, _081359D0 @ =0x00000556
	adds r0, r3, r2
	adds r0, r4, r0
	ldr r1, _081359D4 @ =0x02000000
	ldr r3, _081359D8 @ =0x000160fb
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
	ldr r1, _081359F0 @ =gSaveBlock2
	lsls r2, r4, 1
	ldr r4, _081359F4 @ =0x00000574
	adds r1, r4
	adds r2, r1
	strh r0, [r2]
	b _08135A0A
	.align 2, 0
_081359F0: .4byte gSaveBlock2
_081359F4: .4byte 0x00000574
_081359F8:
	ldr r1, _08135A10 @ =0x00000554
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
	ldr r4, _08135A34 @ =gSelectedOrderFromParty
	ldr r3, _08135A38 @ =gSaveBlock2 + 0x565
_08135A1C:
	adds r0, r2, r4
	adds r1, r2, r3
	ldrb r1, [r1]
	strb r1, [r0]
	adds r2, 0x1
	cmp r2, 0x2
	ble _08135A1C
	bl ReducePlayerPartyToThree
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08135A34: .4byte gSelectedOrderFromParty
_08135A38: .4byte gSaveBlock2 + 0x565
	thumb_func_end sub_8135A14

	thumb_func_start sub_8135A3C
sub_8135A3C: @ 8135A3C
	push {r4-r6,lr}
	ldr r6, _08135A84 @ =gSaveBlock2
	ldr r1, _08135A88 @ =0x00000554
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
	ldr r0, _08135A8C @ =0x00000562
	adds r1, r6, r0
	ldrh r0, [r2]
	ldrh r3, [r1]
	cmp r0, r3
	bls _08135A94
	adds r5, r0, 0
	movs r0, 0x20
	adds r1, r5, 0
	bl SetGameStat
	ldr r1, _08135A90 @ =0x0000270f
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
	bl SetGameStat
	ldr r1, _08135AAC @ =0x0000270f
	cmp r5, r1
	bls _08135AB4
_08135AA4:
	ldr r2, _08135AB0 @ =0x00000572
	adds r0, r6, r2
	strh r1, [r0]
	b _08135ABA
	.align 2, 0
_08135AAC: .4byte 0x0000270f
_08135AB0: .4byte 0x00000572
_08135AB4:
	ldr r3, _08135AC0 @ =0x00000572
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
	ldr r5, _08135AF0 @ =gSaveBlock2 + 0xA8
	adds r2, r5, 0
	subs r2, 0xA8
	ldr r1, _08135AF4 @ =0x000004ac
	adds r0, r5, r1
	ldrb r0, [r0]
	lsls r0, 31
	lsrs r6, r0, 31
	ldrb r0, [r2, 0x8]
	cmp r0, 0
	beq _08135AFC
	ldr r4, _08135AF8 @ =gUnknown_08405E7E
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
	ldr r4, _08135B84 @ =gUnknown_08405E60
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
	ldr r4, _08135B88 @ =gSaveBlock2 + 0xA
	adds r1, r4, 0
	bl copy_word_to_mem
	adds r0, r5, 0x4
	subs r4, 0xA
	adds r1, r4, 0
	bl StringCopy8
	adds r0, r6, 0
	bl sub_8135D3C
	strh r0, [r5, 0x2]
	ldr r0, _08135B8C @ =gSaveBlock1
	ldr r1, _08135B90 @ =0x00002b28
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
	ldr r6, _08135B94 @ =gSaveBlock2 + 0x565
_08135B56:
	adds r0, r4, r6
	ldrb r1, [r0]
	movs r0, 0x64
	muls r0, r1
	ldr r1, _08135B98 @ =gUnknown_030042FC
	adds r0, r1
	movs r1, 0x2C
	muls r1, r4
	adds r1, 0x1C
	adds r1, r5, r1
	bl sub_803AF78
	adds r4, 0x1
	cmp r4, 0x2
	ble _08135B56
	ldr r0, _08135B9C @ =gSaveBlock2 + 0xA8
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
	ldr r2, _08135C1C @ =gSaveBlock2
	ldr r1, _08135C20 @ =0x00000554
	adds r0, r2, r1
	ldrb r0, [r0]
	lsls r0, 31
	lsrs r5, r0, 31
	ldr r0, _08135C24 @ =gSpecialVar_0x8004
	ldrh r0, [r0]
	cmp r0, 0x3
	beq _08135BBA
	cmp r0, 0
	bne _08135BD8
_08135BBA:
	lsls r1, r5, 1
	ldr r3, _08135C28 @ =0x0000055c
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
	ldr r4, _08135C1C @ =gSaveBlock2
	ldr r0, _08135C2C @ =gUnknown_02024D26
	ldrb r1, [r0]
	ldr r2, _08135C30 @ =0x00000555
	adds r0, r4, r2
	strb r1, [r0]
	ldr r0, _08135C24 @ =gSpecialVar_0x8004
	ldrh r1, [r0]
	cmp r1, 0x3
	beq _08135BF8
	ldr r3, _08135C34 @ =0x00000556
	adds r0, r4, r3
	adds r0, r5, r0
	strb r1, [r0]
_08135BF8:
	movs r0, 0x80
	lsls r0, 7
	movs r1, 0
	bl VarSet
	ldr r0, _08135C20 @ =0x00000554
	adds r2, r4, r0
	ldrb r0, [r2]
	movs r1, 0x2
	orrs r0, r1
	strb r0, [r2]
	movs r0, 0x2
	bl TrySavingData
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_08135C1C: .4byte gSaveBlock2
_08135C20: .4byte 0x00000554
_08135C24: .4byte gSpecialVar_0x8004
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
	ldr r2, _08135CBC @ =gSaveBlock2 + 0xA8
_08135C50:
	ldm r2!, {r0}
	adds r3, r0
	adds r1, 0x1
	cmp r1, 0x27
	bls _08135C50
	ldr r5, _08135CC0 @ =gSaveBlock2
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
	ldr r4, _08135D34 @ =gSaveBlock2 + 0x484
	adds r0, r4, 0
	bl get_trainer_name
	ldr r2, _08135D38 @ =gBattleMons
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
	ldr r3, _08135D74 @ =gSaveBlock2
	lsrs r0, 23
	ldr r2, _08135D78 @ =0x0000055c
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
	ldr r2, _08135D7C @ =0x0000ffff
	adds r1, r2
	ldrh r0, [r0]
	adds r1, r0
	lsls r1, 16
	lsrs r0, r1, 16
	ldr r1, _08135D80 @ =0x0000270f
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
	ldr r5, _08135DB0 @ =gSaveBlock2
	ldr r1, _08135DB4 @ =0x00000554
	adds r0, r5, r1
	ldrb r0, [r0]
	lsls r0, 31
	lsrs r0, 31
	lsls r0, 1
	ldr r2, _08135DB8 @ =0x0000055c
	adds r1, r5, r2
	adds r0, r1
	ldrh r0, [r0]
	subs r0, 0x1
	cmp r0, 0x5
	ble _08135DC0
	bl Random
	ldr r4, _08135DBC @ =gUnknown_08405EE6
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
	ldr r4, _08135DE8 @ =gUnknown_08405EDA
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
	ldr r5, _08135E20 @ =gSaveBlock2
	ldr r1, _08135E24 @ =0x00000554
	adds r0, r5, r1
	ldrb r0, [r0]
	lsls r0, 31
	lsrs r7, r0, 31
	movs r0, 0xAD
	lsls r0, 3
	adds r6, r5, r0
	ldrh r0, [r6]
	movs r1, 0x1
	bl AddBagItem
	lsls r0, 24
	lsrs r4, r0, 24
	cmp r4, 0x1
	bne _08135E30
	ldrh r0, [r6]
	ldr r1, _08135E28 @ =gStringVar1
	bl CopyItemName
	ldr r0, _08135E2C @ =gScriptResult
	strh r4, [r0]
	b _08135E40
	.align 2, 0
_08135E20: .4byte gSaveBlock2
_08135E24: .4byte 0x00000554
_08135E28: .4byte gStringVar1
_08135E2C: .4byte gScriptResult
_08135E30:
	ldr r1, _08135E48 @ =gScriptResult
	movs r0, 0
	strh r0, [r1]
	ldr r1, _08135E4C @ =0x00000556
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
	ldr r6, _08135ED4 @ =gSaveBlock2
	ldr r1, _08135ED8 @ =0x00000554
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
	ldr r4, _08135EDC @ =gScriptResult
	movs r0, 0
	strh r0, [r4]
	adds r0, r1, 0
	bl sub_8135D3C
	lsls r0, 16
	lsrs r0, 16
	cmp r0, 0x37
	bls _08135EBA
	movs r5, 0
	ldr r0, _08135EE0 @ =0x00000565
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
	ldr r0, _08135EE4 @ =gPlayerParty
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
	ldr r0, _08135EDC @ =gScriptResult
	ldrh r0, [r0]
	cmp r0, 0
	beq _08135EC8
	movs r0, 0x2A
	bl IncrementGameStat
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
	ldr r7, _08135F0C @ =gSaveBlock2 + 0x498
	ldr r0, _08135F10 @ =0xfffffb68
	adds r2, r7, r0
	ldrb r0, [r2, 0x8]
	cmp r0, 0
	beq _08135F18
	ldr r4, _08135F14 @ =gUnknown_08405E7E
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
	ldr r4, _08135FA8 @ =gUnknown_08405E60
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
	ldr r4, _08135FAC @ =gSaveBlock2 + 0xA
	adds r1, r4, 0
	bl copy_word_to_mem
	adds r0, r7, 0x4
	subs r4, 0xA
	adds r1, r4, 0
	bl StringCopy8
	movs r0, 0x1
	strh r0, [r7, 0x2]
	movs r5, 0x7
	movs r4, 0
	ldr r0, _08135FB0 @ =gSaveBlock1
	ldr r1, _08135FB4 @ =0x00002b28
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
	ldr r1, _08135FB8 @ =gPlayerParty
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
	ldr r1, _08135FCC @ =gTrainerClassToPicIndex
	ldr r0, _08135FD0 @ =gSaveBlock2
	ldr r2, _08135FD4 @ =0x00000499
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
	ldr r1, _08135FE8 @ =gTrainerClassToNameIndex
	ldr r0, _08135FEC @ =gSaveBlock2
	ldr r2, _08135FF0 @ =0x00000499
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
	ldr r4, _08136018 @ =gSaveBlock2 + 0x49C
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
	ldr r1, _08136044 @ =gScriptResult
	movs r0, 0
	strh r0, [r1]
	ldr r5, _08136048 @ =gSaveBlock2 + 0x498
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
	ldr r4, _08136080 @ =gSaveBlock2
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
	ldr r1, _08136084 @ =gScriptResult
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
	ldr r0, _081360CC @ =gSaveBlock2 + 0x4A8
	bl sub_813545C
	pop {r0}
	bx r0
	.align 2, 0
_081360CC: .4byte gSaveBlock2 + 0x4A8
	thumb_func_end sub_81360C0

	thumb_func_start sub_81360D0
sub_81360D0: @ 81360D0
	push {lr}
	ldr r0, _081360E4 @ =gUnknown_02024D26
	ldrb r0, [r0]
	cmp r0, 0x3
	bne _081360EC
	ldr r1, _081360E8 @ =gStringVar4
	movs r0, 0xFF
	strb r0, [r1]
	b _08136102
	.align 2, 0
_081360E4: .4byte gUnknown_02024D26
_081360E8: .4byte gStringVar4
_081360EC:
	cmp r0, 0x1
	bne _081360FC
	ldr r0, _081360F8 @ =gSaveBlock2 + 0x4C0
	bl sub_813545C
	b _08136102
	.align 2, 0
_081360F8: .4byte gSaveBlock2 + 0x4C0
_081360FC:
	ldr r0, _08136108 @ =gSaveBlock2 + 0x4B4
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
	ldr r5, _0813612C @ =gSaveBlock2 + 0x556
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
	ldr r4, _0813615C @ =gUnknown_02039304
	ldr r2, _08136160 @ =gUnknown_083DFEC4
	ldr r3, [r2]
	ldr r5, _08136164 @ =0x0000d164
	adds r2, r3, r5
	str r2, [r4]
	str r0, [r2, 0x8]
	str r1, [r2, 0x4]
	ldr r0, _08136168 @ =0x0000d162
	adds r3, r0
	movs r0, 0x2
	strb r0, [r3]
	ldr r0, _0813616C @ =sub_8136294
	bl launch_c3_walk_stairs_and_run_once
	ldr r0, _08136170 @ =sub_8136244
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
	ldr r5, _081361C4 @ =gUnknown_02039304
	ldr r1, [r5]
	ldr r0, _081361C8 @ =gUnknown_0203930C
	ldr r0, [r0]
	str r0, [r1, 0x8]
	ldr r0, _081361CC @ =gUnknown_02039308
	ldr r0, [r0]
	str r0, [r1, 0x4]
	ldr r4, _081361D0 @ =gUnknown_02039310
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
	ldr r0, _081361D4 @ =gUnknown_083DFEC4
	ldr r0, [r0]
	ldr r1, _081361D8 @ =0x0000d162
	adds r0, r1
	movs r1, 0x2
	strb r1, [r0]
	ldr r0, _081361DC @ =sub_8136294
	bl launch_c3_walk_stairs_and_run_once
	ldr r0, _081361E0 @ =sub_81361E4
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
	ldr r4, _08136220 @ =gUnknown_02039304
	ldr r0, [r4]
	ldr r0, [r0]
	bl _call_via_r0
	bl AnimateSprites
	bl BuildOamBuffer
	bl UpdatePaletteFade
	ldr r4, [r4]
	ldr r1, [r4]
	ldr r0, _08136224 @ =sub_81365C8
	cmp r1, r0
	bne _0813621A
	movs r0, 0x80
	lsls r0, 19
	movs r1, 0
	strh r1, [r0]
	adds r0, r4, 0
	adds r0, 0x50
	strb r1, [r0]
	ldr r0, _08136228 @ =sub_813622C
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
	ldr r0, _08136260 @ =gUnknown_02039304
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
	ldr r1, _08136290 @ =gUnknown_02039304
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
	ldr r1, _081362B4 @ =gUnknown_02039304
	ldr r0, [r1]
	adds r0, 0x50
	ldrb r0, [r0]
	adds r3, r1, 0
	cmp r0, 0x16
	bls _081362A8
	b _0813657A
_081362A8:
	lsls r0, 2
	ldr r1, _081362B8 @ =_081362BC
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
	ldr r1, _08136344 @ =gUnknown_083DFEC4
	ldr r1, [r1]
	ldr r2, _08136348 @ =0x00006dac
	adds r1, r2
	strb r0, [r1]
	lsls r0, 24
	lsrs r1, r0, 24
	cmp r1, 0
	beq _08136330
	b _0813657A
_08136330:
	ldr r4, _0813634C @ =gUnknown_02039304
	ldr r0, [r4]
	adds r0, 0x55
	strb r1, [r0]
	ldr r0, _08136350 @ =sub_81365A0
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
	ldr r0, _08136370 @ =gWindowConfig_81E7080
	bl SetUpWindowConfig
	b _08136524
	.align 2, 0
_08136370: .4byte gWindowConfig_81E7080
_08136374:
	ldr r0, _0813637C @ =gWindowConfig_81E7080
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
	ldr r0, _081363AC @ =gUnknown_083DFEC4
	ldr r1, [r0]
	ldr r4, _081363B0 @ =0x000076aa
	adds r0, r1, r4
	movs r2, 0
	strb r2, [r0]
	ldr r4, _081363B4 @ =0x000087e0
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
	ldr r0, _081363D8 @ =gUnknown_02039304
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
	ldr r0, _08136400 @ =gUnknown_02039304
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
	ldr r1, _08136434 @ =gKeyRepeatStartDelay
	movs r0, 0x14
	strh r0, [r1]
	bl CalculatePlayerPartyCount
	ldr r1, _08136438 @ =gUnknown_083DFEC4
	ldr r4, [r1]
	ldr r2, _0813643C @ =0x00008828
	adds r1, r4, r2
	movs r5, 0
	strb r0, [r1]
	ldr r1, _08136440 @ =0x00009344
	adds r0, r4, r1
	strb r5, [r0]
	subs r2, 0xC0
	adds r0, r4, r2
	str r5, [r0]
	bl sub_80F4BD0
	ldr r0, _08136444 @ =0x0000d160
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
	ldr r0, _08136460 @ =REG_BG2VOFS
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
	ldr r0, _0813647C @ =gUnknown_083DFEC4
	ldr r0, [r0]
	ldr r1, _08136480 @ =0x00008768
	adds r0, r1
	ldr r1, [r0]
	ldr r0, _08136484 @ =0x0000ffd8
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
	ldr r1, _081364C4 @ =0x0600f800
	movs r2, 0
	str r2, [sp]
	ldr r0, _081364C8 @ =0x040000d4
	mov r4, sp
	str r4, [r0]
	str r1, [r0, 0x4]
	ldr r1, _081364CC @ =0x85000200
	str r1, [r0, 0x8]
	ldr r0, [r0, 0x8]
	ldr r0, _081364D0 @ =REG_BG1VOFS
	strh r2, [r0]
	subs r0, 0x2
	strh r2, [r0]
	ldr r1, _081364D4 @ =REG_BG1CNT
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
	ldr r0, _081364F0 @ =gUnknown_083DFEC4
	ldr r1, [r0]
	ldr r4, _081364F4 @ =0x00008ff0
	adds r0, r1, r4
	ldr r2, _081364F8 @ =0x00009004
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
	ldr r0, _08136518 @ =gUnknown_083DFEC4
	ldr r0, [r0]
	ldr r4, _0813651C @ =0x00009004
	adds r0, r4
	bl sub_80F556C
	b _08136524
	.align 2, 0
_08136518: .4byte gUnknown_083DFEC4
_0813651C: .4byte 0x00009004
_08136520:
	bl sub_80F1934
_08136524:
	ldr r0, _08136534 @ =gUnknown_02039304
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
	ldr r1, _08136584 @ =REG_WIN0H
	movs r0, 0xF0
	strh r0, [r1]
	adds r1, 0x2
	movs r0, 0x9B
	strh r0, [r1]
	ldr r0, _08136588 @ =REG_WIN0V
	ldr r2, _0813658C @ =0x00003273
	adds r1, r2, 0
	strh r1, [r0]
	adds r0, 0x2
	strh r1, [r0]
	ldr r1, _08136590 @ =REG_WININ
	ldr r4, _08136594 @ =0x00003f3f
	adds r0, r4, 0
	strh r0, [r1]
	adds r1, 0x2
	movs r0, 0x1B
	strh r0, [r1]
	subs r1, 0x38
	movs r0, 0x28
	strh r0, [r1]
	subs r1, 0x12
	ldr r2, _08136598 @ =0x00007f40
	adds r0, r2, 0
	strh r0, [r1]
_0813656C:
	ldr r0, [r3]
	adds r0, 0x55
	movs r1, 0x1
	strb r1, [r0]
	ldr r0, _0813659C @ =sub_81365C8
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
	ldr r1, _081365C4 @ =gUnknown_02039304
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
	ldr r4, _081365E0 @ =gUnknown_02039304
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
	ldr r0, _08136608 @ =sub_8136264
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
	ldr r0, _08136630 @ =gPaletteFade
	ldrb r1, [r0, 0x7]
	movs r0, 0x80
	ands r0, r1
	cmp r0, 0
	bne _08136626
	bl sub_80F3C94
	bl sub_80F3D00
	ldr r0, _08136634 @ =sub_8136638
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
	ldr r0, _08136654 @ =gUnknown_02039304
	ldr r0, [r0]
	adds r0, 0x50
	ldrb r0, [r0]
	cmp r0, 0x7
	bls _08136648
	b _081367FA
_08136648:
	lsls r0, 2
	ldr r1, _08136658 @ =_0813665C
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
	ldr r2, _081366A4 @ =gMain
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
	ldr r0, _081366A8 @ =gUnknown_02039304
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
	ldr r0, _081366D0 @ =gUnknown_02039304
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
	ldr r0, _081366F0 @ =gUnknown_02039304
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
	ldr r0, _08136728 @ =gUnknown_083DFEC4
	ldr r0, [r0]
	ldr r2, _0813672C @ =0x000087dc
	adds r1, r0, r2
	movs r2, 0
	ldrsh r1, [r1, r2]
	ldr r2, _08136730 @ =0x000087da
	adds r0, r2
	movs r2, 0
	ldrsh r0, [r0, r2]
	subs r0, 0x1
	cmp r1, r0
	bne _08136738
	ldr r0, _08136734 @ =gUnknown_02039304
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
	ldr r0, _08136744 @ =gUnknown_02039304
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
	ldr r0, _08136770 @ =gUnknown_02039304
	ldr r0, [r0]
	adds r0, 0x50
	strb r4, [r0]
	b _081367FA
	.align 2, 0
_08136770: .4byte gUnknown_02039304
_08136774:
	ldr r0, _0813677C @ =sub_8136B44
	bl launch_c3_walk_stairs_and_run_once
	b _081367FA
	.align 2, 0
_0813677C: .4byte sub_8136B44
_08136780:
	bl sub_8136BB8
_08136784:
	ldr r0, _08136794 @ =gUnknown_02039304
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
	ldr r0, _081367D0 @ =gUnknown_02039304
	ldr r0, [r0]
	adds r0, 0x50
	movs r1, 0x7
	b _081367F8
	.align 2, 0
_081367D0: .4byte gUnknown_02039304
_081367D4:
	ldr r0, _081367DC @ =sub_8136808
	bl launch_c3_walk_stairs_and_run_once
	b _081367FA
	.align 2, 0
_081367DC: .4byte sub_8136808
_081367E0:
	ldr r0, _08136800 @ =gMain
	ldrh r1, [r0, 0x2E]
	movs r0, 0x3
	ands r0, r1
	cmp r0, 0
	beq _081367FA
	bl sub_8136D8C
_081367F0:
	ldr r0, _08136804 @ =gUnknown_02039304
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
	ldr r5, _08136820 @ =gUnknown_02039304
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
	ldr r0, _08136860 @ =gUnknown_083DFEC4
	ldr r0, [r0]
	ldr r1, _08136864 @ =0x000087dc
	adds r0, r1
	ldrb r0, [r0]
	bl sub_81370A4
	ldr r1, _08136868 @ =gUnknown_02039310
	strb r0, [r1]
	ldr r1, _0813686C @ =gUnknown_02039308
	ldr r2, [r5]
	ldr r0, [r2, 0x4]
	str r0, [r1]
	ldr r1, _08136870 @ =gUnknown_0203930C
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
	ldr r0, _08136894 @ =gPaletteFade
	ldrb r1, [r0, 0x7]
	movs r0, 0x80
	ands r0, r1
	cmp r0, 0
	bne _0813688C
	ldr r0, _08136898 @ =gMain
	ldr r1, _0813689C @ =sub_8136174
	str r1, [r0, 0x8]
	ldr r0, _081368A0 @ =sub_8147ADC
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
	ldr r1, _081368C4 @ =gUnknown_02039304
	ldr r0, [r1]
	adds r0, 0x50
	ldrb r0, [r0]
	adds r4, r1, 0
	cmp r0, 0x6
	bls _081368B8
	b _081369B8
_081368B8:
	lsls r0, 2
	ldr r1, _081368C8 @ =_081368CC
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
	ldr r0, _0813690C @ =gUnknown_083DFEC4
	ldr r0, [r0]
	ldr r1, _08136910 @ =0x000087dc
	adds r0, r1
	movs r2, 0
	ldrsh r1, [r0, r2]
	ldr r0, _08136914 @ =gUnknown_02039310
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
	ldr r0, _08136948 @ =gUnknown_02039304
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
	ldr r2, _08136968 @ =0x00007f40
	adds r0, r2, 0
	strh r0, [r1]
	ldr r1, [r4]
	b _08136986
	.align 2, 0
_08136968: .4byte 0x00007f40
_0813696C:
	ldr r0, _08136990 @ =sub_8136264
	bl SetVBlankCallback
	movs r0, 0x1
	negs r0, r0
	movs r1, 0
	str r1, [sp]
	movs r2, 0x10
	movs r3, 0
	bl BeginNormalPaletteFade
_08136982:
	ldr r0, _08136994 @ =gUnknown_02039304
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
	ldr r0, _081369C0 @ =gPaletteFade
	ldrb r1, [r0, 0x7]
	movs r0, 0x80
	ands r0, r1
	cmp r0, 0
	bne _081369B8
	bl sub_80F3C94
	bl sub_80F3D00
	ldr r0, _081369C4 @ =sub_81369CC
	bl launch_c3_walk_stairs_and_run_once
	ldr r0, _081369C8 @ =sub_8136244
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
	ldr r1, _081369E8 @ =gUnknown_02039304
	ldr r0, [r1]
	adds r0, 0x50
	ldrb r0, [r0]
	adds r4, r1, 0
	cmp r0, 0x5
	bls _081369DE
	b _08136B32
_081369DE:
	lsls r0, 2
	ldr r1, _081369EC @ =_081369F0
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
	ldr r2, _08136A38 @ =gPlayerParty
	str r2, [r3, 0xC]
	ldr r0, _08136A3C @ =gUnknown_083DFEC4
	ldr r1, [r0]
	ldr r5, _08136A40 @ =0x000087dc
	adds r0, r1, r5
	movs r5, 0
	ldrsh r0, [r0, r5]
	lsls r0, 2
	adds r1, r0
	ldr r0, _08136A44 @ =0x0000893e
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
	ldr r0, _08136A58 @ =gMain
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
	ldr r6, _08136A98 @ =gUnknown_02039304
	ldr r0, [r6]
	adds r0, 0x5C
	ldr r1, _08136A9C @ =gUnknown_083DFEC4
	ldr r4, [r1]
	ldr r1, _08136AA0 @ =0x00009040
	adds r5, r4, r1
	adds r1, r5, 0
	bl sub_80F567C
	ldr r1, _08136AA4 @ =0x00008fe9
	adds r0, r4, r1
	movs r1, 0
	ldrsb r1, [r0, r1]
	lsls r0, r1, 2
	adds r0, r1
	lsls r0, 2
	ldr r1, _08136AA8 @ =0x00009004
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
	ldr r0, _08136AE0 @ =gUnknown_083DFEC4
	ldr r0, [r0]
	ldr r5, _08136AE4 @ =0x000087dc
	adds r0, r5
	ldrb r0, [r0]
	bl sub_81370A4
	lsls r0, 24
	lsrs r0, 24
	bl sub_80F7224
	bl sub_80F3D00
	ldr r1, _08136AE8 @ =gUnknown_02039304
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
	ldr r0, _08136B38 @ =gMain
	ldrh r1, [r0, 0x2E]
	movs r0, 0x3
	ands r0, r1
	cmp r0, 0
	beq _08136B32
	bl sub_8136D00
	lsls r0, 24
	cmp r0, 0
	bne _08136B32
	ldr r0, _08136B3C @ =gScriptItemId
	ldrb r0, [r0]
	bl sub_810CA6C
	ldr r0, _08136B40 @ =sub_8136B44
	bl launch_c3_walk_stairs_and_run_once
_08136B32:
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_08136B38: .4byte gMain
_08136B3C: .4byte gScriptItemId
_08136B40: .4byte sub_8136B44
	thumb_func_end sub_81369CC

	thumb_func_start sub_8136B44
sub_8136B44: @ 8136B44
	push {r4,lr}
	sub sp, 0x4
	ldr r4, _08136B60 @ =gUnknown_02039304
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
	ldr r0, _08136B94 @ =gPaletteFade
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
	ldr r0, _08136C28 @ =gUnknown_083DFEC4
	ldr r0, [r0]
	ldr r1, _08136C2C @ =0x000087dc
	adds r0, r1
	ldrb r0, [r0]
	bl sub_81370A4
	lsls r0, 24
	lsrs r0, 24
	movs r1, 0x64
	muls r0, r1
	ldr r1, _08136C30 @ =gPlayerParty
	adds r0, r1
	ldr r4, _08136C34 @ =gUnknown_02039304
	ldr r2, [r4]
	adds r2, 0x10
	movs r1, 0x2
	bl GetMonData
	ldr r0, [r4]
	adds r0, 0x10
	bl StringGetEnd10
	ldr r0, [r4]
	adds r0, 0x10
	ldr r1, _08136C38 @ =gOtherText_GetsAPokeBlock
	bl StringAppend
	ldr r0, _08136C3C @ =gWindowConfig_81E709C
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
	ldr r0, _08136C68 @ =gWindowConfig_81E7080
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
	ldr r0, _08136C8C @ =gWindowConfig_81E709C
	bl BasicInitMenuWindow
	movs r0, 0
	movs r1, 0x10
	movs r2, 0x1D
	movs r3, 0x13
	bl MenuDrawTextWindow
	ldr r3, _08136C90 @ =gUnknown_02039304
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
	ldr r0, _08136CD8 @ =gUnknown_02039304
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
	ldr r0, _08136CFC @ =gUnknown_02039304
	ldr r1, [r0]
	adds r0, r1, 0
	adds r0, 0x10
	adds r1, 0x53
	ldrb r1, [r1]
	movs r2, 0
	bl sub_8136DC0
_08136CEE:
	ldr r0, _08136CFC @ =gUnknown_02039304
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
	ldr r4, _08136D30 @ =gUnknown_02039304
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
	ldr r0, _08136D84 @ =gWindowConfig_81E709C
	bl BasicInitMenuWindow
	movs r0, 0
	movs r1, 0x10
	movs r2, 0x1D
	movs r3, 0x13
	bl MenuDrawTextWindow
	ldr r0, _08136D88 @ =gOtherText_WontEat
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
	ldr r0, _08136D9C @ =gWindowConfig_81E7080
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
	ldr r1, _08136DF4 @ =gUnknown_08406134
	lsls r0, r3, 2
	adds r0, r1
	ldr r1, [r0]
	adds r0, r4, 0
	bl StringCopy
	ldr r1, _08136DF8 @ =gOtherText_WasEnhanced
	adds r0, r4, 0
	bl StringAppend
	b _08136E04
	.align 2, 0
_08136DF4: .4byte gUnknown_08406134
_08136DF8: .4byte gOtherText_WasEnhanced
_08136DFC:
	ldr r1, _08136E0C @ =gOtherText_NothingChanged
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
	ldr r7, _08136E3C @ =gUnknown_08406118
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
	ldr r1, _08136EE8 @ =gUnknown_08406118
	lsls r0, r4, 2
	adds r0, r1
	ldr r6, [r0]
	adds r0, r5, 0
	adds r1, r6, 0
	bl GetMonData
	lsls r0, 24
	lsrs r0, 24
	strb r0, [r7]
	ldr r1, _08136EEC @ =gUnknown_02039304
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
	ldr r5, _08136F60 @ =gPlayerParty
	ldr r0, _08136F64 @ =gUnknown_083DFEC4
	ldr r1, [r0]
	ldr r2, _08136F68 @ =0x000087dc
	adds r0, r1, r2
	movs r2, 0
	ldrsh r0, [r0, r2]
	lsls r0, 2
	adds r1, r0
	ldr r0, _08136F6C @ =0x0000893e
	adds r1, r0
	ldrb r0, [r1]
	lsls r0, 27
	lsrs r0, 27
	movs r1, 0x64
	muls r0, r1
	adds r5, r0, r5
	ldr r4, _08136F70 @ =gUnknown_02039304
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
	ldr r1, _08136FBC @ =gUnknown_02039304
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
	ldr r0, _08136FC0 @ =gUnknown_02039312
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
	ldr r0, _08137050 @ =gUnknown_02039304
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
	ldr r0, _08137054 @ =gUnknown_0840612C
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
	ldr r0, _0813708C @ =gPlayerParty
	ldr r1, _08137090 @ =gUnknown_083DFEC4
	ldr r2, [r1]
	ldr r3, _08137094 @ =0x000087dc
	adds r1, r2, r3
	movs r3, 0
	ldrsh r1, [r1, r3]
	lsls r1, 2
	adds r2, r1
	ldr r1, _08137098 @ =0x0000893e
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
	ldr r1, _081370C8 @ =gPlayerParty
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
	ldr r1, _08137120 @ =gPlayerParty
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
	ldr r0, _081371C0 @ =gSpriteSheet_ConditionUpDown
	bl LoadSpriteSheet
	ldr r0, _081371C4 @ =gSpritePalette_ConditionUpDown
	bl LoadSpritePalette
	ldr r2, _081371C8 @ =gUnknown_02039304
	ldr r0, [r2]
	adds r0, 0x54
	movs r1, 0
	strb r1, [r0]
	movs r4, 0
	adds r5, r2, 0
	ldr r6, _081371CC @ =gUnknown_08406158
	adds r0, r6, 0x2
	mov r8, r0
	ldr r7, _081371D0 @ =gSprites + 0x1C
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
	ldr r0, _081371D4 @ =gSpriteTemplate_840618C
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
	ldr r1, _081371D8 @ =sub_81371DC
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
	ldr r0, _0813721C @ =gUnknown_02039304
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
	ldr r1, _08137250 @ =gUnknown_03004330
	ldr r0, _08137254 @ =gUnknown_02024A60
	ldrb r0, [r0]
	lsls r0, 2
	adds r0, r1
	ldr r1, _08137258 @ =sub_813726C
	str r1, [r0]
	ldr r1, _0813725C @ =0x02000000
	ldr r2, _08137260 @ =0x000160a8
	adds r0, r1, r2
	movs r2, 0
	strb r2, [r0]
	ldr r3, _08137264 @ =0x000160a9
	adds r0, r1, r3
	strb r2, [r0]
	adds r3, 0x1
	adds r0, r1, r3
	strb r2, [r0]
	ldr r0, _08137268 @ =0x000160ab
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
	ldr r2, _081372A0 @ =gUnknown_02024A64
	ldr r1, _081372A4 @ =gBitTable
	ldr r0, _081372A8 @ =gUnknown_02024A60
	ldrb r3, [r0]
	lsls r0, r3, 2
	adds r0, r1
	ldr r1, [r2]
	ldr r0, [r0]
	ands r1, r0
	cmp r1, 0
	beq _081372B8
	ldr r0, _081372AC @ =gUnknown_02023A60
	lsls r1, r3, 9
	adds r1, r0
	ldrb r0, [r1]
	cmp r0, 0x38
	bhi _081372B4
	ldr r0, _081372B0 @ =gUnknown_084061A4
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
	ldr r1, _081372D8 @ =0x02000000
	ldr r2, _081372DC @ =0x000160a8
	adds r0, r1, r2
	ldrb r0, [r0]
	adds r5, r1, 0
	cmp r0, 0x5
	bls _081372CE
	b _08137410
_081372CE:
	lsls r0, 2
	ldr r1, _081372E0 @ =_081372E4
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
	ldr r0, _0813733C @ =0x000160aa
	adds r1, r5, r0
	movs r0, 0x40
	strb r0, [r1]
	ldr r2, _08137340 @ =0x000160a8
	adds r1, r5, r2
	ldrb r0, [r1]
	adds r0, 0x1
	strb r0, [r1]
_0813730E:
	ldr r0, _0813733C @ =0x000160aa
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
	ldr r2, _08137340 @ =0x000160a8
	adds r1, r5, r2
	b _0813738C
	.align 2, 0
_0813733C: .4byte 0x000160aa
_08137340: .4byte 0x000160a8
_08137344:
	ldr r2, _08137364 @ =0x000160aa
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
	ldr r2, _081373A0 @ =0x000160aa
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
	ldr r0, _081373A4 @ =0x000160a8
	adds r1, r5, r0
_0813738C:
	ldrb r0, [r1]
	adds r0, 0x1
	strb r0, [r1]
	ldr r1, _081373A8 @ =0x000160a9
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
	ldr r2, _081373E0 @ =0x000160aa
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
	ldr r0, _081373E4 @ =0x000160a8
	adds r1, r5, r0
	ldrb r0, [r1]
	adds r0, 0x1
	strb r0, [r1]
	b _08137410
	.align 2, 0
_081373E0: .4byte 0x000160aa
_081373E4: .4byte 0x000160a8
_081373E8:
	ldr r2, _08137418 @ =0x000160aa
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
	ldr r2, _08137444 @ =gSprites
	ldr r1, _08137448 @ =gUnknown_02024BE0
	ldr r0, _0813744C @ =gUnknown_02024A60
	ldrb r0, [r0]
	adds r0, r1
	ldrb r1, [r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r2, 0x1C
	adds r0, r2
	ldr r1, [r0]
	ldr r0, _08137450 @ =SpriteCallbackDummy
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
	ldr r0, _08137468 @ =gUnknown_03004210
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
	ldr r0, _0813749C @ =gPaletteFade
	ldrb r1, [r0, 0x7]
	movs r0, 0x80
	ands r0, r1
	cmp r0, 0
	bne _08137496
	ldr r2, _081374A0 @ =gMain
	ldr r0, _081374A4 @ =0x0000043d
	adds r3, r2, r0
	ldrb r1, [r3]
	movs r0, 0x3
	negs r0, r0
	ands r0, r1
	strb r0, [r3]
	ldr r0, _081374A8 @ =gUnknown_030042D0
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
	ldr r0, _081374C0 @ =gUnknown_02024E6D
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
	ldr r0, _081374EC @ =gPaletteFade
	ldrb r1, [r0, 0x7]
	movs r0, 0x80
	ands r0, r1
	cmp r0, 0
	bne _081374E8
	ldr r1, _081374F0 @ =gUnknown_03004330
	ldr r0, _081374F4 @ =gUnknown_02024A60
	ldrb r0, [r0]
	lsls r0, 2
	adds r0, r1
	ldr r1, _081374F8 @ =sub_81374FC
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
	ldr r0, _08137528 @ =gMain
	ldr r1, [r0, 0x4]
	ldr r0, _0813752C @ =sub_800F808
	cmp r1, r0
	bne _08137522
	ldr r0, _08137530 @ =gPaletteFade
	ldrb r1, [r0, 0x7]
	movs r0, 0x80
	ands r0, r1
	cmp r0, 0
	bne _08137522
	ldr r0, _08137534 @ =gScriptItemId
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
_08137534: .4byte gScriptItemId
	thumb_func_end sub_81374FC

	thumb_func_start sub_8137538
sub_8137538: @ 8137538
	push {r4-r7,lr}
	ldr r5, _0813768C @ =gUnknown_02024A60
	ldrb r2, [r5]
	lsls r3, r2, 1
	adds r0, r3, r2
	lsls r0, 2
	ldr r4, _08137690 @ =0x02017810
	adds r0, r4
	ldrb r1, [r0]
	movs r7, 0x88
	adds r0, r7, 0
	ands r0, r1
	cmp r0, 0
	bne _08137568
	ldr r0, _08137694 @ =gUnknown_02024A6A
	adds r0, r3, r0
	ldrh r1, [r0]
	movs r0, 0x64
	muls r1, r0
	ldr r0, _08137698 @ =gPlayerParty
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
	ldr r0, _08137694 @ =gUnknown_02024A6A
	adds r0, r3, r0
	ldrh r1, [r0]
	movs r0, 0x64
	muls r1, r0
	ldr r0, _08137698 @ =gPlayerParty
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
	bl IsDoubleBattle
	lsls r0, 24
	cmp r0, 0
	beq _08137626
	ldr r0, _0813769C @ =gBattleTypeFlags
	ldrh r1, [r0]
	movs r0, 0x40
	ands r0, r1
	cmp r0, 0
	bne _08137626
	ldr r1, _081376A0 @ =gUnknown_0300434C
	ldrb r0, [r5]
	eors r0, r6
	adds r0, r1
	ldrb r1, [r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	ldr r1, _081376A4 @ =gSprites
	adds r0, r1
	bl DestroySprite
	ldr r4, _081376A8 @ =gUnknown_03004340
	ldrb r0, [r5]
	adds r1, r6, 0
	eors r1, r0
	adds r0, r1, r4
	ldrb r0, [r0]
	ldr r2, _08137694 @ =gUnknown_02024A6A
	lsls r1, 1
	adds r1, r2
	ldrh r2, [r1]
	movs r1, 0x64
	muls r1, r2
	ldr r2, _08137698 @ =gPlayerParty
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
	ldr r1, _081376A0 @ =gUnknown_0300434C
	ldr r4, _0813768C @ =gUnknown_02024A60
	ldrb r0, [r4]
	adds r0, r1
	ldrb r1, [r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	ldr r1, _081376A4 @ =gSprites
	adds r0, r1
	bl DestroySprite
	ldr r5, _081376A8 @ =gUnknown_03004340
	ldrb r1, [r4]
	adds r0, r1, r5
	ldrb r0, [r0]
	ldr r2, _08137694 @ =gUnknown_02024A6A
	lsls r1, 1
	adds r1, r2
	ldrh r2, [r1]
	movs r1, 0x64
	muls r1, r2
	ldr r2, _08137698 @ =gPlayerParty
	adds r1, r2
	movs r2, 0
	bl sub_8045A5C
	ldrb r0, [r4]
	bl sub_804777C
	ldrb r0, [r4]
	adds r0, r5
	ldrb r0, [r0]
	bl sub_8043DFC
	ldr r2, _081376AC @ =0x02017840
	ldrb r1, [r2, 0x9]
	movs r0, 0x2
	negs r0, r0
	ands r0, r1
	strb r0, [r2, 0x9]
	ldr r1, _081376B0 @ =gUnknown_03004330
	ldrb r0, [r4]
	lsls r0, 2
	adds r0, r1
	ldr r1, _081376B4 @ =sub_81376B8
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
_0813769C: .4byte gBattleTypeFlags
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
	ldr r2, _0813778C @ =gSprites
	ldr r0, _08137790 @ =gUnknown_03004340
	ldr r7, _08137794 @ =gUnknown_02024A60
	ldrb r3, [r7]
	adds r0, r3, r0
	ldrb r1, [r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r2, 0x1C
	adds r0, r2
	ldr r1, [r0]
	ldr r0, _08137798 @ =SpriteCallbackDummy
	cmp r1, r0
	bne _081376DC
	movs r4, 0x1
_081376DC:
	cmp r4, 0
	beq _08137784
	lsls r0, r3, 1
	adds r0, r3
	lsls r0, 2
	ldr r5, _0813779C @ =0x02017810
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
	ldr r4, _081377A0 @ =0x000027f9
	adds r0, r4, 0
	bl FreeSpriteTilesByTag
	adds r0, r4, 0
	bl FreeSpritePaletteByTag
	ldr r0, _081377A4 @ =c3_0802FDF4
	movs r1, 0xA
	bl CreateTask
	ldr r2, _081377A8 @ =gUnknown_02024A6A
	ldrb r1, [r7]
	lsls r0, r1, 1
	adds r0, r2
	ldrh r2, [r0]
	movs r0, 0x64
	muls r0, r2
	ldr r2, _081377AC @ =gPlayerParty
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
	ldr r5, _081377F0 @ =gUnknown_02024A60
	ldrb r0, [r5]
	ldr r6, _081377F4 @ =gUnknown_03004340
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
	ldr r2, _08137818 @ =gUnknown_02024A6A
	ldrb r1, [r5]
	lsls r0, r1, 1
	adds r0, r2
	ldrh r2, [r0]
	movs r0, 0x64
	muls r0, r2
	ldr r2, _0813781C @ =gPlayerParty
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
	ldr r1, _0813785C @ =gUnknown_02024BE0
	ldr r0, _08137860 @ =gUnknown_02024A60
	ldrb r0, [r0]
	adds r0, r1
	ldrb r1, [r0]
	ldr r2, _08137864 @ =gSprites
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
	ldr r0, _08137868 @ =gUnknown_02024E6D
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
	ldr r6, _081378F4 @ =gUnknown_02024A60
	ldrb r2, [r6]
	lsls r0, r2, 1
	adds r0, r2
	lsls r0, 2
	ldr r1, _081378F8 @ =0x02017810
	adds r0, r1
	ldrb r1, [r0]
	movs r0, 0x40
	ands r0, r1
	cmp r0, 0
	bne _081378EC
	ldr r5, _081378FC @ =gUnknown_02024BE0
	adds r0, r2, r5
	ldrb r1, [r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	ldr r4, _08137900 @ =gSprites
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
	ldr r1, _08137904 @ =gUnknown_03004340
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
	ldr r2, _08137930 @ =gSprites
	ldr r1, _08137934 @ =gUnknown_02024BE0
	ldr r0, _08137938 @ =gUnknown_02024A60
	ldrb r0, [r0]
	adds r0, r1
	ldrb r1, [r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r2, 0x1C
	adds r0, r2
	ldr r1, [r0]
	ldr r0, _0813793C @ =SpriteCallbackDummy
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
	ldr r0, _08137964 @ =gUnknown_02024A60
	ldrb r1, [r0]
	lsls r0, r1, 1
	adds r0, r1
	lsls r0, 2
	ldr r1, _08137968 @ =0x02017810
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
	ldr r1, _081379AC @ =gUnknown_03004330
	ldr r4, _081379B0 @ =gUnknown_02024A60
	ldrb r0, [r4]
	lsls r0, 2
	adds r0, r1
	ldr r1, _081379B4 @ =sub_813726C
	str r1, [r0]
	ldr r0, _081379B8 @ =gBattleTypeFlags
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
	ldr r1, _081379BC @ =gUnknown_02023A60
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
_081379B8: .4byte gBattleTypeFlags
_081379BC: .4byte gUnknown_02023A60
_081379C0:
	ldr r2, _081379DC @ =gUnknown_02024A64
	ldr r1, _081379E0 @ =gBitTable
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
	ldr r0, _08137A08 @ =gUnknown_02024A60
	ldrb r1, [r0]
	lsls r0, r1, 1
	adds r0, r1
	lsls r0, 2
	ldr r1, _08137A0C @ =0x02017810
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
	ldr r1, _08137A3C @ =gUnknown_02023A60
	ldr r0, _08137A40 @ =gUnknown_02024A60
	ldrb r2, [r0]
	lsls r0, r2, 9
	adds r1, 0x2
	adds r1, r0, r1
	ldrb r0, [r1]
	cmp r0, 0
	bne _08137A48
	ldr r0, _08137A44 @ =gUnknown_02024A6A
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
	ldr r2, _08137AB8 @ =gUnknown_02023A60
	ldr r3, _08137ABC @ =gUnknown_02024A60
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
	ldr r1, _08137AC0 @ =_08137AC4
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
	ldr r0, _08137DC8 @ =gPlayerParty
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
	ldr r0, _08137DC8 @ =gPlayerParty
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
	ldr r1, _08137DCC @ =0xfffffc1f
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
	ldr r2, _08137DD0 @ =0xfff07fff
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
	ldr r1, _08137DD4 @ =0xfffffe0f
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
	ldr r1, _08137DE4 @ =gPlayerParty
	adds r0, r1
	movs r1, 0xB
	b _08138152
	.align 2, 0
_08137DE4: .4byte gPlayerParty
_08137DE8:
	movs r0, 0x64
	muls r0, r5
	ldr r1, _08137DF4 @ =gPlayerParty
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
	ldr r0, _08137E5C @ =gPlayerParty
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
	ldr r1, _08137E5C @ =gPlayerParty
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
	ldr r1, _08137E78 @ =gPlayerParty
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
	ldr r2, _08137EB4 @ =gPlayerParty
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
	ldr r1, _08137EB4 @ =gPlayerParty
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
	ldr r1, _08137ED0 @ =gPlayerParty
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
	ldr r1, _08137EE0 @ =gPlayerParty
	adds r0, r1
	movs r1, 0x1
	b _08137EEE
	.align 2, 0
_08137EE0: .4byte gPlayerParty
_08137EE4:
	movs r0, 0x64
	muls r0, r5
	ldr r1, _08137F10 @ =gPlayerParty
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
	ldr r1, _08137F20 @ =gPlayerParty
	adds r0, r1
	movs r1, 0x1A
	b _08138212
	.align 2, 0
_08137F20: .4byte gPlayerParty
_08137F24:
	movs r0, 0x64
	muls r0, r5
	ldr r1, _08137F30 @ =gPlayerParty
	adds r0, r1
	movs r1, 0x1B
	b _08138212
	.align 2, 0
_08137F30: .4byte gPlayerParty
_08137F34:
	movs r0, 0x64
	muls r0, r5
	ldr r1, _08137F40 @ =gPlayerParty
	adds r0, r1
	movs r1, 0x1C
	b _08138212
	.align 2, 0
_08137F40: .4byte gPlayerParty
_08137F44:
	movs r0, 0x64
	muls r0, r5
	ldr r1, _08137F50 @ =gPlayerParty
	adds r0, r1
	movs r1, 0x1D
	b _08138212
	.align 2, 0
_08137F50: .4byte gPlayerParty
_08137F54:
	movs r0, 0x64
	muls r0, r5
	ldr r1, _08137F60 @ =gPlayerParty
	adds r0, r1
	movs r1, 0x1E
	b _08138212
	.align 2, 0
_08137F60: .4byte gPlayerParty
_08137F64:
	movs r0, 0x64
	muls r0, r5
	ldr r1, _08137F70 @ =gPlayerParty
	adds r0, r1
	movs r1, 0x1F
	b _08138212
	.align 2, 0
_08137F70: .4byte gPlayerParty
_08137F74:
	movs r0, 0x64
	muls r0, r5
	ldr r1, _08137F80 @ =gPlayerParty
	adds r0, r1
	movs r1, 0x20
	b _08138212
	.align 2, 0
_08137F80: .4byte gPlayerParty
_08137F84:
	movs r0, 0x64
	muls r0, r5
	ldr r1, _08137F90 @ =gPlayerParty
	adds r0, r1
	movs r1, 0x22
	b _08138212
	.align 2, 0
_08137F90: .4byte gPlayerParty
_08137F94:
	movs r0, 0x64
	muls r0, r5
	ldr r1, _08137FA0 @ =gPlayerParty
	adds r0, r1
	movs r1, 0x23
	b _08138212
	.align 2, 0
_08137FA0: .4byte gPlayerParty
_08137FA4:
	movs r0, 0x64
	muls r0, r5
	ldr r1, _08137FB0 @ =gPlayerParty
	adds r0, r1
	movs r1, 0x24
	b _08138212
	.align 2, 0
_08137FB0: .4byte gPlayerParty
_08137FB4:
	movs r0, 0x64
	muls r0, r5
	ldr r1, _08137FC0 @ =gPlayerParty
	adds r0, r1
	movs r1, 0x25
	b _08138212
	.align 2, 0
_08137FC0: .4byte gPlayerParty
_08137FC4:
	movs r0, 0x64
	muls r0, r5
	ldr r1, _08137FD0 @ =gPlayerParty
	adds r0, r1
	movs r1, 0x26
	b _08138212
	.align 2, 0
_08137FD0: .4byte gPlayerParty
_08137FD4:
	movs r0, 0x64
	adds r4, r5, 0
	muls r4, r0
	ldr r0, _08138020 @ =gPlayerParty
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
	ldr r1, _08138030 @ =gPlayerParty
	adds r0, r1
	movs r1, 0x27
	b _08138212
	.align 2, 0
_08138030: .4byte gPlayerParty
_08138034:
	movs r0, 0x64
	muls r0, r5
	ldr r1, _08138040 @ =gPlayerParty
	adds r0, r1
	movs r1, 0x28
	b _08138212
	.align 2, 0
_08138040: .4byte gPlayerParty
_08138044:
	movs r0, 0x64
	muls r0, r5
	ldr r1, _08138050 @ =gPlayerParty
	adds r0, r1
	movs r1, 0x29
	b _08138212
	.align 2, 0
_08138050: .4byte gPlayerParty
_08138054:
	movs r0, 0x64
	muls r0, r5
	ldr r1, _08138060 @ =gPlayerParty
	adds r0, r1
	movs r1, 0x2A
	b _08138212
	.align 2, 0
_08138060: .4byte gPlayerParty
_08138064:
	movs r0, 0x64
	muls r0, r5
	ldr r1, _08138070 @ =gPlayerParty
	adds r0, r1
	movs r1, 0x2B
	b _08138212
	.align 2, 0
_08138070: .4byte gPlayerParty
_08138074:
	movs r0, 0x64
	muls r0, r5
	ldr r1, _08138080 @ =gPlayerParty
	adds r0, r1
	movs r1, 0x2C
	b _08138212
	.align 2, 0
_08138080: .4byte gPlayerParty
_08138084:
	movs r0, 0x64
	muls r0, r5
	ldr r1, _08138090 @ =gPlayerParty
	adds r0, r1
	movs r1, 0
	b _081380AE
	.align 2, 0
_08138090: .4byte gPlayerParty
_08138094:
	movs r0, 0x64
	muls r0, r5
	ldr r1, _081380A0 @ =gPlayerParty
	adds r0, r1
	movs r1, 0x9
	b _08138152
	.align 2, 0
_081380A0: .4byte gPlayerParty
_081380A4:
	movs r0, 0x64
	muls r0, r5
	ldr r1, _081380D4 @ =gPlayerParty
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
	ldr r1, _081380E4 @ =gPlayerParty
	adds r0, r1
	movs r1, 0x38
	b _08138212
	.align 2, 0
_081380E4: .4byte gPlayerParty
_081380E8:
	movs r0, 0x64
	muls r0, r5
	ldr r1, _081380F4 @ =gPlayerParty
	adds r0, r1
	movs r1, 0x39
	b _08138152
	.align 2, 0
_081380F4: .4byte gPlayerParty
_081380F8:
	movs r0, 0x64
	muls r0, r5
	ldr r1, _08138104 @ =gPlayerParty
	adds r0, r1
	movs r1, 0x3A
	b _08138152
	.align 2, 0
_08138104: .4byte gPlayerParty
_08138108:
	movs r0, 0x64
	muls r0, r5
	ldr r1, _08138114 @ =gPlayerParty
	adds r0, r1
	movs r1, 0x3B
	b _08138152
	.align 2, 0
_08138114: .4byte gPlayerParty
_08138118:
	movs r0, 0x64
	muls r0, r5
	ldr r1, _08138124 @ =gPlayerParty
	adds r0, r1
	movs r1, 0x3C
	b _08138152
	.align 2, 0
_08138124: .4byte gPlayerParty
_08138128:
	movs r0, 0x64
	muls r0, r5
	ldr r1, _08138134 @ =gPlayerParty
	adds r0, r1
	movs r1, 0x3D
	b _08138152
	.align 2, 0
_08138134: .4byte gPlayerParty
_08138138:
	movs r0, 0x64
	muls r0, r5
	ldr r1, _08138144 @ =gPlayerParty
	adds r0, r1
	movs r1, 0x3E
	b _08138152
	.align 2, 0
_08138144: .4byte gPlayerParty
_08138148:
	movs r0, 0x64
	muls r0, r5
	ldr r1, _08138164 @ =gPlayerParty
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
	ldr r1, _08138174 @ =gPlayerParty
	adds r0, r1
	movs r1, 0x16
	b _08138212
	.align 2, 0
_08138174: .4byte gPlayerParty
_08138178:
	movs r0, 0x64
	muls r0, r5
	ldr r1, _08138184 @ =gPlayerParty
	adds r0, r1
	movs r1, 0x17
	b _08138212
	.align 2, 0
_08138184: .4byte gPlayerParty
_08138188:
	movs r0, 0x64
	muls r0, r5
	ldr r1, _08138194 @ =gPlayerParty
	adds r0, r1
	movs r1, 0x18
	b _08138212
	.align 2, 0
_08138194: .4byte gPlayerParty
_08138198:
	movs r0, 0x64
	muls r0, r5
	ldr r1, _081381A4 @ =gPlayerParty
	adds r0, r1
	movs r1, 0x21
	b _08138212
	.align 2, 0
_081381A4: .4byte gPlayerParty
_081381A8:
	movs r0, 0x64
	muls r0, r5
	ldr r1, _081381B4 @ =gPlayerParty
	adds r0, r1
	movs r1, 0x2F
	b _08138212
	.align 2, 0
_081381B4: .4byte gPlayerParty
_081381B8:
	movs r0, 0x64
	muls r0, r5
	ldr r1, _081381C4 @ =gPlayerParty
	adds r0, r1
	movs r1, 0x30
	b _08138212
	.align 2, 0
_081381C4: .4byte gPlayerParty
_081381C8:
	movs r0, 0x64
	muls r0, r5
	ldr r1, _081381D4 @ =gPlayerParty
	adds r0, r1
	movs r1, 0x32
	b _08138212
	.align 2, 0
_081381D4: .4byte gPlayerParty
_081381D8:
	movs r0, 0x64
	muls r0, r5
	ldr r1, _081381E4 @ =gPlayerParty
	adds r0, r1
	movs r1, 0x33
	b _08138212
	.align 2, 0
_081381E4: .4byte gPlayerParty
_081381E8:
	movs r0, 0x64
	muls r0, r5
	ldr r1, _081381F4 @ =gPlayerParty
	adds r0, r1
	movs r1, 0x34
	b _08138212
	.align 2, 0
_081381F4: .4byte gPlayerParty
_081381F8:
	movs r0, 0x64
	muls r0, r5
	ldr r1, _08138204 @ =gPlayerParty
	adds r0, r1
	movs r1, 0x35
	b _08138212
	.align 2, 0
_08138204: .4byte gPlayerParty
_08138208:
	movs r0, 0x64
	muls r0, r5
	ldr r1, _0813822C @ =gPlayerParty
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
	ldr r1, _08138260 @ =gUnknown_02023A60
	ldr r0, _08138264 @ =gUnknown_02024A60
	ldrb r2, [r0]
	lsls r0, r2, 9
	adds r1, 0x2
	adds r1, r0, r1
	ldrb r0, [r1]
	cmp r0, 0
	bne _0813826C
	ldr r0, _08138268 @ =gUnknown_02024A6A
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
	ldr r0, _081382CC @ =gUnknown_02024A60
	ldrb r0, [r0]
	lsls r0, 9
	ldr r2, _081382D0 @ =gUnknown_02023A63
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
	ldr r1, _081382D4 @ =_081382D8
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
	ldr r0, _0813855C @ =gPlayerParty
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
	ldr r0, _0813855C @ =gPlayerParty
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
	ldr r1, _08138578 @ =gPlayerParty
	adds r0, r1
	ldr r1, _0813857C @ =gUnknown_02024A60
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
	ldr r1, _08138598 @ =gPlayerParty
	adds r0, r1
	ldr r1, _0813859C @ =gUnknown_02024A60
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
	ldr r0, _081385F4 @ =gPlayerParty
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
	ldr r1, _081385F4 @ =gPlayerParty
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
	ldr r1, _08138614 @ =gPlayerParty
	adds r0, r1
	ldr r3, _08138618 @ =gUnknown_02023A60
	ldr r1, _0813861C @ =gUnknown_02024A60
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
	ldr r0, _0813867C @ =gPlayerParty
	adds r4, r0
	ldr r5, _08138680 @ =gUnknown_02024A60
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
	ldr r1, _081386A8 @ =gPlayerParty
	adds r0, r1
	ldr r3, _081386AC @ =gUnknown_02023A60
	ldr r1, _081386B0 @ =gUnknown_02024A60
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
	ldr r1, _081386CC @ =gPlayerParty
	adds r0, r1
	ldr r1, _081386D0 @ =gUnknown_02024A60
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
	ldr r1, _081386EC @ =gPlayerParty
	adds r0, r1
	ldr r1, _081386F0 @ =gUnknown_02024A60
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
	ldr r1, _0813870C @ =gPlayerParty
	adds r0, r1
	ldr r1, _08138710 @ =gUnknown_02024A60
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
	ldr r1, _0813872C @ =gPlayerParty
	adds r0, r1
	ldr r1, _08138730 @ =gUnknown_02024A60
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
	ldr r1, _0813874C @ =gPlayerParty
	adds r0, r1
	ldr r1, _08138750 @ =gUnknown_02024A60
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
	ldr r1, _0813876C @ =gPlayerParty
	adds r0, r1
	ldr r1, _08138770 @ =gUnknown_02024A60
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
	ldr r1, _0813878C @ =gPlayerParty
	adds r0, r1
	ldr r1, _08138790 @ =gUnknown_02024A60
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
	ldr r1, _081387AC @ =gPlayerParty
	adds r0, r1
	ldr r1, _081387B0 @ =gUnknown_02024A60
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
	ldr r1, _081387CC @ =gPlayerParty
	adds r0, r1
	ldr r1, _081387D0 @ =gUnknown_02024A60
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
	ldr r1, _081387EC @ =gPlayerParty
	adds r0, r1
	ldr r1, _081387F0 @ =gUnknown_02024A60
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
	ldr r1, _0813880C @ =gPlayerParty
	adds r0, r1
	ldr r1, _08138810 @ =gUnknown_02024A60
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
	ldr r1, _0813882C @ =gPlayerParty
	adds r0, r1
	ldr r1, _08138830 @ =gUnknown_02024A60
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
	ldr r1, _0813884C @ =gPlayerParty
	adds r0, r1
	ldr r1, _08138850 @ =gUnknown_02024A60
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
	ldr r1, _0813886C @ =gPlayerParty
	adds r0, r1
	ldr r1, _08138870 @ =gUnknown_02024A60
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
	ldr r0, _081388DC @ =gPlayerParty
	adds r4, r0
	ldr r5, _081388E0 @ =gUnknown_02024A60
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
	ldr r1, _081388FC @ =gPlayerParty
	adds r0, r1
	ldr r1, _08138900 @ =gUnknown_02024A60
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
	ldr r1, _0813891C @ =gPlayerParty
	adds r0, r1
	ldr r1, _08138920 @ =gUnknown_02024A60
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
	ldr r1, _0813893C @ =gPlayerParty
	adds r0, r1
	ldr r1, _08138940 @ =gUnknown_02024A60
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
	ldr r1, _0813895C @ =gPlayerParty
	adds r0, r1
	ldr r1, _08138960 @ =gUnknown_02024A60
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
	ldr r1, _0813897C @ =gPlayerParty
	adds r0, r1
	ldr r1, _08138980 @ =gUnknown_02024A60
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
	ldr r1, _0813899C @ =gPlayerParty
	adds r0, r1
	ldr r1, _081389A0 @ =gUnknown_02024A60
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
	ldr r1, _081389BC @ =gPlayerParty
	adds r0, r1
	ldr r1, _081389C0 @ =gUnknown_02024A60
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
	ldr r1, _081389DC @ =gPlayerParty
	adds r0, r1
	ldr r1, _081389E0 @ =gUnknown_02024A60
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
	ldr r1, _081389FC @ =gPlayerParty
	adds r0, r1
	ldr r1, _08138A00 @ =gUnknown_02024A60
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
	ldr r1, _08138A1C @ =gPlayerParty
	adds r0, r1
	ldr r1, _08138A20 @ =gUnknown_02024A60
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
	ldr r1, _08138A3C @ =gPlayerParty
	adds r0, r1
	ldr r1, _08138A40 @ =gUnknown_02024A60
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
	ldr r1, _08138A5C @ =gPlayerParty
	adds r0, r1
	ldr r1, _08138A60 @ =gUnknown_02024A60
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
	ldr r1, _08138A7C @ =gPlayerParty
	adds r0, r1
	ldr r1, _08138A80 @ =gUnknown_02024A60
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
	ldr r1, _08138A9C @ =gPlayerParty
	adds r0, r1
	ldr r1, _08138AA0 @ =gUnknown_02024A60
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
	ldr r1, _08138ABC @ =gPlayerParty
	adds r0, r1
	ldr r1, _08138AC0 @ =gUnknown_02024A60
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
	ldr r1, _08138ADC @ =gPlayerParty
	adds r0, r1
	ldr r1, _08138AE0 @ =gUnknown_02024A60
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
	ldr r1, _08138AFC @ =gPlayerParty
	adds r0, r1
	ldr r1, _08138B00 @ =gUnknown_02024A60
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
	ldr r1, _08138B1C @ =gPlayerParty
	adds r0, r1
	ldr r1, _08138B20 @ =gUnknown_02024A60
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
	ldr r1, _08138B3C @ =gPlayerParty
	adds r0, r1
	ldr r1, _08138B40 @ =gUnknown_02024A60
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
	ldr r1, _08138B5C @ =gPlayerParty
	adds r0, r1
	ldr r1, _08138B60 @ =gUnknown_02024A60
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
	ldr r1, _08138B7C @ =gPlayerParty
	adds r0, r1
	ldr r1, _08138B80 @ =gUnknown_02024A60
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
	ldr r1, _08138B9C @ =gPlayerParty
	adds r0, r1
	ldr r1, _08138BA0 @ =gUnknown_02024A60
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
	ldr r1, _08138BBC @ =gPlayerParty
	adds r0, r1
	ldr r1, _08138BC0 @ =gUnknown_02024A60
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
	ldr r1, _08138BDC @ =gPlayerParty
	adds r0, r1
	ldr r1, _08138BE0 @ =gUnknown_02024A60
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
	ldr r1, _08138BFC @ =gPlayerParty
	adds r0, r1
	ldr r1, _08138C00 @ =gUnknown_02024A60
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
	ldr r1, _08138C1C @ =gPlayerParty
	adds r0, r1
	ldr r1, _08138C20 @ =gUnknown_02024A60
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
	ldr r1, _08138C3C @ =gPlayerParty
	adds r0, r1
	ldr r1, _08138C40 @ =gUnknown_02024A60
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
	ldr r1, _08138C84 @ =gPlayerParty
	adds r0, r1
	ldr r1, _08138C88 @ =gUnknown_02024A60
	ldrb r2, [r1]
	lsls r2, 9
	adds r2, r7
	movs r1, 0x36
	bl SetMonData
_08138C5A:
	ldr r2, _08138C8C @ =gUnknown_02024A6A
	ldr r0, _08138C88 @ =gUnknown_02024A60
	ldrb r1, [r0]
	lsls r0, r1, 1
	adds r0, r2
	ldrh r2, [r0]
	movs r0, 0x64
	muls r0, r2
	ldr r2, _08138C84 @ =gPlayerParty
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
	ldr r0, _08138CE0 @ =gUnknown_02023A60
	ldr r6, _08138CE4 @ =gUnknown_02024A60
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
	ldr r0, _08138CE8 @ =gUnknown_03004330
	ldrb r1, [r6]
	lsls r1, 2
	adds r1, r0
	ldr r0, _08138CEC @ =sub_813789C
	str r0, [r1]
	b _08138D26
	.align 2, 0
_08138CE0: .4byte gUnknown_02023A60
_08138CE4: .4byte gUnknown_02024A60
_08138CE8: .4byte gUnknown_03004330
_08138CEC: .4byte sub_813789C
_08138CF0:
	ldr r5, _08138D2C @ =gUnknown_02024BE0
	adds r0, r2, r5
	ldrb r1, [r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	ldr r4, _08138D30 @ =gSprites
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
	ldr r1, _08138D34 @ =gUnknown_03004340
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
	ldr r4, _08138DE0 @ =gUnknown_02024A60
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
	ldr r0, _08138DE4 @ =gUnknown_02024E8C
	ldr r1, _08138DE8 @ =gTrainerBackPicCoords
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
	ldr r6, _08138DEC @ =gUnknown_02024BE0
	ldrb r1, [r4]
	adds r1, r6
	strb r0, [r1]
	ldr r5, _08138DF0 @ =gSprites
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
	ldr r1, _08138DF4 @ =0x0000fffe
	strh r1, [r0, 0x2E]
	ldrb r0, [r4]
	adds r0, r6
	ldrb r1, [r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r5, 0x1C
	adds r0, r5
	ldr r1, _08138DF8 @ =sub_80313A0
	str r1, [r0]
	ldr r1, _08138DFC @ =gUnknown_03004330
	ldrb r0, [r4]
	lsls r0, 2
	adds r0, r1
	ldr r1, _08138E00 @ =sub_813741C
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
	ldr r4, _08138EAC @ =gUnknown_02024A60
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
	ldr r0, _08138EB0 @ =gUnknown_02024E8C
	ldr r1, _08138EB4 @ =gTrainerBackPicCoords
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
	ldr r6, _08138EB8 @ =gUnknown_02024BE0
	ldrb r1, [r4]
	adds r1, r6
	strb r0, [r1]
	ldr r5, _08138EBC @ =gSprites
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
	ldr r1, _08138EC0 @ =0x0000ffa0
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
	ldr r1, _08138EC4 @ =sub_80313A0
	str r1, [r0]
	ldr r1, _08138EC8 @ =gUnknown_03004330
	ldrb r0, [r4]
	lsls r0, 2
	adds r0, r1
	ldr r1, _08138ECC @ =sub_8137908
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
	ldr r1, _08138F30 @ =0x02017840
	movs r0, 0x4
	strb r0, [r1, 0x8]
	ldr r1, _08138F34 @ =gUnknown_02024E6D
	movs r0, 0x1
	strb r0, [r1]
	ldr r5, _08138F38 @ =gUnknown_02024A60
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
	ldr r1, _08138F3C @ =gUnknown_03004330
	ldrb r0, [r5]
	lsls r0, 2
	adds r0, r1
	ldr r1, _08138F40 @ =bx_wait_t5
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
	ldr r1, _08138F88 @ =gUnknown_02023A60
	ldr r5, _08138F8C @ =gUnknown_02024A60
	ldrb r0, [r5]
	lsls r0, 9
	adds r1, 0x1
	adds r0, r1
	ldrb r1, [r0]
	ldr r0, _08138F90 @ =0x02017840
	strb r1, [r0, 0x8]
	ldr r1, _08138F94 @ =gUnknown_02024E6D
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
	ldr r1, _08138F98 @ =gUnknown_03004330
	ldrb r0, [r5]
	lsls r0, 2
	adds r0, r1
	ldr r1, _08138F9C @ =bx_wait_t5
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
	ldr r0, _08139080 @ =gUnknown_02023A60
	mov r12, r0
	ldr r6, _08139084 @ =gUnknown_02024A60
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
	ldr r5, _08139088 @ =gUnknown_0202F7C4
	mov r1, r12
	adds r1, 0x3
	adds r2, r1
	ldrb r1, [r2]
	strb r1, [r5]
	ldr r4, _0813908C @ =gUnknown_0202F7BC
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
	ldr r4, _08139090 @ =gUnknown_0202F7B8
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
	ldr r3, _08139094 @ =gUnknown_0202F7BE
	ldrb r1, [r6]
	lsls r1, 9
	mov r2, r12
	adds r2, 0xA
	adds r1, r2
	ldrb r1, [r1]
	strb r1, [r3]
	ldr r4, _08139098 @ =gUnknown_0202F7C0
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
	ldr r3, _0813909C @ =gUnknown_0202F7B4
	ldrb r2, [r6]
	lsls r2, 9
	mov r1, r12
	adds r1, 0x10
	adds r2, r1
	str r2, [r3]
	ldr r3, _081390A0 @ =gUnknown_02024E70
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
	ldr r1, _081390C4 @ =0x02017810
	adds r0, r1
	strb r2, [r0, 0x4]
	ldr r1, _081390C8 @ =gUnknown_03004330
	ldrb r0, [r6]
	lsls r0, 2
	adds r0, r1
	ldr r1, _081390CC @ =sub_81390D0
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
	ldr r2, _0813910C @ =gUnknown_02023A60
	ldr r5, _08139110 @ =gUnknown_02024A60
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
	ldr r6, _08139114 @ =0x02017810
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
	ldr r0, _081391BC @ =gUnknown_0202F7AC
	ldr r0, [r0]
	bl _call_via_r0
	ldr r0, _081391C0 @ =gUnknown_0202F7B1
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
	ldr r0, _08139254 @ =gUnknown_030042A4
	movs r1, 0
	strh r1, [r0]
	ldr r0, _08139258 @ =gUnknown_030042A0
	strh r1, [r0]
	ldr r5, _0813925C @ =gUnknown_02024A60
	ldrb r0, [r5]
	lsls r0, 9
	ldr r1, _08139260 @ =gUnknown_02023A62
	adds r4, r0, r1
	ldrh r0, [r4]
	cmp r0, 0x2
	bne _0813922A
	bl sub_814A7FC
_0813922A:
	ldrh r0, [r4]
	bl sub_8120AA8
	ldr r0, _08139264 @ =gUnknown_03004210
	ldr r1, _08139268 @ =gUnknown_020238CC
	movs r2, 0xF
	str r2, [sp]
	movs r2, 0x90
	movs r3, 0x2
	bl sub_8002EB0
	ldr r1, _0813926C @ =gUnknown_03004330
	ldrb r0, [r5]
	lsls r0, 2
	adds r0, r1
	ldr r1, _08139270 @ =sub_8137454
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
	ldr r0, _0813928C @ =gUnknown_02024A60
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
	ldr r0, _0813934C @ =gUnknown_030042A4
	movs r2, 0
	strh r2, [r0]
	ldr r1, _08139350 @ =gUnknown_030042A0
	movs r0, 0xA0
	strh r0, [r1]
	ldr r4, _08139354 @ =gUnknown_03004210
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
	ldr r1, _08139358 @ =gUnknown_03004330
	ldr r0, _0813935C @ =gUnknown_02024A60
	ldrb r0, [r0]
	lsls r0, 2
	adds r0, r1
	ldr r1, _08139360 @ =sub_81372BC
	str r1, [r0]
	ldr r1, _08139364 @ =gUnknown_08400CF3
	movs r2, 0xC8
	lsls r2, 1
	movs r0, 0x23
	str r0, [sp]
	adds r0, r4, 0
	movs r3, 0x12
	bl InitWindow
	adds r0, r4, 0
	bl sub_8002F44
	ldr r1, _08139368 @ =0x0000ffff
	ldr r3, _0813936C @ =0x00002d9f
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
	ldr r0, _08139370 @ =gUnknown_08400CCC
	bl get_battle_strings_
	ldr r4, _08139354 @ =gUnknown_03004210
	ldr r1, _08139374 @ =gUnknown_020238CC
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
	ldr r5, _08139398 @ =0x02000000
	ldr r0, _0813939C @ =0x000160a9
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
	ldr r0, _081393E4 @ =0x000160ab
	adds r1, r5, r0
	movs r0, 0x50
	strb r0, [r1]
_081393B2:
	ldr r1, _081393E8 @ =0x02000000
	ldr r0, _081393E4 @ =0x000160ab
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
	ldr r1, _0813941C @ =gUnknown_03004330
	ldr r2, _08139420 @ =gUnknown_02024A60
	ldrb r0, [r2]
	lsls r0, 2
	adds r0, r1
	ldr r1, _08139424 @ =sub_81374C4
	str r1, [r0]
	ldr r1, _08139428 @ =gUnknown_02024E6C
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
	ldr r3, _081394BC @ =gUnknown_02023A60
	ldr r0, _081394C0 @ =gUnknown_02024A60
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
	ldr r0, _081394C4 @ =0x00007fff
	cmp r7, r0
	beq _081394D4
	ldr r6, _081394C8 @ =gUnknown_02024A6A
	lsls r0, r4, 1
	adds r0, r6
	ldrh r0, [r0]
	movs r5, 0x64
	muls r0, r5
	ldr r4, _081394CC @ =gPlayerParty
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
	ldr r1, _081394D0 @ =gUnknown_03004340
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
	ldr r1, _0813952C @ =gUnknown_02024A6A
	lsls r0, r4, 1
	adds r0, r1
	ldrh r1, [r0]
	movs r0, 0x64
	muls r0, r1
	ldr r1, _08139530 @ =gPlayerParty
	adds r0, r1
	movs r1, 0x3A
	bl GetMonData
	adds r2, r0, 0
	mov r1, r9
	ldrb r0, [r1]
	ldr r4, _08139534 @ =gUnknown_03004340
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
	ldr r1, _08139538 @ =gUnknown_03004330
	ldr r0, _0813953C @ =gUnknown_02024A60
	ldrb r0, [r0]
	lsls r0, 2
	adds r0, r1
	ldr r1, _08139540 @ =sub_81377B0
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
	ldr r3, _0813962C @ =gSprites
	ldr r2, _08139630 @ =gUnknown_02024BE0
	ldr r4, _08139634 @ =gUnknown_02024A60
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
	ldr r1, _08139668 @ =gUnknown_02024E6D
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
	ldr r1, _0813966C @ =gUnknown_03004330
	ldrb r0, [r4]
	lsls r0, 2
	adds r0, r1
	ldr r1, _08139670 @ =bx_blink_t5
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
	ldr r2, _081396A8 @ =gUnknown_02023A60
	ldr r0, _081396AC @ =gUnknown_02024A60
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
	ldr r2, _081396D8 @ =gUnknown_02023A60
	ldr r0, _081396DC @ =gUnknown_02024A60
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
	ldr r1, _08139710 @ =gUnknown_02024A6A
	ldr r0, _08139714 @ =gUnknown_02024A60
	ldrb r0, [r0]
	lsls r0, 1
	adds r0, r1
	ldrh r1, [r0]
	movs r0, 0x64
	muls r0, r1
	ldr r1, _08139718 @ =gPlayerParty
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
	ldr r1, _08139744 @ =gUnknown_02023A60
	ldr r0, _08139748 @ =gUnknown_02024A60
	ldrb r0, [r0]
	lsls r0, 9
	adds r1, 0x1
	adds r0, r1
	ldrb r0, [r0]
	bl sub_80E43C0
	ldr r2, _0813974C @ =gUnknown_02024DE8
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
	ldr r6, _08139880 @ =gUnknown_02024BE0
	ldr r7, _08139884 @ =gUnknown_02024A60
	ldrb r0, [r7]
	adds r0, r6
	ldrb r1, [r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	ldr r5, _08139888 @ =gSprites
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
	ldr r1, _0813988C @ =0x0000ffd8
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
	ldr r1, _08139890 @ =sub_8078B34
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
	ldr r1, _08139894 @ =sub_8030E38
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
	ldr r0, _08139898 @ =0x0000d6f8
	bl AllocSpritePalette
	adds r4, r0, 0
	lsls r4, 24
	ldr r0, _0813989C @ =gTrainerBackPicPaletteTable
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
	ldr r0, _081398A0 @ =sub_8139A2C
	movs r1, 0x5
	bl CreateTask
	lsls r0, 24
	lsrs r0, 24
	ldr r4, _081398A4 @ =gTasks
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
	ldr r2, _081398A8 @ =0x02017810
	adds r0, r2
	ldrb r1, [r0]
	movs r0, 0x1
	ands r0, r1
	cmp r0, 0
	beq _08139864
	ldr r0, _081398AC @ =gUnknown_02024E68
	adds r0, r3, r0
	ldrb r1, [r0]
	lsls r0, r1, 2
	adds r0, r1
	lsls r0, 3
	adds r0, r4
	ldr r1, _081398B0 @ =sub_8044CA0
	str r1, [r0]
_08139864:
	adds r2, 0x30
	ldrb r0, [r2, 0x9]
	movs r1, 0x1
	orrs r0, r1
	strb r0, [r2, 0x9]
	ldr r1, _081398B4 @ =gUnknown_03004330
	ldrb r0, [r7]
	lsls r0, 2
	adds r0, r1
	ldr r1, _081398B8 @ =nullsub_91
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
	ldr r1, _08139A00 @ =0x02017800
	adds r0, r1
	movs r1, 0
	strh r1, [r0, 0x2]
	ldr r0, _08139A04 @ =gUnknown_02024A6A
	lsls r2, r6, 1
	adds r2, r0
	ldr r0, _08139A08 @ =gUnknown_02023A60
	lsls r1, r6, 9
	adds r0, 0x1
	adds r1, r0
	ldrb r0, [r1]
	strh r0, [r2]
	ldrh r1, [r2]
	movs r0, 0x64
	muls r0, r1
	ldr r1, _08139A0C @ =gPlayerParty
	adds r0, r1
	movs r1, 0xB
	bl GetMonData
	mov r8, r0
	lsls r0, 16
	lsrs r0, 16
	mov r8, r0
	ldr r0, _08139A10 @ =sub_80312F0
	bl CreateInvisibleSpriteWithCallback
	ldr r1, _08139A14 @ =gUnknown_0300434C
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
	ldr r0, _08139A18 @ =gUnknown_02024E8C
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
	ldr r4, _08139A1C @ =gUnknown_02024BE0
	adds r4, r6, r4
	strb r0, [r4]
	ldr r5, _08139A20 @ =gSprites
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
	ldr r1, _08139A24 @ =gUnknown_02024E84
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
	ldr r1, _08139A28 @ =SpriteCallbackDummy
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
	ldr r1, _08139A4C @ =gTasks
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
	ldr r4, _08139A8C @ =gUnknown_02024A60
	ldrb r5, [r4]
	ldrh r0, [r1, 0x8]
	strb r0, [r4]
	ldr r0, _08139A90 @ =gUnknown_02023A60
	ldrb r1, [r4]
	lsls r2, r1, 9
	adds r0, 0x1
	adds r2, r0
	ldr r0, _08139A94 @ =gUnknown_02024A6A
	lsls r1, 1
	adds r1, r0
	ldrh r0, [r1]
	strb r0, [r2]
	ldrb r0, [r4]
	bl sub_81398BC
	ldr r1, _08139A98 @ =gUnknown_03004330
	ldrb r0, [r4]
	lsls r0, 2
	adds r0, r1
	ldr r1, _08139A9C @ =sub_8137538
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
	ldr r1, _08139AC8 @ =gUnknown_02023A60
	ldr r0, _08139ACC @ =gUnknown_02024A60
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
	ldr r5, _08139B10 @ =gUnknown_02024A60
	ldrb r1, [r5]
	lsls r0, r1, 1
	adds r0, r1
	lsls r0, 2
	ldr r1, _08139B14 @ =0x02017810
	adds r0, r1
	ldrb r1, [r0]
	movs r2, 0x1
	orrs r1, r2
	strb r1, [r0]
	ldrb r0, [r5]
	lsls r4, r0, 9
	ldr r3, _08139B18 @ =gUnknown_02023A64
	adds r1, r4, r3
	subs r2, r3, 0x3
	adds r2, r4, r2
	ldrb r2, [r2]
	subs r3, 0x2
	adds r4, r3
	ldrb r3, [r4]
	bl sub_8044804
	ldr r2, _08139B1C @ =gUnknown_02024E68
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
	ldr r5, _08139B7C @ =gUnknown_02023A60
	ldr r6, _08139B80 @ =gUnknown_02024A60
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
	ldr r0, _08139B98 @ =gUnknown_03004330
	ldrb r1, [r6]
	lsls r1, 2
	adds r1, r0
	ldr r0, _08139B9C @ =sub_8137940
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
	ldr r2, _08139BFC @ =gUnknown_02024D26
	ldr r1, _08139C00 @ =gUnknown_02023A60
	ldr r4, _08139C04 @ =gUnknown_02024A60
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
	ldr r0, _08139C08 @ =gBattleTypeFlags
	ldrh r1, [r0]
	movs r0, 0x6
	ands r0, r1
	cmp r0, 0x2
	bne _08139BF4
	ldr r0, _08139C0C @ =gUnknown_03004330
	ldrb r1, [r4]
	lsls r1, 2
	adds r1, r0
	ldr r0, _08139C10 @ =sub_813746C
	str r0, [r1]
_08139BF4:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08139BFC: .4byte gUnknown_02024D26
_08139C00: .4byte gUnknown_02023A60
_08139C04: .4byte gUnknown_02024A60
_08139C08: .4byte gBattleTypeFlags
_08139C0C: .4byte gUnknown_03004330
_08139C10: .4byte sub_813746C
	thumb_func_end sub_8139BB8

	thumb_func_start nullsub_80
nullsub_80: @ 8139C14
	bx lr
	thumb_func_end nullsub_80

	.align 2, 0 @ Don't pad with nop.
