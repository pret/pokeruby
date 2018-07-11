EverGrandeCity_MapWarps:: @ 83807DC
	warp_def 18, 5, 0, 0, MAP_EVER_GRANDE_CITY_POKEMON_LEAGUE
	warp_def 27, 48, 0, 0, MAP_EVER_GRANDE_CITY_POKEMON_CENTER_1F
	warp_def 18, 41, 0, 0, MAP_VICTORY_ROAD_1F
	warp_def 18, 27, 0, 1, MAP_VICTORY_ROAD_1F

EverGrandeCity_MapCoordEvents:: @ 83807FC
	coord_event 17, 58, 1, VAR_TEMP_1, 0, EverGrandeCity_EventScript_14D500
	coord_event 16, 58, 1, VAR_TEMP_1, 0, EverGrandeCity_EventScript_14D500
	coord_event 18, 58, 1, VAR_TEMP_1, 0, EverGrandeCity_EventScript_14D500
	coord_event 19, 58, 1, VAR_TEMP_1, 0, EverGrandeCity_EventScript_14D500
	coord_event 20, 58, 1, VAR_TEMP_1, 0, EverGrandeCity_EventScript_14D500
	coord_event 21, 58, 1, VAR_TEMP_1, 0, EverGrandeCity_EventScript_14D500
	coord_event 22, 58, 1, VAR_TEMP_1, 0, EverGrandeCity_EventScript_14D500
	coord_event 23, 58, 1, VAR_TEMP_1, 0, EverGrandeCity_EventScript_14D500
	coord_event 24, 58, 1, VAR_TEMP_1, 0, EverGrandeCity_EventScript_14D500
	coord_event 25, 58, 1, VAR_TEMP_1, 0, EverGrandeCity_EventScript_14D500
	coord_event 26, 58, 1, VAR_TEMP_1, 0, EverGrandeCity_EventScript_14D500

EverGrandeCity_MapBGEvents:: @ 83808AC
	bg_event 19, 43, 5, BG_EVENT_PLAYER_FACING_ANY, EverGrandeCity_EventScript_14D4E5
	bg_event 29, 48, 0, BG_EVENT_PLAYER_FACING_NORTH, EverGrandeCity_EventScript_1A00EA
	bg_event 18, 52, 5, BG_EVENT_PLAYER_FACING_ANY, EverGrandeCity_EventScript_14D4EE
	bg_event 23, 15, 0, BG_EVENT_PLAYER_FACING_ANY, EverGrandeCity_EventScript_14D4F7
	bg_event 28, 48, 0, BG_EVENT_PLAYER_FACING_NORTH, EverGrandeCity_EventScript_1A00EA

EverGrandeCity_MapEvents:: @ 83808E8
	map_events 0x0, EverGrandeCity_MapWarps, EverGrandeCity_MapCoordEvents, EverGrandeCity_MapBGEvents
