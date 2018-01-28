	.include "constants/gba_constants.inc"

	.include "include/macros.inc"

	.syntax unified

	.text
	
	thumb_func_start unref_sub_800D42C
unref_sub_800D42C: @ 800D42C
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	sub sp, 0x24
	mov r9, r0
	str r1, [sp]
	str r2, [sp, 0x4]
	adds r5, r3, 0
	movs r0, 0x1
	mov r1, r9
	ands r0, r1
	cmp r0, 0
	bne _0800D44C
	b _0800D5E4
_0800D44C:
	asrs r0, r1, 1
	adds r0, 0x4
	lsls r0, 24
	lsrs r0, 24
	str r0, [sp, 0x8]
	movs r0, 0
	ldr r2, [sp]
	cmp r0, r2
	blt _0800D460
	b _0800D674
_0800D460:
	movs r4, 0x8
	subs r1, r4, r1
	str r1, [sp, 0x10]
_0800D466:
	movs r7, 0
	adds r0, 0x1
	str r0, [sp, 0x14]
	ldr r0, [sp, 0x10]
	cmp r7, r0
	bge _0800D4E2
	ldr r1, [sp, 0x8]
	lsls r1, 8
	str r1, [sp, 0x18]
	movs r2, 0
	mov r10, r2
	mov r0, r9
	movs r4, 0x8
	subs r0, r4, r0
	str r0, [sp, 0xC]
_0800D484:
	movs r3, 0
	asrs r0, r7, 1
	adds r1, r7, 0
	movs r2, 0x1
	ands r1, r2
	str r1, [sp, 0x20]
	lsls r0, 8
	mov r8, r0
	mov r12, r5
_0800D496:
	lsls r1, r3, 5
	ldr r4, [sp, 0x18]
	adds r0, r5, r4
	adds r0, r1
	mov r1, r8
	adds r2, r0, r1
	mov r1, r12
	add r1, r8
	movs r6, 0xF
_0800D4A8:
	ldr r4, [sp, 0x20]
	cmp r4, 0
	bne _0800D4B8
	strb r4, [r1]
	add r4, sp, 0x20
	ldrb r4, [r4]
	strb r4, [r2, 0x10]
	b _0800D4C6
_0800D4B8:
	mov r0, r10
	strb r0, [r1, 0x10]
	movs r4, 0x80
	lsls r4, 1
	adds r4, r2, r4
	str r4, [sp, 0x1C]
	strb r0, [r4]
_0800D4C6:
	adds r2, 0x1
	adds r1, 0x1
	subs r6, 0x1
	cmp r6, 0
	bge _0800D4A8
	movs r0, 0x20
	add r12, r0
	adds r3, 0x1
	cmp r3, 0x7
	ble _0800D496
	adds r7, 0x1
	ldr r1, [sp, 0xC]
	cmp r7, r1
	blt _0800D484
_0800D4E2:
	movs r7, 0
	movs r2, 0
_0800D4E6:
	movs r6, 0
	adds r4, r7, 0x1
	mov r8, r4
	lsls r4, r7, 5
_0800D4EE:
	adds r0, r6, 0x1
	mov r10, r0
	lsls r1, r6, 8
	adds r0, r1, 0
	adds r0, 0xC0
	adds r0, r5, r0
	adds r0, r4
	adds r1, r5, r1
	adds r1, r4
	movs r3, 0x1F
_0800D502:
	strb r2, [r1]
	strb r2, [r0]
	adds r0, 0x1
	adds r1, 0x1
	subs r3, 0x1
	cmp r3, 0
	bge _0800D502
	mov r6, r10
	cmp r6, 0x7
	ble _0800D4EE
	mov r7, r8
	cmp r7, 0x1
	ble _0800D4E6
	mov r1, r9
	cmp r1, 0x5
	bne _0800D528
	movs r2, 0x90
	lsls r2, 1
	adds r5, r2
_0800D528:
	movs r7, 0
	cmp r7, r9
	bge _0800D5BE
_0800D52E:
	movs r3, 0
	adds r7, 0x1
	mov r8, r7
	cmp r3, r9
	bge _0800D59E
_0800D538:
	adds r3, 0x1
	mov r10, r3
	ldr r4, [sp, 0x4]
	adds r4, 0x20
	adds r7, r5, 0
	adds r7, 0x20
	movs r0, 0x12
	adds r0, r5
	mov r12, r0
	ldr r2, [sp, 0x4]
	adds r3, r5, 0
	movs r6, 0x3
_0800D550:
	ldrb r0, [r2]
	mov r1, r12
	strb r0, [r1]
	ldrb r0, [r2, 0x1]
	strb r0, [r1, 0x1]
	ldrb r0, [r2, 0x2]
	strb r0, [r1, 0x1E]
	ldrb r0, [r2, 0x3]
	strb r0, [r1, 0x1F]
	movs r0, 0x81
	lsls r0, 1
	adds r1, r3, r0
	ldrb r0, [r2, 0x10]
	strb r0, [r1]
	ldr r0, _0800D5A8 @ =0x00000103
	adds r1, r3, r0
	ldrb r0, [r2, 0x11]
	strb r0, [r1]
	movs r0, 0x90
	lsls r0, 1
	adds r1, r3, r0
	ldrb r0, [r2, 0x12]
	strb r0, [r1]
	ldr r0, _0800D5AC @ =0x00000121
	adds r1, r3, r0
	ldrb r0, [r2, 0x13]
	strb r0, [r1]
	movs r1, 0x4
	add r12, r1
	adds r2, 0x4
	adds r3, 0x4
	subs r6, 0x1
	cmp r6, 0
	bge _0800D550
	str r4, [sp, 0x4]
	adds r5, r7, 0
	mov r3, r10
	cmp r3, r9
	blt _0800D538
_0800D59E:
	mov r2, r9
	cmp r2, 0x7
	bne _0800D5B0
	adds r5, 0x20
	b _0800D5B8
	.align 2, 0
_0800D5A8: .4byte 0x00000103
_0800D5AC: .4byte 0x00000121
_0800D5B0:
	mov r4, r9
	cmp r4, 0x5
	bne _0800D5B8
	adds r5, 0x60
_0800D5B8:
	mov r7, r8
	cmp r7, r9
	blt _0800D52E
_0800D5BE:
	mov r0, r9
	cmp r0, 0x7
	bne _0800D5CC
	movs r1, 0x80
	lsls r1, 1
	adds r5, r1
	b _0800D5D8
_0800D5CC:
	mov r2, r9
	cmp r2, 0x5
	bne _0800D5D8
	movs r4, 0xF0
	lsls r4, 1
	adds r5, r4
_0800D5D8:
	ldr r0, [sp, 0x14]
	ldr r1, [sp]
	cmp r0, r1
	bge _0800D5E2
	b _0800D466
_0800D5E2:
	b _0800D674
_0800D5E4:
	movs r6, 0
	ldr r2, [sp]
	cmp r6, r2
	bge _0800D674
_0800D5EC:
	adds r6, 0x1
	mov r10, r6
	mov r4, r9
	cmp r4, 0x6
	bne _0800D604
	movs r0, 0
	movs r3, 0xFF
_0800D5FA:
	strb r0, [r5]
	adds r5, 0x1
	subs r3, 0x1
	cmp r3, 0
	bge _0800D5FA
_0800D604:
	movs r7, 0
	cmp r7, r9
	bge _0800D658
_0800D60A:
	adds r7, 0x1
	mov r8, r7
	mov r1, r9
	lsls r0, r1, 5
	cmp r1, 0x6
	bne _0800D624
	movs r1, 0
	movs r3, 0x1F
_0800D61A:
	strb r1, [r5]
	adds r5, 0x1
	subs r3, 0x1
	cmp r3, 0
	bge _0800D61A
_0800D624:
	adds r1, r0, 0
	cmp r1, 0
	ble _0800D63E
	adds r3, r1, 0
_0800D62C:
	ldr r2, [sp, 0x4]
	ldrb r0, [r2]
	strb r0, [r5]
	adds r2, 0x1
	str r2, [sp, 0x4]
	adds r5, 0x1
	subs r3, 0x1
	cmp r3, 0
	bne _0800D62C
_0800D63E:
	mov r4, r9
	cmp r4, 0x6
	bne _0800D652
	movs r0, 0
	movs r3, 0x1F
_0800D648:
	strb r0, [r5]
	adds r5, 0x1
	subs r3, 0x1
	cmp r3, 0
	bge _0800D648
_0800D652:
	mov r7, r8
	cmp r7, r9
	blt _0800D60A
_0800D658:
	mov r0, r9
	cmp r0, 0x6
	bne _0800D66C
	movs r0, 0
	movs r3, 0xFF
_0800D662:
	strb r0, [r5]
	adds r5, 0x1
	subs r3, 0x1
	cmp r3, 0
	bge _0800D662
_0800D66C:
	mov r6, r10
	ldr r1, [sp]
	cmp r6, r1
	blt _0800D5EC
_0800D674:
	add sp, 0x24
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	thumb_func_end unref_sub_800D42C

	thumb_func_start unref_sub_800D684
unref_sub_800D684: @ 800D684
	push {lr}
	bl ResetSpriteData
	ldr r0, _0800D6B8 @ =gSpriteTemplate_81F96D0
	movs r1, 0
	movs r2, 0
	movs r3, 0
	bl CreateSprite
	lsls r0, 24
	lsrs r0, 24
	ldr r2, _0800D6BC @ =gSprites
	lsls r1, r0, 4
	adds r1, r0
	lsls r1, 2
	adds r1, r2
	adds r1, 0x3E
	ldrb r0, [r1]
	movs r2, 0x4
	orrs r0, r2
	strb r0, [r1]
	ldr r0, _0800D6C0 @ =sub_800D6C4
	bl SetMainCallback2
	pop {r0}
	bx r0
	.align 2, 0
_0800D6B8: .4byte gSpriteTemplate_81F96D0
_0800D6BC: .4byte gSprites
_0800D6C0: .4byte sub_800D6C4
	thumb_func_end unref_sub_800D684

	thumb_func_start sub_800D6C4
sub_800D6C4: @ 800D6C4
	push {lr}
	bl AnimateSprites
	bl BuildOamBuffer
	pop {r0}
	bx r0
	thumb_func_end sub_800D6C4

	thumb_func_start sub_800D6D4
sub_800D6D4: @ 800D6D4
	push {r4,r5,lr}
	ldr r3, _0800D72C @ =0x04000208
	ldrh r2, [r3]
	movs r5, 0
	strh r5, [r3]
	ldr r4, _0800D730 @ =0x04000200
	ldrh r0, [r4]
	movs r1, 0x1
	orrs r0, r1
	strh r0, [r4]
	strh r2, [r3]
	ldr r1, _0800D734 @ =REG_DISPSTAT
	movs r0, 0x8
	strh r0, [r1]
	adds r1, 0x4
	movs r2, 0x98
	lsls r2, 8
	adds r0, r2, 0
	strh r0, [r1]
	adds r1, 0x2
	ldr r2, _0800D738 @ =0x00009c04
	adds r0, r2, 0
	strh r0, [r1]
	adds r1, 0x2
	ldr r2, _0800D73C @ =0x00005e05
	adds r0, r2, 0
	strh r0, [r1]
	adds r1, 0x2
	ldr r2, _0800D740 @ =0x00005a0b
	adds r0, r2, 0
	strh r0, [r1]
	ldr r0, _0800D744 @ =REG_BLDCNT
	strh r5, [r0]
	adds r0, 0x2
	strh r5, [r0]
	adds r0, 0x2
	strh r5, [r0]
	subs r1, 0xE
	ldr r2, _0800D748 @ =0x0000bf40
	adds r0, r2, 0
	strh r0, [r1]
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_0800D72C: .4byte 0x04000208
_0800D730: .4byte 0x04000200
_0800D734: .4byte REG_DISPSTAT
_0800D738: .4byte 0x00009c04
_0800D73C: .4byte 0x00005e05
_0800D740: .4byte 0x00005a0b
_0800D744: .4byte REG_BLDCNT
_0800D748: .4byte 0x0000bf40
	thumb_func_end sub_800D6D4

	thumb_func_start sub_800D74C
sub_800D74C: @ 800D74C
	push {r4,lr}
	movs r0, 0x12
	bl TextWindow_SetBaseTileNum
	ldr r4, _0800D79C @ =gUnknown_03004210
	adds r0, r4, 0
	movs r1, 0x1
	bl TextWindow_LoadStdFrameGraphicsOverridePal
	movs r0, 0x22
	bl TextWindow_SetBaseTileNum
	adds r0, r4, 0
	movs r1, 0x1
	bl TextWindow_LoadStdFrameGraphicsOverridePal
	ldr r3, _0800D7A0 @ =gPlttBufferUnfaded
	adds r0, r3, 0
	adds r0, 0xB8
	ldr r1, _0800D7A4 @ =0x00007fe0
	strh r1, [r0]
	adds r2, r3, 0
	adds r2, 0xBA
	ldr r1, _0800D7A8 @ =0x00002529
	strh r1, [r2]
	adds r2, 0x2
	ldr r1, _0800D7AC @ =0x00007fff
	strh r1, [r2]
	adds r2, 0x2
	ldr r1, _0800D7B0 @ =0x0000675a
	strh r1, [r2]
	ldr r1, _0800D7B4 @ =gPlttBufferFaded + 0xB8
	movs r2, 0x4
	bl CpuSet
	bl sub_8032A38
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0800D79C: .4byte gUnknown_03004210
_0800D7A0: .4byte gPlttBufferUnfaded
_0800D7A4: .4byte 0x00007fe0
_0800D7A8: .4byte 0x00002529
_0800D7AC: .4byte 0x00007fff
_0800D7B0: .4byte 0x0000675a
_0800D7B4: .4byte gPlttBufferFaded + 0xB8
	thumb_func_end sub_800D74C

	thumb_func_start DrawMainBattleBackground
DrawMainBattleBackground: @ 800D7B8
	push {r4,r5,lr}
	ldr r0, _0800D7DC @ =gBattleTypeFlags
	ldrh r1, [r0]
	ldr r0, _0800D7E0 @ =0x00000902
	ands r0, r1
	cmp r0, 0
	beq _0800D7F8
	ldr r0, _0800D7E4 @ =gBattleTerrainTiles_Building
	ldr r1, _0800D7E8 @ =0x06008000
	bl LZDecompressVram
	ldr r0, _0800D7EC @ =gBattleTerrainTilemap_Building
	ldr r1, _0800D7F0 @ =0x0600d000
	bl LZDecompressVram
	ldr r0, _0800D7F4 @ =gBattleTerrainPalette_BattleTower
	b _0800DA66
	.align 2, 0
_0800D7DC: .4byte gBattleTypeFlags
_0800D7E0: .4byte 0x00000902
_0800D7E4: .4byte gBattleTerrainTiles_Building
_0800D7E8: .4byte 0x06008000
_0800D7EC: .4byte gBattleTerrainTilemap_Building
_0800D7F0: .4byte 0x0600d000
_0800D7F4: .4byte gBattleTerrainPalette_BattleTower
_0800D7F8:
	movs r0, 0x80
	lsls r0, 5
	ands r0, r1
	cmp r0, 0
	beq _0800D860
	ldr r0, _0800D820 @ =gGameVersion
	ldrb r0, [r0]
	cmp r0, 0x2
	bne _0800D838
	ldr r0, _0800D824 @ =gBattleTerrainTiles_Cave
	ldr r1, _0800D828 @ =0x06008000
	bl LZDecompressVram
	ldr r0, _0800D82C @ =gBattleTerrainTilemap_Cave
	ldr r1, _0800D830 @ =0x0600d000
	bl LZDecompressVram
	ldr r0, _0800D834 @ =gBattleTerrainPalette_Groudon
	b _0800DA66
	.align 2, 0
_0800D820: .4byte gGameVersion
_0800D824: .4byte gBattleTerrainTiles_Cave
_0800D828: .4byte 0x06008000
_0800D82C: .4byte gBattleTerrainTilemap_Cave
_0800D830: .4byte 0x0600d000
_0800D834: .4byte gBattleTerrainPalette_Groudon
_0800D838:
	ldr r0, _0800D84C @ =gBattleTerrainTiles_Water
	ldr r1, _0800D850 @ =0x06008000
	bl LZDecompressVram
	ldr r0, _0800D854 @ =gBattleTerrainTilemap_Water
	ldr r1, _0800D858 @ =0x0600d000
	bl LZDecompressVram
	ldr r0, _0800D85C @ =gBattleTerrainPalette_Kyogre
	b _0800DA66
	.align 2, 0
_0800D84C: .4byte gBattleTerrainTiles_Water
_0800D850: .4byte 0x06008000
_0800D854: .4byte gBattleTerrainTilemap_Water
_0800D858: .4byte 0x0600d000
_0800D85C: .4byte gBattleTerrainPalette_Kyogre
_0800D860:
	movs r0, 0x8
	ands r0, r1
	cmp r0, 0
	beq _0800D8D8
	ldr r2, _0800D890 @ =gTrainers
	ldr r0, _0800D894 @ =gTrainerBattleOpponent
	ldrh r1, [r0]
	lsls r0, r1, 2
	adds r0, r1
	lsls r0, 3
	adds r0, r2
	ldrb r0, [r0, 0x1]
	cmp r0, 0x19
	bne _0800D8AC
	ldr r0, _0800D898 @ =gBattleTerrainTiles_Building
	ldr r1, _0800D89C @ =0x06008000
	bl LZDecompressVram
	ldr r0, _0800D8A0 @ =gBattleTerrainTilemap_Building
	ldr r1, _0800D8A4 @ =0x0600d000
	bl LZDecompressVram
	ldr r0, _0800D8A8 @ =gBattleTerrainPalette_BuildingLeader
	b _0800DA66
	.align 2, 0
_0800D890: .4byte gTrainers
_0800D894: .4byte gTrainerBattleOpponent
_0800D898: .4byte gBattleTerrainTiles_Building
_0800D89C: .4byte 0x06008000
_0800D8A0: .4byte gBattleTerrainTilemap_Building
_0800D8A4: .4byte 0x0600d000
_0800D8A8: .4byte gBattleTerrainPalette_BuildingLeader
_0800D8AC:
	cmp r0, 0x20
	bne _0800D8D8
	ldr r0, _0800D8C4 @ =gBattleTerrainTiles_Stadium
	ldr r1, _0800D8C8 @ =0x06008000
	bl LZDecompressVram
	ldr r0, _0800D8CC @ =gBattleTerrainTilemap_Stadium
	ldr r1, _0800D8D0 @ =0x0600d000
	bl LZDecompressVram
	ldr r0, _0800D8D4 @ =gBattleTerrainPalette_StadiumSteven
	b _0800DA66
	.align 2, 0
_0800D8C4: .4byte gBattleTerrainTiles_Stadium
_0800D8C8: .4byte 0x06008000
_0800D8CC: .4byte gBattleTerrainTilemap_Stadium
_0800D8D0: .4byte 0x0600d000
_0800D8D4: .4byte gBattleTerrainPalette_StadiumSteven
_0800D8D8:
	bl sav1_map_get_battletype
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x8
	bls _0800D8E6
	b _0800DA9E
_0800D8E6:
	lsls r0, 2
	ldr r1, _0800D8F0 @ =_0800D8F4
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_0800D8F0: .4byte _0800D8F4
	.align 2, 0
_0800D8F4:
	.4byte _0800D918
	.4byte _0800D964
	.4byte _0800D98C
	.4byte _0800D9B4
	.4byte _0800D9DC
	.4byte _0800DA04
	.4byte _0800DA2C
	.4byte _0800DA54
	.4byte _0800DA84
_0800D918:
	ldr r4, _0800D954 @ =gBattleTerrainTable
	ldr r5, _0800D958 @ =gBattleTerrain
	ldrb r1, [r5]
	lsls r0, r1, 2
	adds r0, r1
	lsls r0, 2
	adds r0, r4
	ldr r0, [r0]
	ldr r1, _0800D95C @ =0x06008000
	bl LZDecompressVram
	ldrb r1, [r5]
	lsls r0, r1, 2
	adds r0, r1
	lsls r0, 2
	adds r1, r4, 0x4
	adds r0, r1
	ldr r0, [r0]
	ldr r1, _0800D960 @ =0x0600d000
	bl LZDecompressVram
	ldrb r1, [r5]
	lsls r0, r1, 2
	adds r0, r1
	lsls r0, 2
	adds r4, 0x10
	adds r0, r4
	ldr r0, [r0]
	b _0800DA66
	.align 2, 0
_0800D954: .4byte gBattleTerrainTable
_0800D958: .4byte gBattleTerrain
_0800D95C: .4byte 0x06008000
_0800D960: .4byte 0x0600d000
_0800D964:
	ldr r0, _0800D978 @ =gBattleTerrainTiles_Building
	ldr r1, _0800D97C @ =0x06008000
	bl LZDecompressVram
	ldr r0, _0800D980 @ =gBattleTerrainTilemap_Building
	ldr r1, _0800D984 @ =0x0600d000
	bl LZDecompressVram
	ldr r0, _0800D988 @ =gBattleTerrainPalette_BuildingGym
	b _0800DA66
	.align 2, 0
_0800D978: .4byte gBattleTerrainTiles_Building
_0800D97C: .4byte 0x06008000
_0800D980: .4byte gBattleTerrainTilemap_Building
_0800D984: .4byte 0x0600d000
_0800D988: .4byte gBattleTerrainPalette_BuildingGym
_0800D98C:
	ldr r0, _0800D9A0 @ =gBattleTerrainTiles_Stadium
	ldr r1, _0800D9A4 @ =0x06008000
	bl LZDecompressVram
	ldr r0, _0800D9A8 @ =gBattleTerrainTilemap_Stadium
	ldr r1, _0800D9AC @ =0x0600d000
	bl LZDecompressVram
	ldr r0, _0800D9B0 @ =gBattleTerrainPalette_StadiumMagma
	b _0800DA66
	.align 2, 0
_0800D9A0: .4byte gBattleTerrainTiles_Stadium
_0800D9A4: .4byte 0x06008000
_0800D9A8: .4byte gBattleTerrainTilemap_Stadium
_0800D9AC: .4byte 0x0600d000
_0800D9B0: .4byte gBattleTerrainPalette_StadiumMagma
_0800D9B4:
	ldr r0, _0800D9C8 @ =gBattleTerrainTiles_Stadium
	ldr r1, _0800D9CC @ =0x06008000
	bl LZDecompressVram
	ldr r0, _0800D9D0 @ =gBattleTerrainTilemap_Stadium
	ldr r1, _0800D9D4 @ =0x0600d000
	bl LZDecompressVram
	ldr r0, _0800D9D8 @ =gBattleTerrainPalette_StadiumAqua
	b _0800DA66
	.align 2, 0
_0800D9C8: .4byte gBattleTerrainTiles_Stadium
_0800D9CC: .4byte 0x06008000
_0800D9D0: .4byte gBattleTerrainTilemap_Stadium
_0800D9D4: .4byte 0x0600d000
_0800D9D8: .4byte gBattleTerrainPalette_StadiumAqua
_0800D9DC:
	ldr r0, _0800D9F0 @ =gBattleTerrainTiles_Stadium
	ldr r1, _0800D9F4 @ =0x06008000
	bl LZDecompressVram
	ldr r0, _0800D9F8 @ =gBattleTerrainTilemap_Stadium
	ldr r1, _0800D9FC @ =0x0600d000
	bl LZDecompressVram
	ldr r0, _0800DA00 @ =gBattleTerrainPalette_StadiumSidney
	b _0800DA66
	.align 2, 0
_0800D9F0: .4byte gBattleTerrainTiles_Stadium
_0800D9F4: .4byte 0x06008000
_0800D9F8: .4byte gBattleTerrainTilemap_Stadium
_0800D9FC: .4byte 0x0600d000
_0800DA00: .4byte gBattleTerrainPalette_StadiumSidney
_0800DA04:
	ldr r0, _0800DA18 @ =gBattleTerrainTiles_Stadium
	ldr r1, _0800DA1C @ =0x06008000
	bl LZDecompressVram
	ldr r0, _0800DA20 @ =gBattleTerrainTilemap_Stadium
	ldr r1, _0800DA24 @ =0x0600d000
	bl LZDecompressVram
	ldr r0, _0800DA28 @ =gBattleTerrainPalette_StadiumPhoebe
	b _0800DA66
	.align 2, 0
_0800DA18: .4byte gBattleTerrainTiles_Stadium
_0800DA1C: .4byte 0x06008000
_0800DA20: .4byte gBattleTerrainTilemap_Stadium
_0800DA24: .4byte 0x0600d000
_0800DA28: .4byte gBattleTerrainPalette_StadiumPhoebe
_0800DA2C:
	ldr r0, _0800DA40 @ =gBattleTerrainTiles_Stadium
	ldr r1, _0800DA44 @ =0x06008000
	bl LZDecompressVram
	ldr r0, _0800DA48 @ =gBattleTerrainTilemap_Stadium
	ldr r1, _0800DA4C @ =0x0600d000
	bl LZDecompressVram
	ldr r0, _0800DA50 @ =gBattleTerrainPalette_StadiumGlacia
	b _0800DA66
	.align 2, 0
_0800DA40: .4byte gBattleTerrainTiles_Stadium
_0800DA44: .4byte 0x06008000
_0800DA48: .4byte gBattleTerrainTilemap_Stadium
_0800DA4C: .4byte 0x0600d000
_0800DA50: .4byte gBattleTerrainPalette_StadiumGlacia
_0800DA54:
	ldr r0, _0800DA70 @ =gBattleTerrainTiles_Stadium
	ldr r1, _0800DA74 @ =0x06008000
	bl LZDecompressVram
	ldr r0, _0800DA78 @ =gBattleTerrainTilemap_Stadium
	ldr r1, _0800DA7C @ =0x0600d000
	bl LZDecompressVram
	ldr r0, _0800DA80 @ =gBattleTerrainPalette_StadiumDrake
_0800DA66:
	movs r1, 0x20
	movs r2, 0x60
	bl LoadCompressedPalette
	b _0800DA9E
	.align 2, 0
_0800DA70: .4byte gBattleTerrainTiles_Stadium
_0800DA74: .4byte 0x06008000
_0800DA78: .4byte gBattleTerrainTilemap_Stadium
_0800DA7C: .4byte 0x0600d000
_0800DA80: .4byte gBattleTerrainPalette_StadiumDrake
_0800DA84:
	ldr r0, _0800DAA4 @ =gBattleTerrainTiles_Building
	ldr r1, _0800DAA8 @ =0x06008000
	bl LZDecompressVram
	ldr r0, _0800DAAC @ =gBattleTerrainTilemap_Building
	ldr r1, _0800DAB0 @ =0x0600d000
	bl LZDecompressVram
	ldr r0, _0800DAB4 @ =gBattleTerrainPalette_BattleTower
	movs r1, 0x20
	movs r2, 0x60
	bl LoadCompressedPalette
_0800DA9E:
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_0800DAA4: .4byte gBattleTerrainTiles_Building
_0800DAA8: .4byte 0x06008000
_0800DAAC: .4byte gBattleTerrainTilemap_Building
_0800DAB0: .4byte 0x0600d000
_0800DAB4: .4byte gBattleTerrainPalette_BattleTower
	thumb_func_end DrawMainBattleBackground

	thumb_func_start sub_800DAB8
sub_800DAB8: @ 800DAB8
	push {lr}
	ldr r0, _0800DAE8 @ =gUnknown_08D00000
	movs r1, 0xC0
	lsls r1, 19
	bl LZDecompressVram
	ldr r0, _0800DAEC @ =gUnknown_08D00524
	ldr r1, _0800DAF0 @ =0x0600c000
	movs r2, 0x80
	lsls r2, 4
	bl CpuSet
	ldr r0, _0800DAF4 @ =gUnknown_08D004E0
	movs r1, 0
	movs r2, 0x40
	bl LoadCompressedPalette
	bl sub_800D74C
	bl DrawMainBattleBackground
	pop {r0}
	bx r0
	.align 2, 0
_0800DAE8: .4byte gUnknown_08D00000
_0800DAEC: .4byte gUnknown_08D00524
_0800DAF0: .4byte 0x0600c000
_0800DAF4: .4byte gUnknown_08D004E0
	thumb_func_end sub_800DAB8

	thumb_func_start sub_800DAF8
sub_800DAF8: @ 800DAF8
	push {r4-r7,lr}
	sub sp, 0xC
	adds r7, r2, 0
	lsls r0, 24
	lsrs r2, r0, 24
	adds r5, r2, 0
	lsls r1, 24
	lsrs r3, r1, 24
	movs r4, 0
	ldr r0, _0800DB38 @ =gBattleTypeFlags
	ldrh r1, [r0]
	movs r0, 0x40
	ands r0, r1
	cmp r0, 0
	beq _0800DBB4
	ldr r0, _0800DB3C @ =gTasks
	lsls r1, r2, 2
	adds r1, r2
	lsls r1, 3
	adds r1, r0
	movs r2, 0x12
	ldrsh r0, [r1, r2]
	cmp r0, 0
	beq _0800DB52
	cmp r3, 0x1
	beq _0800DB7A
	cmp r3, 0x1
	bgt _0800DB40
	cmp r3, 0
	beq _0800DB4A
	b _0800DB84
	.align 2, 0
_0800DB38: .4byte gBattleTypeFlags
_0800DB3C: .4byte gTasks
_0800DB40:
	cmp r3, 0x2
	beq _0800DB4E
	cmp r3, 0x3
	beq _0800DB6E
	b _0800DB84
_0800DB4A:
	ldrh r0, [r1, 0xE]
	b _0800DB70
_0800DB4E:
	ldrh r1, [r1, 0xE]
	b _0800DB7C
_0800DB52:
	cmp r3, 0x1
	beq _0800DB6E
	cmp r3, 0x1
	bgt _0800DB60
	cmp r3, 0
	beq _0800DB6A
	b _0800DB84
_0800DB60:
	cmp r3, 0x2
	beq _0800DB76
	cmp r3, 0x3
	beq _0800DB7A
	b _0800DB84
_0800DB6A:
	ldrh r0, [r1, 0xE]
	b _0800DB70
_0800DB6E:
	ldrh r0, [r1, 0x10]
_0800DB70:
	movs r4, 0x3F
	ands r4, r0
	b _0800DB84
_0800DB76:
	ldrh r1, [r1, 0xE]
	b _0800DB7C
_0800DB7A:
	ldrh r1, [r1, 0x10]
_0800DB7C:
	movs r0, 0xFC
	lsls r0, 4
	ands r0, r1
	lsrs r4, r0, 6
_0800DB84:
	movs r3, 0
	movs r6, 0x3
	ldr r0, _0800DBB0 @ =0x00006001
	adds r5, r0, 0
	mov r2, sp
_0800DB8E:
	lsls r1, r3, 1
	adds r0, r6, 0
	lsls r0, r1
	ands r0, r4
	asrs r0, r1
	adds r0, r5
	strh r0, [r2]
	adds r2, 0x2
	adds r3, 0x1
	cmp r3, 0x2
	ble _0800DB8E
	mov r0, sp
	adds r1, r7, 0
	movs r2, 0x3
	bl CpuSet
	b _0800DC12
	.align 2, 0
_0800DBB0: .4byte 0x00006001
_0800DBB4:
	ldr r0, _0800DBD0 @ =gSharedMem
	ldr r1, _0800DBD4 @ =0x000160cb
	adds r0, r1
	ldrb r0, [r0]
	cmp r3, r0
	bne _0800DBDC
	ldr r1, _0800DBD8 @ =gTasks
	lsls r0, r2, 2
	adds r0, r2
	lsls r0, 3
	adds r0, r1
	ldrh r4, [r0, 0xE]
	b _0800DBE8
	.align 2, 0
_0800DBD0: .4byte gSharedMem
_0800DBD4: .4byte 0x000160cb
_0800DBD8: .4byte gTasks
_0800DBDC:
	ldr r1, _0800DC1C @ =gTasks
	lsls r0, r5, 2
	adds r0, r5
	lsls r0, 3
	adds r0, r1
	ldrh r4, [r0, 0x10]
_0800DBE8:
	movs r3, 0
	movs r6, 0x3
	ldr r2, _0800DC20 @ =0x00006001
	adds r5, r2, 0
	mov r2, sp
_0800DBF2:
	lsls r1, r3, 1
	adds r0, r6, 0
	lsls r0, r1
	ands r0, r4
	asrs r0, r1
	adds r0, r5
	strh r0, [r2]
	adds r2, 0x2
	adds r3, 0x1
	cmp r3, 0x5
	ble _0800DBF2
	mov r0, sp
	adds r1, r7, 0
	movs r2, 0x6
	bl CpuSet
_0800DC12:
	add sp, 0xC
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_0800DC1C: .4byte gTasks
_0800DC20: .4byte 0x00006001
	thumb_func_end sub_800DAF8
