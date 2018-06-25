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
bool32 IsHMMove2(u16 move);

extern struct Window gUnknown_03004210;
extern u8 gBattleTerrain;
extern u8 gReservedSpritePaletteCount;
extern u16 gMoveToLearn;
extern struct SpriteTemplate gUnknown_02024E8C;
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
#define tMonPtrHI           data[1]
#define tMonPtrLO           data[2]
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

            mon = (struct Pokemon*)(gTasks[taskID].tMonPtrHI | (gTasks[taskID].tMonPtrLO << 0x10));
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
    gTasks[taskID].tMonPtrHI = (u32)(mon);
    gTasks[taskID].tMonPtrLO = (u32)(mon) >> 0x10;
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

    Text_InitWindowWithTemplate(&gUnknown_03004210, &gWindowTemplate_81E6C58);
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
                             (void*)(0x2000000),
                             gUnknown_081FAF4C[1], currSpecies);
    pokePal = (void*) GetMonSpritePalStructFromOtIdPersonality(currSpecies, TiD, PiD);
    LoadCompressedPalette(*pokePal, 0x110, 0x20);

    GetMonSpriteTemplate_803C56C(currSpecies, 1);
    gUnknown_02024E8C.affineAnims = gDummySpriteAffineAnimTable;
    sEvoInfo.preEvoSpriteID = ID = CreateSprite(&gUnknown_02024E8C, 120, 64, 30);

    gSprites[ID].callback = nullsub_37;
    gSprites[ID].oam.paletteNum = 1;
    gSprites[ID].invisible = 1;

    // postEvo sprite
    DecompressPicFromTable_2(&gMonFrontPicTable[speciesToEvolve],
                             gMonFrontPicCoords[speciesToEvolve].coords,
                             gMonFrontPicCoords[speciesToEvolve].y_offset,
                             (void*)(0x2000000),
                             gUnknown_081FAF4C[3], speciesToEvolve);
    pokePal = (void*) GetMonSpritePalStructFromOtIdPersonality(speciesToEvolve, TiD, PiD);
    LoadCompressedPalette(*pokePal, 0x120, 0x20);

    GetMonSpriteTemplate_803C56C(speciesToEvolve, 3);
    gUnknown_02024E8C.affineAnims = gDummySpriteAffineAnimTable;
    sEvoInfo.postEvoSpriteID = ID = CreateSprite(&gUnknown_02024E8C, 120, 64, 30);
    gSprites[ID].callback = nullsub_37;
    gSprites[ID].oam.paletteNum = 2;
    gSprites[ID].invisible = 1;

    LoadEvoSparkleSpriteAndPal();

    sEvoInfo.evoTaskID = ID = CreateTask(Task_EvolutionScene, 0);
    gTasks[ID].tState = 0;
    gTasks[ID].tPreEvoSpecies = currSpecies;
    gTasks[ID].tPostEvoSpecies = speciesToEvolve;
    gTasks[ID].tMonPtrHI = (u32)(mon);
    gTasks[ID].tMonPtrLO = (u32)(mon) >> 0x10;
    gTasks[ID].tCanStop = canStopEvo;
    gTasks[ID].tLearnsFirstMove = TRUE;
    gTasks[ID].tEvoWasStopped = FALSE;
    gTasks[ID].tPartyID = partyID;

    memcpy(ewram9000_hack, &gPlttBufferUnfaded[0x20], 0x60);

    REG_DISPCNT = DISPCNT_OBJ_ON | DISPCNT_BG_ALL_ON | DISPCNT_OBJ_1D_MAP;
    SetHBlankCallback(EvoDummyFunc);
    SetVBlankCallback(VBlankCB_EvolutionScene);
    m4aMPlayAllStop();
    SetMainCallback2(CB2_EvolutionSceneUpdate);
}

static void CB2_EvolutionSceneLoadGraphics(void)
{
    u8 ID;
    const struct CompressedSpritePalette** pokePal;
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

    Text_InitWindowWithTemplate(&gUnknown_03004210, &gWindowTemplate_81E6C58);
    gBattleTerrain = BATTLE_TERRAIN_PLAIN;

    sub_800D6D4();
    LoadBattleTextboxAndBackground();
    ResetSpriteData();
    FreeAllSpritePalettes();
    gReservedSpritePaletteCount = 4;

    DecompressPicFromTable_2(&gMonFrontPicTable[postEvoSpecies],
                             gMonFrontPicCoords[postEvoSpecies].coords,
                             gMonFrontPicCoords[postEvoSpecies].y_offset,
                             (void*)(0x2000000),
                             gUnknown_081FAF4C[3], postEvoSpecies);
    pokePal = (void*) GetMonSpritePalStructFromOtIdPersonality(postEvoSpecies, TiD, PiD);
    LoadCompressedPalette(*pokePal, 0x120, 0x20);

    GetMonSpriteTemplate_803C56C(postEvoSpecies, 3);
    gUnknown_02024E8C.affineAnims = gDummySpriteAffineAnimTable;
    sEvoInfo.postEvoSpriteID = ID = CreateSprite(&gUnknown_02024E8C, 120, 64, 30);

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
                                     (void*)(0x2000000),
                                     gUnknown_081FAF4C[3], postEvoSpecies);
            pokePal = (void*) GetMonSpritePalStructFromOtIdPersonality(postEvoSpecies, TiD, PiD);
            LoadCompressedPalette(*pokePal, 0x120, 0x20);
            gMain.state++;
        }
        break;
    case 5:
        {
            u8 ID;

            GetMonSpriteTemplate_803C56C(postEvoSpecies, 3);
            gUnknown_02024E8C.affineAnims = gDummySpriteAffineAnimTable;
            sEvoInfo.postEvoSpriteID = ID = CreateSprite(&gUnknown_02024E8C, 120, 64, 30);

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
                             (void*)(0x2000000),
                             gUnknown_081FAF4C[1], speciesToEvolve);
    pokePal = (void*) GetMonSpritePalStructFromOtIdPersonality(speciesToEvolve, TiD, PiD);
    LoadCompressedPalette(*pokePal, 0x120, 0x20);

    GetMonSpriteTemplate_803C56C(speciesToEvolve, 1);
    gUnknown_02024E8C.affineAnims = gDummySpriteAffineAnimTable;
    sEvoInfo.postEvoSpriteID = ID = CreateSprite(&gUnknown_02024E8C, 120, 64, 30);

    gSprites[ID].callback = nullsub_37;
    gSprites[ID].oam.paletteNum = 2;
    gSprites[ID].invisible = 1;

    LoadEvoSparkleSpriteAndPal();

    sEvoInfo.evoTaskID = ID = CreateTask(Task_TradeEvolutionScene, 0);
    gTasks[ID].tState = 0;
    gTasks[ID].tPreEvoSpecies = currSpecies;
    gTasks[ID].tPostEvoSpecies = speciesToEvolve;
    gTasks[ID].tMonPtrHI = (u32)(mon);
    gTasks[ID].tMonPtrLO = (u32)(mon) >> 0x10;
    gTasks[ID].tLearnsFirstMove = TRUE;
    gTasks[ID].tEvoWasStopped = FALSE;
    gTasks[ID].tPartyID = partyID;

    SetMainCallback2(CB2_TradeEvolutionSceneUpdate);
}

static void CB2_EvolutionSceneUpdate(void)
{
    AnimateSprites();
    BuildOamBuffer();
    Text_UpdateWindowInBattle(&gUnknown_03004210);
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
        for (i = MON_DATA_CHAMPION_RIBBON; i <= MON_DATA_FATEFUL_ENCOUNTER; i++)
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
    struct Pokemon* mon = (struct Pokemon*)(gTasks[taskID].tMonPtrHI | (gTasks[taskID].tMonPtrLO << 0x10));

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
        gSprites[sEvoInfo.preEvoSpriteID].invisible = 0;
        gTasks[taskID].tState++;
        break;
    case 1: // print 'whoa, poke is evolving!!!' msg
        if (!gPaletteFade.active)
        {
            StringExpandPlaceholders(gStringVar4, BattleText_StartEvo);
            Text_InitWindow8002EB0(&gUnknown_03004210, gStringVar4, 144, 2, 15);
            gTasks[taskID].tState++;
        }
        break;
    case 2: // wait for string, play cry
        if (gUnknown_03004210.state == 0)
        {
            PlayCry1(gTasks[taskID].tPreEvoSpecies, 0);
            gTasks[taskID].tState++;
        }
        break;
    case 3: // wait for cry, play tu du SE
        if (IsCryFinished())
        {
            PlaySE(MUS_ME_SHINKA);
            gTasks[taskID].tState++;
        }
        break;
    case 4: // play evolution music and fade screen black
        if (!IsSEPlaying())
        {
            PlayNewMapMusic(MUS_SHINKA);
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
            memcpy(&gPlttBufferUnfaded[0x20], ewram9000_hack, 0x60);
            BeginNormalPaletteFade(0x1C, 0, 16, 0, RGB(0, 0, 0));
            gTasks[taskID].tState++;
        }
        break;
    case 13: // congratulations string and rename prompt
        if (IsCryFinished() && !gPaletteFade.active)
        {
            StringExpandPlaceholders(gStringVar4, BattleText_FinishEvo);
            Text_InitWindow8002EB0(&gUnknown_03004210, gStringVar4, 144, 2, 15);
            PlayBGM(MUS_FANFA5);
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
        if (gUnknown_03004210.state == 0)
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
            Text_InitWindow8002EB0(&gUnknown_03004210, gStringVar4, 144, 2, 15);
            gTasks[taskID].tEvoWasStopped = TRUE;
            gTasks[taskID].tState = 14;
        }
        break;
    case 19: // pokemon learned a new move, print string and play a fanfare
        if (gUnknown_03004210.state == 0 && !IsSEPlaying())
        {
            sub_8024CEC();
            PlayFanfare(MUS_FANFA1);
            StrCpyDecodeToDisplayedStringBattle(gBattleStringsTable[3]);
            Text_InitWindow8002EB0(&gUnknown_03004210, gDisplayedStringBattle, 144, 2, 15);
            gTasks[taskID].tLearnsFirstMove = 0x40; // re-used as a counter
            gTasks[taskID].tState++;
        }
        break;
    case 20: // wait a bit and check if can learn another move
        if (gUnknown_03004210.state == 0 && !IsSEPlaying() && --gTasks[taskID].tLearnsFirstMove == 0)
            gTasks[taskID].tState = 14;
        break;
    case 21: // try to learn a new move
        switch (gTasks[taskID].tLearnMoveState)
        {
        case 0:
            if (gUnknown_03004210.state == 0 && !IsSEPlaying())
            {
                sub_8024CEC();
                StrCpyDecodeToDisplayedStringBattle(gBattleStringsTable[4]);
                Text_InitWindow8002EB0(&gUnknown_03004210, gDisplayedStringBattle, 144, 2, 15);
                gTasks[taskID].tLearnMoveState++;
            }
            break;
        case 1:
            if (gUnknown_03004210.state == 0 && !IsSEPlaying())
            {
                StrCpyDecodeToDisplayedStringBattle(gBattleStringsTable[5]);
                Text_InitWindow8002EB0(&gUnknown_03004210, gDisplayedStringBattle, 144, 2, 15);
                gTasks[taskID].tLearnMoveState++;
            }
            break;
        case 2:
            if (gUnknown_03004210.state != 0)
                break;
            if (!IsSEPlaying())
            {
                StrCpyDecodeToDisplayedStringBattle(gBattleStringsTable[6]);
                Text_InitWindow8002EB0(&gUnknown_03004210, gDisplayedStringBattle, 144, 2, 15);
                gTasks[taskID].tData9 = 5;
                gTasks[taskID].tdata10 = 9;
                gTasks[taskID].tLearnMoveState++;
            }
        case 3:
            if (gUnknown_03004210.state == 0 && !IsSEPlaying())
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
                StrCpyDecodeToDisplayedStringBattle(gBattleStringsTable[292]);
                Text_InitWindow8002EB0(&gUnknown_03004210, gDisplayedStringBattle, 144, 2, 15);
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
                StrCpyDecodeToDisplayedStringBattle(gBattleStringsTable[292]);
                Text_InitWindow8002EB0(&gUnknown_03004210, gDisplayedStringBattle, 144, 2, 15);
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
                        StrCpyDecodeToDisplayedStringBattle(gBattleStringsTable[307]);
                        Text_InitWindow8002EB0(&gUnknown_03004210, gDisplayedStringBattle, 144, 2, 15);
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
                        StrCpyDecodeToDisplayedStringBattle(gBattleStringsTable[207]);
                        Text_InitWindow8002EB0(&gUnknown_03004210, gDisplayedStringBattle, 144, 2, 15);
                        gTasks[taskID].tLearnMoveState++;
                    }
                }
            }
            break;
        case 7:
            if (gUnknown_03004210.state == 0 && !IsSEPlaying())
            {
                StrCpyDecodeToDisplayedStringBattle(gBattleStringsTable[7]);
                Text_InitWindow8002EB0(&gUnknown_03004210, gDisplayedStringBattle, 144, 2, 15);
                gTasks[taskID].tLearnMoveState++;
            }
            break;
        case 8:
            if (gUnknown_03004210.state == 0 && !IsSEPlaying())
            {
                StrCpyDecodeToDisplayedStringBattle(gBattleStringsTable[208]);
                Text_InitWindow8002EB0(&gUnknown_03004210, gDisplayedStringBattle, 144, 2, 15);
                gTasks[taskID].tState = 19;
            }
            break;
        case 9:
            StrCpyDecodeToDisplayedStringBattle(gBattleStringsTable[8]);
            Text_InitWindow8002EB0(&gUnknown_03004210, gDisplayedStringBattle, 144, 2, 15);
            gTasks[taskID].tData9 = 10;
            gTasks[taskID].tdata10 = 0;
            gTasks[taskID].tLearnMoveState = 3;
            break;
        case 10:
            StrCpyDecodeToDisplayedStringBattle(gBattleStringsTable[9]);
            Text_InitWindow8002EB0(&gUnknown_03004210, gDisplayedStringBattle, 144, 2, 15);
            gTasks[taskID].tState = 14;
            break;
        case 11:
            if (gUnknown_03004210.state == 0 && !IsSEPlaying())
                gTasks[taskID].tLearnMoveState = 5;
            break;
        }
        break;
    }
}

static void Task_TradeEvolutionScene(u8 taskID)
{
    u32 var;
    struct Pokemon* mon = (struct Pokemon*)(gTasks[taskID].tMonPtrHI | (gTasks[taskID].tMonPtrLO << 0x10));

    switch (gTasks[taskID].tState)
    {
    case 0:
        StringExpandPlaceholders(gStringVar4, BattleText_StartEvo);
        Text_InitWindow8002EB0(&gUnknown_03004828->window, gStringVar4, gUnknown_03004828->textWindowBaseTileNum, 2, 15);
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
            m4aSongNumStop(MUS_SHINKA);
            PlaySE(MUS_ME_SHINKA);
            gTasks[taskID].tState++;
        }
        break;
    case 3:
        if (!IsSEPlaying())
        {
            PlayBGM(MUS_SHINKA);
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
            memcpy(&gPlttBufferUnfaded[0x20], ewram9000_hack, 0x60);
            BeginNormalPaletteFade(0x1, 0, 16, 0, RGB(0, 0, 0));
            gTasks[taskID].tState++;
        }
        break;
    case 12:
        if (IsCryFinished() && !gPaletteFade.active)
        {
            StringExpandPlaceholders(gStringVar4, BattleText_FinishEvo);
            Text_InitWindow8002EB0(&gUnknown_03004828->window, gStringVar4, gUnknown_03004828->textWindowBaseTileNum, 2, 15);
            PlayFanfare(MUS_FANFA5);
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
                PlayBGM(MUS_SHINKA);
                Text_InitWindow8002EB0(&gUnknown_03004828->window, gOtherText_LinkStandby2, gUnknown_03004828->textWindowBaseTileNum, 2, 15);
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
            PlayFanfare(MUS_FANFA1);
            StrCpyDecodeToDisplayedStringBattle(gBattleStringsTable[3]);
            Text_InitWindow8002EB0(&gUnknown_03004828->window, gDisplayedStringBattle, gUnknown_03004828->textWindowBaseTileNum, 2, 15);
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
                StrCpyDecodeToDisplayedStringBattle(gBattleStringsTable[4]);
                Text_InitWindow8002EB0(&gUnknown_03004828->window, gDisplayedStringBattle, gUnknown_03004828->textWindowBaseTileNum, 2, 15);
                gTasks[taskID].tLearnMoveState++;
            }
            break;
        case 1:
            if (gUnknown_03004828->window.state == 0 && !IsSEPlaying())
            {
                StrCpyDecodeToDisplayedStringBattle(gBattleStringsTable[5]);
                Text_InitWindow8002EB0(&gUnknown_03004828->window, gDisplayedStringBattle, gUnknown_03004828->textWindowBaseTileNum, 2, 15);
                gTasks[taskID].tLearnMoveState++;
            }
            break;
        case 2:
            if (gUnknown_03004828->window.state != 0)
                break;
            if (!IsSEPlaying())
            {
                StrCpyDecodeToDisplayedStringBattle(gBattleStringsTable[6]);
                Text_InitWindow8002EB0(&gUnknown_03004828->window, gDisplayedStringBattle, gUnknown_03004828->textWindowBaseTileNum, 2, 15);
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
                StrCpyDecodeToDisplayedStringBattle(gBattleStringsTable[292]);
                Text_InitWindow8002EB0(&gUnknown_03004828->window, gDisplayedStringBattle, gUnknown_03004828->textWindowBaseTileNum, 2, 15);
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
                StrCpyDecodeToDisplayedStringBattle(gBattleStringsTable[292]);
                Text_InitWindow8002EB0(&gUnknown_03004828->window, gDisplayedStringBattle, gUnknown_03004828->textWindowBaseTileNum, 2, 15);
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
                        StrCpyDecodeToDisplayedStringBattle(gBattleStringsTable[307]);
                        Text_InitWindow8002EB0(&gUnknown_03004828->window, gDisplayedStringBattle, gUnknown_03004828->textWindowBaseTileNum, 2, 15);
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
                        StrCpyDecodeToDisplayedStringBattle(gBattleStringsTable[207]);
                        Text_InitWindow8002EB0(&gUnknown_03004828->window, gDisplayedStringBattle, gUnknown_03004828->textWindowBaseTileNum, 2, 15);
                        gTasks[taskID].tLearnMoveState++;
                    }
                }
            }
            break;
        case 7:
            if (gUnknown_03004828->window.state == 0 && !IsSEPlaying())
            {
                StrCpyDecodeToDisplayedStringBattle(gBattleStringsTable[7]);
                Text_InitWindow8002EB0(&gUnknown_03004828->window, gDisplayedStringBattle, gUnknown_03004828->textWindowBaseTileNum, 2, 15);
                gTasks[taskID].tLearnMoveState++;
            }
            break;
        case 8:
            if (gUnknown_03004828->window.state == 0 && !IsSEPlaying())
            {
                StrCpyDecodeToDisplayedStringBattle(gBattleStringsTable[208]);
                Text_InitWindow8002EB0(&gUnknown_03004828->window, gDisplayedStringBattle, gUnknown_03004828->textWindowBaseTileNum, 2, 15);
                gTasks[taskID].tState = 15;
            }
            break;
        case 9:
            StrCpyDecodeToDisplayedStringBattle(gBattleStringsTable[8]);
            Text_InitWindow8002EB0(&gUnknown_03004828->window, gDisplayedStringBattle, gUnknown_03004828->textWindowBaseTileNum, 2, 15);
            gTasks[taskID].tData9 = 10;
            gTasks[taskID].tdata10 = 0;
            gTasks[taskID].tLearnMoveState = 3;
            break;
        case 10:
            StrCpyDecodeToDisplayedStringBattle(gBattleStringsTable[9]);
            Text_InitWindow8002EB0(&gUnknown_03004828->window, gDisplayedStringBattle, gUnknown_03004828->textWindowBaseTileNum, 2, 15);
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

/*
void unref_sub_8113B50(u8 *a, u8 *b)
{
    //u8 *sp0 = a;
    //u8 *sp4 = b;
#define sp0 a
#define sp4 b
    s32 sp8;
    s32 spC = 0;
    u32 sp10 = 0;
    s32 sp14;
    s32 r6;
    u32 r8;

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
        //_08113C32
        u32 r3 = 0;
        u8 *r2 = sp0 + r8;

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
                switch (r6 & r3)
                {
                 case 0:
                    if (*r2 & 0xF)
                    {
                        sEvoInfo.unk18C4[sp8][sEvoInfo.unk4[sp8]] = r6 - 1;
                        sEvoInfo.unk4[sp8]++;
                        r3 = 0;
                    }
                    break;
                case 1:
                    if (*r2 & 0xF0)
                    {
                        sEvoInfo.unk18C4[sp8][sEvoInfo.unk4[sp8]] = r6 - 1;
                        sEvoInfo.unk4[sp8]++;
                        r3 = 0;
                    }
                    break;
                }
            }
            //if (!((r6 + 1) & 7))
            if ((r6 + 1) % 8 == 0)
                r2 += 0x1D;
            else if (r6 & 1)
                r2 += 1;
        }
        if (r3)
        {
            sEvoInfo.unk18C4[sp8][sEvoInfo.unk4[sp8]] = r6;
            sEvoInfo.unk4[sp8]++;
        }
        //_08113D26
        if (!((sp8 + 1) & 7))
            r8 += 0xE4;
        else
            r8 += 4;
    }
    //_08113D4A
    r8 = 0;
    for (sp8 = 0; sp8 < 64; sp8++)
    {
        //_08113D6A
        u32 r3 = 0;
        u8 *r2 = sp4 + r8;

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
                switch (r6 & r3)
                {
                 case 0:
                    if (*r2 & 0xF)
                    {
                        sEvoInfo.unk28C4[sp8][sEvoInfo.unk44[sp8]] = r6 - 1;
                        sEvoInfo.unk44[sp8]++;
                        r3 = 0;
                    }
                    break;
                case 1:
                    if (*r2 & 0xF0)
                    {
                        sEvoInfo.unk28C4[sp8][sEvoInfo.unk44[sp8]] = r6 - 1;
                        sEvoInfo.unk44[sp8]++;
                        r3 = 0;
                    }
                    break;
                }
            }
            //_08113DE4
            if (!((r6 + 1) & 7))
                r2 += 0x1D;
            else if (r6 & 1)
                r2 += 1;

        }
        if (r3)
        {
            sEvoInfo.unk28C4[sp8][sEvoInfo.unk44[sp8]] = r6;
            sEvoInfo.unk44[sp8]++;
        }
        //if (!((sp8 + 1) & 7))
        if ((sp8 + 1) % 8 == 0)
            r8 += 0xE4;
        else
            r8 += 4;
    }

    for (sp8 = 0; sp8 < 0x40; sp8++)  //_08113E3A
    {
        if (sEvoInfo.unk4[sp8] < sEvoInfo.unk44[sp8])
        {
            for (spC = 0; spC < sEvoInfo.unk4[sp8]; spC++)
            {
                sp14 = 0x100;

                for (r6 = 0; r6 < sEvoInfo.unk44[sp8]; r6++)
                {
                    s32 r3;

                    //_08113EA4
                    if (sEvoInfo.unk10C4[sp8][spC] > sEvoInfo.unk20C4[sp8][r6])
                        r3 = sEvoInfo.unk10C4[sp8][spC] - sEvoInfo.unk20C4[sp8][r6];
                    else
                        r3 = sEvoInfo.unk20C4[sp8][r6] - sEvoInfo.unk10C4[sp8][spC];

                    if (sEvoInfo.unk18C4[sp8][spC] > sEvoInfo.unk28C4[sp8][spC])
                        r3 += sEvoInfo.unk18C4[sp8][spC] - sEvoInfo.unk28C4[sp8][spC];
                    else
                        r3 += sEvoInfo.unk28C4[sp8][spC] - sEvoInfo.unk18C4[sp8][spC];

                    if (sp14 >= r3 && sEvoInfo.unkC4[sp8][r6] == 0 && sEvoInfo.unk8C4[sp8][r6] == 0)
                    {
                        sp10 = r6;
                        sp14 = r3;
                    }
                }
                //_08113F3E
                sub_81141F0(spC, sp10, sp8);
            }
            //_08113F54

            for (r6 = 0; r6 < sEvoInfo.unk44[sp8]; r6++)
            {
                if (sEvoInfo.unkC4[sp8][r6] == 0 && sEvoInfo.unk8C4[sp8][r6] == 0)
                    sub_811430C(r6, sp8);
            }
        }
        //_08113F9E
        if (sEvoInfo.unk4[sp8] == sEvoInfo.unk44[sp8])
        {
            for (r6 = 0; r6 < sEvoInfo.unk4[sp8]; r6++)
                sub_81141F0(r6, r6, sp8);
        }
        //_08113FCC
        if (sEvoInfo.unk4[sp8] > sEvoInfo.unk44[sp8])
        {
            for (sp10 = 0; sp10 < sEvoInfo.unk44[sp8]; sp10++)
            {
                sp14 = 0x100;

                for (r6 = 0; r6 < sEvoInfo.unk4[sp8]; r6++)
                {
                    s32 r3;

                    if (sEvoInfo.unk10C4[sp8][r6] > sEvoInfo.unk20C4[sp8][sp10])
                        r3 = sEvoInfo.unk10C4[sp8][r6] - sEvoInfo.unk20C4[sp8][sp10];
                    else
                        r3 = sEvoInfo.unk20C4[sp8][sp10] - sEvoInfo.unk10C4[sp8][r6];

                    if (sEvoInfo.unk18C4[sp8][r6] > sEvoInfo.unk28C4[sp8][sp10])
                        r3 += sEvoInfo.unk18C4[sp8][r6] - sEvoInfo.unk28C4[sp8][sp10];
                    else
                        r3 += sEvoInfo.unk28C4[sp8][sp10] - sEvoInfo.unk18C4[sp8][r6];

                    //r3 = abs(sEvoInfo.unk10C4[sp8][r6] - sEvoInfo.unk20C4[sp8][sp10]);
                    //r3 += abs(sEvoInfo.unk18C4[sp8][r6] - sEvoInfo.unk28C4[sp8][sp10]);

                    if (sp14 > r3 && sEvoInfo.unkC4[sp8][r6] == 0)
                    {
                        spC = r6;
                        sp14 = r3;
                    }
                }
                //_081140C4
                sEvoInfo.unk30C4[sp8][spC] = sEvoInfo.unk20C4[sp8][sp10];
                sEvoInfo.unk38C4[sp8][spC] = sEvoInfo.unk28C4[sp8][sp10];
                sEvoInfo.unkC4[sp8][spC] = 1;
            }
            //_08114104
            for (r6 = 0; r6 < sEvoInfo.unk4[sp8]; r6++)
            {
                sEvoInfo.unk20C4[sp8][r6] = sEvoInfo.unk30C4[sp8][r6];
                sEvoInfo.unk28C4[sp8][r6] = sEvoInfo.unk38C4[sp8][r6];
                if (sEvoInfo.unkC4[sp8][r6] != 0)
                {
                    sEvoInfo.unkC4[sp8][r6] = 0;
                    sub_81141F0(r6, r6, sp8);
                }
                else
                {
                    // Ugh, can't get this part right
                    //u8 *ptr1 = &sEvoInfo.unk10C4[sp8][r6];
                    //u8 *ptr2 = &sEvoInfo.unk18C4[sp8][r6];
                    //s32 r2 = *ptr1 + (*ptr2 - *ptr1) / 2;

                    //u8 r0_ = sEvoInfo.unk10C4[sp8][r6];
                    //u8 r2_ = sEvoInfo.unk18C4[sp8][r6];
                    //s32 r2 = (r0_ - r2_) / 2;

                    s32 r2 = (sEvoInfo.unk18C4[sp8][r6] - sEvoInfo.unk10C4[sp8][r6]);
                    s32 r2_ = sEvoInfo.unk10C4[sp8][r6];

                    sEvoInfo.unk20C4[sp8][r6] = sEvoInfo.unk28C4[sp8][r6] = r2_ + r2 / 2;
                    sEvoInfo.unk28C4[sp8][r6]++;
                    sub_81141F0(r6, r6, sp8);
                }
            }
        }
        //_081141C4
    }
#undef sp0
#undef sp4
}
*/
NAKED
void unref_sub_8113B50()
{
    asm(".syntax unified\n\
    push {r4-r7,lr}\n\
    mov r7, r10\n\
    mov r6, r9\n\
    mov r5, r8\n\
    push {r5-r7}\n\
    sub sp, 0x3C\n\
    str r0, [sp]\n\
    str r1, [sp, 0x4]\n\
    movs r0, 0\n\
    str r0, [sp, 0xC]\n\
    movs r1, 0\n\
    str r1, [sp, 0x10]\n\
    movs r2, 0\n\
    str r2, [sp, 0x8]\n\
    ldr r3, _08113C60 @ =gSharedMem + 0x14800\n\
    mov r12, r3\n\
    ldr r4, _08113C64 @ =0x000018c4\n\
    add r4, r12\n\
    mov r10, r4\n\
    ldr r5, _08113C68 @ =0x000020c4\n\
    add r5, r12\n\
    mov r8, r5\n\
_08113B7C:\n\
    adds r0, r3, 0\n\
    adds r0, 0x84\n\
    ldr r1, [sp, 0x8]\n\
    adds r0, r1, r0\n\
    strb r2, [r0]\n\
    adds r0, r3, 0x4\n\
    adds r0, r1, r0\n\
    strb r2, [r0]\n\
    ldr r4, _08113C6C @ =gSharedMem + 0x14844\n\
    adds r0, r1, r4\n\
    strb r2, [r0]\n\
    movs r6, 0\n\
    lsls r1, 5\n\
    mov r9, r1\n\
    ldr r5, [sp, 0x8]\n\
    lsls r4, r5, 6\n\
_08113B9C:\n\
    mov r0, r9\n\
    adds r1, r6, r0\n\
    ldr r5, _08113C70 @ =gSharedMem + 0x158C4\n\
    adds r0, r1, r5\n\
    strb r2, [r0]\n\
    mov r5, r10\n\
    adds r0, r1, r5\n\
    strb r2, [r0]\n\
    mov r5, r8\n\
    adds r0, r1, r5\n\
    strb r2, [r0]\n\
    ldr r5, _08113C74 @ =gSharedMem + 0x170C4\n\
    adds r0, r1, r5\n\
    strb r2, [r0]\n\
    adds r7, r3, 0\n\
    adds r7, 0xC4\n\
    adds r0, r1, r7\n\
    strb r2, [r0]\n\
    ldr r5, _08113C78 @ =0x000008c4\n\
    adds r0, r3, r5\n\
    adds r0, r1, r0\n\
    strb r2, [r0]\n\
    ldr r5, _08113C7C @ =0x000030c4\n\
    adds r0, r3, r5\n\
    adds r0, r1, r0\n\
    strb r2, [r0]\n\
    ldr r5, _08113C80 @ =0x000038c4\n\
    adds r0, r3, r5\n\
    adds r1, r0\n\
    strb r2, [r1]\n\
    lsls r1, r6, 1\n\
    adds r1, r4\n\
    ldr r5, _08113C84 @ =0x000060c4\n\
    adds r0, r3, r5\n\
    adds r0, r1, r0\n\
    strh r2, [r0]\n\
    ldr r5, _08113C88 @ =0x000070c4\n\
    adds r0, r3, r5\n\
    adds r0, r1, r0\n\
    strh r2, [r0]\n\
    ldr r5, _08113C8C @ =0x000080c4\n\
    adds r0, r3, r5\n\
    adds r0, r1, r0\n\
    strh r2, [r0]\n\
    ldr r5, _08113C90 @ =0x000090c4\n\
    adds r0, r3, r5\n\
    adds r1, r0\n\
    strh r2, [r1]\n\
    adds r6, 0x1\n\
    cmp r6, 0x1F\n\
    ble _08113B9C\n\
    ldr r0, [sp, 0x8]\n\
    adds r0, 0x1\n\
    str r0, [sp, 0x8]\n\
    cmp r0, 0x3F\n\
    ble _08113B7C\n\
    ldr r1, _08113C94 @ =0x0000a0c4\n\
    add r1, r12\n\
    movs r0, 0x40\n\
    strb r0, [r1]\n\
    movs r1, 0\n\
    mov r8, r1\n\
    movs r2, 0\n\
    str r2, [sp, 0x8]\n\
    movs r3, 0x80\n\
    lsls r3, 5\n\
    adds r3, r7\n\
    mov r12, r3\n\
    movs r4, 0xC0\n\
    lsls r4, 5\n\
    adds r4, r7\n\
    mov r9, r4\n\
    movs r5, 0\n\
    adds r4, r7, 0\n\
    subs r4, 0xC0\n\
_08113C32:\n\
    movs r3, 0\n\
    ldr r2, [sp]\n\
    add r2, r8\n\
    movs r6, 0\n\
    ldr r0, [sp, 0x8]\n\
    adds r0, 0x1\n\
    str r0, [sp, 0x30]\n\
    ldr r1, [sp, 0x8]\n\
    lsls r1, 7\n\
    mov r10, r1\n\
    movs r7, 0x1\n\
    negs r7, r7\n\
_08113C4A:\n\
    asrs r0, r6, 1\n\
    lsls r0, 2\n\
    add r0, r10\n\
    ldr r1, _08113C98 @ =gSharedMem + 0x188C4\n\
    adds r0, r1\n\
    str r2, [r0]\n\
    cmp r3, 0\n\
    beq _08113C9C\n\
    cmp r3, 0x1\n\
    beq _08113CC6\n\
    b _08113CF4\n\
    .align 2, 0\n\
_08113C60: .4byte gSharedMem + 0x14800\n\
_08113C64: .4byte 0x000018c4\n\
_08113C68: .4byte 0x000020c4\n\
_08113C6C: .4byte gSharedMem + 0x14844\n\
_08113C70: .4byte gSharedMem + 0x158C4\n\
_08113C74: .4byte gSharedMem + 0x170C4\n\
_08113C78: .4byte 0x000008c4\n\
_08113C7C: .4byte 0x000030c4\n\
_08113C80: .4byte 0x000038c4\n\
_08113C84: .4byte 0x000060c4\n\
_08113C88: .4byte 0x000070c4\n\
_08113C8C: .4byte 0x000080c4\n\
_08113C90: .4byte 0x000090c4\n\
_08113C94: .4byte 0x0000a0c4\n\
_08113C98: .4byte gSharedMem + 0x188C4\n\
_08113C9C:\n\
    movs r0, 0x1\n\
    ands r0, r6\n\
    cmp r0, 0\n\
    beq _08113CAA\n\
    cmp r0, 0x1\n\
    beq _08113CB0\n\
    b _08113CF4\n\
_08113CAA:\n\
    ldrb r1, [r2]\n\
    movs r0, 0xF\n\
    b _08113CB4\n\
_08113CB0:\n\
    ldrb r1, [r2]\n\
    movs r0, 0xF0\n\
_08113CB4:\n\
    ands r0, r1\n\
    cmp r0, 0\n\
    beq _08113CF4\n\
    ldrb r0, [r4]\n\
    adds r0, r5\n\
    add r0, r12\n\
    strb r6, [r0]\n\
    movs r3, 0x1\n\
    b _08113CF4\n\
_08113CC6:\n\
    adds r0, r6, 0\n\
    ands r0, r3\n\
    cmp r0, 0\n\
    beq _08113CD4\n\
    cmp r0, 0x1\n\
    beq _08113CDA\n\
    b _08113CF4\n\
_08113CD4:\n\
    ldrb r1, [r2]\n\
    movs r0, 0xF\n\
    b _08113CDE\n\
_08113CDA:\n\
    ldrb r1, [r2]\n\
    movs r0, 0xF0\n\
_08113CDE:\n\
    ands r0, r1\n\
    cmp r0, 0\n\
    bne _08113CF4\n\
    ldrb r0, [r4]\n\
    adds r0, r5\n\
    add r0, r9\n\
    strb r7, [r0]\n\
    ldrb r0, [r4]\n\
    adds r0, 0x1\n\
    strb r0, [r4]\n\
    movs r3, 0\n\
_08113CF4:\n\
    adds r0, r6, 0x1\n\
    movs r1, 0x7\n\
    ands r0, r1\n\
    cmp r0, 0\n\
    bne _08113D02\n\
    adds r2, 0x1D\n\
    b _08113D0C\n\
_08113D02:\n\
    movs r0, 0x1\n\
    ands r0, r6\n\
    cmp r0, 0\n\
    beq _08113D0C\n\
    adds r2, 0x1\n\
_08113D0C:\n\
    adds r7, 0x1\n\
    adds r6, 0x1\n\
    cmp r6, 0x3F\n\
    ble _08113C4A\n\
    cmp r3, 0\n\
    beq _08113D26\n\
    ldrb r0, [r4]\n\
    adds r0, r5\n\
    add r0, r9\n\
    strb r6, [r0]\n\
    ldrb r0, [r4]\n\
    adds r0, 0x1\n\
    strb r0, [r4]\n\
_08113D26:\n\
    movs r0, 0x7\n\
    ldr r2, [sp, 0x30]\n\
    ands r2, r0\n\
    cmp r2, 0\n\
    bne _08113D36\n\
    movs r3, 0xE4\n\
    add r8, r3\n\
    b _08113D3A\n\
_08113D36:\n\
    movs r0, 0x4\n\
    add r8, r0\n\
_08113D3A:\n\
    adds r5, 0x20\n\
    adds r4, 0x1\n\
    ldr r1, [sp, 0x8]\n\
    adds r1, 0x1\n\
    str r1, [sp, 0x8]\n\
    cmp r1, 0x3F\n\
    bgt _08113D4A\n\
    b _08113C32\n\
_08113D4A:\n\
    movs r2, 0\n\
    mov r8, r2\n\
    movs r3, 0\n\
    str r3, [sp, 0x8]\n\
    ldr r0, _08113D84 @ =gSharedMem + 0x14844\n\
    movs r4, 0x82\n\
    lsls r4, 6\n\
    adds r4, r0\n\
    mov r10, r4\n\
    movs r5, 0xA2\n\
    lsls r5, 6\n\
    adds r7, r0, r5\n\
    movs r5, 0\n\
    adds r4, r0, 0\n\
    movs r0, 0x1\n\
    mov r9, r0\n\
_08113D6A:\n\
    movs r3, 0\n\
    ldr r2, [sp, 0x4]\n\
    add r2, r8\n\
    movs r6, 0\n\
    ldr r1, [sp, 0x8]\n\
    adds r1, 0x1\n\
    str r1, [sp, 0x30]\n\
_08113D78:\n\
    cmp r3, 0\n\
    beq _08113D88\n\
    cmp r3, 0x1\n\
    beq _08113DB4\n\
    b _08113DE4\n\
    .align 2, 0\n\
_08113D84: .4byte gSharedMem + 0x14844\n\
_08113D88:\n\
    adds r0, r6, 0\n\
    mov r1, r9\n\
    ands r0, r1\n\
    cmp r0, 0\n\
    beq _08113D98\n\
    cmp r0, 0x1\n\
    beq _08113D9E\n\
    b _08113DE4\n\
_08113D98:\n\
    ldrb r1, [r2]\n\
    movs r0, 0xF\n\
    b _08113DA2\n\
_08113D9E:\n\
    ldrb r1, [r2]\n\
    movs r0, 0xF0\n\
_08113DA2:\n\
    ands r0, r1\n\
    cmp r0, 0\n\
    beq _08113DE4\n\
    ldrb r0, [r4]\n\
    adds r0, r5\n\
    add r0, r10\n\
    strb r6, [r0]\n\
    movs r3, 0x1\n\
    b _08113DE4\n\
_08113DB4:\n\
    adds r0, r6, 0\n\
    ands r0, r3\n\
    cmp r0, 0\n\
    beq _08113DC2\n\
    cmp r0, 0x1\n\
    beq _08113DC8\n\
    b _08113DE4\n\
_08113DC2:\n\
    ldrb r1, [r2]\n\
    movs r0, 0xF\n\
    b _08113DCC\n\
_08113DC8:\n\
    ldrb r1, [r2]\n\
    movs r0, 0xF0\n\
_08113DCC:\n\
    ands r0, r1\n\
    cmp r0, 0\n\
    bne _08113DE4\n\
    ldrb r0, [r4]\n\
    adds r0, r5\n\
    adds r0, r7\n\
    subs r1, r6, 0x1\n\
    strb r1, [r0]\n\
    ldrb r0, [r4]\n\
    adds r0, 0x1\n\
    strb r0, [r4]\n\
    movs r3, 0\n\
_08113DE4:\n\
    adds r1, r6, 0x1\n\
    movs r0, 0x7\n\
    ands r0, r1\n\
    cmp r0, 0\n\
    bne _08113DF2\n\
    adds r2, 0x1D\n\
    b _08113DFC\n\
_08113DF2:\n\
    mov r0, r9\n\
    ands r6, r0\n\
    cmp r6, 0\n\
    beq _08113DFC\n\
    adds r2, 0x1\n\
_08113DFC:\n\
    adds r6, r1, 0\n\
    cmp r6, 0x3F\n\
    ble _08113D78\n\
    cmp r3, 0\n\
    beq _08113E14\n\
    ldrb r0, [r4]\n\
    adds r0, r5\n\
    adds r0, r7\n\
    strb r6, [r0]\n\
    ldrb r0, [r4]\n\
    adds r0, 0x1\n\
    strb r0, [r4]\n\
_08113E14:\n\
    movs r0, 0x7\n\
    ldr r1, [sp, 0x30]\n\
    ands r1, r0\n\
    cmp r1, 0\n\
    bne _08113E24\n\
    movs r2, 0xE4\n\
    add r8, r2\n\
    b _08113E28\n\
_08113E24:\n\
    movs r3, 0x4\n\
    add r8, r3\n\
_08113E28:\n\
    adds r5, 0x20\n\
    adds r4, 0x1\n\
    ldr r0, [sp, 0x8]\n\
    adds r0, 0x1\n\
    str r0, [sp, 0x8]\n\
    cmp r0, 0x3F\n\
    ble _08113D6A\n\
    movs r1, 0\n\
    str r1, [sp, 0x8]\n\
_08113E3A:\n\
    ldr r3, [sp, 0x8]\n\
    ldr r4, _08113EBC @ =gSharedMem + 0x14804\n\
    adds r2, r3, r4\n\
    ldr r5, _08113EC0 @ =gSharedMem + 0x14844\n\
    adds r1, r3, r5\n\
    ldrb r0, [r2]\n\
    adds r3, 0x1\n\
    str r3, [sp, 0x30]\n\
    ldrb r1, [r1]\n\
    cmp r0, r1\n\
    bcc _08113E52\n\
    b _08113F9E\n\
_08113E52:\n\
    movs r0, 0\n\
    str r0, [sp, 0xC]\n\
    ldrb r2, [r2]\n\
    cmp r0, r2\n\
    bge _08113F54\n\
    ldr r0, _08113EC4 @ =gSharedMem + 0x14800\n\
    adds r0, 0x4\n\
    ldr r1, [sp, 0x8]\n\
    adds r0, r1, r0\n\
    str r0, [sp, 0x18]\n\
_08113E66:\n\
    movs r2, 0x80\n\
    lsls r2, 1\n\
    str r2, [sp, 0x14]\n\
    movs r6, 0\n\
    ldr r3, [sp, 0x8]\n\
    ldr r4, _08113EC0 @ =gSharedMem + 0x14844\n\
    adds r0, r3, r4\n\
    ldr r5, [sp, 0xC]\n\
    adds r5, 0x1\n\
    str r5, [sp, 0x34]\n\
    ldrb r0, [r0]\n\
    cmp r6, r0\n\
    bge _08113F3E\n\
    ldr r0, _08113EC4 @ =gSharedMem + 0x14800\n\
    mov r10, r0\n\
    lsls r0, r3, 5\n\
    ldr r2, [sp, 0xC]\n\
    adds r1, r2, r0\n\
    mov r9, r0\n\
    ldr r0, _08113EC4 @ =gSharedMem + 0x14800\n\
    adds r0, 0xC4\n\
    mov r3, r9\n\
    adds r7, r3, r0\n\
    mov r5, r9\n\
    ldr r4, _08113EC4 @ =gSharedMem + 0x14800\n\
    ldr r2, _08113EC8 @ =0x000010c4\n\
    adds r0, r4, r2\n\
    adds r1, r0\n\
    mov r8, r1\n\
    ldrb r3, [r1]\n\
    str r3, [sp, 0x1C]\n\
_08113EA4:\n\
    ldr r0, _08113ECC @ =0x000020c4\n\
    add r0, r10\n\
    adds r0, r5, r0\n\
    ldr r4, [sp, 0x1C]\n\
    ldrb r1, [r0]\n\
    cmp r4, r1\n\
    bls _08113ED0\n\
    mov r2, r8\n\
    ldrb r1, [r2]\n\
    ldrb r0, [r0]\n\
    b _08113ED6\n\
    .align 2, 0\n\
_08113EBC: .4byte gSharedMem + 0x14804\n\
_08113EC0: .4byte gSharedMem + 0x14844\n\
_08113EC4: .4byte gSharedMem + 0x14800\n\
_08113EC8: .4byte 0x000010c4\n\
_08113ECC: .4byte 0x000020c4\n\
_08113ED0:\n\
    ldrb r1, [r0]\n\
    mov r3, r8\n\
    ldrb r0, [r3]\n\
_08113ED6:\n\
    subs r3, r1, r0\n\
    ldr r1, [sp, 0xC]\n\
    add r1, r9\n\
    ldr r0, _08113EFC @ =0x000018c4\n\
    add r0, r10\n\
    adds r4, r1, r0\n\
    ldr r0, _08113F00 @ =0x000028c4\n\
    add r0, r10\n\
    adds r2, r5, r0\n\
    ldrb r0, [r4]\n\
    ldr r1, _08113F04 @ =gSharedMem + 0x14800\n\
    mov r12, r1\n\
    ldrb r1, [r2]\n\
    cmp r0, r1\n\
    bls _08113F08\n\
    adds r1, r0, 0\n\
    ldrb r0, [r2]\n\
    b _08113F0C\n\
    .align 2, 0\n\
_08113EFC: .4byte 0x000018c4\n\
_08113F00: .4byte 0x000028c4\n\
_08113F04: .4byte gSharedMem + 0x14800\n\
_08113F08:\n\
    ldrb r1, [r2]\n\
    ldrb r0, [r4]\n\
_08113F0C:\n\
    subs r1, r0\n\
    adds r3, r1\n\
    ldr r2, [sp, 0x14]\n\
    cmp r2, r3\n\
    ble _08113F2C\n\
    ldrb r0, [r7]\n\
    cmp r0, 0\n\
    bne _08113F2C\n\
    ldr r0, _08114050 @ =0x000008c4\n\
    add r0, r12\n\
    adds r0, r5, r0\n\
    ldrb r0, [r0]\n\
    cmp r0, 0\n\
    bne _08113F2C\n\
    str r6, [sp, 0x10]\n\
    str r3, [sp, 0x14]\n\
_08113F2C:\n\
    adds r7, 0x1\n\
    adds r5, 0x1\n\
    adds r6, 0x1\n\
    ldr r3, [sp, 0x8]\n\
    ldr r4, _08114054 @ =gSharedMem + 0x14844\n\
    adds r0, r3, r4\n\
    ldrb r0, [r0]\n\
    cmp r6, r0\n\
    blt _08113EA4\n\
_08113F3E:\n\
    ldr r0, [sp, 0xC]\n\
    ldr r1, [sp, 0x10]\n\
    ldr r2, [sp, 0x8]\n\
    bl sub_81141F0\n\
    ldr r5, [sp, 0x34]\n\
    str r5, [sp, 0xC]\n\
    ldr r0, [sp, 0x18]\n\
    ldrb r0, [r0]\n\
    cmp r5, r0\n\
    blt _08113E66\n\
_08113F54:\n\
    movs r6, 0\n\
    ldr r2, _08114058 @ =gSharedMem + 0x14800\n\
    ldr r1, [sp, 0x8]\n\
    ldr r3, _08114054 @ =gSharedMem + 0x14844\n\
    adds r0, r1, r3\n\
    adds r4, r2, 0\n\
    mov r12, r4\n\
    ldrb r0, [r0]\n\
    cmp r6, r0\n\
    bge _08113F9E\n\
    mov r0, r12\n\
    adds r0, 0x44\n\
    adds r4, r1, r0\n\
_08113F6E:\n\
    ldr r5, [sp, 0x8]\n\
    lsls r0, r5, 5\n\
    adds r1, r6, r0\n\
    adds r0, r2, 0\n\
    adds r0, 0xC4\n\
    adds r0, r1, r0\n\
    ldrb r0, [r0]\n\
    cmp r0, 0\n\
    bne _08113F94\n\
    ldr r3, _08114050 @ =0x000008c4\n\
    adds r0, r2, r3\n\
    adds r0, r1, r0\n\
    ldrb r0, [r0]\n\
    cmp r0, 0\n\
    bne _08113F94\n\
    adds r0, r6, 0\n\
    adds r1, r5, 0\n\
    bl sub_811430C\n\
_08113F94:\n\
    adds r6, 0x1\n\
    ldr r2, _08114058 @ =gSharedMem + 0x14800\n\
    ldrb r5, [r4]\n\
    cmp r6, r5\n\
    blt _08113F6E\n\
_08113F9E:\n\
    ldr r0, [sp, 0x8]\n\
    ldr r1, _0811405C @ =gSharedMem + 0x14804\n\
    adds r2, r0, r1\n\
    ldr r3, _08114054 @ =gSharedMem + 0x14844\n\
    adds r1, r0, r3\n\
    ldrb r0, [r2]\n\
    ldrb r1, [r1]\n\
    cmp r0, r1\n\
    bne _08113FCC\n\
    movs r6, 0\n\
    ldrb r4, [r2]\n\
    cmp r6, r4\n\
    bge _08113FCC\n\
    adds r4, r2, 0\n\
_08113FBA:\n\
    adds r0, r6, 0\n\
    adds r1, r6, 0\n\
    ldr r2, [sp, 0x8]\n\
    bl sub_81141F0\n\
    adds r6, 0x1\n\
    ldrb r5, [r4]\n\
    cmp r6, r5\n\
    blt _08113FBA\n\
_08113FCC:\n\
    ldr r0, [sp, 0x8]\n\
    ldr r1, _0811405C @ =gSharedMem + 0x14804\n\
    adds r2, r0, r1\n\
    ldr r3, _08114054 @ =gSharedMem + 0x14844\n\
    adds r1, r0, r3\n\
    ldrb r0, [r2]\n\
    ldr r4, _08114058 @ =gSharedMem + 0x14800\n\
    ldrb r5, [r1]\n\
    cmp r0, r5\n\
    bhi _08113FE2\n\
    b _081141C4\n\
_08113FE2:\n\
    movs r0, 0\n\
    str r0, [sp, 0x10]\n\
    ldrb r1, [r1]\n\
    cmp r0, r1\n\
    blt _08113FEE\n\
    b _08114104\n\
_08113FEE:\n\
    str r2, [sp, 0x2C]\n\
    ldr r1, [sp, 0x8]\n\
    lsls r1, 5\n\
    mov r9, r1\n\
    adds r0, r4, 0\n\
    adds r0, 0x44\n\
    ldr r2, [sp, 0x8]\n\
    adds r0, r2, r0\n\
    str r0, [sp, 0x20]\n\
    mov r3, r9\n\
    str r3, [sp, 0x24]\n\
_08114004:\n\
    movs r4, 0x80\n\
    lsls r4, 1\n\
    str r4, [sp, 0x14]\n\
    movs r6, 0\n\
    ldr r5, [sp, 0x10]\n\
    adds r5, 0x1\n\
    str r5, [sp, 0x38]\n\
    ldr r0, [sp, 0x2C]\n\
    ldrb r0, [r0]\n\
    cmp r6, r0\n\
    bge _081140C4\n\
    ldr r1, [sp, 0x10]\n\
    ldr r2, [sp, 0x24]\n\
    adds r1, r2\n\
    mov r10, r1\n\
    ldr r0, _08114058 @ =gSharedMem + 0x14800\n\
    adds r0, 0xC4\n\
    adds r2, r0\n\
    mov r8, r2\n\
    ldr r7, [sp, 0x24]\n\
    ldr r3, _08114058 @ =gSharedMem + 0x14800\n\
    ldr r4, _08114060 @ =0x000010c4\n\
    adds r0, r3, r4\n\
    adds r5, r7, r0\n\
    ldr r0, _08114064 @ =gSharedMem + 0x168C4\n\
    add r0, r10\n\
    mov r12, r0\n\
    ldrb r1, [r0]\n\
    str r1, [sp, 0x28]\n\
_0811403E:\n\
    ldrb r0, [r5]\n\
    ldr r2, [sp, 0x28]\n\
    cmp r0, r2\n\
    bls _08114068\n\
    adds r1, r0, 0\n\
    mov r3, r12\n\
    ldrb r0, [r3]\n\
    b _0811406E\n\
    .align 2, 0\n\
_08114050: .4byte 0x000008c4\n\
_08114054: .4byte gSharedMem + 0x14844\n\
_08114058: .4byte gSharedMem + 0x14800\n\
_0811405C: .4byte gSharedMem + 0x14804\n\
_08114060: .4byte 0x000010c4\n\
_08114064: .4byte gSharedMem + 0x168C4\n\
_08114068:\n\
    mov r4, r12\n\
    ldrb r1, [r4]\n\
    ldrb r0, [r5]\n\
_0811406E:\n\
    subs r3, r1, r0\n\
    ldr r1, _0811408C @ =gSharedMem + 0x14800\n\
    ldr r2, _08114090 @ =0x000018c4\n\
    adds r0, r1, r2\n\
    adds r4, r7, r0\n\
    ldr r2, _08114094 @ =gSharedMem + 0x170C4\n\
    add r2, r10\n\
    ldrb r0, [r4]\n\
    ldrb r1, [r2]\n\
    cmp r0, r1\n\
    bls _08114098\n\
    adds r1, r0, 0\n\
    ldrb r0, [r2]\n\
    b _0811409C\n\
    .align 2, 0\n\
_0811408C: .4byte gSharedMem + 0x14800\n\
_08114090: .4byte 0x000018c4\n\
_08114094: .4byte gSharedMem + 0x170C4\n\
_08114098:\n\
    ldrb r1, [r2]\n\
    ldrb r0, [r4]\n\
_0811409C:\n\
    subs r1, r0\n\
    adds r3, r1\n\
    ldr r2, [sp, 0x14]\n\
    cmp r2, r3\n\
    ble _081140B2\n\
    mov r4, r8\n\
    ldrb r0, [r4]\n\
    cmp r0, 0\n\
    bne _081140B2\n\
    str r6, [sp, 0xC]\n\
    str r3, [sp, 0x14]\n\
_081140B2:\n\
    movs r0, 0x1\n\
    add r8, r0\n\
    adds r7, 0x1\n\
    adds r5, 0x1\n\
    adds r6, 0x1\n\
    ldr r1, [sp, 0x2C]\n\
    ldrb r1, [r1]\n\
    cmp r6, r1\n\
    blt _0811403E\n\
_081140C4:\n\
    ldr r3, [sp, 0xC]\n\
    add r3, r9\n\
    ldr r2, _08114164 @ =gSharedMem + 0x14800\n\
    ldr r4, _08114168 @ =0x000030c4\n\
    adds r1, r2, r4\n\
    adds r1, r3, r1\n\
    ldr r2, [sp, 0x10]\n\
    add r2, r9\n\
    ldr r5, _0811416C @ =gSharedMem + 0x168C4\n\
    adds r0, r2, r5\n\
    ldrb r0, [r0]\n\
    strb r0, [r1]\n\
    ldr r0, _08114164 @ =gSharedMem + 0x14800\n\
    ldr r4, _08114170 @ =0x000038c4\n\
    adds r1, r0, r4\n\
    adds r1, r3, r1\n\
    ldr r5, _08114174 @ =gSharedMem + 0x170C4\n\
    adds r2, r5\n\
    ldrb r0, [r2]\n\
    strb r0, [r1]\n\
    ldr r0, _08114164 @ =gSharedMem + 0x14800\n\
    adds r0, 0xC4\n\
    adds r3, r0\n\
    movs r0, 0x1\n\
    strb r0, [r3]\n\
    ldr r0, [sp, 0x38]\n\
    str r0, [sp, 0x10]\n\
    ldr r1, [sp, 0x20]\n\
    ldrb r1, [r1]\n\
    cmp r0, r1\n\
    bge _08114104\n\
    b _08114004\n\
_08114104:\n\
    movs r6, 0\n\
    ldr r4, _08114164 @ =gSharedMem + 0x14800\n\
    ldr r2, [sp, 0x8]\n\
    ldr r3, _08114178 @ =gSharedMem + 0x14804\n\
    adds r0, r2, r3\n\
    ldrb r0, [r0]\n\
    cmp r6, r0\n\
    bge _081141C4\n\
    adds r7, r4, 0\n\
    mov r9, r6\n\
    movs r5, 0xC4\n\
    adds r5, r7\n\
    mov r8, r5\n\
_0811411E:\n\
    ldr r1, [sp, 0x8]\n\
    lsls r0, r1, 5\n\
    adds r2, r6, r0\n\
    ldr r3, _0811417C @ =0x000020c4\n\
    adds r0, r7, r3\n\
    adds r0, r2\n\
    mov r10, r0\n\
    ldr r5, _08114168 @ =0x000030c4\n\
    adds r0, r7, r5\n\
    adds r0, r2, r0\n\
    ldrb r0, [r0]\n\
    mov r1, r10\n\
    strb r0, [r1]\n\
    ldr r3, _08114180 @ =0x000028c4\n\
    adds r0, r7, r3\n\
    adds r3, r2, r0\n\
    ldr r5, _08114170 @ =0x000038c4\n\
    adds r0, r7, r5\n\
    adds r0, r2, r0\n\
    ldrb r0, [r0]\n\
    strb r0, [r3]\n\
    mov r0, r8\n\
    adds r1, r2, r0\n\
    ldrb r0, [r1]\n\
    cmp r0, 0\n\
    beq _08114184\n\
    mov r2, r9\n\
    strb r2, [r1]\n\
    adds r0, r6, 0\n\
    adds r1, r6, 0\n\
    ldr r2, [sp, 0x8]\n\
    bl sub_81141F0\n\
    b _081141B4\n\
    .align 2, 0\n\
_08114164: .4byte gSharedMem + 0x14800\n\
_08114168: .4byte 0x000030c4\n\
_0811416C: .4byte gSharedMem + 0x168C4\n\
_08114170: .4byte 0x000038c4\n\
_08114174: .4byte gSharedMem + 0x170C4\n\
_08114178: .4byte gSharedMem + 0x14804\n\
_0811417C: .4byte 0x000020c4\n\
_08114180: .4byte 0x000028c4\n\
_08114184:\n\
    ldr r5, _081141E0 @ =0x000010c4\n\
    adds r1, r4, r5\n\
    adds r1, r2, r1\n\
    ldr r5, _081141E4 @ =0x000018c4\n\
    adds r0, r4, r5\n\
    adds r0, r2, r0\n\
    ldrb r0, [r0]\n\
    ldrb r2, [r1]\n\
    subs r0, r2\n\
    lsrs r1, r0, 31\n\
    adds r0, r1\n\
    asrs r0, 1\n\
    adds r2, r0\n\
    strb r2, [r3]\n\
    mov r0, r10\n\
    strb r2, [r0]\n\
    ldrb r0, [r3]\n\
    subs r0, 0x1\n\
    strb r0, [r3]\n\
    adds r0, r6, 0\n\
    adds r1, r6, 0\n\
    ldr r2, [sp, 0x8]\n\
    bl sub_81141F0\n\
_081141B4:\n\
    adds r6, 0x1\n\
    ldr r4, _081141E8 @ =gSharedMem + 0x14800\n\
    ldr r1, [sp, 0x8]\n\
    ldr r2, _081141EC @ =gSharedMem + 0x14804\n\
    adds r0, r1, r2\n\
    ldrb r0, [r0]\n\
    cmp r6, r0\n\
    blt _0811411E\n\
_081141C4:\n\
    ldr r3, [sp, 0x30]\n\
    str r3, [sp, 0x8]\n\
    cmp r3, 0x3F\n\
    bgt _081141CE\n\
    b _08113E3A\n\
_081141CE:\n\
    add sp, 0x3C\n\
    pop {r3-r5}\n\
    mov r8, r3\n\
    mov r9, r4\n\
    mov r10, r5\n\
    pop {r4-r7}\n\
    pop {r0}\n\
    bx r0\n\
    .align 2, 0\n\
_081141E0: .4byte 0x000010c4\n\
_081141E4: .4byte 0x000018c4\n\
_081141E8: .4byte gSharedMem + 0x14800\n\
_081141EC: .4byte gSharedMem + 0x14804\n\
        .syntax divided");
}

void sub_81141F0(s32 a, s32 b, s32 c)
{
    u32 r7;

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
    sEvoInfo.unk80C4[c][b] = r7 * 16;

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
    sEvoInfo.unk90C4[c][b] = r7 * 16;

    sEvoInfo.unk84[c]++;
}

void sub_811430C(u32 a, u32 b)
{
    u8 r2 = sEvoInfo.unk28C4[b][a];
    u8 r3 = sEvoInfo.unk20C4[b][a];
    s32 r7 = r2 - r3;

    sEvoInfo.unk30C4[b][a] = sEvoInfo.unk38C4[b][a] = r3 + r7 / 2;
    sEvoInfo.unkC4[b][a] = 5;
    sEvoInfo.unk8C4[b][a] = 7;
    sEvoInfo.unk84[b]++;
    r7 = sEvoInfo.unk30C4[b][a] - sEvoInfo.unk20C4[b][a];
    sEvoInfo.unk80C4[b][a] = r7 * 16;
    r7 = sEvoInfo.unk28C4[b][a] - sEvoInfo.unk38C4[b][a];
    sEvoInfo.unk90C4[b][a] = r7 * 16;
}

NAKED
void unref_sub_81143CC()
{
    asm(".syntax unified\n\
            push {r4-r7,lr}\n\
    mov r7, r10\n\
    mov r6, r9\n\
    mov r5, r8\n\
    push {r5-r7}\n\
    sub sp, 0x14\n\
    movs r0, 0x1\n\
    str r0, [sp, 0x4]\n\
    ldr r0, _08114408 @ =gSharedMem + 0x14800\n\
    ldr r2, _0811440C @ =0x0000a0c4\n\
    adds r1, r0, r2\n\
    ldrb r3, [r1]\n\
    adds r4, r0, 0\n\
    cmp r3, 0\n\
    beq _081143EE\n\
    subs r0, r3, 0x1\n\
    strb r0, [r1]\n\
_081143EE:\n\
    movs r5, 0\n\
    str r5, [sp]\n\
_081143F2:\n\
    movs r3, 0\n\
    adds r2, r4, 0\n\
    adds r0, r4, 0\n\
    adds r0, 0x84\n\
    ldr r1, [sp]\n\
    adds r0, r1, r0\n\
    adds r1, 0x1\n\
    str r1, [sp, 0x8]\n\
    bl _08114D84\n\
    .align 2, 0\n\
_08114408: .4byte gSharedMem + 0x14800\n\
_0811440C: .4byte 0x0000a0c4\n\
_08114410:\n\
    ldr r5, [sp]\n\
    lsls r0, r5, 5\n\
    adds r1, r3, r0\n\
    adds r2, 0xC4\n\
    adds r1, r2\n\
    ldrb r2, [r1]\n\
    mov r8, r0\n\
    adds r0, r3, 0x1\n\
    mov r10, r0\n\
    cmp r2, 0xC\n\
    bls _08114428\n\
    b _081148D2\n\
_08114428:\n\
    lsls r0, r2, 2\n\
    ldr r1, _08114434 @ =_08114438\n\
    adds r0, r1\n\
    ldr r0, [r0]\n\
    mov pc, r0\n\
    .align 2, 0\n\
_08114434: .4byte _08114438\n\
    .align 2, 0\n\
_08114438:\n\
    .4byte _081148D2\n\
    .4byte _0811446C\n\
    .4byte _081144F0\n\
    .4byte _0811457C\n\
    .4byte _08114600\n\
    .4byte _0811468C\n\
    .4byte _081146C8\n\
    .4byte _08114704\n\
    .4byte _08114740\n\
    .4byte _0811477C\n\
    .4byte _081147D0\n\
    .4byte _08114810\n\
    .4byte _08114858\n\
_0811446C:\n\
    movs r1, 0\n\
    str r1, [sp, 0x4]\n\
    lsls r0, r3, 1\n\
    ldr r2, [sp]\n\
    lsls r1, r2, 6\n\
    adds r0, r1\n\
    ldr r5, _081144E0 @ =0x000060c4\n\
    adds r2, r4, r5\n\
    adds r2, r0, r2\n\
    ldr r5, _081144E4 @ =0x000080c4\n\
    adds r1, r4, r5\n\
    adds r0, r1\n\
    ldrh r1, [r0]\n\
    ldrh r0, [r2]\n\
    adds r1, r0\n\
    movs r0, 0xFF\n\
    lsls r0, 8\n\
    ands r0, r1\n\
    lsrs r5, r0, 8\n\
    movs r0, 0xFF\n\
    ands r1, r0\n\
    strh r1, [r2]\n\
    movs r6, 0\n\
    adds r1, r3, 0x1\n\
    mov r10, r1\n\
    ldr r2, [sp, 0x4]\n\
    cmp r2, r5\n\
    blt _081144A6\n\
    b _081148D2\n\
_081144A6:\n\
    mov r9, r4\n\
    mov r4, r8\n\
    adds r7, r3, r4\n\
    ldr r0, _081144E8 @ =0x000030c4\n\
    add r0, r9\n\
    adds r4, r7, r0\n\
    ldr r0, _081144EC @ =0x000020c4\n\
    add r0, r9\n\
    adds r2, r7, r0\n\
_081144B8:\n\
    ldrb r0, [r4]\n\
    subs r0, 0x1\n\
    strb r0, [r4]\n\
    ldrb r1, [r4]\n\
    ldr r0, [sp]\n\
    str r2, [sp, 0xC]\n\
    str r3, [sp, 0x10]\n\
    bl sub_8114DB4\n\
    ldrb r0, [r4]\n\
    ldr r2, [sp, 0xC]\n\
    ldr r3, [sp, 0x10]\n\
    ldrb r1, [r2]\n\
    cmp r0, r1\n\
    bne _081144D8\n\
    b _081148A0\n\
_081144D8:\n\
    adds r6, 0x1\n\
    cmp r6, r5\n\
    blt _081144B8\n\
    b _081148D2\n\
    .align 2, 0\n\
_081144E0: .4byte 0x000060c4\n\
_081144E4: .4byte 0x000080c4\n\
_081144E8: .4byte 0x000030c4\n\
_081144EC: .4byte 0x000020c4\n\
_081144F0:\n\
    movs r2, 0\n\
    str r2, [sp, 0x4]\n\
    ldr r4, _08114568 @ =gSharedMem + 0x14800\n\
    lsls r0, r3, 1\n\
    ldr r5, [sp]\n\
    lsls r1, r5, 6\n\
    adds r0, r1\n\
    ldr r1, _0811456C @ =0x000060c4\n\
    adds r2, r4, r1\n\
    adds r2, r0, r2\n\
    ldr r5, _08114570 @ =0x000080c4\n\
    adds r1, r4, r5\n\
    adds r0, r1\n\
    ldrh r1, [r0]\n\
    ldrh r0, [r2]\n\
    adds r1, r0\n\
    movs r0, 0xFF\n\
    lsls r0, 8\n\
    ands r0, r1\n\
    lsrs r5, r0, 8\n\
    movs r0, 0xFF\n\
    ands r1, r0\n\
    strh r1, [r2]\n\
    movs r6, 0\n\
    adds r1, r3, 0x1\n\
    mov r10, r1\n\
    ldr r2, [sp, 0x4]\n\
    cmp r2, r5\n\
    blt _0811452C\n\
    b _081148D2\n\
_0811452C:\n\
    mov r9, r4\n\
    mov r4, r8\n\
    adds r7, r3, r4\n\
    ldr r0, _08114574 @ =0x000030c4\n\
    add r0, r9\n\
    adds r4, r7, r0\n\
    ldr r0, _08114578 @ =0x000020c4\n\
    add r0, r9\n\
    adds r2, r7, r0\n\
_0811453E:\n\
    ldrb r0, [r4]\n\
    ldrb r1, [r2]\n\
    cmp r0, r1\n\
    bne _08114548\n\
    b _081148B8\n\
_08114548:\n\
    adds r1, r0, 0\n\
    ldr r0, [sp]\n\
    str r2, [sp, 0xC]\n\
    str r3, [sp, 0x10]\n\
    bl sub_8114DF0\n\
    ldrb r0, [r4]\n\
    subs r0, 0x1\n\
    strb r0, [r4]\n\
    adds r6, 0x1\n\
    ldr r2, [sp, 0xC]\n\
    ldr r3, [sp, 0x10]\n\
    cmp r6, r5\n\
    blt _0811453E\n\
    b _081148D2\n\
    .align 2, 0\n\
_08114568: .4byte gSharedMem + 0x14800\n\
_0811456C: .4byte 0x000060c4\n\
_08114570: .4byte 0x000080c4\n\
_08114574: .4byte 0x000030c4\n\
_08114578: .4byte 0x000020c4\n\
_0811457C:\n\
    movs r2, 0\n\
    str r2, [sp, 0x4]\n\
    lsls r0, r3, 1\n\
    ldr r5, [sp]\n\
    lsls r1, r5, 6\n\
    adds r0, r1\n\
    ldr r1, _081145F0 @ =0x000060c4\n\
    adds r2, r4, r1\n\
    adds r2, r0, r2\n\
    ldr r5, _081145F4 @ =0x000080c4\n\
    adds r1, r4, r5\n\
    adds r0, r1\n\
    ldrh r1, [r0]\n\
    ldrh r0, [r2]\n\
    adds r1, r0\n\
    movs r0, 0xFF\n\
    lsls r0, 8\n\
    ands r0, r1\n\
    lsrs r5, r0, 8\n\
    movs r0, 0xFF\n\
    ands r1, r0\n\
    strh r1, [r2]\n\
    movs r6, 0\n\
    adds r1, r3, 0x1\n\
    mov r10, r1\n\
    ldr r2, [sp, 0x4]\n\
    cmp r2, r5\n\
    blt _081145B6\n\
    b _081148D2\n\
_081145B6:\n\
    mov r9, r4\n\
    mov r4, r8\n\
    adds r7, r3, r4\n\
    ldr r0, _081145F8 @ =0x000030c4\n\
    add r0, r9\n\
    adds r4, r7, r0\n\
    ldr r0, _081145FC @ =0x000020c4\n\
    add r0, r9\n\
    adds r2, r7, r0\n\
_081145C8:\n\
    ldrb r0, [r4]\n\
    adds r0, 0x1\n\
    strb r0, [r4]\n\
    ldrb r1, [r4]\n\
    ldr r0, [sp]\n\
    str r2, [sp, 0xC]\n\
    str r3, [sp, 0x10]\n\
    bl sub_8114DB4\n\
    ldrb r0, [r4]\n\
    ldr r2, [sp, 0xC]\n\
    ldr r3, [sp, 0x10]\n\
    ldrb r1, [r2]\n\
    cmp r0, r1\n\
    bne _081145E8\n\
    b _081148AC\n\
_081145E8:\n\
    adds r6, 0x1\n\
    cmp r6, r5\n\
    blt _081145C8\n\
    b _081148D2\n\
    .align 2, 0\n\
_081145F0: .4byte 0x000060c4\n\
_081145F4: .4byte 0x000080c4\n\
_081145F8: .4byte 0x000030c4\n\
_081145FC: .4byte 0x000020c4\n\
_08114600:\n\
    movs r2, 0\n\
    str r2, [sp, 0x4]\n\
    ldr r4, _08114678 @ =gSharedMem + 0x14800\n\
    lsls r0, r3, 1\n\
    ldr r5, [sp]\n\
    lsls r1, r5, 6\n\
    adds r0, r1\n\
    ldr r1, _0811467C @ =0x000060c4\n\
    adds r2, r4, r1\n\
    adds r2, r0, r2\n\
    ldr r5, _08114680 @ =0x000080c4\n\
    adds r1, r4, r5\n\
    adds r0, r1\n\
    ldrh r1, [r0]\n\
    ldrh r0, [r2]\n\
    adds r1, r0\n\
    movs r0, 0xFF\n\
    lsls r0, 8\n\
    ands r0, r1\n\
    lsrs r5, r0, 8\n\
    movs r0, 0xFF\n\
    ands r1, r0\n\
    strh r1, [r2]\n\
    movs r6, 0\n\
    adds r1, r3, 0x1\n\
    mov r10, r1\n\
    ldr r2, [sp, 0x4]\n\
    cmp r2, r5\n\
    blt _0811463C\n\
    b _081148D2\n\
_0811463C:\n\
    mov r9, r4\n\
    mov r4, r8\n\
    adds r7, r3, r4\n\
    ldr r0, _08114684 @ =0x000030c4\n\
    add r0, r9\n\
    adds r4, r7, r0\n\
    ldr r0, _08114688 @ =0x000020c4\n\
    add r0, r9\n\
    adds r2, r7, r0\n\
_0811464E:\n\
    ldrb r0, [r4]\n\
    ldrb r1, [r2]\n\
    cmp r0, r1\n\
    bne _08114658\n\
    b _081148B8\n\
_08114658:\n\
    adds r1, r0, 0\n\
    ldr r0, [sp]\n\
    str r2, [sp, 0xC]\n\
    str r3, [sp, 0x10]\n\
    bl sub_8114DF0\n\
    ldrb r0, [r4]\n\
    adds r0, 0x1\n\
    strb r0, [r4]\n\
    adds r6, 0x1\n\
    ldr r2, [sp, 0xC]\n\
    ldr r3, [sp, 0x10]\n\
    cmp r6, r5\n\
    blt _0811464E\n\
    b _081148D2\n\
    .align 2, 0\n\
_08114678: .4byte gSharedMem + 0x14800\n\
_0811467C: .4byte 0x000060c4\n\
_08114680: .4byte 0x000080c4\n\
_08114684: .4byte 0x000030c4\n\
_08114688: .4byte 0x000020c4\n\
_0811468C:\n\
    movs r2, 0\n\
    str r2, [sp, 0x4]\n\
    ldr r5, _081146C0 @ =gSharedMem + 0x14800\n\
    mov r0, r8\n\
    adds r4, r3, r0\n\
    ldr r1, _081146C4 @ =0x000030c4\n\
    adds r0, r5, r1\n\
    adds r0, r4, r0\n\
    ldrb r1, [r0]\n\
    ldr r0, [sp]\n\
    str r3, [sp, 0x10]\n\
    bl sub_8114E48\n\
    lsls r0, 24\n\
    ldr r3, [sp, 0x10]\n\
    adds r2, r3, 0x1\n\
    mov r10, r2\n\
    cmp r0, 0\n\
    bne _081146B4\n\
    b _081148D2\n\
_081146B4:\n\
    adds r0, r5, 0\n\
    adds r0, 0xC4\n\
    adds r0, r4, r0\n\
    movs r1, 0x9\n\
    strb r1, [r0]\n\
    b _081148D2\n\
    .align 2, 0\n\
_081146C0: .4byte gSharedMem + 0x14800\n\
_081146C4: .4byte 0x000030c4\n\
_081146C8:\n\
    movs r4, 0\n\
    str r4, [sp, 0x4]\n\
    ldr r5, _081146FC @ =gSharedMem + 0x14800\n\
    mov r0, r8\n\
    adds r4, r3, r0\n\
    ldr r1, _08114700 @ =0x000030c4\n\
    adds r0, r5, r1\n\
    adds r0, r4, r0\n\
    ldrb r1, [r0]\n\
    ldr r0, [sp]\n\
    str r3, [sp, 0x10]\n\
    bl sub_8114E48\n\
    lsls r0, 24\n\
    ldr r3, [sp, 0x10]\n\
    adds r2, r3, 0x1\n\
    mov r10, r2\n\
    cmp r0, 0\n\
    bne _081146F0\n\
    b _081148D2\n\
_081146F0:\n\
    adds r0, r5, 0\n\
    adds r0, 0xC4\n\
    adds r0, r4, r0\n\
    movs r1, 0xA\n\
    strb r1, [r0]\n\
    b _081148D2\n\
    .align 2, 0\n\
_081146FC: .4byte gSharedMem + 0x14800\n\
_08114700: .4byte 0x000030c4\n\
_08114704:\n\
    movs r4, 0\n\
    str r4, [sp, 0x4]\n\
    ldr r5, _08114738 @ =gSharedMem + 0x14800\n\
    mov r0, r8\n\
    adds r4, r3, r0\n\
    ldr r1, _0811473C @ =0x000030c4\n\
    adds r0, r5, r1\n\
    adds r0, r4, r0\n\
    ldrb r1, [r0]\n\
    ldr r0, [sp]\n\
    str r3, [sp, 0x10]\n\
    bl sub_8114E48\n\
    lsls r0, 24\n\
    ldr r3, [sp, 0x10]\n\
    adds r2, r3, 0x1\n\
    mov r10, r2\n\
    cmp r0, 0\n\
    bne _0811472C\n\
    b _081148D2\n\
_0811472C:\n\
    adds r0, r5, 0\n\
    adds r0, 0xC4\n\
    adds r0, r4, r0\n\
    movs r1, 0xB\n\
    strb r1, [r0]\n\
    b _081148D2\n\
    .align 2, 0\n\
_08114738: .4byte gSharedMem + 0x14800\n\
_0811473C: .4byte 0x000030c4\n\
_08114740:\n\
    movs r4, 0\n\
    str r4, [sp, 0x4]\n\
    ldr r5, _08114774 @ =gSharedMem + 0x14800\n\
    mov r0, r8\n\
    adds r4, r3, r0\n\
    ldr r1, _08114778 @ =0x000030c4\n\
    adds r0, r5, r1\n\
    adds r0, r4, r0\n\
    ldrb r1, [r0]\n\
    ldr r0, [sp]\n\
    str r3, [sp, 0x10]\n\
    bl sub_8114E48\n\
    lsls r0, 24\n\
    ldr r3, [sp, 0x10]\n\
    adds r2, r3, 0x1\n\
    mov r10, r2\n\
    cmp r0, 0\n\
    bne _08114768\n\
    b _081148D2\n\
_08114768:\n\
    adds r0, r5, 0\n\
    adds r0, 0xC4\n\
    adds r0, r4, r0\n\
    movs r1, 0xC\n\
    strb r1, [r0]\n\
    b _081148D2\n\
    .align 2, 0\n\
_08114774: .4byte gSharedMem + 0x14800\n\
_08114778: .4byte 0x000030c4\n\
_0811477C:\n\
    movs r4, 0\n\
    str r4, [sp, 0x4]\n\
    ldr r6, _081147B4 @ =gSharedMem + 0x14800\n\
    mov r0, r8\n\
    adds r5, r3, r0\n\
    ldr r1, _081147B8 @ =0x000030c4\n\
    adds r4, r6, r1\n\
    adds r4, r5, r4\n\
    ldrb r1, [r4]\n\
    ldr r0, [sp]\n\
    str r3, [sp, 0x10]\n\
    bl sub_8114DB4\n\
    ldr r2, _081147BC @ =0x000020c4\n\
    adds r0, r6, r2\n\
    adds r0, r5, r0\n\
    ldrb r1, [r4]\n\
    ldr r3, [sp, 0x10]\n\
    ldrb r0, [r0]\n\
    cmp r1, r0\n\
    bne _081147C0\n\
    adds r0, r6, 0\n\
    adds r0, 0xC4\n\
    adds r0, r5, r0\n\
    mov r4, sp\n\
    ldrb r4, [r4, 0x4]\n\
    strb r4, [r0]\n\
    b _08114844\n\
    .align 2, 0\n\
_081147B4: .4byte gSharedMem + 0x14800\n\
_081147B8: .4byte 0x000030c4\n\
_081147BC: .4byte 0x000020c4\n\
_081147C0:\n\
    adds r0, r6, 0\n\
    adds r0, 0xC4\n\
    adds r0, r5, r0\n\
    movs r1, 0x1\n\
    strb r1, [r0]\n\
    adds r0, r3, 0x1\n\
    mov r10, r0\n\
    b _081148D2\n\
_081147D0:\n\
    movs r1, 0\n\
    str r1, [sp, 0x4]\n\
    ldr r6, _08114804 @ =gSharedMem + 0x14800\n\
    mov r2, r8\n\
    adds r5, r3, r2\n\
    ldr r0, _08114808 @ =0x000030c4\n\
    adds r4, r6, r0\n\
    adds r4, r5, r4\n\
    ldrb r1, [r4]\n\
    ldr r0, [sp]\n\
    str r3, [sp, 0x10]\n\
    bl sub_8114DF0\n\
    ldr r1, _0811480C @ =0x000020c4\n\
    adds r0, r6, r1\n\
    adds r0, r5, r0\n\
    ldrb r1, [r4]\n\
    ldr r3, [sp, 0x10]\n\
    ldrb r0, [r0]\n\
    cmp r1, r0\n\
    beq _08114882\n\
    adds r0, r6, 0\n\
    adds r0, 0xC4\n\
    adds r0, r5, r0\n\
    movs r1, 0x2\n\
    b _08114842\n\
    .align 2, 0\n\
_08114804: .4byte gSharedMem + 0x14800\n\
_08114808: .4byte 0x000030c4\n\
_0811480C: .4byte 0x000020c4\n\
_08114810:\n\
    movs r0, 0\n\
    str r0, [sp, 0x4]\n\
    ldr r6, _0811484C @ =gSharedMem + 0x14800\n\
    mov r1, r8\n\
    adds r5, r3, r1\n\
    ldr r2, _08114850 @ =0x000030c4\n\
    adds r4, r6, r2\n\
    adds r4, r5, r4\n\
    ldrb r1, [r4]\n\
    ldr r0, [sp]\n\
    str r3, [sp, 0x10]\n\
    bl sub_8114DB4\n\
    ldr r1, _08114854 @ =0x000020c4\n\
    adds r0, r6, r1\n\
    adds r0, r5, r0\n\
    ldrb r1, [r4]\n\
    ldr r3, [sp, 0x10]\n\
    ldrb r0, [r0]\n\
    cmp r1, r0\n\
    beq _08114882\n\
    adds r0, r6, 0\n\
    adds r0, 0xC4\n\
    adds r0, r5, r0\n\
    movs r1, 0x3\n\
_08114842:\n\
    strb r1, [r0]\n\
_08114844:\n\
    adds r5, r3, 0x1\n\
    mov r10, r5\n\
    b _081148D2\n\
    .align 2, 0\n\
_0811484C: .4byte gSharedMem + 0x14800\n\
_08114850: .4byte 0x000030c4\n\
_08114854: .4byte 0x000020c4\n\
_08114858:\n\
    movs r0, 0\n\
    str r0, [sp, 0x4]\n\
    ldr r6, _08114894 @ =gSharedMem + 0x14800\n\
    mov r1, r8\n\
    adds r5, r3, r1\n\
    ldr r2, _08114898 @ =0x000030c4\n\
    adds r4, r6, r2\n\
    adds r4, r5, r4\n\
    ldrb r1, [r4]\n\
    ldr r0, [sp]\n\
    str r3, [sp, 0x10]\n\
    bl sub_8114DF0\n\
    ldr r1, _0811489C @ =0x000020c4\n\
    adds r0, r6, r1\n\
    adds r0, r5, r0\n\
    ldrb r1, [r4]\n\
    ldr r3, [sp, 0x10]\n\
    ldrb r0, [r0]\n\
    cmp r1, r0\n\
    bne _081148C4\n\
_08114882:\n\
    adds r0, r6, 0\n\
    adds r0, 0xC4\n\
    adds r0, r5, r0\n\
    mov r2, sp\n\
    ldrb r2, [r2, 0x4]\n\
    strb r2, [r0]\n\
    adds r4, r3, 0x1\n\
    mov r10, r4\n\
    b _081148D2\n\
    .align 2, 0\n\
_08114894: .4byte gSharedMem + 0x14800\n\
_08114898: .4byte 0x000030c4\n\
_0811489C: .4byte 0x000020c4\n\
_081148A0:\n\
    mov r0, r9\n\
    adds r0, 0xC4\n\
    adds r0, r7, r0\n\
    movs r5, 0\n\
    strb r5, [r0]\n\
    b _081148D2\n\
_081148AC:\n\
    mov r0, r9\n\
    adds r0, 0xC4\n\
    adds r0, r7, r0\n\
    movs r1, 0\n\
    strb r1, [r0]\n\
    b _081148D2\n\
_081148B8:\n\
    mov r0, r9\n\
    adds r0, 0xC4\n\
    adds r0, r7, r0\n\
    movs r1, 0\n\
    strb r1, [r0]\n\
    b _081148D2\n\
_081148C4:\n\
    adds r0, r6, 0\n\
    adds r0, 0xC4\n\
    adds r0, r5, r0\n\
    movs r1, 0x4\n\
    strb r1, [r0]\n\
    adds r2, r3, 0x1\n\
    mov r10, r2\n\
_081148D2:\n\
    ldr r0, _081148F4 @ =gSharedMem + 0x14800\n\
    mov r4, r8\n\
    adds r1, r3, r4\n\
    ldr r5, _081148F8 @ =0x000008c4\n\
    adds r2, r0, r5\n\
    adds r1, r2\n\
    ldrb r1, [r1]\n\
    adds r4, r0, 0\n\
    cmp r1, 0xC\n\
    bls _081148E8\n\
    b _08114D76\n\
_081148E8:\n\
    lsls r0, r1, 2\n\
    ldr r1, _081148FC @ =_08114900\n\
    adds r0, r1\n\
    ldr r0, [r0]\n\
    mov pc, r0\n\
    .align 2, 0\n\
_081148F4: .4byte gSharedMem + 0x14800\n\
_081148F8: .4byte 0x000008c4\n\
_081148FC: .4byte _08114900\n\
    .align 2, 0\n\
_08114900:\n\
    .4byte _08114D76\n\
    .4byte _08114934\n\
    .4byte _081149B8\n\
    .4byte _08114A3C\n\
    .4byte _08114AC0\n\
    .4byte _08114B44\n\
    .4byte _08114B7C\n\
    .4byte _08114BB4\n\
    .4byte _08114BEC\n\
    .4byte _08114C24\n\
    .4byte _08114C78\n\
    .4byte _08114CB8\n\
    .4byte _08114CF8\n\
_08114934:\n\
    movs r0, 0\n\
    str r0, [sp, 0x4]\n\
    lsls r0, r3, 1\n\
    ldr r2, [sp]\n\
    lsls r1, r2, 6\n\
    adds r0, r1\n\
    ldr r5, _081149A8 @ =0x000070c4\n\
    adds r2, r4, r5\n\
    adds r2, r0, r2\n\
    ldr r5, _081149AC @ =0x000090c4\n\
    adds r1, r4, r5\n\
    adds r0, r1\n\
    ldrh r1, [r0]\n\
    ldrh r0, [r2]\n\
    adds r1, r0\n\
    movs r0, 0xFF\n\
    lsls r0, 8\n\
    ands r0, r1\n\
    lsrs r5, r0, 8\n\
    movs r0, 0xFF\n\
    ands r1, r0\n\
    strh r1, [r2]\n\
    movs r6, 0\n\
    ldr r1, [sp, 0x4]\n\
    cmp r1, r5\n\
    blt _0811496A\n\
    b _08114D76\n\
_0811496A:\n\
    mov r9, r4\n\
    mov r2, r8\n\
    adds r7, r3, r2\n\
    ldr r0, _081149B0 @ =0x000038c4\n\
    add r0, r9\n\
    adds r4, r7, r0\n\
    movs r3, 0\n\
    ldr r0, _081149B4 @ =0x000028c4\n\
    add r0, r9\n\
    adds r2, r7, r0\n\
_0811497E:\n\
    ldrb r0, [r4]\n\
    subs r0, 0x1\n\
    strb r0, [r4]\n\
    ldrb r1, [r4]\n\
    ldr r0, [sp]\n\
    str r2, [sp, 0xC]\n\
    str r3, [sp, 0x10]\n\
    bl sub_8114DB4\n\
    ldrb r0, [r4]\n\
    ldr r2, [sp, 0xC]\n\
    ldr r3, [sp, 0x10]\n\
    ldrb r1, [r2]\n\
    cmp r0, r1\n\
    bne _0811499E\n\
    b _08114D4C\n\
_0811499E:\n\
    adds r6, 0x1\n\
    cmp r6, r5\n\
    blt _0811497E\n\
    b _08114D76\n\
    .align 2, 0\n\
_081149A8: .4byte 0x000070c4\n\
_081149AC: .4byte 0x000090c4\n\
_081149B0: .4byte 0x000038c4\n\
_081149B4: .4byte 0x000028c4\n\
_081149B8:\n\
    movs r2, 0\n\
    str r2, [sp, 0x4]\n\
    ldr r4, _08114A28 @ =gSharedMem + 0x14800\n\
    lsls r0, r3, 1\n\
    ldr r5, [sp]\n\
    lsls r1, r5, 6\n\
    adds r0, r1\n\
    ldr r1, _08114A2C @ =0x000070c4\n\
    adds r2, r4, r1\n\
    adds r2, r0, r2\n\
    ldr r5, _08114A30 @ =0x000090c4\n\
    adds r1, r4, r5\n\
    adds r0, r1\n\
    ldrh r1, [r0]\n\
    ldrh r0, [r2]\n\
    adds r1, r0\n\
    movs r0, 0xFF\n\
    lsls r0, 8\n\
    ands r0, r1\n\
    lsrs r5, r0, 8\n\
    movs r0, 0xFF\n\
    ands r1, r0\n\
    strh r1, [r2]\n\
    movs r6, 0\n\
    ldr r1, [sp, 0x4]\n\
    cmp r1, r5\n\
    blt _081149F0\n\
    b _08114D76\n\
_081149F0:\n\
    mov r9, r4\n\
    mov r2, r8\n\
    adds r7, r3, r2\n\
    ldr r0, _08114A34 @ =0x000038c4\n\
    add r0, r9\n\
    adds r4, r7, r0\n\
    ldr r0, _08114A38 @ =0x000028c4\n\
    add r0, r9\n\
    adds r2, r7, r0\n\
_08114A02:\n\
    ldrb r0, [r4]\n\
    ldrb r1, [r2]\n\
    cmp r0, r1\n\
    bne _08114A0C\n\
    b _08114D3C\n\
_08114A0C:\n\
    adds r1, r0, 0\n\
    ldr r0, [sp]\n\
    str r2, [sp, 0xC]\n\
    bl sub_8114DF0\n\
    ldrb r0, [r4]\n\
    subs r0, 0x1\n\
    strb r0, [r4]\n\
    adds r6, 0x1\n\
    ldr r2, [sp, 0xC]\n\
    cmp r6, r5\n\
    blt _08114A02\n\
    b _08114D76\n\
    .align 2, 0\n\
_08114A28: .4byte gSharedMem + 0x14800\n\
_08114A2C: .4byte 0x000070c4\n\
_08114A30: .4byte 0x000090c4\n\
_08114A34: .4byte 0x000038c4\n\
_08114A38: .4byte 0x000028c4\n\
_08114A3C:\n\
    movs r2, 0\n\
    str r2, [sp, 0x4]\n\
    lsls r0, r3, 1\n\
    ldr r5, [sp]\n\
    lsls r1, r5, 6\n\
    adds r0, r1\n\
    ldr r1, _08114AB0 @ =0x000070c4\n\
    adds r2, r4, r1\n\
    adds r2, r0, r2\n\
    ldr r5, _08114AB4 @ =0x000090c4\n\
    adds r1, r4, r5\n\
    adds r0, r1\n\
    ldrh r1, [r0]\n\
    ldrh r0, [r2]\n\
    adds r1, r0\n\
    movs r0, 0xFF\n\
    lsls r0, 8\n\
    ands r0, r1\n\
    lsrs r5, r0, 8\n\
    movs r0, 0xFF\n\
    ands r1, r0\n\
    strh r1, [r2]\n\
    movs r6, 0\n\
    ldr r1, [sp, 0x4]\n\
    cmp r1, r5\n\
    blt _08114A72\n\
    b _08114D76\n\
_08114A72:\n\
    mov r9, r4\n\
    mov r2, r8\n\
    adds r7, r3, r2\n\
    ldr r0, _08114AB8 @ =0x000038c4\n\
    add r0, r9\n\
    adds r4, r7, r0\n\
    movs r3, 0\n\
    ldr r0, _08114ABC @ =0x000028c4\n\
    add r0, r9\n\
    adds r2, r7, r0\n\
_08114A86:\n\
    ldrb r0, [r4]\n\
    adds r0, 0x1\n\
    strb r0, [r4]\n\
    ldrb r1, [r4]\n\
    ldr r0, [sp]\n\
    str r2, [sp, 0xC]\n\
    str r3, [sp, 0x10]\n\
    bl sub_8114DB4\n\
    ldrb r0, [r4]\n\
    ldr r2, [sp, 0xC]\n\
    ldr r3, [sp, 0x10]\n\
    ldrb r1, [r2]\n\
    cmp r0, r1\n\
    bne _08114AA6\n\
    b _08114D4C\n\
_08114AA6:\n\
    adds r6, 0x1\n\
    cmp r6, r5\n\
    blt _08114A86\n\
    b _08114D76\n\
    .align 2, 0\n\
_08114AB0: .4byte 0x000070c4\n\
_08114AB4: .4byte 0x000090c4\n\
_08114AB8: .4byte 0x000038c4\n\
_08114ABC: .4byte 0x000028c4\n\
_08114AC0:\n\
    movs r2, 0\n\
    str r2, [sp, 0x4]\n\
    ldr r4, _08114B30 @ =gSharedMem + 0x14800\n\
    lsls r0, r3, 1\n\
    ldr r5, [sp]\n\
    lsls r1, r5, 6\n\
    adds r0, r1\n\
    ldr r1, _08114B34 @ =0x000070c4\n\
    adds r2, r4, r1\n\
    adds r2, r0, r2\n\
    ldr r5, _08114B38 @ =0x000090c4\n\
    adds r1, r4, r5\n\
    adds r0, r1\n\
    ldrh r1, [r0]\n\
    ldrh r0, [r2]\n\
    adds r1, r0\n\
    movs r0, 0xFF\n\
    lsls r0, 8\n\
    ands r0, r1\n\
    lsrs r5, r0, 8\n\
    movs r0, 0xFF\n\
    ands r1, r0\n\
    strh r1, [r2]\n\
    movs r6, 0\n\
    ldr r1, [sp, 0x4]\n\
    cmp r1, r5\n\
    blt _08114AF8\n\
    b _08114D76\n\
_08114AF8:\n\
    mov r9, r4\n\
    mov r2, r8\n\
    adds r7, r3, r2\n\
    ldr r0, _08114B3C @ =0x000038c4\n\
    add r0, r9\n\
    adds r4, r7, r0\n\
    ldr r0, _08114B40 @ =0x000028c4\n\
    add r0, r9\n\
    adds r2, r7, r0\n\
_08114B0A:\n\
    ldrb r0, [r4]\n\
    ldrb r1, [r2]\n\
    cmp r0, r1\n\
    bne _08114B14\n\
    b _08114D5C\n\
_08114B14:\n\
    adds r1, r0, 0\n\
    ldr r0, [sp]\n\
    str r2, [sp, 0xC]\n\
    bl sub_8114DF0\n\
    ldrb r0, [r4]\n\
    adds r0, 0x1\n\
    strb r0, [r4]\n\
    adds r6, 0x1\n\
    ldr r2, [sp, 0xC]\n\
    cmp r6, r5\n\
    blt _08114B0A\n\
    b _08114D76\n\
    .align 2, 0\n\
_08114B30: .4byte gSharedMem + 0x14800\n\
_08114B34: .4byte 0x000070c4\n\
_08114B38: .4byte 0x000090c4\n\
_08114B3C: .4byte 0x000038c4\n\
_08114B40: .4byte 0x000028c4\n\
_08114B44:\n\
    movs r2, 0\n\
    str r2, [sp, 0x4]\n\
    ldr r5, _08114B70 @ =gSharedMem + 0x14800\n\
    mov r0, r8\n\
    adds r4, r3, r0\n\
    ldr r1, _08114B74 @ =0x000038c4\n\
    adds r0, r5, r1\n\
    adds r0, r4, r0\n\
    ldrb r1, [r0]\n\
    ldr r0, [sp]\n\
    bl sub_8114E48\n\
    lsls r0, 24\n\
    cmp r0, 0\n\
    bne _08114B64\n\
    b _08114D76\n\
_08114B64:\n\
    ldr r2, _08114B78 @ =0x000008c4\n\
    adds r0, r5, r2\n\
    adds r0, r4, r0\n\
    movs r1, 0x9\n\
    b _08114D74\n\
    .align 2, 0\n\
_08114B70: .4byte gSharedMem + 0x14800\n\
_08114B74: .4byte 0x000038c4\n\
_08114B78: .4byte 0x000008c4\n\
_08114B7C:\n\
    movs r4, 0\n\
    str r4, [sp, 0x4]\n\
    ldr r5, _08114BA8 @ =gSharedMem + 0x14800\n\
    mov r0, r8\n\
    adds r4, r3, r0\n\
    ldr r1, _08114BAC @ =0x000038c4\n\
    adds r0, r5, r1\n\
    adds r0, r4, r0\n\
    ldrb r1, [r0]\n\
    ldr r0, [sp]\n\
    bl sub_8114E48\n\
    lsls r0, 24\n\
    cmp r0, 0\n\
    bne _08114B9C\n\
    b _08114D76\n\
_08114B9C:\n\
    ldr r2, _08114BB0 @ =0x000008c4\n\
    adds r0, r5, r2\n\
    adds r0, r4, r0\n\
    movs r1, 0xA\n\
    b _08114D74\n\
    .align 2, 0\n\
_08114BA8: .4byte gSharedMem + 0x14800\n\
_08114BAC: .4byte 0x000038c4\n\
_08114BB0: .4byte 0x000008c4\n\
_08114BB4:\n\
    movs r4, 0\n\
    str r4, [sp, 0x4]\n\
    ldr r5, _08114BE0 @ =gSharedMem + 0x14800\n\
    mov r0, r8\n\
    adds r4, r3, r0\n\
    ldr r1, _08114BE4 @ =0x000038c4\n\
    adds r0, r5, r1\n\
    adds r0, r4, r0\n\
    ldrb r1, [r0]\n\
    ldr r0, [sp]\n\
    bl sub_8114E48\n\
    lsls r0, 24\n\
    cmp r0, 0\n\
    bne _08114BD4\n\
    b _08114D76\n\
_08114BD4:\n\
    ldr r2, _08114BE8 @ =0x000008c4\n\
    adds r0, r5, r2\n\
    adds r0, r4, r0\n\
    movs r1, 0xB\n\
    b _08114D74\n\
    .align 2, 0\n\
_08114BE0: .4byte gSharedMem + 0x14800\n\
_08114BE4: .4byte 0x000038c4\n\
_08114BE8: .4byte 0x000008c4\n\
_08114BEC:\n\
    movs r4, 0\n\
    str r4, [sp, 0x4]\n\
    ldr r5, _08114C18 @ =gSharedMem + 0x14800\n\
    mov r0, r8\n\
    adds r4, r3, r0\n\
    ldr r1, _08114C1C @ =0x000038c4\n\
    adds r0, r5, r1\n\
    adds r0, r4, r0\n\
    ldrb r1, [r0]\n\
    ldr r0, [sp]\n\
    bl sub_8114E48\n\
    lsls r0, 24\n\
    cmp r0, 0\n\
    bne _08114C0C\n\
    b _08114D76\n\
_08114C0C:\n\
    ldr r2, _08114C20 @ =0x000008c4\n\
    adds r0, r5, r2\n\
    adds r0, r4, r0\n\
    movs r1, 0xC\n\
    b _08114D74\n\
    .align 2, 0\n\
_08114C18: .4byte gSharedMem + 0x14800\n\
_08114C1C: .4byte 0x000038c4\n\
_08114C20: .4byte 0x000008c4\n\
_08114C24:\n\
    movs r4, 0\n\
    str r4, [sp, 0x4]\n\
    ldr r6, _08114C58 @ =gSharedMem + 0x14800\n\
    mov r0, r8\n\
    adds r5, r3, r0\n\
    ldr r1, _08114C5C @ =0x000038c4\n\
    adds r4, r6, r1\n\
    adds r4, r5, r4\n\
    ldrb r1, [r4]\n\
    ldr r0, [sp]\n\
    bl sub_8114DB4\n\
    ldr r2, _08114C60 @ =0x000028c4\n\
    adds r0, r6, r2\n\
    adds r0, r5, r0\n\
    ldrb r1, [r4]\n\
    ldrb r0, [r0]\n\
    cmp r1, r0\n\
    bne _08114C68\n\
    ldr r4, _08114C64 @ =0x000008c4\n\
    adds r0, r6, r4\n\
    adds r0, r5, r0\n\
    mov r5, sp\n\
    ldrb r5, [r5, 0x4]\n\
    strb r5, [r0]\n\
    b _08114D76\n\
    .align 2, 0\n\
_08114C58: .4byte gSharedMem + 0x14800\n\
_08114C5C: .4byte 0x000038c4\n\
_08114C60: .4byte 0x000028c4\n\
_08114C64: .4byte 0x000008c4\n\
_08114C68:\n\
    ldr r1, _08114C74 @ =0x000008c4\n\
    adds r0, r6, r1\n\
    adds r0, r5, r0\n\
    movs r1, 0x1\n\
    b _08114D74\n\
    .align 2, 0\n\
_08114C74: .4byte 0x000008c4\n\
_08114C78:\n\
    movs r2, 0\n\
    str r2, [sp, 0x4]\n\
    ldr r6, _08114CA8 @ =gSharedMem + 0x14800\n\
    mov r4, r8\n\
    adds r5, r3, r4\n\
    ldr r0, _08114CAC @ =0x000038c4\n\
    adds r4, r6, r0\n\
    adds r4, r5, r4\n\
    ldrb r1, [r4]\n\
    ldr r0, [sp]\n\
    bl sub_8114DF0\n\
    ldr r1, _08114CB0 @ =0x000028c4\n\
    adds r0, r6, r1\n\
    adds r0, r5, r0\n\
    ldrb r1, [r4]\n\
    ldrb r0, [r0]\n\
    cmp r1, r0\n\
    beq _08114D1E\n\
    ldr r1, _08114CB4 @ =0x000008c4\n\
    adds r0, r6, r1\n\
    adds r0, r5, r0\n\
    movs r1, 0x2\n\
    b _08114D74\n\
    .align 2, 0\n\
_08114CA8: .4byte gSharedMem + 0x14800\n\
_08114CAC: .4byte 0x000038c4\n\
_08114CB0: .4byte 0x000028c4\n\
_08114CB4: .4byte 0x000008c4\n\
_08114CB8:\n\
    movs r2, 0\n\
    str r2, [sp, 0x4]\n\
    ldr r6, _08114CE8 @ =gSharedMem + 0x14800\n\
    mov r4, r8\n\
    adds r5, r3, r4\n\
    ldr r0, _08114CEC @ =0x000038c4\n\
    adds r4, r6, r0\n\
    adds r4, r5, r4\n\
    ldrb r1, [r4]\n\
    ldr r0, [sp]\n\
    bl sub_8114DB4\n\
    ldr r1, _08114CF0 @ =0x000028c4\n\
    adds r0, r6, r1\n\
    adds r0, r5, r0\n\
    ldrb r1, [r4]\n\
    ldrb r0, [r0]\n\
    cmp r1, r0\n\
    beq _08114D1E\n\
    ldr r1, _08114CF4 @ =0x000008c4\n\
    adds r0, r6, r1\n\
    adds r0, r5, r0\n\
    movs r1, 0x3\n\
    b _08114D74\n\
    .align 2, 0\n\
_08114CE8: .4byte gSharedMem + 0x14800\n\
_08114CEC: .4byte 0x000038c4\n\
_08114CF0: .4byte 0x000028c4\n\
_08114CF4: .4byte 0x000008c4\n\
_08114CF8:\n\
    movs r2, 0\n\
    str r2, [sp, 0x4]\n\
    ldr r6, _08114D2C @ =gSharedMem + 0x14800\n\
    mov r4, r8\n\
    adds r5, r3, r4\n\
    ldr r0, _08114D30 @ =0x000038c4\n\
    adds r4, r6, r0\n\
    adds r4, r5, r4\n\
    ldrb r1, [r4]\n\
    ldr r0, [sp]\n\
    bl sub_8114DF0\n\
    ldr r1, _08114D34 @ =0x000028c4\n\
    adds r0, r6, r1\n\
    adds r0, r5, r0\n\
    ldrb r1, [r4]\n\
    ldrb r0, [r0]\n\
    cmp r1, r0\n\
    bne _08114D6C\n\
_08114D1E:\n\
    ldr r2, _08114D38 @ =0x000008c4\n\
    adds r0, r6, r2\n\
    adds r0, r5, r0\n\
    mov r4, sp\n\
    ldrb r4, [r4, 0x4]\n\
    strb r4, [r0]\n\
    b _08114D76\n\
    .align 2, 0\n\
_08114D2C: .4byte gSharedMem + 0x14800\n\
_08114D30: .4byte 0x000038c4\n\
_08114D34: .4byte 0x000028c4\n\
_08114D38: .4byte 0x000008c4\n\
_08114D3C:\n\
    ldr r0, _08114D48 @ =0x000008c4\n\
    add r0, r9\n\
    adds r0, r7, r0\n\
    movs r1, 0\n\
    b _08114D74\n\
    .align 2, 0\n\
_08114D48: .4byte 0x000008c4\n\
_08114D4C:\n\
    ldr r0, _08114D58 @ =0x000008c4\n\
    add r0, r9\n\
    adds r0, r7, r0\n\
    strb r3, [r0]\n\
    b _08114D76\n\
    .align 2, 0\n\
_08114D58: .4byte 0x000008c4\n\
_08114D5C:\n\
    ldr r0, _08114D68 @ =0x000008c4\n\
    add r0, r9\n\
    adds r0, r7, r0\n\
    movs r1, 0\n\
    b _08114D74\n\
    .align 2, 0\n\
_08114D68: .4byte 0x000008c4\n\
_08114D6C:\n\
    ldr r1, _08114DAC @ =0x000008c4\n\
    adds r0, r6, r1\n\
    adds r0, r5, r0\n\
    movs r1, 0x4\n\
_08114D74:\n\
    strb r1, [r0]\n\
_08114D76:\n\
    mov r3, r10\n\
    ldr r2, _08114DB0 @ =gSharedMem + 0x14800\n\
    adds r0, r2, 0\n\
    adds r0, 0x84\n\
    ldr r4, [sp]\n\
    adds r0, r4, r0\n\
    adds r4, r2, 0\n\
_08114D84:\n\
    ldrb r0, [r0]\n\
    cmp r3, r0\n\
    bge _08114D8E\n\
    bl _08114410\n\
_08114D8E:\n\
    ldr r5, [sp, 0x8]\n\
    str r5, [sp]\n\
    cmp r5, 0x3F\n\
    bgt _08114D9A\n\
    bl _081143F2\n\
_08114D9A:\n\
    ldr r0, [sp, 0x4]\n\
    add sp, 0x14\n\
    pop {r3-r5}\n\
    mov r8, r3\n\
    mov r9, r4\n\
    mov r10, r5\n\
    pop {r4-r7}\n\
    pop {r1}\n\
    bx r1\n\
    .align 2, 0\n\
_08114DAC: .4byte 0x000008c4\n\
_08114DB0: .4byte gSharedMem + 0x14800\n\
        .syntax divided");
}

void sub_8114DB4(u32 a, u8 b)
{
    u8 *r2 = sEvoInfo.unk40C4[a][b / 2];

    if (b % 2 != 0)
        *r2 |= 0xF0;
    else
        *r2 |= 0x0F;
}

void sub_8114DF0(u32 a, u8 b)
{
    u8 *r2 = sEvoInfo.unk40C4[a][b / 2];
    u8 *r1 = r2 + 0x6000;

    if (b % 2 != 0)
    {
        if (!(*r1 & 0xF0))
            *r2 &= 0x0F;
    }
    else
    {
        if (!(*r1 & 0x0F))
            *r2 &= 0xF0;
    }
}

NAKED
void sub_8114E48()
{
    asm(".syntax unified\n\
        push {r4-r7,lr}\n\
    adds r4, r0, 0\n\
    lsls r1, 24\n\
    lsrs r6, r1, 24\n\
    ldr r1, _08114E6C @ =gSharedMem + 0x14800\n\
    ldr r2, _08114E70 @ =0x0000a0c4\n\
    adds r0, r1, r2\n\
    ldrb r0, [r0]\n\
    adds r5, r1, 0\n\
    cmp r0, 0\n\
    bne _08114E60\n\
    b _08114F5E\n\
_08114E60:\n\
    movs r1, 0\n\
    movs r3, 0\n\
    cmp r4, 0\n\
    bne _08114E74\n\
    movs r1, 0x1\n\
    b _08114EA6\n\
    .align 2, 0\n\
_08114E6C: .4byte gSharedMem + 0x14800\n\
_08114E70: .4byte 0x0000a0c4\n\
_08114E74:\n\
    subs r0, r4, 0x1\n\
    lsls r0, 5\n\
    adds r2, r3, r0\n\
    adds r0, r5, 0\n\
    adds r0, 0xC4\n\
    adds r0, r2, r0\n\
    ldrb r0, [r0]\n\
    cmp r0, 0\n\
    bne _08114EA6\n\
    ldr r7, _08114EC4 @ =0x000008c4\n\
    adds r0, r5, r7\n\
    adds r0, r2, r0\n\
    ldrb r0, [r0]\n\
    cmp r0, 0\n\
    bne _08114EA6\n\
    adds r3, 0x1\n\
    cmp r3, 0x1F\n\
    bgt _08114EA6\n\
    cmp r4, 0\n\
    bne _08114E74\n\
    lsls r0, r1, 24\n\
    movs r1, 0x80\n\
    lsls r1, 17\n\
    adds r0, r1\n\
    lsrs r1, r0, 24\n\
_08114EA6:\n\
    cmp r3, 0x20\n\
    bne _08114EB4\n\
    lsls r0, r1, 24\n\
    movs r2, 0x80\n\
    lsls r2, 17\n\
    adds r0, r2\n\
    lsrs r1, r0, 24\n\
_08114EB4:\n\
    movs r3, 0\n\
    cmp r4, 0x3F\n\
    bne _08114EC8\n\
    lsls r0, r1, 24\n\
    movs r7, 0x80\n\
    lsls r7, 17\n\
    adds r0, r7\n\
    b _08114EF8\n\
    .align 2, 0\n\
_08114EC4: .4byte 0x000008c4\n\
_08114EC8:\n\
    adds r0, r4, 0x1\n\
    lsls r0, 5\n\
    adds r2, r3, r0\n\
    adds r0, r5, 0\n\
    adds r0, 0xC4\n\
    adds r0, r2, r0\n\
    ldrb r0, [r0]\n\
    cmp r0, 0\n\
    bne _08114EFA\n\
    ldr r7, _08114F64 @ =0x000008c4\n\
    adds r0, r5, r7\n\
    adds r0, r2, r0\n\
    ldrb r0, [r0]\n\
    cmp r0, 0\n\
    bne _08114EFA\n\
    adds r3, 0x1\n\
    cmp r3, 0x1F\n\
    bgt _08114EFA\n\
    cmp r4, 0x3F\n\
    bne _08114EC8\n\
    lsls r0, r1, 24\n\
    movs r1, 0x80\n\
    lsls r1, 17\n\
    adds r0, r1\n\
_08114EF8:\n\
    lsrs r1, r0, 24\n\
_08114EFA:\n\
    cmp r3, 0x20\n\
    bne _08114F08\n\
    lsls r0, r1, 24\n\
    movs r2, 0x80\n\
    lsls r2, 17\n\
    adds r0, r2\n\
    lsrs r1, r0, 24\n\
_08114F08:\n\
    cmp r1, 0x2\n\
    beq _08114F5E\n\
    subs r0, r6, 0x2\n\
    lsls r0, 24\n\
    lsrs r1, r0, 24\n\
    cmp r0, 0\n\
    bge _08114F18\n\
    movs r1, 0\n\
_08114F18:\n\
    adds r0, r6, 0x2\n\
    lsls r0, 24\n\
    lsrs r2, r0, 24\n\
    asrs r0, 24\n\
    cmp r0, 0x3F\n\
    ble _08114F26\n\
    movs r2, 0x3F\n\
_08114F26:\n\
    lsls r1, 24\n\
    asrs r3, r1, 24\n\
    lsls r0, r2, 24\n\
    asrs r2, r0, 24\n\
    adds r6, r1, 0\n\
    adds r7, r0, 0\n\
    cmp r3, r2\n\
    bge _08114F7C\n\
    cmp r4, 0\n\
    beq _08114F7C\n\
    subs r0, r4, 0x1\n\
    lsls r5, r0, 7\n\
    ldr r0, _08114F68 @ =gSharedMem + 0x188C4\n\
    mov r12, r0\n\
_08114F42:\n\
    asrs r0, r3, 1\n\
    lsls r0, 2\n\
    adds r0, r5\n\
    add r0, r12\n\
    ldr r1, [r0]\n\
    movs r0, 0x1\n\
    ands r0, r3\n\
    cmp r0, 0\n\
    beq _08114F6C\n\
    ldrb r1, [r1]\n\
    movs r0, 0xF0\n\
_08114F58:\n\
    ands r0, r1\n\
    cmp r0, 0\n\
    beq _08114F72\n\
_08114F5E:\n\
    movs r0, 0x1\n\
    b _08114FCA\n\
    .align 2, 0\n\
_08114F64: .4byte 0x000008c4\n\
_08114F68: .4byte gSharedMem + 0x188C4\n\
_08114F6C:\n\
    ldrb r1, [r1]\n\
    movs r0, 0xF\n\
    b _08114F58\n\
_08114F72:\n\
    adds r3, 0x1\n\
    cmp r3, r2\n\
    bge _08114F7C\n\
    cmp r4, 0\n\
    bne _08114F42\n\
_08114F7C:\n\
    asrs r3, r6, 24\n\
    asrs r1, r7, 24\n\
    cmp r3, r1\n\
    bge _08114FC8\n\
    cmp r4, 0x3F\n\
    beq _08114FC8\n\
    adds r0, r4, 0x1\n\
    lsls r5, r0, 7\n\
    ldr r6, _08114FB0 @ =gSharedMem + 0x188C4\n\
    adds r2, r1, 0\n\
_08114F90:\n\
    asrs r0, r3, 1\n\
    lsls r0, 2\n\
    adds r0, r5\n\
    adds r0, r6\n\
    ldr r1, [r0]\n\
    movs r0, 0x1\n\
    ands r0, r3\n\
    cmp r0, 0\n\
    beq _08114FB4\n\
    ldrb r1, [r1]\n\
    movs r0, 0xF0\n\
    ands r0, r1\n\
    cmp r0, 0\n\
    beq _08114FBE\n\
    b _08114F5E\n\
    .align 2, 0\n\
_08114FB0: .4byte gSharedMem + 0x188C4\n\
_08114FB4:\n\
    ldrb r1, [r1]\n\
    movs r0, 0xF\n\
    ands r0, r1\n\
    cmp r0, 0\n\
    bne _08114F5E\n\
_08114FBE:\n\
    adds r3, 0x1\n\
    cmp r3, r2\n\
    bge _08114FC8\n\
    cmp r4, 0x3F\n\
    bne _08114F90\n\
_08114FC8:\n\
    movs r0, 0\n\
_08114FCA:\n\
    pop {r4-r7}\n\
    pop {r1}\n\
    bx r1\n\
        .syntax divided");
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
