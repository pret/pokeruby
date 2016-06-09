RustboroCity_PokemonCenter_1F_MapScripts:: @ 8157B79
	map_script 3, RustboroCity_PokemonCenter_1F_MapScript1_157B7F
	.byte 0

RustboroCity_PokemonCenter_1F_MapScript1_157B7F:: @ 8157B7F
	sethealplace 6
	call RustboroCity_PokemonCenter_1F_EventScript_19FD1B
	end

RustboroCity_PokemonCenter_1F_EventScript_157B88:: @ 8157B88
	setvar 0x800b, 1
	call RustboroCity_PokemonCenter_1F_EventScript_19FD5B
	waittext
	waitbutton
	release
	end

RustboroCity_PokemonCenter_1F_EventScript_157B96:: @ 8157B96
	loadptr 0, RustboroCity_PokemonCenter_1F_Text_184B37
	callstd 2
	end

RustboroCity_PokemonCenter_1F_EventScript_157B9F:: @ 8157B9F
	loadptr 0, RustboroCity_PokemonCenter_1F_Text_184BAB
	callstd 2
	end

RustboroCity_PokemonCenter_1F_EventScript_157BA8:: @ 8157BA8
	loadptr 0, RustboroCity_PokemonCenter_1F_Text_184C19
	callstd 2
	end

