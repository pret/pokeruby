EverGrandeCity_PokemonLeague_MapBorder:: @ 82F28E0
	.incbin "data/layouts/EverGrandeCity_PokemonLeague/border.bin"

EverGrandeCity_PokemonLeague_MapBlockdata:: @ 82F28E8
	.incbin "data/layouts/EverGrandeCity_PokemonLeague/map.bin"

	.align 2
EverGrandeCity_PokemonLeague_Layout:: @ 82F2AB0
	.4byte 0x13
	.4byte 0xc
	.4byte EverGrandeCity_PokemonLeague_MapBorder
	.4byte EverGrandeCity_PokemonLeague_MapBlockdata
	.4byte gTileset_Building
	.4byte gTileset_PokemonCenter
