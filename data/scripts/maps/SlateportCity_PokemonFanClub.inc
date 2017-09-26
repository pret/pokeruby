SlateportCity_PokemonFanClub_MapScripts:: @ 8155764
	map_script 3, SlateportCity_PokemonFanClub_MapScript1_15576A
	.byte 0

SlateportCity_PokemonFanClub_MapScript1_15576A:: @ 815576A
	end

SlateportCity_PokemonFanClub_EventScript_15576B:: @ 815576B
	lock
	faceplayer
	switch 0x40b7
	case 0, SlateportCity_PokemonFanClub_EventScript_155795
	case 1, SlateportCity_PokemonFanClub_EventScript_1557A8
	case 2, SlateportCity_PokemonFanClub_EventScript_1557FE
	release
	end

SlateportCity_PokemonFanClub_EventScript_155795:: @ 8155795
	setvar 0x40b7, 1
	msgbox SlateportCity_PokemonFanClub_Text_17D773, 4
	goto SlateportCity_PokemonFanClub_EventScript_155808
	end

SlateportCity_PokemonFanClub_EventScript_1557A8:: @ 81557A8
	setvar 0x4002, 0
	checkflag 204
	call_if 1, SlateportCity_PokemonFanClub_EventScript_155893
	checkflag 203
	call_if 1, SlateportCity_PokemonFanClub_EventScript_155893
	checkflag 202
	call_if 1, SlateportCity_PokemonFanClub_EventScript_155893
	checkflag 201
	call_if 1, SlateportCity_PokemonFanClub_EventScript_155893
	checkflag 200
	call_if 1, SlateportCity_PokemonFanClub_EventScript_155893
	compare 0x4002, 5
	call_if 1, SlateportCity_PokemonFanClub_EventScript_15588D
	compare 0x40b7, 2
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
	setvar 0x4001, 0
	checkflag 204
	call_if 0, SlateportCity_PokemonFanClub_EventScript_1559FE
	checkflag 203
	call_if 0, SlateportCity_PokemonFanClub_EventScript_1559E7
	checkflag 202
	call_if 0, SlateportCity_PokemonFanClub_EventScript_1559D0
	checkflag 201
	call_if 0, SlateportCity_PokemonFanClub_EventScript_1559B9
	checkflag 200
	call_if 0, SlateportCity_PokemonFanClub_EventScript_1559A2
	bufferfirstpoke 0
	switch 0x4001
	case 0, SlateportCity_PokemonFanClub_EventScript_155899
	case 1, SlateportCity_PokemonFanClub_EventScript_1558A3
	case 2, SlateportCity_PokemonFanClub_EventScript_1558D4
	case 3, SlateportCity_PokemonFanClub_EventScript_155905
	case 4, SlateportCity_PokemonFanClub_EventScript_155936
	case 5, SlateportCity_PokemonFanClub_EventScript_155967
	release
	end

SlateportCity_PokemonFanClub_EventScript_15588D:: @ 815588D
	setvar 0x40b7, 2
	return

SlateportCity_PokemonFanClub_EventScript_155893:: @ 8155893
	addvar 0x4002, 1
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
	setflag 200
	giveitem ITEM_RED_SCARF
	msgbox SlateportCity_PokemonFanClub_Text_17DC1B, 4
	release
	end

SlateportCity_PokemonFanClub_EventScript_1558D4:: @ 81558D4
	checkitemspace ITEM_BLUE_SCARF, 1
	compare RESULT, 0
	goto_if_eq SlateportCity_PokemonFanClub_EventScript_155998
	msgbox SlateportCity_PokemonFanClub_Text_17DB89, 4
	setflag 201
	giveitem ITEM_BLUE_SCARF
	msgbox SlateportCity_PokemonFanClub_Text_17DC74, 4
	release
	end

SlateportCity_PokemonFanClub_EventScript_155905:: @ 8155905
	checkitemspace ITEM_PINK_SCARF, 1
	compare RESULT, 0
	goto_if_eq SlateportCity_PokemonFanClub_EventScript_155998
	msgbox SlateportCity_PokemonFanClub_Text_17DB89, 4
	setflag 202
	giveitem ITEM_PINK_SCARF
	msgbox SlateportCity_PokemonFanClub_Text_17DCCB, 4
	release
	end

SlateportCity_PokemonFanClub_EventScript_155936:: @ 8155936
	checkitemspace ITEM_GREEN_SCARF, 1
	compare RESULT, 0
	goto_if_eq SlateportCity_PokemonFanClub_EventScript_155998
	msgbox SlateportCity_PokemonFanClub_Text_17DB89, 4
	setflag 203
	giveitem ITEM_GREEN_SCARF
	msgbox SlateportCity_PokemonFanClub_Text_17DD27, 4
	release
	end

SlateportCity_PokemonFanClub_EventScript_155967:: @ 8155967
	checkitemspace ITEM_YELLOW_SCARF, 1
	compare RESULT, 0
	goto_if_eq SlateportCity_PokemonFanClub_EventScript_155998
	msgbox SlateportCity_PokemonFanClub_Text_17DB89, 4
	setflag 204
	giveitem ITEM_YELLOW_SCARF
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
	call_if 1, SlateportCity_PokemonFanClub_EventScript_1559B3
	return

SlateportCity_PokemonFanClub_EventScript_1559B3:: @ 81559B3
	setvar 0x4001, 1
	return

SlateportCity_PokemonFanClub_EventScript_1559B9:: @ 81559B9
	specialvar RESULT, CheckLeadMonBeauty
	compare RESULT, 1
	call_if 1, SlateportCity_PokemonFanClub_EventScript_1559CA
	return

SlateportCity_PokemonFanClub_EventScript_1559CA:: @ 81559CA
	setvar 0x4001, 2
	return

SlateportCity_PokemonFanClub_EventScript_1559D0:: @ 81559D0
	specialvar RESULT, CheckLeadMonCute
	compare RESULT, 1
	call_if 1, SlateportCity_PokemonFanClub_EventScript_1559E1
	return

SlateportCity_PokemonFanClub_EventScript_1559E1:: @ 81559E1
	setvar 0x4001, 3
	return

SlateportCity_PokemonFanClub_EventScript_1559E7:: @ 81559E7
	specialvar RESULT, CheckLeadMonSmart
	compare RESULT, 1
	call_if 1, SlateportCity_PokemonFanClub_EventScript_1559F8
	return

SlateportCity_PokemonFanClub_EventScript_1559F8:: @ 81559F8
	setvar 0x4001, 4
	return

SlateportCity_PokemonFanClub_EventScript_1559FE:: @ 81559FE
	specialvar RESULT, CheckLeadMonTough
	compare RESULT, 1
	call_if 1, SlateportCity_PokemonFanClub_EventScript_155A0F
	return

SlateportCity_PokemonFanClub_EventScript_155A0F:: @ 8155A0F
	setvar 0x4001, 5
	return

SlateportCity_PokemonFanClub_EventScript_155A15:: @ 8155A15
	lock
	faceplayer
	checkflag 278
	goto_if_eq SlateportCity_PokemonFanClub_EventScript_155A75
	msgbox SlateportCity_PokemonFanClub_Text_17DE6B, 4
	specialvar RESULT, GetLeadMonFriendshipScore
	compare RESULT, 4
	goto_if 4, SlateportCity_PokemonFanClub_EventScript_155A3A
	release
	end

SlateportCity_PokemonFanClub_EventScript_155A3A:: @ 8155A3A
	playse 21
	applymovement LAST_TALKED, SlateportCity_PokemonFanClub_Movement_1A0833
	waitmovement 0
	applymovement LAST_TALKED, SlateportCity_PokemonFanClub_Movement_1A0835
	waitmovement 0
	msgbox SlateportCity_PokemonFanClub_Text_17DF57, 4
	giveitem ITEM_SOOTHE_BELL
	compare RESULT, 0
	goto_if_eq SlateportCity_PokemonFanClub_EventScript_1A029B
	setflag 278
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
	pokecry SPECIES_SKITTY, 0
	msgbox SlateportCity_PokemonFanClub_Text_17E14E, 4
	waitpokecry
	release
	end

SlateportCity_PokemonFanClub_EventScript_155AA4:: @ 8155AA4
	lock
	faceplayer
	waitse
	pokecry SPECIES_ZIGZAGOON, 0
	msgbox SlateportCity_PokemonFanClub_Text_17E164, 4
	waitpokecry
	release
	end

SlateportCity_PokemonFanClub_EventScript_155AB7:: @ 8155AB7
	lock
	faceplayer
	waitse
	pokecry SPECIES_AZUMARILL, 0
	msgbox SlateportCity_PokemonFanClub_Text_17E178, 4
	waitpokecry
	release
	end
