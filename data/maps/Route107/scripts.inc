Route107_MapScripts:: @ 814F3BB
	.byte 0

Route107_EventScript_14F3BC:: @ 814F3BC
	trainerbattle 0, TRAINER_DARRIN, 0, Route107_Text_1B926B, Route107_Text_1B92B7
	msgbox Route107_Text_1B92E7, 6
	end

Route107_EventScript_14F3D3:: @ 814F3D3
	trainerbattle 0, TRAINER_TONY_1, 0, Route107_Text_1B933A, Route107_Text_1B9365
	specialvar RESULT, ShouldTryRematchBattle
	compare RESULT, 1
	goto_if_eq Route107_EventScript_14F3FA
	msgbox Route107_Text_1B938E, 6
	end

Route107_EventScript_14F3FA:: @ 814F3FA
	trainerbattle 5, TRAINER_TONY_1, 0, Route107_Text_1B93EB, Route107_Text_1B9429
	msgbox Route107_Text_1B9477, 6
	end

Route107_EventScript_14F411:: @ 814F411
	trainerbattle 0, TRAINER_DENISE, 0, Route107_Text_1B94C8, Route107_Text_1B94F2
	msgbox Route107_Text_1B94FF, 6
	end

Route107_EventScript_14F428:: @ 814F428
	trainerbattle 0, TRAINER_BETH, 0, Route107_Text_1B9538, Route107_Text_1B956B
	msgbox Route107_Text_1B9589, 6
	end

Route107_EventScript_14F43F:: @ 814F43F
	trainerbattle 4, TRAINER_LISA_AND_RAY, 0, Route107_Text_1B95CB, Route107_Text_1B95FB, Route107_Text_1B9672
	msgbox Route107_Text_1B9630, 6
	end

Route107_EventScript_14F45A:: @ 814F45A
	trainerbattle 4, TRAINER_LISA_AND_RAY, 0, Route107_Text_1B96AB, Route107_Text_1B9707, Route107_Text_1B9788
	msgbox Route107_Text_1B9735, 6
	end
