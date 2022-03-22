#include "global.h"
#include "money.h"
#include "decompress.h"
#include "menu.h"
#include "sprite.h"
#include "string_util.h"
#include "graphics.h"

#define SPRITE_TAG_MONEY (0x2722)

extern u16 gSpecialVar_0x8005;

static EWRAM_DATA u8 gUnknown_02038734 = 0;

static const struct OamData gOamData_83CF558 =
{
    .y = 0,
    .affineMode = 0,
    .objMode = 0,
    .mosaic = 0,
    .bpp = 0,
    .shape = 1,
    .x = 0,
    .matrixNum = 0,
    .size = 2,
    .tileNum = 0,
    .priority = 0,
    .paletteNum = 0,
    .affineParam = 0,
};

const union AnimCmd gSpriteAnim_83CF560[] =
{
    ANIMCMD_FRAME(0, 0),
    ANIMCMD_END
};

const union AnimCmd *const gSpriteAnimTable_83CF568[] =
{
    gSpriteAnim_83CF560,
};

const struct SpriteTemplate gSpriteTemplate_83CF56C =
{
    .tileTag = 10018,
    .paletteTag = 10018,
    .oam = &gOamData_83CF558,
    .anims = gSpriteAnimTable_83CF568,
    .images = NULL,
    .affineAnims = gDummySpriteAffineAnimTable,
    .callback = SpriteCallbackDummy,
};

static const struct CompressedSpriteSheet gUnknown_083CF584 = {gMenuMoneyGfx, 256, SPRITE_TAG_MONEY};
static const struct CompressedSpritePalette gUnknown_083CF58C = {gMenuMoneyPal, SPRITE_TAG_MONEY};

bool8 IsEnoughMoney(u32 budget, u32 cost)
{
    if (budget >= cost)
    {
        return TRUE;
    }

    return FALSE;
}

void AddMoney(u32 *arg0, u32 arg1)
{
    if (*arg0 > *arg0 + arg1)
    {
        *arg0 = 999999;
        return;
    }

    *arg0 += arg1;
    if (*arg0 > 999999)
    {
        *arg0 = 999999;
    }
}

void RemoveMoney(u32 *arg0, u32 arg1)
{
    if (*arg0 < arg1)
    {
        *arg0 = 0;
    }
    else
    {
        *arg0 -= arg1;
    }
}

void GetMoneyAmountText(u8 *buffer, u32 amount, u8 arg2)
{
    u8 width;
    u8 i;

    if (amount > 999999)
        width = 7;
    else if (amount > 99999)
        width = 6;
    // A special sprite is used for 10000 in the decoration
    // shop, so be sure to account for this.
    else if (amount > 10000)
        width = 5;
    else if (amount > 999)
        width = 4;
    else if (amount > 99)
        width = 3;
    else if (amount > 9)
        width = 2;
    else
        width = 1;

    buffer[0] = EXT_CTRL_CODE_BEGIN;
    buffer[1] = 0x14;
    buffer[2] = 0x06;
    buffer += 3;

    for (i = 0; i < arg2 - width; i++)
    {
        buffer[0] = CHAR_SPACE;
        buffer += 1;
    }

    buffer[0] = CHAR_CURRENCY;
    buffer += 1;

    buffer = ConvertIntToDecimalString(buffer, amount);

    buffer[0] = EXT_CTRL_CODE_BEGIN;
    buffer[1] = 0x14;
    buffer[2] = 0x00;
    buffer[3] = EOS;
}

void PrintMoneyAmount(u32 amount, u8 size, u8 x, u8 y)
{
    u8 buffer[16];
    u8 stringWidth;

    GetMoneyAmountText(buffer, amount, size);
    stringWidth = GetStringWidthInMenuWindow(buffer);

    if (stringWidth >= (size + 1) * 8)
    {
        Menu_PrintText(buffer, x, y);
    }
    else
    {
        int xPlusOne = x + 1;
        Menu_PrintTextPixelCoords(buffer, (xPlusOne + size) * 8 - stringWidth, y * 8, 1);
    }
}

void sub_80B7AEC(u32 arg0, u8 right, u8 top)
{
    u8 buffer[32];
    u8 *ptr;

    ptr = &buffer[0];

    ptr[0] = CHAR_CURRENCY;
    ptr++;

    ptr = ConvertIntToDecimalString(ptr, arg0);

    MenuPrint_RightAligned(buffer, right, top);

#ifdef ENGLISH
    ptr[0] = 0xFC;
    ptr[1] = 0x14;
    ptr[2] = 0x00;
    ptr[3] = 0xFF;
#endif
}

void Draw10000Sprite(u8 var1, u8 var2, u32 var3)
{
    // 2D/3D array manipulation off the wazoo.
    // Converting to 2D/3D array casts makes it match less!
    u16 i;

    CpuFastCopy((void*)&gDecoration10000_Gfx[var3 * 0x100],(void*)(VRAM + 0x8000 + var2 * 0x3c0 + (var1 + 1) * 0x20),32 * 4);
    CpuFastCopy((void*)&gDecoration10000_Gfx[var3 * 0x100 + 0x80],(void*)(VRAM + 0x8000 + (var2 + 1) * 0x3c0 + (var1 + 1) * 0x20),32 * 4);

    for (i = 0; i < 4; i++)
    {
        ((u16 *)BG_SCREEN_ADDR(31))[var2 * 32 + var1 + i] = var2 * 30 + 1 + var1 + i - 4096;
         ((u16 *)BG_SCREEN_ADDR(31))[(var2 + 1) * 32 + var1 + i] = (var2 + 1) * 30 + 1 + var1 + i - 4096;
    };
}

void UpdateMoneyWindow(u32 amount, u8 x, u8 y)
{
    PrintMoneyAmount(amount, 6, x + 6, y + 1);
}

void OpenMoneyWindow(u32 amount, u8 x, u8 y)
{
    Menu_DrawStdWindowFrame(x, y, x + 13, y + 3);
    UpdateMoneyWindow(amount, x, y);

    LoadCompressedObjectPic(&gUnknown_083CF584);
    LoadCompressedObjectPalette(&gUnknown_083CF58C);

    gUnknown_02038734 = CreateSprite(&gSpriteTemplate_83CF56C, x * 8 + 19, y * 8 + 11, 0);
}

void CloseMoneyWindow(u8 x, u8 y)
{
    DestroySpriteAndFreeResources(&gSprites[gUnknown_02038734]);
    FreeSpritePaletteByTag(SPRITE_TAG_MONEY);
    Menu_EraseWindowRect(x, y, x + 13, y + 3);
}

bool8 HasEnoughMoneyFor(void)
{
    return IsEnoughMoney(gSaveBlock1.money, gSpecialVar_0x8005);
}

void PayMoneyFor(void)
{
    RemoveMoney(&gSaveBlock1.money, gSpecialVar_0x8005);
}
