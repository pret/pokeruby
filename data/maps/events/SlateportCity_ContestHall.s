SlateportCity_ContestHall_MapObjects:: @ 83878A4
	object_event 1, MAP_OBJ_GFX_FAT_MAN, 0, 19, 0, 15, 0, 3, 2, 34, 0, 0, 0, 0, 0, SlateportCity_ContestHall_EventScript_15554C, 0, 0, 0
	object_event 2, MAP_OBJ_GFX_LITTLE_BOY_1, 0, 1, 0, 4, 0, 3, 2, 51, 0, 0, 0, 0, 0, SlateportCity_ContestHall_EventScript_155555, 0, 0, 0
	object_event 3, MAP_OBJ_GFX_WOMAN_4, 0, 9, 0, 8, 0, 3, 8, 0, 0, 0, 0, 0, 0, SlateportCity_ContestHall_EventScript_15559F, 0, 0, 0
	object_event 4, MAP_OBJ_GFX_CONTEST_JUDGE, 0, 12, 0, 8, 0, 3, 8, 0, 0, 0, 0, 0, 0, SlateportCity_ContestHall_EventScript_1555B4, 0, 0, 0
	object_event 5, MAP_OBJ_GFX_GIRL_1, 0, 7, 0, 11, 0, 3, 7, 0, 0, 0, 0, 0, 0, SlateportCity_ContestHall_EventScript_1555C9, 0, 0, 0
	object_event 6, MAP_OBJ_GFX_BOY_2, 0, 9, 0, 11, 0, 3, 7, 0, 0, 0, 0, 0, 0, SlateportCity_ContestHall_EventScript_1555DE, 0, 0, 0
	object_event 7, MAP_OBJ_GFX_BOY_1, 0, 11, 0, 11, 0, 3, 7, 0, 0, 0, 0, 0, 0, SlateportCity_ContestHall_EventScript_1555F3, 0, 0, 0
	object_event 8, MAP_OBJ_GFX_FAT_MAN, 0, 13, 0, 11, 0, 3, 7, 0, 0, 0, 0, 0, 0, SlateportCity_ContestHall_EventScript_155608, 0, 0, 0
	object_event 9, MAP_OBJ_GFX_MANIAC, 0, 8, 0, 6, 0, 3, 8, 0, 0, 0, 0, 0, 0, SlateportCity_ContestHall_EventScript_15561D, 0, 0, 0
	object_event 10, MAP_OBJ_GFX_HIKER, 0, 12, 0, 6, 0, 3, 8, 0, 0, 0, 0, 0, 0, SlateportCity_ContestHall_EventScript_155632, 0, 0, 0
	object_event 11, MAP_OBJ_GFX_BOY_3, 0, 5, 0, 10, 0, 3, 10, 0, 0, 0, 0, 0, 0, SlateportCity_ContestHall_EventScript_15565C, 0, 0, 0
	object_event 12, MAP_OBJ_GFX_BOY_1, 0, 15, 0, 10, 0, 3, 9, 0, 0, 0, 0, 0, 0, SlateportCity_ContestHall_EventScript_155647, 0, 0, 0
	object_event 13, MAP_OBJ_GFX_SAILOR, 0, 0, 0, 17, 0, 3, 2, 65, 0, 0, 0, 0, 0, SlateportCity_ContestHall_EventScript_15555E, 0, 0, 0

SlateportCity_ContestHall_MapWarps:: @ 83879DC
	warp_def 10, 17, 0, 2, SlateportCity_ContestLobby
	warp_def 11, 17, 0, 2, SlateportCity_ContestLobby

SlateportCity_ContestHall_MapBGEvents:: @ 83879EC
	bg_event 12, 14, 3, 0, 0, SlateportCity_ContestHall_EventScript_155671
	bg_event 8, 14, 3, 0, 0, SlateportCity_ContestHall_EventScript_155671

SlateportCity_ContestHall_MapEvents:: @ 8387A04
	map_events SlateportCity_ContestHall_MapObjects, SlateportCity_ContestHall_MapWarps, 0x0, SlateportCity_ContestHall_MapBGEvents

