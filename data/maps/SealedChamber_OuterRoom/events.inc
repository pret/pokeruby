SealedChamber_OuterRoom_MapWarps:: @ 838E788
	warp_def 10, 2, 3, 0, MAP_SEALED_CHAMBER_INNER_ROOM

SealedChamber_OuterRoom_MapBGEvents:: @ 838E790
	bg_event 5, 6, 0, BG_EVENT_PLAYER_FACING_ANY, SealedChamber_OuterRoom_EventScript_15F12C
	bg_event 5, 9, 0, BG_EVENT_PLAYER_FACING_ANY, SealedChamber_OuterRoom_EventScript_15F13A
	bg_event 5, 12, 0, BG_EVENT_PLAYER_FACING_ANY, SealedChamber_OuterRoom_EventScript_15F148
	bg_event 5, 15, 0, BG_EVENT_PLAYER_FACING_ANY, SealedChamber_OuterRoom_EventScript_15F156
	bg_event 11, 6, 0, BG_EVENT_PLAYER_FACING_ANY, SealedChamber_OuterRoom_EventScript_15F164
	bg_event 11, 9, 0, BG_EVENT_PLAYER_FACING_ANY, SealedChamber_OuterRoom_EventScript_15F172
	bg_event 11, 12, 0, BG_EVENT_PLAYER_FACING_ANY, SealedChamber_OuterRoom_EventScript_15F180
	bg_event 11, 15, 0, BG_EVENT_PLAYER_FACING_ANY, SealedChamber_OuterRoom_EventScript_15F19C
	bg_event 16, 6, 0, BG_EVENT_PLAYER_FACING_ANY, SealedChamber_OuterRoom_EventScript_15F18E
	bg_event 16, 9, 0, BG_EVENT_PLAYER_FACING_ANY, SealedChamber_OuterRoom_EventScript_15F1AA
	bg_event 10, 2, 0, BG_EVENT_PLAYER_FACING_ANY, SealedChamber_OuterRoom_EventScript_15F1B8
	bg_event 6, 6, 0, BG_EVENT_PLAYER_FACING_ANY, SealedChamber_OuterRoom_EventScript_15F12C
	bg_event 4, 6, 0, BG_EVENT_PLAYER_FACING_ANY, SealedChamber_OuterRoom_EventScript_15F12C
	bg_event 4, 9, 0, BG_EVENT_PLAYER_FACING_ANY, SealedChamber_OuterRoom_EventScript_15F13A
	bg_event 6, 9, 0, BG_EVENT_PLAYER_FACING_ANY, SealedChamber_OuterRoom_EventScript_15F13A
	bg_event 4, 12, 0, BG_EVENT_PLAYER_FACING_ANY, SealedChamber_OuterRoom_EventScript_15F148
	bg_event 6, 12, 0, BG_EVENT_PLAYER_FACING_ANY, SealedChamber_OuterRoom_EventScript_15F148
	bg_event 4, 15, 0, BG_EVENT_PLAYER_FACING_ANY, SealedChamber_OuterRoom_EventScript_15F156
	bg_event 6, 15, 0, BG_EVENT_PLAYER_FACING_ANY, SealedChamber_OuterRoom_EventScript_15F156
	bg_event 10, 6, 0, BG_EVENT_PLAYER_FACING_ANY, SealedChamber_OuterRoom_EventScript_15F164
	bg_event 12, 6, 0, BG_EVENT_PLAYER_FACING_ANY, SealedChamber_OuterRoom_EventScript_15F164
	bg_event 10, 9, 0, BG_EVENT_PLAYER_FACING_ANY, SealedChamber_OuterRoom_EventScript_15F172
	bg_event 12, 9, 0, BG_EVENT_PLAYER_FACING_ANY, SealedChamber_OuterRoom_EventScript_15F172
	bg_event 10, 12, 0, BG_EVENT_PLAYER_FACING_ANY, SealedChamber_OuterRoom_EventScript_15F180
	bg_event 12, 12, 0, BG_EVENT_PLAYER_FACING_ANY, SealedChamber_OuterRoom_EventScript_15F180
	bg_event 10, 15, 0, BG_EVENT_PLAYER_FACING_ANY, SealedChamber_OuterRoom_EventScript_15F19C
	bg_event 12, 15, 0, BG_EVENT_PLAYER_FACING_ANY, SealedChamber_OuterRoom_EventScript_15F19C
	bg_event 9, 2, 0, BG_EVENT_PLAYER_FACING_ANY, SealedChamber_OuterRoom_EventScript_15F1D9
	bg_event 11, 2, 0, BG_EVENT_PLAYER_FACING_ANY, SealedChamber_OuterRoom_EventScript_15F1D9

SealedChamber_OuterRoom_MapEvents:: @ 838E8EC
	map_events 0x0, SealedChamber_OuterRoom_MapWarps, 0x0, SealedChamber_OuterRoom_MapBGEvents
