#include "global.h"
#include "rom_8077ABC.h"
#include "trig.h"
#include "battle_anim.h"
#include "sound.h"

extern s16 gBattleAnimArgs[];
extern u8 gBattleAnimAttacker;
extern u8 gBattleAnimTarget;

void sub_80CDF0C(struct Sprite* sprite);
static void sub_80CDF70(struct Sprite* sprite);

// brace (the Pokemon prepares to endure a hit)
// Used in Endure.

const union AnimCmd gSpriteAnim_83D6E80[] =
{
    ANIMCMD_FRAME(0, 4),
    ANIMCMD_FRAME(8, 12),
    ANIMCMD_FRAME(16, 4),
    ANIMCMD_FRAME(24, 4),
    ANIMCMD_END,
};

const union AnimCmd *const gSpriteAnimTable_83D6E94[] =
{
    gSpriteAnim_83D6E80,
};

const struct SpriteTemplate gBattleAnimSpriteTemplate_EndureFlame =
{
    .tileTag = ANIM_TAG_FOCUS_ENERGY,
    .paletteTag = ANIM_TAG_FOCUS_ENERGY,
    .oam = &gOamData_837DF74,
    .anims = gSpriteAnimTable_83D6E94,
    .images = NULL,
    .affineAnims = gDummySpriteAffineAnimTable,
    .callback = sub_80CDF0C,
};

void sub_80CDF0C(struct Sprite* sprite)
{
    if (gBattleAnimArgs[0] == 0)
    {
        sprite->pos1.x = GetBattlerSpriteCoord(gBattleAnimAttacker, 0) + gBattleAnimArgs[1];
        sprite->pos1.y = GetBattlerSpriteCoord(gBattleAnimAttacker, 1) + gBattleAnimArgs[2];
    }
    else
    {
        sprite->pos1.x = GetBattlerSpriteCoord(gBattleAnimTarget, 0) + gBattleAnimArgs[1];
        sprite->pos1.y = GetBattlerSpriteCoord(gBattleAnimTarget, 1) + gBattleAnimArgs[2];
    }

    sprite->data[0] = 0;
    sprite->data[1] = gBattleAnimArgs[3];
    sprite->callback = sub_80CDF70;
}

static void sub_80CDF70(struct Sprite* sprite)
{
    if (++sprite->data[0] > sprite->data[1])
    {
        sprite->data[0] = 0;
        sprite->pos1.y--;
    }

    sprite->pos1.y -= sprite->data[0];
    if (sprite->animEnded)
        DestroyAnimSprite(sprite);
}
