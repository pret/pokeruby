MauvilleCity_PokemonCenter_1F_EventScript_1AE744:: @ 81AE744
	special 97
	switch RESULT
	case 0, MauvilleCity_PokemonCenter_1F_EventScript_1AE784
	case 1, MauvilleCity_PokemonCenter_1F_EventScript_1AE845
	case 2, MauvilleCity_PokemonCenter_1F_EventScript_1AEBAB
	case 3, MauvilleCity_PokemonCenter_1F_EventScript_1B0816
	case 4, MauvilleCity_PokemonCenter_1F_EventScript_1B09EB
	end

MauvilleCity_PokemonCenter_1F_EventScript_1AE784:: @ 81AE784
	lock
	faceplayer
	msgbox MauvilleCity_PokemonCenter_1F_Text_1B0A91, 5
	compare RESULT, 1
	jumpeq MauvilleCity_PokemonCenter_1F_EventScript_1AE7A5
	compare RESULT, 0
	jumpeq MauvilleCity_PokemonCenter_1F_EventScript_1AE7C8
	end

MauvilleCity_PokemonCenter_1F_EventScript_1AE7A5:: @ 81AE7A5
	setvar 0x8004, 0
	special 103
	pause 60
	special 98
	compare RESULT, 0
	jumpeq MauvilleCity_PokemonCenter_1F_EventScript_1AE7D2
	msgbox MauvilleCity_PokemonCenter_1F_Text_1B0AED, 4
	release
	end

MauvilleCity_PokemonCenter_1F_EventScript_1AE7C8:: @ 81AE7C8
	msgbox MauvilleCity_PokemonCenter_1F_Text_1B0AC3, 4
	release
	end

MauvilleCity_PokemonCenter_1F_EventScript_1AE7D2:: @ 81AE7D2
	msgbox MauvilleCity_PokemonCenter_1F_Text_1B0B2C, 5
	compare RESULT, 1
	jumpeq MauvilleCity_PokemonCenter_1F_EventScript_1AE7F1
	compare RESULT, 0
	jumpeq MauvilleCity_PokemonCenter_1F_EventScript_1AE83B
	end

MauvilleCity_PokemonCenter_1F_EventScript_1AE7F1:: @ 81AE7F1
	setvar 0x8004, 6
	call MauvilleCity_PokemonCenter_1F_EventScript_1A00F3
	lock
	faceplayer
	compare RESULT, 0
	jumpeq MauvilleCity_PokemonCenter_1F_EventScript_1AE83B
	msgbox MauvilleCity_PokemonCenter_1F_Text_1B0BD0, 4
	setvar 0x8004, 1
	special 103
	pause 60
	msgbox MauvilleCity_PokemonCenter_1F_Text_1B0BFA, 5
	compare RESULT, 0
	jumpeq MauvilleCity_PokemonCenter_1F_EventScript_1AE7F1
	special 99
	msgbox MauvilleCity_PokemonCenter_1F_Text_1B0C23, 4
	release
	end

MauvilleCity_PokemonCenter_1F_EventScript_1AE83B:: @ 81AE83B
	msgbox MauvilleCity_PokemonCenter_1F_Text_1B0BA6, 4
	release
	end
