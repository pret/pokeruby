RustboroCity_DevonCorp_1F_EventObjects:: @ 838880C
	object_event 1, EVENT_OBJ_GFX_MAN_7, 0, 2, 6, 3, MOVEMENT_TYPE_WANDER_AROUND, 1, 1, 0, 0, RustboroCity_DevonCorp_1F_EventScript_157422, 0
	object_event 2, EVENT_OBJ_GFX_MAN_7, 0, 15, 5, 3, MOVEMENT_TYPE_WANDER_AROUND, 2, 1, 0, 0, RustboroCity_DevonCorp_1F_EventScript_157454, 0
	object_event 3, EVENT_OBJ_GFX_WOMAN_4, 0, 5, 3, 3, MOVEMENT_TYPE_FACE_DOWN, 0, 0, 0, 0, RustboroCity_DevonCorp_1F_EventScript_15748F, 0

RustboroCity_DevonCorp_1F_MapWarps:: @ 8388854
	warp_def 5, 8, 0, 5, MAP_RUSTBORO_CITY
	warp_def 6, 8, 0, 6, MAP_RUSTBORO_CITY
	warp_def 14, 1, 0, 0, MAP_RUSTBORO_CITY_DEVON_CORP_2F

RustboroCity_DevonCorp_1F_MapEvents:: @ 838886C
	map_events RustboroCity_DevonCorp_1F_EventObjects, RustboroCity_DevonCorp_1F_MapWarps, 0x0, 0x0
