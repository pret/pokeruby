	.include "asm/macros.inc"
	.include "constants/constants.inc"

	.section .rodata

gUnknown_0840B7BC:: @ 840B7BC
	.incbin "baserom.gba", 0x0040b7bc, 0x40

gUnknown_0840B7FC:: @ 840B7FC
	.incbin "baserom.gba", 0x0040b7fc, 0x40

gUnknown_0840B83C:: @ 840B83C
	.incbin "baserom.gba", 0x0040b83c, 0xf

gUnknown_0840B84B:: @ 840B84B
	.incbin "baserom.gba", 0x0040b84b, 0xf

gUnknown_0840B85A:: @ 840B85A
	.incbin "baserom.gba", 0x0040b85a, 0xf

gUnknown_0840B869:: @ 840B869
	.incbin "baserom.gba", 0x0040b869, 0xf

gUnknown_0840B878::
	.incbin "baserom.gba", 0x0040B878, 0xf

	.include "data/text/credits.inc"

gUnknown_0840CA00:: @ 840CA00
	.incbin "baserom.gba", 0x0040ca00, 0x8

Unknown_840CA08:
	.incbin "baserom.gba", 0x0040ca08, 0x14
Unknown_840CA1C:
	.incbin "baserom.gba", 0x0040ca1c, 0x14
Unknown_840CA30:
	.incbin "baserom.gba", 0x0040ca30, 0x10
Unknown_840CA40:
	.incbin "baserom.gba", 0x0040ca40, 0x14

	.align 2
gUnknown_0840CA54:: @ 840CA54
	.4byte Unknown_840CA08
	.4byte Unknown_840CA1C
	.4byte Unknown_840CA30
	.4byte Unknown_840CA40

Unknown_840CA64:
	.incbin "baserom.gba", 0x0040ca64, 0x14
Unknown_840CA78:
	.incbin "baserom.gba", 0x0040ca78, 0x14
Unknown_840CA8C:
	.incbin "baserom.gba", 0x0040ca8c, 0x8

	.align 2
gUnknown_0840CA94:: @ 840CA94
	.4byte Unknown_840CA64
	.4byte Unknown_840CA78
	.4byte Unknown_840CA8C

gUnknown_0840CAA0:: @ 840CAA0
	.incbin "baserom.gba", 0x0040caa0, 0x10

gUnknown_0840CAB0:: @ 840CAB0
	.incbin "baserom.gba", 0x0040cab0, 0x10

	.align 2
gOamData_840CAC0:: @ 840CAC0
	.2byte 0x00A0
	.2byte 0xC000
	.2byte 0x0400

	.align 2
gSpriteAnim_840CAC8:: @ 840CAC8
	obj_image_anim_frame 0, 8
	obj_image_anim_end

	.align 2
gSpriteAnim_840CAD0:: @ 840CAD0
	obj_image_anim_frame 64, 8
	obj_image_anim_end

	.align 2
gSpriteAnim_840CAD8:: @ 840CAD8
	obj_image_anim_frame 128, 8
	obj_image_anim_end

	.align 2
gSpriteAnimTable_840CAE0:: @ 840CAE0
	.4byte gSpriteAnim_840CAC8
	.4byte gSpriteAnim_840CAD0
	.4byte gSpriteAnim_840CAD8

	.align 2
gSpriteTemplate_840CAEC:: @ 840CAEC
	spr_template 1001, 1001, gOamData_840CAC0, gSpriteAnimTable_840CAE0, NULL, gDummySpriteAffineAnimTable, sub_814580C
