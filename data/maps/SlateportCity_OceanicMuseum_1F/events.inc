SlateportCity_OceanicMuseum_1F_EventObjects:: @ 8387B38
	object_event 1, EVENT_OBJ_GFX_BEAUTY, 0, 7, 7, 3, MOVEMENT_TYPE_FACE_RIGHT, 0, 0, 0, 0, SlateportCity_OceanicMuseum_1F_EventScript_155ADB, 0
	object_event 2, EVENT_OBJ_GFX_VAR_1, 0, 18, 5, 3, MOVEMENT_TYPE_FACE_UP, 0, 0, 0, 0, SlateportCity_OceanicMuseum_1F_EventScript_155BA1, FLAG_HIDE_EVIL_TEAM_OCEANIC_MUSEUM
	object_event 3, EVENT_OBJ_GFX_VAR_1, 0, 12, 2, 3, MOVEMENT_TYPE_FACE_UP, 0, 0, 0, 0, SlateportCity_OceanicMuseum_1F_EventScript_155BAA, FLAG_HIDE_EVIL_TEAM_OCEANIC_MUSEUM
	object_event 4, EVENT_OBJ_GFX_VAR_1, 0, 2, 8, 3, MOVEMENT_TYPE_FACE_UP, 0, 0, 0, 0, SlateportCity_OceanicMuseum_1F_EventScript_155B98, FLAG_HIDE_EVIL_TEAM_OCEANIC_MUSEUM
	object_event 5, EVENT_OBJ_GFX_VAR_0, 0, 3, 4, 3, MOVEMENT_TYPE_FACE_LEFT, 0, 0, 0, 0, SlateportCity_OceanicMuseum_1F_EventScript_155B8F, FLAG_HIDE_EVIL_TEAM_OCEANIC_MUSEUM
	object_event 6, EVENT_OBJ_GFX_VAR_1, 0, 14, 4, 3, MOVEMENT_TYPE_FACE_RIGHT, 0, 0, 0, 0, SlateportCity_OceanicMuseum_1F_EventScript_155BB3, FLAG_HIDE_EVIL_TEAM_OCEANIC_MUSEUM
	object_event 7, EVENT_OBJ_GFX_BEAUTY, 0, 12, 7, 3, MOVEMENT_TYPE_FACE_LEFT, 0, 0, 0, 0, SlateportCity_OceanicMuseum_1F_EventScript_155ADB, 0
	object_event 8, EVENT_OBJ_GFX_VAR_1, 0, 8, 3, 3, MOVEMENT_TYPE_FACE_DOWN, 0, 0, 0, 0, SlateportCity_OceanicMuseum_1F_EventScript_155BBC, FLAG_HIDE_EVIL_TEAM_OCEANIC_MUSEUM
	object_event 9, EVENT_OBJ_GFX_WOMAN_7, 0, 4, 2, 3, MOVEMENT_TYPE_LOOK_AROUND, 1, 1, 0, 0, SlateportCity_OceanicMuseum_1F_EventScript_155C16, FLAG_HIDE_OCEANIC_MUSEUM_VISITORS
	object_event 10, EVENT_OBJ_GFX_MANIAC, 0, 10, 2, 3, MOVEMENT_TYPE_FACE_UP, 1, 1, 0, 0, SlateportCity_OceanicMuseum_1F_EventScript_155C1F, FLAG_HIDE_OCEANIC_MUSEUM_VISITORS
	object_event 11, EVENT_OBJ_GFX_MAN_3, 0, 17, 7, 3, MOVEMENT_TYPE_FACE_RIGHT, 1, 1, 0, 0, SlateportCity_OceanicMuseum_1F_EventScript_155C28, FLAG_HIDE_OCEANIC_MUSEUM_VISITORS
	object_event 12, EVENT_OBJ_GFX_LITTLE_GIRL_2, 0, 18, 8, 3, MOVEMENT_TYPE_FACE_UP, 1, 1, 0, 0, SlateportCity_OceanicMuseum_1F_EventScript_155C31, FLAG_HIDE_OCEANIC_MUSEUM_VISITORS
	object_event 13, EVENT_OBJ_GFX_VAR_1, 0, 9, 4, 3, MOVEMENT_TYPE_FACE_UP_LEFT_AND_RIGHT, 1, 1, 0, 0, SlateportCity_OceanicMuseum_1F_EventScript_155C3A, FLAG_HIDE_SCARED_GRUNT_OCEANIC_MUSEUM
	object_event 14, EVENT_OBJ_GFX_REPORTER_M, 0, 7, 4, 3, MOVEMENT_TYPE_LOOK_AROUND, 1, 1, 0, 0, SlateportCity_OceanicMuseum_1F_EventScript_1ADEE0, FLAG_HIDE_OCEANIC_MUSEUM_VISITORS

SlateportCity_OceanicMuseum_1F_MapWarps:: @ 8387C88
	warp_def 9, 8, 0, 5, MAP_SLATEPORT_CITY
	warp_def 10, 8, 0, 7, MAP_SLATEPORT_CITY
	warp_def 6, 1, 0, 0, MAP_SLATEPORT_CITY_OCEANIC_MUSEUM_2F

SlateportCity_OceanicMuseum_1F_MapCoordEvents:: @ 8387CA0
	coord_event 9, 7, 3, VAR_SLATEPORT_MUSEUM_1F_STATE, 0, SlateportCity_OceanicMuseum_1F_EventScript_155AE4
	coord_event 10, 7, 3, VAR_SLATEPORT_MUSEUM_1F_STATE, 0, SlateportCity_OceanicMuseum_1F_EventScript_155AF5

SlateportCity_OceanicMuseum_1F_MapBGEvents:: @ 8387CC0
	bg_event 2, 7, 0, BG_EVENT_PLAYER_FACING_ANY, SlateportCity_OceanicMuseum_1F_EventScript_155BC5
	bg_event 2, 4, 0, BG_EVENT_PLAYER_FACING_ANY, SlateportCity_OceanicMuseum_1F_EventScript_155BCE
	bg_event 9, 1, 0, BG_EVENT_PLAYER_FACING_ANY, SlateportCity_OceanicMuseum_1F_EventScript_155BD7
	bg_event 12, 1, 0, BG_EVENT_PLAYER_FACING_ANY, SlateportCity_OceanicMuseum_1F_EventScript_155BE0
	bg_event 10, 1, 0, BG_EVENT_PLAYER_FACING_ANY, SlateportCity_OceanicMuseum_1F_EventScript_155BD7
	bg_event 13, 1, 0, BG_EVENT_PLAYER_FACING_ANY, SlateportCity_OceanicMuseum_1F_EventScript_155BE0
	bg_event 15, 4, 0, BG_EVENT_PLAYER_FACING_ANY, SlateportCity_OceanicMuseum_1F_EventScript_155BE9
	bg_event 18, 4, 0, BG_EVENT_PLAYER_FACING_ANY, SlateportCity_OceanicMuseum_1F_EventScript_155BF2
	bg_event 18, 7, 0, BG_EVENT_PLAYER_FACING_ANY, SlateportCity_OceanicMuseum_1F_EventScript_155BFB
	bg_event 2, 1, 0, BG_EVENT_PLAYER_FACING_ANY, SlateportCity_OceanicMuseum_1F_EventScript_155C04
	bg_event 3, 1, 0, BG_EVENT_PLAYER_FACING_ANY, SlateportCity_OceanicMuseum_1F_EventScript_155C04
	bg_event 16, 1, 0, BG_EVENT_PLAYER_FACING_ANY, SlateportCity_OceanicMuseum_1F_EventScript_155C0D
	bg_event 17, 1, 0, BG_EVENT_PLAYER_FACING_ANY, SlateportCity_OceanicMuseum_1F_EventScript_155C0D

SlateportCity_OceanicMuseum_1F_MapEvents:: @ 8387D5C
	map_events SlateportCity_OceanicMuseum_1F_EventObjects, SlateportCity_OceanicMuseum_1F_MapWarps, SlateportCity_OceanicMuseum_1F_MapCoordEvents, SlateportCity_OceanicMuseum_1F_MapBGEvents
