	.include "asm/macros.inc"
	.include "constants/constants.inc"

	.section .rodata

	.align 2
gUnknown_083B5EBC:: @ 83B5EBC
	.4byte sub_8093864
	.4byte sub_80938A8
	.4byte sub_80938CC
	.4byte sub_8093918
	.4byte sub_8093938
	.4byte sub_8093954
	.4byte sub_8093980

	.align 2
gUnknown_083B5ED8:: @ 83B5ED8
	.4byte sub_8093AA0
	.4byte sub_8093AF0
	.4byte sub_8093C0C
	.4byte sub_8093C38
	.4byte sub_8093D50

	.align 2
gUnknown_083B5EEC:: @ 83B5EEC
	.4byte gUnknown_08E8CAC0
	.4byte gUnknown_08E8D4C0

gUnknown_083B5EF4:: @ 83B5EF4
	.string " : $"

	.align 2
gUnknown_083B5EF8:: @ 83B5EF8
	.4byte gMenuTrainerCard0Star_Pal
	.4byte gMenuTrainerCard1Star_Pal
	.4byte gMenuTrainerCard2Star_Pal
	.4byte gMenuTrainerCard3Star_Pal
	.4byte gMenuTrainerCard4Star_Pal

gUnknown_083B5F0C:: @ 83B5F0C
	.incbin "graphics/trainer_card/83B5F0C.gbapal"

	.align 2
gBadgesPalette:: @ 83B5F2C
	.incbin "graphics/trainer_card/badges.gbapal"

gUnknown_083B5F4C:: @ 83B5F4C
	.incbin "graphics/trainer_card/83B5F4C.gbapal"

gUnknown_083B5F6C:: @ 83B5F6C
	.incbin "graphics/trainer_card/83B5F6C.gbapal"

gUnknown_083B5F8C:: @ 83B5F8C
	.incbin "graphics/trainer_card/83B5F8C_map.bin"
