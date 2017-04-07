	.include "asm/macros.inc"
	.include "constants/constants.inc"

	.section .rodata

@ pointer to decorations, capacity
	.align 2
gDecorationInventories:: @ 8402E40
	.4byte gSaveBlock1 + 0x26A0, 10 @ DESK
	.4byte gSaveBlock1 + 0x26AA, 10 @ CHAIR
	.4byte gSaveBlock1 + 0x26B4, 10 @ PLANT
	.4byte gSaveBlock1 + 0x26BE, 30 @ ORNAMENT
	.4byte gSaveBlock1 + 0x26DC, 30 @ MAT
	.4byte gSaveBlock1 + 0x26FA, 10 @ POSTER
	.4byte gSaveBlock1 + 0x2704, 40 @ DOLL
	.4byte gSaveBlock1 + 0x272C, 10 @ CUSHION
