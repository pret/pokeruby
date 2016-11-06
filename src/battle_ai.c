#include "global.h"
#include "battle.h"
#include "pokemon.h"
#include "rng.h"

extern u8 sub_8015A98(u8, u8, u8);
extern u8 battle_side_get_owner(u8);
extern u32 battle_get_per_side_status(u8);

extern u16 gUnknown_020239F8;
extern u8 gUnknown_02024A60;
extern u8 gUnknown_02024C07; 
extern u8 gUnknown_02024C08;
extern u8 gUnknown_02024C0C;
extern u16 gUnknown_02024C34[];
extern u8 *gUnknown_02039238;
extern u16 gTrainerBattleOpponent;
extern struct Trainer gTrainers[];
extern u32 gBitTable[];
extern u8 *BattleAIs[];
extern struct BattlePokemon gBattleMons[];
extern void (*gBattleAICmdTable[])(void);

struct UnknownStruct1
{
    u16 unk0[2][8];
    u8 unk20[2];
    u8 unk22[2];
    u16 items[4];
    u8 unk8;
};

struct UnknownStruct2
{
    u8 unk0;
    u8 unk1;
    u16 unk2;
    u8 unk4[4];
    u8 filler8[4];
    u32 aiFlags;
    u8 unk10;
    u8 unk11;
    u8 filler12[6];
    u8 unk18[4];
};

struct UnknownStruct3
{
    u8 filler0[0x20];
    u8 unk20;
};

extern struct UnknownStruct2 unk_2016800;
extern struct UnknownStruct1 unk_2016A00;
extern struct UnknownStruct3 unk_2016C00;

void sub_810715C(void);
void sub_8107374(void);
void sub_810745C(void);

void sub_81070D4(void)
{
    s32 i;
    u8 *data = (u8 *)&unk_2016A00;
    
    for(i = 0; (u32)i < 48; i++)
        data[i] = 0;
    if((gUnknown_020239F8 & 8) && gTrainerBattleOpponent != 0x400 && !(gUnknown_020239F8 & 0x982))
    {
        for(i = 0; i < 4; i++)
        {
            if(gTrainers[gTrainerBattleOpponent].items[i] != 0)
            {
                unk_2016A00.items[unk_2016A00.unk8] = gTrainers[gTrainerBattleOpponent].items[i];
                unk_2016A00.unk8++;
            }
        }
    }
    sub_810715C();
}

void sub_810715C(void)
{
    s32 i;
    u8 *data = (u8 *)&unk_2016800;
    u8 r7;
    
    for(i = 0; (u32)i < 28; i++)
        data[i] = 0;
    for(i = 0; i < 4; i++)
        unk_2016800.unk4[i] = 100;
    r7 = sub_8015A98(gUnknown_02024A60, 0, 0xFF);
    for(i = 0; i < 4; i++)
    {
        u16 rand;
        
        if(gBitTable[i] & r7)
            unk_2016800.unk4[i] = 0;
        rand = Random();
        unk_2016800.unk18[i] = 100 - (rand & 0xF);
    }
    unk_2016C00.unk20 = 0;
    gUnknown_02024C07 = gUnknown_02024A60;
    
    if(gUnknown_020239F8 & 1)
    {
        gUnknown_02024C08 = Random() & 2;
        
        if(gUnknown_02024C0C & gBitTable[gUnknown_02024C08])
            gUnknown_02024C08 ^= 2;
    }
    else
        gUnknown_02024C08 = gUnknown_02024A60 ^ 1;
    
    if(gUnknown_020239F8 & 0x80)
        unk_2016800.aiFlags = 0x40000000;
    else if(gUnknown_020239F8 & 0x400)
        unk_2016800.aiFlags = 0x20000000;
    else if(gUnknown_020239F8 & 0x10)
        unk_2016800.aiFlags = 0x80000000;
    else
        unk_2016800.aiFlags = gTrainers[gTrainerBattleOpponent].aiFlags;
}

u8 sub_81072A8(void)
{
    u8 arr1[4];
    u8 arr2[4];
    u8 r5;
    s32 i;
    
    sub_810745C();
    while(unk_2016800.aiFlags != 0)
    {
        if(unk_2016800.aiFlags & 1)
        {
            unk_2016800.unk0 = 0;
            sub_8107374();
        }
        unk_2016800.aiFlags >>= 1;
        unk_2016800.unk11++;
        unk_2016800.unk1 = 0;
    }
    if(unk_2016800.unk10 & 2)
        return 4;
    if(unk_2016800.unk10 & 4)
        return 5;
    r5 = 1;
    arr1[0] = unk_2016800.unk4[0];
    arr2[0] = 0;
    for(i = 1; i < 4; i++)
    {
        if(arr1[0] < (s8)unk_2016800.unk4[i])
        {
            r5 = 1;
            arr1[0] = unk_2016800.unk4[i];
            arr2[0] = i;
        }
        if(arr1[0] == (s8)unk_2016800.unk4[i])
        {
            arr1[r5] = unk_2016800.unk4[i];
            arr2[r5++] = i;
        }
    }
    return arr2[Random() % r5];
}

void sub_8107374(void)
{
    while(unk_2016800.unk0 != 2)
    {
        switch(unk_2016800.unk0)
        {
        case 3: //Needed to match.
            break;
        case 0:
            gUnknown_02039238 = BattleAIs[unk_2016800.unk11];
            if(gBattleMons[gUnknown_02024C07].pp[unk_2016800.unk1] == 0)
            {
                unk_2016800.unk2 = 0;
            }
            else
            {
                unk_2016800.unk2 = gBattleMons[gUnknown_02024C07].moves[unk_2016800.unk1];
            }
            unk_2016800.unk0++;
            break;
        case 1:
            if(unk_2016800.unk2 != 0)
                gBattleAICmdTable[*(u8 *)gUnknown_02039238]();  //weird...
            else
            {
                unk_2016800.unk4[unk_2016800.unk1] = 0;
                unk_2016800.unk10 |= 1;
            }
            if(unk_2016800.unk10 & 1)
            {
                unk_2016800.unk1++;
                if(unk_2016800.unk1 < 4 && !(unk_2016800.unk10 & 8))
                    unk_2016800.unk0 = 0;
                else
                    unk_2016800.unk0++;
                unk_2016800.unk10 &= 0xFE;
            }
            break;
        }
    }
}

#ifdef NONMATCHING
void sub_810745C(void)
{
    s32 i;
    
    for(i = 0; i < 8; i++)
    {
        if(unk_2016A00.unk0[gUnknown_02024C08 / 2][i] == 0)
        {
            //gUnknown_02024C34[gUnknown_02024C08] += 0;
            unk_2016A00.unk0[gUnknown_02024C08 / 2][i] = gUnknown_02024C34[gUnknown_02024C08];
            return;
        }
    }
}
#else
__attribute__((naked))
void sub_810745C(void)
{
    asm(".syntax unified\n\
    push {r4-r6,lr}\n\
    movs r2, 0\n\
    ldr r3, _08107488 @ =gUnknown_02024C08\n\
    ldr r5, _0810748C @ =0x02016a00\n\
    ldr r6, _08107490 @ =gUnknown_02024C34\n\
    adds r4, r3, 0\n\
_08107468:\n\
    lsls r0, r2, 1\n\
    ldrb r1, [r4]\n\
    lsrs r1, 1\n\
    lsls r1, 4\n\
    adds r0, r1\n\
    adds r1, r0, r5\n\
    ldrh r0, [r1]\n\
    cmp r0, 0\n\
    bne _08107494\n\
    ldrb r0, [r3]\n\
    lsls r0, 1\n\
    adds r0, r6\n\
    ldrh r0, [r0]\n\
    strh r0, [r1]\n\
    b _0810749A\n\
    .align 2, 0\n\
_08107488: .4byte gUnknown_02024C08\n\
_0810748C: .4byte 0x02016a00\n\
_08107490: .4byte gUnknown_02024C34\n\
_08107494:\n\
    adds r2, 0x1\n\
    cmp r2, 0x7\n\
    ble _08107468\n\
_0810749A:\n\
    pop {r4-r6}\n\
    pop {r0}\n\
    bx r0\n\
    .syntax divided");
}
#endif

void unref_sub_81074A0(u8 a)
{
    s32 i;
    
    for(i = 0; i < 8; i++)
        unk_2016A00.unk0[a / 2][i] = 0;
}

void sub_81074C4(u8 a, u8 b)
{
    if(battle_side_get_owner(a) == 0)
        unk_2016A00.unk20[battle_get_per_side_status(a) % 2] = b;
}

void sub_81074F8(u8 a, u8 b)
{
    if(battle_side_get_owner(a) == 0)
        unk_2016A00.unk22[battle_get_per_side_status(a) % 2] = b;
}
