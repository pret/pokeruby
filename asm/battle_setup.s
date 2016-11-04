	.include "constants/gba_constants.inc"
	.include "constants/species_constants.inc"
	.include "asm/macros.inc"

	.syntax unified

	.text
	
	thumb_func_start sub_80828B8
sub_80828B8: @ 80828B8
	push {r4,r5,lr}
	lsls r1, 16
	lsrs r5, r1, 16
	movs r4, 0
	adds r2, r0, 0
_080828C2:
	movs r1, 0
	ldrh r0, [r2]
	cmp r0, 0
	beq _080828E8
	movs r3, 0
_080828CC:
	adds r0, r2, r3
	ldrh r0, [r0]
	cmp r0, r5
	bne _080828D8
	adds r0, r4, 0
	b _080828F4
_080828D8:
	adds r3, 0x2
	adds r1, 0x1
	cmp r1, 0x4
	bgt _080828E8
	adds r0, r2, r3
	ldrh r0, [r0]
	cmp r0, 0
	bne _080828CC
_080828E8:
	adds r2, 0x10
	adds r4, 0x1
	cmp r4, 0x37
	ble _080828C2
	movs r0, 0x1
	negs r0, r0
_080828F4:
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end sub_80828B8

	thumb_func_start sub_80828FC
sub_80828FC: @ 80828FC
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	sub sp, 0x4
	adds r7, r0, 0
	lsls r1, 16
	lsrs r1, 16
	str r1, [sp]
	lsls r2, 16
	lsrs r2, 16
	mov r10, r2
	movs r4, 0
	movs r5, 0
	ldr r0, _08082968 @ =gSaveBlock1 + 0x97A
	mov r9, r0
_0808291E:
	lsls r0, r5, 4
	adds r2, r0, r7
	ldrh r1, [r2, 0xA]
	adds r6, r0, 0
	adds r0, r5, 0x1
	mov r8, r0
	ldr r0, [sp]
	cmp r1, r0
	bne _08082990
	ldrh r0, [r2, 0xC]
	cmp r0, r10
	bne _08082990
	mov r1, r9
	adds r0, r5, r1
	ldrb r0, [r0]
	cmp r0, 0
	bne _0808298E
	ldrh r0, [r2]
	bl trainer_flag_check
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _08082990
	bl Random
	lsls r0, 16
	lsrs r0, 16
	movs r1, 0x64
	bl __umodsi3
	lsls r0, 16
	lsrs r0, 16
	cmp r0, 0x1E
	bhi _08082990
	movs r4, 0x1
	b _0808296E
	.align 2, 0
_08082968: .4byte gSaveBlock1 + 0x97A
_0808296C:
	adds r4, 0x1
_0808296E:
	cmp r4, 0x4
	bgt _08082988
	adds r0, r6, r7
	lsls r1, r4, 1
	adds r1, r0, r1
	ldrh r0, [r1]
	cmp r0, 0
	beq _08082988
	bl trainer_flag_check
	lsls r0, 24
	cmp r0, 0
	bne _0808296C
_08082988:
	mov r1, r9
	adds r0, r5, r1
	strb r4, [r0]
_0808298E:
	movs r4, 0x1
_08082990:
	mov r5, r8
	cmp r5, 0x37
	ble _0808291E
	adds r0, r4, 0
	add sp, 0x4
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r1}
	bx r1
	thumb_func_end sub_80828FC

	thumb_func_start sub_80829A8
sub_80829A8: @ 80829A8
	push {r4,r5,lr}
	lsls r1, 16
	lsrs r4, r1, 16
	lsls r2, 16
	lsrs r2, 16
	movs r1, 0
	ldr r5, _080829D4 @ =gSaveBlock1 + 0x97A
	adds r3, r0, 0
	adds r3, 0xA
_080829BA:
	ldrh r0, [r3]
	cmp r0, r4
	bne _080829D8
	ldrh r0, [r3, 0x2]
	cmp r0, r2
	bne _080829D8
	adds r0, r1, r5
	ldrb r0, [r0]
	cmp r0, 0
	beq _080829D8
	movs r0, 0x1
	b _080829E2
	.align 2, 0
_080829D4: .4byte gSaveBlock1 + 0x97A
_080829D8:
	adds r3, 0x10
	adds r1, 0x1
	cmp r1, 0x37
	ble _080829BA
	movs r0, 0
_080829E2:
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end sub_80829A8

	thumb_func_start sub_80829E8
sub_80829E8: @ 80829E8
	push {r4,lr}
	lsls r1, 16
	lsrs r4, r1, 16
	lsls r2, 16
	lsrs r2, 16
	movs r1, 0
	adds r3, r0, 0
	adds r3, 0xA
_080829F8:
	ldrh r0, [r3]
	cmp r0, r4
	bne _08082A08
	ldrh r0, [r3, 0x2]
	cmp r0, r2
	bne _08082A08
	movs r0, 0x1
	b _08082A12
_08082A08:
	adds r3, 0x10
	adds r1, 0x1
	cmp r1, 0x37
	ble _080829F8
	movs r0, 0
_08082A12:
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end sub_80829E8

	thumb_func_start sub_8082A18
sub_8082A18: @ 8082A18
	push {lr}
	lsls r1, 16
	lsrs r1, 16
	bl sub_8082894
	adds r1, r0, 0
	movs r0, 0x1
	negs r0, r0
	cmp r1, r0
	beq _08082A4C
	cmp r1, 0x63
	bgt _08082A4C
	ldr r0, _08082A44 @ =gSaveBlock1
	ldr r2, _08082A48 @ =0x0000097a
	adds r0, r2
	adds r0, r1, r0
	ldrb r0, [r0]
	cmp r0, 0
	beq _08082A4C
	movs r0, 0x1
	b _08082A4E
	.align 2, 0
_08082A44: .4byte gSaveBlock1
_08082A48: .4byte 0x0000097a
_08082A4C:
	movs r0, 0
_08082A4E:
	pop {r1}
	bx r1
	thumb_func_end sub_8082A18

	thumb_func_start sub_8082A54
sub_8082A54: @ 8082A54
	push {lr}
	lsls r1, 16
	lsrs r1, 16
	bl sub_80828B8
	adds r1, r0, 0
	movs r0, 0x1
	negs r0, r0
	cmp r1, r0
	beq _08082A88
	cmp r1, 0x63
	bgt _08082A88
	ldr r0, _08082A80 @ =gSaveBlock1
	ldr r2, _08082A84 @ =0x0000097a
	adds r0, r2
	adds r0, r1, r0
	ldrb r0, [r0]
	cmp r0, 0
	beq _08082A88
	movs r0, 0x1
	b _08082A8A
	.align 2, 0
_08082A80: .4byte gSaveBlock1
_08082A84: .4byte 0x0000097a
_08082A88:
	movs r0, 0
_08082A8A:
	pop {r1}
	bx r1
	thumb_func_end sub_8082A54

	thumb_func_start sub_8082A90
sub_8082A90: @ 8082A90
	push {r4-r7,lr}
	adds r4, r0, 0
	lsls r1, 16
	lsrs r1, 16
	bl sub_8082894
	adds r1, r0, 0
	movs r0, 0x1
	negs r0, r0
	cmp r1, r0
	bne _08082AB8
	movs r0, 0
	b _08082ADE
_08082AAA:
	subs r0, r6, 0x1
	lsls r0, 1
	adds r0, r7, r0
	ldrh r0, [r0]
	b _08082ADE
_08082AB4:
	ldrh r0, [r5]
	b _08082ADE
_08082AB8:
	lsls r0, r1, 4
	adds r7, r4, r0
	movs r6, 0x1
	adds r5, r7, 0x2
	adds r4, r5, 0
_08082AC2:
	ldrh r0, [r4]
	cmp r0, 0
	beq _08082AAA
	bl trainer_flag_check
	lsls r0, 24
	cmp r0, 0
	beq _08082AB4
	adds r4, 0x2
	adds r5, 0x2
	adds r6, 0x1
	cmp r6, 0x4
	ble _08082AC2
	ldrh r0, [r7, 0x8]
_08082ADE:
	pop {r4-r7}
	pop {r1}
	bx r1
	thumb_func_end sub_8082A90

	thumb_func_start sub_8082AE4
sub_8082AE4: @ 8082AE4
	push {lr}
	lsls r1, 16
	lsrs r1, 16
	bl sub_80828B8
	adds r1, r0, 0
	movs r0, 0x1
	negs r0, r0
	cmp r1, r0
	beq _08082B04
	ldr r0, _08082B08 @ =gSaveBlock1
	ldr r2, _08082B0C @ =0x0000097a
	adds r0, r2
	adds r0, r1, r0
	movs r1, 0
	strb r1, [r0]
_08082B04:
	pop {r0}
	bx r0
	.align 2, 0
_08082B08: .4byte gSaveBlock1
_08082B0C: .4byte 0x0000097a
	thumb_func_end sub_8082AE4

	thumb_func_start sub_8082B10
sub_8082B10: @ 8082B10
	push {r4,lr}
	adds r4, r0, 0
	lsls r1, 16
	lsrs r1, 16
	bl sub_8082894
	adds r1, r0, 0
	movs r0, 0x1
	negs r0, r0
	cmp r1, r0
	beq _08082B3A
	lsls r0, r1, 4
	adds r0, r4
	ldrh r0, [r0, 0x2]
	bl trainer_flag_check
	lsls r0, 24
	cmp r0, 0
	beq _08082B3A
	movs r0, 0x1
	b _08082B3C
_08082B3A:
	movs r0, 0
_08082B3C:
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end sub_8082B10

	thumb_func_start sub_8082B44
sub_8082B44: @ 8082B44
	push {r4-r6,lr}
	movs r6, 0
	movs r5, 0
	ldr r4, _08082B64 @ =gUnknown_0839B1F0
_08082B4C:
	ldrh r0, [r4]
	bl FlagGet
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _08082B68
	adds r6, 0x1
	cmp r6, 0x4
	ble _08082B68
	movs r0, 0x1
	b _08082B72
	.align 2, 0
_08082B64: .4byte gUnknown_0839B1F0
_08082B68:
	adds r4, 0x2
	adds r5, 0x1
	cmp r5, 0x7
	bls _08082B4C
	movs r0, 0
_08082B72:
	pop {r4-r6}
	pop {r1}
	bx r1
	thumb_func_end sub_8082B44

	thumb_func_start sub_8082B78
sub_8082B78: @ 8082B78
	push {lr}
	bl sub_8082B44
	cmp r0, 0
	beq _08082BA0
	ldr r0, _08082B94 @ =gSaveBlock1
	ldr r2, _08082B98 @ =0x00000978
	adds r1, r0, r2
	ldrh r0, [r1]
	cmp r0, 0xFE
	bls _08082B9C
	movs r0, 0xFF
	b _08082B9E
	.align 2, 0
_08082B94: .4byte gSaveBlock1
_08082B98: .4byte 0x00000978
_08082B9C:
	adds r0, 0x1
_08082B9E:
	strh r0, [r1]
_08082BA0:
	pop {r0}
	bx r0
	thumb_func_end sub_8082B78

	thumb_func_start sub_8082BA4
sub_8082BA4: @ 8082BA4
	push {lr}
	bl sub_8082B44
	cmp r0, 0
	beq _08082BC8
	ldr r0, _08082BC0 @ =gSaveBlock1
	ldr r1, _08082BC4 @ =0x00000978
	adds r0, r1
	ldrh r0, [r0]
	cmp r0, 0xFE
	bls _08082BC8
	movs r0, 0x1
	b _08082BCA
	.align 2, 0
_08082BC0: .4byte gSaveBlock1
_08082BC4: .4byte 0x00000978
_08082BC8:
	movs r0, 0
_08082BCA:
	pop {r1}
	bx r1
	thumb_func_end sub_8082BA4

	thumb_func_start sub_8082BD0
sub_8082BD0: @ 8082BD0
	push {r4,r5,lr}
	lsls r0, 16
	lsrs r5, r0, 16
	lsls r1, 16
	lsrs r4, r1, 16
	bl sub_8082BA4
	cmp r0, 0
	beq _08082BFA
	ldr r0, _08082C00 @ =gTrainerEyeTrainers
	adds r1, r5, 0
	adds r2, r4, 0
	bl sub_80828FC
	cmp r0, 0x1
	bne _08082BFA
	ldr r0, _08082C04 @ =gSaveBlock1
	ldr r1, _08082C08 @ =0x00000978
	adds r0, r1
	movs r1, 0
	strh r1, [r0]
_08082BFA:
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_08082C00: .4byte gTrainerEyeTrainers
_08082C04: .4byte gSaveBlock1
_08082C08: .4byte 0x00000978
	thumb_func_end sub_8082BD0

	thumb_func_start sub_8082C0C
sub_8082C0C: @ 8082C0C
	push {lr}
	adds r3, r0, 0
	adds r2, r1, 0
	lsls r3, 16
	lsrs r3, 16
	lsls r2, 16
	lsrs r2, 16
	ldr r0, _08082C28 @ =gTrainerEyeTrainers
	adds r1, r3, 0
	bl sub_80829A8
	pop {r1}
	bx r1
	.align 2, 0
_08082C28: .4byte gTrainerEyeTrainers
	thumb_func_end sub_8082C0C

	thumb_func_start unref_sub_8082C2C
unref_sub_8082C2C: @ 8082C2C
	push {lr}
	adds r3, r0, 0
	adds r2, r1, 0
	lsls r3, 16
	lsrs r3, 16
	lsls r2, 16
	lsrs r2, 16
	ldr r0, _08082C48 @ =gTrainerEyeTrainers
	adds r1, r3, 0
	bl sub_80829E8
	pop {r1}
	bx r1
	.align 2, 0
_08082C48: .4byte gTrainerEyeTrainers
	thumb_func_end unref_sub_8082C2C

	thumb_func_start sub_8082C4C
sub_8082C4C: @ 8082C4C
	push {lr}
	adds r1, r0, 0
	lsls r1, 16
	lsrs r1, 16
	ldr r0, _08082C64 @ =gTrainerEyeTrainers
	bl sub_8082A90
	lsls r0, 16
	lsrs r0, 16
	pop {r1}
	bx r1
	.align 2, 0
_08082C64: .4byte gTrainerEyeTrainers
	thumb_func_end sub_8082C4C

	thumb_func_start sub_8082C68
sub_8082C68: @ 8082C68
	push {r4,r5,lr}
	ldr r5, _08082C8C @ =gTrainerEyeTrainers
	ldr r4, _08082C90 @ =gTrainerBattleOpponent
	ldrh r1, [r4]
	adds r0, r5, 0
	bl sub_8082A18
	lsls r0, 24
	cmp r0, 0
	bne _08082C94
	ldrh r1, [r4]
	adds r0, r5, 0
	bl sub_8082B10
	lsls r0, 24
	lsrs r0, 24
	b _08082C96
	.align 2, 0
_08082C8C: .4byte gTrainerEyeTrainers
_08082C90: .4byte gTrainerBattleOpponent
_08082C94:
	movs r0, 0x1
_08082C96:
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end sub_8082C68

	thumb_func_start sub_8082C9C
sub_8082C9C: @ 8082C9C
	push {lr}
	ldr r0, _08082CB0 @ =gTrainerEyeTrainers
	ldr r1, _08082CB4 @ =gTrainerBattleOpponent
	ldrh r1, [r1]
	bl sub_8082A54
	lsls r0, 24
	lsrs r0, 24
	pop {r1}
	bx r1
	.align 2, 0
_08082CB0: .4byte gTrainerEyeTrainers
_08082CB4: .4byte gTrainerBattleOpponent
	thumb_func_end sub_8082C9C

	thumb_func_start sub_8082CB8
sub_8082CB8: @ 8082CB8
	push {lr}
	ldr r0, _08082CCC @ =gTrainerEyeTrainers
	ldr r1, _08082CD0 @ =gTrainerBattleOpponent
	ldrh r1, [r1]
	bl sub_8082AE4
	bl sub_808257C
	pop {r0}
	bx r0
	.align 2, 0
_08082CCC: .4byte gTrainerEyeTrainers
_08082CD0: .4byte gTrainerBattleOpponent
	thumb_func_end sub_8082CB8

	.align 2, 0 @ Don't pad with nop.
