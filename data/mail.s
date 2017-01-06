	.include "asm/macros.inc"
	.include "constants/constants.inc"

	.section .rodata

	.align 1
gUnknown_083E562C:: @ 83E562C
	.2byte 0x6ACD, 0x51A5
	.2byte 0x45FC, 0x38D4

	.align 2
gMailGraphicsTable:: @ 83E5634
	.4byte gMailPalette_Orange
	.4byte gMailTiles_Orange
	.4byte gMailTilemap_Orange
	.2byte 0x2C0
	.2byte 0
	.2byte 0x294A
	.2byte 0x6739

	.4byte gMailPalette_Harbor
	.4byte gMailTiles_Harbor
	.4byte gMailTilemap_Harbor
	.2byte 0x2E0
	.2byte 0
	.2byte 0x7FFF
	.2byte 0x4631

	.4byte gMailPalette_Glitter
	.4byte gMailTiles_Glitter
	.4byte gMailTilemap_Glitter
	.2byte 0x400
	.2byte 0
	.2byte 0x294A
	.2byte 0x6739

	.4byte gMailPalette_Mech
	.4byte gMailTiles_Mech
	.4byte gMailTilemap_Mech
	.2byte 0x1E0
	.2byte 0
	.2byte 0x7FFF
	.2byte 0x4631

	.4byte gMailPalette_Wood
	.4byte gMailTiles_Wood
	.4byte gMailTilemap_Wood
	.2byte 0x2E0
	.2byte 0
	.2byte 0x7FFF
	.2byte 0x4631

	.4byte gMailPalette_Wave
	.4byte gMailTiles_Wave
	.4byte gMailTilemap_Wave
	.2byte 0x300
	.2byte 0
	.2byte 0x294A
	.2byte 0x6739

	.4byte gMailPalette_Bead
	.4byte gMailTiles_Bead
	.4byte gMailTilemap_Bead
	.2byte 0x140
	.2byte 0
	.2byte 0x7FFF
	.2byte 0x4631

	.4byte gMailPalette_Shadow
	.4byte gMailTiles_Shadow
	.4byte gMailTilemap_Shadow
	.2byte 0x300
	.2byte 0
	.2byte 0x7FFF
	.2byte 0x4631

	.4byte gMailPalette_Tropic
	.4byte gMailTiles_Tropic
	.4byte gMailTilemap_Tropic
	.2byte 0x220
	.2byte 0
	.2byte 0x294A
	.2byte 0x6739

	.4byte gMailPalette_Dream
	.4byte gMailTiles_Dream
	.4byte gMailTilemap_Dream
	.2byte 0x340
	.2byte 0
	.2byte 0x294A
	.2byte 0x6739

	.4byte gMailPalette_Fab
	.4byte gMailTiles_Fab
	.4byte gMailTilemap_Fab
	.2byte 0x2A0
	.2byte 0
	.2byte 0x294A
	.2byte 0x6739

	.4byte gMailPalette_Retro
	.4byte gMailTiles_Retro
	.4byte gMailTilemap_Retro
	.2byte 0x520
	.2byte 0
	.2byte 0x294A
	.2byte 0x6739

	.align 2
Unknown_3E5724: @ 83E5724
	.4byte 0xC
	.4byte 0xC
	.4byte 0xC

gUnknown_083E5730:: @ 83E5730
	.byte 3, 15, 27, 52
	.4byte Unknown_3E5724
	.byte 3, 15, 27, 52
	.4byte Unknown_3E5724
	.byte 3, 15, 27, 52
	.4byte Unknown_3E5724
	.byte 3, 15, 27, 52
	.4byte Unknown_3E5724
	.byte 3, 15, 27, 52
	.4byte Unknown_3E5724
	.byte 3, 15, 27, 52
	.4byte Unknown_3E5724
	.byte 3, 15, 27, 52
	.4byte Unknown_3E5724
	.byte 3, 15, 27, 52
	.4byte Unknown_3E5724
	.byte 3, 15, 27, 52
	.4byte Unknown_3E5724
	.byte 3, 15, 27, 52
	.4byte Unknown_3E5724
	.byte 3, 16, 27, 52
	.4byte Unknown_3E5724
	.byte 3, 15, 27, 52
	.4byte Unknown_3E5724

	.align 2
Unknown_3E5790: @ 83E5790
	.4byte 0x8
	.4byte 0x8
	.4byte 0x8
	.4byte 0x8
	.4byte 0x4

	.align 2
gUnknown_083E57A4:: @ 83E57A4
	.byte 5, 15, 15, 52
	.4byte Unknown_3E5790
	.byte 5, 15, 15, 52
	.4byte Unknown_3E5790
	.byte 5, 15, 16, 52
	.4byte Unknown_3E5790
	.byte 5, 15, 15, 52
	.4byte Unknown_3E5790
	.byte 5, 15, 15, 52
	.4byte Unknown_3E5790
	.byte 5, 15, 16, 52
	.4byte Unknown_3E5790
	.byte 5, 15, 16, 52
	.4byte Unknown_3E5790
	.byte 5, 15, 15, 52
	.4byte Unknown_3E5790
	.byte 5, 15, 15, 52
	.4byte Unknown_3E5790
	.byte 5, 15, 15, 52
	.4byte Unknown_3E5790
	.byte 5, 16, 15, 52
	.4byte Unknown_3E5790
	.byte 5, 15, 15, 52
	.4byte Unknown_3E5790

	.align 2
	.incbin "baserom.gba", 0x3e5804, 0x4
