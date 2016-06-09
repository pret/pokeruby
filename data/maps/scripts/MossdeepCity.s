MossdeepCity_MapScripts:: @ 814CF92
	map_script 3, MossdeepCity_MapScript1_14CF98
	.byte 0

MossdeepCity_MapScript1_14CF98:: @ 814CF98
	clearflag 100
	clearflag 101
	clearflag 102
	clearflag 103
	checkflag 2090
	callif 1, MossdeepCity_EventScript_1A02C1
	end

MossdeepCity_EventScript_14CFAE:: @ 814CFAE
	loadptr 0, MossdeepCity_Text_169266
	callstd 2
	end

MossdeepCity_EventScript_14CFB7:: @ 814CFB7
	loadptr 0, MossdeepCity_Text_1692A1
	callstd 2
	end

MossdeepCity_EventScript_14CFC0:: @ 814CFC0
	loadptr 0, MossdeepCity_Text_1691F2
	callstd 2
	end

MossdeepCity_EventScript_14CFC9:: @ 814CFC9
	loadptr 0, MossdeepCity_Text_169370
	callstd 2
	end

MossdeepCity_EventScript_14CFD2:: @ 814CFD2
	loadptr 0, MossdeepCity_Text_169314
	callstd 2
	end

MossdeepCity_EventScript_14CFDB:: @ 814CFDB
	loadptr 0, MossdeepCity_Text_1694DA
	callstd 2
	end

MossdeepCity_EventScript_14CFE4:: @ 814CFE4
	loadptr 0, MossdeepCity_Text_1695D3
	callstd 3
	end

MossdeepCity_EventScript_14CFED:: @ 814CFED
	loadptr 0, MossdeepCity_Text_1695E6
	callstd 3
	end

MossdeepCity_EventScript_14CFF6:: @ 814CFF6
	loadptr 0, MossdeepCity_Text_16962F
	callstd 3
	end

MossdeepCity_EventScript_14CFFF:: @ 814CFFF
	loadptr 0, MossdeepCity_Text_16965C
	callstd 3
	end

MossdeepCity_EventScript_14D008:: @ 814D008
	setflag 2076
	setvar 0x4001, 1
	end

MossdeepCity_EventScript_14D011:: @ 814D011
	lock
	faceplayer
	loadptr 0, MossdeepCity_Text_16944E
	callstd 4
	move LAST_TALKED, MossdeepCity_Movement_1A083D
	waitmove 0
	release
	end

MossdeepCity_EventScript_14D027:: @ 814D027
	lock
	faceplayer
	checkflag 276
	jumpeq MossdeepCity_EventScript_14D069
	loadptr 0, MossdeepCity_Text_1690A9
	callstd 5
	compare RESULT, 0
	jumpeq MossdeepCity_EventScript_14D073
	loadptr 0, MossdeepCity_Text_169117
	callstd 4
	setorcopyvar 0x8000, 0xbb
	setorcopyvar 0x8001, 0x1
	callstd 0
	compare RESULT, 0
	jumpeq MossdeepCity_EventScript_1A029B
	setflag 276
	release
	end

MossdeepCity_EventScript_14D069:: @ 814D069
	loadptr 0, MossdeepCity_Text_16916F
	callstd 4
	release
	end

MossdeepCity_EventScript_14D073:: @ 814D073
	loadptr 0, MossdeepCity_Text_1691A7
	callstd 4
	release
	end

