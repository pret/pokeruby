#include "global.h"
#include "battle_anim.h"
#include "battle.h"
#include "battle_anim_80CA710.h"
#include "battle_interface.h"
#include "contest.h"
#include "decompress.h"
#include "m4a.h"
#include "main.h"
#include "palette.h"
#include "rom_8077ABC.h"
#include "sound.h"
#include "sprite.h"
#include "task.h"
#include "ewram.h"

// sprites start at 10000 and thus must be subtracted of 10000 to account for the true index.
#define GET_TRUE_SPRITE_INDEX(i) (i - 10000)

#define ANIM_SPRITE_INDEX_COUNT 8
#define ANIM_ARGS_COUNT 8

extern u16 gBattlePartyID[4];
extern u8 gObjectBankIDs[];
extern u8 gBankAttacker;
extern u8 gBankTarget;
EWRAM_DATA const u8 *sBattleAnimScriptPtr = NULL;
EWRAM_DATA const u8 *gBattleAnimScriptRetAddr = NULL;
EWRAM_DATA void (*gAnimScriptCallback)(void) = NULL;
EWRAM_DATA s8 gAnimFramesToWait = 0;
EWRAM_DATA u8 gAnimScriptActive = FALSE;
EWRAM_DATA u8 gAnimVisualTaskCount = 0;
EWRAM_DATA u8 gAnimSoundTaskCount = 0;
EWRAM_DATA struct DisableStruct *gAnimDisableStructPtr = NULL;
EWRAM_DATA u32 gAnimMoveDmg = 0;
EWRAM_DATA u16 gAnimMovePower = 0;
EWRAM_DATA u8 gAnimFriendship = 0;
EWRAM_DATA u16 gWeatherMoveAnim = 0;
EWRAM_DATA u8 gMonAnimTaskIdArray[2] = {0};
EWRAM_DATA u8 gAnimMoveTurn = 0;
EWRAM_DATA u8 sAnimBackgroundFadeState = 0;
EWRAM_DATA u16 sAnimMoveIndex = 0; // set but unused.
EWRAM_DATA u8 gAnimBankAttacker = 0;
EWRAM_DATA u8 gAnimBankTarget = 0;
EWRAM_DATA u16 gAnimSpeciesByBanks[4] = {0};
EWRAM_DATA u8 gUnknown_0202F7D2 = 0;
extern u16 gBattle_BG1_Y;
extern u16 gBattle_WIN1H;
extern u16 gBattle_WIN0V;
extern u16 gBattle_WIN1V;
extern u16 gBattle_BG2_Y;
extern u16 gBattle_BG2_X;
extern u16 gBattle_BG1_X;
extern u16 gBattle_WIN0H;

u16 gSoundAnimFramesToWait;
s16 gBattleAnimArgs[ANIM_ARGS_COUNT];
u16 gAnimSpriteIndexArray[ANIM_SPRITE_INDEX_COUNT];

extern struct MusicPlayerInfo gMPlay_BGM;
extern struct MusicPlayerInfo gMPlay_SE1;
extern struct MusicPlayerInfo gMPlay_SE2;

extern const u16 gUnknown_081C7160[];
extern const u8 *const gBattleAnims_Moves[];
extern const struct CompressedSpriteSheet gBattleAnimPicTable[];
extern const struct CompressedSpritePalette gBattleAnimPaletteTable[];
extern const struct BattleAnimBackground gBattleAnimBackgroundTable[];

static void RunAnimScriptCommand(void);
static void ScriptCmd_loadspritegfx(void);
static void ScriptCmd_unloadspritegfx(void);
static void ScriptCmd_createsprite(void);
static void ScriptCmd_createvisualtask(void);
static void ScriptCmd_delay(void);
static void ScriptCmd_waitforvisualfinish(void);
static void ScriptCmd_hang1(void);
static void ScriptCmd_hang2(void);
static void ScriptCmd_end(void);
static void ScriptCmd_playse(void);
static void ScriptCmd_monbg(void);
static void sub_8076380(void);
static void task_pA_ma0A_obj_to_bg_pal(u8);
static void ScriptCmd_clearmonbg(void);
static void sub_807672C(u8);
static void ScriptCmd_monbg_22(void);
static void ScriptCmd_clearmonbg_23(void);
static void sub_80769A4(u8);
static void ScriptCmd_setalpha(void);
static void ScriptCmd_setbldcnt(void);
static void ScriptCmd_blendoff(void);
static void ScriptCmd_call(void);
static void ScriptCmd_return(void);
static void ScriptCmd_setarg(void);
static void ScriptCmd_choosetwoturnanim(void);
static void ScriptCmd_jumpifmoveturn(void);
static void ScriptCmd_jump(void);
static void ScriptCmd_fadetobg(void);
static void ScriptCmd_fadetobgfromset(void);
static void Task_FadeToBg(u8);
static void LoadMoveBg(u16);
static void LoadDefaultBg(void);
static void ScriptCmd_restorebg(void);
static void ScriptCmd_waitbgfadeout(void);
static void ScriptCmd_waitbgfadein(void);
static void ScriptCmd_changebg(void);
static void ScriptCmd_playsewithpan(void);
static void ScriptCmd_setpan(void);
static void ScriptCmd_panse_1B(void);
static void Task_PanFromInitialToTarget(u8);
static void ScriptCmd_panse_26(void);
static void ScriptCmd_panse_27(void);
static void ScriptCmd_loopsewithpan(void);
static void Task_LoopAndPlaySE(u8);
static void ScriptCmd_waitplaysewithpan(void);
static void Task_WaitAndPlaySE(u8);
static void ScriptCmd_createsoundtask(void);
static void ScriptCmd_waitsound(void);
static void ScriptCmd_jumpargeq(void);
static void ScriptCmd_jumpifcontest(void);
static void ScriptCmd_monbgprio_28(void);
static void ScriptCmd_monbgprio_29(void);
static void ScriptCmd_monbgprio_2A(void);
static void ScriptCmd_invisible(void);
static void ScriptCmd_visible(void);
static void ScriptCmd_doublebattle_2D(void);
static void ScriptCmd_doublebattle_2E(void);
static void ScriptCmd_stopsound(void);

static void (*const sScriptCmdTable[])(void) = {
    ScriptCmd_loadspritegfx,
    ScriptCmd_unloadspritegfx,
    ScriptCmd_createsprite,
    ScriptCmd_createvisualtask,
    ScriptCmd_delay,
    ScriptCmd_waitforvisualfinish,
    ScriptCmd_hang1,
    ScriptCmd_hang2,
    ScriptCmd_end,
    ScriptCmd_playse,
    ScriptCmd_monbg,
    ScriptCmd_clearmonbg,
    ScriptCmd_setalpha,
    ScriptCmd_blendoff,
    ScriptCmd_call,
    ScriptCmd_return,
    ScriptCmd_setarg,
    ScriptCmd_choosetwoturnanim,
    ScriptCmd_jumpifmoveturn,
    ScriptCmd_jump,
    ScriptCmd_fadetobg,
    ScriptCmd_restorebg,
    ScriptCmd_waitbgfadeout,
    ScriptCmd_waitbgfadein,
    ScriptCmd_changebg,
    ScriptCmd_playsewithpan,
    ScriptCmd_setpan,
    ScriptCmd_panse_1B,
    ScriptCmd_loopsewithpan,
    ScriptCmd_waitplaysewithpan,
    ScriptCmd_setbldcnt,
    ScriptCmd_createsoundtask,
    ScriptCmd_waitsound,
    ScriptCmd_jumpargeq,
    ScriptCmd_monbg_22,
    ScriptCmd_clearmonbg_23,
    ScriptCmd_jumpifcontest,
    ScriptCmd_fadetobgfromset,
    ScriptCmd_panse_26,
    ScriptCmd_panse_27,
    ScriptCmd_monbgprio_28,
    ScriptCmd_monbgprio_29,
    ScriptCmd_monbgprio_2A,
    ScriptCmd_invisible,
    ScriptCmd_visible,
    ScriptCmd_doublebattle_2D,
    ScriptCmd_doublebattle_2E,
    ScriptCmd_stopsound,
};

void ClearBattleAnimationVars(void)
{
    s32 i;

    gAnimFramesToWait = 0;
    gAnimScriptActive = FALSE;
    gAnimVisualTaskCount = 0;
    gAnimSoundTaskCount = 0;
    gAnimDisableStructPtr = NULL;
    gAnimMoveDmg = 0;
    gAnimMovePower = 0;
    gAnimFriendship = 0;

    // clear index array.
    for (i = 0; i < ANIM_SPRITE_INDEX_COUNT; i++)
        gAnimSpriteIndexArray[i] |= 0xFFFF;

    // clear anim args.
    for (i = 0; i < ANIM_ARGS_COUNT; i++)
        gBattleAnimArgs[i] = 0;

    gMonAnimTaskIdArray[0] = 0xFF;
    gMonAnimTaskIdArray[1] = 0xFF;
    gAnimMoveTurn = 0;
    sAnimBackgroundFadeState = 0;
    sAnimMoveIndex = 0;
    gAnimBankAttacker = 0;
    gAnimBankTarget = 0;
    gUnknown_0202F7D2 = 0;
}

void DoMoveAnim(u16 move)
{
    gAnimBankAttacker = gBankAttacker;
    gAnimBankTarget = gBankTarget;
    LaunchBattleAnimation(gBattleAnims_Moves, move, TRUE);
}

void LaunchBattleAnimation(const u8 *const moveAnims[], u16 move, u8 isMoveAnim)
{
    s32 i;

    if (!IsContest())
    {
        sub_8079E24();
        UpdateOamPriorityInAllHealthboxes(0);
        for (i = 0; i < 4; i++)
        {
            if (GetBankSide(i) != 0)
                gAnimSpeciesByBanks[i] = GetMonData(&gEnemyParty[gBattlePartyID[i]], MON_DATA_SPECIES);
            else
                gAnimSpeciesByBanks[i] = GetMonData(&gPlayerParty[gBattlePartyID[i]], MON_DATA_SPECIES);
        }
    }
    else
    {
        for (i = 0; i < 4; i++)
            gAnimSpeciesByBanks[i] = EWRAM_19348;
    }

    if (isMoveAnim == 0)
        sAnimMoveIndex = 0;
    else
        sAnimMoveIndex = move;

    for (i = 0; i < ANIM_ARGS_COUNT; i++)
        gBattleAnimArgs[i] = 0;

    gMonAnimTaskIdArray[0] = 0xFF;
    gMonAnimTaskIdArray[1] = 0xFF;
    sBattleAnimScriptPtr = moveAnims[move];
    gAnimScriptActive = TRUE;
    gAnimFramesToWait = 0;
    gAnimScriptCallback = RunAnimScriptCommand;

    for (i = 0; i < ANIM_SPRITE_INDEX_COUNT; i++)
        gAnimSpriteIndexArray[i] |= 0xFFFF;

    if (isMoveAnim)
    {
        for (i = 0; gUnknown_081C7160[i] != 0xFFFF; i++)
        {
            if (move == gUnknown_081C7160[i])
            {
                m4aMPlayVolumeControl(&gMPlay_BGM, 0xFFFF, 128);
                break;
            }
        }
    }

    gBattle_WIN0H = 0;
    gBattle_WIN0V = 0;
    gBattle_WIN1H = 0;
    gBattle_WIN1V = 0;
}

void DestroyAnimSprite(struct Sprite *sprite)
{
    FreeSpriteOamMatrix(sprite);
    DestroySprite(sprite);
    gAnimVisualTaskCount--;
}

void DestroyAnimVisualTask(u8 taskId)
{
    DestroyTask(taskId);
    gAnimVisualTaskCount--;
}

void DestroyAnimSoundTask(u8 taskId)
{
    DestroyTask(taskId);
    gAnimSoundTaskCount--;
}

static void AddSpriteIndex(u16 index)
{
    s32 i;

    for (i = 0; i < ANIM_SPRITE_INDEX_COUNT; i++)
    {
        if (gAnimSpriteIndexArray[i] == 0xFFFF)
        {
            gAnimSpriteIndexArray[i] = index;
            return;
        }
    }
}

static void ClearSpriteIndex(u16 index)
{
    s32 i;

    for (i = 0; i < ANIM_SPRITE_INDEX_COUNT; i++)
    {
        if (gAnimSpriteIndexArray[i] == index)
        {
            gAnimSpriteIndexArray[i] |= 0xFFFF;
            return;
        }
    }
}

static void WaitAnimFrameCount(void)
{
    if (gAnimFramesToWait <= 0)
    {
        gAnimScriptCallback = RunAnimScriptCommand;
        gAnimFramesToWait = 0;
    }
    else
    {
        gAnimFramesToWait--;
    }
}

static void RunAnimScriptCommand(void)
{
    do
    {
        sScriptCmdTable[T1_READ_8(sBattleAnimScriptPtr)]();
    } while (gAnimFramesToWait == 0 && gAnimScriptActive);
}

static void ScriptCmd_loadspritegfx(void)
{
    u16 index;

    sBattleAnimScriptPtr++;
    index = T1_READ_16(sBattleAnimScriptPtr);
    LoadCompressedObjectPic(&gBattleAnimPicTable[GET_TRUE_SPRITE_INDEX(index)]);
    LoadCompressedObjectPalette(&gBattleAnimPaletteTable[GET_TRUE_SPRITE_INDEX(index)]);
    sBattleAnimScriptPtr += 2;
    AddSpriteIndex(GET_TRUE_SPRITE_INDEX(index));
    gAnimFramesToWait = 1;
    gAnimScriptCallback = WaitAnimFrameCount;
}

static void ScriptCmd_unloadspritegfx(void)
{
    u16 index;

    sBattleAnimScriptPtr++;
    index = T1_READ_16(sBattleAnimScriptPtr);
    FreeSpriteTilesByTag(gBattleAnimPicTable[GET_TRUE_SPRITE_INDEX(index)].tag);
    FreeSpritePaletteByTag(gBattleAnimPicTable[GET_TRUE_SPRITE_INDEX(index)].tag);
    sBattleAnimScriptPtr += 2;
    ClearSpriteIndex(GET_TRUE_SPRITE_INDEX(index));
}

static void ScriptCmd_createsprite(void)
{
    s32 i;
    const struct SpriteTemplate *template;
    u8 argVar;
    u8 argsCount;
    s16 subpriority;

    sBattleAnimScriptPtr++;
    template = (const struct SpriteTemplate *)(T2_READ_32(sBattleAnimScriptPtr));
    sBattleAnimScriptPtr += 4;

    argVar = T1_READ_8(sBattleAnimScriptPtr);
    sBattleAnimScriptPtr++;

    argsCount = T1_READ_8(sBattleAnimScriptPtr);
    sBattleAnimScriptPtr++;
    for (i = 0; i < argsCount; i++)
    {
        gBattleAnimArgs[i] = T1_READ_16(sBattleAnimScriptPtr);
        sBattleAnimScriptPtr += 2;
    }

    if (argVar & 0x80)
    {
        argVar ^= 0x80;
        if (argVar >= 0x40)
            argVar -= 0x40;
        else
            argVar *= -1;

        subpriority = sub_8079E90(gAnimBankTarget) + (s8)(argVar);
    }
    else
    {
        if (argVar >= 0x40)
            argVar -= 0x40;
        else
            argVar *= -1;

        subpriority = sub_8079E90(gAnimBankAttacker) + (s8)(argVar);
    }

    if (subpriority < 3)
        subpriority = 3;

    CreateSpriteAndAnimate(template, GetBankPosition(gAnimBankTarget, 2), GetBankPosition(gAnimBankTarget, 3), subpriority);
    gAnimVisualTaskCount++;
}

static void ScriptCmd_createvisualtask(void)
{
    TaskFunc taskFunc;
    u8 taskPriority;
    u8 taskId;
    u8 numArgs;
    s32 i;

    sBattleAnimScriptPtr++;

    taskFunc = (TaskFunc)T2_READ_32(sBattleAnimScriptPtr);
    sBattleAnimScriptPtr += 4;

    taskPriority = T1_READ_8(sBattleAnimScriptPtr);
    sBattleAnimScriptPtr++;

    numArgs = T1_READ_8(sBattleAnimScriptPtr);
    sBattleAnimScriptPtr++;

    for (i = 0; i < numArgs; i++)
    {
        gBattleAnimArgs[i] = T1_READ_16(sBattleAnimScriptPtr);
        sBattleAnimScriptPtr += 2;
    }

    taskId = CreateTask(taskFunc, taskPriority);
    taskFunc(taskId);
    gAnimVisualTaskCount++;
}

static void ScriptCmd_delay(void)
{
    sBattleAnimScriptPtr++;
    gAnimFramesToWait = T1_READ_8(sBattleAnimScriptPtr);
    if (gAnimFramesToWait == 0)
        gAnimFramesToWait = -1;
    sBattleAnimScriptPtr++;
    gAnimScriptCallback = WaitAnimFrameCount;
}

// wait for visual tasks to finish.
static void ScriptCmd_waitforvisualfinish(void)
{
    if (gAnimVisualTaskCount == 0)
    {
        sBattleAnimScriptPtr++;
        gAnimFramesToWait = 0;
    }
    else
    {
        gAnimFramesToWait = 1;
    }
}

static void ScriptCmd_hang1(void)
{
}

static void ScriptCmd_hang2(void)
{
}

static void ScriptCmd_end(void)
{
    s32 i;
    bool32 continuousAnim = FALSE;

    // keep waiting as long as there is animations to be done.
    if (gAnimVisualTaskCount != 0 || gAnimSoundTaskCount != 0
     || gMonAnimTaskIdArray[0] != 0xFF || gMonAnimTaskIdArray[1] != 0xFF)
    {
        gSoundAnimFramesToWait = 0;
        gAnimFramesToWait = 1;
        return;
    }

    // finish the sound effects.
    if (IsSEPlaying())
    {
        if (++gSoundAnimFramesToWait <= 90) // wait 90 frames, then halt the sound effect.
        {
            gAnimFramesToWait = 1;
            return;
        }
        else
        {
            m4aMPlayStop(&gMPlay_SE1);
            m4aMPlayStop(&gMPlay_SE2);
        }
    }

    // the SE has halted, so set the SE Frame Counter to 0 and continue.
    gSoundAnimFramesToWait = 0;

    for (i = 0; i < ANIM_SPRITE_INDEX_COUNT; i++)
    {
        if (gAnimSpriteIndexArray[i] != 0xFFFF)
        {
            FreeSpriteTilesByTag(gBattleAnimPicTable[gAnimSpriteIndexArray[i]].tag);
            FreeSpritePaletteByTag(gBattleAnimPicTable[gAnimSpriteIndexArray[i]].tag);
            gAnimSpriteIndexArray[i] |= 0xFFFF; // set terminator.
        }
    }

    if (!continuousAnim) // may have been used for debug?
    {
        m4aMPlayVolumeControl(&gMPlay_BGM, 0xFFFF, 256);
        if (IsContest() == 0)
        {
            sub_8079E24();
            UpdateOamPriorityInAllHealthboxes(1);
        }
        gAnimScriptActive = FALSE;
    }
}

static void ScriptCmd_playse(void)
{
    sBattleAnimScriptPtr++;
    PlaySE(T1_READ_16(sBattleAnimScriptPtr));
    sBattleAnimScriptPtr += 2;
}

static void ScriptCmd_monbg(void)
{
    u8 animBank;
    u8 bank;
    u8 identity;
    bool8 toBG_2;
    u16 r4;
    u8 taskId;

    sBattleAnimScriptPtr++;
    animBank = T1_READ_8(sBattleAnimScriptPtr);
    if (animBank == ANIM_BANK_ATTACKER)
        animBank = ANIM_BANK_ATK_PARTNER;
    else if (animBank == ANIM_BANK_TARGET)
        animBank = ANIM_BANK_DEF_PARTNER;

    if (animBank == ANIM_BANK_ATTACKER || animBank == ANIM_BANK_ATK_PARTNER)
        bank = gAnimBankAttacker;
    else
        bank = gAnimBankTarget;

    if (IsAnimBankSpriteVisible(bank))
    {
        identity = GetBankIdentity(bank);
        identity += 0xFF;
        if (identity <= 1 || IsContest() != 0)
            toBG_2 = 0;
        else
            toBG_2 = 1;

        sub_8076034(bank, toBG_2);
        r4 = gObjectBankIDs[bank];
        taskId = CreateTask(task_pA_ma0A_obj_to_bg_pal, 10);
        gTasks[taskId].data[0] = r4;
        gTasks[taskId].data[1] = gSprites[r4].pos1.x + gSprites[r4].pos2.x;
        gTasks[taskId].data[2] = gSprites[r4].pos1.y + gSprites[r4].pos2.y;
        if (toBG_2 == 0)
        {
            gTasks[taskId].data[3] = gBattle_BG1_X;
            gTasks[taskId].data[4] = gBattle_BG1_Y;
        }
        else
        {
            gTasks[taskId].data[3] = gBattle_BG2_X;
            gTasks[taskId].data[4] = gBattle_BG2_Y;
        }
        gTasks[taskId].data[5] = toBG_2;
        gTasks[taskId].data[6] = bank;
        gMonAnimTaskIdArray[0] = taskId;

    }
    bank ^= 2;
    if (animBank > 1 && IsAnimBankSpriteVisible(bank))
    {
        identity = GetBankIdentity(bank);
        identity += 0xFF;
        if (identity <= 1 || IsContest() != 0)
            toBG_2 = 0;
        else
            toBG_2 = 1;
        sub_8076034(bank, toBG_2);
        r4 = gObjectBankIDs[bank];
        taskId = CreateTask(task_pA_ma0A_obj_to_bg_pal, 10);
        gTasks[taskId].data[0] = r4;
        gTasks[taskId].data[1] = gSprites[r4].pos1.x + gSprites[r4].pos2.x;
        gTasks[taskId].data[2] = gSprites[r4].pos1.y + gSprites[r4].pos2.y;
        if (toBG_2 == 0)
        {
            gTasks[taskId].data[3] = gBattle_BG1_X;
            gTasks[taskId].data[4] = gBattle_BG1_Y;
        }
        else
        {
            gTasks[taskId].data[3] = gBattle_BG2_X;
            gTasks[taskId].data[4] = gBattle_BG2_Y;
        }

        gTasks[taskId].data[5] = toBG_2;
        gTasks[taskId].data[6] = bank;
        gMonAnimTaskIdArray[1] = taskId;
    }

    sBattleAnimScriptPtr++;
}

bool8 IsAnimBankSpriteVisible(u8 bank)
{
    if (IsContest())
    {
        if (bank == gAnimBankAttacker)
            return TRUE;
        else
            return FALSE;
    }
    if (!IsBankSpritePresent(bank))
        return FALSE;
    if (IsContest())
        return TRUE; // this line wont ever be reached.
    if (!(EWRAM_17800[bank].unk0 & 1) || !gSprites[gObjectBankIDs[bank]].invisible)
        return TRUE;

    return FALSE;
}

void sub_8076034(u8 a, u8 b)
{
    volatile u8 pointlessZero;
    u16 *addr2;
    u8 spriteId;

    if (b == 0)
    {
        struct UnknownStruct2 s;
        u8 *addr;
        u32 size;
        u8 r2;
        u16 *addr3;

        sub_8078914(&s);
        addr = s.unk0;
        size = 0x2000;
        while (1)
        {
            DmaFill32(3, 0, addr, 0x1000);
            addr += 0x1000;
            size -= 0x1000;
            if (size <= 0x1000)
            {
                DmaFill32(3, 0, addr, size);
                break;
            }
        }
        pointlessZero = 0;
        pointlessZero = 0;
        addr2 = (void *)s.unk4;
        DmaFill16(3, 0xFF, addr2, 0x1000);

        REG_BG1CNT_BITFIELD.priority = 2;
        REG_BG1CNT_BITFIELD.screenSize = 1;
        REG_BG1CNT_BITFIELD.areaOverflowMode = 0;

        spriteId = gObjectBankIDs[a];
        gBattle_BG1_X = -(gSprites[spriteId].pos1.x + gSprites[spriteId].pos2.x) + 32;
        if (IsContest() != 0 && IsSpeciesNotUnown(EWRAM_19348) != 0)
            gBattle_BG1_X--;
        gBattle_BG1_Y = -(gSprites[spriteId].pos1.y + gSprites[spriteId].pos2.y) + 32;
        gSprites[gObjectBankIDs[a]].invisible = TRUE;

        REG_BG1HOFS = gBattle_BG1_X;
        REG_BG1VOFS = gBattle_BG1_Y;

        LoadPalette(gPlttBufferUnfaded + 0x100 + a * 16, s.unk8 * 16, 32);
        addr3 = (u16 *)PLTT + s.unk8 * 16;
        DmaCopy32(3, gPlttBufferUnfaded + 0x100 + a * 16, addr3, 32);

        if (IsContest() != 0)
            r2 = 0;
        else
            r2 = GetBankIdentity(a);
        sub_80E4EF8(0, 0, r2, s.unk8, (u32)s.unk0, (((s32)s.unk4 - VRAM) / 2048), REG_BG1CNT_BITFIELD.charBaseBlock);
        if (IsContest() != 0)
            sub_8076380();
    }
    else
    {
        u8 *addr;
        u32 size;
        u16 *addr3;

        addr = (void *)(VRAM + 0x6000);
        size = 0x2000;
        while (1)
        {
            DmaFill32(3, 0, addr, 0x1000);
            addr += 0x1000;
            size -= 0x1000;
            if (size <= 0x1000)
            {
                DmaFill32(3, 0, addr, size);
                break;
            }
        }
        pointlessZero = 0;
        pointlessZero = 0;
        addr2 = (void *)(VRAM + 0xF000);
        DmaFill32(3, 0, addr2, 0x800);

        REG_BG2CNT_BITFIELD.priority = 2;
        REG_BG2CNT_BITFIELD.screenSize = 1;
        REG_BG2CNT_BITFIELD.areaOverflowMode = 0;

        spriteId = gObjectBankIDs[a];
        gBattle_BG2_X = -(gSprites[spriteId].pos1.x + gSprites[spriteId].pos2.x) + 32;
        gBattle_BG2_Y = -(gSprites[spriteId].pos1.y + gSprites[spriteId].pos2.y) + 32;
        gSprites[gObjectBankIDs[a]].invisible = TRUE;

        REG_BG2HOFS = gBattle_BG2_X;
        REG_BG2VOFS = gBattle_BG2_Y;

        LoadPalette(gPlttBufferUnfaded + 0x100 + a * 16, 0x90, 32);
        addr3 = (void *)(PLTT + 0x120);
        DmaCopy32(3, gPlttBufferUnfaded + 0x100 + a * 16, addr3, 32);

        sub_80E4EF8(0, 0, GetBankIdentity(a), 9, 0x6000, 0x1E, REG_BG2CNT_BITFIELD.charBaseBlock);
    }
}

static void sub_8076380(void)
{
    int i;
    int j;
    struct UnknownStruct2 s;
    u16 *ptr;

    if (IsSpeciesNotUnown(EWRAM_19348))
    {
        sub_8078914(&s);
        ptr = s.unk4;
        for (i = 0; i < 8; i++)
        {
            for (j = 0; j < 4; j++)
            {
                u16 temp = ptr[j + i * 32];

                ptr[j + i * 32] = ptr[7 - j + i * 32];
                ptr[7 - j + i * 32] = temp;
            }
        }
        for (i = 0; i < 8; i++)
        {
            for (j = 0; j < 8; j++)
                ptr[j + i * 32] ^= 0x400;
        }
    }
}

void sub_80763FC(u16 a, u16 *b, u32 c, u8 d)
{
    u8 i;
    u8 j;
    u32 r9;

    if (d == 0)
        r9 = 32;
    else
        r9 = 64;
    a <<= 12;
    for (i = 0; i < r9; i++)
    {
        for (j = 0; j < 32; j++)
            b[j + i * 32] = ((b[j + i * 32] & 0xFFF) | a) + c;
    }
}

void sub_8076464(u8 a)
{
    u8 *addr;
    u32 size;
    volatile u8 pointlessZero;
    struct UnknownStruct2 s;

    sub_8078914(&s);
    if (a == 0 || IsContest() != 0)
    {
        u16 *addr2;

        addr = s.unk0;
        size = 0x2000;
        while (1)
        {
            DmaFill32(3, 0, addr, 0x1000);
            addr += 0x1000;
            size -= 0x1000;
            if (size <= 0x1000)
            {
                DmaFill32(3, 0, addr, size);
                break;
            }
        }
        pointlessZero = 0;
        pointlessZero = 0;
        addr2 = s.unk4;
        DmaFill32(3, 0, addr2, 0x800);
        gBattle_BG1_X = 0;
        gBattle_BG1_Y = 0;
    }
    else
    {
        u16 *addr2;

        addr = (void *)(VRAM + 0x6000);
        size = 0x2000;
        while (1)
        {
            DmaFill32(3, 0, addr, 0x1000);
            addr += 0x1000;
            size -= 0x1000;
            if (size <= 0x1000)
            {
                DmaFill32(3, 0, addr, size);
                break;
            }
        }
        pointlessZero = 0;
        pointlessZero = 0;
        addr2 = (void *)(VRAM + 0xF000);
        DmaFill32(3, 0, addr2, 0x800);
        gBattle_BG2_X = 0;
        gBattle_BG2_Y = 0;
    }
}

static void task_pA_ma0A_obj_to_bg_pal(u8 taskId)
{
    u8 spriteId, palIndex;
    s16 x, y;
    struct UnknownStruct2 s;

    spriteId = gTasks[taskId].data[0];
    palIndex = gTasks[taskId].data[6];
    sub_8078914(&s);
    x = gTasks[taskId].data[1] - (gSprites[spriteId].pos1.x + gSprites[spriteId].pos2.x);
    y = gTasks[taskId].data[2] - (gSprites[spriteId].pos1.y + gSprites[spriteId].pos2.y);

    if (gTasks[taskId].data[5] == 0)
    {
        u16 *src;
        u16 *dst;

        gBattle_BG1_X = x + gTasks[taskId].data[3];
        gBattle_BG1_Y = y + gTasks[taskId].data[4];
        src = gPlttBufferFaded + 0x100 + palIndex * 16;
        dst = gPlttBufferFaded + 0x100 + s.unk8 * 16 - 256;
        DmaCopy32(3, src, dst, 32);
    }
    else
    {
        u16 *src;
        u16 *dst;

        gBattle_BG2_X = x + gTasks[taskId].data[3];
        gBattle_BG2_Y = y + gTasks[taskId].data[4];
        src = gPlttBufferFaded + 0x100 + palIndex * 16;
        dst = gPlttBufferFaded + 0x100 - 112;
        DmaCopy32(3, src, dst, 32);
    }
}

static void ScriptCmd_clearmonbg(void)
{
    u8 animBankId;
    u8 bank;
    u8 taskId;

    sBattleAnimScriptPtr++;
    animBankId = T1_READ_8(sBattleAnimScriptPtr);

    if (animBankId == ANIM_BANK_ATTACKER)
        animBankId = ANIM_BANK_ATK_PARTNER;
    else if (animBankId == ANIM_BANK_TARGET)
        animBankId = ANIM_BANK_DEF_PARTNER;

    if (animBankId == ANIM_BANK_ATTACKER || animBankId == ANIM_BANK_ATK_PARTNER)
        bank = gAnimBankAttacker;
    else
        bank = gAnimBankTarget;

    if (gMonAnimTaskIdArray[0] != 0xFF)
        gSprites[gObjectBankIDs[bank]].invisible = FALSE;
    if (animBankId > 1 && gMonAnimTaskIdArray[1] != 0xFF)
        gSprites[gObjectBankIDs[bank ^ 2]].invisible = FALSE;
    else
        animBankId = 0;

    taskId = CreateTask(sub_807672C, 5);
    gTasks[taskId].data[0] = animBankId;
    gTasks[taskId].data[2] = bank;
    sBattleAnimScriptPtr++;
}

static void sub_807672C(u8 taskId)
{
    u8 identity;
    u8 to_BG2;

    gTasks[taskId].data[1]++;
    if (gTasks[taskId].data[1] != 1)
    {
        identity = GetBankIdentity(gTasks[taskId].data[2]);
        identity += 0xFF;
        if (identity <= 1 || IsContest() != 0)
            to_BG2 = 0;
        else
            to_BG2 = 1;
        if (gMonAnimTaskIdArray[0] != 0xFF)
        {
            sub_8076464(to_BG2);
            DestroyTask(gMonAnimTaskIdArray[0]);
            gMonAnimTaskIdArray[0] = 0xFF;
        }
        if (gTasks[taskId].data[0] > 1)
        {
            sub_8076464(to_BG2 ^ 1);
            DestroyTask(gMonAnimTaskIdArray[1]);
            gMonAnimTaskIdArray[1] = 0xFF;
        }
        DestroyTask(taskId);
    }
}

static void ScriptCmd_monbg_22(void)
{
    u8 animBankId;
    u8 bank;
    u8 identity;
    u8 r1;

    sBattleAnimScriptPtr++;
    animBankId = T1_READ_8(sBattleAnimScriptPtr);

    if (animBankId == ANIM_BANK_ATTACKER)
        animBankId = ANIM_BANK_ATK_PARTNER;
    else if (animBankId == ANIM_BANK_TARGET)
        animBankId = ANIM_BANK_DEF_PARTNER;

    if (animBankId == ANIM_BANK_ATTACKER || animBankId == ANIM_BANK_ATK_PARTNER)
        bank = gAnimBankAttacker;
    else
        bank = gAnimBankTarget;

    if (IsAnimBankSpriteVisible(bank))
    {
        identity = GetBankIdentity(bank);
        identity += 0xFF;
        if (identity <= 1 || IsContest() != 0)
            r1 = 0;
        else
            r1 = 1;
        sub_8076034(bank, r1);
        gSprites[gObjectBankIDs[bank]].invisible = FALSE;
    }

    bank ^= 2;
    if (animBankId > ANIM_BANK_TARGET && IsAnimBankSpriteVisible(bank))
    {
        identity = GetBankIdentity(bank);
        identity += 0xFF;
        if (identity <= 1 || IsContest() != 0)
            r1 = 0;
        else
            r1 = 1;
        sub_8076034(bank, r1);
        gSprites[gObjectBankIDs[bank]].invisible = FALSE;
    }
    sBattleAnimScriptPtr++;
}

static void ScriptCmd_clearmonbg_23(void)
{
    u8 animBankId;
    u8 bank;
    u8 taskId;

    sBattleAnimScriptPtr++;
    animBankId = T1_READ_8(sBattleAnimScriptPtr);

    if (animBankId == ANIM_BANK_ATTACKER)
        animBankId = ANIM_BANK_ATK_PARTNER;
    else if (animBankId == ANIM_BANK_TARGET)
        animBankId = ANIM_BANK_DEF_PARTNER;

    if (animBankId == ANIM_BANK_ATTACKER || animBankId == ANIM_BANK_ATK_PARTNER)
        bank = gAnimBankAttacker;
    else
        bank = gAnimBankTarget;

    if (IsAnimBankSpriteVisible(bank))
        gSprites[gObjectBankIDs[bank]].invisible = FALSE;
    if (animBankId > 1 && IsAnimBankSpriteVisible(bank ^ 2))
        gSprites[gObjectBankIDs[bank ^ 2]].invisible = FALSE;
    else
        animBankId = 0;

    taskId = CreateTask(sub_80769A4, 5);
    gTasks[taskId].data[0] = animBankId;
    gTasks[taskId].data[2] = bank;

    sBattleAnimScriptPtr++;
}

static void sub_80769A4(u8 taskId)
{
    u8 identity;
    u8 bank;
    u8 toBG_2;

    gTasks[taskId].data[1]++;
    if (gTasks[taskId].data[1] != 1)
    {
        bank = gTasks[taskId].data[2];
        identity = GetBankIdentity(bank);
        identity += 0xFF;
        if (identity <= 1 || IsContest() != 0)
            toBG_2 = 0;
        else
            toBG_2 = 1;
        if (IsAnimBankSpriteVisible(bank))
            sub_8076464(toBG_2);
        if (gTasks[taskId].data[0] > 1 && IsAnimBankSpriteVisible(bank ^ 2))
            sub_8076464(toBG_2 ^ 1);
        DestroyTask(taskId);
    }
}

static void ScriptCmd_setalpha(void)
{
    u16 half1, half2;

    sBattleAnimScriptPtr++;
    half1 = *(sBattleAnimScriptPtr++);
    half2 = *(sBattleAnimScriptPtr++) << 8;
    REG_BLDCNT = 0x3F40;
    REG_BLDALPHA = half1 | half2;
}

static void ScriptCmd_setbldcnt(void)
{
    u16 half1, half2;

    sBattleAnimScriptPtr++;
    half1 = *(sBattleAnimScriptPtr++);
    half2 = *(sBattleAnimScriptPtr++) << 8;
    REG_BLDCNT = half1 | half2;
}

static void ScriptCmd_blendoff(void)
{
    sBattleAnimScriptPtr++;
    REG_BLDCNT = 0;
    REG_BLDALPHA = 0;
}

static void ScriptCmd_call(void)
{
    sBattleAnimScriptPtr++;
    gBattleAnimScriptRetAddr = sBattleAnimScriptPtr + 4;
    sBattleAnimScriptPtr = T2_READ_PTR(sBattleAnimScriptPtr);
}

static void ScriptCmd_return(void)
{
    sBattleAnimScriptPtr = gBattleAnimScriptRetAddr;
}

static void ScriptCmd_setarg(void)
{
    const u8 *addr = sBattleAnimScriptPtr;
    u16 value;
    u8 argId;

    sBattleAnimScriptPtr++;
    argId = T1_READ_8(sBattleAnimScriptPtr);
    sBattleAnimScriptPtr++;
    value = T1_READ_16(sBattleAnimScriptPtr);
    sBattleAnimScriptPtr = addr + 4;
    gBattleAnimArgs[argId] = value;
}

static void ScriptCmd_choosetwoturnanim(void)
{
    sBattleAnimScriptPtr++;
    if (gAnimMoveTurn & 1)
        sBattleAnimScriptPtr += 4;
    sBattleAnimScriptPtr = T2_READ_PTR(sBattleAnimScriptPtr);
}

static void ScriptCmd_jumpifmoveturn(void)
{
    u8 toCheck;

    sBattleAnimScriptPtr++;
    toCheck = T1_READ_8(sBattleAnimScriptPtr);
    sBattleAnimScriptPtr++;

    if (toCheck == gAnimMoveTurn)
    {
        sBattleAnimScriptPtr = T2_READ_PTR(sBattleAnimScriptPtr);
    }
    else
    {
        sBattleAnimScriptPtr += 4;
    }
}

static void ScriptCmd_jump(void)
{
    sBattleAnimScriptPtr++;
    sBattleAnimScriptPtr = T2_READ_PTR(sBattleAnimScriptPtr);
}

bool8 IsContest(void)
{
    if (!gMain.inBattle)
        return TRUE;
    else
        return FALSE;
}

#define tBackgroundId   data[0]
#define tState          data[10]

static void ScriptCmd_fadetobg(void)
{
    u8 backgroundId;
    u8 taskId;

    sBattleAnimScriptPtr++;
    backgroundId = T1_READ_8(sBattleAnimScriptPtr);
    sBattleAnimScriptPtr++;
    taskId = CreateTask(Task_FadeToBg, 5);
    gTasks[taskId].tBackgroundId = backgroundId;
    sAnimBackgroundFadeState = 1;
}

static void ScriptCmd_fadetobgfromset(void)
{
    u8 bg1, bg2, bg3;
    u8 taskId;

    sBattleAnimScriptPtr++;
    bg1 = sBattleAnimScriptPtr[0];
    bg2 = sBattleAnimScriptPtr[1];
    bg3 = sBattleAnimScriptPtr[2];
    sBattleAnimScriptPtr += 3;
    taskId = CreateTask(Task_FadeToBg, 5);

    if (IsContest())
        gTasks[taskId].tBackgroundId = bg3;
    else if (GetBankSide(gAnimBankTarget) == 0)
        gTasks[taskId].tBackgroundId = bg2;
    else
        gTasks[taskId].tBackgroundId = bg1;

    sAnimBackgroundFadeState = 1;
}

static void Task_FadeToBg(u8 taskId)
{
    if (gTasks[taskId].tState == 0)
    {
        BeginHardwarePaletteFade(0xE8, 0, 0, 16, 0);
        gTasks[taskId].tState++;
        return;
    }
    if (gPaletteFade.active)
        return;
    if (gTasks[taskId].tState == 1)
    {
        gTasks[taskId].tState++;
        sAnimBackgroundFadeState = 2;
    }
    else if (gTasks[taskId].tState == 2)
    {
        s16 bgId = (u16)gTasks[taskId].tBackgroundId;

        if (bgId == -1)
            LoadDefaultBg();
        else
            LoadMoveBg(bgId);

        BeginHardwarePaletteFade(0xE8, 0, 16, 0, 1);
        gTasks[taskId].tState++;
        return;
    }
    if (gPaletteFade.active)
        return;
    if (gTasks[taskId].tState == 3)
    {
        DestroyTask(taskId);
        sAnimBackgroundFadeState = 0;
    }
}

static void LoadMoveBg(u16 bgId)
{
    if (IsContest())
    {
        void *tilemap = gBattleAnimBackgroundTable[bgId].tilemap;
        void *dmaSrc;
        void *dmaDest;

        LZDecompressWram(tilemap, IsContest() ? EWRAM_14800 : EWRAM_18000);
        sub_80763FC(sub_80789BC(), IsContest() ? EWRAM_14800 : EWRAM_18000, 0x100, 0);
        dmaSrc = IsContest() ? EWRAM_14800 : EWRAM_18000;
        dmaDest = (void *)(VRAM + 0xD000);
        DmaCopy32(3, dmaSrc, dmaDest, 0x800);
        LZDecompressVram(gBattleAnimBackgroundTable[bgId].image, (void *)(VRAM + 0x2000));
        LoadCompressedPalette(gBattleAnimBackgroundTable[bgId].palette, sub_80789BC() * 16, 32);
    }
    else
    {
        LZDecompressVram(gBattleAnimBackgroundTable[bgId].tilemap, (void *)(VRAM + 0xD000));
        LZDecompressVram(gBattleAnimBackgroundTable[bgId].image, (void *)(VRAM + 0x8000));
        LoadCompressedPalette(gBattleAnimBackgroundTable[bgId].palette, 32, 32);
    }
}

static void LoadDefaultBg(void)
{
    if (IsContest())
        LoadContestBgAfterMoveAnim();
    else
        DrawMainBattleBackground();
}

static void ScriptCmd_restorebg(void)
{
    u8 taskId;

    sBattleAnimScriptPtr++;
    taskId = CreateTask(Task_FadeToBg, 5);
    gTasks[taskId].tBackgroundId = 0xFFFF;
    sAnimBackgroundFadeState = 1;
}

#undef tBackgroundId
#undef tState

static void ScriptCmd_waitbgfadeout(void)
{
    if (sAnimBackgroundFadeState == 2)
    {
        sBattleAnimScriptPtr++;
        gAnimFramesToWait = 0;
    }
    else
    {
        gAnimFramesToWait = 1;
    }
}

static void ScriptCmd_waitbgfadein(void)
{
    if (sAnimBackgroundFadeState == 0)
    {
        sBattleAnimScriptPtr++;
        gAnimFramesToWait = 0;
    }
    else
    {
        gAnimFramesToWait = 1;
    }
}

static void ScriptCmd_changebg(void)
{
    sBattleAnimScriptPtr++;
    LoadMoveBg(T1_READ_8(sBattleAnimScriptPtr));
    sBattleAnimScriptPtr++;
}

//Weird control flow
/*
s8 BattleAnimAdjustPanning(s8 a)
{
    if (!IsContest() && (EWRAM_17810[gAnimBankAttacker].unk0 & 0x10))
    {
        a = GetBankSide(gAnimBankAttacker) ? 0xC0 : 0x3F;
    }
    //_08076FDC
    else
    {
        if (IsContest())
        {
            if (gAnimBankAttacker == gAnimBankTarget && gAnimBankAttacker == 2
             && a == 0x3F)
            {
                //jump to _0807707A
                if (a < -0x40)
                    a = 0xC0;
                return a;
            }
        }
        //_08077004
        else
        {
            if (GetBankSide(gAnimBankAttacker) == 0)
            {
                if (GetBankSide(gAnimBankTarget) == 0)
            }
            //_08077042
            else
            {

            }
            //_0807706C
        }
    }
    //_0807706E
}
*/
__attribute__((naked))
s8 BattleAnimAdjustPanning(s8 a)
{
    asm(".syntax unified\n\
    push {r4,lr}\n\
    lsls r0, 24\n\
    lsrs r4, r0, 24\n\
    bl IsContest\n\
    lsls r0, 24\n\
    cmp r0, 0\n\
    bne _08076FDC\n\
    ldr r0, _08076FD4 @ =gAnimBankAttacker\n\
    ldrb r2, [r0]\n\
    lsls r0, r2, 1\n\
    adds r0, r2\n\
    lsls r0, 2\n\
    ldr r1, _08076FD8 @ =gSharedMem + 0x17810\n\
    adds r0, r1\n\
    ldrb r1, [r0]\n\
    movs r0, 0x10\n\
    ands r0, r1\n\
    cmp r0, 0\n\
    beq _08076FDC\n\
    adds r0, r2, 0\n\
    bl GetBankSide\n\
    lsls r0, 24\n\
    movs r4, 0xC0\n\
    cmp r0, 0\n\
    beq _0807706E\n\
    movs r4, 0x3F\n\
    b _0807706E\n\
    .align 2, 0\n\
_08076FD4: .4byte gAnimBankAttacker\n\
_08076FD8: .4byte gSharedMem + 0x17810\n\
_08076FDC:\n\
    bl IsContest\n\
    lsls r0, 24\n\
    cmp r0, 0\n\
    beq _08077004\n\
    ldr r0, _08076FFC @ =gAnimBankAttacker\n\
    ldr r1, _08077000 @ =gAnimBankTarget\n\
    ldrb r0, [r0]\n\
    ldrb r1, [r1]\n\
    cmp r0, r1\n\
    bne _08077068\n\
    cmp r0, 0x2\n\
    bne _08077068\n\
    cmp r4, 0x3F\n\
    beq _0807707A\n\
    b _08077068\n\
    .align 2, 0\n\
_08076FFC: .4byte gAnimBankAttacker\n\
_08077000: .4byte gAnimBankTarget\n\
_08077004:\n\
    ldr r0, _0807702C @ =gAnimBankAttacker\n\
    ldrb r0, [r0]\n\
    bl GetBankSide\n\
    lsls r0, 24\n\
    cmp r0, 0\n\
    bne _08077042\n\
    ldr r0, _08077030 @ =gAnimBankTarget\n\
    ldrb r0, [r0]\n\
    bl GetBankSide\n\
    lsls r0, 24\n\
    cmp r0, 0\n\
    bne _0807706E\n\
    lsls r0, r4, 24\n\
    asrs r1, r0, 24\n\
    cmp r1, 0x3F\n\
    bne _08077034\n\
    movs r4, 0xC0\n\
    b _0807706E\n\
    .align 2, 0\n\
_0807702C: .4byte gAnimBankAttacker\n\
_08077030: .4byte gAnimBankTarget\n\
_08077034:\n\
    movs r0, 0x40\n\
    negs r0, r0\n\
    cmp r1, r0\n\
    beq _0807706E\n\
    negs r0, r1\n\
    lsls r0, 24\n\
    b _0807706C\n\
_08077042:\n\
    ldr r0, _08077064 @ =gAnimBankTarget\n\
    ldrb r0, [r0]\n\
    bl GetBankSide\n\
    lsls r0, 24\n\
    lsrs r0, 24\n\
    cmp r0, 0x1\n\
    bne _08077068\n\
    lsls r0, r4, 24\n\
    asrs r0, 24\n\
    movs r1, 0x40\n\
    negs r1, r1\n\
    cmp r0, r1\n\
    bne _0807706E\n\
    movs r4, 0x3F\n\
    b _0807706E\n\
    .align 2, 0\n\
_08077064: .4byte gAnimBankTarget\n\
_08077068:\n\
    lsls r0, r4, 24\n\
    negs r0, r0\n\
_0807706C:\n\
    lsrs r4, r0, 24\n\
_0807706E:\n\
    lsls r0, r4, 24\n\
    asrs r0, 24\n\
    cmp r0, 0x3F\n\
    ble _0807707A\n\
    movs r4, 0x3F\n\
    b _08077088\n\
_0807707A:\n\
    lsls r0, r4, 24\n\
    asrs r0, 24\n\
    movs r1, 0x40\n\
    negs r1, r1\n\
    cmp r0, r1\n\
    bge _08077088\n\
    movs r4, 0xC0\n\
_08077088:\n\
    lsls r0, r4, 24\n\
    asrs r0, 24\n\
    pop {r4}\n\
    pop {r1}\n\
    bx r1\n\
    .syntax divided\n");
}

s8 BattleAnimAdjustPanning2(s8 pan)
{
    if (!IsContest() && (EWRAM_17810[gAnimBankAttacker].unk0 & 0x10))
    {
        if (GetBankSide(gAnimBankAttacker) != 0)
            pan = 0x3F;
        else
            pan = 0xC0;
    }
    else
    {
        if (GetBankSide(gAnimBankAttacker) != 0 || IsContest() != 0)
            pan = -pan;
    }
    return pan;
}

s16 sub_8077104(s16 a)
{
    s16 var = a;

    if (var > 63)
        var = 63;
    else if (var < -64)
        var = -64;
    return var;
}

s16 CalculatePanIncrement(s16 sourcePan, s16 targetPan, s16 incrementPan)
{
    u16 ret;

    if (sourcePan < targetPan)
        ret = ((incrementPan < 0) ? -incrementPan : incrementPan);
    else if (sourcePan > targetPan)
        ret = -((incrementPan < 0) ? -incrementPan : incrementPan);
    else
        ret = 0;

    return ret;
}

static void ScriptCmd_playsewithpan(void)
{
    u16 songId;
    s8 pan;

    sBattleAnimScriptPtr++;
    songId = T1_READ_16(sBattleAnimScriptPtr);
    pan = T1_READ_8(sBattleAnimScriptPtr + 2);
    PlaySE12WithPanning(songId, BattleAnimAdjustPanning(pan));
    sBattleAnimScriptPtr += 3;
}

static void ScriptCmd_setpan(void)
{
    s8 pan;

    sBattleAnimScriptPtr++;
    pan = T1_READ_8(sBattleAnimScriptPtr);
    SE12PanpotControl(BattleAnimAdjustPanning(pan));
    sBattleAnimScriptPtr++;
}

#define tInitialPan     data[0]
#define tTargetPan      data[1]
#define tIncrementPan   data[2]
#define tFramesToWait   data[3]
#define tCurrentPan     data[4]
#define tFrameCounter   data[8]

static void ScriptCmd_panse_1B(void)
{
    u16 songNum;
    s8 currentPanArg, incrementPan, incrementPanArg, currentPan, targetPan;
    u8 framesToWait;
    u8 taskId;

    sBattleAnimScriptPtr++;
    songNum = T1_READ_16(sBattleAnimScriptPtr);
    currentPanArg = T1_READ_8(sBattleAnimScriptPtr + 2);
    incrementPan = T1_READ_8(sBattleAnimScriptPtr + 3);
    incrementPanArg = T1_READ_8(sBattleAnimScriptPtr + 4);
    framesToWait = T1_READ_8(sBattleAnimScriptPtr + 5);

    currentPan = BattleAnimAdjustPanning(currentPanArg);
    targetPan = BattleAnimAdjustPanning(incrementPan);
    incrementPan = CalculatePanIncrement(currentPan, targetPan, incrementPanArg);
    taskId = CreateTask(Task_PanFromInitialToTarget, 1);
    gTasks[taskId].tInitialPan = currentPan;
    gTasks[taskId].tTargetPan = targetPan;
    gTasks[taskId].tIncrementPan = incrementPan;
    gTasks[taskId].tFramesToWait = framesToWait;
    gTasks[taskId].tCurrentPan = currentPan;

    PlaySE12WithPanning(songNum, currentPan);

    gAnimSoundTaskCount++;
    sBattleAnimScriptPtr += 6;
}

void Task_PanFromInitialToTarget(u8 taskId)
{
    bool32 destroyTask = FALSE;
    if (gTasks[taskId].tFrameCounter++ >= gTasks[taskId].tFramesToWait)
    {
        s16 pan;
        s16 initialPanning, targetPanning, currentPan, incrementPan;

        gTasks[taskId].tFrameCounter = 0;
        initialPanning = gTasks[taskId].tInitialPan;
        targetPanning = gTasks[taskId].tTargetPan;
        currentPan = gTasks[taskId].tCurrentPan;
        incrementPan = gTasks[taskId].tIncrementPan;
        pan = currentPan + incrementPan;
        gTasks[taskId].tCurrentPan = pan;

        if (incrementPan == 0) // If we're not incrementing, just cancel the task immediately
        {
            destroyTask = TRUE;
        }
        else if (initialPanning < targetPanning) // Panning increasing
        {
            if (pan >= targetPanning) // Target reached
                destroyTask = TRUE;
        }
        else // Panning decreasing
        {
            if (pan <= targetPanning) // Target reached
                destroyTask = TRUE;
        }

        if (destroyTask)
        {
            pan = targetPanning;
            DestroyTask(taskId);
            gAnimSoundTaskCount--;
        }

        SE12PanpotControl(pan);
    }
}

static void ScriptCmd_panse_26(void)
{
    u16 songId;
    s8 currentPan, targetPan, incrementPan;
    u8 framesToWait;
    u8 taskId;

    sBattleAnimScriptPtr++;
    songId = T1_READ_16(sBattleAnimScriptPtr);
    currentPan = T1_READ_8(sBattleAnimScriptPtr + 2);
    targetPan = T1_READ_8(sBattleAnimScriptPtr + 3);
    incrementPan = T1_READ_8(sBattleAnimScriptPtr + 4);
    framesToWait = T1_READ_8(sBattleAnimScriptPtr + 5);

    taskId = CreateTask(Task_PanFromInitialToTarget, 1);
    gTasks[taskId].tInitialPan = currentPan;
    gTasks[taskId].tTargetPan = targetPan;
    gTasks[taskId].tIncrementPan = incrementPan;
    gTasks[taskId].tFramesToWait = framesToWait;
    gTasks[taskId].tCurrentPan = currentPan;

    PlaySE12WithPanning(songId, currentPan);

    gAnimSoundTaskCount++;
    sBattleAnimScriptPtr += 6;
}

static void ScriptCmd_panse_27(void)
{
    u16 songId;
    u8 targetPanArg, incrementPanArg, currentPan, currentPanArg;
    s8 targetPan, incrementPan, framesToWait;
    u8 taskId;

    sBattleAnimScriptPtr++;
    songId = T1_READ_16(sBattleAnimScriptPtr);
    currentPanArg = T1_READ_8(sBattleAnimScriptPtr + 2);
    targetPanArg = T1_READ_8(sBattleAnimScriptPtr + 3);
    incrementPanArg = T1_READ_8(sBattleAnimScriptPtr + 4);
    currentPan = T1_READ_8(sBattleAnimScriptPtr + 5);

    targetPan = BattleAnimAdjustPanning2(currentPanArg);
    incrementPan = BattleAnimAdjustPanning2(targetPanArg);
    framesToWait = BattleAnimAdjustPanning2(incrementPanArg);

    taskId = CreateTask(Task_PanFromInitialToTarget, 1);
    gTasks[taskId].data[0] = targetPan;
    gTasks[taskId].data[1] = incrementPan;
    gTasks[taskId].data[2] = framesToWait;
    gTasks[taskId].data[3] = currentPan;
    gTasks[taskId].data[4] = targetPan;

    PlaySE12WithPanning(songId, targetPan);

    gAnimSoundTaskCount++;
    sBattleAnimScriptPtr += 6;
}

#undef tInitialPan
#undef tTargetPan
#undef tIncrementPan
#undef tFramesToWait
#undef tCurrentPan
#undef tFrameCounter

#define tSongId         data[0]
#define tPanning        data[1]
#define tFramesToWait   data[2]
#define tNumberOfPlays  data[3]
#define tFrameCounter   data[8]

static void ScriptCmd_loopsewithpan(void)
{
    u16 songId;
    s8 panningArg, panning;
    u8 framesToWait, numberOfPlays;
    u8 taskId;

    sBattleAnimScriptPtr++;
    songId = T1_READ_16(sBattleAnimScriptPtr);
    panningArg = T1_READ_8(sBattleAnimScriptPtr + 2);
    framesToWait = T1_READ_8(sBattleAnimScriptPtr + 3);
    numberOfPlays = T1_READ_8(sBattleAnimScriptPtr + 4);
    panning = BattleAnimAdjustPanning(panningArg);

    taskId = CreateTask(Task_LoopAndPlaySE, 1);
    gTasks[taskId].tSongId = songId;
    gTasks[taskId].tPanning = panning;
    gTasks[taskId].tFramesToWait = framesToWait;
    gTasks[taskId].tNumberOfPlays = numberOfPlays;
    gTasks[taskId].tFrameCounter = framesToWait;
    gTasks[taskId].func(taskId);

    gAnimSoundTaskCount++;
    sBattleAnimScriptPtr += 5;
}

static void Task_LoopAndPlaySE(u8 taskId)
{
    if (gTasks[taskId].tFrameCounter++ >= gTasks[taskId].tFramesToWait)
    {
        u16 songId;
        s8 panning;
        u8 numberOfPlays;

        gTasks[taskId].tFrameCounter = 0;
        songId = gTasks[taskId].tSongId;
        panning = gTasks[taskId].tPanning;
        numberOfPlays = --gTasks[taskId].tNumberOfPlays;
        PlaySE12WithPanning(songId, panning);
        if (numberOfPlays == 0)
        {
            DestroyTask(taskId);
            gAnimSoundTaskCount--;
        }
    }
}

#undef tSongId
#undef tPanning
#undef tFramesToWait
#undef tNumberOfPlays
#undef tFrameCounter

#define tSongId         data[0]
#define tPanning        data[1]
#define tFramesToWait   data[2]

static void ScriptCmd_waitplaysewithpan(void)
{
    u16 songId;
    s8 panningArg, panning;
    u8 framesToWait;
    u8 taskId;

    sBattleAnimScriptPtr++;
    songId = T1_READ_16(sBattleAnimScriptPtr);
    panningArg = T1_READ_8(sBattleAnimScriptPtr + 2);
    framesToWait = T1_READ_8(sBattleAnimScriptPtr + 3);
    panning = BattleAnimAdjustPanning(panningArg);

    taskId = CreateTask(Task_WaitAndPlaySE, 1);
    gTasks[taskId].tSongId = songId;
    gTasks[taskId].tPanning = panning;
    gTasks[taskId].tFramesToWait = framesToWait;

    gAnimSoundTaskCount++;
    sBattleAnimScriptPtr += 4;
}

static void Task_WaitAndPlaySE(u8 taskId)
{
    if (gTasks[taskId].tFramesToWait-- <= 0)
    {
        PlaySE12WithPanning(gTasks[taskId].tSongId, gTasks[taskId].tPanning);
        DestroyTask(taskId);
        gAnimSoundTaskCount--;
    }
}

#undef tSongId
#undef tPanning
#undef tFramesToWait

static void ScriptCmd_createsoundtask(void)
{
    TaskFunc func;
    u8 numArgs, taskId;
    s32 i;

    sBattleAnimScriptPtr++;
    func = (TaskFunc)T2_READ_32(sBattleAnimScriptPtr);
    sBattleAnimScriptPtr += 4;
    numArgs = T1_READ_8(sBattleAnimScriptPtr);
    sBattleAnimScriptPtr++;
    for (i = 0; i < numArgs; i++)
    {
        gBattleAnimArgs[i] = T1_READ_16(sBattleAnimScriptPtr);
        sBattleAnimScriptPtr += 2;
    }
    taskId = CreateTask(func, 1);
    func(taskId);
    gAnimSoundTaskCount++;
}

static void ScriptCmd_waitsound(void)
{
    if (gAnimSoundTaskCount != 0)
    {
        gSoundAnimFramesToWait = 0;
        gAnimFramesToWait = 1;
    }
    else if (IsSEPlaying())
    {
        if (++gSoundAnimFramesToWait > 90)
        {
            m4aMPlayStop(&gMPlay_SE1);
            m4aMPlayStop(&gMPlay_SE2);
            gSoundAnimFramesToWait = 0;
        }
        else
        {
            gAnimFramesToWait = 1;
        }
    }
    else
    {
        gSoundAnimFramesToWait = 0;
        sBattleAnimScriptPtr++;
        gAnimFramesToWait = 0;
    }
}

static void ScriptCmd_jumpargeq(void)
{
    u8 argId;
    s16 valueToCheck;

    sBattleAnimScriptPtr++;
    argId = T1_READ_8(sBattleAnimScriptPtr);
    valueToCheck = T1_READ_16(sBattleAnimScriptPtr + 1);

    if (valueToCheck == gBattleAnimArgs[argId])
        sBattleAnimScriptPtr = T2_READ_PTR(sBattleAnimScriptPtr + 3);
    else
        sBattleAnimScriptPtr += 7;
}

static void ScriptCmd_jumpifcontest(void)
{
    sBattleAnimScriptPtr++;
    if (IsContest())
        sBattleAnimScriptPtr = T2_READ_PTR(sBattleAnimScriptPtr);
    else
        sBattleAnimScriptPtr += 4;
}

static void ScriptCmd_monbgprio_28(void)
{
    u8 wantedBank;
    u8 bank;
    u8 bankIdentity;

    wantedBank = T1_READ_8(sBattleAnimScriptPtr + 1);
    sBattleAnimScriptPtr += 2;

    if (wantedBank != 0)
        bank = gAnimBankTarget;
    else
        bank = gAnimBankAttacker;

    bankIdentity = GetBankIdentity(bank);
    if (!IsContest() && (bankIdentity == 0 || bankIdentity == 3))
    {
        REG_BG1CNT_BITFIELD.priority = 1;
        REG_BG2CNT_BITFIELD.priority = 2;
    }
}

static void ScriptCmd_monbgprio_29(void)
{
    sBattleAnimScriptPtr++;
    if (!IsContest())
    {
        REG_BG1CNT_BITFIELD.priority = 1;
        REG_BG2CNT_BITFIELD.priority = 2;
    }
}

static void ScriptCmd_monbgprio_2A(void)
{
    u8 wantedBank;
    u8 bankIdentity;
    u8 bank;

    wantedBank = T1_READ_8(sBattleAnimScriptPtr + 1);
    sBattleAnimScriptPtr += 2;
    if (GetBankSide(gAnimBankAttacker) != GetBankSide(gAnimBankTarget))
    {
        if (wantedBank != 0)
            bank = gAnimBankTarget;
        else
            bank = gAnimBankAttacker;
        bankIdentity = GetBankIdentity(bank);
        if (!IsContest() && (bankIdentity == 0 || bankIdentity == 3))
        {
            REG_BG1CNT_BITFIELD.priority = 1;
            REG_BG2CNT_BITFIELD.priority = 2;
        }
    }
}

static void ScriptCmd_invisible(void)
{
    u8 spriteId;

    spriteId = GetAnimBankSpriteId(T1_READ_8(sBattleAnimScriptPtr + 1));
    if (spriteId != 0xFF)
        gSprites[spriteId].invisible = TRUE;

    sBattleAnimScriptPtr += 2;
}

static void ScriptCmd_visible(void)
{
    u8 spriteId;

    spriteId = GetAnimBankSpriteId(T1_READ_8(sBattleAnimScriptPtr + 1));
    if (spriteId != 0xFF)
        gSprites[spriteId].invisible = FALSE;

    sBattleAnimScriptPtr += 2;
}

static void ScriptCmd_doublebattle_2D(void)
{
    u8 wantedBank;
    u8 r4;
    u8 spriteId;

    wantedBank = T1_READ_8(sBattleAnimScriptPtr + 1);
    sBattleAnimScriptPtr += 2;
    if (!IsContest() && IsDoubleBattle()
     && GetBankSide(gAnimBankAttacker) == GetBankSide(gAnimBankTarget))
    {
        if (wantedBank == 0)
        {
            r4 = GetBankIdentity_permutated(gAnimBankAttacker);
            spriteId = GetAnimBankSpriteId(0);
        }
        else
        {
            r4 = GetBankIdentity_permutated(gAnimBankTarget);
            spriteId = GetAnimBankSpriteId(1);
        }
        if (spriteId != 0xFF)
        {
            gSprites[spriteId].invisible = FALSE;
            if (r4 == 2)
                gSprites[spriteId].oam.priority = 3;
            if (r4 == 1)
                sub_8076464(0);
            else
                sub_8076464(1);
        }
    }
}

static void ScriptCmd_doublebattle_2E(void)
{
    u8 wantedBank;
    u8 r4;
    u8 spriteId;

    wantedBank = T1_READ_8(sBattleAnimScriptPtr  + 1);
    sBattleAnimScriptPtr += 2;
    if (!IsContest() && IsDoubleBattle()
     && GetBankSide(gAnimBankAttacker) == GetBankSide(gAnimBankTarget))
    {
        if (wantedBank == 0)
        {
            r4 = GetBankIdentity_permutated(gAnimBankAttacker);
            spriteId = GetAnimBankSpriteId(0);
        }
        else
        {
            r4 = GetBankIdentity_permutated(gAnimBankTarget);
            spriteId = GetAnimBankSpriteId(1);
        }
        if (spriteId != 0xFF && r4 == 2)
        {
            gSprites[spriteId].oam.priority = 2;
        }
    }
}

static void ScriptCmd_stopsound(void)
{
    m4aMPlayStop(&gMPlay_SE1);
    m4aMPlayStop(&gMPlay_SE2);
    sBattleAnimScriptPtr++;
}
