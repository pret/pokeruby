Route105_MapScripts:: @ 814F298
	map_script MAP_SCRIPT_ON_LOAD, Route105_MapScript1_14F29E
	.byte 0

Route105_MapScript1_14F29E:: @ 814F29E
	call_if_unset FLAG_REGI_DOORS_OPENED, Route105_EventScript_14F2A8
	end

Route105_EventScript_14F2A8:: @ 814F2A8
	setmetatile 9, 19, METATILE_General_RockWall_RockBase, 1
	setmetatile 9, 20, METATILE_General_RockWall_SandBase, 1
	return

Route105_EventScript_14F2BB:: @ 814F2BB
	trainerbattle_single TRAINER_FOSTER, Route105_Text_1B8B40, Route105_Text_1B8B93
	msgbox Route105_Text_1B8BDE, MSGBOX_AUTOCLOSE
	end

Route105_EventScript_14F2D2:: @ 814F2D2
	trainerbattle_single TRAINER_LUIS, Route105_Text_1B8C28, Route105_Text_1B8C99
	msgbox Route105_Text_1B8CA9, MSGBOX_AUTOCLOSE
	end

Route105_EventScript_14F2E9:: @ 814F2E9
	trainerbattle_single TRAINER_AUSTIN, Route105_Text_1B8CEE, Route105_Text_1B8D23
	msgbox Route105_Text_1B8D45, MSGBOX_AUTOCLOSE
	end

Route105_EventScript_14F300:: @ 814F300
	trainerbattle_single TRAINER_BEVERLY, Route105_Text_1B8D99, Route105_Text_1B8DDD
	msgbox Route105_Text_1B8DED, MSGBOX_AUTOCLOSE
	end

Route105_EventScript_14F317:: @ 814F317
	trainerbattle_single TRAINER_DAWN, Route105_Text_1B8E66, Route105_Text_1B8EA0
	msgbox Route105_Text_1B8EBD, MSGBOX_AUTOCLOSE
	end
