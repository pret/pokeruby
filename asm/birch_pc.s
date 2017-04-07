	.include "constants/gba_constants.inc"
	.include "constants/species_constants.inc"
	.include "asm/macros.inc"

	.syntax unified

	.text
	
	thumb_func_start ScriptGetPokedexInfo
ScriptGetPokedexInfo: @ 810D43C
	push {lr}
	ldr r0, _0810D458 @ =gSpecialVar_0x8004
	ldrh r0, [r0]
	cmp r0, 0
	bne _0810D460
	movs r0, 0
	bl GetHoennPokedexCount
	ldr r1, _0810D45C @ =gSpecialVar_0x8005
	strh r0, [r1]
	movs r0, 0x1
	bl GetHoennPokedexCount
	b _0810D470
	.align 2, 0
_0810D458: .4byte gSpecialVar_0x8004
_0810D45C: .4byte gSpecialVar_0x8005
_0810D460:
	movs r0, 0
	bl GetNationalPokedexCount
	ldr r1, _0810D480 @ =gSpecialVar_0x8005
	strh r0, [r1]
	movs r0, 0x1
	bl GetNationalPokedexCount
_0810D470:
	ldr r1, _0810D484 @ =gSpecialVar_0x8006
	strh r0, [r1]
	bl IsNationalPokedexEnabled
	lsls r0, 16
	lsrs r0, 16
	pop {r1}
	bx r1
	.align 2, 0
_0810D480: .4byte gSpecialVar_0x8005
_0810D484: .4byte gSpecialVar_0x8006
	thumb_func_end ScriptGetPokedexInfo

	thumb_func_start GetPokedexRatingText
GetPokedexRatingText: @ 810D488
	push {lr}
	lsls r0, 16
	lsrs r0, 16
	cmp r0, 0x9
	bhi _0810D494
	b _0810D5EC
_0810D494:
	cmp r0, 0x13
	bhi _0810D4A0
	ldr r0, _0810D49C @ =gUnknown_081C456A
	b _0810D5F6
	.align 2, 0
_0810D49C: .4byte gUnknown_081C456A
_0810D4A0:
	cmp r0, 0x1D
	bhi _0810D4AC
	ldr r0, _0810D4A8 @ =gUnknown_081C45B0
	b _0810D5F6
	.align 2, 0
_0810D4A8: .4byte gUnknown_081C45B0
_0810D4AC:
	cmp r0, 0x27
	bhi _0810D4B8
	ldr r0, _0810D4B4 @ =gUnknown_081C45F9
	b _0810D5F6
	.align 2, 0
_0810D4B4: .4byte gUnknown_081C45F9
_0810D4B8:
	cmp r0, 0x31
	bhi _0810D4C4
	ldr r0, _0810D4C0 @ =gUnknown_081C4648
	b _0810D5F6
	.align 2, 0
_0810D4C0: .4byte gUnknown_081C4648
_0810D4C4:
	cmp r0, 0x3B
	bhi _0810D4D0
	ldr r0, _0810D4CC @ =gUnknown_081C467E
	b _0810D5F6
	.align 2, 0
_0810D4CC: .4byte gUnknown_081C467E
_0810D4D0:
	cmp r0, 0x45
	bhi _0810D4DC
	ldr r0, _0810D4D8 @ =gUnknown_081C46B9
	b _0810D5F6
	.align 2, 0
_0810D4D8: .4byte gUnknown_081C46B9
_0810D4DC:
	cmp r0, 0x4F
	bhi _0810D4E8
	ldr r0, _0810D4E4 @ =gUnknown_081C46FE
	b _0810D5F6
	.align 2, 0
_0810D4E4: .4byte gUnknown_081C46FE
_0810D4E8:
	cmp r0, 0x59
	bhi _0810D4F4
	ldr r0, _0810D4F0 @ =gUnknown_081C4747
	b _0810D5F6
	.align 2, 0
_0810D4F0: .4byte gUnknown_081C4747
_0810D4F4:
	cmp r0, 0x63
	bhi _0810D500
	ldr r0, _0810D4FC @ =gUnknown_081C4780
	b _0810D5F6
	.align 2, 0
_0810D4FC: .4byte gUnknown_081C4780
_0810D500:
	cmp r0, 0x6D
	bhi _0810D50C
	ldr r0, _0810D508 @ =gUnknown_081C47DF
	b _0810D5F6
	.align 2, 0
_0810D508: .4byte gUnknown_081C47DF
_0810D50C:
	cmp r0, 0x77
	bhi _0810D518
	ldr r0, _0810D514 @ =gUnknown_081C4828
	b _0810D5F6
	.align 2, 0
_0810D514: .4byte gUnknown_081C4828
_0810D518:
	cmp r0, 0x81
	bhi _0810D524
	ldr r0, _0810D520 @ =gUnknown_081C4863
	b _0810D5F6
	.align 2, 0
_0810D520: .4byte gUnknown_081C4863
_0810D524:
	cmp r0, 0x8B
	bhi _0810D530
	ldr r0, _0810D52C @ =gUnknown_081C489C
	b _0810D5F6
	.align 2, 0
_0810D52C: .4byte gUnknown_081C489C
_0810D530:
	cmp r0, 0x95
	bhi _0810D53C
	ldr r0, _0810D538 @ =gUnknown_081C48EB
	b _0810D5F6
	.align 2, 0
_0810D538: .4byte gUnknown_081C48EB
_0810D53C:
	cmp r0, 0x9F
	bhi _0810D548
	ldr r0, _0810D544 @ =gUnknown_081C4936
	b _0810D5F6
	.align 2, 0
_0810D544: .4byte gUnknown_081C4936
_0810D548:
	cmp r0, 0xA9
	bhi _0810D554
	ldr r0, _0810D550 @ =gUnknown_081C49A2
	b _0810D5F6
	.align 2, 0
_0810D550: .4byte gUnknown_081C49A2
_0810D554:
	cmp r0, 0xB3
	bhi _0810D560
	ldr r0, _0810D55C @ =gUnknown_081C4A06
	b _0810D5F6
	.align 2, 0
_0810D55C: .4byte gUnknown_081C4A06
_0810D560:
	cmp r0, 0xBD
	bhi _0810D56C
	ldr r0, _0810D568 @ =gUnknown_081C4A4F
	b _0810D5F6
	.align 2, 0
_0810D568: .4byte gUnknown_081C4A4F
_0810D56C:
	cmp r0, 0xC7
	bls _0810D5DA
	cmp r0, 0xC8
	bne _0810D5A8
	ldr r0, _0810D5A4 @ =0x00000199
	bl SpeciesToNationalPokedexNum
	lsls r0, 16
	lsrs r0, 16
	movs r1, 0x1
	bl sub_8090D90
	lsls r0, 24
	cmp r0, 0
	bne _0810D5DA
	movs r0, 0xCD
	lsls r0, 1
	bl SpeciesToNationalPokedexNum
	lsls r0, 16
	lsrs r0, 16
	movs r1, 0x1
	bl sub_8090D90
	lsls r0, 24
	cmp r0, 0
	bne _0810D5DA
	b _0810D5F4
	.align 2, 0
_0810D5A4: .4byte 0x00000199
_0810D5A8:
	cmp r0, 0xC9
	bne _0810D5E8
	ldr r0, _0810D5E0 @ =0x00000199
	bl SpeciesToNationalPokedexNum
	lsls r0, 16
	lsrs r0, 16
	movs r1, 0x1
	bl sub_8090D90
	lsls r0, 24
	cmp r0, 0
	beq _0810D5F4
	movs r0, 0xCD
	lsls r0, 1
	bl SpeciesToNationalPokedexNum
	lsls r0, 16
	lsrs r0, 16
	movs r1, 0x1
	bl sub_8090D90
	lsls r0, 24
	cmp r0, 0
	beq _0810D5F4
_0810D5DA:
	ldr r0, _0810D5E4 @ =gUnknown_081C4A91
	b _0810D5F6
	.align 2, 0
_0810D5E0: .4byte 0x00000199
_0810D5E4: .4byte gUnknown_081C4A91
_0810D5E8:
	cmp r0, 0xCA
	beq _0810D5F4
_0810D5EC:
	ldr r0, _0810D5F0 @ =gUnknown_081C4520
	b _0810D5F6
	.align 2, 0
_0810D5F0: .4byte gUnknown_081C4520
_0810D5F4:
	ldr r0, _0810D5FC @ =gUnknown_081C4ADA
_0810D5F6:
	pop {r1}
	bx r1
	.align 2, 0
_0810D5FC: .4byte gUnknown_081C4ADA
	thumb_func_end GetPokedexRatingText

	thumb_func_start ShowPokedexRatingMessage
ShowPokedexRatingMessage: @ 810D600
	push {lr}
	ldr r0, _0810D614 @ =gSpecialVar_0x8004
	ldrh r0, [r0]
	bl GetPokedexRatingText
	bl ShowFieldMessage
	pop {r0}
	bx r0
	.align 2, 0
_0810D614: .4byte gSpecialVar_0x8004
	thumb_func_end ShowPokedexRatingMessage

	.align 2, 0 @ Don't pad with nop.
