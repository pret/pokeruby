#include "global.h"
#include "asm.h"
#include "gba/m4a_internal.h"
#include "sprite.h"
#include "task.h"

extern u16 gUnknown_02024A6A[4];
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
extern u16 gUnknown_03004200;
extern u16 gUnknown_03004240;
extern u16 gUnknown_03004244;
extern u16 gUnknown_030042C4;
extern u16 gUnknown_03004B10[8];
extern u16 gBattleAnimArgs[8];
extern struct MusicPlayerInfo gMPlay_BGM;

extern const u16 gUnknown_081C7160[];
extern void (*gUnknown_0837F4B8[])(void);
extern const u8 *const gBattleAnims_Moves[];

extern u8 unk_2000000[];

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

extern u8 sub_8076BE0();
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

/*
void ma00_load_graphics(void)
{
    u8 r4 = *(gUnknown_0202F7A4++);
    u8 temp = *gUnknown_0202F7A4;
    
    r4 |= temp << 8;
    LoadCompressedObjectPic()
}
*/
