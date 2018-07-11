VictoryRoad_1F_EventObjects:: @ 838D8E4
	object_event 1, EVENT_OBJ_GFX_MAN_4, 0, 33, 22, 3, MOVEMENT_TYPE_FACE_DOWN, 0, 0, 1, 3, VictoryRoad_1F_EventScript_15DF6F, 0
	object_event 2, EVENT_OBJ_GFX_WOMAN_7, 0, 6, 15, 4, MOVEMENT_TYPE_FACE_LEFT, 0, 0, 1, 4, VictoryRoad_1F_EventScript_15DF9D, 0
	object_event 3, EVENT_OBJ_GFX_MAN_4, 0, 27, 34, 3, MOVEMENT_TYPE_FACE_DOWN_AND_RIGHT, 0, 0, 1, 3, VictoryRoad_1F_EventScript_15DF86, 0
	object_event 4, EVENT_OBJ_GFX_WALLY, 0, 31, 12, 3, MOVEMENT_TYPE_FACE_UP, 1, 1, 0, 0, VictoryRoad_1F_EventScript_15DF28, FLAG_HIDE_WALLY_BATTLE_VICTORY_ROAD
	object_event 5, EVENT_OBJ_GFX_ITEM_BALL, 0, 40, 26, 3, MOVEMENT_TYPE_LOOK_AROUND, 1, 1, 0, 0, VictoryRoad_1F_EventScript_1B1AC6, FLAG_ITEM_VICTORY_ROAD_1F_1
	object_event 6, EVENT_OBJ_GFX_ITEM_BALL, 0, 37, 39, 4, MOVEMENT_TYPE_LOOK_AROUND, 1, 1, 0, 0, VictoryRoad_1F_EventScript_1B1AD3, FLAG_ITEM_VICTORY_ROAD_1F_2
	object_event 7, EVENT_OBJ_GFX_WALLY, 0, 31, 9, 3, MOVEMENT_TYPE_LOOK_AROUND, 1, 1, 0, 0, VictoryRoad_1F_EventScript_15DF31, FLAG_HIDE_WALLY_DEFEATED_VICTORY_ROAD

VictoryRoad_1F_MapWarps:: @ 838D98C
	warp_def 15, 40, 3, 2, MAP_EVER_GRANDE_CITY
	warp_def 39, 5, 3, 3, MAP_EVER_GRANDE_CITY
	warp_def 21, 32, 3, 5, MAP_VICTORY_ROAD_B1F
	warp_def 42, 38, 4, 2, MAP_VICTORY_ROAD_B1F
	warp_def 9, 14, 4, 4, MAP_VICTORY_ROAD_B1F

VictoryRoad_1F_MapCoordEvents:: @ 838D9B4
	coord_event 34, 3, 3, VAR_VICTORY_ROAD_1F_STATE, 0, VictoryRoad_1F_EventScript_15DE97
	coord_event 34, 4, 3, VAR_VICTORY_ROAD_1F_STATE, 0, VictoryRoad_1F_EventScript_15DEAB
	coord_event 34, 5, 3, VAR_VICTORY_ROAD_1F_STATE, 0, VictoryRoad_1F_EventScript_15DEBF

VictoryRoad_1F_MapBGEvents:: @ 838D9E4
	bg_hidden_item_event 30, 39, 4, ITEM_ULTRA_BALL, FLAG_HIDDEN_ITEM_51

VictoryRoad_1F_MapEvents:: @ 838D9F0
	map_events VictoryRoad_1F_EventObjects, VictoryRoad_1F_MapWarps, VictoryRoad_1F_MapCoordEvents, VictoryRoad_1F_MapBGEvents
