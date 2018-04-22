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
    sub_80C61B0(sub_80C6078);
}
