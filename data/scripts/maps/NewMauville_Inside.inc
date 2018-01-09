NewMauville_Inside_MapScripts:: @ 815E55F
	map_script 5, NewMauville_Inside_MapScript1_15E56F
	map_script 3, NewMauville_Inside_MapScript1_15E593
	map_script 1, NewMauville_Inside_MapScript1_15E59E
	.byte 0

NewMauville_Inside_MapScript1_15E56F:: @ 815E56F
	compare VAR_TEMP_1, 1
	call_if_eq NewMauville_Inside_EventScript_15E5DA
	compare VAR_TEMP_2, 1
	call_if_eq NewMauville_Inside_EventScript_15E728
	call_if_set FLAG_SYS_CTRL_OBJ_DELETE, NewMauville_Inside_EventScript_15E58F
	end

NewMauville_Inside_EventScript_15E58F:: @ 815E58F
	removeobject LAST_TALKED
	return

NewMauville_Inside_MapScript1_15E593:: @ 815E593
	setvar VAR_TEMP_1, 0
	setvar VAR_TEMP_2, 0
	end

NewMauville_Inside_MapScript1_15E59E:: @ 815E59E
	compare VAR_NEW_MAUVILLE_STATE, 2
	call_if_eq NewMauville_Inside_EventScript_15E88B
	end

NewMauville_Inside_EventScript_15E5AA:: @ 815E5AA
	lockall
	setvar VAR_TEMP_1, 1
	setvar VAR_TEMP_2, 0
	playse SE_PIN
	call NewMauville_Inside_EventScript_15E5DA
	special DrawWholeMapView
	releaseall
	end

NewMauville_Inside_EventScript_15E5C2:: @ 815E5C2
	lockall
	setvar VAR_TEMP_1, 0
	setvar VAR_TEMP_2, 1
	playse SE_PIN
	call NewMauville_Inside_EventScript_15E728
	special DrawWholeMapView
	releaseall
	end

NewMauville_Inside_EventScript_15E5DA:: @ 815E5DA
	setmetatile 23, 34, 617, 1
	setmetatile 23, 35, 625, 1
	setmetatile 23, 36, 621, 0
	setmetatile 23, 37, 641, 0
	setmetatile 10, 16, 617, 1
	setmetatile 10, 17, 625, 1
	setmetatile 10, 18, 621, 0
	setmetatile 10, 19, 641, 0
	setmetatile 10, 0, 617, 1
	setmetatile 10, 1, 625, 1
	setmetatile 10, 2, 621, 0
	setmetatile 10, 3, 641, 0
	setmetatile 37, 33, 694, 1
	setmetatile 37, 34, 702, 1
	setmetatile 37, 35, 710, 1
	setmetatile 37, 36, 718, 1
	setmetatile 28, 22, 694, 1
	setmetatile 28, 23, 702, 1
	setmetatile 28, 24, 710, 1
	setmetatile 28, 25, 718, 1
	setmetatile 10, 24, 694, 1
	setmetatile 10, 25, 702, 1
	setmetatile 10, 26, 710, 1
	setmetatile 10, 27, 718, 1
	setmetatile 21, 2, 694, 1
	setmetatile 21, 3, 702, 1
	setmetatile 21, 4, 710, 1
	setmetatile 21, 5, 718, 1
	setmetatile 6, 11, 591, 0
	setmetatile 13, 10, 591, 0
	setmetatile 16, 22, 591, 0
	setmetatile 4, 26, 591, 0
	setmetatile 30, 38, 591, 0
	setmetatile 2, 11, 558, 0
	setmetatile 17, 10, 558, 0
	setmetatile 25, 18, 558, 0
	setmetatile 18, 36, 558, 0
	return

NewMauville_Inside_EventScript_15E728:: @ 815E728
	setmetatile 23, 34, 695, 1
	setmetatile 23, 35, 703, 1
	setmetatile 23, 36, 711, 1
	setmetatile 23, 37, 719, 1
	setmetatile 10, 16, 695, 1
	setmetatile 10, 17, 703, 1
	setmetatile 10, 18, 711, 1
	setmetatile 10, 19, 719, 1
	setmetatile 10, 0, 695, 1
	setmetatile 10, 1, 703, 1
	setmetatile 10, 2, 711, 1
	setmetatile 10, 3, 719, 1
	setmetatile 37, 33, 617, 1
	setmetatile 37, 34, 625, 1
	setmetatile 37, 35, 621, 0
	setmetatile 37, 36, 641, 0
	setmetatile 28, 22, 617, 1
	setmetatile 28, 23, 625, 1
	setmetatile 28, 24, 621, 0
	setmetatile 28, 25, 641, 0
	setmetatile 10, 24, 617, 1
	setmetatile 10, 25, 625, 1
	setmetatile 10, 26, 621, 0
	setmetatile 10, 27, 641, 0
	setmetatile 21, 2, 617, 1
	setmetatile 21, 3, 625, 1
	setmetatile 21, 4, 621, 0
	setmetatile 21, 5, 641, 0
	setmetatile 2, 11, 591, 0
	setmetatile 17, 10, 591, 0
	setmetatile 25, 18, 591, 0
	setmetatile 18, 36, 591, 0
	setmetatile 6, 11, 566, 0
	setmetatile 13, 10, 566, 0
	setmetatile 16, 22, 566, 0
	setmetatile 4, 26, 566, 0
	setmetatile 30, 38, 566, 0
	return

NewMauville_Inside_EventScript_15E876:: @ 815E876
	lockall
	msgbox NewMauville_Inside_Text_1983B1, 4
	call NewMauville_Inside_EventScript_15E88B
	setvar VAR_NEW_MAUVILLE_STATE, 2
	releaseall
	end

NewMauville_Inside_EventScript_15E88B:: @ 815E88B
	setmetatile 33, 6, 591, 0
	setmetatile 32, 2, 752, 1
	setmetatile 33, 2, 753, 1
	setmetatile 34, 2, 754, 1
	setmetatile 35, 2, 755, 1
	setmetatile 32, 3, 756, 1
	setmetatile 33, 3, 757, 1
	setmetatile 34, 3, 758, 1
	setmetatile 35, 3, 759, 1
	special DrawWholeMapView
	return

NewMauville_Inside_EventScript_15E8E0:: @ 815E8E0
	lockall
	compare VAR_NEW_MAUVILLE_STATE, 2
	goto_if_eq NewMauville_Inside_EventScript_15E8F6
	msgbox NewMauville_Inside_Text_198315, 4
	releaseall
	end

NewMauville_Inside_EventScript_15E8F6:: @ 815E8F6
	msgbox NewMauville_Inside_Text_198395, 4
	releaseall
	end

NewMauville_Inside_EventScript_15E900:: @ 815E900
	lock
	faceplayer
	setwildbattle SPECIES_VOLTORB, 25, ITEM_NONE
	waitse
	playmoncry SPECIES_VOLTORB, 2
	delay 40
	waitmoncry
	setflag FLAG_HIDE_VOLTORB_1_NEW_MAUVILLE
	setflag FLAG_SYS_CTRL_OBJ_DELETE
	dowildbattle
	clearflag FLAG_SYS_CTRL_OBJ_DELETE
	release
	end

NewMauville_Inside_EventScript_15E91E:: @ 815E91E
	lock
	faceplayer
	setwildbattle SPECIES_VOLTORB, 25, ITEM_NONE
	waitse
	playmoncry SPECIES_VOLTORB, 2
	delay 40
	waitmoncry
	setflag FLAG_HIDE_VOLTORB_2_NEW_MAUVILLE
	setflag FLAG_SYS_CTRL_OBJ_DELETE
	dowildbattle
	clearflag FLAG_SYS_CTRL_OBJ_DELETE
	release
	end

NewMauville_Inside_EventScript_15E93C:: @ 815E93C
	lock
	faceplayer
	setwildbattle SPECIES_VOLTORB, 25, ITEM_NONE
	waitse
	playmoncry SPECIES_VOLTORB, 2
	delay 40
	waitmoncry
	setflag FLAG_HIDE_VOLTORB_3_NEW_MAUVILLE
	setflag FLAG_SYS_CTRL_OBJ_DELETE
	dowildbattle
	clearflag FLAG_SYS_CTRL_OBJ_DELETE
	release
	end
