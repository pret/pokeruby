	.include "constants/gba_constants.inc"
	.include "asm/macros.inc"

	.syntax unified

	.text

	thumb_func_start sub_807F434
sub_807F434: @ 807F434
	push {r4,lr}
	ldr r0, _0807F46C @ =gUnknown_08396FC4
	ldr r1, [r0]
	ldr r2, _0807F470 @ =0x000006ed
	adds r0, r1, r2
	ldrb r4, [r0]
	cmp r4, 0x1
	bne _0807F494
	movs r0, 0xDD
	lsls r0, 3
	adds r1, r0
	ldrh r0, [r1]
	cmp r0, 0
	bne _0807F490
	bl IsSEPlaying
	lsls r0, 24
	cmp r0, 0
	bne _0807F494
	bl Random
	ands r4, r0
	cmp r4, 0
	beq _0807F474
	movs r0, 0x57
	bl PlaySE
	b _0807F47A
	.align 2, 0
_0807F46C: .4byte gUnknown_08396FC4
_0807F470: .4byte 0x000006ed
_0807F474:
	movs r0, 0x58
	bl PlaySE
_0807F47A:
	ldr r0, _0807F488 @ =gUnknown_08396FC4
	ldr r0, [r0]
	ldr r1, _0807F48C @ =0x000006ed
	adds r0, r1
	movs r1, 0
	strb r1, [r0]
	b _0807F494
	.align 2, 0
_0807F488: .4byte gUnknown_08396FC4
_0807F48C: .4byte 0x000006ed
_0807F490:
	subs r0, 0x1
	strh r0, [r1]
_0807F494:
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end sub_807F434

	thumb_func_start sub_807F49C
sub_807F49C: @ 807F49C
	push {lr}
	ldr r0, _0807F4E8 @ =gUnknown_08396FC4
	ldr r3, [r0]
	ldr r0, _0807F4EC @ =0x000006cc
	adds r1, r3, r0
	movs r2, 0
	movs r0, 0
	strh r0, [r1]
	ldr r1, _0807F4F0 @ =0x000006d2
	adds r0, r3, r1
	strb r2, [r0]
	subs r1, 0x11
	adds r0, r3, r1
	strb r2, [r0]
	ldr r2, _0807F4F4 @ =0x000006c2
	adds r1, r3, r2
	movs r0, 0x14
	strb r0, [r1]
	ldr r1, _0807F4F8 @ =0x000006fb
	adds r0, r3, r1
	ldrb r1, [r0]
	cmp r1, 0
	bne _0807F4E4
	adds r2, 0x2E
	adds r0, r3, r2
	strh r1, [r0]
	adds r2, 0x2
	adds r0, r3, r2
	strh r1, [r0]
	subs r2, 0x4
	adds r0, r3, r2
	strh r1, [r0]
	movs r0, 0
	movs r1, 0x10
	bl sub_807DB64
_0807F4E4:
	pop {r0}
	bx r0
	.align 2, 0
_0807F4E8: .4byte gUnknown_08396FC4
_0807F4EC: .4byte 0x000006cc
_0807F4F0: .4byte 0x000006d2
_0807F4F4: .4byte 0x000006c2
_0807F4F8: .4byte 0x000006fb
	thumb_func_end sub_807F49C

	thumb_func_start sub_807F4FC
sub_807F4FC: @ 807F4FC
	push {r4,lr}
	bl sub_807F49C
	ldr r0, _0807F524 @ =gUnknown_08396FC4
	ldr r1, [r0]
	ldr r2, _0807F528 @ =0x000006d2
	adds r0, r1, r2
	ldrb r0, [r0]
	cmp r0, 0
	bne _0807F51C
	adds r4, r1, r2
_0807F512:
	bl sub_807F52C
	ldrb r0, [r4]
	cmp r0, 0
	beq _0807F512
_0807F51C:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0807F524: .4byte gUnknown_08396FC4
_0807F528: .4byte 0x000006d2
	thumb_func_end sub_807F4FC

	thumb_func_start sub_807F52C
sub_807F52C: @ 807F52C
	push {r4-r6,lr}
	ldr r0, _0807F578 @ =gUnknown_08396FC4
	ldr r6, [r0]
	ldr r0, _0807F57C @ =gSpriteCoordOffsetX
	ldr r1, _0807F580 @ =0x000006f2
	adds r2, r6, r1
	ldrh r0, [r0]
	ldrh r1, [r2]
	subs r0, r1
	movs r1, 0xFF
	ands r0, r1
	ldr r3, _0807F584 @ =0x000006ee
	adds r1, r6, r3
	strh r0, [r1]
	movs r0, 0xDE
	lsls r0, 3
	adds r1, r6, r0
	ldrh r0, [r1]
	adds r0, 0x1
	strh r0, [r1]
	lsls r0, 16
	lsrs r0, 16
	cmp r0, 0x3
	bls _0807F566
	movs r0, 0
	strh r0, [r1]
	ldrh r0, [r2]
	adds r0, 0x1
	strh r0, [r2]
_0807F566:
	ldr r1, _0807F588 @ =0x000006cc
	adds r5, r6, r1
	ldrh r4, [r5]
	cmp r4, 0
	beq _0807F58C
	cmp r4, 0x1
	beq _0807F5CC
	b _0807F5E2
	.align 2, 0
_0807F578: .4byte gUnknown_08396FC4
_0807F57C: .4byte gSpriteCoordOffsetX
_0807F580: .4byte 0x000006f2
_0807F584: .4byte 0x000006ee
_0807F588: .4byte 0x000006cc
_0807F58C:
	bl sub_807F6E8
	movs r3, 0xDA
	lsls r3, 3
	adds r0, r6, r3
	ldrb r0, [r0]
	cmp r0, 0x6
	bne _0807F5A8
	movs r0, 0xC
	movs r1, 0x8
	movs r2, 0x3
	bl sub_807DBA4
	b _0807F5B2
_0807F5A8:
	movs r0, 0x4
	movs r1, 0x10
	movs r2, 0
	bl sub_807DBA4
_0807F5B2:
	ldr r0, _0807F5C4 @ =gUnknown_08396FC4
	ldr r1, [r0]
	ldr r0, _0807F5C8 @ =0x000006cc
	adds r1, r0
	ldrh r0, [r1]
	adds r0, 0x1
	strh r0, [r1]
	b _0807F5E2
	.align 2, 0
_0807F5C4: .4byte gUnknown_08396FC4
_0807F5C8: .4byte 0x000006cc
_0807F5CC:
	bl sub_807DBE8
	lsls r0, 24
	cmp r0, 0
	beq _0807F5E2
	ldr r1, _0807F5E8 @ =0x000006d2
	adds r0, r6, r1
	strb r4, [r0]
	ldrh r0, [r5]
	adds r0, 0x1
	strh r0, [r5]
_0807F5E2:
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_0807F5E8: .4byte 0x000006d2
	thumb_func_end sub_807F52C

	thumb_func_start sub_807F5EC
sub_807F5EC: @ 807F5EC
	push {r4,lr}
	ldr r0, _0807F63C @ =gUnknown_08396FC4
	ldr r2, [r0]
	ldr r0, _0807F640 @ =gSpriteCoordOffsetX
	ldr r1, _0807F644 @ =0x000006f2
	adds r3, r2, r1
	ldrh r0, [r0]
	ldrh r1, [r3]
	subs r0, r1
	movs r1, 0xFF
	ands r0, r1
	ldr r4, _0807F648 @ =0x000006ee
	adds r1, r2, r4
	strh r0, [r1]
	movs r0, 0xDE
	lsls r0, 3
	adds r1, r2, r0
	ldrh r0, [r1]
	adds r0, 0x1
	strh r0, [r1]
	lsls r0, 16
	lsrs r0, 16
	cmp r0, 0x3
	bls _0807F626
	movs r0, 0
	strh r0, [r1]
	ldrh r0, [r3]
	adds r0, 0x1
	strh r0, [r3]
_0807F626:
	ldr r1, _0807F64C @ =0x000006ce
	adds r4, r2, r1
	ldrh r0, [r4]
	cmp r0, 0x1
	beq _0807F662
	cmp r0, 0x1
	bgt _0807F650
	cmp r0, 0
	beq _0807F656
	b _0807F67A
	.align 2, 0
_0807F63C: .4byte gUnknown_08396FC4
_0807F640: .4byte gSpriteCoordOffsetX
_0807F644: .4byte 0x000006f2
_0807F648: .4byte 0x000006ee
_0807F64C: .4byte 0x000006ce
_0807F650:
	cmp r0, 0x2
	beq _0807F66E
	b _0807F67A
_0807F656:
	movs r0, 0
	movs r1, 0x10
	movs r2, 0x3
	bl sub_807DBA4
	b _0807F672
_0807F662:
	bl sub_807DBE8
	lsls r0, 24
	cmp r0, 0
	beq _0807F67E
	b _0807F672
_0807F66E:
	bl sub_807F7A4
_0807F672:
	ldrh r0, [r4]
	adds r0, 0x1
	strh r0, [r4]
	b _0807F67E
_0807F67A:
	movs r0, 0
	b _0807F680
_0807F67E:
	movs r0, 0x1
_0807F680:
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end sub_807F5EC

	thumb_func_start sub_807F688
sub_807F688: @ 807F688
	push {r4,lr}
	adds r3, r0, 0
	ldr r0, _0807F6D4 @ =gSpriteCoordOffsetY
	ldrb r0, [r0]
	strh r0, [r3, 0x26]
	ldr r0, _0807F6D8 @ =gUnknown_08396FC4
	ldr r0, [r0]
	ldr r1, _0807F6DC @ =0x000006ee
	adds r2, r0, r1
	ldrh r1, [r2]
	adds r1, 0x20
	movs r4, 0x2E
	ldrsh r0, [r3, r4]
	lsls r0, 6
	adds r1, r0
	strh r1, [r3, 0x20]
	lsls r1, 16
	ldr r0, _0807F6E0 @ =0x010f0000
	cmp r1, r0
	ble _0807F6CC
	movs r0, 0xF0
	lsls r0, 1
	adds r1, r0, 0
	ldrh r2, [r2]
	adds r1, r2
	movs r4, 0x2E
	ldrsh r2, [r3, r4]
	movs r0, 0x4
	subs r0, r2
	lsls r0, 6
	subs r1, r0
	ldr r0, _0807F6E4 @ =0x000001ff
	ands r1, r0
	strh r1, [r3, 0x20]
_0807F6CC:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0807F6D4: .4byte gSpriteCoordOffsetY
_0807F6D8: .4byte gUnknown_08396FC4
_0807F6DC: .4byte 0x000006ee
_0807F6E0: .4byte 0x010f0000
_0807F6E4: .4byte 0x000001ff
	thumb_func_end sub_807F688

	thumb_func_start sub_807F6E8
sub_807F6E8: @ 807F6E8
	push {r4,r5,lr}
	sub sp, 0x8
	ldr r0, _0807F75C @ =gUnknown_08396FC4
	ldr r0, [r0]
	ldr r1, _0807F760 @ =0x000006fb
	adds r0, r1
	ldrb r0, [r0]
	cmp r0, 0
	bne _0807F792
	ldr r0, _0807F764 @ =gUnknown_0839ABA8
	ldr r1, [r0, 0x4]
	ldr r0, [r0]
	str r0, [sp]
	str r1, [sp, 0x4]
	mov r0, sp
	bl LoadSpriteSheet
	movs r5, 0
_0807F70C:
	ldr r0, _0807F768 @ =gSpriteTemplate_839AB90
	movs r1, 0
	movs r2, 0
	movs r3, 0xFF
	bl CreateSpriteAtEnd
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x40
	beq _0807F770
	lsls r4, r0, 4
	adds r4, r0
	lsls r4, 2
	ldr r0, _0807F76C @ =gSprites
	adds r4, r0
	adds r0, r5, 0
	movs r1, 0x5
	bl __umodsi3
	strh r0, [r4, 0x2E]
	lsls r0, 16
	lsrs r0, 10
	adds r0, 0x20
	strh r0, [r4, 0x20]
	adds r0, r5, 0
	movs r1, 0x5
	bl __udivsi3
	lsls r0, 16
	lsrs r0, 10
	adds r0, 0x20
	strh r0, [r4, 0x22]
	ldr r2, _0807F75C @ =gUnknown_08396FC4
	ldr r0, [r2]
	lsls r1, r5, 2
	adds r0, 0xA0
	adds r0, r1
	str r4, [r0]
	b _0807F77E
	.align 2, 0
_0807F75C: .4byte gUnknown_08396FC4
_0807F760: .4byte 0x000006fb
_0807F764: .4byte gUnknown_0839ABA8
_0807F768: .4byte gSpriteTemplate_839AB90
_0807F76C: .4byte gSprites
_0807F770:
	ldr r2, _0807F79C @ =gUnknown_08396FC4
	ldr r1, [r2]
	lsls r0, r5, 2
	adds r1, 0xA0
	adds r1, r0
	movs r0, 0
	str r0, [r1]
_0807F77E:
	adds r0, r5, 0x1
	lsls r0, 16
	lsrs r5, r0, 16
	cmp r5, 0x13
	bls _0807F70C
	ldr r0, [r2]
	ldr r1, _0807F7A0 @ =0x000006fb
	adds r0, r1
	movs r1, 0x1
	strb r1, [r0]
_0807F792:
	add sp, 0x8
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_0807F79C: .4byte gUnknown_08396FC4
_0807F7A0: .4byte 0x000006fb
	thumb_func_end sub_807F6E8

	thumb_func_start sub_807F7A4
sub_807F7A4: @ 807F7A4
	push {r4,r5,lr}
	ldr r0, _0807F7EC @ =gUnknown_08396FC4
	ldr r1, [r0]
	ldr r2, _0807F7F0 @ =0x000006fb
	adds r0, r1, r2
	ldrb r0, [r0]
	cmp r0, 0
	beq _0807F7E4
	movs r4, 0
	adds r5, r1, 0
	adds r5, 0xA0
_0807F7BA:
	lsls r0, r4, 2
	adds r0, r5, r0
	ldr r0, [r0]
	cmp r0, 0
	beq _0807F7C8
	bl DestroySprite
_0807F7C8:
	adds r0, r4, 0x1
	lsls r0, 16
	lsrs r4, r0, 16
	cmp r4, 0x13
	bls _0807F7BA
	ldr r0, _0807F7F4 @ =0x00001201
	bl FreeSpriteTilesByTag
	ldr r0, _0807F7EC @ =gUnknown_08396FC4
	ldr r0, [r0]
	ldr r1, _0807F7F0 @ =0x000006fb
	adds r0, r1
	movs r1, 0
	strb r1, [r0]
_0807F7E4:
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_0807F7EC: .4byte gUnknown_08396FC4
_0807F7F0: .4byte 0x000006fb
_0807F7F4: .4byte 0x00001201
	thumb_func_end sub_807F7A4

	thumb_func_start sub_807F7F8
sub_807F7F8: @ 807F7F8
	push {lr}
	ldr r0, _0807F844 @ =gUnknown_08396FC4
	ldr r1, [r0]
	ldr r0, _0807F848 @ =0x000006cc
	adds r2, r1, r0
	movs r3, 0
	movs r0, 0
	strh r0, [r2]
	ldr r2, _0807F84C @ =0x000006d2
	adds r0, r1, r2
	strb r3, [r0]
	subs r2, 0x11
	adds r0, r1, r2
	strb r3, [r0]
	ldr r3, _0807F850 @ =0x000006c2
	adds r0, r1, r3
	movs r2, 0x14
	strb r2, [r0]
	adds r3, 0x3C
	adds r0, r1, r3
	strh r2, [r0]
	movs r0, 0xE0
	lsls r0, 3
	adds r1, r0
	ldrb r0, [r1]
	cmp r0, 0
	bne _0807F840
	movs r0, 0
	movs r1, 0x10
	bl sub_807DB64
	ldr r1, _0807F854 @ =REG_BLDALPHA
	movs r2, 0xFD
	lsls r2, 6
	adds r0, r2, 0
	strh r0, [r1]
_0807F840:
	pop {r0}
	bx r0
	.align 2, 0
_0807F844: .4byte gUnknown_08396FC4
_0807F848: .4byte 0x000006cc
_0807F84C: .4byte 0x000006d2
_0807F850: .4byte 0x000006c2
_0807F854: .4byte REG_BLDALPHA
	thumb_func_end sub_807F7F8

	thumb_func_start sub_807F858
sub_807F858: @ 807F858
	push {r4,lr}
	bl sub_807F7F8
	ldr r0, _0807F880 @ =gUnknown_08396FC4
	ldr r1, [r0]
	ldr r2, _0807F884 @ =0x000006d2
	adds r0, r1, r2
	ldrb r0, [r0]
	cmp r0, 0
	bne _0807F878
	adds r4, r1, r2
_0807F86E:
	bl sub_807F888
	ldrb r0, [r4]
	cmp r0, 0
	beq _0807F86E
_0807F878:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0807F880: .4byte gUnknown_08396FC4
_0807F884: .4byte 0x000006d2
	thumb_func_end sub_807F858

	thumb_func_start sub_807F888
sub_807F888: @ 807F888
	push {r4,r5,lr}
	ldr r2, _0807F8CC @ =gUnknown_08396FC4
	ldr r1, [r2]
	ldr r0, _0807F8D0 @ =gSpriteCoordOffsetX
	ldrh r0, [r0]
	ldr r3, _0807F8D4 @ =0x000001ff
	ands r3, r0
	ldr r0, _0807F8D8 @ =0x000006fc
	adds r1, r0
	strh r3, [r1]
	cmp r3, 0xEF
	bls _0807F8B4
	adds r4, r1, 0
	adds r1, r3, 0
_0807F8A4:
	adds r3, r1, 0
	subs r3, 0xF0
	adds r1, r3, 0
	lsls r0, r3, 16
	lsrs r0, 16
	cmp r0, 0xEF
	bhi _0807F8A4
	strh r3, [r4]
_0807F8B4:
	ldr r5, [r2]
	ldr r1, _0807F8DC @ =0x000006cc
	adds r4, r5, r1
	ldrh r0, [r4]
	cmp r0, 0x1
	beq _0807F8EC
	cmp r0, 0x1
	bgt _0807F8E0
	cmp r0, 0
	beq _0807F8E6
	b _0807F928
	.align 2, 0
_0807F8CC: .4byte gUnknown_08396FC4
_0807F8D0: .4byte gSpriteCoordOffsetX
_0807F8D4: .4byte 0x000001ff
_0807F8D8: .4byte 0x000006fc
_0807F8DC: .4byte 0x000006cc
_0807F8E0:
	cmp r0, 0x2
	beq _0807F908
	b _0807F928
_0807F8E6:
	bl sub_807F99C
	b _0807F91A
_0807F8EC:
	movs r1, 0xE0
	lsls r1, 3
	adds r0, r5, r1
	ldrb r0, [r0]
	cmp r0, 0
	bne _0807F8FC
	bl sub_807F9AC
_0807F8FC:
	movs r0, 0x10
	movs r1, 0
	movs r2, 0x1
	bl sub_807DBA4
	b _0807F91A
_0807F908:
	bl sub_807DBE8
	lsls r0, 24
	cmp r0, 0
	beq _0807F92C
	ldr r0, _0807F924 @ =0x000006d2
	adds r1, r5, r0
	movs r0, 0x1
	strb r0, [r1]
_0807F91A:
	ldrh r0, [r4]
	adds r0, 0x1
	strh r0, [r4]
	b _0807F92C
	.align 2, 0
_0807F924: .4byte 0x000006d2
_0807F928:
	bl sub_807DBE8
_0807F92C:
	pop {r4,r5}
	pop {r0}
	bx r0
	thumb_func_end sub_807F888

	thumb_func_start sub_807F934
sub_807F934: @ 807F934
	push {r4,lr}
	ldr r0, _0807F950 @ =gUnknown_08396FC4
	ldr r0, [r0]
	ldr r1, _0807F954 @ =0x000006ce
	adds r4, r0, r1
	ldrh r0, [r4]
	cmp r0, 0x1
	beq _0807F96A
	cmp r0, 0x1
	bgt _0807F958
	cmp r0, 0
	beq _0807F95E
	b _0807F98C
	.align 2, 0
_0807F950: .4byte gUnknown_08396FC4
_0807F954: .4byte 0x000006ce
_0807F958:
	cmp r0, 0x2
	beq _0807F980
	b _0807F98C
_0807F95E:
	movs r0, 0
	movs r1, 0x10
	movs r2, 0x1
	bl sub_807DBA4
	b _0807F978
_0807F96A:
	bl sub_807DBE8
	lsls r0, 24
	cmp r0, 0
	beq _0807F994
	bl sub_807FA54
_0807F978:
	ldrh r0, [r4]
	adds r0, 0x1
	strh r0, [r4]
	b _0807F994
_0807F980:
	ldr r1, _0807F990 @ =REG_BLDALPHA
	movs r0, 0
	strh r0, [r1]
	ldrh r0, [r4]
	adds r0, 0x1
	strh r0, [r4]
_0807F98C:
	movs r0, 0
	b _0807F996
	.align 2, 0
_0807F990: .4byte REG_BLDALPHA
_0807F994:
	movs r0, 0x1
_0807F996:
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end sub_807F934

	thumb_func_start sub_807F99C
sub_807F99C: @ 807F99C
	push {lr}
	ldr r0, _0807F9A8 @ =gUnknown_0839ABB0
	bl LoadSpriteSheet
	pop {r0}
	bx r0
	.align 2, 0
_0807F9A8: .4byte gUnknown_0839ABB0
	thumb_func_end sub_807F99C

	thumb_func_start sub_807F9AC
sub_807F9AC: @ 807F9AC
	push {r4,r5,lr}
	ldr r0, _0807FA18 @ =gUnknown_08396FC4
	ldr r0, [r0]
	movs r1, 0xE0
	lsls r1, 3
	adds r0, r1
	ldrb r0, [r0]
	cmp r0, 0
	bne _0807FA48
	movs r5, 0
_0807F9C0:
	ldr r0, _0807FA1C @ =gSpriteTemplate_839ABD0
	movs r1, 0
	movs r2, 0
	movs r3, 0x4E
	bl CreateSpriteAtEnd
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x40
	beq _0807FA24
	lsls r4, r0, 4
	adds r4, r0
	lsls r4, 2
	ldr r0, _0807FA20 @ =gSprites
	adds r4, r0
	movs r0, 0
	strh r0, [r4, 0x30]
	adds r0, r5, 0
	movs r1, 0x5
	bl __umodsi3
	lsls r0, 24
	lsrs r0, 24
	strh r0, [r4, 0x32]
	adds r0, r5, 0
	movs r1, 0x5
	bl __udivsi3
	lsls r0, 24
	lsrs r0, 24
	strh r0, [r4, 0x34]
	movs r1, 0x34
	ldrsh r0, [r4, r1]
	lsls r0, 6
	adds r0, 0x20
	strh r0, [r4, 0x2E]
	ldr r2, _0807FA18 @ =gUnknown_08396FC4
	ldr r0, [r2]
	lsls r1, r5, 2
	adds r0, 0xF0
	adds r0, r1
	str r4, [r0]
	b _0807FA32
	.align 2, 0
_0807FA18: .4byte gUnknown_08396FC4
_0807FA1C: .4byte gSpriteTemplate_839ABD0
_0807FA20: .4byte gSprites
_0807FA24:
	ldr r2, _0807FA50 @ =gUnknown_08396FC4
	ldr r1, [r2]
	lsls r0, r5, 2
	adds r1, 0xF0
	adds r1, r0
	movs r0, 0
	str r0, [r1]
_0807FA32:
	adds r0, r5, 0x1
	lsls r0, 24
	lsrs r5, r0, 24
	cmp r5, 0x13
	bls _0807F9C0
	ldr r0, [r2]
	movs r1, 0xE0
	lsls r1, 3
	adds r0, r1
	movs r1, 0x1
	strb r1, [r0]
_0807FA48:
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_0807FA50: .4byte gUnknown_08396FC4
	thumb_func_end sub_807F9AC

	thumb_func_start sub_807FA54
sub_807FA54: @ 807FA54
	push {r4,r5,lr}
	ldr r0, _0807FAA0 @ =gUnknown_08396FC4
	ldr r1, [r0]
	movs r2, 0xE0
	lsls r2, 3
	adds r0, r1, r2
	ldrb r0, [r0]
	cmp r0, 0
	beq _0807FA98
	movs r4, 0
	adds r5, r1, 0
	adds r5, 0xF0
_0807FA6C:
	lsls r0, r4, 2
	adds r0, r5, r0
	ldr r0, [r0]
	cmp r0, 0
	beq _0807FA7A
	bl DestroySprite
_0807FA7A:
	adds r0, r4, 0x1
	lsls r0, 16
	lsrs r4, r0, 16
	cmp r4, 0x13
	bls _0807FA6C
	ldr r0, _0807FAA4 @ =0x00001202
	bl FreeSpriteTilesByTag
	ldr r0, _0807FAA0 @ =gUnknown_08396FC4
	ldr r0, [r0]
	movs r1, 0xE0
	lsls r1, 3
	adds r0, r1
	movs r1, 0
	strb r1, [r0]
_0807FA98:
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_0807FAA0: .4byte gUnknown_08396FC4
_0807FAA4: .4byte 0x00001202
	thumb_func_end sub_807FA54

	thumb_func_start sub_807FAA8
sub_807FAA8: @ 807FAA8
	push {r4,lr}
	adds r3, r0, 0
	ldrh r0, [r3, 0x30]
	adds r0, 0x1
	strh r0, [r3, 0x30]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x5
	ble _0807FAC4
	movs r0, 0
	strh r0, [r3, 0x30]
	ldrh r0, [r3, 0x2E]
	adds r0, 0x1
	strh r0, [r3, 0x2E]
_0807FAC4:
	ldr r1, _0807FB10 @ =gSpriteCoordOffsetY
	ldrh r0, [r3, 0x2E]
	ldrh r1, [r1]
	adds r0, r1
	strh r0, [r3, 0x22]
	ldr r0, _0807FB14 @ =gUnknown_08396FC4
	ldr r0, [r0]
	ldr r1, _0807FB18 @ =0x000006fc
	adds r2, r0, r1
	ldrh r1, [r2]
	adds r1, 0x20
	movs r4, 0x32
	ldrsh r0, [r3, r4]
	lsls r0, 6
	adds r1, r0
	strh r1, [r3, 0x20]
	lsls r1, 16
	ldr r0, _0807FB1C @ =0x010f0000
	cmp r1, r0
	ble _0807FB08
	movs r0, 0xF0
	lsls r0, 1
	adds r1, r0, 0
	ldrh r2, [r2]
	adds r1, r2
	movs r4, 0x32
	ldrsh r2, [r3, r4]
	movs r0, 0x4
	subs r0, r2
	lsls r0, 6
	subs r1, r0
	ldr r0, _0807FB20 @ =0x000001ff
	ands r1, r0
	strh r1, [r3, 0x20]
_0807FB08:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0807FB10: .4byte gSpriteCoordOffsetY
_0807FB14: .4byte gUnknown_08396FC4
_0807FB18: .4byte 0x000006fc
_0807FB1C: .4byte 0x010f0000
_0807FB20: .4byte 0x000001ff
	thumb_func_end sub_807FAA8

	thumb_func_start sub_807FB24
sub_807FB24: @ 807FB24
	push {r4,lr}
	ldr r0, _0807FB94 @ =gUnknown_08396FC4
	ldr r3, [r0]
	ldr r1, _0807FB98 @ =0x000006cc
	adds r0, r3, r1
	movs r1, 0
	movs r2, 0
	strh r2, [r0]
	ldr r4, _0807FB9C @ =0x000006d2
	adds r0, r3, r4
	strb r1, [r0]
	subs r4, 0x11
	adds r0, r3, r4
	strb r1, [r0]
	ldr r0, _0807FBA0 @ =0x000006c2
	adds r1, r3, r0
	movs r0, 0x14
	strb r0, [r1]
	movs r1, 0xDE
	lsls r1, 3
	adds r0, r3, r1
	strh r2, [r0]
	adds r4, 0x31
	adds r1, r3, r4
	movs r0, 0x1
	strh r0, [r1]
	ldr r1, _0807FBA4 @ =0x00000724
	adds r0, r3, r1
	ldrb r2, [r0]
	cmp r2, 0
	bne _0807FB8E
	adds r4, 0x2A
	adds r0, r3, r4
	strh r2, [r0]
	subs r1, 0x6
	adds r0, r3, r1
	strh r2, [r0]
	adds r4, 0x4
	adds r0, r3, r4
	strh r2, [r0]
	adds r1, 0x4
	adds r0, r3, r1
	strh r2, [r0]
	subs r4, 0x8
	adds r0, r3, r4
	strh r2, [r0]
	subs r1, 0x8
	adds r0, r3, r1
	strh r2, [r0]
	movs r0, 0
	movs r1, 0x10
	bl sub_807DB64
_0807FB8E:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0807FB94: .4byte gUnknown_08396FC4
_0807FB98: .4byte 0x000006cc
_0807FB9C: .4byte 0x000006d2
_0807FBA0: .4byte 0x000006c2
_0807FBA4: .4byte 0x00000724
	thumb_func_end sub_807FB24

	thumb_func_start sub_807FBA8
sub_807FBA8: @ 807FBA8
	push {r4,lr}
	bl sub_807FB24
	ldr r0, _0807FBD0 @ =gUnknown_08396FC4
	ldr r1, [r0]
	ldr r2, _0807FBD4 @ =0x000006d2
	adds r0, r1, r2
	ldrb r0, [r0]
	cmp r0, 0
	bne _0807FBC8
	adds r4, r1, r2
_0807FBBE:
	bl sub_807FBD8
	ldrb r0, [r4]
	cmp r0, 0
	beq _0807FBBE
_0807FBC8:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0807FBD0: .4byte gUnknown_08396FC4
_0807FBD4: .4byte 0x000006d2
	thumb_func_end sub_807FBA8

	thumb_func_start sub_807FBD8
sub_807FBD8: @ 807FBD8
	push {r4,r5,lr}
	bl sub_807FC9C
	ldr r0, _0807FBF8 @ =gUnknown_08396FC4
	ldr r5, [r0]
	ldr r0, _0807FBFC @ =0x000006cc
	adds r4, r5, r0
	ldrh r0, [r4]
	cmp r0, 0x1
	beq _0807FC0C
	cmp r0, 0x1
	bgt _0807FC00
	cmp r0, 0
	beq _0807FC06
	b _0807FC30
	.align 2, 0
_0807FBF8: .4byte gUnknown_08396FC4
_0807FBFC: .4byte 0x000006cc
_0807FC00:
	cmp r0, 0x2
	beq _0807FC18
	b _0807FC30
_0807FC06:
	bl sub_807FD30
	b _0807FC2A
_0807FC0C:
	movs r0, 0xC
	movs r1, 0x8
	movs r2, 0x8
	bl sub_807DBA4
	b _0807FC2A
_0807FC18:
	bl sub_807DBE8
	lsls r0, 24
	cmp r0, 0
	beq _0807FC30
	ldr r0, _0807FC38 @ =0x000006d2
	adds r1, r5, r0
	movs r0, 0x1
	strb r0, [r1]
_0807FC2A:
	ldrh r0, [r4]
	adds r0, 0x1
	strh r0, [r4]
_0807FC30:
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_0807FC38: .4byte 0x000006d2
	thumb_func_end sub_807FBD8

	thumb_func_start sub_807FC3C
sub_807FC3C: @ 807FC3C
	push {r4,lr}
	bl sub_807FC9C
	ldr r0, _0807FC5C @ =gUnknown_08396FC4
	ldr r0, [r0]
	ldr r1, _0807FC60 @ =0x000006ce
	adds r4, r0, r1
	ldrh r0, [r4]
	cmp r0, 0x1
	beq _0807FC76
	cmp r0, 0x1
	bgt _0807FC64
	cmp r0, 0
	beq _0807FC6A
	b _0807FC8E
	.align 2, 0
_0807FC5C: .4byte gUnknown_08396FC4
_0807FC60: .4byte 0x000006ce
_0807FC64:
	cmp r0, 0x2
	beq _0807FC82
	b _0807FC8E
_0807FC6A:
	movs r0, 0
	movs r1, 0x10
	movs r2, 0x1
	bl sub_807DBA4
	b _0807FC86
_0807FC76:
	bl sub_807DBE8
	lsls r0, 24
	cmp r0, 0
	beq _0807FC92
	b _0807FC86
_0807FC82:
	bl sub_807FDE8
_0807FC86:
	ldrh r0, [r4]
	adds r0, 0x1
	strh r0, [r4]
	b _0807FC92
_0807FC8E:
	movs r0, 0
	b _0807FC94
_0807FC92:
	movs r0, 0x1
_0807FC94:
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end sub_807FC3C

	thumb_func_start sub_807FC9C
sub_807FC9C: @ 807FC9C
	push {r4,r5,lr}
	ldr r0, _0807FD14 @ =gUnknown_08396FC4
	ldr r3, [r0]
	ldr r0, _0807FD18 @ =0x0000071c
	adds r2, r3, r0
	ldrh r0, [r2]
	adds r0, 0x1
	movs r5, 0
	strh r0, [r2]
	ldr r1, _0807FD1C @ =0x0000ffff
	adds r4, r1, 0
	lsls r0, 16
	lsrs r0, 16
	cmp r0, 0x2
	bls _0807FCC8
	movs r0, 0xE4
	lsls r0, 3
	adds r1, r3, r0
	ldrh r0, [r1]
	adds r0, 0x1
	strh r0, [r1]
	strh r5, [r2]
_0807FCC8:
	ldr r1, _0807FD20 @ =0x0000071e
	adds r2, r3, r1
	ldrh r0, [r2]
	adds r0, 0x1
	strh r0, [r2]
	ands r0, r4
	cmp r0, 0x4
	bls _0807FCE4
	ldr r0, _0807FD24 @ =0x00000722
	adds r1, r3, r0
	ldrh r0, [r1]
	adds r0, 0x1
	strh r0, [r1]
	strh r5, [r2]
_0807FCE4:
	ldr r0, _0807FD28 @ =gSpriteCoordOffsetX
	movs r2, 0xE4
	lsls r2, 3
	adds r1, r3, r2
	ldrh r0, [r0]
	ldrh r1, [r1]
	subs r0, r1
	movs r1, 0xFF
	ands r0, r1
	subs r2, 0x8
	adds r1, r3, r2
	strh r0, [r1]
	ldr r1, _0807FD2C @ =gSpriteCoordOffsetY
	adds r2, 0xA
	adds r0, r3, r2
	ldrh r0, [r0]
	ldrh r1, [r1]
	adds r0, r1
	subs r2, 0x8
	adds r1, r3, r2
	strh r0, [r1]
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_0807FD14: .4byte gUnknown_08396FC4
_0807FD18: .4byte 0x0000071c
_0807FD1C: .4byte 0x0000ffff
_0807FD20: .4byte 0x0000071e
_0807FD24: .4byte 0x00000722
_0807FD28: .4byte gSpriteCoordOffsetX
_0807FD2C: .4byte gSpriteCoordOffsetY
	thumb_func_end sub_807FC9C

	thumb_func_start sub_807FD30
sub_807FD30: @ 807FD30
	push {r4-r6,lr}
	sub sp, 0x8
	ldr r0, _0807FD9C @ =gUnknown_08396FC4
	ldr r0, [r0]
	ldr r1, _0807FDA0 @ =0x00000724
	adds r0, r1
	ldrb r0, [r0]
	cmp r0, 0
	bne _0807FDD6
	ldr r0, _0807FDA4 @ =gUnknown_0839ABE8
	ldr r1, [r0, 0x4]
	ldr r0, [r0]
	str r0, [sp]
	str r1, [sp, 0x4]
	mov r0, sp
	bl LoadSpriteSheet
	movs r6, 0
_0807FD54:
	adds r0, r6, 0
	movs r1, 0x5
	bl __udivsi3
	adds r5, r0, 0
	lsls r2, r5, 22
	asrs r2, 16
	ldr r0, _0807FDA8 @ =gSpriteTemplate_839AC04
	movs r1, 0
	movs r3, 0xFF
	bl CreateSpriteAtEnd
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x40
	beq _0807FDB0
	lsls r4, r0, 4
	adds r4, r0
	lsls r4, 2
	ldr r0, _0807FDAC @ =gSprites
	adds r4, r0
	adds r0, r6, 0
	movs r1, 0x5
	bl __umodsi3
	strh r0, [r4, 0x2E]
	strh r5, [r4, 0x30]
	ldr r2, _0807FD9C @ =gUnknown_08396FC4
	ldr r0, [r2]
	lsls r1, r6, 2
	movs r3, 0xA0
	lsls r3, 1
	adds r0, r3
	adds r0, r1
	str r4, [r0]
	b _0807FDC2
	.align 2, 0
_0807FD9C: .4byte gUnknown_08396FC4
_0807FDA0: .4byte 0x00000724
_0807FDA4: .4byte gUnknown_0839ABE8
_0807FDA8: .4byte gSpriteTemplate_839AC04
_0807FDAC: .4byte gSprites
_0807FDB0:
	ldr r2, _0807FDE0 @ =gUnknown_08396FC4
	ldr r1, [r2]
	lsls r0, r6, 2
	movs r3, 0xA0
	lsls r3, 1
	adds r1, r3
	adds r1, r0
	movs r0, 0
	str r0, [r1]
_0807FDC2:
	adds r0, r6, 0x1
	lsls r0, 16
	lsrs r6, r0, 16
	cmp r6, 0x13
	bls _0807FD54
	ldr r0, [r2]
	ldr r1, _0807FDE4 @ =0x00000724
	adds r0, r1
	movs r1, 0x1
	strb r1, [r0]
_0807FDD6:
	add sp, 0x8
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_0807FDE0: .4byte gUnknown_08396FC4
_0807FDE4: .4byte 0x00000724
	thumb_func_end sub_807FD30

	thumb_func_start sub_807FDE8
sub_807FDE8: @ 807FDE8
	push {r4,r5,lr}
	ldr r0, _0807FE30 @ =gUnknown_08396FC4
	ldr r1, [r0]
	ldr r2, _0807FE34 @ =0x00000724
	adds r0, r1, r2
	ldrb r0, [r0]
	cmp r0, 0
	beq _0807FE2A
	movs r4, 0
	movs r0, 0xA0
	lsls r0, 1
	adds r5, r1, r0
_0807FE00:
	lsls r0, r4, 2
	adds r0, r5, r0
	ldr r0, [r0]
	cmp r0, 0
	beq _0807FE0E
	bl DestroySprite
_0807FE0E:
	adds r0, r4, 0x1
	lsls r0, 16
	lsrs r4, r0, 16
	cmp r4, 0x13
	bls _0807FE00
	ldr r0, _0807FE38 @ =0x00001203
	bl FreeSpriteTilesByTag
	ldr r0, _0807FE30 @ =gUnknown_08396FC4
	ldr r0, [r0]
	ldr r1, _0807FE34 @ =0x00000724
	adds r0, r1
	movs r1, 0
	strb r1, [r0]
_0807FE2A:
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_0807FE30: .4byte gUnknown_08396FC4
_0807FE34: .4byte 0x00000724
_0807FE38: .4byte 0x00001203
	thumb_func_end sub_807FDE8

	thumb_func_start sub_807FE3C
sub_807FE3C: @ 807FE3C
	push {r4,lr}
	adds r3, r0, 0
	ldr r0, _0807FE8C @ =gUnknown_08396FC4
	ldr r1, [r0]
	ldr r2, _0807FE90 @ =0x0000071a
	adds r0, r1, r2
	ldrh r0, [r0]
	strh r0, [r3, 0x26]
	movs r4, 0xE3
	lsls r4, 3
	adds r2, r1, r4
	ldrh r1, [r2]
	adds r1, 0x20
	movs r4, 0x2E
	ldrsh r0, [r3, r4]
	lsls r0, 6
	adds r1, r0
	strh r1, [r3, 0x20]
	lsls r1, 16
	ldr r0, _0807FE94 @ =0x010f0000
	cmp r1, r0
	ble _0807FE84
	movs r0, 0xF0
	lsls r0, 1
	adds r1, r0, 0
	ldrh r2, [r2]
	adds r1, r2
	movs r4, 0x2E
	ldrsh r2, [r3, r4]
	movs r0, 0x4
	subs r0, r2
	lsls r0, 6
	subs r1, r0
	ldr r0, _0807FE98 @ =0x000001ff
	ands r1, r0
	strh r1, [r3, 0x20]
_0807FE84:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0807FE8C: .4byte gUnknown_08396FC4
_0807FE90: .4byte 0x0000071a
_0807FE94: .4byte 0x010f0000
_0807FE98: .4byte 0x000001ff
	thumb_func_end sub_807FE3C

	thumb_func_start sub_807FE9C
sub_807FE9C: @ 807FE9C
	push {r4,lr}
	ldr r0, _0807FF00 @ =gUnknown_08396FC4
	ldr r3, [r0]
	ldr r0, _0807FF04 @ =0x000006cc
	adds r1, r3, r0
	movs r2, 0
	movs r0, 0
	strh r0, [r1]
	ldr r1, _0807FF08 @ =0x000006d2
	adds r0, r3, r1
	strb r2, [r0]
	ldr r4, _0807FF0C @ =0x000006c1
	adds r0, r3, r4
	strb r2, [r0]
	ldr r0, _0807FF10 @ =0x000006c2
	adds r1, r3, r0
	movs r0, 0x14
	strb r0, [r1]
	ldr r1, _0807FF14 @ =0x00000716
	adds r0, r3, r1
	ldrb r2, [r0]
	cmp r2, 0
	bne _0807FEF8
	adds r4, 0x43
	adds r1, r3, r4
	adds r4, 0x4
	adds r0, r3, r4
	str r2, [r0]
	str r2, [r1]
	ldr r0, _0807FF18 @ =0x00000712
	adds r1, r3, r0
	movs r0, 0x8
	strh r0, [r1]
	adds r4, 0xC
	adds r0, r3, r4
	strh r2, [r0]
	ldrh r2, [r1]
	cmp r2, 0x5F
	bls _0807FEF0
	movs r0, 0x80
	subs r0, r2
	strh r0, [r1]
_0807FEF0:
	movs r0, 0
	movs r1, 0x10
	bl sub_807DB64
_0807FEF8:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0807FF00: .4byte gUnknown_08396FC4
_0807FF04: .4byte 0x000006cc
_0807FF08: .4byte 0x000006d2
_0807FF0C: .4byte 0x000006c1
_0807FF10: .4byte 0x000006c2
_0807FF14: .4byte 0x00000716
_0807FF18: .4byte 0x00000712
	thumb_func_end sub_807FE9C

	thumb_func_start sub_807FF1C
sub_807FF1C: @ 807FF1C
	push {r4,lr}
	bl sub_807FE9C
	ldr r0, _0807FF44 @ =gUnknown_08396FC4
	ldr r1, [r0]
	ldr r2, _0807FF48 @ =0x000006d2
	adds r0, r1, r2
	ldrb r0, [r0]
	cmp r0, 0
	bne _0807FF3C
	adds r4, r1, r2
_0807FF32:
	bl sub_807FF4C
	ldrb r0, [r4]
	cmp r0, 0
	beq _0807FF32
_0807FF3C:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0807FF44: .4byte gUnknown_08396FC4
_0807FF48: .4byte 0x000006d2
	thumb_func_end sub_807FF1C

	thumb_func_start sub_807FF4C
sub_807FF4C: @ 807FF4C
	push {r4,r5,lr}
	bl sub_8080064
	bl sub_808002C
	ldr r0, _0807FF7C @ =gUnknown_08396FC4
	ldr r5, [r0]
	ldr r0, _0807FF80 @ =0x00000712
	adds r1, r5, r0
	ldrh r0, [r1]
	cmp r0, 0x5F
	bls _0807FF68
	movs r0, 0x20
	strh r0, [r1]
_0807FF68:
	ldr r0, _0807FF84 @ =0x000006cc
	adds r4, r5, r0
	ldrh r0, [r4]
	cmp r0, 0x1
	beq _0807FF98
	cmp r0, 0x1
	bgt _0807FF88
	cmp r0, 0
	beq _0807FF8E
	b _0807FFBC
	.align 2, 0
_0807FF7C: .4byte gUnknown_08396FC4
_0807FF80: .4byte 0x00000712
_0807FF84: .4byte 0x000006cc
_0807FF88:
	cmp r0, 0x2
	beq _0807FFA4
	b _0807FFBC
_0807FF8E:
	bl sub_8080178
	bl sub_8080238
	b _0807FFB6
_0807FF98:
	movs r0, 0x10
	movs r1, 0
	movs r2, 0
	bl sub_807DBA4
	b _0807FFB6
_0807FFA4:
	bl sub_807DBE8
	lsls r0, 24
	cmp r0, 0
	beq _0807FFBC
	ldr r0, _0807FFC4 @ =0x000006d2
	adds r1, r5, r0
	movs r0, 0x1
	strb r0, [r1]
_0807FFB6:
	ldrh r0, [r4]
	adds r0, 0x1
	strh r0, [r4]
_0807FFBC:
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_0807FFC4: .4byte 0x000006d2
	thumb_func_end sub_807FF4C

	thumb_func_start sub_807FFC8
sub_807FFC8: @ 807FFC8
	push {r4,lr}
	bl sub_8080064
	bl sub_808002C
	ldr r0, _0807FFEC @ =gUnknown_08396FC4
	ldr r0, [r0]
	ldr r1, _0807FFF0 @ =0x000006ce
	adds r4, r0, r1
	ldrh r0, [r4]
	cmp r0, 0x1
	beq _08080006
	cmp r0, 0x1
	bgt _0807FFF4
	cmp r0, 0
	beq _0807FFFA
	b _0808001E
	.align 2, 0
_0807FFEC: .4byte gUnknown_08396FC4
_0807FFF0: .4byte 0x000006ce
_0807FFF4:
	cmp r0, 0x2
	beq _08080012
	b _0808001E
_0807FFFA:
	movs r0, 0
	movs r1, 0x10
	movs r2, 0
	bl sub_807DBA4
	b _08080016
_08080006:
	bl sub_807DBE8
	lsls r0, 24
	cmp r0, 0
	beq _08080022
	b _08080016
_08080012:
	bl sub_80800E4
_08080016:
	ldrh r0, [r4]
	adds r0, 0x1
	strh r0, [r4]
	b _08080022
_0808001E:
	movs r0, 0
	b _08080024
_08080022:
	movs r0, 0x1
_08080024:
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end sub_807FFC8

	thumb_func_start sub_808002C
sub_808002C: @ 808002C
	push {lr}
	ldr r0, _08080058 @ =gUnknown_08396FC4
	ldr r2, [r0]
	ldr r0, _0808005C @ =0x00000714
	adds r3, r2, r0
	ldrh r0, [r3]
	adds r1, r0, 0x1
	strh r1, [r3]
	lsls r0, 16
	lsrs r0, 16
	cmp r0, 0x4
	bls _08080052
	ldr r1, _08080060 @ =0x00000712
	adds r0, r2, r1
	ldrh r1, [r0]
	adds r1, 0x1
	movs r2, 0
	strh r1, [r0]
	strh r2, [r3]
_08080052:
	pop {r0}
	bx r0
	.align 2, 0
_08080058: .4byte gUnknown_08396FC4
_0808005C: .4byte 0x00000714
_08080060: .4byte 0x00000712
	thumb_func_end sub_808002C

	thumb_func_start sub_8080064
sub_8080064: @ 8080064
	push {r4-r6,lr}
	ldr r0, _080800C8 @ =gUnknown_08396FC4
	ldr r2, [r0]
	ldr r0, _080800CC @ =0x00000704
	adds r4, r2, r0
	ldr r6, _080800D0 @ =gSineTable
	ldr r1, _080800D4 @ =0x00000712
	adds r5, r2, r1
	ldrh r0, [r5]
	lsls r0, 1
	adds r0, r6
	movs r3, 0
	ldrsh r1, [r0, r3]
	lsls r1, 2
	ldr r0, [r4]
	subs r0, r1
	str r0, [r4]
	movs r0, 0xE1
	lsls r0, 3
	adds r3, r2, r0
	ldrh r0, [r5]
	lsls r0, 1
	adds r0, r6
	movs r5, 0
	ldrsh r1, [r0, r5]
	ldr r0, [r3]
	subs r0, r1
	str r0, [r3]
	ldr r1, _080800D8 @ =gSpriteCoordOffsetX
	ldr r0, [r4]
	lsrs r0, 8
	ldrh r1, [r1]
	adds r0, r1
	movs r1, 0xFF
	ands r0, r1
	ldr r4, _080800DC @ =0x0000070e
	adds r1, r2, r4
	strh r0, [r1]
	ldr r1, _080800E0 @ =gSpriteCoordOffsetY
	ldr r0, [r3]
	lsrs r0, 8
	ldrh r1, [r1]
	adds r0, r1
	movs r5, 0xE2
	lsls r5, 3
	adds r2, r5
	strh r0, [r2]
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_080800C8: .4byte gUnknown_08396FC4
_080800CC: .4byte 0x00000704
_080800D0: .4byte gSineTable
_080800D4: .4byte 0x00000712
_080800D8: .4byte gSpriteCoordOffsetX
_080800DC: .4byte 0x0000070e
_080800E0: .4byte gSpriteCoordOffsetY
	thumb_func_end sub_8080064

	thumb_func_start sub_80800E4
sub_80800E4: @ 80800E4
	push {r4,r5,lr}
	ldr r0, _08080168 @ =gUnknown_08396FC4
	ldr r1, [r0]
	ldr r2, _0808016C @ =0x00000716
	adds r0, r1, r2
	ldrb r0, [r0]
	cmp r0, 0
	beq _08080126
	movs r4, 0
	movs r0, 0xC8
	lsls r0, 1
	adds r5, r1, r0
_080800FC:
	lsls r0, r4, 2
	adds r0, r5, r0
	ldr r0, [r0]
	cmp r0, 0
	beq _0808010A
	bl DestroySprite
_0808010A:
	adds r0, r4, 0x1
	lsls r0, 16
	lsrs r4, r0, 16
	cmp r4, 0x13
	bls _080800FC
	ldr r0, _08080168 @ =gUnknown_08396FC4
	ldr r0, [r0]
	ldr r1, _0808016C @ =0x00000716
	adds r0, r1
	movs r1, 0
	strb r1, [r0]
	ldr r0, _08080170 @ =0x00001204
	bl FreeSpriteTilesByTag
_08080126:
	ldr r0, _08080168 @ =gUnknown_08396FC4
	ldr r1, [r0]
	ldr r2, _08080174 @ =0x00000717
	adds r0, r1, r2
	ldrb r0, [r0]
	cmp r0, 0
	beq _08080160
	movs r4, 0
	movs r0, 0xF0
	lsls r0, 1
	adds r5, r1, r0
_0808013C:
	lsls r0, r4, 2
	adds r0, r5, r0
	ldr r0, [r0]
	cmp r0, 0
	beq _0808014A
	bl DestroySprite
_0808014A:
	adds r0, r4, 0x1
	lsls r0, 16
	lsrs r4, r0, 16
	cmp r4, 0x4
	bls _0808013C
	ldr r0, _08080168 @ =gUnknown_08396FC4
	ldr r0, [r0]
	ldr r1, _08080174 @ =0x00000717
	adds r0, r1
	movs r1, 0
	strb r1, [r0]
_08080160:
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_08080168: .4byte gUnknown_08396FC4
_0808016C: .4byte 0x00000716
_08080170: .4byte 0x00001204
_08080174: .4byte 0x00000717
	thumb_func_end sub_80800E4

	thumb_func_start sub_8080178
sub_8080178: @ 8080178
	push {r4-r7,lr}
	sub sp, 0x4
	ldr r0, _080801E8 @ =gUnknown_08396FC4
	ldr r0, [r0]
	ldr r1, _080801EC @ =0x00000716
	adds r0, r1
	ldrb r0, [r0]
	cmp r0, 0
	bne _08080226
	ldr r0, _080801F0 @ =gUnknown_0839AC54
	bl LoadSpriteSheet
	ldr r0, _080801F4 @ =gUnknown_08397128
	bl sub_807D8C0
	movs r7, 0
_08080198:
	adds r0, r7, 0
	movs r1, 0x5
	bl __udivsi3
	adds r6, r0, 0
	lsls r2, r6, 22
	asrs r2, 16
	ldr r0, _080801F8 @ =gSpriteTemplate_839AC3C
	movs r1, 0
	movs r3, 0x1
	bl CreateSpriteAtEnd
	lsls r0, 24
	lsrs r1, r0, 24
	cmp r1, 0x40
	beq _08080200
	ldr r2, _080801E8 @ =gUnknown_08396FC4
	ldr r5, [r2]
	lsls r0, r7, 2
	movs r3, 0xC8
	lsls r3, 1
	adds r5, r3
	adds r5, r0
	lsls r4, r1, 4
	adds r4, r1
	lsls r4, 2
	ldr r0, _080801FC @ =gSprites
	adds r4, r0
	str r4, [r5]
	adds r0, r7, 0
	movs r1, 0x5
	str r2, [sp]
	bl __umodsi3
	strh r0, [r4, 0x2E]
	ldr r0, [r5]
	strh r6, [r0, 0x30]
	ldr r2, [sp]
	b _08080212
	.align 2, 0
_080801E8: .4byte gUnknown_08396FC4
_080801EC: .4byte 0x00000716
_080801F0: .4byte gUnknown_0839AC54
_080801F4: .4byte gUnknown_08397128
_080801F8: .4byte gSpriteTemplate_839AC3C
_080801FC: .4byte gSprites
_08080200:
	ldr r2, _08080230 @ =gUnknown_08396FC4
	ldr r1, [r2]
	lsls r0, r7, 2
	movs r3, 0xC8
	lsls r3, 1
	adds r1, r3
	adds r1, r0
	movs r0, 0
	str r0, [r1]
_08080212:
	adds r0, r7, 0x1
	lsls r0, 16
	lsrs r7, r0, 16
	cmp r7, 0x13
	bls _08080198
	ldr r0, [r2]
	ldr r1, _08080234 @ =0x00000716
	adds r0, r1
	movs r1, 0x1
	strb r1, [r0]
_08080226:
	add sp, 0x4
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_08080230: .4byte gUnknown_08396FC4
_08080234: .4byte 0x00000716
	thumb_func_end sub_8080178

	thumb_func_start sub_8080238
sub_8080238: @ 8080238
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	ldr r4, _080802E0 @ =gUnknown_08396FC4
	ldr r0, [r4]
	ldr r1, _080802E4 @ =0x00000717
	adds r0, r1
	ldrb r0, [r0]
	cmp r0, 0
	bne _08080324
	movs r7, 0
	mov r9, r4
	movs r2, 0
	mov r10, r2
_08080258:
	lsls r0, r7, 1
	mov r8, r0
	adds r6, r0, r7
	lsls r5, r6, 4
	adds r1, r5, 0
	adds r1, 0x18
	lsls r1, 16
	asrs r1, 16
	ldr r0, _080802E8 @ =gSpriteTemplate_839AC3C
	movs r2, 0xD0
	movs r3, 0x1
	bl CreateSpriteAtEnd
	lsls r0, 24
	lsrs r1, r0, 24
	cmp r1, 0x40
	beq _080802FC
	mov r2, r9
	ldr r4, [r2]
	lsls r0, r7, 2
	movs r2, 0xF0
	lsls r2, 1
	adds r4, r2
	adds r4, r0
	lsls r2, r1, 4
	adds r2, r1
	lsls r2, 2
	ldr r0, _080802EC @ =gSprites
	adds r2, r0
	str r2, [r4]
	ldrb r1, [r2, 0x3]
	movs r0, 0x3F
	ands r0, r1
	movs r1, 0x80
	orrs r0, r1
	strb r0, [r2, 0x3]
	ldr r1, [r4]
	adds r0, r6, r5
	strh r0, [r1, 0x30]
	ldr r1, [r4]
	movs r0, 0x8
	strh r0, [r1, 0x2E]
	ldr r0, [r4]
	mov r1, r10
	strh r1, [r0, 0x32]
	ldr r1, [r4]
	ldr r0, _080802F0 @ =0x00006730
	strh r0, [r1, 0x36]
	ldr r1, [r4]
	ldr r0, _080802F4 @ =gUnknown_0839AC5C
	add r0, r8
	ldrh r0, [r0]
	strh r0, [r1, 0x34]
	ldr r0, [r4]
	movs r1, 0x1
	bl StartSpriteAnim
	ldr r0, [r4]
	movs r1, 0
	movs r2, 0x2
	movs r3, 0
	bl CalcCenterToCornerVec
	ldr r1, [r4]
	ldr r0, _080802F8 @ =sub_8080398
	str r0, [r1, 0x1C]
	b _0808030E
	.align 2, 0
_080802E0: .4byte gUnknown_08396FC4
_080802E4: .4byte 0x00000717
_080802E8: .4byte gSpriteTemplate_839AC3C
_080802EC: .4byte gSprites
_080802F0: .4byte 0x00006730
_080802F4: .4byte gUnknown_0839AC5C
_080802F8: .4byte sub_8080398
_080802FC:
	mov r2, r9
	ldr r0, [r2]
	lsls r1, r7, 2
	movs r2, 0xF0
	lsls r2, 1
	adds r0, r2
	adds r0, r1
	mov r1, r10
	str r1, [r0]
_0808030E:
	mov r2, r9
	ldr r0, [r2]
	ldr r1, _08080334 @ =0x00000717
	adds r0, r1
	movs r1, 0x1
	strb r1, [r0]
	adds r0, r7, 0x1
	lsls r0, 16
	lsrs r7, r0, 16
	cmp r7, 0x4
	bls _08080258
_08080324:
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_08080334: .4byte 0x00000717
	thumb_func_end sub_8080238

	thumb_func_start sub_8080338
sub_8080338: @ 8080338
	push {r4,lr}
	adds r3, r0, 0
	ldr r0, _08080388 @ =gUnknown_08396FC4
	ldr r1, [r0]
	movs r2, 0xE2
	lsls r2, 3
	adds r0, r1, r2
	ldrh r0, [r0]
	strh r0, [r3, 0x26]
	ldr r4, _0808038C @ =0x0000070e
	adds r2, r1, r4
	ldrh r1, [r2]
	adds r1, 0x20
	movs r4, 0x2E
	ldrsh r0, [r3, r4]
	lsls r0, 6
	adds r1, r0
	strh r1, [r3, 0x20]
	lsls r1, 16
	ldr r0, _08080390 @ =0x010f0000
	cmp r1, r0
	ble _08080380
	movs r0, 0xF0
	lsls r0, 1
	adds r1, r0, 0
	ldrh r2, [r2]
	adds r1, r2
	movs r4, 0x2E
	ldrsh r2, [r3, r4]
	movs r0, 0x4
	subs r0, r2
	lsls r0, 6
	subs r1, r0
	ldr r0, _08080394 @ =0x000001ff
	ands r1, r0
	strh r1, [r3, 0x20]
_08080380:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08080388: .4byte gUnknown_08396FC4
_0808038C: .4byte 0x0000070e
_08080390: .4byte 0x010f0000
_08080394: .4byte 0x000001ff
	thumb_func_end sub_8080338

	thumb_func_start sub_8080398
sub_8080398: @ 8080398
	push {lr}
	adds r2, r0, 0
	ldrh r0, [r2, 0x34]
	subs r0, 0x1
	strh r0, [r2, 0x34]
	lsls r0, 16
	asrs r0, 16
	movs r1, 0x1
	negs r1, r1
	cmp r0, r1
	bne _080803B2
	ldr r0, _080803B8 @ =sub_80803BC
	str r0, [r2, 0x1C]
_080803B2:
	pop {r0}
	bx r0
	.align 2, 0
_080803B8: .4byte sub_80803BC
	thumb_func_end sub_8080398

	thumb_func_start sub_80803BC
sub_80803BC: @ 80803BC
	push {r4,r5,lr}
	adds r5, r0, 0
	ldrh r0, [r5, 0x22]
	subs r0, 0x1
	strh r0, [r5, 0x22]
	lsls r0, 16
	asrs r0, 16
	movs r1, 0x30
	negs r1, r1
	cmp r0, r1
	bge _080803DA
	movs r0, 0xD0
	strh r0, [r5, 0x22]
	movs r0, 0x4
	strh r0, [r5, 0x2E]
_080803DA:
	movs r0, 0x2E
	ldrsh r4, [r5, r0]
	ldr r3, _0808042C @ =gSineTable
	movs r2, 0x30
	ldrsh r1, [r5, r2]
	lsls r0, r1, 1
	adds r0, r3
	movs r2, 0
	ldrsh r0, [r0, r2]
	adds r2, r4, 0
	muls r2, r0
	adds r1, 0x40
	lsls r1, 1
	adds r1, r3
	movs r3, 0
	ldrsh r0, [r1, r3]
	muls r0, r4
	lsrs r2, 8
	strh r2, [r5, 0x24]
	lsrs r0, 8
	strh r0, [r5, 0x26]
	ldrh r0, [r5, 0x30]
	adds r0, 0xA
	movs r1, 0xFF
	ands r0, r1
	strh r0, [r5, 0x30]
	ldrh r0, [r5, 0x32]
	adds r0, 0x1
	strh r0, [r5, 0x32]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x8
	ble _08080426
	movs r0, 0
	strh r0, [r5, 0x32]
	ldrh r0, [r5, 0x2E]
	adds r0, 0x1
	strh r0, [r5, 0x2E]
_08080426:
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_0808042C: .4byte gSineTable
	thumb_func_end sub_80803BC

	thumb_func_start sub_8080430
sub_8080430: @ 8080430
	ldr r0, _08080450 @ =gUnknown_08396FC4
	ldr r1, [r0]
	ldr r0, _08080454 @ =0x000006cc
	adds r2, r1, r0
	movs r0, 0
	strh r0, [r2]
	ldr r0, _08080458 @ =0x000006c1
	adds r2, r1, r0
	movs r0, 0x3
	strb r0, [r2]
	ldr r0, _0808045C @ =0x000006c2
	adds r1, r0
	movs r0, 0x14
	strb r0, [r1]
	bx lr
	.align 2, 0
_08080450: .4byte gUnknown_08396FC4
_08080454: .4byte 0x000006cc
_08080458: .4byte 0x000006c1
_0808045C: .4byte 0x000006c2
	thumb_func_end sub_8080430

	thumb_func_start sub_8080460
sub_8080460: @ 8080460
	push {lr}
	bl sub_8080430
	pop {r0}
	bx r0
	thumb_func_end sub_8080460

	thumb_func_start nullsub_56
nullsub_56: @ 808046C
	bx lr
	thumb_func_end nullsub_56

	thumb_func_start sub_8080470
sub_8080470: @ 8080470
	movs r0, 0
	bx lr
	thumb_func_end sub_8080470

	thumb_func_start sub_8080474
sub_8080474: @ 8080474
	push {r4,r5,lr}
	bl sub_807F49C
	ldr r0, _080804B4 @ =gUnknown_08396FC4
	ldr r4, [r0]
	ldr r1, _080804B8 @ =0x0000072e
	adds r0, r4, r1
	ldrb r5, [r0]
	cmp r5, 0
	bne _080804AC
	ldr r0, _080804BC @ =gUnknown_0839AC70
	bl LoadSpriteSheet
	movs r2, 0xE5
	lsls r2, 3
	adds r0, r4, r2
	strh r5, [r0]
	ldr r0, _080804C0 @ =gUnknown_0839AC68
	ldrb r1, [r0]
	subs r2, 0x2
	adds r0, r4, r2
	strh r1, [r0]
	ldr r1, _080804C4 @ =0x0000072a
	adds r0, r4, r1
	strh r5, [r0]
	adds r2, 0x6
	adds r0, r4, r2
	strh r5, [r0]
_080804AC:
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080804B4: .4byte gUnknown_08396FC4
_080804B8: .4byte 0x0000072e
_080804BC: .4byte gUnknown_0839AC70
_080804C0: .4byte gUnknown_0839AC68
_080804C4: .4byte 0x0000072a
	thumb_func_end sub_8080474

	thumb_func_start sub_80804C8
sub_80804C8: @ 80804C8
	push {r4,lr}
	bl sub_8080474
	ldr r0, _080804F0 @ =gUnknown_08396FC4
	ldr r1, [r0]
	ldr r2, _080804F4 @ =0x000006d2
	adds r0, r1, r2
	ldrb r0, [r0]
	cmp r0, 0
	bne _080804E8
	adds r4, r1, r2
_080804DE:
	bl sub_80804F8
	ldrb r0, [r4]
	cmp r0, 0
	beq _080804DE
_080804E8:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080804F0: .4byte gUnknown_08396FC4
_080804F4: .4byte 0x000006d2
	thumb_func_end sub_80804C8

	thumb_func_start sub_80804F8
sub_80804F8: @ 80804F8
	push {r4-r7,lr}
	bl sub_807F52C
	ldr r0, _08080558 @ =gUnknown_08396FC4
	ldr r5, [r0]
	ldr r0, _0808055C @ =0x00000726
	adds r4, r5, r0
	ldrh r0, [r4]
	adds r0, 0x1
	movs r6, 0
	strh r0, [r4]
	ldr r1, _08080560 @ =0x0000ffff
	adds r7, r1, 0
	ldr r2, _08080564 @ =gUnknown_0839AC68
	movs r1, 0xE5
	lsls r1, 3
	adds r3, r5, r1
	ldrh r1, [r3]
	adds r1, r2
	lsls r0, 16
	lsrs r0, 16
	ldrb r1, [r1]
	cmp r0, r1
	bls _08080550
	strh r6, [r4]
	ldrh r0, [r3]
	adds r0, 0x1
	strh r0, [r3]
	ands r0, r7
	cmp r0, 0x7
	bls _08080538
	strh r6, [r3]
_08080538:
	ldr r0, _08080568 @ =0x0000072a
	adds r4, r5, r0
	ldrh r0, [r4]
	bl sub_8080588
	ldrh r0, [r4]
	adds r0, 0x1
	strh r0, [r4]
	ands r0, r7
	cmp r0, 0xC
	bls _08080550
	strh r6, [r4]
_08080550:
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_08080558: .4byte gUnknown_08396FC4
_0808055C: .4byte 0x00000726
_08080560: .4byte 0x0000ffff
_08080564: .4byte gUnknown_0839AC68
_08080568: .4byte 0x0000072a
	thumb_func_end sub_80804F8

	thumb_func_start sub_808056C
sub_808056C: @ 808056C
	push {lr}
	bl sub_807F5EC
	lsls r0, 24
	cmp r0, 0
	beq _0808057C
	movs r0, 0x1
	b _08080582
_0808057C:
	bl sub_8080610
	movs r0, 0
_08080582:
	pop {r1}
	bx r1
	thumb_func_end sub_808056C

	thumb_func_start sub_8080588
sub_8080588: @ 8080588
	push {r4,lr}
	lsls r0, 16
	ldr r1, _080805F8 @ =gUnknown_0839AC78
	lsrs r0, 14
	adds r3, r0, r1
	adds r1, 0x2
	adds r0, r1
	ldr r1, _080805FC @ =gSpriteCoordOffsetY
	ldrh r2, [r0]
	ldrh r0, [r1]
	subs r2, r0
	ldr r0, _08080600 @ =gSpriteTemplate_839ACBC
	movs r4, 0
	ldrsh r1, [r3, r4]
	lsls r2, 16
	asrs r2, 16
	movs r3, 0
	bl CreateSpriteAtEnd
	lsls r0, 24
	lsrs r2, r0, 24
	cmp r2, 0x40
	beq _080805F0
	ldr r0, _08080604 @ =gSprites
	lsls r1, r2, 4
	adds r1, r2
	lsls r1, 2
	adds r1, r0
	ldrb r2, [r1, 0x5]
	movs r0, 0xD
	negs r0, r0
	ands r0, r2
	movs r2, 0x4
	orrs r0, r2
	strb r0, [r1, 0x5]
	adds r3, r1, 0
	adds r3, 0x3E
	ldrb r0, [r3]
	movs r2, 0x2
	orrs r0, r2
	strb r0, [r3]
	movs r0, 0
	strh r0, [r1, 0x2E]
	strh r0, [r1, 0x30]
	strh r0, [r1, 0x32]
	ldr r0, _08080608 @ =gUnknown_08396FC4
	ldr r1, [r0]
	ldr r0, _0808060C @ =0x0000072c
	adds r1, r0
	ldrh r0, [r1]
	adds r0, 0x1
	strh r0, [r1]
_080805F0:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080805F8: .4byte gUnknown_0839AC78
_080805FC: .4byte gSpriteCoordOffsetY
_08080600: .4byte gSpriteTemplate_839ACBC
_08080604: .4byte gSprites
_08080608: .4byte gUnknown_08396FC4
_0808060C: .4byte 0x0000072c
	thumb_func_end sub_8080588

	thumb_func_start sub_8080610
sub_8080610: @ 8080610
	push {r4,r5,lr}
	movs r4, 0
	ldr r5, _08080648 @ =gSprites
_08080616:
	lsls r0, r4, 4
	adds r0, r4
	lsls r2, r0, 2
	adds r0, r5, 0
	adds r0, 0x14
	adds r0, r2, r0
	ldr r1, [r0]
	ldr r0, _0808064C @ =gSpriteTemplate_839ACBC
	cmp r1, r0
	bne _08080630
	adds r0, r2, r5
	bl DestroySprite
_08080630:
	adds r0, r4, 0x1
	lsls r0, 16
	lsrs r4, r0, 16
	cmp r4, 0x3F
	bls _08080616
	ldr r0, _08080650 @ =0x00001205
	bl FreeSpriteTilesByTag
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_08080648: .4byte gSprites
_0808064C: .4byte gSpriteTemplate_839ACBC
_08080650: .4byte 0x00001205
	thumb_func_end sub_8080610

	thumb_func_start unc_0807DAB4
unc_0807DAB4: @ 8080654
	push {lr}
	adds r1, r0, 0
	ldrh r0, [r1, 0x2E]
	movs r2, 0
	adds r0, 0x2
	strh r0, [r1, 0x2E]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x8
	ble _08080694
	strh r2, [r1, 0x2E]
	movs r3, 0x30
	ldrsh r0, [r1, r3]
	cmp r0, 0
	bne _08080686
	ldrh r0, [r1, 0x24]
	adds r0, 0x1
	strh r0, [r1, 0x24]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x4
	ble _08080694
	movs r0, 0x1
	strh r0, [r1, 0x30]
	b _08080694
_08080686:
	ldrh r0, [r1, 0x24]
	subs r0, 0x1
	strh r0, [r1, 0x24]
	lsls r0, 16
	cmp r0, 0
	bgt _08080694
	strh r2, [r1, 0x30]
_08080694:
	ldrh r0, [r1, 0x22]
	subs r0, 0x3
	strh r0, [r1, 0x22]
	ldrh r0, [r1, 0x32]
	adds r0, 0x1
	strh r0, [r1, 0x32]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x77
	ble _080806AE
	adds r0, r1, 0
	bl DestroySprite
_080806AE:
	pop {r0}
	bx r0
	thumb_func_end unc_0807DAB4

	thumb_func_start SetSav1Weather
SetSav1Weather: @ 80806B4
	push {r4,r5,lr}
	ldr r4, _080806D4 @ =gSaveBlock1
	adds r4, 0x2E
	ldrb r5, [r4]
	lsls r0, 24
	lsrs r0, 24
	bl TranslateWeatherNum
	strb r0, [r4]
	ldrb r0, [r4]
	adds r1, r5, 0
	bl UpdateRainCounter
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080806D4: .4byte gSaveBlock1
	thumb_func_end SetSav1Weather

	thumb_func_start GetSav1Weather
GetSav1Weather: @ 80806D8
	ldr r0, _080806E0 @ =gSaveBlock1
	adds r0, 0x2E
	ldrb r0, [r0]
	bx lr
	.align 2, 0
_080806E0: .4byte gSaveBlock1
	thumb_func_end GetSav1Weather

	thumb_func_start sub_80806E4
sub_80806E4: @ 80806E4
	push {r4,r5,lr}
	ldr r4, _08080704 @ =gSaveBlock1
	adds r4, 0x2E
	ldrb r5, [r4]
	ldr r0, _08080708 @ =gMapHeader
	ldrb r0, [r0, 0x16]
	bl TranslateWeatherNum
	strb r0, [r4]
	ldrb r0, [r4]
	adds r1, r5, 0
	bl UpdateRainCounter
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_08080704: .4byte gSaveBlock1
_08080708: .4byte gMapHeader
	thumb_func_end sub_80806E4

	thumb_func_start SetWeather
SetWeather: @ 808070C
	push {lr}
	bl SetSav1Weather
	bl GetSav1Weather
	lsls r0, 24
	lsrs r0, 24
	bl DoWeatherEffect
	pop {r0}
	bx r0
	thumb_func_end SetWeather

	thumb_func_start SetWeather_Unused
SetWeather_Unused: @ 8080724
	push {lr}
	bl SetSav1Weather
	bl GetSav1Weather
	lsls r0, 24
	lsrs r0, 24
	bl sub_807C988
	pop {r0}
	bx r0
	thumb_func_end SetWeather_Unused

	thumb_func_start DoCurrentWeather
DoCurrentWeather: @ 808073C
	push {lr}
	bl GetSav1Weather
	lsls r0, 24
	lsrs r0, 24
	bl DoWeatherEffect
	pop {r0}
	bx r0
	thumb_func_end DoCurrentWeather

	thumb_func_start sub_8080750
sub_8080750: @ 8080750
	push {lr}
	bl GetSav1Weather
	lsls r0, 24
	lsrs r0, 24
	bl sub_807C988
	pop {r0}
	bx r0
	thumb_func_end sub_8080750

	thumb_func_start TranslateWeatherNum
TranslateWeatherNum: @ 8080764
	push {lr}
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x15
	bhi _0808082C
	lsls r0, 2
	ldr r1, _08080778 @ =_0808077C
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_08080778: .4byte _0808077C
	.align 2, 0
_0808077C:
	.4byte _0808082C
	.4byte _080807D4
	.4byte _080807D8
	.4byte _080807DC
	.4byte _080807E0
	.4byte _080807E4
	.4byte _080807E8
	.4byte _080807EC
	.4byte _080807F0
	.4byte _080807F4
	.4byte _080807F8
	.4byte _080807FC
	.4byte _08080800
	.4byte _08080804
	.4byte _08080808
	.4byte _0808082C
	.4byte _0808082C
	.4byte _0808082C
	.4byte _0808082C
	.4byte _0808082C
	.4byte _0808080C
	.4byte _08080814
_080807D4:
	movs r0, 0x1
	b _0808082E
_080807D8:
	movs r0, 0x2
	b _0808082E
_080807DC:
	movs r0, 0x3
	b _0808082E
_080807E0:
	movs r0, 0x4
	b _0808082E
_080807E4:
	movs r0, 0x5
	b _0808082E
_080807E8:
	movs r0, 0x6
	b _0808082E
_080807EC:
	movs r0, 0x7
	b _0808082E
_080807F0:
	movs r0, 0x8
	b _0808082E
_080807F4:
	movs r0, 0x9
	b _0808082E
_080807F8:
	movs r0, 0xA
	b _0808082E
_080807FC:
	movs r0, 0xB
	b _0808082E
_08080800:
	movs r0, 0xC
	b _0808082E
_08080804:
	movs r0, 0xD
	b _0808082E
_08080808:
	movs r0, 0xE
	b _0808082E
_0808080C:
	ldr r1, _08080810 @ =gUnknown_0839ACD4
	b _08080816
	.align 2, 0
_08080810: .4byte gUnknown_0839ACD4
_08080814:
	ldr r1, _08080824 @ =gUnknown_0839ACD8
_08080816:
	ldr r0, _08080828 @ =gSaveBlock1
	adds r0, 0x2F
	ldrb r0, [r0]
	adds r0, r1
	ldrb r0, [r0]
	b _0808082E
	.align 2, 0
_08080824: .4byte gUnknown_0839ACD8
_08080828: .4byte gSaveBlock1
_0808082C:
	movs r0, 0
_0808082E:
	pop {r1}
	bx r1
	thumb_func_end TranslateWeatherNum

	thumb_func_start UpdateWeatherPerDay
UpdateWeatherPerDay: @ 8080834
	lsls r0, 16
	ldr r2, _08080850 @ =gSaveBlock1
	adds r2, 0x2F
	lsrs r0, 16
	ldrb r1, [r2]
	adds r0, r1
	lsls r0, 16
	movs r1, 0xC0
	lsls r1, 10
	ands r1, r0
	lsrs r1, 16
	strb r1, [r2]
	bx lr
	.align 2, 0
_08080850: .4byte gSaveBlock1
	thumb_func_end UpdateWeatherPerDay

	thumb_func_start UpdateRainCounter
UpdateRainCounter: @ 8080854
	push {lr}
	lsls r0, 24
	lsls r1, 24
	lsrs r2, r0, 24
	cmp r0, r1
	beq _0808086E
	cmp r2, 0x3
	beq _08080868
	cmp r2, 0x5
	bne _0808086E
_08080868:
	movs r0, 0x28
	bl IncrementGameStat
_0808086E:
	pop {r0}
	bx r0
	thumb_func_end UpdateRainCounter

	.align 2, 0 @ Don't pad with nop.
