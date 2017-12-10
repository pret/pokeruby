ShoalCave_LowTideInnerRoom_MapScripts:: @ 815E192
	map_script 1, ShoalCave_LowTideInnerRoom_MapScript1_15E1B3
	map_script 3, ShoalCave_LowTideInnerRoom_MapScript1_15E19D
	.byte 0

ShoalCave_LowTideInnerRoom_MapScript1_15E19D:: @ 815E19D
	checkflag SYS_SHOAL_TIDE
	goto_if_eq ShoalCave_LowTideInnerRoom_EventScript_15E1AB
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
	checkflag FLAG_HIDE_TOOK_SHOAL_SALT_1
	goto_if_eq ShoalCave_LowTideInnerRoom_EventScript_15E1DA
	checkflag SYS_SHOAL_TIDE
	goto_if_eq ShoalCave_LowTideInnerRoom_EventScript_15E1DA
	setmaptile 31, 8, 856, 1
	goto ShoalCave_LowTideInnerRoom_EventScript_15E1DA
	end

ShoalCave_LowTideInnerRoom_EventScript_15E1DA:: @ 815E1DA
	checkflag FLAG_HIDE_TOOK_SHOAL_SALT_2
	goto_if_eq ShoalCave_LowTideInnerRoom_EventScript_15E1FB
	checkflag SYS_SHOAL_TIDE
	goto_if_eq ShoalCave_LowTideInnerRoom_EventScript_15E1FB
	setmaptile 14, 26, 856, 1
	goto ShoalCave_LowTideInnerRoom_EventScript_15E1FB
	end

ShoalCave_LowTideInnerRoom_EventScript_15E1FB:: @ 815E1FB
	checkflag FLAG_HIDE_TOOK_SHOAL_SHELL_1
	goto_if_eq ShoalCave_LowTideInnerRoom_EventScript_15E213
	setmaptile 41, 20, 857, 1
	goto ShoalCave_LowTideInnerRoom_EventScript_15E213
	end

ShoalCave_LowTideInnerRoom_EventScript_15E213:: @ 815E213
	checkflag FLAG_HIDE_TOOK_SHOAL_SHELL_2
	goto_if_eq ShoalCave_LowTideInnerRoom_EventScript_15E22B
	setmaptile 41, 10, 857, 1
	goto ShoalCave_LowTideInnerRoom_EventScript_15E22B
	end

ShoalCave_LowTideInnerRoom_EventScript_15E22B:: @ 815E22B
	checkflag FLAG_HIDE_TOOK_SHOAL_SHELL_3
	goto_if_eq ShoalCave_LowTideInnerRoom_EventScript_15E243
	setmaptile 6, 9, 857, 1
	goto ShoalCave_LowTideInnerRoom_EventScript_15E243
	end

ShoalCave_LowTideInnerRoom_EventScript_15E243:: @ 815E243
	checkflag FLAG_HIDE_TOOK_SHOAL_SHELL_4
	goto_if_eq ShoalCave_LowTideInnerRoom_EventScript_15E256
	setmaptile 16, 13, 857, 1
	return

ShoalCave_LowTideInnerRoom_EventScript_15E256:: @ 815E256
	return

ShoalCave_LowTideInnerRoom_EventScript_15E257:: @ 815E257
	lockall
	checkflag FLAG_HIDE_TOOK_SHOAL_SHELL_1
	goto_if_eq ShoalCave_LowTideInnerRoom_EventScript_15E289
	giveitem ITEM_SHOAL_SHELL
	compare RESULT, 0
	goto_if_eq ShoalCave_LowTideInnerRoom_EventScript_1A029B
	setmaptile 41, 20, 859, 0
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
	checkflag FLAG_HIDE_TOOK_SHOAL_SHELL_2
	goto_if_eq ShoalCave_LowTideInnerRoom_EventScript_15E289
	giveitem ITEM_SHOAL_SHELL
	compare RESULT, 0
	goto_if_eq ShoalCave_LowTideInnerRoom_EventScript_1A029B
	setmaptile 41, 10, 859, 0
	special DrawWholeMapView
	setflag FLAG_HIDE_TOOK_SHOAL_SHELL_2
	releaseall
	end

ShoalCave_LowTideInnerRoom_EventScript_15E2C5:: @ 815E2C5
	lockall
	checkflag FLAG_HIDE_TOOK_SHOAL_SHELL_3
	goto_if_eq ShoalCave_LowTideInnerRoom_EventScript_15E289
	giveitem ITEM_SHOAL_SHELL
	compare RESULT, 0
	goto_if_eq ShoalCave_LowTideInnerRoom_EventScript_1A029B
	setmaptile 6, 9, 859, 0
	special DrawWholeMapView
	setflag FLAG_HIDE_TOOK_SHOAL_SHELL_3
	releaseall
	end

ShoalCave_LowTideInnerRoom_EventScript_15E2F7:: @ 815E2F7
	lockall
	checkflag FLAG_HIDE_TOOK_SHOAL_SHELL_4
	goto_if_eq ShoalCave_LowTideInnerRoom_EventScript_15E289
	giveitem ITEM_SHOAL_SHELL
	compare RESULT, 0
	goto_if_eq ShoalCave_LowTideInnerRoom_EventScript_1A029B
	setmaptile 16, 13, 859, 0
	special DrawWholeMapView
	setflag FLAG_HIDE_TOOK_SHOAL_SHELL_4
	releaseall
	end

ShoalCave_LowTideInnerRoom_EventScript_15E329:: @ 815E329
	lockall
	checkflag FLAG_HIDE_TOOK_SHOAL_SALT_1
	goto_if_eq ShoalCave_LowTideInnerRoom_EventScript_15E35B
	giveitem ITEM_SHOAL_SALT
	compare RESULT, 0
	goto_if_eq ShoalCave_LowTideInnerRoom_EventScript_1A029B
	setmaptile 31, 8, 858, 0
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
	checkflag FLAG_HIDE_TOOK_SHOAL_SALT_2
	goto_if_eq ShoalCave_LowTideInnerRoom_EventScript_15E35B
	giveitem ITEM_SHOAL_SALT
	compare RESULT, 0
	goto_if_eq ShoalCave_LowTideInnerRoom_EventScript_1A029B
	setmaptile 14, 26, 858, 0
	special DrawWholeMapView
	setflag FLAG_HIDE_TOOK_SHOAL_SALT_2
	releaseall
	end
