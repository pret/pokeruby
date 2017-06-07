	.include "constants/gba_constants.inc"
	.include "constants/species_constants.inc"
	.include "asm/macros.inc"

	.syntax unified

	.text

	thumb_func_start sub_812023C
sub_812023C: @ 812023C
	push {lr}
	bl dp01_tbl3_exec_completed
	pop {r0}
	bx r0
	thumb_func_end sub_812023C

	thumb_func_start sub_8120248
sub_8120248: @ 8120248
	push {r4,lr}
	ldr r4, _081202A0 @ =gUnknown_02024A60
	ldrb r0, [r4]
	bl mplay_80342A4
	lsls r0, 24
	cmp r0, 0
	bne _08120298
	ldr r0, _081202A4 @ =gUnknown_03004340
	ldrb r1, [r4]
	adds r0, r1, r0
	ldrb r0, [r0]
	ldr r2, _081202A8 @ =gUnknown_02024A6A
	lsls r1, 1
	adds r1, r2
	ldrh r2, [r1]
	movs r1, 0x64
	muls r1, r2
	ldr r2, _081202AC @ =gPlayerParty
	adds r1, r2
	movs r2, 0x9
	bl sub_8045A5C
	ldrb r0, [r4]
	lsls r1, r0, 1
	adds r1, r0
	lsls r1, 2
	ldr r0, _081202B0 @ =0x02017810
	adds r1, r0
	ldrb r2, [r1]
	movs r0, 0x11
	negs r0, r0
	ands r0, r2
	strb r0, [r1]
	ldr r1, _081202B4 @ =gUnknown_03004330
	ldrb r0, [r4]
	lsls r0, 2
	adds r0, r1
	ldr r1, _081202B8 @ =sub_811E38C
	str r1, [r0]
_08120298:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_081202A0: .4byte gUnknown_02024A60
_081202A4: .4byte gUnknown_03004340
_081202A8: .4byte gUnknown_02024A6A
_081202AC: .4byte gPlayerParty
_081202B0: .4byte 0x02017810
_081202B4: .4byte gUnknown_03004330
_081202B8: .4byte sub_811E38C
	thumb_func_end sub_8120248

	thumb_func_start sub_81202BC
sub_81202BC: @ 81202BC
	push {r4,r5,lr}
	ldr r5, _08120314 @ =gUnknown_02024A60
	ldrb r0, [r5]
	bl mplay_80342A4
	lsls r0, 24
	cmp r0, 0
	bne _0812030C
	ldr r4, _08120318 @ =gUnknown_02023A60
	ldrb r3, [r5]
	lsls r3, 9
	adds r0, r4, 0x1
	adds r0, r3, r0
	ldrb r0, [r0]
	adds r1, r4, 0x2
	adds r1, r3, r1
	ldrb r1, [r1]
	adds r2, r4, 0x3
	adds r2, r3, r2
	ldrb r2, [r2]
	lsls r2, 8
	orrs r1, r2
	adds r2, r4, 0x4
	adds r2, r3, r2
	ldrb r2, [r2]
	lsls r2, 16
	orrs r1, r2
	adds r4, 0x5
	adds r3, r4
	ldrb r2, [r3]
	lsls r2, 24
	orrs r1, r2
	bl move_anim_start_t2_for_situation
	ldr r1, _0812031C @ =gUnknown_03004330
	ldrb r0, [r5]
	lsls r0, 2
	adds r0, r1
	ldr r1, _08120320 @ =sub_811E38C
	str r1, [r0]
_0812030C:
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_08120314: .4byte gUnknown_02024A60
_08120318: .4byte gUnknown_02023A60
_0812031C: .4byte gUnknown_03004330
_08120320: .4byte sub_811E38C
	thumb_func_end sub_81202BC

	thumb_func_start sub_8120324
sub_8120324: @ 8120324
	push {lr}
	bl dp01_tbl3_exec_completed
	pop {r0}
	bx r0
	thumb_func_end sub_8120324

	thumb_func_start sub_8120330
sub_8120330: @ 8120330
	push {lr}
	bl dp01_tbl3_exec_completed
	pop {r0}
	bx r0
	thumb_func_end sub_8120330

	thumb_func_start sub_812033C
sub_812033C: @ 812033C
	push {lr}
	bl dp01_tbl3_exec_completed
	pop {r0}
	bx r0
	thumb_func_end sub_812033C

	thumb_func_start sub_8120348
sub_8120348: @ 8120348
	push {lr}
	bl dp01_tbl3_exec_completed
	pop {r0}
	bx r0
	thumb_func_end sub_8120348

	thumb_func_start sub_8120354
sub_8120354: @ 8120354
	push {lr}
	bl dp01_tbl3_exec_completed
	pop {r0}
	bx r0
	thumb_func_end sub_8120354

	thumb_func_start sub_8120360
sub_8120360: @ 8120360
	push {lr}
	bl dp01_tbl3_exec_completed
	pop {r0}
	bx r0
	thumb_func_end sub_8120360

	thumb_func_start sub_812036C
sub_812036C: @ 812036C
	push {lr}
	bl dp01_tbl3_exec_completed
	pop {r0}
	bx r0
	thumb_func_end sub_812036C

	thumb_func_start sub_8120378
sub_8120378: @ 8120378
	push {lr}
	bl dp01_tbl3_exec_completed
	pop {r0}
	bx r0
	thumb_func_end sub_8120378

	thumb_func_start sub_8120384
sub_8120384: @ 8120384
	push {lr}
	bl dp01_tbl3_exec_completed
	pop {r0}
	bx r0
	thumb_func_end sub_8120384

	thumb_func_start sub_8120390
sub_8120390: @ 8120390
	push {lr}
	ldr r2, _081203A8 @ =gUnknown_020238C8
	ldrb r1, [r2]
	movs r0, 0x80
	negs r0, r0
	ands r0, r1
	strb r0, [r2]
	bl dp01_tbl3_exec_completed
	pop {r0}
	bx r0
	.align 2, 0
_081203A8: .4byte gUnknown_020238C8
	thumb_func_end sub_8120390

	thumb_func_start sub_81203AC
sub_81203AC: @ 81203AC
	push {lr}
	ldr r3, _081203D8 @ =gUnknown_020238C8
	ldr r1, _081203DC @ =gUnknown_02023A60
	ldr r0, _081203E0 @ =gUnknown_02024A60
	ldrb r0, [r0]
	lsls r0, 9
	adds r1, 0x1
	adds r0, r1
	ldrb r0, [r0]
	movs r1, 0x7F
	ands r1, r0
	ldrb r2, [r3]
	movs r0, 0x80
	negs r0, r0
	ands r0, r2
	orrs r0, r1
	strb r0, [r3]
	bl dp01_tbl3_exec_completed
	pop {r0}
	bx r0
	.align 2, 0
_081203D8: .4byte gUnknown_020238C8
_081203DC: .4byte gUnknown_02023A60
_081203E0: .4byte gUnknown_02024A60
	thumb_func_end sub_81203AC

	thumb_func_start sub_81203E4
sub_81203E4: @ 81203E4
	push {lr}
	ldr r2, _081203F8 @ =gUnknown_020238C8
	ldrb r1, [r2]
	movs r0, 0x7F
	ands r0, r1
	strb r0, [r2]
	bl dp01_tbl3_exec_completed
	pop {r0}
	bx r0
	.align 2, 0
_081203F8: .4byte gUnknown_020238C8
	thumb_func_end sub_81203E4

	thumb_func_start sub_81203FC
sub_81203FC: @ 81203FC
	push {lr}
	ldr r3, _08120420 @ =gUnknown_020238C8
	ldr r1, [r3]
	lsls r1, 24
	lsrs r1, 31
	movs r0, 0x1
	eors r1, r0
	lsls r1, 7
	ldrb r2, [r3]
	movs r0, 0x7F
	ands r0, r2
	orrs r0, r1
	strb r0, [r3]
	bl dp01_tbl3_exec_completed
	pop {r0}
	bx r0
	.align 2, 0
_08120420: .4byte gUnknown_020238C8
	thumb_func_end sub_81203FC

	thumb_func_start dp01t_29_3_blink
dp01t_29_3_blink: @ 8120424
	push {r4,lr}
	ldr r3, _0812044C @ =gSprites
	ldr r2, _08120450 @ =gUnknown_02024BE0
	ldr r4, _08120454 @ =gUnknown_02024A60
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
	bge _08120458
	bl dp01_tbl3_exec_completed
	b _08120482
	.align 2, 0
_0812044C: .4byte gSprites
_08120450: .4byte gUnknown_02024BE0
_08120454: .4byte gUnknown_02024A60
_08120458:
	ldr r1, _08120488 @ =gUnknown_02024E6D
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
	ldr r1, _0812048C @ =gUnknown_03004330
	ldrb r0, [r4]
	lsls r0, 2
	adds r0, r1
	ldr r1, _08120490 @ =bx_blink_t3
	str r1, [r0]
_08120482:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08120488: .4byte gUnknown_02024E6D
_0812048C: .4byte gUnknown_03004330
_08120490: .4byte bx_blink_t3
	thumb_func_end dp01t_29_3_blink

	thumb_func_start sub_8120494
sub_8120494: @ 8120494
	push {lr}
	bl dp01_tbl3_exec_completed
	pop {r0}
	bx r0
	thumb_func_end sub_8120494

	thumb_func_start sub_81204A0
sub_81204A0: @ 81204A0
	push {r4,lr}
	ldr r4, _081204DC @ =gUnknown_02024A60
	ldrb r0, [r4]
	bl battle_side_get_owner
	lsls r0, 24
	movs r3, 0x3F
	cmp r0, 0
	bne _081204B4
	movs r3, 0xC0
_081204B4:
	ldr r2, _081204E0 @ =gUnknown_02023A60
	ldrb r1, [r4]
	lsls r1, 9
	adds r0, r2, 0x1
	adds r0, r1, r0
	ldrb r0, [r0]
	adds r2, 0x2
	adds r1, r2
	ldrb r1, [r1]
	lsls r1, 8
	orrs r0, r1
	lsls r1, r3, 24
	asrs r1, 24
	bl PlaySE12WithPanning
	bl dp01_tbl3_exec_completed
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_081204DC: .4byte gUnknown_02024A60
_081204E0: .4byte gUnknown_02023A60
	thumb_func_end sub_81204A0

	thumb_func_start sub_81204E4
sub_81204E4: @ 81204E4
	push {lr}
	ldr r2, _0812050C @ =gUnknown_02023A60
	ldr r0, _08120510 @ =gUnknown_02024A60
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
	bl dp01_tbl3_exec_completed
	pop {r0}
	bx r0
	.align 2, 0
_0812050C: .4byte gUnknown_02023A60
_08120510: .4byte gUnknown_02024A60
	thumb_func_end sub_81204E4

	thumb_func_start sub_8120514
sub_8120514: @ 8120514
	push {lr}
	ldr r1, _08120548 @ =gUnknown_02024A6A
	ldr r0, _0812054C @ =gUnknown_02024A60
	ldrb r0, [r0]
	lsls r0, 1
	adds r0, r1
	ldrh r1, [r0]
	movs r0, 0x64
	muls r0, r1
	ldr r1, _08120550 @ =gPlayerParty
	adds r0, r1
	movs r1, 0xB
	bl GetMonData
	lsls r0, 16
	lsrs r0, 16
	movs r1, 0x19
	negs r1, r1
	movs r2, 0x5
	bl PlayCry3
	bl dp01_tbl3_exec_completed
	pop {r0}
	bx r0
	.align 2, 0
_08120548: .4byte gUnknown_02024A6A
_0812054C: .4byte gUnknown_02024A60
_08120550: .4byte gPlayerParty
	thumb_func_end sub_8120514

	thumb_func_start dp01t_2E_3_battle_intro
dp01t_2E_3_battle_intro: @ 8120554
	push {lr}
	ldr r1, _0812057C @ =gUnknown_02023A60
	ldr r0, _08120580 @ =gUnknown_02024A60
	ldrb r0, [r0]
	lsls r0, 9
	adds r1, 0x1
	adds r0, r1
	ldrb r0, [r0]
	bl sub_80E43C0
	ldr r2, _08120584 @ =gUnknown_02024DE8
	ldrh r0, [r2]
	movs r1, 0x1
	orrs r0, r1
	strh r0, [r2]
	bl dp01_tbl3_exec_completed
	pop {r0}
	bx r0
	.align 2, 0
_0812057C: .4byte gUnknown_02023A60
_08120580: .4byte gUnknown_02024A60
_08120584: .4byte gUnknown_02024DE8
	thumb_func_end dp01t_2E_3_battle_intro

	thumb_func_start sub_8120588
sub_8120588: @ 8120588
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	ldr r6, _081206DC @ =gUnknown_02024BE0
	ldr r7, _081206E0 @ =gUnknown_02024A60
	ldrb r0, [r7]
	adds r0, r6
	ldrb r1, [r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	ldr r5, _081206E4 @ =gSprites
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
	ldr r1, _081206E8 @ =0x0000ffd8
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
	ldr r1, _081206EC @ =sub_8078B34
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
	ldr r1, _081206F0 @ =sub_8030E38
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
	ldr r0, _081206F4 @ =0x0000d6f9
	bl AllocSpritePalette
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	ldr r0, _081206F8 @ =gTrainerBackPicPaletteTable
	mov r8, r0
	ldrb r0, [r7]
	bl sub_803FC34
	ldr r2, _081206FC @ =gLinkPlayers
	lsls r1, r0, 3
	subs r1, r0
	lsls r1, 2
	adds r1, r2
	ldrb r0, [r1, 0x13]
	lsls r0, 3
	add r0, r8
	ldr r0, [r0]
	lsls r4, 4
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
	ldr r0, _08120700 @ =sub_812071C
	movs r1, 0x5
	bl CreateTask
	lsls r0, 24
	lsrs r0, 24
	ldr r4, _08120704 @ =gTasks
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
	ldr r2, _08120708 @ =0x02017810
	adds r0, r2
	ldrb r1, [r0]
	movs r0, 0x1
	ands r0, r1
	cmp r0, 0
	beq _081206BA
	ldr r0, _0812070C @ =gUnknown_02024E68
	adds r0, r3, r0
	ldrb r1, [r0]
	lsls r0, r1, 2
	adds r0, r1
	lsls r0, 3
	adds r0, r4
	ldr r1, _08120710 @ =sub_8044CA0
	str r1, [r0]
_081206BA:
	adds r2, 0x30
	ldrb r0, [r2, 0x9]
	movs r1, 0x1
	orrs r0, r1
	strb r0, [r2, 0x9]
	ldr r1, _08120714 @ =gUnknown_03004330
	ldrb r0, [r7]
	lsls r0, 2
	adds r0, r1
	ldr r1, _08120718 @ =nullsub_74
	str r1, [r0]
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_081206DC: .4byte gUnknown_02024BE0
_081206E0: .4byte gUnknown_02024A60
_081206E4: .4byte gSprites
_081206E8: .4byte 0x0000ffd8
_081206EC: .4byte sub_8078B34
_081206F0: .4byte sub_8030E38
_081206F4: .4byte 0x0000d6f9
_081206F8: .4byte gTrainerBackPicPaletteTable
_081206FC: .4byte gLinkPlayers
_08120700: .4byte sub_812071C
_08120704: .4byte gTasks
_08120708: .4byte 0x02017810
_0812070C: .4byte gUnknown_02024E68
_08120710: .4byte sub_8044CA0
_08120714: .4byte gUnknown_03004330
_08120718: .4byte nullsub_74
	thumb_func_end sub_8120588

	thumb_func_start sub_812071C
sub_812071C: @ 812071C
	push {r4-r7,lr}
	mov r7, r9
	mov r6, r8
	push {r6,r7}
	lsls r0, 24
	lsrs r0, 24
	mov r8, r0
	ldr r1, _08120744 @ =gTasks
	lsls r0, 2
	add r0, r8
	lsls r0, 3
	adds r1, r0, r1
	ldrh r2, [r1, 0xA]
	movs r3, 0xA
	ldrsh r0, [r1, r3]
	cmp r0, 0x17
	bgt _08120748
	adds r0, r2, 0x1
	strh r0, [r1, 0xA]
	b _08120804
	.align 2, 0
_08120744: .4byte gTasks
_08120748:
	ldr r7, _08120788 @ =gUnknown_02024A60
	ldrb r0, [r7]
	mov r9, r0
	ldrh r0, [r1, 0x8]
	strb r0, [r7]
	bl IsDoubleBattle
	lsls r0, 24
	cmp r0, 0
	beq _08120768
	ldr r0, _0812078C @ =gBattleTypeFlags
	ldrh r1, [r0]
	movs r0, 0x40
	ands r0, r1
	cmp r0, 0
	beq _08120798
_08120768:
	ldr r0, _08120790 @ =gUnknown_02023A60
	ldrb r1, [r7]
	lsls r2, r1, 9
	adds r0, 0x1
	adds r2, r0
	ldr r0, _08120794 @ =gUnknown_02024A6A
	lsls r1, 1
	adds r1, r0
	ldrh r0, [r1]
	strb r0, [r2]
	ldrb r0, [r7]
	movs r1, 0
	bl sub_811F864
	b _081207EC
	.align 2, 0
_08120788: .4byte gUnknown_02024A60
_0812078C: .4byte gBattleTypeFlags
_08120790: .4byte gUnknown_02023A60
_08120794: .4byte gUnknown_02024A6A
_08120798:
	ldr r4, _08120810 @ =gUnknown_02023A60
	ldrb r0, [r7]
	lsls r1, r0, 9
	adds r4, 0x1
	adds r1, r4
	ldr r5, _08120814 @ =gUnknown_02024A6A
	lsls r0, 1
	adds r0, r5
	ldrh r0, [r0]
	strb r0, [r1]
	ldrb r0, [r7]
	movs r1, 0
	bl sub_811F864
	ldrb r0, [r7]
	movs r6, 0x2
	eors r0, r6
	strb r0, [r7]
	ldrb r0, [r7]
	lsls r1, r0, 9
	adds r1, r4
	lsls r0, 1
	adds r0, r5
	ldrh r0, [r0]
	strb r0, [r1]
	ldrb r1, [r7]
	lsls r0, r1, 1
	adds r0, r5
	ldrh r2, [r0]
	movs r0, 0x64
	muls r0, r2
	ldr r2, _08120818 @ =gPlayerParty
	adds r0, r2
	bl sub_80318FC
	ldrb r0, [r7]
	movs r1, 0
	bl sub_811F864
	ldrb r0, [r7]
	eors r0, r6
	strb r0, [r7]
_081207EC:
	ldr r1, _0812081C @ =gUnknown_03004330
	ldr r2, _08120820 @ =gUnknown_02024A60
	ldrb r0, [r2]
	lsls r0, 2
	adds r0, r1
	ldr r1, _08120824 @ =sub_811DCA0
	str r1, [r0]
	mov r3, r9
	strb r3, [r2]
	mov r0, r8
	bl DestroyTask
_08120804:
	pop {r3,r4}
	mov r8, r3
	mov r9, r4
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_08120810: .4byte gUnknown_02023A60
_08120814: .4byte gUnknown_02024A6A
_08120818: .4byte gPlayerParty
_0812081C: .4byte gUnknown_03004330
_08120820: .4byte gUnknown_02024A60
_08120824: .4byte sub_811DCA0
	thumb_func_end sub_812071C

	thumb_func_start dp01t_30_3_80EB11C
dp01t_30_3_80EB11C: @ 8120828
	push {r4-r6,lr}
	ldr r1, _08120850 @ =gUnknown_02023A60
	ldr r0, _08120854 @ =gUnknown_02024A60
	ldrb r2, [r0]
	lsls r0, r2, 9
	adds r1, 0x1
	adds r0, r1
	ldrb r0, [r0]
	cmp r0, 0
	beq _08120858
	adds r0, r2, 0
	bl battle_side_get_owner
	lsls r0, 24
	cmp r0, 0
	bne _08120858
	bl dp01_tbl3_exec_completed
	b _081208C0
	.align 2, 0
_08120850: .4byte gUnknown_02023A60
_08120854: .4byte gUnknown_02024A60
_08120858:
	ldr r5, _081208C8 @ =gUnknown_02024A60
	ldrb r1, [r5]
	lsls r0, r1, 1
	adds r0, r1
	lsls r0, 2
	ldr r6, _081208CC @ =0x02017810
	adds r0, r6
	ldrb r1, [r0]
	movs r2, 0x1
	orrs r1, r2
	strb r1, [r0]
	ldrb r0, [r5]
	lsls r3, r0, 9
	ldr r4, _081208D0 @ =gUnknown_02023A64
	adds r1, r3, r4
	subs r2, r4, 0x3
	adds r2, r3, r2
	ldrb r2, [r2]
	subs r4, 0x2
	adds r3, r4
	ldrb r3, [r3]
	bl sub_8044804
	ldr r2, _081208D4 @ =gUnknown_02024E68
	ldrb r1, [r5]
	adds r1, r2
	movs r2, 0
	strb r0, [r1]
	ldrb r1, [r5]
	lsls r0, r1, 1
	adds r0, r1
	lsls r0, 2
	adds r0, r6
	strb r2, [r0, 0x5]
	ldrb r1, [r5]
	lsls r0, r1, 9
	adds r0, r4
	ldrb r0, [r0]
	cmp r0, 0
	beq _081208B4
	lsls r0, r1, 1
	adds r0, r1
	lsls r0, 2
	adds r0, r6
	movs r1, 0x5D
	strb r1, [r0, 0x5]
_081208B4:
	ldr r0, _081208D8 @ =gUnknown_03004330
	ldrb r1, [r5]
	lsls r1, 2
	adds r1, r0
	ldr r0, _081208DC @ =sub_81208E0
	str r0, [r1]
_081208C0:
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_081208C8: .4byte gUnknown_02024A60
_081208CC: .4byte 0x02017810
_081208D0: .4byte gUnknown_02023A64
_081208D4: .4byte gUnknown_02024E68
_081208D8: .4byte gUnknown_03004330
_081208DC: .4byte sub_81208E0
	thumb_func_end dp01t_30_3_80EB11C

	thumb_func_start sub_81208E0
sub_81208E0: @ 81208E0
	push {r4,lr}
	ldr r4, _08120918 @ =gUnknown_02024A60
	ldrb r1, [r4]
	lsls r0, r1, 1
	adds r0, r1
	lsls r0, 2
	ldr r3, _0812091C @ =0x02017810
	adds r0, r3
	ldrb r1, [r0, 0x5]
	adds r2, r1, 0x1
	strb r2, [r0, 0x5]
	lsls r1, 24
	lsrs r1, 24
	cmp r1, 0x5C
	bls _08120910
	ldrb r0, [r4]
	lsls r1, r0, 1
	adds r1, r0
	lsls r1, 2
	adds r1, r3
	movs r0, 0
	strb r0, [r1, 0x5]
	bl dp01_tbl3_exec_completed
_08120910:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08120918: .4byte gUnknown_02024A60
_0812091C: .4byte 0x02017810
	thumb_func_end sub_81208E0

	thumb_func_start sub_8120920
sub_8120920: @ 8120920
	push {lr}
	ldr r0, _08120958 @ =gUnknown_02024A60
	ldrb r3, [r0]
	lsls r0, r3, 1
	adds r0, r3
	lsls r0, 2
	ldr r1, _0812095C @ =0x02017810
	adds r0, r1
	ldrb r1, [r0]
	movs r0, 0x1
	ands r0, r1
	cmp r0, 0
	beq _0812094E
	ldr r2, _08120960 @ =gTasks
	ldr r0, _08120964 @ =gUnknown_02024E68
	adds r0, r3, r0
	ldrb r1, [r0]
	lsls r0, r1, 2
	adds r0, r1
	lsls r0, 3
	adds r0, r2
	ldr r1, _08120968 @ =sub_8044CA0
	str r1, [r0]
_0812094E:
	bl dp01_tbl3_exec_completed
	pop {r0}
	bx r0
	.align 2, 0
_08120958: .4byte gUnknown_02024A60
_0812095C: .4byte 0x02017810
_08120960: .4byte gTasks
_08120964: .4byte gUnknown_02024E68
_08120968: .4byte sub_8044CA0
	thumb_func_end sub_8120920

	thumb_func_start sub_812096C
sub_812096C: @ 812096C
	push {lr}
	bl dp01_tbl3_exec_completed
	pop {r0}
	bx r0
	thumb_func_end sub_812096C

	thumb_func_start sub_8120978
sub_8120978: @ 8120978
	push {r4,lr}
	ldr r4, _081209C8 @ =gUnknown_02024A60
	ldrb r0, [r4]
	bl sub_8078874
	lsls r0, 24
	cmp r0, 0
	beq _081209BE
	ldr r3, _081209CC @ =gSprites
	ldr r0, _081209D0 @ =gUnknown_02024BE0
	ldrb r1, [r4]
	adds r0, r1, r0
	ldrb r0, [r0]
	lsls r2, r0, 4
	adds r2, r0
	lsls r2, 2
	adds r2, r3
	ldr r0, _081209D4 @ =gUnknown_02023A60
	lsls r1, 9
	adds r0, 0x1
	adds r1, r0
	adds r2, 0x3E
	movs r0, 0x1
	ldrb r1, [r1]
	ands r1, r0
	lsls r1, 2
	ldrb r3, [r2]
	movs r0, 0x5
	negs r0, r0
	ands r0, r3
	orrs r0, r1
	strb r0, [r2]
	ldrb r0, [r4]
	bl sub_8031F88
_081209BE:
	bl dp01_tbl3_exec_completed
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_081209C8: .4byte gUnknown_02024A60
_081209CC: .4byte gSprites
_081209D0: .4byte gUnknown_02024BE0
_081209D4: .4byte gUnknown_02023A60
	thumb_func_end sub_8120978

	thumb_func_start sub_81209D8
sub_81209D8: @ 81209D8
	push {r4-r6,lr}
	sub sp, 0x4
	ldr r6, _08120A1C @ =gUnknown_02024A60
	ldrb r0, [r6]
	bl mplay_80342A4
	lsls r0, 24
	cmp r0, 0
	bne _08120A30
	ldr r5, _08120A20 @ =gUnknown_02023A60
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
	beq _08120A24
	bl dp01_tbl3_exec_completed
	b _08120A30
	.align 2, 0
_08120A1C: .4byte gUnknown_02024A60
_08120A20: .4byte gUnknown_02023A60
_08120A24:
	ldr r0, _08120A38 @ =gUnknown_03004330
	ldrb r1, [r6]
	lsls r1, 2
	adds r1, r0
	ldr r0, _08120A3C @ =sub_811E3B8
	str r0, [r1]
_08120A30:
	add sp, 0x4
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_08120A38: .4byte gUnknown_03004330
_08120A3C: .4byte sub_811E3B8
	thumb_func_end sub_81209D8

	thumb_func_start sub_8120A40
sub_8120A40: @ 8120A40
	push {lr}
	bl dp01_tbl3_exec_completed
	pop {r0}
	bx r0
	thumb_func_end sub_8120A40

	thumb_func_start sub_8120A4C
sub_8120A4C: @ 8120A4C
	push {lr}
	bl dp01_tbl3_exec_completed
	pop {r0}
	bx r0
	thumb_func_end sub_8120A4C

	thumb_func_start sub_8120A58
sub_8120A58: @ 8120A58
	push {r4,lr}
	ldr r2, _08120A90 @ =gUnknown_02024D26
	ldr r1, _08120A94 @ =gUnknown_02023A60
	ldr r4, _08120A98 @ =gUnknown_02024A60
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
	bl dp01_tbl3_exec_completed
	ldr r1, _08120A9C @ =gUnknown_03004330
	ldrb r0, [r4]
	lsls r0, 2
	adds r0, r1
	ldr r1, _08120AA0 @ =sub_811E29C
	str r1, [r0]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08120A90: .4byte gUnknown_02024D26
_08120A94: .4byte gUnknown_02023A60
_08120A98: .4byte gUnknown_02024A60
_08120A9C: .4byte gUnknown_03004330
_08120AA0: .4byte sub_811E29C
	thumb_func_end sub_8120A58

	thumb_func_start nullsub_75
nullsub_75: @ 8120AA4
	bx lr
	thumb_func_end nullsub_75

	.align 2, 0 @ Don't pad with nop.
