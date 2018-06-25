LittlerootTown_ProfessorBirchsLab_MapBorder:: @ 82CDD4C
	.incbin "data/layouts/LittlerootTown_ProfessorBirchsLab/border.bin"

LittlerootTown_ProfessorBirchsLab_MapBlockdata:: @ 82CDD54
	.incbin "data/layouts/LittlerootTown_ProfessorBirchsLab/map.bin"

	.align 2
LittlerootTown_ProfessorBirchsLab_Layout:: @ 82CDEA8
	.4byte 0xd
	.4byte 0xd
	.4byte LittlerootTown_ProfessorBirchsLab_MapBorder
	.4byte LittlerootTown_ProfessorBirchsLab_MapBlockdata
	.4byte gTileset_Building
	.4byte gTileset_Lab
