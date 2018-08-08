Route106_MapScripts:: @ 814F32E
	.byte 0

Route106_EventScript_14F32F:: @ 814F32F
	msgbox Route106_Text_16E026, 3
	end

Route106_EventScript_14F338:: @ 814F338
	trainerbattle 0, TRAINER_DOUGLAS, 0, Route106_Text_1B913D, Route106_Text_1B917F
	msgbox Route106_Text_1B918A, 6
	end

Route106_EventScript_14F34F:: @ 814F34F
	trainerbattle 0, TRAINER_NICOLE, 0, Route106_Text_1B91AC, Route106_Text_1B91F8
	msgbox Route106_Text_1B9222, 6
	end

Route106_EventScript_14F366:: @ 814F366
	trainerbattle 0, TRAINER_ELLIOT_1, 0, Route106_Text_1B8EF0, Route106_Text_1B8F25
	specialvar RESULT, ShouldTryRematchBattle
	compare RESULT, 1
	goto_if_eq Route106_EventScript_14F38D
	msgbox Route106_Text_1B8F55, 6
	end

Route106_EventScript_14F38D:: @ 814F38D
	trainerbattle 5, TRAINER_ELLIOT_1, 0, Route106_Text_1B8FAC, Route106_Text_1B8FF5
	msgbox Route106_Text_1B9011, 6
	end

Route106_EventScript_14F3A4:: @ 814F3A4
	trainerbattle 0, TRAINER_NED, 0, Route106_Text_1B9052, Route106_Text_1B90D3
	msgbox Route106_Text_1B910A, 6
	end
