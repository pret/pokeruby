#include "global.h"
#include "rom_8077ABC.h"
#include "trig.h"
#include "battle_anim.h"
#include "sound.h"

extern s16 gBattleAnimArgs[];
extern u8 gAnimBankAttacker;
extern u8 gAnimBankTarget;

static void sub_80D020C(struct Sprite* sprite);

// grip (does a slash which is capable of mirroring for the effect of "gripping".)
// Used in Vice Grip.

void sub_80D0178(struct Sprite* sprite)
{
    s16 r7 = 32;
    s16 r4 = -32;
    s16 r8 = 16;
    s16 r6 = -16;
    if (gBattleAnimArgs[0] != 0)
    {
        r7 = r4;
        r4 = 32;
        r8 = r6;
        r6 = 16;
        StartSpriteAnim(sprite, 1);
    }

    sprite->pos1.x += r7;
    sprite->pos1.y += r4;
    sprite->data[0] = 6;
    sprite->data[2] = GetBankPosition(gAnimBankTarget, 2) + r8;
    sprite->data[4] = GetBankPosition(gAnimBankTarget, 3) + r6;
    sprite->callback = sub_8078B34;
    StoreSpriteCallbackInData(sprite, sub_80D020C);
}

void sub_80D020C(struct Sprite* sprite)
{
    if (sprite->animEnded == 1)
        DestroyAnimSprite(sprite);
}
