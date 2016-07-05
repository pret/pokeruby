AbandonedShip_HiddenFloorRooms_MapScripts:: @ 815ED01
	map_script 2, AbandonedShip_HiddenFloorRooms_MapScript2_15ED07
	.byte 0

AbandonedShip_HiddenFloorRooms_MapScript2_15ED07:: @ 815ED07
	map_script_2 0x4001, 0, AbandonedShip_HiddenFloorRooms_EventScript_15ED11
	.2byte 0

AbandonedShip_HiddenFloorRooms_EventScript_15ED11:: @ 815ED11
	setvar 0x4001, 1
	getplayerxy 0x4002, 0x4003
	setvar 0x4004, 1
	compare 0x4002, 21
	callif 1, AbandonedShip_HiddenFloorRooms_EventScript_15ED89
	compare 0x4002, 36
	callif 1, AbandonedShip_HiddenFloorRooms_EventScript_15ED8F
	compare 0x4003, 2
	callif 1, AbandonedShip_HiddenFloorRooms_EventScript_15ED95
	switch 0x4004
	case 1, AbandonedShip_HiddenFloorRooms_EventScript_15ED9B
	case 2, AbandonedShip_HiddenFloorRooms_EventScript_15EDC4
	case 3, AbandonedShip_HiddenFloorRooms_EventScript_15EDC5
	case 4, AbandonedShip_HiddenFloorRooms_EventScript_15EDEB
	case 5, AbandonedShip_HiddenFloorRooms_EventScript_15EE23
	case 6, AbandonedShip_HiddenFloorRooms_EventScript_15EE6A
	end

AbandonedShip_HiddenFloorRooms_EventScript_15ED89:: @ 815ED89
	addvar 0x4004, 1
	return

AbandonedShip_HiddenFloorRooms_EventScript_15ED8F:: @ 815ED8F
	addvar 0x4004, 2
	return

AbandonedShip_HiddenFloorRooms_EventScript_15ED95:: @ 815ED95
	addvar 0x4004, 3
	return

AbandonedShip_HiddenFloorRooms_EventScript_15ED9B:: @ 815ED9B
	pause 20
	setanimation 0, 10
	setanimation 1, 10
	setanimation 2, 0
	doanimation 54
	specialval RESULT, 290
	compare RESULT, 0
	callif 1, AbandonedShip_HiddenFloorRooms_EventScript_15EE8B
	checkanimation 54
	pause 10
	end

AbandonedShip_HiddenFloorRooms_EventScript_15EDC4:: @ 815EDC4
	end

AbandonedShip_HiddenFloorRooms_EventScript_15EDC5:: @ 815EDC5
	specialval RESULT, 288
	compare RESULT, 1
	jumpeq AbandonedShip_HiddenFloorRooms_EventScript_15EDEA
	pause 20
	compare RESULT, 0
	callif 1, AbandonedShip_HiddenFloorRooms_EventScript_15EE6B
	checkanimation 54
	pause 10
	end

AbandonedShip_HiddenFloorRooms_EventScript_15EDEA:: @ 815EDEA
	end

AbandonedShip_HiddenFloorRooms_EventScript_15EDEB:: @ 815EDEB
	pause 20
	setanimation 0, 8
	setanimation 1, 5
	setanimation 2, 0
	doanimation 54
	setanimation 0, 11
	setanimation 1, 3
	setanimation 2, 0
	doanimation 54
	specialval RESULT, 291
	compare RESULT, 0
	callif 1, AbandonedShip_HiddenFloorRooms_EventScript_15EE9B
	checkanimation 54
	pause 10
	end

AbandonedShip_HiddenFloorRooms_EventScript_15EE23:: @ 815EE23
	pause 20
	setanimation 0, 16
	setanimation 1, 3
	setanimation 2, 0
	doanimation 54
	setanimation 0, 25
	setanimation 1, 2
	setanimation 2, 0
	doanimation 54
	setanimation 0, 24
	setanimation 1, 6
	setanimation 2, 0
	doanimation 54
	specialval RESULT, 289
	compare RESULT, 0
	callif 1, AbandonedShip_HiddenFloorRooms_EventScript_15EE7B
	checkanimation 54
	pause 10
	end

AbandonedShip_HiddenFloorRooms_EventScript_15EE6A:: @ 815EE6A
	end

AbandonedShip_HiddenFloorRooms_EventScript_15EE6B:: @ 815EE6B
	setanimation 0, 42
	setanimation 1, 10
	setanimation 2, 0
	doanimation 54
	return

AbandonedShip_HiddenFloorRooms_EventScript_15EE7B:: @ 815EE7B
	setanimation 0, 20
	setanimation 1, 5
	setanimation 2, 0
	doanimation 54
	return

AbandonedShip_HiddenFloorRooms_EventScript_15EE8B:: @ 815EE8B
	setanimation 0, 1
	setanimation 1, 12
	setanimation 2, 0
	doanimation 54
	return

AbandonedShip_HiddenFloorRooms_EventScript_15EE9B:: @ 815EE9B
	setanimation 0, 1
	setanimation 1, 2
	setanimation 2, 0
	doanimation 54
	return

AbandonedShip_HiddenFloorRooms_EventScript_15EEAB:: @ 815EEAB
	lockall
	msgbox AbandonedShip_HiddenFloorRooms_Text_198EE2, 4
	releaseall
	end
