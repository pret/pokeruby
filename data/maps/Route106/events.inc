Route106_EventObjects:: @ 838190C
	object_event 1, EVENT_OBJ_GFX_SWIMMER_M, 0, 29, 11, 1, MOVEMENT_TYPE_WALK_LEFT_AND_RIGHT, 4, 0, 1, 3, Route106_EventScript_14F338, 0
	object_event 2, EVENT_OBJ_GFX_SWIMMER_F, 0, 18, 5, 3, MOVEMENT_TYPE_LOOK_AROUND, 0, 0, 1, 3, Route106_EventScript_14F34F, 0
	object_event 3, EVENT_OBJ_GFX_FISHERMAN, 0, 51, 14, 3, MOVEMENT_TYPE_FACE_RIGHT, 0, 0, 1, 4, Route106_EventScript_14F366, 0
	object_event 4, EVENT_OBJ_GFX_FISHERMAN, 0, 65, 14, 3, MOVEMENT_TYPE_LOOK_AROUND, 0, 0, 1, 3, Route106_EventScript_14F3A4, 0
	object_event 5, EVENT_OBJ_GFX_ITEM_BALL, 0, 29, 14, 3, MOVEMENT_TYPE_LOOK_AROUND, 0, 0, 0, 0, Route106_EventScript_1B1494, FLAG_ITEM_ROUTE106_1

Route106_MapWarps:: @ 8381984
	warp_def 48, 16, 0, 0, MAP_GRANITE_CAVE_1F

Route106_MapBGEvents:: @ 838198C
	bg_hidden_item_event 41, 11, 3, ITEM_POKE_BALL, FLAG_HIDDEN_ITEM_3F
	bg_hidden_item_event 53, 12, 0, ITEM_STARDUST, FLAG_HIDDEN_ITEM_2E
	bg_hidden_item_event 68, 15, 3, ITEM_HEART_SCALE, FLAG_HIDDEN_ITEM_2F
	bg_event 59, 13, 3, BG_EVENT_PLAYER_FACING_ANY, Route106_EventScript_14F32F

Route106_MapEvents:: @ 83819BC
	map_events Route106_EventObjects, Route106_MapWarps, 0x0, Route106_MapBGEvents
