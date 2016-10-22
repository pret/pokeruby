	.include "constants/gba_constants.s"
	.include "constants/species_constants.s"
	.include "asm/macros.s"

	.syntax unified

	.text

	thumb_func_start FldEff_ExclamationMarkIcon1
FldEff_ExclamationMarkIcon1: @ 80847EC
	push {lr}
	ldr r0, _0808481C @ =gSpriteTemplate_839B510
	movs r1, 0
	movs r2, 0
	movs r3, 0x53
	bl CreateSpriteAtEnd
	lsls r0, 24
	lsrs r1, r0, 24
	cmp r1, 0x40
	beq _08084814
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	ldr r1, _08084820 @ =gSprites
	adds r0, r1
	movs r1, 0
	movs r2, 0
	bl sub_8084894
_08084814:
	movs r0, 0
	pop {r1}
	bx r1
	.align 2, 0
_0808481C: .4byte gSpriteTemplate_839B510
_08084820: .4byte gSprites
	thumb_func_end FldEff_ExclamationMarkIcon1

	thumb_func_start FldEff_ExclamationMarkIcon2
FldEff_ExclamationMarkIcon2: @ 8084824
	push {lr}
	ldr r0, _08084854 @ =gSpriteTemplate_839B510
	movs r1, 0
	movs r2, 0
	movs r3, 0x52
	bl CreateSpriteAtEnd
	lsls r0, 24
	lsrs r1, r0, 24
	cmp r1, 0x40
	beq _0808484C
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	ldr r1, _08084858 @ =gSprites
	adds r0, r1
	movs r1, 0x21
	movs r2, 0x1
	bl sub_8084894
_0808484C:
	movs r0, 0
	pop {r1}
	bx r1
	.align 2, 0
_08084854: .4byte gSpriteTemplate_839B510
_08084858: .4byte gSprites
	thumb_func_end FldEff_ExclamationMarkIcon2

	thumb_func_start FldEff_HeartIcon
FldEff_HeartIcon: @ 808485C
	push {lr}
	ldr r0, _0808488C @ =gSpriteTemplate_839B528
	movs r1, 0
	movs r2, 0
	movs r3, 0x52
	bl CreateSpriteAtEnd
	lsls r0, 24
	lsrs r1, r0, 24
	cmp r1, 0x40
	beq _08084884
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	ldr r1, _08084890 @ =gSprites
	adds r0, r1
	movs r1, 0x2E
	movs r2, 0
	bl sub_8084894
_08084884:
	movs r0, 0
	pop {r1}
	bx r1
	.align 2, 0
_0808488C: .4byte gSpriteTemplate_839B528
_08084890: .4byte gSprites
	thumb_func_end FldEff_HeartIcon

	thumb_func_start sub_8084894
sub_8084894: @ 8084894
	push {r4,lr}
	lsls r2, 24
	lsrs r2, 24
	ldrb r4, [r0, 0x5]
	movs r3, 0xD
	negs r3, r3
	ands r3, r4
	movs r4, 0x4
	orrs r3, r4
	strb r3, [r0, 0x5]
	movs r3, 0x3E
	adds r3, r0
	mov r12, r3
	ldrb r3, [r3]
	movs r4, 0x2
	orrs r3, r4
	mov r4, r12
	strb r3, [r4]
	ldr r4, _080848D8 @ =gUnknown_0202FF84
	ldr r3, [r4]
	strh r3, [r0, 0x2E]
	ldr r3, [r4, 0x4]
	strh r3, [r0, 0x30]
	ldr r3, [r4, 0x8]
	strh r3, [r0, 0x32]
	ldr r3, _080848DC @ =0x0000fffb
	strh r3, [r0, 0x34]
	strh r1, [r0, 0x3C]
	adds r1, r2, 0
	bl StartSpriteAnim
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080848D8: .4byte gUnknown_0202FF84
_080848DC: .4byte 0x0000fffb
	thumb_func_end sub_8084894

	thumb_func_start objc_exclamation_mark_probably
objc_exclamation_mark_probably: @ 80848E0
	push {r4,lr}
	sub sp, 0x4
	adds r4, r0, 0
	ldrh r0, [r4, 0x2E]
	lsls r0, 24
	lsrs r0, 24
	ldrh r1, [r4, 0x30]
	lsls r1, 24
	lsrs r1, 24
	ldrh r2, [r4, 0x32]
	lsls r2, 24
	lsrs r2, 24
	mov r3, sp
	bl TryGetFieldObjectIdByLocalIdAndMap
	lsls r0, 24
	cmp r0, 0
	bne _08084912
	adds r0, r4, 0
	adds r0, 0x3F
	ldrb r1, [r0]
	movs r0, 0x10
	ands r0, r1
	cmp r0, 0
	beq _08084920
_08084912:
	ldrh r1, [r4, 0x3C]
	lsls r1, 24
	lsrs r1, 24
	adds r0, r4, 0
	bl FieldEffectStop
	b _0808496E
_08084920:
	ldr r2, _08084964 @ =gMapObjects
	mov r0, sp
	ldrb r1, [r0]
	lsls r0, r1, 3
	adds r0, r1
	lsls r0, 2
	adds r0, r2
	ldrb r0, [r0, 0x4]
	lsls r1, r0, 4
	adds r1, r0
	lsls r1, 2
	ldr r0, _08084968 @ =gSprites
	adds r1, r0
	ldrh r3, [r4, 0x34]
	ldrh r0, [r4, 0x36]
	adds r2, r3, r0
	strh r2, [r4, 0x36]
	ldrh r0, [r1, 0x20]
	strh r0, [r4, 0x20]
	ldrh r0, [r1, 0x22]
	subs r0, 0x10
	strh r0, [r4, 0x22]
	ldrh r0, [r1, 0x24]
	strh r0, [r4, 0x24]
	ldrh r0, [r1, 0x26]
	adds r0, r2
	strh r0, [r4, 0x26]
	lsls r2, 16
	asrs r2, 16
	cmp r2, 0
	beq _0808496C
	adds r0, r3, 0x1
	strh r0, [r4, 0x34]
	b _0808496E
	.align 2, 0
_08084964: .4byte gMapObjects
_08084968: .4byte gSprites
_0808496C:
	strh r2, [r4, 0x34]
_0808496E:
	add sp, 0x4
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end objc_exclamation_mark_probably

	.align 2, 0 @ Don't pad with nop.
