#include "global.h"
#include "menu_cursor.h"
#include "palette.h"
#include "sprite.h"

EWRAM_DATA static u16 gUnknown_0203A360[0x10] = {};
EWRAM_DATA static struct Subsprite gMenuCursorSubsprites[10] = {0};
EWRAM_DATA static u8 gUnknown_0203A3D0 = 0;
EWRAM_DATA static u8 gUnknown_0203A3D1 = 0;
EWRAM_DATA static u8 gUnknown_0203A3D2 = 0;
EWRAM_DATA static u8 gUnknown_0203A3D3 = 0;
EWRAM_DATA static u8 gUnknown_0203A3D4 = 0;

#if ENGLISH
#include "data/menu_cursor_en.h"
#elif GERMAN
#include "data/menu_cursor_de.h"
#endif // ENGLISH/GERMAN

void sub_814A590(void)
{
    gUnknown_0203A3D0 = 0x40;
    gUnknown_0203A3D1 = 0x40;
    gUnknown_0203A3D2 = 0x40;
    gUnknown_0203A3D3 = 0;
    gUnknown_0203A3D4 = 0;
}

u8 MenuCursor_Create814A5C0(u8 subpriority, u16 paletteTag, u8 a3, u16 a4, u8 a5)
{
    int v9;
    struct Sprite *v10;

    if (gUnknown_0203A3D0 != 0x40 || gUnknown_0203A3D1 != 0x40)
        DestroyMenuCursor();

    v9 = 1;
    if (paletteTag == 0xFFFF)
    {
        gUnknown_0203A360[a3 & 0xF] = a4;
        if (LoadSpritePalette(&gUnknown_0842F240) != 0xFF)
        {
            paletteTag = 0xFFF0;
            v9 = 0;
        }
    }

    LoadSpriteSheetDeferred(&gUnknown_0842F140[a3 & 0xF]);
    gUnknown_0203A3D0 = CreateSprite(&gSpriteTemplate_842F250[v9], 0, 160, subpriority);
    gUnknown_0203A3D1 = CreateSprite(&gSpriteTemplate_842F250[2], 0, 160, subpriority);
    if (gUnknown_0203A3D0 != 0x40)
    {
        v10 = &gSprites[gUnknown_0203A3D0];
        if (paletteTag == 0xFFFF)
            v10->oam.paletteNum = 0;
        else
            v10->oam.paletteNum = IndexOfSpritePaletteTag(paletteTag);
    }
    if (gUnknown_0203A3D1 != 0x40)
    {
        v10 = &gSprites[gUnknown_0203A3D1];
        if (paletteTag == 0xFFFF)
            v10->oam.paletteNum = 0;
        else
            v10->oam.paletteNum = IndexOfSpritePaletteTag(paletteTag);

        if (!(REG_DISPCNT & (DISPCNT_WIN0_ON | DISPCNT_WIN1_ON)))
            *(u8 *)(REG_ADDR_WINOUT) |= 0x1F;
        gUnknown_0203A3D3 = REG_DISPCNT >> 0xF;
        gUnknown_0203A3D4 = *(u8 *)(REG_BASE + REG_OFFSET_WINOUT + 1);
        REG_DISPCNT |= DISPCNT_OBJWIN_ON;
        *(u8 *)(REG_ADDR_WINOUT + 1) = 0x10;
    }
    sub_814A958(a5);
    return gUnknown_0203A3D0;
}

// unused
u8 sub_814A758(u8 subpriority, u8 a2, u8 a3, u8 a4)
{
    u8 result;
    struct Sprite *spr;

    result = MenuCursor_Create814A5C0(subpriority, 0, a3, 0, a4);
    if (result != 0x40)
    {
        spr = &gSprites[gUnknown_0203A3D0];
        spr->oam.paletteNum = a2;
    }
    return result;
}

u8 unref_sub_814A7AC(u8 a1, u16 a2, u8 a3)
{
    u16 i;
    u8 val1 = 0;
    u16 val2 = 0xF;

    for (i = 0; i <= 0xFF; i++)
    {
        if (gPlttBufferUnfaded[i] == a2)
        {
            val1 = (u8)(i >> 4);
            val2 = i & 0xF;
        }
    }

    return sub_814A758(a1, val1, val2, a3);
}

void DestroyMenuCursor(void)
{
    if (gUnknown_0203A3D0 != 0x40)
    {
        LoadTilesForSpriteSheet(&gUnknown_0842F140[0]);
        DestroySpriteAndFreeResources(&gSprites[gUnknown_0203A3D0]);
        gUnknown_0203A3D0 = 0x40;
    }

    if (gUnknown_0203A3D1 != 0x40)
    {
        DestroySpriteAndFreeResources(&gSprites[gUnknown_0203A3D1]);
        gUnknown_0203A3D1 = 0x40;
        if (!gUnknown_0203A3D3)
            REG_DISPCNT &= ~DISPCNT_OBJWIN_ON;
        *(u8 *)(REG_BASE + REG_OFFSET_WINOUT + 1) = gUnknown_0203A3D4;
    }

    return;
}

void MenuCursor_SetPos814A880(u8 a1, u8 a2)
{
    struct Sprite *spr;

    if (gUnknown_0203A3D0 != 0x40)
    {
        spr = &gSprites[gUnknown_0203A3D0];
        spr->invisible = 0;
        spr->centerToCornerVecX = 0;
        spr->centerToCornerVecY = 0;
        spr->pos1.x = a1;
        spr->pos1.y = a2;
    }

    if (gUnknown_0203A3D1 != 0x40)
    {
        spr = &gSprites[gUnknown_0203A3D1];
        spr->invisible = 0;
        spr->centerToCornerVecX = 0;
        spr->centerToCornerVecY = 0;
        spr->pos1.x = a1;
        spr->pos1.y = a2;
    }

    return;
}

void sub_814A904(void)
{
    struct Sprite *spr;

    if (gUnknown_0203A3D0 != 0x40)
    {
        spr = &gSprites[gUnknown_0203A3D0];
        spr->invisible = 1;
    }

    if (gUnknown_0203A3D1 != 0x40)
    {
        spr = &gSprites[gUnknown_0203A3D1];
        spr->invisible = 1;
    }

    return;
}

#if ENGLISH
#ifdef NONMATCHING
// Fix pls
void sub_814A958(u8 a)
{
    u8 r7;
    struct Subsprite *r4 = &gMenuCursorSubsprites[0];
    s16 r2 = -1;
    s32 _a = a;
    s16 r5;
    s16 i;

    *r4 = (struct Subsprite){.x = 0, .y = 0, .shape = 2, .size = 0, .tileOffset = 0, .priority = 0};
    r4->x = r2;
    r4++;
    r7 = 1;
    r2 = 1;
    r5 = a;
    i = r5;
    while ((i -= r2) >= 8)
    {
        if (i > 0x1F)
        {
            *r4 = gUnknown_0842F780;
            r4->x = r2;
            r2 += 32;
            r5 = a;
        }
        //_0814A9D4
        else
        {
            r5 = a;
            if (_a > 0x27 && i > 8)
            {
                *r4 = gUnknown_0842F780;
                r4->x = (r2 - 32) + (i & ~7);
                r2 += i & 0x18;
            }
            //_0814AA0A
            else
            {
                *r4 = gUnknown_0842F788;
                r4->x = r2;
                r2 += 8;
            }
        }
        //_0814AA20
        r4++;
        r7++;
        i = r5;
    }
    //_0814AA3A
    *r4 = gUnknown_0842F790;
    r4->x = r2 - 7 + i;
    r7++;
    if (gUnknown_0203A3D0 != 64)
        SetSubspriteTables(&gSprites[gUnknown_0203A3D0], gSubspriteTables_842F5C0 + r7);
    if (gUnknown_0203A3D1 != 64)
        SetSubspriteTables(&gSprites[gUnknown_0203A3D1], gSubspriteTables_842F5C0 + r7);
}
#else
NAKED
void sub_814A958(u8 a1)
{
    asm(".syntax unified\n\
    push {r4-r7,lr}\n\
    mov r7, r10\n\
    mov r6, r9\n\
    mov r5, r8\n\
    push {r5-r7}\n\
    sub sp, 0x4\n\
    lsls r0, 24\n\
    ldr r4, _0814A9C4\n\
    ldr r2, _0814A9C8\n\
    lsrs r0, 24\n\
    str r0, [sp]\n\
    movs r0, 0\n\
    movs r1, 0\n\
    movs r1, 0x2\n\
    str r0, [r4]\n\
    str r1, [r4, 0x4]\n\
    strh r2, [r4]\n\
    adds r4, 0x8\n\
    movs r7, 0x1\n\
    movs r2, 0x1\n\
    ldr r1, [sp]\n\
    subs r0, r1, 0x1\n\
    lsls r0, 16\n\
    lsrs r3, r0, 16\n\
    asrs r0, 16\n\
    cmp r0, 0x7\n\
    ble _0814AA3A\n\
    ldr r0, _0814A9CC\n\
    mov r12, r0\n\
    mov r8, r1\n\
    movs r1, 0x8\n\
    negs r1, r1\n\
    mov r10, r1\n\
    ldr r5, _0814A9D0\n\
    mov r9, r5\n\
_0814A99E:\n\
    lsls r0, r3, 16\n\
    asrs r3, r0, 16\n\
    cmp r3, 0x1F\n\
    ble _0814A9D4\n\
    mov r6, r12\n\
    ldr r0, [r6]\n\
    ldr r1, [r6, 0x4]\n\
    str r0, [r4]\n\
    str r1, [r4, 0x4]\n\
    strh r2, [r4]\n\
    lsls r0, r2, 16\n\
    movs r1, 0x80\n\
    lsls r1, 14\n\
    adds r0, r1\n\
    lsrs r2, r0, 16\n\
    ldr r3, [sp]\n\
    lsls r5, r3, 16\n\
    b _0814AA20\n\
    .align 2, 0\n\
_0814A9C4: .4byte gMenuCursorSubsprites\n\
_0814A9C8: .4byte 0x0000ffff\n\
_0814A9CC: .4byte gUnknown_0842F780\n\
_0814A9D0: .4byte gUnknown_0842F788\n\
_0814A9D4:\n\
    ldr r6, [sp]\n\
    lsls r5, r6, 16\n\
    mov r0, r8\n\
    cmp r0, 0x27\n\
    ble _0814AA0A\n\
    cmp r3, 0x8\n\
    ble _0814AA0A\n\
    mov r6, r12\n\
    ldr r0, [r6]\n\
    ldr r1, [r6, 0x4]\n\
    str r0, [r4]\n\
    str r1, [r4, 0x4]\n\
    lsls r1, r2, 16\n\
    asrs r1, 16\n\
    adds r2, r1, 0\n\
    subs r2, 0x20\n\
    adds r0, r3, 0\n\
    mov r6, r10\n\
    ands r0, r6\n\
    adds r2, r0\n\
    strh r2, [r4]\n\
    movs r0, 0x18\n\
    ands r0, r3\n\
    adds r1, r0\n\
    lsls r1, 16\n\
    lsrs r2, r1, 16\n\
    b _0814AA20\n\
_0814AA0A:\n\
    mov r3, r9\n\
    ldr r0, [r3]\n\
    ldr r1, [r3, 0x4]\n\
    str r0, [r4]\n\
    str r1, [r4, 0x4]\n\
    strh r2, [r4]\n\
    lsls r0, r2, 16\n\
    movs r6, 0x80\n\
    lsls r6, 12\n\
    adds r0, r6\n\
    lsrs r2, r0, 16\n\
_0814AA20:\n\
    adds r4, 0x8\n\
    adds r0, r7, 0x1\n\
    lsls r0, 24\n\
    lsrs r7, r0, 24\n\
    asrs r1, r5, 16\n\
    lsls r0, r2, 16\n\
    asrs r0, 16\n\
    subs r1, r0\n\
    lsls r1, 16\n\
    lsrs r3, r1, 16\n\
    asrs r1, 16\n\
    cmp r1, 0x7\n\
    bgt _0814A99E\n\
_0814AA3A:\n\
    ldr r5, _0814AAA8\n\
    ldr r0, [r5]\n\
    ldr r1, [r5, 0x4]\n\
    str r0, [r4]\n\
    str r1, [r4, 0x4]\n\
    lsls r1, r2, 16\n\
    asrs r1, 16\n\
    subs r1, 0x7\n\
    lsls r0, r3, 16\n\
    asrs r0, 16\n\
    adds r0, r1\n\
    strh r0, [r4]\n\
    adds r0, r7, 0x1\n\
    lsls r0, 24\n\
    lsrs r7, r0, 24\n\
    ldr r6, _0814AAAC\n\
    ldrb r0, [r6]\n\
    cmp r0, 0x40\n\
    beq _0814AA78\n\
    adds r1, r0, 0\n\
    lsls r0, r1, 4\n\
    adds r0, r1\n\
    lsls r0, 2\n\
    ldr r1, _0814AAB0\n\
    adds r2, r0, r1\n\
    lsls r1, r7, 3\n\
    ldr r0, _0814AAB4\n\
    adds r1, r0\n\
    adds r0, r2, 0\n\
    bl SetSubspriteTables\n\
_0814AA78:\n\
    ldr r1, _0814AAB8\n\
    ldrb r0, [r1]\n\
    cmp r0, 0x40\n\
    beq _0814AA98\n\
    adds r1, r0, 0\n\
    lsls r0, r1, 4\n\
    adds r0, r1\n\
    lsls r0, 2\n\
    ldr r1, _0814AAB0\n\
    adds r2, r0, r1\n\
    lsls r1, r7, 3\n\
    ldr r0, _0814AAB4\n\
    adds r1, r0\n\
    adds r0, r2, 0\n\
    bl SetSubspriteTables\n\
_0814AA98:\n\
    add sp, 0x4\n\
    pop {r3-r5}\n\
    mov r8, r3\n\
    mov r9, r4\n\
    mov r10, r5\n\
    pop {r4-r7}\n\
    pop {r0}\n\
    bx r0\n\
    .align 2, 0\n\
_0814AAA8: .4byte gUnknown_0842F790\n\
_0814AAAC: .4byte gUnknown_0203A3D0\n\
_0814AAB0: .4byte gSprites\n\
_0814AAB4: .4byte gSubspriteTables_842F5C0\n\
_0814AAB8: .4byte gUnknown_0203A3D1\n\
    .syntax divided\n");
}
#endif
#elif GERMAN
NAKED
void sub_814A958(u8 a1)
{
    asm(".syntax unified\n\
    push {r4-r7,lr}\n\
    mov r7, r10\n\
    mov r6, r9\n\
    mov r5, r8\n\
    push {r5-r7}\n\
    sub sp, 0x4\n\
    lsls r0, 24\n\
    ldr r4, _0814A9C4 @ =gMenuCursorSubsprites\n\
    ldr r2, _0814A9C8 @ =0x0000ffff\n\
    lsrs r0, 24\n\
    str r0, [sp]\n\
    ldr r0, _0814A9CC @ =gUnknown_0842F780\n\
    ldr r1, [r0, 0x4]\n\
    ldr r0, [r0]\n\
    str r0, [r4]\n\
    str r1, [r4, 0x4]\n\
    strh r2, [r4]\n\
    adds r4, 0x8\n\
    movs r7, 0x1\n\
    movs r2, 0x1\n\
    ldr r1, [sp]\n\
    subs r0, r1, 0x1\n\
    lsls r0, 16\n\
    lsrs r3, r0, 16\n\
    asrs r0, 16\n\
    cmp r0, 0x7\n\
    ble _0814AA3E\n\
    ldr r0, _0814A9D0 @ =gUnknown_0842F788\n\
    mov r12, r0\n\
    mov r8, r1\n\
    movs r1, 0x8\n\
    negs r1, r1\n\
    mov r10, r1\n\
    ldr r5, _0814A9D4 @ =gUnknown_0842F790\n\
    mov r9, r5\n\
_0814A99E:\n\
    lsls r0, r3, 16\n\
    asrs r3, r0, 16\n\
    cmp r3, 0x1F\n\
    ble _0814A9D8\n\
    mov r6, r12\n\
    ldr r0, [r6]\n\
    ldr r1, [r6, 0x4]\n\
    str r0, [r4]\n\
    str r1, [r4, 0x4]\n\
    strh r2, [r4]\n\
    lsls r0, r2, 16\n\
    movs r1, 0x80\n\
    lsls r1, 14\n\
    adds r0, r1\n\
    lsrs r2, r0, 16\n\
    ldr r3, [sp]\n\
    lsls r5, r3, 16\n\
    b _0814AA24\n\
    .align 2, 0\n\
_0814A9C4: .4byte gMenuCursorSubsprites\n\
_0814A9C8: .4byte 0x0000ffff\n\
_0814A9CC: .4byte gUnknown_0842F780\n\
_0814A9D0: .4byte gUnknown_0842F788\n\
_0814A9D4: .4byte gUnknown_0842F790\n\
_0814A9D8:\n\
    ldr r6, [sp]\n\
    lsls r5, r6, 16\n\
    mov r0, r8\n\
    cmp r0, 0x27\n\
    ble _0814AA0E\n\
    cmp r3, 0x8\n\
    ble _0814AA0E\n\
    mov r6, r12\n\
    ldr r0, [r6]\n\
    ldr r1, [r6, 0x4]\n\
    str r0, [r4]\n\
    str r1, [r4, 0x4]\n\
    lsls r1, r2, 16\n\
    asrs r1, 16\n\
    adds r2, r1, 0\n\
    subs r2, 0x20\n\
    adds r0, r3, 0\n\
    mov r6, r10\n\
    ands r0, r6\n\
    adds r2, r0\n\
    strh r2, [r4]\n\
    movs r0, 0x18\n\
    ands r0, r3\n\
    adds r1, r0\n\
    lsls r1, 16\n\
    lsrs r2, r1, 16\n\
    b _0814AA24\n\
_0814AA0E:\n\
    mov r3, r9\n\
    ldr r0, [r3]\n\
    ldr r1, [r3, 0x4]\n\
    str r0, [r4]\n\
    str r1, [r4, 0x4]\n\
    strh r2, [r4]\n\
    lsls r0, r2, 16\n\
    movs r6, 0x80\n\
    lsls r6, 12\n\
    adds r0, r6\n\
    lsrs r2, r0, 16\n\
_0814AA24:\n\
    adds r4, 0x8\n\
    adds r0, r7, 0x1\n\
    lsls r0, 24\n\
    lsrs r7, r0, 24\n\
    asrs r1, r5, 16\n\
    lsls r0, r2, 16\n\
    asrs r0, 16\n\
    subs r1, r0\n\
    lsls r1, 16\n\
    lsrs r3, r1, 16\n\
    asrs r1, 16\n\
    cmp r1, 0x7\n\
    bgt _0814A99E\n\
_0814AA3E:\n\
    ldr r5, _0814AAAC @ =gUnknown_0842F798\n\
    ldr r0, [r5]\n\
    ldr r1, [r5, 0x4]\n\
    str r0, [r4]\n\
    str r1, [r4, 0x4]\n\
    lsls r1, r2, 16\n\
    asrs r1, 16\n\
    subs r1, 0x7\n\
    lsls r0, r3, 16\n\
    asrs r0, 16\n\
    adds r0, r1\n\
    strh r0, [r4]\n\
    adds r0, r7, 0x1\n\
    lsls r0, 24\n\
    lsrs r7, r0, 24\n\
    ldr r6, _0814AAB0 @ =gUnknown_0203A3D0\n\
    ldrb r0, [r6]\n\
    cmp r0, 0x40\n\
    beq _0814AA7C\n\
    adds r1, r0, 0\n\
    lsls r0, r1, 4\n\
    adds r0, r1\n\
    lsls r0, 2\n\
    ldr r1, _0814AAB4 @ =gSprites\n\
    adds r2, r0, r1\n\
    lsls r1, r7, 3\n\
    ldr r0, _0814AAB8 @ =gSubspriteTables_842F5C0\n\
    adds r1, r0\n\
    adds r0, r2, 0\n\
    bl SetSubspriteTables\n\
_0814AA7C:\n\
    ldr r1, _0814AABC @ =gUnknown_0203A3D1\n\
    ldrb r0, [r1]\n\
    cmp r0, 0x40\n\
    beq _0814AA9C\n\
    adds r1, r0, 0\n\
    lsls r0, r1, 4\n\
    adds r0, r1\n\
    lsls r0, 2\n\
    ldr r1, _0814AAB4 @ =gSprites\n\
    adds r2, r0, r1\n\
    lsls r1, r7, 3\n\
    ldr r0, _0814AAB8 @ =gSubspriteTables_842F5C0\n\
    adds r1, r0\n\
    adds r0, r2, 0\n\
    bl SetSubspriteTables\n\
_0814AA9C:\n\
    add sp, 0x4\n\
    pop {r3-r5}\n\
    mov r8, r3\n\
    mov r9, r4\n\
    mov r10, r5\n\
    pop {r4-r7}\n\
    pop {r0}\n\
    bx r0\n\
    .align 2, 0\n\
_0814AAAC: .4byte gUnknown_0842F798\n\
_0814AAB0: .4byte gUnknown_0203A3D0\n\
_0814AAB4: .4byte gSprites\n\
_0814AAB8: .4byte gSubspriteTables_842F5C0\n\
_0814AABC: .4byte gUnknown_0203A3D1\n\
    .syntax divided\n");
}
#endif

void sub_814AABC(void (*callback)(struct Sprite *))
{
    struct Sprite *spr;

    if (gUnknown_0203A3D0 != 0x40)
    {
        spr = &gSprites[gUnknown_0203A3D0];
        spr->callback = callback;
    }

    if (gUnknown_0203A3D1 != 0x40)
    {
        spr = &gSprites[gUnknown_0203A3D1];
        spr->callback = callback;
    }

    return;
}

void sub_814AAF8(u16 a1)
{
    struct Sprite *spr;
    u8 v2;
    u8 v3;
    u16 v4;

    if (gUnknown_0203A3D0 != 0x40)
    {
        spr = &gSprites[gUnknown_0203A3D0];
        if (spr->template->paletteTag == 0xFFFF)
        {
            for (v2 = 0, v3 = 0xF, v4 = 0; v4 <= 0xFF; v4++)
            {
                if (gPlttBufferUnfaded[v4] == a1)
                {
                    v2 = v4 >> 4;
                    v3 = v4 & 0xF;
                }
            }
            spr->oam.paletteNum = v2;
            RequestSpriteSheetCopy(&gUnknown_0842F140[v3 & 0xF]);
        }
    }
    return;
}

void sub_814AB84(void)
{
    struct Sprite *spr;

    if (gUnknown_0203A3D1 != 0x40)
    {
        spr = &gSprites[gUnknown_0203A3D1];
        FreeSpriteOamMatrix(spr);
        DestroySprite(spr);
        gUnknown_0203A3D1 = 0x40;

        if (!gUnknown_0203A3D3)
            REG_DISPCNT &= ~DISPCNT_OBJWIN_ON;
        *(u8 *)(REG_ADDR_WINOUT + 1) = gUnknown_0203A3D4;
    }
    return;
}

void unref_sub_814ABE4(int a1)
{
    struct Sprite *spr;

    CpuCopy16(gUnknown_0842F5BC[a1], &gMenuCursorSubsprites, 80);

    if (gUnknown_0203A3D0 != 0x40)
    {
        spr = &gSprites[gUnknown_0203A3D0];
        SetSubspriteTables(spr, &gUnknown_0842F758[a1]);
    }
    if (gUnknown_0203A3D1 != 0x40)
    {
        spr = &gSprites[gUnknown_0203A3D1];
        SetSubspriteTables(spr, &gUnknown_0842F758[a1]);
    }
    return;
}

u8 CreateBlendedOutlineCursor(u8 subpriority, u16 paletteTag, u8 a3, u16 a4, u8 a5)
{
    int v8;
    struct Sprite *spr;

    if (gUnknown_0203A3D2 != 0x40)
        MenuCursor_Destroy814AD44();

    v8 = 1;

    if (paletteTag == 0xFFFF)
    {
        gUnknown_0203A360[a3 & 0xF] = a4;
        if (LoadSpritePalette(&gUnknown_0842F248) != 0xFF )
        {
            paletteTag = 0xFFF1;
            v8 = 0;
        }
    }

    LoadSpriteSheetDeferred(&gUnknown_0842F1C0[a3 & 0xF]);
#if ENGLISH
    gUnknown_0203A3D2 = CreateSprite(&gSpriteTemplate_842F298[v8], 0, 160, subpriority);
#elif GERMAN
    gUnknown_0203A3D2 = CreateSprite(&gSpriteTemplate_842F298[v8], 0, 161, subpriority);
#endif

    if (gUnknown_0203A3D2 != 0x40)
    {
        spr = &gSprites[gUnknown_0203A3D2];

        if (paletteTag == 0xFFFF)
            spr->oam.paletteNum = 0;
        else
            spr->oam.paletteNum = IndexOfSpritePaletteTag(paletteTag);
    }
    sub_814ADF4(a5);

    return gUnknown_0203A3D2;
}

void MenuCursor_Destroy814AD44(void)
{
    if (gUnknown_0203A3D2 != 0x40)
    {
        LoadTilesForSpriteSheet(&gUnknown_0842F1C0[0]);
        DestroySpriteAndFreeResources(&gSprites[gUnknown_0203A3D2]);
        gUnknown_0203A3D2 = 0x40;
    }
    return;
}

void MenuCursor_SetPos814AD7C(u8 a1, u8 a2)
{
    struct Sprite *spr;
    if (gUnknown_0203A3D2 != 0x40)
    {
        spr = &gSprites[gUnknown_0203A3D2];
        spr->invisible = 0;
        spr->centerToCornerVecX = 0;
        spr->centerToCornerVecY = 0;
        spr->pos1.x = a1;
        spr->pos1.y = a2;
    }
    return;
}

void sub_814ADC8()
{
    struct Sprite *spr;
    if (gUnknown_0203A3D2 != 0x40)
    {
        spr = &gSprites[gUnknown_0203A3D2];
        spr->invisible = 1;
    }
    return;
}

void sub_814ADF4(u8 a1)
{
    if (a1 > 0x12)
        a1 = 0;

    if (gUnknown_0203A3D2 != 0x40)
        SetSubspriteTables(&gSprites[gUnknown_0203A3D2], &gSubspriteTables_842F6C0[a1]);
    return;
}

#if GERMAN
void nullsub_814B200(void)
{
}
#endif
