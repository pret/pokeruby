Route126_MapScripts:: @ 8151FFE
	map_script 3, Route126_MapScript1_152004
	.byte 0

Route126_MapScript1_152004:: @ 8152004
	call_if_set FLAG_SYS_WEATHER_CTRL, Route126_EventScript_1A02C1
	end

Route126_EventScript_15200E:: @ 815200E
	trainerbattle 0, TRAINER_BARRY, 0, Route126_Text_1C1590, Route126_Text_1C15C3
	msgbox Route126_Text_1C15D8, 6
	end

Route126_EventScript_152025:: @ 8152025
	trainerbattle 0, TRAINER_DEAN, 0, Route126_Text_1C1627, Route126_Text_1C1660
	msgbox Route126_Text_1C166F, 6
	end

Route126_EventScript_15203C:: @ 815203C
	trainerbattle 0, TRAINER_NIKKI, 0, Route126_Text_1C16AB, Route126_Text_1C16C5
	msgbox Route126_Text_1C1702, 6
	end

Route126_EventScript_152053:: @ 8152053
	trainerbattle 0, TRAINER_BRENDA, 0, Route126_Text_1C1741, Route126_Text_1C1766
	msgbox Route126_Text_1C1773, 6
	end
