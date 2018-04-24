	.include "include/macros.inc"
	.include "constants/constants.inc"

	.section .rodata

	.align 2
gUnknown_083F865C:: @ 83F865C
	obj_pal gAreaUnknownPalette, 3

	.align 2
gUnknown_083F8664:: @ 83F8664
	obj_tiles gSharedMem + 0xFB4, 0x600, 3

	.align 2
gOamData_83F866C:: @ 83F866C
	.2byte 0x0000
	.2byte 0x8000
	.2byte 0x0400

	.align 2
gSpriteTemplate_83F8674:: @ 83F8674
	spr_template 3, 3, gOamData_83F866C, gDummySpriteAnimTable, NULL, gDummySpriteAffineAnimTable, SpriteCallbackDummy
