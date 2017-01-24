	.include "asm/macros.inc"
	.include "constants/constants.inc"

	.section .rodata

	.align 2
gUnknown_083CE2B4:: @ 83CE2B4
	.4byte sub_80B6B5C
	.4byte sub_80B6B98
	.4byte sub_80B6B9C
	.4byte sub_80B6C08

	.align 1
gUnknown_083CE2C4:: @ 83CE2C4
	.2byte 1, 3, 2

	.align 1
gUnknown_083CE2CA:: @ 83CE2CA
	.2byte 4, 6, 5

	.align 1
gUnknown_083CE2D0:: @ 83CE2D0
	.2byte 0, -4, -2, -1

	.align 1
gUnknown_083CE2D8:: @ 83CE2D8
	.2byte 2,  3,  2,  1

	.align 2
gUnknown_083CE2E0:: @ 83CE2E0
	.4byte nullsub_40
	.4byte sub_80B6E68
	.4byte sub_80B6EBC
	.4byte sub_80B6EFC

	.align 2
gUnknown_083CE2F0:: @ 83CE2F0
	.4byte sub_80B7660
	.4byte sub_80B7650
	.4byte sub_80B7650
	.4byte sub_80B7670
	.4byte sub_80B7670
	.4byte sub_80B7660

	.align 2
gUnknown_083CE308:: @ 83CE308
	.4byte VRAM + 0xE000
	.4byte VRAM + 0xE800

	.align 2
gUnknown_083CE310:: @ 83CE310
	.4byte sub_80B7844
	.4byte sub_80B7838
	.4byte sub_80B7838
	.4byte sub_80B7850
	.4byte sub_80B7850
	.4byte sub_80B7844

	.align 2
gUnknown_083CE328:: @ 83CE328
	.4byte gWindowConfig_81E6EDC
	.4byte gWindowConfig_81E6EF8
	.4byte gWindowConfig_81E6EA4
	.4byte gWindowConfig_81E6EC0
	.4byte gWindowConfig_81E6EA4
	.4byte gWindowConfig_81E6EC0
	.4byte gWindowConfig_81E6F14
	.4byte gWindowConfig_81E6F30
	.4byte gWindowConfig_81E6F14
	.4byte gWindowConfig_81E6F30
	.4byte gWindowConfig_81E6EDC
	.4byte gWindowConfig_81E6EF8

	.align 2
gUnknown_083CE358:: @ 83CE358
	.4byte nullsub_61
	.4byte nullsub_61
	.4byte sub_80B78F8
	.4byte sub_80B78F8

	.align 2
gUnknown_083CE368:: @ 83CE368
	.4byte nullsub_62
	.4byte sub_80B7924

gUnknown_083CE370:: @ 83CE370
	.string "♂$"

	.align 2
Unknown_83CE374:
	.byte 0, 7, 1, 0, 0, 0, 0, 0
	.4byte OtherText_YourName

	.align 2
Unknown_83CE380:
	.byte 0, 8, 2, 0, 0, 0, 0, 0
	.4byte OtherText_BoxName

	.align 2
Unknown_83CE38C:
	.byte 0, 10, 3, 1, 0, 0, 0, 0
	.4byte OtherText_PokeName

	.align 2
gUnknown_083CE398:: @ 83CE398
	.4byte Unknown_83CE374
	.4byte Unknown_83CE380
	.4byte Unknown_83CE38C
	.4byte Unknown_83CE38C

gUnknown_083CE3A8:: @ 83CE3A8
	.string " A B C  D E F    . $"
	.string " G H I  J K L    , $"
	.string " M N O  P Q R S    $"
	.string " T U V  W X Y Z    $"
	.string " a b c  d e f    . $"
	.string " g h i  j k l    , $"
	.string " m n o  p q r s    $"
	.string " t u v  w x y z    $"
	.string " 0  1  2  3  4     $"
	.string " 5  6  7  8  9     $"
	.string " !  ?  ♂  ♀  /  -  $"
	.string " …  “  ”  ‘  ’     $"

	.align 2
gOamData_83CE498:: @ 83CE498
	.2byte 0x0000
	.2byte 0x0000
	.2byte 0x0000

	.align 2
gOamData_83CE4A0:: @ 83CE4A0
	.2byte 0x0000
	.2byte 0x4000
	.2byte 0x0000

	.align 2
gOamData_83CE4A8:: @ 83CE4A8
	.2byte 0x4000
	.2byte 0x8000
	.2byte 0x0000

	.align 2
gSubspriteTable_83CE4B0:: @ 83CE4B0
	subsprite -20, -16, 1,   0, 32x8
	subsprite  12, -16, 1,   4,  8x8
	subsprite -20,  -8, 1,   5, 32x8
	subsprite  12,  -8, 1,   9,  8x8
	subsprite -20,   0, 1,  10, 32x8
	subsprite  12,   0, 1,  14,  8x8
	subsprite -20,   8, 1,  15, 32x8
	subsprite  12,   8, 1,  19,  8x8

@ unreferenced
	.align 2
gSubspriteTable_83CE4F0:: @ 83CE4F0
	subsprite -12,  -4, 1,   0,  8x8
	subsprite   4,  -4, 1,   1,  8x8

	.align 2
gSubspriteTable_83CE500:: @ 83CE500
	subsprite -12,  -4, 1,   0, 16x8
	subsprite   4,  -4, 1,   2,  8x8

	.align 2
gSubspriteTable_83CE510:: @ 83CE510
	subsprite -20, -12, 1,   0, 32x8
	subsprite  12, -12, 1,   4,  8x8
	subsprite -20,  -4, 1,   5, 32x8
	subsprite  12,  -4, 1,   9,  8x8
	subsprite -20,   4, 1,  10, 32x8
	subsprite  12,   4, 1,  14,  8x8

	.align 2
gSubspriteTable_83CE540:: @ 83CE540
	subsprite  -8, -12, 3,   0, 16x8
	subsprite  -8,  -4, 3,   2, 16x8
	subsprite  -8,   4, 3,   4, 16x8

	.align 2
gSubspriteTables_83CE558:: @ 83CE558
	.4byte 8, gSubspriteTable_83CE4B0

	.align 2
gSubspriteTables_83CE560:: @ 83CE560
	.4byte 2, gSubspriteTable_83CE500
	.4byte 2, gSubspriteTable_83CE500
	.4byte 2, gSubspriteTable_83CE500

	.align 2
gSubspriteTables_83CE578:: @ 83CE578
	.4byte 6, gSubspriteTable_83CE510

	.align 2
gSubspriteTables_83CE580:: @ 83CE580
	.4byte 3, gSubspriteTable_83CE540

	.align 2
gSpriteImageTable_83CE588:: @ 83CE588
	obj_frame_tiles gSpriteImage_83CE094, 0xc0
	obj_frame_tiles gSpriteImage_83CE154, 0xc0

	.align 2
gSpriteAnim_83CE598:: @ 83CE598
	obj_image_anim_frame 0, 1
	obj_image_anim_jump 0

	.align 2
gSpriteAnim_83CE5A0:: @ 83CE5A0
	obj_image_anim_frame 4, 8
	obj_image_anim_frame 8, 8
	obj_image_anim_end

	.align 2
gSpriteAnim_83CE5AC:: @ 83CE5AC
	obj_image_anim_frame 0, 2
	obj_image_anim_frame 1, 2
	obj_image_anim_jump 0

	.align 2
gSpriteAnimTable_83CE5B8:: @ 83CE5B8
	.4byte gSpriteAnim_83CE598

	.align 2
gSpriteAnimTable_83CE5BC:: @ 83CE5BC
	.4byte gSpriteAnim_83CE598
	.4byte gSpriteAnim_83CE5A0

	.align 2
gSpriteAnimTable_83CE5C4:: @ 83CE5C4
	.4byte gSpriteAnim_83CE5AC

	.align 2
gSpriteTemplate_83CE5C8:: @ 83CE5C8
	spr_template 2, 4, gOamData_83CE498, gSpriteAnimTable_83CE5B8, NULL, gDummySpriteAffineAnimTable, sub_80B6B34

	.align 2
gSpriteTemplate_83CE5E0:: @ 83CE5E0
	spr_template 3, 1, gOamData_83CE4A8, gSpriteAnimTable_83CE5B8, NULL, gDummySpriteAffineAnimTable, SpriteCallbackDummy

	.align 2
gSpriteTemplate_83CE5F8:: @ 83CE5F8
	spr_template 4, 4, gOamData_83CE498, gSpriteAnimTable_83CE5B8, NULL, gDummySpriteAffineAnimTable, SpriteCallbackDummy

	.align 2
gSpriteTemplate_83CE610:: @ 83CE610
	spr_template 0, 6, gOamData_83CE498, gSpriteAnimTable_83CE5B8, NULL, gDummySpriteAffineAnimTable, SpriteCallbackDummy

	.align 2
gSpriteTemplate_83CE628:: @ 83CE628
	spr_template 1, 6, gOamData_83CE498, gSpriteAnimTable_83CE5B8, NULL, gDummySpriteAffineAnimTable, SpriteCallbackDummy

	.align 2
gSpriteTemplate_83CE640:: @ 83CE640
	spr_template 7, 5, gOamData_83CE4A0, gSpriteAnimTable_83CE5BC, NULL, gDummySpriteAffineAnimTable, sub_80B6998

	.align 2
gSpriteTemplate_83CE658:: @ 83CE658
	spr_template 10, 3, gOamData_83CE498, gSpriteAnimTable_83CE5B8, NULL, gDummySpriteAffineAnimTable, sub_80B6D9C

	.align 2
gSpriteTemplate_83CE670:: @ 83CE670
	spr_template 11, 3, gOamData_83CE498, gSpriteAnimTable_83CE5B8, NULL, gDummySpriteAffineAnimTable, sub_80B6DE8

	.align 2
gSpriteTemplate_83CE688:: @ 83CE688
	spr_template 0xFFFF, 0, gOamData_83CE498, gSpriteAnimTable_83CE5C4, gSpriteImageTable_83CE588, gDummySpriteAffineAnimTable, SpriteCallbackDummy

	.align 2
gUnknown_083CE6A0:: @ 83CE6A0
	obj_tiles gNamingScreenBackButtonTiles, 0x1E0, 0
	obj_tiles gNamingScreenOKButtonTiles, 0x1E0, 1
	obj_tiles gNamingScreenChangeKeyboardBoxTiles, 0x280, 2
	obj_tiles gNamingScreenChangeKeyboardButtonTiles, 0x100, 3
	obj_tiles gNamingScreenLowerTextTiles, 0x60, 4
	obj_tiles gNamingScreenUpperTextTiles, 0x60, 5
	obj_tiles gNamingScreenOthersTextTiles, 0x60, 6
	obj_tiles gNamingScreenCursorTiles, 0x80, 7
	obj_tiles gNamingScreenActiveCursorSmallTiles, 0x80, 8
	obj_tiles gNamingScreenActiveCursorBigTiles, 0x80, 9
	obj_tiles gNamingScreenRightPointingTriangleTiles, 0x20, 10
	obj_tiles gNamingScreenUnderscoreTiles, 0x20, 11
	null_obj_tiles

	.align 2
gUnknown_083CE708:: @ 83CE708
	obj_pal gNamingScreenPalettes + 0x20 * 0, 0
	obj_pal gNamingScreenPalettes + 0x20 * 1, 1
	obj_pal gNamingScreenPalettes + 0x20 * 2, 2
	obj_pal gNamingScreenPalettes + 0x20 * 3, 3
	obj_pal gNamingScreenPalettes + 0x20 * 4, 4
	obj_pal gNamingScreenPalettes + 0x20 * 5, 5
	obj_pal gNamingScreenPalettes + 0x20 * 4, 6
	null_obj_pal

	.align 2
gUnknown_083CE748:: @ 83CE748
	.incbin "graphics/naming_screen/lower_keyboard_map.bin"

	.align 2
gUnknown_083CEBF8:: @ 83CEBF8
	.incbin "graphics/naming_screen/upper_keyboard_map.bin"

	.align 2
gUnknown_083CF0A8:: @ 83CF0A8
	.incbin "graphics/naming_screen/others_keyboard_map.bin"
