FortreeCity_House2_MapScripts:: @ 81580B3
	.byte 0

FortreeCity_House2_EventScript_1580B4:: @ 81580B4
	lock
	faceplayer
	checkflag 264
	jumpeq FortreeCity_House2_EventScript_158157
	checkflag 118
	callif 0, FortreeCity_House2_EventScript_15814B
	loadptr 0, FortreeCity_House2_Text_186360
	callstd 4
	multichoice 21, 8, 54, 1
	switch RESULT
	case 1, FortreeCity_House2_EventScript_158161
	loadptr 0, FortreeCity_House2_Text_1863F6
	callstd 4
	multichoice 21, 8, 54, 1
	switch RESULT
	case 1, FortreeCity_House2_EventScript_158161
	loadptr 0, FortreeCity_House2_Text_186455
	callstd 4
	multichoice 21, 8, 54, 1
	switch RESULT
	case 0, FortreeCity_House2_EventScript_158161
	loadptr 0, FortreeCity_House2_Text_1864C6
	callstd 4
	setorcopyvar 0x8000, 0x12a
	setorcopyvar 0x8001, 0x1
	callstd 0
	compare RESULT, 0
	jumpeq FortreeCity_House2_EventScript_1A029B
	setflag 264
	loadptr 0, FortreeCity_House2_Text_18652F
	callstd 4
	release
	end

FortreeCity_House2_EventScript_15814B:: @ 815814B
	loadptr 0, FortreeCity_House2_Text_186306
	callstd 4
	setflag 118
	return

FortreeCity_House2_EventScript_158157:: @ 8158157
	loadptr 0, FortreeCity_House2_Text_18652F
	callstd 4
	release
	end

FortreeCity_House2_EventScript_158161:: @ 8158161
	loadptr 0, FortreeCity_House2_Text_186565
	callstd 4
	release
	end

