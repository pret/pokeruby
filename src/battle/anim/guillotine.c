#include "global.h"
#include "rom_8077ABC.h"
#include "trig.h"
#include "battle_anim.h"
#include "sound.h"

extern s16 gBattleAnimArgs[];
extern u8 gAnimBankAttacker;
extern u8 gAnimBankTarget;

void sub_80D0228(struct Sprite* sprite);
static void sub_80D02D0(struct Sprite* sprite);
static void sub_80D0344(struct Sprite* sprite);
static void sub_80D03A8(struct Sprite* sprite);

// guillotine (does a reverse grip where the slices can reverse at a given period.)
// Used in Guillotine.

const union AnimCmd gSpriteAnim_83D76B4[] =
{
    ANIMCMD_FRAME(0, 2),
    ANIMCMD_FRAME(16, 2),
    ANIMCMD_FRAME(32, 1),
    ANIMCMD_END,
};

const union AnimCmd gSpriteAnim_83D76C4[] =
{
    ANIMCMD_FRAME(0, 2, .vFlip = TRUE, .hFlip = TRUE),
    ANIMCMD_FRAME(16, 2, .vFlip = TRUE, .hFlip = TRUE),
    ANIMCMD_FRAME(32, 1, .vFlip = TRUE, .hFlip = TRUE),
    ANIMCMD_END,
};

const union AnimCmd *const gSpriteAnimTable_83D76D4[] =
{
    gSpriteAnim_83D76B4,
    gSpriteAnim_83D76C4,
};

const struct SpriteTemplate gBattleAnimSpriteTemplate_83D76DC =
{
    .tileTag = 10138,
    .paletteTag = 10138,
    .oam = &gOamData_837E054,
    .anims = gSpriteAnimTable_83D76D4,
    .images = NULL,
    .affineAnims = gDummySpriteAffineAnimTable,
    .callback = sub_80D0228,
};

void sub_80D0228(struct Sprite* sprite)
{
    s16 r8 = 32;
    s16 r4 = -32;
    s16 r9 = 16;
    s16 r6 = -16;
    if (gBattleAnimArgs[0] != 0)
    {
        r8 = r4;
        r4 = 32;
        r9 = r6;
        r6 = 16;
        StartSpriteAnim(sprite, gBattleAnimArgs[0]);
    }

    sprite->pos1.x += r8;
    sprite->pos1.y += r4;
    sprite->data[0] = 6;
    sprite->data[1] = sprite->pos1.x;
    sprite->data[2] = GetBattlerSpriteCoord(gAnimBankTarget, 2) + r9;
    sprite->data[3] = sprite->pos1.y;
    sprite->data[4] = GetBattlerSpriteCoord(gAnimBankTarget, 3) + r6;
    InitAnimLinearTranslation(sprite);
    sprite->data[5] = gBattleAnimArgs[0];
    sprite->data[6] = sprite->data[0];
    sprite->callback = sub_80D02D0;
}

static void sub_80D02D0(struct Sprite* sprite)
{
    if (TranslateAnimLinear(sprite) && sprite->animEnded == 1)
    {
        SeekSpriteAnim(sprite, 0);
        sprite->animPaused = 1;
        sprite->pos1.x += sprite->pos2.x;
        sprite->pos1.y += sprite->pos2.y;
        sprite->pos2.x = 2;
        sprite->pos2.y = -2;
        sprite->data[0] = sprite->data[6];
        sprite->data[1] ^= 1;
        sprite->data[2] ^= 1;
        sprite->data[4] = 0;
        sprite->data[3] = 0;
        sprite->callback = sub_80D0344;
    }
}

static void sub_80D0344(struct Sprite* sprite)
{
    if (sprite->data[3])
    {
        sprite->pos2.x = -sprite->pos2.x;
        sprite->pos2.y = -sprite->pos2.y;
    }

    sprite->data[3] ^= 1;
    if (++sprite->data[4] == 0x33)
    {
        sprite->pos2.y = 0;
        sprite->pos2.x = 0;
        sprite->data[4] = 0;
        sprite->data[3] = 0;
        sprite->animPaused = 0;
        StartSpriteAnim(sprite, sprite->data[5] ^ 1);
        sprite->callback = sub_80D03A8;
    }
}

static void sub_80D03A8(struct Sprite* sprite)
{
    if (TranslateAnimLinear(sprite) != 0)
        DestroyAnimSprite(sprite);
}
