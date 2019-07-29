#include "global.h"
#include "battle.h"
#include "decompress.h"
#include "ewram.h"
#include "graphics.h"
#include "link.h"
#include "main.h"
#include "palette.h"
#include "task.h"
#include "text.h"
#include "text_window.h"
#include "trainer.h"
#include "trig.h"
#include "sound.h"
#include "constants/map_types.h"
#include "constants/songs.h"


extern u16 gBattleTypeFlags;
extern u8 gBattleOutcome;

extern struct Window gUnknown_03004210;

extern u8 BattleText_Win[];
extern u8 BattleText_Loss[];
extern u8 BattleText_Tie[];

extern void sub_8032A38(void);

#define GetCurrentMapBattleScene sav1_map_get_battletype
//extern u8 GetCurrentMapBattleScene(void);

extern const u8 gGameVersion;
extern u16 gBattleTypeFlags;
extern struct Trainer gTrainers[];
extern u16 gTrainerBattleOpponent;

extern u8 gBattleTerrain;

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

extern u8 gVersusFrameGfx[];
extern u16 gVersusFrameTilemap[];
extern u16 gVersusFramePal[];

extern u16 gBattle_BG1_X;
extern u16 gBattle_BG1_Y;
extern u16 gBattle_BG2_X;
extern u16 gBattle_BG2_Y;

extern u8 sav1_map_get_battletype(void);

struct LinkResultWindow {
    struct Window *window;
    u16 offset;
    u8 left;
    u8 top;
    u8 *dest;
};

#define gLinkResultWindows gUnknown_081F9680
extern const struct LinkResultWindow gLinkResultWindows[];

extern struct SpriteTemplate gSpriteTemplate_81F96D0;

const struct OamData gOamData_81F952C = {
    .affineMode = ST_OAM_AFFINE_DOUBLE,
    .size = 3
};

const struct OamData gOamData_81F9534 = {
    .affineMode = ST_OAM_AFFINE_DOUBLE,
    .size = 3,
    .tileNum = 64
};

const union AffineAnimCmd gSpriteAffineAnim_81F953C[] = {
    AFFINEANIMCMD_FRAME(0x80, 0x80, 0, 0),
    AFFINEANIMCMD_END
};

const union AffineAnimCmd gSpriteAffineAnim_81F954C[] = {
    AFFINEANIMCMD_FRAME(0x80, 0x80, 0, 0),
    AFFINEANIMCMD_FRAME(0x18, 0x18, 0, -128),
    AFFINEANIMCMD_FRAME(0x18, 0x18, 0, -128),
    AFFINEANIMCMD_END
};

const union AffineAnimCmd *const gSpriteAffineAnimTable_81F956C[] = {
    gSpriteAffineAnim_81F953C,
    gSpriteAffineAnim_81F954C
};

const struct SpriteTemplate gSpriteTemplate_81F9574 = {
    .tileTag = 10000,
    .paletteTag = 10000,
    .oam = &gOamData_81F952C,
    .anims = gDummySpriteAnimTable,
    .images = NULL,
    .affineAnims = gSpriteAffineAnimTable_81F956C,
    .callback = nullsub_36
};

const struct SpriteTemplate gSpriteTemplate_81F958C = {
    .tileTag = 10000,
    .paletteTag = 10000,
    .oam = &gOamData_81F9534,
    .anims = gDummySpriteAnimTable,
    .images = NULL,
    .affineAnims = gSpriteAffineAnimTable_81F956C,
    .callback = nullsub_36
};

extern const u8 gUnknown_08E5DC2C[];

const struct CompressedSpriteSheet gUnknown_081F95A4[] = {
    {gUnknown_08E5DC2C, 4096, 0x2710},
};

struct BattleBackground
{
    const void *tileset;
    const void *tilemap;
    const void *entryTileset;
    const void *entryTilemap;
    const void *palette;
};

const struct BattleBackground gBattleTerrainTable[] = {
{
    .tileset = gBattleTerrainTiles_TallGrass,
    .tilemap = gBattleTerrainTilemap_TallGrass,
    .entryTileset = gBattleTerrainAnimTiles_TallGrass,
    .entryTilemap = gBattleTerrainAnimTilemap_TallGrass,
    .palette = gBattleTerrainPalette_TallGrass
},
{
    .tileset = gBattleTerrainTiles_LongGrass,
    .tilemap = gBattleTerrainTilemap_LongGrass,
    .entryTileset = gBattleTerrainAnimTiles_LongGrass,
    .entryTilemap = gBattleTerrainAnimTilemap_LongGrass,
    .palette = gBattleTerrainPalette_LongGrass
},
{
    .tileset = gBattleTerrainTiles_Sand,
    .tilemap = gBattleTerrainTilemap_Sand,
    .entryTileset = gBattleTerrainAnimTiles_Sand,
    .entryTilemap = gBattleTerrainAnimTilemap_Sand,
    .palette = gBattleTerrainPalette_Sand
},
{
    .tileset = gBattleTerrainTiles_Underwater,
    .tilemap = gBattleTerrainTilemap_Underwater,
    .entryTileset = gBattleTerrainAnimTiles_Underwater,
    .entryTilemap = gBattleTerrainAnimTilemap_Underwater,
    .palette = gBattleTerrainPalette_Underwater
},
{
    .tileset = gBattleTerrainTiles_Water,
    .tilemap = gBattleTerrainTilemap_Water,
    .entryTileset = gBattleTerrainAnimTiles_Water,
    .entryTilemap = gBattleTerrainAnimTilemap_Water,
    .palette = gBattleTerrainPalette_Water
},
{
    .tileset = gBattleTerrainTiles_PondWater,
    .tilemap = gBattleTerrainTilemap_PondWater,
    .entryTileset = gBattleTerrainAnimTiles_PondWater,
    .entryTilemap = gBattleTerrainAnimTilemap_PondWater,
    .palette = gBattleTerrainPalette_PondWater
},
{
    .tileset = gBattleTerrainTiles_Rock,
    .tilemap = gBattleTerrainTilemap_Rock,
    .entryTileset = gBattleTerrainAnimTiles_Rock,
    .entryTilemap = gBattleTerrainAnimTilemap_Rock,
    .palette = gBattleTerrainPalette_Rock
},
{
    .tileset = gBattleTerrainTiles_Cave,
    .tilemap = gBattleTerrainTilemap_Cave,
    .entryTileset = gBattleTerrainAnimTiles_Cave,
    .entryTilemap = gBattleTerrainAnimTilemap_Cave,
    .palette = gBattleTerrainPalette_Cave
},
{
    .tileset = gBattleTerrainTiles_Building,
    .tilemap = gBattleTerrainTilemap_Building,
    .entryTileset = gBattleTerrainAnimTiles_Building,
    .entryTilemap = gBattleTerrainAnimTilemap_Building,
    .palette = gBattleTerrainPalette_Building
},
{
    .tileset = gBattleTerrainTiles_Building,
    .tilemap = gBattleTerrainTilemap_Building,
    .entryTileset = gBattleTerrainAnimTiles_Building,
    .entryTilemap = gBattleTerrainAnimTilemap_Building,
    .palette = gBattleTerrainPalette_Plain
    }
};

static void sub_800D6C4(void);

void debug_sub_800D684(void)
{
    u8 spriteId;
    ResetSpriteData();
    spriteId = CreateSprite(&gSpriteTemplate_81F96D0, 0, 0, 0);
    gSprites[spriteId].invisible = TRUE;
    SetMainCallback2(sub_800D6C4);
}

static void sub_800D6C4(void)
{
    AnimateSprites();
    BuildOamBuffer();
}

void sub_800D6D4(void)
{
    u16 ime = REG_IME;
    REG_IME = 0;
    REG_IE |= INTR_FLAG_VBLANK;
    REG_IME = ime;
    REG_DISPSTAT = DISPSTAT_VBLANK_INTR;
    REG_BG0CNT = 0x9800;
    REG_BG1CNT = 0x9c04;
    REG_BG2CNT = 0x5e05;
    REG_BG3CNT = 0x5a0b;
    REG_BLDCNT = 0;
    REG_BLDALPHA = 0;
    REG_BLDY = 0;
    REG_DISPCNT = 0xbf40;
}

void ApplyPlayerChosenFrameToBattleMenu(void)
{
    TextWindow_SetBaseTileNum(0x12);
    TextWindow_LoadStdFrameGraphicsOverridePal(&gUnknown_03004210, 1);
    TextWindow_SetBaseTileNum(0x22);
    TextWindow_LoadStdFrameGraphicsOverridePal(&gUnknown_03004210, 1);
    gPlttBufferUnfaded[92] = 0x7fe0;
    gPlttBufferUnfaded[93] = 0x2529;
    gPlttBufferUnfaded[94] = 0x7fff;
    gPlttBufferUnfaded[95] = 0x675a;
    CpuSet(&gPlttBufferUnfaded[92], &gPlttBufferFaded[92], 4);
    sub_8032A38();
}

void DrawMainBattleBackground(void)
{
    if (gBattleTypeFlags & (BATTLE_TYPE_LINK | BATTLE_TYPE_BATTLE_TOWER | BATTLE_TYPE_EREADER_TRAINER /*| BATTLE_TYPE_x2000000*/))
    {
        LZDecompressVram(gBattleTerrainTiles_Building, (void*)(VRAM + 0x8000));
        LZDecompressVram(gBattleTerrainTilemap_Building, (void*)(VRAM + 0xD000));
        LoadCompressedPalette(gBattleTerrainPalette_BattleTower, 0x20, 0x60);
    }
    else if (gBattleTypeFlags & BATTLE_TYPE_KYOGRE_GROUDON)
    {
        if (gGameVersion == VERSION_RUBY)
        {
            LZDecompressVram(gBattleTerrainTiles_Cave, (void*)(VRAM + 0x8000));
            LZDecompressVram(gBattleTerrainTilemap_Cave, (void*)(VRAM + 0xD000));
            LoadCompressedPalette(gBattleTerrainPalette_Groudon, 0x20, 0x60);
        }
        else
        {
            LZDecompressVram(gBattleTerrainTiles_Water, (void*)(VRAM + 0x8000));
            LZDecompressVram(gBattleTerrainTilemap_Water, (void*)(VRAM + 0xD000));
            LoadCompressedPalette(gBattleTerrainPalette_Kyogre, 0x20, 0x60);
        }
    }
    else
    {
        if (gBattleTypeFlags & BATTLE_TYPE_TRAINER)
        {
            u8 trainerClass = gTrainers[gTrainerBattleOpponent].trainerClass;
            if (trainerClass == TRAINER_CLASS_LEADER)
            {
                LZDecompressVram(gBattleTerrainTiles_Building, (void*)(VRAM + 0x8000));
                LZDecompressVram(gBattleTerrainTilemap_Building, (void*)(VRAM + 0xD000));
                LoadCompressedPalette(gBattleTerrainPalette_BuildingLeader, 0x20, 0x60);
                return;
            }
            else if (trainerClass == TRAINER_CLASS_CHAMPION)
            {
                LZDecompressVram(gBattleTerrainTiles_Stadium, (void*)(VRAM + 0x8000));
                LZDecompressVram(gBattleTerrainTilemap_Stadium, (void*)(VRAM + 0xD000));
                LoadCompressedPalette(gBattleTerrainPalette_StadiumSteven, 0x20, 0x60);
                return;
            }
        }

        switch (GetCurrentMapBattleScene())
        {
        case MAP_BATTLE_SCENE_NORMAL:
            LZDecompressVram(gBattleTerrainTable[gBattleTerrain].tileset, (void*)(VRAM + 0x8000));
            LZDecompressVram(gBattleTerrainTable[gBattleTerrain].tilemap, (void*)(VRAM + 0xD000));
            LoadCompressedPalette(gBattleTerrainTable[gBattleTerrain].palette, 0x20, 0x60);
            break;
        case MAP_BATTLE_SCENE_GYM:
            LZDecompressVram(gBattleTerrainTiles_Building, (void*)(VRAM + 0x8000));
            LZDecompressVram(gBattleTerrainTilemap_Building, (void*)(VRAM + 0xD000));
            LoadCompressedPalette(gBattleTerrainPalette_BuildingGym, 0x20, 0x60);
            break;
        case MAP_BATTLE_SCENE_MAGMA:
            LZDecompressVram(gBattleTerrainTiles_Stadium, (void*)(VRAM + 0x8000));
            LZDecompressVram(gBattleTerrainTilemap_Stadium, (void*)(VRAM + 0xD000));
            LoadCompressedPalette(gBattleTerrainPalette_StadiumMagma, 0x20, 0x60);
            break;
        case MAP_BATTLE_SCENE_AQUA:
            LZDecompressVram(gBattleTerrainTiles_Stadium, (void*)(VRAM + 0x8000));
            LZDecompressVram(gBattleTerrainTilemap_Stadium, (void*)(VRAM + 0xD000));
            LoadCompressedPalette(gBattleTerrainPalette_StadiumAqua, 0x20, 0x60);
            break;
        case MAP_BATTLE_SCENE_SIDNEY:
            LZDecompressVram(gBattleTerrainTiles_Stadium, (void*)(VRAM + 0x8000));
            LZDecompressVram(gBattleTerrainTilemap_Stadium, (void*)(VRAM + 0xD000));
            LoadCompressedPalette(gBattleTerrainPalette_StadiumSidney, 0x20, 0x60);
            break;
        case MAP_BATTLE_SCENE_PHOEBE:
            LZDecompressVram(gBattleTerrainTiles_Stadium, (void*)(VRAM + 0x8000));
            LZDecompressVram(gBattleTerrainTilemap_Stadium, (void*)(VRAM + 0xD000));
            LoadCompressedPalette(gBattleTerrainPalette_StadiumPhoebe, 0x20, 0x60);
            break;
        case MAP_BATTLE_SCENE_GLACIA:
            LZDecompressVram(gBattleTerrainTiles_Stadium, (void*)(VRAM + 0x8000));
            LZDecompressVram(gBattleTerrainTilemap_Stadium, (void*)(VRAM + 0xD000));
            LoadCompressedPalette(gBattleTerrainPalette_StadiumGlacia, 0x20, 0x60);
            break;
        case MAP_BATTLE_SCENE_DRAKE:
            LZDecompressVram(gBattleTerrainTiles_Stadium, (void*)(VRAM + 0x8000));
            LZDecompressVram(gBattleTerrainTilemap_Stadium, (void*)(VRAM + 0xD000));
            LoadCompressedPalette(gBattleTerrainPalette_StadiumDrake, 0x20, 0x60);
            break;
        case MAP_BATTLE_SCENE_BATTLE_TOWER:
            LZDecompressVram(gBattleTerrainTiles_Building, (void*)(VRAM + 0x8000));
            LZDecompressVram(gBattleTerrainTilemap_Building, (void*)(VRAM + 0xD000));
            LoadCompressedPalette(gBattleTerrainPalette_BattleTower, 0x20, 0x60);
            break;
        }
    }
}

void LoadBattleTextboxAndBackground(void)
{
    LZDecompressVram(gBattleTextboxTiles, (void*)(BG_VRAM));
    CpuSet(gBattleTextboxTilemap, (void *)(VRAM + 0xC000), 0x800);
    LoadCompressedPalette(gBattleTextboxPalette, 0, 0x40);
    ApplyPlayerChosenFrameToBattleMenu();
    DrawMainBattleBackground();

    #if DEBUG
    if (gBattleTypeFlags & BATTLE_TYPE_LINK)
    {
        debug_sub_8008218((void*)(VRAM + 0x600), 0, (void*)(VRAM + 0xC000), 1);
        debug_sub_8008264(257, 3, 1, 3, 1);
        debug_sub_8008264(257, 3, 21, 3, 1);
        debug_sub_8008264(257, 3, 41, 3, 1);
    }
    #endif
}

static void sub_800DAF8(u8 taskId, u8 windowId, u8 *dest)
{
    int i;
    u16 r4 = 0;
    u16 src[6];

    if (gBattleTypeFlags & BATTLE_TYPE_MULTI) {
        if (gTasks[taskId].data[5]) {
            switch (windowId) {
            case 0:
                r4 = gTasks[taskId].data[3] & 0x3f;
                break;
            case 1:
                r4 = (gTasks[taskId].data[4] & 0xfc0) >> 6;
                break;
            case 2:
                r4 = (gTasks[taskId].data[3] & 0xfc0) >> 6;
                break;
            case 3:
                r4 = gTasks[taskId].data[4] & 0x3f;
                break;
            }
        } else {
            switch (windowId) {
            case 0:
                r4 = gTasks[taskId].data[3] & 0x3f;
                break;
            case 1:
                r4 = gTasks[taskId].data[4] & 0x3f;
                break;
            case 2:
                r4 = (gTasks[taskId].data[3] & 0xfc0) >> 6;
                break;
            case 3:
                r4 = (gTasks[taskId].data[4] & 0xfc0) >> 6;
                break;
            }
        }
        for (i = 0; i < 3; i++) {
            src[i] = ((r4 & (3 << (i * 2))) >> (i * 2)) + 0x6001;
        }
        CpuSet(src, dest, 3);
    } else {
        if (windowId == gBattleStruct->linkPlayerIndex) {
            r4 = gTasks[taskId].data[3];
        } else {
            r4 = gTasks[taskId].data[4];
        }
        for (i = 0; i < 6; i++) {
            src[i] = ((r4 & (3 << (i * 2))) >> (i * 2)) + 0x6001;
        }
        CpuSet(src, dest, 6);
    }
}


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

static void PrintLinkBattleWinLossTie(void)
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


void sub_800DE30(u8 taskId)
{
    u8 palette;
    int i;

    switch (gTasks[taskId].data[0]) {

    case 0:
        if (gBattleTypeFlags & BATTLE_TYPE_MULTI) {
            for (i = 0; i < 4; i++) {
                u8 windowId = (gLinkPlayers[i].lp_field_18 & 3);
                Text_InitWindow8002E4C(
                    gLinkResultWindows[windowId].window,
                    gLinkPlayers[i].name,
                    gLinkResultWindows[windowId].offset,
                    gLinkResultWindows[windowId].left,
                    gLinkResultWindows[windowId].top,
                    1);
                Text_PrintWindow8002F44(gLinkResultWindows[windowId].window);
                sub_800DAF8(taskId, windowId, gLinkResultWindows[windowId].dest);
            }
        } else {
            u8 windowId = 4;

            u8 playerId = gBattleStruct->linkPlayerIndex;
            u8 opponentId = gBattleStruct->linkPlayerIndex ^ 1;
            if (gLinkPlayers[playerId].lp_field_18) {
                opponentId = gBattleStruct->linkPlayerIndex;
                playerId = gBattleStruct->linkPlayerIndex ^ 1;
            }

            Text_InitWindow8002E4C(
                gLinkResultWindows[windowId].window,
                gLinkPlayers[playerId].name,
                gLinkResultWindows[windowId].offset,
                gLinkResultWindows[windowId].left,
                gLinkResultWindows[windowId].top,
                1);
            Text_PrintWindow8002F44(gLinkResultWindows[windowId].window);
            sub_800DAF8(taskId, playerId, gLinkResultWindows[windowId].dest);

            Text_InitWindow8002E4C(
                gLinkResultWindows[windowId + 1].window,
                gLinkPlayers[opponentId].name,
                gLinkResultWindows[windowId + 1].offset,
                gLinkResultWindows[windowId + 1].left,
                gLinkResultWindows[windowId + 1].top,
                1);
            Text_PrintWindow8002F44(gLinkResultWindows[windowId + 1].window);
            sub_800DAF8(taskId, opponentId, gLinkResultWindows[windowId + 1].dest);
        }
        gTasks[taskId].data[0]++;
        break;

    case 1:
        palette = AllocSpritePalette(10000);
        gPlttBufferUnfaded[palette * 16 + 0x10f] = gPlttBufferFaded[palette * 16 + 0x10f] = 0x7fff;
        gBattleStruct->unk1608A = CreateSprite(&gSpriteTemplate_81F9574, 108, 80, 0);
        gBattleStruct->unk1608B = CreateSprite(&gSpriteTemplate_81F958C, 132, 80, 0);
        gSprites[gBattleStruct->unk1608A].invisible = TRUE;
        gSprites[gBattleStruct->unk1608B].invisible = TRUE;
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
            gSprites[gBattleStruct->unk1608A].invisible = FALSE;
            gSprites[gBattleStruct->unk1608B].invisible = FALSE;
            gSprites[gBattleStruct->unk1608B].oam.tileNum += 0x40;
            gSprites[gBattleStruct->unk1608A].data[0] = 0;
            gSprites[gBattleStruct->unk1608B].data[0] = 1;
            gSprites[gBattleStruct->unk1608A].data[1] = gSprites[gBattleStruct->unk1608A].pos1.x;
            gSprites[gBattleStruct->unk1608B].data[1] = gSprites[gBattleStruct->unk1608B].pos1.x;
            gSprites[gBattleStruct->unk1608A].data[2] = 0;
            gSprites[gBattleStruct->unk1608B].data[2] = 0;
        }
        break;
    }
}

void LoadBattleEntryBackground(void) {
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
        LoadCompressedObjectPic(gUnknown_081F95A4);
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
        LZDecompressVram(gBattleTerrainTable[gBattleTerrain].entryTileset, (void *)0x6004000);
        LZDecompressVram(gBattleTerrainTable[gBattleTerrain].entryTilemap, (void *)0x600e000);
        return;
    }
    LZDecompressVram(gBattleTerrainAnimTiles_Building, (void *)0x6004000);
    LZDecompressVram(gBattleTerrainAnimTilemap_Building, (void *)0x600e000);
}

int LoadChosenBattleElement(u8 type) {
    int ret = 0;
    switch (type) {
    case 0:
        LZDecompressVram(&gBattleTextboxTiles, (void *)0x6000000);
        break;
    case 1:
        CpuCopy16(gBattleTextboxTilemap, (void *)0x600c000, 0x1000);
        break;
    case 2:
        LoadCompressedPalette(gBattleTextboxPalette, 0, 0x40);
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
                    LZDecompressVram(gBattleTerrainTable[gBattleTerrain].tileset, (void *)0x6008000);
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
                    LZDecompressVram(gBattleTerrainTable[gBattleTerrain].tilemap, (void *)0x600d000);
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
                    LoadCompressedPalette(gBattleTerrainTable[gBattleTerrain].palette, 0x20, 0x60);
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
        ApplyPlayerChosenFrameToBattleMenu();
        break;
    default:
        ret = 1;
    }
    return ret;
}
