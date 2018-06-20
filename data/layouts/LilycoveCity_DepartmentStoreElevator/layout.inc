LilycoveCity_DepartmentStoreElevator_MapBorder:: @ 82F2EC8
	.incbin "data/layouts/LilycoveCity_DepartmentStoreElevator/border.bin"

LilycoveCity_DepartmentStoreElevator_MapBlockdata:: @ 82F2ED0
	.incbin "data/layouts/LilycoveCity_DepartmentStoreElevator/map.bin"

	.align 2
LilycoveCity_DepartmentStoreElevator_Layout:: @ 82F2F00
	.4byte 0x4
	.4byte 0x6
	.4byte LilycoveCity_DepartmentStoreElevator_MapBorder
	.4byte LilycoveCity_DepartmentStoreElevator_MapBlockdata
	.4byte gTileset_Building
	.4byte gTileset_BattleTower
