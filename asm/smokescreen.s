	.include "constants/gba_constants.inc"
	.include "constants/species_constants.inc"
	.include "asm/macros.inc"

	.syntax unified

	.text

	thumb_func_start sub_8046234
sub_8046234: @ 8046234
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	lsls r0, 16
	lsrs r6, r0, 16
	lsls r1, 16
	lsrs r7, r1, 16
	lsls r2, 24
	lsrs r4, r2, 24
	ldr r5, _0804636C @ =gUnknown_081FAEA4
	ldrh r0, [r5, 0x6]
	bl GetSpriteTileStartByTag
	lsls r0, 16
	ldr r1, _08046370 @ =0xffff0000
	cmp r0, r1
	bne _08046266
	adds r0, r5, 0
	bl LoadCompressedObjectPic
	ldr r0, _08046374 @ =gUnknown_081FAEAC
	bl LoadCompressedObjectPalette
_08046266:
	ldr r0, _08046378 @ =sub_8046388
	bl object_new_hidden_with_callback
	mov r8, r0
	mov r0, r8
	lsls r0, 24
	lsrs r0, 24
	mov r8, r0
	lsls r5, r0, 4
	add r5, r8
	lsls r5, 2
	ldr r0, _0804637C @ =gSprites
	adds r5, r0
	strh r4, [r5, 0x30]
	ldr r0, _08046380 @ =gSpriteTemplate_81FAF0C
	mov r9, r0
	lsls r6, 16
	asrs r0, r6, 16
	mov r10, r0
	ldr r0, _08046384 @ =0xfff00000
	adds r6, r0
	asrs r6, 16
	lsls r4, r7, 16
	asrs r7, r4, 16
	adds r4, r0
	asrs r4, 16
	mov r0, r9
	adds r1, r6, 0
	adds r2, r4, 0
	movs r3, 0x2
	bl CreateSprite
	lsls r0, 24
	lsrs r0, 24
	lsls r1, r0, 4
	adds r1, r0
	lsls r1, 2
	ldr r0, _0804637C @ =gSprites
	adds r1, r0
	mov r0, r8
	strh r0, [r1, 0x2E]
	ldrh r0, [r5, 0x2E]
	adds r0, 0x1
	strh r0, [r5, 0x2E]
	adds r0, r1, 0
	bl AnimateSprite
	mov r0, r9
	mov r1, r10
	adds r2, r4, 0
	movs r3, 0x2
	bl CreateSprite
	lsls r0, 24
	lsrs r0, 24
	lsls r4, r0, 4
	adds r4, r0
	lsls r4, 2
	ldr r0, _0804637C @ =gSprites
	adds r4, r0
	mov r0, r8
	strh r0, [r4, 0x2E]
	ldrh r0, [r5, 0x2E]
	adds r0, 0x1
	strh r0, [r5, 0x2E]
	adds r0, r4, 0
	movs r1, 0x1
	bl StartSpriteAnim
	adds r0, r4, 0
	bl AnimateSprite
	mov r0, r9
	adds r1, r6, 0
	adds r2, r7, 0
	movs r3, 0x2
	bl CreateSprite
	lsls r0, 24
	lsrs r0, 24
	lsls r4, r0, 4
	adds r4, r0
	lsls r4, 2
	ldr r0, _0804637C @ =gSprites
	adds r4, r0
	mov r0, r8
	strh r0, [r4, 0x2E]
	ldrh r0, [r5, 0x2E]
	adds r0, 0x1
	strh r0, [r5, 0x2E]
	adds r0, r4, 0
	movs r1, 0x2
	bl StartSpriteAnim
	adds r0, r4, 0
	bl AnimateSprite
	mov r0, r9
	mov r1, r10
	adds r2, r7, 0
	movs r3, 0x2
	bl CreateSprite
	lsls r0, 24
	lsrs r0, 24
	lsls r4, r0, 4
	adds r4, r0
	lsls r4, 2
	ldr r0, _0804637C @ =gSprites
	adds r4, r0
	mov r0, r8
	strh r0, [r4, 0x2E]
	ldrh r0, [r5, 0x2E]
	adds r0, 0x1
	strh r0, [r5, 0x2E]
	adds r0, r4, 0
	movs r1, 0x3
	bl StartSpriteAnim
	adds r0, r4, 0
	bl AnimateSprite
	mov r0, r8
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r1}
	bx r1
	.align 2, 0
_0804636C: .4byte gUnknown_081FAEA4
_08046370: .4byte 0xffff0000
_08046374: .4byte gUnknown_081FAEAC
_08046378: .4byte sub_8046388
_0804637C: .4byte gSprites
_08046380: .4byte gSpriteTemplate_81FAF0C
_08046384: .4byte 0xfff00000
	thumb_func_end sub_8046234

	thumb_func_start sub_8046388
sub_8046388: @ 8046388
	push {r4,lr}
	adds r4, r0, 0
	movs r1, 0x2E
	ldrsh r0, [r4, r1]
	cmp r0, 0
	bne _080463C0
	ldr r0, _080463B4 @ =gUnknown_081FAEA4
	ldrh r0, [r0, 0x6]
	bl FreeSpriteTilesByTag
	ldr r0, _080463B8 @ =gUnknown_081FAEAC
	ldrh r0, [r0, 0x4]
	bl FreeSpritePaletteByTag
	movs r1, 0x30
	ldrsh r0, [r4, r1]
	cmp r0, 0
	bne _080463BC
	adds r0, r4, 0
	bl DestroySprite
	b _080463C0
	.align 2, 0
_080463B4: .4byte gUnknown_081FAEA4
_080463B8: .4byte gUnknown_081FAEAC
_080463BC:
	ldr r0, _080463C8 @ =SpriteCallbackDummy
	str r0, [r4, 0x1C]
_080463C0:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080463C8: .4byte SpriteCallbackDummy
	thumb_func_end sub_8046388

	thumb_func_start sub_80463CC
sub_80463CC: @ 80463CC
	push {lr}
	adds r3, r0, 0
	adds r0, 0x3F
	ldrb r1, [r0]
	movs r0, 0x10
	ands r0, r1
	cmp r0, 0
	beq _080463F6
	ldr r2, _080463FC @ =gSprites
	movs r0, 0x2E
	ldrsh r1, [r3, r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r2
	ldrh r1, [r0, 0x2E]
	subs r1, 0x1
	strh r1, [r0, 0x2E]
	adds r0, r3, 0
	bl DestroySprite
_080463F6:
	pop {r0}
	bx r0
	.align 2, 0
_080463FC: .4byte gSprites
	thumb_func_end sub_80463CC

	.align 2, 0 @ Don't pad with nop.
