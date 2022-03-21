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
            *(vu8 *)(REG_ADDR_WINOUT) |= 0x1F;
        gUnknown_0203A3D3 = REG_DISPCNT >> 0xF;
        gUnknown_0203A3D4 = *(vu8 *)(REG_BASE + REG_OFFSET_WINOUT + 1);
        REG_DISPCNT |= DISPCNT_OBJWIN_ON;
        *(vu8 *)(REG_ADDR_WINOUT + 1) = 0x10;
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
        *(vu8 *)(REG_BASE + REG_OFFSET_WINOUT + 1) = gUnknown_0203A3D4;
    }

    return;
}

void MenuCursor_SetPos814A880(u8 a1, u8 a2)
{
    struct Sprite *spr;

    if (gUnknown_0203A3D0 != 0x40)
    {
        spr = &gSprites[gUnknown_0203A3D0];
        spr->invisible = FALSE;
        spr->centerToCornerVecX = 0;
        spr->centerToCornerVecY = 0;
        spr->x = a1;
        spr->y = a2;
    }

    if (gUnknown_0203A3D1 != 0x40)
    {
        spr = &gSprites[gUnknown_0203A3D1];
        spr->invisible = FALSE;
        spr->centerToCornerVecX = 0;
        spr->centerToCornerVecY = 0;
        spr->x = a1;
        spr->y = a2;
    }

    return;
}

void sub_814A904(void)
{
    struct Sprite *spr;

    if (gUnknown_0203A3D0 != 0x40)
    {
        spr = &gSprites[gUnknown_0203A3D0];
        spr->invisible = TRUE;
    }

    if (gUnknown_0203A3D1 != 0x40)
    {
        spr = &gSprites[gUnknown_0203A3D1];
        spr->invisible = TRUE;
    }

    return;
}

#if ENGLISH
void sub_814A958(u8 a1)
{
    u8 r7;
    struct Subsprite *r4 = gMenuCursorSubsprites;
    s16 r2 = -1;
    s16 a = a1;
    s16 i;
    struct Sprite *sprite;

    *r4 = (struct Subsprite){ .x = 0, .y = 0, .shape = 2, .size = 0, .tileOffset = 0, .priority = 0 };
    r4->x = r2;
    r4++;

    r7 = 1;
    r2 = 1;

    while ((i = a - r2) >= 8)
    {
        if (i > 0x1F)
        {
            *r4 = gUnknown_0842F780;
            r4->x = r2;
            r2 += 0x20;
        }
        else if (a > 0x27 && i > 8)
        {
            *r4 = gUnknown_0842F780;
            r4->x = r2 - 32;
            r4->x += i & (~7);
            r2 += i & 0x18;
        }
        else
        {
            *r4 = gUnknown_0842F788;
            r4->x = r2;
            r2 += 8;
        }

        r4++;
        r7++;
    }

    *r4 = gUnknown_0842F790;
    r4->x = r2 + (i - 7);

    r7++;
    if (gUnknown_0203A3D0 != 64)
    {
        sprite = &gSprites[gUnknown_0203A3D0];
        SetSubspriteTables(sprite, &gSubspriteTables_842F5C0[r7]);
    }
    if (gUnknown_0203A3D1 != 64)
    {
        sprite = &gSprites[gUnknown_0203A3D1];
        SetSubspriteTables(sprite, &gSubspriteTables_842F5C0[r7]);
    }
}
#elif GERMAN
void sub_814A958(u8 a1)
{
    u8 r7;
    struct Subsprite *r4 = gMenuCursorSubsprites;
    s16 r2 = -1;
    s16 a = a1;
    s16 i;
    struct Sprite *sprite;

    *r4 = gUnknown_0842F780;
    r4->x = r2;
    r4++;

    r7 = 1;
    r2 = 1;

    while ((i = a - r2) >= 8)
    {
        if (i > 0x1F)
        {
            *r4 = gUnknown_0842F788;
            r4->x = r2;
            r2 += 0x20;
        }
        else if (a > 0x27 && i > 8)
        {
            *r4 = gUnknown_0842F788;
            r4->x = r2 - 32;
            r4->x += i & (~7);
            r2 += i & 0x18;
        }
        else
        {
            *r4 = gUnknown_0842F790;
            r4->x = r2;
            r2 += 8;
        }

        r4++;
        r7++;
    }

    *r4 = gUnknown_0842F798;
    r4->x = r2 + (i - 7);

    r7++;
    if (gUnknown_0203A3D0 != 64)
    {
        sprite = &gSprites[gUnknown_0203A3D0];
        SetSubspriteTables(sprite, &gSubspriteTables_842F5C0[r7]);
    }
    if (gUnknown_0203A3D1 != 64)
    {
        sprite = &gSprites[gUnknown_0203A3D1];
        SetSubspriteTables(sprite, &gSubspriteTables_842F5C0[r7]);
    }
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
        *(vu8 *)(REG_ADDR_WINOUT + 1) = gUnknown_0203A3D4;
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
        spr->invisible = FALSE;
        spr->centerToCornerVecX = 0;
        spr->centerToCornerVecY = 0;
        spr->x = a1;
        spr->y = a2;
    }
    return;
}

void sub_814ADC8()
{
    struct Sprite *spr;
    if (gUnknown_0203A3D2 != 0x40)
    {
        spr = &gSprites[gUnknown_0203A3D2];
        spr->invisible = TRUE;
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
