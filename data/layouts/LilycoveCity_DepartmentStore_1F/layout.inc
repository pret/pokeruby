LilycoveCity_DepartmentStore_1F_MapBorder:: @ 82EFC38
	.incbin "data/layouts/LilycoveCity_DepartmentStore_1F/border.bin"

LilycoveCity_DepartmentStore_1F_MapBlockdata:: @ 82EFC40
	.incbin "data/layouts/LilycoveCity_DepartmentStore_1F/map.bin"

	.align 2
LilycoveCity_DepartmentStore_1F_Layout:: @ 82EFD60
	.4byte 0x12
	.4byte 0x8
	.4byte LilycoveCity_DepartmentStore_1F_MapBorder
	.4byte LilycoveCity_DepartmentStore_1F_MapBlockdata
	.4byte gTileset_Building
	.4byte gTileset_Shop
