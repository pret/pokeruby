SlateportCity_PokemonFanClub_MapScripts:: @ 8155764
	map_script 3, SlateportCity_PokemonFanClub_MapScript1_15576A
	.byte 0

SlateportCity_PokemonFanClub_MapScript1_15576A:: @ 815576A
	end

SlateportCity_PokemonFanClub_EventScript_15576B:: @ 815576B
	lock
	faceplayer
	switch VAR_SLATEPORT_FAN_CLUB_STATE
	case 0, SlateportCity_PokemonFanClub_EventScript_155795
	case 1, SlateportCity_PokemonFanClub_EventScript_1557A8
	case 2, SlateportCity_PokemonFanClub_EventScript_1557FE
	release
	end

SlateportCity_PokemonFanClub_EventScript_155795:: @ 8155795
	setvar VAR_SLATEPORT_FAN_CLUB_STATE, 1
	msgbox SlateportCity_PokemonFanClub_Text_17D773, 4
	goto SlateportCity_PokemonFanClub_EventScript_155808
	end

SlateportCity_PokemonFanClub_EventScript_1557A8:: @ 81557A8
	setvar VAR_TEMP_2, 0
	call_if_set FLAG_RECEIVED_YELLOW_SCARF, SlateportCity_PokemonFanClub_EventScript_155893
	call_if_set FLAG_RECEIVED_GREEN_SCARF, SlateportCity_PokemonFanClub_EventScript_155893
	call_if_set FLAG_RECEIVED_PINK_SCARF, SlateportCity_PokemonFanClub_EventScript_155893
	call_if_set FLAG_RECEIVED_BLUE_SCARF, SlateportCity_PokemonFanClub_EventScript_155893
	call_if_set FLAG_RECEIVED_RED_SCARF, SlateportCity_PokemonFanClub_EventScript_155893
	compare VAR_TEMP_2, 5
	call_if_eq SlateportCity_PokemonFanClub_EventScript_15588D
	compare VAR_SLATEPORT_FAN_CLUB_STATE, 2
	goto_if_eq SlateportCity_PokemonFanClub_EventScript_1557FE
	msgbox SlateportCity_PokemonFanClub_Text_17DA14, 4
	goto SlateportCity_PokemonFanClub_EventScript_155808
	end

SlateportCity_PokemonFanClub_EventScript_1557FE:: @ 81557FE
	msgbox SlateportCity_PokemonFanClub_Text_17DDD5, 4
	release
	end

SlateportCity_PokemonFanClub_EventScript_155808:: @ 8155808
	msgbox SlateportCity_PokemonFanClub_Text_17DA49, 4
	setvar VAR_TEMP_1, 0
	call_if_unset FLAG_RECEIVED_YELLOW_SCARF, SlateportCity_PokemonFanClub_EventScript_1559FE
	call_if_unset FLAG_RECEIVED_GREEN_SCARF, SlateportCity_PokemonFanClub_EventScript_1559E7
	call_if_unset FLAG_RECEIVED_PINK_SCARF, SlateportCity_PokemonFanClub_EventScript_1559D0
	call_if_unset FLAG_RECEIVED_BLUE_SCARF, SlateportCity_PokemonFanClub_EventScript_1559B9
	call_if_unset FLAG_RECEIVED_RED_SCARF, SlateportCity_PokemonFanClub_EventScript_1559A2
	bufferleadmonspeciesname 0
	switch VAR_TEMP_1
	case 0, SlateportCity_PokemonFanClub_EventScript_155899
	case 1, SlateportCity_PokemonFanClub_EventScript_1558A3
	case 2, SlateportCity_PokemonFanClub_EventScript_1558D4
	case 3, SlateportCity_PokemonFanClub_EventScript_155905
	case 4, SlateportCity_PokemonFanClub_EventScript_155936
	case 5, SlateportCity_PokemonFanClub_EventScript_155967
	release
	end

SlateportCity_PokemonFanClub_EventScript_15588D:: @ 815588D
	setvar VAR_SLATEPORT_FAN_CLUB_STATE, 2
	return

SlateportCity_PokemonFanClub_EventScript_155893:: @ 8155893
	addvar VAR_TEMP_2, 1
	return

SlateportCity_PokemonFanClub_EventScript_155899:: @ 8155899
	msgbox SlateportCity_PokemonFanClub_Text_17DA5C, 4
	release
	end

SlateportCity_PokemonFanClub_EventScript_1558A3:: @ 81558A3
	checkitemspace ITEM_RED_SCARF, 1
	compare RESULT, 0
	goto_if_eq SlateportCity_PokemonFanClub_EventScript_155998
	msgbox SlateportCity_PokemonFanClub_Text_17DB89, 4
	setflag FLAG_RECEIVED_RED_SCARF
	giveitem_std ITEM_RED_SCARF
	msgbox SlateportCity_PokemonFanClub_Text_17DC1B, 4
	release
	end

SlateportCity_PokemonFanClub_EventScript_1558D4:: @ 81558D4
	checkitemspace ITEM_BLUE_SCARF, 1
	compare RESULT, 0
	goto_if_eq SlateportCity_PokemonFanClub_EventScript_155998
	msgbox SlateportCity_PokemonFanClub_Text_17DB89, 4
	setflag FLAG_RECEIVED_BLUE_SCARF
	giveitem_std ITEM_BLUE_SCARF
	msgbox SlateportCity_PokemonFanClub_Text_17DC74, 4
	release
	end

SlateportCity_PokemonFanClub_EventScript_155905:: @ 8155905
	checkitemspace ITEM_PINK_SCARF, 1
	compare RESULT, 0
	goto_if_eq SlateportCity_PokemonFanClub_EventScript_155998
	msgbox SlateportCity_PokemonFanClub_Text_17DB89, 4
	setflag FLAG_RECEIVED_PINK_SCARF
	giveitem_std ITEM_PINK_SCARF
	msgbox SlateportCity_PokemonFanClub_Text_17DCCB, 4
	release
	end

SlateportCity_PokemonFanClub_EventScript_155936:: @ 8155936
	checkitemspace ITEM_GREEN_SCARF, 1
	compare RESULT, 0
	goto_if_eq SlateportCity_PokemonFanClub_EventScript_155998
	msgbox SlateportCity_PokemonFanClub_Text_17DB89, 4
	setflag FLAG_RECEIVED_GREEN_SCARF
	giveitem_std ITEM_GREEN_SCARF
	msgbox SlateportCity_PokemonFanClub_Text_17DD27, 4
	release
	end

SlateportCity_PokemonFanClub_EventScript_155967:: @ 8155967
	checkitemspace ITEM_YELLOW_SCARF, 1
	compare RESULT, 0
	goto_if_eq SlateportCity_PokemonFanClub_EventScript_155998
	msgbox SlateportCity_PokemonFanClub_Text_17DB89, 4
	setflag FLAG_RECEIVED_YELLOW_SCARF
	giveitem_std ITEM_YELLOW_SCARF
	msgbox SlateportCity_PokemonFanClub_Text_17DD78, 4
	release
	end

SlateportCity_PokemonFanClub_EventScript_155998:: @ 8155998
	msgbox SlateportCity_PokemonFanClub_Text_17DB0B, 4
	release
	end

SlateportCity_PokemonFanClub_EventScript_1559A2:: @ 81559A2
	specialvar RESULT, CheckLeadMonCool
	compare RESULT, 1
	call_if_eq SlateportCity_PokemonFanClub_EventScript_1559B3
	return

SlateportCity_PokemonFanClub_EventScript_1559B3:: @ 81559B3
	setvar VAR_TEMP_1, 1
	return

SlateportCity_PokemonFanClub_EventScript_1559B9:: @ 81559B9
	specialvar RESULT, CheckLeadMonBeauty
	compare RESULT, 1
	call_if_eq SlateportCity_PokemonFanClub_EventScript_1559CA
	return

SlateportCity_PokemonFanClub_EventScript_1559CA:: @ 81559CA
	setvar VAR_TEMP_1, 2
	return

SlateportCity_PokemonFanClub_EventScript_1559D0:: @ 81559D0
	specialvar RESULT, CheckLeadMonCute
	compare RESULT, 1
	call_if_eq SlateportCity_PokemonFanClub_EventScript_1559E1
	return

SlateportCity_PokemonFanClub_EventScript_1559E1:: @ 81559E1
	setvar VAR_TEMP_1, 3
	return

SlateportCity_PokemonFanClub_EventScript_1559E7:: @ 81559E7
	specialvar RESULT, CheckLeadMonSmart
	compare RESULT, 1
	call_if_eq SlateportCity_PokemonFanClub_EventScript_1559F8
	return

SlateportCity_PokemonFanClub_EventScript_1559F8:: @ 81559F8
	setvar VAR_TEMP_1, 4
	return

SlateportCity_PokemonFanClub_EventScript_1559FE:: @ 81559FE
	specialvar RESULT, CheckLeadMonTough
	compare RESULT, 1
	call_if_eq SlateportCity_PokemonFanClub_EventScript_155A0F
	return

SlateportCity_PokemonFanClub_EventScript_155A0F:: @ 8155A0F
	setvar VAR_TEMP_1, 5
	return

SlateportCity_PokemonFanClub_EventScript_155A15:: @ 8155A15
	lock
	faceplayer
	goto_if_set FLAG_RECEIVED_SOOTHE_BELL, SlateportCity_PokemonFanClub_EventScript_155A75
	msgbox SlateportCity_PokemonFanClub_Text_17DE6B, 4
	specialvar RESULT, GetLeadMonFriendshipScore
	compare RESULT, 4
	goto_if_ge SlateportCity_PokemonFanClub_EventScript_155A3A
	release
	end

SlateportCity_PokemonFanClub_EventScript_155A3A:: @ 8155A3A
	playse SE_PIN
	applymovement LAST_TALKED, SlateportCity_PokemonFanClub_Movement_1A0833
	waitmovement 0
	applymovement LAST_TALKED, SlateportCity_PokemonFanClub_Movement_1A0835
	waitmovement 0
	msgbox SlateportCity_PokemonFanClub_Text_17DF57, 4
	giveitem_std ITEM_SOOTHE_BELL
	compare RESULT, 0
	goto_if_eq SlateportCity_PokemonFanClub_EventScript_1A029B
	setflag FLAG_RECEIVED_SOOTHE_BELL
	release
	end

SlateportCity_PokemonFanClub_EventScript_155A75:: @ 8155A75
	msgbox SlateportCity_PokemonFanClub_Text_17DFB8, 4
	release
	end

SlateportCity_PokemonFanClub_EventScript_155A7F:: @ 8155A7F
	msgbox SlateportCity_PokemonFanClub_Text_17E03B, 2
	end

SlateportCity_PokemonFanClub_EventScript_155A88:: @ 8155A88
	msgbox SlateportCity_PokemonFanClub_Text_17E0ED, 2
	end

SlateportCity_PokemonFanClub_EventScript_155A91:: @ 8155A91
	lock
	faceplayer
	waitse
	playmoncry SPECIES_SKITTY, 0
	msgbox SlateportCity_PokemonFanClub_Text_17E14E, 4
	waitmoncry
	release
	end

SlateportCity_PokemonFanClub_EventScript_155AA4:: @ 8155AA4
	lock
	faceplayer
	waitse
	playmoncry SPECIES_ZIGZAGOON, 0
	msgbox SlateportCity_PokemonFanClub_Text_17E164, 4
	waitmoncry
	release
	end

SlateportCity_PokemonFanClub_EventScript_155AB7:: @ 8155AB7
	lock
	faceplayer
	waitse
	playmoncry SPECIES_AZUMARILL, 0
	msgbox SlateportCity_PokemonFanClub_Text_17E178, 4
	waitmoncry
	release
	end
