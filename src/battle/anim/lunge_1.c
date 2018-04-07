#include "global.h"
#include "rom_8077ABC.h"
#include "trig.h"
#include "battle_anim.h"
#include "sound.h"

extern s16 gBattleAnimArgs[];
extern u8 gAnimBankAttacker;
extern u8 gAnimBankTarget;

extern u8 gBankSpriteIds[];

static void sub_80CD7CC(struct Sprite* sprite);
static void sub_80CD81C(struct Sprite* sprite);
static void sub_80CD8A8(struct Sprite* sprite);
static void sub_80CD8F8(struct Sprite* sprite);
static void sub_80CD91C(struct Sprite* sprite);
static void sub_80CD9B8(struct Sprite* sprite);

// lunge_1 (makes the pokemon sprite do a "lunge" where it leans back to attack, usually with its head or horn.)
// Used in Drill Peck, Headbutt, Horn Attack, and Horn Drill.

void sub_80CD774(struct Sprite* sprite)
{
    sprite->invisible = 1;
    sprite->data[0] = 0;
    switch (gBattleAnimArgs[0])
    {
    case 0:
        sprite->callback = sub_80CD7CC;
        break;
    case 1:
        sprite->callback = sub_80CD8A8;
        break;
    case 2:
        sprite->callback = sub_80CD8F8;
        break;
    default:
        sprite->callback = sub_80CD9B8;
        break;
    }
}

void sub_80CD7CC(struct Sprite* sprite)
{
    sprite->data[0] = 6;
    sprite->data[1] = (GetBattlerSide(gAnimBankAttacker)) ? 2 : -2;
    sprite->data[2] = 0;
    sprite->data[3] = gBankSpriteIds[gAnimBankAttacker];
    StoreSpriteCallbackInData(sprite, sub_80CD81C);
    sprite->callback = TranslateMonBGUntil;
}

void sub_80CD81C(struct Sprite* sprite)
{
    if (sprite->data[0] == 0)
    {
        sprite->data[3] = gBankSpriteIds[gAnimBankAttacker];
        sub_8078E70(sprite->data[3], 0);
        sprite->data[4] = (sprite->data[6] = GetBattlerSide(gAnimBankAttacker)) ? 0x300 : 0xFFFFFD00;
        sprite->data[5] = 0;
    }

    sprite->data[5] += sprite->data[4];
    obj_id_set_rotscale(sprite->data[3], 0x100, 0x100, sprite->data[5]);
    sub_8078F9C(sprite->data[3]);
    if (++sprite->data[0] > 3)
    {
        sprite->data[0] = 0;
        sprite->callback = sub_80CD9B8;
    }
}

void sub_80CD8A8(struct Sprite* sprite)
{
    sprite->data[0] = 4;
    sprite->data[1] = (GetBattlerSide(gAnimBankAttacker)) ? -3 : 3;
    sprite->data[2] = 0;
    sprite->data[3] = gBankSpriteIds[gAnimBankAttacker];
    StoreSpriteCallbackInData(sprite, sub_80CD9B8);
    sprite->callback = TranslateMonBGUntil;
}

void sub_80CD8F8(struct Sprite* sprite)
{
    if (++sprite->data[0] > 8)
    {
        sprite->data[0] = 0;
        sprite->callback = sub_80CD91C;
    }
}

void sub_80CD91C(struct Sprite* sprite)
{
    if (sprite->data[0] == 0)
    {
        sprite->data[3] = gBankSpriteIds[gAnimBankAttacker];
        sprite->data[6] = GetBattlerSide(gAnimBankAttacker);
        if (GetBattlerSide(gAnimBankAttacker))
        {
            sprite->data[4] = 0xFC00;
            sprite->data[5] = 0xC00;
        }
        else
        {
            sprite->data[4] = 0x400;
            sprite->data[5] = 0xF400;
        }
    }

    sprite->data[5] += sprite->data[4];
    obj_id_set_rotscale(sprite->data[3], 0x100, 0x100, sprite->data[5]);
    sub_8078F9C(sprite->data[3]);
    if (++sprite->data[0] > 2)
    {
        sub_8078F40(sprite->data[3]);
        sprite->callback = sub_80CD9B8;
    }
}

void sub_80CD9B8(struct Sprite* sprite)
{
    DestroyAnimSprite(sprite);
}
