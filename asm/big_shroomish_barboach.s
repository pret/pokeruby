	.include "constants/gba_constants.inc"
	.include "constants/species_constants.inc"
	.include "asm/macros.inc"

	.syntax unified

	.text

	thumb_func_start GetBigMonSizeParams
GetBigMonSizeParams: @ 80C58C0
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	sub sp, 0x8
	adds r5, r0, 0
	movs r1, 0
	bl GetMonData
	lsls r0, 16
	str r0, [sp, 0x4]
	lsrs r0, 16
	str r0, [sp]
	adds r0, r5, 0
	movs r1, 0x27
	bl GetMonData
	adds r7, r0, 0
	movs r6, 0xF
	ands r7, r6
	adds r0, r5, 0
	movs r1, 0x28
	bl GetMonData
	mov r8, r0
	mov r1, r8
	ands r1, r6
	mov r8, r1
	adds r0, r5, 0
	movs r1, 0x29
	bl GetMonData
	mov r9, r0
	mov r3, r9
	ands r3, r6
	mov r9, r3
	adds r0, r5, 0
	movs r1, 0x2A
	bl GetMonData
	mov r10, r0
	ands r0, r6
	mov r10, r0
	adds r0, r5, 0
	movs r1, 0x2B
	bl GetMonData
	adds r4, r0, 0
	ands r4, r6
	adds r0, r5, 0
	movs r1, 0x2C
	bl GetMonData
	adds r2, r0, 0
	ands r2, r6
	mov r1, r8
	mov r3, r9
	eors r1, r3
	mov r8, r1
	mov r0, r8
	muls r0, r7
	movs r1, 0xFF
	ldr r3, [sp]
	ands r3, r1
	eors r0, r3
	eors r4, r2
	mov r1, r10
	muls r1, r4
	ldr r3, [sp, 0x4]
	lsrs r2, r3, 24
	eors r1, r2
	lsls r0, 8
	adds r0, r1
	add sp, 0x8
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r1}
	bx r1
	thumb_func_end GetBigMonSizeParams

	thumb_func_start TranslateBigMonSizeTableIndex
TranslateBigMonSizeTableIndex: @ 80C5964
	push {lr}
	lsls r0, 16
	lsrs r2, r0, 16
	movs r1, 0x1
	ldr r3, _080C5980 @ =gUnknown_083D180C
_080C596E:
	lsls r0, r1, 3
	adds r0, r3
	ldrh r0, [r0, 0x4]
	cmp r2, r0
	bcs _080C5984
	subs r0, r1, 0x1
	lsls r0, 24
	lsrs r0, 24
	b _080C5990
	.align 2, 0
_080C5980: .4byte gUnknown_083D180C
_080C5984:
	adds r0, r1, 0x1
	lsls r0, 24
	lsrs r1, r0, 24
	cmp r1, 0xE
	bls _080C596E
	adds r0, r1, 0
_080C5990:
	pop {r1}
	bx r1
	thumb_func_end TranslateBigMonSizeTableIndex

	thumb_func_start GetBigMonSize
GetBigMonSize: @ 80C5994
	push {r4-r7,lr}
	sub sp, 0x8
	adds r6, r1, 0
	lsls r0, 16
	lsrs r0, 16
	lsls r6, 16
	lsrs r6, 16
	bl SpeciesToNationalPokedexNum
	lsls r0, 16
	lsrs r0, 16
	movs r1, 0
	bl sub_8090D54
	lsls r0, 16
	lsrs r7, r0, 16
	adds r0, r6, 0
	bl TranslateBigMonSizeTableIndex
	lsls r0, 24
	ldr r1, _080C5A04 @ =gUnknown_083D180C
	lsrs r0, 21
	adds r0, r1
	ldrh r1, [r0]
	str r1, [sp]
	movs r2, 0
	str r2, [sp, 0x4]
	ldrb r2, [r0, 0x2]
	movs r3, 0
	ldrh r4, [r0, 0x4]
	movs r5, 0
	adds r0, r6, 0
	movs r1, 0
	subs r0, r4
	sbcs r1, r5
	bl __udivdi3
	ldr r2, [sp]
	ldr r3, [sp, 0x4]
	adds r2, r0
	adcs r3, r1
	str r2, [sp]
	str r3, [sp, 0x4]
	adds r0, r7, 0
	movs r1, 0
	bl __muldi3
	movs r2, 0xA
	movs r3, 0
	bl __udivdi3
	add sp, 0x8
	pop {r4-r7}
	pop {r1}
	bx r1
	.align 2, 0
_080C5A04: .4byte gUnknown_083D180C
	thumb_func_end GetBigMonSize

	thumb_func_start FormatBigMonSize
FormatBigMonSize: @ 80C5A08
	push {r4-r6,lr}
	sub sp, 0x4
	adds r6, r0, 0
	adds r5, r1, 0
	ldr r1, _080C5A78 @ =gUnknown_083D188C
	mov r0, sp
	movs r2, 0x2
	bl memcpy
	lsls r4, r5, 2
	adds r4, r5
	lsls r4, 1
	adds r0, r4, 0
	bl __floatsidf
	cmp r4, 0
	bge _080C5A32
	ldr r2, _080C5A7C @ =0x41f00000
	ldr r3, _080C5A80 @ =0x00000000
	bl __adddf3
_080C5A32:
	ldr r2, _080C5A84 @ =0x40396666
	ldr r3, _080C5A88 @ =0x66666666
	bl __divdf3
	bl __fixunsdfsi
	adds r5, r0, 0
	movs r1, 0xA
	bl __udivsi3
	adds r1, r0, 0
	adds r0, r6, 0
	movs r2, 0
	movs r3, 0x8
	bl ConvertIntToDecimalStringN
	adds r6, r0, 0
	mov r1, sp
	bl StringAppend
	adds r6, r0, 0
	adds r0, r5, 0
	movs r1, 0xA
	bl __umodsi3
	adds r1, r0, 0
	adds r0, r6, 0
	movs r2, 0
	movs r3, 0x1
	bl ConvertIntToDecimalStringN
	add sp, 0x4
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_080C5A78: .4byte gUnknown_083D188C
_080C5A7C: .4byte 0x41f00000
_080C5A80: .4byte 0x00000000
_080C5A84: .4byte 0x40396666
_080C5A88: .4byte 0x66666666
	thumb_func_end FormatBigMonSize

	thumb_func_start CompareMonSize
CompareMonSize: @ 80C5A8C
	push {r4-r7,lr}
	sub sp, 0x4
	adds r7, r1, 0
	lsls r0, 16
	lsrs r6, r0, 16
	ldr r1, _080C5AA4 @ =gScriptResult
	ldrh r0, [r1]
	cmp r0, 0xFF
	bne _080C5AA8
	movs r0, 0
	b _080C5B12
	.align 2, 0
_080C5AA4: .4byte gScriptResult
_080C5AA8:
	ldrh r1, [r1]
	movs r0, 0x64
	muls r1, r0
	ldr r0, _080C5AD0 @ =gPlayerParty
	adds r5, r1, r0
	adds r0, r5, 0
	movs r1, 0x2D
	bl GetMonData
	cmp r0, 0x1
	beq _080C5ACA
	adds r0, r5, 0
	movs r1, 0xB
	bl GetMonData
	cmp r0, r6
	beq _080C5AD4
_080C5ACA:
	movs r0, 0x1
	b _080C5B12
	.align 2, 0
_080C5AD0: .4byte gPlayerParty
_080C5AD4:
	mov r4, sp
	adds r0, r5, 0
	bl GetBigMonSizeParams
	strh r0, [r4]
	mov r0, sp
	ldrh r1, [r0]
	adds r0, r6, 0
	bl GetBigMonSize
	adds r5, r0, 0
	ldrh r1, [r7]
	adds r0, r6, 0
	bl GetBigMonSize
	adds r4, r0, 0
	ldr r0, _080C5B0C @ =gStringVar2
	adds r1, r5, 0
	bl FormatBigMonSize
	cmp r5, r4
	bls _080C5B10
	mov r0, sp
	ldrh r0, [r0]
	strh r0, [r7]
	movs r0, 0x3
	b _080C5B12
	.align 2, 0
_080C5B0C: .4byte gStringVar2
_080C5B10:
	movs r0, 0x2
_080C5B12:
	add sp, 0x4
	pop {r4-r7}
	pop {r1}
	bx r1
	thumb_func_end CompareMonSize

	thumb_func_start GetBigMonInfo
GetBigMonInfo: @ 80C5B1C
	push {r4,r5,lr}
	adds r4, r0, 0
	adds r5, r1, 0
	lsls r4, 16
	lsrs r4, 16
	ldrh r1, [r5]
	adds r0, r4, 0
	bl GetBigMonSize
	adds r1, r0, 0
	ldr r0, _080C5B58 @ =gStringVar3
	bl FormatBigMonSize
	ldr r0, _080C5B5C @ =gStringVar1
	movs r1, 0xB
	muls r1, r4
	ldr r2, _080C5B60 @ =gSpeciesNames
	adds r1, r2
	bl StringCopy
	ldrh r1, [r5]
	movs r0, 0x81
	lsls r0, 8
	cmp r1, r0
	bne _080C5B6C
	ldr r0, _080C5B64 @ =gStringVar2
	ldr r1, _080C5B68 @ =gOtherText_Marco
	bl StringCopy
	b _080C5B74
	.align 2, 0
_080C5B58: .4byte gStringVar3
_080C5B5C: .4byte gStringVar1
_080C5B60: .4byte gSpeciesNames
_080C5B64: .4byte gStringVar2
_080C5B68: .4byte gOtherText_Marco
_080C5B6C:
	ldr r0, _080C5B7C @ =gStringVar2
	ldr r1, _080C5B80 @ =gSaveBlock2
	bl StringCopy
_080C5B74:
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080C5B7C: .4byte gStringVar2
_080C5B80: .4byte gSaveBlock2
	thumb_func_end GetBigMonInfo

	thumb_func_start InitShroomishSizeRecord
InitShroomishSizeRecord: @ 80C5B84
	push {lr}
	ldr r0, _080C5B94 @ =0x00004047
	movs r1, 0x81
	lsls r1, 8
	bl VarSet
	pop {r0}
	bx r0
	.align 2, 0
_080C5B94: .4byte 0x00004047
	thumb_func_end InitShroomishSizeRecord

	thumb_func_start GetBigShroomishInfo
GetBigShroomishInfo: @ 80C5B98
	push {lr}
	ldr r0, _080C5BB0 @ =0x00004047
	bl GetVarPointer
	adds r1, r0, 0
	movs r0, 0x99
	lsls r0, 1
	bl GetBigMonInfo
	pop {r0}
	bx r0
	.align 2, 0
_080C5BB0: .4byte 0x00004047
	thumb_func_end GetBigShroomishInfo

	thumb_func_start CompareShroomishSize
CompareShroomishSize: @ 80C5BB4
	push {r4,lr}
	ldr r0, _080C5BD4 @ =0x00004047
	bl GetVarPointer
	adds r1, r0, 0
	ldr r4, _080C5BD8 @ =gScriptResult
	movs r0, 0x99
	lsls r0, 1
	bl CompareMonSize
	lsls r0, 24
	lsrs r0, 24
	strh r0, [r4]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080C5BD4: .4byte 0x00004047
_080C5BD8: .4byte gScriptResult
	thumb_func_end CompareShroomishSize

	thumb_func_start InitBarboachSizeRecord
InitBarboachSizeRecord: @ 80C5BDC
	push {lr}
	ldr r0, _080C5BEC @ =0x0000404f
	movs r1, 0x81
	lsls r1, 8
	bl VarSet
	pop {r0}
	bx r0
	.align 2, 0
_080C5BEC: .4byte 0x0000404f
	thumb_func_end InitBarboachSizeRecord

	thumb_func_start GetBigBarboachInfo
GetBigBarboachInfo: @ 80C5BF0
	push {lr}
	ldr r0, _080C5C04 @ =0x0000404f
	bl GetVarPointer
	adds r1, r0, 0
	ldr r0, _080C5C08 @ =0x00000143
	bl GetBigMonInfo
	pop {r0}
	bx r0
	.align 2, 0
_080C5C04: .4byte 0x0000404f
_080C5C08: .4byte 0x00000143
	thumb_func_end GetBigBarboachInfo

	thumb_func_start CompareBarboachSize
CompareBarboachSize: @ 80C5C0C
	push {r4,lr}
	ldr r0, _080C5C2C @ =0x0000404f
	bl GetVarPointer
	adds r1, r0, 0
	ldr r4, _080C5C30 @ =gScriptResult
	ldr r0, _080C5C34 @ =0x00000143
	bl CompareMonSize
	lsls r0, 24
	lsrs r0, 24
	strh r0, [r4]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080C5C2C: .4byte 0x0000404f
_080C5C30: .4byte gScriptResult
_080C5C34: .4byte 0x00000143
	thumb_func_end CompareBarboachSize

	thumb_func_start GiveSpecialRibbonToParty
GiveSpecialRibbonToParty: @ 80C5C38
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	sub sp, 0xC
	lsls r0, 24
	lsrs r6, r0, 24
	lsls r1, 24
	lsrs r5, r1, 24
	movs r7, 0
	add r4, sp, 0x8
	movs r0, 0x1
	strb r0, [r4]
	ldr r1, _080C5CC0 @ =gUnknown_083D188E
	mov r0, sp
	movs r2, 0x7
	bl memcpy
	mov r8, r4
	cmp r6, 0xA
	bhi _080C5CB2
	cmp r5, 0x40
	bhi _080C5CB2
	ldr r0, _080C5CC4 @ =gSaveBlock1
	ldr r1, _080C5CC8 @ =0x00003110
	adds r0, r1
	adds r0, r6, r0
	strb r5, [r0]
	movs r5, 0
_080C5C70:
	movs r0, 0x64
	adds r1, r5, 0
	muls r1, r0
	ldr r0, _080C5CCC @ =gPlayerParty
	adds r4, r1, r0
	adds r0, r4, 0
	movs r1, 0xB
	bl GetMonData
	cmp r0, 0
	beq _080C5CA2
	adds r0, r4, 0
	movs r1, 0x6
	bl GetMonData
	cmp r0, 0
	bne _080C5CA2
	mov r1, sp
	adds r0, r1, r6
	ldrb r1, [r0]
	adds r0, r4, 0
	mov r2, r8
	bl SetMonData
	movs r7, 0x1
_080C5CA2:
	adds r5, 0x1
	cmp r5, 0x5
	ble _080C5C70
	cmp r7, 0
	beq _080C5CB2
	ldr r0, _080C5CD0 @ =0x0000083b
	bl FlagSet
_080C5CB2:
	add sp, 0xC
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080C5CC0: .4byte gUnknown_083D188E
_080C5CC4: .4byte gSaveBlock1
_080C5CC8: .4byte 0x00003110
_080C5CCC: .4byte gPlayerParty
_080C5CD0: .4byte 0x0000083b
	thumb_func_end GiveSpecialRibbonToParty

	.align 2, 0 @ Don't pad with nop.
