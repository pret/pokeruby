LittlerootTown_MaysHouse_2F_MapScripts:: @ 8152A50
	map_script 3, LittlerootTown_MaysHouse_2F_MapScript1_152A5B
	map_script 4, LittlerootTown_MaysHouse_2F_MapScript2_152A86
	.byte 0

LittlerootTown_MaysHouse_2F_MapScript1_152A5B:: @ 8152A5B
	checkflag FLAG_DEFEATED_RIVAL_ROUTE103
	call_if 0, LittlerootTown_MaysHouse_2F_EventScript_152A7A
	compare VAR_LITTLEROOT_INTRO_STATE, 4
	call_if 1, LittlerootTown_MaysHouse_2F_EventScript_1B6950
	call LittlerootTown_MaysHouse_2F_EventScript_1A2F3D
	setvar VAR_0x4089, 0
	end

LittlerootTown_MaysHouse_2F_EventScript_152A7A:: @ 8152A7A
	setobjectxyperm 1, 7, 2
	setobjectmovementtype 1, 7
	return

LittlerootTown_MaysHouse_2F_MapScript2_152A86:: @ 8152A86
	map_script_2 VAR_0x4089, 0, LittlerootTown_MaysHouse_2F_EventScript_152A90
	.2byte 0

LittlerootTown_MaysHouse_2F_EventScript_152A90:: @ 8152A90
	checkplayergender
	compare RESULT, 1
	goto_if_eq LittlerootTown_MaysHouse_2F_EventScript_1A2F68
	end

LittlerootTown_BrendansHouse_2F_EventScript_152A9D:: @ 8152A9D
LittlerootTown_MaysHouse_2F_EventScript_152A9D:: @ 8152A9D
	lockall
	checkflag FLAG_MET_RIVAL_LILYCOVE
	goto_if_eq LittlerootTown_BrendansHouse_2F_EventScript_152BB5
	checkplayergender
	compare RESULT, 0
	call_if 1, LittlerootTown_BrendansHouse_2F_EventScript_152AD4
	compare RESULT, 1
	call_if 1, LittlerootTown_BrendansHouse_2F_EventScript_152B4A
	playse 9
	removeobject LAST_TALKED
	setvar VAR_LITTLEROOT_RIVAL_STATE, 3
	setvar VAR_LITTLEROOT_STATE, 1
	savebgm 0
	fadedefaultbgm
	releaseall
	end

LittlerootTown_BrendansHouse_2F_EventScript_152AD4:: @ 8152AD4
	msgbox LittlerootTown_BrendansHouse_2F_Text_17337E, 4
	playbgm 415, 1
	applymovement LAST_TALKED, LittlerootTown_BrendansHouse_2F_Movement_1A0839
	waitmovement 0
	applymovement LAST_TALKED, LittlerootTown_BrendansHouse_2F_Movement_1A0833
	waitmovement 0
	applymovement LAST_TALKED, LittlerootTown_BrendansHouse_2F_Movement_1A0835
	waitmovement 0
	msgbox LittlerootTown_BrendansHouse_2F_Text_1733AF, 4
	closemessage
	compare FACING, 4
	call_if 1, LittlerootTown_BrendansHouse_2F_EventScript_152B29
	compare FACING, 2
	call_if 1, LittlerootTown_BrendansHouse_2F_EventScript_152B34
	compare FACING, 3
	call_if 1, LittlerootTown_BrendansHouse_2F_EventScript_152B3F
	return

LittlerootTown_BrendansHouse_2F_EventScript_152B29:: @ 8152B29
	applymovement LAST_TALKED, LittlerootTown_BrendansHouse_2F_Movement_152C11
	waitmovement 0
	return

LittlerootTown_BrendansHouse_2F_EventScript_152B34:: @ 8152B34
	applymovement LAST_TALKED, LittlerootTown_BrendansHouse_2F_Movement_152C1C
	waitmovement 0
	return

LittlerootTown_BrendansHouse_2F_EventScript_152B3F:: @ 8152B3F
	applymovement LAST_TALKED, LittlerootTown_BrendansHouse_2F_Movement_152C1C
	waitmovement 0
	return

LittlerootTown_BrendansHouse_2F_EventScript_152B4A:: @ 8152B4A
	msgbox LittlerootTown_BrendansHouse_2F_Text_1735C9, 4
	playbgm 421, 1
	applymovement LAST_TALKED, LittlerootTown_BrendansHouse_2F_Movement_1A0839
	waitmovement 0
	applymovement LAST_TALKED, LittlerootTown_BrendansHouse_2F_Movement_1A0833
	waitmovement 0
	applymovement LAST_TALKED, LittlerootTown_BrendansHouse_2F_Movement_1A0835
	waitmovement 0
	msgbox LittlerootTown_BrendansHouse_2F_Text_1735FC, 4
	closemessage
	compare FACING, 4
	call_if 1, LittlerootTown_BrendansHouse_2F_EventScript_152B9F
	compare FACING, 2
	call_if 1, LittlerootTown_BrendansHouse_2F_EventScript_152B9F
	compare FACING, 3
	call_if 1, LittlerootTown_BrendansHouse_2F_EventScript_152BAA
	return

LittlerootTown_BrendansHouse_2F_EventScript_152B9F:: @ 8152B9F
	applymovement LAST_TALKED, LittlerootTown_BrendansHouse_2F_Movement_152C30
	waitmovement 0
	return

LittlerootTown_BrendansHouse_2F_EventScript_152BAA:: @ 8152BAA
	applymovement LAST_TALKED, LittlerootTown_BrendansHouse_2F_Movement_152C25
	waitmovement 0
	return

LittlerootTown_BrendansHouse_2F_EventScript_152BB5:: @ 8152BB5
	applymovement LAST_TALKED, LittlerootTown_BrendansHouse_2F_Movement_1A0839
	waitmovement 0
	checkplayergender
	compare RESULT, 0
	call_if 1, LittlerootTown_BrendansHouse_2F_EventScript_152BDB
	compare RESULT, 1
	call_if 1, LittlerootTown_BrendansHouse_2F_EventScript_152BED
	setflag FLAG_MET_RIVAL_IN_HOUSE_AFTER_LILYCOVE
	releaseall
	end

LittlerootTown_BrendansHouse_2F_EventScript_152BDB:: @ 8152BDB
	checkflag FLAG_MET_RIVAL_IN_HOUSE_AFTER_LILYCOVE
	goto_if_eq LittlerootTown_BrendansHouse_2F_EventScript_152BFF
	msgbox LittlerootTown_BrendansHouse_2F_Text_1737AE, 4
	return

LittlerootTown_BrendansHouse_2F_EventScript_152BED:: @ 8152BED
	checkflag FLAG_MET_RIVAL_IN_HOUSE_AFTER_LILYCOVE
	goto_if_eq LittlerootTown_BrendansHouse_2F_EventScript_152C08
	msgbox LittlerootTown_BrendansHouse_2F_Text_1738F2, 4
	return

LittlerootTown_BrendansHouse_2F_EventScript_152BFF:: @ 8152BFF
	msgbox LittlerootTown_BrendansHouse_2F_Text_173883, 4
	return

LittlerootTown_BrendansHouse_2F_EventScript_152C08:: @ 8152C08
	msgbox LittlerootTown_BrendansHouse_2F_Text_1739CC, 4
	return

LittlerootTown_BrendansHouse_2F_Movement_152C11:: @ 8152C11
	step_down
	step_left
	step_left
	step_left
	step_left
	step_left
	step_left
	step_up
	step_up
	step_13
	step_end

LittlerootTown_BrendansHouse_2F_Movement_152C1C:: @ 8152C1C
	step_left
	step_left
	step_left
	step_left
	step_left
	step_left
	step_up
	step_13
	step_end

LittlerootTown_BrendansHouse_2F_Movement_152C25:: @ 8152C25
	step_down
	step_right
	step_right
	step_right
	step_right
	step_right
	step_right
	step_up
	step_up
	step_13
	step_end

LittlerootTown_BrendansHouse_2F_Movement_152C30:: @ 8152C30
	step_right
	step_right
	step_right
	step_right
	step_right
	step_right
	step_up
	step_13
	step_end

gUnknown_08152C39:: @ 8152C39

LittlerootTown_MaysHouse_2F_EventScript_152C39:: @ 8152C39
	lockall
	checkplayergender
	compare RESULT, 0
	goto_if_eq LittlerootTown_MaysHouse_2F_EventScript_152C52
	compare RESULT, 1
	goto_if_eq LittlerootTown_MaysHouse_2F_EventScript_152C5C
	end

LittlerootTown_MaysHouse_2F_EventScript_152C52:: @ 8152C52
	msgbox LittlerootTown_MaysHouse_2F_Text_1A100C, 4
	releaseall
	end

LittlerootTown_MaysHouse_2F_EventScript_152C5C:: @ 8152C5C
	setvar 0x8004, 2
	special DoPCTurnOnEffect
	playse SE_PC_ON
	msgbox LittlerootTown_MaysHouse_2F_Text_1A10D6, 4
	special BedroomPC
	waitstate
	releaseall
	end

gMayHouse_TurnPCOff:: @ 8152C75
	setvar 0x8004, 2
	playse SE_PC_OFF
	special DoPCTurnOffEffect
	releaseall
	end
