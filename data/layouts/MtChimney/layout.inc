MtChimney_MapBorder:: @ 82DA25C
	.incbin "data/layouts/MtChimney/border.bin"

MtChimney_MapBlockdata:: @ 82DA264
	.incbin "data/layouts/MtChimney/map.bin"

	.align 2
MtChimney_Layout:: @ 82DB114
	.4byte 0x28
	.4byte 0x2f
	.4byte MtChimney_MapBorder
	.4byte MtChimney_MapBlockdata
	.4byte gTileset_General
	.4byte gTileset_Lavaridge
