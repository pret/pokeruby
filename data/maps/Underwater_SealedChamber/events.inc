Underwater_SealedChamber_MapWarps:: @ 838E760
	warp_def 7, 1, 0, 0, MAP_UNDERWATER_ROUTE134

Underwater_SealedChamber_MapBGEvents:: @ 838E768
	bg_event 12, 43, 0, BG_EVENT_PLAYER_FACING_ANY, Underwater_SealedChamber_EventScript_15F0B8

Underwater_SealedChamber_MapEvents:: @ 838E774
	map_events 0x0, Underwater_SealedChamber_MapWarps, 0x0, Underwater_SealedChamber_MapBGEvents
