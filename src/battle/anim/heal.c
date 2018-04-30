#include "global.h"
#include "rom_8077ABC.h"
#include "trig.h"
#include "battle_anim.h"

extern s16 gBattleAnimArgs[];
extern u8 gAnimBankAttacker;
extern u8 gAnimBankTarget;

void sub_80CBAA4(struct Sprite* sprite);

// heal (healing sparkles on a Pokemon)
// Used in Present, if the move heals instead of damages.

const union AnimCmd gSpriteAnim_83D674C[] =
{
    ANIMCMD_FRAME(0, 4),
    ANIMCMD_FRAME(4, 4),
    ANIMCMD_FRAME(8, 4),
    ANIMCMD_FRAME(12, 4),
    ANIMCMD_END,
};

const union AnimCmd *const gSpriteAnimTable_83D6760[] =
{
    gSpriteAnim_83D674C,
};

const struct SpriteTemplate gBattleAnimSpriteTemplate_83D6764 =
{
    .tileTag = 10195,
    .paletteTag = 10195,
    .oam = &gOamData_837DF2C,
    .anims = gSpriteAnimTable_83D6760,
    .images = NULL,
    .affineAnims = gDummySpriteAffineAnimTable,
    .callback = sub_80CBAA4,
};

void sub_80CBAA4(struct Sprite* sprite)
{
    if (sprite->data[0] == 0)
    {
        sub_8078764(sprite, 0);
        sprite->data[1] = gBattleAnimArgs[2];
    }

    sprite->data[0]++;
    sprite->pos2.y = sprite->data[1] * sprite->data[0];
    if (sprite->animEnded)
    {
        DestroyAnimSprite(sprite);
    }
}
