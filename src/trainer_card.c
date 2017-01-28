#include "global.h"
#include "trainer_card.h"
#include "asm.h"
#include "event_data.h"
#include "link.h"
#include "main.h"
#include "menu.h"
#include "money.h"
#include "palette.h"
#include "pokedex.h"
#include "rom4.h"
#include "songs.h"
#include "sound.h"
#include "sprite.h"
#include "string_util.h"
#include "task.h"

typedef void (*Callback)(void);

struct Struct2000000
{
    /*0x00*/ u8 var_0;
    /*0x01*/ bool8 var_1;
    /*0x02*/ u8 var_2;
    /*0x03*/ bool8 var_3;
    /*0x04*/ u8 var_4;
    /*0x05*/ u8 var_5;
    /*0x06*/ u8 var_6;
    /*0x07*/ bool8 var_7;
    /*0x08*/ bool8 var_8;
    /*0x09*/ bool8 var_9;
    /*0x0A*/ bool8 var_a;
    /*0x0B*/ bool8 var_b;
    /*0x0C*/ bool8 var_c;
    /*0x0D*/ bool8 var_d;
    /*0x0E*/ u8 var_e[8];
    /*0x16*/ u8 filler_16[10];
    /*0x20*/ u8 var_20[4][0x10];
    /*0x60*/ Callback *var_60;
    /*0x64*/ struct TrainerCard var_64;
    /*0x9C*/ u8 language; // 0x9C
};

extern struct Struct2000000 unk_2000000;
extern struct LinkPlayerMapObject gLinkPlayerMapObjects[];
extern struct TrainerCard gTrainerCards[4];

extern u8 gUnknown_03004DE0[]; // TODO: find out correct type

extern u8 gUnknown_083B5EF4[];
extern u16 *gUnknown_083B5EF8[5];
extern u16 gUnknown_083B5F0C[];
extern u16 gBadgesPalette[];
extern u16 gUnknown_083B5F4C[];

extern u16 gUnknown_08E8CFC0[];
extern u16 gUnknown_08E8D9C0[];

extern u8 gOtherText_TrainersTrainerCard[];
extern u8 gOtherText_FirstHOF[];
extern u8 gOtherText_LinkCableBattles[];
extern u8 gOtherText_BattleTowerWinRecord[];
extern u8 gOtherText_ContestRecord[];
extern u8 gOtherText_MixingRecord[];
extern u8 gOtherText_TradeRecord[];
extern u8 gOtherText_Boy[];
extern u8 gOtherText_Girl[];

// Other signature than on save_menu_util.h
void FormatPlayTime(u8 *playtime, u16 hours, u16 minutes, s16 colon);

u16 GetPokedexSeenCount(void);

enum
{
    TD_0,
    TD_1,
    TD_CALLBACK,
};

static void sub_8093174(void);
static void sub_809323C(void);
static void sub_8093254(void);
static void sub_80932AC(Callback callBack);
static void sub_80932E4(u8 arg1, Callback callBack);
void sub_8093324(void);
static void nullsub_60(u8);
static u32 sav12_xor_get_clamped_above(u8 index, u32 maxVal);
static u8 sub_80934F4(struct TrainerCard *);
static void sub_8093534(void);
static void sub_8093550(void);
static void sub_8093598(void);
static void sub_80935EC(void);
static void sub_8093610(void);
static void sub_8093688(void);
void sub_80936D4(void);
static void sub_80937A4(void);
static void sub_80937BC(void);
static void sub_80937D8(void);
static void sub_80937F0(void);
static void nullsub_15(void);
static void sub_8093800(void);
static void sub_809380C();
static void sub_809382C(u8 taskId);
static void sub_80939A4(void);
static void sub_80939C0(void);
static void sub_80939DC(u8 taskId);
static void sub_8093A28(void);
static u8 sub_8093A48(void);
static void sub_8093A68(u8 taskId);
void sub_8093D7C(void);
static void sub_8093DAC(void);
static void sub_8093DC8(void);
static void sub_8093DEC(void);
static void sub_8093E04(void);
static void sub_8093E28(void);
void sub_8093EA0(void);
static void sub_8093EF8(void);
static void sub_8093F14(void);
static void sub_8093F48(void);
static void sub_8093F64(void);
static void sub_8093F80(void);
static void sub_8093FD0(void);
static void sub_8094038(void);
static void sub_80940E4(void);
static void sub_8094110(void);
static void sub_8094140(void);
static void sub_8094188(void);
static void TrainerCard_Front_PrintTrainerID(void);
static void TrainerCard_Front_PrintMoney(void);
static void TrainerCard_Front_PrintPokedexCount(void);
static void TrainerCard_Front_PrintPlayTime(u8 *arg1, s16 colon);
static void sub_809429C(void);
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

void sub_8093110(Callback arg1)
{
    sub_80932AC(arg1);
    SetMainCallback2(sub_8093174);
    unk_2000000.language = GAME_LANGUAGE;
}

void sub_8093130(u8 playerIndex, Callback arg2)
{
    struct Struct2000000* r2;
    struct LinkPlayer* r3;
    struct LinkPlayerMapObject* r4;
    u8 linkPlayerId;

    sub_80932E4(playerIndex, arg2);
    SetMainCallback2(sub_8093174);

    r2 = &unk_2000000;
    r3 = gLinkPlayers;
    r4 = gLinkPlayerMapObjects;

    linkPlayerId = r4[playerIndex].linkPlayerId;

    r2->language = r3[linkPlayerId].language;
}


static void sub_8093174(void)
{
    switch (gMain.state)
    {
    case 0:
        sub_8093534();
        sub_8093688();
        gMain.state += 1;
        break;
    case 1:
        sub_8093598();
        gMain.state += 1;
        break;
    case 2:
        sub_80935EC();
        gMain.state += 1;
        break;
    case 3:
        sub_8093610();
        sub_80937A4();
        gMain.state += 1;
        break;
    case 4:
        sub_80937BC();
        gMain.state += 1;
    case 5:
        if (MultistepInitMenuWindowContinue() == FALSE)
        {
            return;
        }
        gMain.state += 1;
        break;
    case 6:
        sub_80937F0();
        gMain.state += 1;
        break;
    case 7:
        sub_80937D8();
        gMain.state += 1;
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
    unk_2000000.var_6++;
    if (unk_2000000.var_6 >= 60)
    {
        unk_2000000.var_6 = 0;
        unk_2000000.var_5 ^= 1;
    }
    if (unk_2000000.var_4)
        DmaCopy16(3, gUnknown_03004DE0, gUnknown_03004DE0 + 0x780, 320);
}

static void sub_80932AC(Callback callBack)
{
    u8 taskId = CreateTask(nullsub_60, 0xFF);
    struct Task *task = &gTasks[taskId];
    task->data[TD_0] = FALSE;
    StoreWordInTwoHalfwords(&task->data[TD_CALLBACK], (u32)callBack);
}

static void sub_80932E4(u8 arg1, Callback callBack)
{
    u8 taskId = CreateTask(nullsub_60, 0xFF);

    struct Task *task = &gTasks[taskId];
    task->data[TD_0] = TRUE;
    task->data[TD_1] = arg1;
    StoreWordInTwoHalfwords(&task->data[TD_CALLBACK], (u32)callBack);
}

void sub_8093324(void)
{
    u8 taskId = FindTaskIdByFunc(nullsub_60);
    struct Task *task = &gTasks[taskId];
    unk_2000000.var_1 = task->data[TD_0];

    LoadWordFromTwoHalfwords((u16 *)&task->data[TD_CALLBACK], (u32 *)&unk_2000000.var_60);

    if (unk_2000000.var_1)
    {
        struct TrainerCard(*trainerCards)[4] = &gTrainerCards;
        s16 var = task->data[TD_1];
        struct TrainerCard *dest = &(*trainerCards)[var];
        memcpy(&unk_2000000.var_64, dest, sizeof(struct TrainerCard));
    }
    else
    {
        sub_8093390(&unk_2000000.var_64);
    }
}

static void nullsub_60(u8 taskid)
{
}

void sub_8093390(struct TrainerCard *arg1)
{
    u32 playTime;
    bool32 enteredHallOfFame;
    bool8 r4;
    u8 i;

    arg1->gender = gSaveBlock2.playerGender;
    arg1->playTimeHours = gSaveBlock2.playTimeHours;
    arg1->playTimeMinutes = gSaveBlock2.playTimeMinutes;

    playTime = GetGameStat(GAME_STAT_FIRST_HOF_PLAY_TIME);
    enteredHallOfFame = GetGameStat(GAME_STAT_ENTERED_HOF);
    if (!enteredHallOfFame)
    {
        playTime = 0;
    }
    arg1->firstHallOfFameA = playTime >> 16;
    arg1->firstHallOfFameB = (playTime >> 8) & 0xFF;
    arg1->firstHallOfFameC = playTime & 0xFF;

    arg1->hasPokedex = FlagGet(SYS_POKEDEX_GET);
    arg1->var_3 = sub_8090FC0();
    arg1->pokedexSeen = GetPokedexSeenCount();

    arg1->trainerId = (gSaveBlock2.playerTrainerId[1] << 8) | gSaveBlock2.playerTrainerId[0];

    // Link Cable Battles
    arg1->linkBattleWins = sav12_xor_get_clamped_above(GAME_STAT_LINK_BATTLE_WINS, 9999);
    arg1->linkBattleLosses = sav12_xor_get_clamped_above(GAME_STAT_LINK_BATTLE_LOSSES, 9999);

    // Contests w/ Friends
    arg1->contestsWithFriends = sav12_xor_get_clamped_above(GAME_STAT_WON_LINK_CONTEST, 999);

    // Pokéblocks w/ Friends
    arg1->pokeblocksWithFriends = sav12_xor_get_clamped_above(GAME_STAT_POKEBLOCKS_WITH_FRIENDS, 0xFFFF);

    // Pokémon Trades
    arg1->pokemonTrades = sav12_xor_get_clamped_above(GAME_STAT_POKEMON_TRADES, 0xFFFF);

    // Battle tower?
    arg1->battleTowerWins = gSaveBlock2.filler_A8.var_4C8;
    arg1->battleTowerLosses = gSaveBlock2.filler_A8.var_4CA;
    if (arg1->battleTowerWins > 9999)
    {
        arg1->battleTowerWins = 9999;
    }
    if (arg1->battleTowerLosses > 9999)
    {
        arg1->battleTowerLosses = 9999;
    }

    r4 = FALSE;
    if (sub_80C4D50() > 4)
    {
        r4 = TRUE;
    }
    arg1->var_4 = r4;

    arg1->money = gSaveBlock1.money;

    for (i = 0; i < 4; i++)
    {
        arg1->var_28[i] = gSaveBlock1.unk2B1C[i];
    }

    for (i = 0; i < 8; i++)
    {
        arg1->playerName[i] = gSaveBlock2.playerName[i];
    }

    arg1->stars = sub_80934F4(arg1);
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

static u8 sub_80934F4(struct TrainerCard *trainerCard)
{
    u8 value = 0;

    if (trainerCard->firstHallOfFameA != 0 || trainerCard->firstHallOfFameB != 0 || trainerCard->firstHallOfFameC != 0)
    {
        value += 1;
    }

    if (trainerCard->var_3)
    {
        value += 1;
    }

    if (trainerCard->battleTowerLosses > 49)
    {
        value += 1;
    }

    if (trainerCard->var_4)
    {
        value += 1;
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
    REG_DISPCNT = 0x1f40;
}

__attribute__((naked))
void sub_8093598()
{
    asm(".syntax unified\n\
    push {r4-r7,lr}\n\
    sub sp, 0x4\n\
    movs r2, 0xC0\n\
    lsls r2, 19\n\
    movs r3, 0x80\n\
    lsls r3, 9\n\
    mov r4, sp\n\
    movs r6, 0\n\
    ldr r1, _080935E4 @ =0x040000d4\n\
    movs r5, 0x80\n\
    lsls r5, 5\n\
    ldr r7, _080935E8 @ =0x81000800\n\
    movs r0, 0x81\n\
    lsls r0, 24\n\
    mov r12, r0\n\
_080935B6:\n\
    strh r6, [r4]\n\
    mov r0, sp\n\
    str r0, [r1]\n\
    str r2, [r1, 0x4]\n\
    str r7, [r1, 0x8]\n\
    ldr r0, [r1, 0x8]\n\
    adds r2, r5\n\
    subs r3, r5\n\
    cmp r3, r5\n\
    bhi _080935B6\n\
    strh r6, [r4]\n\
    mov r0, sp\n\
    str r0, [r1]\n\
    str r2, [r1, 0x4]\n\
    lsrs r0, r3, 1\n\
    mov r2, r12\n\
    orrs r0, r2\n\
    str r0, [r1, 0x8]\n\
    ldr r0, [r1, 0x8]\n\
    add sp, 0x4\n\
    pop {r4-r7}\n\
    pop {r0}\n\
    bx r0\n\
    .align 2, 0\n\
_080935E4: .4byte 0x040000d4\n\
_080935E8: .4byte 0x81000800\n\
    .syntax divided\n");
}

__attribute__((naked))
void sub_80935EC()
{
    asm(".syntax unified\n\
    sub sp, 0x4\n\
    movs r2, 0xE0\n\
    lsls r2, 19\n\
    mov r1, sp\n\
    movs r0, 0\n\
    strh r0, [r1]\n\
    ldr r0, _08093608 @ =0x040000d4\n\
    str r1, [r0]\n\
    str r2, [r0, 0x4]\n\
    ldr r1, _0809360C @ =0x81000200\n\
    str r1, [r0, 0x8]\n\
    ldr r0, [r0, 0x8]\n\
    add sp, 0x4\n\
    bx lr\n\
    .align 2, 0\n\
_08093608: .4byte 0x040000d4\n\
_0809360C: .4byte 0x81000200\n\
    .syntax divided\n");
}

__attribute__((naked))
void sub_8093610()
{
    asm(".syntax unified\n\
    push {r4,r5,lr}\n\
    ldr r5, _08093664 @ =REG_BG0CNT\n\
    movs r1, 0\n\
    strh r1, [r5]\n\
    ldr r2, _08093668 @ =REG_BG1CNT\n\
    strh r1, [r2]\n\
    ldr r3, _0809366C @ =REG_BG2CNT\n\
    strh r1, [r3]\n\
    ldr r4, _08093670 @ =REG_BG3CNT\n\
    strh r1, [r4]\n\
    ldr r0, _08093674 @ =REG_BG0HOFS\n\
    strh r1, [r0]\n\
    adds r0, 0x2\n\
    strh r1, [r0]\n\
    adds r0, 0x2\n\
    strh r1, [r0]\n\
    adds r0, 0x2\n\
    strh r1, [r0]\n\
    adds r0, 0x2\n\
    strh r1, [r0]\n\
    adds r0, 0x2\n\
    strh r1, [r0]\n\
    adds r0, 0x2\n\
    strh r1, [r0]\n\
    adds r0, 0x2\n\
    strh r1, [r0]\n\
    ldr r1, _08093678 @ =0x00001e08\n\
    adds r0, r1, 0\n\
    strh r0, [r5]\n\
    ldr r1, _0809367C @ =0x00000801\n\
    adds r0, r1, 0\n\
    strh r0, [r2]\n\
    ldr r1, _08093680 @ =0x00000902\n\
    adds r0, r1, 0\n\
    strh r0, [r3]\n\
    ldr r1, _08093684 @ =0x00000a03\n\
    adds r0, r1, 0\n\
    strh r0, [r4]\n\
    pop {r4,r5}\n\
    pop {r0}\n\
    bx r0\n\
    .align 2, 0\n\
_08093664: .4byte 0x4000008 @ REG_BG0CNT\n\
_08093668: .4byte 0x400000A @ REG_BG1CNT\n\
_0809366C: .4byte 0x400000C @ REG_BG2CNT\n\
_08093670: .4byte 0x400000E @ REG_BG3CNT\n\
_08093674: .4byte 0x4000010 @ REG_BG0HOFS\n\
_08093678: .4byte 0x00001e08\n\
_0809367C: .4byte 0x00000801\n\
_08093680: .4byte 0x00000902\n\
_08093684: .4byte 0x00000a03\n\
    .syntax divided\n");
}

#ifdef NONMATCHING
static void sub_8093688(void)
{
    int i;

    asm_comment("WIP");
    sub_8093324();

    unk_2000000.var_0 = FALSE;
    unk_2000000.var_3 = FALSE;
    unk_2000000.var_4 = FALSE;

    unk_2000000.var_2 = unk_2000000.var_64.stars;

    unk_2000000.var_5 = FALSE;
    unk_2000000.var_6 = FALSE;

    for (i = 0; i < 4; i++)
    {
        sub_80EB3FC(unk_2000000.var_20[i], unk_2000000.var_64.var_28[i]);
    }

    sub_80936D4();
}
#else

__attribute__((naked))
static void sub_8093688(void)
{
    asm(".syntax unified\n\
    push {r4-r6,lr}\n\
    bl sub_8093324\n\
    ldr r2, _080936D0 @ =0x02000000\n\
    movs r1, 0\n\
    strb r1, [r2]\n\
    strb r1, [r2, 0x3]\n\
    strb r1, [r2, 0x4]\n\
    adds r0, r2, 0\n\
    adds r0, 0x65\n\
    ldrb r0, [r0]\n\
    strb r0, [r2, 0x2]\n\
    strb r1, [r2, 0x5]\n\
    strb r1, [r2, 0x6]\n\
    movs r4, 0\n\
    adds r6, r2, 0\n\
    adds r6, 0x20\n\
    adds r5, r2, 0\n\
    adds r5, 0x8C\n\
_080936AE:\n\
    lsls r0, r4, 4\n\
    adds r0, r6\n\
    lsls r1, r4, 1\n\
    adds r1, r5, r1\n\
    ldrh r1, [r1]\n\
    bl sub_80EB3FC\n\
    adds r0, r4, 0x1\n\
    lsls r0, 24\n\
    lsrs r4, r0, 24\n\
    cmp r4, 0x3\n\
    bls _080936AE\n\
    bl sub_80936D4\n\
    pop {r4-r6}\n\
    pop {r0}\n\
    bx r0\n\
    .align 2, 0\n\
_080936D0: .4byte 0x02000000\n\
    .syntax divided\n");
}

#endif

void sub_80936D4(void)
{
    unk_2000000.var_7 = FALSE;
    unk_2000000.var_8 = FALSE;
    unk_2000000.var_9 = FALSE;
    unk_2000000.var_a = FALSE;
    unk_2000000.var_b = FALSE;
    unk_2000000.var_c = FALSE;
    unk_2000000.var_d = FALSE;

    memset(unk_2000000.var_e, 0, sizeof(unk_2000000.var_e));

    if (unk_2000000.var_64.hasPokedex)
    {
        unk_2000000.var_7 += TRUE;
    }

    if (unk_2000000.var_64.firstHallOfFameA != 0 || unk_2000000.var_64.firstHallOfFameB != 0 ||
        unk_2000000.var_64.firstHallOfFameC != 0)
    {
        unk_2000000.var_8 += TRUE;
    }

    if (unk_2000000.var_64.linkBattleWins != 0 || unk_2000000.var_64.linkBattleLosses != 0)
    {
        unk_2000000.var_9 += TRUE;
    }

    if (unk_2000000.var_64.battleTowerWins != 0 || unk_2000000.var_64.battleTowerLosses != 0)
    {
        unk_2000000.var_a += TRUE;
    }

    if (unk_2000000.var_64.contestsWithFriends != 0)
    {
        unk_2000000.var_b += TRUE;
    }

    if (unk_2000000.var_64.pokeblocksWithFriends != 0)
    {
        unk_2000000.var_c += TRUE;
    }

    if (unk_2000000.var_64.pokemonTrades != 0)
    {
        unk_2000000.var_d += TRUE;
    }

    if (!unk_2000000.var_1)
    {
        u32 badgeFlag;
        int i;

        i = 0;
        badgeFlag = BADGE01_GET;
        while (TRUE)
        {
            if (FlagGet(badgeFlag))
            {
                unk_2000000.var_e[i] += TRUE;
            }

            badgeFlag += 1;
            i += 1;
            if (badgeFlag > BADGE08_GET)
            {
                break;
            }
        }
    }
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
    SetUpWindowConfig(&WindowConfig_TrainerCard_Back_Values);
    MultistepInitMenuWindowBegin(&WindowConfig_TrainerCard_Back_Values);
}

static void sub_80937D8()
{
    sub_8093E04();
    sub_8093E28();
    sub_8093F64();
    sub_8093DAC();
}

static void sub_80937F0()
{
    sub_8093EF8();
}

static void nullsub_15(void)
{
}

static void sub_8093800()
{
    sub_809380C();
}

static void sub_809380C()
{
    u8 taskId;

    taskId = CreateTask(sub_809382C, 0);
    sub_809382C(taskId);
}

__attribute__((naked))
static void sub_809382C(u8 taskId)
{
    asm(".syntax unified\n\
    push {r4-r7,lr}\n\
    lsls r0, 24\n\
    lsrs r0, 24\n\
    ldr r7, _08093858 @ =gUnknown_083B5EBC\n\
    lsls r1, r0, 2\n\
    adds r1, r0\n\
    lsls r4, r1, 3\n\
    ldr r6, _0809385C @ =0x02000000\n\
    ldr r5, _08093860 @ =gTasks\n\
_0809383E:\n\
    ldrb r0, [r6]\n\
    lsls r0, 2\n\
    adds r0, r7\n\
    ldr r1, [r0]\n\
    adds r0, r4, r5\n\
    bl _call_via_r1\n\
    lsls r0, 24\n\
    cmp r0, 0\n\
    bne _0809383E\n\
    pop {r4-r7}\n\
    pop {r0}\n\
    bx r0\n\
    .align 2, 0\n\
_08093858: .4byte gUnknown_083B5EBC\n\
_0809385C: .4byte 0x02000000\n\
_08093860: .4byte gTasks\n\
    .syntax divided\n");
}

__attribute__((naked))
bool8 sub_8093864()
{
    asm(".syntax unified\n\
    push {r4,r5,lr}\n\
    sub sp, 0x4\n\
    ldr r4, _080938A0 @ =0x02000000\n\
    ldr r2, _080938A4 @ =gSaveBlock2\n\
    ldrb r1, [r2, 0x11]\n\
    movs r0, 0x1\n\
    ands r0, r1\n\
    movs r5, 0\n\
    strb r0, [r4, 0x5]\n\
    ldrb r0, [r2, 0x12]\n\
    strb r0, [r4, 0x6]\n\
    bl sub_80939A4\n\
    movs r0, 0x1\n\
    negs r0, r0\n\
    str r5, [sp]\n\
    movs r1, 0\n\
    movs r2, 0x10\n\
    movs r3, 0\n\
    bl BeginNormalPaletteFade\n\
    ldrb r0, [r4]\n\
    adds r0, 0x1\n\
    strb r0, [r4]\n\
    movs r0, 0\n\
    add sp, 0x4\n\
    pop {r4,r5}\n\
    pop {r1}\n\
    bx r1\n\
    .align 2, 0\n\
_080938A0: .4byte 0x02000000\n\
_080938A4: .4byte gSaveBlock2\n\
    .syntax divided\n");
}

__attribute__((naked))
bool8 sub_80938A8()
{
    asm(".syntax unified\n\
    push {lr}\n\
    ldr r0, _080938C4 @ =gPaletteFade\n\
    ldrb r1, [r0, 0x7]\n\
    movs r0, 0x80\n\
    ands r0, r1\n\
    cmp r0, 0\n\
    bne _080938BE\n\
    ldr r1, _080938C8 @ =0x02000000\n\
    ldrb r0, [r1]\n\
    adds r0, 0x1\n\
    strb r0, [r1]\n\
_080938BE:\n\
    movs r0, 0\n\
    pop {r1}\n\
    bx r1\n\
    .align 2, 0\n\
_080938C4: .4byte gPaletteFade\n\
_080938C8: .4byte 0x02000000\n\
    .syntax divided\n");
}

__attribute__((naked))
bool8 sub_80938CC()
{
    asm(".syntax unified\n\
    push {lr}\n\
    ldr r0, _080938E4 @ =gMain\n\
    ldrh r1, [r0, 0x2E]\n\
    movs r0, 0x2\n\
    ands r0, r1\n\
    cmp r0, 0\n\
    beq _080938EC\n\
    ldr r1, _080938E8 @ =0x02000000\n\
    movs r0, 0x5\n\
    strb r0, [r1]\n\
    movs r0, 0x1\n\
    b _08093914\n\
    .align 2, 0\n\
_080938E4: .4byte gMain\n\
_080938E8: .4byte 0x02000000\n\
_080938EC:\n\
    movs r0, 0x1\n\
    ands r0, r1\n\
    cmp r0, 0\n\
    beq _08093912\n\
    ldr r2, _08093900 @ =0x02000000\n\
    ldrb r1, [r2, 0x3]\n\
    cmp r1, 0\n\
    beq _08093904\n\
    movs r0, 0x5\n\
    b _0809390C\n\
    .align 2, 0\n\
_08093900: .4byte 0x02000000\n\
_08093904:\n\
    movs r0, 0x1\n\
    eors r0, r1\n\
    strb r0, [r2, 0x3]\n\
    movs r0, 0x3\n\
_0809390C:\n\
    strb r0, [r2]\n\
    movs r0, 0x1\n\
    b _08093914\n\
_08093912:\n\
    movs r0, 0\n\
_08093914:\n\
    pop {r1}\n\
    bx r1\n\
    .syntax divided\n");
}

bool8 sub_8093918()
{
    sub_8093A28();
    PlaySE(SE_CARD);

    unk_2000000.var_0 += TRUE;

    return FALSE;
}

bool8 sub_8093938()
{
    if (sub_8093A48())
    {
        unk_2000000.var_0 = 2;
    }

    return FALSE;
}

__attribute__((naked))
bool8 sub_8093954()
{
    asm(".syntax unified\n\
    push {lr}\n\
    sub sp, 0x4\n\
    bl sub_80939C0\n\
    movs r0, 0x1\n\
    negs r0, r0\n\
    movs r1, 0\n\
    str r1, [sp]\n\
    movs r2, 0\n\
    movs r3, 0x10\n\
    bl BeginNormalPaletteFade\n\
    ldr r1, _0809397C @ =0x02000000\n\
    ldrb r0, [r1]\n\
    adds r0, 0x1\n\
    strb r0, [r1]\n\
    movs r0, 0\n\
    add sp, 0x4\n\
    pop {r1}\n\
    bx r1\n\
    .align 2, 0\n\
_0809397C: .4byte 0x02000000\n\
    .syntax divided\n");
}

bool8 sub_8093980()
{
    if (!gPaletteFade.active)
    {
        SetMainCallback2((MainCallback)unk_2000000.var_60);
    }

    return FALSE;
}

static void sub_80939A4(void)
{
    CreateTask(sub_80939DC, 0);
    BasicInitMenuWindow(&WindowConfig_TrainerCard_Back_Values);
}

static void sub_80939C0(void)
{
    u8 taskId;

    taskId = FindTaskIdByFunc(sub_80939DC);

    if (taskId != 0xFF)
    {
        DestroyTask(taskId);
    }
}

static void sub_80939DC(u8 taskId)
{
    u8 buffer[32];
    struct Task *task;
    task = &gTasks[taskId];

    if (unk_2000000.var_5 != task->data[TD_1])
    {
        task->data[TD_1] = unk_2000000.var_5;
        task->data[TD_0] ^= TRUE;
    }

    TrainerCard_Front_PrintPlayTime(buffer, task->data[TD_0]);
    MenuPrint(buffer, 10, 12);
}

static void sub_8093A28(void)
{
    u8 taskId;

    taskId = CreateTask(sub_8093A68, 0);
    sub_8093A68(taskId);
}

__attribute__((naked))
static u8 sub_8093A48()
{
    asm(".syntax unified\n\
    push {lr}\n\
    ldr r0, _08093A5C @ =sub_8093A68\n\
    bl FindTaskIdByFunc\n\
    lsls r0, 24\n\
    lsrs r0, 24\n\
    cmp r0, 0xFF\n\
    beq _08093A60\n\
    movs r0, 0\n\
    b _08093A62\n\
    .align 2, 0\n\
_08093A5C: .4byte sub_8093A68\n\
_08093A60:\n\
    movs r0, 0x1\n\
_08093A62:\n\
    pop {r1}\n\
    bx r1\n\
    .syntax divided\n");
}

__attribute__((naked))
static void sub_8093A68(u8 taskId)
{
    asm(".syntax unified\n\
    push {r4,r5,lr}\n\
    lsls r0, 24\n\
    lsrs r0, 24\n\
    ldr r5, _08093A98 @ =gUnknown_083B5ED8\n\
    ldr r2, _08093A9C @ =gTasks\n\
    lsls r1, r0, 2\n\
    adds r1, r0\n\
    lsls r1, 3\n\
    adds r4, r1, r2\n\
_08093A7A:\n\
    movs r1, 0x8\n\
    ldrsh r0, [r4, r1]\n\
    lsls r0, 2\n\
    adds r0, r5\n\
    ldr r1, [r0]\n\
    adds r0, r4, 0\n\
    bl _call_via_r1\n\
    lsls r0, 24\n\
    cmp r0, 0\n\
    bne _08093A7A\n\
    pop {r4,r5}\n\
    pop {r0}\n\
    bx r0\n\
    .align 2, 0\n\
_08093A98: .4byte gUnknown_083B5ED8\n\
_08093A9C: .4byte gTasks\n\
    .syntax divided\n");
}

__attribute__((naked))
bool8 sub_8093AA0()
{
    asm(".syntax unified\n\
    push {r4,lr}\n\
    adds r4, r0, 0\n\
    ldr r0, _08093AE0 @ =0x02000000\n\
    movs r1, 0\n\
    strb r1, [r0, 0x4]\n\
    bl dp12_8087EA4\n\
    movs r1, 0\n\
    ldr r0, _08093AE4 @ =gUnknown_03004DE0\n\
    ldr r2, _08093AE8 @ =0x0000fffc\n\
    movs r3, 0xF0\n\
    lsls r3, 3\n\
    adds r0, r3\n\
_08093ABA:\n\
    strh r2, [r0]\n\
    adds r0, 0x2\n\
    adds r1, 0x1\n\
    cmp r1, 0x9F\n\
    bls _08093ABA\n\
    ldr r0, _08093AEC @ =sub_8093D7C\n\
    bl SetHBlankCallback\n\
    ldr r1, _08093AE0 @ =0x02000000\n\
    movs r0, 0x1\n\
    strb r0, [r1, 0x4]\n\
    ldrh r0, [r4, 0x8]\n\
    adds r0, 0x1\n\
    strh r0, [r4, 0x8]\n\
    movs r0, 0\n\
    pop {r4}\n\
    pop {r1}\n\
    bx r1\n\
    .align 2, 0\n\
_08093AE0: .4byte 0x02000000\n\
_08093AE4: .4byte gUnknown_03004DE0\n\
_08093AE8: .4byte 0x0000fffc\n\
_08093AEC: .4byte sub_8093D7C\n\
    .syntax divided\n");
}

__attribute__((naked))
bool8 sub_8093AF0()
{
    asm(".syntax unified\n\
    push {r4-r7,lr}\n\
    mov r7, r10\n\
    mov r6, r9\n\
    mov r5, r8\n\
    push {r5-r7}\n\
    sub sp, 0x4\n\
    mov r8, r0\n\
    ldr r1, _08093BFC @ =0x02000000\n\
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
    ldr r2, _08093C04 @ =gUnknown_03004DE0\n\
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
    ldr r0, _08093C04 @ =gUnknown_03004DE0\n\
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
    ldr r4, _08093C04 @ =gUnknown_03004DE0\n\
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
    ldr r1, _08093BFC @ =0x02000000\n\
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
_08093BFC: .4byte 0x02000000\n\
_08093C00: .4byte 0xffff0000\n\
_08093C04: .4byte gUnknown_03004DE0\n\
_08093C08: .4byte 0x0000fffc\n\
    .syntax divided\n");
}

bool8 sub_8093C0C(struct TrainerCard *trainerCard)
{
    sub_80939C0();
    sub_8093DAC();

    if (!unk_2000000.var_3)
    {
        sub_80939A4();
    }

    trainerCard->firstHallOfFameB += 1;

    return TRUE;
}

__attribute__((naked))
bool8 sub_8093C38()
{
    asm(".syntax unified\n\
    push {r4-r7,lr}\n\
    mov r7, r10\n\
    mov r6, r9\n\
    mov r5, r8\n\
    push {r5-r7}\n\
    sub sp, 0x4\n\
    mov r8, r0\n\
    ldr r1, _08093D40 @ =0x02000000\n\
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
    ldr r2, _08093D48 @ =gUnknown_03004DE0\n\
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
    ldr r0, _08093D48 @ =gUnknown_03004DE0\n\
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
    ldr r4, _08093D48 @ =gUnknown_03004DE0\n\
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
    ldr r1, _08093D40 @ =0x02000000\n\
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
_08093D40: .4byte 0x02000000\n\
_08093D44: .4byte 0xffff0000\n\
_08093D48: .4byte gUnknown_03004DE0\n\
_08093D4C: .4byte 0x0000fffc\n\
    .syntax divided\n");
}

bool8 sub_8093D50(void)
{
    u8 taskId;

    unk_2000000.var_4 = FALSE;
    SetHBlankCallback(NULL);
    sub_8093E04();

    taskId = FindTaskIdByFunc(sub_8093A68);
    DestroyTask(taskId);

    return FALSE;
}

__attribute__((naked))
void sub_8093D7C(void)
{
    asm(".syntax unified\n\
    ldr r1, _08093DA0 @ =gUnknown_03004DE0\n\
    ldr r0, _08093DA4 @ =REG_VCOUNT\n\
    ldrh r2, [r0]\n\
    movs r0, 0xFF\n\
    ands r0, r2\n\
    lsls r0, 1\n\
    movs r2, 0xF0\n\
    lsls r2, 3\n\
    adds r1, r2\n\
    adds r0, r1\n\
    ldrh r1, [r0]\n\
    ldr r0, _08093DA8 @ =REG_BG0VOFS\n\
    strh r1, [r0]\n\
    adds r0, 0x4\n\
    strh r1, [r0]\n\
    adds r0, 0x4\n\
    strh r1, [r0]\n\
    bx lr\n\
    .align 2, 0\n\
_08093DA0: .4byte gUnknown_03004DE0\n\
_08093DA4: .4byte 0x4000006 @ REG_VCOUNT\n\
_08093DA8: .4byte 0x4000012 @ REG_BG0VOFS\n\
    .syntax divided\n");
}

static void sub_8093DAC(void)
{
    if (unk_2000000.var_3)
    {
        sub_8093DEC();
    }
    else
    {
        sub_8093DC8();
    }
}

static void sub_8093DC8(void)
{
    MenuZeroFillScreen();
    sub_80940E4();
    sub_8093F14();
    sub_8093F80();
    sub_8093FD0();
    sub_8094038();
    sub_8094140();
}

static void sub_8093DEC(void)
{
    MenuZeroFillScreen();
    sub_80940E4();
    sub_8093F48();
    sub_8094188();
}

__attribute__((naked))
static void sub_8093E04()
{
    asm(".syntax unified\n\
    ldr r0, _08093E20 @ =REG_BG0VOFS\n\
    ldr r2, _08093E24 @ =0x0000fffc\n\
    adds r1, r2, 0\n\
    strh r1, [r0]\n\
    adds r0, 0x2\n\
    movs r2, 0\n\
    strh r2, [r0]\n\
    adds r0, 0x2\n\
    strh r1, [r0]\n\
    adds r0, 0x2\n\
    strh r2, [r0]\n\
    adds r0, 0x2\n\
    strh r1, [r0]\n\
    bx lr\n\
    .align 2, 0\n\
_08093E20: .4byte 0x4000012 @ REG_BG0VOFS\n\
_08093E24: .4byte 0x0000fffc\n\
    .syntax divided\n");
}

__attribute__((naked))
static void sub_8093E28(void)
{
    asm(".syntax unified\n\
    push {r4-r7,lr}\n\
    bl sub_8093EA0\n\
    ldr r0, _08093E84 @ =gUnknown_083B5F6C\n\
    movs r1, 0xE0\n\
    movs r2, 0x20\n\
    bl LoadPalette\n\
    ldr r3, _08093E88 @ =gMenuTrainerCard_Gfx\n\
    movs r4, 0xC0\n\
    lsls r4, 19\n\
    movs r5, 0xA4\n\
    lsls r5, 5\n\
    ldr r1, _08093E8C @ =0x040000d4\n\
    ldr r6, _08093E90 @ =0x80000800\n\
    movs r2, 0x80\n\
    lsls r2, 5\n\
    movs r7, 0x80\n\
    lsls r7, 24\n\
_08093E4E:\n\
    str r3, [r1]\n\
    str r4, [r1, 0x4]\n\
    str r6, [r1, 0x8]\n\
    ldr r0, [r1, 0x8]\n\
    adds r3, r2\n\
    adds r4, r2\n\
    subs r5, r2\n\
    cmp r5, r2\n\
    bhi _08093E4E\n\
    str r3, [r1]\n\
    str r4, [r1, 0x4]\n\
    lsrs r0, r5, 1\n\
    orrs r0, r7\n\
    str r0, [r1, 0x8]\n\
    ldr r0, [r1, 0x8]\n\
    ldr r1, _08093E94 @ =gBadgesTiles\n\
    ldr r2, _08093E98 @ =0x06001480\n\
    ldr r0, _08093E8C @ =0x040000d4\n\
    str r1, [r0]\n\
    str r2, [r0, 0x4]\n\
    ldr r1, _08093E9C @ =0x80000200\n\
    str r1, [r0, 0x8]\n\
    ldr r0, [r0, 0x8]\n\
    pop {r4-r7}\n\
    pop {r0}\n\
    bx r0\n\
    .align 2, 0\n\
_08093E84: .4byte gUnknown_083B5F6C\n\
_08093E88: .4byte gMenuTrainerCard_Gfx\n\
_08093E8C: .4byte 0x040000d4\n\
_08093E90: .4byte 0x80000800\n\
_08093E94: .4byte gBadgesTiles\n\
_08093E98: .4byte 0x06001480\n\
_08093E9C: .4byte 0x80000200\n\
    .syntax divided\n");
}

void sub_8093EA0(void)
{
    LoadPalette(gUnknown_083B5EF8[unk_2000000.var_2], 0, 48 * 2);
    LoadPalette(gBadgesPalette, 48, 16 * 2);
    LoadPalette(gUnknown_083B5F4C, 64, 16 * 2);

    if (unk_2000000.var_64.gender != MALE)
    {
        LoadPalette(gUnknown_083B5F0C, 16, 16 * 2);
    }
}

static void sub_8093EF8(void)
{
    LoadTrainerGfx_TrainerCard(unk_2000000.var_64.gender, 80, (void *)(VRAM + 0x1880));
}

__attribute__((naked))
static void sub_8093F14(void)
{
    asm(".syntax unified\n\
    push {lr}\n\
    sub sp, 0x8\n\
    ldr r0, _08093F3C @ =gUnknown_083B5EEC\n\
    ldr r1, [r0, 0x4]\n\
    ldr r0, [r0]\n\
    str r0, [sp]\n\
    str r1, [sp, 0x4]\n\
    ldr r0, _08093F40 @ =0x02000000\n\
    ldrb r0, [r0, 0x1]\n\
    lsls r0, 2\n\
    add r0, sp\n\
    ldr r0, [r0]\n\
    ldr r1, _08093F44 @ =0x06004800\n\
    movs r2, 0xA0\n\
    lsls r2, 1\n\
    bl CpuFastSet\n\
    add sp, 0x8\n\
    pop {r0}\n\
    bx r0\n\
    .align 2, 0\n\
_08093F3C: .4byte gUnknown_083B5EEC\n\
_08093F40: .4byte 0x02000000\n\
_08093F44: .4byte 0x06004800\n\
    .syntax divided\n");
}

static void sub_8093F48(void)
{
    CpuFastSet(gUnknown_08E8CFC0, (void *)(VRAM + 0x4800), 320);
}

static void sub_8093F64(void)
{
    CpuFastSet(gUnknown_08E8D9C0, (void *)(VRAM + 0x5000), 320);
}

__attribute__((naked))
static void sub_8093F80(void)
{
    asm(".syntax unified\n\
    push {r4-r7,lr}\n\
    movs r5, 0xC4\n\
    ldr r7, _08093FCC @ =0x06004000\n\
    movs r1, 0x5\n\
    movs r0, 0xA0\n\
    lsls r0, 7\n\
    adds r6, r0, 0\n\
_08093F8E:\n\
    movs r0, 0x13\n\
    lsls r3, r1, 16\n\
    asrs r4, r3, 11\n\
_08093F94:\n\
    lsls r2, r0, 16\n\
    asrs r2, 16\n\
    adds r1, r4, r2\n\
    lsls r1, 1\n\
    adds r1, r7\n\
    adds r0, r5, 0\n\
    orrs r0, r6\n\
    strh r0, [r1]\n\
    adds r2, 0x1\n\
    lsls r2, 16\n\
    adds r0, r5, 0x1\n\
    lsls r0, 16\n\
    lsrs r5, r0, 16\n\
    lsrs r0, r2, 16\n\
    asrs r2, 16\n\
    cmp r2, 0x1A\n\
    ble _08093F94\n\
    movs r1, 0x80\n\
    lsls r1, 9\n\
    adds r0, r3, r1\n\
    lsrs r1, r0, 16\n\
    asrs r0, 16\n\
    cmp r0, 0xC\n\
    ble _08093F8E\n\
    pop {r4-r7}\n\
    pop {r0}\n\
    bx r0\n\
    .align 2, 0\n\
_08093FCC: .4byte 0x06004000\n\
    .syntax divided\n");
}

__attribute__((naked))
static void sub_8093FD0(void)
{
    asm(".syntax unified\n\
    push {r4-r6,lr}\n\
    ldr r4, _0809402C @ =0x06004000\n\
    movs r2, 0xF\n\
    ldr r0, _08094030 @ =0x02000000\n\
    ldrb r0, [r0, 0x2]\n\
    adds r0, 0xF\n\
    cmp r2, r0\n\
    bge _08094002\n\
    movs r6, 0xC0\n\
    lsls r6, 1\n\
    ldr r1, _08094034 @ =0x0000408f\n\
    adds r5, r1, 0\n\
    adds r3, r0, 0\n\
_08093FEA:\n\
    lsls r1, r2, 16\n\
    asrs r1, 16\n\
    lsls r0, r1, 1\n\
    adds r0, r4\n\
    adds r0, r6\n\
    strh r5, [r0]\n\
    adds r1, 0x1\n\
    lsls r1, 16\n\
    lsrs r2, r1, 16\n\
    asrs r1, 16\n\
    cmp r1, r3\n\
    blt _08093FEA\n\
_08094002:\n\
    lsls r1, r2, 16\n\
    asrs r0, r1, 16\n\
    cmp r0, 0x12\n\
    bgt _08094024\n\
    movs r3, 0xC0\n\
    lsls r3, 1\n\
    movs r2, 0\n\
_08094010:\n\
    asrs r0, r1, 16\n\
    lsls r1, r0, 1\n\
    adds r1, r4\n\
    adds r1, r3\n\
    strh r2, [r1]\n\
    adds r0, 0x1\n\
    lsls r1, r0, 16\n\
    asrs r0, r1, 16\n\
    cmp r0, 0x12\n\
    ble _08094010\n\
_08094024:\n\
    pop {r4-r6}\n\
    pop {r0}\n\
    bx r0\n\
    .align 2, 0\n\
_0809402C: .4byte 0x06004000\n\
_08094030: .4byte 0x02000000\n\
_08094034: .4byte 0x0000408f\n\
    .syntax divided\n");
}

__attribute__((naked))
static void sub_8094038(void)
{
    asm(".syntax unified\n\
    push {r4-r7,lr}\n\
    mov r7, r9\n\
    mov r6, r8\n\
    push {r6,r7}\n\
    ldr r1, _080940D0 @ =0x02000000\n\
    ldrb r0, [r1, 0x1]\n\
    cmp r0, 0\n\
    bne _080940C2\n\
    ldr r0, _080940D4 @ =0x06004000\n\
    mov r9, r0\n\
    movs r0, 0\n\
    movs r2, 0x4\n\
    adds r1, 0xE\n\
    mov r8, r1\n\
    ldr r7, _080940D8 @ =gUnknown_083B5F8C\n\
    movs r1, 0xC0\n\
    lsls r1, 6\n\
    adds r6, r1, 0\n\
    adds r1, r7, 0x6\n\
    mov r12, r1\n\
_08094060:\n\
    lsls r0, 16\n\
    asrs r4, r0, 16\n\
    mov r1, r8\n\
    adds r0, r4, r1\n\
    ldrb r0, [r0]\n\
    lsls r5, r2, 16\n\
    cmp r0, 0\n\
    beq _080940AE\n\
    asrs r1, r5, 15\n\
    add r1, r9\n\
    movs r2, 0xF0\n\
    lsls r2, 2\n\
    adds r3, r1, r2\n\
    lsls r2, r4, 3\n\
    adds r0, r2, r7\n\
    ldrh r0, [r0]\n\
    orrs r0, r6\n\
    strh r0, [r3]\n\
    ldr r0, _080940DC @ =0x000003c2\n\
    adds r3, r1, r0\n\
    adds r0, r7, 0x2\n\
    adds r0, r2, r0\n\
    ldrh r0, [r0]\n\
    orrs r0, r6\n\
    strh r0, [r3]\n\
    movs r0, 0x80\n\
    lsls r0, 3\n\
    adds r3, r1, r0\n\
    adds r0, r7, 0x4\n\
    adds r0, r2, r0\n\
    ldrh r0, [r0]\n\
    orrs r0, r6\n\
    strh r0, [r3]\n\
    ldr r0, _080940E0 @ =0x00000402\n\
    adds r1, r0\n\
    add r2, r12\n\
    ldrh r0, [r2]\n\
    orrs r0, r6\n\
    strh r0, [r1]\n\
_080940AE:\n\
    adds r1, r4, 0x1\n\
    lsls r1, 16\n\
    movs r2, 0xC0\n\
    lsls r2, 10\n\
    adds r0, r5, r2\n\
    lsrs r2, r0, 16\n\
    lsrs r0, r1, 16\n\
    asrs r1, 16\n\
    cmp r1, 0x7\n\
    ble _08094060\n\
_080940C2:\n\
    pop {r3,r4}\n\
    mov r8, r3\n\
    mov r9, r4\n\
    pop {r4-r7}\n\
    pop {r0}\n\
    bx r0\n\
    .align 2, 0\n\
_080940D0: .4byte 0x02000000\n\
_080940D4: .4byte 0x06004000\n\
_080940D8: .4byte gUnknown_083B5F8C\n\
_080940DC: .4byte 0x000003c2\n\
_080940E0: .4byte 0x00000402\n\
    .syntax divided\n");
}

__attribute__((naked))
static void sub_80940E4()
{
    asm(".syntax unified\n\
    push {r4,lr}\n\
    movs r2, 0\n\
    ldr r1, _08094108 @ =0x06004000\n\
    movs r4, 0\n\
    ldr r3, _0809410C @ =0x000003ff\n\
_080940EE:\n\
    strh r4, [r1]\n\
    lsls r0, r2, 16\n\
    movs r2, 0x80\n\
    lsls r2, 9\n\
    adds r0, r2\n\
    adds r1, 0x2\n\
    lsrs r2, r0, 16\n\
    asrs r0, 16\n\
    cmp r0, r3\n\
    ble _080940EE\n\
    pop {r4}\n\
    pop {r0}\n\
    bx r0\n\
    .align 2, 0\n\
_08094108: .4byte 0x06004000\n\
_0809410C: .4byte 0x000003ff\n\
    .syntax divided\n");
}

__attribute__((naked))
static void sub_8094110()
{
    asm(".syntax unified\n\
    push {r4-r6,lr}\n\
    ldr r6, _0809413C @ =0x06004800\n\
    movs r2, 0x3\n\
    movs r5, 0xA0\n\
    lsls r5, 2\n\
    movs r3, 0x1\n\
    movs r4, 0xB0\n\
    lsls r4, 2\n\
_08094120:\n\
    lsls r0, r2, 1\n\
    adds r0, r6\n\
    adds r1, r0, r5\n\
    strh r3, [r1]\n\
    adds r0, r4\n\
    strh r3, [r0]\n\
    adds r0, r2, 0x1\n\
    lsls r0, 16\n\
    lsrs r2, r0, 16\n\
    cmp r2, 0x10\n\
    bls _08094120\n\
    pop {r4-r6}\n\
    pop {r0}\n\
    bx r0\n\
    .align 2, 0\n\
_0809413C: .4byte 0x06004800\n\
    .syntax divided\n");
}


static void sub_8094140(void)
{
    u8 *buffer;

    BasicInitMenuWindow(&WindowConfig_TrainerCard_Back_Values);

    buffer = gStringVar1;
    StringCopy(buffer, unk_2000000.var_64.playerName);
    ConvertInternationalString(buffer, unk_2000000.language);
    MenuPrint(buffer, 7, 5);

    TrainerCard_Front_PrintTrainerID();
    TrainerCard_Front_PrintMoney();
    TrainerCard_Front_PrintPokedexCount();
    sub_809429C();
}

static void sub_8094188(void)
{
    BasicInitMenuWindow(&WindowConfig_TrainerCard_Back_Values);
    TrainerCard_Back_PrintName();
    TrainerCard_Back_PrintHallOfFameTime_Label();
    TrainerCard_Back_PrintLinkBattlesLabel();
    TrainerCard_Back_PrintBattleTower_Label();
    TrainerCard_Back_PrintLinkContests_Label();
    TrainerCard_Back_PrintLinkPokeblocks_Label();
    TrainerCard_Back_PrintPokemonTrades_Label();

    BasicInitMenuWindow(&WindowConfig_TrainerCard_Back_Labels);
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

    ConvertIntToDecimalStringN(buffer, unk_2000000.var_64.trainerId, STR_CONV_MODE_LEADING_ZEROS, 5);
    MenuPrint(buffer, 20, 2);
}

static void TrainerCard_Front_PrintMoney(void)
{
    sub_80B7AEC(unk_2000000.var_64.money, 16, 8);
}

static void TrainerCard_Front_PrintPokedexCount(void)
{
    u8 buffer[16];

    if (unk_2000000.var_7 == FALSE)
    {
        sub_8094110();
        return;
    }

    ConvertIntToDecimalStringN(buffer, unk_2000000.var_64.pokedexSeen, STR_CONV_MODE_LEFT_ALIGN, 3);
    MenuPrint_RightAligned(buffer, 16, 10);
}

static void TrainerCard_Front_PrintPlayTime(u8 *arg1, s16 colon)
{
    u8 buffer[16];
    u16 playTimeHours;
    u16 playTimeMinutes;

    playTimeHours = gSaveBlock2.playTimeHours;
    playTimeMinutes = gSaveBlock2.playTimeMinutes;

    if (unk_2000000.var_1 != 0)
    {
        playTimeHours = unk_2000000.var_64.playTimeHours;
        playTimeMinutes = unk_2000000.var_64.playTimeMinutes;
    }

    FormatPlayTime(buffer, playTimeHours, playTimeMinutes, colon);
    sub_8072C74(arg1, buffer, 48, 1);
}

static void sub_809429C(void)
{
    u8 *str;

    if (unk_2000000.var_1 == FALSE)
    {
        return;
    }

    str = gStringVar1;
    str = StringCopy(str, unk_2000000.var_20[0]);
    str[0] = 00;
    str++;
    str = StringCopy(str, unk_2000000.var_20[1]);
    MenuPrint(gStringVar1, 2, 14);

    str = gStringVar1;
    str = StringCopy(str, unk_2000000.var_20[2]);
    str[0] = 00;
    str++;
    str = StringCopy(str, unk_2000000.var_20[3]);
    MenuPrint(gStringVar1, 2, 16);
}

static void TrainerCard_Back_PrintName(void)
{
    u8 *str;

    str = gStringVar1;
    StringCopy(str, unk_2000000.var_64.playerName);
    ConvertInternationalString(str, unk_2000000.language);

    StringAppend(str, gOtherText_TrainersTrainerCard);

    MenuPrint_RightAligned(gStringVar1, 28, 2);
}

static void TrainerCard_Back_PrintHallOfFameTime_Label(void)
{
    if (unk_2000000.var_8 == FALSE)
    {
        return;
    }

    MenuPrint(gOtherText_FirstHOF, 3, 5);
}

static void TrainerCard_Back_PrintHallOfFameTime(void)
{
    u8 *str;

    if (unk_2000000.var_8 == FALSE)
    {
        return;
    }

    str = gStringVar1;
    str = ConvertIntToDecimalStringN(str, unk_2000000.var_64.firstHallOfFameA, STR_CONV_MODE_RIGHT_ALIGN, 3);
    str = StringCopy(str, gUnknown_083B5EF4);
    str = ConvertIntToDecimalStringN(str, unk_2000000.var_64.firstHallOfFameB, STR_CONV_MODE_LEADING_ZEROS, 2);
    str = StringCopy(str, gUnknown_083B5EF4);
    str = ConvertIntToDecimalStringN(str, unk_2000000.var_64.firstHallOfFameC, STR_CONV_MODE_LEADING_ZEROS, 2);

    MenuPrint_RightAligned(gStringVar1, 28, 5);
}

static void TrainerCard_Back_PrintLinkBattlesLabel(void)
{
    if (unk_2000000.var_9 == FALSE)
    {
        return;
    }

    MenuPrint(gOtherText_LinkCableBattles, 3, 7);
}

static void TrainerCard_Back_PrintLinkBattles(void)
{
    u8 buffer[16];

    if (unk_2000000.var_9 == FALSE)
    {
        return;
    }

    ConvertIntToDecimalString(buffer, unk_2000000.var_64.linkBattleWins);
    MenuPrint_RightAligned(buffer, 22, 7);

    ConvertIntToDecimalString(buffer, unk_2000000.var_64.linkBattleLosses);
    MenuPrint_RightAligned(buffer, 28, 7);
}

static void TrainerCard_Back_PrintBattleTower_Label(void)
{
    if (unk_2000000.var_a == FALSE)
    {
        return;
    }

    MenuPrint(gOtherText_BattleTowerWinRecord, 3, 15);
}

static void TrainerCard_Back_PrintBattleTower(void)
{
    u8 buffer[16];

    if (unk_2000000.var_a == FALSE)
    {
        return;
    }

    sub_8072C44(buffer, unk_2000000.var_64.battleTowerWins, 24, 1);
    MenuPrint_PixelCoords(buffer, 112, 120, 0);

    sub_8072C44(buffer, unk_2000000.var_64.battleTowerLosses, 24, 1);
    MenuPrint_PixelCoords(buffer, 149, 120, 0);
}

static void TrainerCard_Back_PrintLinkContests_Label(void)
{
    if (unk_2000000.var_b == FALSE)
    {
        return;
    }

    MenuPrint(gOtherText_ContestRecord, 3, 13);
}

static void TrainerCard_Back_PrintLinkContests(void)
{
    u8 buffer[8];

    if (unk_2000000.var_b == FALSE)
    {
        return;
    }

    ConvertIntToDecimalStringN(buffer, unk_2000000.var_64.contestsWithFriends, STR_CONV_MODE_RIGHT_ALIGN, 3);
    MenuPrint_RightAligned(buffer, 28, 13);
}

static void TrainerCard_Back_PrintLinkPokeblocks_Label(void)
{
    if (unk_2000000.var_c == FALSE)
    {
        return;
    }

    MenuPrint(gOtherText_MixingRecord, 3, 11);
}

static void TrainerCard_Back_PrintLinkPokeblocks(void)
{
    u8 buffer[8];

    if (unk_2000000.var_c == FALSE)
    {
        return;
    }

    ConvertIntToDecimalStringN(buffer, unk_2000000.var_64.pokeblocksWithFriends, STR_CONV_MODE_RIGHT_ALIGN, 5);
    MenuPrint_RightAligned(buffer, 28, 11);
}

static void TrainerCard_Back_PrintPokemonTrades_Label(void)
{
    if (unk_2000000.var_d == FALSE)
    {
        return;
    }

    MenuPrint(gOtherText_TradeRecord, 3, 9);
}

static void TrainerCard_Back_PrintPokemonTrades(void)
{
    u8 buffer[8];

    if (unk_2000000.var_d == FALSE)
    {
        return;
    }

    ConvertIntToDecimalStringN(buffer, unk_2000000.var_64.pokemonTrades, STR_CONV_MODE_RIGHT_ALIGN, 5);
    MenuPrint_RightAligned(buffer, 28, 9);
}

void unref_sub_8094588(u16 left, u16 top)
{
    u8 *text = gOtherText_Boy;

    if (gSaveBlock2.playerGender == FEMALE)
    {
        text = gOtherText_Girl;
    }

    MenuPrint(text, (u8)left, (u8)top);
}
