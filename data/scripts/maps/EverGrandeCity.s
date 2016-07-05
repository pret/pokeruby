EverGrandeCity_MapScripts:: @ 814D4D5
	map_script 3, EverGrandeCity_MapScript1_14D4DB
	.byte 0

EverGrandeCity_MapScript1_14D4DB:: @ 814D4DB
	checkflag 2090
	callif 1, EverGrandeCity_EventScript_1A02C1
	end

EverGrandeCity_EventScript_14D4E5:: @ 814D4E5
	msgbox EverGrandeCity_Text_16A74D, 3
	end

EverGrandeCity_EventScript_14D4EE:: @ 814D4EE
	msgbox EverGrandeCity_Text_16A787, 3
	end

EverGrandeCity_EventScript_14D4F7:: @ 814D4F7
	msgbox EverGrandeCity_Text_16A763, 3
	end

EverGrandeCity_EventScript_14D500:: @ 814D500
	setflag 2078
	setvar 0x4001, 1
	end
