	.include "constants/gba_constants.inc"
	.include "constants/species_constants.inc"
	.include "asm/macros.inc"

	.syntax unified

	.text

	thumb_func_start unref_sub_809D26C
unref_sub_809D26C: @ 809D26C
	push {r4-r6,lr}
	mov r6, r8
	push {r6}
	sub sp, 0x18
	adds r6, r3, 0
	ldr r3, [sp, 0x2C]
	lsls r0, 16
	lsrs r0, 16
	lsls r3, 24
	lsrs r3, 24
	mov r8, sp
	ldr r4, _0809D2E0 @ =gOamData_83BC5E8
	str r4, [sp]
	ldr r5, _0809D2E4 @ =gMonIconTable
	lsls r4, r0, 2
	adds r4, r5
	ldr r4, [r4]
	str r4, [sp, 0x4]
	ldr r4, _0809D2E8 @ =gSpriteAnimTable_83BC62C
	str r4, [sp, 0x8]
	ldr r4, _0809D2EC @ =gSpriteAffineAnimTable_83BC660
	str r4, [sp, 0xC]
	str r1, [sp, 0x10]
	ldr r1, _0809D2F0 @ =gMonIconPaletteIndices
	adds r0, r1
	ldr r4, _0809D2F4 @ =0x0000dac0
	adds r1, r4, 0
	ldrb r0, [r0]
	adds r1, r0
	mov r0, r8
	strh r1, [r0, 0x14]
	lsls r2, 16
	asrs r2, 16
	lsls r6, 16
	asrs r6, 16
	mov r0, sp
	adds r1, r2, 0
	adds r2, r6, 0
	bl CreateMonIconSprite
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	lsls r0, r4, 4
	adds r0, r4
	lsls r0, 2
	ldr r1, _0809D2F8 @ =gSprites
	adds r0, r1
	bl UpdateMonIconFrame
	adds r0, r4, 0
	add sp, 0x18
	pop {r3}
	mov r8, r3
	pop {r4-r6}
	pop {r1}
	bx r1
	.align 2, 0
_0809D2E0: .4byte gOamData_83BC5E8
_0809D2E4: .4byte gMonIconTable
_0809D2E8: .4byte gSpriteAnimTable_83BC62C
_0809D2EC: .4byte gSpriteAffineAnimTable_83BC660
_0809D2F0: .4byte gMonIconPaletteIndices
_0809D2F4: .4byte 0x0000dac0
_0809D2F8: .4byte gSprites
	thumb_func_end unref_sub_809D26C

	thumb_func_start CreateMonIcon
CreateMonIcon: @ 809D2FC
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	sub sp, 0x30
	adds r4, r0, 0
	adds r5, r1, 0
	ldr r0, [sp, 0x48]
	ldr r1, [sp, 0x4C]
	lsls r4, 16
	lsrs r4, 16
	lsls r2, 16
	lsrs r7, r2, 16
	lsls r3, 16
	lsrs r6, r3, 16
	lsls r0, 24
	lsrs r0, 24
	mov r8, r0
	ldr r0, _0809D38C @ =gOamData_83BC5E8
	str r0, [sp, 0x18]
	adds r0, r4, 0
	bl GetMonIconPtr
	str r0, [sp, 0x1C]
	ldr r0, _0809D390 @ =gSpriteAnimTable_83BC62C
	str r0, [sp, 0x20]
	ldr r0, _0809D394 @ =gSpriteAffineAnimTable_83BC660
	str r0, [sp, 0x24]
	str r5, [sp, 0x28]
	ldr r0, _0809D398 @ =gMonIconPaletteIndices
	adds r0, r4, r0
	ldr r1, _0809D39C @ =0x0000dac0
	adds r5, r1, 0
	ldrb r0, [r0]
	adds r1, r5, r0
	add r0, sp, 0x2C
	strh r1, [r0]
	add r1, sp, 0x18
	mov r0, sp
	movs r2, 0x18
	bl memcpy
	movs r0, 0xCE
	lsls r0, 1
	cmp r4, r0
	bls _0809D35A
	mov r0, sp
	strh r5, [r0, 0x14]
_0809D35A:
	lsls r1, r7, 16
	asrs r1, 16
	lsls r2, r6, 16
	asrs r2, 16
	mov r0, sp
	mov r3, r8
	bl CreateMonIconSprite
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	lsls r0, r4, 4
	adds r0, r4
	lsls r0, 2
	ldr r1, _0809D3A0 @ =gSprites
	adds r0, r1
	bl UpdateMonIconFrame
	adds r0, r4, 0
	add sp, 0x30
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r1}
	bx r1
	.align 2, 0
_0809D38C: .4byte gOamData_83BC5E8
_0809D390: .4byte gSpriteAnimTable_83BC62C
_0809D394: .4byte gSpriteAffineAnimTable_83BC660
_0809D398: .4byte gMonIconPaletteIndices
_0809D39C: .4byte 0x0000dac0
_0809D3A0: .4byte gSprites
	thumb_func_end CreateMonIcon

	thumb_func_start sub_809D3A4
sub_809D3A4: @ 809D3A4
	push {r4-r6,lr}
	mov r6, r8
	push {r6}
	sub sp, 0x18
	adds r6, r3, 0
	ldr r3, [sp, 0x2C]
	lsls r0, 16
	lsrs r0, 16
	lsls r3, 24
	lsrs r3, 24
	mov r8, sp
	ldr r4, _0809D418 @ =gOamData_83BC5E8
	str r4, [sp]
	ldr r5, _0809D41C @ =gMonIconTable
	lsls r4, r0, 2
	adds r4, r5
	ldr r4, [r4]
	str r4, [sp, 0x4]
	ldr r4, _0809D420 @ =gSpriteAnimTable_83BC62C
	str r4, [sp, 0x8]
	ldr r4, _0809D424 @ =gSpriteAffineAnimTable_83BC660
	str r4, [sp, 0xC]
	str r1, [sp, 0x10]
	ldr r1, _0809D428 @ =gMonIconPaletteIndices
	adds r0, r1
	ldr r4, _0809D42C @ =0x0000dac0
	adds r1, r4, 0
	ldrb r0, [r0]
	adds r1, r0
	mov r0, r8
	strh r1, [r0, 0x14]
	lsls r2, 16
	asrs r2, 16
	lsls r6, 16
	asrs r6, 16
	mov r0, sp
	adds r1, r2, 0
	adds r2, r6, 0
	bl CreateMonIconSprite
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	lsls r0, r4, 4
	adds r0, r4
	lsls r0, 2
	ldr r1, _0809D430 @ =gSprites
	adds r0, r1
	bl UpdateMonIconFrame
	adds r0, r4, 0
	add sp, 0x18
	pop {r3}
	mov r8, r3
	pop {r4-r6}
	pop {r1}
	bx r1
	.align 2, 0
_0809D418: .4byte gOamData_83BC5E8
_0809D41C: .4byte gMonIconTable
_0809D420: .4byte gSpriteAnimTable_83BC62C
_0809D424: .4byte gSpriteAffineAnimTable_83BC660
_0809D428: .4byte gMonIconPaletteIndices
_0809D42C: .4byte 0x0000dac0
_0809D430: .4byte gSprites
	thumb_func_end sub_809D3A4

	thumb_func_start mon_icon_convert_unown_species_id
mon_icon_convert_unown_species_id: @ 809D434
	push {lr}
	lsls r0, 16
	lsrs r2, r0, 16
	cmp r2, SPECIES_UNOWN
	bne _0809D45E
	adds r0, r1, 0
	bl sub_809D474
	lsls r0, 16
	lsrs r0, 16
	cmp r0, 0
	bne _0809D450
	movs r0, SPECIES_UNOWN
	b _0809D45A
_0809D450:
	movs r1, 0xCE
	lsls r1, 1
	adds r0, r1
	lsls r0, 16
	lsrs r0, 16
_0809D45A:
	adds r1, r0, 0
	b _0809D46C
_0809D45E:
	movs r0, 0xCE
	lsls r0, 1
	adds r1, r2, 0
	cmp r1, r0
	bls _0809D46C
	movs r1, 0x82
	lsls r1, 1
_0809D46C:
	adds r0, r1, 0
	pop {r1}
	bx r1
	thumb_func_end mon_icon_convert_unown_species_id

	thumb_func_start sub_809D474
sub_809D474: @ 809D474
	push {lr}
	adds r2, r0, 0
	movs r0, 0xC0
	lsls r0, 18
	ands r0, r2
	lsrs r0, 18
	movs r1, 0xC0
	lsls r1, 10
	ands r1, r2
	lsrs r1, 12
	orrs r0, r1
	movs r1, 0xC0
	lsls r1, 2
	ands r1, r2
	lsrs r1, 6
	orrs r0, r1
	movs r1, 0x3
	ands r1, r2
	orrs r0, r1
	movs r1, 0x1C
	bl __umodsi3
	lsls r0, 16
	lsrs r0, 16
	pop {r1}
	bx r1
	thumb_func_end sub_809D474

	thumb_func_start sub_809D4A8
sub_809D4A8: @ 809D4A8
	push {r4,lr}
	sub sp, 0x4
	lsls r0, 16
	lsrs r4, r0, 16
	adds r0, r4, 0
	mov r1, sp
	bl sub_80A2D64
	lsls r0, 16
	lsrs r0, 16
	cmp r0, SPECIES_UNOWN
	bne _0809D4DE
	mov r0, sp
	ldrh r0, [r0]
	cmp r0, 0
	bne _0809D4CE
	mov r1, sp
	adds r0, SPECIES_UNOWN
	b _0809D4D6
_0809D4CE:
	mov r1, sp
	movs r2, 0xCE
	lsls r2, 1
	adds r0, r2
_0809D4D6:
	strh r0, [r1]
	mov r0, sp
	ldrh r0, [r0]
	b _0809D4EA
_0809D4DE:
	adds r0, r4, 0
	movs r1, 0
	bl mon_icon_convert_unown_species_id
	lsls r0, 16
	lsrs r0, 16
_0809D4EA:
	add sp, 0x4
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end sub_809D4A8

	thumb_func_start GetMonIconPtr
GetMonIconPtr: @ 809D4F4
	push {lr}
	lsls r0, 16
	lsrs r0, 16
	bl mon_icon_convert_unown_species_id
	lsls r0, 16
	ldr r1, _0809D50C @ =gMonIconTable
	lsrs r0, 14
	adds r0, r1
	ldr r0, [r0]
	pop {r1}
	bx r1
	.align 2, 0
_0809D50C: .4byte gMonIconTable
	thumb_func_end GetMonIconPtr

	thumb_func_start sub_809D510
sub_809D510: @ 809D510
	push {lr}
	bl sub_809D7E8
	pop {r0}
	bx r0
	thumb_func_end sub_809D510

	thumb_func_start sub_809D51C
sub_809D51C: @ 809D51C
	push {r4,r5,lr}
	movs r4, 0
	ldr r5, _0809D53C @ =gMonIconPaletteTable
_0809D522:
	lsls r0, r4, 3
	adds r0, r5
	bl LoadSpritePalette
	adds r0, r4, 0x1
	lsls r0, 24
	lsrs r4, r0, 24
	cmp r4, 0x5
	bls _0809D522
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_0809D53C: .4byte gMonIconPaletteTable
	thumb_func_end sub_809D51C

	thumb_func_start unref_sub_809D540
unref_sub_809D540: @ 809D540
	push {r4,lr}
	lsls r0, 16
	lsrs r1, r0, 16
	movs r0, 0xCE
	lsls r0, 1
	cmp r1, r0
	bls _0809D552
	movs r1, 0x82
	lsls r1, 1
_0809D552:
	ldr r0, _0809D578 @ =gMonIconPaletteIndices
	adds r0, r1, r0
	ldrb r0, [r0]
	ldr r1, _0809D57C @ =gMonIconPaletteTable
	lsls r0, 3
	adds r4, r0, r1
	ldrh r0, [r4, 0x4]
	bl IndexOfSpritePaletteTag
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0xFF
	bne _0809D572
	adds r0, r4, 0
	bl LoadSpritePalette
_0809D572:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0809D578: .4byte gMonIconPaletteIndices
_0809D57C: .4byte gMonIconPaletteTable
	thumb_func_end unref_sub_809D540

	thumb_func_start sub_809D580
sub_809D580: @ 809D580
	push {r4,lr}
	lsls r0, 16
	lsrs r0, 16
	ldr r1, _0809D5AC @ =gMonIconPaletteIndices
	adds r0, r1
	ldrb r0, [r0]
	ldr r1, _0809D5B0 @ =gMonIconPaletteTable
	lsls r0, 3
	adds r4, r0, r1
	ldrh r0, [r4, 0x4]
	bl IndexOfSpritePaletteTag
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0xFF
	bne _0809D5A6
	adds r0, r4, 0
	bl LoadSpritePalette
_0809D5A6:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0809D5AC: .4byte gMonIconPaletteIndices
_0809D5B0: .4byte gMonIconPaletteTable
	thumb_func_end sub_809D580

	thumb_func_start unref_sub_809D5B4
unref_sub_809D5B4: @ 809D5B4
	push {r4,r5,lr}
	movs r4, 0
	ldr r5, _0809D5D4 @ =gMonIconPaletteTable
_0809D5BA:
	lsls r0, r4, 3
	adds r0, r5
	ldrh r0, [r0, 0x4]
	bl FreeSpritePaletteByTag
	adds r0, r4, 0x1
	lsls r0, 24
	lsrs r4, r0, 24
	cmp r4, 0x5
	bls _0809D5BA
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_0809D5D4: .4byte gMonIconPaletteTable
	thumb_func_end unref_sub_809D5B4

	thumb_func_start unref_sub_809D5D8
unref_sub_809D5D8: @ 809D5D8
	push {lr}
	lsls r0, 16
	lsrs r1, r0, 16
	movs r0, 0xCE
	lsls r0, 1
	cmp r1, r0
	bls _0809D5EA
	movs r1, 0x82
	lsls r1, 1
_0809D5EA:
	ldr r0, _0809D600 @ =gMonIconPaletteIndices
	adds r0, r1, r0
	ldrb r0, [r0]
	ldr r1, _0809D604 @ =gMonIconPaletteTable
	lsls r0, 3
	adds r0, r1
	ldrh r0, [r0, 0x4]
	bl FreeSpritePaletteByTag
	pop {r0}
	bx r0
	.align 2, 0
_0809D600: .4byte gMonIconPaletteIndices
_0809D604: .4byte gMonIconPaletteTable
	thumb_func_end unref_sub_809D5D8

	thumb_func_start sub_809D608
sub_809D608: @ 809D608
	push {lr}
	lsls r0, 16
	lsrs r0, 16
	ldr r1, _0809D624 @ =gMonIconPaletteIndices
	adds r0, r1
	ldrb r0, [r0]
	ldr r1, _0809D628 @ =gMonIconPaletteTable
	lsls r0, 3
	adds r0, r1
	ldrh r0, [r0, 0x4]
	bl FreeSpritePaletteByTag
	pop {r0}
	bx r0
	.align 2, 0
_0809D624: .4byte gMonIconPaletteIndices
_0809D628: .4byte gMonIconPaletteTable
	thumb_func_end sub_809D608

	thumb_func_start sub_809D62C
sub_809D62C: @ 809D62C
	push {lr}
	bl UpdateMonIconFrame
	pop {r0}
	bx r0
	thumb_func_end sub_809D62C

	thumb_func_start UpdateMonIconFrame
UpdateMonIconFrame: @ 809D638
	push {r4-r7,lr}
	mov r7, r9
	mov r6, r8
	push {r6,r7}
	adds r4, r0, 0
	movs r7, 0
	adds r6, r4, 0
	adds r6, 0x2C
	ldrb r2, [r6]
	movs r0, 0x3F
	mov r9, r0
	ands r0, r2
	cmp r0, 0
	bne _0809D6EC
	movs r1, 0x2A
	adds r1, r4
	mov r8, r1
	ldrb r1, [r1]
	ldr r0, [r4, 0x8]
	lsls r1, 2
	adds r1, r0
	adds r5, r4, 0
	adds r5, 0x2B
	ldrb r0, [r5]
	ldr r1, [r1]
	lsls r0, 2
	adds r0, r1
	movs r1, 0
	ldrsh r3, [r0, r1]
	movs r0, 0x2
	negs r0, r0
	cmp r3, r0
	beq _0809D682
	adds r0, 0x1
	cmp r3, r0
	bne _0809D686
	b _0809D700
_0809D682:
	strb r7, [r5]
	b _0809D700
_0809D686:
	ldr r2, _0809D6E4 @ =gSpriteImageSizes
	ldrb r1, [r4, 0x3]
	lsrs r1, 6
	lsls r1, 1
	ldrb r0, [r4, 0x1]
	lsrs r0, 6
	lsls r0, 3
	adds r1, r0
	adds r1, r2
	ldrh r2, [r1]
	adds r1, r2, 0
	muls r1, r3
	ldr r0, [r4, 0xC]
	adds r0, r1
	ldrh r1, [r4, 0x4]
	lsls r1, 22
	lsrs r1, 17
	ldr r3, _0809D6E8 @ =0x06010000
	adds r1, r3
	bl RequestSpriteCopy
	mov r0, r8
	ldrb r1, [r0]
	ldr r0, [r4, 0x8]
	lsls r1, 2
	adds r1, r0
	ldrb r0, [r5]
	ldr r1, [r1]
	lsls r0, 2
	adds r0, r1
	ldr r0, [r0]
	lsls r0, 10
	lsrs r0, 26
	mov r1, r9
	ands r1, r0
	ldrb r2, [r6]
	movs r0, 0x40
	negs r0, r0
	ands r0, r2
	orrs r0, r1
	strb r0, [r6]
	ldrb r0, [r5]
	adds r0, 0x1
	strb r0, [r5]
	ldrb r7, [r5]
	b _0809D700
	.align 2, 0
_0809D6E4: .4byte gSpriteImageSizes
_0809D6E8: .4byte 0x06010000
_0809D6EC:
	lsls r0, r2, 26
	lsrs r0, 26
	subs r0, 0x1
	movs r1, 0x3F
	ands r0, r1
	movs r1, 0x40
	negs r1, r1
	ands r1, r2
	orrs r1, r0
	strb r1, [r6]
_0809D700:
	adds r0, r7, 0
	pop {r3,r4}
	mov r8, r3
	mov r9, r4
	pop {r4-r7}
	pop {r1}
	bx r1
	thumb_func_end UpdateMonIconFrame

	thumb_func_start CreateMonIconSprite
CreateMonIconSprite: @ 809D710
	push {r4-r6,lr}
	mov r6, r9
	mov r5, r8
	push {r5,r6}
	sub sp, 0x38
	mov r9, r0
	adds r4, r1, 0
	adds r5, r2, 0
	mov r8, r3
	lsls r4, 16
	lsrs r4, 16
	lsls r5, 16
	lsrs r5, 16
	mov r0, r8
	lsls r0, 24
	lsrs r0, 24
	mov r8, r0
	movs r0, 0
	str r0, [sp, 0x30]
	ldr r2, _0809D7D8 @ =gSpriteImageSizes
	mov r0, r9
	ldr r6, [r0]
	ldrb r1, [r6, 0x3]
	lsrs r1, 6
	lsls r1, 1
	ldrb r0, [r6, 0x1]
	lsrs r0, 6
	lsls r0, 3
	adds r1, r0
	adds r1, r2
	ldrh r2, [r1]
	ldr r1, _0809D7DC @ =0xffff0000
	add r3, sp, 0x30
	ldr r0, [r3, 0x4]
	ands r0, r1
	orrs r0, r2
	str r0, [r3, 0x4]
	add r1, sp, 0x18
	ldr r0, _0809D7E0 @ =0x0000ffff
	strh r0, [r1]
	mov r0, r9
	ldrh r2, [r0, 0x14]
	mov r0, sp
	adds r0, 0x1A
	strh r2, [r0]
	str r6, [sp, 0x1C]
	mov r2, r9
	ldr r0, [r2, 0x8]
	str r0, [sp, 0x20]
	str r3, [sp, 0x24]
	ldr r0, [r2, 0xC]
	str r0, [sp, 0x28]
	ldr r0, [r2, 0x10]
	str r0, [sp, 0x2C]
	mov r0, sp
	movs r2, 0x18
	bl memcpy
	lsls r4, 16
	asrs r4, 16
	lsls r5, 16
	asrs r5, 16
	mov r0, sp
	adds r1, r4, 0
	adds r2, r5, 0
	mov r3, r8
	bl CreateSprite
	lsls r0, 24
	lsrs r0, 24
	ldr r6, _0809D7E4 @ =gSprites
	lsls r3, r0, 4
	adds r3, r0
	lsls r3, 2
	adds r4, r3, r6
	adds r5, r4, 0
	adds r5, 0x2C
	ldrb r1, [r5]
	movs r2, 0x40
	orrs r1, r2
	strb r1, [r5]
	adds r4, 0x3F
	ldrb r2, [r4]
	movs r1, 0x5
	negs r1, r1
	ands r1, r2
	strb r1, [r4]
	adds r6, 0xC
	adds r3, r6
	mov r2, r9
	ldr r1, [r2, 0x4]
	str r1, [r3]
	add sp, 0x38
	pop {r3,r4}
	mov r8, r3
	mov r9, r4
	pop {r4-r6}
	pop {r1}
	bx r1
	.align 2, 0
_0809D7D8: .4byte gSpriteImageSizes
_0809D7DC: .4byte 0xffff0000
_0809D7E0: .4byte 0x0000ffff
_0809D7E4: .4byte gSprites
	thumb_func_end CreateMonIconSprite

	thumb_func_start sub_809D7E8
sub_809D7E8: @ 809D7E8
	push {lr}
	sub sp, 0x8
	movs r1, 0
	str r1, [sp]
	ldr r3, _0809D81C @ =gSpriteImageSizes
	ldrb r2, [r0, 0x3]
	lsrs r2, 6
	lsls r2, 1
	ldrb r1, [r0, 0x1]
	lsrs r1, 6
	lsls r1, 3
	adds r2, r1
	adds r2, r3
	ldrh r3, [r2]
	ldr r2, _0809D820 @ =0xffff0000
	ldr r1, [sp, 0x4]
	ands r1, r2
	orrs r1, r3
	str r1, [sp, 0x4]
	mov r1, sp
	str r1, [r0, 0xC]
	bl DestroySprite
	add sp, 0x8
	pop {r0}
	bx r0
	.align 2, 0
_0809D81C: .4byte gSpriteImageSizes
_0809D820: .4byte 0xffff0000
	thumb_func_end sub_809D7E8

	thumb_func_start sub_809D824
sub_809D824: @ 809D824
	mov r12, r0
	adds r0, 0x2A
	movs r3, 0
	strb r1, [r0]
	mov r2, r12
	adds r2, 0x2C
	ldrb r1, [r2]
	movs r0, 0x40
	negs r0, r0
	ands r0, r1
	strb r0, [r2]
	mov r0, r12
	adds r0, 0x2B
	strb r3, [r0]
	bx lr
	thumb_func_end sub_809D824

	.align 2, 0 @ Don't pad with nop.
