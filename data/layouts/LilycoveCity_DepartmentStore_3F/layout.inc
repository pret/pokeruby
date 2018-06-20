LilycoveCity_DepartmentStore_3F_MapBorder:: @ 82EFEB8
	.incbin "data/layouts/LilycoveCity_DepartmentStore_3F/border.bin"

LilycoveCity_DepartmentStore_3F_MapBlockdata:: @ 82EFEC0
	.incbin "data/layouts/LilycoveCity_DepartmentStore_3F/map.bin"

	.align 2
LilycoveCity_DepartmentStore_3F_Layout:: @ 82EFFE0
	.4byte 0x12
	.4byte 0x8
	.4byte LilycoveCity_DepartmentStore_3F_MapBorder
	.4byte LilycoveCity_DepartmentStore_3F_MapBlockdata
	.4byte gTileset_Building
	.4byte gTileset_Shop
