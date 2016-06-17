SSTidalCorridor_MapScripts:: @ 815FC94
	map_script 2, SSTidalCorridor_MapScript2_15FC9A
	.byte 0

SSTidalCorridor_MapScript2_15FC9A:: @ 815FC9A
	map_script_2 0x40b4, 1, SSTidalCorridor_EventScript_15FCBC
	map_script_2 0x40b4, 5, SSTidalCorridor_EventScript_15FCD2
	map_script_2 0x40b4, 9, SSTidalCorridor_EventScript_15FD24
	map_script_2 0x40b4, 10, SSTidalCorridor_EventScript_15FD3A
	.2byte 0

SSTidalCorridor_EventScript_15FCBC:: @ 815FCBC
	special 203
	setvar 0x40b4, 2
	lockall
	playsfx 73
	msgbox SSTidalCorridor_Text_199007, 4
	releaseall
	end

SSTidalCorridor_EventScript_15FCD2:: @ 815FCD2
	setvar 0x40b4, 6
	lockall
	playsfx 73
	msgbox SSTidalCorridor_Text_199088, 4
	releaseall
	end

SSTidalRooms_EventScript_15FCE5:: @ 815FCE5
	special 203
	setvar 0x40b4, 7
	playsfx 73
	msgbox SSTidalRooms_Text_199007, 4
	return

SSTidalRooms_EventScript_15FCF9:: @ 815FCF9
	special 204
	setvar 0x40b4, 4
	playsfx 73
	msgbox SSTidalRooms_Text_1990F8, 4
	return

