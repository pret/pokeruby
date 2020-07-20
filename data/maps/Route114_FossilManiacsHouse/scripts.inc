Route114_FossilManiacsHouse_MapScripts:: @ 815C1B9
	map_script MAP_SCRIPT_ON_TRANSITION, Route114_FossilManiacsHouse_MapScript1_15C1BF
	.byte 0

Route114_FossilManiacsHouse_MapScript1_15C1BF:: @ 815C1BF
	setflag FLAG_LANDMARK_FOSSIL_MANIACS_HOUSE
	end

Route114_FossilManiacsHouse_EventScript_15C1C3:: @ 815C1C3
	lock
	faceplayer
	goto_if_set FLAG_RECEIVED_TM28, Route114_FossilManiacsHouse_EventScript_15C1F2
	msgbox Route114_FossilManiacsHouse_Text_1925E1, MSGBOX_DEFAULT
	giveitem ITEM_TM28_DIG
	compare VAR_RESULT, 0
	goto_if_eq Common_EventScript_ShowBagIsFull
	setflag FLAG_RECEIVED_TM28
	release
	end

Route114_FossilManiacsHouse_EventScript_15C1F2:: @ 815C1F2
	msgbox Route114_FossilManiacsHouse_Text_1926AE, MSGBOX_DEFAULT
	release
	end

Route114_FossilManiacsHouse_EventScript_15C1FC:: @ 815C1FC
	msgbox Route114_FossilManiacsHouse_Text_1926FA, MSGBOX_SIGN
	end

Route114_FossilManiacsHouse_EventScript_15C205:: @ 815C205
	msgbox Route114_FossilManiacsHouse_Text_192729, MSGBOX_SIGN
	end
