	.include "constants/gba_constants.inc"
	.include "constants/species_constants.inc"
	.include "asm/macros.inc"

	.syntax unified

	.text

	thumb_func_start sub_80C6264
sub_80C6264: @ 80C6264
	push {lr}
	ldr r0, _080C6278 @ =gUnknown_0203923C
	ldr r1, _080C627C @ =gMapHeader
	ldr r1, [r1, 0x4]
	bl sub_80BBFD8
	bl sub_80BB5E4
	pop {r0}
	bx r0
	.align 2, 0
_080C6278: .4byte gUnknown_0203923C
_080C627C: .4byte gMapHeader
	thumb_func_end sub_80C6264

	thumb_func_start sub_80C6280
sub_80C6280: @ 80C6280
	push {lr}
	ldr r1, _080C6294 @ =gFieldEffectArguments
	ldr r0, [r1, 0x4]
	cmp r0, 0x2
	beq _080C62AA
	cmp r0, 0x2
	bgt _080C6298
	cmp r0, 0x1
	beq _080C62A2
	b _080C62BE
	.align 2, 0
_080C6294: .4byte gFieldEffectArguments
_080C6298:
	cmp r0, 0x3
	beq _080C62AE
	cmp r0, 0x4
	beq _080C62B8
	b _080C62BE
_080C62A2:
	movs r0, 0x8
	str r0, [r1, 0x14]
	movs r0, 0x28
	b _080C62BC
_080C62AA:
	movs r0, 0x8
	b _080C62BA
_080C62AE:
	movs r0, 0x8
	negs r0, r0
	str r0, [r1, 0x14]
	movs r0, 0x18
	b _080C62BC
_080C62B8:
	movs r0, 0x18
_080C62BA:
	str r0, [r1, 0x14]
_080C62BC:
	str r0, [r1, 0x18]
_080C62BE:
	pop {r0}
	bx r0
	thumb_func_end sub_80C6280

	thumb_func_start SetUpFieldMove_SecretPower
SetUpFieldMove_SecretPower: @ 80C62C4
	push {r4,lr}
	bl sub_80BB63C
	ldr r0, _080C6318 @ =gScriptResult
	ldrh r0, [r0]
	cmp r0, 0x1
	beq _080C636E
	bl player_get_direction_lower_nybble
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x2
	bne _080C636E
	ldr r4, _080C631C @ =gUnknown_0203923C
	adds r1, r4, 0x2
	adds r0, r4, 0
	bl GetXYCoordsOneStepInFrontOfPlayer
	movs r1, 0
	ldrsh r0, [r4, r1]
	movs r2, 0x2
	ldrsh r1, [r4, r2]
	bl MapGridGetMetatileBehaviorAt
	lsls r0, 24
	lsrs r4, r0, 24
	adds r0, r4, 0
	bl MetatileBehavior_IsSecretBaseCave
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _080C6330
	bl sub_80C6264
	ldr r1, _080C6320 @ =gFieldCallback
	ldr r0, _080C6324 @ =FieldCallback_Teleport
	str r0, [r1]
	ldr r1, _080C6328 @ =gUnknown_03005CE4
	ldr r0, _080C632C @ =sub_80C639C
	b _080C6380
	.align 2, 0
_080C6318: .4byte gScriptResult
_080C631C: .4byte gUnknown_0203923C
_080C6320: .4byte gFieldCallback
_080C6324: .4byte FieldCallback_Teleport
_080C6328: .4byte gUnknown_03005CE4
_080C632C: .4byte sub_80C639C
_080C6330:
	adds r0, r4, 0
	bl MetatileBehavior_IsSecretBaseTree
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _080C6360
	bl sub_80C6264
	ldr r1, _080C6350 @ =gFieldCallback
	ldr r0, _080C6354 @ =FieldCallback_Teleport
	str r0, [r1]
	ldr r1, _080C6358 @ =gUnknown_03005CE4
	ldr r0, _080C635C @ =sub_80C64A8
	b _080C6380
	.align 2, 0
_080C6350: .4byte gFieldCallback
_080C6354: .4byte FieldCallback_Teleport
_080C6358: .4byte gUnknown_03005CE4
_080C635C: .4byte sub_80C64A8
_080C6360:
	adds r0, r4, 0
	bl MetatileBehavior_IsSecretBaseShrub
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	beq _080C6372
_080C636E:
	movs r0, 0
	b _080C6384
_080C6372:
	bl sub_80C6264
	ldr r1, _080C638C @ =gFieldCallback
	ldr r0, _080C6390 @ =FieldCallback_Teleport
	str r0, [r1]
	ldr r1, _080C6394 @ =gUnknown_03005CE4
	ldr r0, _080C6398 @ =sub_80C660C
_080C6380:
	str r0, [r1]
	movs r0, 0x1
_080C6384:
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_080C638C: .4byte gFieldCallback
_080C6390: .4byte FieldCallback_Teleport
_080C6394: .4byte gUnknown_03005CE4
_080C6398: .4byte sub_80C660C
	thumb_func_end SetUpFieldMove_SecretPower

	thumb_func_start sub_80C639C
sub_80C639C: @ 80C639C
	push {lr}
	ldr r1, _080C63B0 @ =gFieldEffectArguments
	ldr r0, _080C63B4 @ =gLastFieldPokeMenuOpened
	ldrb r0, [r0]
	str r0, [r1]
	ldr r0, _080C63B8 @ =gUnknown_081A2CE6
	bl ScriptContext1_SetupScript
	pop {r0}
	bx r0
	.align 2, 0
_080C63B0: .4byte gFieldEffectArguments
_080C63B4: .4byte gLastFieldPokeMenuOpened
_080C63B8: .4byte gUnknown_081A2CE6
	thumb_func_end sub_80C639C

	thumb_func_start FldEff_UseSecretPowerCave
FldEff_UseSecretPowerCave: @ 80C63BC
	push {lr}
	bl oei_task_add
	lsls r0, 24
	lsrs r0, 24
	ldr r2, _080C63E0 @ =gTasks
	lsls r1, r0, 2
	adds r1, r0
	lsls r1, 3
	adds r1, r2
	ldr r2, _080C63E4 @ =sub_80C63E8
	lsrs r0, r2, 16
	strh r0, [r1, 0x18]
	strh r2, [r1, 0x1A]
	movs r0, 0
	pop {r1}
	bx r1
	.align 2, 0
_080C63E0: .4byte gTasks
_080C63E4: .4byte sub_80C63E8
	thumb_func_end FldEff_UseSecretPowerCave

	thumb_func_start sub_80C63E8
sub_80C63E8: @ 80C63E8
	push {lr}
	movs r0, 0xB
	bl FieldEffectActiveListRemove
	movs r0, 0x37
	bl FieldEffectStart
	pop {r0}
	bx r0
	thumb_func_end sub_80C63E8

	thumb_func_start FldEff_SecretPowerCave
FldEff_SecretPowerCave: @ 80C63FC
	push {r4,lr}
	bl sub_80C6280
	ldr r0, _080C643C @ =gSpriteTemplate_83D2614
	ldr r3, _080C6440 @ =gSprites
	ldr r1, _080C6444 @ =gPlayerAvatar
	ldrb r1, [r1, 0x4]
	lsls r2, r1, 4
	adds r2, r1
	lsls r2, 2
	adds r2, r3
	ldrh r1, [r2, 0x2]
	lsls r1, 23
	lsrs r1, 23
	ldr r4, _080C6448 @ =gFieldEffectArguments
	ldr r3, [r4, 0x14]
	adds r1, r3
	lsls r1, 16
	asrs r1, 16
	ldrb r2, [r2]
	ldr r3, [r4, 0x18]
	adds r2, r3
	lsls r2, 16
	asrs r2, 16
	movs r3, 0x94
	bl CreateSprite
	movs r0, 0
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_080C643C: .4byte gSpriteTemplate_83D2614
_080C6440: .4byte gSprites
_080C6444: .4byte gPlayerAvatar
_080C6448: .4byte gFieldEffectArguments
	thumb_func_end FldEff_SecretPowerCave

	thumb_func_start sub_80C644C
sub_80C644C: @ 80C644C
	push {r4,lr}
	adds r4, r0, 0
	movs r0, 0x83
	bl PlaySE
	movs r0, 0
	strh r0, [r4, 0x2E]
	ldr r0, _080C6464 @ =sub_80C6468
	str r0, [r4, 0x1C]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080C6464: .4byte sub_80C6468
	thumb_func_end sub_80C644C

	thumb_func_start sub_80C6468
sub_80C6468: @ 80C6468
	push {lr}
	adds r1, r0, 0
	ldrh r2, [r1, 0x2E]
	movs r3, 0x2E
	ldrsh r0, [r1, r3]
	cmp r0, 0x27
	bgt _080C6488
	adds r0, r2, 0x1
	strh r0, [r1, 0x2E]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x14
	bne _080C6490
	bl sub_80BB800
	b _080C6490
_080C6488:
	movs r0, 0
	strh r0, [r1, 0x2E]
	ldr r0, _080C6494 @ =sub_80C6498
	str r0, [r1, 0x1C]
_080C6490:
	pop {r0}
	bx r0
	.align 2, 0
_080C6494: .4byte sub_80C6498
	thumb_func_end sub_80C6468

	thumb_func_start sub_80C6498
sub_80C6498: @ 80C6498
	push {lr}
	movs r1, 0x37
	bl FieldEffectStop
	bl EnableBothScriptContexts
	pop {r0}
	bx r0
	thumb_func_end sub_80C6498

	thumb_func_start sub_80C64A8
sub_80C64A8: @ 80C64A8
	push {lr}
	ldr r1, _080C64BC @ =gFieldEffectArguments
	ldr r0, _080C64C0 @ =gLastFieldPokeMenuOpened
	ldrb r0, [r0]
	str r0, [r1]
	ldr r0, _080C64C4 @ =gUnknown_081A2D3E
	bl ScriptContext1_SetupScript
	pop {r0}
	bx r0
	.align 2, 0
_080C64BC: .4byte gFieldEffectArguments
_080C64C0: .4byte gLastFieldPokeMenuOpened
_080C64C4: .4byte gUnknown_081A2D3E
	thumb_func_end sub_80C64A8

	thumb_func_start FldEff_UseSecretPowerTree
FldEff_UseSecretPowerTree: @ 80C64C8
	push {lr}
	bl oei_task_add
	lsls r0, 24
	lsrs r0, 24
	ldr r2, _080C64EC @ =gTasks
	lsls r1, r0, 2
	adds r1, r0
	lsls r1, 3
	adds r1, r2
	ldr r2, _080C64F0 @ =sub_80C64F4
	lsrs r0, r2, 16
	strh r0, [r1, 0x18]
	strh r2, [r1, 0x1A]
	movs r0, 0
	pop {r1}
	bx r1
	.align 2, 0
_080C64EC: .4byte gTasks
_080C64F0: .4byte sub_80C64F4
	thumb_func_end FldEff_UseSecretPowerTree

	thumb_func_start sub_80C64F4
sub_80C64F4: @ 80C64F4
	push {lr}
	movs r0, 0x1A
	bl FieldEffectActiveListRemove
	movs r0, 0x38
	bl FieldEffectStart
	pop {r0}
	bx r0
	thumb_func_end sub_80C64F4

	thumb_func_start FldEff_SecretPowerTree
FldEff_SecretPowerTree: @ 80C6508
	push {r4,lr}
	ldr r1, _080C6580 @ =gUnknown_0203923C
	movs r2, 0
	ldrsh r0, [r1, r2]
	movs r2, 0x2
	ldrsh r1, [r1, r2]
	bl MapGridGetMetatileBehaviorAt
	adds r2, r0, 0
	ldr r1, _080C6584 @ =0x00000fff
	adds r0, r1, 0
	ands r2, r0
	cmp r2, 0x96
	bne _080C652A
	ldr r1, _080C6588 @ =gFieldEffectArguments
	movs r0, 0
	str r0, [r1, 0x1C]
_080C652A:
	cmp r2, 0x9C
	bne _080C6534
	ldr r1, _080C6588 @ =gFieldEffectArguments
	movs r0, 0x2
	str r0, [r1, 0x1C]
_080C6534:
	bl sub_80C6280
	ldr r0, _080C658C @ =gSpriteTemplate_83D262C
	ldr r3, _080C6590 @ =gSprites
	ldr r1, _080C6594 @ =gPlayerAvatar
	ldrb r1, [r1, 0x4]
	lsls r2, r1, 4
	adds r2, r1
	lsls r2, 2
	adds r2, r3
	ldrh r1, [r2, 0x2]
	lsls r1, 23
	lsrs r1, 23
	ldr r4, _080C6588 @ =gFieldEffectArguments
	ldr r3, [r4, 0x14]
	adds r1, r3
	lsls r1, 16
	asrs r1, 16
	ldrb r2, [r2]
	ldr r3, [r4, 0x18]
	adds r2, r3
	lsls r2, 16
	asrs r2, 16
	movs r3, 0x94
	bl CreateSprite
	ldr r0, [r4, 0x1C]
	cmp r0, 0x1
	beq _080C6572
	cmp r0, 0x3
	bne _080C6576
_080C6572:
	bl sub_80BB800
_080C6576:
	movs r0, 0
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_080C6580: .4byte gUnknown_0203923C
_080C6584: .4byte 0x00000fff
_080C6588: .4byte gFieldEffectArguments
_080C658C: .4byte gSpriteTemplate_83D262C
_080C6590: .4byte gSprites
_080C6594: .4byte gPlayerAvatar
	thumb_func_end FldEff_SecretPowerTree

	thumb_func_start sub_80C6598
sub_80C6598: @ 80C6598
	push {r4,lr}
	adds r4, r0, 0
	movs r0, 0x9B
	bl PlaySE
	ldr r0, _080C65BC @ =gFieldEffectArguments
	ldr r1, [r0, 0x1C]
	adds r2, r4, 0
	adds r2, 0x2A
	movs r0, 0
	strb r1, [r2]
	strh r0, [r4, 0x2E]
	ldr r0, _080C65C0 @ =sub_80C65C4
	str r0, [r4, 0x1C]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080C65BC: .4byte gFieldEffectArguments
_080C65C0: .4byte sub_80C65C4
	thumb_func_end sub_80C6598

	thumb_func_start sub_80C65C4
sub_80C65C4: @ 80C65C4
	push {r4,lr}
	adds r4, r0, 0
	ldrh r0, [r4, 0x2E]
	adds r0, 0x1
	strh r0, [r4, 0x2E]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x27
	ble _080C65EE
	ldr r0, _080C65F4 @ =gFieldEffectArguments
	ldr r0, [r0, 0x1C]
	cmp r0, 0
	beq _080C65E2
	cmp r0, 0x2
	bne _080C65E6
_080C65E2:
	bl sub_80BB800
_080C65E6:
	movs r0, 0
	strh r0, [r4, 0x2E]
	ldr r0, _080C65F8 @ =sub_80C65FC
	str r0, [r4, 0x1C]
_080C65EE:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080C65F4: .4byte gFieldEffectArguments
_080C65F8: .4byte sub_80C65FC
	thumb_func_end sub_80C65C4

	thumb_func_start sub_80C65FC
sub_80C65FC: @ 80C65FC
	push {lr}
	movs r1, 0x38
	bl FieldEffectStop
	bl EnableBothScriptContexts
	pop {r0}
	bx r0
	thumb_func_end sub_80C65FC

	thumb_func_start sub_80C660C
sub_80C660C: @ 80C660C
	push {lr}
	ldr r1, _080C6620 @ =gFieldEffectArguments
	ldr r0, _080C6624 @ =gLastFieldPokeMenuOpened
	ldrb r0, [r0]
	str r0, [r1]
	ldr r0, _080C6628 @ =gUnknown_081A2D96
	bl ScriptContext1_SetupScript
	pop {r0}
	bx r0
	.align 2, 0
_080C6620: .4byte gFieldEffectArguments
_080C6624: .4byte gLastFieldPokeMenuOpened
_080C6628: .4byte gUnknown_081A2D96
	thumb_func_end sub_80C660C

	thumb_func_start FldEff_UseSecretPowerShrub
FldEff_UseSecretPowerShrub: @ 80C662C
	push {lr}
	bl oei_task_add
	lsls r0, 24
	lsrs r0, 24
	ldr r2, _080C6650 @ =gTasks
	lsls r1, r0, 2
	adds r1, r0
	lsls r1, 3
	adds r1, r2
	ldr r2, _080C6654 @ =sub_80C6658
	lsrs r0, r2, 16
	strh r0, [r1, 0x18]
	strh r2, [r1, 0x1A]
	movs r0, 0
	pop {r1}
	bx r1
	.align 2, 0
_080C6650: .4byte gTasks
_080C6654: .4byte sub_80C6658
	thumb_func_end FldEff_UseSecretPowerShrub

	thumb_func_start sub_80C6658
sub_80C6658: @ 80C6658
	push {lr}
	movs r0, 0x1B
	bl FieldEffectActiveListRemove
	movs r0, 0x39
	bl FieldEffectStart
	pop {r0}
	bx r0
	thumb_func_end sub_80C6658

	thumb_func_start FldEff_SecretPowerShrub
FldEff_SecretPowerShrub: @ 80C666C
	push {r4,lr}
	bl sub_80C6280
	ldr r0, _080C66AC @ =gSpriteTemplate_83D2644
	ldr r3, _080C66B0 @ =gSprites
	ldr r1, _080C66B4 @ =gPlayerAvatar
	ldrb r1, [r1, 0x4]
	lsls r2, r1, 4
	adds r2, r1
	lsls r2, 2
	adds r2, r3
	ldrh r1, [r2, 0x2]
	lsls r1, 23
	lsrs r1, 23
	ldr r4, _080C66B8 @ =gFieldEffectArguments
	ldr r3, [r4, 0x14]
	adds r1, r3
	lsls r1, 16
	asrs r1, 16
	ldrb r2, [r2]
	ldr r3, [r4, 0x18]
	adds r2, r3
	lsls r2, 16
	asrs r2, 16
	movs r3, 0x94
	bl CreateSprite
	movs r0, 0
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_080C66AC: .4byte gSpriteTemplate_83D2644
_080C66B0: .4byte gSprites
_080C66B4: .4byte gPlayerAvatar
_080C66B8: .4byte gFieldEffectArguments
	thumb_func_end FldEff_SecretPowerShrub

	thumb_func_start sub_80C66BC
sub_80C66BC: @ 80C66BC
	push {r4,lr}
	adds r4, r0, 0
	movs r0, 0xA9
	bl PlaySE
	movs r0, 0
	strh r0, [r4, 0x2E]
	ldr r0, _080C66D4 @ =sub_80C66D8
	str r0, [r4, 0x1C]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080C66D4: .4byte sub_80C66D8
	thumb_func_end sub_80C66BC

	thumb_func_start sub_80C66D8
sub_80C66D8: @ 80C66D8
	push {lr}
	adds r1, r0, 0
	ldrh r2, [r1, 0x2E]
	movs r3, 0x2E
	ldrsh r0, [r1, r3]
	cmp r0, 0x27
	bgt _080C66F8
	adds r0, r2, 0x1
	strh r0, [r1, 0x2E]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x14
	bne _080C6700
	bl sub_80BB800
	b _080C6700
_080C66F8:
	movs r0, 0
	strh r0, [r1, 0x2E]
	ldr r0, _080C6704 @ =sub_80C6708
	str r0, [r1, 0x1C]
_080C6700:
	pop {r0}
	bx r0
	.align 2, 0
_080C6704: .4byte sub_80C6708
	thumb_func_end sub_80C66D8

	thumb_func_start sub_80C6708
sub_80C6708: @ 80C6708
	push {lr}
	movs r1, 0x39
	bl FieldEffectStop
	bl EnableBothScriptContexts
	pop {r0}
	bx r0
	thumb_func_end sub_80C6708

	.align 2, 0 @ Don't pad with nop.
