#include "global.h"
#include "main.h"
#include "menu_cursor.h"
#include "text_window.h"
#include "constants/songs.h"
#include "sound.h"
#include "sprite.h"
#include "mon_markings.h"

#ifdef GERMAN
#define MENU_TEXT_SPRITE_X_OFFSET 24
#else
#define MENU_TEXT_SPRITE_X_OFFSET 32
#endif

extern u8 gPokenavConditionMenuMisc_Gfx[];
extern u16 gUnknown_08E966B8[];

const u16 gUnknown_083E49F4[] = INCBIN_U16("graphics/misc/mon_markings.gbapal");
const u8 gUnknown_083E4A14[] = INCBIN_U8("graphics/misc/mon_markings.4bpp");

const struct OamData gOamData_83E5214 =
{
    .y = 0,
    .affineMode = 0,
    .objMode = 0,
    .mosaic = 0,
    .bpp = 0,
    .shape = 0,
    .x = 0,
    .matrixNum = 0,
    .size = 3,
    .tileNum = 0,
    .priority = 0,
    .paletteNum = 0,
    .affineParam = 0,
};

const struct OamData gOamData_83E521C =
{
    .y = 0,
    .affineMode = 0,
    .objMode = 0,
    .mosaic = 0,
    .bpp = 0,
    .shape = 0,
    .x = 0,
    .matrixNum = 0,
    .size = 0,
    .tileNum = 0,
    .priority = 0,
    .paletteNum = 0,
    .affineParam = 0,
};

const union AnimCmd gSpriteAnim_83E5224[] =
{
    ANIMCMD_FRAME(0, 5),
    ANIMCMD_END,
};

const union AnimCmd gSpriteAnim_83E522C[] =
{
    ANIMCMD_FRAME(1, 5),
    ANIMCMD_END,
};

const union AnimCmd gSpriteAnim_83E5234[] =
{
    ANIMCMD_FRAME(2, 5),
    ANIMCMD_END,
};

const union AnimCmd gSpriteAnim_83E523C[] =
{
    ANIMCMD_FRAME(3, 5),
    ANIMCMD_END,
};

const union AnimCmd gSpriteAnim_83E5244[] =
{
    ANIMCMD_FRAME(4, 5),
    ANIMCMD_END,
};

const union AnimCmd gSpriteAnim_83E524C[] =
{
    ANIMCMD_FRAME(5, 5),
    ANIMCMD_END,
};

const union AnimCmd gSpriteAnim_83E5254[] =
{
    ANIMCMD_FRAME(6, 5),
    ANIMCMD_END,
};

const union AnimCmd gSpriteAnim_83E525C[] =
{
    ANIMCMD_FRAME(7, 5),
    ANIMCMD_END,
};

const union AnimCmd gSpriteAnim_83E5264[] =
{
    ANIMCMD_FRAME(8, 5),
    ANIMCMD_END,
};

const union AnimCmd gSpriteAnim_83E526C[] =
{
    ANIMCMD_FRAME(9, 5),
    ANIMCMD_END,
};

const union AnimCmd *const gSpriteAnimTable_83E5274[] =
{
    gSpriteAnim_83E5224,
    gSpriteAnim_83E522C,
    gSpriteAnim_83E5234,
    gSpriteAnim_83E523C,
    gSpriteAnim_83E5244,
    gSpriteAnim_83E524C,
    gSpriteAnim_83E5254,
    gSpriteAnim_83E525C,
    gSpriteAnim_83E5264,
    gSpriteAnim_83E526C,
};

const union AnimCmd gSpriteAnim_83E529C[] =
{
    ANIMCMD_FRAME(0, 5),
    ANIMCMD_END,
};

const union AnimCmd gSpriteAnim_83E52A4[] =
{
    ANIMCMD_FRAME(64, 5),
    ANIMCMD_END,
};

const union AnimCmd *const gSpriteAnimTable_83E52AC[] =
{
    gSpriteAnim_83E529C,
    gSpriteAnim_83E52A4,
};

const struct OamData gOamData_83E52B4 =
{
    .y = 0,
    .affineMode = 0,
    .objMode = 0,
    .mosaic = 0,
    .bpp = 0,
    .shape = 1,
    .x = 0,
    .matrixNum = 0,
    .size = 1,
    .tileNum = 0,
    .priority = 0,
    .paletteNum = 0,
    .affineParam = 0,
};

const union AnimCmd gSpriteAnim_83E52BC[] =
{
    ANIMCMD_FRAME(0, 5),
    ANIMCMD_END,
};

const union AnimCmd gSpriteAnim_83E52C4[] =
{
    ANIMCMD_FRAME(4, 5),
    ANIMCMD_END,
};

const union AnimCmd gSpriteAnim_83E52CC[] =
{
    ANIMCMD_FRAME(8, 5),
    ANIMCMD_END,
};

const union AnimCmd gSpriteAnim_83E52D4[] =
{
    ANIMCMD_FRAME(12, 5),
    ANIMCMD_END,
};

const union AnimCmd gSpriteAnim_83E52DC[] =
{
    ANIMCMD_FRAME(16, 5),
    ANIMCMD_END,
};

const union AnimCmd gSpriteAnim_83E52E4[] =
{
    ANIMCMD_FRAME(20, 5),
    ANIMCMD_END,
};

const union AnimCmd gSpriteAnim_83E52EC[] =
{
    ANIMCMD_FRAME(24, 5),
    ANIMCMD_END,
};

const union AnimCmd gSpriteAnim_83E52F4[] =
{
    ANIMCMD_FRAME(28, 5),
    ANIMCMD_END,
};

const union AnimCmd gSpriteAnim_83E52FC[] =
{
    ANIMCMD_FRAME(32, 5),
    ANIMCMD_END,
};

const union AnimCmd gSpriteAnim_83E5304[] =
{
    ANIMCMD_FRAME(36, 5),
    ANIMCMD_END,
};

const union AnimCmd gSpriteAnim_83E530C[] =
{
    ANIMCMD_FRAME(40, 5),
    ANIMCMD_END,
};

const union AnimCmd gSpriteAnim_83E5314[] =
{
    ANIMCMD_FRAME(44, 5),
    ANIMCMD_END,
};

const union AnimCmd gSpriteAnim_83E531C[] =
{
    ANIMCMD_FRAME(48, 5),
    ANIMCMD_END,
};

const union AnimCmd gSpriteAnim_83E5324[] =
{
    ANIMCMD_FRAME(52, 5),
    ANIMCMD_END,
};

const union AnimCmd gSpriteAnim_83E532C[] =
{
    ANIMCMD_FRAME(56, 5),
    ANIMCMD_END,
};

const union AnimCmd gSpriteAnim_83E5334[] =
{
    ANIMCMD_FRAME(60, 5),
    ANIMCMD_END,
};

const union AnimCmd *const gSpriteAnimTable_83E533C[] =
{
    gSpriteAnim_83E52BC,
    gSpriteAnim_83E52C4,
    gSpriteAnim_83E52CC,
    gSpriteAnim_83E52D4,
    gSpriteAnim_83E52DC,
    gSpriteAnim_83E52E4,
    gSpriteAnim_83E52EC,
    gSpriteAnim_83E52F4,
    gSpriteAnim_83E52FC,
    gSpriteAnim_83E5304,
    gSpriteAnim_83E530C,
    gSpriteAnim_83E5314,
    gSpriteAnim_83E531C,
    gSpriteAnim_83E5324,
    gSpriteAnim_83E532C,
    gSpriteAnim_83E5334,
};

static EWRAM_DATA struct PokemonMarkMenu *sMenu = NULL;

static void sub_80F761C(s16, s16, u16, u16);
static void nullsub_65(struct Sprite *);
static void sub_80F78CC(struct Sprite *);
static void sub_80F7908(struct Sprite *);
static struct Sprite *sub_80F7960(u16, u16, const u16 *, u16);

void sub_80F727C(struct PokemonMarkMenu *ptr)
{
    sMenu = ptr;
    sMenu->spriteSheetLoadRequired = FALSE;
}

void sub_80F728C(void)
{
    const struct FrameGraphics *frame = TextWindow_GetFrameGraphics(gSaveBlock2.optionsWindowFrameType);
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
    MenuCursor_Create814A5C0(0, basePaletteTag + 1, 15, 0, 0x30);
    MenuCursor_SetPos814A880(x + 8, sMenu->cursorBaseY);
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

struct Sprite *sub_80F7920(u16 tileTag, u16 paletteTag, const u16 *palette)
{
    if (!palette)
        palette = gUnknown_083E49F4;
    return sub_80F7960(tileTag, paletteTag, palette, 16);
}

struct Sprite *sub_80F7940(u16 tileTag, u16 paletteTag, const u16 *palette)
{
    if (!palette)
        palette = gUnknown_083E49F4;
    return sub_80F7960(tileTag, paletteTag, palette, 1);
}

struct Sprite *sub_80F7960(u16 tileTag, u16 paletteTag, const u16 *palette, u16 size)
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
    DmaCopy16Defvars(3, gUnknown_083E4A14 + markings * 0x80, dest, 0x80);
}
