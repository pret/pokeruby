LilycoveCity_MapScripts:: @ 814CA15
	map_script 3, LilycoveCity_MapScript1_14CA20
	map_script 1, LilycoveCity_MapScript1_14CA3F
	.byte 0

LilycoveCity_MapScript1_14CA20:: @ 814CA20
	setflag 2075
	setvar 0x4086, 0
	setflag 802
	checkflag 2090
	callif 1, LilycoveCity_EventScript_1A02C1
	call LilycoveCity_EventScript_1A0196
	call LilycoveCity_EventScript_1A014E
	end

LilycoveCity_MapScript1_14CA3F:: @ 814CA3F
	setmaptile 69, 4, 169, 1
	setmaptile 70, 4, 680, 1
	setmaptile 71, 4, 681, 1
	setmaptile 72, 4, 682, 1
	setmaptile 69, 5, 145, 1
	setmaptile 70, 5, 688, 1
	setmaptile 71, 5, 689, 0
	setmaptile 72, 5, 690, 1
	setmaptile 69, 6, 446, 0
	setmaptile 70, 6, 447, 0
	setmaptile 71, 6, 368, 0
	setmaptile 72, 6, 445, 0
	checkflag 112
	callif 0, LilycoveCity_EventScript_14CABE
	checkflag 2061
	callif 1, LilycoveCity_EventScript_14CB2B
	end

LilycoveCity_EventScript_14CABE:: @ 814CABE
	setmaptile 76, 12, 656, 1
	setmaptile 77, 12, 657, 1
	setmaptile 76, 13, 672, 1
	setmaptile 77, 13, 673, 1
	setmaptile 76, 14, 664, 1
	setmaptile 77, 14, 665, 1
	setmaptile 76, 15, 672, 1
	setmaptile 77, 15, 673, 1
	setmaptile 77, 16, 664, 1
	setmaptile 78, 16, 665, 1
	setmaptile 77, 17, 672, 1
	setmaptile 78, 17, 673, 1
	return

LilycoveCity_EventScript_14CB2B:: @ 814CB2B
	setmaptile 69, 4, 169, 1
	setmaptile 70, 4, 169, 1
	setmaptile 71, 4, 169, 1
	setmaptile 72, 4, 169, 1
	setmaptile 69, 5, 145, 1
	setmaptile 70, 5, 145, 1
	setmaptile 71, 5, 145, 1
	setmaptile 72, 5, 145, 1
	return

LilycoveCity_EventScript_14CB74:: @ 814CB74
	lock
	faceplayer
	checkdailyflags
	checkflag 2255
	jumpeq LilycoveCity_EventScript_14CBB4
	loadptr 0, LilycoveCity_Text_1C5A7A
	callstd 4
	random 10
	addvar RESULT, 133
	setorcopyvar 0x8000, RESULT
	setorcopyvar 0x8001, 0x1
	callstd 0
	compare RESULT, 0
	jumpeq LilycoveCity_EventScript_1A029B
	setflag 2255
	loadptr 0, LilycoveCity_Text_1C5B1D
	callstd 4
	release
	end

LilycoveCity_EventScript_14CBB4:: @ 814CBB4
	loadptr 0, LilycoveCity_Text_1C5B5D
	callstd 4
	release
	end

LilycoveCity_EventScript_14CBBE:: @ 814CBBE
	loadptr 0, LilycoveCity_Text_1686C9
	callstd 2
	end

LilycoveCity_EventScript_14CBC7:: @ 814CBC7
	lock
	faceplayer
	checkflag 2061
	jumpeq LilycoveCity_EventScript_14CBDC
	loadptr 0, LilycoveCity_Text_168750
	callstd 4
	release
	end

LilycoveCity_EventScript_14CBDC:: @ 814CBDC
	loadptr 0, LilycoveCity_Text_168791
	callstd 4
	release
	end

LilycoveCity_EventScript_14CBE6:: @ 814CBE6
	loadptr 0, LilycoveCity_Text_168819
	callstd 2
	end

LilycoveCity_EventScript_14CBEF:: @ 814CBEF
	lock
	faceplayer
	checkflag 112
	jumpeq LilycoveCity_EventScript_14CC04
	loadptr 0, LilycoveCity_Text_1688C1
	callstd 4
	release
	end

LilycoveCity_EventScript_14CC04:: @ 814CC04
	loadptr 0, LilycoveCity_Text_168934
	callstd 4
	release
	end

LilycoveCity_EventScript_14CC0E:: @ 814CC0E
	lock
	faceplayer
	checkflag 112
	jumpeq LilycoveCity_EventScript_14CC23
	loadptr 0, LilycoveCity_Text_1689BF
	callstd 4
	release
	end

LilycoveCity_EventScript_14CC23:: @ 814CC23
	loadptr 0, LilycoveCity_Text_168A55
	callstd 4
	release
	end

LilycoveCity_EventScript_14CC2D:: @ 814CC2D
	loadptr 0, LilycoveCity_Text_168A8D
	callstd 2
	end

LilycoveCity_EventScript_14CC36:: @ 814CC36
	loadptr 0, LilycoveCity_Text_168B1F
	callstd 3
	end

LilycoveCity_EventScript_14CC3F:: @ 814CC3F
	loadptr 0, LilycoveCity_Text_168B9B
	callstd 3
	end

LilycoveCity_EventScript_14CC48:: @ 814CC48
	lock
	faceplayer
	checkflag 2061
	jumpeq LilycoveCity_EventScript_14CC5D
	loadptr 0, LilycoveCity_Text_168C16
	callstd 4
	release
	end

LilycoveCity_EventScript_14CC5D:: @ 814CC5D
	loadptr 0, LilycoveCity_Text_168D15
	callstd 4
	release
	end

LilycoveCity_EventScript_14CC67:: @ 814CC67
	loadptr 0, LilycoveCity_Text_168DA9
	callstd 3
	end

LilycoveCity_EventScript_14CC70:: @ 814CC70
	loadptr 0, LilycoveCity_Text_168DE1
	callstd 3
	end

LilycoveCity_EventScript_14CC79:: @ 814CC79
	loadptr 0, LilycoveCity_Text_168E2F
	callstd 3
	end

LilycoveCity_EventScript_14CC82:: @ 814CC82
	lockall
	specialval 0x8004, 137
	switch 0x8004
	case 0, LilycoveCity_EventScript_14CCA2
	loadptr 0, LilycoveCity_Text_168EA4
	callstd 4
	releaseall
	end

LilycoveCity_EventScript_14CCA2:: @ 814CCA2
	loadptr 0, LilycoveCity_Text_168E67
	callstd 4
	releaseall
	end

LilycoveCity_EventScript_14CCAC:: @ 814CCAC
	lockall
	checkflag 2052
	jumpeq LilycoveCity_EventScript_14CCC0
	loadptr 0, LilycoveCity_Text_168EDA
	callstd 4
	releaseall
	end

LilycoveCity_EventScript_14CCC0:: @ 814CCC0
	loadptr 0, LilycoveCity_Text_168F57
	callstd 4
	releaseall
	end

LilycoveCity_EventScript_14CCCA:: @ 814CCCA
	loadptr 0, LilycoveCity_Text_168FA1
	callstd 3
	end

LilycoveCity_EventScript_14CCD3:: @ 814CCD3
	loadptr 0, LilycoveCity_Text_168FF3
	callstd 3
	end

LilycoveCity_EventScript_14CCDC:: @ 814CCDC
	loadptr 0, LilycoveCity_Text_169072
	callstd 3
	end

LilycoveCity_EventScript_14CCE5:: @ 814CCE5
	lockall
	checkflag 218
	jumpeq LilycoveCity_EventScript_14CD18
	loadptr 0, LilycoveCity_Text_16864A
	callstd 4
	move LAST_TALKED, LilycoveCity_Movement_1A0839
	waitmove 0
	loadptr 0, LilycoveCity_Text_168675
	callstd 4
	move LAST_TALKED, LilycoveCity_Movement_1A083D
	waitmove 0
	setflag 218
	releaseall
	end

LilycoveCity_EventScript_14CD18:: @ 814CD18
	loadptr 0, LilycoveCity_Text_16864A
	callstd 4
	releaseall
	end

LilycoveCity_EventScript_14CD22:: @ 814CD22
	loadptr 0, LilycoveCity_Text_168455
	callstd 2
	end

LilycoveCity_EventScript_14CD2B:: @ 814CD2B
	loadptr 0, LilycoveCity_Text_1684C2
	callstd 2
	end

LilycoveCity_EventScript_14CD34:: @ 814CD34
	loadptr 0, LilycoveCity_Text_168573
	callstd 2
	end

LilycoveCity_EventScript_14CD3D:: @ 814CD3D
	loadptr 0, LilycoveCity_Text_1685EB
	callstd 2
	end

LilycoveCity_EventScript_14CD46:: @ 814CD46
	lock
	faceplayer
	checkgender
	compare RESULT, 0
	jumpeq LilycoveCity_EventScript_14CD60
	compare RESULT, 1
	jumpeq LilycoveCity_EventScript_14CDD3
	end

LilycoveCity_EventScript_14CD60:: @ 814CD60
	playmusic 415, 1
	checkflag 286
	callif 1, LilycoveCity_EventScript_14CDB0
	checkflag 286
	callif 0, LilycoveCity_EventScript_14CDB9
	compare RESULT, 0
	jumpeq LilycoveCity_EventScript_14CDC2
	loadptr 0, LilycoveCity_Text_167B94
	callstd 4
	switch 0x4023
	case 0, LilycoveCity_EventScript_14CE46
	case 1, LilycoveCity_EventScript_14CE56
	case 2, LilycoveCity_EventScript_14CE66
	end

LilycoveCity_EventScript_14CDB0:: @ 814CDB0
	loadptr 0, LilycoveCity_Text_167B55
	callstd 5
	return

LilycoveCity_EventScript_14CDB9:: @ 814CDB9
	loadptr 0, LilycoveCity_Text_1679BF
	callstd 5
	return

LilycoveCity_EventScript_14CDC2:: @ 814CDC2
	setflag 286
	loadptr 0, LilycoveCity_Text_167AEB
	callstd 4
	playmusicbattle 0
	fadedefault
	release
	end

LilycoveCity_EventScript_14CDD3:: @ 814CDD3
	playmusic 421, 1
	checkflag 286
	callif 1, LilycoveCity_EventScript_14CE23
	checkflag 286
	callif 0, LilycoveCity_EventScript_14CE2C
	compare RESULT, 0
	jumpeq LilycoveCity_EventScript_14CE35
	loadptr 0, LilycoveCity_Text_1680A9
	callstd 4
	switch 0x4023
	case 0, LilycoveCity_EventScript_14CE76
	case 1, LilycoveCity_EventScript_14CE86
	case 2, LilycoveCity_EventScript_14CE96
	end

LilycoveCity_EventScript_14CE23:: @ 814CE23
	loadptr 0, LilycoveCity_Text_168067
	callstd 5
	return

LilycoveCity_EventScript_14CE2C:: @ 814CE2C
	loadptr 0, LilycoveCity_Text_167F75
	callstd 5
	return

LilycoveCity_EventScript_14CE35:: @ 814CE35
	setflag 286
	loadptr 0, LilycoveCity_Text_16802C
	callstd 4
	playmusicbattle 0
	fadedefault
	release
	end

LilycoveCity_EventScript_14CE46:: @ 814CE46
	trainerbattle 3, 665, 0, LilycoveCity_Text_167BD5
	jump LilycoveCity_EventScript_14CEA6
	end

LilycoveCity_EventScript_14CE56:: @ 814CE56
	trainerbattle 3, 666, 0, LilycoveCity_Text_167BD5
	jump LilycoveCity_EventScript_14CEA6
	end

LilycoveCity_EventScript_14CE66:: @ 814CE66
	trainerbattle 3, 664, 0, LilycoveCity_Text_167BD5
	jump LilycoveCity_EventScript_14CEA6
	end

LilycoveCity_EventScript_14CE76:: @ 814CE76
	trainerbattle 3, 662, 0, LilycoveCity_Text_1680E4
	jump LilycoveCity_EventScript_14CF12
	end

LilycoveCity_EventScript_14CE86:: @ 814CE86
	trainerbattle 3, 663, 0, LilycoveCity_Text_1680E4
	jump LilycoveCity_EventScript_14CF12
	end

LilycoveCity_EventScript_14CE96:: @ 814CE96
	trainerbattle 3, 661, 0, LilycoveCity_Text_1680E4
	jump LilycoveCity_EventScript_14CF12
	end

LilycoveCity_EventScript_14CEA6:: @ 814CEA6
	loadptr 0, LilycoveCity_Text_167C6B
	callstd 4
	setvar RESULT, 0
	checkflag 2060
	callif 1, LilycoveCity_EventScript_14CEDE
	compare RESULT, 0
	callif 1, LilycoveCity_EventScript_14CEEE
	compare RESULT, 1
	callif 1, LilycoveCity_EventScript_14CEF7
	clearflag 722
	clearflag 849
	jump LilycoveCity_EventScript_14CF6B
	end

LilycoveCity_EventScript_14CEDE:: @ 814CEDE
	checkflag 2062
	jumpeq LilycoveCity_EventScript_14CEE8
	return

LilycoveCity_EventScript_14CEE8:: @ 814CEE8
	setvar RESULT, 1
	return

LilycoveCity_EventScript_14CEEE:: @ 814CEEE
	loadptr 0, LilycoveCity_Text_167D08
	callstd 4
	return

LilycoveCity_EventScript_14CEF7:: @ 814CEF7
	checkflag 2052
	jumpeq LilycoveCity_EventScript_14CF09
	loadptr 0, LilycoveCity_Text_167DDD
	callstd 4
	return

LilycoveCity_EventScript_14CF09:: @ 814CF09
	loadptr 0, LilycoveCity_Text_167EAA
	callstd 4
	return

LilycoveCity_EventScript_14CF12:: @ 814CF12
	loadptr 0, LilycoveCity_Text_168149
	callstd 4
	setvar RESULT, 0
	checkflag 2060
	callif 1, LilycoveCity_EventScript_14CEDE
	compare RESULT, 0
	callif 1, LilycoveCity_EventScript_14CF47
	compare RESULT, 1
	callif 1, LilycoveCity_EventScript_14CF50
	clearflag 760
	jump LilycoveCity_EventScript_14CF6B
	end

LilycoveCity_EventScript_14CF47:: @ 814CF47
	loadptr 0, LilycoveCity_Text_1681EA
	callstd 4
	return

LilycoveCity_EventScript_14CF50:: @ 814CF50
	checkflag 2052
	jumpeq LilycoveCity_EventScript_14CF62
	loadptr 0, LilycoveCity_Text_168282
	callstd 4
	return

LilycoveCity_EventScript_14CF62:: @ 814CF62
	loadptr 0, LilycoveCity_Text_16835A
	callstd 4
	return

LilycoveCity_EventScript_14CF6B:: @ 814CF6B
	closebutton
	move LAST_TALKED, LilycoveCity_Movement_1A0845
	waitmove 0
	pause 50
	setanimation 0, 1
	doanimation 30
	pause 15
	disappear LAST_TALKED
	checkanimation 30
	playmusicbattle 0
	fadedefault
	setflag 292
	release
	end

