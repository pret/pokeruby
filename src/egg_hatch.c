#include "global.h"
#include "data2.h"
#include "daycare.h"
#include "decompress.h"
#include "event_data.h"
#include "ewram.h"
#include "constants/items.h"
#include "main.h"
#include "menu.h"
#include "name_string_util.h"
#include "naming_screen.h"
#include "overworld.h"
#include "palette.h"
#include "pokemon.h"
#include "random.h"
#include "script.h"
#include "constants/songs.h"
#include "sound.h"
#include "string_util.h"
#include "strings2.h"
#include "task.h"
#include "text.h"
#include "text_window.h"
#include "trig.h"
#include "trade.h"

extern struct SpriteTemplate gUnknown_02024E8C;

struct EggHatchData
{
    u8 eggSpriteID;
    u8 pokeSpriteID;
    u8 CB2_state;
    u8 CB2_PalCounter;
    u8 eggPartyID;
    struct Window window;
    u8 tileDataStartOffset;
    u8 unused_39;
    u8 eggShardVelocityID;
};

struct EggHatchData* gEggHatchData;

extern const u32 gBattleTextboxTiles[];
extern const u32 gBattleTextboxTilemap[];
extern const u16 gBattleTextboxPalette[]; //palette
extern const struct SpriteSheet sUnknown_0820A3B0;
extern const struct SpriteSheet sUnknown_0820A3B8;
extern const struct SpritePalette sUnknown_0820A3C0;

bool8 GetSetPokedexFlag(u16 nationalNum, u8 caseID);
u8 sav1_map_get_name(void);
const struct CompressedSpritePalette* GetMonSpritePalStruct(struct Pokemon* mon); //gets pokemon palette address
void sub_8080990(void);

static void Task_EggHatch(u8 taskID);
static void CB2_EggHatch_0(void);
static void CB2_EggHatch_1(void);
static void SpriteCB_Egg_0(struct Sprite* sprite);
static void SpriteCB_Egg_1(struct Sprite* sprite);
static void SpriteCB_Egg_2(struct Sprite* sprite);
static void SpriteCB_Egg_3(struct Sprite* sprite);
static void SpriteCB_Egg_4(struct Sprite* sprite);
static void SpriteCB_Egg_5(struct Sprite* sprite);
static void SpriteCB_EggShard(struct Sprite* sprite);
static void EggHatchPrintMessage2(u8* src);
static void EggHatchPrintMessage1(u8* src);
static bool8 EggHatchUpdateWindowText(void);
static void CreateRandomEggShardSprite(void);
static void CreateEggShardSprite(u8 x, u8 y, s16 data1, s16 data2, s16 data3, u8 spriteAnimIndex);

// graphics

static const u16 sEggPalette[] = INCBIN_U16("graphics/pokemon/egg/palette.gbapal");
static const u8 sEggHatchTiles[] = INCBIN_U8("graphics/misc/egg_hatch.4bpp");
static const u8 sEggShardTiles[] = INCBIN_U8("graphics/misc/egg_shard.4bpp");

static const struct OamData sOamData_820A378 =
{
    .y = 0,
    .affineMode = 0,
    .objMode = 0,
    .mosaic = 0,
    .bpp = 0,
    .shape = 0,
    .x = 0,
    .matrixNum = 0,
    .size = 2,
    .tileNum = 0,
    .priority = 1,
    .paletteNum = 0,
    .affineParam = 0,
};

static const union AnimCmd sSpriteAnim_820A380[] =
{
    ANIMCMD_FRAME(0, 5),
    ANIMCMD_END
};

static const union AnimCmd sSpriteAnim_820A388[] =
{
    ANIMCMD_FRAME(16, 5),
    ANIMCMD_END
};

static const union AnimCmd sSpriteAnim_820A390[] =
{
    ANIMCMD_FRAME(32, 5),
    ANIMCMD_END
};

static const union AnimCmd sSpriteAnim_820A398[] =
{
    ANIMCMD_FRAME(48, 5),
    ANIMCMD_END
};

static const union AnimCmd *const sSpriteAnimTable_820A3A0[] =
{
    sSpriteAnim_820A380,
    sSpriteAnim_820A388,
    sSpriteAnim_820A390,
    sSpriteAnim_820A398,
};

static const struct SpriteSheet sUnknown_0820A3B0 =
{
    .data = sEggHatchTiles,
    .size = 2048,
    .tag = 12345,
};

static const struct SpriteSheet sUnknown_0820A3B8 =
{
    .data = sEggShardTiles,
    .size = 128,
    .tag = 23456,
};

static const struct SpritePalette sUnknown_0820A3C0 =
{
    .data = sEggPalette,
    .tag = 54321
};

static const struct SpriteTemplate sSpriteTemplate_820A3C8 =
{
    .tileTag = 12345,
    .paletteTag = 54321,
    .oam = &sOamData_820A378,
    .anims = sSpriteAnimTable_820A3A0,
    .images = NULL,
    .affineAnims = gDummySpriteAffineAnimTable,
    .callback = SpriteCallbackDummy
};


static const struct OamData sOamData_820A3E0 =
{
    .y = 0,
    .affineMode = 0,
    .objMode = 0,
    .mosaic = 0,
    .bpp = 0,
    .shape = 0,
    .x = 0,
    .matrixNum = 0,
    .size = 0,
    .tileNum = 0,
    .priority = 2,
    .paletteNum = 0,
    .affineParam = 0,
};

static const union AnimCmd sSpriteAnim_820A3E8[] =
{
    ANIMCMD_FRAME(0, 5),
    ANIMCMD_END
};

static const union AnimCmd sSpriteAnim_820A3F0[] =
{
    ANIMCMD_FRAME(1, 5),
    ANIMCMD_END
};

static const union AnimCmd sSpriteAnim_820A3F8[] =
{
    ANIMCMD_FRAME(2, 5),
    ANIMCMD_END
};

static const union AnimCmd sSpriteAnim_820A400[] =
{
    ANIMCMD_FRAME(3, 5),
    ANIMCMD_END
};

static const union AnimCmd *const sSpriteAnimTable_820A408[] =
{
    sSpriteAnim_820A3E8,
    sSpriteAnim_820A3F0,
    sSpriteAnim_820A3F8,
    sSpriteAnim_820A400,
};

static const struct SpriteTemplate sSpriteTemplate_820A418 =
{
    .tileTag = 23456,
    .paletteTag = 54321,
    .oam = &sOamData_820A3E0,
    .anims = sSpriteAnimTable_820A408,
    .images = NULL,
    .affineAnims = gDummySpriteAffineAnimTable,
    .callback = SpriteCB_EggShard
};

// actual code

static void CreatedHatchedMon(struct Pokemon *egg, struct Pokemon *temp)
{
    u16 species;
    u32 personality, pokerus;
    u8 i, friendship, language, gameMet, markings;
    u16 moves[4];
    u32 ivs[6];


    species = GetMonData(egg, MON_DATA_SPECIES);

    for (i = 0; i < 4; i++)
    {
        moves[i] = GetMonData(egg, MON_DATA_MOVE1 + i);
    }

    personality = GetMonData(egg, MON_DATA_PERSONALITY);

    for (i = 0; i < 6; i++)
    {
        ivs[i] = GetMonData(egg, MON_DATA_HP_IV + i);
    }

    gameMet = GetMonData(egg, MON_DATA_MET_GAME);
    markings = GetMonData(egg, MON_DATA_MARKINGS);
    pokerus = GetMonData(egg, MON_DATA_POKERUS);

    CreateMon(temp, species, EGG_HATCH_LEVEL, 32, TRUE, personality, 0, 0);

    for (i = 0; i < 4; i++)
    {
        SetMonData(temp, MON_DATA_MOVE1 + i, (const u8 *) &moves[i]);
    }

    for (i = 0; i < 6; i++)
    {
        SetMonData(temp, MON_DATA_HP_IV + i, (const u8 *) &ivs[i]);
    }

    language = GAME_LANGUAGE;
    SetMonData(temp, MON_DATA_LANGUAGE, &language);
    SetMonData(temp, MON_DATA_MET_GAME, &gameMet);
    SetMonData(temp, MON_DATA_MARKINGS, &markings);

    friendship = 120;
    SetMonData(temp, MON_DATA_FRIENDSHIP, &friendship);
    SetMonData(temp, MON_DATA_POKERUS, (const u8 *) &pokerus);

    *egg = *temp;
}

static void AddHatchedMonToParty(u8 id)
{
    u8 isEgg;
    u16 pokeNum;
    u8 name[12];
    u16 ball;
    u16 caughtLvl;
    u8 mapNameID;
    struct Pokemon* mon = &gPlayerParty[id];

    CreatedHatchedMon(mon, &gEnemyParty[0]);
    isEgg = 0;
    SetMonData(mon, MON_DATA_IS_EGG, &isEgg);

    pokeNum = GetMonData(mon, MON_DATA_SPECIES);
    GetSpeciesName(name, pokeNum);
    SetMonData(mon, MON_DATA_NICKNAME, name);

    pokeNum = SpeciesToNationalPokedexNum(pokeNum);
    GetSetPokedexFlag(pokeNum, 2);
    GetSetPokedexFlag(pokeNum, 3);

    GetMonNick(mon, gStringVar1);

    ball = ITEM_POKE_BALL;
    SetMonData(mon, MON_DATA_POKEBALL, (const u8*) &ball);

    caughtLvl = 0;
    SetMonData(mon, MON_DATA_MET_LEVEL, (const u8*)  &caughtLvl);

    mapNameID = sav1_map_get_name();
    SetMonData(mon, MON_DATA_MET_LOCATION, &mapNameID);

    MonRestorePP(mon);
    CalculateMonStats(mon);
}

void ScriptHatchMon(void)
{
    AddHatchedMonToParty(gSpecialVar_0x8004);
}

static bool8 DaycareMonReceivedMail_(struct DayCare *daycare, u8 slot)
{
    u8 monNickname[32];
    GetBoxMonNick(&daycare->mons[slot], monNickname);
    if (daycare->misc.mail[slot].message.itemId != ITEM_NONE)
    {
        if (StringCompareWithoutExtCtrlCodes(monNickname, daycare->misc.mail[slot].names + 8)
         || StringCompareWithoutExtCtrlCodes(gSaveBlock2.playerName, daycare->misc.mail[slot].names))
        {
            StringCopy(gStringVar1, monNickname);
            StringCopy(gStringVar2, daycare->misc.mail[slot].names);
            StringCopy(gStringVar3, daycare->misc.mail[slot].names + 8);
            SanitizeNameString(gStringVar2);
            return TRUE;
        }
    }

    return FALSE;
}

bool8 DaycareMonReceivedMail(void)
{
    return DaycareMonReceivedMail_(&gSaveBlock1.daycare, gSpecialVar_0x8004);
}

static u8 EggHatchCreateMonSprite(u8 a0, u8 switchID, u8 pokeID)
{
    u8 r5 = 0;
    u8 spriteID = 0;
    struct Pokemon* mon = NULL;

    if (a0 == 0)
    {
        mon = &gPlayerParty[pokeID];
        r5 = 1;
    }
    if (a0 == 1)
    {
        mon = &gPlayerParty[pokeID];
        r5 = 3;
    }
    switch (switchID)
    {
    case 0:
        {
            u16 species = GetMonData(mon, MON_DATA_SPECIES);
            u32 pid = GetMonData(mon, MON_DATA_PERSONALITY);
            HandleLoadSpecialPokePic(&gMonFrontPicTable[species], gMonFrontPicCoords[species].coords, gMonFrontPicCoords[species].y_offset, ewram0_6, gUnknown_081FAF4C[2 * a0 + 1], species, pid);
            LoadCompressedObjectPalette(GetMonSpritePalStruct(mon));
        }
        break;
    case 1:
        GetMonSpriteTemplate_803C56C(GetMonSpritePalStruct(mon)->tag, r5);
        spriteID = CreateSprite(&gUnknown_02024E8C, 120, 70, 6);
        gSprites[spriteID].invisible = 1;
        gSprites[spriteID].callback = SpriteCallbackDummy;
        break;
    }
    return spriteID;
}

static void VBlankCB_EggHatch(void)
{
    LoadOam();
    ProcessSpriteCopyRequests();
    TransferPlttBuffer();
}

void EggHatch(void)
{
    ScriptContext2_Enable();
    CreateTask(Task_EggHatch, 10);
    BeginNormalPaletteFade(0xFFFFFFFF, 0, 0, 16, RGB(0, 0, 0));
}

static void Task_EggHatch(u8 taskID)
{
    if (!gPaletteFade.active)
    {
        SetMainCallback2(CB2_EggHatch_0);
        gFieldCallback = sub_8080990;
        DestroyTask(taskID);
    }
}

static void CB2_EggHatch_0(void)
{
    switch (gMain.state)
    {
    case 0:
        REG_DISPCNT = 0;
        gEggHatchData = eEggHatchData;
        gEggHatchData->eggPartyID = gSpecialVar_0x8004;
        gEggHatchData->eggShardVelocityID = 0;
        ResetTasks();
        ResetSpriteData();
        FreeAllSpritePalettes();
        SetVBlankCallback(VBlankCB_EggHatch);
        gMain.state++;
        gSpecialVar_0x8005 = GetCurrentMapMusic();
        break;
    case 1:
        Text_LoadWindowTemplate(&gWindowTemplate_81E6F84);
        Text_InitWindowWithTemplate(&gEggHatchData->window, &gWindowTemplate_81E6F84);
        gEggHatchData->tileDataStartOffset = TextWindow_SetBaseTileNum(20);
        TextWindow_LoadStdFrameGraphics(&gEggHatchData->window);
        gMain.state++;
        break;
    case 2:
        LZDecompressVram(&gBattleTextboxTiles, (void*)(VRAM));
        CpuSet(&gBattleTextboxTilemap, ewram0_7, 0x800);
        DmaCopy16(3, ewram0_7, (void*)(VRAM + 0x2800), 0x500);
        LoadCompressedPalette(&gBattleTextboxPalette, 0, 0x20);
        gMain.state++;
        break;
    case 3:
        LoadSpriteSheet(&sUnknown_0820A3B0);
        LoadSpriteSheet(&sUnknown_0820A3B8);
        LoadSpritePalette(&sUnknown_0820A3C0);
        gMain.state++;
        break;
    case 4:
        gEggHatchData->eggSpriteID = CreateSprite(&sSpriteTemplate_820A3C8, 0x78, 0x4B, 5);
        AddHatchedMonToParty(gEggHatchData->eggPartyID);
        gMain.state++;
        break;
    case 5:
        EggHatchCreateMonSprite(0, 0, gEggHatchData->eggPartyID);
        gMain.state++;
        break;
    case 6:
        gEggHatchData->pokeSpriteID = EggHatchCreateMonSprite(0, 1, gEggHatchData->eggPartyID);
        gMain.state++;
        break;
    case 7:
        REG_BG2CNT = 0x4C06;
        LoadPalette(gUnknown_0820C9F8, 0x10, 0xA0);
        DmaCopyLarge16(3, gUnknown_0820CA98, (void *)(VRAM + 0x4000), 0x1300, 0x1000);
        DmaCopy16Defvars(3, gUnknown_0820F798, (void *)(VRAM + 0x6000), 0x1000);
        gMain.state++;
        break;
    case 8:
        REG_BG1CNT = 0x501;

        REG_BG0HOFS = 0;
        REG_BG0VOFS = 0;

        REG_BG1HOFS = 0;
        REG_BG1VOFS = 0;

        REG_BG2HOFS = 0;
        REG_BG2VOFS = 0;

        SetMainCallback2(CB2_EggHatch_1);
        gEggHatchData->CB2_state = 0;
        break;
    }
}

static void EggHatchSetMonNickname(void)
{
    SetMonData(&gPlayerParty[gSpecialVar_0x8004], MON_DATA_NICKNAME, gStringVar3);
    SetMainCallback2(c2_exit_to_overworld_2_switch);
}

static void Task_EggHatchPlayBGM(u8 taskID)
{
    if (gTasks[taskID].data[0] == 0)
        StopMapMusic();
    if (gTasks[taskID].data[0] == 1)
        PlayBGM(376);
    if (gTasks[taskID].data[0] > 60)
    {
        PlayBGM(377);
        DestroyTask(taskID);
        //return; task is destroyed, yet you increment the value?
    }
    gTasks[taskID].data[0]++;
}

static void CB2_EggHatch_1(void)
{
    switch (gEggHatchData->CB2_state)
    {
    case 0:
        BeginNormalPaletteFade(0xFFFFFFFF, 0, 16, 0, RGB(0, 0, 0));
        REG_DISPCNT = 0x1740;
        gEggHatchData->CB2_state++;
        CreateTask(Task_EggHatchPlayBGM, 5);
        break;
    case 1:
        if (!gPaletteFade.active)
        {
            gEggHatchData->CB2_PalCounter = 0;
            gEggHatchData->CB2_state++;
        }
        break;
    case 2:
        if (++gEggHatchData->CB2_PalCounter > 30)
        {
            gEggHatchData->CB2_state++;
            gSprites[gEggHatchData->eggSpriteID].callback = SpriteCB_Egg_0;
        }
        break;
    case 3:
        if (gSprites[gEggHatchData->eggSpriteID].callback == SpriteCallbackDummy)
            gEggHatchData->CB2_state++;
        break;
    case 4:
        GetMonNick(&gPlayerParty[gEggHatchData->eggPartyID], gStringVar1);
        StringExpandPlaceholders(gStringVar4, gOtherText_HatchedFromEgg);
        EggHatchPrintMessage2(gStringVar4);
        PlayFanfare(371);
        gEggHatchData->CB2_state++;
        break;
    case 5:
        if (IsFanfareTaskInactive())
            gEggHatchData->CB2_state++;
        break;
    case 6:
        if (IsFanfareTaskInactive())
            gEggHatchData->CB2_state++;
        break;
    case 7:
        GetMonNick(&gPlayerParty[gEggHatchData->eggPartyID], gStringVar1);
        StringExpandPlaceholders(gStringVar4, gOtherText_NickHatchPrompt);
        EggHatchPrintMessage1(gStringVar4);
        gEggHatchData->CB2_state++;
        break;
    case 8:
        if (EggHatchUpdateWindowText())
        {
            Menu_DrawStdWindowFrame(22, 8, 27, 13);
            InitYesNoMenu(22, 8, 4);
            gEggHatchData->CB2_state++;
        }
        break;
    case 9:
        {
            s8 menuInput;
            if ((menuInput = Menu_ProcessInputNoWrap_()) != -2)
            {
                if (menuInput != -1 && menuInput != 1)
                {
                    u16 species;
                    u8 gender;
                    u32 personality;

                    GetMonNick(&gPlayerParty[gEggHatchData->eggPartyID], gStringVar3);
                    species = GetMonData(&gPlayerParty[gEggHatchData->eggPartyID], MON_DATA_SPECIES);
                    gender = GetMonGender(&gPlayerParty[gEggHatchData->eggPartyID]);
                    personality = GetMonData(&gPlayerParty[gEggHatchData->eggPartyID], MON_DATA_PERSONALITY, 0);
                    DoNamingScreen(3, gStringVar3, species, gender, personality, EggHatchSetMonNickname);
                }
                else
                    gEggHatchData->CB2_state++;
            }
        }
        break;
    case 10:
        BeginNormalPaletteFade(0xFFFFFFFF, 0, 0, 16, RGB(0, 0, 0));
        gEggHatchData->CB2_state++;
        break;
    case 11:
        if (!gPaletteFade.active)
            SetMainCallback2(c2_exit_to_overworld_2_switch);
        break;
    }
    RunTasks();
    AnimateSprites();
    BuildOamBuffer();
    UpdatePaletteFade();
}

static void SpriteCB_Egg_0(struct Sprite* sprite)
{
    if (++sprite->data[0] > 20)
    {
        sprite->callback = SpriteCB_Egg_1;
        sprite->data[0] = 0;
    }
    else
    {
        sprite->data[1] = (sprite->data[1] + 20) & 0xFF;
        sprite->pos2.x = Sin(sprite->data[1], 1);
        if (sprite->data[0] == 15)
        {
            PlaySE(SE_BOWA);
            StartSpriteAnim(sprite, 1);
            CreateRandomEggShardSprite();
        }
    }
}

static void SpriteCB_Egg_1(struct Sprite* sprite)
{
    if (++sprite->data[2] > 30)
    {
        if (++sprite->data[0] > 20)
        {
            sprite->callback = SpriteCB_Egg_2;
            sprite->data[0] = 0;
            sprite->data[2] = 0;
        }
        else
        {
            sprite->data[1] = (sprite->data[1] + 20) & 0xFF;
            sprite->pos2.x = Sin(sprite->data[1], 2);
            if (sprite->data[0] == 15)
            {
                PlaySE(SE_BOWA);
                StartSpriteAnim(sprite, 2);
            }
        }
    }
}

static void SpriteCB_Egg_2(struct Sprite* sprite)
{
    if (++sprite->data[2] > 30)
    {
        if (++sprite->data[0] > 38)
        {
            u16 species;

            sprite->callback = SpriteCB_Egg_3;
            sprite->data[0] = 0;
            species = GetMonData(&gPlayerParty[gEggHatchData->eggPartyID], MON_DATA_SPECIES);
            gSprites[gEggHatchData->pokeSpriteID].pos2.x = 0;
            gSprites[gEggHatchData->pokeSpriteID].pos2.y = gMonFrontPicCoords[species].y_offset;
        }
        else
        {
            sprite->data[1] = (sprite->data[1] + 20) & 0xFF;
            sprite->pos2.x = Sin(sprite->data[1], 2);
            if (sprite->data[0] == 15)
            {
                PlaySE(SE_BOWA);
                StartSpriteAnim(sprite, 2);
                CreateRandomEggShardSprite();
                CreateRandomEggShardSprite();
            }
            if (sprite->data[0] == 30)
                PlaySE(SE_BOWA);
        }
    }
}

static void SpriteCB_Egg_3(struct Sprite* sprite)
{
    if (++sprite->data[0] > 50)
    {
        sprite->callback = SpriteCB_Egg_4;
        sprite->data[0] = 0;
    }
}

static void SpriteCB_Egg_4(struct Sprite* sprite)
{
    s16 i;
    if (sprite->data[0] == 0)
        BeginNormalPaletteFade(0xFFFFFFFF, -1, 0, 16, FADE_COLOR_WHITE);
    if (sprite->data[0] < 4u)
    {
        for (i = 0; i <= 3; i++)
            CreateRandomEggShardSprite();
    }
    sprite->data[0]++;
    if (!gPaletteFade.active)
    {
        PlaySE(SE_TAMAGO);
        sprite->invisible = 1;
        sprite->callback = SpriteCB_Egg_5;
        sprite->data[0] = 0;
    }
}

static void SpriteCB_Egg_5(struct Sprite* sprite)
{
    if (sprite->data[0] == 0)
    {
        gSprites[gEggHatchData->pokeSpriteID].invisible = 0;
        StartSpriteAffineAnim(&gSprites[gEggHatchData->pokeSpriteID], 1);
    }
    if (sprite->data[0] == 8)
        BeginNormalPaletteFade(0xFFFFFFFF, -1, 16, 0, FADE_COLOR_WHITE);
    if (sprite->data[0] <= 9)
        gSprites[gEggHatchData->pokeSpriteID].pos1.y -= 1;
    if (sprite->data[0] > 40)
        sprite->callback = SpriteCallbackDummy;
    sprite->data[0]++;
}

static void SpriteCB_EggShard(struct Sprite* sprite)
{
    sprite->data[4] += sprite->data[1];
    sprite->data[5] += sprite->data[2];

    sprite->pos2.x = sprite->data[4] / 256;
    sprite->pos2.y = sprite->data[5] / 256;

    sprite->data[2] += sprite->data[3];

    if (sprite->pos1.y + sprite->pos2.y > sprite->pos1.y + 20 && sprite->data[2] > 0)
        DestroySprite(sprite);
}

// Converts a number to Q8.8 fixed-point format
#define Q_8_8(n) ((s16)((n) * 256))

static const s16 sEggShardVelocities[][2] =
{
    {Q_8_8(-1.5),       Q_8_8(-3.75)},
    {Q_8_8(-5),         Q_8_8(-3)},
    {Q_8_8(3.5),        Q_8_8(-3)},
    {Q_8_8(-4),         Q_8_8(-3.75)},
    {Q_8_8(2),          Q_8_8(-1.5)},
    {Q_8_8(-0.5),       Q_8_8(-6.75)},
    {Q_8_8(5),          Q_8_8(-2.25)},
    {Q_8_8(-1.5),       Q_8_8(-3.75)},
    {Q_8_8(4.5),        Q_8_8(-1.5)},
    {Q_8_8(-1),         Q_8_8(-6.75)},
    {Q_8_8(4),          Q_8_8(-2.25)},
    {Q_8_8(-3.5),       Q_8_8(-3.75)},
    {Q_8_8(1),          Q_8_8(-1.5)},
    {Q_8_8(-3.515625),  Q_8_8(-6.75)},
    {Q_8_8(4.5),        Q_8_8(-2.25)},
    {Q_8_8(-0.5),       Q_8_8(-7.5)},
    {Q_8_8(1),          Q_8_8(-4.5)},
    {Q_8_8(-2.5),       Q_8_8(-2.25)},
    {Q_8_8(2.5),        Q_8_8(-7.5)},
};

static void CreateRandomEggShardSprite(void)
{
    u16 spriteAnimIndex;

    s16 velocity1 = sEggShardVelocities[gEggHatchData->eggShardVelocityID][0];
    s16 velocity2 = sEggShardVelocities[gEggHatchData->eggShardVelocityID][1];
    gEggHatchData->eggShardVelocityID++;
    spriteAnimIndex = Random() % 4;
    CreateEggShardSprite(120, 60, velocity1, velocity2, 100, spriteAnimIndex);
}

static void CreateEggShardSprite(u8 x, u8 y, s16 data1, s16 data2, s16 data3, u8 spriteAnimIndex)
{
    u8 spriteID = CreateSprite(&sSpriteTemplate_820A418, x, y, 4);
    gSprites[spriteID].data[1] = data1;
    gSprites[spriteID].data[2] = data2;
    gSprites[spriteID].data[3] = data3;
    StartSpriteAnim(&gSprites[spriteID], spriteAnimIndex);
}

static void EggHatchPrintMessage1(u8* src)
{
    Text_InitWindow8002EB0(&gEggHatchData->window, src, gEggHatchData->tileDataStartOffset, 3, 15);
}

static void EggHatchPrintMessage2(u8* src)
{
    Text_InitWindowAndPrintText(&gEggHatchData->window, src, gEggHatchData->tileDataStartOffset, 3, 15);
}

static bool8 EggHatchUpdateWindowText(void)
{
    return Text_UpdateWindow(&gEggHatchData->window);
}
