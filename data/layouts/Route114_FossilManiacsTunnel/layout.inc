Route114_FossilManiacsTunnel_MapBorder:: @ 82D4EE4
	.incbin "data/layouts/Route114_FossilManiacsTunnel/border.bin"

Route114_FossilManiacsTunnel_MapBlockdata:: @ 82D4EEC
	.incbin "data/layouts/Route114_FossilManiacsTunnel/map.bin"

	.align 2
Route114_FossilManiacsTunnel_Layout:: @ 82D5190
	.4byte 0xd
	.4byte 0x1a
	.4byte Route114_FossilManiacsTunnel_MapBorder
	.4byte Route114_FossilManiacsTunnel_MapBlockdata
	.4byte gTileset_General
	.4byte gTileset_Fallarbor
