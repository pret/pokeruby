#include "global.h"
#include "rom_8077ABC.h"
#include "trig.h"
#include "battle_anim.h"
#include "sound.h"

extern s16 gBattleAnimArgs[];
extern u8 gAnimBankAttacker;
extern u8 gAnimBankTarget;

void sub_80D0930(struct Sprite* sprite);

// breath (a puff of smoke, usually from the mouth or nose of the Pokemon.)
// Used in Swagger and Bulk Up.

const union AnimCmd gSpriteAnim_83D7734[] =
{
    ANIMCMD_FRAME(0, 4, .hFlip = TRUE),
    ANIMCMD_FRAME(4, 40, .hFlip = TRUE),
    ANIMCMD_FRAME(8, 4, .hFlip = TRUE),
    ANIMCMD_FRAME(12, 4, .hFlip = TRUE),
    ANIMCMD_END,
};

const union AnimCmd gSpriteAnim_83D7748[] =
{
    ANIMCMD_FRAME(0, 4),
    ANIMCMD_FRAME(4, 40),
    ANIMCMD_FRAME(8, 4),
    ANIMCMD_FRAME(12, 4),
    ANIMCMD_END,
};

const union AnimCmd *const gSpriteAnimTable_83D775C[] =
{
    gSpriteAnim_83D7734,
    gSpriteAnim_83D7748,
};

const struct SpriteTemplate gBattleAnimSpriteTemplate_83D7764 =
{
    .tileTag = 10086,
    .paletteTag = 10086,
    .oam = &gOamData_837DF2C,
    .anims = gSpriteAnimTable_83D775C,
    .images = NULL,
    .affineAnims = gDummySpriteAffineAnimTable,
    .callback = sub_80D0930,
};

void sub_80D0930(struct Sprite* sprite)
{
    if (GetBattlerSide(gAnimBankAttacker) == 0)
    {
        StartSpriteAnim(sprite, 0);
        sprite->pos1.x = GetBattlerSpriteCoord(gAnimBankAttacker, 2) + 32;
        sprite->data[1] = 0x40;
    }
    else
    {
        StartSpriteAnim(sprite, 1);
        sprite->pos1.x = GetBattlerSpriteCoord(gAnimBankAttacker, 2) - 32;
        sprite->data[1] = -0x40;
    }

    sprite->pos1.y = GetBattlerSpriteCoord(gAnimBankAttacker, 3);
    sprite->data[0] = 0x34;
    sprite->data[2] = 0;
    sprite->data[3] = 0;
    sprite->data[4] = 0;
    StoreSpriteCallbackInData(sprite, DestroyAnimSprite);
    sprite->callback = sub_8078394;
}
