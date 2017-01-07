	.include "constants/gba_constants.inc"
	.include "constants/species_constants.inc"
	.include "asm/macros.inc"

	.syntax unified

	.text

	thumb_func_start sub_8041324
sub_8041324: @ 8041324
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	mov r9, r0
	mov r10, r1
	movs r7, 0
	movs r5, 0
	mov r6, r10
	adds r6, 0x74
	movs r0, 0x1
	mov r8, r0
_0804133E:
	lsls r0, r5, 2
	adds r0, r5
	lsls r0, 4
	mov r1, r9
	adds r4, r1, r0
	adds r0, r4, 0
	movs r1, 0xB
	bl GetBoxMonData
	cmp r0, 0
	beq _0804136E
	adds r0, r7, 0x1
	lsls r0, 24
	lsrs r7, r0, 24
	adds r0, r4, 0
	movs r1, 0xC
	bl GetBoxMonData
	adds r1, r0, 0
	cmp r1, 0
	bne _0804136E
	lsls r0, r5, 1
	adds r0, r6, r0
	b _08041374
_0804136E:
	lsls r0, r5, 1
	adds r0, r6, r0
	mov r1, r8
_08041374:
	strh r1, [r0]
	adds r0, r5, 0x1
	lsls r0, 24
	lsrs r5, r0, 24
	cmp r5, 0x1
	bls _0804133E
	mov r0, r10
	str r7, [r0, 0x70]
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	thumb_func_end sub_8041324

	thumb_func_start daycare_empty_slot
daycare_empty_slot: @ 8041394
	push {r4,r5,lr}
	adds r5, r0, 0
	movs r4, 0
_0804139A:
	lsls r0, r4, 2
	adds r0, r4
	lsls r0, 4
	adds r0, r5, r0
	movs r1, 0xB
	bl GetBoxMonData
	cmp r0, 0
	bne _080413B2
	lsls r0, r4, 24
	asrs r0, 24
	b _080413C0
_080413B2:
	adds r0, r4, 0x1
	lsls r0, 24
	lsrs r4, r0, 24
	cmp r4, 0x1
	bls _0804139A
	movs r0, 0x1
	negs r0, r0
_080413C0:
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end daycare_empty_slot

	thumb_func_start sub_80413C8
sub_80413C8: @ 80413C8
	push {r4-r7,lr}
	mov r7, r9
	mov r6, r8
	push {r6,r7}
	adds r7, r0, 0
	mov r8, r1
	mov r0, r8
	bl daycare_empty_slot
	lsls r0, 24
	lsrs r4, r0, 24
	mov r9, r4
	adds r0, r7, 0
	bl sub_80A2B94
	lsls r0, 24
	cmp r0, 0
	beq _0804144A
	lsls r0, r4, 24
	asrs r0, 24
	lsls r4, r0, 3
	subs r4, r0
	lsls r4, 3
	adds r5, r4, 0
	adds r5, 0xA0
	add r5, r8
	adds r6, r5, 0
	adds r6, 0x24
	ldr r1, _08041490 @ =gSaveBlock2
	adds r0, r6, 0
	bl StringCopy
	adds r0, r6, 0
	movs r1, 0xFC
	bl PadNameString
	adds r6, 0x8
	adds r0, r7, 0
	adds r1, r6, 0
	bl pokemon_get_nick
	adds r0, r7, 0
	movs r1, 0x40
	bl GetMonData
	lsls r0, 24
	lsrs r0, 24
	add r4, r8
	ldr r2, _08041494 @ =gSaveBlock1
	lsls r1, r0, 3
	adds r1, r0
	lsls r1, 2
	adds r1, r2
	adds r4, 0xA0
	ldr r0, _08041498 @ =0x00002b4c
	adds r1, r0
	ldm r1!, {r0,r2,r3}
	stm r4!, {r0,r2,r3}
	ldm r1!, {r0,r2,r3}
	stm r4!, {r0,r2,r3}
	ldm r1!, {r0,r2,r3}
	stm r4!, {r0,r2,r3}
	adds r0, r7, 0
	bl sub_80A2DF8
_0804144A:
	mov r2, r9
	lsls r4, r2, 24
	asrs r4, 24
	lsls r5, r4, 2
	adds r4, r5, r4
	lsls r4, 4
	add r4, r8
	adds r0, r4, 0
	adds r1, r7, 0
	movs r2, 0x50
	bl memcpy
	adds r0, r4, 0
	bl pokemon_restore_pp
	movs r0, 0x88
	lsls r0, 1
	add r0, r8
	adds r0, r5
	movs r1, 0
	str r1, [r0]
	adds r0, r7, 0
	bl ZeroMonData
	bl party_compaction
	bl CalculatePlayerPartyCount
	pop {r3,r4}
	mov r8, r3
	mov r9, r4
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_08041490: .4byte gSaveBlock2
_08041494: .4byte gSaveBlock1
_08041498: .4byte 0x00002b4c
	thumb_func_end sub_80413C8

	thumb_func_start daycare_send
daycare_send: @ 804149C
	push {lr}
	ldr r0, _080414B4 @ =gUnknown_03005CE0
	ldrb r1, [r0]
	movs r0, 0x64
	muls r0, r1
	ldr r1, _080414B8 @ =gPlayerParty
	adds r0, r1
	ldr r1, _080414BC @ =gSaveBlock1 + 0x2F9C
	bl sub_80413C8
	pop {r0}
	bx r0
	.align 2, 0
_080414B4: .4byte gUnknown_03005CE0
_080414B8: .4byte gPlayerParty
_080414BC: .4byte gSaveBlock1 + 0x2F9C
	thumb_func_end daycare_send

	thumb_func_start sub_80414C0
sub_80414C0: @ 80414C0
	push {r4-r6,lr}
	adds r5, r0, 0
	adds r4, r5, 0
	adds r4, 0x50
	adds r0, r4, 0
	movs r1, 0xB
	bl GetBoxMonData
	cmp r0, 0
	beq _08041516
	adds r0, r5, 0
	movs r1, 0xB
	bl GetBoxMonData
	adds r6, r0, 0
	cmp r6, 0
	bne _08041516
	adds r0, r5, 0
	adds r1, r4, 0
	movs r2, 0x50
	bl memcpy
	adds r0, r4, 0
	bl ZeroBoxMonData
	adds r0, r5, 0
	adds r0, 0xA0
	adds r4, 0x88
	adds r1, r4, 0
	movs r2, 0x38
	bl memcpy
	movs r0, 0x88
	lsls r0, 1
	adds r2, r5, r0
	adds r0, 0x4
	adds r1, r5, r0
	ldr r0, [r1]
	str r0, [r2]
	str r6, [r1]
	adds r0, r4, 0
	bl sub_80417F4
_08041516:
	pop {r4-r6}
	pop {r0}
	bx r0
	thumb_func_end sub_80414C0

	thumb_func_start sub_804151C
sub_804151C: @ 804151C
	push {r4-r7,lr}
	adds r4, r0, 0
	movs r5, 0
	ldr r7, _08041538 @ =0x0000ffff
_08041524:
	adds r0, r4, 0
	bl TryIncrementMonLevel
	lsls r0, 24
	cmp r0, 0
	beq _08041560
	movs r6, 0x1
	adds r5, 0x1
	b _0804154C
	.align 2, 0
_08041538: .4byte 0x0000ffff
_0804153C:
	movs r6, 0
	cmp r0, r7
	bne _0804154C
	ldr r0, _0804156C @ =word_2024E82
	ldrh r1, [r0]
	adds r0, r4, 0
	bl DeleteFirstMoveAndGiveMoveToMon
_0804154C:
	adds r0, r4, 0
	adds r1, r6, 0
	bl sub_803B7C8
	lsls r0, 16
	lsrs r0, 16
	cmp r0, 0
	bne _0804153C
	cmp r5, 0x63
	ble _08041524
_08041560:
	adds r0, r4, 0
	bl CalculateMonStats
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_0804156C: .4byte word_2024E82
	thumb_func_end sub_804151C

	thumb_func_start sub_8041570
sub_8041570: @ 8041570
	push {r4-r7,lr}
	mov r7, r9
	mov r6, r8
	push {r6,r7}
	sub sp, 0x68
	adds r5, r0, 0
	lsls r1, 24
	lsrs r4, r1, 24
	lsls r7, r4, 2
	adds r0, r7, r4
	lsls r0, 4
	adds r6, r5, r0
	ldr r1, _08041640 @ =gStringVar1
	adds r0, r6, 0
	bl pokemon_get_nick_
	adds r0, r6, 0
	movs r1, 0xB
	bl GetBoxMonData
	lsls r0, 16
	lsrs r0, 16
	mov r9, r0
	adds r0, r6, 0
	mov r1, sp
	bl sub_803B4B4
	mov r0, sp
	movs r1, 0x38
	bl GetMonData
	cmp r0, 0x64
	beq _080415D8
	mov r0, sp
	movs r1, 0x19
	bl GetMonData
	movs r2, 0x88
	lsls r2, 1
	adds r1, r5, r2
	adds r1, r7
	ldr r1, [r1]
	adds r0, r1
	str r0, [sp, 0x64]
	add r2, sp, 0x64
	mov r0, sp
	movs r1, 0x19
	bl SetMonData
	mov r0, sp
	bl sub_804151C
_080415D8:
	ldr r0, _08041644 @ =gPlayerParty
	movs r1, 0xFA
	lsls r1, 1
	adds r1, r0
	mov r8, r1
	mov r0, r8
	mov r1, sp
	movs r2, 0x64
	bl memcpy
	lsls r0, r4, 3
	subs r0, r4
	lsls r1, r0, 3
	adds r0, r5, r1
	adds r0, 0xC0
	ldrh r0, [r0]
	cmp r0, 0
	beq _08041610
	adds r4, r1, 0
	adds r4, 0xA0
	adds r4, r5, r4
	mov r0, r8
	adds r1, r4, 0
	bl sub_80A2D88
	adds r0, r4, 0
	bl sub_80417F4
_08041610:
	bl party_compaction
	adds r0, r6, 0
	bl ZeroBoxMonData
	movs r2, 0x88
	lsls r2, 1
	adds r0, r5, r2
	adds r0, r7
	movs r1, 0
	str r1, [r0]
	adds r0, r5, 0
	bl sub_80414C0
	bl CalculatePlayerPartyCount
	mov r0, r9
	add sp, 0x68
	pop {r3,r4}
	mov r8, r3
	mov r9, r4
	pop {r4-r7}
	pop {r1}
	bx r1
	.align 2, 0
_08041640: .4byte gStringVar1
_08041644: .4byte gPlayerParty
	thumb_func_end sub_8041570

	thumb_func_start sub_8041648
sub_8041648: @ 8041648
	push {lr}
	ldr r0, _0804165C @ =gSaveBlock1 + 0x2F9C
	ldr r1, _08041660 @ =gSpecialVar_0x8004
	ldrb r1, [r1]
	bl sub_8041570
	lsls r0, 16
	lsrs r0, 16
	pop {r1}
	bx r1
	.align 2, 0
_0804165C: .4byte gSaveBlock1 + 0x2F9C
_08041660: .4byte gSpecialVar_0x8004
	thumb_func_end sub_8041648

	thumb_func_start sub_8041664
sub_8041664: @ 8041664
	push {r4,r5,lr}
	sub sp, 0x54
	adds r4, r0, 0
	adds r5, r1, 0
	mov r0, sp
	adds r1, r4, 0
	movs r2, 0x50
	bl memcpy
	adds r0, r4, 0
	movs r1, 0x19
	bl GetBoxMonData
	adds r0, r5
	str r0, [sp, 0x50]
	add r2, sp, 0x50
	mov r0, sp
	movs r1, 0x19
	bl SetBoxMonData
	mov r0, sp
	bl GetLevelFromBoxMonExp
	lsls r0, 24
	lsrs r0, 24
	add sp, 0x54
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end sub_8041664

	thumb_func_start sub_80416A0
sub_80416A0: @ 80416A0
	push {r4-r6,lr}
	mov r6, r8
	push {r6}
	adds r5, r0, 0
	lsls r4, r1, 24
	lsrs r4, 24
	lsls r0, r4, 2
	mov r8, r0
	add r4, r8
	lsls r4, 4
	adds r4, r5, r4
	adds r0, r4, 0
	bl GetLevelFromBoxMonExp
	adds r6, r0, 0
	lsls r6, 24
	lsrs r6, 24
	movs r0, 0x88
	lsls r0, 1
	adds r5, r0
	add r5, r8
	ldr r1, [r5]
	adds r0, r4, 0
	bl sub_8041664
	lsls r0, 24
	lsrs r0, 24
	subs r0, r6
	lsls r0, 24
	lsrs r0, 24
	pop {r3}
	mov r8, r3
	pop {r4-r6}
	pop {r1}
	bx r1
	thumb_func_end sub_80416A0

	thumb_func_start sub_80416E8
sub_80416E8: @ 80416E8
	push {r4-r6,lr}
	adds r6, r0, 0
	lsls r4, r1, 24
	lsrs r4, 24
	adds r1, r4, 0
	bl sub_80416A0
	adds r5, r0, 0
	lsls r5, 24
	lsrs r5, 24
	lsls r0, r4, 2
	adds r0, r4
	lsls r0, 4
	adds r6, r0
	ldr r1, _08041720 @ =gStringVar1
	adds r0, r6, 0
	bl pokemon_get_nick_
	ldr r0, _08041724 @ =gStringVar2
	adds r1, r5, 0
	movs r2, 0
	movs r3, 0x2
	bl ConvertIntToDecimalStringN
	adds r0, r5, 0
	pop {r4-r6}
	pop {r1}
	bx r1
	.align 2, 0
_08041720: .4byte gStringVar1
_08041724: .4byte gStringVar2
	thumb_func_end sub_80416E8

	thumb_func_start sub_8041728
sub_8041728: @ 8041728
	push {r4-r6,lr}
	adds r6, r0, 0
	lsls r4, r1, 24
	lsrs r4, 24
	adds r1, r4, 0
	bl sub_80416A0
	adds r5, r0, 0
	lsls r5, 24
	lsrs r5, 24
	lsls r0, r4, 2
	adds r0, r4
	lsls r0, 4
	adds r6, r0
	ldr r1, _08041768 @ =gStringVar1
	adds r0, r6, 0
	bl pokemon_get_nick_
	movs r0, 0x64
	adds r4, r5, 0
	muls r4, r0
	adds r4, 0x64
	ldr r0, _0804176C @ =gStringVar2
	adds r1, r4, 0
	movs r2, 0
	movs r3, 0x5
	bl ConvertIntToDecimalStringN
	adds r0, r4, 0
	pop {r4-r6}
	pop {r1}
	bx r1
	.align 2, 0
_08041768: .4byte gStringVar1
_0804176C: .4byte gStringVar2
	thumb_func_end sub_8041728

	thumb_func_start sub_8041770
sub_8041770: @ 8041770
	push {lr}
	ldr r0, _08041784 @ =gSaveBlock1 + 0x2F9C
	ldr r1, _08041788 @ =gSpecialVar_0x8004
	ldrb r1, [r1]
	bl sub_8041728
	ldr r1, _0804178C @ =gSpecialVar_0x8005
	strh r0, [r1]
	pop {r0}
	bx r0
	.align 2, 0
_08041784: .4byte gSaveBlock1 + 0x2F9C
_08041788: .4byte gSpecialVar_0x8004
_0804178C: .4byte gSpecialVar_0x8005
	thumb_func_end sub_8041770

	thumb_func_start sub_8041790
sub_8041790: @ 8041790
	lsls r0, 16
	lsrs r0, 16
	ldr r2, _080417AC @ =gSaveBlock1
	ldr r1, _080417B0 @ =0x000030ac
	adds r3, r2, r1
	ldr r1, [r3]
	adds r1, r0
	str r1, [r3]
	ldr r1, _080417B4 @ =0x000030b0
	adds r2, r1
	ldr r1, [r2]
	adds r1, r0
	str r1, [r2]
	bx lr
	.align 2, 0
_080417AC: .4byte gSaveBlock1
_080417B0: .4byte 0x000030ac
_080417B4: .4byte 0x000030b0
	thumb_func_end sub_8041790

	thumb_func_start sub_80417B8
sub_80417B8: @ 80417B8
	push {r4,r5,lr}
	ldr r5, _080417D8 @ =gSpecialVar_0x8004
	ldrh r1, [r5]
	lsls r0, r1, 2
	adds r0, r1
	lsls r0, 4
	ldr r4, _080417DC @ =gSaveBlock1 + 0x2F9C
	adds r0, r4
	movs r1, 0xB
	bl GetBoxMonData
	cmp r0, 0
	bne _080417E0
	movs r0, 0
	b _080417EC
	.align 2, 0
_080417D8: .4byte gSpecialVar_0x8004
_080417DC: .4byte gSaveBlock1 + 0x2F9C
_080417E0:
	ldrb r1, [r5]
	adds r0, r4, 0
	bl sub_80416E8
	lsls r0, 24
	lsrs r0, 24
_080417EC:
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end sub_80417B8

	thumb_func_start sub_80417F4
sub_80417F4: @ 80417F4
	push {lr}
	movs r3, 0
	movs r2, 0x7
	adds r1, r0, 0
	adds r1, 0x2B
_080417FE:
	strb r3, [r1]
	subs r1, 0x1
	subs r2, 0x1
	cmp r2, 0
	bge _080417FE
	adds r2, r0, 0
	adds r2, 0x2C
	movs r3, 0
	adds r1, r0, 0
	adds r1, 0x36
_08041812:
	strb r3, [r1]
	subs r1, 0x1
	cmp r1, r2
	bge _08041812
	bl sub_80A2B40
	pop {r0}
	bx r0
	thumb_func_end sub_80417F4

	thumb_func_start unref_sub_8041824
unref_sub_8041824: @ 8041824
	push {r4-r6,lr}
	adds r6, r0, 0
	movs r5, 0
_0804182A:
	lsls r4, r5, 2
	adds r0, r4, r5
	lsls r0, 4
	adds r0, r6, r0
	bl ZeroBoxMonData
	movs r1, 0x88
	lsls r1, 1
	adds r0, r6, r1
	adds r0, r4
	movs r4, 0
	str r4, [r0]
	lsls r0, r5, 3
	subs r0, r5
	lsls r0, 3
	adds r0, 0xA0
	adds r0, r6, r0
	bl sub_80417F4
	adds r0, r5, 0x1
	lsls r0, 24
	lsrs r5, r0, 24
	cmp r5, 0x1
	bls _0804182A
	movs r2, 0x8C
	lsls r2, 1
	adds r0, r6, r2
	movs r1, 0
	strh r4, [r0]
	adds r2, 0x2
	adds r0, r6, r2
	strb r1, [r0]
	pop {r4-r6}
	pop {r0}
	bx r0
	thumb_func_end unref_sub_8041824

	thumb_func_start sub_8041870
sub_8041870: @ 8041870
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	lsls r0, 16
	lsrs r2, r0, 16
	movs r0, 0
	mov r8, r0
	ldr r0, _0804189C @ =gEvolutionTable
	mov r12, r0
_08041882:
	movs r7, 0
	movs r6, 0x1
	movs r4, 0x80
	lsls r4, 9
	movs r5, 0x28
	mov r3, r12
	adds r3, 0x28
_08041890:
	movs r1, 0
	ldrh r0, [r3, 0x4]
	cmp r0, r2
	bne _080418A0
	lsrs r2, r4, 16
	b _080418CC
	.align 2, 0
_0804189C: .4byte gEvolutionTable
_080418A0:
	adds r1, 0x1
	cmp r1, 0x4
	bgt _080418B6
	lsls r0, r1, 3
	adds r0, r5
	add r0, r12
	ldrh r0, [r0, 0x4]
	cmp r0, r2
	bne _080418A0
	lsrs r2, r4, 16
	movs r7, 0x1
_080418B6:
	cmp r7, 0
	bne _080418CC
	movs r0, 0x80
	lsls r0, 9
	adds r4, r0
	adds r5, 0x28
	adds r3, 0x28
	adds r6, 0x1
	ldr r0, _080418EC @ =0x0000019b
	cmp r6, r0
	ble _08041890
_080418CC:
	movs r0, 0xCE
	lsls r0, 1
	cmp r6, r0
	beq _080418DE
	movs r0, 0x1
	add r8, r0
	mov r0, r8
	cmp r0, 0x4
	ble _08041882
_080418DE:
	adds r0, r2, 0
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r1}
	bx r1
	.align 2, 0
_080418EC: .4byte 0x0000019b
	thumb_func_end sub_8041870

	thumb_func_start sub_80418F0
sub_80418F0: @ 80418F0
	push {r4,lr}
	adds r4, r0, 0
	bl Random
	lsls r0, 16
	lsrs r0, 16
	ldr r1, _08041918 @ =0x0000fffe
	bl __umodsi3
	adds r0, 0x1
	movs r1, 0x8C
	lsls r1, 1
	adds r4, r1
	strh r0, [r4]
	movs r0, 0x86
	bl FlagSet
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08041918: .4byte 0x0000fffe
	thumb_func_end sub_80418F0

	thumb_func_start sub_804191C
sub_804191C: @ 804191C
	push {r4,lr}
	adds r4, r0, 0
	bl Random
	movs r2, 0x80
	lsls r2, 8
	adds r1, r2, 0
	movs r2, 0x8C
	lsls r2, 1
	adds r4, r2
	orrs r1, r0
	strh r1, [r4]
	movs r0, 0x86
	bl FlagSet
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end sub_804191C

	thumb_func_start sub_8041940
sub_8041940: @ 8041940
	push {lr}
	ldr r0, _0804194C @ =gSaveBlock1 + 0x2F9C
	bl sub_80418F0
	pop {r0}
	bx r0
	.align 2, 0
_0804194C: .4byte gSaveBlock1 + 0x2F9C
	thumb_func_end sub_8041940

	thumb_func_start sub_8041950
sub_8041950: @ 8041950
	push {lr}
	ldr r0, _0804195C @ =gSaveBlock1 + 0x2F9C
	bl sub_804191C
	pop {r0}
	bx r0
	.align 2, 0
_0804195C: .4byte gSaveBlock1 + 0x2F9C
	thumb_func_end sub_8041950

	thumb_func_start sub_8041960
sub_8041960: @ 8041960
	push {r4,lr}
	sub sp, 0x8
	adds r4, r0, 0
	lsls r1, 24
	lsrs r1, 24
	adds r1, r4, r1
	movs r0, 0xFF
	strb r0, [r1]
	movs r2, 0
_08041972:
	mov r1, sp
	adds r0, r1, r2
	adds r1, r4, r2
	ldrb r1, [r1]
	strb r1, [r0]
	adds r2, 0x1
	cmp r2, 0x5
	ble _08041972
	movs r3, 0
	movs r2, 0
_08041986:
	mov r1, sp
	adds r0, r1, r2
	ldrb r1, [r0]
	adds r0, r1, 0
	cmp r0, 0xFF
	beq _08041998
	adds r0, r4, r3
	strb r1, [r0]
	adds r3, 0x1
_08041998:
	adds r2, 0x1
	cmp r2, 0x5
	ble _08041986
	add sp, 0x8
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end sub_8041960

	thumb_func_start sub_80419A8
sub_80419A8: @ 80419A8
	push {r4-r7,lr}
	mov r7, r9
	mov r6, r8
	push {r6,r7}
	sub sp, 0x14
	mov r9, r0
	mov r8, r1
	movs r5, 0
	add r1, sp, 0x4
	add r7, sp, 0xC
	adds r2, r1, 0
_080419BE:
	adds r0, r2, r5
	strb r5, [r0]
	adds r0, r5, 0x1
	lsls r0, 24
	lsrs r5, r0, 24
	cmp r5, 0x5
	bls _080419BE
	movs r5, 0
	adds r6, r1, 0
_080419D0:
	bl Random
	mov r1, sp
	adds r4, r1, r5
	lsls r0, 16
	lsrs r0, 16
	movs r1, 0x6
	subs r1, r5
	bl __modsi3
	adds r0, r6, r0
	ldrb r0, [r0]
	strb r0, [r4]
	ldrb r1, [r4]
	adds r0, r6, 0
	bl sub_8041960
	adds r0, r5, 0x1
	lsls r0, 24
	lsrs r5, r0, 24
	cmp r5, 0x2
	bls _080419D0
	movs r5, 0
	movs r4, 0x1
_08041A00:
	bl Random
	adds r1, r7, r5
	lsls r0, 16
	lsrs r0, 16
	ands r0, r4
	strb r0, [r1]
	adds r0, r5, 0x1
	lsls r0, 24
	lsrs r5, r0, 24
	cmp r5, 0x2
	bls _08041A00
	movs r5, 0
_08041A1A:
	mov r1, sp
	adds r0, r1, r5
	ldrb r0, [r0]
	cmp r0, 0x5
	bhi _08041B02
	lsls r0, 2
	ldr r1, _08041A30 @ =_08041A34
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_08041A30: .4byte _08041A34
	.align 2, 0
_08041A34:
	.4byte _08041A4C
	.4byte _08041A6C
	.4byte _08041A88
	.4byte _08041AA4
	.4byte _08041AC0
	.4byte _08041AE2
_08041A4C:
	adds r0, r7, r5
	ldrb r1, [r0]
	lsls r0, r1, 2
	adds r0, r1
	lsls r0, 4
	add r0, r8
	movs r1, 0x27
	bl GetBoxMonData
	add r2, sp, 0x10
	strb r0, [r2]
	mov r0, r9
	movs r1, 0x27
	bl SetMonData
	b _08041B02
_08041A6C:
	add r4, sp, 0x10
	adds r0, r7, r5
	ldrb r1, [r0]
	lsls r0, r1, 2
	adds r0, r1
	lsls r0, 4
	add r0, r8
	movs r1, 0x28
	bl GetBoxMonData
	strb r0, [r4]
	mov r0, r9
	movs r1, 0x28
	b _08041ADA
_08041A88:
	add r4, sp, 0x10
	adds r0, r7, r5
	ldrb r1, [r0]
	lsls r0, r1, 2
	adds r0, r1
	lsls r0, 4
	add r0, r8
	movs r1, 0x29
	bl GetBoxMonData
	strb r0, [r4]
	mov r0, r9
	movs r1, 0x29
	b _08041ADA
_08041AA4:
	add r4, sp, 0x10
	adds r0, r7, r5
	ldrb r1, [r0]
	lsls r0, r1, 2
	adds r0, r1
	lsls r0, 4
	add r0, r8
	movs r1, 0x2A
	bl GetBoxMonData
	strb r0, [r4]
	mov r0, r9
	movs r1, 0x2A
	b _08041ADA
_08041AC0:
	add r4, sp, 0x10
	adds r0, r7, r5
	ldrb r1, [r0]
	lsls r0, r1, 2
	adds r0, r1
	lsls r0, 4
	add r0, r8
	movs r1, 0x2B
	bl GetBoxMonData
	strb r0, [r4]
	mov r0, r9
	movs r1, 0x2B
_08041ADA:
	adds r2, r4, 0
	bl SetMonData
	b _08041B02
_08041AE2:
	add r4, sp, 0x10
	adds r0, r7, r5
	ldrb r1, [r0]
	lsls r0, r1, 2
	adds r0, r1
	lsls r0, 4
	add r0, r8
	movs r1, 0x2C
	bl GetBoxMonData
	strb r0, [r4]
	mov r0, r9
	movs r1, 0x2C
	adds r2, r4, 0
	bl SetMonData
_08041B02:
	adds r0, r5, 0x1
	lsls r0, 24
	lsrs r5, r0, 24
	cmp r5, 0x2
	bls _08041A1A
	add sp, 0x14
	pop {r3,r4}
	mov r8, r3
	mov r9, r4
	pop {r4-r7}
	pop {r0}
	bx r0
	thumb_func_end sub_80419A8

	thumb_func_start pokemon_get_eggmoves
pokemon_get_eggmoves: @ 8041B1C
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	mov r8, r1
	movs r6, 0
	movs r4, 0
	movs r1, 0xB
	bl GetMonData
	lsls r0, 16
	lsrs r3, r0, 16
	movs r2, 0
	ldr r5, _08041B44 @ =gEggMoves
	ldrh r1, [r5]
	ldr r7, _08041B48 @ =0x00004e20
	adds r0, r3, r7
	cmp r1, r0
	bne _08041B4C
	movs r4, 0x1
	b _08041B6E
	.align 2, 0
_08041B44: .4byte gEggMoves
_08041B48: .4byte 0x00004e20
_08041B4C:
	adds r0, r2, 0x1
	lsls r0, 16
	lsrs r2, r0, 16
	ldr r0, _08041BB8 @ =0x00000471
	ldr r5, _08041BBC @ =gEggMoves
	cmp r2, r0
	bhi _08041B6E
	lsls r0, r2, 1
	adds r0, r5
	ldrh r1, [r0]
	ldr r7, _08041BC0 @ =0x00004e20
	adds r0, r3, r7
	cmp r1, r0
	bne _08041B4C
	adds r0, r2, 0x1
	lsls r0, 16
	lsrs r4, r0, 16
_08041B6E:
	movs r2, 0
	lsls r0, r4, 1
	adds r0, r5
	ldrh r0, [r0]
	ldr r1, _08041BC0 @ =0x00004e20
	cmp r0, r1
	bhi _08041BAA
	adds r7, r5, 0
	adds r3, r1, 0
_08041B80:
	lsls r1, r2, 1
	add r1, r8
	adds r0, r4, r2
	lsls r0, 1
	adds r0, r7
	ldrh r0, [r0]
	strh r0, [r1]
	adds r0, r6, 0x1
	lsls r0, 16
	lsrs r6, r0, 16
	adds r0, r2, 0x1
	lsls r0, 16
	lsrs r2, r0, 16
	cmp r2, 0x9
	bhi _08041BAA
	adds r0, r4, r2
	lsls r0, 1
	adds r0, r5
	ldrh r0, [r0]
	cmp r0, r3
	bls _08041B80
_08041BAA:
	lsls r0, r6, 24
	lsrs r0, 24
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r1}
	bx r1
	.align 2, 0
_08041BB8: .4byte 0x00000471
_08041BBC: .4byte gEggMoves
_08041BC0: .4byte 0x00004e20
	thumb_func_end pokemon_get_eggmoves

	thumb_func_start daycare_build_child_moveset
daycare_build_child_moveset: @ 8041BC4
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	sub sp, 0xC
	adds r7, r0, 0
	mov r10, r1
	mov r9, r2
	movs r0, 0
	str r0, [sp]
	movs r6, 0
	ldr r5, _08041CC8 @ =gUnknown_03000500
	movs r2, 0
	ldr r4, _08041CCC @ =gUnknown_030004D8
	ldr r3, _08041CD0 @ =gUnknown_030004E0
_08041BE4:
	lsls r1, r6, 1
	adds r0, r1, r5
	strh r2, [r0]
	adds r0, r1, r4
	strh r2, [r0]
	adds r1, r3
	strh r2, [r1]
	adds r0, r6, 0x1
	lsls r0, 16
	lsrs r6, r0, 16
	cmp r6, 0x3
	bls _08041BE4
	movs r6, 0
	ldr r2, _08041CD4 @ =gUnknown_030004E8
	movs r1, 0
_08041C02:
	lsls r0, r6, 1
	adds r0, r2
	strh r1, [r0]
	adds r0, r6, 0x1
	lsls r0, 16
	lsrs r6, r0, 16
	cmp r6, 0x9
	bls _08041C02
	movs r6, 0
	ldr r2, _08041CD8 @ =gUnknown_03000470
	movs r1, 0
_08041C18:
	lsls r0, r6, 1
	adds r0, r2
	strh r1, [r0]
	adds r0, r6, 0x1
	lsls r0, 16
	lsrs r6, r0, 16
	cmp r6, 0x31
	bls _08041C18
	adds r0, r7, 0
	movs r1, 0xB
	bl GetMonData
	lsls r0, 16
	lsrs r0, 16
	ldr r1, _08041CD8 @ =gUnknown_03000470
	bl sub_804051C
	lsls r0, 24
	lsrs r0, 24
	str r0, [sp, 0x4]
	movs r6, 0
	ldr r1, _08041CCC @ =gUnknown_030004D8
	mov r8, r1
_08041C46:
	adds r5, r6, 0
	adds r5, 0xD
	mov r0, r10
	adds r1, r5, 0
	bl GetBoxMonData
	lsls r4, r6, 1
	mov r2, r8
	adds r1, r4, r2
	strh r0, [r1]
	mov r0, r9
	adds r1, r5, 0
	bl GetBoxMonData
	ldr r1, _08041CC8 @ =gUnknown_03000500
	adds r4, r1
	strh r0, [r4]
	adds r0, r6, 0x1
	lsls r0, 16
	lsrs r6, r0, 16
	cmp r6, 0x3
	bls _08041C46
	ldr r1, _08041CD4 @ =gUnknown_030004E8
	adds r0, r7, 0
	bl pokemon_get_eggmoves
	lsls r0, 24
	lsrs r0, 24
	mov r8, r0
	movs r6, 0
_08041C82:
	ldr r0, _08041CCC @ =gUnknown_030004D8
	lsls r1, r6, 1
	adds r2, r1, r0
	ldrh r1, [r2]
	mov r9, r0
	cmp r1, 0
	beq _08041CF8
	movs r5, 0
	cmp r5, r8
	bcs _08041CEA
	adds r4, r2, 0
	ldr r2, _08041CDC @ =0x0000ffff
_08041C9A:
	ldr r0, _08041CD4 @ =gUnknown_030004E8
	lsls r1, r5, 1
	adds r1, r0
	ldrh r0, [r4]
	ldrh r1, [r1]
	cmp r0, r1
	bne _08041CE0
	adds r1, r0, 0
	adds r0, r7, 0
	str r2, [sp, 0x8]
	bl GiveMoveToMon
	lsls r0, 16
	lsrs r0, 16
	ldr r2, [sp, 0x8]
	cmp r0, r2
	bne _08041CEA
	ldrh r1, [r4]
	adds r0, r7, 0
	bl DeleteFirstMoveAndGiveMoveToMon
	b _08041CEA
	.align 2, 0
_08041CC8: .4byte gUnknown_03000500
_08041CCC: .4byte gUnknown_030004D8
_08041CD0: .4byte gUnknown_030004E0
_08041CD4: .4byte gUnknown_030004E8
_08041CD8: .4byte gUnknown_03000470
_08041CDC: .4byte 0x0000ffff
_08041CE0:
	adds r0, r5, 0x1
	lsls r0, 16
	lsrs r5, r0, 16
	cmp r5, r8
	bcc _08041C9A
_08041CEA:
	adds r0, r6, 0x1
	lsls r0, 16
	lsrs r6, r0, 16
	ldr r3, _08041E14 @ =gUnknown_030004D8
	mov r9, r3
	cmp r6, 0x3
	bls _08041C82
_08041CF8:
	movs r6, 0
_08041CFA:
	lsls r0, r6, 1
	mov r2, r9
	adds r1, r0, r2
	ldrh r1, [r1]
	adds r2, r0, 0
	adds r6, 0x1
	mov r8, r6
	cmp r1, 0
	beq _08041D5C
	movs r5, 0
	ldr r0, _08041E14 @ =gUnknown_030004D8
	adds r4, r2, r0
	ldr r6, _08041E18 @ =0x0000ffff
	mov r9, r0
_08041D16:
	ldr r3, _08041E1C @ =0x00000121
	adds r0, r5, r3
	lsls r0, 16
	lsrs r0, 16
	bl ItemIdToBattleMoveId
	ldrh r1, [r4]
	lsls r0, 16
	lsrs r0, 16
	cmp r1, r0
	bne _08041D52
	lsls r1, r5, 24
	lsrs r1, 24
	adds r0, r7, 0
	bl CanMonLearnTMHM
	cmp r0, 0
	beq _08041D52
	ldrh r1, [r4]
	adds r0, r7, 0
	bl GiveMoveToMon
	lsls r0, 16
	lsrs r0, 16
	cmp r0, r6
	bne _08041D52
	ldrh r1, [r4]
	adds r0, r7, 0
	bl DeleteFirstMoveAndGiveMoveToMon
_08041D52:
	adds r0, r5, 0x1
	lsls r0, 16
	lsrs r5, r0, 16
	cmp r5, 0x39
	bls _08041D16
_08041D5C:
	mov r1, r8
	lsls r0, r1, 16
	lsrs r6, r0, 16
	cmp r6, 0x3
	bls _08041CFA
	movs r6, 0
	mov r2, r9
	ldrh r0, [r2]
	ldr r3, _08041E20 @ =gUnknown_030004E0
	mov r10, r3
	cmp r0, 0
	beq _08041DC6
	mov r4, r9
	ldr r0, _08041E24 @ =gUnknown_03000500
	mov r9, r0
	mov r12, r10
_08041D7C:
	movs r5, 0
	lsls r2, r6, 1
	adds r6, 0x1
	mov r8, r6
	adds r3, r2, r4
_08041D86:
	lsls r0, r5, 1
	add r0, r9
	ldrh r2, [r3]
	adds r1, r2, 0
	ldrh r0, [r0]
	cmp r1, r0
	bne _08041DA8
	cmp r1, 0
	beq _08041DA8
	ldr r1, [sp]
	adds r0, r1, 0x1
	lsls r0, 16
	lsrs r0, 16
	str r0, [sp]
	lsls r1, 1
	add r1, r12
	strh r2, [r1]
_08041DA8:
	adds r0, r5, 0x1
	lsls r0, 16
	lsrs r5, r0, 16
	cmp r5, 0x3
	bls _08041D86
	mov r1, r8
	lsls r0, r1, 16
	lsrs r6, r0, 16
	cmp r6, 0x3
	bhi _08041DC6
	lsls r0, r6, 1
	adds r0, r4
	ldrh r0, [r0]
	cmp r0, 0
	bne _08041D7C
_08041DC6:
	movs r6, 0
	mov r2, r10
	ldrh r0, [r2]
	cmp r0, 0
	beq _08041E50
_08041DD0:
	movs r5, 0
	adds r3, r6, 0x1
	mov r8, r3
	ldr r0, [sp, 0x4]
	cmp r5, r0
	bcs _08041E38
	ldr r2, _08041E18 @ =0x0000ffff
_08041DDE:
	ldr r1, _08041E28 @ =gUnknown_03000470
	lsls r0, r5, 1
	adds r0, r1
	ldrh r1, [r0]
	cmp r1, 0
	beq _08041E2C
	lsls r0, r6, 1
	mov r3, r10
	adds r4, r0, r3
	ldrh r0, [r4]
	cmp r0, r1
	bne _08041E2C
	adds r1, r0, 0
	adds r0, r7, 0
	str r2, [sp, 0x8]
	bl GiveMoveToMon
	lsls r0, 16
	lsrs r0, 16
	ldr r2, [sp, 0x8]
	cmp r0, r2
	bne _08041E38
	ldrh r1, [r4]
	adds r0, r7, 0
	bl DeleteFirstMoveAndGiveMoveToMon
	b _08041E38
	.align 2, 0
_08041E14: .4byte gUnknown_030004D8
_08041E18: .4byte 0x0000ffff
_08041E1C: .4byte 0x00000121
_08041E20: .4byte gUnknown_030004E0
_08041E24: .4byte gUnknown_03000500
_08041E28: .4byte gUnknown_03000470
_08041E2C:
	adds r0, r5, 0x1
	lsls r0, 16
	lsrs r5, r0, 16
	ldr r0, [sp, 0x4]
	cmp r5, r0
	bcc _08041DDE
_08041E38:
	mov r1, r8
	lsls r0, r1, 16
	lsrs r6, r0, 16
	cmp r6, 0x3
	bhi _08041E50
	ldr r0, _08041E60 @ =gUnknown_030004E0
	lsls r1, r6, 1
	adds r1, r0
	ldrh r1, [r1]
	mov r10, r0
	cmp r1, 0
	bne _08041DD0
_08041E50:
	add sp, 0xC
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_08041E60: .4byte gUnknown_030004E0
	thumb_func_end daycare_build_child_moveset

	thumb_func_start sub_8041E64
sub_8041E64: @ 8041E64
	adds r3, r0, 0
	movs r1, 0x8C
	lsls r1, 1
	adds r0, r3, r1
	movs r2, 0
	movs r1, 0
	strh r1, [r0]
	movs r1, 0x8D
	lsls r1, 1
	adds r0, r3, r1
	strb r2, [r0]
	bx lr
	thumb_func_end sub_8041E64

	thumb_func_start sub_8041E7C
sub_8041E7C: @ 8041E7C
	push {lr}
	ldr r0, _08041E88 @ =gSaveBlock1 + 0x2F9C
	bl sub_8041E64
	pop {r0}
	bx r0
	.align 2, 0
_08041E88: .4byte gSaveBlock1 + 0x2F9C
	thumb_func_end sub_8041E7C

	thumb_func_start incense_effects
incense_effects: @ 8041E8C
	push {r4-r7,lr}
	adds r4, r0, 0
	adds r5, r1, 0
	ldrh r1, [r4]
	movs r7, 0xB4
	lsls r7, 1
	cmp r1, r7
	beq _08041EA4
	movs r0, 0xAF
	lsls r0, 1
	cmp r1, r0
	bne _08041EE6
_08041EA4:
	adds r0, r5, 0
	movs r1, 0xC
	bl GetBoxMonData
	lsls r0, 16
	lsrs r6, r0, 16
	adds r0, r5, 0
	adds r0, 0x50
	movs r1, 0xC
	bl GetBoxMonData
	lsls r0, 16
	lsrs r2, r0, 16
	ldrh r0, [r4]
	cmp r0, r7
	bne _08041ED0
	cmp r6, 0xDD
	beq _08041ED0
	cmp r2, 0xDD
	beq _08041ED0
	movs r0, 0xCA
	strh r0, [r4]
_08041ED0:
	ldrh r1, [r4]
	movs r0, 0xAF
	lsls r0, 1
	cmp r1, r0
	bne _08041EE6
	cmp r6, 0xDC
	beq _08041EE6
	cmp r2, 0xDC
	beq _08041EE6
	movs r0, 0xB7
	strh r0, [r4]
_08041EE6:
	pop {r4-r7}
	pop {r0}
	bx r0
	thumb_func_end incense_effects

	thumb_func_start sub_8041EEC
sub_8041EEC: @ 8041EEC
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	sub sp, 0x4
	mov r8, r0
	adds r6, r1, 0
	movs r4, 0
	movs r7, 0x1
_08041EFC:
	lsls r0, r4, 2
	adds r0, r4
	lsls r0, 4
	mov r1, r8
	adds r5, r1, r0
	adds r0, r5, 0
	movs r1, 0xB
	bl GetBoxMonData
	lsls r1, r4, 1
	add r1, sp
	strh r0, [r1]
	lsls r0, 16
	lsrs r0, 16
	cmp r0, 0x84
	bne _08041F26
	adds r0, r4, 0
	eors r0, r7
	strb r0, [r6]
	strb r4, [r6, 0x1]
	b _08041F3C
_08041F26:
	adds r0, r5, 0
	bl GetBoxMonGender
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0xFE
	bne _08041F3C
	strb r4, [r6]
	adds r0, r4, 0
	eors r0, r7
	strb r0, [r6, 0x1]
_08041F3C:
	adds r0, r4, 0x1
	lsls r0, 16
	lsrs r4, r0, 16
	cmp r4, 0x1
	bls _08041EFC
	ldrb r0, [r6]
	lsls r0, 1
	add r0, sp
	ldrh r0, [r0]
	bl sub_8041870
	lsls r0, 16
	lsrs r4, r0, 16
	cmp r4, 0x1D
	bne _08041F6E
	movs r0, 0x8C
	lsls r0, 1
	add r0, r8
	ldrh r1, [r0]
	movs r0, 0x80
	lsls r0, 8
	ands r0, r1
	cmp r0, 0
	beq _08041F6E
	movs r4, 0x20
_08041F6E:
	ldr r0, _08041FC0 @ =0x00000183
	cmp r4, r0
	bne _08041F88
	subs r0, 0x6B
	add r0, r8
	ldrh r1, [r0]
	movs r0, 0x80
	lsls r0, 8
	ands r0, r1
	cmp r0, 0
	beq _08041F88
	movs r4, 0xC1
	lsls r4, 1
_08041F88:
	ldrb r0, [r6, 0x1]
	lsls r0, 1
	add r0, sp
	ldrh r0, [r0]
	cmp r0, 0x84
	bne _08041FB2
	ldrb r1, [r6]
	lsls r0, r1, 2
	adds r0, r1
	lsls r0, 4
	add r0, r8
	bl GetBoxMonGender
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0xFE
	beq _08041FB2
	ldrb r1, [r6, 0x1]
	ldrb r0, [r6]
	strb r0, [r6, 0x1]
	strb r1, [r6]
_08041FB2:
	adds r0, r4, 0
	add sp, 0x4
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r1}
	bx r1
	.align 2, 0
_08041FC0: .4byte 0x00000183
	thumb_func_end sub_8041EEC

	thumb_func_start sub_8041FC4
sub_8041FC4: @ 8041FC4
	push {r4-r6,lr}
	sub sp, 0x6C
	adds r5, r0, 0
	add r6, sp, 0x64
	adds r1, r6, 0
	bl sub_8041EEC
	add r4, sp, 0x68
	strh r0, [r4]
	adds r0, r4, 0
	adds r1, r5, 0
	bl incense_effects
	ldrh r1, [r4]
	mov r0, sp
	adds r2, r5, 0
	bl sub_80420FC
	mov r0, sp
	adds r1, r5, 0
	bl sub_80419A8
	ldrb r0, [r6, 0x1]
	lsls r1, r0, 2
	adds r1, r0
	lsls r1, 4
	adds r1, r5, r1
	ldrb r0, [r6]
	lsls r2, r0, 2
	adds r2, r0
	lsls r2, 4
	adds r2, r5, r2
	mov r0, sp
	bl daycare_build_child_moveset
	mov r2, sp
	adds r2, 0x6A
	movs r0, 0x1
	strb r0, [r2]
	mov r0, sp
	movs r1, 0x2D
	bl SetMonData
	ldr r0, _08042040 @ =gPlayerParty
	movs r1, 0xFA
	lsls r1, 1
	adds r0, r1
	mov r1, sp
	movs r2, 0x64
	bl memcpy
	bl party_compaction
	bl CalculatePlayerPartyCount
	adds r0, r5, 0
	bl sub_8041E64
	add sp, 0x6C
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_08042040: .4byte gPlayerParty
	thumb_func_end sub_8041FC4

	thumb_func_start sub_8042044
sub_8042044: @ 8042044
	push {r4-r7,lr}
	mov r7, r9
	mov r6, r8
	push {r6,r7}
	sub sp, 0x18
	adds r7, r0, 0
	adds r5, r1, 0
	adds r6, r2, 0
	lsls r5, 16
	lsrs r5, 16
	lsls r6, 24
	lsrs r6, 24
	movs r4, 0
	str r4, [sp]
	str r4, [sp, 0x4]
	str r4, [sp, 0x8]
	str r4, [sp, 0xC]
	adds r1, r5, 0
	movs r2, 0x5
	movs r3, 0x20
	bl CreateMon
	movs r0, 0x12
	add r0, sp
	mov r8, r0
	strb r4, [r0]
	movs r1, 0x4
	add r0, sp, 0x10
	strh r1, [r0]
	mov r4, sp
	adds r4, 0x13
	movs r0, 0x1
	mov r9, r0
	mov r0, r9
	strb r0, [r4]
	adds r0, r7, 0
	movs r1, 0x26
	add r2, sp, 0x10
	bl SetMonData
	ldr r2, _080420F4 @ =gUnknown_08209AD4
	adds r0, r7, 0
	movs r1, 0x2
	bl SetMonData
	lsls r2, r5, 3
	subs r2, r5
	lsls r2, 2
	ldr r0, _080420F8 @ =gBaseStats + 0x11 @ egg cycles offset
	adds r2, r0
	adds r0, r7, 0
	movs r1, 0x20
	bl SetMonData
	adds r0, r7, 0
	movs r1, 0x24
	mov r2, r8
	bl SetMonData
	adds r0, r7, 0
	movs r1, 0x3
	adds r2, r4, 0
	bl SetMonData
	cmp r6, 0
	beq _080420D6
	add r2, sp, 0x14
	movs r0, 0xFD
	strb r0, [r2]
	adds r0, r7, 0
	movs r1, 0x23
	bl SetMonData
_080420D6:
	mov r2, sp
	adds r2, 0x15
	mov r0, r9
	strb r0, [r2]
	adds r0, r7, 0
	movs r1, 0x2D
	bl SetMonData
	add sp, 0x18
	pop {r3,r4}
	mov r8, r3
	mov r9, r4
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080420F4: .4byte gUnknown_08209AD4
_080420F8: .4byte gBaseStats + 0x11 @ egg cycles offset
	thumb_func_end sub_8042044

	thumb_func_start sub_80420FC
sub_80420FC: @ 80420FC
	push {r4-r6,lr}
	mov r6, r9
	mov r5, r8
	push {r5,r6}
	sub sp, 0x14
	adds r6, r0, 0
	adds r5, r1, 0
	adds r4, r2, 0
	lsls r5, 16
	lsrs r5, 16
	bl Random
	movs r1, 0x8C
	lsls r1, 1
	adds r4, r1
	ldrh r1, [r4]
	lsls r0, 16
	orrs r1, r0
	movs r0, 0x1
	mov r8, r0
	str r0, [sp]
	str r1, [sp, 0x4]
	movs r4, 0
	str r4, [sp, 0x8]
	str r4, [sp, 0xC]
	adds r0, r6, 0
	adds r1, r5, 0
	movs r2, 0x5
	movs r3, 0x20
	bl CreateMon
	movs r1, 0x12
	add r1, sp
	mov r9, r1
	strb r4, [r1]
	movs r1, 0x4
	add r0, sp, 0x10
	strh r1, [r0]
	mov r4, sp
	adds r4, 0x13
	mov r0, r8
	strb r0, [r4]
	adds r0, r6, 0
	movs r1, 0x26
	add r2, sp, 0x10
	bl SetMonData
	ldr r2, _08042198 @ =gUnknown_08209AD4
	adds r0, r6, 0
	movs r1, 0x2
	bl SetMonData
	lsls r2, r5, 3
	subs r2, r5
	lsls r2, 2
	ldr r0, _0804219C @ =gBaseStats + 0x11 @ egg cycles offset
	adds r2, r0
	adds r0, r6, 0
	movs r1, 0x20
	bl SetMonData
	adds r0, r6, 0
	movs r1, 0x24
	mov r2, r9
	bl SetMonData
	adds r0, r6, 0
	movs r1, 0x3
	adds r2, r4, 0
	bl SetMonData
	add sp, 0x14
	pop {r3,r4}
	mov r8, r3
	mov r9, r4
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_08042198: .4byte gUnknown_08209AD4
_0804219C: .4byte gBaseStats + 0x11 @ egg cycles offset
	thumb_func_end sub_80420FC

	thumb_func_start sp0B8_daycare
sp0B8_daycare: @ 80421A0
	push {lr}
	ldr r0, _080421AC @ =gSaveBlock1 + 0x2F9C
	bl sub_8041FC4
	pop {r0}
	bx r0
	.align 2, 0
_080421AC: .4byte gSaveBlock1 + 0x2F9C
	thumb_func_end sp0B8_daycare

	thumb_func_start sub_80421B0
sub_80421B0: @ 80421B0
	push {r4-r7,lr}
	sub sp, 0x8
	adds r7, r0, 0
	movs r2, 0
	movs r6, 0
	adds r5, r7, 0
_080421BC:
	lsls r4, r6, 2
	adds r0, r5, 0
	movs r1, 0x5
	str r2, [sp, 0x4]
	bl GetBoxMonData
	ldr r2, [sp, 0x4]
	cmp r0, 0
	beq _080421DE
	movs r0, 0x88
	lsls r0, 1
	adds r1, r7, r0
	adds r1, r4
	ldr r0, [r1]
	adds r0, 0x1
	str r0, [r1]
	adds r2, 0x1
_080421DE:
	adds r5, 0x50
	adds r6, 0x1
	cmp r6, 0x1
	bls _080421BC
	movs r1, 0x8C
	lsls r1, 1
	adds r0, r7, r1
	ldrh r0, [r0]
	cmp r0, 0
	bne _08042226
	cmp r2, 0x2
	bne _08042226
	subs r1, 0x4
	adds r0, r7, r1
	ldrb r0, [r0]
	cmp r0, 0xFF
	bne _08042226
	adds r0, r7, 0
	bl daycare_relationship_score
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	bl Random
	lsls r0, 16
	lsrs r0, 16
	movs r1, 0x64
	muls r0, r1
	ldr r1, _08042240 @ =0x0000ffff
	bl __udivsi3
	cmp r4, r0
	bls _08042226
	bl sub_8041940
_08042226:
	movs r0, 0x8D
	lsls r0, 1
	adds r1, r7, r0
	ldrb r0, [r1]
	adds r0, 0x1
	strb r0, [r1]
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0xFF
	bne _08042290
	movs r6, 0
	b _08042288
	.align 2, 0
_08042240: .4byte 0x0000ffff
_08042244:
	movs r0, 0x64
	adds r1, r6, 0
	muls r1, r0
	ldr r0, _08042270 @ =gPlayerParty
	adds r4, r1, r0
	adds r0, r4, 0
	movs r1, 0x2D
	bl GetMonData
	cmp r0, 0
	beq _08042286
	adds r0, r4, 0
	movs r1, 0x20
	bl GetMonData
	str r0, [sp]
	cmp r0, 0
	bne _08042278
	ldr r0, _08042274 @ =gSpecialVar_0x8004
	strh r6, [r0]
	movs r0, 0x1
	b _08042292
	.align 2, 0
_08042270: .4byte gPlayerParty
_08042274: .4byte gSpecialVar_0x8004
_08042278:
	subs r0, 0x1
	str r0, [sp]
	adds r0, r4, 0
	movs r1, 0x20
	mov r2, sp
	bl SetMonData
_08042286:
	adds r6, 0x1
_08042288:
	ldr r0, _0804229C @ =gPlayerPartyCount
	ldrb r0, [r0]
	cmp r6, r0
	bcc _08042244
_08042290:
	movs r0, 0
_08042292:
	add sp, 0x8
	pop {r4-r7}
	pop {r1}
	bx r1
	.align 2, 0
_0804229C: .4byte gPlayerPartyCount
	thumb_func_end sub_80421B0

	thumb_func_start sub_80422A0
sub_80422A0: @ 80422A0
	push {lr}
	ldr r0, _080422B0 @ =gSaveBlock1 + 0x2F9C
	bl sub_80421B0
	lsls r0, 24
	lsrs r0, 24
	pop {r1}
	bx r1
	.align 2, 0
_080422B0: .4byte gSaveBlock1 + 0x2F9C
	thumb_func_end sub_80422A0

	thumb_func_start sub_80422B4
sub_80422B4: @ 80422B4
	movs r1, 0x8C
	lsls r1, 1
	adds r0, r1
	ldrh r1, [r0]
	negs r0, r1
	orrs r0, r1
	lsrs r0, 31
	bx lr
	thumb_func_end sub_80422B4

	thumb_func_start sub_80422C4
sub_80422C4: @ 80422C4
	push {r4-r6,lr}
	adds r6, r0, 0
	movs r1, 0xB
	bl GetBoxMonData
	cmp r0, 0
	beq _080422FC
	ldr r1, _0804231C @ =gStringVar1
	adds r0, r6, 0
	bl pokemon_get_nick_
	adds r0, r6, 0
	movs r1, 0x3
	bl GetBoxMonData
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	ldr r5, _08042320 @ =gStringVar3
	adds r0, r6, 0
	movs r1, 0x7
	adds r2, r5, 0
	bl GetBoxMonData
	adds r0, r5, 0
	adds r1, r4, 0
	bl ConvertInternationalString
_080422FC:
	adds r4, r6, 0
	adds r4, 0x50
	adds r0, r4, 0
	movs r1, 0xB
	bl GetBoxMonData
	cmp r0, 0
	beq _08042314
	ldr r1, _08042324 @ =gStringVar2
	adds r0, r4, 0
	bl pokemon_get_nick_
_08042314:
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_0804231C: .4byte gStringVar1
_08042320: .4byte gStringVar3
_08042324: .4byte gStringVar2
	thumb_func_end sub_80422C4

	thumb_func_start sub_8042328
sub_8042328: @ 8042328
	push {r4-r6,lr}
	ldr r6, _08042354 @ =gUnknown_03005CE0
	ldrb r0, [r6]
	movs r5, 0x64
	muls r0, r5
	ldr r4, _08042358 @ =gPlayerParty
	adds r0, r4
	ldr r1, _0804235C @ =gStringVar1
	bl pokemon_get_nick_
	ldrb r0, [r6]
	muls r0, r5
	adds r0, r4
	movs r1, 0xB
	bl GetBoxMonData
	lsls r0, 16
	lsrs r0, 16
	pop {r4-r6}
	pop {r1}
	bx r1
	.align 2, 0
_08042354: .4byte gUnknown_03005CE0
_08042358: .4byte gPlayerParty
_0804235C: .4byte gStringVar1
	thumb_func_end sub_8042328

	thumb_func_start sp0B5_daycare
sp0B5_daycare: @ 8042360
	push {lr}
	ldr r0, _0804236C @ =gSaveBlock1 + 0x2F9C
	bl sub_80422C4
	pop {r0}
	bx r0
	.align 2, 0
_0804236C: .4byte gSaveBlock1 + 0x2F9C
	thumb_func_end sp0B5_daycare

	thumb_func_start sp0B6_daycare
sp0B6_daycare: @ 8042370
	push {r4,lr}
	ldr r4, _08042384 @ =gSaveBlock1 + 0x2F9C
	adds r0, r4, 0
	bl sub_80422B4
	lsls r0, 24
	cmp r0, 0
	beq _08042388
	movs r0, 0x1
	b _080423A0
	.align 2, 0
_08042384: .4byte gSaveBlock1 + 0x2F9C
_08042388:
	adds r0, r4, 0
	bl daycare_count_pokemon
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0
	bne _0804239A
	movs r0, 0
	b _080423A0
_0804239A:
	adds r0, 0x1
	lsls r0, 24
	lsrs r0, 24
_080423A0:
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end sp0B6_daycare

	thumb_func_start sub_80423A8
sub_80423A8: @ 80423A8
	push {r4-r6,lr}
	adds r5, r1, 0
	movs r4, 0
	adds r1, r0, 0
_080423B0:
	movs r3, 0
	ldrh r0, [r1]
	adds r2, r5, 0
_080423B6:
	ldrh r6, [r2]
	cmp r0, r6
	bne _080423C0
	movs r0, 0x1
	b _080423D2
_080423C0:
	adds r2, 0x2
	adds r3, 0x1
	cmp r3, 0x1
	ble _080423B6
	adds r1, 0x2
	adds r4, 0x1
	cmp r4, 0x1
	ble _080423B0
	movs r0, 0
_080423D2:
	pop {r4-r6}
	pop {r1}
	bx r1
	thumb_func_end sub_80423A8

	thumb_func_start daycare_relationship_score
daycare_relationship_score: @ 80423D8
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	sub sp, 0x2C
	movs r1, 0
	mov r8, r1
	mov r2, sp
	adds r2, 0x8
	str r2, [sp, 0x1C]
	add r1, sp, 0xC
	mov r10, r1
	adds r2, 0xC
	str r2, [sp, 0x20]
	mov r1, sp
	adds r1, 0x2
	ldr r2, _08042488 @ =gBaseStats
	mov r9, r2
	ldr r5, [sp, 0x1C]
	adds r7, r1, 0
	mov r6, sp
	ldr r1, [sp, 0x20]
	str r1, [sp, 0x24]
	mov r2, r10
	str r2, [sp, 0x28]
	adds r4, r0, 0
_0804240E:
	adds r0, r4, 0
	movs r1, 0xB
	bl GetBoxMonData
	strh r0, [r5]
	adds r0, r4, 0
	movs r1, 0x1
	bl GetBoxMonData
	ldr r1, [sp, 0x28]
	stm r1!, {r0}
	str r1, [sp, 0x28]
	adds r0, r4, 0
	movs r1, 0
	bl GetBoxMonData
	adds r1, r0, 0
	ldrh r0, [r5]
	bl GetGenderFromSpeciesAndPersonality
	lsls r0, 24
	lsrs r0, 24
	ldr r2, [sp, 0x24]
	stm r2!, {r0}
	str r2, [sp, 0x24]
	ldrh r1, [r5]
	lsls r0, r1, 3
	subs r0, r1
	lsls r0, 2
	add r0, r9
	ldrb r0, [r0, 0x14]
	strh r0, [r6]
	ldrh r1, [r5]
	lsls r0, r1, 3
	subs r0, r1
	lsls r0, 2
	add r0, r9
	ldrb r0, [r0, 0x15]
	strh r0, [r7]
	adds r5, 0x2
	adds r7, 0x4
	adds r6, 0x4
	adds r4, 0x50
	movs r0, 0x1
	add r8, r0
	mov r1, r8
	cmp r1, 0x1
	bls _0804240E
	mov r0, sp
	ldrh r1, [r0]
	cmp r1, 0xF
	beq _08042484
	ldrh r0, [r0, 0x4]
	cmp r0, 0xF
	beq _08042484
	cmp r1, 0xD
	bne _0804248C
	cmp r0, 0xD
	bne _08042490
_08042484:
	movs r0, 0
	b _080424E4
	.align 2, 0
_08042488: .4byte gBaseStats
_0804248C:
	cmp r0, 0xD
	bne _0804249C
_08042490:
	ldr r1, [sp, 0xC]
	mov r2, r10
	ldr r0, [r2, 0x4]
	cmp r1, r0
	beq _080424DE
	b _080424E2
_0804249C:
	ldr r0, [sp, 0x14]
	ldr r2, [sp, 0x20]
	ldr r1, [r2, 0x4]
	cmp r0, r1
	beq _08042484
	cmp r0, 0xFF
	beq _08042484
	cmp r1, 0xFF
	beq _08042484
	add r1, sp, 0x4
	mov r0, sp
	bl sub_80423A8
	lsls r0, 24
	cmp r0, 0
	beq _08042484
	ldr r0, [sp, 0x1C]
	ldrh r1, [r0, 0x2]
	ldrh r0, [r0]
	cmp r0, r1
	bne _080424D4
	ldr r1, [sp, 0xC]
	mov r2, r10
	ldr r0, [r2, 0x4]
	cmp r1, r0
	beq _080424E2
	movs r0, 0x46
	b _080424E4
_080424D4:
	ldr r1, [sp, 0xC]
	mov r2, r10
	ldr r0, [r2, 0x4]
	cmp r1, r0
	bne _080424E2
_080424DE:
	movs r0, 0x14
	b _080424E4
_080424E2:
	movs r0, 0x32
_080424E4:
	add sp, 0x2C
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r1}
	bx r1
	thumb_func_end daycare_relationship_score

	thumb_func_start daycare_relationship_score_from_savegame
daycare_relationship_score_from_savegame: @ 80424F4
	push {lr}
	ldr r0, _08042504 @ =gSaveBlock1 + 0x2F9C
	bl daycare_relationship_score
	lsls r0, 24
	lsrs r0, 24
	pop {r1}
	bx r1
	.align 2, 0
_08042504: .4byte gSaveBlock1 + 0x2F9C
	thumb_func_end daycare_relationship_score_from_savegame

	thumb_func_start sp0B9_daycare_relationship_comment
sp0B9_daycare_relationship_comment: @ 8042508
	push {lr}
	bl daycare_relationship_score_from_savegame
	lsls r0, 24
	lsrs r0, 24
	adds r2, r0, 0
	movs r1, 0
	cmp r0, 0
	bne _0804251C
	movs r1, 0x3
_0804251C:
	cmp r0, 0x14
	bne _08042522
	movs r1, 0x2
_08042522:
	cmp r0, 0x32
	bne _08042528
	movs r1, 0x1
_08042528:
	cmp r2, 0x46
	bne _0804252E
	movs r1, 0
_0804252E:
	ldr r0, _08042540 @ =gStringVar4
	ldr r2, _08042544 @ =gUnknown_08209AC4
	lsls r1, 2
	adds r1, r2
	ldr r1, [r1]
	bl StringCopy
	pop {r0}
	bx r0
	.align 2, 0
_08042540: .4byte gStringVar4
_08042544: .4byte gUnknown_08209AC4
	thumb_func_end sp0B9_daycare_relationship_comment

	thumb_func_start NameHasGenderSymbol
NameHasGenderSymbol: @ 8042548
	push {r4,r5,lr}
	sub sp, 0x4
	adds r4, r0, 0
	lsls r1, 24
	lsrs r5, r1, 24
	mov r2, sp
	mov r1, sp
	movs r0, 0
	strb r0, [r1, 0x1]
	strb r0, [r2]
	movs r3, 0
	ldrb r0, [r4]
	cmp r0, 0xFF
	beq _0804258C
_08042564:
	adds r1, r4, r3
	ldrb r0, [r1]
	cmp r0, 0xB5
	bne _08042572
	ldrb r0, [r2]
	adds r0, 0x1
	strb r0, [r2]
_08042572:
	ldrb r0, [r1]
	cmp r0, 0xB6
	bne _0804257E
	ldrb r0, [r2, 0x1]
	adds r0, 0x1
	strb r0, [r2, 0x1]
_0804257E:
	adds r0, r3, 0x1
	lsls r0, 24
	lsrs r3, r0, 24
	adds r0, r4, r3
	ldrb r0, [r0]
	cmp r0, 0xFF
	bne _08042564
_0804258C:
	cmp r5, 0
	bne _080425A0
	mov r0, sp
	ldrb r0, [r0]
	cmp r0, 0
	beq _080425A0
	mov r0, sp
	ldrb r0, [r0, 0x1]
	cmp r0, 0
	beq _080425B4
_080425A0:
	cmp r5, 0xFE
	bne _080425B8
	mov r0, sp
	ldrb r0, [r0, 0x1]
	cmp r0, 0
	beq _080425B8
	mov r0, sp
	ldrb r0, [r0]
	cmp r0, 0
	bne _080425B8
_080425B4:
	movs r0, 0x1
	b _080425BA
_080425B8:
	movs r0, 0
_080425BA:
	add sp, 0x4
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end NameHasGenderSymbol

	thumb_func_start AppendGenderSymbol
AppendGenderSymbol: @ 80425C4
	push {r4,lr}
	adds r4, r0, 0
	lsls r1, 24
	lsrs r1, 24
	cmp r1, 0
	bne _080425E4
	movs r1, 0
	bl NameHasGenderSymbol
	lsls r0, 24
	cmp r0, 0
	bne _08042600
	ldr r1, _080425E0 @ =gOtherText_MaleSymbol3
	b _08042602
	.align 2, 0
_080425E0: .4byte gOtherText_MaleSymbol3
_080425E4:
	cmp r1, 0xFE
	bne _08042600
	adds r0, r4, 0
	movs r1, 0xFE
	bl NameHasGenderSymbol
	lsls r0, 24
	cmp r0, 0
	bne _08042600
	ldr r1, _080425FC @ =gOtherText_FemaleSymbol3
	b _08042602
	.align 2, 0
_080425FC: .4byte gOtherText_FemaleSymbol3
_08042600:
	ldr r1, _08042610 @ =gOtherText_GenderlessSymbol
_08042602:
	adds r0, r4, 0
	bl StringAppend
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_08042610: .4byte gOtherText_GenderlessSymbol
	thumb_func_end AppendGenderSymbol

	thumb_func_start MonAppendGenderSymbol
MonAppendGenderSymbol: @ 8042614
	push {r4,lr}
	adds r4, r0, 0
	adds r0, r1, 0
	bl GetBoxMonGender
	adds r1, r0, 0
	lsls r1, 24
	lsrs r1, 24
	adds r0, r4, 0
	bl AppendGenderSymbol
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end MonAppendGenderSymbol

	thumb_func_start DaycareLevelMenuGetText
DaycareLevelMenuGetText: @ 8042630
	push {r4-r7,lr}
	mov r7, r9
	mov r6, r8
	push {r6,r7}
	sub sp, 0x28
	mov r8, r0
	adds r7, r1, 0
	movs r0, 0xFF
	strb r0, [r7]
	movs r6, 0
	add r0, sp, 0x14
	mov r9, r0
_08042648:
	lsls r0, r6, 2
	adds r0, r6
	lsls r4, r0, 4
	add r4, r8
	lsls r0, 2
	mov r1, sp
	adds r5, r1, r0
	adds r0, r4, 0
	adds r1, r5, 0
	bl pokemon_get_nick_
	adds r0, r5, 0
	adds r1, r4, 0
	bl MonAppendGenderSymbol
	adds r0, r6, 0x1
	lsls r0, 24
	lsrs r6, r0, 24
	cmp r6, 0x1
	bls _08042648
	adds r0, r7, 0
	mov r1, sp
	bl StringCopy
	ldr r4, _080426A8 @ =gOtherText_NewLine2
	adds r0, r7, 0
	adds r1, r4, 0
	bl StringAppend
	adds r0, r7, 0
	mov r1, r9
	bl StringAppend
	adds r0, r7, 0
	adds r1, r4, 0
	bl StringAppend
	ldr r1, _080426AC @ =gOtherText_CancelAndLv
	adds r0, r7, 0
	bl StringAppend
	add sp, 0x28
	pop {r3,r4}
	mov r8, r3
	mov r9, r4
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080426A8: .4byte gOtherText_NewLine2
_080426AC: .4byte gOtherText_CancelAndLv
	thumb_func_end DaycareLevelMenuGetText

	thumb_func_start DaycareLevelMenuGetLevelText
DaycareLevelMenuGetLevelText: @ 80426B0
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	adds r6, r0, 0
	adds r4, r1, 0
	movs r0, 0xFF
	strb r0, [r4]
	movs r5, 0
	movs r0, 0xFC
	mov r8, r0
	movs r7, 0x14
_080426C6:
	lsls r2, r5, 2
	adds r0, r2, r5
	lsls r0, 4
	adds r0, r6, r0
	movs r3, 0x88
	lsls r3, 1
	adds r1, r6, r3
	adds r1, r2
	ldr r1, [r1]
	bl sub_8041664
	adds r1, r0, 0
	lsls r1, 24
	lsrs r1, 24
	movs r0, 0x34
	strb r0, [r4]
	mov r0, r8
	strb r0, [r4, 0x1]
	strb r7, [r4, 0x2]
	movs r0, 0x6
	strb r0, [r4, 0x3]
	adds r0, r4, 0x4
	movs r2, 0x1
	movs r3, 0x3
	bl ConvertIntToDecimalStringN
	adds r4, r0, 0
	mov r3, r8
	strb r3, [r4]
	strb r7, [r4, 0x1]
	movs r0, 0
	strb r0, [r4, 0x2]
	adds r0, r4, 0x3
	ldr r1, _08042728 @ =gOtherText_NewLine2
	bl StringCopy
	adds r4, r0, 0
	adds r0, r5, 0x1
	lsls r0, 24
	lsrs r5, r0, 24
	cmp r5, 0x1
	bls _080426C6
	movs r0, 0xFF
	strb r0, [r4]
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_08042728: .4byte gOtherText_NewLine2
	thumb_func_end DaycareLevelMenuGetLevelText

	thumb_func_start DaycareLevelMenuProcessKeyInput
DaycareLevelMenuProcessKeyInput: @ 804272C
	push {r4,r5,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	adds r5, r4, 0
	ldr r0, _08042760 @ =gMain
	ldrh r1, [r0, 0x2E]
	movs r0, 0x40
	ands r0, r1
	cmp r0, 0
	beq _08042768
	ldr r0, _08042764 @ =gTasks
	lsls r1, r4, 2
	adds r1, r4
	lsls r1, 3
	adds r1, r0
	ldrh r2, [r1, 0x8]
	movs r3, 0x8
	ldrsh r0, [r1, r3]
	cmp r0, 0
	beq _08042816
	subs r0, r2, 0x1
	strh r0, [r1, 0x8]
	movs r0, 0x1
	negs r0, r0
	b _0804278A
	.align 2, 0
_08042760: .4byte gMain
_08042764: .4byte gTasks
_08042768:
	movs r0, 0x80
	ands r0, r1
	cmp r0, 0
	beq _0804279C
	ldr r0, _08042798 @ =gTasks
	lsls r1, r4, 2
	adds r1, r4
	lsls r1, 3
	adds r1, r0
	ldrh r2, [r1, 0x8]
	movs r3, 0x8
	ldrsh r0, [r1, r3]
	cmp r0, 0x2
	beq _08042816
	adds r0, r2, 0x1
	strh r0, [r1, 0x8]
	movs r0, 0x1
_0804278A:
	bl MoveMenuCursor
	movs r0, 0x5
	bl PlaySE
	b _08042816
	.align 2, 0
_08042798: .4byte gTasks
_0804279C:
	movs r0, 0x1
	ands r0, r1
	cmp r0, 0
	beq _080427E8
	bl sub_8072DEC
	movs r0, 0x5
	bl PlaySE
	ldr r3, _080427DC @ =gUnknown_03005CE0
	ldr r2, _080427E0 @ =gScriptResult
	ldr r1, _080427E4 @ =gTasks
	lsls r0, r4, 2
	adds r0, r4
	lsls r0, 3
	adds r0, r1
	ldrh r0, [r0, 0x8]
	strh r0, [r2]
	strb r0, [r3]
	adds r0, r4, 0
	bl DestroyTask
	movs r0, 0xF
	movs r1, 0x6
	movs r2, 0x1D
	movs r3, 0xD
	bl MenuZeroFillWindowRect
	bl EnableBothScriptContexts
	b _08042816
	.align 2, 0
_080427DC: .4byte gUnknown_03005CE0
_080427E0: .4byte gScriptResult
_080427E4: .4byte gTasks
_080427E8:
	movs r4, 0x2
	adds r0, r4, 0
	ands r0, r1
	cmp r0, 0
	beq _08042816
	bl sub_8072DEC
	ldr r0, _0804281C @ =gUnknown_03005CE0
	ldr r1, _08042820 @ =gScriptResult
	strh r4, [r1]
	movs r1, 0x2
	strb r1, [r0]
	adds r0, r5, 0
	bl DestroyTask
	movs r0, 0xF
	movs r1, 0x6
	movs r2, 0x1D
	movs r3, 0xD
	bl MenuZeroFillWindowRect
	bl EnableBothScriptContexts
_08042816:
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_0804281C: .4byte gUnknown_03005CE0
_08042820: .4byte gScriptResult
	thumb_func_end DaycareLevelMenuProcessKeyInput

	thumb_func_start ShowDaycareLevelMenu
ShowDaycareLevelMenu: @ 8042824
	push {r4,lr}
	sub sp, 0x6C
	movs r0, 0xF
	movs r1, 0x6
	movs r2, 0x1D
	movs r3, 0xD
	bl MenuDrawTextWindow
	ldr r4, _08042880 @ =gSaveBlock1 + 0x2F9C
	adds r0, r4, 0
	add r1, sp, 0x8
	bl DaycareLevelMenuGetText
	add r0, sp, 0x8
	movs r1, 0x10
	movs r2, 0x7
	bl MenuPrint
	adds r0, r4, 0
	add r1, sp, 0x8
	bl DaycareLevelMenuGetLevelText
	add r0, sp, 0x8
	movs r1, 0xCE
	movs r2, 0x38
	movs r3, 0x1
	bl MenuPrint_PixelCoords
	movs r0, 0
	str r0, [sp]
	movs r0, 0xD
	str r0, [sp, 0x4]
	movs r0, 0
	movs r1, 0x10
	movs r2, 0x7
	movs r3, 0x3
	bl InitMenu
	ldr r0, _08042884 @ =DaycareLevelMenuProcessKeyInput
	movs r1, 0x3
	bl CreateTask
	add sp, 0x6C
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08042880: .4byte gSaveBlock1 + 0x2F9C
_08042884: .4byte DaycareLevelMenuProcessKeyInput
	thumb_func_end ShowDaycareLevelMenu

	thumb_func_start ChooseSendDaycareMon
ChooseSendDaycareMon: @ 8042888
	push {lr}
	movs r0, 0x6
	movs r1, 0
	bl OpenPartyMenu
	ldr r1, _0804289C @ =gMain
	ldr r0, _080428A0 @ =c2_exit_to_overworld_2_switch
	str r0, [r1, 0x8]
	pop {r0}
	bx r0
	.align 2, 0
_0804289C: .4byte gMain
_080428A0: .4byte c2_exit_to_overworld_2_switch
	thumb_func_end ChooseSendDaycareMon

	.align 2, 0 @ Don't pad with nop.
