SlateportCity_ContestHall_EventObjects:: @ 83878A4
	object_event 1, EVENT_OBJ_GFX_FAT_MAN, 0, 19, 15, 3, MOVEMENT_TYPE_WANDER_AROUND, 2, 2, 0, 0, SlateportCity_ContestHall_EventScript_15554C, 0
	object_event 2, EVENT_OBJ_GFX_LITTLE_BOY_1, 0, 1, 4, 3, MOVEMENT_TYPE_WANDER_AROUND, 3, 3, 0, 0, SlateportCity_ContestHall_EventScript_155555, 0
	object_event 3, EVENT_OBJ_GFX_WOMAN_4, 0, 9, 8, 3, MOVEMENT_TYPE_FACE_DOWN, 0, 0, 0, 0, SlateportCity_ContestHall_EventScript_15559F, 0
	object_event 4, EVENT_OBJ_GFX_CONTEST_JUDGE, 0, 12, 8, 3, MOVEMENT_TYPE_FACE_DOWN, 0, 0, 0, 0, SlateportCity_ContestHall_EventScript_1555B4, 0
	object_event 5, EVENT_OBJ_GFX_GIRL_1, 0, 7, 11, 3, MOVEMENT_TYPE_FACE_UP, 0, 0, 0, 0, SlateportCity_ContestHall_EventScript_1555C9, 0
	object_event 6, EVENT_OBJ_GFX_BOY_2, 0, 9, 11, 3, MOVEMENT_TYPE_FACE_UP, 0, 0, 0, 0, SlateportCity_ContestHall_EventScript_1555DE, 0
	object_event 7, EVENT_OBJ_GFX_BOY_1, 0, 11, 11, 3, MOVEMENT_TYPE_FACE_UP, 0, 0, 0, 0, SlateportCity_ContestHall_EventScript_1555F3, 0
	object_event 8, EVENT_OBJ_GFX_FAT_MAN, 0, 13, 11, 3, MOVEMENT_TYPE_FACE_UP, 0, 0, 0, 0, SlateportCity_ContestHall_EventScript_155608, 0
	object_event 9, EVENT_OBJ_GFX_MANIAC, 0, 8, 6, 3, MOVEMENT_TYPE_FACE_DOWN, 0, 0, 0, 0, SlateportCity_ContestHall_EventScript_15561D, 0
	object_event 10, EVENT_OBJ_GFX_HIKER, 0, 12, 6, 3, MOVEMENT_TYPE_FACE_DOWN, 0, 0, 0, 0, SlateportCity_ContestHall_EventScript_155632, 0
	object_event 11, EVENT_OBJ_GFX_BOY_3, 0, 5, 10, 3, MOVEMENT_TYPE_FACE_RIGHT, 0, 0, 0, 0, SlateportCity_ContestHall_EventScript_15565C, 0
	object_event 12, EVENT_OBJ_GFX_BOY_1, 0, 15, 10, 3, MOVEMENT_TYPE_FACE_LEFT, 0, 0, 0, 0, SlateportCity_ContestHall_EventScript_155647, 0
	object_event 13, EVENT_OBJ_GFX_SAILOR, 0, 0, 17, 3, MOVEMENT_TYPE_WANDER_AROUND, 1, 4, 0, 0, SlateportCity_ContestHall_EventScript_15555E, 0

SlateportCity_ContestHall_MapWarps:: @ 83879DC
	warp_def 10, 17, 0, 2, MAP_SLATEPORT_CITY_CONTEST_LOBBY
	warp_def 11, 17, 0, 2, MAP_SLATEPORT_CITY_CONTEST_LOBBY

SlateportCity_ContestHall_MapBGEvents:: @ 83879EC
	bg_event 12, 14, 3, BG_EVENT_PLAYER_FACING_ANY, SlateportCity_ContestHall_EventScript_155671
	bg_event 8, 14, 3, BG_EVENT_PLAYER_FACING_ANY, SlateportCity_ContestHall_EventScript_155671

SlateportCity_ContestHall_MapEvents:: @ 8387A04
	map_events SlateportCity_ContestHall_EventObjects, SlateportCity_ContestHall_MapWarps, 0x0, SlateportCity_ContestHall_MapBGEvents
