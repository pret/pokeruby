	.include "constants/gba_constants.inc"
	.include "constants/species_constants.inc"
	.include "asm/macros.inc"

	.syntax unified

	.text



	thumb_func_start nullsub_47
nullsub_47: @ 803750C
	bx lr
	thumb_func_end nullsub_47

	thumb_func_start SetBankFuncToLinkOpponentBufferRunCommand
SetBankFuncToLinkOpponentBufferRunCommand: @ 8037510
	ldr r1, _08037520 @ =gBattleBankFunc
	ldr r0, _08037524 @ =gActiveBank
	ldrb r0, [r0]
	lsls r0, 2
	adds r0, r1
	ldr r1, _08037528 @ =sub_803752C
	str r1, [r0]
	bx lr
	.align 2, 0
_08037520: .4byte gBattleBankFunc
_08037524: .4byte gActiveBank
_08037528: .4byte sub_803752C
	thumb_func_end SetBankFuncToLinkOpponentBufferRunCommand

	thumb_func_start sub_803752C
sub_803752C: @ 803752C
	push {lr}
	ldr r2, _08037560 @ =gBattleExecBuffer
	ldr r1, _08037564 @ =gBitTable
	ldr r0, _08037568 @ =gActiveBank
	ldrb r3, [r0]
	lsls r0, r3, 2
	adds r0, r1
	ldr r1, [r2]
	ldr r0, [r0]
	ands r1, r0
	cmp r1, 0
	beq _08037578
	ldr r0, _0803756C @ =gBattleBufferA
	lsls r1, r3, 9
	adds r1, r0
	ldrb r0, [r1]
	cmp r0, 0x38
	bhi _08037574
	ldr r0, _08037570 @ =gLinkOpponentBufferCommands
	ldrb r1, [r1]
	lsls r1, 2
	adds r1, r0
	ldr r0, [r1]
	bl _call_via_r0
	b _08037578
	.align 2, 0
_08037560: .4byte gBattleExecBuffer
_08037564: .4byte gBitTable
_08037568: .4byte gActiveBank
_0803756C: .4byte gBattleBufferA
_08037570: .4byte gLinkOpponentBufferCommands
_08037574:
	bl LinkOpponentBufferExecCompleted
_08037578:
	pop {r0}
	bx r0
	thumb_func_end sub_803752C

	thumb_func_start sub_803757C
sub_803757C: @ 803757C
	push {lr}
	ldr r2, _080375A4 @ =gSprites
	ldr r1, _080375A8 @ =gObjectBankIDs
	ldr r0, _080375AC @ =gActiveBank
	ldrb r0, [r0]
	adds r0, r1
	ldrb r1, [r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r2, 0x1C
	adds r0, r2
	ldr r1, [r0]
	ldr r0, _080375B0 @ =SpriteCallbackDummy
	cmp r1, r0
	bne _080375A0
	bl LinkOpponentBufferExecCompleted
_080375A0:
	pop {r0}
	bx r0
	.align 2, 0
_080375A4: .4byte gSprites
_080375A8: .4byte gObjectBankIDs
_080375AC: .4byte gActiveBank
_080375B0: .4byte SpriteCallbackDummy
	thumb_func_end sub_803757C

	thumb_func_start sub_80375B4
sub_80375B4: @ 80375B4
	push {r4-r6,lr}
	ldr r4, _0803762C @ =gSprites
	ldr r6, _08037630 @ =gObjectBankIDs
	ldr r5, _08037634 @ =gActiveBank
	ldrb r0, [r5]
	adds r0, r6
	ldrb r1, [r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r2, r0, 2
	adds r0, r4, 0
	adds r0, 0x1C
	adds r0, r2, r0
	ldr r1, [r0]
	ldr r0, _08037638 @ =SpriteCallbackDummy
	cmp r1, r0
	bne _08037624
	adds r0, r2, r4
	ldrh r0, [r0, 0x6]
	bl sub_8031B74
	ldrb r0, [r5]
	adds r0, r6
	ldrb r0, [r0]
	lsls r1, r0, 4
	adds r1, r0
	lsls r1, 2
	adds r1, r4
	ldrh r0, [r1, 0x38]
	ldr r2, _0803763C @ =0x000003ff
	ands r2, r0
	ldrh r3, [r1, 0x4]
	ldr r0, _08037640 @ =0xfffffc00
	ands r0, r3
	orrs r0, r2
	strh r0, [r1, 0x4]
	ldrb r0, [r5]
	adds r0, r6
	ldrb r1, [r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r4
	bl FreeSpriteOamMatrix
	ldrb r0, [r5]
	adds r0, r6
	ldrb r1, [r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r4
	bl DestroySprite
	bl LinkOpponentBufferExecCompleted
_08037624:
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_0803762C: .4byte gSprites
_08037630: .4byte gObjectBankIDs
_08037634: .4byte gActiveBank
_08037638: .4byte SpriteCallbackDummy
_0803763C: .4byte 0x000003ff
_08037640: .4byte 0xfffffc00
	thumb_func_end sub_80375B4

	thumb_func_start sub_8037644
sub_8037644: @ 8037644
	push {lr}
	ldr r3, _08037678 @ =gActiveBank
	ldrb r0, [r3]
	lsls r1, r0, 1
	adds r1, r0
	lsls r1, 2
	ldr r2, _0803767C @ =0x02017810
	adds r1, r2
	ldrb r0, [r1, 0x9]
	subs r0, 0x1
	strb r0, [r1, 0x9]
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0xFF
	bne _08037674
	ldrb r0, [r3]
	lsls r1, r0, 1
	adds r1, r0
	lsls r1, 2
	adds r1, r2
	movs r0, 0
	strb r0, [r1, 0x9]
	bl LinkOpponentBufferExecCompleted
_08037674:
	pop {r0}
	bx r0
	.align 2, 0
_08037678: .4byte gActiveBank
_0803767C: .4byte 0x02017810
	thumb_func_end sub_8037644

	thumb_func_start sub_8037680
sub_8037680: @ 8037680
	push {r4-r7,lr}
	movs r6, 0
	bl IsDoubleBattle
	lsls r0, 24
	cmp r0, 0
	beq _080376A4
	bl IsDoubleBattle
	lsls r0, 24
	cmp r0, 0
	beq _080376D8
	ldr r0, _080376C4 @ =gBattleTypeFlags
	ldrh r1, [r0]
	movs r0, 0x40
	ands r0, r1
	cmp r0, 0
	beq _080376D8
_080376A4:
	ldr r2, _080376C8 @ =gSprites
	ldr r1, _080376CC @ =gHealthboxIDs
	ldr r0, _080376D0 @ =gActiveBank
	ldrb r0, [r0]
	adds r0, r1
	ldrb r1, [r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r2, 0x1C
	adds r0, r2
	ldr r1, [r0]
	ldr r0, _080376D4 @ =SpriteCallbackDummy
	cmp r1, r0
	bne _0803770E
	b _0803770C
	.align 2, 0
_080376C4: .4byte gBattleTypeFlags
_080376C8: .4byte gSprites
_080376CC: .4byte gHealthboxIDs
_080376D0: .4byte gActiveBank
_080376D4: .4byte SpriteCallbackDummy
_080376D8:
	ldr r2, _080377D8 @ =gSprites
	ldr r5, _080377DC @ =gHealthboxIDs
	ldr r0, _080377E0 @ =gActiveBank
	ldrb r3, [r0]
	adds r0, r3, r5
	ldrb r1, [r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r2, 0x1C
	adds r0, r2
	ldr r4, [r0]
	ldr r0, _080377E4 @ =SpriteCallbackDummy
	cmp r4, r0
	bne _0803770E
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
	bne _0803770E
_0803770C:
	movs r6, 0x1
_0803770E:
	bl IsCryPlayingOrClearCrySongs
	lsls r0, 24
	cmp r0, 0
	beq _0803771A
	movs r6, 0
_0803771A:
	cmp r6, 0
	bne _08037720
	b _08037822
_08037720:
	ldr r7, _080377E0 @ =gActiveBank
	ldrb r0, [r7]
	bl GetBankIdentity
	lsls r0, 24
	lsrs r3, r0, 24
	cmp r3, 0x1
	bne _080377B4
	ldrb r2, [r7]
	lsls r0, r2, 1
	adds r0, r2
	lsls r0, 2
	ldr r5, _080377E8 @ =0x02017810
	adds r4, r0, r5
	ldrb r1, [r4, 0x1]
	adds r0, r3, 0
	ands r0, r1
	cmp r0, 0
	beq _08037822
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
	beq _08037822
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
	ldr r4, _080377EC @ =0x000027f9
	adds r0, r4, 0
	bl FreeSpriteTilesByTag
	adds r0, r4, 0
	bl FreeSpritePaletteByTag
_080377B4:
	ldr r0, _080377F0 @ =gBattleTypeFlags
	ldrh r1, [r0]
	movs r0, 0x40
	ands r0, r1
	cmp r0, 0
	beq _080377F8
	ldrb r0, [r7]
	bl GetBankIdentity
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _08037804
	ldr r0, _080377F4 @ =gMPlay_BGM
	bl m4aMPlayContinue
	b _08037804
	.align 2, 0
_080377D8: .4byte gSprites
_080377DC: .4byte gHealthboxIDs
_080377E0: .4byte gActiveBank
_080377E4: .4byte SpriteCallbackDummy
_080377E8: .4byte 0x02017810
_080377EC: .4byte 0x000027f9
_080377F0: .4byte gBattleTypeFlags
_080377F4: .4byte gMPlay_BGM
_080377F8:
	ldr r0, _08037828 @ =gMPlay_BGM
	ldr r1, _0803782C @ =0x0000ffff
	movs r2, 0x80
	lsls r2, 1
	bl m4aMPlayVolumeControl
_08037804:
	ldr r2, _08037830 @ =gActiveBank
	ldrb r1, [r2]
	lsls r0, r1, 1
	adds r0, r1
	lsls r0, 2
	ldr r1, _08037834 @ =0x02017810
	adds r0, r1
	movs r1, 0x3
	strb r1, [r0, 0x9]
	ldr r1, _08037838 @ =gBattleBankFunc
	ldrb r0, [r2]
	lsls r0, 2
	adds r0, r1
	ldr r1, _0803783C @ =sub_8037644
	str r1, [r0]
_08037822:
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_08037828: .4byte gMPlay_BGM
_0803782C: .4byte 0x0000ffff
_08037830: .4byte gActiveBank
_08037834: .4byte 0x02017810
_08037838: .4byte gBattleBankFunc
_0803783C: .4byte sub_8037644
	thumb_func_end sub_8037680

	thumb_func_start sub_8037840
sub_8037840: @ 8037840
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	ldr r6, _08037A48 @ =gActiveBank
	ldrb r2, [r6]
	lsls r3, r2, 1
	adds r0, r3, r2
	lsls r0, 2
	ldr r5, _08037A4C @ =0x02017810
	adds r0, r5
	ldrb r1, [r0]
	movs r4, 0x88
	adds r0, r4, 0
	ands r0, r1
	cmp r0, 0
	bne _08037878
	ldr r0, _08037A50 @ =gBattlePartyID
	adds r0, r3, r0
	ldrh r1, [r0]
	movs r0, 0x64
	muls r1, r0
	ldr r0, _08037A54 @ =gEnemyParty
	adds r1, r0
	adds r0, r2, 0
	bl sub_8141828
_08037878:
	ldrb r0, [r6]
	movs r7, 0x2
	adds r2, r7, 0
	eors r2, r0
	lsls r3, r2, 1
	adds r0, r3, r2
	lsls r0, 2
	adds r0, r5
	ldrb r1, [r0]
	adds r0, r4, 0
	ands r0, r1
	cmp r0, 0
	bne _080378A6
	ldr r0, _08037A50 @ =gBattlePartyID
	adds r0, r3, r0
	ldrh r1, [r0]
	movs r0, 0x64
	muls r1, r0
	ldr r0, _08037A54 @ =gEnemyParty
	adds r1, r0
	adds r0, r2, 0
	bl sub_8141828
_080378A6:
	ldrb r2, [r6]
	lsls r0, r2, 1
	adds r0, r2
	lsls r0, 2
	adds r0, r5
	ldrb r1, [r0]
	movs r3, 0x8
	adds r0, r3, 0
	ands r0, r1
	cmp r0, 0
	beq _080378BE
	b _08037A3A
_080378BE:
	adds r1, r2, 0
	eors r1, r7
	lsls r0, r1, 1
	adds r0, r1
	lsls r0, 2
	adds r0, r5
	ldrb r1, [r0]
	adds r0, r3, 0
	ands r0, r1
	lsls r0, 24
	lsrs r4, r0, 24
	cmp r4, 0
	beq _080378DA
	b _08037A3A
_080378DA:
	ldr r0, _08037A58 @ =gBattleTypeFlags
	ldrh r1, [r0]
	movs r0, 0x40
	ands r0, r1
	cmp r0, 0
	beq _0803791A
	adds r0, r2, 0
	bl GetBankIdentity
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x3
	bne _0803791A
	ldrb r0, [r6]
	lsls r1, r0, 1
	adds r1, r0
	lsls r1, 2
	adds r1, r5
	ldrb r0, [r1, 0x9]
	adds r0, 0x1
	strb r0, [r1, 0x9]
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _0803790E
	b _08037A3A
_0803790E:
	ldrb r1, [r6]
	lsls r0, r1, 1
	adds r0, r1
	lsls r0, 2
	adds r0, r5
	strb r4, [r0, 0x9]
_0803791A:
	bl IsDoubleBattle
	lsls r0, 24
	cmp r0, 0
	beq _080379B2
	ldr r0, _08037A58 @ =gBattleTypeFlags
	ldrh r1, [r0]
	movs r0, 0x40
	ands r0, r1
	cmp r0, 0
	bne _080379B2
	ldr r1, _08037A5C @ =gUnknown_0300434C
	ldr r5, _08037A48 @ =gActiveBank
	ldrb r0, [r5]
	movs r4, 0x2
	eors r0, r4
	adds r0, r1
	ldrb r1, [r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	ldr r1, _08037A60 @ =gSprites
	adds r0, r1
	bl DestroySprite
	ldr r0, _08037A64 @ =gHealthboxIDs
	mov r8, r0
	ldrb r0, [r5]
	adds r1, r4, 0
	eors r1, r0
	mov r2, r8
	adds r0, r1, r2
	ldrb r0, [r0]
	ldr r2, _08037A50 @ =gBattlePartyID
	mov r10, r2
	lsls r1, 1
	add r1, r10
	ldrh r1, [r1]
	movs r2, 0x64
	mov r9, r2
	mov r2, r9
	muls r2, r1
	adds r1, r2, 0
	ldr r6, _08037A54 @ =gEnemyParty
	adds r1, r6
	movs r2, 0
	bl sub_8045A5C
	ldrb r0, [r5]
	eors r0, r4
	bl sub_804777C
	ldrb r0, [r5]
	eors r0, r4
	add r0, r8
	ldrb r0, [r0]
	bl sub_8043DFC
	ldrb r0, [r5]
	eors r4, r0
	lsls r0, r4, 1
	add r0, r10
	ldrh r0, [r0]
	mov r1, r9
	muls r1, r0
	adds r0, r1, 0
	adds r0, r6
	movs r1, 0xB
	bl GetMonData
	adds r1, r0, 0
	lsls r1, 16
	lsrs r1, 16
	adds r0, r4, 0
	bl sub_8032984
_080379B2:
	ldr r1, _08037A5C @ =gUnknown_0300434C
	ldr r4, _08037A48 @ =gActiveBank
	ldrb r0, [r4]
	adds r0, r1
	ldrb r1, [r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	ldr r1, _08037A60 @ =gSprites
	adds r0, r1
	bl DestroySprite
	ldr r5, _08037A64 @ =gHealthboxIDs
	ldrb r1, [r4]
	adds r0, r1, r5
	ldrb r0, [r0]
	ldr r2, _08037A50 @ =gBattlePartyID
	mov r9, r2
	lsls r1, 1
	add r1, r9
	ldrh r1, [r1]
	movs r2, 0x64
	mov r8, r2
	mov r2, r8
	muls r2, r1
	adds r1, r2, 0
	ldr r6, _08037A54 @ =gEnemyParty
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
	ldr r2, _08037A68 @ =0x02017840
	ldrb r1, [r2, 0x9]
	movs r0, 0x2
	negs r0, r0
	ands r0, r1
	strb r0, [r2, 0x9]
	ldr r1, _08037A6C @ =gBattleBankFunc
	ldrb r0, [r4]
	lsls r0, 2
	adds r0, r1
	ldr r1, _08037A70 @ =sub_8037680
	str r1, [r0]
_08037A3A:
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_08037A48: .4byte gActiveBank
_08037A4C: .4byte 0x02017810
_08037A50: .4byte gBattlePartyID
_08037A54: .4byte gEnemyParty
_08037A58: .4byte gBattleTypeFlags
_08037A5C: .4byte gUnknown_0300434C
_08037A60: .4byte gSprites
_08037A64: .4byte gHealthboxIDs
_08037A68: .4byte 0x02017840
_08037A6C: .4byte gBattleBankFunc
_08037A70: .4byte sub_8037680
	thumb_func_end sub_8037840

	thumb_func_start sub_8037A74
sub_8037A74: @ 8037A74
	push {r4-r7,lr}
	ldr r2, _08037ACC @ =gSprites
	ldr r0, _08037AD0 @ =gObjectBankIDs
	ldr r7, _08037AD4 @ =gActiveBank
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
	bne _08037B18
	movs r4, 0x24
	ldrsh r0, [r1, r4]
	cmp r0, 0
	bne _08037B18
	lsls r4, r3, 1
	adds r0, r4, r3
	lsls r0, 2
	ldr r6, _08037AD8 @ =0x02017810
	adds r1, r0, r6
	ldrb r5, [r1]
	movs r0, 0x80
	ands r0, r5
	cmp r0, 0
	bne _08037AE4
	ldr r0, _08037ADC @ =gBattlePartyID
	adds r0, r4, r0
	ldrh r1, [r0]
	movs r0, 0x64
	muls r1, r0
	ldr r0, _08037AE0 @ =gEnemyParty
	adds r1, r0
	adds r0, r3, 0
	bl sub_8141828
	b _08037B18
	.align 2, 0
_08037ACC: .4byte gSprites
_08037AD0: .4byte gObjectBankIDs
_08037AD4: .4byte gActiveBank
_08037AD8: .4byte 0x02017810
_08037ADC: .4byte gBattlePartyID
_08037AE0: .4byte gEnemyParty
_08037AE4:
	ldrb r0, [r1, 0x1]
	ands r2, r0
	cmp r2, 0
	beq _08037B18
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
	ldr r4, _08037B20 @ =0x000027f9
	adds r0, r4, 0
	bl FreeSpriteTilesByTag
	adds r0, r4, 0
	bl FreeSpritePaletteByTag
	bl LinkOpponentBufferExecCompleted
_08037B18:
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_08037B20: .4byte 0x000027f9
	thumb_func_end sub_8037A74

	thumb_func_start sub_8037B24
sub_8037B24: @ 8037B24
	push {r4-r6,lr}
	ldr r6, _08037B64 @ =gActiveBank
	ldrb r0, [r6]
	ldr r5, _08037B68 @ =gHealthboxIDs
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
	beq _08037B6C
	ldrb r0, [r6]
	adds r0, r5
	ldrb r0, [r0]
	movs r2, 0
	bl sub_80440EC
	b _08037B70
	.align 2, 0
_08037B64: .4byte gActiveBank
_08037B68: .4byte gHealthboxIDs
_08037B6C:
	bl LinkOpponentBufferExecCompleted
_08037B70:
	pop {r4-r6}
	pop {r0}
	bx r0
	thumb_func_end sub_8037B24

	thumb_func_start sub_8037B78
sub_8037B78: @ 8037B78
	push {lr}
	ldr r2, _08037BAC @ =gSprites
	ldr r0, _08037BB0 @ =gObjectBankIDs
	ldr r1, _08037BB4 @ =gActiveBank
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
	bne _08037BA6
	ldr r0, _08037BB8 @ =gHealthboxIDs
	adds r0, r3, r0
	ldrb r0, [r0]
	bl sub_8043DB0
	bl LinkOpponentBufferExecCompleted
_08037BA6:
	pop {r0}
	bx r0
	.align 2, 0
_08037BAC: .4byte gSprites
_08037BB0: .4byte gObjectBankIDs
_08037BB4: .4byte gActiveBank
_08037BB8: .4byte gHealthboxIDs
	thumb_func_end sub_8037B78

	thumb_func_start sub_8037BBC
sub_8037BBC: @ 8037BBC
	push {r4-r6,lr}
	ldr r6, _08037C18 @ =gActiveBank
	ldrb r2, [r6]
	lsls r0, r2, 1
	adds r0, r2
	lsls r0, 2
	ldr r1, _08037C1C @ =0x02017810
	adds r0, r1
	ldrb r1, [r0]
	movs r0, 0x40
	ands r0, r1
	cmp r0, 0
	bne _08037C12
	ldr r5, _08037C20 @ =gObjectBankIDs
	adds r0, r2, r5
	ldrb r1, [r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	ldr r4, _08037C24 @ =gSprites
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
	ldr r1, _08037C28 @ =gHealthboxIDs
	ldrb r0, [r6]
	adds r0, r1
	ldrb r0, [r0]
	bl sub_8043DB0
	bl LinkOpponentBufferExecCompleted
_08037C12:
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_08037C18: .4byte gActiveBank
_08037C1C: .4byte 0x02017810
_08037C20: .4byte gObjectBankIDs
_08037C24: .4byte gSprites
_08037C28: .4byte gHealthboxIDs
	thumb_func_end sub_8037BBC

	thumb_func_start sub_8037C2C
sub_8037C2C: @ 8037C2C
	push {lr}
	ldr r0, _08037C40 @ =gUnknown_03004210
	ldrh r0, [r0, 0x16]
	cmp r0, 0
	bne _08037C3A
	bl LinkOpponentBufferExecCompleted
_08037C3A:
	pop {r0}
	bx r0
	.align 2, 0
_08037C40: .4byte gUnknown_03004210
	thumb_func_end sub_8037C2C

	thumb_func_start dp01t_0F_4_move_anim
dp01t_0F_4_move_anim: @ 8037C44
	push {r4,lr}
	ldr r1, _08037C80 @ =gObjectBankIDs
	ldr r0, _08037C84 @ =gActiveBank
	ldrb r0, [r0]
	adds r0, r1
	ldrb r1, [r0]
	ldr r2, _08037C88 @ =gSprites
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r4, r0, r2
	movs r1, 0x30
	ldrsh r0, [r4, r1]
	cmp r0, 0x20
	bne _08037C90
	movs r3, 0
	movs r0, 0
	strh r0, [r4, 0x30]
	adds r2, r4, 0
	adds r2, 0x3E
	ldrb r1, [r2]
	subs r0, 0x5
	ands r0, r1
	strb r0, [r2]
	ldr r0, _08037C8C @ =gDoingBattleAnim
	strb r3, [r0]
	bl LinkOpponentBufferExecCompleted
	b _08037CBA
	.align 2, 0
_08037C80: .4byte gObjectBankIDs
_08037C84: .4byte gActiveBank
_08037C88: .4byte gSprites
_08037C8C: .4byte gDoingBattleAnim
_08037C90:
	ldrh r0, [r4, 0x30]
	movs r1, 0x3
	ands r0, r1
	cmp r0, 0
	bne _08037CB4
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
_08037CB4:
	ldrh r0, [r4, 0x30]
	adds r0, 0x1
	strh r0, [r4, 0x30]
_08037CBA:
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end dp01t_0F_4_move_anim

	thumb_func_start sub_8037CC0
sub_8037CC0: @ 8037CC0
	push {r4,lr}
	ldr r2, _08037D10 @ =gSprites
	ldr r0, _08037D14 @ =gHealthboxIDs
	ldr r4, _08037D18 @ =gActiveBank
	ldrb r3, [r4]
	adds r0, r3, r0
	ldrb r1, [r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r2, 0x1C
	adds r0, r2
	ldr r1, [r0]
	ldr r0, _08037D1C @ =SpriteCallbackDummy
	cmp r1, r0
	bne _08037D08
	lsls r0, r3, 2
	ldr r1, _08037D20 @ =0x02017800
	adds r0, r1
	ldrb r1, [r0]
	movs r0, 0x4
	ands r0, r1
	cmp r0, 0
	beq _08037CFC
	adds r0, r3, 0
	adds r1, r3, 0
	adds r2, r3, 0
	movs r3, 0x6
	bl move_anim_start_t4
_08037CFC:
	ldr r0, _08037D24 @ =gBattleBankFunc
	ldrb r1, [r4]
	lsls r1, 2
	adds r1, r0
	ldr r0, _08037D28 @ =sub_8037D2C
	str r0, [r1]
_08037D08:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08037D10: .4byte gSprites
_08037D14: .4byte gHealthboxIDs
_08037D18: .4byte gActiveBank
_08037D1C: .4byte SpriteCallbackDummy
_08037D20: .4byte 0x02017800
_08037D24: .4byte gBattleBankFunc
_08037D28: .4byte sub_8037D2C
	thumb_func_end sub_8037CC0

	thumb_func_start sub_8037D2C
sub_8037D2C: @ 8037D2C
	push {lr}
	ldr r0, _08037D58 @ =gActiveBank
	ldrb r1, [r0]
	lsls r0, r1, 1
	adds r0, r1
	lsls r0, 2
	ldr r1, _08037D5C @ =0x02017810
	adds r0, r1
	ldrb r1, [r0]
	movs r0, 0x40
	ands r0, r1
	cmp r0, 0
	bne _08037D52
	ldr r0, _08037D60 @ =c3_0802FDF4
	movs r1, 0xA
	bl CreateTask
	bl LinkOpponentBufferExecCompleted
_08037D52:
	pop {r0}
	bx r0
	.align 2, 0
_08037D58: .4byte gActiveBank
_08037D5C: .4byte 0x02017810
_08037D60: .4byte c3_0802FDF4
	thumb_func_end sub_8037D2C

	thumb_func_start sub_8037D64
sub_8037D64: @ 8037D64
	push {r4,r5,lr}
	ldr r5, _08037E08 @ =gActiveBank
	ldrb r1, [r5]
	lsls r0, r1, 1
	adds r0, r1
	lsls r0, 2
	ldr r3, _08037E0C @ =0x02017810
	adds r2, r0, r3
	ldrb r1, [r2, 0x1]
	movs r0, 0x1
	ands r0, r1
	cmp r0, 0
	beq _08037E00
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
	ldr r4, _08037E10 @ =0x000027f9
	adds r0, r4, 0
	bl FreeSpriteTilesByTag
	adds r0, r4, 0
	bl FreeSpritePaletteByTag
	ldr r1, _08037E14 @ =gObjectBankIDs
	ldrb r0, [r5]
	adds r0, r1
	ldrb r1, [r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	ldr r1, _08037E18 @ =gSprites
	adds r0, r1
	movs r1, 0
	bl StartSpriteAnim
	ldr r4, _08037E1C @ =gHealthboxIDs
	ldrb r1, [r5]
	adds r0, r1, r4
	ldrb r0, [r0]
	ldr r2, _08037E20 @ =gBattlePartyID
	lsls r1, 1
	adds r1, r2
	ldrh r2, [r1]
	movs r1, 0x64
	muls r1, r2
	ldr r2, _08037E24 @ =gEnemyParty
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
	ldr r1, _08037E28 @ =gBattleBankFunc
	ldrb r0, [r5]
	lsls r0, 2
	adds r0, r1
	ldr r1, _08037E2C @ =sub_8037CC0
	str r1, [r0]
_08037E00:
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_08037E08: .4byte gActiveBank
_08037E0C: .4byte 0x02017810
_08037E10: .4byte 0x000027f9
_08037E14: .4byte gObjectBankIDs
_08037E18: .4byte gSprites
_08037E1C: .4byte gHealthboxIDs
_08037E20: .4byte gBattlePartyID
_08037E24: .4byte gEnemyParty
_08037E28: .4byte gBattleBankFunc
_08037E2C: .4byte sub_8037CC0
	thumb_func_end sub_8037D64

	thumb_func_start sub_8037E30
sub_8037E30: @ 8037E30
	push {r4-r6,lr}
	ldr r5, _08037ECC @ =gActiveBank
	ldrb r2, [r5]
	lsls r3, r2, 1
	adds r0, r3, r2
	lsls r0, 2
	ldr r6, _08037ED0 @ =0x02017810
	adds r0, r6
	ldrb r1, [r0]
	movs r0, 0x88
	ands r0, r1
	cmp r0, 0
	bne _08037E5E
	ldr r0, _08037ED4 @ =gBattlePartyID
	adds r0, r3, r0
	ldrh r1, [r0]
	movs r0, 0x64
	muls r1, r0
	ldr r0, _08037ED8 @ =gEnemyParty
	adds r1, r0
	adds r0, r2, 0
	bl sub_8141828
_08037E5E:
	ldr r4, _08037EDC @ =gSprites
	ldr r0, _08037EE0 @ =gUnknown_0300434C
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
	ldr r0, _08037EE4 @ =SpriteCallbackDummy
	cmp r1, r0
	bne _08037EC4
	lsls r0, r2, 1
	adds r0, r2
	lsls r0, 2
	adds r0, r6
	ldrb r1, [r0]
	movs r0, 0x8
	ands r0, r1
	cmp r0, 0
	bne _08037EC4
	adds r0, r3, r4
	bl DestroySprite
	ldrb r4, [r5]
	ldr r1, _08037ED4 @ =gBattlePartyID
	lsls r0, r4, 1
	adds r0, r1
	ldrh r1, [r0]
	movs r0, 0x64
	muls r0, r1
	ldr r1, _08037ED8 @ =gEnemyParty
	adds r0, r1
	movs r1, 0xB
	bl GetMonData
	adds r1, r0, 0
	lsls r1, 16
	lsrs r1, 16
	adds r0, r4, 0
	bl sub_8032984
	ldr r1, _08037EE8 @ =gBattleBankFunc
	ldrb r0, [r5]
	lsls r0, 2
	adds r0, r1
	ldr r1, _08037EEC @ =sub_8037D64
	str r1, [r0]
_08037EC4:
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_08037ECC: .4byte gActiveBank
_08037ED0: .4byte 0x02017810
_08037ED4: .4byte gBattlePartyID
_08037ED8: .4byte gEnemyParty
_08037EDC: .4byte gSprites
_08037EE0: .4byte gUnknown_0300434C
_08037EE4: .4byte SpriteCallbackDummy
_08037EE8: .4byte gBattleBankFunc
_08037EEC: .4byte sub_8037D64
	thumb_func_end sub_8037E30

	thumb_func_start sub_8037EF0
sub_8037EF0: @ 8037EF0
	push {lr}
	ldr r0, _08037F20 @ =gReceivedRemoteLinkPlayers
	ldrb r0, [r0]
	cmp r0, 0
	bne _08037F1C
	movs r0, 0x5A
	bl m4aSongNumStop
	ldr r3, _08037F24 @ =gMain
	ldr r0, _08037F28 @ =0x0000043d
	adds r2, r3, r0
	ldrb r1, [r2]
	movs r0, 0x3
	negs r0, r0
	ands r0, r1
	strb r0, [r2]
	ldr r0, _08037F2C @ =gPreBattleCallback1
	ldr r0, [r0]
	str r0, [r3]
	ldr r0, _08037F30 @ =c2_8011A1C
	bl SetMainCallback2
_08037F1C:
	pop {r0}
	bx r0
	.align 2, 0
_08037F20: .4byte gReceivedRemoteLinkPlayers
_08037F24: .4byte gMain
_08037F28: .4byte 0x0000043d
_08037F2C: .4byte gPreBattleCallback1
_08037F30: .4byte c2_8011A1C
	thumb_func_end sub_8037EF0

	thumb_func_start sub_8037F34
sub_8037F34: @ 8037F34
	push {lr}
	ldr r0, _08037F64 @ =gPaletteFade
	ldrb r1, [r0, 0x7]
	movs r0, 0x80
	ands r0, r1
	cmp r0, 0
	bne _08037F9A
	ldr r0, _08037F68 @ =gBattleTypeFlags
	ldrh r1, [r0]
	movs r0, 0x2
	ands r0, r1
	cmp r0, 0
	beq _08037F78
	bl sub_800832C
	ldr r1, _08037F6C @ =gBattleBankFunc
	ldr r0, _08037F70 @ =gActiveBank
	ldrb r0, [r0]
	lsls r0, 2
	adds r0, r1
	ldr r1, _08037F74 @ =sub_8037EF0
	str r1, [r0]
	b _08037F9A
	.align 2, 0
_08037F64: .4byte gPaletteFade
_08037F68: .4byte gBattleTypeFlags
_08037F6C: .4byte gBattleBankFunc
_08037F70: .4byte gActiveBank
_08037F74: .4byte sub_8037EF0
_08037F78:
	movs r0, 0x5A
	bl m4aSongNumStop
	ldr r2, _08037FA0 @ =gMain
	ldr r0, _08037FA4 @ =0x0000043d
	adds r3, r2, r0
	ldrb r1, [r3]
	movs r0, 0x3
	negs r0, r0
	ands r0, r1
	strb r0, [r3]
	ldr r0, _08037FA8 @ =gPreBattleCallback1
	ldr r0, [r0]
	str r0, [r2]
	ldr r0, [r2, 0x8]
	bl SetMainCallback2
_08037F9A:
	pop {r0}
	bx r0
	.align 2, 0
_08037FA0: .4byte gMain
_08037FA4: .4byte 0x0000043d
_08037FA8: .4byte gPreBattleCallback1
	thumb_func_end sub_8037F34

	thumb_func_start sub_8037FAC
sub_8037FAC: @ 8037FAC
	push {lr}
	ldr r0, _08037FD0 @ =gActiveBank
	ldrb r1, [r0]
	lsls r0, r1, 1
	adds r0, r1
	lsls r0, 2
	ldr r1, _08037FD4 @ =0x02017810
	adds r0, r1
	ldrb r1, [r0]
	movs r0, 0x10
	ands r0, r1
	cmp r0, 0
	bne _08037FCA
	bl LinkOpponentBufferExecCompleted
_08037FCA:
	pop {r0}
	bx r0
	.align 2, 0
_08037FD0: .4byte gActiveBank
_08037FD4: .4byte 0x02017810
	thumb_func_end sub_8037FAC

	thumb_func_start sub_8037FD8
sub_8037FD8: @ 8037FD8
	push {lr}
	ldr r0, _08037FFC @ =gActiveBank
	ldrb r1, [r0]
	lsls r0, r1, 1
	adds r0, r1
	lsls r0, 2
	ldr r1, _08038000 @ =0x02017810
	adds r0, r1
	ldrb r1, [r0]
	movs r0, 0x20
	ands r0, r1
	cmp r0, 0
	bne _08037FF6
	bl LinkOpponentBufferExecCompleted
_08037FF6:
	pop {r0}
	bx r0
	.align 2, 0
_08037FFC: .4byte gActiveBank
_08038000: .4byte 0x02017810
	thumb_func_end sub_8037FD8

	thumb_func_start LinkOpponentBufferExecCompleted
LinkOpponentBufferExecCompleted: @ 8038004
	push {r4,lr}
	sub sp, 0x4
	ldr r1, _08038044 @ =gBattleBankFunc
	ldr r4, _08038048 @ =gActiveBank
	ldrb r0, [r4]
	lsls r0, 2
	adds r0, r1
	ldr r1, _0803804C @ =sub_803752C
	str r1, [r0]
	ldr r0, _08038050 @ =gBattleTypeFlags
	ldrh r1, [r0]
	movs r0, 0x2
	ands r0, r1
	cmp r0, 0
	beq _08038058
	bl GetMultiplayerId
	mov r1, sp
	strb r0, [r1]
	movs r0, 0x2
	movs r1, 0x4
	mov r2, sp
	bl PrepareBufferDataTransferLink
	ldr r1, _08038054 @ =gBattleBufferA
	ldrb r0, [r4]
	lsls r0, 9
	adds r0, r1
	movs r1, 0x38
	strb r1, [r0]
	b _0803806A
	.align 2, 0
_08038044: .4byte gBattleBankFunc
_08038048: .4byte gActiveBank
_0803804C: .4byte sub_803752C
_08038050: .4byte gBattleTypeFlags
_08038054: .4byte gBattleBufferA
_08038058:
	ldr r2, _08038074 @ =gBattleExecBuffer
	ldr r1, _08038078 @ =gBitTable
	ldrb r0, [r4]
	lsls r0, 2
	adds r0, r1
	ldr r1, [r0]
	ldr r0, [r2]
	bics r0, r1
	str r0, [r2]
_0803806A:
	add sp, 0x4
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08038074: .4byte gBattleExecBuffer
_08038078: .4byte gBitTable
	thumb_func_end LinkOpponentBufferExecCompleted

   	.align 2, 0 @ Don't pad with nop.
