#include "gba/gba.h"
#include "main.h"
#include "menu.h"

extern void SetPokemonCryStereo(u32 val);

extern u8 gSystemText_Normal[];
extern u8 gSystemText_LR[];
extern u8 gSystemText_LA[];
extern u8 gSystemText_Terminator[];
extern u8 gSystemText_Type[];
extern u8 gSystemText_Mono[];
extern u8 gSystemText_Stereo[];
extern u8 gSystemText_Shift[];
extern u8 gSystemText_Set[];
extern u8 gSystemText_On[];
extern u8 gSystemText_Off[];
extern u8 gSystemText_Slow[];
extern u8 gSystemText_Mid[];
extern u8 gSystemText_Fast[];

/*
void sub_808BC3C(u8 a)
{
    REG_WIN1H = 0x18D7;
    
}

*/

void sub_808BC60(u8 *a, u8 b, u8 c, u8 d)
{
    u8 arr[16];
    u16 i;
    
    for(i = 0; *a != 0xFF && i <= 0xE; i++)
        arr[i] = *(a++);
    
    arr[2] = d;
    arr[i] = 0xFF;
    sub_80729D8(arr, b, c, 1);
}

u8 sub_808BCB4(u8 a)
{
    if(gMain.newKeys & 0x10)
    {
        if(a <= 1)
            a++;
        else
            a = 0;
    }
    if(gMain.newKeys & 0x20)
    {
        if(a != 0)
            a--;
        else
            a = 2;
    }
    return a;
}

void sub_808BCF8(u8 a)
{
    u8 arr[2]; //Oops! This should be arr[3].
    
    arr[0] = 0xF;
    arr[1] = 0xF;
    arr[2] = 0xF;
    arr[a] = 0x8;
    
    sub_808BC60(gSystemText_Slow, 0x78, 0x28, arr[0]);
    sub_808BC60(gSystemText_Mid, 0x9B, 0x28, arr[1]);
    sub_808BC60(gSystemText_Fast, 0xB8, 0x28, arr[2]);
}

u32 sub_808BD4C(u8 a)
{
    if(gMain.newKeys & 0x30)
        a ^= 1;
    return a;
}

void sub_808BD6C(u8 a)
{
    u8 arr[2];
    
    arr[0] = 0xF;
    arr[1] = 0xF;
    arr[a] = 0x8;
    
    sub_808BC60(gSystemText_On, 0x78, 0x38, arr[0]);
    sub_808BC60(gSystemText_Off, 0xBE, 0x38, arr[1]);
}

u32 sub_808BDAC(u8 a)
{
    if(gMain.newKeys & 0x30)
        a ^= 1;
    return a;
}

void sub_808BDCC(u8 a)
{
    u8 arr[2];
    
    arr[0] = 0xF;
    arr[1] = 0xF;
    arr[a] = 0x8;
    
    sub_808BC60(gSystemText_Shift, 0x78, 0x48, arr[0]);
    sub_808BC60(gSystemText_Set, 0xBE, 0x48, arr[1]);
}

u32 sub_808BE0C(u8 a)
{
    if(gMain.newKeys & 0x30)
    {
        a ^= 1;
        SetPokemonCryStereo(a);
    }
    return a;
}

void sub_808BE34(u8 a)
{
    u8 arr[3];
    
    arr[0] = 0xF;
    arr[1] = 0xF;
    arr[a] = 0x8;
    
    sub_808BC60(gSystemText_Mono, 0x78, 0x58, arr[0]);
    sub_808BC60(gSystemText_Stereo, 0xAC, 0x58, arr[1]);
}

u8 sub_808BE74(u8 a)
{
    if(gMain.newKeys & 0x10)
    {
        if(a <= 18)
            a++;
        else
            a = 0;
        MenuLoadTextWindowGraphics_OverrideFrameType(a);
    }
    if(gMain.newKeys & 0x20)
    {
        if(a != 0)
            a--;
        else
            a = 19;
        MenuLoadTextWindowGraphics_OverrideFrameType(a);
    }
    return a;
}

void sub_808BECC(u8 a)
{
    u8 arr[8];
    u8 b = a + 1;
    u16 i;
    
    for(i = 0; gSystemText_Terminator[i] != 0xFF && i <= 5; i++)
        arr[i] = gSystemText_Terminator[i];
    
    if(b / 10 != 0)
    {
        arr[i] = b / 10 + 161;
        i++;
        arr[i] = b % 10 + 161;
        i++;
    }
    else
    {
        arr[i] = b % 10 + 161;
        i++;
        arr[i] = 0;
        i++;
    }
    arr[i] = 0xFF;
    MenuPrint(gSystemText_Type, 15, 15);
    MenuPrint(arr, 18, 15);
}


u8 sub_808BF94(u8 a)
{
    if(gMain.newKeys & 0x10)
    {
        if(a <= 1)
            a++;
        else
            a = 0;
    }
    if(gMain.newKeys & 0x20)
    {
        if(a != 0)
            a--;
        else
            a = 2;
    }
    return a;
}

void sub_808BFD8(u8 a)
{
    u8 arr[3];
    
    arr[0] = 0xF;
    arr[1] = 0xF;
    arr[2] = 0xF;
    arr[a] = 0x8;
    
    sub_808BC60(gSystemText_Normal, 0x78, 0x68, arr[0]);
    sub_808BC60(gSystemText_LR, 0xA6, 0x68, arr[1]);
    sub_808BC60(gSystemText_LA, 0xBC, 0x68, arr[2]);
}
