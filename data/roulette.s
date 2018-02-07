	.include "include/macros.inc"
	.include "constants/constants.inc"

	.section .rodata

	.align 1
gUnknown_083F86BC:: @ 83F86BC
	.incbin "graphics/roulette/83F86BC.gbapal"

	.align 2
gUnknown_083F88BC:: @ 83F88BC
	.incbin "graphics/roulette/83F88BC.bin.lz"

	.align 2
gUnknown_083F8A60:: @ 83F8A60
	.incbin "graphics/roulette/wheel_map.bin.lz"

	.macro struct_unk083f8c00 var00, var01_0, var01_4, var02, var03, var04, var05, var06, var07, var08, var0c, var10, var12
	.byte \var00, \var01_0 | (\var01_4 << 4), \var02, \var03, \var04, \var05, \var06, \var07
	.long \var08, \var0c
	.short \var10, \var12
	.endm

	.align 2
gUnknown_083F8C00:: @ 83F8C00
// array count = 20
	struct_unk083f8c00 0xFF, 0x0, 0x0, 0x00, 0x07, 0x07, 0x00, 0x00, 0x00, 0x00000000, 0x00000000, 0x0000, 0x0000
	struct_unk083f8c00 0x0C, 0x4, 0x1, 0x00, 0x11, 0x07, 0x00, 0x00, 0x00, 0x00000002, 0x00010842, 0xE000, 0x0000
	struct_unk083f8c00 0x0D, 0x4, 0x2, 0x00, 0x14, 0x07, 0x00, 0x00, 0x00, 0x00000004, 0x00021084, 0xE000, 0x0000
	struct_unk083f8c00 0x0E, 0x4, 0x3, 0x00, 0x17, 0x07, 0x00, 0x00, 0x00, 0x00000008, 0x00042108, 0xE000, 0x0000
	struct_unk083f8c00 0x0F, 0x4, 0x4, 0x00, 0x1A, 0x07, 0x00, 0x00, 0x00, 0x00000010, 0x00084210, 0xE000, 0x0000
	struct_unk083f8c00 0x10, 0x3, 0x0, 0x01, 0x0E, 0x0A, 0x00, 0x0C, 0x00, 0x00000020, 0x000003E0, 0x0249, 0x0000
	struct_unk083f8c00 0x00, 0xC, 0x1, 0x01, 0x11, 0x0A, 0x03, 0x03, 0x00, 0x00000040, 0x00000040, 0x2001, 0x0000
	struct_unk083f8c00 0x09, 0xC, 0x2, 0x01, 0x14, 0x0A, 0x03, 0x03, 0x00, 0x00000080, 0x00000080, 0x2200, 0x0000
	struct_unk083f8c00 0x06, 0xC, 0x3, 0x01, 0x17, 0x0A, 0x03, 0x03, 0x00, 0x00000100, 0x00000100, 0x2040, 0x0000
	struct_unk083f8c00 0x03, 0xC, 0x4, 0x01, 0x1A, 0x0A, 0x03, 0x03, 0x00, 0x00000200, 0x00000200, 0x2008, 0x0000
	struct_unk083f8c00 0x11, 0x3, 0x0, 0x02, 0x0E, 0x0D, 0x03, 0x0F, 0x00, 0x00000400, 0x00007C00, 0x0492, 0x0000
	struct_unk083f8c00 0x04, 0xC, 0x1, 0x02, 0x11, 0x0D, 0x06, 0x06, 0x00, 0x00000800, 0x00000800, 0x2010, 0x0000
	struct_unk083f8c00 0x01, 0xC, 0x2, 0x02, 0x14, 0x0D, 0x06, 0x06, 0x00, 0x00001000, 0x00001000, 0x2002, 0x0000
	struct_unk083f8c00 0x0A, 0xC, 0x3, 0x02, 0x17, 0x0D, 0x06, 0x06, 0x00, 0x00002000, 0x00002000, 0x2400, 0x0000
	struct_unk083f8c00 0x07, 0xC, 0x4, 0x02, 0x1A, 0x0D, 0x06, 0x06, 0x00, 0x00004000, 0x00004000, 0x2080, 0x0000
	struct_unk083f8c00 0x12, 0x3, 0x0, 0x03, 0x0E, 0x10, 0x06, 0x12, 0x00, 0x00008000, 0x000F8000, 0x0924, 0x0000
	struct_unk083f8c00 0x08, 0xC, 0x1, 0x03, 0x11, 0x10, 0x09, 0x09, 0x00, 0x00010000, 0x00010000, 0x2100, 0x0000
	struct_unk083f8c00 0x05, 0xC, 0x2, 0x03, 0x14, 0x10, 0x09, 0x09, 0x00, 0x00020000, 0x00020000, 0x2020, 0x0000
	struct_unk083f8c00 0x02, 0xC, 0x3, 0x03, 0x17, 0x10, 0x09, 0x09, 0x00, 0x00040000, 0x00040000, 0x2004, 0x0000
	struct_unk083f8c00 0x0B, 0xC, 0x4, 0x03, 0x1A, 0x10, 0x09, 0x09, 0x00, 0x00080000, 0x00080000, 0x2800, 0x0000

	.align 2
gUnknown_083F8D90:: @ 83F8D90
	.byte    0,   1,   6,   0,  64,   0,   0,   0
	.byte    1,   3,  12,   0,   0,  16,   0,   0
	.byte    2,   5,  18,   0,   0,   0,   4,   0
	.byte    3,   7,   9,   0,   0,   2,   0,   0
	.byte    4,   9,  11,   0,   0,   8,   0,   0
	.byte    5,  11,  17,   0,   0,   0,   2,   0
	.byte    6,  13,   8,   0,   0,   1,   0,   0
	.byte    7,  15,  14,   0,   0,  64,   0,   0
	.byte    8,  17,  16,   0,   0,   0,   1,   0
	.byte    9,  19,   7,   0, 128,   0,   0,   0
	.byte   10,  21,  13,   0,   0,  32,   0,   0
	.byte   11,  23,  19,   0,   0,   0,   8,   0

gUnknown_083F8DF0:: @ 83F8DF0
	.byte 1, 3
	.byte 1, 6

	.align 2
gUnknown_083F8DF4:: @ 83F8DF4
	.byte 0x01,0x3C,0x1E,0x01,0x01,0x00,0x00,0x00,0x2D,0x00,0x1E,0x00,0x01,0x00,0x00,0x00,0x4B,0x00,0x1B,0x00,0x18,0x00,0x00,0x00,0x0A,0x00,0x68,0x01,0x00,0x00,0x00,0xBF
	.byte 0x03,0x1E,0x0F,0x01,0x00,0x00,0x00,0x00,0x4B,0x00,0x3C,0x00,0x02,0x00,0x00,0x00,0x00,0x00,0x36,0x00,0x30,0x00,0x00,0x00,0x0A,0x00,0x0E,0x01,0x00,0x00,0x80,0xBF

	.align 2
gUnknown_083F8E34:: @ 83F8E34
	.byte 0x00,0x80,0x05,0x00,0x01,0x01,0xFF,0x48
	.byte 0x00,0x80,0x0A,0x00,0x01,0x01,0xFF,0x48
	.byte 0x00,0x80,0x15,0x00,0x01,0x01,0xFF,0x48
	.byte 0x00,0x80,0x55,0x00,0x01,0x01,0xFF,0x48
	.byte 0x00,0x80,0x5A,0x00,0x01,0x01,0xFF,0x48
	.byte 0x00,0x80,0x65,0x00,0x01,0x01,0xFF,0x48
	.byte 0x00,0x80,0x75,0x00,0x01,0x01,0xFF,0x48
	.byte 0x00,0x80,0x7A,0x00,0x01,0x01,0xFF,0x48
	.byte 0x00,0x80,0x85,0x00,0x01,0x01,0xFF,0x48
	.byte 0x00,0x80,0x95,0x00,0x01,0x01,0xFF,0x48
	.byte 0x00,0x80,0x9A,0x00,0x01,0x01,0xFF,0x48
	.byte 0x00,0x80,0xA5,0x00,0x01,0x01,0xFF,0x48
	.byte 0xD6,0x77,0x28,0x00,0x02,0x0A,0xFF,0x4E

	.align 1
gUnknown_083F8E9C:: @ 83F8E9C
// {0x53ff, 0x0101, 0x05, 0x1e, 0xff, 0x0e, 0x02, 0x00}
// {0x7ffb, 0x0106, 0x05, 0x1e, 0xff, 0x0e, 0x02, 0x00}
// {0x7f7f, 0x010b, 0x05, 0x1e, 0xff, 0x0e, 0x02, 0x00}
	.2byte 0x53FF
	.2byte 0x0101
	.2byte 0x1E05
	.2byte 0x4EFF
	.2byte 0x7FFB
	.2byte 0x0106
	.2byte 0x1E05
	.2byte 0x4EFF
	.2byte 0x7F7F
	.2byte 0x010B
	.2byte 0x1E05
	.2byte 0x4EFF

	.align 2
gUnknown_083F8EB4:: @ 83F8EB4
	.4byte sub_811755C
	.4byte sub_81175C0

	.align 2
gUnknown_083F8EBC:: @ 83F8EBC
	.4byte sub_811577C
	.4byte sub_81157AC

// These objects are initialied in the functions in which they are used.

	.align 1
gUnknown_083F8EC4:: @ 83F8EC4
	.2byte 0x2898
	.2byte 0x1A6A
	.2byte 0x2898

gUnknown_083F8ECA:: @ 83F8ECA
	.byte 0xFB, 0x05, 0xFF, 0x01

	.align 1
gUnknown_083F8ECE:: @ 83F8ECE
	.2byte  0, 180
	.2byte 90, 270

	.align 2
gUnknown_083F8ED8:: @ 83F8ED8
	.4byte 0x10842
	.4byte 0x21084
	.4byte 0x42108
	.4byte 0x84210

	.align 2
gUnknown_083F8EE8:: @ 83F8EE8
	.4byte   0x3E0
	.4byte  0x7C00
	.4byte 0xF8000

gUnknown_083F8EF4:: @ 83F8EF4
	.byte 0, 3, 4, 6, 12

// This might indicate a file boundary

.if DEBUG
@ Could also be after English-only graphics
gUnknown_Debug_0842510D:: @ 0x842510D
	.string "Set　COIN　and　Press　START\n"
	.string "Aーp1　Bーm1　R:Lー×10$"
.endif

.ifdef ENGLISH
	.align 2
RouletteSpritePalette_01:
	.incbin "graphics/roulette/shadow.gbapal"

	.align 2
RouletteSpritePalette_02:
	.incbin "graphics/roulette/ball.gbapal"

	.align 2
RouletteSpritePalette_03:
	.incbin "graphics/roulette/ball_counter.gbapal"

	.align 2
RouletteSpritePalette_04:
	.incbin "graphics/roulette/cursor.gbapal"

	.align 2
RouletteSpritePalette_05:
	.incbin "graphics/roulette/credit.gbapal"

	.align 2
RouletteSpritePalette_06:
	.incbin "graphics/roulette/shroomish.gbapal"

	.align 2
RouletteSpritePalette_07:
	.incbin "graphics/roulette/tailow.gbapal"

	.align 2
RouletteSpritePalette_08:
	.incbin "graphics/roulette/poke_icons.gbapal"

	.align 2
RouletteSpritePalette_09:
	.incbin "graphics/roulette/wynaut.gbapal"

	.align 2
RouletteSpritePalette_10:
	.incbin "graphics/roulette/azurill.gbapal"

	.align 2
RouletteSpritePalette_11:
	.incbin "graphics/roulette/skitty.gbapal"

	.align 2
RouletteSpritePalette_12:
	.incbin "graphics/roulette/makuhita.gbapal"

	.align 2
RouletteSpritePalette_13:
	.incbin "graphics/roulette/83F907C.gbapal"

	.align 2
RouletteSpritePalette_14:
	.incbin "graphics/roulette/83F909C.gbapal"

	.align 2
RouletteSpritePalette_15:
	.incbin "graphics/roulette/83F90BC.gbapal"

	.align 2
RouletteSpritePalette_16:
	.incbin "graphics/roulette/83F90DC.gbapal"
.endif

	.align 2
gUnknown_083F90FC:: @ 83F90FC
	.incbin "graphics/roulette/ball.4bpp.lz"

	.align 2
RouletteBallCounterTiles: @ 83F9244
	.incbin "graphics/roulette/ball_counter.4bpp.lz"

	.align 2
gUnknown_083F92A8:: @ 83F92A8
	.incbin "graphics/roulette/roulette_tilt.4bpp.lz"

	.align 2
RoulettePokeIconsTiles: @ 83F9698
	.incbin "graphics/roulette/poke_icons.4bpp.lz"

	.align 2
RoulettePokeIcons2Tiles: @ 83F983C
	.incbin "graphics/roulette/poke_icons2.4bpp.lz"

	.align 2
gUnknown_083F9D3C:: @ 83F9D3C
	.incbin "graphics/roulette/shadow.4bpp.lz"

	.align 2
RouletteCursorTiles: @ 83F9DD4
	.incbin "graphics/roulette/cursor.4bpp.lz"

	.align 2
gUnknown_083F9E30:: @ 83F9E30
	obj_pal RouletteSpritePalette_01, 1
	obj_pal RouletteSpritePalette_02, 2
	obj_pal RouletteSpritePalette_03, 3
	obj_pal RouletteSpritePalette_04, 4
	obj_pal RouletteSpritePalette_05, 5
	obj_pal RouletteSpritePalette_06, 6
	obj_pal RouletteSpritePalette_07, 7
	obj_pal RouletteSpritePalette_08, 8
	obj_pal RouletteSpritePalette_09, 9
	obj_pal RouletteSpritePalette_10, 10
	obj_pal RouletteSpritePalette_11, 11
	obj_pal RouletteSpritePalette_12, 12
	obj_pal RouletteSpritePalette_13, 13
	obj_pal RouletteSpritePalette_14, 14
	obj_pal RouletteSpritePalette_15, 15
	obj_pal RouletteSpritePalette_16, 16
	null_obj_pal

	.align 2
gOamData_83F9EB8:: @ 83F9EB8
	.2byte 0x0000
	.2byte 0x8000
	.2byte 0x0400

	.align 2
gOamData_83F9EC0:: @ 83F9EC0
	.2byte 0x0000
	.2byte 0x4000
	.2byte 0x0400

	.align 2
gOamData_83F9EC8:: @ 83F9EC8
	.2byte 0x833C
	.2byte 0x8000
	.2byte 0x0800

	.align 2
gSpriteAnim_83F9ED0:: @ 83F9ED0
	obj_image_anim_frame 0, 0
	obj_image_anim_end

	.align 2
gSpriteAnimTable_83F9ED8:: @ 83F9ED8
	.4byte gSpriteAnim_83F9ED0

	.align 2
gSpriteAffineAnim_83F9EDC:: @ 83F9EDC
	obj_rot_scal_anim_end

	.align 2
gSpriteAffineAnimTable_83F9EE4:: @ 83F9EE4
	.4byte gSpriteAffineAnim_83F9EDC

	.align 2
gUnknown_083F9EE8:: @ 83F9EE8
	obj_tiles RoulettePokeIcons2Tiles, 0xC00, 0

	.align 2
gSpriteAnim_83F9EF0:: @ 83F9EF0
	obj_image_anim_frame 0, 0
	obj_image_anim_frame 32, 0
	obj_image_anim_frame 64, 0
	obj_image_anim_frame 72, 0
	obj_image_anim_frame 8, 0
	obj_image_anim_frame 40, 0
	obj_image_anim_frame 48, 0
	obj_image_anim_frame 80, 0
	obj_image_anim_frame 16, 0
	obj_image_anim_frame 24, 0
	obj_image_anim_frame 56, 0
	obj_image_anim_frame 88, 0
	obj_image_anim_end

	.align 2
gSpriteAnimTable_83F9F24:: @ 83F9F24
	.4byte gSpriteAnim_83F9EF0

	.align 2
gSpriteAnimTable_83F9F28:: @ 83F9F28
	.4byte gSpriteAnim_83F9EF0 + 0x4

	.align 2
gSpriteAnimTable_83F9F2C:: @ 83F9F2C
	.4byte gSpriteAnim_83F9EF0 + 0x8

	.align 2
gSpriteAnimTable_83F9F30:: @ 83F9F30
	.4byte gSpriteAnim_83F9EF0 + 0xC

	.align 2
gSpriteAnimTable_83F9F34:: @ 83F9F34
	.4byte gSpriteAnim_83F9EF0 + 0x10

	.align 2
gSpriteAnimTable_83F9F38:: @ 83F9F38
	.4byte gSpriteAnim_83F9EF0 + 0x14

	.align 2
gSpriteAnimTable_83F9F3C:: @ 83F9F3C
	.4byte gSpriteAnim_83F9EF0 + 0x18

	.align 2
gSpriteAnimTable_83F9F40:: @ 83F9F40
	.4byte gSpriteAnim_83F9EF0 + 0x1C

	.align 2
gSpriteAnimTable_83F9F44:: @ 83F9F44
	.4byte gSpriteAnim_83F9EF0 + 0x20

	.align 2
gSpriteAnimTable_83F9F48:: @ 83F9F48
	.4byte gSpriteAnim_83F9EF0 + 0x24

	.align 2
gSpriteAnimTable_83F9F4C:: @ 83F9F4C
	.4byte gSpriteAnim_83F9EF0 + 0x28

	.align 2
gSpriteAnimTable_83F9F50:: @ 83F9F50
	.4byte gSpriteAnim_83F9EF0 + 0x2C

	.align 2
gUnknown_083F9F54:: @ 83F9F54
	obj_tiles gRouletteHeadersTiles, 0x1600, 4

	.align 2
gUnknown_083F9F5C:: @ 83F9F5C
	obj_tiles RoulettePokeIconsTiles, 0x400, 5

	.align 2
gSpriteAnim_83F9F64:: @ 83F9F64
	obj_image_anim_frame 0, 0
	obj_image_anim_frame 16, 0
	obj_image_anim_frame 32, 0
	obj_image_anim_frame 48, 0
	obj_image_anim_frame 64, 0
	obj_image_anim_frame 80, 0
	obj_image_anim_frame 96, 0
	obj_image_anim_frame 112, 0
	obj_image_anim_frame 128, 0
	obj_image_anim_frame 144, 0
	obj_image_anim_frame 160, 0
	obj_image_anim_end

	.align 2
gSpriteAnim_83F9F94:: @ 83F9F94
	obj_image_anim_frame 0, 0
	obj_image_anim_frame 4, 0
	obj_image_anim_frame 8, 0
	obj_image_anim_frame 12, 0
	obj_image_anim_end

	.align 2
gSpriteAnimTable_83F9FA8:: @ 83F9FA8
	.4byte gSpriteAnim_83F9F64

	.align 2
gSpriteAnimTable_83F9FAC:: @ 83F9FAC
	.4byte gSpriteAnim_83F9F64 + 0x8

	.align 2
gSpriteAnimTable_83F9FB0:: @ 83F9FB0
	.4byte gSpriteAnim_83F9F64 + 0x10

	.align 2
gSpriteAnimTable_83F9FB4:: @ 83F9FB4
	.4byte gSpriteAnim_83F9F64 + 0x18

	.align 2
gSpriteAnimTable_83F9FB8:: @ 83F9FB8
	.4byte gSpriteAnim_83F9F64 + 0x20

	.align 2
gSpriteAnimTable_83F9FBC:: @ 83F9FBC
	.4byte gSpriteAnim_83F9F64 + 0x24

	.align 2
gSpriteAnimTable_83F9FC0:: @ 83F9FC0
	.4byte gSpriteAnim_83F9F64 + 0x28

	.align 2
gSpriteAnimTable_83F9FC4:: @ 83F9FC4
	.4byte gSpriteAnim_83F9F94

	.align 2
gSpriteAnimTable_83F9FC8:: @ 83F9FC8
	.4byte gSpriteAnim_83F9F94 + 0x4

	.align 2
gSpriteAnimTable_83F9FCC:: @ 83F9FCC
	.4byte gSpriteAnim_83F9F94 + 0x8

	.align 2
gSpriteAnimTable_83F9FD0:: @ 83F9FD0
	.4byte gSpriteAnim_83F9F94 + 0xC

	.align 2
gSpriteTemplate_83F9FD4:: @ 83F9FD4
	spr_template 4, 8, gOamData_83F9EB8, gSpriteAnimTable_83F9FA8, NULL, gDummySpriteAffineAnimTable, sub_81184CC

	.align 2
gSpriteTemplate_83F9FEC:: @ 83F9FEC
	spr_template 4, 8, gOamData_83F9EB8, gSpriteAnimTable_83F9FAC, NULL, gDummySpriteAffineAnimTable, sub_81184CC

	.align 2
gSpriteTemplate_83FA004:: @ 83FA004
	spr_template 4, 8, gOamData_83F9EB8, gSpriteAnimTable_83F9FB0, NULL, gDummySpriteAffineAnimTable, sub_81184CC

	.align 2
gSpriteTemplate_83FA01C:: @ 83FA01C
	spr_template 4, 8, gOamData_83F9EB8, gSpriteAnimTable_83F9FB4, NULL, gDummySpriteAffineAnimTable, sub_81184CC

	.align 2
gSpriteTemplate_83FA034:: @ 83FA034
	spr_template 4, 8, gOamData_83F9EB8, gSpriteAnimTable_83F9FB8, NULL, gDummySpriteAffineAnimTable, sub_81184CC

	.align 2
gSpriteTemplate_83FA04C:: @ 83FA04C
	spr_template 4, 8, gOamData_83F9EB8, gSpriteAnimTable_83F9FBC, NULL, gDummySpriteAffineAnimTable, sub_81184CC

	.align 2
gSpriteTemplate_83FA064:: @ 83FA064
	spr_template 4, 8, gOamData_83F9EB8, gSpriteAnimTable_83F9FC0, NULL, gDummySpriteAffineAnimTable, sub_81184CC

	.align 2
gSpriteTemplate_83FA07C:: @ 83FA07C
	spr_template 5, 8, gOamData_83F9EC0, gSpriteAnimTable_83F9FC4, NULL, gDummySpriteAffineAnimTable, sub_81184CC

	.align 2
gSpriteTemplate_83FA094:: @ 83FA094
	spr_template 5, 8, gOamData_83F9EC0, gSpriteAnimTable_83F9FC8, NULL, gDummySpriteAffineAnimTable, sub_81184CC

	.align 2
gSpriteTemplate_83FA0AC:: @ 83FA0AC
	spr_template 5, 8, gOamData_83F9EC0, gSpriteAnimTable_83F9FCC, NULL, gDummySpriteAffineAnimTable, sub_81184CC

	.align 2
gSpriteTemplate_83FA0C4:: @ 83FA0C4
	spr_template 5, 8, gOamData_83F9EC0, gSpriteAnimTable_83F9FD0, NULL, gDummySpriteAffineAnimTable, sub_81184CC

	.align 2
gSpriteTemplate_83FA0DC:: @ 83FA0DC
	spr_template 0, 9, gOamData_83F9EC8, gSpriteAnimTable_83F9F24, NULL, gDummySpriteAffineAnimTable, sub_8117E98

	.align 2
gSpriteTemplate_83FA0F4:: @ 83FA0F4
	spr_template 0, 10, gOamData_83F9EC8, gSpriteAnimTable_83F9F28, NULL, gDummySpriteAffineAnimTable, sub_8117E98

	.align 2
gSpriteTemplate_83FA10C:: @ 83FA10C
	spr_template 0, 11, gOamData_83F9EC8, gSpriteAnimTable_83F9F2C, NULL, gDummySpriteAffineAnimTable, sub_8117E98

	.align 2
gSpriteTemplate_83FA124:: @ 83FA124
	spr_template 0, 12, gOamData_83F9EC8, gSpriteAnimTable_83F9F30, NULL, gDummySpriteAffineAnimTable, sub_8117E98

	.align 2
gSpriteTemplate_83FA13C:: @ 83FA13C
	spr_template 0, 9, gOamData_83F9EC8, gSpriteAnimTable_83F9F34, NULL, gDummySpriteAffineAnimTable, sub_8117E98

	.align 2
gSpriteTemplate_83FA154:: @ 83FA154
	spr_template 0, 10, gOamData_83F9EC8, gSpriteAnimTable_83F9F38, NULL, gDummySpriteAffineAnimTable, sub_8117E98

	.align 2
gSpriteTemplate_83FA16C:: @ 83FA16C
	spr_template 0, 11, gOamData_83F9EC8, gSpriteAnimTable_83F9F3C, NULL, gDummySpriteAffineAnimTable, sub_8117E98

	.align 2
gSpriteTemplate_83FA184:: @ 83FA184
	spr_template 0, 12, gOamData_83F9EC8, gSpriteAnimTable_83F9F40, NULL, gDummySpriteAffineAnimTable, sub_8117E98

	.align 2
gSpriteTemplate_83FA19C:: @ 83FA19C
	spr_template 0, 9, gOamData_83F9EC8, gSpriteAnimTable_83F9F44, NULL, gDummySpriteAffineAnimTable, sub_8117E98

	.align 2
gSpriteTemplate_83FA1B4:: @ 83FA1B4
	spr_template 0, 10, gOamData_83F9EC8, gSpriteAnimTable_83F9F48, NULL, gDummySpriteAffineAnimTable, sub_8117E98

	.align 2
gSpriteTemplate_83FA1CC:: @ 83FA1CC
	spr_template 0, 11, gOamData_83F9EC8, gSpriteAnimTable_83F9F4C, NULL, gDummySpriteAffineAnimTable, sub_8117E98

	.align 2
gSpriteTemplate_83FA1E4:: @ 83FA1E4
	spr_template 0, 12, gOamData_83F9EC8, gSpriteAnimTable_83F9F50, NULL, gDummySpriteAffineAnimTable, sub_8117E98

	.align 2
gOamData_83FA1FC:: @ 83FA1FC
	.2byte 0x4000
	.2byte 0xC000
	.2byte 0x0400

	.align 2
gOamData_83FA204:: @ 83FA204
	.2byte 0x8000
	.2byte 0x0000
	.2byte 0x0400

	.align 2
gOamData_83FA20C:: @ 83FA20C
	.2byte 0x4000
	.2byte 0x8000
	.2byte 0x0400

	.align 2
gOamData_83FA214:: @ 83FA214
	.2byte 0x4000
	.2byte 0x0000
	.2byte 0x0400

	.align 2
gUnknown_083FA21C:: @ 83FA21C
	obj_tiles gRouletteCreditTiles, 0x400, 7
	obj_tiles gRouletteNumbersTiles, 0x280, 8
	obj_tiles gRouletteMultiplierTiles, 0x500, 9
	obj_tiles RouletteBallCounterTiles, 0x140, 10
	obj_tiles RouletteCursorTiles, 0x200, 11
	null_obj_tiles

	.align 2
gSpriteAnim_83FA24C:: @ 83FA24C
	obj_image_anim_frame 0, 0
	obj_image_anim_frame 2, 0
	obj_image_anim_frame 4, 0
	obj_image_anim_frame 6, 0
	obj_image_anim_frame 8, 0
	obj_image_anim_frame 10, 0
	obj_image_anim_frame 12, 0
	obj_image_anim_frame 14, 0
	obj_image_anim_frame 16, 0
	obj_image_anim_frame 18, 0

	.align 2
gSpriteAnimTable_83FA274:: @ 83FA274
	.4byte gSpriteAnim_83FA24C

	.align 2
gSpriteAnim_83FA278:: @ 83FA278
	obj_image_anim_frame 0, 0
	obj_image_anim_frame 8, 0
	obj_image_anim_frame 16, 0
	obj_image_anim_frame 24, 0
	obj_image_anim_frame 32, 0
	obj_image_anim_end

	.align 2
gSpriteAnimTable_83FA290:: @ 83FA290
	.4byte gSpriteAnim_83FA278

	.align 2
gSpriteAnim_83FA294:: @ 83FA294
	obj_image_anim_frame 0, 0
	obj_image_anim_frame 2, 0
	obj_image_anim_frame 4, 0
	obj_image_anim_frame 6, 0
	obj_image_anim_frame 8, 0
	obj_image_anim_end

	.align 2
gSpriteAnimTable_83FA2AC:: @ 83FA2AC
	.4byte gSpriteAnim_83FA294

	.align 2
gSpriteTemplate_83FA2B0:: @ 83FA2B0
	spr_template 7, 5, gOamData_83FA1FC, gDummySpriteAnimTable, NULL, gDummySpriteAffineAnimTable, SpriteCallbackDummy

	.align 2
gSpriteTemplate_83FA2C8:: @ 83FA2C8
	spr_template 8, 5, gOamData_83FA204, gSpriteAnimTable_83FA274, NULL, gDummySpriteAffineAnimTable, SpriteCallbackDummy

	.align 2
gSpriteTemplate_83FA2E0:: @ 83FA2E0
	spr_template 9, 5, gOamData_83FA20C, gSpriteAnimTable_83FA290, NULL, gDummySpriteAffineAnimTable, sub_81184CC

	.align 2
gSpriteTemplate_83FA2F8:: @ 83FA2F8
	spr_template 10, 3, gOamData_83FA214, gSpriteAnimTable_83FA2AC, NULL, gDummySpriteAffineAnimTable, SpriteCallbackDummy

	.align 2
gSpriteTemplate_83FA310:: @ 83FA310
	spr_template 11, 5, gOamData_83F9EB8, gDummySpriteAnimTable, NULL, gDummySpriteAffineAnimTable, SpriteCallbackDummy

	.align 2
gOamData_83FA328:: @ 83FA328
	.2byte 0x0000
	.2byte 0x4000
	.2byte 0x0800

	.align 2
gSpriteImageTable_83FA330:: @ 83FA330
	obj_frame_tiles gSharedMem + 0x17E00, 0x80
	obj_frame_tiles gSharedMem + 0x17E80, 0x80
	obj_frame_tiles gSharedMem + 0x17F00, 0x80
	obj_frame_tiles gSharedMem + 0x17F80, 0x80

	.align 2
gSpriteAnim_83FA350:: @ 83FA350
	obj_image_anim_frame 0, 5
	obj_image_anim_frame 1, 5
	obj_image_anim_frame 2, 5
	obj_image_anim_frame 1, 5
	obj_image_anim_jump 0

	.align 2
gSpriteAnim_83FA364:: @ 83FA364
	obj_image_anim_frame 0, 10
	obj_image_anim_frame 1, 10
	obj_image_anim_frame 2, 10
	obj_image_anim_frame 1, 10
	obj_image_anim_jump 0

	.align 2
gSpriteAnim_83FA378:: @ 83FA378
	obj_image_anim_frame 0, 15
	obj_image_anim_frame 1, 15
	obj_image_anim_frame 2, 15
	obj_image_anim_frame 1, 15
	obj_image_anim_jump 0

	.align 2
gSpriteAnim_83FA38C:: @ 83FA38C
	obj_image_anim_frame 1, 2
	obj_image_anim_frame 2, 5
	obj_image_anim_frame 1, 5
	obj_image_anim_frame 3, 5
	obj_image_anim_end

	.align 2
gSpriteAnim_83FA3A0:: @ 83FA3A0
	obj_image_anim_frame 1, 2
	obj_image_anim_frame 0, 4
	obj_image_anim_frame 1, 4
	obj_image_anim_frame 2, 4
	obj_image_anim_frame 3, 4
	obj_image_anim_end

	.align 2
gSpriteAnim_83FA3B8:: @ 83FA3B8
	obj_image_anim_frame 0, 2
	obj_image_anim_frame 1, 5
	obj_image_anim_frame 2, 5
	obj_image_anim_frame 3, 5
	obj_image_anim_end

	.align 2
gSpriteAnim_83FA3CC:: @ 83FA3CC
	obj_image_anim_frame 3, 0
	obj_image_anim_end

	.align 2
gSpriteAnim_83FA3D4:: @ 83FA3D4
	obj_image_anim_frame 2, 2
	obj_image_anim_frame 1, 5
	obj_image_anim_frame 0, 5
	obj_image_anim_frame 3, 5
	obj_image_anim_end

	.align 2
gSpriteAnimTable_83FA3E8:: @ 83FA3E8
	.4byte gSpriteAnim_83FA350
	.4byte gSpriteAnim_83FA364
	.4byte gSpriteAnim_83FA378
	.4byte gSpriteAnim_83FA38C
	.4byte gSpriteAnim_83FA3D4
	.4byte gSpriteAnim_83FA3A0
	.4byte gSpriteAnim_83FA3B8
	.4byte gSpriteAnim_83FA3B8
	.4byte gSpriteAnim_83FA3CC

	.align 2
gSpriteTemplate_83FA40C:: @ 83FA40C
	spr_template 0xFFFF, 2, gOamData_83FA328, gSpriteAnimTable_83FA3E8, gSpriteImageTable_83FA330, gDummySpriteAffineAnimTable, SpriteCallbackDummy

	.align 2
gOamData_83FA424:: @ 83FA424
	.2byte 0x0351
	.2byte 0xC000
	.2byte 0x0800

	.align 2
gUnknown_083FA42C:: @ 83FA42C
	obj_tiles gRouletteCenter_Gfx, 2048, 0x0006

	.align 2
gSpriteTemplate_83FA434:: @ 83FA434
	spr_template 6, 2, gOamData_83FA424, gDummySpriteAnimTable, NULL, gDummySpriteAffineAnimTable, sub_8118554

	.align 2
gOamData_83FA44C:: @ 83FA44C
	.2byte 0x0000
	.2byte 0x8000
	.2byte 0x0800

	.align 2
gOamData_83FA454:: @ 83FA454
	.2byte 0x0000
	.2byte 0x8000
	.2byte 0x0800

	.align 2
gSpriteImageTable_83FA45C:: @ 83FA45C
	obj_frame_tiles gSharedMem + 0x17000, 0x200
	obj_frame_tiles gSharedMem + 0x17200, 0x200
	obj_frame_tiles gSharedMem + 0x17400, 0x200
	obj_frame_tiles gSharedMem + 0x17600, 0x200
	obj_frame_tiles gSharedMem + 0x17800, 0x200
	obj_frame_tiles gSharedMem + 0x17A00, 0x200
	obj_frame_tiles gSharedMem + 0x17C00, 0x200

	.align 2
gSpriteAnim_83FA494:: @ 83FA494
	obj_image_anim_frame 0, 6
	obj_image_anim_frame 1, 6
	obj_image_anim_frame 2, 6
	obj_image_anim_frame 3, 6
	obj_image_anim_frame 2, 6
	obj_image_anim_frame 4, 6
	obj_image_anim_jump 2

	.align 2
gSpriteAnim_83FA4B0:: @ 83FA4B0
	obj_image_anim_frame 5, 10
	obj_image_anim_end

	.align 2
gSpriteAnim_83FA4B8:: @ 83FA4B8
	obj_image_anim_frame 5, 10, OBJ_IMAGE_ANIM_H_FLIP
	obj_image_anim_end

	.align 2
gSpriteAnim_83FA4C0:: @ 83FA4C0
	obj_image_anim_frame 5, 20
	obj_image_anim_frame 6, 20
	obj_image_anim_jump 0

	.align 2
gSpriteAnim_83FA4CC:: @ 83FA4CC
	obj_image_anim_frame 5, 20, OBJ_IMAGE_ANIM_H_FLIP
	obj_image_anim_frame 6, 20, OBJ_IMAGE_ANIM_H_FLIP
	obj_image_anim_jump 0

	.align 2
gSpriteAnim_83FA4D8:: @ 83FA4D8
	obj_image_anim_frame 5, 10
	obj_image_anim_frame 6, 10
	obj_image_anim_jump 0

	.align 2
gSpriteAnim_83FA4E4:: @ 83FA4E4
	obj_image_anim_frame 5, 10, OBJ_IMAGE_ANIM_H_FLIP
	obj_image_anim_frame 6, 10, OBJ_IMAGE_ANIM_H_FLIP
	obj_image_anim_jump 0

	.align 2
gSpriteAnimTable_83FA4F0:: @ 83FA4F0
	.4byte gSpriteAnim_83FA494

	.align 2
gSpriteAnimTable_83FA4F4:: @ 83FA4F4
	.4byte gSpriteAnim_83FA4B0
	.4byte gSpriteAnim_83FA4B8
	.4byte gSpriteAnim_83FA4C0
	.4byte gSpriteAnim_83FA4CC
	.4byte gSpriteAnim_83FA4D8
	.4byte gSpriteAnim_83FA4E4

	.align 2
gSpriteTemplate_83FA50C:: @ 83FA50C
	spr_template 0xFFFF, 6, gOamData_83FA44C, gSpriteAnimTable_83FA4F0, gSpriteImageTable_83FA45C, gDummySpriteAffineAnimTable, SpriteCallbackDummy

	.align 2
gSpriteTemplate_83FA524:: @ 83FA524
	spr_template 0xFFFF, 7, gOamData_83FA454, gSpriteAnimTable_83FA4F4, gSpriteImageTable_83FA45C, gDummySpriteAffineAnimTable, sub_8119D80

	.align 2
gOamData_83FA53C:: @ 83FA53C
	.2byte 0x0000
	.2byte 0x4000
	.2byte 0x0800

	.align 2
gOamData_83FA544:: @ 83FA544
	.2byte 0x4000
	.2byte 0x8000
	.2byte 0x0800

	.align 2
gOamData_83FA54C:: @ 83FA54C
	.2byte 0x4100
	.2byte 0x8000
	.2byte 0x0800

	.align 2
gSpriteImageTable_83FA554: @ 83FA554
	obj_frame_tiles gSharedMem + 0x18000, 0x80

	.align 2
gSpriteImageTable_83FA55C: @ 83FA55C
	obj_frame_tiles gSharedMem + 0x18080, 0x100

	.align 2
gSpriteAffineAnim_83FA564:: @ 83FA564
	obj_rot_scal_anim_frame 0x80, 0x80, 0, 0
	obj_rot_scal_anim_frame 0x2, 0x2, 0, 60
	obj_rot_scal_anim_end

	.align 2
gSpriteAffineAnim_83FA57C:: @ 83FA57C
	obj_rot_scal_anim_frame 0x100, 0x100, 0, 0
	obj_rot_scal_anim_frame 0xFFFE, 0x0, 0, 15
	obj_rot_scal_anim_frame 0xFFFF, 0xFFFE, 0, 15
	obj_rot_scal_anim_frame 0xFFFF, 0xFFFB, 0, 24
	obj_rot_scal_anim_end

	.align 2
gSpriteAffineAnimTable_83FA5A4:: @ 83FA5A4
	.4byte gSpriteAffineAnim_83FA564

	.align 2
gSpriteAffineAnimTable_83FA5A8:: @ 83FA5A8
	.4byte gSpriteAffineAnim_83FA57C

	.align 2
gSpriteAffineAnim_83FA5AC:: @ 83FA5AC
	obj_rot_scal_anim_frame 0x100, 0x100, 0, 0
	obj_rot_scal_anim_end

	.align 2
gSpriteAffineAnimTable_83FA5BC:: @ 83FA5BC
	.4byte gSpriteAffineAnim_83FA5AC

	.align 2
gSpriteTemplate_83FA5C0:: @ 83FA5C0
	spr_template 0xFFFF, 1, gOamData_83FA53C, gSpriteAnimTable_83F9ED8, gSpriteImageTable_83FA554, gDummySpriteAffineAnimTable, SpriteCallbackDummy

	.align 2
gSpriteTemplate_83FA5D8:: @ 83FA5D8
	spr_template 0xFFFF, 1, gOamData_83FA544, gSpriteAnimTable_83F9ED8, gSpriteImageTable_83FA55C, gDummySpriteAffineAnimTable, sub_8119964

	.align 2
gSpriteTemplate_83FA5F0:: @ 83FA5F0
	spr_template 0xFFFF, 1, gOamData_83FA54C, gSpriteAnimTable_83F9ED8, gSpriteImageTable_83FA55C, gSpriteAffineAnimTable_83FA5A8, sub_8119D80

gUnknown_083FA608:: @ 83FA608
	.byte 0, 1, 2, 3, 4

	.align 1
gUnknown_083FA60E:: @ 83FA60E
	.2byte 0x74, 0x2C
	.2byte 0x74, 0x70

	.align 1
gUnknown_083FA616:: @ 83FA616
	.2byte 256, 84
	.2byte -16, 84

	.align 1
gUnknown_083FA61E:: @ 83FA61E
	.2byte 0x907
	.2byte 0x808
	.2byte 0x709
	.2byte 0x60A
	.2byte 0x50B
	.2byte 0x40C
	.2byte 0x30D
	.2byte 0x20E
	.2byte 0x10F
	.2byte  0x10

	.align 1
gUnknown_083FA632:: @ 83FA632
	.2byte  -1,  0,  1,  0
	.2byte  -2,  0,  2,  0
	.2byte  -3,  0,  3,  0

gUnknown_083FA64A:: @ 83FA64A
	.byte -1, 1

gUnknown_083FA64C:: @ 83FA64C
	.byte   2,  0
	.byte   2,  0
	.byte   2, -1
	.byte   2, -1
	.byte   2, -1
	.byte   2, -1
	.byte   2, -2
	.byte   2, -2
