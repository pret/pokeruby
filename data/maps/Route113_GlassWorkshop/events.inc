Route113_GlassWorkshop_EventObjects:: @ 8392D18
	object_event 1, EVENT_OBJ_GFX_MAN_1, 0, 2, 3, 3, MOVEMENT_TYPE_FACE_DOWN, 0, 0, 0, 0, Route113_GlassWorkshop_EventScript_163565, 0
	object_event 2, EVENT_OBJ_GFX_LITTLE_BOY_1, 0, 5, 4, 3, MOVEMENT_TYPE_WANDER_AROUND, 1, 1, 0, 0, Route113_GlassWorkshop_EventScript_1639D6, 0

Route113_GlassWorkshop_MapWarps:: @ 8392D48
	warp_def 3, 8, 0, 0, MAP_ROUTE113
	warp_def 4, 8, 0, 0, MAP_ROUTE113

Route113_GlassWorkshop_MapEvents:: @ 8392D58
	map_events Route113_GlassWorkshop_EventObjects, Route113_GlassWorkshop_MapWarps, 0x0, 0x0
