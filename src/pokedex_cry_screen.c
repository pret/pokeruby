#include "global.h"
#include "pokedex_cry_screen.h"
#include "palette.h"
#include "sprite.h"
#include "ewram.h"
#include "trig.h"

struct Unk201C800 {
    s8 unk_0;
    s8 unk_1;
    u8 unk_2;
    u16 unk_4;
};

struct PokedexCryScreen_201C000
{
    u8 unk0000[0x10];
    u8 unk0010;
    u8 filler_0011[0x7EF];
    struct Unk201C800 unk0800;
};

#define ePokedexCryScreen (*(struct PokedexCryScreen_201C000 *)(gSharedMem + 0x1C000))

void sub_811A6D8(s8);

extern u8 gUnknown_03005E98;

// data/pokedex_cry_screen.o
extern const u16 gUnknown_083FAE7C[];
extern const u16 gUnknown_083FAF1C[];
extern const u8 gUnknown_083FAF3C[];
extern struct SpriteTemplate gSpriteTemplate_83FB774;
extern const struct SpriteSheet gCryMeterNeedleSpriteSheets[];
extern const struct SpritePalette gCryMeterNeedleSpritePalettes[];

#if ENGLISH
#define CRY_METER_MAP_WIDTH 10
#elif GERMAN
#define CRY_METER_MAP_WIDTH 32
#endif

u8 ShowPokedexCryScreen(struct CryRelatedStruct *cry, u8 arg1) {
    int returnVal = FALSE;

    switch (gUnknown_03005E98)
    {
    case 0:
        LZ77UnCompVram(gUnknown_083FAF3C, (void *) (VRAM + cry->unk0));
        LoadPalette(&gUnknown_083FAF1C, cry->paletteNo * 16, 0x20);
        gUnknown_03005E98 += 1;
        break;

    case 1:
    {
        void *vram;
        u8 row, col;
        u32 r12;
        int x, y;

        vram = BG_SCREEN_ADDR(cry->unk2);

        r12 = (u32) (cry->unk0 << 18) >> 23;

        for (row = 0; row < 8; row++)
        {
            for (col = 0; col < 10; col++)
            {
                y = row + cry->yPos;
                x = col + cry->xPos;
                *(u16 *) (vram + (y * 64 + x * 2)) = (gUnknown_083FAE7C[row * CRY_METER_MAP_WIDTH + col] | (cry->paletteNo << 12)) + r12;
            }
        }

        gUnknown_03005E98 += 1;
        break;
    }

    case 2:
    {
        LoadSpriteSheets(gCryMeterNeedleSpriteSheets);
        LoadSpritePalettes(gCryMeterNeedleSpritePalettes);
        EWRAM_1C800.unk_4 = CreateSprite(&gSpriteTemplate_83FB774, 40 + cry->xPos * 8, 56 + cry->yPos * 8, 1);
        EWRAM_1C800.unk_0 = 0x20;
        EWRAM_1C800.unk_1 = 0x20;
        EWRAM_1C800.unk_2 = 0;

        returnVal = TRUE;
        break;
    }
    }

    return returnVal;
}

void DestroyCryMeterNeedleSprite(void)
{
    FreeSpritePaletteByTag(GetSpritePaletteTagByPaletteNum(gSprites[EWRAM_1C800.unk_4].oam.paletteNum));
    DestroySprite(gSprites + EWRAM_1C800.unk_4);
}

void sub_811A534(struct Sprite * sprite)
{
    u16 i;
    s8 r3;
    s16 x;
    s16 y;
    struct ObjAffineSrcData sp04;
    struct OamMatrix sp0c;
    u8 * r0;

    gSprites[EWRAM_1C800.unk_4].oam.affineMode = ST_OAM_AFFINE_NORMAL;
    gSprites[EWRAM_1C800.unk_4].oam.affineParam = 0;
    switch (ePokedexCryScreen.unk0010)
    {
        case 0:
            EWRAM_1C800.unk_1 = 0x20;
            if (EWRAM_1C800.unk_0 > 0)
            {
                if (EWRAM_1C800.unk_2 != 1)
                    EWRAM_1C800.unk_2--;
            }
            else
                EWRAM_1C800.unk_2 = 5;
            break;
        case 2:
            r3 = 0;
            for (i = 0; i < 16; i++)
            {
                if (r3 < ePokedexCryScreen.unk0000[i])
                    r3 = ePokedexCryScreen.unk0000[i];
            }
            sub_811A6D8(r3 * 0xd0 / 0x100);
            break;
        case 6:
            r0 = &ePokedexCryScreen.unk0000[10];
            sub_811A6D8(*r0 * 0xd0 / 0x100);
            break;
    }
    if (EWRAM_1C800.unk_0 == EWRAM_1C800.unk_1)
        ;
    else if (EWRAM_1C800.unk_0 < EWRAM_1C800.unk_1)
    {
        if ((EWRAM_1C800.unk_0 += EWRAM_1C800.unk_2) > EWRAM_1C800.unk_1)
        {
            EWRAM_1C800.unk_0 = EWRAM_1C800.unk_1;
            EWRAM_1C800.unk_1 = 0;
        }
    }
    else
    {
        if ((EWRAM_1C800.unk_0 -= EWRAM_1C800.unk_2) < EWRAM_1C800.unk_1)
        {
            EWRAM_1C800.unk_0 = EWRAM_1C800.unk_1;
            EWRAM_1C800.unk_1 = 0;
        }
    }
    sp04.xScale = 0x100;
    sp04.yScale = 0x100;
    sp04.rotation = EWRAM_1C800.unk_0 * 256;
    ObjAffineSet(&sp04, &sp0c, 1, 2);
    SetOamMatrix(0, sp0c.a, sp0c.b, sp0c.c, sp0c.d);
    x = gSineTable[((EWRAM_1C800.unk_0 + 0x7F) & 0xFF)];
    y = gSineTable[((EWRAM_1C800.unk_0 + 0x7F) & 0xFF) + 0x40];
    sprite->pos2.x = x * 24 / 256;
    sprite->pos2.y = y * 24 / 256;
}

void sub_811A6D8(s8 a0)
{
    u16 r2 = (0x20 - a0) & 0xff;
    if (r2 > 0x20 && r2 < 0xe0)
        r2 = 0xe0;
    EWRAM_1C800.unk_1 = r2;
    EWRAM_1C800.unk_2 = 5;
}
