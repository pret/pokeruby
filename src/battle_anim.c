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

struct UnknownStruct3
{
    u8 unk0;
    u8 filler1[0xB];
};

extern u16 gUnknown_02024A6A[4];
extern u8 gUnknown_02024BE0[];
extern u8 gUnknown_02024C07;
extern u8 gUnknown_02024C08;
extern const u8 *gUnknown_0202F7A4;
extern const u8 *gUnknown_0202F7A8;
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

#define EWRAM_14800 ((u16 *)(unk_2000000 + 0x14800))
#define EWRAM_17800 ((struct UnknownStruct1 *)(unk_2000000 + 0x17800))
#define EWRAM_17810 ((struct UnknownStruct3 *)(unk_2000000 + 0x17810))
#define EWRAM_18000 ((u16 *)(unk_2000000 + 0x18000))
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
    u32 r4;
    
    //TODO: Clean this up
    gUnknown_0202F7A4++;
    r4 = gUnknown_0202F7A4[0] | (gUnknown_0202F7A4[1] << 8);
    LoadCompressedObjectPic(&gBattleAnimPicTable[r4 - 10000]);
    LoadCompressedObjectPalette(&gBattleAnimPaletteTable[r4 - 10000]);
    gUnknown_0202F7A4 += 2;
    sub_8075940(r4 - 10000);
    gUnknown_0202F7B0 = 1;
    gUnknown_0202F7AC = move_anim_waiter;
}

void ma01_080728D0(void)
{
    u32 r4;
    
    gUnknown_0202F7A4++;
    r4 = gUnknown_0202F7A4[0] | (gUnknown_0202F7A4[1] << 8);
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
    u8 r4;
    u8 r0;
    u8 _r0;
    u16 r6;
    u8 r2;
    s8 r1;
    
    gUnknown_0202F7A4++;
    r7 = (struct SpriteTemplate *)(gUnknown_0202F7A4[0] + (gUnknown_0202F7A4[1] << 8) + (gUnknown_0202F7A4[2] << 16) + (gUnknown_0202F7A4[3] << 24));
    gUnknown_0202F7A4 += 4;
    r4 = *gUnknown_0202F7A4;
    gUnknown_0202F7A4++;
    r0 = *gUnknown_0202F7A4;
    gUnknown_0202F7A4++;
    for (i = 0; i < r0; i++)
    {
        gBattleAnimArgs[i] = gUnknown_0202F7A4[0] | (gUnknown_0202F7A4[1] << 8);
        gUnknown_0202F7A4 += 2;
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
    TaskFunc taskFunc;
    u8 taskPriority;
    u8 taskId;
    u8 r0;
    s32 i;
    
    gUnknown_0202F7A4++;
    taskFunc = (TaskFunc)(gUnknown_0202F7A4[0] + (gUnknown_0202F7A4[1] << 8) + (gUnknown_0202F7A4[2] << 16) + (gUnknown_0202F7A4[3] << 24));
    gUnknown_0202F7A4 += 4;
    taskPriority = *gUnknown_0202F7A4;
    gUnknown_0202F7A4++;
    r0 = *gUnknown_0202F7A4;
    gUnknown_0202F7A4++;
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
    gUnknown_0202F7A4++;
    gUnknown_0202F7B0 = *gUnknown_0202F7A4;
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
    gUnknown_0202F7A4++;
    PlaySE(gUnknown_0202F7A4[0] | (gUnknown_0202F7A4[1] << 8));
    gUnknown_0202F7A4 += 2;
}

extern void task_pA_ma0A_obj_to_bg_pal(u8);
extern bool8 b_side_obj__get_some_boolean(u8);
extern void sub_8076034(u8, u8);

void sub_8075DE0(void)
{
    u8 r6;
    u8 r5;
    u8 r0;
    u8 r7;
    u16 r4;
    u8 taskId;
    
    gUnknown_0202F7A4++;
    r6 = *gUnknown_0202F7A4;
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
    void *unk0;
    u16 *unk4;
    u8 unk8;
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
extern void sub_8076380(void);
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
        
        LoadPalette(gPlttBufferUnfaded + 0x100 + a * 16, s.unk8 * 16, 32);
        addr3 = (u16 *)PLTT + s.unk8 * 16;
        DmaCopy32(3, gPlttBufferUnfaded + 0x100 + a * 16, addr3, 32);
        
        if (sub_8076BE0() != 0)
            r2 = 0;
        else
            r2 = battle_get_per_side_status(a);
        sub_80E4EF8(0, 0, r2, s.unk8, (u32)s.unk0, (((s32)s.unk4 - VRAM) / 2048), REG_BGCNT_BITFIELD(1).charBaseBlock);
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

void sub_8076380(void)
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

void task_pA_ma0A_obj_to_bg_pal(u8 taskId)
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

extern void sub_807672C(u8);

void ma0B_0807324C(void)
{
    u8 r4;
    u8 r5;
    u8 taskId;
    
    gUnknown_0202F7A4++;
    r4 = *gUnknown_0202F7A4;
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
    gUnknown_0202F7A4++;
}

void sub_807672C(u8 taskId)
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

void sub_80767C4(void)
{
    u8 r5;
    u8 r4;
    u8 r0;
    u8 r1;
    
    gUnknown_0202F7A4++;
    r5 = *gUnknown_0202F7A4;
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
    gUnknown_0202F7A4++;
}

extern void sub_80769A4(u8);

void ma23_8073484(void)
{
    u8 r5;
    u8 r6;
    u8 taskId;
    
    gUnknown_0202F7A4++;
    r5 = *gUnknown_0202F7A4;
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
    gUnknown_0202F7A4++;
}

void sub_80769A4(u8 taskId)
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

void sub_8076A3C(void)
{
    u16 r3;
    u16 r1;
    
    gUnknown_0202F7A4++;
    r3 = *(gUnknown_0202F7A4++);
    r1 = *(gUnknown_0202F7A4++) << 8;
    REG_BLDCNT = 0x3F40;
    REG_BLDALPHA = r3 | r1;
}

void sub_8076A78(void)
{
    u16 r3;
    u16 r1;
    
    gUnknown_0202F7A4++;
    r3 = *(gUnknown_0202F7A4++);
    r1 = *(gUnknown_0202F7A4++) << 8;
    REG_BLDCNT = r3 | r1;
}

void sub_8076AA0(void)
{
    gUnknown_0202F7A4++;
    REG_BLDCNT = 0;
    REG_BLDALPHA = 0;
}

void ma0E_call(void)
{
    u32 addr;
    
    gUnknown_0202F7A4++;
    gUnknown_0202F7A8 = gUnknown_0202F7A4 + 4;  //store return address
    addr = gUnknown_0202F7A4[0] + (gUnknown_0202F7A4[1] << 8) + (gUnknown_0202F7A4[2] << 16) + (gUnknown_0202F7A4[3] << 24);
    gUnknown_0202F7A4 = (u8 *)addr;
}

//script return
void sub_8076AF0(void)
{
    gUnknown_0202F7A4 = gUnknown_0202F7A8;
}

void ma10_080736AC(void)
{
    const u8 *addr = gUnknown_0202F7A4;
    u16 r4;
    u8 r2;
    
    gUnknown_0202F7A4++;
    r2 = *(gUnknown_0202F7A4++);
    r4 = gUnknown_0202F7A4[0] | (gUnknown_0202F7A4[1] << 8);
    gUnknown_0202F7A4 = addr + 4;
    gBattleAnimArgs[r2] = r4;
}

void ma11_if_else(void)
{
    u32 addr;
    
    gUnknown_0202F7A4++;
    if (gUnknown_0202F7C4 & 1)
        gUnknown_0202F7A4 += 4;
    addr = gUnknown_0202F7A4[0] + (gUnknown_0202F7A4[1] << 8) + (gUnknown_0202F7A4[2] << 16) + (gUnknown_0202F7A4[3] << 24);
    gUnknown_0202F7A4 = (u8 *)addr;
}

void ma12_cond_if(void)
{
    const u8 *r4 = gUnknown_0202F7A4;
    u8 r1;
    u32 addr;
    
    gUnknown_0202F7A4++;
    r1 = *gUnknown_0202F7A4;
    gUnknown_0202F7A4++;
    if (r1 == gUnknown_0202F7C4)
    {
        addr = gUnknown_0202F7A4[0] + (gUnknown_0202F7A4[1] << 8) + (gUnknown_0202F7A4[2] << 16) + (gUnknown_0202F7A4[3] << 24);
        gUnknown_0202F7A4 = (u8 *)addr;
    }
    else
    {
        gUnknown_0202F7A4 = r4 + 6;
    }
}

//script goto
void sub_8076BBC(void)
{
    u32 addr;
    
    gUnknown_0202F7A4++;
    addr = gUnknown_0202F7A4[0] + (gUnknown_0202F7A4[1] << 8) + (gUnknown_0202F7A4[2] << 16) + (gUnknown_0202F7A4[3] << 24);
    gUnknown_0202F7A4 = (u8 *)addr;
}

u8 sub_8076BE0(void)
{
    if (!gMain.inBattle)
        return TRUE;
    else
        return FALSE;
}

extern void task_p5_load_battle_screen_elements(u8);

void ma14_load_background(void)
{
    u8 r4;
    u8 taskId;
    
    gUnknown_0202F7A4++;
    r4 = *(gUnknown_0202F7A4++);
    taskId = CreateTask(task_p5_load_battle_screen_elements, 5);
    gTasks[taskId].data[0] = r4;
    gUnknown_0202F7C5 = 1;
}

void sub_8076C4C(void)
{
    u8 r8;
    u8 r7;
    u8 r6;
    u8 taskId;
    
    gUnknown_0202F7A4++;
    r8 = gUnknown_0202F7A4[0];
    r7 = gUnknown_0202F7A4[1];
    r6 = gUnknown_0202F7A4[2];
    gUnknown_0202F7A4 += 3;
    taskId = CreateTask(task_p5_load_battle_screen_elements, 5);
    if (sub_8076BE0() != 0)
        gTasks[taskId].data[0] = r6;
    else if (battle_side_get_owner(gUnknown_0202F7C9) == 0)
        gTasks[taskId].data[0] = r7;
    else
        gTasks[taskId].data[0] = r8;
    gUnknown_0202F7C5 = 1;
}

extern void sub_8076DB8(u16);
extern void dp01t_11_3_message_for_player_only(void);

void task_p5_load_battle_screen_elements(u8 taskId)
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

struct BattleAnimBackground
{
    void *image;
    void *palette;
    void *tilemap;
};

extern const struct BattleAnimBackground gBattleAnimBackgroundTable[];

extern void sub_800D238();
extern u8 sub_80789BC();

void sub_8076DB8(u16 a)
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

extern void sub_80AB2AC(void);
extern void sub_800D7B8(void);

void dp01t_11_3_message_for_player_only(void)
{
    if (sub_8076BE0())
        sub_80AB2AC();
    else
        sub_800D7B8();
}

void ma15_load_battle_screen_elements(void)
{
    u8 taskId;
    
    gUnknown_0202F7A4++;
    taskId = CreateTask(task_p5_load_battle_screen_elements, 5);
    gTasks[taskId].data[0] = 0xFFFF;
    gUnknown_0202F7C5 = 1;
}

void ma16_wait_for_battle_screen_elements_s2(void)
{
    if (gUnknown_0202F7C5 == 2)
    {
        gUnknown_0202F7A4++;
        gUnknown_0202F7B0 = 0;
    }
    else
    {
        gUnknown_0202F7B0 = 1;
    }
}

void sub_8076F44(void)
{
    if (gUnknown_0202F7C5 == 0)
    {
        gUnknown_0202F7A4++;
        gUnknown_0202F7B0 = 0;
    }
    else
    {
        gUnknown_0202F7B0 = 1;
    }
}

void ma18_load_background_probably(void)
{
    gUnknown_0202F7A4++;
    sub_8076DB8(*gUnknown_0202F7A4);
    gUnknown_0202F7A4++;
}

/*
void sub_8076F98(u8 a)
{
    if (!sub_8076BE0() && (EWRAM_17810[gUnknown_0202F7C8].unk0 & 0x10))
    {
        battle_side_get_owner(gUnknown_0202F7C8);
    }
    //_08076FDC
    else
    {
        
    }
    //_0807706E
}
*/
