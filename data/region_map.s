	.include "asm/macros.inc"
	.include "constants/constants.inc"

	.section .rodata

@ 83E6FF4
@	.include "data/region_map_locations.inc"

gUnknown_083E7684:: @ 83E7684
	.2byte 50, 39
	.2byte 51, 41
	.2byte 52, 42
	.2byte 53, 43
	.2byte 54, 14
	.2byte 69, 43
	.2byte 66, 12
	.2byte 79, 49
	.2byte 59, 19
	.2byte 76, 27
	.2byte 65, 37
	.2byte 85, 46
	.2byte 88, 88

	.align 2
gOamData_83E76B8:: @ 83E76B8
	.2byte 0x0000
	.2byte 0x4000
	.2byte 0x0400

	.align 2
gSpriteAnim_83E76C0:: @ 83E76C0
	obj_image_anim_frame 0, 20
	obj_image_anim_frame 4, 20
	obj_image_anim_jump 0

	.align 2
gSpriteAnim_83E76CC:: @ 83E76CC
	obj_image_anim_frame 0, 10
	obj_image_anim_frame 16, 10
	obj_image_anim_frame 32, 10
	obj_image_anim_frame 16, 10
	obj_image_anim_jump 0

	.align 2
gSpriteAnimTable_83E76E0:: @ 83E76E0
	.4byte gSpriteAnim_83E76C0
	.4byte gSpriteAnim_83E76CC

	.align 2
gUnknown_083E76E8:: @ 83E76E8
	obj_pal gPokenavCursor_Pal, 0x0000

	.align 2
gSpriteTemplate_83E76F0:: @ 83E76F0
	spr_template 0, 0, gOamData_83E76B8, gSpriteAnimTable_83E76E0, NULL, gDummySpriteAffineAnimTable, sub_80FBAF0

	.align 2
gOamData_083E7708:: @ 83E7708
	.2byte 0x0000
	.2byte 0x4000
	.2byte 0x0800

	.align 2
gSpriteAnim_83E7710: @ 83E7710
	obj_image_anim_frame 0, 5
	obj_image_anim_end

gSpriteAnimTable_083E7718:: @ 83E7718 ANIMCMD
	.4byte gSpriteAnim_83E7710

gUnknown_083E771C:: @ 83E771C
	.incbin "graphics/pokenav/map_frame.gbapal"

gUnknown_083E773C:: @ 83E773C
	.incbin "graphics/pokenav/map_frame.4bpp.lz"

gUnknown_083E7774:: @ 83E7774
	.incbin "graphics/pokenav/map_frame.bin.lz"

	.align 2
gPokenavMapMisc_Pal::
	.incbin "graphics/pokenav/map_misc.gbapal"

gUnknown_083E784C:: @ 83E784C
	.incbin "graphics/pokenav/map_misc.4bpp.lz"

gUnknown_083E7920:: @ 83E7920
	.byte  0,  9,  1
	.byte  0, 10, 14
	.byte  0, 11, 15
	.byte  0, 12, 16
	.byte  0, 13, 17
	.byte  0, 14, 18
	.byte  0, 15, 19
	.byte  0,  0,  3
	.byte  0,  1,  4
	.byte  0,  2,  5
	.byte  0,  3,  6
	.byte  0,  4,  7
	.byte  0,  5,  8
	.byte  0,  6,  9
	.byte  0,  7, 10
	.byte  0,  8, 11
	.byte  0, 16,  0
	.byte  0, 17,  0
	.byte  0, 18,  0
	.byte  0, 19,  0
	.byte  0, 20,  0
	.byte  0, 21,  0
	.byte  0, 22,  0
	.byte  0, 23,  0
	.byte  0, 24,  0
	.byte  0, 25,  0
	.byte  0, 26,  0
	.byte  0, 27,  0
	.byte  0, 28,  0
	.byte  0, 29,  0
	.byte  0, 30,  0
	.byte  0, 31,  0
	.byte  0, 32,  0
	.byte  0, 33,  0
	.byte  0, 34,  0
	.byte  0, 35,  0
	.byte  0, 36,  0
	.byte  0, 37,  0
	.byte  0, 38,  0
	.byte  0, 39,  0
	.byte  0, 40,  0
	.byte  0, 41,  0
	.byte  0, 42,  0
	.byte  0, 43,  0
	.byte  0, 44,  0
	.byte  0, 45,  0
	.byte  0, 46,  0
	.byte  0, 47,  0
	.byte  0, 48,  0
	.byte  0, 49,  0

	.align 2
Unknown_3E79B8: @ 83E79B8
	.4byte OtherText_PokeLeague
	.4byte OtherText_PokeCenter

	.align 2
gUnknown_083E79C0:: @ 83E79C0
	.4byte Unknown_3E79B8
	.2byte 0xF
	.2byte 0x854

@ XXX: what is this?
	.align 2
	.4byte 0x2000000

	.align 2
gUnknown_083E79CC:: @ 83E79CC
	obj_pal gPokenavMapMisc_Pal, 0x0002

	.align 2
gUnknown_083E79D4:: @ 83E79D4
	.2byte 2120,  58
	.2byte 65535, 88

	.align 2
gOamData_83E79DC:: @ 83E79DC
	.2byte 0x0000
	.2byte 0x0000
	.2byte 0x0800

	.align 2
gSpriteAnim_83E79E4:: @ 83E79E4
	obj_image_anim_frame 0, 5
	obj_image_anim_end

	.align 2
gSpriteAnim_83E79EC:: @ 83E79EC
	obj_image_anim_frame 1, 5
	obj_image_anim_end

	.align 2
gSpriteAnim_83E79F4:: @ 83E79F4
	obj_image_anim_frame 3, 5
	obj_image_anim_end

	.align 2
gSpriteAnim_83E79FC:: @ 83E79FC
	obj_image_anim_frame 5, 5
	obj_image_anim_end

	.align 2
gSpriteAnim_83E7A04:: @ 83E7A04
	obj_image_anim_frame 6, 5
	obj_image_anim_end

	.align 2
gSpriteAnim_83E7A0C:: @ 83E7A0C
	obj_image_anim_frame 8, 5
	obj_image_anim_end

	.align 2
gSpriteAnim_83E7A14:: @ 83E7A14
	obj_image_anim_frame 10, 5
	obj_image_anim_end

	.align 2
gSpriteAnimTable_83E7A1C:: @ 83E7A1C
	.4byte gSpriteAnim_83E79E4
	.4byte gSpriteAnim_83E79EC
	.4byte gSpriteAnim_83E79F4
	.4byte gSpriteAnim_83E79FC
	.4byte gSpriteAnim_83E7A04
	.4byte gSpriteAnim_83E7A0C
	.4byte gSpriteAnim_83E7A14

	.align 2
gSpriteTemplate_83E7A38:: @ 83E7A38
	spr_template 2, 2, gOamData_83E79DC, gSpriteAnimTable_83E7A1C, NULL, gDummySpriteAffineAnimTable, SpriteCallbackDummy
