SlateportCity_OceanicMuseum_2F_EventObjects:: @ 8387D70
	object_event 1, EVENT_OBJ_GFX_SCIENTIST_1, 0, 13, 6, 3, MOVEMENT_TYPE_FACE_DOWN, 0, 0, 0, 0, SlateportCity_OceanicMuseum_2F_EventScript_155CE6, FLAG_HIDE_STERN_OCEANIC_MUSEUM_2F
	object_event 2, EVENT_OBJ_GFX_VAR_6, 0, 6, 1, 3, MOVEMENT_TYPE_FACE_DOWN, 0, 0, 0, 0, 0x0, FLAG_HIDE_EVIL_TEAM_LEADER_OCEANIC_MUSEUM_2F
	object_event 3, EVENT_OBJ_GFX_VAR_1, 0, 6, 1, 3, MOVEMENT_TYPE_FACE_DOWN, 0, 0, 0, 0, 0x0, FLAG_HIDE_GRUNT_1_OCEANIC_MUSEUM_2F
	object_event 4, EVENT_OBJ_GFX_VAR_1, 0, 6, 1, 3, MOVEMENT_TYPE_FACE_DOWN, 0, 0, 0, 0, 0x0, FLAG_HIDE_GRUNT_2_OCEANIC_MUSEUM_2F
	object_event 5, EVENT_OBJ_GFX_OLD_MAN_2, 0, 12, 7, 3, MOVEMENT_TYPE_FACE_RIGHT, 1, 1, 0, 0, SlateportCity_OceanicMuseum_2F_EventScript_155F34, FLAG_HIDE_OCEANIC_MUSEUM_VISITORS
	object_event 6, EVENT_OBJ_GFX_WOMAN_2, 0, 9, 6, 3, MOVEMENT_TYPE_LOOK_AROUND, 1, 1, 0, 0, SlateportCity_OceanicMuseum_2F_EventScript_155F3D, FLAG_HIDE_OCEANIC_MUSEUM_VISITORS
	object_event 7, EVENT_OBJ_GFX_LITTLE_BOY_1, 0, 1, 3, 3, MOVEMENT_TYPE_FACE_RIGHT, 1, 1, 0, 0, SlateportCity_OceanicMuseum_2F_EventScript_155F46, FLAG_HIDE_OCEANIC_MUSEUM_VISITORS

SlateportCity_OceanicMuseum_2F_MapWarps:: @ 8387E18
	warp_def 6, 1, 0, 2, MAP_SLATEPORT_CITY_OCEANIC_MUSEUM_1F

SlateportCity_OceanicMuseum_2F_MapBGEvents:: @ 8387E20
	bg_event 18, 4, 0, BG_EVENT_PLAYER_FACING_ANY, SlateportCity_OceanicMuseum_2F_EventScript_155EDA
	bg_event 18, 7, 0, BG_EVENT_PLAYER_FACING_ANY, SlateportCity_OceanicMuseum_2F_EventScript_155EE3
	bg_event 4, 3, 0, BG_EVENT_PLAYER_FACING_ANY, SlateportCity_OceanicMuseum_2F_EventScript_155F22
	bg_event 4, 4, 0, BG_EVENT_PLAYER_FACING_ANY, SlateportCity_OceanicMuseum_2F_EventScript_155F22
	bg_event 3, 3, 0, BG_EVENT_PLAYER_FACING_ANY, SlateportCity_OceanicMuseum_2F_EventScript_155F19
	bg_event 2, 3, 0, BG_EVENT_PLAYER_FACING_ANY, SlateportCity_OceanicMuseum_2F_EventScript_155F19
	bg_event 3, 4, 0, BG_EVENT_PLAYER_FACING_ANY, SlateportCity_OceanicMuseum_2F_EventScript_155F19
	bg_event 3, 6, 0, BG_EVENT_PLAYER_FACING_ANY, SlateportCity_OceanicMuseum_2F_EventScript_155F10
	bg_event 4, 6, 0, BG_EVENT_PLAYER_FACING_ANY, SlateportCity_OceanicMuseum_2F_EventScript_155F10
	bg_event 13, 7, 0, BG_EVENT_PLAYER_FACING_ANY, SlateportCity_OceanicMuseum_2F_EventScript_155F2B
	bg_event 14, 7, 3, BG_EVENT_PLAYER_FACING_ANY, SlateportCity_OceanicMuseum_2F_EventScript_155F2B
	bg_event 18, 1, 0, BG_EVENT_PLAYER_FACING_ANY, SlateportCity_OceanicMuseum_2F_EventScript_155F07
	bg_event 19, 1, 0, BG_EVENT_PLAYER_FACING_ANY, SlateportCity_OceanicMuseum_2F_EventScript_155F07
	bg_event 15, 1, 0, BG_EVENT_PLAYER_FACING_ANY, SlateportCity_OceanicMuseum_2F_EventScript_155EFE
	bg_event 16, 1, 0, BG_EVENT_PLAYER_FACING_ANY, SlateportCity_OceanicMuseum_2F_EventScript_155EFE
	bg_event 8, 1, 0, BG_EVENT_PLAYER_FACING_ANY, SlateportCity_OceanicMuseum_2F_EventScript_155EF5
	bg_event 9, 1, 0, BG_EVENT_PLAYER_FACING_ANY, SlateportCity_OceanicMuseum_2F_EventScript_155EF5
	bg_event 12, 1, 0, BG_EVENT_PLAYER_FACING_ANY, SlateportCity_OceanicMuseum_2F_EventScript_155EEC
	bg_event 13, 1, 0, BG_EVENT_PLAYER_FACING_ANY, SlateportCity_OceanicMuseum_2F_EventScript_155EEC
	bg_event 3, 7, 0, BG_EVENT_PLAYER_FACING_ANY, SlateportCity_OceanicMuseum_2F_EventScript_155F10
	bg_event 4, 7, 0, BG_EVENT_PLAYER_FACING_ANY, SlateportCity_OceanicMuseum_2F_EventScript_155F10

SlateportCity_OceanicMuseum_2F_MapEvents:: @ 8387F1C
	map_events SlateportCity_OceanicMuseum_2F_EventObjects, SlateportCity_OceanicMuseum_2F_MapWarps, 0x0, SlateportCity_OceanicMuseum_2F_MapBGEvents
