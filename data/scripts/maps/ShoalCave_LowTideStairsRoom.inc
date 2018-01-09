ShoalCave_LowTideStairsRoom_MapScripts:: @ 815E397
	map_script 1, ShoalCave_LowTideStairsRoom_MapScript1_15E39D
	.byte 0

ShoalCave_LowTideStairsRoom_MapScript1_15E39D:: @ 815E39D
	call ShoalCave_LowTideStairsRoom_EventScript_15E3A3
	end

ShoalCave_LowTideStairsRoom_EventScript_15E3A3:: @ 815E3A3
	goto_if_set FLAG_HIDE_TOOK_SHOAL_SALT_3, ShoalCave_LowTideStairsRoom_EventScript_15E3B6
	setmetatile 11, 11, 856, 1
	return

ShoalCave_LowTideStairsRoom_EventScript_15E3B6:: @ 815E3B6
	return

ShoalCave_LowTideStairsRoom_EventScript_15E3B7:: @ 815E3B7
	lockall
	goto_if_set FLAG_HIDE_TOOK_SHOAL_SALT_3, ShoalCave_LowTideStairsRoom_EventScript_15E3E9
	giveitem_std ITEM_SHOAL_SALT
	compare RESULT, 0
	goto_if_eq ShoalCave_LowTideStairsRoom_EventScript_1A029B
	setmetatile 11, 11, 858, 0
	special DrawWholeMapView
	setflag FLAG_HIDE_TOOK_SHOAL_SALT_3
	releaseall
	end

ShoalCave_LowTideStairsRoom_EventScript_15E3E9:: @ 815E3E9
	msgbox ShoalCave_LowTideStairsRoom_Text_1C6979, 4
	releaseall
	end
