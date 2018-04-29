#include "global.h"
#include "rom_8077ABC.h"
#include "trig.h"
#include "battle_anim.h"
#include "sound.h"

extern s16 gBattleAnimArgs[];
extern u8 gAnimBankAttacker;
extern u8 gAnimBankTarget;

void sub_80CEA04(struct Sprite* sprite);

// fang
// Used by Super Fang (and probably Hyper Fang, but the actual callbacks are not in this file.)
// (Look into this one later.)

const union AnimCmd gSpriteAnim_83D7068[] =
{
    ANIMCMD_FRAME(0, 2),
    ANIMCMD_FRAME(16, 2),
    ANIMCMD_FRAME(32, 2),
    ANIMCMD_FRAME(48, 2),
    ANIMCMD_END,
};

const union AnimCmd *const gSpriteAnimTable_83D707C[] =
{
    gSpriteAnim_83D7068,
};

const struct SpriteTemplate gBattleAnimSpriteTemplate_83D7080 =
{
    .tileTag = 10192,
    .paletteTag = 10192,
    .oam = &gOamData_837DF34,
    .anims = gSpriteAnimTable_83D707C,
    .images = NULL,
    .affineAnims = gDummySpriteAffineAnimTable,
    .callback = sub_80CEA04,
};

void sub_80CEA04(struct Sprite* sprite)
{
    StoreSpriteCallbackInData(sprite, DestroyAnimSprite);
    sprite->callback = sub_8078600;
}
