#include "global.h"
#include "battle.h"
#include "link.h"
#include "text.h"
#include "ewram.h"

extern u16 gBattleTypeFlags;
extern u8 gBattleOutcome;

extern struct Window gUnknown_03004210;

extern u8 BattleText_Win[];
extern u8 BattleText_Loss[];
extern u8 BattleText_Tie[];

#if ENGLISH
#define LEFT_MESSAGE_X 6
#define RIGHT_MESSAGE_X 21
#define TILE_OFFSET_LOSS 168
#elif GERMAN
#define LEFT_MESSAGE_X 5
#define RIGHT_MESSAGE_X 20
#define TILE_OFFSET_LOSS 172
#endif
#define TILE_OFFSET_WIN 160
#define CENTER_MESSAGE_X 13
#define MESSAGE_Y 2

#define PRINT_MESSAGE(text, tileDataStartOffset, x)                             \
{                                                                               \
    Text_InitWindow(&gUnknown_03004210, text, tileDataStartOffset, x, MESSAGE_Y);    \
    Text_PrintWindow8002F44(&gUnknown_03004210);                                            \
}

#define PRINT_MESSAGE_LEFT(text, tileDataStartOffset)       PRINT_MESSAGE(text, tileDataStartOffset, LEFT_MESSAGE_X)
#define PRINT_MESSAGE_RIGHT(text, tileDataStartOffset)      PRINT_MESSAGE(text, tileDataStartOffset, RIGHT_MESSAGE_X)

void PrintLinkBattleWinLossTie(void)
{

    if (gBattleOutcome == 3)
    {
        PRINT_MESSAGE(BattleText_Tie, TILE_OFFSET_WIN, CENTER_MESSAGE_X);
        return;
    }

    if (gBattleTypeFlags & BATTLE_TYPE_MULTI)
    {
        // Double battle?

        if (gBattleOutcome == 1)
        {

            // lp_field_18 = player position?
            switch (gLinkPlayers[gBattleStruct->linkPlayerIndex].lp_field_18)
            {
            case 0:
            case 2:
                PRINT_MESSAGE_LEFT(BattleText_Win, TILE_OFFSET_WIN);
                PRINT_MESSAGE_RIGHT(BattleText_Loss, TILE_OFFSET_LOSS);
                return;

            case 1:
            case 3:
                PRINT_MESSAGE_RIGHT(BattleText_Win, TILE_OFFSET_WIN)
                PRINT_MESSAGE_LEFT(BattleText_Loss, TILE_OFFSET_LOSS)
                return;
            }
        }
        else
        {

            switch (gLinkPlayers[gBattleStruct->linkPlayerIndex].lp_field_18)
            {
            case 1:
            case 3:
                PRINT_MESSAGE_LEFT(BattleText_Win, TILE_OFFSET_WIN);
                PRINT_MESSAGE_RIGHT(BattleText_Loss, TILE_OFFSET_LOSS);
                return;

            case 0:
            case 2:
                PRINT_MESSAGE_RIGHT(BattleText_Win, TILE_OFFSET_WIN);
                PRINT_MESSAGE_LEFT(BattleText_Loss, TILE_OFFSET_LOSS);
                return;
            }
        }

        return;
    }


    if (gBattleOutcome == 1)
    {
        if (gLinkPlayers[gBattleStruct->linkPlayerIndex].lp_field_18 != 0)
        {
            PRINT_MESSAGE_RIGHT(BattleText_Win, TILE_OFFSET_WIN);
            PRINT_MESSAGE_LEFT(BattleText_Loss, TILE_OFFSET_LOSS);
        }
        else
        {
            PRINT_MESSAGE_LEFT(BattleText_Win, TILE_OFFSET_WIN);
            PRINT_MESSAGE_RIGHT(BattleText_Loss, TILE_OFFSET_LOSS);
        }
    }
    else
    {
        if (gLinkPlayers[gBattleStruct->linkPlayerIndex].lp_field_18 != 0)
        {
            PRINT_MESSAGE_LEFT(BattleText_Win, TILE_OFFSET_WIN);
            PRINT_MESSAGE_RIGHT(BattleText_Loss, TILE_OFFSET_LOSS);
        }
        else
        {
            PRINT_MESSAGE_RIGHT(BattleText_Win, TILE_OFFSET_WIN);
            PRINT_MESSAGE_LEFT(BattleText_Loss, TILE_OFFSET_LOSS);
        }
    }
}


#include "global.h"
#include "decompress.h"
#include "palette.h"
#include "battle.h"
#include "text.h"
#include "trig.h"
#include "sound.h"
#include "constants/songs.h"
#include "task.h"
#include "link.h"


#define gBattle gBattleStruct

extern const u8 gGameVersion;
extern u8 gUnknown_08D00000[];
extern u16 gUnknown_08D00524[];
extern u16 gUnknown_08D004E0[];
extern u16 gBattleTypeFlags;
extern struct Trainer gTrainers[];
extern u16 gTrainerBattleOpponent;

extern void *gBattleTerrainTable[][5];
extern u8 gBattleTerrain;

extern u8 gBattleTerrainTiles_Cave[];
extern u8 gBattleTerrainTiles_Water[];
extern u8 gBattleTerrainTiles_Building[];
extern u8 gBattleTerrainTiles_Stadium[];

extern u16 gBattleTerrainTilemap_Cave[];
extern u16 gBattleTerrainTilemap_Water[];
extern u16 gBattleTerrainTilemap_Building[];
extern u16 gBattleTerrainTilemap_Stadium[];

extern u16 gBattleTerrainPalette_Groudon[];
extern u16 gBattleTerrainPalette_Kyogre[];
extern u16 gBattleTerrainPalette_BuildingLeader[];
extern u16 gBattleTerrainPalette_StadiumSteven[];
extern u16 gBattleTerrainPalette_BuildingGym[];
extern u16 gBattleTerrainPalette_StadiumMagma[];
extern u16 gBattleTerrainPalette_StadiumAqua[];
extern u16 gBattleTerrainPalette_StadiumSidney[];
extern u16 gBattleTerrainPalette_StadiumPhoebe[];
extern u16 gBattleTerrainPalette_StadiumGlacia[];
extern u16 gBattleTerrainPalette_StadiumDrake[];
extern u16 gBattleTerrainPalette_BattleTower[];

extern u8 gBattleTerrainAnimTiles_Building[];
extern u16 gBattleTerrainAnimTilemap_Building[];
extern u8 gBattleTerrainAnimTiles_Cave[];
extern u16 gBattleTerrainAnimTilemap_Cave[];
extern u8 gBattleTerrainAnimTiles_Underwater[];
extern u16 gBattleTerrainAnimTilemap_Underwater[];
extern u8 gVersusFrameGfx[];
extern u16 gVersusFrameTilemap[];
extern u8 gUnknown_08E5DC2C[];
extern u16 gVersusFramePal[];

extern u16 gBattle_BG1_Y;
extern u16 gBattle_BG2_Y;
extern struct CompressedSpriteSheet gUnknown_081F95A4;

extern u8 sav1_map_get_battletype(void);
extern void sub_800D74C(void);

struct Struct_081F9680 {
	struct Window *window;
	u16 offset;
	u8 left;
	u8 top;
	u8 *field_8;
};

extern const struct Struct_081F9680 gUnknown_081F9680[];
extern void PrintLinkBattleWinLossTie(void);
extern void sub_800DAF8(u8, u8, u8 *);

extern struct SpriteTemplate gSpriteTemplate_81F9574;
extern struct SpriteTemplate gSpriteTemplate_81F958C;

extern u16 gBattle_BG1_X;
extern u16 gBattle_BG2_X;


void sub_800DE30(u8 taskId)
{
	int palette;
	int i;

	switch (gTasks[taskId].data[0]) {

	case 0:
		if (gBattleTypeFlags & BATTLE_TYPE_MULTI) {
			for (i = 0; i < 4; i++) {
				u8 sp8 = (gLinkPlayers[i].lp_field_18 & 3);
				Text_InitWindow8002E4C(
					gUnknown_081F9680[sp8].window,
					gLinkPlayers[i].name,
					gUnknown_081F9680[sp8].offset,
					gUnknown_081F9680[sp8].left,
					gUnknown_081F9680[sp8].top,
					1);
				Text_PrintWindow8002F44(gUnknown_081F9680[sp8].window);
				sub_800DAF8(taskId, sp8, gUnknown_081F9680[sp8].field_8);
			}
		} else {
			u8 sp8 = 4;

			u8 r7 = gBattle->linkPlayerIndex;
			u8 r6 = gBattle->linkPlayerIndex ^ 1;
			if (gLinkPlayers[r7].lp_field_18) {
				r6 = gBattle->linkPlayerIndex;
				r7 = gBattle->linkPlayerIndex ^ 1;
			}

			Text_InitWindow8002E4C(
				gUnknown_081F9680[sp8].window,
				gLinkPlayers[r7].name,
				gUnknown_081F9680[sp8].offset,
				gUnknown_081F9680[sp8].left,
				gUnknown_081F9680[sp8].top,
				1);
			Text_PrintWindow8002F44(gUnknown_081F9680[sp8].window);
			sub_800DAF8(taskId, r7, gUnknown_081F9680[sp8].field_8);

			Text_InitWindow8002E4C(
				gUnknown_081F9680[sp8 + 1].window,
				gLinkPlayers[r6].name,
				gUnknown_081F9680[sp8 + 1].offset,
				gUnknown_081F9680[sp8 + 1].left,
				gUnknown_081F9680[sp8 + 1].top,
				1);
			Text_PrintWindow8002F44(gUnknown_081F9680[sp8 + 1].window);
			sub_800DAF8(taskId, r6, gUnknown_081F9680[sp8 + 1].field_8);
		}
		gTasks[taskId].data[0]++;
		break;

	case 1:
		palette = AllocSpritePalette(10000);
		gPlttBufferUnfaded[palette * 16 + 0x10f] = gPlttBufferFaded[palette * 16 + 0x10f] = 0x7fff;
		gBattle->unk1608A = CreateSprite(&gSpriteTemplate_81F9574, 108, 80, 0);
		gBattle->unk1608B = CreateSprite(&gSpriteTemplate_81F958C, 132, 80, 0);
		gSprites[gBattle->unk1608A].invisible = TRUE;
		gSprites[gBattle->unk1608B].invisible = TRUE;
		gTasks[taskId].data[0]++;
		break;

	case 2:
		if (gTasks[taskId].data[5]) {
			gBattle_BG1_X = (-20) - (Sin2(gTasks[taskId].data[1]) / 32);
			gBattle_BG2_X = (-140) - (Sin2(gTasks[taskId].data[2]) / 32);
			gBattle_BG1_Y = -36;
			gBattle_BG2_Y = -36;
		} else {
			gBattle_BG1_X = (-20) - (Sin2(gTasks[taskId].data[1]) / 32);
			gBattle_BG1_Y = (-164) + (Cos2(gTasks[taskId].data[1]) / 32);
			gBattle_BG2_X = (-140) - (Sin2(gTasks[taskId].data[2]) / 32);
			gBattle_BG2_Y = (-164) + (Cos2(gTasks[taskId].data[2]) / 32);
		}
		if (gTasks[taskId].data[2]) {
			gTasks[taskId].data[2] -= 2;
			gTasks[taskId].data[1] += 2;
		} else {
			if (gTasks[taskId].data[5]) {
				PrintLinkBattleWinLossTie();
			}
			PlaySE(SE_W231);
			DestroyTask(taskId);
			gSprites[gBattle->unk1608A].invisible = FALSE;
			gSprites[gBattle->unk1608B].invisible = FALSE;
			gSprites[gBattle->unk1608B].oam.tileNum += 0x40;
			gSprites[gBattle->unk1608A].data[0] = 0;
			gSprites[gBattle->unk1608B].data[0] = 1;
			gSprites[gBattle->unk1608A].data[1] = gSprites[gBattle->unk1608A].pos1.x;
			gSprites[gBattle->unk1608B].data[1] = gSprites[gBattle->unk1608B].pos1.x;
			gSprites[gBattle->unk1608A].data[2] = 0;
			gSprites[gBattle->unk1608B].data[2] = 0;
		}
		break;
	}
}


void sub_800E23C(void) {
	if (gBattleTypeFlags & BATTLE_TYPE_LINK) {
		LZDecompressVram(gVersusFrameGfx, (void *)0x6004000);
		LZDecompressVram(gVersusFrameTilemap, (void *)0x600e000);
		LZDecompressVram(gVersusFrameTilemap, (void *)0x600f000);
		LZDecompressVram(gUnknown_08E5DC2C, (void *)0x6010000);
		LoadCompressedPalette(gVersusFramePal, 0x60, 0x20);
		REG_BG1CNT = 0x5c04;
		REG_WININ = 0x36;
		REG_WINOUT = 0x36;
		gBattle_BG1_Y = 0xff5c;
		gBattle_BG2_Y = 0xff5c;
		LoadCompressedObjectPic(&gUnknown_081F95A4);
		return;
	} else if (gBattleTypeFlags & (BATTLE_TYPE_EREADER_TRAINER | BATTLE_TYPE_BATTLE_TOWER | BATTLE_TYPE_LINK)) {
		LZDecompressVram(gBattleTerrainAnimTiles_Building, (void *)0x6004000);
		LZDecompressVram(gBattleTerrainAnimTilemap_Building, (void *)0x600e000);
		return;
	} else if (gBattleTypeFlags & BATTLE_TYPE_KYOGRE_GROUDON) {
		if (gGameVersion == VERSION_RUBY) {
			LZDecompressVram(gBattleTerrainAnimTiles_Cave, (void *)0x6004000);
			LZDecompressVram(gBattleTerrainAnimTilemap_Cave, (void *)0x600e000);
			return;
		} else {
			LZDecompressVram(gBattleTerrainAnimTiles_Underwater, (void *)0x6004000);
			LZDecompressVram(gBattleTerrainAnimTilemap_Underwater, (void *)0x600e000);
			return;
		}
	} else if (gBattleTypeFlags & BATTLE_TYPE_TRAINER) {
		if (gTrainers[gTrainerBattleOpponent].trainerClass == 0x19) {
			LZDecompressVram(gBattleTerrainAnimTiles_Building, (void *)0x6004000);
			LZDecompressVram(gBattleTerrainAnimTilemap_Building, (void *)0x600e000);
			return;
		} else if (gTrainers[gTrainerBattleOpponent].trainerClass == 0x20) {
			LZDecompressVram(gBattleTerrainAnimTiles_Building, (void *)0x6004000);
			LZDecompressVram(gBattleTerrainAnimTilemap_Building, (void *)0x600e000);
			return;
		}
	}
	if (sav1_map_get_battletype() == 0) {
		LZDecompressVram(gBattleTerrainTable[gBattleTerrain][2], (void *)0x6004000);
		LZDecompressVram(gBattleTerrainTable[gBattleTerrain][3], (void *)0x600e000);
		return;
	}
	LZDecompressVram(gBattleTerrainAnimTiles_Building, (void *)0x6004000);
	LZDecompressVram(gBattleTerrainAnimTilemap_Building, (void *)0x600e000);
}

int sub_800E414(u8 a1) {
	int ret = 0;
	switch (a1) {
	case 0:
		LZDecompressVram(&gUnknown_08D00000, (void *)0x6000000);
		break;
	case 1:
		CpuCopy16(gUnknown_08D00524, (void *)0x600c000, 0x1000);
		break;
	case 2:
		LoadCompressedPalette(gUnknown_08D004E0, 0, 0x40);
		break;
	case 3: // tiles
		if (!(gBattleTypeFlags & (BATTLE_TYPE_EREADER_TRAINER | BATTLE_TYPE_BATTLE_TOWER | BATTLE_TYPE_LINK))) {
			if (gBattleTypeFlags & BATTLE_TYPE_KYOGRE_GROUDON) {
				if (gGameVersion == VERSION_RUBY) {
					LZDecompressVram(gBattleTerrainTiles_Cave, (void *)0x6008000);
					break;
				} else {
					LZDecompressVram(gBattleTerrainTiles_Water, (void *)0x6008000);
					break;
				}
			} else {
				if (gBattleTypeFlags & BATTLE_TYPE_TRAINER) {
					if (gTrainers[gTrainerBattleOpponent].trainerClass == 0x19) {
						LZDecompressVram(gBattleTerrainTiles_Building, (void *)0x6008000);
						break;
					} else if (gTrainers[gTrainerBattleOpponent].trainerClass == 0x20) {
						LZDecompressVram(gBattleTerrainTiles_Stadium, (void *)0x6008000);
						break;
					}
				}
				switch (sav1_map_get_battletype()) {
				case 0:
					LZDecompressVram(gBattleTerrainTable[gBattleTerrain][0], (void *)0x6008000);
					break;
				case 2:
					LZDecompressVram(gBattleTerrainTiles_Stadium, (void *)0x6008000);
					break;
				case 3:
					LZDecompressVram(gBattleTerrainTiles_Stadium, (void *)0x6008000);
					break;
				case 4:
					LZDecompressVram(gBattleTerrainTiles_Stadium, (void *)0x6008000);
					break;
				case 5:
					LZDecompressVram(gBattleTerrainTiles_Stadium, (void *)0x6008000);
					break;
				case 6:
					LZDecompressVram(gBattleTerrainTiles_Stadium, (void *)0x6008000);
					break;
				case 7:
					LZDecompressVram(gBattleTerrainTiles_Stadium, (void *)0x6008000);
					break;
				case 1:
				case 8:
					LZDecompressVram(gBattleTerrainTiles_Building, (void *)0x6008000);
					break;
				}
				break;
			}
		} else {
			LZDecompressVram(gBattleTerrainTiles_Building, (void *)0x6008000);
			break;
		}
	case 4: // tilemap
		if (!(gBattleTypeFlags & (BATTLE_TYPE_EREADER_TRAINER | BATTLE_TYPE_BATTLE_TOWER | BATTLE_TYPE_LINK))) {
			if (gBattleTypeFlags & BATTLE_TYPE_KYOGRE_GROUDON) {
				if (gGameVersion == 2) {
					LZDecompressVram(gBattleTerrainTilemap_Cave, (void *)0x600d000);
					break;
				} else {
					LZDecompressVram(gBattleTerrainTilemap_Water, (void *)0x600d000);
					break;
				}
			} else {
				if (gBattleTypeFlags & BATTLE_TYPE_TRAINER) {
					if (gTrainers[gTrainerBattleOpponent].trainerClass == 0x19) {
						LZDecompressVram(gBattleTerrainTilemap_Building, (void *)0x600d000);
						break;
					} else if (gTrainers[gTrainerBattleOpponent].trainerClass == 0x20) {
						LZDecompressVram(gBattleTerrainTilemap_Stadium, (void *)0x600d000);
						break;
					}
				}
				switch (sav1_map_get_battletype()) {
				case 0:
					LZDecompressVram(gBattleTerrainTable[gBattleTerrain][1], (void *)0x600d000);
					break;
				case 2:
					LZDecompressVram(gBattleTerrainTilemap_Stadium, (void *)0x600d000);
					break;
				case 3:
					LZDecompressVram(gBattleTerrainTilemap_Stadium, (void *)0x600d000);
					break;
				case 4:
					LZDecompressVram(gBattleTerrainTilemap_Stadium, (void *)0x600d000);
					break;
				case 5:
					LZDecompressVram(gBattleTerrainTilemap_Stadium, (void *)0x600d000);
					break;
				case 6:
					LZDecompressVram(gBattleTerrainTilemap_Stadium, (void *)0x600d000);
					break;
				case 7:
					LZDecompressVram(gBattleTerrainTilemap_Stadium, (void *)0x600d000);
					break;
				case 1:
				case 8:
					LZDecompressVram(gBattleTerrainTilemap_Building, (void *)0x600d000);
					break;
				}
				break;
			}
		} else {
			LZDecompressVram(gBattleTerrainTilemap_Building, (void *)0x600d000);
			break;
		}
	case 5: // palette
		if (!(gBattleTypeFlags & (BATTLE_TYPE_EREADER_TRAINER | BATTLE_TYPE_BATTLE_TOWER | BATTLE_TYPE_LINK))) {
			if (gBattleTypeFlags & BATTLE_TYPE_KYOGRE_GROUDON) {
				if (gGameVersion == 2) {
					LoadCompressedPalette(gBattleTerrainPalette_Groudon, 0x20, 0x60);
					break;
				} else {
					LoadCompressedPalette(gBattleTerrainPalette_Kyogre, 0x20, 0x60);
					break;
				}
			} else {
				if (gBattleTypeFlags & BATTLE_TYPE_TRAINER) {
					if (gTrainers[gTrainerBattleOpponent].trainerClass == 0x19) {
						LoadCompressedPalette(gBattleTerrainPalette_BuildingLeader, 0x20, 0x60);
						break;
					} else if (gTrainers[gTrainerBattleOpponent].trainerClass == 0x20) {
						LoadCompressedPalette(gBattleTerrainPalette_StadiumSteven, 0x20, 0x60);
						break;
					}
				}
				switch (sav1_map_get_battletype()) {
				case 0:
					LoadCompressedPalette(gBattleTerrainTable[gBattleTerrain][4], 0x20, 0x60);
					break;
				case 1:
					LoadCompressedPalette(gBattleTerrainPalette_BuildingGym, 0x20, 0x60);
					break;
				case 2:
					LoadCompressedPalette(gBattleTerrainPalette_StadiumMagma, 0x20, 0x60);
					break;
				case 3:
					LoadCompressedPalette(gBattleTerrainPalette_StadiumAqua, 0x20, 0x60);
					break;
				case 4:
					LoadCompressedPalette(gBattleTerrainPalette_StadiumSidney, 0x20, 0x60);
					break;
				case 5:
					LoadCompressedPalette(gBattleTerrainPalette_StadiumPhoebe, 0x20, 0x60);
					break;
				case 6:
					LoadCompressedPalette(gBattleTerrainPalette_StadiumGlacia, 0x20, 0x60);
					break;
				case 7:
					LoadCompressedPalette(gBattleTerrainPalette_StadiumDrake, 0x20, 0x60);
					break;
				case 8:
					LoadCompressedPalette(gBattleTerrainPalette_BattleTower, 0x20, 0x60);
					break;
				}
				break;
			}
		} else {
			LoadCompressedPalette(gBattleTerrainPalette_BattleTower, 0x20, 0x60);
			break;
		}
	case 6:
		sub_800D74C();
		break;
	default:
		ret = 1;
	}
	return ret;
}
