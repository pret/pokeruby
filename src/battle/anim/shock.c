#include "global.h"
#include "battle_anim.h"
#include "rom_8077ABC.h"
#include "trig.h"

extern s16 gBattleAnimArgs[8];
extern u8 gAnimBankAttacker;
extern u8 gAnimBankTarget;
extern struct OamMatrix gOamMatrices[];

extern void sub_80DA48C(struct Sprite *);

// shock (moves the little electricity lines)
// Used in Shock.

void sub_80D6294(struct Sprite *sprite)
{
    sprite->pos1.x = GetBankPosition(gAnimBankTarget, 2);
    sprite->pos1.y = GetBankPosition(gAnimBankTarget, 3);

    if (GetBattlerSide(gAnimBankAttacker) != 0)
    {
        sprite->pos1.x -= gBattleAnimArgs[0];
        sprite->pos1.y -= gBattleAnimArgs[1];
    }
    else
    {
        sprite->pos1.x += gBattleAnimArgs[0];
        sprite->pos1.y += gBattleAnimArgs[1];
    }

    sprite->data[0] = 0;
    sprite->data[1] = gBattleAnimArgs[2];
    sprite->data[2] = gBattleAnimArgs[3];
    sprite->data[3] = gBattleAnimArgs[4];

    StoreSpriteCallbackInData(sprite, move_anim_8074EE0);
    sprite->callback = sub_8078114;
}

void sub_80D6328(struct Sprite *sprite)
{
    u8 slot;
    u32 matrixNum;
    s16 sineVal;

    switch (gBattleAnimArgs[4])
    {
    case 0:
        slot = gAnimBankAttacker;
        break;
    case 1:
    default:
        slot = gAnimBankTarget;
        break;
    case 2:
        if (!IsAnimBankSpriteVisible(gAnimBankAttacker ^ 2))
        {
            slot = gAnimBankAttacker;
        }
        else
        {
            slot = gAnimBankAttacker ^ 2;
        }
        break;
    case 3:
        if (IsAnimBankSpriteVisible(gAnimBankAttacker ^ 2))
        {
            slot = gAnimBankTarget ^ 2;
        }
        else
        {
            slot = gAnimBankTarget;
        }
        break;
    }

    if (gBattleAnimArgs[5] == 0)
    {
        sprite->pos1.x = GetBankPosition(slot, 0);
        sprite->pos1.y = GetBankPosition(slot, 1);
    }
    else
    {
        sprite->pos1.x = GetBankPosition(slot, 2);
        sprite->pos1.y = GetBankPosition(slot, 3);
    }

    sprite->pos2.x = (gSineTable[gBattleAnimArgs[0]] * gBattleAnimArgs[1]) >> 8;
    sprite->pos2.y = (gSineTable[gBattleAnimArgs[0] + 64] * gBattleAnimArgs[1]) >> 8;

    if (gBattleAnimArgs[6] & 1)
    {
        sprite->oam.priority = sub_8079ED4(slot) + 1;
    }

    matrixNum = sprite->oam.matrixNum;
    sineVal = gSineTable[gBattleAnimArgs[2]];

    gOamMatrices[matrixNum].a = gOamMatrices[matrixNum].d =  gSineTable[gBattleAnimArgs[2] + 64];
    gOamMatrices[matrixNum].b =  sineVal;
    gOamMatrices[matrixNum].c = -sineVal;

    sprite->data[0] = gBattleAnimArgs[3];
    sprite->callback = sub_80DA48C;
}
