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
	loadptr 0, FortreeCity_Text_167577
	callstd 2
	end

FortreeCity_EventScript_14C95E:: @ 814C95E
	lock
	faceplayer
	checkflag 295
	jumpeq FortreeCity_EventScript_14C973
	loadptr 0, FortreeCity_Text_1675C2
	callstd 4
	release
	end

FortreeCity_EventScript_14C973:: @ 814C973
	loadptr 0, FortreeCity_Text_167642
	callstd 4
	release
	end

FortreeCity_EventScript_14C97D:: @ 814C97D
	loadptr 0, FortreeCity_Text_16768A
	callstd 2
	end

FortreeCity_EventScript_14C986:: @ 814C986
	loadptr 0, FortreeCity_Text_16770E
	callstd 2
	end

FortreeCity_EventScript_14C98F:: @ 814C98F
	loadptr 0, FortreeCity_Text_1677BD
	callstd 2
	end

FortreeCity_EventScript_14C998:: @ 814C998
	loadptr 0, FortreeCity_Text_16782C
	callstd 2
	end

FortreeCity_EventScript_14C9A1:: @ 814C9A1
	loadptr 0, FortreeCity_Text_16792F
	callstd 3
	end

FortreeCity_EventScript_14C9AA:: @ 814C9AA
	loadptr 0, FortreeCity_Text_167969
	callstd 3
	end

FortreeCity_EventScript_14C9B3:: @ 814C9B3
	lock
	faceplayer
	checkitem ITEM_DEVON_SCOPE, 1
	compare RESULT, 1
	jumpeq FortreeCity_EventScript_14C9CF
	loadptr 0, FortreeCity_Text_167868
	callstd 4
	release
	end

FortreeCity_EventScript_14C9CF:: @ 814C9CF
	loadptr 0, FortreeCity_Text_16788B
	callstd 5
	compare RESULT, 1
	jumpeq FortreeCity_EventScript_14C9E4
	release
	end

FortreeCity_EventScript_14C9E4:: @ 814C9E4
	loadptr 0, FortreeCity_Text_1678CB
	callstd 4
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

