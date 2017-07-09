	.include "asm/macros.inc"
	.include "constants/constants.inc"

	.section .rodata

gUnknown_083C16B8:: @ 83C16B8
	.byte 7, 9, 8, 2

	.align 2
gUnknown_083C16BC:: @ 83C16BC
	.4byte sub_80A59D0
	.4byte sub_80A599C
	.4byte sub_80A7024
	.4byte sub_80A70D8
	.4byte sub_80A6214
	.4byte sub_80A61EC
	.4byte sub_80A6354
	.4byte sub_80A631C
	.4byte sub_80A6918
	.4byte sub_80A68F0
	.4byte sub_80A59D0
	.4byte sub_80A69B8
	.4byte sub_80A6C6C
	.4byte sub_80A6A4C

	.align 2
gUnknown_083C16F4:: @ 83C16F4
	.4byte sub_80A5E60
	.4byte sub_80A5E90

	.align 2
gUnknown_083C16FC:: @ 83C16FC
	.4byte sub_80A65AC
	.4byte sub_80A6618

	.align 1
gUnknown_083C1704:: @ 83C1704
	.2byte 0x41EE, 0x7FFF

gUnknown_083C1708:: @ 83C1708
	.byte 4, 5

gUnknown_083C170A:: @ 83C170A
	.byte 5, 0

	.align 2
gPalette_83C170C:: @ 83C170C
	.incbin "graphics/unknown/83C170C.gbapal"

	.align 2
gSpriteImage_83C172C:: @ 83C172C
	.incbin "graphics/unknown_sprites/83C172C.4bpp"

	.align 2
	.incbin "graphics/unused/cherry.4bpp"

	.align 2
	.incbin "graphics/unused/cherry.gbapal"

	.align 2
gOamData_83C1C4C:: @ 83C1C4C
	.2byte 0x0000
	.2byte 0xC000
	.2byte 0x7800

	.align 2
gSpriteAnim_83C1C54:: @ 83C1C54
	obj_image_anim_frame 0, 4
	obj_image_anim_end

	.align 2
gSpriteAnim_83C1C5C:: @ 83C1C5C
	obj_image_anim_frame 64, 4
	obj_image_anim_end

	.align 2
gSpriteAnim_83C1C64:: @ 83C1C64
	obj_image_anim_frame 128, 4
	obj_image_anim_end

	.align 2
gSpriteAnim_83C1C6C:: @ 83C1C6C
	obj_image_anim_frame 192, 4
	obj_image_anim_end

	.align 2
gSpriteAnim_83C1C74:: @ 83C1C74
	obj_image_anim_frame 256, 4
	obj_image_anim_end

	.align 2
gSpriteAnim_83C1C7C:: @ 83C1C7C
	obj_image_anim_frame 320, 4
	obj_image_anim_end

	.align 2
gSpriteAnimTable_83C1C84:: @ 83C1C84
	.4byte gSpriteAnim_83C1C54
	.4byte gSpriteAnim_83C1C5C
	.4byte gSpriteAnim_83C1C6C
	.4byte gSpriteAnim_83C1C74
	.4byte gSpriteAnim_83C1C7C
	.4byte gSpriteAnim_83C1C64

	.align 2
gSpriteAffineAnim_83C1C9C:: @ 83C1C9C
	obj_rot_scal_anim_frame 0x0, 0x0, -2, 2
	obj_rot_scal_anim_frame 0x0, 0x0, 2, 4
	obj_rot_scal_anim_frame 0x0, 0x0, -2, 4
	obj_rot_scal_anim_frame 0x0, 0x0, 2, 2
	obj_rot_scal_anim_end

	.align 2
gSpriteAffineAnimTable_83C1CC4:: @ 83C1CC4
	.4byte gSpriteAffineAnim_83C1C9C

	.align 2
gUnknown_083C1CC8:: @ 83C1CC8
	obj_tiles gBagMaleTiles, 0x3000, 30000

	.align 2
gUnknown_083C1CD0:: @ 83C1CD0
	obj_tiles gBagFemaleTiles, 0x3000, 30000

	.align 2
gUnknown_083C1CD8:: @ 83C1CD8
	obj_pal gBagPalette, 30000

	.align 2
gSpriteTemplate_83C1CE0:: @ 83C1CE0
	spr_template 30000, 30000, gOamData_83C1C4C, gSpriteAnimTable_83C1C84, NULL, gSpriteAffineAnimTable_83C1CC4, sub_80A7998

	.align 2
gOamData_83C1CF8:: @ 83C1CF8
	.2byte 0x0000
	.2byte 0x4800
	.2byte 0x8800

	.align 2
gSpriteAffineAnim_83C1D00:: @ 83C1D00
	obj_rot_scal_anim_frame 0x0, 0x0, 8, 32
	obj_rot_scal_anim_end

	.align 2
gSpriteAffineAnim_83C1D10:: @ 83C1D10
	obj_rot_scal_anim_frame 0x0, 0x0, -8, 32
	obj_rot_scal_anim_end

	.align 2
gSpriteAffineAnimTable_83C1D20:: @ 83C1D20
	.4byte gSpriteAffineAnim_83C1D00
	.4byte gSpriteAffineAnim_83C1D10

	.align 2
gSpriteImageTable_83C1D28:: @ 83C1D28
	obj_frame_tiles gSpriteImage_83C172C, 0x80

	.align 2
gUnknown_083C1D30:: @ 83C1D30
	obj_pal gPalette_83C170C, 8

	.align 2
gSpriteTemplate_83C1D38:: @ 83C1D38
	spr_template 0xFFFF, 8, gOamData_83C1CF8, gSpriteAnimTable_83C1C84, gSpriteImageTable_83C1D28, gSpriteAffineAnimTable_83C1D20, sub_80A7B28

	.align 2
gOamData_83C1D50:: @ 83C1D50
	.2byte 0x0000
	.2byte 0xC000
	.2byte 0x7400

	.align 2
gOamData_83C1D58:: @ 83C1D58
	.2byte 0x0300
	.2byte 0xC000
	.2byte 0x7000

	.align 2
gSpriteAnim_83C1D60:: @ 83C1D60
	obj_image_anim_frame 0, 0
	obj_image_anim_end

	.align 2
gSpriteAnimTable_83C1D68:: @ 83C1D68
	.4byte gSpriteAnim_83C1D60

	.align 2
gSpriteImageTable_83C1D6C:: @ 83C1D6C
	obj_frame_tiles 0x02000000, 0x800

	.align 2
gSpriteTemplate_83C1D74:: @ 83C1D74
	spr_template 0xFFFF, 30020, gOamData_83C1D50, gSpriteAnimTable_83C1D68, gSpriteImageTable_83C1D6C, gDummySpriteAffineAnimTable, sub_80A7DC4

	.align 2
gSpriteAffineAnim_83C1D8C:: @ 83C1D8C
	obj_rot_scal_anim_frame 0xFFFF, 0xFFFF, -3, 96
	obj_rot_scal_anim_frame 0x0, 0x0, 0, 16
	obj_rot_scal_anim_frame 0xFFFE, 0xFFFE, -1, 64
	obj_rot_scal_anim_frame 0xFFF8, 0x0, 0, 16
	obj_rot_scal_anim_frame 0x0, 0xFFF8, 0, 16
	obj_rot_scal_anim_frame 0x100, 0x100, 0, 0
	obj_rot_scal_anim_jump 0

	.align 2
gSpriteAffineAnim_83C1DC4:: @ 83C1DC4
	obj_rot_scal_anim_frame 0xFFFF, 0xFFFF, 3, 96
	obj_rot_scal_anim_frame 0x0, 0x0, 0, 16
	obj_rot_scal_anim_frame 0xFFFE, 0xFFFE, 1, 64
	obj_rot_scal_anim_frame 0xFFF8, 0x0, 0, 16
	obj_rot_scal_anim_frame 0x0, 0xFFF8, 0, 16
	obj_rot_scal_anim_frame 0x100, 0x100, 0, 0
	obj_rot_scal_anim_jump 0

	.align 2
gSpriteAffineAnimTable_83C1DFC:: @ 83C1DFC
	.4byte gSpriteAffineAnim_83C1D8C
	.4byte gSpriteAffineAnim_83C1DC4

	.align 2
gSpriteTemplate_83C1E04:: @ 83C1E04
	spr_template 0xFFFF, 30020, gOamData_83C1D58, gSpriteAnimTable_83C1D68, gSpriteImageTable_83C1D6C, gSpriteAffineAnimTable_83C1DFC, SpriteCallbackDummy

@ 83C1E1C
	.include "data/graphics/berries/graphics_table.inc"

	.align 2
gUnknown_083C1F74:: @ 83C1F74
	obj_tiles gBerryCheckCircle_Gfx, 2048, 0x2710

	.align 2
gUnknown_083C1F7C:: @ 83C1F7C
	obj_pal gBerryCheck_Pal, 0x2710

	.align 2
gOamData_83C1F84:: @ 83C1F84
	.2byte 0x0000
	.2byte 0x8000
	.2byte 0x0400

	.align 2
gSpriteAnim_83C1F8C:: @ 83C1F8C
	obj_image_anim_frame 0, 0
	obj_image_anim_end

	.align 2
gSpriteAnimTable_83C1F94:: @ 83C1F94
	.4byte gSpriteAnim_83C1F8C

	.align 2
gSpriteTemplate_83C1F98:: @ 83C1F98
	spr_template 10000, 10000, gOamData_83C1F84, gSpriteAnimTable_83C1F94, NULL, gDummySpriteAffineAnimTable, sub_80A7DC4
