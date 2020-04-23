Route134_MapScripts:: @ 81525B5
	map_script 5, Route134_MapScript1_1525BB
	.byte 0

Route134_MapScript1_1525BB:: @ 81525BB
	setdivewarp MAP_UNDERWATER_ROUTE134, 255, 8, 6
	end

Route134_EventScript_1525C4:: @ 81525C4
	trainerbattle_single TRAINER_JACK, Route134_Text_1C30C6, Route134_Text_1C3110
	msgbox Route134_Text_1C311A, MSGBOX_AUTOCLOSE
	end

Route134_EventScript_1525DB:: @ 81525DB
	trainerbattle_single TRAINER_LAUREL, Route134_Text_1C315E, Route134_Text_1C3198
	msgbox Route134_Text_1C31A0, MSGBOX_AUTOCLOSE
	end

Route134_EventScript_1525F2:: @ 81525F2
	trainerbattle_single TRAINER_ALEX, Route134_Text_1C31D7, Route134_Text_1C3213
	msgbox Route134_Text_1C3229, MSGBOX_AUTOCLOSE
	end

Route134_EventScript_152609:: @ 8152609
	trainerbattle_single TRAINER_AARON, Route134_Text_1C3319, Route134_Text_1C335C
	msgbox Route134_Text_1C336E, MSGBOX_AUTOCLOSE
	end

Route134_EventScript_152620:: @ 8152620
	trainerbattle_single TRAINER_HITOSHI, Route134_Text_1C3262, Route134_Text_1C329E
	msgbox Route134_Text_1C32D6, MSGBOX_AUTOCLOSE
	end
