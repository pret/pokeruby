	.include "constants/gba_constants.inc"
	.include "constants/species_constants.inc"
	.include "asm/macros.inc"

	.syntax unified

	.text

	thumb_func_start FldEff_CutGrass
FldEff_CutGrass: @ 80A2698
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	movs r7, 0
	movs r0, 0x80
	bl PlaySE
	ldr r4, _080A2790 @ =gUnknown_0203923C
	adds r1, r4, 0x2
	adds r0, r4, 0
	bl PlayerGetDestCoords
	mov r8, r4
_080A26B2:
	ldr r1, _080A2794 @ =0x0000ffff
	adds r0, r7, r1
	mov r2, r8
	ldrh r2, [r2, 0x2]
	adds r0, r2
	movs r6, 0
	lsls r0, 16
	asrs r5, r0, 16
_080A26C2:
	ldr r1, _080A2794 @ =0x0000ffff
	adds r0, r6, r1
	mov r2, r8
	ldrh r2, [r2]
	adds r0, r2
	lsls r0, 16
	asrs r4, r0, 16
	adds r0, r4, 0
	adds r1, r5, 0
	bl MapGridGetZCoordAt
	lsls r0, 24
	lsrs r0, 24
	mov r2, r8
	movs r1, 0x4
	ldrsb r1, [r2, r1]
	cmp r0, r1
	bne _080A270E
	adds r0, r4, 0
	adds r1, r5, 0
	bl MapGridGetMetatileBehaviorAt
	lsls r0, 24
	lsrs r0, 24
	bl sub_80578F8
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _080A270E
	adds r0, r4, 0
	adds r1, r5, 0
	bl sub_80A27A8
	adds r0, r4, 0
	adds r1, r5, 0
	bl sub_805BCC0
_080A270E:
	adds r0, r6, 0x1
	lsls r0, 24
	lsrs r6, r0, 24
	cmp r6, 0x2
	bls _080A26C2
	adds r0, r7, 0x1
	lsls r0, 24
	lsrs r7, r0, 24
	cmp r7, 0x2
	bls _080A26B2
	ldr r1, _080A2790 @ =gUnknown_0203923C
	ldrh r0, [r1]
	subs r0, 0x1
	lsls r0, 16
	asrs r0, 16
	ldrh r1, [r1, 0x2]
	subs r1, 0x2
	lsls r1, 16
	asrs r1, 16
	bl sub_80A28F4
	bl DrawWholeMapView
	movs r7, 0
	ldr r4, _080A2798 @ =gSprites
_080A2740:
	ldr r0, _080A279C @ =gPlayerAvatar
	ldrb r1, [r0, 0x4]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r4
	ldrh r1, [r0, 0x2]
	lsls r1, 23
	lsrs r1, 7
	movs r2, 0x80
	lsls r2, 12
	adds r1, r2
	asrs r1, 16
	ldrb r2, [r0]
	adds r2, 0x14
	ldr r0, _080A27A0 @ =gSpriteTemplate_CutGrass
	movs r3, 0
	bl CreateSprite
	ldr r1, _080A27A4 @ =0x0201fff0
	adds r1, r7, r1
	strb r0, [r1]
	ldrb r1, [r1]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r4
	lsls r1, r7, 5
	strh r1, [r0, 0x32]
	adds r0, r7, 0x1
	lsls r0, 24
	lsrs r7, r0, 24
	cmp r7, 0x7
	bls _080A2740
	movs r0, 0
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r1}
	bx r1
	.align 2, 0
_080A2790: .4byte gUnknown_0203923C
_080A2794: .4byte 0x0000ffff
_080A2798: .4byte gSprites
_080A279C: .4byte gPlayerAvatar
_080A27A0: .4byte gSpriteTemplate_CutGrass
_080A27A4: .4byte 0x0201fff0
	thumb_func_end FldEff_CutGrass

	thumb_func_start sub_80A27A8
sub_80A27A8: @ 80A27A8
	push {r4-r7,lr}
	lsls r0, 16
	lsls r1, 16
	lsrs r6, r0, 16
	asrs r4, r0, 16
	lsrs r7, r1, 16
	asrs r5, r1, 16
	adds r0, r4, 0
	adds r1, r5, 0
	bl MapGridGetMetatileIdAt
	adds r1, r0, 0
	ldr r0, _080A27E0 @ =0x00000207
	cmp r1, r0
	bgt _080A27F4
	subs r0, 0x1
	cmp r1, r0
	bge _080A286C
	cmp r1, 0x25
	beq _080A288E
	cmp r1, 0x25
	bgt _080A27E4
	cmp r1, 0xD
	beq _080A2834
	cmp r1, 0x15
	beq _080A2834
	b _080A2898
	.align 2, 0
_080A27E0: .4byte 0x00000207
_080A27E4:
	movs r0, 0xE3
	lsls r0, 1
	cmp r1, r0
	beq _080A2844
	adds r0, 0x1
	cmp r1, r0
	beq _080A284A
	b _080A2898
_080A27F4:
	ldr r0, _080A280C @ =0x00000212
	cmp r1, r0
	beq _080A287C
	cmp r1, r0
	bgt _080A2810
	subs r0, 0xA
	cmp r1, r0
	beq _080A2834
	adds r0, 0x2
	cmp r1, r0
	beq _080A287C
	b _080A2898
	.align 2, 0
_080A280C: .4byte 0x00000212
_080A2810:
	ldr r0, _080A2824 @ =0x00000282
	cmp r1, r0
	beq _080A285C
	cmp r1, r0
	bgt _080A2828
	subs r0, 0x1
	cmp r1, r0
	beq _080A2854
	b _080A2898
	.align 2, 0
_080A2824: .4byte 0x00000282
_080A2828:
	ldr r0, _080A2830 @ =0x00000283
	cmp r1, r0
	beq _080A2864
	b _080A2898
	.align 2, 0
_080A2830: .4byte 0x00000283
_080A2834:
	lsls r0, r6, 16
	asrs r0, 16
	lsls r1, r7, 16
	asrs r1, 16
	movs r2, 0x1
	bl MapGridSetMetatileIdAt
	b _080A2898
_080A2844:
	movs r2, 0xE7
	lsls r2, 1
	b _080A286E
_080A284A:
	ldr r2, _080A2850 @ =0x000001cf
	b _080A286E
	.align 2, 0
_080A2850: .4byte 0x000001cf
_080A2854:
	ldr r2, _080A2858 @ =0x00000279
	b _080A286E
	.align 2, 0
_080A2858: .4byte 0x00000279
_080A285C:
	ldr r2, _080A2860 @ =0x0000027a
	b _080A286E
	.align 2, 0
_080A2860: .4byte 0x0000027a
_080A2864:
	ldr r2, _080A2868 @ =0x0000027b
	b _080A286E
	.align 2, 0
_080A2868: .4byte 0x0000027b
_080A286C:
	ldr r2, _080A2878 @ =0x00000271
_080A286E:
	adds r0, r4, 0
	adds r1, r5, 0
	bl MapGridSetMetatileIdAt
	b _080A2898
	.align 2, 0
_080A2878: .4byte 0x00000271
_080A287C:
	lsls r0, r6, 16
	asrs r0, 16
	lsls r1, r7, 16
	asrs r1, 16
	movs r2, 0x86
	lsls r2, 2
	bl MapGridSetMetatileIdAt
	b _080A2898
_080A288E:
	adds r0, r4, 0
	adds r1, r5, 0
	movs r2, 0xE
	bl MapGridSetMetatileIdAt
_080A2898:
	pop {r4-r7}
	pop {r0}
	bx r0
	thumb_func_end sub_80A27A8

	thumb_func_start sub_80A28A0
sub_80A28A0: @ 80A28A0
	push {lr}
	lsls r0, 16
	asrs r0, 16
	lsls r1, 16
	asrs r1, 16
	bl MapGridGetMetatileIdAt
	lsls r0, 16
	lsrs r1, r0, 16
	adds r2, r1, 0
	cmp r1, 0x1
	bne _080A28BC
	movs r0, 0x1
	b _080A28EE
_080A28BC:
	ldr r0, _080A28C8 @ =0x00000279
	cmp r1, r0
	bne _080A28CC
	movs r0, 0x2
	b _080A28EE
	.align 2, 0
_080A28C8: .4byte 0x00000279
_080A28CC:
	ldr r0, _080A28D8 @ =0x0000027a
	cmp r1, r0
	bne _080A28DC
	movs r0, 0x3
	b _080A28EE
	.align 2, 0
_080A28D8: .4byte 0x0000027a
_080A28DC:
	ldr r0, _080A28E8 @ =0x0000027b
	cmp r2, r0
	beq _080A28EC
	movs r0, 0
	b _080A28EE
	.align 2, 0
_080A28E8: .4byte 0x0000027b
_080A28EC:
	movs r0, 0x4
_080A28EE:
	pop {r1}
	bx r1
	thumb_func_end sub_80A28A0

	thumb_func_start sub_80A28F4
sub_80A28F4: @ 80A28F4
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	lsls r0, 16
	lsrs r0, 16
	mov r10, r0
	lsls r1, 16
	movs r2, 0xC0
	lsls r2, 10
	adds r0, r1, r2
	lsrs r0, 16
	mov r9, r0
	movs r4, 0
	asrs r7, r1, 16
_080A2914:
	mov r1, r10
	lsls r0, r1, 16
	asrs r0, 16
	lsls r4, 16
	asrs r1, r4, 16
	adds r0, r1
	lsls r0, 16
	lsrs r6, r0, 16
	asrs r5, r0, 16
	adds r0, r5, 0
	adds r1, r7, 0
	bl MapGridGetMetatileIdAt
	mov r8, r4
	cmp r0, 0x15
	bne _080A2996
	adds r4, r7, 0x1
	lsls r1, r4, 16
	asrs r1, 16
	adds r0, r5, 0
	bl sub_80A28A0
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x2
	beq _080A296A
	cmp r0, 0x2
	bgt _080A2952
	cmp r0, 0x1
	beq _080A295C
	b _080A2996
_080A2952:
	cmp r0, 0x3
	beq _080A297C
	cmp r0, 0x4
	beq _080A298C
	b _080A2996
_080A295C:
	adds r0, r5, 0
	adds r1, r4, 0
	movs r2, 0x82
	lsls r2, 2
	bl MapGridSetMetatileIdAt
	b _080A2996
_080A296A:
	adds r0, r5, 0
	adds r1, r4, 0
	ldr r2, _080A2978 @ =0x00000281
	bl MapGridSetMetatileIdAt
	b _080A2996
	.align 2, 0
_080A2978: .4byte 0x00000281
_080A297C:
	adds r0, r5, 0
	adds r1, r4, 0
	ldr r2, _080A2988 @ =0x00000282
	bl MapGridSetMetatileIdAt
	b _080A2996
	.align 2, 0
_080A2988: .4byte 0x00000282
_080A298C:
	adds r0, r5, 0
	adds r1, r4, 0
	ldr r2, _080A2A30 @ =0x00000283
	bl MapGridSetMetatileIdAt
_080A2996:
	lsls r0, r6, 16
	asrs r5, r0, 16
	mov r2, r9
	lsls r0, r2, 16
	asrs r4, r0, 16
	adds r0, r5, 0
	adds r1, r4, 0
	bl MapGridGetMetatileIdAt
	cmp r0, 0x1
	bne _080A2A10
	adds r4, 0x1
	adds r0, r5, 0
	adds r1, r4, 0
	bl MapGridGetMetatileIdAt
	movs r1, 0x82
	lsls r1, 2
	cmp r0, r1
	bne _080A29C8
	adds r0, r5, 0
	adds r1, r4, 0
	movs r2, 0x1
	bl MapGridSetMetatileIdAt
_080A29C8:
	adds r0, r5, 0
	adds r1, r4, 0
	bl MapGridGetMetatileIdAt
	ldr r1, _080A2A34 @ =0x00000281
	cmp r0, r1
	bne _080A29E0
	adds r0, r5, 0
	adds r1, r4, 0
	ldr r2, _080A2A38 @ =0x00000279
	bl MapGridSetMetatileIdAt
_080A29E0:
	adds r0, r5, 0
	adds r1, r4, 0
	bl MapGridGetMetatileIdAt
	ldr r1, _080A2A3C @ =0x00000282
	cmp r0, r1
	bne _080A29F8
	adds r0, r5, 0
	adds r1, r4, 0
	ldr r2, _080A2A40 @ =0x0000027a
	bl MapGridSetMetatileIdAt
_080A29F8:
	adds r0, r5, 0
	adds r1, r4, 0
	bl MapGridGetMetatileIdAt
	ldr r1, _080A2A30 @ =0x00000283
	cmp r0, r1
	bne _080A2A10
	adds r0, r5, 0
	adds r1, r4, 0
	ldr r2, _080A2A44 @ =0x0000027b
	bl MapGridSetMetatileIdAt
_080A2A10:
	movs r0, 0x80
	lsls r0, 9
	add r0, r8
	lsrs r4, r0, 16
	asrs r0, 16
	cmp r0, 0x2
	bgt _080A2A20
	b _080A2914
_080A2A20:
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080A2A30: .4byte 0x00000283
_080A2A34: .4byte 0x00000281
_080A2A38: .4byte 0x00000279
_080A2A3C: .4byte 0x00000282
_080A2A40: .4byte 0x0000027a
_080A2A44: .4byte 0x0000027b
	thumb_func_end sub_80A28F4

	thumb_func_start sub_80A2A48
sub_80A2A48: @ 80A2A48
	movs r2, 0
	movs r1, 0x8
	strh r1, [r0, 0x2E]
	strh r2, [r0, 0x30]
	strh r2, [r0, 0x34]
	ldr r1, _080A2A58 @ =objc_8097BBC
	str r1, [r0, 0x1C]
	bx lr
	.align 2, 0
_080A2A58: .4byte objc_8097BBC
	thumb_func_end sub_80A2A48

	thumb_func_start objc_8097BBC
objc_8097BBC: @ 80A2A5C
	push {r4,lr}
	adds r4, r0, 0
	movs r1, 0x32
	ldrsh r0, [r4, r1]
	movs r2, 0x2E
	ldrsh r1, [r4, r2]
	bl Sin
	strh r0, [r4, 0x24]
	movs r1, 0x32
	ldrsh r0, [r4, r1]
	movs r2, 0x2E
	ldrsh r1, [r4, r2]
	bl Cos
	strh r0, [r4, 0x26]
	ldrh r0, [r4, 0x32]
	adds r0, 0x8
	movs r1, 0xFF
	ands r0, r1
	strh r0, [r4, 0x32]
	ldrh r1, [r4, 0x2E]
	adds r1, 0x1
	ldrh r2, [r4, 0x34]
	lsls r0, r2, 16
	asrs r0, 18
	adds r1, r0
	strh r1, [r4, 0x2E]
	adds r2, 0x1
	strh r2, [r4, 0x34]
	ldrh r1, [r4, 0x30]
	movs r2, 0x30
	ldrsh r0, [r4, r2]
	cmp r0, 0x1C
	beq _080A2AA8
	adds r0, r1, 0x1
	strh r0, [r4, 0x30]
	b _080A2AAC
_080A2AA8:
	ldr r0, _080A2AB4 @ =sub_80A2AB8
	str r0, [r4, 0x1C]
_080A2AAC:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080A2AB4: .4byte sub_80A2AB8
	thumb_func_end objc_8097BBC

	thumb_func_start sub_80A2AB8
sub_80A2AB8: @ 80A2AB8
	push {r4-r6,lr}
	movs r4, 0x1
_080A2ABC:
	ldr r6, _080A2AF8 @ =0x0201fff0
	adds r0, r4, r6
	ldrb r1, [r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	ldr r5, _080A2AFC @ =gSprites
	adds r0, r5
	bl DestroySprite
	adds r0, r4, 0x1
	lsls r0, 24
	lsrs r4, r0, 24
	cmp r4, 0x7
	bls _080A2ABC
	ldrb r1, [r6]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r5
	movs r1, 0x3A
	bl FieldEffectStop
	bl sub_8064E2C
	bl ScriptContext2_Disable
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_080A2AF8: .4byte 0x0201fff0
_080A2AFC: .4byte gSprites
	thumb_func_end sub_80A2AB8

	thumb_func_start sub_80A2B00
sub_80A2B00: @ 80A2B00
	push {lr}
	movs r0, 0x80
	bl PlaySE
	movs r0, 0x2
	bl FieldEffectActiveListRemove
	bl EnableBothScriptContexts
	pop {r0}
	bx r0
	thumb_func_end sub_80A2B00

	.align 2, 0 @ Don't pad with nop.
