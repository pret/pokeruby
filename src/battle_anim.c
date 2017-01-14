#include "global.h"
#include "asm.h"
#include "decompress.h"
#include "m4a.h"
#include "palette.h"
#include "sound.h"
#include "sprite.h"
#include "task.h"

struct UnknownStruct1
{
    u8 unk0;
};

extern u16 gUnknown_02024A6A[4];
extern u8 gUnknown_02024BE0[];
extern u8 gUnknown_02024C07;
extern u8 gUnknown_02024C08;
extern const u8 *gUnknown_0202F7A4;
extern void (*gUnknown_0202F7AC)(void);
extern s8 gUnknown_0202F7B0;
extern u8 gUnknown_0202F7B1;
extern u8 gUnknown_0202F7B2;
extern u8 gUnknown_0202F7B3;
extern u32 gUnknown_0202F7B4;
extern u32 gUnknown_0202F7B8;
extern u16 gUnknown_0202F7BC;
extern u8 gUnknown_0202F7BE;
extern u8 gUnknown_0202F7C2[];
extern u8 gUnknown_0202F7C4;
extern u8 gUnknown_0202F7C5;
extern u16 gUnknown_0202F7C6;
extern u8 gUnknown_0202F7C8;
extern u8 gUnknown_0202F7C9;
extern u16 gUnknown_0202F7CA[4];
extern u8 gUnknown_0202F7D2;
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
extern u16 gBattleAnimArgs[8];
extern struct MusicPlayerInfo gMPlay_BGM;
extern struct MusicPlayerInfo gMPlay_SE1;
extern struct MusicPlayerInfo gMPlay_SE2;

extern const u16 gUnknown_081C7160[];
extern void (*gUnknown_0837F4B8[])(void);
extern const u8 *const gBattleAnims_Moves[];
extern const struct SpriteSheet gBattleAnimPicTable[];
extern const struct SpritePalette gBattleAnimPaletteTable[];

extern u8 unk_2000000[];

#define EWRAM_17800 ((struct UnknownStruct1 *)(unk_2000000 + 0x17800))
#define EWRAM_19348 (*(u16 *)(unk_2000000 + 0x19348))

void sub_8075624(void)
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

extern void move_something(const u8 *const moveAnims[], u16 b, u8 c);

void move_anim_start_t1(u16 a)
{
    gUnknown_0202F7C8 = gUnknown_02024C07;
    gUnknown_0202F7C9 = gUnknown_02024C08;
    move_something(gBattleAnims_Moves, a, 1);
}

extern u8 sub_8076BE0(void);
extern void sub_8079E24();
extern void sub_8043EB4();
extern void sub_80759D0(void);

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
    gUnknown_0202F7A4 = moveAnims[b];
    gUnknown_0202F7B1 = 1;
    gUnknown_0202F7B0 = 0;
    gUnknown_0202F7AC = sub_80759D0;
    for (i = 0; i < 8; i++)
        gUnknown_03004B10[i] |= 0xFFFF;
    if (c != 0)
    {
        i = 0;
        while (1)
        {
            if (gUnknown_081C7160[i] == 0xFFFF)
                break;
            if (b == gUnknown_081C7160[i])
            {
                m4aMPlayVolumeControl(&gMPlay_BGM, 0xFFFF, 128);
                break;
            }
            i++;
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

void sub_8075940(u16 a)
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

void sub_8075970(u16 a)
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

void move_anim_waiter(void)
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

void sub_80759D0(void)
{
    do
    {
        gUnknown_0837F4B8[*gUnknown_0202F7A4]();
    } while (gUnknown_0202F7B0 == 0 && gUnknown_0202F7B1 != 0);
}

void ma00_load_graphics(void)
{
    const u8 *ptr = gUnknown_0202F7A4;
    u32 r4;
    
    gUnknown_0202F7A4++;
    r4 = ptr[1] | (gUnknown_0202F7A4[1] << 8);
    LoadCompressedObjectPic(&gBattleAnimPicTable[r4 - 10000]);
    LoadCompressedObjectPalette(&gBattleAnimPaletteTable[r4 - 10000]);
    gUnknown_0202F7A4 += 2;
    sub_8075940(r4 - 10000);
    gUnknown_0202F7B0 = 1;
    gUnknown_0202F7AC = move_anim_waiter;
}

void ma01_080728D0(void)
{
    const u8 *ptr = gUnknown_0202F7A4;
    u32 r4;
    
    gUnknown_0202F7A4++;
    r4 = ptr[1] | (gUnknown_0202F7A4[1] << 8);
    FreeSpriteTilesByTag(gBattleAnimPicTable[r4 - 10000].tag);
    FreeSpritePaletteByTag(gBattleAnimPicTable[r4 - 10000].tag);
    gUnknown_0202F7A4 += 2;
    sub_8075970(r4 - 10000);
}

extern u8 sub_8079E90();
extern u8 sub_8077ABC();

#ifdef NONMATCHING
void ma02_instanciate_template(void)
{
    s32 i;
    struct SpriteTemplate *r7;
    const u8 *ptr = gUnknown_0202F7A4;
    s8 r4;
    u8 r0;
    s8 _r0;
    s16 r6;
    u8 r2;
    
    gUnknown_0202F7A4++;
    r7 = (struct SpriteTemplate *)(*(ptr + 1) + (*(gUnknown_0202F7A4 + 1) << 8) + (*(gUnknown_0202F7A4 + 2) << 16) + (*(gUnknown_0202F7A4 + 3) << 24));
    gUnknown_0202F7A4 = ptr + 5;
    r4 = *(ptr + 5);
    gUnknown_0202F7A4 = ptr + 6;
    r0 = *(ptr + 6);
    gUnknown_0202F7A4 = ptr + 7;
    for (i = 0; i < r0; i++)
    {
        gBattleAnimArgs[i] = *(gUnknown_0202F7A4) | (*(gUnknown_0202F7A4 + 1) << 8);
        gUnknown_0202F7A4 += 2;
    }
    if (r4 & 0x80)
    {
        if ((r4 ^ 0x80) > 0x3F)
            r4 -= 0x40;
        else
            r4 = -r4;
        _r0 = sub_8079E90(gUnknown_0202F7C9);
    }
    else
    {
        //_08075B44
        if (r4 > 0x3F)
            r4 -= 0x40;
        else
            r4 = -r4;
        _r0 = sub_8079E90(gUnknown_0202F7C8);
    }
    r6 = _r0 + r4;
    if (r6 < 3)
        r6 = 3;
    r4 = sub_8077ABC(gUnknown_0202F7C9, 2);
    r2 = sub_8077ABC(gUnknown_0202F7C9, 3);
    CreateSpriteAndAnimate(r7, r4, r2, r6);
    gUnknown_0202F7B2++;
}
#else
__attribute__((naked))
void ma02_instanciate_template(void)
{
    asm(".syntax unified\n\
    push {r4-r7,lr}\n\
    ldr r5, _08075B2C @ =gUnknown_0202F7A4\n\
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
_08075B2C: .4byte gUnknown_0202F7A4\n\
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

void sub_8075BB8(void)
{
    const u8 *ptr = gUnknown_0202F7A4;
    TaskFunc taskFunc;
    u8 taskPriority;
    u8 taskId;
    u8 r0;
    s32 i;
    
    gUnknown_0202F7A4++;
    taskFunc = (TaskFunc)(ptr[1] + (gUnknown_0202F7A4[1] << 8) + (gUnknown_0202F7A4[2] << 16) + (gUnknown_0202F7A4[3] << 24));
    gUnknown_0202F7A4 = ptr + 5;
    taskPriority = ptr[5];
    gUnknown_0202F7A4 = ptr + 6;
    r0 = ptr[6];
    gUnknown_0202F7A4 = ptr + 7;
    for (i = 0; i < r0; i++)
    {
        gBattleAnimArgs[i] = gUnknown_0202F7A4[0] | (gUnknown_0202F7A4[1] << 8);
        gUnknown_0202F7A4 += 2;
    }
    taskId = CreateTask(taskFunc, taskPriority);
    taskFunc(taskId);
    gUnknown_0202F7B2++;
}

void ma04_wait_countdown(void)
{
    const u8 *ptr = gUnknown_0202F7A4;
    
    gUnknown_0202F7A4++;
    gUnknown_0202F7B0 = ptr[1];
    if (gUnknown_0202F7B0 == 0)
        gUnknown_0202F7B0 = -1;
    gUnknown_0202F7A4++;
    gUnknown_0202F7AC = move_anim_waiter;
}

void sub_8075C74(void)
{
    if (gUnknown_0202F7B2 == 0)
    {
        gUnknown_0202F7A4++;
        gUnknown_0202F7B0 = 0;
    }
    else
    {
        gUnknown_0202F7B0 = 1;
    }
}

void nullsub_53(void)
{
}

void nullsub_88(void)
{
}

void sub_8075CB0(void)
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

void ma09_play_sound(void)
{
    const u8 *ptr = gUnknown_0202F7A4;
    
    gUnknown_0202F7A4++;
    PlaySE(ptr[1] | (gUnknown_0202F7A4[1] << 8));
    gUnknown_0202F7A4 += 2;
}

extern void task_pA_ma0A_obj_to_bg_pal(u8);
extern bool8 b_side_obj__get_some_boolean(u8);
extern void sub_8076034(u8, u8);

void sub_8075DE0(void)
{
    const u8 *ptr = gUnknown_0202F7A4;
    u8 r6;
    u8 r5;
    u8 r0;
    u8 r7;
    u16 r4;
    u8 taskId;
    
    gUnknown_0202F7A4++;
    r6 = ptr[1];
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
    gUnknown_0202F7A4++;
}

extern u8 sub_8078874(u8);

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

struct UnknownStruct2
{
    void *unk10;
    void *unk14;
    u8 unk18;
};

struct BGCntrlBitfield
{
    volatile u16 priority:2;
    volatile u16 charBaseBlock:2;
    volatile u16 field_0_2:4;
    volatile u16 field_1_0:5;
    volatile u16 areaOverflowMode:1;
    volatile u16 screenSize:2;
};

#define REG_BGCNT_BITFIELD(n) (*(struct BGCntrlBitfield *)REG_ADDR_BG##n##CNT)

extern void sub_8078914();
extern u8 sub_80AEB1C();
extern void sub_8076380();
extern void sub_80E4EF8(int, int, int, int, u16, u8, int);

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
        addr = s.unk10;
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
        addr2 = (void *)s.unk14;
        DmaFill16(3, 0xFF, addr2, 0x1000);
        
        REG_BGCNT_BITFIELD(1).priority = 2;
        REG_BGCNT_BITFIELD(1).screenSize = 1;
        REG_BGCNT_BITFIELD(1).areaOverflowMode = 0;
        
        spriteId = gUnknown_02024BE0[a];
        gUnknown_030042C0 = -(gSprites[spriteId].pos1.x + gSprites[spriteId].pos2.x) + 32;
        if (sub_8076BE0() != 0 && sub_80AEB1C(EWRAM_19348) != 0)
            gUnknown_030042C0--;
        gUnknown_030041B4 = -(gSprites[spriteId].pos1.y + gSprites[spriteId].pos2.y) + 32;
        gSprites[gUnknown_02024BE0[a]].invisible = TRUE;
        
        REG_BG1HOFS = gUnknown_030042C0;
        REG_BG1VOFS = gUnknown_030041B4;
        
        LoadPalette(gPlttBufferUnfaded + 0x100 + a * 16, s.unk18 * 16, 32);
        addr3 = (u16 *)PLTT + s.unk18 * 16;
        DmaCopy32(3, gPlttBufferUnfaded + 0x100 + a * 16, addr3, 32);
        
        if (sub_8076BE0() != 0)
            r2 = 0;
        else
            r2 = battle_get_per_side_status(a);
        sub_80E4EF8(0, 0, r2, s.unk18, (u32)s.unk10, (((s32)s.unk14 - VRAM) / 2048), REG_BGCNT_BITFIELD(1).charBaseBlock);
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
        
        REG_BGCNT_BITFIELD(2).priority = 2;
        REG_BGCNT_BITFIELD(2).screenSize = 1;
        REG_BGCNT_BITFIELD(2).areaOverflowMode = 0;
        
        spriteId = gUnknown_02024BE0[a];
        gUnknown_03004288 = -(gSprites[spriteId].pos1.x + gSprites[spriteId].pos2.x) + 32;
        gUnknown_03004280 = -(gSprites[spriteId].pos1.y + gSprites[spriteId].pos2.y) + 32;
        gSprites[gUnknown_02024BE0[a]].invisible = TRUE;
        
        REG_BG2HOFS = gUnknown_03004288;
        REG_BG2VOFS = gUnknown_03004280;
        
        LoadPalette(gPlttBufferUnfaded + 0x100 + a * 16, 0x90, 32);
        addr3 = (void *)(PLTT + 0x120);
        DmaCopy32(3, gPlttBufferUnfaded + 0x100 + a * 16, addr3, 32);
        
        sub_80E4EF8(0, 0, battle_get_per_side_status(a), 9, 0x6000, 0x1E, REG_BGCNT_BITFIELD(2).charBaseBlock);
    }
}
