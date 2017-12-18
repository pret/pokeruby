VictoryRoad_B2F_MapObjects:: @ 838DC18
	object_event 1, MAP_OBJ_GFX_MAN_4, 0, 15, 0, 6, 0, 3, 8, 17, 0, 1, 0, 2, 0, VictoryRoad_B2F_EventScript_15DFFB, 0, 0, 0
	object_event 2, MAP_OBJ_GFX_MAN_4, 0, 43, 0, 14, 0, 3, 7, 17, 0, 1, 0, 4, 0, VictoryRoad_B2F_EventScript_15E012, 0, 0, 0
	object_event 3, MAP_OBJ_GFX_WOMAN_7, 0, 2, 0, 17, 0, 3, 8, 17, 0, 1, 0, 2, 0, VictoryRoad_B2F_EventScript_15E029, 0, 0, 0
	object_event 4, MAP_OBJ_GFX_WOMAN_7, 0, 35, 0, 22, 0, 3, 9, 17, 0, 1, 0, 2, 0, VictoryRoad_B2F_EventScript_15E040, 0, 0, 0
	object_event 5, MAP_OBJ_GFX_ITEM_BALL, 0, 13, 0, 8, 0, 3, 1, 17, 0, 0, 0, 0, 0, VictoryRoad_B2F_EventScript_1B1AFA, FLAG_ITEM_VICTORY_ROAD_B2F_1, 0, 0

VictoryRoad_B2F_MapWarps:: @ 838DC90
	warp_def 30, 25, 3, 0, MAP_VICTORY_ROAD_B1F
	warp_def 43, 2, 3, 3, MAP_VICTORY_ROAD_B1F
	warp_def 19, 12, 3, 1, MAP_VICTORY_ROAD_B1F
	warp_def 5, 26, 3, 6, MAP_VICTORY_ROAD_B1F

VictoryRoad_B2F_MapBGEvents:: @ 838DCB0
	bg_event 28, 5, 3, 7, 0, ITEM_ELIXIR, 82, 0
	bg_event 37, 1, 3, 7, 0, ITEM_MAX_REPEL, 83, 0

VictoryRoad_B2F_MapEvents:: @ 838DCC8
	map_events VictoryRoad_B2F_MapObjects, VictoryRoad_B2F_MapWarps, 0x0, VictoryRoad_B2F_MapBGEvents
