LilycoveCity_PokemonTrainerFanClub_MapBorder:: @ 82D352C
	.incbin "data/layouts/LilycoveCity_PokemonTrainerFanClub/border.bin"

LilycoveCity_PokemonTrainerFanClub_MapBlockdata:: @ 82D3534
	.incbin "data/layouts/LilycoveCity_PokemonTrainerFanClub/map.bin"

	.align 2
LilycoveCity_PokemonTrainerFanClub_Layout:: @ 82D3684
	.4byte 0xc
	.4byte 0xe
	.4byte LilycoveCity_PokemonTrainerFanClub_MapBorder
	.4byte LilycoveCity_PokemonTrainerFanClub_MapBlockdata
	.4byte gTileset_Building
	.4byte gTileset_GenericBuilding
