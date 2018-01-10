#include "global.h"
#include "coins.h"
#include "menu.h"
#include "string_util.h"
#include "strings.h"

#define MAX_COINS 9999

void UpdateCoinsWindow(s32 coins, u8 x, u8 y)
{
    PrintCoins(coins, 4, x + 2, y + 1);
}

void ShowCoinsWindow(u32 coins, u8 x, u8 y)
{
    Menu_DrawStdWindowFrame(x, y, x + 9, y + 3);
    UpdateCoinsWindow(coins, x, y);
}

void HideCoinsWindow(u8 x, u8 y)
{
    Menu_EraseWindowRect(x, y, x + 9, y + 3);
}

void PrintCoins(s32 coins, u8 b, u8 x, u8 y)
{
    u8 string[16];
    u8 *ptr;
    u8 r1;
    u8 foo;

    ConvertIntToDecimalString(string, coins);
    r1 = (b * 6 + 0x21 - 8 * (b + 2));
    x = x - r1 / 8;
    foo = r1 % 8;
    ptr = gStringVar1;
    if (foo)
    {
        ptr[0] = EXT_CTRL_CODE_BEGIN;
        ptr[1] = 0x11;
        ptr[2] = 8 - (foo);
        ptr += 3;
    }
    ptr[0] = EXT_CTRL_CODE_BEGIN;
    ptr[1] = 0x11;
    ptr[2] = (b - StringLength(string)) * 6;
    ptr += 3;
    StringCopy(ptr, string);
    Menu_PrintText(gOtherText_Coins2, x, y);
}

u16 GetCoins(void)
{
    return gSaveBlock1.coins;
}

bool8 GiveCoins(u16 coins)
{
    u32 newCoins;

    if (GetCoins() >= MAX_COINS)
        return FALSE;
    newCoins = coins + gSaveBlock1.coins;
    if (gSaveBlock1.coins > (u16)newCoins)
        gSaveBlock1.coins = MAX_COINS;
    else
    {
        gSaveBlock1.coins = newCoins;
        if ((u16)newCoins > MAX_COINS)
            gSaveBlock1.coins = MAX_COINS;
    }
    return TRUE;
}

bool8 TakeCoins(u16 coins)
{
    if (GetCoins() >= coins)
    {
        gSaveBlock1.coins -= coins;
        return TRUE;
    }
    else
        return FALSE;
}
