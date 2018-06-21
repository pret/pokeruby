LavaridgeTown_PokemonCenter_1F_MapBorder:: @ 82CEF94
	.incbin "data/layouts/LavaridgeTown_PokemonCenter_1F/border.bin"

LavaridgeTown_PokemonCenter_1F_MapBlockdata:: @ 82CEF9C
	.incbin "data/layouts/LavaridgeTown_PokemonCenter_1F/map.bin"

	.align 2
LavaridgeTown_PokemonCenter_1F_Layout:: @ 82CF098
	.4byte 0xe
	.4byte 0x9
	.4byte LavaridgeTown_PokemonCenter_1F_MapBorder
	.4byte LavaridgeTown_PokemonCenter_1F_MapBlockdata
	.4byte gTileset_Building
	.4byte gTileset_PokemonCenter
