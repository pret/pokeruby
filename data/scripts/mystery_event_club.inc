PetalburgCity_PokemonCenter_1F_EventScript_1B1B14:: @ 81B1B14
	lock
	faceplayer
	checkflag 2053
	goto_if_eq PetalburgCity_PokemonCenter_1F_EventScript_1B1BDB
	msgbox PetalburgCity_PokemonCenter_1F_Text_1B1C97, 4
	goto PetalburgCity_PokemonCenter_1F_EventScript_1B1B2D
	end

PetalburgCity_PokemonCenter_1F_EventScript_1B1B2D:: @ 81B1B2D
	msgbox PetalburgCity_PokemonCenter_1F_Text_1B1D10, 4
	multichoice 17, 6, 20, 0
	switch RESULT
	case 0, PetalburgCity_PokemonCenter_1F_EventScript_1B1B7A
	case 1, PetalburgCity_PokemonCenter_1F_EventScript_1B1BD1
	case 2, PetalburgCity_PokemonCenter_1F_EventScript_1B1B6C
	case 127, PetalburgCity_PokemonCenter_1F_EventScript_1B1BD1
	end

PetalburgCity_PokemonCenter_1F_EventScript_1B1B6C:: @ 81B1B6C
	msgbox PetalburgCity_PokemonCenter_1F_Text_1B1D3A, 4
	goto PetalburgCity_PokemonCenter_1F_EventScript_1B1B2D
	end

PetalburgCity_PokemonCenter_1F_EventScript_1B1B7A:: @ 81B1B7A
	msgbox PetalburgCity_PokemonCenter_1F_Text_1B1F7B, 4
	closebutton
	setvar 0x8004, 0
	call PetalburgCity_PokemonCenter_1F_EventScript_1A00F3
	lock
	faceplayer
	compare 0x8004, 1
	call_if 1, PetalburgCity_PokemonCenter_1F_EventScript_1B1C77
	compare RESULT, 0
	goto_if_eq PetalburgCity_PokemonCenter_1F_EventScript_1B1BB1
	compare RESULT, 1
	goto_if_eq PetalburgCity_PokemonCenter_1F_EventScript_1B1BBB
	end

PetalburgCity_PokemonCenter_1F_EventScript_1B1BB1:: @ 81B1BB1
	msgbox PetalburgCity_PokemonCenter_1F_Text_1B1FF0, 4
	release
	end

PetalburgCity_PokemonCenter_1F_EventScript_1B1BBB:: @ 81B1BBB
	setvar 0x8004, 0
	special sub_80EB7C4
	waittext
	delay 80
	msgbox PetalburgCity_PokemonCenter_1F_Text_1B2137, 4
	release
	end

PetalburgCity_PokemonCenter_1F_EventScript_1B1BD1:: @ 81B1BD1
	msgbox PetalburgCity_PokemonCenter_1F_Text_1B1FA3, 4
	release
	end

PetalburgCity_PokemonCenter_1F_EventScript_1B1BDB:: @ 81B1BDB
	msgbox PetalburgCity_PokemonCenter_1F_Text_1B202F, 4
	goto PetalburgCity_PokemonCenter_1F_EventScript_1B1BE9
	end

PetalburgCity_PokemonCenter_1F_EventScript_1B1BE9:: @ 81B1BE9
	msgbox PetalburgCity_PokemonCenter_1F_Text_1B2063, 4
	multichoice 17, 6, 20, 0
	switch RESULT
	case 0, PetalburgCity_PokemonCenter_1F_EventScript_1B1C36
	case 1, PetalburgCity_PokemonCenter_1F_EventScript_1B1C6D
	case 2, PetalburgCity_PokemonCenter_1F_EventScript_1B1C28
	case 127, PetalburgCity_PokemonCenter_1F_EventScript_1B1C6D
	end

PetalburgCity_PokemonCenter_1F_EventScript_1B1C28:: @ 81B1C28
	msgbox PetalburgCity_PokemonCenter_1F_Text_1B1D3A, 4
	goto PetalburgCity_PokemonCenter_1F_EventScript_1B1BE9
	end

PetalburgCity_PokemonCenter_1F_EventScript_1B1C36:: @ 81B1C36
	msgbox PetalburgCity_PokemonCenter_1F_Text_1B207F, 4
	closebutton
	setvar 0x8004, 0
	call PetalburgCity_PokemonCenter_1F_EventScript_1A00F3
	lock
	faceplayer
	compare 0x8004, 1
	call_if 1, PetalburgCity_PokemonCenter_1F_EventScript_1B1C77
	compare RESULT, 0
	goto_if_eq PetalburgCity_PokemonCenter_1F_EventScript_1B1BB1
	compare RESULT, 1
	goto_if_eq PetalburgCity_PokemonCenter_1F_EventScript_1B1BBB
	end

PetalburgCity_PokemonCenter_1F_EventScript_1B1C6D:: @ 81B1C6D
	msgbox PetalburgCity_PokemonCenter_1F_Text_1B20CE, 4
	release
	end

PetalburgCity_PokemonCenter_1F_EventScript_1B1C77:: @ 81B1C77
	checkflag 2059
	goto_if 0, PetalburgCity_PokemonCenter_1F_EventScript_1B1C96
	checkflag 2124
	goto_if_eq PetalburgCity_PokemonCenter_1F_EventScript_1B1C96
	setflag 2124
	msgbox PetalburgCity_PokemonCenter_1F_Text_1B21CC, 3
	release
	end

PetalburgCity_PokemonCenter_1F_EventScript_1B1C96:: @ 81B1C96
	return
