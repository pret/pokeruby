ShoalCave_LowTideLowerRoom_MapScripts:: @ 815E3F3
	map_script 1, ShoalCave_LowTideLowerRoom_MapScript1_15E3F9
	.byte 0

ShoalCave_LowTideLowerRoom_MapScript1_15E3F9:: @ 815E3F9
	call ShoalCave_LowTideLowerRoom_EventScript_15E3FF
	end

ShoalCave_LowTideLowerRoom_EventScript_15E3FF:: @ 815E3FF
	checkflag 955
	jumpeq ShoalCave_LowTideLowerRoom_EventScript_15E412
	setmaptile 18, 2, 856, 1
	return

ShoalCave_LowTideLowerRoom_EventScript_15E412:: @ 815E412
	return

ShoalCave_LowTideLowerRoom_EventScript_15E413:: @ 815E413
	lockall
	checkflag 955
	jumpeq ShoalCave_LowTideLowerRoom_EventScript_15E445
	setorcopyvar 0x8000, 0x2e
	setorcopyvar 0x8001, 0x1
	callstd 0
	compare RESULT, 0
	jumpeq ShoalCave_LowTideLowerRoom_EventScript_1A029B
	setmaptile 18, 2, 858, 0
	special 142
	setflag 955
	releaseall
	end

ShoalCave_LowTideLowerRoom_EventScript_15E445:: @ 815E445
	loadptr 0, ShoalCave_LowTideLowerRoom_Text_1C6979
	callstd 4
	releaseall
	end

ShoalCave_LowTideLowerRoom_EventScript_15E44F:: @ 815E44F
	lock
	faceplayer
	checkflag 283
	jumpeq ShoalCave_LowTideLowerRoom_EventScript_15E47E
	loadptr 0, ShoalCave_LowTideLowerRoom_Text_198200
	callstd 4
	setorcopyvar 0x8000, 0xc4
	setorcopyvar 0x8001, 0x1
	callstd 0
	compare RESULT, 0
	jumpeq ShoalCave_LowTideLowerRoom_EventScript_1A029B
	setflag 283
	release
	end

ShoalCave_LowTideLowerRoom_EventScript_15E47E:: @ 815E47E
	loadptr 0, ShoalCave_LowTideLowerRoom_Text_1982A2
	callstd 4
	release
	end

