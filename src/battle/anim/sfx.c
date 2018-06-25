#include "global.h"
#include "battle_anim.h"
#include "contest.h"
#include "ewram.h"
#include "rom_8077ABC.h"
#include "sound.h"
#include "task.h"

extern s16 gBattleAnimArgs[];
extern u8 gAnimBankAttacker;
extern u8 gAnimBankTarget;
extern u16 gBattlerPartyIndexes[];
extern u16 gAnimSpeciesByBanks[];
extern u8 gUnknown_0202F7D2;

static void sub_812AF98(u8 taskId);
static void sub_812B004(u8 taskId);
static void sub_812B108(u8 taskId);
static void sub_812B404(u8 taskId);

// used in 1 move:
//         Move_FIRE_BLAST
void sub_812AF30(u8 taskId)
{
    s8 sourcePan, targetPan, panIncrement;
    
    TASK.data[0] = gBattleAnimArgs[0];
    TASK.data[1] = gBattleAnimArgs[1];

    sourcePan = BattleAnimAdjustPanning(-64);
    targetPan = BattleAnimAdjustPanning(63);
    panIncrement = CalculatePanIncrement(sourcePan, targetPan, 2);

    TASK.data[2] = sourcePan;
    TASK.data[3] = targetPan;
    TASK.data[4] = panIncrement;
    TASK.data[10] = 10;

    TASK.func = sub_812AF98;
}

static void sub_812AF98(u8 taskId)
{
    s16 pan = TASK.data[2];
    s8 dPan = TASK.data[4];

    if (++TASK.data[11] == 111)
    {
        TASK.data[10] = 5;
        TASK.data[11] = 0;
        TASK.func = sub_812B004;
    } 
    else
    {
        if (++TASK.data[10] == 11)
        {
            TASK.data[10] = 0;
            PlaySE12WithPanning(TASK.data[0], pan);
        }
        pan += dPan;
        TASK.data[2] = sub_8077104(pan, dPan);
    }
}

static void sub_812B004(u8 taskId)
{
    s8 pan;

    if (++TASK.data[10] == 6)
    {
        TASK.data[10] = 0;

        pan = BattleAnimAdjustPanning(63);
        PlaySE12WithPanning(TASK.data[1], pan);

        if (++TASK.data[11] == 2)
        {
            DestroyAnimSoundTask(taskId);
        }
    }
}

// used in 7 moves:
//         Move_ICE_BEAM, Move_AURORA_BEAM, Move_PSYBEAM,
//         Move_PSYWAVE, Move_SHADOW_BALL, Move_TRI_ATTACK,
//         Move_HYPER_BEAM
void sub_812B058(u8 taskId)
{
    s16 sp = gBattleAnimArgs[0];
    s8 r5 = gBattleAnimArgs[2];
    s8 panIncrement = gBattleAnimArgs[3];
    u8 r10 = gBattleAnimArgs[4]; // number of times the sound must be played
    u8 r7 = gBattleAnimArgs[5];
    u8 r9 = gBattleAnimArgs[6];

    s8 pan1 = BattleAnimAdjustPanning(gBattleAnimArgs[1]);
    s8 pan2 = BattleAnimAdjustPanning(r5);
    panIncrement = CalculatePanIncrement(pan1, pan2, panIncrement);

    TASK.data[0] = sp;
    TASK.data[1] = pan1;
    TASK.data[2] = pan2;
    TASK.data[3] = panIncrement;
    TASK.data[4] = r10;
    TASK.data[5] = r7;
    TASK.data[6] = r9;
    TASK.data[10] = 0;
    TASK.data[11] = pan1;
    TASK.data[12] = r9;

    TASK.func = sub_812B108;
    TASK.func(taskId);
}

static void sub_812B108(u8 taskId)
{
    if (TASK.data[12]++ == TASK.data[6])
    {
        TASK.data[12] = 0;
        PlaySE12WithPanning(TASK.data[0], TASK.data[11]);

        if (--TASK.data[4] == 0)
        {
            DestroyAnimSoundTask(taskId);
            return;
        }
    }

    if (TASK.data[10]++ == TASK.data[5])
    {
        u16 dPan, oldPan;
        TASK.data[10] = 0;
        dPan = TASK.data[3];
        oldPan = TASK.data[11];
        TASK.data[11] = dPan + oldPan;
        TASK.data[11] = sub_8077104(TASK.data[11], oldPan);
    }
}

// #define shared19348 (*(struct UnknownContestStruct8 *)(gSharedMem + 0x19348))
// #define EWRAM_19348 (*(u16 *)(gSharedMem + 0x19348))

// used in 3 moves:
//         Move_HOWL, Move_ROAR, Move_GROWL
void sub_812B18C(u8 taskId)
{
    u16 species = 0;
    s8 pan = BattleAnimAdjustPanning(-64);

    if (IsContest())
    {
        if (!gBattleAnimArgs[0])
            species = shared19348.unk0;
        else
            DestroyAnimVisualTask(taskId);
    }
    else
    {
        u8 bank;
        if (gBattleAnimArgs[0] == 0)
            bank = gAnimBankAttacker;
        else if (gBattleAnimArgs[0] == 1)
            bank = gAnimBankTarget;
        else if (gBattleAnimArgs[0] == 2)
            bank = gAnimBankAttacker ^ 0x2;
        else
            bank = gAnimBankTarget ^ 0x2;

        if (gBattleAnimArgs[0] == 1 || gBattleAnimArgs[0] == 3)
        {
            if (!IsAnimBankSpriteVisible(bank))
            {
                DestroyAnimVisualTask(taskId);
                return;
            }
        }

        if (GetBattlerSide(bank))
            species = GetMonData(&gEnemyParty[gBattlerPartyIndexes[bank]], 0xB);
        else
            species = GetMonData(&gPlayerParty[gBattlerPartyIndexes[bank]], 0xB);
    }

    if (species != 0)
    {
        s16 mode = gBattleAnimArgs[1];
        if (mode == 0xFF)
            PlayCry1(species, pan);
        else
            PlayCry3(species, pan, mode);
    }

    DestroyAnimVisualTask(taskId);
}

// used in Move_HYPER_VOICE
void sub_812B2B8(u8 taskId)
{
    u16 species;
    s8 pan = BattleAnimAdjustPanning(-64);

    if (IsContest())
        species = shared19348.unk0;
    else
        species = gAnimSpeciesByBanks[gAnimBankAttacker];

    if (species != 0)
        PlayCry3(species, pan, 4);

    DestroyAnimVisualTask(taskId);
}

// used in 6 moves:
//         Move_SKY_ATTACK, Move_LUSTER_PURGE, Move_FLATTER,
//         Move_DRAGON_CLAW, Move_RETURN, Move_COSMIC_POWER,
void sub_812B30C(u8 taskId)
{
    u16 songNum = gBattleAnimArgs[0];
    s8 pan = BattleAnimAdjustPanning(gBattleAnimArgs[1]);
    PlaySE1WithPanning(songNum, pan);

    DestroyAnimVisualTask(taskId);
}

// used in 6 moves:
//         Move_SKY_ATTACK, Move_SUPERPOWER, Move_ENCORE,
//         Move_FLATTER, Move_RETURN, Move_COSMIC_POWER
void sub_812B340(u8 taskId)
{
    u16 songNum = gBattleAnimArgs[0];
    s8 pan = BattleAnimAdjustPanning(gBattleAnimArgs[1]);
    PlaySE2WithPanning(songNum, pan);

    DestroyAnimVisualTask(taskId);
}

// used in 2 moves:
//         Move_CONFUSE_RAY, Move_WILL_O_WISP
void sub_812B374(u8 taskId)
{
    u8 r5 = gBattleAnimArgs[1];
    s8 panIncrement = gBattleAnimArgs[2];
    s16 r9 = gBattleAnimArgs[3];
    s8 r1 = gBattleAnimArgs[0];

    s8 sourcePan = BattleAnimAdjustPanning(r1);
    s8 targetPan = BattleAnimAdjustPanning(r5);
    panIncrement = CalculatePanIncrement(sourcePan, targetPan, panIncrement);

    TASK.data[1] = sourcePan;
    TASK.data[2] = targetPan;
    TASK.data[3] = panIncrement;
    TASK.data[5] = r9;
    TASK.data[10] = 0;
    TASK.data[11] = sourcePan;

    TASK.func = sub_812B404;
    TASK.func(taskId);
}

static void sub_812B404(u8 taskId)
{
    u16 dPan = TASK.data[3];

    if (TASK.data[10]++ == TASK.data[5])
    {
        u16 oldPan;
        TASK.data[10] = 0;
        oldPan = TASK.data[11];
        TASK.data[11] = dPan + oldPan;
        TASK.data[11] = sub_8077104(TASK.data[11], oldPan);
    }

    gUnknown_0202F7D2 = TASK.data[11];

    if (TASK.data[11] == TASK.data[2])
    {
        DestroyAnimVisualTask(taskId);
    }
}