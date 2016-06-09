SlateportCity_PokemonCenter_1F_MapScripts:: @ 81563BF
	map_script 3, SlateportCity_PokemonCenter_1F_MapScript1_1563C5
	.byte 0

SlateportCity_PokemonCenter_1F_MapScript1_1563C5:: @ 81563C5
	sethealplace 4
	call SlateportCity_PokemonCenter_1F_EventScript_19FD1B
	end

SlateportCity_PokemonCenter_1F_EventScript_1563CE:: @ 81563CE
	setvar 0x800b, 1
	call SlateportCity_PokemonCenter_1F_EventScript_19FD5B
	waittext
	waitbutton
	release
	end

SlateportCity_PokemonCenter_1F_EventScript_1563DC:: @ 81563DC
	loadptr 0, SlateportCity_PokemonCenter_1F_Text_180602
	callstd 2
	end

SlateportCity_PokemonCenter_1F_EventScript_1563E5:: @ 81563E5
	loadptr 0, SlateportCity_PokemonCenter_1F_Text_1806CB
	callstd 2
	end

