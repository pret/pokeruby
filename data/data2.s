@ the second big chunk of data

	.include "asm/macros.inc"
	.include "constants/constants.inc"

	.section .rodata

	.align 2
gUnknown_081E764C:: @ 81E764C
	.incbin "graphics/birch_speech/bg0.gbapal"
	.incbin "graphics/birch_speech/bg1.gbapal"

	.align 2
gUnknown_081E768C:: @ 81E768C
	.incbin "graphics/birch_speech/shadow.4bpp.lz"

	.align 2
gUnknown_081E7834:: @ 81E7834
	.incbin "graphics/birch_speech/map.bin.lz"

	.align 2
gUnknown_081E795C:: @ 81E795C
	.incbin "graphics/birch_speech/bg2.gbapal"

	.align 2
gUnknown_081E796C:: @ 81E796C
	.space 16

	.align 2
gMainMenuPalette:: @ 81E797C
	.incbin "graphics/misc/main_menu.gbapal"

	.align 2
gSpriteAffineAnim_81E799C:: @ 81E799C
	obj_rot_scal_anim_frame 0xFFFE, 0xFFFE, 0, 48
	obj_rot_scal_anim_end

	.align 2
gSpriteAffineAnimTable_81E79AC:: @ 81E79AC
	.4byte gSpriteAffineAnim_81E799C

	.align 2
gUnknown_081E79B0:: @ 81E79B0
	.4byte gBirchText_Boy, 0
	.4byte gBirchText_Girl, 0

	.align 2
gMalePresetNames:: @ 81E79C0
	.4byte gBirchText_NewName, 0
	.4byte gDefaultBoyName1, 0
	.4byte gDefaultBoyName2, 0
	.4byte gDefaultBoyName3, 0
	.4byte gDefaultBoyName4, 0

	.align 2
gFemalePresetNames:: @ 81E79E8
	.4byte gBirchText_NewName, 0
	.4byte gDefaultGirlName1, 0
	.4byte gDefaultGirlName2, 0
	.4byte gDefaultGirlName3, 0
	.4byte gDefaultGirlName4, 0

	.align 2
gSpriteImageTable_81E7A10:: @ 81E7A10
	obj_frame_tiles 0x2008000, 0x800
	obj_frame_tiles 0x2008800, 0x800
	obj_frame_tiles 0x2009000, 0x800
	obj_frame_tiles 0x2009800, 0x800

	.align 2
gSpriteImageTable_81E7A30:: @ 81E7A30
	obj_frame_tiles 0x200A000, 0x800
	obj_frame_tiles 0x200A800, 0x800
	obj_frame_tiles 0x200B000, 0x800
	obj_frame_tiles 0x200B800, 0x800

	.align 2
gSpriteImageTable_81E7A50:: @ 81E7A50
	obj_frame_tiles 0x200C000, 0x800
	obj_frame_tiles 0x200C800, 0x800
	obj_frame_tiles 0x200D000, 0x800
	obj_frame_tiles 0x200D800, 0x800

	.align 2
gSpriteImageTable_81E7A70:: @ 81E7A70
	obj_frame_tiles 0x200E000, 0x800
	obj_frame_tiles 0x200E800, 0x800
	obj_frame_tiles 0x200F000, 0x800
	obj_frame_tiles 0x200F800, 0x800

	.align 2
gSpriteAnim_81E7A90:: @ 81E7A90
	obj_image_anim_frame 0, 0
	obj_image_anim_end

	.align 2
gSpriteAnim_81E7A98:: @ 81E7A98
	obj_image_anim_frame 3, 0
	obj_image_anim_end

	.align 2
gSpriteAffineAnim_81E7AA0:: @ 81E7AA0
	obj_rot_scal_anim_frame 0x100, 0x100, 0, 0
	obj_rot_scal_anim_end

	.align 2
gSpriteAffineAnim_81E7AB0:: @ 81E7AB0
	obj_rot_scal_anim_frame 0xFF00, 0x100, 0, 0
	obj_rot_scal_anim_end

	.align 2
gSpriteAffineAnim_81E7AC0:: @ 81E7AC0
	obj_rot_scal_anim_frame 0x28, 0x28, 0, 0
	obj_rot_scal_anim_frame 0x12, 0x12, 0, 12
	obj_rot_scal_anim_end

	.align 2
gSpriteAffineAnim_81E7AD8:: @ 81E7AD8
	obj_rot_scal_anim_frame 0xFFFE, 0xFFFE, 0, 18
	obj_rot_scal_anim_frame 0xFFF0, 0xFFF0, 0, 15
	obj_rot_scal_anim_end

	.align 2
gSpriteAffineAnim_81E7AF0:: @ 81E7AF0
	obj_rot_scal_anim_frame 0xA0, 0x100, 0, 0
	obj_rot_scal_anim_frame 0x4, 0x0, 0, 8
	obj_rot_scal_anim_frame 0xFFFC, 0x0, 0, 8
	obj_rot_scal_anim_jump 1

	.align 2
gSpriteAffineAnim_81E7B10:: @ 81E7B10
	obj_rot_scal_anim_frame 0x2, 0x2, 0, 20
	obj_rot_scal_anim_end

	.align 2
gSpriteAffineAnim_81E7B20:: @ 81E7B20
	obj_rot_scal_anim_frame 0xFFFE, 0xFFFE, 0, 20
	obj_rot_scal_anim_end

	.align 2
gSpriteAffineAnim_81E7B30:: @ 81E7B30
	obj_rot_scal_anim_frame 0x100, 0x100, 0, 0
	obj_rot_scal_anim_frame 0xFFF0, 0xFFF0, 0, 9
	obj_rot_scal_anim_end

	.align 2
gSpriteAffineAnim_81E7B48:: @ 81E7B48
	obj_rot_scal_anim_frame 0x4, 0x4, 0, 63
	obj_rot_scal_anim_end

	.align 2
gSpriteAffineAnim_81E7B58:: @ 81E7B58
	obj_rot_scal_anim_frame 0x0, 0x0, -3, 5
	obj_rot_scal_anim_frame 0x0, 0x0, 3, 5
	obj_rot_scal_anim_end

	.align 2
gSpriteAffineAnimTable_81E7B70:: @ 81E7B70
	.4byte gSpriteAffineAnim_81E7AA0
	.4byte gSpriteAffineAnim_81E7AC0
	.4byte gSpriteAffineAnim_81E7AD8
	.4byte gSpriteAffineAnim_81E7AF0
	.4byte gSpriteAffineAnim_81E7B10
	.4byte gSpriteAffineAnim_81E7B20
	.4byte gSpriteAffineAnim_81E7B48
	.4byte gSpriteAffineAnim_81E7B58
	.4byte gSpriteAffineAnim_81E7B30

	.align 2
gSpriteAffineAnim_81E7B94:: @ 81E7B94
	obj_rot_scal_anim_frame 0xFFFC, 0xFFFC, 4, 63
	obj_rot_scal_anim_end

	.align 2
gSpriteAffineAnim_81E7BA4:: @ 81E7BA4
	obj_rot_scal_anim_frame 0x0, 0x0, 3, 5
	obj_rot_scal_anim_frame 0x0, 0x0, -3, 5
	obj_rot_scal_anim_end

	.align 2
gSpriteAffineAnim_81E7BBC:: @ 81E7BBC
	obj_rot_scal_anim_frame 0x0, 0x0, -5, 20
	obj_rot_scal_anim_frame 0x0, 0x0, 0, 20
	obj_rot_scal_anim_frame 0x0, 0x0, 5, 20
	obj_rot_scal_anim_end

	.align 2
gSpriteAffineAnim_81E7BDC:: @ 81E7BDC
	obj_rot_scal_anim_frame 0x0, 0x0, 9, 110
	obj_rot_scal_anim_end

	.align 2
gSpriteAffineAnimTable_81E7BEC:: @ 81E7BEC
	.4byte gSpriteAffineAnim_81E7AA0
	.4byte gSpriteAffineAnim_81E7AC0
	.4byte gSpriteAffineAnim_81E7AD8
	.4byte gSpriteAffineAnim_81E7AF0
	.4byte gSpriteAffineAnim_81E7B10
	.4byte gSpriteAffineAnim_81E7B20
	.4byte gSpriteAffineAnim_81E7B94
	.4byte gSpriteAffineAnim_81E7BA4
	.4byte gSpriteAffineAnim_81E7BBC
	.4byte gSpriteAffineAnim_81E7B30
	.4byte gSpriteAffineAnim_81E7BDC

	.align 2
gSpriteAffineAnimTable_81E7C18:: @ 81E7C18
	.4byte gSpriteAffineAnim_81E7AB0
	.4byte gSpriteAffineAnim_81E7AC0
	.4byte gSpriteAffineAnim_81E7AD8
	.4byte gSpriteAffineAnim_81E7AF0
	.4byte gSpriteAffineAnim_81E7B10
	.4byte gSpriteAffineAnim_81E7B20
	.4byte gSpriteAffineAnim_81E7B94
	.4byte gSpriteAffineAnim_81E7BA4
	.4byte gSpriteAffineAnim_81E7BBC
	.4byte gSpriteAffineAnim_81E7B30
	.4byte gSpriteAffineAnim_81E7BDC

	.align 2
gSpriteAnim_81E7C44:: @ 81E7C44
	obj_image_anim_frame 0, 0
	obj_image_anim_end

	.align 2
gSpriteAnim_81E7C4C:: @ 81E7C4C
	obj_image_anim_frame 1, 0
	obj_image_anim_end

	.align 2
gSpriteAnim_81E7C54:: @ 81E7C54
	obj_image_anim_frame 2, 0
	obj_image_anim_end

	.align 2
gSpriteAnim_81E7C5C:: @ 81E7C5C
	obj_image_anim_frame 3, 0
	obj_image_anim_end

	.align 2
gSpriteAnimTable_81E7C64:: @ 81E7C64
	.4byte gSpriteAnim_81E7C44
	.4byte gSpriteAnim_81E7C4C
	.4byte gSpriteAnim_81E7C54
	.4byte gSpriteAnim_81E7C5C

@ 81E7C74
	.include "data/graphics/pokemon/front_pic_coords.inc"

@ 81E8354
	.include "data/graphics/pokemon/front_pic_table.inc"

@ 81E9114
	.include "data/graphics/pokemon/back_pic_coords.inc"

@ 81E97F4
	.include "data/graphics/pokemon/back_pic_table.inc"

@ 81EA5B4
	.include "data/graphics/pokemon/palette_table.inc"

@ 81EB374
	.include "data/graphics/pokemon/shiny_palette_table.inc"

	.align 2
gSpriteAnim_81EC134:: @ 81EC134
	obj_image_anim_frame 0, 7
	obj_image_anim_end

	.align 2
gSpriteAnim_81EC13C:: @ 81EC13C
	obj_image_anim_frame 0, 2
	obj_image_anim_end

	.align 2
gSpriteAnim_81EC144:: @ 81EC144
	obj_image_anim_frame 0, 2
	obj_image_anim_end

	.align 2
gSpriteAnimTable_81EC14C:: @ 81EC14C
	.4byte gSpriteAnim_81E7A90

	.align 2
gSpriteAnimTable_81EC150:: @ 81EC150
	.4byte gSpriteAnim_81E7A90

	.align 2
gSpriteAnimTable_81EC154:: @ 81EC154
	.4byte gSpriteAnim_81E7A90
	.4byte gSpriteAnim_81EC134

	.align 2
gSpriteAnimTable_81EC15C:: @ 81EC15C
	.4byte gSpriteAnim_81E7A90

	.align 2
gSpriteAnimTable_81EC160:: @ 81EC160
	.4byte gSpriteAnim_81E7A90

	.align 2
gSpriteAnimTable_81EC164:: @ 81EC164
	.4byte gSpriteAnim_81E7A90

	.align 2
gSpriteAnimTable_81EC168:: @ 81EC168
	.4byte gSpriteAnim_81E7A90

	.align 2
gSpriteAnimTable_81EC16C:: @ 81EC16C
	.4byte gSpriteAnim_81E7A90
	.4byte gSpriteAnim_81EC13C

	.align 2
gSpriteAnimTable_81EC174:: @ 81EC174
	.4byte gSpriteAnim_81E7A90
	.4byte gSpriteAnim_81EC144

	.align 2
gSpriteAnimTable_81EC17C:: @ 81EC17C
	.4byte gSpriteAnim_81E7A90

	.align 2
gSpriteAnimTable_81EC180:: @ 81EC180
	.4byte gSpriteAnim_81E7A90

	.align 2
gSpriteAnimTable_81EC184:: @ 81EC184
	.4byte gSpriteAnim_81E7A90

	.align 2
gSpriteAnimTable_81EC188:: @ 81EC188
	.4byte gSpriteAnim_81E7A90

	.align 2
gSpriteAnimTable_81EC18C:: @ 81EC18C
	.4byte gSpriteAnim_81E7A90

	.align 2
gSpriteAnimTable_81EC190:: @ 81EC190
	.4byte gSpriteAnim_81E7A90

	.align 2
gSpriteAnimTable_81EC194:: @ 81EC194
	.4byte gSpriteAnim_81E7A90

	.align 2
gSpriteAnimTable_81EC198:: @ 81EC198
	.4byte gSpriteAnim_81E7A90

	.align 2
gSpriteAnimTable_81EC19C:: @ 81EC19C
	.4byte gSpriteAnim_81E7A90

	.align 2
gSpriteAnimTable_81EC1A0:: @ 81EC1A0
	.4byte gSpriteAnim_81E7A90

	.align 2
gSpriteAnimTable_81EC1A4:: @ 81EC1A4
	.4byte gSpriteAnim_81E7A90

	.align 2
gSpriteAnimTable_81EC1A8:: @ 81EC1A8
	.4byte gSpriteAnim_81E7A90

	.align 2
gSpriteAnimTable_81EC1AC:: @ 81EC1AC
	.4byte gSpriteAnim_81E7A90

	.align 2
gSpriteAnimTable_81EC1B0:: @ 81EC1B0
	.4byte gSpriteAnim_81E7A90

	.align 2
gSpriteAnimTable_81EC1B4:: @ 81EC1B4
	.4byte gSpriteAnim_81E7A90

	.align 2
gSpriteAnimTable_81EC1B8:: @ 81EC1B8
	.4byte gSpriteAnim_81E7A90

	.align 2
gSpriteAnimTable_81EC1BC:: @ 81EC1BC
	.4byte gSpriteAnim_81E7A90

	.align 2
gSpriteAnimTable_81EC1C0:: @ 81EC1C0
	.4byte gSpriteAnim_81E7A90

	.align 2
gSpriteAnimTable_81EC1C4:: @ 81EC1C4
	.4byte gSpriteAnim_81E7A90

	.align 2
gSpriteAnimTable_81EC1C8:: @ 81EC1C8
	.4byte gSpriteAnim_81E7A90

	.align 2
gSpriteAnimTable_81EC1CC:: @ 81EC1CC
	.4byte gSpriteAnim_81E7A90

	.align 2
gSpriteAnimTable_81EC1D0:: @ 81EC1D0
	.4byte gSpriteAnim_81E7A90

	.align 2
gSpriteAnimTable_81EC1D4:: @ 81EC1D4
	.4byte gSpriteAnim_81E7A90

	.align 2
gSpriteAnimTable_81EC1D8:: @ 81EC1D8
	.4byte gSpriteAnim_81E7A90

	.align 2
gSpriteAnimTable_81EC1DC:: @ 81EC1DC
	.4byte gSpriteAnim_81E7A90

	.align 2
gSpriteAnimTable_81EC1E0:: @ 81EC1E0
	.4byte gSpriteAnim_81E7A90

	.align 2
gSpriteAnimTable_81EC1E4:: @ 81EC1E4
	.4byte gSpriteAnim_81E7A90

	.align 2
gSpriteAnimTable_81EC1E8:: @ 81EC1E8
	.4byte gSpriteAnim_81E7A90

	.align 2
gSpriteAnimTable_81EC1EC:: @ 81EC1EC
	.4byte gSpriteAnim_81E7A90

	.align 2
gSpriteAnimTable_81EC1F0:: @ 81EC1F0
	.4byte gSpriteAnim_81E7A90

	.align 2
gSpriteAnimTable_81EC1F4:: @ 81EC1F4
	.4byte gSpriteAnim_81E7A90

	.align 2
gSpriteAnimTable_81EC1F8:: @ 81EC1F8
	.4byte gSpriteAnim_81E7A90

	.align 2
gSpriteAnimTable_81EC1FC:: @ 81EC1FC
	.4byte gSpriteAnim_81E7A90

	.align 2
gSpriteAnimTable_81EC200:: @ 81EC200
	.4byte gSpriteAnim_81E7A90

	.align 2
gSpriteAnimTable_81EC204:: @ 81EC204
	.4byte gSpriteAnim_81E7A90

	.align 2
gSpriteAnimTable_81EC208:: @ 81EC208
	.4byte gSpriteAnim_81E7A90

	.align 2
gSpriteAnimTable_81EC20C:: @ 81EC20C
	.4byte gSpriteAnim_81E7A90

	.align 2
gSpriteAnimTable_81EC210:: @ 81EC210
	.4byte gSpriteAnim_81E7A90

	.align 2
gSpriteAnimTable_81EC214:: @ 81EC214
	.4byte gSpriteAnim_81E7A90

	.align 2
gSpriteAnimTable_81EC218:: @ 81EC218
	.4byte gSpriteAnim_81E7A90

	.align 2
gSpriteAnimTable_81EC21C:: @ 81EC21C
	.4byte gSpriteAnim_81E7A90

	.align 2
gSpriteAnimTable_81EC220:: @ 81EC220
	.4byte gSpriteAnim_81E7A90

	.align 2
gSpriteAnimTable_81EC224:: @ 81EC224
	.4byte gSpriteAnim_81E7A90

	.align 2
gSpriteAnimTable_81EC228:: @ 81EC228
	.4byte gSpriteAnim_81E7A90

	.align 2
gSpriteAnimTable_81EC22C:: @ 81EC22C
	.4byte gSpriteAnim_81E7A90

	.align 2
gSpriteAnimTable_81EC230:: @ 81EC230
	.4byte gSpriteAnim_81E7A90

	.align 2
gSpriteAnimTable_81EC234:: @ 81EC234
	.4byte gSpriteAnim_81E7A90

	.align 2
gSpriteAnimTable_81EC238:: @ 81EC238
	.4byte gSpriteAnim_81E7A90

	.align 2
gSpriteAnimTable_81EC23C:: @ 81EC23C
	.4byte gSpriteAnim_81E7A90

	.align 2
gSpriteAnimTable_81EC240:: @ 81EC240
	.4byte gSpriteAnim_81E7A90

	.align 2
gSpriteAnimTable_81EC244:: @ 81EC244
	.4byte gSpriteAnim_81E7A90

	.align 2
gSpriteAnimTable_81EC248:: @ 81EC248
	.4byte gSpriteAnim_81E7A90

	.align 2
gSpriteAnimTable_81EC24C:: @ 81EC24C
	.4byte gSpriteAnim_81E7A90

	.align 2
gSpriteAnimTable_81EC250:: @ 81EC250
	.4byte gSpriteAnim_81E7A90

	.align 2
gSpriteAnimTable_81EC254:: @ 81EC254
	.4byte gSpriteAnim_81E7A90

	.align 2
gSpriteAnimTable_81EC258:: @ 81EC258
	.4byte gSpriteAnim_81E7A90

	.align 2
gSpriteAnimTable_81EC25C:: @ 81EC25C
	.4byte gSpriteAnim_81E7A90

	.align 2
gSpriteAnimTable_81EC260:: @ 81EC260
	.4byte gSpriteAnim_81E7A90

	.align 2
gSpriteAnimTable_81EC264:: @ 81EC264
	.4byte gSpriteAnim_81E7A90

	.align 2
gSpriteAnimTable_81EC268:: @ 81EC268
	.4byte gSpriteAnim_81E7A90

	.align 2
gSpriteAnimTable_81EC26C:: @ 81EC26C
	.4byte gSpriteAnim_81E7A90

	.align 2
gSpriteAnimTable_81EC270:: @ 81EC270
	.4byte gSpriteAnim_81E7A90

	.align 2
gSpriteAnimTable_81EC274:: @ 81EC274
	.4byte gSpriteAnim_81E7A90

	.align 2
gSpriteAnimTable_81EC278:: @ 81EC278
	.4byte gSpriteAnim_81E7A90

	.align 2
gSpriteAnimTable_81EC27C:: @ 81EC27C
	.4byte gSpriteAnim_81E7A90

	.align 2
gSpriteAnimTable_81EC280:: @ 81EC280
	.4byte gSpriteAnim_81E7A90

	.align 2
gSpriteAnimTable_81EC284:: @ 81EC284
	.4byte gSpriteAnim_81E7A90

	.align 2
gSpriteAnimTable_81EC288:: @ 81EC288
	.4byte gSpriteAnim_81E7A90

	.align 2
gSpriteAnimTable_81EC28C:: @ 81EC28C
	.4byte gSpriteAnim_81E7A90

	.align 2
gSpriteAnimTable_81EC290:: @ 81EC290
	.4byte gSpriteAnim_81E7A90

	.align 2
gSpriteAnimTable_81EC294:: @ 81EC294
	.4byte gSpriteAnim_81E7A90

	.align 2
gSpriteAnimTable_81EC298:: @ 81EC298
	.4byte gSpriteAnim_81E7A90

	.align 2
gSpriteAnimTable_81EC29C:: @ 81EC29C
	.4byte gSpriteAnim_81E7A90

	.align 2
gSpriteAnimTable_81EC2A0:: @ 81EC2A0
	.4byte gSpriteAnim_81E7A90

	.align 2
gUnknown_081EC2A4:: @ 81EC2A4
	.4byte gSpriteAnimTable_81EC14C
	.4byte gSpriteAnimTable_81EC150
	.4byte gSpriteAnimTable_81EC154
	.4byte gSpriteAnimTable_81EC15C
	.4byte gSpriteAnimTable_81EC160
	.4byte gSpriteAnimTable_81EC164
	.4byte gSpriteAnimTable_81EC168
	.4byte gSpriteAnimTable_81EC16C
	.4byte gSpriteAnimTable_81EC174
	.4byte gSpriteAnimTable_81EC17C
	.4byte gSpriteAnimTable_81EC180
	.4byte gSpriteAnimTable_81EC184
	.4byte gSpriteAnimTable_81EC188
	.4byte gSpriteAnimTable_81EC18C
	.4byte gSpriteAnimTable_81EC190
	.4byte gSpriteAnimTable_81EC194
	.4byte gSpriteAnimTable_81EC198
	.4byte gSpriteAnimTable_81EC19C
	.4byte gSpriteAnimTable_81EC1A0
	.4byte gSpriteAnimTable_81EC1A4
	.4byte gSpriteAnimTable_81EC1A8
	.4byte gSpriteAnimTable_81EC1AC
	.4byte gSpriteAnimTable_81EC1B0
	.4byte gSpriteAnimTable_81EC1B4
	.4byte gSpriteAnimTable_81EC1B8
	.4byte gSpriteAnimTable_81EC1BC
	.4byte gSpriteAnimTable_81EC1C0
	.4byte gSpriteAnimTable_81EC1C4
	.4byte gSpriteAnimTable_81EC1C8
	.4byte gSpriteAnimTable_81EC1CC
	.4byte gSpriteAnimTable_81EC1D0
	.4byte gSpriteAnimTable_81EC1D4
	.4byte gSpriteAnimTable_81EC1D8
	.4byte gSpriteAnimTable_81EC1DC
	.4byte gSpriteAnimTable_81EC1E0
	.4byte gSpriteAnimTable_81EC1E4
	.4byte gSpriteAnimTable_81EC1E8
	.4byte gSpriteAnimTable_81EC1EC
	.4byte gSpriteAnimTable_81EC1F0
	.4byte gSpriteAnimTable_81EC1F4
	.4byte gSpriteAnimTable_81EC1F8
	.4byte gSpriteAnimTable_81EC1FC
	.4byte gSpriteAnimTable_81EC200
	.4byte gSpriteAnimTable_81EC204
	.4byte gSpriteAnimTable_81EC208
	.4byte gSpriteAnimTable_81EC20C
	.4byte gSpriteAnimTable_81EC210
	.4byte gSpriteAnimTable_81EC214
	.4byte gSpriteAnimTable_81EC218
	.4byte gSpriteAnimTable_81EC21C
	.4byte gSpriteAnimTable_81EC220
	.4byte gSpriteAnimTable_81EC224
	.4byte gSpriteAnimTable_81EC228
	.4byte gSpriteAnimTable_81EC22C
	.4byte gSpriteAnimTable_81EC230
	.4byte gSpriteAnimTable_81EC234
	.4byte gSpriteAnimTable_81EC238
	.4byte gSpriteAnimTable_81EC23C
	.4byte gSpriteAnimTable_81EC240
	.4byte gSpriteAnimTable_81EC244
	.4byte gSpriteAnimTable_81EC248
	.4byte gSpriteAnimTable_81EC24C
	.4byte gSpriteAnimTable_81EC250
	.4byte gSpriteAnimTable_81EC254
	.4byte gSpriteAnimTable_81EC258
	.4byte gSpriteAnimTable_81EC25C
	.4byte gSpriteAnimTable_81EC260
	.4byte gSpriteAnimTable_81EC264
	.4byte gSpriteAnimTable_81EC268
	.4byte gSpriteAnimTable_81EC26C
	.4byte gSpriteAnimTable_81EC270
	.4byte gSpriteAnimTable_81EC274
	.4byte gSpriteAnimTable_81EC278
	.4byte gSpriteAnimTable_81EC27C
	.4byte gSpriteAnimTable_81EC280
	.4byte gSpriteAnimTable_81EC284
	.4byte gSpriteAnimTable_81EC288
	.4byte gSpriteAnimTable_81EC28C
	.4byte gSpriteAnimTable_81EC290
	.4byte gSpriteAnimTable_81EC294
	.4byte gSpriteAnimTable_81EC298
	.4byte gSpriteAnimTable_81EC29C
	.4byte gSpriteAnimTable_81EC2A0

@ 81EC3F0
	.include "data/graphics/trainers/front_pic_coords.inc"

@ 81EC53C
	.include "data/graphics/trainers/front_pic_table.inc"

@ 81EC7D4
	.include "data/graphics/trainers/front_pic_palette_table.inc"

	.align 2
gSpriteAnim_81ECA6C:: @ 81ECA6C
	obj_image_anim_frame 0, 24
	obj_image_anim_frame 1, 9
	obj_image_anim_frame 2, 24
	obj_image_anim_frame 0, 9
	obj_image_anim_frame 3, 50
	obj_image_anim_end

	.align 2
gSpriteAnim_81ECA84:: @ 81ECA84
	obj_image_anim_frame 0, 24
	obj_image_anim_frame 1, 9
	obj_image_anim_frame 2, 24
	obj_image_anim_frame 0, 9
	obj_image_anim_frame 3, 50
	obj_image_anim_end

	.align 2
gSpriteAnim_81ECA9C:: @ 81ECA9C
	obj_image_anim_frame 0, 24
	obj_image_anim_frame 1, 9
	obj_image_anim_frame 2, 24
	obj_image_anim_frame 0, 9
	obj_image_anim_frame 3, 50
	obj_image_anim_end

	.align 2
gSpriteAnimTable_81ECAB4:: @ 81ECAB4
	.4byte gSpriteAnim_81E7A98
	.4byte gSpriteAnim_81ECA6C

	.align 2
gSpriteAnimTable_81ECABC:: @ 81ECABC
	.4byte gSpriteAnim_81E7A98
	.4byte gSpriteAnim_81ECA84

	.align 2
gSpriteAnimTable_81ECAC4:: @ 81ECAC4
	.4byte gSpriteAnim_81E7A98
	.4byte gSpriteAnim_81ECA9C

	.align 2
gUnknown_081ECACC:: @ 81ECACC
	.4byte gSpriteAnimTable_81ECAB4
	.4byte gSpriteAnimTable_81ECABC
	.4byte gSpriteAnimTable_81ECAC4

@ 81ECAD8
	.include "data/graphics/trainers/back_pic_coords.inc"

@ 81ECAE4
	.include "data/graphics/trainers/back_pic_table.inc"

@ 81ECAFC
	.include "data/graphics/trainers/back_pic_palette_table.inc"

@ 81ECB14
	.include "data/enemy_mon_elevation.inc"

@ 81ECCB0
	.include "data/trainer_parties.inc"

@ 81F0208
	.include "data/text/trainer_class_names.inc"

@ 81F04FC
	.include "data/trainers.inc"

@ 81F716C
	.include "data/text/species_names.inc"

@ 81F8320
	.include "data/text/move_names.inc"

	.align 2
@ 81F9528
	.4byte 0x101 @ unknown data

	.align 2
gOamData_81F952C:: @ 81F952C
	.2byte 0x0300
	.2byte 0xC000
	.2byte 0x0000

	.align 2
gOamData_81F9534:: @ 81F9534
	.2byte 0x0300
	.2byte 0xC000
	.2byte 0x0040

	.align 2
gSpriteAffineAnim_81F953C:: @ 81F953C
	obj_rot_scal_anim_frame 0x80, 0x80, 0, 0
	obj_rot_scal_anim_end

	.align 2
gSpriteAffineAnim_81F954C:: @ 81F954C
	obj_rot_scal_anim_frame 0x80, 0x80, 0, 0
	obj_rot_scal_anim_frame 0x18, 0x18, 0, -128
	obj_rot_scal_anim_frame 0x18, 0x18, 0, -128
	obj_rot_scal_anim_end

	.align 2
gSpriteAffineAnimTable_81F956C:: @ 81F956C
	.4byte gSpriteAffineAnim_81F953C
	.4byte gSpriteAffineAnim_81F954C

	.align 2
gSpriteTemplate_81F9574:: @ 81F9574
	spr_template 10000, 10000, gOamData_81F952C, gDummySpriteAnimTable, NULL, gSpriteAffineAnimTable_81F956C, nullsub_36

	.align 2
gSpriteTemplate_81F958C:: @ 81F958C
	spr_template 10000, 10000, gOamData_81F9534, gDummySpriteAnimTable, NULL, gSpriteAffineAnimTable_81F956C, nullsub_36

	.align 2
gUnknown_081F95A4:: @ 81F95A4
	obj_tiles gUnknown_08E5DC2C, 4096, 0x2710

	.align 2
gBattleTerrainTable:: @ 81F95AC
	@ tall_grass
	.4byte gBattleTerrainTiles_TallGrass
	.4byte gBattleTerrainTilemap_TallGrass
	.4byte gBattleTerrainAnimTiles_TallGrass
	.4byte gBattleTerrainAnimTilemap_TallGrass
	.4byte gBattleTerrainPalette_TallGrass

	@ long_grass
	.4byte gBattleTerrainTiles_LongGrass
	.4byte gBattleTerrainTilemap_LongGrass
	.4byte gBattleTerrainAnimTiles_LongGrass
	.4byte gBattleTerrainAnimTilemap_LongGrass
	.4byte gBattleTerrainPalette_LongGrass

	@ sand
	.4byte gBattleTerrainTiles_Sand
	.4byte gBattleTerrainTilemap_Sand
	.4byte gBattleTerrainAnimTiles_Sand
	.4byte gBattleTerrainAnimTilemap_Sand
	.4byte gBattleTerrainPalette_Sand

	@ underwater
	.4byte gBattleTerrainTiles_Underwater
	.4byte gBattleTerrainTilemap_Underwater
	.4byte gBattleTerrainAnimTiles_Underwater
	.4byte gBattleTerrainAnimTilemap_Underwater
	.4byte gBattleTerrainPalette_Underwater

	@ water
	.4byte gBattleTerrainTiles_Water
	.4byte gBattleTerrainTilemap_Water
	.4byte gBattleTerrainAnimTiles_Water
	.4byte gBattleTerrainAnimTilemap_Water
	.4byte gBattleTerrainPalette_Water

	@ pond_water
	.4byte gBattleTerrainTiles_PondWater
	.4byte gBattleTerrainTilemap_PondWater
	.4byte gBattleTerrainAnimTiles_PondWater
	.4byte gBattleTerrainAnimTilemap_PondWater
	.4byte gBattleTerrainPalette_PondWater

	@ rock
	.4byte gBattleTerrainTiles_Rock
	.4byte gBattleTerrainTilemap_Rock
	.4byte gBattleTerrainAnimTiles_Rock
	.4byte gBattleTerrainAnimTilemap_Rock
	.4byte gBattleTerrainPalette_Rock

	@ cave
	.4byte gBattleTerrainTiles_Cave
	.4byte gBattleTerrainTilemap_Cave
	.4byte gBattleTerrainAnimTiles_Cave
	.4byte gBattleTerrainAnimTilemap_Cave
	.4byte gBattleTerrainPalette_Cave

	@ building
	.4byte gBattleTerrainTiles_Building
	.4byte gBattleTerrainTilemap_Building
	.4byte gBattleTerrainAnimTiles_Building
	.4byte gBattleTerrainAnimTilemap_Building
	.4byte gBattleTerrainPalette_Building

	@ plain
	.4byte gBattleTerrainTiles_Building
	.4byte gBattleTerrainTilemap_Building
	.4byte gBattleTerrainAnimTiles_Building
	.4byte gBattleTerrainAnimTilemap_Building
	.4byte gBattleTerrainPalette_Plain

	.align 2
gUnknown_081F9674:: @ 81F9674
	.4byte REG_BG3HOFS
	.4byte ((DMA_ENABLE | DMA_START_HBLANK | DMA_REPEAT | DMA_DEST_RELOAD) << 16) | 1
	.4byte 1

	.align 2
gUnknown_081F9680:: @ 81F9680
	.4byte 0x030041D0
	.2byte 0x20
	.byte 0x13
	.byte 0x10
	.4byte BG_VRAM + 0xE104

	.4byte 0x03004250
	.2byte 0x40
	.byte 0x13
	.byte 0x10
	.4byte BG_VRAM + 0xF104

	.4byte 0x030041D0
	.2byte 0x60
	.byte 0x13
	.byte 0x30
	.4byte BG_VRAM + 0xE204

	.4byte 0x03004250
	.2byte 0x80
	.byte 0x13
	.byte 0x30
	.4byte BG_VRAM + 0xF204

	.4byte 0x030041D0
	.2byte 0x20
	.byte 0x13
	.byte 0x18
	.4byte BG_VRAM + 0xE1C4

	.4byte 0x03004250
	.2byte 0x40
	.byte 0x13
	.byte 0x18
	.4byte BG_VRAM + 0xF1C4

gUnknown_081F96C8:: @ 81F96C8
	.string "ヌケニン$" @ "Nukenin" (Shedinja)

	.align 2
gSpriteTemplate_81F96D0:: @ 81F96D0
	spr_template 0, 0, gDummyOamData, gDummySpriteAnimTable, NULL, gDummySpriteAffineAnimTable, sub_800F828

	.align 2
gOamData_81F96E8:: @ 81F96E8
	.2byte 0x0100
	.2byte 0xC000
	.2byte 0x0800

	.align 2
gOamData_81F96F0:: @ 81F96F0
	.2byte 0x0100
	.2byte 0xC000
	.2byte 0x2800

	.align 2
gSpriteAnim_81F96F8:: @ 81F96F8
	obj_image_anim_frame 0, 5
	obj_image_anim_jump 0

	.align 2
gSpriteAnimTable_81F9700:: @ 81F9700
	.4byte gSpriteAnim_81F96F8

	.align 2
gSpriteAffineAnim_81F9704:: @ 81F9704
	obj_rot_scal_anim_frame 0xFFF0, 0x0, 0, 4
	obj_rot_scal_anim_frame 0x0, 0x0, 0, 60
	obj_rot_scal_anim_jump 1

	.align 2
gSpriteAffineAnimTable_81F971C:: @ 81F971C
	.4byte gSpriteAffineAnim_81F9704

@ 81F9720
	.include "data/type_effectiveness.inc"

@ 81F9870
	.include "data/text/type_names.inc"

@ 81F98F0
	.include "data/trainer_money.inc"

@ 81F99CC
	.include "data/text/ability_descriptions.inc"

@ 81FA248
	.include "data/text/ability_names.inc"

	.align 2
gUnknown_081FA640:: @ 81FA640
	.4byte sub_8013FE8
	.4byte sub_80147A0
	.4byte sub_80146F4
	.4byte sub_8014BF4
	.4byte sub_8014D50
	.4byte sub_8014D98
	.4byte sub_8014DF8
	.4byte sub_8014EBC
	.4byte bs8_exit_by_flight
	.4byte sub_8014FBC
	.4byte sub_801B594
	.4byte bsB_exit_by_move
	.4byte bsC_8016D70
	.4byte sub_8015060

	.align 2
gUnknown_081FA678:: @ 81FA678
	.4byte bc_8013B1C
	.4byte sub_8013998
	.4byte sub_8013B64
	.4byte sub_8013B64
	.4byte sub_8013BDC
	.4byte sub_8013C9C
	.4byte sub_8013C48
	.4byte sub_8013C9C
	.4byte sub_8013C9C

gStatusConditionString_PoisonJpn:: @ 81FA69C
	.string "どく$$$$$$"

gStatusConditionString_SleepJpn:: @ 81FA6A4
	.string "ねむり$$$$$"

gStatusConditionString_ParalysisJpn:: @ 81FA6AC
	.string "まひ$$$$$$"

gStatusConditionString_BurnJpn:: @ 81FA6B4
	.string "やけど$$$$$"

gStatusConditionString_IceJpn:: @ 81FA6BC
	.string "こおり$$$$$"

gStatusConditionString_ConfusionJpn:: @ 81FA6C4
	.string "こんらん$$$$"

gStatusConditionString_LoveJpn:: @ 81FA6CC
	.string "メロメロ$$$$"

	.align 2
gUnknown_081FA6D4:: @ 81FA6D4
	.4byte gStatusConditionString_PoisonJpn, BattleText_PoisonStatus
	.4byte gStatusConditionString_SleepJpn, BattleText_Sleep
	.4byte gStatusConditionString_ParalysisJpn, BattleText_Paralysis
	.4byte gStatusConditionString_BurnJpn, BattleText_Burn
	.4byte gStatusConditionString_IceJpn, BattleText_IceStatus
	.4byte gStatusConditionString_ConfusionJpn, BattleText_Confusion
	.4byte gStatusConditionString_LoveJpn, BattleText_Love

gUnknown_081FA70C:: @ 81FA70C
	.byte 0, 0, 0
	.byte 3, 5, 0
	.byte 2, 3, 0
	.byte 1, 2, 0
	.byte 1, 1, 0

gUnknown_081FA71B:: @ 81FA71B
	.byte 4, 3, 2, 1

gUnknown_081FA71F:: @ 81FA71F
	.byte 4, 4, 4, 4

	.align 1
gUnknown_081FA724:: @ 81FA724
	.2byte   0x2D
	.2byte   0x2E
	.2byte   0x2F
	.2byte   0x30
	.2byte   0x67
	.2byte   0xAD
	.2byte   0xFD
	.2byte  0x13F
	.2byte  0x140
	.2byte  0x130
	.2byte 0xFFFF

	.align 2
gUnknown_081FA73C:: @ 81FA73C
	.4byte atk00_attackcanceler
	.4byte atk01_accuracycheck
	.4byte atk02_attackstring
	.4byte atk03_ppreduce
	.4byte atk04_critcalc
	.4byte atk05_damagecalc1
	.4byte atk06_damagecalc2
	.4byte atk07_damagecalc3
	.4byte atk08_cmd8
	.4byte sub_801D8EC
	.4byte sub_801DA60
	.4byte sub_801DA80
	.4byte atk0C_datahpupdate
	.4byte atk0D_critmessage
	.4byte atk0E_missmessage
	.4byte atk0F_resultmessage
	.4byte atk10_printstring
	.4byte atk11_printstring2
	.4byte atk12_waitmessage
	.4byte atk13_printfromtable
	.4byte atk14_printfromtable2
	.4byte atk15_seteffectwithchancetarget
	.4byte sub_801F708
	.4byte sub_801F718
	.4byte sub_801F728
	.4byte sub_801F7AC
	.4byte sub_801FB34
	.4byte atkE2_cmde2
	.4byte atk1C_jumpifstatus
	.4byte atk1D_jumpifsecondarystatus
	.4byte atk1E_jumpifability
	.4byte sub_801FDB4
	.4byte sub_801FE2C
	.4byte atk21_jumpifspecialstatusflag
	.4byte sub_801FFA8
	.4byte sub_8020004
	.4byte sub_80209B4
	.4byte atk25_resetflags
	.4byte sub_8020BB4
	.4byte atk27_cmd27
	.4byte sub_8020C14
	.4byte atk29_jumpifbyte
	.4byte sub_8020CD4
	.4byte sub_8020D7C
	.4byte sub_8020E30
	.4byte sub_8020EB8
	.4byte sub_8020F3C
	.4byte sub_8020F64
	.4byte sub_8020F90
	.4byte atk31_copyarray
	.4byte atk32_memcpy_with_offset
	.4byte sub_802107C
	.4byte atk34_orhalfword
	.4byte atk35_orword
	.4byte sub_8021124
	.4byte atk37_bichalfword
	.4byte atk38_bicword
	.4byte atk39_pause
	.4byte sub_802120C
	.4byte atk3B_8022C68
	.4byte atk3C_return
	.4byte sub_8021290
	.4byte sub_80212B0
	.4byte atk3F_end3
	.4byte atk40_801DBA0
	.4byte atk41_call
	.4byte atk42_jumpiftype2
	.4byte sub_8021384
	.4byte sub_80213D0
	.4byte atk46_cmd46
	.4byte sub_80214B4
	.4byte atk47
	.4byte atk48_playstatchangeanimation
	.4byte sub_80217F8
	.4byte atk4A_damageflags
	.4byte atk4B_cmd4b
	.4byte atk4C_switch1
	.4byte sub_80225F0
	.4byte sub_8022784
	.4byte sub_8022830
	.4byte atk50_openpartyscreen
	.4byte sub_802331C
	.4byte sub_8023524
	.4byte sub_80237CC
	.4byte atk54_802511C
	.4byte sub_8023848
	.4byte atk56_8025194
	.4byte atk57_80251C4_flee
	.4byte atk58_cmd58
	.4byte atk59_8025230
	.4byte sub_8023AF8
	.4byte atk5B_80256E0
	.4byte atk5C_cmd5c
	.4byte sub_8024014
	.4byte atk5E_8025A70
	.4byte atk5F_8025B24
	.4byte atk60_cmd60
	.4byte atk61_8025BA4
	.4byte atk62_08025C6C
	.4byte atk63_jumptoattack
	.4byte atk64_statusanimation
	.4byte atk65_8025D90
	.4byte atk66_8025E38
	.4byte atk67_8025ECC
	.4byte sub_80246A0
	.4byte atk69_8025FE0
	.4byte atk6A_stash_item_for_side
	.4byte sub_80248C0
	.4byte sub_80248FC
	.4byte sub_8024C4C
	.4byte atk6E_state0_side_becomes_attacker
	.4byte atk6F_8026810
	.4byte atk70_record_ability_usage_of_side
	.4byte atk71_80268A0
	.4byte atk72_flee
	.4byte atk73_cmd73
	.4byte atk74_hp_tresholds_2
	.4byte atk75_8026A58
	.4byte sub_8024F40
	.4byte atk77_setprotect
	.4byte atk78_faintifabilitynotdamp
	.4byte atk79_setuserhptozero
	.4byte sub_80253E8
	.4byte sub_802548C
	.4byte sub_8025508
	.4byte sub_80256D0
	.4byte atk7E_setreflect
	.4byte sub_80257DC
	.4byte atk80_manipulatedamage
	.4byte atk81_setrest
	.4byte atk82_jumpifnotfirstturn
	.4byte sub_8025A34
	.4byte sub_8025AE0
	.4byte sub_8025B5C
	.4byte atk86_stockpiletobasedamage
	.4byte sub_8025D00
	.4byte atk88_negativedamage
	.4byte atk89_statbuffchange
	.4byte atk8A_normalisebuffs
	.4byte atk8B_setbide
	.4byte atk8C_confuseifrepeatingattackends
	.4byte atk8D_setloopcounter
	.4byte sub_8026468
	.4byte sub_8026590
	.4byte sub_802688C
	.4byte atk91_givemoney
	.4byte atk92_setlightscreen
	.4byte sub_8026B78
	.4byte atk94_gethalfcurrentenemyhp
	.4byte sub_8026E94
	.4byte sub_8026EEC
	.4byte sub_8027064
	.4byte sub_8027238
	.4byte sub_8027348
	.4byte atk9A_setincreasedcriticalchance
	.4byte atk9B_transformdataexecution
	.4byte sub_80275D8
	.4byte atk9D_copyattack
	.4byte sub_80278B8
	.4byte sub_8027960
	.4byte atkA0_psywavedamageeffect
	.4byte atkA1_counterdamagecalculator
	.4byte atkA2_mirrorcoatdamagecalculator
	.4byte atkA3_disablelastusedattack
	.4byte atkA4_setencore
	.4byte sub_8027E4C
	.4byte sub_8027F44
	.4byte atkA7_setalwayshitflag
	.4byte atkA8_copymovepermanently
	.4byte sub_8028420
	.4byte sub_8028558
	.4byte atkAB_802A458
	.4byte atkAC_remaininghptopower
	.4byte sub_8028668
	.4byte sub_8028858
	.4byte sub_8028AD4
	.4byte sub_8028B70
	.4byte sub_8028BFC
	.4byte atkB2_setperishsong
	.4byte atkB3_rolloutdamagecalculation
	.4byte atkB4_jumpifconfusedandattackmaxed
	.4byte sub_8028EC8
	.4byte atkB6_happinesstodamagecalculation
	.4byte atkB7_presentdamagecalculation
	.4byte sub_80290BC
	.4byte atkB9_magnitudedamagecalculation
	.4byte sub_8029270
	.4byte sub_80293E8
	.4byte atkBC_maxattackhalvehp
	.4byte atkBD_copyfoestats
	.4byte atkBE_breakfree
	.4byte sub_802964C
	.4byte atkC0_recoverbasedonsunlight
	.4byte sub_8029784
	.4byte atkC2_selectnexttarget
	.4byte atkC3_setfutureattack
	.4byte atkC4_802B910
	.4byte atkC5_hidepreattack
	.4byte atkC6_unhidepostattack
	.4byte atkC7_setminimize
	.4byte sub_8029DAC
	.4byte atkC9_jumpifattackandspecialattackcannotfall
	.4byte atkCA_setforcedtarget
	.4byte atkCB_setcharge
	.4byte atkCC_callterrainattack
	.4byte atkCD_cureifburnedparalysedorpoisoned
	.4byte atkCE_settorment
	.4byte atkCF_jumpifnodamage
	.4byte atkD0_settaunt
	.4byte sub_802A170
	.4byte sub_802A218
	.4byte sub_802A4B0
	.4byte atkD4_802C408
	.4byte sub_802A5FC
	.4byte atkD6_doubledamagedealtifdamaged
	.4byte sub_802A6BC
	.4byte atkD8_setdamagetohealthdifference
	.4byte atkD9_scaledamagebyhealthratio
	.4byte atkDA_abilityswap
	.4byte atkDB_imprisoneffect
	.4byte atkDC_setgrudge
	.4byte atkDD_weightdamagecalculation
	.4byte atkDE_asistattackselect
	.4byte atkDF_setmagiccoat
	.4byte atkE0_setstealstatchange
	.4byte atkE1_802CBE4
	.4byte sub_802ADD8
	.4byte atkE3_jumpiffainted
	.4byte sub_802AEB0
	.4byte sub_802AF68
	.4byte atkE6_castform_transform
	.4byte atkE7_castform_switch
	.4byte atkE8_settypebasedhalvers
	.4byte sub_802B1C0
	.4byte atkEA_recycleitem
	.4byte atkEB_settypetoterrain
	.4byte sub_802B3E0
	.4byte sub_802B4B4
	.4byte sub_802B51C
	.4byte sub_802B5B8
	.4byte sub_802B960
	.4byte sub_802B9E0
	.4byte sub_802BA90
	.4byte atkF3_receive_new_pokemon_maybe
	.4byte sub_802BEF0
	.4byte sub_802BF20
	.4byte sub_802BF48
	.4byte sub_802BF54

	.align 2
gAccuracyStageRatios:: @ 81FAB1C
	.byte  33, 100, 0, 0 @ -6
	.byte  36, 100, 0, 0 @ -5
	.byte  43, 100, 0, 0 @ -4
	.byte  50, 100, 0, 0 @ -3
	.byte  60, 100, 0, 0 @ -2
	.byte  75, 100, 0, 0 @ -1
	.byte   1,   1, 0, 0 @  0
	.byte 133, 100, 0, 0 @ +1
	.byte 166, 100, 0, 0 @ +2
	.byte   2,   1, 0, 0 @ +3
	.byte 233, 100, 0, 0 @ +4
	.byte 133,  50, 0, 0 @ +5
	.byte   3,   1, 0, 0 @ +6

@ The chance is 1/N for each stage.
	.align 1
gCriticalHitChance:: @ 81FAB50
	.2byte 16 @ +0
	.2byte  8 @ +1
	.2byte  4 @ +2
	.2byte  3 @ +3
	.2byte  2 @ +4

	.align 2
gUnknown_081FAB5C:: @ 81FAB5C
	.4byte 0x00000000
	.4byte 0x00000007
	.4byte 0x00000008
	.4byte 0x00000010
	.4byte 0x00000020
	.4byte 0x00000040
	.4byte 0x00000080
	.4byte 0x00000007
	.4byte 0x00000008
	.4byte 0x00000000
	.4byte 0x00000070
	.4byte 0x00000000
	.4byte 0x00001000
	.4byte 0x0000E000
	.4byte 0x00000000
	.4byte 0x00000000
	.4byte 0x00000000
	.4byte 0x00000000
	.4byte 0x00000000
	.4byte 0x00000000
	.4byte 0x00000000
	.4byte 0x00000000
	.4byte 0x00000000
	.4byte 0x00000000
	.4byte 0x00000000
	.4byte 0x00000000
	.4byte 0x00000000
	.4byte 0x00000000
	.4byte 0x00000000
	.4byte 0x00400000
	.4byte 0x00000000
	.4byte 0x00000000
	.4byte 0x04000000
	.4byte 0x08000000
	.4byte 0x00000000
	.4byte 0x00000000
	.4byte 0x00000000
	.4byte 0x00000000
	.4byte 0x00000000
	.4byte 0x00000000
	.4byte 0x00000000
	.4byte 0x00000000
	.4byte 0x00000000
	.4byte 0x00000000
	.4byte 0x00000000
	.4byte 0x00000000
	.4byte 0x00000000
	.4byte 0x00000000
	.4byte 0x00000000
	.4byte 0x00000000
	.4byte 0x00000000
	.4byte 0x00000000
	.4byte 0x00000000
	.4byte 0x00000C00
	.4byte 0x00000000
	.4byte 0x00000000
	.4byte 0x00000000
	.4byte 0x00000000
	.4byte 0x00000000
	.4byte 0x00000000

	.align 2
gUnknown_081FAC4C:: @ 81FAC4C
	.4byte BattleScript_1D963E
	.4byte BattleScript_1D963E
	.4byte BattleScript_1D965A
	.4byte BattleScript_1D9669
	.4byte BattleScript_1D9678
	.4byte BattleScript_1D9687
	.4byte BattleScript_1D969D
	.4byte BattleScript_1D96BA
	.4byte BattleScript_1D963E
	.4byte BattleScript_1D963E
	.4byte BattleScript_1D9696
	.4byte BattleScript_1D96AA
	.4byte BattleScript_1D963E
	.4byte BattleScript_1D96B1
	.4byte BattleScript_1D96C8
	.4byte BattleScript_1D963E
	.4byte BattleScript_1D963E
	.4byte BattleScript_1D963E
	.4byte BattleScript_1D963E
	.4byte BattleScript_1D963E
	.4byte BattleScript_1D963E
	.4byte BattleScript_1D963E
	.4byte BattleScript_1D963E
	.4byte BattleScript_1D963E
	.4byte BattleScript_1D963E
	.4byte BattleScript_1D963E
	.4byte BattleScript_1D963E
	.4byte BattleScript_1D963E
	.4byte BattleScript_1D963E
	.4byte BattleScript_1D963E
	.4byte BattleScript_1D963E
	.4byte BattleScript_1D963E
	.4byte BattleScript_1D963E
	.4byte BattleScript_1D963E
	.4byte BattleScript_1D963E
	.4byte BattleScript_1D963E
	.4byte BattleScript_1D963E
	.4byte BattleScript_1D963E
	.4byte BattleScript_1D96C8

@ unreferenced bit masks
	.byte 0x00, 0x01, 0x03, 0x07, 0x0F, 0x1F, 0x3F

gLevelUpStatBoxStats:: @ 81FACEF
	.byte 0x3A @ HP
	.byte 0x3E @ Sp. Attack
	.byte 0x3B @ Attack
	.byte 0x3F @ Sp. Defense
	.byte 0x3C @ Defense
	.byte 0x3D @ Speed

	.align 1
gProtectSuccessRates:: @ 81FACF6
	.2byte 0xFFFF, 0x7FFF, 0x3FFF, 0x1FFF

	.align 1
gUnknown_081FACFE:: @ 81FACFE
	.2byte MOVE_METRONOME
	.2byte MOVE_STRUGGLE
	.2byte MOVE_SKETCH
	.2byte MOVE_MIMIC
	.2byte 0xFFFE
	.2byte MOVE_COUNTER
	.2byte MOVE_MIRROR_COAT
	.2byte MOVE_PROTECT
	.2byte MOVE_DETECT
	.2byte MOVE_ENDURE
	.2byte MOVE_DESTINY_BOND
	.2byte MOVE_SLEEP_TALK
	.2byte MOVE_THIEF
	.2byte MOVE_FOLLOW_ME
	.2byte MOVE_SNATCH
	.2byte MOVE_HELPING_HAND
	.2byte MOVE_COVET
	.2byte MOVE_TRICK
	.2byte MOVE_FOCUS_PUNCH
	.2byte 0xFFFF

gUnknown_081FAD26:: @ 81FAD26
	.byte  1, 200
	.byte  4, 150
	.byte  9, 100
	.byte 16,  80
	.byte 32,  40
	.byte 48,  20

	.align 1
gNaturePowerMoves:: @ 81FAD32
	.2byte MOVE_STUN_SPORE
	.2byte MOVE_RAZOR_LEAF
	.2byte MOVE_EARTHQUAKE
	.2byte MOVE_HYDRO_PUMP
	.2byte MOVE_SURF
	.2byte MOVE_BUBBLE_BEAM
	.2byte MOVE_ROCK_SLIDE
	.2byte MOVE_SHADOW_BALL
	.2byte MOVE_SWIFT
	.2byte MOVE_SWIFT

@ weight-based damage table for Low Kick
@ format: min. weight (hectograms), base power

	.align 1
gWeightDamage:: @ 81FAD46
	.2byte  100,  20
	.2byte  250,  40
	.2byte  500,  60
	.2byte 1000,  80
	.2byte 2000, 100
	.2byte   -1,  -1

	.align 1
gPickupItems:: @ 81FAD5E
	.2byte ITEM_SUPER_POTION, 30
	.2byte ITEM_FULL_HEAL, 40
	.2byte ITEM_ULTRA_BALL, 50
	.2byte ITEM_RARE_CANDY, 60
	.2byte ITEM_FULL_RESTORE, 70
	.2byte ITEM_REVIVE, 80
	.2byte ITEM_NUGGET, 90
	.2byte ITEM_PROTEIN, 95
	.2byte ITEM_PP_UP, 99
	.2byte ITEM_KINGS_ROCK, 1

gTerrainToType:: @ 81FAD86
	.byte TYPE_GRASS  @ tall grass
	.byte TYPE_GRASS  @ long grass
	.byte TYPE_GROUND @ sand
	.byte TYPE_WATER  @ underwater
	.byte TYPE_WATER  @ water
	.byte TYPE_WATER  @ pond water
	.byte TYPE_ROCK   @ rock
	.byte TYPE_ROCK   @ cave
	.byte TYPE_NORMAL @ building
	.byte TYPE_NORMAL @ plain

gBallCatchBonuses:: @ 81FAD90
	.byte 20 @ Ultra Ball
	.byte 15 @ Great Ball
	.byte 10 @ Poké Ball
	.byte 15 @ Safari Ball

	.string "ターン$" @ "turn"

	.align 2
gUnknown_081FAD98:: @ 81FAD98
	.4byte dp01t_00_1_getattr
	.4byte sub_802ECF0
	.4byte dp01t_02_1_setattr
	.4byte sub_802F7CC
	.4byte sub_802F840
	.4byte sub_802F8A8
	.4byte sub_802FAA0
	.4byte sub_802FBB4
	.4byte sub_802FCE0
	.4byte sub_802FDBC
	.4byte sub_802FE7C
	.4byte sub_802FF60
	.4byte sub_802FF80
	.4byte sub_802FFD0
	.4byte sub_803002C
	.4byte dp01t_0F_1_move_anim
	.4byte sub_80302F4
	.4byte dp01t_11_1_message_for_player_only
	.4byte sub_803037C
	.4byte nullsub_42
	.4byte sub_8030468
	.4byte sub_8030530
	.4byte sub_8030594
	.4byte sub_8030674
	.4byte sub_8030698
	.4byte sub_8030798
	.4byte sub_8030834
	.4byte sub_80308A8
	.4byte sub_8030910
	.4byte sub_803097C
	.4byte sub_8030988
	.4byte sub_8030A3C
	.4byte sub_8030A6C
	.4byte sub_8030A78
	.4byte sub_8030A8C
	.4byte sub_8030AA0
	.4byte sub_8030AB4
	.4byte sub_8030AC8
	.4byte sub_8030AE4
	.4byte sub_8030B1C
	.4byte sub_8030B34
	.4byte dp01t_29_1_blink
	.4byte sub_8030BCC
	.4byte sub_8030BD8
	.4byte sub_8030C1C
	.4byte sub_8030C4C
	.4byte dp01t_2E_1_battle_intro
	.4byte sub_8030CC0
	.4byte sub_8030FAC
	.4byte sub_80310A4
	.4byte sub_80310F0
	.4byte dp01t_33_1_enemy_move
	.4byte bx_exec_buffer_A_ch0_tbl1
	.4byte dp01t_35_1_link_standby_message_and_free_vram
	.4byte sub_8031238
	.4byte sub_80312A0
	.4byte nullsub_43

gUnknown_081FAE7C:: @ 81FAE7C
	.byte 0, 2, 3, 1

gUnknown_081FAE80:: @ 81FAE80
	.string "{PALETTE 5}{COLOR_HIGHLIGHT_SHADOW WHITE LIGHT_BLUE WHITE2}$"

gUnknown_081FAE89:: @ 81FAE89
	.byte  8, 120
	.byte 88, 120
	.byte  8, 136
	.byte 88, 136

gUnknown_081FAE91:: @ 81FAE91
	.byte 144, 120
	.byte 190, 120
	.byte 144, 136
	.byte 190, 136
	.byte  72,  72
	.byte  32,  90
	.byte  80,  80
	.byte  80,  88

	.align 2
gUnknown_081FAEA4:: @ 81FAEA4
	obj_tiles gSmokescreenImpactTiles, 0x180, 55019

	.align 2
gUnknown_081FAEAC:: @ 81FAEAC
	obj_pal gSmokescreenImpactPalette, 55019

	.align 2
gOamData_81FAEB4:: @ 81FAEB4
	.2byte 0x0000
	.2byte 0x4000
	.2byte 0x0400

	.align 2
gSpriteAnim_81FAEBC:: @ 81FAEBC
	obj_image_anim_frame 0, 4
	obj_image_anim_frame 4, 4
	obj_image_anim_frame 8, 4
	obj_image_anim_end

	.align 2
gSpriteAnim_81FAECC:: @ 81FAECC
	obj_image_anim_frame 0, 4, OBJ_IMAGE_ANIM_H_FLIP
	obj_image_anim_frame 4, 4, OBJ_IMAGE_ANIM_H_FLIP
	obj_image_anim_frame 8, 4, OBJ_IMAGE_ANIM_H_FLIP
	obj_image_anim_end

	.align 2
gSpriteAnim_81FAEDC:: @ 81FAEDC
	obj_image_anim_frame 0, 4, OBJ_IMAGE_ANIM_V_FLIP
	obj_image_anim_frame 4, 4, OBJ_IMAGE_ANIM_V_FLIP
	obj_image_anim_frame 8, 4, OBJ_IMAGE_ANIM_V_FLIP
	obj_image_anim_end

	.align 2
gSpriteAnim_81FAEEC:: @ 81FAEEC
	obj_image_anim_frame 0, 4, OBJ_IMAGE_ANIM_V_FLIP | OBJ_IMAGE_ANIM_H_FLIP
	obj_image_anim_frame 4, 4, OBJ_IMAGE_ANIM_V_FLIP | OBJ_IMAGE_ANIM_H_FLIP
	obj_image_anim_frame 8, 4, OBJ_IMAGE_ANIM_V_FLIP | OBJ_IMAGE_ANIM_H_FLIP
	obj_image_anim_end

	.align 2
gSpriteAnimTable_81FAEFC:: @ 81FAEFC
	.4byte gSpriteAnim_81FAEBC
	.4byte gSpriteAnim_81FAECC
	.4byte gSpriteAnim_81FAEDC
	.4byte gSpriteAnim_81FAEEC

	.align 2
gSpriteTemplate_81FAF0C:: @ 81FAF0C
	spr_template 55019, 55019, gOamData_81FAEB4, gSpriteAnimTable_81FAEFC, NULL, gDummySpriteAffineAnimTable, sub_80463CC

	.align 2
gUnknown_081FAF24:: @ 81FAF24
	obj_tiles gEnemyMonShadow_Gfx, 128, 0xD759

	.align 2
gOamData_81FAF2C:: @ 81FAF2C
	.2byte 0x4000
	.2byte 0x4000
	.2byte 0x0C00

	.align 2
gSpriteTemplate_81FAF34:: @ 81FAF34
	spr_template 55129, 55039, gOamData_81FAF2C, gDummySpriteAnimTable, NULL, gDummySpriteAffineAnimTable, sub_8032978

	.align 2
gUnknown_081FAF4C:: @ 81FAF4C
	.4byte 0x02008000
	.4byte 0x0200a000
	.4byte 0x0200c000
	.4byte 0x0200e000

	.align 2
gUnknown_081FAF5C:: @ 81FAF5C
	.4byte dp01t_00_7_getattr
	.4byte dp01t_01_2_read_pokmon_data_slice
	.4byte dp01t_02_7_setattr
	.4byte sub_8034744
	.4byte sub_80347B8
	.4byte sub_8034910
	.4byte sub_8034AE0
	.4byte sub_8034BFC
	.4byte sub_8034DC0
	.4byte sub_8034F84
	.4byte sub_8035030
	.4byte sub_80350D4
	.4byte sub_80350E0
	.4byte sub_80350EC
	.4byte sub_80350F8
	.4byte sub_8035104
	.4byte sub_803539C
	.4byte sub_8035400
	.4byte sub_803540C
	.4byte sub_803541C
	.4byte sub_8035428
	.4byte sub_8035590
	.4byte sub_80355C0
	.4byte sub_80356C0
	.4byte sub_80356CC
	.4byte sub_80357BC
	.4byte sub_80357C8
	.4byte sub_803583C
	.4byte sub_80358A4
	.4byte sub_80358B0
	.4byte sub_80358BC
	.4byte sub_80358C8
	.4byte sub_80358D4
	.4byte sub_80358E0
	.4byte sub_80358EC
	.4byte sub_80358F8
	.4byte sub_8035904
	.4byte sub_8035910
	.4byte sub_803592C
	.4byte sub_8035964
	.4byte sub_803597C
	.4byte dp01t_29_7_blink
	.4byte sub_8035A14
	.4byte sub_8035A20
	.4byte sub_8035A64
	.4byte sub_8035A94
	.4byte dp01t_2E_7_battle_intro
	.4byte sub_8035B04
	.4byte dp01t_30_7_0803D67C
	.4byte sub_8035E6C
	.4byte sub_8035EB8
	.4byte sub_8035EC4
	.4byte dp01t_34_7_move_anim_start_t3
	.4byte sub_8035F8C
	.4byte sub_8035F98
	.4byte sub_8035FA4
	.4byte nullsub_46

@ unreferenced unknown values
	.byte 0xB0, 0xB0, 0xC8, 0x98, 0x28, 0x28, 0x28, 0x20

	.align 2
gUnknown_081FB048:: @ 81FB048
	.4byte dp01t_00_4_getattr
	.4byte sub_803889C
	.4byte sub_80388A8
	.4byte sub_8039220
	.4byte sub_8039294
	.4byte sub_80393E4
	.4byte sub_80395B4
	.4byte sub_80396D0
	.4byte sub_80398A4
	.4byte sub_80398B0
	.4byte sub_803995C
	.4byte sub_8039A00
	.4byte sub_8039A0C
	.4byte sub_8039A18
	.4byte sub_8039A24
	.4byte sub_8039A30
	.4byte sub_8039CC8
	.4byte sub_8039D2C
	.4byte sub_8039D38
	.4byte sub_8039D44
	.4byte sub_8039D50
	.4byte sub_8039D5C
	.4byte sub_8039D68
	.4byte sub_8039D74
	.4byte sub_8039D80
	.4byte sub_8039E70
	.4byte sub_8039E7C
	.4byte sub_8039EF0
	.4byte sub_8039F58
	.4byte sub_8039F64
	.4byte sub_8039F70
	.4byte sub_8039F7C
	.4byte sub_8039F88
	.4byte sub_8039F94
	.4byte sub_8039FA0
	.4byte sub_8039FAC
	.4byte sub_8039FB8
	.4byte sub_8039FC4
	.4byte sub_8039FE0
	.4byte sub_803A018
	.4byte sub_803A030
	.4byte dp01t_29_4_blink
	.4byte sub_803A0C8
	.4byte sub_803A0D4
	.4byte sub_803A118
	.4byte sub_803A148
	.4byte dp01t_2E_4_battle_intro
	.4byte sub_803A1B8
	.4byte sub_803A3DC
	.4byte sub_803A520
	.4byte sub_803A56C
	.4byte sub_803A578
	.4byte bx_exec_buffer_A_ch0_tbl4
	.4byte sub_803A640
	.4byte sub_803A64C
	.4byte sub_803A658
	.4byte nullsub_48

@ 81FB12C
	.include "data/battle_moves.inc"

	.align 2
gUnknown_081FC1D0:: @ 81FC1D0
	.2byte 0x34, 0x10, 0x101
	.space 2

	.2byte -1, -1, -1
	.space 2

@ 81FC1E0
	.include "data/species_id_conversion_tables.inc"

@ 81FCB84
	.include "data/spinda_spot_graphics.inc"

@ 81FCC14
	.include "data/item_effects.inc"

@ 81FD070
	.include "data/nature_stat_table.inc"

@ 81FD0F0
	.include "data/tm_hm_learnsets.inc"

@ 81FDDD0
	.include "data/trainer_class_index_tables.inc"

@ 81FDE6A
	.include "data/cry_id_table.inc"

@ 81FDF78
	.include "data/experience_tables/tables.inc"

@ 81FEC18
	.include "data/base_stats.inc"

@ 8201928
	.include "data/level_up_learnsets.inc"

@ 8203B68
	.include "data/evolution_table.inc"

@ 8207BC8
	.include "data/level_up_learnset_pointers.inc"

gUnknown_08208238:: @ 8208238
	.byte 0x03, 0x0C, 0x30, 0xC0

gUnknown_0820823C:: @ 820823C
	.byte 0xFC, 0xF3, 0xCF, 0x3F

gUnknown_08208240:: @ 8208240
	.byte 0x01, 0x04, 0x10, 0x40

gStatStageRatios:: @ 8208244
	.byte 10, 40 @ -6
	.byte 10, 35 @ -5
	.byte 10, 30 @ -4
	.byte 10, 25 @ -3
	.byte 10, 20 @ -2
	.byte 10, 15 @ -1
	.byte 10, 10 @  0
	.byte 15, 10 @ +1
	.byte 20, 10 @ +2
	.byte 25, 10 @ +3
	.byte 30, 10 @ +4
	.byte 35, 10 @ +5
	.byte 40, 10 @ +6

@ abbreviation of Game Freak
	.string "ゲーフリ$"

gHoldEffectToType:: @ 8208263
	.byte HOLD_EFFECT_BUG_POWER,      TYPE_BUG
	.byte HOLD_EFFECT_STEEL_POWER,    TYPE_STEEL
	.byte HOLD_EFFECT_GROUND_POWER,   TYPE_GROUND
	.byte HOLD_EFFECT_ROCK_POWER,     TYPE_ROCK
	.byte HOLD_EFFECT_GRASS_POWER,    TYPE_GRASS
	.byte HOLD_EFFECT_DARK_POWER,     TYPE_DARK
	.byte HOLD_EFFECT_FIGHTING_POWER, TYPE_FIGHTING
	.byte HOLD_EFFECT_ELECTRIC_POWER, TYPE_ELECTRIC
	.byte HOLD_EFFECT_WATER_POWER,    TYPE_WATER
	.byte HOLD_EFFECT_FLYING_POWER,   TYPE_FLYING
	.byte HOLD_EFFECT_POISON_POWER,   TYPE_POISON
	.byte HOLD_EFFECT_ICE_POWER,      TYPE_ICE
	.byte HOLD_EFFECT_GHOST_POWER,    TYPE_GHOST
	.byte HOLD_EFFECT_PSYCHIC_POWER,  TYPE_PSYCHIC
	.byte HOLD_EFFECT_FIRE_POWER,     TYPE_FIRE
	.byte HOLD_EFFECT_DRAGON_POWER,   TYPE_DRAGON
	.byte HOLD_EFFECT_NORMAL_POWER,   TYPE_NORMAL
	.byte 0, 0

	.align 2
gSpriteTemplate_8208288:: @ 8208288
	spr_template 0xFFFF, 0, gOamData_81F96F0, NULL, gSpriteImageTable_81E7A10, gSpriteAffineAnimTable_81E7B70, sub_80105A0
	spr_template 0xFFFF, 0, gOamData_81F96E8, NULL, gSpriteImageTable_81E7A30, gSpriteAffineAnimTable_81E7BEC, oac_poke_opponent
	spr_template 0xFFFF, 0, gOamData_81F96F0, NULL, gSpriteImageTable_81E7A50, gSpriteAffineAnimTable_81E7B70, sub_80105A0
	spr_template 0xFFFF, 0, gOamData_81F96E8, NULL, gSpriteImageTable_81E7A70, gSpriteAffineAnimTable_81E7BEC, oac_poke_opponent

gSecretBaseTrainerClasses:: @ 82082E8
	.byte TRAINER_CLASS_YOUNGSTER, TRAINER_CLASS_BUG_CATCHER,  TRAINER_CLASS_RICH_BOY, TRAINER_CLASS_CAMPER,    TRAINER_CLASS_COOL_TRAINER_M
	.byte TRAINER_CLASS_LASS,      TRAINER_CLASS_SCHOOL_KID_F, TRAINER_CLASS_LADY,     TRAINER_CLASS_PICNICKER, TRAINER_CLASS_COOL_TRAINER_F

gUnknown_082082F2:: @ 82082F2
	.byte 0x1A, 0x1B, 0x1C, 0x1D, 0x1F, 0x1E

gUnknown_082082F8:: @ 82082F8
	.byte 1, 1, 3, 2, 4, 6

gUnknown_082082FE:: @ 82082FE
	.byte  5,  3,   2
	.byte  5,  3,   2
	.byte  1,  1,   0
	.byte  3,  2,   1
	.byte  1,  1,   0
	.byte  1,  1,   1
	.byte -1, -1,  -1
	.byte -5, -5, -10
	.byte -5, -5, -10

	.align 1
gUnknown_0820831A:: @ 820831A
	.2byte    0xF
	.2byte   0x13
	.2byte   0x39
	.2byte   0x46
	.2byte   0x94
	.2byte   0xF9
	.2byte   0x7F
	.2byte  0x123
	.2byte 0xFFFF

@ "Nidoran♂" Japanese name
	.string "ニドラン♂$", 11

@ "Nidoran♀" Japanese name
gUnknown_08208337:: @ 8208337
	.string "ニドラン♀$", 13

@ 8208344
	.include "data/sine_table.inc"

@ 82085C4
	.include "data/sine_degree_table.inc"

	.align 2
gBitTable:: @ 820872C
	.4byte 0x00000001
	.4byte 0x00000002
	.4byte 0x00000004
	.4byte 0x00000008
	.4byte 0x00000010
	.4byte 0x00000020
	.4byte 0x00000040
	.4byte 0x00000080
	.4byte 0x00000100
	.4byte 0x00000200
	.4byte 0x00000400
	.4byte 0x00000800
	.4byte 0x00001000
	.4byte 0x00002000
	.4byte 0x00004000
	.4byte 0x00008000
	.4byte 0x00010000
	.4byte 0x00020000
	.4byte 0x00040000
	.4byte 0x00080000
	.4byte 0x00100000
	.4byte 0x00200000
	.4byte 0x00400000
	.4byte 0x00800000
	.4byte 0x01000000
	.4byte 0x02000000
	.4byte 0x04000000
	.4byte 0x08000000
	.4byte 0x10000000
	.4byte 0x20000000
	.4byte 0x40000000
	.4byte 0x80000000

	.align 2
gSpriteTemplate_82087AC:: @ 82087AC
	spr_template 0, 0, gDummyOamData, gDummySpriteAnimTable, NULL, gDummySpriteAffineAnimTable, SpriteCallbackDummy

@ sprite dimensions
	.align 2
gUnknown_082087C4:: @ 82087C4
	@ square
	.byte 1, 1
	.byte 2, 2
	.byte 4, 4
	.byte 8, 8

	@ horizontal rectangle
	.byte 2, 1
	.byte 4, 1
	.byte 4, 2
	.byte 8, 4

	@ vertical rectangle
	.byte 1, 2
	.byte 1, 4
	.byte 2, 4
	.byte 4, 8

@ 82087DC
	.include "data/crc16_table.inc"

	.align 2
gMiscBlank_Gfx:: @ 82089DC
	.incbin "graphics/interface/blank.4bpp"

@ 82091DC
	.include "data/egg_moves.inc"

	.align 2
gUnknown_08209AC4:: @ 8209AC4
	.4byte DaycareText_GetAlongVeryWell
	.4byte DaycareText_GetAlong
	.4byte DaycareText_DontLikeOther
	.4byte DaycareText_PlayOther

gUnknown_08209AD4:: @ 8209AD4
	.string "タマゴ$"

EggPalette:: @ 8209AD8
	.incbin "graphics/pokemon/egg/palette.gbapal"

EggHatchTiles:: @ 8209AF8
	.incbin "graphics/misc/egg_hatch.4bpp"

EggShardTiles:: @ 820A2F8
	.incbin "graphics/misc/egg_shard.4bpp"

	.align 2
gOamData_820A378:: @ 820A378
	.2byte 0x0000
	.2byte 0x8000
	.2byte 0x0400

	.align 2
gSpriteAnim_820A380:: @ 820A380
	obj_image_anim_frame 0, 5
	obj_image_anim_end

	.align 2
gSpriteAnim_820A388:: @ 820A388
	obj_image_anim_frame 16, 5
	obj_image_anim_end

	.align 2
gSpriteAnim_820A390:: @ 820A390
	obj_image_anim_frame 32, 5
	obj_image_anim_end

	.align 2
gSpriteAnim_820A398:: @ 820A398
	obj_image_anim_frame 48, 5
	obj_image_anim_end

	.align 2
gSpriteAnimTable_820A3A0:: @ 820A3A0
	.4byte gSpriteAnim_820A380
	.4byte gSpriteAnim_820A388
	.4byte gSpriteAnim_820A390
	.4byte gSpriteAnim_820A398

	.align 2
gUnknown_0820A3B0:: @ 820A3B0
	obj_tiles EggHatchTiles, 2048, 12345

	.align 2
gUnknown_0820A3B8:: @ 820A3B8
	obj_tiles EggShardTiles, 128, 23456

	.align 2
gUnknown_0820A3C0:: @ 820A3C0
	obj_pal EggPalette, 54321

	.align 2
gSpriteTemplate_820A3C8:: @ 820A3C8
	spr_template 12345, 54321, gOamData_820A378, gSpriteAnimTable_820A3A0, NULL, gDummySpriteAffineAnimTable, SpriteCallbackDummy

	.align 2
gOamData_820A3E0:: @ 820A3E0
	.2byte 0x0000
	.2byte 0x0000
	.2byte 0x0800

	.align 2
gSpriteAnim_820A3E8:: @ 820A3E8
	obj_image_anim_frame 0, 5
	obj_image_anim_end

	.align 2
gSpriteAnim_820A3F0:: @ 820A3F0
	obj_image_anim_frame 1, 5
	obj_image_anim_end

	.align 2
gSpriteAnim_820A3F8:: @ 820A3F8
	obj_image_anim_frame 2, 5
	obj_image_anim_end

	.align 2
gSpriteAnim_820A400:: @ 820A400
	obj_image_anim_frame 3, 5
	obj_image_anim_end

	.align 2
gSpriteAnimTable_820A408:: @ 820A408
	.4byte gSpriteAnim_820A3E8
	.4byte gSpriteAnim_820A3F0
	.4byte gSpriteAnim_820A3F8
	.4byte gSpriteAnim_820A400

	.align 2
gSpriteTemplate_820A418:: @ 820A418
	spr_template 23456, 54321, gOamData_820A3E0, gSpriteAnimTable_820A408, NULL, gDummySpriteAffineAnimTable, SpriteCB_EggShard

@ The values are Q8.8 fixed-point numbers.
	.align 1
gEggShardVelocities:: @ 820A430
	.2byte 0xFE80, 0xFC40 @ (-1.5, -3.75)
	.2byte 0xFB00, 0xFD00 @ (-5, -3)
	.2byte 0x0380, 0xFD00 @ (3.5, -3)
	.2byte 0xFC00, 0xFC40 @ (-4, -3.75)
	.2byte 0x0200, 0xFE80 @ (2, -1.5)
	.2byte 0xFF80, 0xF940 @ (-0.5, -6.75)
	.2byte 0x0500, 0xFDC0 @ (5, -2.25)
	.2byte 0xFE80, 0xFC40 @ (-1.5, -3.75)
	.2byte 0x0480, 0xFE80 @ (4.5, -1.5)
	.2byte 0xFF00, 0xF940 @ (-1, -6.75)
	.2byte 0x0400, 0xFDC0 @ (4, -2.25)
	.2byte 0xFC80, 0xFC40 @ (-3.5, -3.75)
	.2byte 0x0100, 0xFE80 @ (1, -1.5)
	.2byte 0xFC7C, 0xF940 @ (-3.515625, -6.75)
	.2byte 0x0480, 0xFDC0 @ (4.5, -2.25)
	.2byte 0xFF80, 0xF880 @ (-0.5, -7.5)
	.2byte 0x0100, 0xFB80 @ (1, -4.5)
	.2byte 0xFD80, 0xFDC0 @ (-2.5, -2.25)
	.2byte 0x0280, 0xF880 @ (2.5, -7.5)

	.align 2
gUnknown_0820A47C:: @ 820A47C
	obj_tiles gBattleWindowLargeGfx, 4096, 0xd6ff

	.align 2
gUnknown_0820A484:: @ 820A484
	obj_tiles gBattleWindowSmallGfx, 4096, 0xd701

	.align 2
gUnknown_0820A48C:: @ 820A48C
	obj_tiles gBattleWindowSmall2Gfx, 2048, 0xd6ff

	.align 2
gUnknown_0820A494:: @ 820A494
	obj_tiles gBattleWindowSmall2Gfx, 2048, 0xd700

	.align 2
gUnknown_0820A49C:: @ 820A49C
	obj_tiles gBattleWindowSmall3Gfx, 2048, 0xd701

	.align 2
gUnknown_0820A4A4:: @ 820A4A4
	obj_tiles gBattleWindowSmall3Gfx, 2048, 0xd702

	.align 2
gUnknown_0820A4AC:: @ 820A4AC
	obj_tiles gBattleWindowLarge2Gfx, 4096, 0xd70b

	.align 2
gUnknown_0820A4B4:: @ 820A4B4
	obj_tiles gBlankGfxCompressed, 256, 0xd704
	obj_tiles gBlankGfxCompressed, 288, 0xd705
	obj_tiles gBlankGfxCompressed, 256, 0xd706
	obj_tiles gBlankGfxCompressed, 288, 0xd707

	.align 2
gUnknown_0820A4D4:: @ 820A4D4
	obj_pal gUnknown_08D1212C, 0xD6FF
	obj_pal gUnknown_08D1214C, 0xD704

	.align 2
gOamData_820A4E4:: @ 820A4E4
	.2byte 0x4000
	.2byte 0xC000
	.2byte 0x0400

	.align 2
gSpriteTemplate_820A4EC:: @ 820A4EC
	spr_template 55039, 55039, gOamData_820A4E4, gDummySpriteAnimTable, NULL, gDummySpriteAffineAnimTable, SpriteCallbackDummy

	.align 2
gSpriteTemplate_820A504:: @ 820A504
	spr_template 55040, 55039, gOamData_820A4E4, gDummySpriteAnimTable, NULL, gDummySpriteAffineAnimTable, SpriteCallbackDummy

	.align 2
gSpriteTemplate_820A51C:: @ 820A51C
	spr_template 55041, 55039, gOamData_820A4E4, gDummySpriteAnimTable, NULL, gDummySpriteAffineAnimTable, SpriteCallbackDummy

	.align 2
gSpriteTemplate_820A534:: @ 820A534
	spr_template 55042, 55039, gOamData_820A4E4, gDummySpriteAnimTable, NULL, gDummySpriteAffineAnimTable, SpriteCallbackDummy

	.align 2
gSpriteTemplate_820A54C:: @ 820A54C
	spr_template 55051, 55039, gOamData_820A4E4, gDummySpriteAnimTable, NULL, gDummySpriteAffineAnimTable, SpriteCallbackDummy

	.align 2
gOamData_820A564:: @ 820A564
	.2byte 0x4000
	.2byte 0x4000
	.2byte 0x0400

	.align 2
gSpriteTemplate_820A56C:: @ 820A56C
	spr_template 55044, 55044, gOamData_820A564, gDummySpriteAnimTable, NULL, gDummySpriteAffineAnimTable, sub_8043CEC

	.align 2
gSpriteTemplate_820A584:: @ 820A584
	spr_template 55045, 55044, gOamData_820A564, gDummySpriteAnimTable, NULL, gDummySpriteAffineAnimTable, sub_8043CEC

	.align 2
gSpriteTemplate_820A59C:: @ 820A59C
	spr_template 55046, 55044, gOamData_820A564, gDummySpriteAnimTable, NULL, gDummySpriteAffineAnimTable, sub_8043CEC

	.align 2
gSpriteTemplate_820A5B4:: @ 820A5B4
	spr_template 55047, 55044, gOamData_820A564, gDummySpriteAnimTable, NULL, gDummySpriteAffineAnimTable, sub_8043CEC

	.align 2
gSubspriteTable_820A5CC:: @ 820A5CC
	subsprite -16,   0, 1,   0, 64x32
	subsprite  48,   0, 1,  32, 32x32
	subsprite -16,  32, 1,  48, 32x8
	subsprite  16,  32, 1,  52, 32x8
	subsprite  48,  32, 1,  56, 32x8

	.align 2
gSubspriteTable_820A5F4:: @ 820A5F4
	subsprite -16,   0, 1,  64, 64x32
	subsprite  48,   0, 1,  96, 32x32
	subsprite -16,  32, 1, 112, 32x8
	subsprite  16,  32, 1, 116, 32x8
	subsprite  48,  32, 1, 120, 32x8

	.align 2
gSubspriteTable_820A61C:: @ 820A61C
	subsprite -16,   0, 1,   0, 64x32
	subsprite  48,   0, 1,  32, 32x32

	.align 2
gSubspriteTable_820A62C:: @ 820A62C
	subsprite -16,   0, 1,   0, 64x32
	subsprite  48,   0, 1,  32, 32x32

	.align 2
gSubspriteTable_820A63C:: @ 820A63C
	subsprite -16,   0, 1,   0, 32x8
	subsprite  16,   0, 1,   4, 32x8

	.align 2
gSubspriteTable_820A64C:: @ 820A64C
	subsprite -16,   0, 1,   0, 32x8
	subsprite  16,   0, 1,   4, 32x8
	subsprite -32,   0, 1,   8,  8x8

@ unreferenced
	.align 2
	.4byte 5, gSubspriteTable_820A5CC
	.4byte 2, gSubspriteTable_820A61C
	.4byte 5, gSubspriteTable_820A5F4
	.4byte 2, gSubspriteTable_820A62C

	.align 2
gSubspriteTables_820A684:: @ 820A684
	.4byte 2, gSubspriteTable_820A63C
	.4byte 3, gSubspriteTable_820A64C

	.align 2
gSubspriteTable_820A694:: @ 820A694
	subsprite -96,   0, 1,  0, 32x8
	subsprite -64,   0, 1,  4, 32x8
	subsprite -32,   0, 1,  8, 32x8
	subsprite   0,   0, 1, 12, 32x8

	.align 2
gSubspriteTable_820A6B4:: @ 820A6B4
	subsprite -96,   0, 1,  0, 32x8
	subsprite -64,   0, 1,  4, 32x8
	subsprite -32,   0, 1,  8, 32x8
	subsprite   0,   0, 1,  8, 32x8
	subsprite  32,   0, 1,  8, 32x8
	subsprite  64,   0, 1, 12, 32x8

	.align 2
gSubspriteTables_820A6E4:: @ 820A6E4
	.4byte 4, gSubspriteTable_820A694

	.align 2
gSubspriteTables_820A6EC:: @ 820A6EC
	.4byte 6, gSubspriteTable_820A6B4

@ unused dakuten/handakuten tiles
	.incbin "graphics/unused/dakuten.4bpp"

	.align 2
gUnknown_0820A754:: @ 820A754
	obj_tiles gBattleGfx_BallStatusBar, 512, 0xd70c
	obj_tiles gBattleGfx_BallStatusBar, 512, 0xd70d

	.align 2
gUnknown_0820A764:: @ 820A764
	obj_pal gUnknown_08D1212C, 0xd710
	obj_pal gUnknown_08D1212C, 0xd711

	.align 2
gUnknown_0820A774:: @ 820A774
	obj_pal gUnknown_08D1214C, 0xd712
	obj_pal gUnknown_08D1214C, 0xd713

	.align 2
gUnknown_0820A784:: @ 820A784
	obj_tiles Tiles_D129AC, 0x80, 0xd714
	obj_tiles Tiles_D129AC, 0x80, 0xd715

	.align 2
gOamData_820A794:: @ 820A794
	.2byte 0x4000
	.2byte 0xC000
	.2byte 0x0400

	.align 2
gOamData_820A79C:: @ 820A79C
	.2byte 0x0000
	.2byte 0x0000
	.2byte 0x0400

	.align 2
gSpriteTemplate_820A7A4:: @ 820A7A4
	spr_template 55052, 55056, gOamData_820A4E4, gDummySpriteAnimTable, NULL, gDummySpriteAffineAnimTable, sub_8045030

	.align 2
gSpriteTemplate_820A7BC:: @ 820A7BC
	spr_template 55053, 55057, gOamData_820A4E4, gDummySpriteAnimTable, NULL, gDummySpriteAffineAnimTable, sub_8045030

	.align 2
gSpriteTemplate_820A7D4:: @ 820A7D4
	spr_template 55060, 55058, gOamData_820A79C, gDummySpriteAnimTable, NULL, gDummySpriteAffineAnimTable, sub_804507C

	.align 2
gSpriteTemplate_820A7EC:: @ 820A7EC
	spr_template 55061, 55059, gOamData_820A79C, gDummySpriteAnimTable, NULL, gDummySpriteAffineAnimTable, sub_804507C

	.align 2
gUnknown_0820A804:: @ 820A804
	.4byte OBJ_VRAM0 + 0x940
	.4byte OBJ_VRAM0 + 0x960

	.align 2
gUnknown_0820A80C:: @ 820A80C
	.4byte OBJ_VRAM0 + 0x520
	.4byte OBJ_VRAM0 + 0x540

	.align 2
gUnknown_0820A814:: @ 820A814
	.4byte OBJ_VRAM0 + 0x540
	.4byte OBJ_VRAM0 + 0x560

gUnknown_0820A81C:: @ 820A81C
	.string "{COLOR DARK_GREY}{HIGHLIGHT RED}                        "

	.align 2
gUnknown_0820A83C:: @ 820A83C
	.4byte OBJ_VRAM0 + 0x3E0
	.4byte OBJ_VRAM0 + 0xB00
	.4byte OBJ_VRAM0 + 0xB20

	.align 2
gUnknown_0820A848:: @ 820A848
	.4byte OBJ_VRAM0 + 0x2C0
	.4byte OBJ_VRAM0 + 0x2E0
	.4byte OBJ_VRAM0 + 0x600

	.align 2
gUnknown_0820A854:: @ 820A854
	.4byte OBJ_VRAM0 + 0xB40
	.4byte OBJ_VRAM0 + 0xB60

	.align 2
gUnknown_0820A85C:: @ 820A85C
	.4byte OBJ_VRAM0 + 0x620
	.4byte OBJ_VRAM0 + 0x640

gUnknown_0820A864:: @ 820A864
	.string "{COLOR DARK_GREY}{HIGHLIGHT RED}              /$"

	.align 2
gUnknown_0820A87C:: @ 820A87C
	.4byte OBJ_VRAM0
	.4byte OBJ_VRAM0 + 0x20
	.4byte OBJ_VRAM0 + 0x40
	.4byte OBJ_VRAM0 + 0x60
	.4byte OBJ_VRAM0 + 0x80
	.4byte OBJ_VRAM0 + 0xA0

	.align 2
gUnknown_0820A894:: @ 820A894
	.4byte OBJ_VRAM0 + 0xC0
	.4byte OBJ_VRAM0 + 0xE0

gUnknown_0820A89C:: @ 820A89C
	.string "{COLOR DARK_GREY}{HIGHLIGHT TRANSPARENT}              "

gUnknown_0820A8B0:: @ 820A8B0
	.string "{HIGHLIGHT RED}$"

	.align 2
gUnknown_0820A8B4:: @ 820A8B4
	.4byte OBJ_VRAM0 + 0x40
	.4byte OBJ_VRAM0 + 0x60
	.4byte OBJ_VRAM0 + 0x80
	.4byte OBJ_VRAM0 + 0xA0
	.4byte OBJ_VRAM0 + 0xC0
	.4byte OBJ_VRAM0 + 0xE0
	.4byte OBJ_VRAM0 + 0x800
	.4byte OBJ_VRAM0 + 0x820
	.4byte OBJ_VRAM0 + 0x840
	.4byte OBJ_VRAM0 + 0x860

	.align 2
gUnknown_0820A8DC:: @ 820A8DC
	.4byte OBJ_VRAM0 + 0x20
	.4byte OBJ_VRAM0 + 0x40
	.4byte OBJ_VRAM0 + 0x60
	.4byte OBJ_VRAM0 + 0x80
	.4byte OBJ_VRAM0 + 0xA0
	.4byte OBJ_VRAM0 + 0xC0
	.4byte OBJ_VRAM0 + 0xE0
	.4byte OBJ_VRAM0 + 0x400
	.4byte OBJ_VRAM0 + 0x420
	.4byte OBJ_VRAM0 + 0x440

	.align 2
gUnknown_0820A904:: @ 820A904
	.4byte OBJ_VRAM0 + 0x40
	.4byte OBJ_VRAM0 + 0x60
	.4byte OBJ_VRAM0 + 0x80
	.4byte OBJ_VRAM0 + 0xA0
	.4byte OBJ_VRAM0 + 0xC0
	.4byte OBJ_VRAM0 + 0xE0
	.4byte OBJ_VRAM0 + 0x400
	.4byte OBJ_VRAM0 + 0x420
	.4byte OBJ_VRAM0 + 0x440
	.4byte OBJ_VRAM0 + 0x460

	.align 2
gUnknown_0820A92C:: @ 820A92C @ graphics
	obj_tiles gInterfaceGfx_PokeBall, 384, 0xd6d8 @ poke
	obj_tiles gInterfaceGfx_GreatBall, 384, 0xd6d9 @ great
	obj_tiles gInterfaceGfx_SafariBall, 384, 0xd6da @ safari
	obj_tiles gInterfaceGfx_UltraBall, 384, 0xd6db @ ultra
	obj_tiles gInterfaceGfx_MasterBall, 384, 0xd6dc @ master
	obj_tiles gInterfaceGfx_NetBall, 384, 0xd6dd @ net
	obj_tiles gInterfaceGfx_DiveBall, 384, 0xd6de @ dive
	obj_tiles gInterfaceGfx_NestBall, 384, 0xd6df @ nest
	obj_tiles gInterfaceGfx_RepeatBall, 384, 0xd6e0 @ repeat
	obj_tiles gInterfaceGfx_TimerBall, 384, 0xd6e1 @ timer
	obj_tiles gInterfaceGfx_LuxuryBall, 384, 0xd6e2 @ luxury
	obj_tiles gInterfaceGfx_PremierBall, 384, 0xd6e3 @ premier

	.align 2
gUnknown_0820A98C:: @ 820A98C
	obj_pal gInterfacePal_PokeBall, 0xD6D8 @ poke
	obj_pal gInterfacePal_GreatBall, 0xD6D9 @ great
	obj_pal gInterfacePal_SafariBall, 0xD6DA @ safari
	obj_pal gInterfacePal_UltraBall, 0xD6DB @ ultra
	obj_pal gInterfacePal_MasterBall, 0xD6DC @ master
	obj_pal gInterfacePal_NetBall, 0xD6DD @ net
	obj_pal gInterfacePal_DiveBall, 0xD6DE @ dive
	obj_pal gInterfacePal_NestBall, 0xD6DF @ nest
	obj_pal gInterfacePal_RepeatBall, 0xD6E0 @ repeat
	obj_pal gInterfacePal_TimerBall, 0xD6E1 @ timer
	obj_pal gInterfacePal_LuxuryBall, 0xD6E2 @ luxury
	obj_pal gInterfacePal_PremierBall, 0xD6E3 @ premier

	.align 2
gOamData_820A9EC:: @ 820A9EC
	.2byte 0x0300
	.2byte 0x4000
	.2byte 0x0800

	.align 2
gSpriteAnim_820A9F4: @ 820A9F4
	obj_image_anim_frame 0, 5
	obj_image_anim_jump 0

	.align 2
gSpriteAnim_820A9FC: @ 820A9FC
	obj_image_anim_frame 4, 1
	obj_image_anim_jump 0

	.align 2
gSpriteAnim_820AA04: @ 820AA04
	obj_image_anim_frame 8, 5
	obj_image_anim_jump 0

	.align 2
gSpriteAnim_820AA0C: @ 820AA0C
	obj_image_anim_frame 12, 1
	obj_image_anim_jump 0

	.align 2
gSpriteAnim_820AA14:: @ 820AA14
	obj_image_anim_frame 0, 1
	obj_image_anim_end

	.align 2
gSpriteAnim_820AA1C:: @ 820AA1C
	obj_image_anim_frame 4, 5
	obj_image_anim_frame 8, 5
	obj_image_anim_end

	.align 2
gSpriteAnim_820AA28:: @ 820AA28
	obj_image_anim_frame 4, 5
	obj_image_anim_frame 0, 5
	obj_image_anim_end

	.align 2
gSpriteAnimTable_820AA34:: @ 820AA34
	.4byte gSpriteAnim_820AA14
	.4byte gSpriteAnim_820AA1C
	.4byte gSpriteAnim_820AA28

	@ unused?
	.4byte gSpriteAnim_820A9F4
	.4byte gSpriteAnim_820AA04
	.4byte gSpriteAnim_820A9FC
	.4byte gSpriteAnim_820AA0C

	.align 2
gSpriteAffineAnim_820AA50:: @ 820AA50
	obj_rot_scal_anim_frame 0x0, 0x0, 0, 1
	obj_rot_scal_anim_jump 0

	.align 2
gSpriteAffineAnim_820AA60:: @ 820AA60
	obj_rot_scal_anim_frame 0x0, 0x0, -3, 1
	obj_rot_scal_anim_jump 0

	.align 2
gSpriteAffineAnim_820AA70:: @ 820AA70
	obj_rot_scal_anim_frame 0x0, 0x0, 3, 1
	obj_rot_scal_anim_jump 0

	.align 2
gSpriteAffineAnim_820AA80:: @ 820AA80
	obj_rot_scal_anim_frame 0x100, 0x100, 0, 0
	obj_rot_scal_anim_end

	.align 2
gSpriteAffineAnim_820AA90:: @ 820AA90
	obj_rot_scal_anim_frame 0x0, 0x0, 25, 1
	obj_rot_scal_anim_jump 0

	.align 2
gSpriteAffineAnimTable_820AAA0:: @ 820AAA0
	.4byte gSpriteAffineAnim_820AA50
	.4byte gSpriteAffineAnim_820AA60
	.4byte gSpriteAffineAnim_820AA70
	.4byte gSpriteAffineAnim_820AA80
	.4byte gSpriteAffineAnim_820AA90

	.align 2
gSpriteTemplate_820AAB4:: @ 820AAB4
	spr_template 55000, 55000, gOamData_820A9EC, gSpriteAnimTable_820AA34, NULL, gSpriteAffineAnimTable_820AAA0, objc_0804ABD4
	spr_template 55001, 55001, gOamData_820A9EC, gSpriteAnimTable_820AA34, NULL, gSpriteAffineAnimTable_820AAA0, objc_0804ABD4
	spr_template 55002, 55002, gOamData_820A9EC, gSpriteAnimTable_820AA34, NULL, gSpriteAffineAnimTable_820AAA0, objc_0804ABD4
	spr_template 55003, 55003, gOamData_820A9EC, gSpriteAnimTable_820AA34, NULL, gSpriteAffineAnimTable_820AAA0, objc_0804ABD4
	spr_template 55004, 55004, gOamData_820A9EC, gSpriteAnimTable_820AA34, NULL, gSpriteAffineAnimTable_820AAA0, objc_0804ABD4
	spr_template 55005, 55005, gOamData_820A9EC, gSpriteAnimTable_820AA34, NULL, gSpriteAffineAnimTable_820AAA0, objc_0804ABD4
	spr_template 55006, 55006, gOamData_820A9EC, gSpriteAnimTable_820AA34, NULL, gSpriteAffineAnimTable_820AAA0, objc_0804ABD4
	spr_template 55007, 55007, gOamData_820A9EC, gSpriteAnimTable_820AA34, NULL, gSpriteAffineAnimTable_820AAA0, objc_0804ABD4
	spr_template 55008, 55008, gOamData_820A9EC, gSpriteAnimTable_820AA34, NULL, gSpriteAffineAnimTable_820AAA0, objc_0804ABD4
	spr_template 55009, 55009, gOamData_820A9EC, gSpriteAnimTable_820AA34, NULL, gSpriteAffineAnimTable_820AAA0, objc_0804ABD4
	spr_template 55010, 55010, gOamData_820A9EC, gSpriteAnimTable_820AA34, NULL, gSpriteAffineAnimTable_820AAA0, objc_0804ABD4
	spr_template 55011, 55011, gOamData_820A9EC, gSpriteAnimTable_820AA34, NULL, gSpriteAffineAnimTable_820AAA0, objc_0804ABD4

	.align 2
	.byte 0x90, 0x08, 0x00, 0x00
	.byte 0xC0, 0x3A, 0x00, 0x00
	.byte 0x1C, 0x00, 0x00, 0x00
	.byte 0x30, 0x05, 0x00, 0x00
	.byte 0x24, 0x00, 0x00, 0x00
	.byte 0x64, 0x00, 0x00, 0x00
	.byte 0xD8, 0x04, 0x00, 0x00

	.align 1
gTradeMovesBoxTilemap:: @ 820ABF0
	.incbin "graphics/trade/moves_box_map.bin"

	.align 1
gTradePartyBoxTilemap:: @ 820ADEE
	.incbin "graphics/trade/party_box_map.bin"

	.align 2
gTradeStripesBG2Tilemap:: @ 820AFEC
	.incbin "graphics/trade/stripes_bg2_map.bin"

	.align 2
gTradeStripesBG3Tilemap:: @ 820B7EC
	.incbin "graphics/trade/stripes_bg3_map.bin"

	.align 2
gOamData_820BFEC:: @ 820BFEC
	.2byte 0x4000
	.2byte 0x8000
	.2byte 0x0400

	.align 2
gSpriteAnim_820BFF4:: @ 820BFF4
	obj_image_anim_frame 0, 5
	obj_image_anim_end

	.align 2
gSpriteAnim_820BFFC:: @ 820BFFC
	obj_image_anim_frame 8, 5
	obj_image_anim_end

	.align 2
gSpriteAnim_820C004:: @ 820C004
	obj_image_anim_frame 16, 5
	obj_image_anim_end

	.align 2
gSpriteAnim_820C00C:: @ 820C00C
	obj_image_anim_frame 24, 5
	obj_image_anim_end

	.align 2
gSpriteAnim_820C014:: @ 820C014
	obj_image_anim_frame 32, 5
	obj_image_anim_end

	.align 2
gSpriteAnim_820C01C:: @ 820C01C
	obj_image_anim_frame 40, 5
	obj_image_anim_end

	.align 2
gSpriteAnimTable_820C024:: @ 820C024
	.4byte gSpriteAnim_820BFF4
	.4byte gSpriteAnim_820BFFC
	.4byte gSpriteAnim_820C004
	.4byte gSpriteAnim_820C00C
	.4byte gSpriteAnim_820C014
	.4byte gSpriteAnim_820C01C

	.align 2
TradeScreenTextPalette: @ 820C03C
	.incbin "graphics/trade/text1.gbapal"
	.incbin "graphics/trade/text2.gbapal" @ unused?

	.align 2
gUnknown_0820C07C:: @ 820C07C
	obj_tiles 0x0201d000, 256, 0x00c8
	obj_tiles 0x0201d100, 256, 0x00c9
	obj_tiles 0x0201d200, 256, 0x00ca
	obj_tiles 0x0201d300, 256, 0x00cb
	obj_tiles 0x0201d400, 256, 0x00cc
	obj_tiles 0x0201d500, 256, 0x00cd
	obj_tiles 0x0201d600, 256, 0x00ce
	obj_tiles 0x0201d700, 256, 0x00cf
	obj_tiles 0x0201d800, 256, 0x00d0
	obj_tiles 0x0201d900, 256, 0x00d1
	obj_tiles 0x0201da00, 256, 0x00d2
	obj_tiles 0x0201db00, 256, 0x00d3
	obj_tiles 0x0201dc00, 256, 0x00d4

	.align 2
gSpritePalette_TradeScreenText:: @ 820C0E4
	obj_pal TradeScreenTextPalette, 4925

	.align 2
gSpriteTemplate_820C0EC:: @ 820C0EC
	spr_template 200, 4925, gOamData_820BFEC, gSpriteAnimTable_820C024, NULL, gDummySpriteAffineAnimTable, SpriteCallbackDummy

	.align 2
gOamData_820C104:: @ 820C104
	.2byte 0x4000
	.2byte 0xC000
	.2byte 0x0400

	.align 2
gSpriteAnim_820C10C:: @ 820C10C
	obj_image_anim_frame 0, 5
	obj_image_anim_end

	.align 2
gSpriteAnim_820C114:: @ 820C114
	obj_image_anim_frame 32, 5
	obj_image_anim_end

	.align 2
gSpriteAnimTable_820C11C:: @ 820C11C
	.4byte gSpriteAnim_820C10C
	.4byte gSpriteAnim_820C114

	.align 2
gUnknown_0820C124:: @ 820C124
	obj_tiles gUnknown_08EA1DEC, 0x800, 300

	.align 2
gUnknown_0820C12C:: @ 820C12C
	obj_pal gUnknown_08EA0328, 2345

	.align 2
gSpriteTemplate_820C134:: @ 820C134
	spr_template 300, 2345, gOamData_820C104, gSpriteAnimTable_820C11C, NULL, gDummySpriteAffineAnimTable, SpriteCallbackDummy

	.align 2
gUnknown_0820C14C:: @ 820C14C
	.4byte TradeText_Cancel
	.4byte TradeText_ChoosePoke
	.4byte TradeText_Summary1
	.4byte TradeText_Trade1
	.4byte TradeText_CancelTradePrompt
	.4byte TradeText_PressBToExit

@ This is used to determine the next mon to select when the D-Pad is
@ pressed in a given direction.
@ Note that the mons are laid out like this.
@ 0-5 are the player's party and 6-11 are the trading partner's party.
@ 12 is the cancel button.
@  0  1  6  7
@  2  3  8  9
@  4  5 10 11
@          12
gTradeNextSelectedMonTable:: @ 820C164
	@ 0
	.byte  4,  2, 12, 12,  0,  0 @ up
	.byte  2,  4, 12, 12,  0,  0 @ down
	.byte  7,  6,  1,  0,  0,  0 @ left
	.byte  1,  6,  7,  0,  0,  0 @ right
	@ 1
	.byte  5,  3, 12, 12,  0,  0 @ up
	.byte  3,  5, 12, 12,  0,  0 @ down
	.byte  0,  7,  6,  1,  0,  0 @ left
	.byte  6,  7,  0,  1,  0,  0 @ right
	@ 2
	.byte  0,  0,  0,  0,  0,  0 @ up
	.byte  4,  0,  0,  0,  0,  0 @ down
	.byte  9,  8,  7,  6,  0,  0 @ left
	.byte  3,  1,  0,  0,  0,  0 @ right
	@ 3
	.byte  1,  1,  1,  1,  0,  0 @ up
	.byte  5,  1,  1,  1,  0,  0 @ down
	.byte  2,  9,  8,  7,  0,  0 @ left
	.byte  8,  9,  6,  6,  0,  0 @ right
	@ 4
	.byte  2,  2,  2,  2,  0,  0 @ up
	.byte  0,  0,  0,  0,  0,  0 @ down
	.byte 11, 10,  9,  8,  7,  6 @ left
	.byte  5,  3,  1,  0,  0,  0 @ right
	@ 5
	.byte  3,  3,  3,  3,  0,  0 @ up
	.byte  1,  1,  1,  1,  0,  0 @ down
	.byte  4,  4,  4,  4,  0,  0 @ left
	.byte 10,  8,  6,  0,  0,  0 @ right
	@ 6
	.byte 10,  8, 12,  0,  0,  0 @ up
	.byte  8, 10, 12,  0,  0,  0 @ down
	.byte  1,  0,  0,  0,  0,  0 @ left
	.byte  7,  0,  1,  0,  0,  0 @ right
	@ 7
	.byte 12,  0,  0,  0,  0,  0 @ up
	.byte  9, 12,  0,  0,  0,  0 @ down
	.byte  6,  0,  0,  0,  0,  0 @ left
	.byte  0,  0,  0,  0,  0,  0 @ right
	@ 8
	.byte  6,  0,  0,  0,  0,  0 @ up
	.byte 10,  6,  0,  0,  0,  0 @ down
	.byte  3,  2,  1,  0,  0,  0 @ left
	.byte  9,  7,  0,  0,  0,  0 @ right
	@ 9
	.byte  7,  0,  0,  0,  0,  0 @ up
	.byte 11, 12,  0,  0,  0,  0 @ down
	.byte  8,  0,  0,  0,  0,  0 @ left
	.byte  2,  1,  0,  0,  0,  0 @ right
	@ 10
	.byte  8,  0,  0,  0,  0,  0 @ up
	.byte  6,  0,  0,  0,  0,  0 @ down
	.byte  5,  4,  3,  2,  1,  0 @ left
	.byte 11,  9,  7,  0,  0,  0 @ right
	@ 11
	.byte  9,  0,  0,  0,  0,  0 @ up
	.byte 12,  0,  0,  0,  0,  0 @ down
	.byte 10,  0,  0,  0,  0,  0 @ left
	.byte  4,  2,  0,  0,  0,  0 @ right
	@ 12
	.byte 11,  9,  7,  6,  0,  0 @ up
	.byte  7,  6,  0,  0,  0,  0 @ down
	.byte 12,  0,  0,  0,  0,  0 @ left
	.byte 12,  0,  0,  0,  0,  0 @ right

@ The coordinates are in units of tiles.
@ These are used for both mon icons and the selected mon cursor,
@ but the origins of the coordinates differ.
gTradeMonSpriteCoords:: @ 820C29C
	@ left-side party
	.byte  1,  5
	.byte  8,  5
	.byte  1, 10
	.byte  8, 10
	.byte  1, 15
	.byte  8, 15

	@ right-side party
	.byte 16,  5
	.byte 23,  5
	.byte 16, 10
	.byte 23, 10
	.byte 16, 15
	.byte 23, 15

	@ cancel button
	.byte 23, 18

gTradeLevelDisplayCoords:: @ 820C2B6
	@ left-side party
	.byte  5,  4
	.byte 12,  4
	.byte  5,  9
	.byte 12,  9
	.byte  5, 14
	.byte 12, 14

	@ right-side party
	.byte 20,  4
	.byte 27,  4
	.byte 20,  9
	.byte 27,  9
	.byte 20, 14
	.byte 27, 14

gTradeMonBoxCoords:: @ 820C2CE
	@ left-side party
	.byte  1,  3
	.byte  8,  3
	.byte  1,  8
	.byte  8,  8
	.byte  1, 13
	.byte  8, 13

	@ right-side party
	.byte 16,  3
	.byte 23,  3
	.byte 16,  8
	.byte 23,  8
	.byte 16, 13
	.byte 23, 13

gTradeUnknownSpriteCoords:: @ 820C2E6
	.byte  59, 10
	.byte 179, 10
	.byte  59, 10
	.byte 179, 10

	.align 2
gUnknown_0820C2F0:: @ 820C2F0
	.4byte TradeText_LinkStandby
	.4byte TradeText_TradeCancelled
	.4byte TradeText_OnlyPoke
	.4byte TradeText_NonTradablePoke
	.4byte TradeText_WaitingForFriend
	.4byte TradeText_WantToTrade

gTradeMessageWindowRects:: @ 820C308
	.byte 8, 7, 22, 12
	.byte 8, 7, 22, 12
	.byte 6, 7, 24, 12
	.byte 6, 7, 24, 12
	.byte 8, 7, 22, 12
	.byte 7, 7, 23, 12

	.align 2
gUnknown_0820C320:: @ 820C320
	.4byte TradeText_Summary2, sub_804A9F4 @unknown
	.4byte TradeText_Trade2, sub_804AA00

gUnknown_0820C330:: @ 820C330
	.byte 0, 14
	.byte 15, 29

gUnknown_0820C334:: @ 820C334
	.byte 3, 5
	.byte 3, 7
	.byte 18, 5
	.byte 18, 7

gOtherText_Terminator::
	.string "$"

gOtherText_MaleSymbol3:: @ 820C33D
	.string "♂$"

gOtherText_FemaleSymbol3:: @ 820C33F
	.string "♀$"

gOtherText_GenderlessSymbol:: @ 820C341
	.string "$$"

	.align 2
	.4byte gTileBuffer

@ Unused debug strings?
	.string "かいめの そうしん$", 13
	.string "かいめの じゅしん$", 13
	.string "ポケモンアイコンセット$", 13
	.string "OBJテキストセット$", 13
	.string "セルセット$", 13
	.string "OBJテキストADD$", 13
	.string "システムメッセージADD$", 13
	.string "はいけいセット$", 13

@ Shedinja's Japanese name
@ sub_8048D44 compares a pokemon name with this string
gUnknown_0820C3B0:: @ 820C3B0
	.string "ヌケニン$"

	.string "こうかんせいりつ     $" @ trade completed
	.string "だめだたらしいよ     $" @ it's no good (trade failed maybe?)

gUnknown_0820C3D1:: @ 820C3D1
	.byte 4, 3
	.byte 19, 3

	.align 2
gTradeBallPalette:: @ 820C3D8
	.incbin "graphics/trade/ball.gbapal"

	.align 2
gTradeBallTiles:: @ 820C3F8
	.incbin "graphics/trade/ball.4bpp"

	.align 2
gUnknown_0820C9F8:: @ 820C9F8
	.incbin "graphics/trade/unknown.gbapal"
	.incbin "graphics/trade/gba.gbapal"
	.incbin "graphics/trade/shadow.gbapal"
	.space 32
	.incbin "graphics/trade/misc.gbapal"

	.align 2
gUnknown_0820CA98:: @ 820CA98
	.incbin "graphics/trade/gba.4bpp"
	.incbin "graphics/trade/shadow.4bpp"

	.align 2
gUnknown_0820DD98:: @ 820DD98
	.incbin "graphics/trade/pokeball_symbol.8bpp"

	.align 2
gUnknown_0820F798:: @ 820F798
	.incbin "graphics/trade/shadow_map.bin"

	.align 2
gUnknown_08210798:: @ 8210798
	.incbin "graphics/trade/gba_map.bin"

	.align 2
gUnknown_08211798:: @ 8211798
	.incbin "graphics/trade/cable_closeup_map.bin"

	.align 2
gUnknown_08211F98:: @ 8211F98
	.incbin "graphics/trade/pokeball_symbol_map.bin"

	.incbin "graphics/unused/unknown/8212098.gbapal"

	.align 2
gTradeCableEndPalette:: @ 82120B8
	.incbin "graphics/trade/cable_end.gbapal"

	.incbin "graphics/unused/unknown/82120D8.gbapal"

	.space 32

	.align 2
gTradeGlowPalette:: @ 8212118
	.incbin "graphics/trade/glow.gbapal"

	.align 2
gTradeGlow1Tiles:: @ 8212138
	.incbin "graphics/trade/glow1.4bpp"

	.align 2
gTradeGlow2Tiles:: @ 8212338
	.incbin "graphics/trade/glow2.4bpp"

	.align 2
gTradeCableEndTiles:: @ 8212538
	.incbin "graphics/trade/cable_end.4bpp"

	.align 2
gTradeGBAScreenTiles:: @ 8212738
	.incbin "graphics/trade/gba_screen.4bpp"

	.align 2
gUnknown_08213738:: @ 8213738
	.incbin "graphics/trade/gba_affine.8bpp"

	.align 2
gUnknown_08215778:: @ 8215778
	.incbin "graphics/trade/gba_affine_map.bin"

	.align 2
gOamData_8215878:: @ 8215878
	.2byte 0x0100
	.2byte 0x4000
	.2byte 0x0000

	.align 2
gSpriteAnim_8215880:: @ 8215880
	obj_image_anim_frame 0, 3
	obj_image_anim_frame 4, 3
	obj_image_anim_frame 8, 3
	obj_image_anim_frame 12, 3
	obj_image_anim_frame 16, 3
	obj_image_anim_frame 20, 3
	obj_image_anim_frame 24, 3
	obj_image_anim_frame 28, 3
	obj_image_anim_frame 32, 3
	obj_image_anim_frame 36, 3
	obj_image_anim_frame 40, 3
	obj_image_anim_frame 44, 3
	obj_image_anim_loop 1
	obj_image_anim_frame 0, 3
	obj_image_anim_end

	.align 2
gSpriteAnim_82158BC:: @ 82158BC
	obj_image_anim_frame 0, 3
	obj_image_anim_frame 4, 3
	obj_image_anim_frame 8, 3
	obj_image_anim_frame 12, 3
	obj_image_anim_frame 16, 3
	obj_image_anim_frame 20, 3
	obj_image_anim_frame 24, 3
	obj_image_anim_frame 28, 3
	obj_image_anim_frame 32, 3
	obj_image_anim_frame 36, 3
	obj_image_anim_frame 40, 3
	obj_image_anim_frame 44, 3
	obj_image_anim_loop 2
	obj_image_anim_frame 0, 3
	obj_image_anim_end

	.align 2
gSpriteAnimTable_82158F8:: @ 82158F8
	.4byte gSpriteAnim_8215880
	.4byte gSpriteAnim_82158BC

	.align 2
gSpriteAffineAnim_8215900:: @ 8215900
	obj_rot_scal_anim_frame 0x0, 0x0, 0, 1
	obj_rot_scal_anim_end

	.align 2
gSpriteAffineAnim_8215910:: @ 8215910
	obj_rot_scal_anim_frame 0xFFF8, 0x0, 0, 20
	obj_rot_scal_anim_end

	.align 2
gSpriteAffineAnim_8215920:: @ 8215920
	obj_rot_scal_anim_frame 0x60, 0x100, 0, 0
	obj_rot_scal_anim_frame 0x0, 0x0, 0, 5
	obj_rot_scal_anim_frame 0x8, 0x0, 0, 20
	obj_rot_scal_anim_end

	.align 2
gSpriteAffineAnimTable_8215940:: @ 8215940
	.4byte gSpriteAffineAnim_8215900
	.4byte gSpriteAffineAnim_8215910
	.4byte gSpriteAffineAnim_8215920

	.align 2
gUnknown_0821594C:: @ 821594C
	obj_tiles gTradeBallTiles, 0x600, 5557

	.align 2
gUnknown_08215954:: @ 8215954
	obj_pal gTradeBallPalette, 5558

	.align 2
gSpriteTemplate_821595C:: @ 821595C
	spr_template 5557, 5558, gOamData_8215878, gSpriteAnimTable_82158F8, NULL, gSpriteAffineAnimTable_8215940, sub_804D6BC

	.align 2
gOamData_8215974:: @ 8215974
	.2byte 0x0500
	.2byte 0x8000
	.2byte 0x0400

	.align 2
gSpriteAnim_821597C:: @ 821597C
	obj_image_anim_frame 0, 5, OBJ_IMAGE_ANIM_V_FLIP | OBJ_IMAGE_ANIM_H_FLIP
	obj_image_anim_end

	.align 2
gSpriteAnimTable_8215984:: @ 8215984
	.4byte gSpriteAnim_821597C

	.align 2
gSpriteAffineAnim_8215988:: @ 8215988
	obj_rot_scal_anim_frame 0xFFF6, 0xFFF6, 0, 5
	obj_rot_scal_anim_frame 0xA, 0xA, 0, 5
	obj_rot_scal_anim_jump 0

	.align 2
gSpriteAffineAnimTable_82159A0:: @ 82159A0
	.4byte gSpriteAffineAnim_8215988

	.align 2
gUnknown_082159A4:: @ 82159A4
	obj_tiles gTradeGlow1Tiles, 0x200, 5550

	.align 2
gUnknown_082159AC:: @ 82159AC
	obj_pal gTradeGlowPalette, 5551

	.align 2
gUnknown_082159B4:: @ 82159B4
	obj_pal gTradeCableEndPalette, 5555

	.align 2
gSpriteTemplate_82159BC:: @ 82159BC
	spr_template 5550, 5551, gOamData_8215974, gSpriteAnimTable_8215984, NULL, gSpriteAffineAnimTable_82159A0, sub_804B058

	.align 2
gOamData_82159D4:: @ 82159D4
	.2byte 0x8000
	.2byte 0x8000
	.2byte 0x0400

	.align 2
gSpriteAnim_82159DC:: @ 82159DC
	obj_image_anim_frame 0, 5, OBJ_IMAGE_ANIM_V_FLIP | OBJ_IMAGE_ANIM_H_FLIP
	obj_image_anim_end

	.align 2
gSpriteAnim_82159E4:: @ 82159E4
	obj_image_anim_frame 8, 5, OBJ_IMAGE_ANIM_V_FLIP | OBJ_IMAGE_ANIM_H_FLIP
	obj_image_anim_end

	.align 2
gSpriteAnimTable_82159EC:: @ 82159EC
	.4byte gSpriteAnim_82159DC
	.4byte gSpriteAnim_82159E4

	.align 2
gUnknown_082159F4:: @ 82159F4
	obj_tiles gTradeGlow2Tiles, 0x300, 5552

	.align 2
gSpriteTemplate_82159FC:: @ 82159FC
	spr_template 5552, 5551, gOamData_82159D4, gSpriteAnimTable_82159EC, NULL, gDummySpriteAffineAnimTable, sub_804B07C

	.align 2
gOamData_8215A14:: @ 8215A14
	.2byte 0x8000
	.2byte 0x8000
	.2byte 0x0400

	.align 2
gSpriteAnim_8215A1C:: @ 8215A1C
	obj_image_anim_frame 0, 10
	obj_image_anim_end

	.align 2
gSpriteAnimTable_8215A24:: @ 8215A24
	.4byte gSpriteAnim_8215A1C

	.align 2
gUnknown_08215A28:: @ 8215A28
	obj_tiles gTradeCableEndTiles, 0x100, 5554

	.align 2
gSpriteTemplate_8215A30:: @ 8215A30
	spr_template 5554, 5555, gOamData_8215A14, gSpriteAnimTable_8215A24, NULL, gDummySpriteAffineAnimTable, sub_804B0BC

	.align 2
gOamData_8215A48:: @ 8215A48
	.2byte 0x4000
	.2byte 0xC000
	.2byte 0x0400

	.align 2
gSpriteAnim_8215A50:: @ 8215A50
	obj_image_anim_frame 0, 2, OBJ_IMAGE_ANIM_V_FLIP | OBJ_IMAGE_ANIM_H_FLIP
	obj_image_anim_frame 32, 2, OBJ_IMAGE_ANIM_V_FLIP | OBJ_IMAGE_ANIM_H_FLIP
	obj_image_anim_frame 64, 2, OBJ_IMAGE_ANIM_V_FLIP | OBJ_IMAGE_ANIM_H_FLIP
	obj_image_anim_frame 96, 2, OBJ_IMAGE_ANIM_V_FLIP | OBJ_IMAGE_ANIM_H_FLIP
	obj_image_anim_frame 64, 2, OBJ_IMAGE_ANIM_V_FLIP | OBJ_IMAGE_ANIM_H_FLIP
	obj_image_anim_frame 32, 2, OBJ_IMAGE_ANIM_V_FLIP | OBJ_IMAGE_ANIM_H_FLIP
	obj_image_anim_frame 0, 2, OBJ_IMAGE_ANIM_V_FLIP | OBJ_IMAGE_ANIM_H_FLIP
	obj_image_anim_loop 8
	obj_image_anim_end

	.align 2
gSpriteAnimTable_8215A74:: @ 8215A74
	.4byte gSpriteAnim_8215A50

	.align 2
gUnknown_08215A78:: @ 8215A78
	obj_tiles gTradeGBAScreenTiles, 0x1000, 5556

	.align 2
gSpriteTemplate_8215A80:: @ 8215A80
	spr_template 5556, 5555, gOamData_8215A48, gSpriteAnimTable_8215A74, NULL, gDummySpriteAffineAnimTable, sub_804B104

	.align 1
gTradeGlow2PaletteAnimTable:: @ 8215A98
	.2byte 0x7F12
	.2byte 0x7F12
	.2byte 0x7F12
	.2byte 0x7FFF
	.2byte 0x7FFF
	.2byte 0x7FFF
	.2byte 0x7F12
	.2byte 0x7F12
	.2byte 0x7F12
	.2byte 0x7FFF
	.2byte 0x7FFF
	.2byte 0x7FFF

	.align 2
gSpriteAffineAnim_8215AB0:: @ 8215AB0
	obj_rot_scal_anim_frame 0xFF00, 0x100, 0, 0
	obj_rot_scal_anim_jump 0

	.align 2
gSpriteAffineAnimTable_8215AC0:: @ 8215AC0
	.4byte gSpriteAffineAnim_8215AB0

@ 8215AC4
	.include "data/ingame_trades.inc"

gTradeBallVerticalVelocityTable:: @ 8215BA0
	.byte  0
	.byte  0
	.byte  1
	.byte  0
	.byte  1
	.byte  0
	.byte  1
	.byte  1
	.byte  1
	.byte  1
	.byte  2
	.byte  2
	.byte  2
	.byte  2
	.byte  3
	.byte  3
	.byte  3
	.byte  3
	.byte  4
	.byte  4
	.byte  4
	.byte  4
	.byte -4
	.byte -4
	.byte -4
	.byte -3
	.byte -3
	.byte -3
	.byte -3
	.byte -2
	.byte -2
	.byte -2
	.byte -2
	.byte -1
	.byte -1
	.byte -1
	.byte -1
	.byte  0
	.byte -1
	.byte  0
	.byte -1
	.byte  0
	.byte  0
	.byte  0
	.byte  0
	.byte  0
	.byte  1
	.byte  0
	.byte  1
	.byte  0
	.byte  1
	.byte  1
	.byte  1
	.byte  1
	.byte  2
	.byte  2
	.byte  2
	.byte  2
	.byte  3
	.byte  3
	.byte  3
	.byte  3
	.byte  4
	.byte  4
	.byte  4
	.byte  4
	.byte -4
	.byte -3
	.byte -3
	.byte -2
	.byte -2
	.byte -1
	.byte -1
	.byte -1
	.byte  0
	.byte -1
	.byte  0
	.byte  0
	.byte  0
	.byte  0
	.byte  0
	.byte  0
	.byte  1
	.byte  0
	.byte  1
	.byte  1
	.byte  1
	.byte  2
	.byte  2
	.byte  3
	.byte  3
	.byte  4
	.byte -4
	.byte -3
	.byte -2
	.byte -1
	.byte -1
	.byte -1
	.byte  0
	.byte  0
	.byte  0
	.byte  0
	.byte  1
	.byte  0
	.byte  1
	.byte  1
	.byte  2
	.byte  3

	.align 2
gUnknown_08215C0C:: @ 8215C0C
	.incbin "graphics/berry_blender/center.gbapal"

	.align 2
gUnknown_08215C2C:: @ 8215C2C
	.incbin "graphics/berry_blender/center_map.bin"

	.align 2
gUnknown_0821602C:: @ 821602C
	.incbin "graphics/berry_blender/outer.gbapal"

	.incbin "graphics/unused/unknown/821604C.gbapal"

	.space 0x1C0

	.string "▶$"
	.string " $"
	.string "カッコイ$" @ "cool" (missing an イ at the end)
	.string "カワイイ$" @ "cute"
	.string "ウツクシ$" @ "beautiful" (missing an イ at the end)
	.string "カシコイ$" @ "smart"
	.string "タクマシ$" @ "tough" (missing an イ at the end)

gUnknown_08216249:: @ 8216249
	.string "\p$"

@ unreferenced
@ These appear to be the first names of four people who worked on the game.
	.string "てつじ$", 10 @ Tetsuji (Ohta)
	.string "あきと$", 10 @ Akito (Mori)
	.string "シゲル$", 10 @ Shigeru (Ohmori)
	.string "ヨシノリ$", 10 @ Yoshinori (Matsuda)

UnknownText_2Pok:
	.string "2Pok$"
UnknownText_3Pok:
	.string "3Pok$"
UnknownText_4Pok:
	.string "4Pok$"

	.align 2
gUnknown_08216284:: @ 8216284
	.4byte UnknownText_2Pok
	.4byte UnknownText_3Pok
	.4byte UnknownText_4Pok

@ unreferenced
	.string "1P$", 4
	.string "2P$", 4
	.string "3P$", 4
	.string "4P$", 4

UnknownText_Mister:
	.string "MISTER$"
UnknownText_Laddie:
	.string "LADDIE$"
UnknownText_Lassie:
	.string "LASSIE$"

	.align 2
gUnknown_082162B8:: @ 82162B8
	.4byte UnknownText_Mister
	.4byte UnknownText_Laddie
	.4byte UnknownText_Lassie

gUnknown_082162C4:: @ 82162C4
	.string "{COLOR RED}$"

gUnknown_082162C8:: @ 82162C8
	.string "\n$"

	.string " $"

gUnknown_082162CC:: @ 82162CC
	.byte -1, -1
	.byte  1, -1
	.byte -1,  1
	.byte  1,  1

gUnknown_082162D4:: @ 82162D4
	.byte  2,  6
	.byte 23,  6
	.byte  2, 12
	.byte 23, 12
	.byte  1,  6
	.byte 22,  6
	.byte  1, 12
	.byte 22, 12

gUnknown_082162E4:: @ 82162E4
	.byte  72,  32
	.byte 168,  32
	.byte  72, 128
	.byte 168, 128

gUnknown_082162EC:: @ 82162EC
	.byte -1,  0,  1, -1
	.byte -1,  0,  1,  2
	.byte  0,  1,  2,  3

	.align 1
gUnknown_082162F8:: @ 82162F8
	.2byte 0x0000, 0xC000, 0x4000, 0x8000

gUnknown_08216300:: @ 8216300
	.byte 1
	.byte 1
	.byte 0

gUnknown_08216303:: @ 8216303
	.byte 32
	.byte 224
	.byte 96
	.byte 160
	.byte 0

	.align 2
gUnknown_08216308:: @ 8216308
	.4byte sub_804F8C8
	.4byte sub_804F9F4
	.4byte sub_804FB1C

	.align 2
gOamData_8216314:: @ 8216314
	.2byte 0x0000
	.2byte 0x8000
	.2byte 0x0400

	.align 2
gSpriteAnim_821631C:: @ 821631C
	obj_image_anim_frame 16, 5, OBJ_IMAGE_ANIM_V_FLIP | OBJ_IMAGE_ANIM_H_FLIP
	obj_image_anim_end

	.align 2
gSpriteAnim_8216324:: @ 8216324
	obj_image_anim_frame 16, 5, OBJ_IMAGE_ANIM_V_FLIP
	obj_image_anim_end

	.align 2
gSpriteAnim_821632C:: @ 821632C
	obj_image_anim_frame 16, 5, OBJ_IMAGE_ANIM_H_FLIP
	obj_image_anim_end

	.align 2
gSpriteAnim_8216334:: @ 8216334
	obj_image_anim_frame 16, 5
	obj_image_anim_end

	.align 2
gSpriteAnim_821633C:: @ 821633C
	obj_image_anim_frame 48, 2, OBJ_IMAGE_ANIM_V_FLIP | OBJ_IMAGE_ANIM_H_FLIP
	obj_image_anim_frame 32, 5, OBJ_IMAGE_ANIM_V_FLIP | OBJ_IMAGE_ANIM_H_FLIP
	obj_image_anim_frame 48, 3, OBJ_IMAGE_ANIM_V_FLIP | OBJ_IMAGE_ANIM_H_FLIP
	obj_image_anim_frame 16, 5, OBJ_IMAGE_ANIM_V_FLIP | OBJ_IMAGE_ANIM_H_FLIP
	obj_image_anim_end

	.align 2
gSpriteAnim_8216350:: @ 8216350
	obj_image_anim_frame 48, 2, OBJ_IMAGE_ANIM_V_FLIP
	obj_image_anim_frame 32, 5, OBJ_IMAGE_ANIM_V_FLIP
	obj_image_anim_frame 48, 3, OBJ_IMAGE_ANIM_V_FLIP
	obj_image_anim_frame 16, 5, OBJ_IMAGE_ANIM_V_FLIP
	obj_image_anim_end

	.align 2
gSpriteAnim_8216364:: @ 8216364
	obj_image_anim_frame 48, 2, OBJ_IMAGE_ANIM_H_FLIP
	obj_image_anim_frame 32, 5, OBJ_IMAGE_ANIM_H_FLIP
	obj_image_anim_frame 48, 3, OBJ_IMAGE_ANIM_H_FLIP
	obj_image_anim_frame 16, 5, OBJ_IMAGE_ANIM_H_FLIP
	obj_image_anim_end

	.align 2
gSpriteAnim_8216378:: @ 8216378
	obj_image_anim_frame 48, 2
	obj_image_anim_frame 32, 5
	obj_image_anim_frame 48, 3
	obj_image_anim_frame 16, 5
	obj_image_anim_end

	.align 2
gSpriteAnim_821638C:: @ 821638C
	obj_image_anim_frame 0, 5, OBJ_IMAGE_ANIM_V_FLIP | OBJ_IMAGE_ANIM_H_FLIP
	obj_image_anim_end

	.align 2
gSpriteAnim_8216394:: @ 8216394
	obj_image_anim_frame 0, 5, OBJ_IMAGE_ANIM_V_FLIP
	obj_image_anim_end

	.align 2
gSpriteAnim_821639C:: @ 821639C
	obj_image_anim_frame 0, 5, OBJ_IMAGE_ANIM_H_FLIP
	obj_image_anim_end

	.align 2
gSpriteAnim_82163A4:: @ 82163A4
	obj_image_anim_frame 0, 5
	obj_image_anim_end

	.align 2
gSpriteAnimTable_82163AC:: @ 82163AC
	.4byte gSpriteAnim_821631C
	.4byte gSpriteAnim_8216324
	.4byte gSpriteAnim_821632C
	.4byte gSpriteAnim_8216334
	.4byte gSpriteAnim_821633C
	.4byte gSpriteAnim_8216350
	.4byte gSpriteAnim_8216364
	.4byte gSpriteAnim_8216378
	.4byte gSpriteAnim_821638C
	.4byte gSpriteAnim_8216394
	.4byte gSpriteAnim_821639C
	.4byte gSpriteAnim_82163A4

	.align 2
gUnknown_082163DC:: @ 82163DC
	obj_tiles gBerryBlenderArrowTiles, 0x800, 46545

	.align 2
gUnknown_082163E4:: @ 82163E4
	obj_pal gBerryBlenderMiscPalette, 46546

	.align 2
gUnknown_082163EC:: @ 82163EC
	obj_pal gBerryBlenderArrowPalette, 12312

	.align 2
gSpriteTemplate_82163F4:: @ 82163F4
	spr_template 46545, 12312, gOamData_8216314, gSpriteAnimTable_82163AC, NULL, gDummySpriteAffineAnimTable, sub_8051C04

	.align 2
gOamData_821640C:: @ 821640C
	.2byte 0x0000
	.2byte 0x4000
	.2byte 0x0000

	.align 2
gSpriteAnim_8216414:: @ 8216414
	obj_image_anim_frame 0, 20
	obj_image_anim_end

	.align 2
gSpriteAnim_821641C:: @ 821641C
	obj_image_anim_frame 4, 20, OBJ_IMAGE_ANIM_H_FLIP
	obj_image_anim_end

	.align 2
gSpriteAnim_8216424:: @ 8216424
	obj_image_anim_frame 8, 4
	obj_image_anim_frame 12, 4
	obj_image_anim_frame 8, 4
	obj_image_anim_frame 12, 4
	obj_image_anim_frame 8, 4
	obj_image_anim_end

	.align 2
gSpriteAnim_821643C:: @ 821643C
	obj_image_anim_frame 8, 4
	obj_image_anim_end

	.align 2
gSpriteAnimTable_8216444:: @ 8216444
	.4byte gSpriteAnim_8216414
	.4byte gSpriteAnim_821641C
	.4byte gSpriteAnim_8216424
	.4byte gSpriteAnim_821643C

	.align 2
gUnknown_08216454:: @ 8216454
	obj_tiles gBerryBlenderMarubatsuTiles, 0x200, 48888

	.align 2
gSpriteTemplate_821645C:: @ 821645C
	spr_template 48888, 46546, gOamData_821640C, gSpriteAnimTable_8216444, NULL, gDummySpriteAffineAnimTable, sub_8051650

	.align 2
gOamData_8216474:: @ 8216474
	.2byte 0x0000
	.2byte 0x0000
	.2byte 0x0400

	.align 2
gSpriteAnim_821647C:: @ 821647C
	obj_image_anim_frame 0, 3
	obj_image_anim_frame 1, 4
	obj_image_anim_frame 3, 5
	obj_image_anim_frame 1, 4
	obj_image_anim_frame 0, 3
	obj_image_anim_end

	.align 2
gSpriteAnim_8216494:: @ 8216494
	obj_image_anim_frame 0, 3
	obj_image_anim_frame 2, 4
	obj_image_anim_frame 4, 5
	obj_image_anim_frame 2, 4
	obj_image_anim_frame 0, 3
	obj_image_anim_end

	.align 2
gSpriteAnim_82164AC:: @ 82164AC
	obj_image_anim_frame 0, 2
	obj_image_anim_frame 1, 2
	obj_image_anim_frame 2, 2
	obj_image_anim_frame 4, 4
	obj_image_anim_frame 3, 3
	obj_image_anim_frame 2, 2
	obj_image_anim_frame 1, 2
	obj_image_anim_frame 0, 2
	obj_image_anim_end

	.align 2
gSpriteAnim_82164D0:: @ 82164D0
	obj_image_anim_frame 5, 5, OBJ_IMAGE_ANIM_V_FLIP | OBJ_IMAGE_ANIM_H_FLIP
	obj_image_anim_end

	.align 2
gSpriteAnim_82164D8:: @ 82164D8
	obj_image_anim_frame 6, 5, OBJ_IMAGE_ANIM_V_FLIP | OBJ_IMAGE_ANIM_H_FLIP
	obj_image_anim_end

	.align 2
gSpriteAnimTable_82164E0:: @ 82164E0
	.4byte gSpriteAnim_821647C
	.4byte gSpriteAnim_8216494
	.4byte gSpriteAnim_82164AC
	.4byte gSpriteAnim_82164D0
	.4byte gSpriteAnim_82164D8

	.align 2
gUnknown_082164F4:: @ 82164F4
	obj_tiles gBerryBlenderParticlesTiles, 0xE0, 23456

	.align 2
gSpriteTemplate_82164FC:: @ 82164FC
	spr_template 23456, 46546, gOamData_8216474, gSpriteAnimTable_82164E0, NULL, gDummySpriteAffineAnimTable, SpriteCallbackDummy

	.align 2
gOamData_8216514:: @ 8216514
	.2byte 0x0000
	.2byte 0x8000
	.2byte 0x0400

	.align 2
gSpriteAnim_821651C:: @ 821651C
	obj_image_anim_frame 32, 30
	obj_image_anim_end

	.align 2
gSpriteAnim_8216524:: @ 8216524
	obj_image_anim_frame 16, 30
	obj_image_anim_end

	.align 2
gSpriteAnim_821652C:: @ 821652C
	obj_image_anim_frame 0, 30
	obj_image_anim_end

	.align 2
gSpriteAnimTable_8216534:: @ 8216534
	.4byte gSpriteAnim_821651C
	.4byte gSpriteAnim_8216524
	.4byte gSpriteAnim_821652C

	.align 2
gUnknown_08216540:: @ 8216540
	obj_tiles gBerryBlenderCountdownNumbersTiles, 0x600, 12345

	.align 2
gSpriteTemplate_8216548:: @ 8216548
	spr_template 12345, 46546, gOamData_8216514, gSpriteAnimTable_8216534, NULL, gDummySpriteAffineAnimTable, sub_805181C

	.align 2
gOamData_8216560:: @ 8216560
	.2byte 0x4000
	.2byte 0xC000
	.2byte 0x0400

	.align 2
gSpriteAnim_8216568:: @ 8216568
	obj_image_anim_frame 0, 30
	obj_image_anim_end

	.align 2
gSpriteAnimTable_8216570:: @ 8216570
	.4byte gSpriteAnim_8216568

	.align 2
gUnknown_08216574:: @ 8216574
	obj_tiles gBerryBlenderStartTiles, 0x400, 12346

	.align 2
gSpriteTemplate_821657C:: @ 821657C
	spr_template 12346, 46546, gOamData_8216560, gSpriteAnimTable_8216570, NULL, gDummySpriteAffineAnimTable, sub_80518CC

	.align 1
gUnknown_08216594:: @ 8216594
	.2byte -10,  20,  10,   2,   1
	.2byte 250,  20,  10,  -2,   1
	.2byte -10, 140,  10,   2,  -1
	.2byte 250, 140,  10,  -2,  -1

gUnknown_082165BC:: @ 82165BC
	.byte 4, 3, 2
	.byte 0, 4, 3
	.byte 1, 0, 4
	.byte 2, 1, 0
	.byte 3, 2, 1
	.byte 0, 2, 3
	.byte 1, 3, 4
	.byte 2, 4, 0
	.byte 3, 0, 1
	.byte 4, 1, 2

gUnknown_082165DA:: @ 82165DA
	.byte 1, 1, 2, 3, 4

gUnknown_082165DF:: @ 82165DF
	.byte 0x1C, 0x16, 0x13, 0x1A, 0x19, 0x0E, 0x0D, 0x0B, 0x07, 0x15

gUnknown_082165E9:: @ 82165E9
	.byte 6, 6, 6, 6, 5

gUnknown_082165EE:: @ 82165EE
	.byte 3, 3, 3, 2, 2

gUnknown_082165F3:: @ 82165F3
	.byte 3, 3, 3, 3, 2

gUnknown_082165F8:: @ 82165F8
	.string " $"

gOtherText_BPMAndDash:: @ 82165FA
	.string "BPM$"
	.string "-$"

gUnknown_08216600:: @ 8216600
	.string "\n$"

	.string "\n$"

@ used to initialize part of save block 1 when starting a new game
	.align 2
gUnknown_08216604:: @ 8216604
	.space 11
	.byte 0xFF
	.space 10
	.byte 0xFF
	.space 9

	.align 2
gDummyWarpData:: @ 8216624
	.byte -1
	.byte -1
	.byte -1
	.space 1
	.2byte -1
	.2byte -1

@ unused, unknown data
	.byte 0xB0, 0x04, 0x00, 0x00
	.byte 0x10, 0x0E, 0x00, 0x00
	.byte 0xB0, 0x04, 0x00, 0x00
	.byte 0x60, 0x09, 0x00, 0x00
	.byte 0x32, 0x00, 0x00, 0x00
	.byte 0x50, 0x00, 0x00, 0x00
	.byte 0xD4, 0xFF, 0xFF, 0xFF
	.byte 0x2C, 0x00, 0x00, 0x00

	.align 2
gUnknown_0821664C:: @ 821664C
	.4byte  0,  0
	.4byte  0,  1
	.4byte  0, -1
	.4byte -1,  0
	.4byte  1,  0
	.4byte -1,  1
	.4byte  1,  1
	.4byte -1, -1
	.4byte  1, -1

	.align 2
gUnknown_08216694:: @ 8216694
	.4byte REG_WIN0H
	.4byte ((DMA_ENABLE | DMA_START_HBLANK | DMA_REPEAT | DMA_DEST_RELOAD) << 16) | 1
	.4byte 1

	.align 2
gUnknown_082166A0:: @ 82166A0
	.4byte sub_8055C68
	.4byte sub_8055C88
	.4byte sub_8055C8C

	.align 2
gUnknown_082166AC:: @ 82166AC
	.4byte sub_8055CAC
	.4byte sub_8055CB0
	.4byte sub_8055CB0
	.4byte sub_8055CB0
	.4byte sub_8055CB0
	.4byte sub_8055CAC
	.4byte sub_8055CAC
	.4byte sub_8055D18
	.4byte sub_8055D18
	.4byte sub_8055D18
	.4byte sub_8055D18

	.align 2
gUnknown_082166D8:: @ 82166D8
	.4byte sub_8055D30
	.4byte sub_8055D38

@ 82166E0
	.include "data/tilesets/graphics.inc"

@ 8259C1C
	.include "data/tilesets/metatiles.inc"

@ 8286CF4
	.include "data/tilesets/headers.inc"

	.include "data/maps/_assets.inc"
	.include "data/maps/attributes_table.inc"
	.include "data/maps/headers.inc"
	.include "data/maps/_groups.inc"
	.include "data/maps/connections.inc"

	.align 2
gUnknown_08308E28:: @ 8308E28
	.4byte 0

gUnknown_08308E2C:: @ 8308E2C
	.byte 0b100
	.byte 0b000
	.byte 0b101
	.byte 0b101
	.byte 0b000
	.byte 0b001
	.byte 0b101
	.byte 0b100
	.byte 0b101
	.byte 0b100
	.byte 0b100
	.byte 0b101
	.byte 0b100
	.byte 0b000
	.byte 0b000
	.byte 0b100
	.byte 0b111
	.byte 0b111
	.byte 0b111
	.byte 0b110
	.byte 0b110
	.byte 0b111
	.byte 0b100
	.byte 0b100
	.byte 0b000
	.byte 0b110
	.byte 0b000
	.byte 0b100
	.byte 0b100
	.byte 0b000
	.byte 0b000
	.byte 0b000
	.byte 0b100
	.byte 0b100
	.byte 0b111
	.byte 0b100
	.byte 0b101
	.byte 0b101
	.byte 0b100
	.byte 0b100
	.byte 0b100
	.byte 0b100
	.byte 0b111
	.byte 0b100
	.byte 0b000
	.byte 0b000
	.byte 0b000
	.byte 0b000
	.byte 0b100
	.byte 0b100
	.byte 0b100
	.byte 0b100
	.byte 0b100
	.byte 0b100
	.byte 0b100
	.byte 0b100
	.byte 0b000
	.byte 0b000
	.byte 0b000
	.byte 0b000
	.byte 0b100
	.byte 0b100
	.byte 0b100
	.byte 0b100
	.byte 0b100
	.byte 0b100
	.byte 0b100
	.byte 0b100
	.byte 0b100
	.byte 0b100
	.byte 0b100
	.byte 0b100
	.byte 0b100
	.byte 0b100
	.byte 0b100
	.byte 0b000
	.byte 0b000
	.byte 0b000
	.byte 0b000
	.byte 0b000
	.byte 0b110
	.byte 0b110
	.byte 0b110
	.byte 0b110
	.byte 0b000
	.byte 0b000
	.byte 0b000
	.byte 0b000
	.byte 0b000
	.byte 0b000
	.byte 0b000
	.byte 0b000
	.byte 0b000
	.byte 0b000
	.byte 0b000
	.byte 0b000
	.byte 0b100
	.byte 0b100
	.byte 0b100
	.byte 0b100
	.byte 0b100
	.byte 0b100
	.byte 0b100
	.byte 0b100
	.byte 0b100
	.byte 0b100
	.byte 0b100
	.byte 0b100
	.byte 0b110
	.byte 0b110
	.byte 0b100
	.byte 0b110
	.byte 0b000
	.byte 0b100
	.byte 0b100
	.byte 0b100
	.byte 0b100
	.byte 0b100
	.byte 0b100
	.byte 0b100
	.byte 0b100
	.byte 0b000
	.byte 0b000
	.byte 0b000
	.byte 0b000
	.byte 0b000
	.byte 0b000
	.byte 0b000
	.byte 0b000
	.byte 0b000
	.byte 0b000
	.byte 0b000
	.byte 0b000
	.byte 0b000
	.byte 0b000
	.byte 0b000
	.byte 0b000
	.byte 0b000
	.byte 0b000
	.byte 0b000
	.byte 0b000
	.byte 0b000
	.byte 0b000
	.byte 0b000
	.byte 0b000
	.byte 0b000
	.byte 0b000
	.byte 0b000
	.byte 0b000
	.byte 0b000
	.byte 0b000
	.byte 0b000
	.byte 0b000
	.byte 0b000
	.byte 0b000
	.byte 0b000
	.byte 0b000
	.byte 0b000
	.byte 0b000
	.byte 0b000
	.byte 0b000
	.byte 0b000
	.byte 0b000
	.byte 0b000
	.byte 0b000
	.byte 0b000
	.byte 0b000
	.byte 0b000
	.byte 0b000
	.byte 0b000
	.byte 0b000
	.byte 0b000
	.byte 0b000
	.byte 0b000
	.byte 0b000
	.byte 0b000
	.byte 0b000
	.byte 0b000
	.byte 0b100
	.byte 0b100
	.byte 0b000
	.byte 0b100
	.byte 0b000
	.byte 0b000
	.byte 0b100
	.byte 0b100
	.byte 0b100
	.byte 0b100
	.byte 0b100
	.byte 0b100
	.byte 0b100
	.byte 0b000
	.byte 0b100
	.byte 0b100
	.byte 0b100
	.byte 0b100
	.byte 0b100
	.byte 0b100
	.byte 0b000
	.byte 0b000
	.byte 0b000
	.byte 0b000
	.byte 0b000
	.byte 0b000
	.byte 0b000
	.byte 0b000
	.byte 0b000
	.byte 0b000
	.byte 0b100
	.byte 0b100
	.byte 0b100
	.byte 0b100
	.byte 0b100
	.byte 0b100
	.byte 0b100
	.byte 0b000
	.byte 0b000
	.byte 0b000
	.byte 0b000
	.byte 0b000
	.byte 0b000
	.byte 0b000
	.byte 0b000
	.byte 0b000
	.byte 0b000
	.byte 0b000
	.byte 0b000
	.byte 0b000
	.byte 0b000
	.byte 0b000
	.byte 0b000
	.byte 0b000
	.byte 0b000
	.byte 0b000
	.byte 0b000
	.byte 0b000
	.byte 0b000
	.byte 0b000
	.byte 0b000
	.byte 0b000

	.align 2
DoorAnimTiles_04: @ 8308F1C
	.incbin "graphics/door_anims/04/0.4bpp"
	.incbin "graphics/door_anims/04/1.4bpp"
	.incbin "graphics/door_anims/04/2.4bpp"

	.space 32

	.align 2
DoorAnimTiles_05: @ 830923C
	.incbin "graphics/door_anims/05/0.4bpp"
	.incbin "graphics/door_anims/05/1.4bpp"
	.incbin "graphics/door_anims/05/2.4bpp"

	.align 2
DoorAnimTiles_08: @ 830953C
	.incbin "graphics/door_anims/08/0.4bpp"
	.incbin "graphics/door_anims/08/1.4bpp"
	.incbin "graphics/door_anims/08/2.4bpp"

	.space 32

	.align 2
DoorAnimTiles_15: @ 830985C
	.incbin "graphics/door_anims/15/0.4bpp"
	.incbin "graphics/door_anims/15/1.4bpp"
	.incbin "graphics/door_anims/15/2.4bpp"

	.space 32

	.align 2
DoorAnimTiles_16: @ 8309B7C
	.incbin "graphics/door_anims/16/0.4bpp"
	.incbin "graphics/door_anims/16/1.4bpp"
	.incbin "graphics/door_anims/16/2.4bpp"

	.space 32

	.align 2
DoorAnimTiles_00: @ 8309E9C
	.incbin "graphics/door_anims/00/0.4bpp"
	.incbin "graphics/door_anims/00/1.4bpp"
	.incbin "graphics/door_anims/00/2.4bpp"

	.align 2
DoorAnimTiles_01: @ 830A19C
	.incbin "graphics/door_anims/01/0.4bpp"
	.incbin "graphics/door_anims/01/1.4bpp"
	.incbin "graphics/door_anims/01/2.4bpp"

	.align 2
DoorAnimTiles_02: @ 830A49C
	.incbin "graphics/door_anims/02/0.4bpp"
	.incbin "graphics/door_anims/02/1.4bpp"
	.incbin "graphics/door_anims/02/2.4bpp"

	.align 2
DoorAnimTiles_03: @ 830A79C
	.incbin "graphics/door_anims/03/0.4bpp"
	.incbin "graphics/door_anims/03/1.4bpp"
	.incbin "graphics/door_anims/03/2.4bpp"

	.align 2
DoorAnimTiles_06: @ 830AA9C
	.incbin "graphics/door_anims/06/0.4bpp"
	.incbin "graphics/door_anims/06/1.4bpp"
	.incbin "graphics/door_anims/06/2.4bpp"

	.align 2
DoorAnimTiles_07: @ 830AD9C
	.incbin "graphics/door_anims/07/0.4bpp"
	.incbin "graphics/door_anims/07/1.4bpp"
	.incbin "graphics/door_anims/07/2.4bpp"

	.align 2
DoorAnimTiles_09: @ 830B09C
	.incbin "graphics/door_anims/09/0.4bpp"
	.incbin "graphics/door_anims/09/1.4bpp"
	.incbin "graphics/door_anims/09/2.4bpp"

	.space 32

	.align 2
DoorAnimTiles_10: @ 830B3BC
	.incbin "graphics/door_anims/10/0.4bpp"
	.incbin "graphics/door_anims/10/1.4bpp"
	.incbin "graphics/door_anims/10/2.4bpp"

	.space 32

	.align 2
DoorAnimTiles_11: @ 830B6DC
	.incbin "graphics/door_anims/11/0.4bpp"
	.incbin "graphics/door_anims/11/1.4bpp"
	.incbin "graphics/door_anims/11/2.4bpp"

	.space 32

	.align 2
DoorAnimTiles_12: @ 830B9FC
	.incbin "graphics/door_anims/12/0.4bpp"
	.incbin "graphics/door_anims/12/1.4bpp"
	.incbin "graphics/door_anims/12/2.4bpp"

	.space 32

	.align 2
DoorAnimTiles_13: @ 830BD1C
	.incbin "graphics/door_anims/13/0.4bpp"
	.incbin "graphics/door_anims/13/1.4bpp"
	.incbin "graphics/door_anims/13/2.4bpp"

	.space 32

	.align 2
DoorAnimTiles_14: @ 830C03C
	.incbin "graphics/door_anims/14/0.4bpp"
	.incbin "graphics/door_anims/14/1.4bpp"
	.incbin "graphics/door_anims/14/2.4bpp"

	.space 32

	.align 2
DoorAnimTiles_17: @ 830C35C
	.incbin "graphics/door_anims/17/0.4bpp"
	.incbin "graphics/door_anims/17/1.4bpp"
	.incbin "graphics/door_anims/17/2.4bpp"

	.space 32

	.align 2
DoorAnimTiles_18: @ 830C67C
	.incbin "graphics/door_anims/18/0.4bpp"
	.incbin "graphics/door_anims/18/1.4bpp"
	.incbin "graphics/door_anims/18/2.4bpp"

	.space 32

	.align 2
DoorAnimTiles_19: @ 830C99C
	.incbin "graphics/door_anims/19/0.4bpp"
	.incbin "graphics/door_anims/19/1.4bpp"
	.incbin "graphics/door_anims/19/2.4bpp"

	.space 32

	.align 2
DoorAnimTiles_20: @ 830CCBC
	.incbin "graphics/door_anims/20/0.4bpp"
	.incbin "graphics/door_anims/20/1.4bpp"
	.incbin "graphics/door_anims/20/2.4bpp"

	.space 32

	.align 2
DoorAnimTiles_21: @ 830CFDC
	.incbin "graphics/door_anims/21/0.4bpp"
	.incbin "graphics/door_anims/21/1.4bpp"
	.incbin "graphics/door_anims/21/2.4bpp"

	.space 32

	.align 2
DoorAnimTiles_22: @ 830D2FC
	.incbin "graphics/door_anims/22/0.4bpp"
	.incbin "graphics/door_anims/22/1.4bpp"
	.incbin "graphics/door_anims/22/2.4bpp"

	.space 32

	.align 2
DoorAnimTiles_23: @ 830D61C
	.incbin "graphics/door_anims/23/0.4bpp"
	.incbin "graphics/door_anims/23/1.4bpp"
	.incbin "graphics/door_anims/23/2.4bpp"

	.space 32

	.align 2
DoorAnimTiles_24: @ 830D93C
	.incbin "graphics/door_anims/24/0.4bpp"
	.incbin "graphics/door_anims/24/1.4bpp"
	.incbin "graphics/door_anims/24/2.4bpp"

	.space 32

	.align 2
DoorAnimTiles_25: @ 830DC5C
	.incbin "graphics/door_anims/25/0.4bpp"
	.incbin "graphics/door_anims/25/1.4bpp"
	.incbin "graphics/door_anims/25/2.4bpp"

	.space 32

	.align 2
DoorAnimTiles_26: @ 830DF7C
	.incbin "graphics/door_anims/26/0.4bpp"
	.incbin "graphics/door_anims/26/1.4bpp"
	.incbin "graphics/door_anims/26/2.4bpp"

	.space 32

	.align 2
DoorAnimTiles_27: @ 830E29C
	.incbin "graphics/door_anims/27/0.4bpp"
	.incbin "graphics/door_anims/27/1.4bpp"
	.incbin "graphics/door_anims/27/2.4bpp"

	.space 32

	.align 2
DoorAnimTiles_28: @ 830E5BC
	.incbin "graphics/door_anims/28/0.4bpp"
	.incbin "graphics/door_anims/28/1.4bpp"
	.incbin "graphics/door_anims/28/2.4bpp"

	.space 32

	.align 2
DoorAnimTiles_29: @ 830E8DC
	.incbin "graphics/door_anims/29/0.4bpp"
	.incbin "graphics/door_anims/29/1.4bpp"
	.incbin "graphics/door_anims/29/2.4bpp"

	.space 32

	.align 2
DoorAnimTiles_30: @ 830EBFC
	.incbin "graphics/door_anims/30/0.4bpp"
	.incbin "graphics/door_anims/30/1.4bpp"
	.incbin "graphics/door_anims/30/2.4bpp"

	.space 32

	.align 2
DoorAnimTiles_31: @ 830EF1C
	.incbin "graphics/door_anims/31/0.4bpp"
	.incbin "graphics/door_anims/31/1.4bpp"
	.incbin "graphics/door_anims/31/2.4bpp"

	.space 32

	.align 2
DoorAnimTiles_32: @ 830F23C
	.incbin "graphics/door_anims/32/0.4bpp"
	.incbin "graphics/door_anims/32/1.4bpp"
	.incbin "graphics/door_anims/32/2.4bpp"

	.space 32

	.align 2
DoorAnimTiles_33: @ 830F55C
	.incbin "graphics/door_anims/33/0.4bpp"
	.incbin "graphics/door_anims/33/1.4bpp"
	.incbin "graphics/door_anims/33/2.4bpp"

	.space 32

gDoorOpenAnimFrames:: @ 830F87C
	door_anim_frame 4, -1
	door_anim_frame 4, 0
	door_anim_frame 4, 0x100
	door_anim_frame 4, 0x200
	door_anim_frame 0, 0

gDoorCloseAnimFrames:: @ 830F890
	door_anim_frame 4, 0x200
	door_anim_frame 4, 0x100
	door_anim_frame 4, 0
	door_anim_frame 4, -1
	door_anim_frame 0, 0

DoorAnimPalettes_830F8A4:
	.byte 1, 1, 1, 1, 1, 1, 1, 1

DoorAnimPalettes_830F8AC:
	.byte 1, 1, 1, 1, 1, 1, 1, 1

DoorAnimPalettes_830F8B4:
	.byte 5, 5, 5, 5, 5, 5, 5, 5

DoorAnimPalettes_830F8BC:
	.byte 0, 0, 1, 1, 1, 1, 1, 1

DoorAnimPalettes_830F8C4:
	.byte 6, 6, 6, 6, 6, 6, 6, 6

DoorAnimPalettes_830F8CC:
	.byte 8, 8, 8, 8, 8, 8, 8, 8

DoorAnimPalettes_830F8D4:
	.byte 11, 11, 11, 11, 11, 11, 11, 11

DoorAnimPalettes_830F8DC:
	.byte 10, 10, 10, 10, 10, 10, 10, 10

DoorAnimPalettes_830F8E4:
	.byte 7, 7, 7, 7, 7, 7, 7, 7

DoorAnimPalettes_830F8EC:
	.byte 8, 8, 8, 8, 8, 8, 8, 8

DoorAnimPalettes_830F8F4:
	.byte 9, 9, 9, 9, 9, 9, 9, 9

DoorAnimPalettes_830F8FC:
	.byte 9, 9, 1, 1, 1, 1, 1, 1

DoorAnimPalettes_830F904:
	.byte 8, 8, 8, 8, 8, 8, 8, 8

DoorAnimPalettes_830F90C:
	.byte 9, 9, 9, 9, 9, 9, 9, 9

DoorAnimPalettes_830F914:
	.byte 6, 6, 6, 6, 6, 6, 6, 6

DoorAnimPalettes_830F91C:
	.byte 6, 6, 6, 6, 6, 6, 6, 6

DoorAnimPalettes_830F924:
	.byte 0, 0, 5, 5, 5, 5, 5, 5

DoorAnimPalettes_830F92C:
	.byte 6, 6, 1, 1, 1, 1, 1, 1

DoorAnimPalettes_830F934:
	.byte 7, 7, 7, 7, 7, 7, 7, 7

DoorAnimPalettes_830F93C:
	.byte 6, 6, 5, 5, 5, 5, 5, 5

DoorAnimPalettes_830F944:
	.byte 5, 5, 5, 5, 5, 5, 5, 5

DoorAnimPalettes_830F94C:
	.byte 1, 1, 1, 1, 1, 1, 1, 1

DoorAnimPalettes_830F954:
	.byte 6, 6, 7, 7, 7, 7, 7, 7

DoorAnimPalettes_830F95C:
	.byte 7, 7, 7, 7, 7, 7, 7, 7

DoorAnimPalettes_830F964:
	.byte 5, 5, 5, 5, 5, 5, 5, 5

DoorAnimPalettes_830F96C:
	.byte 9, 9, 9, 9, 9, 9, 9, 9

DoorAnimPalettes_830F974:
	.byte 8, 8, 8, 8, 8, 8, 8, 8

DoorAnimPalettes_830F97C:
	.byte 6, 6, 6, 6, 6, 6, 6, 6

DoorAnimPalettes_830F984:
	.byte 7, 7, 7, 7, 7, 7, 7, 7

DoorAnimPalettes_830F98C:
	.byte 11, 11, 7, 7, 7, 7, 7, 7

DoorAnimPalettes_830F994:
	.byte 7, 7, 7, 7, 7, 7, 7, 7

DoorAnimPalettes_830F99C:
	.byte 6, 6, 7, 7, 7, 7, 7, 7

DoorAnimPalettes_830F9A4:
	.byte 9, 9, 9, 9, 9, 9, 9, 9

DoorAnimPalettes_830F9AC:
	.byte 7, 7, 7, 7, 7, 7, 7, 7

	.align 2
gDoorAnimGraphicsTable:: @ 830F9B4
	door_anim_gfx 0x021, 0, DoorAnimTiles_00, DoorAnimPalettes_830F8A4
	door_anim_gfx 0x061, 1, DoorAnimTiles_01, DoorAnimPalettes_830F8AC
	door_anim_gfx 0x1CD, 1, DoorAnimTiles_02, DoorAnimPalettes_830F8B4
	door_anim_gfx 0x041, 1, DoorAnimTiles_03, DoorAnimPalettes_830F8BC
	door_anim_gfx 0x248, 0, DoorAnimTiles_04, DoorAnimPalettes_830F8C4
	door_anim_gfx 0x249, 0, DoorAnimTiles_05, DoorAnimPalettes_830F8CC
	door_anim_gfx 0x22F, 0, DoorAnimTiles_06, DoorAnimPalettes_830F8D4
	door_anim_gfx 0x21F, 0, DoorAnimTiles_07, DoorAnimPalettes_830F8DC
	door_anim_gfx 0x2A5, 0, DoorAnimTiles_08, DoorAnimPalettes_830F8E4
	door_anim_gfx 0x287, 0, DoorAnimTiles_09, DoorAnimPalettes_830F8F4
	door_anim_gfx 0x2AC, 0, DoorAnimTiles_10, DoorAnimPalettes_830F934
	door_anim_gfx 0x3A1, 0, DoorAnimTiles_11, DoorAnimPalettes_830F93C
	door_anim_gfx 0x2DC, 0, DoorAnimTiles_12, DoorAnimPalettes_830F92C
	door_anim_gfx 0x225, 0, DoorAnimTiles_13, DoorAnimPalettes_830F924
	door_anim_gfx 0x1DB, 1, DoorAnimTiles_14, DoorAnimPalettes_830F94C
	door_anim_gfx 0x246, 0, DoorAnimTiles_15, DoorAnimPalettes_830F8EC
	door_anim_gfx 0x28E, 0, DoorAnimTiles_16, DoorAnimPalettes_830F944
	door_anim_gfx 0x2A1, 0, DoorAnimTiles_17, DoorAnimPalettes_830F8FC
	door_anim_gfx 0x21C, 0, DoorAnimTiles_18, DoorAnimPalettes_830F914
	door_anim_gfx 0x21E, 0, DoorAnimTiles_19, DoorAnimPalettes_830F91C
	door_anim_gfx 0x21D, 1, DoorAnimTiles_20, DoorAnimPalettes_830F904
	door_anim_gfx 0x21A, 0, DoorAnimTiles_21, DoorAnimPalettes_830F90C
	door_anim_gfx 0x224, 0, DoorAnimTiles_22, DoorAnimPalettes_830F954
	door_anim_gfx 0x289, 0, DoorAnimTiles_23, DoorAnimPalettes_830F95C
	door_anim_gfx 0x30C, 1, DoorAnimTiles_24, DoorAnimPalettes_830F964
	door_anim_gfx 0x32D, 1, DoorAnimTiles_25, DoorAnimPalettes_830F96C
	door_anim_gfx 0x2ED, 1, DoorAnimTiles_26, DoorAnimPalettes_830F974
	door_anim_gfx 0x264, 1, DoorAnimTiles_27, DoorAnimPalettes_830F97C
	door_anim_gfx 0x22B, 0, DoorAnimTiles_28, DoorAnimPalettes_830F984
	door_anim_gfx 0x2F7, 0, DoorAnimTiles_29, DoorAnimPalettes_830F98C
	door_anim_gfx 0x297, 0, DoorAnimTiles_30, DoorAnimPalettes_830F994
	door_anim_gfx 0x285, 1, DoorAnimTiles_31, DoorAnimPalettes_830F99C
	door_anim_gfx 0x25D, 1, DoorAnimTiles_32, DoorAnimPalettes_830F9A4
	door_anim_gfx 0x20E, 1, DoorAnimTiles_33, DoorAnimPalettes_830F9AC
	door_anim_gfx 0, 0, 0, 0

	.align 2
gUnknown_0830FB58:: @ 830FB58
	.4byte MetatileBehavior_IsTrickHouseSlipperyFloor
	.4byte MetatileBehavior_IsIce_2
	.4byte MetatileBehavior_IsWalkSouth
	.4byte MetatileBehavior_IsWalkNorth
	.4byte MetatileBehavior_IsWalkWest
	.4byte MetatileBehavior_IsWalkEast
	.4byte MetatileBehavior_IsSouthwardCurrent
	.4byte MetatileBehavior_IsNorthwardCurrent
	.4byte MetatileBehavior_IsWestwardCurrent
	.4byte MetatileBehavior_IsEastwardCurrent
	.4byte MetatileBehavior_IsSlideSouth
	.4byte MetatileBehavior_IsSlideNorth
	.4byte MetatileBehavior_IsSlideWest
	.4byte MetatileBehavior_IsSlideEast
	.4byte MetatileBehavior_IsWaterfall
	.4byte MetatileBehavior_0xBB
	.4byte MetatileBehavior_0xBC
	.4byte MetatileBehavior_IsMuddySlope

	.align 2
gUnknown_0830FBA0:: @ 830FBA0
	.4byte ForcedMovement_None
	.4byte ForcedMovement_Slip
	.4byte ForcedMovement_Slip
	.4byte sub_8058AAC
	.4byte sub_8058AC4
	.4byte sub_8058ADC
	.4byte sub_8058AF4
	.4byte sub_8058B0C
	.4byte sub_8058B24
	.4byte sub_8058B3C
	.4byte sub_8058B54
	.4byte ForcedMovement_SlideSouth
	.4byte ForcedMovement_SlideNorth
	.4byte ForcedMovement_SlideWest
	.4byte ForcedMovement_SlideEast
	.4byte sub_8058B0C
	.4byte sub_8058C04
	.4byte sub_8058C10
	.4byte ForcedMovement_MuddySlope

	.align 2
gUnknown_0830FBEC:: @ 830FBEC
	.4byte PlayerNotOnBikeNotMoving
	.4byte PlayerNotOnBikeTurningInPlace
	.4byte sub_8058D0C

	.align 2
gUnknown_0830FBF8:: @ 830FBF8
	.4byte MetatileBehavior_IsBumpySlope
	.4byte MetatileBehavior_IsIsolatedVerticalRail
	.4byte MetatileBehavior_IsIsolatedHorizontalRail
	.4byte MetatileBehavior_IsVerticalRail
	.4byte MetatileBehavior_IsHorizontalRail

gUnknown_0830FC0C:: @ 830FC0C
	.byte 0x9, 0xA, 0xB, 0xC, 0xD

	.align 2
gUnknown_0830FC14:: @ 830FC14
	.4byte PlayerAvatarTransition_Normal
	.4byte PlayerAvatarTransition_MachBike
	.4byte PlayerAvatarTransition_AcroBike
	.4byte PlayerAvatarTransition_Surfing
	.4byte PlayerAvatarTransition_Underwater
	.4byte sub_80591F4
	.4byte nullsub_49
	.4byte nullsub_49

	.align 2
gUnknown_0830FC34:: @ 830FC34
	.4byte MetatileBehavior_IsSouthArrowWarp
	.4byte MetatileBehavior_IsNorthArrowWarp
	.4byte MetatileBehavior_IsWestArrowWarp
	.4byte MetatileBehavior_IsEastArrowWarp

gUnknown_0830FC44:: @ 830FC44
	.byte MAP_OBJ_GFX_RIVAL_BRENDAN_NORMAL,     MAP_OBJ_GFX_RIVAL_MAY_NORMAL
	.byte MAP_OBJ_GFX_RIVAL_BRENDAN_MACH_BIKE,  MAP_OBJ_GFX_RIVAL_MAY_MACH_BIKE
	.byte MAP_OBJ_GFX_RIVAL_BRENDAN_ACRO_BIKE,  MAP_OBJ_GFX_RIVAL_MAY_ACRO_BIKE
	.byte MAP_OBJ_GFX_RIVAL_BRENDAN_SURFING,    MAP_OBJ_GFX_RIVAL_MAY_SURFING
	.byte MAP_OBJ_GFX_BRENDAN_UNDERWATER,       MAP_OBJ_GFX_MAY_UNDERWATER
	.byte MAP_OBJ_GFX_RIVAL_BRENDAN_FIELD_MOVE, MAP_OBJ_GFX_RIVAL_MAY_FIELD_MOVE
	.byte MAP_OBJ_GFX_BRENDAN_FISHING,          MAP_OBJ_GFX_MAY_FISHING
	.byte MAP_OBJ_GFX_BRENDAN_WATERING,         MAP_OBJ_GFX_MAY_WATERING

gUnknown_0830FC54:: @ 830FC54
	.byte MAP_OBJ_GFX_BRENDAN_NORMAL,     MAP_OBJ_GFX_MAY_NORMAL
	.byte MAP_OBJ_GFX_BRENDAN_MACH_BIKE,  MAP_OBJ_GFX_MAY_MACH_BIKE
	.byte MAP_OBJ_GFX_BRENDAN_ACRO_BIKE,  MAP_OBJ_GFX_MAY_ACRO_BIKE
	.byte MAP_OBJ_GFX_BRENDAN_SURFING,    MAP_OBJ_GFX_MAY_SURFING
	.byte MAP_OBJ_GFX_BRENDAN_UNDERWATER, MAP_OBJ_GFX_MAY_UNDERWATER
	.byte MAP_OBJ_GFX_BRENDAN_FIELD_MOVE, MAP_OBJ_GFX_MAY_FIELD_MOVE
	.byte MAP_OBJ_GFX_BRENDAN_FISHING,    MAP_OBJ_GFX_MAY_FISHING
	.byte MAP_OBJ_GFX_BRENDAN_WATERING,   MAP_OBJ_GFX_MAY_WATERING

gUnknown_0830FC64:: @ 830FC64
	@ male
	.byte MAP_OBJ_GFX_BRENDAN_NORMAL,      1
	.byte MAP_OBJ_GFX_BRENDAN_MACH_BIKE,   2
	.byte MAP_OBJ_GFX_BRENDAN_ACRO_BIKE,   4
	.byte MAP_OBJ_GFX_BRENDAN_SURFING,     8
	.byte MAP_OBJ_GFX_BRENDAN_UNDERWATER, 16
	@ female
	.byte MAP_OBJ_GFX_MAY_NORMAL,          1
	.byte MAP_OBJ_GFX_MAY_MACH_BIKE,       2
	.byte MAP_OBJ_GFX_MAY_ACRO_BIKE,       4
	.byte MAP_OBJ_GFX_MAY_SURFING,         8
	.byte MAP_OBJ_GFX_MAY_UNDERWATER,     16

	.align 2
gUnknown_0830FC78:: @ 830FC78
	.4byte MetatileBehavior_IsSouthArrowWarp
	.4byte MetatileBehavior_IsNorthArrowWarp
	.4byte MetatileBehavior_IsWestArrowWarp
	.4byte MetatileBehavior_IsEastArrowWarp

	.align 2
gUnknown_0830FC88:: @ 830FC88
	.4byte sub_8059E84
	.4byte sub_8059EA4
	.4byte sub_8059F40

	.align 2
gUnknown_0830FC94:: @ 830FC94
	.4byte sub_805A000

	.align 2
gUnknown_0830FC98:: @ 830FC98
	.4byte sub_805A0D8
	.4byte sub_805A100
	.4byte sub_805A178
	.4byte sub_805A1B8

gUnknown_0830FCA8:: @ 830FCA8
	.byte DIR_WEST, DIR_EAST, DIR_NORTH, DIR_SOUTH

gUnknown_0830FCAC:: @ 830FCAC
	.byte 0x10, 0x10, 0x11, 0x12, 0x13

	.align 2
gUnknown_0830FCB4:: @ 830FCB4
	.4byte Fishing1
	.4byte Fishing2
	.4byte Fishing3
	.4byte Fishing4
	.4byte Fishing5
	.4byte Fishing6
	.4byte Fishing7
	.4byte Fishing8
	.4byte Fishing9
	.4byte Fishing10
	.4byte Fishing11
	.4byte Fishing12
	.4byte Fishing13
	.4byte Fishing14
	.4byte Fishing15
	.4byte Fishing16

	.align 1
gUnknown_0830FCF4:: @ 830FCF4
	.2byte 1, 1, 1

	.align 1
gUnknown_0830FCFA:: @ 830FCFA
	.2byte 1, 3, 6

gUnknown_0830FD00:: @ 830FD00
	.string "·$"

	.align 1
gUnknown_0830FD02:: @ 830FD02
	.2byte 36, 33, 30

	.align 1
gUnknown_0830FD08:: @ 830FD08
	.2byte 0, 0, 40, 10, 70, 30

gUnknown_0830FD14:: @ 830FD14
	.byte 1, 1, 6, 7, 8, 9, 6, 7, 8, 9, 11, 11, 0, 0, 0, 0

	.align 2
gSpriteTemplate_830FD24:: @ 830FD24
	spr_template 0, 0xFFFF, gDummyOamData, gDummySpriteAnimTable, NULL, gDummySpriteAffineAnimTable, ObjectCB_CameraObject

	.align 2
gUnknown_0830FD3C:: @ 830FD3C
	.4byte CameraObject_0
	.4byte CameraObject_1
	.4byte CameraObject_2

@ 830FD48
	.include "data/graphics/field_objects/map_object_graphics.inc"

@ 8368528
	.include "data/graphics/field_objects/field_effect_object_graphics.inc"

	.align 2
gUnknown_0836DA88:: @ 836DA88
	.4byte sub_805C884
	.4byte sub_805CDE8
	.4byte sub_805C8AC
	.4byte sub_805CF28
	.4byte sub_805CF28
	.4byte sub_805D0AC
	.4byte sub_805D0AC
	.4byte sub_805D230
	.4byte sub_805D230
	.4byte sub_805D230
	.4byte sub_805D230
	.4byte sub_80587B4
	.4byte FieldObjectCB_BerryTree
	.4byte sub_805D4F4
	.4byte sub_805D634
	.4byte sub_805D774
	.4byte sub_805D8B4
	.4byte sub_805D9F4
	.4byte sub_805DB34
	.4byte sub_805DC74
	.4byte sub_805DDB4
	.4byte sub_805DEF4
	.4byte sub_805E034
	.4byte sub_805E174
	.4byte sub_805E278
	.4byte sub_805E37C
	.4byte sub_805E37C
	.4byte sub_805E37C
	.4byte sub_805E37C
	.4byte sub_805E5DC
	.4byte sub_805E668
	.4byte sub_805E6F4
	.4byte sub_805E780
	.4byte sub_805E80C
	.4byte sub_805E898
	.4byte sub_805E924
	.4byte sub_805E9B0
	.4byte sub_805EA3C
	.4byte sub_805EAC8
	.4byte sub_805EB54
	.4byte sub_805EBE0
	.4byte sub_805EC6C
	.4byte sub_805ECF8
	.4byte sub_805ED84
	.4byte sub_805EE10
	.4byte sub_805EE9C
	.4byte sub_805EF28
	.4byte sub_805EFB4
	.4byte sub_805F040
	.4byte sub_805F0CC
	.4byte sub_805F158
	.4byte sub_805F1E4
	.4byte sub_805F270
	.4byte sub_805F2FC
	.4byte sub_805F2FC
	.4byte sub_805F2FC
	.4byte sub_805F2FC
	.4byte FieldObjectCB_TreeDisguise
	.4byte FieldObjectCB_MountainDisguise
	.4byte sub_805F8E0
	.4byte sub_805F8E0
	.4byte sub_805F8E0
	.4byte sub_805F8E0
	.4byte FieldObjectCB_Hidden1
	.4byte sub_805FB20
	.4byte sub_805FB20
	.4byte sub_805FB20
	.4byte sub_805FB20
	.4byte sub_805FB90
	.4byte sub_805FB90
	.4byte sub_805FB90
	.4byte sub_805FB90
	.4byte sub_805FC00
	.4byte sub_805FC00
	.4byte sub_805FC00
	.4byte sub_805FC00
	.4byte sub_805FC70

gUnknown_0836DBBC:: @ 836DBBC
	.byte 0
	.byte 0
	.byte 1
	.byte 1
	.byte 1
	.byte 1
	.byte 1
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 1
	.byte 1
	.byte 1
	.byte 1
	.byte 1
	.byte 1
	.byte 1
	.byte 1
	.byte 1
	.byte 1
	.byte 1
	.byte 1
	.byte 1
	.byte 1
	.byte 1
	.byte 1
	.byte 1
	.byte 1
	.byte 1
	.byte 1
	.byte 1
	.byte 1
	.byte 1
	.byte 1
	.byte 1
	.byte 1
	.byte 1
	.byte 1
	.byte 1
	.byte 1
	.byte 1
	.byte 1
	.byte 0
	.byte 0
	.byte 1
	.byte 1
	.byte 1
	.byte 1
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0

gUnknown_0836DC09:: @ 836DC09
	.byte DIR_SOUTH
	.byte DIR_SOUTH
	.byte DIR_SOUTH
	.byte DIR_NORTH
	.byte DIR_SOUTH
	.byte DIR_WEST
	.byte DIR_EAST
	.byte DIR_NORTH
	.byte DIR_SOUTH
	.byte DIR_WEST
	.byte DIR_EAST
	.byte DIR_SOUTH
	.byte DIR_SOUTH
	.byte DIR_SOUTH
	.byte DIR_WEST
	.byte DIR_NORTH
	.byte DIR_NORTH
	.byte DIR_SOUTH
	.byte DIR_SOUTH
	.byte DIR_SOUTH
	.byte DIR_SOUTH
	.byte DIR_NORTH
	.byte DIR_SOUTH
	.byte DIR_SOUTH
	.byte DIR_SOUTH
	.byte DIR_NORTH
	.byte DIR_SOUTH
	.byte DIR_WEST
	.byte DIR_EAST
	.byte DIR_NORTH
	.byte DIR_EAST
	.byte DIR_SOUTH
	.byte DIR_WEST
	.byte DIR_NORTH
	.byte DIR_WEST
	.byte DIR_SOUTH
	.byte DIR_EAST
	.byte DIR_WEST
	.byte DIR_NORTH
	.byte DIR_EAST
	.byte DIR_SOUTH
	.byte DIR_EAST
	.byte DIR_NORTH
	.byte DIR_WEST
	.byte DIR_SOUTH
	.byte DIR_NORTH
	.byte DIR_SOUTH
	.byte DIR_WEST
	.byte DIR_EAST
	.byte DIR_NORTH
	.byte DIR_SOUTH
	.byte DIR_WEST
	.byte DIR_EAST
	.byte DIR_NORTH
	.byte DIR_SOUTH
	.byte DIR_WEST
	.byte DIR_EAST
	.byte DIR_SOUTH
	.byte DIR_SOUTH
	.byte DIR_NORTH
	.byte DIR_SOUTH
	.byte DIR_WEST
	.byte DIR_EAST
	.byte DIR_SOUTH
	.byte DIR_SOUTH
	.byte DIR_NORTH
	.byte DIR_WEST
	.byte DIR_EAST
	.byte DIR_SOUTH
	.byte DIR_NORTH
	.byte DIR_WEST
	.byte DIR_EAST
	.byte DIR_SOUTH
	.byte DIR_NORTH
	.byte DIR_WEST
	.byte DIR_EAST
	.byte DIR_SOUTH

@ 836DC58
	.include "data/graphics/field_objects/map_object_graphics_info_pointers.inc"

@ 836DFC0
	.include "data/graphics/field_objects/field_effect_object_template_pointers.inc"

@ 836E050
	.include "data/graphics/field_objects/map_object_pic_tables.inc"

@ 83708C8
	.include "data/graphics/field_objects/map_object_anims.inc"

@ 83711C4
	.include "data/graphics/field_objects/base_oam.inc"

@ 8371204
	.include "data/graphics/field_objects/map_object_subsprites.inc"

@ 83718D4
	.include "data/graphics/field_objects/map_object_graphics_info.inc"

	.align 2
gUnknown_0837377C:: @ 837377C
	obj_pal gMapObjectPalette0, 0x1103
	obj_pal gMapObjectPalette1, 0x1104
	obj_pal gMapObjectPalette2, 0x1105
	obj_pal gMapObjectPalette3, 0x1106
	obj_pal gMapObjectPalette4, 0x1107
	obj_pal gMapObjectPalette5, 0x1108
	obj_pal gMapObjectPalette6, 0x1109
	obj_pal gMapObjectPalette7, 0x110A
	obj_pal gMapObjectPalette8, 0x1100
	obj_pal gMapObjectPalette9, 0x1101
	obj_pal gMapObjectPalette10, 0x1102
	obj_pal gMapObjectPalette11, 0x1115
	obj_pal gMapObjectPalette12, 0x110B
	obj_pal gMapObjectPalette13, 0x110C
	obj_pal gMapObjectPalette14, 0x110D
	obj_pal gMapObjectPalette15, 0x110E
	obj_pal gMapObjectPalette16, 0x110F
	obj_pal gMapObjectPalette17, 0x1110
	obj_pal gMapObjectPalette18, 0x1111
	obj_pal gMapObjectPalette19, 0x1112
	obj_pal gMapObjectPalette20, 0x1113
	obj_pal gMapObjectPalette21, 0x1114
	obj_pal gMapObjectPalette22, 0x1116
	obj_pal gMapObjectPalette23, 0x1117
	obj_pal gMapObjectPalette24, 0x1118
	obj_pal gMapObjectPalette25, 0x1119
	obj_pal gMapObjectPalette26, 0x111A
	null_obj_pal

	.align 1
Palettes_837385C:
	.2byte 0x1101
	.2byte 0x1101
	.2byte 0x1101
	.2byte 0x1101

	@ unused?
	.2byte 0x1111
	.2byte 0x1111
	.2byte 0x1111
	.2byte 0x1111

	.align 1
Palettes_837386C:
	.2byte 0x1115
	.2byte 0x1115
	.2byte 0x1115
	.2byte 0x1115

	.align 2
gUnknown_08373874:: @ 8373874
	paired_pals 0x1100, Palettes_837385C
	paired_pals 0x1110, Palettes_837385C
	paired_pals 0x1115, Palettes_837386C
	paired_pals 0x11FF, NULL

	.align 1
Palettes_8373894:
	.2byte 0x110C
	.2byte 0x110C
	.2byte 0x110C
	.2byte 0x110C

	.align 1
Palettes_837389C:
	.2byte 0x110D
	.2byte 0x110D
	.2byte 0x110D
	.2byte 0x110D

	.align 1
Palettes_83738A4:
	.2byte 0x110E
	.2byte 0x110E
	.2byte 0x110E
	.2byte 0x110E

	.align 1
Palettes_83738AC:
	.2byte 0x1112
	.2byte 0x1112
	.2byte 0x1112
	.2byte 0x1112

	.align 1
Palettes_83738B4:
	.2byte 0x1113
	.2byte 0x1113
	.2byte 0x1113
	.2byte 0x1113

	.align 1
Palettes_83738BC:
	.2byte 0x1114
	.2byte 0x1114
	.2byte 0x1114
	.2byte 0x1114

	.align 1
Palettes_83738C4:
	.2byte 0x111A
	.2byte 0x111A
	.2byte 0x111A
	.2byte 0x111A

	.align 1
Palettes_83738CC:
	.2byte 0x1117
	.2byte 0x1117
	.2byte 0x1117
	.2byte 0x1117

	.align 1
Palettes_83738D4:
	.2byte 0x1119
	.2byte 0x1119
	.2byte 0x1119
	.2byte 0x1119

	.align 1
Palettes_83738DC:
	.2byte 0x1109
	.2byte 0x1109
	.2byte 0x1109
	.2byte 0x1109

	.align 2
gUnknown_083738E4:: @ 83738E4
	paired_pals 0x1100, Palettes_837385C
	paired_pals 0x1110, Palettes_837385C
	paired_pals 0x110B, Palettes_8373894
	paired_pals 0x110D, Palettes_837389C
	paired_pals 0x110E, Palettes_83738A4
	paired_pals 0x1112, Palettes_83738AC
	paired_pals 0x1113, Palettes_83738B4
	paired_pals 0x1114, Palettes_83738BC
	paired_pals 0x1116, Palettes_83738CC
	paired_pals 0x1118, Palettes_83738D4
	paired_pals 0x1105, Palettes_83738DC
	paired_pals 0x111A, Palettes_83738C4
	paired_pals 0x11FF, NULL

	.align 1
Unknown_837394C:
	.2byte 0x1100
	.2byte 0x1101
	.2byte 0x1103
	.2byte 0x1104
	.2byte 0x1105
	.2byte 0x1106
	.2byte 0x1107
	.2byte 0x1108
	.2byte 0x1109
	.2byte 0x110A

	.align 1
Unknown_8373960:
	.2byte 0x1100
	.2byte 0x1101
	.2byte 0x1103
	.2byte 0x1104
	.2byte 0x1105
	.2byte 0x1106
	.2byte 0x1107
	.2byte 0x1108
	.2byte 0x1109
	.2byte 0x110A

	.align 1
Unknown_8373974:
	.2byte 0x1100
	.2byte 0x1101
	.2byte 0x1103
	.2byte 0x1104
	.2byte 0x1105
	.2byte 0x1106
	.2byte 0x1107
	.2byte 0x1108
	.2byte 0x1109
	.2byte 0x110A

	.align 1
Unknown_8373988:
	.2byte 0x1100
	.2byte 0x1101
	.2byte 0x1103
	.2byte 0x1104
	.2byte 0x1105
	.2byte 0x1106
	.2byte 0x1107
	.2byte 0x1108
	.2byte 0x1109
	.2byte 0x110A

	.align 2
gUnknown_0837399C:: @ 837399C
	.4byte Unknown_837394C
	.4byte Unknown_8373960
	.4byte Unknown_8373974
	.4byte Unknown_8373988

@ 83739AC
	.include "data/graphics/field_objects/berry_tree_graphics_tables.inc"

@ 8374524
	.include "data/graphics/field_objects/field_effect_objects.inc"

	.align 1
gUnknown_0837520C:: @ 837520C
	.2byte 0x20, 0x40, 0x60, 0x80, 0x20, 0x40, 0x80, 0xC0

	.align 1
gUnknown_0837521C:: @ 837521C
	.2byte 0x20, 0x30, 0x40, 0x50

	.align 2
gUnknown_08375224:: @ 8375224
	.4byte sub_805C8F0
	.4byte sub_805C904
	.4byte sub_805C930
	.4byte sub_805C96C
	.4byte sub_805C98C
	.4byte sub_805C9D8
	.4byte sub_805CA08

gUnknown_08375240:: @ 8375240
	.byte DIR_SOUTH, DIR_NORTH, DIR_WEST, DIR_EAST

	.align 2
gUnknown_08375244:: @ 8375244
	.4byte sub_805CAAC
	.4byte sub_805CADC
	.4byte sub_805CAEC
	.4byte sub_805CB00
	.4byte sub_805CB5C
	.4byte sub_805CBB8
	.4byte sub_805CC14
	.4byte sub_805CC70
	.4byte sub_805CCAC
	.4byte sub_805CCE8
	.4byte sub_805CD24

	.align 2
gUnknown_08375270:: @ 8375270
	.4byte sub_805CE2C
	.4byte sub_805CE40
	.4byte sub_805CE6C
	.4byte sub_805CEB0
	.4byte sub_805CEE0

	.align 2
gUnknown_08375284:: @ 8375284
	.4byte sub_805CF6C
	.4byte sub_805CF80
	.4byte sub_805CFAC
	.4byte sub_805CFE8
	.4byte sub_805D008
	.4byte sub_805D054
	.4byte sub_805D084

gUnknown_083752A0:: @ 83752A0
	.byte DIR_SOUTH, DIR_NORTH

	.align 2
gUnknown_083752A4:: @ 83752A4
	.4byte sub_805D0F0
	.4byte sub_805D104
	.4byte sub_805D130
	.4byte sub_805D16C
	.4byte sub_805D18C
	.4byte sub_805D1D8
	.4byte sub_805D208

gUnknown_083752C0:: @ 83752C0
	.byte DIR_WEST, DIR_EAST

	.align 2
gUnknown_083752C4:: @ 83752C4
	.4byte sub_805D274
	.4byte sub_805D2A0
	.4byte sub_805D2C0

	.align 2
gUnknown_083752D0:: @ 83752D0
	.4byte do_berry_tree_growth_sparkle_1
	.4byte sub_805D3EC
	.4byte do_berry_tree_growth_sparkle_2
	.4byte sub_805D458
	.4byte sub_805D4A8

	.align 2
gUnknown_083752E4:: @ 83752E4
	.4byte sub_805D538
	.4byte sub_805D54C
	.4byte sub_805D578
	.4byte sub_805D5BC
	.4byte sub_805D5EC

	.align 2
gUnknown_083752F8:: @ 83752F8
	.4byte sub_805D678
	.4byte sub_805D68C
	.4byte sub_805D6B8
	.4byte sub_805D6FC
	.4byte sub_805D72C

	.align 2
gUnknown_0837530C:: @ 837530C
	.4byte sub_805D7B8
	.4byte sub_805D7CC
	.4byte sub_805D7F8
	.4byte sub_805D83C
	.4byte sub_805D86C

gUnknown_08375320:: @ 8375320
	.byte DIR_NORTH, DIR_WEST

	.align 2
gUnknown_08375324:: @ 8375324
	.4byte sub_805D8F8
	.4byte sub_805D90C
	.4byte sub_805D938
	.4byte sub_805D97C
	.4byte sub_805D9AC

gUnknown_08375338:: @ 8375338
	.byte DIR_NORTH, DIR_EAST

	.align 2
gUnknown_0837533C:: @ 837533C
	.4byte sub_805DA38
	.4byte sub_805DA4C
	.4byte sub_805DA78
	.4byte sub_805DABC
	.4byte sub_805DAEC

gUnknown_08375350:: @ 8375350
	.byte DIR_SOUTH, DIR_WEST

	.align 2
gUnknown_08375354:: @ 8375354
	.4byte sub_805DB78
	.4byte sub_805DB8C
	.4byte sub_805DBB8
	.4byte sub_805DBFC
	.4byte sub_805DC2C

gUnknown_08375368:: @ 8375368
	.byte DIR_SOUTH, DIR_EAST

	.align 2
gUnknown_0837536C:: @ 837536C
	.4byte sub_805DCB8
	.4byte sub_805DCCC
	.4byte sub_805DCF8
	.4byte sub_805DD3C
	.4byte sub_805DD6C

gUnknown_08375380:: @ 8375380
	.byte DIR_NORTH, DIR_SOUTH, DIR_WEST, DIR_SOUTH

	.align 2
gUnknown_08375384:: @ 8375384
	.4byte sub_805DDF8
	.4byte sub_805DE0C
	.4byte sub_805DE38
	.4byte sub_805DE7C
	.4byte sub_805DEAC

gUnknown_08375398:: @ 8375398
	.byte DIR_SOUTH, DIR_NORTH, DIR_EAST, DIR_SOUTH

	.align 2
gUnknown_0837539C:: @ 837539C
	.4byte sub_805DF38
	.4byte sub_805DF4C
	.4byte sub_805DF78
	.4byte sub_805DFBC
	.4byte sub_805DFEC

gUnknown_083753B0:: @ 83753B0
	.byte DIR_NORTH, DIR_WEST, DIR_EAST, DIR_NORTH

	.align 2
gUnknown_083753B4:: @ 83753B4
	.4byte sub_805E078
	.4byte sub_805E08C
	.4byte sub_805E0B8
	.4byte sub_805E0FC
	.4byte sub_805E12C

gUnknown_083753C8:: @ 83753C8
	.byte DIR_WEST, DIR_EAST, DIR_SOUTH, DIR_SOUTH

	.align 2
gUnknown_083753CC:: @ 83753CC
	.4byte sub_805E1B8
	.4byte sub_805E1E4
	.4byte sub_805E208
	.4byte sub_805E234

gUnknown_083753DC:: @ 83753DC
	.byte DIR_SOUTH, DIR_EAST, DIR_WEST, DIR_SOUTH, DIR_NORTH

	.align 2
gUnknown_083753E4:: @ 83753E4
	.4byte sub_805E2BC
	.4byte sub_805E2E8
	.4byte sub_805E30C
	.4byte sub_805E338

gUnknown_083753F4:: @ 83753F4
	.byte DIR_SOUTH, DIR_WEST, DIR_EAST, DIR_NORTH, DIR_SOUTH

	.align 2
gUnknown_083753FC:: @ 83753FC
	.4byte sub_805E3C0
	.4byte sub_805E3D4
	.4byte sub_805E40C
	.4byte sub_805E4C4

	.align 2
gUnknown_0837540C:: @ 837540C
	.4byte sub_805E4EC
	.4byte sub_805E620
	.4byte sub_805E5B4

gUnknown_08375418:: @ 8375418
	.byte DIR_NORTH, DIR_EAST, DIR_WEST, DIR_SOUTH

	.align 2
gUnknown_0837541C:: @ 837541C
	.4byte sub_805E4EC
	.4byte sub_805E6AC
	.4byte sub_805E5B4

	.align 2
gUnknown_08375428:: @ 8375428
	.byte DIR_EAST, DIR_WEST, DIR_SOUTH, DIR_NORTH

gUnknown_0837542C:: @ 837542C
	.4byte sub_805E4EC
	.4byte sub_805E738
	.4byte sub_805E5B4

gUnknown_08375438:: @ 8375438
	.byte DIR_SOUTH, DIR_NORTH, DIR_EAST, DIR_WEST

	.align 2
gUnknown_0837543C:: @ 837543C
	.4byte sub_805E4EC
	.4byte sub_805E7C4
	.4byte sub_805E5B4

gUnknown_08375448:: @ 8375448
	.byte DIR_WEST, DIR_SOUTH, DIR_NORTH, DIR_EAST

	.align 2
gUnknown_0837544C:: @ 837544C
	.4byte sub_805E4EC
	.4byte sub_805E850
	.4byte sub_805E5B4

gUnknown_08375458:: @ 8375458
	.byte DIR_NORTH, DIR_WEST, DIR_EAST, DIR_SOUTH

	.align 2
gUnknown_0837545C:: @ 837545C
	.4byte sub_805E4EC
	.4byte sub_805E8DC
	.4byte sub_805E5B4

gUnknown_08375468:: @ 8375468
	.byte DIR_WEST, DIR_EAST, DIR_SOUTH, DIR_NORTH

	.align 2
gUnknown_0837546C:: @ 837546C
	.4byte sub_805E4EC
	.4byte sub_805E968
	.4byte sub_805E5B4

	.align 2
gUnknown_08375478:: @ 8375478
	.4byte sub_805E4EC
	.4byte sub_805E9F4
	.4byte sub_805E5B4

gUnknown_08375484:: @ 8375484
	.byte DIR_EAST, DIR_SOUTH, DIR_NORTH, DIR_WEST

	.align 2
gUnknown_08375488:: @ 8375488
	.4byte sub_805E4EC
	.4byte sub_805EA80
	.4byte sub_805E5B4

gUnknown_08375494:: @ 8375494
	.byte DIR_WEST, DIR_NORTH, DIR_SOUTH, DIR_EAST

	.align 2
gUnknown_08375498:: @ 8375498
	.4byte sub_805E4EC
	.4byte sub_805EB0C
	.4byte sub_805E5B4

gUnknown_083754A4:: @ 83754A4
	.byte DIR_NORTH, DIR_SOUTH, DIR_EAST, DIR_WEST

	.align 2
gUnknown_083754A8:: @ 83754A8
	.4byte sub_805E4EC
	.4byte sub_805EB98
	.4byte sub_805E5B4

gUnknown_083754B4:: @ 83754B4
	.byte DIR_EAST, DIR_WEST, DIR_NORTH, DIR_SOUTH

	.align 2
gUnknown_083754B8:: @ 83754B8
	.4byte sub_805E4EC
	.4byte sub_805EC24
	.4byte sub_805E5B4

gUnknown_083754C4:: @ 83754C4
	.byte DIR_SOUTH, DIR_EAST, DIR_WEST, DIR_NORTH

	.align 2
gUnknown_083754C8:: @ 83754C8
	.4byte sub_805E4EC
	.4byte sub_805ECB0
	.4byte sub_805E5B4

gUnknown_083754D4:: @ 83754D4
	.byte DIR_EAST, DIR_NORTH, DIR_SOUTH, DIR_WEST

	.align 2
gUnknown_083754D8:: @ 83754D8
	.4byte sub_805E4EC
	.4byte sub_805ED3C
	.4byte sub_805E5B4

gUnknown_083754E4:: @ 83754E4
	.byte DIR_NORTH, DIR_SOUTH, DIR_WEST, DIR_EAST

	.align 2
gUnknown_083754E8:: @ 83754E8
	.4byte sub_805E4EC
	.4byte sub_805EDC8
	.4byte sub_805E5B4

gUnknown_083754F4:: @ 83754F4
	.byte DIR_WEST, DIR_EAST, DIR_NORTH, DIR_SOUTH

	.align 2
gUnknown_083754F8:: @ 83754F8
	.4byte sub_805E4EC
	.4byte sub_805EE54
	.4byte sub_805E5B4

gUnknown_08375504:: @ 8375504
	.byte DIR_SOUTH, DIR_WEST, DIR_EAST, DIR_NORTH

	.align 2
gUnknown_08375508:: @ 8375508
	.4byte sub_805E4EC
	.4byte sub_805EEE0
	.4byte sub_805E5B4

gUnknown_08375514:: @ 8375514
	.byte DIR_NORTH, DIR_WEST, DIR_SOUTH, DIR_EAST

	.align 2
gUnknown_08375518:: @ 8375518
	.4byte sub_805E4EC
	.4byte sub_805EF6C
	.4byte sub_805E5B4

gUnknown_08375524:: @ 8375524
	.byte DIR_SOUTH, DIR_EAST, DIR_NORTH, DIR_WEST

	.align 2
gUnknown_08375528:: @ 8375528
	.4byte sub_805E4EC
	.4byte sub_805EFF8
	.4byte sub_805E5B4

gUnknown_08375534:: @ 8375534
	.byte DIR_WEST, DIR_SOUTH, DIR_EAST, DIR_NORTH

	.align 2
gUnknown_08375538:: @ 8375538
	.4byte sub_805E4EC
	.4byte sub_805F084
	.4byte sub_805E5B4

gUnknown_08375544:: @ 8375544
	.byte DIR_EAST, DIR_NORTH, DIR_WEST, DIR_SOUTH

	.align 2
gUnknown_08375548:: @ 8375548
	.4byte sub_805E4EC
	.4byte sub_805F110
	.4byte sub_805E5B4

gUnknown_08375554:: @ 8375554
	.byte DIR_NORTH, DIR_EAST, DIR_SOUTH, DIR_WEST

	.align 2
gUnknown_08375558:: @ 8375558
	.4byte sub_805E4EC
	.4byte sub_805F19C
	.4byte sub_805E5B4

gUnknown_08375564:: @ 8375564
	.byte DIR_SOUTH, DIR_WEST, DIR_NORTH, DIR_EAST

	.align 2
gUnknown_08375568:: @ 8375568
	.4byte sub_805E4EC
	.4byte sub_805F228
	.4byte sub_805E5B4

gUnknown_08375574:: @ 8375574
	.byte DIR_WEST, DIR_NORTH, DIR_EAST, DIR_SOUTH

	.align 2
gUnknown_08375578:: @ 8375578
	.4byte sub_805E4EC
	.4byte sub_805F2B4
	.4byte sub_805E5B4

	.align 2
gUnknown_08375584:: @ 8375584
	.byte DIR_EAST, DIR_SOUTH, DIR_WEST, DIR_NORTH

	.align 2
gUnknown_08375588:: @ 8375588
	.4byte mss_npc_reset_oampriv3_1_unk2_unk3
	.4byte sub_805F364
	.4byte sub_805F3C4

	.align 2
gUnknown_08375594:: @ 8375594
	.4byte sub_805F3EC
	.4byte sub_805F3F0
	.4byte sub_805F438
	.4byte sub_805F4F0
	.4byte sub_805F5A8
	.4byte sub_805F660
	.4byte cph_IM_DIFFERENT
	.4byte sub_805F760
	.4byte oac_hopping
	.4byte sub_805F3EC
	.4byte sub_805F3EC

	.align 2
gUnknown_083755C0:: @ 83755C0
	.4byte mss_npc_reset_oampriv3_1_unk2_unk3
	.4byte mss_08062EA4
	.4byte sub_805F3C4

	.align 2
gUnknown_083755CC:: @ 83755CC
	.4byte sub_805FAF8

	.align 2
gUnknown_083755D0:: @ 83755D0
	.4byte sub_805FB64
	.4byte sub_805FB04

	.align 2
gUnknown_083755D8:: @ 83755D8
	.4byte sub_805FBD4
	.4byte sub_805FB04

	.align 2
gUnknown_083755E0:: @ 83755E0
	.4byte sub_805FC44
	.4byte sub_805FB04

	.align 2
gUnknown_083755E8:: @ 83755E8
	.4byte sub_805FCB4
	.4byte sub_805FCE8
	.4byte sub_805FD08

gUnknown_083755F4:: @ 83755F4
	.byte 0x00, 0x00, 0x01, 0x02, 0x03, 0x00, 0x00, 0x01, 0x01

gUnknown_083755FD:: @ 83755FD
	.byte 0x04, 0x04, 0x05, 0x06, 0x07, 0x04, 0x04, 0x05, 0x05

gUnknown_08375606:: @ 8375606
	.byte 0x08, 0x08, 0x09, 0x0A, 0x0B, 0x08, 0x08, 0x09, 0x09

gUnknown_0837560F:: @ 837560F
	.byte 0x0C, 0x0C, 0x0D, 0x0E, 0x0F, 0x0C, 0x0C, 0x0D, 0x0D

gUnknown_08375618:: @ 8375618
	.byte 0x10, 0x10, 0x11, 0x12, 0x13, 0x10, 0x10, 0x11, 0x11

gUnknown_08375621:: @ 8375621
	.byte 0x14, 0x14, 0x15, 0x16, 0x17, 0x14, 0x14, 0x15, 0x15

gUnknown_0837562A:: @ 837562A
	.byte 0x14, 0x14, 0x15, 0x16, 0x17, 0x14, 0x14, 0x15, 0x15

gUnknown_08375633:: @ 8375633
	.byte 0x18, 0x18, 0x19, 0x1A, 0x1B, 0x18, 0x18, 0x19, 0x19

gUnknown_0837563C:: @ 837563C
	.byte 0x1C, 0x1C, 0x1D, 0x1E, 0x1F, 0x1C, 0x1C, 0x1D, 0x1D

gUnknown_08375645:: @ 8375645
	.byte 0x20, 0x20, 0x21, 0x22, 0x23, 0x20, 0x20, 0x21, 0x21

gUnknown_0837564E:: @ 837564E
	.byte 0x24, 0x24, 0x25, 0x26, 0x27, 0x24, 0x24, 0x25, 0x25

gUnknown_08375657:: @ 8375657
	.byte 0x00, 0x00, 0x01, 0x02, 0x03, 0x00, 0x00, 0x01, 0x01

gUnknown_08375660:: @ 8375660
	.byte 0x04, 0x04, 0x05, 0x06, 0x07, 0x04, 0x04, 0x05, 0x05

gUnknown_08375669:: @ 8375669
	.byte 0x08, 0x08, 0x09, 0x0A, 0x0B, 0x08, 0x08, 0x09, 0x09

gUnknown_08375672:: @ 8375672
	.byte 0x14, 0x14, 0x15, 0x16, 0x17, 0x14, 0x14, 0x15, 0x15

gUnknown_0837567B:: @ 837567B
	.byte 0x08, 0x08, 0x07, 0x09, 0x0A, 0x08, 0x08, 0x07, 0x07

	.align 2
gUnknown_08375684:: @ 8375684
	.4byte MetatileBehavior_IsSouthBlocked
	.4byte MetatileBehavior_IsNorthBlocked
	.4byte MetatileBehavior_IsWestBlocked
	.4byte MetatileBehavior_IsEastBlocked

	.align 2
gUnknown_08375694:: @ 8375694
	.4byte MetatileBehavior_IsNorthBlocked
	.4byte MetatileBehavior_IsSouthBlocked
	.4byte MetatileBehavior_IsEastBlocked
	.4byte MetatileBehavior_IsWestBlocked

	.align 1
gDirectionToVector:: @ 83756A4
	.2byte  0,  0
	.2byte  0,  1
	.2byte  0, -1
	.2byte -1,  0
	.2byte  1,  0
	.2byte -1,  1
	.2byte  1,  1
	.2byte -1, -1
	.2byte  1, -1

gUnknown_083756C8:: @ 83756C8
	.byte 0x00, 0x00, 0x01, 0x02, 0x03

gUnknown_083756CD:: @ 83756CD
	.byte 0x04, 0x04, 0x05, 0x06, 0x07

gUnknown_083756D2:: @ 83756D2
	.byte 0x08, 0x08, 0x09, 0x0A, 0x0B

gUnknown_083756D7:: @ 83756D7
	.byte 0x15, 0x15, 0x16, 0x17, 0x18

gUnknown_083756DC:: @ 83756DC
	.byte 0x29, 0x29, 0x2A, 0x2B, 0x2C

gUnknown_083756E1:: @ 83756E1
	.byte 0x2D, 0x2D, 0x2E, 0x2F, 0x30

gUnknown_083756E6:: @ 83756E6
	.byte 0x31, 0x31, 0x32, 0x33, 0x34

gUnknown_083756EB:: @ 83756EB
	.byte 0x35, 0x35, 0x36, 0x37, 0x38

gUnknown_083756F0:: @ 83756F0
	.byte 0x0C, 0x0C, 0x0D, 0x0E, 0x0F

gUnknown_083756F5:: @ 83756F5
	.byte 0x46, 0x46, 0x47, 0x48, 0x49

gUnknown_083756FA:: @ 83756FA
	.byte 0x4B, 0x4B, 0x4A, 0x4D, 0x4C

gUnknown_083756FF:: @ 83756FF
	.byte 0x42, 0x42, 0x43, 0x44, 0x45

gUnknown_08375704:: @ 8375704
	.byte 0x3A, 0x3A, 0x3B, 0x3C, 0x3D

gUnknown_08375709:: @ 8375709
	.byte 0x19, 0x19, 0x1A, 0x1B, 0x1C

gUnknown_0837570E:: @ 837570E
	.byte 0x1D, 0x1D, 0x1E, 0x1F, 0x20

gUnknown_08375713:: @ 8375713
	.byte 0x21, 0x21, 0x22, 0x23, 0x24

gUnknown_08375718:: @ 8375718
	.byte 0x25, 0x25, 0x26, 0x27, 0x28

gUnknown_0837571D:: @ 837571D
	.byte 0x62, 0x62, 0x63, 0x64, 0x65

gUnknown_08375722:: @ 8375722
	.byte 0x66, 0x66, 0x67, 0x68, 0x69

gUnknown_08375727:: @ 8375727
	.byte 0x6A, 0x6A, 0x6B, 0x6C, 0x6D

gUnknown_0837572C:: @ 837572C
	.byte 0x6E, 0x6E, 0x6F, 0x70, 0x71

gUnknown_08375731:: @ 8375731
	.byte 0x72, 0x72, 0x73, 0x74, 0x75

gUnknown_08375736:: @ 8375736
	.byte 0x76, 0x76, 0x77, 0x78, 0x79

gUnknown_0837573B:: @ 837573B
	.byte 0x7A, 0x7A, 0x7B, 0x7C, 0x7D

gUnknown_08375740:: @ 8375740
	.byte 0x7E, 0x7E, 0x7F, 0x80, 0x81

gUnknown_08375745:: @ 8375745
	.byte 0x82, 0x82, 0x83, 0x84, 0x85

gUnknown_0837574A:: @ 837574A
	.byte 0x86, 0x86, 0x87, 0x88, 0x89

gUnknown_0837574F:: @ 837574F
	.byte 2, 1, 4, 3, 8, 7, 6, 5

gUnknown_08375757:: @ 8375757
	.byte 2, 1, 4, 3, 1, 2, 3, 4, 3, 4, 2, 1, 4, 3, 1, 2

gUnknown_08375767:: @ 8375767
	.byte 2, 1, 4, 3, 1, 2, 3, 4, 4, 3, 1, 2, 3, 4, 2, 1

	.align 2
gUnknown_08375778:: @ 8375778
	.4byte Unknown_83759A0
	.4byte Unknown_83759A8
	.4byte Unknown_83759B0
	.4byte Unknown_83759B8
	.4byte Unknown_83759D4
	.4byte Unknown_83759E0
	.4byte Unknown_83759EC
	.4byte Unknown_83759F8
	.4byte Unknown_8375A04
	.4byte Unknown_8375A10
	.4byte Unknown_8375A1C
	.4byte Unknown_8375A28
	.4byte Unknown_8375A40
	.4byte Unknown_8375A4C
	.4byte Unknown_8375A58
	.4byte Unknown_8375A64
	.4byte Unknown_8375A70
	.4byte Unknown_8375A7C
	.4byte Unknown_8375A88
	.4byte Unknown_8375A94
	.4byte Unknown_8375AA0
	.4byte Unknown_8375AAC
	.4byte Unknown_8375AB8
	.4byte Unknown_8375AC4
	.4byte Unknown_8375AD0
	.4byte Unknown_8375ADC
	.4byte Unknown_8375AE8
	.4byte Unknown_8375AF4
	.4byte Unknown_8375B00
	.4byte Unknown_8375B0C
	.4byte Unknown_8375B18
	.4byte Unknown_8375B24
	.4byte Unknown_8375B30
	.4byte Unknown_8375B3C
	.4byte Unknown_8375B48
	.4byte Unknown_8375B54
	.4byte Unknown_8375B60
	.4byte Unknown_8375B6C
	.4byte Unknown_8375B78
	.4byte Unknown_8375B84
	.4byte Unknown_8375B90
	.4byte Unknown_8375B9C
	.4byte Unknown_8375BA8
	.4byte Unknown_8375BB4
	.4byte Unknown_8375BC0
	.4byte Unknown_8375BCC
	.4byte Unknown_8375BD8
	.4byte Unknown_8375BE4
	.4byte Unknown_8375BF0
	.4byte Unknown_8375BFC
	.4byte Unknown_8375C08
	.4byte Unknown_8375C14
	.4byte Unknown_8375C20
	.4byte Unknown_8375C2C
	.4byte Unknown_8375C38
	.4byte Unknown_8375C44
	.4byte Unknown_8375C50
	.4byte Unknown_8375C5C
	.4byte Unknown_8375C68
	.4byte Unknown_8375C74
	.4byte Unknown_8375C80
	.4byte Unknown_8375C8C
	.4byte Unknown_8375C98
	.4byte Unknown_8375CA0
	.4byte Unknown_8375CA8
	.4byte Unknown_8375CB0
	.4byte Unknown_8375CB8
	.4byte Unknown_8375CC4
	.4byte Unknown_8375CD0
	.4byte Unknown_8375CDC
	.4byte Unknown_8375CE8
	.4byte Unknown_8375CF4
	.4byte Unknown_8375D00
	.4byte Unknown_8375D0C
	.4byte Unknown_8375D18
	.4byte Unknown_8375D24
	.4byte Unknown_8375D30
	.4byte Unknown_8375D3C
	.4byte Unknown_8375D48
	.4byte Unknown_8375D50
	.4byte Unknown_8375D5C
	.4byte Unknown_8375D64
	.4byte Unknown_8375D6C
	.4byte Unknown_8375D74
	.4byte Unknown_8375D7C
	.4byte Unknown_8375D84
	.4byte Unknown_8375D8C
	.4byte Unknown_8375D94
	.4byte Unknown_8375D9C
	.4byte Unknown_8375DA4
	.4byte Unknown_8375DB0
	.4byte Unknown_8375DC0
	.4byte Unknown_8375DD0
	.4byte Unknown_8375DD8
	.4byte Unknown_8375DE0
	.4byte Unknown_8375DE8
	.4byte Unknown_8375DF0
	.4byte Unknown_8375DFC
	.4byte Unknown_8375E08
	.4byte Unknown_8375E10
	.4byte Unknown_8375E18
	.4byte Unknown_8375E20
	.4byte Unknown_8375E28
	.4byte Unknown_8375E34
	.4byte Unknown_8375E40
	.4byte Unknown_8375E4C
	.4byte Unknown_8375E58
	.4byte Unknown_8375E64
	.4byte Unknown_8375E70
	.4byte Unknown_8375E7C
	.4byte Unknown_8375EB8
	.4byte Unknown_8375EC4
	.4byte Unknown_8375ED0
	.4byte Unknown_8375EDC
	.4byte Unknown_8375EE8
	.4byte Unknown_8375EF4
	.4byte Unknown_8375F00
	.4byte Unknown_8375F0C
	.4byte Unknown_8375F18
	.4byte Unknown_8375F24
	.4byte Unknown_8375F30
	.4byte Unknown_8375F3C
	.4byte Unknown_8375F48
	.4byte Unknown_8375F54
	.4byte Unknown_8375F60
	.4byte Unknown_8375F6C
	.4byte Unknown_8375F78
	.4byte Unknown_8375F84
	.4byte Unknown_8375F90
	.4byte Unknown_8375F9C
	.4byte Unknown_8375FA8
	.4byte Unknown_8375FB4
	.4byte Unknown_8375FC0
	.4byte Unknown_8375FCC
	.4byte Unknown_8375FD8
	.4byte Unknown_8375FE4
	.4byte Unknown_8375FF0
	.4byte Unknown_8375FFC

	.align 2
Unknown_83759A0:
	.4byte sub_8060CE0
	.4byte sub_8063474

	.align 2
Unknown_83759A8:
	.4byte sub_8060CF0
	.4byte sub_8063474

	.align 2
Unknown_83759B0:
	.4byte sub_8060D00
	.4byte sub_8063474

	.align 2
Unknown_83759B8:
	.4byte sub_8060D10
	.4byte sub_8063474

	.align 2
gUnknown_083759C0:: @ 83759C0
	.4byte get_go_image_anim_num
	.4byte get_go_fast_image_anim_num
	.4byte get_go_fast_image_anim_num
	.4byte get_go_faster_image_anim_num
	.4byte sub_805FD78

	.align 2
Unknown_83759D4:
	.4byte sub_8060F3C
	.4byte sub_8060F5C
	.4byte sub_8063474

	.align 2
Unknown_83759E0:
	.4byte sub_8060F7C
	.4byte sub_8060F9C
	.4byte sub_8063474

	.align 2
Unknown_83759EC:
	.4byte sub_8060FBC
	.4byte sub_8060FDC
	.4byte sub_8063474

	.align 2
Unknown_83759F8:
	.4byte sub_8060FFC
	.4byte sub_806101C
	.4byte sub_8063474

	.align 2
Unknown_8375A04:
	.4byte sub_806103C
	.4byte sub_806105C
	.4byte sub_8063474

	.align 2
Unknown_8375A10:
	.4byte sub_806107C
	.4byte sub_806109C
	.4byte sub_8063474

	.align 2
Unknown_8375A1C:
	.4byte sub_80610BC
	.4byte sub_80610DC
	.4byte sub_8063474

	.align 2
Unknown_8375A28:
	.4byte sub_80610FC
	.4byte sub_806111C
	.4byte sub_8063474

	.align 1
gUnknown_08375A34:: @ 8375A34
	.2byte 0, 1, 1

	.align 1
gUnknown_08375A3A:: @ 8375A3A
	.2byte 0, 0, 1

	.align 2
Unknown_8375A40:
	.4byte sub_80613A8
	.4byte sub_80613D4
	.4byte sub_8063474

	.align 2
Unknown_8375A4C:
	.4byte sub_8061400
	.4byte sub_806142C
	.4byte sub_8063474

	.align 2
Unknown_8375A58:
	.4byte sub_8061458
	.4byte sub_8061484
	.4byte sub_8063474

	.align 2
Unknown_8375A64:
	.4byte sub_80614B0
	.4byte sub_80614DC
	.4byte sub_8063474

	.align 2
Unknown_8375A70:
	.4byte sub_806152C
	.4byte sub_8061510
	.4byte sub_8063470

	.align 2
Unknown_8375A7C:
	.4byte sub_806154C
	.4byte sub_8061510
	.4byte sub_8063470

	.align 2
Unknown_8375A88:
	.4byte sub_806156C
	.4byte sub_8061510
	.4byte sub_8063470

	.align 2
Unknown_8375A94:
	.4byte sub_806158C
	.4byte sub_8061510
	.4byte sub_8063470

	.align 2
Unknown_8375AA0:
	.4byte sub_80615AC
	.4byte sub_8061510
	.4byte sub_8063470

	.align 2
Unknown_8375AAC:
	.4byte sub_80615CC
	.4byte sub_80615EC
	.4byte sub_8063474

	.align 2
Unknown_8375AB8:
	.4byte sub_806160C
	.4byte sub_806162C
	.4byte sub_8063474

	.align 2
Unknown_8375AC4:
	.4byte sub_806164C
	.4byte sub_806166C
	.4byte sub_8063474

	.align 2
Unknown_8375AD0:
	.4byte sub_806168C
	.4byte sub_80616AC
	.4byte sub_8063474

	.align 2
Unknown_8375ADC:
	.4byte sub_8061778
	.4byte sub_806173C
	.4byte sub_8063474

	.align 2
Unknown_8375AE8:
	.4byte sub_80617B0
	.4byte sub_806173C
	.4byte sub_8063474

	.align 2
Unknown_8375AF4:
	.4byte sub_80617E8
	.4byte sub_806173C
	.4byte sub_8063474

	.align 2
Unknown_8375B00:
	.4byte sub_8061820
	.4byte sub_806173C
	.4byte sub_8063474

	.align 2
Unknown_8375B0C:
	.4byte sub_8061858
	.4byte sub_8061714
	.4byte sub_8063474

	.align 2
Unknown_8375B18:
	.4byte sub_8061890
	.4byte sub_8061714
	.4byte sub_8063474

	.align 2
Unknown_8375B24:
	.4byte sub_80618C8
	.4byte sub_8061714
	.4byte sub_8063474

	.align 2
Unknown_8375B30:
	.4byte sub_8061900
	.4byte sub_8061714
	.4byte sub_8063474

	.align 2
Unknown_8375B3C:
	.4byte sub_8061938
	.4byte sub_8061714
	.4byte sub_8063474

	.align 2
Unknown_8375B48:
	.4byte sub_8061970
	.4byte sub_8061714
	.4byte sub_8063474

	.align 2
Unknown_8375B54:
	.4byte sub_80619A8
	.4byte sub_8061714
	.4byte sub_8063474

	.align 2
Unknown_8375B60:
	.4byte sub_80619E0
	.4byte sub_8061714
	.4byte sub_8063474

	.align 2
Unknown_8375B6C:
	.4byte sub_8061A18
	.4byte sub_8061714
	.4byte sub_8063474

	.align 2
Unknown_8375B78:
	.4byte sub_8061A50
	.4byte sub_8061714
	.4byte sub_8063474

	.align 2
Unknown_8375B84:
	.4byte sub_8061A88
	.4byte sub_8061714
	.4byte sub_8063474

	.align 2
Unknown_8375B90:
	.4byte sub_8061AC0
	.4byte sub_8061714
	.4byte sub_8063474

	.align 2
Unknown_8375B9C:
	.4byte sub_8061AF8
	.4byte sub_8061B18
	.4byte sub_8063474

	.align 2
Unknown_8375BA8:
	.4byte sub_8061B38
	.4byte sub_8061B58
	.4byte sub_8063474

	.align 2
Unknown_8375BB4:
	.4byte sub_8061B78
	.4byte sub_8061B98
	.4byte sub_8063474

	.align 2
Unknown_8375BC0:
	.4byte sub_8061BB8
	.4byte sub_8061BD8
	.4byte sub_8063474

	.align 2
Unknown_8375BCC:
	.4byte sub_8061BF8
	.4byte sub_8061C18
	.4byte sub_8063474

	.align 2
Unknown_8375BD8:
	.4byte sub_8061C38
	.4byte sub_8061C58
	.4byte sub_8063474

	.align 2
Unknown_8375BE4:
	.4byte sub_8061C78
	.4byte sub_8061C98
	.4byte sub_8063474

	.align 2
Unknown_8375BF0:
	.4byte sub_8061CB8
	.4byte sub_8061CD8
	.4byte sub_8063474

	.align 2
Unknown_8375BFC:
	.4byte sub_8061CF8
	.4byte sub_8061D18
	.4byte sub_8063474

	.align 2
Unknown_8375C08:
	.4byte sub_8061D38
	.4byte sub_8061D58
	.4byte sub_8063474

	.align 2
Unknown_8375C14:
	.4byte sub_8061D78
	.4byte sub_8061D98
	.4byte sub_8063474

	.align 2
Unknown_8375C20:
	.4byte sub_8061DB8
	.4byte sub_8061DD8
	.4byte sub_8063474

	.align 2
Unknown_8375C2C:
	.4byte do_run_south_anim
	.4byte sub_8061E18
	.4byte sub_8063474

	.align 2
Unknown_8375C38:
	.4byte do_run_north_anim
	.4byte sub_8061E58
	.4byte sub_8063474

	.align 2
Unknown_8375C44:
	.4byte do_run_west_anim
	.4byte sub_8061E98
	.4byte sub_8063474

	.align 2
Unknown_8375C50:
	.4byte do_run_east_anim
	.4byte sub_8061ED8
	.4byte sub_8063474

	.align 2
Unknown_8375C5C:
	.4byte sub_8061F24
	.4byte sub_8061F3C
	.4byte sub_8063474

	.align 2
Unknown_8375C68:
	.4byte sub_8061F90
	.4byte sub_8061FB0
	.4byte sub_8063474

	.align 2
Unknown_8375C74:
	.4byte sub_8061FD8
	.4byte sub_8061FF8
	.4byte sub_8063474

	.align 2
Unknown_8375C80:
	.4byte sub_8062020
	.4byte sub_8062040
	.4byte sub_8063474

	.align 2
Unknown_8375C8C:
	.4byte sub_8062068
	.4byte sub_8062088
	.4byte sub_8063474

	.align 2
Unknown_8375C98:
	.4byte sub_80620B0
	.4byte sub_8063474

	.align 2
Unknown_8375CA0:
	.4byte sub_806210C
	.4byte sub_8063474

	.align 2
Unknown_8375CA8:
	.4byte sub_8062170
	.4byte sub_8063474

	.align 2
Unknown_8375CB0:
	.4byte sub_8062180
	.4byte sub_8063474

	.align 2
Unknown_8375CB8:
	.4byte sub_8062190
	.4byte sub_80621BC
	.4byte sub_8063474

	.align 2
Unknown_8375CC4:
	.4byte sub_80621E8
	.4byte sub_8062214
	.4byte sub_8063474

	.align 2
Unknown_8375CD0:
	.4byte sub_8062240
	.4byte sub_806226C
	.4byte sub_8063474

	.align 2
Unknown_8375CDC:
	.4byte sub_8062298
	.4byte sub_80622C4
	.4byte sub_8063474

	.align 2
Unknown_8375CE8:
	.4byte sub_80622F0
	.4byte sub_806231C
	.4byte sub_8063474

	.align 2
Unknown_8375CF4:
	.4byte sub_8062348
	.4byte sub_8062374
	.4byte sub_8063474

	.align 2
Unknown_8375D00:
	.4byte sub_80623A0
	.4byte sub_80623CC
	.4byte sub_8063474

	.align 2
Unknown_8375D0C:
	.4byte sub_80623F8
	.4byte sub_8062424
	.4byte sub_8063474

	.align 2
Unknown_8375D18:
	.4byte sub_8062450
	.4byte sub_806247C
	.4byte sub_8063474

	.align 2
Unknown_8375D24:
	.4byte sub_80624A8
	.4byte sub_80624D4
	.4byte sub_8063474

	.align 2
Unknown_8375D30:
	.4byte sub_8062500
	.4byte sub_806252C
	.4byte sub_8063474

	.align 2
Unknown_8375D3C:
	.4byte sub_8062558
	.4byte sub_8062584
	.4byte sub_8063474

	.align 2
Unknown_8375D48:
	.4byte sub_80625B0
	.4byte sub_8063474

	.align 2
Unknown_8375D50:
	.4byte sub_80625C8
	.4byte sub_8061F3C
	.4byte sub_8063474

	.align 2
Unknown_8375D5C:
	.4byte sub_80625D8
	.4byte sub_8063470

	.align 2
Unknown_8375D64:
	.4byte sub_80625E8
	.4byte sub_8063470

	.align 2
Unknown_8375D6C:
	.4byte sub_80625F8
	.4byte sub_8063470

	.align 2
Unknown_8375D74:
	.4byte sub_8062608
	.4byte sub_8063470

	.align 2
Unknown_8375D7C:
	.4byte sub_8062634
	.4byte sub_8063470

	.align 2
Unknown_8375D84:
	.4byte sub_8062644
	.4byte sub_8063470

	.align 2
Unknown_8375D8C:
	.4byte do_exclamation_mark_bubble_1
	.4byte sub_8063470

	.align 2
Unknown_8375D94:
	.4byte do_exclamation_mark_bubble_2
	.4byte sub_8063470

	.align 2
Unknown_8375D9C:
	.4byte do_heart_bubble
	.4byte sub_8063470

	.align 2
Unknown_8375DA4:
	.4byte sub_80626C0
	.4byte sub_8062704
	.4byte sub_8063470

	.align 2
Unknown_8375DB0:
	.4byte sub_8062724
	.4byte sub_8062740
	.4byte sub_8062764
	.4byte sub_8063470

	.align 2
Unknown_8375DC0:
	.4byte sub_80627A0
	.4byte sub_80627BC
	.4byte sub_80627E0
	.4byte sub_8063470

	.align 2
Unknown_8375DD0:
	.4byte sub_806281C
	.4byte sub_8063470

	.align 2
Unknown_8375DD8:
	.4byte sub_806282C
	.4byte sub_8063470

	.align 2
Unknown_8375DE0:
	.4byte sub_806283C
	.4byte sub_8063470

	.align 2
Unknown_8375DE8:
	.4byte sub_806286C
	.4byte sub_8063470

	.align 2
Unknown_8375DF0:
	.4byte sub_806289C
	.4byte sub_80628D0
	.4byte sub_8063474

	.align 2
Unknown_8375DFC:
	.4byte sub_80628FC
	.4byte sub_8062930
	.4byte sub_8063474

	.align 2
Unknown_8375E08:
	.4byte sub_806299C
	.4byte sub_8063474

	.align 2
Unknown_8375E10:
	.4byte sub_80629AC
	.4byte sub_8063474

	.align 2
Unknown_8375E18:
	.4byte sub_80629BC
	.4byte sub_8063474

	.align 2
Unknown_8375E20:
	.4byte sub_80629CC
	.4byte sub_8063474

	.align 2
Unknown_8375E28:
	.4byte sub_80629DC
	.4byte sub_8061F3C
	.4byte sub_8063474

	.align 2
Unknown_8375E34:
	.4byte sub_8062A00
	.4byte sub_8061F3C
	.4byte sub_8063474

	.align 2
Unknown_8375E40:
	.4byte sub_8062A24
	.4byte sub_8061F3C
	.4byte sub_8063474

	.align 2
Unknown_8375E4C:
	.4byte sub_8062A48
	.4byte sub_8061F3C
	.4byte sub_8063474

	.align 2
Unknown_8375E58:
	.4byte sub_8062A6C
	.4byte sub_8061F3C
	.4byte sub_8063474

	.align 2
Unknown_8375E64:
	.4byte sub_8062A90
	.4byte sub_8061F3C
	.4byte sub_8063474

	.align 2
Unknown_8375E70:
	.4byte sub_8062AB4
	.4byte sub_8061F3C
	.4byte sub_8063474

	.align 2
Unknown_8375E7C:
	.4byte sub_8062AD8
	.4byte sub_8061F3C
	.4byte sub_8063474
	.4byte sub_8062AFC
	.4byte sub_8061F3C
	.4byte sub_8063474
	.4byte sub_8062B20
	.4byte sub_8061F3C
	.4byte sub_8063474
	.4byte sub_8062B44
	.4byte sub_8061F3C
	.4byte sub_8063474
	.4byte sub_8062B68
	.4byte sub_8061F3C
	.4byte sub_8063474

	.align 2
Unknown_8375EB8:
	.4byte sub_8062BD0
	.4byte sub_8062BFC
	.4byte sub_8063474

	.align 2
Unknown_8375EC4:
	.4byte sub_8062C28
	.4byte sub_8062C54
	.4byte sub_8063474

	.align 2
Unknown_8375ED0:
	.4byte sub_8062C80
	.4byte sub_8062CAC
	.4byte sub_8063474

	.align 2
Unknown_8375EDC:
	.4byte sub_8062CD8
	.4byte sub_8062D04
	.4byte sub_8063474

	.align 2
Unknown_8375EE8:
	.4byte sub_8062D30
	.4byte sub_8062D5C
	.4byte sub_8063474

	.align 2
Unknown_8375EF4:
	.4byte sub_8062D88
	.4byte sub_8062DB4
	.4byte sub_8063474

	.align 2
Unknown_8375F00:
	.4byte sub_8062DE0
	.4byte sub_8062E0C
	.4byte sub_8063474

	.align 2
Unknown_8375F0C:
	.4byte sub_8062E38
	.4byte sub_8062E64
	.4byte sub_8063474

	.align 2
Unknown_8375F18:
	.4byte sub_8062E90
	.4byte sub_8062EBC
	.4byte sub_8063474

	.align 2
Unknown_8375F24:
	.4byte sub_8062EE8
	.4byte sub_8062F14
	.4byte sub_8063474

	.align 2
Unknown_8375F30:
	.4byte sub_8062F40
	.4byte sub_8062F6C
	.4byte sub_8063474

	.align 2
Unknown_8375F3C:
	.4byte sub_8062F98
	.4byte sub_8062FC4
	.4byte sub_8063474

	.align 2
Unknown_8375F48:
	.4byte sub_8062FF0
	.4byte sub_8061714
	.4byte sub_8063474

	.align 2
Unknown_8375F54:
	.4byte sub_8063028
	.4byte sub_8061714
	.4byte sub_8063474

	.align 2
Unknown_8375F60:
	.4byte sub_8063060
	.4byte sub_8061714
	.4byte sub_8063474

	.align 2
Unknown_8375F6C:
	.4byte sub_8063098
	.4byte sub_8061714
	.4byte sub_8063474

	.align 2
Unknown_8375F78:
	.4byte sub_8063108
	.4byte sub_8063128
	.4byte sub_8063474

	.align 2
Unknown_8375F84:
	.4byte sub_8063148
	.4byte sub_8063168
	.4byte sub_8063474

	.align 2
Unknown_8375F90:
	.4byte sub_8063188
	.4byte sub_80631A8
	.4byte sub_8063474

	.align 2
Unknown_8375F9C:
	.4byte sub_80631C8
	.4byte sub_80631E8
	.4byte sub_8063474

	.align 2
Unknown_8375FA8:
	.4byte sub_8063238
	.4byte sub_8063258
	.4byte sub_8063474

	.align 2
Unknown_8375FB4:
	.4byte sub_8063278
	.4byte sub_8063298
	.4byte sub_8063474

	.align 2
Unknown_8375FC0:
	.4byte sub_80632B8
	.4byte sub_80632D8
	.4byte sub_8063474

	.align 2
Unknown_8375FCC:
	.4byte sub_80632F8
	.4byte sub_8063318
	.4byte sub_8063474

	.align 2
Unknown_8375FD8:
	.4byte sub_8063370
	.4byte sub_8063390
	.4byte sub_8063474

	.align 2
Unknown_8375FE4:
	.4byte sub_80633B0
	.4byte sub_80633D0
	.4byte sub_8063474

	.align 2
Unknown_8375FF0:
	.4byte sub_80633F0
	.4byte sub_8063410
	.4byte sub_8063474

	.align 2
Unknown_8375FFC:
	.4byte sub_8063430
	.4byte sub_8063450
	.4byte sub_8063474
