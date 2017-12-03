Route114_FossilManiacsHouse_MapScripts:: @ 815C1B9
	map_script 3, Route114_FossilManiacsHouse_MapScript1_15C1BF
	.byte 0

Route114_FossilManiacsHouse_MapScript1_15C1BF:: @ 815C1BF
	setflag 2135
	end

Route114_FossilManiacsHouse_EventScript_15C1C3:: @ 815C1C3
	lock
	faceplayer
	checkflag FLAG_RECEIVED_TM28
	goto_if_eq Route114_FossilManiacsHouse_EventScript_15C1F2
	msgbox Route114_FossilManiacsHouse_Text_1925E1, 4
	giveitem ITEM_TM28
	compare RESULT, 0
	goto_if_eq Route114_FossilManiacsHouse_EventScript_1A029B
	setflag FLAG_RECEIVED_TM28
	release
	end

Route114_FossilManiacsHouse_EventScript_15C1F2:: @ 815C1F2
	msgbox Route114_FossilManiacsHouse_Text_1926AE, 4
	release
	end

Route114_FossilManiacsHouse_EventScript_15C1FC:: @ 815C1FC
	msgbox Route114_FossilManiacsHouse_Text_1926FA, 3
	end

Route114_FossilManiacsHouse_EventScript_15C205:: @ 815C205
	msgbox Route114_FossilManiacsHouse_Text_192729, 3
	end
