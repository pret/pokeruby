	.include "constants/gba_constants.inc"
	.include "constants/misc_constants.inc"
	.include "constants/species_constants.inc"
	.include "asm/macros.inc"

	.syntax unified

	.text

	thumb_func_start DoTVShowBravoTrainerPokemonProfile
DoTVShowBravoTrainerPokemonProfile: @ 80C091C
	push {r4,r5,lr}
	ldr r0, _080C0948 @ =gSpecialVar_0x8004
	ldrh r1, [r0]
	lsls r0, r1, 3
	adds r0, r1
	lsls r0, 2
	ldr r1, _080C094C @ =gSaveBlock1 + 0x2738
	adds r4, r0, r1
	ldr r1, _080C0950 @ =gScriptResult
	movs r0, 0
	strh r0, [r1]
	ldr r0, _080C0954 @ =gUnknown_020387E8
	ldrb r5, [r0]
	cmp r5, 0x8
	bls _080C093C
	b _080C0B7A
_080C093C:
	lsls r0, r5, 2
	ldr r1, _080C0958 @ =_080C095C
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_080C0948: .4byte gSpecialVar_0x8004
_080C094C: .4byte gSaveBlock1 + 0x2738
_080C0950: .4byte gScriptResult
_080C0954: .4byte gUnknown_020387E8
_080C0958: .4byte _080C095C
	.align 2, 0
_080C095C:
	.4byte _080C0980
	.4byte _080C09D8
	.4byte _080C0A10
	.4byte _080C0A40
	.4byte _080C0A74
	.4byte _080C0AA8
	.4byte _080C0AEC
	.4byte _080C0B34
	.4byte _080C0B64
_080C0980:
	ldr r0, _080C09C0 @ =gStringVar1
	adds r1, r4, 0
	adds r1, 0x16
	ldrb r2, [r4, 0x1E]
	bl TVShowConvertInternationalString
	ldrb r1, [r4, 0x13]
	lsls r1, 29
	lsrs r1, 29
	movs r0, 0x1
	bl CopyContestCategoryToStringVar
	ldrb r1, [r4, 0x13]
	lsls r1, 27
	lsrs r1, 30
	movs r0, 0x2
	bl sub_80BEF10
	ldrh r1, [r4, 0x2]
	movs r0, 0xB
	muls r0, r1
	ldr r1, _080C09C4 @ =gSpeciesNames
	adds r0, r1
	adds r1, r4, 0
	adds r1, 0x8
	bl StringCompareWithoutExtCtrlCodes
	cmp r0, 0
	bne _080C09CC
	ldr r1, _080C09C8 @ =gUnknown_020387E8
	movs r0, 0x8
	b _080C0B78
	.align 2, 0
_080C09C0: .4byte gStringVar1
_080C09C4: .4byte gSpeciesNames
_080C09C8: .4byte gUnknown_020387E8
_080C09CC:
	ldr r1, _080C09D4 @ =gUnknown_020387E8
	movs r0, 0x1
	b _080C0B78
	.align 2, 0
_080C09D4: .4byte gUnknown_020387E8
_080C09D8:
	ldr r0, _080C0A04 @ =gStringVar1
	ldrh r2, [r4, 0x2]
	movs r1, 0xB
	muls r1, r2
	ldr r2, _080C0A08 @ =gSpeciesNames
	adds r1, r2
	bl StringCopy
	ldr r0, _080C0A0C @ =gStringVar2
	adds r1, r4, 0
	adds r1, 0x8
	ldrb r2, [r4, 0x1F]
	bl TVShowConvertInternationalString
	ldrb r1, [r4, 0x13]
	lsls r1, 29
	lsrs r1, 29
	movs r0, 0x2
	bl CopyContestCategoryToStringVar
	b _080C0B74
	.align 2, 0
_080C0A04: .4byte gStringVar1
_080C0A08: .4byte gSpeciesNames
_080C0A0C: .4byte gStringVar2
_080C0A10:
	ldr r0, _080C0A2C @ =gStringVar1
	adds r1, r4, 0
	adds r1, 0x16
	ldrb r2, [r4, 0x1E]
	bl TVShowConvertInternationalString
	ldrb r1, [r4, 0x13]
	movs r0, 0x60
	ands r0, r1
	cmp r0, 0
	bne _080C0A34
	ldr r1, _080C0A30 @ =gUnknown_020387E8
	movs r0, 0x3
	b _080C0B78
	.align 2, 0
_080C0A2C: .4byte gStringVar1
_080C0A30: .4byte gUnknown_020387E8
_080C0A34:
	ldr r1, _080C0A3C @ =gUnknown_020387E8
	movs r0, 0x4
	b _080C0B78
	.align 2, 0
_080C0A3C: .4byte gUnknown_020387E8
_080C0A40:
	ldr r0, _080C0A68 @ =gStringVar1
	adds r1, r4, 0
	adds r1, 0x16
	ldrb r2, [r4, 0x1E]
	bl TVShowConvertInternationalString
	ldr r0, _080C0A6C @ =gStringVar2
	ldrh r1, [r4, 0x4]
	bl sub_80EB3FC
	ldrb r1, [r4, 0x13]
	lsls r1, 25
	lsrs r1, 30
	adds r1, 0x1
	movs r0, 0x2
	bl sub_80BF088
	ldr r1, _080C0A70 @ =gUnknown_020387E8
	movs r0, 0x5
	b _080C0B78
	.align 2, 0
_080C0A68: .4byte gStringVar1
_080C0A6C: .4byte gStringVar2
_080C0A70: .4byte gUnknown_020387E8
_080C0A74:
	ldr r0, _080C0A9C @ =gStringVar1
	adds r1, r4, 0
	adds r1, 0x16
	ldrb r2, [r4, 0x1E]
	bl TVShowConvertInternationalString
	ldr r0, _080C0AA0 @ =gStringVar2
	ldrh r1, [r4, 0x4]
	bl sub_80EB3FC
	ldrb r1, [r4, 0x13]
	lsls r1, 25
	lsrs r1, 30
	adds r1, 0x1
	movs r0, 0x2
	bl sub_80BF088
	ldr r1, _080C0AA4 @ =gUnknown_020387E8
	movs r0, 0x5
	b _080C0B78
	.align 2, 0
_080C0A9C: .4byte gStringVar1
_080C0AA0: .4byte gStringVar2
_080C0AA4: .4byte gUnknown_020387E8
_080C0AA8:
	ldr r0, _080C0AD4 @ =gStringVar1
	adds r1, r4, 0
	adds r1, 0x16
	ldrb r2, [r4, 0x1E]
	bl TVShowConvertInternationalString
	ldrb r1, [r4, 0x13]
	lsls r1, 29
	lsrs r1, 29
	movs r0, 0x1
	bl CopyContestCategoryToStringVar
	ldr r0, _080C0AD8 @ =gStringVar3
	ldrh r1, [r4, 0x6]
	bl sub_80EB3FC
	ldrh r0, [r4, 0x14]
	cmp r0, 0
	beq _080C0AE0
	ldr r1, _080C0ADC @ =gUnknown_020387E8
	movs r0, 0x6
	b _080C0B78
	.align 2, 0
_080C0AD4: .4byte gStringVar1
_080C0AD8: .4byte gStringVar3
_080C0ADC: .4byte gUnknown_020387E8
_080C0AE0:
	ldr r1, _080C0AE8 @ =gUnknown_020387E8
	movs r0, 0x7
	b _080C0B78
	.align 2, 0
_080C0AE8: .4byte gUnknown_020387E8
_080C0AEC:
	ldr r0, _080C0B1C @ =gStringVar1
	ldrh r2, [r4, 0x2]
	movs r1, 0xB
	muls r1, r2
	ldr r2, _080C0B20 @ =gSpeciesNames
	adds r1, r2
	bl StringCopy
	ldr r0, _080C0B24 @ =gStringVar2
	ldrh r2, [r4, 0x14]
	movs r1, 0xD
	muls r1, r2
	ldr r2, _080C0B28 @ =gMoveNames
	adds r1, r2
	bl StringCopy
	ldr r0, _080C0B2C @ =gStringVar3
	ldrh r1, [r4, 0x6]
	bl sub_80EB3FC
	ldr r1, _080C0B30 @ =gUnknown_020387E8
	movs r0, 0x7
	b _080C0B78
	.align 2, 0
_080C0B1C: .4byte gStringVar1
_080C0B20: .4byte gSpeciesNames
_080C0B24: .4byte gStringVar2
_080C0B28: .4byte gMoveNames
_080C0B2C: .4byte gStringVar3
_080C0B30: .4byte gUnknown_020387E8
_080C0B34:
	ldr r0, _080C0B58 @ =gStringVar1
	adds r1, r4, 0
	adds r1, 0x16
	ldrb r2, [r4, 0x1E]
	bl TVShowConvertInternationalString
	ldr r0, _080C0B5C @ =gStringVar2
	ldrh r2, [r4, 0x2]
	movs r1, 0xB
	muls r1, r2
	ldr r2, _080C0B60 @ =gSpeciesNames
	adds r1, r2
	bl StringCopy
	bl TVShowDone
	b _080C0B7A
	.align 2, 0
_080C0B58: .4byte gStringVar1
_080C0B5C: .4byte gStringVar2
_080C0B60: .4byte gSpeciesNames
_080C0B64:
	ldr r0, _080C0B8C @ =gStringVar1
	ldrh r2, [r4, 0x2]
	movs r1, 0xB
	muls r1, r2
	ldr r2, _080C0B90 @ =gSpeciesNames
	adds r1, r2
	bl StringCopy
_080C0B74:
	ldr r1, _080C0B94 @ =gUnknown_020387E8
	movs r0, 0x2
_080C0B78:
	strb r0, [r1]
_080C0B7A:
	ldr r0, _080C0B98 @ =gTVBravoTrainerTextGroup
	lsls r1, r5, 2
	adds r1, r0
	ldr r0, [r1]
	bl ShowFieldMessage
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080C0B8C: .4byte gStringVar1
_080C0B90: .4byte gSpeciesNames
_080C0B94: .4byte gUnknown_020387E8
_080C0B98: .4byte gTVBravoTrainerTextGroup
	thumb_func_end DoTVShowBravoTrainerPokemonProfile

	thumb_func_start DoTVShowBravoTrainerBattleTowerProfile
DoTVShowBravoTrainerBattleTowerProfile: @ 80C0B9C
	push {r4,r5,lr}
	ldr r0, _080C0BC8 @ =gSpecialVar_0x8004
	ldrh r1, [r0]
	lsls r0, r1, 3
	adds r0, r1
	lsls r0, 2
	ldr r1, _080C0BCC @ =gSaveBlock1 + 0x2738
	adds r4, r0, r1
	ldr r1, _080C0BD0 @ =gScriptResult
	movs r0, 0
	strh r0, [r1]
	ldr r0, _080C0BD4 @ =gUnknown_020387E8
	ldrb r5, [r0]
	adds r2, r0, 0
	cmp r5, 0xE
	bls _080C0BBE
	b _080C0DDE
_080C0BBE:
	lsls r0, r5, 2
	ldr r1, _080C0BD8 @ =_080C0BDC
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_080C0BC8: .4byte gSpecialVar_0x8004
_080C0BCC: .4byte gSaveBlock1 + 0x2738
_080C0BD0: .4byte gScriptResult
_080C0BD4: .4byte gUnknown_020387E8
_080C0BD8: .4byte _080C0BDC
	.align 2, 0
_080C0BDC:
	.4byte _080C0C18
	.4byte _080C0C5C
	.4byte _080C0C8C
	.4byte _080C0CB0
	.4byte _080C0CDC
	.4byte _080C0D24
	.4byte _080C0D30
	.4byte _080C0D3C
	.4byte _080C0D42
	.4byte _080C0D42
	.4byte _080C0D42
	.4byte _080C0D5C
	.4byte _080C0D88
	.4byte _080C0D88
	.4byte _080C0DC0
_080C0C18:
	ldr r0, _080C0C40 @ =gStringVar1
	adds r1, r4, 0x2
	ldrb r2, [r4, 0x1D]
	bl TVShowConvertInternationalString
	ldr r0, _080C0C44 @ =gStringVar2
	ldrh r2, [r4, 0xA]
	movs r1, 0xB
	muls r1, r2
	ldr r2, _080C0C48 @ =gSpeciesNames
	adds r1, r2
	bl StringCopy
	ldrh r0, [r4, 0x16]
	cmp r0, 0x6
	bls _080C0C50
	ldr r1, _080C0C4C @ =gUnknown_020387E8
	movs r0, 0x1
	strb r0, [r1]
	b _080C0DDE
	.align 2, 0
_080C0C40: .4byte gStringVar1
_080C0C44: .4byte gStringVar2
_080C0C48: .4byte gSpeciesNames
_080C0C4C: .4byte gUnknown_020387E8
_080C0C50:
	ldr r1, _080C0C58 @ =gUnknown_020387E8
	movs r0, 0x2
	strb r0, [r1]
	b _080C0DDE
	.align 2, 0
_080C0C58: .4byte gUnknown_020387E8
_080C0C5C:
	ldrb r1, [r4, 0x1A]
	movs r0, 0
	bl sub_80BF088
	ldrh r1, [r4, 0x16]
	movs r0, 0x1
	bl sub_80BF088
	ldrb r0, [r4, 0x1C]
	cmp r0, 0x1
	bne _080C0C80
	ldr r1, _080C0C7C @ =gUnknown_020387E8
	movs r0, 0x3
	strb r0, [r1]
	b _080C0DDE
	.align 2, 0
_080C0C7C: .4byte gUnknown_020387E8
_080C0C80:
	ldr r1, _080C0C88 @ =gUnknown_020387E8
	movs r0, 0x4
	strb r0, [r1]
	b _080C0DDE
	.align 2, 0
_080C0C88: .4byte gUnknown_020387E8
_080C0C8C:
	ldr r0, _080C0CAC @ =gStringVar1
	adds r1, r4, 0
	adds r1, 0xC
	ldrb r2, [r4, 0x1D]
	bl TVShowConvertInternationalString
	ldrh r1, [r4, 0x16]
	adds r1, 0x1
	movs r0, 0x1
	bl sub_80BF088
_080C0CA2:
	ldrb r0, [r4, 0x1B]
	cmp r0, 0
	beq _080C0CFE
	b _080C0D18
	.align 2, 0
_080C0CAC: .4byte gStringVar1
_080C0CB0:
	ldr r0, _080C0CD0 @ =gStringVar1
	adds r1, r4, 0
	adds r1, 0xC
	ldrb r2, [r4, 0x1D]
	bl TVShowConvertInternationalString
	ldr r0, _080C0CD4 @ =gStringVar2
	ldrh r2, [r4, 0x14]
	movs r1, 0xB
	muls r1, r2
	ldr r2, _080C0CD8 @ =gSpeciesNames
	adds r1, r2
	bl StringCopy
	b _080C0CA2
	.align 2, 0
_080C0CD0: .4byte gStringVar1
_080C0CD4: .4byte gStringVar2
_080C0CD8: .4byte gSpeciesNames
_080C0CDC:
	ldr r0, _080C0D08 @ =gStringVar1
	adds r1, r4, 0
	adds r1, 0xC
	ldrb r2, [r4, 0x1D]
	bl TVShowConvertInternationalString
	ldr r0, _080C0D0C @ =gStringVar2
	ldrh r2, [r4, 0x14]
	movs r1, 0xB
	muls r1, r2
	ldr r2, _080C0D10 @ =gSpeciesNames
	adds r1, r2
	bl StringCopy
	ldrb r0, [r4, 0x1B]
	cmp r0, 0
	bne _080C0D18
_080C0CFE:
	ldr r1, _080C0D14 @ =gUnknown_020387E8
	movs r0, 0x5
	strb r0, [r1]
	b _080C0DDE
	.align 2, 0
_080C0D08: .4byte gStringVar1
_080C0D0C: .4byte gStringVar2
_080C0D10: .4byte gSpeciesNames
_080C0D14: .4byte gUnknown_020387E8
_080C0D18:
	ldr r1, _080C0D20 @ =gUnknown_020387E8
	movs r0, 0x6
	strb r0, [r1]
	b _080C0DDE
	.align 2, 0
_080C0D20: .4byte gUnknown_020387E8
_080C0D24:
	ldr r0, _080C0D2C @ =gStringVar1
	adds r1, r4, 0
	adds r1, 0xC
	b _080C0D46
	.align 2, 0
_080C0D2C: .4byte gStringVar1
_080C0D30:
	ldr r0, _080C0D38 @ =gStringVar1
	adds r1, r4, 0
	adds r1, 0xC
	b _080C0D46
	.align 2, 0
_080C0D38: .4byte gStringVar1
_080C0D3C:
	movs r0, 0xB
	strb r0, [r2]
	b _080C0DDE
_080C0D42:
	ldr r0, _080C0D54 @ =gStringVar1
	adds r1, r4, 0x2
_080C0D46:
	ldrb r2, [r4, 0x1D]
	bl TVShowConvertInternationalString
	ldr r1, _080C0D58 @ =gUnknown_020387E8
	movs r0, 0xB
	strb r0, [r1]
	b _080C0DDE
	.align 2, 0
_080C0D54: .4byte gStringVar1
_080C0D58: .4byte gUnknown_020387E8
_080C0D5C:
	ldr r0, _080C0D74 @ =gStringVar1
	ldrh r1, [r4, 0x18]
	bl sub_80EB3FC
	ldrb r0, [r4, 0x1B]
	cmp r0, 0
	bne _080C0D7C
	ldr r1, _080C0D78 @ =gUnknown_020387E8
	movs r0, 0xC
	strb r0, [r1]
	b _080C0DDE
	.align 2, 0
_080C0D74: .4byte gStringVar1
_080C0D78: .4byte gUnknown_020387E8
_080C0D7C:
	ldr r1, _080C0D84 @ =gUnknown_020387E8
	movs r0, 0xD
	strb r0, [r1]
	b _080C0DDE
	.align 2, 0
_080C0D84: .4byte gUnknown_020387E8
_080C0D88:
	ldr r0, _080C0DB0 @ =gStringVar1
	ldrh r1, [r4, 0x18]
	bl sub_80EB3FC
	ldr r0, _080C0DB4 @ =gStringVar2
	adds r1, r4, 0x2
	ldrb r2, [r4, 0x1D]
	bl TVShowConvertInternationalString
	ldr r0, _080C0DB8 @ =gStringVar3
	adds r1, r4, 0
	adds r1, 0xC
	ldrb r2, [r4, 0x1D]
	bl TVShowConvertInternationalString
	ldr r1, _080C0DBC @ =gUnknown_020387E8
	movs r0, 0xE
	strb r0, [r1]
	b _080C0DDE
	.align 2, 0
_080C0DB0: .4byte gStringVar1
_080C0DB4: .4byte gStringVar2
_080C0DB8: .4byte gStringVar3
_080C0DBC: .4byte gUnknown_020387E8
_080C0DC0:
	ldr r0, _080C0DF0 @ =gStringVar1
	adds r1, r4, 0x2
	ldrb r2, [r4, 0x1D]
	bl TVShowConvertInternationalString
	ldr r0, _080C0DF4 @ =gStringVar2
	ldrh r2, [r4, 0xA]
	movs r1, 0xB
	muls r1, r2
	ldr r2, _080C0DF8 @ =gSpeciesNames
	adds r1, r2
	bl StringCopy
	bl TVShowDone
_080C0DDE:
	ldr r0, _080C0DFC @ =gTVBravoTrainerBattleTowerTextGroup
	lsls r1, r5, 2
	adds r1, r0
	ldr r0, [r1]
	bl ShowFieldMessage
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080C0DF0: .4byte gStringVar1
_080C0DF4: .4byte gStringVar2
_080C0DF8: .4byte gSpeciesNames
_080C0DFC: .4byte gTVBravoTrainerBattleTowerTextGroup
	thumb_func_end DoTVShowBravoTrainerBattleTowerProfile

	thumb_func_start DoTVShowTodaysSmartShopper
DoTVShowTodaysSmartShopper: @ 80C0E00
	push {r4-r6,lr}
	ldr r0, _080C0E2C @ =gSpecialVar_0x8004
	ldrh r1, [r0]
	lsls r0, r1, 3
	adds r0, r1
	lsls r0, 2
	ldr r1, _080C0E30 @ =gSaveBlock1 + 0x2738
	adds r5, r0, r1
	ldr r1, _080C0E34 @ =gScriptResult
	movs r0, 0
	strh r0, [r1]
	ldr r0, _080C0E38 @ =gUnknown_020387E8
	ldrb r6, [r0]
	adds r2, r0, 0
	cmp r6, 0xC
	bls _080C0E22
	b _080C1014
_080C0E22:
	lsls r0, r6, 2
	ldr r1, _080C0E3C @ =_080C0E40
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_080C0E2C: .4byte gSpecialVar_0x8004
_080C0E30: .4byte gSaveBlock1 + 0x2738
_080C0E34: .4byte gScriptResult
_080C0E38: .4byte gUnknown_020387E8
_080C0E3C: .4byte _080C0E40
	.align 2, 0
_080C0E40:
	.4byte _080C0E74
	.4byte _080C0EB0
	.4byte _080C0EF8
	.4byte _080C0F0A
	.4byte _080C0EF8
	.4byte _080C0EF8
	.4byte _080C0F34
	.4byte _080C0F64
	.4byte _080C0F94
	.4byte _080C0FA0
	.4byte _080C0FAE
	.4byte _080C0FC0
	.4byte _080C1004
_080C0E74:
	ldr r0, _080C0E98 @ =gStringVar1
	adds r1, r5, 0
	adds r1, 0x13
	ldrb r2, [r5, 0x3]
	bl TVShowConvertInternationalString
	ldr r0, _080C0E9C @ =gStringVar2
	ldrb r1, [r5, 0x12]
	movs r2, 0
	bl sub_80FBFB4
	ldrh r0, [r5, 0xC]
	cmp r0, 0xFE
	bls _080C0EA4
	ldr r1, _080C0EA0 @ =gUnknown_020387E8
	movs r0, 0xB
	strb r0, [r1]
	b _080C1014
	.align 2, 0
_080C0E98: .4byte gStringVar1
_080C0E9C: .4byte gStringVar2
_080C0EA0: .4byte gUnknown_020387E8
_080C0EA4:
	ldr r1, _080C0EAC @ =gUnknown_020387E8
	movs r0, 0x1
	strb r0, [r1]
	b _080C1014
	.align 2, 0
_080C0EAC: .4byte gUnknown_020387E8
_080C0EB0:
	ldr r0, _080C0EEC @ =gStringVar1
	adds r1, r5, 0
	adds r1, 0x13
	ldrb r2, [r5, 0x3]
	bl TVShowConvertInternationalString
	ldr r4, _080C0EF0 @ =gStringVar2
	ldrh r0, [r5, 0x6]
	bl ItemId_GetItem
	adds r1, r0, 0
	adds r0, r4, 0
	bl StringCopy
	ldrh r1, [r5, 0xC]
	movs r0, 0x2
	bl sub_80BF088
	ldr r4, _080C0EF4 @ =gUnknown_020387E8
	bl Random
	ldrb r2, [r4]
	adds r2, 0x1
	lsls r0, 16
	lsrs r0, 16
	movs r1, 0x3
	ands r0, r1
	adds r0, r2
	strb r0, [r4]
	b _080C1014
	.align 2, 0
_080C0EEC: .4byte gStringVar1
_080C0EF0: .4byte gStringVar2
_080C0EF4: .4byte gUnknown_020387E8
_080C0EF8:
	ldrh r0, [r5, 0x8]
	cmp r0, 0
	beq _080C0F04
	movs r0, 0x6
	strb r0, [r2]
	b _080C1014
_080C0F04:
	movs r0, 0xA
	strb r0, [r2]
	b _080C1014
_080C0F0A:
	ldrh r1, [r5, 0xC]
	adds r1, 0x1
	movs r0, 0x2
	bl sub_80BF088
	ldrh r0, [r5, 0x8]
	cmp r0, 0
	beq _080C0F28
	ldr r1, _080C0F24 @ =gUnknown_020387E8
	movs r0, 0x6
	strb r0, [r1]
	b _080C1014
	.align 2, 0
_080C0F24: .4byte gUnknown_020387E8
_080C0F28:
	ldr r1, _080C0F30 @ =gUnknown_020387E8
	movs r0, 0xA
	strb r0, [r1]
	b _080C1014
	.align 2, 0
_080C0F30: .4byte gUnknown_020387E8
_080C0F34:
	ldr r4, _080C0F5C @ =gStringVar2
	ldrh r0, [r5, 0x8]
	bl ItemId_GetItem
	adds r1, r0, 0
	adds r0, r4, 0
	bl StringCopy
	ldrh r1, [r5, 0xE]
	movs r0, 0x2
	bl sub_80BF088
	ldrh r0, [r5, 0xA]
	cmp r0, 0
	beq _080C0F7C
	ldr r1, _080C0F60 @ =gUnknown_020387E8
	movs r0, 0x7
	strb r0, [r1]
	b _080C1014
	.align 2, 0
_080C0F5C: .4byte gStringVar2
_080C0F60: .4byte gUnknown_020387E8
_080C0F64:
	ldr r4, _080C0F8C @ =gStringVar2
	ldrh r0, [r5, 0xA]
	bl ItemId_GetItem
	adds r1, r0, 0
	adds r0, r4, 0
	bl StringCopy
	ldrh r1, [r5, 0x10]
	movs r0, 0x2
	bl sub_80BF088
_080C0F7C:
	ldrb r0, [r5, 0x2]
	cmp r0, 0x1
	beq _080C0FE2
	ldr r1, _080C0F90 @ =gUnknown_020387E8
	movs r0, 0x9
	strb r0, [r1]
	b _080C1014
	.align 2, 0
_080C0F8C: .4byte gStringVar2
_080C0F90: .4byte gUnknown_020387E8
_080C0F94:
	ldrh r0, [r5, 0xC]
	cmp r0, 0xFE
	bls _080C0FBA
	movs r0, 0xC
	strb r0, [r2]
	b _080C1014
_080C0FA0:
	movs r0, 0x1
	adds r1, r5, 0
	bl sub_80BF154
	bl TVShowDone
	b _080C1014
_080C0FAE:
	ldrb r0, [r5, 0x2]
	cmp r0, 0x1
	bne _080C0FBA
	movs r0, 0x8
	strb r0, [r2]
	b _080C1014
_080C0FBA:
	movs r0, 0x9
	strb r0, [r2]
	b _080C1014
_080C0FC0:
	ldr r0, _080C0FEC @ =gStringVar1
	adds r1, r5, 0
	adds r1, 0x13
	ldrb r2, [r5, 0x3]
	bl TVShowConvertInternationalString
	ldr r4, _080C0FF0 @ =gStringVar2
	ldrh r0, [r5, 0x6]
	bl ItemId_GetItem
	adds r1, r0, 0
	adds r0, r4, 0
	bl StringCopy
	ldrb r0, [r5, 0x2]
	cmp r0, 0x1
	bne _080C0FF8
_080C0FE2:
	ldr r1, _080C0FF4 @ =gUnknown_020387E8
	movs r0, 0x8
	strb r0, [r1]
	b _080C1014
	.align 2, 0
_080C0FEC: .4byte gStringVar1
_080C0FF0: .4byte gStringVar2
_080C0FF4: .4byte gUnknown_020387E8
_080C0FF8:
	ldr r1, _080C1000 @ =gUnknown_020387E8
	movs r0, 0xC
	strb r0, [r1]
	b _080C1014
	.align 2, 0
_080C1000: .4byte gUnknown_020387E8
_080C1004:
	ldr r0, _080C1028 @ =gStringVar1
	adds r1, r5, 0
	adds r1, 0x13
	ldrb r2, [r5, 0x3]
	bl TVShowConvertInternationalString
	bl TVShowDone
_080C1014:
	ldr r0, _080C102C @ =gTVSmartShopperTextGroup
	lsls r1, r6, 2
	adds r1, r0
	ldr r0, [r1]
	bl ShowFieldMessage
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_080C1028: .4byte gStringVar1
_080C102C: .4byte gTVSmartShopperTextGroup
	thumb_func_end DoTVShowTodaysSmartShopper

	.align 2, 0 @ Don't pad with nop.
