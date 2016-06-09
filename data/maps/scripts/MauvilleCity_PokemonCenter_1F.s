MauvilleCity_PokemonCenter_1F_MapScripts:: @ 8157351
	map_script 3, MauvilleCity_PokemonCenter_1F_MapScript1_157357
	.byte 0

MauvilleCity_PokemonCenter_1F_MapScript1_157357:: @ 8157357
	sethealplace 5
	call MauvilleCity_PokemonCenter_1F_EventScript_19FD1B
	jump MauvilleCity_PokemonCenter_1F_EventScript_157365
	end

MauvilleCity_PokemonCenter_1F_EventScript_157365:: @ 8157365
	special 104
	end

MauvilleCity_PokemonCenter_1F_EventScript_157369:: @ 8157369
	setvar 0x800b, 1
	call MauvilleCity_PokemonCenter_1F_EventScript_19FD5B
	waittext
	waitbutton
	release
	end

MauvilleCity_PokemonCenter_1F_EventScript_157377:: @ 8157377
	loadptr 0, MauvilleCity_PokemonCenter_1F_Text_1825BD
	callstd 2
	end

MauvilleCity_PokemonCenter_1F_EventScript_157380:: @ 8157380
	loadptr 0, MauvilleCity_PokemonCenter_1F_Text_182622
	callstd 2
	end

MauvilleCity_PokemonCenter_1F_EventScript_157389:: @ 8157389
	loadptr 0, MauvilleCity_PokemonCenter_1F_Text_1826A6
	callstd 2
	end

