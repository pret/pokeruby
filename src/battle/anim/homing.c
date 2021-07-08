#include "global.h"
#include "rom_8077ABC.h"
#include "trig.h"
#include "battle_anim.h"
#include "sound.h"

extern s16 gBattleAnimArgs[];
extern u8 gBattleAnimAttacker;
extern u8 gBattleAnimTarget;

void sub_80CC6CC(struct Sprite* sprite);
static void sub_80CC7D4(struct Sprite* sprite);

// homing (the spinning effect of sprites going inward in a static rotation.)
// Used by Needle Arm.

const struct SpriteTemplate gBattleAnimSpriteTemplate_83D6994 =
{
    .tileTag = ANIM_TAG_GREEN_SPIKE,
    .paletteTag = ANIM_TAG_GREEN_SPIKE,
    .oam = &gOamData_837DF8C,
    .anims = gDummySpriteAnimTable,
    .images = NULL,
    .affineAnims = gDummySpriteAffineAnimTable,
    .callback = sub_80CC6CC,
};

void sub_80CC6CC(struct Sprite* sprite)
{
    u8 a;
    u8 b;
    u16 c;
    u16 x;
    u16 y;

    if (gBattleAnimArgs[4] == 0)
    {
        DestroyAnimSprite(sprite);
    }
    else
    {
        if (gBattleAnimArgs[0] == 0)
        {
            a = GetBattlerSpriteCoord(gBattleAnimAttacker, 2);
            b = GetBattlerSpriteCoord(gBattleAnimAttacker, 3);
        }
        else
        {
            a = GetBattlerSpriteCoord(gBattleAnimTarget, 2);
            b = GetBattlerSpriteCoord(gBattleAnimTarget, 3);
        }

        sprite->data[0] = gBattleAnimArgs[4];
        if (gBattleAnimArgs[1] == 0)
        {
            sprite->x = gBattleAnimArgs[2] + a;
            sprite->y = gBattleAnimArgs[3] + b;
            sprite->data[5] = a;
            sprite->data[6] = b;
        }
        else
        {
            sprite->x = a;
            sprite->y = b;
            sprite->data[5] = gBattleAnimArgs[2] + a;
            sprite->data[6] = gBattleAnimArgs[3] + b;
        }

        x = sprite->x;
        sprite->data[1] = x * 16;
        y = sprite->y;
        sprite->data[2] = y * 16;
        sprite->data[3] = (sprite->data[5] - sprite->x) * 16 / gBattleAnimArgs[4];
        sprite->data[4] = (sprite->data[6] - sprite->y) * 16 / gBattleAnimArgs[4];
        c = ArcTan2Neg(sprite->data[5] - x, sprite->data[6] - y);
        if (IsContest())
            c -= 0x8000;

        sub_8078FDC(sprite, 0, 0x100, 0x100, c);
        sprite->callback = sub_80CC7D4;
    }
}

static void sub_80CC7D4(struct Sprite* sprite)
{
    if (sprite->data[0])
    {
        sprite->data[1] += sprite->data[3];
        sprite->data[2] += sprite->data[4];
        sprite->x = sprite->data[1] >> 4 ;
        sprite->y = sprite->data[2] >> 4 ;
        sprite->data[0]--;
    }
    else
    {
        DestroySpriteAndMatrix(sprite);
    }
}
