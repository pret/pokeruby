Route105_MapScripts:: @ 814F298
	map_script 1, Route105_MapScript1_14F29E
	.byte 0

Route105_MapScript1_14F29E:: @ 814F29E
	checkflag 228
	callif 0, Route105_EventScript_14F2A8
	end

Route105_EventScript_14F2A8:: @ 814F2A8
	setmaptile 9, 19, 124, 1
	setmaptile 9, 20, 145, 1
	return

Route105_EventScript_14F2BB:: @ 814F2BB
	trainerbattle 0, 46, 0, Route105_Text_1B8B40, Route105_Text_1B8B93
	loadptr 0, Route105_Text_1B8BDE
	callstd 6
	end

Route105_EventScript_14F2D2:: @ 814F2D2
	trainerbattle 0, 151, 0, Route105_Text_1B8C28, Route105_Text_1B8C99
	loadptr 0, Route105_Text_1B8CA9
	callstd 6
	end

Route105_EventScript_14F2E9:: @ 814F2E9
	trainerbattle 0, 152, 0, Route105_Text_1B8CEE, Route105_Text_1B8D23
	loadptr 0, Route105_Text_1B8D45
	callstd 6
	end

Route105_EventScript_14F300:: @ 814F300
	trainerbattle 0, 441, 0, Route105_Text_1B8D99, Route105_Text_1B8DDD
	loadptr 0, Route105_Text_1B8DED
	callstd 6
	end

Route105_EventScript_14F317:: @ 814F317
	trainerbattle 0, 442, 0, Route105_Text_1B8E66, Route105_Text_1B8EA0
	loadptr 0, Route105_Text_1B8EBD
	callstd 6
	end

