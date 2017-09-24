FortreeCity_MapScripts:: @ 814C943
	map_script 3, FortreeCity_MapScript1_14C94E
	map_script 5, FortreeCity_MapScript1_14C952
	.byte 0

FortreeCity_MapScript1_14C94E:: @ 814C94E
	setflag 2074
	end

FortreeCity_MapScript1_14C952:: @ 814C952
	tileeffect 2
	end

FortreeCity_EventScript_14C955:: @ 814C955
	msgbox FortreeCity_Text_167577, 2
	end

FortreeCity_EventScript_14C95E:: @ 814C95E
	lock
	faceplayer
	checkflag 295
	goto_if_eq FortreeCity_EventScript_14C973
	msgbox FortreeCity_Text_1675C2, 4
	release
	end

FortreeCity_EventScript_14C973:: @ 814C973
	msgbox FortreeCity_Text_167642, 4
	release
	end

FortreeCity_EventScript_14C97D:: @ 814C97D
	msgbox FortreeCity_Text_16768A, 2
	end

FortreeCity_EventScript_14C986:: @ 814C986
	msgbox FortreeCity_Text_16770E, 2
	end

FortreeCity_EventScript_14C98F:: @ 814C98F
	msgbox FortreeCity_Text_1677BD, 2
	end

FortreeCity_EventScript_14C998:: @ 814C998
	msgbox FortreeCity_Text_16782C, 2
	end

FortreeCity_EventScript_14C9A1:: @ 814C9A1
	msgbox FortreeCity_Text_16792F, 3
	end

FortreeCity_EventScript_14C9AA:: @ 814C9AA
	msgbox FortreeCity_Text_167969, 3
	end

FortreeCity_EventScript_14C9B3:: @ 814C9B3
	lock
	faceplayer
	checkitem ITEM_DEVON_SCOPE, 1
	compare_var_to_imm RESULT, 1
	goto_if_eq FortreeCity_EventScript_14C9CF
	msgbox FortreeCity_Text_167868, 4
	release
	end

FortreeCity_EventScript_14C9CF:: @ 814C9CF
	msgbox FortreeCity_Text_16788B, 5
	compare_var_to_imm RESULT, 1
	goto_if_eq FortreeCity_EventScript_14C9E4
	release
	end

FortreeCity_EventScript_14C9E4:: @ 814C9E4
	msgbox FortreeCity_Text_1678CB, 4
	closebutton
	move LAST_TALKED, FortreeCity_Movement_1A0662
	waitmove 0
	checksound
	pokecry SPECIES_KECLEON, 2
	pause 40
	waitpokecry
	move LAST_TALKED, FortreeCity_Movement_14CA13
	waitmove 0
	disappear LAST_TALKED
	setflag 295
	release
	end

FortreeCity_Movement_14CA13:: @ 814CA13
	step_right
	step_end
