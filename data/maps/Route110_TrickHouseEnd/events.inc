Route110_TrickHouseEnd_EventObjects:: @ 83921D0
	object_event 1, EVENT_OBJ_GFX_MAN_1, 0, 4, 5, 3, MOVEMENT_TYPE_FACE_RIGHT, 0, 0, 0, 0, Route110_TrickHouseEnd_EventScript_16199E, FLAG_HIDE_TRICKMASTER_END

Route110_TrickHouseEnd_MapWarps:: @ 83921E8
	warp_def 10, 1, 3, 2, MAP_ROUTE110_TRICK_HOUSE_PUZZLE1
	warp_def 2, 1, 3, 0, MAP_ROUTE110_TRICK_HOUSE_CORRIDOR

Route110_TrickHouseEnd_MapCoordEvents:: @ 83921F8
	coord_event 2, 2, 3, VAR_TEMP_2, 0, Route110_TrickHouseEnd_EventScript_161CA0

Route110_TrickHouseEnd_MapBGEvents:: @ 8392208
	bg_hidden_item_event 4, 5, 3, ITEM_NUGGET, FLAG_HIDDEN_ITEM_1

Route110_TrickHouseEnd_MapEvents:: @ 8392214
	map_events Route110_TrickHouseEnd_EventObjects, Route110_TrickHouseEnd_MapWarps, Route110_TrickHouseEnd_MapCoordEvents, Route110_TrickHouseEnd_MapBGEvents
