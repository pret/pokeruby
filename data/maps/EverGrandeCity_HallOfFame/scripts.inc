EverGrandeCity_HallOfFame_MapScripts:: @ 815BB84
	map_script 2, EverGrandeCity_HallOfFame_MapScript2_15BB9E
	map_script 4, EverGrandeCity_HallOfFame_MapScript2_15BB8F
	.byte 0

EverGrandeCity_HallOfFame_MapScript2_15BB8F:: @ 815BB8F
	map_script_2 VAR_TEMP_1, 0, EverGrandeCity_HallOfFame_EventScript_15BB99
	.2byte 0

EverGrandeCity_HallOfFame_EventScript_15BB99:: @ 815BB99
	turnobject 255, 2
	end

EverGrandeCity_HallOfFame_MapScript2_15BB9E:: @ 815BB9E
	map_script_2 VAR_TEMP_1, 0, EverGrandeCity_HallOfFame_EventScript_15BBA8
	.2byte 0

EverGrandeCity_HallOfFame_EventScript_15BBA8:: @ 815BBA8
	lockall
	applymovement 1, EverGrandeCity_HallOfFame_Movement_15BC59
	applymovement 255, EverGrandeCity_HallOfFame_Movement_15BC59
	waitmovement 0
	applymovement 1, EverGrandeCity_HallOfFame_Movement_1A0843
	applymovement 255, EverGrandeCity_HallOfFame_Movement_1A083F
	waitmovement 0
	msgbox EverGrandeCity_HallOfFame_Text_191841, 4
	closemessage
	applymovement 1, EverGrandeCity_HallOfFame_Movement_15BC60
	applymovement 255, EverGrandeCity_HallOfFame_Movement_15BC60
	waitmovement 0
	delay 20
	applymovement 1, EverGrandeCity_HallOfFame_Movement_1A0843
	applymovement 255, EverGrandeCity_HallOfFame_Movement_1A083F
	waitmovement 0
	msgbox EverGrandeCity_HallOfFame_Text_1918D7, 4
	closemessage
	applymovement 1, EverGrandeCity_HallOfFame_Movement_1A0841
	applymovement 255, EverGrandeCity_HallOfFame_Movement_1A0841
	waitmovement 0
	delay 20
	dofieldeffect FLDEFF_HALL_OF_FAME_RECORD
	waitfieldeffect FLDEFF_HALL_OF_FAME_RECORD
	delay 40
	setvar VAR_TEMP_1, 1
	call EverGrandeCity_HallOfFame_EventScript_19FC13
	checkplayergender
	compare RESULT, 0
	goto_if_eq EverGrandeCity_HallOfFame_EventScript_15BC41
	compare RESULT, 1
	goto_if_eq EverGrandeCity_HallOfFame_EventScript_15BC4D
	end

EverGrandeCity_HallOfFame_EventScript_15BC41:: @ 815BC41
	setrespawn HEAL_LOCATION_LITTLEROOT_TOWN_BRENDANS_HOUSE_2F
	fadescreenspeed 1, 24
	special GameClear
	waitstate
	releaseall
	end

EverGrandeCity_HallOfFame_EventScript_15BC4D:: @ 815BC4D
	setrespawn HEAL_LOCATION_LITTLEROOT_TOWN_MAYS_HOUSE_2F
	fadescreenspeed 1, 24
	special GameClear
	waitstate
	releaseall
	end

EverGrandeCity_HallOfFame_Movement_15BC59:: @ 815BC59
	walk_up
	walk_up
	walk_up
	walk_up
	walk_up
	walk_up
	end_movement

EverGrandeCity_HallOfFame_Movement_15BC60:: @ 815BC60
	walk_up
	walk_up
	walk_up
	walk_up
	walk_up
	end_movement
