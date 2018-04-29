#include "global.h"
#include "rom_8077ABC.h"
#include "trig.h"
#include "battle_anim.h"
#include "sound.h"

extern s16 gBattleAnimArgs[];
extern u8 gAnimBankAttacker;
extern u8 gAnimBankTarget;

void sub_80CF610(struct Sprite* sprite);

// alert (red thunder from the sides of a Pokemon, simulating more alert behavior.)
// Used in Kinesis.

const union AnimCmd gSpriteAnim_83D7428[] =
{
    ANIMCMD_FRAME(0, 3, .hFlip = TRUE),
    ANIMCMD_FRAME(8, 3, .hFlip = TRUE),
    ANIMCMD_FRAME(16, 3, .hFlip = TRUE),
    ANIMCMD_FRAME(24, 3, .hFlip = TRUE),
    ANIMCMD_FRAME(32, 3, .hFlip = TRUE),
    ANIMCMD_FRAME(40, 3, .hFlip = TRUE),
    ANIMCMD_FRAME(48, 3, .hFlip = TRUE),
    ANIMCMD_LOOP(1),
    ANIMCMD_END,
};

const union AnimCmd *const gSpriteAnimTable_83D744C[] =
{
    gSpriteAnim_83D7428,
};

const struct SpriteTemplate gBattleAnimSpriteTemplate_83D7450 =
{
    .tileTag = 10075,
    .paletteTag = 10075,
    .oam = &gOamData_837DF54,
    .anims = gSpriteAnimTable_83D744C,
    .images = NULL,
    .affineAnims = gDummySpriteAffineAnimTable,
    .callback = sub_80CF610,
};

void sub_80CF610(struct Sprite* sprite)
{
    sub_8078650(sprite);
    sub_807867C(sprite, gBattleAnimArgs[0]);
    sprite->pos1.y += gBattleAnimArgs[1];
    if (GetBattlerSide(gAnimBankAttacker) != 0)
    {
        sprite->hFlip = 1;
        if (gBattleAnimArgs[2] != 0)
            sprite->vFlip = 1;
    }
    else
    {
        if (gBattleAnimArgs[2] != 0)
            sprite->vFlip = 1;
    }

    sprite->callback = sub_8078600;
    StoreSpriteCallbackInData(sprite, DestroyAnimSprite);
}
