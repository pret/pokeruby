DesertRuins_EventObjects:: @ 838BEBC
	object_event 1, EVENT_OBJ_GFX_REGIROCK, 0, 8, 7, 3, MOVEMENT_TYPE_FACE_DOWN, 0, 0, 0, 0, DesertRuins_EventScript_15CB85, FLAG_HIDE_REGIROCK

DesertRuins_MapWarps:: @ 838BED4
	warp_def 8, 29, 3, 1, MAP_ROUTE111
	warp_def 8, 20, 0, 2, MAP_DESERT_RUINS
	warp_def 8, 11, 3, 1, MAP_DESERT_RUINS

DesertRuins_MapBGEvents:: @ 838BEEC
	bg_event 8, 20, 0, BG_EVENT_PLAYER_FACING_ANY, DesertRuins_EventScript_15CB56
	bg_event 7, 20, 0, BG_EVENT_PLAYER_FACING_ANY, DesertRuins_EventScript_15CB77
	bg_event 9, 20, 0, BG_EVENT_PLAYER_FACING_ANY, DesertRuins_EventScript_15CB77

DesertRuins_MapEvents:: @ 838BF10
	map_events DesertRuins_EventObjects, DesertRuins_MapWarps, 0x0, DesertRuins_MapBGEvents
