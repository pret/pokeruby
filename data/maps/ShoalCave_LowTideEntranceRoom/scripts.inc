ShoalCave_LowTideEntranceRoom_MapScripts:: @ 815E057
	map_script MAP_SCRIPT_ON_TRANSITION, ShoalCave_LowTideEntranceRoom_MapScript1_15E05D
	.byte 0

ShoalCave_LowTideEntranceRoom_MapScript1_15E05D:: @ 815E05D
	special UpdateShoalTideFlag
	goto_if_set FLAG_SYS_SHOAL_TIDE, ShoalCave_LowTideEntranceRoom_EventScript_15E06E
	goto ShoalCave_LowTideEntranceRoom_EventScript_15E072

ShoalCave_LowTideEntranceRoom_EventScript_15E06E:: @ 815E06E
	setmaplayoutindex 169
	end

ShoalCave_LowTideEntranceRoom_EventScript_15E072:: @ 815E072
	setmaplayoutindex 165
	end

ShoalCave_LowTideEntranceRoom_EventScript_15E076:: @ 815E076
	lock
	faceplayer
	dotimebasedevents
	call_if_set FLAG_SYS_SHOAL_ITEM, ShoalCave_LowTideEntranceRoom_EventScript_15E176
	checkitem ITEM_SHOAL_SALT, 4
	compare VAR_RESULT, 0
	goto_if_eq ShoalCave_LowTideEntranceRoom_EventScript_15E138
	checkitem ITEM_SHOAL_SHELL, 4
	compare VAR_RESULT, 0
	goto_if_eq ShoalCave_LowTideEntranceRoom_EventScript_15E138
	msgbox ShoalCave_LowTideEntranceRoom_Text_1C6793, MSGBOX_YESNO
	compare VAR_RESULT, NO
	goto_if_eq ShoalCave_LowTideEntranceRoom_EventScript_15E16C
	checkitemspace ITEM_SHELL_BELL, 1
	compare VAR_RESULT, 0
	call_if_eq ShoalCave_LowTideEntranceRoom_EventScript_15E106
	compare VAR_RESULT, 2
	goto_if_eq ShoalCave_LowTideEntranceRoom_EventScript_15E12E
	msgbox ShoalCave_LowTideEntranceRoom_Text_1C6808, MSGBOX_DEFAULT
	removeitem ITEM_SHOAL_SALT, 4
	removeitem ITEM_SHOAL_SHELL, 4
	giveitem ITEM_SHELL_BELL
	compare VAR_RESULT, 0
	goto_if_eq Common_EventScript_ShowBagIsFull
	msgbox ShoalCave_LowTideEntranceRoom_Text_1C688E, MSGBOX_DEFAULT
	setflag FLAG_TEMP_2
	release
	end

ShoalCave_LowTideEntranceRoom_EventScript_15E106:: @ 815E106
	checkitem ITEM_SHOAL_SALT, 5
	compare VAR_RESULT, 1
	goto_if_eq ShoalCave_LowTideEntranceRoom_EventScript_15E117
	return

ShoalCave_LowTideEntranceRoom_EventScript_15E117:: @ 815E117
	checkitem ITEM_SHOAL_SHELL, 5
	compare VAR_RESULT, 1
	goto_if_eq ShoalCave_LowTideEntranceRoom_EventScript_15E128
	return

ShoalCave_LowTideEntranceRoom_EventScript_15E128:: @ 815E128
	setvar VAR_RESULT, 2
	return

ShoalCave_LowTideEntranceRoom_EventScript_15E12E:: @ 815E12E
	msgbox ShoalCave_LowTideEntranceRoom_Text_1C69F5, MSGBOX_DEFAULT
	release
	end

ShoalCave_LowTideEntranceRoom_EventScript_15E138:: @ 815E138
	checkitem ITEM_SHOAL_SALT, 1
	compare VAR_RESULT, 1
	goto_if_eq ShoalCave_LowTideEntranceRoom_EventScript_15E162
	checkitem ITEM_SHOAL_SHELL, 1
	compare VAR_RESULT, 1
	goto_if_eq ShoalCave_LowTideEntranceRoom_EventScript_15E162
	msgbox ShoalCave_LowTideEntranceRoom_Text_1C6668, MSGBOX_DEFAULT
	release
	end

ShoalCave_LowTideEntranceRoom_EventScript_15E162:: @ 815E162
	msgbox ShoalCave_LowTideEntranceRoom_Text_1C670D, MSGBOX_DEFAULT
	release
	end

ShoalCave_LowTideEntranceRoom_EventScript_15E16C:: @ 815E16C
	msgbox ShoalCave_LowTideEntranceRoom_Text_1C6944, MSGBOX_DEFAULT
	release
	end

ShoalCave_LowTideEntranceRoom_EventScript_15E176:: @ 815E176
	clearflag FLAG_HIDE_TOOK_SHOAL_SALT_1
	clearflag FLAG_HIDE_TOOK_SHOAL_SALT_2
	clearflag FLAG_HIDE_TOOK_SHOAL_SALT_3
	clearflag FLAG_HIDE_TOOK_SHOAL_SALT_4
	clearflag FLAG_HIDE_TOOK_SHOAL_SHELL_1
	clearflag FLAG_HIDE_TOOK_SHOAL_SHELL_2
	clearflag FLAG_HIDE_TOOK_SHOAL_SHELL_3
	clearflag FLAG_HIDE_TOOK_SHOAL_SHELL_4
	clearflag FLAG_SYS_SHOAL_ITEM
	return
