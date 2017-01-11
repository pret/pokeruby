	.include "asm/macros.inc"
	.include "constants/constants.inc"

	.section .rodata

gUnknown_083F7E28:: @ 83F7E28
	.byte  0,  0,  0,  0,  0
	.byte  1,  0,  0,  0, -1
	.byte  1,  0, -1,  0,  0
	.byte  1, -1,  0,  0,  0
	.byte  1,  0,  0, -1,  0
	.byte -1,  0,  0,  0,  1
	.byte  0,  0,  0,  0,  0
	.byte  0,  0, -1,  0,  1
	.byte  0, -1,  0,  0,  1
	.byte  0,  0,  0, -1,  1
	.byte -1,  0,  1,  0,  0
	.byte  0,  0,  1,  0, -1
	.byte  0,  0,  0,  0,  0
	.byte  0, -1,  1,  0,  0
	.byte  0,  0,  1, -1,  0
	.byte -1,  1,  0,  0,  0
	.byte  0,  1,  0,  0, -1
	.byte  0,  1, -1,  0,  0
	.byte  0,  0,  0,  0,  0
	.byte  0,  1,  0, -1,  0
	.byte -1,  0,  0,  1,  0
	.byte  0,  0,  0,  1, -1
	.byte  0,  0, -1,  1,  0
	.byte  0, -1,  0,  1,  0
	.byte  0,  0,  0,  0,  0

	.align 2
gUnknown_083F7EA8:: @ 83F7EA8
	.4byte sub_80A5B40, c2_exit_to_overworld_2_switch
	.4byte sub_802E424, c2_exit_to_overworld_2_switch

	.align 2
gPokeblockNames:: @ 83F7EB8
	.4byte NULL
	.4byte ContestStatsText_RedPokeBlock
	.4byte ContestStatsText_BluePokeBlock
	.4byte ContestStatsText_PinkPokeBlock
	.4byte ContestStatsText_GreenPokeBlock
	.4byte ContestStatsText_YellowPokeBlock
	.4byte ContestStatsText_PurplePokeBlock
	.4byte ContestStatsText_IndigoPokeBlock
	.4byte ContestStatsText_BrownPokeBlock
	.4byte ContestStatsText_LiteBluePokeBlock
	.4byte ContestStatsText_OlivePokeBlock
	.4byte ContestStatsText_GrayPokeBlock
	.4byte ContestStatsText_BlackPokeBlock
	.4byte ContestStatsText_WhitePokeBlock
	.4byte ContestStatsText_GoldPokeBlock

	.align 2
gUnknown_083F7EF4:: @ 83F7EF4
	.4byte OtherText_Use,     sub_810C508
	.4byte OtherText_Toss,    sub_810C5C0
	.4byte gOtherText_CancelNoTerminator, sub_810C748
	.4byte OtherText_Use,     sub_810C788
	.4byte OtherText_Use,     sub_810C854

gUnknown_083F7F1C:: @ 83F7F1C
	.byte 0, 1, 2

gUnknown_083F7F1F:: @ 83F7F1F
	.byte 3, 2

gUnknown_083F7F21:: @ 83F7F21
	.byte 4, 2

	.align 2
gUnknown_083F7F24:: @ 83F7F24
	.4byte sub_810C610
	.4byte sub_810C668

@ unreferenced
	.byte 0x16, 0x17, 0x18, 0x21, 0x2F

	.align 2
gOamData_83F7F34:: @ 83F7F34
	.2byte 0x0000
	.2byte 0xC000
	.2byte 0x0800

	.align 2
gSpriteAnim_83F7F3C:: @ 83F7F3C
	obj_image_anim_frame 0, 0
	obj_image_anim_end

	.align 2
gSpriteAnimTable_83F7F44:: @ 83F7F44
	.4byte gSpriteAnim_83F7F3C

	.align 2
gSpriteAffineAnim_83F7F48:: @ 83F7F48
	obj_rot_scal_anim_frame 0x0, 0x0, -2, 2
	obj_rot_scal_anim_frame 0x0, 0x0, 2, 4
	obj_rot_scal_anim_frame 0x0, 0x0, -2, 4
	obj_rot_scal_anim_frame 0x0, 0x0, 2, 2
	obj_rot_scal_anim_end

	.align 2
gSpriteAffineAnimTable_83F7F70:: @ 83F7F70
	.4byte gSpriteAffineAnim_83F7F48

	.align 2
gUnknown_083F7F74:: @ 83F7F74
	obj_tiles gMenuPokeblockDevice_Gfx, 2048, 0x39d0

	.align 2
gUnknown_083F7F7C:: @ 83F7F7C
	obj_pal gMenuPokeblockDevice_Pal, 0x39d0

	.align 2
gSpriteTemplate_83F7F84:: @ 83F7F84
	spr_template 14800, 14800, gOamData_83F7F34, gSpriteAnimTable_83F7F44, NULL, gDummySpriteAffineAnimTable, SpriteCallbackDummy

gUnknown_083F7F9C:: @ 83F7F9C
	.byte  1, 20,  0,  0,  0,  0, 20,  0
	.byte  2,  0, 20,  0,  0,  0, 20,  0
	.byte  3,  0,  0, 20,  0,  0, 20,  0
	.byte  4,  0,  0,  0, 20,  0, 20,  0
	.byte  5,  0,  0,  0,  0, 20, 20,  0
