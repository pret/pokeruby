	.include "constants/gba_constants.inc"
	.include "include/macros.inc"

	.syntax unified

	.text

	thumb_func_start sub_809C04C
sub_809C04C: @ 809C04C
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	sub sp, 0x4
	adds r7, r0, 0
	lsls r1, 24
	lsrs r1, 24
	movs r0, 0
	str r0, [sp]
	ldr r0, _0809C0FC @ =gPokemonStorageSystemPtr
	ldr r6, [r0]
	ldr r2, _0809C100 @ =0x000011f2
	adds r2, r6
	mov r8, r2
	mov r0, sp
	ldrh r0, [r0]
	strh r0, [r2]
	cmp r1, 0
	bne _0809C120
	adds r0, r7, 0
	movs r1, 0x41
	bl GetMonData
	ldr r2, _0809C104 @ =0x000011f0
	adds r1, r6, r2
	strh r0, [r1]
	lsls r0, 16
	cmp r0, 0
	bne _0809C08C
	b _0809C1EC
_0809C08C:
	adds r0, r7, 0
	movs r1, 0x2D
	bl GetMonData
	ldr r2, _0809C108 @ =0x000011f9
	adds r1, r6, r2
	strb r0, [r1]
	ldr r0, _0809C10C @ =0x000011fa
	adds r4, r6, r0
	adds r0, r7, 0
	movs r1, 0x2
	adds r2, r4, 0
	bl GetMonData
	adds r0, r4, 0
	bl StringGetEnd10
	adds r0, r7, 0
	movs r1, 0x38
	bl GetMonData
	ldr r2, _0809C110 @ =0x000011f8
	adds r1, r6, r2
	strb r0, [r1]
	adds r0, r7, 0
	movs r1, 0x8
	bl GetMonData
	ldr r2, _0809C114 @ =0x000011f7
	adds r1, r6, r2
	strb r0, [r1]
	adds r0, r7, 0
	movs r1, 0
	bl GetMonData
	ldr r2, _0809C118 @ =0x000011ec
	adds r1, r6, r2
	str r0, [r1]
	adds r0, r7, 0
	bl GetMonSpritePal
	ldr r2, _0809C11C @ =0x000011e8
	adds r1, r6, r2
	str r0, [r1]
	adds r0, r7, 0
	bl GetMonGender
	lsls r0, 24
	lsrs r0, 24
	str r0, [sp]
	adds r0, r7, 0
	movs r1, 0xC
	bl GetMonData
	b _0809C1B2
	.align 2, 0
_0809C0FC: .4byte gPokemonStorageSystemPtr
_0809C100: .4byte 0x000011f2
_0809C104: .4byte 0x000011f0
_0809C108: .4byte 0x000011f9
_0809C10C: .4byte 0x000011fa
_0809C110: .4byte 0x000011f8
_0809C114: .4byte 0x000011f7
_0809C118: .4byte 0x000011ec
_0809C11C: .4byte 0x000011e8
_0809C120:
	cmp r1, 0x1
	bne _0809C1D4
	adds r0, r7, 0
	movs r1, 0x41
	bl GetBoxMonData
	ldr r2, _0809C1B8 @ =0x000011f0
	adds r5, r6, r2
	strh r0, [r5]
	lsls r0, 16
	cmp r0, 0
	beq _0809C1EC
	adds r0, r7, 0
	movs r1, 0x1
	bl GetBoxMonData
	mov r9, r0
	adds r0, r7, 0
	movs r1, 0x2D
	bl GetBoxMonData
	ldr r2, _0809C1BC @ =0x000011f9
	adds r1, r6, r2
	strb r0, [r1]
	ldr r0, _0809C1C0 @ =0x000011fa
	adds r4, r6, r0
	adds r0, r7, 0
	movs r1, 0x2
	adds r2, r4, 0
	bl GetBoxMonData
	adds r0, r4, 0
	bl StringGetEnd10
	adds r0, r7, 0
	bl GetLevelFromBoxMonExp
	ldr r2, _0809C1C4 @ =0x000011f8
	adds r1, r6, r2
	strb r0, [r1]
	adds r0, r7, 0
	movs r1, 0x8
	bl GetBoxMonData
	ldr r2, _0809C1C8 @ =0x000011f7
	adds r1, r6, r2
	strb r0, [r1]
	adds r0, r7, 0
	movs r1, 0
	bl GetBoxMonData
	adds r2, r0, 0
	ldr r0, _0809C1CC @ =0x000011ec
	adds r4, r6, r0
	str r2, [r4]
	ldrh r0, [r5]
	mov r1, r9
	bl GetMonSpritePalFromOtIdPersonality
	ldr r2, _0809C1D0 @ =0x000011e8
	adds r1, r6, r2
	str r0, [r1]
	ldrh r0, [r5]
	ldr r1, [r4]
	bl GetGenderFromSpeciesAndPersonality
	lsls r0, 24
	lsrs r0, 24
	str r0, [sp]
	adds r0, r7, 0
	movs r1, 0xC
	bl GetBoxMonData
_0809C1B2:
	mov r1, r8
	strh r0, [r1]
	b _0809C1DE
	.align 2, 0
_0809C1B8: .4byte 0x000011f0
_0809C1BC: .4byte 0x000011f9
_0809C1C0: .4byte 0x000011fa
_0809C1C4: .4byte 0x000011f8
_0809C1C8: .4byte 0x000011f7
_0809C1CC: .4byte 0x000011ec
_0809C1D0: .4byte 0x000011e8
_0809C1D4:
	ldr r2, _0809C220 @ =0x000011f0
	adds r0, r6, r2
	mov r1, sp
	ldrh r1, [r1]
	strh r1, [r0]
_0809C1DE:
	ldr r0, _0809C224 @ =gPokemonStorageSystemPtr
	ldr r4, [r0]
	ldr r2, _0809C220 @ =0x000011f0
	adds r0, r4, r2
	ldrh r1, [r0]
	cmp r1, 0
	bne _0809C23C
_0809C1EC:
	ldr r0, _0809C224 @ =gPokemonStorageSystemPtr
	ldr r1, [r0]
	ldr r0, _0809C228 @ =0x000011fa
	adds r2, r1, r0
	movs r0, 0xFF
	strb r0, [r2]
	ldr r0, _0809C22C @ =0x0000120f
	adds r2, r1, r0
	movs r0, 0x1
	negs r0, r0
	strb r0, [r2]
	ldr r0, _0809C230 @ =0x00001234
	adds r2, r1, r0
	movs r0, 0x1
	negs r0, r0
	strb r0, [r2]
	ldr r0, _0809C234 @ =0x00001259
	adds r2, r1, r0
	movs r0, 0x1
	negs r0, r0
	strb r0, [r2]
	ldr r2, _0809C238 @ =0x0000127a
	adds r1, r2
	strb r0, [r1]
	b _0809C43E
	.align 2, 0
_0809C220: .4byte 0x000011f0
_0809C224: .4byte gPokemonStorageSystemPtr
_0809C228: .4byte 0x000011fa
_0809C22C: .4byte 0x0000120f
_0809C230: .4byte 0x00001234
_0809C234: .4byte 0x00001259
_0809C238: .4byte 0x0000127a
_0809C23C:
	ldr r2, _0809C28C @ =0x000011f9
	adds r0, r4, r2
	ldrb r0, [r0]
	cmp r0, 0
	beq _0809C2A4
	ldr r0, _0809C290 @ =0x0000120f
	adds r7, r4, r0
	movs r0, 0xFC
	strb r0, [r7]
	movs r0, 0x4
	strb r0, [r7, 0x1]
	movs r0, 0xF
	strb r0, [r7, 0x2]
	movs r0, 0
	strb r0, [r7, 0x3]
	movs r0, 0x1
	strb r0, [r7, 0x4]
	ldr r1, _0809C294 @ =0x00001214
	adds r7, r4, r1
	adds r2, 0x1
	adds r1, r4, r2
	adds r0, r7, 0
	bl StringCopy
	ldr r0, _0809C298 @ =0x00001234
	adds r1, r4, r0
	movs r0, 0xFF
	strb r0, [r1]
	ldr r2, _0809C29C @ =0x00001259
	adds r1, r4, r2
	movs r0, 0x1
	negs r0, r0
	strb r0, [r1]
	ldr r0, _0809C2A0 @ =0x0000127a
	adds r1, r4, r0
	movs r0, 0x1
	negs r0, r0
	strb r0, [r1]
	b _0809C43E
	.align 2, 0
_0809C28C: .4byte 0x000011f9
_0809C290: .4byte 0x0000120f
_0809C294: .4byte 0x00001214
_0809C298: .4byte 0x00001234
_0809C29C: .4byte 0x00001259
_0809C2A0: .4byte 0x0000127a
_0809C2A4:
	cmp r1, 0x20
	beq _0809C2AC
	cmp r1, 0x1D
	bne _0809C2B0
_0809C2AC:
	movs r1, 0xFF
	str r1, [sp]
_0809C2B0:
	ldr r0, _0809C388 @ =gPokemonStorageSystemPtr
	ldr r4, [r0]
	ldr r2, _0809C38C @ =0x0000120f
	adds r7, r4, r2
	movs r0, 0xFC
	mov r9, r0
	strb r0, [r7]
	movs r1, 0x4
	mov r8, r1
	strb r1, [r7, 0x1]
	movs r2, 0xF
	strb r2, [r7, 0x2]
	movs r0, 0
	strb r0, [r7, 0x3]
	movs r6, 0x1
	strb r6, [r7, 0x4]
	ldr r1, _0809C390 @ =0x00001214
	adds r7, r4, r1
	ldr r2, _0809C394 @ =0x000011fa
	adds r1, r4, r2
	adds r0, r7, 0
	bl StringCopy
	ldr r0, _0809C398 @ =0x00001234
	adds r7, r4, r0
	mov r1, r9
	strb r1, [r7]
	mov r2, r8
	strb r2, [r7, 0x1]
	movs r0, 0xF
	strb r0, [r7, 0x2]
	movs r1, 0
	strb r1, [r7, 0x3]
	strb r6, [r7, 0x4]
	mov r2, r9
	strb r2, [r7, 0x5]
	movs r0, 0x13
	mov r10, r0
	strb r0, [r7, 0x6]
	movs r1, 0x7
	strb r1, [r7, 0x7]
	movs r0, 0xBA
	strb r0, [r7, 0x8]
	ldr r2, _0809C39C @ =0x0000123d
	adds r7, r4, r2
	ldr r1, _0809C3A0 @ =0x000011f0
	adds r0, r4, r1
	ldrh r1, [r0]
	movs r0, 0xB
	muls r1, r0
	ldr r0, _0809C3A4 @ =gSpeciesNames
	adds r1, r0
	adds r0, r7, 0
	bl StringCopy
	adds r7, r0, 0
	mov r2, r9
	strb r2, [r7]
	mov r0, r10
	strb r0, [r7, 0x1]
	movs r0, 0x50
	strb r0, [r7, 0x2]
	movs r0, 0xFF
	strb r0, [r7, 0x3]
	ldr r1, _0809C3A8 @ =0x00001259
	adds r7, r4, r1
	strb r2, [r7]
	mov r2, r8
	strb r2, [r7, 0x1]
	movs r0, 0xF
	strb r0, [r7, 0x2]
	movs r1, 0
	strb r1, [r7, 0x3]
	strb r6, [r7, 0x4]
	mov r2, r9
	strb r2, [r7, 0x5]
	mov r0, r10
	strb r0, [r7, 0x6]
	movs r6, 0x8
	strb r6, [r7, 0x7]
	ldr r1, _0809C3AC @ =0x00001261
	adds r7, r4, r1
	movs r0, 0x34
	strb r0, [r7]
	ldr r2, _0809C3B0 @ =0x00001262
	adds r7, r4, r2
	ldr r0, _0809C3B4 @ =0x000011f8
	adds r4, r0
	ldrb r1, [r4]
	adds r0, r7, 0
	movs r2, 0x22
	movs r3, 0x1
	bl sub_8072C14
	adds r7, r0, 0
	mov r1, r9
	strb r1, [r7]
	movs r0, 0x11
	strb r0, [r7, 0x1]
	strb r6, [r7, 0x2]
	adds r7, 0x3
	ldr r2, [sp]
	cmp r2, 0
	beq _0809C3B8
	cmp r2, 0xFE
	beq _0809C3D0
	b _0809C3EA
	.align 2, 0
_0809C388: .4byte gPokemonStorageSystemPtr
_0809C38C: .4byte 0x0000120f
_0809C390: .4byte 0x00001214
_0809C394: .4byte 0x000011fa
_0809C398: .4byte 0x00001234
_0809C39C: .4byte 0x0000123d
_0809C3A0: .4byte 0x000011f0
_0809C3A4: .4byte gSpeciesNames
_0809C3A8: .4byte 0x00001259
_0809C3AC: .4byte 0x00001261
_0809C3B0: .4byte 0x00001262
_0809C3B4: .4byte 0x000011f8
_0809C3B8:
	mov r0, r9
	strb r0, [r7]
	mov r1, r8
	strb r1, [r7, 0x1]
	strb r1, [r7, 0x2]
	mov r2, sp
	ldrb r2, [r2]
	strb r2, [r7, 0x3]
	movs r0, 0x5
	strb r0, [r7, 0x4]
	movs r0, 0xB5
	b _0809C3E6
_0809C3D0:
	mov r0, r9
	strb r0, [r7]
	mov r1, r8
	strb r1, [r7, 0x1]
	movs r0, 0x6
	strb r0, [r7, 0x2]
	movs r2, 0
	strb r2, [r7, 0x3]
	movs r0, 0x7
	strb r0, [r7, 0x4]
	movs r0, 0xB6
_0809C3E6:
	strb r0, [r7, 0x5]
	adds r7, 0x6
_0809C3EA:
	movs r5, 0xFF
	strb r5, [r7]
	ldr r0, _0809C450 @ =gPokemonStorageSystemPtr
	ldr r2, [r0]
	ldr r1, _0809C454 @ =0x0000127a
	adds r7, r2, r1
	ldr r0, _0809C458 @ =0x000011f2
	adds r3, r2, r0
	ldrh r0, [r3]
	cmp r0, 0
	beq _0809C43C
	movs r4, 0xFC
	strb r4, [r7]
	movs r1, 0x4
	strb r1, [r7, 0x1]
	movs r0, 0xF
	strb r0, [r7, 0x2]
	movs r0, 0
	strb r0, [r7, 0x3]
	movs r0, 0x1
	strb r0, [r7, 0x4]
	ldr r0, _0809C45C @ =0x0000127f
	adds r7, r2, r0
	strb r4, [r7]
	movs r0, 0x6
	strb r0, [r7, 0x1]
	strb r1, [r7, 0x2]
	ldr r1, _0809C460 @ =0x00001282
	adds r7, r2, r1
	ldrh r0, [r3]
	bl ItemId_GetItem
	adds r1, r0, 0
	adds r0, r7, 0
	bl StringCopy
	adds r7, r0, 0
	strb r4, [r7]
	movs r0, 0x7
	strb r0, [r7, 0x1]
	adds r7, 0x2
_0809C43C:
	strb r5, [r7]
_0809C43E:
	add sp, 0x4
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_0809C450: .4byte gPokemonStorageSystemPtr
_0809C454: .4byte 0x0000127a
_0809C458: .4byte 0x000011f2
_0809C45C: .4byte 0x0000127f
_0809C460: .4byte 0x00001282
	thumb_func_end sub_809C04C

	thumb_func_start sub_809C464
sub_809C464: @ 809C464
	push {r4-r7,lr}
	mov r7, r9
	mov r6, r8
	push {r6,r7}
	ldr r0, _0809C4D8 @ =gUnknown_020384E4
	ldrb r0, [r0]
	mov r8, r0
	ldr r2, _0809C4DC @ =gUnknown_020384E5
	ldrb r4, [r2]
	ldr r0, _0809C4E0 @ =gPokemonStorageSystemPtr
	ldr r1, [r0]
	ldr r0, _0809C4E4 @ =0x000011de
	adds r7, r1, r0
	movs r0, 0
	strb r0, [r7]
	ldr r3, _0809C4E8 @ =0x000011df
	adds r5, r1, r3
	strb r0, [r5]
	adds r3, 0x4
	adds r6, r1, r3
	strb r0, [r6]
	ldr r0, _0809C4EC @ =gMain
	mov r12, r0
	ldrh r1, [r0, 0x30]
	movs r0, 0x40
	ands r0, r1
	adds r3, r2, 0
	cmp r0, 0
	beq _0809C4A0
	b _0809C62A
_0809C4A0:
	movs r0, 0x80
	ands r0, r1
	cmp r0, 0
	beq _0809C4F0
	movs r1, 0x1
	mov r9, r1
	lsls r0, r4, 24
	movs r3, 0xC0
	lsls r3, 19
	adds r0, r3
	lsrs r4, r0, 24
	asrs r0, 24
	cmp r0, 0x1D
	bgt _0809C4BE
	b _0809C648
_0809C4BE:
	movs r1, 0x3
	mov r8, r1
	subs r0, 0x1E
	lsls r0, 24
	asrs r0, 24
	bl __divsi3
	lsls r0, 24
	lsrs r4, r0, 24
	mov r3, r9
	strb r3, [r7]
	strb r3, [r6]
	b _0809C648
	.align 2, 0
_0809C4D8: .4byte gUnknown_020384E4
_0809C4DC: .4byte gUnknown_020384E5
_0809C4E0: .4byte gPokemonStorageSystemPtr
_0809C4E4: .4byte 0x000011de
_0809C4E8: .4byte 0x000011df
_0809C4EC: .4byte gMain
_0809C4F0:
	movs r0, 0x20
	ands r0, r1
	cmp r0, 0
	beq _0809C524
	movs r0, 0x1
	mov r9, r0
	movs r0, 0
	ldrsb r0, [r3, r0]
	movs r1, 0x6
	bl __modsi3
	lsls r0, 24
	cmp r0, 0
	beq _0809C514
	lsls r0, r4, 24
	movs r1, 0xFF
	lsls r1, 24
	b _0809C63C
_0809C514:
	movs r0, 0xFF
	strb r0, [r5]
	lsls r0, r4, 24
	movs r3, 0xA0
	lsls r3, 19
	adds r0, r3
	lsrs r4, r0, 24
	b _0809C648
_0809C524:
	movs r0, 0x10
	ands r0, r1
	cmp r0, 0
	beq _0809C554
	movs r0, 0x1
	mov r9, r0
	movs r0, 0
	ldrsb r0, [r3, r0]
	adds r0, 0x1
	movs r1, 0x6
	bl __modsi3
	cmp r0, 0
	beq _0809C548
	lsls r0, r4, 24
	movs r1, 0x80
	lsls r1, 17
	b _0809C63C
_0809C548:
	mov r3, r9
	strb r3, [r5]
	lsls r0, r4, 24
	movs r1, 0xFB
	lsls r1, 24
	b _0809C63C
_0809C554:
	mov r3, r12
	ldrh r1, [r3, 0x2E]
	movs r0, 0x8
	ands r0, r1
	cmp r0, 0
	beq _0809C56A
	movs r0, 0x1
	mov r9, r0
	movs r1, 0x2
	mov r8, r1
	b _0809C646
_0809C56A:
	movs r0, 0x1
	ands r0, r1
	cmp r0, 0
	beq _0809C5D4
	bl sub_809CAB0
	lsls r0, 24
	cmp r0, 0
	beq _0809C5D4
	ldr r0, _0809C588 @ =gUnknown_020384E9
	ldrb r0, [r0]
	cmp r0, 0
	bne _0809C58C
	movs r0, 0x8
	b _0809C658
	.align 2, 0
_0809C588: .4byte gUnknown_020384E9
_0809C58C:
	movs r0, 0
	bl sub_809CE4C
	subs r0, 0x1
	lsls r0, 24
	asrs r0, 24
	cmp r0, 0x4
	bhi _0809C5D4
	lsls r0, 2
	ldr r1, _0809C5A8 @ =_0809C5AC
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_0809C5A8: .4byte _0809C5AC
	.align 2, 0
_0809C5AC:
	.4byte _0809C5C0
	.4byte _0809C5C4
	.4byte _0809C5C8
	.4byte _0809C5CC
	.4byte _0809C5D0
_0809C5C0:
	movs r0, 0xB
	b _0809C658
_0809C5C4:
	movs r0, 0xC
	b _0809C658
_0809C5C8:
	movs r0, 0xD
	b _0809C658
_0809C5CC:
	movs r0, 0xE
	b _0809C658
_0809C5D0:
	movs r0, 0xF
	b _0809C658
_0809C5D4:
	ldr r2, _0809C5E4 @ =gMain
	ldrh r1, [r2, 0x2E]
	movs r0, 0x2
	ands r0, r1
	cmp r0, 0
	beq _0809C5E8
	movs r0, 0x10
	b _0809C658
	.align 2, 0
_0809C5E4: .4byte gMain
_0809C5E8:
	ldr r0, _0809C600 @ =gSaveBlock2
	ldrb r0, [r0, 0x13]
	cmp r0, 0x1
	bne _0809C612
	ldrh r1, [r2, 0x2C]
	movs r0, 0x80
	lsls r0, 2
	ands r0, r1
	cmp r0, 0
	beq _0809C604
	movs r0, 0xA
	b _0809C658
	.align 2, 0
_0809C600: .4byte gSaveBlock2
_0809C604:
	movs r0, 0x80
	lsls r0, 1
	ands r0, r1
	cmp r0, 0
	beq _0809C612
	movs r0, 0x9
	b _0809C658
_0809C612:
	ldrh r1, [r2, 0x2E]
	movs r0, 0x4
	ands r0, r1
	cmp r0, 0
	beq _0809C624
	bl sub_809CD88
	movs r0, 0
	b _0809C658
_0809C624:
	movs r3, 0
	mov r9, r3
	b _0809C656
_0809C62A:
	movs r0, 0x1
	mov r9, r0
	movs r0, 0
	ldrsb r0, [r2, r0]
	cmp r0, 0x5
	ble _0809C642
	lsls r0, r4, 24
	movs r1, 0xFA
	lsls r1, 24
_0809C63C:
	adds r0, r1
	lsrs r4, r0, 24
	b _0809C648
_0809C642:
	movs r3, 0x2
	mov r8, r3
_0809C646:
	movs r4, 0
_0809C648:
	mov r0, r9
	cmp r0, 0
	beq _0809C656
	mov r0, r8
	adds r1, r4, 0
	bl sub_809AF18
_0809C656:
	mov r0, r9
_0809C658:
	pop {r3,r4}
	mov r8, r3
	mov r9, r4
	pop {r4-r7}
	pop {r1}
	bx r1
	thumb_func_end sub_809C464

	thumb_func_start sub_809C664
sub_809C664: @ 809C664
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	ldr r0, _0809C6D8 @ =gUnknown_020384E4
	ldrb r0, [r0]
	mov r10, r0
	ldr r7, _0809C6DC @ =gUnknown_020384E5
	ldrb r4, [r7]
	ldr r2, _0809C6E0 @ =gPokemonStorageSystemPtr
	ldr r5, [r2]
	ldr r1, _0809C6E4 @ =0x000011df
	adds r0, r5, r1
	movs r1, 0
	strb r1, [r0]
	ldr r3, _0809C6E8 @ =0x000011de
	adds r0, r5, r3
	strb r1, [r0]
	adds r3, 0x5
	adds r0, r5, r3
	strb r1, [r0]
	mov r9, r1
	mov r8, r1
	ldr r1, _0809C6EC @ =gMain
	ldrh r3, [r1, 0x30]
	movs r0, 0x40
	ands r0, r3
	adds r6, r7, 0
	mov r12, r2
	adds r2, r1, 0
	cmp r0, 0
	beq _0809C6A8
	b _0809C81C
_0809C6A8:
	movs r0, 0x80
	ands r0, r3
	cmp r0, 0
	beq _0809C6F0
	lsls r0, r4, 24
	movs r1, 0x80
	lsls r1, 17
	adds r0, r1
	lsrs r4, r0, 24
	asrs r0, 24
	cmp r0, 0x6
	ble _0809C6C2
	movs r4, 0
_0809C6C2:
	lsls r0, r4, 24
	asrs r0, 24
	movs r1, 0
	ldrsb r1, [r6, r1]
	cmp r0, r1
	bne _0809C6D0
	b _0809C83C
_0809C6D0:
	movs r2, 0x1
	mov r8, r2
	b _0809C842
	.align 2, 0
_0809C6D8: .4byte gUnknown_020384E4
_0809C6DC: .4byte gUnknown_020384E5
_0809C6E0: .4byte gPokemonStorageSystemPtr
_0809C6E4: .4byte 0x000011df
_0809C6E8: .4byte 0x000011de
_0809C6EC: .4byte gMain
_0809C6F0:
	movs r0, 0x20
	ands r0, r3
	cmp r0, 0
	beq _0809C714
	ldrb r1, [r6]
	movs r0, 0
	ldrsb r0, [r6, r0]
	cmp r0, 0
	beq _0809C714
	movs r3, 0x1
	mov r8, r3
	ldr r2, _0809C710 @ =0x000011e2
	adds r0, r5, r2
	strb r1, [r0]
	movs r4, 0
	b _0809C83C
	.align 2, 0
_0809C710: .4byte 0x000011e2
_0809C714:
	ldrh r1, [r2, 0x30]
	movs r0, 0x10
	ands r0, r1
	cmp r0, 0
	beq _0809C748
	movs r0, 0
	ldrsb r0, [r6, r0]
	cmp r0, 0
	bne _0809C73C
	movs r3, 0x1
	mov r8, r3
	mov r1, r12
	ldr r0, [r1]
	ldr r2, _0809C738 @ =0x000011e2
	adds r0, r2
	ldrb r4, [r0]
	b _0809C83C
	.align 2, 0
_0809C738: .4byte 0x000011e2
_0809C73C:
	movs r3, 0x6
	mov r8, r3
	movs r0, 0
	mov r10, r0
	movs r4, 0
	b _0809C83C
_0809C748:
	ldrh r1, [r2, 0x2E]
	movs r0, 0x1
	ands r0, r1
	cmp r0, 0
	beq _0809C7D0
	movs r0, 0
	ldrsb r0, [r6, r0]
	cmp r0, 0x6
	bne _0809C76E
	mov r1, r12
	ldr r0, [r1]
	ldrb r0, [r0, 0x5]
	cmp r0, 0x1
	bne _0809C768
	movs r0, 0x4
	b _0809C84C
_0809C768:
	movs r2, 0x1
	mov r9, r2
	b _0809C7D0
_0809C76E:
	bl sub_809CAB0
	lsls r0, 24
	cmp r0, 0
	beq _0809C7D0
	ldr r0, _0809C784 @ =gUnknown_020384E9
	ldrb r0, [r0]
	cmp r0, 0
	bne _0809C788
	movs r0, 0x8
	b _0809C84C
	.align 2, 0
_0809C784: .4byte gUnknown_020384E9
_0809C788:
	movs r0, 0
	bl sub_809CE4C
	subs r0, 0x1
	lsls r0, 24
	asrs r0, 24
	cmp r0, 0x4
	bhi _0809C7D0
	lsls r0, 2
	ldr r1, _0809C7A4 @ =_0809C7A8
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_0809C7A4: .4byte _0809C7A8
	.align 2, 0
_0809C7A8:
	.4byte _0809C7BC
	.4byte _0809C7C0
	.4byte _0809C7C4
	.4byte _0809C7C8
	.4byte _0809C7CC
_0809C7BC:
	movs r0, 0xB
	b _0809C84C
_0809C7C0:
	movs r0, 0xC
	b _0809C84C
_0809C7C4:
	movs r0, 0xD
	b _0809C84C
_0809C7C8:
	movs r0, 0xE
	b _0809C84C
_0809C7CC:
	movs r0, 0xF
	b _0809C84C
_0809C7D0:
	ldr r2, _0809C7EC @ =gMain
	ldrh r1, [r2, 0x2E]
	movs r0, 0x2
	ands r0, r1
	cmp r0, 0
	beq _0809C7F8
	ldr r0, _0809C7F0 @ =gPokemonStorageSystemPtr
	ldr r0, [r0]
	ldrb r0, [r0, 0x5]
	cmp r0, 0x1
	bne _0809C7F4
	movs r0, 0x10
	b _0809C84C
	.align 2, 0
_0809C7EC: .4byte gMain
_0809C7F0: .4byte gPokemonStorageSystemPtr
_0809C7F4:
	movs r3, 0x1
	mov r9, r3
_0809C7F8:
	mov r0, r9
	cmp r0, 0
	beq _0809C80A
	movs r1, 0x6
	mov r8, r1
	movs r2, 0
	mov r10, r2
	movs r4, 0
	b _0809C83C
_0809C80A:
	ldrh r1, [r2, 0x2E]
	movs r0, 0x4
	ands r0, r1
	cmp r0, 0
	beq _0809C83C
	bl sub_809CD88
	movs r0, 0
	b _0809C84C
_0809C81C:
	lsls r0, r4, 24
	movs r3, 0xFF
	lsls r3, 24
	adds r0, r3
	lsrs r4, r0, 24
	cmp r0, 0
	bge _0809C82C
	movs r4, 0x6
_0809C82C:
	lsls r0, r4, 24
	asrs r0, 24
	movs r1, 0
	ldrsb r1, [r7, r1]
	cmp r0, r1
	beq _0809C83C
	movs r0, 0x1
	mov r8, r0
_0809C83C:
	mov r1, r8
	cmp r1, 0
	beq _0809C84A
_0809C842:
	mov r0, r10
	adds r1, r4, 0
	bl sub_809AF18
_0809C84A:
	mov r0, r8
_0809C84C:
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r1}
	bx r1
	thumb_func_end sub_809C664

	thumb_func_start sub_809C85C
sub_809C85C: @ 809C85C
	push {r4-r6,lr}
	ldr r0, _0809C894 @ =gPokemonStorageSystemPtr
	ldr r2, [r0]
	ldr r1, _0809C898 @ =0x000011df
	adds r0, r2, r1
	movs r1, 0
	strb r1, [r0]
	ldr r3, _0809C89C @ =0x000011de
	adds r0, r2, r3
	strb r1, [r0]
	ldr r0, _0809C8A0 @ =0x000011e3
	adds r2, r0
	strb r1, [r2]
	ldr r1, _0809C8A4 @ =gMain
	ldrh r3, [r1, 0x30]
	movs r0, 0x40
	ands r0, r3
	cmp r0, 0
	bne _0809C91A
	movs r0, 0x80
	ands r0, r3
	cmp r0, 0
	beq _0809C8A8
	movs r4, 0x1
	movs r0, 0
	movs r5, 0x2
	b _0809C922
	.align 2, 0
_0809C894: .4byte gPokemonStorageSystemPtr
_0809C898: .4byte 0x000011df
_0809C89C: .4byte 0x000011de
_0809C8A0: .4byte 0x000011e3
_0809C8A4: .4byte gMain
_0809C8A8:
	ldrh r2, [r1, 0x2C]
	movs r0, 0x20
	ands r0, r2
	cmp r0, 0
	bne _0809C8CC
	movs r0, 0x10
	ands r0, r2
	cmp r0, 0
	bne _0809C8DE
	ldr r0, _0809C8D0 @ =gSaveBlock2
	ldrb r0, [r0, 0x13]
	cmp r0, 0x1
	bne _0809C8E2
	movs r0, 0x80
	lsls r0, 2
	ands r0, r2
	cmp r0, 0
	beq _0809C8D4
_0809C8CC:
	movs r0, 0xA
	b _0809C93E
	.align 2, 0
_0809C8D0: .4byte gSaveBlock2
_0809C8D4:
	movs r0, 0x80
	lsls r0, 1
	ands r0, r2
	cmp r0, 0
	beq _0809C8E2
_0809C8DE:
	movs r0, 0x9
	b _0809C93E
_0809C8E2:
	ldrh r1, [r1, 0x2E]
	movs r0, 0x1
	ands r0, r1
	cmp r0, 0
	beq _0809C8FA
	movs r0, 0
	bl sub_809A860
	bl sub_809CA8C
	movs r0, 0x7
	b _0809C93E
_0809C8FA:
	movs r0, 0x2
	ands r0, r1
	cmp r0, 0
	beq _0809C906
	movs r0, 0x10
	b _0809C93E
_0809C906:
	movs r0, 0x4
	ands r0, r1
	cmp r0, 0
	beq _0809C916
	bl sub_809CD88
	movs r0, 0
	b _0809C93E
_0809C916:
	movs r4, 0
	b _0809C93C
_0809C91A:
	movs r4, 0x1
	movs r0, 0x3
	movs r5, 0
	strb r4, [r2]
_0809C922:
	cmp r4, 0
	beq _0809C93C
	lsls r6, r0, 24
	cmp r0, 0x2
	beq _0809C932
	movs r0, 0
	bl sub_809A860
_0809C932:
	lsrs r0, r6, 24
	lsls r1, r5, 24
	lsrs r1, 24
	bl sub_809AF18
_0809C93C:
	adds r0, r4, 0
_0809C93E:
	pop {r4-r6}
	pop {r1}
	bx r1
	thumb_func_end sub_809C85C

	thumb_func_start sub_809C944
sub_809C944: @ 809C944
	push {r4-r7,lr}
	ldr r0, _0809C988 @ =gUnknown_020384E4
	ldrb r0, [r0]
	mov r12, r0
	ldr r7, _0809C98C @ =gUnknown_020384E5
	ldrb r3, [r7]
	ldr r0, _0809C990 @ =gPokemonStorageSystemPtr
	ldr r1, [r0]
	ldr r0, _0809C994 @ =0x000011df
	adds r5, r1, r0
	movs r0, 0
	strb r0, [r5]
	ldr r2, _0809C998 @ =0x000011de
	adds r4, r1, r2
	strb r0, [r4]
	adds r2, 0x5
	adds r1, r2
	strb r0, [r1]
	ldr r6, _0809C99C @ =gMain
	ldrh r2, [r6, 0x30]
	movs r0, 0x40
	ands r0, r2
	cmp r0, 0
	bne _0809CA14
	movs r0, 0x88
	ands r0, r2
	cmp r0, 0
	beq _0809C9A0
	movs r6, 0x1
	movs r0, 0x2
	mov r12, r0
	movs r3, 0
	b _0809CA2A
	.align 2, 0
_0809C988: .4byte gUnknown_020384E4
_0809C98C: .4byte gUnknown_020384E5
_0809C990: .4byte gPokemonStorageSystemPtr
_0809C994: .4byte 0x000011df
_0809C998: .4byte 0x000011de
_0809C99C: .4byte gMain
_0809C9A0:
	movs r0, 0x20
	ands r0, r2
	cmp r0, 0
	beq _0809C9C0
	movs r6, 0x1
	lsls r0, r3, 24
	movs r1, 0xFF
	lsls r1, 24
	adds r0, r1
	lsrs r3, r0, 24
	cmp r0, 0
	bge _0809CA2C
	movs r0, 0xFF
	strb r0, [r5]
	movs r3, 0x1
	b _0809CA2C
_0809C9C0:
	movs r0, 0x10
	ands r0, r2
	cmp r0, 0
	beq _0809C9E0
	movs r6, 0x1
	lsls r0, r3, 24
	movs r2, 0x80
	lsls r2, 17
	adds r0, r2
	lsrs r3, r0, 24
	asrs r0, 24
	cmp r0, 0x1
	ble _0809CA2C
	strb r6, [r5]
	movs r3, 0
	b _0809CA2C
_0809C9E0:
	ldrh r1, [r6, 0x2E]
	movs r0, 0x1
	ands r0, r1
	cmp r0, 0
	beq _0809C9F4
	movs r0, 0x4
	cmp r3, 0
	bne _0809CA3A
	movs r0, 0x5
	b _0809CA3A
_0809C9F4:
	movs r0, 0x2
	ands r0, r1
	cmp r0, 0
	beq _0809CA00
	movs r0, 0x10
	b _0809CA3A
_0809CA00:
	movs r0, 0x4
	ands r0, r1
	cmp r0, 0
	beq _0809CA10
	bl sub_809CD88
	movs r0, 0
	b _0809CA3A
_0809CA10:
	movs r6, 0
	b _0809CA38
_0809CA14:
	movs r6, 0x1
	movs r0, 0
	mov r12, r0
	movs r0, 0xFF
	strb r0, [r4]
	movs r0, 0
	ldrsb r0, [r7, r0]
	movs r3, 0x1D
	cmp r0, 0
	bne _0809CA2A
	movs r3, 0x18
_0809CA2A:
	strb r6, [r1]
_0809CA2C:
	cmp r6, 0
	beq _0809CA38
	mov r0, r12
	adds r1, r3, 0
	bl sub_809AF18
_0809CA38:
	adds r0, r6, 0
_0809CA3A:
	pop {r4-r7}
	pop {r1}
	bx r1
	thumb_func_end sub_809C944

	thumb_func_start sub_809CA40
sub_809CA40: @ 809CA40
	push {r4,r5,lr}
	movs r3, 0
	ldr r0, _0809CA6C @ =gUnknown_083BBBD4
	ldr r1, [r0]
	adds r4, r0, 0
	cmp r1, 0
	beq _0809CA84
	ldr r5, _0809CA70 @ =gUnknown_020384E4
_0809CA50:
	lsls r0, r3, 3
	adds r2, r0, r4
	movs r1, 0x4
	ldrsb r1, [r2, r1]
	movs r0, 0
	ldrsb r0, [r5, r0]
	cmp r1, r0
	bne _0809CA74
	ldr r0, [r2]
	bl _call_via_r0
	lsls r0, 24
	lsrs r0, 24
	b _0809CA86
	.align 2, 0
_0809CA6C: .4byte gUnknown_083BBBD4
_0809CA70: .4byte gUnknown_020384E4
_0809CA74:
	adds r0, r3, 0x1
	lsls r0, 16
	lsrs r3, r0, 16
	lsls r0, r3, 3
	adds r0, r4
	ldr r0, [r0]
	cmp r0, 0
	bne _0809CA50
_0809CA84:
	movs r0, 0
_0809CA86:
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end sub_809CA40

	thumb_func_start sub_809CA8C
sub_809CA8C: @ 809CA8C
	push {lr}
	bl sub_809CDCC
	movs r0, 0x9
	bl sub_809CDEC
	movs r0, 0xA
	bl sub_809CDEC
	movs r0, 0xB
	bl sub_809CDEC
	movs r0, 0
	bl sub_809CDEC
	pop {r0}
	bx r0
	thumb_func_end sub_809CA8C

	thumb_func_start sub_809CAB0
sub_809CAB0: @ 809CAB0
	push {lr}
	bl sub_809CDCC
	bl sub_809AB8C
	lsls r0, 16
	lsrs r1, r0, 16
	ldr r0, _0809CAD4 @ =gPokemonStorageSystemPtr
	ldr r0, [r0]
	ldrb r0, [r0, 0x5]
	cmp r0, 0x1
	beq _0809CADE
	cmp r0, 0x1
	bgt _0809CAD8
	cmp r0, 0
	beq _0809CAEA
	b _0809CB24
	.align 2, 0
_0809CAD4: .4byte gPokemonStorageSystemPtr
_0809CAD8:
	cmp r0, 0x2
	beq _0809CAF6
	b _0809CB24
_0809CADE:
	cmp r1, 0
	beq _0809CB24
	movs r0, 0x1
	bl sub_809CDEC
	b _0809CB28
_0809CAEA:
	cmp r1, 0
	beq _0809CB24
	movs r0, 0x2
	bl sub_809CDEC
	b _0809CB28
_0809CAF6:
	ldr r0, _0809CB0C @ =gUnknown_020384E6
	ldrb r0, [r0]
	cmp r0, 0
	beq _0809CB18
	cmp r1, 0
	beq _0809CB10
	movs r0, 0x4
	bl sub_809CDEC
	b _0809CB28
	.align 2, 0
_0809CB0C: .4byte gUnknown_020384E6
_0809CB10:
	movs r0, 0x5
	bl sub_809CDEC
	b _0809CB28
_0809CB18:
	cmp r1, 0
	beq _0809CB24
	movs r0, 0x3
	bl sub_809CDEC
	b _0809CB28
_0809CB24:
	movs r0, 0
	b _0809CB6E
_0809CB28:
	movs r0, 0x6
	bl sub_809CDEC
	ldr r0, _0809CB4C @ =gPokemonStorageSystemPtr
	ldr r0, [r0]
	ldrb r0, [r0, 0x5]
	cmp r0, 0x2
	bne _0809CB5A
	ldr r0, _0809CB50 @ =gUnknown_020384E4
	ldrb r0, [r0]
	lsls r0, 24
	asrs r0, 24
	cmp r0, 0
	bne _0809CB54
	movs r0, 0x2
	bl sub_809CDEC
	b _0809CB5A
	.align 2, 0
_0809CB4C: .4byte gPokemonStorageSystemPtr
_0809CB50: .4byte gUnknown_020384E4
_0809CB54:
	movs r0, 0x1
	bl sub_809CDEC
_0809CB5A:
	movs r0, 0x8
	bl sub_809CDEC
	movs r0, 0x7
	bl sub_809CDEC
	movs r0, 0
	bl sub_809CDEC
	movs r0, 0x1
_0809CB6E:
	pop {r1}
	bx r1
	thumb_func_end sub_809CAB0

	thumb_func_start sub_809CB74
sub_809CB74: @ 809CB74
	ldr r1, _0809CB90 @ =gPokemonStorageSystemPtr
	ldr r1, [r1]
	movs r2, 0x8E
	lsls r2, 5
	adds r1, r2
	ldr r2, [r1]
	ldrh r2, [r2, 0x20]
	strh r2, [r0, 0x20]
	ldr r1, [r1]
	ldrh r1, [r1, 0x22]
	adds r1, 0x14
	strh r1, [r0, 0x22]
	bx lr
	.align 2, 0
_0809CB90: .4byte gPokemonStorageSystemPtr
	thumb_func_end sub_809CB74

	thumb_func_start unref_sub_809CB94
unref_sub_809CB94: @ 809CB94
	push {r4,lr}
	adds r4, r0, 0
	ldr r0, _0809CBBC @ =gUnknown_020384E4
	ldrb r0, [r0]
	lsls r0, 24
	asrs r0, 24
	cmp r0, 0x1
	bne _0809CBC8
	ldr r2, _0809CBC0 @ =gPlayerParty
	ldr r0, _0809CBC4 @ =gUnknown_020384E5
	movs r1, 0
	ldrsb r1, [r0, r1]
	movs r0, 0x64
	muls r1, r0
	adds r1, r2
	adds r0, r4, 0
	movs r2, 0x50
	bl memcpy
	b _0809CBF6
	.align 2, 0
_0809CBBC: .4byte gUnknown_020384E4
_0809CBC0: .4byte gPlayerParty
_0809CBC4: .4byte gUnknown_020384E5
_0809CBC8:
	bl get_preferred_box
	lsls r0, 24
	lsrs r0, 24
	ldr r3, _0809CBFC @ =gPokemonStorage
	ldr r1, _0809CC00 @ =gUnknown_020384E5
	movs r2, 0
	ldrsb r2, [r1, r2]
	lsls r1, r2, 2
	adds r1, r2
	lsls r1, 4
	lsls r2, r0, 2
	adds r2, r0
	lsls r0, r2, 4
	subs r0, r2
	lsls r0, 5
	adds r1, r0
	adds r1, r3
	adds r1, 0x4
	adds r0, r4, 0
	movs r2, 0x50
	bl memcpy
_0809CBF6:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0809CBFC: .4byte gPokemonStorage
_0809CC00: .4byte gUnknown_020384E5
	thumb_func_end unref_sub_809CB94

	thumb_func_start sub_809CC04
sub_809CC04: @ 809CC04
	push {r4-r7,lr}
	sub sp, 0x34
	mov r1, sp
	ldr r0, _0809CCB0 @ =gHandCursorSpriteSheets
	ldm r0!, {r2-r4}
	stm r1!, {r2-r4}
	ldm r0!, {r2,r3,r5}
	stm r1!, {r2,r3,r5}
	add r4, sp, 0x18
	adds r1, r4, 0
	ldr r0, _0809CCB4 @ =gHandCursorSpritePalettes
	ldm r0!, {r2,r3,r5}
	stm r1!, {r2,r3,r5}
	ldm r0!, {r2,r3,r5}
	stm r1!, {r2,r3,r5}
	mov r0, sp
	bl LoadSpriteSheets
	adds r0, r4, 0
	bl LoadSpritePalettes
	ldr r0, _0809CCB8 @ =0x0000dac6
	bl IndexOfSpritePaletteTag
	ldr r1, _0809CCBC @ =gPokemonStorageSystemPtr
	ldr r6, [r1]
	ldr r4, _0809CCC0 @ =0x000011e4
	adds r7, r6, r4
	strb r0, [r7]
	ldr r0, _0809CCC4 @ =0x0000dad1
	bl IndexOfSpritePaletteTag
	ldr r5, _0809CCC8 @ =0x000011e5
	adds r1, r6, r5
	strb r0, [r1]
	ldr r0, _0809CCCC @ =gUnknown_020384E4
	ldrb r0, [r0]
	ldr r1, _0809CCD0 @ =gUnknown_020384E5
	ldrb r1, [r1]
	add r4, sp, 0x30
	mov r5, sp
	adds r5, 0x32
	adds r2, r4, 0
	adds r3, r5, 0
	bl sub_809AACC
	ldr r0, _0809CCD4 @ =gSpriteTemplate_83BBC70
	movs r2, 0
	ldrsh r1, [r4, r2]
	movs r3, 0
	ldrsh r2, [r5, r3]
	movs r3, 0x6
	bl CreateSprite
	lsls r0, 24
	lsrs r2, r0, 24
	cmp r2, 0x40
	beq _0809CCE4
	movs r5, 0x8E
	lsls r5, 5
	adds r4, r6, r5
	lsls r1, r2, 4
	adds r1, r2
	lsls r1, 2
	ldr r0, _0809CCD8 @ =gSprites
	adds r1, r0
	str r1, [r4]
	ldr r0, _0809CCDC @ =gUnknown_020384E9
	ldrb r0, [r0]
	adds r0, r7, r0
	ldrb r2, [r0]
	lsls r2, 4
	ldrb r3, [r1, 0x5]
	movs r0, 0xF
	ands r0, r3
	orrs r0, r2
	strb r0, [r1, 0x5]
	ldr r0, _0809CCE0 @ =gUnknown_020384E6
	ldrb r0, [r0]
	cmp r0, 0
	beq _0809CCEE
	ldr r0, [r4]
	movs r1, 0x3
	bl StartSpriteAnim
	b _0809CCEE
	.align 2, 0
_0809CCB0: .4byte gHandCursorSpriteSheets
_0809CCB4: .4byte gHandCursorSpritePalettes
_0809CCB8: .4byte 0x0000dac6
_0809CCBC: .4byte gPokemonStorageSystemPtr
_0809CCC0: .4byte 0x000011e4
_0809CCC4: .4byte 0x0000dad1
_0809CCC8: .4byte 0x000011e5
_0809CCCC: .4byte gUnknown_020384E4
_0809CCD0: .4byte gUnknown_020384E5
_0809CCD4: .4byte gSpriteTemplate_83BBC70
_0809CCD8: .4byte gSprites
_0809CCDC: .4byte gUnknown_020384E9
_0809CCE0: .4byte gUnknown_020384E6
_0809CCE4:
	movs r0, 0x8E
	lsls r0, 5
	adds r1, r6, r0
	movs r0, 0
	str r0, [r1]
_0809CCEE:
	ldr r0, _0809CD00 @ =gUnknown_020384E4
	ldrb r0, [r0]
	lsls r0, 24
	asrs r0, 24
	cmp r0, 0x1
	bne _0809CD04
	movs r3, 0xC
	movs r5, 0x1
	b _0809CD08
	.align 2, 0
_0809CD00: .4byte gUnknown_020384E4
_0809CD04:
	movs r3, 0x14
	movs r5, 0x2
_0809CD08:
	ldr r0, _0809CD58 @ =gSpriteTemplate_83BBC88
	movs r1, 0
	movs r2, 0
	bl CreateSprite
	lsls r0, 24
	lsrs r2, r0, 24
	cmp r2, 0x40
	beq _0809CD6C
	ldr r0, _0809CD5C @ =gPokemonStorageSystemPtr
	ldr r0, [r0]
	ldr r1, _0809CD60 @ =0x000011c4
	adds r4, r0, r1
	lsls r1, r2, 4
	adds r1, r2
	lsls r1, 2
	ldr r0, _0809CD64 @ =gSprites
	adds r1, r0
	str r1, [r4]
	lsls r3, r5, 2
	ldrb r2, [r1, 0x5]
	movs r0, 0xD
	negs r0, r0
	ands r0, r2
	orrs r0, r3
	strb r0, [r1, 0x5]
	ldr r0, _0809CD68 @ =gUnknown_020384E4
	ldrb r0, [r0]
	lsls r0, 24
	asrs r0, 24
	cmp r0, 0
	beq _0809CD78
	ldr r0, [r4]
	adds r0, 0x3E
	ldrb r1, [r0]
	movs r2, 0x4
	orrs r1, r2
	strb r1, [r0]
	b _0809CD78
	.align 2, 0
_0809CD58: .4byte gSpriteTemplate_83BBC88
_0809CD5C: .4byte gPokemonStorageSystemPtr
_0809CD60: .4byte 0x000011c4
_0809CD64: .4byte gSprites
_0809CD68: .4byte gUnknown_020384E4
_0809CD6C:
	ldr r0, _0809CD80 @ =gPokemonStorageSystemPtr
	ldr r0, [r0]
	ldr r2, _0809CD84 @ =0x000011c4
	adds r0, r2
	movs r1, 0
	str r1, [r0]
_0809CD78:
	add sp, 0x34
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_0809CD80: .4byte gPokemonStorageSystemPtr
_0809CD84: .4byte 0x000011c4
	thumb_func_end sub_809CC04

	thumb_func_start sub_809CD88
sub_809CD88: @ 809CD88
	push {lr}
	ldr r2, _0809CDC0 @ =gUnknown_020384E9
	movs r1, 0
	ldrb r0, [r2]
	cmp r0, 0
	bne _0809CD96
	movs r1, 0x1
_0809CD96:
	strb r1, [r2]
	ldr r0, _0809CDC4 @ =gPokemonStorageSystemPtr
	ldr r0, [r0]
	movs r3, 0x8E
	lsls r3, 5
	adds r1, r0, r3
	ldr r3, [r1]
	ldr r1, _0809CDC8 @ =0x000011e4
	adds r0, r1
	ldrb r2, [r2]
	adds r0, r2
	ldrb r1, [r0]
	lsls r1, 4
	ldrb r2, [r3, 0x5]
	movs r0, 0xF
	ands r0, r2
	orrs r0, r1
	strb r0, [r3, 0x5]
	pop {r0}
	bx r0
	.align 2, 0
_0809CDC0: .4byte gUnknown_020384E9
_0809CDC4: .4byte gPokemonStorageSystemPtr
_0809CDC8: .4byte 0x000011e4
	thumb_func_end sub_809CD88

// file boundary here

	thumb_func_start sub_809CDCC
sub_809CDCC: @ 809CDCC
	ldr r0, _0809CDE0 @ =gPokemonStorageSystemPtr
	ldr r0, [r0]
	ldr r2, _0809CDE4 @ =0x000011b8
	adds r1, r0, r2
	movs r2, 0
	strb r2, [r1]
	ldr r1, _0809CDE8 @ =0x000011b9
	adds r0, r1
	strb r2, [r0]
	bx lr
	.align 2, 0
_0809CDE0: .4byte gPokemonStorageSystemPtr
_0809CDE4: .4byte 0x000011b8
_0809CDE8: .4byte 0x000011b9
	thumb_func_end sub_809CDCC

	thumb_func_start sub_809CDEC
sub_809CDEC: @ 809CDEC
	push {r4,r5,lr}
	lsls r0, 24
	lsrs r3, r0, 24
	ldr r0, _0809CE3C @ =gPokemonStorageSystemPtr
	ldr r5, [r0]
	ldr r0, _0809CE40 @ =0x000011b8
	adds r4, r5, r0
	ldrb r0, [r4]
	cmp r0, 0x6
	bhi _0809CE36
	adds r1, r0, 0
	lsls r1, 3
	movs r2, 0x8C
	lsls r2, 5
	adds r1, r2
	adds r1, r5, r1
	ldr r2, _0809CE44 @ =gUnknown_083BBCA0
	lsls r0, r3, 2
	adds r0, r2
	ldr r0, [r0]
	str r0, [r1]
	str r3, [r1, 0x4]
	bl sub_8072CA4
	lsls r0, 24
	lsrs r0, 24
	adds r1, r0, 0x7
	lsrs r1, 3
	ldr r2, _0809CE48 @ =0x000011b9
	adds r0, r5, r2
	ldrb r2, [r0]
	cmp r1, r2
	bls _0809CE30
	strb r1, [r0]
_0809CE30:
	ldrb r0, [r4]
	adds r0, 0x1
	strb r0, [r4]
_0809CE36:
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_0809CE3C: .4byte gPokemonStorageSystemPtr
_0809CE40: .4byte 0x000011b8
_0809CE44: .4byte gUnknown_083BBCA0
_0809CE48: .4byte 0x000011b9
	thumb_func_end sub_809CDEC

	thumb_func_start sub_809CE4C
sub_809CE4C: @ 809CE4C
	push {lr}
	lsls r0, 24
	lsrs r2, r0, 24
	ldr r0, _0809CE70 @ =gPokemonStorageSystemPtr
	ldr r1, [r0]
	ldr r3, _0809CE74 @ =0x000011b8
	adds r0, r1, r3
	ldrb r0, [r0]
	cmp r2, r0
	bcs _0809CE7C
	lsls r0, r2, 3
	ldr r2, _0809CE78 @ =0x00001184
	adds r1, r2
	adds r1, r0
	movs r0, 0
	ldrsb r0, [r1, r0]
	b _0809CE80
	.align 2, 0
_0809CE70: .4byte gPokemonStorageSystemPtr
_0809CE74: .4byte 0x000011b8
_0809CE78: .4byte 0x00001184
_0809CE7C:
	movs r0, 0x1
	negs r0, r0
_0809CE80:
	pop {r1}
	bx r1
	thumb_func_end sub_809CE4C

	thumb_func_start sub_809CE84
sub_809CE84: @ 809CE84
	push {r4-r6,lr}
	mov r6, r10
	mov r5, r9
	mov r4, r8
	push {r4-r6}
	sub sp, 0x8
	ldr r0, _0809CF20 @ =gPokemonStorageSystemPtr
	ldr r4, [r0]
	ldr r0, _0809CF24 @ =0x000011b8
	adds r0, r4
	mov r8, r0
	ldrb r0, [r0]
	lsls r0, 1
	movs r1, 0xE
	subs r1, r0
	ldr r3, _0809CF28 @ =0x000011bc
	adds r6, r4, r3
	movs r0, 0
	mov r10, r0
	strh r1, [r6]
	ldr r1, _0809CF2C @ =0x000011b9
	adds r1, r4
	mov r9, r1
	ldrb r1, [r1]
	movs r0, 0x1C
	subs r0, r1
	subs r3, 0x2
	adds r5, r4, r3
	strh r0, [r5]
	lsls r0, 24
	lsrs r0, 24
	ldrb r1, [r6]
	movs r2, 0x1D
	movs r3, 0xF
	bl Menu_DrawStdWindowFrame
	ldrb r0, [r5]
	adds r0, 0x1
	lsls r0, 24
	lsrs r0, 24
	ldrb r1, [r6]
	adds r1, 0x1
	lsls r1, 24
	lsrs r1, 24
	mov r3, r8
	ldrb r2, [r3]
	movs r3, 0x8C
	lsls r3, 5
	adds r4, r3
	adds r3, r4, 0
	bl Menu_PrintItems
	ldrb r1, [r5]
	adds r1, 0x1
	lsls r1, 24
	lsrs r1, 24
	ldrb r2, [r6]
	adds r2, 0x1
	lsls r2, 24
	lsrs r2, 24
	mov r4, r8
	ldrb r3, [r4]
	mov r0, r10
	str r0, [sp]
	mov r4, r9
	ldrb r0, [r4]
	str r0, [sp, 0x4]
	movs r0, 0
	bl InitMenu
	add sp, 0x8
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_0809CF20: .4byte gPokemonStorageSystemPtr
_0809CF24: .4byte 0x000011b8
_0809CF28: .4byte 0x000011bc
_0809CF2C: .4byte 0x000011b9
	thumb_func_end sub_809CE84

	thumb_func_start sub_809CF30
sub_809CF30: @ 809CF30
	push {r4,r5,lr}
	movs r5, 0x2
	negs r5, r5
	ldr r4, _0809CF6C @ =gMain
	ldrh r1, [r4, 0x2E]
	movs r0, 0x1
	ands r0, r1
	cmp r0, 0
	bne _0809CF86
	movs r0, 0x2
	ands r0, r1
	cmp r0, 0
	beq _0809CF52
	movs r0, 0x5
	bl PlaySE
	adds r5, 0x1
_0809CF52:
	ldrh r1, [r4, 0x2E]
	movs r0, 0x40
	ands r0, r1
	cmp r0, 0
	beq _0809CF70
	movs r0, 0x5
	bl PlaySE
	movs r0, 0x1
	negs r0, r0
	bl Menu_MoveCursor
	b _0809CF8E
	.align 2, 0
_0809CF6C: .4byte gMain
_0809CF70:
	movs r0, 0x80
	ands r0, r1
	cmp r0, 0
	beq _0809CF8E
	movs r0, 0x5
	bl PlaySE
	movs r0, 0x1
	bl Menu_MoveCursor
	b _0809CF8E
_0809CF86:
	bl Menu_GetCursorPos
	lsls r0, 24
	lsrs r5, r0, 24
_0809CF8E:
	movs r0, 0x2
	negs r0, r0
	cmp r5, r0
	beq _0809CFB2
	bl Menu_DestroyCursor
	ldr r0, _0809CFD0 @ =gPokemonStorageSystemPtr
	ldr r1, [r0]
	ldr r2, _0809CFD4 @ =0x000011ba
	adds r0, r1, r2
	ldrb r0, [r0]
	adds r2, 0x2
	adds r1, r2
	ldrb r1, [r1]
	movs r2, 0x1D
	movs r3, 0xF
	bl Menu_EraseWindowRect
_0809CFB2:
	cmp r5, 0
	blt _0809CFC4
	ldr r0, _0809CFD0 @ =gPokemonStorageSystemPtr
	ldr r0, [r0]
	lsls r1, r5, 3
	ldr r2, _0809CFD8 @ =0x00001184
	adds r0, r2
	adds r0, r1
	ldr r5, [r0]
_0809CFC4:
	lsls r0, r5, 16
	asrs r0, 16
	pop {r4,r5}
	pop {r1}
	bx r1
	.align 2, 0
_0809CFD0: .4byte gPokemonStorageSystemPtr
_0809CFD4: .4byte 0x000011ba
_0809CFD8: .4byte 0x00001184
	thumb_func_end sub_809CF30

	thumb_func_start sub_809CFDC
sub_809CFDC: @ 809CFDC
	ldr r3, _0809CFEC @ =gUnknown_020384EC
	str r0, [r3]
	str r1, [r0]
	movs r1, 0
	strb r2, [r0, 0x5]
	strb r1, [r0, 0x4]
	bx lr
	.align 2, 0
_0809CFEC: .4byte gUnknown_020384EC
	thumb_func_end sub_809CFDC

	thumb_func_start sub_809CFF0
sub_809CFF0: @ 809CFF0
	push {r4,r5,lr}
	ldr r2, _0809D030 @ =gUnknown_020384EC
	ldr r1, [r2]
	ldrb r0, [r1, 0x4]
	cmp r0, 0
	beq _0809D02A
	movs r4, 0
	ldrb r1, [r1, 0x4]
	cmp r4, r1
	bcs _0809D022
	adds r5, r2, 0
_0809D006:
	ldr r0, [r5]
	lsls r1, r4, 4
	ldr r0, [r0]
	adds r0, r1
	ldr r1, [r0, 0xC]
	bl _call_via_r1
	adds r0, r4, 0x1
	lsls r0, 16
	lsrs r4, r0, 16
	ldr r0, [r5]
	ldrb r0, [r0, 0x4]
	cmp r4, r0
	bcc _0809D006
_0809D022:
	ldr r0, _0809D030 @ =gUnknown_020384EC
	ldr r1, [r0]
	movs r0, 0
	strb r0, [r1, 0x4]
_0809D02A:
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_0809D030: .4byte gUnknown_020384EC
	thumb_func_end sub_809CFF0

	thumb_func_start sub_809D034
sub_809D034: @ 809D034
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	mov r8, r0
	mov r9, r3
	ldr r0, [sp, 0x20]
	ldr r3, [sp, 0x24]
	ldr r4, [sp, 0x28]
	ldr r5, [sp, 0x2C]
	lsls r1, 16
	lsrs r1, 16
	mov r10, r1
	lsls r2, 16
	lsrs r6, r2, 16
	lsls r0, 16
	lsrs r0, 16
	mov r12, r0
	lsls r3, 16
	lsrs r3, 16
	lsls r4, 16
	lsrs r4, 16
	lsls r5, 16
	lsrs r5, 16
	ldr r0, _0809D0A4 @ =gUnknown_020384EC
	ldr r2, [r0]
	ldrb r0, [r2, 0x4]
	adds r1, r0, 0
	ldrb r7, [r2, 0x5]
	cmp r1, r7
	bcs _0809D0AC
	adds r0, 0x1
	strb r0, [r2, 0x4]
	lsls r0, r1, 4
	ldr r2, [r2]
	adds r2, r0
	lsls r0, r4, 1
	strh r0, [r2, 0x8]
	lsls r0, r6, 6
	add r0, r8
	mov r4, r10
	lsls r1, r4, 1
	adds r0, r1
	str r0, [r2, 0x4]
	lsls r0, r3, 6
	add r0, r9
	mov r7, r12
	lsls r1, r7, 1
	adds r0, r1
	str r0, [r2]
	strh r5, [r2, 0xA]
	ldr r0, _0809D0A8 @ =sub_809D0BC
	str r0, [r2, 0xC]
	movs r0, 0x1
	b _0809D0AE
	.align 2, 0
_0809D0A4: .4byte gUnknown_020384EC
_0809D0A8: .4byte sub_809D0BC
_0809D0AC:
	movs r0, 0
_0809D0AE:
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r1}
	bx r1
	thumb_func_end sub_809D034

	thumb_func_start sub_809D0BC
sub_809D0BC: @ 809D0BC
	push {r4-r7,lr}
	mov r7, r9
	mov r6, r8
	push {r6,r7}
	ldr r6, [r0]
	ldr r5, [r0, 0x4]
	ldrh r7, [r0, 0xA]
	ldrh r2, [r0, 0x8]
	movs r4, 0
	cmp r4, r7
	bcs _0809D0F2
	lsrs r2, 1
	mov r8, r2
	ldr r0, _0809D100 @ =0x001fffff
	mov r9, r0
_0809D0DA:
	adds r0, r6, 0
	adds r1, r5, 0
	mov r2, r8
	mov r3, r9
	ands r2, r3
	bl CpuSet
	adds r5, 0x40
	adds r6, 0x40
	adds r4, 0x1
	cmp r4, r7
	bcc _0809D0DA
_0809D0F2:
	pop {r3,r4}
	mov r8, r3
	mov r9, r4
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_0809D100: .4byte 0x001fffff
	thumb_func_end sub_809D0BC

	thumb_func_start sub_809D104
sub_809D104: @ 809D104
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	ldr r5, [sp, 0x18]
	ldr r4, [sp, 0x1C]
	ldr r6, [sp, 0x20]
	mov r8, r6
	ldr r6, [sp, 0x24]
	lsls r1, 16
	lsls r2, 16
	lsrs r2, 16
	lsls r5, 16
	lsls r4, 16
	mov r7, r8
	lsls r7, 16
	lsls r6, 16
	lsrs r6, 16
	lsrs r4, 10
	adds r3, r4
	lsrs r5, 15
	adds r5, r3, r5
	lsls r3, r2, 6
	adds r3, r0, r3
	lsrs r1, 15
	adds r4, r3, r1
	adds r2, r6
	lsls r2, 6
	adds r6, r0, r2
	lsrs r2, r7, 15
	cmp r4, r6
	bcs _0809D15C
	lsrs r7, r2, 1
	ldr r0, _0809D168 @ =0x001fffff
	mov r8, r0
_0809D148:
	adds r0, r5, 0
	adds r1, r4, 0
	mov r2, r8
	ands r2, r7
	bl CpuSet
	adds r4, 0x40
	adds r5, 0x40
	cmp r4, r6
	bcc _0809D148
_0809D15C:
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_0809D168: .4byte 0x001fffff
	thumb_func_end sub_809D104

	thumb_func_start sub_809D16C
sub_809D16C: @ 809D16C
	push {r4-r7,lr}
	mov r12, r0
	ldr r0, [sp, 0x14]
	lsls r1, 16
	lsrs r6, r1, 16
	lsls r2, 16
	lsrs r4, r2, 16
	lsls r3, 16
	lsrs r3, 16
	lsls r0, 16
	lsrs r5, r0, 16
	ldr r0, _0809D1B4 @ =gUnknown_020384EC
	ldr r1, [r0]
	ldrb r0, [r1, 0x4]
	adds r2, r0, 0
	ldrb r7, [r1, 0x5]
	cmp r2, r7
	bcs _0809D1BC
	adds r0, 0x1
	strb r0, [r1, 0x4]
	lsls r0, r2, 4
	ldr r1, [r1]
	adds r1, r0
	lsls r0, r3, 1
	strh r0, [r1, 0x8]
	lsls r0, r4, 5
	adds r0, r6
	lsls r0, 1
	add r0, r12
	str r0, [r1, 0x4]
	strh r5, [r1, 0xA]
	ldr r0, _0809D1B8 @ =sub_809D1C4
	str r0, [r1, 0xC]
	movs r0, 0x1
	b _0809D1BE
	.align 2, 0
_0809D1B4: .4byte gUnknown_020384EC
_0809D1B8: .4byte sub_809D1C4
_0809D1BC:
	movs r0, 0
_0809D1BE:
	pop {r4-r7}
	pop {r1}
	bx r1
	thumb_func_end sub_809D16C

	thumb_func_start sub_809D1C4
sub_809D1C4: @ 809D1C4
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	sub sp, 0x4
	adds r6, r0, 0
	movs r0, 0
	ldrh r1, [r6, 0xA]
	cmp r0, r1
	bcs _0809D252
	movs r7, 0x80
	lsls r7, 5
	mov r5, sp
	ldr r2, _0809D210 @ =0x040000d4
	mov r8, r2
	movs r1, 0x81
	lsls r1, 24
	mov r10, r1
_0809D1EA:
	ldr r2, [r6, 0x4]
	ldrh r3, [r6, 0x8]
	mov r12, r2
	adds r0, 0x1
	mov r9, r0
	cmp r3, r7
	bhi _0809D214
	movs r0, 0
	strh r0, [r5]
	mov r2, sp
	mov r0, r8
	str r2, [r0]
	mov r1, r12
	str r1, [r0, 0x4]
	lsrs r0, r3, 1
	mov r2, r10
	orrs r0, r2
	mov r1, r8
	b _0809D23C
	.align 2, 0
_0809D210: .4byte 0x040000d4
_0809D214:
	movs r4, 0
	strh r4, [r5]
	ldr r1, _0809D264 @ =0x040000d4
	mov r0, sp
	str r0, [r1]
	str r2, [r1, 0x4]
	ldr r0, _0809D268 @ =0x81000800
	str r0, [r1, 0x8]
	ldr r0, [r1, 0x8]
	adds r2, r7
	subs r3, r7
	cmp r3, r7
	bhi _0809D214
	strh r4, [r5]
	mov r0, sp
	str r0, [r1]
	str r2, [r1, 0x4]
	lsrs r0, r3, 1
	mov r2, r10
	orrs r0, r2
_0809D23C:
	str r0, [r1, 0x8]
	ldr r0, [r1, 0x8]
	mov r0, r12
	adds r0, 0x40
	str r0, [r6, 0x4]
	mov r1, r9
	lsls r0, r1, 16
	lsrs r0, 16
	ldrh r2, [r6, 0xA]
	cmp r0, r2
	bcc _0809D1EA
_0809D252:
	add sp, 0x4
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_0809D264: .4byte 0x040000d4
_0809D268: .4byte 0x81000800
	thumb_func_end sub_809D1C4

	.align 2, 0 @ Don't pad with nop.
