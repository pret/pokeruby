MauvilleCity_PokemonCenter_1F_EventScript_1B0816:: @ 81B0816
	setvar 0x8008, 0
	setvar 0x8009, 0
	setvar 0x800a, 0
	setvar 0x800b, 0
	lock
	faceplayer
	msgbox MauvilleCity_PokemonCenter_1F_Text_1AECC6, 5
	compare RESULT, 0
	jumpeq MauvilleCity_PokemonCenter_1F_EventScript_1B0914
	specialval RESULT, 107
	compare RESULT, 0
	jumpeq MauvilleCity_PokemonCenter_1F_EventScript_1B08D3

MauvilleCity_PokemonCenter_1F_EventScript_1B084F:: @ 81B084F
	message MauvilleCity_PokemonCenter_1F_Text_1AED35
	waittext
	special 109
	waitstate
	compare RESULT, 0
	jumpeq MauvilleCity_PokemonCenter_1F_EventScript_1B0883
	setvar 0x8008, 1
	special 108
	waittext
	waitbutton
	specialval RESULT, 110
	compare RESULT, 0
	jumpeq MauvilleCity_PokemonCenter_1F_EventScript_1B0893
	jump MauvilleCity_PokemonCenter_1F_EventScript_1B0909

MauvilleCity_PokemonCenter_1F_EventScript_1B0883:: @ 81B0883
	compare 0x8008, 0
	jumpeq MauvilleCity_PokemonCenter_1F_EventScript_1B0914
	jump MauvilleCity_PokemonCenter_1F_EventScript_1B08AE

MauvilleCity_PokemonCenter_1F_EventScript_1B0893:: @ 81B0893
	msgbox MauvilleCity_PokemonCenter_1F_Text_1AEE50, 4
	msgbox MauvilleCity_PokemonCenter_1F_Text_1AEF0A, 5
	compare RESULT, 1
	jumpeq MauvilleCity_PokemonCenter_1F_EventScript_1B084F

MauvilleCity_PokemonCenter_1F_EventScript_1B08AE:: @ 81B08AE
	specialval RESULT, 112
	compare RESULT, 1
	jumpeq MauvilleCity_PokemonCenter_1F_EventScript_1B091F
	specialval RESULT, 107
	compare RESULT, 4
	jumpeq MauvilleCity_PokemonCenter_1F_EventScript_1B091F
	jump MauvilleCity_PokemonCenter_1F_EventScript_1B08DB

MauvilleCity_PokemonCenter_1F_EventScript_1B08D3:: @ 81B08D3
	msgbox MauvilleCity_PokemonCenter_1F_Text_1AED70, 4

MauvilleCity_PokemonCenter_1F_EventScript_1B08DB:: @ 81B08DB
	msgbox MauvilleCity_PokemonCenter_1F_Text_1AEEB4, 5
	compare RESULT, 0
	jumpeq MauvilleCity_PokemonCenter_1F_EventScript_1B0914
	specialval RESULT, 111
	compare RESULT, 1
	jumpeq MauvilleCity_PokemonCenter_1F_EventScript_1B0909
	msgbox MauvilleCity_PokemonCenter_1F_Text_1AEF49, 4
	closebutton
	release
	end

MauvilleCity_PokemonCenter_1F_EventScript_1B0909:: @ 81B0909
	msgbox MauvilleCity_PokemonCenter_1F_Text_1AEDE8, 4
	closebutton
	release
	end

MauvilleCity_PokemonCenter_1F_EventScript_1B0914:: @ 81B0914
	msgbox MauvilleCity_PokemonCenter_1F_Text_1AED1D, 4
	closebutton
	release
	end

MauvilleCity_PokemonCenter_1F_EventScript_1B091F:: @ 81B091F
	msgbox MauvilleCity_PokemonCenter_1F_Text_1AEFA5, 4
	closebutton
	release
	end
