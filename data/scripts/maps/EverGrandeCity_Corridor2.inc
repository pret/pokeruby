EverGrandeCity_Corridor2_MapScripts:: @ 815BA21
	map_script 4, EverGrandeCity_Corridor2_MapScript2_15BA27
	.byte 0

EverGrandeCity_Corridor2_MapScript2_15BA27:: @ 815BA27
	map_script_2 VAR_TEMP_1, 0, EverGrandeCity_Corridor2_EventScript_15BA31
	.2byte 0

EverGrandeCity_Corridor2_EventScript_15BA31:: @ 815BA31
	turnobject 255, 2
	end
