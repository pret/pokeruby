#include "global.h"
#include "rom_8077ABC.h"
#include "trig.h"
#include "battle_anim.h"

extern s16 gBattleAnimArgs[];
extern u8 gAnimBankAttacker;
extern u8 gAnimBankTarget;

void sub_80CB94C(struct Sprite* sprite);
void sub_80CBA28(struct Sprite* sprite);

// hop (where a sprite "hops" across the screen)
// Used by Present, Trick, and the item knock off effect.

const union AnimCmd gSpriteAnim_83D66B0[] =
{
    ANIMCMD_FRAME(0, 30),
    ANIMCMD_END,
};

const union AnimCmd *const gSpriteAnimTable_83D66B8[] =
{
    gSpriteAnim_83D66B0,
};

const union AffineAnimCmd gSpriteAffineAnim_83D66BC[] = {
    AFFINEANIMCMD_FRAME(0, 0, -4, 10),
    AFFINEANIMCMD_FRAME(0, 0, 4, 20),
    AFFINEANIMCMD_FRAME(0, 0, -4, 10),
    AFFINEANIMCMD_END,
};

const union AffineAnimCmd gSpriteAffineAnim_83D66DC[] = {
    AFFINEANIMCMD_FRAME(0, 0, -1, 2),
    AFFINEANIMCMD_FRAME(0, 0, 1, 4),
    AFFINEANIMCMD_FRAME(0, 0, -1, 4),
    AFFINEANIMCMD_FRAME(0, 0, 1, 4),
    AFFINEANIMCMD_FRAME(0, 0, -1, 4),
    AFFINEANIMCMD_FRAME(0, 0, 1, 2),
    AFFINEANIMCMD_END,
};

const union AffineAnimCmd *const gSpriteAffineAnimTable_83D6714[] = {
    gSpriteAffineAnim_83D66BC,
    gSpriteAffineAnim_83D66DC,
};

const struct SpriteTemplate gBattleAnimSpriteTemplate_83D671C =
{
    .tileTag = 10224,
    .paletteTag = 10224,
    .oam = &gOamData_837DF94,
    .anims = gSpriteAnimTable_83D66B8,
    .images = NULL,
    .affineAnims = gSpriteAffineAnimTable_83D6714,
    .callback = sub_80CB94C,
};

const struct SpriteTemplate gBattleAnimSpriteTemplate_83D6734 =
{
    .tileTag = 10224,
    .paletteTag = 10224,
    .oam = &gOamData_837DF94,
    .anims = gSpriteAnimTable_83D66B8,
    .images = NULL,
    .affineAnims = gSpriteAffineAnimTable_83D6714,
    .callback = sub_80CBA28,
};

void sub_80CB7EC(struct Sprite* sprite, s16 c)
{
    s32 a = (sprite->pos1.x * 256) | sprite->pos1.y;
    s32 b = (sprite->data[6] * 256) | sprite->data[7];
    c *= 256;
    sprite->data[5] = a;
    sprite->data[6] = b;
    sprite->data[7] = c;
}

bool8 sub_80CB814(struct Sprite* sprite)
{
    u16 r10 = (u8)(sprite->data[5] >> 8);
    u16 r9 = (u8)sprite->data[5];
    s32 r2 = (u8)(sprite->data[6] >> 8);
    s32 r4 = (u8)sprite->data[6];
    s16 r6 = sprite->data[7] >> 8;
    s16 r3 = sprite->data[7] & 0xFF;
    s16 r4_2;
    s16 r0;
    s32 var1;
    s32 var2;

    if (r2 == 0)
    {
        r2 = -32;
    }
    else if (r2 == 255)
    {
        r2 = 0x110;
    }

    r4_2 = r4 - r9;
    r0 = r2 - r10;
    var1 = r0 * r3 / r6;
    var2 = r4_2 * r3 / r6;
    sprite->pos1.x = var1 + r10;
    sprite->pos1.y = var2 + r9;
    if (++r3 == r6)
        return TRUE;

    sprite->data[7] = (r6 << 8) | r3;
    return FALSE;
}

void sub_80CB8B8(struct Sprite* sprite)
{
    if (sprite->data[0] == 10)
    {
        StartSpriteAffineAnim(sprite, 1);
    }

    sprite->data[0]++;
    if (sprite->data[0] > 50)
    {
        DestroyAnimSprite(sprite);
    }
}

void sub_80CB8E8(struct Sprite* sprite)
{
    sprite->data[0] += sprite->data[3] * 128 / sprite->data[4];
    if (sprite->data[0] >= 128)
    {
        sprite->data[1]++;
        sprite->data[0] = 0;
    }

    sprite->pos2.y = Sin(sprite->data[0] + 128, 30 - sprite->data[1] * 8);
    if (sub_80CB814(sprite))
    {
        sprite->pos2.y = 0;
        sprite->data[0] = 0;
        sprite->callback = sub_80CB8B8;
    }
}

void sub_80CB94C(struct Sprite* sprite)
{
    s16 e1;
    s16 e2;
    InitAnimSpritePos(sprite, 0);
    e1 = GetBattlerSpriteCoord(gAnimBankTarget, 0);
    e2 = GetBattlerSpriteCoord(gAnimBankTarget, 1);
    if ((gAnimBankAttacker ^ 2) == gAnimBankTarget)
    {
        sprite->data[6] = e1;
        sprite->data[7] = e2 + 10;
        sub_80CB7EC(sprite, 0x3C);
        sprite->data[3] = 1;
    }
    else
    {
        sprite->data[6] = e1;
        sprite->data[7] = e2 + 10;
        sub_80CB7EC(sprite, 0x3C);
        sprite->data[3] = 3;
    }

    sprite->data[4] = 0x3C;
    sprite->callback = sub_80CB8E8;
}

void sub_80CB9C4(struct Sprite* sprite)
{
    int zero;
    sprite->data[0] += ((sprite->data[3] * 128) / sprite->data[4]);
    zero = 0;
    if (sprite->data[0] > 0x7F)
    {
        sprite->data[1]++;
        sprite->data[0] = zero;
    }

    sprite->pos2.y = Sin(sprite->data[0] + 0x80, 30 - sprite->data[1] * 8);
    if (sub_80CB814(sprite))
    {
        sprite->pos2.y = zero;
        sprite->data[0] = zero;
        DestroyAnimSprite(sprite);
    }
}

void sub_80CBA28(struct Sprite* sprite)
{
    s16 e = GetBattlerSpriteCoord(gAnimBankTarget, 1);
    if (GetBattlerSide(gAnimBankTarget) == 0)
    {
        sprite->data[6] = 0;
        sprite->data[7] = e + 10;
        sub_80CB7EC(sprite, 0x28);
        sprite->data[3] = 3;
        sprite->data[4] = 0x3C;
        sprite->callback = sub_80CB8E8;
    }
    else
    {
        sprite->data[6] = 255;
        sprite->data[7] = e + 10;
        if (IsContest())
            sprite->data[6] = 0;

        sub_80CB7EC(sprite, 0x28);
        sprite->data[3] = 3;
        sprite->data[4] = 0x3C;
        sprite->callback = sub_80CB9C4;
    }
}
