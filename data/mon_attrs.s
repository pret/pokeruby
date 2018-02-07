@ the second big chunk of data

#include "constants/items.h"
#include "constants/moves.h"
#include "constants/species.h"
	.include "include/macros.inc"
	.include "constants/constants.inc"

	.section .rodata

	.align 2
gSpriteImageTable_81E7A10:: @ 81E7A10
	obj_frame_tiles gSharedMem + 0x8000, 0x800
	obj_frame_tiles gSharedMem + 0x8800, 0x800
	obj_frame_tiles gSharedMem + 0x9000, 0x800
	obj_frame_tiles gSharedMem + 0x9800, 0x800

	.align 2
gSpriteImageTable_81E7A30:: @ 81E7A30
	obj_frame_tiles gSharedMem + 0xA000, 0x800
	obj_frame_tiles gSharedMem + 0xA800, 0x800
	obj_frame_tiles gSharedMem + 0xB000, 0x800
	obj_frame_tiles gSharedMem + 0xB800, 0x800

	.align 2
gSpriteImageTable_81E7A50:: @ 81E7A50
	obj_frame_tiles gSharedMem + 0xC000, 0x800
	obj_frame_tiles gSharedMem + 0xC800, 0x800
	obj_frame_tiles gSharedMem + 0xD000, 0x800
	obj_frame_tiles gSharedMem + 0xD800, 0x800

	.align 2
gSpriteImageTable_81E7A70:: @ 81E7A70
	obj_frame_tiles gSharedMem + 0xE000, 0x800
	obj_frame_tiles gSharedMem + 0xE800, 0x800
	obj_frame_tiles gSharedMem + 0xF000, 0x800
	obj_frame_tiles gSharedMem + 0xF800, 0x800

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
