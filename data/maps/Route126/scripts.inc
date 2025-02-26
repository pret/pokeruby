Route126_MapScripts:: @ 8151FFE
	map_script MAP_SCRIPT_ON_TRANSITION, Route126_MapScript1_152004
	.byte 0

Route126_MapScript1_152004:: @ 8152004
	call_if_set FLAG_SYS_WEATHER_CTRL, Common_EventScript_SetAbnormalWeather
	end

Route126_EventScript_15200E:: @ 815200E
	trainerbattle_single TRAINER_BARRY, Route126_Text_1C1590, Route126_Text_1C15C3
	msgbox Route126_Text_1C15D8, MSGBOX_AUTOCLOSE
	end

Route126_EventScript_152025:: @ 8152025
	trainerbattle_single TRAINER_DEAN, Route126_Text_1C1627, Route126_Text_1C1660
	msgbox Route126_Text_1C166F, MSGBOX_AUTOCLOSE
	end

Route126_EventScript_15203C:: @ 815203C
	trainerbattle_single TRAINER_NIKKI, Route126_Text_1C16AB, Route126_Text_1C16C5
	msgbox Route126_Text_1C1702, MSGBOX_AUTOCLOSE
	end

Route126_EventScript_152053:: @ 8152053
	trainerbattle_single TRAINER_BRENDA, Route126_Text_1C1741, Route126_Text_1C1766
	msgbox Route126_Text_1C1773, MSGBOX_AUTOCLOSE
	end
