	.include "constants/gba_constants.inc"
	.include "constants/species_constants.inc"
	.include "asm/macros.inc"

	.syntax unified

	.text

	thumb_func_start sub_810F488
sub_810F488: @ 810F488
	push {lr}
	ldr r1, _0810F4A0 @ =gSpecialVar_0x8004
	ldr r0, _0810F4A4 @ =0x00000277
	strh r0, [r1]
	bl FlagGet
	lsls r0, 24
	cmp r0, 0
	beq _0810F4A8
	movs r0, 0x1
	b _0810F4AA
	.align 2, 0
_0810F4A0: .4byte gSpecialVar_0x8004
_0810F4A4: .4byte 0x00000277
_0810F4A8:
	movs r0, 0
_0810F4AA:
	pop {r1}
	bx r1
	thumb_func_end sub_810F488

	thumb_func_start sub_810F4B0
sub_810F4B0: @ 810F4B0
	push {lr}
	ldr r1, _0810F4C8 @ =gSpecialVar_0x8004
	movs r0, 0x9E
	lsls r0, 2
	strh r0, [r1]
	bl FlagGet
	lsls r0, 24
	cmp r0, 0
	beq _0810F4CC
	movs r0, 0x1
	b _0810F4CE
	.align 2, 0
_0810F4C8: .4byte gSpecialVar_0x8004
_0810F4CC:
	movs r0, 0
_0810F4CE:
	pop {r1}
	bx r1
	thumb_func_end sub_810F4B0

	thumb_func_start sub_810F4D4
sub_810F4D4: @ 810F4D4
	push {lr}
	ldr r1, _0810F4EC @ =gSpecialVar_0x8004
	ldr r0, _0810F4F0 @ =0x00000279
	strh r0, [r1]
	bl FlagGet
	lsls r0, 24
	cmp r0, 0
	beq _0810F4F4
	movs r0, 0x1
	b _0810F4F6
	.align 2, 0
_0810F4EC: .4byte gSpecialVar_0x8004
_0810F4F0: .4byte 0x00000279
_0810F4F4:
	movs r0, 0
_0810F4F6:
	pop {r1}
	bx r1
	thumb_func_end sub_810F4D4

	thumb_func_start sub_810F4FC
sub_810F4FC: @ 810F4FC
	push {lr}
	ldr r1, _0810F514 @ =gSpecialVar_0x8004
	ldr r0, _0810F518 @ =0x0000027a
	strh r0, [r1]
	bl FlagGet
	lsls r0, 24
	cmp r0, 0
	beq _0810F51C
	movs r0, 0x1
	b _0810F51E
	.align 2, 0
_0810F514: .4byte gSpecialVar_0x8004
_0810F518: .4byte 0x0000027a
_0810F51C:
	movs r0, 0
_0810F51E:
	pop {r1}
	bx r1
	thumb_func_end sub_810F4FC

	thumb_func_start LeadMonHasEffortRibbon
LeadMonHasEffortRibbon: @ 810F524
	push {lr}
	bl GetLeadMonIndex
	lsls r0, 24
	lsrs r0, 24
	movs r1, 0x64
	muls r0, r1
	ldr r1, _0810F548 @ =gPlayerParty
	adds r0, r1
	movs r1, 0x47
	movs r2, 0
	bl GetMonData
	lsls r0, 24
	lsrs r0, 24
	pop {r1}
	bx r1
	.align 2, 0
_0810F548: .4byte gPlayerParty
	thumb_func_end LeadMonHasEffortRibbon

	thumb_func_start GivLeadMonEffortRibbon
GivLeadMonEffortRibbon: @ 810F54C
	push {lr}
	sub sp, 0x4
	movs r0, 0x2A
	bl IncrementGameStat
	ldr r0, _0810F580 @ =0x0000083b
	bl FlagSet
	movs r1, 0x1
	mov r0, sp
	strb r1, [r0]
	bl GetLeadMonIndex
	lsls r0, 24
	lsrs r0, 24
	movs r1, 0x64
	muls r0, r1
	ldr r1, _0810F584 @ =gPlayerParty
	adds r0, r1
	movs r1, 0x47
	mov r2, sp
	bl SetMonData
	add sp, 0x4
	pop {r0}
	bx r0
	.align 2, 0
_0810F580: .4byte 0x0000083b
_0810F584: .4byte gPlayerParty
	thumb_func_end GivLeadMonEffortRibbon

	thumb_func_start GetLeadMonEVCount
GetLeadMonEVCount: @ 810F588
	push {lr}
	bl GetLeadMonIndex
	lsls r0, 24
	lsrs r0, 24
	movs r1, 0x64
	muls r0, r1
	ldr r1, _0810F5AC @ =gPlayerParty
	adds r0, r1
	bl GetMonEVCount
	lsls r0, 16
	ldr r1, _0810F5B0 @ =0x01fd0000
	cmp r0, r1
	bhi _0810F5B4
	movs r0, 0
	b _0810F5B6
	.align 2, 0
_0810F5AC: .4byte gPlayerParty
_0810F5B0: .4byte 0x01fd0000
_0810F5B4:
	movs r0, 0x1
_0810F5B6:
	pop {r1}
	bx r1
	thumb_func_end GetLeadMonEVCount

	thumb_func_start sub_810F5BC
sub_810F5BC: @ 810F5BC
	push {lr}
	movs r0, 0xC7
	bl FlagGet
	lsls r0, 24
	cmp r0, 0
	bne _0810F610
	ldr r0, _0810F5E8 @ =gSaveBlock1
	ldrh r1, [r0, 0x4]
	movs r0, 0x83
	lsls r0, 3
	cmp r1, r0
	bne _0810F610
	subs r0, 0x75
	bl FlagGet
	lsls r0, 24
	cmp r0, 0
	beq _0810F5F0
	ldr r0, _0810F5EC @ =0x0000409a
	movs r1, 0x4
	b _0810F602
	.align 2, 0
_0810F5E8: .4byte gSaveBlock1
_0810F5EC: .4byte 0x0000409a
_0810F5F0:
	movs r0, 0xE9
	lsls r0, 2
	bl FlagGet
	lsls r0, 24
	cmp r0, 0
	beq _0810F610
	ldr r0, _0810F60C @ =0x0000409a
	movs r1, 0x5
_0810F602:
	bl VarSet
	movs r0, 0x1
	b _0810F612
	.align 2, 0
_0810F60C: .4byte 0x0000409a
_0810F610:
	movs r0, 0
_0810F612:
	pop {r1}
	bx r1
	thumb_func_end sub_810F5BC

	thumb_func_start SetShoalItemFlag
SetShoalItemFlag: @ 810F618
	push {lr}
	ldr r0, _0810F624 @ =0x0000085f
	bl FlagSet
	pop {r0}
	bx r0
	.align 2, 0
_0810F624: .4byte 0x0000085f
	thumb_func_end SetShoalItemFlag

	thumb_func_start PutZigzagoonInPlayerParty
PutZigzagoonInPlayerParty: @ 810F628
	push {r4,r5,lr}
	sub sp, 0x14
	ldr r5, _0810F690 @ =gPlayerParty
	movs r1, 0x90
	lsls r1, 1
	movs r4, 0
	str r4, [sp]
	str r4, [sp, 0x4]
	str r4, [sp, 0x8]
	str r4, [sp, 0xC]
	adds r0, r5, 0
	movs r2, 0x7
	movs r3, 0x20
	bl CreateMon
	movs r1, 0x1
	add r0, sp, 0x10
	strh r1, [r0]
	adds r0, r5, 0
	movs r1, 0x2E
	add r2, sp, 0x10
	bl SetMonData
	add r1, sp, 0x10
	movs r0, 0x21
	strh r0, [r1]
	adds r0, r5, 0
	movs r1, 0xD
	add r2, sp, 0x10
	bl SetMonData
	add r0, sp, 0x10
	strh r4, [r0]
	adds r0, r5, 0
	movs r1, 0xE
	add r2, sp, 0x10
	bl SetMonData
	adds r0, r5, 0
	movs r1, 0xF
	add r2, sp, 0x10
	bl SetMonData
	adds r0, r5, 0
	movs r1, 0x10
	add r2, sp, 0x10
	bl SetMonData
	add sp, 0x14
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_0810F690: .4byte gPlayerParty
	thumb_func_end PutZigzagoonInPlayerParty

	thumb_func_start IsStarterInParty
IsStarterInParty: @ 810F694
	push {r4-r6,lr}
	ldr r0, _0810F6D0 @ =0x00004023
	bl VarGet
	lsls r0, 16
	lsrs r0, 16
	bl GetStarterPokemon
	lsls r0, 16
	lsrs r6, r0, 16
	bl CalculatePlayerPartyCount
	lsls r0, 24
	lsrs r5, r0, 24
	movs r4, 0
	cmp r4, r5
	bcs _0810F6E2
_0810F6B6:
	movs r0, 0x64
	muls r0, r4
	ldr r1, _0810F6D4 @ =gPlayerParty
	adds r0, r1
	movs r1, 0x41
	movs r2, 0
	bl GetMonData
	cmp r0, r6
	bne _0810F6D8
	movs r0, 0x1
	b _0810F6E4
	.align 2, 0
_0810F6D0: .4byte 0x00004023
_0810F6D4: .4byte gPlayerParty
_0810F6D8:
	adds r0, r4, 0x1
	lsls r0, 24
	lsrs r4, r0, 24
	cmp r4, r5
	bcc _0810F6B6
_0810F6E2:
	movs r0, 0
_0810F6E4:
	pop {r4-r6}
	pop {r1}
	bx r1
	thumb_func_end IsStarterInParty

	thumb_func_start CheckFreePokemonStorageSpace
CheckFreePokemonStorageSpace: @ 810F6EC
	push {r4-r6,lr}
	movs r5, 0
_0810F6F0:
	movs r4, 0
	lsls r1, r5, 2
	adds r1, r5
	lsls r0, r1, 4
	subs r0, r1
	lsls r6, r0, 5
_0810F6FC:
	lsls r0, r4, 2
	adds r0, r4
	lsls r0, 4
	ldr r1, _0810F718 @ =gPokemonStorage + 0x4
	adds r0, r1
	adds r0, r6, r0
	movs r1, 0xB
	movs r2, 0
	bl GetBoxMonData
	cmp r0, 0
	bne _0810F71C
	movs r0, 0x1
	b _0810F732
	.align 2, 0
_0810F718: .4byte gPokemonStorage + 0x4
_0810F71C:
	adds r0, r4, 0x1
	lsls r0, 16
	lsrs r4, r0, 16
	cmp r4, 0x1D
	bls _0810F6FC
	adds r0, r5, 0x1
	lsls r0, 16
	lsrs r5, r0, 16
	cmp r5, 0xD
	bls _0810F6F0
	movs r0, 0
_0810F732:
	pop {r4-r6}
	pop {r1}
	bx r1
	thumb_func_end CheckFreePokemonStorageSpace

	thumb_func_start IsPokerusInParty
IsPokerusInParty: @ 810F738
	push {lr}
	ldr r0, _0810F74C @ =gPlayerParty
	movs r1, 0x3F
	bl CheckPartyPokerus
	lsls r0, 24
	cmp r0, 0
	beq _0810F750
	movs r0, 0x1
	b _0810F752
	.align 2, 0
_0810F74C: .4byte gPlayerParty
_0810F750:
	movs r0, 0
_0810F752:
	pop {r1}
	bx r1
	thumb_func_end IsPokerusInParty

	thumb_func_start sub_810F758
sub_810F758: @ 810F758
	push {lr}
	ldr r0, _0810F798 @ =sub_810F7A8
	movs r1, 0x9
	bl CreateTask
	lsls r0, 24
	lsrs r0, 24
	ldr r2, _0810F79C @ =gTasks
	lsls r1, r0, 2
	adds r1, r0
	lsls r1, 3
	adds r1, r2
	ldr r0, _0810F7A0 @ =gSpecialVar_0x8005
	ldrh r2, [r0]
	movs r0, 0
	strh r2, [r1, 0x8]
	strh r0, [r1, 0xA]
	strh r0, [r1, 0xC]
	strh r0, [r1, 0xE]
	ldr r0, _0810F7A4 @ =gSpecialVar_0x8004
	ldrh r0, [r0]
	strh r0, [r1, 0x10]
	movs r0, 0x5
	strh r0, [r1, 0x12]
	movs r0, 0
	bl SetCameraPanningCallback
	movs r0, 0xD6
	bl PlaySE
	pop {r0}
	bx r0
	.align 2, 0
_0810F798: .4byte sub_810F7A8
_0810F79C: .4byte gTasks
_0810F7A0: .4byte gSpecialVar_0x8005
_0810F7A4: .4byte gSpecialVar_0x8004
	thumb_func_end sub_810F758

	thumb_func_start sub_810F7A8
sub_810F7A8: @ 810F7A8
	push {r4,r5,lr}
	lsls r0, 24
	lsrs r5, r0, 24
	lsls r0, r5, 2
	adds r0, r5
	lsls r0, 3
	ldr r1, _0810F810 @ =gTasks
	adds r4, r0, r1
	ldrh r0, [r4, 0xA]
	adds r0, 0x1
	strh r0, [r4, 0xA]
	movs r1, 0xA
	ldrsh r0, [r4, r1]
	movs r2, 0x12
	ldrsh r1, [r4, r2]
	bl __modsi3
	cmp r0, 0
	bne _0810F808
	strh r0, [r4, 0xA]
	ldrh r0, [r4, 0xC]
	adds r0, 0x1
	strh r0, [r4, 0xC]
	movs r1, 0xE
	ldrsh r0, [r4, r1]
	cmp r0, 0
	bne _0810F808
	ldrh r0, [r4, 0x8]
	negs r0, r0
	strh r0, [r4, 0x8]
	ldrh r0, [r4, 0x10]
	negs r0, r0
	strh r0, [r4, 0x10]
	movs r2, 0x8
	ldrsh r0, [r4, r2]
	movs r2, 0x10
	ldrsh r1, [r4, r2]
	bl SetCameraPanning
	movs r1, 0xC
	ldrsh r0, [r4, r1]
	cmp r0, 0x8
	bne _0810F808
	adds r0, r5, 0
	bl sub_810F814
	bl InstallCameraPanAheadCallback
_0810F808:
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_0810F810: .4byte gTasks
	thumb_func_end sub_810F7A8

	thumb_func_start sub_810F814
sub_810F814: @ 810F814
	push {lr}
	lsls r0, 24
	lsrs r0, 24
	bl DestroyTask
	bl EnableBothScriptContexts
	pop {r0}
	bx r0
	thumb_func_end sub_810F814

	thumb_func_start sub_810F828
sub_810F828: @ 810F828
	push {lr}
	movs r0, 0xAE
	lsls r0, 2
	bl FlagGet
	lsls r0, 24
	lsrs r0, 24
	pop {r1}
	bx r1
	thumb_func_end sub_810F828

	thumb_func_start SetRoute119Weather
SetRoute119Weather: @ 810F83C
	push {lr}
	bl get_map_light_from_warp0
	lsls r0, 24
	lsrs r0, 24
	bl is_light_level_1_2_3_5_or_6
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	beq _0810F858
	movs r0, 0x14
	bl SetSav1Weather
_0810F858:
	pop {r0}
	bx r0
	thumb_func_end SetRoute119Weather

	thumb_func_start SetRoute123Weather
SetRoute123Weather: @ 810F85C
	push {lr}
	bl get_map_light_from_warp0
	lsls r0, 24
	lsrs r0, 24
	bl is_light_level_1_2_3_5_or_6
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	beq _0810F878
	movs r0, 0x15
	bl SetSav1Weather
_0810F878:
	pop {r0}
	bx r0
	thumb_func_end SetRoute123Weather

	thumb_func_start GetLeadMonIndex
GetLeadMonIndex: @ 810F87C
	push {r4-r6,lr}
	bl CalculatePlayerPartyCount
	lsls r0, 24
	lsrs r6, r0, 24
	movs r5, 0
	cmp r5, r6
	bcs _0810F8CA
_0810F88C:
	movs r0, 0x64
	adds r1, r5, 0
	muls r1, r0
	ldr r0, _0810F8BC @ =gPlayerParty
	adds r4, r1, r0
	adds r0, r4, 0
	movs r1, 0x41
	movs r2, 0
	bl GetMonData
	movs r1, 0xCE
	lsls r1, 1
	cmp r0, r1
	beq _0810F8C0
	adds r0, r4, 0
	movs r1, 0x41
	movs r2, 0
	bl GetMonData
	cmp r0, 0
	beq _0810F8C0
	adds r0, r5, 0
	b _0810F8CC
	.align 2, 0
_0810F8BC: .4byte gPlayerParty
_0810F8C0:
	adds r0, r5, 0x1
	lsls r0, 24
	lsrs r5, r0, 24
	cmp r5, r6
	bcc _0810F88C
_0810F8CA:
	movs r0, 0
_0810F8CC:
	pop {r4-r6}
	pop {r1}
	bx r1
	thumb_func_end GetLeadMonIndex

	thumb_func_start ScriptGetPartyMonSpecies
ScriptGetPartyMonSpecies: @ 810F8D4
	push {lr}
	ldr r0, _0810F8F4 @ =gSpecialVar_0x8004
	ldrh r1, [r0]
	movs r0, 0x64
	muls r0, r1
	ldr r1, _0810F8F8 @ =gPlayerParty
	adds r0, r1
	movs r1, 0x41
	movs r2, 0
	bl GetMonData
	lsls r0, 16
	lsrs r0, 16
	pop {r1}
	bx r1
	.align 2, 0
_0810F8F4: .4byte gSpecialVar_0x8004
_0810F8F8: .4byte gPlayerParty
	thumb_func_end ScriptGetPartyMonSpecies

	thumb_func_start sub_810F8FC
sub_810F8FC: @ 810F8FC
	push {lr}
	movs r0, 0x6
	bl sub_805ADDC
	pop {r0}
	bx r0
	thumb_func_end sub_810F8FC

	thumb_func_start sub_810F908
sub_810F908: @ 810F908
	push {r4,lr}
	ldr r0, _0810F928 @ =0x000040c2
	bl VarGet
	lsls r0, 16
	lsrs r0, 16
	adds r3, r0, 0
	ldr r2, _0810F92C @ =gLocalTime
	movs r1, 0
	ldrsh r0, [r2, r1]
	subs r0, r3
	cmp r0, 0x6
	ble _0810F930
	movs r0, 0
	b _0810F948
	.align 2, 0
_0810F928: .4byte 0x000040c2
_0810F92C: .4byte gLocalTime
_0810F930:
	ldrh r1, [r2]
	movs r4, 0
	ldrsh r0, [r2, r4]
	cmp r0, 0
	blt _0810F946
	subs r1, r3
	movs r0, 0x7
	subs r0, r1
	lsls r0, 16
	lsrs r0, 16
	b _0810F948
_0810F946:
	movs r0, 0x8
_0810F948:
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end sub_810F908

	thumb_func_start sub_810F950
sub_810F950: @ 810F950
	push {r4,lr}
	ldr r0, _0810F964 @ =0x000040c2
	ldr r4, _0810F968 @ =gLocalTime
	ldrh r1, [r4]
	bl VarSet
	ldrh r0, [r4]
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_0810F964: .4byte 0x000040c2
_0810F968: .4byte gLocalTime
	thumb_func_end sub_810F950

	thumb_func_start sub_810F96C
sub_810F96C: @ 810F96C
	push {r4,lr}
	ldr r0, _0810F994 @ =gSpecialVar_0x8004
	ldrh r1, [r0]
	movs r0, 0x64
	muls r0, r1
	ldr r1, _0810F998 @ =gPlayerParty
	adds r0, r1
	ldr r4, _0810F99C @ =gStringVar1
	movs r1, 0x7
	adds r2, r4, 0
	bl GetMonData
	ldr r0, _0810F9A0 @ =gSaveBlock2
	adds r1, r4, 0
	bl StringCompareWithoutExtCtrlCodes
	cmp r0, 0
	beq _0810F9A4
	movs r0, 0x1
	b _0810F9A6
	.align 2, 0
_0810F994: .4byte gSpecialVar_0x8004
_0810F998: .4byte gPlayerParty
_0810F99C: .4byte gStringVar1
_0810F9A0: .4byte gSaveBlock2
_0810F9A4:
	movs r0, 0
_0810F9A6:
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end sub_810F96C

	thumb_func_start sub_810F9AC
sub_810F9AC: @ 810F9AC
	push {r4,r5,lr}
	ldr r2, _0810F9C0 @ =gScriptResult
	ldrh r1, [r2]
	ldr r0, _0810F9C4 @ =0x0000270f
	cmp r1, r0
	bls _0810F9C8
	movs r0, 0
	bl sub_80BF088
	b _0810FA4A
	.align 2, 0
_0810F9C0: .4byte gScriptResult
_0810F9C4: .4byte 0x0000270f
_0810F9C8:
	ldr r0, _0810F9D8 @ =0x000003e7
	cmp r1, r0
	bls _0810F9E0
	ldr r4, _0810F9DC @ =gStringVar1
	movs r0, 0xA1
	strb r0, [r4]
	adds r4, 0x1
	b _0810FA04
	.align 2, 0
_0810F9D8: .4byte 0x000003e7
_0810F9DC: .4byte gStringVar1
_0810F9E0:
	cmp r1, 0x63
	bls _0810F9F4
	ldr r4, _0810F9F0 @ =gStringVar1
	movs r0, 0xA1
	strb r0, [r4]
	strb r0, [r4, 0x1]
	adds r4, 0x2
	b _0810FA04
	.align 2, 0
_0810F9F0: .4byte gStringVar1
_0810F9F4:
	cmp r1, 0x9
	bls _0810FA24
	ldr r4, _0810FA20 @ =gStringVar1
	movs r0, 0xA1
	strb r0, [r4]
	strb r0, [r4, 0x1]
	strb r0, [r4, 0x2]
	adds r4, 0x3
_0810FA04:
	ldrh r5, [r2]
	adds r0, r5, 0
	bl sub_80BF0B8
	adds r3, r0, 0
	lsls r3, 24
	lsrs r3, 24
	adds r0, r4, 0
	adds r1, r5, 0
	movs r2, 0
	bl ConvertIntToDecimalStringN
	b _0810FA4A
	.align 2, 0
_0810FA20: .4byte gStringVar1
_0810FA24:
	ldr r4, _0810FA50 @ =gStringVar1
	movs r0, 0xA1
	strb r0, [r4]
	strb r0, [r4, 0x1]
	strb r0, [r4, 0x2]
	strb r0, [r4, 0x3]
	adds r4, 0x4
	ldrh r5, [r2]
	adds r0, r5, 0
	bl sub_80BF0B8
	adds r3, r0, 0
	lsls r3, 24
	lsrs r3, 24
	adds r0, r4, 0
	adds r1, r5, 0
	movs r2, 0
	bl ConvertIntToDecimalStringN
_0810FA4A:
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_0810FA50: .4byte gStringVar1
	thumb_func_end sub_810F9AC

	thumb_func_start ResetFanClub
ResetFanClub: @ 810FA54
	ldr r0, _0810FA68 @ =gSaveBlock1
	ldr r2, _0810FA6C @ =0x000013c2
	adds r1, r0, r2
	movs r2, 0
	strh r2, [r1]
	ldr r1, _0810FA70 @ =0x000013c4
	adds r0, r1
	strh r2, [r0]
	bx lr
	.align 2, 0
_0810FA68: .4byte gSaveBlock1
_0810FA6C: .4byte 0x000013c2
_0810FA70: .4byte 0x000013c4
	thumb_func_end ResetFanClub

	thumb_func_start sub_810FA74
sub_810FA74: @ 810FA74
	push {lr}
	bl sub_810FF30
	lsls r0, 24
	cmp r0, 0
	beq _0810FA90
	bl sub_810FCE8
	ldr r0, _0810FA94 @ =gSaveBlock1
	ldr r1, _0810FA98 @ =gSaveBlock2
	ldrh r1, [r1, 0xE]
	ldr r2, _0810FA9C @ =0x000013c4
	adds r0, r2
	strh r1, [r0]
_0810FA90:
	pop {r0}
	bx r0
	.align 2, 0
_0810FA94: .4byte gSaveBlock1
_0810FA98: .4byte gSaveBlock2
_0810FA9C: .4byte 0x000013c4
	thumb_func_end sub_810FA74

	thumb_func_start sub_810FAA0
sub_810FAA0: @ 810FAA0
	push {r4,lr}
	ldr r4, _0810FAF0 @ =gSaveBlock1
	ldr r1, _0810FAF4 @ =0x000013c2
	adds r0, r4, r1
	ldrh r0, [r0]
	lsrs r0, 7
	movs r1, 0x1
	ands r0, r1
	cmp r0, 0
	bne _0810FAE8
	bl sub_810FF48
	bl sub_810FD80
	ldr r0, _0810FAF8 @ =gSaveBlock2
	ldrh r1, [r0, 0xE]
	ldr r2, _0810FAFC @ =0x000013c4
	adds r0, r4, r2
	strh r1, [r0]
	ldr r0, _0810FB00 @ =0x00000315
	bl FlagReset
	ldr r0, _0810FB04 @ =0x00000316
	bl FlagReset
	ldr r0, _0810FB08 @ =0x00000317
	bl FlagReset
	movs r0, 0xC6
	lsls r0, 2
	bl FlagReset
	ldr r0, _0810FB0C @ =0x00004095
	movs r1, 0x1
	bl VarSet
_0810FAE8:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0810FAF0: .4byte gSaveBlock1
_0810FAF4: .4byte 0x000013c2
_0810FAF8: .4byte gSaveBlock2
_0810FAFC: .4byte 0x000013c4
_0810FB00: .4byte 0x00000315
_0810FB04: .4byte 0x00000316
_0810FB08: .4byte 0x00000317
_0810FB0C: .4byte 0x00004095
	thumb_func_end sub_810FAA0

	thumb_func_start sub_810FB10
sub_810FB10: @ 810FB10
	push {r4,r5,lr}
	lsls r0, 24
	lsrs r5, r0, 24
	ldr r0, _0810FB54 @ =0x00004095
	bl VarGet
	lsls r0, 16
	lsrs r0, 16
	cmp r0, 0x2
	bne _0810FB80
	ldr r0, _0810FB58 @ =gSaveBlock1
	ldr r1, _0810FB5C @ =0x000013c2
	adds r4, r0, r1
	ldrh r2, [r4]
	movs r1, 0x7F
	ands r1, r2
	ldr r0, _0810FB60 @ =gUnknown_083F8404
	adds r0, r5, r0
	ldrb r0, [r0]
	adds r1, r0
	cmp r1, 0x13
	ble _0810FB7C
	bl sub_810FCB0
	lsls r0, 16
	lsrs r0, 16
	cmp r0, 0x2
	bhi _0810FB68
	bl sub_810FB9C
	ldrh r1, [r4]
	ldr r0, _0810FB64 @ =0x0000ff80
	ands r0, r1
	b _0810FB7E
	.align 2, 0
_0810FB54: .4byte 0x00004095
_0810FB58: .4byte gSaveBlock1
_0810FB5C: .4byte 0x000013c2
_0810FB60: .4byte gUnknown_083F8404
_0810FB64: .4byte 0x0000ff80
_0810FB68:
	ldrh r0, [r4]
	ldr r1, _0810FB78 @ =0x0000ff80
	ands r1, r0
	movs r0, 0x14
	orrs r1, r0
	strh r1, [r4]
	b _0810FB80
	.align 2, 0
_0810FB78: .4byte 0x0000ff80
_0810FB7C:
	adds r0, r2, r0
_0810FB7E:
	strh r0, [r4]
_0810FB80:
	ldr r0, _0810FB94 @ =gSaveBlock1
	ldr r1, _0810FB98 @ =0x000013c2
	adds r0, r1
	ldrb r1, [r0]
	movs r0, 0x7F
	ands r0, r1
	pop {r4,r5}
	pop {r1}
	bx r1
	.align 2, 0
_0810FB94: .4byte gSaveBlock1
_0810FB98: .4byte 0x000013c2
	thumb_func_end sub_810FB10

	thumb_func_start sub_810FB9C
sub_810FB9C: @ 810FB9C
	push {r4-r7,lr}
	sub sp, 0x4
	movs r3, 0
	movs r5, 0
	ldr r7, _0810FBD8 @ =gSaveBlock1 + 0x13C2
	movs r6, 0x1
_0810FBA8:
	ldrh r1, [r7]
	ldr r0, _0810FBDC @ =gUnknown_083F8408
	adds r0, r5, r0
	ldrb r4, [r0]
	asrs r1, r4
	ands r1, r6
	cmp r1, 0
	bne _0810FBE0
	adds r3, r5, 0
	str r3, [sp]
	bl Random
	adds r1, r6, 0
	ands r1, r0
	ldr r3, [sp]
	cmp r1, 0
	beq _0810FBE0
	adds r0, r6, 0
	lsls r0, r4
	ldrh r1, [r7]
	orrs r0, r1
	strh r0, [r7]
	b _0810FC00
	.align 2, 0
_0810FBD8: .4byte gSaveBlock1 + 0x13C2
_0810FBDC: .4byte gUnknown_083F8408
_0810FBE0:
	adds r0, r5, 0x1
	lsls r0, 24
	lsrs r5, r0, 24
	cmp r5, 0x7
	bls _0810FBA8
	ldr r2, _0810FC0C @ =gSaveBlock1
	ldr r0, _0810FC10 @ =0x000013c2
	adds r2, r0
	ldr r1, _0810FC14 @ =gUnknown_083F8408
	adds r1, r3, r1
	movs r0, 0x1
	ldrb r1, [r1]
	lsls r0, r1
	ldrh r1, [r2]
	orrs r0, r1
	strh r0, [r2]
_0810FC00:
	adds r0, r3, 0
	add sp, 0x4
	pop {r4-r7}
	pop {r1}
	bx r1
	.align 2, 0
_0810FC0C: .4byte gSaveBlock1
_0810FC10: .4byte 0x000013c2
_0810FC14: .4byte gUnknown_083F8408
	thumb_func_end sub_810FB9C

	thumb_func_start sub_810FC18
sub_810FC18: @ 810FC18
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	sub sp, 0x4
	movs r0, 0
	mov r8, r0
	bl sub_810FCB0
	lsls r0, 16
	lsrs r0, 16
	cmp r0, 0x1
	bne _0810FC3E
	movs r0, 0
	b _0810FC94
_0810FC34:
	lsls r4, r6
	ldrh r0, [r2]
	eors r4, r0
	strh r4, [r2]
	b _0810FC92
_0810FC3E:
	movs r5, 0
	ldr r2, _0810FCA0 @ =gSaveBlock1 + 0x13C2
	movs r4, 0x1
_0810FC44:
	ldrh r1, [r2]
	ldr r7, _0810FCA4 @ =gUnknown_083F8410
	adds r0, r5, r7
	ldrb r6, [r0]
	asrs r1, r6
	ands r1, r4
	cmp r1, 0
	beq _0810FC66
	mov r8, r5
	str r2, [sp]
	bl Random
	adds r1, r4, 0
	ands r1, r0
	ldr r2, [sp]
	cmp r1, 0
	bne _0810FC34
_0810FC66:
	adds r0, r5, 0x1
	lsls r0, 24
	lsrs r5, r0, 24
	cmp r5, 0x7
	bls _0810FC44
	ldr r0, _0810FCA8 @ =gSaveBlock1
	ldr r1, _0810FCAC @ =0x000013c2
	adds r4, r0, r1
	ldrh r1, [r4]
	mov r2, r8
	adds r0, r2, r7
	ldrb r2, [r0]
	adds r0, r1, 0
	asrs r0, r2
	movs r3, 0x1
	ands r0, r3
	cmp r0, 0
	beq _0810FC92
	adds r0, r3, 0
	lsls r0, r2
	eors r1, r0
	strh r1, [r4]
_0810FC92:
	mov r0, r8
_0810FC94:
	add sp, 0x4
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r1}
	bx r1
	.align 2, 0
_0810FCA0: .4byte gSaveBlock1 + 0x13C2
_0810FCA4: .4byte gUnknown_083F8410
_0810FCA8: .4byte gSaveBlock1
_0810FCAC: .4byte 0x000013c2
	thumb_func_end sub_810FC18

	thumb_func_start sub_810FCB0
sub_810FCB0: @ 810FCB0
	push {r4,r5,lr}
	movs r3, 0
	movs r2, 0
	ldr r0, _0810FCE4 @ =gSaveBlock1 + 0x13C2
	ldrh r4, [r0]
	movs r5, 0x1
_0810FCBC:
	adds r1, r2, 0
	adds r1, 0x8
	adds r0, r4, 0
	asrs r0, r1
	ands r0, r5
	cmp r0, 0
	beq _0810FCD0
	adds r0, r3, 0x1
	lsls r0, 24
	lsrs r3, r0, 24
_0810FCD0:
	adds r0, r2, 0x1
	lsls r0, 24
	lsrs r2, r0, 24
	cmp r2, 0x7
	bls _0810FCBC
	adds r0, r3, 0
	pop {r4,r5}
	pop {r1}
	bx r1
	.align 2, 0
_0810FCE4: .4byte gSaveBlock1 + 0x13C2
	thumb_func_end sub_810FCB0

	thumb_func_start sub_810FCE8
sub_810FCE8: @ 810FCE8
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	movs r5, 0
	ldr r2, _0810FD08 @ =gSaveBlock2
	ldrh r1, [r2, 0xE]
	ldr r0, _0810FD0C @ =0x000003e6
	cmp r1, r0
	bhi _0810FD54
	ldr r7, _0810FD10 @ =gSaveBlock1
	adds r6, r2, 0
	ldr r0, _0810FD14 @ =0x000013c4
	adds r0, r7
	mov r8, r0
	b _0810FD36
	.align 2, 0
_0810FD08: .4byte gSaveBlock2
_0810FD0C: .4byte 0x000003e6
_0810FD10: .4byte gSaveBlock1
_0810FD14: .4byte 0x000013c4
_0810FD18:
	ldrh r1, [r6, 0xE]
	ldr r0, _0810FD4C @ =0x000013c4
	adds r4, r7, r0
	ldrh r0, [r4]
	subs r1, r0
	cmp r1, 0xB
	ble _0810FD54
	bl sub_810FC18
	ldrh r0, [r4]
	adds r0, 0xC
	strh r0, [r4]
	adds r0, r5, 0x1
	lsls r0, 24
	lsrs r5, r0, 24
_0810FD36:
	bl sub_810FCB0
	lsls r0, 16
	lsrs r0, 16
	cmp r0, 0x4
	bhi _0810FD50
	ldrh r0, [r6, 0xE]
	mov r1, r8
	strh r0, [r1]
	b _0810FD54
	.align 2, 0
_0810FD4C: .4byte 0x000013c4
_0810FD50:
	cmp r5, 0x8
	bne _0810FD18
_0810FD54:
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r0}
	bx r0
	thumb_func_end sub_810FCE8

	thumb_func_start sub_810FD60
sub_810FD60: @ 810FD60
	ldr r0, _0810FD74 @ =gSaveBlock1
	ldr r1, _0810FD78 @ =0x000013c2
	adds r0, r1
	ldrh r0, [r0]
	ldr r1, _0810FD7C @ =gSpecialVar_0x8004
	ldrh r1, [r1]
	asrs r0, r1
	movs r1, 0x1
	ands r0, r1
	bx lr
	.align 2, 0
_0810FD74: .4byte gSaveBlock1
_0810FD78: .4byte 0x000013c2
_0810FD7C: .4byte gSpecialVar_0x8004
	thumb_func_end sub_810FD60

	thumb_func_start sub_810FD80
sub_810FD80: @ 810FD80
	ldr r2, _0810FDA4 @ =gSaveBlock1
	ldr r0, _0810FDA8 @ =0x000013c2
	adds r2, r0
	ldrh r1, [r2]
	movs r3, 0x80
	lsls r3, 6
	adds r0, r3, 0
	orrs r0, r1
	movs r3, 0x80
	lsls r3, 1
	adds r1, r3, 0
	orrs r0, r1
	movs r3, 0x80
	lsls r3, 3
	adds r1, r3, 0
	orrs r0, r1
	strh r0, [r2]
	bx lr
	.align 2, 0
_0810FDA4: .4byte gSaveBlock1
_0810FDA8: .4byte 0x000013c2
	thumb_func_end sub_810FD80

	thumb_func_start sub_810FDAC
sub_810FDAC: @ 810FDAC
	push {lr}
	movs r3, 0
	movs r2, 0
	ldr r0, _0810FDC8 @ =gSpecialVar_0x8004
	ldrh r0, [r0]
	subs r0, 0x8
	cmp r0, 0x7
	bhi _0810FE0C
	lsls r0, 2
	ldr r1, _0810FDCC @ =_0810FDD0
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_0810FDC8: .4byte gSpecialVar_0x8004
_0810FDCC: .4byte _0810FDD0
	.align 2, 0
_0810FDD0:
	.4byte _0810FE0C
	.4byte _0810FE0C
	.4byte _0810FDF0
	.4byte _0810FDF6
	.4byte _0810FDFC
	.4byte _0810FE02
	.4byte _0810FE08
	.4byte _0810FE0C
_0810FDF0:
	movs r3, 0
	movs r2, 0x3
	b _0810FE0C
_0810FDF6:
	movs r3, 0
	movs r2, 0x1
	b _0810FE0C
_0810FDFC:
	movs r3, 0x1
	movs r2, 0
	b _0810FE0C
_0810FE02:
	movs r3, 0
	movs r2, 0x4
	b _0810FE0C
_0810FE08:
	movs r3, 0x1
	movs r2, 0x5
_0810FE0C:
	ldr r0, _0810FE18 @ =gSaveBlock1 + 0x30B8
	adds r1, r3, 0
	bl sub_810FE1C
	pop {r0}
	bx r0
	.align 2, 0
_0810FE18: .4byte gSaveBlock1 + 0x30B8
	thumb_func_end sub_810FDAC

	thumb_func_start sub_810FE1C
sub_810FE1C: @ 810FE1C
	push {r4,lr}
	lsls r1, 24
	lsls r2, 24
	lsrs r2, 24
	lsrs r1, 20
	adds r1, r0, r1
	ldrb r0, [r1]
	cmp r0, 0xFF
	bne _0810FED0
	cmp r2, 0x5
	bhi _0810FEBC
	lsls r0, r2, 2
	ldr r1, _0810FE3C @ =_0810FE40
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_0810FE3C: .4byte _0810FE40
	.align 2, 0
_0810FE40:
	.4byte _0810FEBC
	.4byte _0810FE58
	.4byte _0810FE6C
	.4byte _0810FE80
	.4byte _0810FE94
	.4byte _0810FEA8
_0810FE58:
	ldr r0, _0810FE64 @ =gStringVar1
	ldr r1, _0810FE68 @ =gOtherText_Steven
	bl StringCopy
	b _0810FEF2
	.align 2, 0
_0810FE64: .4byte gStringVar1
_0810FE68: .4byte gOtherText_Steven
_0810FE6C:
	ldr r0, _0810FE78 @ =gStringVar1
	ldr r1, _0810FE7C @ =gOtherText_Brawly
	bl StringCopy
	b _0810FEF2
	.align 2, 0
_0810FE78: .4byte gStringVar1
_0810FE7C: .4byte gOtherText_Brawly
_0810FE80:
	ldr r0, _0810FE8C @ =gStringVar1
	ldr r1, _0810FE90 @ =gOtherText_Winona
	bl StringCopy
	b _0810FEF2
	.align 2, 0
_0810FE8C: .4byte gStringVar1
_0810FE90: .4byte gOtherText_Winona
_0810FE94:
	ldr r0, _0810FEA0 @ =gStringVar1
	ldr r1, _0810FEA4 @ =gOtherText_Phoebe
	bl StringCopy
	b _0810FEF2
	.align 2, 0
_0810FEA0: .4byte gStringVar1
_0810FEA4: .4byte gOtherText_Phoebe
_0810FEA8:
	ldr r0, _0810FEB4 @ =gStringVar1
	ldr r1, _0810FEB8 @ =gOtherText_Glacia
	bl StringCopy
	b _0810FEF2
	.align 2, 0
_0810FEB4: .4byte gStringVar1
_0810FEB8: .4byte gOtherText_Glacia
_0810FEBC:
	ldr r0, _0810FEC8 @ =gStringVar1
	ldr r1, _0810FECC @ =gOtherText_Wallace
	bl StringCopy
	b _0810FEF2
	.align 2, 0
_0810FEC8: .4byte gStringVar1
_0810FECC: .4byte gOtherText_Wallace
_0810FED0:
	ldr r4, _0810FEF8 @ =gStringVar1
	adds r0, r4, 0
	movs r2, 0x7
	bl StringCopyN
	movs r0, 0xFF
	strb r0, [r4, 0x7]
	ldrb r0, [r4]
	cmp r0, 0xFC
	bne _0810FEF2
	ldrb r0, [r4, 0x1]
	cmp r0, 0x15
	bne _0810FEF2
	adds r0, r4, 0
	movs r1, 0x1
	bl ConvertInternationalString
_0810FEF2:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0810FEF8: .4byte gStringVar1
	thumb_func_end sub_810FE1C

	thumb_func_start sub_810FEFC
sub_810FEFC: @ 810FEFC
	push {lr}
	ldr r0, _0810FF20 @ =0x00004095
	bl VarGet
	lsls r0, 16
	lsrs r0, 16
	cmp r0, 0x2
	bne _0810FF2C
	bl sub_810FA74
	ldr r0, _0810FF24 @ =gUnknown_02024D26
	ldrb r0, [r0]
	cmp r0, 0x1
	bne _0810FF28
	bl sub_810FB9C
	b _0810FF2C
	.align 2, 0
_0810FF20: .4byte 0x00004095
_0810FF24: .4byte gUnknown_02024D26
_0810FF28:
	bl sub_810FC18
_0810FF2C:
	pop {r0}
	bx r0
	thumb_func_end sub_810FEFC

	thumb_func_start sub_810FF30
sub_810FF30: @ 810FF30
	ldr r0, _0810FF40 @ =gSaveBlock1
	ldr r1, _0810FF44 @ =0x000013c2
	adds r0, r1
	ldrh r0, [r0]
	lsrs r0, 7
	movs r1, 0x1
	ands r0, r1
	bx lr
	.align 2, 0
_0810FF40: .4byte gSaveBlock1
_0810FF44: .4byte 0x000013c2
	thumb_func_end sub_810FF30

	thumb_func_start sub_810FF48
sub_810FF48: @ 810FF48
	ldr r0, _0810FF58 @ =gSaveBlock1
	ldr r1, _0810FF5C @ =0x000013c2
	adds r0, r1
	ldrh r2, [r0]
	movs r1, 0x80
	orrs r1, r2
	strh r1, [r0]
	bx lr
	.align 2, 0
_0810FF58: .4byte gSaveBlock1
_0810FF5C: .4byte 0x000013c2
	thumb_func_end sub_810FF48

	thumb_func_start sub_810FF60
sub_810FF60: @ 810FF60
	push {lr}
	ldr r0, _0810FF74 @ =gSpecialVar_0x8004
	ldrb r0, [r0]
	bl sub_810FB10
	lsls r0, 24
	lsrs r0, 24
	pop {r1}
	bx r1
	.align 2, 0
_0810FF74: .4byte gSpecialVar_0x8004
	thumb_func_end sub_810FF60

	.align 2, 0 @ Don't pad with nop.
