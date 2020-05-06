Route127_MapScripts:: @ 815206A
	map_script MAP_SCRIPT_ON_TRANSITION, Route127_MapScript1_152070
	.byte 0

Route127_MapScript1_152070:: @ 8152070
	call_if_set FLAG_SYS_WEATHER_CTRL, Common_EventScript_SetLegendaryWeather
	end

Route127_EventScript_15207A:: @ 815207A
	trainerbattle_single TRAINER_CALEB, Route127_Text_1C17A8, Route127_Text_1C17DD
	msgbox Route127_Text_1C17EC, MSGBOX_AUTOCLOSE
	end

Route127_EventScript_152091:: @ 8152091
	trainerbattle_single TRAINER_CONNOR, Route127_Text_1C1828, Route127_Text_1C1860
	msgbox Route127_Text_1C1877, MSGBOX_AUTOCLOSE
	end

Route127_EventScript_1520A8:: @ 81520A8
	trainerbattle_single TRAINER_JONAH, Route127_Text_1C18CC, Route127_Text_1C1930
	msgbox Route127_Text_1C195D, MSGBOX_AUTOCLOSE
	end

Route127_EventScript_1520BF:: @ 81520BF
	trainerbattle_single TRAINER_HENRY, Route127_Text_1C19A3, Route127_Text_1C19D6
	msgbox Route127_Text_1C19E7, MSGBOX_AUTOCLOSE
	end

Route127_EventScript_1520D6:: @ 81520D6
	trainerbattle_single TRAINER_ROGER, Route127_Text_1C1A2E, Route127_Text_1C1A73
	msgbox Route127_Text_1C1AA0, MSGBOX_AUTOCLOSE
	end

Route127_EventScript_1520ED:: @ 81520ED
	trainerbattle_single TRAINER_KOJI, Route127_Text_1C1AE2, Route127_Text_1C1B2A
	msgbox Route127_Text_1C1B39, MSGBOX_AUTOCLOSE
	end

Route127_EventScript_152104:: @ 8152104
	trainerbattle_single TRAINER_BYRON, Route127_Text_1C1B92, Route127_Text_1C1BD9
	msgbox Route127_Text_1C1BEC, MSGBOX_AUTOCLOSE
	end
