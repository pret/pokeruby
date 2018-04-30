#include "global.h"
#include "battle_anim.h"
#include "sprite.h"

extern s16 gBattleAnimArgs[8];

void sub_80D2BE8(struct Sprite *sprite);

const union AnimCmd gSpriteAnim_83D7C18[] =
{
    ANIMCMD_FRAME(0, 4),
    ANIMCMD_FRAME(16, 4),
    ANIMCMD_FRAME(32, 4),
    ANIMCMD_FRAME(48, 4),
    ANIMCMD_END,
};

const union AnimCmd gSpriteAnim_83D7C2C[] =
{
    ANIMCMD_FRAME(0, 4, .hFlip = TRUE),
    ANIMCMD_FRAME(16, 4, .hFlip = TRUE),
    ANIMCMD_FRAME(32, 4, .hFlip = TRUE),
    ANIMCMD_FRAME(48, 4, .hFlip = TRUE),
    ANIMCMD_END,
};

const union AnimCmd *const gSpriteAnimTable_83D7C40[] =
{
    gSpriteAnim_83D7C18,
    gSpriteAnim_83D7C2C,
};

const struct SpriteTemplate gBattleAnimSpriteTemplate_83D7C48 =
{
    .tileTag = 10222,
    .paletteTag = 10222,
    .oam = &gOamData_837DF34,
    .anims = gSpriteAnimTable_83D7C40,
    .images = NULL,
    .affineAnims = gDummySpriteAffineAnimTable,
    .callback = sub_80D2BE8,
};

void sub_80D2BE8(struct Sprite *sprite)
{
    if (sprite->data[0] == 0)
    {
        sprite->pos1.x += gBattleAnimArgs[0];
        sprite->pos1.y += gBattleAnimArgs[1];
        StartSpriteAnim(sprite, gBattleAnimArgs[2]);
        sprite->data[0]++;
    }
    else if (sprite->animEnded)
    {
        DestroyAnimSprite(sprite);
    }
}
