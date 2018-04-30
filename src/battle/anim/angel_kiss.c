#include "global.h"
#include "rom_8077ABC.h"
#include "trig.h"
#include "battle_anim.h"
#include "sound.h"
#include "random.h"

extern s16 gBattleAnimArgs[];
extern u8 gAnimBankAttacker;
extern u8 gAnimBankTarget;

void sub_80D2A38(struct Sprite* sprite);

// angel_kiss (a different variation of kiss_fountain.)
// Used in Sweet Kiss.

const struct SpriteTemplate gBattleAnimSpriteTemplate_83D7BD0 =
{
    .tileTag = 10219,
    .paletteTag = 10219,
    .oam = &gOamData_837DF2C,
    .anims = gDummySpriteAnimTable,
    .images = NULL,
    .affineAnims = gDummySpriteAffineAnimTable,
    .callback = sub_80D2A38,
};

static void sub_80D29CC(struct Sprite* sprite)
{
    sprite->data[5]++;
    sprite->pos2.x = Sin(sprite->data[3], 5);
    sprite->pos2.y = sprite->data[5] / 2;
    sprite->data[3] = (sprite->data[3] + 3) & 0xFF;
    if (sprite->data[5] > 20)
        sprite->invisible = sprite->data[5] % 2;

    if (sprite->data[5] > 30)
        DestroyAnimSprite(sprite);
}

void sub_80D2A38(struct Sprite* sprite)
{
    if (sprite->data[0] == 0)
    {
        sprite->data[1] = gBattleAnimArgs[0];
        sprite->data[2] = gBattleAnimArgs[1];
        sprite->data[0]++;
    }
    else
    {
        sprite->data[4] += sprite->data[1];
        sprite->pos2.x = sprite->data[4] >> 8;
        sprite->pos2.y = Sin(sprite->data[3], sprite->data[2]);
        sprite->data[3] = (sprite->data[3] + 3) & 0xFF;
        if (sprite->data[3] > 0x46)
        {
            sprite->callback = sub_80D29CC;
            sprite->pos1.x += sprite->pos2.x;
            sprite->pos1.y += sprite->pos2.y;
            sprite->pos2.x = 0;
            sprite->pos2.y = 0;
            sprite->data[3] = Random() % 0xB4;
        }
    }
}
