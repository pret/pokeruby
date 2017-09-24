BattleTower_Lobby_MapScripts:: @ 816027E
	map_script 5, BattleTower_Lobby_MapScript1_160293
	map_script 3, BattleTower_Lobby_MapScript1_1602E8
	map_script 2, BattleTower_Lobby_MapScript2_160302
	map_script 4, BattleTower_Lobby_MapScript2_1602EE
	.byte 0

BattleTower_Lobby_MapScript1_160293:: @ 8160293
	special sub_813610C
	call BattleTower_Lobby_EventScript_16029C
	end

BattleTower_Lobby_EventScript_16029C:: @ 816029C
	setvar 0x8004, 10
	special sub_8135668
	checkflag 238
	goto_if_eq BattleTower_Lobby_EventScript_1602E4
	checkflag 237
	goto_if_eq BattleTower_Lobby_EventScript_1602CD
	specialvar 0x8007, sub_810F404
	compare_var_to_imm 0x8007, 50
	goto_if 0, BattleTower_Lobby_EventScript_1602E4
	clearflag 941
	special sub_810F8FC
	return

BattleTower_Lobby_EventScript_1602CD:: @ 81602CD
	specialvar 0x8007, sub_810F404
	compare_var_to_imm 0x8007, 100
	goto_if 0, BattleTower_Lobby_EventScript_1602E4
	clearflag 941
	special sub_810F8FC
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
	special sub_8134548
	end

BattleTower_Lobby_EventScript_160330:: @ 8160330
	lock
	faceplayer
	msgbox BattleTower_Lobby_Text_19A3FD, 4
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
	special sub_81358A4
	compare_var_to_imm RESULT, 6
	goto_if_eq BattleTower_Lobby_EventScript_16037D
	special sub_8135E50
	compare_var_to_imm RESULT, 0
	goto_if_eq BattleTower_Lobby_EventScript_16037D
	message BattleTower_Lobby_Text_19A6BE
	waittext
	playfanfare 370
	waitfanfare
	msgbox BattleTower_Lobby_Text_19A719, 4

BattleTower_Lobby_EventScript_16037D:: @ 816037D
	setvar 0x8004, 8
	special sub_81358A4
	compare_var_to_imm RESULT, 1
	goto_if_eq BattleTower_Lobby_EventScript_1603AD
	message BattleTower_Lobby_Text_19A589
	waittext
	setvar 0x8004, 13
	special sub_8135668
	special sub_8135D84
	setvar 0x8004, 3
	special sub_8135BA0
	playse 55
	waitse

BattleTower_Lobby_EventScript_1603AD:: @ 81603AD
	setvar 0x8004, 0
	setvar 0x8005, 3
	special sub_8135668
	message BattleTower_Lobby_Text_19A4BB
	waittext
	special sub_8135DEC
	switch RESULT
	case 0, BattleTower_Lobby_EventScript_160408
	message BattleTower_Lobby_Text_19A506
	waittext
	playfanfare 370
	waitfanfare
	setvar 0x8004, 9
	special sub_81358A4
	compare_var_to_imm RESULT, 49
	goto_if 5, BattleTower_Lobby_EventScript_1603F8
	msgbox BattleTower_Lobby_Text_19A617, 4

BattleTower_Lobby_EventScript_1603F8:: @ 81603F8
	msgbox BattleTower_Lobby_Text_199FA9, 4
	closebutton
	setvar 0x4000, 5
	release
	end

BattleTower_Lobby_EventScript_160408:: @ 8160408
	msgbox BattleTower_Lobby_Text_19A520, 4
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
	special sub_8135668
	setvar 0x8004, 0
	special sub_8135BA0
	playse 55
	waitse
	msgbox BattleTower_Lobby_Text_199FA9, 4
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
	special sub_8135BA0
	playse 55
	waitse
	setvar 0x8004, 8
	setvar 0x8005, 0
	special sub_8135668
	setvar 0x4000, 5
	special SavePlayerParty
	special sub_8135A14
	msgbox BattleTower_Lobby_Text_19A0A8, 4
	closebutton
	call BattleTower_Lobby_EventScript_160664
	warp BattleTower_Elevator, 255, 1, 6
	setvar 0x4000, 0
	waitstate

BattleTower_Lobby_EventScript_16049E:: @ 816049E
	lock
	faceplayer
	setvar 0x8004, 0
	special sub_81358A4
	compare_var_to_imm RESULT, 6
	goto_if_eq BattleTower_Lobby_EventScript_160342
	special SavePlayerParty
	msgbox BattleTower_Lobby_Text_199F2C, 4

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
	special CheckPartyBattleTowerBanlist
	compare_var_to_imm 0x8004, 1
	goto_if_eq BattleTower_Lobby_EventScript_16060D
	setvar 0x8004, 1
	copyvar 0x8005, RESULT
	copyvar 0x8006, RESULT
	special sub_8135668
	msgbox BattleTower_Lobby_Text_19A07B, 4
	fadescreen 1
	special ChooseBattleTowerPlayerParty
	waitstate
	compare_var_to_imm RESULT, 0
	goto_if_eq BattleTower_Lobby_EventScript_16064F
	msgbox BattleTower_Lobby_Text_199FDA, 5
	switch RESULT
	case 0, BattleTower_Lobby_EventScript_16064F
	case 1, BattleTower_Lobby_EventScript_160587
	case 127, BattleTower_Lobby_EventScript_16064F

BattleTower_Lobby_EventScript_160587:: @ 8160587
	setvar 0x8004, 5
	special sub_8135668
	setvar 0x4000, 0
	setvar 0x8004, 11
	special sub_8135668
	setvar 0x8004, 0
	setvar 0x8005, 1
	special sub_8135668
	setvar 0x8004, 8
	setvar 0x8005, 0
	special sub_8135668
	special LoadPlayerParty
	closebutton
	delay 2
	call S_DoSaveDialog
	setvar 0x4000, 5
	hidebox 0, 0, 15, 10
	compare_var_to_imm RESULT, 0
	goto_if_eq BattleTower_Lobby_EventScript_160642
	inccounter GAME_STAT_ENTERED_BATTLE_TOWER
	special SavePlayerParty
	special sub_8135A14
	setvar 0x40bc, 1
	msgbox BattleTower_Lobby_Text_19A0A8, 4
	closebutton
	call BattleTower_Lobby_EventScript_160664
	warp BattleTower_Elevator, 255, 1, 6
	setvar 0x4000, 0
	waitstate

BattleTower_Lobby_EventScript_160600:: @ 8160600
	msgbox BattleTower_Lobby_Text_19A0D1, 4
	goto BattleTower_Lobby_EventScript_1604BE

BattleTower_Lobby_EventScript_16060D:: @ 816060D
	switch RESULT
	case 0, BattleTower_Lobby_EventScript_160628
	case 1, BattleTower_Lobby_EventScript_160635

BattleTower_Lobby_EventScript_160628:: @ 8160628
	msgbox BattleTower_Lobby_Text_19A249, 4
	goto BattleTower_Lobby_EventScript_160662

BattleTower_Lobby_EventScript_160635:: @ 8160635
	msgbox BattleTower_Lobby_Text_19A32D, 4
	goto BattleTower_Lobby_EventScript_160662

BattleTower_Lobby_EventScript_160642:: @ 8160642
	setvar 0x8004, 12
	special sub_8135668
	goto BattleTower_Lobby_EventScript_160652

BattleTower_Lobby_EventScript_16064F:: @ 816064F
	special LoadPlayerParty

BattleTower_Lobby_EventScript_160652:: @ 8160652
	msgbox BattleTower_Lobby_Text_199FA9, 4
	setvar 0x8004, 11
	special sub_8135668

BattleTower_Lobby_EventScript_160662:: @ 8160662
	release
	end

BattleTower_Lobby_EventScript_160664:: @ 8160664
	applymovement 1, BattleTower_Lobby_Movement_160693
	applymovement 255, BattleTower_Lobby_Movement_160693
	waitmovement 0
	setdooropened 6, 1
	doorchange
	applymovement 1, BattleTower_Lobby_Movement_160697
	applymovement 255, BattleTower_Lobby_Movement_16069A
	waitmovement 0
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

@ 816069E
	step_16
	step_16
	step_16
	step_16
	step_16
	step_54
	step_end

BattleTower_Lobby_EventScript_1606A5:: @ 81606A5
	lock
	faceplayer
	msgbox BattleTower_Lobby_Text_19A747, 5
	switch RESULT
	case 1, BattleTower_Lobby_EventScript_1606CC
	case 0, BattleTower_Lobby_EventScript_1606F7
	release
	end

BattleTower_Lobby_EventScript_1606CC:: @ 81606CC
	msgbox BattleTower_Lobby_Text_19A7C3, 4
	setvar 0x8004, 1
	call BattleTower_Lobby_EventScript_1A00F3
	lock
	faceplayer
	compare_var_to_imm RESULT, 0
	goto_if_eq BattleTower_Lobby_EventScript_160701
	compare_var_to_imm RESULT, 1
	goto_if_eq BattleTower_Lobby_EventScript_16070B
	end

BattleTower_Lobby_EventScript_1606F7:: @ 81606F7
	msgbox BattleTower_Lobby_Text_19A7FD, 4
	release
	end

BattleTower_Lobby_EventScript_160701:: @ 8160701
	msgbox BattleTower_Lobby_Text_19A83D, 4
	release
	end

BattleTower_Lobby_EventScript_16070B:: @ 816070B
	msgbox BattleTower_Lobby_Text_19A871, 4
	release
	end

BattleTower_Lobby_EventScript_160715:: @ 8160715
	msgbox BattleTower_Lobby_Text_19A8AE, 2
	end

BattleTower_Lobby_EventScript_16071E:: @ 816071E
	msgbox BattleTower_Lobby_Text_19A946, 2
	end

BattleTower_Lobby_EventScript_160727:: @ 8160727
	lockall
	special ShowBattleTowerRecords
	waitbutton
	hidebox 0, 0, 29, 19
	releaseall
	end

BattleTower_Lobby_EventScript_160733:: @ 8160733
	lock
	faceplayer
	checkflag 238
	goto_if_eq BattleTower_Lobby_EventScript_1607C5
	checkflag 237
	goto_if_eq BattleTower_Lobby_EventScript_160773
	msgbox BattleTower_Lobby_Text_19A9EE, 4
	setvar 0x8008, 42
	givedecoration 42
	compare_var_to_imm RESULT, 0
	goto_if_eq BattleTower_Lobby_EventScript_1607AF
	setflag 237
	msgbox BattleTower_Lobby_Text_19ABAA, 4
	release
	end

BattleTower_Lobby_EventScript_160773:: @ 8160773
	specialvar RESULT, sub_810F404
	compare_var_to_imm RESULT, 100
	goto_if 0, BattleTower_Lobby_EventScript_1607C5
	msgbox BattleTower_Lobby_Text_19AAC4, 4
	setvar 0x8008, 43
	givedecoration 43
	compare_var_to_imm RESULT, 0
	goto_if_eq BattleTower_Lobby_EventScript_1607AF
	setflag 238
	msgbox BattleTower_Lobby_Text_19ABAA, 4
	release
	end

BattleTower_Lobby_EventScript_1607AF:: @ 81607AF
	bufferdecor 1, 0x8008
	msgbox BattleTower_Lobby_Text_1A0CEF, 4
	msgbox BattleTower_Lobby_Text_19ABED, 4
	release
	end

BattleTower_Lobby_EventScript_1607C5:: @ 81607C5
	msgbox BattleTower_Lobby_Text_19AC55, 4
	release
	end
