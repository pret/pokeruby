DesertRuins_MapObjects:: @ 838BEBC
	object_event 1, MAP_OBJ_GFX_REGIROCK, 0, 8, 0, 7, 0, 3, 8, 0, 0, 0, 0, 0, 0, DesertRuins_EventScript_15CB85, 935, 0, 0

DesertRuins_MapWarps:: @ 838BED4
	warp_def 8, 29, 3, 1, Route111
	warp_def 8, 20, 0, 2, DesertRuins
	warp_def 8, 11, 3, 1, DesertRuins

DesertRuins_MapBGEvents:: @ 838BEEC
	bg_event 8, 20, 0, 0, 0, DesertRuins_EventScript_15CB56
	bg_event 7, 20, 0, 0, 0, DesertRuins_EventScript_15CB77
	bg_event 9, 20, 0, 0, 0, DesertRuins_EventScript_15CB77

DesertRuins_MapEvents:: @ 838BF10
	map_events DesertRuins_MapObjects, DesertRuins_MapWarps, 0x0, DesertRuins_MapBGEvents
