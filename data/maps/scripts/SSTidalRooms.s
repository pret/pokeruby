SSTidalRooms_MapScripts:: @ 815FF05
	.byte 0

SSTidalRooms_EventScript_15FF06:: @ 815FF06
	lock
	faceplayer
	checkflag 260
	jumpeq SSTidalRooms_EventScript_15FF3D
	loadptr 0, SSTidalRooms_Text_199B65
	callstd 4
	setorcopyvar 0x8000, 0x151
	setorcopyvar 0x8001, 0x1
	callstd 0
	compare RESULT, 0
	jumpeq SSTidalRooms_EventScript_1A029B
	setflag 260
	loadptr 0, SSTidalRooms_Text_199C1A
	callstd 4
	release
	end

SSTidalRooms_EventScript_15FF3D:: @ 815FF3D
	loadptr 0, SSTidalRooms_Text_199C1A
	callstd 4
	release
	end

SSTidalRooms_EventScript_15FF47:: @ 815FF47
	lockall
	loadptr 0, SSTidalRooms_Text_19956B
	callstd 4
	closebutton
	call SSTidalRooms_EventScript_1A02CA
	call SSTidalRooms_EventScript_15FD64
	releaseall
	end

SSTidalRooms_EventScript_15FF5D:: @ 815FF5D
	trainerbattle 0, 294, 0, SSTidalRooms_Text_19958A, SSTidalRooms_Text_199613
	loadptr 0, SSTidalRooms_Text_199630
	callstd 6
	end

SSTidalRooms_EventScript_15FF74:: @ 815FF74
	trainerbattle 0, 255, 0, SSTidalRooms_Text_1996A6, SSTidalRooms_Text_1996BF
	loadptr 0, SSTidalRooms_Text_1996E1
	callstd 6
	end

SSTidalRooms_EventScript_15FF8B:: @ 815FF8B
	trainerbattle 0, 256, 0, SSTidalRooms_Text_199723, SSTidalRooms_Text_199747
	loadptr 0, SSTidalRooms_Text_199778
	callstd 6
	end

SSTidalRooms_EventScript_15FFA2:: @ 815FFA2
	trainerbattle 4, 641, 0, SSTidalRooms_Text_1997C1, SSTidalRooms_Text_199813, SSTidalRooms_Text_199887
	loadptr 0, SSTidalRooms_Text_199820
	callstd 6
	end

SSTidalRooms_EventScript_15FFBD:: @ 815FFBD
	trainerbattle 4, 641, 0, SSTidalRooms_Text_1998C5, SSTidalRooms_Text_19990E, SSTidalRooms_Text_199975
	loadptr 0, SSTidalRooms_Text_19991C
	callstd 6
	end

SSTidalRooms_EventScript_15FFD8:: @ 815FFD8
	trainerbattle 0, 138, 0, SSTidalRooms_Text_1999B7, SSTidalRooms_Text_1999FF
	loadptr 0, SSTidalRooms_Text_199A10
	callstd 6
	end

SSTidalRooms_EventScript_15FFEF:: @ 815FFEF
	trainerbattle 0, 119, 0, SSTidalRooms_Text_199A62, SSTidalRooms_Text_199ABF
	loadptr 0, SSTidalRooms_Text_199ADE
	callstd 6
	end

