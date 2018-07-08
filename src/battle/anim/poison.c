#include "global.h"
#include "battle_anim.h"
#include "rom_8077ABC.h"
#include "trig.h"

extern s16 gBattleAnimArgs[];
extern u8 gAnimBankAttacker;
extern u8 gAnimBankTarget;

extern const union AnimCmd *const gSpriteAnimTable_83D9310[];

void sub_80793C4(struct Sprite *sprite);
void sub_80D9D70(struct Sprite *sprite);
void sub_80D9DF0(struct Sprite *sprite);
void sub_80D9E94(struct Sprite *sprite);
void sub_80D9F14(struct Sprite *sprite);
void AnimBubbleEffect(struct Sprite *sprite);
static void sub_80D9DD4(struct Sprite *sprite);
static void sub_80D9E78(struct Sprite *sprite);
static void sub_80D9EE8(struct Sprite *sprite);
static void AnimBubbleEffectStep(struct Sprite *sprite);

const union AnimCmd gSpriteAnim_83DA22C[] =
{
    ANIMCMD_FRAME(0, 5),
    ANIMCMD_FRAME(8, 5),
    ANIMCMD_FRAME(16, 5),
    ANIMCMD_FRAME(24, 5),
    ANIMCMD_END,
};

const union AnimCmd *const gSpriteAnimTable_83DA240[] =
{
    gSpriteAnim_83DA22C,
};

const struct SpriteTemplate gBattleAnimSpriteTemplate_83DA244 =
{
    .tileTag = 10151,
    .paletteTag = 10151,
    .oam = &gOamData_837DF74,
    .anims = gSpriteAnimTable_83DA240,
    .images = NULL,
    .affineAnims = gDummySpriteAffineAnimTable,
    .callback = sub_80793C4,
};

const union AnimCmd gSpriteAnim_83DA25C[] =
{
    ANIMCMD_FRAME(0, 1),
    ANIMCMD_END,
};

const union AnimCmd gSpriteAnim_83DA264[] =
{
    ANIMCMD_FRAME(4, 1),
    ANIMCMD_END,
};

const union AnimCmd gSpriteAnim_83DA26C[] =
{
    ANIMCMD_FRAME(8, 1),
    ANIMCMD_END,
};

const union AnimCmd *const gSpriteAnimTable_83DA274[] =
{
    gSpriteAnim_83DA25C,
};

const union AnimCmd *const gSpriteAnimTable_83DA278[] =
{
    gSpriteAnim_83DA264,
};

const union AnimCmd *const gSpriteAnimTable_83DA27C[] =
{
    gSpriteAnim_83DA26C,
};

const union AffineAnimCmd gSpriteAffineAnim_83DA280[] =
{
    AFFINEANIMCMD_FRAME(0x160, 0x160, 0, 0),
    AFFINEANIMCMD_FRAME(0xFFF6, 0xFFF6, 0, 10),
    AFFINEANIMCMD_FRAME(0xA, 0xA, 0, 10),
    AFFINEANIMCMD_JUMP(0),
};

const union AffineAnimCmd gSpriteAffineAnim_83DA2A0[] =
{
    AFFINEANIMCMD_FRAME(0xEC, 0xEC, 0, 0),
    AFFINEANIMCMD_END,
};

const union AffineAnimCmd *const gSpriteAffineAnimTable_83DA2B0[] =
{
    gSpriteAffineAnim_83DA280,
};

const union AffineAnimCmd *const gSpriteAffineAnimTable_83DA2B4[] =
{
    gSpriteAffineAnim_83DA2A0,
};

const struct SpriteTemplate gBattleAnimSpriteTemplate_83DA2B8 =
{
    .tileTag = 10150,
    .paletteTag = 10150,
    .oam = &gOamData_837DFEC,
    .anims = gSpriteAnimTable_83DA274,
    .images = NULL,
    .affineAnims = gSpriteAffineAnimTable_83DA2B0,
    .callback = sub_80D9D70,
};

const struct SpriteTemplate gBattleAnimSpriteTemplate_83DA2D0 =
{
    .tileTag = 10150,
    .paletteTag = 10150,
    .oam = &gOamData_837DFEC,
    .anims = gSpriteAnimTable_83DA274,
    .images = NULL,
    .affineAnims = gSpriteAffineAnimTable_83DA2B0,
    .callback = sub_80D9DF0,
};

const struct SpriteTemplate gBattleAnimSpriteTemplate_83DA2E8 =
{
    .tileTag = 10150,
    .paletteTag = 10150,
    .oam = &gOamData_837DF8C,
    .anims = gSpriteAnimTable_83DA27C,
    .images = NULL,
    .affineAnims = gSpriteAffineAnimTable_83DA2B4,
    .callback = sub_80D9E94,
};

const union AffineAnimCmd gSpriteAffineAnim_83DA300[] =
{
    AFFINEANIMCMD_FRAME(0xFFF0, 0x10, 0, 6),
    AFFINEANIMCMD_FRAME(0x10, 0xFFF0, 0, 6),
    AFFINEANIMCMD_JUMP(0),
};

const union AffineAnimCmd *const gSpriteAffineAnimTable_83DA318[] =
{
    gSpriteAffineAnim_83DA300,
};

const struct SpriteTemplate gBattleAnimSpriteTemplate_83DA31C =
{
    .tileTag = 10150,
    .paletteTag = 10150,
    .oam = &gOamData_837DFEC,
    .anims = gSpriteAnimTable_83DA278,
    .images = NULL,
    .affineAnims = gSpriteAffineAnimTable_83DA318,
    .callback = sub_80D9F14,
};

const union AffineAnimCmd gSpriteAffineAnim_83DA334[] =
{
    AFFINEANIMCMD_FRAME(0x9C, 0x9C, 0, 0),
    AFFINEANIMCMD_FRAME(0x5, 0x5, 0, 20),
    AFFINEANIMCMD_END,
};

const union AffineAnimCmd *const gSpriteAffineAnimTable_83DA34C[] =
{
    gSpriteAffineAnim_83DA334,
};

const struct SpriteTemplate gPoisonBubbleSpriteTemplate =
{
    .tileTag = 10150,
    .paletteTag = 10150,
    .oam = &gOamData_837DF8C,
    .anims = gSpriteAnimTable_83DA274,
    .images = NULL,
    .affineAnims = gSpriteAffineAnimTable_83DA34C,
    .callback = AnimBubbleEffect,
};

const struct SpriteTemplate gWaterBubbleSpriteTemplate =
{
    .tileTag = 10155,
    .paletteTag = 10155,
    .oam = &gOamData_837E0AC,
    .anims = gSpriteAnimTable_83D9310,
    .images = NULL,
    .affineAnims = gSpriteAffineAnimTable_83DA34C,
    .callback = AnimBubbleEffect,
};

void sub_80D9D70(struct Sprite *sprite)
{
    if (!gBattleAnimArgs[3])
        StartSpriteAnim(sprite, 2);

    InitAnimSpritePos(sprite, 1);

    sprite->data[0] = gBattleAnimArgs[2];
    sprite->data[2] = GetBattlerSpriteCoord(gAnimBankTarget, 2);
    sprite->data[4] = GetBattlerSpriteCoord(gAnimBankTarget, 3);
    sprite->data[5] = -30;

    InitAnimArcTranslation(sprite);

    sprite->callback = sub_80D9DD4;
}

static void sub_80D9DD4(struct Sprite *sprite) // same as sub_80D9E78
{
    if (TranslateAnimArc(sprite))
        DestroyAnimSprite(sprite);
}

void sub_80D9DF0(struct Sprite *sprite)
{
    s16 l1, l2;
    if (!gBattleAnimArgs[3])
        StartSpriteAnim(sprite, 2);

    InitAnimSpritePos(sprite, 1);
    SetAverageBattlerPositions(gAnimBankTarget, 1, &l1, &l2);

    if (GetBattlerSide(gAnimBankAttacker))
        gBattleAnimArgs[4] = -gBattleAnimArgs[4];

    sprite->data[0] = gBattleAnimArgs[2];
    sprite->data[2] = l1 + gBattleAnimArgs[4];
    sprite->data[4] = l2 + gBattleAnimArgs[5];
    sprite->data[5] = -30;

    InitAnimArcTranslation(sprite);

    sprite->callback = sub_80D9E78;
}

static void sub_80D9E78(struct Sprite *sprite) // same as sub_80D9DD4
{
    if (TranslateAnimArc(sprite))
        DestroyAnimSprite(sprite);
}

void sub_80D9E94(struct Sprite *sprite)
{
    sprite->data[0] = gBattleAnimArgs[2];
    sprite->data[1] = sprite->pos1.x;
    sprite->data[2] = sprite->pos1.x + gBattleAnimArgs[0];
    sprite->data[3] = sprite->pos1.y;
    sprite->data[4] = sprite->pos1.y + gBattleAnimArgs[1];

    InitSpriteDataForLinearTranslation(sprite);

    sprite->data[5] = sprite->data[1] / gBattleAnimArgs[2];
    sprite->data[6] = sprite->data[2] / gBattleAnimArgs[2];

    sprite->callback = sub_80D9EE8;
}

static void sub_80D9EE8(struct Sprite *sprite)
{
    sub_8078394(sprite);

    sprite->data[1] -= sprite->data[5];
    sprite->data[2] -= sprite->data[6];

    if (!sprite->data[0])
        DestroyAnimSprite(sprite);
}

void sub_80D9F14(struct Sprite *sprite)
{
    SetAverageBattlerPositions(gAnimBankTarget, TRUE, &sprite->pos1.x, &sprite->pos1.y);

    if (GetBattlerSide(gAnimBankAttacker))
        gBattleAnimArgs[0] = -gBattleAnimArgs[0];

    sprite->pos1.x += gBattleAnimArgs[0];
    sprite->pos1.y += gBattleAnimArgs[1];

    sprite->data[0] = gBattleAnimArgs[4];
    sprite->data[2] = sprite->pos1.x + gBattleAnimArgs[2];
    sprite->data[4] = sprite->pos1.y + sprite->data[0];

    sprite->callback = StartAnimLinearTranslation;
    StoreSpriteCallbackInData(sprite, DestroyAnimSprite);
}

// Animates a bubble by rising upward, swaying side to side, and
// enlarging the sprite. This is used as an after-effect by poison-type
// moves, along with MOVE_BUBBLE, and MOVE_BUBBLEBEAM.
// arg 0: initial x pixel offset
// arg 1: initial y pixel offset
// arg 2: 0 = single-target, 1 = multi-target
void AnimBubbleEffect(struct Sprite *sprite)
{
    if (!gBattleAnimArgs[2])
    {
        sub_8078764(sprite, TRUE);
    }
    else
    {
        SetAverageBattlerPositions(gAnimBankTarget, TRUE, &sprite->pos1.x, &sprite->pos1.y);

        if (GetBattlerSide(gAnimBankAttacker))
            gBattleAnimArgs[0] = -gBattleAnimArgs[0];

        sprite->pos1.x += gBattleAnimArgs[0];
        sprite->pos1.y += gBattleAnimArgs[1];
    }

    sprite->callback = AnimBubbleEffectStep;
}

static void AnimBubbleEffectStep(struct Sprite *sprite)
{
    sprite->data[0] = (sprite->data[0] + 0xB) & 0xFF;
    sprite->pos2.x = Sin(sprite->data[0], 4);
    sprite->data[1] += 0x30;
    sprite->pos2.y = -(sprite->data[1] >> 8);

    if (sprite->affineAnimEnded)
        DestroyAnimSprite(sprite);
}