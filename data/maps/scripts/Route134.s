Route134_MapScripts:: @ 81525B5
	map_script 5, Route134_MapScript1_1525BB
	.byte 0

Route134_MapScript1_1525BB:: @ 81525BB
	warp4 Underwater_Route134, 255, 8, 6
	end

Route134_EventScript_1525C4:: @ 81525C4
	trainerbattle 0, 172, 0, Route134_Text_1C30C6, Route134_Text_1C3110
	loadptr 0, Route134_Text_1C311A
	callstd 6
	end

Route134_EventScript_1525DB:: @ 81525DB
	trainerbattle 0, 463, 0, Route134_Text_1C315E, Route134_Text_1C3198
	loadptr 0, Route134_Text_1C31A0
	callstd 6
	end

Route134_EventScript_1525F2:: @ 81525F2
	trainerbattle 0, 413, 0, Route134_Text_1C31D7, Route134_Text_1C3213
	loadptr 0, Route134_Text_1C3229
	callstd 6
	end

Route134_EventScript_152609:: @ 8152609
	trainerbattle 0, 397, 0, Route134_Text_1C3319, Route134_Text_1C335C
	loadptr 0, Route134_Text_1C336E
	callstd 6
	end

Route134_EventScript_152620:: @ 8152620
	trainerbattle 0, 180, 0, Route134_Text_1C3262, Route134_Text_1C329E
	loadptr 0, Route134_Text_1C32D6
	callstd 6
	end

