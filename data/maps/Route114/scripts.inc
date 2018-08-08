Route114_MapScripts:: @ 8150732
	.byte 0

Route114_EventScript_150733:: @ 8150733
	lock
	faceplayer
	dodailyevents
	goto_if_set FLAG_DAILY_RECEIVED_BERRY_ROUTE114, Route114_EventScript_150778
	msgbox Route114_Text_1C5803, 4
	random 5
	addvar RESULT, 15
	addvar RESULT, 133
	giveitem_std RESULT
	compare RESULT, 0
	goto_if_eq Route114_EventScript_1A029B
	setflag FLAG_DAILY_RECEIVED_BERRY_ROUTE114
	msgbox Route114_Text_1C5861, 4
	release
	end

Route114_EventScript_150778:: @ 8150778
	msgbox Route114_Text_1C5878, 4
	release
	end

Route114_EventScript_150782:: @ 8150782
	lock
	faceplayer
	goto_if_set FLAG_RECEIVED_TM05, Route114_EventScript_1507B9
	msgbox Route114_Text_170154, 4
	giveitem_std ITEM_TM05_ROAR
	compare RESULT, 0
	goto_if_eq Route114_EventScript_1A029B
	setflag FLAG_RECEIVED_TM05
	msgbox Route114_Text_1701C5, 4
	release
	end

Route114_EventScript_1507B9:: @ 81507B9
	msgbox Route114_Text_1701C5, 4
	release
	end

Route114_EventScript_1507C3:: @ 81507C3
	lock
	faceplayer
	waitse
	playmoncry SPECIES_POOCHYENA, 2
	msgbox Route114_Text_1701F9, 4
	waitmoncry
	release
	end

Route114_EventScript_1507D6:: @ 81507D6
	msgbox Route114_Text_170206, 3
	end

Route114_EventScript_1507DF:: @ 81507DF
	msgbox Route114_Text_17022E, 3
	end

Route114_EventScript_1507E8:: @ 81507E8
	msgbox Route114_Text_170263, 3
	end

Route114_EventScript_1507F1:: @ 81507F1
	trainerbattle 0, TRAINER_LENNY, 0, Route114_Text_1BC05B, Route114_Text_1BC0B5
	msgbox Route114_Text_1BC0C3, 6
	end

Route114_EventScript_150808:: @ 8150808
	trainerbattle 0, TRAINER_LUCAS_1, 0, Route114_Text_1BC125, Route114_Text_1BC163
	msgbox Route114_Text_1BC184, 6
	end

Route114_EventScript_15081F:: @ 815081F
	trainerbattle 0, TRAINER_SHANE, 0, Route114_Text_1BC1C8, Route114_Text_1BC23F
	msgbox Route114_Text_1BC24F, 6
	end

Route114_EventScript_150836:: @ 8150836
	trainerbattle 0, TRAINER_NANCY, 0, Route114_Text_1BC289, Route114_Text_1BC2BE
	msgbox Route114_Text_1BC2C6, 6
	end

Route114_EventScript_15084D:: @ 815084D
	trainerbattle 0, TRAINER_STEVE_1, 0, Route114_Text_1BC2F5, Route114_Text_1BC327
	specialvar RESULT, ShouldTryRematchBattle
	compare RESULT, 1
	goto_if_eq Route114_EventScript_150874
	msgbox Route114_Text_1BC337, 6
	end

Route114_EventScript_150874:: @ 8150874
	trainerbattle 5, TRAINER_STEVE_1, 0, Route114_Text_1BC3B3, Route114_Text_1BC3E0
	msgbox Route114_Text_1BC40F, 6
	end

Route114_EventScript_15088B:: @ 815088B
	trainerbattle 0, TRAINER_BERNIE_1, 0, Route114_Text_1BC45A, Route114_Text_1BC499
	specialvar RESULT, ShouldTryRematchBattle
	compare RESULT, 1
	goto_if_eq Route114_EventScript_1508B2
	msgbox Route114_Text_1BC4B5, 6
	end

Route114_EventScript_1508B2:: @ 81508B2
	trainerbattle 5, TRAINER_BERNIE_1, 0, Route114_Text_1BC525, Route114_Text_1BC559
	msgbox Route114_Text_1BC58C, 6
	end

Route114_EventScript_1508C9:: @ 81508C9
	trainerbattle 0, TRAINER_CLAUDE, 0, Route114_Text_1BC5FC, Route114_Text_1BC653
	msgbox Route114_Text_1BC679, 6
	end

Route114_EventScript_1508E0:: @ 81508E0
	trainerbattle 0, TRAINER_NOLAN, 0, Route114_Text_1BC6EC, Route114_Text_1BC750
	msgbox Route114_Text_1BC78A, 6
	end

Route114_EventScript_1508F7:: @ 81508F7
	trainerbattle 4, TRAINER_TYRA_AND_IVY, 0, Route114_Text_1BC7E3, Route114_Text_1BC834, Route114_Text_1BC88A
	msgbox Route114_Text_1BC858, 6
	end

Route114_EventScript_150912:: @ 8150912
	trainerbattle 4, TRAINER_TYRA_AND_IVY, 0, Route114_Text_1BC8D8, Route114_Text_1BC8FB, Route114_Text_1BC96A
	msgbox Route114_Text_1BC91E, 6
	end
