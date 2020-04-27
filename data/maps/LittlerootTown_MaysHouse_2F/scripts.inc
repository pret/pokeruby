LittlerootTown_MaysHouse_2F_MapScripts:: @ 8152A50
	map_script MAP_SCRIPT_ON_TRANSITION, LittlerootTown_MaysHouse_2F_MapScript1_152A5B
	map_script MAP_SCRIPT_ON_WARP_INTO_MAP_TABLE, LittlerootTown_MaysHouse_2F_MapScript2_152A86
	.byte 0

LittlerootTown_MaysHouse_2F_MapScript1_152A5B:: @ 8152A5B
	call_if_unset FLAG_DEFEATED_RIVAL_ROUTE103, LittlerootTown_MaysHouse_2F_EventScript_152A7A
	compare VAR_LITTLEROOT_INTRO_STATE, 4
	call_if_eq LittlerootTown_MaysHouse_2F_EventScript_1B6950
	call SecretBase_EventScript_SetDecorationFlags
	setvar VAR_SECRET_BASE_INITIALIZED, 0
	end

LittlerootTown_MaysHouse_2F_EventScript_152A7A:: @ 8152A7A
	setobjectxyperm 1, 7, 2
	setobjectmovementtype 1, 7
	return

LittlerootTown_MaysHouse_2F_MapScript2_152A86:: @ 8152A86
	map_script_2 VAR_SECRET_BASE_INITIALIZED, 0, LittlerootTown_MaysHouse_2F_EventScript_152A90
	.2byte 0

LittlerootTown_MaysHouse_2F_EventScript_152A90:: @ 8152A90
	checkplayergender
	compare VAR_RESULT, 1
	goto_if_eq SecretBase_EventScript_InitDecorations
	end

LittlerootTown_BrendansHouse_2F_EventScript_152A9D:: @ 8152A9D
LittlerootTown_MaysHouse_2F_EventScript_152A9D:: @ 8152A9D
	lockall
	goto_if_set FLAG_MET_RIVAL_LILYCOVE, LittlerootTown_BrendansHouse_2F_EventScript_152BB5
	checkplayergender
	compare VAR_RESULT, 0
	call_if_eq LittlerootTown_BrendansHouse_2F_EventScript_152AD4
	compare VAR_RESULT, 1
	call_if_eq LittlerootTown_BrendansHouse_2F_EventScript_152B4A
	playse SE_KAIDAN
	removeobject VAR_LAST_TALKED
	setvar VAR_LITTLEROOT_RIVAL_STATE, 3
	setvar VAR_LITTLEROOT_STATE, 1
	savebgm 0
	fadedefaultbgm
	releaseall
	end

LittlerootTown_BrendansHouse_2F_EventScript_152AD4:: @ 8152AD4
	msgbox LittlerootTown_BrendansHouse_2F_Text_17337E, MSGBOX_DEFAULT
	playbgm MUS_GIRL_SUP, TRUE
	applymovement VAR_LAST_TALKED, LittlerootTown_BrendansHouse_2F_Movement_1A0839
	waitmovement 0
	applymovement VAR_LAST_TALKED, LittlerootTown_BrendansHouse_2F_Movement_1A0833
	waitmovement 0
	applymovement VAR_LAST_TALKED, LittlerootTown_BrendansHouse_2F_Movement_1A0835
	waitmovement 0
	msgbox LittlerootTown_BrendansHouse_2F_Text_1733AF, MSGBOX_DEFAULT
	closemessage
	compare VAR_FACING, 4
	call_if_eq LittlerootTown_BrendansHouse_2F_EventScript_152B29
	compare VAR_FACING, 2
	call_if_eq LittlerootTown_BrendansHouse_2F_EventScript_152B34
	compare VAR_FACING, 3
	call_if_eq LittlerootTown_BrendansHouse_2F_EventScript_152B3F
	return

LittlerootTown_BrendansHouse_2F_EventScript_152B29:: @ 8152B29
	applymovement VAR_LAST_TALKED, LittlerootTown_BrendansHouse_2F_Movement_152C11
	waitmovement 0
	return

LittlerootTown_BrendansHouse_2F_EventScript_152B34:: @ 8152B34
	applymovement VAR_LAST_TALKED, LittlerootTown_BrendansHouse_2F_Movement_152C1C
	waitmovement 0
	return

LittlerootTown_BrendansHouse_2F_EventScript_152B3F:: @ 8152B3F
	applymovement VAR_LAST_TALKED, LittlerootTown_BrendansHouse_2F_Movement_152C1C
	waitmovement 0
	return

LittlerootTown_BrendansHouse_2F_EventScript_152B4A:: @ 8152B4A
	msgbox LittlerootTown_BrendansHouse_2F_Text_1735C9, MSGBOX_DEFAULT
	playbgm MUS_BOY_SUP, TRUE
	applymovement VAR_LAST_TALKED, LittlerootTown_BrendansHouse_2F_Movement_1A0839
	waitmovement 0
	applymovement VAR_LAST_TALKED, LittlerootTown_BrendansHouse_2F_Movement_1A0833
	waitmovement 0
	applymovement VAR_LAST_TALKED, LittlerootTown_BrendansHouse_2F_Movement_1A0835
	waitmovement 0
	msgbox LittlerootTown_BrendansHouse_2F_Text_1735FC, MSGBOX_DEFAULT
	closemessage
	compare VAR_FACING, 4
	call_if_eq LittlerootTown_BrendansHouse_2F_EventScript_152B9F
	compare VAR_FACING, 2
	call_if_eq LittlerootTown_BrendansHouse_2F_EventScript_152B9F
	compare VAR_FACING, 3
	call_if_eq LittlerootTown_BrendansHouse_2F_EventScript_152BAA
	return

LittlerootTown_BrendansHouse_2F_EventScript_152B9F:: @ 8152B9F
	applymovement VAR_LAST_TALKED, LittlerootTown_BrendansHouse_2F_Movement_152C30
	waitmovement 0
	return

LittlerootTown_BrendansHouse_2F_EventScript_152BAA:: @ 8152BAA
	applymovement VAR_LAST_TALKED, LittlerootTown_BrendansHouse_2F_Movement_152C25
	waitmovement 0
	return

LittlerootTown_BrendansHouse_2F_EventScript_152BB5:: @ 8152BB5
	applymovement VAR_LAST_TALKED, LittlerootTown_BrendansHouse_2F_Movement_1A0839
	waitmovement 0
	checkplayergender
	compare VAR_RESULT, 0
	call_if_eq LittlerootTown_BrendansHouse_2F_EventScript_152BDB
	compare VAR_RESULT, 1
	call_if_eq LittlerootTown_BrendansHouse_2F_EventScript_152BED
	setflag FLAG_MET_RIVAL_IN_HOUSE_AFTER_LILYCOVE
	releaseall
	end

LittlerootTown_BrendansHouse_2F_EventScript_152BDB:: @ 8152BDB
	goto_if_set FLAG_MET_RIVAL_IN_HOUSE_AFTER_LILYCOVE, LittlerootTown_BrendansHouse_2F_EventScript_152BFF
	msgbox LittlerootTown_BrendansHouse_2F_Text_1737AE, MSGBOX_DEFAULT
	return

LittlerootTown_BrendansHouse_2F_EventScript_152BED:: @ 8152BED
	goto_if_set FLAG_MET_RIVAL_IN_HOUSE_AFTER_LILYCOVE, LittlerootTown_BrendansHouse_2F_EventScript_152C08
	msgbox LittlerootTown_BrendansHouse_2F_Text_1738F2, MSGBOX_DEFAULT
	return

LittlerootTown_BrendansHouse_2F_EventScript_152BFF:: @ 8152BFF
	msgbox LittlerootTown_BrendansHouse_2F_Text_173883, MSGBOX_DEFAULT
	return

LittlerootTown_BrendansHouse_2F_EventScript_152C08:: @ 8152C08
	msgbox LittlerootTown_BrendansHouse_2F_Text_1739CC, MSGBOX_DEFAULT
	return

LittlerootTown_BrendansHouse_2F_Movement_152C11:: @ 8152C11
	walk_down
	walk_left
	walk_left
	walk_left
	walk_left
	walk_left
	walk_left
	walk_up
	walk_up
	delay_8
	step_end

LittlerootTown_BrendansHouse_2F_Movement_152C1C:: @ 8152C1C
	walk_left
	walk_left
	walk_left
	walk_left
	walk_left
	walk_left
	walk_up
	delay_8
	step_end

LittlerootTown_BrendansHouse_2F_Movement_152C25:: @ 8152C25
	walk_down
	walk_right
	walk_right
	walk_right
	walk_right
	walk_right
	walk_right
	walk_up
	walk_up
	delay_8
	step_end

LittlerootTown_BrendansHouse_2F_Movement_152C30:: @ 8152C30
	walk_right
	walk_right
	walk_right
	walk_right
	walk_right
	walk_right
	walk_up
	delay_8
	step_end

gUnknown_08152C39:: @ 8152C39

LittlerootTown_MaysHouse_2F_EventScript_152C39:: @ 8152C39
	lockall
	checkplayergender
	compare VAR_RESULT, 0
	goto_if_eq LittlerootTown_MaysHouse_2F_EventScript_152C52
	compare VAR_RESULT, 1
	goto_if_eq LittlerootTown_MaysHouse_2F_EventScript_152C5C
	end

LittlerootTown_MaysHouse_2F_EventScript_152C52:: @ 8152C52
	msgbox LittlerootTown_MaysHouse_2F_Text_1A100C, MSGBOX_DEFAULT
	releaseall
	end

LittlerootTown_MaysHouse_2F_EventScript_152C5C:: @ 8152C5C
	setvar VAR_0x8004, 2
	special DoPCTurnOnEffect
	playse SE_PC_ON
	msgbox LittlerootTown_MaysHouse_2F_Text_1A10D6, MSGBOX_DEFAULT
	special BedroomPC
	waitstate
	releaseall
	end

gMayHouse_TurnPCOff:: @ 8152C75
	setvar VAR_0x8004, 2
	playse SE_PC_OFF
	special DoPCTurnOffEffect
	releaseall
	end
