AbandonedShip_HiddenFloorRooms_MapScripts:: @ 815ED01
	map_script 2, AbandonedShip_HiddenFloorRooms_MapScript2_15ED07
	.byte 0

AbandonedShip_HiddenFloorRooms_MapScript2_15ED07:: @ 815ED07
	map_script_2 VAR_TEMP_1, 0, AbandonedShip_HiddenFloorRooms_EventScript_15ED11
	.2byte 0

AbandonedShip_HiddenFloorRooms_EventScript_15ED11:: @ 815ED11
	setvar VAR_TEMP_1, 1
	getplayerxy VAR_TEMP_2, VAR_TEMP_3
	setvar VAR_TEMP_4, 1
	compare VAR_TEMP_2, 21
	call_if_eq AbandonedShip_HiddenFloorRooms_EventScript_15ED89
	compare VAR_TEMP_2, 36
	call_if_eq AbandonedShip_HiddenFloorRooms_EventScript_15ED8F
	compare VAR_TEMP_3, 2
	call_if_eq AbandonedShip_HiddenFloorRooms_EventScript_15ED95
	switch VAR_TEMP_4
	case 1, AbandonedShip_HiddenFloorRooms_EventScript_15ED9B
	case 2, AbandonedShip_HiddenFloorRooms_EventScript_15EDC4
	case 3, AbandonedShip_HiddenFloorRooms_EventScript_15EDC5
	case 4, AbandonedShip_HiddenFloorRooms_EventScript_15EDEB
	case 5, AbandonedShip_HiddenFloorRooms_EventScript_15EE23
	case 6, AbandonedShip_HiddenFloorRooms_EventScript_15EE6A
	end

AbandonedShip_HiddenFloorRooms_EventScript_15ED89:: @ 815ED89
	addvar VAR_TEMP_4, 1
	return

AbandonedShip_HiddenFloorRooms_EventScript_15ED8F:: @ 815ED8F
	addvar VAR_TEMP_4, 2
	return

AbandonedShip_HiddenFloorRooms_EventScript_15ED95:: @ 815ED95
	addvar VAR_TEMP_4, 3
	return

AbandonedShip_HiddenFloorRooms_EventScript_15ED9B:: @ 815ED9B
	delay 20
	setfieldeffectargument 0, 10
	setfieldeffectargument 1, 10
	setfieldeffectargument 2, 0
	dofieldeffect FLDEFF_SPARKLE
	specialvar RESULT, FoundAbandonedShipRoom4Key
	compare RESULT, 0
	call_if_eq AbandonedShip_HiddenFloorRooms_EventScript_15EE8B
	waitfieldeffect FLDEFF_SPARKLE
	delay 10
	end

AbandonedShip_HiddenFloorRooms_EventScript_15EDC4:: @ 815EDC4
	end

AbandonedShip_HiddenFloorRooms_EventScript_15EDC5:: @ 815EDC5
	specialvar RESULT, FoundAbandonedShipRoom1Key
	compare RESULT, 1
	goto_if_eq AbandonedShip_HiddenFloorRooms_EventScript_15EDEA
	delay 20
	compare RESULT, 0
	call_if_eq AbandonedShip_HiddenFloorRooms_EventScript_15EE6B
	waitfieldeffect FLDEFF_SPARKLE
	delay 10
	end

AbandonedShip_HiddenFloorRooms_EventScript_15EDEA:: @ 815EDEA
	end

AbandonedShip_HiddenFloorRooms_EventScript_15EDEB:: @ 815EDEB
	delay 20
	setfieldeffectargument 0, 8
	setfieldeffectargument 1, 5
	setfieldeffectargument 2, 0
	dofieldeffect FLDEFF_SPARKLE
	setfieldeffectargument 0, 11
	setfieldeffectargument 1, 3
	setfieldeffectargument 2, 0
	dofieldeffect FLDEFF_SPARKLE
	specialvar RESULT, FoundAbandonedShipRoom6Key
	compare RESULT, 0
	call_if_eq AbandonedShip_HiddenFloorRooms_EventScript_15EE9B
	waitfieldeffect FLDEFF_SPARKLE
	delay 10
	end

AbandonedShip_HiddenFloorRooms_EventScript_15EE23:: @ 815EE23
	delay 20
	setfieldeffectargument 0, 16
	setfieldeffectargument 1, 3
	setfieldeffectargument 2, 0
	dofieldeffect FLDEFF_SPARKLE
	setfieldeffectargument 0, 25
	setfieldeffectargument 1, 2
	setfieldeffectargument 2, 0
	dofieldeffect FLDEFF_SPARKLE
	setfieldeffectargument 0, 24
	setfieldeffectargument 1, 6
	setfieldeffectargument 2, 0
	dofieldeffect FLDEFF_SPARKLE
	specialvar RESULT, FoundAbandonedShipRoom2Key
	compare RESULT, 0
	call_if_eq AbandonedShip_HiddenFloorRooms_EventScript_15EE7B
	waitfieldeffect FLDEFF_SPARKLE
	delay 10
	end

AbandonedShip_HiddenFloorRooms_EventScript_15EE6A:: @ 815EE6A
	end

AbandonedShip_HiddenFloorRooms_EventScript_15EE6B:: @ 815EE6B
	setfieldeffectargument 0, 42
	setfieldeffectargument 1, 10
	setfieldeffectargument 2, 0
	dofieldeffect FLDEFF_SPARKLE
	return

AbandonedShip_HiddenFloorRooms_EventScript_15EE7B:: @ 815EE7B
	setfieldeffectargument 0, 20
	setfieldeffectargument 1, 5
	setfieldeffectargument 2, 0
	dofieldeffect FLDEFF_SPARKLE
	return

AbandonedShip_HiddenFloorRooms_EventScript_15EE8B:: @ 815EE8B
	setfieldeffectargument 0, 1
	setfieldeffectargument 1, 12
	setfieldeffectargument 2, 0
	dofieldeffect FLDEFF_SPARKLE
	return

AbandonedShip_HiddenFloorRooms_EventScript_15EE9B:: @ 815EE9B
	setfieldeffectargument 0, 1
	setfieldeffectargument 1, 2
	setfieldeffectargument 2, 0
	dofieldeffect FLDEFF_SPARKLE
	return

AbandonedShip_HiddenFloorRooms_EventScript_15EEAB:: @ 815EEAB
	lockall
	msgbox AbandonedShip_HiddenFloorRooms_Text_198EE2, 4
	releaseall
	end
