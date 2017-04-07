	.include "constants/gba_constants.inc"
	.include "constants/species_constants.inc"
	.include "asm/macros.inc"

	.syntax unified

	.text
	
	thumb_func_start sub_810D280
sub_810D280: @ 810D280
	push {r4,lr}
	ldr r0, _0810D2A4 @ =0x00004024
	bl VarGet
	adds r4, r0, 0
	lsls r4, 16
	lsrs r4, 16
	ldr r0, _0810D2A8 @ =0x00004025
	bl VarGet
	lsls r0, 16
	lsrs r0, 16
	lsls r4, 16
	orrs r4, r0
	adds r0, r4, 0
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_0810D2A4: .4byte 0x00004024
_0810D2A8: .4byte 0x00004025
	thumb_func_end sub_810D280

	thumb_func_start sub_810D2AC
sub_810D2AC: @ 810D2AC
	push {r4,lr}
	adds r4, r0, 0
	ldr r0, _0810D2CC @ =0x00004024
	lsrs r1, r4, 16
	bl VarSet
	ldr r0, _0810D2D0 @ =0x00004025
	lsls r4, 16
	lsrs r4, 16
	adds r1, r4, 0
	bl VarSet
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0810D2CC: .4byte 0x00004024
_0810D2D0: .4byte 0x00004025
	thumb_func_end sub_810D2AC

	thumb_func_start unref_sub_810D2D4
unref_sub_810D2D4: @ 810D2D4
	push {r4,lr}
	bl Random
	adds r4, r0, 0
	bl Random
	lsls r4, 16
	lsls r0, 16
	lsrs r0, 16
	orrs r4, r0
	adds r0, r4, 0
	bl sub_810D2AC
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end unref_sub_810D2D4

	thumb_func_start sub_810D2F4
sub_810D2F4: @ 810D2F4
	push {r4,lr}
	lsls r0, 16
	lsrs r4, r0, 16
	bl sub_810D280
	adds r1, r0, 0
	cmp r4, 0
	beq _0810D318
	ldr r3, _0810D324 @ =0x41c64e6d
	ldr r2, _0810D328 @ =0x00003039
_0810D308:
	adds r0, r1, 0
	muls r0, r3
	adds r1, r0, r2
	subs r0, r4, 0x1
	lsls r0, 16
	lsrs r4, r0, 16
	cmp r4, 0
	bne _0810D308
_0810D318:
	adds r0, r1, 0
	bl sub_810D2AC
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0810D324: .4byte 0x41c64e6d
_0810D328: .4byte 0x00003039
	thumb_func_end sub_810D2F4

	thumb_func_start sub_810D32C
sub_810D32C: @ 810D32C
	push {r4-r6,lr}
	bl sub_810D280
	lsrs r6, r0, 16
	movs r5, 0
_0810D336:
	movs r0, 0x64
	adds r1, r5, 0
	muls r1, r0
	ldr r0, _0810D360 @ =gPlayerParty
	adds r4, r1, r0
	adds r0, r4, 0
	movs r1, 0xB
	bl GetMonData
	cmp r0, 0
	beq _0810D368
	adds r0, r4, 0
	movs r1, 0
	bl GetMonData
	ldr r1, _0810D364 @ =0x0000ffff
	ands r1, r0
	cmp r1, r6
	bne _0810D368
	movs r0, 0x1
	b _0810D370
	.align 2, 0
_0810D360: .4byte gPlayerParty
_0810D364: .4byte 0x0000ffff
_0810D368:
	adds r5, 0x1
	cmp r5, 0x5
	ble _0810D336
	movs r0, 0
_0810D370:
	pop {r4-r6}
	pop {r1}
	bx r1
	thumb_func_end sub_810D32C

	thumb_func_start UpdateShoalTideFlag
UpdateShoalTideFlag: @ 810D378
	push {lr}
	bl get_map_light_from_warp0
	lsls r0, 24
	lsrs r0, 24
	bl is_light_level_1_2_3_5_or_6
	lsls r0, 24
	cmp r0, 0
	beq _0810D3BE
	bl RtcCalcLocalTime
	ldr r1, _0810D3AC @ =gUnknown_083F8340
	ldr r0, _0810D3B0 @ =gLocalTime
	ldrb r0, [r0, 0x2]
	lsls r0, 24
	asrs r0, 24
	adds r0, r1
	ldrb r0, [r0]
	cmp r0, 0
	beq _0810D3B8
	ldr r0, _0810D3B4 @ =0x0000083a
	bl FlagSet
	b _0810D3BE
	.align 2, 0
_0810D3AC: .4byte gUnknown_083F8340
_0810D3B0: .4byte gLocalTime
_0810D3B4: .4byte 0x0000083a
_0810D3B8:
	ldr r0, _0810D3C4 @ =0x0000083a
	bl FlagReset
_0810D3BE:
	pop {r0}
	bx r0
	.align 2, 0
_0810D3C4: .4byte 0x0000083a
	thumb_func_end UpdateShoalTideFlag

	thumb_func_start sub_810D3C8
sub_810D3C8: @ 810D3C8
	push {r4,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	bl sub_807DDFC
	lsls r0, 24
	cmp r0, 0
	beq _0810D3E2
	bl EnableBothScriptContexts
	adds r0, r4, 0
	bl DestroyTask
_0810D3E2:
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end sub_810D3C8

	thumb_func_start sub_810D3E8
sub_810D3E8: @ 810D3E8
	push {lr}
	ldr r0, _0810D3F8 @ =sub_810D3C8
	movs r1, 0x50
	bl CreateTask
	pop {r0}
	bx r0
	.align 2, 0
_0810D3F8: .4byte sub_810D3C8
	thumb_func_end sub_810D3E8

	thumb_func_start sub_810D3FC
sub_810D3FC: @ 810D3FC
	push {lr}
	ldr r0, _0810D40C @ =0x00004049
	bl GetVarPointer
	movs r1, 0
	strh r1, [r0]
	pop {r0}
	bx r0
	.align 2, 0
_0810D40C: .4byte 0x00004049
	thumb_func_end sub_810D3FC

	thumb_func_start UpdateBirchState
UpdateBirchState: @ 810D410
	push {r4,r5,lr}
	adds r4, r0, 0
	lsls r4, 16
	lsrs r4, 16
	ldr r0, _0810D438 @ =0x00004049
	bl GetVarPointer
	adds r5, r0, 0
	ldrh r0, [r5]
	adds r4, r0
	strh r4, [r5]
	ldrh r0, [r5]
	movs r1, 0x7
	bl __umodsi3
	strh r0, [r5]
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_0810D438: .4byte 0x00004049
	thumb_func_end UpdateBirchState

	.align 2, 0 @ Don't pad with nop.
