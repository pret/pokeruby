LittlerootTown_MaysHouse_2F_MapScripts:: @ 8152A50
	map_script MAP_SCRIPT_ON_TRANSITION, LittlerootTown_MaysHouse_2F_OnTransition
	map_script MAP_SCRIPT_ON_WARP_INTO_MAP_TABLE, LittlerootTown_MaysHouse_2F_OnWarp
	.byte 0

LittlerootTown_MaysHouse_2F_OnTransition:: @ 8152A5B
	call_if_unset FLAG_DEFEATED_RIVAL_ROUTE103, LittlerootTown_MaysHouse_2F_EventScript_RivalCheckingNotebook
	compare VAR_LITTLEROOT_INTRO_STATE, 4
	call_if_eq LittlerootTown_MaysHouse_2F_EventScript_1B6950
	call SecretBase_EventScript_SetDecorationFlags
	setvar VAR_SECRET_BASE_INITIALIZED, 0
	end

LittlerootTown_MaysHouse_2F_EventScript_RivalCheckingNotebook:: @ 8152A7A
	setobjectxyperm 1, 7, 2
	setobjectmovementtype 1, 7
	return

LittlerootTown_MaysHouse_2F_OnWarp:: @ 8152A86
	map_script_2 VAR_SECRET_BASE_INITIALIZED, 0, LittlerootTown_MaysHouse_2F_EventScript_CheckInitDecor
	.2byte 0

LittlerootTown_MaysHouse_2F_EventScript_CheckInitDecor:: @ 8152A90
	checkplayergender
	compare VAR_RESULT, 1
	goto_if_eq SecretBase_EventScript_InitDecorations
	end

LittlerootTown_BrendansHouse_2F_EventScript_152A9D:: @ 8152A9D
LittlerootTown_MaysHouse_2F_EventScript_152A9D:: @ 8152A9D
	lockall
	goto_if_set FLAG_MET_RIVAL_LILYCOVE, RivalsHouse_2F_EventScript_RivalPostLilycove
	checkplayergender
	compare VAR_RESULT, 0
	call_if_eq RivalsHouse_2F_EventScript_May
	compare VAR_RESULT, 1
	call_if_eq RivalsHouse_2F_EventScript_Brendan
	playse SE_EXIT
	removeobject VAR_LAST_TALKED
	setvar VAR_LITTLEROOT_RIVAL_STATE, 3
	setvar VAR_LITTLEROOT_STATE, 1
	savebgm 0
	fadedefaultbgm
	releaseall
	end

RivalsHouse_2F_EventScript_May:: @ 8152AD4
	msgbox RivalsHouse_2F_Text_MayGettingReady, MSGBOX_DEFAULT
	playbgm MUS_ENCOUNTER_MAY, TRUE
	applymovement VAR_LAST_TALKED, Common_Movement_FacePlayer
	waitmovement 0
	applymovement VAR_LAST_TALKED, Common_Movement_ExclamationMark
	waitmovement 0
	applymovement VAR_LAST_TALKED, Common_Movement_Delay48
	waitmovement 0
	msgbox RivalsHouse_2F_Text_MayWhoAreYou, MSGBOX_DEFAULT
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

RivalsHouse_2F_EventScript_Brendan:: @ 8152B4A
	msgbox RivalsHouse_2F_Text_BrendanGettingReady, MSGBOX_DEFAULT
	playbgm MUS_ENCOUNTER_BRENDAN, TRUE
	applymovement VAR_LAST_TALKED, Common_Movement_FacePlayer
	waitmovement 0
	applymovement VAR_LAST_TALKED, Common_Movement_ExclamationMark
	waitmovement 0
	applymovement VAR_LAST_TALKED, Common_Movement_Delay48
	waitmovement 0
	msgbox RivalsHouse_2F_Text_BrendanWhoAreYou, MSGBOX_DEFAULT
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

RivalsHouse_2F_EventScript_RivalPostLilycove:: @ 8152BB5
	applymovement VAR_LAST_TALKED, Common_Movement_FacePlayer
	waitmovement 0
	checkplayergender
	compare VAR_RESULT, 0
	call_if_eq RivalsHouse_2F_EventScript_MayPostLilycove
	compare VAR_RESULT, 1
	call_if_eq RivalsHouse_2F_EventScript_BrendanPostLilycove
	setflag FLAG_MET_RIVAL_IN_HOUSE_AFTER_LILYCOVE
	releaseall
	end

RivalsHouse_2F_EventScript_MayPostLilycove:: @ 8152BDB
	goto_if_set FLAG_MET_RIVAL_IN_HOUSE_AFTER_LILYCOVE, RivalsHouse_2F_EventScript_MayWhereShouldIGoNext
	msgbox RivalsHouse_2F_Text_MayJustCheckingMyPokedex, MSGBOX_DEFAULT
	return

RivalsHouse_2F_EventScript_BrendanPostLilycove:: @ 8152BED
	goto_if_set FLAG_MET_RIVAL_IN_HOUSE_AFTER_LILYCOVE, RivalsHouse_2F_EventScript_BrendanWhereShouldIGoNext
	msgbox RivalsHouse_2F_Text_BrendanJustCheckingMyPokedex, MSGBOX_DEFAULT
	return

RivalsHouse_2F_EventScript_MayWhereShouldIGoNext:: @ 8152BFF
	msgbox RivalsHouse_2F_Text_MayWhereShouldIGoNext, MSGBOX_DEFAULT
	return

RivalsHouse_2F_EventScript_BrendanWhereShouldIGoNext:: @ 8152C08
	msgbox RivalsHouse_2F_Text_BrendanWhereShouldIGoNext, MSGBOX_DEFAULT
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

LittlerootTown_MaysHouse_2F_EventScript_PC:: @ 8152C39
	lockall
	checkplayergender
	compare VAR_RESULT, 0
	goto_if_eq LittlerootTown_MaysHouse_2F_EventScript_CheckRivalsPC
	compare VAR_RESULT, 1
	goto_if_eq LittlerootTown_MaysHouse_2F_EventScript_CheckPlayersPC
	end

LittlerootTown_MaysHouse_2F_EventScript_CheckRivalsPC:: @ 8152C52
	msgbox gText_PokemonTrainerSchoolEmail, MSGBOX_DEFAULT
	releaseall
	end

LittlerootTown_MaysHouse_2F_EventScript_CheckPlayersPC:: @ 8152C5C
	setvar VAR_0x8004, 2
	special DoPCTurnOnEffect
	playse SE_PC_ON
	msgbox gText_PlayerHouseBootPC, MSGBOX_DEFAULT
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
