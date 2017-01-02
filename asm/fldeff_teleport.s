	.include "constants/gba_constants.inc"
	.include "constants/species_constants.inc"
	.include "asm/macros.inc"

	.syntax unified

	.text

	thumb_func_start SetUpFieldMove_Teleport
SetUpFieldMove_Teleport: @ 814A374
	push {lr}
	ldr r0, _0814A38C @ =gMapHeader
	ldrb r0, [r0, 0x17]
	bl is_light_level_1_2_3_or_6
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	beq _0814A390
	movs r0, 0
	b _0814A39E
	.align 2, 0
_0814A38C: .4byte gMapHeader
_0814A390:
	ldr r1, _0814A3A4 @ =gUnknown_0300485C
	ldr r0, _0814A3A8 @ =sub_808AB90
	str r0, [r1]
	ldr r1, _0814A3AC @ =gUnknown_03005CE4
	ldr r0, _0814A3B0 @ =hm_teleport_run_dp02scr
	str r0, [r1]
	movs r0, 0x1
_0814A39E:
	pop {r1}
	bx r1
	.align 2, 0
_0814A3A4: .4byte gUnknown_0300485C
_0814A3A8: .4byte sub_808AB90
_0814A3AC: .4byte gUnknown_03005CE4
_0814A3B0: .4byte hm_teleport_run_dp02scr
	thumb_func_end SetUpFieldMove_Teleport

	thumb_func_start hm_teleport_run_dp02scr
hm_teleport_run_dp02scr: @ 814A3B4
	push {lr}
	bl new_game
	movs r0, 0x3F
	bl FieldEffectStart
	ldr r0, _0814A3CC @ =gUnknown_0202FF84
	ldr r1, _0814A3D0 @ =gUnknown_03005CE0
	ldrb r1, [r1]
	str r1, [r0]
	pop {r0}
	bx r0
	.align 2, 0
_0814A3CC: .4byte gUnknown_0202FF84
_0814A3D0: .4byte gUnknown_03005CE0
	thumb_func_end hm_teleport_run_dp02scr

	thumb_func_start FldEff_UseTeleport
FldEff_UseTeleport: @ 814A3D4
	push {lr}
	bl oei_task_add
	lsls r0, 24
	lsrs r0, 24
	ldr r2, _0814A3FC @ =gTasks
	lsls r1, r0, 2
	adds r1, r0
	lsls r1, 3
	adds r1, r2
	ldr r2, _0814A400 @ =sub_814A404
	lsrs r0, r2, 16
	strh r0, [r1, 0x18]
	strh r2, [r1, 0x1A]
	movs r0, 0x1
	bl SetPlayerAvatarTransitionFlags
	movs r0, 0
	pop {r1}
	bx r1
	.align 2, 0
_0814A3FC: .4byte gTasks
_0814A400: .4byte sub_814A404
	thumb_func_end FldEff_UseTeleport

	thumb_func_start sub_814A404
sub_814A404: @ 814A404
	push {lr}
	movs r0, 0x3F
	bl FieldEffectActiveListRemove
	bl sub_8087BA8
	pop {r0}
	bx r0
	thumb_func_end sub_814A404

	.align 2, 0 @ Don't pad with nop.
