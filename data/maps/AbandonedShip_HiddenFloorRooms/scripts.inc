AbandonedShip_HiddenFloorRooms_MapScripts:: @ 815ED01
	map_script MAP_SCRIPT_ON_FRAME_TABLE, AbandonedShip_HiddenFloorRooms_OnFrame
	.byte 0

AbandonedShip_HiddenFloorRooms_OnFrame:: @ 815ED07
	map_script_2 VAR_TEMP_1, 0, AbandonedShip_HiddenFloorRooms_EventScript_DoHiddenItemSparkle
	.2byte 0

AbandonedShip_HiddenFloorRooms_EventScript_DoHiddenItemSparkle:: @ 815ED11
	setvar VAR_TEMP_1, 1
	getplayerxy VAR_TEMP_2, VAR_TEMP_3
	setvar VAR_TEMP_4, 1
	compare VAR_TEMP_2, 21
	call_if_eq AbandonedShip_HiddenFloorRooms_EventScript_InMiddleRoomColumn
	compare VAR_TEMP_2, 36
	call_if_eq AbandonedShip_HiddenFloorRooms_EventScript_InRightRoomColumn
	compare VAR_TEMP_3, 2
	call_if_eq AbandonedShip_HiddenFloorRooms_EventScript_InUpperRoomRow
	switch VAR_TEMP_4
	case 1, AbandonedShip_HiddenFloorRooms_EventScript_EnterRm1
	case 2, AbandonedShip_HiddenFloorRooms_EventScript_EnterRm2
	case 3, AbandonedShip_HiddenFloorRooms_EventScript_EnterRm3
	case 4, AbandonedShip_HiddenFloorRooms_EventScript_EnterRm4
	case 5, AbandonedShip_HiddenFloorRooms_EventScript_EnterRm5
	case 6, AbandonedShip_HiddenFloorRooms_EventScript_EnterRm6
	end

AbandonedShip_HiddenFloorRooms_EventScript_InMiddleRoomColumn:: @ 815ED89
	addvar VAR_TEMP_4, 1
	return

AbandonedShip_HiddenFloorRooms_EventScript_InRightRoomColumn:: @ 815ED8F
	addvar VAR_TEMP_4, 2
	return

AbandonedShip_HiddenFloorRooms_EventScript_InUpperRoomRow:: @ 815ED95
	addvar VAR_TEMP_4, 3
	return

AbandonedShip_HiddenFloorRooms_EventScript_EnterRm1:: @ 815ED9B
	delay 20
	setfieldeffectargument 0, 10
	setfieldeffectargument 1, 10
	setfieldeffectargument 2, 0
	dofieldeffect FLDEFF_SPARKLE
	specialvar VAR_RESULT, FoundAbandonedShipRoom4Key
	compare VAR_RESULT, 0
	call_if_eq AbandonedShip_HiddenFloorRooms_EventScript_Rm4KeySparkle
	waitfieldeffect FLDEFF_SPARKLE
	delay 10
	end

AbandonedShip_HiddenFloorRooms_EventScript_EnterRm2:: @ 815EDC4
	end

AbandonedShip_HiddenFloorRooms_EventScript_EnterRm3:: @ 815EDC5
	specialvar VAR_RESULT, FoundAbandonedShipRoom1Key
	compare VAR_RESULT, 1
	goto_if_eq AbandonedShip_HiddenFloorRooms_EventScript_Rm3NoSparkle
	delay 20
	compare VAR_RESULT, 0
	call_if_eq AbandonedShip_HiddenFloorRooms_EventScript_Rm1KeySparkle
	waitfieldeffect FLDEFF_SPARKLE
	delay 10
	end

AbandonedShip_HiddenFloorRooms_EventScript_Rm3NoSparkle:: @ 815EDEA
	end

AbandonedShip_HiddenFloorRooms_EventScript_EnterRm4:: @ 815EDEB
	delay 20
	setfieldeffectargument 0, 8
	setfieldeffectargument 1, 5
	setfieldeffectargument 2, 0
	dofieldeffect FLDEFF_SPARKLE
	setfieldeffectargument 0, 11
	setfieldeffectargument 1, 3
	setfieldeffectargument 2, 0
	dofieldeffect FLDEFF_SPARKLE
	specialvar VAR_RESULT, FoundAbandonedShipRoom6Key
	compare VAR_RESULT, 0
	call_if_eq AbandonedShip_HiddenFloorRooms_EventScript_Rm6KeySparkle
	waitfieldeffect FLDEFF_SPARKLE
	delay 10
	end

AbandonedShip_HiddenFloorRooms_EventScript_EnterRm5:: @ 815EE23
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
	specialvar VAR_RESULT, FoundAbandonedShipRoom2Key
	compare VAR_RESULT, 0
	call_if_eq AbandonedShip_HiddenFloorRooms_EventScript_Rm2KeySparkle
	waitfieldeffect FLDEFF_SPARKLE
	delay 10
	end

AbandonedShip_HiddenFloorRooms_EventScript_EnterRm6:: @ 815EE6A
	end

AbandonedShip_HiddenFloorRooms_EventScript_Rm1KeySparkle:: @ 815EE6B
	setfieldeffectargument 0, 42
	setfieldeffectargument 1, 10
	setfieldeffectargument 2, 0
	dofieldeffect FLDEFF_SPARKLE
	return

AbandonedShip_HiddenFloorRooms_EventScript_Rm2KeySparkle:: @ 815EE7B
	setfieldeffectargument 0, 20
	setfieldeffectargument 1, 5
	setfieldeffectargument 2, 0
	dofieldeffect FLDEFF_SPARKLE
	return

AbandonedShip_HiddenFloorRooms_EventScript_Rm4KeySparkle:: @ 815EE8B
	setfieldeffectargument 0, 1
	setfieldeffectargument 1, 12
	setfieldeffectargument 2, 0
	dofieldeffect FLDEFF_SPARKLE
	return

AbandonedShip_HiddenFloorRooms_EventScript_Rm6KeySparkle:: @ 815EE9B
	setfieldeffectargument 0, 1
	setfieldeffectargument 1, 2
	setfieldeffectargument 2, 0
	dofieldeffect FLDEFF_SPARKLE
	return

AbandonedShip_HiddenFloorRooms_EventScript_Trash:: @ 815EEAB
	lockall
	msgbox AbandonedShip_HiddenFloorRooms_Text_BrightShinyTrash, MSGBOX_DEFAULT
	releaseall
	end
