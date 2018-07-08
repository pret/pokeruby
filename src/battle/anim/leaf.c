#include "global.h"
#include "battle.h"
#include "battle_anim.h"
#include "rom_8077ABC.h"
#include "trig.h"

extern s16 gBattleAnimArgs[];
extern u8 gAnimBankAttacker;
extern u8 gAnimBankTarget;

void sub_80CAED8(struct Sprite* sprite);
void AnimMoveTwisterParticle(struct Sprite* sprite);
void AnimTranslateLinearSingleSineWave(struct Sprite* sprite);
static void sub_80CAF20(struct Sprite* sprite);
static void sub_80CAF6C(struct Sprite* sprite);
static void AnimTranslateLinearSingleSineWaveStep(struct Sprite* sprite);
static void AnimMoveTwisterParticleStep(struct Sprite* sprite);

// leaf
// Used by Razor Leaf and Twister.

const union AnimCmd gSpriteAnim_83D6458[] =
{
    ANIMCMD_FRAME(0, 5),
    ANIMCMD_FRAME(4, 5),
    ANIMCMD_FRAME(8, 5),
    ANIMCMD_FRAME(12, 5),
    ANIMCMD_FRAME(16, 5),
    ANIMCMD_FRAME(20, 5),
    ANIMCMD_FRAME(16, 5),
    ANIMCMD_FRAME(12, 5),
    ANIMCMD_FRAME(8, 5),
    ANIMCMD_FRAME(4, 5),
    ANIMCMD_JUMP(0),
};

const union AnimCmd gSpriteAnim_83D6484[] =
{
    ANIMCMD_FRAME(24, 5),
    ANIMCMD_FRAME(28, 5),
    ANIMCMD_FRAME(32, 5),
    ANIMCMD_END,
};

const union AnimCmd *const gSpriteAnimTable_83D6494[] =
{
    gSpriteAnim_83D6458,
    gSpriteAnim_83D6484,
};

const struct SpriteTemplate gBattleAnimSpriteTemplate_83D649C =
{
    .tileTag = 10063,
    .paletteTag = 10063,
    .oam = &gOamData_837DF2C,
    .anims = gSpriteAnimTable_83D6494,
    .images = NULL,
    .affineAnims = gDummySpriteAffineAnimTable,
    .callback = sub_80CAED8,
};

const struct SpriteTemplate gBattleAnimSpriteTemplate_83D64B4 =
{
    .tileTag = 10063,
    .paletteTag = 10063,
    .oam = &gOamData_837DF2C,
    .anims = gSpriteAnimTable_83D6494,
    .images = NULL,
    .affineAnims = gDummySpriteAffineAnimTable,
    .callback = AnimMoveTwisterParticle,
};

const union AnimCmd gSpriteAnim_83D64CC[] =
{
    ANIMCMD_FRAME(0, 3),
    ANIMCMD_FRAME(0, 3, .hFlip = TRUE),
    ANIMCMD_FRAME(0, 3, .vFlip = TRUE, .hFlip = TRUE),
    ANIMCMD_FRAME(0, 3, .vFlip = TRUE),
    ANIMCMD_JUMP(0),
};

const union AnimCmd *const gSpriteAnimTable_83D64E0[] =
{
    gSpriteAnim_83D64CC,
};

const struct SpriteTemplate gBattleAnimSpriteTemplate_83D64E4 =
{
    .tileTag = 10160,
    .paletteTag = 10160,
    .oam = &gOamData_837DF54,
    .anims = gSpriteAnimTable_83D64E0,
    .images = NULL,
    .affineAnims = gDummySpriteAffineAnimTable,
    .callback = AnimTranslateLinearSingleSineWave,
};

const union AffineAnimCmd gSpriteAffineAnim_83D64FC[] = {
    AFFINEANIMCMD_FRAME(0, 0, 0, 1),
    AFFINEANIMCMD_JUMP(0),
};

const union AffineAnimCmd *const gSpriteAffineAnimTable_83D650C[] = {
    gSpriteAffineAnim_83D64FC,
};

const struct SpriteTemplate gSwiftStarSpriteTemplate =
{
    .tileTag = 10174,
    .paletteTag = 10174,
    .oam = &gOamData_837DF94,
    .anims = gDummySpriteAnimTable,
    .images = NULL,
    .affineAnims = gSpriteAffineAnimTable_83D650C,
    .callback = AnimTranslateLinearSingleSineWave,
};

void sub_80CAED8(struct Sprite* sprite)
{
    sprite->pos1.x = GetBattlerSpriteCoord(gAnimBankAttacker, 2);
    sprite->pos1.y = GetBattlerSpriteCoord(gAnimBankAttacker, 3);
    sprite->data[0] = gBattleAnimArgs[0];
    sprite->data[1] = gBattleAnimArgs[1];
    sprite->data[2] = gBattleAnimArgs[2];
    sprite->callback = sub_80CAF20;
}

static void sub_80CAF20(struct Sprite* sprite)
{
    if (!sprite->data[2])
    {
        if (sprite->data[1] & 1)
        {
            sprite->data[0] = 0x80;
            sprite->data[1] = 0;
            sprite->data[2] = 0;
        }
        else
        {
            sprite->data[0] = sprite->data[1] & 1;
            sprite->data[1] = sprite->data[1] & 1;
            sprite->data[2] = sprite->data[1] & 1;
        }
        sprite->callback = sub_80CAF6C;
    }
    else
    {
        sprite->data[2]--;
        sprite->pos1.x += sprite->data[0];
        sprite->pos1.y += sprite->data[1];
    }
}

static void sub_80CAF6C(struct Sprite* sprite)
{
    if (GetBattlerSide(gAnimBankAttacker))
    {
        sprite->pos2.x = -Sin(sprite->data[0], 0x19);
    }
    else
    {
        sprite->pos2.x = Sin(sprite->data[0], 0x19);
    }

    sprite->data[0] = (sprite->data[0] + 2) & 0xFF;
    sprite->data[1]++;
    if (!(sprite->data[1] & 1))
    {
        sprite->pos2.y++;
    }

    if (sprite->data[1] > 0x50)
    {
        DestroyAnimSprite(sprite);
    }
}

// Animates a sprite that moves linearly from one location to another, with a
// single-cycle sine wave added to the y position along the way.
// Used by Razor Leaf and Magical Leaf.
// arg 0: initial x offset
// arg 1: initial y offset
// arg 2: target x offset
// arg 3: target y offset
// arg 4: translation duration
// arg 5: wave amplitude
// arg 6: target between double battle opponents (boolean)
void AnimTranslateLinearSingleSineWave(struct Sprite* sprite)
{
    InitAnimSpritePos(sprite, 1);
    if (GetBattlerSide(gAnimBankAttacker) != B_SIDE_PLAYER)
    {
        gBattleAnimArgs[2] = -gBattleAnimArgs[2];
    }

    sprite->data[0] = gBattleAnimArgs[4];
    if (!gBattleAnimArgs[6])
    {
        sprite->data[2] = GetBattlerSpriteCoord(gAnimBankTarget, 2) + gBattleAnimArgs[2];
        sprite->data[4] = GetBattlerSpriteCoord(gAnimBankTarget, 3) + gBattleAnimArgs[3];
    }
    else
    {
        SetAverageBattlerPositions(gAnimBankTarget, 1, &sprite->data[2], &sprite->data[4]);
        sprite->data[2] += gBattleAnimArgs[2];
        sprite->data[4] += gBattleAnimArgs[3];
    }

    sprite->data[5] = gBattleAnimArgs[5];
    InitAnimArcTranslation(sprite);
    if (GetBattlerSide(gAnimBankAttacker) == GetBattlerSide(gAnimBankTarget))
    {
        sprite->data[0] = 1;
    }
    else
    {
        sprite->data[0] = 0;
    }

    sprite->callback = AnimTranslateLinearSingleSineWaveStep;
}

static void AnimTranslateLinearSingleSineWaveStep(struct Sprite* sprite)
{
    bool8 destroy = FALSE;
    s16 a = sprite->data[0];
    s16 b = sprite->data[7];
    s16 r0;
    
    sprite->data[0] = 1;
    TranslateAnimArc(sprite);
    r0 = sprite->data[7];
    sprite->data[0] = a;
    if (b > 0xC8 && r0 <= 0x37 && sprite->oam.affineParam == 0)
        sprite->oam.affineParam++;

    if (sprite->oam.affineParam != 0 && sprite->data[0] != 0)
    {
        sprite->invisible ^= 1;
        sprite->oam.affineParam++;
        if (sprite->oam.affineParam == 0x1E)
            destroy = TRUE;
    }
    
    if (sprite->pos1.x + sprite->pos2.x > 256
     || sprite->pos1.x + sprite->pos2.x < -16
     || sprite->pos1.y + sprite->pos2.y > 160
     || sprite->pos1.y + sprite->pos2.y < -16)
        destroy = TRUE;

    if (destroy)
        DestroyAnimSprite(sprite);
}

// Animates particles in the Twister move animation.
// arg 0: duration
// arg 1: total y delta (the particles rise upward)
// arg 2: wave period (higher means faster wave)
// arg 3: wave amplitude
// arg 4: speedup frame (particles move faster at the end of the animation)
void AnimMoveTwisterParticle(struct Sprite* sprite)
{
    if (!IsContest() && IsDoubleBattle() == TRUE)
    {
        SetAverageBattlerPositions(gAnimBankTarget, 1, &sprite->pos1.x, &sprite->pos1.y);
    }

    sprite->pos1.y += 32;
    sprite->data[0] = gBattleAnimArgs[0];
    sprite->data[1] = gBattleAnimArgs[1];
    sprite->data[2] = gBattleAnimArgs[2];
    sprite->data[3] = gBattleAnimArgs[3];
    sprite->data[4] = gBattleAnimArgs[4];
    sprite->callback = AnimMoveTwisterParticleStep;
}

static void AnimMoveTwisterParticleStep(struct Sprite* sprite)
{
    if (sprite->data[1] == 0xFF)
    {
        sprite->pos1.y -= 2;
    }
    else if (sprite->data[1] > 0)
    {
        sprite->pos1.y -= 2;
        sprite->data[1] -= 2;
    }

    sprite->data[5] += sprite->data[2];
    if (sprite->data[0] < sprite->data[4])
        sprite->data[5] += sprite->data[2];

    sprite->data[5] &= 0xFF;
    sprite->pos2.x = Cos(sprite->data[5], sprite->data[3]);
    sprite->pos2.y = Sin(sprite->data[5], 5);
    if (sprite->data[5] <= 0x7F)
    {
        sprite->oam.priority = sub_8079ED4(gAnimBankTarget) - 1;
    }
    else
    {
        sprite->oam.priority = sub_8079ED4(gAnimBankTarget) + 1;
    }

    sprite->data[0]--;
    if (!sprite->data[0])
        DestroyAnimSprite(sprite);
}
