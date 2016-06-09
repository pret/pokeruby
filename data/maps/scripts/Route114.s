Route114_MapScripts:: @ 8150732
	.byte 0

Route114_EventScript_150733:: @ 8150733
	lock
	faceplayer
	checkdailyflags
	checkflag 2251
	jumpeq Route114_EventScript_150778
	loadptr 0, Route114_Text_1C5803
	callstd 4
	random 5
	addvar RESULT, 15
	addvar RESULT, 133
	setorcopyvar 0x8000, RESULT
	setorcopyvar 0x8001, 0x1
	callstd 0
	compare RESULT, 0
	jumpeq Route114_EventScript_1A029B
	setflag 2251
	loadptr 0, Route114_Text_1C5861
	callstd 4
	release
	end

Route114_EventScript_150778:: @ 8150778
	loadptr 0, Route114_Text_1C5878
	callstd 4
	release
	end

Route114_EventScript_150782:: @ 8150782
	lock
	faceplayer
	checkflag 231
	jumpeq Route114_EventScript_1507B9
	loadptr 0, Route114_Text_170154
	callstd 4
	setorcopyvar 0x8000, 0x125
	setorcopyvar 0x8001, 0x1
	callstd 0
	compare RESULT, 0
	jumpeq Route114_EventScript_1A029B
	setflag 231
	loadptr 0, Route114_Text_1701C5
	callstd 4
	release
	end

Route114_EventScript_1507B9:: @ 81507B9
	loadptr 0, Route114_Text_1701C5
	callstd 4
	release
	end

Route114_EventScript_1507C3:: @ 81507C3
	lock
	faceplayer
	checksound
	pokecry SPECIES_POOCHYENA, 2
	loadptr 0, Route114_Text_1701F9
	callstd 4
	waitpokecry
	release
	end

Route114_EventScript_1507D6:: @ 81507D6
	loadptr 0, Route114_Text_170206
	callstd 3
	end

Route114_EventScript_1507DF:: @ 81507DF
	loadptr 0, Route114_Text_17022E
	callstd 3
	end

Route114_EventScript_1507E8:: @ 81507E8
	loadptr 0, Route114_Text_170263
	callstd 3
	end

Route114_EventScript_1507F1:: @ 81507F1
	trainerbattle 0, 628, 0, Route114_Text_1BC05B, Route114_Text_1BC0B5
	loadptr 0, Route114_Text_1BC0C3
	callstd 6
	end

Route114_EventScript_150808:: @ 8150808
	trainerbattle 0, 629, 0, Route114_Text_1BC125, Route114_Text_1BC163
	loadptr 0, Route114_Text_1BC184
	callstd 6
	end

Route114_EventScript_15081F:: @ 815081F
	trainerbattle 0, 214, 0, Route114_Text_1BC1C8, Route114_Text_1BC23F
	loadptr 0, Route114_Text_1BC24F
	callstd 6
	end

Route114_EventScript_150836:: @ 8150836
	trainerbattle 0, 472, 0, Route114_Text_1BC289, Route114_Text_1BC2BE
	loadptr 0, Route114_Text_1BC2C6
	callstd 6
	end

Route114_EventScript_15084D:: @ 815084D
	trainerbattle 0, 143, 0, Route114_Text_1BC2F5, Route114_Text_1BC327
	specialval RESULT, 57
	compare RESULT, 1
	jumpeq Route114_EventScript_150874
	loadptr 0, Route114_Text_1BC337
	callstd 6
	end

Route114_EventScript_150874:: @ 8150874
	trainerbattle 5, 143, 0, Route114_Text_1BC3B3, Route114_Text_1BC3E0
	loadptr 0, Route114_Text_1BC40F
	callstd 6
	end

Route114_EventScript_15088B:: @ 815088B
	trainerbattle 0, 206, 0, Route114_Text_1BC45A, Route114_Text_1BC499
	specialval RESULT, 57
	compare RESULT, 1
	jumpeq Route114_EventScript_1508B2
	loadptr 0, Route114_Text_1BC4B5
	callstd 6
	end

Route114_EventScript_1508B2:: @ 81508B2
	trainerbattle 5, 206, 0, Route114_Text_1BC525, Route114_Text_1BC559
	loadptr 0, Route114_Text_1BC58C
	callstd 6
	end

Route114_EventScript_1508C9:: @ 81508C9
	trainerbattle 0, 338, 0, Route114_Text_1BC5FC, Route114_Text_1BC653
	loadptr 0, Route114_Text_1BC679
	callstd 6
	end

Route114_EventScript_1508E0:: @ 81508E0
	trainerbattle 0, 342, 0, Route114_Text_1BC6EC, Route114_Text_1BC750
	loadptr 0, Route114_Text_1BC78A
	callstd 6
	end

Route114_EventScript_1508F7:: @ 81508F7
	trainerbattle 4, 679, 0, Route114_Text_1BC7E3, Route114_Text_1BC834, Route114_Text_1BC88A
	loadptr 0, Route114_Text_1BC858
	callstd 6
	end

Route114_EventScript_150912:: @ 8150912
	trainerbattle 4, 679, 0, Route114_Text_1BC8D8, Route114_Text_1BC8FB, Route114_Text_1BC96A
	loadptr 0, Route114_Text_1BC91E
	callstd 6
	end

