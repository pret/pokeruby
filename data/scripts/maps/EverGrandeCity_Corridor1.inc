EverGrandeCity_Corridor1_MapScripts:: @ 815BA0C
	map_script 4, EverGrandeCity_Corridor1_MapScript2_15BA12
	.byte 0

EverGrandeCity_Corridor1_MapScript2_15BA12:: @ 815BA12
	map_script_2 VAR_TEMP_1, 0, EverGrandeCity_Corridor1_EventScript_15BA1C
	.2byte 0

EverGrandeCity_Corridor1_EventScript_15BA1C:: @ 815BA1C
	turnobject 255, 2
	end
