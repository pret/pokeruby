	.include "constants/gba_constants.inc"
	.include "constants/misc_constants.inc"
	.include "constants/species_constants.inc"
	.include "asm/macros.inc"

	.syntax unified

	.text

	thumb_func_start special_0x44
special_0x44: @ 80BD800
	push {r4-r7,lr}
	mov r7, r9
	mov r6, r8
	push {r6,r7}
	movs r4, 0x5
	ldr r1, _080BD874 @ =gSaveBlock1
	ldr r2, _080BD878 @ =0x000027ec
	adds r0, r1, r2
	ldrb r0, [r0]
	cmp r0, 0
	beq _080BD834
	adds r2, r1, 0
	ldr r1, _080BD87C @ =0x00002738
_080BD81A:
	adds r0, r4, 0x1
	lsls r0, 24
	lsrs r4, r0, 24
	cmp r4, 0x17
	bhi _080BD834
	lsls r0, r4, 3
	adds r0, r4
	lsls r0, 2
	adds r0, r2
	adds r0, r1
	ldrb r0, [r0]
	cmp r0, 0
	bne _080BD81A
_080BD834:
	bl Random
	lsls r0, 16
	lsrs r0, 16
	adds r1, r4, 0
	bl __modsi3
	lsls r0, 24
	lsrs r4, r0, 24
	mov r8, r4
	ldr r7, _080BD874 @ =gSaveBlock1
	ldr r0, _080BD87C @ =0x00002738
	adds r0, r7
	mov r9, r0
_080BD850:
	lsls r0, r4, 3
	adds r0, r4
	lsls r6, r0, 2
	adds r5, r6, r7
	ldr r1, _080BD87C @ =0x00002738
	adds r0, r5, r1
	ldrb r0, [r0]
	bl sub_80BFB54
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x4
	beq _080BD884
	ldr r2, _080BD880 @ =0x00002739
	adds r0, r5, r2
	ldrb r0, [r0]
	b _080BD890
	.align 2, 0
_080BD874: .4byte gSaveBlock1
_080BD878: .4byte 0x000027ec
_080BD87C: .4byte 0x00002738
_080BD880: .4byte 0x00002739
_080BD884:
	mov r0, r9
	adds r1, r6, r0
	ldrh r0, [r1, 0x16]
	cmp r0, 0
	bne _080BD898
	ldrb r0, [r1, 0x1]
_080BD890:
	cmp r0, 0x1
	bne _080BD898
	adds r0, r4, 0
	b _080BD8AC
_080BD898:
	cmp r4, 0
	bne _080BD8A0
	movs r4, 0x17
	b _080BD8A6
_080BD8A0:
	subs r0, r4, 0x1
	lsls r0, 24
	lsrs r4, r0, 24
_080BD8A6:
	cmp r4, r8
	bne _080BD850
	movs r0, 0xFF
_080BD8AC:
	pop {r3,r4}
	mov r8, r3
	mov r9, r4
	pop {r4-r7}
	pop {r1}
	bx r1
	thumb_func_end special_0x44

	thumb_func_start sub_80BD8B8
sub_80BD8B8: @ 80BD8B8
	push {lr}
	bl special_0x44
	lsls r0, 24
	lsrs r1, r0, 24
	cmp r1, 0xFF
	bne _080BD8CA
	movs r0, 0xFF
	b _080BD902
_080BD8CA:
	ldr r2, _080BD8F4 @ =gSaveBlock1
	ldr r3, _080BD8F8 @ =0x00002afc
	adds r0, r2, r3
	ldrh r0, [r0]
	cmp r0, 0
	beq _080BD900
	lsls r0, r1, 3
	adds r0, r1
	lsls r0, 2
	adds r0, r2
	ldr r2, _080BD8FC @ =0x00002738
	adds r0, r2
	ldrb r0, [r0]
	cmp r0, 0x29
	bne _080BD900
	bl sub_80BDA30
	lsls r0, 24
	lsrs r0, 24
	b _080BD902
	.align 2, 0
_080BD8F4: .4byte gSaveBlock1
_080BD8F8: .4byte 0x00002afc
_080BD8FC: .4byte 0x00002738
_080BD900:
	adds r0, r1, 0
_080BD902:
	pop {r1}
	bx r1
	thumb_func_end sub_80BD8B8

	thumb_func_start UpdateTVScreensOnMap
UpdateTVScreensOnMap: @ 80BD908
	push {r4,r5,lr}
	adds r4, r0, 0
	adds r5, r1, 0
	ldr r0, _080BD938 @ =0x00000831
	bl FlagSet
	bl CheckForBigMovieOrEmergencyNewsOnTV
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	beq _080BD92C
	cmp r0, 0x2
	beq _080BD97E
	ldr r0, _080BD93C @ =gSaveBlock1
	ldrh r0, [r0, 0x4]
	cmp r0, 0xD
	bne _080BD940
_080BD92C:
	adds r0, r4, 0
	adds r1, r5, 0
	movs r2, 0x3
	bl SetTVMetatilesOnMap
	b _080BD97E
	.align 2, 0
_080BD938: .4byte 0x00000831
_080BD93C: .4byte gSaveBlock1
_080BD940:
	ldr r0, _080BD984 @ =0x00000832
	bl FlagGet
	lsls r0, 24
	cmp r0, 0
	beq _080BD97E
	bl sub_80BD8B8
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0xFF
	bne _080BD96E
	bl sub_80BECA0
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0xFF
	bne _080BD96E
	bl IsTVShowInSearchOfTrainersAiring
	lsls r0, 24
	cmp r0, 0
	beq _080BD97E
_080BD96E:
	ldr r0, _080BD988 @ =0x00000831
	bl FlagReset
	adds r0, r4, 0
	adds r1, r5, 0
	movs r2, 0x3
	bl SetTVMetatilesOnMap
_080BD97E:
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080BD984: .4byte 0x00000832
_080BD988: .4byte 0x00000831
	thumb_func_end UpdateTVScreensOnMap

	thumb_func_start SetTVMetatilesOnMap
SetTVMetatilesOnMap: @ 80BD98C
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	mov r9, r0
	mov r10, r1
	lsls r2, 16
	lsrs r2, 16
	movs r5, 0
	cmp r5, r10
	bge _080BD9E0
	movs r1, 0xC0
	lsls r1, 4
	adds r0, r1, 0
	mov r8, r2
	mov r1, r8
	orrs r1, r0
	mov r8, r1
_080BD9B2:
	movs r4, 0
	adds r7, r5, 0x1
	cmp r4, r9
	bge _080BD9DA
	mov r0, r8
	lsls r6, r0, 16
_080BD9BE:
	adds r0, r4, 0
	adds r1, r5, 0
	bl MapGridGetMetatileBehaviorAt
	cmp r0, 0x86
	bne _080BD9D4
	adds r0, r4, 0
	adds r1, r5, 0
	lsrs r2, r6, 16
	bl MapGridSetMetatileIdAt
_080BD9D4:
	adds r4, 0x1
	cmp r4, r9
	blt _080BD9BE
_080BD9DA:
	adds r5, r7, 0
	cmp r5, r10
	blt _080BD9B2
_080BD9E0:
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	thumb_func_end SetTVMetatilesOnMap

	thumb_func_start TurnOffTVScreen
TurnOffTVScreen: @ 80BD9F0
	push {lr}
	ldr r1, _080BDA08 @ =gUnknown_03004870
	ldr r0, [r1]
	ldr r1, [r1, 0x4]
	movs r2, 0x2
	bl SetTVMetatilesOnMap
	bl DrawWholeMapView
	pop {r0}
	bx r0
	.align 2, 0
_080BDA08: .4byte gUnknown_03004870
	thumb_func_end TurnOffTVScreen

	thumb_func_start sub_80BDA0C
sub_80BDA0C: @ 80BDA0C
	ldr r2, _080BDA24 @ =gSaveBlock1
	ldr r0, _080BDA28 @ =gSpecialVar_0x8004
	ldrh r1, [r0]
	lsls r0, r1, 3
	adds r0, r1
	lsls r0, 2
	adds r0, r2
	ldr r1, _080BDA2C @ =0x00002738
	adds r0, r1
	ldrb r0, [r0]
	bx lr
	.align 2, 0
_080BDA24: .4byte gSaveBlock1
_080BDA28: .4byte gSpecialVar_0x8004
_080BDA2C: .4byte 0x00002738
	thumb_func_end sub_80BDA0C

	thumb_func_start sub_80BDA30
sub_80BDA30: @ 80BDA30
	push {r4,lr}
	movs r2, 0
	ldr r3, _080BDA5C @ =gSaveBlock1
_080BDA36:
	lsls r0, r2, 3
	adds r0, r2
	lsls r0, 2
	adds r1, r0, r3
	ldr r4, _080BDA60 @ =0x00002738
	adds r0, r1, r4
	ldrb r0, [r0]
	cmp r0, 0
	beq _080BDA64
	cmp r0, 0x29
	beq _080BDA64
	adds r4, 0x1
	adds r0, r1, r4
	ldrb r0, [r0]
	cmp r0, 0x1
	bne _080BDA64
	adds r0, r2, 0
	b _080BDA70
	.align 2, 0
_080BDA5C: .4byte gSaveBlock1
_080BDA60: .4byte 0x00002738
_080BDA64:
	adds r0, r2, 0x1
	lsls r0, 24
	lsrs r2, r0, 24
	cmp r2, 0x17
	bls _080BDA36
	movs r0, 0xFF
_080BDA70:
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end sub_80BDA30

	thumb_func_start special_0x4a
special_0x4a: @ 80BDA78
	push {lr}
	ldr r2, _080BDAA4 @ =gSpecialVar_0x8004
	ldrh r1, [r2]
	lsls r0, r1, 3
	adds r0, r1
	lsls r0, 2
	ldr r1, _080BDAA8 @ =gSaveBlock1 + 0x2738
	adds r0, r1
	ldrb r0, [r0]
	cmp r0, 0x29
	bne _080BDAAC
	movs r3, 0xF1
	lsls r3, 2
	adds r0, r1, r3
	ldrh r0, [r0]
	cmp r0, 0
	beq _080BDAAC
	bl sub_80BDA30
	lsls r0, 24
	lsrs r0, 24
	b _080BDAAE
	.align 2, 0
_080BDAA4: .4byte gSpecialVar_0x8004
_080BDAA8: .4byte gSaveBlock1 + 0x2738
_080BDAAC:
	ldrb r0, [r2]
_080BDAAE:
	pop {r1}
	bx r1
	thumb_func_end special_0x4a

	thumb_func_start ResetGabbyAndTy
ResetGabbyAndTy: @ 80BDAB4
	push {r4,lr}
	ldr r2, _080BDAF8 @ =gSaveBlock1
	ldr r1, _080BDAFC @ =0x00002b10
	adds r0, r2, r1
	movs r3, 0
	movs r1, 0
	strh r1, [r0]
	ldr r4, _080BDB00 @ =0x00002b12
	adds r0, r2, r4
	strh r1, [r0]
	adds r4, 0x2
	adds r0, r2, r4
	strh r1, [r0]
	ldr r0, _080BDB04 @ =0x00002b16
	adds r1, r2, r0
	ldr r0, _080BDB08 @ =0x0000ffff
	strh r0, [r1]
	adds r4, 0x6
	adds r1, r2, r4
	movs r0, 0
	strb r0, [r1]
	ldr r0, _080BDB0C @ =0x00002b1b
	adds r1, r2, r0
	movs r0, 0
	strb r0, [r1]
	ldr r1, _080BDB10 @ =0x00002b18
	adds r0, r2, r1
	strb r3, [r0]
	subs r4, 0x1
	adds r2, r4
	strb r3, [r2]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080BDAF8: .4byte gSaveBlock1
_080BDAFC: .4byte 0x00002b10
_080BDB00: .4byte 0x00002b12
_080BDB04: .4byte 0x00002b16
_080BDB08: .4byte 0x0000ffff
_080BDB0C: .4byte 0x00002b1b
_080BDB10: .4byte 0x00002b18
	thumb_func_end ResetGabbyAndTy

	thumb_func_start GabbyAndTyBeforeInterview
GabbyAndTyBeforeInterview: @ 80BDB14
	push {r4,r5,lr}
	ldr r2, _080BDB68 @ =gSaveBlock1
	ldr r3, _080BDB6C @ =gUnknown_030042E0
	ldrh r1, [r3, 0x6]
	ldr r4, _080BDB70 @ =0x00002b10
	adds r0, r2, r4
	strh r1, [r0]
	ldrh r1, [r3, 0x26]
	adds r4, 0x2
	adds r0, r2, r4
	strh r1, [r0]
	ldrh r1, [r3, 0x22]
	adds r4, 0x2
	adds r0, r2, r4
	strh r1, [r0]
	ldr r0, _080BDB74 @ =0x00002b19
	adds r4, r2, r0
	ldrb r1, [r4]
	adds r0, r1, 0
	adds r5, r2, 0
	cmp r0, 0xFF
	beq _080BDB44
	adds r0, r1, 0x1
	strb r0, [r4]
_080BDB44:
	ldrb r0, [r3, 0x5]
	lsls r0, 31
	ldr r1, _080BDB78 @ =0x00002b1a
	adds r4, r5, r1
	lsrs r0, 31
	ldrb r1, [r4]
	movs r2, 0x2
	negs r2, r2
	ands r2, r1
	orrs r2, r0
	strb r2, [r4]
	ldrb r0, [r3]
	cmp r0, 0
	beq _080BDB7C
	movs r0, 0x2
	orrs r2, r0
	b _080BDB82
	.align 2, 0
_080BDB68: .4byte gSaveBlock1
_080BDB6C: .4byte gUnknown_030042E0
_080BDB70: .4byte 0x00002b10
_080BDB74: .4byte 0x00002b19
_080BDB78: .4byte 0x00002b1a
_080BDB7C:
	movs r0, 0x3
	negs r0, r0
	ands r2, r0
_080BDB82:
	strb r2, [r4]
	ldrb r0, [r3, 0x3]
	cmp r0, 0
	beq _080BDB9C
	ldr r4, _080BDB98 @ =0x00002b1a
	adds r0, r5, r4
	ldrb r1, [r0]
	movs r2, 0x4
	orrs r1, r2
	strb r1, [r0]
	b _080BDBAA
	.align 2, 0
_080BDB98: .4byte 0x00002b1a
_080BDB9C:
	ldr r0, _080BDBDC @ =0x00002b1a
	adds r2, r5, r0
	ldrb r1, [r2]
	movs r0, 0x5
	negs r0, r0
	ands r0, r1
	strb r0, [r2]
_080BDBAA:
	ldrb r1, [r3, 0x5]
	movs r0, 0x2
	ands r0, r1
	cmp r0, 0
	bne _080BDBE0
	movs r1, 0
	adds r0, r3, 0
	adds r0, 0x36
	ldrb r0, [r0]
	cmp r0, 0
	bne _080BDBE0
_080BDBC0:
	adds r0, r1, 0x1
	lsls r0, 24
	lsrs r1, r0, 24
	cmp r1, 0xA
	bhi _080BDBEC
	adds r0, r3, 0
	adds r0, 0x36
	adds r0, r1, r0
	ldrb r0, [r0]
	cmp r0, 0
	beq _080BDBC0
	ldr r4, _080BDBDC @ =0x00002b1a
	adds r0, r5, r4
	b _080BDBE4
	.align 2, 0
_080BDBDC: .4byte 0x00002b1a
_080BDBE0:
	ldr r1, _080BDC08 @ =0x00002b1a
	adds r0, r5, r1
_080BDBE4:
	ldrb r1, [r0]
	movs r2, 0x8
	orrs r1, r2
	strb r1, [r0]
_080BDBEC:
	bl TakeTVShowInSearchOfTrainersOffTheAir
	ldr r0, _080BDC0C @ =gSaveBlock1
	ldr r4, _080BDC10 @ =0x00002b14
	adds r0, r4
	ldrh r0, [r0]
	cmp r0, 0
	bne _080BDC02
	movs r0, 0x1
	bl FlagSet
_080BDC02:
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080BDC08: .4byte 0x00002b1a
_080BDC0C: .4byte gSaveBlock1
_080BDC10: .4byte 0x00002b14
	thumb_func_end GabbyAndTyBeforeInterview

	thumb_func_start sub_80BDC14
sub_80BDC14: @ 80BDC14
	push {r4-r6,lr}
	ldr r4, _080BDC70 @ =gSaveBlock1
	ldr r0, _080BDC74 @ =0x00002b1a
	adds r6, r4, r0
	ldrb r3, [r6]
	lsls r1, r3, 31
	adds r0, 0x1
	adds r5, r4, r0
	lsrs r1, 31
	ldrb r2, [r5]
	movs r0, 0x2
	negs r0, r0
	ands r0, r2
	orrs r0, r1
	movs r1, 0x2
	ands r1, r3
	movs r2, 0x3
	negs r2, r2
	ands r0, r2
	orrs r0, r1
	movs r1, 0x4
	ands r1, r3
	subs r2, 0x2
	ands r0, r2
	orrs r0, r1
	movs r1, 0x8
	ands r1, r3
	subs r2, 0x4
	ands r0, r2
	orrs r0, r1
	strb r0, [r5]
	movs r0, 0x10
	orrs r3, r0
	strb r3, [r6]
	ldr r0, _080BDC78 @ =gMapHeader
	ldrb r0, [r0, 0x14]
	ldr r1, _080BDC7C @ =0x00002b18
	adds r4, r1
	strb r0, [r4]
	movs r0, 0x6
	bl IncrementGameStat
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_080BDC70: .4byte gSaveBlock1
_080BDC74: .4byte 0x00002b1a
_080BDC78: .4byte gMapHeader
_080BDC7C: .4byte 0x00002b18
	thumb_func_end sub_80BDC14

	thumb_func_start TakeTVShowInSearchOfTrainersOffTheAir
TakeTVShowInSearchOfTrainersOffTheAir: @ 80BDC80
	ldr r0, _080BDC94 @ =gSaveBlock1
	ldr r1, _080BDC98 @ =0x00002b1a
	adds r0, r1
	ldrb r2, [r0]
	movs r1, 0x11
	negs r1, r1
	ands r1, r2
	strb r1, [r0]
	bx lr
	.align 2, 0
_080BDC94: .4byte gSaveBlock1
_080BDC98: .4byte 0x00002b1a
	thumb_func_end TakeTVShowInSearchOfTrainersOffTheAir

	thumb_func_start GabbyAndTyGetBattleNum
GabbyAndTyGetBattleNum: @ 80BDC9C
	push {lr}
	ldr r0, _080BDCBC @ =gSaveBlock1
	ldr r2, _080BDCC0 @ =0x00002b19
	adds r1, r0, r2
	ldrb r0, [r1]
	cmp r0, 0x5
	bls _080BDCB8
	ldrb r0, [r1]
	movs r1, 0x3
	bl __umodsi3
	adds r0, 0x6
	lsls r0, 24
	lsrs r0, 24
_080BDCB8:
	pop {r1}
	bx r1
	.align 2, 0
_080BDCBC: .4byte gSaveBlock1
_080BDCC0: .4byte 0x00002b19
	thumb_func_end GabbyAndTyGetBattleNum

	thumb_func_start IsTVShowInSearchOfTrainersAiring
IsTVShowInSearchOfTrainersAiring: @ 80BDCC4
	ldr r0, _080BDCD4 @ =gSaveBlock1
	ldr r1, _080BDCD8 @ =0x00002b1a
	adds r0, r1
	ldrb r0, [r0]
	lsls r0, 27
	lsrs r0, 31
	bx lr
	.align 2, 0
_080BDCD4: .4byte gSaveBlock1
_080BDCD8: .4byte 0x00002b1a
	thumb_func_end IsTVShowInSearchOfTrainersAiring

	thumb_func_start GabbyAndTyGetLastQuote
GabbyAndTyGetLastQuote: @ 80BDCDC
	push {r4,r5,lr}
	ldr r0, _080BDD00 @ =gSaveBlock1
	ldr r1, _080BDD04 @ =0x00002b16
	adds r4, r0, r1
	ldrh r0, [r4]
	ldr r5, _080BDD08 @ =0x0000ffff
	cmp r0, r5
	beq _080BDD10
	ldr r0, _080BDD0C @ =gStringVar1
	ldrh r1, [r4]
	bl sub_80EB3FC
	ldrh r1, [r4]
	adds r0, r5, 0
	orrs r0, r1
	strh r0, [r4]
	movs r0, 0x1
	b _080BDD12
	.align 2, 0
_080BDD00: .4byte gSaveBlock1
_080BDD04: .4byte 0x00002b16
_080BDD08: .4byte 0x0000ffff
_080BDD0C: .4byte gStringVar1
_080BDD10:
	movs r0, 0
_080BDD12:
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end GabbyAndTyGetLastQuote

	thumb_func_start sub_80BDD18
sub_80BDD18: @ 80BDD18
	push {lr}
	ldr r0, _080BDD30 @ =gSaveBlock1
	ldr r1, _080BDD34 @ =0x00002b1b
	adds r0, r1
	ldrb r1, [r0]
	movs r0, 0x1
	ands r0, r1
	cmp r0, 0
	bne _080BDD38
	movs r0, 0x1
	b _080BDD5E
	.align 2, 0
_080BDD30: .4byte gSaveBlock1
_080BDD34: .4byte 0x00002b1b
_080BDD38:
	movs r0, 0x8
	ands r0, r1
	cmp r0, 0
	beq _080BDD44
	movs r0, 0x2
	b _080BDD5E
_080BDD44:
	movs r0, 0x4
	ands r0, r1
	cmp r0, 0
	beq _080BDD50
	movs r0, 0x3
	b _080BDD5E
_080BDD50:
	movs r0, 0x2
	ands r0, r1
	cmp r0, 0
	bne _080BDD5C
	movs r0, 0
	b _080BDD5E
_080BDD5C:
	movs r0, 0x4
_080BDD5E:
	pop {r1}
	bx r1
	thumb_func_end sub_80BDD18

	thumb_func_start GabbyAndTySetScriptVarsToFieldObjectLocalIds
GabbyAndTySetScriptVarsToFieldObjectLocalIds: @ 80BDD64
	push {lr}
	bl GabbyAndTyGetBattleNum
	lsls r0, 24
	lsrs r0, 24
	subs r0, 0x1
	cmp r0, 0x7
	bhi _080BDE3C
	lsls r0, 2
	ldr r1, _080BDD80 @ =_080BDD84
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_080BDD80: .4byte _080BDD84
	.align 2, 0
_080BDD84:
	.4byte _080BDDA4
	.4byte _080BDDB8
	.4byte _080BDDCC
	.4byte _080BDDE0
	.4byte _080BDDF4
	.4byte _080BDE08
	.4byte _080BDE1C
	.4byte _080BDE30
_080BDDA4:
	ldr r1, _080BDDB0 @ =gSpecialVar_0x8004
	movs r0, 0xE
	strh r0, [r1]
	ldr r1, _080BDDB4 @ =gSpecialVar_0x8005
	movs r0, 0xD
	b _080BDE3A
	.align 2, 0
_080BDDB0: .4byte gSpecialVar_0x8004
_080BDDB4: .4byte gSpecialVar_0x8005
_080BDDB8:
	ldr r1, _080BDDC4 @ =gSpecialVar_0x8004
	movs r0, 0x5
	strh r0, [r1]
	ldr r1, _080BDDC8 @ =gSpecialVar_0x8005
	movs r0, 0x6
	b _080BDE3A
	.align 2, 0
_080BDDC4: .4byte gSpecialVar_0x8004
_080BDDC8: .4byte gSpecialVar_0x8005
_080BDDCC:
	ldr r1, _080BDDD8 @ =gSpecialVar_0x8004
	movs r0, 0x12
	strh r0, [r1]
	ldr r1, _080BDDDC @ =gSpecialVar_0x8005
	movs r0, 0x11
	b _080BDE3A
	.align 2, 0
_080BDDD8: .4byte gSpecialVar_0x8004
_080BDDDC: .4byte gSpecialVar_0x8005
_080BDDE0:
	ldr r1, _080BDDEC @ =gSpecialVar_0x8004
	movs r0, 0x15
	strh r0, [r1]
	ldr r1, _080BDDF0 @ =gSpecialVar_0x8005
	movs r0, 0x16
	b _080BDE3A
	.align 2, 0
_080BDDEC: .4byte gSpecialVar_0x8004
_080BDDF0: .4byte gSpecialVar_0x8005
_080BDDF4:
	ldr r1, _080BDE00 @ =gSpecialVar_0x8004
	movs r0, 0x8
	strh r0, [r1]
	ldr r1, _080BDE04 @ =gSpecialVar_0x8005
	movs r0, 0x9
	b _080BDE3A
	.align 2, 0
_080BDE00: .4byte gSpecialVar_0x8004
_080BDE04: .4byte gSpecialVar_0x8005
_080BDE08:
	ldr r1, _080BDE14 @ =gSpecialVar_0x8004
	movs r0, 0x13
	strh r0, [r1]
	ldr r1, _080BDE18 @ =gSpecialVar_0x8005
	movs r0, 0x14
	b _080BDE3A
	.align 2, 0
_080BDE14: .4byte gSpecialVar_0x8004
_080BDE18: .4byte gSpecialVar_0x8005
_080BDE1C:
	ldr r1, _080BDE28 @ =gSpecialVar_0x8004
	movs r0, 0x17
	strh r0, [r1]
	ldr r1, _080BDE2C @ =gSpecialVar_0x8005
	movs r0, 0x18
	b _080BDE3A
	.align 2, 0
_080BDE28: .4byte gSpecialVar_0x8004
_080BDE2C: .4byte gSpecialVar_0x8005
_080BDE30:
	ldr r1, _080BDE40 @ =gSpecialVar_0x8004
	movs r0, 0xA
	strh r0, [r1]
	ldr r1, _080BDE44 @ =gSpecialVar_0x8005
	movs r0, 0xB
_080BDE3A:
	strh r0, [r1]
_080BDE3C:
	pop {r0}
	bx r0
	.align 2, 0
_080BDE40: .4byte gSpecialVar_0x8004
_080BDE44: .4byte gSpecialVar_0x8005
	thumb_func_end GabbyAndTySetScriptVarsToFieldObjectLocalIds

	thumb_func_start sub_80BDE48
sub_80BDE48: @ 80BDE48
	push {lr}
	ldr r0, _080BDE60 @ =gSpecialVar_0x8005
	ldrh r0, [r0]
	subs r0, 0x1
	cmp r0, 0x6
	bhi _080BDEA6
	lsls r0, 2
	ldr r1, _080BDE64 @ =_080BDE68
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_080BDE60: .4byte gSpecialVar_0x8005
_080BDE64: .4byte _080BDE68
	.align 2, 0
_080BDE68:
	.4byte _080BDE84
	.4byte _080BDE8A
	.4byte _080BDE90
	.4byte _080BDE96
	.4byte _080BDEA6
	.4byte _080BDE9C
	.4byte _080BDEA2
_080BDE84:
	bl sub_80BE5FC
	b _080BDEA6
_080BDE8A:
	bl sub_80BE65C
	b _080BDEA6
_080BDE90:
	bl sub_80BE6A0
	b _080BDEA6
_080BDE96:
	bl nullsub_21
	b _080BDEA6
_080BDE9C:
	bl sub_80BE188
	b _080BDEA6
_080BDEA2:
	bl sub_80BE320
_080BDEA6:
	pop {r0}
	bx r0
	thumb_func_end sub_80BDE48

	thumb_func_start sub_80BDEAC
sub_80BDEAC: @ 80BDEAC
	push {lr}
	adds r1, r0, 0
	movs r2, GAME_LANGUAGE
	ldrb r0, [r1]
	cmp r0, 0xFC
	bne _080BDEC0
	ldrb r0, [r1, 0x1]
	cmp r0, 0x15
	bne _080BDEC0
	movs r2, 0x1
_080BDEC0:
	adds r0, r2, 0
	pop {r1}
	bx r1
	thumb_func_end sub_80BDEAC

	thumb_func_start sub_80BDEC8
sub_80BDEC8: @ 80BDEC8
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	movs r4, 0
	bl sub_80BEB20
	bl sub_80BE778
	ldr r5, _080BDEE8 @ =gUnknown_030042E0
	ldrh r0, [r5, 0x28]
	cmp r0, 0
	bne _080BDEEC
	bl sub_80BE074
	b _080BE012
	.align 2, 0
_080BDEE8: .4byte gUnknown_030042E0
_080BDEEC:
	bl sub_80BE028
	ldr r0, _080BDF98 @ =0x0000ffff
	bl sub_80BF77C
	lsls r0, 24
	cmp r0, 0
	beq _080BDEFE
	b _080BE012
_080BDEFE:
	ldrh r1, [r5, 0x28]
	movs r0, 0xB
	muls r0, r1
	ldr r1, _080BDF9C @ =gSpeciesNames
	adds r0, r1
	adds r1, r5, 0
	adds r1, 0x2A
	bl StringCompareWithoutExtCtrlCodes
	cmp r0, 0
	bne _080BDF16
	b _080BE012
_080BDF16:
	ldr r0, _080BDFA0 @ =gSaveBlock1 + 0x2738
	bl sub_80BF74C
	ldr r1, _080BDFA4 @ =gUnknown_03005D38
	strb r0, [r1]
	lsls r0, 24
	asrs r0, 24
	movs r1, 0x1
	negs r1, r1
	cmp r0, r1
	beq _080BE012
	movs r0, 0x15
	bl sub_80BF1B4
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	beq _080BE012
	movs r2, 0
	adds r7, r5, 0
	adds r1, r7, 0
	adds r1, 0x36
_080BDF42:
	adds r0, r2, r1
	ldrb r0, [r0]
	adds r0, r4, r0
	lsls r0, 16
	lsrs r4, r0, 16
	adds r0, r2, 0x1
	lsls r0, 24
	lsrs r2, r0, 24
	cmp r2, 0xA
	bls _080BDF42
	cmp r4, 0
	bne _080BDF64
	ldrb r1, [r7, 0x5]
	movs r0, 0x2
	ands r0, r1
	cmp r0, 0
	beq _080BE012
_080BDF64:
	movs r4, 0
	ldr r0, _080BDFA4 @ =gUnknown_03005D38
	movs r1, 0
	ldrsb r1, [r0, r1]
	lsls r0, r1, 3
	adds r0, r1
	lsls r0, 2
	ldr r1, _080BDFA0 @ =gSaveBlock1 + 0x2738
	adds r5, r0, r1
	movs r0, 0x15
	strb r0, [r5]
	strb r4, [r5, 0x1]
	ldrb r1, [r7, 0x5]
	movs r0, 0x2
	ands r0, r1
	cmp r0, 0
	beq _080BDFAC
	movs r4, 0x1
	movs r0, 0x1
	adds r3, r5, 0
	adds r3, 0x13
	ldr r1, _080BDFA8 @ =gSaveBlock2
	mov r8, r1
	adds r6, r5, 0x4
	b _080BDFDE
	.align 2, 0
_080BDF98: .4byte 0x0000ffff
_080BDF9C: .4byte gSpeciesNames
_080BDFA0: .4byte gSaveBlock1 + 0x2738
_080BDFA4: .4byte gUnknown_03005D38
_080BDFA8: .4byte gSaveBlock2
_080BDFAC:
	movs r2, 0
	ldr r0, _080BE01C @ =gUnknown_02024C04
	mov r12, r0
	adds r3, r5, 0
	adds r3, 0x13
	ldr r1, _080BE020 @ =gSaveBlock2
	mov r8, r1
	adds r6, r5, 0x4
	adds r1, r7, 0
	adds r1, 0x36
_080BDFC0:
	adds r0, r2, r1
	ldrb r0, [r0]
	adds r0, r4, r0
	lsls r0, 16
	lsrs r4, r0, 16
	adds r0, r2, 0x1
	lsls r0, 24
	lsrs r2, r0, 24
	cmp r2, 0xA
	bls _080BDFC0
	cmp r4, 0xFF
	bls _080BDFDA
	movs r4, 0xFF
_080BDFDA:
	mov r1, r12
	ldrh r0, [r1]
_080BDFDE:
	strb r4, [r5, 0x12]
	strb r0, [r5, 0xF]
	adds r0, r3, 0
	mov r1, r8
	bl StringCopy
	ldr r4, _080BE024 @ =gUnknown_0300430A
	adds r0, r6, 0
	adds r1, r4, 0
	bl StringCopy
	subs r4, 0x2A
	ldrh r0, [r4, 0x28]
	strh r0, [r5, 0x10]
	adds r0, r5, 0
	bl sub_80BE138
	movs r0, GAME_LANGUAGE
	strb r0, [r5, 0x2]
	adds r0, r6, 0
	bl sub_80BDEAC
	strb r0, [r5, 0x3]
	adds r0, r6, 0
	bl StripExtCtrlCodes
_080BE012:
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080BE01C: .4byte gUnknown_02024C04
_080BE020: .4byte gSaveBlock2
_080BE024: .4byte gUnknown_0300430A
	thumb_func_end sub_80BDEC8

	thumb_func_start sub_80BE028
sub_80BE028: @ 80BE028
	push {r4,lr}
	ldr r4, _080BE064 @ =gSaveBlock1 + 0x2A98
	ldrb r0, [r4]
	cmp r0, 0x19
	beq _080BE048
	ldr r1, _080BE068 @ =0xfffffca0
	adds r0, r4, r1
	movs r1, 0x18
	bl sub_80BF55C
	movs r0, 0x5
	bl GetGameStat
	strh r0, [r4, 0x6]
	movs r0, 0x19
	strb r0, [r4]
_080BE048:
	ldrh r0, [r4, 0x2]
	adds r0, 0x1
	strh r0, [r4, 0x2]
	ldr r1, _080BE06C @ =gUnknown_030042E0
	ldrh r0, [r1, 0x28]
	strh r0, [r4, 0x4]
	ldrh r0, [r1, 0x6]
	strh r0, [r4, 0x8]
	ldr r0, _080BE070 @ =gMapHeader
	ldrb r0, [r0, 0x14]
	strb r0, [r4, 0xA]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080BE064: .4byte gSaveBlock1 + 0x2A98
_080BE068: .4byte 0xfffffca0
_080BE06C: .4byte gUnknown_030042E0
_080BE070: .4byte gMapHeader
	thumb_func_end sub_80BE028

	thumb_func_start sub_80BE074
sub_80BE074: @ 80BE074
	push {r4-r7,lr}
	ldr r0, _080BE118 @ =0x0000ffff
	bl sub_80BF77C
	lsls r0, 24
	cmp r0, 0
	bne _080BE112
	movs r1, 0
	movs r5, 0
	ldr r2, _080BE11C @ =gUnknown_03004316
_080BE088:
	adds r0, r1, r2
	ldrb r0, [r0]
	adds r0, r5, r0
	lsls r0, 16
	lsrs r5, r0, 16
	adds r0, r1, 0x1
	lsls r0, 24
	lsrs r1, r0, 24
	cmp r1, 0xA
	bls _080BE088
	cmp r5, 0xFF
	bls _080BE0A2
	movs r5, 0xFF
_080BE0A2:
	cmp r5, 0x2
	bls _080BE112
	ldr r7, _080BE120 @ =gUnknown_02024D26
	ldrb r0, [r7]
	cmp r0, 0x1
	bne _080BE112
	ldr r6, _080BE124 @ =gSaveBlock1 + 0x2738
	adds r0, r6, 0
	bl sub_80BF74C
	ldr r4, _080BE128 @ =gUnknown_03005D38
	strb r0, [r4]
	lsls r0, 24
	asrs r0, 24
	movs r1, 0x1
	negs r1, r1
	cmp r0, r1
	beq _080BE112
	movs r0, 0x17
	bl sub_80BF1B4
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	beq _080BE112
	movs r0, 0
	ldrsb r0, [r4, r0]
	lsls r4, r0, 3
	adds r4, r0
	lsls r4, 2
	adds r4, r6
	movs r1, 0
	movs r0, 0x17
	strb r0, [r4]
	strb r1, [r4, 0x1]
	ldr r1, _080BE12C @ =gUnknown_030042E0
	ldrh r0, [r1, 0x6]
	strh r0, [r4, 0xC]
	ldrh r0, [r1, 0x20]
	strh r0, [r4, 0xE]
	strb r5, [r4, 0x10]
	ldrb r0, [r7]
	strb r0, [r4, 0x11]
	ldr r0, _080BE130 @ =gMapHeader
	ldrb r0, [r0, 0x14]
	strb r0, [r4, 0x12]
	adds r0, r4, 0
	adds r0, 0x13
	ldr r1, _080BE134 @ =gSaveBlock2
	bl StringCopy
	adds r0, r4, 0
	bl sub_80BE138
	movs r0, GAME_LANGUAGE
	strb r0, [r4, 0x2]
_080BE112:
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080BE118: .4byte 0x0000ffff
_080BE11C: .4byte gUnknown_03004316
_080BE120: .4byte gUnknown_02024D26
_080BE124: .4byte gSaveBlock1 + 0x2738
_080BE128: .4byte gUnknown_03005D38
_080BE12C: .4byte gUnknown_030042E0
_080BE130: .4byte gMapHeader
_080BE134: .4byte gSaveBlock2
	thumb_func_end sub_80BE074

	thumb_func_start sub_80BE138
sub_80BE138: @ 80BE138
	push {r4,lr}
	adds r4, r0, 0
	bl GetPlayerTrainerId
	strb r0, [r4, 0x1E]
	lsrs r2, r0, 8
	strb r2, [r4, 0x1F]
	adds r1, r4, 0
	adds r1, 0x20
	strb r0, [r1]
	adds r1, 0x1
	strb r2, [r1]
	adds r1, 0x1
	strb r0, [r1]
	adds r0, r4, 0
	adds r0, 0x23
	strb r2, [r0]
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end sub_80BE138

	thumb_func_start sub_80BE160
sub_80BE160: @ 80BE160
	push {r4,lr}
	adds r4, r0, 0
	bl GetPlayerTrainerId
	adds r1, r4, 0
	adds r1, 0x20
	strb r0, [r1]
	lsrs r1, r0, 8
	adds r2, r4, 0
	adds r2, 0x21
	strb r1, [r2]
	adds r2, 0x1
	strb r0, [r2]
	adds r0, r4, 0
	adds r0, 0x23
	strb r1, [r0]
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end sub_80BE160

	thumb_func_start sub_80BE188
sub_80BE188: @ 80BE188
	push {r4-r6,lr}
	ldr r6, _080BE22C @ =gSaveBlock1 + 0x2A98
	ldrb r1, [r6]
	cmp r1, 0x6
	bne _080BE224
	ldr r0, _080BE230 @ =gUnknown_03005D38
	ldrb r0, [r0]
	lsls r0, 24
	asrs r0, 24
	lsls r4, r0, 3
	adds r4, r0
	lsls r4, 2
	ldr r2, _080BE234 @ =0xfffffca0
	adds r0, r6, r2
	adds r4, r0
	strb r1, [r4]
	movs r0, 0x1
	strb r0, [r4, 0x1]
	ldrh r0, [r6, 0x2]
	strh r0, [r4, 0x2]
	adds r0, r4, 0
	adds r0, 0x16
	ldr r1, _080BE238 @ =gSaveBlock2
	bl StringCopy
	adds r5, r4, 0
	adds r5, 0x8
	adds r1, r6, 0
	adds r1, 0x8
	adds r0, r5, 0
	bl StringCopy
	ldrb r0, [r6, 0x13]
	lsls r0, 29
	lsrs r0, 29
	ldrb r2, [r4, 0x13]
	movs r3, 0x8
	negs r3, r3
	adds r1, r3, 0
	ands r1, r2
	orrs r1, r0
	strb r1, [r4, 0x13]
	ldrb r2, [r6, 0x13]
	movs r0, 0x18
	ands r0, r2
	movs r2, 0x19
	negs r2, r2
	ands r2, r1
	orrs r2, r0
	strb r2, [r4, 0x13]
	ldrh r0, [r6, 0x14]
	strh r0, [r4, 0x14]
	ldrb r0, [r6, 0x13]
	movs r1, 0x60
	ands r1, r0
	movs r0, 0x61
	negs r0, r0
	ands r0, r2
	orrs r0, r1
	strb r0, [r4, 0x13]
	ldrb r1, [r6, 0x13]
	lsls r1, 29
	lsrs r1, 29
	ands r0, r3
	orrs r0, r1
	strb r0, [r4, 0x13]
	adds r0, r4, 0
	bl sub_80BE160
	movs r0, GAME_LANGUAGE
	strb r0, [r4, 0x1E]
	adds r0, r5, 0
	bl sub_80BDEAC
	strb r0, [r4, 0x1F]
	adds r0, r5, 0
	bl StripExtCtrlCodes
_080BE224:
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_080BE22C: .4byte gSaveBlock1 + 0x2A98
_080BE230: .4byte gUnknown_03005D38
_080BE234: .4byte 0xfffffca0
_080BE238: .4byte gSaveBlock2
	thumb_func_end sub_80BE188

	thumb_func_start sub_80BE23C
sub_80BE23C: @ 80BE23C
	push {r4-r6,lr}
	lsls r0, 16
	lsrs r6, r0, 16
	ldr r4, _080BE278 @ =gSaveBlock1 + 0x2A98
	bl sub_80BF484
	ldr r0, _080BE27C @ =0xfffffca0
	adds r5, r4, r0
	adds r0, r5, 0
	bl sub_80BF720
	ldr r1, _080BE280 @ =gUnknown_03005D38
	strb r0, [r1]
	lsls r0, 24
	asrs r0, 24
	movs r1, 0x1
	negs r1, r1
	cmp r0, r1
	beq _080BE270
	adds r0, r5, 0
	movs r1, 0x18
	bl sub_80BF55C
	strh r6, [r4, 0x14]
	movs r0, 0x6
	strb r0, [r4]
_080BE270:
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_080BE278: .4byte gSaveBlock1 + 0x2A98
_080BE27C: .4byte 0xfffffca0
_080BE280: .4byte gUnknown_03005D38
	thumb_func_end sub_80BE23C

	thumb_func_start sub_80BE284
sub_80BE284: @ 80BE284
	push {r4-r7,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	ldr r7, _080BE304 @ =gSaveBlock1 + 0x2A98
	ldr r1, _080BE308 @ =0xfffffca0
	adds r0, r7, r1
	bl sub_80BF720
	ldr r1, _080BE30C @ =gUnknown_03005D38
	strb r0, [r1]
	lsls r0, 24
	asrs r0, 24
	movs r1, 0x1
	negs r1, r1
	cmp r0, r1
	beq _080BE2FE
	movs r3, 0x3
	adds r1, r4, 0
	ands r1, r3
	lsls r1, 5
	ldrb r2, [r7, 0x13]
	movs r0, 0x61
	negs r0, r0
	ands r0, r2
	orrs r0, r1
	ldr r1, _080BE310 @ =gScriptContestCategory
	ldrb r2, [r1]
	movs r1, 0x7
	ands r1, r2
	movs r2, 0x8
	negs r2, r2
	ands r0, r2
	orrs r0, r1
	ldr r1, _080BE314 @ =gScriptContestRank
	ldrb r1, [r1]
	ands r3, r1
	lsls r3, 3
	movs r1, 0x19
	negs r1, r1
	ands r0, r1
	orrs r0, r3
	strb r0, [r7, 0x13]
	ldr r6, _080BE318 @ =gUnknown_02038694
	ldrb r0, [r6]
	movs r5, 0x64
	muls r0, r5
	ldr r4, _080BE31C @ =gPlayerParty
	adds r0, r4
	movs r1, 0xB
	movs r2, 0
	bl GetMonData
	strh r0, [r7, 0x2]
	ldrb r0, [r6]
	muls r0, r5
	adds r0, r4
	adds r2, r7, 0
	adds r2, 0x8
	movs r1, 0x2
	bl GetMonData
_080BE2FE:
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080BE304: .4byte gSaveBlock1 + 0x2A98
_080BE308: .4byte 0xfffffca0
_080BE30C: .4byte gUnknown_03005D38
_080BE310: .4byte gScriptContestCategory
_080BE314: .4byte gScriptContestRank
_080BE318: .4byte gUnknown_02038694
_080BE31C: .4byte gPlayerParty
	thumb_func_end sub_80BE284

	thumb_func_start sub_80BE320
sub_80BE320: @ 80BE320
	push {r4-r6,lr}
	ldr r0, _080BE384 @ =gUnknown_03005D38
	movs r1, 0
	ldrsb r1, [r0, r1]
	lsls r0, r1, 3
	adds r0, r1
	lsls r0, 2
	ldr r1, _080BE388 @ =gSaveBlock1 + 0x2738
	adds r6, r0, r1
	movs r0, 0x7
	strb r0, [r6]
	movs r0, 0x1
	strb r0, [r6, 0x1]
	adds r0, r6, 0x2
	ldr r4, _080BE38C @ =gSaveBlock2
	adds r1, r4, 0
	bl StringCopy
	adds r0, r6, 0
	adds r0, 0xC
	ldr r2, _080BE390 @ =0x00000484
	adds r1, r4, r2
	bl StringCopy
	movs r1, 0x90
	lsls r1, 3
	adds r0, r4, r1
	ldrh r0, [r0]
	strh r0, [r6, 0xA]
	ldr r2, _080BE394 @ =0x00000482
	adds r0, r4, r2
	ldrh r0, [r0]
	strh r0, [r6, 0x14]
	movs r0, 0xAF
	lsls r0, 3
	adds r5, r4, r0
	ldrb r0, [r5]
	bl sub_8135D3C
	strh r0, [r6, 0x16]
	ldr r1, _080BE398 @ =0x00000555
	adds r4, r1
	ldrb r0, [r4]
	strb r0, [r6, 0x1C]
	ldrb r0, [r5]
	cmp r0, 0
	bne _080BE39C
	movs r0, 0x32
	b _080BE39E
	.align 2, 0
_080BE384: .4byte gUnknown_03005D38
_080BE388: .4byte gSaveBlock1 + 0x2738
_080BE38C: .4byte gSaveBlock2
_080BE390: .4byte 0x00000484
_080BE394: .4byte 0x00000482
_080BE398: .4byte 0x00000555
_080BE39C:
	movs r0, 0x64
_080BE39E:
	strb r0, [r6, 0x1A]
	ldr r0, _080BE3B8 @ =gSpecialVar_0x8004
	ldrh r0, [r0]
	strb r0, [r6, 0x1B]
	adds r0, r6, 0
	bl sub_80BE160
	movs r0, GAME_LANGUAGE
	strb r0, [r6, 0x1D]
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_080BE3B8: .4byte gSpecialVar_0x8004
	thumb_func_end sub_80BE320

	thumb_func_start sub_80BE3BC
sub_80BE3BC: @ 80BE3BC
	push {r4-r7,lr}
	ldr r0, _080BE460 @ =0x00005555
	bl sub_80BF77C
	lsls r0, 24
	lsrs r4, r0, 24
	cmp r4, 0
	bne _080BE458
	ldr r6, _080BE464 @ =gSaveBlock1 + 0x2738
	adds r0, r6, 0
	bl sub_80BF74C
	ldr r5, _080BE468 @ =gUnknown_03005D38
	strb r0, [r5]
	lsls r0, 24
	asrs r0, 24
	movs r1, 0x1
	negs r1, r1
	cmp r0, r1
	beq _080BE458
	movs r0, 0x16
	bl sub_80BF1B4
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	beq _080BE458
	bl sub_80BF20C
	ldr r2, _080BE46C @ =gUnknown_02038724
	ldrh r0, [r2, 0x2]
	cmp r0, 0x13
	bls _080BE458
	movs r1, 0
	ldrsb r1, [r5, r1]
	lsls r0, r1, 3
	adds r0, r1
	lsls r0, 2
	adds r5, r0, r6
	movs r0, 0x16
	strb r0, [r5]
	strb r4, [r5, 0x1]
	ldr r0, _080BE470 @ =gMapHeader
	ldrb r0, [r0, 0x14]
	strb r0, [r5, 0x12]
	movs r4, 0
	adds r7, r5, 0x6
	mov r12, r2
	adds r6, r5, 0
	adds r6, 0xC
_080BE420:
	lsls r2, r4, 1
	adds r3, r7, r2
	lsls r1, r4, 2
	add r1, r12
	ldrh r0, [r1]
	strh r0, [r3]
	adds r2, r6, r2
	ldrh r0, [r1, 0x2]
	strh r0, [r2]
	adds r0, r4, 0x1
	lsls r0, 24
	lsrs r4, r0, 24
	cmp r4, 0x2
	bls _080BE420
	movs r0, 0x1
	bl GetPriceReduction
	strb r0, [r5, 0x2]
	adds r0, r5, 0
	adds r0, 0x13
	ldr r1, _080BE474 @ =gSaveBlock2
	bl StringCopy
	adds r0, r5, 0
	bl sub_80BE138
	movs r0, GAME_LANGUAGE
	strb r0, [r5, 0x3]
_080BE458:
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080BE460: .4byte 0x00005555
_080BE464: .4byte gSaveBlock1 + 0x2738
_080BE468: .4byte gUnknown_03005D38
_080BE46C: .4byte gUnknown_02038724
_080BE470: .4byte gMapHeader
_080BE474: .4byte gSaveBlock2
	thumb_func_end sub_80BE3BC


    .section .text_80BE8EC

	thumb_func_start sub_80BEA50
sub_80BEA50: @ 80BEA50
	ldr r1, _080BEA58 @ =gUnknown_020387E0
	strh r0, [r1]
	bx lr
	.align 2, 0
_080BEA58: .4byte gUnknown_020387E0
	thumb_func_end sub_80BEA50

	thumb_func_start sub_80BEA5C
sub_80BEA5C: @ 80BEA5C
	push {lr}
	ldr r1, _080BEA78 @ =gSaveBlock1 + 0x2A98
	ldrb r0, [r1]
	cmp r0, 0x19
	bne _080BEA84
	ldrh r0, [r1, 0x2]
	cmp r0, 0x13
	bhi _080BEA80
	ldr r2, _080BEA7C @ =0xfffffca0
	adds r0, r1, r2
	movs r1, 0x18
	bl sub_80BF55C
	b _080BEA84
	.align 2, 0
_080BEA78: .4byte gSaveBlock1 + 0x2A98
_080BEA7C: .4byte 0xfffffca0
_080BEA80:
	bl sub_80BEA88
_080BEA84:
	pop {r0}
	bx r0
	thumb_func_end sub_80BEA5C

	thumb_func_start sub_80BEA88
sub_80BEA88: @ 80BEA88
	push {r4-r7,lr}
	ldr r5, _080BEB0C @ =gSaveBlock1 + 0x2A98
	ldr r0, _080BEB10 @ =0x0000ffff
	bl sub_80BF77C
	lsls r0, 24
	lsrs r6, r0, 24
	cmp r6, 0
	bne _080BEB04
	ldr r0, _080BEB14 @ =0xfffffca0
	adds r7, r5, r0
	adds r0, r7, 0
	bl sub_80BF74C
	ldr r4, _080BEB18 @ =gUnknown_03005D38
	strb r0, [r4]
	lsls r0, 24
	asrs r0, 24
	movs r1, 0x1
	negs r1, r1
	cmp r0, r1
	beq _080BEB04
	movs r0, 0x19
	bl sub_80BF1B4
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	beq _080BEB04
	movs r0, 0
	ldrsb r0, [r4, r0]
	lsls r4, r0, 3
	adds r4, r0
	lsls r4, 2
	adds r4, r7
	movs r0, 0x19
	strb r0, [r4]
	strb r6, [r4, 0x1]
	ldrh r0, [r5, 0x2]
	strh r0, [r4, 0x2]
	movs r0, 0x5
	bl GetGameStat
	ldrh r1, [r5, 0x6]
	subs r0, r1
	strh r0, [r4, 0x6]
	ldrh r0, [r5, 0x4]
	strh r0, [r4, 0x4]
	ldrh r0, [r5, 0x8]
	strh r0, [r4, 0x8]
	ldrb r0, [r5, 0xA]
	strb r0, [r4, 0xA]
	adds r0, r4, 0
	adds r0, 0x13
	ldr r1, _080BEB1C @ =gSaveBlock2
	bl StringCopy
	adds r0, r4, 0
	bl sub_80BE138
	movs r0, GAME_LANGUAGE
	strb r0, [r4, 0xB]
_080BEB04:
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080BEB0C: .4byte gSaveBlock1 + 0x2A98
_080BEB10: .4byte 0x0000ffff
_080BEB14: .4byte 0xfffffca0
_080BEB18: .4byte gUnknown_03005D38
_080BEB1C: .4byte gSaveBlock2
	thumb_func_end sub_80BEA88

	thumb_func_start sub_80BEB20
sub_80BEB20: @ 80BEB20
	push {r4-r6,lr}
	ldr r0, _080BEBAC @ =0x00000804
	bl FlagGet
	lsls r0, 24
	cmp r0, 0
	beq _080BEBA6
	ldr r6, _080BEBB0 @ =gSaveBlock1 + 0x2ABC
	adds r0, r6, 0
	bl sub_80BEBC8
	ldr r5, _080BEBB4 @ =gUnknown_03005D38
	strb r0, [r5]
	lsls r0, 24
	asrs r0, 24
	movs r1, 0x1
	negs r1, r1
	cmp r0, r1
	beq _080BEBA6
	ldr r0, _080BEBB8 @ =0x0000028f
	bl sub_80BF77C
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	beq _080BEBA6
	bl Random
	lsls r0, 16
	lsrs r0, 16
	movs r1, 0x3
	bl __umodsi3
	adds r0, 0x1
	lsls r0, 16
	lsrs r4, r0, 16
	lsls r0, r4, 24
	lsrs r0, 24
	bl sub_80BEE48
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	beq _080BEBA6
	movs r0, 0
	ldrsb r0, [r5, r0]
	lsls r0, 2
	ldr r1, _080BEBBC @ =0xffffd544
	adds r2, r6, r1
	adds r0, r6, r0
	strb r4, [r0]
	movs r0, 0
	ldrsb r0, [r5, r0]
	lsls r0, 2
	adds r0, r2
	ldr r1, _080BEBC0 @ =0x00002abe
	adds r0, r1
	movs r1, 0x4
	strh r1, [r0]
	movs r0, 0
	ldrsb r0, [r5, r0]
	lsls r0, 2
	adds r0, r2
	ldr r1, _080BEBC4 @ =0x00002abd
	adds r0, r1
	movs r1, 0x1
	strb r1, [r0]
_080BEBA6:
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_080BEBAC: .4byte 0x00000804
_080BEBB0: .4byte gSaveBlock1 + 0x2ABC
_080BEBB4: .4byte gUnknown_03005D38
_080BEBB8: .4byte 0x0000028f
_080BEBBC: .4byte 0xffffd544
_080BEBC0: .4byte 0x00002abe
_080BEBC4: .4byte 0x00002abd
	thumb_func_end sub_80BEB20

	thumb_func_start sub_80BEBC8
sub_80BEBC8: @ 80BEBC8
	push {lr}
	adds r2, r0, 0
	movs r1, 0
_080BEBCE:
	lsls r0, r1, 24
	asrs r1, r0, 24
	lsls r0, r1, 2
	adds r0, r2
	ldrb r0, [r0]
	cmp r0, 0
	bne _080BEBE0
	adds r0, r1, 0
	b _080BEBF0
_080BEBE0:
	adds r0, r1, 0x1
	lsls r0, 24
	lsrs r1, r0, 24
	asrs r0, 24
	cmp r0, 0xF
	ble _080BEBCE
	movs r0, 0x1
	negs r0, r0
_080BEBF0:
	pop {r1}
	bx r1
	thumb_func_end sub_80BEBC8

	thumb_func_start sub_80BEBF4
sub_80BEBF4: @ 80BEBF4
	push {r4,lr}
	movs r4, 0
_080BEBF8:
	adds r0, r4, 0
	bl sub_80BEC10
	adds r0, r4, 0x1
	lsls r0, 24
	lsrs r4, r0, 24
	cmp r4, 0xF
	bls _080BEBF8
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end sub_80BEBF4

	thumb_func_start sub_80BEC10
sub_80BEC10: @ 80BEC10
	lsls r0, 24
	ldr r1, _080BEC30 @ =gSaveBlock1
	lsrs r0, 22
	adds r0, r1
	ldr r2, _080BEC34 @ =0x00002abc
	adds r1, r0, r2
	movs r2, 0
	strb r2, [r1]
	ldr r3, _080BEC38 @ =0x00002abd
	adds r1, r0, r3
	strb r2, [r1]
	ldr r1, _080BEC3C @ =0x00002abe
	adds r0, r1
	strh r2, [r0]
	bx lr
	.align 2, 0
_080BEC30: .4byte gSaveBlock1
_080BEC34: .4byte 0x00002abc
_080BEC38: .4byte 0x00002abd
_080BEC3C: .4byte 0x00002abe
	thumb_func_end sub_80BEC10

	thumb_func_start sub_80BEC40
sub_80BEC40: @ 80BEC40
	push {r4-r7,lr}
	movs r1, 0
	ldr r6, _080BEC80 @ =gSaveBlock1
_080BEC46:
	ldr r3, _080BEC80 @ =gSaveBlock1
	lsls r2, r1, 2
	adds r0, r2, r3
	ldr r4, _080BEC84 @ =0x00002abc
	adds r0, r4
	ldrb r0, [r0]
	adds r5, r1, 0x1
	cmp r0, 0
	bne _080BEC92
	lsls r0, r5, 24
	lsrs r1, r0, 24
	cmp r1, 0xF
	bhi _080BEC92
	adds r4, r3, r4
	adds r3, r2, r4
_080BEC64:
	lsls r2, r1, 2
	adds r0, r2, r6
	ldr r7, _080BEC84 @ =0x00002abc
	adds r0, r7
	ldrb r0, [r0]
	cmp r0, 0
	beq _080BEC88
	adds r0, r2, r4
	ldr r0, [r0]
	str r0, [r3]
	adds r0, r1, 0
	bl sub_80BEC10
	b _080BEC92
	.align 2, 0
_080BEC80: .4byte gSaveBlock1
_080BEC84: .4byte 0x00002abc
_080BEC88:
	adds r0, r1, 0x1
	lsls r0, 24
	lsrs r1, r0, 24
	cmp r1, 0xF
	bls _080BEC64
_080BEC92:
	lsls r0, r5, 24
	lsrs r1, r0, 24
	cmp r1, 0xE
	bls _080BEC46
	pop {r4-r7}
	pop {r0}
	bx r0
	thumb_func_end sub_80BEC40

	thumb_func_start sub_80BECA0
sub_80BECA0: @ 80BECA0
	push {r4,lr}
	movs r2, 0
	ldr r3, _080BECCC @ =gSaveBlock1
_080BECA6:
	lsls r0, r2, 2
	adds r1, r0, r3
	ldr r4, _080BECD0 @ =0x00002abc
	adds r0, r1, r4
	ldrb r0, [r0]
	cmp r0, 0
	beq _080BECD4
	adds r4, 0x1
	adds r0, r1, r4
	ldrb r0, [r0]
	cmp r0, 0x1
	bne _080BECD4
	adds r4, 0x1
	adds r0, r1, r4
	ldrh r0, [r0]
	cmp r0, 0x2
	bhi _080BECD4
	adds r0, r2, 0
	b _080BECE0
	.align 2, 0
_080BECCC: .4byte gSaveBlock1
_080BECD0: .4byte 0x00002abc
_080BECD4:
	adds r0, r2, 0x1
	lsls r0, 24
	lsrs r2, r0, 24
	cmp r2, 0xF
	bls _080BECA6
	movs r0, 0xFF
_080BECE0:
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end sub_80BECA0

	thumb_func_start sub_80BECE8
sub_80BECE8: @ 80BECE8
	push {r4,lr}
	bl sub_80BECA0
	lsls r0, 24
	lsrs r1, r0, 24
	cmp r1, 0xFF
	bne _080BED00
	ldr r1, _080BECFC @ =gScriptResult
	movs r0, 0
	b _080BED86
	.align 2, 0
_080BECFC: .4byte gScriptResult
_080BED00:
	ldr r0, _080BED2C @ =gSaveBlock1
	lsls r1, 2
	adds r4, r1, r0
	ldr r0, _080BED30 @ =0x00002abe
	adds r1, r4, r0
	ldrh r0, [r1]
	cmp r0, 0
	bne _080BED5C
	ldr r2, _080BED34 @ =0x00002abd
	adds r1, r4, r2
	movs r0, 0x2
	strb r0, [r1]
	ldr r0, _080BED38 @ =gLocalTime
	ldrb r0, [r0, 0x2]
	lsls r0, 24
	asrs r0, 24
	cmp r0, 0x13
	bgt _080BED40
	ldr r1, _080BED3C @ =gTVNewsTextGroup2
	subs r2, 0x1
	b _080BED44
	.align 2, 0
_080BED2C: .4byte gSaveBlock1
_080BED30: .4byte 0x00002abe
_080BED34: .4byte 0x00002abd
_080BED38: .4byte gLocalTime
_080BED3C: .4byte gTVNewsTextGroup2
_080BED40:
	ldr r1, _080BED54 @ =gTVNewsTextGroup3
	ldr r2, _080BED58 @ =0x00002abc
_080BED44:
	adds r0, r4, r2
	ldrb r0, [r0]
	lsls r0, 2
	adds r0, r1
	ldr r0, [r0]
	bl ShowFieldMessage
	b _080BED82
	.align 2, 0
_080BED54: .4byte gTVNewsTextGroup3
_080BED58: .4byte 0x00002abc
_080BED5C:
	ldrh r1, [r1]
	ldr r0, _080BED90 @ =gStringVar1
	movs r2, 0
	movs r3, 0x1
	bl ConvertIntToDecimalStringN
	ldr r0, _080BED94 @ =0x00002abd
	adds r1, r4, r0
	movs r0, 0
	strb r0, [r1]
	ldr r1, _080BED98 @ =gTVNewsTextGroup1
	ldr r2, _080BED9C @ =0x00002abc
	adds r0, r4, r2
	ldrb r0, [r0]
	lsls r0, 2
	adds r0, r1
	ldr r0, [r0]
	bl ShowFieldMessage
_080BED82:
	ldr r1, _080BEDA0 @ =gScriptResult
	movs r0, 0x1
_080BED86:
	strh r0, [r1]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080BED90: .4byte gStringVar1
_080BED94: .4byte 0x00002abd
_080BED98: .4byte gTVNewsTextGroup1
_080BED9C: .4byte 0x00002abc
_080BEDA0: .4byte gScriptResult
	thumb_func_end sub_80BECE8

	thumb_func_start GetPriceReduction
GetPriceReduction: @ 80BEDA4
	push {r4,r5,lr}
	lsls r0, 24
	lsrs r3, r0, 24
	cmp r3, 0
	bne _080BEDB4
	b _080BEDF6
_080BEDB0:
	movs r0, 0x1
	b _080BEDF8
_080BEDB4:
	movs r2, 0
	ldr r4, _080BEDE0 @ =gSaveBlock1
_080BEDB8:
	lsls r0, r2, 2
	adds r1, r0, r4
	ldr r5, _080BEDE4 @ =0x00002abc
	adds r0, r1, r5
	ldrb r0, [r0]
	cmp r0, r3
	bne _080BEDEC
	ldr r2, _080BEDE8 @ =0x00002abd
	adds r0, r1, r2
	ldrb r0, [r0]
	cmp r0, 0x2
	bne _080BEDF6
	adds r0, r3, 0
	bl IsPriceDiscounted
	lsls r0, 24
	cmp r0, 0
	bne _080BEDB0
	b _080BEDF6
	.align 2, 0
_080BEDE0: .4byte gSaveBlock1
_080BEDE4: .4byte 0x00002abc
_080BEDE8: .4byte 0x00002abd
_080BEDEC:
	adds r0, r2, 0x1
	lsls r0, 24
	lsrs r2, r0, 24
	cmp r2, 0xF
	bls _080BEDB8
_080BEDF6:
	movs r0, 0
_080BEDF8:
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end GetPriceReduction

	thumb_func_start IsPriceDiscounted
IsPriceDiscounted: @ 80BEE00
	push {lr}
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	beq _080BEE12
	cmp r0, 0x3
	beq _080BEE30
_080BEE0E:
	movs r0, 0x1
	b _080BEE3C
_080BEE12:
	ldr r0, _080BEE28 @ =gSaveBlock1
	ldrh r1, [r0, 0x4]
	movs r0, 0x80
	lsls r0, 1
	cmp r1, r0
	bne _080BEE3A
	ldr r0, _080BEE2C @ =gScriptLastTalked
	ldrh r0, [r0]
	cmp r0, 0x1A
	beq _080BEE0E
	b _080BEE3A
	.align 2, 0
_080BEE28: .4byte gSaveBlock1
_080BEE2C: .4byte gScriptLastTalked
_080BEE30:
	ldr r0, _080BEE40 @ =gSaveBlock1
	ldrh r1, [r0, 0x4]
	ldr r0, _080BEE44 @ =0x0000160d
	cmp r1, r0
	beq _080BEE0E
_080BEE3A:
	movs r0, 0
_080BEE3C:
	pop {r1}
	bx r1
	.align 2, 0
_080BEE40: .4byte gSaveBlock1
_080BEE44: .4byte 0x0000160d
	thumb_func_end IsPriceDiscounted

	thumb_func_start sub_80BEE48
sub_80BEE48: @ 80BEE48
	push {r4,lr}
	lsls r0, 24
	lsrs r2, r0, 24
	cmp r2, 0
	bne _080BEE56
_080BEE52:
	movs r0, 0x1
	b _080BEE74
_080BEE56:
	movs r1, 0
	ldr r4, _080BEE7C @ =gSaveBlock1
	ldr r3, _080BEE80 @ =0x00002abc
_080BEE5C:
	lsls r0, r1, 2
	adds r0, r4
	adds r0, r3
	ldrb r0, [r0]
	cmp r0, r2
	beq _080BEE52
	adds r0, r1, 0x1
	lsls r0, 24
	lsrs r1, r0, 24
	cmp r1, 0xF
	bls _080BEE5C
	movs r0, 0
_080BEE74:
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_080BEE7C: .4byte gSaveBlock1
_080BEE80: .4byte 0x00002abc
	thumb_func_end sub_80BEE48

	thumb_func_start sub_80BEE84
sub_80BEE84: @ 80BEE84
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	lsls r0, 16
	lsrs r7, r0, 16
	movs r5, 0
	ldr r0, _080BEEB8 @ =gSaveBlock1
	mov r8, r0
_080BEE94:
	lsls r0, r5, 2
	mov r1, r8
	adds r2, r0, r1
	ldr r3, _080BEEBC @ =0x00002abc
	adds r1, r2, r3
	ldrb r1, [r1]
	adds r6, r0, 0
	cmp r1, 0
	beq _080BEEEC
	ldr r1, _080BEEC0 @ =0x00002abe
	adds r0, r2, r1
	ldrh r0, [r0]
	cmp r0, r7
	bcs _080BEEC4
	adds r0, r5, 0
	bl sub_80BEC10
	b _080BEEEC
	.align 2, 0
_080BEEB8: .4byte gSaveBlock1
_080BEEBC: .4byte 0x00002abc
_080BEEC0: .4byte 0x00002abe
_080BEEC4:
	ldr r3, _080BEF04 @ =0x00002abd
	adds r4, r2, r3
	ldrb r0, [r4]
	cmp r0, 0
	bne _080BEEDE
	ldr r0, _080BEF08 @ =0x00000804
	bl FlagGet
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _080BEEDE
	strb r0, [r4]
_080BEEDE:
	mov r0, r8
	adds r1, r6, r0
	ldr r3, _080BEF0C @ =0x00002abe
	adds r1, r3
	ldrh r0, [r1]
	subs r0, r7
	strh r0, [r1]
_080BEEEC:
	adds r0, r5, 0x1
	lsls r0, 24
	lsrs r5, r0, 24
	cmp r5, 0xF
	bls _080BEE94
	bl sub_80BEC40
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080BEF04: .4byte 0x00002abd
_080BEF08: .4byte 0x00000804
_080BEF0C: .4byte 0x00002abe
	thumb_func_end sub_80BEE84

	thumb_func_start sub_80BEF10
sub_80BEF10: @ 80BEF10
	push {lr}
	lsls r0, 24
	lsrs r0, 24
	lsls r1, 24
	lsrs r1, 24
	adds r2, r1, 0
	cmp r1, 0x1
	beq _080BEF50
	cmp r1, 0x1
	bgt _080BEF2A
	cmp r1, 0
	beq _080BEF34
	b _080BEF98
_080BEF2A:
	cmp r2, 0x2
	beq _080BEF6C
	cmp r2, 0x3
	beq _080BEF88
	b _080BEF98
_080BEF34:
	ldr r1, _080BEF48 @ =gUnknown_083D1464
	lsls r0, 2
	adds r0, r1
	ldr r0, [r0]
	ldr r1, _080BEF4C @ =gUnknown_083CE048
	ldr r1, [r1, 0x14]
	bl StringCopy
	b _080BEF98
	.align 2, 0
_080BEF48: .4byte gUnknown_083D1464
_080BEF4C: .4byte gUnknown_083CE048
_080BEF50:
	ldr r1, _080BEF64 @ =gUnknown_083D1464
	lsls r0, 2
	adds r0, r1
	ldr r0, [r0]
	ldr r1, _080BEF68 @ =gUnknown_083CE048
	ldr r1, [r1, 0x18]
	bl StringCopy
	b _080BEF98
	.align 2, 0
_080BEF64: .4byte gUnknown_083D1464
_080BEF68: .4byte gUnknown_083CE048
_080BEF6C:
	ldr r1, _080BEF80 @ =gUnknown_083D1464
	lsls r0, 2
	adds r0, r1
	ldr r0, [r0]
	ldr r1, _080BEF84 @ =gUnknown_083CE048
	ldr r1, [r1, 0x1C]
	bl StringCopy
	b _080BEF98
	.align 2, 0
_080BEF80: .4byte gUnknown_083D1464
_080BEF84: .4byte gUnknown_083CE048
_080BEF88:
	ldr r1, _080BEF9C @ =gUnknown_083D1464
	lsls r0, 2
	adds r0, r1
	ldr r0, [r0]
	ldr r1, _080BEFA0 @ =gUnknown_083CE048
	ldr r1, [r1, 0x20]
	bl StringCopy
_080BEF98:
	pop {r0}
	bx r0
	.align 2, 0
_080BEF9C: .4byte gUnknown_083D1464
_080BEFA0: .4byte gUnknown_083CE048
	thumb_func_end sub_80BEF10

	thumb_func_start CopyContestCategoryToStringVar
CopyContestCategoryToStringVar: @ 80BEFA4
	push {lr}
	lsls r0, 24
	lsrs r2, r0, 24
	lsls r1, 24
	lsrs r0, r1, 24
	cmp r0, 0x4
	bhi _080BF054
	lsls r0, 2
	ldr r1, _080BEFBC @ =_080BEFC0
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_080BEFBC: .4byte _080BEFC0
	.align 2, 0
_080BEFC0:
	.4byte _080BEFD4
	.4byte _080BEFF0
	.4byte _080BF00C
	.4byte _080BF028
	.4byte _080BF044
_080BEFD4:
	ldr r1, _080BEFE8 @ =gUnknown_083D1464
	lsls r0, r2, 2
	adds r0, r1
	ldr r0, [r0]
	ldr r1, _080BEFEC @ =gUnknown_083CE048
	ldr r1, [r1]
	bl StringCopy
	b _080BF054
	.align 2, 0
_080BEFE8: .4byte gUnknown_083D1464
_080BEFEC: .4byte gUnknown_083CE048
_080BEFF0:
	ldr r1, _080BF004 @ =gUnknown_083D1464
	lsls r0, r2, 2
	adds r0, r1
	ldr r0, [r0]
	ldr r1, _080BF008 @ =gUnknown_083CE048
	ldr r1, [r1, 0x4]
	bl StringCopy
	b _080BF054
	.align 2, 0
_080BF004: .4byte gUnknown_083D1464
_080BF008: .4byte gUnknown_083CE048
_080BF00C:
	ldr r1, _080BF020 @ =gUnknown_083D1464
	lsls r0, r2, 2
	adds r0, r1
	ldr r0, [r0]
	ldr r1, _080BF024 @ =gUnknown_083CE048
	ldr r1, [r1, 0x8]
	bl StringCopy
	b _080BF054
	.align 2, 0
_080BF020: .4byte gUnknown_083D1464
_080BF024: .4byte gUnknown_083CE048
_080BF028:
	ldr r1, _080BF03C @ =gUnknown_083D1464
	lsls r0, r2, 2
	adds r0, r1
	ldr r0, [r0]
	ldr r1, _080BF040 @ =gUnknown_083CE048
	ldr r1, [r1, 0xC]
	bl StringCopy
	b _080BF054
	.align 2, 0
_080BF03C: .4byte gUnknown_083D1464
_080BF040: .4byte gUnknown_083CE048
_080BF044:
	ldr r1, _080BF058 @ =gUnknown_083D1464
	lsls r0, r2, 2
	adds r0, r1
	ldr r0, [r0]
	ldr r1, _080BF05C @ =gUnknown_083CE048
	ldr r1, [r1, 0x10]
	bl StringCopy
_080BF054:
	pop {r0}
	bx r0
	.align 2, 0
_080BF058: .4byte gUnknown_083D1464
_080BF05C: .4byte gUnknown_083CE048
	thumb_func_end CopyContestCategoryToStringVar

	thumb_func_start SetContestCategoryStringVarForInterview
SetContestCategoryStringVarForInterview: @ 80BF060
	push {lr}
	ldr r0, _080BF080 @ =gSpecialVar_0x8004
	ldrh r1, [r0]
	lsls r0, r1, 3
	adds r0, r1
	lsls r0, 2
	ldr r1, _080BF084 @ =gSaveBlock1 + 0x2738
	adds r0, r1
	ldrb r1, [r0, 0x13]
	lsls r1, 29
	lsrs r1, 29
	movs r0, 0x1
	bl CopyContestCategoryToStringVar
	pop {r0}
	bx r0
	.align 2, 0
_080BF080: .4byte gSpecialVar_0x8004
_080BF084: .4byte gSaveBlock1 + 0x2738
	thumb_func_end SetContestCategoryStringVarForInterview

	thumb_func_start sub_80BF088
sub_80BF088: @ 80BF088
	push {r4,r5,lr}
	adds r4, r0, 0
	adds r5, r1, 0
	lsls r4, 24
	lsrs r4, 24
	adds r0, r5, 0
	bl sub_80BF0B8
	adds r3, r0, 0
	ldr r0, _080BF0B4 @ =gUnknown_083D1464
	lsls r4, 2
	adds r4, r0
	ldr r0, [r4]
	lsls r3, 24
	lsrs r3, 24
	adds r1, r5, 0
	movs r2, 0
	bl ConvertIntToDecimalStringN
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080BF0B4: .4byte gUnknown_083D1464
	thumb_func_end sub_80BF088

	thumb_func_start sub_80BF0B8
sub_80BF0B8: @ 80BF0B8
	push {r4,lr}
	adds r4, r0, 0
	movs r1, 0xA
	bl __divsi3
	cmp r0, 0
	beq _080BF144
	adds r0, r4, 0
	movs r1, 0x64
	bl __divsi3
	cmp r0, 0
	bne _080BF0D6
	movs r0, 0x2
	b _080BF14E
_080BF0D6:
	movs r1, 0xFA
	lsls r1, 2
	adds r0, r4, 0
	bl __divsi3
	cmp r0, 0
	bne _080BF0E8
	movs r0, 0x3
	b _080BF14E
_080BF0E8:
	ldr r1, _080BF0F8 @ =0x00002710
	adds r0, r4, 0
	bl __divsi3
	cmp r0, 0
	bne _080BF0FC
	movs r0, 0x4
	b _080BF14E
	.align 2, 0
_080BF0F8: .4byte 0x00002710
_080BF0FC:
	ldr r1, _080BF10C @ =0x000186a0
	adds r0, r4, 0
	bl __divsi3
	cmp r0, 0
	bne _080BF110
	movs r0, 0x5
	b _080BF14E
	.align 2, 0
_080BF10C: .4byte 0x000186a0
_080BF110:
	ldr r1, _080BF120 @ =0x000f4240
	adds r0, r4, 0
	bl __divsi3
	cmp r0, 0
	bne _080BF124
	movs r0, 0x6
	b _080BF14E
	.align 2, 0
_080BF120: .4byte 0x000f4240
_080BF124:
	ldr r1, _080BF134 @ =0x00989680
	adds r0, r4, 0
	bl __divsi3
	cmp r0, 0
	bne _080BF138
	movs r0, 0x7
	b _080BF14E
	.align 2, 0
_080BF134: .4byte 0x00989680
_080BF138:
	ldr r1, _080BF148 @ =0x05f5e100
	adds r0, r4, 0
	bl __divsi3
	cmp r0, 0
	beq _080BF14C
_080BF144:
	movs r0, 0x1
	b _080BF14E
	.align 2, 0
_080BF148: .4byte 0x05f5e100
_080BF14C:
	movs r0, 0x8
_080BF14E:
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end sub_80BF0B8

	thumb_func_start sub_80BF154
sub_80BF154: @ 80BF154
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	adds r6, r1, 0
	lsls r0, 24
	lsrs r0, 24
	mov r8, r0
	movs r7, 0
	movs r5, 0
_080BF166:
	lsls r4, r5, 1
	adds r0, r6, 0x6
	adds r1, r0, r4
	ldrh r0, [r1]
	cmp r0, 0
	beq _080BF186
	bl ItemId_GetPrice
	lsls r0, 16
	lsrs r0, 16
	adds r1, r6, 0
	adds r1, 0xC
	adds r1, r4
	ldrh r1, [r1]
	muls r0, r1
	adds r7, r0
_080BF186:
	adds r0, r5, 0x1
	lsls r0, 24
	lsrs r5, r0, 24
	cmp r5, 0x2
	bls _080BF166
	ldrb r0, [r6, 0x2]
	cmp r0, 0x1
	bne _080BF1A0
	asrs r1, r7, 1
	mov r0, r8
	bl sub_80BF088
	b _080BF1A8
_080BF1A0:
	mov r0, r8
	adds r1, r7, 0
	bl sub_80BF088
_080BF1A8:
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r0}
	bx r0
	thumb_func_end sub_80BF154

	thumb_func_start sub_80BF1B4
sub_80BF1B4: @ 80BF1B4
	push {r4-r7,lr}
	lsls r0, 24
	lsrs r6, r0, 24
	ldr r7, _080BF1F4 @ =gSaveBlock1 + 0x2738
	bl GetPlayerTrainerId
	adds r5, r0, 0
	movs r4, 0x5
_080BF1C4:
	lsls r0, r4, 3
	adds r0, r4
	lsls r0, 2
	adds r1, r0, r7
	ldrb r0, [r1]
	cmp r0, r6
	bne _080BF1F8
	movs r3, 0xFF
	adds r0, r5, 0
	ands r0, r3
	adds r2, r1, 0
	adds r2, 0x22
	ldrb r2, [r2]
	cmp r0, r2
	bne _080BF1F8
	lsrs r0, r5, 8
	ands r0, r3
	adds r1, 0x23
	ldrb r1, [r1]
	cmp r0, r1
	bne _080BF1F8
	movs r0, 0x1
	b _080BF204
	.align 2, 0
_080BF1F4: .4byte gSaveBlock1 + 0x2738
_080BF1F8:
	adds r0, r4, 0x1
	lsls r0, 24
	lsrs r4, r0, 24
	cmp r4, 0x17
	bls _080BF1C4
	movs r0, 0
_080BF204:
	pop {r4-r7}
	pop {r1}
	bx r1
	thumb_func_end sub_80BF1B4

	thumb_func_start sub_80BF20C
sub_80BF20C: @ 80BF20C
	push {r4-r7,lr}
	movs r2, 0
_080BF210:
	adds r1, r2, 0x1
	lsls r0, r1, 24
	lsrs r5, r0, 24
	adds r7, r1, 0
	cmp r5, 0x2
	bhi _080BF248
	ldr r6, _080BF258 @ =gUnknown_02038724
	lsls r0, r2, 2
	adds r4, r0, r6
_080BF222:
	lsls r0, r5, 2
	adds r3, r0, r6
	ldrh r0, [r4, 0x2]
	ldrh r1, [r3, 0x2]
	cmp r0, r1
	bcs _080BF23E
	ldrh r1, [r4]
	adds r2, r0, 0
	ldrh r0, [r3]
	strh r0, [r4]
	ldrh r0, [r3, 0x2]
	strh r0, [r4, 0x2]
	strh r1, [r3]
	strh r2, [r3, 0x2]
_080BF23E:
	adds r0, r5, 0x1
	lsls r0, 24
	lsrs r5, r0, 24
	cmp r5, 0x2
	bls _080BF222
_080BF248:
	lsls r0, r7, 24
	lsrs r2, r0, 24
	cmp r2, 0x1
	bls _080BF210
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080BF258: .4byte gUnknown_02038724
	thumb_func_end sub_80BF20C

	thumb_func_start sub_80BF25C
sub_80BF25C: @ 80BF25C
	push {r4-r6,lr}
	lsls r0, 24
	lsrs r5, r0, 24
	movs r1, 0
	ldr r3, _080BF28C @ =gSaveBlock1
	ldr r0, _080BF290 @ =0x00002738
	adds r4, r3, r0
_080BF26A:
	lsls r0, r1, 3
	adds r0, r1
	lsls r0, 2
	adds r2, r0, r3
	ldr r6, _080BF290 @ =0x00002738
	adds r0, r2, r6
	ldrb r0, [r0]
	cmp r0, r5
	bne _080BF2AE
	ldr r3, _080BF294 @ =0x00002739
	adds r0, r2, r3
	ldrb r2, [r0]
	cmp r2, 0x1
	bne _080BF29C
	ldr r0, _080BF298 @ =gScriptResult
	strh r2, [r0]
	b _080BF2BC
	.align 2, 0
_080BF28C: .4byte gSaveBlock1
_080BF290: .4byte 0x00002738
_080BF294: .4byte 0x00002739
_080BF298: .4byte gScriptResult
_080BF29C:
	adds r0, r4, 0
	bl sub_80BF55C
	adds r0, r4, 0
	bl sub_80BF588
	bl sub_80BF6D8
	b _080BF2BC
_080BF2AE:
	adds r0, r1, 0x1
	lsls r0, 24
	lsrs r1, r0, 24
	cmp r1, 0x4
	bls _080BF26A
	bl sub_80BF6D8
_080BF2BC:
	pop {r4-r6}
	pop {r0}
	bx r0
	thumb_func_end sub_80BF25C

	thumb_func_start sub_80BF2C4
sub_80BF2C4: @ 80BF2C4
	push {lr}
	ldr r1, _080BF2E0 @ =gScriptResult
	movs r0, 0
	strh r0, [r1]
	ldr r0, _080BF2E4 @ =gSpecialVar_0x8005
	ldrh r0, [r0]
	subs r0, 0x1
	cmp r0, 0x6
	bhi _080BF330
	lsls r0, 2
	ldr r1, _080BF2E8 @ =_080BF2EC
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_080BF2E0: .4byte gScriptResult
_080BF2E4: .4byte gSpecialVar_0x8005
_080BF2E8: .4byte _080BF2EC
	.align 2, 0
_080BF2EC:
	.4byte _080BF308
	.4byte _080BF30E
	.4byte _080BF314
	.4byte _080BF31A
	.4byte _080BF320
	.4byte _080BF326
	.4byte _080BF32C
_080BF308:
	bl sub_80BF334
	b _080BF330
_080BF30E:
	bl sub_80BF3A4
	b _080BF330
_080BF314:
	bl sub_80BF3DC
	b _080BF330
_080BF31A:
	bl sub_80BF46C
	b _080BF330
_080BF320:
	bl sub_80BF478
	b _080BF330
_080BF326:
	bl sub_80BF484
	b _080BF330
_080BF32C:
	bl sub_80BF4BC
_080BF330:
	pop {r0}
	bx r0
	thumb_func_end sub_80BF2C4

	thumb_func_start sub_80BF334
sub_80BF334: @ 80BF334
	push {r4,lr}
	movs r0, 0x1
	bl sub_80BF25C
	ldr r0, _080BF38C @ =gScriptResult
	ldrh r0, [r0]
	cmp r0, 0
	bne _080BF384
	ldr r4, _080BF390 @ =gStringVar1
	bl GetLeadMonIndex
	lsls r0, 24
	lsrs r0, 24
	movs r1, 0x64
	muls r0, r1
	ldr r1, _080BF394 @ =gPlayerParty
	adds r0, r1
	movs r1, 0xB
	movs r2, 0
	bl GetMonData
	movs r1, 0xB
	muls r1, r0
	ldr r0, _080BF398 @ =gSpeciesNames
	adds r1, r0
	adds r0, r4, 0
	bl StringCopy
	ldr r0, _080BF39C @ =gUnknown_03005D38
	movs r1, 0
	ldrsb r1, [r0, r1]
	lsls r0, r1, 3
	adds r0, r1
	lsls r0, 2
	ldr r1, _080BF3A0 @ =gSaveBlock1 + 0x2738
	adds r0, r1
	adds r0, 0x4
	movs r1, 0x6
	bl sub_80EB6FC
_080BF384:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080BF38C: .4byte gScriptResult
_080BF390: .4byte gStringVar1
_080BF394: .4byte gPlayerParty
_080BF398: .4byte gSpeciesNames
_080BF39C: .4byte gUnknown_03005D38
_080BF3A0: .4byte gSaveBlock1 + 0x2738
	thumb_func_end sub_80BF334

	thumb_func_start sub_80BF3A4
sub_80BF3A4: @ 80BF3A4
	push {lr}
	movs r0, 0x2
	bl sub_80BF25C
	ldr r0, _080BF3D0 @ =gScriptResult
	ldrh r0, [r0]
	cmp r0, 0
	bne _080BF3CC
	ldr r0, _080BF3D4 @ =gUnknown_03005D38
	movs r1, 0
	ldrsb r1, [r0, r1]
	lsls r0, r1, 3
	adds r0, r1
	lsls r0, 2
	ldr r1, _080BF3D8 @ =gSaveBlock1 + 0x2738
	adds r0, r1
	adds r0, 0x4
	movs r1, 0x6
	bl sub_80EB6FC
_080BF3CC:
	pop {r0}
	bx r0
	.align 2, 0
_080BF3D0: .4byte gScriptResult
_080BF3D4: .4byte gUnknown_03005D38
_080BF3D8: .4byte gSaveBlock1 + 0x2738
	thumb_func_end sub_80BF3A4

	thumb_func_start sub_80BF3DC
sub_80BF3DC: @ 80BF3DC
	push {r4-r6,lr}
	movs r0, 0x3
	bl sub_80BF25C
	ldr r0, _080BF450 @ =gScriptResult
	ldrh r0, [r0]
	cmp r0, 0
	bne _080BF448
	ldr r6, _080BF454 @ =gStringVar1
	bl GetLeadMonIndex
	lsls r0, 24
	lsrs r0, 24
	movs r5, 0x64
	muls r0, r5
	ldr r4, _080BF458 @ =gPlayerParty
	adds r0, r4
	movs r1, 0xB
	movs r2, 0
	bl GetMonData
	movs r1, 0xB
	muls r1, r0
	ldr r0, _080BF45C @ =gSpeciesNames
	adds r1, r0
	adds r0, r6, 0
	bl StringCopy
	bl GetLeadMonIndex
	lsls r0, 24
	lsrs r0, 24
	muls r0, r5
	adds r0, r4
	ldr r4, _080BF460 @ =gStringVar2
	movs r1, 0x2
	adds r2, r4, 0
	bl GetMonData
	adds r0, r4, 0
	bl StringGetEnd10
	ldr r0, _080BF464 @ =gUnknown_03005D38
	movs r1, 0
	ldrsb r1, [r0, r1]
	lsls r0, r1, 3
	adds r0, r1
	lsls r0, 2
	ldr r1, _080BF468 @ =gSaveBlock1 + 0x2738
	adds r0, r1
	adds r0, 0x1C
	movs r1, 0x2
	bl sub_80EB6FC
_080BF448:
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_080BF450: .4byte gScriptResult
_080BF454: .4byte gStringVar1
_080BF458: .4byte gPlayerParty
_080BF45C: .4byte gSpeciesNames
_080BF460: .4byte gStringVar2
_080BF464: .4byte gUnknown_03005D38
_080BF468: .4byte gSaveBlock1 + 0x2738
	thumb_func_end sub_80BF3DC

	thumb_func_start sub_80BF46C
sub_80BF46C: @ 80BF46C
	ldr r1, _080BF474 @ =gScriptResult
	movs r0, 0x1
	strh r0, [r1]
	bx lr
	.align 2, 0
_080BF474: .4byte gScriptResult
	thumb_func_end sub_80BF46C

	thumb_func_start sub_80BF478
sub_80BF478: @ 80BF478
	push {lr}
	movs r0, 0x5
	bl sub_80BF25C
	pop {r0}
	bx r0
	thumb_func_end sub_80BF478

	thumb_func_start sub_80BF484
sub_80BF484: @ 80BF484
	push {lr}
	movs r0, 0x6
	bl sub_80BF25C
	ldr r0, _080BF4B0 @ =gScriptResult
	ldrh r0, [r0]
	cmp r0, 0
	bne _080BF4AC
	ldr r0, _080BF4B4 @ =gUnknown_03005D38
	movs r1, 0
	ldrsb r1, [r0, r1]
	lsls r0, r1, 3
	adds r0, r1
	lsls r0, 2
	ldr r1, _080BF4B8 @ =gSaveBlock1 + 0x2738
	adds r0, r1
	adds r0, 0x4
	movs r1, 0x2
	bl sub_80EB6FC
_080BF4AC:
	pop {r0}
	bx r0
	.align 2, 0
_080BF4B0: .4byte gScriptResult
_080BF4B4: .4byte gUnknown_03005D38
_080BF4B8: .4byte gSaveBlock1 + 0x2738
	thumb_func_end sub_80BF484

	thumb_func_start sub_80BF4BC
sub_80BF4BC: @ 80BF4BC
	push {lr}
	movs r0, 0x7
	bl sub_80BF25C
	ldr r0, _080BF4E8 @ =gScriptResult
	ldrh r0, [r0]
	cmp r0, 0
	bne _080BF4E4
	ldr r0, _080BF4EC @ =gUnknown_03005D38
	movs r1, 0
	ldrsb r1, [r0, r1]
	lsls r0, r1, 3
	adds r0, r1
	lsls r0, 2
	ldr r1, _080BF4F0 @ =gSaveBlock1 + 0x2738
	adds r0, r1
	adds r0, 0x18
	movs r1, 0x1
	bl sub_80EB6FC
_080BF4E4:
	pop {r0}
	bx r0
	.align 2, 0
_080BF4E8: .4byte gScriptResult
_080BF4EC: .4byte gUnknown_03005D38
_080BF4F0: .4byte gSaveBlock1 + 0x2738
	thumb_func_end sub_80BF4BC

.section .text_80BF544

	thumb_func_start sub_80BFD44
sub_80BFD44: @ 80BFD44
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	mov r8, r0
	adds r7, r1, 0
	lsls r2, 24
	lsrs r6, r2, 24
	movs r4, 0
_080BFD54:
	lsls r0, r4, 3
	subs r0, r4
	lsls r0, 5
	adds r0, r4
	lsls r0, 2
	ldr r5, _080BFD8C @ =0x02007000
	adds r0, r5
	adds r1, r4, 0
	muls r1, r7
	add r1, r8
	movs r2, 0xE1
	lsls r2, 2
	bl memcpy
	adds r0, r4, 0x1
	lsls r0, 24
	lsrs r4, r0, 24
	cmp r4, 0x3
	bls _080BFD54
	adds r4, r5, 0
	cmp r6, 0x1
	beq _080BFDBC
	cmp r6, 0x1
	bgt _080BFD90
	cmp r6, 0
	beq _080BFD9A
	b _080BFDFC
	.align 2, 0
_080BFD8C: .4byte 0x02007000
_080BFD90:
	cmp r6, 0x2
	beq _080BFDCC
	cmp r6, 0x3
	beq _080BFDE8
	b _080BFDFC
_080BFD9A:
	ldr r0, _080BFDB4 @ =gSaveBlock1 + 0x2738
	movs r2, 0xE1
	lsls r2, 2
	adds r1, r4, r2
	movs r3, 0xE1
	lsls r3, 3
	adds r2, r4, r3
	ldr r5, _080BFDB8 @ =0x00000a8c
	adds r3, r4, r5
	bl sub_80BFE24
	b _080BFDFC
	.align 2, 0
_080BFDB4: .4byte gSaveBlock1 + 0x2738
_080BFDB8: .4byte 0x00000a8c
_080BFDBC:
	ldr r1, _080BFDC8 @ =gSaveBlock1 + 0x2738
	movs r0, 0xE1
	lsls r0, 3
	adds r2, r4, r0
	b _080BFDD4
	.align 2, 0
_080BFDC8: .4byte gSaveBlock1 + 0x2738
_080BFDCC:
	movs r0, 0xE1
	lsls r0, 2
	adds r1, r4, r0
	ldr r2, _080BFDE0 @ =gSaveBlock1 + 0x2738
_080BFDD4:
	ldr r5, _080BFDE4 @ =0x00000a8c
	adds r3, r4, r5
	adds r0, r4, 0
	bl sub_80BFE24
	b _080BFDFC
	.align 2, 0
_080BFDE0: .4byte gSaveBlock1 + 0x2738
_080BFDE4: .4byte 0x00000a8c
_080BFDE8:
	movs r0, 0xE1
	lsls r0, 2
	adds r1, r5, r0
	movs r3, 0xE1
	lsls r3, 3
	adds r2, r5, r3
	ldr r3, _080BFE20 @ =gSaveBlock1 + 0x2738
	adds r0, r5, 0
	bl sub_80BFE24
_080BFDFC:
	ldr r4, _080BFE20 @ =gSaveBlock1 + 0x2738
	adds r0, r4, 0
	bl sub_80BF588
	bl sub_80C04A0
	adds r0, r4, 0
	bl sub_80BF588
	bl sub_80C01D4
	bl sub_80C0408
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080BFE20: .4byte gSaveBlock1 + 0x2738
	thumb_func_end sub_80BFD44

	thumb_func_start sub_80BFE24
sub_80BFE24: @ 80BFE24
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	sub sp, 0x20
	str r0, [sp, 0x10]
	str r1, [sp, 0x14]
	str r2, [sp, 0x18]
	str r3, [sp, 0x1C]
	add r0, sp, 0x10
	str r0, [sp]
	add r0, sp, 0x14
	str r0, [sp, 0x4]
	add r0, sp, 0x18
	str r0, [sp, 0x8]
	add r0, sp, 0x1C
	str r0, [sp, 0xC]
	bl GetLinkPlayerCount
	ldr r1, _080BFEA0 @ =gUnknown_03000720
	strb r0, [r1]
_080BFE50:
	movs r6, 0
	ldr r0, _080BFEA0 @ =gUnknown_03000720
	ldrb r1, [r0]
	cmp r6, r1
	bcs _080BFE50
	mov r10, r0
_080BFE5C:
	cmp r6, 0
	bne _080BFE64
	ldr r2, _080BFEA4 @ =gUnknown_020387E4
	strb r6, [r2]
_080BFE64:
	lsls r4, r6, 2
	mov r3, sp
	adds r0, r3, r4
	ldr r0, [r0]
	ldr r0, [r0]
	bl sub_80C019C
	ldr r1, _080BFEA8 @ =gUnknown_03000722
	strb r0, [r1]
	lsls r0, 24
	asrs r0, 24
	movs r1, 0x1
	negs r1, r1
	adds r7, r4, 0
	cmp r0, r1
	bne _080BFEAC
	ldr r1, _080BFEA4 @ =gUnknown_020387E4
	ldrb r0, [r1]
	adds r0, 0x1
	strb r0, [r1]
	lsls r0, 24
	lsrs r0, 24
	mov r2, r10
	ldrb r2, [r2]
	cmp r0, r2
	beq _080BFF58
	adds r6, 0x1
	mov r9, r6
	b _080BFF3C
	.align 2, 0
_080BFEA0: .4byte gUnknown_03000720
_080BFEA4: .4byte gUnknown_020387E4
_080BFEA8: .4byte gUnknown_03000722
_080BFEAC:
	movs r5, 0
	mov r3, r10
	ldrb r0, [r3]
	subs r0, 0x1
	adds r2, r6, 0x1
	mov r9, r2
	cmp r5, r0
	bge _080BFF22
	ldr r3, _080BFF4C @ =gUnknown_03000720
	mov r8, r3
_080BFEC0:
	adds r0, r6, r5
	adds r4, r0, 0x1
	mov r0, r8
	ldrb r1, [r0]
	adds r0, r4, 0
	bl __modsi3
	lsls r0, 2
	add r0, sp
	ldr r0, [r0]
	ldr r0, [r0]
	bl sub_80BF74C
	ldr r1, _080BFF50 @ =gUnknown_03005D38
	strb r0, [r1]
	lsls r0, 24
	asrs r0, 24
	movs r1, 0x1
	negs r1, r1
	cmp r0, r1
	beq _080BFF12
	mov r2, r8
	ldrb r1, [r2]
	adds r0, r4, 0
	bl __modsi3
	adds r2, r0, 0
	lsls r0, r2, 2
	add r0, sp
	ldr r0, [r0]
	mov r3, sp
	adds r1, r3, r7
	ldr r1, [r1]
	lsls r2, 24
	lsrs r2, 24
	bl sub_80BFF68
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	beq _080BFF22
_080BFF12:
	adds r0, r5, 0x1
	lsls r0, 24
	lsrs r5, r0, 24
	mov r1, r8
	ldrb r0, [r1]
	subs r0, 0x1
	cmp r5, r0
	blt _080BFEC0
_080BFF22:
	mov r2, r10
	ldrb r0, [r2]
	subs r0, 0x1
	cmp r5, r0
	bne _080BFF3C
	mov r3, sp
	adds r0, r3, r7
	ldr r0, [r0]
	ldr r0, [r0]
	ldr r1, _080BFF54 @ =gUnknown_03000722
	ldrb r1, [r1]
	bl sub_80BF55C
_080BFF3C:
	mov r1, r9
	lsls r0, r1, 24
	lsrs r6, r0, 24
	mov r2, r10
	ldrb r2, [r2]
	cmp r6, r2
	bcc _080BFE5C
	b _080BFE50
	.align 2, 0
_080BFF4C: .4byte gUnknown_03000720
_080BFF50: .4byte gUnknown_03005D38
_080BFF54: .4byte gUnknown_03000722
_080BFF58:
	add sp, 0x20
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	thumb_func_end sub_80BFE24

	thumb_func_start sub_80BFF68
sub_80BFF68: @ 80BFF68
	push {r4-r7,lr}
	sub sp, 0x4
	lsls r2, 24
	lsrs r7, r2, 24
	ldr r4, [r0]
	ldr r6, [r1]
	movs r5, 0
	ldr r2, _080BFFA4 @ =gUnknown_03000722
	movs r1, 0
	ldrsb r1, [r2, r1]
	lsls r0, r1, 3
	adds r0, r1
	lsls r0, 2
	adds r0, r6
	ldrb r0, [r0]
	str r2, [sp]
	bl sub_80BFB54
	lsls r0, 24
	lsrs r0, 24
	adds r1, r0, 0
	ldr r2, [sp]
	cmp r0, 0x3
	beq _080BFFD8
	cmp r0, 0x3
	bgt _080BFFA8
	cmp r0, 0x2
	beq _080BFFAE
	b _080C0026
	.align 2, 0
_080BFFA4: .4byte gUnknown_03000722
_080BFFA8:
	cmp r1, 0x4
	beq _080C0000
	b _080C0026
_080BFFAE:
	ldr r0, _080BFFD4 @ =gUnknown_03005D38
	movs r1, 0
	ldrsb r1, [r0, r1]
	lsls r0, r1, 3
	adds r0, r1
	lsls r0, 2
	adds r0, r4, r0
	ldrb r2, [r2]
	lsls r2, 24
	asrs r2, 24
	lsls r1, r2, 3
	adds r1, r2
	lsls r1, 2
	adds r1, r6, r1
	adds r2, r7, 0
	bl sub_80C004C
	b _080C0022
	.align 2, 0
_080BFFD4: .4byte gUnknown_03005D38
_080BFFD8:
	ldr r0, _080BFFFC @ =gUnknown_03005D38
	movs r1, 0
	ldrsb r1, [r0, r1]
	lsls r0, r1, 3
	adds r0, r1
	lsls r0, 2
	adds r0, r4, r0
	ldrb r2, [r2]
	lsls r2, 24
	asrs r2, 24
	lsls r1, r2, 3
	adds r1, r2
	lsls r1, 2
	adds r1, r6, r1
	adds r2, r7, 0
	bl sub_80C00B4
	b _080C0022
	.align 2, 0
_080BFFFC: .4byte gUnknown_03005D38
_080C0000:
	ldr r0, _080C0030 @ =gUnknown_03005D38
	movs r1, 0
	ldrsb r1, [r0, r1]
	lsls r0, r1, 3
	adds r0, r1
	lsls r0, 2
	adds r0, r4, r0
	ldrb r2, [r2]
	lsls r2, 24
	asrs r2, 24
	lsls r1, r2, 3
	adds r1, r2
	lsls r1, 2
	adds r1, r6, r1
	adds r2, r7, 0
	bl sub_80C0134
_080C0022:
	lsls r0, 24
	lsrs r5, r0, 24
_080C0026:
	cmp r5, 0x1
	beq _080C0034
	movs r0, 0
	b _080C0040
	.align 2, 0
_080C0030: .4byte gUnknown_03005D38
_080C0034:
	ldr r0, _080C0048 @ =gUnknown_03000722
	ldrb r1, [r0]
	adds r0, r6, 0
	bl sub_80BF55C
	movs r0, 0x1
_080C0040:
	add sp, 0x4
	pop {r4-r7}
	pop {r1}
	bx r1
	.align 2, 0
_080C0048: .4byte gUnknown_03000722
	thumb_func_end sub_80BFF68

	thumb_func_start sub_80C004C
sub_80C004C: @ 80C004C
	push {r4-r6,lr}
	adds r6, r0, 0
	adds r4, r1, 0
	lsls r0, r2, 24
	lsrs r0, 24
	bl GetLinkPlayerTrainerId
	adds r5, r0, 0
	movs r2, 0xFF
	ands r0, r2
	adds r1, r4, 0
	adds r1, 0x22
	ldrb r1, [r1]
	cmp r0, r1
	bne _080C007C
	lsrs r0, r5, 8
	ands r0, r2
	adds r1, r4, 0
	adds r1, 0x23
	ldrb r1, [r1]
	cmp r0, r1
	bne _080C007C
	movs r0, 0
	b _080C00AC
_080C007C:
	adds r1, r4, 0
	adds r1, 0x20
	ldrb r0, [r1]
	adds r2, r4, 0
	adds r2, 0x22
	strb r0, [r2]
	adds r3, r4, 0
	adds r3, 0x21
	ldrb r0, [r3]
	adds r2, 0x1
	strb r0, [r2]
	strb r5, [r1]
	lsrs r0, r5, 8
	strb r0, [r3]
	adds r1, r6, 0
	adds r0, r4, 0
	ldm r0!, {r2-r4}
	stm r1!, {r2-r4}
	ldm r0!, {r2-r4}
	stm r1!, {r2-r4}
	ldm r0!, {r2-r4}
	stm r1!, {r2-r4}
	movs r0, 0x1
	strb r0, [r6, 0x1]
_080C00AC:
	pop {r4-r6}
	pop {r1}
	bx r1
	thumb_func_end sub_80C004C

	thumb_func_start sub_80C00B4
sub_80C00B4: @ 80C00B4
	push {r4-r6,lr}
	adds r6, r0, 0
	adds r4, r1, 0
	lsls r0, r2, 24
	lsrs r0, 24
	bl GetLinkPlayerTrainerId
	adds r2, r0, 0
	movs r3, 0xFF
	ands r0, r3
	adds r1, r4, 0
	adds r1, 0x20
	ldrb r1, [r1]
	cmp r0, r1
	bne _080C00E0
	lsrs r0, r2, 8
	ands r0, r3
	adds r1, r4, 0
	adds r1, 0x21
	ldrb r1, [r1]
	cmp r0, r1
	beq _080C0100
_080C00E0:
	movs r3, 0xFF
	adds r0, r2, 0
	ands r0, r3
	adds r1, r4, 0
	adds r1, 0x22
	lsrs r5, r2, 8
	ldrb r1, [r1]
	cmp r0, r1
	bne _080C0104
	adds r0, r5, 0
	ands r0, r3
	adds r1, r4, 0
	adds r1, 0x23
	ldrb r1, [r1]
	cmp r0, r1
	bne _080C0104
_080C0100:
	movs r0, 0
	b _080C012C
_080C0104:
	ldrb r1, [r4, 0x1E]
	adds r0, r4, 0
	adds r0, 0x20
	strb r1, [r0]
	ldrb r0, [r4, 0x1F]
	adds r1, r4, 0
	adds r1, 0x21
	strb r0, [r1]
	strb r2, [r4, 0x1E]
	strb r5, [r4, 0x1F]
	adds r1, r6, 0
	adds r0, r4, 0
	ldm r0!, {r2-r4}
	stm r1!, {r2-r4}
	ldm r0!, {r2-r4}
	stm r1!, {r2-r4}
	ldm r0!, {r2-r4}
	stm r1!, {r2-r4}
	movs r0, 0x1
	strb r0, [r6, 0x1]
_080C012C:
	pop {r4-r6}
	pop {r1}
	bx r1
	thumb_func_end sub_80C00B4

	thumb_func_start sub_80C0134
sub_80C0134: @ 80C0134
	push {r4-r6,lr}
	adds r6, r0, 0
	adds r4, r1, 0
	lsls r0, r2, 24
	lsrs r0, 24
	bl GetLinkPlayerTrainerId
	adds r5, r0, 0
	movs r2, 0xFF
	ands r0, r2
	adds r1, r4, 0
	adds r1, 0x22
	ldrb r1, [r1]
	cmp r0, r1
	bne _080C0164
	lsrs r0, r5, 8
	ands r0, r2
	adds r1, r4, 0
	adds r1, 0x23
	ldrb r1, [r1]
	cmp r0, r1
	bne _080C0164
	movs r0, 0
	b _080C0196
_080C0164:
	adds r1, r4, 0
	adds r1, 0x20
	ldrb r0, [r1]
	adds r2, r4, 0
	adds r2, 0x22
	strb r0, [r2]
	adds r3, r4, 0
	adds r3, 0x21
	ldrb r0, [r3]
	adds r2, 0x1
	strb r0, [r2]
	strb r5, [r1]
	lsrs r0, r5, 8
	strb r0, [r3]
	adds r1, r6, 0
	adds r0, r4, 0
	ldm r0!, {r2-r4}
	stm r1!, {r2-r4}
	ldm r0!, {r2-r4}
	stm r1!, {r2-r4}
	ldm r0!, {r2-r4}
	stm r1!, {r2-r4}
	movs r0, 0x1
	strb r0, [r6, 0x1]
	strh r0, [r6, 0x16]
_080C0196:
	pop {r4-r6}
	pop {r1}
	bx r1
	thumb_func_end sub_80C0134

	thumb_func_start sub_80C019C
sub_80C019C: @ 80C019C
	push {lr}
	adds r3, r0, 0
	movs r2, 0
_080C01A2:
	lsls r0, r2, 3
	adds r0, r2
	lsls r0, 2
	adds r1, r0, r3
	ldrb r0, [r1, 0x1]
	cmp r0, 0
	bne _080C01C2
	ldrb r0, [r1]
	subs r0, 0x1
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x3B
	bhi _080C01C2
	lsls r0, r2, 24
	asrs r0, 24
	b _080C01D0
_080C01C2:
	adds r0, r2, 0x1
	lsls r0, 24
	lsrs r2, r0, 24
	cmp r2, 0x17
	bls _080C01A2
	movs r0, 0x1
	negs r0, r0
_080C01D0:
	pop {r1}
	bx r1
	thumb_func_end sub_80C019C

	thumb_func_start sub_80C01D4
sub_80C01D4: @ 80C01D4
	push {r4-r6,lr}
	movs r6, 0
_080C01D8:
	ldr r0, _080C01F8 @ =gSaveBlock1
	lsls r2, r6, 3
	adds r1, r2, r6
	lsls r1, 2
	adds r1, r0
	ldr r0, _080C01FC @ =0x00002738
	adds r1, r0
	ldrb r0, [r1]
	cmp r0, 0x29
	bls _080C01EE
	b _080C038C
_080C01EE:
	lsls r0, 2
	ldr r1, _080C0200 @ =_080C0204
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_080C01F8: .4byte gSaveBlock1
_080C01FC: .4byte 0x00002738
_080C0200: .4byte _080C0204
	.align 2, 0
_080C0204:
	.4byte _080C0394
	.4byte _080C02AC
	.4byte _080C0394
	.4byte _080C02BC
	.4byte _080C02CC
	.4byte _080C02DC
	.4byte _080C02F8
	.4byte _080C0308
	.4byte _080C038C
	.4byte _080C038C
	.4byte _080C038C
	.4byte _080C038C
	.4byte _080C038C
	.4byte _080C038C
	.4byte _080C038C
	.4byte _080C038C
	.4byte _080C038C
	.4byte _080C038C
	.4byte _080C038C
	.4byte _080C038C
	.4byte _080C038C
	.4byte _080C0324
	.4byte _080C0394
	.4byte _080C0334
	.4byte _080C0350
	.4byte _080C0368
	.4byte _080C038C
	.4byte _080C038C
	.4byte _080C038C
	.4byte _080C038C
	.4byte _080C038C
	.4byte _080C038C
	.4byte _080C038C
	.4byte _080C038C
	.4byte _080C038C
	.4byte _080C038C
	.4byte _080C038C
	.4byte _080C038C
	.4byte _080C038C
	.4byte _080C038C
	.4byte _080C038C
	.4byte _080C0394
_080C02AC:
	adds r0, r2, r6
	lsls r0, 2
	ldr r1, _080C02B8 @ =gSaveBlock1 + 0x2738
	adds r0, r1
	ldrh r0, [r0, 0x2]
	b _080C035A
	.align 2, 0
_080C02B8: .4byte gSaveBlock1 + 0x2738
_080C02BC:
	adds r0, r2, r6
	lsls r0, 2
	ldr r1, _080C02C8 @ =gSaveBlock1 + 0x2738
	adds r0, r1
	ldrh r0, [r0, 0x2]
	b _080C035A
	.align 2, 0
_080C02C8: .4byte gSaveBlock1 + 0x2738
_080C02CC:
	adds r0, r2, r6
	lsls r0, 2
	ldr r1, _080C02D8 @ =gSaveBlock1 + 0x2738
	adds r0, r1
	ldrh r0, [r0, 0x6]
	b _080C035A
	.align 2, 0
_080C02D8: .4byte gSaveBlock1 + 0x2738
_080C02DC:
	adds r4, r2, r6
	lsls r4, 2
	ldr r0, _080C02F4 @ =gSaveBlock1 + 0x2738
	adds r4, r0
	ldrh r0, [r4, 0x2]
	lsls r5, r6, 24
	lsrs r5, 24
	adds r1, r5, 0
	bl sub_80C03C8
	ldrh r0, [r4, 0x1C]
	b _080C037E
	.align 2, 0
_080C02F4: .4byte gSaveBlock1 + 0x2738
_080C02F8:
	adds r0, r2, r6
	lsls r0, 2
	ldr r1, _080C0304 @ =gSaveBlock1 + 0x2738
	adds r0, r1
	ldrh r0, [r0, 0x2]
	b _080C035A
	.align 2, 0
_080C0304: .4byte gSaveBlock1 + 0x2738
_080C0308:
	adds r4, r2, r6
	lsls r4, 2
	ldr r0, _080C0320 @ =gSaveBlock1 + 0x2738
	adds r4, r0
	ldrh r0, [r4, 0xA]
	lsls r5, r6, 24
	lsrs r5, 24
	adds r1, r5, 0
	bl sub_80C03C8
	ldrh r0, [r4, 0x14]
	b _080C037E
	.align 2, 0
_080C0320: .4byte gSaveBlock1 + 0x2738
_080C0324:
	adds r0, r2, r6
	lsls r0, 2
	ldr r1, _080C0330 @ =gSaveBlock1 + 0x2738
	adds r0, r1
	ldrh r0, [r0, 0x10]
	b _080C035A
	.align 2, 0
_080C0330: .4byte gSaveBlock1 + 0x2738
_080C0334:
	adds r4, r2, r6
	lsls r4, 2
	ldr r0, _080C034C @ =gSaveBlock1 + 0x2738
	adds r4, r0
	ldrh r0, [r4, 0xC]
	lsls r5, r6, 24
	lsrs r5, 24
	adds r1, r5, 0
	bl sub_80C03C8
	ldrh r0, [r4, 0xE]
	b _080C037E
	.align 2, 0
_080C034C: .4byte gSaveBlock1 + 0x2738
_080C0350:
	adds r0, r2, r6
	lsls r0, 2
	ldr r1, _080C0364 @ =gSaveBlock1 + 0x2738
	adds r0, r1
	ldrh r0, [r0, 0x4]
_080C035A:
	lsls r1, r6, 24
	lsrs r1, 24
	bl sub_80C03C8
	b _080C0394
	.align 2, 0
_080C0364: .4byte gSaveBlock1 + 0x2738
_080C0368:
	adds r4, r2, r6
	lsls r4, 2
	ldr r0, _080C0388 @ =gSaveBlock1 + 0x2738
	adds r4, r0
	ldrh r0, [r4, 0x8]
	lsls r5, r6, 24
	lsrs r5, 24
	adds r1, r5, 0
	bl sub_80C03C8
	ldrh r0, [r4, 0x4]
_080C037E:
	adds r1, r5, 0
	bl sub_80C03C8
	b _080C0394
	.align 2, 0
_080C0388: .4byte gSaveBlock1 + 0x2738
_080C038C:
	lsls r0, r6, 24
	lsrs r0, 24
	bl sub_80C03A8
_080C0394:
	adds r0, r6, 0x1
	lsls r0, 16
	lsrs r6, r0, 16
	cmp r6, 0x17
	bhi _080C03A0
	b _080C01D8
_080C03A0:
	pop {r4-r6}
	pop {r0}
	bx r0
	thumb_func_end sub_80C01D4

	thumb_func_start sub_80C03A8
sub_80C03A8: @ 80C03A8
	lsls r0, 24
	lsrs r0, 24
	ldr r2, _080C03C0 @ =gSaveBlock1
	lsls r1, r0, 3
	adds r1, r0
	lsls r1, 2
	adds r1, r2
	ldr r0, _080C03C4 @ =0x00002739
	adds r1, r0
	movs r0, 0
	strb r0, [r1]
	bx lr
	.align 2, 0
_080C03C0: .4byte gSaveBlock1
_080C03C4: .4byte 0x00002739
	thumb_func_end sub_80C03A8

	thumb_func_start sub_80C03C8
sub_80C03C8: @ 80C03C8
	push {r4,lr}
	lsls r0, 16
	lsrs r0, 16
	lsls r1, 24
	lsrs r4, r1, 24
	bl SpeciesToNationalPokedexNum
	lsls r0, 16
	lsrs r0, 16
	movs r1, 0
	bl sub_8090D90
	lsls r0, 24
	asrs r2, r0, 24
	cmp r2, 0
	bne _080C03F8
	ldr r1, _080C0400 @ =gSaveBlock1
	lsls r0, r4, 3
	adds r0, r4
	lsls r0, 2
	adds r0, r1
	ldr r1, _080C0404 @ =0x00002739
	adds r0, r1
	strb r2, [r0]
_080C03F8:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080C0400: .4byte gSaveBlock1
_080C0404: .4byte 0x00002739
	thumb_func_end sub_80C03C8

	thumb_func_start sub_80C0408
sub_80C0408: @ 80C0408
	push {r4-r6,lr}
	ldr r0, _080C044C @ =0x00000804
	bl FlagGet
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	beq _080C0444
	movs r2, 0
	ldr r6, _080C0450 @ =gSaveBlock1
	ldr r4, _080C0454 @ =0x00002739
	movs r3, 0
	ldr r5, _080C0458 @ =0x00002738
_080C0422:
	lsls r0, r2, 3
	adds r0, r2
	lsls r0, 2
	adds r1, r0, r6
	adds r0, r1, r5
	ldrb r0, [r0]
	cmp r0, 0x7
	beq _080C0436
	cmp r0, 0x29
	bne _080C043A
_080C0436:
	adds r0, r1, r4
	strb r3, [r0]
_080C043A:
	adds r0, r2, 0x1
	lsls r0, 16
	lsrs r2, r0, 16
	cmp r2, 0x17
	bls _080C0422
_080C0444:
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_080C044C: .4byte 0x00000804
_080C0450: .4byte gSaveBlock1
_080C0454: .4byte 0x00002739
_080C0458: .4byte 0x00002738
	thumb_func_end sub_80C0408

	thumb_func_start sub_80C045C
sub_80C045C: @ 80C045C
	push {r4-r6,lr}
	movs r5, 0
	ldr r6, _080C0494 @ =gSaveBlock1
_080C0462:
	lsls r0, r5, 3
	adds r0, r5
	lsls r0, 2
	adds r4, r0, r6
	ldr r1, _080C0498 @ =0x00002738
	adds r0, r4, r1
	ldrb r0, [r0]
	bl sub_80BFB54
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x2
	bne _080C0484
	ldr r0, _080C049C @ =0x00002739
	adds r1, r4, r0
	movs r0, 0
	strb r0, [r1]
_080C0484:
	adds r0, r5, 0x1
	lsls r0, 24
	lsrs r5, r0, 24
	cmp r5, 0x4
	bls _080C0462
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_080C0494: .4byte gSaveBlock1
_080C0498: .4byte 0x00002738
_080C049C: .4byte 0x00002739
	thumb_func_end sub_80C045C

	thumb_func_start sub_80C04A0
sub_80C04A0: @ 80C04A0
	push {r4,r5,lr}
	movs r3, 0
	movs r2, 0x5
	ldr r5, _080C0508 @ =gSaveBlock1
	ldr r4, _080C050C @ =0x00002738
_080C04AA:
	lsls r0, r2, 24
	asrs r1, r0, 24
	lsls r0, r1, 3
	adds r0, r1
	lsls r0, 2
	adds r0, r5
	adds r0, r4
	ldrb r0, [r0]
	cmp r0, 0
	bne _080C04C8
	lsls r0, r3, 24
	movs r2, 0x80
	lsls r2, 17
	adds r0, r2
	lsrs r3, r0, 24
_080C04C8:
	adds r0, r1, 0x1
	lsls r0, 24
	lsrs r2, r0, 24
	asrs r0, 24
	cmp r0, 0x17
	ble _080C04AA
	movs r2, 0
	lsls r0, r3, 24
	asrs r0, 24
	movs r1, 0x5
	subs r0, r1, r0
	cmp r2, r0
	bge _080C0502
	adds r5, r0, 0
_080C04E4:
	lsls r1, r2, 24
	asrs r4, r1, 24
	movs r0, 0xA0
	lsls r0, 19
	adds r1, r0
	lsrs r1, 24
	ldr r0, _080C0510 @ =gSaveBlock1 + 0x2738
	bl sub_80BF55C
	adds r4, 0x1
	lsls r4, 24
	lsrs r2, r4, 24
	asrs r4, 24
	cmp r4, r5
	blt _080C04E4
_080C0502:
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080C0508: .4byte gSaveBlock1
_080C050C: .4byte 0x00002738
_080C0510: .4byte gSaveBlock1 + 0x2738
	thumb_func_end sub_80C04A0

	thumb_func_start sub_80C0514
sub_80C0514: @ 80C0514
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	mov r8, r0
	adds r7, r1, 0
	lsls r2, 24
	lsrs r5, r2, 24
	movs r4, 0
_080C0524:
	lsls r0, r4, 6
	ldr r6, _080C0550 @ =0x02007000
	adds r0, r6
	adds r1, r4, 0
	muls r1, r7
	add r1, r8
	movs r2, 0x40
	bl memcpy
	adds r0, r4, 0x1
	lsls r0, 24
	lsrs r4, r0, 24
	cmp r4, 0x3
	bls _080C0524
	adds r4, r6, 0
	cmp r5, 0x1
	beq _080C0578
	cmp r5, 0x1
	bgt _080C0554
	cmp r5, 0
	beq _080C055E
	b _080C05AC
	.align 2, 0
_080C0550: .4byte 0x02007000
_080C0554:
	cmp r5, 0x2
	beq _080C0584
	cmp r5, 0x3
	beq _080C059C
	b _080C05AC
_080C055E:
	ldr r0, _080C0574 @ =gSaveBlock1 + 0x2ABC
	adds r1, r4, 0
	adds r1, 0x40
	adds r2, r4, 0
	adds r2, 0x80
	adds r3, r4, 0
	adds r3, 0xC0
	bl sub_80C05C4
	b _080C05AC
	.align 2, 0
_080C0574: .4byte gSaveBlock1 + 0x2ABC
_080C0578:
	ldr r1, _080C0580 @ =gSaveBlock1 + 0x2ABC
	adds r2, r4, 0
	adds r2, 0x80
	b _080C058A
	.align 2, 0
_080C0580: .4byte gSaveBlock1 + 0x2ABC
_080C0584:
	adds r1, r4, 0
	adds r1, 0x40
	ldr r2, _080C0598 @ =gSaveBlock1 + 0x2ABC
_080C058A:
	adds r3, r4, 0
	adds r3, 0xC0
	adds r0, r4, 0
	bl sub_80C05C4
	b _080C05AC
	.align 2, 0
_080C0598: .4byte gSaveBlock1 + 0x2ABC
_080C059C:
	adds r1, r6, 0
	adds r1, 0x40
	adds r2, r6, 0
	adds r2, 0x80
	ldr r3, _080C05C0 @ =gSaveBlock1 + 0x2ABC
	adds r0, r6, 0
	bl sub_80C05C4
_080C05AC:
	bl sub_80C0750
	bl sub_80C0788
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080C05C0: .4byte gSaveBlock1 + 0x2ABC
	thumb_func_end sub_80C0514

	thumb_func_start sub_80C05C4
sub_80C05C4: @ 80C05C4
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	sub sp, 0x24
	str r0, [sp, 0x10]
	str r1, [sp, 0x14]
	str r2, [sp, 0x18]
	str r3, [sp, 0x1C]
	add r0, sp, 0x10
	str r0, [sp]
	add r0, sp, 0x14
	str r0, [sp, 0x4]
	add r0, sp, 0x18
	str r0, [sp, 0x8]
	add r0, sp, 0x1C
	str r0, [sp, 0xC]
	bl GetLinkPlayerCount
	ldr r1, _080C0600 @ =gUnknown_03000721
	strb r0, [r1]
	movs r0, 0
	mov r10, r0
_080C05F4:
	movs r7, 0
	mov r1, r10
	adds r1, 0x1
	str r1, [sp, 0x20]
	b _080C068C
	.align 2, 0
_080C0600: .4byte gUnknown_03000721
_080C0604:
	lsls r4, r7, 2
	mov r1, sp
	adds r0, r1, r4
	ldr r0, [r0]
	ldr r0, [r0]
	mov r1, r10
	bl sub_80C0730
	ldr r1, _080C06B0 @ =gUnknown_03000722
	strb r0, [r1]
	lsls r0, 24
	asrs r0, 24
	mov r8, r4
	adds r1, r7, 0x1
	mov r9, r1
	movs r1, 0x1
	negs r1, r1
	cmp r0, r1
	beq _080C0686
	movs r5, 0
	ldr r1, _080C06B4 @ =gUnknown_03000721
	ldrb r0, [r1]
	subs r0, 0x1
	cmp r5, r0
	bge _080C0686
	adds r6, r1, 0
_080C0638:
	adds r0, r7, r5
	adds r4, r0, 0x1
	ldrb r1, [r6]
	adds r0, r4, 0
	bl __modsi3
	lsls r0, 2
	add r0, sp
	ldr r0, [r0]
	ldr r0, [r0]
	bl sub_80BEBC8
	ldr r1, _080C06B8 @ =gUnknown_03005D38
	strb r0, [r1]
	lsls r0, 24
	asrs r0, 24
	movs r1, 0x1
	negs r1, r1
	cmp r0, r1
	beq _080C0678
	ldrb r1, [r6]
	adds r0, r4, 0
	bl __modsi3
	lsls r0, 2
	add r0, sp
	ldr r0, [r0]
	mov r1, sp
	add r1, r8
	ldr r1, [r1]
	bl sub_80C06BC
_080C0678:
	adds r0, r5, 0x1
	lsls r0, 24
	lsrs r5, r0, 24
	ldrb r0, [r6]
	subs r0, 0x1
	cmp r5, r0
	blt _080C0638
_080C0686:
	mov r1, r9
	lsls r0, r1, 24
	lsrs r7, r0, 24
_080C068C:
	ldr r0, _080C06B4 @ =gUnknown_03000721
	ldrb r0, [r0]
	cmp r7, r0
	bcc _080C0604
	ldr r1, [sp, 0x20]
	lsls r0, r1, 24
	lsrs r0, 24
	mov r10, r0
	cmp r0, 0xF
	bls _080C05F4
	add sp, 0x24
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080C06B0: .4byte gUnknown_03000722
_080C06B4: .4byte gUnknown_03000721
_080C06B8: .4byte gUnknown_03005D38
	thumb_func_end sub_80C05C4

	thumb_func_start sub_80C06BC
sub_80C06BC: @ 80C06BC
	push {lr}
	ldr r0, [r0]
	ldr r1, [r1]
	ldr r2, _080C06E0 @ =gUnknown_03000722
	ldrb r2, [r2]
	lsls r2, 24
	asrs r2, 24
	lsls r2, 2
	adds r1, r2
	ldr r2, _080C06E4 @ =gUnknown_03005D38
	ldrb r2, [r2]
	lsls r2, 24
	asrs r2, 24
	bl sub_80C06E8
	pop {r0}
	bx r0
	.align 2, 0
_080C06E0: .4byte gUnknown_03000722
_080C06E4: .4byte gUnknown_03005D38
	thumb_func_end sub_80C06BC

	thumb_func_start sub_80C06E8
sub_80C06E8: @ 80C06E8
	push {r4-r6,lr}
	adds r4, r0, 0
	adds r5, r1, 0
	lsls r2, 24
	lsrs r6, r2, 24
	ldrb r3, [r5]
	adds r0, r3, 0
	cmp r0, 0
	bne _080C06FE
_080C06FA:
	movs r0, 0
	b _080C072A
_080C06FE:
	movs r1, 0
	adds r2, r3, 0
	adds r3, r0, 0
_080C0704:
	lsls r0, r1, 2
	adds r0, r4
	ldrb r0, [r0]
	cmp r0, r3
	beq _080C06FA
	adds r0, r1, 0x1
	lsls r0, 24
	lsrs r1, r0, 24
	cmp r1, 0xF
	bls _080C0704
	lsls r0, r6, 24
	asrs r0, 22
	adds r0, r4
	strb r2, [r0]
	movs r1, 0x1
	strb r1, [r0, 0x1]
	ldrh r1, [r5, 0x2]
	strh r1, [r0, 0x2]
	movs r0, 0x1
_080C072A:
	pop {r4-r6}
	pop {r1}
	bx r1
	thumb_func_end sub_80C06E8

	thumb_func_start sub_80C0730
sub_80C0730: @ 80C0730
	push {lr}
	lsls r1, 24
	lsrs r2, r1, 24
	lsls r1, r2, 2
	adds r1, r0
	ldrb r0, [r1]
	cmp r0, 0
	beq _080C0746
	lsls r0, r2, 24
	asrs r0, 24
	b _080C074A
_080C0746:
	movs r0, 0x1
	negs r0, r0
_080C074A:
	pop {r1}
	bx r1
	thumb_func_end sub_80C0730

	thumb_func_start sub_80C0750
sub_80C0750: @ 80C0750
	push {r4,r5,lr}
	movs r4, 0
	ldr r5, _080C0780 @ =gSaveBlock1
_080C0756:
	lsls r0, r4, 2
	adds r0, r5
	ldr r1, _080C0784 @ =0x00002abc
	adds r0, r1
	ldrb r0, [r0]
	cmp r0, 0x3
	bls _080C076A
	adds r0, r4, 0
	bl sub_80BEC10
_080C076A:
	adds r0, r4, 0x1
	lsls r0, 24
	lsrs r4, r0, 24
	cmp r4, 0xF
	bls _080C0756
	bl sub_80BEC40
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080C0780: .4byte gSaveBlock1
_080C0784: .4byte 0x00002abc
	thumb_func_end sub_80C0750

	thumb_func_start sub_80C0788
sub_80C0788: @ 80C0788
	push {r4,lr}
	ldr r0, _080C07B8 @ =0x00000804
	bl FlagGet
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	beq _080C07B2
	movs r1, 0
	ldr r4, _080C07BC @ =gSaveBlock1
	ldr r3, _080C07C0 @ =0x00002abd
	movs r2, 0
_080C07A0:
	lsls r0, r1, 2
	adds r0, r4
	adds r0, r3
	strb r2, [r0]
	adds r0, r1, 0x1
	lsls r0, 24
	lsrs r1, r0, 24
	cmp r1, 0xF
	bls _080C07A0
_080C07B2:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080C07B8: .4byte 0x00000804
_080C07BC: .4byte gSaveBlock1
_080C07C0: .4byte 0x00002abd
	thumb_func_end sub_80C0788

	thumb_func_start DoTVShow
DoTVShow: @ 80C07C4
	push {lr}
	ldr r2, _080C07F8 @ =gSaveBlock1
	ldr r0, _080C07FC @ =gSpecialVar_0x8004
	ldrh r1, [r0]
	lsls r0, r1, 3
	adds r0, r1
	lsls r0, 2
	adds r1, r0, r2
	ldr r2, _080C0800 @ =0x00002739
	adds r0, r1, r2
	ldrb r0, [r0]
	cmp r0, 0
	bne _080C07E0
	b _080C08F8
_080C07E0:
	subs r2, 0x1
	adds r0, r1, r2
	ldrb r0, [r0]
	subs r0, 0x1
	cmp r0, 0x28
	bls _080C07EE
	b _080C08F8
_080C07EE:
	lsls r0, 2
	ldr r1, _080C0804 @ =_080C0808
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_080C07F8: .4byte gSaveBlock1
_080C07FC: .4byte gSpecialVar_0x8004
_080C0800: .4byte 0x00002739
_080C0804: .4byte _080C0808
	.align 2, 0
_080C0808:
	.4byte _080C08AC
	.4byte _080C08B2
	.4byte _080C08B8
	.4byte _080C08BE
	.4byte _080C08E2
	.4byte _080C08CA
	.4byte _080C08D0
	.4byte _080C08F8
	.4byte _080C08F8
	.4byte _080C08F8
	.4byte _080C08F8
	.4byte _080C08F8
	.4byte _080C08F8
	.4byte _080C08F8
	.4byte _080C08F8
	.4byte _080C08F8
	.4byte _080C08F8
	.4byte _080C08F8
	.4byte _080C08F8
	.4byte _080C08F8
	.4byte _080C08D6
	.4byte _080C08DC
	.4byte _080C08E8
	.4byte _080C08EE
	.4byte _080C08F4
	.4byte _080C08F8
	.4byte _080C08F8
	.4byte _080C08F8
	.4byte _080C08F8
	.4byte _080C08F8
	.4byte _080C08F8
	.4byte _080C08F8
	.4byte _080C08F8
	.4byte _080C08F8
	.4byte _080C08F8
	.4byte _080C08F8
	.4byte _080C08F8
	.4byte _080C08F8
	.4byte _080C08F8
	.4byte _080C08F8
	.4byte _080C08C4
_080C08AC:
	bl DoTVShowPokemonFanClubLetter
	b _080C08F8
_080C08B2:
	bl DoTVShowRecentHappenings
	b _080C08F8
_080C08B8:
	bl DoTVShowPokemonFanClubOpinions
	b _080C08F8
_080C08BE:
	bl nullsub_22
	b _080C08F8
_080C08C4:
	bl DoTVShowPokemonNewsMassOutbreak
	b _080C08F8
_080C08CA:
	bl DoTVShowBravoTrainerPokemonProfile
	b _080C08F8
_080C08D0:
	bl DoTVShowBravoTrainerBattleTowerProfile
	b _080C08F8
_080C08D6:
	bl DoTVShowPokemonTodaySuccessfulCapture
	b _080C08F8
_080C08DC:
	bl DoTVShowTodaysSmartShopper
	b _080C08F8
_080C08E2:
	bl DoTVShowTheNameRaterShow
	b _080C08F8
_080C08E8:
	bl DoTVShowPokemonTodayFailedCapture
	b _080C08F8
_080C08EE:
	bl DoTVShowPokemonAngler
	b _080C08F8
_080C08F4:
	bl DoTVShowTheWorldOfMasters
_080C08F8:
	pop {r0}
	bx r0
	thumb_func_end DoTVShow

	thumb_func_start TVShowConvertInternationalString
TVShowConvertInternationalString: @ 80C08FC
	push {r4,r5,lr}
	adds r5, r0, 0
	lsls r4, r2, 24
	lsrs r4, 24
	bl StringCopy
	cmp r4, 0x1
	bhi _080C0914
	adds r0, r5, 0
	movs r1, 0x1
	bl ConvertInternationalString
_080C0914:
	pop {r4,r5}
	pop {r0}
	bx r0
	thumb_func_end TVShowConvertInternationalString

	thumb_func_start DoTVShowBravoTrainerPokemonProfile
DoTVShowBravoTrainerPokemonProfile: @ 80C091C
	push {r4,r5,lr}
	ldr r0, _080C0948 @ =gSpecialVar_0x8004
	ldrh r1, [r0]
	lsls r0, r1, 3
	adds r0, r1
	lsls r0, 2
	ldr r1, _080C094C @ =gSaveBlock1 + 0x2738
	adds r4, r0, r1
	ldr r1, _080C0950 @ =gScriptResult
	movs r0, 0
	strh r0, [r1]
	ldr r0, _080C0954 @ =gUnknown_020387E8
	ldrb r5, [r0]
	cmp r5, 0x8
	bls _080C093C
	b _080C0B7A
_080C093C:
	lsls r0, r5, 2
	ldr r1, _080C0958 @ =_080C095C
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_080C0948: .4byte gSpecialVar_0x8004
_080C094C: .4byte gSaveBlock1 + 0x2738
_080C0950: .4byte gScriptResult
_080C0954: .4byte gUnknown_020387E8
_080C0958: .4byte _080C095C
	.align 2, 0
_080C095C:
	.4byte _080C0980
	.4byte _080C09D8
	.4byte _080C0A10
	.4byte _080C0A40
	.4byte _080C0A74
	.4byte _080C0AA8
	.4byte _080C0AEC
	.4byte _080C0B34
	.4byte _080C0B64
_080C0980:
	ldr r0, _080C09C0 @ =gStringVar1
	adds r1, r4, 0
	adds r1, 0x16
	ldrb r2, [r4, 0x1E]
	bl TVShowConvertInternationalString
	ldrb r1, [r4, 0x13]
	lsls r1, 29
	lsrs r1, 29
	movs r0, 0x1
	bl CopyContestCategoryToStringVar
	ldrb r1, [r4, 0x13]
	lsls r1, 27
	lsrs r1, 30
	movs r0, 0x2
	bl sub_80BEF10
	ldrh r1, [r4, 0x2]
	movs r0, 0xB
	muls r0, r1
	ldr r1, _080C09C4 @ =gSpeciesNames
	adds r0, r1
	adds r1, r4, 0
	adds r1, 0x8
	bl StringCompareWithoutExtCtrlCodes
	cmp r0, 0
	bne _080C09CC
	ldr r1, _080C09C8 @ =gUnknown_020387E8
	movs r0, 0x8
	b _080C0B78
	.align 2, 0
_080C09C0: .4byte gStringVar1
_080C09C4: .4byte gSpeciesNames
_080C09C8: .4byte gUnknown_020387E8
_080C09CC:
	ldr r1, _080C09D4 @ =gUnknown_020387E8
	movs r0, 0x1
	b _080C0B78
	.align 2, 0
_080C09D4: .4byte gUnknown_020387E8
_080C09D8:
	ldr r0, _080C0A04 @ =gStringVar1
	ldrh r2, [r4, 0x2]
	movs r1, 0xB
	muls r1, r2
	ldr r2, _080C0A08 @ =gSpeciesNames
	adds r1, r2
	bl StringCopy
	ldr r0, _080C0A0C @ =gStringVar2
	adds r1, r4, 0
	adds r1, 0x8
	ldrb r2, [r4, 0x1F]
	bl TVShowConvertInternationalString
	ldrb r1, [r4, 0x13]
	lsls r1, 29
	lsrs r1, 29
	movs r0, 0x2
	bl CopyContestCategoryToStringVar
	b _080C0B74
	.align 2, 0
_080C0A04: .4byte gStringVar1
_080C0A08: .4byte gSpeciesNames
_080C0A0C: .4byte gStringVar2
_080C0A10:
	ldr r0, _080C0A2C @ =gStringVar1
	adds r1, r4, 0
	adds r1, 0x16
	ldrb r2, [r4, 0x1E]
	bl TVShowConvertInternationalString
	ldrb r1, [r4, 0x13]
	movs r0, 0x60
	ands r0, r1
	cmp r0, 0
	bne _080C0A34
	ldr r1, _080C0A30 @ =gUnknown_020387E8
	movs r0, 0x3
	b _080C0B78
	.align 2, 0
_080C0A2C: .4byte gStringVar1
_080C0A30: .4byte gUnknown_020387E8
_080C0A34:
	ldr r1, _080C0A3C @ =gUnknown_020387E8
	movs r0, 0x4
	b _080C0B78
	.align 2, 0
_080C0A3C: .4byte gUnknown_020387E8
_080C0A40:
	ldr r0, _080C0A68 @ =gStringVar1
	adds r1, r4, 0
	adds r1, 0x16
	ldrb r2, [r4, 0x1E]
	bl TVShowConvertInternationalString
	ldr r0, _080C0A6C @ =gStringVar2
	ldrh r1, [r4, 0x4]
	bl sub_80EB3FC
	ldrb r1, [r4, 0x13]
	lsls r1, 25
	lsrs r1, 30
	adds r1, 0x1
	movs r0, 0x2
	bl sub_80BF088
	ldr r1, _080C0A70 @ =gUnknown_020387E8
	movs r0, 0x5
	b _080C0B78
	.align 2, 0
_080C0A68: .4byte gStringVar1
_080C0A6C: .4byte gStringVar2
_080C0A70: .4byte gUnknown_020387E8
_080C0A74:
	ldr r0, _080C0A9C @ =gStringVar1
	adds r1, r4, 0
	adds r1, 0x16
	ldrb r2, [r4, 0x1E]
	bl TVShowConvertInternationalString
	ldr r0, _080C0AA0 @ =gStringVar2
	ldrh r1, [r4, 0x4]
	bl sub_80EB3FC
	ldrb r1, [r4, 0x13]
	lsls r1, 25
	lsrs r1, 30
	adds r1, 0x1
	movs r0, 0x2
	bl sub_80BF088
	ldr r1, _080C0AA4 @ =gUnknown_020387E8
	movs r0, 0x5
	b _080C0B78
	.align 2, 0
_080C0A9C: .4byte gStringVar1
_080C0AA0: .4byte gStringVar2
_080C0AA4: .4byte gUnknown_020387E8
_080C0AA8:
	ldr r0, _080C0AD4 @ =gStringVar1
	adds r1, r4, 0
	adds r1, 0x16
	ldrb r2, [r4, 0x1E]
	bl TVShowConvertInternationalString
	ldrb r1, [r4, 0x13]
	lsls r1, 29
	lsrs r1, 29
	movs r0, 0x1
	bl CopyContestCategoryToStringVar
	ldr r0, _080C0AD8 @ =gStringVar3
	ldrh r1, [r4, 0x6]
	bl sub_80EB3FC
	ldrh r0, [r4, 0x14]
	cmp r0, 0
	beq _080C0AE0
	ldr r1, _080C0ADC @ =gUnknown_020387E8
	movs r0, 0x6
	b _080C0B78
	.align 2, 0
_080C0AD4: .4byte gStringVar1
_080C0AD8: .4byte gStringVar3
_080C0ADC: .4byte gUnknown_020387E8
_080C0AE0:
	ldr r1, _080C0AE8 @ =gUnknown_020387E8
	movs r0, 0x7
	b _080C0B78
	.align 2, 0
_080C0AE8: .4byte gUnknown_020387E8
_080C0AEC:
	ldr r0, _080C0B1C @ =gStringVar1
	ldrh r2, [r4, 0x2]
	movs r1, 0xB
	muls r1, r2
	ldr r2, _080C0B20 @ =gSpeciesNames
	adds r1, r2
	bl StringCopy
	ldr r0, _080C0B24 @ =gStringVar2
	ldrh r2, [r4, 0x14]
	movs r1, 0xD
	muls r1, r2
	ldr r2, _080C0B28 @ =gMoveNames
	adds r1, r2
	bl StringCopy
	ldr r0, _080C0B2C @ =gStringVar3
	ldrh r1, [r4, 0x6]
	bl sub_80EB3FC
	ldr r1, _080C0B30 @ =gUnknown_020387E8
	movs r0, 0x7
	b _080C0B78
	.align 2, 0
_080C0B1C: .4byte gStringVar1
_080C0B20: .4byte gSpeciesNames
_080C0B24: .4byte gStringVar2
_080C0B28: .4byte gMoveNames
_080C0B2C: .4byte gStringVar3
_080C0B30: .4byte gUnknown_020387E8
_080C0B34:
	ldr r0, _080C0B58 @ =gStringVar1
	adds r1, r4, 0
	adds r1, 0x16
	ldrb r2, [r4, 0x1E]
	bl TVShowConvertInternationalString
	ldr r0, _080C0B5C @ =gStringVar2
	ldrh r2, [r4, 0x2]
	movs r1, 0xB
	muls r1, r2
	ldr r2, _080C0B60 @ =gSpeciesNames
	adds r1, r2
	bl StringCopy
	bl TVShowDone
	b _080C0B7A
	.align 2, 0
_080C0B58: .4byte gStringVar1
_080C0B5C: .4byte gStringVar2
_080C0B60: .4byte gSpeciesNames
_080C0B64:
	ldr r0, _080C0B8C @ =gStringVar1
	ldrh r2, [r4, 0x2]
	movs r1, 0xB
	muls r1, r2
	ldr r2, _080C0B90 @ =gSpeciesNames
	adds r1, r2
	bl StringCopy
_080C0B74:
	ldr r1, _080C0B94 @ =gUnknown_020387E8
	movs r0, 0x2
_080C0B78:
	strb r0, [r1]
_080C0B7A:
	ldr r0, _080C0B98 @ =gTVBravoTrainerTextGroup
	lsls r1, r5, 2
	adds r1, r0
	ldr r0, [r1]
	bl ShowFieldMessage
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080C0B8C: .4byte gStringVar1
_080C0B90: .4byte gSpeciesNames
_080C0B94: .4byte gUnknown_020387E8
_080C0B98: .4byte gTVBravoTrainerTextGroup
	thumb_func_end DoTVShowBravoTrainerPokemonProfile

	thumb_func_start DoTVShowBravoTrainerBattleTowerProfile
DoTVShowBravoTrainerBattleTowerProfile: @ 80C0B9C
	push {r4,r5,lr}
	ldr r0, _080C0BC8 @ =gSpecialVar_0x8004
	ldrh r1, [r0]
	lsls r0, r1, 3
	adds r0, r1
	lsls r0, 2
	ldr r1, _080C0BCC @ =gSaveBlock1 + 0x2738
	adds r4, r0, r1
	ldr r1, _080C0BD0 @ =gScriptResult
	movs r0, 0
	strh r0, [r1]
	ldr r0, _080C0BD4 @ =gUnknown_020387E8
	ldrb r5, [r0]
	adds r2, r0, 0
	cmp r5, 0xE
	bls _080C0BBE
	b _080C0DDE
_080C0BBE:
	lsls r0, r5, 2
	ldr r1, _080C0BD8 @ =_080C0BDC
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_080C0BC8: .4byte gSpecialVar_0x8004
_080C0BCC: .4byte gSaveBlock1 + 0x2738
_080C0BD0: .4byte gScriptResult
_080C0BD4: .4byte gUnknown_020387E8
_080C0BD8: .4byte _080C0BDC
	.align 2, 0
_080C0BDC:
	.4byte _080C0C18
	.4byte _080C0C5C
	.4byte _080C0C8C
	.4byte _080C0CB0
	.4byte _080C0CDC
	.4byte _080C0D24
	.4byte _080C0D30
	.4byte _080C0D3C
	.4byte _080C0D42
	.4byte _080C0D42
	.4byte _080C0D42
	.4byte _080C0D5C
	.4byte _080C0D88
	.4byte _080C0D88
	.4byte _080C0DC0
_080C0C18:
	ldr r0, _080C0C40 @ =gStringVar1
	adds r1, r4, 0x2
	ldrb r2, [r4, 0x1D]
	bl TVShowConvertInternationalString
	ldr r0, _080C0C44 @ =gStringVar2
	ldrh r2, [r4, 0xA]
	movs r1, 0xB
	muls r1, r2
	ldr r2, _080C0C48 @ =gSpeciesNames
	adds r1, r2
	bl StringCopy
	ldrh r0, [r4, 0x16]
	cmp r0, 0x6
	bls _080C0C50
	ldr r1, _080C0C4C @ =gUnknown_020387E8
	movs r0, 0x1
	strb r0, [r1]
	b _080C0DDE
	.align 2, 0
_080C0C40: .4byte gStringVar1
_080C0C44: .4byte gStringVar2
_080C0C48: .4byte gSpeciesNames
_080C0C4C: .4byte gUnknown_020387E8
_080C0C50:
	ldr r1, _080C0C58 @ =gUnknown_020387E8
	movs r0, 0x2
	strb r0, [r1]
	b _080C0DDE
	.align 2, 0
_080C0C58: .4byte gUnknown_020387E8
_080C0C5C:
	ldrb r1, [r4, 0x1A]
	movs r0, 0
	bl sub_80BF088
	ldrh r1, [r4, 0x16]
	movs r0, 0x1
	bl sub_80BF088
	ldrb r0, [r4, 0x1C]
	cmp r0, 0x1
	bne _080C0C80
	ldr r1, _080C0C7C @ =gUnknown_020387E8
	movs r0, 0x3
	strb r0, [r1]
	b _080C0DDE
	.align 2, 0
_080C0C7C: .4byte gUnknown_020387E8
_080C0C80:
	ldr r1, _080C0C88 @ =gUnknown_020387E8
	movs r0, 0x4
	strb r0, [r1]
	b _080C0DDE
	.align 2, 0
_080C0C88: .4byte gUnknown_020387E8
_080C0C8C:
	ldr r0, _080C0CAC @ =gStringVar1
	adds r1, r4, 0
	adds r1, 0xC
	ldrb r2, [r4, 0x1D]
	bl TVShowConvertInternationalString
	ldrh r1, [r4, 0x16]
	adds r1, 0x1
	movs r0, 0x1
	bl sub_80BF088
_080C0CA2:
	ldrb r0, [r4, 0x1B]
	cmp r0, 0
	beq _080C0CFE
	b _080C0D18
	.align 2, 0
_080C0CAC: .4byte gStringVar1
_080C0CB0:
	ldr r0, _080C0CD0 @ =gStringVar1
	adds r1, r4, 0
	adds r1, 0xC
	ldrb r2, [r4, 0x1D]
	bl TVShowConvertInternationalString
	ldr r0, _080C0CD4 @ =gStringVar2
	ldrh r2, [r4, 0x14]
	movs r1, 0xB
	muls r1, r2
	ldr r2, _080C0CD8 @ =gSpeciesNames
	adds r1, r2
	bl StringCopy
	b _080C0CA2
	.align 2, 0
_080C0CD0: .4byte gStringVar1
_080C0CD4: .4byte gStringVar2
_080C0CD8: .4byte gSpeciesNames
_080C0CDC:
	ldr r0, _080C0D08 @ =gStringVar1
	adds r1, r4, 0
	adds r1, 0xC
	ldrb r2, [r4, 0x1D]
	bl TVShowConvertInternationalString
	ldr r0, _080C0D0C @ =gStringVar2
	ldrh r2, [r4, 0x14]
	movs r1, 0xB
	muls r1, r2
	ldr r2, _080C0D10 @ =gSpeciesNames
	adds r1, r2
	bl StringCopy
	ldrb r0, [r4, 0x1B]
	cmp r0, 0
	bne _080C0D18
_080C0CFE:
	ldr r1, _080C0D14 @ =gUnknown_020387E8
	movs r0, 0x5
	strb r0, [r1]
	b _080C0DDE
	.align 2, 0
_080C0D08: .4byte gStringVar1
_080C0D0C: .4byte gStringVar2
_080C0D10: .4byte gSpeciesNames
_080C0D14: .4byte gUnknown_020387E8
_080C0D18:
	ldr r1, _080C0D20 @ =gUnknown_020387E8
	movs r0, 0x6
	strb r0, [r1]
	b _080C0DDE
	.align 2, 0
_080C0D20: .4byte gUnknown_020387E8
_080C0D24:
	ldr r0, _080C0D2C @ =gStringVar1
	adds r1, r4, 0
	adds r1, 0xC
	b _080C0D46
	.align 2, 0
_080C0D2C: .4byte gStringVar1
_080C0D30:
	ldr r0, _080C0D38 @ =gStringVar1
	adds r1, r4, 0
	adds r1, 0xC
	b _080C0D46
	.align 2, 0
_080C0D38: .4byte gStringVar1
_080C0D3C:
	movs r0, 0xB
	strb r0, [r2]
	b _080C0DDE
_080C0D42:
	ldr r0, _080C0D54 @ =gStringVar1
	adds r1, r4, 0x2
_080C0D46:
	ldrb r2, [r4, 0x1D]
	bl TVShowConvertInternationalString
	ldr r1, _080C0D58 @ =gUnknown_020387E8
	movs r0, 0xB
	strb r0, [r1]
	b _080C0DDE
	.align 2, 0
_080C0D54: .4byte gStringVar1
_080C0D58: .4byte gUnknown_020387E8
_080C0D5C:
	ldr r0, _080C0D74 @ =gStringVar1
	ldrh r1, [r4, 0x18]
	bl sub_80EB3FC
	ldrb r0, [r4, 0x1B]
	cmp r0, 0
	bne _080C0D7C
	ldr r1, _080C0D78 @ =gUnknown_020387E8
	movs r0, 0xC
	strb r0, [r1]
	b _080C0DDE
	.align 2, 0
_080C0D74: .4byte gStringVar1
_080C0D78: .4byte gUnknown_020387E8
_080C0D7C:
	ldr r1, _080C0D84 @ =gUnknown_020387E8
	movs r0, 0xD
	strb r0, [r1]
	b _080C0DDE
	.align 2, 0
_080C0D84: .4byte gUnknown_020387E8
_080C0D88:
	ldr r0, _080C0DB0 @ =gStringVar1
	ldrh r1, [r4, 0x18]
	bl sub_80EB3FC
	ldr r0, _080C0DB4 @ =gStringVar2
	adds r1, r4, 0x2
	ldrb r2, [r4, 0x1D]
	bl TVShowConvertInternationalString
	ldr r0, _080C0DB8 @ =gStringVar3
	adds r1, r4, 0
	adds r1, 0xC
	ldrb r2, [r4, 0x1D]
	bl TVShowConvertInternationalString
	ldr r1, _080C0DBC @ =gUnknown_020387E8
	movs r0, 0xE
	strb r0, [r1]
	b _080C0DDE
	.align 2, 0
_080C0DB0: .4byte gStringVar1
_080C0DB4: .4byte gStringVar2
_080C0DB8: .4byte gStringVar3
_080C0DBC: .4byte gUnknown_020387E8
_080C0DC0:
	ldr r0, _080C0DF0 @ =gStringVar1
	adds r1, r4, 0x2
	ldrb r2, [r4, 0x1D]
	bl TVShowConvertInternationalString
	ldr r0, _080C0DF4 @ =gStringVar2
	ldrh r2, [r4, 0xA]
	movs r1, 0xB
	muls r1, r2
	ldr r2, _080C0DF8 @ =gSpeciesNames
	adds r1, r2
	bl StringCopy
	bl TVShowDone
_080C0DDE:
	ldr r0, _080C0DFC @ =gTVBravoTrainerBattleTowerTextGroup
	lsls r1, r5, 2
	adds r1, r0
	ldr r0, [r1]
	bl ShowFieldMessage
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080C0DF0: .4byte gStringVar1
_080C0DF4: .4byte gStringVar2
_080C0DF8: .4byte gSpeciesNames
_080C0DFC: .4byte gTVBravoTrainerBattleTowerTextGroup
	thumb_func_end DoTVShowBravoTrainerBattleTowerProfile

	thumb_func_start DoTVShowTodaysSmartShopper
DoTVShowTodaysSmartShopper: @ 80C0E00
	push {r4-r6,lr}
	ldr r0, _080C0E2C @ =gSpecialVar_0x8004
	ldrh r1, [r0]
	lsls r0, r1, 3
	adds r0, r1
	lsls r0, 2
	ldr r1, _080C0E30 @ =gSaveBlock1 + 0x2738
	adds r5, r0, r1
	ldr r1, _080C0E34 @ =gScriptResult
	movs r0, 0
	strh r0, [r1]
	ldr r0, _080C0E38 @ =gUnknown_020387E8
	ldrb r6, [r0]
	adds r2, r0, 0
	cmp r6, 0xC
	bls _080C0E22
	b _080C1014
_080C0E22:
	lsls r0, r6, 2
	ldr r1, _080C0E3C @ =_080C0E40
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_080C0E2C: .4byte gSpecialVar_0x8004
_080C0E30: .4byte gSaveBlock1 + 0x2738
_080C0E34: .4byte gScriptResult
_080C0E38: .4byte gUnknown_020387E8
_080C0E3C: .4byte _080C0E40
	.align 2, 0
_080C0E40:
	.4byte _080C0E74
	.4byte _080C0EB0
	.4byte _080C0EF8
	.4byte _080C0F0A
	.4byte _080C0EF8
	.4byte _080C0EF8
	.4byte _080C0F34
	.4byte _080C0F64
	.4byte _080C0F94
	.4byte _080C0FA0
	.4byte _080C0FAE
	.4byte _080C0FC0
	.4byte _080C1004
_080C0E74:
	ldr r0, _080C0E98 @ =gStringVar1
	adds r1, r5, 0
	adds r1, 0x13
	ldrb r2, [r5, 0x3]
	bl TVShowConvertInternationalString
	ldr r0, _080C0E9C @ =gStringVar2
	ldrb r1, [r5, 0x12]
	movs r2, 0
	bl sub_80FBFB4
	ldrh r0, [r5, 0xC]
	cmp r0, 0xFE
	bls _080C0EA4
	ldr r1, _080C0EA0 @ =gUnknown_020387E8
	movs r0, 0xB
	strb r0, [r1]
	b _080C1014
	.align 2, 0
_080C0E98: .4byte gStringVar1
_080C0E9C: .4byte gStringVar2
_080C0EA0: .4byte gUnknown_020387E8
_080C0EA4:
	ldr r1, _080C0EAC @ =gUnknown_020387E8
	movs r0, 0x1
	strb r0, [r1]
	b _080C1014
	.align 2, 0
_080C0EAC: .4byte gUnknown_020387E8
_080C0EB0:
	ldr r0, _080C0EEC @ =gStringVar1
	adds r1, r5, 0
	adds r1, 0x13
	ldrb r2, [r5, 0x3]
	bl TVShowConvertInternationalString
	ldr r4, _080C0EF0 @ =gStringVar2
	ldrh r0, [r5, 0x6]
	bl ItemId_GetItem
	adds r1, r0, 0
	adds r0, r4, 0
	bl StringCopy
	ldrh r1, [r5, 0xC]
	movs r0, 0x2
	bl sub_80BF088
	ldr r4, _080C0EF4 @ =gUnknown_020387E8
	bl Random
	ldrb r2, [r4]
	adds r2, 0x1
	lsls r0, 16
	lsrs r0, 16
	movs r1, 0x3
	ands r0, r1
	adds r0, r2
	strb r0, [r4]
	b _080C1014
	.align 2, 0
_080C0EEC: .4byte gStringVar1
_080C0EF0: .4byte gStringVar2
_080C0EF4: .4byte gUnknown_020387E8
_080C0EF8:
	ldrh r0, [r5, 0x8]
	cmp r0, 0
	beq _080C0F04
	movs r0, 0x6
	strb r0, [r2]
	b _080C1014
_080C0F04:
	movs r0, 0xA
	strb r0, [r2]
	b _080C1014
_080C0F0A:
	ldrh r1, [r5, 0xC]
	adds r1, 0x1
	movs r0, 0x2
	bl sub_80BF088
	ldrh r0, [r5, 0x8]
	cmp r0, 0
	beq _080C0F28
	ldr r1, _080C0F24 @ =gUnknown_020387E8
	movs r0, 0x6
	strb r0, [r1]
	b _080C1014
	.align 2, 0
_080C0F24: .4byte gUnknown_020387E8
_080C0F28:
	ldr r1, _080C0F30 @ =gUnknown_020387E8
	movs r0, 0xA
	strb r0, [r1]
	b _080C1014
	.align 2, 0
_080C0F30: .4byte gUnknown_020387E8
_080C0F34:
	ldr r4, _080C0F5C @ =gStringVar2
	ldrh r0, [r5, 0x8]
	bl ItemId_GetItem
	adds r1, r0, 0
	adds r0, r4, 0
	bl StringCopy
	ldrh r1, [r5, 0xE]
	movs r0, 0x2
	bl sub_80BF088
	ldrh r0, [r5, 0xA]
	cmp r0, 0
	beq _080C0F7C
	ldr r1, _080C0F60 @ =gUnknown_020387E8
	movs r0, 0x7
	strb r0, [r1]
	b _080C1014
	.align 2, 0
_080C0F5C: .4byte gStringVar2
_080C0F60: .4byte gUnknown_020387E8
_080C0F64:
	ldr r4, _080C0F8C @ =gStringVar2
	ldrh r0, [r5, 0xA]
	bl ItemId_GetItem
	adds r1, r0, 0
	adds r0, r4, 0
	bl StringCopy
	ldrh r1, [r5, 0x10]
	movs r0, 0x2
	bl sub_80BF088
_080C0F7C:
	ldrb r0, [r5, 0x2]
	cmp r0, 0x1
	beq _080C0FE2
	ldr r1, _080C0F90 @ =gUnknown_020387E8
	movs r0, 0x9
	strb r0, [r1]
	b _080C1014
	.align 2, 0
_080C0F8C: .4byte gStringVar2
_080C0F90: .4byte gUnknown_020387E8
_080C0F94:
	ldrh r0, [r5, 0xC]
	cmp r0, 0xFE
	bls _080C0FBA
	movs r0, 0xC
	strb r0, [r2]
	b _080C1014
_080C0FA0:
	movs r0, 0x1
	adds r1, r5, 0
	bl sub_80BF154
	bl TVShowDone
	b _080C1014
_080C0FAE:
	ldrb r0, [r5, 0x2]
	cmp r0, 0x1
	bne _080C0FBA
	movs r0, 0x8
	strb r0, [r2]
	b _080C1014
_080C0FBA:
	movs r0, 0x9
	strb r0, [r2]
	b _080C1014
_080C0FC0:
	ldr r0, _080C0FEC @ =gStringVar1
	adds r1, r5, 0
	adds r1, 0x13
	ldrb r2, [r5, 0x3]
	bl TVShowConvertInternationalString
	ldr r4, _080C0FF0 @ =gStringVar2
	ldrh r0, [r5, 0x6]
	bl ItemId_GetItem
	adds r1, r0, 0
	adds r0, r4, 0
	bl StringCopy
	ldrb r0, [r5, 0x2]
	cmp r0, 0x1
	bne _080C0FF8
_080C0FE2:
	ldr r1, _080C0FF4 @ =gUnknown_020387E8
	movs r0, 0x8
	strb r0, [r1]
	b _080C1014
	.align 2, 0
_080C0FEC: .4byte gStringVar1
_080C0FF0: .4byte gStringVar2
_080C0FF4: .4byte gUnknown_020387E8
_080C0FF8:
	ldr r1, _080C1000 @ =gUnknown_020387E8
	movs r0, 0xC
	strb r0, [r1]
	b _080C1014
	.align 2, 0
_080C1000: .4byte gUnknown_020387E8
_080C1004:
	ldr r0, _080C1028 @ =gStringVar1
	adds r1, r5, 0
	adds r1, 0x13
	ldrb r2, [r5, 0x3]
	bl TVShowConvertInternationalString
	bl TVShowDone
_080C1014:
	ldr r0, _080C102C @ =gTVSmartShopperTextGroup
	lsls r1, r6, 2
	adds r1, r0
	ldr r0, [r1]
	bl ShowFieldMessage
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_080C1028: .4byte gStringVar1
_080C102C: .4byte gTVSmartShopperTextGroup
	thumb_func_end DoTVShowTodaysSmartShopper

	thumb_func_start DoTVShowTheNameRaterShow
DoTVShowTheNameRaterShow: @ 80C1030
	push {r4-r7,lr}
	sub sp, 0x8
	ldr r0, _080C1060 @ =gSpecialVar_0x8004
	ldrh r1, [r0]
	lsls r0, r1, 3
	adds r0, r1
	lsls r0, 2
	ldr r1, _080C1064 @ =gSaveBlock1 + 0x2738
	adds r6, r0, r1
	ldr r1, _080C1068 @ =gScriptResult
	movs r0, 0
	strh r0, [r1]
	ldr r0, _080C106C @ =gUnknown_020387E8
	ldrb r7, [r0]
	adds r2, r0, 0
	cmp r7, 0x12
	bls _080C1054
	b _080C138A
_080C1054:
	lsls r0, r7, 2
	ldr r1, _080C1070 @ =_080C1074
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_080C1060: .4byte gSpecialVar_0x8004
_080C1064: .4byte gSaveBlock1 + 0x2738
_080C1068: .4byte gScriptResult
_080C106C: .4byte gUnknown_020387E8
_080C1070: .4byte _080C1074
	.align 2, 0
_080C1074:
	.4byte _080C10C0
	.4byte _080C1108
	.4byte _080C112A
	.4byte _080C1108
	.4byte _080C1108
	.4byte _080C1108
	.4byte _080C1108
	.4byte _080C1108
	.4byte _080C1108
	.4byte _080C1170
	.4byte _080C1170
	.4byte _080C1170
	.4byte _080C136C
	.4byte _080C11CC
	.4byte _080C1228
	.4byte _080C127C
	.4byte _080C12D4
	.4byte _080C1314
	.4byte _080C1370
_080C10C0:
	ldr r0, _080C10F4 @ =gStringVar1
	adds r1, r6, 0
	adds r1, 0xF
	ldrb r2, [r6, 0x1E]
	bl TVShowConvertInternationalString
	ldr r0, _080C10F8 @ =gStringVar2
	ldrh r2, [r6, 0x2]
	movs r1, 0xB
	muls r1, r2
	ldr r2, _080C10FC @ =gSpeciesNames
	adds r1, r2
	bl StringCopy
	ldr r0, _080C1100 @ =gStringVar3
	adds r1, r6, 0x4
	ldrb r2, [r6, 0x1F]
	bl TVShowConvertInternationalString
	ldr r4, _080C1104 @ =gUnknown_020387E8
	adds r0, r6, 0
	bl sub_80BF7E8
	adds r0, 0x1
	strb r0, [r4]
	b _080C138A
	.align 2, 0
_080C10F4: .4byte gStringVar1
_080C10F8: .4byte gStringVar2
_080C10FC: .4byte gSpeciesNames
_080C1100: .4byte gStringVar3
_080C1104: .4byte gUnknown_020387E8
_080C1108:
	ldrb r0, [r6, 0x1A]
	cmp r0, 0
	bne _080C1114
	movs r0, 0x9
	strb r0, [r2]
	b _080C138A
_080C1114:
	cmp r0, 0x1
	bne _080C111E
	movs r0, 0xA
	strb r0, [r2]
	b _080C138A
_080C111E:
	cmp r0, 0x2
	beq _080C1124
	b _080C138A
_080C1124:
	movs r0, 0xB
	strb r0, [r2]
	b _080C138A
_080C112A:
	ldr r0, _080C1144 @ =gStringVar1
	adds r1, r6, 0
	adds r1, 0xF
	ldrb r2, [r6, 0x1E]
	bl TVShowConvertInternationalString
	ldrb r0, [r6, 0x1A]
	cmp r0, 0
	bne _080C114C
	ldr r1, _080C1148 @ =gUnknown_020387E8
	movs r0, 0x9
	strb r0, [r1]
	b _080C138A
	.align 2, 0
_080C1144: .4byte gStringVar1
_080C1148: .4byte gUnknown_020387E8
_080C114C:
	cmp r0, 0x1
	bne _080C115C
	ldr r1, _080C1158 @ =gUnknown_020387E8
	movs r0, 0xA
	strb r0, [r1]
	b _080C138A
	.align 2, 0
_080C1158: .4byte gUnknown_020387E8
_080C115C:
	cmp r0, 0x2
	beq _080C1162
	b _080C138A
_080C1162:
	ldr r1, _080C116C @ =gUnknown_020387E8
	movs r0, 0xB
	strb r0, [r1]
	b _080C138A
	.align 2, 0
_080C116C: .4byte gUnknown_020387E8
_080C1170:
	movs r5, 0
	str r5, [sp]
	str r6, [sp, 0x4]
	movs r0, 0
	movs r1, 0x1
	movs r2, 0
	movs r3, 0x1
	bl sub_80BF820
	ldr r0, _080C11BC @ =gStringVar3
	ldr r4, _080C11C0 @ =gStringVar1
	ldrb r2, [r6, 0x1F]
	adds r1, r4, 0
	bl TVShowConvertInternationalString
	str r5, [sp]
	str r6, [sp, 0x4]
	movs r0, 0
	movs r1, 0
	movs r2, 0
	movs r3, 0x1
	bl sub_80BF820
	ldr r0, _080C11C4 @ =gStringVar2
	ldrb r2, [r6, 0x1F]
	adds r1, r4, 0
	bl TVShowConvertInternationalString
	adds r1, r6, 0x4
	ldrb r2, [r6, 0x1F]
	adds r0, r4, 0
	bl TVShowConvertInternationalString
	ldr r1, _080C11C8 @ =gUnknown_020387E8
	movs r0, 0xC
	strb r0, [r1]
	b _080C138A
	.align 2, 0
_080C11BC: .4byte gStringVar3
_080C11C0: .4byte gStringVar1
_080C11C4: .4byte gStringVar2
_080C11C8: .4byte gUnknown_020387E8
_080C11CC:
	movs r5, 0
	str r5, [sp]
	str r6, [sp, 0x4]
	movs r0, 0
	movs r1, 0
	movs r2, 0x3
	movs r3, 0x1
	bl sub_80BF820
	ldr r0, _080C1218 @ =gStringVar3
	ldr r4, _080C121C @ =gStringVar1
	ldrb r2, [r6, 0x1F]
	adds r1, r4, 0
	bl TVShowConvertInternationalString
	str r5, [sp]
	str r6, [sp, 0x4]
	movs r0, 0
	movs r1, 0
	movs r2, 0x2
	movs r3, 0
	bl sub_80BF820
	ldr r0, _080C1220 @ =gStringVar2
	ldrb r2, [r6, 0x1E]
	adds r1, r4, 0
	bl TVShowConvertInternationalString
	adds r1, r6, 0
	adds r1, 0xF
	ldrb r2, [r6, 0x1E]
	adds r0, r4, 0
	bl TVShowConvertInternationalString
	ldr r1, _080C1224 @ =gUnknown_020387E8
	movs r0, 0xE
	strb r0, [r1]
	b _080C138A
	.align 2, 0
_080C1218: .4byte gStringVar3
_080C121C: .4byte gStringVar1
_080C1220: .4byte gStringVar2
_080C1224: .4byte gUnknown_020387E8
_080C1228:
	movs r5, 0
	str r5, [sp]
	str r6, [sp, 0x4]
	movs r0, 0
	movs r1, 0
	movs r2, 0x3
	movs r3, 0
	bl sub_80BF820
	ldr r0, _080C1270 @ =gStringVar3
	ldr r4, _080C1274 @ =gStringVar1
	ldrb r2, [r6, 0x1E]
	adds r1, r4, 0
	bl TVShowConvertInternationalString
	str r5, [sp]
	str r6, [sp, 0x4]
	movs r0, 0
	movs r1, 0
	movs r2, 0x2
	movs r3, 0x1
	bl sub_80BF820
	ldr r0, _080C1278 @ =gStringVar2
	ldrb r2, [r6, 0x1F]
	adds r1, r4, 0
	bl TVShowConvertInternationalString
	adds r1, r6, 0
	adds r1, 0xF
	ldrb r2, [r6, 0x1E]
	adds r0, r4, 0
	bl TVShowConvertInternationalString
	b _080C1354
	.align 2, 0
_080C1270: .4byte gStringVar3
_080C1274: .4byte gStringVar1
_080C1278: .4byte gStringVar2
_080C127C:
	movs r0, 0
	str r0, [sp]
	str r6, [sp, 0x4]
	movs r0, 0x1
	movs r1, 0
	movs r2, 0x2
	movs r3, 0x1
	bl sub_80BF820
	ldr r0, _080C12C4 @ =gStringVar1
	ldr r4, _080C12C8 @ =gStringVar2
	ldrb r2, [r6, 0x1F]
	adds r1, r4, 0
	bl TVShowConvertInternationalString
	ldrh r1, [r6, 0x2]
	movs r0, 0xB
	muls r1, r0
	ldr r0, _080C12CC @ =gSpeciesNames
	adds r1, r0
	adds r0, r4, 0
	bl StringCopy
	ldrh r0, [r6, 0x2]
	str r0, [sp]
	str r6, [sp, 0x4]
	movs r0, 0x2
	movs r1, 0
	movs r2, 0x3
	movs r3, 0x2
	bl sub_80BF820
	ldr r1, _080C12D0 @ =gUnknown_020387E8
	movs r0, 0x10
	strb r0, [r1]
	b _080C138A
	.align 2, 0
_080C12C4: .4byte gStringVar1
_080C12C8: .4byte gStringVar2
_080C12CC: .4byte gSpeciesNames
_080C12D0: .4byte gUnknown_020387E8
_080C12D4:
	movs r0, 0
	str r0, [sp]
	str r6, [sp, 0x4]
	movs r1, 0
	movs r2, 0x3
	movs r3, 0x1
	bl sub_80BF820
	ldr r0, _080C1308 @ =gStringVar3
	ldr r1, _080C130C @ =gStringVar1
	ldrb r2, [r6, 0x1F]
	bl TVShowConvertInternationalString
	ldrh r0, [r6, 0x2]
	str r0, [sp]
	str r6, [sp, 0x4]
	movs r0, 0
	movs r1, 0
	movs r2, 0x2
	movs r3, 0x2
	bl sub_80BF820
	ldr r1, _080C1310 @ =gUnknown_020387E8
	movs r0, 0x11
	strb r0, [r1]
	b _080C138A
	.align 2, 0
_080C1308: .4byte gStringVar3
_080C130C: .4byte gStringVar1
_080C1310: .4byte gUnknown_020387E8
_080C1314:
	movs r0, 0
	str r0, [sp]
	str r6, [sp, 0x4]
	movs r0, 0x1
	movs r1, 0
	movs r2, 0x2
	movs r3, 0x1
	bl sub_80BF820
	ldr r0, _080C135C @ =gStringVar1
	ldr r4, _080C1360 @ =gStringVar2
	ldrb r2, [r6, 0x1F]
	adds r1, r4, 0
	bl TVShowConvertInternationalString
	ldrh r0, [r6, 0x1C]
	str r0, [sp]
	str r6, [sp, 0x4]
	movs r0, 0x2
	movs r1, 0
	movs r2, 0x3
	movs r3, 0x2
	bl sub_80BF820
	ldrh r1, [r6, 0x1C]
	movs r0, 0xB
	muls r1, r0
	ldr r0, _080C1364 @ =gSpeciesNames
	adds r1, r0
	adds r0, r4, 0
	bl StringCopy
_080C1354:
	ldr r1, _080C1368 @ =gUnknown_020387E8
	movs r0, 0x12
	strb r0, [r1]
	b _080C138A
	.align 2, 0
_080C135C: .4byte gStringVar1
_080C1360: .4byte gStringVar2
_080C1364: .4byte gSpeciesNames
_080C1368: .4byte gUnknown_020387E8
_080C136C:
	movs r7, 0x12
	strb r7, [r2]
_080C1370:
	ldr r0, _080C13A0 @ =gStringVar1
	adds r1, r6, 0x4
	ldrb r2, [r6, 0x1F]
	bl TVShowConvertInternationalString
	ldr r0, _080C13A4 @ =gStringVar2
	adds r1, r6, 0
	adds r1, 0xF
	ldrb r2, [r6, 0x1E]
	bl TVShowConvertInternationalString
	bl TVShowDone
_080C138A:
	ldr r0, _080C13A8 @ =gTVNameRaterTextGroup
	lsls r1, r7, 2
	adds r1, r0
	ldr r0, [r1]
	bl ShowFieldMessage
	add sp, 0x8
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080C13A0: .4byte gStringVar1
_080C13A4: .4byte gStringVar2
_080C13A8: .4byte gTVNameRaterTextGroup
	thumb_func_end DoTVShowTheNameRaterShow

	thumb_func_start DoTVShowPokemonTodaySuccessfulCapture
DoTVShowPokemonTodaySuccessfulCapture: @ 80C13AC
	push {r4-r6,lr}
	ldr r0, _080C13D8 @ =gSpecialVar_0x8004
	ldrh r1, [r0]
	lsls r0, r1, 3
	adds r0, r1
	lsls r0, 2
	ldr r1, _080C13DC @ =gSaveBlock1 + 0x2738
	adds r5, r0, r1
	ldr r1, _080C13E0 @ =gScriptResult
	movs r0, 0
	strh r0, [r1]
	ldr r0, _080C13E4 @ =gUnknown_020387E8
	ldrb r6, [r0]
	adds r2, r0, 0
	cmp r6, 0xB
	bls _080C13CE
	b _080C15DC
_080C13CE:
	lsls r0, r6, 2
	ldr r1, _080C13E8 @ =_080C13EC
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_080C13D8: .4byte gSpecialVar_0x8004
_080C13DC: .4byte gSaveBlock1 + 0x2738
_080C13E0: .4byte gScriptResult
_080C13E4: .4byte gUnknown_020387E8
_080C13E8: .4byte _080C13EC
	.align 2, 0
_080C13EC:
	.4byte _080C141C
	.4byte _080C1470
	.4byte _080C1476
	.4byte _080C14B0
	.4byte _080C14E8
	.4byte _080C14EE
	.4byte _080C1524
	.4byte _080C1578
	.4byte _080C1578
	.4byte _080C15A8
	.4byte _080C15A8
	.4byte _080C15D8
_080C141C:
	ldr r0, _080C1450 @ =gStringVar1
	adds r1, r5, 0
	adds r1, 0x13
	ldrb r2, [r5, 0x2]
	bl TVShowConvertInternationalString
	ldr r0, _080C1454 @ =gStringVar2
	ldrh r2, [r5, 0x10]
	movs r1, 0xB
	muls r1, r2
	ldr r2, _080C1458 @ =gSpeciesNames
	adds r1, r2
	bl StringCopy
	ldr r0, _080C145C @ =gStringVar3
	adds r1, r5, 0x4
	ldrb r2, [r5, 0x3]
	bl TVShowConvertInternationalString
	ldrb r0, [r5, 0xF]
	cmp r0, 0x1
	bne _080C1464
	ldr r1, _080C1460 @ =gUnknown_020387E8
	movs r0, 0x5
	strb r0, [r1]
	b _080C15DC
	.align 2, 0
_080C1450: .4byte gStringVar1
_080C1454: .4byte gStringVar2
_080C1458: .4byte gSpeciesNames
_080C145C: .4byte gStringVar3
_080C1460: .4byte gUnknown_020387E8
_080C1464:
	ldr r1, _080C146C @ =gUnknown_020387E8
	movs r0, 0x1
	strb r0, [r1]
	b _080C15DC
	.align 2, 0
_080C146C: .4byte gUnknown_020387E8
_080C1470:
	movs r0, 0x2
	strb r0, [r2]
	b _080C15DC
_080C1476:
	ldr r4, _080C149C @ =gStringVar2
	ldrb r0, [r5, 0xF]
	bl ItemId_GetItem
	adds r1, r0, 0
	adds r0, r4, 0
	bl StringCopy
	ldrb r1, [r5, 0x12]
	movs r0, 0x2
	bl sub_80BF088
	ldrb r0, [r5, 0x12]
	cmp r0, 0x3
	bhi _080C14A4
	ldr r1, _080C14A0 @ =gUnknown_020387E8
	movs r0, 0x3
	strb r0, [r1]
	b _080C15DC
	.align 2, 0
_080C149C: .4byte gStringVar2
_080C14A0: .4byte gUnknown_020387E8
_080C14A4:
	ldr r1, _080C14AC @ =gUnknown_020387E8
	movs r0, 0x4
	strb r0, [r1]
	b _080C15DC
	.align 2, 0
_080C14AC: .4byte gUnknown_020387E8
_080C14B0:
	ldr r0, _080C14D8 @ =gStringVar1
	adds r1, r5, 0
	adds r1, 0x13
	ldrb r2, [r5, 0x2]
	bl TVShowConvertInternationalString
	ldr r0, _080C14DC @ =gStringVar2
	ldrh r2, [r5, 0x10]
	movs r1, 0xB
	muls r1, r2
	ldr r2, _080C14E0 @ =gSpeciesNames
	adds r1, r2
	bl StringCopy
	ldr r0, _080C14E4 @ =gStringVar3
	adds r1, r5, 0x4
	ldrb r2, [r5, 0x3]
	bl TVShowConvertInternationalString
	b _080C150A
	.align 2, 0
_080C14D8: .4byte gStringVar1
_080C14DC: .4byte gStringVar2
_080C14E0: .4byte gSpeciesNames
_080C14E4: .4byte gStringVar3
_080C14E8:
	movs r0, 0x6
	strb r0, [r2]
	b _080C15DC
_080C14EE:
	ldr r0, _080C1514 @ =gStringVar1
	adds r1, r5, 0
	adds r1, 0x13
	ldrb r2, [r5, 0x2]
	bl TVShowConvertInternationalString
	ldr r0, _080C1518 @ =gStringVar2
	ldrh r2, [r5, 0x10]
	movs r1, 0xB
	muls r1, r2
	ldr r2, _080C151C @ =gSpeciesNames
	adds r1, r2
	bl StringCopy
_080C150A:
	ldr r1, _080C1520 @ =gUnknown_020387E8
	movs r0, 0x6
	strb r0, [r1]
	b _080C15DC
	.align 2, 0
_080C1514: .4byte gStringVar1
_080C1518: .4byte gStringVar2
_080C151C: .4byte gSpeciesNames
_080C1520: .4byte gUnknown_020387E8
_080C1524:
	ldr r0, _080C1564 @ =gStringVar1
	adds r1, r5, 0
	adds r1, 0x13
	ldrb r2, [r5, 0x2]
	bl TVShowConvertInternationalString
	ldr r0, _080C1568 @ =gStringVar2
	ldrh r2, [r5, 0x10]
	movs r1, 0xB
	muls r1, r2
	ldr r2, _080C156C @ =gSpeciesNames
	adds r1, r2
	bl StringCopy
	ldr r0, _080C1570 @ =gStringVar3
	adds r1, r5, 0x4
	ldrb r2, [r5, 0x3]
	bl TVShowConvertInternationalString
	ldr r4, _080C1574 @ =gUnknown_020387E8
	bl Random
	ldrb r2, [r4]
	adds r2, 0x1
	lsls r0, 16
	lsrs r0, 16
	movs r1, 0x3
	ands r0, r1
	adds r0, r2
	strb r0, [r4]
	b _080C15DC
	.align 2, 0
_080C1564: .4byte gStringVar1
_080C1568: .4byte gStringVar2
_080C156C: .4byte gSpeciesNames
_080C1570: .4byte gStringVar3
_080C1574: .4byte gUnknown_020387E8
_080C1578:
	ldr r0, _080C159C @ =gStringVar1
	ldrh r1, [r5, 0x10]
	movs r4, 0xB
	muls r1, r4
	ldr r2, _080C15A0 @ =gSpeciesNames
	adds r1, r2
	bl StringCopy
	ldr r0, _080C15A4 @ =gStringVar2
	adds r1, r5, 0x4
	ldrb r2, [r5, 0x3]
	bl TVShowConvertInternationalString
	ldrh r1, [r5, 0x10]
	movs r0, 0x2
	bl sub_80BF638
	b _080C15C2
	.align 2, 0
_080C159C: .4byte gStringVar1
_080C15A0: .4byte gSpeciesNames
_080C15A4: .4byte gStringVar2
_080C15A8:
	ldr r0, _080C15C8 @ =gStringVar1
	ldrh r1, [r5, 0x10]
	movs r4, 0xB
	muls r1, r4
	ldr r2, _080C15CC @ =gSpeciesNames
	adds r1, r2
	bl StringCopy
	ldr r0, _080C15D0 @ =gStringVar2
	adds r1, r5, 0x4
	ldrb r2, [r5, 0x3]
	bl TVShowConvertInternationalString
_080C15C2:
	ldr r0, _080C15D4 @ =gUnknown_020387E8
	strb r4, [r0]
	b _080C15DC
	.align 2, 0
_080C15C8: .4byte gStringVar1
_080C15CC: .4byte gSpeciesNames
_080C15D0: .4byte gStringVar2
_080C15D4: .4byte gUnknown_020387E8
_080C15D8:
	bl TVShowDone
_080C15DC:
	ldr r0, _080C15F0 @ =gTVPokemonTodayTextGroup
	lsls r1, r6, 2
	adds r1, r0
	ldr r0, [r1]
	bl ShowFieldMessage
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_080C15F0: .4byte gTVPokemonTodayTextGroup
	thumb_func_end DoTVShowPokemonTodaySuccessfulCapture

	thumb_func_start DoTVShowPokemonTodayFailedCapture
DoTVShowPokemonTodayFailedCapture: @ 80C15F4
	push {r4,r5,lr}
	ldr r0, _080C1620 @ =gSpecialVar_0x8004
	ldrh r1, [r0]
	lsls r0, r1, 3
	adds r0, r1
	lsls r0, 2
	ldr r1, _080C1624 @ =gSaveBlock1 + 0x2738
	adds r4, r0, r1
	ldr r1, _080C1628 @ =gScriptResult
	movs r0, 0
	strh r0, [r1]
	ldr r0, _080C162C @ =gUnknown_020387E8
	ldrb r5, [r0]
	cmp r5, 0x6
	bls _080C1614
	b _080C173C
_080C1614:
	lsls r0, r5, 2
	ldr r1, _080C1630 @ =_080C1634
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_080C1620: .4byte gSpecialVar_0x8004
_080C1624: .4byte gSaveBlock1 + 0x2738
_080C1628: .4byte gScriptResult
_080C162C: .4byte gUnknown_020387E8
_080C1630: .4byte _080C1634
	.align 2, 0
_080C1634:
	.4byte _080C1650
	.4byte _080C1684
	.4byte _080C16D8
	.4byte _080C16D8
	.4byte _080C171C
	.4byte _080C171C
	.4byte _080C1738
_080C1650:
	ldr r0, _080C1674 @ =gStringVar1
	adds r1, r4, 0
	adds r1, 0x13
	ldrb r2, [r4, 0x2]
	bl TVShowConvertInternationalString
	ldr r0, _080C1678 @ =gStringVar2
	ldrh r2, [r4, 0xC]
	movs r1, 0xB
	muls r1, r2
	ldr r2, _080C167C @ =gSpeciesNames
	adds r1, r2
	bl StringCopy
	ldr r1, _080C1680 @ =gUnknown_020387E8
	movs r0, 0x1
	strb r0, [r1]
	b _080C173C
	.align 2, 0
_080C1674: .4byte gStringVar1
_080C1678: .4byte gStringVar2
_080C167C: .4byte gSpeciesNames
_080C1680: .4byte gUnknown_020387E8
_080C1684:
	ldr r0, _080C16B8 @ =gStringVar1
	adds r1, r4, 0
	adds r1, 0x13
	ldrb r2, [r4, 0x2]
	bl TVShowConvertInternationalString
	ldr r0, _080C16BC @ =gStringVar2
	ldrb r1, [r4, 0x12]
	movs r2, 0
	bl sub_80FBFB4
	ldr r0, _080C16C0 @ =gStringVar3
	ldrh r2, [r4, 0xE]
	movs r1, 0xB
	muls r1, r2
	ldr r2, _080C16C4 @ =gSpeciesNames
	adds r1, r2
	bl StringCopy
	ldrb r0, [r4, 0x11]
	cmp r0, 0x1
	bne _080C16CC
	ldr r1, _080C16C8 @ =gUnknown_020387E8
	movs r0, 0x3
	strb r0, [r1]
	b _080C173C
	.align 2, 0
_080C16B8: .4byte gStringVar1
_080C16BC: .4byte gStringVar2
_080C16C0: .4byte gStringVar3
_080C16C4: .4byte gSpeciesNames
_080C16C8: .4byte gUnknown_020387E8
_080C16CC:
	ldr r1, _080C16D4 @ =gUnknown_020387E8
	movs r0, 0x2
	strb r0, [r1]
	b _080C173C
	.align 2, 0
_080C16D4: .4byte gUnknown_020387E8
_080C16D8:
	ldr r0, _080C1708 @ =gStringVar1
	adds r1, r4, 0
	adds r1, 0x13
	ldrb r2, [r4, 0x2]
	bl TVShowConvertInternationalString
	ldrb r1, [r4, 0x10]
	movs r0, 0x1
	bl sub_80BF088
	bl Random
	lsls r0, 16
	lsrs r0, 16
	movs r1, 0x3
	bl __umodsi3
	lsls r0, 16
	cmp r0, 0
	bne _080C1710
	ldr r1, _080C170C @ =gUnknown_020387E8
	movs r0, 0x5
	strb r0, [r1]
	b _080C173C
	.align 2, 0
_080C1708: .4byte gStringVar1
_080C170C: .4byte gUnknown_020387E8
_080C1710:
	ldr r1, _080C1718 @ =gUnknown_020387E8
	movs r0, 0x4
	strb r0, [r1]
	b _080C173C
	.align 2, 0
_080C1718: .4byte gUnknown_020387E8
_080C171C:
	ldr r0, _080C1730 @ =gStringVar1
	adds r1, r4, 0
	adds r1, 0x13
	ldrb r2, [r4, 0x2]
	bl TVShowConvertInternationalString
	ldr r1, _080C1734 @ =gUnknown_020387E8
	movs r0, 0x6
	strb r0, [r1]
	b _080C173C
	.align 2, 0
_080C1730: .4byte gStringVar1
_080C1734: .4byte gUnknown_020387E8
_080C1738:
	bl TVShowDone
_080C173C:
	ldr r0, _080C1750 @ =gTVPokemonTodayFailedCaptureTextGroup
	lsls r1, r5, 2
	adds r1, r0
	ldr r0, [r1]
	bl ShowFieldMessage
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080C1750: .4byte gTVPokemonTodayFailedCaptureTextGroup
	thumb_func_end DoTVShowPokemonTodayFailedCapture

	thumb_func_start DoTVShowPokemonFanClubLetter
DoTVShowPokemonFanClubLetter: @ 80C1754
	push {r4-r7,lr}
	ldr r0, _080C1780 @ =gSpecialVar_0x8004
	ldrh r1, [r0]
	lsls r0, r1, 3
	adds r0, r1
	lsls r0, 2
	ldr r1, _080C1784 @ =gSaveBlock1 + 0x2738
	adds r5, r0, r1
	ldr r1, _080C1788 @ =gScriptResult
	movs r0, 0
	strh r0, [r1]
	ldr r0, _080C178C @ =gUnknown_020387E8
	ldrb r7, [r0]
	adds r6, r0, 0
	cmp r7, 0x33
	bls _080C1776
	b _080C1960
_080C1776:
	lsls r0, r7, 2
	ldr r1, _080C1790 @ =_080C1794
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_080C1780: .4byte gSpecialVar_0x8004
_080C1784: .4byte gSaveBlock1 + 0x2738
_080C1788: .4byte gScriptResult
_080C178C: .4byte gUnknown_020387E8
_080C1790: .4byte _080C1794
	.align 2, 0
_080C1794:
	.4byte _080C1864
	.4byte _080C1898
	.4byte _080C18C4
	.4byte _080C18CA
	.4byte _080C18E2
	.4byte _080C18E2
	.4byte _080C18E2
	.4byte _080C18F4
	.4byte _080C1960
	.4byte _080C1960
	.4byte _080C1960
	.4byte _080C1960
	.4byte _080C1960
	.4byte _080C1960
	.4byte _080C1960
	.4byte _080C1960
	.4byte _080C1960
	.4byte _080C1960
	.4byte _080C1960
	.4byte _080C1960
	.4byte _080C1960
	.4byte _080C1960
	.4byte _080C1960
	.4byte _080C1960
	.4byte _080C1960
	.4byte _080C1960
	.4byte _080C1960
	.4byte _080C1960
	.4byte _080C1960
	.4byte _080C1960
	.4byte _080C1960
	.4byte _080C1960
	.4byte _080C1960
	.4byte _080C1960
	.4byte _080C1960
	.4byte _080C1960
	.4byte _080C1960
	.4byte _080C1960
	.4byte _080C1960
	.4byte _080C1960
	.4byte _080C1960
	.4byte _080C1960
	.4byte _080C1960
	.4byte _080C1960
	.4byte _080C1960
	.4byte _080C1960
	.4byte _080C1960
	.4byte _080C1960
	.4byte _080C1960
	.4byte _080C1960
	.4byte _080C1916
	.4byte _080C193C
_080C1864:
	ldr r0, _080C1888 @ =gStringVar1
	adds r1, r5, 0
	adds r1, 0x10
	ldrb r2, [r5, 0x18]
	bl TVShowConvertInternationalString
	ldr r0, _080C188C @ =gStringVar2
	ldrh r2, [r5, 0x2]
	movs r1, 0xB
	muls r1, r2
	ldr r2, _080C1890 @ =gSpeciesNames
	adds r1, r2
	bl StringCopy
	ldr r1, _080C1894 @ =gUnknown_020387E8
	movs r0, 0x32
	strb r0, [r1]
	b _080C1960
	.align 2, 0
_080C1888: .4byte gStringVar1
_080C188C: .4byte gStringVar2
_080C1890: .4byte gSpeciesNames
_080C1894: .4byte gUnknown_020387E8
_080C1898:
	bl Random
	lsls r0, 16
	lsrs r0, 16
	movs r1, 0x3
	ands r0, r1
	adds r2, r0, 0x1
	cmp r2, 0x1
	bne _080C18B8
	ldr r1, _080C18B4 @ =gUnknown_020387E8
	movs r0, 0x2
	strb r0, [r1]
	b _080C1960
	.align 2, 0
_080C18B4: .4byte gUnknown_020387E8
_080C18B8:
	ldr r1, _080C18C0 @ =gUnknown_020387E8
	adds r0, r2, 0x2
	strb r0, [r1]
	b _080C1960
	.align 2, 0
_080C18C0: .4byte gUnknown_020387E8
_080C18C4:
	movs r0, 0x33
	strb r0, [r6]
	b _080C1960
_080C18CA:
	bl Random
	ldrb r4, [r6]
	adds r4, 0x1
	lsls r0, 16
	lsrs r0, 16
	movs r1, 0x3
	bl __umodsi3
	adds r0, r4
	strb r0, [r6]
	b _080C1960
_080C18E2:
	adds r0, r5, 0
	bl sub_80BF79C
	ldr r1, _080C18F0 @ =gUnknown_020387E8
	movs r0, 0x7
	strb r0, [r1]
	b _080C1960
	.align 2, 0
_080C18F0: .4byte gUnknown_020387E8
_080C18F4:
	bl Random
	lsls r0, 16
	lsrs r0, 16
	movs r1, 0x1F
	bl __umodsi3
	adds r0, 0x46
	lsls r0, 16
	lsrs r2, r0, 16
	movs r0, 0x2
	adds r1, r2, 0
	bl sub_80BF088
	bl TVShowDone
	b _080C1960
_080C1916:
	ldr r4, _080C1934 @ =gStringVar4
	adds r1, r5, 0x4
	adds r0, r4, 0
	movs r2, 0x2
	movs r3, 0x2
	bl ConvertEasyChatWordsToString
	adds r0, r4, 0
	bl ShowFieldMessage
	ldr r1, _080C1938 @ =gUnknown_020387E8
	movs r0, 0x1
	strb r0, [r1]
	b _080C196C
	.align 2, 0
_080C1934: .4byte gStringVar4
_080C1938: .4byte gUnknown_020387E8
_080C193C:
	ldr r4, _080C1958 @ =gStringVar4
	adds r1, r5, 0x4
	adds r0, r4, 0
	movs r2, 0x2
	movs r3, 0x2
	bl ConvertEasyChatWordsToString
	adds r0, r4, 0
	bl ShowFieldMessage
	ldr r1, _080C195C @ =gUnknown_020387E8
	movs r0, 0x3
	strb r0, [r1]
	b _080C196C
	.align 2, 0
_080C1958: .4byte gStringVar4
_080C195C: .4byte gUnknown_020387E8
_080C1960:
	ldr r0, _080C1974 @ =gTVFanClubTextGroup
	lsls r1, r7, 2
	adds r1, r0
	ldr r0, [r1]
	bl ShowFieldMessage
_080C196C:
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080C1974: .4byte gTVFanClubTextGroup
	thumb_func_end DoTVShowPokemonFanClubLetter

	thumb_func_start DoTVShowRecentHappenings
DoTVShowRecentHappenings: @ 80C1978
	push {r4-r7,lr}
	ldr r0, _080C19A4 @ =gSpecialVar_0x8004
	ldrh r1, [r0]
	lsls r0, r1, 3
	adds r0, r1
	lsls r0, 2
	ldr r1, _080C19A8 @ =gSaveBlock1 + 0x2738
	adds r5, r0, r1
	ldr r1, _080C19AC @ =gScriptResult
	movs r0, 0
	strh r0, [r1]
	ldr r0, _080C19B0 @ =gUnknown_020387E8
	ldrb r6, [r0]
	adds r7, r0, 0
	cmp r6, 0x32
	bls _080C199A
	b _080C1AF0
_080C199A:
	lsls r0, r6, 2
	ldr r1, _080C19B4 @ =_080C19B8
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_080C19A4: .4byte gSpecialVar_0x8004
_080C19A8: .4byte gSaveBlock1 + 0x2738
_080C19AC: .4byte gScriptResult
_080C19B0: .4byte gUnknown_020387E8
_080C19B4: .4byte _080C19B8
	.align 2, 0
_080C19B8:
	.4byte _080C1A84
	.4byte _080C1AA8
	.4byte _080C1AC0
	.4byte _080C1AC0
	.4byte _080C1AC0
	.4byte _080C1AC6
	.4byte _080C1AF0
	.4byte _080C1AF0
	.4byte _080C1AF0
	.4byte _080C1AF0
	.4byte _080C1AF0
	.4byte _080C1AF0
	.4byte _080C1AF0
	.4byte _080C1AF0
	.4byte _080C1AF0
	.4byte _080C1AF0
	.4byte _080C1AF0
	.4byte _080C1AF0
	.4byte _080C1AF0
	.4byte _080C1AF0
	.4byte _080C1AF0
	.4byte _080C1AF0
	.4byte _080C1AF0
	.4byte _080C1AF0
	.4byte _080C1AF0
	.4byte _080C1AF0
	.4byte _080C1AF0
	.4byte _080C1AF0
	.4byte _080C1AF0
	.4byte _080C1AF0
	.4byte _080C1AF0
	.4byte _080C1AF0
	.4byte _080C1AF0
	.4byte _080C1AF0
	.4byte _080C1AF0
	.4byte _080C1AF0
	.4byte _080C1AF0
	.4byte _080C1AF0
	.4byte _080C1AF0
	.4byte _080C1AF0
	.4byte _080C1AF0
	.4byte _080C1AF0
	.4byte _080C1AF0
	.4byte _080C1AF0
	.4byte _080C1AF0
	.4byte _080C1AF0
	.4byte _080C1AF0
	.4byte _080C1AF0
	.4byte _080C1AF0
	.4byte _080C1AF0
	.4byte _080C1ACC
_080C1A84:
	ldr r0, _080C1AA0 @ =gStringVar1
	adds r1, r5, 0
	adds r1, 0x10
	ldrb r2, [r5, 0x18]
	bl TVShowConvertInternationalString
	adds r0, r5, 0
	bl sub_80BF79C
	ldr r1, _080C1AA4 @ =gUnknown_020387E8
	movs r0, 0x32
	strb r0, [r1]
	b _080C1AF0
	.align 2, 0
_080C1AA0: .4byte gStringVar1
_080C1AA4: .4byte gUnknown_020387E8
_080C1AA8:
	bl Random
	ldrb r4, [r7]
	adds r4, 0x1
	lsls r0, 16
	lsrs r0, 16
	movs r1, 0x3
	bl __umodsi3
	adds r0, r4
	strb r0, [r7]
	b _080C1AF0
_080C1AC0:
	movs r0, 0x5
	strb r0, [r7]
	b _080C1AF0
_080C1AC6:
	bl TVShowDone
	b _080C1AF0
_080C1ACC:
	ldr r4, _080C1AE8 @ =gStringVar4
	adds r1, r5, 0x4
	adds r0, r4, 0
	movs r2, 0x2
	movs r3, 0x2
	bl ConvertEasyChatWordsToString
	adds r0, r4, 0
	bl ShowFieldMessage
	ldr r1, _080C1AEC @ =gUnknown_020387E8
	movs r0, 0x1
	strb r0, [r1]
	b _080C1AFC
	.align 2, 0
_080C1AE8: .4byte gStringVar4
_080C1AEC: .4byte gUnknown_020387E8
_080C1AF0:
	ldr r0, _080C1B04 @ =gTVRecentHappeningsTextGroup
	lsls r1, r6, 2
	adds r1, r0
	ldr r0, [r1]
	bl ShowFieldMessage
_080C1AFC:
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080C1B04: .4byte gTVRecentHappeningsTextGroup
	thumb_func_end DoTVShowRecentHappenings

	thumb_func_start DoTVShowPokemonFanClubOpinions
DoTVShowPokemonFanClubOpinions: @ 80C1B08
	push {r4-r6,lr}
	ldr r0, _080C1B30 @ =gSpecialVar_0x8004
	ldrh r1, [r0]
	lsls r0, r1, 3
	adds r0, r1
	lsls r0, 2
	ldr r1, _080C1B34 @ =gSaveBlock1 + 0x2738
	adds r4, r0, r1
	ldr r1, _080C1B38 @ =gScriptResult
	movs r0, 0
	strh r0, [r1]
	ldr r6, _080C1B3C @ =gUnknown_020387E8
	ldrb r5, [r6]
	cmp r5, 0x3
	bgt _080C1B40
	cmp r5, 0x1
	bge _080C1B88
	cmp r5, 0
	beq _080C1B46
	b _080C1BD6
	.align 2, 0
_080C1B30: .4byte gSpecialVar_0x8004
_080C1B34: .4byte gSaveBlock1 + 0x2738
_080C1B38: .4byte gScriptResult
_080C1B3C: .4byte gUnknown_020387E8
_080C1B40:
	cmp r5, 0x4
	beq _080C1BC0
	b _080C1BD6
_080C1B46:
	ldr r0, _080C1B78 @ =gStringVar1
	adds r1, r4, 0x5
	ldrb r2, [r4, 0xD]
	bl TVShowConvertInternationalString
	ldr r0, _080C1B7C @ =gStringVar2
	ldrh r2, [r4, 0x2]
	movs r1, 0xB
	muls r1, r2
	ldr r2, _080C1B80 @ =gSpeciesNames
	adds r1, r2
	bl StringCopy
	ldr r0, _080C1B84 @ =gStringVar3
	adds r1, r4, 0
	adds r1, 0x10
	ldrb r2, [r4, 0xE]
	bl TVShowConvertInternationalString
	ldrb r0, [r4, 0x4]
	lsrs r0, 4
	adds r0, 0x1
	strb r0, [r6]
	b _080C1BD6
	.align 2, 0
_080C1B78: .4byte gStringVar1
_080C1B7C: .4byte gStringVar2
_080C1B80: .4byte gSpeciesNames
_080C1B84: .4byte gStringVar3
_080C1B88:
	ldr r0, _080C1BB0 @ =gStringVar1
	adds r1, r4, 0x5
	ldrb r2, [r4, 0xD]
	bl TVShowConvertInternationalString
	ldr r0, _080C1BB4 @ =gStringVar2
	ldrh r2, [r4, 0x2]
	movs r1, 0xB
	muls r1, r2
	ldr r2, _080C1BB8 @ =gSpeciesNames
	adds r1, r2
	bl StringCopy
	ldr r0, _080C1BBC @ =gStringVar3
	ldrh r1, [r4, 0x1C]
	bl sub_80EB3FC
	movs r0, 0x4
	strb r0, [r6]
	b _080C1BD6
	.align 2, 0
_080C1BB0: .4byte gStringVar1
_080C1BB4: .4byte gStringVar2
_080C1BB8: .4byte gSpeciesNames
_080C1BBC: .4byte gStringVar3
_080C1BC0:
	ldr r0, _080C1BE8 @ =gStringVar1
	adds r1, r4, 0x5
	ldrb r2, [r4, 0xD]
	bl TVShowConvertInternationalString
	ldr r0, _080C1BEC @ =gStringVar3
	ldrh r1, [r4, 0x1E]
	bl sub_80EB3FC
	bl TVShowDone
_080C1BD6:
	ldr r0, _080C1BF0 @ =gTVFanClubOpinionsTextGroup
	lsls r1, r5, 2
	adds r1, r0
	ldr r0, [r1]
	bl ShowFieldMessage
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_080C1BE8: .4byte gStringVar1
_080C1BEC: .4byte gStringVar3
_080C1BF0: .4byte gTVFanClubOpinionsTextGroup
	thumb_func_end DoTVShowPokemonFanClubOpinions

	thumb_func_start nullsub_22
nullsub_22: @ 80C1BF4
	bx lr
	thumb_func_end nullsub_22

.section .text_80C1C5C

	thumb_func_start DoTVShowInSearchOfTrainers
DoTVShowInSearchOfTrainers: @ 80C1C5C
	push {r4-r7,lr}
	ldr r0, _080C1C7C @ =gScriptResult
	movs r1, 0
	strh r1, [r0]
	ldr r0, _080C1C80 @ =gUnknown_020387E8
	ldrb r7, [r0]
	adds r2, r0, 0
	cmp r7, 0x8
	bls _080C1C70
	b _080C1DF8
_080C1C70:
	lsls r0, r7, 2
	ldr r1, _080C1C84 @ =_080C1C88
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_080C1C7C: .4byte gScriptResult
_080C1C80: .4byte gUnknown_020387E8
_080C1C84: .4byte _080C1C88
	.align 2, 0
_080C1C88:
	.4byte _080C1CAC
	.4byte _080C1CF0
	.4byte _080C1CF6
	.4byte _080C1D44
	.4byte _080C1DB0
	.4byte _080C1DB0
	.4byte _080C1DB0
	.4byte _080C1DB0
	.4byte _080C1DB6
_080C1CAC:
	ldr r0, _080C1CD0 @ =gStringVar1
	ldr r4, _080C1CD4 @ =gSaveBlock1
	ldr r2, _080C1CD8 @ =0x00002b18
	adds r1, r4, r2
	ldrb r1, [r1]
	movs r2, 0
	bl sub_80FBFB4
	ldr r0, _080C1CDC @ =0x00002b19
	adds r4, r0
	ldrb r0, [r4]
	cmp r0, 0x1
	bls _080C1CE4
	ldr r1, _080C1CE0 @ =gUnknown_020387E8
	movs r0, 0x1
	strb r0, [r1]
	b _080C1DF8
	.align 2, 0
_080C1CD0: .4byte gStringVar1
_080C1CD4: .4byte gSaveBlock1
_080C1CD8: .4byte 0x00002b18
_080C1CDC: .4byte 0x00002b19
_080C1CE0: .4byte gUnknown_020387E8
_080C1CE4:
	ldr r1, _080C1CEC @ =gUnknown_020387E8
	movs r0, 0x2
	strb r0, [r1]
	b _080C1DF8
	.align 2, 0
_080C1CEC: .4byte gUnknown_020387E8
_080C1CF0:
	movs r0, 0x2
	strb r0, [r2]
	b _080C1DF8
_080C1CF6:
	ldr r0, _080C1D0C @ =gSaveBlock1
	ldr r1, _080C1D10 @ =0x00002b1a
	adds r0, r1
	ldrb r1, [r0]
	movs r0, 0x1
	ands r0, r1
	cmp r0, 0
	bne _080C1D14
	movs r0, 0x4
	strb r0, [r2]
	b _080C1DF8
	.align 2, 0
_080C1D0C: .4byte gSaveBlock1
_080C1D10: .4byte 0x00002b1a
_080C1D14:
	movs r0, 0x8
	ands r0, r1
	cmp r0, 0
	beq _080C1D22
	movs r0, 0x5
	strb r0, [r2]
	b _080C1DF8
_080C1D22:
	movs r0, 0x4
	ands r0, r1
	cmp r0, 0
	beq _080C1D30
	movs r0, 0x6
	strb r0, [r2]
	b _080C1DF8
_080C1D30:
	movs r0, 0x2
	ands r0, r1
	cmp r0, 0
	beq _080C1D3E
	movs r0, 0x7
	strb r0, [r2]
	b _080C1DF8
_080C1D3E:
	movs r0, 0x3
	strb r0, [r2]
	b _080C1DF8
_080C1D44:
	ldr r0, _080C1D88 @ =gStringVar1
	ldr r4, _080C1D8C @ =gSaveBlock1
	ldr r2, _080C1D90 @ =0x00002b10
	adds r1, r4, r2
	ldrh r1, [r1]
	movs r6, 0xB
	muls r1, r6
	ldr r5, _080C1D94 @ =gSpeciesNames
	adds r1, r5
	bl StringCopy
	ldr r0, _080C1D98 @ =gStringVar2
	ldr r2, _080C1D9C @ =0x00002b14
	adds r1, r4, r2
	ldrh r2, [r1]
	movs r1, 0xD
	muls r1, r2
	ldr r2, _080C1DA0 @ =gMoveNames
	adds r1, r2
	bl StringCopy
	ldr r0, _080C1DA4 @ =gStringVar3
	ldr r1, _080C1DA8 @ =0x00002b12
	adds r4, r1
	ldrh r1, [r4]
	muls r1, r6
	adds r1, r5
	bl StringCopy
	ldr r1, _080C1DAC @ =gUnknown_020387E8
	movs r0, 0x8
	strb r0, [r1]
	b _080C1DF8
	.align 2, 0
_080C1D88: .4byte gStringVar1
_080C1D8C: .4byte gSaveBlock1
_080C1D90: .4byte 0x00002b10
_080C1D94: .4byte gSpeciesNames
_080C1D98: .4byte gStringVar2
_080C1D9C: .4byte 0x00002b14
_080C1DA0: .4byte gMoveNames
_080C1DA4: .4byte gStringVar3
_080C1DA8: .4byte 0x00002b12
_080C1DAC: .4byte gUnknown_020387E8
_080C1DB0:
	movs r0, 0x8
	strb r0, [r2]
	b _080C1DF8
_080C1DB6:
	ldr r0, _080C1E0C @ =gStringVar1
	ldr r4, _080C1E10 @ =gSaveBlock1
	ldr r2, _080C1E14 @ =0x00002b16
	adds r1, r4, r2
	ldrh r1, [r1]
	bl sub_80EB3FC
	ldr r0, _080C1E18 @ =gStringVar2
	ldr r2, _080C1E1C @ =0x00002b10
	adds r1, r4, r2
	ldrh r1, [r1]
	movs r6, 0xB
	muls r1, r6
	ldr r5, _080C1E20 @ =gSpeciesNames
	adds r1, r5
	bl StringCopy
	ldr r0, _080C1E24 @ =gStringVar3
	ldr r1, _080C1E28 @ =0x00002b12
	adds r4, r1
	ldrh r1, [r4]
	muls r1, r6
	adds r1, r5
	bl StringCopy
	ldr r1, _080C1E2C @ =gScriptResult
	movs r0, 0x1
	strh r0, [r1]
	ldr r1, _080C1E30 @ =gUnknown_020387E8
	movs r0, 0
	strb r0, [r1]
	bl TakeTVShowInSearchOfTrainersOffTheAir
_080C1DF8:
	ldr r0, _080C1E34 @ =gTVGabbyAndTyTextGroup
	lsls r1, r7, 2
	adds r1, r0
	ldr r0, [r1]
	bl ShowFieldMessage
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080C1E0C: .4byte gStringVar1
_080C1E10: .4byte gSaveBlock1
_080C1E14: .4byte 0x00002b16
_080C1E18: .4byte gStringVar2
_080C1E1C: .4byte 0x00002b10
_080C1E20: .4byte gSpeciesNames
_080C1E24: .4byte gStringVar3
_080C1E28: .4byte 0x00002b12
_080C1E2C: .4byte gScriptResult
_080C1E30: .4byte gUnknown_020387E8
_080C1E34: .4byte gTVGabbyAndTyTextGroup
	thumb_func_end DoTVShowInSearchOfTrainers

	thumb_func_start DoTVShowPokemonAngler
DoTVShowPokemonAngler: @ 80C1E38
	push {r4,r5,lr}
	ldr r0, _080C1E5C @ =gSpecialVar_0x8004
	ldrh r1, [r0]
	lsls r0, r1, 3
	adds r0, r1
	lsls r0, 2
	ldr r1, _080C1E60 @ =gSaveBlock1 + 0x2738
	adds r4, r0, r1
	ldr r0, _080C1E64 @ =gScriptResult
	movs r1, 0
	strh r1, [r0]
	ldrb r0, [r4, 0x2]
	ldrb r2, [r4, 0x3]
	cmp r0, r2
	bcs _080C1E6C
	ldr r0, _080C1E68 @ =gUnknown_020387E8
	strb r1, [r0]
	b _080C1E74
	.align 2, 0
_080C1E5C: .4byte gSpecialVar_0x8004
_080C1E60: .4byte gSaveBlock1 + 0x2738
_080C1E64: .4byte gScriptResult
_080C1E68: .4byte gUnknown_020387E8
_080C1E6C:
	ldr r1, _080C1E80 @ =gUnknown_020387E8
	movs r0, 0x1
	strb r0, [r1]
	adds r0, r1, 0
_080C1E74:
	ldrb r5, [r0]
	cmp r5, 0
	beq _080C1E84
	cmp r5, 0x1
	beq _080C1EBC
	b _080C1EE4
	.align 2, 0
_080C1E80: .4byte gUnknown_020387E8
_080C1E84:
	ldr r0, _080C1EB0 @ =gStringVar1
	adds r1, r4, 0
	adds r1, 0x13
	ldrb r2, [r4, 0x6]
	bl TVShowConvertInternationalString
	ldr r0, _080C1EB4 @ =gStringVar2
	ldrh r2, [r4, 0x4]
	movs r1, 0xB
	muls r1, r2
	ldr r2, _080C1EB8 @ =gSpeciesNames
	adds r1, r2
	bl StringCopy
	ldrb r1, [r4, 0x3]
	movs r0, 0x2
	bl sub_80BF088
	bl TVShowDone
	b _080C1EE4
	.align 2, 0
_080C1EB0: .4byte gStringVar1
_080C1EB4: .4byte gStringVar2
_080C1EB8: .4byte gSpeciesNames
_080C1EBC:
	ldr r0, _080C1EF8 @ =gStringVar1
	adds r1, r4, 0
	adds r1, 0x13
	ldrb r2, [r4, 0x6]
	bl TVShowConvertInternationalString
	ldr r0, _080C1EFC @ =gStringVar2
	ldrh r2, [r4, 0x4]
	movs r1, 0xB
	muls r1, r2
	ldr r2, _080C1F00 @ =gSpeciesNames
	adds r1, r2
	bl StringCopy
	ldrb r1, [r4, 0x2]
	movs r0, 0x2
	bl sub_80BF088
	bl TVShowDone
_080C1EE4:
	ldr r0, _080C1F04 @ =gTVFishingGuruAdviceTextGroup
	lsls r1, r5, 2
	adds r1, r0
	ldr r0, [r1]
	bl ShowFieldMessage
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080C1EF8: .4byte gStringVar1
_080C1EFC: .4byte gStringVar2
_080C1F00: .4byte gSpeciesNames
_080C1F04: .4byte gTVFishingGuruAdviceTextGroup
	thumb_func_end DoTVShowPokemonAngler

	thumb_func_start DoTVShowTheWorldOfMasters
DoTVShowTheWorldOfMasters: @ 80C1F08
	push {r4-r6,lr}
	ldr r0, _080C1F30 @ =gSpecialVar_0x8004
	ldrh r1, [r0]
	lsls r0, r1, 3
	adds r0, r1
	lsls r0, 2
	ldr r1, _080C1F34 @ =gSaveBlock1 + 0x2738
	adds r4, r0, r1
	ldr r1, _080C1F38 @ =gScriptResult
	movs r0, 0
	strh r0, [r1]
	ldr r6, _080C1F3C @ =gUnknown_020387E8
	ldrb r5, [r6]
	cmp r5, 0x1
	beq _080C1F6C
	cmp r5, 0x1
	bgt _080C1F40
	cmp r5, 0
	beq _080C1F46
	b _080C1FB6
	.align 2, 0
_080C1F30: .4byte gSpecialVar_0x8004
_080C1F34: .4byte gSaveBlock1 + 0x2738
_080C1F38: .4byte gScriptResult
_080C1F3C: .4byte gUnknown_020387E8
_080C1F40:
	cmp r5, 0x2
	beq _080C1F8C
	b _080C1FB6
_080C1F46:
	ldr r0, _080C1F68 @ =gStringVar1
	adds r1, r4, 0
	adds r1, 0x13
	ldrb r2, [r4, 0xB]
	bl TVShowConvertInternationalString
	ldrh r1, [r4, 0x6]
	movs r0, 0x1
	bl sub_80BF088
	ldrh r1, [r4, 0x2]
	movs r0, 0x2
	bl sub_80BF088
	movs r0, 0x1
	strb r0, [r6]
	b _080C1FB6
	.align 2, 0
_080C1F68: .4byte gStringVar1
_080C1F6C:
	ldr r0, _080C1F84 @ =gStringVar1
	ldrh r2, [r4, 0x8]
	movs r1, 0xB
	muls r1, r2
	ldr r2, _080C1F88 @ =gSpeciesNames
	adds r1, r2
	bl StringCopy
	movs r0, 0x2
	strb r0, [r6]
	b _080C1FB6
	.align 2, 0
_080C1F84: .4byte gStringVar1
_080C1F88: .4byte gSpeciesNames
_080C1F8C:
	ldr r0, _080C1FC8 @ =gStringVar1
	adds r1, r4, 0
	adds r1, 0x13
	ldrb r2, [r4, 0xB]
	bl TVShowConvertInternationalString
	ldr r0, _080C1FCC @ =gStringVar2
	ldrb r1, [r4, 0xA]
	movs r2, 0
	bl sub_80FBFB4
	ldr r0, _080C1FD0 @ =gStringVar3
	ldrh r2, [r4, 0x4]
	movs r1, 0xB
	muls r1, r2
	ldr r2, _080C1FD4 @ =gSpeciesNames
	adds r1, r2
	bl StringCopy
	bl TVShowDone
_080C1FB6:
	ldr r0, _080C1FD8 @ =gTVWorldOfMastersTextGroup
	lsls r1, r5, 2
	adds r1, r0
	ldr r0, [r1]
	bl ShowFieldMessage
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_080C1FC8: .4byte gStringVar1
_080C1FCC: .4byte gStringVar2
_080C1FD0: .4byte gStringVar3
_080C1FD4: .4byte gSpeciesNames
_080C1FD8: .4byte gTVWorldOfMastersTextGroup
	thumb_func_end DoTVShowTheWorldOfMasters


	.align 2, 0 @ Don't pad with nop.
