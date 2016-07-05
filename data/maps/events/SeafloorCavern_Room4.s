SeafloorCavern_Room4_MapObjects:: @ 838D384
	object_event 1, 241, 0, 4, 0, 8, 0, 3, 23, 17, 0, 1, 0, 3, 0, SeafloorCavern_Room4_EventScript_15DACB, 946, 0, 0

SeafloorCavern_Room4_MapWarps:: @ 838D39C
	warp_def 13, 1, 3, 1, SeafloorCavern_Room2
	warp_def 4, 1, 3, 1, SeafloorCavern_Room5
	warp_def 9, 10, 3, 2, SeafloorCavern_Room5
	warp_def 10, 15, 3, 1, SeafloorCavern_Entrance

SeafloorCavern_Room4_MapEvents:: @ 838D3BC
	map_events SeafloorCavern_Room4_MapObjects, SeafloorCavern_Room4_MapWarps, 0x0, 0x0
