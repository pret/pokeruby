#include "global.h"
#include "rom_8077ABC.h"
#include "trig.h"
#include "battle_anim.h"
#include "sound.h"

extern s16 gBattleAnimArgs[];
extern u8 gAnimBankAttacker;
extern u8 gAnimBankTarget;

void sub_80D1F58(struct Sprite* sprite);
static void sub_80D1FA4(struct Sprite* sprite);

// blow_kiss (a heart floating across the screen.)
// Used in Attract.

const struct SpriteTemplate gBattleAnimSpriteTemplate_83D7AB0 =
{
    .tileTag = 10216,
    .paletteTag = 10216,
    .oam = &gOamData_837DF2C,
    .anims = gDummySpriteAnimTable,
    .images = NULL,
    .affineAnims = gDummySpriteAffineAnimTable,
    .callback = sub_80D1F58,
};

void sub_80D1F58(struct Sprite* sprite)
{
    InitAnimSpritePos(sprite, 1);
    sprite->data[0] = 0x5F;
    sprite->data[1] = sprite->pos1.x;
    sprite->data[2] = GetBattlerSpriteCoord(gAnimBankTarget, 2);
    sprite->data[3] = sprite->pos1.y;
    sprite->data[4] = GetBattlerSpriteCoord(gAnimBankTarget, 3);
    InitAnimLinearTranslation(sprite);
    sprite->callback = sub_80D1FA4;
}

static void sub_80D1FA4(struct Sprite* sprite)
{
    if (TranslateAnimLinear(sprite) == 0)
    {
        sprite->pos2.y += Sin(sprite->data[5], 14);
        sprite->data[5] = (sprite->data[5] + 4) & 0xFF;
    }
    else
    {
        DestroyAnimSprite(sprite);
    }
}
