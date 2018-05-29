RustboroCity_DevonCorp_3F_EventObjects:: @ 838891C
	object_event 1, EVENT_OBJ_GFX_GENTLEMAN, 0, 17, 0, 5, 0, 3, 9, 0, 0, 0, 0, 0, 0, RustboroCity_DevonCorp_3F_EventScript_15783B, 0, 0, 0
	object_event 2, EVENT_OBJ_GFX_MAN_2, 0, 3, 0, 5, 0, 3, 10, 0, 0, 0, 0, 0, 0, RustboroCity_DevonCorp_3F_EventScript_1578B0, FLAG_HIDE_EMPLOYEE_DEVON_CORP_3F, 0, 0
	object_event 3, EVENT_OBJ_GFX_GENTLEMAN, 0, 15, 0, 5, 0, 3, 76, 17, 0, 0, 0, 0, 0, RustboroCity_DevonCorp_3F_EventScript_15783B, 0, 0, 0

RustboroCity_DevonCorp_3F_MapWarps:: @ 8388964
	warp_def 2, 1, 0, 1, MAP_RUSTBORO_CITY_DEVON_CORP_2F

RustboroCity_DevonCorp_3F_MapBGEvents:: @ 838896C
	bg_event 1, 5, 3, 0, 0, RustboroCity_DevonCorp_3F_EventScript_1578CF
	bg_event 1, 7, 3, 0, 0, RustboroCity_DevonCorp_3F_EventScript_1578CF

RustboroCity_DevonCorp_3F_MapEvents:: @ 8388984
	map_events RustboroCity_DevonCorp_3F_EventObjects, RustboroCity_DevonCorp_3F_MapWarps, 0x0, RustboroCity_DevonCorp_3F_MapBGEvents
