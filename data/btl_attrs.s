@ the second big chunk of data

#include "constants/items.h"
#include "constants/moves.h"
#include "constants/species.h"
	.include "include/macros.inc"
	.include "constants/constants.inc"

	.section .rodata

@ 81F716C
@	.include "data/text/species_names.inc"

@ 81F8320
	.include "data/text/move_names.inc"

	.align 2
@ 81F9528
	.4byte 0x101 @ unknown data

	.align 2
gOamData_81F952C:: @ 81F952C
	.2byte 0x0300
	.2byte 0xC000
	.2byte 0x0000

	.align 2
gOamData_81F9534:: @ 81F9534
	.2byte 0x0300
	.2byte 0xC000
	.2byte 0x0040

	.align 2
gSpriteAffineAnim_81F953C:: @ 81F953C
	obj_rot_scal_anim_frame 0x80, 0x80, 0, 0
	obj_rot_scal_anim_end

	.align 2
gSpriteAffineAnim_81F954C:: @ 81F954C
	obj_rot_scal_anim_frame 0x80, 0x80, 0, 0
	obj_rot_scal_anim_frame 0x18, 0x18, 0, -128
	obj_rot_scal_anim_frame 0x18, 0x18, 0, -128
	obj_rot_scal_anim_end

	.align 2
gSpriteAffineAnimTable_81F956C:: @ 81F956C
	.4byte gSpriteAffineAnim_81F953C
	.4byte gSpriteAffineAnim_81F954C

	.align 2
gSpriteTemplate_81F9574:: @ 81F9574
	spr_template 10000, 10000, gOamData_81F952C, gDummySpriteAnimTable, NULL, gSpriteAffineAnimTable_81F956C, nullsub_36

	.align 2
gSpriteTemplate_81F958C:: @ 81F958C
	spr_template 10000, 10000, gOamData_81F9534, gDummySpriteAnimTable, NULL, gSpriteAffineAnimTable_81F956C, nullsub_36

	.align 2
gUnknown_081F95A4:: @ 81F95A4
	obj_tiles gUnknown_08E5DC2C, 4096, 0x2710

	.align 2
gBattleTerrainTable:: @ 81F95AC
	@ tall_grass
	.4byte gBattleTerrainTiles_TallGrass
	.4byte gBattleTerrainTilemap_TallGrass
	.4byte gBattleTerrainAnimTiles_TallGrass
	.4byte gBattleTerrainAnimTilemap_TallGrass
	.4byte gBattleTerrainPalette_TallGrass

	@ long_grass
	.4byte gBattleTerrainTiles_LongGrass
	.4byte gBattleTerrainTilemap_LongGrass
	.4byte gBattleTerrainAnimTiles_LongGrass
	.4byte gBattleTerrainAnimTilemap_LongGrass
	.4byte gBattleTerrainPalette_LongGrass

	@ sand
	.4byte gBattleTerrainTiles_Sand
	.4byte gBattleTerrainTilemap_Sand
	.4byte gBattleTerrainAnimTiles_Sand
	.4byte gBattleTerrainAnimTilemap_Sand
	.4byte gBattleTerrainPalette_Sand

	@ underwater
	.4byte gBattleTerrainTiles_Underwater
	.4byte gBattleTerrainTilemap_Underwater
	.4byte gBattleTerrainAnimTiles_Underwater
	.4byte gBattleTerrainAnimTilemap_Underwater
	.4byte gBattleTerrainPalette_Underwater

	@ water
	.4byte gBattleTerrainTiles_Water
	.4byte gBattleTerrainTilemap_Water
	.4byte gBattleTerrainAnimTiles_Water
	.4byte gBattleTerrainAnimTilemap_Water
	.4byte gBattleTerrainPalette_Water

	@ pond_water
	.4byte gBattleTerrainTiles_PondWater
	.4byte gBattleTerrainTilemap_PondWater
	.4byte gBattleTerrainAnimTiles_PondWater
	.4byte gBattleTerrainAnimTilemap_PondWater
	.4byte gBattleTerrainPalette_PondWater

	@ rock
	.4byte gBattleTerrainTiles_Rock
	.4byte gBattleTerrainTilemap_Rock
	.4byte gBattleTerrainAnimTiles_Rock
	.4byte gBattleTerrainAnimTilemap_Rock
	.4byte gBattleTerrainPalette_Rock

	@ cave
	.4byte gBattleTerrainTiles_Cave
	.4byte gBattleTerrainTilemap_Cave
	.4byte gBattleTerrainAnimTiles_Cave
	.4byte gBattleTerrainAnimTilemap_Cave
	.4byte gBattleTerrainPalette_Cave

	@ building
	.4byte gBattleTerrainTiles_Building
	.4byte gBattleTerrainTilemap_Building
	.4byte gBattleTerrainAnimTiles_Building
	.4byte gBattleTerrainAnimTilemap_Building
	.4byte gBattleTerrainPalette_Building

	@ plain
	.4byte gBattleTerrainTiles_Building
	.4byte gBattleTerrainTilemap_Building
	.4byte gBattleTerrainAnimTiles_Building
	.4byte gBattleTerrainAnimTilemap_Building
	.4byte gBattleTerrainPalette_Plain

	.align 2
gUnknown_081F9674:: @ 81F9674
	.4byte REG_BG3HOFS
	.4byte ((DMA_ENABLE | DMA_START_HBLANK | DMA_REPEAT | DMA_DEST_RELOAD) << 16) | 1
	.4byte 1

	.align 2
gUnknown_081F9680:: @ 81F9680
	.4byte gUnknown_030041D0
	.2byte 0x20
	.byte 0x13
	.byte 0x10
	.4byte BG_VRAM + 0xE104

	.4byte gUnknown_03004250
	.2byte 0x40
	.byte 0x13
	.byte 0x10
	.4byte BG_VRAM + 0xF104

	.4byte gUnknown_030041D0
	.2byte 0x60
	.byte 0x13
	.byte 0x30
	.4byte BG_VRAM + 0xE204

	.4byte gUnknown_03004250
	.2byte 0x80
	.byte 0x13
	.byte 0x30
	.4byte BG_VRAM + 0xF204

	.4byte gUnknown_030041D0
	.2byte 0x20
	.byte 0x13
	.byte 0x18
	.4byte BG_VRAM + 0xE1C4

	.4byte gUnknown_03004250
	.2byte 0x40
	.byte 0x13
	.byte 0x18
	.4byte BG_VRAM + 0xF1C4

gUnknown_081F96C8:: @ 81F96C8
	.string "ヌケニン$" @ "Nukenin" (Shedinja)

	.align 2
gSpriteTemplate_81F96D0:: @ 81F96D0
	spr_template 0, 0, gDummyOamData, gDummySpriteAnimTable, NULL, gDummySpriteAffineAnimTable, sub_800F828

	.align 2
gOamData_81F96E8:: @ 81F96E8
	.2byte 0x0100
	.2byte 0xC000
	.2byte 0x0800

	.align 2
gOamData_81F96F0:: @ 81F96F0
	.2byte 0x0100
	.2byte 0xC000
	.2byte 0x2800

	.align 2
gSpriteAnim_81F96F8:: @ 81F96F8
	obj_image_anim_frame 0, 5
	obj_image_anim_jump 0

	.align 2
gSpriteAnimTable_81F9700:: @ 81F9700
	.4byte gSpriteAnim_81F96F8

	.align 2
gSpriteAffineAnim_81F9704:: @ 81F9704
	obj_rot_scal_anim_frame 0xFFF0, 0x0, 0, 4
	obj_rot_scal_anim_frame 0x0, 0x0, 0, 60
	obj_rot_scal_anim_jump 1

	.align 2
gSpriteAffineAnimTable_81F971C:: @ 81F971C
	.4byte gSpriteAffineAnim_81F9704

@ 81F9720
	.include "data/type_effectiveness.inc"

@ 81F9870
	.include "data/text/type_names.inc"

@ 81F98F0
	.include "data/trainer_money.inc"

@ 81F99CC
	.include "data/text/ability_descriptions.inc"

@ 81FA248
	.include "data/text/ability_names.inc"

	.align 2
gUnknown_081FA640:: @ 81FA640
	.4byte HandleAction_UseMove
	.4byte HandleAction_UseItem
	.4byte HandleAction_Switch
	.4byte HandleAction_Run
	.4byte HandleAction_WatchesCarefully
	.4byte HandleAction_SafariZoneBallThrow
	.4byte HandleAction_ThrowPokeblock
	.4byte HandleAction_GoNear
	.4byte HandleAction_SafriZoneRun
	.4byte HandleAction_Action9
	.4byte sub_801B594
	.4byte HandleAction_Action11
	.4byte HandleAction_ActionFinished
	.4byte HandleAction_NothingIsFainted

	.align 2
gUnknown_081FA678:: @ 81FA678
	.4byte bc_8013B1C
	.4byte HandleEndTurn_BattleWon
	.4byte HandleEndTurn_BattleLost
	.4byte HandleEndTurn_BattleLost
	.4byte HandleEndTurn_RanFromBattle
	.4byte HandleEndTurn_FinishBattle
	.4byte HandleEndTurn_MonFled
	.4byte HandleEndTurn_FinishBattle
	.4byte HandleEndTurn_FinishBattle

gStatusConditionString_PoisonJpn:: @ 81FA69C
	.string "どく$$$$$$"

gStatusConditionString_SleepJpn:: @ 81FA6A4
	.string "ねむり$$$$$"

gStatusConditionString_ParalysisJpn:: @ 81FA6AC
	.string "まひ$$$$$$"

gStatusConditionString_BurnJpn:: @ 81FA6B4
	.string "やけど$$$$$"

gStatusConditionString_IceJpn:: @ 81FA6BC
	.string "こおり$$$$$"

gStatusConditionString_ConfusionJpn:: @ 81FA6C4
	.string "こんらん$$$$"

gStatusConditionString_LoveJpn:: @ 81FA6CC
	.string "メロメロ$$$$"

	.align 2
gUnknown_081FA6D4:: @ 81FA6D4
	.4byte gStatusConditionString_PoisonJpn, BattleText_PoisonStatus
	.4byte gStatusConditionString_SleepJpn, BattleText_Sleep
	.4byte gStatusConditionString_ParalysisJpn, BattleText_Paralysis
	.4byte gStatusConditionString_BurnJpn, BattleText_Burn
	.4byte gStatusConditionString_IceJpn, BattleText_IceStatus
	.4byte gStatusConditionString_ConfusionJpn, BattleText_Confusion
	.4byte gStatusConditionString_LoveJpn, BattleText_Love

gUnknown_081FA70C:: @ 81FA70C
	.byte 0, 0, 0
	.byte 3, 5, 0
	.byte 2, 3, 0
	.byte 1, 2, 0
	.byte 1, 1, 0

gUnknown_081FA71B:: @ 81FA71B
	.byte 4, 3, 2, 1

gUnknown_081FA71F:: @ 81FA71F
	.byte 4, 4, 4, 4

	.align 1
gSoundMovesTable:: @ 81FA724
	.2byte   0x2D
	.2byte   0x2E
	.2byte   0x2F
	.2byte   0x30
	.2byte   0x67
	.2byte   0xAD
	.2byte   0xFD
	.2byte  0x13F
	.2byte  0x140
	.2byte  0x130
	.2byte 0xFFFF
