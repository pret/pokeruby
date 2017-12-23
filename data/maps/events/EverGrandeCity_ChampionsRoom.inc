EverGrandeCity_ChampionsRoom_MapObjects:: @ 838B334
	object_event 1, MAP_OBJ_GFX_STEVEN, 0, 6, 0, 5, 0, 3, 8, 0, 0, 0, 0, 0, 0, 0x0, 0, 0, 0
	object_event 2, 240, 0, 6, 0, 12, 0, 3, 7, 0, 0, 0, 0, 0, 0, 0x0, FLAG_HIDE_RIVAL_CHAMPIONS_ROOM, 0, 0
	object_event 3, MAP_OBJ_GFX_PROF_BIRCH, 0, 6, 0, 12, 0, 3, 7, 0, 0, 0, 0, 0, 0, 0x0, FLAG_HIDE_BIRCH_CHAMPIONS_ROOM, 0, 0

EverGrandeCity_ChampionsRoom_MapWarps:: @ 838B37C
	warp_def 6, 12, 3, 1, MAP_EVER_GRANDE_CITY_CORRIDOR4
	warp_def 6, 2, 0, 0, MAP_EVER_GRANDE_CITY_HALL_OF_FAME

EverGrandeCity_ChampionsRoom_MapEvents:: @ 838B38C
	map_events EverGrandeCity_ChampionsRoom_MapObjects, EverGrandeCity_ChampionsRoom_MapWarps, 0x0, 0x0
