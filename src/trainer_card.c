#include "global.h"
#include "trainer_card.h"
#include "easy_chat.h"
#include "event_data.h"
#include "field_effect.h"
#include "link.h"
#include "main.h"
#include "menu.h"
#include "money.h"
#include "palette.h"
#include "pokedex.h"
#include "rom4.h"
#include "script_pokemon_80C4.h"
#include "songs.h"
#include "sound.h"
#include "sprite.h"
#include "string_util.h"
#include "strings2.h"
#include "task.h"
#include "unknown_task.h"
#include "util.h"

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

extern u8 ewram[];
#define ewram0 (*(struct Struct2000000 *)(ewram))

extern struct LinkPlayerMapObject gLinkPlayerMapObjects[];
extern struct TrainerCard gTrainerCards[4];

struct UnknownStruct1
{
    u8 filler0[0x780];
    u16 unk780[160];
};
extern struct UnknownStruct1 gUnknown_03004DE0;

extern u8 gUnknown_083B5EF4[];
extern u16 *gUnknown_083B5EF8[5];
extern u16 gUnknown_083B5F0C[];
extern u16 gBadgesPalette[];
extern u16 gUnknown_083B5F4C[];

extern u16 gUnknown_08E8CFC0[];
extern u16 gUnknown_08E8D9C0[];

extern bool8 (*const gUnknown_083B5EBC[])(struct Task *);
extern bool8 (*const gUnknown_083B5ED8[])(struct Task *);

// FIXME: Other signature than on save_menu_util.h
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
    ewram0.language = GAME_LANGUAGE;
}

void sub_8093130(u8 playerIndex, Callback arg2)
{
    sub_80932E4(playerIndex, arg2);
    SetMainCallback2(sub_8093174);
    ewram0.language = gLinkPlayers[gLinkPlayerMapObjects[playerIndex].linkPlayerId].language;
}

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
        if (MultistepInitMenuWindowContinue() == FALSE)
        {
            return;
        }
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
    ewram0.var_6++;
    if (ewram0.var_6 >= 60)
    {
        ewram0.var_6 = 0;
        ewram0.var_5 ^= 1;
    }
    if (ewram0.var_4)
        DmaCopy16(3, gUnknown_03004DE0.filler0, gUnknown_03004DE0.unk780, sizeof(gUnknown_03004DE0.unk780));
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
    ewram0.var_1 = task->data[TD_0];

    LoadWordFromTwoHalfwords((u16 *)&task->data[TD_CALLBACK], (u32 *)&ewram0.var_60);

    if (ewram0.var_1)
    {
        struct TrainerCard(*trainerCards)[4] = &gTrainerCards;
        s16 var = task->data[TD_1];
        struct TrainerCard *dest = &(*trainerCards)[var];
        memcpy(&ewram0.var_64, dest, sizeof(struct TrainerCard));
    }
    else
    {
        sub_8093390(&ewram0.var_64);
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
    u8 *addr = (void *)VRAM;
    u32 size = 0x10000;

    while (1)
    {
        DmaFill16(3, 0, addr, 0x1000);
        addr += 0x1000;
        size -= 0x1000;
        if (size <= 0x1000)
        {
            DmaFill16(3, 0, addr, size);
            break;
        }
    }
}

void sub_80935EC(void)
{
    void *addr = (void *)OAM;

    DmaFill16(3, 0, addr, 0x400);
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

    sub_8093324();
    ewram0.var_0 = 0;
    ewram0.var_3 = 0;
    ewram0.var_4 = FALSE;
    ewram0.var_2 = ewram0.var_64.stars;
    ewram0.var_5 = 0;
    ewram0.var_6 = 0;
    for (i = 0; i < 4; i++)
        sub_80EB3FC(ewram0.var_20[i], ewram0.var_64.var_28[i]);
    sub_80936D4();
}

void sub_80936D4(void)
{
    ewram0.var_7 = 0;
    ewram0.var_8 = 0;
    ewram0.var_9 = 0;
    ewram0.var_a = 0;
    ewram0.var_b = 0;
    ewram0.var_c = 0;
    ewram0.var_d = 0;
    memset(ewram0.var_e, 0, sizeof(ewram0.var_e));

    if (ewram0.var_64.hasPokedex)
        ewram0.var_7++;

    if (ewram0.var_64.firstHallOfFameA != 0
     || ewram0.var_64.firstHallOfFameB != 0
     || ewram0.var_64.firstHallOfFameC != 0)
        ewram0.var_8++;

    if (ewram0.var_64.linkBattleWins != 0 || ewram0.var_64.linkBattleLosses != 0)
        ewram0.var_9++;

    if (ewram0.var_64.battleTowerWins != 0 || ewram0.var_64.battleTowerLosses != 0)
        ewram0.var_a++;

    if (ewram0.var_64.contestsWithFriends != 0)
        ewram0.var_b++;

    if (ewram0.var_64.pokeblocksWithFriends != 0)
        ewram0.var_c++;

    if (ewram0.var_64.pokemonTrades != 0)
        ewram0.var_d++;

    if (!ewram0.var_1)
    {
        u32 badgeFlag;
        int i = 0;

        badgeFlag = BADGE01_GET;
        while (1)
        {
            if (FlagGet(badgeFlag))
                ewram0.var_e[i]++;
            badgeFlag++;
            i++;
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

static void sub_809382C(u8 taskId)
{
    while (gUnknown_083B5EBC[ewram0.var_0](&gTasks[taskId]) != 0)
        ;
}

bool8 sub_8093864(struct Task *task)
{
    ewram0.var_5 = gSaveBlock2.playTimeSeconds & 1;
    ewram0.var_6 = gSaveBlock2.playTimeVBlanks;
    sub_80939A4();
    BeginNormalPaletteFade(0xFFFFFFFF, 0, 16, 0, 0);
    ewram0.var_0++;
    return FALSE;
}

bool8 sub_80938A8(struct Task *task)
{
    if (!gPaletteFade.active)
        ewram0.var_0++;
    return FALSE;
}

bool8 sub_80938CC(struct Task *task)
{
    if (gMain.newKeys & B_BUTTON)
    {
        ewram0.var_0 = 5;
        return TRUE;
    }
    else if (gMain.newKeys & A_BUTTON)
    {
        if (ewram0.var_3 != 0)
        {
            ewram0.var_0 = 5;
        }
        else
        {
            ewram0.var_3 ^= 1;
            ewram0.var_0 = 3;
        }
        return TRUE;
    }
    return FALSE;
}

bool8 sub_8093918(struct Task *task)
{
    sub_8093A28();
    PlaySE(SE_CARD);
    ewram0.var_0++;
    return FALSE;
}

bool8 sub_8093938(struct Task *task)
{
    if (sub_8093A48())
        ewram0.var_0 = 2;
    return FALSE;
}

bool8 sub_8093954(struct Task *task)
{
    sub_80939C0();
    BeginNormalPaletteFade(0xFFFFFFFF, 0, 0, 16, 0);
    ewram0.var_0++;
    return FALSE;
}

bool8 sub_8093980(struct Task *task)
{
    if (!gPaletteFade.active)
        SetMainCallback2((MainCallback)ewram0.var_60);
    return FALSE;
}

static void sub_80939A4(void)
{
    CreateTask(sub_80939DC, 0);
    BasicInitMenuWindow(&WindowConfig_TrainerCard_Back_Values);
}

static void sub_80939C0(void)
{
    u8 taskId = FindTaskIdByFunc(sub_80939DC);

    if (taskId != 0xFF)
        DestroyTask(taskId);
}

static void sub_80939DC(u8 taskId)
{
    u8 buffer[32];
    struct Task *task = &gTasks[taskId];

    if (ewram0.var_5 != task->data[TD_1])
    {
        task->data[TD_1] = ewram0.var_5;
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

static u8 sub_8093A48(void)
{
    if (FindTaskIdByFunc(sub_8093A68) == 0xFF)
        return TRUE;
    else
        return FALSE;
}

static void sub_8093A68(u8 taskId)
{
    while (gUnknown_083B5ED8[gTasks[taskId].data[0]](&gTasks[taskId]) != 0)
        ;
}

bool8 sub_8093AA0(struct Task *task)
{
    s32 i;

    ewram0.var_4 = FALSE;
    dp12_8087EA4();
    for (i = 0; i < ARRAY_COUNT(gUnknown_03004DE0.unk780); i++)
        gUnknown_03004DE0.unk780[i] = -4;
    SetHBlankCallback(sub_8093D7C);
    ewram0.var_4 = TRUE;
    task->data[0]++;
    return FALSE;
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
    if (!ewram0.var_3)
        sub_80939A4();
    trainerCard->firstHallOfFameB++;
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

    ewram0.var_4 = FALSE;
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
    if (ewram0.var_3)
        sub_8093DEC();
    else
        sub_8093DC8();
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
    LoadPalette(gUnknown_083B5EF8[ewram0.var_2], 0, 48 * 2);
    LoadPalette(gBadgesPalette, 48, 16 * 2);
    LoadPalette(gUnknown_083B5F4C, 64, 16 * 2);
    if (ewram0.var_64.gender != MALE)
        LoadPalette(gUnknown_083B5F0C, 16, 16 * 2);
}

static void sub_8093EF8(void)
{
    LoadTrainerGfx_TrainerCard(ewram0.var_64.gender, 80, (void *)(VRAM + 0x1880));
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
    StringCopy(buffer, ewram0.var_64.playerName);
    ConvertInternationalString(buffer, ewram0.language);
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

    ConvertIntToDecimalStringN(buffer, ewram0.var_64.trainerId, STR_CONV_MODE_LEADING_ZEROS, 5);
    MenuPrint(buffer, 20, 2);
}

static void TrainerCard_Front_PrintMoney(void)
{
    sub_80B7AEC(ewram0.var_64.money, 16, 8);
}

static void TrainerCard_Front_PrintPokedexCount(void)
{
    u8 buffer[16];

    if (ewram0.var_7 == FALSE)
    {
        sub_8094110();
    }
    else
    {
        ConvertIntToDecimalStringN(buffer, ewram0.var_64.pokedexSeen, STR_CONV_MODE_LEFT_ALIGN, 3);
        MenuPrint_RightAligned(buffer, 16, 10);
    }
}

static void TrainerCard_Front_PrintPlayTime(u8 *arg1, s16 colon)
{
    u8 buffer[16];
    u16 playTimeHours;
    u16 playTimeMinutes;

    playTimeHours = gSaveBlock2.playTimeHours;
    playTimeMinutes = gSaveBlock2.playTimeMinutes;
    if (ewram0.var_1 != 0)
    {
        playTimeHours = ewram0.var_64.playTimeHours;
        playTimeMinutes = ewram0.var_64.playTimeMinutes;
    }
    FormatPlayTime(buffer, playTimeHours, playTimeMinutes, colon);
    sub_8072C74(arg1, buffer, 48, 1);
}

static void sub_809429C(void)
{
    u8 *str;

    if (ewram0.var_1 != 0)
    {
        str = gStringVar1;
        str = StringCopy(str, ewram0.var_20[0]);
        str[0] = 00;
        str++;
        str = StringCopy(str, ewram0.var_20[1]);
        MenuPrint(gStringVar1, 2, 14);

        str = gStringVar1;
        str = StringCopy(str, ewram0.var_20[2]);
        str[0] = 00;
        str++;
        str = StringCopy(str, ewram0.var_20[3]);
        MenuPrint(gStringVar1, 2, 16);
    }
}

static void TrainerCard_Back_PrintName(void)
{
    u8 *str;

    str = gStringVar1;
    StringCopy(str, ewram0.var_64.playerName);
    ConvertInternationalString(str, ewram0.language);

#if ENGLISH
    StringAppend(str, gOtherText_TrainersTrainerCard);
#elif GERMAN
    de_sub_8073174(str, gOtherText_TrainersTrainerCard);
#endif

    MenuPrint_RightAligned(gStringVar1, 28, 2);
}

static void TrainerCard_Back_PrintHallOfFameTime_Label(void)
{
    if (ewram0.var_8 != 0)
        MenuPrint(gOtherText_FirstHOF, 3, 5);
}

static void TrainerCard_Back_PrintHallOfFameTime(void)
{
    u8 *str;

    if (ewram0.var_8 != 0)
    {
        str = gStringVar1;
        str = ConvertIntToDecimalStringN(str, ewram0.var_64.firstHallOfFameA, STR_CONV_MODE_RIGHT_ALIGN, 3);
        str = StringCopy(str, gUnknown_083B5EF4);
        str = ConvertIntToDecimalStringN(str, ewram0.var_64.firstHallOfFameB, STR_CONV_MODE_LEADING_ZEROS, 2);
        str = StringCopy(str, gUnknown_083B5EF4);
        str = ConvertIntToDecimalStringN(str, ewram0.var_64.firstHallOfFameC, STR_CONV_MODE_LEADING_ZEROS, 2);
        MenuPrint_RightAligned(gStringVar1, 28, 5);
    }
}

static void TrainerCard_Back_PrintLinkBattlesLabel(void)
{
    if (ewram0.var_9 != 0)
        MenuPrint(gOtherText_LinkCableBattles, 3, 7);
}

static void TrainerCard_Back_PrintLinkBattles(void)
{
    u8 buffer[16];

    if (ewram0.var_9 != 0)
    {
        ConvertIntToDecimalString(buffer, ewram0.var_64.linkBattleWins);
        MenuPrint_RightAligned(buffer, 22, 7);

        ConvertIntToDecimalString(buffer, ewram0.var_64.linkBattleLosses);
        MenuPrint_RightAligned(buffer, 28, 7);
    }
}

static void TrainerCard_Back_PrintBattleTower_Label(void)
{
    if (ewram0.var_a != 0)
        MenuPrint(gOtherText_BattleTowerWinRecord, 3, 15);
}

static void TrainerCard_Back_PrintBattleTower(void)
{
    u8 buffer[16];

    if (ewram0.var_a != 0)
    {
        sub_8072C44(buffer, ewram0.var_64.battleTowerWins, 24, 1);
        MenuPrint_PixelCoords(buffer, 112, 120, 0);

        sub_8072C44(buffer, ewram0.var_64.battleTowerLosses, 24, 1);
        MenuPrint_PixelCoords(buffer, 149, 120, 0);
    }
}

static void TrainerCard_Back_PrintLinkContests_Label(void)
{
    if (ewram0.var_b != 0)
        MenuPrint(gOtherText_ContestRecord, 3, 13);
}

static void TrainerCard_Back_PrintLinkContests(void)
{
    u8 buffer[8];

    if (ewram0.var_b != 0)
    {
        ConvertIntToDecimalStringN(buffer, ewram0.var_64.contestsWithFriends, STR_CONV_MODE_RIGHT_ALIGN, 3);
        MenuPrint_RightAligned(buffer, 28, 13);
    }
}

static void TrainerCard_Back_PrintLinkPokeblocks_Label(void)
{
    if (ewram0.var_c != 0)
        MenuPrint(gOtherText_MixingRecord, 3, 11);
}

static void TrainerCard_Back_PrintLinkPokeblocks(void)
{
    u8 buffer[8];

    if (ewram0.var_c != 0)
    {
        ConvertIntToDecimalStringN(buffer, ewram0.var_64.pokeblocksWithFriends, STR_CONV_MODE_RIGHT_ALIGN, 5);
        MenuPrint_RightAligned(buffer, 28, 11);
    }
}

static void TrainerCard_Back_PrintPokemonTrades_Label(void)
{
    if (ewram0.var_d != 0)
        MenuPrint(gOtherText_TradeRecord, 3, 9);
}

static void TrainerCard_Back_PrintPokemonTrades(void)
{
    u8 buffer[8];

    if (ewram0.var_d != 0)
    {
        ConvertIntToDecimalStringN(buffer, ewram0.var_64.pokemonTrades, STR_CONV_MODE_RIGHT_ALIGN, 5);
        MenuPrint_RightAligned(buffer, 28, 9);
    }
}

void unref_sub_8094588(u16 left, u16 top)
{
    const u8 *text = gOtherText_Boy;

    if (gSaveBlock2.playerGender == FEMALE)
        text = gOtherText_Girl;
    MenuPrint(text, left, top);
}
