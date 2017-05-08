	.include "asm/macros.inc"
	.include "constants/constants.inc"

	.section .rodata

@ 81FC1E0
	.include "data/species_id_conversion_tables.inc"

@ 81FCB84
	.include "data/spinda_spot_graphics.inc"

@ 81FCC14
	.include "data/item_effects.inc"

@ 81FD070
	.include "data/nature_stat_table.inc"

@ 81FD0F0
	.include "data/tm_hm_learnsets.inc"

@ 81FDDD0
	.include "data/trainer_class_index_tables.inc"

@ 81FDE6A
	.include "data/cry_id_table.inc"

@ 81FDF78
	.include "data/experience_tables/tables.inc"

@ 81FEC18
	.include "data/base_stats.inc"

@ 8201928
	.include "data/level_up_learnsets.inc"

@ 8203B68
	.include "data/evolution_table.inc"

@ 8207BC8
	.include "data/level_up_learnset_pointers.inc"

gUnknown_08208238:: @ 8208238
	.byte 0x03, 0x0C, 0x30, 0xC0

gUnknown_0820823C:: @ 820823C
	.byte 0xFC, 0xF3, 0xCF, 0x3F

gUnknown_08208240:: @ 8208240
	.byte 0x01, 0x04, 0x10, 0x40

gStatStageRatios:: @ 8208244
	.byte 10, 40 @ -6
	.byte 10, 35 @ -5
	.byte 10, 30 @ -4
	.byte 10, 25 @ -3
	.byte 10, 20 @ -2
	.byte 10, 15 @ -1
	.byte 10, 10 @  0
	.byte 15, 10 @ +1
	.byte 20, 10 @ +2
	.byte 25, 10 @ +3
	.byte 30, 10 @ +4
	.byte 35, 10 @ +5
	.byte 40, 10 @ +6

@ abbreviation of Game Freak
	.string "ゲーフリ$"

gHoldEffectToType:: @ 8208263
	.byte HOLD_EFFECT_BUG_POWER,      TYPE_BUG
	.byte HOLD_EFFECT_STEEL_POWER,    TYPE_STEEL
	.byte HOLD_EFFECT_GROUND_POWER,   TYPE_GROUND
	.byte HOLD_EFFECT_ROCK_POWER,     TYPE_ROCK
	.byte HOLD_EFFECT_GRASS_POWER,    TYPE_GRASS
	.byte HOLD_EFFECT_DARK_POWER,     TYPE_DARK
	.byte HOLD_EFFECT_FIGHTING_POWER, TYPE_FIGHTING
	.byte HOLD_EFFECT_ELECTRIC_POWER, TYPE_ELECTRIC
	.byte HOLD_EFFECT_WATER_POWER,    TYPE_WATER
	.byte HOLD_EFFECT_FLYING_POWER,   TYPE_FLYING
	.byte HOLD_EFFECT_POISON_POWER,   TYPE_POISON
	.byte HOLD_EFFECT_ICE_POWER,      TYPE_ICE
	.byte HOLD_EFFECT_GHOST_POWER,    TYPE_GHOST
	.byte HOLD_EFFECT_PSYCHIC_POWER,  TYPE_PSYCHIC
	.byte HOLD_EFFECT_FIRE_POWER,     TYPE_FIRE
	.byte HOLD_EFFECT_DRAGON_POWER,   TYPE_DRAGON
	.byte HOLD_EFFECT_NORMAL_POWER,   TYPE_NORMAL
	.byte 0, 0

	.align 2
gSpriteTemplate_8208288:: @ 8208288
	spr_template 0xFFFF, 0, gOamData_81F96F0, NULL, gSpriteImageTable_81E7A10, gSpriteAffineAnimTable_81E7B70, sub_80105A0
	spr_template 0xFFFF, 0, gOamData_81F96E8, NULL, gSpriteImageTable_81E7A30, gSpriteAffineAnimTable_81E7BEC, oac_poke_opponent
	spr_template 0xFFFF, 0, gOamData_81F96F0, NULL, gSpriteImageTable_81E7A50, gSpriteAffineAnimTable_81E7B70, sub_80105A0
	spr_template 0xFFFF, 0, gOamData_81F96E8, NULL, gSpriteImageTable_81E7A70, gSpriteAffineAnimTable_81E7BEC, oac_poke_opponent

gSecretBaseTrainerClasses:: @ 82082E8
	.byte TRAINER_CLASS_YOUNGSTER, TRAINER_CLASS_BUG_CATCHER,  TRAINER_CLASS_RICH_BOY, TRAINER_CLASS_CAMPER,    TRAINER_CLASS_COOL_TRAINER_M
	.byte TRAINER_CLASS_LASS,      TRAINER_CLASS_SCHOOL_KID_F, TRAINER_CLASS_LADY,     TRAINER_CLASS_PICNICKER, TRAINER_CLASS_COOL_TRAINER_F

gUnknown_082082F2:: @ 82082F2
	.byte 0x1A, 0x1B, 0x1C, 0x1D, 0x1F, 0x1E

gUnknown_082082F8:: @ 82082F8
	.byte 1, 1, 3, 2, 4, 6

gUnknown_082082FE:: @ 82082FE
	.byte  5,  3,   2
	.byte  5,  3,   2
	.byte  1,  1,   0
	.byte  3,  2,   1
	.byte  1,  1,   0
	.byte  1,  1,   1
	.byte -1, -1,  -1
	.byte -5, -5, -10
	.byte -5, -5, -10

	.align 1
gHMMoves:: @ 820831A
	.2byte MOVE_CUT
	.2byte MOVE_FLY
	.2byte MOVE_SURF
	.2byte MOVE_STRENGTH
	.2byte MOVE_FLASH
	.2byte MOVE_ROCK_SMASH
	.2byte MOVE_WATERFALL
	.2byte MOVE_DIVE
	.2byte 0xFFFF

@ "Nidoran♂" Japanese name
	.string "ニドラン♂$", 11

@ "Nidoran♀" Japanese name
gUnknown_08208337:: @ 8208337
	.string "ニドラン♀$", 13
