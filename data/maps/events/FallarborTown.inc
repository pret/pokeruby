FallarborTown_EventObjects:: @ 8380E04
	object_event 1, EVENT_OBJ_GFX_GIRL_1, 0, 8, 0, 11, 0, 3, 8, 16, 0, 0, 0, 0, 0, FallarborTown_EventScript_14E814, 0, 0, 0
	object_event 2, EVENT_OBJ_GFX_OLD_MAN_1, 0, 11, 0, 9, 0, 3, 5, 1, 0, 0, 0, 0, 0, FallarborTown_EventScript_14E7F5, 0, 0, 0
	object_event 3, EVENT_OBJ_GFX_GENTLEMAN, 0, 11, 0, 15, 0, 3, 3, 17, 0, 0, 0, 0, 0, FallarborTown_EventScript_14E81D, 0, 0, 0
	object_event 4, EVENT_OBJ_GFX_AZURILL, 0, 8, 0, 12, 0, 3, 1, 1, 0, 0, 0, 0, 0, FallarborTown_EventScript_14E826, FLAG_HIDE_AZURILL_FALLARBOR, 0, 0

FallarborTown_MapWarps:: @ 8380E64
	warp_def 15, 15, 0, 0, MAP_FALLARBOR_TOWN_MART
	warp_def 8, 7, 0, 0, MAP_FALLARBOR_TOWN_CONTEST_LOBBY
	warp_def 14, 7, 0, 0, MAP_FALLARBOR_TOWN_POKEMON_CENTER_1F
	warp_def 6, 17, 0, 0, MAP_FALLARBOR_TOWN_HOUSE1
	warp_def 1, 6, 0, 0, MAP_FALLARBOR_TOWN_HOUSE2

FallarborTown_MapBGEvents:: @ 8380E8C
	bg_event 16, 15, 0, 1, 0, FallarborTown_EventScript_1A00E1
	bg_event 15, 7, 0, 1, 0, FallarborTown_EventScript_1A00EA
	bg_event 6, 8, 0, 0, 0, FallarborTown_EventScript_14E839
	bg_event 16, 7, 0, 1, 0, FallarborTown_EventScript_1A00EA
	bg_event 10, 11, 0, 0, 0, FallarborTown_EventScript_14E842
	bg_event 17, 15, 0, 1, 0, FallarborTown_EventScript_1A00E1
	bg_event 3, 7, 0, 0, 0, FallarborTown_EventScript_14E84B
	bg_hidden_item_event 2, 15, 3, ITEM_NUGGET, FLAG_HIDDEN_ITEM_1C

FallarborTown_MapEvents:: @ 8380EEC
	map_events FallarborTown_EventObjects, FallarborTown_MapWarps, 0x0, FallarborTown_MapBGEvents
