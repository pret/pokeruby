@ the second big chunk of data

	.include "asm/macros.inc"
	.include "constants/constants.inc"

	.section .rodata

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
	.4byte gUnknown_030041D0
	.2byte 0x20
	.byte 0x13
	.byte 0x10
	.4byte BG_VRAM + 0xE104

	.4byte gUnknown_03004250
	.2byte 0x40
	.byte 0x13
	.byte 0x10
	.4byte BG_VRAM + 0xF104

	.4byte gUnknown_030041D0
	.2byte 0x60
	.byte 0x13
	.byte 0x30
	.4byte BG_VRAM + 0xE204

	.4byte gUnknown_03004250
	.2byte 0x80
	.byte 0x13
	.byte 0x30
	.4byte BG_VRAM + 0xF204

	.4byte gUnknown_030041D0
	.2byte 0x20
	.byte 0x13
	.byte 0x18
	.4byte BG_VRAM + 0xE1C4

	.4byte gUnknown_03004250
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
