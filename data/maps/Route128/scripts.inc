Route128_MapScripts:: @ 815211B
	map_script 3, Route128_MapScript1_152126
	map_script 2, Route128_MapScript2_152135
	.byte 0

Route128_MapScript1_152126:: @ 8152126
	call_if_set FLAG_SYS_WEATHER_CTRL, Route128_EventScript_1A02C1
	call Route128_EventScript_1A0196
	end

Route128_MapScript2_152135:: @ 8152135
	map_script_2 VAR_ROUTE128_STATE, 1, Route128_EventScript_15213F
	.2byte 0

Route128_EventScript_15213F:: @ 815213F
	lockall
	delay 20
	.ifndef SAPPHIRE
	special sub_807E25C
	waitstate
	.endif
	applymovement 4, Route128_Movement_152271
	waitmovement 0
	msgbox Route128_Text_171EE0, 4
	applymovement 4, Route128_Movement_152279
	waitmovement 0
	msgbox Route128_Text_171F35, 4
	closemessage
	applymovement 5, Route128_Movement_152293
	waitmovement 0
	applymovement 4, Route128_Movement_1A0841
	waitmovement 0
	msgbox Route128_Text_171F4B, 4
	closemessage
	applymovement 5, Route128_Movement_1522A1
	waitmovement 0
	applymovement 255, Route128_Movement_1A0841
	waitmovement 0
	msgbox Route128_Text_172008, 4
	closemessage
	applymovement 4, Route128_Movement_15227E
	applymovement 255, Route128_Movement_1A083F
	applymovement 5, Route128_Movement_152290
	waitmovement 0
	msgbox Route128_Text_17210B, 4
	closemessage
	delay 40
	applymovement 5, Route128_Movement_152296
	applymovement 4, Route128_Movement_152283
	waitmovement 0
	removeobject 5
	removeobject 4
	delay 100
	setfieldeffectargument 0, 1
	dofieldeffect FLDEFF_NPCFLY_OUT
	waitfieldeffect FLDEFF_NPCFLY_OUT
	addobject 3
	applymovement 3, Route128_Movement_15226F
	waitmovement 0
	applymovement 255, Route128_Movement_1A0843
	waitmovement 0
	msgbox Route128_Text_172181, 4
	closemessage
	applymovement 3, Route128_Movement_15226D
	applymovement 255, Route128_Movement_1A0841
	waitmovement 0
	.ifdef SAPPHIRE
	msgbox Route128_Text_1721A2, 4
	.else
	msgbox Route128_Text_1722A1, 4
	.endif
	applymovement 3, Route128_Movement_1A0845
	waitmovement 0
	msgbox Route128_Text_1723BE, 4
	closemessage
	applymovement 3, Route128_Movement_1A0845
	waitmovement 0
	delay 50
	setfieldeffectargument 0, 1
	dofieldeffect FLDEFF_NPCFLY_OUT
	delay 15
	removeobject 3
	waitfieldeffect FLDEFF_NPCFLY_OUT
	setvar VAR_ROUTE128_STATE, 2
	releaseall
	end

@ 815225E
	walk_fast_left
	end_movement

@ 8152260
	walk_left
	walk_left
	walk_left
	walk_left
	walk_left
	walk_left
	walk_up
	walk_up
	walk_up
	walk_up
	walk_up
	walk_up
	end_movement

Route128_Movement_15226D:: @ 815226D
	walk_up
	end_movement

Route128_Movement_15226F:: @ 815226F
	walk_fast_left
	end_movement

Route128_Movement_152271:: @ 8152271
	walk_fast_down
	walk_in_place_fastest_left
	delay_16
	walk_in_place_fastest_right
	delay_16
	delay_16
	walk_in_place_fastest_down
	end_movement

Route128_Movement_152279:: @ 8152279
	lock_facing_direction
	walk_slow_up
	delay_16
	unlock_facing_direction
	end_movement

Route128_Movement_15227E:: @ 815227E
	walk_fast_left
	walk_fast_left
	walk_fast_left
	walk_in_place_fastest_right
	end_movement

Route128_Movement_152283:: @ 8152283
	delay_16
	delay_16
	walk_fast_up
	walk_fast_left
	walk_fast_up
	walk_fast_up
	walk_fast_up
	walk_fast_up
	walk_fast_up
	walk_fast_up
	walk_fast_up
	walk_fast_up
	end_movement

Route128_Movement_152290:: @ 8152290
	walk_left
	walk_left
	end_movement

Route128_Movement_152293:: @ 8152293
	walk_left
	walk_in_place_fastest_down
	end_movement

Route128_Movement_152296:: @ 8152296
	walk_fast_left
	walk_fast_left
	walk_fast_left
	walk_fast_up
	walk_fast_up
	walk_fast_up
	walk_fast_up
	walk_fast_up
	walk_fast_up
	walk_fast_up
	end_movement

Route128_Movement_1522A1:: @ 81522A1
	walk_right
	walk_in_place_fastest_down
	end_movement

Route128_EventScript_1522A4:: @ 81522A4
	trainerbattle 0, TRAINER_ISAIAH_1, 0, Route128_Text_1C1C67, Route128_Text_1C1C95
	specialvar RESULT, ShouldTryRematchBattle
	compare RESULT, 1
	goto_if_eq Route128_EventScript_1522CB
	msgbox Route128_Text_1C1CC3, 6
	end

Route128_EventScript_1522CB:: @ 81522CB
	trainerbattle 5, TRAINER_ISAIAH_1, 0, Route128_Text_1C1D02, Route128_Text_1C1D45
	msgbox Route128_Text_1C1D6B, 6
	end

Route128_EventScript_1522E2:: @ 81522E2
	trainerbattle 0, TRAINER_KATELYN_1, 0, Route128_Text_1C1DB0, Route128_Text_1C1E25
	specialvar RESULT, ShouldTryRematchBattle
	compare RESULT, 1
	goto_if_eq Route128_EventScript_152309
	msgbox Route128_Text_1C1E4A, 6
	end

Route128_EventScript_152309:: @ 8152309
	trainerbattle 5, TRAINER_KATELYN_1, 0, Route128_Text_1C1E90, Route128_Text_1C1EFA
	msgbox Route128_Text_1C1F2E, 6
	end

Route128_EventScript_152320:: @ 8152320
	trainerbattle 0, TRAINER_ALEXA, 0, Route128_Text_1C1F6D, Route128_Text_1C1FCC
	msgbox Route128_Text_1C1FE8, 6
	end

Route128_EventScript_152337:: @ 8152337
	trainerbattle 0, TRAINER_RUBEN, 0, Route128_Text_1C202C, Route128_Text_1C2051
	msgbox Route128_Text_1C2060, 6
	end

Route128_EventScript_15234E:: @ 815234E
	trainerbattle 0, TRAINER_WAYNE, 0, Route128_Text_1C2090, Route128_Text_1C20FC
	msgbox Route128_Text_1C210D, 6
	end
