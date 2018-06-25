Route110_TrickHousePuzzle5_MapScripts:: @ 81627B0
	map_script 3, Route110_TrickHousePuzzle5_MapScript1_1627B6
	.byte 0

Route110_TrickHousePuzzle5_MapScript1_1627B6:: @ 81627B6
	setvar VAR_TEMP_1, 0
	setvar VAR_TEMP_2, 0
	setvar VAR_TEMP_3, 0
	setvar VAR_TEMP_4, 0
	setvar VAR_TEMP_5, 0
	setvar VAR_TEMP_8, 0
	end

Route110_TrickHousePuzzle5_EventScript_1627D5:: @ 81627D5
	lockall
	compare VAR_TRICK_HOUSE_PUZZLE_5_STATE, 0
	goto_if_eq Route110_TrickHousePuzzle5_EventScript_1627E7
	goto Route110_TrickHousePuzzle5_EventScript_161892
	end

Route110_TrickHousePuzzle5_EventScript_1627E7:: @ 81627E7
	setvar VAR_TRICK_HOUSE_PUZZLE_5_STATE, 1
	goto Route110_TrickHousePuzzle5_EventScript_16189C
	end

Route110_TrickHousePuzzle5_EventScript_1627F2:: @ 81627F2
	lockall
	applymovement 1, Route110_TrickHousePuzzle5_Movement_1A0839
	waitmovement 0
	compare VAR_TEMP_1, 1
	goto_if_eq Route110_TrickHousePuzzle5_EventScript_162DE9
	setvar VAR_TEMP_9, 0
	goto Route110_TrickHousePuzzle5_EventScript_16293F
	end

Route110_TrickHousePuzzle5_EventScript_162813:: @ 8162813
	lockall
	applymovement 2, Route110_TrickHousePuzzle5_Movement_1A0839
	waitmovement 0
	compare VAR_TEMP_2, 1
	goto_if_eq Route110_TrickHousePuzzle5_EventScript_162DE9
	setvar VAR_TEMP_9, 0
	goto Route110_TrickHousePuzzle5_EventScript_1629B3
	end

Route110_TrickHousePuzzle5_EventScript_162834:: @ 8162834
	lockall
	applymovement 3, Route110_TrickHousePuzzle5_Movement_1A0839
	waitmovement 0
	compare VAR_TEMP_3, 1
	goto_if_eq Route110_TrickHousePuzzle5_EventScript_162DE9
	setvar VAR_TEMP_9, 0
	goto Route110_TrickHousePuzzle5_EventScript_162A27
	end

Route110_TrickHousePuzzle5_EventScript_162855:: @ 8162855
	lockall
	applymovement 4, Route110_TrickHousePuzzle5_Movement_1A0839
	waitmovement 0
	compare VAR_TEMP_4, 1
	goto_if_eq Route110_TrickHousePuzzle5_EventScript_162DE9
	setvar VAR_TEMP_9, 0
	goto Route110_TrickHousePuzzle5_EventScript_162A9B
	end

Route110_TrickHousePuzzle5_EventScript_162876:: @ 8162876
	lockall
	applymovement 5, Route110_TrickHousePuzzle5_Movement_1A0839
	waitmovement 0
	compare VAR_TEMP_5, 1
	goto_if_eq Route110_TrickHousePuzzle5_EventScript_162DE9
	setvar VAR_TEMP_9, 0
	goto Route110_TrickHousePuzzle5_EventScript_162B0F
	end

Route110_TrickHousePuzzle5_EventScript_162897:: @ 8162897
	lockall
	setvar VAR_TEMP_9, 0
	goto Route110_TrickHousePuzzle5_EventScript_16293F
	end

Route110_TrickHousePuzzle5_EventScript_1628A3:: @ 81628A3
	lockall
	setvar VAR_TEMP_9, 1
	goto Route110_TrickHousePuzzle5_EventScript_16293F
	end

Route110_TrickHousePuzzle5_EventScript_1628AF:: @ 81628AF
	lockall
	setvar VAR_TEMP_9, 2
	goto Route110_TrickHousePuzzle5_EventScript_16293F
	end

Route110_TrickHousePuzzle5_EventScript_1628BB:: @ 81628BB
	lockall
	setvar VAR_TEMP_9, 3
	goto Route110_TrickHousePuzzle5_EventScript_16293F
	end

Route110_TrickHousePuzzle5_EventScript_1628C7:: @ 81628C7
	lockall
	setvar VAR_TEMP_9, 0
	goto Route110_TrickHousePuzzle5_EventScript_1629B3
	end

Route110_TrickHousePuzzle5_EventScript_1628D3:: @ 81628D3
	lockall
	setvar VAR_TEMP_9, 1
	goto Route110_TrickHousePuzzle5_EventScript_1629B3
	end

Route110_TrickHousePuzzle5_EventScript_1628DF:: @ 81628DF
	lockall
	setvar VAR_TEMP_9, 0
	goto Route110_TrickHousePuzzle5_EventScript_162A27
	end

Route110_TrickHousePuzzle5_EventScript_1628EB:: @ 81628EB
	lockall
	setvar VAR_TEMP_9, 1
	goto Route110_TrickHousePuzzle5_EventScript_162A27
	end

Route110_TrickHousePuzzle5_EventScript_1628F7:: @ 81628F7
	lockall
	setvar VAR_TEMP_9, 2
	goto Route110_TrickHousePuzzle5_EventScript_162A27
	end

Route110_TrickHousePuzzle5_EventScript_162903:: @ 8162903
	lockall
	setvar VAR_TEMP_9, 0
	goto Route110_TrickHousePuzzle5_EventScript_162A9B
	end

Route110_TrickHousePuzzle5_EventScript_16290F:: @ 816290F
	lockall
	setvar VAR_TEMP_9, 1
	goto Route110_TrickHousePuzzle5_EventScript_162A9B
	end

Route110_TrickHousePuzzle5_EventScript_16291B:: @ 816291B
	lockall
	setvar VAR_TEMP_9, 0
	goto Route110_TrickHousePuzzle5_EventScript_162B0F
	end

Route110_TrickHousePuzzle5_EventScript_162927:: @ 8162927
	lockall
	setvar VAR_TEMP_9, 1
	goto Route110_TrickHousePuzzle5_EventScript_162B0F
	end

Route110_TrickHousePuzzle5_EventScript_162933:: @ 8162933
	lockall
	setvar VAR_TEMP_9, 2
	goto Route110_TrickHousePuzzle5_EventScript_162B0F
	end

Route110_TrickHousePuzzle5_EventScript_16293F:: @ 816293F
	setvar VAR_TEMP_1, 1
	setvar VAR_TEMP_8, 1
	playse SE_PIN
	applymovement 1, Route110_TrickHousePuzzle5_Movement_1A0833
	waitmovement 0
	applymovement 1, Route110_TrickHousePuzzle5_Movement_1A0835
	waitmovement 0
	compare VAR_TEMP_9, 1
	call_if_eq Route110_TrickHousePuzzle5_EventScript_162DF3
	compare VAR_TEMP_9, 2
	call_if_eq Route110_TrickHousePuzzle5_EventScript_162E2B
	compare VAR_TEMP_9, 3
	call_if_eq Route110_TrickHousePuzzle5_EventScript_162E63
	msgbox Route110_TrickHousePuzzle5_Text_19D423, 4
	random 3
	switch RESULT
	case 0, Route110_TrickHousePuzzle5_EventScript_162B83
	case 1, Route110_TrickHousePuzzle5_EventScript_162BA6
	case 2, Route110_TrickHousePuzzle5_EventScript_162BC9
	end

Route110_TrickHousePuzzle5_EventScript_1629B3:: @ 81629B3
	setvar VAR_TEMP_2, 1
	setvar VAR_TEMP_8, 2
	playse SE_PIN
	applymovement 2, Route110_TrickHousePuzzle5_Movement_1A0833
	waitmovement 0
	applymovement 2, Route110_TrickHousePuzzle5_Movement_1A0835
	waitmovement 0
	compare VAR_TEMP_9, 1
	call_if_eq Route110_TrickHousePuzzle5_EventScript_162E9B
	compare VAR_TEMP_9, 2
	call_if_eq Route110_TrickHousePuzzle5_EventScript_162ED3
	compare VAR_TEMP_9, 3
	call_if_eq Route110_TrickHousePuzzle5_EventScript_162F0B
	msgbox Route110_TrickHousePuzzle5_Text_19D636, 4
	random 3
	switch RESULT
	case 0, Route110_TrickHousePuzzle5_EventScript_162BEC
	case 1, Route110_TrickHousePuzzle5_EventScript_162C0F
	case 2, Route110_TrickHousePuzzle5_EventScript_162C32
	end

Route110_TrickHousePuzzle5_EventScript_162A27:: @ 8162A27
	setvar VAR_TEMP_3, 1
	setvar VAR_TEMP_8, 3
	playse SE_PIN
	applymovement 3, Route110_TrickHousePuzzle5_Movement_1A0833
	waitmovement 0
	applymovement 3, Route110_TrickHousePuzzle5_Movement_1A0835
	waitmovement 0
	compare VAR_TEMP_9, 1
	call_if_eq Route110_TrickHousePuzzle5_EventScript_162DF3
	compare VAR_TEMP_9, 2
	call_if_eq Route110_TrickHousePuzzle5_EventScript_162E2B
	compare VAR_TEMP_9, 3
	call_if_eq Route110_TrickHousePuzzle5_EventScript_162E63
	msgbox Route110_TrickHousePuzzle5_Text_19D7D3, 4
	random 3
	switch RESULT
	case 0, Route110_TrickHousePuzzle5_EventScript_162C55
	case 1, Route110_TrickHousePuzzle5_EventScript_162C78
	case 2, Route110_TrickHousePuzzle5_EventScript_162C9B
	end

Route110_TrickHousePuzzle5_EventScript_162A9B:: @ 8162A9B
	setvar VAR_TEMP_4, 1
	setvar VAR_TEMP_8, 4
	playse SE_PIN
	applymovement 4, Route110_TrickHousePuzzle5_Movement_1A0833
	waitmovement 0
	applymovement 4, Route110_TrickHousePuzzle5_Movement_1A0835
	waitmovement 0
	compare VAR_TEMP_9, 1
	call_if_eq Route110_TrickHousePuzzle5_EventScript_162DF3
	compare VAR_TEMP_9, 2
	call_if_eq Route110_TrickHousePuzzle5_EventScript_162E2B
	compare VAR_TEMP_9, 3
	call_if_eq Route110_TrickHousePuzzle5_EventScript_162E63
	msgbox Route110_TrickHousePuzzle5_Text_19D93D, 4
	random 3
	switch RESULT
	case 0, Route110_TrickHousePuzzle5_EventScript_162CBE
	case 1, Route110_TrickHousePuzzle5_EventScript_162CE1
	case 2, Route110_TrickHousePuzzle5_EventScript_162D04
	end

Route110_TrickHousePuzzle5_EventScript_162B0F:: @ 8162B0F
	setvar VAR_TEMP_5, 1
	setvar VAR_TEMP_8, 5
	playse SE_PIN
	applymovement 5, Route110_TrickHousePuzzle5_Movement_1A0833
	waitmovement 0
	applymovement 5, Route110_TrickHousePuzzle5_Movement_1A0835
	waitmovement 0
	compare VAR_TEMP_9, 1
	call_if_eq Route110_TrickHousePuzzle5_EventScript_162E9B
	compare VAR_TEMP_9, 2
	call_if_eq Route110_TrickHousePuzzle5_EventScript_162ED3
	compare VAR_TEMP_9, 3
	call_if_eq Route110_TrickHousePuzzle5_EventScript_162F0B
	msgbox Route110_TrickHousePuzzle5_Text_19DA9A, 4
	random 3
	switch RESULT
	case 0, Route110_TrickHousePuzzle5_EventScript_162D27
	case 1, Route110_TrickHousePuzzle5_EventScript_162D4A
	case 2, Route110_TrickHousePuzzle5_EventScript_162D6D
	end

Route110_TrickHousePuzzle5_EventScript_162B83:: @ 8162B83
	msgbox Route110_TrickHousePuzzle5_Text_19D4AE, 4
	multichoice 0, 0, 25, 1
	switch RESULT
	case 1, Route110_TrickHousePuzzle5_EventScript_162DDF
	goto Route110_TrickHousePuzzle5_EventScript_162D90
	end

Route110_TrickHousePuzzle5_EventScript_162BA6:: @ 8162BA6
	msgbox Route110_TrickHousePuzzle5_Text_19D501, 4
	multichoice 0, 0, 26, 1
	switch RESULT
	case 0, Route110_TrickHousePuzzle5_EventScript_162DDF
	goto Route110_TrickHousePuzzle5_EventScript_162D90
	end

Route110_TrickHousePuzzle5_EventScript_162BC9:: @ 8162BC9
	msgbox Route110_TrickHousePuzzle5_Text_19D553, 4
	multichoice 0, 0, 27, 1
	switch RESULT
	case 1, Route110_TrickHousePuzzle5_EventScript_162DDF
	goto Route110_TrickHousePuzzle5_EventScript_162D90
	end

Route110_TrickHousePuzzle5_EventScript_162BEC:: @ 8162BEC
	msgbox Route110_TrickHousePuzzle5_Text_19D68E, 4
	multichoice 0, 0, 28, 1
	switch RESULT
	case 2, Route110_TrickHousePuzzle5_EventScript_162DDF
	goto Route110_TrickHousePuzzle5_EventScript_162D90
	end

Route110_TrickHousePuzzle5_EventScript_162C0F:: @ 8162C0F
	msgbox Route110_TrickHousePuzzle5_Text_19D6EC, 4
	multichoice 0, 0, 29, 1
	switch RESULT
	case 0, Route110_TrickHousePuzzle5_EventScript_162DDF
	goto Route110_TrickHousePuzzle5_EventScript_162D90
	end

Route110_TrickHousePuzzle5_EventScript_162C32:: @ 8162C32
	msgbox Route110_TrickHousePuzzle5_Text_19D745, 4
	multichoice 0, 0, 30, 1
	switch RESULT
	case 0, Route110_TrickHousePuzzle5_EventScript_162DDF
	goto Route110_TrickHousePuzzle5_EventScript_162D90
	end

Route110_TrickHousePuzzle5_EventScript_162C55:: @ 8162C55
	msgbox Route110_TrickHousePuzzle5_Text_19D81B, 4
	multichoice 0, 0, 31, 1
	switch RESULT
	case 1, Route110_TrickHousePuzzle5_EventScript_162DDF
	goto Route110_TrickHousePuzzle5_EventScript_162D90
	end

Route110_TrickHousePuzzle5_EventScript_162C78:: @ 8162C78
	msgbox Route110_TrickHousePuzzle5_Text_19D865, 4
	multichoice 0, 0, 32, 1
	switch RESULT
	case 2, Route110_TrickHousePuzzle5_EventScript_162DDF
	goto Route110_TrickHousePuzzle5_EventScript_162D90
	end

Route110_TrickHousePuzzle5_EventScript_162C9B:: @ 8162C9B
	msgbox Route110_TrickHousePuzzle5_Text_19D8BA, 4
	multichoice 0, 0, 33, 1
	switch RESULT
	case 1, Route110_TrickHousePuzzle5_EventScript_162DDF
	goto Route110_TrickHousePuzzle5_EventScript_162D90
	end

Route110_TrickHousePuzzle5_EventScript_162CBE:: @ 8162CBE
	msgbox Route110_TrickHousePuzzle5_Text_19D987, 4
	multichoice 0, 0, 34, 1
	switch RESULT
	case 1, Route110_TrickHousePuzzle5_EventScript_162DDF
	goto Route110_TrickHousePuzzle5_EventScript_162D90
	end

Route110_TrickHousePuzzle5_EventScript_162CE1:: @ 8162CE1
	msgbox Route110_TrickHousePuzzle5_Text_19D9DC, 4
	multichoice 0, 0, 35, 1
	switch RESULT
	case 0, Route110_TrickHousePuzzle5_EventScript_162DDF
	goto Route110_TrickHousePuzzle5_EventScript_162D90
	end

Route110_TrickHousePuzzle5_EventScript_162D04:: @ 8162D04
	msgbox Route110_TrickHousePuzzle5_Text_19DA1D, 4
	multichoice 0, 0, 36, 1
	switch RESULT
	case 1, Route110_TrickHousePuzzle5_EventScript_162DDF
	goto Route110_TrickHousePuzzle5_EventScript_162D90
	end

Route110_TrickHousePuzzle5_EventScript_162D27:: @ 8162D27
	msgbox Route110_TrickHousePuzzle5_Text_19DAEF, 4
	multichoice 0, 0, 37, 1
	switch RESULT
	case 1, Route110_TrickHousePuzzle5_EventScript_162DDF
	goto Route110_TrickHousePuzzle5_EventScript_162D90
	end

Route110_TrickHousePuzzle5_EventScript_162D4A:: @ 8162D4A
	msgbox Route110_TrickHousePuzzle5_Text_19DB43, 4
	multichoice 0, 0, 38, 1
	switch RESULT
	case 0, Route110_TrickHousePuzzle5_EventScript_162DDF
	goto Route110_TrickHousePuzzle5_EventScript_162D90
	end

Route110_TrickHousePuzzle5_EventScript_162D6D:: @ 8162D6D
	msgbox Route110_TrickHousePuzzle5_Text_19DB97, 4
	multichoice 0, 0, 39, 1
	switch RESULT
	case 2, Route110_TrickHousePuzzle5_EventScript_162DDF
	goto Route110_TrickHousePuzzle5_EventScript_162D90
	end

Route110_TrickHousePuzzle5_EventScript_162D90:: @ 8162D90
	waitse
	playse SE_HAZURE
	msgbox Route110_TrickHousePuzzle5_Text_19D5CF, 4
	applymovement 1, Route110_TrickHousePuzzle5_Movement_16309F
	applymovement 2, Route110_TrickHousePuzzle5_Movement_16309F
	applymovement 3, Route110_TrickHousePuzzle5_Movement_16309F
	applymovement 4, Route110_TrickHousePuzzle5_Movement_16309F
	applymovement 5, Route110_TrickHousePuzzle5_Movement_16309F
	msgbox Route110_TrickHousePuzzle5_Text_19D5ED, 4
	waitmovement 0
	closemessage
	msgbox Route110_TrickHousePuzzle5_Text_19D615, 4
	closemessage
	warp MAP_ROUTE110_TRICK_HOUSE_PUZZLE5, 255, 0, 21
	waitstate
	releaseall
	end

Route110_TrickHousePuzzle5_EventScript_162DDF:: @ 8162DDF
	waitse
	playse SE_SEIKAI
	goto Route110_TrickHousePuzzle5_EventScript_162DE9
	end

Route110_TrickHousePuzzle5_EventScript_162DE9:: @ 8162DE9
	msgbox Route110_TrickHousePuzzle5_Text_19D599, 4
	releaseall
	end

Route110_TrickHousePuzzle5_EventScript_162DF3:: @ 8162DF3
	compare VAR_TEMP_8, 1
	call_if_eq Route110_TrickHousePuzzle5_EventScript_162F43
	compare VAR_TEMP_8, 2
	call_if_eq Route110_TrickHousePuzzle5_EventScript_162F4E
	compare VAR_TEMP_8, 3
	call_if_eq Route110_TrickHousePuzzle5_EventScript_162F59
	compare VAR_TEMP_8, 4
	call_if_eq Route110_TrickHousePuzzle5_EventScript_162F64
	compare VAR_TEMP_8, 5
	call_if_eq Route110_TrickHousePuzzle5_EventScript_162F6F
	return

Route110_TrickHousePuzzle5_EventScript_162E2B:: @ 8162E2B
	compare VAR_TEMP_8, 1
	call_if_eq Route110_TrickHousePuzzle5_EventScript_162F7A
	compare VAR_TEMP_8, 2
	call_if_eq Route110_TrickHousePuzzle5_EventScript_162F85
	compare VAR_TEMP_8, 3
	call_if_eq Route110_TrickHousePuzzle5_EventScript_162F90
	compare VAR_TEMP_8, 4
	call_if_eq Route110_TrickHousePuzzle5_EventScript_162F9B
	compare VAR_TEMP_8, 5
	call_if_eq Route110_TrickHousePuzzle5_EventScript_162FA6
	return

Route110_TrickHousePuzzle5_EventScript_162E63:: @ 8162E63
	compare VAR_TEMP_8, 1
	call_if_eq Route110_TrickHousePuzzle5_EventScript_162FB1
	compare VAR_TEMP_8, 2
	call_if_eq Route110_TrickHousePuzzle5_EventScript_162FBC
	compare VAR_TEMP_8, 3
	call_if_eq Route110_TrickHousePuzzle5_EventScript_162FC7
	compare VAR_TEMP_9, 4
	call_if_eq Route110_TrickHousePuzzle5_EventScript_162FD2
	compare VAR_TEMP_9, 5
	call_if_eq Route110_TrickHousePuzzle5_EventScript_162FDD
	return

Route110_TrickHousePuzzle5_EventScript_162E9B:: @ 8162E9B
	compare VAR_TEMP_8, 1
	call_if_eq Route110_TrickHousePuzzle5_EventScript_162FE8
	compare VAR_TEMP_8, 2
	call_if_eq Route110_TrickHousePuzzle5_EventScript_162FF3
	compare VAR_TEMP_8, 3
	call_if_eq Route110_TrickHousePuzzle5_EventScript_162FFE
	compare VAR_TEMP_8, 4
	call_if_eq Route110_TrickHousePuzzle5_EventScript_163009
	compare VAR_TEMP_8, 5
	call_if_eq Route110_TrickHousePuzzle5_EventScript_163014
	return

Route110_TrickHousePuzzle5_EventScript_162ED3:: @ 8162ED3
	compare VAR_TEMP_8, 1
	call_if_eq Route110_TrickHousePuzzle5_EventScript_16301F
	compare VAR_TEMP_8, 2
	call_if_eq Route110_TrickHousePuzzle5_EventScript_16302A
	compare VAR_TEMP_8, 3
	call_if_eq Route110_TrickHousePuzzle5_EventScript_163035
	compare VAR_TEMP_8, 4
	call_if_eq Route110_TrickHousePuzzle5_EventScript_163040
	compare VAR_TEMP_8, 5
	call_if_eq Route110_TrickHousePuzzle5_EventScript_16304B
	return

Route110_TrickHousePuzzle5_EventScript_162F0B:: @ 8162F0B
	compare VAR_TEMP_8, 1
	call_if_eq Route110_TrickHousePuzzle5_EventScript_163056
	compare VAR_TEMP_8, 2
	call_if_eq Route110_TrickHousePuzzle5_EventScript_163061
	compare VAR_TEMP_8, 3
	call_if_eq Route110_TrickHousePuzzle5_EventScript_16306C
	compare VAR_TEMP_8, 4
	call_if_eq Route110_TrickHousePuzzle5_EventScript_163077
	compare VAR_TEMP_8, 5
	call_if_eq Route110_TrickHousePuzzle5_EventScript_163082
	return

Route110_TrickHousePuzzle5_EventScript_162F43:: @ 8162F43
	applymovement 1, Route110_TrickHousePuzzle5_Movement_16308D
	waitmovement 0
	return

Route110_TrickHousePuzzle5_EventScript_162F4E:: @ 8162F4E
	applymovement 2, Route110_TrickHousePuzzle5_Movement_16308D
	waitmovement 0
	return

Route110_TrickHousePuzzle5_EventScript_162F59:: @ 8162F59
	applymovement 3, Route110_TrickHousePuzzle5_Movement_16308D
	waitmovement 0
	return

Route110_TrickHousePuzzle5_EventScript_162F64:: @ 8162F64
	applymovement 4, Route110_TrickHousePuzzle5_Movement_16308D
	waitmovement 0
	return

Route110_TrickHousePuzzle5_EventScript_162F6F:: @ 8162F6F
	applymovement 5, Route110_TrickHousePuzzle5_Movement_16308D
	waitmovement 0
	return

Route110_TrickHousePuzzle5_EventScript_162F7A:: @ 8162F7A
	applymovement 1, Route110_TrickHousePuzzle5_Movement_16308F
	waitmovement 0
	return

Route110_TrickHousePuzzle5_EventScript_162F85:: @ 8162F85
	applymovement 2, Route110_TrickHousePuzzle5_Movement_16308F
	waitmovement 0
	return

Route110_TrickHousePuzzle5_EventScript_162F90:: @ 8162F90
	applymovement 3, Route110_TrickHousePuzzle5_Movement_16308F
	waitmovement 0
	return

Route110_TrickHousePuzzle5_EventScript_162F9B:: @ 8162F9B
	applymovement 4, Route110_TrickHousePuzzle5_Movement_16308F
	waitmovement 0
	return

Route110_TrickHousePuzzle5_EventScript_162FA6:: @ 8162FA6
	applymovement 5, Route110_TrickHousePuzzle5_Movement_16308F
	waitmovement 0
	return

Route110_TrickHousePuzzle5_EventScript_162FB1:: @ 8162FB1
	applymovement 1, Route110_TrickHousePuzzle5_Movement_163092
	waitmovement 0
	return

Route110_TrickHousePuzzle5_EventScript_162FBC:: @ 8162FBC
	applymovement 2, Route110_TrickHousePuzzle5_Movement_163092
	waitmovement 0
	return

Route110_TrickHousePuzzle5_EventScript_162FC7:: @ 8162FC7
	applymovement 3, Route110_TrickHousePuzzle5_Movement_163092
	waitmovement 0
	return

Route110_TrickHousePuzzle5_EventScript_162FD2:: @ 8162FD2
	applymovement 4, Route110_TrickHousePuzzle5_Movement_163092
	waitmovement 0
	return

Route110_TrickHousePuzzle5_EventScript_162FDD:: @ 8162FDD
	applymovement 5, Route110_TrickHousePuzzle5_Movement_163092
	waitmovement 0
	return

Route110_TrickHousePuzzle5_EventScript_162FE8:: @ 8162FE8
	applymovement 1, Route110_TrickHousePuzzle5_Movement_163096
	waitmovement 0
	return

Route110_TrickHousePuzzle5_EventScript_162FF3:: @ 8162FF3
	applymovement 2, Route110_TrickHousePuzzle5_Movement_163096
	waitmovement 0
	return

Route110_TrickHousePuzzle5_EventScript_162FFE:: @ 8162FFE
	applymovement 3, Route110_TrickHousePuzzle5_Movement_163096
	waitmovement 0
	return

Route110_TrickHousePuzzle5_EventScript_163009:: @ 8163009
	applymovement 4, Route110_TrickHousePuzzle5_Movement_163096
	waitmovement 0
	return

Route110_TrickHousePuzzle5_EventScript_163014:: @ 8163014
	applymovement 5, Route110_TrickHousePuzzle5_Movement_163096
	waitmovement 0
	return

Route110_TrickHousePuzzle5_EventScript_16301F:: @ 816301F
	applymovement 1, Route110_TrickHousePuzzle5_Movement_163098
	waitmovement 0
	return

Route110_TrickHousePuzzle5_EventScript_16302A:: @ 816302A
	applymovement 2, Route110_TrickHousePuzzle5_Movement_163098
	waitmovement 0
	return

Route110_TrickHousePuzzle5_EventScript_163035:: @ 8163035
	applymovement 3, Route110_TrickHousePuzzle5_Movement_163098
	waitmovement 0
	return

Route110_TrickHousePuzzle5_EventScript_163040:: @ 8163040
	applymovement 4, Route110_TrickHousePuzzle5_Movement_163098
	waitmovement 0
	return

Route110_TrickHousePuzzle5_EventScript_16304B:: @ 816304B
	applymovement 5, Route110_TrickHousePuzzle5_Movement_163098
	waitmovement 0
	return

Route110_TrickHousePuzzle5_EventScript_163056:: @ 8163056
	applymovement 1, Route110_TrickHousePuzzle5_Movement_16309B
	waitmovement 0
	return

Route110_TrickHousePuzzle5_EventScript_163061:: @ 8163061
	applymovement 2, Route110_TrickHousePuzzle5_Movement_16309B
	waitmovement 0
	return

Route110_TrickHousePuzzle5_EventScript_16306C:: @ 816306C
	applymovement 3, Route110_TrickHousePuzzle5_Movement_16309B
	waitmovement 0
	return

Route110_TrickHousePuzzle5_EventScript_163077:: @ 8163077
	applymovement 4, Route110_TrickHousePuzzle5_Movement_16309B
	waitmovement 0
	return

Route110_TrickHousePuzzle5_EventScript_163082:: @ 8163082
	applymovement 5, Route110_TrickHousePuzzle5_Movement_16309B
	waitmovement 0
	return

Route110_TrickHousePuzzle5_Movement_16308D:: @ 816308D
	walk_left
	end_movement

Route110_TrickHousePuzzle5_Movement_16308F:: @ 816308F
	walk_left
	walk_left
	end_movement

Route110_TrickHousePuzzle5_Movement_163092:: @ 8163092
	walk_left
	walk_left
	walk_left
	end_movement

Route110_TrickHousePuzzle5_Movement_163096:: @ 8163096
	walk_right
	end_movement

Route110_TrickHousePuzzle5_Movement_163098:: @ 8163098
	walk_right
	walk_right
	end_movement

Route110_TrickHousePuzzle5_Movement_16309B:: @ 816309B
	walk_right
	walk_right
	walk_right
	end_movement

Route110_TrickHouseEntrance_Movement_16309F:: @ 816309F
Route110_TrickHousePuzzle5_Movement_16309F:: @ 816309F
	face_left
	delay_2
	face_right
	delay_2
	face_left
	delay_2
	face_right
	delay_2
	face_left
	delay_2
	face_right
	delay_2
	face_left
	delay_2
	face_right
	delay_2
	face_left
	delay_2
	face_right
	delay_2
	face_left
	delay_2
	face_right
	delay_2
	face_left
	delay_2
	face_right
	delay_2
	face_left
	delay_2
	face_right
	delay_2
	face_left
	delay_2
	face_right
	delay_2
	face_left
	delay_2
	face_right
	delay_2
	face_left
	delay_2
	face_right
	delay_2
	face_down
	end_movement
