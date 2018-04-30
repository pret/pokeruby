#include "global.h"
#include "rom_8077ABC.h"
#include "trig.h"
#include "battle_anim.h"
#include "sound.h"

extern s16 gBattleAnimArgs[];
extern u8 gAnimBankAttacker;
extern u8 gAnimBankTarget;

void sub_80D0118(struct Sprite* sprite);

// cyclone (creates a circling motion like a cyclone, usually a wind sprite.)
// Used in Razor Wind.

const union AffineAnimCmd gSpriteAffineAnim_83D7640[] =
{
    AFFINEANIMCMD_FRAME(0x10, 0x100, 0, 0),
    AFFINEANIMCMD_FRAME(0x4, 0x0, 0, 40),
    AFFINEANIMCMD_END,
};

const union AffineAnimCmd *const gSpriteAffineAnimTable_83D7658[] =
{
    gSpriteAffineAnim_83D7640,
};

const struct SpriteTemplate gBattleAnimSpriteTemplate_83D765C =
{
    .tileTag = 10009,
    .paletteTag = 10009,
    .oam = &gOamData_837DFDC,
    .anims = gDummySpriteAnimTable,
    .images = NULL,
    .affineAnims = gSpriteAffineAnimTable_83D7658,
    .callback = sub_80D0118,
};

void sub_80D0118(struct Sprite* sprite)
{
    InitAnimSpritePos(sprite, 0);
    if (GetBattlerSide(gAnimBankAttacker) == 0)
        sprite->pos1.y += 16;

    sprite->data[0] = gBattleAnimArgs[4];
    sprite->data[1] = gBattleAnimArgs[2];
    sprite->data[2] = gBattleAnimArgs[5];
    sprite->data[3] = gBattleAnimArgs[6];
    sprite->data[4] = gBattleAnimArgs[3];
    sprite->callback = sub_8078114;
    StoreSpriteCallbackInData(sprite, DestroyAnimSprite);
    sprite->callback(sprite);
}
