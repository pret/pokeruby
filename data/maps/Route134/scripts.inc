Route134_MapScripts:: @ 81525B5
	map_script 5, Route134_MapScript1_1525BB
	.byte 0

Route134_MapScript1_1525BB:: @ 81525BB
	setdivewarp MAP_UNDERWATER_ROUTE134, 255, 8, 6
	end

Route134_EventScript_1525C4:: @ 81525C4
	trainerbattle 0, TRAINER_JACK, 0, Route134_Text_1C30C6, Route134_Text_1C3110
	msgbox Route134_Text_1C311A, 6
	end

Route134_EventScript_1525DB:: @ 81525DB
	trainerbattle 0, TRAINER_LAUREL, 0, Route134_Text_1C315E, Route134_Text_1C3198
	msgbox Route134_Text_1C31A0, 6
	end

Route134_EventScript_1525F2:: @ 81525F2
	trainerbattle 0, TRAINER_ALEX, 0, Route134_Text_1C31D7, Route134_Text_1C3213
	msgbox Route134_Text_1C3229, 6
	end

Route134_EventScript_152609:: @ 8152609
	trainerbattle 0, TRAINER_AARON, 0, Route134_Text_1C3319, Route134_Text_1C335C
	msgbox Route134_Text_1C336E, 6
	end

Route134_EventScript_152620:: @ 8152620
	trainerbattle 0, TRAINER_HITOSHI, 0, Route134_Text_1C3262, Route134_Text_1C329E
	msgbox Route134_Text_1C32D6, 6
	end
