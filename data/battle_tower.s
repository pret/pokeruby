	.include "asm/macros.inc"
	.include "constants/constants.inc"

	.section .rodata

@ 8402F00
	.include "data/battle_tower/trainers.inc"

@ 8403860
	.include "data/battle_tower/held_items.inc"

@ 84038E0
	.include "data/battle_tower/level_50_mons.inc"

@ 8404BA0
	.include "data/battle_tower/level_100_mons.inc"

gUnknown_08405E60:: @ 8405E60
	.incbin "baserom.gba", 0x00405e60, 0x1e

gUnknown_08405E7E:: @ 8405E7E
	.incbin "baserom.gba", 0x00405e7e, 0x14

gUnknown_08405E92:: @ 8405E92
	.incbin "baserom.gba", 0x00405e92, 0x1e

gUnknown_08405EB0:: @ 8405EB0
	.incbin "baserom.gba", 0x00405eb0, 0x14

	.align 1
gBattleTowerBanlist:: @ 8405EC4
	.2byte SPECIES_MEW
	.2byte SPECIES_MEWTWO
	.2byte SPECIES_HO_OH
	.2byte SPECIES_LUGIA
	.2byte SPECIES_CELEBI
	.2byte SPECIES_KYOGRE
	.2byte SPECIES_GROUDON
	.2byte SPECIES_RAYQUAZA
	.2byte SPECIES_JIRACHI
	.2byte SPECIES_DEOXYS
	.2byte -1

gUnknown_08405EDA:: @ 8405EDA
	.incbin "baserom.gba", 0x00405eda, 0xc

gUnknown_08405EE6:: @ 8405EE6
	.incbin "baserom.gba", 0x00405ee6, 0x12
