SSTidalLowerDeck_EventObjects:: @ 8391844
	object_event 1, EVENT_OBJ_GFX_SAILOR, 0, 10, 4, 3, MOVEMENT_TYPE_WALK_SEQUENCE_DOWN_RIGHT_UP_LEFT, 4, 4, 1, 3, SSTidalLowerDeck_EventScript_15FED7, 0
	object_event 2, EVENT_OBJ_GFX_SAILOR, 0, 7, 4, 3, MOVEMENT_TYPE_WALK_SEQUENCE_DOWN_LEFT_UP_RIGHT, 7, 4, 1, 3, SSTidalLowerDeck_EventScript_15FEEE, 0

SSTidalLowerDeck_MapWarps:: @ 8391874
	warp_def 15, 2, 3, 8, MAP_SS_TIDAL_CORRIDOR

SSTidalLowerDeck_MapBGEvents:: @ 839187C
	bg_hidden_item_event 0, 2, 0, ITEM_LEFTOVERS, FLAG_HIDDEN_ITEM_23

SSTidalLowerDeck_MapEvents:: @ 8391888
	map_events SSTidalLowerDeck_EventObjects, SSTidalLowerDeck_MapWarps, 0x0, SSTidalLowerDeck_MapBGEvents
