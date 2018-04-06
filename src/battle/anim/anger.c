#include "global.h"
#include "rom_8077ABC.h"
#include "trig.h"
#include "battle_anim.h"
#include "sound.h"

extern s16 gBattleAnimArgs[];
extern u8 gAnimBankAttacker;
extern u8 gAnimBankTarget;

// anger (anger emotes, usually above the Pokemon's head, indicating annoyed emotions.)
// Used in Frustration, Rage, Swagger, Torment, and Taunt.

void sub_80D09C0(struct Sprite* sprite)
{
    u8 bank;
    if (gBattleAnimArgs[0] == 0)
        bank = gAnimBankAttacker;
    else
        bank = gAnimBankTarget;

    if (GetBattlerSide(bank) == 1)
    {
        gBattleAnimArgs[1] *= -1;
    }

    sprite->pos1.x = GetBankPosition(bank, 2) + gBattleAnimArgs[1];
    sprite->pos1.y = GetBankPosition(bank, 3) + gBattleAnimArgs[2];
    if (sprite->pos1.y <= 7)
        sprite->pos1.y = 8;

    StoreSpriteCallbackInData(sprite, move_anim_8074EE0);
    sprite->callback = sub_80785E4;
}
