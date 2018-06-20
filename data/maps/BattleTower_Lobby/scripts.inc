BattleTower_Lobby_MapScripts:: @ 816027E
	map_script 5, BattleTower_Lobby_MapScript1_160293
	map_script 3, BattleTower_Lobby_MapScript1_1602E8
	map_script 2, BattleTower_Lobby_MapScript2_160302
	map_script 4, BattleTower_Lobby_MapScript2_1602EE
	.byte 0

BattleTower_Lobby_MapScript1_160293:: @ 8160293
	special TryEnableBravoTrainerBattleTower
	call BattleTower_Lobby_EventScript_16029C
	end

BattleTower_Lobby_EventScript_16029C:: @ 816029C
	setvar VAR_SPECIAL_4, 10
	special SetBattleTowerProperty
	goto_if_set FLAG_RECEIVED_GOLD_SHIELD, BattleTower_Lobby_EventScript_1602E4
	goto_if_set FLAG_RECEIVED_SILVER_SHIELD, BattleTower_Lobby_EventScript_1602CD
	specialvar VAR_SPECIAL_7, GetBestBattleTowerStreak
	compare VAR_SPECIAL_7, 50
	goto_if_lt BattleTower_Lobby_EventScript_1602E4
	clearflag FLAG_HIDE_AWARD_MAN_BATTLE_TOWER
	special TryInitBattleTowerAwardManEventObject
	return

BattleTower_Lobby_EventScript_1602CD:: @ 81602CD
	specialvar VAR_SPECIAL_7, GetBestBattleTowerStreak
	compare VAR_SPECIAL_7, 100
	goto_if_lt BattleTower_Lobby_EventScript_1602E4
	clearflag FLAG_HIDE_AWARD_MAN_BATTLE_TOWER
	special TryInitBattleTowerAwardManEventObject
	return

BattleTower_Lobby_EventScript_1602E4:: @ 81602E4
	setflag FLAG_HIDE_AWARD_MAN_BATTLE_TOWER
	return

BattleTower_Lobby_MapScript1_1602E8:: @ 81602E8
	call BattleTower_Lobby_EventScript_1AE2ED
	end

BattleTower_Lobby_MapScript2_1602EE:: @ 81602EE
	map_script_2 VAR_TEMP_1, 0, BattleTower_Lobby_EventScript_1602F8
	.2byte 0

BattleTower_Lobby_EventScript_1602F8:: @ 81602F8
	setvar VAR_TEMP_1, 1
	turnobject 255, 2
	end

BattleTower_Lobby_MapScript2_160302:: @ 8160302
	map_script_2 VAR_TEMP_0, 0, BattleTower_Lobby_EventScript_16032C
	map_script_2 VAR_TEMP_0, 1, BattleTower_Lobby_EventScript_160330
	map_script_2 VAR_TEMP_0, 2, BattleTower_Lobby_EventScript_160342
	map_script_2 VAR_TEMP_0, 3, BattleTower_Lobby_EventScript_160419
	map_script_2 VAR_TEMP_0, 4, BattleTower_Lobby_EventScript_16044B
	.2byte 0

BattleTower_Lobby_EventScript_16032C:: @ 816032C
	special sub_8134548
	end

BattleTower_Lobby_EventScript_160330:: @ 8160330
	lock
	faceplayer
	msgbox BattleTower_Lobby_Text_19A3FD, 4
	closemessage
	setvar VAR_TEMP_0, 5
	release
	end

BattleTower_Lobby_EventScript_160342:: @ 8160342
	lock
	faceplayer
	message BattleTower_Lobby_Text_19A487
	waitmessage
	setvar VAR_SPECIAL_4, 0
	special BattleTowerUtil
	compare RESULT, 6
	goto_if_eq BattleTower_Lobby_EventScript_16037D
	special AwardBattleTowerRibbons
	compare RESULT, 0
	goto_if_eq BattleTower_Lobby_EventScript_16037D
	message BattleTower_Lobby_Text_19A6BE
	waitmessage
	playfanfare MUS_FANFA4
	waitfanfare
	msgbox BattleTower_Lobby_Text_19A719, 4

BattleTower_Lobby_EventScript_16037D:: @ 816037D
	setvar VAR_SPECIAL_4, 8
	special BattleTowerUtil
	compare RESULT, 1
	goto_if_eq BattleTower_Lobby_EventScript_1603AD
	message BattleTower_Lobby_Text_19A589
	waitmessage
	setvar VAR_SPECIAL_4, 13
	special SetBattleTowerProperty
	special DetermineBattleTowerPrize
	setvar VAR_SPECIAL_4, 3
	special SaveBattleTowerProgress
	playse SE_SAVE
	waitse

BattleTower_Lobby_EventScript_1603AD:: @ 81603AD
	setvar VAR_SPECIAL_4, 0
	setvar VAR_SPECIAL_5, 3
	special SetBattleTowerProperty
	message BattleTower_Lobby_Text_19A4BB
	waitmessage
	special GiveBattleTowerPrize
	switch RESULT
	case 0, BattleTower_Lobby_EventScript_160408
	message BattleTower_Lobby_Text_19A506
	waitmessage
	playfanfare MUS_FANFA4
	waitfanfare
	setvar VAR_SPECIAL_4, 9
	special BattleTowerUtil
	compare RESULT, 49
	goto_if_ne BattleTower_Lobby_EventScript_1603F8
	msgbox BattleTower_Lobby_Text_19A617, 4

BattleTower_Lobby_EventScript_1603F8:: @ 81603F8
	msgbox BattleTower_Lobby_Text_199FA9, 4
	closemessage
	setvar VAR_TEMP_0, 5
	release
	end

BattleTower_Lobby_EventScript_160408:: @ 8160408
	msgbox BattleTower_Lobby_Text_19A520, 4
	waitmessage
	closemessage
	setvar VAR_TEMP_0, 5
	release
	end

BattleTower_Lobby_EventScript_160419:: @ 8160419
	lock
	faceplayer
	message BattleTower_Lobby_Text_19A571
	waitmessage
	message BattleTower_Lobby_Text_19A589
	waitmessage
	setvar VAR_SPECIAL_4, 13
	special SetBattleTowerProperty
	setvar VAR_SPECIAL_4, 0
	special SaveBattleTowerProgress
	playse SE_SAVE
	waitse
	msgbox BattleTower_Lobby_Text_199FA9, 4
	closemessage
	setvar VAR_TEMP_0, 5
	release
	end

BattleTower_Lobby_EventScript_16044B:: @ 816044B
	lock
	faceplayer
	setvar VAR_BRAVO_TRAINER_BATTLE_TOWER_ON, 1
	message BattleTower_Lobby_Text_19A5B1
	waitmessage
	message BattleTower_Lobby_Text_19A5CE
	waitmessage
	setvar VAR_SPECIAL_4, 1
	special SaveBattleTowerProgress
	playse SE_SAVE
	waitse
	setvar VAR_SPECIAL_4, 8
	setvar VAR_SPECIAL_5, 0
	special SetBattleTowerProperty
	setvar VAR_TEMP_0, 5
	special SavePlayerParty
	special SetBattleTowerParty
	msgbox BattleTower_Lobby_Text_19A0A8, 4
	closemessage
	call BattleTower_Lobby_EventScript_160664
	warp MAP_BATTLE_TOWER_ELEVATOR, 255, 1, 6
	setvar VAR_TEMP_0, 0
	waitstate

BattleTower_Lobby_EventScript_16049E:: @ 816049E
	lock
	faceplayer
	setvar VAR_SPECIAL_4, 0
	special BattleTowerUtil
	compare RESULT, 6
	goto_if_eq BattleTower_Lobby_EventScript_160342
	special SavePlayerParty
	msgbox BattleTower_Lobby_Text_199F2C, 4

BattleTower_Lobby_EventScript_1604BE:: @ 81604BE
	message BattleTower_Lobby_Text_199F79
	waitmessage
	multichoice 15, 6, 23, 0
	switch RESULT
	case 0, BattleTower_Lobby_EventScript_1604FA
	case 1, BattleTower_Lobby_EventScript_160600
	case 2, BattleTower_Lobby_EventScript_160652
	case 127, BattleTower_Lobby_EventScript_160652

BattleTower_Lobby_EventScript_1604FA:: @ 81604FA
	message BattleTower_Lobby_Text_19A024
	waitmessage
	multichoice 18, 6, 24, 0
	switch RESULT
	case 2, BattleTower_Lobby_EventScript_160652
	case 127, BattleTower_Lobby_EventScript_160652
	special CheckPartyBattleTowerBanlist
	compare VAR_SPECIAL_4, 1
	goto_if_eq BattleTower_Lobby_EventScript_16060D
	setvar VAR_SPECIAL_4, 1
	copyvar VAR_SPECIAL_5, RESULT
	copyvar VAR_SPECIAL_6, RESULT
	special SetBattleTowerProperty
	msgbox BattleTower_Lobby_Text_19A07B, 4
	fadescreen 1
	special ChooseBattleTowerPlayerParty
	waitstate
	compare RESULT, 0
	goto_if_eq BattleTower_Lobby_EventScript_16064F
	msgbox BattleTower_Lobby_Text_199FDA, MSGBOX_YESNO
	switch RESULT
	case NO, BattleTower_Lobby_EventScript_16064F
	case YES, BattleTower_Lobby_EventScript_160587
	case 127, BattleTower_Lobby_EventScript_16064F

BattleTower_Lobby_EventScript_160587:: @ 8160587
	setvar VAR_SPECIAL_4, 5
	special SetBattleTowerProperty
	setvar VAR_TEMP_0, 0
	setvar VAR_SPECIAL_4, 11
	special SetBattleTowerProperty
	setvar VAR_SPECIAL_4, 0
	setvar VAR_SPECIAL_5, 1
	special SetBattleTowerProperty
	setvar VAR_SPECIAL_4, 8
	setvar VAR_SPECIAL_5, 0
	special SetBattleTowerProperty
	special LoadPlayerParty
	closemessage
	delay 2
	call S_DoSaveDialog
	setvar VAR_TEMP_0, 5
	erasebox 0, 0, 15, 10
	compare RESULT, 0
	goto_if_eq BattleTower_Lobby_EventScript_160642
	incrementgamestat GAME_STAT_ENTERED_BATTLE_TOWER
	special SavePlayerParty
	special SetBattleTowerParty
	setvar VAR_BRAVO_TRAINER_BATTLE_TOWER_ON, 1
	msgbox BattleTower_Lobby_Text_19A0A8, 4
	closemessage
	call BattleTower_Lobby_EventScript_160664
	warp MAP_BATTLE_TOWER_ELEVATOR, 255, 1, 6
	setvar VAR_TEMP_0, 0
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
	setvar VAR_SPECIAL_4, 12
	special SetBattleTowerProperty
	goto BattleTower_Lobby_EventScript_160652

BattleTower_Lobby_EventScript_16064F:: @ 816064F
	special LoadPlayerParty

BattleTower_Lobby_EventScript_160652:: @ 8160652
	msgbox BattleTower_Lobby_Text_199FA9, 4
	setvar VAR_SPECIAL_4, 11
	special SetBattleTowerProperty

BattleTower_Lobby_EventScript_160662:: @ 8160662
	release
	end

BattleTower_Lobby_EventScript_160664:: @ 8160664
	applymovement 1, BattleTower_Lobby_Movement_160693
	applymovement 255, BattleTower_Lobby_Movement_160693
	waitmovement 0
	opendoor 6, 1
	waitdooranim
	applymovement 1, BattleTower_Lobby_Movement_160697
	applymovement 255, BattleTower_Lobby_Movement_16069A
	waitmovement 0
	closedoor 6, 1
	waitdooranim
	return

BattleTower_Lobby_Movement_160693:: @ 8160693
	walk_up
	walk_up
	walk_up
	end_movement

BattleTower_Lobby_Movement_160697:: @ 8160697
	walk_up
	set_invisible
	end_movement

BattleTower_Lobby_Movement_16069A:: @ 816069A
	walk_up
	walk_up
	set_invisible
	end_movement

@ 816069E
	walk_fast_up
	walk_fast_up
	walk_fast_up
	walk_fast_up
	walk_fast_up
	set_invisible
	end_movement

BattleTower_Lobby_EventScript_1606A5:: @ 81606A5
	lock
	faceplayer
	msgbox BattleTower_Lobby_Text_19A747, MSGBOX_YESNO
	switch RESULT
	case YES, BattleTower_Lobby_EventScript_1606CC
	case NO, BattleTower_Lobby_EventScript_1606F7
	release
	end

BattleTower_Lobby_EventScript_1606CC:: @ 81606CC
	msgbox BattleTower_Lobby_Text_19A7C3, 4
	setvar VAR_SPECIAL_4, 1
	call BattleTower_Lobby_EventScript_1A00F3
	lock
	faceplayer
	compare RESULT, 0
	goto_if_eq BattleTower_Lobby_EventScript_160701
	compare RESULT, 1
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
	waitbuttonpress
	erasebox 0, 0, 29, 19
	releaseall
	end

BattleTower_Lobby_EventScript_160733:: @ 8160733
	lock
	faceplayer
	goto_if_set FLAG_RECEIVED_GOLD_SHIELD, BattleTower_Lobby_EventScript_1607C5
	goto_if_set FLAG_RECEIVED_SILVER_SHIELD, BattleTower_Lobby_EventScript_160773
	msgbox BattleTower_Lobby_Text_19A9EE, 4
	setvar VAR_SPECIAL_8, DECOR_SILVER_SHIELD
	givedecoration_std DECOR_SILVER_SHIELD
	compare RESULT, 0
	goto_if_eq BattleTower_Lobby_EventScript_1607AF
	setflag FLAG_RECEIVED_SILVER_SHIELD
	msgbox BattleTower_Lobby_Text_19ABAA, 4
	release
	end

BattleTower_Lobby_EventScript_160773:: @ 8160773
	specialvar RESULT, GetBestBattleTowerStreak
	compare RESULT, 100
	goto_if_lt BattleTower_Lobby_EventScript_1607C5
	msgbox BattleTower_Lobby_Text_19AAC4, 4
	setvar VAR_SPECIAL_8, DECOR_GOLD_SHIELD
	givedecoration_std DECOR_GOLD_SHIELD
	compare RESULT, 0
	goto_if_eq BattleTower_Lobby_EventScript_1607AF
	setflag FLAG_RECEIVED_GOLD_SHIELD
	msgbox BattleTower_Lobby_Text_19ABAA, 4
	release
	end

BattleTower_Lobby_EventScript_1607AF:: @ 81607AF
	bufferdecorationname 1, VAR_SPECIAL_8
	msgbox BattleTower_Lobby_Text_1A0CEF, 4
	msgbox BattleTower_Lobby_Text_19ABED, 4
	release
	end

BattleTower_Lobby_EventScript_1607C5:: @ 81607C5
	msgbox BattleTower_Lobby_Text_19AC55, 4
	release
	end
