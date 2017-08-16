	.include "constants/gba_constants.inc"
	.include "constants/species_constants.inc"
	.include "asm/macros.inc"

	.syntax unified

	.text

	thumb_func_start sub_802DB6C
sub_802DB6C: @ 802DB6C
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	sub sp, 0x8
	lsls r0, 24
	lsrs r0, 24
	mov r8, r0
	ldr r1, _0802DB98 @ =gTasks
	lsls r0, 2
	add r0, r8
	lsls r0, 3
	adds r6, r0, r1
	ldrh r1, [r6, 0x1C]
	movs r2, 0x1C
	ldrsh r0, [r6, r2]
	cmp r0, 0xC
	bgt _0802DB9C
	adds r0, r1, 0x1
	strh r0, [r6, 0x1C]
	b _0802DC98
	.align 2, 0
_0802DB98: .4byte gTasks
_0802DB9C:
	ldrb r0, [r6, 0x8]
	mov r9, r0
	ldrh r2, [r6, 0xA]
	mov r10, r2
	ldrb r7, [r6, 0xC]
	ldr r5, _0802DC64 @ =gHealthboxIDs
	adds r5, r7, r5
	ldrb r1, [r5]
	adds r0, r7, 0
	movs r2, 0x1
	movs r3, 0
	bl sub_8045C78
	adds r4, r0, 0
	lsls r4, 16
	lsrs r4, 16
	ldrb r0, [r5]
	bl sub_8043DFC
	lsls r4, 16
	asrs r4, 16
	movs r0, 0x1
	negs r0, r0
	cmp r4, r0
	bne _0802DC98
	movs r0, 0x21
	bl m4aSongNumStop
	movs r0, 0x64
	mov r1, r9
	muls r1, r0
	ldr r0, _0802DC68 @ =gPlayerParty
	adds r5, r1, r0
	adds r0, r5, 0
	movs r1, 0x38
	bl GetMonData
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	adds r0, r5, 0
	movs r1, 0x19
	bl GetMonData
	str r0, [sp, 0x4]
	adds r0, r5, 0
	movs r1, 0xB
	bl GetMonData
	lsls r0, 16
	lsrs r0, 16
	ldr r3, _0802DC6C @ =gExperienceTables
	adds r4, 0x1
	lsls r4, 2
	ldr r2, _0802DC70 @ =gBaseStats
	lsls r1, r0, 3
	subs r1, r0
	lsls r1, 2
	adds r1, r2
	ldrb r1, [r1, 0x13]
	movs r0, 0xCA
	lsls r0, 1
	muls r0, r1
	adds r4, r0
	adds r4, r3
	ldr r1, [r4]
	str r1, [sp]
	mov r2, r10
	lsls r0, r2, 16
	asrs r4, r0, 16
	ldr r0, [sp, 0x4]
	adds r0, r4
	cmp r0, r1
	blt _0802DC7C
	adds r0, r5, 0
	movs r1, 0x19
	mov r2, sp
	bl SetMonData
	adds r0, r5, 0
	bl CalculateMonStats
	ldr r2, [sp]
	add r0, sp, 0x4
	ldrh r0, [r0]
	subs r2, r0
	subs r2, r4, r2
	ldr r4, _0802DC74 @ =gActiveBank
	ldrb r5, [r4]
	strb r7, [r4]
	lsls r2, 16
	lsrs r2, 16
	movs r0, 0x1
	movs r1, 0xB
	bl dp01_build_cmdbuf_x21_a_bb
	strb r5, [r4]
	ldr r0, _0802DC78 @ =sub_802DCB0
	str r0, [r6]
	b _0802DC98
	.align 2, 0
_0802DC64: .4byte gHealthboxIDs
_0802DC68: .4byte gPlayerParty
_0802DC6C: .4byte gExperienceTables
_0802DC70: .4byte gBaseStats
_0802DC74: .4byte gActiveBank
_0802DC78: .4byte sub_802DCB0
_0802DC7C:
	str r0, [sp, 0x4]
	add r2, sp, 0x4
	adds r0, r5, 0
	movs r1, 0x19
	bl SetMonData
	ldr r1, _0802DCA8 @ =gBattleBankFunc
	lsls r0, r7, 2
	adds r0, r1
	ldr r1, _0802DCAC @ =sub_802D90C
	str r1, [r0]
	mov r0, r8
	bl DestroyTask
_0802DC98:
	add sp, 0x8
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_0802DCA8: .4byte gBattleBankFunc
_0802DCAC: .4byte sub_802D90C
	thumb_func_end sub_802DB6C

	thumb_func_start sub_802DCB0
sub_802DCB0: @ 802DCB0
	push {r4-r6,lr}
	lsls r0, 24
	lsrs r5, r0, 24
	ldr r1, _0802DD04 @ =gTasks
	lsls r0, r5, 2
	adds r0, r5
	lsls r0, 3
	adds r0, r1
	ldrb r4, [r0, 0xC]
	ldrb r6, [r0, 0x8]
	bl IsDoubleBattle
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _0802DCE4
	ldr r1, _0802DD08 @ =gBattlePartyID
	movs r0, 0x2
	adds r2, r4, 0
	eors r2, r0
	lsls r0, r2, 1
	adds r0, r1
	ldrh r0, [r0]
	cmp r6, r0
	bne _0802DCE4
	adds r4, r2, 0
_0802DCE4:
	adds r0, r4, 0
	adds r1, r4, 0
	adds r2, r4, 0
	movs r3, 0
	bl move_anim_start_t4
	ldr r0, _0802DD04 @ =gTasks
	lsls r1, r5, 2
	adds r1, r5
	lsls r1, 3
	adds r1, r0
	ldr r0, _0802DD0C @ =sub_802DD10
	str r0, [r1]
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_0802DD04: .4byte gTasks
_0802DD08: .4byte gBattlePartyID
_0802DD0C: .4byte sub_802DD10
	thumb_func_end sub_802DCB0

	thumb_func_start sub_802DD10
sub_802DD10: @ 802DD10
	push {r4-r7,lr}
	lsls r0, 24
	lsrs r6, r0, 24
	ldr r1, _0802DD78 @ =gTasks
	lsls r0, r6, 2
	adds r0, r6
	lsls r0, 3
	adds r2, r0, r1
	ldrb r5, [r2, 0xC]
	lsls r0, r5, 1
	adds r0, r5
	lsls r0, 2
	ldr r1, _0802DD7C @ =0x02017810
	adds r0, r1
	ldrb r1, [r0]
	movs r0, 0x40
	ands r0, r1
	cmp r0, 0
	bne _0802DDAE
	ldrb r4, [r2, 0x8]
	movs r0, 0x64
	adds r1, r4, 0
	muls r1, r0
	ldr r0, _0802DD80 @ =gPlayerParty
	adds r7, r1, r0
	adds r0, r7, 0
	movs r1, 0x38
	bl GetMonData
	bl IsDoubleBattle
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _0802DD8C
	ldr r1, _0802DD84 @ =gBattlePartyID
	movs r0, 0x2
	adds r2, r5, 0
	eors r2, r0
	lsls r0, r2, 1
	adds r0, r1
	ldrh r0, [r0]
	cmp r4, r0
	bne _0802DD8C
	ldr r0, _0802DD88 @ =gHealthboxIDs
	adds r0, r2, r0
	ldrb r0, [r0]
	adds r1, r7, 0
	movs r2, 0
	bl sub_8045A5C
	b _0802DDA0
	.align 2, 0
_0802DD78: .4byte gTasks
_0802DD7C: .4byte 0x02017810
_0802DD80: .4byte gPlayerParty
_0802DD84: .4byte gBattlePartyID
_0802DD88: .4byte gHealthboxIDs
_0802DD8C:
	ldr r0, _0802DDB4 @ =gHealthboxIDs
	adds r0, r5, r0
	ldrb r0, [r0]
	movs r1, 0x64
	muls r1, r4
	ldr r2, _0802DDB8 @ =gPlayerParty
	adds r1, r2
	movs r2, 0
	bl sub_8045A5C
_0802DDA0:
	ldr r0, _0802DDBC @ =gTasks
	lsls r1, r6, 2
	adds r1, r6
	lsls r1, 3
	adds r1, r0
	ldr r0, _0802DDC0 @ =sub_802DDC4
	str r0, [r1]
_0802DDAE:
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_0802DDB4: .4byte gHealthboxIDs
_0802DDB8: .4byte gPlayerParty
_0802DDBC: .4byte gTasks
_0802DDC0: .4byte sub_802DDC4
	thumb_func_end sub_802DD10

	thumb_func_start sub_802DDC4
sub_802DDC4: @ 802DDC4
	push {r4,r5,lr}
	adds r5, r0, 0
	lsls r5, 24
	lsrs r5, 24
	ldr r0, _0802DE00 @ =gTasks
	lsls r4, r5, 2
	adds r4, r5
	lsls r4, 3
	adds r4, r0
	ldrb r1, [r4, 0x8]
	movs r0, 0x64
	muls r0, r1
	ldr r1, _0802DE04 @ =gPlayerParty
	adds r0, r1
	movs r1, 0x38
	bl GetMonData
	ldrb r0, [r4, 0xC]
	ldr r1, _0802DE08 @ =gBattleBankFunc
	lsls r0, 2
	adds r0, r1
	ldr r1, _0802DE0C @ =sub_802D90C
	str r1, [r0]
	adds r0, r5, 0
	bl DestroyTask
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_0802DE00: .4byte gTasks
_0802DE04: .4byte gPlayerParty
_0802DE08: .4byte gBattleBankFunc
_0802DE0C: .4byte sub_802D90C
	thumb_func_end sub_802DDC4

	thumb_func_start sub_802DE10
sub_802DE10: @ 802DE10
	push {r4-r6,lr}
	ldr r6, _0802DE94 @ =gSprites
	ldr r5, _0802DE98 @ =gObjectBankIDs
	ldr r4, _0802DE9C @ =gActiveBank
	ldrb r2, [r4]
	adds r0, r2, r5
	ldrb r1, [r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r6
	movs r3, 0x22
	ldrsh r1, [r0, r3]
	movs r3, 0x26
	ldrsh r0, [r0, r3]
	adds r1, r0
	cmp r1, 0xA0
	ble _0802DE8C
	ldr r1, _0802DEA0 @ =gBattlePartyID
	lsls r0, r2, 1
	adds r0, r1
	ldrh r1, [r0]
	movs r0, 0x64
	muls r0, r1
	ldr r1, _0802DEA4 @ =gPlayerParty
	adds r0, r1
	movs r1, 0xB
	bl GetMonData
	lsls r0, 16
	lsrs r0, 16
	bl nullsub_9
	ldrb r0, [r4]
	adds r0, r5
	ldrb r1, [r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r6
	ldrb r0, [r0, 0x3]
	lsls r0, 26
	lsrs r0, 27
	bl FreeOamMatrix
	ldrb r0, [r4]
	adds r0, r5
	ldrb r1, [r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r6
	bl DestroySprite
	ldr r1, _0802DEA8 @ =gHealthboxIDs
	ldrb r0, [r4]
	adds r0, r1
	ldrb r0, [r0]
	bl sub_8043DB0
	bl PlayerBufferExecCompleted
_0802DE8C:
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_0802DE94: .4byte gSprites
_0802DE98: .4byte gObjectBankIDs
_0802DE9C: .4byte gActiveBank
_0802DEA0: .4byte gBattlePartyID
_0802DEA4: .4byte gPlayerParty
_0802DEA8: .4byte gHealthboxIDs
	thumb_func_end sub_802DE10

	thumb_func_start sub_802DEAC
sub_802DEAC: @ 802DEAC
	push {r4-r6,lr}
	ldr r6, _0802DF04 @ =gActiveBank
	ldrb r2, [r6]
	lsls r0, r2, 1
	adds r0, r2
	lsls r0, 2
	ldr r1, _0802DF08 @ =0x02017810
	adds r0, r1
	ldrb r1, [r0]
	movs r0, 0x40
	ands r0, r1
	cmp r0, 0
	bne _0802DEFC
	ldr r5, _0802DF0C @ =gObjectBankIDs
	adds r0, r2, r5
	ldrb r1, [r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	ldr r4, _0802DF10 @ =gSprites
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
	ldr r1, _0802DF14 @ =gHealthboxIDs
	ldrb r0, [r6]
	adds r0, r1
	ldrb r0, [r0]
	bl sub_8043DB0
	bl PlayerBufferExecCompleted
_0802DEFC:
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_0802DF04: .4byte gActiveBank
_0802DF08: .4byte 0x02017810
_0802DF0C: .4byte gObjectBankIDs
_0802DF10: .4byte gSprites
_0802DF14: .4byte gHealthboxIDs
	thumb_func_end sub_802DEAC

	thumb_func_start sub_802DF18
sub_802DF18: @ 802DF18
	push {lr}
	ldr r0, _0802DF2C @ =gUnknown_03004210
	ldrh r0, [r0, 0x16]
	cmp r0, 0
	bne _0802DF26
	bl PlayerBufferExecCompleted
_0802DF26:
	pop {r0}
	bx r0
	.align 2, 0
_0802DF2C: .4byte gUnknown_03004210
	thumb_func_end sub_802DF18

	thumb_func_start sub_802DF30
sub_802DF30: @ 802DF30
	push {r4,lr}
	ldr r0, _0802DF70 @ =gPaletteFade
	ldrb r1, [r0, 0x7]
	movs r0, 0x80
	ands r0, r1
	cmp r0, 0
	bne _0802DF6A
	ldr r1, _0802DF74 @ =gBattleBankFunc
	ldr r2, _0802DF78 @ =gActiveBank
	ldrb r0, [r2]
	lsls r0, 2
	adds r0, r1
	ldr r1, _0802DF7C @ =sub_802DF88
	str r1, [r0]
	ldr r3, _0802DF80 @ =gTasks
	ldr r1, _0802DF84 @ =gUnknown_0300434C
	ldrb r0, [r2]
	adds r0, r1
	ldrb r0, [r0]
	lsls r1, r0, 2
	adds r1, r0
	lsls r1, 3
	adds r1, r3
	ldrb r4, [r1, 0x8]
	bl DestroyTask
	adds r0, r4, 0
	bl sub_8094E20
_0802DF6A:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0802DF70: .4byte gPaletteFade
_0802DF74: .4byte gBattleBankFunc
_0802DF78: .4byte gActiveBank
_0802DF7C: .4byte sub_802DF88
_0802DF80: .4byte gTasks
_0802DF84: .4byte gUnknown_0300434C
	thumb_func_end sub_802DF30

	thumb_func_start sub_802DF88
sub_802DF88: @ 802DF88
	push {lr}
	ldr r0, _0802DFB8 @ =gMain
	ldr r1, [r0, 0x4]
	ldr r0, _0802DFBC @ =sub_800F808
	cmp r1, r0
	bne _0802DFF8
	ldr r0, _0802DFC0 @ =gPaletteFade
	ldrb r1, [r0, 0x7]
	movs r0, 0x80
	ands r0, r1
	cmp r0, 0
	bne _0802DFF8
	ldr r0, _0802DFC4 @ =gUnknown_0202E8F4
	ldrb r0, [r0]
	cmp r0, 0x1
	bne _0802DFD0
	ldr r0, _0802DFC8 @ =gUnknown_0202E8F5
	ldrb r1, [r0]
	ldr r2, _0802DFCC @ =gUnknown_02038470
	movs r0, 0x1
	bl dp01_build_cmdbuf_x22_a_three_bytes
	b _0802DFDA
	.align 2, 0
_0802DFB8: .4byte gMain
_0802DFBC: .4byte sub_800F808
_0802DFC0: .4byte gPaletteFade
_0802DFC4: .4byte gUnknown_0202E8F4
_0802DFC8: .4byte gUnknown_0202E8F5
_0802DFCC: .4byte gUnknown_02038470
_0802DFD0:
	movs r0, 0x1
	movs r1, 0x6
	movs r2, 0
	bl dp01_build_cmdbuf_x22_a_three_bytes
_0802DFDA:
	ldr r1, _0802DFFC @ =gBattleBufferA
	ldr r0, _0802E000 @ =gActiveBank
	ldrb r0, [r0]
	lsls r0, 9
	adds r1, 0x1
	adds r0, r1
	ldrb r1, [r0]
	movs r0, 0xF
	ands r0, r1
	cmp r0, 0x1
	bne _0802DFF4
	bl b_link_standby_message
_0802DFF4:
	bl PlayerBufferExecCompleted
_0802DFF8:
	pop {r0}
	bx r0
	.align 2, 0
_0802DFFC: .4byte gBattleBufferA
_0802E000: .4byte gActiveBank
	thumb_func_end sub_802DF88

	thumb_func_start sub_802E004
sub_802E004: @ 802E004
	push {lr}
	ldr r0, _0802E02C @ =gPaletteFade
	ldrb r1, [r0, 0x7]
	movs r0, 0x80
	ands r0, r1
	cmp r0, 0
	bne _0802E028
	ldr r1, _0802E030 @ =gBattleBankFunc
	ldr r0, _0802E034 @ =gActiveBank
	ldrb r0, [r0]
	lsls r0, 2
	adds r0, r1
	ldr r1, _0802E038 @ =sub_802E03C
	str r1, [r0]
	bl nullsub_14
	bl sub_80A6DCC
_0802E028:
	pop {r0}
	bx r0
	.align 2, 0
_0802E02C: .4byte gPaletteFade
_0802E030: .4byte gBattleBankFunc
_0802E034: .4byte gActiveBank
_0802E038: .4byte sub_802E03C
	thumb_func_end sub_802E004

	thumb_func_start sub_802E03C
sub_802E03C: @ 802E03C
	push {lr}
	ldr r0, _0802E068 @ =gMain
	ldr r1, [r0, 0x4]
	ldr r0, _0802E06C @ =sub_800F808
	cmp r1, r0
	bne _0802E062
	ldr r0, _0802E070 @ =gPaletteFade
	ldrb r1, [r0, 0x7]
	movs r0, 0x80
	ands r0, r1
	cmp r0, 0
	bne _0802E062
	ldr r0, _0802E074 @ =gScriptItemId
	ldrh r1, [r0]
	movs r0, 0x1
	bl dp01_build_cmdbuf_x23_aa_0
	bl PlayerBufferExecCompleted
_0802E062:
	pop {r0}
	bx r0
	.align 2, 0
_0802E068: .4byte gMain
_0802E06C: .4byte sub_800F808
_0802E070: .4byte gPaletteFade
_0802E074: .4byte gScriptItemId
	thumb_func_end sub_802E03C

	thumb_func_start bx_wait_t1
bx_wait_t1: @ 802E078
	push {lr}
	ldr r0, _0802E0A4 @ =gDoingBattleAnim
	ldrb r0, [r0]
	cmp r0, 0
	beq _0802E09A
	ldr r0, _0802E0A8 @ =gActiveBank
	ldrb r1, [r0]
	lsls r0, r1, 1
	adds r0, r1
	lsls r0, 2
	ldr r1, _0802E0AC @ =0x02017810
	adds r0, r1
	ldrb r1, [r0]
	movs r0, 0x40
	ands r0, r1
	cmp r0, 0
	bne _0802E09E
_0802E09A:
	bl PlayerBufferExecCompleted
_0802E09E:
	pop {r0}
	bx r0
	.align 2, 0
_0802E0A4: .4byte gDoingBattleAnim
_0802E0A8: .4byte gActiveBank
_0802E0AC: .4byte 0x02017810
	thumb_func_end bx_wait_t1

	thumb_func_start bx_blink_t1
bx_blink_t1: @ 802E0B0
	push {r4,lr}
	ldr r1, _0802E0EC @ =gObjectBankIDs
	ldr r0, _0802E0F0 @ =gActiveBank
	ldrb r0, [r0]
	adds r0, r1
	ldrb r1, [r0]
	ldr r2, _0802E0F4 @ =gSprites
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r4, r0, r2
	movs r1, 0x30
	ldrsh r0, [r4, r1]
	cmp r0, 0x20
	bne _0802E0FC
	movs r3, 0
	movs r0, 0
	strh r0, [r4, 0x30]
	adds r2, r4, 0
	adds r2, 0x3E
	ldrb r1, [r2]
	subs r0, 0x5
	ands r0, r1
	strb r0, [r2]
	ldr r0, _0802E0F8 @ =gDoingBattleAnim
	strb r3, [r0]
	bl PlayerBufferExecCompleted
	b _0802E126
	.align 2, 0
_0802E0EC: .4byte gObjectBankIDs
_0802E0F0: .4byte gActiveBank
_0802E0F4: .4byte gSprites
_0802E0F8: .4byte gDoingBattleAnim
_0802E0FC:
	ldrh r0, [r4, 0x30]
	movs r1, 0x3
	ands r0, r1
	cmp r0, 0
	bne _0802E120
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
_0802E120:
	ldrh r0, [r4, 0x30]
	adds r0, 0x1
	strh r0, [r4, 0x30]
_0802E126:
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end bx_blink_t1

	thumb_func_start sub_802E12C
sub_802E12C: @ 802E12C
	push {r4-r6,lr}
	sub sp, 0x4
	adds r6, r0, 0
	ldr r0, _0802E180 @ =gActiveBank
	ldrb r4, [r0]
	lsls r4, 9
	ldr r0, _0802E184 @ =gUnknown_02023A64
	adds r4, r0
	ldr r5, _0802E188 @ =gDisplayedStringBattle
	adds r0, r5, 0
	bl StringCopy
	lsls r0, r6, 1
	adds r4, r0
	ldrh r1, [r4]
	movs r0, 0xD
	muls r1, r0
	ldr r0, _0802E18C @ =gMoveNames
	adds r1, r0
	adds r0, r5, 0
	bl StringAppend
	ldr r4, _0802E190 @ =gUnknown_03004210
	adds r1, r5, 0
	lsls r0, r6, 2
	adds r0, r6
	lsls r0, 18
	movs r2, 0xC0
	lsls r2, 18
	adds r0, r2
	lsrs r2, r0, 16
	movs r0, 0x1
	ands r0, r6
	movs r3, 0x1
	cmp r0, 0
	beq _0802E176
	movs r3, 0xB
_0802E176:
	cmp r6, 0x1
	bgt _0802E194
	movs r0, 0x37
	b _0802E196
	.align 2, 0
_0802E180: .4byte gActiveBank
_0802E184: .4byte gUnknown_02023A64
_0802E188: .4byte gDisplayedStringBattle
_0802E18C: .4byte gMoveNames
_0802E190: .4byte gUnknown_03004210
_0802E194:
	movs r0, 0x39
_0802E196:
	str r0, [sp]
	adds r0, r4, 0
	bl InitWindow
	ldr r0, _0802E1AC @ =gUnknown_03004210
	bl sub_8002F44
	add sp, 0x4
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_0802E1AC: .4byte gUnknown_03004210
	thumb_func_end sub_802E12C

	thumb_func_start sub_802E1B0
sub_802E1B0: @ 802E1B0
	push {r4-r6,lr}
	sub sp, 0x8
	ldr r0, _0802E208 @ =gActiveBank
	ldrb r4, [r0]
	lsls r4, 9
	ldr r0, _0802E20C @ =gUnknown_02023A64
	adds r4, r0
	ldr r5, _0802E210 @ =gUnknown_03004348
	movs r0, 0
	strb r0, [r5]
	ldr r0, _0802E214 @ =gUnknown_03004210
	ldr r1, _0802E218 @ =0x00001016
	movs r2, 0x14
	str r2, [sp]
	movs r2, 0x3A
	str r2, [sp, 0x4]
	movs r2, 0x1
	movs r3, 0x37
	bl FillWindowRect
	movs r6, 0
_0802E1DA:
	lsls r0, r6, 24
	lsrs r0, 24
	bl nullsub_7
	adds r0, r6, 0
	ldr r1, _0802E21C @ =gUnknown_08400D49
	bl sub_802E12C
	ldrh r0, [r4]
	cmp r0, 0
	beq _0802E1F6
	ldrb r0, [r5]
	adds r0, 0x1
	strb r0, [r5]
_0802E1F6:
	adds r4, 0x2
	adds r6, 0x1
	cmp r6, 0x3
	ble _0802E1DA
	add sp, 0x8
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_0802E208: .4byte gActiveBank
_0802E20C: .4byte gUnknown_02023A64
_0802E210: .4byte gUnknown_03004348
_0802E214: .4byte gUnknown_03004210
_0802E218: .4byte 0x00001016
_0802E21C: .4byte gUnknown_08400D49
	thumb_func_end sub_802E1B0

	thumb_func_start sub_802E220
sub_802E220: @ 802E220
	push {r4-r6,lr}
	sub sp, 0x4
	ldr r4, _0802E2B8 @ =gBattleBufferA
	ldr r6, _0802E2BC @ =gActiveBank
	ldrb r0, [r6]
	lsls r1, r0, 9
	adds r0, r4, 0x2
	adds r0, r1, r0
	ldrb r0, [r0]
	cmp r0, 0x1
	beq _0802E2B0
	adds r4, 0x4
	adds r4, r1, r4
	ldr r2, _0802E2C0 @ =gDisplayedStringBattle
	ldr r1, _0802E2C4 @ =gUnknown_08400D49
	adds r0, r2, 0
	bl StringCopy
	adds r2, r0, 0
	movs r1, 0xFC
	strb r1, [r2]
	movs r0, 0x11
	strb r0, [r2, 0x1]
	movs r0, 0x2
	strb r0, [r2, 0x2]
	adds r2, 0x3
	strb r1, [r2]
	movs r0, 0x14
	strb r0, [r2, 0x1]
	movs r0, 0x6
	strb r0, [r2, 0x2]
	adds r2, 0x3
	ldr r5, _0802E2C8 @ =gMoveSelectionCursor
	ldrb r1, [r6]
	adds r1, r5
	adds r0, r4, 0
	adds r0, 0x8
	ldrb r1, [r1]
	adds r0, r1
	ldrb r1, [r0]
	adds r0, r2, 0
	movs r2, 0x1
	movs r3, 0x2
	bl ConvertIntToDecimalStringN
	adds r2, r0, 0
	movs r0, 0xBA
	strb r0, [r2]
	adds r2, 0x1
	ldrb r0, [r6]
	adds r0, r5
	adds r4, 0xC
	ldrb r0, [r0]
	adds r4, r0
	ldrb r1, [r4]
	adds r0, r2, 0
	movs r2, 0x1
	movs r3, 0x2
	bl ConvertIntToDecimalStringN
	ldr r4, _0802E2CC @ =gUnknown_03004210
	ldr r1, _0802E2C0 @ =gDisplayedStringBattle
	ldr r2, _0802E2D0 @ =0x000002a2
	movs r0, 0x37
	str r0, [sp]
	adds r0, r4, 0
	movs r3, 0x19
	bl InitWindow
	adds r0, r4, 0
	bl sub_8002F44
_0802E2B0:
	add sp, 0x4
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_0802E2B8: .4byte gBattleBufferA
_0802E2BC: .4byte gActiveBank
_0802E2C0: .4byte gDisplayedStringBattle
_0802E2C4: .4byte gUnknown_08400D49
_0802E2C8: .4byte gMoveSelectionCursor
_0802E2CC: .4byte gUnknown_03004210
_0802E2D0: .4byte 0x000002a2
	thumb_func_end sub_802E220

	thumb_func_start sub_802E2D4
sub_802E2D4: @ 802E2D4
	push {r4,r5,lr}
	sub sp, 0x8
	ldr r4, _0802E314 @ =gBattleBufferA
	ldr r5, _0802E318 @ =gActiveBank
	ldrb r0, [r5]
	lsls r1, r0, 9
	adds r0, r4, 0x2
	adds r0, r1, r0
	ldrb r0, [r0]
	cmp r0, 0x1
	bne _0802E328
	ldr r4, _0802E31C @ =gUnknown_03004210
	ldr r1, _0802E320 @ =0x00001016
	movs r0, 0x1C
	str r0, [sp]
	movs r0, 0x3A
	str r0, [sp, 0x4]
	adds r0, r4, 0
	movs r2, 0x17
	movs r3, 0x37
	bl FillWindowRect
	ldr r1, _0802E324 @ =gUnknown_08400D52
	movs r2, 0xA4
	lsls r2, 2
	movs r0, 0x37
	str r0, [sp]
	adds r0, r4, 0
	movs r3, 0x13
	bl InitWindow
	b _0802E388
	.align 2, 0
_0802E314: .4byte gBattleBufferA
_0802E318: .4byte gActiveBank
_0802E31C: .4byte gUnknown_03004210
_0802E320: .4byte 0x00001016
_0802E324: .4byte gUnknown_08400D52
_0802E328:
	adds r4, 0x4
	adds r4, r1, r4
	ldr r3, _0802E398 @ =gDisplayedStringBattle
	ldr r1, _0802E39C @ =gUnknown_08400D49
	adds r0, r3, 0
	bl StringCopy
	adds r3, r0, 0
	ldr r2, _0802E3A0 @ =gBattleMoves
	ldr r1, _0802E3A4 @ =gMoveSelectionCursor
	ldrb r0, [r5]
	adds r0, r1
	ldrb r0, [r0]
	lsls r0, 1
	adds r4, r0
	ldrh r1, [r4]
	lsls r0, r1, 1
	adds r0, r1
	lsls r0, 2
	adds r0, r2
	ldrb r0, [r0, 0x2]
	lsls r1, r0, 3
	subs r1, r0
	ldr r0, _0802E3A8 @ =gTypeNames
	adds r1, r0
	adds r0, r3, 0
	bl StringCopy
	ldr r4, _0802E3AC @ =gUnknown_03004210
	ldr r1, _0802E3B0 @ =0x00001016
	movs r0, 0x1C
	str r0, [sp]
	movs r0, 0x3A
	str r0, [sp, 0x4]
	adds r0, r4, 0
	movs r2, 0x17
	movs r3, 0x39
	bl FillWindowRect
	ldr r1, _0802E398 @ =gDisplayedStringBattle
	movs r2, 0xB0
	lsls r2, 2
	movs r0, 0x39
	str r0, [sp]
	adds r0, r4, 0
	movs r3, 0x17
	bl InitWindow
_0802E388:
	ldr r0, _0802E3AC @ =gUnknown_03004210
	bl sub_8002F44
	add sp, 0x8
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_0802E398: .4byte gDisplayedStringBattle
_0802E39C: .4byte gUnknown_08400D49
_0802E3A0: .4byte gBattleMoves
_0802E3A4: .4byte gMoveSelectionCursor
_0802E3A8: .4byte gTypeNames
_0802E3AC: .4byte gUnknown_03004210
_0802E3B0: .4byte 0x00001016
	thumb_func_end sub_802E2D4

	thumb_func_start sub_802E3B4
sub_802E3B4: @ 802E3B4
	push {r4,lr}
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	movs r0, 0x48
	bl sub_814A958
	ldr r1, _0802E3DC @ =gUnknown_081FAE89
	lsls r4, 1
	adds r0, r4, r1
	ldrb r0, [r0]
	adds r1, 0x1
	adds r4, r1
	ldrb r1, [r4]
	bl sub_814A880
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0802E3DC: .4byte gUnknown_081FAE89
	thumb_func_end sub_802E3B4

	thumb_func_start nullsub_7
nullsub_7: @ 802E3E0
	bx lr
	thumb_func_end nullsub_7

	thumb_func_start sub_802E3E4
sub_802E3E4: @ 802E3E4
	push {r4,lr}
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	movs r0, 0x2A
	bl sub_814A958
	ldr r1, _0802E40C @ =gUnknown_081FAE91
	lsls r4, 1
	adds r0, r4, r1
	ldrb r0, [r0]
	adds r1, 0x1
	adds r4, r1
	ldrb r1, [r4]
	bl sub_814A880
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0802E40C: .4byte gUnknown_081FAE91
	thumb_func_end sub_802E3E4

	thumb_func_start nullsub_8
nullsub_8: @ 802E410
	bx lr
	thumb_func_end nullsub_8

	thumb_func_start sub_802E414
sub_802E414: @ 802E414
	push {lr}
	ldr r0, _0802E420 @ =ReshowBattleScreenAfterMenu
	bl SetMainCallback2
	pop {r0}
	bx r0
	.align 2, 0
_0802E420: .4byte ReshowBattleScreenAfterMenu
	thumb_func_end sub_802E414

	thumb_func_start sub_802E424
sub_802E424: @ 802E424
	push {lr}
	ldr r0, _0802E430 @ =ReshowBattleScreenAfterMenu
	bl SetMainCallback2
	pop {r0}
	bx r0
	.align 2, 0
_0802E430: .4byte ReshowBattleScreenAfterMenu
	thumb_func_end sub_802E424

	thumb_func_start sub_802E434
sub_802E434: @ 802E434
	push {lr}
	ldr r0, _0802E458 @ =gActiveBank
	ldrb r1, [r0]
	lsls r0, r1, 1
	adds r0, r1
	lsls r0, 2
	ldr r1, _0802E45C @ =0x02017810
	adds r0, r1
	ldrb r1, [r0]
	movs r0, 0x10
	ands r0, r1
	cmp r0, 0
	bne _0802E452
	bl PlayerBufferExecCompleted
_0802E452:
	pop {r0}
	bx r0
	.align 2, 0
_0802E458: .4byte gActiveBank
_0802E45C: .4byte 0x02017810
	thumb_func_end sub_802E434

	thumb_func_start sub_802E460
sub_802E460: @ 802E460
	push {lr}
	ldr r0, _0802E484 @ =gActiveBank
	ldrb r1, [r0]
	lsls r0, r1, 1
	adds r0, r1
	lsls r0, 2
	ldr r1, _0802E488 @ =0x02017810
	adds r0, r1
	ldrb r1, [r0]
	movs r0, 0x20
	ands r0, r1
	cmp r0, 0
	bne _0802E47E
	bl PlayerBufferExecCompleted
_0802E47E:
	pop {r0}
	bx r0
	.align 2, 0
_0802E484: .4byte gActiveBank
_0802E488: .4byte 0x02017810
	thumb_func_end sub_802E460

	thumb_func_start b_link_standby_message
b_link_standby_message: @ 802E48C
	push {lr}
	sub sp, 0x4
	ldr r0, _0802E4BC @ =gBattleTypeFlags
	ldrh r1, [r0]
	movs r0, 0x2
	ands r0, r1
	cmp r0, 0
	beq _0802E4B6
	ldr r0, _0802E4C0 @ =gUnknown_030042A4
	movs r1, 0
	strh r1, [r0]
	ldr r0, _0802E4C4 @ =gUnknown_030042A0
	strh r1, [r0]
	ldr r0, _0802E4C8 @ =gUnknown_03004210
	ldr r1, _0802E4CC @ =gUnknown_08400CE0
	movs r2, 0xF
	str r2, [sp]
	movs r2, 0x90
	movs r3, 0x2
	bl sub_8002EB0
_0802E4B6:
	add sp, 0x4
	pop {r0}
	bx r0
	.align 2, 0
_0802E4BC: .4byte gBattleTypeFlags
_0802E4C0: .4byte gUnknown_030042A4
_0802E4C4: .4byte gUnknown_030042A0
_0802E4C8: .4byte gUnknown_03004210
_0802E4CC: .4byte gUnknown_08400CE0
	thumb_func_end b_link_standby_message

	.align 2, 0 @ Don't pad with nop.
