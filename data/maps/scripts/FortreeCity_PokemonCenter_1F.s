FortreeCity_PokemonCenter_1F_MapScripts:: @ 8158011
	map_script 3, FortreeCity_PokemonCenter_1F_MapScript1_158017
	.byte 0

FortreeCity_PokemonCenter_1F_MapScript1_158017:: @ 8158017
	sethealplace 7
	end

FortreeCity_PokemonCenter_1F_EventScript_15801B:: @ 815801B
	setvar 0x800b, 1
	call FortreeCity_PokemonCenter_1F_EventScript_19FD5B
	waittext
	waitbutton
	release
	end

FortreeCity_PokemonCenter_1F_EventScript_158029:: @ 8158029
	loadptr 0, FortreeCity_PokemonCenter_1F_Text_186027
	callstd 2
	end

FortreeCity_PokemonCenter_1F_EventScript_158032:: @ 8158032
	loadptr 0, FortreeCity_PokemonCenter_1F_Text_186086
	callstd 2
	end

FortreeCity_PokemonCenter_1F_EventScript_15803B:: @ 815803B
	loadptr 0, FortreeCity_PokemonCenter_1F_Text_186138
	callstd 2
	end

