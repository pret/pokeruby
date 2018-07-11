MauvilleCity_Gym_EventObjects:: @ 838821C
	object_event 1, EVENT_OBJ_GFX_WATTSON, 0, 4, 3, 3, MOVEMENT_TYPE_FACE_DOWN, 0, 0, 0, 0, MauvilleCity_Gym_EventScript_1565AB, FLAG_HIDE_WATTSON_MAUVILLE_GYM
	object_event 2, EVENT_OBJ_GFX_MAN_6, 0, 6, 9, 3, MOVEMENT_TYPE_FACE_LEFT, 0, 0, 1, 2, MauvilleCity_Gym_EventScript_1566FD, 0
	object_event 3, EVENT_OBJ_GFX_GIRL_3, 0, 7, 11, 3, MOVEMENT_TYPE_FACE_DOWN, 0, 0, 1, 1, MauvilleCity_Gym_EventScript_15672B, 0
	object_event 4, EVENT_OBJ_GFX_YOUNGSTER, 0, 1, 13, 3, MOVEMENT_TYPE_FACE_RIGHT, 0, 0, 1, 1, MauvilleCity_Gym_EventScript_156714, 0
	object_event 5, EVENT_OBJ_GFX_MAN_6, 0, 2, 15, 3, MOVEMENT_TYPE_FACE_DOWN, 0, 0, 1, 2, MauvilleCity_Gym_EventScript_1566E6, 0
	object_event 6, EVENT_OBJ_GFX_MAN_2, 0, 7, 20, 3, MOVEMENT_TYPE_FACE_LEFT, 0, 0, 0, 0, MauvilleCity_Gym_EventScript_156742, 0

MauvilleCity_Gym_MapWarps:: @ 83882AC
	warp_def 4, 20, 0, 0, MAP_MAUVILLE_CITY
	warp_def 5, 20, 0, 0, MAP_MAUVILLE_CITY

MauvilleCity_Gym_MapCoordEvents:: @ 83882BC
	coord_event 0, 9, 3, VAR_TEMP_0, 0, MauvilleCity_Gym_EventScript_15664B
	coord_event 8, 11, 3, VAR_TEMP_0, 0, MauvilleCity_Gym_EventScript_156670
	coord_event 4, 15, 3, VAR_TEMP_0, 0, MauvilleCity_Gym_EventScript_156695

MauvilleCity_Gym_MapBGEvents:: @ 83882EC
	bg_event 3, 18, 0, BG_EVENT_PLAYER_FACING_NORTH, MauvilleCity_Gym_EventScript_156761
	bg_event 6, 18, 0, BG_EVENT_PLAYER_FACING_NORTH, MauvilleCity_Gym_EventScript_156771

MauvilleCity_Gym_MapEvents:: @ 8388304
	map_events MauvilleCity_Gym_EventObjects, MauvilleCity_Gym_MapWarps, MauvilleCity_Gym_MapCoordEvents, MauvilleCity_Gym_MapBGEvents
