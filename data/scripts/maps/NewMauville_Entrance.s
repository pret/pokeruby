NewMauville_Entrance_MapScripts:: @ 815E48A
	map_script 1, NewMauville_Entrance_MapScript1_15E495
	map_script 3, NewMauville_Entrance_MapScript1_15E4D8
	.byte 0

NewMauville_Entrance_MapScript1_15E495:: @ 815E495
	compare 0x40ba, 0
	callif 1, NewMauville_Entrance_EventScript_15E4A1
	end

NewMauville_Entrance_EventScript_15E4A1:: @ 815E4A1
	setmaptile 3, 0, 788, 1
	setmaptile 4, 0, 789, 1
	setmaptile 5, 0, 790, 1
	setmaptile 3, 1, 796, 1
	setmaptile 4, 1, 797, 1
	setmaptile 5, 1, 798, 1
	return

NewMauville_Entrance_MapScript1_15E4D8:: @ 815E4D8
	setflag 2112
	end

NewMauville_Entrance_EventScript_15E4DC:: @ 815E4DC
	lockall
	move 255, NewMauville_Entrance_Movement_1A0841
	waitmove 0
	msgbox NewMauville_Entrance_Text_1982C0, 4
	checkitem ITEM_BASEMENT_KEY, 1
	compare RESULT, 0
	jumpeq NewMauville_Entrance_EventScript_15E55D
	msgbox NewMauville_Entrance_Text_1982D4, 5
	compare RESULT, 0
	jumpeq NewMauville_Entrance_EventScript_15E55D
	msgbox NewMauville_Entrance_Text_1982EA, 4
	setmaptile 3, 0, 707, 0
	setmaptile 4, 0, 708, 0
	setmaptile 5, 0, 709, 0
	setmaptile 3, 1, 715, 1
	setmaptile 4, 1, 716, 0
	setmaptile 5, 1, 717, 1
	special 142
	playsfx 20
	setvar 0x40ba, 1
	releaseall
	end

NewMauville_Entrance_EventScript_15E55D:: @ 815E55D
	releaseall
	end
