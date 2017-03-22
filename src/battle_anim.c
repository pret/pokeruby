#include "global.h"
#include "asm.h"
#include "decompress.h"
#include "m4a.h"
#include "palette.h"
#include "sound.h"
#include "sprite.h"
#include "task.h"
#include "battle_anim.h"

extern u8 unk_2000000[];
extern u16 gUnknown_02024A6A[4];
extern u8 gUnknown_02024BE0[];
extern u8 gPlayerMonIndex;
extern u8 gEnemyMonIndex;
EWRAM_DATA const u8 *gBattleAnimScriptPtr = NULL;
EWRAM_DATA const u8 *gBattleAnimScriptRetAddr = NULL;
EWRAM_DATA void (*gUnknown_0202F7AC)(void) = NULL;
EWRAM_DATA s8 gUnknown_0202F7B0 = 0;
EWRAM_DATA u8 gUnknown_0202F7B1 = 0;
EWRAM_DATA u8 gUnknown_0202F7B2 = 0;
EWRAM_DATA u8 gUnknown_0202F7B3 = 0;
EWRAM_DATA u32 gUnknown_0202F7B4 = 0;
EWRAM_DATA u32 gUnknown_0202F7B8 = 0;
EWRAM_DATA u16 gUnknown_0202F7BC = 0;
EWRAM_DATA u8 gUnknown_0202F7BE = 0;
EWRAM_DATA u16 gUnknown_0202F7C0 = 0;
EWRAM_DATA u8 gUnknown_0202F7C2[2] = {0};
EWRAM_DATA u8 gUnknown_0202F7C4 = 0;
EWRAM_DATA u8 gUnknown_0202F7C5 = 0;
EWRAM_DATA u16 gUnknown_0202F7C6 = 0;
EWRAM_DATA u8 gUnknown_0202F7C8 = 0;
EWRAM_DATA u8 gUnknown_0202F7C9 = 0;
EWRAM_DATA u16 gUnknown_0202F7CA[4] = {0};
EWRAM_DATA u8 gUnknown_0202F7D2 = 0;
extern u16 gUnknown_030041B4;
extern u16 gUnknown_03004200;
extern u16 gUnknown_03004240;
extern u16 gUnknown_03004244;
extern u16 gUnknown_03004280;
extern u16 gUnknown_03004288;
extern u16 gUnknown_030042C0;
extern u16 gUnknown_030042C4;
extern u16 gUnknown_03004AF0;
extern u16 gUnknown_03004B10[8];
extern s16 gBattleAnimArgs[8];
extern struct MusicPlayerInfo gMPlay_BGM;
extern struct MusicPlayerInfo gMPlay_SE1;
extern struct MusicPlayerInfo gMPlay_SE2;

extern const u16 gUnknown_081C7160[];
extern const u8 *const gBattleAnims_Moves[];
extern const struct SpriteSheet gBattleAnimPicTable[];
extern const struct SpritePalette gBattleAnimPaletteTable[];
extern const struct BattleAnimBackground gBattleAnimBackgroundTable[];

extern void sub_8079E24();
extern void sub_8043EB4();
extern u8 sub_8079E90();
extern u8 sub_8077ABC();
extern u8 sub_8078874(u8);
extern void sub_8078914();
extern u8 sub_80AEB1C();
extern void sub_80E4EF8(int, int, int, int, u16, u8, int);
extern void sub_800D238();
extern u8 sub_80789BC();
extern void sub_80AB2AC(void);
extern void sub_800D7B8(void);
extern u8 obj_id_for_side_relative_to_move();
extern u8 battle_get_per_side_status_permutated();

static void sub_80759D0(void);
static void ScriptCmd_loadsprite(void);
static void ScriptCmd_unloadsprite(void);
static void ScriptCmd_sprite(void);
static void ScriptCmd_createtask(void);
static void ScriptCmd_delay(void);
static void ScriptCmd_wait(void);
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
static void ScriptCmd_setvar(void);
static void ScriptCmd_ifelse(void);
static void ScriptCmd_jumpif(void);
static void ScriptCmd_jump(void);
static void ScriptCmd_fadetobg(void);
static void ScriptCmd_fadetobg_25(void);
static void task_p5_load_battle_screen_elements(u8);
static void sub_8076DB8(u16);
static void dp01t_11_3_message_for_player_only(void);
static void ScriptCmd_restorebg(void);
static void ScriptCmd_waitbgfadeout(void);
static void ScriptCmd_waitbgfadein(void);
static void ScriptCmd_changebg(void);
static void ScriptCmd_panse_19(void);
static void ScriptCmd_setpan(void);
static void ScriptCmd_panse_1B(void);
static void c3_08073CEC(u8);
static void ScriptCmd_panse_26(void);
static void ScriptCmd_panse_27(void);
static void ScriptCmd_panse_1C(void);
static void sub_80774FC(u8);
static void ScriptCmd_panse_1D(void);
static void sub_80775CC(u8);
static void ScriptCmd_createtask_1F(void);
static void ScriptCmd_waitsound(void);
static void ScriptCmd_jumpvareq(void);
static void ScriptCmd_jumpunkcond(void);
static void ScriptCmd_monbgprio_28(void);
static void ScriptCmd_monbgprio_29(void);
static void ScriptCmd_monbgprio_2A(void);
static void ScriptCmd_invisible(void);
static void ScriptCmd_visible(void);
static void ScriptCmd_doublebattle_2D(void);
static void ScriptCmd_doublebattle_2E(void);
static void ScriptCmd_stopsound(void);

static void (*const sScriptCmdTable[])(void) = {
    ScriptCmd_loadsprite,
    ScriptCmd_unloadsprite,
    ScriptCmd_sprite,
    ScriptCmd_createtask,
    ScriptCmd_delay,
    ScriptCmd_wait,
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
    ScriptCmd_setvar,
    ScriptCmd_ifelse,
    ScriptCmd_jumpif,
    ScriptCmd_jump,
    ScriptCmd_fadetobg,
    ScriptCmd_restorebg,
    ScriptCmd_waitbgfadeout,
    ScriptCmd_waitbgfadein,
    ScriptCmd_changebg,
    ScriptCmd_panse_19,
    ScriptCmd_setpan,
    ScriptCmd_panse_1B,
    ScriptCmd_panse_1C,
    ScriptCmd_panse_1D,
    ScriptCmd_setbldcnt,
    ScriptCmd_createtask_1F,
    ScriptCmd_waitsound,
    ScriptCmd_jumpvareq,
    ScriptCmd_monbg_22,
    ScriptCmd_clearmonbg_23,
    ScriptCmd_jumpunkcond,
    ScriptCmd_fadetobg_25,
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

void battle_anim_clear_some_data(void)
{
    s32 i;

    gUnknown_0202F7B0 = 0;
    gUnknown_0202F7B1 = 0;
    gUnknown_0202F7B2 = 0;
    gUnknown_0202F7B3 = 0;
    gUnknown_0202F7B4 = 0;
    gUnknown_0202F7B8 = 0;
    gUnknown_0202F7BC = 0;
    gUnknown_0202F7BE = 0;
    for (i = 0; i < 8; i++)
        gUnknown_03004B10[i] |= 0xFFFF;
    for (i = 0; i < 8; i++)
        gBattleAnimArgs[i] = 0;
    gUnknown_0202F7C2[0] = 0xFF;
    gUnknown_0202F7C2[1] = -1;
    gUnknown_0202F7C4 = 0;
    gUnknown_0202F7C5 = 0;
    gUnknown_0202F7C6 = 0;
    gUnknown_0202F7C8 = 0;
    gUnknown_0202F7C9 = 0;
    gUnknown_0202F7D2 = 0;
}

void move_anim_start_t1(u16 a)
{
    gUnknown_0202F7C8 = gPlayerMonIndex;
    gUnknown_0202F7C9 = gEnemyMonIndex;
    move_something(gBattleAnims_Moves, a, 1);
}

void move_something(const u8 *const moveAnims[], u16 b, u8 c)
{
    s32 i;

    if (sub_8076BE0() == 0)
    {
        sub_8079E24();
        sub_8043EB4(0);
        for (i = 0; i < 4; i++)
        {
            if (battle_side_get_owner(i) != 0)
                gUnknown_0202F7CA[i] = GetMonData(&gEnemyParty[gUnknown_02024A6A[i]], 11);
            else
                gUnknown_0202F7CA[i] = GetMonData(&gPlayerParty[gUnknown_02024A6A[i]], 11);
        }
    }
    else
    {
        for (i = 0; i < 4; i++)
            gUnknown_0202F7CA[i] = EWRAM_19348;
    }
    if (c == 0)
        gUnknown_0202F7C6 = 0;
    else
        gUnknown_0202F7C6 = b;
    for (i = 0; i < 8; i++)
        gBattleAnimArgs[i] = 0;
    gUnknown_0202F7C2[0] = 0xFF;
    gUnknown_0202F7C2[1] = -1;
    gBattleAnimScriptPtr = moveAnims[b];
    gUnknown_0202F7B1 = 1;
    gUnknown_0202F7B0 = 0;
    gUnknown_0202F7AC = sub_80759D0;
    for (i = 0; i < 8; i++)
        gUnknown_03004B10[i] |= 0xFFFF;
    if (c != 0)
    {
        for (i = 0; gUnknown_081C7160[i] != 0xFFFF; i++)
        {
            if (b == gUnknown_081C7160[i])
            {
                m4aMPlayVolumeControl(&gMPlay_BGM, 0xFFFF, 128);
                break;
            }
        }
    }
    gUnknown_030042C4 = 0;
    gUnknown_03004240 = 0;
    gUnknown_03004200 = 0;
    gUnknown_03004244 = 0;
}

void move_anim_8072740(struct Sprite *sprite)
{
    FreeSpriteOamMatrix(sprite);
    DestroySprite(sprite);
    gUnknown_0202F7B2--;
}

void move_anim_task_del(u8 taskId)
{
    DestroyTask(taskId);
    gUnknown_0202F7B2--;
}

void move_anim_related_task_del(u8 taskId)
{
    DestroyTask(taskId);
    gUnknown_0202F7B3--;
}

static void sub_8075940(u16 a)
{
    s32 i;

    for (i = 0; i < 8; i++)
    {
        if (gUnknown_03004B10[i] == 0xFFFF)
        {
            gUnknown_03004B10[i] = a;
            return;
        }
    }
}

static void sub_8075970(u16 a)
{
    s32 i;

    for (i = 0; i < 8; i++)
    {
        if (gUnknown_03004B10[i] == a)
        {
            gUnknown_03004B10[i] |= 0xFFFF;
            return;
        }
    }
}

static void move_anim_waiter(void)
{
    if (gUnknown_0202F7B0 <= 0)
    {
        gUnknown_0202F7AC = sub_80759D0;
        gUnknown_0202F7B0 = 0;
    }
    else
    {
        gUnknown_0202F7B0--;
    }
}

static void sub_80759D0(void)
{
    do
    {
        sScriptCmdTable[SCRIPT_READ_8(gBattleAnimScriptPtr)]();
    } while (gUnknown_0202F7B0 == 0 && gUnknown_0202F7B1 != 0);
}

static void ScriptCmd_loadsprite(void)
{
    u16 r4;

    gBattleAnimScriptPtr++;
    r4 = SCRIPT_READ_16(gBattleAnimScriptPtr);
    LoadCompressedObjectPic(&gBattleAnimPicTable[r4 - 10000]);
    LoadCompressedObjectPalette(&gBattleAnimPaletteTable[r4 - 10000]);
    gBattleAnimScriptPtr += 2;
    sub_8075940(r4 - 10000);
    gUnknown_0202F7B0 = 1;
    gUnknown_0202F7AC = move_anim_waiter;
}

static void ScriptCmd_unloadsprite(void)
{
    u16 r4;

    gBattleAnimScriptPtr++;
    r4 = SCRIPT_READ_16(gBattleAnimScriptPtr);
    FreeSpriteTilesByTag(gBattleAnimPicTable[r4 - 10000].tag);
    FreeSpritePaletteByTag(gBattleAnimPicTable[r4 - 10000].tag);
    gBattleAnimScriptPtr += 2;
    sub_8075970(r4 - 10000);
}

#ifdef NONMATCHING
static void ScriptCmd_sprite(void)
{
    s32 i;
    struct SpriteTemplate *r7;
    u8 r4;
    u8 r0;
    u8 _r0;
    u16 r6;
    u8 r2;
    s8 r1;

    gBattleAnimScriptPtr++;
    r7 = (struct SpriteTemplate *)(SCRIPT_READ_32(gBattleAnimScriptPtr));
    gBattleAnimScriptPtr += 4;
    r4 = SCRIPT_READ_8(gBattleAnimScriptPtr);
    gBattleAnimScriptPtr++;
    r0 = SCRIPT_READ_8(gBattleAnimScriptPtr);
    gBattleAnimScriptPtr++;
    for (i = 0; i < r0; i++)
    {
        gBattleAnimArgs[i] = SCRIPT_READ_16(gBattleAnimScriptPtr);
        gBattleAnimScriptPtr += 2;
    }
    if (r4 & 0x80)
    {
        r4 ^= 0x80;
        if (r4 > 0x3F)
            r4 -= 0x40;
        else
            r4 = -r4;
        _r0 = sub_8079E90(gUnknown_0202F7C9);
        r1 = r4;

    }
    else
    {
        //_08075B44
        if (r4 > 0x3F)
            r4 -= 0x40;
        else
            r4 = -r4;
        _r0 = sub_8079E90(gUnknown_0202F7C8);
        r1 = r4;
    }
    r6 = _r0 + r1;
    if ((s16)r6 < 3)
        r6 = 3;

    r4 = sub_8077ABC(gUnknown_0202F7C9, 2);
    r2 = sub_8077ABC(gUnknown_0202F7C9, 3);
    CreateSpriteAndAnimate(r7, r4, r2, r6);
    gUnknown_0202F7B2++;
}
#else
__attribute__((naked))
static void ScriptCmd_sprite(void)
{
    asm(".syntax unified\n\
    push {r4-r7,lr}\n\
    ldr r5, _08075B2C @ =gBattleAnimScriptPtr\n\
    ldr r1, [r5]\n\
    adds r3, r1, 0x1\n\
    str r3, [r5]\n\
    ldrb r2, [r1, 0x1]\n\
    ldrb r0, [r3, 0x1]\n\
    lsls r0, 8\n\
    adds r2, r0\n\
    ldrb r0, [r3, 0x2]\n\
    lsls r0, 16\n\
    adds r2, r0\n\
    ldrb r0, [r3, 0x3]\n\
    lsls r0, 24\n\
    adds r7, r2, r0\n\
    adds r0, r1, 0x5\n\
    str r0, [r5]\n\
    ldrb r4, [r1, 0x5]\n\
    adds r0, r1, 0x6\n\
    str r0, [r5]\n\
    ldrb r0, [r1, 0x6]\n\
    adds r1, 0x7\n\
    str r1, [r5]\n\
    cmp r0, 0\n\
    beq _08075B14\n\
    adds r6, r5, 0\n\
    ldr r5, _08075B30 @ =gBattleAnimArgs\n\
    adds r3, r0, 0\n\
_08075AFC:\n\
    ldr r2, [r6]\n\
    ldrb r1, [r2]\n\
    ldrb r0, [r2, 0x1]\n\
    lsls r0, 8\n\
    orrs r1, r0\n\
    strh r1, [r5]\n\
    adds r2, 0x2\n\
    str r2, [r6]\n\
    adds r5, 0x2\n\
    subs r3, 0x1\n\
    cmp r3, 0\n\
    bne _08075AFC\n\
_08075B14:\n\
    movs r0, 0x80\n\
    ands r0, r4\n\
    cmp r0, 0\n\
    beq _08075B44\n\
    movs r0, 0x80\n\
    eors r4, r0\n\
    cmp r4, 0x3F\n\
    bls _08075B34\n\
    adds r0, r4, 0\n\
    subs r0, 0x40\n\
    b _08075B36\n\
    .align 2, 0\n\
_08075B2C: .4byte gBattleAnimScriptPtr\n\
_08075B30: .4byte gBattleAnimArgs\n\
_08075B34:\n\
    negs r0, r4\n\
_08075B36:\n\
    lsls r0, 24\n\
    lsrs r4, r0, 24\n\
    ldr r0, _08075B40 @ =gUnknown_0202F7C9\n\
    b _08075B56\n\
    .align 2, 0\n\
_08075B40: .4byte gUnknown_0202F7C9\n\
_08075B44:\n\
    cmp r4, 0x3F\n\
    bls _08075B4E\n\
    adds r0, r4, 0\n\
    subs r0, 0x40\n\
    b _08075B50\n\
_08075B4E:\n\
    negs r0, r4\n\
_08075B50:\n\
    lsls r0, 24\n\
    lsrs r4, r0, 24\n\
    ldr r0, _08075BAC @ =gUnknown_0202F7C8\n\
_08075B56:\n\
    ldrb r0, [r0]\n\
    bl sub_8079E90\n\
    lsls r0, 24\n\
    lsrs r0, 24\n\
    lsls r1, r4, 24\n\
    asrs r1, 24\n\
    adds r0, r1\n\
    lsls r0, 16\n\
    lsrs r6, r0, 16\n\
    lsls r0, r6, 16\n\
    asrs r0, 16\n\
    cmp r0, 0x2\n\
    bgt _08075B74\n\
    movs r6, 0x3\n\
_08075B74:\n\
    ldr r5, _08075BB0 @ =gUnknown_0202F7C9\n\
    ldrb r0, [r5]\n\
    movs r1, 0x2\n\
    bl sub_8077ABC\n\
    adds r4, r0, 0\n\
    lsls r4, 24\n\
    lsrs r4, 24\n\
    ldrb r0, [r5]\n\
    movs r1, 0x3\n\
    bl sub_8077ABC\n\
    adds r2, r0, 0\n\
    lsls r2, 24\n\
    lsrs r2, 24\n\
    lsls r3, r6, 24\n\
    lsrs r3, 24\n\
    adds r0, r7, 0\n\
    adds r1, r4, 0\n\
    bl CreateSpriteAndAnimate\n\
    ldr r1, _08075BB4 @ =gUnknown_0202F7B2\n\
    ldrb r0, [r1]\n\
    adds r0, 0x1\n\
    strb r0, [r1]\n\
    pop {r4-r7}\n\
    pop {r0}\n\
    bx r0\n\
    .align 2, 0\n\
_08075BAC: .4byte gUnknown_0202F7C8\n\
_08075BB0: .4byte gUnknown_0202F7C9\n\
_08075BB4: .4byte gUnknown_0202F7B2\n\
    .syntax divided\n");
}
#endif

static void ScriptCmd_createtask(void)
{
    TaskFunc taskFunc;
    u8 taskPriority;
    u8 taskId;
    u8 numArgs;
    s32 i;

    gBattleAnimScriptPtr++;
    taskFunc = (TaskFunc)SCRIPT_READ_32(gBattleAnimScriptPtr);
    gBattleAnimScriptPtr += 4;
    taskPriority = SCRIPT_READ_8(gBattleAnimScriptPtr);
    gBattleAnimScriptPtr++;
    numArgs = SCRIPT_READ_8(gBattleAnimScriptPtr);
    gBattleAnimScriptPtr++;
    for (i = 0; i < numArgs; i++)
    {
        gBattleAnimArgs[i] = SCRIPT_READ_16(gBattleAnimScriptPtr);
        gBattleAnimScriptPtr += 2;
    }
    taskId = CreateTask(taskFunc, taskPriority);
    taskFunc(taskId);
    gUnknown_0202F7B2++;
}

static void ScriptCmd_delay(void)
{
    gBattleAnimScriptPtr++;
    gUnknown_0202F7B0 = SCRIPT_READ_8(gBattleAnimScriptPtr);
    if (gUnknown_0202F7B0 == 0)
        gUnknown_0202F7B0 = -1;
    gBattleAnimScriptPtr++;
    gUnknown_0202F7AC = move_anim_waiter;
}

static void ScriptCmd_wait(void)
{
    if (gUnknown_0202F7B2 == 0)
    {
        gBattleAnimScriptPtr++;
        gUnknown_0202F7B0 = 0;
    }
    else
    {
        gUnknown_0202F7B0 = 1;
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
    int zero = 0;

    if (gUnknown_0202F7B2 != 0 || gUnknown_0202F7B3 != 0
     || gUnknown_0202F7C2[0] != 0xFF || gUnknown_0202F7C2[1] != 0xFF)
    {
        gUnknown_03004AF0 = 0;
        gUnknown_0202F7B0 = 1;
        return;
    }

    if (IsSEPlaying())
    {
        gUnknown_03004AF0++;
        if (gUnknown_03004AF0 <= 0x5A)
        {
            gUnknown_0202F7B0 = 1;
            return;
        }
        else
        {
            m4aMPlayStop(&gMPlay_SE1);
            m4aMPlayStop(&gMPlay_SE2);
        }
    }
    gUnknown_03004AF0 = 0;
    for (i = 0; i < 8; i++)
    {
        if (gUnknown_03004B10[i] != 0xFFFF)
        {
            FreeSpriteTilesByTag(gBattleAnimPicTable[gUnknown_03004B10[i]].tag);
            FreeSpritePaletteByTag(gBattleAnimPicTable[gUnknown_03004B10[i]].tag);
            gUnknown_03004B10[i] |= 0xFFFF;
        }
    }
    if (zero == 0)
    {
        m4aMPlayVolumeControl(&gMPlay_BGM, 0xFFFF, 256);
        if (sub_8076BE0() == 0)
        {
            sub_8079E24();
            sub_8043EB4(1);
        }
        gUnknown_0202F7B1 = 0;
    }
}

static void ScriptCmd_playse(void)
{
    gBattleAnimScriptPtr++;
    PlaySE(SCRIPT_READ_16(gBattleAnimScriptPtr));
    gBattleAnimScriptPtr += 2;
}

static void ScriptCmd_monbg(void)
{
    u8 r6;
    u8 r5;
    u8 r0;
    u8 r7;
    u16 r4;
    u8 taskId;

    gBattleAnimScriptPtr++;
    r6 = SCRIPT_READ_8(gBattleAnimScriptPtr);
    if (r6 == 0)
        r6 = 2;
    else if (r6 == 1)
        r6 = 3;
    if (r6 == 0 || r6 == 2)
        r5 = gUnknown_0202F7C8;
    else
        r5 = gUnknown_0202F7C9;
    if (b_side_obj__get_some_boolean(r5))
    {
        r0 = battle_get_per_side_status(r5);
        r0 += 0xFF;
        if (r0 <= 1 || sub_8076BE0() != 0)
            r7 = 0;
        else
            r7 = 1;
        sub_8076034(r5, r7);
        r4 = gUnknown_02024BE0[r5];
        taskId = CreateTask(task_pA_ma0A_obj_to_bg_pal, 10);
        gTasks[taskId].data[0] = r4;
        gTasks[taskId].data[1] = gSprites[r4].pos1.x + gSprites[r4].pos2.x;
        gTasks[taskId].data[2] = gSprites[r4].pos1.y + gSprites[r4].pos2.y;
        if (r7 == 0)
        {
            gTasks[taskId].data[3] = gUnknown_030042C0;
            gTasks[taskId].data[4] = gUnknown_030041B4;
        }
        else
        {
            gTasks[taskId].data[3] = gUnknown_03004288;
            gTasks[taskId].data[4] = gUnknown_03004280;
        }
        gTasks[taskId].data[5] = r7;
        gTasks[taskId].data[6] = r5;
        gUnknown_0202F7C2[0] = taskId;

    }
    r5 ^= 2;
    if (r6 > 1 && b_side_obj__get_some_boolean(r5))
    {
        r0 = battle_get_per_side_status(r5);
        r0 += 0xFF;
        if (r0 <= 1 || sub_8076BE0() != 0)
            r7 = 0;
        else
            r7 = 1;
        sub_8076034(r5, r7);
        r4 = gUnknown_02024BE0[r5];
        taskId = CreateTask(task_pA_ma0A_obj_to_bg_pal, 10);
        gTasks[taskId].data[0] = r4;
        gTasks[taskId].data[1] = gSprites[r4].pos1.x + gSprites[r4].pos2.x;
        gTasks[taskId].data[2] = gSprites[r4].pos1.y + gSprites[r4].pos2.y;
        if (r7 == 0)
        {
            gTasks[taskId].data[3] = gUnknown_030042C0;
            gTasks[taskId].data[4] = gUnknown_030041B4;
        }
        else
        {
            gTasks[taskId].data[3] = gUnknown_03004288;
            gTasks[taskId].data[4] = gUnknown_03004280;
        }
        gTasks[taskId].data[5] = r7;
        gTasks[taskId].data[6] = r5;
        gUnknown_0202F7C2[1] = taskId;
    }
    gBattleAnimScriptPtr++;
}

#ifdef NONMATCHING
bool8 b_side_obj__get_some_boolean(u8 a)
{
    if (sub_8076BE0() != 0)
    {
        if (a == gUnknown_0202F7C8)
            return TRUE;
        else
            return FALSE;
    }
    if (sub_8078874(a) == 0)
        return FALSE;
    if (sub_8076BE0() != 0)
        return TRUE;
    if ((EWRAM_17800[a].unk0 & 1) == 0)
        return TRUE;
    if (gSprites[gUnknown_02024BE0[a]].invisible)
        return FALSE;
    return TRUE;
}
#else
__attribute__((naked))
bool8 b_side_obj__get_some_boolean(u8 a)
{
    asm(".syntax unified\n\
    push {r4,r5,lr}\n\
    lsls r0, 24\n\
    lsrs r4, r0, 24\n\
    adds r5, r4, 0\n\
    bl sub_8076BE0\n\
    lsls r0, 24\n\
    cmp r0, 0\n\
    beq _08075FDC\n\
    ldr r0, _08075FD8 @ =gUnknown_0202F7C8\n\
    ldrb r0, [r0]\n\
    cmp r4, r0\n\
    beq _0807601C\n\
    b _0807602C\n\
    .align 2, 0\n\
_08075FD8: .4byte gUnknown_0202F7C8\n\
_08075FDC:\n\
    adds r0, r4, 0\n\
    bl sub_8078874\n\
    lsls r0, 24\n\
    cmp r0, 0\n\
    beq _0807602C\n\
    bl sub_8076BE0\n\
    lsls r0, 24\n\
    cmp r0, 0\n\
    bne _0807601C\n\
    lsls r0, r5, 2\n\
    ldr r1, _08076020 @ =0x02017800\n\
    adds r0, r1\n\
    ldrb r1, [r0]\n\
    movs r0, 0x1\n\
    ands r0, r1\n\
    cmp r0, 0\n\
    beq _0807601C\n\
    ldr r2, _08076024 @ =gSprites\n\
    ldr r0, _08076028 @ =gUnknown_02024BE0\n\
    adds r0, r5, r0\n\
    ldrb r1, [r0]\n\
    lsls r0, r1, 4\n\
    adds r0, r1\n\
    lsls r0, 2\n\
    adds r0, r2\n\
    adds r0, 0x3E\n\
    ldrb r0, [r0]\n\
    lsls r0, 29\n\
    cmp r0, 0\n\
    blt _0807602C\n\
_0807601C:\n\
    movs r0, 0x1\n\
    b _0807602E\n\
    .align 2, 0\n\
_08076020: .4byte 0x02017800\n\
_08076024: .4byte gSprites\n\
_08076028: .4byte gUnknown_02024BE0\n\
_0807602C:\n\
    movs r0, 0\n\
_0807602E:\n\
    pop {r4,r5}\n\
    pop {r1}\n\
    bx r1\n\
    .syntax divided\n");
}
#endif

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

        spriteId = gUnknown_02024BE0[a];
        gUnknown_030042C0 = -(gSprites[spriteId].pos1.x + gSprites[spriteId].pos2.x) + 32;
        if (sub_8076BE0() != 0 && sub_80AEB1C(EWRAM_19348) != 0)
            gUnknown_030042C0--;
        gUnknown_030041B4 = -(gSprites[spriteId].pos1.y + gSprites[spriteId].pos2.y) + 32;
        gSprites[gUnknown_02024BE0[a]].invisible = TRUE;

        REG_BG1HOFS = gUnknown_030042C0;
        REG_BG1VOFS = gUnknown_030041B4;

        LoadPalette(gPlttBufferUnfaded + 0x100 + a * 16, s.unk8 * 16, 32);
        addr3 = (u16 *)PLTT + s.unk8 * 16;
        DmaCopy32(3, gPlttBufferUnfaded + 0x100 + a * 16, addr3, 32);

        if (sub_8076BE0() != 0)
            r2 = 0;
        else
            r2 = battle_get_per_side_status(a);
        sub_80E4EF8(0, 0, r2, s.unk8, (u32)s.unk0, (((s32)s.unk4 - VRAM) / 2048), REG_BG1CNT_BITFIELD.charBaseBlock);
        if (sub_8076BE0() != 0)
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

        spriteId = gUnknown_02024BE0[a];
        gUnknown_03004288 = -(gSprites[spriteId].pos1.x + gSprites[spriteId].pos2.x) + 32;
        gUnknown_03004280 = -(gSprites[spriteId].pos1.y + gSprites[spriteId].pos2.y) + 32;
        gSprites[gUnknown_02024BE0[a]].invisible = TRUE;

        REG_BG2HOFS = gUnknown_03004288;
        REG_BG2VOFS = gUnknown_03004280;

        LoadPalette(gPlttBufferUnfaded + 0x100 + a * 16, 0x90, 32);
        addr3 = (void *)(PLTT + 0x120);
        DmaCopy32(3, gPlttBufferUnfaded + 0x100 + a * 16, addr3, 32);

        sub_80E4EF8(0, 0, battle_get_per_side_status(a), 9, 0x6000, 0x1E, REG_BG2CNT_BITFIELD.charBaseBlock);
    }
}

static void sub_8076380(void)
{
    int i;
    int j;
    struct UnknownStruct2 s;
    u16 *ptr;

    if (sub_80AEB1C(EWRAM_19348) != 0)
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
    if (a == 0 || sub_8076BE0() != 0)
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
        gUnknown_030042C0 = 0;
        gUnknown_030041B4 = 0;
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
        gUnknown_03004288 = 0;
        gUnknown_03004280 = 0;
    }
}

static void task_pA_ma0A_obj_to_bg_pal(u8 taskId)
{
    u8 r4;
    u8 r6;
    s16 r3;
    s16 r2;
    struct UnknownStruct2 s;

    r4 = gTasks[taskId].data[0];
    r6 = gTasks[taskId].data[6];
    sub_8078914(&s);
    r3 = gTasks[taskId].data[1] - (gSprites[r4].pos1.x + gSprites[r4].pos2.x);
    r2 = gTasks[taskId].data[2] - (gSprites[r4].pos1.y + gSprites[r4].pos2.y);
    if (gTasks[taskId].data[5] == 0)
    {
        u16 *src;
        u16 *dst;

        gUnknown_030042C0 = r3 + gTasks[taskId].data[3];
        gUnknown_030041B4 = r2 + gTasks[taskId].data[4];
        src = gPlttBufferFaded + 0x100 + r6 * 16;
        dst = gPlttBufferFaded + 0x100 + s.unk8 * 16 - 256;
        DmaCopy32(3, src, dst, 32);
    }
    else
    {
        u16 *src;
        u16 *dst;

        gUnknown_03004288 = r3 + gTasks[taskId].data[3];
        gUnknown_03004280 = r2 + gTasks[taskId].data[4];
        src = gPlttBufferFaded + 0x100 + r6 * 16;
        dst = gPlttBufferFaded + 0x100 - 112;
        DmaCopy32(3, src, dst, 32);
    }
}

static void ScriptCmd_clearmonbg(void)
{
    u8 r4;
    u8 r5;
    u8 taskId;

    gBattleAnimScriptPtr++;
    r4 = SCRIPT_READ_8(gBattleAnimScriptPtr);
    if (r4 == 0)
        r4 = 2;
    else if (r4 == 1)
        r4 = 3;
    if (r4 == 0 || r4 == 2)
        r5 = gUnknown_0202F7C8;
    else
        r5 = gUnknown_0202F7C9;
    if (gUnknown_0202F7C2[0] != 0xFF)
        gSprites[gUnknown_02024BE0[r5]].invisible = FALSE;
    if (r4 > 1 && gUnknown_0202F7C2[1] != 0xFF)
        gSprites[gUnknown_02024BE0[r5 ^ 2]].invisible = FALSE;
    else
        r4 = 0;
    taskId = CreateTask(sub_807672C, 5);
    gTasks[taskId].data[0] = r4;
    gTasks[taskId].data[2] = r5;
    gBattleAnimScriptPtr++;
}

static void sub_807672C(u8 taskId)
{
    u8 var;
    u8 r4;

    gTasks[taskId].data[1]++;
    if (gTasks[taskId].data[1] != 1)
    {
        var = battle_get_per_side_status(gTasks[taskId].data[2]);
        var += 0xFF;
        if (var <= 1 || sub_8076BE0() != 0)
            r4 = 0;
        else
            r4 = 1;
        if (gUnknown_0202F7C2[0] != 0xFF)
        {
            sub_8076464(r4);
            DestroyTask(gUnknown_0202F7C2[0]);
            gUnknown_0202F7C2[0] = 0xFF;
        }
        if (gTasks[taskId].data[0] > 1)
        {
            sub_8076464(r4 ^ 1);
            DestroyTask(gUnknown_0202F7C2[1]);
            gUnknown_0202F7C2[1] = 0xFF;
        }
        DestroyTask(taskId);
    }
}

static void ScriptCmd_monbg_22(void)
{
    u8 r5;
    u8 r4;
    u8 r0;
    u8 r1;

    gBattleAnimScriptPtr++;
    r5 = SCRIPT_READ_8(gBattleAnimScriptPtr);
    if (r5 == 0)
        r5 = 2;
    else if (r5 == 1)
        r5 = 3;
    if (r5 == 0 || r5 == 2)
        r4 = gUnknown_0202F7C8;
    else
        r4 = gUnknown_0202F7C9;
    if (b_side_obj__get_some_boolean(r4))
    {
        r0 = battle_get_per_side_status(r4);
        r0 += 0xFF;
        if (r0 <= 1 || sub_8076BE0() != 0)
            r1 = 0;
        else
            r1 = 1;
        sub_8076034(r4, r1);
        gSprites[gUnknown_02024BE0[r4]].invisible = FALSE;
    }
    r4 ^= 2;
    if (r5 > 1 && b_side_obj__get_some_boolean(r4))
    {
        r0 = battle_get_per_side_status(r4);
        r0 += 0xFF;
        if (r0 <= 1 || sub_8076BE0() != 0)
            r1 = 0;
        else
            r1 = 1;
        sub_8076034(r4, r1);
        gSprites[gUnknown_02024BE0[r4]].invisible = FALSE;
    }
    gBattleAnimScriptPtr++;
}

static void ScriptCmd_clearmonbg_23(void)
{
    u8 r5;
    u8 r6;
    u8 taskId;

    gBattleAnimScriptPtr++;
    r5 = SCRIPT_READ_8(gBattleAnimScriptPtr);
    if (r5 == 0)
        r5 = 2;
    else if (r5 == 1)
        r5 = 3;
    if (r5 == 0 || r5 == 2)
        r6 = gUnknown_0202F7C8;
    else
        r6 = gUnknown_0202F7C9;
    if (b_side_obj__get_some_boolean(r6))
        gSprites[gUnknown_02024BE0[r6]].invisible = FALSE;
    if (r5 > 1 && b_side_obj__get_some_boolean(r6 ^ 2))
        gSprites[gUnknown_02024BE0[r6 ^ 2]].invisible = FALSE;
    else
        r5 = 0;
    taskId = CreateTask(sub_80769A4, 5);
    gTasks[taskId].data[0] = r5;
    gTasks[taskId].data[2] = r6;
    gBattleAnimScriptPtr++;
}

static void sub_80769A4(u8 taskId)
{
    u8 r0;
    u8 r4;
    u8 r5;

    gTasks[taskId].data[1]++;
    if (gTasks[taskId].data[1] != 1)
    {
        r4 = gTasks[taskId].data[2];
        r0 = battle_get_per_side_status(r4);
        r0 += 0xFF;
        if (r0 <= 1 || sub_8076BE0() != 0)
            r5 = 0;
        else
            r5 = 1;
        if (b_side_obj__get_some_boolean(r4))
            sub_8076464(r5);
        if (gTasks[taskId].data[0] > 1 && b_side_obj__get_some_boolean(r4 ^ 2))
            sub_8076464(r5 ^ 1);
        DestroyTask(taskId);
    }
}

static void ScriptCmd_setalpha(void)
{
    u16 r3;
    u16 r1;

    gBattleAnimScriptPtr++;
    r3 = *(gBattleAnimScriptPtr++);
    r1 = *(gBattleAnimScriptPtr++) << 8;
    REG_BLDCNT = 0x3F40;
    REG_BLDALPHA = r3 | r1;
}

static void ScriptCmd_setbldcnt(void)
{
    u16 r3;
    u16 r1;

    gBattleAnimScriptPtr++;
    r3 = *(gBattleAnimScriptPtr++);
    r1 = *(gBattleAnimScriptPtr++) << 8;
    REG_BLDCNT = r3 | r1;
}

static void ScriptCmd_blendoff(void)
{
    gBattleAnimScriptPtr++;
    REG_BLDCNT = 0;
    REG_BLDALPHA = 0;
}

static void ScriptCmd_call(void)
{
    u32 addr;

    gBattleAnimScriptPtr++;
    gBattleAnimScriptRetAddr = gBattleAnimScriptPtr + 4;
    addr = SCRIPT_READ_32(gBattleAnimScriptPtr);
    gBattleAnimScriptPtr = (u8 *)addr;
}

static void ScriptCmd_return(void)
{
    gBattleAnimScriptPtr = gBattleAnimScriptRetAddr;
}

static void ScriptCmd_setvar(void)
{
    const u8 *addr = gBattleAnimScriptPtr;
    u16 r4;
    u8 r2;

    gBattleAnimScriptPtr++;
    r2 = SCRIPT_READ_8(gBattleAnimScriptPtr);
    gBattleAnimScriptPtr++;
    r4 = SCRIPT_READ_16(gBattleAnimScriptPtr);
    gBattleAnimScriptPtr = addr + 4;
    gBattleAnimArgs[r2] = r4;
}

static void ScriptCmd_ifelse(void)
{
    u32 addr;

    gBattleAnimScriptPtr++;
    if (gUnknown_0202F7C4 & 1)
        gBattleAnimScriptPtr += 4;
    addr = SCRIPT_READ_32(gBattleAnimScriptPtr);
    gBattleAnimScriptPtr = (u8 *)addr;
}

static void ScriptCmd_jumpif(void)
{
    u8 r1;
    u32 addr;

    gBattleAnimScriptPtr++;
    r1 = SCRIPT_READ_8(gBattleAnimScriptPtr);
    gBattleAnimScriptPtr++;
    if (r1 == gUnknown_0202F7C4)
    {
        addr = SCRIPT_READ_32(gBattleAnimScriptPtr);
        gBattleAnimScriptPtr = (u8 *)addr;
    }
    else
    {
        gBattleAnimScriptPtr += 4;
    }
}

static void ScriptCmd_jump(void)
{
    u32 addr;

    gBattleAnimScriptPtr++;
    addr = SCRIPT_READ_32(gBattleAnimScriptPtr);
    gBattleAnimScriptPtr = (u8 *)addr;
}

//IsContest, maybe
bool8 sub_8076BE0(void)
{
    if (!gMain.inBattle)
        return TRUE;
    else
        return FALSE;
}

static void ScriptCmd_fadetobg(void)
{
    u8 r4;
    u8 taskId;

    gBattleAnimScriptPtr++;
    r4 = SCRIPT_READ_8(gBattleAnimScriptPtr);
    gBattleAnimScriptPtr++;
    taskId = CreateTask(task_p5_load_battle_screen_elements, 5);
    gTasks[taskId].data[0] = r4;
    gUnknown_0202F7C5 = 1;
}

static void ScriptCmd_fadetobg_25(void)
{
    u8 r8;
    u8 r7;
    u8 r6;
    u8 taskId;

    gBattleAnimScriptPtr++;
    r8 = gBattleAnimScriptPtr[0];
    r7 = gBattleAnimScriptPtr[1];
    r6 = gBattleAnimScriptPtr[2];
    gBattleAnimScriptPtr += 3;
    taskId = CreateTask(task_p5_load_battle_screen_elements, 5);
    if (sub_8076BE0() != 0)
        gTasks[taskId].data[0] = r6;
    else if (battle_side_get_owner(gUnknown_0202F7C9) == 0)
        gTasks[taskId].data[0] = r7;
    else
        gTasks[taskId].data[0] = r8;
    gUnknown_0202F7C5 = 1;
}

static void task_p5_load_battle_screen_elements(u8 taskId)
{
    if (gTasks[taskId].data[10] == 0)
    {
        BeginHardwarePaletteFade(0xE8, 0, 0, 16, 0);
        gTasks[taskId].data[10]++;
        return;
    }
    if (gPaletteFade.active)
        return;
    if (gTasks[taskId].data[10] == 1)
    {
        gTasks[taskId].data[10]++;
        gUnknown_0202F7C5 = 2;
    }
    else if (gTasks[taskId].data[10] == 2)
    {
        s16 data0 = (u16)gTasks[taskId].data[0];

        if (data0 == -1)
            dp01t_11_3_message_for_player_only();
        else
            sub_8076DB8(data0);
        BeginHardwarePaletteFade(0xE8, 0, 16, 0, 1);
        gTasks[taskId].data[10]++;
        return;
    }
    if (gPaletteFade.active)
        return;
    if (gTasks[taskId].data[10] == 3)
    {
        DestroyTask(taskId);
        gUnknown_0202F7C5 = 0;
    }
}

static void sub_8076DB8(u16 a)
{
    if (sub_8076BE0())
    {
        void *tilemap = gBattleAnimBackgroundTable[a].tilemap;
        void *dmaSrc;
        void *dmaDest;

        sub_800D238(tilemap, sub_8076BE0() ? EWRAM_14800 : EWRAM_18000);
        sub_80763FC(sub_80789BC(), sub_8076BE0() ? EWRAM_14800 : EWRAM_18000, 0x100, 0);
        dmaSrc = sub_8076BE0() ? EWRAM_14800 : EWRAM_18000;
        dmaDest = (void *)(VRAM + 0xD000);
        DmaCopy32(3, dmaSrc, dmaDest, 0x800);
        LZDecompressVram(gBattleAnimBackgroundTable[a].image, (void *)(VRAM + 0x2000));
        LoadCompressedPalette(gBattleAnimBackgroundTable[a].palette, sub_80789BC() * 16, 32);
    }
    else
    {
        LZDecompressVram(gBattleAnimBackgroundTable[a].tilemap, (void *)(VRAM + 0xD000));
        LZDecompressVram(gBattleAnimBackgroundTable[a].image, (void *)(VRAM + 0x8000));
        LoadCompressedPalette(gBattleAnimBackgroundTable[a].palette, 32, 32);
    }
}

static void dp01t_11_3_message_for_player_only(void)
{
    if (sub_8076BE0())
        sub_80AB2AC();
    else
        sub_800D7B8();
}

static void ScriptCmd_restorebg(void)
{
    u8 taskId;

    gBattleAnimScriptPtr++;
    taskId = CreateTask(task_p5_load_battle_screen_elements, 5);
    gTasks[taskId].data[0] = 0xFFFF;
    gUnknown_0202F7C5 = 1;
}

static void ScriptCmd_waitbgfadeout(void)
{
    if (gUnknown_0202F7C5 == 2)
    {
        gBattleAnimScriptPtr++;
        gUnknown_0202F7B0 = 0;
    }
    else
    {
        gUnknown_0202F7B0 = 1;
    }
}

static void ScriptCmd_waitbgfadein(void)
{
    if (gUnknown_0202F7C5 == 0)
    {
        gBattleAnimScriptPtr++;
        gUnknown_0202F7B0 = 0;
    }
    else
    {
        gUnknown_0202F7B0 = 1;
    }
}

static void ScriptCmd_changebg(void)
{
    gBattleAnimScriptPtr++;
    sub_8076DB8(SCRIPT_READ_8(gBattleAnimScriptPtr));
    gBattleAnimScriptPtr++;
}

//Weird control flow
/*
s8 sub_8076F98(s8 a)
{
    if (!sub_8076BE0() && (EWRAM_17810[gUnknown_0202F7C8].unk0 & 0x10))
    {
        a = battle_side_get_owner(gUnknown_0202F7C8) ? 0xC0 : 0x3F;
    }
    //_08076FDC
    else
    {
        if (sub_8076BE0())
        {
            if (gUnknown_0202F7C8 == gUnknown_0202F7C9 && gUnknown_0202F7C8 == 2
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
            if (battle_side_get_owner(gUnknown_0202F7C8) == 0)
            {
                if (battle_side_get_owner(gUnknown_0202F7C9) == 0)
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
s8 sub_8076F98(s8 a)
{
    asm(".syntax unified\n\
    push {r4,lr}\n\
    lsls r0, 24\n\
    lsrs r4, r0, 24\n\
    bl sub_8076BE0\n\
    lsls r0, 24\n\
    cmp r0, 0\n\
    bne _08076FDC\n\
    ldr r0, _08076FD4 @ =gUnknown_0202F7C8\n\
    ldrb r2, [r0]\n\
    lsls r0, r2, 1\n\
    adds r0, r2\n\
    lsls r0, 2\n\
    ldr r1, _08076FD8 @ =0x02017810\n\
    adds r0, r1\n\
    ldrb r1, [r0]\n\
    movs r0, 0x10\n\
    ands r0, r1\n\
    cmp r0, 0\n\
    beq _08076FDC\n\
    adds r0, r2, 0\n\
    bl battle_side_get_owner\n\
    lsls r0, 24\n\
    movs r4, 0xC0\n\
    cmp r0, 0\n\
    beq _0807706E\n\
    movs r4, 0x3F\n\
    b _0807706E\n\
    .align 2, 0\n\
_08076FD4: .4byte gUnknown_0202F7C8\n\
_08076FD8: .4byte 0x02017810\n\
_08076FDC:\n\
    bl sub_8076BE0\n\
    lsls r0, 24\n\
    cmp r0, 0\n\
    beq _08077004\n\
    ldr r0, _08076FFC @ =gUnknown_0202F7C8\n\
    ldr r1, _08077000 @ =gUnknown_0202F7C9\n\
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
_08076FFC: .4byte gUnknown_0202F7C8\n\
_08077000: .4byte gUnknown_0202F7C9\n\
_08077004:\n\
    ldr r0, _0807702C @ =gUnknown_0202F7C8\n\
    ldrb r0, [r0]\n\
    bl battle_side_get_owner\n\
    lsls r0, 24\n\
    cmp r0, 0\n\
    bne _08077042\n\
    ldr r0, _08077030 @ =gUnknown_0202F7C9\n\
    ldrb r0, [r0]\n\
    bl battle_side_get_owner\n\
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
_0807702C: .4byte gUnknown_0202F7C8\n\
_08077030: .4byte gUnknown_0202F7C9\n\
_08077034:\n\
    movs r0, 0x40\n\
    negs r0, r0\n\
    cmp r1, r0\n\
    beq _0807706E\n\
    negs r0, r1\n\
    lsls r0, 24\n\
    b _0807706C\n\
_08077042:\n\
    ldr r0, _08077064 @ =gUnknown_0202F7C9\n\
    ldrb r0, [r0]\n\
    bl battle_side_get_owner\n\
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
_08077064: .4byte gUnknown_0202F7C9\n\
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

s8 sub_8077094(s8 a)
{
    if (!sub_8076BE0() && (EWRAM_17810[gUnknown_0202F7C8].unk0 & 0x10))
    {
        if (battle_side_get_owner(gUnknown_0202F7C8) != 0)
            a = 0x3F;
        else
            a = 0xC0;
    }
    else
    {
        if (battle_side_get_owner(gUnknown_0202F7C8) != 0 || sub_8076BE0() != 0)
            a = -a;
    }
    return a;
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

s16 sub_807712C(s16 a, s16 b, s16 c)
{
    u16 var;

    if (a < b)
        var = ((c < 0) ? -c : c);
    else if (a > b)
        var = -((c < 0) ? -c : c);
    else
        var = 0;
    return var;
}

static void ScriptCmd_panse_19(void)
{
    u16 r4;
    s8 r0;

    gBattleAnimScriptPtr++;
    r4 = SCRIPT_READ_16(gBattleAnimScriptPtr);
    r0 = SCRIPT_READ_8(gBattleAnimScriptPtr + 2);
    PlaySE12WithPanning(r4, sub_8076F98(r0));
    gBattleAnimScriptPtr += 3;
}

static void ScriptCmd_setpan(void)
{
    s8 r0;

    gBattleAnimScriptPtr++;
    r0 = SCRIPT_READ_8(gBattleAnimScriptPtr);
    SE12PanpotControl(sub_8076F98(r0));
    gBattleAnimScriptPtr++;
}

static void ScriptCmd_panse_1B(void)
{
    u16 songNum;
    s8 r0;
    s8 r4;
    s8 r6;
    u8 r7;
    s8 panning;
    s8 r8;
    u8 taskId;

    gBattleAnimScriptPtr++;
    songNum = SCRIPT_READ_16(gBattleAnimScriptPtr);
    r0 = SCRIPT_READ_8(gBattleAnimScriptPtr + 2);
    r4 = SCRIPT_READ_8(gBattleAnimScriptPtr + 3);
    r6 = SCRIPT_READ_8(gBattleAnimScriptPtr + 4);
    r7 = SCRIPT_READ_8(gBattleAnimScriptPtr + 5);
    panning = sub_8076F98(r0);
    r8 = sub_8076F98(r4);
    r4 = sub_807712C(panning, r8, r6);
    taskId = CreateTask(c3_08073CEC, 1);
    gTasks[taskId].data[0] = panning;
    gTasks[taskId].data[1] = r8;
    gTasks[taskId].data[2] = r4;
    gTasks[taskId].data[3] = r7;
    gTasks[taskId].data[4] = panning;
    PlaySE12WithPanning(songNum, panning);
    gUnknown_0202F7B3++;
    gBattleAnimScriptPtr += 6;
}

#ifdef NONMATCHING
static void c3_08073CEC(u8 taskId)
{
    u16 r7 = 0;
    s16 r0;
    s16 r6;
    s16 r3;
    s16 r4;
    int foo;

    r0 = gTasks[taskId].data[8];
    gTasks[taskId].data[8]++;
    if (r0 >= gTasks[taskId].data[3])
    {
        gTasks[taskId].data[8] = r7;
        r6 = gTasks[taskId].data[0];
        r3 = gTasks[taskId].data[1];
        foo = gTasks[taskId].data[4] + gTasks[taskId].data[2];
        r4 = foo;
        gTasks[taskId].data[4] = r4;
        if (gTasks[taskId].data[2] == 0)
        {
            r4 = r3;
            DestroyTask(taskId);
            gUnknown_0202F7B3--;
        }
        //_080772D8
        else
        {
            if (r6 < r3)
            {
                if (r4 < r3)
                    goto check;
                DestroyTask(taskId);
                gUnknown_0202F7B3--;
            }
            else
            {
                if (r4 <= r3)
                    r7 = 1;
              check:
                if (r7 != 0)
                {
                    DestroyTask(taskId);
                    gUnknown_0202F7B3--;
                }
            }
        }
        //_080772F8
        SE12PanpotControl(r4);
    }
    //_08077314
}
#else
__attribute__((naked))
static void c3_08073CEC(u8 taskId)
{
    asm(".syntax unified\n\
    push {r4-r7,lr}\n\
    lsls r0, 24\n\
    lsrs r5, r0, 24\n\
    movs r7, 0\n\
    ldr r1, _080772D4 @ =gTasks\n\
    lsls r0, r5, 2\n\
    adds r0, r5\n\
    lsls r0, 3\n\
    adds r2, r0, r1\n\
    ldrh r0, [r2, 0x18]\n\
    adds r1, r0, 0x1\n\
    strh r1, [r2, 0x18]\n\
    lsls r0, 16\n\
    asrs r0, 16\n\
    movs r3, 0xE\n\
    ldrsh r1, [r2, r3]\n\
    cmp r0, r1\n\
    blt _08077314\n\
    strh r7, [r2, 0x18]\n\
    ldrh r6, [r2, 0x8]\n\
    ldrh r3, [r2, 0xA]\n\
    movs r4, 0x10\n\
    ldrsh r0, [r2, r4]\n\
    movs r4, 0xC\n\
    ldrsh r1, [r2, r4]\n\
    adds r0, r1\n\
    lsls r0, 16\n\
    lsrs r4, r0, 16\n\
    strh r4, [r2, 0x10]\n\
    cmp r1, 0\n\
    bne _080772D8\n\
    lsls r2, r3, 16\n\
    b _080772FC\n\
    .align 2, 0\n\
_080772D4: .4byte gTasks\n\
_080772D8:\n\
    lsls r1, r6, 16\n\
    lsls r0, r3, 16\n\
    asrs r3, r0, 16\n\
    adds r2, r0, 0\n\
    cmp r1, r2\n\
    bge _080772EE\n\
    lsls r0, r4, 16\n\
    asrs r0, 16\n\
    cmp r0, r3\n\
    blt _080772F8\n\
    b _080772FC\n\
_080772EE:\n\
    lsls r0, r4, 16\n\
    asrs r0, 16\n\
    cmp r0, r3\n\
    bgt _080772F8\n\
    movs r7, 0x1\n\
_080772F8:\n\
    cmp r7, 0\n\
    beq _0807730C\n\
_080772FC:\n\
    lsrs r4, r2, 16\n\
    adds r0, r5, 0\n\
    bl DestroyTask\n\
    ldr r1, _0807731C @ =gUnknown_0202F7B3\n\
    ldrb r0, [r1]\n\
    subs r0, 0x1\n\
    strb r0, [r1]\n\
_0807730C:\n\
    lsls r0, r4, 24\n\
    asrs r0, 24\n\
    bl SE12PanpotControl\n\
_08077314:\n\
    pop {r4-r7}\n\
    pop {r0}\n\
    bx r0\n\
    .align 2, 0\n\
_0807731C: .4byte gUnknown_0202F7B3\n\
    .syntax divided\n");
}
#endif

static void ScriptCmd_panse_26(void)
{
    u16 r8;
    s8 r4;
    s8 r5;
    s8 r6;
    u8 r10;
    u8 taskId;

    gBattleAnimScriptPtr++;
    r8 = SCRIPT_READ_16(gBattleAnimScriptPtr);
    r4 = SCRIPT_READ_8(gBattleAnimScriptPtr + 2);
    r5 = SCRIPT_READ_8(gBattleAnimScriptPtr + 3);
    r6 = SCRIPT_READ_8(gBattleAnimScriptPtr + 4);
    r10 = SCRIPT_READ_8(gBattleAnimScriptPtr + 5);
    taskId = CreateTask(c3_08073CEC, 1);
    gTasks[taskId].data[0] = r4;
    gTasks[taskId].data[1] = r5;
    gTasks[taskId].data[2] = r6;
    gTasks[taskId].data[3] = r10;
    gTasks[taskId].data[4] = r4;
    PlaySE12WithPanning(r8, r4);
    gUnknown_0202F7B3++;
    gBattleAnimScriptPtr += 6;
}

static void ScriptCmd_panse_27(void)
{
    u16 r9;
    u8 r4;
    u8 r8;
    u8 r7;
    u8 r0;
    s8 r6;
    s8 r5;
    s8 r4_2;
    u8 taskId;

    gBattleAnimScriptPtr++;
    r9 = SCRIPT_READ_16(gBattleAnimScriptPtr);
    r0 = SCRIPT_READ_8(gBattleAnimScriptPtr + 2);
    r4 = SCRIPT_READ_8(gBattleAnimScriptPtr + 3);
    r8 = SCRIPT_READ_8(gBattleAnimScriptPtr + 4);
    r7 = SCRIPT_READ_8(gBattleAnimScriptPtr + 5);
    r6 = sub_8077094(r0);
    r5 = sub_8077094(r4);
    r4_2 = sub_8077094(r8);
    taskId = CreateTask(c3_08073CEC, 1);
    gTasks[taskId].data[0] = r6;
    gTasks[taskId].data[1] = r5;
    gTasks[taskId].data[2] = r4_2;
    gTasks[taskId].data[3] = r7;
    gTasks[taskId].data[4] = r6;
    PlaySE12WithPanning(r9, r6);
    gUnknown_0202F7B3++;
    gBattleAnimScriptPtr += 6;
}

static void ScriptCmd_panse_1C(void)
{
    u16 r5;
    u8 r0;
    u8 r8;
    u8 r9;
    s8 r4;
    u8 taskId;

    gBattleAnimScriptPtr++;
    r5 = SCRIPT_READ_16(gBattleAnimScriptPtr);
    r0 = SCRIPT_READ_8(gBattleAnimScriptPtr + 2);
    r8 = SCRIPT_READ_8(gBattleAnimScriptPtr + 3);
    r9 = SCRIPT_READ_8(gBattleAnimScriptPtr + 4);
    r4 = sub_8076F98(r0);
    taskId = CreateTask(sub_80774FC, 1);
    gTasks[taskId].data[0] = r5;
    gTasks[taskId].data[1] = r4;
    gTasks[taskId].data[2] = r8;
    gTasks[taskId].data[3] = r9;
    gTasks[taskId].data[8] = r8;
    gTasks[taskId].func(taskId);
    gUnknown_0202F7B3++;
    gBattleAnimScriptPtr += 5;
}

static void sub_80774FC(u8 taskId)
{
    s16 data8;
    u16 r0;
    s8 r1;
    u8 r4;

    data8 = gTasks[taskId].data[8];
    gTasks[taskId].data[8]++;
    if (data8 >= gTasks[taskId].data[2])
    {
        gTasks[taskId].data[8] = 0;
        r0 = gTasks[taskId].data[0];
        r1 = gTasks[taskId].data[1];
        gTasks[taskId].data[3]--;
        r4 = gTasks[taskId].data[3];
        PlaySE12WithPanning(r0, r1);
        if (r4 == 0)
        {
            DestroyTask(taskId);
            gUnknown_0202F7B3--;
        }
    }
}

static void ScriptCmd_panse_1D(void)
{
    u16 r5;
    u8 r0;
    u8 r8;
    s8 r4;
    u8 taskId;

    gBattleAnimScriptPtr++;
    r5 = SCRIPT_READ_16(gBattleAnimScriptPtr);
    r0 = SCRIPT_READ_8(gBattleAnimScriptPtr + 2);
    r8 = SCRIPT_READ_8(gBattleAnimScriptPtr + 3);
    r4 = sub_8076F98(r0);
    taskId = CreateTask(sub_80775CC, 1);
    gTasks[taskId].data[0] = r5;
    gTasks[taskId].data[1] = r4;
    gTasks[taskId].data[2] = r8;
    gUnknown_0202F7B3++;
    gBattleAnimScriptPtr += 4;
}

static void sub_80775CC(u8 taskId)
{
    s16 r0;

    r0 = gTasks[taskId].data[2];
    gTasks[taskId].data[2]--;
    if (r0 <= 0)
    {
        PlaySE12WithPanning(gTasks[taskId].data[0], gTasks[taskId].data[1]);
        DestroyTask(taskId);
        gUnknown_0202F7B3--;
    }
}

static void ScriptCmd_createtask_1F(void)
{
    TaskFunc func;
    u8 numArgs;
    int i;
    u8 taskId;

    gBattleAnimScriptPtr++;
    func = (TaskFunc)SCRIPT_READ_32(gBattleAnimScriptPtr);
    gBattleAnimScriptPtr += 4;
    numArgs = SCRIPT_READ_8(gBattleAnimScriptPtr);
    gBattleAnimScriptPtr++;
    for (i = 0; i < numArgs; i++)
    {
        gBattleAnimArgs[i] = SCRIPT_READ_16(gBattleAnimScriptPtr);
        gBattleAnimScriptPtr += 2;
    }
    taskId = CreateTask(func, 1);
    func(taskId);
    gUnknown_0202F7B3++;
}

static void ScriptCmd_waitsound(void)
{
    if (gUnknown_0202F7B3 != 0)
    {
        gUnknown_03004AF0 = 0;
        gUnknown_0202F7B0 = 1;
    }
    else if (IsSEPlaying())
    {
        gUnknown_03004AF0++;
        if (gUnknown_03004AF0 > 0x5A)
        {
            m4aMPlayStop(&gMPlay_SE1);
            m4aMPlayStop(&gMPlay_SE2);
            gUnknown_03004AF0 = 0;
        }
        else
        {
            gUnknown_0202F7B0 = 1;
        }
    }
    else
    {
        gUnknown_03004AF0 = 0;
        gBattleAnimScriptPtr++;
        gUnknown_0202F7B0 = 0;
    }
}

static void ScriptCmd_jumpvareq(void)
{
    u8 r2;
    s16 r1;
    u8 *addr;

    gBattleAnimScriptPtr++;
    r2 = SCRIPT_READ_8(gBattleAnimScriptPtr);
    r1 = SCRIPT_READ_16(gBattleAnimScriptPtr + 1);
    if (r1 == gBattleAnimArgs[r2])
    {
        addr = (u8 *)SCRIPT_READ_32(gBattleAnimScriptPtr + 3);
        gBattleAnimScriptPtr = addr;
    }
    else
    {
        gBattleAnimScriptPtr += 7;
    }
}

static void ScriptCmd_jumpunkcond(void)
{
    u8 *addr;

    gBattleAnimScriptPtr++;
    if (sub_8076BE0())
    {
        addr = (u8 *)SCRIPT_READ_32(gBattleAnimScriptPtr);
        gBattleAnimScriptPtr = addr;
    }
    else
    {
        gBattleAnimScriptPtr += 4;
    }
}

static void ScriptCmd_monbgprio_28(void)
{
    u8 r2;
    u8 r0;
    u8 r4;

    r2 = SCRIPT_READ_8(gBattleAnimScriptPtr + 1);
    gBattleAnimScriptPtr += 2;
    if (r2 != 0)
        r0 = gUnknown_0202F7C9;
    else
        r0 = gUnknown_0202F7C8;
    r4 = battle_get_per_side_status(r0);
    if (!sub_8076BE0() && (r4 == 0 || r4 == 3))
    {
        REG_BG1CNT_BITFIELD.priority = 1;
        REG_BG2CNT_BITFIELD.priority = 2;
    }
}

static void ScriptCmd_monbgprio_29(void)
{
    gBattleAnimScriptPtr++;
    if (!sub_8076BE0())
    {
        REG_BG1CNT_BITFIELD.priority = 1;
        REG_BG2CNT_BITFIELD.priority = 2;
    }
}

static void ScriptCmd_monbgprio_2A(void)
{
    u8 r6;
    u8 r4;
    u8 r0;

    r6 = SCRIPT_READ_8(gBattleAnimScriptPtr + 1);
    gBattleAnimScriptPtr += 2;
    if (battle_side_get_owner(gUnknown_0202F7C8) != battle_side_get_owner(gUnknown_0202F7C9))
    {
        if (r6 != 0)
            r0 = gUnknown_0202F7C9;
        else
            r0 = gUnknown_0202F7C8;
        r4 = battle_get_per_side_status(r0);
        if (!sub_8076BE0() && (r4 == 0 || r4 == 3))
        {
            REG_BG1CNT_BITFIELD.priority = 1;
            REG_BG2CNT_BITFIELD.priority = 2;
        }
    }
}

static void ScriptCmd_invisible(void)
{
    u8 r0;
    u8 spriteId;

    r0 = SCRIPT_READ_8(gBattleAnimScriptPtr + 1);
    spriteId = obj_id_for_side_relative_to_move(r0);
    if (spriteId != 0xFF)
    {
        gSprites[spriteId].invisible = TRUE;
    }
    gBattleAnimScriptPtr += 2;
}

static void ScriptCmd_visible(void)
{
    u8 r0;
    u8 spriteId;

    r0 = SCRIPT_READ_8(gBattleAnimScriptPtr + 1);
    spriteId = obj_id_for_side_relative_to_move(r0);
    if (spriteId != 0xFF)
    {
        gSprites[spriteId].invisible = FALSE;
    }
    gBattleAnimScriptPtr += 2;
}

static void ScriptCmd_doublebattle_2D(void)
{
    u8 r7;
    u8 r4;
    u8 spriteId;

    r7 = SCRIPT_READ_8(gBattleAnimScriptPtr + 1);
    gBattleAnimScriptPtr += 2;
    if (!sub_8076BE0() && IsDoubleBattle()
     && battle_side_get_owner(gUnknown_0202F7C8) == battle_side_get_owner(gUnknown_0202F7C9))
    {
        if (r7 == 0)
        {
            r4 = battle_get_per_side_status_permutated(gUnknown_0202F7C8);
            spriteId = obj_id_for_side_relative_to_move(0);
        }
        else
        {
            r4 = battle_get_per_side_status_permutated(gUnknown_0202F7C9);
            spriteId = obj_id_for_side_relative_to_move(1);
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
    u8 r7;
    u8 r4;
    u8 spriteId;

    r7 = SCRIPT_READ_8(gBattleAnimScriptPtr  + 1);
    gBattleAnimScriptPtr += 2;
    if (!sub_8076BE0() && IsDoubleBattle()
     && battle_side_get_owner(gUnknown_0202F7C8) == battle_side_get_owner(gUnknown_0202F7C9))
    {
        if (r7 == 0)
        {
            r4 = battle_get_per_side_status_permutated(gUnknown_0202F7C8);
            spriteId = obj_id_for_side_relative_to_move(0);
        }
        else
        {
            r4 = battle_get_per_side_status_permutated(gUnknown_0202F7C9);
            spriteId = obj_id_for_side_relative_to_move(1);
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
    gBattleAnimScriptPtr++;
}
