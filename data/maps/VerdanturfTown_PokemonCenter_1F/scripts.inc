VerdanturfTown_PokemonCenter_1F_MapScripts:: @ 8153F09
	map_script 3, VerdanturfTown_PokemonCenter_1F_MapScript1_153F0F
	.byte 0

VerdanturfTown_PokemonCenter_1F_MapScript1_153F0F:: @ 8153F0F
	setrespawn HEAL_LOCATION_VERDANTURF_TOWN
	call VerdanturfTown_PokemonCenter_1F_EventScript_19FD1B
	end

PacifidlogTown_PokemonCenter_1F_EventScript_153F18:: @ 8153F18
VerdanturfTown_PokemonCenter_1F_EventScript_153F18:: @ 8153F18
	setvar VAR_SPECIAL_B, 1
	call VerdanturfTown_PokemonCenter_1F_EventScript_19FD5B
	waitmessage
	waitbuttonpress
	release
	end

VerdanturfTown_PokemonCenter_1F_EventScript_153F26:: @ 8153F26
	msgbox VerdanturfTown_PokemonCenter_1F_Text_17831D, 2
	end

VerdanturfTown_PokemonCenter_1F_EventScript_153F2F:: @ 8153F2F
	msgbox VerdanturfTown_PokemonCenter_1F_Text_178389, 2
	end
