	.include "constants/gba_constants.inc"
	.include "include/macros.inc"

	.syntax unified

	.text

	@ current

	thumb_func_start sub_80D648C
sub_80D648C: @ 80D648C
	push {r4-r6,lr}
	adds r4, r0, 0
	movs r1, 0x1
	bl InitAnimSpritePos
	ldr r5, _080D6500 @ =gBattleAnimArgs
	ldrh r0, [r5, 0x6]
	strh r0, [r4, 0x2E]
	ldrh r0, [r4, 0x20]
	strh r0, [r4, 0x30]
	ldr r6, _080D6504 @ =gAnimBankTarget
	ldrb r0, [r6]
	movs r1, 0x2
	bl GetBankPosition
	lsls r0, 24
	lsrs r0, 24
	strh r0, [r4, 0x32]
	ldrh r0, [r4, 0x22]
	strh r0, [r4, 0x34]
	ldrb r0, [r6]
	movs r1, 0x3
	bl GetBankPosition
	lsls r0, 24
	lsrs r0, 24
	strh r0, [r4, 0x36]
	adds r0, r4, 0
	bl InitAnimSpriteTranslationDeltas
	ldrh r0, [r5, 0x4]
	strh r0, [r4, 0x38]
	ldrh r0, [r5, 0xA]
	strh r0, [r4, 0x3A]
	ldrh r0, [r5, 0x8]
	strh r0, [r4, 0x3C]
	ldrh r2, [r4, 0x4]
	lsls r1, r2, 22
	lsrs r1, 22
	movs r3, 0xC
	ldrsh r0, [r5, r3]
	lsls r0, 2
	adds r1, r0
	ldr r3, _080D6508 @ =0x000003ff
	adds r0, r3, 0
	ands r1, r0
	ldr r0, _080D650C @ =0xfffffc00
	ands r0, r2
	orrs r0, r1
	strh r0, [r4, 0x4]
	ldr r1, _080D6510 @ =sub_80D6514
	str r1, [r4, 0x1C]
	adds r0, r4, 0
	bl _call_via_r1
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_080D6500: .4byte gBattleAnimArgs
_080D6504: .4byte gAnimBankTarget
_080D6508: .4byte 0x000003ff
_080D650C: .4byte 0xfffffc00
_080D6510: .4byte sub_80D6514
	thumb_func_end sub_80D648C

	thumb_func_start sub_80D6514
sub_80D6514: @ 80D6514
	push {r4,lr}
	adds r4, r0, 0
	bl TranslateAnimSpriteByDeltas
	lsls r0, 24
	cmp r0, 0
	bne _080D657E
	movs r1, 0x3C
	ldrsh r0, [r4, r1]
	movs r2, 0x38
	ldrsh r1, [r4, r2]
	bl Sin
	ldrh r1, [r4, 0x24]
	adds r0, r1
	strh r0, [r4, 0x24]
	movs r2, 0x3C
	ldrsh r0, [r4, r2]
	movs r2, 0x38
	ldrsh r1, [r4, r2]
	bl Cos
	ldrh r1, [r4, 0x26]
	adds r0, r1
	strh r0, [r4, 0x26]
	ldrh r0, [r4, 0x3A]
	ldrh r2, [r4, 0x3C]
	adds r0, r2
	movs r1, 0xFF
	ands r0, r1
	strh r0, [r4, 0x3C]
	movs r1, 0x3C
	ldrsh r0, [r4, r1]
	movs r1, 0x3
	bl __modsi3
	lsls r0, 16
	cmp r0, 0
	bne _080D6584
	adds r3, r4, 0
	adds r3, 0x3E
	ldrb r2, [r3]
	lsls r0, r2, 29
	lsrs r0, 31
	movs r1, 0x1
	eors r1, r0
	lsls r1, 2
	movs r0, 0x5
	negs r0, r0
	ands r0, r2
	orrs r0, r1
	strb r0, [r3]
	b _080D6584
_080D657E:
	adds r0, r4, 0
	bl DestroyAnimSprite
_080D6584:
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end sub_80D6514

	thumb_func_start sub_80D658C
sub_80D658C: @ 80D658C
	push {lr}
	adds r3, r0, 0
	ldrh r0, [r3, 0x38]
	subs r0, 0x1
	strh r0, [r3, 0x38]
	lsls r0, 16
	asrs r0, 16
	movs r1, 0x1
	negs r1, r1
	cmp r0, r1
	bne _080D65C4
	movs r0, 0x3E
	adds r0, r3
	mov r12, r0
	ldrb r2, [r0]
	lsls r0, r2, 29
	lsrs r0, 31
	movs r1, 0x1
	eors r1, r0
	lsls r1, 2
	movs r0, 0x5
	negs r0, r0
	ands r0, r2
	orrs r0, r1
	mov r1, r12
	strb r0, [r1]
	ldrh r0, [r3, 0x36]
	strh r0, [r3, 0x38]
_080D65C4:
	ldrh r0, [r3, 0x34]
	subs r1, r0, 0x1
	strh r1, [r3, 0x34]
	lsls r0, 16
	cmp r0, 0
	bgt _080D65D6
	adds r0, r3, 0
	bl DestroyAnimSprite
_080D65D6:
	pop {r0}
	bx r0
	thumb_func_end sub_80D658C

	thumb_func_start sub_80D65DC
sub_80D65DC: @ 80D65DC
	push {r4-r6,lr}
	adds r6, r0, 0
	ldr r0, _080D6644 @ =gMain
	ldr r1, _080D6648 @ =0x0000043d
	adds r0, r1
	ldrb r1, [r0]
	movs r0, 0x2
	ands r0, r1
	cmp r0, 0
	beq _080D65FE
	ldr r0, _080D664C @ =gAnimBankTarget
	ldrb r0, [r0]
	bl GetBattlerSide
	lsls r0, 24
	cmp r0, 0
	bne _080D6606
_080D65FE:
	ldr r1, _080D6650 @ =gBattleAnimArgs
	ldrh r0, [r1, 0x2]
	negs r0, r0
	strh r0, [r1, 0x2]
_080D6606:
	ldr r5, _080D664C @ =gAnimBankTarget
	ldrb r0, [r5]
	movs r1, 0x2
	bl GetBankPosition
	lsls r0, 24
	ldr r4, _080D6650 @ =gBattleAnimArgs
	lsrs r0, 24
	ldrh r1, [r4, 0x2]
	adds r0, r1
	strh r0, [r6, 0x20]
	ldrb r0, [r5]
	movs r1, 0x3
	bl GetBankPosition
	lsls r0, 24
	lsrs r0, 24
	ldrh r1, [r4, 0x4]
	adds r0, r1
	strh r0, [r6, 0x22]
	ldrh r0, [r4]
	strh r0, [r6, 0x34]
	ldrh r0, [r4, 0x6]
	strh r0, [r6, 0x36]
	strh r0, [r6, 0x38]
	ldr r0, _080D6654 @ =sub_80D658C
	str r0, [r6, 0x1C]
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_080D6644: .4byte gMain
_080D6648: .4byte 0x0000043d
_080D664C: .4byte gAnimBankTarget
_080D6650: .4byte gBattleAnimArgs
_080D6654: .4byte sub_80D658C
	thumb_func_end sub_80D65DC

	thumb_func_start sub_80D6658
sub_80D6658: @ 80D6658
	push {r4-r6,lr}
	adds r5, r0, 0
	ldr r1, _080D6674 @ =gBattleAnimArgs
	ldrh r0, [r1, 0x6]
	strh r0, [r5, 0x2E]
	movs r2, 0xE
	ldrsh r0, [r1, r2]
	movs r1, 0x80
	lsls r1, 8
	ands r0, r1
	cmp r0, 0
	beq _080D667C
	ldr r0, _080D6678 @ =gAnimBankTarget
	b _080D667E
	.align 2, 0
_080D6674: .4byte gBattleAnimArgs
_080D6678: .4byte gAnimBankTarget
_080D667C:
	ldr r0, _080D670C @ =gAnimBankAttacker
_080D667E:
	ldrb r6, [r0]
	ldr r0, _080D6710 @ =gMain
	ldr r3, _080D6714 @ =0x0000043d
	adds r0, r3
	ldrb r1, [r0]
	movs r0, 0x2
	ands r0, r1
	cmp r0, 0
	beq _080D669C
	adds r0, r6, 0
	bl GetBattlerSide
	lsls r0, 24
	cmp r0, 0
	bne _080D66A4
_080D669C:
	ldr r1, _080D6718 @ =gBattleAnimArgs
	ldrh r0, [r1]
	negs r0, r0
	strh r0, [r1]
_080D66A4:
	adds r0, r6, 0
	movs r1, 0x2
	bl GetBankPosition
	lsls r0, 24
	ldr r4, _080D6718 @ =gBattleAnimArgs
	lsrs r0, 24
	ldrh r1, [r4]
	adds r0, r1
	strh r0, [r5, 0x20]
	adds r0, r6, 0
	movs r1, 0x3
	bl GetBankPosition
	lsls r0, 24
	lsrs r0, 24
	ldrh r2, [r4, 0x2]
	adds r0, r2
	strh r0, [r5, 0x22]
	ldrh r1, [r4, 0xE]
	ldr r0, _080D671C @ =0x00007fff
	ands r0, r1
	strh r0, [r5, 0x36]
	ldrh r0, [r4, 0x4]
	strh r0, [r5, 0x38]
	ldrh r0, [r4, 0xA]
	strh r0, [r5, 0x3A]
	ldrh r0, [r4, 0x8]
	strh r0, [r5, 0x3C]
	ldrh r2, [r5, 0x4]
	lsls r1, r2, 22
	lsrs r1, 22
	movs r3, 0xC
	ldrsh r0, [r4, r3]
	lsls r0, 2
	adds r1, r0
	ldr r3, _080D6720 @ =0x000003ff
	adds r0, r3, 0
	ands r1, r0
	ldr r0, _080D6724 @ =0xfffffc00
	ands r0, r2
	orrs r0, r1
	strh r0, [r5, 0x4]
	ldr r1, _080D6728 @ =sub_80D672C
	str r1, [r5, 0x1C]
	adds r0, r5, 0
	bl _call_via_r1
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_080D670C: .4byte gAnimBankAttacker
_080D6710: .4byte gMain
_080D6714: .4byte 0x0000043d
_080D6718: .4byte gBattleAnimArgs
_080D671C: .4byte 0x00007fff
_080D6720: .4byte 0x000003ff
_080D6724: .4byte 0xfffffc00
_080D6728: .4byte sub_80D672C
	thumb_func_end sub_80D6658

	thumb_func_start sub_80D672C
sub_80D672C: @ 80D672C
	push {r4,lr}
	adds r4, r0, 0
	movs r1, 0x3C
	ldrsh r0, [r4, r1]
	movs r2, 0x38
	ldrsh r1, [r4, r2]
	bl Sin
	strh r0, [r4, 0x24]
	movs r1, 0x3C
	ldrsh r0, [r4, r1]
	movs r2, 0x38
	ldrsh r1, [r4, r2]
	bl Cos
	strh r0, [r4, 0x26]
	ldrh r0, [r4, 0x3A]
	ldrh r1, [r4, 0x3C]
	adds r0, r1
	movs r1, 0xFF
	ands r0, r1
	strh r0, [r4, 0x3C]
	movs r2, 0x3C
	ldrsh r0, [r4, r2]
	movs r2, 0x36
	ldrsh r1, [r4, r2]
	bl __modsi3
	cmp r0, 0
	bne _080D6782
	adds r3, r4, 0
	adds r3, 0x3E
	ldrb r2, [r3]
	lsls r0, r2, 29
	lsrs r0, 31
	movs r1, 0x1
	eors r1, r0
	lsls r1, 2
	movs r0, 0x5
	negs r0, r0
	ands r0, r2
	orrs r0, r1
	strb r0, [r3]
_080D6782:
	ldrh r0, [r4, 0x2E]
	subs r1, r0, 0x1
	strh r1, [r4, 0x2E]
	lsls r0, 16
	cmp r0, 0
	bgt _080D6794
	adds r0, r4, 0
	bl DestroyAnimSprite
_080D6794:
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end sub_80D672C

	thumb_func_start sub_80D679C
sub_80D679C: @ 80D679C
	push {r4,r5,lr}
	adds r4, r0, 0
	movs r1, 0
	bl sub_8078764
	ldrh r2, [r4, 0x4]
	lsls r1, r2, 22
	lsrs r1, 22
	ldr r3, _080D67D8 @ =gBattleAnimArgs
	movs r5, 0x6
	ldrsh r0, [r3, r5]
	lsls r0, 2
	adds r1, r0
	ldr r5, _080D67DC @ =0x000003ff
	adds r0, r5, 0
	ands r1, r0
	ldr r0, _080D67E0 @ =0xfffffc00
	ands r0, r2
	orrs r0, r1
	strh r0, [r4, 0x4]
	movs r1, 0x6
	ldrsh r0, [r3, r1]
	cmp r0, 0x1
	bne _080D67E4
	ldrb r0, [r4, 0x3]
	movs r1, 0x3F
	negs r1, r1
	ands r1, r0
	movs r0, 0x10
	b _080D67F2
	.align 2, 0
_080D67D8: .4byte gBattleAnimArgs
_080D67DC: .4byte 0x000003ff
_080D67E0: .4byte 0xfffffc00
_080D67E4:
	cmp r0, 0x2
	bne _080D67F6
	ldrb r0, [r4, 0x3]
	movs r1, 0x3F
	negs r1, r1
	ands r1, r0
	movs r0, 0x20
_080D67F2:
	orrs r1, r0
	strb r1, [r4, 0x3]
_080D67F6:
	ldr r0, _080D6810 @ =gBattleAnimArgs
	ldrh r0, [r0, 0x4]
	strh r0, [r4, 0x2E]
	ldr r0, _080D6814 @ =WaitAnimForDuration
	str r0, [r4, 0x1C]
	ldr r1, _080D6818 @ =DestroyAnimSprite
	adds r0, r4, 0
	bl StoreSpriteCallbackInData
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080D6810: .4byte gBattleAnimArgs
_080D6814: .4byte WaitAnimForDuration
_080D6818: .4byte DestroyAnimSprite
	thumb_func_end sub_80D679C

	thumb_func_start sub_80D681C
sub_80D681C: @ 80D681C
	push {r4-r6,lr}
	adds r5, r0, 0
	lsls r5, 24
	lsrs r5, 24
	ldr r6, _080D6864 @ =gAnimBankTarget
	ldrb r0, [r6]
	movs r1, 0
	bl GetBankPosition
	ldr r1, _080D6868 @ =gTasks
	lsls r4, r5, 2
	adds r4, r5
	lsls r4, 3
	adds r4, r1
	lsls r0, 24
	ldr r5, _080D686C @ =gBattleAnimArgs
	lsrs r0, 24
	ldrh r1, [r5]
	adds r0, r1
	strh r0, [r4, 0x8]
	ldrb r0, [r6]
	movs r1, 0x1
	bl GetBankPosition
	lsls r0, 24
	lsrs r0, 24
	ldrh r1, [r5, 0x2]
	adds r0, r1
	strh r0, [r4, 0xA]
	ldrh r0, [r5, 0x4]
	strh r0, [r4, 0xC]
	ldr r0, _080D6870 @ =sub_80D6874
	str r0, [r4]
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_080D6864: .4byte gAnimBankTarget
_080D6868: .4byte gTasks
_080D686C: .4byte gBattleAnimArgs
_080D6870: .4byte sub_80D6874
	thumb_func_end sub_80D681C

	thumb_func_start sub_80D6874
sub_80D6874: @ 80D6874
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	sub sp, 0x4
	lsls r0, 24
	lsrs r0, 24
	mov r9, r0
	movs r5, 0
	movs r7, 0
	ldr r1, _080D68B4 @ =gTasks
	lsls r0, 2
	add r0, r9
	lsls r0, 3
	adds r0, r1
	ldrb r2, [r0, 0xC]
	str r2, [sp]
	ldrh r4, [r0, 0x8]
	ldrh r6, [r0, 0xA]
	movs r3, 0xC
	ldrsh r0, [r0, r3]
	mov r10, r1
	cmp r0, 0
	bne _080D68B8
	movs r0, 0
	mov r8, r0
	movs r2, 0x1
	movs r1, 0x10
	mov r12, r1
	b _080D68C2
	.align 2, 0
_080D68B4: .4byte gTasks
_080D68B8:
	movs r2, 0x10
	mov r12, r2
	movs r3, 0x8
	mov r8, r3
	movs r2, 0x4
_080D68C2:
	mov r0, r9
	lsls r1, r0, 2
	adds r0, r1, r0
	lsls r0, 3
	add r0, r10
	movs r3, 0x1C
	ldrsh r0, [r0, r3]
	mov r10, r1
	cmp r0, 0xA
	bhi _080D69B8
	lsls r0, 2
	ldr r1, _080D68E0 @ =_080D68E4
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_080D68E0: .4byte _080D68E4
	.align 2, 0
_080D68E4:
	.4byte _080D6910
	.4byte _080D69B8
	.4byte _080D6924
	.4byte _080D69B8
	.4byte _080D6944
	.4byte _080D69B8
	.4byte _080D695A
	.4byte _080D69B8
	.4byte _080D697C
	.4byte _080D69B8
	.4byte _080D69B0
_080D6910:
	ldr r0, _080D6920 @ =gSpriteTemplate_83D9938
	lsls r1, r4, 16
	asrs r1, 16
	lsls r2, r6, 16
	asrs r2, 16
	mov r4, r12
	lsls r3, r4, 16
	b _080D6992
	.align 2, 0
_080D6920: .4byte gSpriteTemplate_83D9938
_080D6924:
	mov r0, r12
	lsls r3, r0, 17
	mov r1, r8
	adds r0, r1, r2
	lsls r0, 16
	lsrs r0, 16
	mov r8, r0
	ldr r0, _080D6940 @ =gSpriteTemplate_83D9938
	lsls r1, r4, 16
	asrs r1, 16
	lsls r2, r6, 16
	asrs r2, 16
	b _080D6992
	.align 2, 0
_080D6940: .4byte gSpriteTemplate_83D9938
_080D6944:
	mov r3, r12
	lsls r0, r3, 16
	asrs r0, 16
	lsls r3, r0, 1
	adds r3, r0
	lsls r0, r2, 1
	add r0, r8
	lsls r0, 16
	lsrs r0, 16
	mov r8, r0
	b _080D6986
_080D695A:
	mov r0, r12
	lsls r3, r0, 18
	lsls r0, r2, 1
	adds r0, r2
	add r0, r8
	lsls r0, 16
	lsrs r0, 16
	mov r8, r0
	ldr r0, _080D6978 @ =gSpriteTemplate_83D9938
	lsls r1, r4, 16
	asrs r1, 16
	lsls r2, r6, 16
	asrs r2, 16
	b _080D6992
	.align 2, 0
_080D6978: .4byte gSpriteTemplate_83D9938
_080D697C:
	mov r1, r12
	lsls r0, r1, 16
	asrs r0, 16
	lsls r3, r0, 2
	adds r3, r0
_080D6986:
	ldr r0, _080D69AC @ =gSpriteTemplate_83D9938
	lsls r1, r4, 16
	asrs r1, 16
	lsls r2, r6, 16
	asrs r2, 16
	lsls r3, 16
_080D6992:
	asrs r3, 16
	adds r2, r3
	lsls r2, 16
	asrs r2, 16
	movs r3, 0x2
	bl CreateSprite
	lsls r0, 24
	lsrs r5, r0, 24
	adds r0, r7, 0x1
	lsls r0, 24
	lsrs r7, r0, 24
	b _080D69B8
	.align 2, 0
_080D69AC: .4byte gSpriteTemplate_83D9938
_080D69B0:
	mov r0, r9
	bl DestroyAnimVisualTask
	b _080D69FC
_080D69B8:
	cmp r7, 0
	beq _080D69EC
	ldr r4, _080D6A0C @ =gSprites
	lsls r3, r5, 4
	adds r3, r5
	lsls r3, 2
	adds r0, r3, r4
	ldrh r5, [r0, 0x4]
	lsls r2, r5, 22
	lsrs r2, 22
	add r2, r8
	ldr r6, _080D6A10 @ =0x000003ff
	adds r1, r6, 0
	ands r2, r1
	ldr r1, _080D6A14 @ =0xfffffc00
	ands r1, r5
	orrs r1, r2
	strh r1, [r0, 0x4]
	mov r1, sp
	ldrh r1, [r1]
	strh r1, [r0, 0x2E]
	adds r4, 0x1C
	adds r3, r4
	ldr r1, [r3]
	bl _call_via_r1
_080D69EC:
	ldr r0, _080D6A18 @ =gTasks
	mov r1, r10
	add r1, r9
	lsls r1, 3
	adds r1, r0
	ldrh r0, [r1, 0x1C]
	adds r0, 0x1
	strh r0, [r1, 0x1C]
_080D69FC:
	add sp, 0x4
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080D6A0C: .4byte gSprites
_080D6A10: .4byte 0x000003ff
_080D6A14: .4byte 0xfffffc00
_080D6A18: .4byte gTasks
	thumb_func_end sub_80D6874

	thumb_func_start sub_80D6A1C
sub_80D6A1C: @ 80D6A1C
	push {lr}
	adds r3, r0, 0
	movs r1, 0x2E
	ldrsh r0, [r3, r1]
	cmp r0, 0
	bne _080D6A3E
	ldrb r1, [r3, 0x1]
	movs r2, 0x3F
	adds r0, r2, 0
	ands r0, r1
	movs r1, 0x80
	orrs r0, r1
	strb r0, [r3, 0x1]
	ldrb r0, [r3, 0x3]
	ands r2, r0
	strb r2, [r3, 0x3]
	b _080D6A52
_080D6A3E:
	ldrb r2, [r3, 0x1]
	movs r1, 0x3F
	adds r0, r1, 0
	ands r0, r2
	strb r0, [r3, 0x1]
	ldrb r0, [r3, 0x3]
	ands r1, r0
	movs r0, 0x40
	orrs r1, r0
	strb r1, [r3, 0x3]
_080D6A52:
	ldrh r0, [r3, 0x30]
	adds r0, 0x1
	strh r0, [r3, 0x30]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0xF
	bne _080D6A66
	adds r0, r3, 0
	bl DestroySprite
_080D6A66:
	pop {r0}
	bx r0
	thumb_func_end sub_80D6A1C

	thumb_func_start sub_80D6A6C
sub_80D6A6C: @ 80D6A6C
	push {r4-r7,lr}
	adds r4, r0, 0
	ldr r0, _080D6AD4 @ =gBattleAnimArgs
	ldrh r1, [r0]
	ldrh r2, [r4, 0x20]
	adds r1, r2
	strh r1, [r4, 0x20]
	ldrh r0, [r0, 0x2]
	ldrh r3, [r4, 0x22]
	adds r0, r3
	strh r0, [r4, 0x22]
	ldr r0, _080D6AD8 @ =gBattleAnimSpriteTemplate_83D9950
	adds r1, 0x20
	lsls r1, 16
	asrs r1, 16
	movs r7, 0x22
	ldrsh r2, [r4, r7]
	adds r3, r4, 0
	adds r3, 0x43
	ldrb r3, [r3]
	bl CreateSprite
	lsls r0, 24
	lsrs r0, 24
	ldr r3, _080D6ADC @ =gSprites
	lsls r2, r0, 4
	adds r2, r0
	lsls r2, 2
	adds r6, r2, r3
	ldrh r5, [r6, 0x4]
	lsls r1, r5, 22
	lsrs r1, 22
	adds r1, 0x8
	ldr r7, _080D6AE0 @ =0x000003ff
	adds r0, r7, 0
	ands r1, r0
	ldr r0, _080D6AE4 @ =0xfffffc00
	ands r0, r5
	orrs r0, r1
	strh r0, [r6, 0x4]
	ldr r1, _080D6AE8 @ =gAnimVisualTaskCount
	ldrb r0, [r1]
	adds r0, 0x1
	strb r0, [r1]
	adds r3, 0x1C
	adds r2, r3
	ldr r0, _080D6AEC @ =sub_80D6AF0
	str r0, [r2]
	str r0, [r4, 0x1C]
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080D6AD4: .4byte gBattleAnimArgs
_080D6AD8: .4byte gBattleAnimSpriteTemplate_83D9950
_080D6ADC: .4byte gSprites
_080D6AE0: .4byte 0x000003ff
_080D6AE4: .4byte 0xfffffc00
_080D6AE8: .4byte gAnimVisualTaskCount
_080D6AEC: .4byte sub_80D6AF0
	thumb_func_end sub_80D6A6C

	thumb_func_start sub_80D6AF0
sub_80D6AF0: @ 80D6AF0
	push {lr}
	adds r3, r0, 0
	ldrh r0, [r3, 0x2E]
	adds r0, 0x1
	strh r0, [r3, 0x2E]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x3
	bne _080D6B24
	movs r0, 0
	strh r0, [r3, 0x2E]
	movs r0, 0x3E
	adds r0, r3
	mov r12, r0
	ldrb r2, [r0]
	lsls r0, r2, 29
	lsrs r0, 31
	movs r1, 0x1
	eors r1, r0
	lsls r1, 2
	movs r0, 0x5
	negs r0, r0
	ands r0, r2
	orrs r0, r1
	mov r1, r12
	strb r0, [r1]
_080D6B24:
	ldrh r0, [r3, 0x30]
	adds r0, 0x1
	strh r0, [r3, 0x30]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x33
	bne _080D6B38
	adds r0, r3, 0
	bl DestroyAnimSprite
_080D6B38:
	pop {r0}
	bx r0
	thumb_func_end sub_80D6AF0

	thumb_func_start sub_80D6B3C
sub_80D6B3C: @ 80D6B3C
	push {r4,r5,lr}
	lsls r0, 24
	lsrs r0, 24
	lsls r1, r0, 2
	adds r1, r0
	lsls r1, 3
	ldr r0, _080D6B5C @ =gTasks
	adds r5, r1, r0
	ldr r0, _080D6B60 @ =gBattleAnimArgs
	movs r1, 0
	ldrsh r0, [r0, r1]
	cmp r0, 0
	bne _080D6B68
	ldr r4, _080D6B64 @ =gAnimBankAttacker
	b _080D6B6A
	.align 2, 0
_080D6B5C: .4byte gTasks
_080D6B60: .4byte gBattleAnimArgs
_080D6B64: .4byte gAnimBankAttacker
_080D6B68:
	ldr r4, _080D6BAC @ =gAnimBankTarget
_080D6B6A:
	ldrb r0, [r4]
	movs r1, 0x2
	bl GetBankPosition
	lsls r0, 24
	lsrs r0, 24
	strh r0, [r5, 0x24]
	ldrb r0, [r4]
	movs r1, 0x3
	bl GetBankPosition
	lsls r0, 24
	lsrs r0, 24
	strh r0, [r5, 0x26]
	ldr r2, _080D6BB0 @ =gBattleAnimArgs
	ldrh r0, [r2, 0x2]
	movs r1, 0
	strh r0, [r5, 0x14]
	strh r1, [r5, 0x16]
	strh r1, [r5, 0x18]
	strh r1, [r5, 0x1A]
	strh r1, [r5, 0x1C]
	ldrh r0, [r2, 0x6]
	strh r0, [r5, 0x1E]
	strh r1, [r5, 0x20]
	ldrh r0, [r2, 0x4]
	strh r0, [r5, 0x22]
	ldr r0, _080D6BB4 @ =sub_80D6BB8
	str r0, [r5]
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080D6BAC: .4byte gAnimBankTarget
_080D6BB0: .4byte gBattleAnimArgs
_080D6BB4: .4byte sub_80D6BB8
	thumb_func_end sub_80D6B3C

	thumb_func_start sub_80D6BB8
sub_80D6BB8: @ 80D6BB8
	push {r4-r7,lr}
	lsls r0, 24
	lsrs r6, r0, 24
	adds r2, r6, 0
	lsls r0, r6, 2
	adds r0, r6
	lsls r0, 3
	ldr r1, _080D6CA0 @ =gTasks
	adds r5, r0, r1
	movs r1, 0x14
	ldrsh r0, [r5, r1]
	cmp r0, 0
	beq _080D6CB8
	ldrh r0, [r5, 0x20]
	adds r0, 0x1
	movs r7, 0
	strh r0, [r5, 0x20]
	lsls r0, 16
	asrs r0, 16
	movs r2, 0x22
	ldrsh r1, [r5, r2]
	cmp r0, r1
	ble _080D6CC6
	strh r7, [r5, 0x20]
	ldr r0, _080D6CA4 @ =gSpriteTemplate_83D99B8
	movs r3, 0x24
	ldrsh r1, [r5, r3]
	movs r3, 0x26
	ldrsh r2, [r5, r3]
	movs r3, 0x2
	bl CreateSprite
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x40
	beq _080D6CC6
	lsls r4, r0, 4
	adds r4, r0
	lsls r4, 2
	ldr r0, _080D6CA8 @ =gSprites
	adds r4, r0
	ldr r1, _080D6CAC @ =gUnknown_083D9968
	movs r2, 0x1A
	ldrsh r0, [r5, r2]
	lsls r0, 1
	adds r0, r1
	movs r3, 0
	ldrsb r3, [r0, r3]
	ldrh r0, [r4, 0x20]
	adds r3, r0
	strh r3, [r4, 0x20]
	movs r2, 0x1A
	ldrsh r0, [r5, r2]
	lsls r0, 1
	adds r1, 0x1
	adds r0, r1
	movs r2, 0
	ldrsb r2, [r0, r2]
	ldrh r0, [r4, 0x22]
	adds r2, r0
	strh r2, [r4, 0x22]
	movs r1, 0x18
	ldrsh r0, [r5, r1]
	lsls r1, r0, 2
	adds r1, r0
	movs r0, 0x28
	subs r0, r1
	strh r0, [r4, 0x2E]
	strh r3, [r4, 0x30]
	ldrh r0, [r5, 0x24]
	strh r0, [r4, 0x32]
	strh r2, [r4, 0x34]
	ldrh r0, [r5, 0x26]
	strh r0, [r4, 0x36]
	strh r6, [r4, 0x38]
	adds r0, r4, 0
	bl InitAnimSpriteTranslationDeltas
	ldr r1, _080D6CB0 @ =sub_80D6D00
	adds r0, r4, 0
	bl StoreSpriteCallbackInData
	ldr r0, _080D6CB4 @ =sub_8078600
	str r0, [r4, 0x1C]
	ldrh r0, [r5, 0x1A]
	adds r0, 0x1
	strh r0, [r5, 0x1A]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0xF
	ble _080D6C70
	strh r7, [r5, 0x1A]
_080D6C70:
	ldrh r0, [r5, 0x1C]
	adds r0, 0x1
	strh r0, [r5, 0x1C]
	lsls r0, 16
	asrs r0, 16
	movs r2, 0x1E
	ldrsh r1, [r5, r2]
	cmp r0, r1
	blt _080D6C92
	strh r7, [r5, 0x1C]
	ldrh r1, [r5, 0x18]
	movs r3, 0x18
	ldrsh r0, [r5, r3]
	cmp r0, 0x5
	bgt _080D6C92
	adds r0, r1, 0x1
	strh r0, [r5, 0x18]
_080D6C92:
	ldrh r0, [r5, 0x16]
	adds r0, 0x1
	strh r0, [r5, 0x16]
	ldrh r0, [r5, 0x14]
	subs r0, 0x1
	strh r0, [r5, 0x14]
	b _080D6CC6
	.align 2, 0
_080D6CA0: .4byte gTasks
_080D6CA4: .4byte gSpriteTemplate_83D99B8
_080D6CA8: .4byte gSprites
_080D6CAC: .4byte gUnknown_083D9968
_080D6CB0: .4byte sub_80D6D00
_080D6CB4: .4byte sub_8078600
_080D6CB8:
	movs r1, 0x16
	ldrsh r0, [r5, r1]
	cmp r0, 0
	bne _080D6CC6
	adds r0, r2, 0
	bl DestroyAnimVisualTask
_080D6CC6:
	pop {r4-r7}
	pop {r0}
	bx r0
	thumb_func_end sub_80D6BB8

	thumb_func_start sub_80D6CCC
sub_80D6CCC: @ 80D6CCC
	push {r4,lr}
	adds r4, r0, 0
	bl TranslateAnimSpriteByDeltas
	lsls r0, 24
	cmp r0, 0
	beq _080D6CF4
	ldr r2, _080D6CFC @ =gTasks
	movs r0, 0x38
	ldrsh r1, [r4, r0]
	lsls r0, r1, 2
	adds r0, r1
	lsls r0, 3
	adds r0, r2
	ldrh r1, [r0, 0x16]
	subs r1, 0x1
	strh r1, [r0, 0x16]
	adds r0, r4, 0
	bl DestroySprite
_080D6CF4:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080D6CFC: .4byte gTasks
	thumb_func_end sub_80D6CCC

	thumb_func_start sub_80D6D00
sub_80D6D00: @ 80D6D00
	push {r4,lr}
	adds r4, r0, 0
	movs r1, 0x1
	bl StartSpriteAnim
	ldr r0, _080D6D14 @ =sub_80D6CCC
	str r0, [r4, 0x1C]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080D6D14: .4byte sub_80D6CCC
	thumb_func_end sub_80D6D00

	thumb_func_start sub_80D6D18
sub_80D6D18: @ 80D6D18
	push {r4,r5,lr}
	adds r5, r0, 0
	ldr r0, _080D6D2C @ =gBattleAnimArgs
	movs r1, 0
	ldrsh r0, [r0, r1]
	cmp r0, 0
	bne _080D6D34
	ldr r4, _080D6D30 @ =gAnimBankAttacker
	b _080D6D36
	.align 2, 0
_080D6D2C: .4byte gBattleAnimArgs
_080D6D30: .4byte gAnimBankAttacker
_080D6D34:
	ldr r4, _080D6D64 @ =gAnimBankTarget
_080D6D36:
	ldrb r0, [r4]
	movs r1, 0x2
	bl GetBankPosition
	lsls r0, 24
	lsrs r0, 24
	strh r0, [r5, 0x20]
	ldrb r0, [r4]
	movs r1, 0x3
	bl GetBankPosition
	lsls r0, 24
	lsrs r0, 24
	strh r0, [r5, 0x22]
	ldr r1, _080D6D68 @ =move_anim_8074EE0
	adds r0, r5, 0
	bl StoreSpriteCallbackInData
	ldr r0, _080D6D6C @ =sub_80785E4
	str r0, [r5, 0x1C]
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080D6D64: .4byte gAnimBankTarget
_080D6D68: .4byte move_anim_8074EE0
_080D6D6C: .4byte sub_80785E4
	thumb_func_end sub_80D6D18

	thumb_func_start sub_80D6D70
sub_80D6D70: @ 80D6D70
	push {r4,r5,lr}
	adds r5, r0, 0
	ldr r0, _080D6D84 @ =gBattleAnimArgs
	movs r1, 0
	ldrsh r0, [r0, r1]
	cmp r0, 0
	bne _080D6D8C
	ldr r4, _080D6D88 @ =gAnimBankAttacker
	b _080D6D8E
	.align 2, 0
_080D6D84: .4byte gBattleAnimArgs
_080D6D88: .4byte gAnimBankAttacker
_080D6D8C:
	ldr r4, _080D6DC8 @ =gAnimBankTarget
_080D6D8E:
	ldrb r0, [r4]
	movs r1, 0x2
	bl GetBankPosition
	lsls r0, 24
	lsrs r0, 24
	strh r0, [r5, 0x20]
	ldrb r0, [r4]
	movs r1, 0x3
	bl GetBankPosition
	lsls r0, 24
	lsrs r0, 24
	strh r0, [r5, 0x22]
	ldr r1, _080D6DCC @ =gBattleAnimArgs
	ldrh r0, [r1, 0x2]
	strh r0, [r5, 0x24]
	ldrh r0, [r1, 0x4]
	strh r0, [r5, 0x26]
	ldr r1, _080D6DD0 @ =DestroyAnimSprite
	adds r0, r5, 0
	bl StoreSpriteCallbackInData
	ldr r0, _080D6DD4 @ =sub_8078600
	str r0, [r5, 0x1C]
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080D6DC8: .4byte gAnimBankTarget
_080D6DCC: .4byte gBattleAnimArgs
_080D6DD0: .4byte DestroyAnimSprite
_080D6DD4: .4byte sub_8078600
	thumb_func_end sub_80D6D70

	thumb_func_start sub_80D6DD8
sub_80D6DD8: @ 80D6DD8
	push {r4,r5,lr}
	adds r5, r0, 0
	movs r1, 0x1
	bl StartSpriteAffineAnim
	ldr r4, _080D6E30 @ =gAnimBankAttacker
	ldrb r0, [r4]
	movs r1, 0x2
	bl GetBankPosition
	lsls r0, 24
	lsrs r0, 24
	strh r0, [r5, 0x20]
	ldrb r0, [r4]
	movs r1, 0x3
	bl GetBankPosition
	lsls r0, 24
	lsrs r0, 24
	strh r0, [r5, 0x22]
	movs r0, 0
	bl GetAnimBankSpriteId
	lsls r0, 24
	lsrs r0, 24
	strh r0, [r5, 0x3A]
	movs r0, 0x10
	strh r0, [r5, 0x3C]
	ldrb r0, [r4]
	bl GetBattlerSide
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _080D6E26
	movs r1, 0x3C
	ldrsh r0, [r5, r1]
	negs r0, r0
	strh r0, [r5, 0x3C]
_080D6E26:
	ldr r0, _080D6E34 @ =sub_80D6E38
	str r0, [r5, 0x1C]
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080D6E30: .4byte gAnimBankAttacker
_080D6E34: .4byte sub_80D6E38
	thumb_func_end sub_80D6DD8

	thumb_func_start sub_80D6E38
sub_80D6E38: @ 80D6E38
	push {r4,lr}
	adds r4, r0, 0
	movs r1, 0x2E
	ldrsh r0, [r4, r1]
	cmp r0, 0
	beq _080D6E4A
	cmp r0, 0x1
	beq _080D6E60
	b _080D6E90
_080D6E4A:
	ldrh r0, [r4, 0x30]
	adds r0, 0x1
	strh r0, [r4, 0x30]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x28
	ble _080D6E90
	ldrh r0, [r4, 0x2E]
	adds r0, 0x1
	strh r0, [r4, 0x2E]
	b _080D6E90
_080D6E60:
	ldrh r2, [r4, 0x3C]
	ldrh r1, [r4, 0x20]
	adds r0, r2, r1
	strh r0, [r4, 0x20]
	ldr r3, _080D6E98 @ =gSprites
	movs r0, 0x3A
	ldrsh r1, [r4, r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r3
	ldrh r1, [r0, 0x24]
	adds r2, r1
	strh r2, [r0, 0x24]
	ldrh r0, [r4, 0x20]
	adds r0, 0x50
	lsls r0, 16
	movs r1, 0xC8
	lsls r1, 17
	cmp r0, r1
	bls _080D6E90
	adds r0, r4, 0
	bl move_anim_8074EE0
_080D6E90:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080D6E98: .4byte gSprites
	thumb_func_end sub_80D6E38

	thumb_func_start sub_80D6E9C
sub_80D6E9C: @ 80D6E9C
	push {r4-r6,lr}
	lsls r0, 24
	lsrs r3, r0, 24
	lsls r0, r3, 2
	adds r0, r3
	lsls r0, 3
	ldr r1, _080D6EC0 @ =gTasks
	adds r5, r0, r1
	movs r1, 0x8
	ldrsh r0, [r5, r1]
	cmp r0, 0x1
	beq _080D6F30
	cmp r0, 0x1
	bgt _080D6EC4
	cmp r0, 0
	beq _080D6ED0
	b _080D7000
	.align 2, 0
_080D6EC0: .4byte gTasks
_080D6EC4:
	cmp r0, 0x2
	beq _080D6F8C
	cmp r0, 0x3
	bne _080D6ECE
	b _080D6FE0
_080D6ECE:
	b _080D7000
_080D6ED0:
	movs r0, 0
	bl GetAnimBankSpriteId
	lsls r0, 24
	lsrs r0, 24
	movs r6, 0
	strh r0, [r5, 0x26]
	ldr r4, _080D6F04 @ =gAnimBankAttacker
	ldrb r0, [r4]
	movs r1, 0x2
	bl GetBankPosition
	lsls r0, 24
	lsrs r0, 24
	strh r0, [r5, 0x24]
	ldrb r0, [r4]
	bl GetBattlerSide
	lsls r0, 24
	cmp r0, 0
	bne _080D6F0C
	ldr r0, _080D6F08 @ =0x0000ffe0
	strh r0, [r5, 0x24]
	movs r0, 0x2
	b _080D6F12
	.align 2, 0
_080D6F04: .4byte gAnimBankAttacker
_080D6F08: .4byte 0x0000ffe0
_080D6F0C:
	movs r0, 0x20
	strh r0, [r5, 0x24]
	ldr r0, _080D6F28 @ =0x0000fffe
_080D6F12:
	strh r0, [r5, 0x22]
	ldr r2, _080D6F2C @ =gSprites
	movs r0, 0x26
	ldrsh r1, [r5, r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r2
	ldrh r1, [r5, 0x24]
	strh r1, [r0, 0x24]
	b _080D6FD2
	.align 2, 0
_080D6F28: .4byte 0x0000fffe
_080D6F2C: .4byte gSprites
_080D6F30:
	ldrh r0, [r5, 0xA]
	adds r0, 0x1
	strh r0, [r5, 0xA]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x1
	ble _080D7000
	movs r0, 0
	strh r0, [r5, 0xA]
	ldr r4, _080D6F88 @ =gSprites
	movs r1, 0x26
	ldrsh r0, [r5, r1]
	lsls r2, r0, 4
	adds r2, r0
	lsls r2, 2
	adds r2, r4
	adds r2, 0x3E
	ldrb r3, [r2]
	lsls r0, r3, 29
	lsrs r0, 31
	movs r1, 0x1
	eors r1, r0
	lsls r1, 2
	movs r0, 0x5
	negs r0, r0
	ands r0, r3
	orrs r0, r1
	strb r0, [r2]
	ldrh r1, [r5, 0x24]
	movs r2, 0x24
	ldrsh r0, [r5, r2]
	cmp r0, 0
	beq _080D6FD2
	ldrh r2, [r5, 0x22]
	adds r2, r1, r2
	strh r2, [r5, 0x24]
	movs r0, 0x26
	ldrsh r1, [r5, r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r4
	strh r2, [r0, 0x24]
	b _080D7000
	.align 2, 0
_080D6F88: .4byte gSprites
_080D6F8C:
	ldrh r0, [r5, 0xA]
	adds r0, 0x1
	strh r0, [r5, 0xA]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x1
	ble _080D7000
	movs r0, 0
	strh r0, [r5, 0xA]
	ldr r1, _080D6FDC @ =gSprites
	movs r2, 0x26
	ldrsh r0, [r5, r2]
	lsls r2, r0, 4
	adds r2, r0
	lsls r2, 2
	adds r2, r1
	adds r2, 0x3E
	ldrb r3, [r2]
	lsls r0, r3, 29
	lsrs r0, 31
	movs r1, 0x1
	eors r1, r0
	lsls r1, 2
	movs r0, 0x5
	negs r0, r0
	ands r0, r3
	orrs r0, r1
	strb r0, [r2]
	ldrh r0, [r5, 0xC]
	adds r0, 0x1
	strh r0, [r5, 0xC]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x8
	bne _080D7000
_080D6FD2:
	ldrh r0, [r5, 0x8]
	adds r0, 0x1
	strh r0, [r5, 0x8]
	b _080D7000
	.align 2, 0
_080D6FDC: .4byte gSprites
_080D6FE0:
	ldr r2, _080D7008 @ =gSprites
	movs r0, 0x26
	ldrsh r1, [r5, r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r2
	adds r0, 0x3E
	ldrb r2, [r0]
	movs r1, 0x5
	negs r1, r1
	ands r1, r2
	strb r1, [r0]
	adds r0, r3, 0
	bl DestroyAnimVisualTask
_080D7000:
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_080D7008: .4byte gSprites
	thumb_func_end sub_80D6E9C

	thumb_func_start sub_80D700C
sub_80D700C: @ 80D700C
	push {r4-r6,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	lsls r0, r4, 2
	adds r0, r4
	lsls r0, 3
	ldr r1, _080D7030 @ =gTasks
	adds r5, r0, r1
	movs r1, 0x8
	ldrsh r0, [r5, r1]
	cmp r0, 0x1
	bne _080D7026
	b _080D714C
_080D7026:
	cmp r0, 0x1
	bgt _080D7034
	cmp r0, 0
	beq _080D703C
	b _080D718E
	.align 2, 0
_080D7030: .4byte gTasks
_080D7034:
	cmp r0, 0x2
	bne _080D703A
	b _080D7180
_080D703A:
	b _080D718E
_080D703C:
	ldr r4, _080D707C @ =gAnimBankAttacker
	ldrb r0, [r4]
	bl GetBattlerSide
	lsls r0, 24
	movs r2, 0x1
	negs r2, r2
	adds r1, r2, 0
	cmp r0, 0
	bne _080D7052
	movs r1, 0x1
_080D7052:
	movs r6, 0
	strh r1, [r5, 0xA]
	ldr r0, _080D7080 @ =gBattleAnimArgs
	movs r1, 0
	ldrsh r2, [r0, r1]
	adds r3, r0, 0
	cmp r2, 0
	beq _080D7088
	cmp r2, 0x4
	beq _080D70B0
	ldrh r1, [r3]
	movs r0, 0x1
	ands r0, r1
	cmp r0, 0
	beq _080D70E8
	movs r0, 0x80
	lsls r0, 1
	strh r0, [r5, 0xE]
	ldr r0, _080D7084 @ =0x0000fff0
	b _080D70F0
	.align 2, 0
_080D707C: .4byte gAnimBankAttacker
_080D7080: .4byte gBattleAnimArgs
_080D7084: .4byte 0x0000fff0
_080D7088:
	ldrb r0, [r4]
	movs r1, 0x2
	bl GetBankPosition
	lsls r0, 24
	lsrs r0, 24
	strh r0, [r5, 0xE]
	ldrb r0, [r4]
	movs r1, 0x3
	bl GetBankPosition
	lsls r0, 24
	lsrs r0, 24
	strh r0, [r5, 0x12]
	movs r2, 0xA
	ldrsh r0, [r5, r2]
	lsls r0, 7
	adds r0, 0x78
	strh r0, [r5, 0x10]
	b _080D7126
_080D70B0:
	movs r0, 0xA
	ldrsh r1, [r5, r0]
	lsls r1, 7
	movs r0, 0x78
	subs r0, r1
	strh r0, [r5, 0xE]
	ldr r4, _080D70E4 @ =gAnimBankTarget
	ldrb r0, [r4]
	movs r1, 0x3
	bl GetBankPosition
	lsls r0, 24
	lsrs r0, 24
	strh r0, [r5, 0x12]
	ldrb r0, [r4]
	movs r1, 0x2
	bl GetBankPosition
	lsls r0, 24
	lsrs r0, 24
	movs r2, 0xA
	ldrsh r1, [r5, r2]
	lsls r1, 5
	subs r0, r1
	strh r0, [r5, 0x10]
	b _080D7126
	.align 2, 0
_080D70E4: .4byte gAnimBankTarget
_080D70E8:
	ldr r0, _080D710C @ =0x0000fff0
	strh r0, [r5, 0xE]
	movs r0, 0x80
	lsls r0, 1
_080D70F0:
	strh r0, [r5, 0x10]
	movs r1, 0xA
	ldrsh r0, [r5, r1]
	cmp r0, 0x1
	bne _080D7110
	movs r2, 0
	ldrsh r0, [r3, r2]
	lsls r1, r0, 2
	adds r1, r0
	lsls r1, 1
	movs r0, 0x50
	subs r0, r1
	strh r0, [r5, 0x12]
	b _080D7126
	.align 2, 0
_080D710C: .4byte 0x0000fff0
_080D7110:
	movs r0, 0
	ldrsh r1, [r3, r0]
	lsls r0, r1, 2
	adds r0, r1
	lsls r0, 1
	adds r0, 0x28
	strh r0, [r5, 0x12]
	ldrh r1, [r5, 0xE]
	ldrh r0, [r5, 0x10]
	strh r0, [r5, 0xE]
	strh r1, [r5, 0x10]
_080D7126:
	movs r2, 0xE
	ldrsh r1, [r5, r2]
	movs r2, 0x10
	ldrsh r0, [r5, r2]
	cmp r1, r0
	bge _080D713C
	movs r1, 0
	movs r0, 0x1
	strh r0, [r5, 0xA]
	strh r1, [r5, 0x14]
	b _080D7178
_080D713C:
	ldr r0, _080D7148 @ =0x0000ffff
	strh r0, [r5, 0xA]
	movs r0, 0x3
	strh r0, [r5, 0x14]
	b _080D7178
	.align 2, 0
_080D7148: .4byte 0x0000ffff
_080D714C:
	ldrh r0, [r5, 0xC]
	adds r0, 0x1
	strh r0, [r5, 0xC]
	lsls r0, 16
	cmp r0, 0
	ble _080D718E
	movs r0, 0
	strh r0, [r5, 0xC]
	adds r0, r5, 0
	adds r1, r4, 0
	bl sub_80D7194
	lsls r0, 24
	cmp r0, 0
	bne _080D7178
	adds r0, r5, 0
	adds r1, r4, 0
	bl sub_80D7194
	lsls r0, 24
	cmp r0, 0
	beq _080D718E
_080D7178:
	ldrh r0, [r5, 0x8]
	adds r0, 0x1
	strh r0, [r5, 0x8]
	b _080D718E
_080D7180:
	movs r1, 0x16
	ldrsh r0, [r5, r1]
	cmp r0, 0
	bne _080D718E
	adds r0, r4, 0
	bl DestroyAnimVisualTask
_080D718E:
	pop {r4-r6}
	pop {r0}
	bx r0
	thumb_func_end sub_80D700C

	thumb_func_start sub_80D7194
sub_80D7194: @ 80D7194
	push {r4,r5,lr}
	adds r4, r0, 0
	lsls r1, 24
	lsrs r5, r1, 24
	ldr r0, _080D7220 @ =gSpriteTemplate_83D9B10
	movs r2, 0xE
	ldrsh r1, [r4, r2]
	movs r3, 0x12
	ldrsh r2, [r4, r3]
	movs r3, 0x23
	bl CreateSprite
	lsls r0, 24
	lsrs r2, r0, 24
	cmp r2, 0x40
	beq _080D71CA
	ldr r1, _080D7224 @ =gSprites
	lsls r0, r2, 4
	adds r0, r2
	lsls r0, 2
	adds r0, r1
	strh r5, [r0, 0x3A]
	movs r1, 0x7
	strh r1, [r0, 0x3C]
	ldrh r0, [r4, 0x16]
	adds r0, 0x1
	strh r0, [r4, 0x16]
_080D71CA:
	ldrh r1, [r4, 0xA]
	ldrh r5, [r4, 0x14]
	adds r0, r1, r5
	strh r0, [r4, 0x14]
	lsls r0, 16
	cmp r0, 0
	bge _080D71DC
	movs r0, 0x3
	strh r0, [r4, 0x14]
_080D71DC:
	movs r2, 0x14
	ldrsh r0, [r4, r2]
	cmp r0, 0x3
	ble _080D71E8
	movs r0, 0
	strh r0, [r4, 0x14]
_080D71E8:
	movs r3, 0xA
	ldrsh r0, [r4, r3]
	lsls r0, 4
	ldrh r5, [r4, 0xE]
	adds r2, r0, r5
	strh r2, [r4, 0xE]
	lsls r0, r1, 16
	asrs r3, r0, 16
	cmp r3, 0x1
	bne _080D7208
	lsls r0, r2, 16
	asrs r0, 16
	movs r5, 0x10
	ldrsh r1, [r4, r5]
	cmp r0, r1
	bge _080D721C
_080D7208:
	movs r0, 0x1
	negs r0, r0
	cmp r3, r0
	bne _080D7228
	lsls r0, r2, 16
	asrs r0, 16
	movs r2, 0x10
	ldrsh r1, [r4, r2]
	cmp r0, r1
	bgt _080D7228
_080D721C:
	movs r0, 0x1
	b _080D722A
	.align 2, 0
_080D7220: .4byte gSpriteTemplate_83D9B10
_080D7224: .4byte gSprites
_080D7228:
	movs r0, 0
_080D722A:
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end sub_80D7194

	thumb_func_start sub_80D7230
sub_80D7230: @ 80D7230
	push {r4,lr}
	adds r4, r0, 0
	ldrh r0, [r4, 0x2E]
	adds r0, 0x1
	strh r0, [r4, 0x2E]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0xC
	ble _080D7270
	ldr r3, _080D7278 @ =gTasks
	movs r0, 0x3C
	ldrsh r1, [r4, r0]
	lsls r1, 1
	movs r0, 0x3A
	ldrsh r2, [r4, r0]
	lsls r0, r2, 2
	adds r0, r2
	lsls r0, 3
	adds r1, r0
	adds r3, 0x8
	adds r1, r3
	ldrh r0, [r1]
	subs r0, 0x1
	strh r0, [r1]
	ldrb r0, [r4, 0x3]
	lsls r0, 26
	lsrs r0, 27
	bl FreeOamMatrix
	adds r0, r4, 0
	bl DestroySprite
_080D7270:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080D7278: .4byte gTasks
	thumb_func_end sub_80D7230

	thumb_func_start sub_80D727C
sub_80D727C: @ 80D727C
	push {r4,r5,lr}
	adds r5, r0, 0
	movs r1, 0x2E
	ldrsh r0, [r5, r1]
	cmp r0, 0
	beq _080D728E
	cmp r0, 0x1
	beq _080D72C0
	b _080D72D4
_080D728E:
	ldr r4, _080D72BC @ =gAnimBankAttacker
	ldrb r0, [r4]
	movs r1, 0x2
	bl GetBankPosition
	lsls r0, 24
	lsrs r0, 24
	strh r0, [r5, 0x20]
	ldrb r0, [r4]
	movs r1, 0x3
	bl GetBankPosition
	lsls r0, 24
	lsrs r0, 24
	strh r0, [r5, 0x22]
	adds r0, r5, 0
	movs r1, 0x2
	bl StartSpriteAffineAnim
	ldrh r0, [r5, 0x2E]
	adds r0, 0x1
	strh r0, [r5, 0x2E]
	b _080D72D4
	.align 2, 0
_080D72BC: .4byte gAnimBankAttacker
_080D72C0:
	adds r0, r5, 0
	adds r0, 0x3F
	ldrb r1, [r0]
	movs r0, 0x20
	ands r0, r1
	cmp r0, 0
	beq _080D72D4
	adds r0, r5, 0
	bl move_anim_8074EE0
_080D72D4:
	pop {r4,r5}
	pop {r0}
	bx r0
	thumb_func_end sub_80D727C

	thumb_func_start sub_80D72DC
sub_80D72DC: @ 80D72DC
	push {r4,r5,lr}
	lsls r0, 24
	lsrs r2, r0, 24
	lsls r0, r2, 2
	adds r0, r2
	lsls r0, 3
	ldr r1, _080D7300 @ =gTasks
	adds r5, r0, r1
	movs r1, 0x8
	ldrsh r0, [r5, r1]
	cmp r0, 0x4
	bls _080D72F6
	b _080D7468
_080D72F6:
	lsls r0, 2
	ldr r1, _080D7304 @ =_080D7308
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_080D7300: .4byte gTasks
_080D7304: .4byte _080D7308
	.align 2, 0
_080D7308:
	.4byte _080D731C
	.4byte _080D73AC
	.4byte _080D73E8
	.4byte _080D7444
	.4byte _080D7454
_080D731C:
	ldr r4, _080D73A0 @ =gAnimBankAttacker
	ldrb r0, [r4]
	movs r1, 0x2
	bl GetBankPosition
	lsls r0, 24
	lsrs r0, 24
	strh r0, [r5, 0x14]
	ldrb r0, [r4]
	movs r1, 0x3
	bl GetBankPosition
	lsls r0, 24
	lsrs r0, 24
	strh r0, [r5, 0x16]
	movs r0, 0x4
	strh r0, [r5, 0x18]
	ldr r0, _080D73A4 @ =gAnimBankTarget
	ldrb r0, [r0]
	movs r1, 0x2
	bl GetBankPosition
	lsls r0, 24
	lsrs r0, 24
	strh r0, [r5, 0x1C]
	movs r2, 0x1C
	ldrsh r0, [r5, r2]
	movs r2, 0x14
	ldrsh r1, [r5, r2]
	subs r0, r1
	movs r1, 0x5
	bl __divsi3
	strh r0, [r5, 0x1A]
	movs r0, 0x7
	strh r0, [r5, 0x10]
	ldr r0, _080D73A8 @ =0x0000ffff
	strh r0, [r5, 0x12]
	movs r0, 0xC
	strh r0, [r5, 0x1E]
	subs r0, 0x4C
	bl BattleAnimAdjustPanning
	lsls r0, 24
	asrs r0, 24
	strh r0, [r5, 0x20]
	movs r0, 0x3F
	bl BattleAnimAdjustPanning
	lsls r0, 24
	asrs r0, 24
	strh r0, [r5, 0x22]
	ldrh r0, [r5, 0x20]
	strh r0, [r5, 0x24]
	movs r1, 0x22
	ldrsh r0, [r5, r1]
	movs r2, 0x20
	ldrsh r1, [r5, r2]
	subs r0, r1
	movs r1, 0x3
	bl __divsi3
	strh r0, [r5, 0x26]
	ldrh r0, [r5, 0x8]
	adds r0, 0x1
	b _080D7466
	.align 2, 0
_080D73A0: .4byte gAnimBankAttacker
_080D73A4: .4byte gAnimBankTarget
_080D73A8: .4byte 0x0000ffff
_080D73AC:
	ldrh r0, [r5, 0xA]
	adds r0, 0x1
	strh r0, [r5, 0xA]
	lsls r0, 16
	cmp r0, 0
	ble _080D73DC
	movs r0, 0
	strh r0, [r5, 0xA]
	adds r0, r5, 0
	adds r1, r2, 0
	bl sub_80D7470
	lsls r0, 24
	cmp r0, 0
	beq _080D73DC
	movs r1, 0xC
	ldrsh r0, [r5, r1]
	cmp r0, 0x5
	bne _080D73D6
	movs r0, 0x3
	b _080D73DA
_080D73D6:
	ldrh r0, [r5, 0x8]
	adds r0, 0x1
_080D73DA:
	strh r0, [r5, 0x8]
_080D73DC:
	ldrh r1, [r5, 0x1E]
	movs r2, 0x1E
	ldrsh r0, [r5, r2]
	cmp r0, 0
	beq _080D7468
	b _080D745E
_080D73E8:
	ldrh r1, [r5, 0x1E]
	movs r2, 0x1E
	ldrsh r0, [r5, r2]
	cmp r0, 0
	beq _080D73F6
	subs r0, r1, 0x1
	strh r0, [r5, 0x1E]
_080D73F6:
	ldrh r0, [r5, 0xA]
	adds r0, 0x1
	movs r3, 0
	strh r0, [r5, 0xA]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x4
	ble _080D7468
	strh r3, [r5, 0xA]
	ldrh r1, [r5, 0xC]
	movs r2, 0x1
	adds r0, r2, 0
	ands r0, r1
	cmp r0, 0
	beq _080D7422
	movs r0, 0x4
	strh r0, [r5, 0x16]
	movs r0, 0x44
	strh r0, [r5, 0x18]
	strh r3, [r5, 0x10]
	strh r2, [r5, 0x12]
	b _080D7432
_080D7422:
	movs r0, 0x44
	strh r0, [r5, 0x16]
	movs r0, 0x4
	strh r0, [r5, 0x18]
	movs r0, 0x7
	strh r0, [r5, 0x10]
	ldr r0, _080D7440 @ =0x0000ffff
	strh r0, [r5, 0x12]
_080D7432:
	movs r1, 0x1E
	ldrsh r0, [r5, r1]
	cmp r0, 0
	beq _080D7464
	movs r0, 0x4
	b _080D7466
	.align 2, 0
_080D7440: .4byte 0x0000ffff
_080D7444:
	movs r1, 0xE
	ldrsh r0, [r5, r1]
	cmp r0, 0
	bne _080D7468
	adds r0, r2, 0
	bl DestroyAnimVisualTask
	b _080D7468
_080D7454:
	ldrh r1, [r5, 0x1E]
	movs r2, 0x1E
	ldrsh r0, [r5, r2]
	cmp r0, 0
	beq _080D7464
_080D745E:
	subs r0, r1, 0x1
	strh r0, [r5, 0x1E]
	b _080D7468
_080D7464:
	movs r0, 0x1
_080D7466:
	strh r0, [r5, 0x8]
_080D7468:
	pop {r4,r5}
	pop {r0}
	bx r0
	thumb_func_end sub_80D72DC

	thumb_func_start sub_80D7470
sub_80D7470: @ 80D7470
	push {r4-r6,lr}
	adds r4, r0, 0
	lsls r1, 24
	lsrs r5, r1, 24
	ldr r0, _080D7538 @ =gSpriteTemplate_83D9B40
	movs r2, 0x14
	ldrsh r1, [r4, r2]
	movs r3, 0x16
	ldrsh r2, [r4, r3]
	movs r3, 0x23
	bl CreateSprite
	lsls r0, 24
	lsrs r2, r0, 24
	cmp r2, 0x40
	beq _080D74DC
	ldr r1, _080D753C @ =gSprites
	lsls r0, r2, 4
	adds r0, r2
	lsls r0, 2
	adds r3, r0, r1
	ldrh r2, [r3, 0x4]
	lsls r1, r2, 22
	lsrs r1, 22
	ldrh r6, [r4, 0x10]
	adds r1, r6
	ldr r6, _080D7540 @ =0x000003ff
	adds r0, r6, 0
	ands r1, r0
	ldr r0, _080D7544 @ =0xfffffc00
	ands r0, r2
	orrs r0, r1
	strh r0, [r3, 0x4]
	ldrh r0, [r4, 0x12]
	ldrh r1, [r4, 0x10]
	adds r0, r1
	strh r0, [r4, 0x10]
	lsls r0, 16
	cmp r0, 0
	bge _080D74C4
	movs r0, 0x7
	strh r0, [r4, 0x10]
_080D74C4:
	movs r2, 0x10
	ldrsh r0, [r4, r2]
	cmp r0, 0x7
	ble _080D74D0
	movs r0, 0
	strh r0, [r4, 0x10]
_080D74D0:
	strh r5, [r3, 0x3A]
	movs r0, 0x3
	strh r0, [r3, 0x3C]
	ldrh r0, [r4, 0xE]
	adds r0, 0x1
	strh r0, [r4, 0xE]
_080D74DC:
	movs r3, 0x10
	ldrsh r0, [r4, r3]
	cmp r0, 0
	bne _080D74FE
	movs r5, 0x12
	ldrsh r0, [r4, r5]
	cmp r0, 0
	ble _080D74FE
	ldrh r1, [r4, 0x26]
	ldrh r6, [r4, 0x24]
	adds r1, r6
	strh r1, [r4, 0x24]
	lsls r1, 24
	asrs r1, 24
	movs r0, 0x76
	bl PlaySE12WithPanning
_080D74FE:
	movs r0, 0x12
	ldrsh r3, [r4, r0]
	ldrh r2, [r4, 0x16]
	cmp r3, 0
	bge _080D7514
	lsls r0, r2, 16
	asrs r0, 16
	movs r5, 0x18
	ldrsh r1, [r4, r5]
	cmp r0, r1
	ble _080D7524
_080D7514:
	cmp r3, 0
	ble _080D7548
	lsls r0, r2, 16
	asrs r0, 16
	movs r6, 0x18
	ldrsh r1, [r4, r6]
	cmp r0, r1
	blt _080D7548
_080D7524:
	ldrh r0, [r4, 0xC]
	adds r0, 0x1
	strh r0, [r4, 0xC]
	ldrh r0, [r4, 0x1A]
	ldrh r1, [r4, 0x14]
	adds r0, r1
	strh r0, [r4, 0x14]
	movs r0, 0x1
	b _080D7554
	.align 2, 0
_080D7538: .4byte gSpriteTemplate_83D9B40
_080D753C: .4byte gSprites
_080D7540: .4byte 0x000003ff
_080D7544: .4byte 0xfffffc00
_080D7548:
	movs r3, 0x12
	ldrsh r0, [r4, r3]
	lsls r0, 3
	adds r0, r2, r0
	strh r0, [r4, 0x16]
	movs r0, 0
_080D7554:
	pop {r4-r6}
	pop {r1}
	bx r1
	thumb_func_end sub_80D7470

	thumb_func_start sub_80D755C
sub_80D755C: @ 80D755C
	push {r4,lr}
	adds r4, r0, 0
	ldrh r0, [r4, 0x2E]
	adds r0, 0x1
	strh r0, [r4, 0x2E]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0xC
	ble _080D7592
	ldr r3, _080D7598 @ =gTasks
	movs r0, 0x3C
	ldrsh r1, [r4, r0]
	lsls r1, 1
	movs r0, 0x3A
	ldrsh r2, [r4, r0]
	lsls r0, r2, 2
	adds r0, r2
	lsls r0, 3
	adds r1, r0
	adds r3, 0x8
	adds r1, r3
	ldrh r0, [r1]
	subs r0, 0x1
	strh r0, [r1]
	adds r0, r4, 0
	bl DestroySprite
_080D7592:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080D7598: .4byte gTasks
	thumb_func_end sub_80D755C

	thumb_func_start sub_80D759C
sub_80D759C: @ 80D759C
	push {r4,r5,lr}
	lsls r0, 24
	lsrs r2, r0, 24
	lsls r0, r2, 2
	adds r0, r2
	lsls r0, 3
	ldr r1, _080D75C0 @ =gTasks
	adds r5, r0, r1
	movs r1, 0x8
	ldrsh r0, [r5, r1]
	cmp r0, 0x1
	beq _080D7618
	cmp r0, 0x1
	bgt _080D75C4
	cmp r0, 0
	beq _080D75CA
	b _080D764E
	.align 2, 0
_080D75C0: .4byte gTasks
_080D75C4:
	cmp r0, 0x2
	beq _080D7640
	b _080D764E
_080D75CA:
	ldr r0, _080D7614 @ =gAnimBankTarget
	ldrb r0, [r0]
	movs r1, 0x1
	bl GetBankPosition
	lsls r0, 24
	lsrs r0, 24
	adds r0, 0x20
	strh r0, [r5, 0x26]
	strh r0, [r5, 0x24]
	cmp r0, 0x10
	ble _080D75F4
	adds r2, r0, 0
_080D75E4:
	adds r1, r2, 0
	subs r1, 0x20
	adds r2, r1, 0
	lsls r0, r1, 16
	asrs r0, 16
	cmp r0, 0x10
	bgt _080D75E4
	strh r1, [r5, 0x24]
_080D75F4:
	ldr r4, _080D7614 @ =gAnimBankTarget
	ldrb r0, [r4]
	movs r1, 0x2
	bl GetBankPosition
	lsls r0, 24
	lsrs r0, 24
	strh r0, [r5, 0x22]
	ldrb r0, [r4]
	bl sub_8079E90
	lsls r0, 24
	lsrs r0, 24
	subs r0, 0x2
	strh r0, [r5, 0x20]
	b _080D7638
	.align 2, 0
_080D7614: .4byte gAnimBankTarget
_080D7618:
	ldrh r0, [r5, 0xA]
	adds r0, 0x1
	strh r0, [r5, 0xA]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x1
	ble _080D764E
	movs r0, 0
	strh r0, [r5, 0xA]
	adds r0, r5, 0
	adds r1, r2, 0
	bl sub_80D7654
	lsls r0, 24
	cmp r0, 0
	beq _080D764E
_080D7638:
	ldrh r0, [r5, 0x8]
	adds r0, 0x1
	strh r0, [r5, 0x8]
	b _080D764E
_080D7640:
	movs r1, 0x1C
	ldrsh r0, [r5, r1]
	cmp r0, 0
	bne _080D764E
	adds r0, r2, 0
	bl DestroyAnimVisualTask
_080D764E:
	pop {r4,r5}
	pop {r0}
	bx r0
	thumb_func_end sub_80D759C

	thumb_func_start sub_80D7654
sub_80D7654: @ 80D7654
	push {r4,r5,lr}
	adds r4, r0, 0
	lsls r1, 24
	lsrs r5, r1, 24
	ldr r0, _080D76B0 @ =gBattleAnimSpriteTemplate_83D97D0
	movs r2, 0x22
	ldrsh r1, [r4, r2]
	movs r3, 0x24
	ldrsh r2, [r4, r3]
	ldrh r3, [r4, 0x20]
	lsls r3, 24
	lsrs r3, 24
	bl CreateSprite
	lsls r0, 24
	lsrs r1, r0, 24
	cmp r1, 0x40
	beq _080D7698
	ldr r3, _080D76B4 @ =gSprites
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r1, r3, 0
	adds r1, 0x1C
	adds r1, r0, r1
	ldr r2, _080D76B8 @ =sub_80D76C4
	str r2, [r1]
	adds r0, r3
	strh r5, [r0, 0x3A]
	movs r1, 0xA
	strh r1, [r0, 0x3C]
	ldrh r0, [r4, 0x1C]
	adds r0, 0x1
	strh r0, [r4, 0x1C]
_080D7698:
	ldrh r2, [r4, 0x24]
	movs r0, 0x24
	ldrsh r1, [r4, r0]
	movs r3, 0x26
	ldrsh r0, [r4, r3]
	cmp r1, r0
	bge _080D76BC
	adds r0, r2, 0
	adds r0, 0x20
	strh r0, [r4, 0x24]
	movs r0, 0
	b _080D76BE
	.align 2, 0
_080D76B0: .4byte gBattleAnimSpriteTemplate_83D97D0
_080D76B4: .4byte gSprites
_080D76B8: .4byte sub_80D76C4
_080D76BC:
	movs r0, 0x1
_080D76BE:
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end sub_80D7654
	
	.align 2, 0 @ Don't pad with nop.
