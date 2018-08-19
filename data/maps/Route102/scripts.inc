Route102_MapScripts:: @ 814EAD9
	.byte 0

Route102_EventScript_14EADA:: @ 814EADA
	msgbox Route102_Text_16D431, 2
	end

Route102_EventScript_14EAE3:: @ 814EAE3
	msgbox Route102_Text_16D547, 3
	end

Route102_EventScript_14EAEC:: @ 814EAEC
	msgbox Route102_Text_16D55F, 3
	end

Route102_EventScript_14EAF5:: @ 814EAF5
	msgbox Route102_Text_16D51A, 2
	end

Route102_EventScript_14EAFE:: @ 814EAFE
	trainerbattle 0, TRAINER_CALVIN_1, 0, Route102_Text_1B79C3, Route102_Text_1B7A2C
	specialvar RESULT, ShouldTryRematchBattle
	compare RESULT, 1
	goto_if_eq Route102_EventScript_14EB25
	msgbox Route102_Text_1B7A60, 6
	end

Route102_EventScript_14EB25:: @ 814EB25
	trainerbattle 5, TRAINER_CALVIN_1, 0, Route102_Text_1B7A9F, Route102_Text_1B7AFD
	msgbox Route102_Text_1B7B2F, 6
	end

Route102_EventScript_14EB3C:: @ 814EB3C
	trainerbattle 0, TRAINER_RICK, 0, Route102_Text_1B7C05, Route102_Text_1B7C40
	msgbox Route102_Text_1B7C52, 6
	end

Route102_EventScript_14EB53:: @ 814EB53
	trainerbattle 0, TRAINER_TIANA, 0, Route102_Text_1B7C97, Route102_Text_1B7CEC
	msgbox Route102_Text_1B7D11, 6
	end

Route102_EventScript_14EB6A:: @ 814EB6A
	trainerbattle 0, TRAINER_ALLEN, 0, Route102_Text_1B7B68, Route102_Text_1B7B9D
	msgbox Route102_Text_1B7BD0, 6
	end
