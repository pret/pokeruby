	.include "constants/gba_constants.inc"
	.include "constants/species_constants.inc"
	.include "asm/macros.inc"

	.syntax unified

	.text



	thumb_func_start sub_81433E0
sub_81433E0: @ 81433E0
	push {r4-r7,lr}
	mov r7, r9
	mov r6, r8
	push {r6,r7}
	sub sp, 0x8
	movs r0, 0x80
	lsls r0, 19
	movs r1, 0
	strh r1, [r0]
	adds r0, 0x8
	strh r1, [r0]
	adds r0, 0x8
	strh r1, [r0]
	adds r0, 0x2
	strh r1, [r0]
	subs r0, 0x8
	strh r1, [r0]
	adds r0, 0xA
	strh r1, [r0]
	adds r0, 0x2
	strh r1, [r0]
	subs r0, 0xA
	strh r1, [r0]
	adds r0, 0xC
	strh r1, [r0]
	adds r0, 0x2
	strh r1, [r0]
	subs r0, 0xC
	strh r1, [r0]
	adds r0, 0xE
	strh r1, [r0]
	adds r0, 0x2
	strh r1, [r0]
	movs r3, 0xC0
	lsls r3, 19
	movs r4, 0xC0
	lsls r4, 9
	add r0, sp, 0x4
	mov r8, r0
	ldr r1, _0814354C @ =gHallOfFame_Gfx
	mov r9, r1
	mov r2, sp
	movs r6, 0
	ldr r1, _08143550 @ =0x040000d4
	movs r5, 0x80
	lsls r5, 5
	ldr r7, _08143554 @ =0x81000800
	movs r0, 0x81
	lsls r0, 24
	mov r12, r0
_08143444:
	strh r6, [r2]
	mov r0, sp
	str r0, [r1]
	str r3, [r1, 0x4]
	str r7, [r1, 0x8]
	ldr r0, [r1, 0x8]
	adds r3, r5
	subs r4, r5
	cmp r4, r5
	bhi _08143444
	strh r6, [r2]
	mov r2, sp
	str r2, [r1]
	str r3, [r1, 0x4]
	lsrs r0, r4, 1
	mov r2, r12
	orrs r0, r2
	str r0, [r1, 0x8]
	ldr r0, [r1, 0x8]
	movs r0, 0xE0
	lsls r0, 19
	movs r3, 0x80
	lsls r3, 3
	movs r4, 0
	str r4, [sp, 0x4]
	ldr r2, _08143550 @ =0x040000d4
	mov r1, r8
	str r1, [r2]
	str r0, [r2, 0x4]
	lsrs r0, r3, 2
	movs r1, 0x85
	lsls r1, 24
	orrs r0, r1
	str r0, [r2, 0x8]
	ldr r0, [r2, 0x8]
	movs r1, 0xA0
	lsls r1, 19
	mov r0, sp
	strh r4, [r0]
	str r0, [r2]
	str r1, [r2, 0x4]
	lsrs r3, 1
	movs r0, 0x81
	lsls r0, 24
	orrs r3, r0
	str r3, [r2, 0x8]
	ldr r0, [r2, 0x8]
	movs r1, 0xC0
	lsls r1, 19
	mov r0, r9
	bl LZ77UnCompVram
	movs r1, 0
	ldr r3, _08143558 @ =0x06003800
	movs r2, 0x1
_081434B2:
	lsls r0, r1, 1
	adds r0, r3
	strh r2, [r0]
	adds r0, r1, 0x1
	lsls r0, 16
	lsrs r1, r0, 16
	cmp r1, 0x3F
	bls _081434B2
	movs r1, 0
	ldr r5, _0814355C @ =0x02000000
	ldr r3, _08143560 @ =0x06003b80
	movs r2, 0x1
_081434CA:
	lsls r0, r1, 1
	adds r0, r3
	strh r2, [r0]
	adds r0, r1, 0x1
	lsls r0, 16
	lsrs r1, r0, 16
	cmp r1, 0xBF
	bls _081434CA
	movs r1, 0
	ldr r4, _08143564 @ =0x06003000
	movs r3, 0x2
	ldr r2, _08143568 @ =0x000003ff
_081434E2:
	lsls r0, r1, 1
	adds r0, r4
	strh r3, [r0]
	adds r0, r1, 0x1
	lsls r0, 16
	lsrs r1, r0, 16
	cmp r1, r2
	bls _081434E2
	adds r2, r5, 0
	movs r3, 0x80
	lsls r3, 7
	mov r4, sp
	movs r6, 0
	ldr r1, _08143550 @ =0x040000d4
	movs r5, 0x80
	lsls r5, 5
	ldr r7, _08143554 @ =0x81000800
	movs r0, 0x81
	lsls r0, 24
	mov r12, r0
_0814350A:
	strh r6, [r4]
	mov r0, sp
	str r0, [r1]
	str r2, [r1, 0x4]
	str r7, [r1, 0x8]
	ldr r0, [r1, 0x8]
	adds r2, r5
	subs r3, r5
	cmp r3, r5
	bhi _0814350A
	strh r6, [r4]
	mov r0, sp
	str r0, [r1]
	str r2, [r1, 0x4]
	lsrs r0, r3, 1
	mov r2, r12
	orrs r0, r2
	str r0, [r1, 0x8]
	ldr r0, [r1, 0x8]
	bl ResetPaletteFade
	ldr r0, _0814356C @ =gHallOfFame_Pal
	movs r1, 0
	movs r2, 0x20
	bl LoadPalette
	add sp, 0x8
	pop {r3,r4}
	mov r8, r3
	mov r9, r4
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_0814354C: .4byte gHallOfFame_Gfx
_08143550: .4byte 0x040000d4
_08143554: .4byte 0x81000800
_08143558: .4byte 0x06003800
_0814355C: .4byte 0x02000000
_08143560: .4byte 0x06003b80
_08143564: .4byte 0x06003000
_08143568: .4byte 0x000003ff
_0814356C: .4byte gHallOfFame_Pal
	thumb_func_end sub_81433E0

	thumb_func_start sub_8143570
sub_8143570: @ 8143570
	push {r4,lr}
	bl remove_some_task
	bl ResetTasks
	bl ResetSpriteData
	bl FreeAllSpritePalettes
	ldr r1, _081435A8 @ =gReservedSpritePaletteCount
	movs r0, 0x8
	strb r0, [r1]
	ldr r0, _081435AC @ =gUnknown_0840B514
	bl LoadCompressedObjectPic
	ldr r0, _081435B0 @ =gUnknown_0840B524
	bl LoadCompressedObjectPalette
	ldr r4, _081435B4 @ =gWindowConfig_81E71B4
	adds r0, r4, 0
	bl SetUpWindowConfig
	adds r0, r4, 0
	bl InitMenuWindow
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_081435A8: .4byte gReservedSpritePaletteCount
_081435AC: .4byte gUnknown_0840B514
_081435B0: .4byte gUnknown_0840B524
_081435B4: .4byte gWindowConfig_81E71B4
	thumb_func_end sub_8143570

	thumb_func_start sub_81435B8
sub_81435B8: @ 81435B8
	ldr r1, _081435D8 @ =REG_BG1CNT
	movs r2, 0xE0
	lsls r2, 3
	adds r0, r2, 0
	strh r0, [r1]
	adds r1, 0x4
	subs r2, 0xFD
	adds r0, r2, 0
	strh r0, [r1]
	subs r1, 0xE
	movs r2, 0xDA
	lsls r2, 5
	adds r0, r2, 0
	strh r0, [r1]
	bx lr
	.align 2, 0
_081435D8: .4byte REG_BG1CNT
	thumb_func_end sub_81435B8

	thumb_func_start sub_81435DC
sub_81435DC: @ 81435DC
	push {r4,lr}
	adds r2, r0, 0
	ldr r1, [r2, 0x20]
	ldr r0, [r2, 0x30]
	cmp r1, r0
	beq _08143632
	ldrh r3, [r2, 0x20]
	movs r1, 0x20
	ldrsh r0, [r2, r1]
	movs r4, 0x30
	ldrsh r1, [r2, r4]
	cmp r0, r1
	bge _081435FC
	adds r0, r3, 0
	adds r0, 0xF
	strh r0, [r2, 0x20]
_081435FC:
	ldrh r3, [r2, 0x20]
	movs r4, 0x20
	ldrsh r0, [r2, r4]
	cmp r0, r1
	ble _0814360C
	adds r0, r3, 0
	subs r0, 0xF
	strh r0, [r2, 0x20]
_0814360C:
	ldrh r3, [r2, 0x22]
	movs r1, 0x22
	ldrsh r0, [r2, r1]
	movs r4, 0x32
	ldrsh r1, [r2, r4]
	cmp r0, r1
	bge _08143620
	adds r0, r3, 0
	adds r0, 0xA
	strh r0, [r2, 0x22]
_08143620:
	ldrh r3, [r2, 0x22]
	movs r4, 0x22
	ldrsh r0, [r2, r4]
	cmp r0, r1
	ble _0814363A
	adds r0, r3, 0
	subs r0, 0xA
	strh r0, [r2, 0x22]
	b _0814363A
_08143632:
	movs r0, 0x1
	strh r0, [r2, 0x2E]
	ldr r0, _08143640 @ =nullsub_81
	str r0, [r2, 0x1C]
_0814363A:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08143640: .4byte nullsub_81
	thumb_func_end sub_81435DC

	thumb_func_start nullsub_81
nullsub_81: @ 8143644
	bx lr
	thumb_func_end nullsub_81

	thumb_func_start sub_8143648
sub_8143648: @ 8143648
	push {r4-r7,lr}
	lsls r1, 24
	ldr r4, _08143670 @ =gUnknown_02024E8C
	adds r3, r4, 0
	ldr r2, _08143674 @ =gUnknown_0840B6B8
	ldm r2!, {r5-r7}
	stm r3!, {r5-r7}
	ldm r2!, {r5-r7}
	stm r3!, {r5-r7}
	strh r0, [r4, 0x2]
	ldr r0, _08143678 @ =gUnknown_0840B69C
	lsrs r1, 22
	adds r1, r0
	ldr r0, [r1]
	str r0, [r4, 0xC]
	ldr r0, _0814367C @ =gSpriteAnimTable_81E7C64
	str r0, [r4, 0x8]
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_08143670: .4byte gUnknown_02024E8C
_08143674: .4byte gUnknown_0840B6B8
_08143678: .4byte gUnknown_0840B69C
_0814367C: .4byte gSpriteAnimTable_81E7C64
	thumb_func_end sub_8143648

	thumb_func_start sub_8143680
sub_8143680: @ 8143680
	push {r4-r7,lr}
	lsls r1, 24
	ldr r4, _081436AC @ =gUnknown_02024E8C
	adds r3, r4, 0
	ldr r2, _081436B0 @ =gUnknown_0840B6B8
	ldm r2!, {r5-r7}
	stm r3!, {r5-r7}
	ldm r2!, {r5-r7}
	stm r3!, {r5-r7}
	strh r0, [r4, 0x2]
	ldr r0, _081436B4 @ =gUnknown_0840B69C
	lsrs r1, 22
	adds r1, r0
	ldr r0, [r1]
	str r0, [r4, 0xC]
	ldr r0, _081436B8 @ =gUnknown_081EC2A4
	ldr r0, [r0]
	str r0, [r4, 0x8]
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_081436AC: .4byte gUnknown_02024E8C
_081436B0: .4byte gUnknown_0840B6B8
_081436B4: .4byte gUnknown_0840B69C
_081436B8: .4byte gUnknown_081EC2A4
	thumb_func_end sub_8143680

	thumb_func_start sub_81436BC
sub_81436BC: @ 81436BC
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	sub sp, 0x10
	adds r6, r0, 0
	mov r9, r1
	mov r10, r2
	mov r8, r3
	ldr r7, [sp, 0x34]
	lsls r6, 16
	lsrs r6, 16
	mov r0, r9
	lsls r0, 16
	lsrs r0, 16
	mov r9, r0
	mov r1, r10
	lsls r1, 16
	lsrs r1, 16
	mov r10, r1
	mov r2, r8
	lsls r2, 16
	lsrs r2, 16
	mov r8, r2
	lsls r0, r6, 3
	ldr r1, _08143790 @ =gMonFrontPicTable
	adds r0, r1
	ldr r1, _08143794 @ =gMonFrontPicCoords
	lsls r2, r6, 2
	adds r2, r1
	ldrb r1, [r2]
	ldrb r2, [r2, 0x1]
	movs r3, 0x80
	lsls r3, 18
	ldr r4, _08143798 @ =gUnknown_0840B5A0
	mov r12, r4
	mov r5, r8
	lsls r4, r5, 2
	add r4, r12
	ldr r4, [r4]
	str r4, [sp]
	str r6, [sp, 0x4]
	str r7, [sp, 0x8]
	movs r4, 0x1
	str r4, [sp, 0xC]
	bl LoadSpecialPokePic
	adds r0, r6, 0
	ldr r1, [sp, 0x30]
	adds r2, r7, 0
	bl species_and_otid_get_pal
	lsls r4, r5, 4
	movs r2, 0x80
	lsls r2, 1
	adds r1, r4, r2
	lsls r1, 16
	lsrs r1, 16
	movs r2, 0x20
	bl LoadCompressedPalette
	lsls r1, r5, 24
	lsrs r1, 24
	mov r0, r8
	bl sub_8143648
	ldr r0, _0814379C @ =gUnknown_02024E8C
	mov r5, r9
	lsls r5, 16
	asrs r5, 16
	mov r9, r5
	mov r1, r10
	lsls r1, 16
	asrs r1, 16
	mov r10, r1
	movs r3, 0xA
	mov r2, r8
	subs r3, r2
	lsls r3, 24
	lsrs r3, 24
	mov r1, r9
	mov r2, r10
	bl CreateSprite
	lsls r0, 24
	lsrs r0, 24
	ldr r1, _081437A0 @ =gSprites
	lsls r2, r0, 4
	adds r2, r0
	lsls r2, 2
	adds r2, r1
	ldrb r3, [r2, 0x5]
	movs r1, 0xF
	ands r1, r3
	orrs r1, r4
	strb r1, [r2, 0x5]
	add sp, 0x10
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r1}
	bx r1
	.align 2, 0
_08143790: .4byte gMonFrontPicTable
_08143794: .4byte gMonFrontPicCoords
_08143798: .4byte gUnknown_0840B5A0
_0814379C: .4byte gUnknown_02024E8C
_081437A0: .4byte gSprites
	thumb_func_end sub_81436BC

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
