	.include "constants/gba_constants.inc"
	.include "constants/species_constants.inc"
	.include "asm/macros.inc"

	.syntax unified

	.text

	thumb_func_start sub_8032C88
sub_8032C88: @ 8032C88
	push {r4-r7,lr}
	movs r6, 0
	bl IsDoubleBattle
	lsls r0, 24
	cmp r0, 0
	beq _08032CAC
	bl IsDoubleBattle
	lsls r0, 24
	cmp r0, 0
	beq _08032CE0
	ldr r0, _08032CCC @ =gBattleTypeFlags
	ldrh r1, [r0]
	movs r0, 0x40
	ands r0, r1
	cmp r0, 0
	beq _08032CE0
_08032CAC:
	ldr r2, _08032CD0 @ =gSprites
	ldr r1, _08032CD4 @ =gUnknown_03004340
	ldr r0, _08032CD8 @ =gUnknown_02024A60
	ldrb r0, [r0]
	adds r0, r1
	ldrb r1, [r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r2, 0x1C
	adds r0, r2
	ldr r1, [r0]
	ldr r0, _08032CDC @ =SpriteCallbackDummy
	cmp r1, r0
	bne _08032D16
	b _08032D14
	.align 2, 0
_08032CCC: .4byte gBattleTypeFlags
_08032CD0: .4byte gSprites
_08032CD4: .4byte gUnknown_03004340
_08032CD8: .4byte gUnknown_02024A60
_08032CDC: .4byte SpriteCallbackDummy
_08032CE0:
	ldr r2, _08032DC4 @ =gSprites
	ldr r5, _08032DC8 @ =gUnknown_03004340
	ldr r0, _08032DCC @ =gUnknown_02024A60
	ldrb r3, [r0]
	adds r0, r3, r5
	ldrb r1, [r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r2, 0x1C
	adds r0, r2
	ldr r4, [r0]
	ldr r0, _08032DD0 @ =SpriteCallbackDummy
	cmp r4, r0
	bne _08032D16
	movs r0, 0x2
	eors r3, r0
	adds r0, r3, r5
	ldrb r1, [r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r2
	ldr r0, [r0]
	cmp r0, r4
	bne _08032D16
_08032D14:
	movs r6, 0x1
_08032D16:
	bl IsCryPlayingOrClearCrySongs
	lsls r0, 24
	cmp r0, 0
	beq _08032D22
	movs r6, 0
_08032D22:
	cmp r6, 0
	beq _08032E0E
	ldr r7, _08032DCC @ =gUnknown_02024A60
	ldrb r2, [r7]
	lsls r0, r2, 1
	adds r0, r2
	lsls r0, 2
	ldr r5, _08032DD4 @ =0x02017810
	adds r4, r0, r5
	ldrb r1, [r4, 0x1]
	movs r3, 0x1
	adds r0, r3, 0
	ands r0, r1
	cmp r0, 0
	beq _08032E0E
	movs r6, 0x2
	adds r1, r6, 0
	eors r1, r2
	lsls r0, r1, 1
	adds r0, r1
	lsls r0, 2
	adds r0, r5
	ldrb r1, [r0, 0x1]
	adds r0, r3, 0
	ands r0, r1
	cmp r0, 0
	beq _08032E0E
	ldrb r1, [r4]
	movs r3, 0x7F
	adds r0, r3, 0
	ands r0, r1
	strb r0, [r4]
	ldrb r0, [r7]
	lsls r1, r0, 1
	adds r1, r0
	lsls r1, 2
	adds r1, r5
	ldrb r2, [r1, 0x1]
	movs r4, 0x2
	negs r4, r4
	adds r0, r4, 0
	ands r0, r2
	strb r0, [r1, 0x1]
	ldrb r0, [r7]
	adds r1, r6, 0
	eors r1, r0
	lsls r0, r1, 1
	adds r0, r1
	lsls r0, 2
	adds r0, r5
	ldrb r1, [r0]
	ands r3, r1
	strb r3, [r0]
	ldrb r0, [r7]
	adds r1, r6, 0
	eors r1, r0
	lsls r0, r1, 1
	adds r0, r1
	lsls r0, 2
	adds r0, r5
	ldrb r1, [r0, 0x1]
	ands r4, r1
	strb r4, [r0, 0x1]
	ldr r4, _08032DD8 @ =0x000027f9
	adds r0, r4, 0
	bl FreeSpriteTilesByTag
	adds r0, r4, 0
	bl FreeSpritePaletteByTag
	ldr r0, _08032DDC @ =gBattleTypeFlags
	ldrh r1, [r0]
	movs r0, 0x40
	ands r0, r1
	cmp r0, 0
	beq _08032DE4
	ldr r0, _08032DE0 @ =gMPlay_BGM
	bl m4aMPlayContinue
	b _08032DF0
	.align 2, 0
_08032DC4: .4byte gSprites
_08032DC8: .4byte gUnknown_03004340
_08032DCC: .4byte gUnknown_02024A60
_08032DD0: .4byte SpriteCallbackDummy
_08032DD4: .4byte 0x02017810
_08032DD8: .4byte 0x000027f9
_08032DDC: .4byte gBattleTypeFlags
_08032DE0: .4byte gMPlay_BGM
_08032DE4:
	ldr r0, _08032E14 @ =gMPlay_BGM
	ldr r1, _08032E18 @ =0x0000ffff
	movs r2, 0x80
	lsls r2, 1
	bl m4aMPlayVolumeControl
_08032DF0:
	ldr r2, _08032E1C @ =gUnknown_02024A60
	ldrb r1, [r2]
	lsls r0, r1, 1
	adds r0, r1
	lsls r0, 2
	ldr r1, _08032E20 @ =0x02017810
	adds r0, r1
	movs r1, 0x3
	strb r1, [r0, 0x9]
	ldr r1, _08032E24 @ =gUnknown_03004330
	ldrb r0, [r2]
	lsls r0, 2
	adds r0, r1
	ldr r1, _08032E28 @ =sub_8032C4C
	str r1, [r0]
_08032E0E:
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_08032E14: .4byte gMPlay_BGM
_08032E18: .4byte 0x0000ffff
_08032E1C: .4byte gUnknown_02024A60
_08032E20: .4byte 0x02017810
_08032E24: .4byte gUnknown_03004330
_08032E28: .4byte sub_8032C4C
	thumb_func_end sub_8032C88

	thumb_func_start sub_8032E2C
sub_8032E2C: @ 8032E2C
	push {r4-r7,lr}
	mov r7, r9
	mov r6, r8
	push {r6,r7}
	ldr r0, _08032FEC @ =gUnknown_02024A60
	mov r9, r0
	ldrb r2, [r0]
	lsls r3, r2, 1
	adds r0, r3, r2
	lsls r0, 2
	ldr r4, _08032FF0 @ =0x02017810
	adds r0, r4
	ldrb r1, [r0]
	movs r5, 0x88
	adds r0, r5, 0
	ands r0, r1
	cmp r0, 0
	bne _08032E64
	ldr r0, _08032FF4 @ =gUnknown_02024A6A
	adds r0, r3, r0
	ldrh r1, [r0]
	movs r0, 0x64
	muls r1, r0
	ldr r0, _08032FF8 @ =gEnemyParty
	adds r1, r0
	adds r0, r2, 0
	bl sub_8141828
_08032E64:
	mov r1, r9
	ldrb r0, [r1]
	movs r7, 0x2
	adds r2, r7, 0
	eors r2, r0
	lsls r3, r2, 1
	adds r0, r3, r2
	lsls r0, 2
	adds r0, r4
	ldrb r1, [r0]
	adds r0, r5, 0
	ands r0, r1
	cmp r0, 0
	bne _08032E94
	ldr r0, _08032FF4 @ =gUnknown_02024A6A
	adds r0, r3, r0
	ldrh r1, [r0]
	movs r0, 0x64
	muls r1, r0
	ldr r0, _08032FF8 @ =gEnemyParty
	adds r1, r0
	adds r0, r2, 0
	bl sub_8141828
_08032E94:
	mov r0, r9
	ldrb r2, [r0]
	lsls r0, r2, 1
	adds r0, r2
	lsls r0, 2
	adds r0, r4
	ldrb r1, [r0]
	movs r3, 0x8
	adds r0, r3, 0
	ands r0, r1
	cmp r0, 0
	beq _08032EAE
	b _08032FE0
_08032EAE:
	adds r1, r7, 0
	eors r1, r2
	lsls r0, r1, 1
	adds r0, r1
	lsls r0, 2
	adds r0, r4
	ldrb r1, [r0]
	adds r0, r3, 0
	ands r0, r1
	cmp r0, 0
	beq _08032EC6
	b _08032FE0
_08032EC6:
	bl IsDoubleBattle
	lsls r0, 24
	cmp r0, 0
	beq _08032F58
	ldr r0, _08032FFC @ =gBattleTypeFlags
	ldrh r1, [r0]
	movs r0, 0x40
	ands r0, r1
	cmp r0, 0
	bne _08032F58
	ldr r1, _08033000 @ =gUnknown_0300434C
	mov r2, r9
	ldrb r0, [r2]
	eors r0, r7
	adds r0, r1
	ldrb r1, [r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	ldr r1, _08033004 @ =gSprites
	adds r0, r1
	bl DestroySprite
	ldr r4, _08033008 @ =gUnknown_03004340
	mov r1, r9
	ldrb r0, [r1]
	adds r1, r7, 0
	eors r1, r0
	adds r0, r1, r4
	ldrb r0, [r0]
	ldr r2, _08032FF4 @ =gUnknown_02024A6A
	mov r8, r2
	lsls r1, 1
	add r1, r8
	ldrh r1, [r1]
	movs r6, 0x64
	muls r1, r6
	ldr r5, _08032FF8 @ =gEnemyParty
	adds r1, r5
	movs r2, 0
	bl sub_8045A5C
	mov r1, r9
	ldrb r0, [r1]
	eors r0, r7
	bl sub_804777C
	mov r2, r9
	ldrb r0, [r2]
	eors r0, r7
	adds r0, r4
	ldrb r0, [r0]
	bl sub_8043DFC
	mov r1, r9
	ldrb r0, [r1]
	adds r4, r7, 0
	eors r4, r0
	lsls r0, r4, 1
	add r0, r8
	ldrh r0, [r0]
	muls r0, r6
	adds r0, r5
	movs r1, 0xB
	bl GetMonData
	adds r1, r0, 0
	lsls r1, 16
	lsrs r1, 16
	adds r0, r4, 0
	bl sub_8032984
_08032F58:
	ldr r1, _08033000 @ =gUnknown_0300434C
	ldr r4, _08032FEC @ =gUnknown_02024A60
	ldrb r0, [r4]
	adds r0, r1
	ldrb r1, [r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	ldr r1, _08033004 @ =gSprites
	adds r0, r1
	bl DestroySprite
	ldr r5, _08033008 @ =gUnknown_03004340
	ldrb r1, [r4]
	adds r0, r1, r5
	ldrb r0, [r0]
	ldr r2, _08032FF4 @ =gUnknown_02024A6A
	mov r9, r2
	lsls r1, 1
	add r1, r9
	ldrh r1, [r1]
	movs r2, 0x64
	mov r8, r2
	mov r2, r8
	muls r2, r1
	adds r1, r2, 0
	ldr r6, _08032FF8 @ =gEnemyParty
	adds r1, r6
	movs r2, 0
	bl sub_8045A5C
	ldrb r0, [r4]
	bl sub_804777C
	ldrb r0, [r4]
	adds r0, r5
	ldrb r0, [r0]
	bl sub_8043DFC
	ldrb r5, [r4]
	lsls r0, r5, 1
	add r0, r9
	ldrh r0, [r0]
	mov r1, r8
	muls r1, r0
	adds r0, r1, 0
	adds r0, r6
	movs r1, 0xB
	bl GetMonData
	adds r1, r0, 0
	lsls r1, 16
	lsrs r1, 16
	adds r0, r5, 0
	bl sub_8032984
	ldr r2, _0803300C @ =0x02017840
	ldrb r1, [r2, 0x9]
	movs r0, 0x2
	negs r0, r0
	ands r0, r1
	strb r0, [r2, 0x9]
	ldr r1, _08033010 @ =gUnknown_03004330
	ldrb r0, [r4]
	lsls r0, 2
	adds r0, r1
	ldr r1, _08033014 @ =sub_8032C88
	str r1, [r0]
_08032FE0:
	pop {r3,r4}
	mov r8, r3
	mov r9, r4
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_08032FEC: .4byte gUnknown_02024A60
_08032FF0: .4byte 0x02017810
_08032FF4: .4byte gUnknown_02024A6A
_08032FF8: .4byte gEnemyParty
_08032FFC: .4byte gBattleTypeFlags
_08033000: .4byte gUnknown_0300434C
_08033004: .4byte gSprites
_08033008: .4byte gUnknown_03004340
_0803300C: .4byte 0x02017840
_08033010: .4byte gUnknown_03004330
_08033014: .4byte sub_8032C88
	thumb_func_end sub_8032E2C

	thumb_func_start sub_8033018
sub_8033018: @ 8033018
	push {r4-r7,lr}
	ldr r2, _08033070 @ =gSprites
	ldr r0, _08033074 @ =gUnknown_02024BE0
	ldr r7, _08033078 @ =gUnknown_02024A60
	ldrb r3, [r7]
	adds r0, r3, r0
	ldrb r1, [r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r1, r0, r2
	adds r0, r1, 0
	adds r0, 0x3F
	ldrb r0, [r0]
	lsls r0, 27
	lsrs r2, r0, 31
	cmp r2, 0x1
	bne _080330BC
	movs r4, 0x24
	ldrsh r0, [r1, r4]
	cmp r0, 0
	bne _080330BC
	lsls r4, r3, 1
	adds r0, r4, r3
	lsls r0, 2
	ldr r6, _0803307C @ =0x02017810
	adds r1, r0, r6
	ldrb r5, [r1]
	movs r0, 0x80
	ands r0, r5
	cmp r0, 0
	bne _08033088
	ldr r0, _08033080 @ =gUnknown_02024A6A
	adds r0, r4, r0
	ldrh r1, [r0]
	movs r0, 0x64
	muls r1, r0
	ldr r0, _08033084 @ =gEnemyParty
	adds r1, r0
	adds r0, r3, 0
	bl sub_8141828
	b _080330BC
	.align 2, 0
_08033070: .4byte gSprites
_08033074: .4byte gUnknown_02024BE0
_08033078: .4byte gUnknown_02024A60
_0803307C: .4byte 0x02017810
_08033080: .4byte gUnknown_02024A6A
_08033084: .4byte gEnemyParty
_08033088:
	ldrb r0, [r1, 0x1]
	ands r2, r0
	cmp r2, 0
	beq _080330BC
	movs r0, 0x7F
	ands r0, r5
	strb r0, [r1]
	ldrb r0, [r7]
	lsls r1, r0, 1
	adds r1, r0
	lsls r1, 2
	adds r1, r6
	ldrb r2, [r1, 0x1]
	movs r0, 0x2
	negs r0, r0
	ands r0, r2
	strb r0, [r1, 0x1]
	ldr r4, _080330C4 @ =0x000027f9
	adds r0, r4, 0
	bl FreeSpriteTilesByTag
	adds r0, r4, 0
	bl FreeSpritePaletteByTag
	bl sub_80334EC
_080330BC:
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080330C4: .4byte 0x000027f9
	thumb_func_end sub_8033018

	thumb_func_start sub_80330C8
sub_80330C8: @ 80330C8
	push {r4-r6,lr}
	ldr r6, _08033108 @ =gUnknown_02024A60
	ldrb r0, [r6]
	ldr r5, _0803310C @ =gUnknown_03004340
	adds r1, r0, r5
	ldrb r1, [r1]
	movs r2, 0
	movs r3, 0
	bl sub_8045C78
	adds r4, r0, 0
	lsls r4, 16
	lsrs r4, 16
	ldrb r0, [r6]
	adds r0, r5
	ldrb r0, [r0]
	bl sub_8043DFC
	lsls r4, 16
	asrs r1, r4, 16
	movs r0, 0x1
	negs r0, r0
	cmp r1, r0
	beq _08033110
	ldrb r0, [r6]
	adds r0, r5
	ldrb r0, [r0]
	movs r2, 0
	bl sub_80440EC
	b _08033114
	.align 2, 0
_08033108: .4byte gUnknown_02024A60
_0803310C: .4byte gUnknown_03004340
_08033110:
	bl sub_80334EC
_08033114:
	pop {r4-r6}
	pop {r0}
	bx r0
	thumb_func_end sub_80330C8

	thumb_func_start sub_803311C
sub_803311C: @ 803311C
	push {lr}
	ldr r2, _08033150 @ =gSprites
	ldr r0, _08033154 @ =gUnknown_02024BE0
	ldr r1, _08033158 @ =gUnknown_02024A60
	ldrb r3, [r1]
	adds r0, r3, r0
	ldrb r1, [r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r2
	adds r0, 0x3E
	ldrb r0, [r0]
	lsls r0, 31
	cmp r0, 0
	bne _0803314A
	ldr r0, _0803315C @ =gUnknown_03004340
	adds r0, r3, r0
	ldrb r0, [r0]
	bl sub_8043DB0
	bl sub_80334EC
_0803314A:
	pop {r0}
	bx r0
	.align 2, 0
_08033150: .4byte gSprites
_08033154: .4byte gUnknown_02024BE0
_08033158: .4byte gUnknown_02024A60
_0803315C: .4byte gUnknown_03004340
	thumb_func_end sub_803311C

	thumb_func_start sub_8033160
sub_8033160: @ 8033160
	push {r4-r6,lr}
	ldr r6, _080331BC @ =gUnknown_02024A60
	ldrb r2, [r6]
	lsls r0, r2, 1
	adds r0, r2
	lsls r0, 2
	ldr r1, _080331C0 @ =0x02017810
	adds r0, r1
	ldrb r1, [r0]
	movs r0, 0x40
	ands r0, r1
	cmp r0, 0
	bne _080331B6
	ldr r5, _080331C4 @ =gUnknown_02024BE0
	adds r0, r2, r5
	ldrb r1, [r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	ldr r4, _080331C8 @ =gSprites
	adds r0, r4
	bl FreeSpriteOamMatrix
	ldrb r0, [r6]
	adds r0, r5
	ldrb r1, [r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r4
	bl DestroySprite
	ldrb r0, [r6]
	bl sub_8032A08
	ldr r1, _080331CC @ =gUnknown_03004340
	ldrb r0, [r6]
	adds r0, r1
	ldrb r0, [r0]
	bl sub_8043DB0
	bl sub_80334EC
_080331B6:
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_080331BC: .4byte gUnknown_02024A60
_080331C0: .4byte 0x02017810
_080331C4: .4byte gUnknown_02024BE0
_080331C8: .4byte gSprites
_080331CC: .4byte gUnknown_03004340
	thumb_func_end sub_8033160

	thumb_func_start sub_80331D0
sub_80331D0: @ 80331D0
	push {lr}
	ldr r0, _080331E4 @ =gUnknown_03004210
	ldrh r0, [r0, 0x16]
	cmp r0, 0
	bne _080331DE
	bl sub_80334EC
_080331DE:
	pop {r0}
	bx r0
	.align 2, 0
_080331E4: .4byte gUnknown_03004210
	thumb_func_end sub_80331D0

	thumb_func_start bx_blink_t7
bx_blink_t7: @ 80331E8
	push {r4,lr}
	ldr r1, _08033224 @ =gUnknown_02024BE0
	ldr r0, _08033228 @ =gUnknown_02024A60
	ldrb r0, [r0]
	adds r0, r1
	ldrb r1, [r0]
	ldr r2, _0803322C @ =gSprites
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r4, r0, r2
	movs r1, 0x30
	ldrsh r0, [r4, r1]
	cmp r0, 0x20
	bne _08033234
	movs r3, 0
	movs r0, 0
	strh r0, [r4, 0x30]
	adds r2, r4, 0
	adds r2, 0x3E
	ldrb r1, [r2]
	subs r0, 0x5
	ands r0, r1
	strb r0, [r2]
	ldr r0, _08033230 @ =gUnknown_02024E6D
	strb r3, [r0]
	bl sub_80334EC
	b _0803325E
	.align 2, 0
_08033224: .4byte gUnknown_02024BE0
_08033228: .4byte gUnknown_02024A60
_0803322C: .4byte gSprites
_08033230: .4byte gUnknown_02024E6D
_08033234:
	ldrh r0, [r4, 0x30]
	movs r1, 0x3
	ands r0, r1
	cmp r0, 0
	bne _08033258
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
_08033258:
	ldrh r0, [r4, 0x30]
	adds r0, 0x1
	strh r0, [r4, 0x30]
_0803325E:
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end bx_blink_t7

	thumb_func_start sub_8033264
sub_8033264: @ 8033264
	push {r4,lr}
	ldr r2, _080332B4 @ =gSprites
	ldr r0, _080332B8 @ =gUnknown_03004340
	ldr r4, _080332BC @ =gUnknown_02024A60
	ldrb r3, [r4]
	adds r0, r3, r0
	ldrb r1, [r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r2, 0x1C
	adds r0, r2
	ldr r1, [r0]
	ldr r0, _080332C0 @ =SpriteCallbackDummy
	cmp r1, r0
	bne _080332AC
	lsls r0, r3, 2
	ldr r1, _080332C4 @ =0x02017800
	adds r0, r1
	ldrb r1, [r0]
	movs r0, 0x4
	ands r0, r1
	cmp r0, 0
	beq _080332A0
	adds r0, r3, 0
	adds r1, r3, 0
	adds r2, r3, 0
	movs r3, 0x6
	bl move_anim_start_t4
_080332A0:
	ldr r0, _080332C8 @ =gUnknown_03004330
	ldrb r1, [r4]
	lsls r1, 2
	adds r1, r0
	ldr r0, _080332CC @ =sub_80332D0
	str r0, [r1]
_080332AC:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080332B4: .4byte gSprites
_080332B8: .4byte gUnknown_03004340
_080332BC: .4byte gUnknown_02024A60
_080332C0: .4byte SpriteCallbackDummy
_080332C4: .4byte 0x02017800
_080332C8: .4byte gUnknown_03004330
_080332CC: .4byte sub_80332D0
	thumb_func_end sub_8033264

	thumb_func_start sub_80332D0
sub_80332D0: @ 80332D0
	push {lr}
	ldr r0, _080332FC @ =gUnknown_02024A60
	ldrb r1, [r0]
	lsls r0, r1, 1
	adds r0, r1
	lsls r0, 2
	ldr r1, _08033300 @ =0x02017810
	adds r0, r1
	ldrb r1, [r0]
	movs r0, 0x40
	ands r0, r1
	cmp r0, 0
	bne _080332F6
	ldr r0, _08033304 @ =c3_0802FDF4
	movs r1, 0xA
	bl CreateTask
	bl sub_80334EC
_080332F6:
	pop {r0}
	bx r0
	.align 2, 0
_080332FC: .4byte gUnknown_02024A60
_08033300: .4byte 0x02017810
_08033304: .4byte c3_0802FDF4
	thumb_func_end sub_80332D0

	thumb_func_start sub_8033308
sub_8033308: @ 8033308
	push {r4,r5,lr}
	ldr r5, _080333AC @ =gUnknown_02024A60
	ldrb r1, [r5]
	lsls r0, r1, 1
	adds r0, r1
	lsls r0, 2
	ldr r3, _080333B0 @ =0x02017810
	adds r2, r0, r3
	ldrb r1, [r2, 0x1]
	movs r0, 0x1
	ands r0, r1
	cmp r0, 0
	beq _080333A4
	ldrb r1, [r2]
	movs r0, 0x7F
	ands r0, r1
	strb r0, [r2]
	ldrb r0, [r5]
	lsls r1, r0, 1
	adds r1, r0
	lsls r1, 2
	adds r1, r3
	ldrb r2, [r1, 0x1]
	movs r0, 0x2
	negs r0, r0
	ands r0, r2
	strb r0, [r1, 0x1]
	ldr r4, _080333B4 @ =0x000027f9
	adds r0, r4, 0
	bl FreeSpriteTilesByTag
	adds r0, r4, 0
	bl FreeSpritePaletteByTag
	ldr r1, _080333B8 @ =gUnknown_02024BE0
	ldrb r0, [r5]
	adds r0, r1
	ldrb r1, [r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	ldr r1, _080333BC @ =gSprites
	adds r0, r1
	movs r1, 0
	bl StartSpriteAnim
	ldr r4, _080333C0 @ =gUnknown_03004340
	ldrb r1, [r5]
	adds r0, r1, r4
	ldrb r0, [r0]
	ldr r2, _080333C4 @ =gUnknown_02024A6A
	lsls r1, 1
	adds r1, r2
	ldrh r2, [r1]
	movs r1, 0x64
	muls r1, r2
	ldr r2, _080333C8 @ =gEnemyParty
	adds r1, r2
	movs r2, 0
	bl sub_8045A5C
	ldrb r0, [r5]
	bl sub_804777C
	ldrb r0, [r5]
	adds r0, r4
	ldrb r0, [r0]
	bl sub_8043DFC
	ldrb r0, [r5]
	bl sub_8031F88
	ldr r1, _080333CC @ =gUnknown_03004330
	ldrb r0, [r5]
	lsls r0, 2
	adds r0, r1
	ldr r1, _080333D0 @ =sub_8033264
	str r1, [r0]
_080333A4:
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080333AC: .4byte gUnknown_02024A60
_080333B0: .4byte 0x02017810
_080333B4: .4byte 0x000027f9
_080333B8: .4byte gUnknown_02024BE0
_080333BC: .4byte gSprites
_080333C0: .4byte gUnknown_03004340
_080333C4: .4byte gUnknown_02024A6A
_080333C8: .4byte gEnemyParty
_080333CC: .4byte gUnknown_03004330
_080333D0: .4byte sub_8033264
	thumb_func_end sub_8033308

	thumb_func_start sub_80333D4
sub_80333D4: @ 80333D4
	push {r4-r6,lr}
	ldr r5, _08033470 @ =gUnknown_02024A60
	ldrb r2, [r5]
	lsls r3, r2, 1
	adds r0, r3, r2
	lsls r0, 2
	ldr r6, _08033474 @ =0x02017810
	adds r0, r6
	ldrb r1, [r0]
	movs r0, 0x88
	ands r0, r1
	cmp r0, 0
	bne _08033402
	ldr r0, _08033478 @ =gUnknown_02024A6A
	adds r0, r3, r0
	ldrh r1, [r0]
	movs r0, 0x64
	muls r1, r0
	ldr r0, _0803347C @ =gEnemyParty
	adds r1, r0
	adds r0, r2, 0
	bl sub_8141828
_08033402:
	ldr r4, _08033480 @ =gSprites
	ldr r0, _08033484 @ =gUnknown_0300434C
	ldrb r2, [r5]
	adds r0, r2, r0
	ldrb r1, [r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r3, r0, 2
	adds r0, r4, 0
	adds r0, 0x1C
	adds r0, r3, r0
	ldr r1, [r0]
	ldr r0, _08033488 @ =SpriteCallbackDummy
	cmp r1, r0
	bne _08033468
	lsls r0, r2, 1
	adds r0, r2
	lsls r0, 2
	adds r0, r6
	ldrb r1, [r0]
	movs r0, 0x8
	ands r0, r1
	cmp r0, 0
	bne _08033468
	adds r0, r3, r4
	bl DestroySprite
	ldrb r4, [r5]
	ldr r1, _08033478 @ =gUnknown_02024A6A
	lsls r0, r4, 1
	adds r0, r1
	ldrh r1, [r0]
	movs r0, 0x64
	muls r0, r1
	ldr r1, _0803347C @ =gEnemyParty
	adds r0, r1
	movs r1, 0xB
	bl GetMonData
	adds r1, r0, 0
	lsls r1, 16
	lsrs r1, 16
	adds r0, r4, 0
	bl sub_8032984
	ldr r1, _0803348C @ =gUnknown_03004330
	ldrb r0, [r5]
	lsls r0, 2
	adds r0, r1
	ldr r1, _08033490 @ =sub_8033308
	str r1, [r0]
_08033468:
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_08033470: .4byte gUnknown_02024A60
_08033474: .4byte 0x02017810
_08033478: .4byte gUnknown_02024A6A
_0803347C: .4byte gEnemyParty
_08033480: .4byte gSprites
_08033484: .4byte gUnknown_0300434C
_08033488: .4byte SpriteCallbackDummy
_0803348C: .4byte gUnknown_03004330
_08033490: .4byte sub_8033308
	thumb_func_end sub_80333D4

	thumb_func_start sub_8033494
sub_8033494: @ 8033494
	push {lr}
	ldr r0, _080334B8 @ =gUnknown_02024A60
	ldrb r1, [r0]
	lsls r0, r1, 1
	adds r0, r1
	lsls r0, 2
	ldr r1, _080334BC @ =0x02017810
	adds r0, r1
	ldrb r1, [r0]
	movs r0, 0x10
	ands r0, r1
	cmp r0, 0
	bne _080334B2
	bl sub_80334EC
_080334B2:
	pop {r0}
	bx r0
	.align 2, 0
_080334B8: .4byte gUnknown_02024A60
_080334BC: .4byte 0x02017810
	thumb_func_end sub_8033494

	thumb_func_start sub_80334C0
sub_80334C0: @ 80334C0
	push {lr}
	ldr r0, _080334E4 @ =gUnknown_02024A60
	ldrb r1, [r0]
	lsls r0, r1, 1
	adds r0, r1
	lsls r0, 2
	ldr r1, _080334E8 @ =0x02017810
	adds r0, r1
	ldrb r1, [r0]
	movs r0, 0x20
	ands r0, r1
	cmp r0, 0
	bne _080334DE
	bl sub_80334EC
_080334DE:
	pop {r0}
	bx r0
	.align 2, 0
_080334E4: .4byte gUnknown_02024A60
_080334E8: .4byte 0x02017810
	thumb_func_end sub_80334C0

	thumb_func_start sub_80334EC
sub_80334EC: @ 80334EC
	ldr r1, _08033510 @ =gUnknown_03004330
	ldr r2, _08033514 @ =gUnknown_02024A60
	ldrb r0, [r2]
	lsls r0, 2
	adds r0, r1
	ldr r1, _08033518 @ =sub_8032AFC
	str r1, [r0]
	ldr r3, _0803351C @ =gUnknown_02024A64
	ldr r1, _08033520 @ =gBitTable
	ldrb r0, [r2]
	lsls r0, 2
	adds r0, r1
	ldr r1, [r0]
	ldr r0, [r3]
	bics r0, r1
	str r0, [r3]
	bx lr
	.align 2, 0
_08033510: .4byte gUnknown_03004330
_08033514: .4byte gUnknown_02024A60
_08033518: .4byte sub_8032AFC
_0803351C: .4byte gUnknown_02024A64
_08033520: .4byte gBitTable
	thumb_func_end sub_80334EC
	
	.align 2, 0 @ Don't pad with nop.
