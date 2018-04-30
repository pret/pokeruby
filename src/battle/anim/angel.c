#include "global.h"
#include "rom_8077ABC.h"
#include "trig.h"
#include "battle_anim.h"
#include "sound.h"

extern s16 gBattleAnimArgs[];
extern u8 gAnimBankAttacker;
extern u8 gAnimBankTarget;

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
    .tileTag = 10220,
    .paletteTag = 10220,
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
        sprite->pos1.x += gBattleAnimArgs[0];
        sprite->pos1.y += gBattleAnimArgs[1];
    }

    sprite->data[0]++;
    r5 = (sprite->data[0] * 10) & 0xFF;
    sprite->pos2.x = Sin(r5, 0x50) >> 8;
    if (sprite->data[0] <= 0x4F)
        sprite->pos2.y = (sprite->data[0] / 2) + (Cos(r5, 0x50) >> 8);

    if (sprite->data[0] > 0x5A)
    {
        sprite->data[2]++;
        sprite->pos2.x -= sprite->data[2] / 2;
    }

    if (sprite->data[0] > 0x64)
        DestroyAnimSprite(sprite);
}
