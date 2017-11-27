#include "global.h"
#include "rom_8077ABC.h"
#include "trig.h"
#include "battle_anim.h"
#include "sound.h"
#include "main.h"
#include "blend_palette.h"

extern s16 gBattleAnimArgs[];
extern u8 gBattleAnimBankAttacker;
extern u8 gBattleAnimBankTarget;

extern u8 gObjectBankIDs[];

static void sub_80D1098(struct Sprite* sprite);

// ring (a ring that stretches outward from the Pokemon.)
// Used in Aromatherapy and Heal Bell.

void sub_80D0FD8(struct Sprite* sprite)
{
    u8 bank = 0;
    u16 sp0 = 0;
    u16 sp1 = 0;
    u8 r4;

    if (gBattleAnimArgs[2] == 0)
        bank = gBattleAnimBankAttacker;
    else
        bank = gBattleAnimBankTarget;

    r4 = gBattleAnimArgs[3] ^ 1;
    if (IsDoubleBattle() && IsAnimBankSpriteVisible(bank ^ 2))
    {
        sub_807A3FC(bank, r4, &sp0, &sp1);
        if (r4 == 0)
            r4 = sub_8077ABC(bank, 0);
        else
            r4 = sub_8077ABC(bank, 2);

        if (GetBankSide(bank) != 0)
            gBattleAnimArgs[0] -= (sp0 - r4) - gBattleAnimArgs[0];  // This is weird.
        else
            gBattleAnimArgs[0] = sp0 - r4;
    }

    sprite->callback = sub_80793C4;
    sub_80793C4(sprite);
}

void sub_80D1098(struct Sprite* sprite)
{
    if (sub_8078B5C(sprite))
    {
        FreeSpriteOamMatrix(sprite);
        move_anim_8072740(sprite);
    }
}

void sub_80D10B8(struct Sprite* sprite)
{
    u16 r9 = 0;
    u16 r6 = 0;
    s16 sp0 = 0;
    s16 sp1 = 0;
    u8 sp4;
    u8 bankr7;
    u8 bankr8;
    u8 r10;

    if (gBattleAnimArgs[5] == 0)
    {
        bankr7 = gBattleAnimBankAttacker;
        bankr8 = gBattleAnimBankTarget;
    }
    else
    {
        bankr7 = gBattleAnimBankTarget;
        bankr8 = gBattleAnimBankAttacker;
    }

    if (gBattleAnimArgs[6] == 0)
    {
        r10 = 0;
        sp4 = 1;
    }
    else
    {
        r10 = 2;
        sp4 = 3;
    }

    if (GetBankSide(bankr7) != 0)
    {
        r9 = sub_8077ABC(bankr7, r10) + gBattleAnimArgs[0];
        if (IsAnimBankSpriteVisible(bankr8 ^ 2))
            sprite->subpriority = gSprites[gObjectBankIDs[bankr8 ^ 2]].subpriority - 1;
        else
            sprite->subpriority = gSprites[gObjectBankIDs[bankr8]].subpriority - 1;
    }
    else
    {
        r9 = sub_8077ABC(bankr7, r10) - gBattleAnimArgs[0];
        if (gMain.inBattle && IsAnimBankSpriteVisible(bankr7 ^ 2))
        {
            if (gSprites[gObjectBankIDs[bankr7]].pos1.x < gSprites[gObjectBankIDs[bankr7 ^ 2]].pos1.x)
                sprite->subpriority = gSprites[gObjectBankIDs[bankr7 ^ 2]].subpriority + 1;
            else
                sprite->subpriority = gSprites[gObjectBankIDs[bankr7]].subpriority - 1;
        }
        else
        {
            sprite->subpriority = gSprites[gObjectBankIDs[bankr7]].subpriority - 1;
        }

    }

    r6 = sub_8077ABC(bankr7, sp4) + gBattleAnimArgs[1];
    if (gMain.inBattle && IsAnimBankSpriteVisible(bankr8 ^ 2))
    {
        sub_807A3FC(bankr8, gBattleAnimArgs[6], &sp0, &sp1);
    }
    else
    {
        sp0 = sub_8077ABC(bankr8, r10);
        sp1 = sub_8077ABC(bankr8, sp4);
    }

    if (GetBankSide(bankr8))
        sp0 += gBattleAnimArgs[3];
    else
        sp0 -= gBattleAnimArgs[3];

    sp1 += gBattleAnimArgs[4];
    sprite->pos1.x = sprite->data[1] = r9;
    sprite->pos1.y = sprite->data[3] = r6;
    sprite->data[2] = sp0;
    sprite->data[4] = sp1;
    sprite->data[0] = gBattleAnimArgs[0];
    obj_translate_based_on_private_1_2_3_4(sprite);
    sprite->callback = sub_80D1098;
    sub_80D1098(sprite);
}

void sub_80D1318(struct Sprite* sprite)
{
    u8 index = IndexOfSpritePaletteTag(0x27DB);
    if (index != 0xFF)
    {
        BlendPalette(((index << 20) + 0x1010000) >> 16, 15, gBattleAnimArgs[5], gBattleAnimArgs[4]);
    }

    StartSpriteAffineAnim(sprite, 1);
    sprite->callback = sub_80793C4;
    sub_80793C4(sprite);
}
