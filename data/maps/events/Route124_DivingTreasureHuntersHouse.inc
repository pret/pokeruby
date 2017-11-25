Route124_DivingTreasureHuntersHouse_MapObjects:: @ 839300C
	object_event 1, MAP_OBJ_GFX_MAN_6, 0, 5, 0, 4, 0, 0, 9, 0, 0, 0, 0, 0, 0, Route124_DivingTreasureHuntersHouse_EventScript_163E04, 0, 0, 0

Route124_DivingTreasureHuntersHouse_MapWarps:: @ 8393024
	warp_def 3, 8, 0, 0, Route124
	warp_def 4, 8, 0, 0, Route124

Route124_DivingTreasureHuntersHouse_MapBGEvents:: @ 8393034
	bg_event 7, 1, 0, 0, 0, Route124_DivingTreasureHuntersHouse_EventScript_164335

Route124_DivingTreasureHuntersHouse_MapEvents:: @ 8393040
	map_events Route124_DivingTreasureHuntersHouse_MapObjects, Route124_DivingTreasureHuntersHouse_MapWarps, 0x0, Route124_DivingTreasureHuntersHouse_MapBGEvents
