EverGrandeCity_HallOfFame_MapScripts:: @ 815BB84
	map_script MAP_SCRIPT_ON_FRAME_TABLE, EverGrandeCity_HallOfFame_OnFrame
	map_script MAP_SCRIPT_ON_WARP_INTO_MAP_TABLE, EverGrandeCity_HallOfFame_OnWarp
	.byte 0

EverGrandeCity_HallOfFame_OnWarp:: @ 815BB8F
	map_script_2 VAR_TEMP_1, 0, EverGrandeCity_HallOfFame_EventScript_TurnPlayerNorth
	.2byte 0

EverGrandeCity_HallOfFame_EventScript_TurnPlayerNorth:: @ 815BB99
	turnobject OBJ_EVENT_ID_PLAYER, 2
	end

EverGrandeCity_HallOfFame_OnFrame:: @ 815BB9E
	map_script_2 VAR_TEMP_1, 0, EverGrandeCity_HallOfFame_EventScript_EnterHallOfFame
	.2byte 0

EverGrandeCity_HallOfFame_EventScript_EnterHallOfFame:: @ 815BBA8
	lockall
	applymovement 1, EverGrandeCity_HallOfFame_Movement_WalkIntoHallOfFame1
	applymovement OBJ_EVENT_ID_PLAYER, EverGrandeCity_HallOfFame_Movement_WalkIntoHallOfFame1
	waitmovement 0
	applymovement 1, Common_Movement_WalkInPlaceFastestRight
	applymovement OBJ_EVENT_ID_PLAYER, Common_Movement_WalkInPlaceFastestLeft
	waitmovement 0
	msgbox EverGrandeCity_HallOfFame_Text_HereWeHonorLeagueChampions, MSGBOX_DEFAULT
	closemessage
	applymovement 1, EverGrandeCity_HallOfFame_Movement_WalkIntoHallOfFame2
	applymovement OBJ_EVENT_ID_PLAYER, EverGrandeCity_HallOfFame_Movement_WalkIntoHallOfFame2
	waitmovement 0
	delay 20
	applymovement 1, Common_Movement_WalkInPlaceFastestRight
	applymovement OBJ_EVENT_ID_PLAYER, Common_Movement_WalkInPlaceFastestLeft
	waitmovement 0
	msgbox EverGrandeCity_HallOfFame_Text_LetsRecordYouAndYourPartnersNames, MSGBOX_DEFAULT
	closemessage
	applymovement 1, Common_Movement_WalkInPlaceFastestUp
	applymovement OBJ_EVENT_ID_PLAYER, Common_Movement_WalkInPlaceFastestUp
	waitmovement 0
	delay 20
	dofieldeffect FLDEFF_HALL_OF_FAME_RECORD
	waitfieldeffect FLDEFF_HALL_OF_FAME_RECORD
	delay 40
	setvar VAR_TEMP_1, 1
	call EverGrandeCity_HallOfFame_EventScript_SetGameClearFlags
	checkplayergender
	compare VAR_RESULT, 0
	goto_if_eq EverGrandeCity_HallOfFame_EventScript_GameClearMale
	compare VAR_RESULT, 1
	goto_if_eq EverGrandeCity_HallOfFame_EventScript_GameClearFemale
	end

EverGrandeCity_HallOfFame_EventScript_GameClearMale:: @ 815BC41
	setrespawn HEAL_LOCATION_LITTLEROOT_TOWN_BRENDANS_HOUSE_2F
	fadescreenspeed 1, 24
	special GameClear
	waitstate
	releaseall
	end

EverGrandeCity_HallOfFame_EventScript_GameClearFemale:: @ 815BC4D
	setrespawn HEAL_LOCATION_LITTLEROOT_TOWN_MAYS_HOUSE_2F
	fadescreenspeed 1, 24
	special GameClear
	waitstate
	releaseall
	end

EverGrandeCity_HallOfFame_Movement_WalkIntoHallOfFame1:: @ 815BC59
	walk_up
	walk_up
	walk_up
	walk_up
	walk_up
	walk_up
	step_end

EverGrandeCity_HallOfFame_Movement_WalkIntoHallOfFame2:: @ 815BC60
	walk_up
	walk_up
	walk_up
	walk_up
	walk_up
	step_end
