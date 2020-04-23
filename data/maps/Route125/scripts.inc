Route125_MapScripts:: @ 8151F1E
	map_script 3, Route125_MapScript1_151F24
	.byte 0

Route125_MapScript1_151F24:: @ 8151F24
	call_if_set FLAG_SYS_WEATHER_CTRL, Route125_EventScript_1A02C1
	end

Route125_EventScript_151F2E:: @ 8151F2E
	trainerbattle_single TRAINER_CODY, Route125_Text_1C0FCF, Route125_Text_1C1002
	msgbox Route125_Text_1C1013, 6
	end

Route125_EventScript_151F45:: @ 8151F45
	trainerbattle_single TRAINER_STAN, Route125_Text_1C104B, Route125_Text_1C1073
	msgbox Route125_Text_1C1083, 6
	end

Route125_EventScript_151F5C:: @ 8151F5C
	trainerbattle_single TRAINER_TANYA, Route125_Text_1C10C3, Route125_Text_1C10FB
	msgbox Route125_Text_1C110C, 6
	end

Route125_EventScript_151F73:: @ 8151F73
	trainerbattle_single TRAINER_SHARON, Route125_Text_1C1136, Route125_Text_1C1175
	msgbox Route125_Text_1C117F, 6
	end

Route125_EventScript_151F8A:: @ 8151F8A
	trainerbattle_single TRAINER_ERNEST_1, Route125_Text_1C11AF, Route125_Text_1C11ED
	specialvar VAR_RESULT, ShouldTryRematchBattle
	compare VAR_RESULT, 1
	goto_if_eq Route125_EventScript_151FB1
	msgbox Route125_Text_1C1208, 6
	end

Route125_EventScript_151FB1:: @ 8151FB1
	trainerbattle_rematch TRAINER_ERNEST_1, Route125_Text_1C1282, Route125_Text_1C12C5
	msgbox Route125_Text_1C12EE, 6
	end

Route125_EventScript_151FC8:: @ 8151FC8
	trainerbattle_double TRAINER_KIM_AND_IRIS, Route125_Text_1C13A1, Route125_Text_1C13FF, Route125_Text_1C146E
	msgbox Route125_Text_1C141C, 6
	end

Route125_EventScript_151FE3:: @ 8151FE3
	trainerbattle_double TRAINER_KIM_AND_IRIS, Route125_Text_1C14AB, Route125_Text_1C14E7, Route125_Text_1C154F
	msgbox Route125_Text_1C1508, 6
	end
