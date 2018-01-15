	.include "include/macros.inc"
	.include "constants/constants.inc"

	.section .rodata

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
