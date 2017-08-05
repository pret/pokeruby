	.include "asm/macros.inc"
	.include "constants/constants.inc"

	.section .rodata

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

.ifdef ENGLISH
UnknownText_Mister:
	.string "MISTER$"
UnknownText_Laddie:
	.string "LADDIE$"
UnknownText_Lassie:
	.string "LASSIE$"
.else
UnknownText_Mister:
	.string "OPI$"
UnknownText_Laddie:
	.string "KUMPEL$"
UnknownText_Lassie:
	.string "TUSSI$"
.endif

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

sBlenderSyncArrowsPos:: @ 82162E4
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
sBlenderSyncArrow_SpriteTemplate:: @ 82163F4
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
