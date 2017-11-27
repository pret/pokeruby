	.include "constants/gba_constants.inc"
	.include "constants/species_constants.inc"
	.include "asm/macros.inc"

	.syntax unified

	.text

	@ rock

	thumb_func_start sub_80DCE9C
sub_80DCE9C: @ 80DCE9C
	push {r4-r6,lr}
	adds r5, r0, 0
	ldr r6, _080DCF08 @ =gBattleAnimArgs
	movs r1, 0x6
	ldrsh r0, [r6, r1]
	cmp r0, 0
	beq _080DCEBC
	ldr r0, _080DCF0C @ =gBattleAnimBankTarget
	ldrb r0, [r0]
	adds r2, r5, 0
	adds r2, 0x20
	adds r3, r5, 0
	adds r3, 0x22
	movs r1, 0
	bl sub_807A3FC
_080DCEBC:
	ldrh r0, [r6]
	ldrh r1, [r5, 0x20]
	adds r0, r1
	movs r4, 0
	strh r0, [r5, 0x20]
	ldrh r0, [r5, 0x22]
	adds r0, 0xE
	strh r0, [r5, 0x22]
	ldrb r1, [r6, 0x2]
	adds r0, r5, 0
	bl StartSpriteAnim
	adds r0, r5, 0
	bl AnimateSprite
	strh r4, [r5, 0x2E]
	strh r4, [r5, 0x30]
	movs r0, 0x4
	strh r0, [r5, 0x32]
	movs r0, 0x10
	strh r0, [r5, 0x34]
	ldr r0, _080DCF10 @ =0x0000ffba
	strh r0, [r5, 0x36]
	ldrh r0, [r6, 0x4]
	strh r0, [r5, 0x38]
	ldr r1, _080DCF14 @ =sub_80DCF1C
	adds r0, r5, 0
	bl StoreSpriteCallbackInData
	ldr r1, _080DCF18 @ =sub_8078278
	str r1, [r5, 0x1C]
	adds r0, r5, 0
	bl _call_via_r1
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_080DCF08: .4byte gBattleAnimArgs
_080DCF0C: .4byte gBattleAnimBankTarget
_080DCF10: .4byte 0x0000ffba
_080DCF14: .4byte sub_80DCF1C
_080DCF18: .4byte sub_8078278
	thumb_func_end sub_80DCE9C

	thumb_func_start sub_80DCF1C
sub_80DCF1C: @ 80DCF1C
	push {r4,lr}
	adds r4, r0, 0
	ldrh r1, [r4, 0x38]
	ldrh r2, [r4, 0x20]
	adds r0, r1, r2
	strh r0, [r4, 0x20]
	movs r0, 0xC0
	strh r0, [r4, 0x2E]
	strh r1, [r4, 0x30]
	movs r0, 0x4
	strh r0, [r4, 0x32]
	movs r0, 0x20
	strh r0, [r4, 0x34]
	ldr r0, _080DCF54 @ =0x0000ffe8
	strh r0, [r4, 0x36]
	ldr r1, _080DCF58 @ =move_anim_8074EE0
	adds r0, r4, 0
	bl StoreSpriteCallbackInData
	ldr r1, _080DCF5C @ =sub_8078278
	str r1, [r4, 0x1C]
	adds r0, r4, 0
	bl _call_via_r1
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080DCF54: .4byte 0x0000ffe8
_080DCF58: .4byte move_anim_8074EE0
_080DCF5C: .4byte sub_8078278
	thumb_func_end sub_80DCF1C

	thumb_func_start sub_80DCF60
sub_80DCF60: @ 80DCF60
	push {r4,r5,lr}
	adds r5, r0, 0
	ldr r4, _080DCF88 @ =gBattleAnimArgs
	ldrb r1, [r4, 0xA]
	bl StartSpriteAnim
	adds r0, r5, 0
	bl AnimateSprite
	ldr r0, _080DCF8C @ =gBattleAnimBankAttacker
	ldrb r0, [r0]
	bl GetBankSide
	lsls r0, 24
	cmp r0, 0
	beq _080DCF90
	ldrh r0, [r5, 0x20]
	ldrh r1, [r4]
	subs r0, r1
	b _080DCF96
	.align 2, 0
_080DCF88: .4byte gBattleAnimArgs
_080DCF8C: .4byte gBattleAnimBankAttacker
_080DCF90:
	ldrh r0, [r4]
	ldrh r1, [r5, 0x20]
	adds r0, r1
_080DCF96:
	strh r0, [r5, 0x20]
	ldr r3, _080DCFD8 @ =gBattleAnimArgs
	ldrh r2, [r3, 0x2]
	ldrh r0, [r5, 0x22]
	adds r2, r0
	movs r4, 0
	strh r2, [r5, 0x22]
	ldrh r0, [r3, 0x8]
	strh r0, [r5, 0x2E]
	ldrh r0, [r5, 0x20]
	strh r0, [r5, 0x30]
	ldrh r1, [r3, 0x4]
	adds r0, r1
	strh r0, [r5, 0x32]
	strh r2, [r5, 0x34]
	ldrh r0, [r3, 0x6]
	adds r2, r0
	strh r2, [r5, 0x36]
	adds r0, r5, 0
	bl sub_8078A5C
	strh r4, [r5, 0x34]
	strh r4, [r5, 0x36]
	ldr r0, _080DCFDC @ =sub_8078394
	str r0, [r5, 0x1C]
	ldr r1, _080DCFE0 @ =move_anim_8074EE0
	adds r0, r5, 0
	bl StoreSpriteCallbackInData
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080DCFD8: .4byte gBattleAnimArgs
_080DCFDC: .4byte sub_8078394
_080DCFE0: .4byte move_anim_8074EE0
	thumb_func_end sub_80DCF60

	thumb_func_start sub_80DCFE4
sub_80DCFE4: @ 80DCFE4
	push {r4,lr}
	adds r4, r0, 0
	ldr r0, _080DCFFC @ =gBattleAnimArgs
	movs r1, 0xC
	ldrsh r0, [r0, r1]
	cmp r0, 0
	bne _080DD000
	adds r0, r4, 0
	movs r1, 0
	bl sub_80787B0
	b _080DD008
	.align 2, 0
_080DCFFC: .4byte gBattleAnimArgs
_080DD000:
	adds r0, r4, 0
	movs r1, 0
	bl sub_8078764
_080DD008:
	ldr r1, _080DD024 @ =gBattleAnimArgs
	ldrh r0, [r1, 0x6]
	strh r0, [r4, 0x2E]
	ldrh r0, [r1, 0x4]
	strh r0, [r4, 0x30]
	ldrh r0, [r1, 0x8]
	strh r0, [r4, 0x32]
	ldrh r0, [r1, 0xA]
	strh r0, [r4, 0x34]
	ldr r0, _080DD028 @ =sub_80DD02C
	str r0, [r4, 0x1C]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080DD024: .4byte gBattleAnimArgs
_080DD028: .4byte sub_80DD02C
	thumb_func_end sub_80DCFE4

	thumb_func_start sub_80DD02C
sub_80DD02C: @ 80DD02C
	push {r4,lr}
	adds r4, r0, 0
	ldrh r0, [r4, 0x30]
	ldrh r1, [r4, 0x36]
	adds r0, r1
	strh r0, [r4, 0x36]
	lsls r0, 16
	asrs r0, 24
	negs r0, r0
	strh r0, [r4, 0x26]
	movs r2, 0x38
	ldrsh r0, [r4, r2]
	movs r2, 0x34
	ldrsh r1, [r4, r2]
	bl Sin
	strh r0, [r4, 0x24]
	ldrh r0, [r4, 0x32]
	ldrh r1, [r4, 0x38]
	adds r0, r1
	movs r1, 0xFF
	ands r0, r1
	strh r0, [r4, 0x38]
	ldrh r0, [r4, 0x2E]
	subs r0, 0x1
	strh r0, [r4, 0x2E]
	lsls r0, 16
	asrs r0, 16
	movs r1, 0x1
	negs r1, r1
	cmp r0, r1
	bne _080DD072
	adds r0, r4, 0
	bl move_anim_8072740
_080DD072:
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end sub_80DD02C

	thumb_func_start do_boulder_dust
do_boulder_dust: @ 80DD078
	push {r4-r6,lr}
	sub sp, 0x10
	lsls r0, 24
	lsrs r6, r0, 24
	movs r5, 0
	ldr r1, _080DD154 @ =REG_BLDCNT
	ldr r2, _080DD158 @ =0x00003f42
	adds r0, r2, 0
	strh r0, [r1]
	adds r1, 0x2
	movs r2, 0x80
	lsls r2, 5
	adds r0, r2, 0
	strh r0, [r1]
	ldr r4, _080DD15C @ =REG_BG1CNT
	ldrb r1, [r4]
	movs r0, 0x4
	negs r0, r0
	ands r0, r1
	movs r1, 0x1
	orrs r0, r1
	strb r0, [r4]
	ldrb r1, [r4, 0x1]
	movs r0, 0x3F
	ands r0, r1
	strb r0, [r4, 0x1]
	bl NotInBattle
	lsls r0, 24
	cmp r0, 0
	bne _080DD0C4
	ldrb r0, [r4]
	movs r1, 0xD
	negs r1, r1
	ands r1, r0
	movs r0, 0x4
	orrs r1, r0
	strb r1, [r4]
_080DD0C4:
	ldr r0, _080DD160 @ =gUnknown_030042C0
	strh r5, [r0]
	ldr r0, _080DD164 @ =gUnknown_030041B4
	strh r5, [r0]
	ldr r0, _080DD168 @ =REG_BG1HOFS
	strh r5, [r0]
	adds r0, 0x2
	strh r5, [r0]
	mov r0, sp
	bl sub_8078914
	ldr r1, [sp, 0x4]
	str r5, [sp, 0xC]
	ldr r2, _080DD16C @ =0x040000d4
	add r0, sp, 0xC
	str r0, [r2]
	str r1, [r2, 0x4]
	ldr r0, _080DD170 @ =0x85000400
	str r0, [r2, 0x8]
	ldr r0, [r2, 0x8]
	ldr r0, _080DD174 @ =gBattleAnimBackgroundTilemap_SandstormBrew
	bl LZDecompressVram
	ldr r0, _080DD178 @ =gBattleAnimBackgroundImage_SandstormBrew
	ldr r1, [sp]
	bl LZDecompressVram
	ldr r0, _080DD17C @ =gBattleAnimSpritePalette_261
	mov r1, sp
	ldrb r1, [r1, 0x8]
	lsls r1, 4
	movs r2, 0x20
	bl LoadCompressedPalette
	bl NotInBattle
	lsls r0, 24
	cmp r0, 0
	beq _080DD120
	mov r0, sp
	ldrb r0, [r0, 0x8]
	ldr r1, [sp, 0x4]
	movs r2, 0
	movs r3, 0
	bl sub_80763FC
_080DD120:
	ldr r0, _080DD180 @ =gBattleAnimArgs
	movs r1, 0
	ldrsh r0, [r0, r1]
	cmp r0, 0
	beq _080DD13A
	ldr r0, _080DD184 @ =gBattleAnimBankAttacker
	ldrb r0, [r0]
	bl GetBankSide
	lsls r0, 24
	cmp r0, 0
	beq _080DD13A
	movs r5, 0x1
_080DD13A:
	ldr r0, _080DD188 @ =gTasks
	lsls r1, r6, 2
	adds r1, r6
	lsls r1, 3
	adds r1, r0
	strh r5, [r1, 0x8]
	ldr r0, _080DD18C @ =sub_80DD190
	str r0, [r1]
	add sp, 0x10
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_080DD154: .4byte REG_BLDCNT
_080DD158: .4byte 0x00003f42
_080DD15C: .4byte REG_BG1CNT
_080DD160: .4byte gUnknown_030042C0
_080DD164: .4byte gUnknown_030041B4
_080DD168: .4byte REG_BG1HOFS
_080DD16C: .4byte 0x040000d4
_080DD170: .4byte 0x85000400
_080DD174: .4byte gBattleAnimBackgroundTilemap_SandstormBrew
_080DD178: .4byte gBattleAnimBackgroundImage_SandstormBrew
_080DD17C: .4byte gBattleAnimSpritePalette_261
_080DD180: .4byte gBattleAnimArgs
_080DD184: .4byte gBattleAnimBankAttacker
_080DD188: .4byte gTasks
_080DD18C: .4byte sub_80DD190
	thumb_func_end do_boulder_dust

	thumb_func_start sub_80DD190
sub_80DD190: @ 80DD190
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	sub sp, 0x10
	lsls r0, 24
	lsrs r7, r0, 24
	ldr r1, _080DD1C0 @ =gTasks
	lsls r0, r7, 2
	adds r0, r7
	lsls r0, 3
	adds r0, r1
	movs r2, 0x8
	ldrsh r0, [r0, r2]
	adds r3, r1, 0
	cmp r0, 0
	bne _080DD1CC
	ldr r1, _080DD1C4 @ =gUnknown_030042C0
	ldr r5, _080DD1C8 @ =0x0000fffa
	adds r0, r5, 0
	ldrh r2, [r1]
	adds r0, r2
	b _080DD1D2
	.align 2, 0
_080DD1C0: .4byte gTasks
_080DD1C4: .4byte gUnknown_030042C0
_080DD1C8: .4byte 0x0000fffa
_080DD1CC:
	ldr r1, _080DD204 @ =gUnknown_030042C0
	ldrh r0, [r1]
	adds r0, 0x6
_080DD1D2:
	strh r0, [r1]
	adds r4, r1, 0
	ldr r1, _080DD208 @ =gUnknown_030041B4
	ldr r5, _080DD20C @ =0x0000ffff
	adds r0, r5, 0
	ldrh r2, [r1]
	adds r0, r2
	strh r0, [r1]
	lsls r2, r7, 2
	adds r0, r2, r7
	lsls r0, 3
	adds r0, r3
	movs r5, 0x20
	ldrsh r0, [r0, r5]
	mov r8, r2
	adds r2, r1, 0
	cmp r0, 0x4
	bls _080DD1F8
	b _080DD37C
_080DD1F8:
	lsls r0, 2
	ldr r1, _080DD210 @ =_080DD214
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_080DD204: .4byte gUnknown_030042C0
_080DD208: .4byte gUnknown_030041B4
_080DD20C: .4byte 0x0000ffff
_080DD210: .4byte _080DD214
	.align 2, 0
_080DD214:
	.4byte _080DD228
	.4byte _080DD270
	.4byte _080DD292
	.4byte _080DD2D4
	.4byte _080DD358
_080DD228:
	mov r1, r8
	adds r0, r1, r7
	lsls r0, 3
	adds r3, r0, r3
	ldrh r0, [r3, 0x1C]
	adds r0, 0x1
	movs r4, 0
	strh r0, [r3, 0x1C]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x4
	beq _080DD242
	b _080DD37C
_080DD242:
	strh r4, [r3, 0x1C]
	ldrh r1, [r3, 0x1E]
	adds r1, 0x1
	strh r1, [r3, 0x1E]
	ldr r2, _080DD26C @ =REG_BLDALPHA
	movs r0, 0x10
	subs r0, r1
	lsls r0, 8
	orrs r1, r0
	strh r1, [r2]
	movs r2, 0x1E
	ldrsh r0, [r3, r2]
	cmp r0, 0x7
	beq _080DD260
	b _080DD37C
_080DD260:
	ldrh r0, [r3, 0x20]
	adds r0, 0x1
	strh r0, [r3, 0x20]
	strh r4, [r3, 0x1E]
	b _080DD37C
	.align 2, 0
_080DD26C: .4byte REG_BLDALPHA
_080DD270:
	mov r5, r8
	adds r0, r5, r7
	lsls r0, 3
	adds r1, r0, r3
	ldrh r0, [r1, 0x1E]
	adds r0, 0x1
	strh r0, [r1, 0x1E]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x65
	bne _080DD37C
	movs r0, 0x7
	strh r0, [r1, 0x1E]
	ldrh r0, [r1, 0x20]
	adds r0, 0x1
	strh r0, [r1, 0x20]
	b _080DD37C
_080DD292:
	mov r1, r8
	adds r0, r1, r7
	lsls r0, 3
	adds r3, r0, r3
	ldrh r0, [r3, 0x1C]
	adds r0, 0x1
	strh r0, [r3, 0x1C]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x4
	bne _080DD37C
	movs r0, 0
	strh r0, [r3, 0x1C]
	ldrh r1, [r3, 0x1E]
	subs r1, 0x1
	strh r1, [r3, 0x1E]
	ldr r2, _080DD2D0 @ =REG_BLDALPHA
	movs r0, 0x10
	subs r0, r1
	lsls r0, 8
	orrs r1, r0
	strh r1, [r2]
	movs r2, 0x1E
	ldrsh r1, [r3, r2]
	cmp r1, 0
	bne _080DD37C
	ldrh r0, [r3, 0x20]
	adds r0, 0x1
	strh r0, [r3, 0x20]
	strh r1, [r3, 0x1E]
	b _080DD37C
	.align 2, 0
_080DD2D0: .4byte REG_BLDALPHA
_080DD2D4:
	mov r0, sp
	bl sub_8078914
	ldr r2, [sp]
	movs r3, 0x80
	lsls r3, 6
	add r5, sp, 0xC
	movs r6, 0
	ldr r1, _080DD38C @ =0x040000d4
	movs r4, 0x80
	lsls r4, 5
	mov r9, r5
	ldr r0, _080DD390 @ =0x85000400
	mov r12, r0
	movs r0, 0x85
	lsls r0, 24
	mov r10, r0
_080DD2F6:
	str r6, [sp, 0xC]
	mov r0, r9
	str r0, [r1]
	str r2, [r1, 0x4]
	mov r0, r12
	str r0, [r1, 0x8]
	ldr r0, [r1, 0x8]
	adds r2, r4
	subs r3, r4
	cmp r3, r4
	bhi _080DD2F6
	str r6, [sp, 0xC]
	str r5, [r1]
	str r2, [r1, 0x4]
	lsrs r0, r3, 2
	mov r2, r10
	orrs r0, r2
	str r0, [r1, 0x8]
	ldr r0, [r1, 0x8]
	ldr r1, [sp, 0x4]
	movs r0, 0
	str r0, [sp, 0xC]
	ldr r0, _080DD38C @ =0x040000d4
	str r5, [r0]
	str r1, [r0, 0x4]
	ldr r1, _080DD394 @ =0x85000200
	str r1, [r0, 0x8]
	ldr r0, [r0, 0x8]
	bl NotInBattle
	lsls r0, 24
	cmp r0, 0
	bne _080DD344
	ldr r2, _080DD398 @ =REG_BG1CNT
	ldrb r1, [r2]
	movs r0, 0xD
	negs r0, r0
	ands r0, r1
	strb r0, [r2]
_080DD344:
	ldr r0, _080DD39C @ =gTasks
	mov r5, r8
	adds r1, r5, r7
	lsls r1, 3
	adds r1, r0
	ldrh r0, [r1, 0x20]
	adds r0, 0x1
	strh r0, [r1, 0x20]
	ldr r4, _080DD3A0 @ =gUnknown_030042C0
	ldr r2, _080DD3A4 @ =gUnknown_030041B4
_080DD358:
	movs r1, 0
	strh r1, [r4]
	strh r1, [r2]
	ldr r0, _080DD3A8 @ =REG_BLDCNT
	strh r1, [r0]
	adds r0, 0x2
	strh r1, [r0]
	ldr r2, _080DD398 @ =REG_BG1CNT
	ldrb r1, [r2]
	movs r0, 0x4
	negs r0, r0
	ands r0, r1
	movs r1, 0x1
	orrs r0, r1
	strb r0, [r2]
	adds r0, r7, 0
	bl DestroyAnimVisualTask
_080DD37C:
	add sp, 0x10
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080DD38C: .4byte 0x040000d4
_080DD390: .4byte 0x85000400
_080DD394: .4byte 0x85000200
_080DD398: .4byte REG_BG1CNT
_080DD39C: .4byte gTasks
_080DD3A0: .4byte gUnknown_030042C0
_080DD3A4: .4byte gUnknown_030041B4
_080DD3A8: .4byte REG_BLDCNT
	thumb_func_end sub_80DD190

	thumb_func_start sub_80DD3AC
sub_80DD3AC: @ 80DD3AC
	push {r4,r5,lr}
	adds r5, r0, 0
	movs r1, 0x2E
	ldrsh r0, [r5, r1]
	cmp r0, 0
	bne _080DD428
	ldr r4, _080DD3F0 @ =gBattleAnimArgs
	movs r2, 0x6
	ldrsh r0, [r4, r2]
	cmp r0, 0
	beq _080DD3F8
	ldr r0, _080DD3F4 @ =gBattleAnimBankAttacker
	ldrb r0, [r0]
	bl GetBankSide
	lsls r0, 24
	cmp r0, 0
	beq _080DD3F8
	movs r0, 0x98
	lsls r0, 1
	strh r0, [r5, 0x20]
	ldrh r0, [r4, 0x2]
	negs r0, r0
	strh r0, [r4, 0x2]
	movs r0, 0x1
	strh r0, [r5, 0x38]
	ldrb r1, [r5, 0x3]
	subs r0, 0x40
	ands r0, r1
	movs r1, 0x10
	orrs r0, r1
	strb r0, [r5, 0x3]
	b _080DD3FC
	.align 2, 0
_080DD3F0: .4byte gBattleAnimArgs
_080DD3F4: .4byte gBattleAnimBankAttacker
_080DD3F8:
	ldr r0, _080DD41C @ =0x0000ffc0
	strh r0, [r5, 0x20]
_080DD3FC:
	ldr r4, _080DD420 @ =gBattleAnimArgs
	ldrh r0, [r4]
	strh r0, [r5, 0x22]
	ldr r1, _080DD424 @ =gUnknown_083DAD10
	adds r0, r5, 0
	bl SetSubspriteTables
	ldrh r0, [r4, 0x2]
	strh r0, [r5, 0x30]
	ldrh r0, [r4, 0x4]
	strh r0, [r5, 0x32]
	ldrh r0, [r5, 0x2E]
	adds r0, 0x1
	strh r0, [r5, 0x2E]
	b _080DD484
	.align 2, 0
_080DD41C: .4byte 0x0000ffc0
_080DD420: .4byte gBattleAnimArgs
_080DD424: .4byte gUnknown_083DAD10
_080DD428:
	ldrh r1, [r5, 0x30]
	ldrh r3, [r5, 0x34]
	adds r1, r3
	ldrh r2, [r5, 0x32]
	ldrh r0, [r5, 0x36]
	adds r2, r0
	lsls r0, r1, 16
	asrs r0, 24
	ldrh r3, [r5, 0x24]
	adds r0, r3
	strh r0, [r5, 0x24]
	lsls r0, r2, 16
	asrs r0, 24
	ldrh r3, [r5, 0x26]
	adds r0, r3
	strh r0, [r5, 0x26]
	movs r0, 0xFF
	ands r1, r0
	strh r1, [r5, 0x34]
	ands r2, r0
	strh r2, [r5, 0x36]
	movs r1, 0x38
	ldrsh r0, [r5, r1]
	cmp r0, 0
	bne _080DD46E
	movs r2, 0x20
	ldrsh r0, [r5, r2]
	movs r3, 0x24
	ldrsh r1, [r5, r3]
	adds r0, r1
	movs r1, 0x88
	lsls r1, 1
	cmp r0, r1
	ble _080DD484
	b _080DD480
_080DD46E:
	movs r1, 0x20
	ldrsh r0, [r5, r1]
	movs r2, 0x24
	ldrsh r1, [r5, r2]
	adds r0, r1
	movs r1, 0x20
	negs r1, r1
	cmp r0, r1
	bge _080DD484
_080DD480:
	ldr r0, _080DD48C @ =move_anim_8072740
	str r0, [r5, 0x1C]
_080DD484:
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080DD48C: .4byte move_anim_8072740
	thumb_func_end sub_80DD3AC

	thumb_func_start sub_80DD490
sub_80DD490: @ 80DD490
	push {r4,r5,lr}
	adds r4, r0, 0
	ldr r5, _080DD4C8 @ =gBattleAnimArgs
	ldrb r1, [r5, 0x8]
	bl StartSpriteAnim
	adds r0, r4, 0
	movs r1, 0
	bl sub_80787B0
	ldrh r0, [r5, 0x6]
	strh r0, [r4, 0x2E]
	ldrh r0, [r4, 0x20]
	strh r0, [r4, 0x32]
	ldrh r0, [r5, 0x4]
	ldrh r1, [r4, 0x22]
	adds r0, r1
	strh r0, [r4, 0x36]
	ldr r0, _080DD4CC @ =sub_8078B34
	str r0, [r4, 0x1C]
	ldr r1, _080DD4D0 @ =move_anim_8072740
	adds r0, r4, 0
	bl StoreSpriteCallbackInData
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080DD4C8: .4byte gBattleAnimArgs
_080DD4CC: .4byte sub_8078B34
_080DD4D0: .4byte move_anim_8072740
	thumb_func_end sub_80DD490

	thumb_func_start sub_80DD4D4
sub_80DD4D4: @ 80DD4D4
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	lsls r0, 24
	lsrs r0, 24
	lsls r1, r0, 2
	adds r1, r0
	lsls r1, 3
	ldr r0, _080DD554 @ =gTasks
	adds r6, r1, r0
	ldr r5, _080DD558 @ =gBattleAnimBankAttacker
	ldrb r0, [r5]
	movs r1, 0x2
	bl sub_8077ABC
	lsls r0, 24
	lsrs r0, 24
	mov r9, r0
	ldrb r0, [r5]
	movs r1, 0x1
	bl sub_8077ABC
	lsls r0, 24
	lsrs r0, 8
	movs r1, 0xC0
	lsls r1, 13
	adds r0, r1
	lsrs r7, r0, 16
	ldr r4, _080DD55C @ =gBattleAnimBankTarget
	ldrb r0, [r4]
	movs r1, 0x2
	bl sub_8077ABC
	lsls r0, 24
	lsrs r0, 24
	mov r10, r0
	ldrb r0, [r4]
	movs r1, 0x1
	bl sub_8077ABC
	lsls r0, 24
	lsrs r0, 8
	movs r2, 0xC0
	lsls r2, 13
	adds r0, r2
	lsrs r0, 16
	mov r8, r0
	ldrb r1, [r5]
	movs r0, 0x2
	eors r0, r1
	ldrb r4, [r4]
	cmp r0, r4
	bne _080DD544
	mov r8, r7
_080DD544:
	bl sub_80DD8BC
	lsls r0, 24
	lsrs r5, r0, 24
	cmp r5, 0x1
	bne _080DD560
	movs r0, 0x20
	b _080DD566
	.align 2, 0
_080DD554: .4byte gTasks
_080DD558: .4byte gBattleAnimBankAttacker
_080DD55C: .4byte gBattleAnimBankTarget
_080DD560:
	lsls r1, r5, 3
	movs r0, 0x30
	subs r0, r1
_080DD566:
	strh r0, [r6, 0x18]
	movs r4, 0
	strh r4, [r6, 0x8]
	strh r4, [r6, 0x1E]
	strh r4, [r6, 0x1A]
	movs r0, 0x1
	strh r0, [r6, 0x20]
	movs r1, 0x18
	ldrsh r0, [r6, r1]
	cmp r0, 0
	bge _080DD57E
	adds r0, 0x7
_080DD57E:
	asrs r0, 3
	subs r0, 0x1
	strh r0, [r6, 0x1C]
	mov r2, r9
	lsls r0, r2, 3
	strh r0, [r6, 0xC]
	lsls r0, r7, 3
	strh r0, [r6, 0xE]
	mov r1, r10
	subs r0, r1, r2
	lsls r0, 3
	movs r2, 0x18
	ldrsh r1, [r6, r2]
	bl __divsi3
	strh r0, [r6, 0x10]
	mov r1, r8
	subs r0, r1, r7
	lsls r0, 3
	movs r2, 0x18
	ldrsh r1, [r6, r2]
	bl __divsi3
	strh r0, [r6, 0x12]
	strh r4, [r6, 0x14]
	strh r4, [r6, 0x16]
	movs r0, 0x40
	negs r0, r0
	bl sub_8076F98
	adds r4, r0, 0
	lsls r4, 24
	asrs r4, 8
	lsrs r4, 16
	movs r0, 0x3F
	bl sub_8076F98
	lsls r0, 24
	strh r4, [r6, 0x22]
	asrs r0, 24
	lsls r4, 16
	asrs r4, 16
	subs r0, r4
	movs r2, 0x18
	ldrsh r1, [r6, r2]
	bl __divsi3
	strh r0, [r6, 0x24]
	strh r5, [r6, 0xA]
	movs r0, 0
	bl GetAnimBankSpriteId
	lsls r0, 24
	lsrs r0, 24
	strh r0, [r6, 0x26]
	ldr r0, _080DD600 @ =sub_80DD604
	str r0, [r6]
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080DD600: .4byte sub_80DD604
	thumb_func_end sub_80DD4D4

	thumb_func_start sub_80DD604
sub_80DD604: @ 80DD604
	push {r4,lr}
	lsls r0, 24
	lsrs r2, r0, 24
	lsls r0, r2, 2
	adds r0, r2
	lsls r0, 3
	ldr r1, _080DD628 @ =gTasks
	adds r4, r0, r1
	movs r1, 0x8
	ldrsh r0, [r4, r1]
	cmp r0, 0x4
	bls _080DD61E
	b _080DD76C
_080DD61E:
	lsls r0, 2
	ldr r1, _080DD62C @ =_080DD630
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_080DD628: .4byte gTasks
_080DD62C: .4byte _080DD630
	.align 2, 0
_080DD630:
	.4byte _080DD644
	.4byte _080DD6A8
	.4byte _080DD6B0
	.4byte _080DD70C
	.4byte _080DD75E
_080DD644:
	ldrh r2, [r4, 0x14]
	ldrh r0, [r4, 0x10]
	subs r2, r0
	strh r2, [r4, 0x14]
	ldrh r0, [r4, 0x16]
	ldrh r1, [r4, 0x12]
	subs r0, r1
	strh r0, [r4, 0x16]
	ldr r3, _080DD6A4 @ =gSprites
	movs r0, 0x26
	ldrsh r1, [r4, r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r3
	lsls r2, 16
	asrs r2, 19
	strh r2, [r0, 0x24]
	movs r1, 0x26
	ldrsh r0, [r4, r1]
	lsls r1, r0, 4
	adds r1, r0
	lsls r1, 2
	adds r1, r3
	ldrh r0, [r4, 0x16]
	lsls r0, 16
	asrs r0, 19
	strh r0, [r1, 0x26]
	ldrh r0, [r4, 0x1A]
	adds r0, 0x1
	strh r0, [r4, 0x1A]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0xA
	bne _080DD694
	movs r0, 0x14
	strh r0, [r4, 0x1E]
	ldrh r0, [r4, 0x8]
	adds r0, 0x1
	strh r0, [r4, 0x8]
_080DD694:
	ldrh r1, [r4, 0x22]
	lsls r1, 24
	asrs r1, 24
	movs r0, 0xA2
	bl PlaySE12WithPanning
	b _080DD76C
	.align 2, 0
_080DD6A4: .4byte gSprites
_080DD6A8:
	ldrh r0, [r4, 0x1E]
	subs r0, 0x1
	strh r0, [r4, 0x1E]
	b _080DD750
_080DD6B0:
	ldrh r0, [r4, 0x1A]
	subs r0, 0x1
	strh r0, [r4, 0x1A]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0
	beq _080DD6D0
	ldrh r0, [r4, 0x10]
	ldrh r2, [r4, 0x14]
	adds r0, r2
	strh r0, [r4, 0x14]
	ldrh r0, [r4, 0x12]
	ldrh r1, [r4, 0x16]
	adds r0, r1
	strh r0, [r4, 0x16]
	b _080DD6DA
_080DD6D0:
	strh r0, [r4, 0x14]
	strh r0, [r4, 0x16]
	ldrh r0, [r4, 0x8]
	adds r0, 0x1
	strh r0, [r4, 0x8]
_080DD6DA:
	ldr r2, _080DD708 @ =gSprites
	movs r1, 0x26
	ldrsh r0, [r4, r1]
	lsls r1, r0, 4
	adds r1, r0
	lsls r1, 2
	adds r1, r2
	ldrh r0, [r4, 0x14]
	lsls r0, 16
	asrs r0, 19
	strh r0, [r1, 0x24]
	movs r1, 0x26
	ldrsh r0, [r4, r1]
	lsls r1, r0, 4
	adds r1, r0
	lsls r1, 2
	adds r1, r2
	ldrh r0, [r4, 0x16]
	lsls r0, 16
	asrs r0, 19
	strh r0, [r1, 0x26]
	b _080DD76C
	.align 2, 0
_080DD708: .4byte gSprites
_080DD70C:
	ldrh r0, [r4, 0x10]
	ldrh r2, [r4, 0xC]
	adds r0, r2
	strh r0, [r4, 0xC]
	ldrh r0, [r4, 0x12]
	ldrh r1, [r4, 0xE]
	adds r0, r1
	strh r0, [r4, 0xE]
	ldrh r0, [r4, 0x1A]
	adds r0, 0x1
	strh r0, [r4, 0x1A]
	lsls r0, 16
	asrs r0, 16
	movs r2, 0x1C
	ldrsh r1, [r4, r2]
	cmp r0, r1
	blt _080DD74A
	movs r0, 0
	strh r0, [r4, 0x1A]
	adds r0, r4, 0
	bl sub_80DD774
	ldrh r1, [r4, 0x24]
	ldrh r0, [r4, 0x22]
	adds r1, r0
	strh r1, [r4, 0x22]
	lsls r1, 24
	asrs r1, 24
	movs r0, 0xAF
	bl PlaySE12WithPanning
_080DD74A:
	ldrh r0, [r4, 0x18]
	subs r0, 0x1
	strh r0, [r4, 0x18]
_080DD750:
	lsls r0, 16
	cmp r0, 0
	bne _080DD76C
	ldrh r0, [r4, 0x8]
	adds r0, 0x1
	strh r0, [r4, 0x8]
	b _080DD76C
_080DD75E:
	movs r1, 0x1E
	ldrsh r0, [r4, r1]
	cmp r0, 0
	bne _080DD76C
	adds r0, r2, 0
	bl DestroyAnimVisualTask
_080DD76C:
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end sub_80DD604

	thumb_func_start sub_80DD774
sub_80DD774: @ 80DD774
	push {r4-r7,lr}
	adds r4, r0, 0
	ldrh r0, [r4, 0xA]
	subs r0, 0x1
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x4
	bhi _080DD864
	lsls r0, 2
	ldr r1, _080DD790 @ =_080DD794
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_080DD790: .4byte _080DD794
	.align 2, 0
_080DD794:
	.4byte _080DD7A8
	.4byte _080DD7B4
	.4byte _080DD7B4
	.4byte _080DD7C0
	.4byte _080DD7CC
_080DD7A8:
	ldr r3, _080DD7B0 @ =gSpriteTemplate_83DAD78
	movs r5, 0
	b _080DD7D0
	.align 2, 0
_080DD7B0: .4byte gSpriteTemplate_83DAD78
_080DD7B4:
	ldr r3, _080DD7BC @ =gSpriteTemplate_83DAD90
	movs r5, 0x50
	b _080DD7D0
	.align 2, 0
_080DD7BC: .4byte gSpriteTemplate_83DAD90
_080DD7C0:
	ldr r3, _080DD7C8 @ =gSpriteTemplate_83DAD90
	movs r5, 0x40
	b _080DD7D0
	.align 2, 0
_080DD7C8: .4byte gSpriteTemplate_83DAD90
_080DD7CC:
	ldr r3, _080DD86C @ =gSpriteTemplate_83DAD90
	movs r5, 0x30
_080DD7D0:
	ldrh r1, [r4, 0xC]
	lsls r1, 16
	asrs r1, 19
	lsls r1, 16
	lsrs r1, 16
	ldrh r2, [r4, 0xE]
	lsls r2, 16
	asrs r2, 19
	lsls r2, 16
	movs r6, 0x20
	ldrsh r0, [r4, r6]
	lsls r0, 2
	adds r1, r0
	lsls r1, 16
	lsrs r6, r1, 16
	asrs r1, 16
	lsrs r7, r2, 16
	asrs r2, 16
	adds r0, r3, 0
	movs r3, 0x23
	bl CreateSprite
	lsls r0, 24
	lsrs r2, r0, 24
	cmp r2, 0x40
	beq _080DD85C
	ldr r1, _080DD870 @ =gSprites
	lsls r0, r2, 4
	adds r0, r2
	lsls r0, 2
	adds r0, r1
	movs r1, 0x12
	strh r1, [r0, 0x2E]
	movs r2, 0x20
	ldrsh r1, [r4, r2]
	lsls r2, r1, 2
	adds r2, r1
	lsls r2, 2
	adds r2, r6, r2
	movs r6, 0xA
	ldrsh r3, [r4, r6]
	lsls r1, r3, 1
	adds r1, r3
	adds r2, r1
	strh r2, [r0, 0x32]
	strh r7, [r0, 0x36]
	movs r1, 0xA
	ldrsh r2, [r4, r1]
	lsls r2, 1
	movs r3, 0x10
	negs r3, r3
	adds r1, r3, 0
	subs r1, r2
	strh r1, [r0, 0x38]
	ldrh r3, [r0, 0x4]
	lsls r2, r3, 22
	lsrs r2, 22
	adds r2, r5
	ldr r5, _080DD874 @ =0x000003ff
	adds r1, r5, 0
	ands r2, r1
	ldr r1, _080DD878 @ =0xfffffc00
	ands r1, r3
	orrs r1, r2
	strh r1, [r0, 0x4]
	bl sub_80786EC
	ldrh r0, [r4, 0x1E]
	adds r0, 0x1
	strh r0, [r4, 0x1E]
_080DD85C:
	movs r6, 0x20
	ldrsh r0, [r4, r6]
	negs r0, r0
	strh r0, [r4, 0x20]
_080DD864:
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080DD86C: .4byte gSpriteTemplate_83DAD90
_080DD870: .4byte gSprites
_080DD874: .4byte 0x000003ff
_080DD878: .4byte 0xfffffc00
	thumb_func_end sub_80DD774

	thumb_func_start sub_80DD87C
sub_80DD87C: @ 80DD87C
	push {r4,lr}
	adds r4, r0, 0
	bl sub_8078718
	lsls r0, 24
	cmp r0, 0
	beq _080DD8AE
	ldr r0, _080DD8B4 @ =sub_80DD604
	bl FindTaskIdByFunc
	lsls r0, 24
	lsrs r2, r0, 24
	cmp r2, 0xFF
	beq _080DD8A8
	ldr r0, _080DD8B8 @ =gTasks
	lsls r1, r2, 2
	adds r1, r2
	lsls r1, 3
	adds r1, r0
	ldrh r0, [r1, 0x1E]
	subs r0, 0x1
	strh r0, [r1, 0x1E]
_080DD8A8:
	adds r0, r4, 0
	bl DestroySprite
_080DD8AE:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080DD8B4: .4byte sub_80DD604
_080DD8B8: .4byte gTasks
	thumb_func_end sub_80DD87C

	thumb_func_start sub_80DD8BC
sub_80DD8BC: @ 80DD8BC
	push {lr}
	ldr r0, _080DD8E4 @ =gDisableStructMoveAnim
	ldr r0, [r0]
	ldrb r1, [r0, 0x11]
	lsrs r0, r1, 4
	lsls r1, 28
	lsrs r1, 28
	subs r0, r1
	lsls r0, 24
	lsrs r1, r0, 24
	movs r2, 0xFF
	lsls r2, 24
	adds r0, r2
	lsrs r0, 24
	cmp r0, 0x4
	bls _080DD8DE
	movs r1, 0x1
_080DD8DE:
	adds r0, r1, 0
	pop {r1}
	bx r1
	.align 2, 0
_080DD8E4: .4byte gDisableStructMoveAnim
	thumb_func_end sub_80DD8BC

	thumb_func_start sub_80DD8E8
sub_80DD8E8: @ 80DD8E8
	push {r4,r5,lr}
	adds r4, r0, 0
	ldr r5, _080DD920 @ =gBattleAnimArgs
	ldrb r1, [r5, 0x8]
	bl StartSpriteAnim
	ldrh r0, [r5]
	strh r0, [r4, 0x24]
	ldrh r0, [r5, 0x2]
	strh r0, [r4, 0x32]
	ldrh r0, [r4, 0x34]
	ldrh r1, [r5, 0x4]
	subs r0, r1
	strh r0, [r4, 0x34]
	movs r0, 0x3
	strh r0, [r4, 0x2E]
	ldrh r0, [r5, 0x6]
	strh r0, [r4, 0x30]
	ldr r0, _080DD924 @ =sub_80DD928
	str r0, [r4, 0x1C]
	adds r4, 0x3E
	ldrb r0, [r4]
	movs r1, 0x4
	orrs r0, r1
	strb r0, [r4]
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080DD920: .4byte gBattleAnimArgs
_080DD924: .4byte sub_80DD928
	thumb_func_end sub_80DD8E8

	thumb_func_start sub_80DD928
sub_80DD928: @ 80DD928
	push {lr}
	adds r2, r0, 0
	adds r3, r2, 0
	adds r3, 0x3E
	ldrb r0, [r3]
	movs r1, 0x5
	negs r1, r1
	ands r1, r0
	strb r1, [r3]
	ldrh r1, [r2, 0x34]
	movs r3, 0x34
	ldrsh r0, [r2, r3]
	cmp r0, 0
	beq _080DD960
	ldrh r3, [r2, 0x32]
	adds r0, r1, r3
	strh r0, [r2, 0x26]
	ldrh r0, [r2, 0x2E]
	adds r1, r0
	strh r1, [r2, 0x34]
	adds r0, 0x1
	strh r0, [r2, 0x2E]
	lsls r1, 16
	cmp r1, 0
	ble _080DD972
	movs r0, 0
	strh r0, [r2, 0x34]
	b _080DD972
_080DD960:
	ldrh r0, [r2, 0x30]
	subs r0, 0x1
	strh r0, [r2, 0x30]
	lsls r0, 16
	cmp r0, 0
	bne _080DD972
	adds r0, r2, 0
	bl move_anim_8072740
_080DD972:
	pop {r0}
	bx r0
	thumb_func_end sub_80DD928

	thumb_func_start sub_80DD978
sub_80DD978: @ 80DD978
	push {r4,lr}
	adds r4, r0, 0
	ldr r0, _080DD9A0 @ =gBattleAnimBankAttacker
	ldrb r0, [r0]
	bl GetBankSide
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _080DD994
	adds r0, r4, 0
	movs r1, 0x1
	bl StartSpriteAffineAnim
_080DD994:
	adds r0, r4, 0
	bl sub_807941C
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080DD9A0: .4byte gBattleAnimBankAttacker
	thumb_func_end sub_80DD978

	thumb_func_start sub_80DD9A4
sub_80DD9A4: @ 80DD9A4
	push {r4,r5,lr}
	adds r4, r0, 0
	ldr r5, _080DD9F0 @ =gBattleAnimBankTarget
	ldrb r0, [r5]
	movs r1, 0
	bl sub_8077ABC
	lsls r0, 24
	lsrs r0, 24
	strh r0, [r4, 0x20]
	ldrb r0, [r5]
	movs r1, 0x1
	bl sub_8077ABC
	lsls r0, 24
	lsrs r0, 24
	ldr r2, _080DD9F4 @ =gBattleAnimArgs
	ldrh r3, [r2]
	ldrh r5, [r4, 0x20]
	adds r1, r3, r5
	strh r1, [r4, 0x20]
	ldrh r1, [r2, 0x2]
	adds r0, r1
	strh r0, [r4, 0x22]
	strh r3, [r4, 0x30]
	strh r1, [r4, 0x32]
	ldrh r0, [r2, 0x4]
	strh r0, [r4, 0x38]
	ldrb r1, [r2, 0x6]
	adds r0, r4, 0
	bl StartSpriteAnim
	ldr r0, _080DD9F8 @ =sub_80DD9FC
	str r0, [r4, 0x1C]
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080DD9F0: .4byte gBattleAnimBankTarget
_080DD9F4: .4byte gBattleAnimArgs
_080DD9F8: .4byte sub_80DD9FC
	thumb_func_end sub_80DD9A4

	thumb_func_start sub_80DD9FC
sub_80DD9FC: @ 80DD9FC
	push {r4,lr}
	adds r4, r0, 0
	ldrh r0, [r4, 0x2E]
	adds r0, 0x8
	strh r0, [r4, 0x2E]
	ldrh r0, [r4, 0x30]
	ldrh r1, [r4, 0x34]
	adds r0, r1
	strh r0, [r4, 0x34]
	ldrh r0, [r4, 0x32]
	ldrh r2, [r4, 0x36]
	adds r0, r2
	strh r0, [r4, 0x36]
	movs r1, 0x34
	ldrsh r0, [r4, r1]
	movs r1, 0x28
	bl __divsi3
	ldrh r1, [r4, 0x24]
	adds r1, r0
	strh r1, [r4, 0x24]
	movs r2, 0x2E
	ldrsh r0, [r4, r2]
	movs r2, 0x38
	ldrsh r1, [r4, r2]
	bl Sin
	ldrh r1, [r4, 0x26]
	subs r1, r0
	strh r1, [r4, 0x26]
	movs r1, 0x2E
	ldrsh r0, [r4, r1]
	cmp r0, 0x8C
	ble _080DDA46
	adds r0, r4, 0
	bl move_anim_8072740
_080DDA46:
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end sub_80DD9FC

	thumb_func_start sub_80DDA4C
sub_80DDA4C: @ 80DDA4C
	push {lr}
	lsls r0, 24
	lsrs r3, r0, 24
	ldr r2, _080DDA84 @ =gMoveDmgMoveAnim
	ldr r0, [r2]
	cmp r0, 0x20
	bgt _080DDA60
	ldr r1, _080DDA88 @ =gBattleAnimArgs
	movs r0, 0
	strh r0, [r1, 0xE]
_080DDA60:
	ldr r2, [r2]
	adds r0, r2, 0
	subs r0, 0x21
	cmp r0, 0x20
	bhi _080DDA70
	ldr r1, _080DDA88 @ =gBattleAnimArgs
	movs r0, 0x1
	strh r0, [r1, 0xE]
_080DDA70:
	cmp r2, 0x41
	ble _080DDA7A
	ldr r1, _080DDA88 @ =gBattleAnimArgs
	movs r0, 0x2
	strh r0, [r1, 0xE]
_080DDA7A:
	adds r0, r3, 0
	bl DestroyAnimVisualTask
	pop {r0}
	bx r0
	.align 2, 0
_080DDA84: .4byte gMoveDmgMoveAnim
_080DDA88: .4byte gBattleAnimArgs
	thumb_func_end sub_80DDA4C

	thumb_func_start sub_80DDA8C
sub_80DDA8C: @ 80DDA8C
	push {r4-r6,lr}
	lsls r0, 24
	lsrs r6, r0, 24
	ldr r1, _080DDAE8 @ =gTasks
	lsls r0, r6, 2
	adds r0, r6
	lsls r0, 3
	adds r5, r0, r1
	movs r1, 0x8
	ldrsh r0, [r5, r1]
	cmp r0, 0
	bne _080DDAAE
	movs r0, 0
	bl sub_80789D4
	movs r0, 0xC8
	strh r0, [r5, 0xA]
_080DDAAE:
	ldr r4, _080DDAEC @ =gUnknown_030041B8
	movs r1, 0xA
	ldrsh r0, [r5, r1]
	movs r1, 0xA
	bl __divsi3
	ldrh r1, [r4]
	adds r1, r0
	strh r1, [r4]
	ldrh r0, [r5, 0xA]
	subs r0, 0x3
	strh r0, [r5, 0xA]
	movs r1, 0x8
	ldrsh r0, [r5, r1]
	cmp r0, 0x78
	bne _080DDADA
	movs r0, 0x1
	bl sub_80789D4
	adds r0, r6, 0
	bl DestroyAnimVisualTask
_080DDADA:
	ldrh r0, [r5, 0x8]
	adds r0, 0x1
	strh r0, [r5, 0x8]
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_080DDAE8: .4byte gTasks
_080DDAEC: .4byte gUnknown_030041B8
	thumb_func_end sub_80DDA8C

	thumb_func_start sub_80DDAF0
sub_80DDAF0: @ 80DDAF0
	push {r4-r6,lr}
	lsls r0, 24
	lsrs r0, 24
	adds r5, r0, 0
	ldr r1, _080DDB5C @ =gTasks
	lsls r0, r5, 2
	adds r0, r5
	lsls r0, 3
	adds r4, r0, r1
	movs r1, 0x8
	ldrsh r0, [r4, r1]
	cmp r0, 0
	bne _080DDB1C
	movs r0, 0
	bl sub_80789D4
	ldrh r0, [r4, 0x8]
	adds r0, 0x1
	strh r0, [r4, 0x8]
	ldr r0, _080DDB60 @ =gUnknown_030041B8
	ldrh r0, [r0]
	strh r0, [r4, 0xC]
_080DDB1C:
	ldrh r0, [r4, 0xA]
	adds r0, 0x50
	movs r1, 0xFF
	ands r0, r1
	strh r0, [r4, 0xA]
	ldr r6, _080DDB60 @ =gUnknown_030041B8
	movs r2, 0xA
	ldrsh r1, [r4, r2]
	movs r0, 0x4
	bl Cos
	ldrh r4, [r4, 0xC]
	adds r0, r4
	strh r0, [r6]
	ldr r0, _080DDB64 @ =gBattleAnimArgs
	movs r2, 0xE
	ldrsh r1, [r0, r2]
	ldr r0, _080DDB68 @ =0x00000fff
	cmp r1, r0
	bne _080DDB54
	movs r0, 0
	strh r0, [r6]
	movs r0, 0x1
	bl sub_80789D4
	adds r0, r5, 0
	bl DestroyAnimVisualTask
_080DDB54:
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_080DDB5C: .4byte gTasks
_080DDB60: .4byte gUnknown_030041B8
_080DDB64: .4byte gBattleAnimArgs
_080DDB68: .4byte 0x00000fff
	thumb_func_end sub_80DDAF0
	
	.align 2, 0 @ Don't pad with nop.
