EverGrandeCity_PokemonLeague_MapScripts:: @ 815BA75
	map_script 3, EverGrandeCity_PokemonLeague_MapScript1_15BA7B
	.byte 0

EverGrandeCity_PokemonLeague_MapScript1_15BA7B:: @ 815BA7B
	setrespawn 20
	setflag FLAG_SYS_POKEMON_LEAGUE_FLY
	checkflag FLAG_ENTERED_ELITE_FOUR
	call_if 0, EverGrandeCity_PokemonLeague_EventScript_15BA8B
	end

EverGrandeCity_PokemonLeague_EventScript_15BA8B:: @ 815BA8B
	setobjectxyperm 3, 9, 2
	setobjectxyperm 4, 10, 2
	return

EverGrandeCity_PokemonLeague_EventScript_15BA9A:: @ 815BA9A
	setvar 0x800b, 1
	call EverGrandeCity_PokemonLeague_EventScript_19FD5B
	waitmessage
	waitbuttonpress
	release
	end

EverGrandeCity_PokemonLeague_EventScript_15BAA8:: @ 815BAA8
	lock
	faceplayer
	message EverGrandeCity_PokemonLeague_Text_1A0BE4
	waitmessage
	pokemart EverGrandeCity_PokemonLeague_Items
	msgbox EverGrandeCity_PokemonLeague_Text_1A0C02, 4
	release
	end

	.align 2
EverGrandeCity_PokemonLeague_Items:: @ 815BAC0
	.2byte ITEM_ULTRA_BALL
	.2byte ITEM_HYPER_POTION
	.2byte ITEM_MAX_POTION
	.2byte ITEM_FULL_RESTORE
	.2byte ITEM_FULL_HEAL
	.2byte ITEM_REVIVE
	.2byte ITEM_MAX_REPEL
	.2byte ITEM_NONE
	release
	end

EverGrandeCity_PokemonLeague_EventScript_15BAD2:: @ 815BAD2
	lockall
	checkflag FLAG_ENTERED_ELITE_FOUR
	goto_if_eq EverGrandeCity_PokemonLeague_EventScript_15BB57
	getplayerxy VAR_TEMP_0, VAR_TEMP_1
	compare VAR_TEMP_0, 11
	call_if 4, EverGrandeCity_PokemonLeague_EventScript_15BB34
	compare VAR_TEMP_0, 8
	call_if 3, EverGrandeCity_PokemonLeague_EventScript_15BB3F
	message EverGrandeCity_PokemonLeague_Text_1916FD
	waitmessage
	delay 75
	checkflag FLAG_BADGE06_GET
	goto_if 0, EverGrandeCity_PokemonLeague_EventScript_15BB4A
	closemessage
	applymovement 3, EverGrandeCity_PokemonLeague_Movement_15BB7E
	applymovement 4, EverGrandeCity_PokemonLeague_Movement_15BB81
	waitmovement 0
	delay 10
	playfanfare 369
	message EverGrandeCity_PokemonLeague_Text_191804
	waitmessage
	waitfanfare
	closemessage
	moveobjectoffscreen 3
	moveobjectoffscreen 4
	setflag FLAG_ENTERED_ELITE_FOUR
	releaseall
	end

EverGrandeCity_PokemonLeague_EventScript_15BB34:: @ 815BB34
	applymovement 255, EverGrandeCity_PokemonLeague_Movement_15BB76
	waitmovement 0
	return

EverGrandeCity_PokemonLeague_EventScript_15BB3F:: @ 815BB3F
	applymovement 255, EverGrandeCity_PokemonLeague_Movement_15BB7A
	waitmovement 0
	return

EverGrandeCity_PokemonLeague_EventScript_15BB4A:: @ 815BB4A
	playse 32
	msgbox EverGrandeCity_PokemonLeague_Text_19179C, 4
	releaseall
	end

EverGrandeCity_PokemonLeague_EventScript_15BB57:: @ 815BB57
	applymovement LAST_TALKED, EverGrandeCity_PokemonLeague_Movement_1A0839
	waitmovement 0
	msgbox EverGrandeCity_PokemonLeague_Text_191804, 4
	closemessage
	applymovement LAST_TALKED, EverGrandeCity_PokemonLeague_Movement_1A083D
	waitmovement 0
	releaseall
	end

EverGrandeCity_PokemonLeague_Movement_15BB76:: @ 815BB76
	step_down
	step_left
	step_26
	step_end

EverGrandeCity_PokemonLeague_Movement_15BB7A:: @ 815BB7A
	step_down
	step_right
	step_26
	step_end

EverGrandeCity_PokemonLeague_Movement_15BB7E:: @ 815BB7E
	step_left
	step_25
	step_end

EverGrandeCity_PokemonLeague_Movement_15BB81:: @ 815BB81
	step_right
	step_25
	step_end
