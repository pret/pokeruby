LilycoveCity_DepartmentStoreRooftop_MapBorder:: @ 82F0278
	.incbin "data/layouts/LilycoveCity_DepartmentStoreRooftop/border.bin"

LilycoveCity_DepartmentStoreRooftop_MapBlockdata:: @ 82F0280
	.incbin "data/layouts/LilycoveCity_DepartmentStoreRooftop/map.bin"

	.align 2
LilycoveCity_DepartmentStoreRooftop_Layout:: @ 82F0430
	.4byte 0x12
	.4byte 0xc
	.4byte LilycoveCity_DepartmentStoreRooftop_MapBorder
	.4byte LilycoveCity_DepartmentStoreRooftop_MapBlockdata
	.4byte gTileset_Building
	.4byte gTileset_Shop
