Route114_FossilManiacsHouse_MapScripts:: @ 815C1B9
	map_script 3, Route114_FossilManiacsHouse_MapScript1_15C1BF
	.byte 0

Route114_FossilManiacsHouse_MapScript1_15C1BF:: @ 815C1BF
	setflag 2135
	end

Route114_FossilManiacsHouse_EventScript_15C1C3:: @ 815C1C3
	lock
	faceplayer
	checkflag 261
	jumpeq Route114_FossilManiacsHouse_EventScript_15C1F2
	loadptr 0, Route114_FossilManiacsHouse_Text_1925E1
	callstd 4
	setorcopyvar 0x8000, 0x13c
	setorcopyvar 0x8001, 0x1
	callstd 0
	compare RESULT, 0
	jumpeq Route114_FossilManiacsHouse_EventScript_1A029B
	setflag 261
	release
	end

Route114_FossilManiacsHouse_EventScript_15C1F2:: @ 815C1F2
	loadptr 0, Route114_FossilManiacsHouse_Text_1926AE
	callstd 4
	release
	end

Route114_FossilManiacsHouse_EventScript_15C1FC:: @ 815C1FC
	loadptr 0, Route114_FossilManiacsHouse_Text_1926FA
	callstd 3
	end

Route114_FossilManiacsHouse_EventScript_15C205:: @ 815C205
	loadptr 0, Route114_FossilManiacsHouse_Text_192729
	callstd 3
	end

