	.include "constants/gba_constants.inc"
	.include "constants/species_constants.inc"
	.include "asm/macros.inc"

	.syntax unified

	.text

	thumb_func_start sub_80C4BF0
sub_80C4BF0: @ 80C4BF0
	push {r4,lr}
	ldr r2, _080C4C1C @ =gSaveBlock1
	ldr r1, _080C4C20 @ =gContestMons
	ldrb r3, [r1, 0x15]
	movs r4, 0x9B
	lsls r4, 5
	adds r0, r2, r4
	strh r3, [r0]
	adds r0, r1, 0
	adds r0, 0x55
	ldrb r3, [r0]
	adds r4, 0x2
	adds r0, r2, r4
	strh r3, [r0]
	adds r1, 0x95
	ldrb r0, [r1]
	ldr r1, _080C4C24 @ =0x00001364
	adds r2, r1
	strh r0, [r2]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080C4C1C: .4byte gSaveBlock1
_080C4C20: .4byte gContestMons
_080C4C24: .4byte 0x00001364
	thumb_func_end sub_80C4BF0

	thumb_func_start sub_80C4C28
sub_80C4C28: @ 80C4C28
	push {lr}
	ldr r0, _080C4C40 @ =gSpecialVar_0x8005
	ldrb r0, [r0]
	adds r1, r0, 0
	cmp r0, 0x1
	beq _080C4C4E
	cmp r0, 0x1
	bgt _080C4C44
	cmp r0, 0
	beq _080C4C4A
	b _080C4C56
	.align 2, 0
_080C4C40: .4byte gSpecialVar_0x8005
_080C4C44:
	cmp r1, 0x2
	beq _080C4C52
	b _080C4C56
_080C4C4A:
	movs r1, 0x3
	b _080C4C58
_080C4C4E:
	movs r1, 0x4
	b _080C4C58
_080C4C52:
	movs r1, 0x5
	b _080C4C58
_080C4C56:
	movs r1, 0x64
_080C4C58:
	ldr r0, _080C4C60 @ =gSpecialVar_0x8004
	strh r1, [r0]
	pop {r0}
	bx r0
	.align 2, 0
_080C4C60: .4byte gSpecialVar_0x8004
	thumb_func_end sub_80C4C28

	thumb_func_start sub_80C4C64
sub_80C4C64: @ 80C4C64
	push {lr}
	bl sub_80C46EC
	bl sub_80C4740
	bl sub_80C48F4
	pop {r0}
	bx r0
	thumb_func_end sub_80C4C64

	thumb_func_start sub_80C4C78
sub_80C4C78: @ 80C4C78
	push {lr}
	ldr r0, _080C4C8C @ =gScriptContestCategory
	ldrh r0, [r0]
	cmp r0, 0x4
	bhi _080C4CB8
	lsls r0, 2
	ldr r1, _080C4C90 @ =_080C4C94
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_080C4C8C: .4byte gScriptContestCategory
_080C4C90: .4byte _080C4C94
	.align 2, 0
_080C4C94:
	.4byte _080C4CA8
	.4byte _080C4CAC
	.4byte _080C4CB0
	.4byte _080C4CB4
	.4byte _080C4CB8
_080C4CA8:
	movs r0, 0x8
	b _080C4CBA
_080C4CAC:
	movs r0, 0x9
	b _080C4CBA
_080C4CB0:
	movs r0, 0xA
	b _080C4CBA
_080C4CB4:
	movs r0, 0xB
	b _080C4CBA
_080C4CB8:
	movs r0, 0xC
_080C4CBA:
	ldr r1, _080C4CD0 @ =gSaveBlock1
	lsls r0, 5
	adds r0, r1
	ldr r1, _080C4CD4 @ =0x00002e04
	adds r0, r1
	ldrh r1, [r0]
	cmp r1, 0
	bne _080C4CDC
	ldr r0, _080C4CD8 @ =gSpecialVar_0x8004
	strh r1, [r0]
	b _080C4CE2
	.align 2, 0
_080C4CD0: .4byte gSaveBlock1
_080C4CD4: .4byte 0x00002e04
_080C4CD8: .4byte gSpecialVar_0x8004
_080C4CDC:
	ldr r1, _080C4CE8 @ =gSpecialVar_0x8004
	movs r0, 0x1
	strh r0, [r1]
_080C4CE2:
	pop {r0}
	bx r0
	.align 2, 0
_080C4CE8: .4byte gSpecialVar_0x8004
	thumb_func_end sub_80C4C78

	thumb_func_start sub_80C4CEC
sub_80C4CEC: @ 80C4CEC
	push {lr}
	movs r0, 0xFF
	bl sub_80B2A7C
	pop {r0}
	bx r0
	thumb_func_end sub_80C4CEC

	thumb_func_start sub_80C4CF8
sub_80C4CF8: @ 80C4CF8
	push {lr}
	ldr r0, _080C4D28 @ =gUnknown_02038690
	ldr r1, _080C4D2C @ =gContestPlayerMonIndex
	ldrb r2, [r1]
	adds r0, r2, r0
	ldrb r0, [r0]
	cmp r0, 0
	bne _080C4D40
	ldr r0, _080C4D30 @ =gScriptContestRank
	ldrh r0, [r0]
	cmp r0, 0x3
	bne _080C4D40
	ldr r1, _080C4D34 @ =gUnknown_02038678
	lsls r0, r2, 1
	adds r0, r1
	movs r2, 0
	ldrsh r1, [r0, r2]
	ldr r0, _080C4D38 @ =0x0000031f
	cmp r1, r0
	ble _080C4D40
	ldr r1, _080C4D3C @ =gSpecialVar_0x8004
	movs r0, 0x1
	b _080C4D44
	.align 2, 0
_080C4D28: .4byte gUnknown_02038690
_080C4D2C: .4byte gContestPlayerMonIndex
_080C4D30: .4byte gScriptContestRank
_080C4D34: .4byte gUnknown_02038678
_080C4D38: .4byte 0x0000031f
_080C4D3C: .4byte gSpecialVar_0x8004
_080C4D40:
	ldr r1, _080C4D4C @ =gSpecialVar_0x8004
	movs r0, 0
_080C4D44:
	strh r0, [r1]
	pop {r0}
	bx r0
	.align 2, 0
_080C4D4C: .4byte gSpecialVar_0x8004
	thumb_func_end sub_80C4CF8

	thumb_func_start sub_80C4D50
sub_80C4D50: @ 80C4D50
	push {lr}
	movs r3, 0
	ldr r0, _080C4D78 @ =gSaveBlock1
	ldr r1, _080C4D7C @ =0x00002f04
	adds r2, r0, r1
	movs r1, 0x4
_080C4D5C:
	ldrh r0, [r2]
	cmp r0, 0
	beq _080C4D68
	adds r0, r3, 0x1
	lsls r0, 24
	lsrs r3, r0, 24
_080C4D68:
	adds r2, 0x20
	subs r1, 0x1
	cmp r1, 0
	bge _080C4D5C
	adds r0, r3, 0
	pop {r1}
	bx r1
	.align 2, 0
_080C4D78: .4byte gSaveBlock1
_080C4D7C: .4byte 0x00002f04
	thumb_func_end sub_80C4D50

	thumb_func_start sub_80C4D80
sub_80C4D80: @ 80C4D80
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	sub sp, 0x8
	ldr r0, _080C4EA0 @ =gUnknown_02038670
	mov r12, r0
	ldr r1, _080C4EA4 @ =gSpecialVar_0x8006
	mov r8, r1
	ldr r2, _080C4EA8 @ =gStringVar1
	mov r9, r2
	mov r2, r12
	mov r1, sp
	movs r6, 0x3
_080C4D9E:
	ldrh r0, [r2]
	strh r0, [r1]
	adds r2, 0x2
	adds r1, 0x2
	subs r6, 0x1
	cmp r6, 0
	bge _080C4D9E
	movs r6, 0
_080C4DAE:
	movs r1, 0x3
	cmp r1, r6
	ble _080C4DD8
_080C4DB4:
	subs r4, r1, 0x1
	lsls r0, r4, 1
	mov r5, sp
	adds r3, r5, r0
	lsls r0, r1, 1
	adds r2, r5, r0
	ldrh r5, [r3]
	movs r7, 0
	ldrsh r1, [r3, r7]
	movs r7, 0
	ldrsh r0, [r2, r7]
	cmp r1, r0
	bge _080C4DD2
	strh r5, [r2]
	strh r0, [r3]
_080C4DD2:
	adds r1, r4, 0
	cmp r1, r6
	bgt _080C4DB4
_080C4DD8:
	adds r6, 0x1
	cmp r6, 0x2
	ble _080C4DAE
	mov r2, r8
	ldrh r0, [r2]
	lsls r0, 1
	add r0, sp
	ldrh r0, [r0]
	movs r2, 0
	movs r7, 0
	movs r6, 0
	lsls r0, 16
	asrs r4, r0, 16
	adds r3, r0, 0
	mov r1, sp
_080C4DF6:
	movs r5, 0
	ldrsh r0, [r1, r5]
	cmp r0, r4
	bne _080C4E12
	lsls r0, r2, 24
	movs r2, 0x80
	lsls r2, 17
	adds r0, r2
	lsrs r2, r0, 24
	mov r5, r8
	ldrh r5, [r5]
	cmp r6, r5
	bne _080C4E12
	adds r7, r2, 0
_080C4E12:
	adds r1, 0x2
	adds r6, 0x1
	cmp r6, 0x3
	ble _080C4DF6
	movs r6, 0
	mov r0, sp
	movs r1, 0
	ldrsh r0, [r0, r1]
	asrs r1, r3, 16
	lsls r2, 24
	mov r10, r2
	cmp r0, r1
	beq _080C4E40
	adds r2, r1, 0
	mov r1, sp
_080C4E30:
	adds r1, 0x2
	adds r6, 0x1
	cmp r6, 0x3
	bgt _080C4E40
	movs r4, 0
	ldrsh r0, [r1, r4]
	cmp r0, r2
	bne _080C4E30
_080C4E40:
	lsls r0, r6, 24
	lsrs r4, r0, 24
	adds r2, r7, 0
	movs r6, 0
	asrs r5, r3, 16
	mov r8, r5
	mov r1, r12
	movs r5, 0
	ldrsh r0, [r1, r5]
	cmp r8, r0
	bne _080C4E60
	cmp r7, 0x1
	beq _080C4E78
_080C4E5A:
	subs r0, r2, 0x1
	lsls r0, 24
	lsrs r2, r0, 24
_080C4E60:
	adds r6, 0x1
	cmp r6, 0x3
	bgt _080C4E78
	lsls r0, r6, 1
	add r0, r12
	asrs r1, r3, 16
	movs r5, 0
	ldrsh r0, [r0, r5]
	cmp r1, r0
	bne _080C4E60
	cmp r2, 0x1
	bne _080C4E5A
_080C4E78:
	lsls r1, r6, 24
	lsrs r1, 24
	mov r0, r9
	bl sub_80C4698
	ldr r0, _080C4EAC @ =gIsLinkContest
	ldrb r1, [r0]
	movs r0, 0x1
	ands r0, r1
	cmp r0, 0
	beq _080C4EB8
	ldr r0, _080C4EB0 @ =gStringVar2
	lsls r1, r6, 3
	subs r1, r6
	lsls r1, 2
	ldr r2, _080C4EB4 @ =gLinkPlayers + 0x8
	adds r1, r2
	bl sub_80C4674
	b _080C4EC4
	.align 2, 0
_080C4EA0: .4byte gUnknown_02038670
_080C4EA4: .4byte gSpecialVar_0x8006
_080C4EA8: .4byte gStringVar1
_080C4EAC: .4byte gIsLinkContest
_080C4EB0: .4byte gStringVar2
_080C4EB4: .4byte gLinkPlayers + 0x8
_080C4EB8:
	ldr r0, _080C4ED8 @ =gStringVar2
	lsls r1, r6, 6
	ldr r2, _080C4EDC @ =gUnknown_0203857D
	adds r1, r2
	bl sub_80C4674
_080C4EC4:
	mov r1, r10
	asrs r0, r1, 24
	cmp r0, 0x1
	beq _080C4ED0
	cmp r7, r0
	bne _080C4EE4
_080C4ED0:
	ldr r0, _080C4EE0 @ =gSpecialVar_0x8006
	strh r4, [r0]
	b _080C4EEA
	.align 2, 0
_080C4ED8: .4byte gStringVar2
_080C4EDC: .4byte gUnknown_0203857D
_080C4EE0: .4byte gSpecialVar_0x8006
_080C4EE4:
	ldr r1, _080C4EFC @ =gSpecialVar_0x8006
	adds r0, r4, 0x4
	strh r0, [r1]
_080C4EEA:
	add sp, 0x8
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080C4EFC: .4byte gSpecialVar_0x8006
	thumb_func_end sub_80C4D80

	thumb_func_start ShowContestWinnerCleanup
ShowContestWinnerCleanup: @ 80C4F00
	push {lr}
	ldr r0, _080C4F0C @ =c2_exit_to_overworld_1_continue_scripts_restart_music
	bl SetMainCallback2
	pop {r0}
	bx r0
	.align 2, 0
_080C4F0C: .4byte c2_exit_to_overworld_1_continue_scripts_restart_music
	thumb_func_end ShowContestWinnerCleanup

	thumb_func_start ShowContestWinner
ShowContestWinner: @ 80C4F10
	push {r4-r6,lr}
	ldr r6, _080C4F54 @ =gUnknown_0203856C
	ldrb r0, [r6]
	cmp r0, 0
	beq _080C4F40
	bl sub_80AAF30
	ldr r4, _080C4F58 @ =0x02000000
	ldr r0, _080C4F5C @ =0x00015ddf
	adds r1, r4, r0
	movs r5, 0
	movs r0, 0x1
	strb r0, [r1]
	movs r0, 0xFE
	movs r1, 0
	bl sub_80B2C4C
	ldr r1, _080C4F60 @ =0x00015dde
	adds r4, r1
	strb r0, [r4]
	movs r0, 0x3
	bl sub_80B2A7C
	strb r5, [r6]
_080C4F40:
	ldr r0, _080C4F64 @ =CB2_ContestPainting
	bl SetMainCallback2
	ldr r1, _080C4F68 @ =gMain
	ldr r0, _080C4F6C @ =ShowContestWinnerCleanup
	str r0, [r1, 0x8]
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_080C4F54: .4byte gUnknown_0203856C
_080C4F58: .4byte 0x02000000
_080C4F5C: .4byte 0x00015ddf
_080C4F60: .4byte 0x00015dde
_080C4F64: .4byte CB2_ContestPainting
_080C4F68: .4byte gMain
_080C4F6C: .4byte ShowContestWinnerCleanup
	thumb_func_end ShowContestWinner

	thumb_func_start sub_80C4F70
sub_80C4F70: @ 80C4F70
	push {r4,lr}
	ldr r0, _080C4FA8 @ =0x00004010
	ldr r4, _080C4FAC @ =gContestMons
	ldrb r1, [r4, 0x15]
	bl VarSet
	ldr r0, _080C4FB0 @ =0x00004011
	adds r1, r4, 0
	adds r1, 0x55
	ldrb r1, [r1]
	bl VarSet
	ldr r0, _080C4FB4 @ =0x00004012
	adds r1, r4, 0
	adds r1, 0x95
	ldrb r1, [r1]
	bl VarSet
	ldr r0, _080C4FB8 @ =0x00004013
	adds r1, r4, 0
	adds r1, 0xD5
	ldrb r1, [r1]
	bl VarSet
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080C4FA8: .4byte 0x00004010
_080C4FAC: .4byte gContestMons
_080C4FB0: .4byte 0x00004011
_080C4FB4: .4byte 0x00004012
_080C4FB8: .4byte 0x00004013
	thumb_func_end sub_80C4F70

	thumb_func_start GiveMonArtistRibbon
GiveMonArtistRibbon: @ 80C4FBC
	push {r4-r6,lr}
	sub sp, 0x4
	ldr r6, _080C501C @ =gUnknown_02038694
	ldrb r0, [r6]
	movs r5, 0x64
	muls r0, r5
	ldr r4, _080C5020 @ =gPlayerParty
	adds r0, r4
	movs r1, 0x46
	bl GetMonData
	lsls r0, 24
	lsrs r0, 24
	mov r1, sp
	strb r0, [r1]
	cmp r0, 0
	bne _080C5038
	ldr r0, _080C5024 @ =gUnknown_02038690
	ldr r1, _080C5028 @ =gContestPlayerMonIndex
	ldrb r2, [r1]
	adds r0, r2, r0
	ldrb r0, [r0]
	cmp r0, 0
	bne _080C5038
	ldr r0, _080C502C @ =gScriptContestRank
	ldrh r0, [r0]
	cmp r0, 0x3
	bne _080C5038
	ldr r1, _080C5030 @ =gUnknown_02038678
	lsls r0, r2, 1
	adds r0, r1
	movs r2, 0
	ldrsh r1, [r0, r2]
	ldr r0, _080C5034 @ =0x0000031f
	cmp r1, r0
	ble _080C5038
	movs r1, 0x1
	mov r0, sp
	strb r1, [r0]
	ldrb r0, [r6]
	muls r0, r5
	adds r0, r4
	movs r1, 0x46
	mov r2, sp
	bl SetMonData
	movs r0, 0x1
	b _080C503A
	.align 2, 0
_080C501C: .4byte gUnknown_02038694
_080C5020: .4byte gPlayerParty
_080C5024: .4byte gUnknown_02038690
_080C5028: .4byte gContestPlayerMonIndex
_080C502C: .4byte gScriptContestRank
_080C5030: .4byte gUnknown_02038678
_080C5034: .4byte 0x0000031f
_080C5038:
	movs r0, 0
_080C503A:
	add sp, 0x4
	pop {r4-r6}
	pop {r1}
	bx r1
	thumb_func_end GiveMonArtistRibbon

	thumb_func_start sub_80C5044
sub_80C5044: @ 80C5044
	ldr r0, _080C504C @ =gUnknown_0203856C
	ldrb r0, [r0]
	bx lr
	.align 2, 0
_080C504C: .4byte gUnknown_0203856C
	thumb_func_end sub_80C5044

	thumb_func_start ShowContestEntryMonPic
ShowContestEntryMonPic: @ 80C5050
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	sub sp, 0xC
	ldr r4, _080C513C @ =sub_80C5190
	adds r0, r4, 0
	bl FindTaskIdByFunc
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0xFF
	bne _080C512A
	movs r0, 0xA
	mov r10, r0
	movs r7, 0x3
	movs r1, 0x3
	movs r2, 0x13
	movs r3, 0xD
	bl MenuDrawTextWindow
	ldr r2, _080C5140 @ =gContestMons
	ldr r0, _080C5144 @ =gSpecialVar_0x8006
	ldrh r1, [r0]
	lsls r1, 6
	adds r0, r1, r2
	ldrh r6, [r0]
	adds r0, r2, 0
	adds r0, 0x38
	adds r0, r1, r0
	ldr r0, [r0]
	mov r8, r0
	adds r2, 0x3C
	adds r1, r2
	ldr r1, [r1]
	mov r9, r1
	adds r0, r4, 0
	movs r1, 0x50
	bl CreateTask
	lsls r0, 24
	lsrs r0, 24
	ldr r1, _080C5148 @ =gTasks
	lsls r5, r0, 2
	adds r5, r0
	lsls r5, 3
	adds r5, r1
	movs r0, 0
	strh r0, [r5, 0x8]
	strh r6, [r5, 0xA]
	lsls r0, r6, 3
	ldr r1, _080C514C @ =gMonFrontPicTable
	adds r0, r1
	ldr r1, _080C5150 @ =gMonFrontPicCoords
	lsls r2, r6, 2
	adds r2, r1
	ldrb r1, [r2]
	ldrb r2, [r2, 0x1]
	ldr r4, _080C5154 @ =gUnknown_081FAF4C
	ldr r3, [r4]
	ldr r4, [r4, 0x4]
	str r4, [sp]
	str r6, [sp, 0x4]
	mov r4, r8
	str r4, [sp, 0x8]
	bl HandleLoadSpecialPokePic
	adds r0, r6, 0
	mov r1, r9
	mov r2, r8
	bl sub_80409C8
	adds r4, r0, 0
	bl LoadCompressedObjectPalette
	adds r0, r6, 0
	movs r1, 0x1
	bl GetMonSpriteTemplate_803C56C
	ldr r0, _080C5158 @ =gUnknown_02024E8C
	ldrh r1, [r4, 0x4]
	strh r1, [r0, 0x2]
	movs r1, 0x78
	movs r2, 0x40
	movs r3, 0
	bl CreateSprite
	lsls r0, 24
	lsrs r0, 24
	strh r0, [r5, 0xC]
	mov r1, r10
	strh r1, [r5, 0xE]
	strh r7, [r5, 0x10]
	ldr r3, _080C515C @ =gSprites
	lsls r1, r0, 4
	adds r1, r0
	lsls r1, 2
	adds r0, r3, 0
	adds r0, 0x1C
	adds r0, r1, r0
	ldr r2, _080C5160 @ =SpriteCallbackDummy
	str r2, [r0]
	adds r1, r3
	ldrb r2, [r1, 0x5]
	movs r0, 0xD
	negs r0, r0
	ands r0, r2
	strb r0, [r1, 0x5]
_080C512A:
	add sp, 0xC
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080C513C: .4byte sub_80C5190
_080C5140: .4byte gContestMons
_080C5144: .4byte gSpecialVar_0x8006
_080C5148: .4byte gTasks
_080C514C: .4byte gMonFrontPicTable
_080C5150: .4byte gMonFrontPicCoords
_080C5154: .4byte gUnknown_081FAF4C
_080C5158: .4byte gUnknown_02024E8C
_080C515C: .4byte gSprites
_080C5160: .4byte SpriteCallbackDummy
	thumb_func_end ShowContestEntryMonPic

	thumb_func_start sub_80C5164
sub_80C5164: @ 80C5164
	push {lr}
	ldr r0, _080C5188 @ =sub_80C5190
	bl FindTaskIdByFunc
	lsls r0, 24
	lsrs r2, r0, 24
	cmp r2, 0xFF
	beq _080C5184
	ldr r0, _080C518C @ =gTasks
	lsls r1, r2, 2
	adds r1, r2
	lsls r1, 3
	adds r1, r0
	ldrh r0, [r1, 0x8]
	adds r0, 0x1
	strh r0, [r1, 0x8]
_080C5184:
	pop {r0}
	bx r0
	.align 2, 0
_080C5188: .4byte sub_80C5190
_080C518C: .4byte gTasks
	thumb_func_end sub_80C5164

	thumb_func_start sub_80C5190
sub_80C5190: @ 80C5190
	push {r4,r5,lr}
	lsls r0, 24
	lsrs r5, r0, 24
	lsls r0, r5, 2
	adds r0, r5
	lsls r0, 3
	ldr r1, _080C51B4 @ =gTasks
	adds r4, r0, r1
	movs r1, 0x8
	ldrsh r0, [r4, r1]
	cmp r0, 0x1
	beq _080C5222
	cmp r0, 0x1
	bgt _080C51B8
	cmp r0, 0
	beq _080C51F8
	b _080C5222
	.align 2, 0
_080C51B4: .4byte gTasks
_080C51B8:
	cmp r0, 0x2
	beq _080C51C2
	cmp r0, 0x3
	beq _080C5204
	b _080C5222
_080C51C2:
	movs r0, 0xC
	ldrsh r1, [r4, r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	ldr r1, _080C5200 @ =gSprites
	adds r5, r0, r1
	ldrb r0, [r5, 0x5]
	lsrs r0, 4
	bl GetSpritePaletteTagByPaletteNum
	lsls r0, 16
	lsrs r0, 16
	bl FreeSpritePaletteByTag
	ldrb r0, [r5, 0x1]
	lsls r0, 30
	cmp r0, 0
	beq _080C51F2
	ldrb r0, [r5, 0x3]
	lsls r0, 26
	lsrs r0, 27
	bl FreeOamMatrix
_080C51F2:
	adds r0, r5, 0
	bl DestroySprite
_080C51F8:
	ldrh r0, [r4, 0x8]
	adds r0, 0x1
	strh r0, [r4, 0x8]
	b _080C5222
	.align 2, 0
_080C5200: .4byte gSprites
_080C5204:
	ldrb r2, [r4, 0xE]
	adds r0, r2, 0
	ldrb r3, [r4, 0x10]
	adds r1, r3, 0
	adds r2, 0x9
	lsls r2, 24
	lsrs r2, 24
	adds r3, 0xA
	lsls r3, 24
	lsrs r3, 24
	bl MenuZeroFillWindowRect
	adds r0, r5, 0
	bl DestroyTask
_080C5222:
	pop {r4,r5}
	pop {r0}
	bx r0
	thumb_func_end sub_80C5190

	thumb_func_start ScriptGetMultiplayerId
ScriptGetMultiplayerId: @ 80C5228
	push {r4,lr}
	ldr r0, _080C5244 @ =gIsLinkContest
	ldrb r1, [r0]
	movs r0, 0x1
	ands r0, r1
	cmp r0, 0
	beq _080C524C
	ldr r4, _080C5248 @ =gScriptResult
	bl GetMultiplayerId
	lsls r0, 24
	lsrs r0, 24
	strh r0, [r4]
	b _080C5252
	.align 2, 0
_080C5244: .4byte gIsLinkContest
_080C5248: .4byte gScriptResult
_080C524C:
	ldr r1, _080C5258 @ =gScriptResult
	movs r0, 0x4
	strh r0, [r1]
_080C5252:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080C5258: .4byte gScriptResult
	thumb_func_end ScriptGetMultiplayerId

	thumb_func_start ScriptRandom
ScriptRandom: @ 80C525C
	push {r4,lr}
	ldr r0, _080C5280 @ =gIsLinkContest
	ldrb r1, [r0]
	movs r0, 0x1
	ands r0, r1
	cmp r0, 0
	beq _080C5294
	ldr r2, _080C5284 @ =gUnknown_03005D28
	ldr r1, [r2]
	ldr r0, _080C5288 @ =0x41c64e6d
	muls r0, r1
	ldr r1, _080C528C @ =0x00006073
	adds r0, r1
	str r0, [r2]
	lsrs r0, 16
	ldr r4, _080C5290 @ =gScriptResult
	b _080C529E
	.align 2, 0
_080C5280: .4byte gIsLinkContest
_080C5284: .4byte gUnknown_03005D28
_080C5288: .4byte 0x41c64e6d
_080C528C: .4byte 0x00006073
_080C5290: .4byte gScriptResult
_080C5294:
	ldr r4, _080C52AC @ =gScriptResult
	bl Random
	lsls r0, 16
	lsrs r0, 16
_080C529E:
	ldrh r1, [r4]
	bl __umodsi3
	strh r0, [r4]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080C52AC: .4byte gScriptResult
	thumb_func_end ScriptRandom

	thumb_func_start HealPlayerParty
HealPlayerParty: @ 80C52B0
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	sub sp, 0x4
	movs r0, 0
	mov r8, r0
	ldr r0, _080C536C @ =gPlayerPartyCount
	ldrb r0, [r0]
	cmp r8, r0
	bcs _080C535C
	ldr r1, _080C5370 @ =gPlayerParty
	mov r10, r1
	mov r6, sp
_080C52CE:
	movs r0, 0x64
	mov r4, r8
	muls r4, r0
	add r4, r10
	adds r0, r4, 0
	movs r1, 0x3A
	bl GetMonData
	lsls r1, r0, 16
	strb r0, [r6]
	lsrs r1, 24
	strb r1, [r6, 0x1]
	adds r0, r4, 0
	movs r1, 0x39
	mov r2, sp
	bl SetMonData
	adds r0, r4, 0
	movs r1, 0x15
	bl GetMonData
	lsls r0, 24
	lsrs r7, r0, 24
	movs r5, 0
	movs r1, 0x1
	add r1, r8
	mov r9, r1
_080C5304:
	adds r1, r5, 0
	adds r1, 0xD
	adds r0, r4, 0
	bl GetMonData
	lsls r0, 16
	lsrs r0, 16
	adds r1, r7, 0
	adds r2, r5, 0
	bl CalculatePPWithBonus
	strb r0, [r6]
	adds r1, r5, 0
	adds r1, 0x11
	adds r0, r4, 0
	mov r2, sp
	bl SetMonData
	adds r0, r5, 0x1
	lsls r0, 24
	lsrs r5, r0, 24
	cmp r5, 0x3
	bls _080C5304
	movs r0, 0
	strb r0, [r6]
	strb r0, [r6, 0x1]
	strb r0, [r6, 0x2]
	strb r0, [r6, 0x3]
	movs r1, 0x64
	mov r0, r8
	muls r0, r1
	add r0, r10
	movs r1, 0x37
	mov r2, sp
	bl SetMonData
	mov r1, r9
	lsls r0, r1, 24
	lsrs r0, 24
	mov r8, r0
	ldr r0, _080C536C @ =gPlayerPartyCount
	ldrb r0, [r0]
	cmp r8, r0
	bcc _080C52CE
_080C535C:
	add sp, 0x4
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080C536C: .4byte gPlayerPartyCount
_080C5370: .4byte gPlayerParty
	thumb_func_end HealPlayerParty

	thumb_func_start ScriptGiveMon
ScriptGiveMon: @ 80C5374
	push {r4-r6,lr}
	mov r6, r8
	push {r6}
	sub sp, 0x78
	adds r5, r0, 0
	adds r3, r1, 0
	adds r4, r2, 0
	lsls r5, 16
	lsrs r5, 16
	lsls r3, 24
	lsrs r3, 24
	lsls r4, 16
	lsrs r0, r4, 16
	mov r8, r0
	add r6, sp, 0x14
	movs r0, 0
	str r0, [sp]
	str r0, [sp, 0x4]
	str r0, [sp, 0x8]
	str r0, [sp, 0xC]
	adds r0, r6, 0
	adds r1, r5, 0
	adds r2, r3, 0
	movs r3, 0x20
	bl CreateMon
	add r0, sp, 0x10
	mov r1, r8
	strb r1, [r0]
	lsrs r4, 24
	strb r4, [r0, 0x1]
	adds r0, r6, 0
	movs r1, 0xC
	add r2, sp, 0x10
	bl SetMonData
	adds r0, r6, 0
	bl GiveMonToPlayer
	lsls r0, 24
	lsrs r4, r0, 24
	adds r0, r5, 0
	bl SpeciesToNationalPokedexNum
	lsls r0, 16
	lsrs r5, r0, 16
	cmp r4, 0x1
	bgt _080C53E8
	cmp r4, 0
	blt _080C53E8
	adds r0, r5, 0
	movs r1, 0x2
	bl sub_8090D90
	adds r0, r5, 0
	movs r1, 0x3
	bl sub_8090D90
_080C53E8:
	adds r0, r4, 0
	add sp, 0x78
	pop {r3}
	mov r8, r3
	pop {r4-r6}
	pop {r1}
	bx r1
	thumb_func_end ScriptGiveMon

	thumb_func_start ScriptGiveEgg
ScriptGiveEgg: @ 80C53F8
	push {lr}
	sub sp, 0x68
	adds r1, r0, 0
	lsls r1, 16
	lsrs r1, 16
	mov r0, sp
	movs r2, 0x1
	bl sub_8042044
	add r2, sp, 0x64
	movs r0, 0x1
	strb r0, [r2]
	mov r0, sp
	movs r1, 0x2D
	bl SetMonData
	mov r0, sp
	bl GiveMonToPlayer
	lsls r0, 24
	lsrs r0, 24
	add sp, 0x68
	pop {r1}
	bx r1
	thumb_func_end ScriptGiveEgg

	thumb_func_start CheckForAlivePartyMons
CheckForAlivePartyMons: @ 80C5428
	push {lr}
	bl sub_803DAA0
	lsls r0, 24
	lsrs r1, r0, 24
	cmp r1, 0x1
	beq _080C5444
	cmp r1, 0x1
	bgt _080C5440
	cmp r1, 0
	beq _080C5444
	b _080C5448
_080C5440:
	cmp r1, 0x2
	bne _080C5448
_080C5444:
	ldr r0, _080C544C @ =gScriptResult
	strh r1, [r0]
_080C5448:
	pop {r0}
	bx r0
	.align 2, 0
_080C544C: .4byte gScriptResult
	thumb_func_end CheckForAlivePartyMons

	thumb_func_start CheckPartyMonHasHeldItem
CheckPartyMonHasHeldItem: @ 80C5450
	push {r4-r7,lr}
	lsls r0, 16
	lsrs r6, r0, 16
	movs r5, 0
	movs r7, 0xCE
	lsls r7, 1
_080C545C:
	movs r0, 0x64
	adds r1, r5, 0
	muls r1, r0
	ldr r0, _080C548C @ =gPlayerParty
	adds r4, r1, r0
	adds r0, r4, 0
	movs r1, 0x41
	bl GetMonData
	lsls r0, 16
	lsrs r0, 16
	cmp r0, 0
	beq _080C5490
	cmp r0, r7
	beq _080C5490
	adds r0, r4, 0
	movs r1, 0xC
	bl GetMonData
	cmp r0, r6
	bne _080C5490
	movs r0, 0x1
	b _080C5498
	.align 2, 0
_080C548C: .4byte gPlayerParty
_080C5490:
	adds r5, 0x1
	cmp r5, 0x5
	ble _080C545C
	movs r0, 0
_080C5498:
	pop {r4-r7}
	pop {r1}
	bx r1
	thumb_func_end CheckPartyMonHasHeldItem

	thumb_func_start GetNameOfEnigmaBerryInPlayerParty
GetNameOfEnigmaBerryInPlayerParty: @ 80C54A0
	push {r4,lr}
	movs r0, 0xAF
	bl CheckPartyMonHasHeldItem
	lsls r0, 24
	lsrs r0, 24
	adds r4, r0, 0
	cmp r4, 0x1
	bne _080C54C2
	movs r0, 0xAF
	bl ItemIdToBerryType
	lsls r0, 24
	lsrs r0, 24
	ldr r1, _080C54CC @ =gStringVar1
	bl GetBerryNameByBerryType
_080C54C2:
	adds r0, r4, 0
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_080C54CC: .4byte gStringVar1
	thumb_func_end GetNameOfEnigmaBerryInPlayerParty

	thumb_func_start ScriptWildBattle
ScriptWildBattle: @ 80C54D0
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	sub sp, 0x14
	adds r4, r0, 0
	adds r5, r1, 0
	lsls r4, 16
	lsrs r4, 16
	lsls r5, 24
	lsrs r5, 24
	lsls r7, r2, 16
	lsrs r6, r7, 16
	bl ZeroEnemyPartyMons
	ldr r0, _080C552C @ =gEnemyParty
	mov r8, r0
	movs r0, 0
	str r0, [sp]
	str r0, [sp, 0x4]
	str r0, [sp, 0x8]
	str r0, [sp, 0xC]
	mov r0, r8
	adds r1, r4, 0
	adds r2, r5, 0
	movs r3, 0x20
	bl CreateMon
	cmp r6, 0
	beq _080C551E
	add r0, sp, 0x10
	strb r6, [r0]
	adds r1, r0, 0
	lsrs r0, r7, 24
	strb r0, [r1, 0x1]
	mov r0, r8
	movs r1, 0xC
	add r2, sp, 0x10
	bl SetMonData
_080C551E:
	add sp, 0x14
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080C552C: .4byte gEnemyParty
	thumb_func_end ScriptWildBattle

	thumb_func_start ScriptSetMonMoveSlot
ScriptSetMonMoveSlot: @ 80C5530
	push {r4,lr}
	lsls r0, 24
	lsrs r3, r0, 24
	lsls r1, 16
	lsrs r4, r1, 16
	lsls r2, 24
	lsrs r2, 24
	cmp r3, 0x6
	bls _080C554C
	ldr r0, _080C5560 @ =gPlayerPartyCount
	ldrb r0, [r0]
	subs r0, 0x1
	lsls r0, 24
	lsrs r3, r0, 24
_080C554C:
	movs r0, 0x64
	muls r0, r3
	ldr r1, _080C5564 @ =gPlayerParty
	adds r0, r1
	adds r1, r4, 0
	bl SetMonMoveSlot
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080C5560: .4byte gPlayerPartyCount
_080C5564: .4byte gPlayerParty
	thumb_func_end ScriptSetMonMoveSlot

	thumb_func_start sub_80C5568
sub_80C5568: @ 80C5568
	push {lr}
	ldr r1, _080C5578 @ =gMain
	ldr r0, _080C557C @ =sub_80C5580
	str r0, [r1, 0x8]
	bl sub_8121E10
	pop {r0}
	bx r0
	.align 2, 0
_080C5578: .4byte gMain
_080C557C: .4byte sub_80C5580
	thumb_func_end sub_80C5568

	thumb_func_start sub_80C5580
sub_80C5580: @ 80C5580
	push {lr}
	ldr r0, _080C5590 @ =gUnknown_02039270
	ldrb r1, [r0]
	cmp r1, 0
	bne _080C5598
	ldr r0, _080C5594 @ =gScriptResult
	strh r1, [r0]
	b _080C559E
	.align 2, 0
_080C5590: .4byte gUnknown_02039270
_080C5594: .4byte gScriptResult
_080C5598:
	ldr r1, _080C55A8 @ =gScriptResult
	movs r0, 0x1
	strh r0, [r1]
_080C559E:
	ldr r0, _080C55AC @ =c2_exit_to_overworld_1_continue_scripts_restart_music
	bl SetMainCallback2
	pop {r0}
	bx r0
	.align 2, 0
_080C55A8: .4byte gScriptResult
_080C55AC: .4byte c2_exit_to_overworld_1_continue_scripts_restart_music
	thumb_func_end sub_80C5580

	thumb_func_start ChooseBattleTowerPlayerParty
ChooseBattleTowerPlayerParty: @ 80C55B0
	push {lr}
	ldr r1, _080C55C0 @ =gMain
	ldr r0, _080C55C4 @ =SetBattleTowerPlayerParty
	str r0, [r1, 0x8]
	bl sub_8121E34
	pop {r0}
	bx r0
	.align 2, 0
_080C55C0: .4byte gMain
_080C55C4: .4byte SetBattleTowerPlayerParty
	thumb_func_end ChooseBattleTowerPlayerParty

	thumb_func_start SetBattleTowerPlayerParty
SetBattleTowerPlayerParty: @ 80C55C8
	push {r4,lr}
	ldr r0, _080C55DC @ =gUnknown_02039270
	ldrb r4, [r0]
	cmp r4, 0
	bne _080C55E4
	bl LoadPlayerParty
	ldr r0, _080C55E0 @ =gScriptResult
	strh r4, [r0]
	b _080C55EE
	.align 2, 0
_080C55DC: .4byte gUnknown_02039270
_080C55E0: .4byte gScriptResult
_080C55E4:
	bl ReducePlayerPartyToThree
	ldr r1, _080C55FC @ =gScriptResult
	movs r0, 0x1
	strh r0, [r1]
_080C55EE:
	ldr r0, _080C5600 @ =c2_exit_to_overworld_1_continue_scripts_restart_music
	bl SetMainCallback2
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080C55FC: .4byte gScriptResult
_080C5600: .4byte c2_exit_to_overworld_1_continue_scripts_restart_music
	thumb_func_end SetBattleTowerPlayerParty

	thumb_func_start ReducePlayerPartyToThree
ReducePlayerPartyToThree: @ 80C5604
	push {r4-r7,lr}
	sub sp, 0x134
	add r0, sp, 0x12C
	movs r1, 0
	str r1, [r0]
	ldr r2, _080C5674 @ =0x0500004b
	mov r1, sp
	bl CpuSet
	movs r5, 0
	movs r7, 0x64
	ldr r6, _080C5678 @ =gPlayerParty
	mov r4, sp
_080C561E:
	ldr r0, _080C567C @ =gUnknown_02039270
	adds r1, r5, r0
	ldrb r0, [r1]
	cmp r0, 0
	beq _080C5638
	subs r0, 0x1
	adds r1, r0, 0
	muls r1, r7
	adds r1, r6
	adds r0, r4, 0
	movs r2, 0x64
	bl memcpy
_080C5638:
	adds r4, 0x64
	adds r5, 0x1
	cmp r5, 0x2
	ble _080C561E
	add r0, sp, 0x130
	movs r1, 0
	str r1, [r0]
	ldr r4, _080C5678 @ =gPlayerParty
	ldr r2, _080C5680 @ =0x05000096
	adds r1, r4, 0
	bl CpuSet
	mov r5, sp
	add r6, sp, 0xC8
_080C5654:
	adds r0, r4, 0
	adds r1, r5, 0
	movs r2, 0x64
	bl memcpy
	adds r5, 0x64
	adds r4, 0x64
	cmp r5, r6
	ble _080C5654
	bl CalculatePlayerPartyCount
	add sp, 0x134
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080C5674: .4byte 0x0500004b
_080C5678: .4byte gPlayerParty
_080C567C: .4byte gUnknown_02039270
_080C5680: .4byte 0x05000096
	thumb_func_end ReducePlayerPartyToThree

	.align 2, 0 @ Don't pad with nop.
