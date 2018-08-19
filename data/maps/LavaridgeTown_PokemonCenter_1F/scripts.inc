LavaridgeTown_PokemonCenter_1F_MapScripts:: @ 815390C
	map_script 3, LavaridgeTown_PokemonCenter_1F_MapScript1_153912
	.byte 0

LavaridgeTown_PokemonCenter_1F_MapScript1_153912:: @ 8153912
	setrespawn HEAL_LOCATION_LAVARIDGE_TOWN
	call LavaridgeTown_PokemonCenter_1F_EventScript_19FD1B
	end

LavaridgeTown_PokemonCenter_1F_EventScript_15391B:: @ 815391B
	setvar VAR_SPECIAL_B, 1
	call LavaridgeTown_PokemonCenter_1F_EventScript_19FD5B
	waitmessage
	waitbuttonpress
	release
	end

LavaridgeTown_PokemonCenter_1F_EventScript_153929:: @ 8153929
	msgbox LavaridgeTown_PokemonCenter_1F_Text_176F08, 2
	end

LavaridgeTown_PokemonCenter_1F_EventScript_153932:: @ 8153932
	msgbox LavaridgeTown_PokemonCenter_1F_Text_176E92, 2
	end

LavaridgeTown_PokemonCenter_1F_EventScript_15393B:: @ 815393B
	msgbox LavaridgeTown_PokemonCenter_1F_Text_176F7A, 2
	end
