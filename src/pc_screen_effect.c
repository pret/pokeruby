#include "global.h"
#include "main.h"
#include "palette.h"
#include "sprite.h"
#include "pc_screen_effect.h"

static void sub_80C603C(void);
static void sub_80C6078(void);
static void sub_80C60CC(struct Sprite *);
static void sub_80C6130(struct Sprite *);
static void HBlankIntrOn(IntrFunc);
static void HBlankIntrOff(void);

struct OamData gOamData_83D18D8 = {
    .shape = ST_OAM_H_RECTANGLE,
    .size = 1
};

union AnimCmd gSpriteAnim_83D18E0[] = {
    ANIMCMD_FRAME(0, 5),
    ANIMCMD_END
};

const union AnimCmd *gSpriteAnimTable_83D18E8[] = {
    gSpriteAnim_83D18E0
};

u16 gUnknownPal_083D18EC[] = INCBIN_U16("graphics/unknown/unknown_3D18EC.gbapal");
u8 gUnknownGfx_083D190C[] = INCBIN_U8("graphics/unknown/unknown_3D190C.4bpp");

EWRAM_DATA struct PCScreenEffectStruct *gUnknown_020387EC = NULL;

void sub_80C5CD4(struct PCScreenEffectStruct *unkStruct)
{
    u16 i;

    struct SpriteSheet sprSheet = { gUnknownGfx_083D190C, sizeof(gUnknownGfx_083D190C), 0 };
    struct SpritePalette sprPalette = { gUnknownPal_083D18EC, 0 };
    struct SpriteTemplate sprTemplate =
        {
            0,
            0,
            &gOamData_83D18D8,
            gSpriteAnimTable_83D18E8,
            NULL,
            gDummySpriteAffineAnimTable,
            sub_80C60CC,
        };

    sprSheet.tag = unkStruct->tileTag;
    sprTemplate.tileTag =  unkStruct->tileTag;
    sprPalette.tag = unkStruct->paletteTag;
    sprTemplate.paletteTag = unkStruct->paletteTag;

    LoadSpriteSheet(&sprSheet);
    LoadSpritePalette(&sprPalette);

    unkStruct->unk0C = 1;
    unkStruct->unk0A = 0;
    unkStruct->unk08 = 0;
    unkStruct->selectedPalettes  = ~(0x10000 << IndexOfSpritePaletteTag(unkStruct->paletteTag)) & 0xFFFF0000;

    if (unkStruct->unk04 == 0)
        unkStruct->unk04 = 16;

    if (unkStruct->unk06 == 0)
        unkStruct->unk06 = 20;

    gUnknown_020387EC = unkStruct;

    for (i = 0; i < 8; i++)
    {
        u8 spriteId = CreateSprite(&sprTemplate, 32 * i + 8, 80, 0);
        if (spriteId == MAX_SPRITES)
            break;
        gSprites[spriteId].data[0] = (i < 4) ? -unkStruct->unk04 : unkStruct->unk04;
    }

    REG_BLDCNT = 191;
    REG_BLDY = 16;
}

bool8 sub_80C5DCC(void)
{
    if (gUnknown_020387EC->unk08 == 0)
    {
        BlendPalettes(gUnknown_020387EC->selectedPalettes, 16, FADE_COLOR_WHITE);
        HBlankIntrOn(sub_80C603C);
        gUnknown_020387EC->unk08++;
    }

    if (gUnknown_020387EC->unk0A < 8)
        return FALSE;

    gUnknown_020387EC->unk0C += gUnknown_020387EC->unk06;

    if (gUnknown_020387EC->unk0C >= 80)
    {
        gUnknown_020387EC->unk0C = 80;
        REG_BLDCNT = 0;
        REG_BLDY = 0;
        HBlankIntrOff();
        return TRUE;
    }
    else
    {
        return FALSE;
    }
}

void sub_80C5E38(struct PCScreenEffectStruct * a0)
{
    u16 i;
    u8 spriteId;

    struct SpriteSheet spriteSheet = { gUnknownGfx_083D190C, sizeof(gUnknownGfx_083D190C), 0 };
    struct SpritePalette spritePalette = { gUnknownPal_083D18EC, 0 };
    struct SpriteTemplate spriteTemplate =
        {
            0,
            0,
            &gOamData_83D18D8,
            gSpriteAnimTable_83D18E8,
            NULL,
            gDummySpriteAffineAnimTable,
            sub_80C6130,
        };

    spriteSheet.tag = a0->tileTag;
    spriteTemplate.tileTag = a0->tileTag;
    spritePalette.tag = a0->paletteTag;
    spriteTemplate.paletteTag = a0->paletteTag;

    LoadSpriteSheet(&spriteSheet);
    LoadSpritePalette(&spritePalette);

    a0->unk0C = 0x50;
    a0->unk08 = 0;
    a0->unk0A = 0;
    a0->selectedPalettes = 0xffff0000 & ~(0x10000 << IndexOfSpritePaletteTag(a0->paletteTag));
    if (a0->unk04 == 0)
        a0->unk04 = 16;
    if (a0->unk06 == 0)
        a0->unk06 = 20;
    gUnknown_020387EC = a0;

    for (i = 0; i < 8; i++)
    {
        if (i < 4)
        {
            spriteId = CreateSprite(&spriteTemplate, i * 32 - 0x70, 0x50, 0);
            if (spriteId == MAX_SPRITES)
                break;
            gSprites[spriteId].data[0] = a0->unk04;
            gSprites[spriteId].data[1] = 1;
        }
        else
        {
            // Fakematching
            spriteId = CreateSprite(&spriteTemplate, ((i << 21) + (0x80 << 16)) >> 16, 0x50, 0);
            if (spriteId == MAX_SPRITES)
                break;
            gSprites[spriteId].data[0] = -a0->unk04;
            gSprites[spriteId].data[1] = -1;
        }
        gSprites[spriteId].data[2] = i * 32 + 8;
        gSprites[spriteId].data[4] = 0;
        gSprites[spriteId].invisible = TRUE;
    }
    REG_BLDCNT = BLDCNT_TGT1_BG0 | BLDCNT_TGT1_BG1 | BLDCNT_TGT1_BG2 | BLDCNT_TGT1_BG3 | BLDCNT_TGT1_OBJ | BLDCNT_TGT1_BD | BLDCNT_EFFECT_DARKEN;
    REG_BLDY = 16;
    HBlankIntrOn(sub_80C6078);
}

bool8 sub_80C5F98(void)
{
    switch (gUnknown_020387EC->unk08)
    {
        case 0:
            gUnknown_020387EC->unk0C -= gUnknown_020387EC->unk06;
            if (gUnknown_020387EC->unk0C < 2)
            {
                BlendPalettes(gUnknown_020387EC->selectedPalettes, 16, FADE_COLOR_WHITE);
                SetHBlankCallback(sub_80C603C);
                gUnknown_020387EC->unk0C = 1;
                gUnknown_020387EC->unk08++;
            }
            break;
        case 1:
            if (gUnknown_020387EC->unk0A == 8)
            {
                BlendPalettes(0xFFFFFFFF, 16, RGB(0, 0, 0));
                gUnknown_020387EC->unk08++;
            }
            break;
        case 2:
            REG_BLDCNT = 0;
            REG_BLDY = 0;
            FreeSpriteTilesByTag(gUnknown_020387EC->tileTag);
            FreeSpritePaletteByTag(gUnknown_020387EC->paletteTag);
            HBlankIntrOff();
            gUnknown_020387EC->unk08++;
            return TRUE;
        default:
            return TRUE;
    }
    return FALSE;
}

static void sub_80C603C(void)
{
    vu16 vcount = REG_VCOUNT & 0xFF;
    if (vcount == 0x50)
        REG_BLDCNT = BLDCNT_TGT1_BG0 | BLDCNT_TGT1_BG1 | BLDCNT_TGT1_BG2 | BLDCNT_TGT1_BG3 | BLDCNT_EFFECT_LIGHTEN;
    else
        REG_BLDCNT = BLDCNT_TGT1_BG0 | BLDCNT_TGT1_BG1 | BLDCNT_TGT1_BG2 | BLDCNT_TGT1_BG3 | BLDCNT_TGT1_OBJ | BLDCNT_TGT1_BD | BLDCNT_EFFECT_DARKEN;
}

static void sub_80C6078(void)
{
    vu16 vcount = REG_VCOUNT & 0xFF;
    if (vcount > 0x50 - gUnknown_020387EC->unk0C && vcount < 0x50 + gUnknown_020387EC->unk0C)
        REG_BLDY = 0;
    else
        REG_BLDY = 16;
}

static void sub_80C60CC(struct Sprite *sprite)
{
    sprite->pos1.x += sprite->data[0];
    if (sprite->pos1.x < -0x08 || sprite->pos1.x > 0xf8)
    {
        DestroySprite(sprite);
        gUnknown_020387EC->unk0A++;
        if (gUnknown_020387EC->unk0A == 8)
        {
            FreeSpriteTilesByTag(gUnknown_020387EC->tileTag);
            FreeSpritePaletteByTag(gUnknown_020387EC->paletteTag);
            BlendPalettes(gUnknown_020387EC->selectedPalettes, 0, FADE_COLOR_WHITE);
            SetHBlankCallback(sub_80C6078);
        }
    }
}

static void sub_80C6130(struct Sprite *sprite)
{
    if (sprite->data[4] == 0 && gUnknown_020387EC->unk0C == 1)
    {
        sprite->pos1.x += sprite->data[0];
        if (sprite->pos1.x > -0x10 && sprite->pos1.x < 0x100)
            sprite->invisible = FALSE;
        if (sprite->data[1] > 0)
        {
            if (sprite->pos1.x >= sprite->data[2])
                sprite->data[4] = 1;
        }
        else
        {
            if (sprite->pos1.x <= sprite->data[2])
                sprite->data[4] = 1;
        }
        if (sprite->data[4])
        {
            gUnknown_020387EC->unk0A++;
            sprite->pos1.x = sprite->data[2];
        }
    }
}

static void HBlankIntrOn(IntrFunc cb)
{
    u16 imeBak;
    INTR_CHECK |= INTR_FLAG_HBLANK;
    REG_DISPSTAT |= DISPSTAT_HBLANK_INTR;
    imeBak = REG_IME;
    REG_IME = 0;
    REG_IE |= INTR_FLAG_HBLANK;
    REG_IME = imeBak;
    gMain.intrCheck |= INTR_FLAG_HBLANK;
    SetHBlankCallback(cb);
}

static void HBlankIntrOff(void)
{
    u16 imeBak;
    INTR_CHECK &= ~INTR_FLAG_HBLANK;
    REG_DISPSTAT &= ~DISPSTAT_HBLANK_INTR;
    imeBak = REG_IME;
    REG_IME = 0;
    REG_IE &= ~INTR_FLAG_HBLANK;
    REG_IME = imeBak;
    gMain.intrCheck &= ~INTR_FLAG_HBLANK;
    SetHBlankCallback(NULL);
}
