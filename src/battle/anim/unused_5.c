#include "global.h"
#include "rom_8077ABC.h"
#include "trig.h"
#include "battle_anim.h"
#include "sound.h"

extern s16 gBattleAnimArgs[];
extern u8 gAnimBankAttacker;
extern u8 gAnimBankTarget;

void sub_80CF280(struct Sprite* sprite);

// unused_5

const struct SpriteTemplate gSpriteTemplate_83D7370 =
{
    .tileTag = 10064,
    .paletteTag = 10064,
    .oam = &gOamData_837DF34,
    .anims = gDummySpriteAnimTable,
    .images = NULL,
    .affineAnims = gDummySpriteAffineAnimTable,
    .callback = sub_80CF280,
};

void sub_80CF280(struct Sprite* sprite)
{
    sub_8078650(sprite);
    sub_807867C(sprite, gBattleAnimArgs[0]);
    sprite->pos1.y += gBattleAnimArgs[1];
    sprite->data[1] = gBattleAnimArgs[2];
    sprite->data[2] = gBattleAnimArgs[4];
    sprite->data[3] = gBattleAnimArgs[5];
    sprite->data[4] = gBattleAnimArgs[3];
    StoreSpriteCallbackInData(sprite, move_anim_8074EE0);
    sprite->callback = sub_8078278;
    sub_8078278(sprite);
}
