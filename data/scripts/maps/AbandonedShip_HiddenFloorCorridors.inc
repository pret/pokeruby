AbandonedShip_HiddenFloorCorridors_MapScripts:: @ 815EB46
	map_script 5, AbandonedShip_HiddenFloorCorridors_MapScript1_15EB51
	map_script 1, AbandonedShip_HiddenFloorCorridors_MapScript1_15EB5A
	.byte 0

AbandonedShip_HiddenFloorCorridors_MapScript1_15EB51:: @ 815EB51
	warp4 AbandonedShip_Underwater1, 255, 5, 4
	end

AbandonedShip_HiddenFloorCorridors_MapScript1_15EB5A:: @ 815EB5A
	checkflag 240
	call_if 0, AbandonedShip_HiddenFloorCorridors_EventScript_15EBCB
	checkflag 241
	call_if 0, AbandonedShip_HiddenFloorCorridors_EventScript_15EBD5
	checkflag 242
	call_if 0, AbandonedShip_HiddenFloorCorridors_EventScript_15EBDF
	checkflag 243
	call_if 0, AbandonedShip_HiddenFloorCorridors_EventScript_15EBE9
	checkflag 240
	call_if 1, AbandonedShip_HiddenFloorCorridors_EventScript_15EBA3
	checkflag 241
	call_if 1, AbandonedShip_HiddenFloorCorridors_EventScript_15EBAD
	checkflag 242
	call_if 1, AbandonedShip_HiddenFloorCorridors_EventScript_15EBB7
	checkflag 243
	call_if 1, AbandonedShip_HiddenFloorCorridors_EventScript_15EBC1
	end

AbandonedShip_HiddenFloorCorridors_EventScript_15EBA3:: @ 815EBA3
	setmaptile 3, 8, 555, 1
	return

AbandonedShip_HiddenFloorCorridors_EventScript_15EBAD:: @ 815EBAD
	setmaptile 6, 8, 555, 1
	return

AbandonedShip_HiddenFloorCorridors_EventScript_15EBB7:: @ 815EBB7
	setmaptile 3, 3, 538, 0
	return

AbandonedShip_HiddenFloorCorridors_EventScript_15EBC1:: @ 815EBC1
	setmaptile 9, 3, 538, 0
	return

AbandonedShip_HiddenFloorCorridors_EventScript_15EBCB:: @ 815EBCB
	setmaptile 3, 8, 563, 1
	return

AbandonedShip_HiddenFloorCorridors_EventScript_15EBD5:: @ 815EBD5
	setmaptile 6, 8, 563, 1
	return

AbandonedShip_HiddenFloorCorridors_EventScript_15EBDF:: @ 815EBDF
	setmaptile 3, 3, 564, 0
	return

AbandonedShip_HiddenFloorCorridors_EventScript_15EBE9:: @ 815EBE9
	setmaptile 9, 3, 564, 0
	return

AbandonedShip_HiddenFloorCorridors_EventScript_15EBF3:: @ 815EBF3
	lockall
	checkflag 240
	goto_if_eq AbandonedShip_HiddenFloorCorridors_EventScript_15ECF7
	checkitem ITEM_ROOM_1_KEY, 1
	compare RESULT, 0
	goto_if_eq AbandonedShip_HiddenFloorCorridors_EventScript_15ECCF
	msgbox AbandonedShip_HiddenFloorCorridors_Text_198E90, 4
	playsfx 21
	removeitem ITEM_ROOM_1_KEY, 1
	setflag 240
	call AbandonedShip_HiddenFloorCorridors_EventScript_15EBA3
	special DrawWholeMapView
	releaseall
	end

AbandonedShip_HiddenFloorCorridors_EventScript_15EC2A:: @ 815EC2A
	lockall
	checkflag 241
	goto_if_eq AbandonedShip_HiddenFloorCorridors_EventScript_15ECF7
	checkitem ITEM_ROOM_2_KEY, 1
	compare RESULT, 0
	goto_if_eq AbandonedShip_HiddenFloorCorridors_EventScript_15ECD9
	msgbox AbandonedShip_HiddenFloorCorridors_Text_198E90, 4
	playsfx 21
	removeitem ITEM_ROOM_2_KEY, 1
	setflag 241
	call AbandonedShip_HiddenFloorCorridors_EventScript_15EBAD
	special DrawWholeMapView
	releaseall
	end

AbandonedShip_HiddenFloorCorridors_EventScript_15EC61:: @ 815EC61
	lockall
	checkflag 242
	goto_if_eq AbandonedShip_HiddenFloorCorridors_EventScript_15ECF7
	checkitem ITEM_ROOM_4_KEY, 1
	compare RESULT, 0
	goto_if_eq AbandonedShip_HiddenFloorCorridors_EventScript_15ECE3
	msgbox AbandonedShip_HiddenFloorCorridors_Text_198E90, 4
	playsfx 21
	removeitem ITEM_ROOM_4_KEY, 1
	setflag 242
	call AbandonedShip_HiddenFloorCorridors_EventScript_15EBB7
	special DrawWholeMapView
	releaseall
	end

AbandonedShip_HiddenFloorCorridors_EventScript_15EC98:: @ 815EC98
	lockall
	checkflag 243
	goto_if_eq AbandonedShip_HiddenFloorCorridors_EventScript_15ECF7
	checkitem ITEM_ROOM_6_KEY, 1
	compare RESULT, 0
	goto_if_eq AbandonedShip_HiddenFloorCorridors_EventScript_15ECED
	msgbox AbandonedShip_HiddenFloorCorridors_Text_198E90, 4
	playsfx 21
	removeitem ITEM_ROOM_6_KEY, 1
	setflag 243
	call AbandonedShip_HiddenFloorCorridors_EventScript_15EBC1
	special DrawWholeMapView
	releaseall
	end

AbandonedShip_HiddenFloorCorridors_EventScript_15ECCF:: @ 815ECCF
	msgbox AbandonedShip_HiddenFloorCorridors_Text_198DC0, 4
	releaseall
	end

AbandonedShip_HiddenFloorCorridors_EventScript_15ECD9:: @ 815ECD9
	msgbox AbandonedShip_HiddenFloorCorridors_Text_198DF4, 4
	releaseall
	end

AbandonedShip_HiddenFloorCorridors_EventScript_15ECE3:: @ 815ECE3
	msgbox AbandonedShip_HiddenFloorCorridors_Text_198E28, 4
	releaseall
	end

AbandonedShip_HiddenFloorCorridors_EventScript_15ECED:: @ 815ECED
	msgbox AbandonedShip_HiddenFloorCorridors_Text_198E5C, 4
	releaseall
	end

AbandonedShip_HiddenFloorCorridors_EventScript_15ECF7:: @ 815ECF7
	msgbox AbandonedShip_HiddenFloorCorridors_Text_1986EC, 4
	releaseall
	end
