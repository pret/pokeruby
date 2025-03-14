EverGrandeCity_Corridor5_MapScripts:: @ 815BA60
	map_script MAP_SCRIPT_ON_WARP_INTO_MAP_TABLE, EverGrandeCity_Corridor5_OnWarp
	.byte 0

EverGrandeCity_Corridor5_OnWarp:: @ 815BA66
	map_script_2 VAR_TEMP_1, 0, EverGrandeCity_Corridor5_EventScript_TurnPlayerNorth
	.2byte 0

EverGrandeCity_Corridor5_EventScript_TurnPlayerNorth:: @ 815BA70
	turnobject OBJ_EVENT_ID_PLAYER, 2
	end
