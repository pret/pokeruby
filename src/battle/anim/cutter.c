#include "global.h"
#include "battle.h"
#include "rom_8077ABC.h"
#include "trig.h"
#include "battle_anim.h"

extern s16 gBattleAnimArgs[];
extern u8 gAnimBankAttacker;
extern u8 gAnimBankTarget;

static void AnimTranslateLinearSingleSineWaveStep(struct Sprite* sprite);
static void AnimMoveTwisterParticleStep(struct Sprite* sprite);

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
    InitAnimSpriteTranslationOverDuration(sprite);
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
    TranslateAnimSpriteLinearAndSine(sprite);
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
