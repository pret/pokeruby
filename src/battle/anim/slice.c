#include "global.h"
#include "rom_8077ABC.h"
#include "trig.h"
#include "battle_anim.h"
#include "sound.h"

extern s16 gBattleAnimArgs[];
extern u8 gAnimBankAttacker;
extern u8 gAnimBankTarget;

void AnimCuttingSlice(struct Sprite* sprite);
void sub_80CC9BC(struct Sprite* sprite);
static void AnimSliceStep(struct Sprite* sprite);

const union AnimCmd gSpriteAnim_83D6B10[] =
{
    ANIMCMD_FRAME(0, 5),
    ANIMCMD_FRAME(16, 5),
    ANIMCMD_FRAME(32, 5),
    ANIMCMD_FRAME(48, 5),
    ANIMCMD_END,
};

const union AnimCmd *const gSpriteAnimTable_83D6B24[] =
{
    gSpriteAnim_83D6B10,
};

const struct SpriteTemplate gCuttingSliceSpriteTemplate =
{
    .tileTag = 10138,
    .paletteTag = 10138,
    .oam = &gOamData_837E054,
    .anims = gSpriteAnimTable_83D6B24,
    .images = NULL,
    .affineAnims = gDummySpriteAffineAnimTable,
    .callback = AnimCuttingSlice,
};

const struct SpriteTemplate gBattleAnimSpriteTemplate_83D6B40 =
{
    .tileTag = 10138,
    .paletteTag = 10138,
    .oam = &gOamData_837E054,
    .anims = gSpriteAnimTable_83D6B24,
    .images = NULL,
    .affineAnims = gDummySpriteAffineAnimTable,
    .callback = sub_80CC9BC,
};

// Moves the sprite in a diagonally slashing motion across the target mon.
// Used by moves such as MOVE_CUT and MOVE_AERIAL_ACE. 
// arg 0: initial x pixel offset
// arg 1: initial y pixel offset
// arg 2: slice direction; 0 = right-to-left, 1 = left-to-right
void AnimCuttingSlice(struct Sprite* sprite)
{
    sprite->pos1.x = GetBattlerSpriteCoord(gAnimBankTarget, 0);
    sprite->pos1.y = GetBattlerSpriteCoord(gAnimBankTarget, 1);
    if (GetBattlerSide(gAnimBankTarget) == 0)
        sprite->pos1.y += 8;

    sprite->callback = AnimSliceStep;
    if (gBattleAnimArgs[2] == 0)
    {
        sprite->pos1.x += gBattleAnimArgs[0];
    }
    else
    {
        sprite->pos1.x -= gBattleAnimArgs[0];
        sprite->hFlip = 1;
    }

    sprite->pos1.y += gBattleAnimArgs[1];
    sprite->data[1] -= 0x400;
    sprite->data[2] += 0x400;
    sprite->data[5] = gBattleAnimArgs[2];
    if (sprite->data[5] == 1)
        sprite->data[1] = -sprite->data[1];
}

void sub_80CC9BC(struct Sprite* sprite)
{
    u8 a;
    u8 b;
    switch (gBattleAnimArgs[3])
    {
    case 1:
        a = GetBattlerSpriteCoord(gAnimBankTarget ^ 2, 0);
        b = GetBattlerSpriteCoord(gAnimBankTarget ^ 2, 1);
        break;
    case 2:
        a = GetBattlerSpriteCoord(gAnimBankTarget, 0);
        b = GetBattlerSpriteCoord(gAnimBankTarget, 1);
        if (IsAnimBankSpriteVisible(gAnimBankTarget ^ 2))
        {
            a = (GetBattlerSpriteCoord(gAnimBankTarget ^ 2, 0) + a) / 2;
            b = (GetBattlerSpriteCoord(gAnimBankTarget ^ 2, 1) + b) / 2;
        }
        break;
    case 0:
    default:
        a = GetBattlerSpriteCoord(gAnimBankTarget, 0);
        b = GetBattlerSpriteCoord(gAnimBankTarget, 1);
        break;
    }

    sprite->pos1.x = a;
    sprite->pos1.y = b;
    if (GetBattlerSide(gAnimBankTarget) == 0)
        sprite->pos1.y += 8;

    sprite->callback = AnimSliceStep;
    if (gBattleAnimArgs[2] == 0)
    {
        sprite->pos1.x += gBattleAnimArgs[0];
    }
    else
    {
        sprite->pos1.x -= gBattleAnimArgs[0];
        sprite->hFlip = 1;
    }

    sprite->pos1.y += gBattleAnimArgs[1];
    sprite->data[1] -= 0x400;
    sprite->data[2] += 0x400;
    sprite->data[5] = gBattleAnimArgs[2];
    if (sprite->data[5] == 1)
        sprite->data[1] = -sprite->data[1];
}

static void AnimSliceStep(struct Sprite* sprite)
{
    sprite->data[3] += sprite->data[1];
    sprite->data[4] += sprite->data[2];
    if (sprite->data[5] == 0)
        sprite->data[1] += 0x18;
    else
        sprite->data[1] -= 0x18;

    sprite->data[2] -= 0x18;
    sprite->pos2.x = sprite->data[3] >> 8;
    sprite->pos2.y = sprite->data[4] >> 8;
    sprite->data[0]++;
    if (sprite->data[0] == 20)
    {
        StoreSpriteCallbackInData(sprite, DestroyAnimSprite);
        sprite->data[0] = 3;
        sprite->callback = WaitAnimForDuration;
    }
}
