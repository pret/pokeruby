	.include "constants/gba_constants.inc"
	.include "constants/species_constants.inc"
	.include "asm/macros.inc"

	.syntax unified

	.text




	thumb_func_start sub_807B184
sub_807B184: @ 807B184
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	sub sp, 0x4
	lsls r0, 24
	lsrs r7, r0, 24
	ldr r0, _0807B1B8 @ =gNoOfAllBanks
	ldrb r0, [r0]
	cmp r7, r0
	bcc _0807B19E
	b _0807B4D8
_0807B19E:
	lsls r2, r7, 2
	ldr r0, _0807B1BC @ =0x02017800
	adds r0, r2, r0
	ldrb r1, [r0]
	movs r0, 0x4
	ands r0, r1
	str r2, [sp]
	cmp r0, 0
	beq _0807B1C0
	adds r0, r7, 0
	bl sub_8077F7C
	b _0807B1C6
	.align 2, 0
_0807B1B8: .4byte gNoOfAllBanks
_0807B1BC: .4byte 0x02017800
_0807B1C0:
	adds r0, r7, 0
	bl sub_8077F68
_0807B1C6:
	lsls r0, 24
	lsrs r0, 24
	mov r8, r0
	adds r0, r7, 0
	bl GetBankSide
	lsls r0, 24
	cmp r0, 0
	bne _0807B1DA
	b _0807B2D8
_0807B1DA:
	ldr r1, _0807B2BC @ =gBattlePartyID
	lsls r0, r7, 1
	adds r6, r0, r1
	ldrh r0, [r6]
	movs r1, 0x64
	mov r10, r1
	mov r1, r10
	muls r1, r0
	adds r0, r1, 0
	ldr r1, _0807B2C0 @ =gEnemyParty
	mov r9, r1
	add r0, r9
	movs r1, 0x39
	bl GetMonData
	cmp r0, 0
	bne _0807B1FE
	b _0807B4D8
_0807B1FE:
	ldrh r0, [r6]
	mov r1, r10
	muls r1, r0
	adds r0, r1, 0
	add r0, r9
	movs r1, 0xB
	bl GetMonData
	adds r4, r0, 0
	lsls r4, 16
	lsrs r4, 16
	adds r0, r7, 0
	bl GetBankIdentity
	adds r1, r0, 0
	lsls r1, 24
	lsrs r1, 24
	adds r0, r4, 0
	bl GetMonSpriteTemplate_803C56C
	ldr r5, _0807B2C4 @ =gUnknown_02024E8C
	adds r0, r7, 0
	movs r1, 0x2
	bl sub_8077ABC
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	adds r0, r7, 0
	bl sub_8079E90
	adds r3, r0, 0
	lsls r3, 24
	lsrs r3, 24
	adds r0, r5, 0
	adds r1, r4, 0
	mov r2, r8
	bl CreateSprite
	ldr r4, _0807B2C8 @ =gObjectBankIDs
	adds r4, r7, r4
	strb r0, [r4]
	ldr r5, _0807B2CC @ =gSprites
	ldrb r0, [r4]
	lsls r1, r0, 4
	adds r1, r0
	lsls r1, 2
	adds r1, r5
	lsls r3, r7, 4
	ldrb r2, [r1, 0x5]
	movs r0, 0xF
	ands r0, r2
	orrs r0, r3
	strb r0, [r1, 0x5]
	ldrb r1, [r4]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r1, r5, 0
	adds r1, 0x1C
	adds r0, r1
	ldr r1, _0807B2D0 @ =SpriteCallbackDummy
	str r1, [r0]
	ldrb r1, [r4]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r5
	strh r7, [r0, 0x2E]
	ldrh r0, [r6]
	mov r1, r10
	muls r1, r0
	adds r0, r1, 0
	add r0, r9
	movs r1, 0xB
	bl GetMonData
	ldrb r2, [r4]
	lsls r1, r2, 4
	adds r1, r2
	lsls r1, 2
	adds r1, r5
	strh r0, [r1, 0x32]
	ldrb r1, [r4]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r5
	ldr r1, _0807B2D4 @ =gBattleMonForms
	adds r1, r7, r1
	ldrb r1, [r1]
	bl StartSpriteAnim
	b _0807B4AC
	.align 2, 0
_0807B2BC: .4byte gBattlePartyID
_0807B2C0: .4byte gEnemyParty
_0807B2C4: .4byte gUnknown_02024E8C
_0807B2C8: .4byte gObjectBankIDs
_0807B2CC: .4byte gSprites
_0807B2D0: .4byte SpriteCallbackDummy
_0807B2D4: .4byte gBattleMonForms
_0807B2D8:
	ldr r2, _0807B328 @ =gBattleTypeFlags
	ldrh r1, [r2]
	movs r0, 0x80
	ands r0, r1
	cmp r0, 0
	beq _0807B338
	cmp r7, 0
	bne _0807B338
	ldr r5, _0807B32C @ =gSaveBlock2
	ldrb r4, [r5, 0x8]
	movs r0, 0
	bl GetBankIdentity
	adds r1, r0, 0
	lsls r1, 24
	lsrs r1, 24
	adds r0, r4, 0
	bl GetMonSpriteTemplate_803C5A0
	ldr r6, _0807B330 @ =gUnknown_02024E8C
	ldr r1, _0807B334 @ =gTrainerBackPicCoords
	ldrb r0, [r5, 0x8]
	lsls r0, 2
	adds r0, r1
	ldrb r0, [r0]
	movs r4, 0x8
	subs r4, r0
	lsls r4, 18
	movs r0, 0xA0
	lsls r0, 15
	adds r4, r0
	asrs r4, 16
	movs r0, 0
	bl sub_8079E90
	adds r3, r0, 0
	lsls r3, 24
	lsrs r3, 24
	adds r0, r6, 0
	b _0807B37C
	.align 2, 0
_0807B328: .4byte gBattleTypeFlags
_0807B32C: .4byte gSaveBlock2
_0807B330: .4byte gUnknown_02024E8C
_0807B334: .4byte gTrainerBackPicCoords
_0807B338:
	ldrh r1, [r2]
	movs r0, 0x80
	lsls r0, 2
	ands r0, r1
	cmp r0, 0
	beq _0807B3D0
	cmp r7, 0
	bne _0807B3D0
	movs r0, 0
	bl GetBankIdentity
	adds r1, r0, 0
	lsls r1, 24
	lsrs r1, 24
	movs r0, 0x2
	bl GetMonSpriteTemplate_803C5A0
	ldr r5, _0807B3BC @ =gUnknown_02024E8C
	ldr r0, _0807B3C0 @ =gTrainerBackPicCoords
	ldrb r0, [r0, 0x8]
	movs r4, 0x8
	subs r4, r0
	lsls r4, 18
	movs r1, 0xA0
	lsls r1, 15
	adds r4, r1
	asrs r4, 16
	movs r0, 0
	bl sub_8079E90
	adds r3, r0, 0
	lsls r3, 24
	lsrs r3, 24
	adds r0, r5, 0
_0807B37C:
	movs r1, 0x50
	adds r2, r4, 0
	bl CreateSprite
	ldr r3, _0807B3C4 @ =gObjectBankIDs
	strb r0, [r3]
	ldr r4, _0807B3C8 @ =gSprites
	ldrb r0, [r3]
	lsls r1, r0, 4
	adds r1, r0
	lsls r1, 2
	adds r1, r4
	ldrb r2, [r1, 0x5]
	movs r0, 0xF
	ands r0, r2
	strb r0, [r1, 0x5]
	ldrb r1, [r3]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r1, r4, 0
	adds r1, 0x1C
	adds r0, r1
	ldr r1, _0807B3CC @ =SpriteCallbackDummy
	str r1, [r0]
	ldrb r1, [r3]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r4
	strh r7, [r0, 0x2E]
	b _0807B4AC
	.align 2, 0
_0807B3BC: .4byte gUnknown_02024E8C
_0807B3C0: .4byte gTrainerBackPicCoords
_0807B3C4: .4byte gObjectBankIDs
_0807B3C8: .4byte gSprites
_0807B3CC: .4byte SpriteCallbackDummy
_0807B3D0:
	ldr r1, _0807B4E8 @ =gBattlePartyID
	lsls r0, r7, 1
	adds r6, r0, r1
	ldrh r0, [r6]
	movs r1, 0x64
	mov r10, r1
	mov r1, r10
	muls r1, r0
	adds r0, r1, 0
	ldr r1, _0807B4EC @ =gPlayerParty
	mov r9, r1
	add r0, r9
	movs r1, 0x39
	bl GetMonData
	cmp r0, 0
	beq _0807B4D8
	ldrh r0, [r6]
	mov r1, r10
	muls r1, r0
	adds r0, r1, 0
	add r0, r9
	movs r1, 0xB
	bl GetMonData
	adds r4, r0, 0
	lsls r4, 16
	lsrs r4, 16
	adds r0, r7, 0
	bl GetBankIdentity
	adds r1, r0, 0
	lsls r1, 24
	lsrs r1, 24
	adds r0, r4, 0
	bl GetMonSpriteTemplate_803C56C
	ldr r5, _0807B4F0 @ =gUnknown_02024E8C
	adds r0, r7, 0
	movs r1, 0x2
	bl sub_8077ABC
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	adds r0, r7, 0
	bl sub_8079E90
	adds r3, r0, 0
	lsls r3, 24
	lsrs r3, 24
	adds r0, r5, 0
	adds r1, r4, 0
	mov r2, r8
	bl CreateSprite
	ldr r4, _0807B4F4 @ =gObjectBankIDs
	adds r4, r7, r4
	strb r0, [r4]
	ldr r5, _0807B4F8 @ =gSprites
	ldrb r0, [r4]
	lsls r1, r0, 4
	adds r1, r0
	lsls r1, 2
	adds r1, r5
	lsls r3, r7, 4
	ldrb r2, [r1, 0x5]
	movs r0, 0xF
	ands r0, r2
	orrs r0, r3
	strb r0, [r1, 0x5]
	ldrb r1, [r4]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r1, r5, 0
	adds r1, 0x1C
	adds r0, r1
	ldr r1, _0807B4FC @ =SpriteCallbackDummy
	str r1, [r0]
	ldrb r1, [r4]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r5
	strh r7, [r0, 0x2E]
	ldrh r0, [r6]
	mov r1, r10
	muls r1, r0
	adds r0, r1, 0
	add r0, r9
	movs r1, 0xB
	bl GetMonData
	ldrb r2, [r4]
	lsls r1, r2, 4
	adds r1, r2
	lsls r1, 2
	adds r1, r5
	strh r0, [r1, 0x32]
	ldrb r1, [r4]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r5
	ldr r1, _0807B500 @ =gBattleMonForms
	adds r1, r7, r1
	ldrb r1, [r1]
	bl StartSpriteAnim
_0807B4AC:
	ldr r1, _0807B4F8 @ =gSprites
	ldr r0, _0807B4F4 @ =gObjectBankIDs
	adds r0, r7, r0
	ldrb r0, [r0]
	lsls r2, r0, 4
	adds r2, r0
	lsls r2, 2
	adds r2, r1
	ldr r0, _0807B504 @ =0x02017800
	ldr r1, [sp]
	adds r0, r1, r0
	ldr r1, [r0]
	lsls r1, 31
	adds r2, 0x3E
	lsrs r1, 31
	lsls r1, 2
	ldrb r3, [r2]
	movs r0, 0x5
	negs r0, r0
	ands r0, r3
	orrs r0, r1
	strb r0, [r2]
_0807B4D8:
	add sp, 0x4
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_0807B4E8: .4byte gBattlePartyID
_0807B4EC: .4byte gPlayerParty
_0807B4F0: .4byte gUnknown_02024E8C
_0807B4F4: .4byte gObjectBankIDs
_0807B4F8: .4byte gSprites
_0807B4FC: .4byte SpriteCallbackDummy
_0807B500: .4byte gBattleMonForms
_0807B504: .4byte 0x02017800
	thumb_func_end sub_807B184

	thumb_func_start sub_807B508
sub_807B508: @ 807B508
	push {r4-r6,lr}
	lsls r0, 24
	lsrs r5, r0, 24
	ldr r0, _0807B530 @ =gNoOfAllBanks
	ldrb r0, [r0]
	cmp r5, r0
	bcc _0807B518
	b _0807B68A
_0807B518:
	ldr r2, _0807B534 @ =gBattleTypeFlags
	ldrh r1, [r2]
	movs r0, 0x80
	ands r0, r1
	cmp r0, 0
	beq _0807B538
	cmp r5, 0
	bne _0807B538
	bl battle_make_oam_safari_battle
	b _0807B550
	.align 2, 0
_0807B530: .4byte gNoOfAllBanks
_0807B534: .4byte gBattleTypeFlags
_0807B538:
	ldrh r1, [r2]
	movs r0, 0x80
	lsls r0, 2
	ands r0, r1
	cmp r0, 0
	beq _0807B54A
	cmp r5, 0
	bne _0807B54A
	b _0807B68A
_0807B54A:
	adds r0, r5, 0
	bl battle_make_oam_normal_battle
_0807B550:
	lsls r0, 24
	lsrs r6, r0, 24
	ldr r0, _0807B58C @ =gHealthboxIDs
	adds r4, r5, r0
	strb r6, [r4]
	adds r0, r5, 0
	bl sub_8043F44
	adds r0, r6, 0
	bl sub_8043DFC
	adds r0, r5, 0
	bl GetBankSide
	lsls r0, 24
	cmp r0, 0
	beq _0807B598
	ldrb r0, [r4]
	ldr r1, _0807B590 @ =gBattlePartyID
	lsls r4, r5, 1
	adds r1, r4, r1
	ldrh r2, [r1]
	movs r1, 0x64
	muls r1, r2
	ldr r2, _0807B594 @ =gEnemyParty
	adds r1, r2
	movs r2, 0
	bl sub_8045A5C
	b _0807B5E4
	.align 2, 0
_0807B58C: .4byte gHealthboxIDs
_0807B590: .4byte gBattlePartyID
_0807B594: .4byte gEnemyParty
_0807B598:
	ldr r0, _0807B5C0 @ =gBattleTypeFlags
	ldrh r1, [r0]
	movs r0, 0x80
	ands r0, r1
	cmp r0, 0
	beq _0807B5CC
	ldrb r0, [r4]
	ldr r1, _0807B5C4 @ =gBattlePartyID
	lsls r4, r5, 1
	adds r1, r4, r1
	ldrh r2, [r1]
	movs r1, 0x64
	muls r1, r2
	ldr r2, _0807B5C8 @ =gPlayerParty
	adds r1, r2
	movs r2, 0xA
	bl sub_8045A5C
	b _0807B5E4
	.align 2, 0
_0807B5C0: .4byte gBattleTypeFlags
_0807B5C4: .4byte gBattlePartyID
_0807B5C8: .4byte gPlayerParty
_0807B5CC:
	ldrb r0, [r4]
	ldr r1, _0807B610 @ =gBattlePartyID
	lsls r4, r5, 1
	adds r1, r4, r1
	ldrh r2, [r1]
	movs r1, 0x64
	muls r1, r2
	ldr r2, _0807B614 @ =gPlayerParty
	adds r1, r2
	movs r2, 0
	bl sub_8045A5C
_0807B5E4:
	adds r0, r5, 0
	bl GetBankIdentity
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x3
	beq _0807B600
	adds r0, r5, 0
	bl GetBankIdentity
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x2
	bne _0807B61C
_0807B600:
	ldr r0, _0807B618 @ =gHealthboxIDs
	adds r0, r5, r0
	ldrb r0, [r0]
	movs r1, 0x1
	bl nullsub_11
	b _0807B628
	.align 2, 0
_0807B610: .4byte gBattlePartyID
_0807B614: .4byte gPlayerParty
_0807B618: .4byte gHealthboxIDs
_0807B61C:
	ldr r0, _0807B654 @ =gHealthboxIDs
	adds r0, r5, r0
	ldrb r0, [r0]
	movs r1, 0
	bl nullsub_11
_0807B628:
	adds r0, r5, 0
	bl GetBankSide
	lsls r0, 24
	cmp r0, 0
	beq _0807B660
	ldr r0, _0807B658 @ =gBattlePartyID
	adds r0, r4, r0
	ldrh r1, [r0]
	movs r0, 0x64
	muls r0, r1
	ldr r1, _0807B65C @ =gEnemyParty
	adds r0, r1
	movs r1, 0x39
	bl GetMonData
	cmp r0, 0
	bne _0807B68A
	adds r0, r6, 0
	bl sub_8043DB0
	b _0807B68A
	.align 2, 0
_0807B654: .4byte gHealthboxIDs
_0807B658: .4byte gBattlePartyID
_0807B65C: .4byte gEnemyParty
_0807B660:
	ldr r0, _0807B690 @ =gBattleTypeFlags
	ldrh r1, [r0]
	movs r0, 0x80
	ands r0, r1
	cmp r0, 0
	bne _0807B68A
	ldr r0, _0807B694 @ =gBattlePartyID
	adds r0, r4, r0
	ldrh r1, [r0]
	movs r0, 0x64
	muls r0, r1
	ldr r1, _0807B698 @ =gPlayerParty
	adds r0, r1
	movs r1, 0x39
	bl GetMonData
	cmp r0, 0
	bne _0807B68A
	adds r0, r6, 0
	bl sub_8043DB0
_0807B68A:
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_0807B690: .4byte gBattleTypeFlags
_0807B694: .4byte gBattlePartyID
_0807B698: .4byte gPlayerParty
	thumb_func_end sub_807B508

	.align 2, 0 @ Don't pad with nop.
