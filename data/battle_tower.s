	.include "asm/macros.inc"
	.include "constants/constants.inc"

	.section .rodata

@ 8402F00
.ifdef ENGLISH
	.include "data/battle_tower/trainers_en.inc"
.else
	.include "data/battle_tower/trainers_de.inc"
.endif

@ 8403860
	.include "data/battle_tower/held_items.inc"

@ 84038E0
	.include "data/battle_tower/level_50_mons.inc"

@ 8404BA0
	.include "data/battle_tower/level_100_mons.inc"

gUnknown_08405E60:: @ 8405E60
	.byte  4
	.byte  7
	.byte  8
	.byte 13
	.byte 14
	.byte 15
	.byte 16
	.byte 17
	.byte 18
	.byte 19
	.byte 20
	.byte 21
	.byte 23
	.byte 29
	.byte 32
	.byte 34
	.byte 36
	.byte 38
	.byte 39
	.byte 41
	.byte 43
	.byte 45
	.byte 46
	.byte 47
	.byte 53
	.byte 56
	.byte 64
	.byte 66
	.byte 72
	.byte 73

gUnknown_08405E7E:: @ 8405E7E
	.byte  3
	.byte  6
	.byte  9
	.byte 10
	.byte 11
	.byte 12
	.byte 22
	.byte 30
	.byte 33
	.byte 35
	.byte 40
	.byte 42
	.byte 44
	.byte 48
	.byte 49
	.byte 50
	.byte 51
	.byte 65
	.byte 67
	.byte 71

gUnknown_08405E92:: @ 8405E92
	.byte MAP_OBJ_GFX_HIKER
	.byte MAP_OBJ_GFX_TUBER_M
	.byte MAP_OBJ_GFX_MAN_4
	.byte MAP_OBJ_GFX_BOY_4
	.byte MAP_OBJ_GFX_MANIAC
	.byte MAP_OBJ_GFX_RUNNING_TRIATHLETE_M
	.byte MAP_OBJ_GFX_BLACK_BELT
	.byte MAP_OBJ_GFX_MAN_6
	.byte MAP_OBJ_GFX_MAN_6
	.byte MAP_OBJ_GFX_CAMPER
	.byte MAP_OBJ_GFX_MANIAC
	.byte MAP_OBJ_GFX_PSYCHIC_M
	.byte MAP_OBJ_GFX_GENTLEMAN
	.byte MAP_OBJ_GFX_SCHOOL_KID_M
	.byte MAP_OBJ_GFX_MAN_3
	.byte MAP_OBJ_GFX_OLD_MAN_1
	.byte MAP_OBJ_GFX_YOUNGSTER
	.byte MAP_OBJ_GFX_FISHERMAN
	.byte MAP_OBJ_GFX_CYCLING_TRIATHLETE_M
	.byte MAP_OBJ_GFX_RUNNING_TRIATHLETE_M
	.byte MAP_OBJ_GFX_RUNNING_TRIATHLETE_M
	.byte MAP_OBJ_GFX_MAN_4
	.byte MAP_OBJ_GFX_MAN_6
	.byte MAP_OBJ_GFX_LITTLE_BOY_1
	.byte MAP_OBJ_GFX_SAILOR
	.byte MAP_OBJ_GFX_MANIAC
	.byte MAP_OBJ_GFX_MAN_5
	.byte MAP_OBJ_GFX_CAMPER
	.byte MAP_OBJ_GFX_BUG_CATCHER
	.byte MAP_OBJ_GFX_HIKER

gUnknown_08405EB0:: @ 8405EB0
	.byte MAP_OBJ_GFX_WOMAN_3
	.byte MAP_OBJ_GFX_TUBER_F
	.byte MAP_OBJ_GFX_WOMAN_7
	.byte MAP_OBJ_GFX_WOMAN_1
	.byte MAP_OBJ_GFX_WOMAN_3
	.byte MAP_OBJ_GFX_BEAUTY
	.byte MAP_OBJ_GFX_LASS
	.byte MAP_OBJ_GFX_GIRL_3
	.byte MAP_OBJ_GFX_WOMAN_2
	.byte MAP_OBJ_GFX_OLD_WOMAN_1
	.byte MAP_OBJ_GFX_CYCLING_TRIATHLETE_F
	.byte MAP_OBJ_GFX_RUNNING_TRIATHLETE_F
	.byte MAP_OBJ_GFX_RUNNING_TRIATHLETE_F
	.byte MAP_OBJ_GFX_GIRL_3
	.byte MAP_OBJ_GFX_WOMAN_7
	.byte MAP_OBJ_GFX_RUNNING_TRIATHLETE_F
	.byte MAP_OBJ_GFX_PICNICKER
	.byte MAP_OBJ_GFX_WOMAN_3
	.byte MAP_OBJ_GFX_PICNICKER
	.byte MAP_OBJ_GFX_LASS

	.align 1
gBattleTowerBanlist:: @ 8405EC4
	.2byte SPECIES_MEW
	.2byte SPECIES_MEWTWO
	.2byte SPECIES_HO_OH
	.2byte SPECIES_LUGIA
	.2byte SPECIES_CELEBI
	.2byte SPECIES_KYOGRE
	.2byte SPECIES_GROUDON
	.2byte SPECIES_RAYQUAZA
	.2byte SPECIES_JIRACHI
	.2byte SPECIES_DEOXYS
	.2byte -1

	.align 1
gUnknown_08405EDA:: @ 8405EDA
	.2byte ITEM_HP_UP
	.2byte ITEM_PROTEIN
	.2byte ITEM_IRON
	.2byte ITEM_CALCIUM
	.2byte ITEM_CARBOS
	.2byte ITEM_ZINC

	.align 1
gUnknown_08405EE6:: @ 8405EE6
	.2byte ITEM_BRIGHT_POWDER
	.2byte ITEM_WHITE_HERB
	.2byte ITEM_QUICK_CLAW
	.2byte ITEM_LEFTOVERS
	.2byte ITEM_MENTAL_HERB
	.2byte ITEM_KINGS_ROCK
	.2byte ITEM_FOCUS_BAND
	.2byte ITEM_SCOPE_LENS
	.2byte ITEM_CHOICE_BAND
