Route110_TrickHousePuzzle2_MapScripts:: @ 8161D76
	map_script 5, Route110_TrickHousePuzzle2_MapScript1_161D81
	map_script 3, Route110_TrickHousePuzzle2_MapScript1_161DAE
	.byte 0

Route110_TrickHousePuzzle2_MapScript1_161D81:: @ 8161D81
	compare VAR_TEMP_1, 1
	call_if_eq Route110_TrickHousePuzzle2_EventScript_161E2C
	compare VAR_TEMP_2, 1
	call_if_eq Route110_TrickHousePuzzle2_EventScript_161E3F
	compare VAR_TEMP_3, 1
	call_if_eq Route110_TrickHousePuzzle2_EventScript_161E52
	compare VAR_TEMP_4, 1
	call_if_eq Route110_TrickHousePuzzle2_EventScript_161E65
	end

Route110_TrickHousePuzzle2_MapScript1_161DAE:: @ 8161DAE
	setvar VAR_TEMP_1, 0
	setvar VAR_TEMP_2, 0
	setvar VAR_TEMP_3, 0
	setvar VAR_TEMP_4, 0
	end

Route110_TrickHousePuzzle2_EventScript_161DC3:: @ 8161DC3
	lockall
	compare VAR_TRICK_HOUSE_PUZZLE_2_STATE, 0
	goto_if_eq Route110_TrickHousePuzzle2_EventScript_161DD5
	goto Route110_TrickHousePuzzle2_EventScript_161892
	end

Route110_TrickHousePuzzle2_EventScript_161DD5:: @ 8161DD5
	setvar VAR_TRICK_HOUSE_PUZZLE_2_STATE, 1
	goto Route110_TrickHousePuzzle2_EventScript_16189C
	end

Route110_TrickHousePuzzle2_EventScript_161DE0:: @ 8161DE0
	lockall
	setvar VAR_TEMP_1, 1
	playse SE_PIN
	call Route110_TrickHousePuzzle2_EventScript_161E2C
	special DrawWholeMapView
	releaseall
	end

Route110_TrickHousePuzzle2_EventScript_161DF3:: @ 8161DF3
	lockall
	setvar VAR_TEMP_2, 1
	playse SE_PIN
	call Route110_TrickHousePuzzle2_EventScript_161E3F
	special DrawWholeMapView
	releaseall
	end

Route110_TrickHousePuzzle2_EventScript_161E06:: @ 8161E06
	lockall
	setvar VAR_TEMP_3, 1
	playse SE_PIN
	call Route110_TrickHousePuzzle2_EventScript_161E52
	special DrawWholeMapView
	releaseall
	end

Route110_TrickHousePuzzle2_EventScript_161E19:: @ 8161E19
	lockall
	setvar VAR_TEMP_4, 1
	playse SE_PIN
	call Route110_TrickHousePuzzle2_EventScript_161E65
	special DrawWholeMapView
	releaseall
	end

Route110_TrickHousePuzzle2_EventScript_161E2C:: @ 8161E2C
	setmetatile 14, 21, 601, 0
	setmetatile 1, 12, 618, 0
	return

Route110_TrickHousePuzzle2_EventScript_161E3F:: @ 8161E3F
	setmetatile 8, 17, 601, 0
	setmetatile 12, 13, 618, 0
	return

Route110_TrickHousePuzzle2_EventScript_161E52:: @ 8161E52
	setmetatile 4, 10, 601, 0
	setmetatile 8, 4, 618, 0
	return

Route110_TrickHousePuzzle2_EventScript_161E65:: @ 8161E65
	setmetatile 5, 2, 601, 0
	setmetatile 12, 5, 618, 0
	return

Route110_TrickHousePuzzle2_EventScript_161E78:: @ 8161E78
	trainerbattle 0, TRAINER_TED, 0, Route110_TrickHousePuzzle2_Text_19CD46, Route110_TrickHousePuzzle2_Text_19CD66
	msgbox Route110_TrickHousePuzzle2_Text_19CD91, 6
	end

Route110_TrickHousePuzzle2_EventScript_161E8F:: @ 8161E8F
	trainerbattle 0, TRAINER_PAUL, 0, Route110_TrickHousePuzzle2_Text_19CDBF, Route110_TrickHousePuzzle2_Text_19CDF0
	msgbox Route110_TrickHousePuzzle2_Text_19CE0D, 6
	end

Route110_TrickHousePuzzle2_EventScript_161EA6:: @ 8161EA6
	trainerbattle 0, TRAINER_GEORGIA, 0, Route110_TrickHousePuzzle2_Text_19CE52, Route110_TrickHousePuzzle2_Text_19CE98
	msgbox Route110_TrickHousePuzzle2_Text_19CEB8, 6
	end
