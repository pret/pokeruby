Route102_MapScripts:: @ 814EAD9
	.byte 0

Route102_EventScript_14EADA:: @ 814EADA
	msgbox Route102_Text_16D431, MSGBOX_NPC
	end

Route102_EventScript_14EAE3:: @ 814EAE3
	msgbox Route102_Text_16D547, MSGBOX_SIGN
	end

Route102_EventScript_14EAEC:: @ 814EAEC
	msgbox Route102_Text_16D55F, MSGBOX_SIGN
	end

Route102_EventScript_14EAF5:: @ 814EAF5
	msgbox Route102_Text_16D51A, MSGBOX_NPC
	end

Route102_EventScript_14EAFE:: @ 814EAFE
	trainerbattle_single TRAINER_CALVIN_1, Route102_Text_1B79C3, Route102_Text_1B7A2C
	specialvar VAR_RESULT, ShouldTryRematchBattle
	compare VAR_RESULT, 1
	goto_if_eq Route102_EventScript_14EB25
	msgbox Route102_Text_1B7A60, MSGBOX_AUTOCLOSE
	end

Route102_EventScript_14EB25:: @ 814EB25
	trainerbattle_rematch TRAINER_CALVIN_1, Route102_Text_1B7A9F, Route102_Text_1B7AFD
	msgbox Route102_Text_1B7B2F, MSGBOX_AUTOCLOSE
	end

Route102_EventScript_14EB3C:: @ 814EB3C
	trainerbattle_single TRAINER_RICK, Route102_Text_1B7C05, Route102_Text_1B7C40
	msgbox Route102_Text_1B7C52, MSGBOX_AUTOCLOSE
	end

Route102_EventScript_14EB53:: @ 814EB53
	trainerbattle_single TRAINER_TIANA, Route102_Text_1B7C97, Route102_Text_1B7CEC
	msgbox Route102_Text_1B7D11, MSGBOX_AUTOCLOSE
	end

Route102_EventScript_14EB6A:: @ 814EB6A
	trainerbattle_single TRAINER_ALLEN, Route102_Text_1B7B68, Route102_Text_1B7B9D
	msgbox Route102_Text_1B7BD0, MSGBOX_AUTOCLOSE
	end
