#include "global.h"
#include "rom_8077ABC.h"
#include "trig.h"
#include "battle_anim.h"
#include "sound.h"

extern s16 gBattleAnimArgs[];
extern u8 gAnimBankAttacker;
extern u8 gAnimBankTarget;

void sub_80D09C0(struct Sprite* sprite);

// anger (anger emotes, usually above the Pokemon's head, indicating annoyed emotions.)
// Used in Frustration, Rage, Swagger, Torment, and Taunt.

const union AffineAnimCmd gSpriteAffineAnim_83D777C[] =
{
    AFFINEANIMCMD_FRAME(0xB, 0xB, 0, 8),
    AFFINEANIMCMD_FRAME(0xFFF5, 0xFFF5, 0, 8),
    AFFINEANIMCMD_END,
};

const union AffineAnimCmd *const gSpriteAffineAnimTable_83D7794[] =
{
    gSpriteAffineAnim_83D777C,
};

const struct SpriteTemplate gBattleAnimSpriteTemplate_83D7798 =
{
    .tileTag = 10087,
    .paletteTag = 10087,
    .oam = &gOamData_837DF8C,
    .anims = gDummySpriteAnimTable,
    .images = NULL,
    .affineAnims = gSpriteAffineAnimTable_83D7794,
    .callback = sub_80D09C0,
};

void sub_80D09C0(struct Sprite* sprite)
{
    u8 bank;
    if (gBattleAnimArgs[0] == 0)
        bank = gAnimBankAttacker;
    else
        bank = gAnimBankTarget;

    if (GetBattlerSide(bank) == 1)
    {
        gBattleAnimArgs[1] *= -1;
    }

    sprite->pos1.x = GetBattlerSpriteCoord(bank, 2) + gBattleAnimArgs[1];
    sprite->pos1.y = GetBattlerSpriteCoord(bank, 3) + gBattleAnimArgs[2];
    if (sprite->pos1.y <= 7)
        sprite->pos1.y = 8;

    StoreSpriteCallbackInData(sprite, move_anim_8074EE0);
    sprite->callback = sub_80785E4;
}
