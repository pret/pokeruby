VictoryRoad_B2F_EventObjects:: @ 838DC18
	object_event 1, EVENT_OBJ_GFX_MAN_4, 0, 15, 6, 3, MOVEMENT_TYPE_FACE_DOWN, 1, 1, 1, 2, VictoryRoad_B2F_EventScript_15DFFB, 0
	object_event 2, EVENT_OBJ_GFX_MAN_4, 0, 43, 14, 3, MOVEMENT_TYPE_FACE_UP, 1, 1, 1, 4, VictoryRoad_B2F_EventScript_15E012, 0
	object_event 3, EVENT_OBJ_GFX_WOMAN_7, 0, 2, 17, 3, MOVEMENT_TYPE_FACE_DOWN, 1, 1, 1, 2, VictoryRoad_B2F_EventScript_15E029, 0
	object_event 4, EVENT_OBJ_GFX_WOMAN_7, 0, 35, 22, 3, MOVEMENT_TYPE_FACE_LEFT, 1, 1, 1, 2, VictoryRoad_B2F_EventScript_15E040, 0
	object_event 5, EVENT_OBJ_GFX_ITEM_BALL, 0, 13, 8, 3, MOVEMENT_TYPE_LOOK_AROUND, 1, 1, 0, 0, VictoryRoad_B2F_EventScript_1B1AFA, FLAG_ITEM_VICTORY_ROAD_B2F_1

VictoryRoad_B2F_MapWarps:: @ 838DC90
	warp_def 30, 25, 3, 0, MAP_VICTORY_ROAD_B1F
	warp_def 43, 2, 3, 3, MAP_VICTORY_ROAD_B1F
	warp_def 19, 12, 3, 1, MAP_VICTORY_ROAD_B1F
	warp_def 5, 26, 3, 6, MAP_VICTORY_ROAD_B1F

VictoryRoad_B2F_MapBGEvents:: @ 838DCB0
	bg_hidden_item_event 28, 5, 3, ITEM_ELIXIR, FLAG_HIDDEN_ITEM_52
	bg_hidden_item_event 37, 1, 3, ITEM_MAX_REPEL, FLAG_HIDDEN_ITEM_53

VictoryRoad_B2F_MapEvents:: @ 838DCC8
	map_events VictoryRoad_B2F_EventObjects, VictoryRoad_B2F_MapWarps, 0x0, VictoryRoad_B2F_MapBGEvents
