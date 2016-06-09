SootopolisCity_MapScripts:: @ 814D07D
	map_script 1, SootopolisCity_MapScript1_14D08D
	map_script 3, SootopolisCity_MapScript1_14D10D
	map_script 5, SootopolisCity_MapScript1_14D165
	.byte 0

SootopolisCity_MapScript1_14D08D:: @ 814D08D
	checkflag 129
	callif 0, SootopolisCity_EventScript_14D0A0
	checkflag 129
	callif 1, SootopolisCity_EventScript_14D0B1
	end

SootopolisCity_EventScript_14D0A0:: @ 814D0A0
	movespriteperm 3, 31, 18
	setmaptile 31, 32, 592, 1
	return

SootopolisCity_EventScript_14D0B1:: @ 814D0B1
	checkflag 113
	callif 0, SootopolisCity_EventScript_14D0BB
	return

SootopolisCity_EventScript_14D0BB:: @ 814D0BB
	setmaptile 9, 6, 584, 1
	setmaptile 9, 17, 584, 1
	setmaptile 9, 26, 584, 1
	setmaptile 44, 17, 584, 1
	setmaptile 8, 35, 584, 1
	setmaptile 53, 28, 584, 1
	setmaptile 45, 6, 584, 1
	setmaptile 48, 25, 584, 1
	setmaptile 31, 32, 592, 1
	return

SootopolisCity_MapScript1_14D10D:: @ 814D10D
	setflag 2077
	checkflag 113
	callif 1, SootopolisCity_EventScript_14D159
	checkflag 2090
	callif 1, SootopolisCity_EventScript_14D123
	end

SootopolisCity_EventScript_14D123:: @ 814D123
	call SootopolisCity_EventScript_1A02C1
	movespriteperm 1, 29, 19
	movespriteperm 2, 33, 19
	compare 0x405e, 1
	callif 1, SootopolisCity_EventScript_14D142
	return

SootopolisCity_EventScript_14D142:: @ 814D142
	movespriteperm 10, 29, 6
	spritebehave 10, 10
	movespriteperm 5, 30, 6
	spritebehave 5, 9
	return

SootopolisCity_EventScript_14D159:: @ 814D159
	movespriteperm 10, 31, 33
	spritebehave 10, 8
	return

SootopolisCity_MapScript1_14D165:: @ 814D165
	warp4 Underwater_SootopolisCity, 255, 9, 6
	end

SootopolisCity_EventScript_14D16E:: @ 814D16E
	lock
	faceplayer
	checkflag 113
	jumpeq SootopolisCity_EventScript_14D183
	loadptr 0, SootopolisCity_Text_1696A4
	callstd 4
	release
	end

SootopolisCity_EventScript_14D183:: @ 814D183
	loadptr 0, SootopolisCity_Text_16A455
	callstd 4
	release
	end

SootopolisCity_EventScript_14D18D:: @ 814D18D
	loadptr 0, SootopolisCity_Text_16A2B2
	callstd 2
	end

SootopolisCity_EventScript_14D196:: @ 814D196
	loadptr 0, SootopolisCity_Text_16A2FB
	callstd 2
	end

SootopolisCity_EventScript_14D19F:: @ 814D19F
	lock
	faceplayer
	checkdailyflags
	special 148
	checkflag 2258
	jumpeq SootopolisCity_EventScript_14D241
	loadptr 0, SootopolisCity_Text_1C63F2
	callstd 4
	random 10
	addvar RESULT, 20
	addvar RESULT, 133
	setorcopyvar 0x8000, RESULT
	setorcopyvar 0x8001, 0x1
	callstd 0
	compare RESULT, 0
	jumpeq SootopolisCity_EventScript_1A029B
	setflag 2258
	loadptr 0, SootopolisCity_Text_1C64D0
	callstd 4
	random 2
	compare RESULT, 0
	jumpeq SootopolisCity_EventScript_14D1FF
	compare RESULT, 1
	jumpeq SootopolisCity_EventScript_14D220
	end

SootopolisCity_EventScript_14D1FF:: @ 814D1FF
	setorcopyvar 0x8000, 0x8f
	setorcopyvar 0x8001, 0x1
	callstd 0
	compare RESULT, 0
	jumpeq SootopolisCity_EventScript_1A029B
	loadptr 0, SootopolisCity_Text_1C650B
	callstd 4
	release
	end

SootopolisCity_EventScript_14D220:: @ 814D220
	setorcopyvar 0x8000, 0x93
	setorcopyvar 0x8001, 0x1
	callstd 0
	compare RESULT, 0
	jumpeq SootopolisCity_EventScript_1A029B
	loadptr 0, SootopolisCity_Text_1C650B
	callstd 4
	release
	end

SootopolisCity_EventScript_14D241:: @ 814D241
	loadptr 0, SootopolisCity_Text_1C6540
	callstd 5
	compare RESULT, 1
	jumpeq SootopolisCity_EventScript_14D25E
	loadptr 0, SootopolisCity_Text_1C6626
	callstd 4
	release
	end

SootopolisCity_EventScript_14D25E:: @ 814D25E
	loadptr 0, SootopolisCity_Text_1C65D4
	callstd 4
	release
	end

SootopolisCity_EventScript_14D268:: @ 814D268
	lock
	faceplayer
	checkflag 1236
	jumpeq SootopolisCity_EventScript_14D27D
	loadptr 0, SootopolisCity_Text_16A4D6
	callstd 4
	release
	end

SootopolisCity_EventScript_14D27D:: @ 814D27D
	loadptr 0, SootopolisCity_Text_16A531
	callstd 4
	release
	end

SootopolisCity_EventScript_14D287:: @ 814D287
	lock
	faceplayer
	checkflag 113
	jumpeq SootopolisCity_EventScript_14D29C
	loadptr 0, SootopolisCity_Text_169813
	callstd 4
	release
	end

SootopolisCity_EventScript_14D29C:: @ 814D29C
	loadptr 0, SootopolisCity_Text_16A587
	callstd 4
	release
	end

SootopolisCity_EventScript_14D2A6:: @ 814D2A6
	lock
	faceplayer
	checkflag 113
	jumpeq SootopolisCity_EventScript_14D2BB
	loadptr 0, SootopolisCity_Text_1698A0
	callstd 4
	release
	end

SootopolisCity_EventScript_14D2BB:: @ 814D2BB
	loadptr 0, SootopolisCity_Text_16A614
	callstd 4
	release
	end

SootopolisCity_EventScript_14D2C5:: @ 814D2C5
	lock
	faceplayer
	checkflag 113
	jumpeq SootopolisCity_EventScript_14D2DA
	loadptr 0, SootopolisCity_Text_1697A7
	callstd 4
	release
	end

SootopolisCity_EventScript_14D2DA:: @ 814D2DA
	loadptr 0, SootopolisCity_Text_16A6AE
	callstd 4
	release
	end

SootopolisCity_EventScript_14D2E4:: @ 814D2E4
	loadptr 0, SootopolisCity_Text_16972B
	callstd 2
	end

SootopolisCity_EventScript_14D2ED:: @ 814D2ED
	loadptr 0, SootopolisCity_Text_16A6C7
	callstd 3
	end

SootopolisCity_EventScript_14D2F6:: @ 814D2F6
	loadptr 0, SootopolisCity_Text_16A711
	callstd 3
	end

