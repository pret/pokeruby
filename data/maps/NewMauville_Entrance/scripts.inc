NewMauville_Entrance_MapScripts:: @ 815E48A
	map_script 1, NewMauville_Entrance_MapScript1_15E495
	map_script 3, NewMauville_Entrance_MapScript1_15E4D8
	.byte 0

NewMauville_Entrance_MapScript1_15E495:: @ 815E495
	compare VAR_NEW_MAUVILLE_STATE, 0
	call_if_eq NewMauville_Entrance_EventScript_15E4A1
	end

NewMauville_Entrance_EventScript_15E4A1:: @ 815E4A1
	setmetatile 3, 0, METATILE_Facility_NewMauvilleDoor_Closed_Tile0, 1
	setmetatile 4, 0, METATILE_Facility_NewMauvilleDoor_Closed_Tile1, 1
	setmetatile 5, 0, METATILE_Facility_NewMauvilleDoor_Closed_Tile2, 1
	setmetatile 3, 1, METATILE_Facility_NewMauvilleDoor_Closed_Tile3, 1
	setmetatile 4, 1, METATILE_Facility_NewMauvilleDoor_Closed_Tile4, 1
	setmetatile 5, 1, METATILE_Facility_NewMauvilleDoor_Closed_Tile5, 1
	return

NewMauville_Entrance_MapScript1_15E4D8:: @ 815E4D8
	setflag FLAG_LANDMARK_NEW_MAUVILLE
	end

NewMauville_Entrance_EventScript_15E4DC:: @ 815E4DC
	lockall
	applymovement 255, NewMauville_Entrance_Movement_1A0841
	waitmovement 0
	msgbox NewMauville_Entrance_Text_1982C0, 4
	checkitem ITEM_BASEMENT_KEY, 1
	compare VAR_RESULT, 0
	goto_if_eq NewMauville_Entrance_EventScript_15E55D
	msgbox NewMauville_Entrance_Text_1982D4, MSGBOX_YESNO
	compare VAR_RESULT, NO
	goto_if_eq NewMauville_Entrance_EventScript_15E55D
	msgbox NewMauville_Entrance_Text_1982EA, 4
	setmetatile 3, 0, METATILE_Facility_NewMauvilleDoor_Open_Tile0, 0
	setmetatile 4, 0, METATILE_Facility_NewMauvilleDoor_Open_Tile1, 0
	setmetatile 5, 0, METATILE_Facility_NewMauvilleDoor_Open_Tile2, 0
	setmetatile 3, 1, METATILE_Facility_NewMauvilleDoor_Open_Tile3, 1
	setmetatile 4, 1, METATILE_Facility_NewMauvilleDoor_Open_Tile4, 0
	setmetatile 5, 1, METATILE_Facility_NewMauvilleDoor_Open_Tile5, 1
	special DrawWholeMapView
	playse SE_BAN
	setvar VAR_NEW_MAUVILLE_STATE, 1
	releaseall
	end

NewMauville_Entrance_EventScript_15E55D:: @ 815E55D
	releaseall
	end
