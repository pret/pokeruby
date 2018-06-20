DesertRuins_MapBorder:: @ 82D7AEC
	.incbin "data/layouts/DesertRuins/border.bin"

DesertRuins_MapBlockdata:: @ 82D7AF4
	.incbin "data/layouts/DesertRuins/map.bin"

	.align 2
DesertRuins_Layout:: @ 82D7F58
	.4byte 0x11
	.4byte 0x21
	.4byte DesertRuins_MapBorder
	.4byte DesertRuins_MapBlockdata
	.4byte gTileset_General
	.4byte gTileset_Cave
