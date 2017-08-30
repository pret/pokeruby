	.include "constants/gba_constants.inc"
	.include "constants/species_constants.inc"
	.include "asm/macros.inc"

	.syntax unified

	.text

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
	bl GetBoxMonNick
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
	bl GetBoxMonNick
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
	ldr r6, _08042354 @ =gLastFieldPokeMenuOpened
	ldrb r0, [r6]
	movs r5, 0x64
	muls r0, r5
	ldr r4, _08042358 @ =gPlayerParty
	adds r0, r4
	ldr r1, _0804235C @ =gStringVar1
	bl GetBoxMonNick
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
_08042354: .4byte gLastFieldPokeMenuOpened
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
	bl Daycare_CountPokemon
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
	bl GetBoxMonNick
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
	bl Daycare_GetLevelAfterSteps
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
	bl HandleDestroyMenuCursors
	movs r0, 0x5
	bl PlaySE
	ldr r3, _080427DC @ =gLastFieldPokeMenuOpened
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
_080427DC: .4byte gLastFieldPokeMenuOpened
_080427E0: .4byte gScriptResult
_080427E4: .4byte gTasks
_080427E8:
	movs r4, 0x2
	adds r0, r4, 0
	ands r0, r1
	cmp r0, 0
	beq _08042816
	bl HandleDestroyMenuCursors
	ldr r0, _0804281C @ =gLastFieldPokeMenuOpened
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
_0804281C: .4byte gLastFieldPokeMenuOpened
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
