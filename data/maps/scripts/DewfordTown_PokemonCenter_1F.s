DewfordTown_PokemonCenter_1F_MapScripts:: @ 8153014
	map_script 3, DewfordTown_PokemonCenter_1F_MapScript1_15301A
	.byte 0

DewfordTown_PokemonCenter_1F_MapScript1_15301A:: @ 815301A
	sethealplace 15
	call DewfordTown_PokemonCenter_1F_EventScript_19FD1B
	end

DewfordTown_PokemonCenter_1F_EventScript_153023:: @ 8153023
	setvar 0x800b, 1
	call DewfordTown_PokemonCenter_1F_EventScript_19FD5B
	waittext
	waitbutton
	release
	end

DewfordTown_PokemonCenter_1F_EventScript_153031:: @ 8153031
	msgbox DewfordTown_PokemonCenter_1F_Text_174CDB, 2
	end

DewfordTown_PokemonCenter_1F_EventScript_15303A:: @ 815303A
	msgbox DewfordTown_PokemonCenter_1F_Text_174D32, 2
	end

