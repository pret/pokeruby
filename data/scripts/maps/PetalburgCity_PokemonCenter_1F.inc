PetalburgCity_PokemonCenter_1F_MapScripts:: @ 8155204
	map_script 3, PetalburgCity_PokemonCenter_1F_MapScript1_15520A
	.byte 0

PetalburgCity_PokemonCenter_1F_MapScript1_15520A:: @ 815520A
	sethealplace 3
	call PetalburgCity_PokemonCenter_1F_EventScript_19FD1B
	end

PetalburgCity_PokemonCenter_1F_EventScript_155213:: @ 8155213
	setvar 0x800b, 1
	call PetalburgCity_PokemonCenter_1F_EventScript_19FD5B
	waittext
	waitbutton
	release
	end

PetalburgCity_PokemonCenter_1F_EventScript_155221:: @ 8155221
	msgbox PetalburgCity_PokemonCenter_1F_Text_17BD30, 2
	end

PetalburgCity_PokemonCenter_1F_EventScript_15522A:: @ 815522A
	msgbox PetalburgCity_PokemonCenter_1F_Text_17BD92, 2
	end

PetalburgCity_PokemonCenter_1F_EventScript_155233:: @ 8155233
	lock
	faceplayer
	msgbox PetalburgCity_PokemonCenter_1F_Text_17BDC5, 4
	specialval RESULT, IsStarterInParty
	compare RESULT, 1
	jumpeq PetalburgCity_PokemonCenter_1F_EventScript_15524F
	release
	end

PetalburgCity_PokemonCenter_1F_EventScript_15524F:: @ 815524F
	compare 0x4023, 0
	callif 1, PetalburgCity_PokemonCenter_1F_EventScript_155272
	compare 0x4023, 1
	callif 1, PetalburgCity_PokemonCenter_1F_EventScript_15527B
	compare 0x4023, 2
	callif 1, PetalburgCity_PokemonCenter_1F_EventScript_155284
	release
	end

PetalburgCity_PokemonCenter_1F_EventScript_155272:: @ 8155272
	msgbox PetalburgCity_PokemonCenter_1F_Text_17BE6C, 4
	return

PetalburgCity_PokemonCenter_1F_EventScript_15527B:: @ 815527B
	msgbox PetalburgCity_PokemonCenter_1F_Text_17BEF1, 4
	return

PetalburgCity_PokemonCenter_1F_EventScript_155284:: @ 8155284
	msgbox PetalburgCity_PokemonCenter_1F_Text_17BF73, 4
	return
