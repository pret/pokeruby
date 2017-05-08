#include "global.h"
#include "asm.h"
#include "palette.h"
#include "sprite.h"

struct Unk201C800 {
    u8 unk_0;
    u8 unk_1;
    u8 unk_2;
    u8 filler_3;
    u16 unk_4;
};

#define EWRAM_1C800 (*(struct Unk201C800 *)(unk_201C000 + 0x800))

extern u8 unk_201C000[];

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

        vram = (void *) BG_SCREEN_ADDR(cry->unk2);

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
