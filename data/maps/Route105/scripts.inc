Route105_MapScripts:: @ 814F298
	map_script 1, Route105_MapScript1_14F29E
	.byte 0

Route105_MapScript1_14F29E:: @ 814F29E
	call_if_unset FLAG_REGI_DOORS_OPENED, Route105_EventScript_14F2A8
	end

Route105_EventScript_14F2A8:: @ 814F2A8
	setmetatile 9, 19, 124, 1
	setmetatile 9, 20, 145, 1
	return

Route105_EventScript_14F2BB:: @ 814F2BB
	trainerbattle 0, TRAINER_FOSTER, 0, Route105_Text_1B8B40, Route105_Text_1B8B93
	msgbox Route105_Text_1B8BDE, 6
	end

Route105_EventScript_14F2D2:: @ 814F2D2
	trainerbattle 0, TRAINER_LUIS, 0, Route105_Text_1B8C28, Route105_Text_1B8C99
	msgbox Route105_Text_1B8CA9, 6
	end

Route105_EventScript_14F2E9:: @ 814F2E9
	trainerbattle 0, TRAINER_AUSTIN, 0, Route105_Text_1B8CEE, Route105_Text_1B8D23
	msgbox Route105_Text_1B8D45, 6
	end

Route105_EventScript_14F300:: @ 814F300
	trainerbattle 0, TRAINER_BEVERLY, 0, Route105_Text_1B8D99, Route105_Text_1B8DDD
	msgbox Route105_Text_1B8DED, 6
	end

Route105_EventScript_14F317:: @ 814F317
	trainerbattle 0, TRAINER_DAWN, 0, Route105_Text_1B8E66, Route105_Text_1B8EA0
	msgbox Route105_Text_1B8EBD, 6
	end
