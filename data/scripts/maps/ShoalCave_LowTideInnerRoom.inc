ShoalCave_LowTideInnerRoom_MapScripts:: @ 815E192
	map_script 1, ShoalCave_LowTideInnerRoom_MapScript1_15E1B3
	map_script 3, ShoalCave_LowTideInnerRoom_MapScript1_15E19D
	.byte 0

ShoalCave_LowTideInnerRoom_MapScript1_15E19D:: @ 815E19D
	goto_if_set FLAG_SYS_SHOAL_TIDE, ShoalCave_LowTideInnerRoom_EventScript_15E1AB
	goto ShoalCave_LowTideInnerRoom_EventScript_15E1AF

ShoalCave_LowTideInnerRoom_EventScript_15E1AB:: @ 815E1AB
	setmaplayoutindex 170
	end

ShoalCave_LowTideInnerRoom_EventScript_15E1AF:: @ 815E1AF
	setmaplayoutindex 166
	end

ShoalCave_LowTideInnerRoom_MapScript1_15E1B3:: @ 815E1B3
	call ShoalCave_LowTideInnerRoom_EventScript_15E1B9
	end

ShoalCave_LowTideInnerRoom_EventScript_15E1B9:: @ 815E1B9
	goto_if_set FLAG_HIDE_TOOK_SHOAL_SALT_1, ShoalCave_LowTideInnerRoom_EventScript_15E1DA
	goto_if_set FLAG_SYS_SHOAL_TIDE, ShoalCave_LowTideInnerRoom_EventScript_15E1DA
	setmetatile 31, 8, 856, 1
	goto ShoalCave_LowTideInnerRoom_EventScript_15E1DA
	end

ShoalCave_LowTideInnerRoom_EventScript_15E1DA:: @ 815E1DA
	goto_if_set FLAG_HIDE_TOOK_SHOAL_SALT_2, ShoalCave_LowTideInnerRoom_EventScript_15E1FB
	goto_if_set FLAG_SYS_SHOAL_TIDE, ShoalCave_LowTideInnerRoom_EventScript_15E1FB
	setmetatile 14, 26, 856, 1
	goto ShoalCave_LowTideInnerRoom_EventScript_15E1FB
	end

ShoalCave_LowTideInnerRoom_EventScript_15E1FB:: @ 815E1FB
	goto_if_set FLAG_HIDE_TOOK_SHOAL_SHELL_1, ShoalCave_LowTideInnerRoom_EventScript_15E213
	setmetatile 41, 20, 857, 1
	goto ShoalCave_LowTideInnerRoom_EventScript_15E213
	end

ShoalCave_LowTideInnerRoom_EventScript_15E213:: @ 815E213
	goto_if_set FLAG_HIDE_TOOK_SHOAL_SHELL_2, ShoalCave_LowTideInnerRoom_EventScript_15E22B
	setmetatile 41, 10, 857, 1
	goto ShoalCave_LowTideInnerRoom_EventScript_15E22B
	end

ShoalCave_LowTideInnerRoom_EventScript_15E22B:: @ 815E22B
	goto_if_set FLAG_HIDE_TOOK_SHOAL_SHELL_3, ShoalCave_LowTideInnerRoom_EventScript_15E243
	setmetatile 6, 9, 857, 1
	goto ShoalCave_LowTideInnerRoom_EventScript_15E243
	end

ShoalCave_LowTideInnerRoom_EventScript_15E243:: @ 815E243
	goto_if_set FLAG_HIDE_TOOK_SHOAL_SHELL_4, ShoalCave_LowTideInnerRoom_EventScript_15E256
	setmetatile 16, 13, 857, 1
	return

ShoalCave_LowTideInnerRoom_EventScript_15E256:: @ 815E256
	return

ShoalCave_LowTideInnerRoom_EventScript_15E257:: @ 815E257
	lockall
	goto_if_set FLAG_HIDE_TOOK_SHOAL_SHELL_1, ShoalCave_LowTideInnerRoom_EventScript_15E289
	giveitem_std ITEM_SHOAL_SHELL
	compare RESULT, 0
	goto_if_eq ShoalCave_LowTideInnerRoom_EventScript_1A029B
	setmetatile 41, 20, 859, 0
	special DrawWholeMapView
	setflag FLAG_HIDE_TOOK_SHOAL_SHELL_1
	releaseall
	end

ShoalCave_LowTideInnerRoom_EventScript_15E289:: @ 815E289
	msgbox ShoalCave_LowTideInnerRoom_Text_1C69B8, 4
	releaseall
	end

ShoalCave_LowTideInnerRoom_EventScript_15E293:: @ 815E293
	lockall
	goto_if_set FLAG_HIDE_TOOK_SHOAL_SHELL_2, ShoalCave_LowTideInnerRoom_EventScript_15E289
	giveitem_std ITEM_SHOAL_SHELL
	compare RESULT, 0
	goto_if_eq ShoalCave_LowTideInnerRoom_EventScript_1A029B
	setmetatile 41, 10, 859, 0
	special DrawWholeMapView
	setflag FLAG_HIDE_TOOK_SHOAL_SHELL_2
	releaseall
	end

ShoalCave_LowTideInnerRoom_EventScript_15E2C5:: @ 815E2C5
	lockall
	goto_if_set FLAG_HIDE_TOOK_SHOAL_SHELL_3, ShoalCave_LowTideInnerRoom_EventScript_15E289
	giveitem_std ITEM_SHOAL_SHELL
	compare RESULT, 0
	goto_if_eq ShoalCave_LowTideInnerRoom_EventScript_1A029B
	setmetatile 6, 9, 859, 0
	special DrawWholeMapView
	setflag FLAG_HIDE_TOOK_SHOAL_SHELL_3
	releaseall
	end

ShoalCave_LowTideInnerRoom_EventScript_15E2F7:: @ 815E2F7
	lockall
	goto_if_set FLAG_HIDE_TOOK_SHOAL_SHELL_4, ShoalCave_LowTideInnerRoom_EventScript_15E289
	giveitem_std ITEM_SHOAL_SHELL
	compare RESULT, 0
	goto_if_eq ShoalCave_LowTideInnerRoom_EventScript_1A029B
	setmetatile 16, 13, 859, 0
	special DrawWholeMapView
	setflag FLAG_HIDE_TOOK_SHOAL_SHELL_4
	releaseall
	end

ShoalCave_LowTideInnerRoom_EventScript_15E329:: @ 815E329
	lockall
	goto_if_set FLAG_HIDE_TOOK_SHOAL_SALT_1, ShoalCave_LowTideInnerRoom_EventScript_15E35B
	giveitem_std ITEM_SHOAL_SALT
	compare RESULT, 0
	goto_if_eq ShoalCave_LowTideInnerRoom_EventScript_1A029B
	setmetatile 31, 8, 858, 0
	special DrawWholeMapView
	setflag FLAG_HIDE_TOOK_SHOAL_SALT_1
	releaseall
	end

ShoalCave_LowTideInnerRoom_EventScript_15E35B:: @ 815E35B
	msgbox ShoalCave_LowTideInnerRoom_Text_1C6979, 4
	releaseall
	end

ShoalCave_LowTideInnerRoom_EventScript_15E365:: @ 815E365
	lockall
	goto_if_set FLAG_HIDE_TOOK_SHOAL_SALT_2, ShoalCave_LowTideInnerRoom_EventScript_15E35B
	giveitem_std ITEM_SHOAL_SALT
	compare RESULT, 0
	goto_if_eq ShoalCave_LowTideInnerRoom_EventScript_1A029B
	setmetatile 14, 26, 858, 0
	special DrawWholeMapView
	setflag FLAG_HIDE_TOOK_SHOAL_SALT_2
	releaseall
	end
