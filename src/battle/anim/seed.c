#include "global.h"
#include "rom_8077ABC.h"
#include "trig.h"
#include "battle_anim.h"

extern s16 gBattleAnimArgs[];
extern u8 gAnimBankAttacker;
extern u8 gAnimBankTarget;

static void AnimLeechSeedStep(struct Sprite* sprite);
static void AnimLeechSeedSprouts(struct Sprite* sprite);

// seed (sprouts a sapling from a seed.)
// Used by Leech Seed.
// arg 0: initial x pixel offset
// arg 1: initial y pixel offset
// arg 2: target x pixel offset
// arg 3: target y pixel offset
// arg 4: duration
// arg 5: wave amplitude
void AnimLeechSeed(struct Sprite* sprite)
{
    InitAnimSpritePos(sprite, 1);
    if (GetBankSide(gAnimBankAttacker))
    {
        gBattleAnimArgs[2] = -gBattleAnimArgs[2];
    }

    sprite->data[0] = gBattleAnimArgs[4];
    sprite->data[2] = GetBankPosition(gAnimBankTarget, 0) + gBattleAnimArgs[2];
    sprite->data[4] = GetBankPosition(gAnimBankTarget, 1) + gBattleAnimArgs[3];
    sprite->data[5] = gBattleAnimArgs[5];
    InitAnimSpriteTranslationOverDuration(sprite);
    sprite->callback = AnimLeechSeedStep;
}

static void AnimLeechSeedStep(struct Sprite* sprite)
{
    if (TranslateAnimSpriteLinearAndSine(sprite))
    {
        sprite->invisible = 1;
        sprite->data[0] = 10;
        sprite->callback = WaitAnimForDuration;
        StoreSpriteCallbackInData(sprite, AnimLeechSeedSprouts);
    }
}

static void AnimLeechSeedSprouts(struct Sprite* sprite)
{
    sprite->invisible = 0;
    StartSpriteAnim(sprite, 1);
    sprite->data[0] = 60;
    sprite->callback = WaitAnimForDuration;
    StoreSpriteCallbackInData(sprite, DestroyAnimSprite);
}
