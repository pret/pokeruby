Route120_MapScripts:: @ 815160E
	map_script 5, Route120_MapScript1_15161E
	map_script 3, Route120_MapScript1_1516DF
	map_script 1, Route120_MapScript1_151686
	.byte 0

Route120_MapScript1_15161E:: @ 815161E
	checkflag 2145
	callif 1, Route120_EventScript_151628
	end

Route120_EventScript_151628:: @ 8151628
	compare 0x8004, 0
	callif 1, Route120_EventScript_15166B
	compare 0x8004, 1
	callif 1, Route120_EventScript_151672
	compare 0x8004, 2
	callif 1, Route120_EventScript_151676
	compare 0x8004, 3
	callif 1, Route120_EventScript_15167A
	compare 0x8004, 4
	callif 1, Route120_EventScript_15167E
	compare 0x8004, 5
	callif 1, Route120_EventScript_151682
	return

Route120_EventScript_15166B:: @ 815166B
	disappear 30
	disappear 36
	return

Route120_EventScript_151672:: @ 8151672
	disappear 37
	return

Route120_EventScript_151676:: @ 8151676
	disappear 38
	return

Route120_EventScript_15167A:: @ 815167A
	disappear 39
	return

Route120_EventScript_15167E:: @ 815167E
	disappear 41
	return

Route120_EventScript_151682:: @ 8151682
	disappear 40
	return

Route120_MapScript1_151686:: @ 8151686
	checkflag 228
	callif 0, Route120_EventScript_1516A2
	checkflag 285
	callif 1, Route120_EventScript_1516B5
	checkflag 285
	callif 0, Route120_EventScript_1516DA
	end

Route120_EventScript_1516A2:: @ 81516A2
	setmaptile 7, 54, 124, 1
	setmaptile 7, 55, 145, 1
	return

Route120_EventScript_1516B5:: @ 81516B5
	setmaptile 13, 15, 663, 0
	setmaptile 12, 16, 671, 0
	setmaptile 12, 17, 161, 0
	setmaptile 13, 17, 161, 0
	return

Route120_EventScript_1516DA:: @ 81516DA
	spritebehave 36, 10
	return

Route120_MapScript1_1516DF:: @ 81516DF
	call Route120_EventScript_1AE313
	call Route120_EventScript_1516EA
	end

Route120_EventScript_1516EA:: @ 81516EA
	getplayerxy 0x4000, 0x4001
	compare 0x4001, 14
	jumpif 3, Route120_EventScript_151715
	compare 0x4001, 60
	jumpif 3, Route120_EventScript_151719
	compare 0x4001, 61
	jumpif 4, Route120_EventScript_151711
	return

Route120_EventScript_151711:: @ 8151711
	setweather 1
	return

Route120_EventScript_151715:: @ 8151715
	setweather 2
	return

Route120_EventScript_151719:: @ 8151719
	compare 0x4000, 7
	jumpif 3, Route120_EventScript_151735
	compare 0x4000, 19
	jumpif 3, Route120_EventScript_151715
	jump Route120_EventScript_151735
	end

Route120_EventScript_151735:: @ 8151735
	setweather 3
	return

Route120_EventScript_151739:: @ 8151739
	lock
	faceplayer
	checkdailyflags
	checkflag 2254
	jumpeq Route120_EventScript_151837
	msgbox Route120_Text_1C58F1, 5
	compare RESULT, 1
	callif 1, Route120_EventScript_151841
	compare RESULT, 0
	callif 1, Route120_EventScript_15184A
	specialval RESULT, 147
	switch RESULT
	case 0, Route120_EventScript_1517DC
	case 5, Route120_EventScript_1517DC
	case 1, Route120_EventScript_1517E7
	case 6, Route120_EventScript_1517E7
	case 2, Route120_EventScript_1517F2
	case 7, Route120_EventScript_1517F2
	case 3, Route120_EventScript_1517FD
	case 8, Route120_EventScript_1517FD
	case 4, Route120_EventScript_151808
	case 9, Route120_EventScript_151808
	end

Route120_EventScript_1517DC:: @ 81517DC
	setvar 0x8004, 143
	jump Route120_EventScript_151813
	end

Route120_EventScript_1517E7:: @ 81517E7
	setvar 0x8004, 144
	jump Route120_EventScript_151813
	end

Route120_EventScript_1517F2:: @ 81517F2
	setvar 0x8004, 145
	jump Route120_EventScript_151813
	end

Route120_EventScript_1517FD:: @ 81517FD
	setvar 0x8004, 146
	jump Route120_EventScript_151813
	end

Route120_EventScript_151808:: @ 8151808
	setvar 0x8004, 147
	jump Route120_EventScript_151813
	end

Route120_EventScript_151813:: @ 8151813
	giveitem 0x8004
	compare RESULT, 0
	jumpeq Route120_EventScript_1A029B
	setflag 2254
	msgbox Route120_Text_1C5A0B, 4
	release
	end

Route120_EventScript_151837:: @ 8151837
	msgbox Route120_Text_1C5A4D, 4
	release
	end

Route120_EventScript_151841:: @ 8151841
	msgbox Route120_Text_1C5979, 4
	return

Route120_EventScript_15184A:: @ 815184A
	msgbox Route120_Text_1C59B5, 4
	return

Route120_EventScript_151853:: @ 8151853
	lock
	faceplayer
	checkflag 290
	jumpeq Route120_EventScript_151884
	msgbox Route120_Text_171827, 5
	compare RESULT, 0
	jumpeq Route120_EventScript_151877
	jump Route120_EventScript_15189D
	end

Route120_EventScript_151877:: @ 8151877
	msgbox Route120_Text_17193D, 4
	setflag 290
	release
	end

Route120_EventScript_151884:: @ 8151884
	msgbox Route120_Text_17196F, 5
	compare RESULT, 0
	jumpeq Route120_EventScript_151877
	jump Route120_EventScript_15189D
	end

Route120_EventScript_15189D:: @ 815189D
	msgbox Route120_Text_1719A0, 4
	closebutton
	compare FACING, 2
	callif 1, Route120_EventScript_15197F
	compare FACING, 3
	callif 1, Route120_EventScript_15198A
	move 31, Route120_Movement_1A083F
	waitmove 0
	pause 20
	msgbox Route120_Text_1719D4, 4
	closebutton
	move 30, Route120_Movement_1A0843
	waitmove 0
	move 30, Route120_Movement_1A0662
	waitmove 0
	checksound
	pokecry SPECIES_KECLEON, 2
	pause 40
	waitpokecry
	setwildbattle SPECIES_KECLEON, 30, ITEM_NONE
	setvar 0x8004, 0
	setflag 2145
	dowildbattle
	clearflag 2145
	jump Route120_EventScript_151908
	end

Route120_EventScript_151908:: @ 8151908
	move 31, Route120_Movement_1A0845
	move 255, Route120_Movement_1A0841
	waitmove 0
	msgbox Route120_Text_171A40, 4
	giveitem ITEM_DEVON_SCOPE
	setflag 285
	msgbox Route120_Text_171B0E, 4
	closebutton
	move 31, Route120_Movement_1A0845
	waitmove 0
	pause 50
	setanimation 0, 1
	doanimation 30
	pause 15
	disappear 31
	checkanimation 30
	setmaptile 13, 15, 663, 0
	setmaptile 12, 16, 671, 0
	setmaptile 12, 17, 161, 0
	setmaptile 13, 17, 161, 0
	special 142
	release
	end

Route120_EventScript_15197F:: @ 815197F
	move 255, Route120_Movement_1A083F
	waitmove 0
	return

Route120_EventScript_15198A:: @ 815198A
	move 255, Route120_Movement_151995
	waitmove 0
	return

Route120_Movement_151995:: @ 8151995
	step_down
	step_left
	step_end

Route120_EventScript_151998:: @ 8151998
	msgbox Route120_Text_171B93, 2
	end

Route120_EventScript_1519A1:: @ 81519A1
	msgbox Route120_Text_171C5E, 3
	end

Route120_EventScript_1519AA:: @ 81519AA
	msgbox Route120_Text_171C77, 3
	end

Route120_EventScript_1519B3:: @ 81519B3
	trainerbattle 0, OPPONENT_COLIN, 0, Route120_Text_1BEFC8, Route120_Text_1BF000
	msgbox Route120_Text_1BF015, 6
	end

Route120_EventScript_1519CA:: @ 81519CA
	trainerbattle 0, OPPONENT_ROBERT_1, 0, Route120_Text_1BF07E, Route120_Text_1BF0A5
	specialval RESULT, 57
	compare RESULT, 1
	jumpeq Route120_EventScript_1519F1
	msgbox Route120_Text_1BF0C3, 6
	end

Route120_EventScript_1519F1:: @ 81519F1
	trainerbattle 5, OPPONENT_ROBERT_1, 0, Route120_Text_1BF0FA, Route120_Text_1BF131
	msgbox Route120_Text_1BF154, 6
	end

Route120_EventScript_151A08:: @ 8151A08
	trainerbattle 0, OPPONENT_CARLOS, 0, Route120_Text_1BF193, Route120_Text_1BF1D4
	msgbox Route120_Text_1BF215, 6
	end

Route120_EventScript_151A1F:: @ 8151A1F
	trainerbattle 0, OPPONENT_JENNA, 0, Route120_Text_1BF26E, Route120_Text_1BF2D2
	msgbox Route120_Text_1BF2EA, 6
	end

Route120_EventScript_151A36:: @ 8151A36
	trainerbattle 0, OPPONENT_BRANDON_1, 0, Route120_Text_1BF32B, Route120_Text_1BF36B
	specialval RESULT, 57
	compare RESULT, 1
	jumpeq Route120_EventScript_151A5D
	msgbox Route120_Text_1BF38D, 6
	end

Route120_EventScript_151A5D:: @ 8151A5D
	trainerbattle 5, OPPONENT_BRANDON_1, 0, Route120_Text_1BF3D0, Route120_Text_1BF416
	msgbox Route120_Text_1BF43E, 6
	end

Route120_EventScript_151A74:: @ 8151A74
	trainerbattle 0, OPPONENT_JENNIFER, 0, Route120_Text_1BF4A0, Route120_Text_1BF504
	msgbox Route120_Text_1BF51F, 6
	end

Route120_EventScript_151A8B:: @ 8151A8B
	trainerbattle 0, OPPONENT_CHIP, 0, Route120_Text_1BF560, Route120_Text_1BF5D6
	msgbox Route120_Text_1BF5F4, 6
	end

Route120_EventScript_151AA2:: @ 8151AA2
	trainerbattle 0, OPPONENT_CLARISSA, 0, Route120_Text_1BF65B, Route120_Text_1BF6A4
	msgbox Route120_Text_1BF6D0, 6
	end

Route120_EventScript_151AB9:: @ 8151AB9
	trainerbattle 0, OPPONENT_ANGELICA, 0, Route120_Text_1BF728, Route120_Text_1BF78C
	msgbox Route120_Text_1BF7B2, 6
	end

Route120_EventScript_151AD0:: @ 8151AD0
	trainerbattle 0, OPPONENT_KEIGO, 0, Route120_Text_1BF80B, Route120_Text_1BF852
	msgbox Route120_Text_1BF891, 6
	end

Route120_EventScript_151AE7:: @ 8151AE7
	trainerbattle 0, OPPONENT_TSUNAO, 0, Route120_Text_1BF8C5, Route120_Text_1BF920
	msgbox Route120_Text_1BF946, 6
	end
