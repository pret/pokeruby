Route116_TunnelersRestHouse_EventObjects:: @ 838B98C
	object_event 1, EVENT_OBJ_GFX_MAN_3, 0, 6, 5, 3, MOVEMENT_TYPE_FACE_RIGHT, 0, 0, 0, 0, Route116_TunnelersRestHouse_EventScript_15C2E8, 0
	object_event 2, EVENT_OBJ_GFX_MAN_3, 0, 3, 6, 3, MOVEMENT_TYPE_LOOK_AROUND, 1, 1, 0, 0, Route116_TunnelersRestHouse_EventScript_15C2FA, 0
	object_event 3, EVENT_OBJ_GFX_MAN_3, 0, 7, 2, 3, MOVEMENT_TYPE_FACE_UP, 1, 0, 0, 0, Route116_TunnelersRestHouse_EventScript_15C2F1, 0

Route116_TunnelersRestHouse_MapWarps:: @ 838B9D4
	warp_def 4, 8, 0, 1, MAP_ROUTE116
	warp_def 5, 8, 0, 1, MAP_ROUTE116

Route116_TunnelersRestHouse_MapEvents:: @ 838B9E4
	map_events Route116_TunnelersRestHouse_EventObjects, Route116_TunnelersRestHouse_MapWarps, 0x0, 0x0
