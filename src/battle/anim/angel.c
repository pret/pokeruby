#include "global.h"
#include "rom_8077ABC.h"
#include "trig.h"
#include "battle_anim.h"
#include "sound.h"

extern s16 gBattleAnimArgs[];
extern u8 gBattleAnimAttacker;
extern u8 gBattleAnimTarget;

void sub_80D2938(struct Sprite* sprite);

// angel (a little angel descends from somewhere towards a position)
// Used in Sweet Kiss.

const union AnimCmd gSpriteAnim_83D7BAC[] =
{
    ANIMCMD_FRAME(0, 24),
    ANIMCMD_END,
};

const union AnimCmd *const gSpriteAnimTable_83D7BB4[] =
{
    gSpriteAnim_83D7BAC,
};

const struct SpriteTemplate gBattleAnimSpriteTemplate_83D7BB8 =
{
    .tileTag = ANIM_TAG_ANGEL,
    .paletteTag = ANIM_TAG_ANGEL,
    .oam = &gOamData_837DF34,
    .anims = gSpriteAnimTable_83D7BB4,
    .images = NULL,
    .affineAnims = gDummySpriteAffineAnimTable,
    .callback = sub_80D2938,
};

void sub_80D2938(struct Sprite* sprite)
{
    s16 r5;
    if (sprite->data[0] == 0)
    {
        sprite->x += gBattleAnimArgs[0];
        sprite->y += gBattleAnimArgs[1];
    }

    sprite->data[0]++;
    r5 = (sprite->data[0] * 10) & 0xFF;
    sprite->x2 = Sin(r5, 0x50) >> 8;
    if (sprite->data[0] <= 0x4F)
        sprite->y2 = (sprite->data[0] / 2) + (Cos(r5, 0x50) >> 8);

    if (sprite->data[0] > 0x5A)
    {
        sprite->data[2]++;
        sprite->x2 -= sprite->data[2] / 2;
    }

    if (sprite->data[0] > 0x64)
        DestroyAnimSprite(sprite);
}
