#include "global.h"
#include "rom_8077ABC.h"
#include "trig.h"
#include "battle_anim.h"
#include "sound.h"
#include "palette.h"

extern s16 gBattleAnimArgs[];
extern u8 gAnimBankAttacker;
extern u8 gAnimBankTarget;

void sub_80CCD24(struct Sprite* sprite);
static void sub_80CCE0C(struct Sprite* sprite);

// shield
// Used by Protect.

const struct SpriteTemplate gBattleAnimSpriteTemplate_83D6BE8 =
{
    .tileTag = 10280,
    .paletteTag = 10280,
    .oam = &gOamData_837E05C,
    .anims = gDummySpriteAnimTable,
    .images = NULL,
    .affineAnims = gDummySpriteAffineAnimTable,
    .callback = sub_80CCD24,
};

void sub_80CCD24(struct Sprite* sprite)
{
    if (IsContest() != 0)
    {
        gBattleAnimArgs[1] += 8;
    }

    sprite->pos1.x = sub_8077EE4(gAnimBankAttacker, 0) + gBattleAnimArgs[0];
    sprite->pos1.y = sub_8077EE4(gAnimBankAttacker, 1) + gBattleAnimArgs[1];
    if (GetBattlerSide(gAnimBankAttacker) == 0 || IsContest())
        sprite->oam.priority = sub_8079ED4(gAnimBankAttacker) + 1;
    else
        sprite->oam.priority = sub_8079ED4(gAnimBankAttacker);

    sprite->data[0] = gBattleAnimArgs[2];
    sprite->data[2] = (IndexOfSpritePaletteTag(0x2828) << 4) + 0x100;
    sprite->data[7] = 16;
    REG_BLDCNT = 0x3F40;
    REG_BLDALPHA = (sprite->data[7] << 8) | (16 - sprite->data[7]);
    sprite->callback = sub_80CCE0C;
}

static void sub_80CCE0C(struct Sprite* sprite)
{
    int a;
    int i;
    sprite->data[5] += 0x60;
    sprite->pos2.x = -(sprite->data[5] >> 8);
    sprite->data[1]++;
    if (sprite->data[1] > 1)
    {
        sprite->data[1] = 0;
        a = gPlttBufferFaded[sprite->data[2] + 1];
        i = 0;
        do
        {
            gPlttBufferFaded[sprite->data[2] + ++i] = gPlttBufferFaded[sprite->data[2] + i + 1];
        } while ( i <= 5 );

        gPlttBufferFaded[sprite->data[2] + 7] = a;
    }

    if (sprite->data[7] > 6 && sprite->data[0] >0 && ++sprite->data[6] > 1)
    {
        sprite->data[6] = 0;
        sprite->data[7] -= 1;
        REG_BLDALPHA = (sprite->data[7] << 8) | (16 - sprite->data[7]);;
    }

    if (sprite->data[0] >0)
    {
        sprite->data[0] -= 1;
    }
    else if (++sprite->data[6] > 1)
    {
        sprite->data[6] = 0;
        sprite->data[7]++;
        REG_BLDALPHA = (sprite->data[7] << 8) | (16 - sprite->data[7]);
        if (sprite->data[7] == 16)
        {
            sprite->invisible = 1;
            sprite->callback = sub_807861C;
        }
    }
}
