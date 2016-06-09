BattleTower_Lobby_MapScripts:: @ 816027E
	map_script 5, BattleTower_Lobby_MapScript1_160293
	map_script 3, BattleTower_Lobby_MapScript1_1602E8
	map_script 2, BattleTower_Lobby_MapScript2_160302
	map_script 4, BattleTower_Lobby_MapScript2_1602EE
	.byte 0

BattleTower_Lobby_MapScript1_160293:: @ 8160293
	special 338
	call BattleTower_Lobby_EventScript_16029C
	end

BattleTower_Lobby_EventScript_16029C:: @ 816029C
	setvar 0x8004, 10
	special 237
	checkflag 238
	jumpeq BattleTower_Lobby_EventScript_1602E4
	checkflag 237
	jumpeq BattleTower_Lobby_EventScript_1602CD
	specialval 0x8007, 247
	compare 0x8007, 50
	jumpif 0, BattleTower_Lobby_EventScript_1602E4
	clearflag 941
	special 329
	return

BattleTower_Lobby_EventScript_1602CD:: @ 81602CD
	specialval 0x8007, 247
	compare 0x8007, 100
	jumpif 0, BattleTower_Lobby_EventScript_1602E4
	clearflag 941
	special 329
	return

BattleTower_Lobby_EventScript_1602E4:: @ 81602E4
	setflag 941
	return

BattleTower_Lobby_MapScript1_1602E8:: @ 81602E8
	call BattleTower_Lobby_EventScript_1AE2ED
	end

BattleTower_Lobby_MapScript2_1602EE:: @ 81602EE
	map_script_2 0x4001, 0, BattleTower_Lobby_EventScript_1602F8
	.2byte 0

BattleTower_Lobby_EventScript_1602F8:: @ 81602F8
	setvar 0x4001, 1
	spriteface 255, 2
	end

BattleTower_Lobby_MapScript2_160302:: @ 8160302
	map_script_2 0x4000, 0, BattleTower_Lobby_EventScript_16032C
	map_script_2 0x4000, 1, BattleTower_Lobby_EventScript_160330
	map_script_2 0x4000, 2, BattleTower_Lobby_EventScript_160342
	map_script_2 0x4000, 3, BattleTower_Lobby_EventScript_160419
	map_script_2 0x4000, 4, BattleTower_Lobby_EventScript_16044B
	.2byte 0

BattleTower_Lobby_EventScript_16032C:: @ 816032C
	special 231
	end

BattleTower_Lobby_EventScript_160330:: @ 8160330
	lock
	faceplayer
	loadptr 0, BattleTower_Lobby_Text_19A3FD
	callstd 4
	closebutton
	setvar 0x4000, 5
	release
	end

BattleTower_Lobby_EventScript_160342:: @ 8160342
	lock
	faceplayer
	message BattleTower_Lobby_Text_19A487
	waittext
	setvar 0x8004, 0
	special 238
	compare RESULT, 6
	jumpeq BattleTower_Lobby_EventScript_16037D
	special 244
	compare RESULT, 0
	jumpeq BattleTower_Lobby_EventScript_16037D
	message BattleTower_Lobby_Text_19A6BE
	waittext
	fanfare 370
	waitfanfare
	loadptr 0, BattleTower_Lobby_Text_19A719
	callstd 4

BattleTower_Lobby_EventScript_16037D:: @ 816037D
	setvar 0x8004, 8
	special 238
	compare RESULT, 1
	jumpeq BattleTower_Lobby_EventScript_1603AD
	message BattleTower_Lobby_Text_19A589
	waittext
	setvar 0x8004, 13
	special 237
	special 242
	setvar 0x8004, 3
	special 240
	playsfx 55
	checksound

BattleTower_Lobby_EventScript_1603AD:: @ 81603AD
	setvar 0x8004, 0
	setvar 0x8005, 3
	special 237
	message BattleTower_Lobby_Text_19A4BB
	waittext
	special 243
	switch RESULT
	case 0, BattleTower_Lobby_EventScript_160408
	message BattleTower_Lobby_Text_19A506
	waittext
	fanfare 370
	waitfanfare
	setvar 0x8004, 9
	special 238
	compare RESULT, 49
	jumpif 5, BattleTower_Lobby_EventScript_1603F8
	loadptr 0, BattleTower_Lobby_Text_19A617
	callstd 4

BattleTower_Lobby_EventScript_1603F8:: @ 81603F8
	loadptr 0, BattleTower_Lobby_Text_199FA9
	callstd 4
	closebutton
	setvar 0x4000, 5
	release
	end

BattleTower_Lobby_EventScript_160408:: @ 8160408
	loadptr 0, BattleTower_Lobby_Text_19A520
	callstd 4
	waittext
	closebutton
	setvar 0x4000, 5
	release
	end

BattleTower_Lobby_EventScript_160419:: @ 8160419
	lock
	faceplayer
	message BattleTower_Lobby_Text_19A571
	waittext
	message BattleTower_Lobby_Text_19A589
	waittext
	setvar 0x8004, 13
	special 237
	setvar 0x8004, 0
	special 240
	playsfx 55
	checksound
	loadptr 0, BattleTower_Lobby_Text_199FA9
	callstd 4
	closebutton
	setvar 0x4000, 5
	release
	end

BattleTower_Lobby_EventScript_16044B:: @ 816044B
	lock
	faceplayer
	setvar 0x40bc, 1
	message BattleTower_Lobby_Text_19A5B1
	waittext
	message BattleTower_Lobby_Text_19A5CE
	waittext
	setvar 0x8004, 1
	special 240
	playsfx 55
	checksound
	setvar 0x8004, 8
	setvar 0x8005, 0
	special 237
	setvar 0x4000, 5
	special 39
	special 239
	loadptr 0, BattleTower_Lobby_Text_19A0A8
	callstd 4
	closebutton
	call BattleTower_Lobby_EventScript_160664
	warp BattleTower_Elevator, 255, 1, 6
	setvar 0x4000, 0
	waitstate

BattleTower_Lobby_EventScript_16049E:: @ 816049E
	lock
	faceplayer
	setvar 0x8004, 0
	special 238
	compare RESULT, 6
	jumpeq BattleTower_Lobby_EventScript_160342
	special 39
	loadptr 0, BattleTower_Lobby_Text_199F2C
	callstd 4

BattleTower_Lobby_EventScript_1604BE:: @ 81604BE
	message BattleTower_Lobby_Text_199F79
	waittext
	multichoice 15, 6, 23, 0
	switch RESULT
	case 0, BattleTower_Lobby_EventScript_1604FA
	case 1, BattleTower_Lobby_EventScript_160600
	case 2, BattleTower_Lobby_EventScript_160652
	case 127, BattleTower_Lobby_EventScript_160652

BattleTower_Lobby_EventScript_1604FA:: @ 81604FA
	message BattleTower_Lobby_Text_19A024
	waittext
	multichoice 18, 6, 24, 0
	switch RESULT
	case 2, BattleTower_Lobby_EventScript_160652
	case 127, BattleTower_Lobby_EventScript_160652
	special 233
	compare 0x8004, 1
	jumpeq BattleTower_Lobby_EventScript_16060D
	setvar 0x8004, 1
	copyvar 0x8005, RESULT
	copyvar 0x8006, RESULT
	special 237
	loadptr 0, BattleTower_Lobby_Text_19A07B
	callstd 4
	fadescreen 1
	special 245
	waitstate
	compare RESULT, 0
	jumpeq BattleTower_Lobby_EventScript_16064F
	loadptr 0, BattleTower_Lobby_Text_199FDA
	callstd 5
	switch RESULT
	case 0, BattleTower_Lobby_EventScript_16064F
	case 1, BattleTower_Lobby_EventScript_160587
	case 127, BattleTower_Lobby_EventScript_16064F

BattleTower_Lobby_EventScript_160587:: @ 8160587
	setvar 0x8004, 5
	special 237
	setvar 0x4000, 0
	setvar 0x8004, 11
	special 237
	setvar 0x8004, 0
	setvar 0x8005, 1
	special 237
	setvar 0x8004, 8
	setvar 0x8005, 0
	special 237
	special 40
	closebutton
	pause 2
	call BattleTower_Lobby_EventScript_19F806
	setvar 0x4000, 5
	hidebox 0, 0, 15, 10
	compare RESULT, 0
	jumpeq BattleTower_Lobby_EventScript_160642
	inccounter 30
	special 39
	special 239
	setvar 0x40bc, 1
	loadptr 0, BattleTower_Lobby_Text_19A0A8
	callstd 4
	closebutton
	call BattleTower_Lobby_EventScript_160664
	warp BattleTower_Elevator, 255, 1, 6
	setvar 0x4000, 0
	waitstate

BattleTower_Lobby_EventScript_160600:: @ 8160600
	loadptr 0, BattleTower_Lobby_Text_19A0D1
	callstd 4
	jump BattleTower_Lobby_EventScript_1604BE

BattleTower_Lobby_EventScript_16060D:: @ 816060D
	switch RESULT
	case 0, BattleTower_Lobby_EventScript_160628
	case 1, BattleTower_Lobby_EventScript_160635

BattleTower_Lobby_EventScript_160628:: @ 8160628
	loadptr 0, BattleTower_Lobby_Text_19A249
	callstd 4
	jump BattleTower_Lobby_EventScript_160662

BattleTower_Lobby_EventScript_160635:: @ 8160635
	loadptr 0, BattleTower_Lobby_Text_19A32D
	callstd 4
	jump BattleTower_Lobby_EventScript_160662

BattleTower_Lobby_EventScript_160642:: @ 8160642
	setvar 0x8004, 12
	special 237
	jump BattleTower_Lobby_EventScript_160652

BattleTower_Lobby_EventScript_16064F:: @ 816064F
	special 40

BattleTower_Lobby_EventScript_160652:: @ 8160652
	loadptr 0, BattleTower_Lobby_Text_199FA9
	callstd 4
	setvar 0x8004, 11
	special 237

BattleTower_Lobby_EventScript_160662:: @ 8160662
	release
	end

BattleTower_Lobby_EventScript_160664:: @ 8160664
	move 1, BattleTower_Lobby_Movement_160693
	move 255, BattleTower_Lobby_Movement_160693
	waitmove 0
	setdooropened 6, 1
	doorchange
	move 1, BattleTower_Lobby_Movement_160697
	move 255, BattleTower_Lobby_Movement_16069A
	waitmove 0
	setdoorclosed 6, 1
	doorchange
	return

BattleTower_Lobby_Movement_160693:: @ 8160693
	step_up
	step_up
	step_up
	step_end

BattleTower_Lobby_Movement_160697:: @ 8160697
	step_up
	step_54
	step_end

BattleTower_Lobby_Movement_16069A:: @ 816069A
	step_up
	step_up
	step_54
	step_end

	.incbin "baserom.gba", 0x16069e, 0x7

BattleTower_Lobby_EventScript_1606A5:: @ 81606A5
	lock
	faceplayer
	loadptr 0, BattleTower_Lobby_Text_19A747
	callstd 5
	switch RESULT
	case 1, BattleTower_Lobby_EventScript_1606CC
	case 0, BattleTower_Lobby_EventScript_1606F7
	release
	end

BattleTower_Lobby_EventScript_1606CC:: @ 81606CC
	loadptr 0, BattleTower_Lobby_Text_19A7C3
	callstd 4
	setvar 0x8004, 1
	call BattleTower_Lobby_EventScript_1A00F3
	lock
	faceplayer
	compare RESULT, 0
	jumpeq BattleTower_Lobby_EventScript_160701
	compare RESULT, 1
	jumpeq BattleTower_Lobby_EventScript_16070B
	end

BattleTower_Lobby_EventScript_1606F7:: @ 81606F7
	loadptr 0, BattleTower_Lobby_Text_19A7FD
	callstd 4
	release
	end

BattleTower_Lobby_EventScript_160701:: @ 8160701
	loadptr 0, BattleTower_Lobby_Text_19A83D
	callstd 4
	release
	end

BattleTower_Lobby_EventScript_16070B:: @ 816070B
	loadptr 0, BattleTower_Lobby_Text_19A871
	callstd 4
	release
	end

BattleTower_Lobby_EventScript_160715:: @ 8160715
	loadptr 0, BattleTower_Lobby_Text_19A8AE
	callstd 2
	end

BattleTower_Lobby_EventScript_16071E:: @ 816071E
	loadptr 0, BattleTower_Lobby_Text_19A946
	callstd 2
	end

BattleTower_Lobby_EventScript_160727:: @ 8160727
	lockall
	special 283
	waitbutton
	hidebox 0, 0, 29, 19
	releaseall
	end

BattleTower_Lobby_EventScript_160733:: @ 8160733
	lock
	faceplayer
	checkflag 238
	jumpeq BattleTower_Lobby_EventScript_1607C5
	checkflag 237
	jumpeq BattleTower_Lobby_EventScript_160773
	loadptr 0, BattleTower_Lobby_Text_19A9EE
	callstd 4
	setvar 0x8008, 42
	setorcopyvar 0x8000, 0x2a
	callstd 7
	compare RESULT, 0
	jumpeq BattleTower_Lobby_EventScript_1607AF
	setflag 237
	loadptr 0, BattleTower_Lobby_Text_19ABAA
	callstd 4
	release
	end

BattleTower_Lobby_EventScript_160773:: @ 8160773
	specialval RESULT, 247
	compare RESULT, 100
	jumpif 0, BattleTower_Lobby_EventScript_1607C5
	loadptr 0, BattleTower_Lobby_Text_19AAC4
	callstd 4
	setvar 0x8008, 43
	setorcopyvar 0x8000, 0x2b
	callstd 7
	compare RESULT, 0
	jumpeq BattleTower_Lobby_EventScript_1607AF
	setflag 238
	loadptr 0, BattleTower_Lobby_Text_19ABAA
	callstd 4
	release
	end

BattleTower_Lobby_EventScript_1607AF:: @ 81607AF
	bufferdecor 1, 32776
	loadptr 0, BattleTower_Lobby_Text_1A0CEF
	callstd 4
	loadptr 0, BattleTower_Lobby_Text_19ABED
	callstd 4
	release
	end

BattleTower_Lobby_EventScript_1607C5:: @ 81607C5
	loadptr 0, BattleTower_Lobby_Text_19AC55
	callstd 4
	release
	end

