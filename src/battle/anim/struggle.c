#include "global.h"
#include "battle_anim.h"
#include "rom_8077ABC.h"
#include "sprite.h"

extern s16 gBattleAnimArgs[8];
extern u8 gAnimBankAttacker;
extern u8 gAnimBankTarget;

void sub_80D2C38(struct Sprite *sprite);
static void sub_80D2CC4(struct Sprite *);

const union AnimCmd gSpriteAnim_83D7C60[] =
{
    ANIMCMD_FRAME(0, 8),
    ANIMCMD_FRAME(16, 8),
    ANIMCMD_FRAME(32, 8),
    ANIMCMD_FRAME(16, 8),
    ANIMCMD_END,
};

const union AnimCmd gSpriteAnim_83D7C74[] =
{
    ANIMCMD_FRAME(16, 8, .hFlip = TRUE),
    ANIMCMD_FRAME(32, 8, .hFlip = TRUE),
    ANIMCMD_FRAME(16, 8, .hFlip = TRUE),
    ANIMCMD_FRAME(0, 8, .hFlip = TRUE),
    ANIMCMD_END,
};

const union AnimCmd *const gSpriteAnimTable_83D7C88[] =
{
    gSpriteAnim_83D7C60,
    gSpriteAnim_83D7C74,
};

const struct SpriteTemplate gBattleAnimSpriteTemplate_83D7C90 =
{
    .tileTag = 10215,
    .paletteTag = 10215,
    .oam = &gOamData_837DF34,
    .anims = gSpriteAnimTable_83D7C88,
    .images = NULL,
    .affineAnims = gDummySpriteAffineAnimTable,
    .callback = sub_80D2C38,
};

void sub_80D2C38(struct Sprite *sprite)
{
    if (gBattleAnimArgs[2] == 0)
    {
        DestroyAnimSprite(sprite);
    }
    else
    {
        if (gBattleAnimArgs[0] == 0)
        {
            sprite->pos1.x = GetBattlerSpriteCoord(gAnimBankAttacker, 2);
            sprite->pos1.y = GetBattlerSpriteCoord(gAnimBankAttacker, 3);
        }
        else
        {
            sprite->pos1.x = GetBattlerSpriteCoord(gAnimBankTarget, 2);
            sprite->pos1.y = GetBattlerSpriteCoord(gAnimBankTarget, 3);
        }

        if (gBattleAnimArgs[1] == 0)
            sprite->pos1.x += 32;
        else
            sprite->pos1.x -= 32;

        sprite->data[0] = gBattleAnimArgs[2];
        sprite->data[1] = gBattleAnimArgs[1];
        StartSpriteAnim(sprite, sprite->data[1]);
        sprite->callback = sub_80D2CC4;
    }
}

static void sub_80D2CC4(struct Sprite *sprite)
{
    if (sprite->animEnded)
    {
        if (--sprite->data[0] != 0)
            StartSpriteAnim(sprite, sprite->data[1]);
        else
            DestroyAnimSprite(sprite);
    }
}
