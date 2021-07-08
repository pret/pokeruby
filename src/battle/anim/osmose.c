#include "global.h"
#include "rom_8077ABC.h"
#include "trig.h"
#include "battle_anim.h"

extern s16 gBattleAnimArgs[];
extern u8 gBattleAnimAttacker;
extern u8 gBattleAnimTarget;

void sub_80CB768(struct Sprite* sprite);

// osmose
// Used by Ingrain.

const union AnimCmd gSpriteAnim_83D6688[] =
{
    ANIMCMD_FRAME(3, 3),
    ANIMCMD_FRAME(0, 5),
    ANIMCMD_JUMP(0),
};

const union AnimCmd *const gSpriteAnimTable_83D6694[] =
{
    gSpriteAnim_83D6688,
};

const struct SpriteTemplate gBattleAnimSpriteTemplate_83D6698 =
{
    .tileTag = ANIM_TAG_ORBS,
    .paletteTag = ANIM_TAG_ORBS,
    .oam = &gOamData_837DF24,
    .anims = gSpriteAnimTable_83D6694,
    .images = NULL,
    .affineAnims = gDummySpriteAffineAnimTable,
    .callback = sub_80CB768,
};

void sub_80CB768(struct Sprite* sprite)
{
    if (!sprite->data[0])
    {
        sprite->x = GetBattlerSpriteCoord(gBattleAnimAttacker, 2) + gBattleAnimArgs[0];
        sprite->y = GetBattlerSpriteCoord(gBattleAnimAttacker, 1) + gBattleAnimArgs[1];
        sprite->data[1] = gBattleAnimArgs[2];
        sprite->data[2] = gBattleAnimArgs[3];
        sprite->data[3] = gBattleAnimArgs[4];
    }

    sprite->data[0]++;
    sprite->x2 = sprite->data[1] * sprite->data[0];
    sprite->y2 = Sin((sprite->data[0] * 20) & 0xFF, sprite->data[2]);
    if (sprite->data[0] > sprite->data[3])
        DestroyAnimSprite(sprite);
}
