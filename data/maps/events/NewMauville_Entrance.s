NewMauville_Entrance_MapWarps:: @ 838DED4
	warp_def 4, 6, 3, 0, Route110
	warp_def 4, 1, 3, 0, NewMauville_Inside

NewMauville_Entrance_MapCoordEvents:: @ 838DEE4
	coord_event 4, 2, 3, 0, 0x40ba, 0, 0, NewMauville_Entrance_EventScript_15E4DC

NewMauville_Entrance_MapEvents:: @ 838DEF4
	map_events 0x0, NewMauville_Entrance_MapWarps, NewMauville_Entrance_MapCoordEvents, 0x0
