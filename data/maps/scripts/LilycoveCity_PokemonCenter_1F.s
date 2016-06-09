LilycoveCity_PokemonCenter_1F_MapScripts:: @ 8159327
	map_script 3, LilycoveCity_PokemonCenter_1F_MapScript1_15932D
	.byte 0

LilycoveCity_PokemonCenter_1F_MapScript1_15932D:: @ 815932D
	sethealplace 8
	end

LilycoveCity_PokemonCenter_1F_EventScript_159331:: @ 8159331
	setvar 0x800b, 1
	call LilycoveCity_PokemonCenter_1F_EventScript_19FD5B
	waittext
	waitbutton
	release
	end

LilycoveCity_PokemonCenter_1F_EventScript_15933F:: @ 815933F
	loadptr 0, LilycoveCity_PokemonCenter_1F_Text_189FC9
	callstd 2
	end

LilycoveCity_PokemonCenter_1F_EventScript_159348:: @ 8159348
	lock
	faceplayer
	checkflag 2061
	jumpeq LilycoveCity_PokemonCenter_1F_EventScript_15935D
	loadptr 0, LilycoveCity_PokemonCenter_1F_Text_18A048
	callstd 4
	release
	end

LilycoveCity_PokemonCenter_1F_EventScript_15935D:: @ 815935D
	loadptr 0, LilycoveCity_PokemonCenter_1F_Text_18A0A1
	callstd 4
	release
	end

