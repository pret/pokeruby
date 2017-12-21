EverGrandeCity_HallOfFame_MapScripts:: @ 815BB84
	map_script 2, EverGrandeCity_HallOfFame_MapScript2_15BB9E
	map_script 4, EverGrandeCity_HallOfFame_MapScript2_15BB8F
	.byte 0

EverGrandeCity_HallOfFame_MapScript2_15BB8F:: @ 815BB8F
	map_script_2 0x4001, 0, EverGrandeCity_HallOfFame_EventScript_15BB99
	.2byte 0

EverGrandeCity_HallOfFame_EventScript_15BB99:: @ 815BB99
	turnobject 255, 2
	end

EverGrandeCity_HallOfFame_MapScript2_15BB9E:: @ 815BB9E
	map_script_2 0x4001, 0, EverGrandeCity_HallOfFame_EventScript_15BBA8
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
	dofieldeffect 62
	waitfieldeffect 62
	delay 40
	setvar 0x4001, 1
	call EverGrandeCity_HallOfFame_EventScript_19FC13
	checkplayergender
	compare RESULT, 0
	goto_if_eq EverGrandeCity_HallOfFame_EventScript_15BC41
	compare RESULT, 1
	goto_if_eq EverGrandeCity_HallOfFame_EventScript_15BC4D
	end

EverGrandeCity_HallOfFame_EventScript_15BC41:: @ 815BC41
	setrespawn 1
	fadescreenspeed 1, 24
	special GameClear
	waitstate
	releaseall
	end

EverGrandeCity_HallOfFame_EventScript_15BC4D:: @ 815BC4D
	setrespawn 2
	fadescreenspeed 1, 24
	special GameClear
	waitstate
	releaseall
	end

EverGrandeCity_HallOfFame_Movement_15BC59:: @ 815BC59
	step_up
	step_up
	step_up
	step_up
	step_up
	step_up
	step_end

EverGrandeCity_HallOfFame_Movement_15BC60:: @ 815BC60
	step_up
	step_up
	step_up
	step_up
	step_up
	step_end
