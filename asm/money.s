	.include "constants/gba_constants.inc"
	.include "constants/species_constants.inc"
	.include "asm/macros.inc"

	.syntax unified

	.text

	thumb_func_start IsEnoughMoney
IsEnoughMoney: @ 80B79A8
	push {lr}
	cmp r0, r1
	bcs _080B79B2
	movs r0, 0
	b _080B79B4
_080B79B2:
	movs r0, 0x1
_080B79B4:
	pop {r1}
	bx r1
	thumb_func_end IsEnoughMoney

	thumb_func_start sub_80B79B8
sub_80B79B8: @ 80B79B8
	push {lr}
	adds r2, r0, 0
	ldr r0, [r2]
	adds r1, r0, r1
	cmp r0, r1
	bls _080B79CC
	ldr r0, _080B79C8 @ =0x000f423f
	b _080B79D4
	.align 2, 0
_080B79C8: .4byte 0x000f423f
_080B79CC:
	str r1, [r2]
	ldr r0, _080B79DC @ =0x000f423f
	cmp r1, r0
	bls _080B79D6
_080B79D4:
	str r0, [r2]
_080B79D6:
	pop {r0}
	bx r0
	.align 2, 0
_080B79DC: .4byte 0x000f423f
	thumb_func_end sub_80B79B8

	thumb_func_start sub_80B79E0
sub_80B79E0: @ 80B79E0
	push {lr}
	adds r2, r0, 0
	ldr r0, [r2]
	cmp r0, r1
	bcs _080B79EE
	movs r0, 0
	b _080B79F0
_080B79EE:
	subs r0, r1
_080B79F0:
	str r0, [r2]
	pop {r0}
	bx r0
	thumb_func_end sub_80B79E0

	thumb_func_start sub_80B79F8
sub_80B79F8: @ 80B79F8
	push {r4,lr}
	adds r3, r0, 0
	lsls r2, 24
	lsrs r4, r2, 24
	ldr r0, _080B7A0C @ =0x000f423f
	cmp r1, r0
	bls _080B7A10
	movs r2, 0x7
	b _080B7A46
	.align 2, 0
_080B7A0C: .4byte 0x000f423f
_080B7A10:
	ldr r0, _080B7A1C @ =0x0001869f
	cmp r1, r0
	bls _080B7A20
	movs r2, 0x6
	b _080B7A46
	.align 2, 0
_080B7A1C: .4byte 0x0001869f
_080B7A20:
	ldr r0, _080B7A2C @ =0x00002710
	cmp r1, r0
	bls _080B7A30
	movs r2, 0x5
	b _080B7A46
	.align 2, 0
_080B7A2C: .4byte 0x00002710
_080B7A30:
	ldr r0, _080B7A90 @ =0x000003e7
	movs r2, 0x4
	cmp r1, r0
	bhi _080B7A46
	movs r2, 0x3
	cmp r1, 0x63
	bhi _080B7A46
	movs r2, 0x1
	cmp r1, 0x9
	bls _080B7A46
	movs r2, 0x2
_080B7A46:
	movs r0, 0xFC
	strb r0, [r3]
	movs r0, 0x14
	strb r0, [r3, 0x1]
	movs r0, 0x6
	strb r0, [r3, 0x2]
	adds r3, 0x3
	movs r0, 0
	subs r2, r4, r2
	cmp r0, r2
	bge _080B7A6C
	movs r4, 0
_080B7A5E:
	strb r4, [r3]
	adds r3, 0x1
	adds r0, 0x1
	lsls r0, 24
	lsrs r0, 24
	cmp r0, r2
	blt _080B7A5E
_080B7A6C:
	movs r0, 0xB7
	strb r0, [r3]
	adds r3, 0x1
	adds r0, r3, 0
	bl ConvertIntToDecimalString
	adds r3, r0, 0
	movs r0, 0xFC
	strb r0, [r3]
	movs r0, 0x14
	strb r0, [r3, 0x1]
	movs r0, 0
	strb r0, [r3, 0x2]
	movs r0, 0xFF
	strb r0, [r3, 0x3]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080B7A90: .4byte 0x000003e7
	thumb_func_end sub_80B79F8

	thumb_func_start sub_80B7A94
sub_80B7A94: @ 80B7A94
	push {r4-r7,lr}
	sub sp, 0x10
	adds r4, r0, 0
	lsls r1, 24
	lsrs r5, r1, 24
	lsls r2, 24
	lsrs r6, r2, 24
	lsls r3, 24
	lsrs r7, r3, 24
	mov r0, sp
	adds r1, r4, 0
	adds r2, r5, 0
	bl sub_80B79F8
	mov r0, sp
	bl sub_8072CA4
	lsls r0, 24
	lsrs r2, r0, 24
	adds r0, r5, 0x1
	lsls r0, 3
	cmp r2, r0
	blt _080B7ACE
	mov r0, sp
	adds r1, r6, 0
	adds r2, r7, 0
	bl MenuPrint
	b _080B7AE4
_080B7ACE:
	adds r1, r6, 0x1
	adds r1, r5
	lsls r1, 3
	subs r1, r2
	lsls r1, 24
	lsrs r1, 24
	lsls r2, r7, 3
	mov r0, sp
	movs r3, 0x1
	bl MenuPrint_PixelCoords
_080B7AE4:
	add sp, 0x10
	pop {r4-r7}
	pop {r0}
	bx r0
	thumb_func_end sub_80B7A94

	thumb_func_start sub_80B7AEC
sub_80B7AEC: @ 80B7AEC
	push {r4-r6,lr}
	sub sp, 0x20
	adds r3, r0, 0
	adds r4, r1, 0
	adds r5, r2, 0
	lsls r4, 24
	lsrs r4, 24
	lsls r5, 24
	lsrs r5, 24
	mov r6, sp
	movs r0, 0xB7
	strb r0, [r6]
	adds r6, 0x1
	adds r0, r6, 0
	adds r1, r3, 0
	bl ConvertIntToDecimalString
	adds r6, r0, 0
	mov r0, sp
	adds r1, r4, 0
	adds r2, r5, 0
	bl MenuPrint_RightAligned
	movs r0, 0xFC
	strb r0, [r6]
	movs r0, 0x14
	strb r0, [r6, 0x1]
	movs r0, 0
	strb r0, [r6, 0x2]
	movs r0, 0xFF
	strb r0, [r6, 0x3]
	add sp, 0x20
	pop {r4-r6}
	pop {r0}
	bx r0
	thumb_func_end sub_80B7AEC

	thumb_func_start sub_80B7B34
sub_80B7B34: @ 80B7B34
	push {r4-r7,lr}
	mov r7, r9
	mov r6, r8
	push {r6,r7}
	sub sp, 0x4
	mov r8, r0
	adds r5, r1, 0
	mov r9, r2
	lsls r0, 24
	lsrs r0, 24
	mov r8, r0
	lsls r5, 24
	lsrs r5, 24
	mov r1, r9
	lsls r1, 8
	mov r9, r1
	ldr r4, _080B7BD8 @ =gDecoration10000_Gfx
	adds r0, r1, r4
	lsls r6, r5, 4
	subs r6, r5
	lsls r1, r6, 6
	mov r3, r8
	adds r3, 0x1
	lsls r3, 5
	ldr r2, _080B7BDC @ =0x06008000
	adds r3, r2
	adds r1, r3
	movs r2, 0x20
	str r3, [sp]
	bl CpuFastSet
	adds r4, 0x80
	add r9, r4
	adds r0, r5, 0x1
	lsls r4, r0, 4
	subs r4, r0
	lsls r1, r4, 6
	ldr r3, [sp]
	adds r1, r3
	mov r0, r9
	movs r2, 0x20
	bl CpuFastSet
	movs r3, 0
	lsls r5, 5
	mov r0, r8
	adds r7, r5, r0
	lsls r6, 1
	adds r6, 0x1
	add r6, r8
	ldr r1, _080B7BE0 @ =0xfffff000
	adds r5, r1, 0
	ldr r0, _080B7BE4 @ =0x0600f800
	mov r12, r0
	ldr r1, _080B7BE8 @ =0x0600f840
	mov r9, r1
	lsls r4, 1
	adds r4, 0x1
	add r4, r8
_080B7BAA:
	adds r1, r7, r3
	lsls r1, 1
	mov r0, r12
	adds r2, r1, r0
	adds r0, r3, r6
	adds r0, r5
	strh r0, [r2]
	add r1, r9
	adds r0, r3, r4
	adds r0, r5
	strh r0, [r1]
	adds r0, r3, 0x1
	lsls r0, 16
	lsrs r3, r0, 16
	cmp r3, 0x3
	bls _080B7BAA
	add sp, 0x4
	pop {r3,r4}
	mov r8, r3
	mov r9, r4
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080B7BD8: .4byte gDecoration10000_Gfx
_080B7BDC: .4byte 0x06008000
_080B7BE0: .4byte 0xfffff000
_080B7BE4: .4byte 0x0600f800
_080B7BE8: .4byte 0x0600f840
	thumb_func_end sub_80B7B34

	thumb_func_start sub_80B7BEC
sub_80B7BEC: @ 80B7BEC
	push {r4,lr}
	adds r4, r1, 0
	adds r3, r2, 0
	lsls r4, 24
	lsls r3, 24
	movs r1, 0xC0
	lsls r1, 19
	adds r4, r1
	lsrs r4, 24
	movs r1, 0x80
	lsls r1, 17
	adds r3, r1
	lsrs r3, 24
	movs r1, 0x6
	adds r2, r4, 0
	bl sub_80B7A94
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end sub_80B7BEC

	thumb_func_start sub_80B7C14
sub_80B7C14: @ 80B7C14
	push {r4-r6,lr}
	mov r6, r8
	push {r6}
	mov r8, r0
	adds r4, r1, 0
	adds r3, r2, 0
	lsls r4, 24
	lsls r3, 24
	lsrs r6, r4, 24
	movs r0, 0xD0
	lsls r0, 20
	adds r4, r0
	lsrs r4, 24
	lsrs r5, r3, 24
	movs r1, 0xC0
	lsls r1, 18
	adds r3, r1
	lsrs r3, 24
	adds r0, r6, 0
	adds r1, r5, 0
	adds r2, r4, 0
	bl MenuDrawTextWindow
	mov r0, r8
	adds r1, r6, 0
	adds r2, r5, 0
	bl sub_80B7BEC
	ldr r0, _080B7C88 @ =gUnknown_083CF584
	bl LoadCompressedObjectPic
	ldr r0, _080B7C8C @ =gUnknown_083CF58C
	bl LoadCompressedObjectPalette
	ldr r0, _080B7C90 @ =gSpriteTemplate_83CF56C
	lsls r6, 19
	movs r1, 0x98
	lsls r1, 13
	adds r6, r1
	asrs r6, 16
	lsls r5, 19
	movs r1, 0xB0
	lsls r1, 12
	adds r5, r1
	asrs r5, 16
	adds r1, r6, 0
	adds r2, r5, 0
	movs r3, 0
	bl CreateSprite
	ldr r1, _080B7C94 @ =gUnknown_02038734
	strb r0, [r1]
	pop {r3}
	mov r8, r3
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_080B7C88: .4byte gUnknown_083CF584
_080B7C8C: .4byte gUnknown_083CF58C
_080B7C90: .4byte gSpriteTemplate_83CF56C
_080B7C94: .4byte gUnknown_02038734
	thumb_func_end sub_80B7C14

	thumb_func_start RemoveMoneyLabelObject
RemoveMoneyLabelObject: @ 80B7C98
	push {r4,r5,lr}
	adds r4, r0, 0
	adds r5, r1, 0
	lsls r4, 24
	lsrs r4, 24
	lsls r5, 24
	lsrs r5, 24
	ldr r0, _080B7CDC @ =gUnknown_02038734
	ldrb r1, [r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	ldr r1, _080B7CE0 @ =gSprites
	adds r0, r1
	bl DestroySpriteAndFreeResources
	ldr r0, _080B7CE4 @ =0x00002722
	bl FreeSpritePaletteByTag
	adds r2, r4, 0
	adds r2, 0xD
	lsls r2, 24
	lsrs r2, 24
	adds r3, r5, 0x3
	lsls r3, 24
	lsrs r3, 24
	adds r0, r4, 0
	adds r1, r5, 0
	bl MenuZeroFillWindowRect
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080B7CDC: .4byte gUnknown_02038734
_080B7CE0: .4byte gSprites
_080B7CE4: .4byte 0x00002722
	thumb_func_end RemoveMoneyLabelObject

	thumb_func_start sub_80B7CE8
sub_80B7CE8: @ 80B7CE8
	push {lr}
	ldr r0, _080B7D04 @ =gSaveBlock1
	movs r1, 0x92
	lsls r1, 3
	adds r0, r1
	ldr r0, [r0]
	ldr r1, _080B7D08 @ =gUnknown_0202E8CE
	ldrh r1, [r1]
	bl IsEnoughMoney
	lsls r0, 24
	lsrs r0, 24
	pop {r1}
	bx r1
	.align 2, 0
_080B7D04: .4byte gSaveBlock1
_080B7D08: .4byte gUnknown_0202E8CE
	thumb_func_end sub_80B7CE8

	thumb_func_start sub_80B7D0C
sub_80B7D0C: @ 80B7D0C
	push {lr}
	ldr r0, _080B7D1C @ =gSaveBlock1 + 0x490
	ldr r1, _080B7D20 @ =gUnknown_0202E8CE
	ldrh r1, [r1]
	bl sub_80B79E0
	pop {r0}
	bx r0
	.align 2, 0
_080B7D1C: .4byte gSaveBlock1 + 0x490
_080B7D20: .4byte gUnknown_0202E8CE
	thumb_func_end sub_80B7D0C

	.align 2, 0 @ Don't pad with nop.
