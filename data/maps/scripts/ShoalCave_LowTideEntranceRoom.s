ShoalCave_LowTideEntranceRoom_MapScripts:: @ 815E057
	map_script 3, ShoalCave_LowTideEntranceRoom_MapScript1_15E05D
	.byte 0

ShoalCave_LowTideEntranceRoom_MapScript1_15E05D:: @ 815E05D
	special 210
	checkflag 2106
	jumpeq ShoalCave_LowTideEntranceRoom_EventScript_15E06E
	jump ShoalCave_LowTideEntranceRoom_EventScript_15E072

ShoalCave_LowTideEntranceRoom_EventScript_15E06E:: @ 815E06E
	setmapfooter 169
	end

ShoalCave_LowTideEntranceRoom_EventScript_15E072:: @ 815E072
	setmapfooter 165
	end

ShoalCave_LowTideEntranceRoom_EventScript_15E076:: @ 815E076
	lock
	faceplayer
	checkdailyflags
	checkflag 2143
	callif 1, ShoalCave_LowTideEntranceRoom_EventScript_15E176
	checkitem ITEM_SHOAL_SALT, 4
	compare RESULT, 0
	jumpeq ShoalCave_LowTideEntranceRoom_EventScript_15E138
	checkitem ITEM_SHOAL_SHELL, 4
	compare RESULT, 0
	jumpeq ShoalCave_LowTideEntranceRoom_EventScript_15E138
	loadptr 0, ShoalCave_LowTideEntranceRoom_Text_1C6793
	callstd 5
	compare RESULT, 0
	jumpeq ShoalCave_LowTideEntranceRoom_EventScript_15E16C
	checkitemspace ITEM_SHELL_BELL, 1
	compare RESULT, 0
	callif 1, ShoalCave_LowTideEntranceRoom_EventScript_15E106
	compare RESULT, 2
	jumpeq ShoalCave_LowTideEntranceRoom_EventScript_15E12E
	loadptr 0, ShoalCave_LowTideEntranceRoom_Text_1C6808
	callstd 4
	removeitem ITEM_SHOAL_SALT, 4
	removeitem ITEM_SHOAL_SHELL, 4
	setorcopyvar 0x8000, 0xdb
	setorcopyvar 0x8001, 0x1
	callstd 0
	compare RESULT, 0
	jumpeq ShoalCave_LowTideEntranceRoom_EventScript_1A029B
	loadptr 0, ShoalCave_LowTideEntranceRoom_Text_1C688E
	callstd 4
	setflag 2
	release
	end

ShoalCave_LowTideEntranceRoom_EventScript_15E106:: @ 815E106
	checkitem ITEM_SHOAL_SALT, 5
	compare RESULT, 1
	jumpeq ShoalCave_LowTideEntranceRoom_EventScript_15E117
	return

ShoalCave_LowTideEntranceRoom_EventScript_15E117:: @ 815E117
	checkitem ITEM_SHOAL_SHELL, 5
	compare RESULT, 1
	jumpeq ShoalCave_LowTideEntranceRoom_EventScript_15E128
	return

ShoalCave_LowTideEntranceRoom_EventScript_15E128:: @ 815E128
	setvar RESULT, 2
	return

ShoalCave_LowTideEntranceRoom_EventScript_15E12E:: @ 815E12E
	loadptr 0, ShoalCave_LowTideEntranceRoom_Text_1C69F5
	callstd 4
	release
	end

ShoalCave_LowTideEntranceRoom_EventScript_15E138:: @ 815E138
	checkitem ITEM_SHOAL_SALT, 1
	compare RESULT, 1
	jumpeq ShoalCave_LowTideEntranceRoom_EventScript_15E162
	checkitem ITEM_SHOAL_SHELL, 1
	compare RESULT, 1
	jumpeq ShoalCave_LowTideEntranceRoom_EventScript_15E162
	loadptr 0, ShoalCave_LowTideEntranceRoom_Text_1C6668
	callstd 4
	release
	end

ShoalCave_LowTideEntranceRoom_EventScript_15E162:: @ 815E162
	loadptr 0, ShoalCave_LowTideEntranceRoom_Text_1C670D
	callstd 4
	release
	end

ShoalCave_LowTideEntranceRoom_EventScript_15E16C:: @ 815E16C
	loadptr 0, ShoalCave_LowTideEntranceRoom_Text_1C6944
	callstd 4
	release
	end

ShoalCave_LowTideEntranceRoom_EventScript_15E176:: @ 815E176
	clearflag 952
	clearflag 953
	clearflag 954
	clearflag 955
	clearflag 956
	clearflag 957
	clearflag 958
	clearflag 959
	clearflag 2143
	return

