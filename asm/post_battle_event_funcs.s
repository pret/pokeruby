	.include "constants/gba_constants.inc"
	.include "constants/species_constants.inc"
	.include "asm/macros.inc"

	.syntax unified

	.text

	thumb_func_start sub_810D180
sub_810D180: @ 810D180
	push {r4-r7,lr}
	sub sp, 0x4
	bl HealPlayerParty
	ldr r4, _0810D1A0 @ =0x00000804
	adds r0, r4, 0
	bl FlagGet
	lsls r0, 24
	lsrs r1, r0, 24
	cmp r1, 0x1
	bne _0810D1A8
	ldr r0, _0810D1A4 @ =gUnknown_02039324
	strb r1, [r0]
	b _0810D1B4
	.align 2, 0
_0810D1A0: .4byte 0x00000804
_0810D1A4: .4byte gUnknown_02039324
_0810D1A8:
	ldr r1, _0810D1E8 @ =gUnknown_02039324
	movs r0, 0
	strb r0, [r1]
	adds r0, r4, 0
	bl FlagSet
_0810D1B4:
	movs r0, 0x1
	bl GetGameStat
	cmp r0, 0
	bne _0810D1D4
	ldr r2, _0810D1EC @ =gSaveBlock2
	ldrh r1, [r2, 0xE]
	lsls r1, 16
	ldrb r0, [r2, 0x10]
	lsls r0, 8
	orrs r1, r0
	ldrb r0, [r2, 0x11]
	orrs r1, r0
	movs r0, 0x1
	bl SetGameStat
_0810D1D4:
	bl SetSecretBase2Field_9
	ldr r0, _0810D1EC @ =gSaveBlock2
	ldrb r0, [r0, 0x8]
	cmp r0, 0
	bne _0810D1F0
	movs r0, 0x1
	bl sub_80537CC
	b _0810D1F6
	.align 2, 0
_0810D1E8: .4byte gUnknown_02039324
_0810D1EC: .4byte gSaveBlock2
_0810D1F0:
	movs r0, 0x2
	bl sub_80537CC
_0810D1F6:
	movs r6, 0
	movs r5, 0
	mov r7, sp
_0810D1FC:
	movs r0, 0x64
	adds r1, r5, 0
	muls r1, r0
	ldr r0, _0810D260 @ =gPlayerParty
	adds r4, r1, r0
	adds r0, r4, 0
	movs r1, 0x5
	bl GetMonData
	cmp r0, 0
	beq _0810D23A
	adds r0, r4, 0
	movs r1, 0x6
	bl GetMonData
	cmp r0, 0
	bne _0810D23A
	adds r0, r4, 0
	movs r1, 0x43
	bl GetMonData
	cmp r0, 0
	bne _0810D23A
	movs r0, 0x1
	strb r0, [r7]
	adds r0, r4, 0
	movs r1, 0x43
	mov r2, sp
	bl SetMonData
	movs r6, 0x1
_0810D23A:
	adds r5, 0x1
	cmp r5, 0x5
	ble _0810D1FC
	cmp r6, 0x1
	bne _0810D250
	movs r0, 0x2A
	bl IncrementGameStat
	ldr r0, _0810D264 @ =0x0000083b
	bl FlagSet
_0810D250:
	ldr r0, _0810D268 @ =sub_8141F90
	bl SetMainCallback2
	movs r0, 0
	add sp, 0x4
	pop {r4-r7}
	pop {r1}
	bx r1
	.align 2, 0
_0810D260: .4byte gPlayerParty
_0810D264: .4byte 0x0000083b
_0810D268: .4byte sub_8141F90
	thumb_func_end sub_810D180

	thumb_func_start sp0C8_whiteout_maybe
sp0C8_whiteout_maybe: @ 810D26C
	push {lr}
	ldr r0, _0810D27C @ =CB2_WhiteOut
	bl SetMainCallback2
	movs r0, 0
	pop {r1}
	bx r1
	.align 2, 0
_0810D27C: .4byte CB2_WhiteOut
	thumb_func_end sp0C8_whiteout_maybe
	
	.align 2, 0 @ Don't pad with nop.
