Route104_Prototype_MapObjects:: @ 8391F2C
	object_event 1, MAP_OBJ_GFX_WOMAN_3, 0, 27, 0, 9, 0, 3, 23, 0, 0, 1, 0, 1, 0, Route104_Prototype_EventScript_160D2E, 0, 0, 0
	object_event 2, MAP_OBJ_GFX_LITTLE_GIRL_1, 0, 13, 0, 9, 0, 3, 10, 0, 0, 1, 0, 0, 0, Route104_Prototype_EventScript_160D60, 0, 0, 0
	object_event 3, MAP_OBJ_GFX_LITTLE_GIRL_1, 0, 13, 0, 10, 0, 3, 10, 0, 0, 1, 0, 0, 0, Route104_Prototype_EventScript_160D60, 0, 0, 0
	object_event 4, MAP_OBJ_GFX_HIKER, 0, 25, 0, 21, 0, 3, 8, 0, 0, 1, 0, 1, 0, Route104_Prototype_EventScript_160D7B, 0, 0, 0
	object_event 5, MAP_OBJ_GFX_WOMAN_3, 0, 16, 0, 30, 0, 3, 24, 0, 0, 1, 0, 1, 0, Route104_Prototype_EventScript_160D92, 0, 0, 0
	object_event 6, MAP_OBJ_GFX_HIKER, 0, 34, 0, 2, 0, 3, 8, 0, 0, 1, 0, 3, 0, Route104_Prototype_EventScript_160DA9, 0, 0, 0
	object_event 7, MAP_OBJ_GFX_BOY_1, 0, 15, 0, 4, 0, 3, 8, 0, 0, 0, 0, 0, 0, Route104_Prototype_EventScript_160C4B, 0, 0, 0
	object_event 8, MAP_OBJ_GFX_GIRL_1, 0, 14, 0, 4, 0, 3, 8, 0, 0, 0, 0, 0, 0, Route104_Prototype_EventScript_160CA3, 0, 0, 0
	object_event 9, MAP_OBJ_GFX_LITTLE_GIRL_1, 0, 27, 0, 29, 0, 3, 8, 0, 0, 1, 0, 0, 0, Route104_Prototype_EventScript_160D45, 0, 0, 0
	object_event 10, MAP_OBJ_GFX_LITTLE_GIRL_1, 0, 26, 0, 29, 0, 3, 8, 0, 0, 1, 0, 0, 0, Route104_Prototype_EventScript_160D45, 0, 0, 0
	object_event 11, MAP_OBJ_GFX_BOY_1, 0, 17, 0, 37, 0, 3, 7, 0, 0, 0, 0, 0, 0, Route104_Prototype_EventScript_160D13, 0, 0, 0
	object_event 12, MAP_OBJ_GFX_MAN_3, 0, 11, 0, 28, 0, 3, 2, 17, 0, 0, 0, 0, 0, Route104_Prototype_EventScript_160D0A, 0, 0, 0

Route104_Prototype_MapWarps:: @ 839204C
	warp_def 5, 24, 0, 0, MAP_ROUTE104_PROTOTYPE_PRETTY_PETAL_FLOWER_SHOP

Route104_Prototype_MapBGEvents:: @ 8392054
	bg_event 7, 26, 0, 0, 0, Route104_Prototype_EventScript_160D1C
	bg_event 18, 8, 0, 0, 0, Route104_Prototype_EventScript_160D25

Route104_Prototype_MapEvents:: @ 839206C
	map_events Route104_Prototype_MapObjects, Route104_Prototype_MapWarps, 0x0, Route104_Prototype_MapBGEvents
