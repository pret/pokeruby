#include "global.h"
#include "rom_8077ABC.h"
#include "trig.h"
#include "battle_anim.h"
#include "sound.h"

extern s16 gBattleAnimArgs[];
extern u8 gAnimBankAttacker;
extern u8 gAnimBankTarget;

void sub_80D2064(struct Sprite* sprite);
static void sub_80D2094(struct Sprite* sprite);

// flying_hearts (hearts float upward from the bottom of the screen.)
// Used in Attract.

const struct SpriteTemplate gBattleAnimSpriteTemplate_83D7AE0 =
{
    .tileTag = 10216,
    .paletteTag = 10216,
    .oam = &gOamData_837DF2C,
    .anims = gDummySpriteAnimTable,
    .images = NULL,
    .affineAnims = gDummySpriteAffineAnimTable,
    .callback = sub_80D2064,
};

void sub_80D2064(struct Sprite* sprite)
{
    sprite->pos1.x = gBattleAnimArgs[0];
    sprite->pos1.y = 0xA0;
    sprite->data[0] = gBattleAnimArgs[2];
    sprite->data[1] = gBattleAnimArgs[1];
    sprite->callback = WaitAnimForDuration;
    StoreSpriteCallbackInData(sprite, sub_80D2094);
}

static void sub_80D2094(struct Sprite* sprite)
{
    s16 y;
    sprite->data[2] += sprite->data[1];
    sprite->pos2.y = -((u16)sprite->data[2] >> 8);
    sprite->pos2.x = Sin(sprite->data[3], 4);
    sprite->data[3] = (sprite->data[3] + 3) & 0xFF;
    y = sprite->pos1.y + sprite->pos2.y;
    if (y <= 0x48)
    {
        sprite->invisible = sprite->data[3] % 2;
        if (y <= 0x40)
            DestroyAnimSprite(sprite);
    }
}
