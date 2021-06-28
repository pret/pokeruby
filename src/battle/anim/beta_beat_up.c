#include "global.h"
#include "battle_anim.h"
#include "rom_8077ABC.h"
#include "trig.h"

extern s16 gBattleAnimArgs[8];
extern u8 gBattleAnimAttacker;
extern u8 gBattleAnimTarget;

void sub_80D6234(struct Sprite *sprite);
static void sub_80D6278(struct Sprite *);

// beta_beat_up

const union AffineAnimCmd gSpriteAffineAnim_83D97E8[] =
{
    AFFINEANIMCMD_FRAME(0x100, 0x100, 0, 0),
    AFFINEANIMCMD_FRAME(0x0, 0x0, 0, 20),
    AFFINEANIMCMD_FRAME(0x0, 0x0, -16, 60),
    AFFINEANIMCMD_END,
};

const union AffineAnimCmd *const gSpriteAffineAnimTable_83D9808[] =
{
    gSpriteAffineAnim_83D97E8,
};

const struct SpriteTemplate gSpriteTemplate_83D980C =
{
    .tileTag = ANIM_TAG_HANDS_AND_FEET,
    .paletteTag = ANIM_TAG_HANDS_AND_FEET,
    .oam = &gOamData_837DF94,
    .anims = gDummySpriteAnimTable,
    .images = NULL,
    .affineAnims = gSpriteAffineAnimTable_83D9808,
    .callback = sub_80D6234,
};

void sub_80D6234(struct Sprite *sprite)
{
    if (GetBattlerSide(gBattleAnimAttacker) != 0)
    {
        sprite->x -= gBattleAnimArgs[0];
    }
    else
    {
        sprite->x += gBattleAnimArgs[0];
    }

    sprite->callback = sub_80D6278;
}

static void sub_80D6278(struct Sprite *sprite)
{
    if (sprite->affineAnimEnded)
    {
        DestroySpriteAndMatrix(sprite);
    }
}
