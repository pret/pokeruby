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
	call_if 1, AbandonedShip_HiddenFloorRooms_EventScript_15ED89
	compare 0x4002, 36
	call_if 1, AbandonedShip_HiddenFloorRooms_EventScript_15ED8F
	compare 0x4003, 2
	call_if 1, AbandonedShip_HiddenFloorRooms_EventScript_15ED95
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
	delay 20
	setfieldeffect 0, 10
	setfieldeffect 1, 10
	setfieldeffect 2, 0
	dofieldeffect 54
	specialvar RESULT, sub_810F4D4
	compare RESULT, 0
	call_if 1, AbandonedShip_HiddenFloorRooms_EventScript_15EE8B
	waitfieldeffect 54
	delay 10
	end

AbandonedShip_HiddenFloorRooms_EventScript_15EDC4:: @ 815EDC4
	end

AbandonedShip_HiddenFloorRooms_EventScript_15EDC5:: @ 815EDC5
	specialvar RESULT, sub_810F488
	compare RESULT, 1
	goto_if_eq AbandonedShip_HiddenFloorRooms_EventScript_15EDEA
	delay 20
	compare RESULT, 0
	call_if 1, AbandonedShip_HiddenFloorRooms_EventScript_15EE6B
	waitfieldeffect 54
	delay 10
	end

AbandonedShip_HiddenFloorRooms_EventScript_15EDEA:: @ 815EDEA
	end

AbandonedShip_HiddenFloorRooms_EventScript_15EDEB:: @ 815EDEB
	delay 20
	setfieldeffect 0, 8
	setfieldeffect 1, 5
	setfieldeffect 2, 0
	dofieldeffect 54
	setfieldeffect 0, 11
	setfieldeffect 1, 3
	setfieldeffect 2, 0
	dofieldeffect 54
	specialvar RESULT, sub_810F4FC
	compare RESULT, 0
	call_if 1, AbandonedShip_HiddenFloorRooms_EventScript_15EE9B
	waitfieldeffect 54
	delay 10
	end

AbandonedShip_HiddenFloorRooms_EventScript_15EE23:: @ 815EE23
	delay 20
	setfieldeffect 0, 16
	setfieldeffect 1, 3
	setfieldeffect 2, 0
	dofieldeffect 54
	setfieldeffect 0, 25
	setfieldeffect 1, 2
	setfieldeffect 2, 0
	dofieldeffect 54
	setfieldeffect 0, 24
	setfieldeffect 1, 6
	setfieldeffect 2, 0
	dofieldeffect 54
	specialvar RESULT, sub_810F4B0
	compare RESULT, 0
	call_if 1, AbandonedShip_HiddenFloorRooms_EventScript_15EE7B
	waitfieldeffect 54
	delay 10
	end

AbandonedShip_HiddenFloorRooms_EventScript_15EE6A:: @ 815EE6A
	end

AbandonedShip_HiddenFloorRooms_EventScript_15EE6B:: @ 815EE6B
	setfieldeffect 0, 42
	setfieldeffect 1, 10
	setfieldeffect 2, 0
	dofieldeffect 54
	return

AbandonedShip_HiddenFloorRooms_EventScript_15EE7B:: @ 815EE7B
	setfieldeffect 0, 20
	setfieldeffect 1, 5
	setfieldeffect 2, 0
	dofieldeffect 54
	return

AbandonedShip_HiddenFloorRooms_EventScript_15EE8B:: @ 815EE8B
	setfieldeffect 0, 1
	setfieldeffect 1, 12
	setfieldeffect 2, 0
	dofieldeffect 54
	return

AbandonedShip_HiddenFloorRooms_EventScript_15EE9B:: @ 815EE9B
	setfieldeffect 0, 1
	setfieldeffect 1, 2
	setfieldeffect 2, 0
	dofieldeffect 54
	return

AbandonedShip_HiddenFloorRooms_EventScript_15EEAB:: @ 815EEAB
	lockall
	msgbox AbandonedShip_HiddenFloorRooms_Text_198EE2, 4
	releaseall
	end
