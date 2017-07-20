	.include "constants/gba_constants.inc"
	.include "constants/species_constants.inc"
	.include "asm/macros.inc"

	.syntax unified

.section .text_80BC1D0

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
