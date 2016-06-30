MauvilleCity_PokemonCenter_1F_EventScript_1B09EB:: @ 81B09EB
	lock
	faceplayer
	msgbox MauvilleCity_PokemonCenter_1F_Text_1B092A, 5
	compare RESULT, 1
	jumpeq MauvilleCity_PokemonCenter_1F_EventScript_1B0A0C
	compare RESULT, 0
	jumpeq MauvilleCity_PokemonCenter_1F_EventScript_1B0A6F
	end

MauvilleCity_PokemonCenter_1F_EventScript_1B0A0C:: @ 81B0A0C
	special 106
	compare RESULT, 1
	jumpeq MauvilleCity_PokemonCenter_1F_EventScript_1B0A4E
	compare RESULT, 0
	jumpeq MauvilleCity_PokemonCenter_1F_EventScript_1B0A79
	end

MauvilleCity_PokemonCenter_1F_EventScript_1B0A26:: @ 81B0A26
	special 106
	compare RESULT, 1
	jumpeq MauvilleCity_PokemonCenter_1F_EventScript_1B0A40
	compare RESULT, 0
	jumpeq MauvilleCity_PokemonCenter_1F_EventScript_1B0A79
	end

MauvilleCity_PokemonCenter_1F_EventScript_1B0A40:: @ 81B0A40
	msgbox MauvilleCity_PokemonCenter_1F_Text_1B0998, 4
	jump MauvilleCity_PokemonCenter_1F_EventScript_1B0A4E
	end

MauvilleCity_PokemonCenter_1F_EventScript_1B0A4E:: @ 81B0A4E
	special 105
	special 141
	waittext
	yesnobox 20, 8
	compare RESULT, 1
	jumpeq MauvilleCity_PokemonCenter_1F_EventScript_1B0A26
	compare RESULT, 0
	jumpeq MauvilleCity_PokemonCenter_1F_EventScript_1B0A26
	end

MauvilleCity_PokemonCenter_1F_EventScript_1B0A6F:: @ 81B0A6F
	msgbox MauvilleCity_PokemonCenter_1F_Text_1B097C, 4
	release
	end

MauvilleCity_PokemonCenter_1F_EventScript_1B0A79:: @ 81B0A79
	msgbox MauvilleCity_PokemonCenter_1F_Text_1B09B0, 4
	release
	end
