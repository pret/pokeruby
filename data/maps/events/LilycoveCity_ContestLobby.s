LilycoveCity_ContestLobby_MapObjects:: @ 838984C
	object_event 1, MAP_OBJ_GFX_TEALA, 0, 6, 0, 2, 0, 3, 8, 17, 0, 0, 0, 0, 0, LilycoveCity_ContestLobby_EventScript_158EB0, 0, 0, 0
	object_event 2, MAP_OBJ_GFX_TEALA, 0, 7, 0, 2, 0, 3, 8, 17, 0, 0, 0, 0, 0, LilycoveCity_ContestLobby_EventScript_158B85, 0, 0, 0
	object_event 3, MAP_OBJ_GFX_OLD_MAN_1, 0, 17, 0, 9, 0, 3, 10, 0, 0, 0, 0, 0, 0, LilycoveCity_ContestLobby_EventScript_1B77AB, 0, 0, 0
	object_event 4, MAP_OBJ_GFX_ARTIST, 0, 1, 0, 1, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0x0, 774, 0, 0
	object_event 5, MAP_OBJ_GFX_BLACK_BELT, 0, 14, 0, 6, 0, 3, 2, 17, 0, 0, 0, 0, 0, LilycoveCity_ContestLobby_EventScript_15901E, 0, 0, 0
	object_event 6, MAP_OBJ_GFX_GIRL_2, 0, 3, 0, 10, 0, 3, 2, 34, 0, 0, 0, 0, 0, LilycoveCity_ContestLobby_EventScript_159027, 0, 0, 0
	object_event 7, MAP_OBJ_GFX_ARTIST, 0, 20, 0, 2, 0, 3, 2, 17, 0, 0, 0, 0, 0, LilycoveCity_ContestLobby_EventScript_159042, 0, 0, 0
	object_event 8, MAP_OBJ_GFX_REPORTER_M, 0, 8, 0, 10, 0, 3, 9, 0, 0, 0, 0, 0, 0, LilycoveCity_ContestLobby_EventScript_1AE0B6, 802, 0, 0
	object_event 9, MAP_OBJ_GFX_BOY_1, 0, 18, 0, 8, 0, 3, 8, 0, 0, 0, 0, 0, 0, LilycoveCity_ContestLobby_EventScript_15907B, 0, 0, 0
	object_event 10, MAP_OBJ_GFX_GIRL_1, 0, 19, 0, 9, 0, 3, 9, 0, 0, 0, 0, 0, 0, LilycoveCity_ContestLobby_EventScript_159084, 0, 0, 0
	object_event 11, MAP_OBJ_GFX_ARTIST, 0, 13, 0, 1, 0, 0, 8, 0, 0, 0, 0, 0, 0, 0x0, 895, 0, 0
	object_event 12, MAP_OBJ_GFX_FISHERMAN, 0, 13, 0, 10, 0, 3, 2, 17, 0, 0, 0, 0, 0, LilycoveCity_ContestLobby_EventScript_159054, 0, 0, 0
	object_event 13, MAP_OBJ_GFX_FAT_MAN, 0, 1, 0, 6, 0, 3, 10, 0, 0, 0, 0, 0, 0, LilycoveCity_ContestLobby_EventScript_15904B, 0, 0, 0
	object_event 14, MAP_OBJ_GFX_LITTLE_BOY_1, 0, 7, 0, 7, 0, 3, 3, 16, 0, 0, 0, 0, 0, LilycoveCity_ContestLobby_EventScript_15905D, 0, 0, 0

LilycoveCity_ContestLobby_MapWarps:: @ 838999C
	warp_def 6, 11, 0, 4, LilycoveCity
	warp_def 7, 11, 0, 4, LilycoveCity
	warp_def 1, 1, 0, 0, LilycoveCity_ContestHall
	warp_def 13, 1, 0, 1, LilycoveCity_ContestHall

LilycoveCity_ContestLobby_MapBGEvents:: @ 83899BC
	bg_event 18, 5, 0, 0, 0, LilycoveCity_ContestLobby_EventScript_1B7835
	bg_event 18, 9, 0, 0, 0, LilycoveCity_ContestLobby_EventScript_1B7659
	bg_event 15, 1, 0, 0, 0, LilycoveCity_ContestLobby_EventScript_159066
	bg_event 17, 1, 0, 0, 0, LilycoveCity_ContestLobby_EventScript_15906D
	bg_event 19, 1, 0, 0, 0, LilycoveCity_ContestLobby_EventScript_159074
	bg_event 22, 1, 0, 0, 0, LilycoveCity_ContestLobby_EventScript_15908D

LilycoveCity_ContestLobby_MapEvents:: @ 8389A04
	map_events LilycoveCity_ContestLobby_MapObjects, LilycoveCity_ContestLobby_MapWarps, 0x0, LilycoveCity_ContestLobby_MapBGEvents

