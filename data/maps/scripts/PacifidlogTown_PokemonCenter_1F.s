PacifidlogTown_PokemonCenter_1F_MapScripts:: @ 81540FF
	map_script 3, PacifidlogTown_PokemonCenter_1F_MapScript1_154105
	.byte 0

PacifidlogTown_PokemonCenter_1F_MapScript1_154105:: @ 8154105
	sethealplace 19
	end

	.incbin "baserom.gba", 0x154109, 0xe

PacifidlogTown_PokemonCenter_1F_EventScript_154117:: @ 8154117
	loadptr 0, PacifidlogTown_PokemonCenter_1F_Text_178E47
	callstd 2
	end

PacifidlogTown_PokemonCenter_1F_EventScript_154120:: @ 8154120
	loadptr 0, PacifidlogTown_PokemonCenter_1F_Text_178E79
	callstd 2
	end

PacifidlogTown_PokemonCenter_1F_EventScript_154129:: @ 8154129
	loadptr 0, PacifidlogTown_PokemonCenter_1F_Text_178ED9
	callstd 2
	end

