	.include "constants/gba_constants.inc"
	.include "constants/species_constants.inc"
	.include "asm/macros.inc"

	.syntax unified

	.text




	thumb_func_start sub_81437A4
sub_81437A4: @ 81437A4
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	sub sp, 0x8
	mov r9, r1
	mov r10, r2
	adds r6, r3, 0
	lsls r0, 16
	lsrs r0, 16
	lsls r1, 16
	lsrs r1, 16
	mov r9, r1
	lsls r2, 16
	lsrs r2, 16
	mov r10, r2
	lsls r6, 16
	lsrs r6, 16
	lsls r7, r0, 3
	ldr r1, _08143854 @ =gTrainerFrontPicTable
	mov r8, r1
	add r8, r7
	ldr r1, _08143858 @ =gTrainerFrontPicCoords
	lsls r2, r0, 2
	adds r2, r1
	ldrb r1, [r2]
	ldrb r2, [r2, 0x1]
	movs r3, 0x80
	lsls r3, 18
	ldr r5, _0814385C @ =gUnknown_0840B5A0
	lsls r4, r6, 2
	adds r4, r5
	ldr r4, [r4]
	str r4, [sp]
	str r0, [sp, 0x4]
	mov r0, r8
	bl DecompressPicFromTable_2
	ldr r0, _08143860 @ =gTrainerFrontPicPaletteTable
	adds r0, r7, r0
	ldr r0, [r0]
	lsls r4, r6, 4
	movs r2, 0x80
	lsls r2, 1
	adds r1, r4, r2
	lsls r1, 16
	lsrs r1, 16
	movs r2, 0x20
	bl LoadCompressedPalette
	lsls r1, r6, 24
	lsrs r1, 24
	adds r0, r6, 0
	bl sub_8143680
	ldr r0, _08143864 @ =gUnknown_02024E8C
	mov r1, r9
	lsls r1, 16
	asrs r1, 16
	mov r9, r1
	mov r2, r10
	lsls r2, 16
	asrs r2, 16
	mov r10, r2
	movs r3, 0x1
	bl CreateSprite
	lsls r0, 24
	lsrs r0, 24
	ldr r1, _08143868 @ =gSprites
	lsls r2, r0, 4
	adds r2, r0
	lsls r2, 2
	adds r2, r1
	ldrb r3, [r2, 0x5]
	movs r1, 0xF
	ands r1, r3
	orrs r1, r4
	strb r1, [r2, 0x5]
	add sp, 0x8
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r1}
	bx r1
	.align 2, 0
_08143854: .4byte gTrainerFrontPicTable
_08143858: .4byte gTrainerFrontPicCoords
_0814385C: .4byte gUnknown_0840B5A0
_08143860: .4byte gTrainerFrontPicPaletteTable
_08143864: .4byte gUnknown_02024E8C
_08143868: .4byte gSprites
	thumb_func_end sub_81437A4

	thumb_func_start sub_814386C
sub_814386C: @ 814386C
	push {r4,r5,lr}
	adds r5, r0, 0
	ldrh r1, [r5, 0x26]
	movs r2, 0x26
	ldrsh r0, [r5, r2]
	cmp r0, 0x78
	ble _08143882
	adds r0, r5, 0
	bl DestroySprite
	b _081438BA
_08143882:
	adds r0, r1, 0x1
	ldrh r1, [r5, 0x30]
	adds r0, r1
	strh r0, [r5, 0x26]
	ldrh r4, [r5, 0x2E]
	lsls r4, 24
	lsrs r4, 24
	bl Random
	lsls r0, 16
	lsrs r0, 16
	movs r1, 0x3
	ands r0, r1
	adds r0, 0x8
	ldr r1, _081438C0 @ =gSineTable
	lsls r4, 1
	adds r4, r1
	movs r2, 0
	ldrsh r1, [r4, r2]
	muls r0, r1
	cmp r0, 0
	bge _081438B0
	adds r0, 0xFF
_081438B0:
	asrs r0, 8
	strh r0, [r5, 0x24]
	ldrh r0, [r5, 0x2E]
	adds r0, 0x4
	strh r0, [r5, 0x2E]
_081438BA:
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_081438C0: .4byte gSineTable
	thumb_func_end sub_814386C

	thumb_func_start sub_81438C4
sub_81438C4: @ 81438C4
	push {r4,lr}
	bl Random
	lsls r0, 16
	lsrs r0, 16
	movs r1, 0xF0
	bl __umodsi3
	adds r4, r0, 0
	lsls r4, 16
	lsrs r4, 16
	bl Random
	adds r2, r0, 0
	lsls r2, 16
	lsrs r2, 16
	movs r0, 0x7
	ands r2, r0
	negs r2, r2
	ldr r0, _08143934 @ =gSpriteTemplate_840B7A4
	lsls r4, 16
	asrs r4, 16
	lsls r2, 16
	asrs r2, 16
	adds r1, r4, 0
	movs r3, 0
	bl CreateSprite
	lsls r0, 24
	lsrs r0, 24
	lsls r1, r0, 4
	adds r1, r0
	lsls r1, 2
	ldr r0, _08143938 @ =gSprites
	adds r4, r1, r0
	bl Random
	lsls r0, 16
	lsrs r0, 16
	movs r1, 0x11
	bl __umodsi3
	adds r1, r0, 0
	lsls r1, 24
	lsrs r1, 24
	adds r0, r4, 0
	bl StartSpriteAnim
	bl Random
	movs r1, 0x3
	ands r1, r0
	cmp r1, 0
	beq _0814393C
	movs r0, 0
	b _0814393E
	.align 2, 0
_08143934: .4byte gSpriteTemplate_840B7A4
_08143938: .4byte gSprites
_0814393C:
	movs r0, 0x1
_0814393E:
	strh r0, [r4, 0x30]
	movs r0, 0
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end sub_81438C4

	.align 2, 0 @ Don't pad with nop.
