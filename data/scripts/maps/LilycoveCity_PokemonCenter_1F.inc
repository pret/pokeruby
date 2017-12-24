LilycoveCity_PokemonCenter_1F_MapScripts:: @ 8159327
	map_script 3, LilycoveCity_PokemonCenter_1F_MapScript1_15932D
	.byte 0

LilycoveCity_PokemonCenter_1F_MapScript1_15932D:: @ 815932D
	setrespawn 8
	end

LilycoveCity_PokemonCenter_1F_EventScript_159331:: @ 8159331
	setvar SPECIALVAR_B, 1
	call LilycoveCity_PokemonCenter_1F_EventScript_19FD5B
	waitmessage
	waitbuttonpress
	release
	end

LilycoveCity_PokemonCenter_1F_EventScript_15933F:: @ 815933F
	msgbox LilycoveCity_PokemonCenter_1F_Text_189FC9, 2
	end

LilycoveCity_PokemonCenter_1F_EventScript_159348:: @ 8159348
	lock
	faceplayer
	checkflag FLAG_BADGE07_GET
	goto_if_eq LilycoveCity_PokemonCenter_1F_EventScript_15935D
	msgbox LilycoveCity_PokemonCenter_1F_Text_18A048, 4
	release
	end

LilycoveCity_PokemonCenter_1F_EventScript_15935D:: @ 815935D
	msgbox LilycoveCity_PokemonCenter_1F_Text_18A0A1, 4
	release
	end
