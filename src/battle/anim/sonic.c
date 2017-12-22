#include "global.h"
#include "rom_8077ABC.h"
#include "trig.h"
#include "battle_anim.h"
#include "sound.h"
#include "battle_anim_80CA710.h"

extern s16 gBattleAnimArgs[];
extern u8 gBattleAnimBankAttacker;
extern u8 gBattleAnimBankTarget;

// sonic (shoots a projectile towards the target.)
// Used in Sonic Boom and Air Cutter.

void sub_80CF6DC(struct Sprite* sprite)
{
    s16 a;
    s16 b;
    u16 c;

    if (NotInBattle())
    {
        gBattleAnimArgs[2] = -gBattleAnimArgs[2];
    }
    else if (GetBankSide(gBattleAnimBankAttacker) != 0)
    {
        gBattleAnimArgs[2] = -gBattleAnimArgs[2];
        gBattleAnimArgs[1] = -gBattleAnimArgs[1];
        gBattleAnimArgs[3] = -gBattleAnimArgs[3];
    }

    sub_80787B0(sprite, 1);
    a = sub_8077ABC(gBattleAnimBankTarget, 2) + gBattleAnimArgs[2];
    b = sub_8077ABC(gBattleAnimBankTarget, 3) + gBattleAnimArgs[3];
    c = sub_80790F0(a - sprite->pos1.x, b - sprite->pos1.y);
    c += 0xF000;
    if (NotInBattle())
        c -= 0x6000;

    sub_8078FDC(sprite, 0, 0x100, 0x100, c);
    sprite->data[0] = gBattleAnimArgs[4];
    sprite->data[2] = a;
    sprite->data[4] = b;
    sprite->callback = sub_8078B34;
    StoreSpriteCallbackInData(sprite, move_anim_8072740);
}

void sub_80CF7E0(struct Sprite* sprite)
{
    if (sprite->data[0]-- <= 0)
    {
        gTasks[sprite->data[7]].data[1]--;
        DestroySprite(sprite);
    }
}

void sub_80CF814(struct Sprite* sprite)
{
    struct Task* task = &gTasks[sprite->data[7]];
    if (sprite->data[0] > task->data[5])
    {
        sprite->data[5] += sprite->data[3];
        sprite->data[6] += sprite->data[4];
    }
    else
    {
        sprite->data[5] -= sprite->data[3];
        sprite->data[6] -= sprite->data[4];
    }

    sprite->data[1] += sprite->data[5];
    sprite->data[2] += sprite->data[6];
    if (1 & task->data[7])
        sprite->pos2.x = ((u16)sprite->data[1] >> 8) * -1;
    else
        sprite->pos2.x = (u16)sprite->data[1] >> 8;

    if (1 & task->data[8])
        sprite->pos2.y = ((u16)sprite->data[2] / 256u) * -1;
    else
        sprite->pos2.y = (u16)sprite->data[2] / 256u;

    if (sprite->data[0]-- <= 0)
    {
        sprite->data[0] = 30;
        sprite->callback = sub_80CF7E0;
    }
}

void sub_80CF8B8(struct Sprite* sprite)
{
    s16 a;
    s16 b;
    s16 c;

    struct Task* task = &gTasks[sprite->data[7]];
    sprite->data[1] += (-2 & task->data[7]);
    sprite->data[2] += (-2 & task->data[8]);
    if (1 & task->data[7])
        sprite->pos2.x = ((u16)sprite->data[1] >> 8) * -1;
    else
        sprite->pos2.x = (u16)sprite->data[1] >> 8;

    if (1 & task->data[8])
        sprite->pos2.y = ((u16)sprite->data[2] / 256u) * -1;
    else
        sprite->pos2.y = (u16)sprite->data[2] / 256u;

    if (sprite->data[0]-- <= 0)
    {
        sprite->data[0] = 8;
        task->data[5] = 4;
        a = sub_81174E0(0x1000);
        sprite->pos1.x += sprite->pos2.x;
        sprite->pos1.y += sprite->pos2.y;
        sprite->pos2.y = 0;
        sprite->pos2.x = 0;
        if (task->data[11] >= sprite->pos1.x)
            b = (task->data[11] - sprite->pos1.x) << 8;
        else
            b = (sprite->pos1.x - task->data[11]) << 8;

        if (task->data[12] >= sprite->pos1.y)
            c = (task->data[12] - sprite->pos1.y) << 8;
        else
            c = (sprite->pos1.y - task->data[12]) << 8;

        sprite->data[2] = 0;
        sprite->data[1] = 0;
        sprite->data[6] = 0;
        sprite->data[5] = 0;
        sprite->data[3] = sub_81174C4(sub_81174C4(b, a), sub_81174E0(0x1C0));
        sprite->data[4] = sub_81174C4(sub_81174C4(c, a), sub_81174E0(0x1C0));
        sprite->callback = sub_80CF814;
    } 
}
