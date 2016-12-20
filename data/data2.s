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
