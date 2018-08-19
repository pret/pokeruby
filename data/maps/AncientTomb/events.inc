AncientTomb_EventObjects:: @ 838E6DC
	object_event 1, EVENT_OBJ_GFX_REGISTEEL, 0, 8, 7, 3, MOVEMENT_TYPE_FACE_DOWN, 0, 0, 0, 0, AncientTomb_EventScript_15F050, FLAG_HIDE_REGISTEEL

AncientTomb_MapWarps:: @ 838E6F4
	warp_def 8, 29, 3, 0, MAP_ROUTE120
	warp_def 8, 20, 0, 2, MAP_ANCIENT_TOMB
	warp_def 8, 11, 3, 1, MAP_ANCIENT_TOMB

AncientTomb_MapBGEvents:: @ 838E70C
	bg_event 8, 20, 0, BG_EVENT_PLAYER_FACING_ANY, AncientTomb_EventScript_15F021
	bg_event 7, 20, 0, BG_EVENT_PLAYER_FACING_ANY, AncientTomb_EventScript_15F042
	bg_event 9, 20, 0, BG_EVENT_PLAYER_FACING_ANY, AncientTomb_EventScript_15F042

AncientTomb_MapEvents:: @ 838E730
	map_events AncientTomb_EventObjects, AncientTomb_MapWarps, 0x0, AncientTomb_MapBGEvents
