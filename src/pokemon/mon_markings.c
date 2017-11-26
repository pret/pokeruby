#include "global.h"
#include "main.h"
#include "menu_cursor.h"
#include "text_window.h"
#include "constants/songs.h"
#include "sound.h"
#include "sprite.h"

#ifdef GERMAN
#define MENU_TEXT_SPRITE_X_OFFSET 24
#else
#define MENU_TEXT_SPRITE_X_OFFSET 32
#endif

struct PokemonMarkMenu
{
    /*0x0000*/ u16 baseTileTag;
    /*0x0002*/ u16 basePaletteTag;
    /*0x0004*/ u8 markings; // bit flags
    /*0x0005*/ s8 cursorPos;
    /*0x0006*/ bool8 markingsArray[4];
    /*0x000A*/ u8 cursorBaseY;
    /*0x000B*/ bool8 spriteSheetLoadRequired;
    /*0x000C*/ struct Sprite *menuWindowSprites[2]; // upper and lower halves of menu window
    /*0x0014*/ struct Sprite *menuMarkingSprites[4];
    /*0x0024*/ struct Sprite *menuTextSprite;
    /*0x0028*/ const u8 *frameTiles;
    /*0x002C*/ const u16 *framePalette;
    /*0x0030*/ u8 menuWindowSpriteTiles[0x1000];
    /*0x1030*/ u8 filler1030[0x80];
    /*0x10B0*/ u8 tileLoadState;
};

extern u8 gPokenavConditionMenuMisc_Gfx[];
extern u16 gUnknown_08E966B8[];

extern u16 gUnknown_083E49F4[];
extern u8 gUnknown_083E4A14[];
extern struct OamData gOamData_83E5214;
extern struct OamData gOamData_83E521C;
extern const union AnimCmd *const gSpriteAnimTable_83E5274[];
extern const union AnimCmd *const gSpriteAnimTable_83E52AC[];
extern struct OamData gOamData_83E52B4;
extern const union AnimCmd *const gSpriteAnimTable_83E533C[];

static EWRAM_DATA struct PokemonMarkMenu *sMenu = NULL;

void sub_80F761C(s16, s16, u16, u16);
void nullsub_65(struct Sprite *);
void sub_80F78CC(struct Sprite *);
void sub_80F7908(struct Sprite *);
struct Sprite *sub_80F7960(u16, u16, u16 *, u16);

void sub_80F727C(struct PokemonMarkMenu *ptr)
{
    sMenu = ptr;
    sMenu->spriteSheetLoadRequired = FALSE;
}

void sub_80F728C(void)
{
    const struct FrameGraphics *frame = GetTextWindowFrameGraphics(gSaveBlock2.optionsWindowFrameType);
    sMenu->frameTiles = frame->tiles;
    sMenu->framePalette = frame->palette;
    sMenu->tileLoadState = 0;
    CpuFill16(0, sMenu->menuWindowSpriteTiles, sizeof(sMenu->menuWindowSpriteTiles));
}

bool8 sub_80F72D4(void)
{
    u16 i;
    u8 *dest = sMenu->menuWindowSpriteTiles + sMenu->tileLoadState * 0x100;

    switch (sMenu->tileLoadState)
    {
    case 0:
        CpuFastCopy(sMenu->frameTiles, dest, TILE_SIZE_4BPP);
        for (i = 0; i < 6; i++)
        {
            CpuFastCopy(sMenu->frameTiles + TILE_SIZE_4BPP, dest + TILE_SIZE_4BPP * (i + 1), TILE_SIZE_4BPP);
        }
        CpuFastCopy(sMenu->frameTiles + TILE_SIZE_4BPP * 2, dest + TILE_SIZE_4BPP * 7, TILE_SIZE_4BPP);
        sMenu->tileLoadState++;
        break;
    default:
        CpuFastCopy(sMenu->frameTiles + TILE_SIZE_4BPP * 3, dest, TILE_SIZE_4BPP);
        for (i = 0; i < 6; i++)
        {
            CpuFastCopy(sMenu->frameTiles + TILE_SIZE_4BPP * 4, dest + TILE_SIZE_4BPP * (i + 1), TILE_SIZE_4BPP);
        }
        CpuFastCopy(sMenu->frameTiles + TILE_SIZE_4BPP * 5, dest + TILE_SIZE_4BPP * 7, TILE_SIZE_4BPP);
        sMenu->tileLoadState++;
        break;
    case 13:
        CpuFastCopy(sMenu->frameTiles + TILE_SIZE_4BPP * 6, dest, TILE_SIZE_4BPP);
        for (i = 0; i < 6; i++)
        {
            CpuFastCopy(sMenu->frameTiles + TILE_SIZE_4BPP * 7, dest + TILE_SIZE_4BPP * (i + 1), TILE_SIZE_4BPP);
        }
        CpuFastCopy(sMenu->frameTiles + TILE_SIZE_4BPP * 8, dest + TILE_SIZE_4BPP * 7, TILE_SIZE_4BPP);
        sMenu->tileLoadState++;
        return FALSE;
    case 14:
        return FALSE;
    }

    return TRUE;
}

void sub_80F7404(void)
{
    sub_80F728C();
    while (sub_80F72D4())
        ;
}

void sub_80F7418(u8 markings, s16 x, s16 y)
{
    u16 i;
    sMenu->cursorPos = 0;
    sMenu->markings = markings;
    for (i = 0; i < 4; i++)
        sMenu->markingsArray[i] = (sMenu->markings >> i) & 1;
    DestroyMenuCursor();
    sub_80F761C(x, y, sMenu->baseTileTag, sMenu->basePaletteTag);
}

void sub_80F7470(void)
{
    u16 i;

    for (i = 0; i < 3; i++)
    {
        FreeSpriteTilesByTag(sMenu->baseTileTag + i);
    }

    FreeSpritePaletteByTag(sMenu->basePaletteTag);
    FreeSpritePaletteByTag(sMenu->basePaletteTag + 1);

    for (i = 0; i < 2; i++)
    {
        if (!sMenu->menuWindowSprites[i])
            return;
        DestroySprite(sMenu->menuWindowSprites[i]);
    }

    for (i = 0; i < 4; i++)
    {
        if (!sMenu->menuMarkingSprites[i])
            return;
        DestroySprite(sMenu->menuMarkingSprites[i]);
    }

    DestroyMenuCursor();

    if (sMenu->menuTextSprite)
        DestroySprite(sMenu->menuTextSprite);
}

bool8 sub_80F7500(void)
{
    u16 i;
    struct SpriteSheet sheets[3] =
    {
        { sMenu->menuWindowSpriteTiles, 0x1000, sMenu->baseTileTag },
        { gPokenavConditionMenuMisc_Gfx, 0x520, sMenu->baseTileTag + 1 },
        { NULL, 0, 0 }
    };

    if (sMenu->spriteSheetLoadRequired)
    {
        LoadTilesForSpriteSheets(sheets);
        sMenu->spriteSheetLoadRequired = FALSE;
    }

    if (gMain.newKeys & DPAD_UP)
    {
        s8 pos;
        PlaySE(SE_SELECT);
        pos = --sMenu->cursorPos;
        if (pos < 0)
            sMenu->cursorPos = 5;
        return TRUE;
    }

    if (gMain.newKeys & DPAD_DOWN)
    {
        s8 pos;
        PlaySE(SE_SELECT);
        pos = ++sMenu->cursorPos;
        if (pos > 5)
            sMenu->cursorPos = 0;
        return TRUE;
    }

    if (gMain.newKeys & A_BUTTON)
    {
        PlaySE(SE_SELECT);

        switch (sMenu->cursorPos)
        {
        case 4:
            sMenu->markings = 0;
            for (i = 0; i < 4; i++)
                sMenu->markings |= sMenu->markingsArray[i] << i;
            return FALSE;
        case 5:
            return FALSE;
        }

        sMenu->markingsArray[sMenu->cursorPos] = !sMenu->markingsArray[sMenu->cursorPos];
        return TRUE;
    }

    if (gMain.newKeys & B_BUTTON)
    {
        PlaySE(SE_SELECT);
        return FALSE;
    }

    return TRUE;
}

void sub_80F761C(s16 x, s16 y, u16 baseTileTag, u16 basePaletteTag)
{
    u16 i;
    u8 spriteId;

    struct SpriteSheet sheets[] =
    {
        { sMenu->menuWindowSpriteTiles, 0x1000, baseTileTag },
        { gPokenavConditionMenuMisc_Gfx, 0x520, baseTileTag + 1 },
        { NULL, 0 }
    };

    struct SpritePalette palettes[] =
    {
        { sMenu->framePalette, basePaletteTag },
        { gUnknown_08E966B8, basePaletteTag + 1},
        { NULL, 0 }
    };

    struct SpriteTemplate sprTemplate =
    {
        baseTileTag,
        basePaletteTag,
        &gOamData_83E5214,
        gSpriteAnimTable_83E52AC,
        NULL,
        gDummySpriteAffineAnimTable,
        nullsub_65,
    };

    sMenu->spriteSheetLoadRequired = TRUE;
    AllocTilesForSpriteSheets(sheets);
    LoadSpritePalettes(palettes);

    for (i = 0; i < 2; i++)
    {
        spriteId = CreateSprite(&sprTemplate, x + 32, y + 32, 2);
        if (spriteId != 64)
        {
            sMenu->menuWindowSprites[i] = &gSprites[spriteId];
            StartSpriteAnim(&gSprites[spriteId], i);
        }
        else
        {
            sMenu->menuWindowSprites[i] = NULL;
            return;
        }
    }

    sMenu->menuWindowSprites[1]->pos1.y = y + 96;

    sprTemplate.tileTag++;
    sprTemplate.paletteTag++;
    sprTemplate.anims = gSpriteAnimTable_83E5274;
    sprTemplate.callback = sub_80F78CC;
    sprTemplate.oam = &gOamData_83E521C;

    for (i = 0; i < 4; i++)
    {
        spriteId = CreateSprite(&sprTemplate, x + 32, y + 16 + 16 * i, 1);
        if (spriteId != 64)
        {
            sMenu->menuMarkingSprites[i] = &gSprites[spriteId];
            gSprites[spriteId].data[0] = i;
        }
        else
        {
            sMenu->menuMarkingSprites[i] = NULL;
            return;
        }
    }

    sprTemplate.callback = SpriteCallbackDummy;

    spriteId = CreateSprite(&sprTemplate, 0, 0, 1);

    if (spriteId != 64)
    {
        sMenu->menuTextSprite = &gSprites[spriteId];
        sMenu->menuTextSprite->oam.shape = ST_OAM_H_RECTANGLE;
        sMenu->menuTextSprite->oam.size = 3;
        StartSpriteAnim(sMenu->menuTextSprite, 9);
        sMenu->menuTextSprite->pos1.x = x + MENU_TEXT_SPRITE_X_OFFSET;
        sMenu->menuTextSprite->pos1.y = y + 80;
        CalcCenterToCornerVec(sMenu->menuTextSprite, 1, 2, 0);
    }
    else
    {
        sMenu->menuTextSprite = NULL;
    }

    sMenu->cursorBaseY = y + 8;
    sub_814A5C0(0, basePaletteTag + 1, 15, 0, 0x30);
    sub_814A880(x + 8, sMenu->cursorBaseY);
    sub_814AABC(sub_80F7908);
}

void nullsub_65(struct Sprite *sprite)
{
}

void sub_80F78CC(struct Sprite *sprite)
{
    if (sMenu->markingsArray[sprite->data[0]])
        StartSpriteAnim(sprite, 2 * sprite->data[0] + 1);
    else
        StartSpriteAnim(sprite, 2 * sprite->data[0]);
}

void sub_80F7908(struct Sprite *sprite)
{
    sprite->pos1.y = 16 * sMenu->cursorPos + sMenu->cursorBaseY;
}

struct Sprite *sub_80F7920(u16 tileTag, u16 paletteTag, u16 *palette)
{
    if (!palette)
        palette = gUnknown_083E49F4;
    return sub_80F7960(tileTag, paletteTag, palette, 16);
}

struct Sprite *sub_80F7940(u16 tileTag, u16 paletteTag, u16 *palette)
{
    if (!palette)
        palette = gUnknown_083E49F4;
    return sub_80F7960(tileTag, paletteTag, palette, 1);
}

struct Sprite *sub_80F7960(u16 tileTag, u16 paletteTag, u16 *palette, u16 size)
{
    u8 spriteId;
    struct SpriteTemplate sprTemplate;
    struct SpriteSheet sheet = { gUnknown_083E4A14, 0x80, tileTag };
    struct SpritePalette sprPalette = { palette, paletteTag };

    sprTemplate.tileTag = tileTag;
    sprTemplate.paletteTag = paletteTag;
    sprTemplate.oam = &gOamData_83E52B4;
    sprTemplate.anims = gSpriteAnimTable_83E533C;
    sprTemplate.images = NULL;
    sprTemplate.affineAnims = gDummySpriteAffineAnimTable;
    sprTemplate.callback = nullsub_65;

    sheet.size = size * 0x80;

    LoadSpriteSheet(&sheet);
    LoadSpritePalette(&sprPalette);

    spriteId = CreateSprite(&sprTemplate, 0, 0, 0);
    if (spriteId != 64)
        return  &gSprites[spriteId];
    else
        return NULL;
}

void sub_80F7A10(u8 markings, void *dest)
{
    void *src = gUnknown_083E4A14 + markings * 0x80;
    DmaCopy16(3, src, dest, 0x80);
}
