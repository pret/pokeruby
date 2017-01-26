	.include "asm/macros.inc"
	.include "constants/constants.inc"

	.section .rodata

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
