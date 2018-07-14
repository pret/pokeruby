Route123_BerryMastersHouse_EventObjects:: @ 8392D6C
	object_event 1, EVENT_OBJ_GFX_OLD_MAN_1, 0, 4, 4, 3, MOVEMENT_TYPE_FACE_DOWN, 0, 0, 0, 0, Route123_BerryMastersHouse_EventScript_1639E9, 0
	object_event 2, EVENT_OBJ_GFX_OLD_WOMAN_2, 0, 7, 4, 3, MOVEMENT_TYPE_FACE_DOWN, 0, 0, 0, 0, Route123_BerryMastersHouse_EventScript_163A64, 0

Route123_BerryMastersHouse_MapWarps:: @ 8392D9C
	warp_def 3, 7, 0, 0, MAP_ROUTE123
	warp_def 4, 7, 0, 0, MAP_ROUTE123

Route123_BerryMastersHouse_MapEvents:: @ 8392DAC
	map_events Route123_BerryMastersHouse_EventObjects, Route123_BerryMastersHouse_MapWarps, 0x0, 0x0
