	.include "asm/macros.inc"
	.include "constants/constants.inc"

	.section .rodata

	.align 2
ConditionUpDownPalette:
	.incbin "graphics/misc/condition_up_down.gbapal"

	.align 2
ConditionUpDownTiles:
	.incbin "graphics/misc/condition_up_down.4bpp"

gUnknown_08406118:: @ 8406118
	.incbin "baserom.gba", 0x00406118, 0x14

	.align 2
gUnknown_0840612C:: @ 840612C
	obj_pal 0x02030400, 0x0001

	.align 2
gUnknown_08406134:: @ 8406134
	.4byte OtherText_Coolness
	.4byte OtherText_Toughness
	.4byte OtherText_Smartness
	.4byte OtherText_Cuteness
	.4byte OtherText_Beauty

	.align 2
gSpriteSheet_ConditionUpDown:: @ 8406148
	obj_tiles ConditionUpDownTiles, 0x200, 0

	.align 2
gSpritePalette_ConditionUpDown:: @ 8406150
	obj_pal ConditionUpDownPalette, 0

gUnknown_08406158:: @ 8406158
	.incbin "baserom.gba", 0x00406158, 0x14

	.align 2
gOamData_840616C:: @ 840616C
	.2byte 0x4000
	.2byte 0x8000
	.2byte 0x0400

	.align 2
gSpriteAnim_8406174:: @ 8406174
	obj_image_anim_frame 0, 5
	obj_image_anim_end

	.align 2
gSpriteAnim_840617C:: @ 840617C
	obj_image_anim_frame 8, 5
	obj_image_anim_end

	.align 2
gSpriteAnimTable_8406184:: @ 8406184
	.4byte gSpriteAnim_8406174
	.4byte gSpriteAnim_840617C

	.align 2
gSpriteTemplate_840618C:: @ 840618C
	spr_template 0, 0, gOamData_840616C, gSpriteAnimTable_8406184, NULL, gDummySpriteAffineAnimTable, SpriteCallbackDummy

	.align 2
gUnknown_084061A4:: @ 84061A4
	.4byte dp01t_00_5_getattr
	.4byte sub_8138230
	.4byte sub_813823C
	.4byte sub_8138C90
	.4byte sub_8138C9C
	.4byte sub_8138CA8
	.4byte sub_8138CB4
	.4byte sub_8138D38
	.4byte sub_8138E04
	.4byte sub_8138ED0
	.4byte sub_8138EDC
	.4byte sub_8138EE8
	.4byte sub_8138EF4
	.4byte sub_8138F44
	.4byte sub_8138FA0
	.4byte sub_8138FAC
	.4byte sub_8139208
	.4byte dp01t_11_5_message_for_player_only
	.4byte sub_8139298
	.4byte sub_8139378
	.4byte sub_8139384
	.4byte sub_81393EC
	.4byte sub_813942C
	.4byte sub_8139438
	.4byte sub_8139444
	.4byte sub_8139544
	.4byte sub_8139550
	.4byte sub_813955C
	.4byte sub_8139568
	.4byte sub_8139574
	.4byte sub_8139580
	.4byte sub_813958C
	.4byte sub_8139598
	.4byte sub_81395A4
	.4byte sub_81395B0
	.4byte sub_81395BC
	.4byte sub_81395C8
	.4byte sub_81395D4
	.4byte sub_81395E0
	.4byte sub_81395EC
	.4byte sub_81395F8
	.4byte sub_8139604
	.4byte sub_8139674
	.4byte sub_8139680
	.4byte sub_81396B0
	.4byte sub_81396E0
	.4byte dp01t_2E_5_battle_intro
	.4byte sub_8139750
	.4byte sub_8139AA0
	.4byte sub_8139B20
	.4byte sub_8139B2C
	.4byte sub_8139B38
	.4byte sub_8139B44
	.4byte sub_8139BA0
	.4byte sub_8139BAC
	.4byte sub_8139BB8
	.4byte nullsub_80
