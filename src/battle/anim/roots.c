#include "global.h"
#include "rom_8077ABC.h"
#include "trig.h"
#include "battle_anim.h"

extern s16 gBattleAnimArgs[];
extern u8 gBattleAnimBankAttacker;
extern u8 gBattleAnimBankTarget;

extern s16 gUnknown_03000728[];

static void sub_80CB710(struct Sprite* sprite);

// roots
// Used by Ingrain and Frenzy Plant.

void sub_80CB59C(struct Sprite* sprite)
{
    if (!sprite->data[0])
    {
        sprite->pos1.x = sub_8077ABC(gBattleAnimBankAttacker, 2);
        sprite->pos1.y = sub_8077ABC(gBattleAnimBankAttacker, 1);
        sprite->pos2.x = gBattleAnimArgs[0];
        sprite->pos2.y = gBattleAnimArgs[1];
        sprite->subpriority = gBattleAnimArgs[2] + 30;
        StartSpriteAnim(sprite, gBattleAnimArgs[3]);
        sprite->data[2] = gBattleAnimArgs[4];
        sprite->data[0]++;
        if ((sprite->pos1.y + sprite->pos2.y) > 120)
        {
            sprite->pos1.y += -120 + (sprite->pos2.y + sprite->pos1.y);
        }
    }
    sprite->callback = sub_80CB710;
}

void sub_80CB620(struct Sprite *sprite)
{
    s16 p1 = sub_8077ABC(gBattleAnimBankAttacker, 2);
    s16 p2 = sub_8077ABC(gBattleAnimBankAttacker, 3);
    s16 e1 = sub_8077ABC(gBattleAnimBankTarget, 2);
    s16 e2 = sub_8077ABC(gBattleAnimBankTarget, 3);

    e1 -= p1;
    e2 -= p2;
    sprite->pos1.x = p1 + e1 * gBattleAnimArgs[0] / 100;
    sprite->pos1.y = p2 + e2 * gBattleAnimArgs[0] / 100;
    sprite->pos2.x = gBattleAnimArgs[1];
    sprite->pos2.y = gBattleAnimArgs[2];
    sprite->subpriority = gBattleAnimArgs[3] + 30;
    StartSpriteAnim(sprite, gBattleAnimArgs[4]);
    sprite->data[2] = gBattleAnimArgs[5];
    sprite->callback = sub_80CB710;
    gUnknown_03000728[0] = sprite->pos1.x;
    gUnknown_03000728[1] = sprite->pos1.y;
    gUnknown_03000728[2] = e1;
    gUnknown_03000728[3] = e2;
}

void sub_80CB710(struct Sprite* sprite)
{
    if (++sprite->data[0] > (sprite->data[2] - 10))
        sprite->invisible = sprite->data[0] % 2;

    if (sprite->data[0] > sprite->data[2])
        move_anim_8072740(sprite);
}
