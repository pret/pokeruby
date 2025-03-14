EverGrandeCity_Corridor4_MapScripts:: @ 815BA4B
	map_script MAP_SCRIPT_ON_WARP_INTO_MAP_TABLE, EverGrandeCity_Corridor4_OnWarp
	.byte 0

EverGrandeCity_Corridor4_OnWarp:: @ 815BA51
	map_script_2 VAR_TEMP_1, 0, EverGrandeCity_Corridor4_TurnPlayerNorth
	.2byte 0

EverGrandeCity_Corridor4_TurnPlayerNorth:: @ 815BA5B
	turnobject OBJ_EVENT_ID_PLAYER, 2
	end
