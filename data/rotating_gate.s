	.include "asm/macros.inc"
	.include "constants/constants.inc"

	.section .rodata

	.align 2
gUnknown_083D2964:: @ 83D2964
	.byte 12,  0,  5,  0,  3,  0,  0,  0
	.byte 14,  0,  7,  0,  3,  3,  0,  0
	.byte 16,  0,  4,  0,  5,  1,  0,  0
	.byte 15,  0, 14,  0,  1,  0,  0,  0
	.byte 18,  0, 13,  0,  4,  2,  0,  0
	.byte  8,  0, 20,  0,  4,  2,  0,  0
	.byte 16,  0, 20,  0,  7,  1,  0,  0

	.align 2
gUnknown_083D299C:: @ 83D299C
	.byte 13,  0,  3,  0,  4,  3,  0,  0
	.byte 12,  0,  6,  0,  4,  2,  0,  0
	.byte  3,  0,  6,  0,  4,  2,  0,  0
	.byte  3,  0,  9,  0,  5,  3,  0,  0
	.byte  8,  0,  8,  0,  0,  1,  0,  0
	.byte  2,  0, 12,  0,  6,  2,  0,  0
	.byte  9,  0, 13,  0,  1,  0,  0,  0
	.byte  3,  0, 14,  0,  2,  1,  0,  0
	.byte  9,  0, 15,  0,  3,  2,  0,  0
	.byte  3,  0, 18,  0,  5,  2,  0,  0
	.byte  2,  0, 19,  0,  4,  0,  0,  0
	.byte  5,  0, 21,  0,  0,  0,  0,  0
	.byte  9,  0, 19,  0,  3,  3,  0,  0
	.byte 12,  0, 20,  0,  4,  1,  0,  0

	.align 2
RotatingGateTiles_1: @ 83D2A0C
	.incbin "graphics/rotating_gates/1.4bpp"

	.align 2
RotatingGateTiles_2: @ 83D320C
	.incbin "graphics/rotating_gates/2.4bpp"

	.align 2
RotatingGateTiles_3: @ 83D3A0C
	.incbin "graphics/rotating_gates/3.4bpp"

	.align 2
RotatingGateTiles_5: @ 83D420C
	.incbin "graphics/rotating_gates/5.4bpp"

	.align 2
RotatingGateTiles_6: @ 83D4A0C
	.incbin "graphics/rotating_gates/6.4bpp"

	.align 2
RotatingGateTiles_7: @ 83D520C
	.incbin "graphics/rotating_gates/7.4bpp"

	.align 2
RotatingGateTiles_0: @ 83D5A0C
	.incbin "graphics/rotating_gates/0.4bpp"

	.align 2
RotatingGateTiles_4: @ 83D5C0C
	.incbin "graphics/rotating_gates/4.4bpp"

	.align 2
gOamData_83D5E0C:: @ 83D5E0C
	.2byte 0x0100
	.2byte 0xC000
	.2byte 0x5800

	.align 2
gOamData_83D5E14:: @ 83D5E14
	.2byte 0x0100
	.2byte 0x8000
	.2byte 0x5800

	.align 2
gRotatingGatesGraphicsTable:: @ 83D5E1C
	obj_tiles RotatingGateTiles_0, 0x200, 0x1300
	obj_tiles RotatingGateTiles_1, 0x800, 0x1301
	obj_tiles RotatingGateTiles_2, 0x800, 0x1302
	obj_tiles RotatingGateTiles_3, 0x800, 0x1303
	obj_tiles RotatingGateTiles_4, 0x200, 0x1304
	obj_tiles RotatingGateTiles_5, 0x800, 0x1305
	obj_tiles RotatingGateTiles_6, 0x800, 0x1306
	obj_tiles RotatingGateTiles_7, 0x800, 0x1307
	null_obj_tiles

	.align 2
gSpriteAnim_83D5E64:: @ 83D5E64
	obj_image_anim_frame 0, 0
	obj_image_anim_end

	.align 2
gSpriteAnim_83D5E6C:: @ 83D5E6C
	obj_image_anim_frame 0, 0
	obj_image_anim_end

	.align 2
gSpriteAnimTable_83D5E74:: @ 83D5E74
	.4byte gSpriteAnim_83D5E64

	.align 2
gSpriteAnimTable_83D5E78:: @ 83D5E78
	.4byte gSpriteAnim_83D5E6C

	.align 2
gSpriteAffineAnim_83D5E7C:: @ 83D5E7C
	obj_rot_scal_anim_frame 0x100, 0x100, 0, 0
	obj_rot_scal_anim_jump 0

	.align 2
gSpriteAffineAnim_83D5E8C:: @ 83D5E8C
	obj_rot_scal_anim_frame 0x100, 0x100, -64, 0
	obj_rot_scal_anim_jump 0

	.align 2
gSpriteAffineAnim_83D5E9C:: @ 83D5E9C
	obj_rot_scal_anim_frame 0x100, 0x100, -128, 0
	obj_rot_scal_anim_jump 0

	.align 2
gSpriteAffineAnim_83D5EAC:: @ 83D5EAC
	obj_rot_scal_anim_frame 0x100, 0x100, 64, 0
	obj_rot_scal_anim_jump 0

	.align 2
gSpriteAffineAnim_83D5EBC:: @ 83D5EBC
	obj_rot_scal_anim_frame 0x100, 0x100, 0, 0
	obj_rot_scal_anim_frame 0x0, 0x0, -4, 16
	obj_rot_scal_anim_end

	.align 2
gSpriteAffineAnim_83D5ED4:: @ 83D5ED4
	obj_rot_scal_anim_frame 0x100, 0x100, -64, 0
	obj_rot_scal_anim_frame 0x0, 0x0, -4, 16
	obj_rot_scal_anim_end

	.align 2
gSpriteAffineAnim_83D5EEC:: @ 83D5EEC
	obj_rot_scal_anim_frame 0x100, 0x100, -128, 0
	obj_rot_scal_anim_frame 0x0, 0x0, -4, 16
	obj_rot_scal_anim_end

	.align 2
gSpriteAffineAnim_83D5F04:: @ 83D5F04
	obj_rot_scal_anim_frame 0x100, 0x100, 64, 0
	obj_rot_scal_anim_frame 0x0, 0x0, -4, 16
	obj_rot_scal_anim_end

	.align 2
gSpriteAffineAnim_83D5F1C:: @ 83D5F1C
	obj_rot_scal_anim_frame 0x100, 0x100, 0, 0
	obj_rot_scal_anim_frame 0x0, 0x0, 4, 16
	obj_rot_scal_anim_end

	.align 2
gSpriteAffineAnim_83D5F34:: @ 83D5F34
	obj_rot_scal_anim_frame 0x100, 0x100, 64, 0
	obj_rot_scal_anim_frame 0x0, 0x0, 4, 16
	obj_rot_scal_anim_end

	.align 2
gSpriteAffineAnim_83D5F4C:: @ 83D5F4C
	obj_rot_scal_anim_frame 0x100, 0x100, -128, 0
	obj_rot_scal_anim_frame 0x0, 0x0, 4, 16
	obj_rot_scal_anim_end

	.align 2
gSpriteAffineAnim_83D5F64:: @ 83D5F64
	obj_rot_scal_anim_frame 0x100, 0x100, -64, 0
	obj_rot_scal_anim_frame 0x0, 0x0, 4, 16
	obj_rot_scal_anim_end

	.align 2
gSpriteAffineAnim_83D5F7C:: @ 83D5F7C
	obj_rot_scal_anim_frame 0x100, 0x100, 0, 0
	obj_rot_scal_anim_frame 0x0, 0x0, -8, 8
	obj_rot_scal_anim_end

	.align 2
gSpriteAffineAnim_83D5F94:: @ 83D5F94
	obj_rot_scal_anim_frame 0x100, 0x100, -64, 0
	obj_rot_scal_anim_frame 0x0, 0x0, -8, 8
	obj_rot_scal_anim_end

	.align 2
gSpriteAffineAnim_83D5FAC:: @ 83D5FAC
	obj_rot_scal_anim_frame 0x100, 0x100, -128, 0
	obj_rot_scal_anim_frame 0x0, 0x0, -8, 8
	obj_rot_scal_anim_end

	.align 2
gSpriteAffineAnim_83D5FC4:: @ 83D5FC4
	obj_rot_scal_anim_frame 0x100, 0x100, 64, 0
	obj_rot_scal_anim_frame 0x0, 0x0, -8, 8
	obj_rot_scal_anim_end

	.align 2
gSpriteAffineAnim_83D5FDC:: @ 83D5FDC
	obj_rot_scal_anim_frame 0x100, 0x100, 0, 0
	obj_rot_scal_anim_frame 0x0, 0x0, 8, 8
	obj_rot_scal_anim_end

	.align 2
gSpriteAffineAnim_83D5FF4:: @ 83D5FF4
	obj_rot_scal_anim_frame 0x100, 0x100, 64, 0
	obj_rot_scal_anim_frame 0x0, 0x0, 8, 8
	obj_rot_scal_anim_end

	.align 2
gSpriteAffineAnim_83D600C:: @ 83D600C
	obj_rot_scal_anim_frame 0x100, 0x100, -128, 0
	obj_rot_scal_anim_frame 0x0, 0x0, 8, 8
	obj_rot_scal_anim_end

	.align 2
gSpriteAffineAnim_83D6024:: @ 83D6024
	obj_rot_scal_anim_frame 0x100, 0x100, -64, 0
	obj_rot_scal_anim_frame 0x0, 0x0, 8, 8
	obj_rot_scal_anim_end

	.align 2
gSpriteAffineAnimTable_83D603C:: @ 83D603C
	.4byte gSpriteAffineAnim_83D5E7C
	.4byte gSpriteAffineAnim_83D5E8C
	.4byte gSpriteAffineAnim_83D5E9C
	.4byte gSpriteAffineAnim_83D5EAC
	.4byte gSpriteAffineAnim_83D5F1C
	.4byte gSpriteAffineAnim_83D5F64
	.4byte gSpriteAffineAnim_83D5F4C
	.4byte gSpriteAffineAnim_83D5F34
	.4byte gSpriteAffineAnim_83D5EBC
	.4byte gSpriteAffineAnim_83D5ED4
	.4byte gSpriteAffineAnim_83D5EEC
	.4byte gSpriteAffineAnim_83D5F04
	.4byte gSpriteAffineAnim_83D5FDC
	.4byte gSpriteAffineAnim_83D6024
	.4byte gSpriteAffineAnim_83D600C
	.4byte gSpriteAffineAnim_83D5FF4
	.4byte gSpriteAffineAnim_83D5F7C
	.4byte gSpriteAffineAnim_83D5F94
	.4byte gSpriteAffineAnim_83D5FAC
	.4byte gSpriteAffineAnim_83D5FC4

	.align 2
gSpriteTemplate_83D608C:: @ 83D608C
	spr_template 4864, 0xFFFF, gOamData_83D5E0C, gSpriteAnimTable_83D5E74, NULL, gSpriteAffineAnimTable_83D603C, sub_80C7C94

	.align 2
gSpriteTemplate_83D60A4:: @ 83D60A4
	spr_template 4864, 0xFFFF, gOamData_83D5E14, gSpriteAnimTable_83D5E78, NULL, gSpriteAffineAnimTable_83D603C, sub_80C7C94

gUnknown_083D60BC:: @ 83D60BC
	.incbin "baserom.gba", 0x003d60bc, 0x10

gUnknown_083D60CC:: @ 83D60CC
	.incbin "baserom.gba", 0x003d60cc, 0x10

gUnknown_083D60DC:: @ 83D60DC
	.incbin "baserom.gba", 0x003d60dc, 0x10

gUnknown_083D60EC:: @ 83D60EC
	.incbin "baserom.gba", 0x003d60ec, 0x10

gUnknown_083D60FC:: @ 83D60FC
	.incbin "baserom.gba", 0x003d60fc, 0x20

gUnknown_083D611C:: @ 83D611C
	.incbin "baserom.gba", 0x003d611c, 0x20
	
	.align 2
gUnknown_083D613C:: @ 83D613C
	.byte  1, 0, 1, 0, 0, 0, 0, 0
	.byte  1, 1, 1, 0, 0, 0, 0, 0
	.byte  1, 0, 1, 1, 0, 0, 0, 0
	.byte  1, 1, 1, 1, 0, 0, 0, 0
	.byte  1, 0, 1, 0, 1, 0, 0, 0
	.byte  1, 1, 1, 0, 1, 0, 0, 0
	.byte  1, 0, 1, 1, 1, 0, 0, 0
	.byte  1, 0, 1, 0, 1, 1, 0, 0
	.byte  1, 1, 1, 1, 1, 0, 0, 0
	.byte  1, 1, 1, 0, 1, 1, 0, 0
	.byte  1, 0, 1, 1, 1, 1, 0, 0
	.byte  1, 1, 1, 1, 1, 1, 0, 0
