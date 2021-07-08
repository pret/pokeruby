#include "global.h"
#include "rom_8077ABC.h"
#include "trig.h"
#include "battle_anim.h"
#include "sound.h"

extern s16 gBattleAnimArgs[];
extern u8 gBattleAnimAttacker;
extern u8 gBattleAnimTarget;

void AnimOrbitFast(struct Sprite* sprite);
void AnimOrbitScatter(struct Sprite* sprite);
static void AnimOrbitFastStep(struct Sprite* sprite);
static void AnimOrbitScatterStep(struct Sprite* sprite);

const union AffineAnimCmd gSpriteAffineAnim_83D7AF8[] =
{
    AFFINEANIMCMD_FRAME(0x80, 0x80, 0, 0),
    AFFINEANIMCMD_FRAME(0x8, 0x8, 0, 1),
    AFFINEANIMCMD_JUMP(1),
};

const union AffineAnimCmd *const gSpriteAffineAnimTable_83D7B10[] =
{
    gSpriteAffineAnim_83D7AF8,
};

const struct SpriteTemplate gHiddenPowerOrbSpriteTemplate =
{
    .tileTag = ANIM_TAG_RED_ORB,
    .paletteTag = ANIM_TAG_RED_ORB,
    .oam = &gOamData_837DF8C,
    .anims = gDummySpriteAnimTable,
    .images = NULL,
    .affineAnims = gSpriteAffineAnimTable_83D7B10,
    .callback = AnimOrbitFast,
};

const struct SpriteTemplate gHiddenPowerOrbScatterSpriteTemplate =
{
    .tileTag = ANIM_TAG_RED_ORB,
    .paletteTag = ANIM_TAG_RED_ORB,
    .oam = &gOamData_837DFEC,
    .anims = gDummySpriteAnimTable,
    .images = NULL,
    .affineAnims = gSpriteAffineAnimTable_83D7B10,
    .callback = AnimOrbitScatter,
};

// Orbits a sphere in an ellipse around the mon.
// Used by MOVE_HIDDEN_POWER
// arg 0: duration
// arg 1: initial wave offset
void AnimOrbitFast(struct Sprite* sprite)
{
    sprite->x = GetBattlerSpriteCoord(gBattleAnimAttacker, 2);
    sprite->y = GetBattlerSpriteCoord(gBattleAnimAttacker, 3);
    sprite->affineAnimPaused = 1;
    sprite->data[0] = gBattleAnimArgs[0];
    sprite->data[1] = gBattleAnimArgs[1];
    sprite->data[7] = GetBattlerSubpriority(gBattleAnimAttacker);
    sprite->callback = AnimOrbitFastStep;
    sprite->callback(sprite);
}

static void AnimOrbitFastStep(struct Sprite* sprite)
{
    if ((u16)(sprite->data[1] - 0x40) <= 0x7F)
        sprite->subpriority = sprite->data[7] + 1;
    else
        sprite->subpriority = sprite->data[7] - 1;

    sprite->x2 = Sin(sprite->data[1], sprite->data[2] >> 8);
    sprite->y2 = Cos(sprite->data[1], sprite->data[3] >> 8);
    sprite->data[1] = (sprite->data[1] + 9) & 0xFF;
    switch (sprite->data[5])
    {
    case 1:
        sprite->data[2] -= 0x400;
        sprite->data[3] -= 0x100;
        if (++sprite->data[4] == sprite->data[0])
        {
            sprite->data[5] = 2;
            return;
        }
        break;
    case 0:
        sprite->data[2] += 0x400;
        sprite->data[3] += 0x100;
        if (++sprite->data[4] == sprite->data[0])
        {
            sprite->data[4] = 0;
            sprite->data[5] = 1;
        }
        break;
    }

    if ((u16)gBattleAnimArgs[7] == 0xFFFF)
        DestroyAnimSprite(sprite);
}

// Moves orbs away from the mon, based on where they are in their orbit.
// Used in MOVE_HIDDEN_POWER.
// arg 0: initial wave offset
void AnimOrbitScatter(struct Sprite* sprite)
{
    sprite->x = GetBattlerSpriteCoord(gBattleAnimAttacker, 2);
    sprite->y = GetBattlerSpriteCoord(gBattleAnimAttacker, 3);
    sprite->data[0] = Sin(gBattleAnimArgs[0], 10);
    sprite->data[1] = Cos(gBattleAnimArgs[0], 7);
    sprite->callback = AnimOrbitScatterStep;
}

static void AnimOrbitScatterStep(struct Sprite* sprite)
{
    sprite->x2 += sprite->data[0];
    sprite->y2 += sprite->data[1];
    if (sprite->x + sprite->x2 + 16 > 0x110u || sprite->y + sprite->y2 > 0xA0 || sprite->y + sprite->y2 < -16)
        DestroyAnimSprite(sprite);
}
