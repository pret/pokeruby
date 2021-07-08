#include "global.h"
#include "rom_8077ABC.h"
#include "battle_anim.h"

extern s16 gBattleAnimArgs[8];
extern u8 gBattleAnimAttacker;
extern u8 gBattleAnimTarget;

void sub_80D2D68(struct Sprite* sprite);
static void sub_80D2E30(struct Sprite *);

// noise (moving music note)
// Used in Uproar.

const struct SpriteTemplate gBattleAnimSpriteTemplate_83D7CC8 =
{
    .tileTag = ANIM_TAG_JAGGED_MUSIC_NOTE,
    .paletteTag = ANIM_TAG_JAGGED_MUSIC_NOTE,
    .oam = &gOamData_837DF34,
    .anims = gDummySpriteAnimTable,
    .images = NULL,
    .affineAnims = gDummySpriteAffineAnimTable,
    .callback = sub_80D2D68,
};

void sub_80D2D68(struct Sprite* sprite)
{
    int var1;
    u8 slot = gBattleAnimArgs[0] == 0 ? gBattleAnimAttacker : gBattleAnimTarget;

    if (GetBattlerSide(slot) == 1)
    {
        gBattleAnimArgs[1] *= -1;
    }

    sprite->x = GetBattlerSpriteCoord(slot, 2)  + gBattleAnimArgs[1];
    sprite->y = GetBattlerSpriteCoord(slot, 3) + gBattleAnimArgs[2];
    sprite->data[0] = 0;
    sprite->data[1] = (u16)sprite->x << 3;
    sprite->data[2] = (u16)sprite->y << 3;

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

    sprite->x = sprite->data[1] >> 3;
    sprite->y = sprite->data[2] >> 3;

    if (++sprite->data[0] > 16)
    {
        DestroyAnimSprite(sprite);
    } 
}
