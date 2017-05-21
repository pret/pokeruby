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
	.align 2, 0
	thumb_func_end sub_80BDD18

    .section .text_80BE8EC

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

.section .dotvshow

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

	.align 2, 0 @ Don't pad with nop.
