#include "global.h"
#include "trainer_card.h"
#include "constants/songs.h"
#include "contest_util.h"
#include "easy_chat.h"
#include "event_data.h"
#include "ewram.h"
#include "field_effect.h"
#include "graphics.h"
#include "link.h"
#include "m4a.h"
#include "main.h"
#include "menu.h"
#include "money.h"
#include "overworld.h"
#include "palette.h"
#include "pokedex.h"
#include "scanline_effect.h"
#include "sound.h"
#include "sprite.h"
#include "string_util.h"
#include "strings2.h"
#include "task.h"
#include "util.h"

typedef void (*Callback)(void);

struct Struct2000000
{
    /*0x00*/ u8 current_state;
    /*0x01*/ bool8 isShowingLinkCard;
    /*0x02*/ u8 starCount;
    /*0x03*/ bool8 backSideShown;
    /*0x04*/ u8 var_4;
    /*0x05*/ bool8 showColon;
    /*0x06*/ u8 frameCounter; /* Used to flash colon */
    /*0x07*/ bool8 showPokedexCount;
    /*0x08*/ bool8 showHallOfFame;
    /*0x09*/ bool8 showLinkBattleStatus;
    /*0x0A*/ bool8 showBattleTowerStatus;
    /*0x0B*/ bool8 showContestRecord;
    /*0x0C*/ bool8 showMixingRecord;
    /*0x0D*/ bool8 showTradingRecord;
    /*0x0E*/ bool8 ownedBadges[8];
    /*0x16*/ u8 filler_16[10];
    /*0x20*/ u8 easyChatPhrase[4][0x10];
    /*0x60*/ Callback *var_60;
    /*0x64*/ struct TrainerCard displayedCard;
    /*0x9C*/ u8 language; // 0x9C
};

extern struct LinkPlayerObjectEvent gLinkPlayerObjectEvents[];

EWRAM_DATA struct TrainerCard gTrainerCards[4] = {0};

extern const u16 gUnknown_083B5F0C[];
extern const u16 gBadgesPalette[];
extern const u16 gUnknown_083B5F4C[];
extern const u16 gUnknown_083B5F6C[];
extern const u16 gTrainerCardBadgesMap[][4];

const u8 gBadgesTiles[] = INCBIN_U8("graphics/trainer_card/badges.4bpp");

struct Struct2000000 * const gTrainerCardPtr = (struct Struct2000000 *)gSharedMem;

#if DEBUG
const struct TrainerCard sTestTrainerCard =
{
    .gender = FEMALE,
    .stars = 4,
    .hasPokedex = TRUE,
    .var_3 = TRUE,
    .var_4 = TRUE,
    .firstHallOfFameA = 999,
    .firstHallOfFameB = 99,
    .firstHallOfFameC = 99,
    .pokedexSeen = 411,
    .trainerId = 12345,
    .playTimeHours = 99,
    .playTimeMinutes = 99,
    .linkBattleWins = 9999,
    .linkBattleLosses = 9999,
    .battleTowerWins = 9999,
    .battleTowerLosses = 9999,
    .contestsWithFriends = 999,
    .pokeblocksWithFriends = 0xFFFF,
    .pokemonTrades = 0xFFFF,
    .money = 99999,
    .var_28 = {1, 2, 3, 4},
    .playerName = DTR("てすと", "TEST"),
};
#endif

bool8 TrainerCard_Init(struct Task *);
bool8 TrainerCard_WaitForFadeInToFinish(struct Task *);
bool8 TrainerCard_WaitForKeys(struct Task *);
bool8 TrainerCard_StartFlipAntimation(struct Task *);
bool8 TrainerCard_WaitForFlipToFinish(struct Task *);
bool8 TrainerCard_FadeOut(struct Task *);
bool8 TrainerCard_WaitForFadeOutToFinishAndQuit(struct Task *);

bool8 (*const TrainerCard_StateMachine[])(struct Task *) =
{
    TrainerCard_Init,
    TrainerCard_WaitForFadeInToFinish,
    TrainerCard_WaitForKeys,
    TrainerCard_StartFlipAntimation,
    TrainerCard_WaitForFlipToFinish,
    TrainerCard_FadeOut,
    TrainerCard_WaitForFadeOutToFinishAndQuit,
};

bool8 TrainerCard_InitFlipAnimation(struct Task *);
bool8 TrainerCard_ScaleDownFlipAnimation(struct Task *);
bool8 TrainerCard_SwitchToNewSide(struct Task *);
bool8 TrainerCard_ScaleUpFlipAnimation(struct Task *);
bool8 TrainerCard_FinishFlipAnimation(struct Task *);

bool8 (*const TrainerCard_FlipAnimationStateMachine[])(struct Task *) =
{
    TrainerCard_InitFlipAnimation,
    TrainerCard_ScaleDownFlipAnimation,
    TrainerCard_SwitchToNewSide,
    TrainerCard_ScaleUpFlipAnimation,
    TrainerCard_FinishFlipAnimation,
};

// FIXME: Other signature than on save_menu_util.h
void FormatPlayTime(u8 *playtime, u16 hours, u16 minutes, s16 colon);
u16 GetPokedexSeenCount(void);

enum
{
    TD_SHOWING_LINK_CARD,
    TD_CARD_INDEX,
    TD_CALLBACK,
};

static void sub_8093174(void);
static void sub_809323C(void);
static void sub_8093254(void);
static void TrainerCard_InitScreenForPlayer(Callback callBack);
static void TrainerCard_InitScreenForLinkPlayer(u8 arg1, Callback callBack);
void TrainerCard_FillTrainerCardStruct(void);
static void nullsub_60(u8);
static u32 sav12_xor_get_clamped_above(u8 index, u32 maxVal);
static u8 TrainerCard_GetStarCount(struct TrainerCard *);
static void sub_8093534(void);
static void sub_8093550(void);
static void sub_8093598(void);
static void sub_80935EC(void);
static void sub_8093610(void);
static void sub_8093688(void);
static void TrainerCard_FillFlags(void);
static void sub_80937A4(void);
static void sub_80937BC(void);
static void sub_80937D8(void);
static void sub_80937F0(void);
static void nullsub_15(void);
static void sub_8093800(void);
static void TrainerCard_CreateStateMachine(void);
static void TrainerCard_RunStateMachine(u8 taskId);
static void TrainerCard_CreatePrintPlayTimeTask(void);
static void TrainerCard_DestoryPlayTimeTask(void);
static void TrainerCard_Front_PrintPlayTime(u8 taskId);
static void TrainerCard_CreateFlipAnimationTask(void);
static u8 TrainerCard_HasFlipAnimationFinished(void);
static void TrainerCard_RunFlipAnimationStateMachine(u8 taskId);
static void TrainerCard_FlipAnimationHBlankCallback(void);
static void TrainerCard_DrawCard(void);
static void TrainerCard_DrawCardFront(void);
static void TrainerCard_DrawCardBack(void);
static void TrainerCard_ResetOffsetRegisters(void);
static void TrainerCard_CopyGraphics(void);
static void TrainerCard_LoadPalettes(void);
static void TrainerCard_LoadTrainerGraphics(void);
static void TrainerCard_LoadCardTileMap(void);
static void sub_8093F48(void);
static void sub_8093F64(void);
static void TrainerCard_LoadTrainerTilemap(void);
static void TrainerCard_DrawStars(void);
static void TrainerCard_DisplayBadges(void);
static void TrainerCard_ClearTrainerGraphics(void);
static void TrainerCard_ClearPokedexLabel(void);
static void TrainerCard_Front_PrintTexts(void);
static void TrainerCard_Back_PrintTexts(void);
static void TrainerCard_Front_PrintTrainerID(void);
static void TrainerCard_Front_PrintMoney(void);
static void TrainerCard_Front_PrintPokedexCount(void);
static void TrainerCard_Front_GetPlayTimeString(u8 *arg1, s16 colon);
static void TrainerCard_PrintEasyChatPhrase(void);
static void TrainerCard_Back_PrintName(void);
static void TrainerCard_Back_PrintHallOfFameTime_Label(void);
static void TrainerCard_Back_PrintHallOfFameTime(void);
static void TrainerCard_Back_PrintLinkBattlesLabel(void);
static void TrainerCard_Back_PrintLinkBattles(void);
static void TrainerCard_Back_PrintBattleTower_Label(void);
static void TrainerCard_Back_PrintBattleTower(void);
static void TrainerCard_Back_PrintLinkContests_Label(void);
static void TrainerCard_Back_PrintLinkContests(void);
static void TrainerCard_Back_PrintLinkPokeblocks_Label(void);
static void TrainerCard_Back_PrintLinkPokeblocks(void);
static void TrainerCard_Back_PrintPokemonTrades_Label(void);
static void TrainerCard_Back_PrintPokemonTrades(void);
void unref_sub_8094588(u16 left, u16 top);

#if DEBUG
static u8 gDebug_03000748;
#endif

void TrainerCard_ShowPlayerCard(Callback arg1)
{
#if DEBUG
    gDebug_03000748 = 0;
#endif
    TrainerCard_InitScreenForPlayer(arg1);
    SetMainCallback2(sub_8093174);
    gTrainerCardPtr->language = GAME_LANGUAGE;
}

void TrainerCard_ShowLinkCard(u8 playerIndex, Callback arg2)
{
#if DEBUG
    gDebug_03000748 = 0;
#endif
    TrainerCard_InitScreenForLinkPlayer(playerIndex, arg2);
    SetMainCallback2(sub_8093174);
    gTrainerCardPtr->language = gLinkPlayers[gLinkPlayerObjectEvents[playerIndex].linkPlayerId].language;
}

#if DEBUG
void debug_sub_80A0710(Callback callback)
{
    gDebug_03000748 = TRUE;
    TrainerCard_InitScreenForPlayer(callback);
    SetMainCallback2(sub_8093174);
    gTrainerCardPtr->language = GAME_LANGUAGE;
}

void debug_sub_80A073C(Callback callback)
{
    memcpy(&gTrainerCards[0], &sTestTrainerCard, sizeof(struct TrainerCard));
    gDebug_03000748=TRUE;
    TrainerCard_InitScreenForLinkPlayer(0, callback);
    SetMainCallback2(sub_8093174);
    gTrainerCardPtr->language = GAME_LANGUAGE;
}

void debug_sub_80A0780()
{
    int i;

    for (i = 0; i < 4; i++)
        memcpy(&gTrainerCards[i], &sTestTrainerCard, sizeof(struct TrainerCard));
}
#endif

static void sub_8093174(void)
{
    switch (gMain.state)
    {
    case 0:
        sub_8093534();
        sub_8093688();
        gMain.state++;
        break;
    case 1:
        sub_8093598();
        gMain.state++;
        break;
    case 2:
        sub_80935EC();
        gMain.state++;
        break;
    case 3:
        sub_8093610();
        sub_80937A4();
        gMain.state++;
        break;
    case 4:
        sub_80937BC();
        gMain.state++;
    case 5:
        if (MultistepInitMenuWindowContinue())
            gMain.state++;
        break;
    case 6:
        sub_80937F0();
        gMain.state++;
        break;
    case 7:
        sub_80937D8();
        gMain.state++;
        break;
    case 8:
        nullsub_15();
        sub_8093800();
        sub_8093550();
        SetMainCallback2(sub_809323C);
        break;
    }
}

static void sub_809323C(void)
{
    RunTasks();
    AnimateSprites();
    BuildOamBuffer();
    UpdatePaletteFade();
}

static void sub_8093254(void)
{
    LoadOam();
    ProcessSpriteCopyRequests();
    TransferPlttBuffer();
    gTrainerCardPtr->frameCounter++;
    if (gTrainerCardPtr->frameCounter >= 60)
    {
        gTrainerCardPtr->frameCounter = 0;
        gTrainerCardPtr->showColon ^= 1;
    }
    if (gTrainerCardPtr->var_4)
        DmaCopy16(3, &gScanlineEffectRegBuffers[0], &gScanlineEffectRegBuffers[1], 0x140);
}

static void TrainerCard_InitScreenForPlayer(Callback callBack)
{
    u8 taskId = CreateTask(nullsub_60, 0xFF);
    struct Task *task = &gTasks[taskId];
    task->data[TD_SHOWING_LINK_CARD] = FALSE;
    StoreWordInTwoHalfwords(&task->data[TD_CALLBACK], (u32)callBack);
}

static void TrainerCard_InitScreenForLinkPlayer(u8 arg1, Callback callBack)
{
    u8 taskId = CreateTask(nullsub_60, 0xFF);

    struct Task *task = &gTasks[taskId];
    task->data[TD_SHOWING_LINK_CARD] = TRUE;
    task->data[TD_CARD_INDEX] = arg1;
    StoreWordInTwoHalfwords(&task->data[TD_CALLBACK], (u32)callBack);
}

void TrainerCard_FillTrainerCardStruct(void)
{
    u8 taskId = FindTaskIdByFunc(nullsub_60);
    struct Task *task = &gTasks[taskId];
    gTrainerCardPtr->isShowingLinkCard = task->data[TD_SHOWING_LINK_CARD];

    LoadWordFromTwoHalfwords((u16 *)&task->data[TD_CALLBACK], (u32 *)&gTrainerCardPtr->var_60);

    if (gTrainerCardPtr->isShowingLinkCard)
    {
        gTrainerCardPtr->displayedCard = gTrainerCards[task->data[TD_CARD_INDEX]];
    }
    else
    {
        TrainerCard_GenerateCardForPlayer(&gTrainerCardPtr->displayedCard);
    }
}

static void nullsub_60(u8 taskid)
{
}

void TrainerCard_GenerateCardForPlayer(struct TrainerCard *trainerCard)
{
    u32 playTime;
    bool32 enteredHallOfFame;
    bool8 r4;
    u8 i;

    trainerCard->gender = gSaveBlock2.playerGender;
    trainerCard->playTimeHours = gSaveBlock2.playTimeHours;
    trainerCard->playTimeMinutes = gSaveBlock2.playTimeMinutes;

    playTime = GetGameStat(GAME_STAT_FIRST_HOF_PLAY_TIME);
    enteredHallOfFame = GetGameStat(GAME_STAT_ENTERED_HOF);
    if (!enteredHallOfFame)
    {
        playTime = 0;
    }
    trainerCard->firstHallOfFameA = playTime >> 16;
    trainerCard->firstHallOfFameB = (playTime >> 8) & 0xFF;
    trainerCard->firstHallOfFameC = playTime & 0xFF;

    trainerCard->hasPokedex = FlagGet(FLAG_SYS_POKEDEX_GET);
    trainerCard->var_3 = CompletedHoennPokedex();
    trainerCard->pokedexSeen = GetPokedexSeenCount();

    trainerCard->trainerId = (gSaveBlock2.playerTrainerId[1] << 8) | gSaveBlock2.playerTrainerId[0];

    // Link Cable Battles
    trainerCard->linkBattleWins = sav12_xor_get_clamped_above(GAME_STAT_LINK_BATTLE_WINS, 9999);
    trainerCard->linkBattleLosses = sav12_xor_get_clamped_above(GAME_STAT_LINK_BATTLE_LOSSES, 9999);

    // Contests w/ Friends
    trainerCard->contestsWithFriends = sav12_xor_get_clamped_above(GAME_STAT_WON_LINK_CONTEST, 999);

    // Pokéblocks w/ Friends
    trainerCard->pokeblocksWithFriends = sav12_xor_get_clamped_above(GAME_STAT_POKEBLOCKS_WITH_FRIENDS, 0xFFFF);

    // Pokémon Trades
    trainerCard->pokemonTrades = sav12_xor_get_clamped_above(GAME_STAT_POKEMON_TRADES, 0xFFFF);

    // Battle Tower
    trainerCard->battleTowerWins = gSaveBlock2.battleTower.totalBattleTowerWins;
    trainerCard->battleTowerLosses = gSaveBlock2.battleTower.bestBattleTowerWinStreak;
    if (trainerCard->battleTowerWins > 9999)
    {
        trainerCard->battleTowerWins = 9999;
    }
    if (trainerCard->battleTowerLosses > 9999)
    {
        trainerCard->battleTowerLosses = 9999;
    }

    r4 = FALSE;
    if (CountPlayerMuseumPaintings() > 4)
    {
        r4 = TRUE;
    }
    trainerCard->var_4 = r4;

    trainerCard->money = gSaveBlock1.money;

    for (i = 0; i < 4; i++)
    {
        trainerCard->var_28[i] = gSaveBlock1.easyChats.unk2B1C[i];
    }

    for (i = 0; i < 8; i++)
    {
        trainerCard->playerName[i] = gSaveBlock2.playerName[i];
    }

    trainerCard->stars = TrainerCard_GetStarCount(trainerCard);
}

u8 sub_80934C4(u8 id)
{
    return gTrainerCards[id].stars;
}

static u32 sav12_xor_get_clamped_above(u8 index, u32 maxVal)
{
    u32 value = GetGameStat(index);

    if (value > maxVal)
    {
        value = maxVal;
    }

    return value;
}

static u8 TrainerCard_GetStarCount(struct TrainerCard *trainerCard)
{
    u8 value = 0;

    if (trainerCard->firstHallOfFameA != 0 || trainerCard->firstHallOfFameB != 0 || trainerCard->firstHallOfFameC != 0)
    {
        value++;
    }

    if (trainerCard->var_3)
    {
        value++;
    }

    if (trainerCard->battleTowerLosses > 49)
    {
        value++;
    }

    if (trainerCard->var_4)
    {
        value++;
    }

    return value;
}

static void sub_8093534(void)
{
    SetVBlankCallback(NULL);
    SetHBlankCallback(NULL);
    REG_DISPCNT = 0;
}

static void sub_8093550(void)
{
    u16 backup;

    SetVBlankCallback(sub_8093254);

    backup = REG_IME;
    REG_IME = 0;
    REG_IE |= INTR_FLAG_VBLANK | INTR_FLAG_HBLANK;
    REG_IME = backup;

    REG_DISPSTAT |= DISPSTAT_VBLANK_INTR | DISPSTAT_HBLANK_INTR;
    REG_DISPCNT = DISPCNT_MODE_0 | DISPCNT_OBJ_1D_MAP | DISPCNT_BG_ALL_ON | DISPCNT_OBJ_ON;
}

void sub_8093598(void)
{
    DmaFill16Large(3, 0, (void *)VRAM, 0x10000, 0x1000);
}

void sub_80935EC(void)
{
    DmaFill16Defvars(3, 0, (void *)OAM, 0x400);
}

void sub_8093610(void)
{
    REG_BG0CNT = 0;
    REG_BG1CNT = 0;
    REG_BG2CNT = 0;
    REG_BG3CNT = 0;
    REG_BG0HOFS = 0;
    REG_BG0VOFS = 0;
    REG_BG1HOFS = 0;
    REG_BG1VOFS = 0;
    REG_BG2HOFS = 0;
    REG_BG2VOFS = 0;
    REG_BG3HOFS = 0;
    REG_BG3VOFS = 0;

    REG_BG0CNT = BGCNT_PRIORITY(0) | BGCNT_CHARBASE(2) | BGCNT_SCREENBASE(30) | BGCNT_16COLOR | BGCNT_TXT256x256;
    REG_BG1CNT = BGCNT_PRIORITY(1) | BGCNT_CHARBASE(0) | BGCNT_SCREENBASE(8)  | BGCNT_16COLOR | BGCNT_TXT256x256;
    REG_BG2CNT = BGCNT_PRIORITY(2) | BGCNT_CHARBASE(0) | BGCNT_SCREENBASE(9)  | BGCNT_16COLOR | BGCNT_TXT256x256;
    REG_BG3CNT = BGCNT_PRIORITY(3) | BGCNT_CHARBASE(0) | BGCNT_SCREENBASE(10) | BGCNT_16COLOR | BGCNT_TXT256x256;
}

static void sub_8093688(void)
{
    u8 i;

    TrainerCard_FillTrainerCardStruct();
    gTrainerCardPtr->current_state = 0;
    gTrainerCardPtr->backSideShown = FALSE;
    gTrainerCardPtr->var_4 = FALSE;
    gTrainerCardPtr->starCount = gTrainerCardPtr->displayedCard.stars;
    gTrainerCardPtr->showColon = 0;
    gTrainerCardPtr->frameCounter = 0;
    for (i = 0; i < 4; i++)
        EasyChat_GetWordText(gTrainerCardPtr->easyChatPhrase[i], gTrainerCardPtr->displayedCard.var_28[i]);
    TrainerCard_FillFlags();
}

static void TrainerCard_FillFlags(void)
{
    gTrainerCardPtr->showPokedexCount = 0;
    gTrainerCardPtr->showHallOfFame = 0;
    gTrainerCardPtr->showLinkBattleStatus = 0;
    gTrainerCardPtr->showBattleTowerStatus = 0;
    gTrainerCardPtr->showContestRecord = 0;
    gTrainerCardPtr->showMixingRecord = 0;
    gTrainerCardPtr->showTradingRecord = 0;
    memset(gTrainerCardPtr->ownedBadges, 0, sizeof(gTrainerCardPtr->ownedBadges));

    if (gTrainerCardPtr->displayedCard.hasPokedex)
        gTrainerCardPtr->showPokedexCount++;

    if (gTrainerCardPtr->displayedCard.firstHallOfFameA != 0
     || gTrainerCardPtr->displayedCard.firstHallOfFameB != 0
     || gTrainerCardPtr->displayedCard.firstHallOfFameC != 0)
        gTrainerCardPtr->showHallOfFame++;

    if (gTrainerCardPtr->displayedCard.linkBattleWins != 0 || gTrainerCardPtr->displayedCard.linkBattleLosses != 0)
        gTrainerCardPtr->showLinkBattleStatus++;

    if (gTrainerCardPtr->displayedCard.battleTowerWins != 0 || gTrainerCardPtr->displayedCard.battleTowerLosses != 0)
        gTrainerCardPtr->showBattleTowerStatus++;

    if (gTrainerCardPtr->displayedCard.contestsWithFriends != 0)
        gTrainerCardPtr->showContestRecord++;

    if (gTrainerCardPtr->displayedCard.pokeblocksWithFriends != 0)
        gTrainerCardPtr->showMixingRecord++;

    if (gTrainerCardPtr->displayedCard.pokemonTrades != 0)
        gTrainerCardPtr->showTradingRecord++;

    if (!gTrainerCardPtr->isShowingLinkCard)
    {
        u32 badgeFlag;
        int i = 0;

        badgeFlag = FLAG_BADGE01_GET;
        while (1)
        {
            if (FlagGet(badgeFlag))
                gTrainerCardPtr->ownedBadges[i]++;
            badgeFlag++;
            i++;
            if (badgeFlag > FLAG_BADGE08_GET)
            {
                break;
            }
        }
    }

#if DEBUG
    if (gDebug_03000748 != 0)
    {
        gTrainerCardPtr->showHallOfFame = TRUE;
        gTrainerCardPtr->showLinkBattleStatus = TRUE;
        gTrainerCardPtr->showBattleTowerStatus = TRUE;
        gTrainerCardPtr->showContestRecord = TRUE;
        gTrainerCardPtr->showMixingRecord = TRUE;
        gTrainerCardPtr->showTradingRecord = TRUE;
        memset(gTrainerCardPtr->ownedBadges, TRUE, sizeof(gTrainerCardPtr->ownedBadges));
    }
#endif
}

void sub_80937A4()
{
    ResetPaletteFade();
    ResetSpriteData();
    FreeAllSpritePalettes();
    ResetTasks();
}

void sub_80937BC()
{
    Text_LoadWindowTemplate(&gWindowTemplate_TrainerCard_Back_Values);
    MultistepInitMenuWindowBegin(&gWindowTemplate_TrainerCard_Back_Values);
}

static void sub_80937D8()
{
    TrainerCard_ResetOffsetRegisters();
    TrainerCard_CopyGraphics();
    sub_8093F64();
    TrainerCard_DrawCard();
}

static void sub_80937F0()
{
    TrainerCard_LoadTrainerGraphics();
}

static void nullsub_15(void)
{
}

static void sub_8093800()
{
    TrainerCard_CreateStateMachine();
}

static void TrainerCard_CreateStateMachine(void)
{
    u8 taskId;

    taskId = CreateTask(TrainerCard_RunStateMachine, 0);
    TrainerCard_RunStateMachine(taskId);
}

static void TrainerCard_RunStateMachine(u8 taskId)
{
    while (TrainerCard_StateMachine[gTrainerCardPtr->current_state](&gTasks[taskId]) != 0)
        ;
}

bool8 TrainerCard_Init(struct Task *task)
{
    gTrainerCardPtr->showColon = gSaveBlock2.playTimeSeconds & 1;
    gTrainerCardPtr->frameCounter = gSaveBlock2.playTimeVBlanks;
    TrainerCard_CreatePrintPlayTimeTask();
    BeginNormalPaletteFade(0xFFFFFFFF, 0, 16, 0, RGB(0, 0, 0));
    gTrainerCardPtr->current_state++; /* Advance state machine */
    return FALSE;
}

bool8 TrainerCard_WaitForFadeInToFinish(struct Task *task)
{
    if (!gPaletteFade.active)
        gTrainerCardPtr->current_state++; /* Advance state machine */
    return FALSE;
}

bool8 TrainerCard_WaitForKeys(struct Task *task)
{
    if (JOY_NEW(B_BUTTON))
    {
        gTrainerCardPtr->current_state = 5; /* Jump to fadeout state */
        return TRUE;
    }
    else if (JOY_NEW(A_BUTTON))
    {
        /* It appears that it was previously possible to return the the front side
           after viewing the back side. This was probably removed due to being
           unintuitive. */
        if (gTrainerCardPtr->backSideShown)
        {
            gTrainerCardPtr->current_state = 5; /* Jump to fadeout state */
        }
        else
        {
            gTrainerCardPtr->backSideShown ^= 1; /* Switch to back side  */
            gTrainerCardPtr->current_state = 3; /* Jump to start flip animation state */
        }
        return TRUE;
    }
#if DEBUG
    else if (gDebug_03000748 && JOY_NEW(R_BUTTON))
    {
        gTrainerCardPtr->starCount++;
        gTrainerCardPtr->starCount %= 5;
        TrainerCard_LoadPalettes();
        if (gTrainerCardPtr->backSideShown == 0)
            TrainerCard_DrawStars();
    }
#endif

    return FALSE;
}

bool8 TrainerCard_StartFlipAntimation(struct Task *task)
{
    TrainerCard_CreateFlipAnimationTask();
    PlaySE(SE_CARD);
    gTrainerCardPtr->current_state++; /* Advance state machine */
    return FALSE;
}

bool8 TrainerCard_WaitForFlipToFinish(struct Task *task)
{
    if (TrainerCard_HasFlipAnimationFinished())
        gTrainerCardPtr->current_state = 2; /* Return to wait for keys state */
    return FALSE;
}

bool8 TrainerCard_FadeOut(struct Task *task)
{
    TrainerCard_DestoryPlayTimeTask();
    BeginNormalPaletteFade(0xFFFFFFFF, 0, 0, 16, RGB(0, 0, 0));
    gTrainerCardPtr->current_state++; /* Advance state machine */
    return FALSE;
}

bool8 TrainerCard_WaitForFadeOutToFinishAndQuit(struct Task *task)
{
    if (!gPaletteFade.active)
        SetMainCallback2((MainCallback)gTrainerCardPtr->var_60);
    return FALSE;
}

static void TrainerCard_CreatePrintPlayTimeTask(void)
{
    CreateTask(TrainerCard_Front_PrintPlayTime, 0);
    BasicInitMenuWindow(&gWindowTemplate_TrainerCard_Back_Values);
}

static void TrainerCard_DestoryPlayTimeTask(void)
{
    u8 taskId = FindTaskIdByFunc(TrainerCard_Front_PrintPlayTime);

    if (taskId != 0xFF)
        DestroyTask(taskId);
}

static void TrainerCard_Front_PrintPlayTime(u8 taskId)
{
    u8 buffer[32];
    struct Task *task = &gTasks[taskId];

    if (gTrainerCardPtr->showColon != task->data[TD_CARD_INDEX])
    {
        task->data[TD_CARD_INDEX] = gTrainerCardPtr->showColon;
        task->data[TD_SHOWING_LINK_CARD] ^= TRUE;
    }
    TrainerCard_Front_GetPlayTimeString(buffer, task->data[TD_SHOWING_LINK_CARD]);
    Menu_PrintText(buffer, 10, 12);
}

static void TrainerCard_CreateFlipAnimationTask(void)
{
    u8 taskId;

    taskId = CreateTask(TrainerCard_RunFlipAnimationStateMachine, 0);
    TrainerCard_RunFlipAnimationStateMachine(taskId);
}

static u8 TrainerCard_HasFlipAnimationFinished(void)
{
    if (FindTaskIdByFunc(TrainerCard_RunFlipAnimationStateMachine) == 0xFF)
        return TRUE;
    else
        return FALSE;
}

static void TrainerCard_RunFlipAnimationStateMachine(u8 taskId)
{
    while (TrainerCard_FlipAnimationStateMachine[gTasks[taskId].data[0]](&gTasks[taskId]) != 0)
        ;
}

bool8 TrainerCard_InitFlipAnimation(struct Task *task)
{
    u32 i;

    gTrainerCardPtr->var_4 = FALSE;
    ScanlineEffect_Clear();
    for (i = 0; i < 0xA0; i++)
        gScanlineEffectRegBuffers[1][i] = -4;
    SetHBlankCallback(TrainerCard_FlipAnimationHBlankCallback);
    gTrainerCardPtr->var_4 = TRUE;
    task->data[0]++;
    return FALSE;
}

bool8 TrainerCard_ScaleDownFlipAnimation(struct Task *task)
{
    s16 i;
    u32 r4, r5, r10, r7, r6, var_24, r9, var;

    gTrainerCardPtr->var_4 = FALSE;
    task->data[1] += 3;
    if (task->data[1] > 79)
        task->data[1] = 79;

    r7 = task->data[1];
    r9 = 160 - r7;
    r4 = r9 - r7;
    r6 = -r7 << 16;
    r5 = 0xA00000 / r4;
    r5 += 0xFFFF0000;
    var_24 = r6 + r5 * r4;
    r10 = r5 / r4;
    r5 *= 2;

    for (i = 0; i < r7;
        // WHAT?!
        gScanlineEffectRegBuffers[0][i] = (u32)-i + -4,
        i++);
    for (; i < (s16)r9; i++)
    {
        var = r6 >> 16;
        r6 += r5;
        r5 -= r10;
        gScanlineEffectRegBuffers[0][i] = var + -4;
    }
    for (var = var_24 >> 16; i < 160;
        // WHAT?!
        gScanlineEffectRegBuffers[0][i] = var + -4,
        i++);

    gTrainerCardPtr->var_4 = TRUE;
    if (task->data[1] > 74)
        task->data[0]++;

    return FALSE;
}

bool8 TrainerCard_SwitchToNewSide(struct Task *task)
{
    TrainerCard_DestoryPlayTimeTask();
    TrainerCard_DrawCard();
    if (!gTrainerCardPtr->backSideShown) {
        /* This code never runs because it is impossible to flip the back side back to the front side */
        TrainerCard_CreatePrintPlayTimeTask();
    }
    task->data[0]++;
    return TRUE;
}

bool8 TrainerCard_ScaleUpFlipAnimation(struct Task *task)
{
    s16 i;
    u32 r4, r5, r10, r7, r6, var_24, r9, var;

    gTrainerCardPtr->var_4 = FALSE;
    task->data[1] -= 3;
    if (task->data[1] <= 0)
        task->data[1] = 0;

    r7 = task->data[1];
    r9 = 160 - r7;
    r4 = r9 - r7;
    r6 = -r7 << 16;
    r5 = 0xA00000 / r4;
    r5 += 0xFFFF0000;
    var_24 = r6 + r5 * r4;
    r10 = r5 / r4;
    r5 /= 2;

    for (i = 0; i < r7;
        // WHAT?!
        gScanlineEffectRegBuffers[0][i] = (u32)-i + -4,
        i++);
    for (; i < (s16)r9; i++)
    {
        var = r6 >> 16;
        r6 += r5;
        r5 += r10;
        gScanlineEffectRegBuffers[0][i] = var + -4;
    }
    for (var = var_24 >> 16; i < 160;
        // WHAT?!
        gScanlineEffectRegBuffers[0][i] = var + -4,
        i++);

    gTrainerCardPtr->var_4 = TRUE;
    if (task->data[1] <= 0)
        task->data[0]++;

    return FALSE;
}

bool8 TrainerCard_FinishFlipAnimation(struct Task *task)
{
    u8 taskId;

    gTrainerCardPtr->var_4 = FALSE;
    SetHBlankCallback(NULL);
    TrainerCard_ResetOffsetRegisters();
    taskId = FindTaskIdByFunc(TrainerCard_RunFlipAnimationStateMachine);
    DestroyTask(taskId);
    return FALSE;
}

static void TrainerCard_FlipAnimationHBlankCallback(void)
{
    u16 bgVOffset = gScanlineEffectRegBuffers[1][REG_VCOUNT & 0xFF];

    REG_BG0VOFS = bgVOffset;
    REG_BG1VOFS = bgVOffset;
    REG_BG2VOFS = bgVOffset;
}

static void TrainerCard_DrawCard(void)
{
    if (gTrainerCardPtr->backSideShown)
        TrainerCard_DrawCardBack();
    else
        TrainerCard_DrawCardFront();
}

static void TrainerCard_DrawCardFront(void)
{
    Menu_EraseScreen();
    TrainerCard_ClearTrainerGraphics();
    TrainerCard_LoadCardTileMap();
    TrainerCard_LoadTrainerTilemap();
    TrainerCard_DrawStars();
    TrainerCard_DisplayBadges();
    TrainerCard_Front_PrintTexts();
}

static void TrainerCard_DrawCardBack(void)
{
    Menu_EraseScreen();
    TrainerCard_ClearTrainerGraphics();
    sub_8093F48();
    TrainerCard_Back_PrintTexts();
}

static void TrainerCard_ResetOffsetRegisters(void)
{
    REG_BG0VOFS = -4;
    REG_BG1HOFS = 0;
    REG_BG1VOFS = -4;
    REG_BG2HOFS = 0;
    REG_BG2VOFS = -4;
}

static void TrainerCard_CopyGraphics(void)
{
    TrainerCard_LoadPalettes();
    LoadPalette(gUnknown_083B5F6C, 0xE0, 32);
    DmaCopyLarge16(3, gMenuTrainerCard_Gfx, (void *)VRAM, 0x1480, 0x1000);
    DmaCopy16Defvars(3, gBadgesTiles, (void *)(VRAM + 0x1480), 0x400);
}

extern const u16 *const gTrainerCardPalettes[];

static void TrainerCard_LoadPalettes(void)
{
    LoadPalette(gTrainerCardPalettes[gTrainerCardPtr->starCount], 0, 48 * 2);
    LoadPalette(gBadgesPalette, 48, 16 * 2);
    LoadPalette(gUnknown_083B5F4C, 64, 16 * 2);
    if (gTrainerCardPtr->displayedCard.gender != MALE)
        LoadPalette(gUnknown_083B5F0C, 16, 16 * 2);
}

static void TrainerCard_LoadTrainerGraphics(void)
{
    LoadTrainerGfx_TrainerCard(gTrainerCardPtr->displayedCard.gender, 80, (void *)(VRAM + 0x1880));
}

static void TrainerCard_LoadCardTileMap(void)
{
    const void *arr[] = {gMenuTrainerCardFront_Tilemap, gMenuTrainerCardFront2_Tilemap};

    CpuFastSet(arr[gTrainerCardPtr->isShowingLinkCard], (void *)(VRAM + 0x4800), 0x140);
}

// I don't really know where to put the data. It's in such a weird order.

const u8 gUnknown_083B5EF4[] = _(" : ");

const u16 *const gTrainerCardPalettes[] =
{
    gMenuTrainerCard0Star_Pal,
    gMenuTrainerCard1Star_Pal,
    gMenuTrainerCard2Star_Pal,
    gMenuTrainerCard3Star_Pal,
    gMenuTrainerCard4Star_Pal,
};

const u16 gUnknown_083B5F0C[] = INCBIN_U16("graphics/trainer_card/83B5F0C.gbapal");
const u16 gBadgesPalette[] = INCBIN_U16("graphics/trainer_card/badges.gbapal");
const u16 gUnknown_083B5F4C[] = INCBIN_U16("graphics/trainer_card/83B5F4C.gbapal");
const u16 gUnknown_083B5F6C[] = INCBIN_U16("graphics/trainer_card/83B5F6C.gbapal");
const u16 gTrainerCardBadgesMap[][4] = INCBIN_U16("graphics/trainer_card/83B5F8C_map.bin");

static void sub_8093F48(void)
{
    CpuFastSet(gMenuTrainerCardBack_Tilemap, (void *)(VRAM + 0x4800), 320);
}

static void sub_8093F64(void)
{
    CpuFastSet(gMenuTrainerCardBackground_Tilemap, (void *)(VRAM + 0x5000), 320);
}

static void TrainerCard_LoadTrainerTilemap(void)
{
    u16 r5 = 0xC4;
    u16 *ptr = (u16 *)(VRAM + 0x4000);
    s16 i;
    s16 j;

    for (i = 5; i < 13; i++)
    {
        for (j = 19; j < 27; j++, r5++)
            ptr[i * 32 + j] = r5 | 0x5000;
    }
}

static void TrainerCard_DrawStars(void)
{
    u16 *ptr = (u16 *)(VRAM + 0x4000);
    s16 i = 15;
    s16 var = 15 + gTrainerCardPtr->starCount;

    while (i < var)
    {
        ptr[6 * 32 + i] = 0x408F;
        i++;
    }
    while (i < 0x13)
    {
        ptr[6 * 32 + i] = 0;
        i++;
    }
}

static void TrainerCard_DisplayBadges(void)
{
    if (!gTrainerCardPtr->isShowingLinkCard)
    {
        u16 *ptr = (u16 *)(VRAM + 0x4000);
        s16 i;
        s16 r2;

        for (i = 0, r2 = 4; i < 8; i++, r2 += 3)
        {
            if (gTrainerCardPtr->ownedBadges[i] != 0)
            {
                ptr[15 * 32 + r2 + 0] = gTrainerCardBadgesMap[i][0] | 0x3000;
                ptr[15 * 32 + r2 + 1] = gTrainerCardBadgesMap[i][1] | 0x3000;
                ptr[16 * 32 + r2 + 0] = gTrainerCardBadgesMap[i][2] | 0x3000;
                ptr[16 * 32 + r2 + 1] = gTrainerCardBadgesMap[i][3] | 0x3000;
            }
        }
    }
}

static void TrainerCard_ClearTrainerGraphics(void)
{
    s16 i;
    u16 *ptr;

    for (i = 0, ptr = (u16 *)(VRAM + 0x4000); i < 0x400; i++, ptr++)
        *ptr = 0;
}

static void TrainerCard_ClearPokedexLabel(void)
{
    u16 *ptr = (u16 *)(VRAM + 0x4800);
    u16 i;

    for (i = 3; i < 17; i++)
    {
        ptr[10 * 32 + i] = 1;
        ptr[11 * 32 + i] = 1;
    }
}

static void TrainerCard_Front_PrintTexts(void)
{
    u8 *buffer;

    BasicInitMenuWindow(&gWindowTemplate_TrainerCard_Back_Values);

    buffer = gStringVar1;
    StringCopy(buffer, gTrainerCardPtr->displayedCard.playerName);
    ConvertInternationalString(buffer, gTrainerCardPtr->language);
    Menu_PrintText(buffer, 7, 5);

    TrainerCard_Front_PrintTrainerID();
    TrainerCard_Front_PrintMoney();
    TrainerCard_Front_PrintPokedexCount();
    TrainerCard_PrintEasyChatPhrase();
}

static void TrainerCard_Back_PrintTexts(void)
{
    BasicInitMenuWindow(&gWindowTemplate_TrainerCard_Back_Values);
    TrainerCard_Back_PrintName();
    TrainerCard_Back_PrintHallOfFameTime_Label();
    TrainerCard_Back_PrintLinkBattlesLabel();
    TrainerCard_Back_PrintBattleTower_Label();
    TrainerCard_Back_PrintLinkContests_Label();
    TrainerCard_Back_PrintLinkPokeblocks_Label();
    TrainerCard_Back_PrintPokemonTrades_Label();

    BasicInitMenuWindow(&gWindowTemplate_TrainerCard_Back_Labels);
    TrainerCard_Back_PrintHallOfFameTime();
    TrainerCard_Back_PrintLinkBattles();
    TrainerCard_Back_PrintBattleTower();
    TrainerCard_Back_PrintLinkContests();
    TrainerCard_Back_PrintLinkPokeblocks();
    TrainerCard_Back_PrintPokemonTrades();
}

static void TrainerCard_Front_PrintTrainerID(void)
{
    u8 buffer[8];

    ConvertIntToDecimalStringN(buffer, gTrainerCardPtr->displayedCard.trainerId, STR_CONV_MODE_LEADING_ZEROS, 5);
    Menu_PrintText(buffer, 20, 2);
}

static void TrainerCard_Front_PrintMoney(void)
{
    sub_80B7AEC(gTrainerCardPtr->displayedCard.money, 16, 8);
}

static void TrainerCard_Front_PrintPokedexCount(void)
{
    u8 buffer[16];

    if (
#if DEBUG
     gDebug_03000748 == 0 &&
#endif
     !gTrainerCardPtr->showPokedexCount)
    {
        TrainerCard_ClearPokedexLabel();
    }
    else
    {
        ConvertIntToDecimalStringN(buffer, gTrainerCardPtr->displayedCard.pokedexSeen, STR_CONV_MODE_LEFT_ALIGN, 3);
        MenuPrint_RightAligned(buffer, 16, 10);
    }
}

static void TrainerCard_Front_GetPlayTimeString(u8 *arg1, s16 colon)
{
    u8 buffer[16];
    u16 playTimeHours;
    u16 playTimeMinutes;

    playTimeHours = gSaveBlock2.playTimeHours;
    playTimeMinutes = gSaveBlock2.playTimeMinutes;
    if (gTrainerCardPtr->isShowingLinkCard != 0)
    {
        playTimeHours = gTrainerCardPtr->displayedCard.playTimeHours;
        playTimeMinutes = gTrainerCardPtr->displayedCard.playTimeMinutes;
    }
    FormatPlayTime(buffer, playTimeHours, playTimeMinutes, colon);
    AlignStringInMenuWindow(arg1, buffer, 48, 1);
}

static void TrainerCard_PrintEasyChatPhrase(void)
{
    u8 *str;

    if (gTrainerCardPtr->isShowingLinkCard != 0)
    {
        str = gStringVar1;
        str = StringCopy(str, gTrainerCardPtr->easyChatPhrase[0]);
        str[0] = 00;
        str++;
        str = StringCopy(str, gTrainerCardPtr->easyChatPhrase[1]);
        Menu_PrintText(gStringVar1, 2, 14);

        str = gStringVar1;
        str = StringCopy(str, gTrainerCardPtr->easyChatPhrase[2]);
        str[0] = 00;
        str++;
        str = StringCopy(str, gTrainerCardPtr->easyChatPhrase[3]);
        Menu_PrintText(gStringVar1, 2, 16);
    }
}

static void TrainerCard_Back_PrintName(void)
{
    u8 *str;

    str = gStringVar1;
    StringCopy(str, gTrainerCardPtr->displayedCard.playerName);
    ConvertInternationalString(str, gTrainerCardPtr->language);

#if ENGLISH
    StringAppend(str, gOtherText_TrainersTrainerCard);
#elif GERMAN
    de_sub_8073174(str, gOtherText_TrainersTrainerCard);
#endif

    MenuPrint_RightAligned(gStringVar1, 28, 2);
}

static void TrainerCard_Back_PrintHallOfFameTime_Label(void)
{
    if (gTrainerCardPtr->showHallOfFame != 0)
        Menu_PrintText(gOtherText_FirstHOF, 3, 5);
}

static void TrainerCard_Back_PrintHallOfFameTime(void)
{
    u8 *str;

    if (gTrainerCardPtr->showHallOfFame != 0)
    {
        str = gStringVar1;
        str = ConvertIntToDecimalStringN(str, gTrainerCardPtr->displayedCard.firstHallOfFameA, STR_CONV_MODE_RIGHT_ALIGN, 3);
        str = StringCopy(str, gUnknown_083B5EF4);
        str = ConvertIntToDecimalStringN(str, gTrainerCardPtr->displayedCard.firstHallOfFameB, STR_CONV_MODE_LEADING_ZEROS, 2);
        str = StringCopy(str, gUnknown_083B5EF4);
        str = ConvertIntToDecimalStringN(str, gTrainerCardPtr->displayedCard.firstHallOfFameC, STR_CONV_MODE_LEADING_ZEROS, 2);
        MenuPrint_RightAligned(gStringVar1, 28, 5);
    }
}

static void TrainerCard_Back_PrintLinkBattlesLabel(void)
{
    if (gTrainerCardPtr->showLinkBattleStatus != 0)
        Menu_PrintText(gOtherText_LinkCableBattles, 3, 7);
}

static void TrainerCard_Back_PrintLinkBattles(void)
{
    u8 buffer[16];

    if (gTrainerCardPtr->showLinkBattleStatus != 0)
    {
        ConvertIntToDecimalString(buffer, gTrainerCardPtr->displayedCard.linkBattleWins);
        MenuPrint_RightAligned(buffer, 22, 7);

        ConvertIntToDecimalString(buffer, gTrainerCardPtr->displayedCard.linkBattleLosses);
        MenuPrint_RightAligned(buffer, 28, 7);
    }
}

static void TrainerCard_Back_PrintBattleTower_Label(void)
{
    if (gTrainerCardPtr->showBattleTowerStatus != 0)
        Menu_PrintText(gOtherText_BattleTowerWinRecord, 3, 15);
}

static void TrainerCard_Back_PrintBattleTower(void)
{
    u8 buffer[16];

    if (gTrainerCardPtr->showBattleTowerStatus != 0)
    {
        AlignInt2InMenuWindow(buffer, gTrainerCardPtr->displayedCard.battleTowerWins, 24, 1);
        Menu_PrintTextPixelCoords(buffer, 112, 120, 0);

        AlignInt2InMenuWindow(buffer, gTrainerCardPtr->displayedCard.battleTowerLosses, 24, 1);
        Menu_PrintTextPixelCoords(buffer, 149, 120, 0);
    }
}

static void TrainerCard_Back_PrintLinkContests_Label(void)
{
    if (gTrainerCardPtr->showContestRecord != 0)
        Menu_PrintText(gOtherText_ContestRecord, 3, 13);
}

static void TrainerCard_Back_PrintLinkContests(void)
{
    u8 buffer[8];

    if (gTrainerCardPtr->showContestRecord != 0)
    {
        ConvertIntToDecimalStringN(buffer, gTrainerCardPtr->displayedCard.contestsWithFriends, STR_CONV_MODE_RIGHT_ALIGN, 3);
        MenuPrint_RightAligned(buffer, 28, 13);
    }
}

static void TrainerCard_Back_PrintLinkPokeblocks_Label(void)
{
    if (gTrainerCardPtr->showMixingRecord != 0)
        Menu_PrintText(gOtherText_MixingRecord, 3, 11);
}

static void TrainerCard_Back_PrintLinkPokeblocks(void)
{
    u8 buffer[8];

    if (gTrainerCardPtr->showMixingRecord != 0)
    {
        ConvertIntToDecimalStringN(buffer, gTrainerCardPtr->displayedCard.pokeblocksWithFriends, STR_CONV_MODE_RIGHT_ALIGN, 5);
        MenuPrint_RightAligned(buffer, 28, 11);
    }
}

static void TrainerCard_Back_PrintPokemonTrades_Label(void)
{
    if (gTrainerCardPtr->showTradingRecord != 0)
        Menu_PrintText(gOtherText_TradeRecord, 3, 9);
}

static void TrainerCard_Back_PrintPokemonTrades(void)
{
    u8 buffer[8];

    if (gTrainerCardPtr->showTradingRecord != 0)
    {
        ConvertIntToDecimalStringN(buffer, gTrainerCardPtr->displayedCard.pokemonTrades, STR_CONV_MODE_RIGHT_ALIGN, 5);
        MenuPrint_RightAligned(buffer, 28, 9);
    }
}

void unref_sub_8094588(u16 left, u16 top)
{
    const u8 *text = gOtherText_Boy;

    if (gSaveBlock2.playerGender == FEMALE)
        text = gOtherText_Girl;
    Menu_PrintText(text, left, top);
}
