LilycoveCity_DepartmentStore_5F_MapBorder:: @ 82F0138
	.incbin "data/layouts/LilycoveCity_DepartmentStore_5F/border.bin"

LilycoveCity_DepartmentStore_5F_MapBlockdata:: @ 82F0140
	.incbin "data/layouts/LilycoveCity_DepartmentStore_5F/map.bin"

	.align 2
LilycoveCity_DepartmentStore_5F_Layout:: @ 82F0260
	.4byte 0x12
	.4byte 0x8
	.4byte LilycoveCity_DepartmentStore_5F_MapBorder
	.4byte LilycoveCity_DepartmentStore_5F_MapBlockdata
	.4byte gTileset_Building
	.4byte gTileset_Shop
