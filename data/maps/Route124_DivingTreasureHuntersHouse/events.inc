Route124_DivingTreasureHuntersHouse_EventObjects:: @ 839300C
	object_event 1, EVENT_OBJ_GFX_MAN_6, 0, 5, 4, 0, MOVEMENT_TYPE_FACE_LEFT, 0, 0, 0, 0, Route124_DivingTreasureHuntersHouse_EventScript_163E04, 0

Route124_DivingTreasureHuntersHouse_MapWarps:: @ 8393024
	warp_def 3, 8, 0, 0, MAP_ROUTE124
	warp_def 4, 8, 0, 0, MAP_ROUTE124

Route124_DivingTreasureHuntersHouse_MapBGEvents:: @ 8393034
	bg_event 7, 1, 0, BG_EVENT_PLAYER_FACING_ANY, Route124_DivingTreasureHuntersHouse_EventScript_164335

Route124_DivingTreasureHuntersHouse_MapEvents:: @ 8393040
	map_events Route124_DivingTreasureHuntersHouse_EventObjects, Route124_DivingTreasureHuntersHouse_MapWarps, 0x0, Route124_DivingTreasureHuntersHouse_MapBGEvents
