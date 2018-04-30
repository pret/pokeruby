#include "global.h"
#include "battle_anim.h"
#include "rom_8077ABC.h"
#include "trig.h"

extern s16 gBattleAnimArgs[8];
extern u8 gAnimBankAttacker;
extern u8 gAnimBankTarget;

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
    .tileTag = 10143,
    .paletteTag = 10143,
    .oam = &gOamData_837DF94,
    .anims = gDummySpriteAnimTable,
    .images = NULL,
    .affineAnims = gSpriteAffineAnimTable_83D9808,
    .callback = sub_80D6234,
};

void sub_80D6234(struct Sprite *sprite)
{
    if (GetBattlerSide(gAnimBankAttacker) != 0)
    {
        sprite->pos1.x -= gBattleAnimArgs[0];
    }
    else
    {
        sprite->pos1.x += gBattleAnimArgs[0];
    }

    sprite->callback = sub_80D6278;
}

static void sub_80D6278(struct Sprite *sprite)
{
    if (sprite->affineAnimEnded)
    {
        move_anim_8074EE0(sprite);
    }
}
