EverGrandeCity_PokemonLeague_MapScripts:: @ 815BA75
	map_script 3, EverGrandeCity_PokemonLeague_MapScript1_15BA7B
	.byte 0

EverGrandeCity_PokemonLeague_MapScript1_15BA7B:: @ 815BA7B
	sethealplace 20
	setflag 2132
	checkflag 263
	callif 0, EverGrandeCity_PokemonLeague_EventScript_15BA8B
	end

EverGrandeCity_PokemonLeague_EventScript_15BA8B:: @ 815BA8B
	movespriteperm 3, 9, 2
	movespriteperm 4, 10, 2
	return

EverGrandeCity_PokemonLeague_EventScript_15BA9A:: @ 815BA9A
	setvar 0x800b, 1
	call EverGrandeCity_PokemonLeague_EventScript_19FD5B
	waittext
	waitbutton
	release
	end

EverGrandeCity_PokemonLeague_EventScript_15BAA8:: @ 815BAA8
	lock
	faceplayer
	message EverGrandeCity_PokemonLeague_Text_1A0BE4
	waittext
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
	checkflag 263
	jumpif EQUAL, EverGrandeCity_PokemonLeague_EventScript_15BB57
	getplayerxy 0x4000, 0x4001
	compare 0x4000, 11
	callif 4, EverGrandeCity_PokemonLeague_EventScript_15BB34
	compare 0x4000, 8
	callif 3, EverGrandeCity_PokemonLeague_EventScript_15BB3F
	message EverGrandeCity_PokemonLeague_Text_1916FD
	waittext
	pause 75
	checkflag 2060
	jumpif 0, EverGrandeCity_PokemonLeague_EventScript_15BB4A
	closebutton
	move 3, EverGrandeCity_PokemonLeague_Movement_15BB7E
	move 4, EverGrandeCity_PokemonLeague_Movement_15BB81
	waitmove 0
	pause 10
	fanfare 369
	message EverGrandeCity_PokemonLeague_Text_191804
	waittext
	waitfanfare
	closebutton
	moveoffscreen 3
	moveoffscreen 4
	setflag 263
	releaseall
	end

EverGrandeCity_PokemonLeague_EventScript_15BB34:: @ 815BB34
	move 255, EverGrandeCity_PokemonLeague_Movement_15BB76
	waitmove 0
	return

EverGrandeCity_PokemonLeague_EventScript_15BB3F:: @ 815BB3F
	move 255, EverGrandeCity_PokemonLeague_Movement_15BB7A
	waitmove 0
	return

EverGrandeCity_PokemonLeague_EventScript_15BB4A:: @ 815BB4A
	playsfx 32
	msgbox EverGrandeCity_PokemonLeague_Text_19179C, 4
	releaseall
	end

EverGrandeCity_PokemonLeague_EventScript_15BB57:: @ 815BB57
	move LAST_TALKED, EverGrandeCity_PokemonLeague_Movement_1A0839
	waitmove 0
	msgbox EverGrandeCity_PokemonLeague_Text_191804, 4
	closebutton
	move LAST_TALKED, EverGrandeCity_PokemonLeague_Movement_1A083D
	waitmove 0
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
