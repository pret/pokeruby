#include "global.h"
#include "rom_8077ABC.h"
#include "trig.h"
#include "battle_anim.h"
#include "sound.h"
#include "constants/songs.h"

extern s16 gBattleAnimArgs[];
extern u8 gBattleAnimBankAttacker;
extern u8 gBattleAnimBankTarget;

static void sub_80CE000(struct Sprite* sprite);

// cube (shows a sphere sharpening into a cube.)
// Used in Sharpen.

void sub_80CDFB0(struct Sprite* sprite)
{
    sprite->pos1.x = sub_8077ABC(gBattleAnimBankAttacker, 2);
    sprite->pos1.y = sub_8077ABC(gBattleAnimBankAttacker, 3) - 12;
    sprite->data[0] = 0;
    sprite->data[1] = 2;
    sprite->data[2] = 0;
    sprite->data[3] = 0;
    sprite->data[4] = 0;
    sprite->data[5] = sub_8076F98(-0x40);
    sprite->callback = sub_80CE000;
}

void sub_80CE000(struct Sprite* sprite)
{
    if (++sprite->data[0] >= sprite->data[1])
    {
        sprite->invisible = !sprite->invisible;
        if (!sprite->invisible)
        {
            sprite->data[4]++;
            if (!(sprite->data[4] & 1))
                PlaySE12WithPanning(SE_W207B, sprite->data[5]);
        }

        sprite->data[0] = 0;
        if (++sprite->data[2] > 1)
        {
            sprite->data[2] = 0;
            sprite->data[1]++;
        }
    }

    if (sprite->animEnded && sprite->data[1] > 16 && sprite->invisible)
        move_anim_8072740(sprite);
}
