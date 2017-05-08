	.include "constants/gba_constants.inc"
	.include "constants/species_constants.inc"
	.include "asm/macros.inc"

	.syntax unified

	.text

	thumb_func_start sub_8040B8C
sub_8040B8C: @ 8040B8C
	push {r4,r5,lr}
	ldr r1, _08040BCC @ =byte_2024C06
	ldr r2, _08040BD0 @ =0x02000000
	ldr r3, _08040BD4 @ =0x000160c0
	adds r0, r2, r3
	ldrb r0, [r0]
	strb r0, [r1]
	ldr r5, _08040BD8 @ =gUnknown_030041C0
	movs r0, 0xFD
	strb r0, [r5]
	movs r0, 0x4
	strb r0, [r5, 0x1]
	ldr r0, _08040BDC @ =0x00016054
	adds r4, r2, r0
	ldrb r0, [r4]
	strb r0, [r5, 0x2]
	movs r0, 0xFF
	strb r0, [r5, 0x4]
	ldrb r0, [r4]
	bl battle_side_get_owner
	lsls r0, 24
	cmp r0, 0
	bne _08040BE4
	ldr r1, _08040BE0 @ =gUnknown_02024A6A
	ldrb r0, [r4]
	lsls r0, 1
	adds r0, r1
	ldrb r0, [r0]
	bl pokemon_order_func
	b _08040BEE
	.align 2, 0
_08040BCC: .4byte byte_2024C06
_08040BD0: .4byte 0x02000000
_08040BD4: .4byte 0x000160c0
_08040BD8: .4byte gUnknown_030041C0
_08040BDC: .4byte 0x00016054
_08040BE0: .4byte gUnknown_02024A6A
_08040BE4:
	ldr r0, _08040C24 @ =gUnknown_02024A6A
	ldrb r1, [r4]
	lsls r1, 1
	adds r1, r0
	ldrh r0, [r1]
_08040BEE:
	strb r0, [r5, 0x3]
	ldr r4, _08040C28 @ =gUnknown_03004290
	movs r0, 0xFD
	strb r0, [r4]
	movs r0, 0x4
	strb r0, [r4, 0x1]
	ldr r1, _08040C2C @ =gUnknown_02024E6C
	ldrb r0, [r1]
	strb r0, [r4, 0x2]
	ldr r2, _08040C24 @ =gUnknown_02024A6A
	ldrb r0, [r1]
	lsls r0, 1
	adds r0, r2
	ldrb r0, [r0]
	bl pokemon_order_func
	strb r0, [r4, 0x3]
	movs r0, 0xFF
	strb r0, [r4, 0x4]
	ldr r0, _08040C30 @ =gUnknown_083FFCCA
	ldr r1, _08040C34 @ =gStringVar4
	bl sub_8120FFC
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_08040C24: .4byte gUnknown_02024A6A
_08040C28: .4byte gUnknown_03004290
_08040C2C: .4byte gUnknown_02024E6C
_08040C30: .4byte gUnknown_083FFCCA
_08040C34: .4byte gStringVar4
	thumb_func_end sub_8040B8C

	thumb_func_start sub_8040C38
sub_8040C38: @ 8040C38
	push {r4,r5,lr}
	ldr r0, _08040C90 @ =gBattleTypeFlags
	ldrh r1, [r0]
	ldr r0, _08040C94 @ =0x00002008
	ands r0, r1
	cmp r0, 0
	bne _08040CAC
	bl Random
	lsls r0, 16
	lsrs r0, 16
	movs r1, 0x64
	bl __umodsi3
	lsls r0, 16
	lsrs r5, r0, 16
	ldr r4, _08040C98 @ =gEnemyParty
	adds r0, r4, 0
	movs r1, 0xB
	movs r2, 0
	bl GetMonData
	lsls r0, 16
	lsrs r0, 16
	ldr r2, _08040C9C @ =gBaseStats
	lsls r1, r0, 3
	subs r1, r0
	lsls r3, r1, 2
	adds r1, r3, r2
	ldrh r0, [r1, 0xC]
	ldrh r1, [r1, 0xE]
	cmp r0, r1
	beq _08040C82
	cmp r5, 0x2C
	bls _08040CAC
	cmp r5, 0x5E
	bhi _08040CA0
_08040C82:
	adds r2, 0xC
	adds r2, r3, r2
	adds r0, r4, 0
	movs r1, 0xC
	bl SetMonData
	b _08040CAC
	.align 2, 0
_08040C90: .4byte gBattleTypeFlags
_08040C94: .4byte 0x00002008
_08040C98: .4byte gEnemyParty
_08040C9C: .4byte gBaseStats
_08040CA0:
	adds r2, 0xE
	adds r2, r3, r2
	adds r0, r4, 0
	movs r1, 0xC
	bl SetMonData
_08040CAC:
	pop {r4,r5}
	pop {r0}
	bx r0
	thumb_func_end sub_8040C38

	thumb_func_start sub_8040CB4
sub_8040CB4: @ 8040CB4
	push {r4,r5,lr}
	adds r4, r0, 0
	movs r1, 0x1
	movs r2, 0
	bl GetMonData
	adds r5, r0, 0
	adds r0, r4, 0
	movs r1, 0
	movs r2, 0
	bl GetMonData
	adds r1, r0, 0
	adds r0, r5, 0
	bl sub_8040CE0
	lsls r0, 24
	lsrs r0, 24
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end sub_8040CB4

	thumb_func_start sub_8040CE0
sub_8040CE0: @ 8040CE0
	push {r4,lr}
	movs r4, 0
	lsrs r2, r0, 16
	ldr r3, _08040D04 @ =0x0000ffff
	ands r0, r3
	eors r2, r0
	lsrs r0, r1, 16
	eors r2, r0
	ands r1, r3
	eors r2, r1
	cmp r2, 0x7
	bhi _08040CFA
	movs r4, 0x1
_08040CFA:
	adds r0, r4, 0
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_08040D04: .4byte 0x0000ffff
	thumb_func_end sub_8040CE0

	thumb_func_start sub_8040D08
sub_8040D08: @ 8040D08
	push {r4,lr}
	bl GetMultiplayerId
	lsls r0, 24
	lsrs r0, 24
	ldr r4, _08040D38 @ =gLinkPlayers
	lsls r1, r0, 3
	subs r1, r0
	lsls r1, 2
	adds r1, r4
	ldrh r1, [r1, 0x18]
	movs r0, 0x2
	eors r0, r1
	bl sub_803FC34
	adds r1, r0, 0
	lsls r0, r1, 3
	subs r0, r1
	lsls r0, 2
	adds r4, 0x8
	adds r0, r4
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_08040D38: .4byte gLinkPlayers
	thumb_func_end sub_8040D08

	thumb_func_start sub_8040D3C
sub_8040D3C: @ 8040D3C
	push {r4,lr}
	adds r4, r1, 0
	lsls r0, 16
	lsrs r1, r0, 16
	adds r0, r1, 0
	lsls r2, 24
	lsrs r2, 24
	movs r3, 0
	cmp r1, 0x20
	beq _08040D54
	cmp r1, 0x1D
	bne _08040D7E
_08040D54:
	cmp r2, 0x2
	bne _08040D68
	movs r0, 0xB
	muls r1, r0
	ldr r0, _08040D64 @ =gSpeciesNames
	adds r1, r0
	b _08040D70
	.align 2, 0
_08040D64: .4byte gSpeciesNames
_08040D68:
	ldr r1, _08040D88 @ =gUnknown_08208337
	cmp r0, 0x20
	bne _08040D70
	subs r1, 0xB
_08040D70:
	adds r0, r4, 0
	bl StringCompareWithoutExtCtrlCodes
	movs r3, 0
	cmp r0, 0
	bne _08040D7E
	movs r3, 0x1
_08040D7E:
	adds r0, r3, 0
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_08040D88: .4byte gUnknown_08208337
	thumb_func_end sub_8040D3C

	thumb_func_start sub_8040D8C
sub_8040D8C: @ 8040D8C
	push {lr}
	lsls r0, 16
	lsrs r3, r0, 16
	movs r2, 0x2
	ldrb r0, [r1]
	cmp r0, 0xFC
	bne _08040DA2
	ldrb r0, [r1, 0x1]
	cmp r0, 0x15
	bne _08040DA2
	movs r2, 0x1
_08040DA2:
	adds r0, r3, 0
	bl sub_8040D3C
	pop {r1}
	bx r1
	thumb_func_end sub_8040D8C

	thumb_func_start unref_sub_8040DAC
unref_sub_8040DAC: @ 8040DAC
	push {r4-r6,lr}
	sub sp, 0xC
	adds r6, r0, 0
	movs r1, 0xB
	movs r2, 0
	bl GetMonData
	adds r5, r0, 0
	lsls r5, 16
	lsrs r5, 16
	adds r0, r6, 0
	movs r1, 0x3
	movs r2, 0
	bl GetMonData
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	adds r0, r6, 0
	movs r1, 0x2
	mov r2, sp
	bl GetMonData
	adds r0, r5, 0
	mov r1, sp
	adds r2, r4, 0
	bl sub_8040D3C
	add sp, 0xC
	pop {r4-r6}
	pop {r1}
	bx r1
	thumb_func_end unref_sub_8040DAC

	.align 2, 0 @ Don't pad with nop.
