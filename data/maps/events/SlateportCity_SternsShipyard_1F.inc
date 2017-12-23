SlateportCity_SternsShipyard_1F_MapObjects:: @ 8387698
	object_event 1, MAP_OBJ_GFX_MAN_1, 0, 5, 0, 5, 0, 3, 8, 0, 0, 0, 0, 0, 0, SlateportCity_SternsShipyard_1F_EventScript_155336, 0, 0, 0
	object_event 2, MAP_OBJ_GFX_SCIENTIST_1, 0, 10, 0, 7, 0, 3, 7, 0, 0, 0, 0, 0, 0, SlateportCity_SternsShipyard_1F_EventScript_1553E3, 0, 0, 0
	object_event 3, MAP_OBJ_GFX_SCIENTIST_1, 0, 18, 0, 8, 0, 3, 5, 1, 0, 0, 0, 0, 0, SlateportCity_SternsShipyard_1F_EventScript_1553EC, 0, 0, 0
	object_event 4, MAP_OBJ_GFX_OLD_MAN_1, 0, 12, 0, 11, 0, 3, 2, 33, 0, 0, 0, 0, 0, SlateportCity_SternsShipyard_1F_EventScript_1553F5, FLAG_HIDE_BRINEY_SLATEPORT_SHIPYARD, 0, 0

SlateportCity_SternsShipyard_1F_MapWarps:: @ 83876F8
	warp_def 2, 14, 0, 2, MAP_SLATEPORT_CITY
	warp_def 3, 14, 0, 2, MAP_SLATEPORT_CITY
	warp_def 3, 1, 0, 0, MAP_SLATEPORT_CITY_STERNS_SHIPYARD_2F

SlateportCity_SternsShipyard_1F_MapEvents:: @ 8387710
	map_events SlateportCity_SternsShipyard_1F_MapObjects, SlateportCity_SternsShipyard_1F_MapWarps, 0x0, 0x0
