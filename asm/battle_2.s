	.include "constants/gba_constants.inc"
	.include "asm/macros.inc"

	.syntax unified

	.text

	thumb_func_start sub_8012324
sub_8012324: @ 8012324
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	sub sp, 0x1C
	ldr r0, _08012340 @ =gBattleCommunication
	movs r1, 0
	strb r1, [r0, 0x4]
	ldr r0, _08012344 @ =gActiveBank
	strb r1, [r0]
	ldr r0, _08012348 @ =gNoOfAllBanks
	bl _08012F74
	.align 2, 0
_08012340: .4byte gBattleCommunication
_08012344: .4byte gActiveBank
_08012348: .4byte gNoOfAllBanks
_0801234C:
	ldr r4, _08012374 @ =gActiveBank
	ldrb r0, [r4]
	bl GetBankIdentity
	lsls r0, 24
	lsrs r5, r0, 24
	ldr r1, _08012378 @ =gBattleCommunication
	ldrb r0, [r4]
	adds r0, r1
	ldrb r0, [r0]
	cmp r0, 0x6
	bls _08012368
	bl _08012F66
_08012368:
	lsls r0, 2
	ldr r1, _0801237C @ =_08012380
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_08012374: .4byte gActiveBank
_08012378: .4byte gBattleCommunication
_0801237C: .4byte _08012380
	.align 2, 0
_08012380:
	.4byte _0801239C
	.4byte _080124C8
	.4byte _08012A28
	.4byte _08012DA8
	.4byte _08012E50
	.4byte _08012E94
	.4byte _08012F38
_0801239C:
	ldr r4, _08012434 @ =gSharedMem
	ldr r0, _08012438 @ =gActiveBank
	ldrb r0, [r0]
	ldr r1, _0801243C @ =0x00016068
	adds r0, r1
	adds r0, r4
	movs r1, 0x6
	strb r1, [r0]
	ldr r0, _08012440 @ =gBattleTypeFlags
	ldrh r1, [r0]
	movs r0, 0x40
	ands r0, r1
	cmp r0, 0
	bne _080123F8
	movs r1, 0x2
	movs r0, 0x2
	ands r0, r5
	cmp r0, 0
	beq _080123F8
	eors r5, r1
	adds r0, r5, 0
	bl GetBankByPlayerAI
	ldr r2, _08012444 @ =0x000160a6
	adds r1, r4, r2
	ldrb r1, [r1]
	ldr r2, _08012448 @ =gBitTable
	lsls r0, 24
	lsrs r0, 22
	adds r0, r2
	ldr r0, [r0]
	ands r1, r0
	cmp r1, 0
	bne _080123F8
	ldr r4, _0801244C @ =gBattleCommunication
	adds r0, r5, 0
	bl GetBankByPlayerAI
	lsls r0, 24
	lsrs r0, 24
	adds r0, r4
	ldrb r0, [r0]
	cmp r0, 0x4
	beq _080123F8
	bl _08012F66
_080123F8:
	ldr r0, _08012434 @ =gSharedMem
	ldr r3, _08012444 @ =0x000160a6
	adds r0, r3
	ldrb r3, [r0]
	ldr r1, _08012448 @ =gBitTable
	ldr r4, _08012438 @ =gActiveBank
	ldrb r2, [r4]
	lsls r0, r2, 2
	adds r0, r1
	ldr r0, [r0]
	ands r3, r0
	cmp r3, 0
	beq _08012468
	ldr r0, _08012450 @ =gActionForBanks
	adds r0, r2, r0
	movs r1, 0xD
	strb r1, [r0]
	ldr r0, _08012440 @ =gBattleTypeFlags
	ldrh r1, [r0]
	movs r0, 0x40
	ands r0, r1
	cmp r0, 0
	bne _08012454
	ldr r0, _0801244C @ =gBattleCommunication
	ldrb r1, [r4]
	adds r1, r0
	movs r0, 0x4
	strb r0, [r1]
	bl _08012F66
	.align 2, 0
_08012434: .4byte gSharedMem
_08012438: .4byte gActiveBank
_0801243C: .4byte 0x00016068
_08012440: .4byte gBattleTypeFlags
_08012444: .4byte 0x000160a6
_08012448: .4byte gBitTable
_0801244C: .4byte gBattleCommunication
_08012450: .4byte gActionForBanks
_08012454:
	ldr r0, _08012464 @ =gBattleCommunication
	ldrb r1, [r4]
	adds r1, r0
	movs r0, 0x3
	strb r0, [r1]
	bl _08012F66
	.align 2, 0
_08012464: .4byte gBattleCommunication
_08012468:
	ldr r1, _0801249C @ =gBattleMons
	movs r0, 0x58
	muls r0, r2
	adds r1, 0x50
	adds r0, r1
	ldr r1, [r0]
	movs r0, 0x80
	lsls r0, 5
	ands r0, r1
	cmp r0, 0
	bne _08012488
	movs r0, 0x80
	lsls r0, 15
	ands r1, r0
	cmp r1, 0
	beq _080124A8
_08012488:
	ldr r0, _080124A0 @ =gActionForBanks
	adds r0, r2, r0
	strb r3, [r0]
	ldr r1, _080124A4 @ =gBattleCommunication
	ldrb r0, [r4]
	adds r0, r1
	movs r1, 0x3
	strb r1, [r0]
	bl _08012F66
	.align 2, 0
_0801249C: .4byte gBattleMons
_080124A0: .4byte gActionForBanks
_080124A4: .4byte gBattleCommunication
_080124A8:
	ldr r0, _080124C0 @ =gActionForBanks
	ldrb r1, [r0]
	ldr r0, _080124C4 @ =gBattleBufferB
	ldrb r2, [r0, 0x1]
	ldrb r0, [r0, 0x2]
	lsls r0, 8
	orrs r2, r0
	movs r0, 0
	bl Emitcmd18
	bl _08012E32
	.align 2, 0
_080124C0: .4byte gActionForBanks
_080124C4: .4byte gBattleBufferB
_080124C8:
	ldr r4, _08012520 @ =gBattleExecBuffer
	ldr r1, _08012524 @ =gBitTable
	ldr r3, _08012528 @ =gActiveBank
	ldrb r5, [r3]
	lsls r0, r5, 2
	adds r0, r1
	ldr r2, [r0]
	lsls r0, r2, 4
	movs r1, 0xF0
	lsls r1, 24
	orrs r0, r1
	orrs r0, r2
	lsls r1, r2, 8
	orrs r0, r1
	lsls r2, 12
	orrs r0, r2
	ldr r1, [r4]
	ands r1, r0
	mov r8, r3
	cmp r1, 0
	beq _080124F6
	bl _08012F66
_080124F6:
	ldr r2, _0801252C @ =gActionForBanks
	adds r2, r5, r2
	ldr r1, _08012530 @ =gBattleBufferB
	lsls r0, r5, 9
	adds r1, 0x1
	adds r0, r1
	ldrb r0, [r0]
	strb r0, [r2]
	ldrb r0, [r3]
	lsls r0, 9
	adds r0, r1
	ldrb r0, [r0]
	cmp r0, 0xC
	bls _08012514
	b _08012968
_08012514:
	lsls r0, 2
	ldr r1, _08012534 @ =_08012538
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_08012520: .4byte gBattleExecBuffer
_08012524: .4byte gBitTable
_08012528: .4byte gActiveBank
_0801252C: .4byte gActionForBanks
_08012530: .4byte gBattleBufferB
_08012534: .4byte _08012538
	.align 2, 0
_08012538:
	.4byte _0801256C
	.4byte _080126B4
	.4byte _080126E0
	.4byte _08012968
	.4byte _08012968
	.4byte _080128B0
	.4byte _08012908
	.4byte _08012968
	.4byte _08012968
	.4byte _08012968
	.4byte _08012968
	.4byte _08012968
	.4byte _0801292C
_0801256C:
	bl AreAllMovesUnusable
	lsls r0, 24
	cmp r0, 0
	beq _080125D0
	ldr r0, _080125B4 @ =gBattleCommunication
	ldr r2, _080125B8 @ =gActiveBank
	ldrb r1, [r2]
	adds r1, r0
	movs r4, 0
	movs r0, 0x5
	strb r0, [r1]
	ldr r3, _080125BC @ =gSharedMem
	ldrb r0, [r2]
	ldr r1, _080125C0 @ =0x00016060
	adds r0, r1
	adds r0, r3
	strb r4, [r0]
	ldrb r0, [r2]
	ldr r4, _080125C4 @ =0x00016094
	adds r0, r4
	adds r0, r3
	movs r1, 0x3
	strb r1, [r0]
	ldrb r1, [r2]
	ldr r0, _080125C8 @ =0x00016010
	adds r2, r1, r0
	adds r2, r3
	ldr r0, _080125CC @ =gBattleBufferB
	lsls r1, 9
	adds r0, 0x3
	adds r1, r0
	ldrb r0, [r1]
	strb r0, [r2]
	bl _08012F90
	.align 2, 0
_080125B4: .4byte gBattleCommunication
_080125B8: .4byte gActiveBank
_080125BC: .4byte gSharedMem
_080125C0: .4byte 0x00016060
_080125C4: .4byte 0x00016094
_080125C8: .4byte 0x00016010
_080125CC: .4byte gBattleBufferB
_080125D0:
	ldr r1, _080125FC @ =gDisableStructs
	ldr r5, _08012600 @ =gActiveBank
	ldrb r4, [r5]
	lsls r0, r4, 3
	subs r0, r4
	lsls r0, 2
	adds r0, r1
	ldrh r2, [r0, 0x6]
	cmp r2, 0
	beq _0801260C
	ldr r1, _08012604 @ =gChosenMovesByBanks
	lsls r0, r4, 1
	adds r0, r1
	strh r2, [r0]
	ldr r1, _08012608 @ =gBattleCommunication
	ldrb r0, [r5]
	adds r0, r1
	movs r1, 0x3
	strb r1, [r0]
	bl _08012F90
	.align 2, 0
_080125FC: .4byte gDisableStructs
_08012600: .4byte gActiveBank
_08012604: .4byte gChosenMovesByBanks
_08012608: .4byte gBattleCommunication
_0801260C:
	add r2, sp, 0x4
	ldr r3, _080126AC @ =gBattleMons
	movs r1, 0x58
	adds r0, r4, 0
	muls r0, r1
	adds r0, r3
	ldrh r0, [r0]
	strh r0, [r2, 0x10]
	ldrb r0, [r5]
	muls r0, r1
	adds r0, r3
	adds r0, 0x21
	ldrb r0, [r0]
	strb r0, [r2, 0x12]
	ldrb r0, [r5]
	muls r0, r1
	adds r0, r3
	adds r0, 0x22
	ldrb r0, [r0]
	strb r0, [r2, 0x13]
	movs r4, 0
	mov r1, sp
	adds r1, 0xC
	str r1, [sp, 0x18]
	add r2, sp, 0x10
	mov r10, r2
	mov r8, r3
	adds r7, r5, 0
	movs r6, 0x58
	movs r3, 0xC
	add r3, r8
	mov r9, r3
	add r5, sp, 0x4
_0801264E:
	lsls r2, r4, 1
	ldrb r0, [r7]
	muls r0, r6
	adds r0, r2, r0
	add r0, r9
	ldrh r0, [r0]
	strh r0, [r5]
	ldr r0, [sp, 0x18]
	adds r3, r0, r4
	ldrb r0, [r7]
	muls r0, r6
	adds r0, r4, r0
	mov r1, r8
	adds r1, 0x24
	adds r0, r1
	ldrb r0, [r0]
	strb r0, [r3]
	ldrb r0, [r7]
	adds r1, r0, 0
	muls r1, r6
	adds r2, r1
	add r2, r9
	ldrh r0, [r2]
	add r1, r8
	adds r1, 0x3B
	ldrb r1, [r1]
	lsls r2, r4, 24
	lsrs r2, 24
	bl CalculatePPWithBonus
	mov r2, r10
	adds r1, r2, r4
	strb r0, [r1]
	adds r5, 0x2
	adds r4, 0x1
	cmp r4, 0x3
	ble _0801264E
	ldr r0, _080126B0 @ =gBattleTypeFlags
	ldrb r0, [r0]
	movs r1, 0x1
	ands r1, r0
	movs r0, 0
	movs r2, 0
	add r3, sp, 0x4
	bl Emitcmd20
	b _0801289E
	.align 2, 0
_080126AC: .4byte gBattleMons
_080126B0: .4byte gBattleTypeFlags
_080126B4:
	ldr r0, _080126D0 @ =gBattleTypeFlags
	ldrh r1, [r0]
	ldr r0, _080126D4 @ =0x00000902
	ands r0, r1
	cmp r0, 0
	bne _080126C2
	b _08012908
_080126C2:
	ldr r1, _080126D8 @ =gUnknown_02024C1C
	mov r3, r8
	ldrb r0, [r3]
	lsls r0, 2
	adds r0, r1
	ldr r1, _080126DC @ =BattleScript_ActionSelectionItemsCantBeUsed
	b _080129CC
	.align 2, 0
_080126D0: .4byte gBattleTypeFlags
_080126D4: .4byte 0x00000902
_080126D8: .4byte gUnknown_02024C1C
_080126DC: .4byte BattleScript_ActionSelectionItemsCantBeUsed
_080126E0:
	ldr r3, _08012738 @ =gSharedMem
	ldr r5, _0801273C @ =gActiveBank
	ldrb r0, [r5]
	ldr r4, _08012740 @ =0x00016064
	adds r1, r0, r4
	adds r1, r3
	ldr r2, _08012744 @ =gBattlePartyID
	lsls r0, 1
	adds r0, r2
	ldrh r0, [r0]
	strb r0, [r1]
	ldr r7, _08012748 @ =gBattleMons
	ldrb r2, [r5]
	movs r6, 0x58
	adds r0, r2, 0
	muls r0, r6
	adds r1, r7, 0
	adds r1, 0x50
	adds r0, r1
	ldr r0, [r0]
	ldr r1, _0801274C @ =0x0400e000
	ands r0, r1
	cmp r0, 0
	bne _08012722
	ldr r0, _08012750 @ =gStatuses3
	lsls r1, r2, 2
	adds r1, r0
	ldr r1, [r1]
	movs r0, 0x80
	lsls r0, 3
	ands r1, r0
	cmp r1, 0
	beq _08012758
_08012722:
	lsls r0, r2, 1
	adds r0, r2
	ldr r2, _08012754 @ =0x0001606c
	adds r1, r3, r2
	adds r0, r1
	str r0, [sp]
	movs r0, 0
	movs r1, 0x2
	movs r2, 0x6
	b _0801286C
	.align 2, 0
_08012738: .4byte gSharedMem
_0801273C: .4byte gActiveBank
_08012740: .4byte 0x00016064
_08012744: .4byte gBattlePartyID
_08012748: .4byte gBattleMons
_0801274C: .4byte 0x0400e000
_08012750: .4byte gStatuses3
_08012754: .4byte 0x0001606c
_08012758:
	str r1, [sp]
	movs r0, 0xC
	adds r1, r2, 0
	movs r2, 0x17
	movs r3, 0
	bl AbilityBattleEffects
	lsls r0, 24
	lsrs r4, r0, 24
	cmp r4, 0
	bne _080127E0
	ldrb r1, [r5]
	str r4, [sp]
	movs r0, 0xC
	movs r2, 0x47
	movs r3, 0
	bl AbilityBattleEffects
	lsls r0, 24
	lsrs r4, r0, 24
	cmp r4, 0
	beq _080127A8
	ldrb r0, [r5]
	muls r0, r6
	adds r1, r0, r7
	adds r0, r1, 0
	adds r0, 0x21
	ldrb r0, [r0]
	cmp r0, 0x2
	beq _080127A8
	adds r0, r1, 0
	adds r0, 0x22
	ldrb r0, [r0]
	cmp r0, 0x2
	beq _080127A8
	adds r0, r1, 0
	adds r0, 0x20
	ldrb r0, [r0]
	cmp r0, 0x1A
	bne _080127E0
_080127A8:
	ldr r5, _08012808 @ =gActiveBank
	ldrb r1, [r5]
	movs r0, 0
	str r0, [sp]
	movs r0, 0xF
	movs r2, 0x2A
	movs r3, 0
	bl AbilityBattleEffects
	lsls r0, 24
	lsrs r4, r0, 24
	cmp r4, 0
	beq _08012818
	ldr r2, _0801280C @ =gBattleMons
	ldrb r1, [r5]
	movs r0, 0x58
	muls r0, r1
	adds r1, r0, r2
	adds r0, r1, 0
	adds r0, 0x21
	ldrb r0, [r0]
	cmp r0, 0x8
	beq _080127E0
	adds r0, r1, 0
	adds r0, 0x22
	ldrb r0, [r0]
	cmp r0, 0x8
	bne _08012818
_080127E0:
	subs r1, r4, 0x1
	lsls r1, 4
	movs r0, 0x4
	orrs r1, r0
	lsls r1, 24
	lsrs r1, 24
	ldr r0, _08012810 @ =gLastUsedAbility
	ldrb r3, [r0]
	ldr r0, _08012808 @ =gActiveBank
	ldrb r2, [r0]
	lsls r0, r2, 1
	adds r0, r2
	ldr r2, _08012814 @ =gSharedMem + 0x1606C
	adds r0, r2
	str r0, [sp]
	movs r0, 0
	movs r2, 0x6
	bl EmitChoosePokemon
	b _0801289E
	.align 2, 0
_08012808: .4byte gActiveBank
_0801280C: .4byte gBattleMons
_08012810: .4byte gLastUsedAbility
_08012814: .4byte gSharedMem + 0x1606C
_08012818:
	ldr r0, _08012830 @ =gActiveBank
	ldrb r1, [r0]
	mov r8, r0
	cmp r1, 0x2
	bne _08012840
	ldr r0, _08012834 @ =gActionForBanks
	ldrb r0, [r0]
	cmp r0, 0x2
	bne _08012840
	ldr r3, _08012838 @ =gSharedMem
	ldr r4, _0801283C @ =0x00016068
	b _08012854
	.align 2, 0
_08012830: .4byte gActiveBank
_08012834: .4byte gActionForBanks
_08012838: .4byte gSharedMem
_0801283C: .4byte 0x00016068
_08012840:
	mov r2, r8
	ldrb r0, [r2]
	cmp r0, 0x3
	bne _08012884
	ldr r0, _08012874 @ =gActionForBanks
	ldrb r0, [r0, 0x1]
	cmp r0, 0x2
	bne _08012884
	ldr r3, _08012878 @ =gSharedMem
	ldr r4, _0801287C @ =0x00016069
_08012854:
	adds r0, r3, r4
	ldrb r2, [r0]
	mov r0, r8
	ldrb r1, [r0]
	lsls r0, r1, 1
	adds r0, r1
	ldr r1, _08012880 @ =0x0001606c
	adds r3, r1
	adds r0, r3
	str r0, [sp]
	movs r0, 0
	movs r1, 0
_0801286C:
	movs r3, 0
	bl EmitChoosePokemon
	b _0801289E
	.align 2, 0
_08012874: .4byte gActionForBanks
_08012878: .4byte gSharedMem
_0801287C: .4byte 0x00016069
_08012880: .4byte 0x0001606c
_08012884:
	ldr r0, _080128A8 @ =gActiveBank
	ldrb r1, [r0]
	lsls r0, r1, 1
	adds r0, r1
	ldr r1, _080128AC @ =gSharedMem + 0x1606C
	adds r0, r1
	str r0, [sp]
	movs r0, 0
	movs r1, 0
	movs r2, 0x6
	movs r3, 0
	bl EmitChoosePokemon
_0801289E:
	ldr r0, _080128A8 @ =gActiveBank
	ldrb r0, [r0]
	bl MarkBufferBankForExecution
	b _08012968
	.align 2, 0
_080128A8: .4byte gActiveBank
_080128AC: .4byte gSharedMem + 0x1606C
_080128B0:
	bl PlayerPartyAndPokemonStorageFull
	lsls r0, 24
	cmp r0, 0
	beq _08012968
	ldr r1, _080128EC @ =gUnknown_02024C1C
	ldr r2, _080128F0 @ =gActiveBank
	ldrb r0, [r2]
	lsls r0, 2
	adds r0, r1
	ldr r1, _080128F4 @ =BattleScript_PrintFullBox
	str r1, [r0]
	ldr r0, _080128F8 @ =gBattleCommunication
	ldrb r1, [r2]
	adds r1, r0
	movs r3, 0
	movs r0, 0x5
	strb r0, [r1]
	ldr r1, _080128FC @ =gSharedMem
	ldrb r0, [r2]
	ldr r4, _08012900 @ =0x00016060
	adds r0, r4
	adds r0, r1
	strb r3, [r0]
	ldrb r0, [r2]
	ldr r2, _08012904 @ =0x00016094
	adds r0, r2
	adds r0, r1
	strb r3, [r0]
	b _08012F90
	.align 2, 0
_080128EC: .4byte gUnknown_02024C1C
_080128F0: .4byte gActiveBank
_080128F4: .4byte BattleScript_PrintFullBox
_080128F8: .4byte gBattleCommunication
_080128FC: .4byte gSharedMem
_08012900: .4byte 0x00016060
_08012904: .4byte 0x00016094
_08012908:
	ldr r4, _08012924 @ =gActiveBank
	ldrb r0, [r4]
	lsls r1, r0, 1
	adds r1, r0
	ldr r0, _08012928 @ =gSharedMem + 0x1606C
	adds r1, r0
	movs r0, 0
	bl EmitOpenBag
	ldrb r0, [r4]
	bl MarkBufferBankForExecution
	b _08012968
	.align 2, 0
_08012924: .4byte gActiveBank
_08012928: .4byte gSharedMem + 0x1606C
_0801292C:
	ldr r4, _08012964 @ =gBattleCommunication
	mov r3, r8
	ldrb r1, [r3]
	adds r1, r4
	movs r5, 0
	movs r0, 0x6
	strb r0, [r1]
	ldrb r0, [r3]
	bl GetBankIdentity
	movs r1, 0x2
	eors r0, r1
	lsls r0, 24
	lsrs r0, 24
	bl GetBankByPlayerAI
	lsls r0, 24
	lsrs r0, 24
	adds r0, r4
	strb r5, [r0]
	movs r0, 0
	bl Emitcmd50
	mov r4, r8
	ldrb r0, [r4]
	bl MarkBufferBankForExecution
	b _08012F90
	.align 2, 0
_08012964: .4byte gBattleCommunication
_08012968:
	ldr r0, _08012994 @ =gBattleTypeFlags
	ldrh r1, [r0]
	movs r0, 0xA
	ands r0, r1
	cmp r0, 0x8
	bne _080129A8
	ldr r0, _08012998 @ =gBattleBufferB
	ldr r4, _0801299C @ =gActiveBank
	ldrb r1, [r4]
	lsls r1, 9
	adds r0, 0x1
	adds r1, r0
	ldrb r0, [r1]
	cmp r0, 0x3
	bne _080129A8
	ldr r0, _080129A0 @ =BattleScript_PrintCantRunFromTrainer
	bl b_call_bc_move_exec
	ldr r1, _080129A4 @ =gBattleCommunication
	ldrb r0, [r4]
	adds r0, r1
	b _08012BFE
	.align 2, 0
_08012994: .4byte gBattleTypeFlags
_08012998: .4byte gBattleBufferB
_0801299C: .4byte gActiveBank
_080129A0: .4byte BattleScript_PrintCantRunFromTrainer
_080129A4: .4byte gBattleCommunication
_080129A8:
	bl CanRunFromBattle
	lsls r0, 24
	cmp r0, 0
	beq _08012A14
	ldr r0, _080129F4 @ =gBattleBufferB
	ldr r3, _080129F8 @ =gActiveBank
	ldrb r2, [r3]
	lsls r1, r2, 9
	adds r0, 0x1
	adds r1, r0
	ldrb r0, [r1]
	cmp r0, 0x3
	bne _08012A14
	ldr r1, _080129FC @ =gUnknown_02024C1C
	lsls r0, r2, 2
	adds r0, r1
	ldr r1, _08012A00 @ =BattleScript_PrintCantEscapeFromBattle
_080129CC:
	str r1, [r0]
	ldr r0, _08012A04 @ =gBattleCommunication
	ldrb r1, [r3]
	adds r1, r0
	movs r2, 0
	movs r0, 0x5
	strb r0, [r1]
	ldr r1, _08012A08 @ =gSharedMem
	ldrb r0, [r3]
	ldr r4, _08012A0C @ =0x00016060
	adds r0, r4
	adds r0, r1
	strb r2, [r0]
	ldrb r0, [r3]
	ldr r3, _08012A10 @ =0x00016094
	adds r0, r3
	adds r0, r1
	strb r2, [r0]
	b _08012F90
	.align 2, 0
_080129F4: .4byte gBattleBufferB
_080129F8: .4byte gActiveBank
_080129FC: .4byte gUnknown_02024C1C
_08012A00: .4byte BattleScript_PrintCantEscapeFromBattle
_08012A04: .4byte gBattleCommunication
_08012A08: .4byte gSharedMem
_08012A0C: .4byte 0x00016060
_08012A10: .4byte 0x00016094
_08012A14:
	ldr r2, _08012A20 @ =gBattleCommunication
	ldr r0, _08012A24 @ =gActiveBank
	ldrb r1, [r0]
	adds r1, r2
	b _08012E3E
	.align 2, 0
_08012A20: .4byte gBattleCommunication
_08012A24: .4byte gActiveBank
_08012A28:
	ldr r4, _08012A6C @ =gBattleExecBuffer
	ldr r1, _08012A70 @ =gBitTable
	ldr r3, _08012A74 @ =gActiveBank
	ldrb r5, [r3]
	lsls r0, r5, 2
	adds r0, r1
	ldr r2, [r0]
	lsls r0, r2, 4
	movs r1, 0xF0
	lsls r1, 24
	orrs r0, r1
	orrs r0, r2
	lsls r1, r2, 8
	orrs r0, r1
	lsls r2, 12
	orrs r0, r2
	ldr r1, [r4]
	ands r1, r0
	mov r8, r3
	cmp r1, 0
	beq _08012A54
	b _08012F66
_08012A54:
	ldr r1, _08012A78 @ =gActionForBanks
	adds r0, r5, r1
	ldrb r0, [r0]
	adds r3, r1, 0
	cmp r0, 0x9
	bls _08012A62
	b _08012F66
_08012A62:
	lsls r0, 2
	ldr r1, _08012A7C @ =_08012A80
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_08012A6C: .4byte gBattleExecBuffer
_08012A70: .4byte gBitTable
_08012A74: .4byte gActiveBank
_08012A78: .4byte gActionForBanks
_08012A7C: .4byte _08012A80
	.align 2, 0
_08012A80:
	.4byte _08012AA8
	.4byte _08012BB0
	.4byte _08012BE8
	.4byte _08012CE0
	.4byte _08012D04
	.4byte _08012D18
	.4byte _08012D2C
	.4byte _08012D5C
	.4byte _08012D70
	.4byte _08012D94
_08012AA8:
	ldr r0, _08012AC8 @ =gBattleBufferB
	mov r1, r8
	ldrb r4, [r1]
	lsls r1, r4, 9
	adds r2, r0, 0x1
	adds r1, r2
	ldrb r1, [r1]
	adds r6, r0, 0
	cmp r1, 0x9
	bgt _08012ACC
	cmp r1, 0x3
	blt _08012ACC
	adds r0, r4, r3
	strb r1, [r0]
	b _08012F90
	.align 2, 0
_08012AC8: .4byte gBattleBufferB
_08012ACC:
	adds r3, r6, 0
	mov r5, r8
	ldrb r4, [r5]
	lsls r1, r4, 9
	adds r7, r3, 0x2
	adds r0, r1, r7
	ldrb r2, [r0]
	adds r3, 0x3
	mov r9, r3
	add r1, r9
	ldrb r0, [r1]
	lsls r0, 8
	orrs r2, r0
	ldr r0, _08012AF4 @ =0x0000ffff
	cmp r2, r0
	bne _08012AFC
	ldr r0, _08012AF8 @ =gBattleCommunication
	adds r0, r4, r0
	b _08012BFE
	.align 2, 0
_08012AF4: .4byte 0x0000ffff
_08012AF8: .4byte gBattleCommunication
_08012AFC:
	bl sub_8015894
	lsls r0, 24
	cmp r0, 0
	beq _08012B48
	ldr r0, _08012B38 @ =gBattleCommunication
	ldrb r1, [r5]
	adds r1, r0
	movs r2, 0
	movs r0, 0x5
	strb r0, [r1]
	ldr r3, _08012B3C @ =gSharedMem
	ldrb r0, [r5]
	ldr r4, _08012B40 @ =0x00016060
	adds r0, r4
	adds r0, r3
	strb r2, [r0]
	ldrb r0, [r5]
	lsls r0, 9
	adds r1, r6, 0x1
	adds r0, r1
	strb r2, [r0]
	ldrb r0, [r5]
	ldr r1, _08012B44 @ =0x00016094
	adds r0, r1
	adds r0, r3
	movs r1, 0x1
	strb r1, [r0]
	b _08012F90
	.align 2, 0
_08012B38: .4byte gBattleCommunication
_08012B3C: .4byte gSharedMem
_08012B40: .4byte 0x00016060
_08012B44: .4byte 0x00016094
_08012B48:
	ldr r6, _08012B98 @ =gSharedMem
	mov r2, r8
	ldrb r0, [r2]
	ldr r2, _08012B9C @ =0x0001608c
	adds r1, r0, r2
	adds r1, r6
	lsls r0, 9
	adds r0, r7
	ldrb r0, [r0]
	strb r0, [r1]
	ldr r0, _08012BA0 @ =gChosenMovesByBanks
	mov r4, r8
	ldrb r3, [r4]
	lsls r5, r3, 1
	adds r5, r0
	ldr r4, _08012BA4 @ =gBattleMons
	adds r2, r3, r2
	adds r2, r6
	ldrb r0, [r2]
	lsls r0, 1
	movs r1, 0x58
	muls r1, r3
	adds r0, r1
	adds r4, 0xC
	adds r0, r4
	ldrh r0, [r0]
	strh r0, [r5]
	mov r1, r8
	ldrb r0, [r1]
	ldr r2, _08012BA8 @ =0x00016010
	adds r1, r0, r2
	adds r1, r6
	lsls r0, 9
	add r0, r9
	ldrb r0, [r0]
	strb r0, [r1]
	ldr r0, _08012BAC @ =gBattleCommunication
	mov r3, r8
	ldrb r1, [r3]
	b _08012E3C
	.align 2, 0
_08012B98: .4byte gSharedMem
_08012B9C: .4byte 0x0001608c
_08012BA0: .4byte gChosenMovesByBanks
_08012BA4: .4byte gBattleMons
_08012BA8: .4byte 0x00016010
_08012BAC: .4byte gBattleCommunication
_08012BB0:
	ldr r2, _08012BD8 @ =gBattleBufferB
	ldr r5, _08012BDC @ =gActiveBank
	ldrb r4, [r5]
	lsls r1, r4, 9
	adds r0, r2, 0x1
	adds r0, r1, r0
	ldrb r3, [r0]
	adds r2, 0x2
	adds r1, r2
	ldrb r0, [r1]
	lsls r0, 8
	orrs r3, r0
	cmp r3, 0
	bne _08012BCE
	b _08012F60
_08012BCE:
	ldr r0, _08012BE0 @ =gLastUsedItem
	strh r3, [r0]
	ldr r0, _08012BE4 @ =gBattleCommunication
	ldrb r1, [r5]
	b _08012E3C
	.align 2, 0
_08012BD8: .4byte gBattleBufferB
_08012BDC: .4byte gActiveBank
_08012BE0: .4byte gLastUsedItem
_08012BE4: .4byte gBattleCommunication
_08012BE8:
	ldr r4, _08012C04 @ =gBattleBufferB
	ldr r7, _08012C08 @ =gActiveBank
	ldrb r2, [r7]
	lsls r0, r2, 9
	adds r1, r4, 0x1
	adds r0, r1
	ldrb r1, [r0]
	cmp r1, 0x6
	bne _08012C10
	ldr r0, _08012C0C @ =gBattleCommunication
	adds r0, r2, r0
_08012BFE:
	movs r1, 0
	strb r1, [r0]
	b _08012F66
	.align 2, 0
_08012C04: .4byte gBattleBufferB
_08012C08: .4byte gActiveBank
_08012C0C: .4byte gBattleCommunication
_08012C10:
	ldr r0, _08012CC4 @ =gSharedMem
	mov r12, r0
	ldr r3, _08012CC8 @ =0x00016068
	adds r0, r2, r3
	add r0, r12
	strb r1, [r0]
	ldr r0, _08012CCC @ =gBattleTypeFlags
	ldrh r1, [r0]
	movs r0, 0x40
	ands r0, r1
	cmp r0, 0
	beq _08012CBE
	ldrb r0, [r7]
	lsls r1, r0, 1
	adds r1, r0
	ldr r5, _08012CD0 @ =0x0001606c
	adds r1, r5
	add r1, r12
	ldrb r2, [r1]
	movs r0, 0xF
	ands r0, r2
	strb r0, [r1]
	ldrb r0, [r7]
	lsls r2, r0, 1
	adds r2, r0
	adds r2, r5
	add r2, r12
	lsls r0, 9
	adds r6, r4, 0x2
	adds r0, r6
	ldrb r1, [r0]
	movs r3, 0xF0
	adds r0, r3, 0
	ands r0, r1
	ldrb r1, [r2]
	orrs r0, r1
	strb r0, [r2]
	ldrb r0, [r7]
	lsls r1, r0, 1
	adds r1, r0
	ldr r2, _08012CD4 @ =0x0001606d
	adds r1, r2
	add r1, r12
	lsls r0, 9
	adds r4, 0x3
	mov r8, r4
	add r0, r8
	ldrb r0, [r0]
	strb r0, [r1]
	ldrb r0, [r7]
	movs r4, 0x2
	eors r0, r4
	lsls r1, r0, 1
	adds r1, r0
	adds r1, r5
	add r1, r12
	ldrb r2, [r1]
	adds r0, r3, 0
	ands r0, r2
	strb r0, [r1]
	ldrb r0, [r7]
	eors r0, r4
	lsls r1, r0, 1
	adds r1, r0
	adds r1, r5
	add r1, r12
	ldrb r0, [r7]
	lsls r0, 9
	adds r0, r6
	ldrb r0, [r0]
	ands r3, r0
	lsrs r3, 4
	ldrb r0, [r1]
	orrs r3, r0
	strb r3, [r1]
	ldrb r0, [r7]
	eors r4, r0
	lsls r1, r4, 1
	adds r1, r4
	ldr r3, _08012CD8 @ =0x0001606e
	adds r1, r3
	add r1, r12
	ldrb r0, [r7]
	lsls r0, 9
	add r0, r8
	ldrb r0, [r0]
	strb r0, [r1]
_08012CBE:
	ldr r0, _08012CDC @ =gBattleCommunication
	ldrb r1, [r7]
	b _08012E3C
	.align 2, 0
_08012CC4: .4byte gSharedMem
_08012CC8: .4byte 0x00016068
_08012CCC: .4byte gBattleTypeFlags
_08012CD0: .4byte 0x0001606c
_08012CD4: .4byte 0x0001606d
_08012CD8: .4byte 0x0001606e
_08012CDC: .4byte gBattleCommunication
_08012CE0:
	ldr r2, _08012CF8 @ =gHitMarker
	ldr r0, [r2]
	movs r1, 0x80
	lsls r1, 8
	orrs r0, r1
	str r0, [r2]
	ldr r2, _08012CFC @ =gBattleCommunication
	ldr r0, _08012D00 @ =gActiveBank
	ldrb r1, [r0]
	adds r1, r2
	b _08012E3E
	.align 2, 0
_08012CF8: .4byte gHitMarker
_08012CFC: .4byte gBattleCommunication
_08012D00: .4byte gActiveBank
_08012D04:
	ldr r2, _08012D10 @ =gBattleCommunication
	ldr r0, _08012D14 @ =gActiveBank
	ldrb r1, [r0]
	adds r1, r2
	b _08012E3E
	.align 2, 0
_08012D10: .4byte gBattleCommunication
_08012D14: .4byte gActiveBank
_08012D18:
	ldr r2, _08012D24 @ =gBattleCommunication
	ldr r0, _08012D28 @ =gActiveBank
	ldrb r1, [r0]
	adds r1, r2
	b _08012E3E
	.align 2, 0
_08012D24: .4byte gBattleCommunication
_08012D28: .4byte gActiveBank
_08012D2C:
	ldr r2, _08012D50 @ =gBattleBufferB
	ldr r0, _08012D54 @ =gActiveBank
	ldrb r4, [r0]
	lsls r1, r4, 9
	adds r0, r2, 0x1
	adds r0, r1, r0
	ldrb r3, [r0]
	adds r2, 0x2
	adds r1, r2
	ldrb r0, [r1]
	lsls r0, 8
	orrs r3, r0
	cmp r3, 0
	bne _08012D4A
	b _08012F60
_08012D4A:
	ldr r1, _08012D58 @ =gBattleCommunication
	adds r1, r4, r1
	b _08012E3E
	.align 2, 0
_08012D50: .4byte gBattleBufferB
_08012D54: .4byte gActiveBank
_08012D58: .4byte gBattleCommunication
_08012D5C:
	ldr r2, _08012D68 @ =gBattleCommunication
	ldr r0, _08012D6C @ =gActiveBank
	ldrb r1, [r0]
	adds r1, r2
	b _08012E3E
	.align 2, 0
_08012D68: .4byte gBattleCommunication
_08012D6C: .4byte gActiveBank
_08012D70:
	ldr r2, _08012D88 @ =gHitMarker
	ldr r0, [r2]
	movs r1, 0x80
	lsls r1, 8
	orrs r0, r1
	str r0, [r2]
	ldr r2, _08012D8C @ =gBattleCommunication
	ldr r0, _08012D90 @ =gActiveBank
	ldrb r1, [r0]
	adds r1, r2
	b _08012E3E
	.align 2, 0
_08012D88: .4byte gHitMarker
_08012D8C: .4byte gBattleCommunication
_08012D90: .4byte gActiveBank
_08012D94:
	ldr r2, _08012DA0 @ =gBattleCommunication
	ldr r0, _08012DA4 @ =gActiveBank
	ldrb r1, [r0]
	adds r1, r2
	b _08012E3E
	.align 2, 0
_08012DA0: .4byte gBattleCommunication
_08012DA4: .4byte gActiveBank
_08012DA8:
	ldr r3, _08012E10 @ =gBattleExecBuffer
	ldr r4, _08012E14 @ =gBitTable
	ldr r0, _08012E18 @ =gActiveBank
	ldrb r0, [r0]
	lsls r0, 2
	adds r0, r4
	ldr r2, [r0]
	lsls r1, r2, 4
	movs r0, 0xF0
	lsls r0, 24
	orrs r1, r0
	orrs r1, r2
	lsls r0, r2, 8
	orrs r1, r0
	lsls r2, 12
	orrs r1, r2
	ldr r0, [r3]
	ands r0, r1
	cmp r0, 0
	beq _08012DD2
	b _08012F66
_08012DD2:
	ldr r0, _08012E1C @ =gBattleTypeFlags
	ldrh r1, [r0]
	movs r0, 0x41
	ands r0, r1
	cmp r0, 0x1
	bne _08012E06
	movs r1, 0x2
	movs r0, 0x2
	ands r0, r5
	cmp r0, 0
	bne _08012E06
	adds r0, r5, 0
	eors r0, r1
	bl GetBankByPlayerAI
	ldr r1, _08012E20 @ =gSharedMem
	ldr r2, _08012E24 @ =0x000160a6
	adds r1, r2
	ldrb r1, [r1]
	lsls r0, 24
	lsrs r0, 22
	adds r0, r4
	ldr r0, [r0]
	ands r1, r0
	cmp r1, 0
	beq _08012E28
_08012E06:
	movs r0, 0
	movs r1, 0
	bl EmitLinkStandbyMsg
	b _08012E30
	.align 2, 0
_08012E10: .4byte gBattleExecBuffer
_08012E14: .4byte gBitTable
_08012E18: .4byte gActiveBank
_08012E1C: .4byte gBattleTypeFlags
_08012E20: .4byte gSharedMem
_08012E24: .4byte 0x000160a6
_08012E28:
	movs r0, 0
	movs r1, 0x1
	bl EmitLinkStandbyMsg
_08012E30:
	ldr r4, _08012E48 @ =gActiveBank
_08012E32:
	ldrb r0, [r4]
	bl MarkBufferBankForExecution
	ldr r0, _08012E4C @ =gBattleCommunication
	ldrb r1, [r4]
_08012E3C:
	adds r1, r0
_08012E3E:
	ldrb r0, [r1]
	adds r0, 0x1
	strb r0, [r1]
	b _08012F66
	.align 2, 0
_08012E48: .4byte gActiveBank
_08012E4C: .4byte gBattleCommunication
_08012E50:
	ldr r3, _08012E84 @ =gBattleExecBuffer
	ldr r1, _08012E88 @ =gBitTable
	ldr r0, _08012E8C @ =gActiveBank
	ldrb r0, [r0]
	lsls r0, 2
	adds r0, r1
	ldr r2, [r0]
	lsls r1, r2, 4
	movs r0, 0xF0
	lsls r0, 24
	orrs r1, r0
	orrs r1, r2
	lsls r0, r2, 8
	orrs r1, r0
	lsls r2, 12
	orrs r1, r2
	ldr r0, [r3]
	ands r0, r1
	cmp r0, 0
	bne _08012F66
	ldr r1, _08012E90 @ =gBattleCommunication
	ldrb r0, [r1, 0x4]
	adds r0, 0x1
	strb r0, [r1, 0x4]
	b _08012F66
	.align 2, 0
_08012E84: .4byte gBattleExecBuffer
_08012E88: .4byte gBitTable
_08012E8C: .4byte gActiveBank
_08012E90: .4byte gBattleCommunication
_08012E94:
	ldr r2, _08012EB8 @ =gSharedMem
	ldr r5, _08012EBC @ =gActiveBank
	ldrb r1, [r5]
	ldr r3, _08012EC0 @ =0x00016060
	adds r0, r1, r3
	adds r0, r2
	ldrb r0, [r0]
	cmp r0, 0
	beq _08012ECC
	ldr r0, _08012EC4 @ =gBattleCommunication
	adds r0, r1, r0
	ldr r4, _08012EC8 @ =0x00016094
	adds r1, r4
	adds r1, r2
	ldrb r1, [r1]
	strb r1, [r0]
	b _08012F66
	.align 2, 0
_08012EB8: .4byte gSharedMem
_08012EBC: .4byte gActiveBank
_08012EC0: .4byte 0x00016060
_08012EC4: .4byte gBattleCommunication
_08012EC8: .4byte 0x00016094
_08012ECC:
	ldr r0, _08012F20 @ =gBankAttacker
	strb r1, [r0]
	ldr r7, _08012F24 @ =gBattlescriptCurrInstr
	ldr r6, _08012F28 @ =gUnknown_02024C1C
	ldrb r0, [r5]
	lsls r0, 2
	adds r0, r6
	ldr r4, [r0]
	str r4, [r7]
	ldr r3, _08012F2C @ =gBattleExecBuffer
	ldr r1, _08012F30 @ =gBitTable
	ldrb r0, [r5]
	lsls r0, 2
	adds r0, r1
	ldr r2, [r0]
	lsls r1, r2, 4
	movs r0, 0xF0
	lsls r0, 24
	orrs r1, r0
	orrs r1, r2
	lsls r0, r2, 8
	orrs r1, r0
	lsls r2, 12
	orrs r1, r2
	ldr r0, [r3]
	ands r0, r1
	cmp r0, 0
	bne _08012F12
	ldr r0, _08012F34 @ =gBattleScriptingCommandsTable
	ldrb r1, [r4]
	lsls r1, 2
	adds r1, r0
	ldr r0, [r1]
	bl _call_via_r0
_08012F12:
	ldrb r0, [r5]
	lsls r0, 2
	adds r0, r6
	ldr r1, [r7]
	str r1, [r0]
	b _08012F66
	.align 2, 0
_08012F20: .4byte gBankAttacker
_08012F24: .4byte gBattlescriptCurrInstr
_08012F28: .4byte gUnknown_02024C1C
_08012F2C: .4byte gBattleExecBuffer
_08012F30: .4byte gBitTable
_08012F34: .4byte gBattleScriptingCommandsTable
_08012F38:
	ldr r3, _08012FA0 @ =gBattleExecBuffer
	ldr r1, _08012FA4 @ =gBitTable
	ldr r0, _08012FA8 @ =gActiveBank
	ldrb r4, [r0]
	lsls r0, r4, 2
	adds r0, r1
	ldr r2, [r0]
	lsls r0, r2, 4
	movs r1, 0xF0
	lsls r1, 24
	orrs r0, r1
	orrs r0, r2
	lsls r1, r2, 8
	orrs r0, r1
	lsls r2, 12
	orrs r0, r2
	ldr r3, [r3]
	ands r3, r0
	cmp r3, 0
	bne _08012F66
_08012F60:
	ldr r0, _08012FAC @ =gBattleCommunication
	adds r0, r4, r0
	strb r3, [r0]
_08012F66:
	ldr r0, _08012FA8 @ =gActiveBank
	ldrb r1, [r0]
	adds r1, 0x1
	strb r1, [r0]
	ldr r0, _08012FB0 @ =gNoOfAllBanks
	lsls r1, 24
	lsrs r1, 24
_08012F74:
	adds r2, r0, 0
	ldrb r0, [r2]
	cmp r1, r0
	bcs _08012F80
	bl _0801234C
_08012F80:
	ldr r0, _08012FAC @ =gBattleCommunication
	ldrb r0, [r0, 0x4]
	ldrb r2, [r2]
	cmp r0, r2
	bne _08012F90
	ldr r1, _08012FB4 @ =gBattleMainFunc
	ldr r0, _08012FB8 @ =sub_80133C8
	str r0, [r1]
_08012F90:
	add sp, 0x1C
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_08012FA0: .4byte gBattleExecBuffer
_08012FA4: .4byte gBitTable
_08012FA8: .4byte gActiveBank
_08012FAC: .4byte gBattleCommunication
_08012FB0: .4byte gNoOfAllBanks
_08012FB4: .4byte gBattleMainFunc
_08012FB8: .4byte sub_80133C8
	thumb_func_end sub_8012324

	thumb_func_start sub_8012FBC
sub_8012FBC: @ 8012FBC
	push {r4,r5,lr}
	lsls r0, 24
	lsrs r0, 24
	lsls r1, 24
	lsrs r1, 24
	ldr r2, _08012FE8 @ =gUnknown_02024A76
	adds r4, r0, r2
	ldrb r5, [r4]
	adds r2, r1, r2
	ldrb r3, [r2]
	strb r3, [r4]
	strb r5, [r2]
	ldr r2, _08012FEC @ =gTurnOrder
	adds r0, r2
	ldrb r5, [r0]
	adds r1, r2
	ldrb r2, [r1]
	strb r2, [r0]
	strb r5, [r1]
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_08012FE8: .4byte gUnknown_02024A76
_08012FEC: .4byte gTurnOrder
	thumb_func_end sub_8012FBC

	thumb_func_start GetWhoStrikesFirst
GetWhoStrikesFirst: @ 8012FF0
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	sub sp, 0xC
	lsls r0, 24
	lsrs r0, 24
	mov r9, r0
	lsls r1, 24
	lsrs r1, 24
	mov r10, r1
	lsls r2, 24
	lsrs r2, 24
	str r2, [sp, 0x4]
	movs r0, 0
	str r0, [sp, 0x8]
	str r0, [sp]
	movs r0, 0x13
	movs r1, 0
	movs r2, 0xD
	movs r3, 0
	bl AbilityBattleEffects
	lsls r0, 24
	cmp r0, 0
	bne _080130B8
	ldr r1, [sp, 0x8]
	str r1, [sp]
	movs r0, 0x13
	movs r1, 0
	movs r2, 0x4D
	movs r3, 0
	bl AbilityBattleEffects
	lsls r0, 24
	cmp r0, 0
	bne _080130B8
	ldr r1, _08013070 @ =gBattleMons
	movs r0, 0x58
	mov r2, r9
	muls r2, r0
	adds r0, r2, 0
	adds r0, r1
	adds r0, 0x20
	ldrb r3, [r0]
	cmp r3, 0x21
	bne _0801305C
	ldr r0, _08013074 @ =gBattleWeather
	ldrh r1, [r0]
	movs r0, 0x7
	ands r0, r1
	cmp r0, 0
	bne _0801306C
_0801305C:
	cmp r3, 0x22
	bne _08013078
	ldr r0, _08013074 @ =gBattleWeather
	ldrh r1, [r0]
	movs r0, 0x60
	ands r0, r1
	cmp r0, 0
	beq _08013078
_0801306C:
	movs r3, 0x2
	b _0801307A
	.align 2, 0
_08013070: .4byte gBattleMons
_08013074: .4byte gBattleWeather
_08013078:
	movs r3, 0x1
_0801307A:
	movs r0, 0x58
	mov r1, r10
	muls r1, r0
	adds r0, r1, 0
	ldr r2, _080130B0 @ =gBattleMons
	adds r0, r2
	adds r0, 0x20
	ldrb r2, [r0]
	cmp r2, 0x21
	bne _0801309A
	ldr r0, _080130B4 @ =gBattleWeather
	ldrh r1, [r0]
	movs r0, 0x7
	ands r0, r1
	cmp r0, 0
	bne _080130AA
_0801309A:
	cmp r2, 0x22
	bne _080130BA
	ldr r0, _080130B4 @ =gBattleWeather
	ldrh r1, [r0]
	movs r0, 0x60
	ands r0, r1
	cmp r0, 0
	beq _080130BA
_080130AA:
	movs r7, 0x2
	b _080130BC
	.align 2, 0
_080130B0: .4byte gBattleMons
_080130B4: .4byte gBattleWeather
_080130B8:
	movs r3, 0x1
_080130BA:
	movs r7, 0x1
_080130BC:
	ldr r1, _08013100 @ =gBattleMons
	movs r0, 0x58
	mov r2, r9
	muls r2, r0
	adds r0, r2, 0
	adds r4, r0, r1
	ldrh r0, [r4, 0x6]
	muls r3, r0
	ldr r2, _08013104 @ =gStatStageRatios
	movs r1, 0x1B
	ldrsb r1, [r4, r1]
	lsls r1, 1
	adds r0, r1, r2
	ldrb r0, [r0]
	muls r0, r3
	adds r2, 0x1
	adds r1, r2
	ldrb r1, [r1]
	bl __divsi3
	mov r8, r0
	ldrh r0, [r4, 0x2E]
	cmp r0, 0xAF
	bne _0801310C
	ldr r1, _08013108 @ =gEnigmaBerries
	mov r3, r9
	lsls r0, r3, 3
	subs r0, r3
	lsls r0, 2
	adds r0, r1
	ldrb r6, [r0, 0x7]
	ldrb r5, [r0, 0x1A]
	b _08013120
	.align 2, 0
_08013100: .4byte gBattleMons
_08013104: .4byte gStatStageRatios
_08013108: .4byte gEnigmaBerries
_0801310C:
	ldrh r0, [r4, 0x2E]
	bl ItemId_GetHoldEffect
	lsls r0, 24
	lsrs r6, r0, 24
	ldrh r0, [r4, 0x2E]
	bl ItemId_GetHoldEffectParam
	lsls r0, 24
	lsrs r5, r0, 24
_08013120:
	ldr r0, _080131DC @ =gBattleTypeFlags
	ldrh r1, [r0]
	movs r0, 0x2
	ands r0, r1
	cmp r0, 0
	bne _08013154
	ldr r0, _080131E0 @ =0x00000809
	bl FlagGet
	lsls r0, 24
	cmp r0, 0
	beq _08013154
	mov r0, r9
	bl GetBankSide
	lsls r0, 24
	cmp r0, 0
	bne _08013154
	movs r0, 0x6E
	mov r1, r8
	muls r1, r0
	adds r0, r1, 0
	movs r1, 0x64
	bl __udivsi3
	mov r8, r0
_08013154:
	cmp r6, 0x18
	bne _0801315E
	mov r2, r8
	lsrs r2, 1
	mov r8, r2
_0801315E:
	ldr r1, _080131E4 @ =gBattleMons
	movs r0, 0x58
	mov r3, r9
	muls r3, r0
	adds r0, r3, 0
	adds r1, 0x4C
	adds r0, r1
	ldr r0, [r0]
	movs r1, 0x40
	ands r0, r1
	cmp r0, 0
	beq _0801317C
	mov r0, r8
	lsrs r0, 2
	mov r8, r0
_0801317C:
	cmp r6, 0x1A
	bne _08013198
	ldr r0, _080131E8 @ =gRandomTurnNumber
	ldrh r4, [r0]
	lsls r0, r5, 16
	subs r0, r5
	movs r1, 0x64
	bl __divsi3
	cmp r4, r0
	bge _08013198
	movs r1, 0x1
	negs r1, r1
	mov r8, r1
_08013198:
	ldr r1, _080131E4 @ =gBattleMons
	movs r0, 0x58
	mov r2, r10
	muls r2, r0
	adds r0, r2, 0
	adds r4, r0, r1
	ldrh r0, [r4, 0x6]
	adds r3, r0, 0
	muls r3, r7
	ldr r2, _080131EC @ =gStatStageRatios
	movs r1, 0x1B
	ldrsb r1, [r4, r1]
	lsls r1, 1
	adds r0, r1, r2
	ldrb r0, [r0]
	muls r0, r3
	adds r2, 0x1
	adds r1, r2
	ldrb r1, [r1]
	bl __divsi3
	adds r7, r0, 0
	ldrh r0, [r4, 0x2E]
	cmp r0, 0xAF
	bne _080131F4
	ldr r1, _080131F0 @ =gEnigmaBerries
	mov r3, r10
	lsls r0, r3, 3
	subs r0, r3
	lsls r0, 2
	adds r0, r1
	ldrb r6, [r0, 0x7]
	ldrb r5, [r0, 0x1A]
	b _08013208
	.align 2, 0
_080131DC: .4byte gBattleTypeFlags
_080131E0: .4byte 0x00000809
_080131E4: .4byte gBattleMons
_080131E8: .4byte gRandomTurnNumber
_080131EC: .4byte gStatStageRatios
_080131F0: .4byte gEnigmaBerries
_080131F4:
	ldrh r0, [r4, 0x2E]
	bl ItemId_GetHoldEffect
	lsls r0, 24
	lsrs r6, r0, 24
	ldrh r0, [r4, 0x2E]
	bl ItemId_GetHoldEffectParam
	lsls r0, 24
	lsrs r5, r0, 24
_08013208:
	ldr r0, _08013280 @ =gBattleTypeFlags
	ldrh r1, [r0]
	movs r0, 0x2
	ands r0, r1
	cmp r0, 0
	bne _08013238
	ldr r0, _08013284 @ =0x00000809
	bl FlagGet
	lsls r0, 24
	cmp r0, 0
	beq _08013238
	mov r0, r10
	bl GetBankSide
	lsls r0, 24
	cmp r0, 0
	bne _08013238
	movs r0, 0x6E
	muls r0, r7
	movs r1, 0x64
	bl __udivsi3
	adds r7, r0, 0
_08013238:
	cmp r6, 0x18
	bne _0801323E
	lsrs r7, 1
_0801323E:
	ldr r2, _08013288 @ =gBattleMons
	movs r0, 0x58
	mov r1, r10
	muls r1, r0
	adds r0, r1, 0
	adds r1, r2, 0
	adds r1, 0x4C
	adds r0, r1
	ldr r0, [r0]
	movs r1, 0x40
	ands r0, r1
	cmp r0, 0
	beq _0801325A
	lsrs r7, 2
_0801325A:
	cmp r6, 0x1A
	bne _08013274
	ldr r0, _0801328C @ =gRandomTurnNumber
	ldrh r4, [r0]
	lsls r0, r5, 16
	subs r0, r5
	movs r1, 0x64
	bl __divsi3
	cmp r4, r0
	bge _08013274
	movs r7, 0x1
	negs r7, r7
_08013274:
	ldr r2, [sp, 0x4]
	cmp r2, 0
	beq _08013290
	movs r3, 0
	b _08013334
	.align 2, 0
_08013280: .4byte gBattleTypeFlags
_08013284: .4byte 0x00000809
_08013288: .4byte gBattleMons
_0801328C: .4byte gRandomTurnNumber
_08013290:
	ldr r0, _080132B0 @ =gActionForBanks
	mov r3, r9
	adds r1, r3, r0
	ldrb r1, [r1]
	adds r2, r0, 0
	cmp r1, 0
	bne _080132E4
	ldr r0, _080132B4 @ =gProtectStructs
	lsls r1, r3, 4
	adds r1, r0
	ldrb r0, [r1]
	lsls r0, 29
	cmp r0, 0
	bge _080132B8
	movs r3, 0xA5
	b _080132E6
	.align 2, 0
_080132B0: .4byte gActionForBanks
_080132B4: .4byte gProtectStructs
_080132B8:
	ldr r1, _080132D8 @ =gSharedMem
	ldr r0, _080132DC @ =0x0001608c
	add r0, r9
	adds r0, r1
	ldrb r0, [r0]
	lsls r0, 1
	movs r1, 0x58
	mov r3, r9
	muls r3, r1
	adds r1, r3, 0
	adds r0, r1
	ldr r1, _080132E0 @ =gBattleMons
	adds r1, 0xC
	adds r0, r1
	ldrh r3, [r0]
	b _080132E6
	.align 2, 0
_080132D8: .4byte gSharedMem
_080132DC: .4byte 0x0001608c
_080132E0: .4byte gBattleMons
_080132E4:
	movs r3, 0
_080132E6:
	mov r1, r10
	adds r0, r1, r2
	ldrb r0, [r0]
	cmp r0, 0
	bne _08013334
	ldr r0, _08013304 @ =gProtectStructs
	lsls r1, 4
	adds r1, r0
	ldrb r0, [r1]
	lsls r0, 29
	cmp r0, 0
	bge _08013308
	movs r2, 0xA5
	b _08013336
	.align 2, 0
_08013304: .4byte gProtectStructs
_08013308:
	ldr r1, _08013328 @ =gSharedMem
	ldr r0, _0801332C @ =0x0001608c
	add r0, r10
	adds r0, r1
	ldrb r0, [r0]
	lsls r0, 1
	movs r1, 0x58
	mov r2, r10
	muls r2, r1
	adds r1, r2, 0
	adds r0, r1
	ldr r1, _08013330 @ =gBattleMons
	adds r1, 0xC
	adds r0, r1
	ldrh r2, [r0]
	b _08013336
	.align 2, 0
_08013328: .4byte gSharedMem
_0801332C: .4byte 0x0001608c
_08013330: .4byte gBattleMons
_08013334:
	movs r2, 0
_08013336:
	ldr r4, _08013380 @ =gBattleMoves
	lsls r0, r3, 1
	adds r0, r3
	lsls r0, 2
	adds r0, r4
	movs r1, 0x7
	ldrsb r1, [r0, r1]
	lsls r3, r2, 1
	cmp r1, 0
	bne _0801335A
	adds r0, r3, r2
	lsls r0, 2
	adds r0, r4
	ldrb r0, [r0, 0x7]
	lsls r0, 24
	asrs r0, 24
	cmp r0, 0
	beq _08013398
_0801335A:
	adds r0, r3, r2
	lsls r0, 2
	adds r0, r4
	ldrb r0, [r0, 0x7]
	lsls r0, 24
	asrs r0, 24
	cmp r1, r0
	bne _0801338E
	cmp r8, r7
	bne _08013384
	bl Random
	movs r1, 0x1
	ands r1, r0
	cmp r1, 0
	beq _08013384
	movs r3, 0x2
	b _080133B4
	.align 2, 0
_08013380: .4byte gBattleMoves
_08013384:
	cmp r8, r7
	bcs _080133B6
	movs r0, 0x1
	str r0, [sp, 0x8]
	b _080133B6
_0801338E:
	cmp r1, r0
	bge _080133B6
	movs r1, 0x1
	str r1, [sp, 0x8]
	b _080133B6
_08013398:
	cmp r8, r7
	bne _080133AE
	bl Random
	movs r1, 0x1
	ands r1, r0
	cmp r1, 0
	beq _080133AE
	movs r2, 0x2
	str r2, [sp, 0x8]
	b _080133B6
_080133AE:
	cmp r8, r7
	bcs _080133B6
	movs r3, 0x1
_080133B4:
	str r3, [sp, 0x8]
_080133B6:
	ldr r0, [sp, 0x8]
	add sp, 0xC
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r1}
	bx r1
	thumb_func_end GetWhoStrikesFirst

	thumb_func_start sub_80133C8
sub_80133C8: @ 80133C8
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	movs r3, 0
	ldr r0, _0801341C @ =gBattleTypeFlags
	ldrh r1, [r0]
	movs r0, 0x80
	ands r0, r1
	cmp r0, 0
	beq _08013434
	ldr r0, _08013420 @ =gActiveBank
	strb r3, [r0]
	ldr r4, _08013424 @ =gNoOfAllBanks
	mov r8, r0
	ldrb r0, [r4]
	cmp r3, r0
	bcc _080133F0
	b _08013622
_080133F0:
	ldr r7, _08013428 @ =gUnknown_02024A76
	ldr r6, _0801342C @ =gActionForBanks
	mov r2, r8
	ldr r5, _08013430 @ =gTurnOrder
_080133F8:
	adds r1, r3, r7
	ldrb r0, [r2]
	adds r0, r6
	ldrb r0, [r0]
	strb r0, [r1]
	adds r1, r3, r5
	ldrb r0, [r2]
	strb r0, [r1]
	adds r3, 0x1
	ldrb r0, [r2]
	adds r0, 0x1
	strb r0, [r2]
	lsls r0, 24
	lsrs r0, 24
	ldrb r1, [r4]
	cmp r0, r1
	bcc _080133F8
	b _08013622
	.align 2, 0
_0801341C: .4byte gBattleTypeFlags
_08013420: .4byte gActiveBank
_08013424: .4byte gNoOfAllBanks
_08013428: .4byte gUnknown_02024A76
_0801342C: .4byte gActionForBanks
_08013430: .4byte gTurnOrder
_08013434:
	movs r0, 0x2
	ands r0, r1
	cmp r0, 0
	beq _08013484
	ldr r0, _08013478 @ =gActiveBank
	strb r3, [r0]
	ldr r1, _0801347C @ =gNoOfAllBanks
	mov r8, r0
	adds r2, r1, 0
	ldrb r2, [r2]
	cmp r3, r2
	bcs _08013494
	ldr r0, _08013480 @ =gActionForBanks
	ldrb r1, [r0]
	adds r4, r0, 0
	cmp r1, 0x3
	beq _08013492
_08013456:
	mov r7, r8
	ldrb r0, [r7]
	adds r0, 0x1
	strb r0, [r7]
	lsls r0, 24
	lsrs r0, 24
	ldr r1, _0801347C @ =gNoOfAllBanks
	ldrb r1, [r1]
	cmp r0, r1
	bcs _08013494
	ldrb r0, [r7]
	adds r0, r4
	ldrb r0, [r0]
	cmp r0, 0x3
	bne _08013456
	b _08013492
	.align 2, 0
_08013478: .4byte gActiveBank
_0801347C: .4byte gNoOfAllBanks
_08013480: .4byte gActionForBanks
_08013484:
	ldr r0, _080134FC @ =gActionForBanks
	ldrb r0, [r0]
	ldr r2, _08013500 @ =gActiveBank
	mov r8, r2
	cmp r0, 0x3
	bne _08013494
	strb r3, [r2]
_08013492:
	movs r3, 0x5
_08013494:
	cmp r3, 0x5
	bne _08013520
	ldr r6, _08013504 @ =gUnknown_02024A76
	ldr r1, _080134FC @ =gActionForBanks
	mov r3, r8
	ldrb r0, [r3]
	adds r0, r1
	ldrb r0, [r0]
	strb r0, [r6]
	ldr r2, _08013508 @ =gTurnOrder
	ldrb r0, [r3]
	strb r0, [r2]
	movs r3, 0x1
	movs r5, 0
	adds r4, r1, 0
	ldr r7, _0801350C @ =gBattleMainFunc
	mov r9, r7
	ldr r0, _08013510 @ =bc_80154A0
	mov r12, r0
	ldr r1, _08013514 @ =gSharedMem
	mov r10, r1
	ldr r7, _08013518 @ =gNoOfAllBanks
	ldrb r7, [r7]
	cmp r5, r7
	bge _080134EC
	adds r7, r6, 0
	adds r6, r4, 0
	adds r4, r2, 0
	ldr r2, _08013518 @ =gNoOfAllBanks
_080134CE:
	mov r0, r8
	ldrb r0, [r0]
	cmp r5, r0
	beq _080134E4
	adds r1, r3, r7
	adds r0, r5, r6
	ldrb r0, [r0]
	strb r0, [r1]
	adds r0, r3, r4
	strb r5, [r0]
	adds r3, 0x1
_080134E4:
	adds r5, 0x1
	ldrb r1, [r2]
	cmp r5, r1
	blt _080134CE
_080134EC:
	mov r2, r12
	mov r3, r9
	str r2, [r3]
	ldr r1, _0801351C @ =0x0001601d
	add r1, r10
	movs r0, 0
	strb r0, [r1]
	b _08013632
	.align 2, 0
_080134FC: .4byte gActionForBanks
_08013500: .4byte gActiveBank
_08013504: .4byte gUnknown_02024A76
_08013508: .4byte gTurnOrder
_0801350C: .4byte gBattleMainFunc
_08013510: .4byte bc_80154A0
_08013514: .4byte gSharedMem
_08013518: .4byte gNoOfAllBanks
_0801351C: .4byte 0x0001601d
_08013520:
	movs r0, 0
	mov r7, r8
	strb r0, [r7]
	ldr r1, _080135B0 @ =gNoOfAllBanks
	ldrb r0, [r1]
	cmp r0, 0
	beq _08013566
	ldr r6, _080135B4 @ =gActionForBanks
	mov r2, r8
	ldr r5, _080135B8 @ =gUnknown_02024A76
	ldr r4, _080135BC @ =gTurnOrder
_08013536:
	ldrb r0, [r2]
	adds r0, r6
	ldrb r1, [r0]
	subs r0, r1, 0x1
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bhi _08013554
	adds r0, r3, r5
	strb r1, [r0]
	adds r1, r3, r4
	mov r7, r8
	ldrb r0, [r7]
	strb r0, [r1]
	adds r3, 0x1
_08013554:
	ldrb r0, [r2]
	adds r0, 0x1
	strb r0, [r2]
	lsls r0, 24
	lsrs r0, 24
	ldr r1, _080135B0 @ =gNoOfAllBanks
	ldrb r1, [r1]
	cmp r0, r1
	bcc _08013536
_08013566:
	movs r0, 0
	mov r2, r8
	strb r0, [r2]
	ldr r7, _080135B0 @ =gNoOfAllBanks
	ldrb r0, [r7]
	cmp r0, 0
	beq _080135AA
	ldr r6, _080135B4 @ =gActionForBanks
	ldr r5, _080135B8 @ =gUnknown_02024A76
	ldr r4, _080135BC @ =gTurnOrder
_0801357A:
	ldrb r0, [r2]
	adds r0, r6
	ldrb r1, [r0]
	subs r0, r1, 0x1
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bls _08013598
	adds r0, r3, r5
	strb r1, [r0]
	adds r1, r3, r4
	mov r7, r8
	ldrb r0, [r7]
	strb r0, [r1]
	adds r3, 0x1
_08013598:
	ldrb r0, [r2]
	adds r0, 0x1
	strb r0, [r2]
	lsls r0, 24
	lsrs r0, 24
	ldr r1, _080135B0 @ =gNoOfAllBanks
	ldrb r1, [r1]
	cmp r0, r1
	bcc _0801357A
_080135AA:
	movs r5, 0
	b _08013618
	.align 2, 0
_080135B0: .4byte gNoOfAllBanks
_080135B4: .4byte gActionForBanks
_080135B8: .4byte gUnknown_02024A76
_080135BC: .4byte gTurnOrder
_080135C0:
	adds r4, r5, 0x1
	adds r7, r4, 0
	ldrb r1, [r1]
	cmp r7, r1
	bge _08013616
	ldr r6, _08013640 @ =gUnknown_02024A76
	lsls r2, r5, 24
	mov r8, r2
_080135D0:
	ldr r0, _08013644 @ =gTurnOrder
	adds r1, r5, r0
	ldrb r3, [r1]
	adds r0, r4, r0
	ldrb r1, [r0]
	adds r0, r5, r6
	ldrb r2, [r0]
	cmp r2, 0x1
	beq _0801360C
	adds r0, r4, r6
	ldrb r0, [r0]
	cmp r0, 0x1
	beq _0801360C
	cmp r2, 0x2
	beq _0801360C
	cmp r0, 0x2
	beq _0801360C
	adds r0, r3, 0
	movs r2, 0
	bl GetWhoStrikesFirst
	lsls r0, 24
	cmp r0, 0
	beq _0801360C
	lsls r1, r4, 24
	lsrs r1, 24
	mov r3, r8
	lsrs r0, r3, 24
	bl sub_8012FBC
_0801360C:
	adds r4, 0x1
	ldr r0, _08013648 @ =gNoOfAllBanks
	ldrb r0, [r0]
	cmp r4, r0
	blt _080135D0
_08013616:
	adds r5, r7, 0
_08013618:
	ldr r1, _08013648 @ =gNoOfAllBanks
	ldrb r0, [r1]
	subs r0, 0x1
	cmp r5, r0
	blt _080135C0
_08013622:
	ldr r1, _0801364C @ =gBattleMainFunc
	ldr r0, _08013650 @ =bc_80154A0
	str r0, [r1]
	ldr r0, _08013654 @ =gSharedMem
	ldr r7, _08013658 @ =0x0001601d
	adds r0, r7
	movs r1, 0
	strb r1, [r0]
_08013632:
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_08013640: .4byte gUnknown_02024A76
_08013644: .4byte gTurnOrder
_08013648: .4byte gNoOfAllBanks
_0801364C: .4byte gBattleMainFunc
_08013650: .4byte bc_80154A0
_08013654: .4byte gSharedMem
_08013658: .4byte 0x0001601d
	thumb_func_end sub_80133C8

	thumb_func_start TurnValuesCleanUp
TurnValuesCleanUp: @ 801365C
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	lsls r0, 24
	lsrs r0, 24
	mov r9, r0
	ldr r1, _080136B4 @ =gActiveBank
	movs r0, 0
	strb r0, [r1]
	ldr r0, _080136B8 @ =gNoOfAllBanks
	ldrb r2, [r0]
	adds r5, r1, 0
	cmp r2, 0
	beq _08013754
	ldr r7, _080136BC @ =gProtectStructs
	adds r6, r5, 0
	ldr r0, _080136C0 @ =gUnknown_02024AD0
	mov r12, r0
	ldr r1, _080136C4 @ =gDisableStructs
	mov r8, r1
	mov r10, r8
_0801368A:
	mov r2, r9
	cmp r2, 0
	beq _080136C8
	ldrb r1, [r6]
	lsls r1, 4
	adds r1, r7
	ldrb r2, [r1]
	movs r0, 0x2
	negs r0, r0
	ands r0, r2
	strb r0, [r1]
	ldrb r1, [r6]
	lsls r1, 4
	adds r1, r7
	ldrb r2, [r1]
	movs r0, 0x3
	negs r0, r0
	ands r0, r2
	strb r0, [r1]
	b _08013724
	.align 2, 0
_080136B4: .4byte gActiveBank
_080136B8: .4byte gNoOfAllBanks
_080136BC: .4byte gProtectStructs
_080136C0: .4byte gUnknown_02024AD0
_080136C4: .4byte gDisableStructs
_080136C8:
	ldrb r0, [r6]
	lsls r0, 4
	adds r2, r0, r7
	movs r1, 0
	mov r4, r10
	movs r3, 0
_080136D4:
	adds r0, r2, r1
	strb r3, [r0]
	adds r1, 0x1
	cmp r1, 0xF
	bls _080136D4
	ldrb r1, [r5]
	lsls r0, r1, 3
	subs r0, r1
	lsls r0, 2
	adds r1, r0, r4
	ldrb r0, [r1, 0x16]
	cmp r0, 0
	beq _080136F2
	subs r0, 0x1
	strb r0, [r1, 0x16]
_080136F2:
	ldrb r1, [r5]
	lsls r0, r1, 3
	subs r0, r1
	lsls r0, 2
	adds r1, r0, r4
	ldrb r0, [r1, 0x19]
	cmp r0, 0
	beq _08013724
	subs r0, 0x1
	strb r0, [r1, 0x19]
	ldrb r2, [r5]
	lsls r0, r2, 3
	subs r0, r2
	lsls r0, 2
	adds r0, r4
	ldrb r0, [r0, 0x19]
	cmp r0, 0
	bne _08013724
	movs r0, 0x58
	muls r2, r0
	add r2, r12
	ldr r0, [r2]
	ldr r1, _0801376C @ =0xffbfffff
	ands r0, r1
	str r0, [r2]
_08013724:
	ldrb r2, [r5]
	lsls r0, r2, 3
	subs r0, r2
	lsls r0, 2
	add r0, r8
	ldrb r0, [r0, 0xA]
	cmp r0, 0
	bne _08013742
	movs r0, 0x58
	muls r2, r0
	add r2, r12
	ldr r0, [r2]
	ldr r1, _08013770 @ =0xfeffffff
	ands r0, r1
	str r0, [r2]
_08013742:
	ldrb r0, [r5]
	adds r0, 0x1
	strb r0, [r5]
	lsls r0, 24
	lsrs r0, 24
	ldr r1, _08013774 @ =gNoOfAllBanks
	ldrb r1, [r1]
	cmp r0, r1
	bcc _0801368A
_08013754:
	movs r0, 0
	ldr r2, _08013778 @ =gSideTimer
	strb r0, [r2, 0x8]
	strb r0, [r2, 0x14]
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_0801376C: .4byte 0xffbfffff
_08013770: .4byte 0xfeffffff
_08013774: .4byte gNoOfAllBanks
_08013778: .4byte gSideTimer
	thumb_func_end TurnValuesCleanUp

	thumb_func_start SpecialStatusesClear
SpecialStatusesClear: @ 801377C
	push {r4-r6,lr}
	ldr r2, _080137C0 @ =gActiveBank
	movs r0, 0
	strb r0, [r2]
	ldr r0, _080137C4 @ =gNoOfAllBanks
	ldrb r1, [r0]
	adds r6, r0, 0
	cmp r1, 0
	beq _080137BA
	adds r3, r2, 0
	movs r4, 0
	ldr r5, _080137C8 @ =gSpecialStatuses
_08013794:
	ldrb r1, [r3]
	lsls r0, r1, 2
	adds r0, r1
	lsls r0, 2
	adds r2, r0, r5
	movs r1, 0
_080137A0:
	adds r0, r2, r1
	strb r4, [r0]
	adds r1, 0x1
	cmp r1, 0x13
	bls _080137A0
	ldrb r0, [r3]
	adds r0, 0x1
	strb r0, [r3]
	lsls r0, 24
	lsrs r0, 24
	ldrb r1, [r6]
	cmp r0, r1
	bcc _08013794
_080137BA:
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_080137C0: .4byte gActiveBank
_080137C4: .4byte gNoOfAllBanks
_080137C8: .4byte gSpecialStatuses
	thumb_func_end SpecialStatusesClear

	thumb_func_start bc_80154A0
bc_80154A0: @ 80137CC
	push {r4-r7,lr}
	ldr r0, _08013850 @ =gHitMarker
	ldr r0, [r0]
	movs r1, 0x80
	lsls r1, 8
	ands r0, r1
	cmp r0, 0
	bne _08013884
	ldr r0, _08013854 @ =gSharedMem
	ldr r1, _08013858 @ =0x0001601d
	adds r2, r0, r1
	ldr r0, _0801385C @ =gNoOfAllBanks
	ldrb r1, [r2]
	adds r7, r0, 0
	ldrb r0, [r7]
	cmp r1, r0
	bcs _08013884
	ldr r6, _08013860 @ =gActiveBank
	ldr r5, _08013864 @ =gBankAttacker
	adds r4, r2, 0
	movs r1, 0x84
	lsls r1, 1
	mov r12, r1
_080137FA:
	ldrb r0, [r4]
	strb r0, [r5]
	strb r0, [r6]
	adds r0, 0x1
	strb r0, [r4]
	ldr r1, _08013868 @ =gChosenMovesByBanks
	ldrb r3, [r6]
	lsls r0, r3, 1
	adds r0, r1
	ldrh r0, [r0]
	cmp r0, r12
	bne _0801387C
	ldr r1, _0801386C @ =gBattleMons
	movs r0, 0x58
	muls r0, r3
	adds r1, 0x4C
	adds r0, r1
	ldr r0, [r0]
	movs r1, 0x7
	ands r0, r1
	cmp r0, 0
	bne _0801387C
	ldr r2, _08013870 @ =gDisableStructs
	ldrb r1, [r5]
	lsls r0, r1, 3
	subs r0, r1
	lsls r0, 2
	adds r0, r2
	ldrb r0, [r0, 0x18]
	lsls r0, 31
	cmp r0, 0
	bne _0801387C
	ldr r0, _08013874 @ =gProtectStructs
	lsls r1, r3, 4
	adds r1, r0
	ldrb r0, [r1]
	lsls r0, 29
	cmp r0, 0
	blt _0801387C
	ldr r0, _08013878 @ =BattleScript_FocusPunchSetUp
	bl b_call_bc_move_exec
	b _080138BE
	.align 2, 0
_08013850: .4byte gHitMarker
_08013854: .4byte gSharedMem
_08013858: .4byte 0x0001601d
_0801385C: .4byte gNoOfAllBanks
_08013860: .4byte gActiveBank
_08013864: .4byte gBankAttacker
_08013868: .4byte gChosenMovesByBanks
_0801386C: .4byte gBattleMons
_08013870: .4byte gDisableStructs
_08013874: .4byte gProtectStructs
_08013878: .4byte BattleScript_FocusPunchSetUp
_0801387C:
	ldrb r0, [r4]
	ldrb r2, [r7]
	cmp r0, r2
	bcc _080137FA
_08013884:
	bl b_clear_atk_up_if_hit_flag_unless_enraged
	ldr r1, _080138C4 @ =gCurrentMoveTurn
	movs r0, 0
	strb r0, [r1]
	ldr r1, _080138C8 @ =gFightStateTracker
	ldr r0, _080138CC @ =gUnknown_02024A76
	movs r2, 0
	ldrb r0, [r0]
	strb r0, [r1]
	ldr r0, _080138D0 @ =gDynamicBasePower
	movs r3, 0
	strh r2, [r0]
	ldr r1, _080138D4 @ =gSharedMem
	ldr r2, _080138D8 @ =0x0001601c
	adds r0, r1, r2
	strb r3, [r0]
	ldr r2, _080138DC @ =gBattleMainFunc
	ldr r0, _080138E0 @ =sub_80138F0
	str r0, [r2]
	ldr r0, _080138E4 @ =gBattleCommunication
	strb r3, [r0, 0x3]
	strb r3, [r0, 0x4]
	ldr r2, _080138E8 @ =0x00016112
	adds r0, r1, r2
	strb r3, [r0]
	ldr r0, _080138EC @ =0x00017130
	adds r1, r0
	strb r3, [r1]
_080138BE:
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080138C4: .4byte gCurrentMoveTurn
_080138C8: .4byte gFightStateTracker
_080138CC: .4byte gUnknown_02024A76
_080138D0: .4byte gDynamicBasePower
_080138D4: .4byte gSharedMem
_080138D8: .4byte 0x0001601c
_080138DC: .4byte gBattleMainFunc
_080138E0: .4byte sub_80138F0
_080138E4: .4byte gBattleCommunication
_080138E8: .4byte 0x00016112
_080138EC: .4byte 0x00017130
	thumb_func_end bc_80154A0

	thumb_func_start sub_80138F0
sub_80138F0: @ 80138F0
	push {r4-r6,lr}
	ldr r6, _08013944 @ =gBattleOutcome
	ldrb r0, [r6]
	ldr r2, _08013948 @ =gFightStateTracker
	cmp r0, 0
	beq _08013900
	movs r0, 0xC
	strb r0, [r2]
_08013900:
	ldr r1, _0801394C @ =gSharedMem
	ldr r4, _08013950 @ =gCurrentMoveTurn
	ldrb r0, [r4]
	ldr r3, _08013954 @ =0x00016057
	adds r5, r1, r3
	strb r0, [r5]
	ldr r1, _08013958 @ =gUnknown_081FA640
	ldrb r0, [r2]
	lsls r0, 2
	adds r0, r1
	ldr r0, [r0]
	bl _call_via_r0
	ldr r0, _0801395C @ =gNoOfAllBanks
	ldrb r1, [r4]
	ldrb r0, [r0]
	cmp r1, r0
	bcc _08013970
	ldr r2, _08013960 @ =gHitMarker
	ldr r0, [r2]
	ldr r1, _08013964 @ =0xffefffff
	ands r0, r1
	str r0, [r2]
	ldr r3, _08013968 @ =gBattleMainFunc
	ldr r2, _0801396C @ =gUnknown_081FA678
	ldrb r1, [r6]
	movs r0, 0x7F
	ands r0, r1
	lsls r0, 2
	adds r0, r2
	ldr r0, [r0]
	str r0, [r3]
	b _08013984
	.align 2, 0
_08013944: .4byte gBattleOutcome
_08013948: .4byte gFightStateTracker
_0801394C: .4byte gSharedMem
_08013950: .4byte gCurrentMoveTurn
_08013954: .4byte 0x00016057
_08013958: .4byte gUnknown_081FA640
_0801395C: .4byte gNoOfAllBanks
_08013960: .4byte gHitMarker
_08013964: .4byte 0xffefffff
_08013968: .4byte gBattleMainFunc
_0801396C: .4byte gUnknown_081FA678
_08013970:
	ldrb r0, [r5]
	cmp r0, r1
	beq _08013984
	ldr r2, _0801398C @ =gHitMarker
	ldr r0, [r2]
	ldr r1, _08013990 @ =0xfffffdff
	ands r0, r1
	ldr r1, _08013994 @ =0xfff7ffff
	ands r0, r1
	str r0, [r2]
_08013984:
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_0801398C: .4byte gHitMarker
_08013990: .4byte 0xfffffdff
_08013994: .4byte 0xfff7ffff
	thumb_func_end sub_80138F0

	thumb_func_start sub_8013998
sub_8013998: @ 8013998
	push {r4,lr}
	ldr r1, _080139D0 @ =gFightStateTracker
	movs r0, 0
	strb r0, [r1]
	ldr r0, _080139D4 @ =gBattleTypeFlags
	ldrh r1, [r0]
	movs r0, 0x2
	ands r0, r1
	cmp r0, 0
	beq _080139EC
	ldr r1, _080139D8 @ =gBattleTextBuff1
	ldr r4, _080139DC @ =gBattleOutcome
	ldrb r0, [r4]
	strb r0, [r1]
	movs r0, 0
	bl GetBankByPlayerAI
	ldr r1, _080139E0 @ =gBankAttacker
	strb r0, [r1]
	ldr r1, _080139E4 @ =gBattlescriptCurrInstr
	ldr r0, _080139E8 @ =gUnknown_081D8E02
	str r0, [r1]
	ldrb r1, [r4]
	movs r0, 0x7F
	ands r0, r1
	strb r0, [r4]
	b _08013B48
	.align 2, 0
_080139D0: .4byte gFightStateTracker
_080139D4: .4byte gBattleTypeFlags
_080139D8: .4byte gBattleTextBuff1
_080139DC: .4byte gBattleOutcome
_080139E0: .4byte gBankAttacker
_080139E4: .4byte gBattlescriptCurrInstr
_080139E8: .4byte gUnknown_081D8E02
_080139EC:
	movs r0, 0x90
	lsls r0, 4
	ands r0, r1
	cmp r0, 0
	beq _08013A04
	ldr r1, _080139FC @ =gBattlescriptCurrInstr
	ldr r0, _08013A00 @ =gUnknown_081D8E0D
	b _08013B46
	.align 2, 0
_080139FC: .4byte gBattlescriptCurrInstr
_08013A00: .4byte gUnknown_081D8E0D
_08013A04:
	movs r0, 0xA
	ands r0, r1
	cmp r0, 0x8
	beq _08013A0E
	b _08013B42
_08013A0E:
	bl BattleMusicStop
	ldr r1, _08013A3C @ =gBattlescriptCurrInstr
	ldr r0, _08013A40 @ =BattleScript_LocalTrainerBattleWon
	str r0, [r1]
	ldr r2, _08013A44 @ =gTrainers
	ldr r0, _08013A48 @ =gTrainerBattleOpponent
	ldrh r1, [r0]
	lsls r0, r1, 2
	adds r0, r1
	lsls r0, 3
	adds r0, r2
	ldrb r0, [r0, 0x1]
	subs r0, 0x2
	cmp r0, 0x31
	bls _08013A30
	b _08013B38
_08013A30:
	lsls r0, 2
	ldr r1, _08013A4C @ =_08013A50
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_08013A3C: .4byte gBattlescriptCurrInstr
_08013A40: .4byte BattleScript_LocalTrainerBattleWon
_08013A44: .4byte gTrainers
_08013A48: .4byte gTrainerBattleOpponent
_08013A4C: .4byte _08013A50
	.align 2, 0
_08013A50:
	.4byte _08013B24
	.4byte _08013B24
	.4byte _08013B24
	.4byte _08013B38
	.4byte _08013B38
	.4byte _08013B38
	.4byte _08013B38
	.4byte _08013B38
	.4byte _08013B38
	.4byte _08013B38
	.4byte _08013B38
	.4byte _08013B38
	.4byte _08013B38
	.4byte _08013B38
	.4byte _08013B38
	.4byte _08013B38
	.4byte _08013B38
	.4byte _08013B38
	.4byte _08013B38
	.4byte _08013B38
	.4byte _08013B38
	.4byte _08013B38
	.4byte _08013B18
	.4byte _08013B2E
	.4byte _08013B38
	.4byte _08013B38
	.4byte _08013B38
	.4byte _08013B38
	.4byte _08013B38
	.4byte _08013B38
	.4byte _08013B18
	.4byte _08013B38
	.4byte _08013B38
	.4byte _08013B38
	.4byte _08013B38
	.4byte _08013B38
	.4byte _08013B38
	.4byte _08013B38
	.4byte _08013B38
	.4byte _08013B38
	.4byte _08013B38
	.4byte _08013B38
	.4byte _08013B38
	.4byte _08013B38
	.4byte _08013B38
	.4byte _08013B38
	.4byte _08013B38
	.4byte _08013B24
	.4byte _08013B24
	.4byte _08013B24
_08013B18:
	ldr r0, _08013B20 @ =0x00000163
	bl PlayBGM
	b _08013B48
	.align 2, 0
_08013B20: .4byte 0x00000163
_08013B24:
	movs r0, 0xD4
	lsls r0, 1
	bl PlayBGM
	b _08013B48
_08013B2E:
	movs r0, 0xB1
	lsls r0, 1
	bl PlayBGM
	b _08013B48
_08013B38:
	movs r0, 0xCE
	lsls r0, 1
	bl PlayBGM
	b _08013B48
_08013B42:
	ldr r1, _08013B54 @ =gBattlescriptCurrInstr
	ldr r0, _08013B58 @ =BattleScript_PayDayMoneyAndPickUpItems
_08013B46:
	str r0, [r1]
_08013B48:
	ldr r1, _08013B5C @ =gBattleMainFunc
	ldr r0, _08013B60 @ =sub_8013C9C
	str r0, [r1]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08013B54: .4byte gBattlescriptCurrInstr
_08013B58: .4byte BattleScript_PayDayMoneyAndPickUpItems
_08013B5C: .4byte gBattleMainFunc
_08013B60: .4byte sub_8013C9C
	thumb_func_end sub_8013998

	thumb_func_start sub_8013B64
sub_8013B64: @ 8013B64
	push {r4,lr}
	ldr r1, _08013B9C @ =gFightStateTracker
	movs r0, 0
	strb r0, [r1]
	ldr r0, _08013BA0 @ =gBattleTypeFlags
	ldrh r1, [r0]
	movs r0, 0x2
	ands r0, r1
	cmp r0, 0
	beq _08013BB8
	ldr r1, _08013BA4 @ =gBattleTextBuff1
	ldr r4, _08013BA8 @ =gBattleOutcome
	ldrb r0, [r4]
	strb r0, [r1]
	movs r0, 0
	bl GetBankByPlayerAI
	ldr r1, _08013BAC @ =gBankAttacker
	strb r0, [r1]
	ldr r1, _08013BB0 @ =gBattlescriptCurrInstr
	ldr r0, _08013BB4 @ =gUnknown_081D8E02
	str r0, [r1]
	ldrb r1, [r4]
	movs r0, 0x7F
	ands r0, r1
	strb r0, [r4]
	b _08013BBE
	.align 2, 0
_08013B9C: .4byte gFightStateTracker
_08013BA0: .4byte gBattleTypeFlags
_08013BA4: .4byte gBattleTextBuff1
_08013BA8: .4byte gBattleOutcome
_08013BAC: .4byte gBankAttacker
_08013BB0: .4byte gBattlescriptCurrInstr
_08013BB4: .4byte gUnknown_081D8E02
_08013BB8:
	ldr r1, _08013BCC @ =gBattlescriptCurrInstr
	ldr r0, _08013BD0 @ =BattleScript_LocalBattleLost
	str r0, [r1]
_08013BBE:
	ldr r1, _08013BD4 @ =gBattleMainFunc
	ldr r0, _08013BD8 @ =sub_8013C9C
	str r0, [r1]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08013BCC: .4byte gBattlescriptCurrInstr
_08013BD0: .4byte BattleScript_LocalBattleLost
_08013BD4: .4byte gBattleMainFunc
_08013BD8: .4byte sub_8013C9C
	thumb_func_end sub_8013B64

	thumb_func_start sub_8013BDC
sub_8013BDC: @ 8013BDC
	push {lr}
	ldr r1, _08013C04 @ =gFightStateTracker
	movs r0, 0
	strb r0, [r1]
	ldr r1, _08013C08 @ =gProtectStructs
	ldr r0, _08013C0C @ =gBankAttacker
	ldrb r0, [r0]
	lsls r0, 4
	adds r0, r1
	ldrb r0, [r0, 0x1]
	lsls r0, 27
	lsrs r0, 30
	cmp r0, 0x1
	beq _08013C18
	cmp r0, 0x2
	beq _08013C28
	ldr r1, _08013C10 @ =gBattlescriptCurrInstr
	ldr r0, _08013C14 @ =BattleScript_GotAwaySafely
	b _08013C2C
	.align 2, 0
_08013C04: .4byte gFightStateTracker
_08013C08: .4byte gProtectStructs
_08013C0C: .4byte gBankAttacker
_08013C10: .4byte gBattlescriptCurrInstr
_08013C14: .4byte BattleScript_GotAwaySafely
_08013C18:
	ldr r1, _08013C20 @ =gBattlescriptCurrInstr
	ldr r0, _08013C24 @ =BattleScript_SmokeBallEscape
	b _08013C2C
	.align 2, 0
_08013C20: .4byte gBattlescriptCurrInstr
_08013C24: .4byte BattleScript_SmokeBallEscape
_08013C28:
	ldr r1, _08013C38 @ =gBattlescriptCurrInstr
	ldr r0, _08013C3C @ =BattleScript_RanAwayUsingMonAbility
_08013C2C:
	str r0, [r1]
	ldr r1, _08013C40 @ =gBattleMainFunc
	ldr r0, _08013C44 @ =sub_8013C9C
	str r0, [r1]
	pop {r0}
	bx r0
	.align 2, 0
_08013C38: .4byte gBattlescriptCurrInstr
_08013C3C: .4byte BattleScript_RanAwayUsingMonAbility
_08013C40: .4byte gBattleMainFunc
_08013C44: .4byte sub_8013C9C
	thumb_func_end sub_8013BDC

	thumb_func_start sub_8013C48
sub_8013C48: @ 8013C48
	ldr r1, _08013C7C @ =gFightStateTracker
	movs r0, 0
	strb r0, [r1]
	ldr r1, _08013C80 @ =gBattleTextBuff1
	movs r0, 0xFD
	strb r0, [r1]
	movs r0, 0x7
	strb r0, [r1, 0x1]
	ldr r2, _08013C84 @ =gBankAttacker
	ldrb r0, [r2]
	strb r0, [r1, 0x2]
	ldr r3, _08013C88 @ =gBattlePartyID
	ldrb r0, [r2]
	lsls r0, 1
	adds r0, r3
	ldrh r0, [r0]
	strb r0, [r1, 0x3]
	movs r0, 0xFF
	strb r0, [r1, 0x4]
	ldr r1, _08013C8C @ =gBattlescriptCurrInstr
	ldr r0, _08013C90 @ =BattleScript_WildMonFled
	str r0, [r1]
	ldr r1, _08013C94 @ =gBattleMainFunc
	ldr r0, _08013C98 @ =sub_8013C9C
	str r0, [r1]
	bx lr
	.align 2, 0
_08013C7C: .4byte gFightStateTracker
_08013C80: .4byte gBattleTextBuff1
_08013C84: .4byte gBankAttacker
_08013C88: .4byte gBattlePartyID
_08013C8C: .4byte gBattlescriptCurrInstr
_08013C90: .4byte BattleScript_WildMonFled
_08013C94: .4byte gBattleMainFunc
_08013C98: .4byte sub_8013C9C
	thumb_func_end sub_8013C48

	thumb_func_start sub_8013C9C
sub_8013C9C: @ 8013C9C
	push {r4-r7,lr}
	ldr r0, _08013D00 @ =gFightStateTracker
	ldrb r0, [r0]
	subs r0, 0xB
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bhi _08013D7C
	ldr r0, _08013D04 @ =gBattleTypeFlags
	ldrh r0, [r0]
	ldr r1, _08013D08 @ =0x00000b92
	ands r1, r0
	cmp r1, 0
	bne _08013D4C
	ldr r2, _08013D0C @ =gActiveBank
	strb r1, [r2]
	ldr r0, _08013D10 @ =gNoOfAllBanks
	ldrb r0, [r0]
	cmp r1, r0
	bcs _08013D48
	adds r4, r2, 0
	ldr r6, _08013D14 @ =gBattleMons
	movs r5, 0x58
	adds r7, r6, 0
	adds r7, 0x30
_08013CCE:
	ldrb r0, [r4]
	bl GetBankSide
	lsls r0, 24
	cmp r0, 0
	bne _08013D36
	ldr r2, _08013D18 @ =gBattleResults
	ldrh r0, [r2, 0x6]
	cmp r0, 0
	bne _08013D1C
	ldrb r0, [r4]
	muls r0, r5
	adds r0, r6
	ldrh r0, [r0]
	strh r0, [r2, 0x6]
	ldrb r0, [r4]
	adds r1, r0, 0
	muls r1, r5
	adds r1, r7
	adds r0, r2, 0
	adds r0, 0x8
	bl StringCopy
	b _08013D36
	.align 2, 0
_08013D00: .4byte gFightStateTracker
_08013D04: .4byte gBattleTypeFlags
_08013D08: .4byte 0x00000b92
_08013D0C: .4byte gActiveBank
_08013D10: .4byte gNoOfAllBanks
_08013D14: .4byte gBattleMons
_08013D18: .4byte gBattleResults
_08013D1C:
	ldrb r0, [r4]
	muls r0, r5
	adds r0, r6
	ldrh r0, [r0]
	strh r0, [r2, 0x26]
	ldrb r0, [r4]
	adds r1, r0, 0
	muls r1, r5
	adds r1, r7
	adds r0, r2, 0
	adds r0, 0x14
	bl StringCopy
_08013D36:
	ldrb r0, [r4]
	adds r0, 0x1
	strb r0, [r4]
	ldr r1, _08013D68 @ =gNoOfAllBanks
	lsls r0, 24
	lsrs r0, 24
	ldrb r1, [r1]
	cmp r0, r1
	bcc _08013CCE
_08013D48:
	bl sub_80BDEC8
_08013D4C:
	movs r0, 0x3
	bl BeginFastPaletteFade
	movs r0, 0x5
	bl FadeOutMapMusic
	ldr r1, _08013D6C @ =gBattleMainFunc
	ldr r0, _08013D70 @ =sub_8013DA8
	str r0, [r1]
	ldr r1, _08013D74 @ =gCB2_AfterEvolution
	ldr r0, _08013D78 @ =sub_800F808
	str r0, [r1]
	b _08013D96
	.align 2, 0
_08013D68: .4byte gNoOfAllBanks
_08013D6C: .4byte gBattleMainFunc
_08013D70: .4byte sub_8013DA8
_08013D74: .4byte gCB2_AfterEvolution
_08013D78: .4byte sub_800F808
_08013D7C:
	ldr r0, _08013D9C @ =gBattleExecBuffer
	ldr r0, [r0]
	cmp r0, 0
	bne _08013D96
	ldr r1, _08013DA0 @ =gBattleScriptingCommandsTable
	ldr r0, _08013DA4 @ =gBattlescriptCurrInstr
	ldr r0, [r0]
	ldrb r0, [r0]
	lsls r0, 2
	adds r0, r1
	ldr r0, [r0]
	bl _call_via_r0
_08013D96:
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_08013D9C: .4byte gBattleExecBuffer
_08013DA0: .4byte gBattleScriptingCommandsTable
_08013DA4: .4byte gBattlescriptCurrInstr
	thumb_func_end sub_8013C9C

	thumb_func_start sub_8013DA8
sub_8013DA8: @ 8013DA8
	push {lr}
	ldr r0, _08013DD0 @ =gPaletteFade
	ldrb r1, [r0, 0x7]
	movs r0, 0x80
	ands r0, r1
	cmp r0, 0
	bne _08013DEA
	bl ResetSpriteData
	ldr r0, _08013DD4 @ =gLeveledUpInBattle
	ldrb r0, [r0]
	cmp r0, 0
	beq _08013DCA
	ldr r0, _08013DD8 @ =gBattleOutcome
	ldrb r0, [r0]
	cmp r0, 0x1
	beq _08013DE4
_08013DCA:
	ldr r1, _08013DDC @ =gBattleMainFunc
	ldr r0, _08013DE0 @ =c4_overworld
	b _08013DE8
	.align 2, 0
_08013DD0: .4byte gPaletteFade
_08013DD4: .4byte gLeveledUpInBattle
_08013DD8: .4byte gBattleOutcome
_08013DDC: .4byte gBattleMainFunc
_08013DE0: .4byte c4_overworld
_08013DE4:
	ldr r1, _08013DF0 @ =gBattleMainFunc
	ldr r0, _08013DF4 @ =bc_evolution_cutscene
_08013DE8:
	str r0, [r1]
_08013DEA:
	pop {r0}
	bx r0
	.align 2, 0
_08013DF0: .4byte gBattleMainFunc
_08013DF4: .4byte bc_evolution_cutscene
	thumb_func_end sub_8013DA8

	thumb_func_start bc_evolution_cutscene
bc_evolution_cutscene: @ 8013DF8
	push {r4,r5,lr}
	ldr r0, _08013E4C @ =gLeveledUpInBattle
	ldrb r1, [r0]
	adds r3, r0, 0
	cmp r1, 0
	beq _08013E6E
_08013E04:
	movs r5, 0
_08013E06:
	ldrb r2, [r3]
	ldr r0, _08013E50 @ =gBitTable
	lsls r1, r5, 2
	adds r1, r0
	ldr r1, [r1]
	adds r0, r2, 0
	ands r0, r1
	cmp r0, 0
	beq _08013E60
	bics r2, r1
	strb r2, [r3]
	movs r0, 0x64
	adds r1, r5, 0
	muls r1, r0
	ldr r0, _08013E54 @ =gPlayerParty
	adds r4, r1, r0
	adds r0, r4, 0
	movs r1, 0
	bl GetEvolutionTargetSpecies
	lsls r0, 16
	lsrs r2, r0, 16
	cmp r2, 0
	beq _08013E60
	ldr r0, _08013E58 @ =gBattleMainFunc
	ldr r1, _08013E5C @ =sub_8013E88
	str r1, [r0]
	lsls r3, r5, 24
	lsrs r3, 24
	adds r0, r4, 0
	adds r1, r2, 0
	movs r2, 0x81
	bl EvolutionScene
	b _08013E74
	.align 2, 0
_08013E4C: .4byte gLeveledUpInBattle
_08013E50: .4byte gBitTable
_08013E54: .4byte gPlayerParty
_08013E58: .4byte gBattleMainFunc
_08013E5C: .4byte sub_8013E88
_08013E60:
	adds r5, 0x1
	ldr r3, _08013E7C @ =gLeveledUpInBattle
	cmp r5, 0x5
	ble _08013E06
	ldrb r0, [r3]
	cmp r0, 0
	bne _08013E04
_08013E6E:
	ldr r1, _08013E80 @ =gBattleMainFunc
	ldr r0, _08013E84 @ =c4_overworld
	str r0, [r1]
_08013E74:
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_08013E7C: .4byte gLeveledUpInBattle
_08013E80: .4byte gBattleMainFunc
_08013E84: .4byte c4_overworld
	thumb_func_end bc_evolution_cutscene

	thumb_func_start sub_8013E88
sub_8013E88: @ 8013E88
	push {lr}
	ldr r0, _08013EA0 @ =gMain
	ldr r1, [r0, 0x4]
	ldr r0, _08013EA4 @ =sub_800F808
	cmp r1, r0
	bne _08013E9A
	ldr r1, _08013EA8 @ =gBattleMainFunc
	ldr r0, _08013EAC @ =bc_evolution_cutscene
	str r0, [r1]
_08013E9A:
	pop {r0}
	bx r0
	.align 2, 0
_08013EA0: .4byte gMain
_08013EA4: .4byte sub_800F808
_08013EA8: .4byte gBattleMainFunc
_08013EAC: .4byte bc_evolution_cutscene
	thumb_func_end sub_8013E88

	thumb_func_start c4_overworld
c4_overworld: @ 8013EB0
	push {r4-r6,lr}
	ldr r5, _08013F30 @ =gBattleTypeFlags
	ldrh r1, [r5]
	movs r6, 0x2
	adds r0, r6, 0
	ands r0, r1
	cmp r0, 0
	bne _08013ECE
	ldr r4, _08013F34 @ =gPlayerParty
	adds r0, r4, 0
	bl RandomlyGivePartyPokerus
	adds r0, r4, 0
	bl PartySpreadPokerus
_08013ECE:
	ldrh r4, [r5]
	adds r0, r6, 0
	ands r0, r4
	cmp r0, 0
	beq _08013EE0
	ldr r0, _08013F38 @ =gReceivedRemoteLinkPlayers
	ldrb r0, [r0]
	cmp r0, 0
	bne _08013F2A
_08013EE0:
	ldr r1, _08013F3C @ =gSpecialVar_Result
	ldr r5, _08013F40 @ =gBattleOutcome
	ldrb r0, [r5]
	strh r0, [r1]
	ldr r3, _08013F44 @ =gMain
	ldr r0, _08013F48 @ =0x0000043d
	adds r2, r3, r0
	ldrb r1, [r2]
	movs r0, 0x3
	negs r0, r0
	ands r0, r1
	strb r0, [r2]
	ldr r0, _08013F4C @ =gPreBattleCallback1
	ldr r0, [r0]
	str r0, [r3]
	movs r0, 0x80
	lsls r0, 3
	ands r0, r4
	cmp r0, 0
	beq _08013F1C
	ldr r0, _08013F50 @ =gEnemyParty
	bl UpdateRoamerHPStatus
	ldrb r0, [r5]
	cmp r0, 0x1
	beq _08013F18
	cmp r0, 0x7
	bne _08013F1C
_08013F18:
	bl SetRoamerInactive
_08013F1C:
	movs r0, 0x5A
	bl m4aSongNumStop
	ldr r0, _08013F44 @ =gMain
	ldr r0, [r0, 0x8]
	bl SetMainCallback2
_08013F2A:
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_08013F30: .4byte gBattleTypeFlags
_08013F34: .4byte gPlayerParty
_08013F38: .4byte gReceivedRemoteLinkPlayers
_08013F3C: .4byte gSpecialVar_Result
_08013F40: .4byte gBattleOutcome
_08013F44: .4byte gMain
_08013F48: .4byte 0x0000043d
_08013F4C: .4byte gPreBattleCallback1
_08013F50: .4byte gEnemyParty
	thumb_func_end c4_overworld

	thumb_func_start sub_8013F54
sub_8013F54: @ 8013F54
	push {lr}
	ldr r0, _08013F84 @ =gFightStateTracker
	ldrb r0, [r0]
	subs r0, 0xB
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bhi _08013F90
	ldr r2, _08013F88 @ =gSharedMem + 0x17140
	adds r1, r2, 0
	adds r1, 0x20
	ldrb r0, [r1]
	cmp r0, 0
	beq _08013F74
	subs r0, 0x1
	strb r0, [r1]
_08013F74:
	ldr r0, _08013F8C @ =gBattleMainFunc
	ldrb r1, [r1]
	lsls r1, 2
	adds r1, r2
	ldr r1, [r1]
	str r1, [r0]
	b _08013FAA
	.align 2, 0
_08013F84: .4byte gFightStateTracker
_08013F88: .4byte gSharedMem + 0x17140
_08013F8C: .4byte gBattleMainFunc
_08013F90:
	ldr r0, _08013FB0 @ =gBattleExecBuffer
	ldr r0, [r0]
	cmp r0, 0
	bne _08013FAA
	ldr r1, _08013FB4 @ =gBattleScriptingCommandsTable
	ldr r0, _08013FB8 @ =gBattlescriptCurrInstr
	ldr r0, [r0]
	ldrb r0, [r0]
	lsls r0, 2
	adds r0, r1
	ldr r0, [r0]
	bl _call_via_r0
_08013FAA:
	pop {r0}
	bx r0
	.align 2, 0
_08013FB0: .4byte gBattleExecBuffer
_08013FB4: .4byte gBattleScriptingCommandsTable
_08013FB8: .4byte gBattlescriptCurrInstr
	thumb_func_end sub_8013F54

	thumb_func_start sub_8013FBC
sub_8013FBC: @ 8013FBC
	push {lr}
	ldr r0, _08013FDC @ =gBattleExecBuffer
	ldr r0, [r0]
	cmp r0, 0
	bne _08013FD8
	ldr r1, _08013FE0 @ =gBattleScriptingCommandsTable
	ldr r0, _08013FE4 @ =gBattlescriptCurrInstr
	ldr r0, [r0]
	ldrb r0, [r0]
	lsls r0, 2
	adds r0, r1
	ldr r0, [r0]
	bl _call_via_r0
_08013FD8:
	pop {r0}
	bx r0
	.align 2, 0
_08013FDC: .4byte gBattleExecBuffer
_08013FE0: .4byte gBattleScriptingCommandsTable
_08013FE4: .4byte gBattlescriptCurrInstr
	thumb_func_end sub_8013FBC

	thumb_func_start sub_8013FE8
sub_8013FE8: @ 8013FE8
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	sub sp, 0xC
	movs r0, 0x4
	str r0, [sp]
	ldr r7, _08014028 @ =gBankAttacker
	ldr r1, _0801402C @ =gTurnOrder
	ldr r0, _08014030 @ =gCurrentMoveTurn
	ldrb r0, [r0]
	adds r0, r1
	ldrb r0, [r0]
	strb r0, [r7]
	ldr r1, _08014034 @ =gSharedMem
	mov r10, r1
	ldr r0, _08014038 @ =0x000160a6
	add r0, r10
	ldrb r2, [r0]
	ldr r1, _0801403C @ =gBitTable
	ldrb r0, [r7]
	lsls r0, 2
	adds r0, r1
	ldr r0, [r0]
	ands r2, r0
	cmp r2, 0
	beq _08014044
	ldr r1, _08014040 @ =gFightStateTracker
	movs r0, 0xC
	b _080146CC
	.align 2, 0
_08014028: .4byte gBankAttacker
_0801402C: .4byte gTurnOrder
_08014030: .4byte gCurrentMoveTurn
_08014034: .4byte gSharedMem
_08014038: .4byte 0x000160a6
_0801403C: .4byte gBitTable
_08014040: .4byte gFightStateTracker
_08014044:
	ldr r1, _080140B8 @ =gCritMultiplier
	movs r0, 0x1
	strb r0, [r1]
	ldr r1, _080140BC @ =0x0001601f
	add r1, r10
	movs r0, 0x1
	strb r0, [r1]
	ldr r0, _080140C0 @ =0x000160e7
	add r0, r10
	strb r2, [r0]
	ldr r0, _080140C4 @ =gBattleMoveFlags
	strb r2, [r0]
	ldr r0, _080140C8 @ =gMultiHitCounter
	strb r2, [r0]
	ldr r0, _080140CC @ =gBattleCommunication
	strb r2, [r0, 0x6]
	ldr r3, _080140D0 @ =gCurrMovePos
	ldrb r0, [r7]
	ldr r2, _080140D4 @ =0x0001608c
	adds r0, r2
	add r0, r10
	ldrb r0, [r0]
	ldr r4, _080140D8 @ =gUnknown_02024BE5
	strb r0, [r4]
	strb r0, [r3]
	ldr r1, _080140DC @ =gProtectStructs
	ldrb r2, [r7]
	lsls r0, r2, 4
	adds r5, r0, r1
	ldrb r1, [r5]
	lsls r0, r1, 29
	adds r4, r2, 0
	mov r8, r3
	cmp r0, 0
	bge _080140F0
	movs r0, 0x5
	negs r0, r0
	ands r0, r1
	strb r0, [r5]
	ldr r2, _080140E0 @ =gCurrentMove
	ldr r1, _080140E4 @ =gChosenMove
	movs r0, 0xA5
	strh r0, [r1]
	strh r0, [r2]
	ldr r2, _080140E8 @ =gHitMarker
	ldr r0, [r2]
	movs r1, 0x80
	lsls r1, 4
	orrs r0, r1
	str r0, [r2]
	movs r0, 0xA5
	movs r1, 0
	bl GetMoveTarget
	ldrb r1, [r7]
	ldr r2, _080140EC @ =0x00016010
	adds r1, r2
	b _08014200
	.align 2, 0
_080140B8: .4byte gCritMultiplier
_080140BC: .4byte 0x0001601f
_080140C0: .4byte 0x000160e7
_080140C4: .4byte gBattleMoveFlags
_080140C8: .4byte gMultiHitCounter
_080140CC: .4byte gBattleCommunication
_080140D0: .4byte gCurrMovePos
_080140D4: .4byte 0x0001608c
_080140D8: .4byte gUnknown_02024BE5
_080140DC: .4byte gProtectStructs
_080140E0: .4byte gCurrentMove
_080140E4: .4byte gChosenMove
_080140E8: .4byte gHitMarker
_080140EC: .4byte 0x00016010
_080140F0:
	ldr r1, _08014128 @ =gBattleMons
	movs r0, 0x58
	adds r5, r4, 0
	muls r5, r0
	adds r0, r1, 0
	adds r0, 0x50
	adds r0, r5, r0
	ldr r2, [r0]
	movs r0, 0x80
	lsls r0, 5
	ands r0, r2
	cmp r0, 0
	bne _08014114
	movs r6, 0x80
	lsls r6, 15
	ands r6, r2
	cmp r6, 0
	beq _08014138
_08014114:
	ldr r3, _0801412C @ =gCurrentMove
	ldr r2, _08014130 @ =gChosenMove
	ldr r1, _08014134 @ =gLockedMove
	lsls r0, r4, 1
	adds r0, r1
	ldrh r0, [r0]
	strh r0, [r2]
	strh r0, [r3]
	b _08014280
	.align 2, 0
_08014128: .4byte gBattleMons
_0801412C: .4byte gCurrentMove
_08014130: .4byte gChosenMove
_08014134: .4byte gLockedMove
_08014138:
	ldr r3, _08014188 @ =gDisableStructs
	mov r12, r3
	lsls r0, r4, 3
	subs r0, r4
	lsls r0, 2
	adds r2, r0, r3
	ldrh r4, [r2, 0x6]
	adds r1, r4, 0
	cmp r1, 0
	beq _08014218
	ldrb r3, [r2, 0xC]
	lsls r0, r3, 1
	adds r0, r5
	str r0, [sp, 0x8]
	ldr r0, _0801418C @ =gBattleMons
	adds r0, 0xC
	mov r9, r0
	ldr r0, [sp, 0x8]
	add r0, r9
	ldrh r0, [r0]
	cmp r1, r0
	bne _080141A0
	ldr r1, _08014190 @ =gCurrentMove
	ldr r0, _08014194 @ =gChosenMove
	strh r4, [r0]
	strh r4, [r1]
	ldrb r0, [r2, 0xC]
	ldr r2, _08014198 @ =gUnknown_02024BE5
	strb r0, [r2]
	mov r3, r8
	strb r0, [r3]
	ldrh r0, [r1]
	movs r1, 0
	bl GetMoveTarget
	ldrb r1, [r7]
	ldr r4, _0801419C @ =0x00016010
	adds r1, r4
	b _08014200
	.align 2, 0
_08014188: .4byte gDisableStructs
_0801418C: .4byte gBattleMons
_08014190: .4byte gCurrentMove
_08014194: .4byte gChosenMove
_08014198: .4byte gUnknown_02024BE5
_0801419C: .4byte 0x00016010
_080141A0:
	cmp r1, 0
	beq _08014218
	cmp r1, r0
	beq _08014218
	ldr r0, _08014208 @ =gUnknown_02024BE5
	strb r3, [r0]
	mov r1, r8
	strb r3, [r1]
	ldr r3, _0801420C @ =gCurrentMove
	ldr r1, _08014210 @ =gChosenMove
	mov r2, r8
	ldrb r0, [r2]
	lsls r0, 1
	adds r0, r5
	add r0, r9
	ldrh r0, [r0]
	strh r0, [r1]
	strh r0, [r3]
	ldrb r1, [r7]
	lsls r0, r1, 3
	subs r0, r1
	lsls r0, 2
	add r0, r12
	movs r2, 0
	strh r6, [r0, 0x6]
	ldrb r1, [r7]
	lsls r0, r1, 3
	subs r0, r1
	lsls r0, 2
	add r0, r12
	strb r2, [r0, 0xC]
	ldrb r0, [r7]
	lsls r1, r0, 3
	subs r1, r0
	lsls r1, 2
	add r1, r12
	ldrb r2, [r1, 0xE]
	movs r0, 0x10
	negs r0, r0
	ands r0, r2
	strb r0, [r1, 0xE]
	ldrh r0, [r3]
	movs r1, 0
	bl GetMoveTarget
	ldrb r1, [r7]
	ldr r3, _08014214 @ =0x00016010
	adds r1, r3
_08014200:
	add r1, r10
	strb r0, [r1]
	b _08014280
	.align 2, 0
_08014208: .4byte gUnknown_02024BE5
_0801420C: .4byte gCurrentMove
_08014210: .4byte gChosenMove
_08014214: .4byte 0x00016010
_08014218:
	mov r4, r8
	ldrb r0, [r4]
	lsls r0, 1
	ldr r4, _0801425C @ =gBankAttacker
	ldrb r2, [r4]
	movs r1, 0x58
	muls r1, r2
	adds r0, r1
	ldr r1, _08014260 @ =gBattleMons
	adds r1, 0xC
	adds r0, r1
	ldr r1, _08014264 @ =gChosenMovesByBanks
	lsls r2, 1
	adds r2, r1
	ldrh r3, [r0]
	ldrh r2, [r2]
	cmp r3, r2
	beq _08014278
	ldr r1, _08014268 @ =gCurrentMove
	ldr r0, _0801426C @ =gChosenMove
	strh r3, [r0]
	strh r3, [r1]
	ldrh r0, [r1]
	movs r1, 0
	bl GetMoveTarget
	ldr r2, _08014270 @ =gSharedMem
	ldrb r1, [r4]
	ldr r3, _08014274 @ =0x00016010
	adds r1, r3
	adds r1, r2
	strb r0, [r1]
	b _08014280
	.align 2, 0
_0801425C: .4byte gBankAttacker
_08014260: .4byte gBattleMons
_08014264: .4byte gChosenMovesByBanks
_08014268: .4byte gCurrentMove
_0801426C: .4byte gChosenMove
_08014270: .4byte gSharedMem
_08014274: .4byte 0x00016010
_08014278:
	ldr r1, _08014298 @ =gCurrentMove
	ldr r0, _0801429C @ =gChosenMove
	strh r3, [r0]
	strh r3, [r1]
_08014280:
	ldr r0, _080142A0 @ =gBankAttacker
	ldrb r0, [r0]
	bl GetBankSide
	lsls r0, 24
	cmp r0, 0
	bne _080142A8
	ldr r0, _080142A4 @ =gBattleResults
	ldr r1, _08014298 @ =gCurrentMove
	ldrh r1, [r1]
	strh r1, [r0, 0x22]
	b _080142B0
	.align 2, 0
_08014298: .4byte gCurrentMove
_0801429C: .4byte gChosenMove
_080142A0: .4byte gBankAttacker
_080142A4: .4byte gBattleResults
_080142A8:
	ldr r0, _08014314 @ =gBattleResults
	ldr r1, _08014318 @ =gCurrentMove
	ldrh r1, [r1]
	strh r1, [r0, 0x24]
_080142B0:
	ldr r4, _0801431C @ =gBankAttacker
	ldrb r0, [r4]
	bl GetBankSide
	movs r1, 0x1
	eors r0, r1
	lsls r0, 24
	lsrs r6, r0, 24
	ldr r1, _08014320 @ =gSideTimer
	lsls r0, r6, 1
	adds r0, r6
	lsls r0, 2
	adds r5, r0, r1
	ldrb r0, [r5, 0x8]
	adds r3, r4, 0
	cmp r0, 0
	beq _08014330
	ldr r2, _08014324 @ =gBattleMoves
	ldr r0, _08014318 @ =gCurrentMove
	ldrh r1, [r0]
	lsls r0, r1, 1
	adds r0, r1
	lsls r0, 2
	adds r0, r2
	ldrb r0, [r0, 0x6]
	cmp r0, 0
	bne _08014330
	ldrb r0, [r3]
	bl GetBankSide
	adds r4, r0, 0
	ldrb r0, [r5, 0x9]
	bl GetBankSide
	lsls r4, 24
	lsls r0, 24
	cmp r4, r0
	beq _08014330
	ldr r1, _08014328 @ =gBattleMons
	ldrb r2, [r5, 0x9]
	movs r0, 0x58
	muls r0, r2
	adds r0, r1
	ldrh r0, [r0, 0x28]
	cmp r0, 0
	beq _08014330
	ldr r0, _0801432C @ =gBankTarget
	strb r2, [r0]
	b _080146AC
	.align 2, 0
_08014314: .4byte gBattleResults
_08014318: .4byte gCurrentMove
_0801431C: .4byte gBankAttacker
_08014320: .4byte gSideTimer
_08014324: .4byte gBattleMoves
_08014328: .4byte gBattleMons
_0801432C: .4byte gBankTarget
_08014330:
	ldr r2, _08014454 @ =gBattleTypeFlags
	ldrh r1, [r2]
	movs r0, 0x1
	ands r0, r1
	ldr r3, _08014458 @ =gBankAttacker
	mov r9, r2
	cmp r0, 0
	bne _08014342
	b _0801461C
_08014342:
	ldr r1, _0801445C @ =gSideTimer
	lsls r0, r6, 1
	adds r0, r6
	lsls r0, 2
	adds r0, r1
	ldrb r7, [r0, 0x8]
	cmp r7, 0
	beq _08014354
	b _08014570
_08014354:
	ldr r2, _08014460 @ =gBattleMoves
	ldr r0, _08014464 @ =gCurrentMove
	ldrh r1, [r0]
	lsls r0, r1, 1
	adds r0, r1
	lsls r0, 2
	adds r4, r0, r2
	ldrb r0, [r4, 0x1]
	cmp r0, 0
	bne _08014370
	ldrb r0, [r4, 0x6]
	cmp r0, 0x10
	bne _08014370
	b _08014570
_08014370:
	ldr r3, _08014468 @ =gBattleMons
	ldr r0, _0801446C @ =gSharedMem
	mov r8, r0
	ldr r2, _08014458 @ =gBankAttacker
	ldrb r5, [r2]
	ldr r1, _08014470 @ =0x00016010
	adds r0, r5, r1
	add r0, r8
	ldrb r1, [r0]
	movs r0, 0x58
	muls r0, r1
	adds r0, r3
	adds r0, 0x20
	ldrb r0, [r0]
	adds r3, r2, 0
	cmp r0, 0x1F
	bne _08014394
	b _08014570
_08014394:
	ldrb r0, [r4, 0x2]
	cmp r0, 0xD
	beq _0801439C
	b _08014570
_0801439C:
	adds r0, r5, 0
	bl GetBankSide
	lsls r0, 24
	lsrs r6, r0, 24
	ldr r1, _08014474 @ =gActiveBank
	strb r7, [r1]
	ldr r0, _08014478 @ =gNoOfAllBanks
	ldrb r0, [r0]
	cmp r7, r0
	bcs _08014416
	adds r4, r1, 0
	mov r5, r8
_080143B6:
	ldrb r0, [r4]
	bl GetBankSide
	lsls r0, 24
	lsrs r0, 24
	cmp r6, r0
	beq _08014404
	ldr r0, _08014458 @ =gBankAttacker
	ldrb r0, [r0]
	ldr r2, _08014470 @ =0x00016010
	adds r0, r2
	adds r0, r5
	ldrb r0, [r0]
	ldrb r3, [r4]
	cmp r0, r3
	beq _08014404
	ldr r1, _08014468 @ =gBattleMons
	ldrb r2, [r4]
	movs r0, 0x58
	muls r0, r2
	adds r0, r1
	adds r0, 0x20
	ldrb r0, [r0]
	cmp r0, 0x1F
	bne _08014404
	adds r0, r2, 0
	bl BankGetTurnOrder
	lsls r0, 24
	lsrs r0, 24
	ldr r1, [sp]
	cmp r0, r1
	bcs _08014404
	ldrb r0, [r4]
	bl BankGetTurnOrder
	lsls r0, 24
	lsrs r0, 24
	str r0, [sp]
_08014404:
	ldrb r0, [r4]
	adds r0, 0x1
	strb r0, [r4]
	ldr r1, _08014478 @ =gNoOfAllBanks
	lsls r0, 24
	lsrs r0, 24
	ldrb r1, [r1]
	cmp r0, r1
	bcc _080143B6
_08014416:
	ldr r2, [sp]
	cmp r2, 0x4
	beq _0801441E
	b _08014522
_0801441E:
	ldr r2, _08014460 @ =gBattleMoves
	ldr r0, _0801447C @ =gChosenMove
	ldrh r1, [r0]
	lsls r0, r1, 1
	adds r0, r1
	lsls r0, 2
	adds r0, r2
	ldrb r0, [r0, 0x6]
	ldr r3, [sp]
	ands r3, r0
	cmp r3, 0
	beq _080144A4
	ldr r0, _08014458 @ =gBankAttacker
	ldrb r0, [r0]
	bl GetBankSide
	lsls r0, 24
	cmp r0, 0
	bne _08014484
	bl Random
	movs r1, 0x1
	ands r1, r0
	cmp r1, 0
	beq _08014480
	movs r0, 0x1
	b _08014496
	.align 2, 0
_08014454: .4byte gBattleTypeFlags
_08014458: .4byte gBankAttacker
_0801445C: .4byte gSideTimer
_08014460: .4byte gBattleMoves
_08014464: .4byte gCurrentMove
_08014468: .4byte gBattleMons
_0801446C: .4byte gSharedMem
_08014470: .4byte 0x00016010
_08014474: .4byte gActiveBank
_08014478: .4byte gNoOfAllBanks
_0801447C: .4byte gChosenMove
_08014480:
	movs r0, 0x3
	b _08014496
_08014484:
	bl Random
	movs r1, 0x1
	ands r1, r0
	cmp r1, 0
	beq _08014494
	movs r0, 0
	b _08014496
_08014494:
	movs r0, 0x2
_08014496:
	bl GetBankByPlayerAI
	ldr r1, _080144A0 @ =gBankTarget
	strb r0, [r1]
	b _080144B6
	.align 2, 0
_080144A0: .4byte gBankTarget
_080144A4:
	ldr r2, _080144EC @ =gBankTarget
	ldr r1, _080144F0 @ =gSharedMem
	ldr r0, _080144F4 @ =gBankAttacker
	ldrb r0, [r0]
	ldr r4, _080144F8 @ =0x00016010
	adds r0, r4
	adds r0, r1
	ldrb r0, [r0]
	strb r0, [r2]
_080144B6:
	ldr r7, _080144FC @ =gAbsentBankFlags
	ldrb r0, [r7]
	ldr r1, _08014500 @ =gBitTable
	mov r8, r1
	ldr r5, _080144EC @ =gBankTarget
	ldrb r1, [r5]
	lsls r1, 2
	add r1, r8
	ldr r1, [r1]
	ands r0, r1
	cmp r0, 0
	bne _080144D0
	b _080146AC
_080144D0:
	ldr r6, _080144F4 @ =gBankAttacker
	ldrb r0, [r6]
	bl GetBankSide
	adds r4, r0, 0
	ldrb r0, [r5]
	bl GetBankSide
	lsls r4, 24
	lsls r0, 24
	cmp r4, r0
	beq _08014504
	ldrb r0, [r5]
	b _0801469A
	.align 2, 0
_080144EC: .4byte gBankTarget
_080144F0: .4byte gSharedMem
_080144F4: .4byte gBankAttacker
_080144F8: .4byte 0x00016010
_080144FC: .4byte gAbsentBankFlags
_08014500: .4byte gBitTable
_08014504:
	ldrb r0, [r6]
	bl GetBankIdentity
	movs r1, 0x1
	eors r0, r1
	lsls r0, 24
	lsrs r0, 24
	bl GetBankByPlayerAI
	strb r0, [r5]
	ldrb r1, [r7]
	ldrb r2, [r5]
	lsls r0, r2, 2
	add r0, r8
	b _08014690
_08014522:
	ldr r4, _0801455C @ =gActiveBank
	ldr r0, _08014560 @ =gTurnOrder
	ldr r2, [sp]
	adds r0, r2, r0
	ldrb r0, [r0]
	strb r0, [r4]
	ldrb r0, [r4]
	ldr r2, _08014564 @ =gBattleMons
	movs r1, 0x58
	muls r1, r0
	adds r1, r2
	adds r1, 0x20
	ldrb r1, [r1]
	bl RecordAbilityBattle
	ldr r2, _08014568 @ =gSpecialStatuses
	ldrb r1, [r4]
	lsls r0, r1, 2
	adds r0, r1
	lsls r0, 2
	adds r0, r2
	ldrb r1, [r0]
	movs r2, 0x2
	orrs r1, r2
	strb r1, [r0]
	ldr r1, _0801456C @ =gBankTarget
	ldrb r0, [r4]
	strb r0, [r1]
	b _080146AC
	.align 2, 0
_0801455C: .4byte gActiveBank
_08014560: .4byte gTurnOrder
_08014564: .4byte gBattleMons
_08014568: .4byte gSpecialStatuses
_0801456C: .4byte gBankTarget
_08014570:
	mov r4, r9
	ldrh r1, [r4]
	movs r4, 0x1
	adds r0, r4, 0
	ands r0, r1
	cmp r0, 0
	beq _0801461C
	ldr r2, _080145B4 @ =gBattleMoves
	ldr r0, _080145B8 @ =gChosenMove
	ldrh r1, [r0]
	lsls r0, r1, 1
	adds r0, r1
	lsls r0, 2
	adds r0, r2
	ldrb r1, [r0, 0x6]
	movs r0, 0x4
	ands r0, r1
	cmp r0, 0
	beq _0801461C
	ldrb r0, [r3]
	bl GetBankSide
	lsls r0, 24
	cmp r0, 0
	bne _080145C0
	bl Random
	adds r1, r4, 0
	ands r1, r0
	cmp r1, 0
	beq _080145BC
	movs r0, 0x1
	b _080145D2
	.align 2, 0
_080145B4: .4byte gBattleMoves
_080145B8: .4byte gChosenMove
_080145BC:
	movs r0, 0x3
	b _080145D2
_080145C0:
	bl Random
	adds r1, r4, 0
	ands r1, r0
	cmp r1, 0
	beq _080145D0
	movs r0, 0
	b _080145D2
_080145D0:
	movs r0, 0x2
_080145D2:
	bl GetBankByPlayerAI
	ldr r1, _0801460C @ =gBankTarget
	strb r0, [r1]
	ldr r0, _08014610 @ =gAbsentBankFlags
	ldrb r1, [r0]
	ldr r2, _08014614 @ =gBitTable
	ldr r5, _0801460C @ =gBankTarget
	ldrb r0, [r5]
	lsls r0, 2
	adds r0, r2
	ldr r0, [r0]
	ands r1, r0
	cmp r1, 0
	beq _080146AC
	ldr r0, _08014618 @ =gBankAttacker
	ldrb r0, [r0]
	bl GetBankSide
	adds r4, r0, 0
	ldrb r0, [r5]
	bl GetBankSide
	lsls r4, 24
	lsls r0, 24
	cmp r4, r0
	beq _080146AC
	ldrb r0, [r5]
	b _0801469A
	.align 2, 0
_0801460C: .4byte gBankTarget
_08014610: .4byte gAbsentBankFlags
_08014614: .4byte gBitTable
_08014618: .4byte gBankAttacker
_0801461C:
	ldr r5, _08014660 @ =gBankTarget
	ldr r1, _08014664 @ =gSharedMem
	adds r2, r3, 0
	ldrb r0, [r2]
	ldr r4, _08014668 @ =0x00016010
	adds r0, r4
	adds r0, r1
	ldrb r0, [r0]
	strb r0, [r5]
	ldr r6, _0801466C @ =gAbsentBankFlags
	ldrb r1, [r6]
	ldr r7, _08014670 @ =gBitTable
	ldrb r0, [r5]
	lsls r0, 2
	adds r0, r7
	ldr r0, [r0]
	ands r1, r0
	cmp r1, 0
	beq _080146AC
	ldrb r0, [r2]
	str r3, [sp, 0x4]
	bl GetBankSide
	adds r4, r0, 0
	ldrb r0, [r5]
	bl GetBankSide
	lsls r4, 24
	lsls r0, 24
	ldr r3, [sp, 0x4]
	cmp r4, r0
	beq _08014674
	ldrb r0, [r5]
	b _0801469A
	.align 2, 0
_08014660: .4byte gBankTarget
_08014664: .4byte gSharedMem
_08014668: .4byte 0x00016010
_0801466C: .4byte gAbsentBankFlags
_08014670: .4byte gBitTable
_08014674:
	ldrb r0, [r3]
	bl GetBankIdentity
	movs r1, 0x1
	eors r0, r1
	lsls r0, 24
	lsrs r0, 24
	bl GetBankByPlayerAI
	strb r0, [r5]
	ldrb r1, [r6]
	ldrb r2, [r5]
	lsls r0, r2, 2
	adds r0, r7
_08014690:
	ldr r0, [r0]
	ands r1, r0
	cmp r1, 0
	beq _080146AC
	adds r0, r2, 0
_0801469A:
	bl GetBankIdentity
	movs r1, 0x2
	eors r0, r1
	lsls r0, 24
	lsrs r0, 24
	bl GetBankByPlayerAI
	strb r0, [r5]
_080146AC:
	ldr r4, _080146E0 @ =gBattlescriptCurrInstr
	ldr r3, _080146E4 @ =gBattleScriptsForMoveEffects
	ldr r2, _080146E8 @ =gBattleMoves
	ldr r0, _080146EC @ =gCurrentMove
	ldrh r1, [r0]
	lsls r0, r1, 1
	adds r0, r1
	lsls r0, 2
	adds r0, r2
	ldrb r0, [r0]
	lsls r0, 2
	adds r0, r3
	ldr r0, [r0]
	str r0, [r4]
	ldr r1, _080146F0 @ =gFightStateTracker
	movs r0, 0xA
_080146CC:
	strb r0, [r1]
	add sp, 0xC
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080146E0: .4byte gBattlescriptCurrInstr
_080146E4: .4byte gBattleScriptsForMoveEffects
_080146E8: .4byte gBattleMoves
_080146EC: .4byte gCurrentMove
_080146F0: .4byte gFightStateTracker
	thumb_func_end sub_8013FE8

	thumb_func_start sub_80146F4
sub_80146F4: @ 80146F4
	push {r4,lr}
	ldr r3, _08014764 @ =gBankAttacker
	ldr r1, _08014768 @ =gTurnOrder
	ldr r0, _0801476C @ =gCurrentMoveTurn
	ldrb r0, [r0]
	adds r0, r1
	ldrb r0, [r0]
	strb r0, [r3]
	ldr r0, _08014770 @ =gUnknown_030042A4
	movs r2, 0
	strh r2, [r0]
	ldr r0, _08014774 @ =gUnknown_030042A0
	strh r2, [r0]
	ldr r1, _08014778 @ =gActionSelectionCursor
	ldrb r0, [r3]
	adds r0, r1
	strb r2, [r0]
	ldr r1, _0801477C @ =gMoveSelectionCursor
	ldrb r0, [r3]
	adds r0, r1
	strb r2, [r0]
	ldr r2, _08014780 @ =gBattleTextBuff1
	movs r0, 0xFD
	strb r0, [r2]
	movs r0, 0x7
	strb r0, [r2, 0x1]
	ldrb r4, [r3]
	strb r4, [r2, 0x2]
	ldr r1, _08014784 @ =gSharedMem
	ldrb r0, [r3]
	ldr r3, _08014788 @ =0x00016064
	adds r0, r3
	adds r0, r1
	ldrb r0, [r0]
	strb r0, [r2, 0x3]
	movs r0, 0xFF
	strb r0, [r2, 0x4]
	ldr r0, _0801478C @ =0x00016003
	adds r1, r0
	strb r4, [r1]
	ldr r1, _08014790 @ =gBattlescriptCurrInstr
	ldr r0, _08014794 @ =BattleScript_ActionSwitch
	str r0, [r1]
	ldr r1, _08014798 @ =gFightStateTracker
	movs r0, 0xA
	strb r0, [r1]
	ldr r1, _0801479C @ =gBattleResults
	ldrb r0, [r1, 0x2]
	cmp r0, 0xFE
	bhi _0801475C
	adds r0, 0x1
	strb r0, [r1, 0x2]
_0801475C:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08014764: .4byte gBankAttacker
_08014768: .4byte gTurnOrder
_0801476C: .4byte gCurrentMoveTurn
_08014770: .4byte gUnknown_030042A4
_08014774: .4byte gUnknown_030042A0
_08014778: .4byte gActionSelectionCursor
_0801477C: .4byte gMoveSelectionCursor
_08014780: .4byte gBattleTextBuff1
_08014784: .4byte gSharedMem
_08014788: .4byte 0x00016064
_0801478C: .4byte 0x00016003
_08014790: .4byte gBattlescriptCurrInstr
_08014794: .4byte BattleScript_ActionSwitch
_08014798: .4byte gFightStateTracker
_0801479C: .4byte gBattleResults
	thumb_func_end sub_80146F4

	thumb_func_start sub_80147A0
sub_80147A0: @ 80147A0
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	ldr r4, _08014804 @ =gBankAttacker
	ldr r2, _08014808 @ =gBankTarget
	ldr r1, _0801480C @ =gTurnOrder
	ldr r0, _08014810 @ =gCurrentMoveTurn
	ldrb r0, [r0]
	adds r0, r1
	ldrb r0, [r0]
	strb r0, [r2]
	strb r0, [r4]
	ldr r0, _08014814 @ =gUnknown_030042A4
	movs r2, 0
	strh r2, [r0]
	ldr r0, _08014818 @ =gUnknown_030042A0
	strh r2, [r0]
	ldr r3, _0801481C @ =gDisableStructs
	ldrb r1, [r4]
	lsls r0, r1, 3
	subs r0, r1
	lsls r0, 2
	adds r0, r3
	strb r2, [r0, 0x10]
	ldr r5, _08014820 @ =gLastUsedItem
	ldr r2, _08014824 @ =gBattleBufferB
	ldrb r1, [r4]
	lsls r1, 9
	adds r0, r2, 0x1
	adds r0, r1, r0
	ldrb r3, [r0]
	adds r2, 0x2
	adds r1, r2
	ldrb r0, [r1]
	lsls r0, 8
	orrs r3, r0
	strh r3, [r5]
	cmp r3, 0xC
	bhi _08014830
	ldr r2, _08014828 @ =gBattlescriptCurrInstr
	ldr r1, _0801482C @ =gBattlescriptsForBallThrow
	ldrh r0, [r5]
	lsls r0, 2
	adds r0, r1
	ldr r0, [r0]
	str r0, [r2]
	b _08014A8C
	.align 2, 0
_08014804: .4byte gBankAttacker
_08014808: .4byte gBankTarget
_0801480C: .4byte gTurnOrder
_08014810: .4byte gCurrentMoveTurn
_08014814: .4byte gUnknown_030042A4
_08014818: .4byte gUnknown_030042A0
_0801481C: .4byte gDisableStructs
_08014820: .4byte gLastUsedItem
_08014824: .4byte gBattleBufferB
_08014828: .4byte gBattlescriptCurrInstr
_0801482C: .4byte gBattlescriptsForBallThrow
_08014830:
	adds r0, r3, 0
	subs r0, 0x50
	lsls r0, 16
	lsrs r0, 16
	cmp r0, 0x1
	bhi _0801484C
	ldr r0, _08014844 @ =gBattlescriptCurrInstr
	ldr r1, _08014848 @ =gBattlescriptsForRunningByItem
	b _0801485C
	.align 2, 0
_08014844: .4byte gBattlescriptCurrInstr
_08014848: .4byte gBattlescriptsForRunningByItem
_0801484C:
	ldrb r0, [r4]
	bl GetBankSide
	lsls r0, 24
	cmp r0, 0
	bne _0801486C
	ldr r0, _08014864 @ =gBattlescriptCurrInstr
	ldr r1, _08014868 @ =gBattlescriptsForUsingItem
_0801485C:
	ldr r1, [r1]
	str r1, [r0]
	b _08014A8C
	.align 2, 0
_08014864: .4byte gBattlescriptCurrInstr
_08014868: .4byte gBattlescriptsForUsingItem
_0801486C:
	ldr r2, _080148A0 @ =gSharedMem
	ldrb r0, [r4]
	ldr r3, _080148A4 @ =0x00016003
	adds r1, r2, r3
	strb r0, [r1]
	lsls r0, 24
	lsrs r0, 25
	ldr r1, _080148A8 @ =0x000160d8
	adds r0, r1
	adds r0, r2
	ldrb r0, [r0]
	subs r0, 0x1
	mov r8, r4
	ldr r3, _080148AC @ =gBattlescriptCurrInstr
	mov r9, r3
	ldr r1, _080148B0 @ =gBattlescriptsForUsingItem
	mov r10, r1
	adds r7, r2, 0
	cmp r0, 0x4
	bls _08014896
	b _08014A74
_08014896:
	lsls r0, 2
	ldr r1, _080148B4 @ =_080148B8
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_080148A0: .4byte gSharedMem
_080148A4: .4byte 0x00016003
_080148A8: .4byte 0x000160d8
_080148AC: .4byte gBattlescriptCurrInstr
_080148B0: .4byte gBattlescriptsForUsingItem
_080148B4: .4byte _080148B8
	.align 2, 0
_080148B8:
	.4byte _08014A74
	.4byte _08014A74
	.4byte _080148CC
	.4byte _08014958
	.4byte _08014A30
_080148CC:
	ldr r2, _08014904 @ =gBattleCommunication
	movs r0, 0
	strb r0, [r2, 0x5]
	ldr r1, _08014908 @ =gBankAttacker
	ldrb r0, [r1]
	lsrs r0, 1
	ldr r6, _0801490C @ =0x000160da
	adds r0, r6
	adds r0, r7
	ldrb r3, [r0]
	movs r0, 0x1
	ands r0, r3
	mov r8, r1
	cmp r0, 0
	beq _08014918
	movs r0, 0x3E
	ands r0, r3
	ldr r3, _08014910 @ =gBattlescriptCurrInstr
	mov r9, r3
	ldr r1, _08014914 @ =gBattlescriptsForUsingItem
	mov r10, r1
	cmp r0, 0
	bne _080148FC
	b _08014A74
_080148FC:
	movs r0, 0x5
	strb r0, [r2, 0x5]
	b _08014A74
	.align 2, 0
_08014904: .4byte gBattleCommunication
_08014908: .4byte gBankAttacker
_0801490C: .4byte 0x000160da
_08014910: .4byte gBattlescriptCurrInstr
_08014914: .4byte gBattlescriptsForUsingItem
_08014918:
	ldr r3, _08014950 @ =gBattlescriptCurrInstr
	mov r9, r3
	ldr r0, _08014954 @ =gBattlescriptsForUsingItem
	mov r10, r0
	adds r5, r7, 0
	mov r4, r8
	adds r3, r6, 0
_08014926:
	ldrb r0, [r4]
	lsrs r0, 1
	adds r0, r3
	adds r0, r5
	ldrb r1, [r0]
	lsrs r1, 1
	strb r1, [r0]
	ldrb r0, [r2, 0x5]
	adds r0, 0x1
	strb r0, [r2, 0x5]
	ldrb r0, [r4]
	lsrs r0, 1
	adds r0, r3
	adds r0, r5
	ldrb r1, [r0]
	movs r0, 0x1
	ands r0, r1
	cmp r0, 0
	beq _08014926
	b _08014A74
	.align 2, 0
_08014950: .4byte gBattlescriptCurrInstr
_08014954: .4byte gBattlescriptsForUsingItem
_08014958:
	ldr r3, _0801498C @ =gBattleCommunication
	movs r0, 0x4
	strb r0, [r3, 0x5]
	ldr r2, _08014990 @ =gBankAttacker
	ldrb r0, [r2]
	lsrs r0, 1
	ldr r1, _08014994 @ =0x000160da
	mov r12, r1
	add r0, r12
	adds r6, r0, r7
	ldrb r1, [r6]
	movs r0, 0x80
	ands r0, r1
	lsls r0, 24
	lsrs r5, r0, 24
	mov r8, r2
	cmp r5, 0
	beq _080149A0
	movs r0, 0x5
	strb r0, [r3, 0x5]
	ldr r2, _08014998 @ =gBattlescriptCurrInstr
	mov r9, r2
	ldr r3, _0801499C @ =gBattlescriptsForUsingItem
	mov r10, r3
	b _08014A74
	.align 2, 0
_0801498C: .4byte gBattleCommunication
_08014990: .4byte gBankAttacker
_08014994: .4byte 0x000160da
_08014998: .4byte gBattlescriptCurrInstr
_0801499C: .4byte gBattlescriptsForUsingItem
_080149A0:
	ldr r3, _08014A18 @ =gBattleTextBuff1
	movs r4, 0xFD
	strb r4, [r3]
	movs r0, 0x5
	strb r0, [r3, 0x1]
	movs r2, 0x1
	strb r2, [r3, 0x2]
	movs r0, 0xFF
	strb r0, [r3, 0x3]
	ldr r1, _08014A1C @ =gBattleTextBuff2
	strb r4, [r1]
	strb r5, [r1, 0x1]
	movs r0, 0xD2
	strb r0, [r1, 0x2]
	strb r5, [r1, 0x3]
	subs r0, 0xD3
	strb r0, [r1, 0x4]
	ldrb r0, [r6]
	ands r2, r0
	ldr r0, _08014A20 @ =gBattlescriptCurrInstr
	mov r9, r0
	ldr r1, _08014A24 @ =gBattlescriptsForUsingItem
	mov r10, r1
	adds r6, r3, 0
	cmp r2, 0
	bne _08014A02
	adds r3, r7, 0
	mov r5, r8
	mov r4, r12
	adds r2, r6, 0
_080149DC:
	ldrb r0, [r5]
	lsrs r0, 1
	adds r0, r4
	adds r0, r3
	ldrb r1, [r0]
	lsrs r1, 1
	strb r1, [r0]
	ldrb r0, [r2, 0x2]
	adds r0, 0x1
	strb r0, [r2, 0x2]
	ldrb r0, [r5]
	lsrs r0, 1
	adds r0, r4
	adds r0, r3
	ldrb r1, [r0]
	movs r0, 0x1
	ands r0, r1
	cmp r0, 0
	beq _080149DC
_08014A02:
	ldrb r0, [r6, 0x2]
	adds r0, 0xE
	ldr r2, _08014A28 @ =0x000160a4
	adds r1, r7, r2
	movs r2, 0
	strb r0, [r1]
	ldr r3, _08014A2C @ =0x000160a5
	adds r0, r7, r3
	strb r2, [r0]
	b _08014A74
	.align 2, 0
_08014A18: .4byte gBattleTextBuff1
_08014A1C: .4byte gBattleTextBuff2
_08014A20: .4byte gBattlescriptCurrInstr
_08014A24: .4byte gBattlescriptsForUsingItem
_08014A28: .4byte 0x000160a4
_08014A2C: .4byte 0x000160a5
_08014A30:
	ldr r0, _08014A50 @ =gBattleTypeFlags
	ldrh r0, [r0]
	movs r1, 0x1
	ands r1, r0
	cmp r1, 0
	beq _08014A64
	ldr r1, _08014A54 @ =gBattleCommunication
	movs r0, 0x2
	strb r0, [r1, 0x5]
	ldr r0, _08014A58 @ =gBankAttacker
	mov r8, r0
	ldr r1, _08014A5C @ =gBattlescriptCurrInstr
	mov r9, r1
	ldr r2, _08014A60 @ =gBattlescriptsForUsingItem
	mov r10, r2
	b _08014A74
	.align 2, 0
_08014A50: .4byte gBattleTypeFlags
_08014A54: .4byte gBattleCommunication
_08014A58: .4byte gBankAttacker
_08014A5C: .4byte gBattlescriptCurrInstr
_08014A60: .4byte gBattlescriptsForUsingItem
_08014A64:
	ldr r0, _08014AA0 @ =gBattleCommunication
	strb r1, [r0, 0x5]
	ldr r3, _08014AA4 @ =gBankAttacker
	mov r8, r3
	ldr r0, _08014AA8 @ =gBattlescriptCurrInstr
	mov r9, r0
	ldr r1, _08014AAC @ =gBattlescriptsForUsingItem
	mov r10, r1
_08014A74:
	mov r2, r8
	ldrb r0, [r2]
	lsrs r0, 1
	ldr r3, _08014AB0 @ =0x000160d8
	adds r0, r3
	adds r0, r7
	ldrb r0, [r0]
	lsls r0, 2
	add r0, r10
	ldr r0, [r0]
	mov r1, r9
	str r0, [r1]
_08014A8C:
	movs r0, 0xA
	ldr r2, _08014AB4 @ =gFightStateTracker
	strb r0, [r2]
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_08014AA0: .4byte gBattleCommunication
_08014AA4: .4byte gBankAttacker
_08014AA8: .4byte gBattlescriptCurrInstr
_08014AAC: .4byte gBattlescriptsForUsingItem
_08014AB0: .4byte 0x000160d8
_08014AB4: .4byte gFightStateTracker
	thumb_func_end sub_80147A0

	thumb_func_start sub_8014AB8
sub_8014AB8: @ 8014AB8
	push {r4-r6,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	movs r5, 0
	ldr r1, _08014ADC @ =gBattleMons
	movs r0, 0x58
	muls r0, r4
	adds r1, r0, r1
	ldrh r0, [r1, 0x2E]
	cmp r0, 0xAF
	bne _08014AE4
	ldr r1, _08014AE0 @ =gEnigmaBerries
	lsls r0, r4, 3
	subs r0, r4
	lsls r0, 2
	adds r0, r1
	ldrb r1, [r0, 0x7]
	b _08014AEE
	.align 2, 0
_08014ADC: .4byte gBattleMons
_08014AE0: .4byte gEnigmaBerries
_08014AE4:
	ldrh r0, [r1, 0x2E]
	bl ItemId_GetHoldEffect
	lsls r0, 24
	lsrs r1, r0, 24
_08014AEE:
	ldr r0, _08014B18 @ =gStringBank
	strb r4, [r0]
	cmp r1, 0x25
	bne _08014B28
	ldr r2, _08014B1C @ =gLastUsedItem
	ldr r1, _08014B20 @ =gBattleMons
	movs r0, 0x58
	muls r0, r4
	adds r0, r1
	ldrh r0, [r0, 0x2E]
	strh r0, [r2]
	ldr r0, _08014B24 @ =gProtectStructs
	lsls r2, r4, 4
	adds r2, r0
	ldrb r1, [r2, 0x1]
	movs r0, 0x19
	negs r0, r0
	ands r0, r1
	movs r1, 0x8
	b _08014B50
	.align 2, 0
_08014B18: .4byte gStringBank
_08014B1C: .4byte gLastUsedItem
_08014B20: .4byte gBattleMons
_08014B24: .4byte gProtectStructs
_08014B28:
	ldr r6, _08014B5C @ =gBattleMons
	movs r2, 0x58
	adds r0, r4, 0
	muls r0, r2
	adds r3, r0, r6
	adds r0, r3, 0
	adds r0, 0x20
	ldrb r1, [r0]
	cmp r1, 0x32
	bne _08014B68
	ldr r0, _08014B60 @ =gLastUsedAbility
	strb r1, [r0]
	ldr r0, _08014B64 @ =gProtectStructs
	lsls r2, r4, 4
	adds r2, r0
	ldrb r1, [r2, 0x1]
	movs r0, 0x19
	negs r0, r0
	ands r0, r1
	movs r1, 0x10
_08014B50:
	orrs r0, r1
	strb r0, [r2, 0x1]
	adds r0, r5, 0x1
	lsls r0, 24
	lsrs r5, r0, 24
	b _08014BC2
	.align 2, 0
_08014B5C: .4byte gBattleMons
_08014B60: .4byte gLastUsedAbility
_08014B64: .4byte gProtectStructs
_08014B68:
	ldr r0, _08014BDC @ =gBattleTypeFlags
	ldrh r1, [r0]
	movs r0, 0x1
	ands r0, r1
	cmp r0, 0
	bne _08014BB6
	movs r1, 0x1
	adds r0, r4, 0
	eors r0, r1
	muls r0, r2
	adds r2, r0, r6
	ldrh r0, [r3, 0x6]
	ldrh r1, [r2, 0x6]
	cmp r0, r1
	bcs _08014BB0
	lsls r0, 7
	ldrh r1, [r2, 0x6]
	bl __divsi3
	adds r4, r0, 0
	ldr r0, _08014BE0 @ =gSharedMem
	ldr r1, _08014BE4 @ =0x00016078
	adds r0, r1
	ldrb r1, [r0]
	lsls r0, r1, 4
	subs r0, r1
	lsls r0, 1
	adds r4, r0
	lsls r4, 24
	lsrs r4, 24
	bl Random
	movs r1, 0xFF
	ands r1, r0
	cmp r4, r1
	bls _08014BB6
_08014BB0:
	adds r0, r5, 0x1
	lsls r0, 24
	lsrs r5, r0, 24
_08014BB6:
	ldr r1, _08014BE0 @ =gSharedMem
	ldr r0, _08014BE4 @ =0x00016078
	adds r1, r0
	ldrb r0, [r1]
	adds r0, 0x1
	strb r0, [r1]
_08014BC2:
	cmp r5, 0
	beq _08014BD4
	ldr r1, _08014BE8 @ =gCurrentMoveTurn
	ldr r0, _08014BEC @ =gNoOfAllBanks
	ldrb r0, [r0]
	strb r0, [r1]
	ldr r1, _08014BF0 @ =gBattleOutcome
	movs r0, 0x4
	strb r0, [r1]
_08014BD4:
	adds r0, r5, 0
	pop {r4-r6}
	pop {r1}
	bx r1
	.align 2, 0
_08014BDC: .4byte gBattleTypeFlags
_08014BE0: .4byte gSharedMem
_08014BE4: .4byte 0x00016078
_08014BE8: .4byte gCurrentMoveTurn
_08014BEC: .4byte gNoOfAllBanks
_08014BF0: .4byte gBattleOutcome
	thumb_func_end sub_8014AB8

	thumb_func_start sub_8014BF4
sub_8014BF4: @ 8014BF4
	push {r4-r6,lr}
	ldr r4, _08014C44 @ =gBankAttacker
	ldr r1, _08014C48 @ =gTurnOrder
	ldr r5, _08014C4C @ =gCurrentMoveTurn
	ldrb r0, [r5]
	adds r0, r1
	ldrb r0, [r0]
	strb r0, [r4]
	ldr r0, _08014C50 @ =gBattleTypeFlags
	ldrh r1, [r0]
	movs r0, 0x2
	ands r0, r1
	cmp r0, 0
	beq _08014C9C
	ldr r0, _08014C54 @ =gNoOfAllBanks
	ldrb r1, [r0]
	strb r1, [r5]
	ldr r2, _08014C58 @ =gActiveBank
	movs r0, 0
	strb r0, [r2]
	lsls r1, 24
	cmp r1, 0
	beq _08014C88
	adds r4, r2, 0
	ldr r6, _08014C5C @ =gActionForBanks
	ldr r5, _08014C60 @ =gBattleOutcome
_08014C28:
	ldrb r0, [r4]
	bl GetBankSide
	lsls r0, 24
	cmp r0, 0
	bne _08014C64
	ldrb r0, [r4]
	adds r0, r6
	ldrb r0, [r0]
	cmp r0, 0x3
	bne _08014C76
	ldrb r0, [r5]
	movs r1, 0x2
	b _08014C72
	.align 2, 0
_08014C44: .4byte gBankAttacker
_08014C48: .4byte gTurnOrder
_08014C4C: .4byte gCurrentMoveTurn
_08014C50: .4byte gBattleTypeFlags
_08014C54: .4byte gNoOfAllBanks
_08014C58: .4byte gActiveBank
_08014C5C: .4byte gActionForBanks
_08014C60: .4byte gBattleOutcome
_08014C64:
	ldrb r0, [r4]
	adds r0, r6
	ldrb r0, [r0]
	cmp r0, 0x3
	bne _08014C76
	ldrb r0, [r5]
	movs r1, 0x1
_08014C72:
	orrs r0, r1
	strb r0, [r5]
_08014C76:
	ldrb r0, [r4]
	adds r0, 0x1
	strb r0, [r4]
	ldr r1, _08014C94 @ =gNoOfAllBanks
	lsls r0, 24
	lsrs r0, 24
	ldrb r1, [r1]
	cmp r0, r1
	bcc _08014C28
_08014C88:
	ldr r0, _08014C98 @ =gBattleOutcome
	ldrb r1, [r0]
	movs r2, 0x80
	orrs r1, r2
	strb r1, [r0]
	b _08014D40
	.align 2, 0
_08014C94: .4byte gNoOfAllBanks
_08014C98: .4byte gBattleOutcome
_08014C9C:
	ldrb r0, [r4]
	bl GetBankSide
	lsls r0, 24
	cmp r0, 0
	bne _08014CF4
	ldrb r0, [r4]
	bl sub_8014AB8
	lsls r0, 24
	cmp r0, 0
	bne _08014D40
	ldr r1, _08014CDC @ =gBattleMons
	ldrb r2, [r4]
	movs r0, 0x58
	muls r2, r0
	adds r1, 0x50
	adds r2, r1
	ldr r0, [r2]
	ldr r1, _08014CE0 @ =0xfdffffff
	ands r0, r1
	str r0, [r2]
	ldr r1, _08014CE4 @ =gBattleCommunication
	movs r0, 0x3
	strb r0, [r1, 0x5]
	ldr r1, _08014CE8 @ =gBattlescriptCurrInstr
	ldr r0, _08014CEC @ =BattleScript_PrintFailedToRunString
	str r0, [r1]
	ldr r1, _08014CF0 @ =gFightStateTracker
	movs r0, 0xA
	b _08014D3E
	.align 2, 0
_08014CDC: .4byte gBattleMons
_08014CE0: .4byte 0xfdffffff
_08014CE4: .4byte gBattleCommunication
_08014CE8: .4byte gBattlescriptCurrInstr
_08014CEC: .4byte BattleScript_PrintFailedToRunString
_08014CF0: .4byte gFightStateTracker
_08014CF4:
	ldr r1, _08014D1C @ =gBattleMons
	ldrb r2, [r4]
	movs r0, 0x58
	muls r0, r2
	adds r1, 0x50
	adds r0, r1
	ldr r0, [r0]
	ldr r1, _08014D20 @ =0x0400e000
	ands r0, r1
	cmp r0, 0
	beq _08014D34
	ldr r1, _08014D24 @ =gBattleCommunication
	movs r0, 0x4
	strb r0, [r1, 0x5]
	ldr r1, _08014D28 @ =gBattlescriptCurrInstr
	ldr r0, _08014D2C @ =BattleScript_PrintFailedToRunString
	str r0, [r1]
	ldr r1, _08014D30 @ =gFightStateTracker
	movs r0, 0xA
	b _08014D3E
	.align 2, 0
_08014D1C: .4byte gBattleMons
_08014D20: .4byte 0x0400e000
_08014D24: .4byte gBattleCommunication
_08014D28: .4byte gBattlescriptCurrInstr
_08014D2C: .4byte BattleScript_PrintFailedToRunString
_08014D30: .4byte gFightStateTracker
_08014D34:
	ldr r0, _08014D48 @ =gNoOfAllBanks
	ldrb r0, [r0]
	strb r0, [r5]
	ldr r1, _08014D4C @ =gBattleOutcome
	movs r0, 0x6
_08014D3E:
	strb r0, [r1]
_08014D40:
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_08014D48: .4byte gNoOfAllBanks
_08014D4C: .4byte gBattleOutcome
	thumb_func_end sub_8014BF4

	thumb_func_start sub_8014D50
sub_8014D50: @ 8014D50
	ldr r2, _08014D78 @ =gBankAttacker
	ldr r1, _08014D7C @ =gTurnOrder
	ldr r0, _08014D80 @ =gCurrentMoveTurn
	ldrb r0, [r0]
	adds r0, r1
	ldrb r0, [r0]
	strb r0, [r2]
	ldr r0, _08014D84 @ =gUnknown_030042A4
	movs r1, 0
	strh r1, [r0]
	ldr r0, _08014D88 @ =gUnknown_030042A0
	strh r1, [r0]
	ldr r1, _08014D8C @ =gBattlescriptCurrInstr
	ldr r0, _08014D90 @ =gBattlescriptsForSafariActions
	ldr r0, [r0]
	str r0, [r1]
	ldr r1, _08014D94 @ =gFightStateTracker
	movs r0, 0xA
	strb r0, [r1]
	bx lr
	.align 2, 0
_08014D78: .4byte gBankAttacker
_08014D7C: .4byte gTurnOrder
_08014D80: .4byte gCurrentMoveTurn
_08014D84: .4byte gUnknown_030042A4
_08014D88: .4byte gUnknown_030042A0
_08014D8C: .4byte gBattlescriptCurrInstr
_08014D90: .4byte gBattlescriptsForSafariActions
_08014D94: .4byte gFightStateTracker
	thumb_func_end sub_8014D50

	thumb_func_start sub_8014D98
sub_8014D98: @ 8014D98
	ldr r2, _08014DD0 @ =gBankAttacker
	ldr r1, _08014DD4 @ =gTurnOrder
	ldr r0, _08014DD8 @ =gCurrentMoveTurn
	ldrb r0, [r0]
	adds r0, r1
	ldrb r0, [r0]
	strb r0, [r2]
	ldr r0, _08014DDC @ =gUnknown_030042A4
	movs r1, 0
	strh r1, [r0]
	ldr r0, _08014DE0 @ =gUnknown_030042A0
	strh r1, [r0]
	ldr r1, _08014DE4 @ =gNumSafariBalls
	ldrb r0, [r1]
	subs r0, 0x1
	strb r0, [r1]
	ldr r1, _08014DE8 @ =gLastUsedItem
	movs r0, 0x5
	strh r0, [r1]
	ldr r1, _08014DEC @ =gBattlescriptCurrInstr
	ldr r0, _08014DF0 @ =gBattlescriptsForBallThrow
	ldr r0, [r0, 0x14]
	str r0, [r1]
	ldr r1, _08014DF4 @ =gFightStateTracker
	movs r0, 0xA
	strb r0, [r1]
	bx lr
	.align 2, 0
_08014DD0: .4byte gBankAttacker
_08014DD4: .4byte gTurnOrder
_08014DD8: .4byte gCurrentMoveTurn
_08014DDC: .4byte gUnknown_030042A4
_08014DE0: .4byte gUnknown_030042A0
_08014DE4: .4byte gNumSafariBalls
_08014DE8: .4byte gLastUsedItem
_08014DEC: .4byte gBattlescriptCurrInstr
_08014DF0: .4byte gBattlescriptsForBallThrow
_08014DF4: .4byte gFightStateTracker
	thumb_func_end sub_8014D98

	thumb_func_start sub_8014DF8
sub_8014DF8: @ 8014DF8
	push {r4-r6,lr}
	ldr r3, _08014E68 @ =gBankAttacker
	ldr r1, _08014E6C @ =gTurnOrder
	ldr r0, _08014E70 @ =gCurrentMoveTurn
	ldrb r0, [r0]
	adds r0, r1
	ldrb r0, [r0]
	strb r0, [r3]
	ldr r0, _08014E74 @ =gUnknown_030042A4
	movs r1, 0
	strh r1, [r0]
	ldr r0, _08014E78 @ =gUnknown_030042A0
	strh r1, [r0]
	ldr r6, _08014E7C @ =gBattleCommunication
	ldr r2, _08014E80 @ =gBattleBufferB
	ldrb r0, [r3]
	lsls r0, 9
	adds r1, r2, 0x1
	adds r0, r1
	ldrb r0, [r0]
	subs r0, 0x1
	strb r0, [r6, 0x5]
	ldr r1, _08014E84 @ =gLastUsedItem
	ldrb r0, [r3]
	lsls r0, 9
	adds r2, 0x2
	adds r0, r2
	ldrb r0, [r0]
	strh r0, [r1]
	ldr r2, _08014E88 @ =gSharedMem
	ldr r0, _08014E8C @ =0x00016087
	adds r1, r2, r0
	ldrb r0, [r1]
	cmp r0, 0x2
	bhi _08014E42
	adds r0, 0x1
	strb r0, [r1]
_08014E42:
	ldr r0, _08014E90 @ =0x00016088
	adds r4, r2, r0
	ldrb r5, [r4]
	adds r3, r5, 0
	cmp r3, 0x1
	bls _08014E9C
	ldr r2, _08014E94 @ =gUnknown_081FA70C
	ldrb r1, [r1]
	lsls r0, r1, 1
	adds r0, r1
	ldrb r6, [r6, 0x5]
	adds r0, r6
	adds r0, r2
	ldrb r0, [r0]
	cmp r3, r0
	bcs _08014E98
	movs r0, 0x1
	b _08014E9A
	.align 2, 0
_08014E68: .4byte gBankAttacker
_08014E6C: .4byte gTurnOrder
_08014E70: .4byte gCurrentMoveTurn
_08014E74: .4byte gUnknown_030042A4
_08014E78: .4byte gUnknown_030042A0
_08014E7C: .4byte gBattleCommunication
_08014E80: .4byte gBattleBufferB
_08014E84: .4byte gLastUsedItem
_08014E88: .4byte gSharedMem
_08014E8C: .4byte 0x00016087
_08014E90: .4byte 0x00016088
_08014E94: .4byte gUnknown_081FA70C
_08014E98:
	subs r0, r5, r0
_08014E9A:
	strb r0, [r4]
_08014E9C:
	ldr r1, _08014EB0 @ =gBattlescriptCurrInstr
	ldr r0, _08014EB4 @ =gBattlescriptsForSafariActions
	ldr r0, [r0, 0x8]
	str r0, [r1]
	ldr r1, _08014EB8 @ =gFightStateTracker
	movs r0, 0xA
	strb r0, [r1]
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_08014EB0: .4byte gBattlescriptCurrInstr
_08014EB4: .4byte gBattlescriptsForSafariActions
_08014EB8: .4byte gFightStateTracker
	thumb_func_end sub_8014DF8

	thumb_func_start sub_8014EBC
sub_8014EBC: @ 8014EBC
	push {r4,r5,lr}
	ldr r2, _08014F28 @ =gBankAttacker
	ldr r1, _08014F2C @ =gTurnOrder
	ldr r0, _08014F30 @ =gCurrentMoveTurn
	ldrb r0, [r0]
	adds r0, r1
	ldrb r0, [r0]
	strb r0, [r2]
	ldr r0, _08014F34 @ =gUnknown_030042A4
	movs r5, 0
	strh r5, [r0]
	ldr r0, _08014F38 @ =gUnknown_030042A0
	strh r5, [r0]
	ldr r3, _08014F3C @ =gSharedMem
	ldr r0, _08014F40 @ =0x00016089
	adds r2, r3, r0
	ldr r1, _08014F44 @ =gUnknown_081FA71B
	subs r0, 0x3
	adds r4, r3, r0
	ldrb r0, [r4]
	adds r0, r1
	ldrb r0, [r0]
	ldrb r1, [r2]
	adds r0, r1
	strb r0, [r2]
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x14
	bls _08014EFA
	movs r0, 0x14
	strb r0, [r2]
_08014EFA:
	ldr r0, _08014F48 @ =0x00016088
	adds r2, r3, r0
	ldr r1, _08014F4C @ =gUnknown_081FA71F
	ldrb r0, [r4]
	adds r0, r1
	ldrb r0, [r0]
	ldrb r1, [r2]
	adds r0, r1
	strb r0, [r2]
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x14
	bls _08014F18
	movs r0, 0x14
	strb r0, [r2]
_08014F18:
	ldrb r0, [r4]
	cmp r0, 0x2
	bhi _08014F54
	adds r0, 0x1
	strb r0, [r4]
	ldr r0, _08014F50 @ =gBattleCommunication
	strb r5, [r0, 0x5]
	b _08014F5A
	.align 2, 0
_08014F28: .4byte gBankAttacker
_08014F2C: .4byte gTurnOrder
_08014F30: .4byte gCurrentMoveTurn
_08014F34: .4byte gUnknown_030042A4
_08014F38: .4byte gUnknown_030042A0
_08014F3C: .4byte gSharedMem
_08014F40: .4byte 0x00016089
_08014F44: .4byte gUnknown_081FA71B
_08014F48: .4byte 0x00016088
_08014F4C: .4byte gUnknown_081FA71F
_08014F50: .4byte gBattleCommunication
_08014F54:
	ldr r1, _08014F70 @ =gBattleCommunication
	movs r0, 0x1
	strb r0, [r1, 0x5]
_08014F5A:
	ldr r1, _08014F74 @ =gBattlescriptCurrInstr
	ldr r0, _08014F78 @ =gBattlescriptsForSafariActions
	ldr r0, [r0, 0x4]
	str r0, [r1]
	ldr r1, _08014F7C @ =gFightStateTracker
	movs r0, 0xA
	strb r0, [r1]
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_08014F70: .4byte gBattleCommunication
_08014F74: .4byte gBattlescriptCurrInstr
_08014F78: .4byte gBattlescriptsForSafariActions
_08014F7C: .4byte gFightStateTracker
	thumb_func_end sub_8014EBC

	thumb_func_start bs8_exit_by_flight
bs8_exit_by_flight: @ 8014F80
	push {r4,lr}
	ldr r2, _08014FA8 @ =gBankAttacker
	ldr r1, _08014FAC @ =gTurnOrder
	ldr r4, _08014FB0 @ =gCurrentMoveTurn
	ldrb r0, [r4]
	adds r0, r1
	ldrb r0, [r0]
	strb r0, [r2]
	movs r0, 0x11
	bl PlaySE
	ldr r0, _08014FB4 @ =gNoOfAllBanks
	ldrb r0, [r0]
	strb r0, [r4]
	ldr r1, _08014FB8 @ =gBattleOutcome
	movs r0, 0x4
	strb r0, [r1]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08014FA8: .4byte gBankAttacker
_08014FAC: .4byte gTurnOrder
_08014FB0: .4byte gCurrentMoveTurn
_08014FB4: .4byte gNoOfAllBanks
_08014FB8: .4byte gBattleOutcome
	thumb_func_end bs8_exit_by_flight

	thumb_func_start sub_8014FBC
sub_8014FBC: @ 8014FBC
	ldr r3, _08015008 @ =gBankAttacker
	ldr r1, _0801500C @ =gTurnOrder
	ldr r0, _08015010 @ =gCurrentMoveTurn
	ldrb r0, [r0]
	adds r0, r1
	ldrb r2, [r0]
	strb r2, [r3]
	ldr r0, _08015014 @ =gUnknown_030042A4
	movs r1, 0
	strh r1, [r0]
	ldr r0, _08015018 @ =gUnknown_030042A0
	strh r1, [r0]
	ldr r1, _0801501C @ =gBattleTextBuff1
	movs r0, 0xFD
	strb r0, [r1]
	movs r0, 0x7
	strb r0, [r1, 0x1]
	strb r2, [r1, 0x2]
	ldr r2, _08015020 @ =gBattlePartyID
	ldrb r0, [r3]
	lsls r0, 1
	adds r0, r2
	ldrh r0, [r0]
	strb r0, [r1, 0x3]
	movs r0, 0xFF
	strb r0, [r1, 0x4]
	ldr r1, _08015024 @ =gBattlescriptCurrInstr
	ldr r0, _08015028 @ =gBattlescriptsForSafariActions
	ldr r0, [r0, 0xC]
	str r0, [r1]
	ldr r1, _0801502C @ =gFightStateTracker
	movs r0, 0xA
	strb r0, [r1]
	ldr r1, _08015030 @ =gUnknown_02024A76
	movs r0, 0xC
	strb r0, [r1, 0x1]
	bx lr
	.align 2, 0
_08015008: .4byte gBankAttacker
_0801500C: .4byte gTurnOrder
_08015010: .4byte gCurrentMoveTurn
_08015014: .4byte gUnknown_030042A4
_08015018: .4byte gUnknown_030042A0
_0801501C: .4byte gBattleTextBuff1
_08015020: .4byte gBattlePartyID
_08015024: .4byte gBattlescriptCurrInstr
_08015028: .4byte gBattlescriptsForSafariActions
_0801502C: .4byte gFightStateTracker
_08015030: .4byte gUnknown_02024A76
	thumb_func_end sub_8014FBC

	thumb_func_start bsB_exit_by_move
bsB_exit_by_move: @ 8015034
	push {lr}
	bl sub_80173A4
	lsls r0, 24
	lsrs r1, r0, 24
	cmp r1, 0
	bne _08015050
	ldr r0, _08015054 @ =gSharedMem
	ldr r2, _08015058 @ =0x00016059
	adds r0, r2
	strb r1, [r0]
	ldr r1, _0801505C @ =gFightStateTracker
	movs r0, 0xC
	strb r0, [r1]
_08015050:
	pop {r0}
	bx r0
	.align 2, 0
_08015054: .4byte gSharedMem
_08015058: .4byte 0x00016059
_0801505C: .4byte gFightStateTracker
	thumb_func_end bsB_exit_by_move

	thumb_func_start sub_8015060
sub_8015060: @ 8015060
	ldr r1, _08015080 @ =gCurrentMoveTurn
	ldrb r0, [r1]
	adds r0, 0x1
	strb r0, [r1]
	ldr r3, _08015084 @ =gFightStateTracker
	ldr r2, _08015088 @ =gUnknown_02024A76
	ldrb r0, [r1]
	adds r0, r2
	ldrb r0, [r0]
	strb r0, [r3]
	ldr r2, _0801508C @ =gHitMarker
	ldr r0, [r2]
	ldr r1, _08015090 @ =0xf1e892af
	ands r0, r1
	str r0, [r2]
	bx lr
	.align 2, 0
_08015080: .4byte gCurrentMoveTurn
_08015084: .4byte gFightStateTracker
_08015088: .4byte gUnknown_02024A76
_0801508C: .4byte gHitMarker
_08015090: .4byte 0xf1e892af
	thumb_func_end sub_8015060

	thumb_func_start bsC_8016D70
bsC_8016D70: @ 8015094
	push {r4,r5,lr}
	ldr r1, _0801510C @ =gCurrentMoveTurn
	ldrb r0, [r1]
	adds r0, 0x1
	strb r0, [r1]
	ldr r3, _08015110 @ =gFightStateTracker
	ldr r2, _08015114 @ =gUnknown_02024A76
	ldrb r0, [r1]
	adds r0, r2
	ldrb r0, [r0]
	strb r0, [r3]
	bl SpecialStatusesClear
	ldr r2, _08015118 @ =gHitMarker
	ldr r0, [r2]
	ldr r1, _0801511C @ =0xf1e892af
	ands r0, r1
	str r0, [r2]
	ldr r0, _08015120 @ =gBattleMoveDamage
	movs r4, 0
	str r4, [r0]
	ldr r1, _08015124 @ =gSharedMem
	ldr r2, _08015128 @ =0x00016002
	adds r0, r1, r2
	strb r4, [r0]
	ldr r3, _0801512C @ =0x000160a1
	adds r0, r1, r3
	strb r4, [r0]
	ldr r2, _08015130 @ =gMoveHitWith
	ldr r5, _08015134 @ =gBankAttacker
	ldrb r0, [r5]
	lsls r0, 1
	adds r0, r2
	movs r2, 0
	strh r4, [r0]
	ldr r3, _08015138 @ =gUnknown_02024C44
	ldrb r0, [r5]
	lsls r0, 1
	adds r0, r3
	strh r4, [r0]
	ldr r3, _0801513C @ =0x0001601c
	adds r0, r1, r3
	strb r2, [r0]
	ldr r0, _08015140 @ =gDynamicBasePower
	strh r4, [r0]
	subs r3, 0x10
	adds r0, r1, r3
	strb r2, [r0]
	ldr r0, _08015144 @ =gBattleCommunication
	strb r2, [r0, 0x3]
	strb r2, [r0, 0x4]
	ldr r3, _08015148 @ =0x00016112
	adds r0, r1, r3
	strb r2, [r0]
	ldr r0, _0801514C @ =0x00017130
	adds r1, r0
	strb r2, [r1]
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_0801510C: .4byte gCurrentMoveTurn
_08015110: .4byte gFightStateTracker
_08015114: .4byte gUnknown_02024A76
_08015118: .4byte gHitMarker
_0801511C: .4byte 0xf1e892af
_08015120: .4byte gBattleMoveDamage
_08015124: .4byte gSharedMem
_08015128: .4byte 0x00016002
_0801512C: .4byte 0x000160a1
_08015130: .4byte gMoveHitWith
_08015134: .4byte gBankAttacker
_08015138: .4byte gUnknown_02024C44
_0801513C: .4byte 0x0001601c
_08015140: .4byte gDynamicBasePower
_08015144: .4byte gBattleCommunication
_08015148: .4byte 0x00016112
_0801514C: .4byte 0x00017130
	thumb_func_end bsC_8016D70

	thumb_func_start GetBattleBank
GetBattleBank: @ 8015150
	push {lr}
	lsls r0, 24
	lsrs r0, 24
	movs r2, 0
	cmp r0, 0xA
	bhi _080151C8
	lsls r0, 2
	ldr r1, _08015168 @ =_0801516C
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_08015168: .4byte _0801516C
	.align 2, 0
_0801516C:
	.4byte _08015198
	.4byte _080151A0
	.4byte _080151A8
	.4byte _080151C4
	.4byte _080151C8
	.4byte _080151C4
	.4byte _080151C8
	.4byte _080151B0
	.4byte _080151C8
	.4byte _080151C8
	.4byte _080151B4
_08015198:
	ldr r0, _0801519C @ =gBankTarget
	b _080151C6
	.align 2, 0
_0801519C: .4byte gBankTarget
_080151A0:
	ldr r0, _080151A4 @ =gBankAttacker
	b _080151C6
	.align 2, 0
_080151A4: .4byte gBankAttacker
_080151A8:
	ldr r0, _080151AC @ =gEffectBank
	b _080151C6
	.align 2, 0
_080151AC: .4byte gEffectBank
_080151B0:
	movs r2, 0
	b _080151C8
_080151B4:
	ldr r0, _080151BC @ =gSharedMem
	ldr r1, _080151C0 @ =0x00016003
	adds r0, r1
	b _080151C6
	.align 2, 0
_080151BC: .4byte gSharedMem
_080151C0: .4byte 0x00016003
_080151C4:
	ldr r0, _080151D0 @ =gBank1
_080151C6:
	ldrb r2, [r0]
_080151C8:
	adds r0, r2, 0
	pop {r1}
	bx r1
	.align 2, 0
_080151D0: .4byte gBank1
	thumb_func_end GetBattleBank

	thumb_func_start PressurePPLose
PressurePPLose: @ 80151D4
	push {r4-r7,lr}
	sub sp, 0x4
	lsls r0, 24
	lsrs r0, 24
	lsls r1, 24
	lsrs r5, r1, 24
	lsls r2, 16
	lsrs r2, 16
	ldr r1, _08015204 @ =gBattleMons
	movs r4, 0x58
	muls r0, r4
	adds r0, r1
	adds r0, 0x20
	ldrb r0, [r0]
	mov r12, r1
	cmp r0, 0x2E
	bne _08015286
	movs r3, 0
	adds r0, r5, 0
	muls r0, r4
	adds r1, 0xC
	adds r1, r0, r1
	b _08015210
	.align 2, 0
_08015204: .4byte gBattleMons
_08015208:
	adds r1, 0x2
	adds r3, 0x1
	cmp r3, 0x3
	bgt _08015216
_08015210:
	ldrh r0, [r1]
	cmp r0, r2
	bne _08015208
_08015216:
	cmp r3, 0x4
	beq _08015286
	movs r7, 0x58
	adds r2, r5, 0
	muls r2, r7
	adds r0, r3, r2
	mov r6, r12
	adds r6, 0x24
	adds r1, r0, r6
	ldrb r0, [r1]
	cmp r0, 0
	beq _08015232
	subs r0, 0x1
	strb r0, [r1]
_08015232:
	mov r0, r12
	adds r0, 0x50
	adds r0, r2, r0
	ldr r0, [r0]
	movs r1, 0x80
	lsls r1, 14
	ands r0, r1
	cmp r0, 0
	bne _08015286
	ldr r1, _08015290 @ =gDisableStructs
	lsls r0, r5, 3
	subs r0, r5
	lsls r0, 2
	adds r0, r1
	ldrb r1, [r0, 0x18]
	lsrs r1, 4
	ldr r2, _08015294 @ =gBitTable
	lsls r0, r3, 2
	adds r0, r2
	ldr r0, [r0]
	ands r1, r0
	cmp r1, 0
	bne _08015286
	ldr r4, _08015298 @ =gActiveBank
	strb r5, [r4]
	adds r1, r3, 0
	adds r1, 0x9
	lsls r1, 24
	lsrs r1, 24
	ldrb r0, [r4]
	muls r0, r7
	adds r0, r6
	adds r0, r3
	str r0, [sp]
	movs r0, 0
	movs r2, 0
	movs r3, 0x1
	bl EmitSetAttributes
	ldrb r0, [r4]
	bl MarkBufferBankForExecution
_08015286:
	add sp, 0x4
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_08015290: .4byte gDisableStructs
_08015294: .4byte gBitTable
_08015298: .4byte gActiveBank
	thumb_func_end PressurePPLose

	thumb_func_start sub_801529C
sub_801529C: @ 801529C
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	sub sp, 0x4
	lsls r0, 24
	lsrs r5, r0, 24
	movs r0, 0x4
	mov r8, r0
	adds r0, r5, 0
	bl GetBankSide
	lsls r0, 24
	lsrs r0, 24
	mov r9, r0
	movs r4, 0
	ldr r0, _080153BC @ =gNoOfAllBanks
	ldrb r0, [r0]
	cmp r4, r0
	bge _08015344
	ldr r1, _080153C0 @ =gBattleMons
	movs r0, 0x58
	adds r7, r5, 0
	muls r7, r0
	adds r1, 0xC
	mov r10, r1
_080152D2:
	lsls r0, r4, 24
	lsrs r0, 24
	bl GetBankSide
	lsls r0, 24
	lsrs r0, 24
	adds r6, r4, 0x1
	cmp r9, r0
	beq _0801533A
	ldr r0, _080153C0 @ =gBattleMons
	movs r3, 0x58
	adds r1, r4, 0
	muls r1, r3
	adds r1, r0
	adds r1, 0x20
	ldrb r1, [r1]
	adds r4, r0, 0
	cmp r1, 0x2E
	bne _0801533A
	movs r2, 0
	adds r0, r5, 0
	muls r0, r3
	adds r1, r4, 0
	adds r1, 0xC
	adds r0, r1
	ldrh r0, [r0]
	movs r1, 0x8F
	lsls r1, 1
	cmp r0, r1
	beq _08015322
	adds r3, r1, 0
	mov r0, r10
	adds r1, r7, r0
_08015314:
	adds r1, 0x2
	adds r2, 0x1
	cmp r2, 0x3
	bgt _08015322
	ldrh r0, [r1]
	cmp r0, r3
	bne _08015314
_08015322:
	cmp r2, 0x4
	beq _0801533A
	mov r8, r2
	adds r1, r2, r7
	adds r0, r4, 0
	adds r0, 0x24
	adds r1, r0
	ldrb r0, [r1]
	cmp r0, 0
	beq _0801533A
	subs r0, 0x1
	strb r0, [r1]
_0801533A:
	adds r4, r6, 0
	ldr r0, _080153BC @ =gNoOfAllBanks
	ldrb r0, [r0]
	cmp r4, r0
	blt _080152D2
_08015344:
	mov r1, r8
	cmp r1, 0x4
	beq _080153AC
	ldr r6, _080153C0 @ =gBattleMons
	movs r3, 0x58
	adds r0, r5, 0
	muls r0, r3
	adds r1, r6, 0
	adds r1, 0x50
	adds r0, r1
	ldr r0, [r0]
	movs r1, 0x80
	lsls r1, 14
	ands r0, r1
	cmp r0, 0
	bne _080153AC
	ldr r1, _080153C4 @ =gDisableStructs
	lsls r0, r5, 3
	subs r0, r5
	lsls r0, 2
	adds r0, r1
	ldrb r1, [r0, 0x18]
	lsrs r1, 4
	ldr r2, _080153C8 @ =gBitTable
	mov r4, r8
	lsls r0, r4, 2
	adds r0, r2
	ldr r0, [r0]
	ands r1, r0
	cmp r1, 0
	bne _080153AC
	ldr r4, _080153CC @ =gActiveBank
	strb r5, [r4]
	mov r1, r8
	adds r1, 0x9
	lsls r1, 24
	lsrs r1, 24
	ldrb r0, [r4]
	muls r0, r3
	adds r2, r6, 0
	adds r2, 0x24
	adds r0, r2
	add r0, r8
	str r0, [sp]
	movs r0, 0
	movs r2, 0
	movs r3, 0x1
	bl EmitSetAttributes
	ldrb r0, [r4]
	bl MarkBufferBankForExecution
_080153AC:
	add sp, 0x4
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080153BC: .4byte gNoOfAllBanks
_080153C0: .4byte gBattleMons
_080153C4: .4byte gDisableStructs
_080153C8: .4byte gBitTable
_080153CC: .4byte gActiveBank
	thumb_func_end sub_801529C

	thumb_func_start sub_80153D0
sub_80153D0: @ 80153D0
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	sub sp, 0x4
	lsls r0, 24
	lsrs r3, r0, 24
	movs r6, 0x4
	movs r1, 0
	ldr r0, _080154C8 @ =gNoOfAllBanks
	mov r8, r0
	ldrb r0, [r0]
	cmp r1, r0
	bge _08015452
	ldr r7, _080154CC @ =gBattleMons
	movs r2, 0x58
	mov r12, r2
	mov r5, r12
	muls r5, r3
	adds r0, r7, 0
	adds r0, 0xC
	adds r2, r5, r0
	mov r10, r2
	mov r9, r5
_08015402:
	mov r0, r12
	muls r0, r1
	adds r0, r7
	adds r0, 0x20
	ldrb r0, [r0]
	adds r4, r1, 0x1
	cmp r0, 0x2E
	bne _08015448
	cmp r1, r3
	beq _08015448
	movs r2, 0
	mov r1, r10
	ldrh r0, [r1]
	cmp r0, 0xC3
	beq _08015432
	ldr r1, _080154D0 @ =gUnknown_02024A8C
	add r1, r9
_08015424:
	adds r1, 0x2
	adds r2, 0x1
	cmp r2, 0x3
	bgt _08015432
	ldrh r0, [r1]
	cmp r0, 0xC3
	bne _08015424
_08015432:
	cmp r2, 0x4
	beq _08015448
	adds r6, r2, 0
	adds r0, r6, r5
	ldr r2, _080154D4 @ =gUnknown_02024AA4
	adds r1, r0, r2
	ldrb r0, [r1]
	cmp r0, 0
	beq _08015448
	subs r0, 0x1
	strb r0, [r1]
_08015448:
	adds r1, r4, 0
	mov r0, r8
	ldrb r0, [r0]
	cmp r1, r0
	blt _08015402
_08015452:
	cmp r6, 0x4
	beq _080154B6
	ldr r7, _080154CC @ =gBattleMons
	movs r5, 0x58
	adds r0, r3, 0
	muls r0, r5
	adds r1, r7, 0
	adds r1, 0x50
	adds r0, r1
	ldr r0, [r0]
	movs r1, 0x80
	lsls r1, 14
	ands r0, r1
	cmp r0, 0
	bne _080154B6
	ldr r1, _080154D8 @ =gDisableStructs
	lsls r0, r3, 3
	subs r0, r3
	lsls r0, 2
	adds r0, r1
	ldrb r1, [r0, 0x18]
	lsrs r1, 4
	ldr r2, _080154DC @ =gBitTable
	lsls r0, r6, 2
	adds r0, r2
	ldr r0, [r0]
	ands r1, r0
	cmp r1, 0
	bne _080154B6
	ldr r4, _080154E0 @ =gActiveBank
	strb r3, [r4]
	adds r1, r6, 0
	adds r1, 0x9
	lsls r1, 24
	lsrs r1, 24
	ldrb r0, [r4]
	muls r0, r5
	adds r2, r7, 0
	adds r2, 0x24
	adds r0, r2
	adds r0, r6
	str r0, [sp]
	movs r0, 0
	movs r2, 0
	movs r3, 0x1
	bl EmitSetAttributes
	ldrb r0, [r4]
	bl MarkBufferBankForExecution
_080154B6:
	add sp, 0x4
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080154C8: .4byte gNoOfAllBanks
_080154CC: .4byte gBattleMons
_080154D0: .4byte gUnknown_02024A8C
_080154D4: .4byte gUnknown_02024AA4
_080154D8: .4byte gDisableStructs
_080154DC: .4byte gBitTable
_080154E0: .4byte gActiveBank
	thumb_func_end sub_80153D0

	thumb_func_start unref_sub_80154E4
unref_sub_80154E4: @ 80154E4
	push {r4,r5,lr}
	ldr r0, _08015514 @ =gBattleTypeFlags
	ldrh r1, [r0]
	movs r0, 0x2
	ands r0, r1
	cmp r0, 0
	beq _08015524
	movs r2, 0
	ldr r4, _08015518 @ =gNoOfAllBanks
	ldrb r0, [r4]
	cmp r2, r0
	bge _08015542
	ldr r3, _0801551C @ =gBattleExecBuffer
	ldr r5, _08015520 @ =gBitTable
_08015500:
	ldm r5!, {r1}
	lsls r1, 28
	ldr r0, [r3]
	orrs r0, r1
	str r0, [r3]
	adds r2, 0x1
	ldrb r0, [r4]
	cmp r2, r0
	blt _08015500
	b _08015542
	.align 2, 0
_08015514: .4byte gBattleTypeFlags
_08015518: .4byte gNoOfAllBanks
_0801551C: .4byte gBattleExecBuffer
_08015520: .4byte gBitTable
_08015524:
	movs r2, 0
	ldr r4, _08015548 @ =gNoOfAllBanks
	ldrb r0, [r4]
	cmp r2, r0
	bge _08015542
	ldr r3, _0801554C @ =gBattleExecBuffer
	ldr r5, _08015550 @ =gBitTable
_08015532:
	ldr r0, [r3]
	ldm r5!, {r1}
	orrs r0, r1
	str r0, [r3]
	adds r2, 0x1
	ldrb r0, [r4]
	cmp r2, r0
	blt _08015532
_08015542:
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_08015548: .4byte gNoOfAllBanks
_0801554C: .4byte gBattleExecBuffer
_08015550: .4byte gBitTable
	thumb_func_end unref_sub_80154E4

	thumb_func_start MarkBufferBankForExecution
MarkBufferBankForExecution: @ 8015554
	push {lr}
	lsls r0, 24
	lsrs r3, r0, 24
	ldr r0, _0801557C @ =gBattleTypeFlags
	ldrh r1, [r0]
	movs r0, 0x2
	ands r0, r1
	cmp r0, 0
	beq _08015588
	ldr r2, _08015580 @ =gBattleExecBuffer
	ldr r1, _08015584 @ =gBitTable
	lsls r0, r3, 2
	adds r0, r1
	ldr r1, [r0]
	lsls r1, 28
	ldr r0, [r2]
	orrs r0, r1
	str r0, [r2]
	b _08015598
	.align 2, 0
_0801557C: .4byte gBattleTypeFlags
_08015580: .4byte gBattleExecBuffer
_08015584: .4byte gBitTable
_08015588:
	ldr r2, _0801559C @ =gBattleExecBuffer
	ldr r1, _080155A0 @ =gBitTable
	lsls r0, r3, 2
	adds r0, r1
	ldr r1, [r2]
	ldr r0, [r0]
	orrs r1, r0
	str r1, [r2]
_08015598:
	pop {r0}
	bx r0
	.align 2, 0
_0801559C: .4byte gBattleExecBuffer
_080155A0: .4byte gBitTable
	thumb_func_end MarkBufferBankForExecution

	thumb_func_start sub_80155A4
sub_80155A4: @ 80155A4
	push {r4-r7,lr}
	lsls r0, 24
	lsrs r7, r0, 24
	movs r4, 0
	ldr r5, _080155B8 @ =gBattleExecBuffer
	ldr r1, _080155BC @ =gBitTable
	lsls r0, r7, 2
	adds r6, r0, r1
	b _080155CE
	.align 2, 0
_080155B8: .4byte gBattleExecBuffer
_080155BC: .4byte gBitTable
_080155C0:
	lsls r0, r4, 2
	ldr r1, [r6]
	lsls r1, r0
	ldr r0, [r5]
	orrs r0, r1
	str r0, [r5]
	adds r4, 0x1
_080155CE:
	bl GetLinkPlayerCount
	lsls r0, 24
	lsrs r0, 24
	cmp r4, r0
	blt _080155C0
	ldr r2, _080155F0 @ =gBattleExecBuffer
	movs r1, 0x80
	lsls r1, 21
	lsls r1, r7
	ldr r0, [r2]
	bics r0, r1
	str r0, [r2]
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080155F0: .4byte gBattleExecBuffer
	thumb_func_end sub_80155A4

	thumb_func_start CancelMultiTurnMoves
CancelMultiTurnMoves: @ 80155F4
	lsls r0, 24
	lsrs r0, 24
	ldr r1, _08015644 @ =gBattleMons
	movs r2, 0x58
	adds r3, r0, 0
	muls r3, r2
	adds r1, 0x50
	adds r3, r1
	ldr r1, [r3]
	ldr r2, _08015648 @ =0xffffefff
	ands r1, r2
	ldr r2, _0801564C @ =0xfffff3ff
	ands r1, r2
	movs r2, 0x71
	negs r2, r2
	ands r1, r2
	ldr r2, _08015650 @ =0xfffffcff
	ands r1, r2
	str r1, [r3]
	ldr r1, _08015654 @ =gStatuses3
	lsls r2, r0, 2
	adds r2, r1
	ldr r1, [r2]
	ldr r3, _08015658 @ =0xfffbff3f
	ands r1, r3
	str r1, [r2]
	ldr r2, _0801565C @ =gDisableStructs
	lsls r1, r0, 3
	subs r1, r0
	lsls r1, 2
	adds r1, r2
	ldrb r2, [r1, 0x11]
	movs r0, 0x10
	negs r0, r0
	ands r0, r2
	strb r0, [r1, 0x11]
	movs r0, 0
	strb r0, [r1, 0x10]
	bx lr
	.align 2, 0
_08015644: .4byte gBattleMons
_08015648: .4byte 0xffffefff
_0801564C: .4byte 0xfffff3ff
_08015650: .4byte 0xfffffcff
_08015654: .4byte gStatuses3
_08015658: .4byte 0xfffbff3f
_0801565C: .4byte gDisableStructs
	thumb_func_end CancelMultiTurnMoves

	thumb_func_start sub_8015660
sub_8015660: @ 8015660
	push {lr}
	lsls r0, 24
	ldr r1, _080156AC @ =gProtectStructs
	lsrs r0, 20
	adds r1, r0, r1
	ldrb r0, [r1]
	lsrs r0, 7
	cmp r0, 0
	bne _080156A6
	ldrb r2, [r1, 0x1]
	lsls r0, r2, 30
	cmp r0, 0
	blt _080156A6
	lsls r0, r2, 26
	cmp r0, 0
	blt _080156A6
	lsls r0, r2, 25
	cmp r0, 0
	blt _080156A6
	lsrs r0, r2, 7
	cmp r0, 0
	bne _080156A6
	ldrb r1, [r1, 0x2]
	lsls r0, r1, 31
	cmp r0, 0
	bne _080156A6
	lsls r0, r1, 30
	cmp r0, 0
	blt _080156A6
	lsls r0, r1, 29
	cmp r0, 0
	blt _080156A6
	lsls r0, r2, 31
	cmp r0, 0
	beq _080156B0
_080156A6:
	movs r0, 0x1
	b _080156B2
	.align 2, 0
_080156AC: .4byte gProtectStructs
_080156B0:
	movs r0, 0
_080156B2:
	pop {r1}
	bx r1
	thumb_func_end sub_8015660

	thumb_func_start PrepareStringBattle
PrepareStringBattle: @ 80156B8
	push {r4,lr}
	adds r2, r0, 0
	lsls r2, 16
	lsrs r2, 16
	ldr r4, _080156D8 @ =gActiveBank
	strb r1, [r4]
	movs r0, 0
	adds r1, r2, 0
	bl EmitPrintString
	ldrb r0, [r4]
	bl MarkBufferBankForExecution
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080156D8: .4byte gActiveBank
	thumb_func_end PrepareStringBattle

	thumb_func_start sub_80156DC
sub_80156DC: @ 80156DC
	push {r4-r6,lr}
	movs r3, 0
	ldr r0, _08015730 @ =gSentPokesToOpponent
	strb r3, [r0]
	strb r3, [r0, 0x1]
	movs r1, 0
	ldr r0, _08015734 @ =gNoOfAllBanks
	ldrb r2, [r0]
	adds r6, r0, 0
	cmp r1, r2
	bge _0801570A
	ldr r5, _08015738 @ =gBitTable
	adds r4, r2, 0
	ldr r2, _0801573C @ =gBattlePartyID
_080156F8:
	ldrh r0, [r2]
	lsls r0, 2
	adds r0, r5
	ldr r0, [r0]
	orrs r3, r0
	adds r2, 0x4
	adds r1, 0x2
	cmp r1, r4
	blt _080156F8
_0801570A:
	movs r1, 0x1
	adds r2, r6, 0
	ldrb r0, [r2]
	cmp r1, r0
	bge _0801572A
	ldr r5, _08015730 @ =gSentPokesToOpponent
	movs r4, 0x2
_08015718:
	adds r0, r1, 0
	ands r0, r4
	asrs r0, 1
	adds r0, r5
	strb r3, [r0]
	adds r1, 0x2
	ldrb r0, [r2]
	cmp r1, r0
	blt _08015718
_0801572A:
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_08015730: .4byte gSentPokesToOpponent
_08015734: .4byte gNoOfAllBanks
_08015738: .4byte gBitTable
_0801573C: .4byte gBattlePartyID
	thumb_func_end sub_80156DC

	thumb_func_start sub_8015740
sub_8015740: @ 8015740
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	lsls r0, 24
	lsrs r5, r0, 24
	movs r4, 0
	adds r0, r5, 0
	bl GetBankSide
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _080157A4
	movs r0, 0x2
	ands r0, r5
	lsls r0, 24
	lsrs r0, 25
	mov r12, r0
	ldr r1, _080157B0 @ =gSentPokesToOpponent
	adds r0, r1
	strb r4, [r0]
	adds r5, r4, 0
	ldr r0, _080157B4 @ =gNoOfAllBanks
	ldrb r2, [r0]
	mov r8, r1
	cmp r4, r2
	bge _0801579E
	ldr r0, _080157B8 @ =gAbsentBankFlags
	ldrb r7, [r0]
	ldr r1, _080157BC @ =gBitTable
	adds r6, r2, 0
	ldr r3, _080157C0 @ =gBattlePartyID
	adds r2, r1, 0
_08015782:
	ldr r0, [r2]
	ands r0, r7
	cmp r0, 0
	bne _08015794
	ldrh r0, [r3]
	lsls r0, 2
	adds r0, r1
	ldr r0, [r0]
	orrs r4, r0
_08015794:
	adds r3, 0x4
	adds r2, 0x8
	adds r5, 0x2
	cmp r5, r6
	blt _08015782
_0801579E:
	mov r0, r12
	add r0, r8
	strb r4, [r0]
_080157A4:
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080157B0: .4byte gSentPokesToOpponent
_080157B4: .4byte gNoOfAllBanks
_080157B8: .4byte gAbsentBankFlags
_080157BC: .4byte gBitTable
_080157C0: .4byte gBattlePartyID
	thumb_func_end sub_8015740

	thumb_func_start sub_80157C4
sub_80157C4: @ 80157C4
	push {r4-r7,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	adds r0, r4, 0
	bl GetBankSide
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _080157E0
	adds r0, r4, 0
	bl sub_8015740
	b _08015816
_080157E0:
	movs r3, 0x1
	ldr r5, _0801581C @ =gNoOfAllBanks
	ldrb r0, [r5]
	cmp r3, r0
	bge _08015816
	ldr r0, _08015820 @ =gSentPokesToOpponent
	mov r12, r0
	movs r7, 0x2
	ldr r6, _08015824 @ =gBitTable
	ldr r1, _08015828 @ =gBattlePartyID
	lsls r0, r4, 1
	adds r4, r0, r1
_080157F8:
	adds r2, r3, 0
	ands r2, r7
	asrs r2, 1
	add r2, r12
	ldrh r0, [r4]
	lsls r0, 2
	adds r0, r6
	ldr r0, [r0]
	ldrb r1, [r2]
	orrs r0, r1
	strb r0, [r2]
	adds r3, 0x1
	ldrb r0, [r5]
	cmp r3, r0
	blt _080157F8
_08015816:
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_0801581C: .4byte gNoOfAllBanks
_08015820: .4byte gSentPokesToOpponent
_08015824: .4byte gBitTable
_08015828: .4byte gBattlePartyID
	thumb_func_end sub_80157C4

	.align 2, 0 @ Don't pad with nop.
