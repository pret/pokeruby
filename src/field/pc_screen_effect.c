#include "global.h"
#include "main.h"
#include "palette.h"
#include "sprite.h"
#include "pc_screen_effect.h"

void sub_80C603C(void);
void sub_80C6078(void);
void sub_80C60CC(struct Sprite *);
void sub_80C6130(struct Sprite *);
void sub_80C61B0(IntrFunc);
void ClearGpuRegBits(void);

extern const struct OamData gOamData_83D18D8;

extern const union AnimCmd *const gSpriteAnimTable_83D18E8[];

extern const u16 gUnknownPal_083D18EC[16];

extern const u8 gUnknownGfx_083D190C[128];

extern struct PCScreenEffectStruct *gUnknown_020387EC;

const struct SpriteSheet gUnknown_083D1898 = { gUnknownGfx_083D190C, sizeof(gUnknownGfx_083D190C), 0 };

const struct SpritePalette gUnknown_083D18A0 = { gUnknownPal_083D18EC, 0 };

const struct SpriteTemplate gSpriteTemplate_83D18A8 =
{
    0,
    0,
    &gOamData_83D18D8,
    gSpriteAnimTable_83D18E8,
    NULL,
    gDummySpriteAffineAnimTable,
    sub_80C60CC,
};

const struct SpriteTemplate gSpriteTemplate_83D18C0 =
{
    0,
    0,
    &gOamData_83D18D8,
    gSpriteAnimTable_83D18E8,
    NULL,
    gDummySpriteAffineAnimTable,
    sub_80C6130,
};

void sub_80C5CD4(struct PCScreenEffectStruct *unkStruct)
{
    u16 i;

    struct SpriteSheet sprSheet = gUnknown_083D1898;
    struct SpritePalette sprPalette = gUnknown_083D18A0;
    struct SpriteTemplate sprTemplate = gSpriteTemplate_83D18A8;

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
        BlendPalettes(gUnknown_020387EC->selectedPalettes, 0x10, 0xFFFF);
        sub_80C61B0(sub_80C603C);
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
        ClearGpuRegBits();
        return TRUE;
    }
    else
    {
        return FALSE;
    }
}
