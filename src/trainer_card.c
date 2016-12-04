#include "global.h"
#include "trainer_card.h"
#include "asm.h"
#include "flag.h"
#include "flags.h"
#include "link.h"
#include "main.h"
#include "menu.h"
#include "palette.h"
#include "pokedex.h"
#include "rom4.h"
#include "save_menu_util.h"
#include "sprite.h"
#include "task.h"

typedef void (*Callback)(void);

struct Struct2000000
{
    /*0x00*/ u8 filer0[1];
    /*0x01*/ bool8 var_1;
    /*0x02*/ u8 filer1[2];
    /*0x04*/ u8 var_4;
    /*0x05*/ u8 var_5;
    /*0x06*/ u8 var_6;
    /*0x07*/ u8 filler2[0x59];
    /*0x60*/ Callback * var_60;
    /*0x64*/ struct TrainerCard var_64;
    /*0x9C*/ u8 language; // 0x9C
};

extern struct Struct2000000 unk_2000000;
extern struct LinkPlayerMapObject gLinkPlayerMapObjects[];
extern struct TrainerCard gTrainerCards[4];

enum {
    TD_0,
    TD_1,
    TD_CALLBACK,
};

static void sub_8093174(void);
static void sub_809323C(void);
static void sub_8093254(void);
static void sub_80932AC(Callback callBack);
static void sub_80932E4(u8 arg1, Callback callBack);
static void nullsub_60(u8);
static u32 sav12_xor_get_clamped_above(u8 index, u32 maxVal);
static u8 sub_80934F4(struct TrainerCard *);
static void sub_8093534(void);
static void sub_8093550(void);

void sub_8093110(Callback arg1) {
    sub_80932AC(arg1);
    SetMainCallback2(sub_8093174);
    unk_2000000.language = 2;
}

void sub_8093130(u8 playerIndex, Callback arg2) {
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


static void sub_8093174(void) {
    switch (gMain.state) {
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
            if (MultistepInitMenuWindowContinue() == FALSE) {
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

static void sub_809323C(void) {
    RunTasks();
    AnimateSprites();
    BuildOamBuffer();
    UpdatePaletteFade();
}

__attribute__((naked))
static void sub_8093254(void)
{
    asm(".syntax unified\n\
    push {lr}\n\
    bl LoadOam\n\
    bl ProcessSpriteCopyRequests\n\
    bl TransferPlttBuffer\n\
    ldr r2, _0809329C @ =0x02000000\n\
    ldrb r0, [r2, 0x6]\n\
    adds r0, 0x1\n\
    strb r0, [r2, 0x6]\n\
    lsls r0, 24\n\
    lsrs r0, 24\n\
    cmp r0, 0x3B\n\
    bls _0809327E\n\
    movs r0, 0\n\
    strb r0, [r2, 0x6]\n\
    ldrb r0, [r2, 0x5]\n\
    movs r1, 0x1\n\
    eors r0, r1\n\
    strb r0, [r2, 0x5]\n\
_0809327E:\n\
    ldrb r0, [r2, 0x4]\n\
    cmp r0, 0\n\
    beq _08093298\n\
    ldr r1, _080932A0 @ =0x040000d4\n\
    ldr r0, _080932A4 @ =gUnknown_03004DE0\n\
    str r0, [r1]\n\
    movs r2, 0xF0\n\
    lsls r2, 3\n\
    adds r0, r2\n\
    str r0, [r1, 0x4]\n\
    ldr r0, _080932A8 @ =0x800000a0\n\
    str r0, [r1, 0x8]\n\
    ldr r0, [r1, 0x8]\n\
_08093298:\n\
    pop {r0}\n\
    bx r0\n\
    .align 2, 0\n\
_0809329C: .4byte 0x02000000\n\
_080932A0: .4byte 0x040000d4\n\
_080932A4: .4byte gUnknown_03004DE0\n\
_080932A8: .4byte 0x800000a0\n\
    .syntax divided\n");
}

static void sub_80932AC(Callback callBack) {
    u8 taskId = CreateTask(nullsub_60, 0xFF);
    struct Task *task = &gTasks[taskId];
    task->data[TD_0] = FALSE;
    StoreWordInTwoHalfwords(&task->data[TD_CALLBACK], (u32) callBack);
}

static void sub_80932E4(u8 arg1, Callback callBack) {
    u8 taskId = CreateTask(nullsub_60, 0xFF);

    struct Task *task = &gTasks[taskId];
    task->data[TD_0] = TRUE;
    task->data[TD_1] = arg1;
    StoreWordInTwoHalfwords(&task->data[TD_CALLBACK], (u32) callBack);
}

void sub_8093324(void) {
    u8 taskId = FindTaskIdByFunc(nullsub_60);
    struct Task *task = &gTasks[taskId];
    unk_2000000.var_1 = task->data[TD_0];

    LoadWordFromTwoHalfwords((u16 *) &task->data[TD_CALLBACK], (u32 *) &unk_2000000.var_60);

    if (unk_2000000.var_1) {
        struct TrainerCard (*trainerCards)[4] = &gTrainerCards;
        s16 var = task->data[TD_1];
        struct TrainerCard *dest = &(*trainerCards)[var];
        memcpy(&unk_2000000.var_64, dest, sizeof(struct TrainerCard));
    } else {
        sub_8093390(&unk_2000000.var_64);
    }
}

static void nullsub_60(u8 taskid) {
}

void sub_8093390(struct TrainerCard *arg1) {
    u32 playTime;
    bool32 enteredHallOfFame;
    bool8 r4;
    u8 i;

    arg1->gender = gSaveBlock2.playerGender;
    arg1->playTimeHours = gSaveBlock2.playTimeHours;
    arg1->playTimeMinutes = gSaveBlock2.playTimeMinutes;

    playTime = sub_8053108(GAME_STAT_FIRST_HOF_PLAY_TIME);
    enteredHallOfFame = sub_8053108(GAME_STAT_ENTERED_HOF);
    if (!enteredHallOfFame) {
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
    arg1->var_18 = gSaveBlock2.filler_A8.var_4C8;
    arg1->var_1A = gSaveBlock2.filler_A8.var_4CA;
    if (arg1->var_18 > 9999) {
        arg1->var_18 = 9999;
    }
    if (arg1->var_1A > 9999) {
        arg1->var_1A = 9999;
    }

    r4 = FALSE;
    if (sub_80C4D50() > 4) {
        r4 = TRUE;
    }
    arg1->var_4 = r4;

    arg1->money = gSaveBlock1.money;

    for (i = 0; i < 4; i++) {
        arg1->var_28[i] = gSaveBlock1.unk2B1C[i];
    }

    for (i = 0; i < 8; i++) {
        arg1->playerName[i] = gSaveBlock2.playerName[i];
    }

    arg1->var_1 = sub_80934F4(arg1);
}

u8 sub_80934C4(u8 id) {
    return gTrainerCards[id].var_1;
} 

static u32 sav12_xor_get_clamped_above(u8 index, u32 maxVal) {
    u32 value = sub_8053108(index);

    if (value > maxVal) {
        value = maxVal;
    }

    return value;
}

static u8 sub_80934F4(struct TrainerCard *trainerCard) {
    u8 value = 0;

    if (trainerCard->firstHallOfFameA != 0 || trainerCard->firstHallOfFameB != 0 || trainerCard->firstHallOfFameC != 0) {
        value += 1;
    }

    if (trainerCard->var_3) {
        value += 1;
    }

    if (trainerCard->var_1A > 49) {
        value += 1;
    }

    if (trainerCard->var_4) {
        value += 1;
    }

    return value;
}

static void sub_8093534(void) {
    SetVBlankCallback(NULL);
    SetHBlankCallback(NULL);
    REG_DISPCNT = 0;
}

static void sub_8093550(void) {
    u16 backup;

    SetVBlankCallback(sub_8093254);

    backup = REG_IME;
    REG_IME = 0;
    REG_IE |= INTR_FLAG_VBLANK| INTR_FLAG_HBLANK;
    REG_IME = backup;

    REG_DISPSTAT |= DISPSTAT_VBLANK_INTR | DISPSTAT_HBLANK_INTR;
    REG_DISPCNT = 0x1f40;
}
