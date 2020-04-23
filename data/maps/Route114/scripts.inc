Route114_MapScripts:: @ 8150732
	.byte 0

Route114_EventScript_150733:: @ 8150733
	lock
	faceplayer
	dotimebasedevents
	goto_if_set FLAG_DAILY_RECEIVED_BERRY_ROUTE114, Route114_EventScript_150778
	msgbox Route114_Text_1C5803, MSGBOX_DEFAULT
	random 5
	addvar VAR_RESULT, 15
	addvar VAR_RESULT, 133
	giveitem VAR_RESULT
	compare VAR_RESULT, 0
	goto_if_eq Route114_EventScript_1A029B
	setflag FLAG_DAILY_RECEIVED_BERRY_ROUTE114
	msgbox Route114_Text_1C5861, MSGBOX_DEFAULT
	release
	end

Route114_EventScript_150778:: @ 8150778
	msgbox Route114_Text_1C5878, MSGBOX_DEFAULT
	release
	end

Route114_EventScript_150782:: @ 8150782
	lock
	faceplayer
	goto_if_set FLAG_RECEIVED_TM05, Route114_EventScript_1507B9
	msgbox Route114_Text_170154, MSGBOX_DEFAULT
	giveitem ITEM_TM05_ROAR
	compare VAR_RESULT, 0
	goto_if_eq Route114_EventScript_1A029B
	setflag FLAG_RECEIVED_TM05
	msgbox Route114_Text_1701C5, MSGBOX_DEFAULT
	release
	end

Route114_EventScript_1507B9:: @ 81507B9
	msgbox Route114_Text_1701C5, MSGBOX_DEFAULT
	release
	end

Route114_EventScript_1507C3:: @ 81507C3
	lock
	faceplayer
	waitse
	playmoncry SPECIES_POOCHYENA, 2
	msgbox Route114_Text_1701F9, MSGBOX_DEFAULT
	waitmoncry
	release
	end

Route114_EventScript_1507D6:: @ 81507D6
	msgbox Route114_Text_170206, MSGBOX_SIGN
	end

Route114_EventScript_1507DF:: @ 81507DF
	msgbox Route114_Text_17022E, MSGBOX_SIGN
	end

Route114_EventScript_1507E8:: @ 81507E8
	msgbox Route114_Text_170263, MSGBOX_SIGN
	end

Route114_EventScript_1507F1:: @ 81507F1
	trainerbattle_single TRAINER_LENNY, Route114_Text_1BC05B, Route114_Text_1BC0B5
	msgbox Route114_Text_1BC0C3, MSGBOX_AUTOCLOSE
	end

Route114_EventScript_150808:: @ 8150808
	trainerbattle_single TRAINER_LUCAS_1, Route114_Text_1BC125, Route114_Text_1BC163
	msgbox Route114_Text_1BC184, MSGBOX_AUTOCLOSE
	end

Route114_EventScript_15081F:: @ 815081F
	trainerbattle_single TRAINER_SHANE, Route114_Text_1BC1C8, Route114_Text_1BC23F
	msgbox Route114_Text_1BC24F, MSGBOX_AUTOCLOSE
	end

Route114_EventScript_150836:: @ 8150836
	trainerbattle_single TRAINER_NANCY, Route114_Text_1BC289, Route114_Text_1BC2BE
	msgbox Route114_Text_1BC2C6, MSGBOX_AUTOCLOSE
	end

Route114_EventScript_15084D:: @ 815084D
	trainerbattle_single TRAINER_STEVE_1, Route114_Text_1BC2F5, Route114_Text_1BC327
	specialvar VAR_RESULT, ShouldTryRematchBattle
	compare VAR_RESULT, 1
	goto_if_eq Route114_EventScript_150874
	msgbox Route114_Text_1BC337, MSGBOX_AUTOCLOSE
	end

Route114_EventScript_150874:: @ 8150874
	trainerbattle_rematch TRAINER_STEVE_1, Route114_Text_1BC3B3, Route114_Text_1BC3E0
	msgbox Route114_Text_1BC40F, MSGBOX_AUTOCLOSE
	end

Route114_EventScript_15088B:: @ 815088B
	trainerbattle_single TRAINER_BERNIE_1, Route114_Text_1BC45A, Route114_Text_1BC499
	specialvar VAR_RESULT, ShouldTryRematchBattle
	compare VAR_RESULT, 1
	goto_if_eq Route114_EventScript_1508B2
	msgbox Route114_Text_1BC4B5, MSGBOX_AUTOCLOSE
	end

Route114_EventScript_1508B2:: @ 81508B2
	trainerbattle_rematch TRAINER_BERNIE_1, Route114_Text_1BC525, Route114_Text_1BC559
	msgbox Route114_Text_1BC58C, MSGBOX_AUTOCLOSE
	end

Route114_EventScript_1508C9:: @ 81508C9
	trainerbattle_single TRAINER_CLAUDE, Route114_Text_1BC5FC, Route114_Text_1BC653
	msgbox Route114_Text_1BC679, MSGBOX_AUTOCLOSE
	end

Route114_EventScript_1508E0:: @ 81508E0
	trainerbattle_single TRAINER_NOLAN, Route114_Text_1BC6EC, Route114_Text_1BC750
	msgbox Route114_Text_1BC78A, MSGBOX_AUTOCLOSE
	end

Route114_EventScript_1508F7:: @ 81508F7
	trainerbattle_double TRAINER_TYRA_AND_IVY, Route114_Text_1BC7E3, Route114_Text_1BC834, Route114_Text_1BC88A
	msgbox Route114_Text_1BC858, MSGBOX_AUTOCLOSE
	end

Route114_EventScript_150912:: @ 8150912
	trainerbattle_double TRAINER_TYRA_AND_IVY, Route114_Text_1BC8D8, Route114_Text_1BC8FB, Route114_Text_1BC96A
	msgbox Route114_Text_1BC91E, MSGBOX_AUTOCLOSE
	end
