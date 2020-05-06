ShoalCave_LowTideInnerRoom_MapScripts:: @ 815E192
	map_script MAP_SCRIPT_ON_LOAD, ShoalCave_LowTideInnerRoom_MapScript1_15E1B3
	map_script MAP_SCRIPT_ON_TRANSITION, ShoalCave_LowTideInnerRoom_MapScript1_15E19D
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
	setmetatile 31, 8, METATILE_Cave_ShoalCave_DirtPile_Large, 1
	goto ShoalCave_LowTideInnerRoom_EventScript_15E1DA
	end

ShoalCave_LowTideInnerRoom_EventScript_15E1DA:: @ 815E1DA
	goto_if_set FLAG_HIDE_TOOK_SHOAL_SALT_2, ShoalCave_LowTideInnerRoom_EventScript_15E1FB
	goto_if_set FLAG_SYS_SHOAL_TIDE, ShoalCave_LowTideInnerRoom_EventScript_15E1FB
	setmetatile 14, 26, METATILE_Cave_ShoalCave_DirtPile_Large, 1
	goto ShoalCave_LowTideInnerRoom_EventScript_15E1FB
	end

ShoalCave_LowTideInnerRoom_EventScript_15E1FB:: @ 815E1FB
	goto_if_set FLAG_HIDE_TOOK_SHOAL_SHELL_1, ShoalCave_LowTideInnerRoom_EventScript_15E213
	setmetatile 41, 20, METATILE_Cave_ShoalCave_BlueStone_Large, 1
	goto ShoalCave_LowTideInnerRoom_EventScript_15E213
	end

ShoalCave_LowTideInnerRoom_EventScript_15E213:: @ 815E213
	goto_if_set FLAG_HIDE_TOOK_SHOAL_SHELL_2, ShoalCave_LowTideInnerRoom_EventScript_15E22B
	setmetatile 41, 10, METATILE_Cave_ShoalCave_BlueStone_Large, 1
	goto ShoalCave_LowTideInnerRoom_EventScript_15E22B
	end

ShoalCave_LowTideInnerRoom_EventScript_15E22B:: @ 815E22B
	goto_if_set FLAG_HIDE_TOOK_SHOAL_SHELL_3, ShoalCave_LowTideInnerRoom_EventScript_15E243
	setmetatile 6, 9, METATILE_Cave_ShoalCave_BlueStone_Large, 1
	goto ShoalCave_LowTideInnerRoom_EventScript_15E243
	end

ShoalCave_LowTideInnerRoom_EventScript_15E243:: @ 815E243
	goto_if_set FLAG_HIDE_TOOK_SHOAL_SHELL_4, ShoalCave_LowTideInnerRoom_EventScript_15E256
	setmetatile 16, 13, METATILE_Cave_ShoalCave_BlueStone_Large, 1
	return

ShoalCave_LowTideInnerRoom_EventScript_15E256:: @ 815E256
	return

ShoalCave_LowTideInnerRoom_EventScript_15E257:: @ 815E257
	lockall
	goto_if_set FLAG_HIDE_TOOK_SHOAL_SHELL_1, ShoalCave_LowTideInnerRoom_EventScript_15E289
	giveitem ITEM_SHOAL_SHELL
	compare VAR_RESULT, 0
	goto_if_eq Common_EventScript_ShowBagIsFull
	setmetatile 41, 20, METATILE_Cave_ShoalCave_BlueStone_Small, 0
	special DrawWholeMapView
	setflag FLAG_HIDE_TOOK_SHOAL_SHELL_1
	releaseall
	end

ShoalCave_LowTideInnerRoom_EventScript_15E289:: @ 815E289
	msgbox ShoalCave_LowTideInnerRoom_Text_1C69B8, MSGBOX_DEFAULT
	releaseall
	end

ShoalCave_LowTideInnerRoom_EventScript_15E293:: @ 815E293
	lockall
	goto_if_set FLAG_HIDE_TOOK_SHOAL_SHELL_2, ShoalCave_LowTideInnerRoom_EventScript_15E289
	giveitem ITEM_SHOAL_SHELL
	compare VAR_RESULT, 0
	goto_if_eq Common_EventScript_ShowBagIsFull
	setmetatile 41, 10, METATILE_Cave_ShoalCave_BlueStone_Small, 0
	special DrawWholeMapView
	setflag FLAG_HIDE_TOOK_SHOAL_SHELL_2
	releaseall
	end

ShoalCave_LowTideInnerRoom_EventScript_15E2C5:: @ 815E2C5
	lockall
	goto_if_set FLAG_HIDE_TOOK_SHOAL_SHELL_3, ShoalCave_LowTideInnerRoom_EventScript_15E289
	giveitem ITEM_SHOAL_SHELL
	compare VAR_RESULT, 0
	goto_if_eq Common_EventScript_ShowBagIsFull
	setmetatile 6, 9, METATILE_Cave_ShoalCave_BlueStone_Small, 0
	special DrawWholeMapView
	setflag FLAG_HIDE_TOOK_SHOAL_SHELL_3
	releaseall
	end

ShoalCave_LowTideInnerRoom_EventScript_15E2F7:: @ 815E2F7
	lockall
	goto_if_set FLAG_HIDE_TOOK_SHOAL_SHELL_4, ShoalCave_LowTideInnerRoom_EventScript_15E289
	giveitem ITEM_SHOAL_SHELL
	compare VAR_RESULT, 0
	goto_if_eq Common_EventScript_ShowBagIsFull
	setmetatile 16, 13, METATILE_Cave_ShoalCave_BlueStone_Small, 0
	special DrawWholeMapView
	setflag FLAG_HIDE_TOOK_SHOAL_SHELL_4
	releaseall
	end

ShoalCave_LowTideInnerRoom_EventScript_15E329:: @ 815E329
	lockall
	goto_if_set FLAG_HIDE_TOOK_SHOAL_SALT_1, ShoalCave_LowTideInnerRoom_EventScript_15E35B
	giveitem ITEM_SHOAL_SALT
	compare VAR_RESULT, 0
	goto_if_eq Common_EventScript_ShowBagIsFull
	setmetatile 31, 8, METATILE_Cave_ShoalCave_DirtPile_Small, 0
	special DrawWholeMapView
	setflag FLAG_HIDE_TOOK_SHOAL_SALT_1
	releaseall
	end

ShoalCave_LowTideInnerRoom_EventScript_15E35B:: @ 815E35B
	msgbox ShoalCave_LowTideInnerRoom_Text_1C6979, MSGBOX_DEFAULT
	releaseall
	end

ShoalCave_LowTideInnerRoom_EventScript_15E365:: @ 815E365
	lockall
	goto_if_set FLAG_HIDE_TOOK_SHOAL_SALT_2, ShoalCave_LowTideInnerRoom_EventScript_15E35B
	giveitem ITEM_SHOAL_SALT
	compare VAR_RESULT, 0
	goto_if_eq Common_EventScript_ShowBagIsFull
	setmetatile 14, 26, METATILE_Cave_ShoalCave_DirtPile_Small, 0
	special DrawWholeMapView
	setflag FLAG_HIDE_TOOK_SHOAL_SALT_2
	releaseall
	end
