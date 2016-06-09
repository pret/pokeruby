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
	loadptr 0, SlateportCity_PokemonFanClub_Text_17D773
	callstd 4
	jump SlateportCity_PokemonFanClub_EventScript_155808
	end

SlateportCity_PokemonFanClub_EventScript_1557A8:: @ 81557A8
	setvar 0x4002, 0
	checkflag 204
	callif 1, SlateportCity_PokemonFanClub_EventScript_155893
	checkflag 203
	callif 1, SlateportCity_PokemonFanClub_EventScript_155893
	checkflag 202
	callif 1, SlateportCity_PokemonFanClub_EventScript_155893
	checkflag 201
	callif 1, SlateportCity_PokemonFanClub_EventScript_155893
	checkflag 200
	callif 1, SlateportCity_PokemonFanClub_EventScript_155893
	compare 0x4002, 5
	callif 1, SlateportCity_PokemonFanClub_EventScript_15588D
	compare 0x40b7, 2
	jumpeq SlateportCity_PokemonFanClub_EventScript_1557FE
	loadptr 0, SlateportCity_PokemonFanClub_Text_17DA14
	callstd 4
	jump SlateportCity_PokemonFanClub_EventScript_155808
	end

SlateportCity_PokemonFanClub_EventScript_1557FE:: @ 81557FE
	loadptr 0, SlateportCity_PokemonFanClub_Text_17DDD5
	callstd 4
	release
	end

SlateportCity_PokemonFanClub_EventScript_155808:: @ 8155808
	loadptr 0, SlateportCity_PokemonFanClub_Text_17DA49
	callstd 4
	setvar 0x4001, 0
	checkflag 204
	callif 0, SlateportCity_PokemonFanClub_EventScript_1559FE
	checkflag 203
	callif 0, SlateportCity_PokemonFanClub_EventScript_1559E7
	checkflag 202
	callif 0, SlateportCity_PokemonFanClub_EventScript_1559D0
	checkflag 201
	callif 0, SlateportCity_PokemonFanClub_EventScript_1559B9
	checkflag 200
	callif 0, SlateportCity_PokemonFanClub_EventScript_1559A2
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
	loadptr 0, SlateportCity_PokemonFanClub_Text_17DA5C
	callstd 4
	release
	end

SlateportCity_PokemonFanClub_EventScript_1558A3:: @ 81558A3
	checkitemspace ITEM_RED_SCARF, 1
	compare RESULT, 0
	jumpeq SlateportCity_PokemonFanClub_EventScript_155998
	loadptr 0, SlateportCity_PokemonFanClub_Text_17DB89
	callstd 4
	setflag 200
	setorcopyvar 0x8000, 0xfe
	setorcopyvar 0x8001, 0x1
	callstd 0
	loadptr 0, SlateportCity_PokemonFanClub_Text_17DC1B
	callstd 4
	release
	end

SlateportCity_PokemonFanClub_EventScript_1558D4:: @ 81558D4
	checkitemspace ITEM_BLUE_SCARF, 1
	compare RESULT, 0
	jumpeq SlateportCity_PokemonFanClub_EventScript_155998
	loadptr 0, SlateportCity_PokemonFanClub_Text_17DB89
	callstd 4
	setflag 201
	setorcopyvar 0x8000, 0xff
	setorcopyvar 0x8001, 0x1
	callstd 0
	loadptr 0, SlateportCity_PokemonFanClub_Text_17DC74
	callstd 4
	release
	end

SlateportCity_PokemonFanClub_EventScript_155905:: @ 8155905
	checkitemspace ITEM_PINK_SCARF, 1
	compare RESULT, 0
	jumpeq SlateportCity_PokemonFanClub_EventScript_155998
	loadptr 0, SlateportCity_PokemonFanClub_Text_17DB89
	callstd 4
	setflag 202
	setorcopyvar 0x8000, 0x100
	setorcopyvar 0x8001, 0x1
	callstd 0
	loadptr 0, SlateportCity_PokemonFanClub_Text_17DCCB
	callstd 4
	release
	end

SlateportCity_PokemonFanClub_EventScript_155936:: @ 8155936
	checkitemspace ITEM_GREEN_SCARF, 1
	compare RESULT, 0
	jumpeq SlateportCity_PokemonFanClub_EventScript_155998
	loadptr 0, SlateportCity_PokemonFanClub_Text_17DB89
	callstd 4
	setflag 203
	setorcopyvar 0x8000, 0x101
	setorcopyvar 0x8001, 0x1
	callstd 0
	loadptr 0, SlateportCity_PokemonFanClub_Text_17DD27
	callstd 4
	release
	end

SlateportCity_PokemonFanClub_EventScript_155967:: @ 8155967
	checkitemspace ITEM_YELLOW_SCARF, 1
	compare RESULT, 0
	jumpeq SlateportCity_PokemonFanClub_EventScript_155998
	loadptr 0, SlateportCity_PokemonFanClub_Text_17DB89
	callstd 4
	setflag 204
	setorcopyvar 0x8000, 0x102
	setorcopyvar 0x8001, 0x1
	callstd 0
	loadptr 0, SlateportCity_PokemonFanClub_Text_17DD78
	callstd 4
	release
	end

SlateportCity_PokemonFanClub_EventScript_155998:: @ 8155998
	loadptr 0, SlateportCity_PokemonFanClub_Text_17DB0B
	callstd 4
	release
	end

SlateportCity_PokemonFanClub_EventScript_1559A2:: @ 81559A2
	specialval RESULT, 265
	compare RESULT, 1
	callif 1, SlateportCity_PokemonFanClub_EventScript_1559B3
	return

SlateportCity_PokemonFanClub_EventScript_1559B3:: @ 81559B3
	setvar 0x4001, 1
	return

SlateportCity_PokemonFanClub_EventScript_1559B9:: @ 81559B9
	specialval RESULT, 266
	compare RESULT, 1
	callif 1, SlateportCity_PokemonFanClub_EventScript_1559CA
	return

SlateportCity_PokemonFanClub_EventScript_1559CA:: @ 81559CA
	setvar 0x4001, 2
	return

SlateportCity_PokemonFanClub_EventScript_1559D0:: @ 81559D0
	specialval RESULT, 267
	compare RESULT, 1
	callif 1, SlateportCity_PokemonFanClub_EventScript_1559E1
	return

SlateportCity_PokemonFanClub_EventScript_1559E1:: @ 81559E1
	setvar 0x4001, 3
	return

SlateportCity_PokemonFanClub_EventScript_1559E7:: @ 81559E7
	specialval RESULT, 268
	compare RESULT, 1
	callif 1, SlateportCity_PokemonFanClub_EventScript_1559F8
	return

SlateportCity_PokemonFanClub_EventScript_1559F8:: @ 81559F8
	setvar 0x4001, 4
	return

SlateportCity_PokemonFanClub_EventScript_1559FE:: @ 81559FE
	specialval RESULT, 269
	compare RESULT, 1
	callif 1, SlateportCity_PokemonFanClub_EventScript_155A0F
	return

SlateportCity_PokemonFanClub_EventScript_155A0F:: @ 8155A0F
	setvar 0x4001, 5
	return

SlateportCity_PokemonFanClub_EventScript_155A15:: @ 8155A15
	lock
	faceplayer
	checkflag 278
	jumpeq SlateportCity_PokemonFanClub_EventScript_155A75
	loadptr 0, SlateportCity_PokemonFanClub_Text_17DE6B
	callstd 4
	specialval RESULT, 230
	compare RESULT, 4
	jumpif 4, SlateportCity_PokemonFanClub_EventScript_155A3A
	release
	end

SlateportCity_PokemonFanClub_EventScript_155A3A:: @ 8155A3A
	playsfx 21
	move LAST_TALKED, SlateportCity_PokemonFanClub_Movement_1A0833
	waitmove 0
	move LAST_TALKED, SlateportCity_PokemonFanClub_Movement_1A0835
	waitmove 0
	loadptr 0, SlateportCity_PokemonFanClub_Text_17DF57
	callstd 4
	setorcopyvar 0x8000, 0xb8
	setorcopyvar 0x8001, 0x1
	callstd 0
	compare RESULT, 0
	jumpeq SlateportCity_PokemonFanClub_EventScript_1A029B
	setflag 278
	release
	end

SlateportCity_PokemonFanClub_EventScript_155A75:: @ 8155A75
	loadptr 0, SlateportCity_PokemonFanClub_Text_17DFB8
	callstd 4
	release
	end

SlateportCity_PokemonFanClub_EventScript_155A7F:: @ 8155A7F
	loadptr 0, SlateportCity_PokemonFanClub_Text_17E03B
	callstd 2
	end

SlateportCity_PokemonFanClub_EventScript_155A88:: @ 8155A88
	loadptr 0, SlateportCity_PokemonFanClub_Text_17E0ED
	callstd 2
	end

SlateportCity_PokemonFanClub_EventScript_155A91:: @ 8155A91
	lock
	faceplayer
	checksound
	pokecry SPECIES_SKITTY, 0
	loadptr 0, SlateportCity_PokemonFanClub_Text_17E14E
	callstd 4
	waitpokecry
	release
	end

SlateportCity_PokemonFanClub_EventScript_155AA4:: @ 8155AA4
	lock
	faceplayer
	checksound
	pokecry SPECIES_ZIGZAGOON, 0
	loadptr 0, SlateportCity_PokemonFanClub_Text_17E164
	callstd 4
	waitpokecry
	release
	end

SlateportCity_PokemonFanClub_EventScript_155AB7:: @ 8155AB7
	lock
	faceplayer
	checksound
	pokecry SPECIES_AZUMARILL, 0
	loadptr 0, SlateportCity_PokemonFanClub_Text_17E178
	callstd 4
	waitpokecry
	release
	end

