MauvilleCity_PokemonCenter_1F_MapScripts:: @ 8157351
	map_script 3, MauvilleCity_PokemonCenter_1F_MapScript1_157357
	.byte 0

MauvilleCity_PokemonCenter_1F_MapScript1_157357:: @ 8157357
	setrespawn HEAL_LOCATION_MAUVILLE_CITY
	call MauvilleCity_PokemonCenter_1F_EventScript_19FD1B
	goto MauvilleCity_PokemonCenter_1F_EventScript_157365
	end

MauvilleCity_PokemonCenter_1F_EventScript_157365:: @ 8157365
	special sub_80F83D0
	end

MauvilleCity_PokemonCenter_1F_EventScript_157369:: @ 8157369
	setvar VAR_0x800B, 1
	call MauvilleCity_PokemonCenter_1F_EventScript_19FD5B
	waitmessage
	waitbuttonpress
	release
	end

MauvilleCity_PokemonCenter_1F_EventScript_157377:: @ 8157377
	msgbox MauvilleCity_PokemonCenter_1F_Text_1825BD, MSGBOX_NPC
	end

MauvilleCity_PokemonCenter_1F_EventScript_157380:: @ 8157380
	msgbox MauvilleCity_PokemonCenter_1F_Text_182622, MSGBOX_NPC
	end

MauvilleCity_PokemonCenter_1F_EventScript_157389:: @ 8157389
	msgbox MauvilleCity_PokemonCenter_1F_Text_1826A6, MSGBOX_NPC
	end
