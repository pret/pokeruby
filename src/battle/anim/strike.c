#include "global.h"
#include "rom_8077ABC.h"
#include "trig.h"
#include "battle_anim.h"
#include "sound.h"

extern s16 gBattleAnimArgs[];
extern u8 gAnimBankAttacker;
extern u8 gAnimBankTarget;

void sub_80CE670(struct Sprite* sprite);
static void sub_80CE798(struct Sprite* sprite);

// strike (A red strike towards the opponent.)
// Used in Horn Attack, Fury Attack, and Horn Drill.

const union AnimCmd gSpriteAnim_83D7010[] =
{
    ANIMCMD_FRAME(0, 2),
    ANIMCMD_FRAME(16, 2),
    ANIMCMD_FRAME(32, 2),
    ANIMCMD_FRAME(48, 3),
    ANIMCMD_FRAME(64, 5),
    ANIMCMD_FRAME(80, 3),
    ANIMCMD_FRAME(96, 2),
    ANIMCMD_FRAME(0, 2),
    ANIMCMD_END,
};

const union AnimCmd *const gSpriteAnimTable_83D7034[] =
{
    gSpriteAnim_83D7010,
};

const struct SpriteTemplate gBattleAnimSpriteTemplate_83D7038 =
{
    .tileTag = 10031,
    .paletteTag = 10031,
    .oam = &gOamData_837DF34,
    .anims = gSpriteAnimTable_83D7034,
    .images = NULL,
    .affineAnims = gDummySpriteAffineAnimTable,
    .callback = sub_80793C4,
};

const struct SpriteTemplate gBattleAnimSpriteTemplate_83D7050 =
{
    .tileTag = 10020,
    .paletteTag = 10020,
    .oam = &gOamData_837DF34,
    .anims = gDummySpriteAnimTable,
    .images = NULL,
    .affineAnims = gDummySpriteAffineAnimTable,
    .callback = sub_80CE670,
};

void sub_80CE670(struct Sprite* sprite)
{
    if (gBattleAnimArgs[2] <= 1)
        gBattleAnimArgs[2] = 2;

    if (gBattleAnimArgs[2] > 0x7F)
        gBattleAnimArgs[2] = 0x7F;

    sprite->data[0] = 0;
    sprite->data[1] = gBattleAnimArgs[2];
    sprite->pos1.x = GetBattlerSpriteCoord(gAnimBankTarget, 2) + gBattleAnimArgs[0];
    sprite->pos1.y = GetBattlerSpriteCoord(gAnimBankTarget, 3) + gBattleAnimArgs[1];
    sprite->data[6] = sprite->pos1.x;
    sprite->data[7] = sprite->pos1.y;
    if (IsContest() != 0)
    {
        sprite->oam.matrixNum = 8;
        sprite->pos1.x += 40;
        sprite->pos1.y += 20;
        sprite->data[2] = sprite->pos1.x << 7;
        sprite->data[3] = -0x1400 / sprite->data[1];
        sprite->data[4] = sprite->pos1.y << 7;
        sprite->data[5] = -0xA00 / sprite->data[1];
    }
    else if (GetBattlerSide(gAnimBankAttacker) == 0)
    {
        sprite->pos1.x -= 40;
        sprite->pos1.y += 20;
        sprite->data[2] = sprite->pos1.x << 7;
        sprite->data[3] = 0x1400 / sprite->data[1];
        sprite->data[4] = sprite->pos1.y << 7;
        sprite->data[5] = -0xA00 / sprite->data[1];
    }
    else
    {
        sprite->pos1.x += 40;
        sprite->pos1.y -= 20;
        sprite->data[2] = sprite->pos1.x << 7;
        sprite->data[3] = -0x1400 / sprite->data[1];
        sprite->data[4] = sprite->pos1.y << 7;
        sprite->data[5] = 0xA00 / sprite->data[1];
        sprite->oam.matrixNum = 24;
    }

    sprite->callback = sub_80CE798;
}

static void sub_80CE798(struct Sprite* sprite)
{
    sprite->data[2] += sprite->data[3];
    sprite->data[4] += sprite->data[5];
    sprite->pos1.x = sprite->data[2] >> 7;
    sprite->pos1.y = sprite->data[4] >> 7;
    if (--sprite->data[1] == 1)
    {
        sprite->pos1.x = sprite->data[6];
        sprite->pos1.y = sprite->data[7];
    }

    if (sprite->data[1] == 0)
        DestroyAnimSprite(sprite);
}
