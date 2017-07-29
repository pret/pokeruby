MauvilleCity_PokemonCenter_1F_EventScript_1AEBAB:: @ 81AEBAB
	lock
	faceplayer
	msgbox MauvilleCity_PokemonCenter_1F_Text_1AE88F, 5
	compare RESULT, 0
	jumpeq MauvilleCity_PokemonCenter_1F_EventScript_1AEBDA
	special sub_8109C44
	compare RESULT, 1
	jumpeq MauvilleCity_PokemonCenter_1F_EventScript_1AEBE3
	message MauvilleCity_PokemonCenter_1F_Text_1AE910
	waittext
	jump MauvilleCity_PokemonCenter_1F_EventScript_1AEBEC
	end

MauvilleCity_PokemonCenter_1F_EventScript_1AEBDA:: @ 81AEBDA
	msgbox MauvilleCity_PokemonCenter_1F_Text_1AE8C6, 2
	end

MauvilleCity_PokemonCenter_1F_EventScript_1AEBE3:: @ 81AEBE3
	msgbox MauvilleCity_PokemonCenter_1F_Text_1AE8DF, 2
	end

MauvilleCity_PokemonCenter_1F_EventScript_1AEBEC:: @ 81AEBEC
	special sub_8109E34
	waitstate
	compare 0x8004, 0
	jumpeq MauvilleCity_PokemonCenter_1F_EventScript_1AEC2D
	compare 0x8004, 65535
	jumpeq MauvilleCity_PokemonCenter_1F_EventScript_1AEC36
	msgbox MauvilleCity_PokemonCenter_1F_Text_1AE97C, 5
	compare RESULT, 0
	jumpeq MauvilleCity_PokemonCenter_1F_EventScript_1AEC42
	special sub_8109C58
	compare RESULT, 1
	jumpeq MauvilleCity_PokemonCenter_1F_EventScript_1AEC4E
	jump MauvilleCity_PokemonCenter_1F_EventScript_1AEC57
	end

MauvilleCity_PokemonCenter_1F_EventScript_1AEC2D:: @ 81AEC2D
	msgbox MauvilleCity_PokemonCenter_1F_Text_1AE950, 2
	end

MauvilleCity_PokemonCenter_1F_EventScript_1AEC36:: @ 81AEC36
	message MauvilleCity_PokemonCenter_1F_Text_1AEB31
	waittext
	jump MauvilleCity_PokemonCenter_1F_EventScript_1AEBEC
	end

MauvilleCity_PokemonCenter_1F_EventScript_1AEC42:: @ 81AEC42
	message MauvilleCity_PokemonCenter_1F_Text_1AE910
	waittext
	jump MauvilleCity_PokemonCenter_1F_EventScript_1AEBEC
	end

MauvilleCity_PokemonCenter_1F_EventScript_1AEC4E:: @ 81AEC4E
	msgbox MauvilleCity_PokemonCenter_1F_Text_1AE9B6, 2
	end

MauvilleCity_PokemonCenter_1F_EventScript_1AEC57:: @ 81AEC57
	msgbox MauvilleCity_PokemonCenter_1F_Text_1AE9F8, 4
	special sub_8109CF0
	waitstate
	compare 0x8006, 0
	jumpeq MauvilleCity_PokemonCenter_1F_EventScript_1AECA6
	compare 0x8006, 65535
	jumpeq MauvilleCity_PokemonCenter_1F_EventScript_1AECAF
	special sub_8109C90
	compare RESULT, 1
	jumpeq MauvilleCity_PokemonCenter_1F_EventScript_1AECBD
	msgbox MauvilleCity_PokemonCenter_1F_Text_1AEA9B, 5
	compare RESULT, 0
	jumpeq MauvilleCity_PokemonCenter_1F_EventScript_1AEC57
	special sub_8109DE0
	msgbox MauvilleCity_PokemonCenter_1F_Text_1AEAFB, 2
	end

MauvilleCity_PokemonCenter_1F_EventScript_1AECA6:: @ 81AECA6
	msgbox MauvilleCity_PokemonCenter_1F_Text_1AEA2B, 2
	end

MauvilleCity_PokemonCenter_1F_EventScript_1AECAF:: @ 81AECAF
	msgbox MauvilleCity_PokemonCenter_1F_Text_1AEAC3, 4
	jump MauvilleCity_PokemonCenter_1F_EventScript_1AEC57
	end

MauvilleCity_PokemonCenter_1F_EventScript_1AECBD:: @ 81AECBD
	msgbox MauvilleCity_PokemonCenter_1F_Text_1AEA57, 2
	end
