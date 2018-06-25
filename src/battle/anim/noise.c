#include "global.h"
#include "rom_8077ABC.h"
#include "battle_anim.h"

extern s16 gBattleAnimArgs[8];
extern u8 gAnimBankAttacker;
extern u8 gAnimBankTarget;

void sub_80D2D68(struct Sprite* sprite);
static void sub_80D2E30(struct Sprite *);

// noise (moving music note)
// Used in Uproar.

const struct SpriteTemplate gBattleAnimSpriteTemplate_83D7CC8 =
{
    .tileTag = 10225,
    .paletteTag = 10225,
    .oam = &gOamData_837DF34,
    .anims = gDummySpriteAnimTable,
    .images = NULL,
    .affineAnims = gDummySpriteAffineAnimTable,
    .callback = sub_80D2D68,
};

void sub_80D2D68(struct Sprite* sprite)
{
    int var1;
    u8 slot = gBattleAnimArgs[0] == 0 ? gAnimBankAttacker : gAnimBankTarget;

    if (GetBattlerSide(slot) == 1)
    {
        gBattleAnimArgs[1] *= -1;
    }

    sprite->pos1.x = GetBattlerSpriteCoord(slot, 2)  + gBattleAnimArgs[1];
    sprite->pos1.y = GetBattlerSpriteCoord(slot, 3) + gBattleAnimArgs[2];
    sprite->data[0] = 0;
    sprite->data[1] = (u16)sprite->pos1.x << 3;
    sprite->data[2] = (u16)sprite->pos1.y << 3;

    var1 = gBattleAnimArgs[1] << 3;
    if (var1 < 0)
        var1 += 7;
    sprite->data[3] = var1 >> 3;

    var1 = gBattleAnimArgs[2] << 3;
    if (var1 < 0)
        var1 += 7;
    sprite->data[4] = var1 >> 3;

    sprite->oam.tileNum += gBattleAnimArgs[3] * 16;
    sprite->callback = sub_80D2E30;
}

static void sub_80D2E30(struct Sprite *sprite)
{
    sprite->data[1] += sprite->data[3];
    sprite->data[2] += sprite->data[4];

    sprite->pos1.x = sprite->data[1] >> 3;
    sprite->pos1.y = sprite->data[2] >> 3;

    if (++sprite->data[0] > 16)
    {
        DestroyAnimSprite(sprite);
    } 
}
