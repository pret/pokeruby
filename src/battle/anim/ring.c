#include "global.h"
#include "rom_8077ABC.h"
#include "trig.h"
#include "battle_anim.h"
#include "sound.h"
#include "main.h"
#include "blend_palette.h"

extern s16 gBattleAnimArgs[];
extern u8 gAnimBankAttacker;
extern u8 gAnimBankTarget;

extern u8 gBankSpriteIds[];

void sub_80D0FD8(struct Sprite* sprite);
void sub_80D10B8(struct Sprite* sprite);
void sub_80D1318(struct Sprite* sprite);
void sub_80D1368(struct Sprite* sprite);
static void sub_80D1098(struct Sprite* sprite);
static void sub_80D13AC(struct Sprite* sprite);
static void sub_80D1424(struct Sprite* sprite);
static void sub_80D144C(struct Sprite* sprite);
static void sub_80D14C4(struct Sprite* sprite);
static void sub_80D1504(struct Sprite* sprite);
static void sub_80D154C(struct Sprite* sprite);
static void sub_80D158C(struct Sprite* sprite);

// ring (a ring that stretches outward from the Pokemon.)
// Used in Aromatherapy and Heal Bell.

const struct SpriteTemplate gBattleAnimSpriteTemplate_83D77F8 =
{
    .tileTag = 10197,
    .paletteTag = 10197,
    .oam = &gOamData_837DF34,
    .anims = gDummySpriteAnimTable,
    .images = NULL,
    .affineAnims = gDummySpriteAffineAnimTable,
    .callback = sub_8079534,
};

const union AnimCmd gSpriteAnim_83D7810[] =
{
    ANIMCMD_FRAME(0, 5),
    ANIMCMD_FRAME(16, 5),
    ANIMCMD_FRAME(32, 5),
    ANIMCMD_FRAME(48, 5),
    ANIMCMD_END,
};

const union AnimCmd *const gSpriteAnimTable_83D7824[] =
{
    gSpriteAnim_83D7810,
};

const struct SpriteTemplate gBattleAnimSpriteTemplate_83D7828 =
{
    .tileTag = 10198,
    .paletteTag = 10198,
    .oam = &gOamData_837DF34,
    .anims = gSpriteAnimTable_83D7824,
    .images = NULL,
    .affineAnims = gDummySpriteAffineAnimTable,
    .callback = sub_80793C4,
};

const union AffineAnimCmd gSpriteAffineAnim_83D7840[] =
{
    AFFINEANIMCMD_FRAME(0x0, 0x0, -8, 2),
    AFFINEANIMCMD_FRAME(0x0, 0x0, 8, 4),
    AFFINEANIMCMD_FRAME(0x0, 0x0, -8, 2),
    AFFINEANIMCMD_JUMP(0),
};

const union AffineAnimCmd gSpriteAffineAnim_83D7860[] =
{
    AFFINEANIMCMD_FRAME(0x100, 0x100, 0, 0),
    AFFINEANIMCMD_END,
};

const union AffineAnimCmd gSpriteAffineAnim_83D7870[] =
{
    AFFINEANIMCMD_FRAME(0xFFF8, 0x4, 0, 8),
    AFFINEANIMCMD_LOOP(0),
    AFFINEANIMCMD_FRAME(0x10, 0xFFF8, 0, 8),
    AFFINEANIMCMD_FRAME(0xFFF0, 0x8, 0, 8),
    AFFINEANIMCMD_LOOP(1),
    AFFINEANIMCMD_FRAME(0x100, 0x100, 0, 0),
    AFFINEANIMCMD_FRAME(0x0, 0x0, 0, 15),
    AFFINEANIMCMD_END,
};

const union AffineAnimCmd *const gSpriteAffineAnimTable_83D78B0[] =
{
    gSpriteAffineAnim_83D7840,
    gSpriteAffineAnim_83D7860,
    gSpriteAffineAnim_83D7870,
};

const struct SpriteTemplate gBattleAnimSpriteTemplate_83D78BC =
{
    .tileTag = 10202,
    .paletteTag = 10202,
    .oam = &gOamData_837E114,
    .anims = gDummySpriteAnimTable,
    .images = NULL,
    .affineAnims = gSpriteAffineAnimTable_83D78B0,
    .callback = sub_80D1368,
};

const union AffineAnimCmd gSpriteAffineAnim_83D78D4[] =
{
    AFFINEANIMCMD_FRAME(0x10, 0x10, 0, 0),
    AFFINEANIMCMD_FRAME(0x10, 0x10, 0, 30),
    AFFINEANIMCMD_END_ALT(1),
};

const union AffineAnimCmd gSpriteAffineAnim_83D78EC[] =
{
    AFFINEANIMCMD_FRAME(0x10, 0x10, 0, 0),
    AFFINEANIMCMD_FRAME(0x20, 0x20, 0, 15),
    AFFINEANIMCMD_END_ALT(1),
};

const union AffineAnimCmd gSpriteAffineAnim_83D7904[] =
{
    AFFINEANIMCMD_FRAME(0x10, 0x10, 0, 0),
    AFFINEANIMCMD_FRAME(0xB, 0xB, 0, 45),
    AFFINEANIMCMD_END_ALT(1),
};

const union AffineAnimCmd *const gSpriteAffineAnimTable_83D791C[] =
{
    gSpriteAffineAnim_83D78D4,
    gSpriteAffineAnim_83D78EC,
};

const union AffineAnimCmd *const gSpriteAffineAnimTable_83D7924[] =
{
    gSpriteAffineAnim_83D7904,
};

const struct SpriteTemplate gBattleAnimSpriteTemplate_83D7928 =
{
    .tileTag = 10203,
    .paletteTag = 10203,
    .oam = &gOamData_837DFFC,
    .anims = gDummySpriteAnimTable,
    .images = NULL,
    .affineAnims = gSpriteAffineAnimTable_83D791C,
    .callback = sub_80793C4,
};

const union AffineAnimCmd gSpriteAffineAnim_83D7940[] =
{
    AFFINEANIMCMD_FRAME(0x200, 0x200, 0, 0),
    AFFINEANIMCMD_FRAME(0xFFF0, 0xFFF0, 0, 30),
    AFFINEANIMCMD_END_ALT(1),
};

const union AffineAnimCmd *const gSpriteAffineAnimTable_83D7958[] =
{
    gSpriteAffineAnim_83D7940,
};

const struct SpriteTemplate gBattleAnimSpriteTemplate_83D795C =
{
    .tileTag = 10203,
    .paletteTag = 10203,
    .oam = &gOamData_837E11C,
    .anims = gDummySpriteAnimTable,
    .images = NULL,
    .affineAnims = gSpriteAffineAnimTable_83D7958,
    .callback = sub_80793C4,
};

const struct SpriteTemplate gBattleAnimSpriteTemplate_83D7974 =
{
    .tileTag = 10203,
    .paletteTag = 10203,
    .oam = &gOamData_837E11C,
    .anims = gDummySpriteAnimTable,
    .images = NULL,
    .affineAnims = gSpriteAffineAnimTable_83D791C,
    .callback = sub_80D0FD8,
};

const struct SpriteTemplate gBattleAnimSpriteTemplate_83D798C =
{
    .tileTag = 10203,
    .paletteTag = 10203,
    .oam = &gOamData_837E11C,
    .anims = gDummySpriteAnimTable,
    .images = NULL,
    .affineAnims = gSpriteAffineAnimTable_83D7924,
    .callback = sub_80D10B8,
};

const struct SpriteTemplate gBattleAnimSpriteTemplate_83D79A4 =
{
    .tileTag = 10203,
    .paletteTag = 10203,
    .oam = &gOamData_837E11C,
    .anims = gDummySpriteAnimTable,
    .images = NULL,
    .affineAnims = gSpriteAffineAnimTable_83D791C,
    .callback = sub_80D1318,
};

void sub_80D0FD8(struct Sprite* sprite)
{
    u8 bank = 0;
    u16 sp0 = 0;
    u16 sp1 = 0;
    u8 r4;

    if (gBattleAnimArgs[2] == 0)
        bank = gAnimBankAttacker;
    else
        bank = gAnimBankTarget;

    r4 = gBattleAnimArgs[3] ^ 1;
    if (IsDoubleBattle() && IsAnimBankSpriteVisible(bank ^ 2))
    {
        SetAverageBattlerPositions(bank, r4, &sp0, &sp1);
        if (r4 == 0)
            r4 = GetBattlerSpriteCoord(bank, 0);
        else
            r4 = GetBattlerSpriteCoord(bank, 2);

        if (GetBattlerSide(bank) != 0)
            gBattleAnimArgs[0] -= (sp0 - r4) - gBattleAnimArgs[0];  // This is weird.
        else
            gBattleAnimArgs[0] = sp0 - r4;
    }

    sprite->callback = sub_80793C4;
    sub_80793C4(sprite);
}

void sub_80D1098(struct Sprite* sprite)
{
    if (TranslateAnimLinear(sprite))
    {
        FreeSpriteOamMatrix(sprite);
        DestroyAnimSprite(sprite);
    }
}

void sub_80D10B8(struct Sprite* sprite)
{
    u16 r9 = 0;
    u16 r6 = 0;
    s16 sp0 = 0;
    s16 sp1 = 0;
    u8 sp4;
    u8 bankr7;
    u8 bankr8;
    u8 r10;

    if (gBattleAnimArgs[5] == 0)
    {
        bankr7 = gAnimBankAttacker;
        bankr8 = gAnimBankTarget;
    }
    else
    {
        bankr7 = gAnimBankTarget;
        bankr8 = gAnimBankAttacker;
    }

    if (gBattleAnimArgs[6] == 0)
    {
        r10 = 0;
        sp4 = 1;
    }
    else
    {
        r10 = 2;
        sp4 = 3;
    }

    if (GetBattlerSide(bankr7) != 0)
    {
        r9 = GetBattlerSpriteCoord(bankr7, r10) + gBattleAnimArgs[0];
        if (IsAnimBankSpriteVisible(bankr8 ^ 2))
            sprite->subpriority = gSprites[gBankSpriteIds[bankr8 ^ 2]].subpriority - 1;
        else
            sprite->subpriority = gSprites[gBankSpriteIds[bankr8]].subpriority - 1;
    }
    else
    {
        r9 = GetBattlerSpriteCoord(bankr7, r10) - gBattleAnimArgs[0];
        if (gMain.inBattle && IsAnimBankSpriteVisible(bankr7 ^ 2))
        {
            if (gSprites[gBankSpriteIds[bankr7]].pos1.x < gSprites[gBankSpriteIds[bankr7 ^ 2]].pos1.x)
                sprite->subpriority = gSprites[gBankSpriteIds[bankr7 ^ 2]].subpriority + 1;
            else
                sprite->subpriority = gSprites[gBankSpriteIds[bankr7]].subpriority - 1;
        }
        else
        {
            sprite->subpriority = gSprites[gBankSpriteIds[bankr7]].subpriority - 1;
        }

    }

    r6 = GetBattlerSpriteCoord(bankr7, sp4) + gBattleAnimArgs[1];
    if (gMain.inBattle && IsAnimBankSpriteVisible(bankr8 ^ 2))
    {
        SetAverageBattlerPositions(bankr8, gBattleAnimArgs[6], &sp0, &sp1);
    }
    else
    {
        sp0 = GetBattlerSpriteCoord(bankr8, r10);
        sp1 = GetBattlerSpriteCoord(bankr8, sp4);
    }

    if (GetBattlerSide(bankr8))
        sp0 += gBattleAnimArgs[3];
    else
        sp0 -= gBattleAnimArgs[3];

    sp1 += gBattleAnimArgs[4];
    sprite->pos1.x = sprite->data[1] = r9;
    sprite->pos1.y = sprite->data[3] = r6;
    sprite->data[2] = sp0;
    sprite->data[4] = sp1;
    sprite->data[0] = gBattleAnimArgs[0];
    InitAnimLinearTranslation(sprite);
    sprite->callback = sub_80D1098;
    sub_80D1098(sprite);
}

void sub_80D1318(struct Sprite* sprite)
{
    u8 index = IndexOfSpritePaletteTag(0x27DB);
    if (index != 0xFF)
    {
        BlendPalette(((index << 20) + 0x1010000) >> 16, 15, gBattleAnimArgs[5], gBattleAnimArgs[4]);
    }

    StartSpriteAffineAnim(sprite, 1);
    sprite->callback = sub_80793C4;
    sub_80793C4(sprite);
}

void sub_80D1368(struct Sprite* sprite)
{
    s16 r1;
    InitAnimSpritePos(sprite, 0);
    r1 = (GetBattlerSide(gAnimBankAttacker)) ? -0xA0 : 0xA0;
    sprite->data[0] = 0x380;
    sprite->data[1] = r1;
    sprite->data[7] = gBattleAnimArgs[2];
    sprite->callback = sub_80D13AC;
}

static void sub_80D13AC(struct Sprite* sprite)
{
    s16 add;
    sprite->pos2.y -= (sprite->data[0] >> 8);
    sprite->pos2.x = sprite->data[1] >> 8;
    sprite->data[0] -= 32;
    add = (GetBattlerSide(gAnimBankAttacker)) ? -0xA0 : 0xA0;
    sprite->data[1] += add;
    if (sprite->pos2.y > 0)
    {
        sprite->pos1.y += sprite->pos2.y;
        sprite->pos1.x += sprite->pos2.x;
        sprite->pos2.y = 0;
        sprite->pos2.x = 0;
        sprite->data[0] = 0;
        StartSpriteAffineAnim(sprite, 1);
        sprite->callback = sub_80D1424;
    }
}

static void sub_80D1424(struct Sprite* sprite)
{
    if (sprite->data[0]++ > 19)
    {
        StartSpriteAffineAnim(sprite, 2);
        sprite->callback = sub_80D144C;
    }
}

static void sub_80D144C(struct Sprite* sprite)
{
    if (sprite->affineAnimEnded)
    {
        StartSpriteAffineAnim(sprite, 1);
        sprite->data[0] = 0;
        if (sprite->data[7] == 0)
        {
            sprite->oam.tileNum += 16;
            sprite->callback = sub_80D14C4;
        }
        else
        {
            sprite->oam.tileNum += 32;
            sprite->callback = sub_80D154C;
        }
    }
}

static void sub_80D14C4(struct Sprite* sprite)
{
    sprite->pos2.y -= 2;
    if (++sprite->data[0] == 9)
    {
        sprite->data[0] = 16;
        sprite->data[1] = 0;
        REG_BLDCNT = 0x3F40;
        REG_BLDALPHA = sprite->data[0];
        sprite->callback = sub_80D1504;
    }
}

static void sub_80D1504(struct Sprite* sprite)
{
    if (sprite->data[1]++ % 3 == 0)
    {
        sprite->data[0]--;
        REG_BLDALPHA = sprite->data[0] | ((16 - sprite->data[0]) << 8);
        if (sprite->data[0] == 0)
            sprite->callback = sub_80D154C;
    }
}

static void sub_80D154C(struct Sprite* sprite)
{
    if ((u16)gBattleAnimArgs[7] == 0xFFFF)
    {
        sprite->invisible = 1;
        if (sprite->data[7] == 0)
            sprite->callback = sub_80D158C;
        else
            sprite->callback = DestroyAnimSprite;
    }
}

static void sub_80D158C(struct Sprite* sprite)
{
    REG_BLDCNT = 0;
    REG_BLDALPHA = 0;
    DestroyAnimSprite(sprite);
}
