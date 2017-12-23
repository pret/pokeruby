Route121_SafariZoneEntrance_MapObjects:: @ 838BA34
	object_event 1, MAP_OBJ_GFX_PICNICKER, 0, 17, 0, 9, 0, 3, 9, 0, 0, 0, 0, 0, 0, Route121_SafariZoneEntrance_EventScript_15C351, 0, 0, 0
	object_event 2, MAP_OBJ_GFX_CAMPER, 0, 10, 0, 2, 0, 3, 8, 0, 0, 0, 0, 0, 0, Route121_SafariZoneEntrance_EventScript_15C35A, 0, 0, 0
	object_event 3, MAP_OBJ_GFX_CAMPER, 0, 8, 0, 2, 0, 3, 8, 0, 0, 0, 0, 0, 0, 0x0, 0, 0, 0

Route121_SafariZoneEntrance_MapWarps:: @ 838BA7C
	warp_def 2, 5, 0, 0, MAP_SAFARI_ZONE_SOUTHEAST
	warp_def 3, 5, 0, 0, MAP_SAFARI_ZONE_SOUTHEAST
	warp_def 14, 13, 0, 0, MAP_ROUTE121
	warp_def 15, 13, 0, 0, MAP_ROUTE121

Route121_SafariZoneEntrance_MapCoordEvents:: @ 838BA9C
	coord_event 8, 4, 3, 0, 0x4001, 0, 0, Route121_SafariZoneEntrance_EventScript_15C383

Route121_SafariZoneEntrance_MapBGEvents:: @ 838BAAC
	bg_event 15, 1, 0, 0, 0, Route121_SafariZoneEntrance_EventScript_15C487

Route121_SafariZoneEntrance_MapEvents:: @ 838BAB8
	map_events Route121_SafariZoneEntrance_MapObjects, Route121_SafariZoneEntrance_MapWarps, Route121_SafariZoneEntrance_MapCoordEvents, Route121_SafariZoneEntrance_MapBGEvents
