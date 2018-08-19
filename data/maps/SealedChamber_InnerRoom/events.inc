SealedChamber_InnerRoom_MapWarps:: @ 838E900
	warp_def 10, 19, 3, 0, MAP_SEALED_CHAMBER_OUTER_ROOM

SealedChamber_InnerRoom_MapBGEvents:: @ 838E908
	bg_event 10, 4, 0, BG_EVENT_PLAYER_FACING_ANY, SealedChamber_InnerRoom_EventScript_15F1E8
	bg_event 6, 8, 0, BG_EVENT_PLAYER_FACING_ANY, SealedChamber_InnerRoom_EventScript_15F249
	bg_event 14, 8, 0, BG_EVENT_PLAYER_FACING_ANY, SealedChamber_InnerRoom_EventScript_15F257
	bg_event 4, 13, 0, BG_EVENT_PLAYER_FACING_ANY, SealedChamber_InnerRoom_EventScript_15F265
	bg_event 16, 13, 0, BG_EVENT_PLAYER_FACING_ANY, SealedChamber_InnerRoom_EventScript_15F273
	bg_event 6, 18, 0, BG_EVENT_PLAYER_FACING_ANY, SealedChamber_InnerRoom_EventScript_15F281
	bg_event 14, 18, 0, BG_EVENT_PLAYER_FACING_ANY, SealedChamber_InnerRoom_EventScript_15F28F
	bg_event 9, 4, 0, BG_EVENT_PLAYER_FACING_ANY, SealedChamber_InnerRoom_EventScript_15F1E8
	bg_event 11, 4, 0, BG_EVENT_PLAYER_FACING_ANY, SealedChamber_InnerRoom_EventScript_15F1E8

SealedChamber_InnerRoom_MapEvents:: @ 838E974
	map_events 0x0, SealedChamber_InnerRoom_MapWarps, 0x0, SealedChamber_InnerRoom_MapBGEvents
