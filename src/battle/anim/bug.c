#include "global.h"
#include "battle_anim.h"
#include "contest.h"
#include "rom_8077ABC.h"
#include "trig.h"

extern s16 gBattleAnimArgs[];
extern u8 gAnimBankAttacker;
extern u8 gAnimBankTarget;

void sub_80DC824(struct Sprite *sprite);
void sub_80DC8F4(struct Sprite *sprite);
void sub_80DC9A0(struct Sprite *sprite);
void sub_80DCA70(struct Sprite *sprite);
void sub_80DCB38(struct Sprite *sprite);
void AnimTranslateStinger(struct Sprite *sprite);
void AnimMissileArc(struct Sprite *sprite);
void sub_80DCE40(struct Sprite *sprite);
static void sub_80DCA38(struct Sprite *sprite);
static void sub_80DCAEC(struct Sprite *sprite);
static void sub_80DCB5C(struct Sprite *sprite);
static void sub_80DCBB4(struct Sprite *sprite);
static void AnimMissileArcStep(struct Sprite *sprite);

const union AffineAnimCmd gSpriteAffineAnim_83DAA80[] =
{
    AFFINEANIMCMD_FRAME(0x100, 0x100, 30, 0),
    AFFINEANIMCMD_END,
};

const union AffineAnimCmd gSpriteAffineAnim_83DAA90[] =
{
    AFFINEANIMCMD_FRAME(0x100, 0x100, -99, 0),
    AFFINEANIMCMD_END,
};

const union AffineAnimCmd gSpriteAffineAnim_83DAAA0[] =
{
    AFFINEANIMCMD_FRAME(0x100, 0x100, 94, 0),
    AFFINEANIMCMD_END,
};

const union AffineAnimCmd *const gSpriteAffineAnimTable_83DAAB0[] =
{
    gSpriteAffineAnim_83DAA80,
    gSpriteAffineAnim_83DAA90,
    gSpriteAffineAnim_83DAAA0,
};

const struct SpriteTemplate gBattleAnimSpriteTemplate_83DAABC =
{
    .tileTag = 10153,
    .paletteTag = 10153,
    .oam = &gOamData_837E014,
    .anims = gDummySpriteAnimTable,
    .images = NULL,
    .affineAnims = gSpriteAffineAnimTable_83DAAB0,
    .callback = sub_80DC824,
};

const union AffineAnimCmd gSpriteAffineAnim_83DAAD4[] =
{
    AFFINEANIMCMD_FRAME(0x0, 0x0, -33, 1),
    AFFINEANIMCMD_END,
};

const union AffineAnimCmd gSpriteAffineAnim_83DAAE4[] =
{
    AFFINEANIMCMD_FRAME(0x0, 0x0, 96, 1),
    AFFINEANIMCMD_END,
};

const union AffineAnimCmd gSpriteAffineAnim_83DAAF4[] =
{
    AFFINEANIMCMD_FRAME(0x0, 0x0, -96, 1),
    AFFINEANIMCMD_END,
};

const union AffineAnimCmd *const gSpriteAffineAnimTable_83DAB04[] =
{
    gSpriteAffineAnim_83DAAD4,
    gSpriteAffineAnim_83DAAE4,
    gSpriteAffineAnim_83DAAF4,
};

const struct SpriteTemplate gBattleAnimSpriteTemplate_83DAB10 =
{
    .tileTag = 10161,
    .paletteTag = 10161,
    .oam = &gOamData_837DF8C,
    .anims = gDummySpriteAnimTable,
    .images = NULL,
    .affineAnims = gSpriteAffineAnimTable_83DAB04,
    .callback = sub_80DC8F4,
};

const struct SpriteTemplate gBattleAnimSpriteTemplate_83DAB28 =
{
    .tileTag = 10180,
    .paletteTag = 10180,
    .oam = &gOamData_837DF24,
    .anims = gDummySpriteAnimTable,
    .images = NULL,
    .affineAnims = gDummySpriteAffineAnimTable,
    .callback = sub_80DC9A0,
};

const struct SpriteTemplate gBattleAnimSpriteTemplate_83DAB40 =
{
    .tileTag = 10179,
    .paletteTag = 10179,
    .oam = &gOamData_837DF5C,
    .anims = gDummySpriteAnimTable,
    .images = NULL,
    .affineAnims = gDummySpriteAffineAnimTable,
    .callback = sub_80DCA70,
};

const union AffineAnimCmd gSpriteAffineAnim_83DAB58[] =
{
    AFFINEANIMCMD_FRAME(0x10, 0x10, 0, 0),
    AFFINEANIMCMD_FRAME(0x6, 0x6, 0, 1),
    AFFINEANIMCMD_JUMP(1),
};

const union AffineAnimCmd *const gSpriteAffineAnimTable_83DAB70[] =
{
    gSpriteAffineAnim_83DAB58,
};

const struct SpriteTemplate gBattleAnimSpriteTemplate_83DAB74 =
{
    .tileTag = 10181,
    .paletteTag = 10181,
    .oam = &gOamData_837E11C,
    .anims = gDummySpriteAnimTable,
    .images = NULL,
    .affineAnims = gSpriteAffineAnimTable_83DAB70,
    .callback = sub_80DCB38,
};

const struct SpriteTemplate gLinearStingerSpriteTemplate =
{
    .tileTag = 10161,
    .paletteTag = 10161,
    .oam = &gOamData_837DF8C,
    .anims = gDummySpriteAnimTable,
    .images = NULL,
    .affineAnims = gDummySpriteAffineAnimTable,
    .callback = AnimTranslateStinger,
};

const struct SpriteTemplate gPinMissileSpriteTemplate =
{
    .tileTag = 10161,
    .paletteTag = 10161,
    .oam = &gOamData_837DF8C,
    .anims = gDummySpriteAnimTable,
    .images = NULL,
    .affineAnims = gDummySpriteAffineAnimTable,
    .callback = AnimMissileArc,
};

const struct SpriteTemplate gIcicleSpearSpriteTemplate =
{
    .tileTag = 10262,
    .paletteTag = 10262,
    .oam = &gOamData_837DF94,
    .anims = gDummySpriteAnimTable,
    .images = NULL,
    .affineAnims = gDummySpriteAffineAnimTable,
    .callback = AnimMissileArc,
};

const union AffineAnimCmd gSpriteAffineAnim_83DABD4[] =
{
    AFFINEANIMCMD_FRAME(0x10, 0x10, 0, 0),
    AFFINEANIMCMD_FRAME(0x8, 0x8, 0, 18),
    AFFINEANIMCMD_LOOP(0),
    AFFINEANIMCMD_FRAME(0xFFFB, 0xFFFB, 0, 8),
    AFFINEANIMCMD_FRAME(0x5, 0x5, 0, 8),
    AFFINEANIMCMD_LOOP(5),
    AFFINEANIMCMD_END,
};

const union AffineAnimCmd *const gSpriteAffineAnimTable_83DAC0C[] =
{
    gSpriteAffineAnim_83DABD4,
};

const struct SpriteTemplate gBattleAnimSpriteTemplate_83DAC10 =
{
    .tileTag = 10212,
    .paletteTag = 10212,
    .oam = &gOamData_837E0BC,
    .anims = gDummySpriteAnimTable,
    .images = NULL,
    .affineAnims = gSpriteAffineAnimTable_83DAC0C,
    .callback = sub_80DCE40,
};

// used in Move_MEGAHORN
void sub_80DC824(struct Sprite *sprite)
{
    if (IsContest())
    {
        StartSpriteAffineAnim(sprite, 2);
        gBattleAnimArgs[2] = -gBattleAnimArgs[2];
        gBattleAnimArgs[0] = -gBattleAnimArgs[0];
    }
    else if (!GetBattlerSide(gAnimBankTarget))
    {
        StartSpriteAffineAnim(sprite, 1);
        gBattleAnimArgs[1] = -gBattleAnimArgs[1];
        gBattleAnimArgs[2] = -gBattleAnimArgs[2];
        gBattleAnimArgs[3] = -gBattleAnimArgs[3];
        gBattleAnimArgs[0] = -gBattleAnimArgs[0];
    }

    sprite->pos1.x = sub_8077EE4(gAnimBankTarget, 2) + gBattleAnimArgs[0];
    sprite->pos1.y = sub_8077EE4(gAnimBankTarget, 3) + gBattleAnimArgs[1];
    sprite->data[0] = gBattleAnimArgs[4];

    sprite->data[2] = GetBattlerSpriteCoord(gAnimBankTarget, 2) + gBattleAnimArgs[2];
    sprite->data[4] = GetBattlerSpriteCoord(gAnimBankTarget, 3) + gBattleAnimArgs[3];

    sprite->callback = StartAnimLinearTranslation;
    StoreSpriteCallbackInData(sprite, DestroyAnimSprite);
}

// used in Move_LEECH_LIFE
void sub_80DC8F4(struct Sprite *sprite)
{
    if (IsContest())
    {
        gBattleAnimArgs[0] = -gBattleAnimArgs[0];
        StartSpriteAffineAnim(sprite, 2);
    }
    else if (!GetBattlerSide(gAnimBankTarget))
    {
        gBattleAnimArgs[1] = -gBattleAnimArgs[1];
        gBattleAnimArgs[0] = -gBattleAnimArgs[0];
    }

    sprite->pos1.x = sub_8077EE4(gAnimBankTarget, 2) + gBattleAnimArgs[0];
    sprite->pos1.y = sub_8077EE4(gAnimBankTarget, 3) + gBattleAnimArgs[1];
    sprite->data[0] = gBattleAnimArgs[2];

    sprite->data[2] = GetBattlerSpriteCoord(gAnimBankTarget, 2);
    sprite->data[4] = GetBattlerSpriteCoord(gAnimBankTarget, 3);

    sprite->callback = StartAnimLinearTranslation;
    StoreSpriteCallbackInData(sprite, DestroyAnimSprite);
}

// used in 2 moves:
//         Move_STRING_SHOT, Move_SPIDER_WEB
void sub_80DC9A0(struct Sprite *sprite)
{
    if (IsContest())
        gBattleAnimArgs[2] /= 2;

    InitAnimSpritePos(sprite, 1);
    sprite->data[0] = gBattleAnimArgs[2];
    sprite->data[1] = sprite->pos1.x;
    sprite->data[3] = sprite->pos1.y;

    if (!gBattleAnimArgs[4])
    {
        sprite->data[2] = GetBattlerSpriteCoord(gAnimBankTarget, 2);
        sprite->data[4] = GetBattlerSpriteCoord(gAnimBankTarget, 3);
    }
    else
    {
        SetAverageBattlerPositions(gAnimBankTarget, 1, &sprite->data[2], &sprite->data[4]);
    }

    sub_8078BD4(sprite);
    sprite->data[5] = gBattleAnimArgs[3];
    sprite->callback = sub_80DCA38;
}

static void sub_80DCA38(struct Sprite *sprite)
{
    if (TranslateAnimLinear(sprite))
    {
        DestroyAnimSprite(sprite);
        return;
    }

    sprite->pos2.x += Sin(sprite->data[6], sprite->data[5]);
    sprite->data[6] = (sprite->data[6] + 13) & 0xFF;
}

// used in Move_STRING_SHOT
void sub_80DCA70(struct Sprite *sprite)
{
    SetAverageBattlerPositions(gAnimBankTarget, 0, &sprite->pos1.x, &sprite->pos1.y);
    if (GetBattlerSide(gAnimBankAttacker))
        sprite->pos1.x -= gBattleAnimArgs[0];
    else
        sprite->pos1.x += gBattleAnimArgs[0];

    sprite->pos1.y += gBattleAnimArgs[1];
    if (!GetBattlerSide(gAnimBankTarget))
        sprite->pos1.y += 8;

    sprite->callback = sub_80DCAEC;
}

static void sub_80DCAEC(struct Sprite *sprite)
{
    if (++sprite->data[0] == 3)
    {
        sprite->data[0] = 0;
        sprite->invisible ^= 1;
    }

    if (++sprite->data[1] == 51)
    {
        DestroyAnimSprite(sprite);
    }
}

// used in Move_SPIDER_WEB
void sub_80DCB38(struct Sprite *sprite)
{
    REG_BLDCNT = 0x3F40;
    REG_BLDALPHA = 16;

    sprite->data[0] = 16;
    sprite->callback = sub_80DCB5C;
}

static void sub_80DCB5C(struct Sprite *sprite)
{
    if (sprite->data[2] < 20)
    {
        sprite->data[2]++;
    }
    else if (sprite->data[1]++ & 1)
    {
        sprite->data[0]--;
        REG_BLDALPHA = sprite->data[0] | ((16 - sprite->data[0]) << 8);

        if (sprite->data[0] == 0)
        {
            sprite->invisible = TRUE;
            sprite->callback = sub_80DCBB4;
        }
    }
}

static void sub_80DCBB4(struct Sprite *sprite)
{
    REG_BLDCNT = 0;
    REG_BLDALPHA = 0;
    DestroyAnimSprite(sprite);
}

// Translates a stinger sprite linearly to a destination location. The sprite is
// initially rotated so that it appears to be traveling in a straight line.
// Used by Move_POISON_STING, Move_TWINEEDLE, Move_SPIKE_CANNON
// arg 0: initial x pixel offset
// arg 1: initial y pixel offset
// arg 2: target x pixel offset
// arg 3: target y pixel offset
// arg 4: duration
void AnimTranslateStinger(struct Sprite *sprite)
{
    s16 lVarX, lVarY;
    u16 rot;

    if (IsContest())
    {
        gBattleAnimArgs[2] = -gBattleAnimArgs[2];
    }
    else
    {
        if (GetBattlerSide(gAnimBankAttacker))
        {
            gBattleAnimArgs[2] = -gBattleAnimArgs[2];
            gBattleAnimArgs[1] = -gBattleAnimArgs[1];
            gBattleAnimArgs[3] = -gBattleAnimArgs[3];
        }
    }

    if (!IsContest())
    {
        if (GetBattlerSide(gAnimBankAttacker) == GetBattlerSide(gAnimBankTarget))
        {
            if (GetBattlerPosition(gAnimBankTarget) == 0 || GetBattlerPosition(gAnimBankTarget) == 1)
            {
                s16 temp1, temp2;

                temp1 = gBattleAnimArgs[2];
                gBattleAnimArgs[2] = -temp1;

                temp2 = gBattleAnimArgs[0];
                gBattleAnimArgs[0] = -temp2;
            }
        }
    }

    InitAnimSpritePos(sprite, 1);

    lVarX = GetBattlerSpriteCoord(gAnimBankTarget, 2) + gBattleAnimArgs[2];
    lVarY = GetBattlerSpriteCoord(gAnimBankTarget, 3) + gBattleAnimArgs[3];
    rot = ArcTan2Neg(lVarX - sprite->pos1.x, lVarY - sprite->pos1.y);
    rot += 0xC000;
    sub_8078FDC(sprite, FALSE, 0x100, 0x100, rot);

    sprite->data[0] = gBattleAnimArgs[4];
    sprite->data[2] = lVarX;
    sprite->data[4] = lVarY;

    sprite->callback = StartAnimLinearTranslation;
    StoreSpriteCallbackInData(sprite, DestroyAnimSprite);
}

// used in 2 moves:
//         Move_PIN_MISSILE, Move_ICICLE_SPEAR
// Rotates sprite and moves it in an arc, so that it appears like a missle or arrow traveling.
// arg 0: initial x pixel offset
// arg 1: initial y pixel offset
// arg 2: target x pixel offset
// arg 3: target y pixel offset
// arg 4: duration
// arg 5: wave amplitude
void AnimMissileArc(struct Sprite *sprite)
{
    InitAnimSpritePos(sprite, 1);

    if (GetBattlerSide(gAnimBankAttacker))
        gBattleAnimArgs[2] = -gBattleAnimArgs[2];

    sprite->data[0] = gBattleAnimArgs[4];
    sprite->data[2] = GetBattlerSpriteCoord(gAnimBankTarget, 2) + gBattleAnimArgs[2];
    sprite->data[4] = GetBattlerSpriteCoord(gAnimBankTarget, 3) + gBattleAnimArgs[3];
    sprite->data[5] = gBattleAnimArgs[5];
    InitAnimArcTranslation(sprite);

    sprite->callback = AnimMissileArcStep;
    sprite->invisible = TRUE;
}

static void AnimMissileArcStep(struct Sprite *sprite)
{
    sprite->invisible = FALSE;

    if (TranslateAnimArc(sprite))
    {
        DestroyAnimSprite(sprite);
    }
    else
    {
        s16 tempData[8];
        u16 *data = sprite->data;
        u16 x1 = sprite->pos1.x;
        s16 x2 = sprite->pos2.x;
        u16 y1 = sprite->pos1.y;
        s16 y2 = sprite->pos2.y;
        int i;

        for (i = 0; i < 8; i++)
            tempData[i] = data[i];

        x2 += x1;
        y2 += y1;

        if (!TranslateAnimArc(sprite))
        {
            u16 rotation = ArcTan2Neg(sprite->pos1.x + sprite->pos2.x - x2,
                                  sprite->pos1.y + sprite->pos2.y - y2);
            rotation += 0xC000;
            sub_8078FDC(sprite, FALSE, 0x100, 0x100, rotation);

            for (i = 0; i < 8; i++)
                data[i] = tempData[i];
        }
    }
}

void sub_80DCE40(struct Sprite *sprite)
{
    if (gBattleAnimArgs[0] == 0)
    {
        sprite->pos1.x = GetBattlerSpriteCoord(gAnimBankAttacker, 2);
        sprite->pos1.y = GetBattlerSpriteCoord(gAnimBankAttacker, 3) + 18;
    }
    else
    {
        sprite->pos1.x = GetBattlerSpriteCoord(gAnimBankTarget, 2);
        sprite->pos1.y = GetBattlerSpriteCoord(gAnimBankTarget, 3) + 18;
    }

    StoreSpriteCallbackInData(sprite, move_anim_8074EE0);
    sprite->callback = sub_80785E4;
}
