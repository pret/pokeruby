	.include "constants/gba_constants.inc"
	.include "constants/species_constants.inc"
	.include "asm/macros.inc"

	.syntax unified

	.text

.ifdef ENGLISH
	.set sub_804A96C_alt, sub_804A96C
.endif

	thumb_func_start sub_804ACF4
sub_804ACF4: @ 804ACF4
	push {r4-r7,lr}
	mov r7, r9
	mov r6, r8
	push {r6,r7}
	lsls r0, 24
	lsrs r0, 24
	mov r8, r0
	cmp r0, 0
	beq _0804AD0C
	cmp r0, 0x1
	beq _0804ADA0
	b _0804AE2C
_0804AD0C:
	movs r7, 0
	ldr r1, _0804AD4C @ =gUnknown_03004824
	ldr r0, [r1]
	adds r0, 0x42
	ldrb r0, [r0]
	cmp r7, r0
	blt _0804AD1C
	b _0804AE2C
_0804AD1C:
	adds r6, r1, 0
	movs r5, 0
	mov r9, r5
_0804AD22:
	movs r0, 0x64
	adds r1, r7, 0
	muls r1, r0
	ldr r0, _0804AD50 @ =gPlayerParty
	adds r4, r1, r0
	adds r0, r4, 0
	movs r1, 0x2D
	bl GetMonData
	adds r1, r0, 0
	cmp r1, 0x1
	bne _0804AD54
	ldr r0, [r6]
	adds r0, 0x51
	adds r0, r5
	mov r2, r9
	strb r2, [r0]
	ldr r0, [r6]
	adds r0, 0x5D
	adds r0, r5
	b _0804AD84
	.align 2, 0
_0804AD4C: .4byte gUnknown_03004824
_0804AD50: .4byte gPlayerParty
_0804AD54:
	adds r0, r4, 0
	movs r1, 0x39
	bl GetMonData
	adds r1, r0, 0
	cmp r1, 0
	bne _0804AD72
	ldr r0, [r6]
	adds r0, 0x51
	adds r0, r5
	strb r1, [r0]
	ldr r0, [r6]
	adds r0, 0x5D
	adds r0, r5
	b _0804AD84
_0804AD72:
	ldr r0, [r6]
	adds r0, 0x51
	adds r0, r5
	movs r1, 0x1
	strb r1, [r0]
	ldr r0, [r6]
	adds r0, 0x5D
	adds r0, r5
	mov r1, r9
_0804AD84:
	strb r1, [r0]
	ldr r0, _0804AD9C @ =gUnknown_03004824
	adds r5, 0x1
	adds r7, 0x1
	ldr r0, [r0]
	adds r0, 0x42
	add r0, r8
	ldrb r0, [r0]
	cmp r7, r0
	blt _0804AD22
	b _0804AE2C
	.align 2, 0
_0804AD9C: .4byte gUnknown_03004824
_0804ADA0:
	movs r7, 0
	ldr r1, _0804ADE0 @ =gUnknown_03004824
	ldr r0, [r1]
	adds r0, 0x43
	ldrb r0, [r0]
	cmp r7, r0
	bge _0804AE2C
	adds r6, r1, 0
	movs r5, 0x6
	movs r2, 0
	mov r9, r2
_0804ADB6:
	movs r0, 0x64
	adds r1, r7, 0
	muls r1, r0
	ldr r0, _0804ADE4 @ =gEnemyParty
	adds r4, r1, r0
	adds r0, r4, 0
	movs r1, 0x2D
	bl GetMonData
	adds r1, r0, 0
	cmp r1, 0x1
	bne _0804ADE8
	ldr r0, [r6]
	adds r0, 0x51
	adds r0, r5
	mov r2, r9
	strb r2, [r0]
	ldr r0, [r6]
	adds r0, 0x5D
	adds r0, r5
	b _0804AE18
	.align 2, 0
_0804ADE0: .4byte gUnknown_03004824
_0804ADE4: .4byte gEnemyParty
_0804ADE8:
	adds r0, r4, 0
	movs r1, 0x39
	bl GetMonData
	adds r1, r0, 0
	cmp r1, 0
	bne _0804AE06
	ldr r0, [r6]
	adds r0, 0x51
	adds r0, r5
	strb r1, [r0]
	ldr r0, [r6]
	adds r0, 0x5D
	adds r0, r5
	b _0804AE18
_0804AE06:
	ldr r0, [r6]
	adds r0, 0x51
	adds r0, r5
	movs r1, 0x1
	strb r1, [r0]
	ldr r0, [r6]
	adds r0, 0x5D
	adds r0, r5
	mov r1, r9
_0804AE18:
	strb r1, [r0]
	ldr r0, _0804AE38 @ =gUnknown_03004824
	adds r5, 0x1
	adds r7, 0x1
	ldr r0, [r0]
	adds r0, 0x42
	add r0, r8
	ldrb r0, [r0]
	cmp r7, r0
	blt _0804ADB6
_0804AE2C:
	pop {r3,r4}
	mov r8, r3
	mov r9, r4
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_0804AE38: .4byte gUnknown_03004824
	thumb_func_end sub_804ACF4

	thumb_func_start sub_804AE3C
sub_804AE3C: @ 804AE3C
	push {r4-r7,lr}
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0
	beq _0804AE4C
	cmp r0, 0x1
	beq _0804AEAC
	b _0804AF00
_0804AE4C:
	movs r6, 0
	ldr r1, _0804AEA4 @ =gUnknown_03004824
	ldr r0, [r1]
	adds r0, 0x42
	ldrb r0, [r0]
	cmp r6, r0
	bcs _0804AF00
	adds r7, r1, 0
_0804AE5C:
	movs r0, 0x64
	adds r4, r6, 0
	muls r4, r0
	ldr r0, _0804AEA8 @ =gPlayerParty
	adds r4, r0
	adds r0, r4, 0
	movs r1, 0x39
	bl GetMonData
	lsls r0, 16
	lsrs r5, r0, 16
	adds r0, r4, 0
	movs r1, 0x3A
	bl GetMonData
	adds r1, r0, 0
	lsls r0, r5, 16
	asrs r0, 16
	lsls r1, 16
	asrs r1, 16
	bl GetHPBarLevel
	ldr r1, [r7]
	adds r1, 0x69
	adds r1, r6
	strb r0, [r1]
	adds r0, r6, 0x1
	lsls r0, 16
	lsrs r6, r0, 16
	ldr r0, [r7]
	adds r0, 0x42
	ldrb r0, [r0]
	cmp r6, r0
	bcc _0804AE5C
	b _0804AF00
	.align 2, 0
_0804AEA4: .4byte gUnknown_03004824
_0804AEA8: .4byte gPlayerParty
_0804AEAC:
	movs r6, 0
	ldr r1, _0804AF08 @ =gUnknown_03004824
	ldr r0, [r1]
	adds r0, 0x43
	ldrb r0, [r0]
	cmp r6, r0
	bcs _0804AF00
	adds r7, r1, 0
_0804AEBC:
	movs r0, 0x64
	adds r4, r6, 0
	muls r4, r0
	ldr r0, _0804AF0C @ =gEnemyParty
	adds r4, r0
	adds r0, r4, 0
	movs r1, 0x39
	bl GetMonData
	lsls r0, 16
	lsrs r5, r0, 16
	adds r0, r4, 0
	movs r1, 0x3A
	bl GetMonData
	adds r1, r0, 0
	lsls r0, r5, 16
	asrs r0, 16
	lsls r1, 16
	asrs r1, 16
	bl GetHPBarLevel
	ldr r1, [r7]
	adds r1, 0x6F
	adds r1, r6
	strb r0, [r1]
	adds r0, r6, 0x1
	lsls r0, 16
	lsrs r6, r0, 16
	ldr r0, [r7]
	adds r0, 0x43
	ldrb r0, [r0]
	cmp r6, r0
	bcc _0804AEBC
_0804AF00:
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_0804AF08: .4byte gUnknown_03004824
_0804AF0C: .4byte gEnemyParty
	thumb_func_end sub_804AE3C

	thumb_func_start sub_804AF10
sub_804AF10: @ 804AF10
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	movs r5, 0
_0804AF18:
	movs r4, 0
	ldr r2, _0804AF7C @ =gUnknown_03004824
	ldr r0, [r2]
	adds r0, 0x42
	adds r0, r5
	adds r1, r5, 0x1
	mov r8, r1
	ldrb r0, [r0]
	cmp r4, r0
	bge _0804AF6A
	adds r6, r2, 0
	lsls r0, r5, 1
	adds r0, r5
	lsls r7, r0, 1
_0804AF34:
	ldr r2, [r6]
	adds r3, r4, r7
	adds r0, r2, 0
	adds r0, 0x34
	adds r0, r3
	ldrb r1, [r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	ldr r1, _0804AF80 @ =gSprites
	adds r0, r1
	adds r2, 0x69
	adds r2, r3
	ldrb r2, [r2]
	movs r1, 0x4
	subs r1, r2
	lsls r1, 24
	lsrs r1, 24
	bl sub_809D824
	adds r4, 0x1
	ldr r0, [r6]
	adds r0, 0x42
	adds r0, r5
	ldrb r0, [r0]
	cmp r4, r0
	blt _0804AF34
_0804AF6A:
	mov r5, r8
	cmp r5, 0x1
	ble _0804AF18
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_0804AF7C: .4byte gUnknown_03004824
_0804AF80: .4byte gSprites
	thumb_func_end sub_804AF10

	thumb_func_start sub_804AF84
sub_804AF84: @ 804AF84
	push {r4,lr}
	movs r2, 0
	ldr r4, _0804AFB0 @ =gSaveBlock1 + 0x3110
	ldr r3, _0804AFB4 @ =gUnknown_03004824
_0804AF8C:
	adds r1, r2, r4
	ldrb r0, [r1]
	cmp r0, 0
	bne _0804AFA2
	ldr r0, [r3]
	adds r0, 0xB5
	adds r0, r2
	ldrb r0, [r0]
	cmp r0, 0
	beq _0804AFA2
	strb r0, [r1]
_0804AFA2:
	adds r2, 0x1
	cmp r2, 0xA
	ble _0804AF8C
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0804AFB0: .4byte gSaveBlock1 + 0x3110
_0804AFB4: .4byte gUnknown_03004824
	thumb_func_end sub_804AF84

	thumb_func_start sub_804AFB8
sub_804AFB8: @ 804AFB8
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	sub sp, 0x4
	mov r9, r0
	mov r8, r1
	mov r10, r2
	lsls r3, 24
	lsrs r6, r3, 24
	adds r0, r6, 0x3
	lsrs r6, r0, 2
	ldr r7, _0804B054 @ =gTileBuffer
	mov r0, sp
	movs r5, 0
	strh r5, [r0]
	lsls r4, r6, 6
	movs r0, 0x80
	lsls r0, 17
	orrs r4, r0
	mov r0, sp
	adds r1, r7, 0
	adds r2, r4, 0
	bl CpuSet
	mov r0, sp
	adds r0, 0x2
	strh r5, [r0]
	mov r2, r9
	ldrb r1, [r2, 0xD]
	lsls r1, 5
	adds r1, r7
	adds r2, r4, 0
	bl CpuSet
	mov r0, r9
	adds r1, r7, 0
	mov r2, r10
	bl sub_8004E3C
	movs r4, 0
	cmp r4, r6
	bcs _0804B042
_0804B010:
	lsls r0, r4, 7
	adds r0, r7, r0
	lsls r1, r4, 8
	add r1, r8
	movs r2, 0x40
	bl CpuSet
	lsls r0, r4, 2
	mov r1, r9
	ldrb r1, [r1, 0xD]
	adds r0, r1
	lsls r0, 5
	adds r0, r7, r0
	lsls r1, r4, 3
	adds r1, 0x4
	lsls r1, 5
	add r1, r8
	movs r2, 0x40
	bl CpuSet
	adds r0, r4, 0x1
	lsls r0, 24
	lsrs r4, r0, 24
	cmp r4, r6
	bcc _0804B010
_0804B042:
	add sp, 0x4
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_0804B054: .4byte gTileBuffer
	thumb_func_end sub_804AFB8

	thumb_func_start sub_804B058
sub_804B058: @ 804B058
	push {r4,lr}
	adds r4, r0, 0
	ldrh r0, [r4, 0x2E]
	adds r0, 0x1
	strh r0, [r4, 0x2E]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0xA
	bne _0804B074
	movs r0, 0x17
	bl PlaySE
	movs r0, 0
	strh r0, [r4, 0x2E]
_0804B074:
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end sub_804B058

	thumb_func_start sub_804B07C
sub_804B07C: @ 804B07C
	push {lr}
	adds r2, r0, 0
	movs r0, 0x30
	ldrsh r1, [r2, r0]
	cmp r1, 0
	bne _0804B0B2
	ldrh r0, [r2, 0x2E]
	adds r0, 0x1
	strh r0, [r2, 0x2E]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0xC
	bne _0804B098
	strh r1, [r2, 0x2E]
_0804B098:
	movs r1, 0x2E
	ldrsh r0, [r2, r1]
	lsls r0, 1
	ldr r1, _0804B0B8 @ =gTradeGlow2PaletteAnimTable
	adds r0, r1
	ldrb r1, [r2, 0x5]
	lsrs r1, 4
	adds r1, 0x10
	lsls r1, 4
	adds r1, 0x4
	movs r2, 0x2
	bl LoadPalette
_0804B0B2:
	pop {r0}
	bx r0
	.align 2, 0
_0804B0B8: .4byte gTradeGlow2PaletteAnimTable
	thumb_func_end sub_804B07C

	thumb_func_start sub_804B0BC
sub_804B0BC: @ 804B0BC
	push {lr}
	adds r2, r0, 0
	ldrh r1, [r2, 0x2E]
	adds r1, 0x1
	strh r1, [r2, 0x2E]
	ldrh r0, [r2, 0x26]
	adds r0, 0x1
	strh r0, [r2, 0x26]
	lsls r1, 16
	asrs r1, 16
	cmp r1, 0xA
	bne _0804B0DA
	adds r0, r2, 0
	bl DestroySprite
_0804B0DA:
	pop {r0}
	bx r0
	thumb_func_end sub_804B0BC

	thumb_func_start sub_804B0E0
sub_804B0E0: @ 804B0E0
	push {lr}
	adds r2, r0, 0
	ldrh r1, [r2, 0x2E]
	adds r1, 0x1
	strh r1, [r2, 0x2E]
	ldrh r0, [r2, 0x26]
	subs r0, 0x1
	strh r0, [r2, 0x26]
	lsls r1, 16
	asrs r1, 16
	cmp r1, 0xA
	bne _0804B0FE
	adds r0, r2, 0
	bl DestroySprite
_0804B0FE:
	pop {r0}
	bx r0
	thumb_func_end sub_804B0E0

	thumb_func_start sub_804B104
sub_804B104: @ 804B104
	push {r4,lr}
	adds r4, r0, 0
	ldrh r0, [r4, 0x2E]
	adds r0, 0x1
	strh r0, [r4, 0x2E]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0xF
	bne _0804B120
	movs r0, 0xCC
	bl PlaySE
	movs r0, 0
	strh r0, [r4, 0x2E]
_0804B120:
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end sub_804B104

	thumb_func_start sub_804B128
sub_804B128: @ 804B128
	push {r4,r5,lr}
	sub sp, 0x20
	ldr r0, _0804B1B4 @ =gUnknown_03004828
	ldr r0, [r0]
	mov r12, r0
	movs r0, 0x82
	lsls r0, 1
	add r0, r12
	ldrh r1, [r0]
	lsls r1, 8
	movs r0, 0x83
	lsls r0, 1
	add r0, r12
	ldrh r2, [r0]
	lsls r2, 8
	movs r0, 0x86
	lsls r0, 1
	add r0, r12
	movs r4, 0
	ldrsh r3, [r0, r4]
	movs r0, 0x87
	lsls r0, 1
	add r0, r12
	movs r5, 0
	ldrsh r0, [r0, r5]
	str r0, [sp]
	movs r4, 0x8C
	lsls r4, 1
	add r4, r12
	movs r5, 0
	ldrsh r0, [r4, r5]
	str r0, [sp, 0x4]
	movs r5, 0
	ldrsh r0, [r4, r5]
	str r0, [sp, 0x8]
	movs r0, 0x8E
	lsls r0, 1
	add r0, r12
	ldrh r0, [r0]
	str r0, [sp, 0xC]
	add r0, sp, 0x10
	bl DoBgAffineSet
	ldr r1, _0804B1B8 @ =REG_BG2PA
	add r0, sp, 0x10
	ldrh r0, [r0]
	strh r0, [r1]
	adds r1, 0x2
	add r0, sp, 0x10
	ldrh r0, [r0, 0x2]
	strh r0, [r1]
	adds r1, 0x2
	add r0, sp, 0x10
	ldrh r0, [r0, 0x4]
	strh r0, [r1]
	adds r1, 0x2
	add r0, sp, 0x10
	ldrh r0, [r0, 0x6]
	strh r0, [r1]
	adds r1, 0x2
	ldr r0, [sp, 0x18]
	str r0, [r1]
	adds r1, 0x4
	ldr r0, [sp, 0x1C]
	str r0, [r1]
	add sp, 0x20
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_0804B1B4: .4byte gUnknown_03004828
_0804B1B8: .4byte REG_BG2PA
	thumb_func_end sub_804B128

	thumb_func_start sub_804B1BC
sub_804B1BC: @ 804B1BC
	push {lr}
	ldr r1, _0804B1FC @ =REG_BG1VOFS
	ldr r0, _0804B200 @ =gUnknown_03004828
	ldr r2, [r0]
	movs r3, 0x88
	lsls r3, 1
	adds r0, r2, r3
	ldrh r0, [r0]
	strh r0, [r1]
	subs r1, 0x2
	adds r3, 0x2
	adds r0, r2, r3
	ldrh r0, [r0]
	strh r0, [r1]
	movs r0, 0x80
	lsls r0, 19
	ldrh r0, [r0]
	movs r1, 0x7
	ands r0, r1
	cmp r0, 0
	bne _0804B208
	ldr r1, _0804B204 @ =REG_BG2VOFS
	adds r3, 0x2
	adds r0, r2, r3
	ldrh r0, [r0]
	strh r0, [r1]
	subs r1, 0x2
	adds r3, 0x2
	adds r0, r2, r3
	ldrh r0, [r0]
	strh r0, [r1]
	b _0804B20C
	.align 2, 0
_0804B1FC: .4byte REG_BG1VOFS
_0804B200: .4byte gUnknown_03004828
_0804B204: .4byte REG_BG2VOFS
_0804B208:
	bl sub_804B128
_0804B20C:
	pop {r0}
	bx r0
	thumb_func_end sub_804B1BC

	thumb_func_start sub_804B210
sub_804B210: @ 804B210
	push {lr}
	bl sub_804B1BC
	bl LoadOam
	bl ProcessSpriteCopyRequests
	bl TransferPlttBuffer
	pop {r0}
	bx r0
	thumb_func_end sub_804B210

	thumb_func_start sub_804B228
sub_804B228: @ 804B228
	push {r4,lr}
	ldr r4, _0804B248 @ =gUnknown_03004828
	ldr r1, [r4]
	adds r2, r1, 0
	adds r2, 0xB4
	movs r3, 0
	movs r0, 0
	strh r0, [r2]
	adds r1, 0xB2
	strb r3, [r1]
	ldr r0, [r4]
	adds r0, 0xB3
	strb r3, [r0]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0804B248: .4byte gUnknown_03004828
	thumb_func_end sub_804B228

	thumb_func_start sub_804B24C
sub_804B24C: @ 804B24C
	push {r4,r5,lr}
	ldr r1, _0804B270 @ =gUnknown_03004828
	ldr r2, [r1]
	adds r0, r2, 0
	adds r0, 0xB2
	adds r3, r2, 0
	adds r3, 0xB3
	ldrb r0, [r0]
	adds r5, r1, 0
	ldrb r3, [r3]
	cmp r0, r3
	bne _0804B274
	adds r1, r2, 0
	adds r1, 0xB4
	ldrh r0, [r1]
	adds r0, 0x1
	b _0804B27A
	.align 2, 0
_0804B270: .4byte gUnknown_03004828
_0804B274:
	adds r1, r2, 0
	adds r1, 0xB4
	movs r0, 0
_0804B27A:
	strh r0, [r1]
	adds r4, r5, 0
	ldr r3, [r4]
	adds r2, r3, 0
	adds r2, 0xB4
	ldrh r0, [r2]
	cmp r0, 0xB4
	bls _0804B29C
	movs r1, 0
	movs r0, 0
	strh r0, [r2]
	adds r0, r3, 0
	adds r0, 0xB3
	strb r1, [r0]
	ldr r0, [r4]
	adds r0, 0xB2
	strb r1, [r0]
_0804B29C:
	ldr r0, [r5]
	adds r1, r0, 0
	adds r1, 0xB2
	ldrb r1, [r1]
	adds r0, 0xB3
	strb r1, [r0]
	pop {r4,r5}
	pop {r0}
	bx r0
	thumb_func_end sub_804B24C

	thumb_func_start sub_804B2B0
sub_804B2B0: @ 804B2B0
	push {lr}
	ldr r0, _0804B2C0 @ =gReceivedRemoteLinkPlayers
	ldrb r0, [r0]
	cmp r0, 0
	bne _0804B2C4
	movs r0, 0
	b _0804B2CC
	.align 2, 0
_0804B2C0: .4byte gReceivedRemoteLinkPlayers
_0804B2C4:
	bl GetMultiplayerId
	lsls r0, 24
	lsrs r0, 24
_0804B2CC:
	pop {r1}
	bx r1
	thumb_func_end sub_804B2B0

	thumb_func_start sub_804B2D0
sub_804B2D0: @ 804B2D0
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	sub sp, 0xC
	lsls r0, 24
	lsrs r7, r0, 24
	lsls r1, 24
	lsrs r5, r1, 24
	movs r4, 0
	mov r10, r4
	cmp r7, 0
	bne _0804B2FC
	ldr r0, _0804B324 @ =gUnknown_020297D8
	ldrb r1, [r0]
	movs r0, 0x64
	muls r1, r0
	ldr r0, _0804B328 @ =gPlayerParty
	adds r1, r0
	mov r10, r1
	movs r4, 0x1
_0804B2FC:
	cmp r7, 0x1
	bne _0804B31A
	ldr r0, _0804B324 @ =gUnknown_020297D8
	ldrb r0, [r0, 0x1]
	movs r1, 0x6
	bl __umodsi3
	lsls r0, 24
	lsrs r0, 24
	movs r1, 0x64
	muls r1, r0
	ldr r0, _0804B32C @ =gEnemyParty
	adds r1, r0
	mov r10, r1
	movs r4, 0x3
_0804B31A:
	cmp r5, 0
	beq _0804B330
	cmp r5, 0x1
	beq _0804B3A4
	b _0804B3FA
	.align 2, 0
_0804B324: .4byte gUnknown_020297D8
_0804B328: .4byte gPlayerParty
_0804B32C: .4byte gEnemyParty
_0804B330:
	mov r0, r10
	movs r1, 0x41
	bl GetMonData
	adds r5, r0, 0
	lsls r5, 16
	lsrs r5, 16
	mov r0, r10
	movs r1, 0
	bl GetMonData
	mov r9, r0
	lsls r0, r5, 3
	ldr r1, _0804B390 @ =gMonFrontPicTable
	adds r0, r1
	ldr r1, _0804B394 @ =gMonFrontPicCoords
	lsls r2, r5, 2
	adds r2, r1
	ldrb r1, [r2]
	ldrb r2, [r2, 0x1]
	ldr r3, _0804B398 @ =0x02000000
	ldr r6, _0804B39C @ =gUnknown_081FAF4C
	lsls r7, 1
	mov r8, r7
	mov r4, r8
	adds r4, 0x1
	lsls r4, 2
	adds r4, r6
	ldr r4, [r4]
	str r4, [sp]
	str r5, [sp, 0x4]
	mov r4, r9
	str r4, [sp, 0x8]
	bl HandleLoadSpecialPokePic
	mov r0, r10
	bl sub_8040990
	bl LoadCompressedObjectPalette
	ldr r0, _0804B3A0 @ =gUnknown_03004828
	ldr r0, [r0]
	movs r1, 0x90
	lsls r1, 1
	adds r0, r1
	add r0, r8
	strh r5, [r0]
	b _0804B3FA
	.align 2, 0
_0804B390: .4byte gMonFrontPicTable
_0804B394: .4byte gMonFrontPicCoords
_0804B398: .4byte 0x02000000
_0804B39C: .4byte gUnknown_081FAF4C
_0804B3A0: .4byte gUnknown_03004828
_0804B3A4:
	mov r0, r10
	bl sub_8040990
	ldrh r0, [r0, 0x4]
	adds r1, r4, 0
	bl GetMonSpriteTemplate_803C56C
	ldr r0, _0804B40C @ =gUnknown_02024E8C
	movs r1, 0x78
	movs r2, 0x3C
	movs r3, 0x6
	bl CreateSprite
	ldr r4, _0804B410 @ =gUnknown_03004828
	ldr r1, [r4]
	adds r1, 0xB8
	adds r1, r7
	strb r0, [r1]
	ldr r3, _0804B414 @ =gSprites
	ldr r0, [r4]
	adds r0, 0xB8
	adds r0, r7
	ldrb r1, [r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r3
	adds r0, 0x3E
	ldrb r1, [r0]
	movs r2, 0x4
	orrs r1, r2
	strb r1, [r0]
	ldr r0, [r4]
	adds r0, 0xB8
	adds r0, r7
	ldrb r1, [r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r3, 0x1C
	adds r0, r3
	ldr r1, _0804B418 @ =SpriteCallbackDummy
	str r1, [r0]
_0804B3FA:
	add sp, 0xC
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_0804B40C: .4byte gUnknown_02024E8C
_0804B410: .4byte gUnknown_03004828
_0804B414: .4byte gSprites
_0804B418: .4byte SpriteCallbackDummy
	thumb_func_end sub_804B2D0

	thumb_func_start sub_804B41C
sub_804B41C: @ 804B41C
	push {r4-r6,lr}
	sub sp, 0x4
	ldr r1, _0804B43C @ =gMain
	ldr r2, _0804B440 @ =0x0000043c
	adds r0, r1, r2
	ldrb r0, [r0]
	adds r2, r1, 0
	cmp r0, 0xC
	bls _0804B430
	b _0804B76E
_0804B430:
	lsls r0, 2
	ldr r1, _0804B444 @ =_0804B448
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_0804B43C: .4byte gMain
_0804B440: .4byte 0x0000043c
_0804B444: .4byte _0804B448
	.align 2, 0
_0804B448:
	.4byte _0804B47C
	.4byte _0804B5AC
	.4byte _0804B5D4
	.4byte _0804B5FC
	.4byte _0804B648
	.4byte _0804B678
	.4byte _0804B6A8
	.4byte _0804B6B2
	.4byte _0804B6CC
	.4byte _0804B6E4
	.4byte _0804B71C
	.4byte _0804B726
	.4byte _0804B75C
_0804B47C:
	movs r1, 0x80
	lsls r1, 19
	movs r0, 0
	strh r0, [r1]
	bl ResetTasks
	bl CloseLink
	ldr r6, _0804B570 @ =gUnknown_03004828
	ldr r5, _0804B574 @ =0x0201f000
	str r5, [r6]
	bl ResetSpriteData
	bl FreeAllSpritePalettes
	ldr r0, _0804B578 @ =sub_804B210
	bl SetVBlankCallback
	bl sub_804B228
	ldr r4, _0804B57C @ =gWindowConfig_81E6F84
	adds r0, r4, 0
	bl SetUpWindowConfig
	ldr r0, [r6]
	adds r0, 0x4
	adds r1, r4, 0
	bl InitWindowFromConfig
	movs r0, 0x2
	bl SetTextWindowBaseTileNum
	ldr r1, [r6]
	adds r1, 0x34
	strb r0, [r1]
	ldr r0, [r6]
	adds r0, 0x4
	bl LoadTextWindowGraphics
	bl MenuZeroFillScreen
	ldr r1, _0804B580 @ =gLinkType
	ldr r4, _0804B584 @ =0x00001144
	adds r0, r4, 0
	strh r0, [r1]
	ldr r1, _0804B588 @ =gMain
	ldr r0, _0804B58C @ =0x0000043c
	adds r1, r0
	ldrb r0, [r1]
	adds r0, 0x1
	strb r0, [r1]
	ldr r0, _0804B590 @ =gUnknown_08D00000
	movs r1, 0xC0
	lsls r1, 19
	bl LZDecompressVram
	ldr r0, _0804B594 @ =gUnknown_08D00524
	ldr r1, _0804B598 @ =0xfffe1000
	adds r5, r1
	movs r2, 0x80
	lsls r2, 4
	adds r1, r5, 0
	bl CpuSet
	ldr r1, _0804B59C @ =0x06002800
	ldr r0, _0804B5A0 @ =0x040000d4
	str r5, [r0]
	str r1, [r0, 0x4]
	ldr r1, _0804B5A4 @ =0x80000280
	str r1, [r0, 0x8]
	ldr r0, [r0, 0x8]
	ldr r0, _0804B5A8 @ =gUnknown_08D004E0
	movs r1, 0
	movs r2, 0x20
	bl LoadCompressedPalette
	ldr r1, [r6]
	adds r0, r1, 0
	adds r0, 0xB6
	movs r2, 0
	strh r2, [r0]
	adds r0, 0xE
	strh r2, [r0]
	movs r4, 0x8F
	lsls r4, 1
	adds r1, r4
	movs r0, 0x1
	strb r0, [r1]
	ldr r3, [r6]
	movs r1, 0x82
	lsls r1, 1
	adds r0, r3, r1
	movs r1, 0x40
	strh r1, [r0]
	subs r4, 0x18
	adds r0, r3, r4
	strh r1, [r0]
	adds r1, 0xC8
	adds r0, r3, r1
	strh r2, [r0]
	adds r4, 0x4
	adds r0, r3, r4
	strh r2, [r0]
	movs r0, 0x86
	lsls r0, 1
	adds r1, r3, r0
	movs r0, 0x78
	strh r0, [r1]
	adds r4, 0x4
	adds r1, r3, r4
	movs r0, 0x50
	strh r0, [r1]
	adds r0, 0xC8
	adds r1, r3, r0
	subs r0, 0x18
	strh r0, [r1]
	movs r1, 0x8E
	lsls r1, 1
	adds r0, r3, r1
	strh r2, [r0]
	b _0804B76E
	.align 2, 0
_0804B570: .4byte gUnknown_03004828
_0804B574: .4byte 0x0201f000
_0804B578: .4byte sub_804B210
_0804B57C: .4byte gWindowConfig_81E6F84
_0804B580: .4byte gLinkType
_0804B584: .4byte 0x00001144
_0804B588: .4byte gMain
_0804B58C: .4byte 0x0000043c
_0804B590: .4byte gUnknown_08D00000
_0804B594: .4byte gUnknown_08D00524
_0804B598: .4byte 0xfffe1000
_0804B59C: .4byte 0x06002800
_0804B5A0: .4byte 0x040000d4
_0804B5A4: .4byte 0x80000280
_0804B5A8: .4byte gUnknown_08D004E0
_0804B5AC:
	bl OpenLink
	ldr r1, _0804B5C8 @ =gMain
	ldr r2, _0804B5CC @ =0x0000043c
	adds r1, r2
	ldrb r0, [r1]
	adds r0, 0x1
	movs r2, 0
	strb r0, [r1]
	ldr r0, _0804B5D0 @ =gUnknown_03004828
	ldr r0, [r0]
	adds r0, 0xC0
	str r2, [r0]
	b _0804B76E
	.align 2, 0
_0804B5C8: .4byte gMain
_0804B5CC: .4byte 0x0000043c
_0804B5D0: .4byte gUnknown_03004828
_0804B5D4:
	ldr r0, _0804B5F4 @ =gUnknown_03004828
	ldr r0, [r0]
	adds r1, r0, 0
	adds r1, 0xC0
	ldr r0, [r1]
	adds r0, 0x1
	str r0, [r1]
	cmp r0, 0x3C
	bhi _0804B5E8
	b _0804B76E
_0804B5E8:
	movs r0, 0
	str r0, [r1]
	ldr r4, _0804B5F8 @ =0x0000043c
	adds r1, r2, r4
	b _0804B74C
	.align 2, 0
_0804B5F4: .4byte gUnknown_03004828
_0804B5F8: .4byte 0x0000043c
_0804B5FC:
	bl IsLinkMaster
	lsls r0, 24
	cmp r0, 0
	bne _0804B608
	b _0804B746
_0804B608:
	bl GetLinkPlayerCount_2
	adds r4, r0, 0
	bl sub_800820C
	lsls r4, 24
	lsls r0, 24
	cmp r4, r0
	bcs _0804B61C
	b _0804B76E
_0804B61C:
	ldr r0, _0804B63C @ =gUnknown_03004828
	ldr r1, [r0]
	adds r1, 0xC0
	ldr r0, [r1]
	adds r0, 0x1
	str r0, [r1]
	cmp r0, 0x1E
	bhi _0804B62E
	b _0804B76E
_0804B62E:
	bl sub_8007F4C
	ldr r1, _0804B640 @ =gMain
	ldr r0, _0804B644 @ =0x0000043c
	adds r1, r0
	b _0804B74C
	.align 2, 0
_0804B63C: .4byte gUnknown_03004828
_0804B640: .4byte gMain
_0804B644: .4byte 0x0000043c
_0804B648:
	bl sub_804B24C
	ldr r0, _0804B66C @ =gReceivedRemoteLinkPlayers
	ldrb r0, [r0]
	cmp r0, 0x1
	beq _0804B656
	b _0804B76E
_0804B656:
	bl IsLinkPlayerDataExchangeComplete
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	beq _0804B664
	b _0804B76E
_0804B664:
	ldr r1, _0804B670 @ =gMain
	ldr r4, _0804B674 @ =0x0000043c
	adds r1, r4
	b _0804B74C
	.align 2, 0
_0804B66C: .4byte gReceivedRemoteLinkPlayers
_0804B670: .4byte gMain
_0804B674: .4byte 0x0000043c
_0804B678:
	ldr r2, _0804B69C @ =gUnknown_03004828
	ldr r0, [r2]
	adds r0, 0x9C
	movs r1, 0
	strb r1, [r0]
	ldr r0, [r2]
	adds r0, 0x9D
	strb r1, [r0]
	ldr r0, [r2]
	adds r0, 0xBD
	strb r1, [r0]
	movs r0, 0
	bl sub_804B2D0
	ldr r1, _0804B6A0 @ =gMain
	ldr r0, _0804B6A4 @ =0x0000043c
	adds r1, r0
	b _0804B74C
	.align 2, 0
_0804B69C: .4byte gUnknown_03004828
_0804B6A0: .4byte gMain
_0804B6A4: .4byte 0x0000043c
_0804B6A8:
	movs r0, 0
	movs r1, 0x1
	bl sub_804B2D0
	b _0804B746
_0804B6B2:
	movs r0, 0x1
	movs r1, 0
	bl sub_804B2D0
	ldr r1, _0804B6C4 @ =gMain
	ldr r4, _0804B6C8 @ =0x0000043c
	adds r1, r4
	b _0804B74C
	.align 2, 0
_0804B6C4: .4byte gMain
_0804B6C8: .4byte 0x0000043c
_0804B6CC:
	movs r0, 0x1
	movs r1, 0x1
	bl sub_804B2D0
	ldr r1, _0804B6DC @ =gMain
	ldr r0, _0804B6E0 @ =0x0000043c
	adds r1, r0
	b _0804B74C
	.align 2, 0
_0804B6DC: .4byte gMain
_0804B6E0: .4byte 0x0000043c
_0804B6E4:
	bl sub_804C164
	ldr r0, _0804B704 @ =gUnknown_0821594C
	bl LoadSpriteSheet
	ldr r0, _0804B708 @ =gUnknown_08215954
	bl LoadSpritePalette
	ldr r1, _0804B70C @ =REG_BG1CNT
	ldr r2, _0804B710 @ =0x00000502
	adds r0, r2, 0
	strh r0, [r1]
	ldr r1, _0804B714 @ =gMain
	ldr r4, _0804B718 @ =0x0000043c
	adds r1, r4
	b _0804B74C
	.align 2, 0
_0804B704: .4byte gUnknown_0821594C
_0804B708: .4byte gUnknown_08215954
_0804B70C: .4byte REG_BG1CNT
_0804B710: .4byte 0x00000502
_0804B714: .4byte gMain
_0804B718: .4byte 0x0000043c
_0804B71C:
	ldr r0, _0804B754 @ =0x0000043c
	adds r1, r2, r0
	ldrb r0, [r1]
	adds r0, 0x1
	strb r0, [r1]
_0804B726:
	movs r0, 0x5
	bl sub_804BBE8
	movs r0, 0
	bl sub_804BBE8
	bl sub_804C1A8
	movs r0, 0x1
	negs r0, r0
	movs r1, 0
	str r1, [sp]
	movs r2, 0x10
	movs r3, 0
	bl BeginNormalPaletteFade
_0804B746:
	ldr r1, _0804B758 @ =gMain
	ldr r2, _0804B754 @ =0x0000043c
	adds r1, r2
_0804B74C:
	ldrb r0, [r1]
	adds r0, 0x1
	strb r0, [r1]
	b _0804B76E
	.align 2, 0
_0804B754: .4byte 0x0000043c
_0804B758: .4byte gMain
_0804B75C:
	ldr r0, _0804B788 @ =gPaletteFade
	ldrb r1, [r0, 0x7]
	movs r0, 0x80
	ands r0, r1
	cmp r0, 0
	bne _0804B76E
	ldr r0, _0804B78C @ =sub_804DB84
	bl SetMainCallback2
_0804B76E:
	bl RunTasks
	bl AnimateSprites
	bl BuildOamBuffer
	bl UpdatePaletteFade
	add sp, 0x4
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_0804B788: .4byte gPaletteFade
_0804B78C: .4byte sub_804DB84
	thumb_func_end sub_804B41C

	thumb_func_start sub_804B790
sub_804B790: @ 804B790
	push {r4-r6,lr}
	mov r6, r8
	push {r6}
	sub sp, 0x10
	ldr r1, _0804B7B4 @ =gMain
	ldr r2, _0804B7B8 @ =0x0000043c
	adds r0, r1, r2
	ldrb r0, [r0]
	adds r2, r1, 0
	cmp r0, 0xC
	bls _0804B7A8
	b _0804B9F2
_0804B7A8:
	lsls r0, 2
	ldr r1, _0804B7BC @ =_0804B7C0
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_0804B7B4: .4byte gMain
_0804B7B8: .4byte 0x0000043c
_0804B7BC: .4byte _0804B7C0
	.align 2, 0
_0804B7C0:
	.4byte _0804B7F4
	.4byte _0804B9F2
	.4byte _0804B9F2
	.4byte _0804B9F2
	.4byte _0804B9F2
	.4byte _0804B914
	.4byte _0804B92C
	.4byte _0804B944
	.4byte _0804B94E
	.4byte _0804B968
	.4byte _0804B9A0
	.4byte _0804B9AA
	.4byte _0804B9E0
_0804B7F4:
	ldr r1, _0804B8E0 @ =gUnknown_020297D8
	ldr r0, _0804B8E4 @ =gSpecialVar_0x8005
	ldrh r0, [r0]
	movs r6, 0
	strb r0, [r1]
	movs r0, 0x6
	strb r0, [r1, 0x1]
	ldr r4, _0804B8E8 @ =gLinkPlayers + 0x8
	ldr r1, _0804B8EC @ =gSaveBlock2
	adds r0, r4, 0
	bl StringCopy
	ldr r0, _0804B8F0 @ =gEnemyParty
	movs r1, 0x7
	add r2, sp, 0x4
	bl GetMonData
	adds r4, 0x1C
	adds r0, r4, 0
	add r1, sp, 0x4
	bl StringCopy
	movs r0, 0x80
	lsls r0, 19
	movs r3, 0
	mov r8, r3
	strh r6, [r0]
	bl ResetTasks
	ldr r5, _0804B8F4 @ =gUnknown_03004828
	ldr r0, _0804B8F8 @ =0x0201f000
	str r0, [r5]
	bl ResetSpriteData
	bl FreeAllSpritePalettes
	ldr r0, _0804B8FC @ =sub_804B210
	bl SetVBlankCallback
	bl sub_804B228
	ldr r4, _0804B900 @ =gWindowConfig_81E717C
	adds r0, r4, 0
	bl SetUpWindowConfig
	ldr r0, [r5]
	adds r0, 0x4
	adds r1, r4, 0
	bl InitWindowFromConfig
	movs r0, 0x2
	bl SetTextWindowBaseTileNum
	ldr r1, [r5]
	adds r1, 0x34
	strb r0, [r1]
	ldr r0, [r5]
	adds r0, 0x4
	bl LoadTextWindowGraphics
	bl MenuZeroFillScreen
	ldr r1, _0804B904 @ =gLinkType
	ldr r2, _0804B908 @ =0x00001144
	adds r0, r2, 0
	strh r0, [r1]
	ldr r0, [r5]
	movs r3, 0x8F
	lsls r3, 1
	adds r0, r3
	mov r1, r8
	strb r1, [r0]
	ldr r2, [r5]
	adds r0, r2, 0
	adds r0, 0xB6
	strh r6, [r0]
	adds r0, 0xE
	strh r6, [r0]
	subs r3, 0x1A
	adds r0, r2, r3
	movs r1, 0x40
	strh r1, [r0]
	adds r3, 0x2
	adds r0, r2, r3
	strh r1, [r0]
	adds r1, 0xC8
	adds r0, r2, r1
	strh r6, [r0]
	adds r3, 0x4
	adds r0, r2, r3
	strh r6, [r0]
	movs r0, 0x86
	lsls r0, 1
	adds r1, r2, r0
	movs r0, 0x78
	strh r0, [r1]
	adds r3, 0x4
	adds r1, r2, r3
	movs r0, 0x50
	strh r0, [r1]
	adds r0, 0xC8
	adds r1, r2, r0
	subs r0, 0x18
	strh r0, [r1]
	movs r1, 0x8E
	lsls r1, 1
	adds r0, r2, r1
	strh r6, [r0]
	adds r0, r2, 0
	adds r0, 0xC0
	str r6, [r0]
	ldr r0, _0804B90C @ =gMain
	ldr r2, _0804B910 @ =0x0000043c
	adds r0, r2
	movs r1, 0x5
	strb r1, [r0]
	b _0804B9F2
	.align 2, 0
_0804B8E0: .4byte gUnknown_020297D8
_0804B8E4: .4byte gSpecialVar_0x8005
_0804B8E8: .4byte gLinkPlayers + 0x8
_0804B8EC: .4byte gSaveBlock2
_0804B8F0: .4byte gEnemyParty
_0804B8F4: .4byte gUnknown_03004828
_0804B8F8: .4byte 0x0201f000
_0804B8FC: .4byte sub_804B210
_0804B900: .4byte gWindowConfig_81E717C
_0804B904: .4byte gLinkType
_0804B908: .4byte 0x00001144
_0804B90C: .4byte gMain
_0804B910: .4byte 0x0000043c
_0804B914:
	movs r0, 0
	movs r1, 0
	bl sub_804B2D0
	ldr r1, _0804B924 @ =gMain
	ldr r3, _0804B928 @ =0x0000043c
	adds r1, r3
	b _0804B9D0
	.align 2, 0
_0804B924: .4byte gMain
_0804B928: .4byte 0x0000043c
_0804B92C:
	movs r0, 0
	movs r1, 0x1
	bl sub_804B2D0
	ldr r1, _0804B93C @ =gMain
	ldr r0, _0804B940 @ =0x0000043c
	adds r1, r0
	b _0804B9D0
	.align 2, 0
_0804B93C: .4byte gMain
_0804B940: .4byte 0x0000043c
_0804B944:
	movs r0, 0x1
	movs r1, 0
	bl sub_804B2D0
	b _0804B9CA
_0804B94E:
	movs r0, 0x1
	movs r1, 0x1
	bl sub_804B2D0
	ldr r1, _0804B960 @ =gMain
	ldr r3, _0804B964 @ =0x0000043c
	adds r1, r3
	b _0804B9D0
	.align 2, 0
_0804B960: .4byte gMain
_0804B964: .4byte 0x0000043c
_0804B968:
	bl sub_804C164
	ldr r0, _0804B988 @ =gUnknown_0821594C
	bl LoadSpriteSheet
	ldr r0, _0804B98C @ =gUnknown_08215954
	bl LoadSpritePalette
	ldr r1, _0804B990 @ =REG_BG1CNT
	ldr r2, _0804B994 @ =0x00000502
	adds r0, r2, 0
	strh r0, [r1]
	ldr r1, _0804B998 @ =gMain
	ldr r3, _0804B99C @ =0x0000043c
	adds r1, r3
	b _0804B9D0
	.align 2, 0
_0804B988: .4byte gUnknown_0821594C
_0804B98C: .4byte gUnknown_08215954
_0804B990: .4byte REG_BG1CNT
_0804B994: .4byte 0x00000502
_0804B998: .4byte gMain
_0804B99C: .4byte 0x0000043c
_0804B9A0:
	ldr r0, _0804B9D8 @ =0x0000043c
	adds r1, r2, r0
	ldrb r0, [r1]
	adds r0, 0x1
	strb r0, [r1]
_0804B9AA:
	movs r0, 0x5
	bl sub_804BBE8
	movs r0, 0
	bl sub_804BBE8
	bl sub_804C1A8
	movs r0, 0x1
	negs r0, r0
	movs r1, 0
	str r1, [sp]
	movs r2, 0x10
	movs r3, 0
	bl BeginNormalPaletteFade
_0804B9CA:
	ldr r1, _0804B9DC @ =gMain
	ldr r2, _0804B9D8 @ =0x0000043c
	adds r1, r2
_0804B9D0:
	ldrb r0, [r1]
	adds r0, 0x1
	strb r0, [r1]
	b _0804B9F2
	.align 2, 0
_0804B9D8: .4byte 0x0000043c
_0804B9DC: .4byte gMain
_0804B9E0:
	ldr r0, _0804BA10 @ =gPaletteFade
	ldrb r1, [r0, 0x7]
	movs r0, 0x80
	ands r0, r1
	cmp r0, 0
	bne _0804B9F2
	ldr r0, _0804BA14 @ =sub_804BBCC
	bl SetMainCallback2
_0804B9F2:
	bl RunTasks
	bl AnimateSprites
	bl BuildOamBuffer
	bl UpdatePaletteFade
	add sp, 0x10
	pop {r3}
	mov r8, r3
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_0804BA10: .4byte gPaletteFade
_0804BA14: .4byte sub_804BBCC
	thumb_func_end sub_804B790

	thumb_func_start sub_804BA18
sub_804BA18: @ 804BA18
	push {r4,lr}
	lsls r0, 24
	lsrs r0, 24
	movs r1, 0x64
	muls r1, r0
	ldr r0, _0804BA60 @ =gPlayerParty
	adds r4, r1, r0
	adds r0, r4, 0
	movs r1, 0x2D
	bl GetMonData
	cmp r0, 0
	bne _0804BA5A
	adds r0, r4, 0
	movs r1, 0xB
	movs r2, 0
	bl GetMonData
	lsls r0, 16
	lsrs r0, 16
	bl SpeciesToNationalPokedexNum
	adds r4, r0, 0
	lsls r4, 16
	lsrs r4, 16
	adds r0, r4, 0
	movs r1, 0x2
	bl GetNationalPokedexFlag
	adds r0, r4, 0
	movs r1, 0x3
	bl GetNationalPokedexFlag
_0804BA5A:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0804BA60: .4byte gPlayerParty
	thumb_func_end sub_804BA18

	thumb_func_start sub_804BA64
sub_804BA64: @ 804BA64
	push {lr}
	bl GetMultiplayerId
	lsls r0, 24
	ldr r2, _0804BA90 @ =gLinkPlayers
	movs r1, 0x80
	lsls r1, 17
	eors r1, r0
	lsrs r1, 24
	lsls r0, r1, 3
	subs r0, r1
	lsls r0, 2
	adds r0, r2
	ldrh r1, [r0, 0x2]
	movs r0, 0x80
	lsls r0, 8
	cmp r1, r0
	bne _0804BA8C
	bl EnableNationalPokedex
_0804BA8C:
	pop {r0}
	bx r0
	.align 2, 0
_0804BA90: .4byte gLinkPlayers
	thumb_func_end sub_804BA64

	thumb_func_start sub_804BA94
sub_804BA94: @ 804BA94
	push {r4-r7,lr}
	mov r7, r9
	mov r6, r8
	push {r6,r7}
	sub sp, 0x4
	adds r4, r1, 0
	lsls r0, 24
	lsrs r0, 24
	mov r9, r0
	lsls r4, 24
	lsrs r4, 24
	movs r5, 0x64
	mov r1, r9
	muls r1, r5
	ldr r0, _0804BB60 @ =gPlayerParty
	adds r7, r1, r0
	adds r0, r7, 0
	movs r1, 0x40
	bl GetMonData
	lsls r0, 16
	lsrs r6, r0, 16
	adds r1, r4, 0
	muls r1, r5
	ldr r0, _0804BB64 @ =gEnemyParty
	adds r5, r1, r0
	adds r0, r5, 0
	movs r1, 0x40
	bl GetMonData
	lsls r0, 16
	lsrs r0, 16
	mov r8, r0
	cmp r6, 0xFF
	beq _0804BAE8
	lsls r0, r6, 3
	adds r0, r6
	lsls r0, 2
	ldr r1, _0804BB68 @ =gSaveBlock1 + 0x2B4C
	adds r0, r1
	bl ClearMailStruct
_0804BAE8:
	ldr r4, _0804BB6C @ =gUnknown_03004828
	ldr r0, [r4]
	adds r0, 0x38
	adds r1, r7, 0
	movs r2, 0x64
	bl memcpy
	adds r0, r7, 0
	adds r1, r5, 0
	movs r2, 0x64
	bl memcpy
	ldr r1, [r4]
	adds r1, 0x38
	adds r0, r5, 0
	movs r2, 0x64
	bl memcpy
	movs r1, 0x46
	mov r0, sp
	strb r1, [r0]
	adds r0, r7, 0
	movs r1, 0x2D
	bl GetMonData
	cmp r0, 0
	bne _0804BB28
	adds r0, r7, 0
	movs r1, 0x20
	mov r2, sp
	bl SetMonData
_0804BB28:
	mov r0, r8
	cmp r0, 0xFF
	beq _0804BB3E
	lsls r1, r0, 3
	add r1, r8
	lsls r1, 2
	ldr r0, _0804BB70 @ =gUnknown_02029700
	adds r1, r0
	adds r0, r7, 0
	bl GiveMailToMon2
_0804BB3E:
	mov r0, r9
	bl sub_804BA18
	ldr r0, _0804BB74 @ =gReceivedRemoteLinkPlayers
	ldrb r0, [r0]
	cmp r0, 0
	beq _0804BB50
	bl sub_804BA64
_0804BB50:
	add sp, 0x4
	pop {r3,r4}
	mov r8, r3
	mov r9, r4
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_0804BB60: .4byte gPlayerParty
_0804BB64: .4byte gEnemyParty
_0804BB68: .4byte gSaveBlock1 + 0x2B4C
_0804BB6C: .4byte gUnknown_03004828
_0804BB70: .4byte gUnknown_02029700
_0804BB74: .4byte gReceivedRemoteLinkPlayers
	thumb_func_end sub_804BA94

	thumb_func_start sub_804BB78
sub_804BB78: @ 804BB78
	push {r4,lr}
	ldr r4, _0804BB8C @ =gUnknown_03004828
	ldr r0, [r4]
	adds r0, 0xBD
	ldrb r0, [r0]
	cmp r0, 0x1
	beq _0804BB90
	cmp r0, 0x2
	beq _0804BBB6
	b _0804BBC0
	.align 2, 0
_0804BB8C: .4byte gUnknown_03004828
_0804BB90:
	bl sub_8007ECC
	lsls r0, 24
	cmp r0, 0
	beq _0804BBB6
	bl bitmask_all_link_players_but_self
	lsls r0, 24
	lsrs r0, 24
	ldr r1, [r4]
	adds r1, 0x9E
	movs r2, 0x14
	bl SendBlock
	ldr r1, [r4]
	adds r1, 0xBD
	ldrb r0, [r1]
	adds r0, 0x1
	strb r0, [r1]
_0804BBB6:
	ldr r0, _0804BBC8 @ =gUnknown_03004828
	ldr r0, [r0]
	adds r0, 0xBD
	movs r1, 0
	strb r1, [r0]
_0804BBC0:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0804BBC8: .4byte gUnknown_03004828
	thumb_func_end sub_804BB78

	thumb_func_start sub_804BBCC
sub_804BBCC: @ 804BBCC
	push {lr}
	bl sub_804C29C
	bl RunTasks
	bl AnimateSprites
	bl BuildOamBuffer
	bl UpdatePaletteFade
	pop {r0}
	bx r0
	thumb_func_end sub_804BBCC

	thumb_func_start sub_804BBE8
sub_804BBE8: @ 804BBE8
	push {r4-r7,lr}
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x7
	bls _0804BBF4
	b _0804C0CA
_0804BBF4:
	lsls r0, 2
	ldr r1, _0804BC00 @ =_0804BC04
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_0804BC00: .4byte _0804BC04
	.align 2, 0
_0804BC04:
	.4byte _0804BC24
	.4byte _0804BCC4
	.4byte _0804BD5C
	.4byte _0804BDA4
	.4byte _0804BE48
	.4byte _0804BEF8
	.4byte _0804BFA0
	.4byte _0804C060
_0804BC24:
	ldr r0, _0804BCA0 @ =gUnknown_0820C9F8
	movs r1, 0x10
	movs r2, 0xA0
	bl LoadPalette
	ldr r3, _0804BCA4 @ =gUnknown_0820CA98
	ldr r4, _0804BCA8 @ =0x06004000
	movs r5, 0x98
	lsls r5, 5
	ldr r1, _0804BCAC @ =0x040000d4
	ldr r6, _0804BCB0 @ =0x80000800
	movs r2, 0x80
	lsls r2, 5
	movs r7, 0x80
	lsls r7, 24
_0804BC42:
	str r3, [r1]
	str r4, [r1, 0x4]
	str r6, [r1, 0x8]
	ldr r0, [r1, 0x8]
	adds r3, r2
	adds r4, r2
	subs r5, r2
	cmp r5, r2
	bhi _0804BC42
	str r3, [r1]
	str r4, [r1, 0x4]
	lsrs r0, r5, 1
	orrs r0, r7
	str r0, [r1, 0x8]
	ldr r0, [r1, 0x8]
	ldr r1, _0804BCB4 @ =gUnknown_0820F798
	ldr r2, _0804BCB8 @ =0x06009000
	ldr r0, _0804BCAC @ =0x040000d4
	str r1, [r0]
	str r2, [r0, 0x4]
	ldr r1, _0804BCB0 @ =0x80000800
	str r1, [r0, 0x8]
	ldr r0, [r0, 0x8]
	ldr r0, _0804BCBC @ =gUnknown_03004828
	ldr r2, [r0]
	movs r0, 0x8A
	lsls r0, 1
	adds r1, r2, r0
	movs r0, 0
	strh r0, [r1]
	movs r3, 0x8B
	lsls r3, 1
	adds r1, r2, r3
	movs r0, 0xB4
	strh r0, [r1]
	movs r1, 0x80
	lsls r1, 19
	movs r4, 0xBA
	lsls r4, 5
	adds r0, r4, 0
	strh r0, [r1]
	adds r1, 0xC
	ldr r2, _0804BCC0 @ =0x00005206
	adds r0, r2, 0
	strh r0, [r1]
	b _0804C0CA
	.align 2, 0
_0804BCA0: .4byte gUnknown_0820C9F8
_0804BCA4: .4byte gUnknown_0820CA98
_0804BCA8: .4byte 0x06004000
_0804BCAC: .4byte 0x040000d4
_0804BCB0: .4byte 0x80000800
_0804BCB4: .4byte gUnknown_0820F798
_0804BCB8: .4byte 0x06009000
_0804BCBC: .4byte gUnknown_03004828
_0804BCC0: .4byte 0x00005206
_0804BCC4:
	ldr r0, _0804BD3C @ =gUnknown_03004828
	ldr r2, [r0]
	movs r3, 0x89
	lsls r3, 1
	adds r1, r2, r3
	movs r0, 0
	strh r0, [r1]
	movs r4, 0x88
	lsls r4, 1
	adds r0, r2, r4
	movs r1, 0xAE
	lsls r1, 1
	strh r1, [r0]
	ldr r0, _0804BD40 @ =REG_BG1VOFS
	strh r1, [r0]
	ldr r1, _0804BD44 @ =REG_BG1CNT
	ldr r2, _0804BD48 @ =0x00008502
	adds r0, r2, 0
	strh r0, [r1]
	ldr r0, _0804BD4C @ =gUnknown_08210798
	ldr r2, _0804BD50 @ =0x06002800
	movs r3, 0x80
	lsls r3, 5
	adds r1, 0xCA
	str r0, [r1]
	str r2, [r1, 0x4]
	lsrs r0, r3, 1
	movs r2, 0x80
	lsls r2, 24
	orrs r0, r2
	str r0, [r1, 0x8]
	ldr r4, [r1, 0x8]
	ldr r4, _0804BD54 @ =gUnknown_0820CA98
	movs r5, 0xC0
	lsls r5, 19
	movs r6, 0x98
	lsls r6, 5
	adds r7, r0, 0
_0804BD10:
	str r4, [r1]
	str r5, [r1, 0x4]
	str r7, [r1, 0x8]
	ldr r0, [r1, 0x8]
	adds r4, r3
	adds r5, r3
	subs r6, r3
	cmp r6, r3
	bhi _0804BD10
	str r4, [r1]
	str r5, [r1, 0x4]
	lsrs r0, r6, 1
	orrs r0, r2
	str r0, [r1, 0x8]
	ldr r0, [r1, 0x8]
	movs r1, 0x80
	lsls r1, 19
	ldr r3, _0804BD58 @ =0x00001241
	adds r0, r3, 0
	strh r0, [r1]
	b _0804C0CA
	.align 2, 0
_0804BD3C: .4byte gUnknown_03004828
_0804BD40: .4byte REG_BG1VOFS
_0804BD44: .4byte REG_BG1CNT
_0804BD48: .4byte 0x00008502
_0804BD4C: .4byte gUnknown_08210798
_0804BD50: .4byte 0x06002800
_0804BD54: .4byte gUnknown_0820CA98
_0804BD58: .4byte 0x00001241
_0804BD5C:
	ldr r0, _0804BD8C @ =gUnknown_03004828
	ldr r2, [r0]
	movs r4, 0x88
	lsls r4, 1
	adds r0, r2, r4
	movs r1, 0
	strh r1, [r0]
	movs r3, 0x89
	lsls r3, 1
	adds r0, r2, r3
	strh r1, [r0]
	movs r1, 0x80
	lsls r1, 19
	ldr r4, _0804BD90 @ =0x00001241
	adds r0, r4, 0
	strh r0, [r1]
	ldr r1, _0804BD94 @ =gUnknown_08211798
	ldr r2, _0804BD98 @ =0x06002800
	ldr r0, _0804BD9C @ =0x040000d4
	str r1, [r0]
	str r2, [r0, 0x4]
	ldr r1, _0804BDA0 @ =0x80000400
	b _0804C0C6
	.align 2, 0
_0804BD8C: .4byte gUnknown_03004828
_0804BD90: .4byte 0x00001241
_0804BD94: .4byte gUnknown_08211798
_0804BD98: .4byte 0x06002800
_0804BD9C: .4byte 0x040000d4
_0804BDA0: .4byte 0x80000400
_0804BDA4:
	movs r1, 0x80
	lsls r1, 19
	movs r2, 0x92
	lsls r2, 5
	adds r0, r2, 0
	strh r0, [r1]
	ldr r0, _0804BE24 @ =gUnknown_03004828
	ldr r3, [r0]
	movs r4, 0x82
	lsls r4, 1
	adds r1, r3, r4
	movs r2, 0
	movs r0, 0x40
	strh r0, [r1]
	adds r4, 0x2
	adds r1, r3, r4
	strh r0, [r1]
	adds r0, 0xCC
	adds r1, r3, r0
	movs r0, 0x78
	strh r0, [r1]
	adds r4, 0x8
	adds r1, r3, r4
	ldr r0, _0804BE28 @ =0x0000ffba
	strh r0, [r1]
	movs r1, 0x8E
	lsls r1, 1
	adds r0, r3, r1
	strh r2, [r0]
	ldr r3, _0804BE2C @ =gUnknown_0820DD98
	ldr r4, _0804BE30 @ =0x06004000
	movs r5, 0xD0
	lsls r5, 5
	ldr r2, _0804BE34 @ =gUnknown_08211F98
	mov r12, r2
	ldr r1, _0804BE38 @ =0x040000d4
	ldr r6, _0804BE3C @ =0x80000800
	movs r2, 0x80
	lsls r2, 5
	movs r7, 0x80
	lsls r7, 24
_0804BDF6:
	str r3, [r1]
	str r4, [r1, 0x4]
	str r6, [r1, 0x8]
	ldr r0, [r1, 0x8]
	adds r3, r2
	adds r4, r2
	subs r5, r2
	cmp r5, r2
	bhi _0804BDF6
	str r3, [r1]
	str r4, [r1, 0x4]
	lsrs r0, r5, 1
	orrs r0, r7
	str r0, [r1, 0x8]
	ldr r0, [r1, 0x8]
	ldr r1, _0804BE40 @ =0x06009000
	ldr r0, _0804BE38 @ =0x040000d4
	mov r3, r12
	str r3, [r0]
	str r1, [r0, 0x4]
	ldr r1, _0804BE44 @ =0x80000080
	b _0804C0C6
	.align 2, 0
_0804BE24: .4byte gUnknown_03004828
_0804BE28: .4byte 0x0000ffba
_0804BE2C: .4byte gUnknown_0820DD98
_0804BE30: .4byte 0x06004000
_0804BE34: .4byte gUnknown_08211F98
_0804BE38: .4byte 0x040000d4
_0804BE3C: .4byte 0x80000800
_0804BE40: .4byte 0x06009000
_0804BE44: .4byte 0x80000080
_0804BE48:
	movs r1, 0x80
	lsls r1, 19
	ldr r4, _0804BED0 @ =0x00001441
	adds r0, r4, 0
	strh r0, [r1]
	adds r1, 0xC
	ldr r2, _0804BED4 @ =0x00001287
	adds r0, r2, 0
	strh r0, [r1]
	ldr r0, _0804BED8 @ =gUnknown_03004828
	ldr r3, [r0]
	movs r4, 0x82
	lsls r4, 1
	adds r1, r3, r4
	movs r2, 0
	movs r0, 0x40
	strh r0, [r1]
	adds r0, 0xC6
	adds r1, r3, r0
	movs r0, 0x5C
	strh r0, [r1]
	adds r4, 0x14
	adds r1, r3, r4
	movs r0, 0x20
	strh r0, [r1]
	adds r0, 0xFA
	adds r1, r3, r0
	movs r0, 0x80
	lsls r0, 3
	strh r0, [r1]
	movs r1, 0x8E
	lsls r1, 1
	adds r0, r3, r1
	strh r2, [r0]
	ldr r3, _0804BEDC @ =gUnknown_08213738
	ldr r4, _0804BEE0 @ =0x06004000
	movs r5, 0x81
	lsls r5, 6
	ldr r2, _0804BEE4 @ =gUnknown_08215778
	mov r12, r2
	ldr r1, _0804BEE8 @ =0x040000d4
	ldr r6, _0804BEEC @ =0x80000800
	movs r2, 0x80
	lsls r2, 5
	movs r7, 0x80
	lsls r7, 24
_0804BEA4:
	str r3, [r1]
	str r4, [r1, 0x4]
	str r6, [r1, 0x8]
	ldr r0, [r1, 0x8]
	adds r3, r2
	adds r4, r2
	subs r5, r2
	cmp r5, r2
	bhi _0804BEA4
	str r3, [r1]
	str r4, [r1, 0x4]
	lsrs r0, r5, 1
	orrs r0, r7
	str r0, [r1, 0x8]
	ldr r0, [r1, 0x8]
	ldr r1, _0804BEF0 @ =0x06009000
	ldr r0, _0804BEE8 @ =0x040000d4
	mov r3, r12
	str r3, [r0]
	str r1, [r0, 0x4]
	ldr r1, _0804BEF4 @ =0x80000080
	b _0804C0C6
	.align 2, 0
_0804BED0: .4byte 0x00001441
_0804BED4: .4byte 0x00001287
_0804BED8: .4byte gUnknown_03004828
_0804BEDC: .4byte gUnknown_08213738
_0804BEE0: .4byte 0x06004000
_0804BEE4: .4byte gUnknown_08215778
_0804BEE8: .4byte 0x040000d4
_0804BEEC: .4byte 0x80000800
_0804BEF0: .4byte 0x06009000
_0804BEF4: .4byte 0x80000080
_0804BEF8:
	ldr r0, _0804BF78 @ =gUnknown_03004828
	ldr r2, [r0]
	movs r4, 0x88
	lsls r4, 1
	adds r0, r2, r4
	movs r1, 0
	strh r1, [r0]
	movs r3, 0x89
	lsls r3, 1
	adds r0, r2, r3
	strh r1, [r0]
	ldr r1, _0804BF7C @ =REG_BG1CNT
	ldr r4, _0804BF80 @ =0x00000502
	adds r0, r4, 0
	strh r0, [r1]
	ldr r0, _0804BF84 @ =gUnknown_08D00000
	movs r1, 0xC0
	lsls r1, 19
	bl LZDecompressVram
	ldr r0, _0804BF88 @ =gUnknown_08D00524
	ldr r4, _0804BF8C @ =0x02000000
	movs r2, 0x80
	lsls r2, 4
	adds r1, r4, 0
	bl CpuSet
	ldr r0, _0804BF90 @ =gUnknown_08D004E0
	movs r1, 0x70
	movs r2, 0x20
	bl LoadCompressedPalette
	movs r0, 0
	movs r1, 0
	movs r2, 0x2
	bl FillPalette
	movs r0, 0xE0
	lsls r0, 7
	adds r2, r0, 0
	movs r1, 0xA0
	lsls r1, 2
_0804BF4C:
	ldrh r0, [r4]
	orrs r0, r2
	strh r0, [r4]
	adds r4, 0x2
	subs r1, 0x1
	cmp r1, 0
	bne _0804BF4C
	ldr r1, _0804BF8C @ =0x02000000
	ldr r2, _0804BF94 @ =0x06002800
	ldr r0, _0804BF98 @ =0x040000d4
	str r1, [r0]
	str r2, [r0, 0x4]
	ldr r1, _0804BF9C @ =0x80000280
	str r1, [r0, 0x8]
	ldr r0, [r0, 0x8]
	movs r0, 0x2
	movs r1, 0xF
	movs r2, 0x1B
	movs r3, 0x12
	bl MenuZeroFillWindowRect
	b _0804C0CA
	.align 2, 0
_0804BF78: .4byte gUnknown_03004828
_0804BF7C: .4byte REG_BG1CNT
_0804BF80: .4byte 0x00000502
_0804BF84: .4byte gUnknown_08D00000
_0804BF88: .4byte gUnknown_08D00524
_0804BF8C: .4byte 0x02000000
_0804BF90: .4byte gUnknown_08D004E0
_0804BF94: .4byte 0x06002800
_0804BF98: .4byte 0x040000d4
_0804BF9C: .4byte 0x80000280
_0804BFA0:
	movs r1, 0x80
	lsls r1, 19
	ldr r2, _0804C038 @ =0x00001441
	adds r0, r2, 0
	strh r0, [r1]
	adds r1, 0xC
	ldr r3, _0804C03C @ =0x00001287
	adds r0, r3, 0
	strh r0, [r1]
	ldr r0, _0804C040 @ =gUnknown_03004828
	ldr r3, [r0]
	movs r4, 0x82
	lsls r4, 1
	adds r1, r3, r4
	movs r2, 0
	movs r0, 0x40
	strh r0, [r1]
	adds r0, 0xC6
	adds r1, r3, r0
	movs r0, 0x5C
	strh r0, [r1]
	adds r4, 0x14
	adds r1, r3, r4
	adds r0, 0xA4
	strh r0, [r1]
	adds r0, 0x1A
	adds r1, r3, r0
	movs r0, 0x80
	strh r0, [r1]
	subs r4, 0xC
	adds r1, r3, r4
	movs r0, 0x78
	strh r0, [r1]
	adds r0, 0x96
	adds r1, r3, r0
	movs r0, 0x50
	strh r0, [r1]
	movs r1, 0x8E
	lsls r1, 1
	adds r0, r3, r1
	strh r2, [r0]
	ldr r3, _0804C044 @ =gUnknown_08213738
	ldr r4, _0804C048 @ =0x06004000
	movs r5, 0x81
	lsls r5, 6
	ldr r2, _0804C04C @ =gUnknown_08215778
	mov r12, r2
	ldr r1, _0804C050 @ =0x040000d4
	ldr r6, _0804C054 @ =0x80000800
	movs r2, 0x80
	lsls r2, 5
	movs r7, 0x80
	lsls r7, 24
_0804C00A:
	str r3, [r1]
	str r4, [r1, 0x4]
	str r6, [r1, 0x8]
	ldr r0, [r1, 0x8]
	adds r3, r2
	adds r4, r2
	subs r5, r2
	cmp r5, r2
	bhi _0804C00A
	str r3, [r1]
	str r4, [r1, 0x4]
	lsrs r0, r5, 1
	orrs r0, r7
	str r0, [r1, 0x8]
	ldr r0, [r1, 0x8]
	ldr r1, _0804C058 @ =0x06009000
	ldr r0, _0804C050 @ =0x040000d4
	mov r3, r12
	str r3, [r0]
	str r1, [r0, 0x4]
	ldr r1, _0804C05C @ =0x80000080
	b _0804C0C6
	.align 2, 0
_0804C038: .4byte 0x00001441
_0804C03C: .4byte 0x00001287
_0804C040: .4byte gUnknown_03004828
_0804C044: .4byte gUnknown_08213738
_0804C048: .4byte 0x06004000
_0804C04C: .4byte gUnknown_08215778
_0804C050: .4byte 0x040000d4
_0804C054: .4byte 0x80000800
_0804C058: .4byte 0x06009000
_0804C05C: .4byte 0x80000080
_0804C060:
	ldr r0, _0804C0D0 @ =gUnknown_03004828
	ldr r2, [r0]
	movs r4, 0x8A
	lsls r4, 1
	adds r0, r2, r4
	movs r1, 0
	strh r1, [r0]
	movs r3, 0x8B
	lsls r3, 1
	adds r0, r2, r3
	strh r1, [r0]
	ldr r1, _0804C0D4 @ =REG_BG2CNT
	ldr r4, _0804C0D8 @ =0x00005206
	adds r0, r4, 0
	strh r0, [r1]
	ldr r0, _0804C0DC @ =gUnknown_0820C9F8
	movs r1, 0x10
	movs r2, 0xA0
	bl LoadPalette
	ldr r3, _0804C0E0 @ =gUnknown_0820CA98
	ldr r4, _0804C0E4 @ =0x06004000
	movs r5, 0x98
	lsls r5, 5
	ldr r1, _0804C0E8 @ =0x040000d4
	ldr r6, _0804C0EC @ =0x80000800
	movs r2, 0x80
	lsls r2, 5
	movs r7, 0x80
	lsls r7, 24
_0804C09C:
	str r3, [r1]
	str r4, [r1, 0x4]
	str r6, [r1, 0x8]
	ldr r0, [r1, 0x8]
	adds r3, r2
	adds r4, r2
	subs r5, r2
	cmp r5, r2
	bhi _0804C09C
	str r3, [r1]
	str r4, [r1, 0x4]
	lsrs r0, r5, 1
	orrs r0, r7
	str r0, [r1, 0x8]
	ldr r0, [r1, 0x8]
	ldr r1, _0804C0F0 @ =gUnknown_0820F798
	ldr r2, _0804C0F4 @ =0x06009000
	ldr r0, _0804C0E8 @ =0x040000d4
	str r1, [r0]
	str r2, [r0, 0x4]
	ldr r1, _0804C0EC @ =0x80000800
_0804C0C6:
	str r1, [r0, 0x8]
	ldr r0, [r0, 0x8]
_0804C0CA:
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_0804C0D0: .4byte gUnknown_03004828
_0804C0D4: .4byte REG_BG2CNT
_0804C0D8: .4byte 0x00005206
_0804C0DC: .4byte gUnknown_0820C9F8
_0804C0E0: .4byte gUnknown_0820CA98
_0804C0E4: .4byte 0x06004000
_0804C0E8: .4byte 0x040000d4
_0804C0EC: .4byte 0x80000800
_0804C0F0: .4byte gUnknown_0820F798
_0804C0F4: .4byte 0x06009000
	thumb_func_end sub_804BBE8

	thumb_func_start sub_804C0F8
sub_804C0F8: @ 804C0F8
	push {lr}
	lsls r0, 24
	cmp r0, 0
	bne _0804C130
	ldr r0, _0804C128 @ =gUnknown_03004828
	ldr r2, [r0]
	movs r1, 0x88
	lsls r1, 1
	adds r0, r2, r1
	movs r3, 0
	ldrsh r1, [r0, r3]
	ldr r0, _0804C12C @ =0x00000109
	cmp r1, r0
	bgt _0804C15A
	adds r0, 0x5
	adds r1, r2, r0
	ldrh r0, [r1]
	adds r0, 0x1
	strh r0, [r1]
	movs r3, 0x8E
	lsls r3, 1
	adds r1, r2, r3
	b _0804C154
	.align 2, 0
_0804C128: .4byte gUnknown_03004828
_0804C12C: .4byte 0x00000109
_0804C130:
	ldr r0, _0804C160 @ =gUnknown_03004828
	ldr r0, [r0]
	mov r12, r0
	movs r2, 0x87
	lsls r2, 1
	add r2, r12
	ldrh r3, [r2]
	movs r0, 0
	ldrsh r1, [r2, r0]
	movs r0, 0x40
	negs r0, r0
	cmp r1, r0
	ble _0804C15A
	subs r0, r3, 0x1
	strh r0, [r2]
	movs r1, 0x8E
	lsls r1, 1
	add r1, r12
_0804C154:
	ldrh r0, [r1]
	adds r0, 0x40
	strh r0, [r1]
_0804C15A:
	pop {r0}
	bx r0
	.align 2, 0
_0804C160: .4byte gUnknown_03004828
	thumb_func_end sub_804C0F8

	thumb_func_start sub_804C164
sub_804C164: @ 804C164
	push {lr}
	ldr r0, _0804C190 @ =gUnknown_082159A4
	bl LoadSpriteSheet
	ldr r0, _0804C194 @ =gUnknown_082159F4
	bl LoadSpriteSheet
	ldr r0, _0804C198 @ =gUnknown_08215A28
	bl LoadSpriteSheet
	ldr r0, _0804C19C @ =gUnknown_08215A78
	bl LoadSpriteSheet
	ldr r0, _0804C1A0 @ =gUnknown_082159AC
	bl LoadSpritePalette
	ldr r0, _0804C1A4 @ =gUnknown_082159B4
	bl LoadSpritePalette
	pop {r0}
	bx r0
	.align 2, 0
_0804C190: .4byte gUnknown_082159A4
_0804C194: .4byte gUnknown_082159F4
_0804C198: .4byte gUnknown_08215A28
_0804C19C: .4byte gUnknown_08215A78
_0804C1A0: .4byte gUnknown_082159AC
_0804C1A4: .4byte gUnknown_082159B4
	thumb_func_end sub_804C164

	thumb_func_start sub_804C1A8
sub_804C1A8: @ 804C1A8
	push {r4,r5,lr}
	sub sp, 0x14
	ldr r0, _0804C21C @ =gUnknown_03004828
	ldr r0, [r0]
	movs r1, 0x8F
	lsls r1, 1
	adds r0, r1
	ldrb r0, [r0]
	cmp r0, 0
	beq _0804C23C
	bl GetMultiplayerId
	lsls r0, 24
	ldr r3, _0804C220 @ =gStringVar1
	movs r2, 0x80
	lsls r2, 17
	eors r2, r0
	lsrs r2, 24
	lsls r1, r2, 3
	subs r1, r2
	lsls r1, 2
	ldr r0, _0804C224 @ =gLinkPlayers + 0x8
	adds r1, r0
	adds r0, r3, 0
	bl StringCopy
	ldr r5, _0804C228 @ =gUnknown_020297D8
	ldrb r0, [r5, 0x1]
	movs r1, 0x6
	bl __umodsi3
	lsls r0, 24
	lsrs r0, 24
	movs r4, 0x64
	muls r0, r4
	ldr r1, _0804C22C @ =gEnemyParty
	adds r0, r1
	movs r1, 0x2
	mov r2, sp
	bl GetMonData
	ldr r0, _0804C230 @ =gStringVar3
	mov r1, sp
	bl StringCopy10
	ldrb r0, [r5]
	muls r0, r4
	ldr r1, _0804C234 @ =gPlayerParty
	adds r0, r1
	movs r1, 0x2
	mov r2, sp
	bl GetMonData
	ldr r0, _0804C238 @ =gStringVar2
	mov r1, sp
	bl StringCopy10
	b _0804C278
	.align 2, 0
_0804C21C: .4byte gUnknown_03004828
_0804C220: .4byte gStringVar1
_0804C224: .4byte gLinkPlayers + 0x8
_0804C228: .4byte gUnknown_020297D8
_0804C22C: .4byte gEnemyParty
_0804C230: .4byte gStringVar3
_0804C234: .4byte gPlayerParty
_0804C238: .4byte gStringVar2
_0804C23C:
	ldr r0, _0804C280 @ =gSpecialVar_0x8004
	ldrh r0, [r0]
	lsls r4, r0, 4
	subs r4, r0
	lsls r4, 2
	ldr r0, _0804C284 @ =gIngameTrades
	adds r4, r0
	ldr r0, _0804C288 @ =gStringVar1
	adds r1, r4, 0
	adds r1, 0x2B
	bl StringCopy
	ldr r0, _0804C28C @ =gStringVar3
	adds r1, r4, 0
	bl StringCopy10
	ldr r0, _0804C290 @ =gSpecialVar_0x8005
	ldrh r1, [r0]
	movs r0, 0x64
	muls r0, r1
	ldr r1, _0804C294 @ =gPlayerParty
	adds r0, r1
	movs r1, 0x2
	mov r2, sp
	bl GetMonData
	ldr r0, _0804C298 @ =gStringVar2
	mov r1, sp
	bl StringCopy10
_0804C278:
	add sp, 0x14
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_0804C280: .4byte gSpecialVar_0x8004
_0804C284: .4byte gIngameTrades
_0804C288: .4byte gStringVar1
_0804C28C: .4byte gStringVar3
_0804C290: .4byte gSpecialVar_0x8005
_0804C294: .4byte gPlayerParty
_0804C298: .4byte gStringVar2
	thumb_func_end sub_804C1A8

	.align 2, 0 @ Don't pad with nop.
