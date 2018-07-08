#include "global.h"
#include "battle.h"
#include "battle_anim.h"
#include "rom_8077ABC.h"

extern s16 gBattleAnimArgs[8];
extern u8 gAnimBankAttacker;
extern u8 gAnimBankTarget;
extern u16 gBattleTypeFlags;

void sub_80D3014(struct Sprite *sprite);

// guard (moves guard rings upwards)
// Used in Safeguard.

const union AffineAnimCmd gSpriteAffineAnim_83D7D4C[] =
{
    AFFINEANIMCMD_FRAME(0x100, 0x100, 0, 0),
    AFFINEANIMCMD_END,
};

const union AffineAnimCmd gSpriteAffineAnim_83D7D5C[] =
{
    AFFINEANIMCMD_FRAME(0x200, 0x100, 0, 0),
    AFFINEANIMCMD_END,
};

const union AffineAnimCmd *const gSpriteAffineAnimTable_83D7D6C[] =
{
    gSpriteAffineAnim_83D7D4C,
    gSpriteAffineAnim_83D7D5C,
};

const struct SpriteTemplate gBattleAnimSpriteTemplate_83D7D74 =
{
    .tileTag = 10244,
    .paletteTag = 10244,
    .oam = &gOamData_837E13C,
    .anims = gDummySpriteAnimTable,
    .images = NULL,
    .affineAnims = gSpriteAffineAnimTable_83D7D6C,
    .callback = sub_80D3014,
};

void sub_80D3014(struct Sprite *sprite)
{
    if ((gBattleTypeFlags & BATTLE_TYPE_DOUBLE) && IsAnimBankSpriteVisible(gAnimBankAttacker ^ 2))
    {
        SetAverageBattlerPositions(gAnimBankAttacker, 0, &sprite->pos1.x, &sprite->pos1.y);
        sprite->pos1.y += 40;

        StartSpriteAffineAnim(sprite, 1);
    }
    else
    {
        sprite->pos1.x = GetBattlerSpriteCoord(gAnimBankAttacker, 0);
        sprite->pos1.y = GetBattlerSpriteCoord(gAnimBankAttacker, 1) + 40;
    }

    sprite->data[0] = 13;
    sprite->data[2] = sprite->pos1.x;
    sprite->data[4] = sprite->pos1.y - 72;

    sprite->callback = StartAnimLinearTranslation;
    StoreSpriteCallbackInData(sprite, DestroyAnimSprite);
}
