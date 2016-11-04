#include "global.h"
#include "menu.h"
#include "string_util.h"

#define MAX_COINS 9999

extern u8 gOtherText_Coins2[];

void PrintCoins(s32, u8, u8, u8);

void UpdateCoinsWindow(s32 a, u8 b, u8 c)
{
    PrintCoins(a, 4, b + 2, c + 1);
}

void ShowCoinsWindow(u32 a, u8 b, u8 c)
{
    MenuDrawTextWindow(b, c, b + 9, c + 3);
    UpdateCoinsWindow(a, b, c);
}

void HideCoinsWindow(u8 a, u8 b)
{
    MenuZeroFillWindowRect(a, b, a + 9, b + 3);
}


/*
void PrintCoins(s32 a, u8 b, u8 c, u8 d)
{
    u8 string[16];
    u8 *ptr;
    u8 r1;
    u8 r6 = c;
    u8 r5;
    
    ConvertIntToDecimalString(string, a);
    r5 = (b * 6 + 0x21 - 8 * (b + 2));
    r6 = r6 - r5 / 8;
    r5 &= 7;
    ptr = gStringVar1;
    if(r5 != 0)
    {
        ptr[0] = 0xFC;
        ptr[1] = 0x11;
        ptr[2] = 8 - r5;
        ptr += 3;
    }
    ptr[0] = 0xFC;
    ptr[1] = 0x11;
    ptr[2] = (StringLength(string) - r5) * 6;
    ptr += 3;
    StringCopy(ptr, string);
    MenuPrint(gOtherText_Coins2, r6, d);
}
*/

//#define NONMATCHING

#ifdef NONMATCHING
void PrintCoins(s32 a, u8 b, u8 c, u8 d)
{
    u8 string[16];
    u8 *ptr;
    u8 r5;
    u8 r6;
    
    ConvertIntToDecimalString(string, a);
    r5 = (b * 6 + 0x21 - 8 * (b + 2));
    r6 = r6 - r5 / 8;
    r5 &= 7;
    ptr = gStringVar1;
    if(r5 != 0)
    {
        ptr[0] = 0xFC;
        ptr[1] = 0x11;
        ptr[2] = 8 - r5;
        ptr += 3;
    }
    ptr[0] = 0xFC;
    ptr[1] = 0x11;
    ptr[2] = (StringLength(string) - r5) * 6;
    ptr += 3;
    StringCopy(ptr, string);
    MenuPrint(gOtherText_Coins2, r6, d);
}
#else
__attribute__((naked))
void PrintCoins(s32 a, u8 b, u8 c, u8 d)
{
    asm(".syntax unified\n\
    push {r4-r7,lr}\n\
    sub sp, 0x10\n\
    adds r4, r0, 0\n\
    lsls r1, 24\n\
    lsrs r1, 24\n\
    adds r5, r1, 0\n\
    lsls r2, 24\n\
    lsrs r6, r2, 24\n\
    lsls r3, 24\n\
    lsrs r7, r3, 24\n\
    mov r0, sp\n\
    adds r1, r4, 0\n\
    bl ConvertIntToDecimalString\n\
    lsls r1, r5, 1\n\
    adds r1, r5\n\
    lsls r1, 1\n\
    adds r1, 0x21\n\
    adds r0, r5, 0x2\n\
    lsls r0, 3\n\
    subs r1, r0\n\
    lsls r1, 24\n\
    lsrs r0, r1, 27\n\
    subs r0, r6, r0\n\
    lsls r0, 24\n\
    lsrs r6, r0, 24\n\
    movs r0, 0xE0\n\
    lsls r0, 19\n\
    ands r0, r1\n\
    lsrs r1, r0, 24\n\
    ldr r4, _0811A824 @ =gStringVar1\n\
    cmp r1, 0\n\
    beq _0811A7EA\n\
    movs r0, 0xFC\n\
    strb r0, [r4]\n\
    movs r0, 0x11\n\
    strb r0, [r4, 0x1]\n\
    movs r0, 0x8\n\
    subs r0, r1\n\
    strb r0, [r4, 0x2]\n\
    adds r4, 0x3\n\
_0811A7EA:\n\
    movs r0, 0xFC\n\
    strb r0, [r4]\n\
    movs r0, 0x11\n\
    strb r0, [r4, 0x1]\n\
    mov r0, sp\n\
    bl StringLength\n\
    lsls r0, 16\n\
    lsrs r0, 16\n\
    subs r0, r5, r0\n\
    lsls r1, r0, 1\n\
    adds r1, r0\n\
    lsls r1, 1\n\
    strb r1, [r4, 0x2]\n\
    adds r4, 0x3\n\
    adds r0, r4, 0\n\
    mov r1, sp\n\
    bl StringCopy\n\
    ldr r0, _0811A828 @ =gOtherText_Coins2\n\
    adds r1, r6, 0\n\
    adds r2, r7, 0\n\
    bl MenuPrint\n\
    add sp, 0x10\n\
    pop {r4-r7}\n\
    pop {r0}\n\
    bx r0\n\
    .align 2, 0\n\
_0811A824: .4byte gStringVar1\n\
_0811A828: .4byte gOtherText_Coins2  \n\
    .syntax divided\n");
}
#endif

u16 GetCoins(void)
{
    return gSaveBlock1.coins;
}

bool8 GiveCoins(u16 coins)
{
    u32 newCoins;
    
    if(GetCoins() >= MAX_COINS)
        return FALSE;
    newCoins = coins + gSaveBlock1.coins;
    if(gSaveBlock1.coins > (u16)newCoins)
        gSaveBlock1.coins = MAX_COINS;
    else
    {
        gSaveBlock1.coins = newCoins;
        if((u16)newCoins > MAX_COINS)
            gSaveBlock1.coins = MAX_COINS;
    }
    return TRUE;
}

bool8 TakeCoins(u16 coins)
{
    if(GetCoins() >= coins)
    {
        gSaveBlock1.coins -= coins;
        return TRUE;
    }
    else
        return FALSE;
}