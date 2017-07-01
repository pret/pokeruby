	.include "constants/gba_constants.inc"
	.include "constants/species_constants.inc"
	.include "asm/macros.inc"

	.syntax unified

	.text
	
	thumb_func_start nullsub_91
nullsub_91: @ 802BF70
	bx lr
	thumb_func_end nullsub_91

	thumb_func_start SetBankFuncToPlayerBufferRunCommand
SetBankFuncToPlayerBufferRunCommand: @ 802BF74
	ldr r1, _0802BF8C @ =gBattleBankFunc
	ldr r0, _0802BF90 @ =gActiveBank
	ldrb r0, [r0]
	lsls r0, 2
	adds r0, r1
	ldr r1, _0802BF94 @ =PlayerBufferRunCommand
	str r1, [r0]
	ldr r1, _0802BF98 @ =gDoingBattleAnim
	movs r0, 0
	strb r0, [r1]
	bx lr
	.align 2, 0
_0802BF8C: .4byte gBattleBankFunc
_0802BF90: .4byte gActiveBank
_0802BF94: .4byte PlayerBufferRunCommand
_0802BF98: .4byte gDoingBattleAnim
	thumb_func_end SetBankFuncToPlayerBufferRunCommand

	thumb_func_start PlayerBufferExecCompleted
PlayerBufferExecCompleted: @ 802BF9C
	push {r4,lr}
	sub sp, 0x4
	ldr r1, _0802BFDC @ =gBattleBankFunc
	ldr r4, _0802BFE0 @ =gActiveBank
	ldrb r0, [r4]
	lsls r0, 2
	adds r0, r1
	ldr r1, _0802BFE4 @ =PlayerBufferRunCommand
	str r1, [r0]
	ldr r0, _0802BFE8 @ =gBattleTypeFlags
	ldrh r1, [r0]
	movs r0, 0x2
	ands r0, r1
	cmp r0, 0
	beq _0802BFF0
	bl GetMultiplayerId
	mov r1, sp
	strb r0, [r1]
	movs r0, 0x2
	movs r1, 0x4
	mov r2, sp
	bl dp01_prepare_buffer_wireless_probably
	ldr r1, _0802BFEC @ =gBattleBufferA
	ldrb r0, [r4]
	lsls r0, 9
	adds r0, r1
	movs r1, 0x38
	strb r1, [r0]
	b _0802C002
	.align 2, 0
_0802BFDC: .4byte gBattleBankFunc
_0802BFE0: .4byte gActiveBank
_0802BFE4: .4byte PlayerBufferRunCommand
_0802BFE8: .4byte gBattleTypeFlags
_0802BFEC: .4byte gBattleBufferA
_0802BFF0:
	ldr r2, _0802C00C @ =gBattleExecBuffer
	ldr r1, _0802C010 @ =gBitTable
	ldrb r0, [r4]
	lsls r0, 2
	adds r0, r1
	ldr r1, [r0]
	ldr r0, [r2]
	bics r0, r1
	str r0, [r2]
_0802C002:
	add sp, 0x4
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0802C00C: .4byte gBattleExecBuffer
_0802C010: .4byte gBitTable
	thumb_func_end PlayerBufferExecCompleted

	thumb_func_start PlayerBufferRunCommand
PlayerBufferRunCommand: @ 802C014
	push {lr}
	ldr r2, _0802C048 @ =gBattleExecBuffer
	ldr r1, _0802C04C @ =gBitTable
	ldr r0, _0802C050 @ =gActiveBank
	ldrb r3, [r0]
	lsls r0, r3, 2
	adds r0, r1
	ldr r1, [r2]
	ldr r0, [r0]
	ands r1, r0
	cmp r1, 0
	beq _0802C060
	ldr r0, _0802C054 @ =gBattleBufferA
	lsls r1, r3, 9
	adds r1, r0
	ldrb r0, [r1]
	cmp r0, 0x38
	bhi _0802C05C
	ldr r0, _0802C058 @ =gPlayerBufferCommands
	ldrb r1, [r1]
	lsls r1, 2
	adds r1, r0
	ldr r0, [r1]
	bl _call_via_r0
	b _0802C060
	.align 2, 0
_0802C048: .4byte gBattleExecBuffer
_0802C04C: .4byte gBitTable
_0802C050: .4byte gActiveBank
_0802C054: .4byte gBattleBufferA
_0802C058: .4byte gPlayerBufferCommands
_0802C05C:
	bl PlayerBufferExecCompleted
_0802C060:
	pop {r0}
	bx r0
	thumb_func_end PlayerBufferRunCommand

	thumb_func_start bx_0802E404
bx_0802E404: @ 802C064
	push {lr}
	ldr r2, _0802C08C @ =gSprites
	ldr r1, _0802C090 @ =gObjectBankIDs
	ldr r0, _0802C094 @ =gActiveBank
	ldrb r0, [r0]
	adds r0, r1
	ldrb r1, [r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r2
	movs r1, 0x24
	ldrsh r0, [r0, r1]
	cmp r0, 0
	bne _0802C086
	bl PlayerBufferExecCompleted
_0802C086:
	pop {r0}
	bx r0
	.align 2, 0
_0802C08C: .4byte gSprites
_0802C090: .4byte gObjectBankIDs
_0802C094: .4byte gActiveBank
	thumb_func_end bx_0802E404

	thumb_func_start sub_802C098
sub_802C098: @ 802C098
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	ldr r7, _0802C0FC @ =gBattleBufferA
	ldr r4, _0802C100 @ =gActiveBank
	ldrb r0, [r4]
	lsls r2, r0, 9
	adds r1, r7, 0x2
	adds r1, r2, r1
	ldrb r5, [r1]
	adds r1, r7, 0x3
	adds r2, r1
	ldrb r1, [r2]
	lsls r1, 8
	orrs r5, r1
	movs r1, 0x1
	movs r2, 0x7
	movs r3, 0x1
	bl dp11b_obj_instanciate
	ldrb r0, [r4]
	movs r1, 0
	movs r2, 0x7
	movs r3, 0x1
	bl dp11b_obj_instanciate
	ldr r0, _0802C104 @ =gMain
	ldrh r1, [r0, 0x2E]
	movs r2, 0x1
	adds r0, r2, 0
	ands r0, r1
	cmp r0, 0
	beq _0802C13E
	movs r0, 0x5
	bl PlaySE
	bl DestroyMenuCursor
	ldr r1, _0802C108 @ =gActionSelectionCursor
	ldrb r0, [r4]
	adds r0, r1
	ldrb r0, [r0]
	cmp r0, 0x1
	beq _0802C11C
	cmp r0, 0x1
	bgt _0802C10C
	cmp r0, 0
	beq _0802C116
	b _0802C138
	.align 2, 0
_0802C0FC: .4byte gBattleBufferA
_0802C100: .4byte gActiveBank
_0802C104: .4byte gMain
_0802C108: .4byte gActionSelectionCursor
_0802C10C:
	cmp r0, 0x2
	beq _0802C122
	cmp r0, 0x3
	beq _0802C12E
	b _0802C138
_0802C116:
	movs r0, 0x1
	movs r1, 0
	b _0802C126
_0802C11C:
	movs r0, 0x1
	movs r1, 0x1
	b _0802C126
_0802C122:
	movs r0, 0x1
	movs r1, 0x2
_0802C126:
	movs r2, 0
	bl dp01_build_cmdbuf_x21_a_bb
	b _0802C138
_0802C12E:
	movs r0, 0x1
	movs r1, 0x3
	movs r2, 0
	bl dp01_build_cmdbuf_x21_a_bb
_0802C138:
	bl PlayerBufferExecCompleted
	b _0802C2AC
_0802C13E:
	movs r0, 0x20
	ands r0, r1
	cmp r0, 0
	beq _0802C178
	ldr r5, _0802C174 @ =gActionSelectionCursor
	ldrb r0, [r4]
	adds r0, r5
	ldrb r1, [r0]
	adds r0, r2, 0
	ands r0, r1
	cmp r0, 0
	bne _0802C158
	b _0802C2AC
_0802C158:
	movs r0, 0x5
	bl PlaySE
	ldrb r0, [r4]
	adds r0, r5
	ldrb r0, [r0]
	bl nullsub_8
	ldrb r1, [r4]
	adds r1, r5
	ldrb r0, [r1]
	movs r2, 0x1
	b _0802C200
	.align 2, 0
_0802C174: .4byte gActionSelectionCursor
_0802C178:
	movs r0, 0x10
	ands r0, r1
	cmp r0, 0
	beq _0802C1B0
	ldr r5, _0802C1AC @ =gActionSelectionCursor
	ldrb r0, [r4]
	adds r0, r5
	ldrb r1, [r0]
	adds r0, r2, 0
	ands r0, r1
	cmp r0, 0
	beq _0802C192
	b _0802C2AC
_0802C192:
	movs r0, 0x5
	bl PlaySE
	ldrb r0, [r4]
	adds r0, r5
	ldrb r0, [r0]
	bl nullsub_8
	ldrb r1, [r4]
	adds r1, r5
	ldrb r0, [r1]
	movs r2, 0x1
	b _0802C200
	.align 2, 0
_0802C1AC: .4byte gActionSelectionCursor
_0802C1B0:
	movs r0, 0x40
	mov r8, r0
	ands r0, r1
	cmp r0, 0
	beq _0802C1D0
	ldr r5, _0802C1CC @ =gActionSelectionCursor
	ldrb r0, [r4]
	adds r0, r5
	ldrb r1, [r0]
	movs r0, 0x2
	ands r0, r1
	cmp r0, 0
	beq _0802C2AC
	b _0802C1E8
	.align 2, 0
_0802C1CC: .4byte gActionSelectionCursor
_0802C1D0:
	movs r0, 0x80
	ands r0, r1
	cmp r0, 0
	beq _0802C218
	ldr r5, _0802C214 @ =gActionSelectionCursor
	ldrb r0, [r4]
	adds r0, r5
	ldrb r1, [r0]
	movs r0, 0x2
	ands r0, r1
	cmp r0, 0
	bne _0802C2AC
_0802C1E8:
	movs r0, 0x5
	bl PlaySE
	ldrb r0, [r4]
	adds r0, r5
	ldrb r0, [r0]
	bl nullsub_8
	ldrb r1, [r4]
	adds r1, r5
	ldrb r0, [r1]
	movs r2, 0x2
_0802C200:
	eors r0, r2
	strb r0, [r1]
	ldrb r0, [r4]
	adds r0, r5
	ldrb r0, [r0]
	movs r1, 0
	bl sub_802E3E4
	b _0802C2AC
	.align 2, 0
_0802C214: .4byte gActionSelectionCursor
_0802C218:
	movs r0, 0x2
	ands r0, r1
	cmp r0, 0
	beq _0802C2A0
	ldr r6, _0802C294 @ =gBattleTypeFlags
	ldrh r1, [r6]
	adds r0, r2, 0
	ands r0, r1
	cmp r0, 0
	beq _0802C2AC
	ldrb r0, [r4]
	bl GetBankIdentity
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x2
	bne _0802C2AC
	movs r0, 0
	bl GetBankByPlayerAI
	ldr r1, _0802C298 @ =gAbsentBankFlags
	ldrb r1, [r1]
	ldr r2, _0802C29C @ =gBitTable
	lsls r0, 24
	lsrs r0, 22
	adds r0, r2
	ldr r0, [r0]
	ands r1, r0
	cmp r1, 0
	bne _0802C2AC
	ldrh r1, [r6]
	mov r0, r8
	ands r0, r1
	cmp r0, 0
	bne _0802C2AC
	ldrb r0, [r4]
	lsls r0, 9
	adds r1, r7, 0x1
	adds r0, r1
	ldrb r0, [r0]
	cmp r0, 0x1
	bne _0802C278
	cmp r5, 0xC
	bhi _0802C2AC
	adds r0, r5, 0
	movs r1, 0x1
	bl AddBagItem
_0802C278:
	movs r0, 0x5
	bl PlaySE
	movs r0, 0x1
	movs r1, 0xC
	movs r2, 0
	bl dp01_build_cmdbuf_x21_a_bb
	bl PlayerBufferExecCompleted
	bl DestroyMenuCursor
	b _0802C2AC
	.align 2, 0
_0802C294: .4byte gBattleTypeFlags
_0802C298: .4byte gAbsentBankFlags
_0802C29C: .4byte gBitTable
_0802C2A0:
	movs r0, 0x8
	ands r0, r1
	cmp r0, 0
	beq _0802C2AC
	bl sub_804454C
_0802C2AC:
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r0}
	bx r0
	thumb_func_end sub_802C098

	thumb_func_start unref_sub_802C2B8
unref_sub_802C2B8: @ 802C2B8
	push {r4,lr}
	ldr r4, _0802C2E0 @ =gActiveBank
	ldrb r0, [r4]
	movs r1, 0x1
	bl dp11b_obj_free
	ldrb r0, [r4]
	movs r1, 0
	bl dp11b_obj_free
	ldr r1, _0802C2E4 @ =gBattleBankFunc
	ldrb r0, [r4]
	lsls r0, 2
	adds r0, r1
	ldr r1, _0802C2E8 @ =sub_802C2EC
	str r1, [r0]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0802C2E0: .4byte gActiveBank
_0802C2E4: .4byte gBattleBankFunc
_0802C2E8: .4byte sub_802C2EC
	thumb_func_end unref_sub_802C2B8

	thumb_func_start sub_802C2EC
sub_802C2EC: @ 802C2EC
	push {r4,r5,lr}
	sub sp, 0x4
	ldr r1, _0802C384 @ =gUnknown_081FAE7C
	mov r0, sp
	movs r2, 0x4
	bl memcpy
	ldr r0, _0802C388 @ =gUnknown_03004344
	ldrb r0, [r0]
	movs r1, 0x1
	movs r2, 0xF
	movs r3, 0x1
	bl dp11b_obj_instanciate
	movs r4, 0
	ldr r0, _0802C38C @ =gNoOfAllBanks
	ldrb r0, [r0]
	cmp r0, 0
	beq _0802C32E
_0802C312:
	ldr r0, _0802C388 @ =gUnknown_03004344
	ldrb r0, [r0]
	cmp r4, r0
	beq _0802C324
	lsls r0, r4, 24
	lsrs r0, 24
	movs r1, 0x1
	bl dp11b_obj_free
_0802C324:
	adds r4, 0x1
	ldr r0, _0802C38C @ =gNoOfAllBanks
	ldrb r0, [r0]
	cmp r4, r0
	blt _0802C312
_0802C32E:
	ldr r0, _0802C390 @ =gMain
	ldrh r1, [r0, 0x2E]
	movs r0, 0x1
	ands r0, r1
	cmp r0, 0
	beq _0802C3A8
	bl DestroyMenuCursor
	movs r0, 0x5
	bl PlaySE
	ldr r2, _0802C394 @ =gSprites
	ldr r1, _0802C398 @ =gObjectBankIDs
	ldr r4, _0802C388 @ =gUnknown_03004344
	ldrb r0, [r4]
	adds r0, r1
	ldrb r1, [r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r2, 0x1C
	adds r0, r2
	ldr r1, _0802C39C @ =sub_8010574
	str r1, [r0]
	ldr r1, _0802C3A0 @ =gMoveSelectionCursor
	ldr r0, _0802C3A4 @ =gActiveBank
	ldrb r0, [r0]
	adds r0, r1
	ldrb r2, [r0]
	ldrb r0, [r4]
	lsls r0, 8
	orrs r2, r0
	movs r0, 0x1
	movs r1, 0xA
	bl dp01_build_cmdbuf_x21_a_bb
	ldrb r0, [r4]
	movs r1, 0x1
	bl dp11b_obj_free
	bl PlayerBufferExecCompleted
	b _0802C658
	.align 2, 0
_0802C384: .4byte gUnknown_081FAE7C
_0802C388: .4byte gUnknown_03004344
_0802C38C: .4byte gNoOfAllBanks
_0802C390: .4byte gMain
_0802C394: .4byte gSprites
_0802C398: .4byte gObjectBankIDs
_0802C39C: .4byte sub_8010574
_0802C3A0: .4byte gMoveSelectionCursor
_0802C3A4: .4byte gActiveBank
_0802C3A8:
	movs r0, 0x2
	ands r0, r1
	cmp r0, 0
	beq _0802C41C
	movs r0, 0x5
	bl PlaySE
	ldr r2, _0802C400 @ =gSprites
	ldr r1, _0802C404 @ =gObjectBankIDs
	ldr r5, _0802C408 @ =gUnknown_03004344
	ldrb r0, [r5]
	adds r0, r1
	ldrb r1, [r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r2, 0x1C
	adds r0, r2
	ldr r1, _0802C40C @ =sub_8010574
	str r1, [r0]
	ldr r1, _0802C410 @ =gBattleBankFunc
	ldr r4, _0802C414 @ =gActiveBank
	ldrb r0, [r4]
	lsls r0, 2
	adds r0, r1
	ldr r1, _0802C418 @ =sub_802C68C
	str r1, [r0]
	ldrb r0, [r4]
	movs r1, 0x1
	movs r2, 0x7
	movs r3, 0x1
	bl dp11b_obj_instanciate
	ldrb r0, [r4]
	movs r1, 0
	movs r2, 0x7
	movs r3, 0x1
	bl dp11b_obj_instanciate
	ldrb r0, [r5]
	movs r1, 0x1
	bl dp11b_obj_free
	b _0802C658
	.align 2, 0
_0802C400: .4byte gSprites
_0802C404: .4byte gObjectBankIDs
_0802C408: .4byte gUnknown_03004344
_0802C40C: .4byte sub_8010574
_0802C410: .4byte gBattleBankFunc
_0802C414: .4byte gActiveBank
_0802C418: .4byte sub_802C68C
_0802C41C:
	movs r0, 0x60
	ands r0, r1
	cmp r0, 0
	bne _0802C426
	b _0802C540
_0802C426:
	movs r0, 0x5
	bl PlaySE
	ldr r2, _0802C458 @ =gSprites
	ldr r1, _0802C45C @ =gObjectBankIDs
	ldr r3, _0802C460 @ =gUnknown_03004344
	ldrb r0, [r3]
	adds r0, r1
	ldrb r1, [r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r2, 0x1C
	adds r0, r2
	ldr r1, _0802C464 @ =sub_8010574
	str r1, [r0]
	adds r5, r3, 0
_0802C448:
	ldrb r0, [r5]
	bl GetBankIdentity
	lsls r0, 24
	lsrs r1, r0, 24
	movs r4, 0
	mov r0, sp
	b _0802C472
	.align 2, 0
_0802C458: .4byte gSprites
_0802C45C: .4byte gObjectBankIDs
_0802C460: .4byte gUnknown_03004344
_0802C464: .4byte sub_8010574
_0802C468:
	adds r4, 0x1
	cmp r4, 0x3
	bgt _0802C478
	mov r2, sp
	adds r0, r2, r4
_0802C472:
	ldrb r0, [r0]
	cmp r1, r0
	bne _0802C468
_0802C478:
	subs r4, 0x1
	cmp r4, 0
	bge _0802C480
	movs r4, 0x3
_0802C480:
	mov r1, sp
	adds r0, r1, r4
	ldrb r0, [r0]
	bl GetBankByPlayerAI
	strb r0, [r5]
	ldr r1, _0802C4B4 @ =gNoOfAllBanks
	lsls r0, 24
	lsrs r0, 24
	ldrb r1, [r1]
	cmp r0, r1
	beq _0802C478
	movs r4, 0
	ldrb r0, [r5]
	bl GetBankIdentity
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	beq _0802C4FE
	cmp r0, 0x1
	bgt _0802C4B8
	cmp r0, 0
	beq _0802C4C2
	b _0802C500
	.align 2, 0
_0802C4B4: .4byte gNoOfAllBanks
_0802C4B8:
	cmp r0, 0x2
	beq _0802C4C2
	cmp r0, 0x3
	beq _0802C4FE
	b _0802C500
_0802C4C2:
	ldr r2, _0802C520 @ =gActiveBank
	ldrb r0, [r2]
	ldrb r1, [r5]
	cmp r0, r1
	bne _0802C4FE
	ldr r1, _0802C524 @ =gBattlePartyID
	ldrb r2, [r2]
	lsls r0, r2, 1
	adds r0, r1
	ldrh r1, [r0]
	movs r0, 0x64
	muls r0, r1
	ldr r1, _0802C528 @ =gPlayerParty
	adds r0, r1
	ldr r1, _0802C52C @ =gMoveSelectionCursor
	adds r2, r1
	ldrb r1, [r2]
	adds r1, 0xD
	bl GetMonData
	ldr r2, _0802C530 @ =gBattleMoves
	lsls r1, r0, 1
	adds r1, r0
	lsls r1, 2
	adds r1, r2
	ldrb r1, [r1, 0x6]
	movs r0, 0x2
	ands r0, r1
	cmp r0, 0
	beq _0802C500
_0802C4FE:
	adds r4, 0x1
_0802C500:
	ldr r0, _0802C534 @ =gAbsentBankFlags
	ldrb r1, [r0]
	ldr r2, _0802C538 @ =gBitTable
	ldrb r0, [r5]
	lsls r0, 2
	adds r0, r2
	ldr r0, [r0]
	ands r1, r0
	ldr r0, _0802C53C @ =gUnknown_03004344
	cmp r1, 0
	beq _0802C518
	movs r4, 0
_0802C518:
	cmp r4, 0
	beq _0802C448
	b _0802C640
	.align 2, 0
_0802C520: .4byte gActiveBank
_0802C524: .4byte gBattlePartyID
_0802C528: .4byte gPlayerParty
_0802C52C: .4byte gMoveSelectionCursor
_0802C530: .4byte gBattleMoves
_0802C534: .4byte gAbsentBankFlags
_0802C538: .4byte gBitTable
_0802C53C: .4byte gUnknown_03004344
_0802C540:
	movs r0, 0x90
	ands r0, r1
	cmp r0, 0
	bne _0802C54A
	b _0802C658
_0802C54A:
	movs r0, 0x5
	bl PlaySE
	ldr r2, _0802C57C @ =gSprites
	ldr r1, _0802C580 @ =gObjectBankIDs
	ldr r3, _0802C584 @ =gUnknown_03004344
	ldrb r0, [r3]
	adds r0, r1
	ldrb r1, [r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r2, 0x1C
	adds r0, r2
	ldr r1, _0802C588 @ =sub_8010574
	str r1, [r0]
	adds r5, r3, 0
_0802C56C:
	ldrb r0, [r5]
	bl GetBankIdentity
	lsls r0, 24
	lsrs r1, r0, 24
	movs r4, 0
	mov r0, sp
	b _0802C596
	.align 2, 0
_0802C57C: .4byte gSprites
_0802C580: .4byte gObjectBankIDs
_0802C584: .4byte gUnknown_03004344
_0802C588: .4byte sub_8010574
_0802C58C:
	adds r4, 0x1
	cmp r4, 0x3
	bgt _0802C59C
	mov r2, sp
	adds r0, r2, r4
_0802C596:
	ldrb r0, [r0]
	cmp r1, r0
	bne _0802C58C
_0802C59C:
	adds r4, 0x1
	cmp r4, 0x3
	ble _0802C5A4
	movs r4, 0
_0802C5A4:
	mov r1, sp
	adds r0, r1, r4
	ldrb r0, [r0]
	bl GetBankByPlayerAI
	strb r0, [r5]
	ldr r1, _0802C5D8 @ =gNoOfAllBanks
	lsls r0, 24
	lsrs r0, 24
	ldrb r1, [r1]
	cmp r0, r1
	beq _0802C59C
	movs r4, 0
	ldrb r0, [r5]
	bl GetBankIdentity
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	beq _0802C622
	cmp r0, 0x1
	bgt _0802C5DC
	cmp r0, 0
	beq _0802C5E6
	b _0802C624
	.align 2, 0
_0802C5D8: .4byte gNoOfAllBanks
_0802C5DC:
	cmp r0, 0x2
	beq _0802C5E6
	cmp r0, 0x3
	beq _0802C622
	b _0802C624
_0802C5E6:
	ldr r2, _0802C660 @ =gActiveBank
	ldrb r0, [r2]
	ldrb r1, [r5]
	cmp r0, r1
	bne _0802C622
	ldr r1, _0802C664 @ =gBattlePartyID
	ldrb r2, [r2]
	lsls r0, r2, 1
	adds r0, r1
	ldrh r1, [r0]
	movs r0, 0x64
	muls r0, r1
	ldr r1, _0802C668 @ =gPlayerParty
	adds r0, r1
	ldr r1, _0802C66C @ =gMoveSelectionCursor
	adds r2, r1
	ldrb r1, [r2]
	adds r1, 0xD
	bl GetMonData
	ldr r2, _0802C670 @ =gBattleMoves
	lsls r1, r0, 1
	adds r1, r0
	lsls r1, 2
	adds r1, r2
	ldrb r1, [r1, 0x6]
	movs r0, 0x2
	ands r0, r1
	cmp r0, 0
	beq _0802C624
_0802C622:
	adds r4, 0x1
_0802C624:
	ldr r0, _0802C674 @ =gAbsentBankFlags
	ldrb r1, [r0]
	ldr r2, _0802C678 @ =gBitTable
	ldrb r0, [r5]
	lsls r0, 2
	adds r0, r2
	ldr r0, [r0]
	ands r1, r0
	ldr r0, _0802C67C @ =gUnknown_03004344
	cmp r1, 0
	beq _0802C63C
	movs r4, 0
_0802C63C:
	cmp r4, 0
	beq _0802C56C
_0802C640:
	ldr r2, _0802C680 @ =gSprites
	ldr r1, _0802C684 @ =gObjectBankIDs
	ldrb r0, [r0]
	adds r0, r1
	ldrb r1, [r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r2, 0x1C
	adds r0, r2
	ldr r1, _0802C688 @ =sub_8010520
	str r1, [r0]
_0802C658:
	add sp, 0x4
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_0802C660: .4byte gActiveBank
_0802C664: .4byte gBattlePartyID
_0802C668: .4byte gPlayerParty
_0802C66C: .4byte gMoveSelectionCursor
_0802C670: .4byte gBattleMoves
_0802C674: .4byte gAbsentBankFlags
_0802C678: .4byte gBitTable
_0802C67C: .4byte gUnknown_03004344
_0802C680: .4byte gSprites
_0802C684: .4byte gObjectBankIDs
_0802C688: .4byte sub_8010520
	thumb_func_end sub_802C2EC

	thumb_func_start sub_802C68C
sub_802C68C: @ 802C68C
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	sub sp, 0x8
	movs r0, 0
	mov r8, r0
	ldr r7, _0802C6E4 @ =gActiveBank
	ldrb r2, [r7]
	lsls r0, r2, 9
	ldr r1, _0802C6E8 @ =gUnknown_02023A64
	adds r6, r0, r1
	ldr r0, _0802C6EC @ =gMain
	ldrh r1, [r0, 0x2E]
	movs r5, 0x1
	adds r4, r5, 0
	ands r4, r1
	cmp r4, 0
	bne _0802C6B2
	b _0802C864
_0802C6B2:
	movs r0, 0x5
	bl PlaySE
	ldr r1, _0802C6F0 @ =gMoveSelectionCursor
	ldrb r0, [r7]
	adds r0, r1
	ldrb r0, [r0]
	lsls r0, 1
	adds r1, r6, r0
	ldrh r0, [r1]
	cmp r0, 0xAE
	bne _0802C6F4
	ldrb r0, [r6, 0x12]
	movs r4, 0
	cmp r0, 0x7
	beq _0802C702
	ldrb r1, [r6, 0x13]
	movs r0, 0x7
	eors r1, r0
	negs r0, r1
	orrs r0, r1
	asrs r4, r0, 31
	movs r0, 0x10
	ands r4, r0
	b _0802C702
	.align 2, 0
_0802C6E4: .4byte gActiveBank
_0802C6E8: .4byte gUnknown_02023A64
_0802C6EC: .4byte gMain
_0802C6F0: .4byte gMoveSelectionCursor
_0802C6F4:
	ldr r2, _0802C714 @ =gBattleMoves
	ldrh r1, [r1]
	lsls r0, r1, 1
	adds r0, r1
	lsls r0, 2
	adds r0, r2
	ldrb r4, [r0, 0x6]
_0802C702:
	movs r0, 0x10
	ands r0, r4
	cmp r0, 0
	beq _0802C720
	ldr r0, _0802C718 @ =gUnknown_03004344
	ldr r1, _0802C71C @ =gActiveBank
	ldrb r1, [r1]
	strb r1, [r0]
	b _0802C73A
	.align 2, 0
_0802C714: .4byte gBattleMoves
_0802C718: .4byte gUnknown_03004344
_0802C71C: .4byte gActiveBank
_0802C720:
	ldr r0, _0802C764 @ =gActiveBank
	ldrb r0, [r0]
	bl GetBankIdentity
	adds r1, r0, 0
	movs r2, 0x1
	movs r0, 0x1
	ands r0, r1
	eors r0, r2
	bl GetBankByPlayerAI
	ldr r1, _0802C768 @ =gUnknown_03004344
	strb r0, [r1]
_0802C73A:
	ldr r3, _0802C76C @ =gBattleBufferA
	ldr r5, _0802C764 @ =gActiveBank
	ldrb r2, [r5]
	lsls r1, r2, 9
	adds r0, r3, 0x1
	adds r0, r1, r0
	ldrb r0, [r0]
	cmp r0, 0
	bne _0802C770
	movs r0, 0x2
	ands r0, r4
	cmp r0, 0
	beq _0802C7B2
	adds r0, r3, 0x2
	adds r0, r1, r0
	ldrb r0, [r0]
	cmp r0, 0
	bne _0802C7B2
	movs r2, 0x1
	add r8, r2
	b _0802C7B2
	.align 2, 0
_0802C764: .4byte gActiveBank
_0802C768: .4byte gUnknown_03004344
_0802C76C: .4byte gBattleBufferA
_0802C770:
	movs r0, 0x7D
	ands r0, r4
	cmp r0, 0
	bne _0802C77C
	movs r0, 0x1
	add r8, r0
_0802C77C:
	ldr r0, _0802C7D0 @ =gMoveSelectionCursor
	adds r0, r2, r0
	adds r1, r6, 0
	adds r1, 0x8
	ldrb r0, [r0]
	adds r1, r0
	ldrb r0, [r1]
	cmp r0, 0
	beq _0802C7B8
	movs r0, 0x12
	ands r0, r4
	cmp r0, 0
	bne _0802C7B2
	movs r0, 0
	bl CountAliveMons
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bhi _0802C7B2
	ldrb r0, [r5]
	bl sub_803C434
	ldr r1, _0802C7D4 @ =gUnknown_03004344
	strb r0, [r1]
	movs r2, 0
	mov r8, r2
_0802C7B2:
	mov r0, r8
	cmp r0, 0
	bne _0802C7DC
_0802C7B8:
	bl DestroyMenuCursor
	ldr r1, _0802C7D0 @ =gMoveSelectionCursor
	ldr r0, _0802C7D8 @ =gActiveBank
	ldrb r0, [r0]
	adds r0, r1
	ldrb r2, [r0]
	ldr r0, _0802C7D4 @ =gUnknown_03004344
	ldrb r0, [r0]
	lsls r0, 8
	orrs r2, r0
	b _0802C888
	.align 2, 0
_0802C7D0: .4byte gMoveSelectionCursor
_0802C7D4: .4byte gUnknown_03004344
_0802C7D8: .4byte gActiveBank
_0802C7DC:
	ldr r1, _0802C7F8 @ =gBattleBankFunc
	ldr r2, _0802C7FC @ =gActiveBank
	ldrb r0, [r2]
	lsls r0, 2
	adds r0, r1
	ldr r1, _0802C800 @ =sub_802C2EC
	str r1, [r0]
	movs r0, 0x12
	ands r4, r0
	cmp r4, 0
	beq _0802C808
	ldr r1, _0802C804 @ =gUnknown_03004344
	ldrb r0, [r2]
	b _0802C838
	.align 2, 0
_0802C7F8: .4byte gBattleBankFunc
_0802C7FC: .4byte gActiveBank
_0802C800: .4byte sub_802C2EC
_0802C804: .4byte gUnknown_03004344
_0802C808:
	movs r0, 0x1
	bl GetBankByPlayerAI
	ldr r1, _0802C828 @ =gAbsentBankFlags
	ldrb r1, [r1]
	ldr r2, _0802C82C @ =gBitTable
	lsls r0, 24
	lsrs r0, 22
	adds r0, r2
	ldr r0, [r0]
	ands r1, r0
	cmp r1, 0
	beq _0802C830
	movs r0, 0x3
	b _0802C832
	.align 2, 0
_0802C828: .4byte gAbsentBankFlags
_0802C82C: .4byte gBitTable
_0802C830:
	movs r0, 0x1
_0802C832:
	bl GetBankByPlayerAI
	ldr r1, _0802C854 @ =gUnknown_03004344
_0802C838:
	strb r0, [r1]
	ldr r2, _0802C858 @ =gSprites
	ldr r1, _0802C85C @ =gObjectBankIDs
	ldr r0, _0802C854 @ =gUnknown_03004344
	ldrb r0, [r0]
	adds r0, r1
	ldrb r1, [r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r2, 0x1C
	adds r0, r2
	ldr r1, _0802C860 @ =sub_8010520
	b _0802CA36
	.align 2, 0
_0802C854: .4byte gUnknown_03004344
_0802C858: .4byte gSprites
_0802C85C: .4byte gObjectBankIDs
_0802C860: .4byte sub_8010520
_0802C864:
	movs r6, 0x2
	adds r0, r6, 0
	ands r0, r1
	cmp r0, 0
	beq _0802C8A4
	bl DestroyMenuCursor
	movs r0, 0x5
	bl PlaySE
	ldr r0, _0802C898 @ =gUnknown_030042A4
	strh r4, [r0]
	ldr r1, _0802C89C @ =gUnknown_030042A0
	movs r2, 0xA0
	lsls r2, 1
	adds r0, r2, 0
	strh r0, [r1]
	ldr r2, _0802C8A0 @ =0x0000ffff
_0802C888:
	movs r0, 0x1
	movs r1, 0xA
	bl dp01_build_cmdbuf_x21_a_bb
	bl PlayerBufferExecCompleted
	b _0802CA38
	.align 2, 0
_0802C898: .4byte gUnknown_030042A4
_0802C89C: .4byte gUnknown_030042A0
_0802C8A0: .4byte 0x0000ffff
_0802C8A4:
	movs r0, 0x20
	ands r0, r1
	cmp r0, 0
	beq _0802C8D4
	ldr r4, _0802C8D0 @ =gMoveSelectionCursor
	adds r2, r4
	ldrb r1, [r2]
	adds r0, r5, 0
	ands r0, r1
	cmp r0, 0
	bne _0802C8BC
	b _0802CA38
_0802C8BC:
	ldrb r0, [r2]
	bl nullsub_7
	ldrb r1, [r7]
	adds r1, r4
	ldrb r0, [r1]
	movs r2, 0x1
	eors r0, r2
	b _0802C976
	.align 2, 0
_0802C8D0: .4byte gMoveSelectionCursor
_0802C8D4:
	movs r0, 0x10
	ands r0, r1
	cmp r0, 0
	beq _0802C914
	ldr r4, _0802C90C @ =gMoveSelectionCursor
	adds r3, r2, r4
	ldrb r2, [r3]
	movs r6, 0x1
	adds r0, r5, 0
	ands r0, r2
	cmp r0, 0
	beq _0802C8EE
	b _0802CA38
_0802C8EE:
	ldr r1, _0802C910 @ =gUnknown_03004348
	adds r0, r6, 0
	eors r0, r2
	ldrb r1, [r1]
	cmp r0, r1
	bcc _0802C8FC
	b _0802CA38
_0802C8FC:
	ldrb r0, [r3]
	bl nullsub_7
	ldrb r1, [r7]
	adds r1, r4
	ldrb r0, [r1]
	eors r0, r6
	b _0802C976
	.align 2, 0
_0802C90C: .4byte gMoveSelectionCursor
_0802C910: .4byte gUnknown_03004348
_0802C914:
	movs r0, 0x40
	ands r0, r1
	cmp r0, 0
	beq _0802C944
	ldr r4, _0802C940 @ =gMoveSelectionCursor
	adds r2, r4
	ldrb r1, [r2]
	adds r0, r6, 0
	ands r0, r1
	cmp r0, 0
	bne _0802C92C
	b _0802CA38
_0802C92C:
	ldrb r0, [r2]
	bl nullsub_7
	ldrb r1, [r7]
	adds r1, r4
	ldrb r0, [r1]
	movs r2, 0x2
	eors r0, r2
	b _0802C976
	.align 2, 0
_0802C940: .4byte gMoveSelectionCursor
_0802C944:
	movs r0, 0x80
	ands r0, r1
	cmp r0, 0
	beq _0802C99C
	ldr r4, _0802C994 @ =gMoveSelectionCursor
	adds r3, r2, r4
	ldrb r2, [r3]
	movs r5, 0x2
	adds r0, r6, 0
	ands r0, r2
	cmp r0, 0
	bne _0802CA38
	ldr r1, _0802C998 @ =gUnknown_03004348
	adds r0, r5, 0
	eors r0, r2
	ldrb r1, [r1]
	cmp r0, r1
	bcs _0802CA38
	ldrb r0, [r3]
	bl nullsub_7
	ldrb r1, [r7]
	adds r1, r4
	ldrb r0, [r1]
	eors r0, r5
_0802C976:
	strb r0, [r1]
	movs r0, 0x5
	bl PlaySE
	ldrb r0, [r7]
	adds r0, r4
	ldrb r0, [r0]
	movs r1, 0
	bl sub_802E3B4
	bl sub_802E220
	bl sub_802E2D4
	b _0802CA38
	.align 2, 0
_0802C994: .4byte gMoveSelectionCursor
_0802C998: .4byte gUnknown_03004348
_0802C99C:
	movs r0, 0x4
	ands r0, r1
	cmp r0, 0
	beq _0802CA38
	ldr r0, _0802C9D8 @ =gUnknown_03004348
	ldrb r0, [r0]
	cmp r0, 0x1
	bls _0802CA38
	ldr r0, _0802C9DC @ =gBattleTypeFlags
	ldrh r1, [r0]
	adds r0, r6, 0
	ands r0, r1
	lsls r0, 16
	lsrs r5, r0, 16
	cmp r5, 0
	bne _0802CA38
	ldr r4, _0802C9E0 @ =gMoveSelectionCursor
	adds r0, r2, r4
	ldrb r0, [r0]
	ldr r1, _0802C9E4 @ =gUnknown_081FAE80
	bl sub_802E12C
	ldrb r0, [r7]
	adds r0, r4
	ldrb r0, [r0]
	cmp r0, 0
	beq _0802C9EC
	ldr r0, _0802C9E8 @ =gUnknown_03004344
	strb r5, [r0]
	b _0802C9F4
	.align 2, 0
_0802C9D8: .4byte gUnknown_03004348
_0802C9DC: .4byte gBattleTypeFlags
_0802C9E0: .4byte gMoveSelectionCursor
_0802C9E4: .4byte gUnknown_081FAE80
_0802C9E8: .4byte gUnknown_03004344
_0802C9EC:
	ldr r1, _0802CA44 @ =gUnknown_03004344
	adds r0, 0x1
	strb r0, [r1]
	adds r0, r1, 0
_0802C9F4:
	ldrb r0, [r0]
	movs r1, 0x1B
	bl sub_802E3B4
	ldr r4, _0802CA48 @ =gUnknown_03004210
	ldr r1, _0802CA4C @ =0x00001016
	movs r0, 0x1C
	str r0, [sp]
	movs r0, 0x3A
	str r0, [sp, 0x4]
	adds r0, r4, 0
	movs r2, 0x17
	movs r3, 0x37
	bl FillWindowRect
	ldr r1, _0802CA50 @ =gUnknown_08400D89
	movs r2, 0xA4
	lsls r2, 2
	movs r0, 0x37
	str r0, [sp]
	adds r0, r4, 0
	movs r3, 0x17
	bl InitWindow
	adds r0, r4, 0
	bl sub_8002F44
	ldr r1, _0802CA54 @ =gBattleBankFunc
	ldr r0, _0802CA58 @ =gActiveBank
	ldrb r0, [r0]
	lsls r0, 2
	adds r0, r1
	ldr r1, _0802CA5C @ =sub_802CA60
_0802CA36:
	str r1, [r0]
_0802CA38:
	add sp, 0x8
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_0802CA44: .4byte gUnknown_03004344
_0802CA48: .4byte gUnknown_03004210
_0802CA4C: .4byte 0x00001016
_0802CA50: .4byte gUnknown_08400D89
_0802CA54: .4byte gBattleBankFunc
_0802CA58: .4byte gActiveBank
_0802CA5C: .4byte sub_802CA60
	thumb_func_end sub_802C68C

	thumb_func_start sub_802CA60
sub_802CA60: @ 802CA60
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	sub sp, 0x2C
	ldr r0, _0802CDEC @ =gMain
	ldrh r1, [r0, 0x2E]
	movs r0, 0x5
	ands r0, r1
	cmp r0, 0
	bne _0802CA7A
	b _0802CE78
_0802CA7A:
	movs r0, 0x5
	bl PlaySE
	ldr r0, _0802CDF0 @ =gMoveSelectionCursor
	mov r10, r0
	ldr r1, _0802CDF4 @ =gActiveBank
	mov r8, r1
	ldrb r1, [r1]
	adds r2, r1, r0
	ldr r5, _0802CDF8 @ =gUnknown_03004344
	ldrb r0, [r2]
	ldrb r3, [r5]
	cmp r0, r3
	bne _0802CA98
	b _0802CE14
_0802CA98:
	lsls r1, 9
	ldr r0, _0802CDFC @ =gUnknown_02023A64
	adds r1, r0
	mov r9, r1
	ldrb r1, [r2]
	lsls r1, 1
	add r1, r9
	ldrh r6, [r1]
	ldrb r0, [r5]
	lsls r0, 1
	add r0, r9
	ldrh r0, [r0]
	strh r0, [r1]
	ldrb r0, [r5]
	lsls r0, 1
	add r0, r9
	strh r6, [r0]
	mov r1, r8
	ldrb r0, [r1]
	add r0, r10
	ldrb r1, [r0]
	mov r7, r9
	adds r7, 0x8
	adds r1, r7, r1
	ldrb r6, [r1]
	ldrb r0, [r5]
	adds r0, r7, r0
	ldrb r0, [r0]
	strb r0, [r1]
	ldrb r0, [r5]
	adds r0, r7, r0
	strb r6, [r0]
	mov r2, r8
	ldrb r0, [r2]
	add r0, r10
	ldrb r1, [r0]
	mov r2, r9
	adds r2, 0xC
	adds r1, r2, r1
	ldrb r6, [r1]
	ldrb r0, [r5]
	adds r0, r2, r0
	ldrb r0, [r0]
	strb r0, [r1]
	ldrb r0, [r5]
	adds r2, r0
	strb r6, [r2]
	mov r3, r8
	ldrb r1, [r3]
	lsls r0, r1, 3
	subs r0, r1
	lsls r0, 2
	ldr r2, _0802CE00 @ =gDisableStructs
	adds r6, r0, r2
	ldrb r4, [r6, 0x18]
	lsls r3, r4, 24
	lsrs r2, r3, 28
	ldr r0, _0802CE04 @ =gBitTable
	mov r12, r0
	add r1, r10
	ldrb r0, [r1]
	lsls r0, 2
	add r0, r12
	ldr r0, [r0]
	ands r2, r0
	cmp r2, 0
	beq _0802CB52
	lsrs r1, r3, 28
	bics r1, r0
	lsls r1, 4
	movs r2, 0xF
	adds r0, r2, 0
	ands r0, r4
	orrs r0, r1
	strb r0, [r6, 0x18]
	mov r1, r8
	ldrb r0, [r1]
	lsls r1, r0, 3
	subs r1, r0
	lsls r1, 2
	ldr r3, _0802CE00 @ =gDisableStructs
	adds r1, r3
	ldrb r4, [r1, 0x18]
	lsrs r3, r4, 4
	ldrb r0, [r5]
	lsls r0, 2
	add r0, r12
	ldr r0, [r0]
	orrs r0, r3
	lsls r0, 4
	ands r2, r4
	orrs r2, r0
	strb r2, [r1, 0x18]
_0802CB52:
	bl sub_802E1B0
	movs r6, 0
	mov r12, r7
	mov r5, sp
	adds r5, 0x20
	str r5, [sp, 0x28]
	ldr r2, _0802CE08 @ =gBattleMons
	mov r0, r8
	ldrb r1, [r0]
	movs r0, 0x58
	muls r0, r1
	adds r0, r2
	adds r4, r0, 0
	adds r4, 0x3B
	mov r7, r8
	mov r10, r2
	movs r5, 0x3
_0802CB76:
	mov r3, sp
	adds r3, r6
	adds r3, 0x8
	ldrb r1, [r4]
	lsls r2, r6, 1
	adds r0, r5, 0
	lsls r0, r2
	ands r1, r0
	asrs r1, r2
	strb r1, [r3]
	adds r6, 0x1
	cmp r6, 0x3
	ble _0802CB76
	ldr r1, _0802CDF0 @ =gMoveSelectionCursor
	ldrb r0, [r7]
	adds r0, r1
	ldrb r0, [r0]
	add r0, sp
	adds r0, 0x8
	ldrb r0, [r0]
	ldr r2, [sp, 0x28]
	strb r0, [r2]
	ldrb r0, [r7]
	adds r0, r1
	ldrb r0, [r0]
	mov r2, sp
	adds r2, r0
	adds r2, 0x8
	ldr r1, _0802CDF8 @ =gUnknown_03004344
	ldrb r0, [r1]
	add r0, sp
	adds r0, 0x8
	ldrb r0, [r0]
	movs r3, 0
	strb r0, [r2]
	ldrb r0, [r1]
	mov r1, sp
	adds r1, r0
	adds r1, 0x8
	ldr r5, [sp, 0x28]
	ldrb r0, [r5]
	strb r0, [r1]
	strb r3, [r5]
	movs r6, 0
	ldr r2, [sp, 0x28]
_0802CBD0:
	mov r0, sp
	adds r0, r6
	adds r0, 0x8
	ldrb r1, [r0]
	lsls r0, r6, 1
	lsls r1, r0
	ldrb r0, [r2]
	orrs r0, r1
	strb r0, [r2]
	adds r6, 0x1
	cmp r6, 0x3
	ble _0802CBD0
	ldrb r1, [r7]
	movs r0, 0x58
	muls r0, r1
	add r0, r10
	adds r0, 0x3B
	ldr r2, [sp, 0x28]
	ldrb r1, [r2]
	strb r1, [r0]
	movs r6, 0
	adds r4, r7, 0
	movs r3, 0x58
	movs r5, 0x24
	add r5, r10
	mov r8, r5
	mov r2, r9
	mov r7, r10
	adds r7, 0xC
	mov r5, r12
_0802CC0C:
	lsls r1, r6, 1
	ldrb r0, [r4]
	muls r0, r3
	adds r1, r0
	adds r1, r7
	ldrh r0, [r2]
	strh r0, [r1]
	ldrb r0, [r4]
	adds r1, r0, 0
	muls r1, r3
	adds r1, r6, r1
	add r1, r8
	adds r0, r5, r6
	ldrb r0, [r0]
	strb r0, [r1]
	adds r2, 0x2
	adds r6, 0x1
	cmp r6, 0x3
	ble _0802CC0C
	ldr r2, _0802CDF4 @ =gActiveBank
	ldrb r1, [r2]
	movs r0, 0x58
	muls r0, r1
	mov r1, r10
	adds r1, 0x50
	adds r0, r1
	ldr r0, [r0]
	movs r1, 0x80
	lsls r1, 14
	ands r0, r1
	cmp r0, 0
	beq _0802CC4E
	b _0802CE1C
_0802CC4E:
	movs r6, 0
	mov r0, sp
	adds r0, 0xC
	str r0, [sp, 0x24]
	add r1, sp, 0x14
	mov r10, r1
	ldr r3, _0802CE0C @ =gBattlePartyID
	mov r9, r3
	mov r8, r2
	movs r7, 0x64
	ldr r5, _0802CE10 @ =gPlayerParty
	adds r4, r0, 0
_0802CC66:
	mov r1, r8
	ldrb r0, [r1]
	lsls r0, 1
	add r0, r9
	ldrh r0, [r0]
	muls r0, r7
	adds r0, r5
	adds r1, r6, 0
	adds r1, 0xD
	bl GetMonData
	strh r0, [r4]
	mov r2, r8
	ldrb r0, [r2]
	lsls r0, 1
	add r0, r9
	ldrh r0, [r0]
	muls r0, r7
	adds r0, r5
	adds r1, r6, 0
	adds r1, 0x11
	bl GetMonData
	mov r3, r10
	adds r1, r3, r6
	strb r0, [r1]
	adds r4, 0x2
	adds r6, 0x1
	cmp r6, 0x3
	ble _0802CC66
	ldr r1, _0802CE0C @ =gBattlePartyID
	ldr r0, _0802CDF4 @ =gActiveBank
	ldrb r0, [r0]
	lsls r0, 1
	adds r0, r1
	ldrh r1, [r0]
	movs r0, 0x64
	muls r0, r1
	ldr r1, _0802CE10 @ =gPlayerParty
	adds r0, r1
	movs r1, 0x15
	bl GetMonData
	ldr r5, [sp, 0x28]
	strb r0, [r5]
	movs r6, 0
	movs r5, 0x3
	ldr r4, [sp, 0x28]
_0802CCC6:
	mov r3, sp
	adds r3, r6
	adds r3, 0x8
	lsls r2, r6, 1
	adds r1, r5, 0
	lsls r1, r2
	ldrb r0, [r4]
	ands r0, r1
	asrs r0, r2
	strb r0, [r3]
	adds r6, 0x1
	cmp r6, 0x3
	ble _0802CCC6
	ldr r4, _0802CDF0 @ =gMoveSelectionCursor
	ldr r3, _0802CDF4 @ =gActiveBank
	ldrb r0, [r3]
	adds r0, r4
	ldrb r1, [r0]
	lsls r1, 1
	ldr r0, [sp, 0x24]
	adds r1, r0, r1
	ldrh r6, [r1]
	ldr r2, _0802CDF8 @ =gUnknown_03004344
	ldrb r0, [r2]
	lsls r0, 1
	ldr r5, [sp, 0x24]
	adds r0, r5, r0
	ldrh r0, [r0]
	movs r5, 0
	strh r0, [r1]
	ldrb r0, [r2]
	lsls r0, 1
	ldr r1, [sp, 0x24]
	adds r0, r1, r0
	strh r6, [r0]
	ldrb r0, [r3]
	adds r0, r4
	ldrb r1, [r0]
	add r1, r10
	ldrb r6, [r1]
	ldrb r0, [r2]
	add r0, r10
	ldrb r0, [r0]
	strb r0, [r1]
	ldrb r0, [r2]
	add r0, r10
	strb r6, [r0]
	ldrb r0, [r3]
	adds r0, r4
	ldrb r0, [r0]
	add r0, sp
	adds r0, 0x8
	ldrb r0, [r0]
	ldr r1, [sp, 0x28]
	strb r0, [r1]
	ldrb r0, [r3]
	adds r0, r4
	ldrb r0, [r0]
	mov r1, sp
	adds r1, r0
	adds r1, 0x8
	ldrb r0, [r2]
	add r0, sp
	adds r0, 0x8
	ldrb r0, [r0]
	strb r0, [r1]
	ldrb r0, [r2]
	mov r1, sp
	adds r1, r0
	adds r1, 0x8
	ldr r2, [sp, 0x28]
	ldrb r0, [r2]
	strb r0, [r1]
	strb r5, [r2]
	movs r6, 0
	ldr r2, [sp, 0x28]
_0802CD5E:
	mov r0, sp
	adds r0, r6
	adds r0, 0x8
	ldrb r1, [r0]
	lsls r0, r6, 1
	lsls r1, r0
	ldrb r0, [r2]
	orrs r0, r1
	strb r0, [r2]
	adds r6, 0x1
	cmp r6, 0x3
	ble _0802CD5E
	movs r6, 0
	ldr r3, _0802CE0C @ =gBattlePartyID
	mov r10, r3
	ldr r5, _0802CDF4 @ =gActiveBank
	mov r9, r5
	movs r0, 0x64
	mov r8, r0
	ldr r7, _0802CE10 @ =gPlayerParty
	ldr r5, [sp, 0x24]
	adds r5, 0x8
	ldr r4, [sp, 0x24]
_0802CD8C:
	mov r1, r9
	ldrb r0, [r1]
	lsls r0, 1
	add r0, r10
	ldrh r0, [r0]
	mov r2, r8
	muls r2, r0
	adds r0, r2, 0
	adds r0, r7
	adds r1, r6, 0
	adds r1, 0xD
	adds r2, r4, 0
	bl SetMonData
	mov r3, r9
	ldrb r0, [r3]
	lsls r0, 1
	add r0, r10
	ldrh r0, [r0]
	mov r1, r8
	muls r1, r0
	adds r0, r1, 0
	adds r0, r7
	adds r1, r6, 0
	adds r1, 0x11
	adds r2, r5, 0
	bl SetMonData
	adds r5, 0x1
	adds r4, 0x2
	adds r6, 0x1
	cmp r6, 0x3
	ble _0802CD8C
	ldr r1, _0802CE0C @ =gBattlePartyID
	ldr r0, _0802CDF4 @ =gActiveBank
	ldrb r0, [r0]
	lsls r0, 1
	adds r0, r1
	ldrh r1, [r0]
	movs r0, 0x64
	muls r0, r1
	ldr r1, _0802CE10 @ =gPlayerParty
	adds r0, r1
	movs r1, 0x15
	ldr r2, [sp, 0x28]
	bl SetMonData
	b _0802CE1C
	.align 2, 0
_0802CDEC: .4byte gMain
_0802CDF0: .4byte gMoveSelectionCursor
_0802CDF4: .4byte gActiveBank
_0802CDF8: .4byte gUnknown_03004344
_0802CDFC: .4byte gUnknown_02023A64
_0802CE00: .4byte gDisableStructs
_0802CE04: .4byte gBitTable
_0802CE08: .4byte gBattleMons
_0802CE0C: .4byte gBattlePartyID
_0802CE10: .4byte gPlayerParty
_0802CE14:
	ldrb r0, [r5]
	ldr r1, _0802CF20 @ =gUnknown_08400D49
	bl sub_802E12C
_0802CE1C:
	ldr r1, _0802CF24 @ =gBattleBankFunc
	ldr r2, _0802CF28 @ =gActiveBank
	ldrb r0, [r2]
	lsls r0, 2
	adds r0, r1
	ldr r1, _0802CF2C @ =sub_802C68C
	str r1, [r0]
	ldr r3, _0802CF30 @ =gMoveSelectionCursor
	ldrb r0, [r2]
	adds r0, r3
	ldr r1, _0802CF34 @ =gUnknown_03004344
	ldrb r1, [r1]
	strb r1, [r0]
	ldrb r0, [r2]
	adds r0, r3
	ldrb r0, [r0]
	movs r1, 0
	bl sub_802E3B4
	ldr r4, _0802CF38 @ =gUnknown_03004210
	ldr r1, _0802CF3C @ =0x00001016
	movs r0, 0x1C
	str r0, [sp]
	movs r0, 0x3A
	str r0, [sp, 0x4]
	adds r0, r4, 0
	movs r2, 0x17
	movs r3, 0x37
	bl FillWindowRect
	ldr r1, _0802CF40 @ =gUnknown_08400D38
	movs r2, 0xA4
	lsls r2, 2
	movs r0, 0x37
	str r0, [sp]
	adds r0, r4, 0
	movs r3, 0x17
	bl InitWindow
	adds r0, r4, 0
	bl sub_8002F44
	bl sub_802E220
	bl sub_802E2D4
_0802CE78:
	ldr r6, _0802CF44 @ =gMain
	ldrh r1, [r6, 0x2E]
	movs r0, 0x6
	ands r0, r1
	cmp r0, 0
	beq _0802CEF0
	movs r0, 0x5
	bl PlaySE
	ldr r0, _0802CF34 @ =gUnknown_03004344
	ldrb r0, [r0]
	bl nullsub_7
	ldr r5, _0802CF30 @ =gMoveSelectionCursor
	ldr r4, _0802CF28 @ =gActiveBank
	ldrb r0, [r4]
	adds r0, r5
	ldrb r0, [r0]
	movs r1, 0
	bl sub_802E3B4
	ldrb r0, [r4]
	adds r0, r5
	ldrb r0, [r0]
	ldr r1, _0802CF20 @ =gUnknown_08400D49
	bl sub_802E12C
	ldr r1, _0802CF24 @ =gBattleBankFunc
	ldrb r0, [r4]
	lsls r0, 2
	adds r0, r1
	ldr r1, _0802CF2C @ =sub_802C68C
	str r1, [r0]
	ldr r4, _0802CF38 @ =gUnknown_03004210
	ldr r1, _0802CF3C @ =0x00001016
	movs r0, 0x1C
	str r0, [sp]
	movs r0, 0x3A
	str r0, [sp, 0x4]
	adds r0, r4, 0
	movs r2, 0x17
	movs r3, 0x37
	bl FillWindowRect
	ldr r1, _0802CF40 @ =gUnknown_08400D38
	movs r2, 0xA4
	lsls r2, 2
	movs r0, 0x37
	str r0, [sp]
	adds r0, r4, 0
	movs r3, 0x17
	bl InitWindow
	adds r0, r4, 0
	bl sub_8002F44
	bl sub_802E220
	bl sub_802E2D4
_0802CEF0:
	ldrh r1, [r6, 0x2E]
	movs r0, 0x20
	ands r0, r1
	cmp r0, 0
	beq _0802CF8C
	ldr r3, _0802CF34 @ =gUnknown_03004344
	ldrb r2, [r3]
	movs r0, 0x1
	ands r0, r2
	cmp r0, 0
	beq _0802CF8C
	ldr r0, _0802CF30 @ =gMoveSelectionCursor
	ldr r1, _0802CF28 @ =gActiveBank
	ldrb r1, [r1]
	adds r1, r0
	ldrb r5, [r1]
	cmp r2, r5
	bne _0802CF48
	ldrb r0, [r1]
	movs r1, 0x1D
	bl sub_802E3B4
	b _0802CF4E
	.align 2, 0
_0802CF20: .4byte gUnknown_08400D49
_0802CF24: .4byte gBattleBankFunc
_0802CF28: .4byte gActiveBank
_0802CF2C: .4byte sub_802C68C
_0802CF30: .4byte gMoveSelectionCursor
_0802CF34: .4byte gUnknown_03004344
_0802CF38: .4byte gUnknown_03004210
_0802CF3C: .4byte 0x00001016
_0802CF40: .4byte gUnknown_08400D38
_0802CF44: .4byte gMain
_0802CF48:
	ldrb r0, [r3]
	bl nullsub_7
_0802CF4E:
	ldr r4, _0802CF78 @ =gUnknown_03004344
	ldrb r0, [r4]
	movs r1, 0x1
	eors r0, r1
	strb r0, [r4]
	movs r0, 0x5
	bl PlaySE
	ldr r1, _0802CF7C @ =gMoveSelectionCursor
	ldr r0, _0802CF80 @ =gActiveBank
	ldrb r0, [r0]
	adds r0, r1
	ldrb r1, [r4]
	ldrb r0, [r0]
	cmp r1, r0
	bne _0802CF84
	adds r0, r1, 0
	movs r1, 0
	bl sub_802E3B4
	b _0802CF8C
	.align 2, 0
_0802CF78: .4byte gUnknown_03004344
_0802CF7C: .4byte gMoveSelectionCursor
_0802CF80: .4byte gActiveBank
_0802CF84:
	ldrb r0, [r4]
	movs r1, 0x1B
	bl sub_802E3B4
_0802CF8C:
	ldr r0, _0802CFC8 @ =gMain
	ldrh r1, [r0, 0x2E]
	movs r0, 0x10
	ands r0, r1
	cmp r0, 0
	beq _0802D020
	ldr r3, _0802CFCC @ =gUnknown_03004344
	ldrb r2, [r3]
	movs r0, 0x1
	ands r0, r2
	cmp r0, 0
	bne _0802D020
	ldr r1, _0802CFD0 @ =gUnknown_03004348
	movs r0, 0x1
	eors r0, r2
	ldrb r1, [r1]
	cmp r0, r1
	bcs _0802D020
	ldr r0, _0802CFD4 @ =gMoveSelectionCursor
	ldr r1, _0802CFD8 @ =gActiveBank
	ldrb r1, [r1]
	adds r1, r0
	ldrb r0, [r1]
	cmp r2, r0
	bne _0802CFDC
	ldrb r0, [r1]
	movs r1, 0x1D
	bl sub_802E3B4
	b _0802CFE2
	.align 2, 0
_0802CFC8: .4byte gMain
_0802CFCC: .4byte gUnknown_03004344
_0802CFD0: .4byte gUnknown_03004348
_0802CFD4: .4byte gMoveSelectionCursor
_0802CFD8: .4byte gActiveBank
_0802CFDC:
	ldrb r0, [r3]
	bl nullsub_7
_0802CFE2:
	ldr r4, _0802D00C @ =gUnknown_03004344
	ldrb r0, [r4]
	movs r1, 0x1
	eors r0, r1
	strb r0, [r4]
	movs r0, 0x5
	bl PlaySE
	ldr r1, _0802D010 @ =gMoveSelectionCursor
	ldr r0, _0802D014 @ =gActiveBank
	ldrb r0, [r0]
	adds r0, r1
	ldrb r1, [r4]
	ldrb r0, [r0]
	cmp r1, r0
	bne _0802D018
	adds r0, r1, 0
	movs r1, 0
	bl sub_802E3B4
	b _0802D020
	.align 2, 0
_0802D00C: .4byte gUnknown_03004344
_0802D010: .4byte gMoveSelectionCursor
_0802D014: .4byte gActiveBank
_0802D018:
	ldrb r0, [r4]
	movs r1, 0x1B
	bl sub_802E3B4
_0802D020:
	ldr r0, _0802D050 @ =gMain
	ldrh r1, [r0, 0x2E]
	movs r0, 0x40
	ands r0, r1
	cmp r0, 0
	beq _0802D0A4
	ldr r3, _0802D054 @ =gUnknown_03004344
	ldrb r2, [r3]
	movs r0, 0x2
	ands r0, r2
	cmp r0, 0
	beq _0802D0A4
	ldr r0, _0802D058 @ =gMoveSelectionCursor
	ldr r1, _0802D05C @ =gActiveBank
	ldrb r1, [r1]
	adds r1, r0
	ldrb r5, [r1]
	cmp r2, r5
	bne _0802D060
	ldrb r0, [r1]
	movs r1, 0x1D
	bl sub_802E3B4
	b _0802D066
	.align 2, 0
_0802D050: .4byte gMain
_0802D054: .4byte gUnknown_03004344
_0802D058: .4byte gMoveSelectionCursor
_0802D05C: .4byte gActiveBank
_0802D060:
	ldrb r0, [r3]
	bl nullsub_7
_0802D066:
	ldr r4, _0802D090 @ =gUnknown_03004344
	ldrb r0, [r4]
	movs r1, 0x2
	eors r0, r1
	strb r0, [r4]
	movs r0, 0x5
	bl PlaySE
	ldr r1, _0802D094 @ =gMoveSelectionCursor
	ldr r0, _0802D098 @ =gActiveBank
	ldrb r0, [r0]
	adds r0, r1
	ldrb r1, [r4]
	ldrb r0, [r0]
	cmp r1, r0
	bne _0802D09C
	adds r0, r1, 0
	movs r1, 0
	bl sub_802E3B4
	b _0802D0A4
	.align 2, 0
_0802D090: .4byte gUnknown_03004344
_0802D094: .4byte gMoveSelectionCursor
_0802D098: .4byte gActiveBank
_0802D09C:
	ldrb r0, [r4]
	movs r1, 0x1B
	bl sub_802E3B4
_0802D0A4:
	ldr r0, _0802D0E0 @ =gMain
	ldrh r1, [r0, 0x2E]
	movs r0, 0x80
	ands r0, r1
	cmp r0, 0
	beq _0802D138
	ldr r3, _0802D0E4 @ =gUnknown_03004344
	ldrb r2, [r3]
	movs r0, 0x2
	ands r0, r2
	cmp r0, 0
	bne _0802D138
	ldr r1, _0802D0E8 @ =gUnknown_03004348
	movs r0, 0x2
	eors r0, r2
	ldrb r1, [r1]
	cmp r0, r1
	bcs _0802D138
	ldr r0, _0802D0EC @ =gMoveSelectionCursor
	ldr r1, _0802D0F0 @ =gActiveBank
	ldrb r1, [r1]
	adds r1, r0
	ldrb r0, [r1]
	cmp r2, r0
	bne _0802D0F4
	ldrb r0, [r1]
	movs r1, 0x1D
	bl sub_802E3B4
	b _0802D0FA
	.align 2, 0
_0802D0E0: .4byte gMain
_0802D0E4: .4byte gUnknown_03004344
_0802D0E8: .4byte gUnknown_03004348
_0802D0EC: .4byte gMoveSelectionCursor
_0802D0F0: .4byte gActiveBank
_0802D0F4:
	ldrb r0, [r3]
	bl nullsub_7
_0802D0FA:
	ldr r4, _0802D124 @ =gUnknown_03004344
	ldrb r0, [r4]
	movs r1, 0x2
	eors r0, r1
	strb r0, [r4]
	movs r0, 0x5
	bl PlaySE
	ldr r1, _0802D128 @ =gMoveSelectionCursor
	ldr r0, _0802D12C @ =gActiveBank
	ldrb r0, [r0]
	adds r0, r1
	ldrb r1, [r4]
	ldrb r0, [r0]
	cmp r1, r0
	bne _0802D130
	adds r0, r1, 0
	movs r1, 0
	bl sub_802E3B4
	b _0802D138
	.align 2, 0
_0802D124: .4byte gUnknown_03004344
_0802D128: .4byte gMoveSelectionCursor
_0802D12C: .4byte gActiveBank
_0802D130:
	ldrb r0, [r4]
	movs r1, 0x1B
	bl sub_802E3B4
_0802D138:
	add sp, 0x2C
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	thumb_func_end sub_802CA60

	thumb_func_start sub_802D148
sub_802D148: @ 802D148
	push {lr}
	ldr r0, _0802D178 @ =gReceivedRemoteLinkPlayers
	ldrb r0, [r0]
	cmp r0, 0
	bne _0802D174
	movs r0, 0x5A
	bl m4aSongNumStop
	ldr r3, _0802D17C @ =gMain
	ldr r0, _0802D180 @ =0x0000043d
	adds r2, r3, r0
	ldrb r1, [r2]
	movs r0, 0x3
	negs r0, r0
	ands r0, r1
	strb r0, [r2]
	ldr r0, _0802D184 @ =gPreBattleCallback1
	ldr r0, [r0]
	str r0, [r3]
	ldr r0, _0802D188 @ =c2_8011A1C
	bl SetMainCallback2
_0802D174:
	pop {r0}
	bx r0
	.align 2, 0
_0802D178: .4byte gReceivedRemoteLinkPlayers
_0802D17C: .4byte gMain
_0802D180: .4byte 0x0000043d
_0802D184: .4byte gPreBattleCallback1
_0802D188: .4byte c2_8011A1C
	thumb_func_end sub_802D148

	thumb_func_start sub_802D18C
sub_802D18C: @ 802D18C
	push {lr}
	ldr r0, _0802D1BC @ =gPaletteFade
	ldrb r1, [r0, 0x7]
	movs r0, 0x80
	ands r0, r1
	cmp r0, 0
	bne _0802D1F2
	ldr r0, _0802D1C0 @ =gBattleTypeFlags
	ldrh r1, [r0]
	movs r0, 0x2
	ands r0, r1
	cmp r0, 0
	beq _0802D1D0
	bl sub_800832C
	ldr r1, _0802D1C4 @ =gBattleBankFunc
	ldr r0, _0802D1C8 @ =gActiveBank
	ldrb r0, [r0]
	lsls r0, 2
	adds r0, r1
	ldr r1, _0802D1CC @ =sub_802D148
	str r1, [r0]
	b _0802D1F2
	.align 2, 0
_0802D1BC: .4byte gPaletteFade
_0802D1C0: .4byte gBattleTypeFlags
_0802D1C4: .4byte gBattleBankFunc
_0802D1C8: .4byte gActiveBank
_0802D1CC: .4byte sub_802D148
_0802D1D0:
	movs r0, 0x5A
	bl m4aSongNumStop
	ldr r2, _0802D1F8 @ =gMain
	ldr r0, _0802D1FC @ =0x0000043d
	adds r3, r2, r0
	ldrb r1, [r3]
	movs r0, 0x3
	negs r0, r0
	ands r0, r1
	strb r0, [r3]
	ldr r0, _0802D200 @ =gPreBattleCallback1
	ldr r0, [r0]
	str r0, [r2]
	ldr r0, [r2, 0x8]
	bl SetMainCallback2
_0802D1F2:
	pop {r0}
	bx r0
	.align 2, 0
_0802D1F8: .4byte gMain
_0802D1FC: .4byte 0x0000043d
_0802D200: .4byte gPreBattleCallback1
	thumb_func_end sub_802D18C

	thumb_func_start sub_802D204
sub_802D204: @ 802D204
	push {lr}
	ldr r2, _0802D22C @ =gSprites
	ldr r1, _0802D230 @ =gObjectBankIDs
	ldr r0, _0802D234 @ =gActiveBank
	ldrb r0, [r0]
	adds r0, r1
	ldrb r1, [r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r2, 0x1C
	adds r0, r2
	ldr r1, [r0]
	ldr r0, _0802D238 @ =SpriteCallbackDummy
	cmp r1, r0
	bne _0802D228
	bl PlayerBufferExecCompleted
_0802D228:
	pop {r0}
	bx r0
	.align 2, 0
_0802D22C: .4byte gSprites
_0802D230: .4byte gObjectBankIDs
_0802D234: .4byte gActiveBank
_0802D238: .4byte SpriteCallbackDummy
	thumb_func_end sub_802D204

	thumb_func_start sub_802D23C
sub_802D23C: @ 802D23C
	push {lr}
	ldr r2, _0802D264 @ =gSprites
	ldr r1, _0802D268 @ =gObjectBankIDs
	ldr r0, _0802D26C @ =gActiveBank
	ldrb r0, [r0]
	adds r0, r1
	ldrb r1, [r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r2, 0x1C
	adds r0, r2
	ldr r1, [r0]
	ldr r0, _0802D270 @ =SpriteCallbackDummy
	cmp r1, r0
	bne _0802D260
	bl PlayerBufferExecCompleted
_0802D260:
	pop {r0}
	bx r0
	.align 2, 0
_0802D264: .4byte gSprites
_0802D268: .4byte gObjectBankIDs
_0802D26C: .4byte gActiveBank
_0802D270: .4byte SpriteCallbackDummy
	thumb_func_end sub_802D23C

	thumb_func_start sub_802D274
sub_802D274: @ 802D274
	push {r4-r6,lr}
	ldr r6, _0802D2CC @ =gSprites
	ldr r5, _0802D2D0 @ =gObjectBankIDs
	ldr r4, _0802D2D4 @ =gActiveBank
	ldrb r0, [r4]
	adds r0, r5
	ldrb r1, [r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r1, r6, 0
	adds r1, 0x1C
	adds r0, r1
	ldr r1, [r0]
	ldr r0, _0802D2D8 @ =SpriteCallbackDummy
	cmp r1, r0
	bne _0802D2C6
	ldr r0, _0802D2DC @ =gSaveBlock2
	ldrb r0, [r0, 0x8]
	bl nullsub_10
	ldrb r0, [r4]
	adds r0, r5
	ldrb r1, [r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r6
	bl FreeSpriteOamMatrix
	ldrb r0, [r4]
	adds r0, r5
	ldrb r1, [r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r6
	bl DestroySprite
	bl PlayerBufferExecCompleted
_0802D2C6:
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_0802D2CC: .4byte gSprites
_0802D2D0: .4byte gObjectBankIDs
_0802D2D4: .4byte gActiveBank
_0802D2D8: .4byte SpriteCallbackDummy
_0802D2DC: .4byte gSaveBlock2
	thumb_func_end sub_802D274

	thumb_func_start sub_802D2E0
sub_802D2E0: @ 802D2E0
	push {lr}
	ldr r3, _0802D314 @ =gActiveBank
	ldrb r0, [r3]
	lsls r1, r0, 1
	adds r1, r0
	lsls r1, 2
	ldr r2, _0802D318 @ =0x02017810
	adds r1, r2
	ldrb r0, [r1, 0x9]
	subs r0, 0x1
	strb r0, [r1, 0x9]
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0xFF
	bne _0802D310
	ldrb r0, [r3]
	lsls r1, r0, 1
	adds r1, r0
	lsls r1, 2
	adds r1, r2
	movs r0, 0
	strb r0, [r1, 0x9]
	bl PlayerBufferExecCompleted
_0802D310:
	pop {r0}
	bx r0
	.align 2, 0
_0802D314: .4byte gActiveBank
_0802D318: .4byte 0x02017810
	thumb_func_end sub_802D2E0

	thumb_func_start sub_802D31C
sub_802D31C: @ 802D31C
	push {r4-r7,lr}
	movs r6, 0
	bl IsDoubleBattle
	lsls r0, 24
	cmp r0, 0
	beq _0802D340
	bl IsDoubleBattle
	lsls r0, 24
	cmp r0, 0
	beq _0802D374
	ldr r0, _0802D360 @ =gBattleTypeFlags
	ldrh r1, [r0]
	movs r0, 0x40
	ands r0, r1
	cmp r0, 0
	beq _0802D374
_0802D340:
	ldr r2, _0802D364 @ =gSprites
	ldr r1, _0802D368 @ =gHealthboxIDs
	ldr r0, _0802D36C @ =gActiveBank
	ldrb r0, [r0]
	adds r0, r1
	ldrb r1, [r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r2, 0x1C
	adds r0, r2
	ldr r1, [r0]
	ldr r0, _0802D370 @ =SpriteCallbackDummy
	cmp r1, r0
	bne _0802D3AA
	b _0802D3A8
	.align 2, 0
_0802D360: .4byte gBattleTypeFlags
_0802D364: .4byte gSprites
_0802D368: .4byte gHealthboxIDs
_0802D36C: .4byte gActiveBank
_0802D370: .4byte SpriteCallbackDummy
_0802D374:
	ldr r2, _0802D45C @ =gSprites
	ldr r5, _0802D460 @ =gHealthboxIDs
	ldr r0, _0802D464 @ =gActiveBank
	ldrb r3, [r0]
	adds r0, r3, r5
	ldrb r1, [r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r2, 0x1C
	adds r0, r2
	ldr r4, [r0]
	ldr r0, _0802D468 @ =SpriteCallbackDummy
	cmp r4, r0
	bne _0802D3AA
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
	bne _0802D3AA
_0802D3A8:
	movs r6, 0x1
_0802D3AA:
	bl IsCryPlayingOrClearCrySongs
	lsls r0, 24
	cmp r0, 0
	beq _0802D3B6
	movs r6, 0
_0802D3B6:
	cmp r6, 0
	bne _0802D3BC
	b _0802D4DA
_0802D3BC:
	ldr r7, _0802D464 @ =gActiveBank
	ldrb r2, [r7]
	lsls r0, r2, 1
	adds r0, r2
	lsls r0, 2
	ldr r5, _0802D46C @ =0x02017810
	adds r4, r0, r5
	ldrb r1, [r4, 0x1]
	movs r3, 0x1
	adds r0, r3, 0
	ands r0, r1
	cmp r0, 0
	bne _0802D3D8
	b _0802D4DA
_0802D3D8:
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
	beq _0802D4DA
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
	ldr r4, _0802D470 @ =0x000027f9
	adds r0, r4, 0
	bl FreeSpriteTilesByTag
	adds r0, r4, 0
	bl FreeSpritePaletteByTag
	ldr r0, _0802D474 @ =gBattleTypeFlags
	ldrh r1, [r0]
	movs r0, 0x40
	ands r0, r1
	cmp r0, 0
	beq _0802D47C
	ldr r0, _0802D478 @ =gMPlay_BGM
	bl m4aMPlayContinue
	b _0802D488
	.align 2, 0
_0802D45C: .4byte gSprites
_0802D460: .4byte gHealthboxIDs
_0802D464: .4byte gActiveBank
_0802D468: .4byte SpriteCallbackDummy
_0802D46C: .4byte 0x02017810
_0802D470: .4byte 0x000027f9
_0802D474: .4byte gBattleTypeFlags
_0802D478: .4byte gMPlay_BGM
_0802D47C:
	ldr r0, _0802D4E0 @ =gMPlay_BGM
	ldr r1, _0802D4E4 @ =0x0000ffff
	movs r2, 0x80
	lsls r2, 1
	bl m4aMPlayVolumeControl
_0802D488:
	ldr r7, _0802D4E8 @ =gBattlePartyID
	ldr r4, _0802D4EC @ =gActiveBank
	ldrb r1, [r4]
	lsls r0, r1, 1
	adds r0, r7
	ldrh r0, [r0]
	movs r6, 0x64
	muls r0, r6
	ldr r5, _0802D4F0 @ =gPlayerParty
	adds r0, r5
	bl sub_80324F8
	bl IsDoubleBattle
	lsls r0, 24
	cmp r0, 0
	beq _0802D4BE
	ldrb r0, [r4]
	movs r1, 0x2
	eors r1, r0
	lsls r0, r1, 1
	adds r0, r7
	ldrh r0, [r0]
	muls r0, r6
	adds r0, r5
	bl sub_80324F8
_0802D4BE:
	ldrb r1, [r4]
	lsls r0, r1, 1
	adds r0, r1
	lsls r0, 2
	ldr r1, _0802D4F4 @ =0x02017810
	adds r0, r1
	movs r1, 0x3
	strb r1, [r0, 0x9]
	ldr r1, _0802D4F8 @ =gBattleBankFunc
	ldrb r0, [r4]
	lsls r0, 2
	adds r0, r1
	ldr r1, _0802D4FC @ =sub_802D2E0
	str r1, [r0]
_0802D4DA:
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_0802D4E0: .4byte gMPlay_BGM
_0802D4E4: .4byte 0x0000ffff
_0802D4E8: .4byte gBattlePartyID
_0802D4EC: .4byte gActiveBank
_0802D4F0: .4byte gPlayerParty
_0802D4F4: .4byte 0x02017810
_0802D4F8: .4byte gBattleBankFunc
_0802D4FC: .4byte sub_802D2E0
	thumb_func_end sub_802D31C

	thumb_func_start sub_802D500
sub_802D500: @ 802D500
	push {r4-r7,lr}
	ldr r5, _0802D654 @ =gActiveBank
	ldrb r2, [r5]
	lsls r3, r2, 1
	adds r0, r3, r2
	lsls r0, 2
	ldr r4, _0802D658 @ =0x02017810
	adds r0, r4
	ldrb r1, [r0]
	movs r7, 0x88
	adds r0, r7, 0
	ands r0, r1
	cmp r0, 0
	bne _0802D530
	ldr r0, _0802D65C @ =gBattlePartyID
	adds r0, r3, r0
	ldrh r1, [r0]
	movs r0, 0x64
	muls r1, r0
	ldr r0, _0802D660 @ =gPlayerParty
	adds r1, r0
	adds r0, r2, 0
	bl sub_8141828
_0802D530:
	ldrb r0, [r5]
	movs r6, 0x2
	adds r2, r6, 0
	eors r2, r0
	lsls r3, r2, 1
	adds r0, r3, r2
	lsls r0, 2
	adds r0, r4
	ldrb r1, [r0]
	adds r0, r7, 0
	ands r0, r1
	cmp r0, 0
	bne _0802D55E
	ldr r0, _0802D65C @ =gBattlePartyID
	adds r0, r3, r0
	ldrh r1, [r0]
	movs r0, 0x64
	muls r1, r0
	ldr r0, _0802D660 @ =gPlayerParty
	adds r1, r0
	adds r0, r2, 0
	bl sub_8141828
_0802D55E:
	ldrb r2, [r5]
	lsls r0, r2, 1
	adds r0, r2
	lsls r0, 2
	adds r0, r4
	ldrb r1, [r0]
	movs r3, 0x8
	adds r0, r3, 0
	ands r0, r1
	cmp r0, 0
	bne _0802D64C
	adds r1, r6, 0
	eors r1, r2
	lsls r0, r1, 1
	adds r0, r1
	lsls r0, 2
	adds r0, r4
	ldrb r1, [r0]
	adds r0, r3, 0
	ands r0, r1
	cmp r0, 0
	bne _0802D64C
	bl IsDoubleBattle
	lsls r0, 24
	cmp r0, 0
	beq _0802D5EE
	ldr r0, _0802D664 @ =gBattleTypeFlags
	ldrh r1, [r0]
	movs r0, 0x40
	ands r0, r1
	cmp r0, 0
	bne _0802D5EE
	ldr r1, _0802D668 @ =gUnknown_0300434C
	ldrb r0, [r5]
	eors r0, r6
	adds r0, r1
	ldrb r1, [r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	ldr r1, _0802D66C @ =gSprites
	adds r0, r1
	bl DestroySprite
	ldr r4, _0802D670 @ =gHealthboxIDs
	ldrb r0, [r5]
	adds r1, r6, 0
	eors r1, r0
	adds r0, r1, r4
	ldrb r0, [r0]
	ldr r2, _0802D65C @ =gBattlePartyID
	lsls r1, 1
	adds r1, r2
	ldrh r2, [r1]
	movs r1, 0x64
	muls r1, r2
	ldr r2, _0802D660 @ =gPlayerParty
	adds r1, r2
	movs r2, 0
	bl sub_8045A5C
	ldrb r0, [r5]
	eors r0, r6
	bl sub_804777C
	ldrb r0, [r5]
	eors r0, r6
	adds r0, r4
	ldrb r0, [r0]
	bl sub_8043DFC
_0802D5EE:
	ldr r1, _0802D668 @ =gUnknown_0300434C
	ldr r4, _0802D654 @ =gActiveBank
	ldrb r0, [r4]
	adds r0, r1
	ldrb r1, [r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	ldr r1, _0802D66C @ =gSprites
	adds r0, r1
	bl DestroySprite
	ldr r5, _0802D670 @ =gHealthboxIDs
	ldrb r1, [r4]
	adds r0, r1, r5
	ldrb r0, [r0]
	ldr r2, _0802D65C @ =gBattlePartyID
	lsls r1, 1
	adds r1, r2
	ldrh r2, [r1]
	movs r1, 0x64
	muls r1, r2
	ldr r2, _0802D660 @ =gPlayerParty
	adds r1, r2
	movs r2, 0
	bl sub_8045A5C
	ldrb r0, [r4]
	bl sub_804777C
	ldrb r0, [r4]
	adds r0, r5
	ldrb r0, [r0]
	bl sub_8043DFC
	ldr r2, _0802D674 @ =0x02017840
	ldrb r1, [r2, 0x9]
	movs r0, 0x2
	negs r0, r0
	ands r0, r1
	strb r0, [r2, 0x9]
	ldr r1, _0802D678 @ =gBattleBankFunc
	ldrb r0, [r4]
	lsls r0, 2
	adds r0, r1
	ldr r1, _0802D67C @ =sub_802D31C
	str r1, [r0]
_0802D64C:
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_0802D654: .4byte gActiveBank
_0802D658: .4byte 0x02017810
_0802D65C: .4byte gBattlePartyID
_0802D660: .4byte gPlayerParty
_0802D664: .4byte gBattleTypeFlags
_0802D668: .4byte gUnknown_0300434C
_0802D66C: .4byte gSprites
_0802D670: .4byte gHealthboxIDs
_0802D674: .4byte 0x02017840
_0802D678: .4byte gBattleBankFunc
_0802D67C: .4byte sub_802D31C
	thumb_func_end sub_802D500

	thumb_func_start sub_802D680
sub_802D680: @ 802D680
	push {r4-r6,lr}
	ldr r2, _0802D710 @ =gSprites
	ldr r0, _0802D714 @ =gHealthboxIDs
	ldr r6, _0802D718 @ =gActiveBank
	ldrb r3, [r6]
	adds r0, r3, r0
	ldrb r1, [r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r2, 0x1C
	adds r0, r2
	ldr r1, [r0]
	ldr r0, _0802D71C @ =SpriteCallbackDummy
	cmp r1, r0
	bne _0802D708
	lsls r0, r3, 1
	adds r0, r3
	lsls r0, 2
	ldr r5, _0802D720 @ =0x02017810
	adds r2, r0, r5
	ldrb r1, [r2, 0x1]
	movs r0, 0x1
	ands r0, r1
	cmp r0, 0
	beq _0802D708
	ldrb r1, [r2]
	movs r0, 0x7F
	ands r0, r1
	strb r0, [r2]
	ldrb r0, [r6]
	lsls r1, r0, 1
	adds r1, r0
	lsls r1, 2
	adds r1, r5
	ldrb r2, [r1, 0x1]
	movs r0, 0x2
	negs r0, r0
	ands r0, r2
	strb r0, [r1, 0x1]
	ldr r4, _0802D724 @ =0x000027f9
	adds r0, r4, 0
	bl FreeSpriteTilesByTag
	adds r0, r4, 0
	bl FreeSpritePaletteByTag
	ldrb r2, [r6]
	lsls r0, r2, 2
	adds r1, r5, 0
	subs r1, 0x10
	adds r0, r1
	ldrb r1, [r0]
	movs r0, 0x4
	ands r0, r1
	cmp r0, 0
	beq _0802D6FC
	adds r0, r2, 0
	adds r1, r2, 0
	movs r3, 0x6
	bl move_anim_start_t4
_0802D6FC:
	ldr r0, _0802D728 @ =gBattleBankFunc
	ldrb r1, [r6]
	lsls r1, 2
	adds r1, r0
	ldr r0, _0802D72C @ =sub_802D730
	str r0, [r1]
_0802D708:
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_0802D710: .4byte gSprites
_0802D714: .4byte gHealthboxIDs
_0802D718: .4byte gActiveBank
_0802D71C: .4byte SpriteCallbackDummy
_0802D720: .4byte 0x02017810
_0802D724: .4byte 0x000027f9
_0802D728: .4byte gBattleBankFunc
_0802D72C: .4byte sub_802D730
	thumb_func_end sub_802D680

	thumb_func_start sub_802D730
sub_802D730: @ 802D730
	push {r4,lr}
	ldr r4, _0802D780 @ =gActiveBank
	ldrb r1, [r4]
	lsls r0, r1, 1
	adds r0, r1
	lsls r0, 2
	ldr r1, _0802D784 @ =0x02017810
	adds r0, r1
	ldrb r1, [r0]
	movs r0, 0x40
	ands r0, r1
	cmp r0, 0
	bne _0802D77A
	bl IsCryPlayingOrClearCrySongs
	lsls r0, 24
	cmp r0, 0
	bne _0802D77A
	ldr r0, _0802D788 @ =gMPlay_BGM
	ldr r1, _0802D78C @ =0x0000ffff
	movs r2, 0x80
	lsls r2, 1
	bl m4aMPlayVolumeControl
	ldr r2, _0802D790 @ =gBattlePartyID
	ldrb r1, [r4]
	lsls r0, r1, 1
	adds r0, r2
	ldrh r2, [r0]
	movs r0, 0x64
	muls r0, r2
	ldr r2, _0802D794 @ =gPlayerParty
	adds r0, r2
	bl sub_80324F8
	bl PlayerBufferExecCompleted
_0802D77A:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0802D780: .4byte gActiveBank
_0802D784: .4byte 0x02017810
_0802D788: .4byte gMPlay_BGM
_0802D78C: .4byte 0x0000ffff
_0802D790: .4byte gBattlePartyID
_0802D794: .4byte gPlayerParty
	thumb_func_end sub_802D730

	thumb_func_start sub_802D798
sub_802D798: @ 802D798
	push {r4-r6,lr}
	ldr r5, _0802D844 @ =gActiveBank
	ldrb r2, [r5]
	lsls r3, r2, 1
	adds r0, r3, r2
	lsls r0, 2
	ldr r6, _0802D848 @ =0x02017810
	adds r0, r6
	ldrb r1, [r0]
	movs r0, 0x88
	ands r0, r1
	cmp r0, 0
	bne _0802D7C6
	ldr r0, _0802D84C @ =gBattlePartyID
	adds r0, r3, r0
	ldrh r1, [r0]
	movs r0, 0x64
	muls r1, r0
	ldr r0, _0802D850 @ =gPlayerParty
	adds r1, r0
	adds r0, r2, 0
	bl sub_8141828
_0802D7C6:
	ldr r4, _0802D854 @ =gSprites
	ldr r0, _0802D858 @ =gUnknown_0300434C
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
	ldr r0, _0802D85C @ =SpriteCallbackDummy
	cmp r1, r0
	bne _0802D83C
	lsls r0, r2, 1
	adds r0, r2
	lsls r0, 2
	adds r0, r6
	ldrb r1, [r0]
	movs r0, 0x8
	ands r0, r1
	cmp r0, 0
	bne _0802D83C
	adds r0, r3, r4
	bl DestroySprite
	ldr r4, _0802D860 @ =gHealthboxIDs
	ldrb r1, [r5]
	adds r0, r1, r4
	ldrb r0, [r0]
	ldr r2, _0802D84C @ =gBattlePartyID
	lsls r1, 1
	adds r1, r2
	ldrh r2, [r1]
	movs r1, 0x64
	muls r1, r2
	ldr r2, _0802D850 @ =gPlayerParty
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
	ldr r1, _0802D864 @ =gBattleBankFunc
	ldrb r0, [r5]
	lsls r0, 2
	adds r0, r1
	ldr r1, _0802D868 @ =sub_802D680
	str r1, [r0]
_0802D83C:
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_0802D844: .4byte gActiveBank
_0802D848: .4byte 0x02017810
_0802D84C: .4byte gBattlePartyID
_0802D850: .4byte gPlayerParty
_0802D854: .4byte gSprites
_0802D858: .4byte gUnknown_0300434C
_0802D85C: .4byte SpriteCallbackDummy
_0802D860: .4byte gHealthboxIDs
_0802D864: .4byte gBattleBankFunc
_0802D868: .4byte sub_802D680
	thumb_func_end sub_802D798

	thumb_func_start c3_0802FDF4
c3_0802FDF4: @ 802D86C
	push {r4,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	bl IsCryPlayingOrClearCrySongs
	lsls r0, 24
	cmp r0, 0
	bne _0802D88E
	ldr r0, _0802D894 @ =gMPlay_BGM
	ldr r1, _0802D898 @ =0x0000ffff
	movs r2, 0x80
	lsls r2, 1
	bl m4aMPlayVolumeControl
	adds r0, r4, 0
	bl DestroyTask
_0802D88E:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0802D894: .4byte gMPlay_BGM
_0802D898: .4byte 0x0000ffff
	thumb_func_end c3_0802FDF4

	thumb_func_start bx_t1_healthbar_update
bx_t1_healthbar_update: @ 802D89C
	push {r4-r6,lr}
	ldr r5, _0802D8DC @ =gActiveBank
	ldrb r0, [r5]
	ldr r6, _0802D8E0 @ =gHealthboxIDs
	adds r1, r0, r6
	ldrb r1, [r1]
	movs r2, 0
	movs r3, 0
	bl sub_8045C78
	adds r4, r0, 0
	lsls r4, 16
	lsrs r4, 16
	ldrb r0, [r5]
	adds r0, r6
	ldrb r0, [r0]
	bl sub_8043DFC
	lsls r4, 16
	asrs r1, r4, 16
	movs r0, 0x1
	negs r0, r0
	cmp r1, r0
	beq _0802D8E4
	ldrb r0, [r5]
	adds r0, r6
	ldrb r0, [r0]
	movs r2, 0
	bl sub_80440EC
	b _0802D8FE
	.align 2, 0
_0802D8DC: .4byte gActiveBank
_0802D8E0: .4byte gHealthboxIDs
_0802D8E4:
	ldr r2, _0802D904 @ =gBattlePartyID
	ldrb r1, [r5]
	lsls r0, r1, 1
	adds r0, r2
	ldrh r2, [r0]
	movs r0, 0x64
	muls r0, r2
	ldr r2, _0802D908 @ =gPlayerParty
	adds r0, r2
	bl sub_80324F8
	bl PlayerBufferExecCompleted
_0802D8FE:
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_0802D904: .4byte gBattlePartyID
_0802D908: .4byte gPlayerParty
	thumb_func_end bx_t1_healthbar_update

	thumb_func_start sub_802D90C
sub_802D90C: @ 802D90C
	push {lr}
	ldr r0, _0802D920 @ =gUnknown_03004210
	ldrh r0, [r0, 0x16]
	cmp r0, 0
	bne _0802D91A
	bl PlayerBufferExecCompleted
_0802D91A:
	pop {r0}
	bx r0
	.align 2, 0
_0802D920: .4byte gUnknown_03004210
	thumb_func_end sub_802D90C

	thumb_func_start sub_802D924
sub_802D924: @ 802D924
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	sub sp, 0x10
	lsls r0, 24
	lsrs r0, 24
	mov r9, r0
	ldr r1, _0802DA24 @ =gTasks
	lsls r0, 2
	add r0, r9
	lsls r0, 3
	adds r0, r1
	mov r8, r0
	ldrb r0, [r0, 0x8]
	mov r10, r0
	mov r1, r8
	ldrb r7, [r1, 0xC]
	str r7, [sp, 0x8]
	ldrh r2, [r1, 0xA]
	str r2, [sp, 0xC]
	bl IsDoubleBattle
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	beq _0802D96A
	ldr r1, _0802DA28 @ =gBattlePartyID
	lsls r0, r7, 1
	adds r0, r1
	ldrh r0, [r0]
	cmp r10, r0
	bne _0802D96A
	b _0802DA80
_0802D96A:
	movs r0, 0x64
	mov r1, r10
	muls r1, r0
	ldr r0, _0802DA2C @ =gPlayerParty
	adds r6, r1, r0
	adds r0, r6, 0
	movs r1, 0xB
	bl GetMonData
	adds r5, r0, 0
	lsls r5, 16
	lsrs r5, 16
	adds r0, r6, 0
	movs r1, 0x38
	bl GetMonData
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	adds r0, r6, 0
	movs r1, 0x19
	bl GetMonData
	str r0, [sp, 0x4]
	ldr r3, _0802DA30 @ =gExperienceTables
	adds r4, 0x1
	lsls r4, 2
	ldr r2, _0802DA34 @ =gBaseStats
	lsls r1, r5, 3
	subs r1, r5
	lsls r1, 2
	adds r1, r2
	ldrb r2, [r1, 0x13]
	movs r1, 0xCA
	lsls r1, 1
	muls r1, r2
	adds r4, r1
	adds r4, r3
	ldr r2, [r4]
	str r2, [sp]
	ldr r3, [sp, 0xC]
	lsls r1, r3, 16
	asrs r1, 16
	adds r0, r1
	cmp r0, r2
	bcc _0802DA58
	adds r0, r6, 0
	movs r1, 0x19
	mov r2, sp
	bl SetMonData
	adds r0, r6, 0
	bl CalculateMonStats
	ldr r2, [sp]
	add r0, sp, 0x4
	ldrh r0, [r0]
	subs r2, r0
	ldr r0, [sp, 0xC]
	subs r2, r0, r2
	ldr r4, _0802DA38 @ =gActiveBank
	ldrb r5, [r4]
	strb r7, [r4]
	lsls r2, 16
	lsrs r2, 16
	movs r0, 0x1
	movs r1, 0xB
	bl dp01_build_cmdbuf_x21_a_bb
	strb r5, [r4]
	bl IsDoubleBattle
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _0802DA40
	ldr r2, _0802DA28 @ =gBattlePartyID
	lsls r0, r7, 1
	adds r0, r2
	mov r1, r10
	ldrh r0, [r0]
	cmp r1, r0
	beq _0802DA1E
	movs r0, 0x2
	eors r7, r0
	lsls r0, r7, 1
	adds r0, r2
	ldrh r0, [r0]
	cmp r1, r0
	bne _0802DA40
_0802DA1E:
	ldr r0, _0802DA3C @ =sub_802DCB0
	b _0802DA82
	.align 2, 0
_0802DA24: .4byte gTasks
_0802DA28: .4byte gBattlePartyID
_0802DA2C: .4byte gPlayerParty
_0802DA30: .4byte gExperienceTables
_0802DA34: .4byte gBaseStats
_0802DA38: .4byte gActiveBank
_0802DA3C: .4byte sub_802DCB0
_0802DA40:
	ldr r0, _0802DA50 @ =gTasks
	mov r2, r9
	lsls r1, r2, 2
	add r1, r9
	lsls r1, 3
	adds r1, r0
	ldr r0, _0802DA54 @ =sub_802DDC4
	b _0802DA84
	.align 2, 0
_0802DA50: .4byte gTasks
_0802DA54: .4byte sub_802DDC4
_0802DA58:
	str r0, [sp, 0x4]
	add r2, sp, 0x4
	adds r0, r6, 0
	movs r1, 0x19
	bl SetMonData
	ldr r1, _0802DA78 @ =gBattleBankFunc
	ldr r3, [sp, 0x8]
	lsls r0, r3, 2
	adds r0, r1
	ldr r1, _0802DA7C @ =sub_802D90C
	str r1, [r0]
	mov r0, r9
	bl DestroyTask
	b _0802DA86
	.align 2, 0
_0802DA78: .4byte gBattleBankFunc
_0802DA7C: .4byte sub_802D90C
_0802DA80:
	ldr r0, _0802DA98 @ =sub_802DA9C
_0802DA82:
	mov r1, r8
_0802DA84:
	str r0, [r1]
_0802DA86:
	add sp, 0x10
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_0802DA98: .4byte sub_802DA9C
	thumb_func_end sub_802D924

	thumb_func_start sub_802DA9C
sub_802DA9C: @ 802DA9C
	push {r4-r6,lr}
	mov r6, r10
	mov r5, r9
	mov r4, r8
	push {r4-r6}
	sub sp, 0x4
	lsls r0, 24
	lsrs r0, 24
	ldr r1, _0802DB54 @ =gTasks
	lsls r2, r0, 2
	mov r8, r2
	add r8, r0
	mov r0, r8
	lsls r0, 3
	mov r8, r0
	add r8, r1
	mov r2, r8
	ldrb r1, [r2, 0x8]
	movs r0, 0xA
	ldrsh r2, [r2, r0]
	mov r9, r2
	mov r2, r8
	ldrb r2, [r2, 0xC]
	mov r10, r2
	movs r0, 0x64
	adds r6, r1, 0
	muls r6, r0
	ldr r0, _0802DB58 @ =gPlayerParty
	adds r6, r0
	adds r0, r6, 0
	movs r1, 0x38
	bl GetMonData
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	adds r0, r6, 0
	movs r1, 0xB
	bl GetMonData
	adds r5, r0, 0
	lsls r5, 16
	lsrs r5, 16
	adds r0, r6, 0
	movs r1, 0x19
	bl GetMonData
	adds r3, r0, 0
	ldr r6, _0802DB5C @ =gExperienceTables
	lsls r1, r4, 2
	ldr r2, _0802DB60 @ =gBaseStats
	lsls r0, r5, 3
	subs r0, r5
	lsls r0, 2
	adds r0, r2
	ldrb r2, [r0, 0x13]
	movs r0, 0xCA
	lsls r0, 1
	muls r0, r2
	adds r1, r0
	adds r1, r6
	ldr r1, [r1]
	subs r3, r1
	adds r4, 0x1
	lsls r4, 2
	adds r4, r0
	adds r4, r6
	ldr r2, [r4]
	subs r2, r1
	ldr r0, _0802DB64 @ =gHealthboxIDs
	add r0, r10
	ldrb r1, [r0]
	mov r0, r9
	negs r0, r0
	str r0, [sp]
	mov r0, r10
	bl sub_8043D84
	movs r0, 0x21
	bl PlaySE
	ldr r0, _0802DB68 @ =sub_802DB6C
	mov r1, r8
	str r0, [r1]
	add sp, 0x4
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_0802DB54: .4byte gTasks
_0802DB58: .4byte gPlayerParty
_0802DB5C: .4byte gExperienceTables
_0802DB60: .4byte gBaseStats
_0802DB64: .4byte gHealthboxIDs
_0802DB68: .4byte sub_802DB6C
	thumb_func_end sub_802DA9C

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
