MossdeepCity_PokemonCenter_1F_MapScripts:: @ 815A8D0
	map_script MAP_SCRIPT_ON_TRANSITION, MossdeepCity_PokemonCenter_1F_MapScript1_15A8D6
	.byte 0

MossdeepCity_PokemonCenter_1F_MapScript1_15A8D6:: @ 815A8D6
	setrespawn HEAL_LOCATION_MOSSDEEP_CITY
	end

MossdeepCity_PokemonCenter_1F_EventScript_15A8DA:: @ 815A8DA
	setvar VAR_0x800B, 1
	call MossdeepCity_PokemonCenter_1F_EventScript_19FD5B
	waitmessage
	waitbuttonpress
	release
	end

MossdeepCity_PokemonCenter_1F_EventScript_15A8E8:: @ 815A8E8
	msgbox MossdeepCity_PokemonCenter_1F_Text_18D62F, MSGBOX_NPC
	end

MossdeepCity_PokemonCenter_1F_EventScript_15A8F1:: @ 815A8F1
	msgbox MossdeepCity_PokemonCenter_1F_Text_18D69A, MSGBOX_NPC
	end
