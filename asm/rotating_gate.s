	.include "constants/gba_constants.inc"
	.include "constants/species_constants.inc"
	.include "asm/macros.inc"

	.syntax unified

	.text

	thumb_func_start GetCurrentMapRotatingGatePuzzleType
GetCurrentMapRotatingGatePuzzleType: @ 80C799C
	push {lr}
	ldr r0, _080C79B0 @ =gSaveBlock1
	ldrh r1, [r0, 0x4]
	movs r0, 0x86
	lsls r0, 1
	cmp r1, r0
	bne _080C79B4
	movs r0, 0x1
	b _080C79C6
	.align 2, 0
_080C79B0: .4byte gSaveBlock1
_080C79B4:
	ldr r0, _080C79C0 @ =0x0000081d
	cmp r1, r0
	beq _080C79C4
	movs r0, 0
	b _080C79C6
	.align 2, 0
_080C79C0: .4byte 0x0000081d
_080C79C4:
	movs r0, 0x2
_080C79C6:
	pop {r1}
	bx r1
	thumb_func_end GetCurrentMapRotatingGatePuzzleType

	thumb_func_start sub_80C79CC
sub_80C79CC: @ 80C79CC
	push {r4-r6,lr}
	movs r0, 0x80
	lsls r0, 7
	bl GetVarPointer
	adds r5, r0, 0
	movs r3, 0
	ldr r4, _080C7A00 @ =gUnknown_02038804
	ldrb r0, [r4]
	cmp r3, r0
	bge _080C79F8
	ldr r6, _080C7A04 @ =gUnknown_02038800
_080C79E4:
	adds r2, r5, r3
	ldr r1, [r6]
	lsls r0, r3, 3
	adds r0, r1
	ldrb r0, [r0, 0x5]
	strb r0, [r2]
	adds r3, 0x1
	ldrb r0, [r4]
	cmp r3, r0
	blt _080C79E4
_080C79F8:
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_080C7A00: .4byte gUnknown_02038804
_080C7A04: .4byte gUnknown_02038800
	thumb_func_end sub_80C79CC

	thumb_func_start sub_80C7A08
sub_80C7A08: @ 80C7A08
	push {r4,lr}
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	movs r0, 0x80
	lsls r0, 7
	bl GetVarPointer
	adds r0, r4
	ldrb r0, [r0]
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end sub_80C7A08

	thumb_func_start sub_80C7A24
sub_80C7A24: @ 80C7A24
	push {r4,r5,lr}
	adds r4, r0, 0
	adds r5, r1, 0
	lsls r4, 24
	lsrs r4, 24
	lsls r5, 24
	lsrs r5, 24
	movs r0, 0x80
	lsls r0, 7
	bl GetVarPointer
	adds r0, r4
	strb r5, [r0]
	pop {r4,r5}
	pop {r0}
	bx r0
	thumb_func_end sub_80C7A24

	thumb_func_start sub_80C7A44
sub_80C7A44: @ 80C7A44
	push {r4,r5,lr}
	adds r4, r1, 0
	lsls r0, 24
	lsrs r5, r0, 24
	adds r0, r5, 0
	bl sub_80C7A08
	lsls r0, 24
	lsrs r1, r0, 24
	cmp r4, 0x1
	bne _080C7A68
	cmp r1, 0
	beq _080C7A64
	subs r0, r1, 0x1
	lsls r0, 24
	b _080C7A72
_080C7A64:
	movs r1, 0x3
	b _080C7A74
_080C7A68:
	adds r1, 0x1
	lsls r1, 24
	movs r0, 0xC0
	lsls r0, 18
	ands r0, r1
_080C7A72:
	lsrs r1, r0, 24
_080C7A74:
	adds r0, r5, 0
	bl sub_80C7A24
	pop {r4,r5}
	pop {r0}
	bx r0
	thumb_func_end sub_80C7A44

	thumb_func_start sub_80C7A80
sub_80C7A80: @ 80C7A80
	push {lr}
	bl GetCurrentMapRotatingGatePuzzleType
	cmp r0, 0x1
	beq _080C7A94
	cmp r0, 0x1
	ble _080C7AC8
	cmp r0, 0x2
	beq _080C7AAC
	b _080C7AC8
_080C7A94:
	ldr r1, _080C7AA0 @ =gUnknown_02038800
	ldr r0, _080C7AA4 @ =gUnknown_083D2964
	str r0, [r1]
	ldr r1, _080C7AA8 @ =gUnknown_02038804
	movs r0, 0x7
	b _080C7AB6
	.align 2, 0
_080C7AA0: .4byte gUnknown_02038800
_080C7AA4: .4byte gUnknown_083D2964
_080C7AA8: .4byte gUnknown_02038804
_080C7AAC:
	ldr r1, _080C7ACC @ =gUnknown_02038800
	ldr r0, _080C7AD0 @ =gUnknown_083D299C
	str r0, [r1]
	ldr r1, _080C7AD4 @ =gUnknown_02038804
	movs r0, 0xE
_080C7AB6:
	strb r0, [r1]
	movs r1, 0
	ldr r3, _080C7AD8 @ =gUnknown_020387F0
	movs r2, 0x40
_080C7ABE:
	adds r0, r1, r3
	strb r2, [r0]
	adds r1, 0x1
	cmp r1, 0xD
	bls _080C7ABE
_080C7AC8:
	pop {r0}
	bx r0
	.align 2, 0
_080C7ACC: .4byte gUnknown_02038800
_080C7AD0: .4byte gUnknown_083D299C
_080C7AD4: .4byte gUnknown_02038804
_080C7AD8: .4byte gUnknown_020387F0
	thumb_func_end sub_80C7A80

	thumb_func_start sub_80C7ADC
sub_80C7ADC: @ 80C7ADC
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	sub sp, 0x4
	lsls r0, 16
	lsrs r0, 16
	str r0, [sp]
	lsls r1, 16
	lsrs r1, 16
	mov r10, r1
	ldr r2, _080C7B9C @ =gSaveBlock1
	ldrh r1, [r2]
	subs r0, r1, 0x2
	lsls r0, 16
	lsrs r3, r0, 16
	adds r1, 0x11
	lsls r1, 16
	lsrs r1, 16
	mov r9, r1
	ldrh r1, [r2, 0x2]
	subs r0, r1, 0x2
	lsls r0, 16
	lsrs r2, r0, 16
	adds r1, 0xE
	lsls r1, 16
	lsrs r1, 16
	mov r8, r1
	movs r5, 0
	ldr r0, _080C7BA0 @ =gUnknown_02038804
	ldrb r0, [r0]
	cmp r5, r0
	bcs _080C7B8C
	lsls r0, r2, 16
	asrs r7, r0, 16
	lsls r0, r3, 16
	asrs r6, r0, 16
_080C7B28:
	ldr r0, _080C7BA4 @ =gUnknown_02038800
	ldr r0, [r0]
	lsls r1, r5, 3
	adds r1, r0
	ldrh r0, [r1]
	adds r0, 0x7
	lsls r0, 16
	lsrs r2, r0, 16
	ldrh r0, [r1, 0x2]
	adds r0, 0x7
	lsls r0, 16
	asrs r1, r0, 16
	cmp r7, r1
	bgt _080C7B7E
	mov r3, r8
	lsls r0, r3, 16
	asrs r0, 16
	cmp r0, r1
	blt _080C7B7E
	lsls r0, r2, 16
	asrs r1, r0, 16
	cmp r6, r1
	bgt _080C7B7E
	mov r2, r9
	lsls r0, r2, 16
	asrs r0, 16
	cmp r0, r1
	blt _080C7B7E
	ldr r0, _080C7BA8 @ =gUnknown_020387F0
	adds r4, r5, r0
	ldrb r0, [r4]
	cmp r0, 0x40
	bne _080C7B7E
	ldr r3, [sp]
	lsls r1, r3, 16
	mov r0, r10
	lsls r2, r0, 16
	adds r0, r5, 0
	asrs r1, 16
	asrs r2, 16
	bl sub_80C7BAC
	strb r0, [r4]
_080C7B7E:
	adds r0, r5, 0x1
	lsls r0, 24
	lsrs r5, r0, 24
	ldr r0, _080C7BA0 @ =gUnknown_02038804
	ldrb r0, [r0]
	cmp r5, r0
	bcc _080C7B28
_080C7B8C:
	add sp, 0x4
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080C7B9C: .4byte gSaveBlock1
_080C7BA0: .4byte gUnknown_02038804
_080C7BA4: .4byte gUnknown_02038800
_080C7BA8: .4byte gUnknown_020387F0
	thumb_func_end sub_80C7ADC

	thumb_func_start sub_80C7BAC
sub_80C7BAC: @ 80C7BAC
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	sub sp, 0x18
	lsls r0, 24
	lsrs r6, r0, 24
	lsls r1, 16
	lsrs r7, r1, 16
	lsls r2, 16
	lsrs r2, 16
	mov r8, r2
	ldr r0, _080C7BDC @ =gUnknown_02038800
	lsls r1, r6, 3
	ldr r0, [r0]
	adds r4, r0, r1
	ldrb r0, [r4, 0x4]
	cmp r0, 0
	beq _080C7BD4
	cmp r0, 0x4
	bne _080C7BE4
_080C7BD4:
	mov r1, sp
	ldr r0, _080C7BE0 @ =gSpriteTemplate_83D60A4
	b _080C7BE8
	.align 2, 0
_080C7BDC: .4byte gUnknown_02038800
_080C7BE0: .4byte gSpriteTemplate_83D60A4
_080C7BE4:
	mov r1, sp
	ldr r0, _080C7C7C @ =gSpriteTemplate_83D608C
_080C7BE8:
	ldm r0!, {r2,r3,r5}
	stm r1!, {r2,r3,r5}
	ldm r0!, {r2,r3,r5}
	stm r1!, {r2,r3,r5}
	mov r2, sp
	ldrb r0, [r4, 0x4]
	movs r3, 0x98
	lsls r3, 5
	adds r1, r3, 0
	adds r0, r1
	strh r0, [r2]
	mov r0, sp
	movs r1, 0
	movs r2, 0
	movs r3, 0x94
	bl CreateSprite
	lsls r0, 24
	lsrs r5, r0, 24
	cmp r5, 0x40
	beq _080C7C84
	ldrh r0, [r4]
	adds r0, 0x7
	ldrh r1, [r4, 0x2]
	adds r1, 0x7
	lsls r4, r5, 4
	adds r4, r5
	lsls r4, 2
	ldr r2, _080C7C80 @ =gSprites
	adds r4, r2
	strh r6, [r4, 0x2E]
	movs r2, 0x3E
	adds r2, r4
	mov r12, r2
	ldrb r2, [r2]
	movs r3, 0x2
	orrs r2, r3
	mov r3, r12
	strb r2, [r3]
	lsls r0, 16
	asrs r0, 16
	lsls r2, r7, 16
	asrs r2, 16
	adds r0, r2
	lsls r0, 16
	asrs r0, 16
	lsls r1, 16
	asrs r1, 16
	mov r3, r8
	lsls r2, r3, 16
	asrs r2, 16
	adds r1, r2
	lsls r1, 16
	asrs r1, 16
	adds r2, r4, 0
	adds r2, 0x20
	adds r3, r4, 0
	adds r3, 0x22
	bl sub_8060388
	adds r0, r4, 0
	bl sub_80C7D14
	adds r0, r6, 0
	bl sub_80C7A08
	adds r1, r0, 0
	lsls r1, 24
	lsrs r1, 24
	adds r0, r4, 0
	bl StartSpriteAffineAnim
	adds r0, r5, 0
	b _080C7C86
	.align 2, 0
_080C7C7C: .4byte gSpriteTemplate_83D608C
_080C7C80: .4byte gSprites
_080C7C84:
	movs r0, 0x40
_080C7C86:
	add sp, 0x18
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r1}
	bx r1
	thumb_func_end sub_80C7BAC

	thumb_func_start sub_80C7C94
sub_80C7C94: @ 80C7C94
	push {r4-r7,lr}
	adds r6, r0, 0
	ldrh r0, [r6, 0x30]
	lsls r0, 24
	lsrs r5, r0, 24
	ldrh r0, [r6, 0x32]
	lsls r0, 24
	lsrs r4, r0, 24
	adds r7, r4, 0
	adds r0, r6, 0
	bl sub_80C7D14
	cmp r5, 0x1
	bne _080C7CDA
	adds r0, r4, 0x4
	lsls r0, 24
	lsrs r4, r0, 24
	bl GetCurrentPlayerSpeed
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x1
	beq _080C7CCA
	adds r0, r4, 0
	adds r0, 0x8
	lsls r0, 24
	lsrs r4, r0, 24
_080C7CCA:
	movs r0, 0x30
	bl PlaySE
	adds r0, r6, 0
	adds r1, r4, 0
	bl StartSpriteAffineAnim
	b _080C7D08
_080C7CDA:
	cmp r5, 0x2
	bne _080C7D08
	adds r0, r7, 0
	adds r0, 0x8
	lsls r0, 24
	lsrs r4, r0, 24
	bl GetCurrentPlayerSpeed
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x1
	beq _080C7CFA
	adds r0, r4, 0
	adds r0, 0x8
	lsls r0, 24
	lsrs r4, r0, 24
_080C7CFA:
	movs r0, 0x30
	bl PlaySE
	adds r0, r6, 0
	adds r1, r4, 0
	bl StartSpriteAffineAnim
_080C7D08:
	movs r0, 0
	strh r0, [r6, 0x30]
	pop {r4-r7}
	pop {r0}
	bx r0
	thumb_func_end sub_80C7C94

	thumb_func_start sub_80C7D14
sub_80C7D14: @ 80C7D14
	push {r4-r6,lr}
	mov r12, r0
	mov r4, r12
	adds r4, 0x3E
	ldrb r0, [r4]
	movs r5, 0x5
	negs r5, r5
	ands r5, r0
	strb r5, [r4]
	mov r0, r12
	ldrh r1, [r0, 0x24]
	ldrh r2, [r0, 0x20]
	adds r1, r2
	adds r0, 0x28
	movs r2, 0
	ldrsb r2, [r0, r2]
	ldr r0, _080C7DA8 @ =gSpriteCoordOffsetX
	adds r2, r1
	ldrh r0, [r0]
	adds r2, r0
	lsls r2, 16
	mov r3, r12
	ldrh r1, [r3, 0x26]
	ldrh r0, [r3, 0x22]
	adds r1, r0
	mov r0, r12
	adds r0, 0x29
	ldrb r0, [r0]
	lsls r0, 24
	asrs r0, 24
	ldr r3, _080C7DAC @ =gSpriteCoordOffsetY
	adds r0, r1
	ldrh r3, [r3]
	adds r0, r3
	lsls r0, 16
	movs r3, 0x80
	lsls r3, 15
	adds r1, r2, r3
	lsrs r1, 16
	lsrs r6, r0, 16
	adds r0, r3
	lsrs r3, r0, 16
	asrs r2, 16
	cmp r2, 0xFF
	bgt _080C7D7A
	lsls r0, r1, 16
	asrs r0, 16
	movs r1, 0x10
	negs r1, r1
	cmp r0, r1
	bge _080C7D82
_080C7D7A:
	movs r1, 0x4
	adds r0, r5, 0
	orrs r0, r1
	strb r0, [r4]
_080C7D82:
	lsls r0, r6, 16
	asrs r0, 16
	cmp r0, 0xAF
	bgt _080C7D96
	lsls r0, r3, 16
	asrs r0, 16
	movs r1, 0x10
	negs r1, r1
	cmp r0, r1
	bge _080C7DA2
_080C7D96:
	mov r0, r12
	adds r0, 0x3E
	ldrb r1, [r0]
	movs r2, 0x4
	orrs r1, r2
	strb r1, [r0]
_080C7DA2:
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_080C7DA8: .4byte gSpriteCoordOffsetX
_080C7DAC: .4byte gSpriteCoordOffsetY
	thumb_func_end sub_80C7D14

	thumb_func_start LoadRotatingGatePics
LoadRotatingGatePics: @ 80C7DB0
	push {lr}
	ldr r0, _080C7DBC @ =gRotatingGatesGraphicsTable
	bl LoadSpriteSheets
	pop {r0}
	bx r0
	.align 2, 0
_080C7DBC: .4byte gRotatingGatesGraphicsTable
	thumb_func_end LoadRotatingGatePics

	thumb_func_start sub_80C7DC0
sub_80C7DC0: @ 80C7DC0
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	ldr r2, _080C7DF4 @ =gSaveBlock1
	ldrh r1, [r2]
	subs r0, r1, 0x2
	lsls r0, 16
	lsrs r0, 16
	mov r10, r0
	adds r1, 0x11
	lsls r1, 16
	lsrs r1, 16
	mov r9, r1
	ldrh r1, [r2, 0x2]
	subs r0, r1, 0x2
	lsls r0, 16
	lsrs r0, 16
	mov r8, r0
	adds r1, 0xE
	lsls r1, 16
	lsrs r7, r1, 16
	movs r6, 0
	b _080C7E66
	.align 2, 0
_080C7DF4: .4byte gSaveBlock1
_080C7DF8:
	ldr r0, _080C7E7C @ =gUnknown_02038800
	ldr r0, [r0]
	lsls r1, r6, 3
	adds r1, r0
	ldrh r0, [r1]
	adds r0, 0x7
	lsls r0, 16
	lsrs r2, r0, 16
	ldrh r0, [r1, 0x2]
	adds r0, 0x7
	lsls r0, 16
	lsrs r3, r0, 16
	ldr r0, _080C7E80 @ =gUnknown_020387F0
	adds r0, r6, r0
	ldrb r0, [r0]
	cmp r0, 0x40
	beq _080C7E64
	lsls r0, r2, 16
	mov r2, r10
	lsls r1, r2, 16
	asrs r2, r0, 16
	cmp r0, r1
	blt _080C7E44
	mov r1, r9
	lsls r0, r1, 16
	asrs r0, 16
	cmp r2, r0
	bgt _080C7E44
	lsls r0, r3, 16
	mov r2, r8
	lsls r1, r2, 16
	asrs r2, r0, 16
	cmp r0, r1
	blt _080C7E44
	lsls r0, r7, 16
	asrs r0, 16
	cmp r2, r0
	ble _080C7E64
_080C7E44:
	ldr r0, _080C7E80 @ =gUnknown_020387F0
	adds r5, r6, r0
	ldrb r0, [r5]
	lsls r4, r0, 4
	adds r4, r0
	lsls r4, 2
	ldr r0, _080C7E84 @ =gSprites
	adds r4, r0
	adds r0, r4, 0
	bl FreeSpriteOamMatrix
	adds r0, r4, 0
	bl DestroySprite
	movs r0, 0x40
	strb r0, [r5]
_080C7E64:
	adds r6, 0x1
_080C7E66:
	ldr r0, _080C7E88 @ =gUnknown_02038804
	ldrb r0, [r0]
	cmp r6, r0
	blt _080C7DF8
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080C7E7C: .4byte gUnknown_02038800
_080C7E80: .4byte gUnknown_020387F0
_080C7E84: .4byte gSprites
_080C7E88: .4byte gUnknown_02038804
	thumb_func_end sub_80C7DC0

	thumb_func_start sub_80C7E8C
sub_80C7E8C: @ 80C7E8C
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	sub sp, 0xC
	lsls r0, 24
	lsrs r4, r0, 24
	cmp r1, 0x1
	bne _080C7EAC
	ldr r0, _080C7EA8 @ =gUnknown_083D611C
	mov r10, r0
	b _080C7EB8
	.align 2, 0
_080C7EA8: .4byte gUnknown_083D611C
_080C7EAC:
	cmp r1, 0x2
	beq _080C7EB4
_080C7EB0:
	movs r0, 0
	b _080C7F48
_080C7EB4:
	ldr r1, _080C7F58 @ =gUnknown_083D60FC
	mov r10, r1
_080C7EB8:
	adds r0, r4, 0
	bl sub_80C7A08
	lsls r0, 24
	lsrs r0, 24
	str r0, [sp]
	ldr r0, _080C7F5C @ =gUnknown_02038800
	ldr r1, [r0]
	lsls r0, r4, 3
	adds r0, r1
	ldrb r2, [r0, 0x4]
	ldrh r1, [r0]
	adds r1, 0x7
	ldrh r0, [r0, 0x2]
	adds r0, 0x7
	movs r3, 0
	lsls r2, 3
	str r2, [sp, 0x4]
	lsls r1, 16
	asrs r1, 16
	mov r9, r1
	lsls r0, 16
	asrs r0, 16
	mov r8, r0
_080C7EE8:
	movs r6, 0
	ldr r2, [sp]
	adds r7, r2, r3
	lsls r0, r3, 1
	adds r5, r7, 0
	ldr r1, [sp, 0x4]
	adds r0, r1
	ldr r2, _080C7F60 @ =gUnknown_083D613C
	adds r4, r0, r2
_080C7EFA:
	adds r0, r5, 0
	cmp r5, 0
	bge _080C7F02
	adds r0, r7, 0x3
_080C7F02:
	asrs r0, 2
	lsls r0, 2
	subs r0, r5, r0
	lsls r0, 1
	adds r0, r6
	lsls r0, 24
	lsrs r1, r0, 24
	ldrb r0, [r4]
	cmp r0, 0
	beq _080C7F38
	lsls r1, 2
	add r1, r10
	movs r0, 0
	ldrsb r0, [r1, r0]
	add r0, r9
	ldrb r1, [r1, 0x1]
	lsls r1, 24
	asrs r1, 24
	add r1, r8
	str r3, [sp, 0x8]
	bl MapGridIsImpassableAt
	lsls r0, 24
	lsrs r0, 24
	ldr r3, [sp, 0x8]
	cmp r0, 0x1
	beq _080C7EB0
_080C7F38:
	adds r4, 0x1
	adds r6, 0x1
	cmp r6, 0x1
	ble _080C7EFA
	adds r3, 0x1
	cmp r3, 0x3
	ble _080C7EE8
	movs r0, 0x1
_080C7F48:
	add sp, 0xC
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r1}
	bx r1
	.align 2, 0
_080C7F58: .4byte gUnknown_083D60FC
_080C7F5C: .4byte gUnknown_02038800
_080C7F60: .4byte gUnknown_083D613C
	thumb_func_end sub_80C7E8C

	thumb_func_start sub_80C7F64
sub_80C7F64: @ 80C7F64
	push {r4-r6,lr}
	adds r4, r1, 0
	lsls r0, 24
	lsrs r0, 24
	adds r6, r0, 0
	lsls r4, 24
	lsrs r5, r4, 24
	lsrs r4, 25
	movs r0, 0x1
	ands r5, r0
	adds r0, r6, 0
	bl sub_80C7A08
	subs r4, r0
	adds r1, r4, 0x4
	adds r0, r1, 0
	cmp r1, 0
	bge _080C7F8A
	adds r0, r4, 0x7
_080C7F8A:
	asrs r0, 2
	lsls r0, 2
	subs r0, r1, r0
	ldr r1, _080C7FB0 @ =gUnknown_02038800
	ldr r2, [r1]
	lsls r1, r6, 3
	adds r1, r2
	ldrb r1, [r1, 0x4]
	ldr r2, _080C7FB4 @ =gUnknown_083D613C
	lsls r0, 24
	asrs r0, 23
	adds r0, r5
	lsls r1, 3
	adds r0, r1
	adds r0, r2
	ldrb r0, [r0]
	pop {r4-r6}
	pop {r1}
	bx r1
	.align 2, 0
_080C7FB0: .4byte gUnknown_02038800
_080C7FB4: .4byte gUnknown_083D613C
	thumb_func_end sub_80C7F64

	thumb_func_start sub_80C7FB8
sub_80C7FB8: @ 80C7FB8
	push {r4,lr}
	lsls r0, 24
	lsrs r3, r0, 24
	ldr r0, _080C7FE4 @ =gUnknown_020387F0
	adds r2, r3, r0
	ldrb r0, [r2]
	cmp r0, 0x40
	beq _080C7FDC
	lsls r4, r0, 4
	adds r4, r0
	lsls r4, 2
	ldr r0, _080C7FE8 @ =gSprites
	adds r4, r0
	strh r1, [r4, 0x30]
	adds r0, r3, 0
	bl sub_80C7A08
	strh r0, [r4, 0x32]
_080C7FDC:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080C7FE4: .4byte gUnknown_020387F0
_080C7FE8: .4byte gSprites
	thumb_func_end sub_80C7FB8

	thumb_func_start sub_80C7FEC
sub_80C7FEC: @ 80C7FEC
	push {lr}
	lsls r0, 24
	lsrs r0, 24
	adds r3, r0, 0
	lsls r1, 16
	lsrs r1, 16
	lsls r2, 16
	lsrs r2, 16
	cmp r0, 0x2
	bne _080C8008
	ldr r3, _080C8004 @ =gUnknown_083D60BC
	b _080C802A
	.align 2, 0
_080C8004: .4byte gUnknown_083D60BC
_080C8008:
	cmp r0, 0x1
	bne _080C8014
	ldr r3, _080C8010 @ =gUnknown_083D60CC
	b _080C802A
	.align 2, 0
_080C8010: .4byte gUnknown_083D60CC
_080C8014:
	cmp r0, 0x3
	bne _080C8020
	ldr r3, _080C801C @ =gUnknown_083D60DC
	b _080C802A
	.align 2, 0
_080C801C: .4byte gUnknown_083D60DC
_080C8020:
	cmp r3, 0x4
	beq _080C8028
	movs r0, 0xFF
	b _080C8038
_080C8028:
	ldr r3, _080C803C @ =gUnknown_083D60EC
_080C802A:
	lsls r0, r2, 16
	lsls r1, 16
	asrs r1, 16
	asrs r0, 14
	adds r0, r1
	adds r0, r3, r0
	ldrb r0, [r0]
_080C8038:
	pop {r1}
	bx r1
	.align 2, 0
_080C803C: .4byte gUnknown_083D60EC
	thumb_func_end sub_80C7FEC

	thumb_func_start sub_80C8040
sub_80C8040: @ 80C8040
	push {lr}
	bl GetCurrentMapRotatingGatePuzzleType
	cmp r0, 0
	beq _080C8052
	bl sub_80C7A80
	bl sub_80C79CC
_080C8052:
	pop {r0}
	bx r0
	thumb_func_end sub_80C8040

	thumb_func_start RotatingGatePuzzleCameraUpdate
RotatingGatePuzzleCameraUpdate: @ 80C8058
	push {r4,r5,lr}
	lsls r0, 16
	lsrs r4, r0, 16
	lsls r1, 16
	lsrs r5, r1, 16
	bl GetCurrentMapRotatingGatePuzzleType
	cmp r0, 0
	beq _080C807A
	lsls r0, r4, 16
	asrs r0, 16
	lsls r1, r5, 16
	asrs r1, 16
	bl sub_80C7ADC
	bl sub_80C7DC0
_080C807A:
	pop {r4,r5}
	pop {r0}
	bx r0
	thumb_func_end RotatingGatePuzzleCameraUpdate

	thumb_func_start sub_80C8080
sub_80C8080: @ 80C8080
	push {lr}
	bl GetCurrentMapRotatingGatePuzzleType
	cmp r0, 0
	beq _080C809A
	bl LoadRotatingGatePics
	bl sub_80C7A80
	movs r0, 0
	movs r1, 0
	bl sub_80C7ADC
_080C809A:
	pop {r0}
	bx r0
	thumb_func_end sub_80C8080

	thumb_func_start CheckForRotatingGatePuzzleCollision
CheckForRotatingGatePuzzleCollision: @ 80C80A0
	push {r4-r7,lr}
	mov r7, r9
	mov r6, r8
	push {r6,r7}
	lsls r0, 24
	lsrs r0, 24
	mov r9, r0
	lsls r1, 16
	lsrs r4, r1, 16
	lsls r2, 16
	lsrs r2, 16
	mov r8, r2
	bl GetCurrentMapRotatingGatePuzzleType
	cmp r0, 0
	bne _080C80D4
	b _080C8172
_080C80C2:
	adds r0, r4, 0
	adds r1, r5, 0
	bl sub_80C7FB8
	adds r0, r4, 0
	adds r1, r5, 0
	bl sub_80C7A44
	b _080C8172
_080C80D4:
	movs r6, 0
	ldr r0, _080C8160 @ =gUnknown_02038804
	ldrb r0, [r0]
	cmp r6, r0
	bge _080C8172
	lsls r0, r4, 16
	asrs r7, r0, 16
_080C80E2:
	ldr r0, _080C8164 @ =gUnknown_02038800
	ldr r1, [r0]
	lsls r0, r6, 3
	adds r0, r1
	ldrh r1, [r0]
	adds r1, 0x7
	ldrh r0, [r0, 0x2]
	adds r0, 0x7
	lsls r0, 16
	lsrs r2, r0, 16
	lsls r1, 16
	asrs r4, r1, 16
	subs r0, r4, 0x2
	cmp r0, r7
	bgt _080C8168
	adds r0, r4, 0x1
	cmp r7, r0
	bgt _080C8168
	lsls r0, r2, 16
	asrs r3, r0, 16
	subs r1, r3, 0x2
	mov r2, r8
	lsls r0, r2, 16
	asrs r2, r0, 16
	cmp r1, r2
	bgt _080C8168
	adds r0, r3, 0x1
	cmp r2, r0
	bgt _080C8168
	subs r1, r7, r4
	adds r1, 0x2
	subs r2, r3
	adds r2, 0x2
	lsls r1, 16
	asrs r1, 16
	lsls r2, 16
	asrs r2, 16
	mov r0, r9
	bl sub_80C7FEC
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0xFF
	beq _080C8168
	lsrs r5, r0, 4
	movs r1, 0xF
	ands r1, r0
	lsls r0, r6, 24
	lsrs r4, r0, 24
	adds r0, r4, 0
	bl sub_80C7F64
	cmp r0, 0
	beq _080C8168
	adds r0, r4, 0
	adds r1, r5, 0
	bl sub_80C7E8C
	cmp r0, 0
	bne _080C80C2
	movs r0, 0x1
	b _080C8174
	.align 2, 0
_080C8160: .4byte gUnknown_02038804
_080C8164: .4byte gUnknown_02038800
_080C8168:
	adds r6, 0x1
	ldr r0, _080C8180 @ =gUnknown_02038804
	ldrb r0, [r0]
	cmp r6, r0
	blt _080C80E2
_080C8172:
	movs r0, 0
_080C8174:
	pop {r3,r4}
	mov r8, r3
	mov r9, r4
	pop {r4-r7}
	pop {r1}
	bx r1
	.align 2, 0
_080C8180: .4byte gUnknown_02038804
	thumb_func_end CheckForRotatingGatePuzzleCollision

	.align 2, 0 @ Don't pad with nop.
