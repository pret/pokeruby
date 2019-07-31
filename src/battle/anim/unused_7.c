#include "global.h"
#include "rom_8077ABC.h"
#include "trig.h"
#include "battle_anim.h"
#include "sound.h"

extern s16 gBattleAnimArgs[];
extern u8 gBattleAnimAttacker;
extern u8 gBattleAnimTarget;

extern u8 gBattlerSpriteIds[];

void sub_80CF3C4(struct Sprite* sprite);

// unused_7

const struct SpriteTemplate gSpriteTemplate_83D73AC =
{
    .tileTag = 0,
    .paletteTag = 0,
    .oam = &gDummyOamData,
    .anims = gDummySpriteAnimTable,
    .images = NULL,
    .affineAnims = gDummySpriteAffineAnimTable,
    .callback = sub_80CF3C4,
};

static void sub_80CF374(struct Sprite* sprite)
{
    s16 temp;
    gSprites[sprite->data[2]].pos2.x += sprite->data[1];
    temp = sprite->data[1];
    sprite->data[1] = -temp;
    if (sprite->data[0] == 0)
    {
        gSprites[sprite->data[2]].pos2.x = 0;
        DestroySpriteAndMatrix(sprite);
    }

    sprite->data[0]--;
}

void sub_80CF3C4(struct Sprite* sprite)
{
    u8 a;
    sprite->pos1.x = GetBattlerSpriteCoord(gBattleAnimAttacker, 2);
    sprite->pos1.y = GetBattlerSpriteCoord(gBattleAnimAttacker, 3);
    a = gBattlerSpriteIds[gBattleAnimTarget];
    if (GetBattlerSide(gBattleAnimAttacker) != 0)
    {
        sprite->pos1.x -= gBattleAnimArgs[0];
    }
    else
    {
        sprite->pos1.x += gBattleAnimArgs[0];
    }

    sprite->pos1.y += gBattleAnimArgs[1];
    sprite->data[0] = gBattleAnimArgs[2];
    sprite->data[1] = gBattleAnimArgs[3];
    sprite->data[2] = a;
    sprite->callback = sub_80CF374;
    sprite->invisible = 1;
}
