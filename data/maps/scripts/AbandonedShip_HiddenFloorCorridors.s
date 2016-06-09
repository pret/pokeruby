AbandonedShip_HiddenFloorCorridors_MapScripts:: @ 815EB46
	map_script 5, AbandonedShip_HiddenFloorCorridors_MapScript1_15EB51
	map_script 1, AbandonedShip_HiddenFloorCorridors_MapScript1_15EB5A
	.byte 0

AbandonedShip_HiddenFloorCorridors_MapScript1_15EB51:: @ 815EB51
	warp4 AbandonedShip_Underwater1, 255, 5, 4
	end

AbandonedShip_HiddenFloorCorridors_MapScript1_15EB5A:: @ 815EB5A
	checkflag 240
	callif 0, AbandonedShip_HiddenFloorCorridors_EventScript_15EBCB
	checkflag 241
	callif 0, AbandonedShip_HiddenFloorCorridors_EventScript_15EBD5
	checkflag 242
	callif 0, AbandonedShip_HiddenFloorCorridors_EventScript_15EBDF
	checkflag 243
	callif 0, AbandonedShip_HiddenFloorCorridors_EventScript_15EBE9
	checkflag 240
	callif 1, AbandonedShip_HiddenFloorCorridors_EventScript_15EBA3
	checkflag 241
	callif 1, AbandonedShip_HiddenFloorCorridors_EventScript_15EBAD
	checkflag 242
	callif 1, AbandonedShip_HiddenFloorCorridors_EventScript_15EBB7
	checkflag 243
	callif 1, AbandonedShip_HiddenFloorCorridors_EventScript_15EBC1
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
	jumpeq AbandonedShip_HiddenFloorCorridors_EventScript_15ECF7
	checkitem ITEM_ROOM_1_KEY, 1
	compare RESULT, 0
	jumpeq AbandonedShip_HiddenFloorCorridors_EventScript_15ECCF
	loadptr 0, AbandonedShip_HiddenFloorCorridors_Text_198E90
	callstd 4
	playsfx 21
	removeitem ITEM_ROOM_1_KEY, 1
	setflag 240
	call AbandonedShip_HiddenFloorCorridors_EventScript_15EBA3
	special 142
	releaseall
	end

AbandonedShip_HiddenFloorCorridors_EventScript_15EC2A:: @ 815EC2A
	lockall
	checkflag 241
	jumpeq AbandonedShip_HiddenFloorCorridors_EventScript_15ECF7
	checkitem ITEM_ROOM_2_KEY, 1
	compare RESULT, 0
	jumpeq AbandonedShip_HiddenFloorCorridors_EventScript_15ECD9
	loadptr 0, AbandonedShip_HiddenFloorCorridors_Text_198E90
	callstd 4
	playsfx 21
	removeitem ITEM_ROOM_2_KEY, 1
	setflag 241
	call AbandonedShip_HiddenFloorCorridors_EventScript_15EBAD
	special 142
	releaseall
	end

AbandonedShip_HiddenFloorCorridors_EventScript_15EC61:: @ 815EC61
	lockall
	checkflag 242
	jumpeq AbandonedShip_HiddenFloorCorridors_EventScript_15ECF7
	checkitem ITEM_ROOM_4_KEY, 1
	compare RESULT, 0
	jumpeq AbandonedShip_HiddenFloorCorridors_EventScript_15ECE3
	loadptr 0, AbandonedShip_HiddenFloorCorridors_Text_198E90
	callstd 4
	playsfx 21
	removeitem ITEM_ROOM_4_KEY, 1
	setflag 242
	call AbandonedShip_HiddenFloorCorridors_EventScript_15EBB7
	special 142
	releaseall
	end

AbandonedShip_HiddenFloorCorridors_EventScript_15EC98:: @ 815EC98
	lockall
	checkflag 243
	jumpeq AbandonedShip_HiddenFloorCorridors_EventScript_15ECF7
	checkitem ITEM_ROOM_6_KEY, 1
	compare RESULT, 0
	jumpeq AbandonedShip_HiddenFloorCorridors_EventScript_15ECED
	loadptr 0, AbandonedShip_HiddenFloorCorridors_Text_198E90
	callstd 4
	playsfx 21
	removeitem ITEM_ROOM_6_KEY, 1
	setflag 243
	call AbandonedShip_HiddenFloorCorridors_EventScript_15EBC1
	special 142
	releaseall
	end

AbandonedShip_HiddenFloorCorridors_EventScript_15ECCF:: @ 815ECCF
	loadptr 0, AbandonedShip_HiddenFloorCorridors_Text_198DC0
	callstd 4
	releaseall
	end

AbandonedShip_HiddenFloorCorridors_EventScript_15ECD9:: @ 815ECD9
	loadptr 0, AbandonedShip_HiddenFloorCorridors_Text_198DF4
	callstd 4
	releaseall
	end

AbandonedShip_HiddenFloorCorridors_EventScript_15ECE3:: @ 815ECE3
	loadptr 0, AbandonedShip_HiddenFloorCorridors_Text_198E28
	callstd 4
	releaseall
	end

AbandonedShip_HiddenFloorCorridors_EventScript_15ECED:: @ 815ECED
	loadptr 0, AbandonedShip_HiddenFloorCorridors_Text_198E5C
	callstd 4
	releaseall
	end

AbandonedShip_HiddenFloorCorridors_EventScript_15ECF7:: @ 815ECF7
	loadptr 0, AbandonedShip_HiddenFloorCorridors_Text_1986EC
	callstd 4
	releaseall
	end

