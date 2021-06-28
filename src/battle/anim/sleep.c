#include "global.h"
#include "rom_8077ABC.h"
#include "trig.h"
#include "battle_anim.h"
#include "sound.h"

extern s16 gBattleAnimArgs[];
extern u8 gBattleAnimAttacker;
extern u8 gBattleAnimTarget;

void sub_80CD328(struct Sprite* sprite);
static void sub_80CD394(struct Sprite* sprite);

// sleep (the "ZZZ" graphical effect)
// Used by Rest and the sleep turn when the Pokemon is still asleep.

const union AnimCmd gSpriteAnim_83D6D20[] =
{
    ANIMCMD_FRAME(0, 40),
    ANIMCMD_END,
};

const union AnimCmd *const gSpriteAnimTable_83D6D28[] =
{
    gSpriteAnim_83D6D20,
};

const union AffineAnimCmd gSpriteAffineAnim_83D6D2C[] =
{
    AFFINEANIMCMD_FRAME(0x14, 0x14, -30, 0),
    AFFINEANIMCMD_FRAME(0x8, 0x8, 1, 24),
    AFFINEANIMCMD_END,
};

const union AffineAnimCmd gSpriteAffineAnim_83D6D44[] =
{
    AFFINEANIMCMD_LOOP(0),
    AFFINEANIMCMD_FRAME(0x0, 0x0, 1, 24),
    AFFINEANIMCMD_LOOP(10),
};

const union AffineAnimCmd gSpriteAffineAnim_83D6D5C[] =
{
    AFFINEANIMCMD_FRAME(0x14, 0x14, 30, 0),
    AFFINEANIMCMD_FRAME(0x8, 0x8, -1, 24),
    AFFINEANIMCMD_END,
};

const union AffineAnimCmd gSpriteAffineAnim_83D6D74[] =
{
    AFFINEANIMCMD_LOOP(0),
    AFFINEANIMCMD_FRAME(0x0, 0x0, -1, 24),
    AFFINEANIMCMD_LOOP(10),
};

const union AffineAnimCmd *const gSpriteAffineAnimTable_83D6D8C[] =
{
    gSpriteAffineAnim_83D6D2C,
    gSpriteAffineAnim_83D6D5C,
};

const struct SpriteTemplate gBattleAnimSpriteTemplate_83D6D94 =
{
    .tileTag = ANIM_TAG_LETTER_Z,
    .paletteTag = ANIM_TAG_LETTER_Z,
    .oam = &gOamData_837DF94,
    .anims = gSpriteAnimTable_83D6D28,
    .images = NULL,
    .affineAnims = gSpriteAffineAnimTable_83D6D8C,
    .callback = sub_80CD328,
};

void sub_80CD328(struct Sprite* sprite)
{
    sub_8078650(sprite);
    if (GetBattlerSide(gBattleAnimAttacker) == 0)
    {
        sprite->x += gBattleAnimArgs[0];
        sprite->y += gBattleAnimArgs[1];
        sprite->data[3] = 1;
    }
    else
    {
        sprite->x -= gBattleAnimArgs[0];
        sprite->y += gBattleAnimArgs[1];
        sprite->data[3] = 0xFFFF;
        StartSpriteAffineAnim(sprite, 1);
    }

    sprite->callback = sub_80CD394;
}

static void sub_80CD394(struct Sprite* sprite)
{
    sprite->y2 = -(sprite->data[0] / 0x28);
    sprite->x2 = sprite->data[4] / 10;
    sprite->data[4] += sprite->data[3] * 2;
    sprite->data[0] += sprite->data[1];
    if (++sprite->data[1] > 0x3C)
        DestroySpriteAndMatrix(sprite);
}
