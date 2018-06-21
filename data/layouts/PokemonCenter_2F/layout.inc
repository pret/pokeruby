PokemonCenter_2F_MapBorder:: @ 82CE180
	.incbin "data/layouts/PokemonCenter_2F/border.bin"

PokemonCenter_2F_MapBlockdata:: @ 82CE188
	.incbin "data/layouts/PokemonCenter_2F/map.bin"

	.align 2
PokemonCenter_2F_Layout:: @ 82CE284
	.4byte 0xe
	.4byte 0x9
	.4byte PokemonCenter_2F_MapBorder
	.4byte PokemonCenter_2F_MapBlockdata
	.4byte gTileset_Building
	.4byte gTileset_PokemonCenter
