#include "global.h"
#include "battle_anim.h"
#include "rom_8077ABC.h"
#include "trig.h"
#include "util.h"

extern s16 gBattleAnimArgs[];
extern u8 gAnimBankAttacker;
extern u8 gAnimBankTarget;

static void sub_80D32E8(struct Sprite *sprite);
static void sub_80D3370(struct Sprite *sprite);
static void sub_80D3398(struct Sprite *sprite);

// bubble (indidivual bubble that floats around)
// Used in Bubble and Bubblebeam

void sub_80D31C8(struct Sprite* sprite)
{
    u8 newSpriteId;

    if (GetBankSide(gAnimBankAttacker) != 0)
    {
        sprite->pos1.x = GetBankPosition(gAnimBankAttacker, 2) - gBattleAnimArgs[0];
        sprite->pos1.y = GetBankPosition(gAnimBankAttacker, 3) + gBattleAnimArgs[1];
    }
    else
    {
        sprite->pos1.x = GetBankPosition(gAnimBankAttacker, 2) + gBattleAnimArgs[0];
        sprite->pos1.y = GetBankPosition(gAnimBankAttacker, 3) + gBattleAnimArgs[1];
    }

    sprite->animPaused = 1;

    if (GetBankSide(gAnimBankAttacker) != 0)
    {
        gBattleAnimArgs[2] = -gBattleAnimArgs[2];
    }

    sprite->data[0] = gBattleAnimArgs[6];
    sprite->data[1] = sprite->pos1.x;
    sprite->data[2] = GetBankPosition(gAnimBankTarget, 2);
    sprite->data[3] = sprite->pos1.y;
    sprite->data[4] = GetBankPosition(gAnimBankTarget, 3);

    InitAnimSpriteTranslationDeltas(sprite);

    newSpriteId = CreateInvisibleSpriteWithCallback(SpriteCallbackDummy);
    sprite->data[5] = newSpriteId;

    sprite->pos1.x -= Sin((u8)gBattleAnimArgs[4], gBattleAnimArgs[2]);
    sprite->pos1.y -= Cos((u8)gBattleAnimArgs[4], gBattleAnimArgs[3]);

    gSprites[newSpriteId].data[0] = gBattleAnimArgs[2];
    gSprites[newSpriteId].data[1] = gBattleAnimArgs[3];
    gSprites[newSpriteId].data[2] = gBattleAnimArgs[5];
    gSprites[newSpriteId].data[3] = (u8)gBattleAnimArgs[4] * 256;
    gSprites[newSpriteId].data[4] = gBattleAnimArgs[6];

    sprite->callback = sub_80D32E8;
    sprite->callback(sprite);
}

static void sub_80D32E8(struct Sprite *sprite)
{
    u8 spriteId = sprite->data[5];

    u8 counter = gSprites[spriteId].data[4];
    u16 index = gSprites[spriteId].data[3];

    sprite->data[0] = 1;
    TranslateAnimSpriteByDeltas(sprite);

    sprite->pos2.x += Sin(index / 256, gSprites[spriteId].data[0]);
    sprite->pos2.y += Cos(index / 256, gSprites[spriteId].data[1]);

    gSprites[spriteId].data[3] = gSprites[spriteId].data[2] + index;

    if (--counter != 0)
    {
        gSprites[spriteId].data[4] = counter;
    }
    else
    {
        sprite->callback = sub_80D3370;
        DestroySprite(&gSprites[spriteId]);
    }
}

static void sub_80D3370(struct Sprite *sprite)
{
    sprite->animPaused = 0;
    sprite->callback = sub_8078600;
    StoreSpriteCallbackInData(sprite, sub_80D3398);
}

static void sub_80D3398(struct Sprite *sprite)
{
    sprite->data[0] = 10;
    sprite->callback = sub_80782D8;
    StoreSpriteCallbackInData(sprite, move_anim_8074EE0);
}
