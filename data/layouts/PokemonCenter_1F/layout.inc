PokemonCenter_1F_MapBorder:: @ 82CE064
	.incbin "data/layouts/PokemonCenter_1F/border.bin"

PokemonCenter_1F_MapBlockdata:: @ 82CE06C
	.incbin "data/layouts/PokemonCenter_1F/map.bin"

	.align 2
PokemonCenter_1F_Layout:: @ 82CE168
	.4byte 0xe
	.4byte 0x9
	.4byte PokemonCenter_1F_MapBorder
	.4byte PokemonCenter_1F_MapBlockdata
	.4byte gTileset_Building
	.4byte gTileset_PokemonCenter
