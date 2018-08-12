FallarborTown_PokemonCenter_1F_MapScripts:: @ 8153AF3
	map_script 3, FallarborTown_PokemonCenter_1F_MapScript1_153AF9
	.byte 0

FallarborTown_PokemonCenter_1F_MapScript1_153AF9:: @ 8153AF9
	setrespawn HEAL_LOCATION_FALLARBOR_TOWN
	call FallarborTown_PokemonCenter_1F_EventScript_19FD1B
	end

FallarborTown_PokemonCenter_1F_EventScript_153B02:: @ 8153B02
	setvar VAR_SPECIAL_B, 1
	call FallarborTown_PokemonCenter_1F_EventScript_19FD5B
	waitmessage
	waitbuttonpress
	release
	end

FallarborTown_PokemonCenter_1F_EventScript_153B10:: @ 8153B10
	msgbox FallarborTown_PokemonCenter_1F_Text_17768C, 2
	end

FallarborTown_PokemonCenter_1F_EventScript_153B19:: @ 8153B19
	msgbox FallarborTown_PokemonCenter_1F_Text_1776F5, 2
	end

FallarborTown_PokemonCenter_1F_EventScript_153B22:: @ 8153B22
	lock
	faceplayer
	msgbox FallarborTown_PokemonCenter_1F_Text_1774D4, 4
	closemessage
	switch FACING
	case 2, FallarborTown_PokemonCenter_1F_EventScript_153B49
	case 3, FallarborTown_PokemonCenter_1F_EventScript_153B59
	end

FallarborTown_PokemonCenter_1F_EventScript_153B49:: @ 8153B49
	applymovement 4, FallarborTown_PokemonCenter_1F_Movement_153B74
	waitmovement 0
	goto FallarborTown_PokemonCenter_1F_EventScript_153B69
	end

FallarborTown_PokemonCenter_1F_EventScript_153B59:: @ 8153B59
	applymovement 4, FallarborTown_PokemonCenter_1F_Movement_153B81
	waitmovement 0
	goto FallarborTown_PokemonCenter_1F_EventScript_153B69
	end

FallarborTown_PokemonCenter_1F_EventScript_153B69:: @ 8153B69
	playse SE_JIDO_DOA
	removeobject 4
	clearflag FLAG_HIDE_LANETTE
	release
	end

FallarborTown_PokemonCenter_1F_Movement_153B74:: @ 8153B74
	walk_right
	walk_down
	walk_down
	walk_left
	walk_left
	walk_left
	walk_left
	walk_down
	walk_down
	walk_down
	walk_down
	delay_8
	end_movement

FallarborTown_PokemonCenter_1F_Movement_153B81:: @ 8153B81
	walk_down
	walk_down
	walk_left
	walk_left
	walk_left
	walk_down
	walk_down
	walk_down
	walk_down
	delay_8
	end_movement
