	.include "constants/gba_constants.inc"
	.include "constants/species_constants.inc"
	.include "asm/macros.inc"

	.syntax unified

	.text

	thumb_func_start unref_sub_8137220
unref_sub_8137220: @ 8137220
	bx lr
	thumb_func_end unref_sub_8137220

	thumb_func_start sub_8137224
sub_8137224: @ 8137224
	ldr r1, _08137250 @ =gUnknown_03004330
	ldr r0, _08137254 @ =gUnknown_02024A60
	ldrb r0, [r0]
	lsls r0, 2
	adds r0, r1
	ldr r1, _08137258 @ =sub_813726C
	str r1, [r0]
	ldr r1, _0813725C @ =0x02000000
	ldr r2, _08137260 @ =0x000160a8
	adds r0, r1, r2
	movs r2, 0
	strb r2, [r0]
	ldr r3, _08137264 @ =0x000160a9
	adds r0, r1, r3
	strb r2, [r0]
	adds r3, 0x1
	adds r0, r1, r3
	strb r2, [r0]
	ldr r0, _08137268 @ =0x000160ab
	adds r1, r0
	strb r2, [r1]
	bx lr
	.align 2, 0
_08137250: .4byte gUnknown_03004330
_08137254: .4byte gUnknown_02024A60
_08137258: .4byte sub_813726C
_0813725C: .4byte 0x02000000
_08137260: .4byte 0x000160a8
_08137264: .4byte 0x000160a9
_08137268: .4byte 0x000160ab
	thumb_func_end sub_8137224

	thumb_func_start sub_813726C
sub_813726C: @ 813726C
	push {lr}
	ldr r2, _081372A0 @ =gUnknown_02024A64
	ldr r1, _081372A4 @ =gBitTable
	ldr r0, _081372A8 @ =gUnknown_02024A60
	ldrb r3, [r0]
	lsls r0, r3, 2
	adds r0, r1
	ldr r1, [r2]
	ldr r0, [r0]
	ands r1, r0
	cmp r1, 0
	beq _081372B8
	ldr r0, _081372AC @ =gUnknown_02023A60
	lsls r1, r3, 9
	adds r1, r0
	ldrb r0, [r1]
	cmp r0, 0x38
	bhi _081372B4
	ldr r0, _081372B0 @ =gUnknown_084061A4
	ldrb r1, [r1]
	lsls r1, 2
	adds r1, r0
	ldr r0, [r1]
	bl _call_via_r0
	b _081372B8
	.align 2, 0
_081372A0: .4byte gUnknown_02024A64
_081372A4: .4byte gBitTable
_081372A8: .4byte gUnknown_02024A60
_081372AC: .4byte gUnknown_02023A60
_081372B0: .4byte gUnknown_084061A4
_081372B4:
	bl dp01_tbl5_exec_completed
_081372B8:
	pop {r0}
	bx r0
	thumb_func_end sub_813726C

	thumb_func_start sub_81372BC
sub_81372BC: @ 81372BC
	push {r4-r6,lr}
	ldr r1, _081372D8 @ =0x02000000
	ldr r2, _081372DC @ =0x000160a8
	adds r0, r1, r2
	ldrb r0, [r0]
	adds r5, r1, 0
	cmp r0, 0x5
	bls _081372CE
	b _08137410
_081372CE:
	lsls r0, 2
	ldr r1, _081372E0 @ =_081372E4
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_081372D8: .4byte 0x02000000
_081372DC: .4byte 0x000160a8
_081372E0: .4byte _081372E4
	.align 2, 0
_081372E4:
	.4byte _081372FC
	.4byte _0813730E
	.4byte _08137344
	.4byte _08137368
	.4byte _081373AC
	.4byte _081373E8
_081372FC:
	ldr r0, _0813733C @ =0x000160aa
	adds r1, r5, r0
	movs r0, 0x40
	strb r0, [r1]
	ldr r2, _08137340 @ =0x000160a8
	adds r1, r5, r2
	ldrb r0, [r1]
	adds r0, 0x1
	strb r0, [r1]
_0813730E:
	ldr r0, _0813733C @ =0x000160aa
	adds r6, r5, r0
	ldrb r0, [r6]
	subs r0, 0x1
	strb r0, [r6]
	lsls r0, 24
	lsrs r4, r0, 24
	cmp r4, 0
	bne _08137410
	movs r0, 0x5
	bl PlaySoundEffect
	movs r0, 0x1
	movs r1, 0
	movs r2, 0
	bl dp01_build_cmdbuf_x21_a_bb
	bl dp01_tbl5_exec_completed
	ldr r2, _08137340 @ =0x000160a8
	adds r1, r5, r2
	b _0813738C
	.align 2, 0
_0813733C: .4byte 0x000160aa
_08137340: .4byte 0x000160a8
_08137344:
	ldr r2, _08137364 @ =0x000160aa
	adds r6, r5, r2
	ldrb r0, [r6]
	subs r0, 0x1
	strb r0, [r6]
	lsls r0, 24
	lsrs r4, r0, 24
	cmp r4, 0
	bne _08137410
	movs r0, 0x5
	bl PlaySoundEffect
	movs r0, 0x1
	movs r1, 0
	b _0813737E
	.align 2, 0
_08137364: .4byte 0x000160aa
_08137368:
	ldr r2, _081373A0 @ =0x000160aa
	adds r6, r5, r2
	ldrb r0, [r6]
	subs r0, 0x1
	strb r0, [r6]
	lsls r0, 24
	lsrs r4, r0, 24
	cmp r4, 0
	bne _08137410
	movs r0, 0x1
	movs r1, 0x9
_0813737E:
	movs r2, 0
	bl dp01_build_cmdbuf_x21_a_bb
	bl dp01_tbl5_exec_completed
	ldr r0, _081373A4 @ =0x000160a8
	adds r1, r5, r0
_0813738C:
	ldrb r0, [r1]
	adds r0, 0x1
	strb r0, [r1]
	ldr r1, _081373A8 @ =0x000160a9
	adds r0, r5, r1
	strb r4, [r0]
	movs r0, 0x40
	strb r0, [r6]
	b _08137410
	.align 2, 0
_081373A0: .4byte 0x000160aa
_081373A4: .4byte 0x000160a8
_081373A8: .4byte 0x000160a9
_081373AC:
	ldr r2, _081373E0 @ =0x000160aa
	adds r4, r5, r2
	ldrb r0, [r4]
	subs r0, 0x1
	strb r0, [r4]
	lsls r0, 24
	cmp r0, 0
	bne _08137410
	movs r0, 0x5
	bl PlaySoundEffect
	movs r0, 0
	bl nullsub_8
	movs r0, 0x1
	movs r1, 0
	bl sub_802E3E4
	movs r0, 0x40
	strb r0, [r4]
	ldr r0, _081373E4 @ =0x000160a8
	adds r1, r5, r0
	ldrb r0, [r1]
	adds r0, 0x1
	strb r0, [r1]
	b _08137410
	.align 2, 0
_081373E0: .4byte 0x000160aa
_081373E4: .4byte 0x000160a8
_081373E8:
	ldr r2, _08137418 @ =0x000160aa
	adds r1, r5, r2
	ldrb r0, [r1]
	subs r0, 0x1
	strb r0, [r1]
	lsls r0, 24
	cmp r0, 0
	bne _08137410
	movs r0, 0x5
	bl PlaySoundEffect
	bl sub_814A7FC
	movs r0, 0x1
	movs r1, 0x1
	movs r2, 0
	bl dp01_build_cmdbuf_x21_a_bb
	bl dp01_tbl5_exec_completed
_08137410:
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_08137418: .4byte 0x000160aa
	thumb_func_end sub_81372BC

	thumb_func_start sub_813741C
sub_813741C: @ 813741C
	push {lr}
	ldr r2, _08137444 @ =gSprites
	ldr r1, _08137448 @ =gUnknown_02024BE0
	ldr r0, _0813744C @ =gUnknown_02024A60
	ldrb r0, [r0]
	adds r0, r1
	ldrb r1, [r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r2, 0x1C
	adds r0, r2
	ldr r1, [r0]
	ldr r0, _08137450 @ =SpriteCallbackDummy
	cmp r1, r0
	bne _08137440
	bl dp01_tbl5_exec_completed
_08137440:
	pop {r0}
	bx r0
	.align 2, 0
_08137444: .4byte gSprites
_08137448: .4byte gUnknown_02024BE0
_0813744C: .4byte gUnknown_02024A60
_08137450: .4byte SpriteCallbackDummy
	thumb_func_end sub_813741C

	thumb_func_start sub_8137454
sub_8137454: @ 8137454
	push {lr}
	ldr r0, _08137468 @ =gUnknown_03004210
	ldrh r0, [r0, 0x16]
	cmp r0, 0
	bne _08137462
	bl dp01_tbl5_exec_completed
_08137462:
	pop {r0}
	bx r0
	.align 2, 0
_08137468: .4byte gUnknown_03004210
	thumb_func_end sub_8137454

	thumb_func_start sub_813746C
sub_813746C: @ 813746C
	push {lr}
	ldr r0, _0813749C @ =gPaletteFade
	ldrb r1, [r0, 0x7]
	movs r0, 0x80
	ands r0, r1
	cmp r0, 0
	bne _08137496
	ldr r2, _081374A0 @ =gMain
	ldr r0, _081374A4 @ =0x0000043d
	adds r3, r2, r0
	ldrb r1, [r3]
	movs r0, 0x3
	negs r0, r0
	ands r0, r1
	strb r0, [r3]
	ldr r0, _081374A8 @ =gUnknown_030042D0
	ldr r0, [r0]
	str r0, [r2]
	ldr r0, [r2, 0x8]
	bl SetMainCallback2
_08137496:
	pop {r0}
	bx r0
	.align 2, 0
_0813749C: .4byte gPaletteFade
_081374A0: .4byte gMain
_081374A4: .4byte 0x0000043d
_081374A8: .4byte gUnknown_030042D0
	thumb_func_end sub_813746C

	thumb_func_start bx_wait_t5
bx_wait_t5: @ 81374AC
	push {lr}
	ldr r0, _081374C0 @ =gUnknown_02024E6D
	ldrb r0, [r0]
	cmp r0, 0
	bne _081374BA
	bl dp01_tbl5_exec_completed
_081374BA:
	pop {r0}
	bx r0
	.align 2, 0
_081374C0: .4byte gUnknown_02024E6D
	thumb_func_end bx_wait_t5

	thumb_func_start sub_81374C4
sub_81374C4: @ 81374C4
	push {lr}
	ldr r0, _081374EC @ =gPaletteFade
	ldrb r1, [r0, 0x7]
	movs r0, 0x80
	ands r0, r1
	cmp r0, 0
	bne _081374E8
	ldr r1, _081374F0 @ =gUnknown_03004330
	ldr r0, _081374F4 @ =gUnknown_02024A60
	ldrb r0, [r0]
	lsls r0, 2
	adds r0, r1
	ldr r1, _081374F8 @ =sub_81374FC
	str r1, [r0]
	bl nullsub_14
	bl PrepareBagForWallyTutorial
_081374E8:
	pop {r0}
	bx r0
	.align 2, 0
_081374EC: .4byte gPaletteFade
_081374F0: .4byte gUnknown_03004330
_081374F4: .4byte gUnknown_02024A60
_081374F8: .4byte sub_81374FC
	thumb_func_end sub_81374C4

	thumb_func_start sub_81374FC
sub_81374FC: @ 81374FC
	push {lr}
	ldr r0, _08137528 @ =gMain
	ldr r1, [r0, 0x4]
	ldr r0, _0813752C @ =sub_800F808
	cmp r1, r0
	bne _08137522
	ldr r0, _08137530 @ =gPaletteFade
	ldrb r1, [r0, 0x7]
	movs r0, 0x80
	ands r0, r1
	cmp r0, 0
	bne _08137522
	ldr r0, _08137534 @ =gScriptItemId
	ldrh r1, [r0]
	movs r0, 0x1
	bl dp01_build_cmdbuf_x23_aa_0
	bl dp01_tbl5_exec_completed
_08137522:
	pop {r0}
	bx r0
	.align 2, 0
_08137528: .4byte gMain
_0813752C: .4byte sub_800F808
_08137530: .4byte gPaletteFade
_08137534: .4byte gScriptItemId
	thumb_func_end sub_81374FC

	thumb_func_start sub_8137538
sub_8137538: @ 8137538
	push {r4-r7,lr}
	ldr r5, _0813768C @ =gUnknown_02024A60
	ldrb r2, [r5]
	lsls r3, r2, 1
	adds r0, r3, r2
	lsls r0, 2
	ldr r4, _08137690 @ =0x02017810
	adds r0, r4
	ldrb r1, [r0]
	movs r7, 0x88
	adds r0, r7, 0
	ands r0, r1
	cmp r0, 0
	bne _08137568
	ldr r0, _08137694 @ =gUnknown_02024A6A
	adds r0, r3, r0
	ldrh r1, [r0]
	movs r0, 0x64
	muls r1, r0
	ldr r0, _08137698 @ =gPlayerParty
	adds r1, r0
	adds r0, r2, 0
	bl sub_8141828
_08137568:
	ldrb r0, [r5]
	movs r6, 0x2
	adds r2, r6, 0
	eors r2, r0
	lsls r3, r2, 1
	adds r0, r3, r2
	lsls r0, 2
	adds r0, r4
	ldrb r1, [r0]
	adds r0, r7, 0
	ands r0, r1
	cmp r0, 0
	bne _08137596
	ldr r0, _08137694 @ =gUnknown_02024A6A
	adds r0, r3, r0
	ldrh r1, [r0]
	movs r0, 0x64
	muls r1, r0
	ldr r0, _08137698 @ =gPlayerParty
	adds r1, r0
	adds r0, r2, 0
	bl sub_8141828
_08137596:
	ldrb r2, [r5]
	lsls r0, r2, 1
	adds r0, r2
	lsls r0, 2
	adds r0, r4
	ldrb r1, [r0]
	movs r3, 0x8
	adds r0, r3, 0
	ands r0, r1
	cmp r0, 0
	bne _08137684
	adds r1, r6, 0
	eors r1, r2
	lsls r0, r1, 1
	adds r0, r1
	lsls r0, 2
	adds r0, r4
	ldrb r1, [r0]
	adds r0, r3, 0
	ands r0, r1
	cmp r0, 0
	bne _08137684
	bl IsDoubleBattle
	lsls r0, 24
	cmp r0, 0
	beq _08137626
	ldr r0, _0813769C @ =gBattleTypeFlags
	ldrh r1, [r0]
	movs r0, 0x40
	ands r0, r1
	cmp r0, 0
	bne _08137626
	ldr r1, _081376A0 @ =gUnknown_0300434C
	ldrb r0, [r5]
	eors r0, r6
	adds r0, r1
	ldrb r1, [r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	ldr r1, _081376A4 @ =gSprites
	adds r0, r1
	bl DestroySprite
	ldr r4, _081376A8 @ =gUnknown_03004340
	ldrb r0, [r5]
	adds r1, r6, 0
	eors r1, r0
	adds r0, r1, r4
	ldrb r0, [r0]
	ldr r2, _08137694 @ =gUnknown_02024A6A
	lsls r1, 1
	adds r1, r2
	ldrh r2, [r1]
	movs r1, 0x64
	muls r1, r2
	ldr r2, _08137698 @ =gPlayerParty
	adds r1, r2
	movs r2, 0
	bl sub_8045A5C
	ldrb r0, [r5]
	eors r0, r6
	bl sub_804777C
	ldrb r0, [r5]
	eors r0, r6
	adds r0, r4
	ldrb r0, [r0]
	bl sub_8043DFC
_08137626:
	ldr r1, _081376A0 @ =gUnknown_0300434C
	ldr r4, _0813768C @ =gUnknown_02024A60
	ldrb r0, [r4]
	adds r0, r1
	ldrb r1, [r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	ldr r1, _081376A4 @ =gSprites
	adds r0, r1
	bl DestroySprite
	ldr r5, _081376A8 @ =gUnknown_03004340
	ldrb r1, [r4]
	adds r0, r1, r5
	ldrb r0, [r0]
	ldr r2, _08137694 @ =gUnknown_02024A6A
	lsls r1, 1
	adds r1, r2
	ldrh r2, [r1]
	movs r1, 0x64
	muls r1, r2
	ldr r2, _08137698 @ =gPlayerParty
	adds r1, r2
	movs r2, 0
	bl sub_8045A5C
	ldrb r0, [r4]
	bl sub_804777C
	ldrb r0, [r4]
	adds r0, r5
	ldrb r0, [r0]
	bl sub_8043DFC
	ldr r2, _081376AC @ =0x02017840
	ldrb r1, [r2, 0x9]
	movs r0, 0x2
	negs r0, r0
	ands r0, r1
	strb r0, [r2, 0x9]
	ldr r1, _081376B0 @ =gUnknown_03004330
	ldrb r0, [r4]
	lsls r0, 2
	adds r0, r1
	ldr r1, _081376B4 @ =sub_81376B8
	str r1, [r0]
_08137684:
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_0813768C: .4byte gUnknown_02024A60
_08137690: .4byte 0x02017810
_08137694: .4byte gUnknown_02024A6A
_08137698: .4byte gPlayerParty
_0813769C: .4byte gBattleTypeFlags
_081376A0: .4byte gUnknown_0300434C
_081376A4: .4byte gSprites
_081376A8: .4byte gUnknown_03004340
_081376AC: .4byte 0x02017840
_081376B0: .4byte gUnknown_03004330
_081376B4: .4byte sub_81376B8
	thumb_func_end sub_8137538

	thumb_func_start sub_81376B8
sub_81376B8: @ 81376B8
	push {r4-r7,lr}
	movs r4, 0
	ldr r2, _0813778C @ =gSprites
	ldr r0, _08137790 @ =gUnknown_03004340
	ldr r7, _08137794 @ =gUnknown_02024A60
	ldrb r3, [r7]
	adds r0, r3, r0
	ldrb r1, [r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r2, 0x1C
	adds r0, r2
	ldr r1, [r0]
	ldr r0, _08137798 @ =SpriteCallbackDummy
	cmp r1, r0
	bne _081376DC
	movs r4, 0x1
_081376DC:
	cmp r4, 0
	beq _08137784
	lsls r0, r3, 1
	adds r0, r3
	lsls r0, 2
	ldr r5, _0813779C @ =0x02017810
	adds r2, r0, r5
	ldrb r1, [r2, 0x1]
	movs r4, 0x1
	adds r0, r4, 0
	ands r0, r1
	cmp r0, 0
	beq _08137784
	movs r6, 0x2
	adds r1, r6, 0
	eors r1, r3
	lsls r0, r1, 1
	adds r0, r1
	lsls r0, 2
	adds r0, r5
	ldrb r1, [r0, 0x1]
	adds r0, r4, 0
	ands r0, r1
	cmp r0, 0
	beq _08137784
	ldrb r1, [r2]
	movs r3, 0x7F
	adds r0, r3, 0
	ands r0, r1
	strb r0, [r2]
	ldrb r0, [r7]
	lsls r1, r0, 1
	adds r1, r0
	lsls r1, 2
	adds r1, r5
	ldrb r2, [r1, 0x1]
	subs r4, 0x3
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
	ldr r4, _081377A0 @ =0x000027f9
	adds r0, r4, 0
	bl FreeSpriteTilesByTag
	adds r0, r4, 0
	bl FreeSpritePaletteByTag
	ldr r0, _081377A4 @ =c3_0802FDF4
	movs r1, 0xA
	bl CreateTask
	ldr r2, _081377A8 @ =gUnknown_02024A6A
	ldrb r1, [r7]
	lsls r0, r1, 1
	adds r0, r2
	ldrh r2, [r0]
	movs r0, 0x64
	muls r0, r2
	ldr r2, _081377AC @ =gPlayerParty
	adds r0, r2
	bl sub_80324F8
	bl dp01_tbl5_exec_completed
_08137784:
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_0813778C: .4byte gSprites
_08137790: .4byte gUnknown_03004340
_08137794: .4byte gUnknown_02024A60
_08137798: .4byte SpriteCallbackDummy
_0813779C: .4byte 0x02017810
_081377A0: .4byte 0x000027f9
_081377A4: .4byte c3_0802FDF4
_081377A8: .4byte gUnknown_02024A6A
_081377AC: .4byte gPlayerParty
	thumb_func_end sub_81376B8

	thumb_func_start sub_81377B0
sub_81377B0: @ 81377B0
	push {r4-r6,lr}
	ldr r5, _081377F0 @ =gUnknown_02024A60
	ldrb r0, [r5]
	ldr r6, _081377F4 @ =gUnknown_03004340
	adds r1, r0, r6
	ldrb r1, [r1]
	movs r2, 0
	movs r3, 0
	bl sub_8045C78
	adds r4, r0, 0
	lsls r4, 16
	lsrs r4, 16
	ldrb r0, [r5]
	adds r0, r6
	ldrb r0, [r0]
	bl sub_8043DFC
	lsls r4, 16
	asrs r1, r4, 16
	movs r0, 0x1
	negs r0, r0
	cmp r1, r0
	beq _081377F8
	ldrb r0, [r5]
	adds r0, r6
	ldrb r0, [r0]
	movs r2, 0
	bl sub_80440EC
	b _08137812
	.align 2, 0
_081377F0: .4byte gUnknown_02024A60
_081377F4: .4byte gUnknown_03004340
_081377F8:
	ldr r2, _08137818 @ =gUnknown_02024A6A
	ldrb r1, [r5]
	lsls r0, r1, 1
	adds r0, r2
	ldrh r2, [r0]
	movs r0, 0x64
	muls r0, r2
	ldr r2, _0813781C @ =gPlayerParty
	adds r0, r2
	bl sub_80324F8
	bl dp01_tbl5_exec_completed
_08137812:
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_08137818: .4byte gUnknown_02024A6A
_0813781C: .4byte gPlayerParty
	thumb_func_end sub_81377B0

	thumb_func_start bx_blink_t5
bx_blink_t5: @ 8137820
	push {r4,lr}
	ldr r1, _0813785C @ =gUnknown_02024BE0
	ldr r0, _08137860 @ =gUnknown_02024A60
	ldrb r0, [r0]
	adds r0, r1
	ldrb r1, [r0]
	ldr r2, _08137864 @ =gSprites
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r4, r0, r2
	movs r1, 0x30
	ldrsh r0, [r4, r1]
	cmp r0, 0x20
	bne _0813786C
	movs r3, 0
	movs r0, 0
	strh r0, [r4, 0x30]
	adds r2, r4, 0
	adds r2, 0x3E
	ldrb r1, [r2]
	subs r0, 0x5
	ands r0, r1
	strb r0, [r2]
	ldr r0, _08137868 @ =gUnknown_02024E6D
	strb r3, [r0]
	bl dp01_tbl5_exec_completed
	b _08137896
	.align 2, 0
_0813785C: .4byte gUnknown_02024BE0
_08137860: .4byte gUnknown_02024A60
_08137864: .4byte gSprites
_08137868: .4byte gUnknown_02024E6D
_0813786C:
	ldrh r0, [r4, 0x30]
	movs r1, 0x3
	ands r0, r1
	cmp r0, 0
	bne _08137890
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
_08137890:
	ldrh r0, [r4, 0x30]
	adds r0, 0x1
	strh r0, [r4, 0x30]
_08137896:
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end bx_blink_t5

	thumb_func_start sub_813789C
sub_813789C: @ 813789C
	push {r4-r6,lr}
	ldr r6, _081378F4 @ =gUnknown_02024A60
	ldrb r2, [r6]
	lsls r0, r2, 1
	adds r0, r2
	lsls r0, 2
	ldr r1, _081378F8 @ =0x02017810
	adds r0, r1
	ldrb r1, [r0]
	movs r0, 0x40
	ands r0, r1
	cmp r0, 0
	bne _081378EC
	ldr r5, _081378FC @ =gUnknown_02024BE0
	adds r0, r2, r5
	ldrb r1, [r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	ldr r4, _08137900 @ =gSprites
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
	ldr r1, _08137904 @ =gUnknown_03004340
	ldrb r0, [r6]
	adds r0, r1
	ldrb r0, [r0]
	bl sub_8043DB0
	bl dp01_tbl5_exec_completed
_081378EC:
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_081378F4: .4byte gUnknown_02024A60
_081378F8: .4byte 0x02017810
_081378FC: .4byte gUnknown_02024BE0
_08137900: .4byte gSprites
_08137904: .4byte gUnknown_03004340
	thumb_func_end sub_813789C

	thumb_func_start sub_8137908
sub_8137908: @ 8137908
	push {lr}
	ldr r2, _08137930 @ =gSprites
	ldr r1, _08137934 @ =gUnknown_02024BE0
	ldr r0, _08137938 @ =gUnknown_02024A60
	ldrb r0, [r0]
	adds r0, r1
	ldrb r1, [r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r2, 0x1C
	adds r0, r2
	ldr r1, [r0]
	ldr r0, _0813793C @ =SpriteCallbackDummy
	cmp r1, r0
	bne _0813792C
	bl dp01_tbl5_exec_completed
_0813792C:
	pop {r0}
	bx r0
	.align 2, 0
_08137930: .4byte gSprites
_08137934: .4byte gUnknown_02024BE0
_08137938: .4byte gUnknown_02024A60
_0813793C: .4byte SpriteCallbackDummy
	thumb_func_end sub_8137908

	thumb_func_start sub_8137940
sub_8137940: @ 8137940
	push {lr}
	ldr r0, _08137964 @ =gUnknown_02024A60
	ldrb r1, [r0]
	lsls r0, r1, 1
	adds r0, r1
	lsls r0, 2
	ldr r1, _08137968 @ =0x02017810
	adds r0, r1
	ldrb r1, [r0]
	movs r0, 0x20
	ands r0, r1
	cmp r0, 0
	bne _0813795E
	bl dp01_tbl5_exec_completed
_0813795E:
	pop {r0}
	bx r0
	.align 2, 0
_08137964: .4byte gUnknown_02024A60
_08137968: .4byte 0x02017810
	thumb_func_end sub_8137940

	thumb_func_start dp01_tbl5_exec_completed
dp01_tbl5_exec_completed: @ 813796C
	push {r4,lr}
	sub sp, 0x4
	ldr r1, _081379AC @ =gUnknown_03004330
	ldr r4, _081379B0 @ =gUnknown_02024A60
	ldrb r0, [r4]
	lsls r0, 2
	adds r0, r1
	ldr r1, _081379B4 @ =sub_813726C
	str r1, [r0]
	ldr r0, _081379B8 @ =gBattleTypeFlags
	ldrh r1, [r0]
	movs r0, 0x2
	ands r0, r1
	cmp r0, 0
	beq _081379C0
	bl GetMultiplayerId
	mov r1, sp
	strb r0, [r1]
	movs r0, 0x2
	movs r1, 0x4
	mov r2, sp
	bl dp01_prepare_buffer_wireless_probably
	ldr r1, _081379BC @ =gUnknown_02023A60
	ldrb r0, [r4]
	lsls r0, 9
	adds r0, r1
	movs r1, 0x38
	strb r1, [r0]
	b _081379D2
	.align 2, 0
_081379AC: .4byte gUnknown_03004330
_081379B0: .4byte gUnknown_02024A60
_081379B4: .4byte sub_813726C
_081379B8: .4byte gBattleTypeFlags
_081379BC: .4byte gUnknown_02023A60
_081379C0:
	ldr r2, _081379DC @ =gUnknown_02024A64
	ldr r1, _081379E0 @ =gBitTable
	ldrb r0, [r4]
	lsls r0, 2
	adds r0, r1
	ldr r1, [r0]
	ldr r0, [r2]
	bics r0, r1
	str r0, [r2]
_081379D2:
	add sp, 0x4
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_081379DC: .4byte gUnknown_02024A64
_081379E0: .4byte gBitTable
	thumb_func_end dp01_tbl5_exec_completed

	thumb_func_start unref_sub_81379E4
unref_sub_81379E4: @ 81379E4
	push {lr}
	ldr r0, _08137A08 @ =gUnknown_02024A60
	ldrb r1, [r0]
	lsls r0, r1, 1
	adds r0, r1
	lsls r0, 2
	ldr r1, _08137A0C @ =0x02017810
	adds r0, r1
	ldrb r1, [r0]
	movs r0, 0x10
	ands r0, r1
	cmp r0, 0
	bne _08137A02
	bl dp01_tbl5_exec_completed
_08137A02:
	pop {r0}
	bx r0
	.align 2, 0
_08137A08: .4byte gUnknown_02024A60
_08137A0C: .4byte 0x02017810
	thumb_func_end unref_sub_81379E4

	thumb_func_start dp01t_00_5_getattr
dp01t_00_5_getattr: @ 8137A10
	push {r4-r6,lr}
	sub sp, 0x100
	movs r6, 0
	ldr r1, _08137A3C @ =gUnknown_02023A60
	ldr r0, _08137A40 @ =gUnknown_02024A60
	ldrb r2, [r0]
	lsls r0, r2, 9
	adds r1, 0x2
	adds r1, r0, r1
	ldrb r0, [r1]
	cmp r0, 0
	bne _08137A48
	ldr r0, _08137A44 @ =gUnknown_02024A6A
	lsls r1, r2, 1
	adds r1, r0
	ldrb r0, [r1]
	mov r1, sp
	bl sub_8137A84
	adds r6, r0, 0
	b _08137A6A
	.align 2, 0
_08137A3C: .4byte gUnknown_02023A60
_08137A40: .4byte gUnknown_02024A60
_08137A44: .4byte gUnknown_02024A6A
_08137A48:
	ldrb r4, [r1]
	movs r5, 0
_08137A4C:
	movs r0, 0x1
	ands r0, r4
	cmp r0, 0
	beq _08137A62
	lsls r0, r5, 24
	lsrs r0, 24
	mov r2, sp
	adds r1, r2, r6
	bl sub_8137A84
	adds r6, r0
_08137A62:
	lsrs r4, 1
	adds r5, 0x1
	cmp r5, 0x5
	ble _08137A4C
_08137A6A:
	lsls r1, r6, 16
	lsrs r1, 16
	movs r0, 0x1
	mov r2, sp
	bl dp01_build_cmdbuf_x1D_1D_numargs_varargs
	bl dp01_tbl5_exec_completed
	add sp, 0x100
	pop {r4-r6}
	pop {r0}
	bx r0
	thumb_func_end dp01t_00_5_getattr

	thumb_func_start sub_8137A84
sub_8137A84: @ 8137A84
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	sub sp, 0x90
	adds r7, r1, 0
	lsls r0, 24
	lsrs r5, r0, 24
	movs r6, 0
	ldr r2, _08137AB8 @ =gUnknown_02023A60
	ldr r3, _08137ABC @ =gUnknown_02024A60
	ldrb r0, [r3]
	lsls r0, 9
	adds r1, r2, 0x1
	adds r0, r1
	ldrb r0, [r0]
	cmp r0, 0x3B
	bls _08137AAE
	bl _0813821A
_08137AAE:
	lsls r0, 2
	ldr r1, _08137AC0 @ =_08137AC4
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_08137AB8: .4byte gUnknown_02023A60
_08137ABC: .4byte gUnknown_02024A60
_08137AC0: .4byte _08137AC4
	.align 2, 0
_08137AC4:
	.4byte _08137BB4
	.4byte _08137DD8
	.4byte _08137DE8
	.4byte _08137DF8
	.4byte _08137E60
	.4byte _08137E60
	.4byte _08137E60
	.4byte _08137E60
	.4byte _08137E7C
	.4byte _08137EB8
	.4byte _08137EB8
	.4byte _08137EB8
	.4byte _08137EB8
	.4byte _0813821A
	.4byte _0813821A
	.4byte _0813821A
	.4byte _0813821A
	.4byte _08137ED4
	.4byte _08137EE4
	.4byte _08137F14
	.4byte _08137F24
	.4byte _08137F34
	.4byte _08137F44
	.4byte _08137F54
	.4byte _08137F64
	.4byte _08137F74
	.4byte _08137F84
	.4byte _08137F94
	.4byte _08137FA4
	.4byte _08137FB4
	.4byte _08137FC4
	.4byte _08137FD4
	.4byte _08138024
	.4byte _08138034
	.4byte _08138044
	.4byte _08138054
	.4byte _08138064
	.4byte _08138074
	.4byte _08138084
	.4byte _08138094
	.4byte _081380A4
	.4byte _081380D8
	.4byte _081380E8
	.4byte _081380F8
	.4byte _08138108
	.4byte _08138118
	.4byte _08138128
	.4byte _08138138
	.4byte _08138148
	.4byte _08138168
	.4byte _08138178
	.4byte _08138188
	.4byte _08138198
	.4byte _081381A8
	.4byte _081381B8
	.4byte _081381C8
	.4byte _081381D8
	.4byte _081381E8
	.4byte _081381F8
	.4byte _08138208
_08137BB4:
	movs r0, 0x64
	adds r4, r5, 0
	muls r4, r0
	ldr r0, _08137DC8 @ =gPlayerParty
	adds r4, r0
	adds r0, r4, 0
	movs r1, 0xB
	bl GetMonData
	mov r1, sp
	strh r0, [r1]
	adds r0, r4, 0
	movs r1, 0xC
	bl GetMonData
	mov r1, sp
	strh r0, [r1, 0x2E]
	movs r6, 0
	add r0, sp, 0x24
	mov r9, r0
	movs r1, 0x3B
	add r1, sp
	mov r10, r1
	mov r2, sp
	adds r2, 0x2B
	str r2, [sp, 0x80]
	mov r0, sp
	adds r0, 0x2A
	str r0, [sp, 0x7C]
	mov r1, sp
	adds r1, 0x68
	str r1, [sp, 0x8C]
	adds r2, 0x5
	str r2, [sp, 0x84]
	adds r0, 0x12
	str r0, [sp, 0x88]
	mov r8, r4
	add r4, sp, 0xC
_08137C00:
	adds r1, r6, 0
	adds r1, 0xD
	mov r0, r8
	bl GetMonData
	strh r0, [r4]
	adds r1, r6, 0
	adds r1, 0x11
	mov r0, r8
	bl GetMonData
	mov r2, r9
	adds r1, r2, r6
	strb r0, [r1]
	adds r4, 0x2
	adds r6, 0x1
	cmp r6, 0x3
	ble _08137C00
	movs r0, 0x64
	adds r4, r5, 0
	muls r4, r0
	ldr r0, _08137DC8 @ =gPlayerParty
	adds r4, r0
	adds r0, r4, 0
	movs r1, 0x15
	bl GetMonData
	mov r1, r10
	strb r0, [r1]
	adds r0, r4, 0
	movs r1, 0x20
	bl GetMonData
	ldr r2, [sp, 0x80]
	strb r0, [r2]
	adds r0, r4, 0
	movs r1, 0x19
	bl GetMonData
	str r0, [sp, 0x44]
	adds r0, r4, 0
	movs r1, 0x27
	bl GetMonData
	mov r3, sp
	movs r5, 0x1F
	ands r0, r5
	ldrb r2, [r3, 0x14]
	movs r1, 0x20
	negs r1, r1
	ands r1, r2
	orrs r1, r0
	strb r1, [r3, 0x14]
	adds r0, r4, 0
	movs r1, 0x28
	bl GetMonData
	mov r3, sp
	movs r6, 0x1F
	ands r0, r6
	lsls r0, 5
	ldrh r2, [r3, 0x14]
	ldr r1, _08137DCC @ =0xfffffc1f
	ands r1, r2
	orrs r1, r0
	strh r1, [r3, 0x14]
	adds r0, r4, 0
	movs r1, 0x29
	bl GetMonData
	mov r3, sp
	ands r0, r5
	lsls r0, 2
	ldrb r2, [r3, 0x15]
	movs r1, 0x7D
	negs r1, r1
	ands r1, r2
	orrs r1, r0
	strb r1, [r3, 0x15]
	adds r0, r4, 0
	movs r1, 0x2A
	bl GetMonData
	movs r1, 0x1F
	ands r1, r0
	lsls r1, 15
	ldr r0, [sp, 0x14]
	ldr r2, _08137DD0 @ =0xfff07fff
	ands r0, r2
	orrs r0, r1
	str r0, [sp, 0x14]
	adds r0, r4, 0
	movs r1, 0x2B
	bl GetMonData
	mov r3, sp
	ands r0, r6
	lsls r0, 4
	ldrh r2, [r3, 0x16]
	ldr r1, _08137DD4 @ =0xfffffe0f
	ands r1, r2
	orrs r1, r0
	strh r1, [r3, 0x16]
	adds r0, r4, 0
	movs r1, 0x2C
	bl GetMonData
	mov r3, sp
	ands r0, r5
	lsls r0, 1
	ldrb r2, [r3, 0x17]
	movs r1, 0x3F
	negs r1, r1
	ands r1, r2
	orrs r1, r0
	strb r1, [r3, 0x17]
	adds r0, r4, 0
	movs r1, 0
	bl GetMonData
	str r0, [sp, 0x48]
	adds r0, r4, 0
	movs r1, 0x37
	bl GetMonData
	str r0, [sp, 0x4C]
	adds r0, r4, 0
	movs r1, 0x38
	bl GetMonData
	ldr r1, [sp, 0x7C]
	strb r0, [r1]
	adds r0, r4, 0
	movs r1, 0x39
	bl GetMonData
	mov r1, sp
	strh r0, [r1, 0x28]
	adds r0, r4, 0
	movs r1, 0x3A
	bl GetMonData
	mov r1, sp
	strh r0, [r1, 0x2C]
	adds r0, r4, 0
	movs r1, 0x3B
	bl GetMonData
	mov r1, sp
	strh r0, [r1, 0x2]
	adds r0, r4, 0
	movs r1, 0x3C
	bl GetMonData
	mov r1, sp
	strh r0, [r1, 0x4]
	adds r0, r4, 0
	movs r1, 0x3D
	bl GetMonData
	mov r1, sp
	strh r0, [r1, 0x6]
	adds r0, r4, 0
	movs r1, 0x3E
	bl GetMonData
	mov r1, sp
	strh r0, [r1, 0x8]
	adds r0, r4, 0
	movs r1, 0x3F
	bl GetMonData
	mov r1, sp
	strh r0, [r1, 0xA]
	adds r0, r4, 0
	movs r1, 0x2D
	bl GetMonData
	mov r3, sp
	movs r1, 0x1
	ands r0, r1
	lsls r0, 6
	ldrb r2, [r3, 0x17]
	movs r1, 0x41
	negs r1, r1
	ands r1, r2
	orrs r1, r0
	strb r1, [r3, 0x17]
	adds r0, r4, 0
	movs r1, 0x2E
	bl GetMonData
	mov r3, sp
	lsls r0, 7
	ldrb r2, [r3, 0x17]
	movs r1, 0x7F
	ands r1, r2
	orrs r1, r0
	strb r1, [r3, 0x17]
	adds r0, r4, 0
	movs r1, 0x1
	bl GetMonData
	str r0, [sp, 0x54]
	adds r0, r4, 0
	movs r1, 0x2
	ldr r2, [sp, 0x8C]
	bl GetMonData
	ldr r0, [sp, 0x84]
	ldr r1, [sp, 0x8C]
	bl StringCopy10
	adds r0, r4, 0
	movs r1, 0x7
	ldr r2, [sp, 0x88]
	bl GetMonData
	mov r2, sp
	movs r6, 0
_08137DB8:
	adds r0, r7, r6
	adds r1, r2, r6
	ldrb r1, [r1]
	strb r1, [r0]
	adds r6, 0x1
	cmp r6, 0x57
	bls _08137DB8
	b _0813821A
	.align 2, 0
_08137DC8: .4byte gPlayerParty
_08137DCC: .4byte 0xfffffc1f
_08137DD0: .4byte 0xfff07fff
_08137DD4: .4byte 0xfffffe0f
_08137DD8:
	movs r0, 0x64
	muls r0, r5
	ldr r1, _08137DE4 @ =gPlayerParty
	adds r0, r1
	movs r1, 0xB
	b _08138152
	.align 2, 0
_08137DE4: .4byte gPlayerParty
_08137DE8:
	movs r0, 0x64
	muls r0, r5
	ldr r1, _08137DF4 @ =gPlayerParty
	adds r0, r1
	movs r1, 0xC
	b _08138152
	.align 2, 0
_08137DF4: .4byte gPlayerParty
_08137DF8:
	movs r6, 0
	add r2, sp, 0x58
	mov r9, r2
	add r0, sp, 0x60
	mov r10, r0
	movs r0, 0x64
	adds r1, r5, 0
	muls r1, r0
	ldr r0, _08137E5C @ =gPlayerParty
	adds r4, r1, r0
	mov r8, r9
_08137E0E:
	adds r1, r6, 0
	adds r1, 0xD
	adds r0, r4, 0
	bl GetMonData
	mov r1, r8
	strh r0, [r1]
	adds r1, r6, 0
	adds r1, 0x11
	adds r0, r4, 0
	bl GetMonData
	mov r2, r10
	adds r1, r2, r6
	strb r0, [r1]
	movs r0, 0x2
	add r8, r0
	adds r6, 0x1
	cmp r6, 0x3
	ble _08137E0E
	movs r0, 0x64
	muls r0, r5
	ldr r1, _08137E5C @ =gPlayerParty
	adds r0, r1
	movs r1, 0x15
	bl GetMonData
	mov r1, r9
	strb r0, [r1, 0xC]
	mov r2, r9
	movs r6, 0
_08137E4C:
	adds r0, r7, r6
	adds r1, r2, r6
	ldrb r1, [r1]
	strb r1, [r0]
	adds r6, 0x1
	cmp r6, 0xF
	bls _08137E4C
	b _0813821A
	.align 2, 0
_08137E5C: .4byte gPlayerParty
_08137E60:
	movs r0, 0x64
	muls r0, r5
	ldr r1, _08137E78 @ =gPlayerParty
	adds r0, r1
	ldrb r1, [r3]
	lsls r1, 9
	adds r2, 0x1
	adds r1, r2
	ldrb r1, [r1]
	adds r1, 0x9
	b _08138152
	.align 2, 0
_08137E78: .4byte gPlayerParty
_08137E7C:
	movs r6, 0
	movs r0, 0x64
	adds r4, r5, 0
	muls r4, r0
	ldr r2, _08137EB4 @ =gPlayerParty
	mov r8, r2
_08137E88:
	adds r1, r6, 0
	adds r1, 0x11
	mov r2, r8
	adds r0, r4, r2
	bl GetMonData
	adds r1, r7, r6
	strb r0, [r1]
	adds r6, 0x1
	cmp r6, 0x3
	ble _08137E88
	movs r0, 0x64
	muls r0, r5
	ldr r1, _08137EB4 @ =gPlayerParty
	adds r0, r1
	movs r1, 0x15
	bl GetMonData
	adds r1, r7, r6
	strb r0, [r1]
	adds r6, 0x1
	b _0813821A
	.align 2, 0
_08137EB4: .4byte gPlayerParty
_08137EB8:
	movs r0, 0x64
	muls r0, r5
	ldr r1, _08137ED0 @ =gPlayerParty
	adds r0, r1
	ldrb r1, [r3]
	lsls r1, 9
	adds r2, 0x1
	adds r1, r2
	ldrb r1, [r1]
	adds r1, 0x8
	b _08138212
	.align 2, 0
_08137ED0: .4byte gPlayerParty
_08137ED4:
	movs r0, 0x64
	muls r0, r5
	ldr r1, _08137EE0 @ =gPlayerParty
	adds r0, r1
	movs r1, 0x1
	b _08137EEE
	.align 2, 0
_08137EE0: .4byte gPlayerParty
_08137EE4:
	movs r0, 0x64
	muls r0, r5
	ldr r1, _08137F10 @ =gPlayerParty
	adds r0, r1
	movs r1, 0x19
_08137EEE:
	bl GetMonData
	adds r1, r0, 0
	strb r1, [r7]
	movs r0, 0xFF
	lsls r0, 8
	ands r0, r1
	lsrs r0, 8
	strb r0, [r7, 0x1]
	movs r0, 0xFF
	lsls r0, 16
	ands r0, r1
	lsrs r0, 16
	strb r0, [r7, 0x2]
	movs r6, 0x3
	b _0813821A
	.align 2, 0
_08137F10: .4byte gPlayerParty
_08137F14:
	movs r0, 0x64
	muls r0, r5
	ldr r1, _08137F20 @ =gPlayerParty
	adds r0, r1
	movs r1, 0x1A
	b _08138212
	.align 2, 0
_08137F20: .4byte gPlayerParty
_08137F24:
	movs r0, 0x64
	muls r0, r5
	ldr r1, _08137F30 @ =gPlayerParty
	adds r0, r1
	movs r1, 0x1B
	b _08138212
	.align 2, 0
_08137F30: .4byte gPlayerParty
_08137F34:
	movs r0, 0x64
	muls r0, r5
	ldr r1, _08137F40 @ =gPlayerParty
	adds r0, r1
	movs r1, 0x1C
	b _08138212
	.align 2, 0
_08137F40: .4byte gPlayerParty
_08137F44:
	movs r0, 0x64
	muls r0, r5
	ldr r1, _08137F50 @ =gPlayerParty
	adds r0, r1
	movs r1, 0x1D
	b _08138212
	.align 2, 0
_08137F50: .4byte gPlayerParty
_08137F54:
	movs r0, 0x64
	muls r0, r5
	ldr r1, _08137F60 @ =gPlayerParty
	adds r0, r1
	movs r1, 0x1E
	b _08138212
	.align 2, 0
_08137F60: .4byte gPlayerParty
_08137F64:
	movs r0, 0x64
	muls r0, r5
	ldr r1, _08137F70 @ =gPlayerParty
	adds r0, r1
	movs r1, 0x1F
	b _08138212
	.align 2, 0
_08137F70: .4byte gPlayerParty
_08137F74:
	movs r0, 0x64
	muls r0, r5
	ldr r1, _08137F80 @ =gPlayerParty
	adds r0, r1
	movs r1, 0x20
	b _08138212
	.align 2, 0
_08137F80: .4byte gPlayerParty
_08137F84:
	movs r0, 0x64
	muls r0, r5
	ldr r1, _08137F90 @ =gPlayerParty
	adds r0, r1
	movs r1, 0x22
	b _08138212
	.align 2, 0
_08137F90: .4byte gPlayerParty
_08137F94:
	movs r0, 0x64
	muls r0, r5
	ldr r1, _08137FA0 @ =gPlayerParty
	adds r0, r1
	movs r1, 0x23
	b _08138212
	.align 2, 0
_08137FA0: .4byte gPlayerParty
_08137FA4:
	movs r0, 0x64
	muls r0, r5
	ldr r1, _08137FB0 @ =gPlayerParty
	adds r0, r1
	movs r1, 0x24
	b _08138212
	.align 2, 0
_08137FB0: .4byte gPlayerParty
_08137FB4:
	movs r0, 0x64
	muls r0, r5
	ldr r1, _08137FC0 @ =gPlayerParty
	adds r0, r1
	movs r1, 0x25
	b _08138212
	.align 2, 0
_08137FC0: .4byte gPlayerParty
_08137FC4:
	movs r0, 0x64
	muls r0, r5
	ldr r1, _08137FD0 @ =gPlayerParty
	adds r0, r1
	movs r1, 0x26
	b _08138212
	.align 2, 0
_08137FD0: .4byte gPlayerParty
_08137FD4:
	movs r0, 0x64
	adds r4, r5, 0
	muls r4, r0
	ldr r0, _08138020 @ =gPlayerParty
	adds r4, r0
	adds r0, r4, 0
	movs r1, 0x27
	bl GetMonData
	strb r0, [r7]
	adds r0, r4, 0
	movs r1, 0x28
	bl GetMonData
	strb r0, [r7, 0x1]
	adds r0, r4, 0
	movs r1, 0x29
	bl GetMonData
	strb r0, [r7, 0x2]
	adds r0, r4, 0
	movs r1, 0x2A
	bl GetMonData
	strb r0, [r7, 0x3]
	adds r0, r4, 0
	movs r1, 0x2B
	bl GetMonData
	strb r0, [r7, 0x4]
	adds r0, r4, 0
	movs r1, 0x2C
	bl GetMonData
	strb r0, [r7, 0x5]
	movs r6, 0x6
	b _0813821A
	.align 2, 0
_08138020: .4byte gPlayerParty
_08138024:
	movs r0, 0x64
	muls r0, r5
	ldr r1, _08138030 @ =gPlayerParty
	adds r0, r1
	movs r1, 0x27
	b _08138212
	.align 2, 0
_08138030: .4byte gPlayerParty
_08138034:
	movs r0, 0x64
	muls r0, r5
	ldr r1, _08138040 @ =gPlayerParty
	adds r0, r1
	movs r1, 0x28
	b _08138212
	.align 2, 0
_08138040: .4byte gPlayerParty
_08138044:
	movs r0, 0x64
	muls r0, r5
	ldr r1, _08138050 @ =gPlayerParty
	adds r0, r1
	movs r1, 0x29
	b _08138212
	.align 2, 0
_08138050: .4byte gPlayerParty
_08138054:
	movs r0, 0x64
	muls r0, r5
	ldr r1, _08138060 @ =gPlayerParty
	adds r0, r1
	movs r1, 0x2A
	b _08138212
	.align 2, 0
_08138060: .4byte gPlayerParty
_08138064:
	movs r0, 0x64
	muls r0, r5
	ldr r1, _08138070 @ =gPlayerParty
	adds r0, r1
	movs r1, 0x2B
	b _08138212
	.align 2, 0
_08138070: .4byte gPlayerParty
_08138074:
	movs r0, 0x64
	muls r0, r5
	ldr r1, _08138080 @ =gPlayerParty
	adds r0, r1
	movs r1, 0x2C
	b _08138212
	.align 2, 0
_08138080: .4byte gPlayerParty
_08138084:
	movs r0, 0x64
	muls r0, r5
	ldr r1, _08138090 @ =gPlayerParty
	adds r0, r1
	movs r1, 0
	b _081380AE
	.align 2, 0
_08138090: .4byte gPlayerParty
_08138094:
	movs r0, 0x64
	muls r0, r5
	ldr r1, _081380A0 @ =gPlayerParty
	adds r0, r1
	movs r1, 0x9
	b _08138152
	.align 2, 0
_081380A0: .4byte gPlayerParty
_081380A4:
	movs r0, 0x64
	muls r0, r5
	ldr r1, _081380D4 @ =gPlayerParty
	adds r0, r1
	movs r1, 0x37
_081380AE:
	bl GetMonData
	adds r1, r0, 0
	strb r1, [r7]
	movs r0, 0xFF
	lsls r0, 8
	ands r0, r1
	lsrs r0, 8
	strb r0, [r7, 0x1]
	movs r0, 0xFF
	lsls r0, 16
	ands r0, r1
	lsrs r0, 16
	strb r0, [r7, 0x2]
	lsrs r0, r1, 24
	strb r0, [r7, 0x3]
	movs r6, 0x4
	b _0813821A
	.align 2, 0
_081380D4: .4byte gPlayerParty
_081380D8:
	movs r0, 0x64
	muls r0, r5
	ldr r1, _081380E4 @ =gPlayerParty
	adds r0, r1
	movs r1, 0x38
	b _08138212
	.align 2, 0
_081380E4: .4byte gPlayerParty
_081380E8:
	movs r0, 0x64
	muls r0, r5
	ldr r1, _081380F4 @ =gPlayerParty
	adds r0, r1
	movs r1, 0x39
	b _08138152
	.align 2, 0
_081380F4: .4byte gPlayerParty
_081380F8:
	movs r0, 0x64
	muls r0, r5
	ldr r1, _08138104 @ =gPlayerParty
	adds r0, r1
	movs r1, 0x3A
	b _08138152
	.align 2, 0
_08138104: .4byte gPlayerParty
_08138108:
	movs r0, 0x64
	muls r0, r5
	ldr r1, _08138114 @ =gPlayerParty
	adds r0, r1
	movs r1, 0x3B
	b _08138152
	.align 2, 0
_08138114: .4byte gPlayerParty
_08138118:
	movs r0, 0x64
	muls r0, r5
	ldr r1, _08138124 @ =gPlayerParty
	adds r0, r1
	movs r1, 0x3C
	b _08138152
	.align 2, 0
_08138124: .4byte gPlayerParty
_08138128:
	movs r0, 0x64
	muls r0, r5
	ldr r1, _08138134 @ =gPlayerParty
	adds r0, r1
	movs r1, 0x3D
	b _08138152
	.align 2, 0
_08138134: .4byte gPlayerParty
_08138138:
	movs r0, 0x64
	muls r0, r5
	ldr r1, _08138144 @ =gPlayerParty
	adds r0, r1
	movs r1, 0x3E
	b _08138152
	.align 2, 0
_08138144: .4byte gPlayerParty
_08138148:
	movs r0, 0x64
	muls r0, r5
	ldr r1, _08138164 @ =gPlayerParty
	adds r0, r1
	movs r1, 0x3F
_08138152:
	bl GetMonData
	lsls r0, 16
	lsrs r0, 16
	strb r0, [r7]
	lsrs r0, 8
	strb r0, [r7, 0x1]
	movs r6, 0x2
	b _0813821A
	.align 2, 0
_08138164: .4byte gPlayerParty
_08138168:
	movs r0, 0x64
	muls r0, r5
	ldr r1, _08138174 @ =gPlayerParty
	adds r0, r1
	movs r1, 0x16
	b _08138212
	.align 2, 0
_08138174: .4byte gPlayerParty
_08138178:
	movs r0, 0x64
	muls r0, r5
	ldr r1, _08138184 @ =gPlayerParty
	adds r0, r1
	movs r1, 0x17
	b _08138212
	.align 2, 0
_08138184: .4byte gPlayerParty
_08138188:
	movs r0, 0x64
	muls r0, r5
	ldr r1, _08138194 @ =gPlayerParty
	adds r0, r1
	movs r1, 0x18
	b _08138212
	.align 2, 0
_08138194: .4byte gPlayerParty
_08138198:
	movs r0, 0x64
	muls r0, r5
	ldr r1, _081381A4 @ =gPlayerParty
	adds r0, r1
	movs r1, 0x21
	b _08138212
	.align 2, 0
_081381A4: .4byte gPlayerParty
_081381A8:
	movs r0, 0x64
	muls r0, r5
	ldr r1, _081381B4 @ =gPlayerParty
	adds r0, r1
	movs r1, 0x2F
	b _08138212
	.align 2, 0
_081381B4: .4byte gPlayerParty
_081381B8:
	movs r0, 0x64
	muls r0, r5
	ldr r1, _081381C4 @ =gPlayerParty
	adds r0, r1
	movs r1, 0x30
	b _08138212
	.align 2, 0
_081381C4: .4byte gPlayerParty
_081381C8:
	movs r0, 0x64
	muls r0, r5
	ldr r1, _081381D4 @ =gPlayerParty
	adds r0, r1
	movs r1, 0x32
	b _08138212
	.align 2, 0
_081381D4: .4byte gPlayerParty
_081381D8:
	movs r0, 0x64
	muls r0, r5
	ldr r1, _081381E4 @ =gPlayerParty
	adds r0, r1
	movs r1, 0x33
	b _08138212
	.align 2, 0
_081381E4: .4byte gPlayerParty
_081381E8:
	movs r0, 0x64
	muls r0, r5
	ldr r1, _081381F4 @ =gPlayerParty
	adds r0, r1
	movs r1, 0x34
	b _08138212
	.align 2, 0
_081381F4: .4byte gPlayerParty
_081381F8:
	movs r0, 0x64
	muls r0, r5
	ldr r1, _08138204 @ =gPlayerParty
	adds r0, r1
	movs r1, 0x35
	b _08138212
	.align 2, 0
_08138204: .4byte gPlayerParty
_08138208:
	movs r0, 0x64
	muls r0, r5
	ldr r1, _0813822C @ =gPlayerParty
	adds r0, r1
	movs r1, 0x36
_08138212:
	bl GetMonData
	strb r0, [r7]
	movs r6, 0x1
_0813821A:
	adds r0, r6, 0
	add sp, 0x90
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r1}
	bx r1
	.align 2, 0
_0813822C: .4byte gPlayerParty
	thumb_func_end sub_8137A84

	thumb_func_start sub_8138230
sub_8138230: @ 8138230
	push {lr}
	bl sub_802ECF0
	pop {r0}
	bx r0
	thumb_func_end sub_8138230

	thumb_func_start sub_813823C
sub_813823C: @ 813823C
	push {r4,r5,lr}
	ldr r1, _08138260 @ =gUnknown_02023A60
	ldr r0, _08138264 @ =gUnknown_02024A60
	ldrb r2, [r0]
	lsls r0, r2, 9
	adds r1, 0x2
	adds r1, r0, r1
	ldrb r0, [r1]
	cmp r0, 0
	bne _0813826C
	ldr r0, _08138268 @ =gUnknown_02024A6A
	lsls r1, r2, 1
	adds r1, r0
	ldrb r0, [r1]
	bl sub_8138294
	b _0813828A
	.align 2, 0
_08138260: .4byte gUnknown_02023A60
_08138264: .4byte gUnknown_02024A60
_08138268: .4byte gUnknown_02024A6A
_0813826C:
	ldrb r4, [r1]
	movs r5, 0
_08138270:
	movs r0, 0x1
	ands r0, r4
	cmp r0, 0
	beq _0813827E
	adds r0, r5, 0
	bl sub_8138294
_0813827E:
	lsrs r4, 1
	adds r0, r5, 0x1
	lsls r0, 24
	lsrs r5, r0, 24
	cmp r5, 0x5
	bls _08138270
_0813828A:
	bl dp01_tbl5_exec_completed
	pop {r4,r5}
	pop {r0}
	bx r0
	thumb_func_end sub_813823C

	thumb_func_start sub_8138294
sub_8138294: @ 8138294
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	sub sp, 0x34
	lsls r0, 24
	lsrs r5, r0, 24
	ldr r0, _081382CC @ =gUnknown_02024A60
	ldrb r0, [r0]
	lsls r0, 9
	ldr r2, _081382D0 @ =gUnknown_02023A63
	adds r3, r0, r2
	adds r6, r3, 0
	subs r1, r2, 0x2
	adds r0, r1
	ldrb r0, [r0]
	adds r7, r2, 0
	cmp r0, 0x3B
	bls _081382C0
	bl _08138C5A
_081382C0:
	lsls r0, 2
	ldr r1, _081382D4 @ =_081382D8
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_081382CC: .4byte gUnknown_02024A60
_081382D0: .4byte gUnknown_02023A63
_081382D4: .4byte _081382D8
	.align 2, 0
_081382D8:
	.4byte _081383C8
	.4byte _08138560
	.4byte _08138580
	.4byte _081385A0
	.4byte _081385F8
	.4byte _081385F8
	.4byte _081385F8
	.4byte _081385F8
	.4byte _08138620
	.4byte _08138684
	.4byte _08138684
	.4byte _08138684
	.4byte _08138684
	.4byte _08138C5A
	.4byte _08138C5A
	.4byte _08138C5A
	.4byte _08138C5A
	.4byte _081386B4
	.4byte _081386D4
	.4byte _081386F4
	.4byte _08138714
	.4byte _08138734
	.4byte _08138754
	.4byte _08138774
	.4byte _08138794
	.4byte _081387B4
	.4byte _081387D4
	.4byte _081387F4
	.4byte _08138814
	.4byte _08138834
	.4byte _08138854
	.4byte _08138874
	.4byte _081388E4
	.4byte _08138904
	.4byte _08138924
	.4byte _08138944
	.4byte _08138964
	.4byte _08138984
	.4byte _081389A4
	.4byte _081389C4
	.4byte _081389E4
	.4byte _08138A04
	.4byte _08138A24
	.4byte _08138A44
	.4byte _08138A64
	.4byte _08138A84
	.4byte _08138AA4
	.4byte _08138AC4
	.4byte _08138AE4
	.4byte _08138B04
	.4byte _08138B24
	.4byte _08138B44
	.4byte _08138B64
	.4byte _08138B84
	.4byte _08138BA4
	.4byte _08138BC4
	.4byte _08138BE4
	.4byte _08138C04
	.4byte _08138C24
	.4byte _08138C44
_081383C8:
	movs r0, 0x64
	adds r4, r5, 0
	muls r4, r0
	ldr r0, _0813855C @ =gPlayerParty
	adds r4, r0
	adds r0, r4, 0
	movs r1, 0xB
	adds r2, r6, 0
	bl SetMonData
	adds r2, r6, 0
	adds r2, 0x2E
	adds r0, r4, 0
	movs r1, 0xC
	bl SetMonData
	movs r0, 0
	mov r8, r0
	movs r0, 0x3B
	adds r0, r6
	mov r10, r0
	adds r0, r6, 0
	adds r0, 0x2B
	str r0, [sp, 0x20]
	adds r0, 0x19
	str r0, [sp, 0x28]
	adds r0, 0x4
	str r0, [sp, 0x2C]
	adds r0, 0x4
	str r0, [sp, 0x30]
	subs r0, 0x22
	str r0, [sp, 0x1C]
	subs r0, 0x2
	str r0, [sp, 0x18]
	adds r0, 0x4
	str r0, [sp, 0x24]
	adds r0, r6, 0x2
	str r0, [sp, 0x4]
	adds r0, r6, 0x4
	str r0, [sp, 0x8]
	adds r0, r6, 0x6
	str r0, [sp, 0xC]
	adds r0, 0x2
	str r0, [sp, 0x10]
	adds r0, 0x2
	str r0, [sp, 0x14]
	mov r9, r4
	adds r7, r6, 0
	adds r7, 0x24
	adds r4, r6, 0
	adds r4, 0xC
_0813842E:
	mov r1, r8
	adds r1, 0xD
	mov r0, r9
	adds r2, r4, 0
	bl SetMonData
	mov r1, r8
	adds r1, 0x11
	mov r0, r9
	adds r2, r7, 0
	bl SetMonData
	adds r7, 0x1
	adds r4, 0x2
	movs r0, 0x1
	add r8, r0
	mov r0, r8
	cmp r0, 0x3
	ble _0813842E
	movs r0, 0x64
	adds r4, r5, 0
	muls r4, r0
	ldr r0, _0813855C @ =gPlayerParty
	adds r4, r0
	adds r0, r4, 0
	movs r1, 0x15
	mov r2, r10
	bl SetMonData
	adds r0, r4, 0
	movs r1, 0x20
	ldr r2, [sp, 0x20]
	bl SetMonData
	adds r0, r4, 0
	movs r1, 0x19
	ldr r2, [sp, 0x28]
	bl SetMonData
	ldrb r0, [r6, 0x14]
	lsls r0, 27
	lsrs r0, 27
	mov r1, sp
	strb r0, [r1]
	adds r0, r4, 0
	movs r1, 0x27
	mov r2, sp
	bl SetMonData
	mov r1, sp
	ldrh r0, [r6, 0x14]
	lsls r0, 22
	lsrs r0, 27
	strb r0, [r1]
	adds r0, r4, 0
	movs r1, 0x28
	mov r2, sp
	bl SetMonData
	mov r1, sp
	ldrb r0, [r6, 0x15]
	lsls r0, 25
	lsrs r0, 27
	strb r0, [r1]
	adds r0, r4, 0
	movs r1, 0x29
	mov r2, sp
	bl SetMonData
	mov r1, sp
	ldr r0, [r6, 0x14]
	lsls r0, 12
	lsrs r0, 27
	strb r0, [r1]
	adds r0, r4, 0
	movs r1, 0x2A
	mov r2, sp
	bl SetMonData
	mov r1, sp
	ldrh r0, [r6, 0x16]
	lsls r0, 23
	lsrs r0, 27
	strb r0, [r1]
	adds r0, r4, 0
	movs r1, 0x2B
	mov r2, sp
	bl SetMonData
	mov r1, sp
	ldrb r0, [r6, 0x17]
	lsls r0, 26
	lsrs r0, 27
	strb r0, [r1]
	adds r0, r4, 0
	movs r1, 0x2C
	mov r2, sp
	bl SetMonData
	adds r0, r4, 0
	movs r1, 0
	ldr r2, [sp, 0x2C]
	bl SetMonData
	adds r0, r4, 0
	movs r1, 0x37
	ldr r2, [sp, 0x30]
	bl SetMonData
	adds r0, r4, 0
	movs r1, 0x38
	ldr r2, [sp, 0x1C]
	bl SetMonData
	adds r0, r4, 0
	movs r1, 0x39
	ldr r2, [sp, 0x18]
	bl SetMonData
	adds r0, r4, 0
	movs r1, 0x3A
	ldr r2, [sp, 0x24]
	bl SetMonData
	adds r0, r4, 0
	movs r1, 0x3B
	ldr r2, [sp, 0x4]
	bl SetMonData
	adds r0, r4, 0
	movs r1, 0x3C
	ldr r2, [sp, 0x8]
	bl SetMonData
	adds r0, r4, 0
	movs r1, 0x3D
	ldr r2, [sp, 0xC]
	bl SetMonData
	adds r0, r4, 0
	movs r1, 0x3E
	ldr r2, [sp, 0x10]
	bl SetMonData
	adds r0, r4, 0
	movs r1, 0x3F
	ldr r2, [sp, 0x14]
	bl SetMonData
	b _08138C5A
	.align 2, 0
_0813855C: .4byte gPlayerParty
_08138560:
	movs r0, 0x64
	muls r0, r5
	ldr r1, _08138578 @ =gPlayerParty
	adds r0, r1
	ldr r1, _0813857C @ =gUnknown_02024A60
	ldrb r2, [r1]
	lsls r2, 9
	adds r2, r7
	movs r1, 0xB
	bl SetMonData
	b _08138C5A
	.align 2, 0
_08138578: .4byte gPlayerParty
_0813857C: .4byte gUnknown_02024A60
_08138580:
	movs r0, 0x64
	muls r0, r5
	ldr r1, _08138598 @ =gPlayerParty
	adds r0, r1
	ldr r1, _0813859C @ =gUnknown_02024A60
	ldrb r2, [r1]
	lsls r2, 9
	adds r2, r7
	movs r1, 0xC
	bl SetMonData
	b _08138C5A
	.align 2, 0
_08138598: .4byte gPlayerParty
_0813859C: .4byte gUnknown_02024A60
_081385A0:
	movs r0, 0
	mov r8, r0
	movs r0, 0xC
	adds r0, r3
	mov r9, r0
	movs r0, 0x64
	adds r1, r5, 0
	muls r1, r0
	ldr r0, _081385F4 @ =gPlayerParty
	adds r7, r1, r0
	adds r6, r3, 0
	adds r6, 0x8
	adds r4, r3, 0
_081385BA:
	mov r1, r8
	adds r1, 0xD
	adds r0, r7, 0
	adds r2, r4, 0
	bl SetMonData
	mov r1, r8
	adds r1, 0x11
	adds r0, r7, 0
	adds r2, r6, 0
	bl SetMonData
	adds r6, 0x1
	adds r4, 0x2
	movs r0, 0x1
	add r8, r0
	mov r0, r8
	cmp r0, 0x3
	ble _081385BA
	movs r0, 0x64
	muls r0, r5
	ldr r1, _081385F4 @ =gPlayerParty
	adds r0, r1
	movs r1, 0x15
	mov r2, r9
	bl SetMonData
	b _08138C5A
	.align 2, 0
_081385F4: .4byte gPlayerParty
_081385F8:
	movs r0, 0x64
	muls r0, r5
	ldr r1, _08138614 @ =gPlayerParty
	adds r0, r1
	ldr r3, _08138618 @ =gUnknown_02023A60
	ldr r1, _0813861C @ =gUnknown_02024A60
	ldrb r2, [r1]
	lsls r2, 9
	adds r1, r3, 0x1
	adds r1, r2, r1
	ldrb r1, [r1]
	adds r1, 0x9
	b _0813869C
	.align 2, 0
_08138614: .4byte gPlayerParty
_08138618: .4byte gUnknown_02023A60
_0813861C: .4byte gUnknown_02024A60
_08138620:
	movs r0, 0x64
	adds r4, r5, 0
	muls r4, r0
	ldr r0, _0813867C @ =gPlayerParty
	adds r4, r0
	ldr r5, _08138680 @ =gUnknown_02024A60
	ldrb r2, [r5]
	lsls r2, 9
	adds r2, r7
	adds r0, r4, 0
	movs r1, 0x11
	bl SetMonData
	ldrb r2, [r5]
	lsls r2, 9
	adds r0, r7, 0x1
	adds r2, r0
	adds r0, r4, 0
	movs r1, 0x12
	bl SetMonData
	ldrb r2, [r5]
	lsls r2, 9
	adds r0, r7, 0x2
	adds r2, r0
	adds r0, r4, 0
	movs r1, 0x13
	bl SetMonData
	ldrb r2, [r5]
	lsls r2, 9
	adds r0, r7, 0x3
	adds r2, r0
	adds r0, r4, 0
	movs r1, 0x14
	bl SetMonData
	ldrb r2, [r5]
	lsls r2, 9
	adds r0, r7, 0x4
	adds r2, r0
	adds r0, r4, 0
	movs r1, 0x15
	bl SetMonData
	b _08138C5A
	.align 2, 0
_0813867C: .4byte gPlayerParty
_08138680: .4byte gUnknown_02024A60
_08138684:
	movs r0, 0x64
	muls r0, r5
	ldr r1, _081386A8 @ =gPlayerParty
	adds r0, r1
	ldr r3, _081386AC @ =gUnknown_02023A60
	ldr r1, _081386B0 @ =gUnknown_02024A60
	ldrb r2, [r1]
	lsls r2, 9
	adds r1, r3, 0x1
	adds r1, r2, r1
	ldrb r1, [r1]
	adds r1, 0x8
_0813869C:
	adds r3, 0x3
	adds r2, r3
	bl SetMonData
	b _08138C5A
	.align 2, 0
_081386A8: .4byte gPlayerParty
_081386AC: .4byte gUnknown_02023A60
_081386B0: .4byte gUnknown_02024A60
_081386B4:
	movs r0, 0x64
	muls r0, r5
	ldr r1, _081386CC @ =gPlayerParty
	adds r0, r1
	ldr r1, _081386D0 @ =gUnknown_02024A60
	ldrb r2, [r1]
	lsls r2, 9
	adds r2, r7
	movs r1, 0x1
	bl SetMonData
	b _08138C5A
	.align 2, 0
_081386CC: .4byte gPlayerParty
_081386D0: .4byte gUnknown_02024A60
_081386D4:
	movs r0, 0x64
	muls r0, r5
	ldr r1, _081386EC @ =gPlayerParty
	adds r0, r1
	ldr r1, _081386F0 @ =gUnknown_02024A60
	ldrb r2, [r1]
	lsls r2, 9
	adds r2, r7
	movs r1, 0x19
	bl SetMonData
	b _08138C5A
	.align 2, 0
_081386EC: .4byte gPlayerParty
_081386F0: .4byte gUnknown_02024A60
_081386F4:
	movs r0, 0x64
	muls r0, r5
	ldr r1, _0813870C @ =gPlayerParty
	adds r0, r1
	ldr r1, _08138710 @ =gUnknown_02024A60
	ldrb r2, [r1]
	lsls r2, 9
	adds r2, r7
	movs r1, 0x1A
	bl SetMonData
	b _08138C5A
	.align 2, 0
_0813870C: .4byte gPlayerParty
_08138710: .4byte gUnknown_02024A60
_08138714:
	movs r0, 0x64
	muls r0, r5
	ldr r1, _0813872C @ =gPlayerParty
	adds r0, r1
	ldr r1, _08138730 @ =gUnknown_02024A60
	ldrb r2, [r1]
	lsls r2, 9
	adds r2, r7
	movs r1, 0x1B
	bl SetMonData
	b _08138C5A
	.align 2, 0
_0813872C: .4byte gPlayerParty
_08138730: .4byte gUnknown_02024A60
_08138734:
	movs r0, 0x64
	muls r0, r5
	ldr r1, _0813874C @ =gPlayerParty
	adds r0, r1
	ldr r1, _08138750 @ =gUnknown_02024A60
	ldrb r2, [r1]
	lsls r2, 9
	adds r2, r7
	movs r1, 0x1C
	bl SetMonData
	b _08138C5A
	.align 2, 0
_0813874C: .4byte gPlayerParty
_08138750: .4byte gUnknown_02024A60
_08138754:
	movs r0, 0x64
	muls r0, r5
	ldr r1, _0813876C @ =gPlayerParty
	adds r0, r1
	ldr r1, _08138770 @ =gUnknown_02024A60
	ldrb r2, [r1]
	lsls r2, 9
	adds r2, r7
	movs r1, 0x1D
	bl SetMonData
	b _08138C5A
	.align 2, 0
_0813876C: .4byte gPlayerParty
_08138770: .4byte gUnknown_02024A60
_08138774:
	movs r0, 0x64
	muls r0, r5
	ldr r1, _0813878C @ =gPlayerParty
	adds r0, r1
	ldr r1, _08138790 @ =gUnknown_02024A60
	ldrb r2, [r1]
	lsls r2, 9
	adds r2, r7
	movs r1, 0x1E
	bl SetMonData
	b _08138C5A
	.align 2, 0
_0813878C: .4byte gPlayerParty
_08138790: .4byte gUnknown_02024A60
_08138794:
	movs r0, 0x64
	muls r0, r5
	ldr r1, _081387AC @ =gPlayerParty
	adds r0, r1
	ldr r1, _081387B0 @ =gUnknown_02024A60
	ldrb r2, [r1]
	lsls r2, 9
	adds r2, r7
	movs r1, 0x1F
	bl SetMonData
	b _08138C5A
	.align 2, 0
_081387AC: .4byte gPlayerParty
_081387B0: .4byte gUnknown_02024A60
_081387B4:
	movs r0, 0x64
	muls r0, r5
	ldr r1, _081387CC @ =gPlayerParty
	adds r0, r1
	ldr r1, _081387D0 @ =gUnknown_02024A60
	ldrb r2, [r1]
	lsls r2, 9
	adds r2, r7
	movs r1, 0x20
	bl SetMonData
	b _08138C5A
	.align 2, 0
_081387CC: .4byte gPlayerParty
_081387D0: .4byte gUnknown_02024A60
_081387D4:
	movs r0, 0x64
	muls r0, r5
	ldr r1, _081387EC @ =gPlayerParty
	adds r0, r1
	ldr r1, _081387F0 @ =gUnknown_02024A60
	ldrb r2, [r1]
	lsls r2, 9
	adds r2, r7
	movs r1, 0x22
	bl SetMonData
	b _08138C5A
	.align 2, 0
_081387EC: .4byte gPlayerParty
_081387F0: .4byte gUnknown_02024A60
_081387F4:
	movs r0, 0x64
	muls r0, r5
	ldr r1, _0813880C @ =gPlayerParty
	adds r0, r1
	ldr r1, _08138810 @ =gUnknown_02024A60
	ldrb r2, [r1]
	lsls r2, 9
	adds r2, r7
	movs r1, 0x23
	bl SetMonData
	b _08138C5A
	.align 2, 0
_0813880C: .4byte gPlayerParty
_08138810: .4byte gUnknown_02024A60
_08138814:
	movs r0, 0x64
	muls r0, r5
	ldr r1, _0813882C @ =gPlayerParty
	adds r0, r1
	ldr r1, _08138830 @ =gUnknown_02024A60
	ldrb r2, [r1]
	lsls r2, 9
	adds r2, r7
	movs r1, 0x24
	bl SetMonData
	b _08138C5A
	.align 2, 0
_0813882C: .4byte gPlayerParty
_08138830: .4byte gUnknown_02024A60
_08138834:
	movs r0, 0x64
	muls r0, r5
	ldr r1, _0813884C @ =gPlayerParty
	adds r0, r1
	ldr r1, _08138850 @ =gUnknown_02024A60
	ldrb r2, [r1]
	lsls r2, 9
	adds r2, r7
	movs r1, 0x25
	bl SetMonData
	b _08138C5A
	.align 2, 0
_0813884C: .4byte gPlayerParty
_08138850: .4byte gUnknown_02024A60
_08138854:
	movs r0, 0x64
	muls r0, r5
	ldr r1, _0813886C @ =gPlayerParty
	adds r0, r1
	ldr r1, _08138870 @ =gUnknown_02024A60
	ldrb r2, [r1]
	lsls r2, 9
	adds r2, r7
	movs r1, 0x26
	bl SetMonData
	b _08138C5A
	.align 2, 0
_0813886C: .4byte gPlayerParty
_08138870: .4byte gUnknown_02024A60
_08138874:
	movs r0, 0x64
	adds r4, r5, 0
	muls r4, r0
	ldr r0, _081388DC @ =gPlayerParty
	adds r4, r0
	ldr r5, _081388E0 @ =gUnknown_02024A60
	ldrb r2, [r5]
	lsls r2, 9
	adds r2, r7
	adds r0, r4, 0
	movs r1, 0x27
	bl SetMonData
	ldrb r2, [r5]
	lsls r2, 9
	adds r0, r7, 0x1
	adds r2, r0
	adds r0, r4, 0
	movs r1, 0x28
	bl SetMonData
	ldrb r2, [r5]
	lsls r2, 9
	adds r0, r7, 0x2
	adds r2, r0
	adds r0, r4, 0
	movs r1, 0x29
	bl SetMonData
	ldrb r2, [r5]
	lsls r2, 9
	adds r0, r7, 0x3
	adds r2, r0
	adds r0, r4, 0
	movs r1, 0x2A
	bl SetMonData
	ldrb r2, [r5]
	lsls r2, 9
	adds r0, r7, 0x4
	adds r2, r0
	adds r0, r4, 0
	movs r1, 0x2B
	bl SetMonData
	ldrb r2, [r5]
	lsls r2, 9
	adds r0, r7, 0x5
	adds r2, r0
	adds r0, r4, 0
	b _08138994
	.align 2, 0
_081388DC: .4byte gPlayerParty
_081388E0: .4byte gUnknown_02024A60
_081388E4:
	movs r0, 0x64
	muls r0, r5
	ldr r1, _081388FC @ =gPlayerParty
	adds r0, r1
	ldr r1, _08138900 @ =gUnknown_02024A60
	ldrb r2, [r1]
	lsls r2, 9
	adds r2, r7
	movs r1, 0x27
	bl SetMonData
	b _08138C5A
	.align 2, 0
_081388FC: .4byte gPlayerParty
_08138900: .4byte gUnknown_02024A60
_08138904:
	movs r0, 0x64
	muls r0, r5
	ldr r1, _0813891C @ =gPlayerParty
	adds r0, r1
	ldr r1, _08138920 @ =gUnknown_02024A60
	ldrb r2, [r1]
	lsls r2, 9
	adds r2, r7
	movs r1, 0x28
	bl SetMonData
	b _08138C5A
	.align 2, 0
_0813891C: .4byte gPlayerParty
_08138920: .4byte gUnknown_02024A60
_08138924:
	movs r0, 0x64
	muls r0, r5
	ldr r1, _0813893C @ =gPlayerParty
	adds r0, r1
	ldr r1, _08138940 @ =gUnknown_02024A60
	ldrb r2, [r1]
	lsls r2, 9
	adds r2, r7
	movs r1, 0x29
	bl SetMonData
	b _08138C5A
	.align 2, 0
_0813893C: .4byte gPlayerParty
_08138940: .4byte gUnknown_02024A60
_08138944:
	movs r0, 0x64
	muls r0, r5
	ldr r1, _0813895C @ =gPlayerParty
	adds r0, r1
	ldr r1, _08138960 @ =gUnknown_02024A60
	ldrb r2, [r1]
	lsls r2, 9
	adds r2, r7
	movs r1, 0x2A
	bl SetMonData
	b _08138C5A
	.align 2, 0
_0813895C: .4byte gPlayerParty
_08138960: .4byte gUnknown_02024A60
_08138964:
	movs r0, 0x64
	muls r0, r5
	ldr r1, _0813897C @ =gPlayerParty
	adds r0, r1
	ldr r1, _08138980 @ =gUnknown_02024A60
	ldrb r2, [r1]
	lsls r2, 9
	adds r2, r7
	movs r1, 0x2B
	bl SetMonData
	b _08138C5A
	.align 2, 0
_0813897C: .4byte gPlayerParty
_08138980: .4byte gUnknown_02024A60
_08138984:
	movs r0, 0x64
	muls r0, r5
	ldr r1, _0813899C @ =gPlayerParty
	adds r0, r1
	ldr r1, _081389A0 @ =gUnknown_02024A60
	ldrb r2, [r1]
	lsls r2, 9
	adds r2, r7
_08138994:
	movs r1, 0x2C
	bl SetMonData
	b _08138C5A
	.align 2, 0
_0813899C: .4byte gPlayerParty
_081389A0: .4byte gUnknown_02024A60
_081389A4:
	movs r0, 0x64
	muls r0, r5
	ldr r1, _081389BC @ =gPlayerParty
	adds r0, r1
	ldr r1, _081389C0 @ =gUnknown_02024A60
	ldrb r2, [r1]
	lsls r2, 9
	adds r2, r7
	movs r1, 0
	bl SetMonData
	b _08138C5A
	.align 2, 0
_081389BC: .4byte gPlayerParty
_081389C0: .4byte gUnknown_02024A60
_081389C4:
	movs r0, 0x64
	muls r0, r5
	ldr r1, _081389DC @ =gPlayerParty
	adds r0, r1
	ldr r1, _081389E0 @ =gUnknown_02024A60
	ldrb r2, [r1]
	lsls r2, 9
	adds r2, r7
	movs r1, 0x9
	bl SetMonData
	b _08138C5A
	.align 2, 0
_081389DC: .4byte gPlayerParty
_081389E0: .4byte gUnknown_02024A60
_081389E4:
	movs r0, 0x64
	muls r0, r5
	ldr r1, _081389FC @ =gPlayerParty
	adds r0, r1
	ldr r1, _08138A00 @ =gUnknown_02024A60
	ldrb r2, [r1]
	lsls r2, 9
	adds r2, r7
	movs r1, 0x37
	bl SetMonData
	b _08138C5A
	.align 2, 0
_081389FC: .4byte gPlayerParty
_08138A00: .4byte gUnknown_02024A60
_08138A04:
	movs r0, 0x64
	muls r0, r5
	ldr r1, _08138A1C @ =gPlayerParty
	adds r0, r1
	ldr r1, _08138A20 @ =gUnknown_02024A60
	ldrb r2, [r1]
	lsls r2, 9
	adds r2, r7
	movs r1, 0x38
	bl SetMonData
	b _08138C5A
	.align 2, 0
_08138A1C: .4byte gPlayerParty
_08138A20: .4byte gUnknown_02024A60
_08138A24:
	movs r0, 0x64
	muls r0, r5
	ldr r1, _08138A3C @ =gPlayerParty
	adds r0, r1
	ldr r1, _08138A40 @ =gUnknown_02024A60
	ldrb r2, [r1]
	lsls r2, 9
	adds r2, r7
	movs r1, 0x39
	bl SetMonData
	b _08138C5A
	.align 2, 0
_08138A3C: .4byte gPlayerParty
_08138A40: .4byte gUnknown_02024A60
_08138A44:
	movs r0, 0x64
	muls r0, r5
	ldr r1, _08138A5C @ =gPlayerParty
	adds r0, r1
	ldr r1, _08138A60 @ =gUnknown_02024A60
	ldrb r2, [r1]
	lsls r2, 9
	adds r2, r7
	movs r1, 0x3A
	bl SetMonData
	b _08138C5A
	.align 2, 0
_08138A5C: .4byte gPlayerParty
_08138A60: .4byte gUnknown_02024A60
_08138A64:
	movs r0, 0x64
	muls r0, r5
	ldr r1, _08138A7C @ =gPlayerParty
	adds r0, r1
	ldr r1, _08138A80 @ =gUnknown_02024A60
	ldrb r2, [r1]
	lsls r2, 9
	adds r2, r7
	movs r1, 0x3B
	bl SetMonData
	b _08138C5A
	.align 2, 0
_08138A7C: .4byte gPlayerParty
_08138A80: .4byte gUnknown_02024A60
_08138A84:
	movs r0, 0x64
	muls r0, r5
	ldr r1, _08138A9C @ =gPlayerParty
	adds r0, r1
	ldr r1, _08138AA0 @ =gUnknown_02024A60
	ldrb r2, [r1]
	lsls r2, 9
	adds r2, r7
	movs r1, 0x3C
	bl SetMonData
	b _08138C5A
	.align 2, 0
_08138A9C: .4byte gPlayerParty
_08138AA0: .4byte gUnknown_02024A60
_08138AA4:
	movs r0, 0x64
	muls r0, r5
	ldr r1, _08138ABC @ =gPlayerParty
	adds r0, r1
	ldr r1, _08138AC0 @ =gUnknown_02024A60
	ldrb r2, [r1]
	lsls r2, 9
	adds r2, r7
	movs r1, 0x3D
	bl SetMonData
	b _08138C5A
	.align 2, 0
_08138ABC: .4byte gPlayerParty
_08138AC0: .4byte gUnknown_02024A60
_08138AC4:
	movs r0, 0x64
	muls r0, r5
	ldr r1, _08138ADC @ =gPlayerParty
	adds r0, r1
	ldr r1, _08138AE0 @ =gUnknown_02024A60
	ldrb r2, [r1]
	lsls r2, 9
	adds r2, r7
	movs r1, 0x3E
	bl SetMonData
	b _08138C5A
	.align 2, 0
_08138ADC: .4byte gPlayerParty
_08138AE0: .4byte gUnknown_02024A60
_08138AE4:
	movs r0, 0x64
	muls r0, r5
	ldr r1, _08138AFC @ =gPlayerParty
	adds r0, r1
	ldr r1, _08138B00 @ =gUnknown_02024A60
	ldrb r2, [r1]
	lsls r2, 9
	adds r2, r7
	movs r1, 0x3F
	bl SetMonData
	b _08138C5A
	.align 2, 0
_08138AFC: .4byte gPlayerParty
_08138B00: .4byte gUnknown_02024A60
_08138B04:
	movs r0, 0x64
	muls r0, r5
	ldr r1, _08138B1C @ =gPlayerParty
	adds r0, r1
	ldr r1, _08138B20 @ =gUnknown_02024A60
	ldrb r2, [r1]
	lsls r2, 9
	adds r2, r7
	movs r1, 0x16
	bl SetMonData
	b _08138C5A
	.align 2, 0
_08138B1C: .4byte gPlayerParty
_08138B20: .4byte gUnknown_02024A60
_08138B24:
	movs r0, 0x64
	muls r0, r5
	ldr r1, _08138B3C @ =gPlayerParty
	adds r0, r1
	ldr r1, _08138B40 @ =gUnknown_02024A60
	ldrb r2, [r1]
	lsls r2, 9
	adds r2, r7
	movs r1, 0x17
	bl SetMonData
	b _08138C5A
	.align 2, 0
_08138B3C: .4byte gPlayerParty
_08138B40: .4byte gUnknown_02024A60
_08138B44:
	movs r0, 0x64
	muls r0, r5
	ldr r1, _08138B5C @ =gPlayerParty
	adds r0, r1
	ldr r1, _08138B60 @ =gUnknown_02024A60
	ldrb r2, [r1]
	lsls r2, 9
	adds r2, r7
	movs r1, 0x18
	bl SetMonData
	b _08138C5A
	.align 2, 0
_08138B5C: .4byte gPlayerParty
_08138B60: .4byte gUnknown_02024A60
_08138B64:
	movs r0, 0x64
	muls r0, r5
	ldr r1, _08138B7C @ =gPlayerParty
	adds r0, r1
	ldr r1, _08138B80 @ =gUnknown_02024A60
	ldrb r2, [r1]
	lsls r2, 9
	adds r2, r7
	movs r1, 0x21
	bl SetMonData
	b _08138C5A
	.align 2, 0
_08138B7C: .4byte gPlayerParty
_08138B80: .4byte gUnknown_02024A60
_08138B84:
	movs r0, 0x64
	muls r0, r5
	ldr r1, _08138B9C @ =gPlayerParty
	adds r0, r1
	ldr r1, _08138BA0 @ =gUnknown_02024A60
	ldrb r2, [r1]
	lsls r2, 9
	adds r2, r7
	movs r1, 0x2F
	bl SetMonData
	b _08138C5A
	.align 2, 0
_08138B9C: .4byte gPlayerParty
_08138BA0: .4byte gUnknown_02024A60
_08138BA4:
	movs r0, 0x64
	muls r0, r5
	ldr r1, _08138BBC @ =gPlayerParty
	adds r0, r1
	ldr r1, _08138BC0 @ =gUnknown_02024A60
	ldrb r2, [r1]
	lsls r2, 9
	adds r2, r7
	movs r1, 0x30
	bl SetMonData
	b _08138C5A
	.align 2, 0
_08138BBC: .4byte gPlayerParty
_08138BC0: .4byte gUnknown_02024A60
_08138BC4:
	movs r0, 0x64
	muls r0, r5
	ldr r1, _08138BDC @ =gPlayerParty
	adds r0, r1
	ldr r1, _08138BE0 @ =gUnknown_02024A60
	ldrb r2, [r1]
	lsls r2, 9
	adds r2, r7
	movs r1, 0x32
	bl SetMonData
	b _08138C5A
	.align 2, 0
_08138BDC: .4byte gPlayerParty
_08138BE0: .4byte gUnknown_02024A60
_08138BE4:
	movs r0, 0x64
	muls r0, r5
	ldr r1, _08138BFC @ =gPlayerParty
	adds r0, r1
	ldr r1, _08138C00 @ =gUnknown_02024A60
	ldrb r2, [r1]
	lsls r2, 9
	adds r2, r7
	movs r1, 0x33
	bl SetMonData
	b _08138C5A
	.align 2, 0
_08138BFC: .4byte gPlayerParty
_08138C00: .4byte gUnknown_02024A60
_08138C04:
	movs r0, 0x64
	muls r0, r5
	ldr r1, _08138C1C @ =gPlayerParty
	adds r0, r1
	ldr r1, _08138C20 @ =gUnknown_02024A60
	ldrb r2, [r1]
	lsls r2, 9
	adds r2, r7
	movs r1, 0x34
	bl SetMonData
	b _08138C5A
	.align 2, 0
_08138C1C: .4byte gPlayerParty
_08138C20: .4byte gUnknown_02024A60
_08138C24:
	movs r0, 0x64
	muls r0, r5
	ldr r1, _08138C3C @ =gPlayerParty
	adds r0, r1
	ldr r1, _08138C40 @ =gUnknown_02024A60
	ldrb r2, [r1]
	lsls r2, 9
	adds r2, r7
	movs r1, 0x35
	bl SetMonData
	b _08138C5A
	.align 2, 0
_08138C3C: .4byte gPlayerParty
_08138C40: .4byte gUnknown_02024A60
_08138C44:
	movs r0, 0x64
	muls r0, r5
	ldr r1, _08138C84 @ =gPlayerParty
	adds r0, r1
	ldr r1, _08138C88 @ =gUnknown_02024A60
	ldrb r2, [r1]
	lsls r2, 9
	adds r2, r7
	movs r1, 0x36
	bl SetMonData
_08138C5A:
	ldr r2, _08138C8C @ =gUnknown_02024A6A
	ldr r0, _08138C88 @ =gUnknown_02024A60
	ldrb r1, [r0]
	lsls r0, r1, 1
	adds r0, r2
	ldrh r2, [r0]
	movs r0, 0x64
	muls r0, r2
	ldr r2, _08138C84 @ =gPlayerParty
	adds r0, r2
	bl sub_80324F8
	add sp, 0x34
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_08138C84: .4byte gPlayerParty
_08138C88: .4byte gUnknown_02024A60
_08138C8C: .4byte gUnknown_02024A6A
	thumb_func_end sub_8138294

	thumb_func_start sub_8138C90
sub_8138C90: @ 8138C90
	push {lr}
	bl dp01_tbl5_exec_completed
	pop {r0}
	bx r0
	thumb_func_end sub_8138C90

	thumb_func_start sub_8138C9C
sub_8138C9C: @ 8138C9C
	push {lr}
	bl dp01_tbl5_exec_completed
	pop {r0}
	bx r0
	thumb_func_end sub_8138C9C

	thumb_func_start sub_8138CA8
sub_8138CA8: @ 8138CA8
	push {lr}
	bl dp01_tbl5_exec_completed
	pop {r0}
	bx r0
	thumb_func_end sub_8138CA8

	thumb_func_start sub_8138CB4
sub_8138CB4: @ 8138CB4
	push {r4-r6,lr}
	ldr r0, _08138CE0 @ =gUnknown_02023A60
	ldr r6, _08138CE4 @ =gUnknown_02024A60
	ldrb r2, [r6]
	lsls r1, r2, 9
	adds r0, 0x1
	adds r1, r0
	ldrb r0, [r1]
	cmp r0, 0
	bne _08138CF0
	adds r0, r2, 0
	adds r1, r2, 0
	movs r3, 0x1
	bl move_anim_start_t4
	ldr r0, _08138CE8 @ =gUnknown_03004330
	ldrb r1, [r6]
	lsls r1, 2
	adds r1, r0
	ldr r0, _08138CEC @ =sub_813789C
	str r0, [r1]
	b _08138D26
	.align 2, 0
_08138CE0: .4byte gUnknown_02023A60
_08138CE4: .4byte gUnknown_02024A60
_08138CE8: .4byte gUnknown_03004330
_08138CEC: .4byte sub_813789C
_08138CF0:
	ldr r5, _08138D2C @ =gUnknown_02024BE0
	adds r0, r2, r5
	ldrb r1, [r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	ldr r4, _08138D30 @ =gSprites
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
	ldr r1, _08138D34 @ =gUnknown_03004340
	ldrb r0, [r6]
	adds r0, r1
	ldrb r0, [r0]
	bl sub_8043DB0
	bl dp01_tbl5_exec_completed
_08138D26:
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_08138D2C: .4byte gUnknown_02024BE0
_08138D30: .4byte gSprites
_08138D34: .4byte gUnknown_03004340
	thumb_func_end sub_8138CB4

	thumb_func_start sub_8138D38
sub_8138D38: @ 8138D38
	push {r4-r6,lr}
	ldr r4, _08138DE0 @ =gUnknown_02024A60
	ldrb r1, [r4]
	movs r0, 0x2
	bl sub_8031AF4
	ldrb r0, [r4]
	bl battle_get_per_side_status
	adds r1, r0, 0
	lsls r1, 24
	lsrs r1, 24
	movs r0, 0x2
	bl GetMonSpriteTemplate_803C5A0
	ldr r0, _08138DE4 @ =gUnknown_02024E8C
	ldr r1, _08138DE8 @ =gTrainerBackPicCoords
	ldrb r1, [r1, 0x8]
	movs r2, 0x8
	subs r2, r1
	lsls r2, 18
	movs r1, 0xA0
	lsls r1, 15
	adds r2, r1
	asrs r2, 16
	movs r1, 0x50
	movs r3, 0x1E
	bl CreateSprite
	ldr r6, _08138DEC @ =gUnknown_02024BE0
	ldrb r1, [r4]
	adds r1, r6
	strb r0, [r1]
	ldr r5, _08138DF0 @ =gSprites
	ldrb r3, [r4]
	adds r0, r3, r6
	ldrb r0, [r0]
	lsls r1, r0, 4
	adds r1, r0
	lsls r1, 2
	adds r1, r5
	lsls r3, 4
	ldrb r2, [r1, 0x5]
	movs r0, 0xF
	ands r0, r2
	orrs r0, r3
	strb r0, [r1, 0x5]
	ldrb r0, [r4]
	adds r0, r6
	ldrb r1, [r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r5
	movs r1, 0xF0
	strh r1, [r0, 0x24]
	ldrb r0, [r4]
	adds r0, r6
	ldrb r1, [r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r5
	ldr r1, _08138DF4 @ =0x0000fffe
	strh r1, [r0, 0x2E]
	ldrb r0, [r4]
	adds r0, r6
	ldrb r1, [r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r5, 0x1C
	adds r0, r5
	ldr r1, _08138DF8 @ =sub_80313A0
	str r1, [r0]
	ldr r1, _08138DFC @ =gUnknown_03004330
	ldrb r0, [r4]
	lsls r0, 2
	adds r0, r1
	ldr r1, _08138E00 @ =sub_813741C
	str r1, [r0]
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_08138DE0: .4byte gUnknown_02024A60
_08138DE4: .4byte gUnknown_02024E8C
_08138DE8: .4byte gTrainerBackPicCoords
_08138DEC: .4byte gUnknown_02024BE0
_08138DF0: .4byte gSprites
_08138DF4: .4byte 0x0000fffe
_08138DF8: .4byte sub_80313A0
_08138DFC: .4byte gUnknown_03004330
_08138E00: .4byte sub_813741C
	thumb_func_end sub_8138D38

	thumb_func_start sub_8138E04
sub_8138E04: @ 8138E04
	push {r4-r6,lr}
	ldr r4, _08138EAC @ =gUnknown_02024A60
	ldrb r1, [r4]
	movs r0, 0x2
	bl sub_8031AF4
	ldrb r0, [r4]
	bl battle_get_per_side_status
	adds r1, r0, 0
	lsls r1, 24
	lsrs r1, 24
	movs r0, 0x2
	bl GetMonSpriteTemplate_803C5A0
	ldr r0, _08138EB0 @ =gUnknown_02024E8C
	ldr r1, _08138EB4 @ =gTrainerBackPicCoords
	ldrb r1, [r1, 0x8]
	movs r2, 0x8
	subs r2, r1
	lsls r2, 18
	movs r1, 0xA0
	lsls r1, 15
	adds r2, r1
	asrs r2, 16
	movs r1, 0x50
	movs r3, 0x1E
	bl CreateSprite
	ldr r6, _08138EB8 @ =gUnknown_02024BE0
	ldrb r1, [r4]
	adds r1, r6
	strb r0, [r1]
	ldr r5, _08138EBC @ =gSprites
	ldrb r3, [r4]
	adds r0, r3, r6
	ldrb r0, [r0]
	lsls r1, r0, 4
	adds r1, r0
	lsls r1, 2
	adds r1, r5
	lsls r3, 4
	ldrb r2, [r1, 0x5]
	movs r0, 0xF
	ands r0, r2
	orrs r0, r3
	strb r0, [r1, 0x5]
	ldrb r0, [r4]
	adds r0, r6
	ldrb r1, [r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r5
	ldr r1, _08138EC0 @ =0x0000ffa0
	strh r1, [r0, 0x24]
	ldrb r0, [r4]
	adds r0, r6
	ldrb r1, [r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r5
	movs r1, 0x2
	strh r1, [r0, 0x2E]
	ldrb r0, [r4]
	adds r0, r6
	ldrb r1, [r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r5, 0x1C
	adds r0, r5
	ldr r1, _08138EC4 @ =sub_80313A0
	str r1, [r0]
	ldr r1, _08138EC8 @ =gUnknown_03004330
	ldrb r0, [r4]
	lsls r0, 2
	adds r0, r1
	ldr r1, _08138ECC @ =sub_8137908
	str r1, [r0]
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_08138EAC: .4byte gUnknown_02024A60
_08138EB0: .4byte gUnknown_02024E8C
_08138EB4: .4byte gTrainerBackPicCoords
_08138EB8: .4byte gUnknown_02024BE0
_08138EBC: .4byte gSprites
_08138EC0: .4byte 0x0000ffa0
_08138EC4: .4byte sub_80313A0
_08138EC8: .4byte gUnknown_03004330
_08138ECC: .4byte sub_8137908
	thumb_func_end sub_8138E04

	thumb_func_start sub_8138ED0
sub_8138ED0: @ 8138ED0
	push {lr}
	bl dp01_tbl5_exec_completed
	pop {r0}
	bx r0
	thumb_func_end sub_8138ED0

	thumb_func_start sub_8138EDC
sub_8138EDC: @ 8138EDC
	push {lr}
	bl dp01_tbl5_exec_completed
	pop {r0}
	bx r0
	thumb_func_end sub_8138EDC

	thumb_func_start sub_8138EE8
sub_8138EE8: @ 8138EE8
	push {lr}
	bl dp01_tbl5_exec_completed
	pop {r0}
	bx r0
	thumb_func_end sub_8138EE8

	thumb_func_start sub_8138EF4
sub_8138EF4: @ 8138EF4
	push {r4,r5,lr}
	ldr r1, _08138F30 @ =0x02017840
	movs r0, 0x4
	strb r0, [r1, 0x8]
	ldr r1, _08138F34 @ =gUnknown_02024E6D
	movs r0, 0x1
	strb r0, [r1]
	ldr r5, _08138F38 @ =gUnknown_02024A60
	ldrb r4, [r5]
	movs r0, 0x1
	bl battle_get_side_with_given_state
	adds r2, r0, 0
	lsls r2, 24
	lsrs r2, 24
	adds r0, r4, 0
	adds r1, r4, 0
	movs r3, 0x4
	bl move_anim_start_t4
	ldr r1, _08138F3C @ =gUnknown_03004330
	ldrb r0, [r5]
	lsls r0, 2
	adds r0, r1
	ldr r1, _08138F40 @ =bx_wait_t5
	str r1, [r0]
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_08138F30: .4byte 0x02017840
_08138F34: .4byte gUnknown_02024E6D
_08138F38: .4byte gUnknown_02024A60
_08138F3C: .4byte gUnknown_03004330
_08138F40: .4byte bx_wait_t5
	thumb_func_end sub_8138EF4

	thumb_func_start sub_8138F44
sub_8138F44: @ 8138F44
	push {r4,r5,lr}
	ldr r1, _08138F88 @ =gUnknown_02023A60
	ldr r5, _08138F8C @ =gUnknown_02024A60
	ldrb r0, [r5]
	lsls r0, 9
	adds r1, 0x1
	adds r0, r1
	ldrb r1, [r0]
	ldr r0, _08138F90 @ =0x02017840
	strb r1, [r0, 0x8]
	ldr r1, _08138F94 @ =gUnknown_02024E6D
	movs r0, 0x1
	strb r0, [r1]
	ldrb r4, [r5]
	movs r0, 0x1
	bl battle_get_side_with_given_state
	adds r2, r0, 0
	lsls r2, 24
	lsrs r2, 24
	adds r0, r4, 0
	adds r1, r4, 0
	movs r3, 0x4
	bl move_anim_start_t4
	ldr r1, _08138F98 @ =gUnknown_03004330
	ldrb r0, [r5]
	lsls r0, 2
	adds r0, r1
	ldr r1, _08138F9C @ =bx_wait_t5
	str r1, [r0]
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_08138F88: .4byte gUnknown_02023A60
_08138F8C: .4byte gUnknown_02024A60
_08138F90: .4byte 0x02017840
_08138F94: .4byte gUnknown_02024E6D
_08138F98: .4byte gUnknown_03004330
_08138F9C: .4byte bx_wait_t5
	thumb_func_end sub_8138F44

	thumb_func_start sub_8138FA0
sub_8138FA0: @ 8138FA0
	push {lr}
	bl dp01_tbl5_exec_completed
	pop {r0}
	bx r0
	thumb_func_end sub_8138FA0

	thumb_func_start sub_8138FAC
sub_8138FAC: @ 8138FAC
	push {r4-r6,lr}
	ldr r0, _08139080 @ =gUnknown_02023A60
	mov r12, r0
	ldr r6, _08139084 @ =gUnknown_02024A60
	ldrb r2, [r6]
	lsls r2, 9
	adds r0, 0x1
	adds r0, r2, r0
	ldrb r0, [r0]
	mov r1, r12
	adds r1, 0x2
	adds r1, r2, r1
	ldrb r1, [r1]
	lsls r1, 8
	orrs r0, r1
	ldr r5, _08139088 @ =gUnknown_0202F7C4
	mov r1, r12
	adds r1, 0x3
	adds r2, r1
	ldrb r1, [r2]
	strb r1, [r5]
	ldr r4, _0813908C @ =gUnknown_0202F7BC
	ldrb r2, [r6]
	lsls r2, 9
	mov r1, r12
	adds r1, 0x4
	adds r1, r2, r1
	ldrb r3, [r1]
	mov r1, r12
	adds r1, 0x5
	adds r2, r1
	ldrb r1, [r2]
	lsls r1, 8
	orrs r3, r1
	strh r3, [r4]
	ldr r4, _08139090 @ =gUnknown_0202F7B8
	ldrb r2, [r6]
	lsls r2, 9
	mov r1, r12
	adds r1, 0x6
	adds r1, r2, r1
	ldrb r3, [r1]
	mov r1, r12
	adds r1, 0x7
	adds r1, r2, r1
	ldrb r1, [r1]
	lsls r1, 8
	orrs r3, r1
	mov r1, r12
	adds r1, 0x8
	adds r1, r2, r1
	ldrb r1, [r1]
	lsls r1, 16
	orrs r3, r1
	mov r1, r12
	adds r1, 0x9
	adds r2, r1
	ldrb r1, [r2]
	lsls r1, 24
	orrs r3, r1
	str r3, [r4]
	ldr r3, _08139094 @ =gUnknown_0202F7BE
	ldrb r1, [r6]
	lsls r1, 9
	mov r2, r12
	adds r2, 0xA
	adds r1, r2
	ldrb r1, [r1]
	strb r1, [r3]
	ldr r4, _08139098 @ =gUnknown_0202F7C0
	ldrb r2, [r6]
	lsls r2, 9
	mov r1, r12
	adds r1, 0xC
	adds r1, r2, r1
	ldrb r3, [r1]
	mov r1, r12
	adds r1, 0xD
	adds r2, r1
	ldrb r1, [r2]
	lsls r1, 8
	orrs r3, r1
	strh r3, [r4]
	ldr r3, _0813909C @ =gUnknown_0202F7B4
	ldrb r2, [r6]
	lsls r2, 9
	mov r1, r12
	adds r1, 0x10
	adds r2, r1
	str r2, [r3]
	ldr r3, _081390A0 @ =gUnknown_02024E70
	ldrb r1, [r6]
	lsls r1, 2
	adds r1, r3
	ldr r2, [r2]
	str r2, [r1]
	ldrb r1, [r5]
	bl sub_8031720
	lsls r0, 24
	lsrs r2, r0, 24
	cmp r2, 0
	beq _081390A4
	bl dp01_tbl5_exec_completed
	b _081390BE
	.align 2, 0
_08139080: .4byte gUnknown_02023A60
_08139084: .4byte gUnknown_02024A60
_08139088: .4byte gUnknown_0202F7C4
_0813908C: .4byte gUnknown_0202F7BC
_08139090: .4byte gUnknown_0202F7B8
_08139094: .4byte gUnknown_0202F7BE
_08139098: .4byte gUnknown_0202F7C0
_0813909C: .4byte gUnknown_0202F7B4
_081390A0: .4byte gUnknown_02024E70
_081390A4:
	ldrb r1, [r6]
	lsls r0, r1, 1
	adds r0, r1
	lsls r0, 2
	ldr r1, _081390C4 @ =0x02017810
	adds r0, r1
	strb r2, [r0, 0x4]
	ldr r1, _081390C8 @ =gUnknown_03004330
	ldrb r0, [r6]
	lsls r0, 2
	adds r0, r1
	ldr r1, _081390CC @ =sub_81390D0
	str r1, [r0]
_081390BE:
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_081390C4: .4byte 0x02017810
_081390C8: .4byte gUnknown_03004330
_081390CC: .4byte sub_81390D0
	thumb_func_end sub_8138FAC

	thumb_func_start sub_81390D0
sub_81390D0: @ 81390D0
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	ldr r2, _0813910C @ =gUnknown_02023A60
	ldr r5, _08139110 @ =gUnknown_02024A60
	ldrb r3, [r5]
	lsls r1, r3, 9
	adds r0, r2, 0x1
	mov r8, r0
	adds r0, r1, r0
	ldrb r4, [r0]
	adds r7, r2, 0x2
	adds r1, r7
	ldrb r0, [r1]
	lsls r0, 8
	orrs r4, r0
	lsls r0, r3, 1
	adds r0, r3
	lsls r0, 2
	ldr r6, _08139114 @ =0x02017810
	adds r0, r6
	ldrb r2, [r0, 0x4]
	cmp r2, 0x1
	beq _08139150
	cmp r2, 0x1
	bgt _08139118
	cmp r2, 0
	beq _08139122
	b _081391FC
	.align 2, 0
_0813910C: .4byte gUnknown_02023A60
_08139110: .4byte gUnknown_02024A60
_08139114: .4byte 0x02017810
_08139118:
	cmp r2, 0x2
	beq _08139176
	cmp r2, 0x3
	beq _081391C4
	b _081391FC
_08139122:
	lsls r0, r3, 2
	adds r1, r6, 0
	subs r1, 0x10
	adds r0, r1
	ldrb r1, [r0]
	movs r0, 0x4
	ands r0, r1
	cmp r0, 0
	beq _08139140
	adds r0, r3, 0
	adds r1, r3, 0
	adds r2, r3, 0
	movs r3, 0x5
	bl move_anim_start_t4
_08139140:
	ldrb r0, [r5]
	lsls r1, r0, 1
	adds r1, r0
	lsls r1, 2
	adds r1, r6
	movs r0, 0x1
	strb r0, [r1, 0x4]
	b _081391FC
_08139150:
	ldrb r1, [r0]
	movs r0, 0x40
	ands r0, r1
	cmp r0, 0
	bne _081391FC
	movs r0, 0
	bl sub_80326EC
	adds r0, r4, 0
	bl ExecuteMoveAnim
	ldrb r0, [r5]
	lsls r1, r0, 1
	adds r1, r0
	lsls r1, 2
	adds r1, r6
	movs r0, 0x2
	strb r0, [r1, 0x4]
	b _081391FC
_08139176:
	ldr r0, _081391BC @ =gAnimScriptCallback
	ldr r0, [r0]
	bl _call_via_r0
	ldr r0, _081391C0 @ =gAnimScriptActive
	ldrb r0, [r0]
	cmp r0, 0
	bne _081391FC
	movs r0, 0x1
	bl sub_80326EC
	ldrb r2, [r5]
	lsls r0, r2, 2
	adds r1, r6, 0
	subs r1, 0x10
	adds r0, r1
	ldrb r1, [r0]
	movs r0, 0x4
	ands r0, r1
	cmp r0, 0
	beq _081391AA
	adds r0, r2, 0
	adds r1, r2, 0
	movs r3, 0x6
	bl move_anim_start_t4
_081391AA:
	ldrb r0, [r5]
	lsls r1, r0, 1
	adds r1, r0
	lsls r1, 2
	adds r1, r6
	movs r0, 0x3
	strb r0, [r1, 0x4]
	b _081391FC
	.align 2, 0
_081391BC: .4byte gAnimScriptCallback
_081391C0: .4byte gAnimScriptActive
_081391C4:
	ldrb r1, [r0]
	movs r0, 0x40
	ands r0, r1
	lsls r0, 24
	lsrs r4, r0, 24
	cmp r4, 0
	bne _081391FC
	bl sub_8031F24
	ldrb r0, [r5]
	lsls r2, r0, 9
	mov r3, r8
	adds r1, r2, r3
	ldrb r1, [r1]
	adds r2, r7
	ldrb r2, [r2]
	lsls r2, 8
	orrs r1, r2
	bl sub_80324BC
	ldrb r1, [r5]
	lsls r0, r1, 1
	adds r0, r1
	lsls r0, 2
	adds r0, r6
	strb r4, [r0, 0x4]
	bl dp01_tbl5_exec_completed
_081391FC:
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r0}
	bx r0
	thumb_func_end sub_81390D0

	thumb_func_start sub_8139208
sub_8139208: @ 8139208
	push {r4,r5,lr}
	sub sp, 0x4
	ldr r0, _08139254 @ =gUnknown_030042A4
	movs r1, 0
	strh r1, [r0]
	ldr r0, _08139258 @ =gUnknown_030042A0
	strh r1, [r0]
	ldr r5, _0813925C @ =gUnknown_02024A60
	ldrb r0, [r5]
	lsls r0, 9
	ldr r1, _08139260 @ =gUnknown_02023A62
	adds r4, r0, r1
	ldrh r0, [r4]
	cmp r0, 0x2
	bne _0813922A
	bl sub_814A7FC
_0813922A:
	ldrh r0, [r4]
	bl sub_8120AA8
	ldr r0, _08139264 @ =gUnknown_03004210
	ldr r1, _08139268 @ =gUnknown_020238CC
	movs r2, 0xF
	str r2, [sp]
	movs r2, 0x90
	movs r3, 0x2
	bl sub_8002EB0
	ldr r1, _0813926C @ =gUnknown_03004330
	ldrb r0, [r5]
	lsls r0, 2
	adds r0, r1
	ldr r1, _08139270 @ =sub_8137454
	str r1, [r0]
	add sp, 0x4
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_08139254: .4byte gUnknown_030042A4
_08139258: .4byte gUnknown_030042A0
_0813925C: .4byte gUnknown_02024A60
_08139260: .4byte gUnknown_02023A62
_08139264: .4byte gUnknown_03004210
_08139268: .4byte gUnknown_020238CC
_0813926C: .4byte gUnknown_03004330
_08139270: .4byte sub_8137454
	thumb_func_end sub_8139208

	thumb_func_start dp01t_11_5_message_for_player_only
dp01t_11_5_message_for_player_only: @ 8139274
	push {lr}
	ldr r0, _0813928C @ =gUnknown_02024A60
	ldrb r0, [r0]
	bl battle_side_get_owner
	lsls r0, 24
	cmp r0, 0
	bne _08139290
	bl sub_8139208
	b _08139294
	.align 2, 0
_0813928C: .4byte gUnknown_02024A60
_08139290:
	bl dp01_tbl5_exec_completed
_08139294:
	pop {r0}
	bx r0
	thumb_func_end dp01t_11_5_message_for_player_only

	thumb_func_start sub_8139298
sub_8139298: @ 8139298
	push {r4,r5,lr}
	sub sp, 0x8
	ldr r0, _0813934C @ =gUnknown_030042A4
	movs r2, 0
	strh r2, [r0]
	ldr r1, _08139350 @ =gUnknown_030042A0
	movs r0, 0xA0
	strh r0, [r1]
	ldr r4, _08139354 @ =gUnknown_03004210
	movs r5, 0
	strb r2, [r4, 0x6]
	movs r0, 0x1B
	str r0, [sp]
	movs r0, 0x12
	str r0, [sp, 0x4]
	adds r0, r4, 0
	movs r1, 0xA
	movs r2, 0x2
	movs r3, 0xF
	bl FillWindowRect_DefaultPalette
	movs r0, 0x10
	str r0, [sp]
	movs r0, 0x24
	str r0, [sp, 0x4]
	adds r0, r4, 0
	movs r1, 0xA
	movs r2, 0x2
	movs r3, 0x23
	bl FillWindowRect_DefaultPalette
	ldr r1, _08139358 @ =gUnknown_03004330
	ldr r0, _0813935C @ =gUnknown_02024A60
	ldrb r0, [r0]
	lsls r0, 2
	adds r0, r1
	ldr r1, _08139360 @ =sub_81372BC
	str r1, [r0]
	ldr r1, _08139364 @ =gUnknown_08400CF3
	movs r2, 0xC8
	lsls r2, 1
	movs r0, 0x23
	str r0, [sp]
	adds r0, r4, 0
	movs r3, 0x12
	bl InitWindow
	adds r0, r4, 0
	bl sub_8002F44
	ldr r1, _08139368 @ =0x0000ffff
	ldr r3, _0813936C @ =0x00002d9f
	str r5, [sp]
	movs r0, 0
	movs r2, 0xC
	bl sub_814A5C0
	movs r4, 0
_0813930C:
	lsls r0, r4, 24
	lsrs r0, 24
	bl nullsub_8
	adds r4, 0x1
	cmp r4, 0x3
	ble _0813930C
	movs r0, 0
	movs r1, 0
	bl sub_802E3E4
	ldr r0, _08139370 @ =gUnknown_08400CCC
	bl get_battle_strings_
	ldr r4, _08139354 @ =gUnknown_03004210
	ldr r1, _08139374 @ =gUnknown_020238CC
	movs r2, 0xDC
	lsls r2, 1
	movs r0, 0x23
	str r0, [sp]
	adds r0, r4, 0
	movs r3, 0x2
	bl InitWindow
	adds r0, r4, 0
	bl sub_8002F44
	add sp, 0x8
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_0813934C: .4byte gUnknown_030042A4
_08139350: .4byte gUnknown_030042A0
_08139354: .4byte gUnknown_03004210
_08139358: .4byte gUnknown_03004330
_0813935C: .4byte gUnknown_02024A60
_08139360: .4byte sub_81372BC
_08139364: .4byte gUnknown_08400CF3
_08139368: .4byte 0x0000ffff
_0813936C: .4byte 0x00002d9f
_08139370: .4byte gUnknown_08400CCC
_08139374: .4byte gUnknown_020238CC
	thumb_func_end sub_8139298

	thumb_func_start sub_8139378
sub_8139378: @ 8139378
	push {lr}
	bl dp01_tbl5_exec_completed
	pop {r0}
	bx r0
	thumb_func_end sub_8139378

	thumb_func_start sub_8139384
sub_8139384: @ 8139384
	push {r4,r5,lr}
	ldr r5, _08139398 @ =0x02000000
	ldr r0, _0813939C @ =0x000160a9
	adds r4, r5, r0
	ldrb r0, [r4]
	cmp r0, 0
	beq _081393A0
	cmp r0, 0x1
	beq _081393B2
	b _081393DE
	.align 2, 0
_08139398: .4byte 0x02000000
_0813939C: .4byte 0x000160a9
_081393A0:
	bl sub_80304A8
	ldrb r0, [r4]
	adds r0, 0x1
	strb r0, [r4]
	ldr r0, _081393E4 @ =0x000160ab
	adds r1, r5, r0
	movs r0, 0x50
	strb r0, [r1]
_081393B2:
	ldr r1, _081393E8 @ =0x02000000
	ldr r0, _081393E4 @ =0x000160ab
	adds r1, r0
	ldrb r0, [r1]
	subs r0, 0x1
	strb r0, [r1]
	lsls r0, 24
	cmp r0, 0
	bne _081393DE
	bl sub_814A7FC
	movs r0, 0x5
	bl PlaySoundEffect
	movs r2, 0x80
	lsls r2, 1
	movs r0, 0x1
	movs r1, 0xA
	bl dp01_build_cmdbuf_x21_a_bb
	bl dp01_tbl5_exec_completed
_081393DE:
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_081393E4: .4byte 0x000160ab
_081393E8: .4byte 0x02000000
	thumb_func_end sub_8139384

	thumb_func_start sub_81393EC
sub_81393EC: @ 81393EC
	push {lr}
	sub sp, 0x4
	movs r0, 0x1
	negs r0, r0
	movs r1, 0
	str r1, [sp]
	movs r2, 0
	movs r3, 0x10
	bl BeginNormalPaletteFade
	ldr r1, _0813941C @ =gUnknown_03004330
	ldr r2, _08139420 @ =gUnknown_02024A60
	ldrb r0, [r2]
	lsls r0, 2
	adds r0, r1
	ldr r1, _08139424 @ =sub_81374C4
	str r1, [r0]
	ldr r1, _08139428 @ =gUnknown_02024E6C
	ldrb r0, [r2]
	strb r0, [r1]
	add sp, 0x4
	pop {r0}
	bx r0
	.align 2, 0
_0813941C: .4byte gUnknown_03004330
_08139420: .4byte gUnknown_02024A60
_08139424: .4byte sub_81374C4
_08139428: .4byte gUnknown_02024E6C
	thumb_func_end sub_81393EC

	thumb_func_start sub_813942C
sub_813942C: @ 813942C
	push {lr}
	bl dp01_tbl5_exec_completed
	pop {r0}
	bx r0
	thumb_func_end sub_813942C

	thumb_func_start sub_8139438
sub_8139438: @ 8139438
	push {lr}
	bl dp01_tbl5_exec_completed
	pop {r0}
	bx r0
	thumb_func_end sub_8139438

	thumb_func_start sub_8139444
sub_8139444: @ 8139444
	push {r4-r7,lr}
	mov r7, r9
	mov r6, r8
	push {r6,r7}
	sub sp, 0x4
	movs r0, 0
	bl load_gfxc_health_bar
	ldr r3, _081394BC @ =gUnknown_02023A60
	ldr r0, _081394C0 @ =gUnknown_02024A60
	mov r9, r0
	ldrb r4, [r0]
	lsls r2, r4, 9
	adds r0, r3, 0x2
	adds r0, r2, r0
	ldrb r1, [r0]
	adds r3, 0x3
	adds r2, r3
	ldrb r0, [r2]
	lsls r0, 8
	orrs r1, r0
	lsls r1, 16
	asrs r7, r1, 16
	ldr r0, _081394C4 @ =0x00007fff
	cmp r7, r0
	beq _081394D4
	ldr r6, _081394C8 @ =gUnknown_02024A6A
	lsls r0, r4, 1
	adds r0, r6
	ldrh r0, [r0]
	movs r5, 0x64
	muls r0, r5
	ldr r4, _081394CC @ =gPlayerParty
	adds r0, r4
	movs r1, 0x3A
	bl GetMonData
	mov r8, r0
	mov r1, r9
	ldrb r0, [r1]
	lsls r0, 1
	adds r0, r6
	ldrh r0, [r0]
	muls r0, r5
	adds r0, r4
	movs r1, 0x39
	bl GetMonData
	adds r3, r0, 0
	mov r1, r9
	ldrb r0, [r1]
	ldr r1, _081394D0 @ =gUnknown_03004340
	adds r1, r0, r1
	ldrb r1, [r1]
	str r7, [sp]
	mov r2, r8
	bl sub_8043D84
	b _0813950E
	.align 2, 0
_081394BC: .4byte gUnknown_02023A60
_081394C0: .4byte gUnknown_02024A60
_081394C4: .4byte 0x00007fff
_081394C8: .4byte gUnknown_02024A6A
_081394CC: .4byte gPlayerParty
_081394D0: .4byte gUnknown_03004340
_081394D4:
	ldr r1, _0813952C @ =gUnknown_02024A6A
	lsls r0, r4, 1
	adds r0, r1
	ldrh r1, [r0]
	movs r0, 0x64
	muls r0, r1
	ldr r1, _08139530 @ =gPlayerParty
	adds r0, r1
	movs r1, 0x3A
	bl GetMonData
	adds r2, r0, 0
	mov r1, r9
	ldrb r0, [r1]
	ldr r4, _08139534 @ =gUnknown_03004340
	adds r1, r0, r4
	ldrb r1, [r1]
	str r7, [sp]
	movs r3, 0
	bl sub_8043D84
	mov r1, r9
	ldrb r0, [r1]
	adds r0, r4
	ldrb r0, [r0]
	movs r1, 0
	movs r2, 0
	bl sub_80440EC
_0813950E:
	ldr r1, _08139538 @ =gUnknown_03004330
	ldr r0, _0813953C @ =gUnknown_02024A60
	ldrb r0, [r0]
	lsls r0, 2
	adds r0, r1
	ldr r1, _08139540 @ =sub_81377B0
	str r1, [r0]
	add sp, 0x4
	pop {r3,r4}
	mov r8, r3
	mov r9, r4
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_0813952C: .4byte gUnknown_02024A6A
_08139530: .4byte gPlayerParty
_08139534: .4byte gUnknown_03004340
_08139538: .4byte gUnknown_03004330
_0813953C: .4byte gUnknown_02024A60
_08139540: .4byte sub_81377B0
	thumb_func_end sub_8139444

	thumb_func_start sub_8139544
sub_8139544: @ 8139544
	push {lr}
	bl dp01_tbl5_exec_completed
	pop {r0}
	bx r0
	thumb_func_end sub_8139544

	thumb_func_start sub_8139550
sub_8139550: @ 8139550
	push {lr}
	bl dp01_tbl5_exec_completed
	pop {r0}
	bx r0
	thumb_func_end sub_8139550

	thumb_func_start sub_813955C
sub_813955C: @ 813955C
	push {lr}
	bl dp01_tbl5_exec_completed
	pop {r0}
	bx r0
	thumb_func_end sub_813955C

	thumb_func_start sub_8139568
sub_8139568: @ 8139568
	push {lr}
	bl dp01_tbl5_exec_completed
	pop {r0}
	bx r0
	thumb_func_end sub_8139568

	thumb_func_start sub_8139574
sub_8139574: @ 8139574
	push {lr}
	bl dp01_tbl5_exec_completed
	pop {r0}
	bx r0
	thumb_func_end sub_8139574

	thumb_func_start sub_8139580
sub_8139580: @ 8139580
	push {lr}
	bl dp01_tbl5_exec_completed
	pop {r0}
	bx r0
	thumb_func_end sub_8139580

	thumb_func_start sub_813958C
sub_813958C: @ 813958C
	push {lr}
	bl dp01_tbl5_exec_completed
	pop {r0}
	bx r0
	thumb_func_end sub_813958C

	thumb_func_start sub_8139598
sub_8139598: @ 8139598
	push {lr}
	bl dp01_tbl5_exec_completed
	pop {r0}
	bx r0
	thumb_func_end sub_8139598

	thumb_func_start sub_81395A4
sub_81395A4: @ 81395A4
	push {lr}
	bl dp01_tbl5_exec_completed
	pop {r0}
	bx r0
	thumb_func_end sub_81395A4

	thumb_func_start sub_81395B0
sub_81395B0: @ 81395B0
	push {lr}
	bl dp01_tbl5_exec_completed
	pop {r0}
	bx r0
	thumb_func_end sub_81395B0

	thumb_func_start sub_81395BC
sub_81395BC: @ 81395BC
	push {lr}
	bl dp01_tbl5_exec_completed
	pop {r0}
	bx r0
	thumb_func_end sub_81395BC

	thumb_func_start sub_81395C8
sub_81395C8: @ 81395C8
	push {lr}
	bl dp01_tbl5_exec_completed
	pop {r0}
	bx r0
	thumb_func_end sub_81395C8

	thumb_func_start sub_81395D4
sub_81395D4: @ 81395D4
	push {lr}
	bl dp01_tbl5_exec_completed
	pop {r0}
	bx r0
	thumb_func_end sub_81395D4

	thumb_func_start sub_81395E0
sub_81395E0: @ 81395E0
	push {lr}
	bl dp01_tbl5_exec_completed
	pop {r0}
	bx r0
	thumb_func_end sub_81395E0

	thumb_func_start sub_81395EC
sub_81395EC: @ 81395EC
	push {lr}
	bl dp01_tbl5_exec_completed
	pop {r0}
	bx r0
	thumb_func_end sub_81395EC

	thumb_func_start sub_81395F8
sub_81395F8: @ 81395F8
	push {lr}
	bl dp01_tbl5_exec_completed
	pop {r0}
	bx r0
	thumb_func_end sub_81395F8

	thumb_func_start sub_8139604
sub_8139604: @ 8139604
	push {r4,lr}
	ldr r3, _0813962C @ =gSprites
	ldr r2, _08139630 @ =gUnknown_02024BE0
	ldr r4, _08139634 @ =gUnknown_02024A60
	ldrb r0, [r4]
	adds r0, r2
	ldrb r1, [r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r3
	adds r0, 0x3E
	ldrb r0, [r0]
	lsls r0, 29
	cmp r0, 0
	bge _08139638
	bl dp01_tbl5_exec_completed
	b _08139662
	.align 2, 0
_0813962C: .4byte gSprites
_08139630: .4byte gUnknown_02024BE0
_08139634: .4byte gUnknown_02024A60
_08139638:
	ldr r1, _08139668 @ =gUnknown_02024E6D
	movs r0, 0x1
	strb r0, [r1]
	ldrb r0, [r4]
	adds r0, r2
	ldrb r1, [r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r3
	movs r1, 0
	strh r1, [r0, 0x30]
	ldrb r0, [r4]
	bl sub_8047858
	ldr r1, _0813966C @ =gUnknown_03004330
	ldrb r0, [r4]
	lsls r0, 2
	adds r0, r1
	ldr r1, _08139670 @ =bx_blink_t5
	str r1, [r0]
_08139662:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08139668: .4byte gUnknown_02024E6D
_0813966C: .4byte gUnknown_03004330
_08139670: .4byte bx_blink_t5
	thumb_func_end sub_8139604

	thumb_func_start sub_8139674
sub_8139674: @ 8139674
	push {lr}
	bl dp01_tbl5_exec_completed
	pop {r0}
	bx r0
	thumb_func_end sub_8139674

	thumb_func_start sub_8139680
sub_8139680: @ 8139680
	push {lr}
	ldr r2, _081396A8 @ =gUnknown_02023A60
	ldr r0, _081396AC @ =gUnknown_02024A60
	ldrb r1, [r0]
	lsls r1, 9
	adds r0, r2, 0x1
	adds r0, r1, r0
	ldrb r0, [r0]
	adds r2, 0x2
	adds r1, r2
	ldrb r1, [r1]
	lsls r1, 8
	orrs r0, r1
	bl PlaySoundEffect
	bl dp01_tbl5_exec_completed
	pop {r0}
	bx r0
	.align 2, 0
_081396A8: .4byte gUnknown_02023A60
_081396AC: .4byte gUnknown_02024A60
	thumb_func_end sub_8139680

	thumb_func_start sub_81396B0
sub_81396B0: @ 81396B0
	push {lr}
	ldr r2, _081396D8 @ =gUnknown_02023A60
	ldr r0, _081396DC @ =gUnknown_02024A60
	ldrb r1, [r0]
	lsls r1, 9
	adds r0, r2, 0x1
	adds r0, r1, r0
	ldrb r0, [r0]
	adds r2, 0x2
	adds r1, r2
	ldrb r1, [r1]
	lsls r1, 8
	orrs r0, r1
	bl PlayFanfare
	bl dp01_tbl5_exec_completed
	pop {r0}
	bx r0
	.align 2, 0
_081396D8: .4byte gUnknown_02023A60
_081396DC: .4byte gUnknown_02024A60
	thumb_func_end sub_81396B0

	thumb_func_start sub_81396E0
sub_81396E0: @ 81396E0
	push {lr}
	ldr r1, _08139710 @ =gUnknown_02024A6A
	ldr r0, _08139714 @ =gUnknown_02024A60
	ldrb r0, [r0]
	lsls r0, 1
	adds r0, r1
	ldrh r1, [r0]
	movs r0, 0x64
	muls r0, r1
	ldr r1, _08139718 @ =gPlayerParty
	adds r0, r1
	movs r1, 0xB
	bl GetMonData
	lsls r0, 16
	lsrs r0, 16
	movs r1, 0x19
	bl PlayCry1
	bl dp01_tbl5_exec_completed
	pop {r0}
	bx r0
	.align 2, 0
_08139710: .4byte gUnknown_02024A6A
_08139714: .4byte gUnknown_02024A60
_08139718: .4byte gPlayerParty
	thumb_func_end sub_81396E0

	thumb_func_start dp01t_2E_5_battle_intro
dp01t_2E_5_battle_intro: @ 813971C
	push {lr}
	ldr r1, _08139744 @ =gUnknown_02023A60
	ldr r0, _08139748 @ =gUnknown_02024A60
	ldrb r0, [r0]
	lsls r0, 9
	adds r1, 0x1
	adds r0, r1
	ldrb r0, [r0]
	bl sub_80E43C0
	ldr r2, _0813974C @ =gUnknown_02024DE8
	ldrh r0, [r2]
	movs r1, 0x1
	orrs r0, r1
	strh r0, [r2]
	bl dp01_tbl5_exec_completed
	pop {r0}
	bx r0
	.align 2, 0
_08139744: .4byte gUnknown_02023A60
_08139748: .4byte gUnknown_02024A60
_0813974C: .4byte gUnknown_02024DE8
	thumb_func_end dp01t_2E_5_battle_intro

	thumb_func_start sub_8139750
sub_8139750: @ 8139750
	push {r4-r7,lr}
	ldr r6, _08139880 @ =gUnknown_02024BE0
	ldr r7, _08139884 @ =gUnknown_02024A60
	ldrb r0, [r7]
	adds r0, r6
	ldrb r1, [r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	ldr r5, _08139888 @ =gSprites
	adds r0, r5
	bl oamt_add_pos2_onto_pos1
	ldrb r0, [r7]
	adds r0, r6
	ldrb r1, [r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r5
	movs r1, 0x32
	strh r1, [r0, 0x2E]
	ldrb r0, [r7]
	adds r0, r6
	ldrb r1, [r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r5
	ldr r1, _0813988C @ =0x0000ffd8
	strh r1, [r0, 0x32]
	ldrb r0, [r7]
	adds r0, r6
	ldrb r1, [r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r5
	ldrh r1, [r0, 0x22]
	strh r1, [r0, 0x36]
	ldrb r0, [r7]
	adds r0, r6
	ldrb r1, [r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r1, r5, 0
	adds r1, 0x1C
	adds r0, r1
	ldr r1, _08139890 @ =sub_8078B34
	str r1, [r0]
	ldrb r2, [r7]
	adds r0, r2, r6
	ldrb r1, [r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r5
	strh r2, [r0, 0x38]
	ldrb r0, [r7]
	adds r0, r6
	ldrb r1, [r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r5
	ldr r1, _08139894 @ =sub_8030E38
	bl oamt_set_x3A_32
	ldrb r0, [r7]
	adds r0, r6
	ldrb r1, [r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r5
	movs r1, 0x1
	bl StartSpriteAnim
	ldr r0, _08139898 @ =0x0000d6f8
	bl AllocSpritePalette
	adds r4, r0, 0
	lsls r4, 24
	ldr r0, _0813989C @ =gTrainerBackPicPaletteTable
	ldr r0, [r0, 0x10]
	lsrs r4, 20
	movs r2, 0x80
	lsls r2, 1
	adds r1, r4, r2
	movs r2, 0x20
	bl LoadCompressedPalette
	ldrb r0, [r7]
	adds r0, r6
	ldrb r0, [r0]
	lsls r1, r0, 4
	adds r1, r0
	lsls r1, 2
	adds r1, r5
	ldrb r2, [r1, 0x5]
	movs r0, 0xF
	ands r0, r2
	orrs r0, r4
	strb r0, [r1, 0x5]
	ldr r0, _081398A0 @ =sub_8139A2C
	movs r1, 0x5
	bl CreateTask
	lsls r0, 24
	lsrs r0, 24
	ldr r4, _081398A4 @ =gTasks
	lsls r1, r0, 2
	adds r1, r0
	lsls r1, 3
	adds r1, r4
	ldrb r0, [r7]
	strh r0, [r1, 0x8]
	ldrb r3, [r7]
	lsls r0, r3, 1
	adds r0, r3
	lsls r0, 2
	ldr r2, _081398A8 @ =0x02017810
	adds r0, r2
	ldrb r1, [r0]
	movs r0, 0x1
	ands r0, r1
	cmp r0, 0
	beq _08139864
	ldr r0, _081398AC @ =gUnknown_02024E68
	adds r0, r3, r0
	ldrb r1, [r0]
	lsls r0, r1, 2
	adds r0, r1
	lsls r0, 3
	adds r0, r4
	ldr r1, _081398B0 @ =sub_8044CA0
	str r1, [r0]
_08139864:
	adds r2, 0x30
	ldrb r0, [r2, 0x9]
	movs r1, 0x1
	orrs r0, r1
	strb r0, [r2, 0x9]
	ldr r1, _081398B4 @ =gUnknown_03004330
	ldrb r0, [r7]
	lsls r0, 2
	adds r0, r1
	ldr r1, _081398B8 @ =nullsub_91
	str r1, [r0]
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_08139880: .4byte gUnknown_02024BE0
_08139884: .4byte gUnknown_02024A60
_08139888: .4byte gSprites
_0813988C: .4byte 0x0000ffd8
_08139890: .4byte sub_8078B34
_08139894: .4byte sub_8030E38
_08139898: .4byte 0x0000d6f8
_0813989C: .4byte gTrainerBackPicPaletteTable
_081398A0: .4byte sub_8139A2C
_081398A4: .4byte gTasks
_081398A8: .4byte 0x02017810
_081398AC: .4byte gUnknown_02024E68
_081398B0: .4byte sub_8044CA0
_081398B4: .4byte gUnknown_03004330
_081398B8: .4byte nullsub_91
	thumb_func_end sub_8139750

	thumb_func_start sub_81398BC
sub_81398BC: @ 81398BC
	push {r4-r6,lr}
	mov r6, r10
	mov r5, r9
	mov r4, r8
	push {r4-r6}
	adds r6, r0, 0
	lsls r6, 24
	lsrs r6, 24
	lsls r0, r6, 2
	ldr r1, _08139A00 @ =0x02017800
	adds r0, r1
	movs r1, 0
	strh r1, [r0, 0x2]
	ldr r0, _08139A04 @ =gUnknown_02024A6A
	lsls r2, r6, 1
	adds r2, r0
	ldr r0, _08139A08 @ =gUnknown_02023A60
	lsls r1, r6, 9
	adds r0, 0x1
	adds r1, r0
	ldrb r0, [r1]
	strh r0, [r2]
	ldrh r1, [r2]
	movs r0, 0x64
	muls r0, r1
	ldr r1, _08139A0C @ =gPlayerParty
	adds r0, r1
	movs r1, 0xB
	bl GetMonData
	mov r8, r0
	lsls r0, 16
	lsrs r0, 16
	mov r8, r0
	ldr r0, _08139A10 @ =sub_80312F0
	bl CreateInvisibleSpriteWithCallback
	ldr r1, _08139A14 @ =gUnknown_0300434C
	mov r9, r1
	add r9, r6
	mov r1, r9
	strb r0, [r1]
	adds r0, r6, 0
	bl battle_get_per_side_status
	adds r1, r0, 0
	lsls r1, 24
	lsrs r1, 24
	mov r0, r8
	bl GetMonSpriteTemplate_803C56C
	ldr r0, _08139A18 @ =gUnknown_02024E8C
	mov r10, r0
	adds r0, r6, 0
	movs r1, 0x2
	bl sub_8077ABC
	adds r5, r0, 0
	lsls r5, 24
	lsrs r5, 24
	adds r0, r6, 0
	bl sub_8077F68
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	adds r0, r6, 0
	bl sub_8079E90
	adds r3, r0, 0
	lsls r3, 24
	lsrs r3, 24
	mov r0, r10
	adds r1, r5, 0
	adds r2, r4, 0
	bl CreateSprite
	ldr r4, _08139A1C @ =gUnknown_02024BE0
	adds r4, r6, r4
	strb r0, [r4]
	ldr r5, _08139A20 @ =gSprites
	mov r0, r9
	ldrb r1, [r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r5
	ldrb r1, [r4]
	strh r1, [r0, 0x30]
	ldrb r1, [r4]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r5
	strh r6, [r0, 0x2E]
	ldrb r1, [r4]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r5
	mov r1, r8
	strh r1, [r0, 0x32]
	ldrb r0, [r4]
	lsls r1, r0, 4
	adds r1, r0
	lsls r1, 2
	adds r1, r5
	lsls r3, r6, 4
	ldrb r2, [r1, 0x5]
	movs r0, 0xF
	ands r0, r2
	orrs r0, r3
	strb r0, [r1, 0x5]
	ldrb r1, [r4]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r5
	ldr r1, _08139A24 @ =gBattleMonForms
	adds r6, r1
	ldrb r1, [r6]
	bl StartSpriteAnim
	ldrb r1, [r4]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r5
	adds r0, 0x3E
	ldrb r1, [r0]
	movs r2, 0x4
	orrs r1, r2
	strb r1, [r0]
	ldrb r1, [r4]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r1, r5, 0
	adds r1, 0x1C
	adds r0, r1
	ldr r1, _08139A28 @ =SpriteCallbackDummy
	str r1, [r0]
	movs r0, 0
	movs r1, 0xFF
	bl sub_8046400
	mov r1, r9
	ldrb r2, [r1]
	lsls r1, r2, 4
	adds r1, r2
	lsls r1, 2
	adds r1, r5
	lsls r0, 24
	lsrs r0, 24
	strh r0, [r1, 0x2E]
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_08139A00: .4byte 0x02017800
_08139A04: .4byte gUnknown_02024A6A
_08139A08: .4byte gUnknown_02023A60
_08139A0C: .4byte gPlayerParty
_08139A10: .4byte sub_80312F0
_08139A14: .4byte gUnknown_0300434C
_08139A18: .4byte gUnknown_02024E8C
_08139A1C: .4byte gUnknown_02024BE0
_08139A20: .4byte gSprites
_08139A24: .4byte gBattleMonForms
_08139A28: .4byte SpriteCallbackDummy
	thumb_func_end sub_81398BC

	thumb_func_start sub_8139A2C
sub_8139A2C: @ 8139A2C
	push {r4-r6,lr}
	lsls r0, 24
	lsrs r6, r0, 24
	ldr r1, _08139A4C @ =gTasks
	lsls r0, r6, 2
	adds r0, r6
	lsls r0, 3
	adds r1, r0, r1
	ldrh r2, [r1, 0xA]
	movs r3, 0xA
	ldrsh r0, [r1, r3]
	cmp r0, 0x1E
	bgt _08139A50
	adds r0, r2, 0x1
	strh r0, [r1, 0xA]
	b _08139A86
	.align 2, 0
_08139A4C: .4byte gTasks
_08139A50:
	ldr r4, _08139A8C @ =gUnknown_02024A60
	ldrb r5, [r4]
	ldrh r0, [r1, 0x8]
	strb r0, [r4]
	ldr r0, _08139A90 @ =gUnknown_02023A60
	ldrb r1, [r4]
	lsls r2, r1, 9
	adds r0, 0x1
	adds r2, r0
	ldr r0, _08139A94 @ =gUnknown_02024A6A
	lsls r1, 1
	adds r1, r0
	ldrh r0, [r1]
	strb r0, [r2]
	ldrb r0, [r4]
	bl sub_81398BC
	ldr r1, _08139A98 @ =gUnknown_03004330
	ldrb r0, [r4]
	lsls r0, 2
	adds r0, r1
	ldr r1, _08139A9C @ =sub_8137538
	str r1, [r0]
	strb r5, [r4]
	adds r0, r6, 0
	bl DestroyTask
_08139A86:
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_08139A8C: .4byte gUnknown_02024A60
_08139A90: .4byte gUnknown_02023A60
_08139A94: .4byte gUnknown_02024A6A
_08139A98: .4byte gUnknown_03004330
_08139A9C: .4byte sub_8137538
	thumb_func_end sub_8139A2C

	thumb_func_start sub_8139AA0
sub_8139AA0: @ 8139AA0
	push {r4,r5,lr}
	ldr r1, _08139AC8 @ =gUnknown_02023A60
	ldr r0, _08139ACC @ =gUnknown_02024A60
	ldrb r2, [r0]
	lsls r0, r2, 9
	adds r1, 0x1
	adds r0, r1
	ldrb r0, [r0]
	cmp r0, 0
	beq _08139AD0
	adds r0, r2, 0
	bl battle_side_get_owner
	lsls r0, 24
	cmp r0, 0
	bne _08139AD0
	bl dp01_tbl5_exec_completed
	b _08139B0A
	.align 2, 0
_08139AC8: .4byte gUnknown_02023A60
_08139ACC: .4byte gUnknown_02024A60
_08139AD0:
	ldr r5, _08139B10 @ =gUnknown_02024A60
	ldrb r1, [r5]
	lsls r0, r1, 1
	adds r0, r1
	lsls r0, 2
	ldr r1, _08139B14 @ =0x02017810
	adds r0, r1
	ldrb r1, [r0]
	movs r2, 0x1
	orrs r1, r2
	strb r1, [r0]
	ldrb r0, [r5]
	lsls r4, r0, 9
	ldr r3, _08139B18 @ =gUnknown_02023A64
	adds r1, r4, r3
	subs r2, r3, 0x3
	adds r2, r4, r2
	ldrb r2, [r2]
	subs r3, 0x2
	adds r4, r3
	ldrb r3, [r4]
	bl sub_8044804
	ldr r2, _08139B1C @ =gUnknown_02024E68
	ldrb r1, [r5]
	adds r1, r2
	strb r0, [r1]
	bl dp01_tbl5_exec_completed
_08139B0A:
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_08139B10: .4byte gUnknown_02024A60
_08139B14: .4byte 0x02017810
_08139B18: .4byte gUnknown_02023A64
_08139B1C: .4byte gUnknown_02024E68
	thumb_func_end sub_8139AA0

	thumb_func_start sub_8139B20
sub_8139B20: @ 8139B20
	push {lr}
	bl dp01_tbl5_exec_completed
	pop {r0}
	bx r0
	thumb_func_end sub_8139B20

	thumb_func_start sub_8139B2C
sub_8139B2C: @ 8139B2C
	push {lr}
	bl dp01_tbl5_exec_completed
	pop {r0}
	bx r0
	thumb_func_end sub_8139B2C

	thumb_func_start sub_8139B38
sub_8139B38: @ 8139B38
	push {lr}
	bl dp01_tbl5_exec_completed
	pop {r0}
	bx r0
	thumb_func_end sub_8139B38

	thumb_func_start sub_8139B44
sub_8139B44: @ 8139B44
	push {r4-r6,lr}
	sub sp, 0x4
	ldr r5, _08139B7C @ =gUnknown_02023A60
	ldr r6, _08139B80 @ =gUnknown_02024A60
	ldrb r2, [r6]
	lsls r1, r2, 9
	adds r0, r5, 0x1
	adds r0, r1, r0
	ldrb r3, [r0]
	adds r0, r5, 0x2
	adds r0, r1, r0
	ldrb r4, [r0]
	adds r5, 0x3
	adds r1, r5
	ldrb r0, [r1]
	lsls r0, 8
	orrs r4, r0
	str r4, [sp]
	adds r0, r2, 0
	adds r1, r2, 0
	bl move_anim_start_t3
	lsls r0, 24
	cmp r0, 0
	beq _08139B84
	bl dp01_tbl5_exec_completed
	b _08139B90
	.align 2, 0
_08139B7C: .4byte gUnknown_02023A60
_08139B80: .4byte gUnknown_02024A60
_08139B84:
	ldr r0, _08139B98 @ =gUnknown_03004330
	ldrb r1, [r6]
	lsls r1, 2
	adds r1, r0
	ldr r0, _08139B9C @ =sub_8137940
	str r0, [r1]
_08139B90:
	add sp, 0x4
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_08139B98: .4byte gUnknown_03004330
_08139B9C: .4byte sub_8137940
	thumb_func_end sub_8139B44

	thumb_func_start sub_8139BA0
sub_8139BA0: @ 8139BA0
	push {lr}
	bl dp01_tbl5_exec_completed
	pop {r0}
	bx r0
	thumb_func_end sub_8139BA0

	thumb_func_start sub_8139BAC
sub_8139BAC: @ 8139BAC
	push {lr}
	bl dp01_tbl5_exec_completed
	pop {r0}
	bx r0
	thumb_func_end sub_8139BAC

	thumb_func_start sub_8139BB8
sub_8139BB8: @ 8139BB8
	push {r4,lr}
	ldr r2, _08139BFC @ =gUnknown_02024D26
	ldr r1, _08139C00 @ =gUnknown_02023A60
	ldr r4, _08139C04 @ =gUnknown_02024A60
	ldrb r0, [r4]
	lsls r0, 9
	adds r1, 0x1
	adds r0, r1
	ldrb r0, [r0]
	strb r0, [r2]
	movs r0, 0x5
	bl FadeOutMapMusic
	movs r0, 0x3
	bl BeginFastPaletteFade
	bl dp01_tbl5_exec_completed
	ldr r0, _08139C08 @ =gBattleTypeFlags
	ldrh r1, [r0]
	movs r0, 0x6
	ands r0, r1
	cmp r0, 0x2
	bne _08139BF4
	ldr r0, _08139C0C @ =gUnknown_03004330
	ldrb r1, [r4]
	lsls r1, 2
	adds r1, r0
	ldr r0, _08139C10 @ =sub_813746C
	str r0, [r1]
_08139BF4:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08139BFC: .4byte gUnknown_02024D26
_08139C00: .4byte gUnknown_02023A60
_08139C04: .4byte gUnknown_02024A60
_08139C08: .4byte gBattleTypeFlags
_08139C0C: .4byte gUnknown_03004330
_08139C10: .4byte sub_813746C
	thumb_func_end sub_8139BB8

	thumb_func_start nullsub_80
nullsub_80: @ 8139C14
	bx lr
	thumb_func_end nullsub_80

	.align 2, 0 @ Don't pad with nop.
