	.include "constants/gba_constants.inc"
	.include "constants/species_constants.inc"
	.include "asm/macros.inc"

	.syntax unified

	.text

	@ psychic

	thumb_func_start sub_80DB74C
sub_80DB74C: @ 80DB74C
	push {r4-r7,lr}
	adds r6, r0, 0
	ldr r0, _080DB804 @ =gBattleAnimBankAttacker
	ldrb r0, [r0]
	bl GetBankSide
	lsls r0, 24
	cmp r0, 0
	beq _080DB768
	bl NotInBattle
	lsls r0, 24
	cmp r0, 0
	beq _080DB77E
_080DB768:
	ldrb r1, [r6, 0x5]
	movs r0, 0xD
	negs r0, r0
	ands r0, r1
	movs r1, 0x8
	orrs r0, r1
	strb r0, [r6, 0x5]
	adds r1, r6, 0
	adds r1, 0x43
	movs r0, 0xC8
	strb r0, [r1]
_080DB77E:
	bl NotInBattle
	lsls r0, 24
	cmp r0, 0
	bne _080DB7DA
	movs r0, 0x1
	bl GetBankByPlayerAI
	lsls r0, 24
	lsrs r4, r0, 24
	adds r7, r4, 0
	adds r0, r4, 0
	bl GetBankIdentity_permutated
	lsls r0, 24
	lsrs r0, 24
	movs r1, 0x1
	eors r0, r1
	negs r1, r0
	orrs r1, r0
	lsrs r5, r1, 31
	adds r0, r4, 0
	bl IsAnimBankSpriteVisible
	lsls r0, 24
	cmp r0, 0
	beq _080DB7BC
	adds r0, r4, 0
	adds r1, r5, 0
	bl sub_8076034
_080DB7BC:
	movs r0, 0x2
	adds r4, r0, 0
	eors r4, r7
	adds r0, r4, 0
	bl IsAnimBankSpriteVisible
	lsls r0, 24
	cmp r0, 0
	beq _080DB7DA
	movs r0, 0x1
	eors r5, r0
	adds r0, r4, 0
	adds r1, r5, 0
	bl sub_8076034
_080DB7DA:
	bl NotInBattle
	lsls r0, 24
	cmp r0, 0
	bne _080DB810
	bl IsDoubleBattle
	lsls r0, 24
	cmp r0, 0
	beq _080DB810
	ldr r0, _080DB804 @ =gBattleAnimBankAttacker
	ldrb r0, [r0]
	bl GetBankSide
	lsls r0, 24
	cmp r0, 0
	bne _080DB808
	movs r0, 0x48
	strh r0, [r6, 0x20]
	movs r0, 0x50
	b _080DB84A
	.align 2, 0
_080DB804: .4byte gBattleAnimBankAttacker
_080DB808:
	movs r0, 0xB0
	strh r0, [r6, 0x20]
	movs r0, 0x28
	b _080DB84A
_080DB810:
	ldr r5, _080DB880 @ =gBattleAnimBankAttacker
	ldrb r0, [r5]
	bl GetBankSide
	lsls r0, 24
	cmp r0, 0
	beq _080DB826
	ldr r1, _080DB884 @ =gBattleAnimArgs
	ldrh r0, [r1]
	negs r0, r0
	strh r0, [r1]
_080DB826:
	ldrb r0, [r5]
	movs r1, 0
	bl sub_8077ABC
	lsls r0, 24
	ldr r4, _080DB884 @ =gBattleAnimArgs
	lsrs r0, 24
	ldrh r1, [r4]
	adds r0, r1
	strh r0, [r6, 0x20]
	ldrb r0, [r5]
	movs r1, 0x1
	bl sub_8077ABC
	lsls r0, 24
	lsrs r0, 24
	ldrh r4, [r4, 0x2]
	adds r0, r4
_080DB84A:
	strh r0, [r6, 0x22]
	bl NotInBattle
	lsls r0, 24
	cmp r0, 0
	beq _080DB85C
	ldrh r0, [r6, 0x22]
	adds r0, 0x9
	strh r0, [r6, 0x22]
_080DB85C:
	ldr r0, _080DB884 @ =gBattleAnimArgs
	ldrh r0, [r0, 0x4]
	bl IndexOfSpritePaletteTag
	lsls r0, 24
	lsrs r0, 20
	movs r1, 0x80
	lsls r1, 1
	adds r0, r1
	strh r0, [r6, 0x2E]
	ldr r1, _080DB888 @ =sub_80DB88C
	str r1, [r6, 0x1C]
	adds r0, r6, 0
	bl _call_via_r1
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080DB880: .4byte gBattleAnimBankAttacker
_080DB884: .4byte gBattleAnimArgs
_080DB888: .4byte sub_80DB88C
	thumb_func_end sub_80DB74C

	thumb_func_start sub_80DB88C
sub_80DB88C: @ 80DB88C
	push {lr}
	adds r3, r0, 0
	ldr r2, _080DB8B0 @ =REG_BLDALPHA
	ldrh r1, [r3, 0x34]
	movs r0, 0x10
	subs r0, r1
	lsls r0, 8
	orrs r0, r1
	strh r0, [r2]
	ldrh r1, [r3, 0x34]
	movs r2, 0x34
	ldrsh r0, [r3, r2]
	cmp r0, 0xD
	bne _080DB8B8
	ldr r0, _080DB8B4 @ =sub_80DB8C0
	str r0, [r3, 0x1C]
	b _080DB8BC
	.align 2, 0
_080DB8B0: .4byte REG_BLDALPHA
_080DB8B4: .4byte sub_80DB8C0
_080DB8B8:
	adds r0, r1, 0x1
	strh r0, [r3, 0x34]
_080DB8BC:
	pop {r0}
	bx r0
	thumb_func_end sub_80DB88C

	thumb_func_start sub_80DB8C0
sub_80DB8C0: @ 80DB8C0
	push {r4-r7,lr}
	adds r3, r0, 0
	ldrh r0, [r3, 0x30]
	adds r0, 0x1
	strh r0, [r3, 0x30]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x2
	bne _080DB91E
	movs r0, 0
	strh r0, [r3, 0x30]
	ldrh r4, [r3, 0x2E]
	ldr r1, _080DB924 @ =gPlttBufferFaded
	adds r0, r4, 0
	adds r0, 0x8
	lsls r0, 1
	adds r0, r1
	ldrh r7, [r0]
	movs r5, 0x8
	adds r6, r1, 0
	adds r1, r4, 0x7
	lsls r0, r4, 1
	adds r0, r6
	adds r2, r0, 0
	adds r2, 0x10
	lsls r1, 1
	adds r1, r6
_080DB8F6:
	ldrh r0, [r1]
	strh r0, [r2]
	subs r1, 0x2
	subs r2, 0x2
	subs r5, 0x1
	cmp r5, 0
	bgt _080DB8F6
	adds r0, r4, 0x1
	lsls r0, 1
	adds r0, r6
	strh r7, [r0]
	ldrh r0, [r3, 0x32]
	adds r0, 0x1
	strh r0, [r3, 0x32]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x10
	bne _080DB91E
	ldr r0, _080DB928 @ =sub_80DB92C
	str r0, [r3, 0x1C]
_080DB91E:
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080DB924: .4byte gPlttBufferFaded
_080DB928: .4byte sub_80DB92C
	thumb_func_end sub_80DB8C0

	thumb_func_start sub_80DB92C
sub_80DB92C: @ 80DB92C
	push {r4-r6,lr}
	adds r5, r0, 0
	ldr r2, _080DB9D4 @ =REG_BLDALPHA
	ldrh r1, [r5, 0x34]
	movs r0, 0x10
	subs r0, r1
	lsls r0, 8
	orrs r0, r1
	strh r0, [r2]
	ldrh r0, [r5, 0x34]
	subs r0, 0x1
	strh r0, [r5, 0x34]
	lsls r0, 16
	asrs r0, 16
	movs r1, 0x1
	negs r1, r1
	cmp r0, r1
	bne _080DB9CC
	bl NotInBattle
	lsls r0, 24
	cmp r0, 0
	bne _080DB9BC
	movs r0, 0x1
	bl GetBankByPlayerAI
	lsls r0, 24
	lsrs r4, r0, 24
	adds r6, r4, 0
	adds r0, r4, 0
	bl IsAnimBankSpriteVisible
	lsls r0, 24
	cmp r0, 0
	beq _080DB98E
	ldr r2, _080DB9D8 @ =gSprites
	ldr r0, _080DB9DC @ =gObjectBankIDs
	adds r0, r4, r0
	ldrb r1, [r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r2
	adds r0, 0x3E
	ldrb r2, [r0]
	movs r1, 0x5
	negs r1, r1
	ands r1, r2
	strb r1, [r0]
_080DB98E:
	movs r0, 0x2
	adds r4, r0, 0
	eors r4, r6
	adds r0, r4, 0
	bl IsAnimBankSpriteVisible
	lsls r0, 24
	cmp r0, 0
	beq _080DB9BC
	ldr r2, _080DB9D8 @ =gSprites
	ldr r0, _080DB9DC @ =gObjectBankIDs
	adds r0, r4, r0
	ldrb r1, [r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r2
	adds r0, 0x3E
	ldrb r2, [r0]
	movs r1, 0x5
	negs r1, r1
	ands r1, r2
	strb r1, [r0]
_080DB9BC:
	adds r2, r5, 0
	adds r2, 0x3E
	ldrb r0, [r2]
	movs r1, 0x4
	orrs r0, r1
	strb r0, [r2]
	ldr r0, _080DB9E0 @ =sub_80DB9E4
	str r0, [r5, 0x1C]
_080DB9CC:
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_080DB9D4: .4byte REG_BLDALPHA
_080DB9D8: .4byte gSprites
_080DB9DC: .4byte gObjectBankIDs
_080DB9E0: .4byte sub_80DB9E4
	thumb_func_end sub_80DB92C

	thumb_func_start sub_80DB9E4
sub_80DB9E4: @ 80DB9E4
	push {r4-r6,lr}
	adds r6, r0, 0
	bl NotInBattle
	lsls r0, 24
	cmp r0, 0
	bne _080DBA3C
	movs r0, 0x1
	bl GetBankByPlayerAI
	lsls r0, 24
	lsrs r0, 24
	adds r4, r0, 0
	bl GetBankIdentity_permutated
	lsls r0, 24
	lsrs r0, 24
	movs r1, 0x1
	eors r0, r1
	negs r1, r0
	orrs r1, r0
	lsrs r5, r1, 31
	adds r0, r4, 0
	bl IsAnimBankSpriteVisible
	lsls r0, 24
	cmp r0, 0
	beq _080DBA22
	adds r0, r5, 0
	bl sub_8076464
_080DBA22:
	movs r0, 0x2
	eors r4, r0
	adds r0, r4, 0
	bl IsAnimBankSpriteVisible
	lsls r0, 24
	cmp r0, 0
	beq _080DBA3C
	movs r0, 0x1
	eors r5, r0
	adds r0, r5, 0
	bl sub_8076464
_080DBA3C:
	ldr r0, _080DBA48 @ =move_anim_8072740
	str r0, [r6, 0x1C]
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_080DBA48: .4byte move_anim_8072740
	thumb_func_end sub_80DB9E4

	thumb_func_start sub_80DBA4C
sub_80DBA4C: @ 80DBA4C
	push {r4-r6,lr}
	adds r4, r0, 0
	movs r1, 0x2E
	ldrsh r0, [r4, r1]
	cmp r0, 0
	bne _080DBAD8
	ldr r5, _080DBA98 @ =gBattleAnimArgs
	movs r1, 0x6
	ldrsh r0, [r5, r1]
	movs r6, 0
	cmp r0, 0
	bne _080DBA66
	movs r6, 0x1
_080DBA66:
	bl NotInBattle
	lsls r0, 24
	cmp r0, 0
	bne _080DBAAE
	bl IsDoubleBattle
	lsls r0, 24
	cmp r0, 0
	beq _080DBAAE
	ldr r0, _080DBA9C @ =gBattleAnimBankAttacker
	ldrb r0, [r0]
	bl GetBankSide
	lsls r0, 24
	cmp r0, 0
	bne _080DBAA0
	ldrh r0, [r5]
	movs r1, 0x48
	subs r1, r0
	strh r1, [r4, 0x20]
	ldrh r0, [r5, 0x2]
	adds r0, 0x50
	strh r0, [r4, 0x22]
	b _080DBAD0
	.align 2, 0
_080DBA98: .4byte gBattleAnimArgs
_080DBA9C: .4byte gBattleAnimBankAttacker
_080DBAA0:
	ldrh r0, [r5]
	adds r0, 0xB0
	strh r0, [r4, 0x20]
	ldrh r0, [r5, 0x2]
	adds r0, 0x28
	strh r0, [r4, 0x22]
	b _080DBAD0
_080DBAAE:
	ldr r0, _080DBAC4 @ =gBattleAnimArgs
	movs r1, 0x4
	ldrsh r0, [r0, r1]
	cmp r0, 0
	bne _080DBAC8
	adds r0, r4, 0
	adds r1, r6, 0
	bl sub_80787B0
	b _080DBAD0
	.align 2, 0
_080DBAC4: .4byte gBattleAnimArgs
_080DBAC8:
	adds r0, r4, 0
	adds r1, r6, 0
	bl sub_8078764
_080DBAD0:
	ldrh r0, [r4, 0x2E]
	adds r0, 0x1
	strh r0, [r4, 0x2E]
	b _080DBAEC
_080DBAD8:
	adds r0, r4, 0
	adds r0, 0x3F
	ldrb r1, [r0]
	movs r0, 0x30
	ands r0, r1
	cmp r0, 0
	beq _080DBAEC
	adds r0, r4, 0
	bl move_anim_8074EE0
_080DBAEC:
	pop {r4-r6}
	pop {r0}
	bx r0
	thumb_func_end sub_80DBA4C

	thumb_func_start sub_80DBAF4
sub_80DBAF4: @ 80DBAF4
	push {r4,r5,lr}
	adds r5, r0, 0
	ldr r4, _080DBB3C @ =gBattleAnimBankAttacker
	ldrb r0, [r4]
	movs r1, 0x2
	bl sub_8077ABC
	lsls r0, 24
	lsrs r0, 24
	strh r0, [r5, 0x20]
	ldrb r0, [r4]
	movs r1, 0x3
	bl sub_8077ABC
	lsls r0, 24
	lsrs r0, 24
	strh r0, [r5, 0x22]
	ldrb r0, [r4]
	bl GetBankSide
	lsls r0, 24
	cmp r0, 0
	beq _080DBB44
	adds r0, r5, 0
	movs r1, 0x1
	bl StartSpriteAnim
	ldrh r0, [r5, 0x20]
	subs r0, 0x28
	strh r0, [r5, 0x20]
	ldrh r0, [r5, 0x22]
	adds r0, 0xA
	strh r0, [r5, 0x22]
	ldr r0, _080DBB40 @ =0x0000ffff
	b _080DBB52
	.align 2, 0
_080DBB3C: .4byte gBattleAnimBankAttacker
_080DBB40: .4byte 0x0000ffff
_080DBB44:
	ldrh r0, [r5, 0x20]
	adds r0, 0x28
	strh r0, [r5, 0x20]
	ldrh r0, [r5, 0x22]
	subs r0, 0xA
	strh r0, [r5, 0x22]
	movs r0, 0x1
_080DBB52:
	strh r0, [r5, 0x30]
	ldr r1, _080DBB68 @ =move_anim_8072740
	adds r0, r5, 0
	bl StoreSpriteCallbackInData
	ldr r0, _080DBB6C @ =sub_8078600
	str r0, [r5, 0x1C]
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080DBB68: .4byte move_anim_8072740
_080DBB6C: .4byte sub_8078600
	thumb_func_end sub_80DBAF4

	thumb_func_start sub_80DBB70
sub_80DBB70: @ 80DBB70
	push {r4-r7,lr}
	adds r5, r0, 0
	ldr r6, _080DBBF4 @ =gBattleAnimBankAttacker
	ldrb r0, [r6]
	movs r1, 0x1
	bl sub_807A100
	lsls r0, 16
	asrs r1, r0, 16
	lsrs r0, 31
	adds r1, r0
	lsls r1, 15
	lsrs r4, r1, 16
	ldrb r0, [r6]
	movs r1, 0
	bl sub_807A100
	lsls r0, 16
	asrs r1, r0, 16
	lsrs r0, 31
	adds r1, r0
	asrs r1, 1
	negs r1, r1
	lsls r1, 16
	lsrs r7, r1, 16
	ldrb r0, [r6]
	bl GetBankSide
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _080DBBB6
	lsls r0, r4, 16
	negs r0, r0
	lsrs r4, r0, 16
_080DBBB6:
	ldrb r0, [r6]
	movs r1, 0x2
	bl sub_8077ABC
	lsls r0, 24
	lsrs r0, 24
	adds r0, r4
	strh r0, [r5, 0x20]
	ldrb r0, [r6]
	movs r1, 0x3
	bl sub_8077ABC
	lsls r0, 24
	lsrs r0, 24
	adds r0, r7
	strh r0, [r5, 0x22]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0xF
	bgt _080DBBE2
	movs r0, 0x10
	strh r0, [r5, 0x22]
_080DBBE2:
	ldr r1, _080DBBF8 @ =sub_80DBC00
	adds r0, r5, 0
	bl StoreSpriteCallbackInData
	ldr r0, _080DBBFC @ =sub_8078600
	str r0, [r5, 0x1C]
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080DBBF4: .4byte gBattleAnimBankAttacker
_080DBBF8: .4byte sub_80DBC00
_080DBBFC: .4byte sub_8078600
	thumb_func_end sub_80DBB70

	thumb_func_start sub_80DBC00
sub_80DBC00: @ 80DBC00
	push {r4,lr}
	adds r4, r0, 0
	ldrb r1, [r4, 0x1]
	movs r0, 0x4
	negs r0, r0
	ands r0, r1
	movs r1, 0x1
	orrs r0, r1
	strb r0, [r4, 0x1]
	ldr r0, _080DBC2C @ =gUnknown_083DA888
	str r0, [r4, 0x10]
	movs r0, 0
	strh r0, [r4, 0x2E]
	adds r0, r4, 0
	bl InitSpriteAffineAnim
	ldr r0, _080DBC30 @ =sub_80DBC34
	str r0, [r4, 0x1C]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080DBC2C: .4byte gUnknown_083DA888
_080DBC30: .4byte sub_80DBC34
	thumb_func_end sub_80DBC00

	thumb_func_start sub_80DBC34
sub_80DBC34: @ 80DBC34
	push {r4,lr}
	adds r4, r0, 0
	movs r1, 0x2E
	ldrsh r0, [r4, r1]
	cmp r0, 0
	beq _080DBC46
	cmp r0, 0x1
	beq _080DBC74
	b _080DBC8C
_080DBC46:
	adds r0, r4, 0
	adds r0, 0x3F
	ldrb r1, [r0]
	movs r0, 0x20
	ands r0, r1
	cmp r0, 0
	beq _080DBC8C
	ldrb r0, [r4, 0x3]
	lsls r0, 26
	lsrs r0, 27
	bl FreeOamMatrix
	ldrb r1, [r4, 0x1]
	movs r0, 0x4
	negs r0, r0
	ands r0, r1
	strb r0, [r4, 0x1]
	movs r0, 0x12
	strh r0, [r4, 0x30]
	ldrh r0, [r4, 0x2E]
	adds r0, 0x1
	strh r0, [r4, 0x2E]
	b _080DBC8C
_080DBC74:
	ldrh r0, [r4, 0x30]
	subs r0, 0x1
	strh r0, [r4, 0x30]
	lsls r0, 16
	asrs r0, 16
	movs r1, 0x1
	negs r1, r1
	cmp r0, r1
	bne _080DBC8C
	adds r0, r4, 0
	bl move_anim_8072740
_080DBC8C:
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end sub_80DBC34

	thumb_func_start sub_80DBC94
sub_80DBC94: @ 80DBC94
	push {r4,lr}
	lsls r0, 24
	lsrs r0, 24
	lsls r4, r0, 2
	adds r4, r0
	lsls r4, 3
	ldr r0, _080DBCC4 @ =gTasks
	adds r4, r0
	movs r0, 0
	bl GetAnimBankSpriteId
	adds r1, r0, 0
	lsls r1, 24
	lsrs r1, 24
	strh r1, [r4, 0x8]
	ldr r2, _080DBCC8 @ =gUnknown_083DA8A4
	adds r0, r4, 0
	bl sub_80798F4
	ldr r0, _080DBCCC @ =sub_80DBCD0
	str r0, [r4]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080DBCC4: .4byte gTasks
_080DBCC8: .4byte gUnknown_083DA8A4
_080DBCCC: .4byte sub_80DBCD0
	thumb_func_end sub_80DBC94

	thumb_func_start sub_80DBCD0
sub_80DBCD0: @ 80DBCD0
	push {r4,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	lsls r0, r4, 2
	adds r0, r4
	lsls r0, 3
	ldr r1, _080DBCF8 @ =gTasks
	adds r0, r1
	bl sub_807992C
	lsls r0, 24
	cmp r0, 0
	bne _080DBCF0
	adds r0, r4, 0
	bl DestroyAnimVisualTask
_080DBCF0:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080DBCF8: .4byte gTasks
	thumb_func_end sub_80DBCD0

	thumb_func_start sub_80DBCFC
sub_80DBCFC: @ 80DBCFC
	push {r4,lr}
	lsls r0, 24
	lsrs r0, 24
	lsls r1, r0, 2
	adds r1, r0
	lsls r1, 3
	ldr r0, _080DBD48 @ =gTasks
	adds r4, r1, r0
	movs r0, 0
	bl GetAnimBankSpriteId
	lsls r0, 24
	lsrs r0, 24
	movs r1, 0
	strh r0, [r4, 0x8]
	strh r1, [r4, 0xA]
	strh r1, [r4, 0xC]
	ldr r0, _080DBD4C @ =gBattleAnimBankAttacker
	ldrb r0, [r0]
	bl GetBankSide
	lsls r0, 24
	movs r1, 0x8
	cmp r0, 0
	beq _080DBD30
	movs r1, 0x4
_080DBD30:
	strh r1, [r4, 0xE]
	ldrb r1, [r4, 0x8]
	ldr r2, _080DBD50 @ =gUnknown_083DA8C4
	adds r0, r4, 0
	bl sub_80798F4
	ldr r0, _080DBD54 @ =sub_80DBD58
	str r0, [r4]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080DBD48: .4byte gTasks
_080DBD4C: .4byte gBattleAnimBankAttacker
_080DBD50: .4byte gUnknown_083DA8C4
_080DBD54: .4byte sub_80DBD58
	thumb_func_end sub_80DBCFC

	thumb_func_start sub_80DBD58
sub_80DBD58: @ 80DBD58
	push {r4,r5,lr}
	lsls r0, 24
	lsrs r5, r0, 24
	lsls r0, r5, 2
	adds r0, r5
	lsls r0, 3
	ldr r1, _080DBD78 @ =gTasks
	adds r4, r0, r1
	movs r1, 0xA
	ldrsh r0, [r4, r1]
	cmp r0, 0
	beq _080DBD7C
	cmp r0, 0x1
	beq _080DBD98
	b _080DBDF6
	.align 2, 0
_080DBD78: .4byte gTasks
_080DBD7C:
	adds r0, r4, 0
	bl sub_807992C
	ldrh r0, [r4, 0xC]
	adds r0, 0x1
	strh r0, [r4, 0xC]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x13
	ble _080DBDF6
	ldrh r0, [r4, 0xA]
	adds r0, 0x1
	strh r0, [r4, 0xA]
	b _080DBDF6
_080DBD98:
	movs r1, 0xE
	ldrsh r0, [r4, r1]
	cmp r0, 0
	beq _080DBDC0
	ldr r2, _080DBDBC @ =gSprites
	movs r0, 0x8
	ldrsh r1, [r4, r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r2
	ldrh r1, [r0, 0x26]
	subs r1, 0x8
	strh r1, [r0, 0x26]
	ldrh r0, [r4, 0xE]
	subs r0, 0x1
	strh r0, [r4, 0xE]
	b _080DBDF6
	.align 2, 0
_080DBDBC: .4byte gSprites
_080DBDC0:
	ldr r3, _080DBDFC @ =gSprites
	movs r0, 0x8
	ldrsh r1, [r4, r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r3
	adds r0, 0x3E
	ldrb r1, [r0]
	movs r2, 0x4
	orrs r1, r2
	strb r1, [r0]
	movs r0, 0x8
	ldrsh r1, [r4, r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r3
	movs r1, 0x88
	lsls r1, 1
	strh r1, [r0, 0x20]
	ldrb r0, [r4, 0x8]
	bl sub_8078F40
	adds r0, r5, 0
	bl DestroyAnimVisualTask
_080DBDF6:
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080DBDFC: .4byte gSprites
	thumb_func_end sub_80DBD58

	thumb_func_start sub_80DBE00
sub_80DBE00: @ 80DBE00
	push {r4-r7,lr}
	lsls r0, 24
	lsrs r0, 24
	lsls r1, r0, 2
	adds r1, r0
	lsls r1, 3
	ldr r0, _080DBE84 @ =gTasks
	adds r5, r1, r0
	movs r0, 0
	movs r7, 0x10
	strh r7, [r5, 0xE]
	strh r0, [r5, 0x10]
	ldr r4, _080DBE88 @ =gBattleAnimBankAttacker
	ldrb r0, [r4]
	movs r1, 0x2
	bl sub_8077ABC
	lsls r0, 24
	lsrs r0, 24
	strh r0, [r5, 0x22]
	ldrb r0, [r4]
	movs r1, 0x3
	bl sub_8077ABC
	lsls r0, 24
	lsrs r0, 24
	strh r0, [r5, 0x24]
	ldrb r0, [r4]
	movs r1, 0x1
	bl sub_807A100
	lsls r0, 16
	asrs r0, 16
	movs r1, 0x3
	bl __divsi3
	lsls r0, 16
	lsrs r6, r0, 16
	ldrb r0, [r4]
	movs r1, 0
	bl sub_807A100
	lsls r0, 16
	asrs r0, 16
	movs r1, 0x3
	bl __divsi3
	lsls r0, 16
	lsrs r0, 16
	adds r1, r0, 0
	cmp r0, r6
	bcs _080DBE6A
	adds r1, r6, 0
_080DBE6A:
	strh r1, [r5, 0x20]
	ldr r1, _080DBE8C @ =REG_BLDCNT
	movs r2, 0xFD
	lsls r2, 6
	adds r0, r2, 0
	strh r0, [r1]
	ldr r0, _080DBE90 @ =REG_BLDALPHA
	strh r7, [r0]
	ldr r0, _080DBE94 @ =sub_80DBE98
	str r0, [r5]
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080DBE84: .4byte gTasks
_080DBE88: .4byte gBattleAnimBankAttacker
_080DBE8C: .4byte REG_BLDCNT
_080DBE90: .4byte REG_BLDALPHA
_080DBE94: .4byte sub_80DBE98
	thumb_func_end sub_80DBE00

	thumb_func_start sub_80DBE98
sub_80DBE98: @ 80DBE98
	push {r4-r6,lr}
	lsls r0, 24
	lsrs r2, r0, 24
	lsls r0, r2, 2
	adds r0, r2
	lsls r0, 3
	ldr r1, _080DBEBC @ =gTasks
	adds r4, r0, r1
	movs r0, 0x8
	ldrsh r1, [r4, r0]
	cmp r1, 0x1
	beq _080DBF98
	cmp r1, 0x1
	bgt _080DBEC0
	cmp r1, 0
	beq _080DBECE
	b _080DC014
	.align 2, 0
_080DBEBC: .4byte gTasks
_080DBEC0:
	cmp r1, 0x2
	bne _080DBEC6
	b _080DBFF4
_080DBEC6:
	cmp r1, 0x3
	bne _080DBECC
	b _080DC004
_080DBECC:
	b _080DC014
_080DBECE:
	ldrh r0, [r4, 0xA]
	adds r0, 0x1
	strh r0, [r4, 0xA]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x8
	bgt _080DBEDE
	b _080DC014
_080DBEDE:
	strh r1, [r4, 0xA]
	ldr r0, _080DBF1C @ =gSpriteTemplate_83DA8DC
	movs r2, 0x22
	ldrsh r1, [r4, r2]
	movs r3, 0x24
	ldrsh r2, [r4, r3]
	movs r3, 0
	bl CreateSprite
	lsls r0, 24
	lsrs r2, r0, 24
	movs r0, 0xC
	ldrsh r1, [r4, r0]
	adds r1, 0x8
	lsls r1, 1
	adds r0, r4, 0
	adds r0, 0x8
	adds r0, r1
	strh r2, [r0]
	cmp r2, 0x40
	beq _080DBF82
	movs r1, 0xC
	ldrsh r0, [r4, r1]
	cmp r0, 0x1
	beq _080DBF3C
	cmp r0, 0x1
	bgt _080DBF20
	cmp r0, 0
	beq _080DBF2A
	b _080DBF82
	.align 2, 0
_080DBF1C: .4byte gSpriteTemplate_83DA8DC
_080DBF20:
	cmp r0, 0x2
	beq _080DBF54
	cmp r0, 0x3
	beq _080DBF6C
	b _080DBF82
_080DBF2A:
	ldr r0, _080DBF38 @ =gSprites
	lsls r1, r2, 4
	adds r1, r2
	lsls r1, 2
	adds r1, r0
	ldrh r0, [r4, 0x20]
	b _080DBF7A
	.align 2, 0
_080DBF38: .4byte gSprites
_080DBF3C:
	ldr r0, _080DBF50 @ =gSprites
	lsls r1, r2, 4
	adds r1, r2
	lsls r1, 2
	adds r1, r0
	ldrh r0, [r4, 0x20]
	negs r0, r0
	strh r0, [r1, 0x24]
	ldrh r0, [r4, 0x20]
	b _080DBF80
	.align 2, 0
_080DBF50: .4byte gSprites
_080DBF54:
	ldr r1, _080DBF68 @ =gSprites
	lsls r0, r2, 4
	adds r0, r2
	lsls r0, 2
	adds r0, r1
	ldrh r1, [r4, 0x20]
	strh r1, [r0, 0x24]
	ldrh r1, [r4, 0x20]
	strh r1, [r0, 0x26]
	b _080DBF82
	.align 2, 0
_080DBF68: .4byte gSprites
_080DBF6C:
	ldr r0, _080DBF94 @ =gSprites
	lsls r1, r2, 4
	adds r1, r2
	lsls r1, 2
	adds r1, r0
	ldrh r0, [r4, 0x20]
	negs r0, r0
_080DBF7A:
	strh r0, [r1, 0x24]
	ldrh r0, [r4, 0x20]
	negs r0, r0
_080DBF80:
	strh r0, [r1, 0x26]
_080DBF82:
	ldrh r0, [r4, 0xC]
	adds r0, 0x1
	strh r0, [r4, 0xC]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x5
	bne _080DC014
	b _080DBFF4
	.align 2, 0
_080DBF94: .4byte gSprites
_080DBF98:
	ldrh r0, [r4, 0xA]
	ands r1, r0
	cmp r1, 0
	beq _080DBFA8
	ldrh r0, [r4, 0xE]
	subs r0, 0x1
	strh r0, [r4, 0xE]
	b _080DBFAE
_080DBFA8:
	ldrh r0, [r4, 0x10]
	adds r0, 0x1
	strh r0, [r4, 0x10]
_080DBFAE:
	ldr r2, _080DBFFC @ =REG_BLDALPHA
	ldrh r0, [r4, 0x10]
	lsls r0, 8
	ldrh r1, [r4, 0xE]
	orrs r0, r1
	strh r0, [r2]
	ldrh r0, [r4, 0xA]
	adds r0, 0x1
	strh r0, [r4, 0xA]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x20
	bne _080DC014
	movs r5, 0x8
	adds r6, r4, 0
	adds r6, 0x8
_080DBFCE:
	lsls r0, r5, 1
	adds r1, r6, r0
	movs r2, 0
	ldrsh r0, [r1, r2]
	cmp r0, 0x40
	beq _080DBFEA
	adds r1, r0, 0
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	ldr r1, _080DC000 @ =gSprites
	adds r0, r1
	bl DestroySprite
_080DBFEA:
	adds r0, r5, 0x1
	lsls r0, 16
	lsrs r5, r0, 16
	cmp r5, 0xC
	bls _080DBFCE
_080DBFF4:
	ldrh r0, [r4, 0x8]
	adds r0, 0x1
	strh r0, [r4, 0x8]
	b _080DC014
	.align 2, 0
_080DBFFC: .4byte REG_BLDALPHA
_080DC000: .4byte gSprites
_080DC004:
	ldr r0, _080DC01C @ =REG_BLDALPHA
	movs r1, 0
	strh r1, [r0]
	subs r0, 0x2
	strh r1, [r0]
	adds r0, r2, 0
	bl DestroyAnimVisualTask
_080DC014:
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_080DC01C: .4byte REG_BLDALPHA
	thumb_func_end sub_80DBE98

	thumb_func_start sub_80DC020
sub_80DC020: @ 80DC020
	push {r4,lr}
	adds r4, r0, 0
	movs r0, 0x30
	ldrsh r1, [r4, r0]
	movs r2, 0x2E
	ldrsh r0, [r4, r2]
	subs r0, 0xA
	cmp r1, r0
	ble _080DC04A
	ldrh r0, [r4, 0x30]
	movs r1, 0x1
	ands r1, r0
	adds r3, r4, 0
	adds r3, 0x3E
	lsls r1, 2
	ldrb r2, [r3]
	movs r0, 0x5
	negs r0, r0
	ands r0, r2
	orrs r0, r1
	strb r0, [r3]
_080DC04A:
	movs r0, 0x30
	ldrsh r1, [r4, r0]
	movs r2, 0x2E
	ldrsh r0, [r4, r2]
	cmp r1, r0
	bne _080DC05C
	adds r0, r4, 0
	bl move_anim_8072740
_080DC05C:
	ldrh r0, [r4, 0x30]
	adds r0, 0x1
	strh r0, [r4, 0x30]
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end sub_80DC020

	thumb_func_start sub_80DC068
sub_80DC068: @ 80DC068
	push {r4-r6,lr}
	adds r5, r0, 0
	ldr r6, _080DC0A4 @ =gBattleAnimArgs
	movs r1, 0
	ldrsh r0, [r6, r1]
	cmp r0, 0
	bne _080DC094
	ldr r4, _080DC0A8 @ =gBattleAnimBankAttacker
	ldrb r0, [r4]
	movs r1, 0x2
	bl sub_8077ABC
	lsls r0, 24
	lsrs r0, 24
	strh r0, [r5, 0x20]
	ldrb r0, [r4]
	movs r1, 0x3
	bl sub_8077ABC
	lsls r0, 24
	lsrs r0, 24
	strh r0, [r5, 0x22]
_080DC094:
	ldrh r0, [r6, 0x2]
	strh r0, [r5, 0x2E]
	ldr r0, _080DC0AC @ =sub_80DC020
	str r0, [r5, 0x1C]
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_080DC0A4: .4byte gBattleAnimArgs
_080DC0A8: .4byte gBattleAnimBankAttacker
_080DC0AC: .4byte sub_80DC020
	thumb_func_end sub_80DC068

	thumb_func_start sub_80DC0B0
sub_80DC0B0: @ 80DC0B0
	push {r4,r5,lr}
	lsls r0, 24
	lsrs r0, 24
	lsls r1, r0, 2
	adds r1, r0
	lsls r1, 3
	ldr r0, _080DC10C @ =gTasks
	adds r5, r1, r0
	bl NotInBattle
	lsls r0, 24
	cmp r0, 0
	beq _080DC154
	ldr r0, _080DC110 @ =gBattleAnimArgs
	movs r1, 0
	ldrsh r0, [r0, r1]
	cmp r0, 0x1
	bne _080DC120
	ldr r0, _080DC114 @ =0x0000fff6
	strh r0, [r5, 0x1C]
	ldr r4, _080DC118 @ =gBattleAnimBankTarget
	ldrb r0, [r4]
	movs r1, 0x5
	bl sub_807A100
	subs r0, 0x8
	strh r0, [r5, 0x1E]
	ldrb r0, [r4]
	movs r1, 0x2
	bl sub_807A100
	adds r0, 0x8
	strh r0, [r5, 0x20]
	ldr r4, _080DC11C @ =gBattleAnimBankAttacker
	ldrb r0, [r4]
	movs r1, 0x5
	bl sub_807A100
	subs r0, 0x8
	strh r0, [r5, 0x22]
	ldrb r0, [r4]
	movs r1, 0x2
	bl sub_807A100
	adds r0, 0x8
	b _080DC1DE
	.align 2, 0
_080DC10C: .4byte gTasks
_080DC110: .4byte gBattleAnimArgs
_080DC114: .4byte 0x0000fff6
_080DC118: .4byte gBattleAnimBankTarget
_080DC11C: .4byte gBattleAnimBankAttacker
_080DC120:
	movs r0, 0xA
	strh r0, [r5, 0x1C]
	ldr r4, _080DC14C @ =gBattleAnimBankAttacker
	ldrb r0, [r4]
	movs r1, 0x4
	bl sub_807A100
	adds r0, 0x8
	strh r0, [r5, 0x1E]
	ldrb r0, [r4]
	movs r1, 0x3
	bl sub_807A100
	subs r0, 0x8
	strh r0, [r5, 0x20]
	ldr r4, _080DC150 @ =gBattleAnimBankTarget
	ldrb r0, [r4]
	movs r1, 0x4
	bl sub_807A100
	adds r0, 0x8
	b _080DC1D2
	.align 2, 0
_080DC14C: .4byte gBattleAnimBankAttacker
_080DC150: .4byte gBattleAnimBankTarget
_080DC154:
	ldr r0, _080DC198 @ =gBattleAnimArgs
	movs r1, 0
	ldrsh r0, [r0, r1]
	cmp r0, 0x1
	bne _080DC1A8
	ldr r0, _080DC19C @ =0x0000fff6
	strh r0, [r5, 0x1C]
	ldr r4, _080DC1A0 @ =gBattleAnimBankTarget
	ldrb r0, [r4]
	movs r1, 0x4
	bl sub_807A100
	adds r0, 0x8
	strh r0, [r5, 0x1E]
	ldrb r0, [r4]
	movs r1, 0x2
	bl sub_807A100
	adds r0, 0x8
	strh r0, [r5, 0x20]
	ldr r4, _080DC1A4 @ =gBattleAnimBankAttacker
	ldrb r0, [r4]
	movs r1, 0x4
	bl sub_807A100
	adds r0, 0x8
	strh r0, [r5, 0x22]
	ldrb r0, [r4]
	movs r1, 0x2
	bl sub_807A100
	adds r0, 0x8
	b _080DC1DE
	.align 2, 0
_080DC198: .4byte gBattleAnimArgs
_080DC19C: .4byte 0x0000fff6
_080DC1A0: .4byte gBattleAnimBankTarget
_080DC1A4: .4byte gBattleAnimBankAttacker
_080DC1A8:
	movs r0, 0xA
	strh r0, [r5, 0x1C]
	ldr r4, _080DC1F0 @ =gBattleAnimBankAttacker
	ldrb r0, [r4]
	movs r1, 0x5
	bl sub_807A100
	subs r0, 0x8
	strh r0, [r5, 0x1E]
	ldrb r0, [r4]
	movs r1, 0x3
	bl sub_807A100
	subs r0, 0x8
	strh r0, [r5, 0x20]
	ldr r4, _080DC1F4 @ =gBattleAnimBankTarget
	ldrb r0, [r4]
	movs r1, 0x5
	bl sub_807A100
	subs r0, 0x8
_080DC1D2:
	strh r0, [r5, 0x22]
	ldrb r0, [r4]
	movs r1, 0x3
	bl sub_807A100
	subs r0, 0x8
_080DC1DE:
	strh r0, [r5, 0x24]
	movs r0, 0x6
	strh r0, [r5, 0xA]
	ldr r0, _080DC1F8 @ =sub_80DC1FC
	str r0, [r5]
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080DC1F0: .4byte gBattleAnimBankAttacker
_080DC1F4: .4byte gBattleAnimBankTarget
_080DC1F8: .4byte sub_80DC1FC
	thumb_func_end sub_80DC0B0

	thumb_func_start sub_80DC1FC
sub_80DC1FC: @ 80DC1FC
	push {r4,r5,lr}
	lsls r0, 24
	lsrs r2, r0, 24
	lsls r0, r2, 2
	adds r0, r2
	lsls r0, 3
	ldr r1, _080DC21C @ =gTasks
	adds r5, r0, r1
	movs r0, 0x8
	ldrsh r1, [r5, r0]
	cmp r1, 0
	beq _080DC220
	cmp r1, 0x1
	beq _080DC294
	b _080DC2A8
	.align 2, 0
_080DC21C: .4byte gTasks
_080DC220:
	ldrh r0, [r5, 0xA]
	adds r0, 0x1
	strh r0, [r5, 0xA]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x6
	ble _080DC2A8
	strh r1, [r5, 0xA]
	ldr r0, _080DC28C @ =gSpriteTemplate_83DA9AC
	movs r2, 0x1E
	ldrsh r1, [r5, r2]
	movs r3, 0x20
	ldrsh r2, [r5, r3]
	movs r3, 0
	bl CreateSprite
	lsls r0, 24
	lsrs r1, r0, 24
	cmp r1, 0x40
	beq _080DC274
	ldr r0, _080DC290 @ =gSprites
	lsls r4, r1, 4
	adds r4, r1
	lsls r4, 2
	adds r4, r0
	movs r0, 0x10
	strh r0, [r4, 0x2E]
	ldrh r0, [r5, 0x22]
	strh r0, [r4, 0x32]
	ldrh r0, [r5, 0x24]
	strh r0, [r4, 0x36]
	ldrh r0, [r5, 0x1C]
	strh r0, [r4, 0x38]
	adds r0, r4, 0
	bl sub_80786EC
	ldrb r0, [r5, 0xC]
	movs r1, 0x3
	ands r1, r0
	adds r0, r4, 0
	bl StartSpriteAffineAnim
_080DC274:
	ldrh r0, [r5, 0xC]
	adds r0, 0x1
	strh r0, [r5, 0xC]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0xC
	bne _080DC2A8
	ldrh r0, [r5, 0x8]
	adds r0, 0x1
	strh r0, [r5, 0x8]
	b _080DC2A8
	.align 2, 0
_080DC28C: .4byte gSpriteTemplate_83DA9AC
_080DC290: .4byte gSprites
_080DC294:
	ldrh r0, [r5, 0xA]
	adds r0, 0x1
	strh r0, [r5, 0xA]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x11
	ble _080DC2A8
	adds r0, r2, 0
	bl DestroyAnimVisualTask
_080DC2A8:
	pop {r4,r5}
	pop {r0}
	bx r0
	thumb_func_end sub_80DC1FC

	thumb_func_start sub_80DC2B0
sub_80DC2B0: @ 80DC2B0
	push {r4,lr}
	adds r4, r0, 0
	bl sub_8078718
	lsls r0, 24
	cmp r0, 0
	beq _080DC2CE
	ldrb r0, [r4, 0x3]
	lsls r0, 26
	lsrs r0, 27
	bl FreeOamMatrix
	adds r0, r4, 0
	bl DestroySprite
_080DC2CE:
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end sub_80DC2B0

	thumb_func_start sub_80DC2D4
sub_80DC2D4: @ 80DC2D4
	push {r4-r6,lr}
	sub sp, 0xC
	lsls r0, 24
	lsrs r0, 24
	lsls r1, r0, 2
	adds r1, r0
	lsls r1, 3
	ldr r0, _080DC30C @ =gTasks
	adds r4, r1, r0
	ldr r0, _080DC310 @ =gBattleAnimBankTarget
	ldrb r0, [r0]
	bl sub_8077FC0
	lsls r0, 24
	lsrs r1, r0, 24
	adds r0, r1, 0
	subs r0, 0x20
	strh r0, [r4, 0x24]
	ldr r0, _080DC314 @ =gBattleAnimArgs
	movs r2, 0
	ldrsh r0, [r0, r2]
	cmp r0, 0x1
	beq _080DC32A
	cmp r0, 0x1
	bgt _080DC318
	cmp r0, 0
	beq _080DC31E
	b _080DC346
	.align 2, 0
_080DC30C: .4byte gTasks
_080DC310: .4byte gBattleAnimBankTarget
_080DC314: .4byte gBattleAnimArgs
_080DC318:
	cmp r0, 0x2
	beq _080DC336
	b _080DC346
_080DC31E:
	movs r0, 0x2
	strh r0, [r4, 0x1E]
	movs r0, 0x5
	strh r0, [r4, 0x20]
	movs r0, 0x40
	b _080DC33E
_080DC32A:
	movs r0, 0x2
	strh r0, [r4, 0x1E]
	movs r0, 0x5
	strh r0, [r4, 0x20]
	movs r0, 0xC0
	b _080DC33E
_080DC336:
	movs r0, 0x4
	strh r0, [r4, 0x1E]
	strh r0, [r4, 0x20]
	movs r0, 0
_080DC33E:
	strh r0, [r4, 0x22]
	adds r0, r1, 0
	adds r0, 0x20
	strh r0, [r4, 0x26]
_080DC346:
	movs r1, 0x24
	ldrsh r0, [r4, r1]
	cmp r0, 0
	bge _080DC352
	movs r0, 0
	strh r0, [r4, 0x24]
_080DC352:
	ldr r0, _080DC36C @ =gBattleAnimBankTarget
	ldrb r0, [r0]
	bl GetBankIdentity_permutated
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _080DC378
	ldr r0, _080DC370 @ =gUnknown_030042C0
	ldrh r0, [r0]
	strh r0, [r4, 0x1C]
	ldr r0, _080DC374 @ =REG_BG1HOFS
	b _080DC380
	.align 2, 0
_080DC36C: .4byte gBattleAnimBankTarget
_080DC370: .4byte gUnknown_030042C0
_080DC374: .4byte REG_BG1HOFS
_080DC378:
	ldr r0, _080DC3E0 @ =gUnknown_03004288
	ldrh r0, [r0]
	strh r0, [r4, 0x1C]
	ldr r0, _080DC3E4 @ =REG_BG2HOFS
_080DC380:
	str r0, [sp]
	ldrh r1, [r4, 0x24]
	lsls r3, r1, 16
	asrs r1, r3, 16
	movs r2, 0x24
	ldrsh r0, [r4, r2]
	adds r0, 0x40
	cmp r1, r0
	bgt _080DC3BA
	ldr r5, _080DC3E8 @ =gUnknown_03004DE0
	movs r0, 0xF0
	lsls r0, 3
	adds r6, r5, r0
_080DC39A:
	asrs r3, 16
	lsls r1, r3, 1
	adds r2, r1, r5
	ldrh r0, [r4, 0x1C]
	strh r0, [r2]
	adds r1, r6
	ldrh r0, [r4, 0x1C]
	strh r0, [r1]
	adds r3, 0x1
	lsls r3, 16
	asrs r1, r3, 16
	movs r2, 0x24
	ldrsh r0, [r4, r2]
	adds r0, 0x40
	cmp r1, r0
	ble _080DC39A
_080DC3BA:
	ldr r0, _080DC3EC @ =0xa2600001
	str r0, [sp, 0x4]
	mov r1, sp
	movs r2, 0
	movs r0, 0x1
	strb r0, [r1, 0x8]
	mov r0, sp
	strb r2, [r0, 0x9]
	ldr r0, [sp]
	ldr r1, [sp, 0x4]
	ldr r2, [sp, 0x8]
	bl sub_80895F8
	ldr r0, _080DC3F0 @ =sub_80DC3F4
	str r0, [r4]
	add sp, 0xC
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_080DC3E0: .4byte gUnknown_03004288
_080DC3E4: .4byte REG_BG2HOFS
_080DC3E8: .4byte gUnknown_03004DE0
_080DC3EC: .4byte 0xa2600001
_080DC3F0: .4byte sub_80DC3F4
	thumb_func_end sub_80DC2D4

	thumb_func_start sub_80DC3F4
sub_80DC3F4: @ 80DC3F4
	push {r4-r7,lr}
	mov r7, r9
	mov r6, r8
	push {r6,r7}
	lsls r0, 24
	lsrs r2, r0, 24
	lsls r0, r2, 2
	adds r0, r2
	lsls r0, 3
	ldr r1, _080DC41C @ =gTasks
	adds r5, r0, r1
	movs r1, 0x8
	ldrsh r0, [r5, r1]
	cmp r0, 0x1
	beq _080DC4CE
	cmp r0, 0x1
	bgt _080DC420
	cmp r0, 0
	beq _080DC426
	b _080DC4E6
	.align 2, 0
_080DC41C: .4byte gTasks
_080DC420:
	cmp r0, 0x2
	beq _080DC4E0
	b _080DC4E6
_080DC426:
	ldrh r3, [r5, 0x22]
	ldrh r4, [r5, 0x24]
	movs r2, 0x24
	ldrsh r1, [r5, r2]
	movs r2, 0x26
	ldrsh r0, [r5, r2]
	cmp r1, r0
	bgt _080DC4BE
	ldr r0, _080DC470 @ =gSineTable
	mov r9, r0
	movs r7, 0x3
	ldr r1, _080DC474 @ =gUnknown_03004DE0
	mov r12, r1
	movs r2, 0xF0
	lsls r2, 3
	add r2, r12
	mov r8, r2
_080DC448:
	lsls r2, r3, 16
	asrs r0, r2, 15
	add r0, r9
	movs r3, 0
	ldrsh r0, [r0, r3]
	movs r3, 0x20
	ldrsh r1, [r5, r3]
	asrs r0, r1
	lsls r0, 16
	lsrs r1, r0, 16
	asrs r3, r0, 16
	adds r6, r2, 0
	cmp r3, 0
	ble _080DC478
	ldrh r1, [r5, 0xA]
	adds r0, r7, 0
	ands r0, r1
	adds r0, r3, r0
	b _080DC484
	.align 2, 0
_080DC470: .4byte gSineTable
_080DC474: .4byte gUnknown_03004DE0
_080DC478:
	cmp r3, 0
	bge _080DC488
	ldrh r1, [r5, 0xA]
	adds r0, r7, 0
	ands r0, r1
	subs r0, r3, r0
_080DC484:
	lsls r0, 16
	lsrs r1, r0, 16
_080DC488:
	lsls r2, r4, 16
	asrs r2, 16
	lsls r3, r2, 1
	mov r0, r12
	adds r4, r3, r0
	ldrh r0, [r5, 0x1C]
	lsls r1, 16
	asrs r1, 16
	adds r0, r1, r0
	strh r0, [r4]
	add r3, r8
	ldrh r0, [r5, 0x1C]
	adds r1, r0
	strh r1, [r3]
	asrs r0, r6, 16
	ldrh r1, [r5, 0x1E]
	adds r0, r1
	lsls r0, 16
	lsrs r3, r0, 16
	adds r2, 0x1
	lsls r2, 16
	lsrs r4, r2, 16
	asrs r2, 16
	movs r1, 0x26
	ldrsh r0, [r5, r1]
	cmp r2, r0
	ble _080DC448
_080DC4BE:
	ldrh r0, [r5, 0xA]
	adds r0, 0x1
	strh r0, [r5, 0xA]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x17
	ble _080DC4E6
	b _080DC4D4
_080DC4CE:
	ldr r1, _080DC4DC @ =gUnknown_03004DC0
	movs r0, 0x3
	strb r0, [r1, 0x15]
_080DC4D4:
	ldrh r0, [r5, 0x8]
	adds r0, 0x1
	strh r0, [r5, 0x8]
	b _080DC4E6
	.align 2, 0
_080DC4DC: .4byte gUnknown_03004DC0
_080DC4E0:
	adds r0, r2, 0
	bl DestroyAnimVisualTask
_080DC4E6:
	pop {r3,r4}
	mov r8, r3
	mov r9, r4
	pop {r4-r7}
	pop {r0}
	bx r0
	thumb_func_end sub_80DC3F4

	thumb_func_start sub_80DC4F4
sub_80DC4F4: @ 80DC4F4
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	lsls r0, 24
	lsrs r4, r0, 24
	mov r8, r4
	lsls r0, r4, 2
	adds r0, r4
	lsls r0, 3
	ldr r1, _080DC528 @ =gTasks
	adds r7, r0, r1
	bl AllocOamMatrix
	lsls r0, 24
	lsrs r5, r0, 24
	mov r10, r5
	adds r6, r5, 0
	cmp r6, 0xFF
	bne _080DC52C
	adds r0, r4, 0
	bl DestroyAnimVisualTask
	b _080DC5D6
	.align 2, 0
_080DC528: .4byte gTasks
_080DC52C:
	ldr r1, _080DC550 @ =gBattleAnimArgs
	ldrb r0, [r1]
	bl duplicate_obj_of_side_rel2move_in_transparent_mode
	lsls r0, 16
	lsrs r1, r0, 16
	mov r9, r1
	asrs r0, 16
	cmp r0, 0
	bge _080DC554
	adds r0, r5, 0
	bl FreeOamMatrix
	mov r0, r8
	bl DestroyAnimVisualTask
	b _080DC5D6
	.align 2, 0
_080DC550: .4byte gBattleAnimArgs
_080DC554:
	ldr r2, _080DC5E4 @ =gSprites
	lsls r4, r0, 4
	adds r4, r0
	lsls r4, 2
	adds r0, r2, 0
	adds r0, 0x1C
	adds r0, r4, r0
	ldr r1, _080DC5E8 @ =SpriteCallbackDummy
	str r1, [r0]
	adds r4, r2
	ldrb r0, [r4, 0x1]
	movs r1, 0x3
	orrs r0, r1
	strb r0, [r4, 0x1]
	movs r0, 0x1F
	ands r6, r0
	lsls r2, r6, 1
	ldrb r1, [r4, 0x3]
	movs r0, 0x3F
	negs r0, r0
	ands r0, r1
	orrs r0, r2
	strb r0, [r4, 0x3]
	adds r2, r4, 0
	adds r2, 0x2C
	ldrb r0, [r2]
	movs r1, 0x80
	orrs r0, r1
	strb r0, [r2]
	adds r1, r4, 0
	adds r1, 0x43
	ldrb r0, [r1]
	adds r0, 0x1
	strb r0, [r1]
	mov r1, r9
	lsls r0, r1, 24
	lsrs r0, 24
	movs r2, 0x80
	lsls r2, 1
	adds r1, r2, 0
	movs r3, 0
	bl obj_id_set_rotscale
	ldrb r3, [r4, 0x1]
	lsrs r1, r3, 6
	ldrb r2, [r4, 0x3]
	lsrs r2, 6
	lsls r3, 30
	lsrs r3, 30
	adds r0, r4, 0
	bl CalcCenterToCornerVec
	ldr r1, _080DC5EC @ =gBattleAnimArgs
	ldrb r0, [r1]
	bl GetAnimBankSpriteId
	lsls r0, 24
	lsrs r0, 24
	strh r0, [r7, 0x22]
	mov r0, r10
	strh r0, [r7, 0x24]
	mov r1, r9
	strh r1, [r7, 0x26]
	ldr r0, _080DC5F0 @ =sub_80DC5F4
	str r0, [r7]
_080DC5D6:
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080DC5E4: .4byte gSprites
_080DC5E8: .4byte SpriteCallbackDummy
_080DC5EC: .4byte gBattleAnimArgs
_080DC5F0: .4byte sub_80DC5F4
	thumb_func_end sub_80DC4F4

	thumb_func_start sub_80DC5F4
sub_80DC5F4: @ 80DC5F4
	push {r4,r5,lr}
	lsls r0, 24
	lsrs r5, r0, 24
	lsls r0, r5, 2
	adds r0, r5
	lsls r0, 3
	ldr r1, _080DC618 @ =gTasks
	adds r4, r0, r1
	movs r1, 0x8
	ldrsh r0, [r4, r1]
	cmp r0, 0x1
	beq _080DC678
	cmp r0, 0x1
	bgt _080DC61C
	cmp r0, 0
	beq _080DC626
	b _080DC6F8
	.align 2, 0
_080DC618: .4byte gTasks
_080DC61C:
	cmp r0, 0x2
	beq _080DC6C8
	cmp r0, 0x3
	beq _080DC6E8
	b _080DC6F8
_080DC626:
	ldrh r0, [r4, 0xA]
	adds r0, 0x4
	strh r0, [r4, 0xA]
	ldr r1, _080DC674 @ =gSineTable
	movs r2, 0xA
	ldrsh r0, [r4, r2]
	lsls r0, 1
	adds r0, r1
	ldrh r1, [r0]
	lsls r1, 16
	asrs r1, 17
	movs r2, 0x80
	lsls r2, 1
	adds r0, r2, 0
	subs r0, r1
	strh r0, [r4, 0xC]
	ldrh r0, [r4, 0x26]
	lsls r0, 24
	lsrs r0, 24
	movs r1, 0xC
	ldrsh r2, [r4, r1]
	adds r1, r2, 0
	movs r3, 0
	bl obj_id_set_rotscale
	ldrh r0, [r4, 0x26]
	lsls r0, 24
	lsrs r0, 24
	ldrh r1, [r4, 0x22]
	lsls r1, 24
	lsrs r1, 24
	bl sub_8079AB8
	movs r2, 0xA
	ldrsh r0, [r4, r2]
	cmp r0, 0x30
	bne _080DC6F8
	b _080DC6DA
	.align 2, 0
_080DC674: .4byte gSineTable
_080DC678:
	ldrh r0, [r4, 0xA]
	subs r0, 0x4
	strh r0, [r4, 0xA]
	ldr r1, _080DC6C4 @ =gSineTable
	movs r2, 0xA
	ldrsh r0, [r4, r2]
	lsls r0, 1
	adds r0, r1
	ldrh r1, [r0]
	lsls r1, 16
	asrs r1, 17
	movs r2, 0x80
	lsls r2, 1
	adds r0, r2, 0
	subs r0, r1
	strh r0, [r4, 0xC]
	ldrh r0, [r4, 0x26]
	lsls r0, 24
	lsrs r0, 24
	movs r1, 0xC
	ldrsh r2, [r4, r1]
	adds r1, r2, 0
	movs r3, 0
	bl obj_id_set_rotscale
	ldrh r0, [r4, 0x26]
	lsls r0, 24
	lsrs r0, 24
	ldrh r1, [r4, 0x22]
	lsls r1, 24
	lsrs r1, 24
	bl sub_8079AB8
	movs r2, 0xA
	ldrsh r0, [r4, r2]
	cmp r0, 0
	bne _080DC6F8
	b _080DC6DA
	.align 2, 0
_080DC6C4: .4byte gSineTable
_080DC6C8:
	movs r0, 0x26
	ldrsh r1, [r4, r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	ldr r1, _080DC6E4 @ =gSprites
	adds r0, r1
	bl obj_delete_but_dont_free_vram
_080DC6DA:
	ldrh r0, [r4, 0x8]
	adds r0, 0x1
	strh r0, [r4, 0x8]
	b _080DC6F8
	.align 2, 0
_080DC6E4: .4byte gSprites
_080DC6E8:
	ldrh r0, [r4, 0x24]
	lsls r0, 24
	lsrs r0, 24
	bl FreeOamMatrix
	adds r0, r5, 0
	bl DestroyAnimVisualTask
_080DC6F8:
	pop {r4,r5}
	pop {r0}
	bx r0
	thumb_func_end sub_80DC5F4

	thumb_func_start sub_80DC700
sub_80DC700: @ 80DC700
	push {r4,r5,lr}
	adds r5, r0, 0
	movs r1, 0x2E
	ldrsh r0, [r5, r1]
	cmp r0, 0x1
	beq _080DC778
	cmp r0, 0x1
	bgt _080DC716
	cmp r0, 0
	beq _080DC720
	b _080DC818
_080DC716:
	cmp r0, 0x2
	beq _080DC7AA
	cmp r0, 0x3
	beq _080DC808
	b _080DC818
_080DC720:
	ldr r4, _080DC76C @ =gBattleAnimBankAttacker
	ldrb r0, [r4]
	movs r1, 0
	bl sub_8077ABC
	lsls r0, 24
	lsrs r0, 24
	strh r0, [r5, 0x20]
	ldrb r0, [r4]
	movs r1, 0x1
	bl sub_8077ABC
	lsls r0, 24
	lsrs r0, 24
	strh r0, [r5, 0x22]
	bl NotInBattle
	lsls r0, 24
	cmp r0, 0
	beq _080DC74E
	ldrh r0, [r5, 0x22]
	adds r0, 0xC
	strh r0, [r5, 0x22]
_080DC74E:
	movs r0, 0x8
	strh r0, [r5, 0x30]
	ldr r1, _080DC770 @ =REG_BLDCNT
	movs r2, 0xFD
	lsls r2, 6
	adds r0, r2, 0
	strh r0, [r1]
	ldr r2, _080DC774 @ =REG_BLDALPHA
	ldrh r1, [r5, 0x30]
	movs r0, 0x10
	subs r0, r1
	lsls r0, 8
	orrs r0, r1
	strh r0, [r2]
	b _080DC7A2
	.align 2, 0
_080DC76C: .4byte gBattleAnimBankAttacker
_080DC770: .4byte REG_BLDCNT
_080DC774: .4byte REG_BLDALPHA
_080DC778:
	adds r0, r5, 0
	adds r0, 0x3F
	ldrb r1, [r0]
	movs r0, 0x20
	ands r0, r1
	cmp r0, 0
	beq _080DC818
	movs r0, 0x40
	negs r0, r0
	bl sub_8076F98
	adds r1, r0, 0
	lsls r1, 24
	asrs r1, 24
	movs r0, 0xCB
	bl PlaySE12WithPanning
	adds r0, r5, 0
	movs r1, 0x1
	bl ChangeSpriteAffineAnim
_080DC7A2:
	ldrh r0, [r5, 0x2E]
	adds r0, 0x1
	strh r0, [r5, 0x2E]
	b _080DC818
_080DC7AA:
	ldrh r0, [r5, 0x32]
	adds r1, r0, 0x1
	strh r1, [r5, 0x32]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x1
	ble _080DC7E8
	movs r0, 0
	strh r0, [r5, 0x32]
	ldrh r1, [r5, 0x30]
	subs r1, 0x1
	strh r1, [r5, 0x30]
	ldr r2, _080DC804 @ =REG_BLDALPHA
	movs r0, 0x10
	subs r0, r1
	lsls r0, 8
	orrs r1, r0
	strh r1, [r2]
	movs r1, 0x30
	ldrsh r0, [r5, r1]
	cmp r0, 0
	bne _080DC7E8
	ldrh r0, [r5, 0x2E]
	adds r0, 0x1
	strh r0, [r5, 0x2E]
	adds r2, r5, 0
	adds r2, 0x3E
	ldrb r0, [r2]
	movs r1, 0x4
	orrs r0, r1
	strb r0, [r2]
_080DC7E8:
	movs r0, 0xE0
	lsls r0, 2
	adds r2, r0, 0
	ldrh r1, [r5, 0x34]
	adds r2, r1
	lsls r1, r2, 16
	asrs r1, 24
	ldrh r0, [r5, 0x26]
	subs r0, r1
	strh r0, [r5, 0x26]
	movs r0, 0xFF
	ands r2, r0
	strh r2, [r5, 0x34]
	b _080DC818
	.align 2, 0
_080DC804: .4byte REG_BLDALPHA
_080DC808:
	ldr r0, _080DC820 @ =REG_BLDCNT
	movs r1, 0
	strh r1, [r0]
	adds r0, 0x2
	strh r1, [r0]
	adds r0, r5, 0
	bl move_anim_8072740
_080DC818:
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080DC820: .4byte REG_BLDCNT
	thumb_func_end sub_80DC700
	
	.align 2, 0 @ Don't pad with nop.
