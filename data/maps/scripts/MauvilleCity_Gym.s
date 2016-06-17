MauvilleCity_Gym_MapScripts:: @ 8156450
	map_script 1, MauvilleCity_Gym_MapScript1_156456
	.byte 0

MauvilleCity_Gym_MapScript1_156456:: @ 8156456
	checkflag 1208
	jumpeq MauvilleCity_Gym_EventScript_1565A7
	switch 0x4093
	case 0, MauvilleCity_Gym_EventScript_156491
	case 1, MauvilleCity_Gym_EventScript_15657D
	case 2, MauvilleCity_Gym_EventScript_15658B
	case 3, MauvilleCity_Gym_EventScript_156599
	end

MauvilleCity_Gym_EventScript_156491:: @ 8156491
	checkflag 99
	jumpeq MauvilleCity_Gym_EventScript_15649B
	end

MauvilleCity_Gym_EventScript_15649B:: @ 815649B
	setmaptile 4, 7, 560, 0
	setmaptile 4, 8, 568, 0
	setmaptile 5, 7, 561, 0
	setmaptile 5, 8, 569, 0
	setmaptile 3, 8, 578, 1
	setmaptile 3, 9, 538, 0
	setmaptile 3, 10, 593, 0
	setmaptile 1, 10, 546, 0
	setmaptile 1, 11, 554, 1
	setmaptile 2, 10, 547, 0
	setmaptile 2, 11, 555, 1
	setmaptile 4, 10, 546, 0
	setmaptile 4, 11, 554, 1
	setmaptile 5, 10, 547, 0
	setmaptile 5, 11, 555, 1
	setmaptile 6, 11, 578, 1
	setmaptile 6, 12, 538, 0
	setmaptile 6, 13, 593, 0
	setmaptile 3, 11, 577, 1
	setmaptile 3, 12, 585, 1
	setmaptile 3, 13, 592, 1
	setmaptile 4, 13, 560, 0
	setmaptile 4, 14, 568, 0
	setmaptile 5, 13, 561, 0
	setmaptile 5, 14, 569, 0
	end

MauvilleCity_Gym_EventScript_15657D:: @ 815657D
	setvar 0x8004, 0
	special 140
	jump MauvilleCity_Gym_EventScript_156491
	end

MauvilleCity_Gym_EventScript_15658B:: @ 815658B
	setvar 0x8004, 1
	special 140
	jump MauvilleCity_Gym_EventScript_156491
	end

MauvilleCity_Gym_EventScript_156599:: @ 8156599
	setvar 0x8004, 2
	special 140
	jump MauvilleCity_Gym_EventScript_156491
	end

MauvilleCity_Gym_EventScript_1565A7:: @ 81565A7
	special 144
	end

MauvilleCity_Gym_EventScript_1565AB:: @ 81565AB
	trainerbattle 1, 267, 0, MauvilleCity_Gym_Text_180C32, MauvilleCity_Gym_Text_180D64, MauvilleCity_Gym_EventScript_1565DB
	checkflag 167
	jumpif 0, MauvilleCity_Gym_EventScript_15661D
	compare 0x40ba, 2
	jumpeq MauvilleCity_Gym_EventScript_156641
	msgbox MauvilleCity_Gym_Text_180EDB, 4
	release
	end

MauvilleCity_Gym_EventScript_1565DB:: @ 81565DB
	message MauvilleCity_Gym_Text_180DAF
	waittext
	call MauvilleCity_Gym_EventScript_1A02C5
	msgbox MauvilleCity_Gym_Text_180DDA, 4
	setflag 1208
	setflag 2057
	addvar 0x4085, 1
	compare 0x4085, 6
	callif 1, MauvilleCity_Gym_EventScript_1A00FB
	setvar 0x8008, 3
	call MauvilleCity_Gym_EventScript_1A01C0
	special 144
	special 142
	playsfx 44
	jump MauvilleCity_Gym_EventScript_15661D
	end

MauvilleCity_Gym_EventScript_15661D:: @ 815661D
	giveitem ITEM_TM34
	compare RESULT, 0
	jumpeq MauvilleCity_Gym_EventScript_1A029B
	msgbox MauvilleCity_Gym_Text_180E76, 4
	setflag 167
	release
	end

MauvilleCity_Gym_EventScript_156641:: @ 8156641
	msgbox MauvilleCity_Gym_Text_180F1D, 4
	release
	end

MauvilleCity_Gym_EventScript_15664B:: @ 815664B
	lockall
	checkflag 1208
	jumpeq MauvilleCity_Gym_EventScript_1566DA
	compare 0x4093, 1
	jumpeq MauvilleCity_Gym_EventScript_1566DA
	setvar 0x4093, 1
	setvar 0x8004, 0
	jump MauvilleCity_Gym_EventScript_1566BA
	end

MauvilleCity_Gym_EventScript_156670:: @ 8156670
	lockall
	checkflag 1208
	jumpeq MauvilleCity_Gym_EventScript_1566DA
	compare 0x4093, 2
	jumpeq MauvilleCity_Gym_EventScript_1566DA
	setvar 0x4093, 2
	setvar 0x8004, 1
	jump MauvilleCity_Gym_EventScript_1566BA
	end

MauvilleCity_Gym_EventScript_156695:: @ 8156695
	lockall
	checkflag 1208
	jumpeq MauvilleCity_Gym_EventScript_1566DA
	compare 0x4093, 3
	jumpeq MauvilleCity_Gym_EventScript_1566DA
	setvar 0x4093, 3
	setvar 0x8004, 2
	jump MauvilleCity_Gym_EventScript_1566BA
	end

MauvilleCity_Gym_EventScript_1566BA:: @ 81566BA
	special 139
	special 140
	special 142
	playsfx 44
	checkflag 99
	jumpeq MauvilleCity_Gym_EventScript_1566E1
	checkflag 99
	jumpif 0, MauvilleCity_Gym_EventScript_1566DC
	releaseall
	end

MauvilleCity_Gym_EventScript_1566DA:: @ 81566DA
	releaseall
	end

MauvilleCity_Gym_EventScript_1566DC:: @ 81566DC
	setflag 99
	releaseall
	end

MauvilleCity_Gym_EventScript_1566E1:: @ 81566E1
	clearflag 99
	releaseall
	end

MauvilleCity_Gym_EventScript_1566E6:: @ 81566E6
	trainerbattle 0, 191, 0, MauvilleCity_Gym_Text_180956, MauvilleCity_Gym_Text_180997
	msgbox MauvilleCity_Gym_Text_1809D1, 6
	end

MauvilleCity_Gym_EventScript_1566FD:: @ 81566FD
	trainerbattle 0, 194, 0, MauvilleCity_Gym_Text_180A05, MauvilleCity_Gym_Text_180A42
	msgbox MauvilleCity_Gym_Text_180A5E, 6
	end

MauvilleCity_Gym_EventScript_156714:: @ 8156714
	trainerbattle 0, 323, 0, MauvilleCity_Gym_Text_180AE0, MauvilleCity_Gym_Text_180B06
	msgbox MauvilleCity_Gym_Text_180B1D, 6
	end

MauvilleCity_Gym_EventScript_15672B:: @ 815672B
	trainerbattle 0, 649, 0, MauvilleCity_Gym_Text_180B5A, MauvilleCity_Gym_Text_180B93
	msgbox MauvilleCity_Gym_Text_180BAE, 6
	end

MauvilleCity_Gym_EventScript_156742:: @ 8156742
	lock
	faceplayer
	checkflag 1208
	jumpeq MauvilleCity_Gym_EventScript_156757
	msgbox MauvilleCity_Gym_Text_180815, 4
	release
	end

MauvilleCity_Gym_EventScript_156757:: @ 8156757
	msgbox MauvilleCity_Gym_Text_18091D, 4
	release
	end

MauvilleCity_Gym_EventScript_156761:: @ 8156761
	lockall
	checkflag 2057
	jumpeq MauvilleCity_Gym_EventScript_156781
	jump MauvilleCity_Gym_EventScript_15678B
	end

MauvilleCity_Gym_EventScript_156771:: @ 8156771
	lockall
	checkflag 2057
	jumpeq MauvilleCity_Gym_EventScript_156781
	jump MauvilleCity_Gym_EventScript_15678B
	end

MauvilleCity_Gym_EventScript_156781:: @ 8156781
	msgbox MauvilleCity_Gym_Text_180F64, 4
	releaseall
	end

MauvilleCity_Gym_EventScript_15678B:: @ 815678B
	msgbox MauvilleCity_Gym_Text_180F4A, 4
	releaseall
	end

