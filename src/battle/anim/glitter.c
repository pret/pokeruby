#include "global.h"
#include "rom_8077ABC.h"
#include "trig.h"
#include "battle_anim.h"
#include "sound.h"

extern s16 gBattleAnimArgs[];
extern u8 gAnimBankAttacker;
extern u8 gAnimBankTarget;

// glitter (the sparkling effect seen on Pokemon, usually after healing or a beneficial effect.)
// Used by Heal Bell, Cosmic Power, and Aromatherapy.

void sub_80CD140(struct Sprite* sprite)
{
    if (!gBattleAnimArgs[2])
        sub_8078650(sprite);

    sub_807867C(sprite, gBattleAnimArgs[0]);
    sprite->pos1.y += gBattleAnimArgs[1];
    sprite->data[0] = gBattleAnimArgs[5];
    sprite->data[1] = gBattleAnimArgs[3];
    sprite->data[2] = gBattleAnimArgs[4];
    StoreSpriteCallbackInData(sprite, DestroyAnimSprite);
    sprite->callback = sub_8078394;
}

void sub_80CD190(struct Sprite* sprite)
{
    u8 bank;
    if (!gBattleAnimArgs[2])
        bank = gAnimBankAttacker;
    else
        bank = gAnimBankTarget;

    if (IsDoubleBattle() && IsAnimBankSpriteVisible(bank ^ 2))
    {
        sub_807A3FC(bank, gBattleAnimArgs[6], &sprite->pos1.x, &sprite->pos1.y);
        sub_807867C(sprite, gBattleAnimArgs[0]);
        sprite->pos1.y += gBattleAnimArgs[1];
    }
    else
    {
        if (!gBattleAnimArgs[6])
        {
            sprite->pos1.x = GetBankPosition(bank, 0);
            sprite->pos1.y = GetBankPosition(bank, 1) + gBattleAnimArgs[1];
        }
        else
        {
            sprite->pos1.x = GetBankPosition(bank, 2);
            sprite->pos1.y = GetBankPosition(bank, 3) + gBattleAnimArgs[1];
        }

        sub_807867C(sprite, gBattleAnimArgs[0]);
    }

    sprite->data[0] = gBattleAnimArgs[5];
    sprite->data[1] = gBattleAnimArgs[3];
    sprite->data[2] = gBattleAnimArgs[4];
    StoreSpriteCallbackInData(sprite, DestroyAnimSprite);
    sprite->callback = sub_8078394;
}
