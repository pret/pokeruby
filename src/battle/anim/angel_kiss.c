#include "global.h"
#include "rom_8077ABC.h"
#include "trig.h"
#include "battle_anim.h"
#include "sound.h"
#include "random.h"

extern s16 gBattleAnimArgs[];
extern u8 gBattleAnimAttacker;
extern u8 gBattleAnimTarget;

void sub_80D2A38(struct Sprite* sprite);

// angel_kiss (a different variation of kiss_fountain.)
// Used in Sweet Kiss.

const struct SpriteTemplate gBattleAnimSpriteTemplate_83D7BD0 =
{
    .tileTag = ANIM_TAG_PINK_HEART,
    .paletteTag = ANIM_TAG_PINK_HEART,
    .oam = &gOamData_837DF2C,
    .anims = gDummySpriteAnimTable,
    .images = NULL,
    .affineAnims = gDummySpriteAffineAnimTable,
    .callback = sub_80D2A38,
};

static void sub_80D29CC(struct Sprite* sprite)
{
    sprite->data[5]++;
    sprite->x2 = Sin(sprite->data[3], 5);
    sprite->y2 = sprite->data[5] / 2;
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
        sprite->x2 = sprite->data[4] >> 8;
        sprite->y2 = Sin(sprite->data[3], sprite->data[2]);
        sprite->data[3] = (sprite->data[3] + 3) & 0xFF;
        if (sprite->data[3] > 0x46)
        {
            sprite->callback = sub_80D29CC;
            sprite->x += sprite->x2;
            sprite->y += sprite->y2;
            sprite->x2 = 0;
            sprite->y2 = 0;
            sprite->data[3] = Random() % 0xB4;
        }
    }
}
