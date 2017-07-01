#include "global.h"
#include "money.h"
#include "decompress.h"
#include "menu.h"
#include "sprite.h"
#include "string_util.h"

#define SPRITE_TAG_MONEY (0x2722)

extern u16 gSpecialVar_0x8005;
extern u8 gUnknown_02038734;

extern const struct CompressedSpriteSheet gUnknown_083CF584;
extern const struct CompressedSpritePalette gUnknown_083CF58C;
extern const struct SpriteTemplate gSpriteTemplate_83CF56C;

bool8 IsEnoughMoney(u32 budget, u32 cost)
{
    if (budget >= cost)
    {
        return TRUE;
    }

    return FALSE;
}

void sub_80B79B8(u32 *arg0, u32 arg1)
{
    if (*arg0 > *arg0 + arg1)
    {
        *arg0 = 999999;
        return;
    }

    *arg0 = *arg0 + arg1;
    if (*arg0 > 999999)
    {
        *arg0 = 999999;
    }
}

void sub_80B79E0(u32 *arg0, u32 arg1)
{
    if (*arg0 < arg1)
    {
        *arg0 = 0;
    }
    else
    {
        *arg0 = *arg0 - arg1;
    }
}

void sub_80B79F8(u8 *buffer, u32 arg1, u8 arg2)
{
    u8 width;
    u8 i;

    if (arg1 > 999999)
    {
        width = 7;
    }
    else if (arg1 > 99999)
    {
        width = 6;
    }
    else if (arg1 > 10000)
    {
        width = 5;
    }
    else if (arg1 > 999)
    {
        width = 4;
    }
    else if (arg1 > 99)
    {
        width = 3;
    }
    else if (arg1 > 9)
    {
        width = 2;
    }
    else
    {
        width = 1;
    }

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

    buffer = ConvertIntToDecimalString(buffer, arg1);

    buffer[0] = EXT_CTRL_CODE_BEGIN;
    buffer[1] = 0x14;
    buffer[2] = 0x00;
    buffer[3] = EOS;
}

void sub_80B7A94(u32 arg0, u8 size, u8 x, u8 y)
{
    u8 buffer[16];
    u8 stringWidth;

    sub_80B79F8(buffer, arg0, size);
    stringWidth = sub_8072CA4(buffer);

    if (stringWidth >= (size + 1) * 8)
        MenuPrint(buffer, x, y);
    else
    {
        int xPlusOne = x + 1;
        MenuPrint_PixelCoords(buffer, (xPlusOne + size) * 8 - stringWidth, y * 8, 1);
    }
}

void sub_80B7AEC(u32 arg0, u8 left, u8 top)
{
    u8 buffer[32];
    u8 *ptr;

    ptr = &buffer[0];

    ptr[0] = CHAR_CURRENCY;
    ptr++;

    ptr = ConvertIntToDecimalString(ptr, arg0);

    MenuPrint_RightAligned(buffer, left, top);

#ifdef ENGLISH
    ptr[0] = 0xFC;
    ptr[1] = 0x14;
    ptr[2] = 0x00;
    ptr[3] = 0xFF;
#endif
}

__attribute__((naked))
void sub_80B7B34(void)
{
    asm(".syntax unified\n\
    push {r4-r7,lr}\n\
    mov r7, r9\n\
    mov r6, r8\n\
    push {r6,r7}\n\
    sub sp, 0x4\n\
    mov r8, r0\n\
    adds r5, r1, 0\n\
    mov r9, r2\n\
    lsls r0, 24\n\
    lsrs r0, 24\n\
    mov r8, r0\n\
    lsls r5, 24\n\
    lsrs r5, 24\n\
    mov r1, r9\n\
    lsls r1, 8\n\
    mov r9, r1\n\
    ldr r4, _080B7BD8 @ =gDecoration10000_Gfx\n\
    adds r0, r1, r4\n\
    lsls r6, r5, 4\n\
    subs r6, r5\n\
    lsls r1, r6, 6\n\
    mov r3, r8\n\
    adds r3, 0x1\n\
    lsls r3, 5\n\
    ldr r2, _080B7BDC @ =0x06008000\n\
    adds r3, r2\n\
    adds r1, r3\n\
    movs r2, 0x20\n\
    str r3, [sp]\n\
    bl CpuFastSet\n\
    adds r4, 0x80\n\
    add r9, r4\n\
    adds r0, r5, 0x1\n\
    lsls r4, r0, 4\n\
    subs r4, r0\n\
    lsls r1, r4, 6\n\
    ldr r3, [sp]\n\
    adds r1, r3\n\
    mov r0, r9\n\
    movs r2, 0x20\n\
    bl CpuFastSet\n\
    movs r3, 0\n\
    lsls r5, 5\n\
    mov r0, r8\n\
    adds r7, r5, r0\n\
    lsls r6, 1\n\
    adds r6, 0x1\n\
    add r6, r8\n\
    ldr r1, _080B7BE0 @ =0xfffff000\n\
    adds r5, r1, 0\n\
    ldr r0, _080B7BE4 @ =0x0600f800\n\
    mov r12, r0\n\
    ldr r1, _080B7BE8 @ =0x0600f840\n\
    mov r9, r1\n\
    lsls r4, 1\n\
    adds r4, 0x1\n\
    add r4, r8\n\
_080B7BAA:\n\
    adds r1, r7, r3\n\
    lsls r1, 1\n\
    mov r0, r12\n\
    adds r2, r1, r0\n\
    adds r0, r3, r6\n\
    adds r0, r5\n\
    strh r0, [r2]\n\
    add r1, r9\n\
    adds r0, r3, r4\n\
    adds r0, r5\n\
    strh r0, [r1]\n\
    adds r0, r3, 0x1\n\
    lsls r0, 16\n\
    lsrs r3, r0, 16\n\
    cmp r3, 0x3\n\
    bls _080B7BAA\n\
    add sp, 0x4\n\
    pop {r3,r4}\n\
    mov r8, r3\n\
    mov r9, r4\n\
    pop {r4-r7}\n\
    pop {r0}\n\
    bx r0\n\
    .align 2, 0\n\
_080B7BD8: .4byte gDecoration10000_Gfx\n\
_080B7BDC: .4byte 0x06008000\n\
_080B7BE0: .4byte 0xfffff000\n\
_080B7BE4: .4byte 0x0600f800\n\
_080B7BE8: .4byte 0x0600f840\n\
    .syntax divided\n");
}

void sub_80B7BEC(u32 arg0, u8 x, u8 y)
{
    sub_80B7A94(arg0, 6, x + 6, y + 1);
}

void sub_80B7C14(u32 arg0, u8 x, u8 y)
{
    MenuDrawTextWindow(x, y, x + 13, y + 3);
    sub_80B7BEC(arg0, x, y);

    LoadCompressedObjectPic(&gUnknown_083CF584);
    LoadCompressedObjectPalette(&gUnknown_083CF58C);

    gUnknown_02038734 = CreateSprite(&gSpriteTemplate_83CF56C, x * 8 + 19, y * 8 + 11, 0);
}

void RemoveMoneyLabelObject(u8 x, u8 y)
{
    DestroySpriteAndFreeResources(&gSprites[gUnknown_02038734]);
    FreeSpritePaletteByTag(SPRITE_TAG_MONEY);
    MenuZeroFillWindowRect(x, y, x + 13, y + 3);
}

bool8 sub_80B7CE8(void)
{
    return IsEnoughMoney(gSaveBlock1.money, gSpecialVar_0x8005);
}

void sub_80B7D0C(void)
{
    sub_80B79E0(&gSaveBlock1.money, gSpecialVar_0x8005);
}
