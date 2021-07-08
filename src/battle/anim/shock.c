#include "global.h"
#include "battle_anim.h"
#include "rom_8077ABC.h"
#include "trig.h"

extern s16 gBattleAnimArgs[8];
extern u8 gBattleAnimAttacker;
extern u8 gBattleAnimTarget;
extern struct OamMatrix gOamMatrices[];

void sub_80D6294(struct Sprite *sprite);
void sub_80D6328(struct Sprite *sprite);
extern void sub_80DA48C(struct Sprite *);

// shock (moves the little electricity lines)
// Used in Shock.

const union AnimCmd gSpriteAnim_83D9824[] =
{
    ANIMCMD_FRAME(0, 5),
    ANIMCMD_FRAME(16, 5),
    ANIMCMD_FRAME(32, 5),
    ANIMCMD_FRAME(48, 5),
    ANIMCMD_FRAME(64, 5),
    ANIMCMD_FRAME(80, 5),
    ANIMCMD_JUMP(0),
};

const union AnimCmd *const gSpriteAnimTable_83D9840[] =
{
    gSpriteAnim_83D9824,
};

const struct SpriteTemplate gSpriteTemplate_83D9844 =
{
    .tileTag = ANIM_TAG_SHOCK,
    .paletteTag = ANIM_TAG_SHOCK,
    .oam = &gOamData_837DF34,
    .anims = gSpriteAnimTable_83D9840,
    .images = NULL,
    .affineAnims = gDummySpriteAffineAnimTable,
    .callback = sub_80D6294,
};

const struct SpriteTemplate gBattleAnimSpriteTemplate_83D985C =
{
    .tileTag = ANIM_TAG_SPARK_2,
    .paletteTag = ANIM_TAG_SPARK_2,
    .oam = &gOamData_837DF8C,
    .anims = gDummySpriteAnimTable,
    .images = NULL,
    .affineAnims = gDummySpriteAffineAnimTable,
    .callback = sub_80D6328,
};

const struct SpriteTemplate gBattleAnimSpriteTemplate_83D9874 =
{
    .tileTag = ANIM_TAG_BLACK_BALL_2,
    .paletteTag = ANIM_TAG_BLACK_BALL_2,
    .oam = &gOamData_837DF2C,
    .anims = gDummySpriteAnimTable,
    .images = NULL,
    .affineAnims = gDummySpriteAffineAnimTable,
    .callback = TranslateAnimSpriteToTargetMonLocation,
};

void sub_80D6294(struct Sprite *sprite)
{
    sprite->x = GetBattlerSpriteCoord(gBattleAnimTarget, 2);
    sprite->y = GetBattlerSpriteCoord(gBattleAnimTarget, 3);

    if (GetBattlerSide(gBattleAnimAttacker) != 0)
    {
        sprite->x -= gBattleAnimArgs[0];
        sprite->y -= gBattleAnimArgs[1];
    }
    else
    {
        sprite->x += gBattleAnimArgs[0];
        sprite->y += gBattleAnimArgs[1];
    }

    sprite->data[0] = 0;
    sprite->data[1] = gBattleAnimArgs[2];
    sprite->data[2] = gBattleAnimArgs[3];
    sprite->data[3] = gBattleAnimArgs[4];

    StoreSpriteCallbackInData(sprite, DestroySpriteAndMatrix);
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
        slot = gBattleAnimAttacker;
        break;
    case 1:
    default:
        slot = gBattleAnimTarget;
        break;
    case 2:
        if (!IsAnimBankSpriteVisible(gBattleAnimAttacker ^ 2))
        {
            slot = gBattleAnimAttacker;
        }
        else
        {
            slot = gBattleAnimAttacker ^ 2;
        }
        break;
    case 3:
        if (IsAnimBankSpriteVisible(gBattleAnimAttacker ^ 2))
        {
            slot = gBattleAnimTarget ^ 2;
        }
        else
        {
            slot = gBattleAnimTarget;
        }
        break;
    }

    if (gBattleAnimArgs[5] == 0)
    {
        sprite->x = GetBattlerSpriteCoord(slot, 0);
        sprite->y = GetBattlerSpriteCoord(slot, 1);
    }
    else
    {
        sprite->x = GetBattlerSpriteCoord(slot, 2);
        sprite->y = GetBattlerSpriteCoord(slot, 3);
    }

    sprite->x2 = (gSineTable[gBattleAnimArgs[0]] * gBattleAnimArgs[1]) >> 8;
    sprite->y2 = (gSineTable[gBattleAnimArgs[0] + 64] * gBattleAnimArgs[1]) >> 8;

    if (gBattleAnimArgs[6] & 1)
    {
        sprite->oam.priority = GetBattlerSpriteBGPriority(slot) + 1;
    }

    matrixNum = sprite->oam.matrixNum;
    sineVal = gSineTable[gBattleAnimArgs[2]];

    gOamMatrices[matrixNum].a = gOamMatrices[matrixNum].d =  gSineTable[gBattleAnimArgs[2] + 64];
    gOamMatrices[matrixNum].b =  sineVal;
    gOamMatrices[matrixNum].c = -sineVal;

    sprite->data[0] = gBattleAnimArgs[3];
    sprite->callback = sub_80DA48C;
}
