OldaleTown_PokemonCenter_1F_MapScripts:: @ 8152F08
	map_script 3, OldaleTown_PokemonCenter_1F_MapScript1_152F0E
	.byte 0

OldaleTown_PokemonCenter_1F_MapScript1_152F0E:: @ 8152F0E
	setrespawn HEAL_LOCATION_OLDALE_TOWN
	call OldaleTown_PokemonCenter_1F_EventScript_19FD1B
	end

OldaleTown_PokemonCenter_1F_EventScript_152F17:: @ 8152F17
	setvar VAR_SPECIAL_B, 1
	call OldaleTown_PokemonCenter_1F_EventScript_19FD5B
	waitmessage
	waitbuttonpress
	release
	end

OldaleTown_PokemonCenter_1F_EventScript_152F25:: @ 8152F25
	msgbox OldaleTown_PokemonCenter_1F_Text_1748D1, 2
	end

OldaleTown_PokemonCenter_1F_EventScript_152F2E:: @ 8152F2E
	msgbox OldaleTown_PokemonCenter_1F_Text_174945, 2
	end

OldaleTown_PokemonCenter_1F_EventScript_152F37:: @ 8152F37
	lock
	faceplayer
	goto_if_set FLAG_SYS_POKEDEX_GET, OldaleTown_PokemonCenter_1F_EventScript_152F4C
	msgbox OldaleTown_PokemonCenter_1F_Text_1749C0, 4
	release
	end

OldaleTown_PokemonCenter_1F_EventScript_152F4C:: @ 8152F4C
	msgbox OldaleTown_PokemonCenter_1F_Text_174A2E, 4
	release
	end
