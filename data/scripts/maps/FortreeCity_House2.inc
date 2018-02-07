FortreeCity_House2_MapScripts:: @ 81580B3
	.byte 0

FortreeCity_House2_EventScript_1580B4:: @ 81580B4
	lock
	faceplayer
	goto_if_set FLAG_RECEIVED_TM10, FortreeCity_House2_EventScript_158157
	call_if_unset FLAG_MET_HIDDEN_POWER_GIVER, FortreeCity_House2_EventScript_15814B
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
	giveitem_std ITEM_TM10_HIDDEN_POWER
	compare RESULT, 0
	goto_if_eq FortreeCity_House2_EventScript_1A029B
	setflag FLAG_RECEIVED_TM10
	msgbox FortreeCity_House2_Text_18652F, 4
	release
	end

FortreeCity_House2_EventScript_15814B:: @ 815814B
	msgbox FortreeCity_House2_Text_186306, 4
	setflag FLAG_MET_HIDDEN_POWER_GIVER
	return

FortreeCity_House2_EventScript_158157:: @ 8158157
	msgbox FortreeCity_House2_Text_18652F, 4
	release
	end

FortreeCity_House2_EventScript_158161:: @ 8158161
	msgbox FortreeCity_House2_Text_186565, 4
	release
	end
