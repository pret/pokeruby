Underwater4_MapWarps:: @ 8385640
	warp_def 38, 26, 3, 0, MAP_UNDERWATER_SEAFLOOR_CAVERN

Underwater4_MapBGEvents:: @ 8385648
	bg_hidden_item_event 38, 19, 3, ITEM_PROTEIN, FLAG_HIDDEN_ITEM_19
	bg_hidden_item_event 69, 18, 3, ITEM_PEARL, FLAG_HIDDEN_ITEM_1A

Underwater4_MapEvents:: @ 8385660
	map_events 0x0, Underwater4_MapWarps, 0x0, Underwater4_MapBGEvents
