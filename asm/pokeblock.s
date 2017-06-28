	.include "constants/gba_constants.inc"
	.include "constants/species_constants.inc"
	.include "asm/macros.inc"

	.syntax unified

	.text

	thumb_func_start sub_810C5C0
sub_810C5C0: @ 810C5C0
	push {r4,lr}
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	movs r0, 0x1
	movs r1, 0x1
	bl sub_80F979C
	ldr r1, _0810C5E4 @ =gTasks
	lsls r0, r4, 2
	adds r0, r4
	lsls r0, 3
	adds r0, r1
	ldr r1, _0810C5E8 @ =sub_810C540
	str r1, [r0]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0810C5E4: .4byte gTasks
_0810C5E8: .4byte sub_810C540
	thumb_func_end sub_810C5C0

	thumb_func_start sub_810C5EC
sub_810C5EC: @ 810C5EC
	push {r4,lr}
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	movs r0, 0x7
	movs r1, 0x6
	movs r2, 0x1
	bl DisplayYesNoMenu
	ldr r1, _0810C60C @ =gUnknown_083F7F24
	adds r0, r4, 0
	bl DoYesNoFuncWithChoice
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0810C60C: .4byte gUnknown_083F7F24
	thumb_func_end sub_810C5EC

	thumb_func_start sub_810C610
sub_810C610: @ 810C610
	push {r4,r5,lr}
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	movs r0, 0x7
	movs r1, 0x6
	movs r2, 0xD
	movs r3, 0xB
	bl MenuZeroFillWindowRect
	ldr r1, _0810C658 @ =gUnknown_02039248
	ldrb r0, [r1, 0x1]
	ldrb r1, [r1]
	adds r0, r1
	lsls r0, 24
	lsrs r0, 24
	bl sub_810CA6C
	ldr r5, _0810C65C @ =gStringVar4
	ldr r1, _0810C660 @ =gContestStatsText_WasThrownAway
	adds r0, r5, 0
	bl StringExpandPlaceholders
	ldr r2, _0810C664 @ =sub_810C704
	adds r0, r4, 0
	adds r1, r5, 0
	movs r3, 0
	bl DisplayItemMessageOnField
	bl sub_810BC98
	bl sub_810BD08
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_0810C658: .4byte gUnknown_02039248
_0810C65C: .4byte gStringVar4
_0810C660: .4byte gContestStatsText_WasThrownAway
_0810C664: .4byte sub_810C704
	thumb_func_end sub_810C610

	thumb_func_start sub_810C668
sub_810C668: @ 810C668
	push {r4,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	movs r0, 0
	bl StartVerticalScrollIndicators
	movs r0, 0x1
	bl StartVerticalScrollIndicators
	ldr r2, _0810C6CC @ =gUnknown_02039248
	ldrb r0, [r2, 0x2]
	ldrb r1, [r2, 0x3]
	cmp r0, r1
	bls _0810C698
	ldrb r0, [r2, 0x1]
	ldrb r1, [r2, 0x3]
	adds r0, r1
	ldrb r2, [r2, 0x2]
	cmp r0, r2
	beq _0810C698
	movs r0, 0x1
	movs r1, 0
	bl sub_80F979C
_0810C698:
	ldr r0, _0810C6D0 @ =gWindowConfig_81E6E50
	bl BasicInitMenuWindow
	movs r0, 0x7
	movs r1, 0x6
	movs r2, 0xD
	movs r3, 0xB
	bl MenuZeroFillWindowRect
	movs r0, 0
	movs r1, 0xE
	movs r2, 0x1D
	movs r3, 0x13
	bl MenuZeroFillWindowRect
	ldr r1, _0810C6D4 @ =gTasks
	lsls r0, r4, 2
	adds r0, r4
	lsls r0, 3
	adds r0, r1
	ldr r1, _0810C6D8 @ =sub_810BF7C
	str r1, [r0]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0810C6CC: .4byte gUnknown_02039248
_0810C6D0: .4byte gWindowConfig_81E6E50
_0810C6D4: .4byte gTasks
_0810C6D8: .4byte sub_810BF7C
	thumb_func_end sub_810C668

	thumb_func_start sub_810C6DC
sub_810C6DC: @ 810C6DC
	push {lr}
	lsls r0, 24
	lsrs r2, r0, 24
	ldr r0, _0810C700 @ =gMain
	ldrh r1, [r0, 0x2E]
	movs r0, 0x1
	ands r0, r1
	cmp r0, 0
	bne _0810C6F6
	movs r0, 0x2
	ands r0, r1
	cmp r0, 0
	beq _0810C6FC
_0810C6F6:
	adds r0, r2, 0
	bl sub_810C668
_0810C6FC:
	pop {r0}
	bx r0
	.align 2, 0
_0810C700: .4byte gMain
	thumb_func_end sub_810C6DC

	thumb_func_start sub_810C704
sub_810C704: @ 810C704
	push {r4,lr}
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	ldr r0, _0810C738 @ =gWindowConfig_81E6E34
	bl BasicInitMenuWindow
	ldr r0, _0810C73C @ =gUnknown_02039248
	ldrb r0, [r0, 0x1]
	bl sub_810BC84
	movs r0, 0x1
	movs r1, 0x1
	bl sub_80F979C
	ldr r1, _0810C740 @ =gTasks
	lsls r0, r4, 2
	adds r0, r4
	lsls r0, 3
	adds r0, r1
	ldr r1, _0810C744 @ =sub_810C6DC
	str r1, [r0]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0810C738: .4byte gWindowConfig_81E6E34
_0810C73C: .4byte gUnknown_02039248
_0810C740: .4byte gTasks
_0810C744: .4byte sub_810C6DC
	thumb_func_end sub_810C704

	thumb_func_start sub_810C748
sub_810C748: @ 810C748
	push {r4,lr}
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	movs r0, 0
	bl StartVerticalScrollIndicators
	movs r0, 0x1
	bl StartVerticalScrollIndicators
	bl HandleDestroyMenuCursors
	movs r0, 0x7
	movs r1, 0x4
	movs r2, 0xD
	movs r3, 0xB
	bl MenuZeroFillWindowRect
	ldr r1, _0810C780 @ =gTasks
	lsls r0, r4, 2
	adds r0, r4
	lsls r0, 3
	adds r0, r1
	ldr r1, _0810C784 @ =sub_810BF7C
	str r1, [r0]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0810C780: .4byte gTasks
_0810C784: .4byte sub_810BF7C
	thumb_func_end sub_810C748

	thumb_func_start sub_810C788
sub_810C788: @ 810C788
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	sub sp, 0x4
	lsls r0, 24
	lsrs r0, 24
	mov r8, r0
	ldr r0, _0810C834 @ =gEnemyParty
	bl GetNature
	lsls r0, 24
	lsrs r0, 24
	ldr r7, _0810C838 @ =gScriptItemId
	ldrh r1, [r7]
	lsls r1, 3
	ldr r5, _0810C83C @ =gSaveBlock1 + 0x7F8
	adds r1, r5
	bl sub_810CAE4
	adds r4, r0, 0
	lsls r4, 16
	lsrs r4, 16
	ldr r0, _0810C840 @ =gBattleTextBuff1
	ldr r2, _0810C844 @ =gPokeblockNames
	ldr r1, _0810C848 @ =0xfffff808
	adds r5, r1
	ldrh r1, [r7]
	lsls r1, 3
	adds r1, r5
	movs r6, 0xFF
	lsls r6, 3
	adds r1, r6
	ldrb r1, [r1]
	lsls r1, 2
	adds r1, r2
	ldr r1, [r1]
	bl StringCopy
	ldrb r0, [r7]
	bl sub_810CA6C
	ldrh r0, [r7]
	lsls r0, 3
	adds r0, r5
	adds r0, r6
	ldrb r0, [r0]
	lsls r0, 8
	strh r0, [r7]
	lsls r4, 16
	asrs r4, 16
	cmp r4, 0
	bne _0810C7F4
	adds r0, 0x1
	strh r0, [r7]
_0810C7F4:
	cmp r4, 0
	ble _0810C7FE
	ldrh r0, [r7]
	adds r0, 0x2
	strh r0, [r7]
_0810C7FE:
	cmp r4, 0
	bge _0810C808
	ldrh r0, [r7]
	adds r0, 0x3
	strh r0, [r7]
_0810C808:
	movs r0, 0x1
	negs r0, r0
	movs r1, 0
	str r1, [sp]
	movs r2, 0
	movs r3, 0x10
	bl BeginNormalPaletteFade
	ldr r1, _0810C84C @ =gTasks
	mov r2, r8
	lsls r0, r2, 2
	add r0, r8
	lsls r0, 3
	adds r0, r1
	ldr r1, _0810C850 @ =sub_810C2C8
	str r1, [r0]
	add sp, 0x4
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_0810C834: .4byte gEnemyParty
_0810C838: .4byte gScriptItemId
_0810C83C: .4byte gSaveBlock1 + 0x7F8
_0810C840: .4byte gBattleTextBuff1
_0810C844: .4byte gPokeblockNames
_0810C848: .4byte 0xfffff808
_0810C84C: .4byte gTasks
_0810C850: .4byte sub_810C2C8
	thumb_func_end sub_810C788

	thumb_func_start sub_810C854
sub_810C854: @ 810C854
	push {r4,r5,lr}
	sub sp, 0x4
	adds r5, r0, 0
	lsls r5, 24
	lsrs r5, 24
	ldr r4, _0810C8B8 @ =gScriptItemId
	ldrb r0, [r4]
	bl SafariZoneActivatePokeblockFeeder
	ldr r0, _0810C8BC @ =gStringVar1
	ldr r3, _0810C8C0 @ =gPokeblockNames
	ldr r2, _0810C8C4 @ =gSaveBlock1
	ldrh r1, [r4]
	lsls r1, 3
	adds r1, r2
	movs r2, 0xFF
	lsls r2, 3
	adds r1, r2
	ldrb r1, [r1]
	lsls r1, 2
	adds r1, r3
	ldr r1, [r1]
	bl StringCopy
	ldr r1, _0810C8C8 @ =gScriptResult
	ldrh r0, [r4]
	strh r0, [r1]
	lsls r0, 24
	lsrs r0, 24
	bl sub_810CA6C
	movs r0, 0x1
	negs r0, r0
	movs r1, 0
	str r1, [sp]
	movs r2, 0
	movs r3, 0x10
	bl BeginNormalPaletteFade
	ldr r1, _0810C8CC @ =gTasks
	lsls r0, r5, 2
	adds r0, r5
	lsls r0, 3
	adds r0, r1
	ldr r1, _0810C8D0 @ =sub_810C2C8
	str r1, [r0]
	add sp, 0x4
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_0810C8B8: .4byte gScriptItemId
_0810C8BC: .4byte gStringVar1
_0810C8C0: .4byte gPokeblockNames
_0810C8C4: .4byte gSaveBlock1
_0810C8C8: .4byte gScriptResult
_0810C8CC: .4byte gTasks
_0810C8D0: .4byte sub_810C2C8
	thumb_func_end sub_810C854

	thumb_func_start sub_810C8D4
sub_810C8D4: @ 810C8D4
	push {r4,r5,lr}
	adds r4, r0, 0
	movs r1, 0x2E
	ldrsh r0, [r4, r1]
	cmp r0, 0x1
	ble _0810C8E4
	movs r0, 0
	strh r0, [r4, 0x2E]
_0810C8E4:
	movs r0, 0x2E
	ldrsh r5, [r4, r0]
	cmp r5, 0
	beq _0810C8F2
	cmp r5, 0x1
	beq _0810C918
	b _0810C944
_0810C8F2:
	ldrb r1, [r4, 0x1]
	movs r0, 0x4
	negs r0, r0
	ands r0, r1
	movs r1, 0x1
	orrs r0, r1
	strb r0, [r4, 0x1]
	ldr r0, _0810C914 @ =gSpriteAffineAnimTable_83F7F70
	str r0, [r4, 0x10]
	adds r0, r4, 0
	bl InitSpriteAffineAnim
	movs r0, 0x1
	strh r0, [r4, 0x2E]
	strh r5, [r4, 0x30]
	b _0810C944
	.align 2, 0
_0810C914: .4byte gSpriteAffineAnimTable_83F7F70
_0810C918:
	ldrh r0, [r4, 0x30]
	adds r0, 0x1
	movs r2, 0
	strh r0, [r4, 0x30]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0xB
	ble _0810C944
	ldrb r1, [r4, 0x1]
	movs r0, 0x4
	negs r0, r0
	ands r0, r1
	strb r0, [r4, 0x1]
	strh r2, [r4, 0x2E]
	strh r2, [r4, 0x30]
	ldrb r0, [r4, 0x3]
	lsls r0, 26
	lsrs r0, 27
	bl FreeOamMatrix
	ldr r0, _0810C94C @ =SpriteCallbackDummy
	str r0, [r4, 0x1C]
_0810C944:
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_0810C94C: .4byte SpriteCallbackDummy
	thumb_func_end sub_810C8D4

	thumb_func_start ClearPokeblock
ClearPokeblock: @ 810C950
	lsls r0, 24
	ldr r1, _0810C988 @ =gSaveBlock1
	lsrs r0, 21
	adds r0, r1
	movs r2, 0xFF
	lsls r2, 3
	adds r1, r0, r2
	movs r2, 0
	strb r2, [r1]
	ldr r3, _0810C98C @ =0x000007f9
	adds r1, r0, r3
	strb r2, [r1]
	adds r3, 0x1
	adds r1, r0, r3
	strb r2, [r1]
	adds r3, 0x1
	adds r1, r0, r3
	strb r2, [r1]
	adds r3, 0x1
	adds r1, r0, r3
	strb r2, [r1]
	adds r3, 0x1
	adds r1, r0, r3
	strb r2, [r1]
	ldr r1, _0810C990 @ =0x000007fe
	adds r0, r1
	strb r2, [r0]
	bx lr
	.align 2, 0
_0810C988: .4byte gSaveBlock1
_0810C98C: .4byte 0x000007f9
_0810C990: .4byte 0x000007fe
	thumb_func_end ClearPokeblock

	thumb_func_start ClearPokeblocks
ClearPokeblocks: @ 810C994
	push {r4,lr}
	movs r4, 0
_0810C998:
	adds r0, r4, 0
	bl ClearPokeblock
	adds r0, r4, 0x1
	lsls r0, 24
	lsrs r4, r0, 24
	cmp r4, 0x27
	bls _0810C998
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end ClearPokeblocks

	thumb_func_start sub_810C9B0
sub_810C9B0: @ 810C9B0
	push {r4-r6,lr}
	adds r6, r0, 0
	movs r1, 0x1
	bl sub_810CA9C
	lsls r0, 24
	lsrs r5, r0, 24
	movs r1, 0x1
_0810C9C0:
	adds r0, r1, 0x1
	lsls r0, 24
	lsrs r4, r0, 24
	adds r0, r6, 0
	adds r1, r4, 0
	bl sub_810CA9C
	lsls r0, 24
	lsrs r0, 24
	cmp r5, r0
	bcs _0810C9D8
	adds r5, r0, 0
_0810C9D8:
	adds r1, r4, 0
	cmp r1, 0x4
	bls _0810C9C0
	adds r0, r5, 0
	pop {r4-r6}
	pop {r1}
	bx r1
	thumb_func_end sub_810C9B0

	thumb_func_start sub_810C9E8
sub_810C9E8: @ 810C9E8
	push {lr}
	movs r1, 0x6
	bl sub_810CA9C
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x63
	bls _0810C9FA
	movs r0, 0x63
_0810C9FA:
	pop {r1}
	bx r1
	thumb_func_end sub_810C9E8

	thumb_func_start sub_810CA00
sub_810CA00: @ 810CA00
	push {lr}
	movs r1, 0
	ldr r3, _0810CA1C @ =gSaveBlock1
	movs r2, 0xFF
	lsls r2, 3
_0810CA0A:
	lsls r0, r1, 3
	adds r0, r3
	adds r0, r2
	ldrb r0, [r0]
	cmp r0, 0
	bne _0810CA20
	lsls r0, r1, 24
	asrs r0, 24
	b _0810CA2E
	.align 2, 0
_0810CA1C: .4byte gSaveBlock1
_0810CA20:
	adds r0, r1, 0x1
	lsls r0, 24
	lsrs r1, r0, 24
	cmp r1, 0x27
	bls _0810CA0A
	movs r0, 0x1
	negs r0, r0
_0810CA2E:
	pop {r1}
	bx r1
	thumb_func_end sub_810CA00

	thumb_func_start sub_810CA34
sub_810CA34: @ 810CA34
	push {r4,lr}
	adds r4, r0, 0
	bl sub_810CA00
	lsls r0, 24
	asrs r2, r0, 24
	movs r0, 0x1
	negs r0, r0
	cmp r2, r0
	beq _0810CA64
	ldr r0, _0810CA60 @ =gSaveBlock1
	lsls r2, 3
	movs r1, 0xFF
	lsls r1, 3
	adds r0, r1
	adds r2, r0
	ldr r0, [r4]
	ldr r1, [r4, 0x4]
	str r0, [r2]
	str r1, [r2, 0x4]
	movs r0, 0x1
	b _0810CA66
	.align 2, 0
_0810CA60: .4byte gSaveBlock1
_0810CA64:
	movs r0, 0
_0810CA66:
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end sub_810CA34

	thumb_func_start sub_810CA6C
sub_810CA6C: @ 810CA6C
	push {lr}
	lsls r0, 24
	lsrs r2, r0, 24
	ldr r1, _0810CA90 @ =gSaveBlock1
	lsls r0, r2, 3
	adds r0, r1
	movs r1, 0xFF
	lsls r1, 3
	adds r0, r1
	ldrb r0, [r0]
	cmp r0, 0
	beq _0810CA94
	adds r0, r2, 0
	bl ClearPokeblock
	movs r0, 0x1
	b _0810CA96
	.align 2, 0
_0810CA90: .4byte gSaveBlock1
_0810CA94:
	movs r0, 0
_0810CA96:
	pop {r1}
	bx r1
	thumb_func_end sub_810CA6C

	thumb_func_start sub_810CA9C
sub_810CA9C: @ 810CA9C
	push {lr}
	lsls r1, 24
	lsrs r1, 24
	adds r2, r1, 0
	cmp r1, 0
	bne _0810CAAC
	ldrb r0, [r0]
	b _0810CADE
_0810CAAC:
	cmp r1, 0x1
	bne _0810CAB4
	ldrb r0, [r0, 0x1]
	b _0810CADE
_0810CAB4:
	cmp r1, 0x2
	bne _0810CABC
	ldrb r0, [r0, 0x2]
	b _0810CADE
_0810CABC:
	cmp r1, 0x3
	bne _0810CAC4
	ldrb r0, [r0, 0x3]
	b _0810CADE
_0810CAC4:
	cmp r1, 0x4
	bne _0810CACC
	ldrb r0, [r0, 0x4]
	b _0810CADE
_0810CACC:
	cmp r1, 0x5
	bne _0810CAD4
	ldrb r0, [r0, 0x5]
	b _0810CADE
_0810CAD4:
	cmp r2, 0x6
	beq _0810CADC
	movs r0, 0
	b _0810CADE
_0810CADC:
	ldrb r0, [r0, 0x6]
_0810CADE:
	pop {r1}
	bx r1
	thumb_func_end sub_810CA9C

	thumb_func_start sub_810CAE4
sub_810CAE4: @ 810CAE4
	push {r4-r7,lr}
	mov r7, r9
	mov r6, r8
	push {r6,r7}
	mov r8, r1
	lsls r0, 24
	lsrs r0, 24
	movs r6, 0
	movs r4, 0
	ldr r1, _0810CB40 @ =gPokeblockFlavorCompatibilityTable
	mov r9, r1
	lsls r1, r0, 2
	adds r7, r1, r0
_0810CAFE:
	adds r0, r4, 0x1
	lsls r0, 24
	lsrs r5, r0, 24
	mov r0, r8
	adds r1, r5, 0
	bl sub_810CA9C
	lsls r0, 16
	asrs r1, r0, 16
	cmp r1, 0
	ble _0810CB2A
	adds r0, r7, r4
	add r0, r9
	ldrb r0, [r0]
	lsls r0, 24
	asrs r0, 24
	muls r1, r0
	lsls r0, r6, 16
	asrs r0, 16
	adds r0, r1
	lsls r0, 16
	lsrs r6, r0, 16
_0810CB2A:
	adds r4, r5, 0
	cmp r4, 0x4
	bls _0810CAFE
	lsls r0, r6, 16
	asrs r0, 16
	pop {r3,r4}
	mov r8, r3
	mov r9, r4
	pop {r4-r7}
	pop {r1}
	bx r1
	.align 2, 0
_0810CB40: .4byte gPokeblockFlavorCompatibilityTable
	thumb_func_end sub_810CAE4

	thumb_func_start sub_810CB44
sub_810CB44: @ 810CB44
	push {r4,lr}
	adds r4, r1, 0
	movs r1, 0
	bl sub_810CA9C
	lsls r0, 24
	ldr r1, _0810CB64 @ =gPokeblockNames
	lsrs r0, 22
	adds r0, r1
	ldr r1, [r0]
	adds r0, r4, 0
	bl StringCopy
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0810CB64: .4byte gPokeblockNames
	thumb_func_end sub_810CB44

	thumb_func_start sub_810CB68
sub_810CB68: @ 810CB68
	push {r4-r7,lr}
	adds r6, r1, 0
	lsls r0, 24
	lsrs r5, r0, 24
	movs r4, 0
	ldr r7, _0810CB98 @ =gPokeblockNames
_0810CB74:
	lsls r1, r4, 3
	ldr r0, _0810CB9C @ =gUnknown_083F7F9C
	adds r1, r0
	adds r0, r5, 0
	bl sub_810CAE4
	lsls r0, 16
	cmp r0, 0
	ble _0810CBA0
	adds r0, r4, 0x1
	lsls r0, 2
	adds r0, r7
	ldr r1, [r0]
	adds r0, r6, 0
	bl StringCopy
	movs r0, 0x1
	b _0810CBAC
	.align 2, 0
_0810CB98: .4byte gPokeblockNames
_0810CB9C: .4byte gUnknown_083F7F9C
_0810CBA0:
	adds r0, r4, 0x1
	lsls r0, 24
	lsrs r4, r0, 24
	cmp r4, 0x4
	bls _0810CB74
	movs r0, 0
_0810CBAC:
	pop {r4-r7}
	pop {r1}
	bx r1
	thumb_func_end sub_810CB68

	.align 2, 0 @ Don't pad with nop.
