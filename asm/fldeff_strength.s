	.include "constants/gba_constants.inc"
	.include "constants/species_constants.inc"
	.include "asm/macros.inc"

	.syntax unified

	.text

	thumb_func_start SetUpFieldMove_Strength
SetUpFieldMove_Strength: @ 811A99C
	push {lr}
	bl sub_81474C8
	lsls r0, 24
	cmp r0, 0
	beq _0811A9D4
	ldr r1, _0811A9BC @ =gScriptResult
	ldr r0, _0811A9C0 @ =gUnknown_03005CE0
	ldrb r0, [r0]
	strh r0, [r1]
	ldr r1, _0811A9C4 @ =gUnknown_0300485C
	ldr r0, _0811A9C8 @ =sub_808AB90
	str r0, [r1]
	ldr r1, _0811A9CC @ =gUnknown_03005CE4
	ldr r0, _0811A9D0 @ =sub_811AA38
	b _0811A9F8
	.align 2, 0
_0811A9BC: .4byte gScriptResult
_0811A9C0: .4byte gUnknown_03005CE0
_0811A9C4: .4byte gUnknown_0300485C
_0811A9C8: .4byte sub_808AB90
_0811A9CC: .4byte gUnknown_03005CE4
_0811A9D0: .4byte sub_811AA38
_0811A9D4:
	movs r0, 0x57
	bl npc_before_player_of_type
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	beq _0811A9E6
	movs r0, 0
	b _0811A9FC
_0811A9E6:
	ldr r1, _0811AA00 @ =gScriptResult
	ldr r0, _0811AA04 @ =gUnknown_03005CE0
	ldrb r0, [r0]
	strh r0, [r1]
	ldr r1, _0811AA08 @ =gUnknown_0300485C
	ldr r0, _0811AA0C @ =sub_808AB90
	str r0, [r1]
	ldr r1, _0811AA10 @ =gUnknown_03005CE4
	ldr r0, _0811AA14 @ =sub_811AA18
_0811A9F8:
	str r0, [r1]
	movs r0, 0x1
_0811A9FC:
	pop {r1}
	bx r1
	.align 2, 0
_0811AA00: .4byte gScriptResult
_0811AA04: .4byte gUnknown_03005CE0
_0811AA08: .4byte gUnknown_0300485C
_0811AA0C: .4byte sub_808AB90
_0811AA10: .4byte gUnknown_03005CE4
_0811AA14: .4byte sub_811AA18
	thumb_func_end SetUpFieldMove_Strength

	thumb_func_start sub_811AA18
sub_811AA18: @ 811AA18
	push {lr}
	ldr r1, _0811AA2C @ =gUnknown_0202FF84
	ldr r0, _0811AA30 @ =gUnknown_03005CE0
	ldrb r0, [r0]
	str r0, [r1]
	ldr r0, _0811AA34 @ =UseStrengthScript
	bl ScriptContext1_SetupScript
	pop {r0}
	bx r0
	.align 2, 0
_0811AA2C: .4byte gUnknown_0202FF84
_0811AA30: .4byte gUnknown_03005CE0
_0811AA34: .4byte UseStrengthScript
	thumb_func_end sub_811AA18

	thumb_func_start sub_811AA38
sub_811AA38: @ 811AA38
	push {lr}
	ldr r0, _0811AA4C @ =gUnknown_0202FF84
	ldr r1, _0811AA50 @ =gUnknown_03005CE0
	ldrb r1, [r1]
	str r1, [r0]
	movs r0, 0x28
	bl FieldEffectStart
	pop {r0}
	bx r0
	.align 2, 0
_0811AA4C: .4byte gUnknown_0202FF84
_0811AA50: .4byte gUnknown_03005CE0
	thumb_func_end sub_811AA38

	thumb_func_start FldEff_UseStrength
FldEff_UseStrength: @ 811AA54
	push {lr}
	bl oei_task_add
	lsls r0, 24
	lsrs r0, 24
	ldr r2, _0811AA88 @ =gTasks
	lsls r1, r0, 2
	adds r1, r0
	lsls r1, 3
	adds r1, r2
	ldr r2, _0811AA8C @ =sub_811AA9C
	lsrs r0, r2, 16
	strh r0, [r1, 0x18]
	strh r2, [r1, 0x1A]
	ldr r0, _0811AA90 @ =gUnknown_0202FF84
	ldr r1, [r0]
	movs r0, 0x64
	muls r0, r1
	ldr r1, _0811AA94 @ =gPlayerParty
	adds r0, r1
	ldr r1, _0811AA98 @ =gStringVar1
	bl GetMonNickname
	movs r0, 0
	pop {r1}
	bx r1
	.align 2, 0
_0811AA88: .4byte gTasks
_0811AA8C: .4byte sub_811AA9C
_0811AA90: .4byte gUnknown_0202FF84
_0811AA94: .4byte gPlayerParty
_0811AA98: .4byte gStringVar1
	thumb_func_end FldEff_UseStrength

	thumb_func_start sub_811AA9C
sub_811AA9C: @ 811AA9C
	push {lr}
	bl sub_81474C8
	lsls r0, 24
	cmp r0, 0
	beq _0811AAAE
	bl sub_8147514
	b _0811AAB8
_0811AAAE:
	movs r0, 0x28
	bl FieldEffectActiveListRemove
	bl EnableBothScriptContexts
_0811AAB8:
	pop {r0}
	bx r0
	thumb_func_end sub_811AA9C

	.align 2, 0 @ Don't pad with nop.
