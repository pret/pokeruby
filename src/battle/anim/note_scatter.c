#include "global.h"
#include "rom_8077ABC.h"
#include "trig.h"
#include "battle_anim.h"
#include "sound.h"

extern s16 gBattleAnimArgs[];
extern u8 gAnimBankAttacker;
extern u8 gAnimBankTarget;

static void sub_80CED78(struct Sprite* sprite);

// note_scatter
// Used by Teeter Dance.

void sub_80CECE8(struct Sprite* sprite)
{
    int a; 
    if (GetBattlerSide(gAnimBankAttacker) == 1)
    {
        a = gBattleAnimArgs[1]; 
        (u16)gBattleAnimArgs[1] = -a;
    }

    sprite->pos1.x = GetBankPosition(gAnimBankAttacker, 2) + gBattleAnimArgs[1];
    sprite->pos1.y = GetBankPosition(gAnimBankAttacker, 3) + gBattleAnimArgs[2];
    StartSpriteAnim(sprite, gBattleAnimArgs[0]);
    sprite->data[2] = 0;
    sprite->data[3] = 0;
    sprite->data[4] = sprite->pos1.x << 4;
    sprite->data[5] = sprite->pos1.y << 4;
    sprite->data[6] = (gBattleAnimArgs[1] << 4) / 5;
    sprite->data[7] = (gBattleAnimArgs[2] << 7) / 5;
    sprite->callback = sub_80CED78;
}

void sub_80CED78(struct Sprite* sprite)
{
    sprite->data[4] += sprite->data[6];
    sprite->data[5] += sprite->data[7];
    sprite->pos1.x = sprite->data[4] >> 4;
    sprite->pos1.y = sprite->data[5] >> 4;
    if (sprite->data[0] > 5 && sprite->data[3] == 0)
    {
        sprite->data[2] = (sprite->data[2] + 16) & 0xFF;
        sprite->pos2.x = Cos(sprite->data[2], 18);
        sprite->pos2.y = Sin(sprite->data[2], 18);
        if (sprite->data[2] == 0)
            sprite->data[3] = 1;
    }

    if (++sprite->data[0] == 0x30)
        move_anim_8074EE0(sprite);
}
