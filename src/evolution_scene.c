#include "global.h"
#include "task.h"
#include "evolution_scene.h"
#include "evolution_graphics.h"
#include "palette.h"
#include "main.h"
#include "text.h"
#include "text_window.h"
#include "pokemon.h"
#include "string_util.h"
#include "battle.h"
#include "scanline_effect.h"
#include "data2.h"
#include "decompress.h"
#include "m4a.h"
#include "trade.h"
#include "menu.h"
#include "pokedex.h"
#include "constants/species.h"
#include "sound.h"
#include "constants/songs.h"
#include "overworld.h"
#include "battle_message.h"
#include "pokemon_summary_screen.h"
#include "menu_cursor.h"
#include "strings2.h"
#include "ewram.h"

struct EvoInfo
{
    u8 preEvoSpriteID;
    u8 postEvoSpriteID;
    u8 evoTaskID;
    u8 field_3;

    u8 unk4[0x40];
    u8 unk44[0x40];
    u8 unk84[0x40];

    u8 unkC4[0x40][0x20];    // 0x20148C4
    u8 unk8C4[0x40][0x20];   // 0x20150C4
    u8 unk10C4[0x40][0x20];  // 0x20158C4
    u8 unk18C4[0x40][0x20];  // 0x20160C4
    u8 unk20C4[0x40][0x20];  // 0x20168C4
    u8 unk28C4[0x40][0x20];  // 0x20170C4
    u8 unk30C4[0x40][0x20];  // 0x20178C4
    u8 unk38C4[0x40][0x20];  // 0x20180C4

    u8 *unk40C4[0x40][0x20];  // 0x20188C4

    u16 unk60C4[0x40][0x20];  // 0x201A8C4
    u16 unk70C4[0x40][0x20];  // 0x201B8C4
    u16 unk80C4[0x40][0x20];  // 0x201C8C4
    u16 unk90C4[0x40][0x20];  // 0x201D8C4

    u8 unkA0C4; // 0x201E8C4
};

void EvolutionRenameMon(struct Pokemon *mon, u16 oldSpecies, u16 newSpecies);
void sub_8024CEC(void);
void sub_8023A80(void);
void sub_802BC6C(void);
void sub_8023AD8(void);
void nullsub_6(void);
void sub_81141F0(int a, int b, int c);
void sub_8114DB4(int a, u8 b);
void sub_8114DF0(int a, u8 b);
u8 sub_8114E48(u32 a, u8 b);
void sub_811430C(int a, int b);
bool32 IsHMMove2(u16 move);

extern struct Window gWindowTemplate_Contest_MoveDescription;
extern u8 gBattleTerrain;
extern u8 gReservedSpritePaletteCount;
extern u16 gMoveToLearn;
extern struct SpriteTemplate gCreatingSpriteTemplate;
extern bool8 gAffineAnimsDisabled;
extern u8 gDisplayedStringBattle[];
extern u8 gBattleTextBuff2[];

extern u8 gBattleCommunication[];
#define sEvoCursorPos        gBattleCommunication[1] // when learning a new move
#define sEvoGraphicsTaskID   gBattleCommunication[2]

extern const u8 BattleText_StartEvo[];
extern const u8 BattleText_FinishEvo[];
extern const u8 BattleText_StopEvo[];
extern const u8 *const gBattleStringsTable[];

// this file's functions
static void Task_EvolutionScene(u8 taskID);
static void Task_TradeEvolutionScene(u8 taskID);
static void CB2_EvolutionSceneUpdate(void);
static void CB2_TradeEvolutionSceneUpdate(void);
static void EvoDummyFunc(void);
static void EvoDummyFunc2(void);
static void VBlankCB_EvolutionScene(void);
static void VBlankCB_TradeEvolutionScene(void);
static void sub_81150D8(void);

// iwram common
MainCallback gCB2_AfterEvolution;

// const data
static const u8 sUnknownShedinjaJpnString[] = _("ヌケニン");
static const u8 sUnusedString0[] = _("{COLOR DARK_GREY}{HIGHLIGHT WHITE2}{SHADOW LIGHT_GREY}");
static const u8 sUnusedString1[] = _("▶\n ");
static const u8 sUnusedString2[] = _("       \n▶");
static const u8 sUnusedString3[] = _("       \n ");
static const u8 sPadding[9] = {0};

// code

static void CB2_BeginEvolutionScene(void)
{
    UpdatePaletteFade();
    RunTasks();
}

#define tState              data[0]
#define tMonPtrLo           data[1]
#define tMonPtrHi           data[2]
#define tPreEvoSpecies      data[3]
#define tPostEvoSpecies     data[4]
#define tCanStop            data[5] // in first fast data[5] only checks that
#define tBits               data[5] // in the second task, it works as a bitfield
#define tLearnsFirstMove    data[6]
#define tLearnMoveState     data[8]
#define tData9              data[9]
#define tdata10             data[10]
#define tEvoWasStopped      data[11]
#define tPartyID            data[12]

#define TASK_BIT_CAN_STOP       0x1
#define TASK_BIT_LEARN_MOVE     0x80

static void Task_BeginEvolutionScene(u8 taskID)
{
    struct Pokemon* mon = NULL;
    switch (gTasks[taskID].tState)
    {
    case 0:
        BeginNormalPaletteFade(0xFFFFFFFF, 0, 0, 16, RGB(0, 0, 0));
        gTasks[taskID].tState++;
        break;
    case 1:
        if (!gPaletteFade.active)
        {
            u16 speciesToEvolve;
            bool8 canStopEvo;
            u8 partyID;

#if MODERN
            mon = (struct Pokemon*)((u16)gTasks[taskID].tMonPtrLo | ((u16)gTasks[taskID].tMonPtrHi << 0x10));
#else
            mon = (struct Pokemon*)(gTasks[taskID].tMonPtrLo | (gTasks[taskID].tMonPtrHi << 0x10));
#endif
            speciesToEvolve = gTasks[taskID].tPostEvoSpecies;
            canStopEvo = gTasks[taskID].tCanStop;
            partyID = gTasks[taskID].tPartyID;

            DestroyTask(taskID);
            EvolutionScene(mon, speciesToEvolve, canStopEvo, partyID);
        }
        break;
    }
}

void BeginEvolutionScene(struct Pokemon* mon, u16 speciesToEvolve, bool8 canStopEvo, u8 partyID)
{
    u8 taskID = CreateTask(Task_BeginEvolutionScene, 0);
    gTasks[taskID].tState = 0;
    gTasks[taskID].tMonPtrLo = (u32)(mon);
    gTasks[taskID].tMonPtrHi = (u32)(mon) >> 0x10;
    gTasks[taskID].tPostEvoSpecies = speciesToEvolve;
    gTasks[taskID].tCanStop = canStopEvo;
    gTasks[taskID].tPartyID = partyID;
    SetMainCallback2(CB2_BeginEvolutionScene);
}

void EvolutionScene(struct Pokemon* mon, u16 speciesToEvolve, bool8 canStopEvo, u8 partyID)
{
    u8 name[20];
    u16 currSpecies;
    u32 TiD, PiD;
    const struct CompressedSpritePalette** pokePal;
    u8 ID;
    SetHBlankCallback(NULL);
    SetVBlankCallback(NULL);
    CpuFill32(0, (void*)(VRAM), VRAM_SIZE);

    REG_MOSAIC = 0;
    REG_WIN0H = 0;
    REG_WIN0V = 0;
    REG_WIN1H = 0;
    REG_WIN1V = 0;
    REG_WININ = 0;
    REG_WINOUT = 0;

    Text_LoadWindowTemplate(&gWindowTemplate_81E6C58);
    ResetPaletteFade();

    gBattle_BG0_X = 0;
    gBattle_BG0_Y = 0;
    gBattle_BG1_X = 0;
    gBattle_BG1_Y = 0;
    gBattle_BG2_X = 0;
    gBattle_BG2_Y = 0;
    gBattle_BG3_X = 256;
    gBattle_BG3_Y = 0;

    Text_InitWindowWithTemplate(&gWindowTemplate_Contest_MoveDescription, &gWindowTemplate_81E6C58);
    gBattleTerrain = BATTLE_TERRAIN_PLAIN;

    sub_800D6D4();
    LoadBattleTextboxAndBackground();
    ResetSpriteData();
    ScanlineEffect_Stop();
    ResetTasks();
    FreeAllSpritePalettes();

    gReservedSpritePaletteCount = 4;

    GetMonData(mon, MON_DATA_NICKNAME, name);
    StringCopy10(gStringVar1, name);
    StringCopy(gStringVar2, gSpeciesNames[speciesToEvolve]);

    // preEvo sprite
    currSpecies = GetMonData(mon, MON_DATA_SPECIES);
    TiD = GetMonData(mon, MON_DATA_OT_ID);
    PiD = GetMonData(mon, MON_DATA_PERSONALITY);
    DecompressPicFromTable_2(&gMonFrontPicTable[currSpecies],
                             gMonFrontPicCoords[currSpecies].coords,
                             gMonFrontPicCoords[currSpecies].y_offset,
                             (void*)EWRAM,
                             gMonSpriteGfx_Sprite_ptr[1], currSpecies);
    pokePal = (void*) GetMonSpritePalStructFromOtIdPersonality(currSpecies, TiD, PiD);
    LoadCompressedPalette(*pokePal, 0x110, 0x20);

    GetMonSpriteTemplate_803C56C(currSpecies, 1);
    gCreatingSpriteTemplate.affineAnims = gDummySpriteAffineAnimTable;
    sEvoInfo.preEvoSpriteID = ID = CreateSprite(&gCreatingSpriteTemplate, 120, 64, 30);

    gSprites[ID].callback = nullsub_37;
    gSprites[ID].oam.paletteNum = 1;
    gSprites[ID].invisible = TRUE;

    // postEvo sprite
    DecompressPicFromTable_2(&gMonFrontPicTable[speciesToEvolve],
                             gMonFrontPicCoords[speciesToEvolve].coords,
                             gMonFrontPicCoords[speciesToEvolve].y_offset,
                             (void*)EWRAM,
                             gMonSpriteGfx_Sprite_ptr[3], speciesToEvolve);
    pokePal = (void*) GetMonSpritePalStructFromOtIdPersonality(speciesToEvolve, TiD, PiD);
    LoadCompressedPalette(*pokePal, 0x120, 0x20);

    GetMonSpriteTemplate_803C56C(speciesToEvolve, 3);
    gCreatingSpriteTemplate.affineAnims = gDummySpriteAffineAnimTable;
    sEvoInfo.postEvoSpriteID = ID = CreateSprite(&gCreatingSpriteTemplate, 120, 64, 30);
    gSprites[ID].callback = nullsub_37;
    gSprites[ID].oam.paletteNum = 2;
    gSprites[ID].invisible = TRUE;

    LoadEvoSparkleSpriteAndPal();

    sEvoInfo.evoTaskID = ID = CreateTask(Task_EvolutionScene, 0);
    gTasks[ID].tState = 0;
    gTasks[ID].tPreEvoSpecies = currSpecies;
    gTasks[ID].tPostEvoSpecies = speciesToEvolve;
    gTasks[ID].tMonPtrLo = (u32)(mon);
    gTasks[ID].tMonPtrHi = (u32)(mon) >> 0x10;
    gTasks[ID].tCanStop = canStopEvo;
    gTasks[ID].tLearnsFirstMove = TRUE;
    gTasks[ID].tEvoWasStopped = FALSE;
    gTasks[ID].tPartyID = partyID;

    memcpy((void *)(EWRAM + 0x9000), &gPlttBufferUnfaded[0x20], 0x60);

    REG_DISPCNT = DISPCNT_OBJ_ON | DISPCNT_BG_ALL_ON | DISPCNT_OBJ_1D_MAP;
    SetHBlankCallback(EvoDummyFunc);
    SetVBlankCallback(VBlankCB_EvolutionScene);
    m4aMPlayAllStop();
    SetMainCallback2(CB2_EvolutionSceneUpdate);
}

static void CB2_EvolutionSceneLoadGraphics(void)
{
    u8 ID;
    const struct CompressedSpritePalette* pokePal;
    u16 postEvoSpecies;
    u32 TiD, PiD;
    struct Pokemon* Mon = &gPlayerParty[gTasks[sEvoInfo.evoTaskID].tPartyID];

    postEvoSpecies = gTasks[sEvoInfo.evoTaskID].tPostEvoSpecies;
    TiD = GetMonData(Mon, MON_DATA_OT_ID);
    PiD = GetMonData(Mon, MON_DATA_PERSONALITY);

    SetHBlankCallback(NULL);
    SetVBlankCallback(NULL);
    CpuFill32(0, (void*)(VRAM), VRAM_SIZE);

    REG_MOSAIC = 0;
    REG_WIN0H = 0;
    REG_WIN0V = 0;
    REG_WIN1H = 0;
    REG_WIN1V = 0;
    REG_WININ = 0;
    REG_WINOUT = 0;
    Text_LoadWindowTemplate(&gWindowTemplate_81E6C58);
    ResetPaletteFade();
    gBattle_BG0_X = 0;
    gBattle_BG0_Y = 0;
    gBattle_BG1_X = 0;
    gBattle_BG1_Y = 0;
    gBattle_BG2_X = 0;
    gBattle_BG2_Y = 0;
    gBattle_BG3_X = 256;
    gBattle_BG3_Y = 0;

    Text_InitWindowWithTemplate(&gWindowTemplate_Contest_MoveDescription, &gWindowTemplate_81E6C58);
    gBattleTerrain = BATTLE_TERRAIN_PLAIN;

    sub_800D6D4();
    LoadBattleTextboxAndBackground();
    ResetSpriteData();
    FreeAllSpritePalettes();
    gReservedSpritePaletteCount = 4;

    DecompressPicFromTable_2(&gMonFrontPicTable[postEvoSpecies],
                             gMonFrontPicCoords[postEvoSpecies].coords,
                             gMonFrontPicCoords[postEvoSpecies].y_offset,
                             (void*)EWRAM,
                             gMonSpriteGfx_Sprite_ptr[3], postEvoSpecies);
    pokePal = (struct CompressedSpritePalette*) GetMonSpritePalStructFromOtIdPersonality(postEvoSpecies, TiD, PiD);
    LoadCompressedPalette(pokePal->data, 0x120, 0x20);

    GetMonSpriteTemplate_803C56C(postEvoSpecies, 3);
    gCreatingSpriteTemplate.affineAnims = gDummySpriteAffineAnimTable;
    sEvoInfo.postEvoSpriteID = ID = CreateSprite(&gCreatingSpriteTemplate, 120, 64, 30);

    gSprites[ID].callback = nullsub_37;
    gSprites[ID].oam.paletteNum = 2;

    REG_DISPCNT = DISPCNT_OBJ_ON | DISPCNT_BG_ALL_ON | DISPCNT_OBJ_1D_MAP;
    SetHBlankCallback(EvoDummyFunc);
    SetVBlankCallback(VBlankCB_EvolutionScene);
    SetMainCallback2(CB2_EvolutionSceneUpdate);
    BeginNormalPaletteFade(0xFFFFFFFF, 0, 16, 0, RGB(0, 0, 0));
}

static void CB2_TradeEvolutionSceneLoadGraphics(void)
{
    struct Pokemon* Mon = &gPlayerParty[gTasks[sEvoInfo.evoTaskID].tPartyID];
    u16 postEvoSpecies = gTasks[sEvoInfo.evoTaskID].tPostEvoSpecies;

    switch (gMain.state)
    {
    case 0:
        REG_DISPCNT = 0;
        SetHBlankCallback(NULL);
        SetVBlankCallback(NULL);
        ResetSpriteData();
        FreeAllSpritePalettes();
        gReservedSpritePaletteCount = 4;
        gBattle_BG0_X = 0;
        gBattle_BG0_Y = 0;
        gBattle_BG1_X = 0;
        gBattle_BG1_Y = 0;
        gBattle_BG2_X = 0;
        gBattle_BG2_Y = 0;
        gBattle_BG3_X = 256;
        gBattle_BG3_Y = 0;
        gMain.state++;
        break;
    case 1:
        Text_LoadWindowTemplate(&gWindowTemplate_81E6F84);
        Text_InitWindowWithTemplate(&gUnknown_03004828->window, &gWindowTemplate_81E6F84);
        gMain.state++;
        break;
    case 2:
        TextWindow_LoadStdFrameGraphics(&gUnknown_03004828->window);
        gUnknown_03004828->textWindowBaseTileNum = TextWindow_SetBaseTileNum(2);
        TextWindow_LoadStdFrameGraphics(&gUnknown_03004828->window);
        Menu_EraseScreen();
        ResetPaletteFade();
        gMain.state++;
        SetHBlankCallback(EvoDummyFunc);
        SetVBlankCallback(VBlankCB_TradeEvolutionScene);
        break;
    case 3:
        sub_804E22C();
        gMain.state++;
        break;
    case 4:
        {
            const struct CompressedSpritePalette** pokePal;
            u32 TiD = GetMonData(Mon, MON_DATA_OT_ID);
            u32 PiD = GetMonData(Mon, MON_DATA_PERSONALITY);
            DecompressPicFromTable_2(&gMonFrontPicTable[postEvoSpecies],
                                     gMonFrontPicCoords[postEvoSpecies].coords,
                                     gMonFrontPicCoords[postEvoSpecies].y_offset,
                                     (void*)EWRAM,
                                     gMonSpriteGfx_Sprite_ptr[3], postEvoSpecies);
            pokePal = (void*) GetMonSpritePalStructFromOtIdPersonality(postEvoSpecies, TiD, PiD);
            LoadCompressedPalette(*pokePal, 0x120, 0x20);
            gMain.state++;
        }
        break;
    case 5:
        {
            u8 ID;

            GetMonSpriteTemplate_803C56C(postEvoSpecies, 3);
            gCreatingSpriteTemplate.affineAnims = gDummySpriteAffineAnimTable;
            sEvoInfo.postEvoSpriteID = ID = CreateSprite(&gCreatingSpriteTemplate, 120, 64, 30);

            gSprites[ID].callback = nullsub_37;
            gSprites[ID].oam.paletteNum = 2;
            gMain.state++;
        }
        break;
    case 6:
        BeginNormalPaletteFade(0xFFFFFFFF, 0, 16, 0, RGB(0, 0, 0));
        SetMainCallback2(CB2_TradeEvolutionSceneUpdate);
        REG_DISPCNT = DISPCNT_OBJ_ON | DISPCNT_BG0_ON | DISPCNT_BG1_ON | DISPCNT_OBJ_1D_MAP;
        break;
    }
}

void TradeEvolutionScene(struct Pokemon* mon, u16 speciesToEvolve, u8 preEvoSpriteID, u8 partyID)
{
    u8 name[20];
    u16 currSpecies;
    u32 TiD, PiD;
    const struct CompressedSpritePalette** pokePal;
    u8 ID;

    GetMonData(mon, MON_DATA_NICKNAME, name);
    StringCopy10(gStringVar1, name);
    StringCopy(gStringVar2, gSpeciesNames[speciesToEvolve]);

    gAffineAnimsDisabled = TRUE;

    // preEvo sprite
    currSpecies = GetMonData(mon, MON_DATA_SPECIES);
    PiD = GetMonData(mon, MON_DATA_PERSONALITY);
    TiD = GetMonData(mon, MON_DATA_OT_ID);
    sEvoInfo.preEvoSpriteID = preEvoSpriteID;
    DecompressPicFromTable_2(&gMonFrontPicTable[speciesToEvolve],
                             gMonFrontPicCoords[speciesToEvolve].coords,
                             gMonFrontPicCoords[speciesToEvolve].y_offset,
                             (void*)EWRAM,
                             gMonSpriteGfx_Sprite_ptr[1], speciesToEvolve);
    pokePal = (void*) GetMonSpritePalStructFromOtIdPersonality(speciesToEvolve, TiD, PiD);
    LoadCompressedPalette(*pokePal, 0x120, 0x20);

    GetMonSpriteTemplate_803C56C(speciesToEvolve, 1);
    gCreatingSpriteTemplate.affineAnims = gDummySpriteAffineAnimTable;
    sEvoInfo.postEvoSpriteID = ID = CreateSprite(&gCreatingSpriteTemplate, 120, 64, 30);

    gSprites[ID].callback = nullsub_37;
    gSprites[ID].oam.paletteNum = 2;
    gSprites[ID].invisible = TRUE;

    LoadEvoSparkleSpriteAndPal();

    sEvoInfo.evoTaskID = ID = CreateTask(Task_TradeEvolutionScene, 0);
    gTasks[ID].tState = 0;
    gTasks[ID].tPreEvoSpecies = currSpecies;
    gTasks[ID].tPostEvoSpecies = speciesToEvolve;
    gTasks[ID].tMonPtrLo = (u32)(mon);
    gTasks[ID].tMonPtrHi = (u32)(mon) >> 0x10;
    gTasks[ID].tLearnsFirstMove = TRUE;
    gTasks[ID].tEvoWasStopped = FALSE;
    gTasks[ID].tPartyID = partyID;

    SetMainCallback2(CB2_TradeEvolutionSceneUpdate);
}

static void CB2_EvolutionSceneUpdate(void)
{
    AnimateSprites();
    BuildOamBuffer();
    Text_UpdateWindowInBattle(&gWindowTemplate_Contest_MoveDescription);
    UpdatePaletteFade();
    RunTasks();
}

static void CB2_TradeEvolutionSceneUpdate(void)
{
    AnimateSprites();
    BuildOamBuffer();
    Text_UpdateWindow(&gUnknown_03004828->window);
    UpdatePaletteFade();
    RunTasks();
}

static void CreateShedinja(u16 preEvoSpecies, struct Pokemon* mon)
{
    u32 data = 0;

    if (gEvolutionTable[preEvoSpecies][0].method == EVO_LEVEL_NINJASK && gPlayerPartyCount < 6)
    {
        s32 i;
        struct Pokemon* Shedinja = &gPlayerParty[gPlayerPartyCount];

        CopyMon(Shedinja, mon, sizeof(struct Pokemon));
        SetMonData(Shedinja, MON_DATA_SPECIES, (void*)&gEvolutionTable[preEvoSpecies][1].targetSpecies);
        SetMonData(Shedinja, MON_DATA_NICKNAME, (void*)gSpeciesNames[gEvolutionTable[preEvoSpecies][1].targetSpecies]);
        SetMonData(Shedinja, MON_DATA_HELD_ITEM, (void*)&data);
        SetMonData(Shedinja, MON_DATA_MARKINGS, (void*)&data);
        SetMonData(Shedinja, MON_DATA_10, (void*)&data);
        for (i = MON_DATA_COOL_RIBBON; i < MON_DATA_COOL_RIBBON + 5; i++)
            SetMonData(Shedinja, i, (void*)&data);
        for (i = MON_DATA_CHAMPION_RIBBON; i <= MON_DATA_EVENT_LEGAL; i++)
            SetMonData(Shedinja, i, (void*)&data);
        SetMonData(Shedinja, MON_DATA_STATUS, (void*)&data);
        data = 0xFF;
        SetMonData(Shedinja, MON_DATA_MAIL, (void*)&data);

        CalculateMonStats(Shedinja);
        CalculatePlayerPartyCount();

        GetSetPokedexFlag(SpeciesToNationalPokedexNum(gEvolutionTable[preEvoSpecies][1].targetSpecies), 2);
        GetSetPokedexFlag(SpeciesToNationalPokedexNum(gEvolutionTable[preEvoSpecies][1].targetSpecies), 3);

        if (GetMonData(Shedinja, MON_DATA_SPECIES) == SPECIES_SHEDINJA
            && GetMonData(Shedinja, MON_DATA_LANGUAGE) == LANGUAGE_JAPANESE
            && GetMonData(mon, MON_DATA_SPECIES) == SPECIES_NINJASK)
                SetMonData(Shedinja, MON_DATA_NICKNAME, sUnknownShedinjaJpnString);
    }
}

static void Task_EvolutionScene(u8 taskID)
{
    u32 var;
    struct Pokemon* mon = (struct Pokemon*)(gTasks[taskID].tMonPtrLo | (gTasks[taskID].tMonPtrHi << 0x10));

    // check if B Button was held, so the evolution gets stopped
    if (gMain.heldKeys == B_BUTTON && gTasks[taskID].tState == 8 && gTasks[taskID].tBits & TASK_BIT_CAN_STOP)
    {
        gTasks[taskID].tState = 16;
        if (gTasks[sEvoGraphicsTaskID].isActive)
            gTasks[sEvoGraphicsTaskID].EvoGraphicsTaskEvoStop = TRUE;
    }
    switch (gTasks[taskID].tState)
    {
    case 0:
        BeginNormalPaletteFade(0xFFFFFFFF, 0, 16, 0, RGB(0, 0, 0));
        gSprites[sEvoInfo.preEvoSpriteID].invisible = FALSE;
        gTasks[taskID].tState++;
        break;
    case 1: // print 'whoa, poke is evolving!!!' msg
        if (!gPaletteFade.active)
        {
            StringExpandPlaceholders(gStringVar4, BattleText_StartEvo);
            Contest_StartTextPrinter(&gWindowTemplate_Contest_MoveDescription, gStringVar4, 144, 2, 15);
            gTasks[taskID].tState++;
        }
        break;
    case 2: // wait for string, play cry
        if (gWindowTemplate_Contest_MoveDescription.state == 0)
        {
            PlayCry1(gTasks[taskID].tPreEvoSpecies, 0);
            gTasks[taskID].tState++;
        }
        break;
    case 3: // wait for cry, play tu du SE
        if (IsCryFinished())
        {
            PlaySE(MUS_EVOLUTION_INTRO);
            gTasks[taskID].tState++;
        }
        break;
    case 4: // play evolution music and fade screen black
        if (!IsSEPlaying())
        {
            PlayNewMapMusic(MUS_EVOLUTION);
            gTasks[taskID].tState++;
            BeginNormalPaletteFade(0x1C, 4, 0, 16, RGB(0, 0, 0));
        }
        break;
    case 5: // after screen fade, preapre evo sparkles
        if (!gPaletteFade.active)
        {
            sEvoGraphicsTaskID = LaunchTask_PreEvoSparklesSet1(17);
            gTasks[taskID].tState++;
        }
        break;
    case 6: // another set of evo sparkles
        if (!gTasks[sEvoGraphicsTaskID].isActive)
        {
            gTasks[taskID].tState++;
            sEvoInfo.field_3 = 1;
            sEvoGraphicsTaskID = LaunchTask_PreEvoSparklesSet2();
        }
        break;
    case 7: // launch task that flashes pre evo with post evo sprites
        if (!gTasks[sEvoGraphicsTaskID].isActive)
        {
            sEvoGraphicsTaskID = sub_8149E7C(sEvoInfo.preEvoSpriteID, sEvoInfo.postEvoSpriteID);
            gTasks[taskID].tState++;
        }
        break;
    case 8: // wait for the above task to finish
        if (--sEvoInfo.field_3 == 0)
        {
            sEvoInfo.field_3 = 3;
            if (!gTasks[sEvoGraphicsTaskID].isActive)
                gTasks[taskID].tState++;
        }
        break;
    case 9: // post evo sparkles
        sEvoGraphicsTaskID = LaunchTask_PostEvoSparklesSet1();
        gTasks[taskID].tState++;
        break;
    case 10:
        if (!gTasks[sEvoGraphicsTaskID].isActive)
        {
            sEvoGraphicsTaskID = LaunchTask_PostEvoSparklesSet2AndFlash(gTasks[taskID].tPostEvoSpecies);
            gTasks[taskID].tState++;
        }
        break;
    case 11: // play tu du sound after evolution
        if (!gTasks[sEvoGraphicsTaskID].isActive)
        {
            PlaySE(SE_EXP);
            gTasks[taskID].tState++;
        }
        break;
    case 12: // play poke cry after evolution and return screed to pre-fade state
        if (IsSEPlaying())
        {
            m4aMPlayAllStop();
            PlayCry1(gTasks[taskID].tPostEvoSpecies, 0);
            memcpy(&gPlttBufferUnfaded[0x20], (void *)(EWRAM + 0x9000), 0x60);
            BeginNormalPaletteFade(0x1C, 0, 16, 0, RGB(0, 0, 0));
            gTasks[taskID].tState++;
        }
        break;
    case 13: // congratulations string and rename prompt
        if (IsCryFinished() && !gPaletteFade.active)
        {
            StringExpandPlaceholders(gStringVar4, BattleText_FinishEvo);
            Contest_StartTextPrinter(&gWindowTemplate_Contest_MoveDescription, gStringVar4, 144, 2, 15);
            PlayBGM(MUS_EVOLVED);
            gTasks[taskID].tState++;
            SetMonData(mon, MON_DATA_SPECIES, (void*)(&gTasks[taskID].tPostEvoSpecies));
            CalculateMonStats(mon);
            EvolutionRenameMon(mon, gTasks[taskID].tPreEvoSpecies, gTasks[taskID].tPostEvoSpecies);
            GetSetPokedexFlag(SpeciesToNationalPokedexNum(gTasks[taskID].tPostEvoSpecies), 2);
            GetSetPokedexFlag(SpeciesToNationalPokedexNum(gTasks[taskID].tPostEvoSpecies), 3);
            IncrementGameStat(GAME_STAT_EVOLVED_POKEMON);
        }
        break;
    case 14: // check if it wants to learn a new move
        if (gWindowTemplate_Contest_MoveDescription.state == 0)
        {
            var = MonTryLearningNewMove(mon, gTasks[taskID].tLearnsFirstMove);
            if (var != 0 && !gTasks[taskID].tEvoWasStopped)
            {
                u8 text[20];

                Overworld_PlaySpecialMapMusic();
                gTasks[taskID].tBits |= TASK_BIT_LEARN_MOVE;
                gTasks[taskID].tLearnsFirstMove = FALSE;
                gTasks[taskID].tLearnMoveState = 0;
                GetMonData(mon, MON_DATA_NICKNAME, text);
                StringCopy10(gBattleTextBuff1, text);
                if (var == 0xFFFF) // no place to learn it
                    gTasks[taskID].tState = 21;
                else if (var == 0xFFFE) // it already knows that move
                    break;
                else
                    gTasks[taskID].tState = 19; // has less than 4 moves, so it's been learned
            }
            else // no move to learn
            {
                BeginNormalPaletteFade(0xFFFFFFFF, 0, 0, 16, RGB(0, 0, 0));
                gTasks[taskID].tState++;
            }
        }
        break;
    case 15: // task has finished, return
        if (!gPaletteFade.active)
        {
            if (!(gTasks[taskID].tBits & TASK_BIT_LEARN_MOVE))
                Overworld_PlaySpecialMapMusic();
            if (!gTasks[taskID].tEvoWasStopped)
                CreateShedinja(gTasks[taskID].tPreEvoSpecies, mon);
            DestroyTask(taskID);
            SetMainCallback2(gCB2_AfterEvolution);
        }
        break;
    case 16: // evolution has been canceled, stop music and re-fade palette
        if (!gTasks[sEvoGraphicsTaskID].isActive)
        {
            m4aMPlayAllStop();
            BeginNormalPaletteFade(0x6001C, 0, 16, 0, RGB(31, 31, 31));
            gTasks[taskID].tState++;
        }
        break;
    case 17: // play cry of the pokemon trying to evolve again, evolution has been stopped
        if (!gPaletteFade.active)
        {
            PlayCry1(gTasks[taskID].tPreEvoSpecies, 0);
            gTasks[taskID].tState++;
        }
        break;
    case 18: // after the cry, print the string 'WHOA IT DID NOT EVOLVE!!!'
        if (IsCryFinished())
        {
            StringExpandPlaceholders(gStringVar4, BattleText_StopEvo);
            Contest_StartTextPrinter(&gWindowTemplate_Contest_MoveDescription, gStringVar4, 144, 2, 15);
            gTasks[taskID].tEvoWasStopped = TRUE;
            gTasks[taskID].tState = 14;
        }
        break;
    case 19: // pokemon learned a new move, print string and play a fanfare
        if (gWindowTemplate_Contest_MoveDescription.state == 0 && !IsSEPlaying())
        {
            sub_8024CEC();
            PlayFanfare(MUS_LEVEL_UP);
            BattleStringExpandPlaceholdersToDisplayedString(gBattleStringsTable[3]);
            Contest_StartTextPrinter(&gWindowTemplate_Contest_MoveDescription, gDisplayedStringBattle, 144, 2, 15);
            gTasks[taskID].tLearnsFirstMove = 0x40; // re-used as a counter
            gTasks[taskID].tState++;
        }
        break;
    case 20: // wait a bit and check if can learn another move
        if (gWindowTemplate_Contest_MoveDescription.state == 0 && !IsSEPlaying() && --gTasks[taskID].tLearnsFirstMove == 0)
            gTasks[taskID].tState = 14;
        break;
    case 21: // try to learn a new move
        switch (gTasks[taskID].tLearnMoveState)
        {
        case 0:
            if (gWindowTemplate_Contest_MoveDescription.state == 0 && !IsSEPlaying())
            {
                sub_8024CEC();
                BattleStringExpandPlaceholdersToDisplayedString(gBattleStringsTable[4]);
                Contest_StartTextPrinter(&gWindowTemplate_Contest_MoveDescription, gDisplayedStringBattle, 144, 2, 15);
                gTasks[taskID].tLearnMoveState++;
            }
            break;
        case 1:
            if (gWindowTemplate_Contest_MoveDescription.state == 0 && !IsSEPlaying())
            {
                BattleStringExpandPlaceholdersToDisplayedString(gBattleStringsTable[5]);
                Contest_StartTextPrinter(&gWindowTemplate_Contest_MoveDescription, gDisplayedStringBattle, 144, 2, 15);
                gTasks[taskID].tLearnMoveState++;
            }
            break;
        case 2:
            if (gWindowTemplate_Contest_MoveDescription.state != 0)
                break;
            if (!IsSEPlaying())
            {
                BattleStringExpandPlaceholdersToDisplayedString(gBattleStringsTable[6]);
                Contest_StartTextPrinter(&gWindowTemplate_Contest_MoveDescription, gDisplayedStringBattle, 144, 2, 15);
                gTasks[taskID].tData9 = 5;
                gTasks[taskID].tdata10 = 9;
                gTasks[taskID].tLearnMoveState++;
            }
        case 3:
            if (gWindowTemplate_Contest_MoveDescription.state == 0 && !IsSEPlaying())
            {
                sub_8023A80();
                gTasks[taskID].tLearnMoveState++;
                sEvoCursorPos = 0;
                sub_802BC6C();
            }
            break;
        case 4:
            if (gMain.newKeys & DPAD_UP && sEvoCursorPos != 0)
            {
                PlaySE(SE_SELECT);
                nullsub_6();
                sEvoCursorPos = 0;
                sub_802BC6C();
            }
            if (gMain.newKeys & DPAD_DOWN && sEvoCursorPos == 0)
            {
                PlaySE(SE_SELECT);
                nullsub_6();
                sEvoCursorPos = 1;
                sub_802BC6C();
            }
            if (gMain.newKeys & A_BUTTON)
            {
                sub_8023AD8();
                BattleStringExpandPlaceholdersToDisplayedString(gBattleStringsTable[292]);
                Contest_StartTextPrinter(&gWindowTemplate_Contest_MoveDescription, gDisplayedStringBattle, 144, 2, 15);
                PlaySE(SE_SELECT);
                if (sEvoCursorPos != 0)
                    gTasks[taskID].tLearnMoveState = gTasks[taskID].tdata10;
                else
                {
                    gTasks[taskID].tLearnMoveState = gTasks[taskID].tData9;
                    if (gTasks[taskID].tLearnMoveState == 5)
                        BeginNormalPaletteFade(0xFFFFFFFF, 0, 0, 16, RGB(0, 0, 0));
                }
            }
            if (gMain.newKeys & B_BUTTON)
            {
                sub_8023AD8();
                BattleStringExpandPlaceholdersToDisplayedString(gBattleStringsTable[292]);
                Contest_StartTextPrinter(&gWindowTemplate_Contest_MoveDescription, gDisplayedStringBattle, 144, 2, 15);
                PlaySE(SE_SELECT);
                gTasks[taskID].tLearnMoveState = gTasks[taskID].tdata10;
            }
            break;
        case 5:
            if (!gPaletteFade.active)
            {
                ShowSelectMovePokemonSummaryScreen(gPlayerParty, gTasks[taskID].tPartyID,
                            gPlayerPartyCount - 1, CB2_EvolutionSceneLoadGraphics,
                            gMoveToLearn);
                gTasks[taskID].tLearnMoveState++;
            }
            break;
        case 6:
            if (!gPaletteFade.active && gMain.callback2 == CB2_EvolutionSceneUpdate)
            {
                var = sub_809FA30(); // moveID
                if (var == 4)
                    gTasks[taskID].tLearnMoveState = 9;
                else
                {
                    u16 move = GetMonData(mon, var + MON_DATA_MOVE1);
                    if (IsHMMove2(move))
                    {
                        BattleStringExpandPlaceholdersToDisplayedString(gBattleStringsTable[307]);
                        Contest_StartTextPrinter(&gWindowTemplate_Contest_MoveDescription,
                            gDisplayedStringBattle,
                            144,
                            2,
                            15);
                        gTasks[taskID].tLearnMoveState = 11;
                    }
                    else
                    {
                        gBattleTextBuff2[0] = 0xFD;
                        gBattleTextBuff2[1] = 2;
                        gBattleTextBuff2[2] = move;
                        gBattleTextBuff2[3] = (move & 0xFF00) >> 8;
                        gBattleTextBuff2[4] = EOS;
                        RemoveMonPPBonus(mon, var);
                        SetMonMoveSlot(mon, gMoveToLearn, var);
                        BattleStringExpandPlaceholdersToDisplayedString(gBattleStringsTable[207]);
                        Contest_StartTextPrinter(&gWindowTemplate_Contest_MoveDescription,
                            gDisplayedStringBattle,
                            144,
                            2,
                            15);
                        gTasks[taskID].tLearnMoveState++;
                    }
                }
            }
            break;
        case 7:
            if (gWindowTemplate_Contest_MoveDescription.state == 0 && !IsSEPlaying())
            {
                BattleStringExpandPlaceholdersToDisplayedString(gBattleStringsTable[7]);
                Contest_StartTextPrinter(&gWindowTemplate_Contest_MoveDescription, gDisplayedStringBattle, 144, 2, 15);
                gTasks[taskID].tLearnMoveState++;
            }
            break;
        case 8:
            if (gWindowTemplate_Contest_MoveDescription.state == 0 && !IsSEPlaying())
            {
                BattleStringExpandPlaceholdersToDisplayedString(gBattleStringsTable[208]);
                Contest_StartTextPrinter(&gWindowTemplate_Contest_MoveDescription, gDisplayedStringBattle, 144, 2, 15);
                gTasks[taskID].tState = 19;
            }
            break;
        case 9:
            BattleStringExpandPlaceholdersToDisplayedString(gBattleStringsTable[8]);
            Contest_StartTextPrinter(&gWindowTemplate_Contest_MoveDescription, gDisplayedStringBattle, 144, 2, 15);
            gTasks[taskID].tData9 = 10;
            gTasks[taskID].tdata10 = 0;
            gTasks[taskID].tLearnMoveState = 3;
            break;
        case 10:
            BattleStringExpandPlaceholdersToDisplayedString(gBattleStringsTable[9]);
            Contest_StartTextPrinter(&gWindowTemplate_Contest_MoveDescription, gDisplayedStringBattle, 144, 2, 15);
            gTasks[taskID].tState = 14;
            break;
        case 11:
            if (gWindowTemplate_Contest_MoveDescription.state == 0 && !IsSEPlaying())
                gTasks[taskID].tLearnMoveState = 5;
            break;
        }
        break;
    }
}

static void Task_TradeEvolutionScene(u8 taskID)
{
    u32 var;
    struct Pokemon* mon = (struct Pokemon*)(gTasks[taskID].tMonPtrLo | (gTasks[taskID].tMonPtrHi << 0x10));

    switch (gTasks[taskID].tState)
    {
    case 0:
        StringExpandPlaceholders(gStringVar4, BattleText_StartEvo);
        Contest_StartTextPrinter(&gUnknown_03004828->window,
            gStringVar4,
            gUnknown_03004828->textWindowBaseTileNum,
            2,
            15);
        gTasks[taskID].tState++;
        break;
    case 1:
        if (gUnknown_03004828->window.state == 0)
        {
            PlayCry1(gTasks[taskID].tPreEvoSpecies, 0);
            gTasks[taskID].tState++;
        }
        break;
    case 2:
        if (IsCryFinished())
        {
            m4aSongNumStop(MUS_EVOLUTION);
            PlaySE(MUS_EVOLUTION_INTRO);
            gTasks[taskID].tState++;
        }
        break;
    case 3:
        if (!IsSEPlaying())
        {
            PlayBGM(MUS_EVOLUTION);
            gTasks[taskID].tState++;
            BeginNormalPaletteFade(0x1C, 4, 0, 16, RGB(0, 0, 0));
        }
        break;
    case 4:
        if (!gPaletteFade.active)
        {
            REG_DISPCNT = DISPCNT_OBJ_ON | DISPCNT_BG0_ON | DISPCNT_BG1_ON | DISPCNT_OBJ_1D_MAP;
            sEvoGraphicsTaskID = LaunchTask_PreEvoSparklesSet1(17);
            gTasks[taskID].tState++;
        }
        break;
    case 5:
        if (!gTasks[sEvoGraphicsTaskID].isActive)
        {
            gTasks[taskID].tState++;
            sEvoInfo.field_3 = 1;
            sEvoGraphicsTaskID = LaunchTask_PreEvoSparklesSet2();
        }
        break;
    case 6:
        if (!gTasks[sEvoGraphicsTaskID].isActive)
        {
            sEvoGraphicsTaskID = sub_8149E7C(sEvoInfo.preEvoSpriteID, sEvoInfo.postEvoSpriteID);
            gTasks[taskID].tState++;
        }
        break;
    case 7:
        if (--sEvoInfo.field_3 == 0)
        {
            sEvoInfo.field_3 = 3;
            if (!gTasks[sEvoGraphicsTaskID].isActive)
                gTasks[taskID].tState++;
        }
        break;
    case 8:
        sEvoGraphicsTaskID = LaunchTask_PostEvoSparklesSet1();
        gTasks[taskID].tState++;
        break;
    case 9:
        if (!gTasks[sEvoGraphicsTaskID].isActive)
        {
            sEvoGraphicsTaskID = LaunchTask_PostEvoSparklesSet2AndFlash_Trade(gTasks[taskID].tPostEvoSpecies);
            gTasks[taskID].tState++;
        }
        break;
    case 10:
        if (!gTasks[sEvoGraphicsTaskID].isActive)
        {
            PlaySE(SE_EXP);
            gTasks[taskID].tState++;
        }
        break;
    case 11:
        if (IsSEPlaying())
        {
            PlayCry1(gTasks[taskID].tPostEvoSpecies, 0);
            memcpy(&gPlttBufferUnfaded[0x20], (void *)(EWRAM + 0x9000), 0x60);
            BeginNormalPaletteFade(0x1, 0, 16, 0, RGB(0, 0, 0));
            gTasks[taskID].tState++;
        }
        break;
    case 12:
        if (IsCryFinished() && !gPaletteFade.active)
        {
            StringExpandPlaceholders(gStringVar4, BattleText_FinishEvo);
            Contest_StartTextPrinter(&gUnknown_03004828->window,
                gStringVar4,
                gUnknown_03004828->textWindowBaseTileNum,
                2,
                15);
            PlayFanfare(MUS_EVOLVED);
            gTasks[taskID].tState++;
            SetMonData(mon, MON_DATA_SPECIES, (void*)(&gTasks[taskID].tPostEvoSpecies));
            CalculateMonStats(mon);
            EvolutionRenameMon(mon, gTasks[taskID].tPreEvoSpecies, gTasks[taskID].tPostEvoSpecies);
            GetSetPokedexFlag(SpeciesToNationalPokedexNum(gTasks[taskID].tPostEvoSpecies), 2);
            GetSetPokedexFlag(SpeciesToNationalPokedexNum(gTasks[taskID].tPostEvoSpecies), 3);
            IncrementGameStat(GAME_STAT_EVOLVED_POKEMON);
        }
        break;
    case 13:
        if (gUnknown_03004828->window.state == 0 && IsFanfareTaskInactive() == TRUE)
        {
            var = MonTryLearningNewMove(mon, gTasks[taskID].tLearnsFirstMove);
            if (var != 0 && !gTasks[taskID].tEvoWasStopped)
            {
                u8 text[20];

                gTasks[taskID].tBits |= TASK_BIT_LEARN_MOVE;
                gTasks[taskID].tLearnsFirstMove = FALSE;
                gTasks[taskID].tLearnMoveState = 0;
                GetMonData(mon, MON_DATA_NICKNAME, text);
                StringCopy10(gBattleTextBuff1, text);
                if (var == 0xFFFF)
                    gTasks[taskID].tState = 17;
                else if (var == 0xFFFE)
                    break;
                else
                    gTasks[taskID].tState = 15;
            }
            else
            {
                PlayBGM(MUS_EVOLUTION);
                Contest_StartTextPrinter(&gUnknown_03004828->window,
                    gOtherText_LinkStandby2,
                    gUnknown_03004828->textWindowBaseTileNum,
                    2,
                    15);
                gTasks[taskID].tState++;
            }
        }
        break;
    case 14:
        if (gUnknown_03004828->window.state == 0)
        {
            DestroyTask(taskID);
            SetMainCallback2(gCB2_AfterEvolution);
        }
        break;
    case 15:
        if (gUnknown_03004828->window.state == 0 && !IsSEPlaying())
        {
            sub_8024CEC();
            PlayFanfare(MUS_LEVEL_UP);
            BattleStringExpandPlaceholdersToDisplayedString(gBattleStringsTable[3]);
            Contest_StartTextPrinter(&gUnknown_03004828->window,
                gDisplayedStringBattle,
                gUnknown_03004828->textWindowBaseTileNum,
                2,
                15);
            gTasks[taskID].tLearnsFirstMove = 0x40; // re-used as a counter
            gTasks[taskID].tState++;
        }
        break;
    case 16:
        if (gUnknown_03004828->window.state == 0 && IsFanfareTaskInactive() == TRUE && --gTasks[taskID].tLearnsFirstMove == 0)
            gTasks[taskID].tState = 13;
        break;
    case 17:
        switch (gTasks[taskID].tLearnMoveState)
        {
        case 0:
            if (gUnknown_03004828->window.state == 0 && !IsSEPlaying())
            {
                sub_8024CEC();
                BattleStringExpandPlaceholdersToDisplayedString(gBattleStringsTable[4]);
                Contest_StartTextPrinter(&gUnknown_03004828->window,
                    gDisplayedStringBattle,
                    gUnknown_03004828->textWindowBaseTileNum,
                    2,
                    15);
                gTasks[taskID].tLearnMoveState++;
            }
            break;
        case 1:
            if (gUnknown_03004828->window.state == 0 && !IsSEPlaying())
            {
                BattleStringExpandPlaceholdersToDisplayedString(gBattleStringsTable[5]);
                Contest_StartTextPrinter(&gUnknown_03004828->window,
                    gDisplayedStringBattle,
                    gUnknown_03004828->textWindowBaseTileNum,
                    2,
                    15);
                gTasks[taskID].tLearnMoveState++;
            }
            break;
        case 2:
            if (gUnknown_03004828->window.state != 0)
                break;
            if (!IsSEPlaying())
            {
                BattleStringExpandPlaceholdersToDisplayedString(gBattleStringsTable[6]);
                Contest_StartTextPrinter(&gUnknown_03004828->window,
                    gDisplayedStringBattle,
                    gUnknown_03004828->textWindowBaseTileNum,
                    2,
                    15);
                gTasks[taskID].tData9 = 5;
                gTasks[taskID].tdata10 = 9;
                gTasks[taskID].tLearnMoveState++;
            }
        case 3:
            if (gUnknown_03004828->window.state == 0 && !IsSEPlaying())
            {
                TextWindow_DrawStdFrame(&gUnknown_03004828->window, 24, 8, 29, 13);
                sEvoCursorPos = 0;
                Text_InitWindow(&gUnknown_03004828->window, gOtherText_YesNoAndPlayer, gUnknown_03004828->textWindowBaseTileNum + 128, 25, 9);
                Text_PrintWindow8002F44(&gUnknown_03004828->window);
                MenuCursor_Create814A5C0(0, 0xFFFF, 0xC, 0x2D9F, 0x20);
                sub_81150D8();
                gTasks[taskID].tLearnMoveState++;
                sEvoCursorPos = 0;
            }
            break;
        case 4:
            if (gMain.newKeys & DPAD_UP && sEvoCursorPos != 0)
            {
                PlaySE(SE_SELECT);
                EvoDummyFunc2();
                sEvoCursorPos = 0;
                sub_81150D8();
            }
            if (gMain.newKeys & DPAD_DOWN && sEvoCursorPos == 0)
            {
                PlaySE(SE_SELECT);
                EvoDummyFunc2();
                sEvoCursorPos = 1;
                sub_81150D8();
            }
            if (gMain.newKeys & A_BUTTON)
            {
                Text_EraseWindowRect(&gUnknown_03004828->window, 0x18, 8, 0x1D, 0xD);
                DestroyMenuCursor();
                BattleStringExpandPlaceholdersToDisplayedString(gBattleStringsTable[292]);
                Contest_StartTextPrinter(&gUnknown_03004828->window,
                    gDisplayedStringBattle,
                    gUnknown_03004828->textWindowBaseTileNum,
                    2,
                    15);
                PlaySE(SE_SELECT);
                if (sEvoCursorPos != 0)
                    gTasks[taskID].tLearnMoveState = gTasks[taskID].tdata10;
                else
                {
                    gTasks[taskID].tLearnMoveState = gTasks[taskID].tData9;
                    if (gTasks[taskID].tLearnMoveState == 5)
                        BeginNormalPaletteFade(0xFFFFFFFF, 0, 0, 16, RGB(0, 0, 0));
                }
            }
            if (gMain.newKeys & B_BUTTON)
            {
                Text_EraseWindowRect(&gUnknown_03004828->window, 0x18, 8, 0x1D, 0xD);
                DestroyMenuCursor();
                BattleStringExpandPlaceholdersToDisplayedString(gBattleStringsTable[292]);
                Contest_StartTextPrinter(&gUnknown_03004828->window,
                    gDisplayedStringBattle,
                    gUnknown_03004828->textWindowBaseTileNum,
                    2,
                    15);
                PlaySE(SE_SELECT);
                gTasks[taskID].tLearnMoveState = gTasks[taskID].tdata10;
            }
            break;
        case 5:
            if (!gPaletteFade.active)
            {
                ShowSelectMovePokemonSummaryScreen(gPlayerParty, gTasks[taskID].tPartyID,
                            gPlayerPartyCount - 1, CB2_TradeEvolutionSceneLoadGraphics,
                            gMoveToLearn);
                gTasks[taskID].tLearnMoveState++;
            }
            break;
        case 6:
            if (!gPaletteFade.active && gMain.callback2 == CB2_TradeEvolutionSceneUpdate)
            {
                var = sub_809FA30(); // moveID
                if (var == 4)
                    gTasks[taskID].tLearnMoveState = 9;
                else
                {
                    u16 move = GetMonData(mon, var + MON_DATA_MOVE1);
                    if (IsHMMove2(move))
                    {
                        BattleStringExpandPlaceholdersToDisplayedString(gBattleStringsTable[307]);
                        Contest_StartTextPrinter(&gUnknown_03004828->window,
                            gDisplayedStringBattle,
                            gUnknown_03004828->textWindowBaseTileNum,
                            2,
                            15);
                        gTasks[taskID].tLearnMoveState = 11;
                    }
                    else
                    {
                        gBattleTextBuff2[0] = 0xFD;
                        gBattleTextBuff2[1] = 2;
                        gBattleTextBuff2[2] = move;
                        gBattleTextBuff2[3] = (move & 0xFF00) >> 8;
                        gBattleTextBuff2[4] = EOS;
                        RemoveMonPPBonus(mon, var);
                        SetMonMoveSlot(mon, gMoveToLearn, var);
                        BattleStringExpandPlaceholdersToDisplayedString(gBattleStringsTable[207]);
                        Contest_StartTextPrinter(&gUnknown_03004828->window,
                            gDisplayedStringBattle,
                            gUnknown_03004828->textWindowBaseTileNum,
                            2,
                            15);
                        gTasks[taskID].tLearnMoveState++;
                    }
                }
            }
            break;
        case 7:
            if (gUnknown_03004828->window.state == 0 && !IsSEPlaying())
            {
                BattleStringExpandPlaceholdersToDisplayedString(gBattleStringsTable[7]);
                Contest_StartTextPrinter(&gUnknown_03004828->window,
                    gDisplayedStringBattle,
                    gUnknown_03004828->textWindowBaseTileNum,
                    2,
                    15);
                gTasks[taskID].tLearnMoveState++;
            }
            break;
        case 8:
            if (gUnknown_03004828->window.state == 0 && !IsSEPlaying())
            {
                BattleStringExpandPlaceholdersToDisplayedString(gBattleStringsTable[208]);
                Contest_StartTextPrinter(&gUnknown_03004828->window,
                    gDisplayedStringBattle,
                    gUnknown_03004828->textWindowBaseTileNum,
                    2,
                    15);
                gTasks[taskID].tState = 15;
            }
            break;
        case 9:
            BattleStringExpandPlaceholdersToDisplayedString(gBattleStringsTable[8]);
            Contest_StartTextPrinter(&gUnknown_03004828->window,
                gDisplayedStringBattle,
                gUnknown_03004828->textWindowBaseTileNum,
                2,
                15);
            gTasks[taskID].tData9 = 10;
            gTasks[taskID].tdata10 = 0;
            gTasks[taskID].tLearnMoveState = 3;
            break;
        case 10:
            BattleStringExpandPlaceholdersToDisplayedString(gBattleStringsTable[9]);
            Contest_StartTextPrinter(&gUnknown_03004828->window,
                gDisplayedStringBattle,
                gUnknown_03004828->textWindowBaseTileNum,
                2,
                15);
            gTasks[taskID].tState = 13;
            break;
        case 11:
            if (gUnknown_03004828->window.state == 0 && !IsSEPlaying())
                gTasks[taskID].tLearnMoveState = 5;
            break;
        }
        break;
    }
}

/*
DizzyEgg, 27.08.2017
NOTE:
    Functions below are all unused.
    What's more, they do NOT exist in Emerald.
    That's why I think there is no reason to decompile those,
    as they probably were prototypes for the evolution
    functions.
*/

void unref_sub_8113B50(u8 *a, u8 *b)
{
    int r6, sp8, r3, r8;
    int spC = 0;
    int sp10 = 0;
    int sp14, r3_2;
    u8 *r2;

    for (sp8 = 0; sp8 < 64; sp8++)
    {
        sEvoInfo.unk84[sp8] = 0;
        sEvoInfo.unk4[sp8] = 0;
        sEvoInfo.unk44[sp8] = 0;
        for (r6 = 0; r6 < 32; r6++)
        {
            sEvoInfo.unk10C4[sp8][r6] = 0;
            sEvoInfo.unk18C4[sp8][r6] = 0;
            sEvoInfo.unk20C4[sp8][r6] = 0;
            sEvoInfo.unk28C4[sp8][r6] = 0;
            sEvoInfo.unkC4[sp8][r6] = 0;
            sEvoInfo.unk8C4[sp8][r6] = 0;
            sEvoInfo.unk30C4[sp8][r6] = 0;
            sEvoInfo.unk38C4[sp8][r6] = 0;

            sEvoInfo.unk60C4[sp8][r6] = 0;
            sEvoInfo.unk70C4[sp8][r6] = 0;
            sEvoInfo.unk80C4[sp8][r6] = 0;
            sEvoInfo.unk90C4[sp8][r6] = 0;
        }
    }
    sEvoInfo.unkA0C4 = 64;

    r8 = 0;
    for (sp8 = 0; sp8 < 64; sp8++)
    {
        r3 = 0;
        r2 = a + r8;
        for (r6 = 0; r6 < 64; r6++)
        {
            sEvoInfo.unk40C4[sp8][r6 >> 1] = r2;
            switch (r3)
            {
            case 0:
                switch (r6 & 1)
                {
                case 0:
                    if (*r2 & 0xF)
                    {
                        sEvoInfo.unk10C4[sp8][sEvoInfo.unk4[sp8]] = r6;
                        r3 = 1;
                    }
                    break;
                case 1:
                    if (*r2 & 0xF0)
                    {
                        sEvoInfo.unk10C4[sp8][sEvoInfo.unk4[sp8]] = r6;
                        r3 = 1;
                    }
                    break;
                }
                break;
            case 1:
                switch (r6 & 1)
                {
                case 0:
                    if ((*r2 & 0xF) == 0)
                    {
                        sEvoInfo.unk18C4[sp8][sEvoInfo.unk4[sp8]] = r6 - 1;
                        sEvoInfo.unk4[sp8]++;
                        r3 = 0;
                    }
                    break;
                case 1:
                    if ((*r2 & 0xF0) == 0)
                    {
                        sEvoInfo.unk18C4[sp8][sEvoInfo.unk4[sp8]] = r6 - 1;
                        sEvoInfo.unk4[sp8]++;
                        r3 = 0;
                    }
                    break;
                }
                break;
            }
            if (((r6 + 1) & 7) == 0)
                r2 += 0x1D;
            else if (r6 & 1)
                r2++;
        }
        if (r3)
        {
            sEvoInfo.unk18C4[sp8][sEvoInfo.unk4[sp8]] = r6;
            sEvoInfo.unk4[sp8]++;
        }
        if (((sp8 + 1) & 7) == 0)
            r8 += 0xE4;
        else
            r8 += 4;
    }
    r8 = 0;
    for (sp8 = 0; sp8 < 64; sp8++)
    {
        r3 = 0;
        r2 = b + r8;
        for (r6 = 0; r6 < 64; r6++)
        {
            switch (r3)
            {
            case 0:
                switch (r6 & 1)
                {
                case 0:
                    if (*r2 & 0xF)
                    {
                        sEvoInfo.unk20C4[sp8][sEvoInfo.unk44[sp8]] = r6;
                        r3 = 1;
                    }
                    break;
                case 1:
                    if (*r2 & 0xF0)
                    {
                        sEvoInfo.unk20C4[sp8][sEvoInfo.unk44[sp8]] = r6;
                        r3 = 1;
                    }
                    break;
                }
                break;
            case 1:
                switch (r6 & 1)
                {
                case 0:
                    if ((*r2 & 0xF) == 0)
                    {
                        sEvoInfo.unk28C4[sp8][sEvoInfo.unk44[sp8]] = r6 - 1;
                        sEvoInfo.unk44[sp8]++;
                        r3 = 0;
                    }
                    break;
                case 1:
                    if ((*r2 & 0xF0) == 0)
                    {
                        sEvoInfo.unk28C4[sp8][sEvoInfo.unk44[sp8]] = r6 - 1;
                        sEvoInfo.unk44[sp8]++;
                        r3 = 0;
                    }
                    break;
                }
                break;
            }
            if (((r6 + 1) & 7) == 0)
                r2 += 0x1D;
            else if (r6 & 1)
                r2++;
        }
        if (r3)
        {
            sEvoInfo.unk28C4[sp8][sEvoInfo.unk44[sp8]] = r6;
            sEvoInfo.unk44[sp8]++;
        }
        if (((sp8 + 1) & 7) == 0)
            r8 += 0xE4;
        else
            r8 += 4;
    }

    for (sp8 = 0; sp8 < 64; sp8++)
    {
        if (sEvoInfo.unk4[sp8] < sEvoInfo.unk44[sp8])
        {
            for (spC = 0; spC < sEvoInfo.unk4[sp8]; spC++)
            {
                sp14 = 256;
                for (r6 = 0; r6 < sEvoInfo.unk44[sp8]; r6++)
                {
                    if (sEvoInfo.unk10C4[sp8][spC] > sEvoInfo.unk20C4[sp8][r6])
                        r3_2 = sEvoInfo.unk10C4[sp8][spC] - sEvoInfo.unk20C4[sp8][r6];
                    else
                        r3_2 = sEvoInfo.unk20C4[sp8][r6] - sEvoInfo.unk10C4[sp8][spC];
                    if (sEvoInfo.unk18C4[sp8][spC] > sEvoInfo.unk28C4[sp8][r6])
                        r3_2 += (sEvoInfo.unk18C4[sp8][spC] - sEvoInfo.unk28C4[sp8][r6]);
                    else
                        r3_2 += (sEvoInfo.unk28C4[sp8][r6] - sEvoInfo.unk18C4[sp8][spC]);
                    if ((sp14 > r3_2) && (sEvoInfo.unkC4[sp8][r6] == 0) && (sEvoInfo.unk8C4[sp8][r6] == 0))
                    {
                        sp10 = r6;
                        sp14 = r3_2;
                    }
                }
                sub_81141F0(spC, sp10, sp8);
            }
            for (r6 = 0; r6 < sEvoInfo.unk44[sp8]; r6++)
            {
                if ((sEvoInfo.unkC4[sp8][r6] == 0) && (sEvoInfo.unk8C4[sp8][r6] == 0))
                    sub_811430C(r6, sp8);
            }
        }
        if (sEvoInfo.unk4[sp8] == sEvoInfo.unk44[sp8])
        {
            for (r6 = 0; r6 < sEvoInfo.unk4[sp8]; r6++)
                sub_81141F0(r6, r6, sp8);
        }
        if (sEvoInfo.unk4[sp8] > sEvoInfo.unk44[sp8])
        {
            for (sp10 = 0; sp10 < sEvoInfo.unk44[sp8]; sp10++)
            {
                sp14 = 256;
                for (r6 = 0; r6 < sEvoInfo.unk4[sp8]; r6++)
                {
                    if (sEvoInfo.unk10C4[sp8][r6] > sEvoInfo.unk20C4[sp8][sp10])
                        r3_2 = sEvoInfo.unk10C4[sp8][r6] - sEvoInfo.unk20C4[sp8][sp10];
                    else
                        r3_2 = sEvoInfo.unk20C4[sp8][sp10] - sEvoInfo.unk10C4[sp8][r6];
                    if (sEvoInfo.unk18C4[sp8][r6] > sEvoInfo.unk28C4[sp8][sp10])
                        r3_2 += (sEvoInfo.unk18C4[sp8][r6] - sEvoInfo.unk28C4[sp8][sp10]);
                    else
                        r3_2 += (sEvoInfo.unk28C4[sp8][sp10] - sEvoInfo.unk18C4[sp8][r6]);
                    if ((sp14 > r3_2) && (sEvoInfo.unkC4[sp8][r6] == 0))
                    {
                        spC = r6;
                        sp14 = r3_2;
                    }
                }
                sEvoInfo.unk30C4[sp8][spC] = sEvoInfo.unk20C4[sp8][sp10];
                sEvoInfo.unk38C4[sp8][spC] = sEvoInfo.unk28C4[sp8][sp10];
                sEvoInfo.unkC4[sp8][spC] = 1;
            }
            for (r6 = 0; r6 < sEvoInfo.unk4[sp8]; r6++)
            {
                sEvoInfo.unk20C4[sp8][r6] = sEvoInfo.unk30C4[sp8][r6];
                sEvoInfo.unk28C4[sp8][r6] = sEvoInfo.unk38C4[sp8][r6];
                if (sEvoInfo.unkC4[sp8][r6])
                {
                    sEvoInfo.unkC4[sp8][r6] = 0;
                    sub_81141F0(r6, r6, sp8);
                }
                else
                {
                    sEvoInfo.unk20C4[sp8][r6] = sEvoInfo.unk28C4[sp8][r6] = sEvoInfo.unk10C4[sp8][r6] + ((sEvoInfo.unk18C4[sp8][r6] - sEvoInfo.unk10C4[sp8][r6]) / 2);
                    sEvoInfo.unk28C4[sp8][r6]--;
                    sub_81141F0(r6, r6, sp8);
                }
            }
        }
    }
}

void sub_81141F0(int a, int b, s32 c)
{
    int r7;

    sEvoInfo.unk30C4[c][b] = sEvoInfo.unk10C4[c][a];
    sEvoInfo.unk38C4[c][b] = sEvoInfo.unk18C4[c][a];

    r7 = 0;
    if (sEvoInfo.unk10C4[c][a] < sEvoInfo.unk20C4[c][b])
    {
        sEvoInfo.unkC4[c][b] = 4;
        r7 = sEvoInfo.unk20C4[c][b] - sEvoInfo.unk10C4[c][a];
    }
    else if (sEvoInfo.unk10C4[c][a] > sEvoInfo.unk20C4[c][b])
    {
        sEvoInfo.unkC4[c][b] = 1;
        r7 = sEvoInfo.unk10C4[c][a] - sEvoInfo.unk20C4[c][b];
    }
    sEvoInfo.unk80C4[c][b] = r7 << 4;

    r7 = 0;
    if (sEvoInfo.unk18C4[c][a] < sEvoInfo.unk28C4[c][b])
    {
        sEvoInfo.unk8C4[c][b] = 3;
        r7 = sEvoInfo.unk28C4[c][b] - sEvoInfo.unk18C4[c][a];
    }
    else if (sEvoInfo.unk18C4[c][a] > sEvoInfo.unk28C4[c][b])
    {
        sEvoInfo.unk8C4[c][b] = 2;
        r7 = sEvoInfo.unk18C4[c][a] - sEvoInfo.unk28C4[c][b];
    }
    sEvoInfo.unk90C4[c][b] = r7 << 4;

    sEvoInfo.unk84[c]++;
}

void sub_811430C(int a, int b)
{
    int r7 = sEvoInfo.unk28C4[b][a] - sEvoInfo.unk20C4[b][a];

    sEvoInfo.unk30C4[b][a] = sEvoInfo.unk38C4[b][a] = sEvoInfo.unk20C4[b][a] + r7 / 2;
    sEvoInfo.unkC4[b][a] = 5;
    sEvoInfo.unk8C4[b][a] = 7;
    sEvoInfo.unk84[b]++;
    r7 = sEvoInfo.unk30C4[b][a] - sEvoInfo.unk20C4[b][a];
    sEvoInfo.unk80C4[b][a] = r7 << 4;
    r7 = sEvoInfo.unk28C4[b][a] - sEvoInfo.unk38C4[b][a];
    sEvoInfo.unk90C4[b][a] = r7 << 4;
}

u8 unref_sub_81143CC(void)
{
    int x, y, i, var0;
    u8 ret = 1;

    if (sEvoInfo.unkA0C4)
        sEvoInfo.unkA0C4--;

    for (y = 0; y < 64; y++)
    {
        for (x = 0; x < sEvoInfo.unk84[y]; x++)
        {
            switch (sEvoInfo.unkC4[y][x])
            {
            case 0:
                break;
            case 1:
                ret = 0;
                sEvoInfo.unk60C4[y][x] += sEvoInfo.unk80C4[y][x];
                var0 = (sEvoInfo.unk60C4[y][x] & 0xFF00) >> 8;
                sEvoInfo.unk60C4[y][x] &= 0xFF;
                for (i = 0; i < var0; i++)
                {
                    sEvoInfo.unk30C4[y][x]--;
                    sub_8114DB4(y, sEvoInfo.unk30C4[y][x]);
                    if (sEvoInfo.unk30C4[y][x] == sEvoInfo.unk20C4[y][x])
                    {
                        sEvoInfo.unkC4[y][x] = 0;
                        break;
                    }
                }
                break;
            case 2:
                ret = 0;
                sEvoInfo.unk60C4[y][x] += sEvoInfo.unk80C4[y][x];
                var0 = (sEvoInfo.unk60C4[y][x] & 0xFF00) >> 8;
                sEvoInfo.unk60C4[y][x] &= 0xFF;
                for (i = 0; i < var0; i++)
                {
                    if (sEvoInfo.unk30C4[y][x] == sEvoInfo.unk20C4[y][x])
                    {
                        sEvoInfo.unkC4[y][x] = 0;
                        break;
                    }
                    else
                    {
                        sub_8114DF0(y, sEvoInfo.unk30C4[y][x]);
                        sEvoInfo.unk30C4[y][x]--;
                    }
                }
                break;
            case 3:
                ret = 0;
                sEvoInfo.unk60C4[y][x] += sEvoInfo.unk80C4[y][x];
                var0 = (sEvoInfo.unk60C4[y][x] & 0xFF00) >> 8;
                sEvoInfo.unk60C4[y][x] &= 0xFF;
                for (i = 0; i < var0; i++)
                {
                    sEvoInfo.unk30C4[y][x]++;
                    sub_8114DB4(y, sEvoInfo.unk30C4[y][x]);
                    if (sEvoInfo.unk30C4[y][x] == sEvoInfo.unk20C4[y][x])
                    {
                        sEvoInfo.unkC4[y][x] = 0;
                        break;
                    }
                }
                break;
            case 4:
                ret = 0;
                sEvoInfo.unk60C4[y][x] += sEvoInfo.unk80C4[y][x];
                var0 = (sEvoInfo.unk60C4[y][x] & 0xFF00) >> 8;
                sEvoInfo.unk60C4[y][x] &= 0xFF;
                for (i = 0; i < var0; i++)
                {
                    if (sEvoInfo.unk30C4[y][x] == sEvoInfo.unk20C4[y][x])
                    {
                        sEvoInfo.unkC4[y][x] = 0;
                        break;
                    }
                    else
                    {
                        sub_8114DF0(y, sEvoInfo.unk30C4[y][x]);
                        sEvoInfo.unk30C4[y][x]++;
                    }
                }
                break;
            case 5:
                ret = 0;
                if (sub_8114E48(y, sEvoInfo.unk30C4[y][x]))
                    sEvoInfo.unkC4[y][x] = 9;
                break;
            case 6:
                ret = 0;
                if (sub_8114E48(y, sEvoInfo.unk30C4[y][x]))
                    sEvoInfo.unkC4[y][x] = 10;
                break;
            case 7:
                ret = 0;
                if (sub_8114E48(y, sEvoInfo.unk30C4[y][x]))
                    sEvoInfo.unkC4[y][x] = 11;
                break;
            case 8:
                ret = 0;
                if (sub_8114E48(y, sEvoInfo.unk30C4[y][x]))
                    sEvoInfo.unkC4[y][x] = 12;
                break;
            case 9:
                ret = 0;
                sub_8114DB4(y, sEvoInfo.unk30C4[y][x]);
                if (sEvoInfo.unk30C4[y][x] == sEvoInfo.unk20C4[y][x])
                    sEvoInfo.unkC4[y][x] = 0;
                else
                    sEvoInfo.unkC4[y][x] = 1;
                break;
            case 10:
                ret = 0;
                sub_8114DF0(y, sEvoInfo.unk30C4[y][x]);
                if (sEvoInfo.unk30C4[y][x] == sEvoInfo.unk20C4[y][x])
                    sEvoInfo.unkC4[y][x] = 0;
                else
                    sEvoInfo.unkC4[y][x] = 2;
                break;
            case 11:
                ret = 0;
                sub_8114DB4(y, sEvoInfo.unk30C4[y][x]);
                if (sEvoInfo.unk30C4[y][x] == sEvoInfo.unk20C4[y][x])
                    sEvoInfo.unkC4[y][x] = 0;
                else
                    sEvoInfo.unkC4[y][x] = 3;
                break;
            case 12:
                ret = 0;
                sub_8114DF0(y, sEvoInfo.unk30C4[y][x]);
                if (sEvoInfo.unk30C4[y][x] == sEvoInfo.unk20C4[y][x])
                    sEvoInfo.unkC4[y][x] = 0;
                else
                    sEvoInfo.unkC4[y][x] = 4;
                break;
            }

            switch (sEvoInfo.unk8C4[y][x])
            {
            case 0:
                break;
            case 1:
                ret = 0;
                sEvoInfo.unk70C4[y][x] += sEvoInfo.unk90C4[y][x];
                var0 = (sEvoInfo.unk70C4[y][x] & 0xFF00) >> 8;
                sEvoInfo.unk70C4[y][x] &= 0xFF;
                for (i = 0; i < var0; i++)
                {
                    sEvoInfo.unk38C4[y][x]--;
                    sub_8114DB4(y, sEvoInfo.unk38C4[y][x]);
                    if (sEvoInfo.unk38C4[y][x] == sEvoInfo.unk28C4[y][x])
                    {
                        sEvoInfo.unk8C4[y][x] = 0;
                        break;
                    }
                }
                break;
            case 2:
                ret = 0;
                sEvoInfo.unk70C4[y][x] += sEvoInfo.unk90C4[y][x];
                var0 = (sEvoInfo.unk70C4[y][x] & 0xFF00) >> 8;
                sEvoInfo.unk70C4[y][x] &= 0xFF;
                for (i = 0; i < var0; i++)
                {
                    if (sEvoInfo.unk38C4[y][x] == sEvoInfo.unk28C4[y][x])
                    {
                        sEvoInfo.unk8C4[y][x] = 0;
                        break;
                    }
                    else
                    {
                        sub_8114DF0(y, sEvoInfo.unk38C4[y][x]);
                        sEvoInfo.unk38C4[y][x]--;
                    }
                }
                break;
            case 3:
                ret = 0;
                sEvoInfo.unk70C4[y][x] += sEvoInfo.unk90C4[y][x];
                var0 = (sEvoInfo.unk70C4[y][x] & 0xFF00) >> 8;
                sEvoInfo.unk70C4[y][x] &= 0xFF;
                for (i = 0; i < var0; i++)
                {
                    sEvoInfo.unk38C4[y][x]++;
                    sub_8114DB4(y, sEvoInfo.unk38C4[y][x]);
                    if (sEvoInfo.unk38C4[y][x] == sEvoInfo.unk28C4[y][x])
                    {
                        sEvoInfo.unk8C4[y][x] = 0;
                        break;
                    }
                }
                break;
            case 4:
                ret = 0;
                sEvoInfo.unk70C4[y][x] += sEvoInfo.unk90C4[y][x];
                var0 = (sEvoInfo.unk70C4[y][x] & 0xFF00) >> 8;
                sEvoInfo.unk70C4[y][x] &= 0xFF;
                for (i = 0; i < var0; i++)
                {
                    if (sEvoInfo.unk38C4[y][x] == sEvoInfo.unk28C4[y][x])
                    {
                        sEvoInfo.unk8C4[y][x] = 0;
                        break;
                    }
                    else
                    {
                        sub_8114DF0(y, sEvoInfo.unk38C4[y][x]);
                        sEvoInfo.unk38C4[y][x]++;
                    }
                }
                break;
            case 5:
                ret = 0;
                if (sub_8114E48(y, sEvoInfo.unk38C4[y][x]))
                    sEvoInfo.unk8C4[y][x] = 9;
                break;
            case 6:
                ret = 0;
                if (sub_8114E48(y, sEvoInfo.unk38C4[y][x]))
                    sEvoInfo.unk8C4[y][x] = 10;
                break;
            case 7:
                ret = 0;
                if (sub_8114E48(y, sEvoInfo.unk38C4[y][x]))
                    sEvoInfo.unk8C4[y][x] = 11;
                break;
            case 8:
                ret = 0;
                if (sub_8114E48(y, sEvoInfo.unk38C4[y][x]))
                    sEvoInfo.unk8C4[y][x] = 12;
                break;
            case 9:
                ret = 0;
                sub_8114DB4(y, sEvoInfo.unk38C4[y][x]);
                if (sEvoInfo.unk38C4[y][x] == sEvoInfo.unk28C4[y][x])
                    sEvoInfo.unk8C4[y][x] = 0;
                else
                    sEvoInfo.unk8C4[y][x] = 1;
                break;
            case 10:
                ret = 0;
                sub_8114DF0(y, sEvoInfo.unk38C4[y][x]);
                if (sEvoInfo.unk38C4[y][x] == sEvoInfo.unk28C4[y][x])
                    sEvoInfo.unk8C4[y][x] = 0;
                else
                    sEvoInfo.unk8C4[y][x] = 2;
                break;
            case 11:
                ret = 0;
                sub_8114DB4(y, sEvoInfo.unk38C4[y][x]);
                if (sEvoInfo.unk38C4[y][x] == sEvoInfo.unk28C4[y][x])
                    sEvoInfo.unk8C4[y][x] = 0;
                else
                    sEvoInfo.unk8C4[y][x] = 3;
                break;
            case 12:
                ret = 0;
                sub_8114DF0(y, sEvoInfo.unk38C4[y][x]);
                if (sEvoInfo.unk38C4[y][x] == sEvoInfo.unk28C4[y][x])
                    sEvoInfo.unk8C4[y][x] = 0;
                else
                    sEvoInfo.unk8C4[y][x] = 4;
                break;
            }
        }
    }
    return ret;
}

void sub_8114DB4(int a, u8 b)
{
    u8 *r2 = sEvoInfo.unk40C4[a][b >> 1];

    if (b & 1)
        *r2 |= 0xF0;
    else
        *r2 |= 0x0F;
}

void sub_8114DF0(int a, u8 b)
{
    u8 *r2 = sEvoInfo.unk40C4[a][b >> 1];
    u8 *r1 = sEvoInfo.unk40C4[a][b >> 1] + 0x6000;

    if (b & 1)
    {
        if ((*r1 & 0xF0) == 0)
            *r2 &= 0x0F;
    }
    else
    {
        if ((*r1 & 0x0F) == 0)
            *r2 &= 0xF0;
    }
}

u8 sub_8114E48(u32 a, u8 b)
{
    int i;
    s8 r2, r3;
    u8 *r1;
    if (sEvoInfo.unkA0C4 == 0)
        return 1;

    r2 = 0;
    for (i = 0; i < 32; i++)
    {
        if (a == 0)
        {
            r2++;
            break;
        }
        if ((sEvoInfo.unkC4[a - 1][i]) || (sEvoInfo.unk8C4[a - 1][i]))
            break;
    }
    if (i == 32)
        r2++;
    for (i = 0; i < 32; i++)
    {
        if (a == 63)
        {
            r2++;
            break;
        }
        if ((sEvoInfo.unkC4[a + 1][i]) || (sEvoInfo.unk8C4[a + 1][i]))
            break;
    }

    if (i == 32)
        r2++;
    if (r2 == 2)
        return 1;

    r2 = b - 2;
    if (r2 < 0)
        r2 = 0;

    r3 = b + 2;
    if (r3 > 63)
        r3 = 63;

    for (i = r2; i < r3; i++)
    {
        if (a == 0)
            break;
        r1 = sEvoInfo.unk40C4[a - 1][i >> 1];
        if (i & 1)
        {
            if (r1[0] & 0xf0)
                return 1;
        }
        else
        {
            if (r1[0] & 0x0f)
                return 1;
        }
    }

    for (i = r2; i < r3; i++)
    {
        if (a == 63)
            break;
        r1 = sEvoInfo.unk40C4[a + 1][i >> 1];
        if (i & 1)
        {
            if (r1[0] & 0xf0)
                return 1;
        }
        else
        {
            if (r1[0] & 0x0f)
                return 1;
        }
    }
    return 0;
}

// Functions below are vblank callbacks and are used

static void EvoDummyFunc(void)
{

}

static void VBlankCB_EvolutionScene(void)
{
    REG_BG0CNT = BGCNT_SCREENBASE(24) | BGCNT_16COLOR | BGCNT_TXT256x256 | BGCNT_AFF512x512 | BGCNT_PRIORITY(3); // 0x9803
    REG_BG0HOFS = gBattle_BG0_X;
    REG_BG0VOFS = gBattle_BG0_Y;
    REG_BG1HOFS = gBattle_BG1_X;
    REG_BG1VOFS = gBattle_BG1_Y;
    REG_BG2HOFS = gBattle_BG2_X;
    REG_BG2VOFS = gBattle_BG2_Y;
    REG_BG3HOFS = gBattle_BG3_X;
    REG_BG3VOFS = gBattle_BG3_Y;
    LoadOam();
    ProcessSpriteCopyRequests();
    TransferPlttBuffer();
    ScanlineEffect_InitHBlankDmaTransfer();
}

static void VBlankCB_TradeEvolutionScene(void)
{
    REG_BG0HOFS = gBattle_BG0_X;
    REG_BG0VOFS = gBattle_BG0_Y;
    REG_BG1HOFS = gBattle_BG1_X;
    REG_BG1VOFS = gBattle_BG1_Y;
    REG_BG2HOFS = gBattle_BG2_X;
    REG_BG2VOFS = gBattle_BG2_Y;
    REG_BG3HOFS = gBattle_BG3_X;
    REG_BG3VOFS = gBattle_BG3_Y;
    LoadOam();
    ProcessSpriteCopyRequests();
    TransferPlttBuffer();
    ScanlineEffect_InitHBlankDmaTransfer();
}

static void sub_81150D8(void)
{
    MenuCursor_SetPos814A880(200, 72 + (sEvoCursorPos * 16));
}

static void EvoDummyFunc2(void)
{

}
