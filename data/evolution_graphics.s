	.include "asm/macros.inc"
	.include "constants/constants.inc"

	.section .rodata

	.align 2
gEvoSparklePalette: @ 8416E44
	.incbin "graphics/misc/evo_sparkle.gbapal"

	.align 2
gEvoSparkleTiles: @ 8416E64
	.incbin "graphics/misc/evo_sparkle.4bpp.lz"

gUnknown_08416E84:: @ 8416E84
	obj_tiles gEvoSparkleTiles, 0x20, 1001
	.space 8

gUnknown_08416E94:: @ 8416E94
	obj_pal gEvoSparklePalette, 1001
	.space 8

	.align 2
gOamData_8416EA4:: @ 8416EA4
	.2byte 0x00A0
	.2byte 0x0000
	.2byte 0x0400

	.align 2
gSpriteAnim_8416EAC:: @ 8416EAC
	obj_image_anim_frame 0, 8
	obj_image_anim_end

	.align 2
gSpriteAnimTable_8416EB4:: @ 8416EB4
	.4byte gSpriteAnim_8416EAC

	.align 2
gSpriteTemplate_8416EB8:: @ 8416EB8
	spr_template 1001, 1001, gOamData_8416EA4, gSpriteAnimTable_8416EB4, NULL, gDummySpriteAffineAnimTable, nullsub_84

gUnknown_08416ED0:: @ 8416ED0
	.incbin "baserom.gba", 0x00416ed0, 0x38
