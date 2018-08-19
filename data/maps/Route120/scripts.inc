Route120_MapScripts:: @ 815160E
	map_script 5, Route120_MapScript1_15161E
	map_script 3, Route120_MapScript1_1516DF
	map_script 1, Route120_MapScript1_151686
	.byte 0

Route120_MapScript1_15161E:: @ 815161E
	call_if_set FLAG_SYS_CTRL_OBJ_DELETE, Route120_EventScript_151628
	end

Route120_EventScript_151628:: @ 8151628
	compare VAR_SPECIAL_4, 0
	call_if_eq Route120_EventScript_15166B
	compare VAR_SPECIAL_4, 1
	call_if_eq Route120_EventScript_151672
	compare VAR_SPECIAL_4, 2
	call_if_eq Route120_EventScript_151676
	compare VAR_SPECIAL_4, 3
	call_if_eq Route120_EventScript_15167A
	compare VAR_SPECIAL_4, 4
	call_if_eq Route120_EventScript_15167E
	compare VAR_SPECIAL_4, 5
	call_if_eq Route120_EventScript_151682
	return

Route120_EventScript_15166B:: @ 815166B
	removeobject 30
	removeobject 36
	return

Route120_EventScript_151672:: @ 8151672
	removeobject 37
	return

Route120_EventScript_151676:: @ 8151676
	removeobject 38
	return

Route120_EventScript_15167A:: @ 815167A
	removeobject 39
	return

Route120_EventScript_15167E:: @ 815167E
	removeobject 41
	return

Route120_EventScript_151682:: @ 8151682
	removeobject 40
	return

Route120_MapScript1_151686:: @ 8151686
	call_if_unset FLAG_REGI_DOORS_OPENED, Route120_EventScript_1516A2
	call_if_set FLAG_RECEIVED_DEVON_SCOPE, Route120_EventScript_1516B5
	call_if_unset FLAG_RECEIVED_DEVON_SCOPE, Route120_EventScript_1516DA
	end

Route120_EventScript_1516A2:: @ 81516A2
	setmetatile 7, 54, 124, 1
	setmetatile 7, 55, 145, 1
	return

Route120_EventScript_1516B5:: @ 81516B5
	setmetatile 13, 15, 663, 0
	setmetatile 12, 16, 671, 0
	setmetatile 12, 17, 161, 0
	setmetatile 13, 17, 161, 0
	return

Route120_EventScript_1516DA:: @ 81516DA
	setobjectmovementtype 36, 10
	return

Route120_MapScript1_1516DF:: @ 81516DF
	call Route120_EventScript_1AE313
	call Route120_EventScript_1516EA
	end

Route120_EventScript_1516EA:: @ 81516EA
	getplayerxy VAR_TEMP_0, VAR_TEMP_1
	compare VAR_TEMP_1, 14
	goto_if_le Route120_EventScript_151715
	compare VAR_TEMP_1, 60
	goto_if_le Route120_EventScript_151719
	compare VAR_TEMP_1, 61
	goto_if_ge Route120_EventScript_151711
	return

Route120_EventScript_151711:: @ 8151711
	setweather WEATHER_CLOUDS
	return

Route120_EventScript_151715:: @ 8151715
	setweather WEATHER_SUNNY
	return

Route120_EventScript_151719:: @ 8151719
	compare VAR_TEMP_0, 7
	goto_if_le Route120_EventScript_151735
	compare VAR_TEMP_0, 19
	goto_if_le Route120_EventScript_151715
	goto Route120_EventScript_151735
	end

Route120_EventScript_151735:: @ 8151735
	setweather WEATHER_RAIN_LIGHT
	return

Route120_EventScript_151739:: @ 8151739
	lock
	faceplayer
	dodailyevents
	goto_if_set FLAG_DAILY_RECEIVED_BERRY_ROUTE120, Route120_EventScript_151837
	msgbox Route120_Text_1C58F1, MSGBOX_YESNO
	compare RESULT, YES
	call_if_eq Route120_EventScript_151841
	compare RESULT, NO
	call_if_eq Route120_EventScript_15184A
	specialvar RESULT, GetPlayerTrainerIdOnesDigit
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
	setvar VAR_SPECIAL_4, ITEM_FIGY_BERRY
	goto Route120_EventScript_151813
	end

Route120_EventScript_1517E7:: @ 81517E7
	setvar VAR_SPECIAL_4, ITEM_WIKI_BERRY
	goto Route120_EventScript_151813
	end

Route120_EventScript_1517F2:: @ 81517F2
	setvar VAR_SPECIAL_4, ITEM_MAGO_BERRY
	goto Route120_EventScript_151813
	end

Route120_EventScript_1517FD:: @ 81517FD
	setvar VAR_SPECIAL_4, ITEM_AGUAV_BERRY
	goto Route120_EventScript_151813
	end

Route120_EventScript_151808:: @ 8151808
	setvar VAR_SPECIAL_4, ITEM_IAPAPA_BERRY
	goto Route120_EventScript_151813
	end

Route120_EventScript_151813:: @ 8151813
	giveitem_std VAR_SPECIAL_4
	compare RESULT, 0
	goto_if_eq Route120_EventScript_1A029B
	setflag FLAG_DAILY_RECEIVED_BERRY_ROUTE120
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
	goto_if_set FLAG_NOT_READY_FOR_BATTLE_ROUTE120, Route120_EventScript_151884
	msgbox Route120_Text_171827, MSGBOX_YESNO
	compare RESULT, NO
	goto_if_eq Route120_EventScript_151877
	goto Route120_EventScript_15189D
	end

Route120_EventScript_151877:: @ 8151877
	msgbox Route120_Text_17193D, 4
	setflag FLAG_NOT_READY_FOR_BATTLE_ROUTE120
	release
	end

Route120_EventScript_151884:: @ 8151884
	msgbox Route120_Text_17196F, MSGBOX_YESNO
	compare RESULT, NO
	goto_if_eq Route120_EventScript_151877
	goto Route120_EventScript_15189D
	end

Route120_EventScript_15189D:: @ 815189D
	msgbox Route120_Text_1719A0, 4
	closemessage
	compare FACING, 2
	call_if_eq Route120_EventScript_15197F
	compare FACING, 3
	call_if_eq Route120_EventScript_15198A
	applymovement 31, Route120_Movement_1A083F
	waitmovement 0
	delay 20
	msgbox Route120_Text_1719D4, 4
	closemessage
	applymovement 30, Route120_Movement_1A0843
	waitmovement 0
	applymovement 30, Route120_Movement_1A0662
	waitmovement 0
	waitse
	playmoncry SPECIES_KECLEON, 2
	delay 40
	waitmoncry
	setwildbattle SPECIES_KECLEON, 30, ITEM_NONE
	setvar VAR_SPECIAL_4, 0
	setflag FLAG_SYS_CTRL_OBJ_DELETE
	dowildbattle
	clearflag FLAG_SYS_CTRL_OBJ_DELETE
	goto Route120_EventScript_151908
	end

Route120_EventScript_151908:: @ 8151908
	applymovement 31, Route120_Movement_1A0845
	applymovement 255, Route120_Movement_1A0841
	waitmovement 0
	msgbox Route120_Text_171A40, 4
	giveitem_std ITEM_DEVON_SCOPE
	setflag FLAG_RECEIVED_DEVON_SCOPE
	msgbox Route120_Text_171B0E, 4
	closemessage
	applymovement 31, Route120_Movement_1A0845
	waitmovement 0
	delay 50
	setfieldeffectargument 0, 1
	dofieldeffect FLDEFF_NPCFLY_OUT
	delay 15
	removeobject 31
	waitfieldeffect FLDEFF_NPCFLY_OUT
	setmetatile 13, 15, 663, 0
	setmetatile 12, 16, 671, 0
	setmetatile 12, 17, 161, 0
	setmetatile 13, 17, 161, 0
	special DrawWholeMapView
	release
	end

Route120_EventScript_15197F:: @ 815197F
	applymovement 255, Route120_Movement_1A083F
	waitmovement 0
	return

Route120_EventScript_15198A:: @ 815198A
	applymovement 255, Route120_Movement_151995
	waitmovement 0
	return

Route120_Movement_151995:: @ 8151995
	walk_down
	walk_left
	end_movement

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
	trainerbattle 0, TRAINER_COLIN, 0, Route120_Text_1BEFC8, Route120_Text_1BF000
	msgbox Route120_Text_1BF015, 6
	end

Route120_EventScript_1519CA:: @ 81519CA
	trainerbattle 0, TRAINER_ROBERT_1, 0, Route120_Text_1BF07E, Route120_Text_1BF0A5
	specialvar RESULT, ShouldTryRematchBattle
	compare RESULT, 1
	goto_if_eq Route120_EventScript_1519F1
	msgbox Route120_Text_1BF0C3, 6
	end

Route120_EventScript_1519F1:: @ 81519F1
	trainerbattle 5, TRAINER_ROBERT_1, 0, Route120_Text_1BF0FA, Route120_Text_1BF131
	msgbox Route120_Text_1BF154, 6
	end

Route120_EventScript_151A08:: @ 8151A08
	trainerbattle 0, TRAINER_CARLOS, 0, Route120_Text_1BF193, Route120_Text_1BF1D4
	msgbox Route120_Text_1BF215, 6
	end

Route120_EventScript_151A1F:: @ 8151A1F
	trainerbattle 0, TRAINER_JENNA, 0, Route120_Text_1BF26E, Route120_Text_1BF2D2
	msgbox Route120_Text_1BF2EA, 6
	end

Route120_EventScript_151A36:: @ 8151A36
	trainerbattle 0, TRAINER_BRANDON_1, 0, Route120_Text_1BF32B, Route120_Text_1BF36B
	specialvar RESULT, ShouldTryRematchBattle
	compare RESULT, 1
	goto_if_eq Route120_EventScript_151A5D
	msgbox Route120_Text_1BF38D, 6
	end

Route120_EventScript_151A5D:: @ 8151A5D
	trainerbattle 5, TRAINER_BRANDON_1, 0, Route120_Text_1BF3D0, Route120_Text_1BF416
	msgbox Route120_Text_1BF43E, 6
	end

Route120_EventScript_151A74:: @ 8151A74
	trainerbattle 0, TRAINER_JENNIFER, 0, Route120_Text_1BF4A0, Route120_Text_1BF504
	msgbox Route120_Text_1BF51F, 6
	end

Route120_EventScript_151A8B:: @ 8151A8B
	trainerbattle 0, TRAINER_CHIP, 0, Route120_Text_1BF560, Route120_Text_1BF5D6
	msgbox Route120_Text_1BF5F4, 6
	end

Route120_EventScript_151AA2:: @ 8151AA2
	trainerbattle 0, TRAINER_CLARISSA, 0, Route120_Text_1BF65B, Route120_Text_1BF6A4
	msgbox Route120_Text_1BF6D0, 6
	end

Route120_EventScript_151AB9:: @ 8151AB9
	trainerbattle 0, TRAINER_ANGELICA, 0, Route120_Text_1BF728, Route120_Text_1BF78C
	msgbox Route120_Text_1BF7B2, 6
	end

Route120_EventScript_151AD0:: @ 8151AD0
	trainerbattle 0, TRAINER_KEIGO, 0, Route120_Text_1BF80B, Route120_Text_1BF852
	msgbox Route120_Text_1BF891, 6
	end

Route120_EventScript_151AE7:: @ 8151AE7
	trainerbattle 0, TRAINER_TSUNAO, 0, Route120_Text_1BF8C5, Route120_Text_1BF920
	msgbox Route120_Text_1BF946, 6
	end
