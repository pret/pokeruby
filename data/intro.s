	.include "asm/macros.inc"
	.include "constants/constants.inc"

	.section .rodata

	.align 2
gSpriteAnim_840B114:: @ 840B114
	obj_image_anim_frame 6, 8
	obj_image_anim_frame 6, 8, OBJ_IMAGE_ANIM_H_FLIP
	obj_image_anim_jump 0

	.align 2
gSpriteAnimTable_840B120:: @ 840B120
	.4byte gSpriteAnim_840B114

	.align 2
gSpriteTemplate_840B124:: @ 840B124
	spr_template 2003, 2004, gOamData_840B10C, gSpriteAnimTable_840B120, NULL, gDummySpriteAffineAnimTable, sub_813E804

	.align 2
gOamData_840B13C:: @ 840B13C
	.2byte 0x00A0
	.2byte 0x4000
	.2byte 0x0400

	.align 2
gSpriteAnim_840B144:: @ 840B144
	obj_image_anim_frame 10, 8
	obj_image_anim_end

	.align 2
gSpriteAnimTable_840B14C:: @ 840B14C
	.4byte gSpriteAnim_840B144

	.align 2
gSpriteTemplate_840B150:: @ 840B150
	spr_template 2003, 2004, gOamData_840B13C, gSpriteAnimTable_840B14C, NULL, gDummySpriteAffineAnimTable, sub_813E980

gUnknown_0840B168:: @ 840B168
	.incbin "baserom.gba", 0x0040b168, 0x8

	.align 2
gSpriteTemplate_840B170:: @ 840B170
	spr_template 2003, 2004, gOamData_840B13C, gSpriteAnimTable_840B14C, NULL, gDummySpriteAffineAnimTable, sub_813EA60

gUnknown_0840B188:: @ 840B188
	.incbin "baserom.gba", 0x0040b188, 0x14

	.align 2
gOamData_840B19C:: @ 840B19C
	.2byte 0x00A0
	.2byte 0x4000
	.2byte 0x0400

	.align 2
gSpriteAnim_840B1A4:: @ 840B1A4
	obj_image_anim_frame 2, 8
	obj_image_anim_end

	.align 2
gSpriteAnimTable_840B1AC:: @ 840B1AC
	.4byte gSpriteAnim_840B1A4

	.align 2
gSpriteTemplate_840B1B0:: @ 840B1B0
	spr_template 2003, 2004, gOamData_840B19C, gSpriteAnimTable_840B1AC, NULL, gDummySpriteAffineAnimTable, sub_813EBBC

	.align 2
gSpriteTemplate_840B1C8:: @ 840B1C8
	spr_template 2003, 2004, gOamData_840B19C, gSpriteAnimTable_840B1AC, NULL, gDummySpriteAffineAnimTable, sub_813EC90

	.align 2
gOamData_840B1E0:: @ 840B1E0
	.2byte 0x00A0
	.2byte 0xC000
	.2byte 0x0400

	.align 2
gSpriteAnim_840B1E8:: @ 840B1E8
	obj_image_anim_frame 16, 8
	obj_image_anim_end

	.align 2
gSpriteAnimTable_840B1F0:: @ 840B1F0
	.4byte gSpriteAnim_840B1E8

	.align 2
gSpriteTemplate_840B1F4:: @ 840B1F4
	spr_template 2003, 2003, gOamData_840B1E0, gSpriteAnimTable_840B1F0, NULL, gDummySpriteAffineAnimTable, sub_813EDFC

	.align 2
gIntro3PokeballGfx_Table:: @ 840B20C
	obj_tiles gInterfaceGfx_PokeBall, 0x100, 2002
	.space 8

	.align 2
gIntro3MiscGfx_Table:: @ 840B21C
	obj_tiles gIntro3MiscTiles, 0xa00, 2003
	.space 8

	.align 2
gInterfacePokeballPal_Table:: @ 840B22C
	obj_pal gInterfacePal_PokeBall, 2002
	.space 8

	.align 2
gIntro3MiscPal_Table:: @ 840B23C
	obj_pal gIntro3Misc1Palette, 2003
	obj_pal gIntro3Misc2Palette, 2004
	.space 8

	.incbin "baserom.gba", 0x0040b254, 0x4
