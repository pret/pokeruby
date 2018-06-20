RusturfTunnel_MapBorder:: @ 82D725C
	.incbin "data/layouts/RusturfTunnel/border.bin"

RusturfTunnel_MapBlockdata:: @ 82D7264
	.incbin "data/layouts/RusturfTunnel/map.bin"

	.align 2
RusturfTunnel_Layout:: @ 82D7924
	.4byte 0x24
	.4byte 0x18
	.4byte RusturfTunnel_MapBorder
	.4byte RusturfTunnel_MapBlockdata
	.4byte gTileset_General
	.4byte gTileset_RusturfTunnel
