	.include "constants/gba_constants.inc"
	.include "constants/species_constants.inc"
	.include "asm/macros.inc"

	.syntax unified

	.text

	thumb_func_start CreatedHatchedMon
CreatedHatchedMon: @ 80428A4
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	sub sp, 0x48
	adds r6, r0, 0
	adds r5, r1, 0
	movs r1, 0xB
	bl GetMonData
	lsls r0, 16
	lsrs r0, 16
	mov r10, r0
	movs r4, 0
	add r7, sp, 0x18
	mov r0, sp
	adds r0, 0x31
	str r0, [sp, 0x38]
	mov r1, sp
	adds r1, 0x32
	str r1, [sp, 0x3C]
	add r0, sp, 0x30
	mov r9, r0
	adds r1, 0x1
	str r1, [sp, 0x40]
	mov r0, sp
	adds r0, 0x34
	str r0, [sp, 0x44]
_080428DE:
	adds r1, r4, 0
	adds r1, 0xD
	adds r0, r6, 0
	bl GetMonData
	lsls r1, r4, 1
	add r1, sp
	adds r1, 0x10
	strh r0, [r1]
	adds r0, r4, 0x1
	lsls r0, 24
	lsrs r4, r0, 24
	cmp r4, 0x3
	bls _080428DE
	adds r0, r6, 0
	movs r1, 0
	bl GetMonData
	mov r8, r0
	movs r4, 0
_08042906:
	adds r1, r4, 0
	adds r1, 0x27
	adds r0, r6, 0
	bl GetMonData
	lsls r1, r4, 2
	adds r1, r7, r1
	str r0, [r1]
	adds r0, r4, 0x1
	lsls r0, 24
	lsrs r4, r0, 24
	cmp r4, 0x5
	bls _08042906
	adds r0, r6, 0
	movs r1, 0x25
	bl GetMonData
	ldr r1, [sp, 0x38]
	strb r0, [r1]
	adds r0, r6, 0
	movs r1, 0x8
	bl GetMonData
	ldr r1, [sp, 0x3C]
	strb r0, [r1]
	adds r0, r6, 0
	movs r1, 0x22
	bl GetMonData
	str r0, [sp, 0x34]
	movs r0, 0x1
	str r0, [sp]
	mov r0, r8
	str r0, [sp, 0x4]
	movs r0, 0
	str r0, [sp, 0x8]
	str r0, [sp, 0xC]
	adds r0, r5, 0
	mov r1, r10
	movs r2, 0x5
	movs r3, 0x20
	bl CreateMon
	movs r4, 0
_0804295E:
	adds r1, r4, 0
	adds r1, 0xD
	lsls r0, r4, 1
	mov r2, sp
	adds r2, r0
	adds r2, 0x10
	adds r0, r5, 0
	bl SetMonData
	adds r0, r4, 0x1
	lsls r0, 24
	lsrs r4, r0, 24
	cmp r4, 0x3
	bls _0804295E
	movs r4, 0
_0804297C:
	adds r1, r4, 0
	adds r1, 0x27
	lsls r2, r4, 2
	adds r2, r7, r2
	adds r0, r5, 0
	bl SetMonData
	adds r0, r4, 0x1
	lsls r0, 24
	lsrs r4, r0, 24
	cmp r4, 0x5
	bls _0804297C
	movs r0, 0x2
	mov r1, r9
	strb r0, [r1]
	adds r0, r5, 0
	movs r1, 0x3
	mov r2, r9
	bl SetMonData
	adds r0, r5, 0
	movs r1, 0x25
	ldr r2, [sp, 0x38]
	bl SetMonData
	adds r0, r5, 0
	movs r1, 0x8
	ldr r2, [sp, 0x3C]
	bl SetMonData
	movs r0, 0x78
	ldr r1, [sp, 0x40]
	strb r0, [r1]
	adds r0, r5, 0
	movs r1, 0x20
	ldr r2, [sp, 0x40]
	bl SetMonData
	adds r0, r5, 0
	movs r1, 0x22
	ldr r2, [sp, 0x44]
	bl SetMonData
	adds r0, r6, 0
	adds r1, r5, 0
	movs r2, 0x64
	bl memcpy
	add sp, 0x48
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	thumb_func_end CreatedHatchedMon

	thumb_func_start AddHatchedMonToParty
AddHatchedMonToParty: @ 80429EC
	push {r4-r6,lr}
	sub sp, 0x14
	lsls r0, 24
	lsrs r0, 24
	movs r1, 0x64
	adds r5, r0, 0
	muls r5, r1
	ldr r0, _08042A9C @ =gPlayerParty
	adds r5, r0
	ldr r1, _08042AA0 @ =gEnemyParty
	adds r0, r5, 0
	bl CreatedHatchedMon
	add r2, sp, 0xC
	movs r6, 0
	strb r6, [r2]
	adds r0, r5, 0
	movs r1, 0x2D
	bl SetMonData
	adds r0, r5, 0
	movs r1, 0xB
	bl GetMonData
	adds r4, r0, 0
	lsls r4, 16
	lsrs r4, 16
	mov r0, sp
	adds r1, r4, 0
	bl GetSpeciesName
	adds r0, r5, 0
	movs r1, 0x2
	mov r2, sp
	bl SetMonData
	adds r0, r4, 0
	bl SpeciesToNationalPokedexNum
	adds r4, r0, 0
	lsls r4, 16
	lsrs r4, 16
	adds r0, r4, 0
	movs r1, 0x2
	bl sub_8090D90
	adds r0, r4, 0
	movs r1, 0x3
	bl sub_8090D90
	ldr r1, _08042AA4 @ =gStringVar1
	adds r0, r5, 0
	bl pokemon_get_nick
	mov r2, sp
	adds r2, 0xE
	movs r0, 0x4
	strh r0, [r2]
	adds r0, r5, 0
	movs r1, 0x26
	bl SetMonData
	add r2, sp, 0x10
	strh r6, [r2]
	adds r0, r5, 0
	movs r1, 0x24
	bl SetMonData
	bl sav1_map_get_name
	mov r2, sp
	adds r2, 0x12
	strb r0, [r2]
	adds r0, r5, 0
	movs r1, 0x23
	bl SetMonData
	adds r0, r5, 0
	bl sub_8040B1C
	adds r0, r5, 0
	bl CalculateMonStats
	add sp, 0x14
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_08042A9C: .4byte gPlayerParty
_08042AA0: .4byte gEnemyParty
_08042AA4: .4byte gStringVar1
	thumb_func_end AddHatchedMonToParty

	thumb_func_start ScriptHatchMon
ScriptHatchMon: @ 8042AA8
	push {lr}
	ldr r0, _08042AB8 @ =gSpecialVar_0x8004
	ldrb r0, [r0]
	bl AddHatchedMonToParty
	pop {r0}
	bx r0
	.align 2, 0
_08042AB8: .4byte gSpecialVar_0x8004
	thumb_func_end ScriptHatchMon

	thumb_func_start sub_8042ABC
sub_8042ABC: @ 8042ABC
	push {r4-r6,lr}
	sub sp, 0x20
	adds r5, r0, 0
	lsls r4, r1, 24
	lsrs r4, 24
	lsls r0, r4, 2
	adds r0, r4
	lsls r0, 4
	adds r0, r5, r0
	mov r1, sp
	bl pokemon_get_nick_
	lsls r0, r4, 3
	subs r0, r4
	lsls r1, r0, 3
	adds r0, r5, r1
	adds r0, 0xC0
	ldrh r0, [r0]
	cmp r0, 0
	beq _08042B40
	adds r0, r1, 0
	adds r0, 0xA0
	adds r5, r0
	adds r6, r5, 0
	adds r6, 0x2C
	mov r0, sp
	adds r1, r6, 0
	bl StringCompareWithoutExtCtrlCodes
	cmp r0, 0
	bne _08042B08
	ldr r0, _08042B30 @ =gSaveBlock2
	adds r1, r5, 0
	adds r1, 0x24
	bl StringCompareWithoutExtCtrlCodes
	cmp r0, 0
	beq _08042B40
_08042B08:
	ldr r0, _08042B34 @ =gStringVar1
	mov r1, sp
	bl StringCopy
	ldr r4, _08042B38 @ =gStringVar2
	adds r1, r5, 0
	adds r1, 0x24
	adds r0, r4, 0
	bl StringCopy
	ldr r0, _08042B3C @ =gStringVar3
	adds r1, r6, 0
	bl StringCopy
	adds r0, r4, 0
	bl SanitizeNameString
	movs r0, 0x1
	b _08042B42
	.align 2, 0
_08042B30: .4byte gSaveBlock2
_08042B34: .4byte gStringVar1
_08042B38: .4byte gStringVar2
_08042B3C: .4byte gStringVar3
_08042B40:
	movs r0, 0
_08042B42:
	add sp, 0x20
	pop {r4-r6}
	pop {r1}
	bx r1
	thumb_func_end sub_8042ABC

	thumb_func_start sub_8042B4C
sub_8042B4C: @ 8042B4C
	push {lr}
	ldr r0, _08042B60 @ =gSaveBlock1 + 0x2F9C
	ldr r1, _08042B64 @ =gSpecialVar_0x8004
	ldrb r1, [r1]
	bl sub_8042ABC
	lsls r0, 24
	lsrs r0, 24
	pop {r1}
	bx r1
	.align 2, 0
_08042B60: .4byte gSaveBlock1 + 0x2F9C
_08042B64: .4byte gSpecialVar_0x8004
	thumb_func_end sub_8042B4C

	thumb_func_start EggHatchCreateMonSprite
EggHatchCreateMonSprite: @ 8042B68
	push {r4-r7,lr}
	mov r7, r9
	mov r6, r8
	push {r6,r7}
	sub sp, 0xC
	lsls r0, 24
	lsrs r3, r0, 24
	adds r4, r3, 0
	lsls r1, 24
	lsrs r6, r1, 24
	lsls r2, 24
	lsrs r1, r2, 24
	adds r2, r1, 0
	movs r5, 0
	mov r9, r5
	movs r7, 0
	cmp r3, 0
	bne _08042B96
	movs r0, 0x64
	muls r1, r0
	ldr r0, _08042BB0 @ =gPlayerParty
	adds r7, r1, r0
	movs r5, 0x1
_08042B96:
	cmp r3, 0x1
	bne _08042BA6
	movs r0, 0x64
	adds r1, r2, 0
	muls r1, r0
	ldr r0, _08042BB0 @ =gPlayerParty
	adds r7, r1, r0
	movs r5, 0x3
_08042BA6:
	cmp r6, 0
	beq _08042BB4
	cmp r6, 0x1
	beq _08042C14
	b _08042C50
	.align 2, 0
_08042BB0: .4byte gPlayerParty
_08042BB4:
	adds r0, r7, 0
	movs r1, 0xB
	bl GetMonData
	adds r5, r0, 0
	lsls r5, 16
	lsrs r5, 16
	adds r0, r7, 0
	movs r1, 0
	bl GetMonData
	mov r8, r0
	lsls r0, r5, 3
	ldr r1, _08042C04 @ =gMonFrontPicTable
	adds r0, r1
	ldr r1, _08042C08 @ =gMonFrontPicCoords
	lsls r2, r5, 2
	adds r2, r1
	ldrb r1, [r2]
	ldrb r2, [r2, 0x1]
	ldr r3, _08042C0C @ =0x02000000
	ldr r6, _08042C10 @ =gUnknown_081FAF4C
	lsls r4, 1
	adds r4, 0x1
	lsls r4, 2
	adds r4, r6
	ldr r4, [r4]
	str r4, [sp]
	str r5, [sp, 0x4]
	mov r4, r8
	str r4, [sp, 0x8]
	bl HandleLoadSpecialPokePic
	adds r0, r7, 0
	bl sub_8040990
	bl LoadCompressedObjectPalette
	b _08042C50
	.align 2, 0
_08042C04: .4byte gMonFrontPicTable
_08042C08: .4byte gMonFrontPicCoords
_08042C0C: .4byte 0x02000000
_08042C10: .4byte gUnknown_081FAF4C
_08042C14:
	adds r0, r7, 0
	bl sub_8040990
	ldrh r0, [r0, 0x4]
	adds r1, r5, 0
	bl GetMonSpriteTemplate_803C56C
	ldr r0, _08042C60 @ =gUnknown_02024E8C
	movs r1, 0x78
	movs r2, 0x46
	movs r3, 0x6
	bl CreateSprite
	lsls r0, 24
	lsrs r0, 24
	mov r9, r0
	ldr r4, _08042C64 @ =gSprites
	lsls r1, r0, 4
	add r1, r9
	lsls r1, 2
	adds r2, r1, r4
	adds r2, 0x3E
	ldrb r0, [r2]
	movs r3, 0x4
	orrs r0, r3
	strb r0, [r2]
	adds r4, 0x1C
	adds r1, r4
	ldr r0, _08042C68 @ =SpriteCallbackDummy
	str r0, [r1]
_08042C50:
	mov r0, r9
	add sp, 0xC
	pop {r3,r4}
	mov r8, r3
	mov r9, r4
	pop {r4-r7}
	pop {r1}
	bx r1
	.align 2, 0
_08042C60: .4byte gUnknown_02024E8C
_08042C64: .4byte gSprites
_08042C68: .4byte SpriteCallbackDummy
	thumb_func_end EggHatchCreateMonSprite

	thumb_func_start VBlankCB_EggHatch
VBlankCB_EggHatch: @ 8042C6C
	push {lr}
	bl LoadOam
	bl ProcessSpriteCopyRequests
	bl TransferPlttBuffer
	pop {r0}
	bx r0
	thumb_func_end VBlankCB_EggHatch

	thumb_func_start EggHatch
EggHatch: @ 8042C80
	push {lr}
	sub sp, 0x4
	bl ScriptContext2_Enable
	ldr r0, _08042CA8 @ =Task_EggHatch
	movs r1, 0xA
	bl CreateTask
	movs r0, 0x1
	negs r0, r0
	movs r1, 0
	str r1, [sp]
	movs r2, 0
	movs r3, 0x10
	bl BeginNormalPaletteFade
	add sp, 0x4
	pop {r0}
	bx r0
	.align 2, 0
_08042CA8: .4byte Task_EggHatch
	thumb_func_end EggHatch

	thumb_func_start Task_EggHatch
Task_EggHatch: @ 8042CAC
	push {r4,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	ldr r0, _08042CD8 @ =gPaletteFade
	ldrb r1, [r0, 0x7]
	movs r0, 0x80
	ands r0, r1
	cmp r0, 0
	bne _08042CD0
	ldr r0, _08042CDC @ =CB2_EggHatch_0
	bl SetMainCallback2
	ldr r1, _08042CE0 @ =gUnknown_0300485C
	ldr r0, _08042CE4 @ =sub_8080990
	str r0, [r1]
	adds r0, r4, 0
	bl DestroyTask
_08042CD0:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08042CD8: .4byte gPaletteFade
_08042CDC: .4byte CB2_EggHatch_0
_08042CE0: .4byte gUnknown_0300485C
_08042CE4: .4byte sub_8080990
	thumb_func_end Task_EggHatch

	thumb_func_start CB2_EggHatch_0
CB2_EggHatch_0: @ 8042CE8
	push {r4-r7,lr}
	ldr r0, _08042D04 @ =gMain
	ldr r1, _08042D08 @ =0x0000043c
	adds r0, r1
	ldrb r0, [r0]
	cmp r0, 0x8
	bls _08042CF8
	b _08042F6E
_08042CF8:
	lsls r0, 2
	ldr r1, _08042D0C @ =_08042D10
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_08042D04: .4byte gMain
_08042D08: .4byte 0x0000043c
_08042D0C: .4byte _08042D10
	.align 2, 0
_08042D10:
	.4byte _08042D34
	.4byte _08042D90
	.4byte _08042DC4
	.4byte _08042E20
	.4byte _08042E40
	.4byte _08042E74
	.4byte _08042E88
	.4byte _08042EB0
	.4byte _08042F40
_08042D34:
	movs r0, 0x80
	lsls r0, 19
	movs r2, 0
	strh r2, [r0]
	ldr r1, _08042D74 @ =gUnknown_0300481C
	ldr r0, _08042D78 @ =0x02018000
	str r0, [r1]
	ldr r1, _08042D7C @ =gSpecialVar_0x8004
	ldrh r1, [r1]
	strb r1, [r0, 0x4]
	adds r0, 0x3A
	strb r2, [r0]
	bl ResetTasks
	bl ResetSpriteData
	bl FreeAllSpritePalettes
	ldr r0, _08042D80 @ =VBlankCB_EggHatch
	bl SetVBlankCallback
	ldr r1, _08042D84 @ =gMain
	ldr r2, _08042D88 @ =0x0000043c
	adds r1, r2
	ldrb r0, [r1]
	adds r0, 0x1
	strb r0, [r1]
	bl GetCurrentMapMusic
	ldr r1, _08042D8C @ =gSpecialVar_0x8005
	strh r0, [r1]
	b _08042F6E
	.align 2, 0
_08042D74: .4byte gUnknown_0300481C
_08042D78: .4byte 0x02018000
_08042D7C: .4byte gSpecialVar_0x8004
_08042D80: .4byte VBlankCB_EggHatch
_08042D84: .4byte gMain
_08042D88: .4byte 0x0000043c
_08042D8C: .4byte gSpecialVar_0x8005
_08042D90:
	ldr r5, _08042DBC @ =gWindowConfig_81E6F84
	adds r0, r5, 0
	bl SetUpWindowConfig
	ldr r4, _08042DC0 @ =gUnknown_0300481C
	ldr r0, [r4]
	adds r0, 0x8
	adds r1, r5, 0
	bl InitWindowFromConfig
	movs r0, 0x14
	bl SetTextWindowBaseTileNum
	ldr r1, [r4]
	adds r1, 0x38
	strb r0, [r1]
	ldr r0, [r4]
	adds r0, 0x8
	bl LoadTextWindowGraphics
	b _08042F04
	.align 2, 0
_08042DBC: .4byte gWindowConfig_81E6F84
_08042DC0: .4byte gUnknown_0300481C
_08042DC4:
	ldr r0, _08042DFC @ =gUnknown_08D00000
	movs r1, 0xC0
	lsls r1, 19
	bl LZDecompressVram
	ldr r0, _08042E00 @ =gUnknown_08D00524
	ldr r4, _08042E04 @ =0x02000000
	movs r2, 0x80
	lsls r2, 4
	adds r1, r4, 0
	bl CpuSet
	ldr r1, _08042E08 @ =0x040000d4
	str r4, [r1]
	ldr r0, _08042E0C @ =0x06002800
	str r0, [r1, 0x4]
	ldr r0, _08042E10 @ =0x80000280
	str r0, [r1, 0x8]
	ldr r0, [r1, 0x8]
	ldr r0, _08042E14 @ =gUnknown_08D004E0
	movs r1, 0
	movs r2, 0x20
	bl LoadCompressedPalette
	ldr r1, _08042E18 @ =gMain
	ldr r2, _08042E1C @ =0x0000043c
	adds r1, r2
	b _08042F0A
	.align 2, 0
_08042DFC: .4byte gUnknown_08D00000
_08042E00: .4byte gUnknown_08D00524
_08042E04: .4byte 0x02000000
_08042E08: .4byte 0x040000d4
_08042E0C: .4byte 0x06002800
_08042E10: .4byte 0x80000280
_08042E14: .4byte gUnknown_08D004E0
_08042E18: .4byte gMain
_08042E1C: .4byte 0x0000043c
_08042E20:
	ldr r0, _08042E34 @ =gUnknown_0820A3B0
	bl LoadSpriteSheet
	ldr r0, _08042E38 @ =gUnknown_0820A3B8
	bl LoadSpriteSheet
	ldr r0, _08042E3C @ =gUnknown_0820A3C0
	bl LoadSpritePalette
	b _08042F04
	.align 2, 0
_08042E34: .4byte gUnknown_0820A3B0
_08042E38: .4byte gUnknown_0820A3B8
_08042E3C: .4byte gUnknown_0820A3C0
_08042E40:
	ldr r0, _08042E64 @ =gSpriteTemplate_820A3C8
	movs r1, 0x78
	movs r2, 0x4B
	movs r3, 0x5
	bl CreateSprite
	ldr r2, _08042E68 @ =gUnknown_0300481C
	ldr r1, [r2]
	strb r0, [r1]
	ldr r0, [r2]
	ldrb r0, [r0, 0x4]
	bl AddHatchedMonToParty
	ldr r1, _08042E6C @ =gMain
	ldr r2, _08042E70 @ =0x0000043c
	adds r1, r2
	b _08042F0A
	.align 2, 0
_08042E64: .4byte gSpriteTemplate_820A3C8
_08042E68: .4byte gUnknown_0300481C
_08042E6C: .4byte gMain
_08042E70: .4byte 0x0000043c
_08042E74:
	ldr r0, _08042E84 @ =gUnknown_0300481C
	ldr r0, [r0]
	ldrb r2, [r0, 0x4]
	movs r0, 0
	movs r1, 0
	bl EggHatchCreateMonSprite
	b _08042F04
	.align 2, 0
_08042E84: .4byte gUnknown_0300481C
_08042E88:
	ldr r4, _08042EA4 @ =gUnknown_0300481C
	ldr r0, [r4]
	ldrb r2, [r0, 0x4]
	movs r0, 0
	movs r1, 0x1
	bl EggHatchCreateMonSprite
	ldr r1, [r4]
	strb r0, [r1, 0x1]
	ldr r1, _08042EA8 @ =gMain
	ldr r2, _08042EAC @ =0x0000043c
	adds r1, r2
	b _08042F0A
	.align 2, 0
_08042EA4: .4byte gUnknown_0300481C
_08042EA8: .4byte gMain
_08042EAC: .4byte 0x0000043c
_08042EB0:
	ldr r0, _08042F14 @ =REG_BG2CNT
	ldr r2, _08042F18 @ =0x00004c06
	adds r1, r2, 0
	strh r1, [r0]
	ldr r0, _08042F1C @ =gUnknown_0820C9F8
	movs r1, 0x10
	movs r2, 0xA0
	bl LoadPalette
	ldr r3, _08042F20 @ =gUnknown_0820CA98
	ldr r4, _08042F24 @ =0x06004000
	movs r5, 0x98
	lsls r5, 5
	ldr r1, _08042F28 @ =0x040000d4
	ldr r6, _08042F2C @ =0x80000800
	movs r2, 0x80
	lsls r2, 5
	movs r7, 0x80
	lsls r7, 24
_08042ED6:
	str r3, [r1]
	str r4, [r1, 0x4]
	str r6, [r1, 0x8]
	ldr r0, [r1, 0x8]
	adds r3, r2
	adds r4, r2
	subs r5, r2
	cmp r5, r2
	bhi _08042ED6
	str r3, [r1]
	str r4, [r1, 0x4]
	lsrs r0, r5, 1
	orrs r0, r7
	str r0, [r1, 0x8]
	ldr r0, [r1, 0x8]
	ldr r1, _08042F30 @ =gUnknown_0820F798
	ldr r2, _08042F34 @ =0x06006000
	ldr r0, _08042F28 @ =0x040000d4
	str r1, [r0]
	str r2, [r0, 0x4]
	ldr r1, _08042F2C @ =0x80000800
	str r1, [r0, 0x8]
	ldr r0, [r0, 0x8]
_08042F04:
	ldr r1, _08042F38 @ =gMain
	ldr r0, _08042F3C @ =0x0000043c
	adds r1, r0
_08042F0A:
	ldrb r0, [r1]
	adds r0, 0x1
	strb r0, [r1]
	b _08042F6E
	.align 2, 0
_08042F14: .4byte REG_BG2CNT
_08042F18: .4byte 0x00004c06
_08042F1C: .4byte gUnknown_0820C9F8
_08042F20: .4byte gUnknown_0820CA98
_08042F24: .4byte 0x06004000
_08042F28: .4byte 0x040000d4
_08042F2C: .4byte 0x80000800
_08042F30: .4byte gUnknown_0820F798
_08042F34: .4byte 0x06006000
_08042F38: .4byte gMain
_08042F3C: .4byte 0x0000043c
_08042F40:
	ldr r1, _08042F74 @ =REG_BG1CNT
	ldr r2, _08042F78 @ =0x00000501
	adds r0, r2, 0
	strh r0, [r1]
	ldr r0, _08042F7C @ =REG_BG0HOFS
	movs r4, 0
	strh r4, [r0]
	adds r0, 0x2
	strh r4, [r0]
	adds r0, 0x2
	strh r4, [r0]
	adds r0, 0x2
	strh r4, [r0]
	adds r0, 0x2
	strh r4, [r0]
	adds r0, 0x2
	strh r4, [r0]
	ldr r0, _08042F80 @ =CB2_EggHatch_1
	bl SetMainCallback2
	ldr r0, _08042F84 @ =gUnknown_0300481C
	ldr r0, [r0]
	strb r4, [r0, 0x2]
_08042F6E:
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_08042F74: .4byte REG_BG1CNT
_08042F78: .4byte 0x00000501
_08042F7C: .4byte REG_BG0HOFS
_08042F80: .4byte CB2_EggHatch_1
_08042F84: .4byte gUnknown_0300481C
	thumb_func_end CB2_EggHatch_0

	thumb_func_start EggHatchSetMonNickname
EggHatchSetMonNickname: @ 8042F88
	push {lr}
	ldr r0, _08042FA8 @ =gSpecialVar_0x8004
	ldrh r1, [r0]
	movs r0, 0x64
	muls r0, r1
	ldr r1, _08042FAC @ =gPlayerParty
	adds r0, r1
	ldr r2, _08042FB0 @ =gStringVar3
	movs r1, 0x2
	bl SetMonData
	ldr r0, _08042FB4 @ =c2_exit_to_overworld_2_switch
	bl SetMainCallback2
	pop {r0}
	bx r0
	.align 2, 0
_08042FA8: .4byte gSpecialVar_0x8004
_08042FAC: .4byte gPlayerParty
_08042FB0: .4byte gStringVar3
_08042FB4: .4byte c2_exit_to_overworld_2_switch
	thumb_func_end EggHatchSetMonNickname

	thumb_func_start Task_EggHatchPlayBGM
Task_EggHatchPlayBGM: @ 8042FB8
	push {r4,r5,lr}
	lsls r0, 24
	lsrs r5, r0, 24
	ldr r1, _08043004 @ =gTasks
	lsls r0, r5, 2
	adds r0, r5
	lsls r0, 3
	adds r4, r0, r1
	movs r1, 0x8
	ldrsh r0, [r4, r1]
	cmp r0, 0
	bne _08042FD4
	bl StopMapMusic
_08042FD4:
	movs r1, 0x8
	ldrsh r0, [r4, r1]
	cmp r0, 0x1
	bne _08042FE4
	movs r0, 0xBC
	lsls r0, 1
	bl PlayBGM
_08042FE4:
	movs r1, 0x8
	ldrsh r0, [r4, r1]
	cmp r0, 0x3C
	ble _08042FF8
	ldr r0, _08043008 @ =0x00000179
	bl PlayBGM
	adds r0, r5, 0
	bl DestroyTask
_08042FF8:
	ldrh r0, [r4, 0x8]
	adds r0, 0x1
	strh r0, [r4, 0x8]
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_08043004: .4byte gTasks
_08043008: .4byte 0x00000179
	thumb_func_end Task_EggHatchPlayBGM

	thumb_func_start CB2_EggHatch_1
CB2_EggHatch_1: @ 804300C
	push {r4-r6,lr}
	mov r6, r10
	mov r5, r9
	mov r4, r8
	push {r4-r6}
	sub sp, 0x8
	ldr r1, _08043030 @ =gUnknown_0300481C
	ldr r0, [r1]
	ldrb r0, [r0, 0x2]
	adds r5, r1, 0
	cmp r0, 0xB
	bls _08043026
	b _080432BA
_08043026:
	lsls r0, 2
	ldr r1, _08043034 @ =_08043038
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_08043030: .4byte gUnknown_0300481C
_08043034: .4byte _08043038
	.align 2, 0
_08043038:
	.4byte _08043068
	.4byte _080430A0
	.4byte _080430C0
	.4byte _080430F8
	.4byte _08043124
	.4byte _08043164
	.4byte _08043172
	.4byte _08043180
	.4byte _080431B8
	.4byte _080431DA
	.4byte _08043288
	.4byte _080432A8
_08043068:
	movs r0, 0x1
	negs r0, r0
	movs r1, 0
	str r1, [sp]
	movs r2, 0x10
	movs r3, 0
	bl BeginNormalPaletteFade
	movs r1, 0x80
	lsls r1, 19
	movs r2, 0xBA
	lsls r2, 5
	adds r0, r2, 0
	strh r0, [r1]
	ldr r0, _08043098 @ =gUnknown_0300481C
	ldr r1, [r0]
	ldrb r0, [r1, 0x2]
	adds r0, 0x1
	strb r0, [r1, 0x2]
	ldr r0, _0804309C @ =Task_EggHatchPlayBGM
	movs r1, 0x5
	bl CreateTask
	b _080432BA
	.align 2, 0
_08043098: .4byte gUnknown_0300481C
_0804309C: .4byte Task_EggHatchPlayBGM
_080430A0:
	ldr r0, _080430BC @ =gPaletteFade
	ldrb r1, [r0, 0x7]
	movs r0, 0x80
	ands r0, r1
	lsls r0, 24
	lsrs r1, r0, 24
	cmp r1, 0
	beq _080430B2
	b _080432BA
_080430B2:
	ldr r0, [r5]
	strb r1, [r0, 0x3]
	ldr r1, [r5]
	b _0804329C
	.align 2, 0
_080430BC: .4byte gPaletteFade
_080430C0:
	ldr r1, [r5]
	ldrb r0, [r1, 0x3]
	adds r0, 0x1
	strb r0, [r1, 0x3]
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1E
	bhi _080430D2
	b _080432BA
_080430D2:
	ldr r1, [r5]
	ldrb r0, [r1, 0x2]
	adds r0, 0x1
	strb r0, [r1, 0x2]
	ldr r2, _080430F0 @ =gSprites
	ldr r0, [r5]
	ldrb r1, [r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r2, 0x1C
	adds r0, r2
	ldr r1, _080430F4 @ =SpriteCB_Egg_0
	str r1, [r0]
	b _080432BA
	.align 2, 0
_080430F0: .4byte gSprites
_080430F4: .4byte SpriteCB_Egg_0
_080430F8:
	ldr r2, _0804311C @ =gSprites
	ldr r3, [r5]
	ldrb r1, [r3]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r2, 0x1C
	adds r0, r2
	ldr r1, [r0]
	ldr r0, _08043120 @ =SpriteCallbackDummy
	cmp r1, r0
	beq _08043112
	b _080432BA
_08043112:
	ldrb r0, [r3, 0x2]
	adds r0, 0x1
	strb r0, [r3, 0x2]
	b _080432BA
	.align 2, 0
_0804311C: .4byte gSprites
_08043120: .4byte SpriteCallbackDummy
_08043124:
	ldr r0, [r5]
	ldrb r1, [r0, 0x4]
	movs r0, 0x64
	muls r0, r1
	ldr r1, _08043150 @ =gPlayerParty
	adds r0, r1
	ldr r1, _08043154 @ =gStringVar1
	bl pokemon_get_nick
	ldr r4, _08043158 @ =gStringVar4
	ldr r1, _0804315C @ =gOtherText_HatchedFromEgg
	adds r0, r4, 0
	bl StringExpandPlaceholders
	adds r0, r4, 0
	bl EggHatchPrintMessage2
	ldr r0, _08043160 @ =0x00000173
	bl PlayFanfare
	ldr r1, [r5]
	b _0804329C
	.align 2, 0
_08043150: .4byte gPlayerParty
_08043154: .4byte gStringVar1
_08043158: .4byte gStringVar4
_0804315C: .4byte gOtherText_HatchedFromEgg
_08043160: .4byte 0x00000173
_08043164:
	bl IsFanfareTaskInactive
	lsls r0, 24
	cmp r0, 0
	bne _08043170
	b _080432BA
_08043170:
	b _08043298
_08043172:
	bl IsFanfareTaskInactive
	lsls r0, 24
	cmp r0, 0
	bne _0804317E
	b _080432BA
_0804317E:
	b _08043298
_08043180:
	ldr r0, [r5]
	ldrb r1, [r0, 0x4]
	movs r0, 0x64
	muls r0, r1
	ldr r1, _080431A8 @ =gPlayerParty
	adds r0, r1
	ldr r1, _080431AC @ =gStringVar1
	bl pokemon_get_nick
	ldr r4, _080431B0 @ =gStringVar4
	ldr r1, _080431B4 @ =gOtherText_NickHatchPrompt
	adds r0, r4, 0
	bl StringExpandPlaceholders
	adds r0, r4, 0
	bl EggHatchPrintMessage1
	ldr r1, [r5]
	b _0804329C
	.align 2, 0
_080431A8: .4byte gPlayerParty
_080431AC: .4byte gStringVar1
_080431B0: .4byte gStringVar4
_080431B4: .4byte gOtherText_NickHatchPrompt
_080431B8:
	bl EggHatchUpdateWindowText
	lsls r0, 24
	cmp r0, 0
	beq _080432BA
	movs r0, 0x16
	movs r1, 0x8
	movs r2, 0x1B
	movs r3, 0xD
	bl MenuDrawTextWindow
	movs r0, 0x16
	movs r1, 0x8
	movs r2, 0x4
	bl InitYesNoMenu
	b _08043298
_080431DA:
	bl ProcessMenuInputNoWrap_
	lsls r0, 24
	lsrs r2, r0, 24
	asrs r0, 24
	movs r1, 0x2
	negs r1, r1
	cmp r0, r1
	beq _080432BA
	lsls r0, r2, 24
	asrs r1, r0, 24
	movs r0, 0x1
	negs r0, r0
	cmp r1, r0
	beq _08043298
	cmp r1, 0x1
	beq _08043298
	ldr r0, _08043278 @ =gUnknown_0300481C
	mov r9, r0
	ldr r0, [r0]
	ldrb r0, [r0, 0x4]
	movs r1, 0x64
	mov r8, r1
	mov r2, r8
	muls r2, r0
	adds r0, r2, 0
	ldr r6, _0804327C @ =gPlayerParty
	adds r0, r6
	ldr r1, _08043280 @ =gStringVar3
	mov r10, r1
	bl pokemon_get_nick
	mov r2, r9
	ldr r0, [r2]
	ldrb r0, [r0, 0x4]
	mov r1, r8
	muls r1, r0
	adds r0, r1, 0
	adds r0, r6
	movs r1, 0xB
	bl GetMonData
	adds r5, r0, 0
	lsls r5, 16
	lsrs r5, 16
	mov r2, r9
	ldr r0, [r2]
	ldrb r0, [r0, 0x4]
	mov r1, r8
	muls r1, r0
	adds r0, r1, 0
	adds r0, r6
	bl GetMonGender
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	mov r2, r9
	ldr r0, [r2]
	ldrb r0, [r0, 0x4]
	mov r1, r8
	muls r1, r0
	adds r0, r1, 0
	adds r0, r6
	movs r1, 0
	movs r2, 0
	bl GetMonData
	str r0, [sp]
	ldr r0, _08043284 @ =EggHatchSetMonNickname
	str r0, [sp, 0x4]
	movs r0, 0x3
	mov r1, r10
	adds r2, r5, 0
	adds r3, r4, 0
	bl DoNamingScreen
	b _080432BA
	.align 2, 0
_08043278: .4byte gUnknown_0300481C
_0804327C: .4byte gPlayerParty
_08043280: .4byte gStringVar3
_08043284: .4byte EggHatchSetMonNickname
_08043288:
	movs r0, 0x1
	negs r0, r0
	movs r1, 0
	str r1, [sp]
	movs r2, 0
	movs r3, 0x10
	bl BeginNormalPaletteFade
_08043298:
	ldr r0, _080432A4 @ =gUnknown_0300481C
	ldr r1, [r0]
_0804329C:
	ldrb r0, [r1, 0x2]
	adds r0, 0x1
	strb r0, [r1, 0x2]
	b _080432BA
	.align 2, 0
_080432A4: .4byte gUnknown_0300481C
_080432A8:
	ldr r0, _080432DC @ =gPaletteFade
	ldrb r1, [r0, 0x7]
	movs r0, 0x80
	ands r0, r1
	cmp r0, 0
	bne _080432BA
	ldr r0, _080432E0 @ =c2_exit_to_overworld_2_switch
	bl SetMainCallback2
_080432BA:
	bl RunTasks
	bl AnimateSprites
	bl BuildOamBuffer
	bl UpdatePaletteFade
	add sp, 0x8
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_080432DC: .4byte gPaletteFade
_080432E0: .4byte c2_exit_to_overworld_2_switch
	thumb_func_end CB2_EggHatch_1

	thumb_func_start SpriteCB_Egg_0
SpriteCB_Egg_0: @ 80432E4
	push {r4,lr}
	adds r4, r0, 0
	ldrh r0, [r4, 0x2E]
	adds r0, 0x1
	strh r0, [r4, 0x2E]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x14
	ble _08043304
	ldr r0, _08043300 @ =SpriteCB_Egg_1
	str r0, [r4, 0x1C]
	movs r0, 0
	strh r0, [r4, 0x2E]
	b _08043334
	.align 2, 0
_08043300: .4byte SpriteCB_Egg_1
_08043304:
	ldrh r0, [r4, 0x30]
	adds r0, 0x14
	movs r1, 0xFF
	ands r0, r1
	strh r0, [r4, 0x30]
	movs r1, 0x30
	ldrsh r0, [r4, r1]
	movs r1, 0x1
	bl Sin
	strh r0, [r4, 0x24]
	movs r1, 0x2E
	ldrsh r0, [r4, r1]
	cmp r0, 0xF
	bne _08043334
	movs r0, 0x17
	bl PlaySE
	adds r0, r4, 0
	movs r1, 0x1
	bl StartSpriteAnim
	bl CreateRandomEggShardSprite
_08043334:
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end SpriteCB_Egg_0

	thumb_func_start SpriteCB_Egg_1
SpriteCB_Egg_1: @ 804333C
	push {r4,lr}
	adds r4, r0, 0
	ldrh r0, [r4, 0x32]
	adds r0, 0x1
	movs r1, 0
	strh r0, [r4, 0x32]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x1E
	ble _08043398
	ldrh r0, [r4, 0x2E]
	adds r0, 0x1
	strh r0, [r4, 0x2E]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x14
	ble _0804336C
	ldr r0, _08043368 @ =SpriteCB_Egg_2
	str r0, [r4, 0x1C]
	strh r1, [r4, 0x2E]
	strh r1, [r4, 0x32]
	b _08043398
	.align 2, 0
_08043368: .4byte SpriteCB_Egg_2
_0804336C:
	ldrh r0, [r4, 0x30]
	adds r0, 0x14
	movs r1, 0xFF
	ands r0, r1
	strh r0, [r4, 0x30]
	movs r1, 0x30
	ldrsh r0, [r4, r1]
	movs r1, 0x2
	bl Sin
	strh r0, [r4, 0x24]
	movs r1, 0x2E
	ldrsh r0, [r4, r1]
	cmp r0, 0xF
	bne _08043398
	movs r0, 0x17
	bl PlaySE
	adds r0, r4, 0
	movs r1, 0x2
	bl StartSpriteAnim
_08043398:
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end SpriteCB_Egg_1

	thumb_func_start SpriteCB_Egg_2
SpriteCB_Egg_2: @ 80433A0
	push {r4-r6,lr}
	adds r4, r0, 0
	ldrh r0, [r4, 0x32]
	adds r0, 0x1
	movs r6, 0
	strh r0, [r4, 0x32]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x1E
	ble _0804345A
	ldrh r0, [r4, 0x2E]
	adds r0, 0x1
	strh r0, [r4, 0x2E]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x26
	ble _08043418
	ldr r0, _08043404 @ =SpriteCB_Egg_3
	str r0, [r4, 0x1C]
	strh r6, [r4, 0x2E]
	ldr r5, _08043408 @ =gUnknown_0300481C
	ldr r0, [r5]
	ldrb r1, [r0, 0x4]
	movs r0, 0x64
	muls r0, r1
	ldr r1, _0804340C @ =gPlayerParty
	adds r0, r1
	movs r1, 0xB
	bl GetMonData
	lsls r0, 16
	ldr r4, _08043410 @ =gSprites
	ldr r3, [r5]
	ldrb r2, [r3, 0x1]
	lsls r1, r2, 4
	adds r1, r2
	lsls r1, 2
	adds r1, r4
	strh r6, [r1, 0x24]
	ldrb r2, [r3, 0x1]
	lsls r1, r2, 4
	adds r1, r2
	lsls r1, 2
	adds r1, r4
	ldr r2, _08043414 @ =gMonFrontPicCoords
	lsrs r0, 14
	adds r0, r2
	ldrb r0, [r0, 0x1]
	strh r0, [r1, 0x26]
	b _0804345A
	.align 2, 0
_08043404: .4byte SpriteCB_Egg_3
_08043408: .4byte gUnknown_0300481C
_0804340C: .4byte gPlayerParty
_08043410: .4byte gSprites
_08043414: .4byte gMonFrontPicCoords
_08043418:
	ldrh r0, [r4, 0x30]
	adds r0, 0x14
	movs r1, 0xFF
	ands r0, r1
	strh r0, [r4, 0x30]
	movs r1, 0x30
	ldrsh r0, [r4, r1]
	movs r1, 0x2
	bl Sin
	strh r0, [r4, 0x24]
	movs r1, 0x2E
	ldrsh r0, [r4, r1]
	cmp r0, 0xF
	bne _0804344C
	movs r0, 0x17
	bl PlaySE
	adds r0, r4, 0
	movs r1, 0x2
	bl StartSpriteAnim
	bl CreateRandomEggShardSprite
	bl CreateRandomEggShardSprite
_0804344C:
	movs r1, 0x2E
	ldrsh r0, [r4, r1]
	cmp r0, 0x1E
	bne _0804345A
	movs r0, 0x17
	bl PlaySE
_0804345A:
	pop {r4-r6}
	pop {r0}
	bx r0
	thumb_func_end SpriteCB_Egg_2

	thumb_func_start SpriteCB_Egg_3
SpriteCB_Egg_3: @ 8043460
	push {lr}
	adds r1, r0, 0
	ldrh r0, [r1, 0x2E]
	adds r0, 0x1
	strh r0, [r1, 0x2E]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x32
	ble _0804347A
	ldr r0, _08043480 @ =SpriteCB_Egg_4
	str r0, [r1, 0x1C]
	movs r0, 0
	strh r0, [r1, 0x2E]
_0804347A:
	pop {r0}
	bx r0
	.align 2, 0
_08043480: .4byte SpriteCB_Egg_4
	thumb_func_end SpriteCB_Egg_3

	thumb_func_start SpriteCB_Egg_4
SpriteCB_Egg_4: @ 8043484
	push {r4,r5,lr}
	sub sp, 0x4
	adds r5, r0, 0
	movs r1, 0x2E
	ldrsh r0, [r5, r1]
	cmp r0, 0
	bne _080434A4
	movs r1, 0x1
	negs r1, r1
	ldr r0, _080434F8 @ =0x0000ffff
	str r0, [sp]
	adds r0, r1, 0
	movs r2, 0
	movs r3, 0x10
	bl BeginNormalPaletteFade
_080434A4:
	ldrh r0, [r5, 0x2E]
	cmp r0, 0x3
	bhi _080434C0
	movs r4, 0
_080434AC:
	bl CreateRandomEggShardSprite
	lsls r0, r4, 16
	movs r1, 0x80
	lsls r1, 9
	adds r0, r1
	lsrs r4, r0, 16
	asrs r0, 16
	cmp r0, 0x3
	ble _080434AC
_080434C0:
	ldrh r0, [r5, 0x2E]
	adds r0, 0x1
	strh r0, [r5, 0x2E]
	ldr r0, _080434FC @ =gPaletteFade
	ldrb r1, [r0, 0x7]
	movs r0, 0x80
	ands r0, r1
	lsls r0, 24
	lsrs r4, r0, 24
	cmp r4, 0
	bne _080434EE
	movs r0, 0x71
	bl PlaySE
	adds r2, r5, 0
	adds r2, 0x3E
	ldrb r0, [r2]
	movs r1, 0x4
	orrs r0, r1
	strb r0, [r2]
	ldr r0, _08043500 @ =SpriteCB_Egg_5
	str r0, [r5, 0x1C]
	strh r4, [r5, 0x2E]
_080434EE:
	add sp, 0x4
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080434F8: .4byte 0x0000ffff
_080434FC: .4byte gPaletteFade
_08043500: .4byte SpriteCB_Egg_5
	thumb_func_end SpriteCB_Egg_4

	thumb_func_start SpriteCB_Egg_5
SpriteCB_Egg_5: @ 8043504
	push {r4,r5,lr}
	sub sp, 0x4
	adds r5, r0, 0
	movs r1, 0x2E
	ldrsh r0, [r5, r1]
	cmp r0, 0
	bne _08043540
	ldr r4, _08043594 @ =gSprites
	ldr r3, _08043598 @ =gUnknown_0300481C
	ldr r0, [r3]
	ldrb r1, [r0, 0x1]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r4
	adds r0, 0x3E
	ldrb r2, [r0]
	movs r1, 0x5
	negs r1, r1
	ands r1, r2
	strb r1, [r0]
	ldr r0, [r3]
	ldrb r1, [r0, 0x1]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r4
	movs r1, 0x1
	bl StartSpriteAffineAnim
_08043540:
	movs r2, 0x2E
	ldrsh r0, [r5, r2]
	cmp r0, 0x8
	bne _0804355A
	movs r1, 0x1
	negs r1, r1
	ldr r0, _0804359C @ =0x0000ffff
	str r0, [sp]
	adds r0, r1, 0
	movs r2, 0x10
	movs r3, 0
	bl BeginNormalPaletteFade
_0804355A:
	movs r1, 0x2E
	ldrsh r0, [r5, r1]
	cmp r0, 0x9
	bgt _08043578
	ldr r2, _08043594 @ =gSprites
	ldr r0, _08043598 @ =gUnknown_0300481C
	ldr r0, [r0]
	ldrb r1, [r0, 0x1]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r2
	ldrh r1, [r0, 0x22]
	subs r1, 0x1
	strh r1, [r0, 0x22]
_08043578:
	ldrh r1, [r5, 0x2E]
	movs r2, 0x2E
	ldrsh r0, [r5, r2]
	cmp r0, 0x28
	ble _08043586
	ldr r0, _080435A0 @ =SpriteCallbackDummy
	str r0, [r5, 0x1C]
_08043586:
	adds r0, r1, 0x1
	strh r0, [r5, 0x2E]
	add sp, 0x4
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_08043594: .4byte gSprites
_08043598: .4byte gUnknown_0300481C
_0804359C: .4byte 0x0000ffff
_080435A0: .4byte SpriteCallbackDummy
	thumb_func_end SpriteCB_Egg_5

	thumb_func_start SpriteCB_EggShard
SpriteCB_EggShard: @ 80435A4
	push {r4,lr}
	adds r2, r0, 0
	ldrh r0, [r2, 0x30]
	ldrh r1, [r2, 0x36]
	adds r0, r1
	strh r0, [r2, 0x36]
	ldrh r1, [r2, 0x32]
	ldrh r3, [r2, 0x38]
	adds r0, r1, r3
	strh r0, [r2, 0x38]
	movs r4, 0x36
	ldrsh r0, [r2, r4]
	cmp r0, 0
	bge _080435C2
	adds r0, 0xFF
_080435C2:
	asrs r0, 8
	strh r0, [r2, 0x24]
	movs r3, 0x38
	ldrsh r0, [r2, r3]
	cmp r0, 0
	bge _080435D0
	adds r0, 0xFF
_080435D0:
	asrs r0, 8
	strh r0, [r2, 0x26]
	ldrh r0, [r2, 0x34]
	adds r3, r1, r0
	strh r3, [r2, 0x32]
	movs r4, 0x22
	ldrsh r1, [r2, r4]
	movs r4, 0x26
	ldrsh r0, [r2, r4]
	adds r0, r1, r0
	adds r1, 0x14
	cmp r0, r1
	ble _080435F6
	lsls r0, r3, 16
	cmp r0, 0
	ble _080435F6
	adds r0, r2, 0
	bl DestroySprite
_080435F6:
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end SpriteCB_EggShard

	thumb_func_start CreateRandomEggShardSprite
CreateRandomEggShardSprite: @ 80435FC
	push {r4-r6,lr}
	sub sp, 0x8
	ldr r3, _0804364C @ =gEggShardVelocities
	ldr r0, _08043650 @ =gUnknown_0300481C
	ldr r4, [r0]
	adds r4, 0x3A
	ldrb r2, [r4]
	lsls r0, r2, 2
	adds r1, r0, r3
	ldrh r6, [r1]
	adds r3, 0x2
	adds r0, r3
	ldrh r5, [r0]
	adds r2, 0x1
	strb r2, [r4]
	bl Random
	lsls r0, 16
	movs r1, 0xC0
	lsls r1, 10
	ands r1, r0
	lsls r6, 16
	asrs r6, 16
	lsls r5, 16
	asrs r5, 16
	movs r0, 0x64
	str r0, [sp]
	lsrs r1, 16
	str r1, [sp, 0x4]
	movs r0, 0x78
	movs r1, 0x3C
	adds r2, r6, 0
	adds r3, r5, 0
	bl CreateEggShardSprite
	add sp, 0x8
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_0804364C: .4byte gEggShardVelocities
_08043650: .4byte gUnknown_0300481C
	thumb_func_end CreateRandomEggShardSprite

	thumb_func_start CreateEggShardSprite
CreateEggShardSprite: @ 8043654
	push {r4-r6,lr}
	mov r6, r10
	mov r5, r9
	mov r4, r8
	push {r4-r6}
	adds r4, r0, 0
	adds r5, r1, 0
	adds r6, r2, 0
	mov r8, r3
	ldr r0, [sp, 0x1C]
	mov r9, r0
	ldr r1, [sp, 0x20]
	mov r10, r1
	lsls r4, 24
	lsrs r4, 24
	lsls r5, 24
	lsrs r5, 24
	lsls r6, 16
	lsrs r6, 16
	mov r0, r8
	lsls r0, 16
	lsrs r0, 16
	mov r8, r0
	mov r1, r9
	lsls r1, 16
	lsrs r1, 16
	mov r9, r1
	mov r0, r10
	lsls r0, 24
	lsrs r0, 24
	mov r10, r0
	ldr r0, _080436CC @ =gSpriteTemplate_820A418
	adds r1, r4, 0
	adds r2, r5, 0
	movs r3, 0x4
	bl CreateSprite
	adds r1, r0, 0
	lsls r1, 24
	lsrs r1, 24
	ldr r2, _080436D0 @ =gSprites
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r2
	strh r6, [r0, 0x30]
	mov r1, r8
	strh r1, [r0, 0x32]
	mov r1, r9
	strh r1, [r0, 0x34]
	mov r1, r10
	bl StartSpriteAnim
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_080436CC: .4byte gSpriteTemplate_820A418
_080436D0: .4byte gSprites
	thumb_func_end CreateEggShardSprite

	thumb_func_start EggHatchPrintMessage1
EggHatchPrintMessage1: @ 80436D4
	push {lr}
	sub sp, 0x4
	adds r1, r0, 0
	ldr r0, _080436F8 @ =gUnknown_0300481C
	ldr r2, [r0]
	adds r0, r2, 0
	adds r0, 0x8
	adds r2, 0x38
	ldrb r2, [r2]
	movs r3, 0xF
	str r3, [sp]
	movs r3, 0x3
	bl sub_8002EB0
	add sp, 0x4
	pop {r0}
	bx r0
	.align 2, 0
_080436F8: .4byte gUnknown_0300481C
	thumb_func_end EggHatchPrintMessage1

	thumb_func_start EggHatchPrintMessage2
EggHatchPrintMessage2: @ 80436FC
	push {lr}
	sub sp, 0x4
	adds r1, r0, 0
	ldr r0, _08043720 @ =gUnknown_0300481C
	ldr r2, [r0]
	adds r0, r2, 0
	adds r0, 0x8
	adds r2, 0x38
	ldrb r2, [r2]
	movs r3, 0xF
	str r3, [sp]
	movs r3, 0x3
	bl sub_8003460
	add sp, 0x4
	pop {r0}
	bx r0
	.align 2, 0
_08043720: .4byte gUnknown_0300481C
	thumb_func_end EggHatchPrintMessage2

	thumb_func_start EggHatchUpdateWindowText
EggHatchUpdateWindowText: @ 8043724
	push {lr}
	ldr r0, _08043738 @ =gUnknown_0300481C
	ldr r0, [r0]
	adds r0, 0x8
	bl sub_80035AC
	lsls r0, 24
	lsrs r0, 24
	pop {r1}
	bx r1
	.align 2, 0
_08043738: .4byte gUnknown_0300481C
	thumb_func_end EggHatchUpdateWindowText

	.align 2, 0 @ Don't pad with nop.
