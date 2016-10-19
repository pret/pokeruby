MauvilleCity_PokemonCenter_1F_EventScript_1AE845:: @ 81AE845
	lock
	faceplayer
	setflag 2054
	msgbox MauvilleCity_PokemonCenter_1F_Text_1B0C5B, 4
	special 100
	compare RESULT, 0
	jumpif EQUAL, MauvilleCity_PokemonCenter_1F_EventScript_1AE86A
	msgbox MauvilleCity_PokemonCenter_1F_Text_1B0CA7, 4
	release
	end

MauvilleCity_PokemonCenter_1F_EventScript_1AE86A:: @ 81AE86A
	special 102
	compare RESULT, 1
	jumpif EQUAL, MauvilleCity_PokemonCenter_1F_EventScript_1AE882
	msgbox MauvilleCity_PokemonCenter_1F_Text_1B0D11, 4
	release
	end

MauvilleCity_PokemonCenter_1F_EventScript_1AE882:: @ 81AE882
	msgbox MauvilleCity_PokemonCenter_1F_Text_1B0D75, 4
	special 101
	release
	end
