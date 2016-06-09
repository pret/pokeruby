Route125_MapScripts:: @ 8151F1E
	map_script 3, Route125_MapScript1_151F24
	.byte 0

Route125_MapScript1_151F24:: @ 8151F24
	checkflag 2090
	callif 1, Route125_EventScript_1A02C1
	end

Route125_EventScript_151F2E:: @ 8151F2E
	trainerbattle 0, 161, 0, Route125_Text_1C0FCF, Route125_Text_1C1002
	loadptr 0, Route125_Text_1C1013
	callstd 6
	end

Route125_EventScript_151F45:: @ 8151F45
	trainerbattle 0, 162, 0, Route125_Text_1C104B, Route125_Text_1C1073
	loadptr 0, Route125_Text_1C1083
	callstd 6
	end

Route125_EventScript_151F5C:: @ 8151F5C
	trainerbattle 0, 451, 0, Route125_Text_1C10C3, Route125_Text_1C10FB
	loadptr 0, Route125_Text_1C110C
	callstd 6
	end

Route125_EventScript_151F73:: @ 8151F73
	trainerbattle 0, 452, 0, Route125_Text_1C1136, Route125_Text_1C1175
	loadptr 0, Route125_Text_1C117F
	callstd 6
	end

Route125_EventScript_151F8A:: @ 8151F8A
	trainerbattle 0, 492, 0, Route125_Text_1C11AF, Route125_Text_1C11ED
	specialval RESULT, 57
	compare RESULT, 1
	jumpeq Route125_EventScript_151FB1
	loadptr 0, Route125_Text_1C1208
	callstd 6
	end

Route125_EventScript_151FB1:: @ 8151FB1
	trainerbattle 5, 492, 0, Route125_Text_1C1282, Route125_Text_1C12C5
	loadptr 0, Route125_Text_1C12EE
	callstd 6
	end

Route125_EventScript_151FC8:: @ 8151FC8
	trainerbattle 4, 678, 0, Route125_Text_1C13A1, Route125_Text_1C13FF, Route125_Text_1C146E
	loadptr 0, Route125_Text_1C141C
	callstd 6
	end

Route125_EventScript_151FE3:: @ 8151FE3
	trainerbattle 4, 678, 0, Route125_Text_1C14AB, Route125_Text_1C14E7, Route125_Text_1C154F
	loadptr 0, Route125_Text_1C1508
	callstd 6
	end

