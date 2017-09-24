ShoalCave_LowTideEntranceRoom_MapScripts:: @ 815E057
	map_script 3, ShoalCave_LowTideEntranceRoom_MapScript1_15E05D
	.byte 0

ShoalCave_LowTideEntranceRoom_MapScript1_15E05D:: @ 815E05D
	special UpdateShoalTideFlag
	checkflag 2106
	goto_if_eq ShoalCave_LowTideEntranceRoom_EventScript_15E06E
	goto ShoalCave_LowTideEntranceRoom_EventScript_15E072

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
	call_if 1, ShoalCave_LowTideEntranceRoom_EventScript_15E176
	checkitem ITEM_SHOAL_SALT, 4
	compare_var_to_imm RESULT, 0
	goto_if_eq ShoalCave_LowTideEntranceRoom_EventScript_15E138
	checkitem ITEM_SHOAL_SHELL, 4
	compare_var_to_imm RESULT, 0
	goto_if_eq ShoalCave_LowTideEntranceRoom_EventScript_15E138
	msgbox ShoalCave_LowTideEntranceRoom_Text_1C6793, 5
	compare_var_to_imm RESULT, 0
	goto_if_eq ShoalCave_LowTideEntranceRoom_EventScript_15E16C
	checkitemspace ITEM_SHELL_BELL, 1
	compare_var_to_imm RESULT, 0
	call_if 1, ShoalCave_LowTideEntranceRoom_EventScript_15E106
	compare_var_to_imm RESULT, 2
	goto_if_eq ShoalCave_LowTideEntranceRoom_EventScript_15E12E
	msgbox ShoalCave_LowTideEntranceRoom_Text_1C6808, 4
	removeitem ITEM_SHOAL_SALT, 4
	removeitem ITEM_SHOAL_SHELL, 4
	giveitem ITEM_SHELL_BELL
	compare_var_to_imm RESULT, 0
	goto_if_eq ShoalCave_LowTideEntranceRoom_EventScript_1A029B
	msgbox ShoalCave_LowTideEntranceRoom_Text_1C688E, 4
	setflag 2
	release
	end

ShoalCave_LowTideEntranceRoom_EventScript_15E106:: @ 815E106
	checkitem ITEM_SHOAL_SALT, 5
	compare_var_to_imm RESULT, 1
	goto_if_eq ShoalCave_LowTideEntranceRoom_EventScript_15E117
	return

ShoalCave_LowTideEntranceRoom_EventScript_15E117:: @ 815E117
	checkitem ITEM_SHOAL_SHELL, 5
	compare_var_to_imm RESULT, 1
	goto_if_eq ShoalCave_LowTideEntranceRoom_EventScript_15E128
	return

ShoalCave_LowTideEntranceRoom_EventScript_15E128:: @ 815E128
	setvar RESULT, 2
	return

ShoalCave_LowTideEntranceRoom_EventScript_15E12E:: @ 815E12E
	msgbox ShoalCave_LowTideEntranceRoom_Text_1C69F5, 4
	release
	end

ShoalCave_LowTideEntranceRoom_EventScript_15E138:: @ 815E138
	checkitem ITEM_SHOAL_SALT, 1
	compare_var_to_imm RESULT, 1
	goto_if_eq ShoalCave_LowTideEntranceRoom_EventScript_15E162
	checkitem ITEM_SHOAL_SHELL, 1
	compare_var_to_imm RESULT, 1
	goto_if_eq ShoalCave_LowTideEntranceRoom_EventScript_15E162
	msgbox ShoalCave_LowTideEntranceRoom_Text_1C6668, 4
	release
	end

ShoalCave_LowTideEntranceRoom_EventScript_15E162:: @ 815E162
	msgbox ShoalCave_LowTideEntranceRoom_Text_1C670D, 4
	release
	end

ShoalCave_LowTideEntranceRoom_EventScript_15E16C:: @ 815E16C
	msgbox ShoalCave_LowTideEntranceRoom_Text_1C6944, 4
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
