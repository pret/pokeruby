#include "global.h"
#include "rom_8077ABC.h"
#include "trig.h"
#include "battle_anim.h"
#include "sound.h"

extern s16 gBattleAnimArgs[];
extern u8 gAnimBankAttacker;
extern u8 gAnimBankTarget;

void sub_80CE30C(struct Sprite* sprite);
static void sub_80CE354(struct Sprite* sprite);

// moon (shows a moon image.)
// Used in Moonlight.

const struct SpriteTemplate gBattleAnimSpriteTemplate_83D6FC8 =
{
    .tileTag = 10194,
    .paletteTag = 10194,
    .oam = &gOamData_837E05C,
    .anims = gDummySpriteAnimTable,
    .images = NULL,
    .affineAnims = gDummySpriteAffineAnimTable,
    .callback = sub_80CE30C,
};

void sub_80CE30C(struct Sprite* sprite)
{
    if (IsContest())
    {
        sprite->pos1.x = 0x30;
        sprite->pos1.y = 0x28;
    }
    else
    {
        sprite->pos1.x = gBattleAnimArgs[0];
        sprite->pos1.y = gBattleAnimArgs[1];
    }

    sprite->oam.shape = 0;
    sprite->oam.size = 3;
    sprite->data[0] = 0;
    sprite->callback = sub_80CE354;
}

static void sub_80CE354(struct Sprite* sprite)
{
    if (sprite->data[0])
        DestroyAnimSprite(sprite);
}
