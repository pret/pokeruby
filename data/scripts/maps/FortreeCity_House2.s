FortreeCity_House2_MapScripts:: @ 81580B3
	.byte 0

FortreeCity_House2_EventScript_1580B4:: @ 81580B4
	lock
	faceplayer
	checkflag 264
	jumpif FLAG_IS_SET, FortreeCity_House2_EventScript_158157
	checkflag 118
	callif FLAG_NOT_SET, FortreeCity_House2_EventScript_15814B
	msgbox FortreeCity_House2_Text_186360, 4
	multichoice 21, 8, 54, 1
	switch RESULT
	case 1, FortreeCity_House2_EventScript_158161
	msgbox FortreeCity_House2_Text_1863F6, 4
	multichoice 21, 8, 54, 1
	switch RESULT
	case 1, FortreeCity_House2_EventScript_158161
	msgbox FortreeCity_House2_Text_186455, 4
	multichoice 21, 8, 54, 1
	switch RESULT
	case 0, FortreeCity_House2_EventScript_158161
	msgbox FortreeCity_House2_Text_1864C6, 4
	giveitem ITEM_TM10
	compare RESULT, 0
	jumpif EQUAL, FortreeCity_House2_EventScript_1A029B
	setflag 264
	msgbox FortreeCity_House2_Text_18652F, 4
	release
	end

FortreeCity_House2_EventScript_15814B:: @ 815814B
	msgbox FortreeCity_House2_Text_186306, 4
	setflag 118
	return

FortreeCity_House2_EventScript_158157:: @ 8158157
	msgbox FortreeCity_House2_Text_18652F, 4
	release
	end

FortreeCity_House2_EventScript_158161:: @ 8158161
	msgbox FortreeCity_House2_Text_186565, 4
	release
	end
