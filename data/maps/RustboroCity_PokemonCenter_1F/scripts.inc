RustboroCity_PokemonCenter_1F_MapScripts:: @ 8157B79
	map_script 3, RustboroCity_PokemonCenter_1F_MapScript1_157B7F
	.byte 0

RustboroCity_PokemonCenter_1F_MapScript1_157B7F:: @ 8157B7F
	setrespawn HEAL_LOCATION_RUSTBORO_CITY
	call RustboroCity_PokemonCenter_1F_EventScript_19FD1B
	end

RustboroCity_PokemonCenter_1F_EventScript_157B88:: @ 8157B88
	setvar VAR_SPECIAL_B, 1
	call RustboroCity_PokemonCenter_1F_EventScript_19FD5B
	waitmessage
	waitbuttonpress
	release
	end

RustboroCity_PokemonCenter_1F_EventScript_157B96:: @ 8157B96
	msgbox RustboroCity_PokemonCenter_1F_Text_184B37, 2
	end

RustboroCity_PokemonCenter_1F_EventScript_157B9F:: @ 8157B9F
	msgbox RustboroCity_PokemonCenter_1F_Text_184BAB, 2
	end

RustboroCity_PokemonCenter_1F_EventScript_157BA8:: @ 8157BA8
	msgbox RustboroCity_PokemonCenter_1F_Text_184C19, 2
	end
