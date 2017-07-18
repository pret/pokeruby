	.include "constants/gba_constants.inc"
	.include "constants/species_constants.inc"
	.include "asm/macros.inc"

	.syntax unified

	.text

	thumb_func_start OpponentHandleTrainerThrow
OpponentHandleTrainerThrow: @ 8034BFC
	push {r4-r6,lr}
	mov r6, r9
	mov r5, r8
	push {r5,r6}
	ldr r3, _08034C18 @ =gTrainerBattleOpponent
	ldrh r1, [r3]
	movs r0, 0x80
	lsls r0, 3
	cmp r1, r0
	bne _08034C1C
	bl GetSecretBaseTrainerPicIndex
	b _08034C42
	.align 2, 0
_08034C18: .4byte gTrainerBattleOpponent
_08034C1C:
	ldr r0, _08034C30 @ =gBattleTypeFlags
	ldrh r1, [r0]
	movs r0, 0x80
	lsls r0, 1
	ands r0, r1
	cmp r0, 0
	beq _08034C34
	bl get_trainer_class_pic_index
	b _08034C42
	.align 2, 0
_08034C30: .4byte gBattleTypeFlags
_08034C34:
	movs r0, 0x80
	lsls r0, 4
	ands r0, r1
	cmp r0, 0
	beq _08034C48
	bl sub_8135FBC
_08034C42:
	lsls r0, 24
	lsrs r0, 24
	b _08034C56
_08034C48:
	ldr r2, _08034D88 @ =gTrainers
	ldrh r1, [r3]
	lsls r0, r1, 2
	adds r0, r1
	lsls r0, 3
	adds r0, r2
	ldrb r0, [r0, 0x3]
_08034C56:
	mov r9, r0
	ldr r0, _08034D8C @ =gActiveBank
	mov r8, r0
	ldrb r1, [r0]
	mov r0, r9
	bl sub_8031A6C
	mov r1, r8
	ldrb r0, [r1]
	bl GetBankIdentity
	adds r1, r0, 0
	lsls r1, 24
	lsrs r1, 24
	mov r0, r9
	bl GetMonSpriteTemplate_803C5A0
	ldr r5, _08034D90 @ =gUnknown_02024E8C
	ldr r1, _08034D94 @ =gTrainerFrontPicCoords
	mov r2, r9
	lsls r0, r2, 2
	adds r0, r1
	ldrb r0, [r0]
	movs r4, 0x8
	subs r4, r0
	lsls r4, 18
	movs r0, 0xA0
	lsls r0, 14
	adds r4, r0
	asrs r4, 16
	mov r1, r8
	ldrb r0, [r1]
	bl sub_8079E90
	adds r3, r0, 0
	lsls r3, 24
	lsrs r3, 24
	adds r0, r5, 0
	movs r1, 0xB0
	adds r2, r4, 0
	bl CreateSprite
	ldr r5, _08034D98 @ =gObjectBankIDs
	mov r2, r8
	ldrb r1, [r2]
	adds r1, r5
	strb r0, [r1]
	ldr r4, _08034D9C @ =gSprites
	ldrb r0, [r2]
	adds r0, r5
	ldrb r1, [r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r4
	ldr r1, _08034DA0 @ =0x0000ff10
	strh r1, [r0, 0x24]
	ldrb r0, [r2]
	adds r0, r5
	ldrb r1, [r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r4
	movs r1, 0x2
	strh r1, [r0, 0x2E]
	ldr r0, _08034DA4 @ =gTrainerFrontPicPaletteTable
	mov r1, r9
	lsls r6, r1, 3
	adds r0, r6, r0
	ldrh r0, [r0, 0x4]
	bl IndexOfSpritePaletteTag
	mov r2, r8
	ldrb r1, [r2]
	adds r1, r5
	ldrb r1, [r1]
	lsls r2, r1, 4
	adds r2, r1
	lsls r2, 2
	adds r2, r4
	lsls r0, 4
	ldrb r3, [r2, 0x5]
	movs r1, 0xF
	ands r1, r3
	orrs r1, r0
	strb r1, [r2, 0x5]
	mov r1, r8
	ldrb r0, [r1]
	adds r0, r5
	ldrb r0, [r0]
	lsls r1, r0, 4
	adds r1, r0
	lsls r1, 2
	adds r1, r4
	ldrh r0, [r1, 0x4]
	lsls r0, 22
	lsrs r0, 22
	strh r0, [r1, 0x38]
	ldr r0, _08034DA8 @ =gTrainerFrontPicTable
	adds r6, r0
	ldrh r0, [r6, 0x6]
	bl GetSpriteTileStartByTag
	mov r2, r8
	ldrb r1, [r2]
	adds r1, r5
	ldrb r2, [r1]
	lsls r1, r2, 4
	adds r1, r2
	lsls r1, 2
	adds r1, r4
	ldr r2, _08034DAC @ =0x000003ff
	ands r2, r0
	ldrh r3, [r1, 0x4]
	ldr r0, _08034DB0 @ =0xfffffc00
	ands r0, r3
	orrs r0, r2
	strh r0, [r1, 0x4]
	mov r1, r8
	ldrb r0, [r1]
	adds r0, r5
	ldrb r1, [r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r4
	mov r2, r9
	strh r2, [r0, 0x6]
	mov r1, r8
	ldrb r0, [r1]
	adds r0, r5
	ldrb r1, [r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r4, 0x1C
	adds r0, r4
	ldr r1, _08034DB4 @ =sub_80313A0
	str r1, [r0]
	ldr r1, _08034DB8 @ =gBattleBankFunc
	mov r2, r8
	ldrb r0, [r2]
	lsls r0, 2
	adds r0, r1
	ldr r1, _08034DBC @ =sub_8032B4C
	str r1, [r0]
	pop {r3,r4}
	mov r8, r3
	mov r9, r4
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_08034D88: .4byte gTrainers
_08034D8C: .4byte gActiveBank
_08034D90: .4byte gUnknown_02024E8C
_08034D94: .4byte gTrainerFrontPicCoords
_08034D98: .4byte gObjectBankIDs
_08034D9C: .4byte gSprites
_08034DA0: .4byte 0x0000ff10
_08034DA4: .4byte gTrainerFrontPicPaletteTable
_08034DA8: .4byte gTrainerFrontPicTable
_08034DAC: .4byte 0x000003ff
_08034DB0: .4byte 0xfffffc00
_08034DB4: .4byte sub_80313A0
_08034DB8: .4byte gBattleBankFunc
_08034DBC: .4byte sub_8032B4C
	thumb_func_end OpponentHandleTrainerThrow

	thumb_func_start OpponentHandleTrainerSlide
OpponentHandleTrainerSlide: @ 8034DC0
	push {r4-r6,lr}
	mov r6, r9
	mov r5, r8
	push {r5,r6}
	ldr r3, _08034DDC @ =gTrainerBattleOpponent
	ldrh r1, [r3]
	movs r0, 0x80
	lsls r0, 3
	cmp r1, r0
	bne _08034DE0
	bl GetSecretBaseTrainerPicIndex
	b _08034E06
	.align 2, 0
_08034DDC: .4byte gTrainerBattleOpponent
_08034DE0:
	ldr r0, _08034DF4 @ =gBattleTypeFlags
	ldrh r1, [r0]
	movs r0, 0x80
	lsls r0, 1
	ands r0, r1
	cmp r0, 0
	beq _08034DF8
	bl get_trainer_class_pic_index
	b _08034E06
	.align 2, 0
_08034DF4: .4byte gBattleTypeFlags
_08034DF8:
	movs r0, 0x80
	lsls r0, 4
	ands r0, r1
	cmp r0, 0
	beq _08034E0C
	bl sub_8135FBC
_08034E06:
	lsls r0, 24
	lsrs r0, 24
	b _08034E1A
_08034E0C:
	ldr r2, _08034F4C @ =gTrainers
	ldrh r1, [r3]
	lsls r0, r1, 2
	adds r0, r1
	lsls r0, 3
	adds r0, r2
	ldrb r0, [r0, 0x3]
_08034E1A:
	mov r9, r0
	ldr r0, _08034F50 @ =gActiveBank
	mov r8, r0
	ldrb r1, [r0]
	mov r0, r9
	bl sub_8031A6C
	mov r1, r8
	ldrb r0, [r1]
	bl GetBankIdentity
	adds r1, r0, 0
	lsls r1, 24
	lsrs r1, 24
	mov r0, r9
	bl GetMonSpriteTemplate_803C5A0
	ldr r0, _08034F54 @ =gUnknown_02024E8C
	ldr r2, _08034F58 @ =gTrainerFrontPicCoords
	mov r3, r9
	lsls r1, r3, 2
	adds r1, r2
	ldrb r1, [r1]
	movs r2, 0x8
	subs r2, r1
	lsls r2, 18
	movs r1, 0xA0
	lsls r1, 14
	adds r2, r1
	asrs r2, 16
	movs r1, 0xB0
	movs r3, 0x1E
	bl CreateSprite
	ldr r5, _08034F5C @ =gObjectBankIDs
	mov r2, r8
	ldrb r1, [r2]
	adds r1, r5
	strb r0, [r1]
	ldr r4, _08034F60 @ =gSprites
	ldrb r0, [r2]
	adds r0, r5
	ldrb r1, [r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r4
	movs r1, 0x60
	strh r1, [r0, 0x24]
	ldrb r0, [r2]
	adds r0, r5
	ldrb r1, [r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r4
	ldrh r1, [r0, 0x20]
	adds r1, 0x20
	strh r1, [r0, 0x20]
	ldrb r0, [r2]
	adds r0, r5
	ldrb r1, [r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r4
	ldr r1, _08034F64 @ =0x0000fffe
	strh r1, [r0, 0x2E]
	ldr r0, _08034F68 @ =gTrainerFrontPicPaletteTable
	mov r3, r9
	lsls r6, r3, 3
	adds r0, r6, r0
	ldrh r0, [r0, 0x4]
	bl IndexOfSpritePaletteTag
	mov r2, r8
	ldrb r1, [r2]
	adds r1, r5
	ldrb r1, [r1]
	lsls r2, r1, 4
	adds r2, r1
	lsls r2, 2
	adds r2, r4
	lsls r0, 4
	ldrb r3, [r2, 0x5]
	movs r1, 0xF
	ands r1, r3
	orrs r1, r0
	strb r1, [r2, 0x5]
	mov r3, r8
	ldrb r0, [r3]
	adds r0, r5
	ldrb r0, [r0]
	lsls r1, r0, 4
	adds r1, r0
	lsls r1, 2
	adds r1, r4
	ldrh r0, [r1, 0x4]
	lsls r0, 22
	lsrs r0, 22
	strh r0, [r1, 0x38]
	ldr r0, _08034F6C @ =gTrainerFrontPicTable
	adds r6, r0
	ldrh r0, [r6, 0x6]
	bl GetSpriteTileStartByTag
	mov r2, r8
	ldrb r1, [r2]
	adds r1, r5
	ldrb r2, [r1]
	lsls r1, r2, 4
	adds r1, r2
	lsls r1, 2
	adds r1, r4
	ldr r2, _08034F70 @ =0x000003ff
	ands r2, r0
	ldrh r3, [r1, 0x4]
	ldr r0, _08034F74 @ =0xfffffc00
	ands r0, r3
	orrs r0, r2
	strh r0, [r1, 0x4]
	mov r3, r8
	ldrb r0, [r3]
	adds r0, r5
	ldrb r1, [r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r4
	mov r1, r9
	strh r1, [r0, 0x6]
	ldrb r0, [r3]
	adds r0, r5
	ldrb r1, [r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r4, 0x1C
	adds r0, r4
	ldr r1, _08034F78 @ =sub_80313A0
	str r1, [r0]
	ldr r1, _08034F7C @ =gBattleBankFunc
	ldrb r0, [r3]
	lsls r0, 2
	adds r0, r1
	ldr r1, _08034F80 @ =sub_8032B84
	str r1, [r0]
	pop {r3,r4}
	mov r8, r3
	mov r9, r4
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_08034F4C: .4byte gTrainers
_08034F50: .4byte gActiveBank
_08034F54: .4byte gUnknown_02024E8C
_08034F58: .4byte gTrainerFrontPicCoords
_08034F5C: .4byte gObjectBankIDs
_08034F60: .4byte gSprites
_08034F64: .4byte 0x0000fffe
_08034F68: .4byte gTrainerFrontPicPaletteTable
_08034F6C: .4byte gTrainerFrontPicTable
_08034F70: .4byte 0x000003ff
_08034F74: .4byte 0xfffffc00
_08034F78: .4byte sub_80313A0
_08034F7C: .4byte gBattleBankFunc
_08034F80: .4byte sub_8032B84
	thumb_func_end OpponentHandleTrainerSlide

	thumb_func_start OpponentHandleTrainerSlideBack
OpponentHandleTrainerSlideBack: @ 8034F84
	push {r4-r6,lr}
	ldr r6, _08035014 @ =gObjectBankIDs
	ldr r4, _08035018 @ =gActiveBank
	ldrb r0, [r4]
	adds r0, r6
	ldrb r1, [r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	ldr r5, _0803501C @ =gSprites
	adds r0, r5
	bl oamt_add_pos2_onto_pos1
	ldrb r0, [r4]
	adds r0, r6
	ldrb r1, [r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r5
	movs r1, 0x23
	strh r1, [r0, 0x2E]
	ldrb r0, [r4]
	adds r0, r6
	ldrb r1, [r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r5
	movs r1, 0x8C
	lsls r1, 1
	strh r1, [r0, 0x32]
	ldrb r0, [r4]
	adds r0, r6
	ldrb r1, [r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r5
	ldrh r1, [r0, 0x22]
	strh r1, [r0, 0x36]
	ldrb r0, [r4]
	adds r0, r6
	ldrb r1, [r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r1, r5, 0
	adds r1, 0x1C
	adds r0, r1
	ldr r1, _08035020 @ =sub_8078B34
	str r1, [r0]
	ldrb r0, [r4]
	adds r0, r6
	ldrb r1, [r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r5
	ldr r1, _08035024 @ =SpriteCallbackDummy
	bl oamt_set_x3A_32
	ldr r1, _08035028 @ =gBattleBankFunc
	ldrb r0, [r4]
	lsls r0, 2
	adds r0, r1
	ldr r1, _0803502C @ =sub_8032BBC
	str r1, [r0]
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_08035014: .4byte gObjectBankIDs
_08035018: .4byte gActiveBank
_0803501C: .4byte gSprites
_08035020: .4byte sub_8078B34
_08035024: .4byte SpriteCallbackDummy
_08035028: .4byte gBattleBankFunc
_0803502C: .4byte sub_8032BBC
	thumb_func_end OpponentHandleTrainerSlideBack

	thumb_func_start sub_8035030
sub_8035030: @ 8035030
	push {r4,r5,lr}
	ldr r5, _08035074 @ =gActiveBank
	ldrb r2, [r5]
	lsls r0, r2, 1
	adds r0, r2
	lsls r0, 2
	ldr r4, _08035078 @ =0x02017810
	adds r3, r0, r4
	ldrb r0, [r3, 0x4]
	cmp r0, 0
	bne _0803507C
	lsls r0, r2, 2
	adds r1, r4, 0
	subs r1, 0x10
	adds r0, r1
	ldrb r1, [r0]
	movs r0, 0x4
	ands r0, r1
	cmp r0, 0
	beq _08035062
	adds r0, r2, 0
	adds r1, r2, 0
	movs r3, 0x5
	bl move_anim_start_t4
_08035062:
	ldrb r0, [r5]
	lsls r1, r0, 1
	adds r1, r0
	lsls r1, 2
	adds r1, r4
	ldrb r0, [r1, 0x4]
	adds r0, 0x1
	strb r0, [r1, 0x4]
	b _080350B8
	.align 2, 0
_08035074: .4byte gActiveBank
_08035078: .4byte 0x02017810
_0803507C:
	ldrb r1, [r3]
	movs r0, 0x40
	ands r0, r1
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0
	bne _080350B8
	strb r0, [r3, 0x4]
	movs r0, 0x10
	movs r1, 0x3F
	bl PlaySE12WithPanning
	ldr r2, _080350C0 @ =gSprites
	ldr r1, _080350C4 @ =gObjectBankIDs
	ldrb r0, [r5]
	adds r0, r1
	ldrb r1, [r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r2, 0x1C
	adds r0, r2
	ldr r1, _080350C8 @ =sub_8010384
	str r1, [r0]
	ldr r1, _080350CC @ =gBattleBankFunc
	ldrb r0, [r5]
	lsls r0, 2
	adds r0, r1
	ldr r1, _080350D0 @ =sub_803311C
	str r1, [r0]
_080350B8:
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080350C0: .4byte gSprites
_080350C4: .4byte gObjectBankIDs
_080350C8: .4byte sub_8010384
_080350CC: .4byte gBattleBankFunc
_080350D0: .4byte sub_803311C
	thumb_func_end sub_8035030

	thumb_func_start sub_80350D4
sub_80350D4: @ 80350D4
	push {lr}
	bl OpponentBufferExecCompleted
	pop {r0}
	bx r0
	thumb_func_end sub_80350D4

	thumb_func_start sub_80350E0
sub_80350E0: @ 80350E0
	push {lr}
	bl OpponentBufferExecCompleted
	pop {r0}
	bx r0
	thumb_func_end sub_80350E0

	thumb_func_start OpponentHandleBallThrow
OpponentHandleBallThrow: @ 80350EC
	push {lr}
	bl OpponentBufferExecCompleted
	pop {r0}
	bx r0
	thumb_func_end OpponentHandleBallThrow

	thumb_func_start OpponentHandlePause
OpponentHandlePause: @ 80350F8
	push {lr}
	bl OpponentBufferExecCompleted
	pop {r0}
	bx r0
	thumb_func_end OpponentHandlePause

	thumb_func_start OpponentHandleMoveAnimation
OpponentHandleMoveAnimation: @ 8035104
	push {r4-r6,lr}
	ldr r6, _080351E8 @ =gActiveBank
	ldrb r0, [r6]
	bl mplay_80342A4
	lsls r0, 24
	cmp r0, 0
	beq _08035116
	b _08035226
_08035116:
	ldr r0, _080351EC @ =gBattleBufferA
	mov r12, r0
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
	ldr r5, _080351F0 @ =gUnknown_0202F7C4
	mov r1, r12
	adds r1, 0x3
	adds r2, r1
	ldrb r1, [r2]
	strb r1, [r5]
	ldr r4, _080351F4 @ =gMovePowerMoveAnim
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
	ldr r4, _080351F8 @ =gMoveDmgMoveAnim
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
	ldr r3, _080351FC @ =gHappinessMoveAnim
	ldrb r1, [r6]
	lsls r1, 9
	mov r2, r12
	adds r2, 0xA
	adds r1, r2
	ldrb r1, [r1]
	strb r1, [r3]
	ldr r4, _08035200 @ =gWeatherMoveAnim
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
	ldr r3, _08035204 @ =gDisableStructMoveAnim
	ldrb r2, [r6]
	lsls r2, 9
	mov r1, r12
	adds r1, 0x10
	adds r2, r1
	str r2, [r3]
	ldr r3, _08035208 @ =gPID_perBank
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
	beq _0803520C
	bl OpponentBufferExecCompleted
	b _08035226
	.align 2, 0
_080351E8: .4byte gActiveBank
_080351EC: .4byte gBattleBufferA
_080351F0: .4byte gUnknown_0202F7C4
_080351F4: .4byte gMovePowerMoveAnim
_080351F8: .4byte gMoveDmgMoveAnim
_080351FC: .4byte gHappinessMoveAnim
_08035200: .4byte gWeatherMoveAnim
_08035204: .4byte gDisableStructMoveAnim
_08035208: .4byte gPID_perBank
_0803520C:
	ldrb r1, [r6]
	lsls r0, r1, 1
	adds r0, r1
	lsls r0, 2
	ldr r1, _0803522C @ =0x02017810
	adds r0, r1
	strb r2, [r0, 0x4]
	ldr r1, _08035230 @ =gBattleBankFunc
	ldrb r0, [r6]
	lsls r0, 2
	adds r0, r1
	ldr r1, _08035234 @ =sub_8035238
	str r1, [r0]
_08035226:
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_0803522C: .4byte 0x02017810
_08035230: .4byte gBattleBankFunc
_08035234: .4byte sub_8035238
	thumb_func_end OpponentHandleMoveAnimation

	thumb_func_start sub_8035238
sub_8035238: @ 8035238
	push {r4-r7,lr}
	mov r7, r9
	mov r6, r8
	push {r6,r7}
	ldr r2, _0803527C @ =gBattleBufferA
	ldr r5, _08035280 @ =gActiveBank
	ldrb r3, [r5]
	lsls r1, r3, 9
	adds r0, r2, 0x1
	mov r9, r0
	adds r0, r1, r0
	ldrb r4, [r0]
	adds r6, r2, 0x2
	mov r8, r6
	adds r0, r1, r6
	ldrb r0, [r0]
	lsls r0, 8
	orrs r4, r0
	adds r2, 0xB
	adds r1, r2
	ldrb r7, [r1]
	lsls r0, r3, 1
	adds r0, r3
	lsls r0, 2
	ldr r6, _08035284 @ =0x02017810
	adds r0, r6
	ldrb r2, [r0, 0x4]
	cmp r2, 0x1
	beq _080352C6
	cmp r2, 0x1
	bgt _08035288
	cmp r2, 0
	beq _08035292
	b _08035390
	.align 2, 0
_0803527C: .4byte gBattleBufferA
_08035280: .4byte gActiveBank
_08035284: .4byte 0x02017810
_08035288:
	cmp r2, 0x2
	beq _080352EC
	cmp r2, 0x3
	beq _08035358
	b _08035390
_08035292:
	lsls r1, r3, 2
	adds r0, r6, 0
	subs r0, 0x10
	adds r1, r0
	ldrb r2, [r1]
	movs r0, 0xC
	ands r0, r2
	cmp r0, 0x4
	bne _080352B6
	movs r0, 0x8
	orrs r0, r2
	strb r0, [r1]
	ldrb r2, [r5]
	adds r0, r2, 0
	adds r1, r2, 0
	movs r3, 0x5
	bl move_anim_start_t4
_080352B6:
	ldrb r0, [r5]
	lsls r1, r0, 1
	adds r1, r0
	lsls r1, 2
	adds r1, r6
	movs r0, 0x1
	strb r0, [r1, 0x4]
	b _08035390
_080352C6:
	ldrb r1, [r0]
	movs r0, 0x40
	ands r0, r1
	cmp r0, 0
	bne _08035390
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
	b _08035390
_080352EC:
	ldr r0, _08035348 @ =gAnimScriptCallback
	ldr r0, [r0]
	bl _call_via_r0
	ldr r0, _0803534C @ =gAnimScriptActive
	ldrb r0, [r0]
	cmp r0, 0
	bne _08035390
	movs r0, 0x1
	bl sub_80326EC
	ldrb r2, [r5]
	lsls r0, r2, 2
	adds r4, r6, 0
	subs r4, 0x10
	adds r0, r4
	ldrb r1, [r0]
	movs r0, 0x4
	ands r0, r1
	cmp r0, 0
	beq _08035334
	cmp r7, 0x1
	bhi _08035334
	adds r0, r2, 0
	adds r1, r2, 0
	movs r3, 0x6
	bl move_anim_start_t4
	ldrb r0, [r5]
	lsls r0, 2
	adds r0, r4
	ldrb r2, [r0]
	movs r1, 0x9
	negs r1, r1
	ands r1, r2
	strb r1, [r0]
_08035334:
	ldr r0, _08035350 @ =gActiveBank
	ldrb r1, [r0]
	lsls r0, r1, 1
	adds r0, r1
	lsls r0, 2
	ldr r1, _08035354 @ =0x02017810
	adds r0, r1
	movs r1, 0x3
	strb r1, [r0, 0x4]
	b _08035390
	.align 2, 0
_08035348: .4byte gAnimScriptCallback
_0803534C: .4byte gAnimScriptActive
_08035350: .4byte gActiveBank
_08035354: .4byte 0x02017810
_08035358:
	ldrb r1, [r0]
	movs r0, 0x40
	ands r0, r1
	lsls r0, 24
	lsrs r4, r0, 24
	cmp r4, 0
	bne _08035390
	bl sub_8031F24
	ldrb r0, [r5]
	lsls r2, r0, 9
	mov r3, r9
	adds r1, r2, r3
	ldrb r1, [r1]
	add r2, r8
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
	bl OpponentBufferExecCompleted
_08035390:
	pop {r3,r4}
	mov r8, r3
	mov r9, r4
	pop {r4-r7}
	pop {r0}
	bx r0
	thumb_func_end sub_8035238

	thumb_func_start OpponentHandlePrintString
OpponentHandlePrintString: @ 803539C
	push {r4,lr}
	sub sp, 0x4
	ldr r0, _080353E0 @ =gUnknown_030042A4
	movs r1, 0
	strh r1, [r0]
	ldr r0, _080353E4 @ =gUnknown_030042A0
	strh r1, [r0]
	ldr r4, _080353E8 @ =gActiveBank
	ldrb r0, [r4]
	lsls r0, 9
	ldr r1, _080353EC @ =gUnknown_02023A62
	adds r0, r1
	ldrh r0, [r0]
	bl BufferStringBattle
	ldr r0, _080353F0 @ =gUnknown_03004210
	ldr r1, _080353F4 @ =gDisplayedStringBattle
	movs r2, 0xF
	str r2, [sp]
	movs r2, 0x90
	movs r3, 0x2
	bl sub_8002EB0
	ldr r1, _080353F8 @ =gBattleBankFunc
	ldrb r0, [r4]
	lsls r0, 2
	adds r0, r1
	ldr r1, _080353FC @ =sub_80331D0
	str r1, [r0]
	add sp, 0x4
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080353E0: .4byte gUnknown_030042A4
_080353E4: .4byte gUnknown_030042A0
_080353E8: .4byte gActiveBank
_080353EC: .4byte gUnknown_02023A62
_080353F0: .4byte gUnknown_03004210
_080353F4: .4byte gDisplayedStringBattle
_080353F8: .4byte gBattleBankFunc
_080353FC: .4byte sub_80331D0
	thumb_func_end OpponentHandlePrintString

	thumb_func_start OpponentHandlePrintStringPlayerOnly
OpponentHandlePrintStringPlayerOnly: @ 8035400
	push {lr}
	bl OpponentBufferExecCompleted
	pop {r0}
	bx r0
	thumb_func_end OpponentHandlePrintStringPlayerOnly

	thumb_func_start sub_803540C
sub_803540C: @ 803540C
	push {lr}
	bl sub_8036B0C
	bl OpponentBufferExecCompleted
	pop {r0}
	bx r0
	thumb_func_end sub_803540C

	thumb_func_start sub_803541C
sub_803541C: @ 803541C
	push {lr}
	bl OpponentBufferExecCompleted
	pop {r0}
	bx r0
	thumb_func_end sub_803541C

	thumb_func_start sub_8035428
sub_8035428: @ 8035428
	push {r4-r6,lr}
	ldr r6, _0803545C @ =gActiveBank
	ldrb r0, [r6]
	lsls r0, 9
	ldr r1, _08035460 @ =gUnknown_02023A64
	adds r5, r0, r1
	ldr r0, _08035464 @ =gBattleTypeFlags
	ldrh r1, [r0]
	movs r0, 0x93
	lsls r0, 3
	ands r0, r1
	cmp r0, 0
	beq _080354F8
	bl BattleAI_SetupAIData
	bl BattleAI_GetAIActionToUse
	lsls r0, 24
	lsrs r4, r0, 24
	cmp r4, 0x4
	beq _08035468
	cmp r4, 0x5
	bne _08035474
	movs r0, 0x1
	movs r1, 0x4
	b _0803546C
	.align 2, 0
_0803545C: .4byte gActiveBank
_08035460: .4byte gUnknown_02023A64
_08035464: .4byte gBattleTypeFlags
_08035468:
	movs r0, 0x1
	movs r1, 0x3
_0803546C:
	movs r2, 0
	bl dp01_build_cmdbuf_x21_a_bb
	b _080354E0
_08035474:
	ldr r3, _080354E8 @ =gBattleMoves
	lsls r0, r4, 1
	adds r2, r5, r0
	ldrh r1, [r2]
	lsls r0, r1, 1
	adds r0, r1
	lsls r0, 2
	adds r0, r3
	ldrb r1, [r0, 0x6]
	movs r0, 0x12
	ands r0, r1
	cmp r0, 0
	beq _08035494
	ldr r1, _080354EC @ =gBankTarget
	ldrb r0, [r6]
	strb r0, [r1]
_08035494:
	ldrh r1, [r2]
	lsls r0, r1, 1
	adds r0, r1
	lsls r0, 2
	adds r0, r3
	ldrb r1, [r0, 0x6]
	movs r0, 0x8
	ands r0, r1
	cmp r0, 0
	beq _080354CE
	movs r0, 0
	bl GetBankByPlayerAI
	ldr r5, _080354EC @ =gBankTarget
	strb r0, [r5]
	ldr r0, _080354F0 @ =gAbsentBankFlags
	ldrb r1, [r0]
	ldr r2, _080354F4 @ =gBitTable
	ldrb r0, [r5]
	lsls r0, 2
	adds r0, r2
	ldr r0, [r0]
	ands r1, r0
	cmp r1, 0
	beq _080354CE
	movs r0, 0x2
	bl GetBankByPlayerAI
	strb r0, [r5]
_080354CE:
	ldr r0, _080354EC @ =gBankTarget
	ldrb r0, [r0]
	lsls r0, 8
	orrs r4, r0
	movs r0, 0x1
	movs r1, 0xA
	adds r2, r4, 0
	bl dp01_build_cmdbuf_x21_a_bb
_080354E0:
	bl OpponentBufferExecCompleted
	b _0803558A
	.align 2, 0
_080354E8: .4byte gBattleMoves
_080354EC: .4byte gBankTarget
_080354F0: .4byte gAbsentBankFlags
_080354F4: .4byte gBitTable
_080354F8:
	movs r6, 0x3
_080354FA:
	bl Random
	adds r4, r0, 0
	ands r4, r6
	lsls r0, r4, 1
	adds r0, r5, r0
	ldrh r2, [r0]
	cmp r2, 0
	beq _080354FA
	ldr r1, _08035534 @ =gBattleMoves
	lsls r0, r2, 1
	adds r0, r2
	lsls r0, 2
	adds r0, r1
	ldrb r1, [r0, 0x6]
	movs r0, 0x12
	ands r0, r1
	cmp r0, 0
	beq _0803553C
	ldr r0, _08035538 @ =gActiveBank
	ldrb r0, [r0]
	lsls r0, 8
	orrs r4, r0
	movs r0, 0x1
	movs r1, 0xA
	adds r2, r4, 0
	bl dp01_build_cmdbuf_x21_a_bb
	b _08035586
	.align 2, 0
_08035534: .4byte gBattleMoves
_08035538: .4byte gActiveBank
_0803553C:
	ldr r0, _0803556C @ =gBattleTypeFlags
	ldrh r1, [r0]
	movs r0, 0x1
	ands r0, r1
	cmp r0, 0
	beq _08035570
	bl Random
	movs r1, 0x2
	ands r1, r0
	lsls r1, 24
	lsrs r1, 24
	adds r0, r1, 0
	bl GetBankByPlayerAI
	adds r2, r0, 0
	lsls r2, 24
	lsrs r2, 16
	orrs r2, r4
	movs r0, 0x1
	movs r1, 0xA
	bl dp01_build_cmdbuf_x21_a_bb
	b _08035586
	.align 2, 0
_0803556C: .4byte gBattleTypeFlags
_08035570:
	movs r0, 0
	bl GetBankByPlayerAI
	adds r2, r0, 0
	lsls r2, 24
	lsrs r2, 16
	orrs r2, r4
	movs r0, 0x1
	movs r1, 0xA
	bl dp01_build_cmdbuf_x21_a_bb
_08035586:
	bl OpponentBufferExecCompleted
_0803558A:
	pop {r4-r6}
	pop {r0}
	bx r0
	thumb_func_end sub_8035428

	thumb_func_start sub_8035590
sub_8035590: @ 8035590
	push {lr}
	ldr r1, _080355B4 @ =0x02000000
	ldr r0, _080355B8 @ =gActiveBank
	ldrb r0, [r0]
	lsrs r0, 1
	lsls r0, 1
	ldr r2, _080355BC @ =0x000160d4
	adds r0, r2
	adds r0, r1
	ldrb r1, [r0]
	movs r0, 0x1
	bl dp01_build_cmdbuf_x23_aa_0
	bl OpponentBufferExecCompleted
	pop {r0}
	bx r0
	.align 2, 0
_080355B4: .4byte 0x02000000
_080355B8: .4byte gActiveBank
_080355BC: .4byte 0x000160d4
	thumb_func_end sub_8035590

	thumb_func_start sub_80355C0
sub_80355C0: @ 80355C0
	push {r4-r6,lr}
	ldr r6, _08035604 @ =0x02000000
	ldr r5, _08035608 @ =gActiveBank
	ldrb r0, [r5]
	bl GetBankIdentity
	lsls r0, 24
	lsrs r0, 25
	ldr r1, _0803560C @ =0x000160c8
	adds r0, r1
	adds r0, r6
	ldrb r0, [r0]
	cmp r0, 0x6
	bne _08035664
	bl sub_8036CD4
	lsls r0, 24
	lsrs r4, r0, 24
	cmp r4, 0x6
	bne _0803568A
	ldr r0, _08035610 @ =gBattleTypeFlags
	ldrh r1, [r0]
	movs r0, 0x1
	ands r0, r1
	cmp r0, 0
	bne _08035614
	movs r0, 0x1
	bl GetBankByPlayerAI
	lsls r0, 24
	lsrs r5, r0, 24
	adds r6, r5, 0
	b _08035628
	.align 2, 0
_08035604: .4byte 0x02000000
_08035608: .4byte gActiveBank
_0803560C: .4byte 0x000160c8
_08035610: .4byte gBattleTypeFlags
_08035614:
	movs r0, 0x1
	bl GetBankByPlayerAI
	lsls r0, 24
	lsrs r6, r0, 24
	movs r0, 0x3
	bl GetBankByPlayerAI
	lsls r0, 24
	lsrs r5, r0, 24
_08035628:
	movs r4, 0
	b _0803562E
_0803562C:
	adds r4, 0x1
_0803562E:
	cmp r4, 0x5
	bgt _0803568A
	movs r0, 0x64
	muls r0, r4
	ldr r1, _0803565C @ =gEnemyParty
	adds r0, r1
	movs r1, 0x39
	bl GetMonData
	cmp r0, 0
	beq _0803562C
	ldr r1, _08035660 @ =gBattlePartyID
	lsls r0, r6, 1
	adds r0, r1
	ldrh r0, [r0]
	cmp r4, r0
	beq _0803562C
	lsls r0, r5, 1
	adds r0, r1
	ldrh r0, [r0]
	cmp r4, r0
	beq _0803562C
	b _0803568A
	.align 2, 0
_0803565C: .4byte gEnemyParty
_08035660: .4byte gBattlePartyID
_08035664:
	ldrb r0, [r5]
	bl GetBankIdentity
	lsls r0, 24
	lsrs r0, 25
	ldr r2, _080356B0 @ =0x000160c8
	adds r0, r2
	adds r0, r6
	ldrb r4, [r0]
	ldrb r0, [r5]
	bl GetBankIdentity
	lsls r0, 24
	lsrs r0, 25
	ldr r1, _080356B0 @ =0x000160c8
	adds r0, r1
	adds r0, r6
	movs r1, 0x6
	strb r1, [r0]
_0803568A:
	ldr r1, _080356B4 @ =0x02000000
	ldr r0, _080356B8 @ =gActiveBank
	ldrb r0, [r0]
	ldr r2, _080356BC @ =0x00016068
	adds r0, r2
	adds r0, r1
	strb r4, [r0]
	lsls r1, r4, 24
	lsrs r1, 24
	movs r0, 0x1
	movs r2, 0
	bl dp01_build_cmdbuf_x22_a_three_bytes
	bl OpponentBufferExecCompleted
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_080356B0: .4byte 0x000160c8
_080356B4: .4byte 0x02000000
_080356B8: .4byte gActiveBank
_080356BC: .4byte 0x00016068
	thumb_func_end sub_80355C0

	thumb_func_start sub_80356C0
sub_80356C0: @ 80356C0
	push {lr}
	bl OpponentBufferExecCompleted
	pop {r0}
	bx r0
	thumb_func_end sub_80356C0

	thumb_func_start OpponentHandleHealthBarUpdate
OpponentHandleHealthBarUpdate: @ 80356CC
	push {r4-r7,lr}
	mov r7, r9
	mov r6, r8
	push {r6,r7}
	sub sp, 0x4
	movs r0, 0
	bl load_gfxc_health_bar
	ldr r3, _08035744 @ =gBattleBufferA
	ldr r0, _08035748 @ =gActiveBank
	mov r9, r0
	ldrb r4, [r0]
	lsls r2, r4, 9
	adds r0, r3, 0x3
	adds r0, r2, r0
	ldrb r1, [r0]
	lsls r1, 8
	adds r3, 0x2
	adds r2, r3
	ldrb r0, [r2]
	orrs r0, r1
	lsls r0, 16
	asrs r7, r0, 16
	ldr r0, _0803574C @ =0x00007fff
	cmp r7, r0
	beq _0803575C
	ldr r6, _08035750 @ =gBattlePartyID
	lsls r0, r4, 1
	adds r0, r6
	ldrh r0, [r0]
	movs r5, 0x64
	muls r0, r5
	ldr r4, _08035754 @ =gEnemyParty
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
	ldr r1, _08035758 @ =gHealthboxIDs
	adds r1, r0, r1
	ldrb r1, [r1]
	str r7, [sp]
	mov r2, r8
	bl sub_8043D84
	b _08035786
	.align 2, 0
_08035744: .4byte gBattleBufferA
_08035748: .4byte gActiveBank
_0803574C: .4byte 0x00007fff
_08035750: .4byte gBattlePartyID
_08035754: .4byte gEnemyParty
_08035758: .4byte gHealthboxIDs
_0803575C:
	ldr r1, _080357A4 @ =gBattlePartyID
	lsls r0, r4, 1
	adds r0, r1
	ldrh r1, [r0]
	movs r0, 0x64
	muls r0, r1
	ldr r1, _080357A8 @ =gEnemyParty
	adds r0, r1
	movs r1, 0x3A
	bl GetMonData
	adds r2, r0, 0
	mov r1, r9
	ldrb r0, [r1]
	ldr r1, _080357AC @ =gHealthboxIDs
	adds r1, r0, r1
	ldrb r1, [r1]
	str r7, [sp]
	movs r3, 0
	bl sub_8043D84
_08035786:
	ldr r1, _080357B0 @ =gBattleBankFunc
	ldr r0, _080357B4 @ =gActiveBank
	ldrb r0, [r0]
	lsls r0, 2
	adds r0, r1
	ldr r1, _080357B8 @ =sub_80330C8
	str r1, [r0]
	add sp, 0x4
	pop {r3,r4}
	mov r8, r3
	mov r9, r4
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080357A4: .4byte gBattlePartyID
_080357A8: .4byte gEnemyParty
_080357AC: .4byte gHealthboxIDs
_080357B0: .4byte gBattleBankFunc
_080357B4: .4byte gActiveBank
_080357B8: .4byte sub_80330C8
	thumb_func_end OpponentHandleHealthBarUpdate

	thumb_func_start OpponentHandleExpBarUpdate
OpponentHandleExpBarUpdate: @ 80357BC
	push {lr}
	bl OpponentBufferExecCompleted
	pop {r0}
	bx r0
	thumb_func_end OpponentHandleExpBarUpdate

	thumb_func_start OpponentHandleStatusIconUpdate
OpponentHandleStatusIconUpdate: @ 80357C8
	push {r4,lr}
	ldr r4, _08035820 @ =gActiveBank
	ldrb r0, [r4]
	bl mplay_80342A4
	lsls r0, 24
	cmp r0, 0
	bne _08035818
	ldr r0, _08035824 @ =gHealthboxIDs
	ldrb r1, [r4]
	adds r0, r1, r0
	ldrb r0, [r0]
	ldr r2, _08035828 @ =gBattlePartyID
	lsls r1, 1
	adds r1, r2
	ldrh r2, [r1]
	movs r1, 0x64
	muls r1, r2
	ldr r2, _0803582C @ =gEnemyParty
	adds r1, r2
	movs r2, 0x9
	bl sub_8045A5C
	ldrb r0, [r4]
	lsls r1, r0, 1
	adds r1, r0
	lsls r1, 2
	ldr r0, _08035830 @ =0x02017810
	adds r1, r0
	ldrb r2, [r1]
	movs r0, 0x11
	negs r0, r0
	ands r0, r2
	strb r0, [r1]
	ldr r1, _08035834 @ =gBattleBankFunc
	ldrb r0, [r4]
	lsls r0, 2
	adds r0, r1
	ldr r1, _08035838 @ =sub_8033494
	str r1, [r0]
_08035818:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08035820: .4byte gActiveBank
_08035824: .4byte gHealthboxIDs
_08035828: .4byte gBattlePartyID
_0803582C: .4byte gEnemyParty
_08035830: .4byte 0x02017810
_08035834: .4byte gBattleBankFunc
_08035838: .4byte sub_8033494
	thumb_func_end OpponentHandleStatusIconUpdate

	thumb_func_start OpponentHandleStatusAnimation
OpponentHandleStatusAnimation: @ 803583C
	push {r4,r5,lr}
	ldr r5, _08035894 @ =gActiveBank
	ldrb r0, [r5]
	bl mplay_80342A4
	lsls r0, 24
	cmp r0, 0
	bne _0803588C
	ldr r4, _08035898 @ =gBattleBufferA
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
	ldr r1, _0803589C @ =gBattleBankFunc
	ldrb r0, [r5]
	lsls r0, 2
	adds r0, r1
	ldr r1, _080358A0 @ =sub_8033494
	str r1, [r0]
_0803588C:
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_08035894: .4byte gActiveBank
_08035898: .4byte gBattleBufferA
_0803589C: .4byte gBattleBankFunc
_080358A0: .4byte sub_8033494
	thumb_func_end OpponentHandleStatusAnimation

	thumb_func_start OpponentHandleStatusXor
OpponentHandleStatusXor: @ 80358A4
	push {lr}
	bl OpponentBufferExecCompleted
	pop {r0}
	bx r0
	thumb_func_end OpponentHandleStatusXor

	thumb_func_start sub_80358B0
sub_80358B0: @ 80358B0
	push {lr}
	bl OpponentBufferExecCompleted
	pop {r0}
	bx r0
	thumb_func_end sub_80358B0

	thumb_func_start OpponentHandleDMATransfer
OpponentHandleDMATransfer: @ 80358BC
	push {lr}
	bl OpponentBufferExecCompleted
	pop {r0}
	bx r0
	thumb_func_end OpponentHandleDMATransfer

	thumb_func_start sub_80358C8
sub_80358C8: @ 80358C8
	push {lr}
	bl OpponentBufferExecCompleted
	pop {r0}
	bx r0
	thumb_func_end sub_80358C8

	thumb_func_start sub_80358D4
sub_80358D4: @ 80358D4
	push {lr}
	bl OpponentBufferExecCompleted
	pop {r0}
	bx r0
	thumb_func_end sub_80358D4

	thumb_func_start sub_80358E0
sub_80358E0: @ 80358E0
	push {lr}
	bl OpponentBufferExecCompleted
	pop {r0}
	bx r0
	thumb_func_end sub_80358E0

	thumb_func_start sub_80358EC
sub_80358EC: @ 80358EC
	push {lr}
	bl OpponentBufferExecCompleted
	pop {r0}
	bx r0
	thumb_func_end sub_80358EC

	thumb_func_start sub_80358F8
sub_80358F8: @ 80358F8
	push {lr}
	bl OpponentBufferExecCompleted
	pop {r0}
	bx r0
	thumb_func_end sub_80358F8

	thumb_func_start sub_8035904
sub_8035904: @ 8035904
	push {lr}
	bl OpponentBufferExecCompleted
	pop {r0}
	bx r0
	thumb_func_end sub_8035904

	thumb_func_start sub_8035910
sub_8035910: @ 8035910
	push {lr}
	ldr r2, _08035928 @ =gUnknown_020238C8
	ldrb r1, [r2]
	movs r0, 0x80
	negs r0, r0
	ands r0, r1
	strb r0, [r2]
	bl OpponentBufferExecCompleted
	pop {r0}
	bx r0
	.align 2, 0
_08035928: .4byte gUnknown_020238C8
	thumb_func_end sub_8035910

	thumb_func_start sub_803592C
sub_803592C: @ 803592C
	push {lr}
	ldr r3, _08035958 @ =gUnknown_020238C8
	ldr r1, _0803595C @ =gBattleBufferA
	ldr r0, _08035960 @ =gActiveBank
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
	bl OpponentBufferExecCompleted
	pop {r0}
	bx r0
	.align 2, 0
_08035958: .4byte gUnknown_020238C8
_0803595C: .4byte gBattleBufferA
_08035960: .4byte gActiveBank
	thumb_func_end sub_803592C

	thumb_func_start sub_8035964
sub_8035964: @ 8035964
	push {lr}
	ldr r2, _08035978 @ =gUnknown_020238C8
	ldrb r1, [r2]
	movs r0, 0x7F
	ands r0, r1
	strb r0, [r2]
	bl OpponentBufferExecCompleted
	pop {r0}
	bx r0
	.align 2, 0
_08035978: .4byte gUnknown_020238C8
	thumb_func_end sub_8035964

	thumb_func_start sub_803597C
sub_803597C: @ 803597C
	push {lr}
	ldr r3, _080359A0 @ =gUnknown_020238C8
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
	bl OpponentBufferExecCompleted
	pop {r0}
	bx r0
	.align 2, 0
_080359A0: .4byte gUnknown_020238C8
	thumb_func_end sub_803597C

	thumb_func_start OpponentHandleHitAnimation
OpponentHandleHitAnimation: @ 80359A4
	push {r4,lr}
	ldr r3, _080359CC @ =gSprites
	ldr r2, _080359D0 @ =gObjectBankIDs
	ldr r4, _080359D4 @ =gActiveBank
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
	bge _080359D8
	bl OpponentBufferExecCompleted
	b _08035A02
	.align 2, 0
_080359CC: .4byte gSprites
_080359D0: .4byte gObjectBankIDs
_080359D4: .4byte gActiveBank
_080359D8:
	ldr r1, _08035A08 @ =gDoingBattleAnim
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
	ldr r1, _08035A0C @ =gBattleBankFunc
	ldrb r0, [r4]
	lsls r0, 2
	adds r0, r1
	ldr r1, _08035A10 @ =bx_blink_t7
	str r1, [r0]
_08035A02:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08035A08: .4byte gDoingBattleAnim
_08035A0C: .4byte gBattleBankFunc
_08035A10: .4byte bx_blink_t7
	thumb_func_end OpponentHandleHitAnimation

	thumb_func_start sub_8035A14
sub_8035A14: @ 8035A14
	push {lr}
	bl OpponentBufferExecCompleted
	pop {r0}
	bx r0
	thumb_func_end sub_8035A14

	thumb_func_start OpponentHandleEffectivenessSound
OpponentHandleEffectivenessSound: @ 8035A20
	push {r4,lr}
	ldr r4, _08035A5C @ =gActiveBank
	ldrb r0, [r4]
	bl GetBankSide
	lsls r0, 24
	movs r3, 0x3F
	cmp r0, 0
	bne _08035A34
	movs r3, 0xC0
_08035A34:
	ldr r2, _08035A60 @ =gBattleBufferA
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
	bl OpponentBufferExecCompleted
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08035A5C: .4byte gActiveBank
_08035A60: .4byte gBattleBufferA
	thumb_func_end OpponentHandleEffectivenessSound

	thumb_func_start sub_8035A64
sub_8035A64: @ 8035A64
	push {lr}
	ldr r2, _08035A8C @ =gBattleBufferA
	ldr r0, _08035A90 @ =gActiveBank
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
	bl OpponentBufferExecCompleted
	pop {r0}
	bx r0
	.align 2, 0
_08035A8C: .4byte gBattleBufferA
_08035A90: .4byte gActiveBank
	thumb_func_end sub_8035A64

	thumb_func_start OpponentHandleFaintingCry
OpponentHandleFaintingCry: @ 8035A94
	push {lr}
	ldr r1, _08035AC4 @ =gBattlePartyID
	ldr r0, _08035AC8 @ =gActiveBank
	ldrb r0, [r0]
	lsls r0, 1
	adds r0, r1
	ldrh r1, [r0]
	movs r0, 0x64
	muls r0, r1
	ldr r1, _08035ACC @ =gEnemyParty
	adds r0, r1
	movs r1, 0xB
	bl GetMonData
	lsls r0, 16
	lsrs r0, 16
	movs r1, 0x19
	movs r2, 0x5
	bl PlayCry3
	bl OpponentBufferExecCompleted
	pop {r0}
	bx r0
	.align 2, 0
_08035AC4: .4byte gBattlePartyID
_08035AC8: .4byte gActiveBank
_08035ACC: .4byte gEnemyParty
	thumb_func_end OpponentHandleFaintingCry

	thumb_func_start dp01t_2E_7_battle_intro
dp01t_2E_7_battle_intro: @ 8035AD0
	push {lr}
	ldr r1, _08035AF8 @ =gBattleBufferA
	ldr r0, _08035AFC @ =gActiveBank
	ldrb r0, [r0]
	lsls r0, 9
	adds r1, 0x1
	adds r0, r1
	ldrb r0, [r0]
	bl sub_80E43C0
	ldr r2, _08035B00 @ =gUnknown_02024DE8
	ldrh r0, [r2]
	movs r1, 0x1
	orrs r0, r1
	strh r0, [r2]
	bl OpponentBufferExecCompleted
	pop {r0}
	bx r0
	.align 2, 0
_08035AF8: .4byte gBattleBufferA
_08035AFC: .4byte gActiveBank
_08035B00: .4byte gUnknown_02024DE8
	thumb_func_end dp01t_2E_7_battle_intro

	thumb_func_start sub_8035B04
sub_8035B04: @ 8035B04
	push {r4-r6,lr}
	ldr r5, _08035BE0 @ =gObjectBankIDs
	ldr r6, _08035BE4 @ =gActiveBank
	ldrb r0, [r6]
	adds r0, r5
	ldrb r1, [r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	ldr r4, _08035BE8 @ =gSprites
	adds r0, r4
	bl oamt_add_pos2_onto_pos1
	ldrb r0, [r6]
	adds r0, r5
	ldrb r1, [r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r4
	movs r1, 0x23
	strh r1, [r0, 0x2E]
	ldrb r0, [r6]
	adds r0, r5
	ldrb r1, [r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r4
	movs r1, 0x8C
	lsls r1, 1
	strh r1, [r0, 0x32]
	ldrb r0, [r6]
	adds r0, r5
	ldrb r1, [r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r4
	ldrh r1, [r0, 0x22]
	strh r1, [r0, 0x36]
	ldrb r0, [r6]
	adds r0, r5
	ldrb r1, [r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r1, r4, 0
	adds r1, 0x1C
	adds r0, r1
	ldr r1, _08035BEC @ =sub_8078B34
	str r1, [r0]
	ldrb r0, [r6]
	adds r0, r5
	ldrb r1, [r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r4
	ldr r1, _08035BF0 @ =sub_8035C10
	bl oamt_set_x3A_32
	ldr r0, _08035BF4 @ =sub_8035C44
	movs r1, 0x5
	bl CreateTask
	lsls r0, 24
	lsrs r0, 24
	ldr r4, _08035BF8 @ =gTasks
	lsls r1, r0, 2
	adds r1, r0
	lsls r1, 3
	adds r1, r4
	ldrb r0, [r6]
	strh r0, [r1, 0x8]
	ldrb r3, [r6]
	lsls r0, r3, 1
	adds r0, r3
	lsls r0, 2
	ldr r2, _08035BFC @ =0x02017810
	adds r0, r2
	ldrb r1, [r0]
	movs r0, 0x1
	ands r0, r1
	cmp r0, 0
	beq _08035BC2
	ldr r0, _08035C00 @ =gUnknown_02024E68
	adds r0, r3, r0
	ldrb r1, [r0]
	lsls r0, r1, 2
	adds r0, r1
	lsls r0, 3
	adds r0, r4
	ldr r1, _08035C04 @ =sub_8044CA0
	str r1, [r0]
_08035BC2:
	adds r2, 0x30
	ldrb r0, [r2, 0x9]
	movs r1, 0x1
	orrs r0, r1
	strb r0, [r2, 0x9]
	ldr r1, _08035C08 @ =gBattleBankFunc
	ldrb r0, [r6]
	lsls r0, 2
	adds r0, r1
	ldr r1, _08035C0C @ =nullsub_45
	str r1, [r0]
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_08035BE0: .4byte gObjectBankIDs
_08035BE4: .4byte gActiveBank
_08035BE8: .4byte gSprites
_08035BEC: .4byte sub_8078B34
_08035BF0: .4byte sub_8035C10
_08035BF4: .4byte sub_8035C44
_08035BF8: .4byte gTasks
_08035BFC: .4byte 0x02017810
_08035C00: .4byte gUnknown_02024E68
_08035C04: .4byte sub_8044CA0
_08035C08: .4byte gBattleBankFunc
_08035C0C: .4byte nullsub_45
	thumb_func_end sub_8035B04

	thumb_func_start sub_8035C10
sub_8035C10: @ 8035C10
	push {r4,lr}
	adds r4, r0, 0
	ldrh r0, [r4, 0x6]
	bl sub_8031B74
	ldrh r0, [r4, 0x38]
	ldr r1, _08035C3C @ =0x000003ff
	ands r1, r0
	ldrh r2, [r4, 0x4]
	ldr r0, _08035C40 @ =0xfffffc00
	ands r0, r2
	orrs r0, r1
	strh r0, [r4, 0x4]
	adds r0, r4, 0
	bl FreeSpriteOamMatrix
	adds r0, r4, 0
	bl DestroySprite
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08035C3C: .4byte 0x000003ff
_08035C40: .4byte 0xfffffc00
	thumb_func_end sub_8035C10

	thumb_func_start sub_8035C44
sub_8035C44: @ 8035C44
	push {r4-r7,lr}
	mov r7, r9
	mov r6, r8
	push {r6,r7}
	lsls r0, 24
	lsrs r0, 24
	mov r8, r0
	ldr r7, _08035C9C @ =gActiveBank
	ldrb r0, [r7]
	mov r9, r0
	ldr r1, _08035CA0 @ =gTasks
	mov r2, r8
	lsls r0, r2, 2
	add r0, r8
	lsls r0, 3
	adds r0, r1
	ldrh r0, [r0, 0x8]
	strb r0, [r7]
	bl IsDoubleBattle
	lsls r0, 24
	cmp r0, 0
	beq _08035C7E
	ldr r0, _08035CA4 @ =gBattleTypeFlags
	ldrh r1, [r0]
	movs r0, 0x40
	ands r0, r1
	cmp r0, 0
	beq _08035CB0
_08035C7E:
	ldr r0, _08035CA8 @ =gBattleBufferA
	ldrb r1, [r7]
	lsls r2, r1, 9
	adds r0, 0x1
	adds r2, r0
	ldr r0, _08035CAC @ =gBattlePartyID
	lsls r1, 1
	adds r1, r0
	ldrh r0, [r1]
	strb r0, [r2]
	ldrb r0, [r7]
	movs r1, 0
	bl sub_803495C
	b _08035CF0
	.align 2, 0
_08035C9C: .4byte gActiveBank
_08035CA0: .4byte gTasks
_08035CA4: .4byte gBattleTypeFlags
_08035CA8: .4byte gBattleBufferA
_08035CAC: .4byte gBattlePartyID
_08035CB0:
	ldr r4, _08035D14 @ =gBattleBufferA
	ldrb r0, [r7]
	lsls r1, r0, 9
	adds r4, 0x1
	adds r1, r4
	ldr r6, _08035D18 @ =gBattlePartyID
	lsls r0, 1
	adds r0, r6
	ldrh r0, [r0]
	strb r0, [r1]
	ldrb r0, [r7]
	movs r1, 0
	bl sub_803495C
	ldrb r0, [r7]
	movs r5, 0x2
	eors r0, r5
	strb r0, [r7]
	ldrb r0, [r7]
	lsls r1, r0, 9
	adds r1, r4
	lsls r0, 1
	adds r0, r6
	ldrh r0, [r0]
	strb r0, [r1]
	ldrb r0, [r7]
	movs r1, 0
	bl sub_803495C
	ldrb r0, [r7]
	eors r0, r5
	strb r0, [r7]
_08035CF0:
	ldr r1, _08035D1C @ =gBattleBankFunc
	ldr r2, _08035D20 @ =gActiveBank
	ldrb r0, [r2]
	lsls r0, 2
	adds r0, r1
	ldr r1, _08035D24 @ =sub_8032E2C
	str r1, [r0]
	mov r0, r9
	strb r0, [r2]
	mov r0, r8
	bl DestroyTask
	pop {r3,r4}
	mov r8, r3
	mov r9, r4
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_08035D14: .4byte gBattleBufferA
_08035D18: .4byte gBattlePartyID
_08035D1C: .4byte gBattleBankFunc
_08035D20: .4byte gActiveBank
_08035D24: .4byte sub_8032E2C
	thumb_func_end sub_8035C44

	thumb_func_start dp01t_30_7_0803D67C
dp01t_30_7_0803D67C: @ 8035D28
	push {r4-r6,lr}
	ldr r1, _08035D50 @ =gBattleBufferA
	ldr r0, _08035D54 @ =gActiveBank
	ldrb r2, [r0]
	lsls r0, r2, 9
	adds r1, 0x1
	adds r0, r1
	ldrb r0, [r0]
	cmp r0, 0
	beq _08035D58
	adds r0, r2, 0
	bl GetBankSide
	lsls r0, 24
	cmp r0, 0
	bne _08035D58
	bl OpponentBufferExecCompleted
	b _08035E12
	.align 2, 0
_08035D50: .4byte gBattleBufferA
_08035D54: .4byte gActiveBank
_08035D58:
	ldr r3, _08035DA8 @ =gActiveBank
	ldrb r1, [r3]
	lsls r0, r1, 1
	adds r0, r1
	lsls r0, 2
	ldr r4, _08035DAC @ =0x02017810
	adds r0, r4
	ldrb r1, [r0]
	movs r2, 0x1
	orrs r1, r2
	strb r1, [r0]
	ldr r1, _08035DB0 @ =gBattleBufferA
	ldrb r2, [r3]
	lsls r0, r2, 9
	adds r1, 0x2
	adds r0, r1
	ldrb r0, [r0]
	adds r6, r3, 0
	cmp r0, 0
	beq _08035DBC
	lsls r0, r2, 1
	adds r0, r2
	lsls r0, 2
	adds r3, r0, r4
	ldrb r2, [r3, 0x1]
	lsls r1, r2, 26
	lsrs r0, r1, 27
	cmp r0, 0x1
	bhi _08035DB4
	adds r0, 0x1
	movs r1, 0x1F
	ands r0, r1
	lsls r0, 1
	movs r1, 0x3F
	negs r1, r1
	ands r1, r2
	orrs r1, r0
	strb r1, [r3, 0x1]
	b _08035E12
	.align 2, 0
_08035DA8: .4byte gActiveBank
_08035DAC: .4byte 0x02017810
_08035DB0: .4byte gBattleBufferA
_08035DB4:
	movs r0, 0x3F
	negs r0, r0
	ands r0, r2
	strb r0, [r3, 0x1]
_08035DBC:
	adds r5, r6, 0
	ldrb r0, [r5]
	lsls r3, r0, 9
	ldr r4, _08035E18 @ =gUnknown_02023A64
	adds r1, r3, r4
	subs r2, r4, 0x3
	adds r2, r3, r2
	ldrb r2, [r2]
	subs r4, 0x2
	adds r3, r4
	ldrb r3, [r3]
	bl sub_8044804
	ldr r2, _08035E1C @ =gUnknown_02024E68
	ldrb r1, [r5]
	adds r1, r2
	movs r2, 0
	strb r0, [r1]
	ldrb r1, [r5]
	lsls r0, r1, 1
	adds r0, r1
	lsls r0, 2
	ldr r3, _08035E20 @ =0x02017810
	adds r0, r3
	strb r2, [r0, 0x5]
	ldrb r1, [r5]
	lsls r0, r1, 9
	adds r0, r4
	ldrb r0, [r0]
	cmp r0, 0
	beq _08035E06
	lsls r0, r1, 1
	adds r0, r1
	lsls r0, 2
	adds r0, r3
	movs r1, 0x5D
	strb r1, [r0, 0x5]
_08035E06:
	ldr r0, _08035E24 @ =gBattleBankFunc
	ldrb r1, [r6]
	lsls r1, 2
	adds r1, r0
	ldr r0, _08035E28 @ =sub_8035E2C
	str r0, [r1]
_08035E12:
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_08035E18: .4byte gUnknown_02023A64
_08035E1C: .4byte gUnknown_02024E68
_08035E20: .4byte 0x02017810
_08035E24: .4byte gBattleBankFunc
_08035E28: .4byte sub_8035E2C
	thumb_func_end dp01t_30_7_0803D67C

	thumb_func_start sub_8035E2C
sub_8035E2C: @ 8035E2C
	push {r4,lr}
	ldr r4, _08035E64 @ =gActiveBank
	ldrb r1, [r4]
	lsls r0, r1, 1
	adds r0, r1
	lsls r0, 2
	ldr r3, _08035E68 @ =0x02017810
	adds r0, r3
	ldrb r1, [r0, 0x5]
	adds r2, r1, 0x1
	strb r2, [r0, 0x5]
	lsls r1, 24
	lsrs r1, 24
	cmp r1, 0x5C
	bls _08035E5C
	ldrb r0, [r4]
	lsls r1, r0, 1
	adds r1, r0
	lsls r1, 2
	adds r1, r3
	movs r0, 0
	strb r0, [r1, 0x5]
	bl OpponentBufferExecCompleted
_08035E5C:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08035E64: .4byte gActiveBank
_08035E68: .4byte 0x02017810
	thumb_func_end sub_8035E2C

	thumb_func_start sub_8035E6C
sub_8035E6C: @ 8035E6C
	push {lr}
	ldr r0, _08035EA4 @ =gActiveBank
	ldrb r3, [r0]
	lsls r0, r3, 1
	adds r0, r3
	lsls r0, 2
	ldr r1, _08035EA8 @ =0x02017810
	adds r0, r1
	ldrb r1, [r0]
	movs r0, 0x1
	ands r0, r1
	cmp r0, 0
	beq _08035E9A
	ldr r2, _08035EAC @ =gTasks
	ldr r0, _08035EB0 @ =gUnknown_02024E68
	adds r0, r3, r0
	ldrb r1, [r0]
	lsls r0, r1, 2
	adds r0, r1
	lsls r0, 3
	adds r0, r2
	ldr r1, _08035EB4 @ =sub_8044CA0
	str r1, [r0]
_08035E9A:
	bl OpponentBufferExecCompleted
	pop {r0}
	bx r0
	.align 2, 0
_08035EA4: .4byte gActiveBank
_08035EA8: .4byte 0x02017810
_08035EAC: .4byte gTasks
_08035EB0: .4byte gUnknown_02024E68
_08035EB4: .4byte sub_8044CA0
	thumb_func_end sub_8035E6C

	thumb_func_start sub_8035EB8
sub_8035EB8: @ 8035EB8
	push {lr}
	bl OpponentBufferExecCompleted
	pop {r0}
	bx r0
	thumb_func_end sub_8035EB8

	thumb_func_start OpponentHandleSpriteInvisibility
OpponentHandleSpriteInvisibility: @ 8035EC4
	push {r4,lr}
	ldr r4, _08035F14 @ =gActiveBank
	ldrb r0, [r4]
	bl sub_8078874
	lsls r0, 24
	cmp r0, 0
	beq _08035F0A
	ldr r3, _08035F18 @ =gSprites
	ldr r0, _08035F1C @ =gObjectBankIDs
	ldrb r1, [r4]
	adds r0, r1, r0
	ldrb r0, [r0]
	lsls r2, r0, 4
	adds r2, r0
	lsls r2, 2
	adds r2, r3
	ldr r0, _08035F20 @ =gBattleBufferA
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
_08035F0A:
	bl OpponentBufferExecCompleted
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08035F14: .4byte gActiveBank
_08035F18: .4byte gSprites
_08035F1C: .4byte gObjectBankIDs
_08035F20: .4byte gBattleBufferA
	thumb_func_end OpponentHandleSpriteInvisibility

	thumb_func_start OpponentHandleBattleAnimation
OpponentHandleBattleAnimation: @ 8035F24
	push {r4-r6,lr}
	sub sp, 0x4
	ldr r6, _08035F68 @ =gActiveBank
	ldrb r0, [r6]
	bl mplay_80342A4
	lsls r0, 24
	cmp r0, 0
	bne _08035F7C
	ldr r5, _08035F6C @ =gBattleBufferA
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
	beq _08035F70
	bl OpponentBufferExecCompleted
	b _08035F7C
	.align 2, 0
_08035F68: .4byte gActiveBank
_08035F6C: .4byte gBattleBufferA
_08035F70:
	ldr r0, _08035F84 @ =gBattleBankFunc
	ldrb r1, [r6]
	lsls r1, 2
	adds r1, r0
	ldr r0, _08035F88 @ =sub_80334C0
	str r0, [r1]
_08035F7C:
	add sp, 0x4
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_08035F84: .4byte gBattleBankFunc
_08035F88: .4byte sub_80334C0
	thumb_func_end OpponentHandleBattleAnimation

	thumb_func_start OpponentHandleLinkStandbyMsg
OpponentHandleLinkStandbyMsg: @ 8035F8C
	push {lr}
	bl OpponentBufferExecCompleted
	pop {r0}
	bx r0
	thumb_func_end OpponentHandleLinkStandbyMsg

	thumb_func_start OpponentHandleResetActionMoveSelection
OpponentHandleResetActionMoveSelection: @ 8035F98
	push {lr}
	bl OpponentBufferExecCompleted
	pop {r0}
	bx r0
	thumb_func_end OpponentHandleResetActionMoveSelection

	thumb_func_start sub_8035FA4
sub_8035FA4: @ 8035FA4
	push {lr}
	ldr r0, _08035FD8 @ =gBattleTypeFlags
	ldrh r1, [r0]
	movs r0, 0x6
	ands r0, r1
	cmp r0, 0x2
	bne _08035FCE
	ldr r2, _08035FDC @ =gMain
	ldr r0, _08035FE0 @ =0x0000043d
	adds r3, r2, r0
	ldrb r1, [r3]
	movs r0, 0x3
	negs r0, r0
	ands r0, r1
	strb r0, [r3]
	ldr r0, _08035FE4 @ =gPreBattleCallback1
	ldr r0, [r0]
	str r0, [r2]
	ldr r0, [r2, 0x8]
	bl SetMainCallback2
_08035FCE:
	bl OpponentBufferExecCompleted
	pop {r0}
	bx r0
	.align 2, 0
_08035FD8: .4byte gBattleTypeFlags
_08035FDC: .4byte gMain
_08035FE0: .4byte 0x0000043d
_08035FE4: .4byte gPreBattleCallback1
	thumb_func_end sub_8035FA4

	thumb_func_start nullsub_46
nullsub_46: @ 8035FE8
	bx lr
	thumb_func_end nullsub_46

	.align 2, 0 @ Don't pad with nop.
