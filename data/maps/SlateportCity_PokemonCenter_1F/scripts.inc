SlateportCity_PokemonCenter_1F_MapScripts:: @ 81563BF
	map_script 3, SlateportCity_PokemonCenter_1F_MapScript1_1563C5
	.byte 0

SlateportCity_PokemonCenter_1F_MapScript1_1563C5:: @ 81563C5
	setrespawn HEAL_LOCATION_SLATEPORT_CITY
	call SlateportCity_PokemonCenter_1F_EventScript_19FD1B
	end

SlateportCity_PokemonCenter_1F_EventScript_1563CE:: @ 81563CE
	setvar VAR_SPECIAL_B, 1
	call SlateportCity_PokemonCenter_1F_EventScript_19FD5B
	waitmessage
	waitbuttonpress
	release
	end

SlateportCity_PokemonCenter_1F_EventScript_1563DC:: @ 81563DC
	msgbox SlateportCity_PokemonCenter_1F_Text_180602, 2
	end

SlateportCity_PokemonCenter_1F_EventScript_1563E5:: @ 81563E5
	msgbox SlateportCity_PokemonCenter_1F_Text_1806CB, 2
	end
