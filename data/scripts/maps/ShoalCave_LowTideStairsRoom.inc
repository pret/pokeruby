ShoalCave_LowTideStairsRoom_MapScripts:: @ 815E397
	map_script 1, ShoalCave_LowTideStairsRoom_MapScript1_15E39D
	.byte 0

ShoalCave_LowTideStairsRoom_MapScript1_15E39D:: @ 815E39D
	call ShoalCave_LowTideStairsRoom_EventScript_15E3A3
	end

ShoalCave_LowTideStairsRoom_EventScript_15E3A3:: @ 815E3A3
	checkflag 954
	jumpeq ShoalCave_LowTideStairsRoom_EventScript_15E3B6
	setmaptile 11, 11, 856, 1
	return

ShoalCave_LowTideStairsRoom_EventScript_15E3B6:: @ 815E3B6
	return

ShoalCave_LowTideStairsRoom_EventScript_15E3B7:: @ 815E3B7
	lockall
	checkflag 954
	jumpeq ShoalCave_LowTideStairsRoom_EventScript_15E3E9
	giveitem ITEM_SHOAL_SALT
	compare RESULT, 0
	jumpeq ShoalCave_LowTideStairsRoom_EventScript_1A029B
	setmaptile 11, 11, 858, 0
	special DrawWholeMapView
	setflag 954
	releaseall
	end

ShoalCave_LowTideStairsRoom_EventScript_15E3E9:: @ 815E3E9
	msgbox ShoalCave_LowTideStairsRoom_Text_1C6979, 4
	releaseall
	end
