	.include "constants/gba_constants.inc"
	.include "constants/species_constants.inc"
	.include "asm/macros.inc"

	.syntax unified

	.text

	thumb_func_start sub_8123F44
sub_8123F44: @ 8123F44
	push {lr}
	adds r2, r0, 0
	movs r1, 0x2E
	ldrsh r0, [r2, r1]
	cmp r0, 0
	bne _08123F62
	ldrh r1, [r2, 0x22]
	adds r1, 0x10
	adds r0, r2, 0
	adds r0, 0x29
	ldrb r0, [r0]
	lsls r0, 24
	asrs r0, 24
	adds r0, r1
	strh r0, [r2, 0x22]
_08123F62:
	ldrh r0, [r2, 0x2E]
	adds r0, 0x1
	strh r0, [r2, 0x2E]
	lsls r0, 16
	asrs r0, 16
	movs r3, 0x32
	ldrsh r1, [r2, r3]
	cmp r0, r1
	blt _08123FB8
	movs r0, 0x30
	ldrsh r1, [r2, r0]
	cmp r1, 0
	beq _08123F82
	cmp r1, 0x1
	beq _08123F8C
	b _08123FAA
_08123F82:
	ldrh r0, [r2, 0x20]
	subs r0, 0x1
	strh r0, [r2, 0x20]
	ldrh r0, [r2, 0x2E]
	b _08123F9C
_08123F8C:
	ldrh r0, [r2, 0x2E]
	ands r0, r1
	cmp r0, 0
	beq _08123FAA
	ldrh r0, [r2, 0x20]
	subs r0, 0x1
	strh r0, [r2, 0x20]
	ldrh r0, [r2, 0x20]
_08123F9C:
	movs r1, 0x3
	ands r0, r1
	cmp r0, 0
	bne _08123FAA
	ldrh r0, [r2, 0x22]
	subs r0, 0x1
	strh r0, [r2, 0x22]
_08123FAA:
	movs r1, 0x22
	ldrsh r0, [r2, r1]
	cmp r0, 0x4F
	bgt _08123FB8
	adds r0, r2, 0
	bl DestroySprite
_08123FB8:
	pop {r0}
	bx r0
	thumb_func_end sub_8123F44

	thumb_func_start sub_8123FBC
sub_8123FBC: @ 8123FBC
	push {lr}
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0
	beq _08123FCA
	cmp r0, 0x1
	beq _08124024
_08123FCA:
	ldr r1, _08124020 @ =REG_WININ
	movs r0, 0
	strh r0, [r1]
	adds r1, 0x2
	strh r0, [r1]
	subs r1, 0xA
	strh r0, [r1]
	adds r1, 0x2
	strh r0, [r1]
	adds r1, 0x2
	strh r0, [r1]
	adds r1, 0x2
	strh r0, [r1]
	subs r1, 0x46
	strh r0, [r1]
	adds r1, 0xE
	strh r0, [r1]
	subs r1, 0x2
	strh r0, [r1]
	subs r1, 0x2
	strh r0, [r1]
	subs r1, 0x2
	strh r0, [r1]
	adds r1, 0x14
	strh r0, [r1]
	adds r1, 0x2
	strh r0, [r1]
	subs r1, 0x6
	strh r0, [r1]
	adds r1, 0x2
	strh r0, [r1]
	subs r1, 0x6
	strh r0, [r1]
	adds r1, 0x2
	strh r0, [r1]
	subs r1, 0x6
	strh r0, [r1]
	adds r1, 0x2
	strh r0, [r1]
	adds r1, 0x3E
	strh r0, [r1]
	b _081240EE
	.align 2, 0
_08124020: .4byte REG_WININ
_08124024:
	ldr r0, _08124060 @ =REG_WININ
	movs r3, 0
	strh r3, [r0]
	adds r0, 0x2
	strh r3, [r0]
	subs r0, 0xA
	strh r3, [r0]
	adds r0, 0x2
	strh r3, [r0]
	adds r0, 0x2
	strh r3, [r0]
	adds r0, 0x2
	strh r3, [r0]
	ldr r0, _08124064 @ =gSpecialVar_0x8004
	ldrh r0, [r0]
	cmp r0, 0
	bne _0812406C
	ldr r1, _08124068 @ =gUnknown_02039274
	ldr r2, [r1]
	movs r0, 0xB0
	strb r0, [r2, 0x14]
	ldr r2, [r1]
	movs r0, 0x10
	strb r0, [r2, 0x15]
	ldr r0, [r1]
	strb r3, [r0, 0xC]
	ldr r2, [r1]
	movs r0, 0x50
	b _08124082
	.align 2, 0
_08124060: .4byte REG_WININ
_08124064: .4byte gSpecialVar_0x8004
_08124068: .4byte gUnknown_02039274
_0812406C:
	ldr r1, _081240F4 @ =gUnknown_02039274
	ldr r2, [r1]
	movs r0, 0x60
	strb r0, [r2, 0x14]
	ldr r2, [r1]
	movs r0, 0xE8
	strb r0, [r2, 0x15]
	ldr r0, [r1]
	strb r3, [r0, 0xC]
	ldr r2, [r1]
	movs r0, 0x4
_08124082:
	strb r0, [r2, 0xD]
	ldr r0, [r1]
	strb r3, [r0, 0x9]
	ldr r0, [r1]
	strb r3, [r0, 0x9]
	adds r2, r1, 0
	ldr r1, _081240F8 @ =REG_BG3HOFS
	ldr r2, [r2]
	ldrb r0, [r2, 0x14]
	strh r0, [r1]
	adds r1, 0x2
	ldrb r0, [r2, 0x15]
	strh r0, [r1]
	ldr r0, _081240FC @ =REG_BG2HOFS
	movs r1, 0
	strh r1, [r0]
	adds r0, 0x2
	strh r1, [r0]
	ldr r1, _08124100 @ =REG_BG1HOFS
	ldrb r0, [r2, 0xC]
	strh r0, [r1]
	adds r1, 0x2
	ldrb r0, [r2, 0xD]
	strh r0, [r1]
	subs r1, 0x6
	ldrb r0, [r2, 0x8]
	strh r0, [r1]
	adds r1, 0x2
	ldrb r0, [r2, 0x9]
	strh r0, [r1]
	subs r1, 0xA
	ldr r2, _08124104 @ =0x00003c01
	adds r0, r2, 0
	strh r0, [r1]
	adds r1, 0x2
	ldr r3, _08124108 @ =0x00003d02
	adds r0, r3, 0
	strh r0, [r1]
	adds r1, 0x2
	ldr r2, _0812410C @ =0x00003e03
	adds r0, r2, 0
	strh r0, [r1]
	ldr r0, _08124110 @ =REG_BG3CNT
	movs r3, 0xFC
	lsls r3, 6
	adds r2, r3, 0
	strh r2, [r0]
	subs r1, 0xC
	movs r3, 0xFA
	lsls r3, 5
	adds r0, r3, 0
	strh r0, [r1]
	ldr r0, _08124114 @ =REG_BLDCNT
	strh r2, [r0]
_081240EE:
	pop {r0}
	bx r0
	.align 2, 0
_081240F4: .4byte gUnknown_02039274
_081240F8: .4byte REG_BG3HOFS
_081240FC: .4byte REG_BG2HOFS
_08124100: .4byte REG_BG1HOFS
_08124104: .4byte 0x00003c01
_08124108: .4byte 0x00003d02
_0812410C: .4byte 0x00003e03
_08124110: .4byte REG_BG3CNT
_08124114: .4byte REG_BLDCNT
	thumb_func_end sub_8123FBC

	thumb_func_start sub_8124118
sub_8124118: @ 8124118
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	sub sp, 0x24
	ldr r1, _0812422C @ =gCableCarPlayerGraphicsIDs
	add r0, sp, 0x8
	movs r2, 0x2
	bl memcpy
	bl Random
	lsls r0, 16
	lsrs r0, 16
	mov r9, r0
	add r6, sp, 0xC
	ldr r1, _08124230 @ =gMtChimneyHikerGraphicsIDs
	adds r0, r6, 0
	movs r2, 0x4
	bl memcpy
	add r5, sp, 0x10
	ldr r1, _08124234 @ =gMtChimneyHikerCoords
	adds r0, r5, 0
	movs r2, 0x8
	bl memcpy
	add r4, sp, 0x18
	ldr r1, _08124238 @ =gMtChimneyHikerMovementDelayTable
	adds r0, r4, 0
	movs r2, 0x4
	bl memcpy
	ldr r0, _0812423C @ =gUnknown_08401D9C
	ldr r1, [r0, 0x4]
	ldr r0, [r0]
	str r0, [sp, 0x1C]
	str r1, [sp, 0x20]
	ldr r0, _08124240 @ =gSpecialVar_0x8004
	ldrh r0, [r0]
	mov r8, r6
	mov r10, r5
	cmp r0, 0
	beq _08124176
	cmp r0, 0x1
	beq _08124258
_08124176:
	ldr r0, _08124244 @ =gSaveBlock2
	ldrb r0, [r0, 0x8]
	add r0, sp
	adds r0, 0x8
	ldrb r0, [r0]
	ldr r1, _08124248 @ =sub_8123D98
	movs r2, 0x66
	str r2, [sp]
	movs r2, 0xC8
	movs r3, 0x49
	bl AddPseudoFieldObject
	lsls r0, 24
	lsrs r6, r0, 24
	cmp r6, 0x40
	beq _081241BE
	ldr r0, _0812424C @ =gSprites
	lsls r1, r6, 4
	adds r1, r6
	lsls r1, 2
	adds r1, r0
	ldrb r2, [r1, 0x5]
	movs r0, 0xD
	negs r0, r0
	ands r0, r2
	movs r2, 0x8
	orrs r0, r2
	strb r0, [r1, 0x5]
	movs r0, 0x8
	strh r0, [r1, 0x24]
	movs r0, 0x10
	strh r0, [r1, 0x26]
	movs r0, 0xC8
	strh r0, [r1, 0x2E]
	movs r0, 0x49
	strh r0, [r1, 0x30]
_081241BE:
	ldr r4, _08124250 @ =gSpriteTemplate_8401D40
	adds r0, r4, 0
	movs r1, 0xB0
	movs r2, 0x2B
	movs r3, 0x67
	bl CreateSprite
	lsls r0, 24
	lsrs r6, r0, 24
	ldr r5, _0812424C @ =gSprites
	lsls r0, r6, 4
	adds r0, r6
	lsls r0, 2
	adds r0, r5
	movs r1, 0x20
	strh r1, [r0, 0x26]
	strh r1, [r0, 0x24]
	movs r1, 0xB0
	strh r1, [r0, 0x2E]
	movs r1, 0x2B
	strh r1, [r0, 0x30]
	adds r4, 0x18
	adds r0, r4, 0
	movs r1, 0xC8
	movs r2, 0x63
	movs r3, 0x65
	bl CreateSprite
	lsls r0, 24
	lsrs r6, r0, 24
	lsls r0, r6, 4
	adds r0, r6
	lsls r0, 2
	adds r0, r5
	movs r1, 0x8
	strh r1, [r0, 0x24]
	movs r1, 0x4
	strh r1, [r0, 0x26]
	movs r1, 0xC8
	strh r1, [r0, 0x2E]
	movs r1, 0x63
	strh r1, [r0, 0x30]
	ldr r2, _08124254 @ =gUnknown_02039274
	ldr r1, [r2]
	movs r0, 0x7
	strb r0, [r1, 0x2]
	ldr r1, [r2]
	movs r0, 0xAF
	lsls r0, 1
	strh r0, [r1, 0x4]
	movs r0, 0x2
	bl sub_807C9B4
	b _0812431E
	.align 2, 0
_0812422C: .4byte gCableCarPlayerGraphicsIDs
_08124230: .4byte gMtChimneyHikerGraphicsIDs
_08124234: .4byte gMtChimneyHikerCoords
_08124238: .4byte gMtChimneyHikerMovementDelayTable
_0812423C: .4byte gUnknown_08401D9C
_08124240: .4byte gSpecialVar_0x8004
_08124244: .4byte gSaveBlock2
_08124248: .4byte sub_8123D98
_0812424C: .4byte gSprites
_08124250: .4byte gSpriteTemplate_8401D40
_08124254: .4byte gUnknown_02039274
_08124258:
	ldr r7, _081243EC @ =gUnknown_02039274
	ldr r0, [r7]
	adds r0, 0xFC
	ldr r1, _081243F0 @ =0x02019048
	movs r2, 0xC
	str r2, [sp]
	movs r2, 0x3
	str r2, [sp, 0x4]
	movs r2, 0x18
	movs r3, 0x1A
	bl sub_8124F08
	ldr r0, _081243F4 @ =gSaveBlock2
	ldrb r0, [r0, 0x8]
	add r0, sp
	adds r0, 0x8
	ldrb r0, [r0]
	ldr r1, _081243F8 @ =sub_8123D98
	movs r2, 0x66
	str r2, [sp]
	movs r2, 0x80
	movs r3, 0x27
	bl AddPseudoFieldObject
	lsls r0, 24
	lsrs r6, r0, 24
	cmp r6, 0x40
	beq _081242B8
	ldr r0, _081243FC @ =gSprites
	lsls r1, r6, 4
	adds r1, r6
	lsls r1, 2
	adds r1, r0
	ldrb r2, [r1, 0x5]
	movs r0, 0xD
	negs r0, r0
	ands r0, r2
	movs r2, 0x8
	orrs r0, r2
	strb r0, [r1, 0x5]
	movs r0, 0x8
	strh r0, [r1, 0x24]
	movs r0, 0x10
	strh r0, [r1, 0x26]
	movs r0, 0x80
	strh r0, [r1, 0x2E]
	movs r0, 0x27
	strh r0, [r1, 0x30]
_081242B8:
	ldr r4, _08124400 @ =gSpriteTemplate_8401D40
	adds r0, r4, 0
	movs r1, 0x68
	movs r2, 0x9
	movs r3, 0x67
	bl CreateSprite
	lsls r0, 24
	lsrs r6, r0, 24
	ldr r5, _081243FC @ =gSprites
	lsls r0, r6, 4
	adds r0, r6
	lsls r0, 2
	adds r0, r5
	movs r1, 0x20
	strh r1, [r0, 0x26]
	strh r1, [r0, 0x24]
	movs r1, 0x68
	strh r1, [r0, 0x2E]
	movs r1, 0x9
	strh r1, [r0, 0x30]
	adds r4, 0x18
	adds r0, r4, 0
	movs r1, 0x80
	movs r2, 0x41
	movs r3, 0x65
	bl CreateSprite
	lsls r0, 24
	lsrs r6, r0, 24
	lsls r0, r6, 4
	adds r0, r6
	lsls r0, 2
	adds r0, r5
	movs r1, 0x8
	strh r1, [r0, 0x24]
	movs r1, 0x4
	strh r1, [r0, 0x26]
	movs r1, 0x80
	strh r1, [r0, 0x2E]
	movs r1, 0x41
	strh r1, [r0, 0x30]
	ldr r1, [r7]
	movs r0, 0x2
	strb r0, [r1, 0x2]
	ldr r1, [r7]
	ldr r0, _08124404 @ =0x00000109
	strh r0, [r1, 0x4]
	movs r0, 0x7
	bl sub_807C9B4
_0812431E:
	movs r4, 0
	ldr r5, _081243FC @ =gSprites
_08124322:
	lsls r1, r4, 20
	movs r0, 0xC0
	lsls r0, 15
	adds r1, r0
	asrs r1, 16
	lsls r2, r4, 19
	ldr r3, _08124408 @ =0xfff80000
	adds r2, r3
	asrs r2, 16
	ldr r0, _0812440C @ =gSpriteTemplate_8401D70
	movs r3, 0x68
	bl CreateSprite
	lsls r0, 24
	lsrs r6, r0, 24
	lsls r0, r6, 4
	adds r0, r6
	lsls r0, 2
	adds r0, r5
	movs r1, 0x8
	strh r1, [r0, 0x24]
	strh r1, [r0, 0x26]
	adds r0, r4, 0x1
	lsls r0, 24
	lsrs r4, r0, 24
	cmp r4, 0x8
	bls _08124322
	movs r0, 0x3F
	mov r4, r9
	ands r0, r4
	cmp r0, 0
	bne _08124458
	mov r0, r9
	movs r1, 0x3
	bl __umodsi3
	lsls r0, 16
	lsrs r0, 16
	add r0, r8
	ldrb r0, [r0]
	ldr r5, _08124410 @ =gSpecialVar_0x8004
	ldrh r4, [r5]
	lsls r4, 2
	add r1, sp, 0x1C
	adds r1, r4, r1
	ldr r1, [r1]
	mov r3, r10
	adds r2, r3, r4
	movs r3, 0
	ldrsh r2, [r2, r3]
	mov r3, sp
	adds r3, 0x12
	adds r3, r4
	movs r4, 0
	ldrsh r3, [r3, r4]
	movs r4, 0x6A
	str r4, [sp]
	bl AddPseudoFieldObject
	lsls r0, 24
	lsrs r6, r0, 24
	cmp r6, 0x40
	beq _08124458
	ldr r1, _081243FC @ =gSprites
	lsls r2, r6, 4
	adds r0, r2, r6
	lsls r0, 2
	adds r4, r0, r1
	ldrb r1, [r4, 0x5]
	movs r0, 0xD
	negs r0, r0
	ands r0, r1
	movs r1, 0x8
	orrs r0, r1
	strb r0, [r4, 0x5]
	adds r0, r4, 0
	adds r0, 0x28
	ldrb r0, [r0]
	lsls r0, 24
	asrs r0, 24
	negs r0, r0
	strh r0, [r4, 0x24]
	adds r0, r4, 0
	adds r0, 0x29
	ldrb r0, [r0]
	lsls r0, 24
	asrs r0, 24
	negs r0, r0
	strh r0, [r4, 0x26]
	ldrh r0, [r5]
	mov r8, r2
	cmp r0, 0
	bne _0812441A
	movs r7, 0x1
	mov r5, r9
	ands r5, r7
	cmp r5, 0
	beq _08124414
	adds r0, r4, 0
	movs r1, 0x6
	b _08124428
	.align 2, 0
_081243EC: .4byte gUnknown_02039274
_081243F0: .4byte 0x02019048
_081243F4: .4byte gSaveBlock2
_081243F8: .4byte sub_8123D98
_081243FC: .4byte gSprites
_08124400: .4byte gSpriteTemplate_8401D40
_08124404: .4byte 0x00000109
_08124408: .4byte 0xfff80000
_0812440C: .4byte gSpriteTemplate_8401D70
_08124410: .4byte gSpecialVar_0x8004
_08124414:
	adds r0, r4, 0
	movs r1, 0x7
	b _0812443A
_0812441A:
	movs r7, 0x1
	mov r5, r9
	ands r5, r7
	cmp r5, 0
	beq _08124436
	adds r0, r4, 0
	movs r1, 0x7
_08124428:
	bl StartSpriteAnim
	strh r7, [r4, 0x30]
	ldrh r0, [r4, 0x22]
	adds r0, 0x2
	strh r0, [r4, 0x22]
	b _08124440
_08124436:
	adds r0, r4, 0
	movs r1, 0x6
_0812443A:
	bl StartSpriteAnim
	strh r5, [r4, 0x30]
_08124440:
	ldr r0, _08124468 @ =gSprites
	mov r2, r8
	adds r1, r2, r6
	lsls r1, 2
	adds r1, r0
	movs r0, 0x3
	mov r3, r9
	ands r0, r3
	add r0, sp
	adds r0, 0x18
	ldrb r0, [r0]
	strh r0, [r1, 0x32]
_08124458:
	add sp, 0x24
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_08124468: .4byte gSprites
	thumb_func_end sub_8124118

	thumb_func_start sub_812446C
sub_812446C: @ 812446C
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	sub sp, 0x8
	movs r3, 0
	mov r9, r3
	ldr r2, _08124530 @ =gUnknown_02039274
	ldr r0, [r2]
	ldrb r1, [r0, 0x1B]
	adds r1, 0x2
	lsls r0, r1, 3
	adds r0, r1
	lsls r0, 26
	lsrs r0, 24
	mov r12, r0
_0812448E:
	movs r6, 0
	lsls r0, r3, 1
	adds r1, r3, 0x3
	adds r2, r3, 0x6
	adds r4, r3, 0x1
	str r4, [sp]
	adds r0, r3
	lsls r0, 3
	mov r10, r0
	lsls r0, r1, 1
	adds r0, r1
	lsls r0, 3
	mov r8, r0
	lsls r0, r2, 1
	adds r0, r2
	lsls r0, 3
	str r0, [sp, 0x4]
_081244B0:
	ldr r7, _08124530 @ =gUnknown_02039274
	ldr r5, [r7]
	lsls r3, r6, 1
	mov r0, r10
	adds r2, r3, r0
	adds r4, r5, 0
	adds r4, 0x22
	adds r2, r4, r2
	mov r1, r12
	adds r0, r1, 0x1
	lsls r0, 24
	lsrs r0, 24
	mov r12, r0
	lsls r1, 1
	ldr r7, _08124534 @ =0x02019000
	adds r1, r7
	ldrh r0, [r1]
	strh r0, [r2]
	mov r0, r8
	adds r1, r3, r0
	adds r1, r4, r1
	mov r7, r9
	lsls r2, r7, 1
	ldr r7, _08124534 @ =0x02019000
	adds r0, r2, r7
	ldrh r0, [r0]
	strh r0, [r1]
	ldr r0, [sp, 0x4]
	adds r3, r0
	adds r4, r3
	ldr r1, _08124538 @ =0x02019048
	adds r2, r1
	ldrh r0, [r2]
	strh r0, [r4]
	mov r0, r9
	adds r0, 0x1
	lsls r0, 24
	lsrs r0, 24
	mov r9, r0
	adds r0, r6, 0x1
	lsls r0, 24
	lsrs r6, r0, 24
	cmp r6, 0xB
	bls _081244B0
	ldr r4, [sp]
	lsls r0, r4, 24
	lsrs r3, r0, 24
	cmp r3, 0x2
	bls _0812448E
	ldrb r0, [r5, 0x1B]
	adds r0, 0x1
	movs r1, 0x3
	bl __modsi3
	strb r0, [r5, 0x1B]
	add sp, 0x8
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_08124530: .4byte gUnknown_02039274
_08124534: .4byte 0x02019000
_08124538: .4byte 0x02019048
	thumb_func_end sub_812446C

	thumb_func_start sub_812453C
sub_812453C: @ 812453C
	push {r4,r5,lr}
	ldr r5, _08124594 @ =gUnknown_02039274
	ldr r4, [r5]
	ldrb r0, [r4, 0x1C]
	adds r0, 0x1
	movs r1, 0x60
	bl __modsi3
	strb r0, [r4, 0x1C]
	ldr r1, [r5]
	ldrb r0, [r1, 0x1F]
	ldrb r2, [r1, 0x1D]
	subs r0, r2
	strb r0, [r1, 0x8]
	ldr r2, [r5]
	adds r0, r2, 0
	adds r0, 0x20
	ldrb r0, [r0]
	ldrb r1, [r2, 0x1E]
	subs r0, r1
	strb r0, [r2, 0x9]
	ldr r1, [r5]
	ldrb r0, [r1, 0x1D]
	adds r0, 0x1
	strb r0, [r1, 0x1D]
	ldr r2, [r5]
	ldrb r0, [r2, 0x1D]
	movs r1, 0x3
	ands r0, r1
	cmp r0, 0
	bne _08124580
	ldrb r0, [r2, 0x1E]
	adds r0, 0x1
	strb r0, [r2, 0x1E]
_08124580:
	ldr r0, [r5]
	ldrb r0, [r0, 0x1D]
	cmp r0, 0x10
	bls _0812458C
	bl sub_81245F4
_0812458C:
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_08124594: .4byte gUnknown_02039274
	thumb_func_end sub_812453C

	thumb_func_start sub_8124598
sub_8124598: @ 8124598
	push {r4,r5,lr}
	ldr r5, _081245F0 @ =gUnknown_02039274
	ldr r4, [r5]
	ldrb r0, [r4, 0x1C]
	adds r0, 0x1
	movs r1, 0x60
	bl __modsi3
	strb r0, [r4, 0x1C]
	ldr r1, [r5]
	ldrb r0, [r1, 0x1D]
	ldrb r2, [r1, 0x1F]
	adds r0, r2
	strb r0, [r1, 0x8]
	ldr r1, [r5]
	adds r2, r1, 0
	adds r2, 0x20
	ldrb r0, [r1, 0x1E]
	ldrb r2, [r2]
	adds r0, r2
	strb r0, [r1, 0x9]
	ldr r1, [r5]
	ldrb r0, [r1, 0x1D]
	adds r0, 0x1
	strb r0, [r1, 0x1D]
	ldr r2, [r5]
	ldrb r0, [r2, 0x1D]
	movs r1, 0x3
	ands r0, r1
	cmp r0, 0
	bne _081245DC
	ldrb r0, [r2, 0x1E]
	adds r0, 0x1
	strb r0, [r2, 0x1E]
_081245DC:
	ldr r0, [r5]
	ldrb r0, [r0, 0x1D]
	cmp r0, 0x10
	bls _081245E8
	bl sub_812476C
_081245E8:
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_081245F0: .4byte gUnknown_02039274
	thumb_func_end sub_8124598

	thumb_func_start sub_81245F4
sub_81245F4: @ 81245F4
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	sub sp, 0x8
	movs r0, 0
	mov r12, r0
	ldr r2, _0812475C @ =gUnknown_02039274
	ldr r0, [r2]
	mov r1, r12
	strb r1, [r0, 0x1E]
	strb r1, [r0, 0x1D]
	ldr r1, [r2]
	ldrb r0, [r1, 0x8]
	strb r0, [r1, 0x1F]
	ldr r0, [r2]
	ldrb r1, [r0, 0x9]
	adds r0, 0x20
	strb r1, [r0]
	ldr r4, [r2]
	ldrb r1, [r4, 0x19]
	adds r3, r1, 0
	adds r3, 0x1E
	adds r0, r3, 0
	mov r9, r2
	asrs r0, 5
	lsls r0, 5
	subs r0, r3, r0
	strb r0, [r4, 0x19]
	mov r2, r9
	ldr r1, [r2]
	ldrb r0, [r1, 0x18]
	subs r0, 0x2
	strb r0, [r1, 0x18]
	ldr r0, [r2]
	ldrb r1, [r0, 0x1A]
	adds r2, r1, 0
	adds r2, 0x17
	adds r0, r2, 0
	ldr r3, _08124760 @ =gUnknown_0203927A
	mov r10, r3
	asrs r0, 5
	lsls r0, 5
	subs r0, r2, r0
	mov r4, r10
	strb r0, [r4]
	ldr r7, _08124764 @ =gUnknown_02039278
	ldr r0, _08124768 @ =gUnknown_02039279
	mov r8, r0
_08124658:
	mov r1, r9
	ldr r3, [r1]
	ldrb r0, [r3, 0x19]
	strb r0, [r7]
	mov r2, r10
	ldrb r0, [r2]
	mov r4, r12
	adds r1, r0, r4
	adds r0, r1, 0
	asrs r0, 5
	lsls r0, 5
	subs r0, r1, r0
	mov r1, r8
	strb r0, [r1]
	ldrb r2, [r7]
	lsls r2, 1
	ldrb r0, [r1]
	lsls r0, 6
	adds r2, r0
	adds r6, r3, 0
	adds r6, 0xFC
	adds r2, r6, r2
	ldrb r1, [r3, 0x18]
	lsls r1, 1
	mov r4, r12
	lsls r0, r4, 1
	add r0, r12
	lsls r5, r0, 3
	adds r1, r5
	adds r4, r3, 0
	adds r4, 0x22
	adds r1, r4, r1
	ldrh r0, [r1]
	strh r0, [r2]
	ldrb r1, [r7]
	adds r2, r1, 0x1
	adds r0, r2, 0
	asrs r0, 5
	lsls r0, 5
	subs r0, r2, r0
	strb r0, [r7]
	ldrb r1, [r7]
	lsls r1, 1
	mov r2, r8
	ldrb r0, [r2]
	lsls r0, 6
	adds r1, r0
	adds r1, r6, r1
	ldrb r0, [r3, 0x18]
	adds r0, 0x1
	lsls r0, 1
	adds r0, r5
	adds r0, r4, r0
	ldrh r0, [r0]
	strh r0, [r1]
	mov r0, r12
	adds r0, 0x1
	lsls r0, 24
	lsrs r0, 24
	mov r12, r0
	cmp r0, 0x8
	bls _08124658
	ldr r4, _08124764 @ =gUnknown_02039278
	mov r5, r9
	ldr r3, [r5]
	ldrb r1, [r3, 0x19]
	adds r2, r1, 0
	adds r2, 0x1E
	adds r0, r2, 0
	asrs r0, 5
	lsls r0, 5
	subs r0, r2, r0
	strb r0, [r4]
	adds r0, r3, 0
	adds r0, 0xFC
	ldrb r2, [r4]
	movs r1, 0x2
	str r1, [sp]
	movs r6, 0x20
	str r6, [sp, 0x4]
	movs r1, 0
	movs r3, 0
	bl sub_8124E7C
	ldr r1, [r5]
	ldrb r0, [r1, 0x18]
	cmp r0, 0
	bne _0812474C
	ldrb r2, [r1, 0x1A]
	adds r3, r2, 0
	adds r3, 0x1D
	adds r0, r3, 0
	asrs r0, 5
	lsls r0, 5
	subs r0, r3, r0
	strb r0, [r1, 0x1A]
	mov r3, r9
	ldr r1, [r3]
	movs r0, 0xC
	strb r0, [r1, 0x18]
	bl sub_812446C
	mov r4, r9
	ldr r1, [r4]
	ldrb r3, [r1, 0x1A]
	adds r4, r3, 0x1
	adds r0, r4, 0
	asrs r0, 5
	lsls r0, 5
	subs r0, r4, r0
	ldr r2, _08124764 @ =gUnknown_02039278
	strb r0, [r2]
	adds r0, r1, 0
	adds r0, 0xFC
	ldrb r3, [r2]
	str r6, [sp]
	movs r1, 0x9
	str r1, [sp, 0x4]
	movs r1, 0
	movs r2, 0
	bl sub_8124E7C
_0812474C:
	add sp, 0x8
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_0812475C: .4byte gUnknown_02039274
_08124760: .4byte gUnknown_0203927A
_08124764: .4byte gUnknown_02039278
_08124768: .4byte gUnknown_02039279
	thumb_func_end sub_81245F4

	thumb_func_start sub_812476C
sub_812476C: @ 812476C
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	sub sp, 0x8
	movs r0, 0
	mov r12, r0
	ldr r2, _0812489C @ =gUnknown_02039274
	ldr r0, [r2]
	mov r1, r12
	strb r1, [r0, 0x1E]
	strb r1, [r0, 0x1D]
	ldr r1, [r2]
	ldrb r0, [r1, 0x8]
	strb r0, [r1, 0x1F]
	ldr r0, [r2]
	ldrb r1, [r0, 0x9]
	adds r0, 0x20
	strb r1, [r0]
	ldr r4, [r2]
	ldrb r1, [r4, 0x19]
	adds r3, r1, 0x2
	adds r0, r3, 0
	mov r9, r2
	asrs r0, 5
	lsls r0, 5
	subs r0, r3, r0
	strb r0, [r4, 0x19]
	mov r2, r9
	ldr r1, [r2]
	ldrb r0, [r1, 0x18]
	adds r0, 0x2
	strb r0, [r1, 0x18]
	ldr r1, _081248A0 @ =gUnknown_0203927D
	ldr r0, [r2]
	ldrb r0, [r0, 0x1A]
	strb r0, [r1]
	ldr r4, _081248A4 @ =gUnknown_0203927C
	mov r10, r4
	ldr r7, _081248A8 @ =gUnknown_0203927B
	mov r8, r10
_081247C0:
	mov r0, r9
	ldr r3, [r0]
	ldrb r0, [r3, 0x19]
	strb r0, [r7]
	ldr r1, _081248A0 @ =gUnknown_0203927D
	ldrb r0, [r1]
	mov r2, r12
	adds r1, r0, r2
	adds r0, r1, 0
	asrs r0, 5
	lsls r0, 5
	subs r0, r1, r0
	mov r4, r8
	strb r0, [r4]
	ldrb r2, [r7]
	lsls r2, 1
	ldrb r0, [r4]
	lsls r0, 6
	adds r2, r0
	adds r6, r3, 0
	adds r6, 0xFC
	adds r2, r6, r2
	ldrb r1, [r3, 0x18]
	lsls r1, 1
	mov r4, r12
	lsls r0, r4, 1
	add r0, r12
	lsls r5, r0, 3
	adds r1, r5
	adds r4, r3, 0
	adds r4, 0x22
	adds r1, r4, r1
	ldrh r0, [r1]
	strh r0, [r2]
	ldrb r1, [r7]
	adds r2, r1, 0x1
	adds r0, r2, 0
	asrs r0, 5
	lsls r0, 5
	subs r0, r2, r0
	strb r0, [r7]
	ldrb r1, [r7]
	lsls r1, 1
	mov r2, r8
	ldrb r0, [r2]
	lsls r0, 6
	adds r1, r0
	adds r1, r6, r1
	ldrb r0, [r3, 0x18]
	adds r0, 0x1
	lsls r0, 1
	adds r0, r5
	adds r0, r4, r0
	ldrh r0, [r0]
	strh r0, [r1]
	mov r0, r12
	adds r0, 0x1
	lsls r0, 24
	lsrs r0, 24
	mov r12, r0
	cmp r0, 0x8
	bls _081247C0
	mov r4, r9
	ldr r1, [r4]
	ldrb r2, [r1, 0x1A]
	adds r3, r2, 0
	adds r3, 0x17
	adds r0, r3, 0
	asrs r0, 5
	lsls r0, 5
	subs r0, r3, r0
	mov r2, r10
	strb r0, [r2]
	adds r0, r1, 0
	adds r0, 0xFC
	ldrb r2, [r1, 0x19]
	mov r1, r10
	ldrb r3, [r1]
	movs r1, 0x2
	str r1, [sp]
	movs r1, 0x9
	str r1, [sp, 0x4]
	movs r1, 0
	bl sub_8124E7C
	ldr r1, [r4]
	ldrb r0, [r1, 0x18]
	cmp r0, 0xA
	bne _0812488C
	ldrb r2, [r1, 0x1A]
	adds r3, r2, 0x3
	adds r0, r3, 0
	asrs r0, 5
	lsls r0, 5
	subs r0, r3, r0
	strb r0, [r1, 0x1A]
	mov r2, r9
	ldr r1, [r2]
	movs r0, 0xFE
	strb r0, [r1, 0x18]
	bl sub_812446C
_0812488C:
	add sp, 0x8
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_0812489C: .4byte gUnknown_02039274
_081248A0: .4byte gUnknown_0203927D
_081248A4: .4byte gUnknown_0203927C
_081248A8: .4byte gUnknown_0203927B
	thumb_func_end sub_812476C

	thumb_func_start sub_81248AC
sub_81248AC: @ 81248AC
	push {lr}
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0
	beq _081248BA
	cmp r0, 0x1
	beq _081248E4
_081248BA:
	ldr r1, _081248E0 @ =gUnknown_02039274
	ldr r2, [r1]
	movs r3, 0
	movs r0, 0x2
	strb r0, [r2, 0x1B]
	ldr r0, [r1]
	strb r3, [r0, 0x19]
	ldr r2, [r1]
	movs r0, 0x14
	strb r0, [r2, 0x1A]
	ldr r1, [r1]
	movs r0, 0xC
	strb r0, [r1, 0x18]
	bl sub_812446C
	bl sub_81245F4
	b _08124906
	.align 2, 0
_081248E0: .4byte gUnknown_02039274
_081248E4:
	ldr r1, _08124914 @ =gUnknown_02039274
	ldr r2, [r1]
	movs r0, 0x2
	strb r0, [r2, 0x1B]
	ldr r2, [r1]
	movs r0, 0x1C
	strb r0, [r2, 0x19]
	ldr r2, [r1]
	movs r0, 0x14
	strb r0, [r2, 0x1A]
	ldr r1, [r1]
	movs r0, 0x4
	strb r0, [r1, 0x18]
	bl sub_812446C
	bl sub_812476C
_08124906:
	ldr r0, _08124914 @ =gUnknown_02039274
	ldr r1, [r0]
	movs r0, 0
	strb r0, [r1, 0x1C]
	pop {r0}
	bx r0
	.align 2, 0
_08124914: .4byte gUnknown_02039274
	thumb_func_end sub_81248AC

	.align 2, 0 @ Don't pad with nop.
