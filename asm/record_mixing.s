	.include "constants/gba_constants.inc"
	.include "constants/species_constants.inc"
	.include "asm/macros.inc"

	.syntax unified

	.text

	thumb_func_start sub_80B9F3C
sub_80B9F3C: @ 80B9F3C
	push {r4,lr}
	adds r4, r0, 0
	lsls r1, 24
	cmp r1, 0
	beq _080BA000
	ldrh r0, [r4]
	cmp r0, 0
	beq _080BA000
	bl GetPocketByItemId
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x5
	bne _080B9FC8
	ldrh r0, [r4]
	movs r1, 0x1
	bl CheckBagHasItem
	lsls r0, 24
	cmp r0, 0
	bne _080B9FB8
	ldrh r0, [r4]
	movs r1, 0x1
	bl CheckPCHasItem
	lsls r0, 24
	cmp r0, 0
	bne _080B9FB8
	ldrh r0, [r4]
	movs r1, 0x1
	bl AddBagItem
	lsls r0, 24
	cmp r0, 0
	beq _080B9FB8
	ldr r0, _080B9FA4 @ =0x00004001
	ldrh r1, [r4]
	bl VarSet
	ldr r0, _080B9FA8 @ =gStringVar1
	ldr r1, _080B9FAC @ =gLinkPlayers + 0x8
	bl StringCopy
	ldrh r1, [r4]
	ldr r0, _080B9FB0 @ =0x00000113
	cmp r1, r0
	bne _080BA000
	ldr r0, _080B9FB4 @ =0x00000853
	bl FlagSet
	b _080BA000
	.align 2, 0
_080B9FA4: .4byte 0x00004001
_080B9FA8: .4byte gStringVar1
_080B9FAC: .4byte gLinkPlayers + 0x8
_080B9FB0: .4byte 0x00000113
_080B9FB4: .4byte 0x00000853
_080B9FB8:
	ldr r0, _080B9FC4 @ =0x00004001
	movs r1, 0
	bl VarSet
	b _080BA000
	.align 2, 0
_080B9FC4: .4byte 0x00004001
_080B9FC8:
	ldrh r0, [r4]
	movs r1, 0x1
	bl AddBagItem
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _080B9FF8
	ldr r0, _080B9FEC @ =0x00004001
	ldrh r1, [r4]
	bl VarSet
	ldr r0, _080B9FF0 @ =gStringVar1
	ldr r1, _080B9FF4 @ =gLinkPlayers + 0x8
	bl StringCopy
	b _080BA000
	.align 2, 0
_080B9FEC: .4byte 0x00004001
_080B9FF0: .4byte gStringVar1
_080B9FF4: .4byte gLinkPlayers + 0x8
_080B9FF8:
	ldr r0, _080BA008 @ =0x00004001
	movs r1, 0
	bl VarSet
_080BA000:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080BA008: .4byte 0x00004001
	thumb_func_end sub_80B9F3C

	thumb_func_start sub_80BA00C
sub_80BA00C: @ 80BA00C
	push {r4,lr}
	lsls r0, 24
	lsrs r2, r0, 24
	lsls r0, r2, 2
	adds r0, r2
	lsls r0, 3
	ldr r1, _080BA030 @ =gTasks
	adds r4, r0, r1
	movs r1, 0x8
	ldrsh r0, [r4, r1]
	cmp r0, 0x5
	bhi _080BA09C
	lsls r0, 2
	ldr r1, _080BA034 @ =_080BA038
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_080BA030: .4byte gTasks
_080BA034: .4byte _080BA038
	.align 2, 0
_080BA038:
	.4byte _080BA086
	.4byte _080BA086
	.4byte _080BA050
	.4byte _080BA05A
	.4byte _080BA074
	.4byte _080BA08E
_080BA050:
	bl SetSecretBase2Field_9_AndHideBG
	bl sub_8125E2C
	b _080BA086
_080BA05A:
	bl sub_8125E6C
	lsls r0, 24
	cmp r0, 0
	beq _080BA09C
	bl ClearSecretBase2Field_9_2
	ldrh r0, [r4, 0x8]
	adds r0, 0x1
	movs r1, 0
	strh r0, [r4, 0x8]
	strh r1, [r4, 0xA]
	b _080BA09C
_080BA074:
	ldrh r0, [r4, 0xA]
	adds r0, 0x1
	strh r0, [r4, 0xA]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0xA
	ble _080BA09C
	bl sub_800832C
_080BA086:
	ldrh r0, [r4, 0x8]
	adds r0, 0x1
	strh r0, [r4, 0x8]
	b _080BA09C
_080BA08E:
	ldr r0, _080BA0A4 @ =gReceivedRemoteLinkPlayers
	ldrb r0, [r0]
	cmp r0, 0
	bne _080BA09C
	adds r0, r2, 0
	bl DestroyTask
_080BA09C:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080BA0A4: .4byte gReceivedRemoteLinkPlayers
	thumb_func_end sub_80BA00C

	.align 2, 0 @ Don't pad with nop.
