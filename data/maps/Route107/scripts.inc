Route107_MapScripts:: @ 814F3BB
	.byte 0

Route107_EventScript_14F3BC:: @ 814F3BC
	trainerbattle_single TRAINER_DARRIN, Route107_Text_1B926B, Route107_Text_1B92B7
	msgbox Route107_Text_1B92E7, 6
	end

Route107_EventScript_14F3D3:: @ 814F3D3
	trainerbattle_single TRAINER_TONY_1, Route107_Text_1B933A, Route107_Text_1B9365
	specialvar VAR_RESULT, ShouldTryRematchBattle
	compare VAR_RESULT, 1
	goto_if_eq Route107_EventScript_14F3FA
	msgbox Route107_Text_1B938E, 6
	end

Route107_EventScript_14F3FA:: @ 814F3FA
	trainerbattle_rematch TRAINER_TONY_1, Route107_Text_1B93EB, Route107_Text_1B9429
	msgbox Route107_Text_1B9477, 6
	end

Route107_EventScript_14F411:: @ 814F411
	trainerbattle_single TRAINER_DENISE, Route107_Text_1B94C8, Route107_Text_1B94F2
	msgbox Route107_Text_1B94FF, 6
	end

Route107_EventScript_14F428:: @ 814F428
	trainerbattle_single TRAINER_BETH, Route107_Text_1B9538, Route107_Text_1B956B
	msgbox Route107_Text_1B9589, 6
	end

Route107_EventScript_14F43F:: @ 814F43F
	trainerbattle_double TRAINER_LISA_AND_RAY, Route107_Text_1B95CB, Route107_Text_1B95FB, Route107_Text_1B9672
	msgbox Route107_Text_1B9630, 6
	end

Route107_EventScript_14F45A:: @ 814F45A
	trainerbattle_double TRAINER_LISA_AND_RAY, Route107_Text_1B96AB, Route107_Text_1B9707, Route107_Text_1B9788
	msgbox Route107_Text_1B9735, 6
	end
