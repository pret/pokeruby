Route127_MapScripts:: @ 815206A
	map_script 3, Route127_MapScript1_152070
	.byte 0

Route127_MapScript1_152070:: @ 8152070
	checkflag 2090
	callif 1, Route127_EventScript_1A02C1
	end

Route127_EventScript_15207A:: @ 815207A
	trainerbattle 0, 374, 0, Route127_Text_1C17A8, Route127_Text_1C17DD
	loadptr 0, Route127_Text_1C17EC
	callstd 6
	end

Route127_EventScript_152091:: @ 8152091
	trainerbattle 0, 384, 0, Route127_Text_1C1828, Route127_Text_1C1860
	loadptr 0, Route127_Text_1C1877
	callstd 6
	end

Route127_EventScript_1520A8:: @ 81520A8
	trainerbattle 0, 667, 0, Route127_Text_1C18CC, Route127_Text_1C1930
	loadptr 0, Route127_Text_1C195D
	callstd 6
	end

Route127_EventScript_1520BF:: @ 81520BF
	trainerbattle 0, 668, 0, Route127_Text_1C19A3, Route127_Text_1C19D6
	loadptr 0, Route127_Text_1C19E7
	callstd 6
	end

Route127_EventScript_1520D6:: @ 81520D6
	trainerbattle 0, 669, 0, Route127_Text_1C1A2E, Route127_Text_1C1A73
	loadptr 0, Route127_Text_1C1AA0
	callstd 6
	end

Route127_EventScript_1520ED:: @ 81520ED
	trainerbattle 0, 672, 0, Route127_Text_1C1AE2, Route127_Text_1C1B2A
	loadptr 0, Route127_Text_1C1B39
	callstd 6
	end

Route127_EventScript_152104:: @ 8152104
	trainerbattle 0, 674, 0, Route127_Text_1C1B92, Route127_Text_1C1BD9
	loadptr 0, Route127_Text_1C1BEC
	callstd 6
	end

