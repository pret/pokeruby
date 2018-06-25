#include "global.h"
#include "trainer_card.h"
#include "easy_chat.h"
#include "event_data.h"
#include "field_effect.h"
#include "graphics.h"
#include "link.h"
#include "m4a.h"
#include "main.h"
#include "menu.h"
#include "money.h"
#include "palette.h"
#include "pokedex.h"
#include "overworld.h"
#include "script_pokemon_80C4.h"
#include "constants/songs.h"
#include "sound.h"
#include "sprite.h"
#include "string_util.h"
#include "strings2.h"
#include "task.h"
#include "scanline_effect.h"
#include "util.h"
#include "ewram.h"

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

extern struct LinkPlayerEventObject gLinkPlayerEventObjects[];

EWRAM_DATA struct TrainerCard gTrainerCards[4] = {0};

extern const u16 gUnknown_083B5F0C[];
extern const u16 gBadgesPalette[];
extern const u16 gUnknown_083B5F4C[];
extern const u16 gUnknown_083B5F6C[];
extern const u16 gTrainerCardBadgesMap[][4];

const u8 gBadgesTiles[] = INCBIN_U8("graphics/trainer_card/badges.4bpp");
// XXX: what is this?
u8 *const ewram_ = gSharedMem;

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
    .playerName = _("てすと"),  // "test"
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
static void sub_8093F14(void);
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
    ewram0_2.language = GAME_LANGUAGE;
}

void TrainerCard_ShowLinkCard(u8 playerIndex, Callback arg2)
{
#if DEBUG
    gDebug_03000748 = 0;
#endif
    TrainerCard_InitScreenForLinkPlayer(playerIndex, arg2);
    SetMainCallback2(sub_8093174);
    ewram0_2.language = gLinkPlayers[gLinkPlayerEventObjects[playerIndex].linkPlayerId].language;
}

#if DEBUG
void debug_sub_80A0710(Callback callback)
{
    gDebug_03000748 = TRUE;
    TrainerCard_InitScreenForPlayer(callback);
    SetMainCallback2(sub_8093174);
    ewram0_2.language = GAME_LANGUAGE;
}

void debug_sub_80A073C(Callback callback)
{
    memcpy(&gTrainerCards[0], &sTestTrainerCard, sizeof(struct TrainerCard));
    gDebug_03000748=TRUE;
    TrainerCard_InitScreenForLinkPlayer(0, callback);
    SetMainCallback2(sub_8093174);
    ewram0_2.language = GAME_LANGUAGE;
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
    ewram0_2.frameCounter++;
    if (ewram0_2.frameCounter >= 60)
    {
        ewram0_2.frameCounter = 0;
        ewram0_2.showColon ^= 1;
    }
    if (ewram0_2.var_4)
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
    ewram0_2.isShowingLinkCard = task->data[TD_SHOWING_LINK_CARD];

    LoadWordFromTwoHalfwords((u16 *)&task->data[TD_CALLBACK], (u32 *)&ewram0_2.var_60);

    if (ewram0_2.isShowingLinkCard)
    {
        ewram0_2.displayedCard = gTrainerCards[task->data[TD_CARD_INDEX]];
    }
    else
    {
        TrainerCard_GenerateCardForPlayer(&ewram0_2.displayedCard);
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
    if (sub_80C4D50() > 4)
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
    ewram0_2.current_state = 0;
    ewram0_2.backSideShown = FALSE;
    ewram0_2.var_4 = FALSE;
    ewram0_2.starCount = ewram0_2.displayedCard.stars;
    ewram0_2.showColon = 0;
    ewram0_2.frameCounter = 0;
    for (i = 0; i < 4; i++)
        EasyChat_GetWordText(ewram0_2.easyChatPhrase[i], ewram0_2.displayedCard.var_28[i]);
    TrainerCard_FillFlags();
}

static void TrainerCard_FillFlags(void)
{
    ewram0_2.showPokedexCount = 0;
    ewram0_2.showHallOfFame = 0;
    ewram0_2.showLinkBattleStatus = 0;
    ewram0_2.showBattleTowerStatus = 0;
    ewram0_2.showContestRecord = 0;
    ewram0_2.showMixingRecord = 0;
    ewram0_2.showTradingRecord = 0;
    memset(ewram0_2.ownedBadges, 0, sizeof(ewram0_2.ownedBadges));

    if (ewram0_2.displayedCard.hasPokedex)
        ewram0_2.showPokedexCount++;

    if (ewram0_2.displayedCard.firstHallOfFameA != 0
     || ewram0_2.displayedCard.firstHallOfFameB != 0
     || ewram0_2.displayedCard.firstHallOfFameC != 0)
        ewram0_2.showHallOfFame++;

    if (ewram0_2.displayedCard.linkBattleWins != 0 || ewram0_2.displayedCard.linkBattleLosses != 0)
        ewram0_2.showLinkBattleStatus++;

    if (ewram0_2.displayedCard.battleTowerWins != 0 || ewram0_2.displayedCard.battleTowerLosses != 0)
        ewram0_2.showBattleTowerStatus++;

    if (ewram0_2.displayedCard.contestsWithFriends != 0)
        ewram0_2.showContestRecord++;

    if (ewram0_2.displayedCard.pokeblocksWithFriends != 0)
        ewram0_2.showMixingRecord++;

    if (ewram0_2.displayedCard.pokemonTrades != 0)
        ewram0_2.showTradingRecord++;

    if (!ewram0_2.isShowingLinkCard)
    {
        u32 badgeFlag;
        int i = 0;

        badgeFlag = FLAG_BADGE01_GET;
        while (1)
        {
            if (FlagGet(badgeFlag))
                ewram0_2.ownedBadges[i]++;
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
        ewram0_2.showHallOfFame = TRUE;
        ewram0_2.showLinkBattleStatus = TRUE;
        ewram0_2.showBattleTowerStatus = TRUE;
        ewram0_2.showContestRecord = TRUE;
        ewram0_2.showMixingRecord = TRUE;
        ewram0_2.showTradingRecord = TRUE;
        memset(ewram0_2.ownedBadges, TRUE, sizeof(ewram0_2.ownedBadges));
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
    while (TrainerCard_StateMachine[ewram0_2.current_state](&gTasks[taskId]) != 0)
        ;
}

bool8 TrainerCard_Init(struct Task *task)
{
    ewram0_2.showColon = gSaveBlock2.playTimeSeconds & 1;
    ewram0_2.frameCounter = gSaveBlock2.playTimeVBlanks;
    TrainerCard_CreatePrintPlayTimeTask();
    BeginNormalPaletteFade(0xFFFFFFFF, 0, 16, 0, RGB(0, 0, 0));
    ewram0_2.current_state++; /* Advance state machine */
    return FALSE;
}

bool8 TrainerCard_WaitForFadeInToFinish(struct Task *task)
{
    if (!gPaletteFade.active)
        ewram0_2.current_state++; /* Advance state machine */
    return FALSE;
}

bool8 TrainerCard_WaitForKeys(struct Task *task)
{
    if (gMain.newKeys & B_BUTTON)
    {
        ewram0_2.current_state = 5; /* Jump to fadeout state */
        return TRUE;
    }
    else if (gMain.newKeys & A_BUTTON)
    {
        /* It appears that it was previously possible to return the the front side
           after viewing the back side. This was probably removed due to being
           unintuitive. */
        if (ewram0_2.backSideShown)
        {
            ewram0_2.current_state = 5; /* Jump to fadeout state */
        }
        else
        {
            ewram0_2.backSideShown ^= 1; /* Switch to back side  */
            ewram0_2.current_state = 3; /* Jump to start flip animation state */
        }
        return TRUE;
    }
#if DEBUG
    else if (gDebug_03000748 && gMain.newKeys & R_BUTTON)
    {
        ewram0_2.starCount++;
        ewram0_2.starCount %= 5;
        TrainerCard_LoadPalettes();
        if (ewram0_2.backSideShown == 0)
            TrainerCard_DrawStars();
    }
#endif

    return FALSE;
}

bool8 TrainerCard_StartFlipAntimation(struct Task *task)
{
    TrainerCard_CreateFlipAnimationTask();
    PlaySE(SE_CARD);
    ewram0_2.current_state++; /* Advance state machine */
    return FALSE;
}

bool8 TrainerCard_WaitForFlipToFinish(struct Task *task)
{
    if (TrainerCard_HasFlipAnimationFinished())
        ewram0_2.current_state = 2; /* Return to wait for keys state */
    return FALSE;
}

bool8 TrainerCard_FadeOut(struct Task *task)
{
    TrainerCard_DestoryPlayTimeTask();
    BeginNormalPaletteFade(0xFFFFFFFF, 0, 0, 16, RGB(0, 0, 0));
    ewram0_2.current_state++; /* Advance state machine */
    return FALSE;
}

bool8 TrainerCard_WaitForFadeOutToFinishAndQuit(struct Task *task)
{
    if (!gPaletteFade.active)
        SetMainCallback2((MainCallback)ewram0_2.var_60);
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

    if (ewram0_2.showColon != task->data[TD_CARD_INDEX])
    {
        task->data[TD_CARD_INDEX] = ewram0_2.showColon;
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

    ewram0_2.var_4 = FALSE;
    ScanlineEffect_Clear();
    for (i = 0; i < 0xA0; i++)
        gScanlineEffectRegBuffers[1][i] = -4;
    SetHBlankCallback(TrainerCard_FlipAnimationHBlankCallback);
    ewram0_2.var_4 = TRUE;
    task->data[0]++;
    return FALSE;
}

/*
bool8 TrainerCard_ScaleDownFlipAnimation(struct Task *task)
{
    u32 r7;
    u16 r9;
    u32 r6;
    u32 r5;
    u32 r4;
    u32 r10;
    u32 sp0;
    s16 i;

    ewram0_2.var_4 = 0;
    task->data[1] += 3;
    if (task->data[1] > 79)
        task->data[1] = 79;

    r7 = task->data[1];
    r9 = 160 - r7;
    r4 = r9 - r7;
    r6 = -r7 << 16;
    r5 = (160 << 16) / r4;
    r5 -= 1 << 16;
    r10 = r5 * r4 + r6;
    sp0 = r5 / r4;
    r5 *= 2;

    for (i = 0; i < r7; i++)
    {
        gScanlineEffectRegBuffers.filler0[i] = -4 - (u32)i;
    }
    //_08093B74
    for (; i < r9; i++)
    {
        u16 var = r6 >> 16;
        r6 += r5;
        r5 -= sp0;
        gScanlineEffectRegBuffers.filler0[i] = -4 + var;
    }
    for (; i < 160; i++)
        gScanlineEffectRegBuffers.filler0[i] = -4 + (u16)(r10 >> 16);
    ewram0_2.var_4 = 1;
    if (task->data[1] > 0x4A)
        task->data[0]++;
    return FALSE;
}
*/

NAKED
bool8 TrainerCard_ScaleDownFlipAnimation(struct Task *task)
{
    asm(".syntax unified\n\
    push {r4-r7,lr}\n\
    mov r7, r10\n\
    mov r6, r9\n\
    mov r5, r8\n\
    push {r5-r7}\n\
    sub sp, 0x4\n\
    mov r8, r0\n\
    ldr r1, _08093BFC @ =gSharedMem\n\
    movs r0, 0\n\
    strb r0, [r1, 0x4]\n\
    mov r2, r8\n\
    ldrh r0, [r2, 0xA]\n\
    adds r0, 0x3\n\
    strh r0, [r2, 0xA]\n\
    lsls r0, 16\n\
    asrs r0, 16\n\
    cmp r0, 0x4F\n\
    ble _08093B18\n\
    movs r0, 0x4F\n\
    strh r0, [r2, 0xA]\n\
_08093B18:\n\
    mov r4, r8\n\
    movs r0, 0xA\n\
    ldrsh r7, [r4, r0]\n\
    movs r0, 0xA0\n\
    subs r0, r7\n\
    mov r9, r0\n\
    subs r4, r0, r7\n\
    negs r0, r7\n\
    lsls r6, r0, 16\n\
    movs r0, 0xA0\n\
    lsls r0, 16\n\
    adds r1, r4, 0\n\
    bl __udivsi3\n\
    adds r5, r0, 0\n\
    ldr r1, _08093C00 @ =0xffff0000\n\
    adds r5, r1\n\
    adds r0, r5, 0\n\
    muls r0, r4\n\
    adds r0, r6\n\
    mov r10, r0\n\
    adds r0, r5, 0\n\
    adds r1, r4, 0\n\
    bl __udivsi3\n\
    str r0, [sp]\n\
    lsls r5, 1\n\
    movs r3, 0\n\
    cmp r3, r7\n\
    bcs _08093B74\n\
    ldr r2, _08093C04 @ =gScanlineEffectRegBuffers\n\
    mov r12, r2\n\
    ldr r0, _08093C08 @ =0x0000fffc\n\
    adds r4, r0, 0\n\
_08093B5C:\n\
    lsls r0, r3, 16\n\
    asrs r0, 16\n\
    lsls r1, r0, 1\n\
    add r1, r12\n\
    subs r2, r4, r0\n\
    strh r2, [r1]\n\
    adds r0, 0x1\n\
    lsls r0, 16\n\
    lsrs r3, r0, 16\n\
    asrs r0, 16\n\
    cmp r0, r7\n\
    bcc _08093B5C\n\
_08093B74:\n\
    lsls r2, r3, 16\n\
    mov r1, r9\n\
    lsls r0, r1, 16\n\
    asrs r1, r0, 16\n\
    mov r4, r10\n\
    lsrs r7, r4, 16\n\
    cmp r2, r0\n\
    bge _08093BAE\n\
    ldr r0, _08093C04 @ =gScanlineEffectRegBuffers\n\
    mov r9, r0\n\
    ldr r4, _08093C08 @ =0x0000fffc\n\
    mov r12, r4\n\
    adds r4, r1, 0\n\
_08093B8E:\n\
    lsrs r1, r6, 16\n\
    adds r6, r5\n\
    ldr r0, [sp]\n\
    subs r5, r0\n\
    asrs r2, 16\n\
    lsls r0, r2, 1\n\
    add r0, r9\n\
    add r1, r12\n\
    strh r1, [r0]\n\
    adds r2, 0x1\n\
    lsls r2, 16\n\
    lsrs r3, r2, 16\n\
    lsls r2, r3, 16\n\
    asrs r0, r2, 16\n\
    cmp r0, r4\n\
    blt _08093B8E\n\
_08093BAE:\n\
    adds r1, r7, 0\n\
    lsls r0, r3, 16\n\
    asrs r0, 16\n\
    cmp r0, 0x9F\n\
    bgt _08093BD4\n\
    ldr r4, _08093C04 @ =gScanlineEffectRegBuffers\n\
    ldr r0, _08093C08 @ =0x0000fffc\n\
    adds r2, r1, r0\n\
_08093BBE:\n\
    lsls r1, r3, 16\n\
    asrs r1, 16\n\
    lsls r0, r1, 1\n\
    adds r0, r4\n\
    strh r2, [r0]\n\
    adds r1, 0x1\n\
    lsls r1, 16\n\
    lsrs r3, r1, 16\n\
    asrs r1, 16\n\
    cmp r1, 0x9F\n\
    ble _08093BBE\n\
_08093BD4:\n\
    movs r0, 0x1\n\
    ldr r1, _08093BFC @ =gSharedMem\n\
    strb r0, [r1, 0x4]\n\
    mov r2, r8\n\
    movs r4, 0xA\n\
    ldrsh r0, [r2, r4]\n\
    cmp r0, 0x4A\n\
    ble _08093BEA\n\
    ldrh r0, [r2, 0x8]\n\
    adds r0, 0x1\n\
    strh r0, [r2, 0x8]\n\
_08093BEA:\n\
    movs r0, 0\n\
    add sp, 0x4\n\
    pop {r3-r5}\n\
    mov r8, r3\n\
    mov r9, r4\n\
    mov r10, r5\n\
    pop {r4-r7}\n\
    pop {r1}\n\
    bx r1\n\
    .align 2, 0\n\
_08093BFC: .4byte gSharedMem\n\
_08093C00: .4byte 0xffff0000\n\
_08093C04: .4byte gScanlineEffectRegBuffers\n\
_08093C08: .4byte 0x0000fffc\n\
    .syntax divided\n");
}

bool8 TrainerCard_SwitchToNewSide(struct Task *task)
{
    TrainerCard_DestoryPlayTimeTask();
    TrainerCard_DrawCard();
    if (!ewram0_2.backSideShown) {
        /* This code never runs because it is impossible to flip the back side back to the front side */
        TrainerCard_CreatePrintPlayTimeTask();
    }
    task->data[0]++;
    return TRUE;
}

NAKED
bool8 TrainerCard_ScaleUpFlipAnimation(struct Task *task)
{
    asm(".syntax unified\n\
    push {r4-r7,lr}\n\
    mov r7, r10\n\
    mov r6, r9\n\
    mov r5, r8\n\
    push {r5-r7}\n\
    sub sp, 0x4\n\
    mov r8, r0\n\
    ldr r1, _08093D40 @ =gSharedMem\n\
    movs r2, 0\n\
    strb r2, [r1, 0x4]\n\
    ldrh r0, [r0, 0xA]\n\
    subs r0, 0x3\n\
    mov r3, r8\n\
    strh r0, [r3, 0xA]\n\
    lsls r0, 16\n\
    cmp r0, 0\n\
    bgt _08093C5C\n\
    strh r2, [r3, 0xA]\n\
_08093C5C:\n\
    mov r4, r8\n\
    movs r0, 0xA\n\
    ldrsh r7, [r4, r0]\n\
    movs r0, 0xA0\n\
    subs r0, r7\n\
    mov r9, r0\n\
    subs r4, r0, r7\n\
    negs r0, r7\n\
    lsls r6, r0, 16\n\
    movs r0, 0xA0\n\
    lsls r0, 16\n\
    adds r1, r4, 0\n\
    bl __udivsi3\n\
    adds r5, r0, 0\n\
    ldr r1, _08093D44 @ =0xffff0000\n\
    adds r5, r1\n\
    adds r0, r5, 0\n\
    muls r0, r4\n\
    adds r0, r6\n\
    mov r10, r0\n\
    adds r0, r5, 0\n\
    adds r1, r4, 0\n\
    bl __udivsi3\n\
    str r0, [sp]\n\
    lsrs r5, 1\n\
    movs r3, 0\n\
    cmp r3, r7\n\
    bcs _08093CB8\n\
    ldr r2, _08093D48 @ =gScanlineEffectRegBuffers\n\
    mov r12, r2\n\
    ldr r0, _08093D4C @ =0x0000fffc\n\
    adds r4, r0, 0\n\
_08093CA0:\n\
    lsls r0, r3, 16\n\
    asrs r0, 16\n\
    lsls r1, r0, 1\n\
    add r1, r12\n\
    subs r2, r4, r0\n\
    strh r2, [r1]\n\
    adds r0, 0x1\n\
    lsls r0, 16\n\
    lsrs r3, r0, 16\n\
    asrs r0, 16\n\
    cmp r0, r7\n\
    bcc _08093CA0\n\
_08093CB8:\n\
    lsls r2, r3, 16\n\
    mov r1, r9\n\
    lsls r0, r1, 16\n\
    asrs r1, r0, 16\n\
    mov r4, r10\n\
    lsrs r7, r4, 16\n\
    cmp r2, r0\n\
    bge _08093CF2\n\
    ldr r0, _08093D48 @ =gScanlineEffectRegBuffers\n\
    mov r9, r0\n\
    ldr r3, _08093D4C @ =0x0000fffc\n\
    mov r12, r3\n\
    adds r4, r1, 0\n\
_08093CD2:\n\
    lsrs r1, r6, 16\n\
    adds r6, r5\n\
    ldr r0, [sp]\n\
    adds r5, r0\n\
    asrs r2, 16\n\
    lsls r0, r2, 1\n\
    add r0, r9\n\
    add r1, r12\n\
    strh r1, [r0]\n\
    adds r2, 0x1\n\
    lsls r2, 16\n\
    lsrs r3, r2, 16\n\
    lsls r2, r3, 16\n\
    asrs r0, r2, 16\n\
    cmp r0, r4\n\
    blt _08093CD2\n\
_08093CF2:\n\
    adds r1, r7, 0\n\
    lsls r0, r3, 16\n\
    asrs r0, 16\n\
    cmp r0, 0x9F\n\
    bgt _08093D18\n\
    ldr r4, _08093D48 @ =gScanlineEffectRegBuffers\n\
    ldr r0, _08093D4C @ =0x0000fffc\n\
    adds r2, r1, r0\n\
_08093D02:\n\
    lsls r1, r3, 16\n\
    asrs r1, 16\n\
    lsls r0, r1, 1\n\
    adds r0, r4\n\
    strh r2, [r0]\n\
    adds r1, 0x1\n\
    lsls r1, 16\n\
    lsrs r3, r1, 16\n\
    asrs r1, 16\n\
    cmp r1, 0x9F\n\
    ble _08093D02\n\
_08093D18:\n\
    movs r0, 0x1\n\
    ldr r1, _08093D40 @ =gSharedMem\n\
    strb r0, [r1, 0x4]\n\
    mov r2, r8\n\
    movs r3, 0xA\n\
    ldrsh r0, [r2, r3]\n\
    cmp r0, 0\n\
    bgt _08093D2E\n\
    ldrh r0, [r2, 0x8]\n\
    adds r0, 0x1\n\
    strh r0, [r2, 0x8]\n\
_08093D2E:\n\
    movs r0, 0\n\
    add sp, 0x4\n\
    pop {r3-r5}\n\
    mov r8, r3\n\
    mov r9, r4\n\
    mov r10, r5\n\
    pop {r4-r7}\n\
    pop {r1}\n\
    bx r1\n\
    .align 2, 0\n\
_08093D40: .4byte gSharedMem\n\
_08093D44: .4byte 0xffff0000\n\
_08093D48: .4byte gScanlineEffectRegBuffers\n\
_08093D4C: .4byte 0x0000fffc\n\
    .syntax divided\n");
}

bool8 TrainerCard_FinishFlipAnimation(struct Task *task)
{
    u8 taskId;

    ewram0_2.var_4 = FALSE;
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
    if (ewram0_2.backSideShown)
        TrainerCard_DrawCardBack();
    else
        TrainerCard_DrawCardFront();
}

static void TrainerCard_DrawCardFront(void)
{
    Menu_EraseScreen();
    TrainerCard_ClearTrainerGraphics();
    sub_8093F14();
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
    LoadPalette(gTrainerCardPalettes[ewram0_2.starCount], 0, 48 * 2);
    LoadPalette(gBadgesPalette, 48, 16 * 2);
    LoadPalette(gUnknown_083B5F4C, 64, 16 * 2);
    if (ewram0_2.displayedCard.gender != MALE)
        LoadPalette(gUnknown_083B5F0C, 16, 16 * 2);
}

static void TrainerCard_LoadTrainerGraphics(void)
{
    LoadTrainerGfx_TrainerCard(ewram0_2.displayedCard.gender, 80, (void *)(VRAM + 0x1880));
}

static void sub_8093F14(void)
{
    const void *arr[] = {gUnknown_08E8CAC0, gUnknown_08E8D4C0};

    CpuFastSet(arr[ewram0_2.isShowingLinkCard], (void *)(VRAM + 0x4800), 0x140);
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
    CpuFastSet(gUnknown_08E8CFC0, (void *)(VRAM + 0x4800), 320);
}

static void sub_8093F64(void)
{
    CpuFastSet(gUnknown_08E8D9C0, (void *)(VRAM + 0x5000), 320);
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
    s16 var = 15 + ewram0_2.starCount;

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
    if (!ewram0_2.isShowingLinkCard)
    {
        u16 *ptr = (u16 *)(VRAM + 0x4000);
        s16 i;
        s16 r2;

        for (i = 0, r2 = 4; i < 8; i++, r2 += 3)
        {
            if (ewram0_2.ownedBadges[i] != 0)
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
    StringCopy(buffer, ewram0_2.displayedCard.playerName);
    ConvertInternationalString(buffer, ewram0_2.language);
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

    ConvertIntToDecimalStringN(buffer, ewram0_2.displayedCard.trainerId, STR_CONV_MODE_LEADING_ZEROS, 5);
    Menu_PrintText(buffer, 20, 2);
}

static void TrainerCard_Front_PrintMoney(void)
{
    sub_80B7AEC(ewram0_2.displayedCard.money, 16, 8);
}

static void TrainerCard_Front_PrintPokedexCount(void)
{
    u8 buffer[16];

    if (
#if DEBUG
     gDebug_03000748 == 0 &&
#endif
     !ewram0_2.showPokedexCount)
    {
        TrainerCard_ClearPokedexLabel();
    }
    else
    {
        ConvertIntToDecimalStringN(buffer, ewram0_2.displayedCard.pokedexSeen, STR_CONV_MODE_LEFT_ALIGN, 3);
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
    if (ewram0_2.isShowingLinkCard != 0)
    {
        playTimeHours = ewram0_2.displayedCard.playTimeHours;
        playTimeMinutes = ewram0_2.displayedCard.playTimeMinutes;
    }
    FormatPlayTime(buffer, playTimeHours, playTimeMinutes, colon);
    AlignStringInMenuWindow(arg1, buffer, 48, 1);
}

static void TrainerCard_PrintEasyChatPhrase(void)
{
    u8 *str;

    if (ewram0_2.isShowingLinkCard != 0)
    {
        str = gStringVar1;
        str = StringCopy(str, ewram0_2.easyChatPhrase[0]);
        str[0] = 00;
        str++;
        str = StringCopy(str, ewram0_2.easyChatPhrase[1]);
        Menu_PrintText(gStringVar1, 2, 14);

        str = gStringVar1;
        str = StringCopy(str, ewram0_2.easyChatPhrase[2]);
        str[0] = 00;
        str++;
        str = StringCopy(str, ewram0_2.easyChatPhrase[3]);
        Menu_PrintText(gStringVar1, 2, 16);
    }
}

static void TrainerCard_Back_PrintName(void)
{
    u8 *str;

    str = gStringVar1;
    StringCopy(str, ewram0_2.displayedCard.playerName);
    ConvertInternationalString(str, ewram0_2.language);

#if ENGLISH
    StringAppend(str, gOtherText_TrainersTrainerCard);
#elif GERMAN
    de_sub_8073174(str, gOtherText_TrainersTrainerCard);
#endif

    MenuPrint_RightAligned(gStringVar1, 28, 2);
}

static void TrainerCard_Back_PrintHallOfFameTime_Label(void)
{
    if (ewram0_2.showHallOfFame != 0)
        Menu_PrintText(gOtherText_FirstHOF, 3, 5);
}

static void TrainerCard_Back_PrintHallOfFameTime(void)
{
    u8 *str;

    if (ewram0_2.showHallOfFame != 0)
    {
        str = gStringVar1;
        str = ConvertIntToDecimalStringN(str, ewram0_2.displayedCard.firstHallOfFameA, STR_CONV_MODE_RIGHT_ALIGN, 3);
        str = StringCopy(str, gUnknown_083B5EF4);
        str = ConvertIntToDecimalStringN(str, ewram0_2.displayedCard.firstHallOfFameB, STR_CONV_MODE_LEADING_ZEROS, 2);
        str = StringCopy(str, gUnknown_083B5EF4);
        str = ConvertIntToDecimalStringN(str, ewram0_2.displayedCard.firstHallOfFameC, STR_CONV_MODE_LEADING_ZEROS, 2);
        MenuPrint_RightAligned(gStringVar1, 28, 5);
    }
}

static void TrainerCard_Back_PrintLinkBattlesLabel(void)
{
    if (ewram0_2.showLinkBattleStatus != 0)
        Menu_PrintText(gOtherText_LinkCableBattles, 3, 7);
}

static void TrainerCard_Back_PrintLinkBattles(void)
{
    u8 buffer[16];

    if (ewram0_2.showLinkBattleStatus != 0)
    {
        ConvertIntToDecimalString(buffer, ewram0_2.displayedCard.linkBattleWins);
        MenuPrint_RightAligned(buffer, 22, 7);

        ConvertIntToDecimalString(buffer, ewram0_2.displayedCard.linkBattleLosses);
        MenuPrint_RightAligned(buffer, 28, 7);
    }
}

static void TrainerCard_Back_PrintBattleTower_Label(void)
{
    if (ewram0_2.showBattleTowerStatus != 0)
        Menu_PrintText(gOtherText_BattleTowerWinRecord, 3, 15);
}

static void TrainerCard_Back_PrintBattleTower(void)
{
    u8 buffer[16];

    if (ewram0_2.showBattleTowerStatus != 0)
    {
        AlignInt2InMenuWindow(buffer, ewram0_2.displayedCard.battleTowerWins, 24, 1);
        Menu_PrintTextPixelCoords(buffer, 112, 120, 0);

        AlignInt2InMenuWindow(buffer, ewram0_2.displayedCard.battleTowerLosses, 24, 1);
        Menu_PrintTextPixelCoords(buffer, 149, 120, 0);
    }
}

static void TrainerCard_Back_PrintLinkContests_Label(void)
{
    if (ewram0_2.showContestRecord != 0)
        Menu_PrintText(gOtherText_ContestRecord, 3, 13);
}

static void TrainerCard_Back_PrintLinkContests(void)
{
    u8 buffer[8];

    if (ewram0_2.showContestRecord != 0)
    {
        ConvertIntToDecimalStringN(buffer, ewram0_2.displayedCard.contestsWithFriends, STR_CONV_MODE_RIGHT_ALIGN, 3);
        MenuPrint_RightAligned(buffer, 28, 13);
    }
}

static void TrainerCard_Back_PrintLinkPokeblocks_Label(void)
{
    if (ewram0_2.showMixingRecord != 0)
        Menu_PrintText(gOtherText_MixingRecord, 3, 11);
}

static void TrainerCard_Back_PrintLinkPokeblocks(void)
{
    u8 buffer[8];

    if (ewram0_2.showMixingRecord != 0)
    {
        ConvertIntToDecimalStringN(buffer, ewram0_2.displayedCard.pokeblocksWithFriends, STR_CONV_MODE_RIGHT_ALIGN, 5);
        MenuPrint_RightAligned(buffer, 28, 11);
    }
}

static void TrainerCard_Back_PrintPokemonTrades_Label(void)
{
    if (ewram0_2.showTradingRecord != 0)
        Menu_PrintText(gOtherText_TradeRecord, 3, 9);
}

static void TrainerCard_Back_PrintPokemonTrades(void)
{
    u8 buffer[8];

    if (ewram0_2.showTradingRecord != 0)
    {
        ConvertIntToDecimalStringN(buffer, ewram0_2.displayedCard.pokemonTrades, STR_CONV_MODE_RIGHT_ALIGN, 5);
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
