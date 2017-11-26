#include "global.h"
#include "rom_8077ABC.h"
#include "trig.h"
#include "battle_anim.h"
#include "sound.h"
#include "random.h"

extern s16 gBattleAnimArgs[];
extern u8 gBattleAnimBankAttacker;
extern u8 gBattleAnimBankTarget;

static void sub_80D0030(struct Sprite* sprite);
static void sub_80D00B4(struct Sprite* sprite);

// bullet (shoot seeds as ammunition.)
// Used by Bullet Seed.

void sub_80CFFD8(struct Sprite* sprite)
{
    sub_80787B0(sprite, 1);
    sprite->data[0] = 20;
    sprite->data[2] = sub_8077ABC(gBattleAnimBankTarget, 2);
    sprite->data[4] = sub_8077ABC(gBattleAnimBankTarget, 3);
    sprite->callback = sub_8078B34;
    sprite->affineAnimPaused = 1;
    StoreSpriteCallbackInData(sprite, sub_80D0030);
}

void sub_80D0030(struct Sprite* sprite)
{
    int i;
    u16 rand;
    s16* ptr;
    PlaySE12WithPanning(0xA6, sub_8076F98(0x3F));
    sprite->pos1.x += sprite->pos2.x;
    sprite->pos1.y += sprite->pos2.y;
    sprite->pos2.y = 0;
    sprite->pos2.x = 0;
    ptr = &sprite->data[7];
    for (i = 0; i < 8; i++)
    {
        ptr[i - 7] = 0;
    }

    rand = Random();
    sprite->data[6] = 0xFFF4 - (rand & 7);
    rand = Random();
    sprite->data[7] = (rand % 0xA0) + 0xA0;
    sprite->callback = sub_80D00B4;
    sprite->affineAnimPaused = 0;
}

void sub_80D00B4(struct Sprite* sprite)
{
    sprite->data[0] += sprite->data[7];
    sprite->pos2.x = sprite->data[0] >> 8;
    if (sprite->data[7] & 1)
        sprite->pos2.x = -sprite->pos2.x;

    sprite->pos2.y = Sin(sprite->data[1], sprite->data[6]);
    sprite->data[1] += 8;
    if (sprite->data[1] > 0x7E)
    {
        sprite->data[1] = 0;
        sprite->data[2] /= 2;
        if (++sprite->data[3] == 1)
            move_anim_8072740(sprite);
    }
}
