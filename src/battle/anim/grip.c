#include "global.h"
#include "rom_8077ABC.h"
#include "trig.h"
#include "battle_anim.h"
#include "sound.h"

extern s16 gBattleAnimArgs[];
extern u8 gAnimBankAttacker;
extern u8 gAnimBankTarget;

void sub_80D0178(struct Sprite* sprite);
static void sub_80D020C(struct Sprite* sprite);

// grip (does a slash which is capable of mirroring for the effect of "gripping".)
// Used in Vice Grip.

const union AnimCmd gSpriteAnim_83D7674[] =
{
    ANIMCMD_FRAME(0, 3),
    ANIMCMD_FRAME(16, 3),
    ANIMCMD_FRAME(32, 20),
    ANIMCMD_END,
};

const union AnimCmd gSpriteAnim_83D7684[] =
{
    ANIMCMD_FRAME(0, 3, .vFlip = TRUE, .hFlip = TRUE),
    ANIMCMD_FRAME(16, 3, .vFlip = TRUE, .hFlip = TRUE),
    ANIMCMD_FRAME(32, 20, .vFlip = TRUE, .hFlip = TRUE),
    ANIMCMD_END,
};

const union AnimCmd *const gSpriteAnimTable_83D7694[] =
{
    gSpriteAnim_83D7674,
    gSpriteAnim_83D7684,
};

const struct SpriteTemplate gBattleAnimSpriteTemplate_83D769C =
{
    .tileTag = 10138,
    .paletteTag = 10138,
    .oam = &gOamData_837E054,
    .anims = gSpriteAnimTable_83D7694,
    .images = NULL,
    .affineAnims = gDummySpriteAffineAnimTable,
    .callback = sub_80D0178,
};

void sub_80D0178(struct Sprite* sprite)
{
    s16 r7 = 32;
    s16 r4 = -32;
    s16 r8 = 16;
    s16 r6 = -16;
    if (gBattleAnimArgs[0] != 0)
    {
        r7 = r4;
        r4 = 32;
        r8 = r6;
        r6 = 16;
        StartSpriteAnim(sprite, 1);
    }

    sprite->pos1.x += r7;
    sprite->pos1.y += r4;
    sprite->data[0] = 6;
    sprite->data[2] = GetBattlerSpriteCoord(gAnimBankTarget, 2) + r8;
    sprite->data[4] = GetBattlerSpriteCoord(gAnimBankTarget, 3) + r6;
    sprite->callback = StartAnimLinearTranslation;
    StoreSpriteCallbackInData(sprite, sub_80D020C);
}

static void sub_80D020C(struct Sprite* sprite)
{
    if (sprite->animEnded == 1)
        DestroyAnimSprite(sprite);
}
