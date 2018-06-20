SlateportCity_SternsShipyard_2F_MapBorder:: @ 82D03AC
	.incbin "data/layouts/SlateportCity_SternsShipyard_2F/border.bin"

SlateportCity_SternsShipyard_2F_MapBlockdata:: @ 82D03B4
	.incbin "data/layouts/SlateportCity_SternsShipyard_2F/map.bin"

	.align 2
SlateportCity_SternsShipyard_2F_Layout:: @ 82D05B4
	.4byte 0x11
	.4byte 0xf
	.4byte SlateportCity_SternsShipyard_2F_MapBorder
	.4byte SlateportCity_SternsShipyard_2F_MapBlockdata
	.4byte gTileset_General
	.4byte gTileset_Facility
